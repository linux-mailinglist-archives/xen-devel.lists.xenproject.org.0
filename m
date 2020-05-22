Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6781DE4F8
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 13:00:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc5PZ-0007HN-NP; Fri, 22 May 2020 11:00:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hXvX=7E=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jc5PX-0007HI-TQ
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 11:00:19 +0000
X-Inumbo-ID: 6c67d9a4-9c1b-11ea-ae69-bc764e2007e4
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c67d9a4-9c1b-11ea-ae69-bc764e2007e4;
 Fri, 22 May 2020 11:00:19 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:39742
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jc5PS-000Dj6-LG (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Fri, 22 May 2020 12:00:14 +0100
Subject: Re: [PATCH v3 1/5] x86: suppress XPTI-related TLB flushes when
 possible
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3ce4ab2c-8cb6-1482-6ce9-3d5b019e10c1@suse.com>
 <ae47cb2c-2fff-cd08-0a26-683cef1f3303@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <17f1b674-92f9-6ee9-8e10-0fc30f055fe8@citrix.com>
Date: Fri, 22 May 2020 12:00:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <ae47cb2c-2fff-cd08-0a26-683cef1f3303@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25/09/2019 16:23, Jan Beulich wrote:
> When there's no XPTI-enabled PV domain at all, there's no need to issue
> respective TLB flushes. Hardwire opt_xpti_* to false when !PV, and
> record the creation of PV domains by bumping opt_xpti_* accordingly.
>
> As to the sticky opt_xpti_domu vs increment/decrement of opt_xpti_hwdom,
> this is done this way to avoid
> (a) widening the former variable,
> (b) any risk of a missed flush, which would result in an XSA if a DomU
>     was able to exercise it, and
> (c) any races updating the variable.
> Fundamentally the TLB flush done when context switching out the domain's
> vCPU-s the last time before destroying the domain ought to be
> sufficient, so in principle DomU handling could be made match hwdom's.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I am still concerned about the added complexity for no obvious use case.

Under what circumstances do we expect to XPTI-ness come and go on a
system, outside of custom dev-testing scenarios?

