Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5A719F535
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 13:54:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLQJY-0005od-BI; Mon, 06 Apr 2020 11:53:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8YOW=5W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jLQJX-0005oY-8z
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 11:53:15 +0000
X-Inumbo-ID: 32228b64-77fd-11ea-83d8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32228b64-77fd-11ea-83d8-bc764e2007e4;
 Mon, 06 Apr 2020 11:53:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D853BAEA8;
 Mon,  6 Apr 2020 11:53:12 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen: credit2: fix credit reset
 happening too few times
To: Dario Faggioli <dfaggioli@suse.com>
References: <158457508246.11355.6457403441669388939.stgit@Palanthas>
 <158457672023.11355.16720240521867328301.stgit@Palanthas>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f7ac7ae4-b31b-0e65-6a44-82e4aa7848d6@suse.com>
Date: Mon, 6 Apr 2020 13:53:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <158457672023.11355.16720240521867328301.stgit@Palanthas>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Charles Arnold <carnold@suse.com>,
 Glen <glenbarney@gmail.com>, George Dunlap <george.dunlap@citrix.com>,
 Tomas Mozes <hydrapolic@gmail.com>, Sarah Newman <srn@prgmr.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19.03.2020 01:12, Dario Faggioli wrote:
> @@ -3328,12 +3325,9 @@ runq_candidate(struct csched2_runqueue_data *rqd,
>                          (unsigned char *)&d);
>          }
>  
> -        /* Only consider units that are allowed to run on this processor. */
> +        /* Only consider vcpus that are allowed to run on this processor. */
>          if ( !cpumask_test_cpu(cpu, svc->unit->cpu_hard_affinity) )

While backporting this to 4.12 I noticed that this is a presumably
unintended comment adjustment.

Jan

