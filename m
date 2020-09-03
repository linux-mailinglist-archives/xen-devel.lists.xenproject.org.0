Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9BC25C21F
	for <lists+xen-devel@lfdr.de>; Thu,  3 Sep 2020 16:03:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDpp2-0007ZK-5p; Thu, 03 Sep 2020 14:02:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kD+y=CM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kDpp0-0007ZF-GX
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2020 14:02:38 +0000
X-Inumbo-ID: b00c1511-1452-43fa-a809-f050b27fcce9
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b00c1511-1452-43fa-a809-f050b27fcce9;
 Thu, 03 Sep 2020 14:02:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 86E6BAB7D;
 Thu,  3 Sep 2020 14:02:37 +0000 (UTC)
Subject: Re: [xen-unstable test] 153602: regressions - FAIL
To: Costin Lupu <costin.lupu@cs.pub.ro>
References: <osstest-153602-mainreport@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1bdbf90f-2150-cb86-63a2-37e5148ec34e@suse.com>
Date: Thu, 3 Sep 2020 16:02:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <osstest-153602-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03.09.2020 12:24, osstest service owner wrote:
> flight 153602 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/153602/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 10 debian-hvm-install fail REGR. vs. 152877
>  test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 10 debian-hvm-install fail REGR. vs. 152877

While at least the hypervisor logs don't provide clear indication
(and I don't know where else to look among the files osstest
provides) I can't help thinking that stubdom apparently
crashing is still fallout from the mini-os changes (and no-one
really looks to care). In particular I think that this

@@ -374,6 +376,10 @@ out:
        }
     if (ip)
         *ip = strdup(ldev->ip);
+    if (mask)
+        *mask = strdup(ldev->mask);
+    if (gw)
+        *gw = strdup(ldev->gw);

was insufficient, as it doesn't guard against ldev->mask and/or
ldev->gw being NULL, despite that being the result (afaict) when
only an IP address is found in the parsed string. Please can you
urgently look into the failures, even if it isn't 100% certain
that your change is the culprit?

Jan

