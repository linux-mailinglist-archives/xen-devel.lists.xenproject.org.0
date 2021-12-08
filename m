Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB79E46D576
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 15:17:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242279.419076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muxkX-000866-Ld; Wed, 08 Dec 2021 14:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242279.419076; Wed, 08 Dec 2021 14:16:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muxkX-00082t-IL; Wed, 08 Dec 2021 14:16:49 +0000
Received: by outflank-mailman (input) for mailman id 242279;
 Wed, 08 Dec 2021 14:16:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cpXy=QZ=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1muxkV-00082n-Dz
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 14:16:47 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 796ea2a0-5831-11ec-a831-37629979565c;
 Wed, 08 Dec 2021 15:16:46 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:41204)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1muxkT-000nZO-nO (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 08 Dec 2021 14:16:45 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id A88641FBFC;
 Wed,  8 Dec 2021 14:16:44 +0000 (GMT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 796ea2a0-5831-11ec-a831-37629979565c
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <1f06e98d-ab69-09b1-d460-f863827713ec@srcf.net>
Date: Wed, 8 Dec 2021 14:16:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <935688c8-c971-53c7-4c27-f34a841168ec@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] x86: avoid wrong use of all-but-self IPI shorthand
In-Reply-To: <935688c8-c971-53c7-4c27-f34a841168ec@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/12/2021 11:47, Jan Beulich wrote:
> With "nosmp" I did observe a flood of "APIC error on CPU0: 04(04), Send
> accept error" log messages on an AMD system. And rightly so - nothing
> excludes the use of the shorthand in send_IPI_mask() in this case. Set
> "unaccounted_cpus" to "true" also when command line restrictions are the
> cause.
>
> Note that PV-shim mode is unaffected by this change, first and foremost
> because "nosmp" and "maxcpus=" are ignored in this case.
>
> Fixes: 5500d265a2a8 ("x86/smp: use APIC ALLBUT destination shorthand when possible")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> While in "nosmp" mode it's probably benign that we switch to the bigsmp
> APIC driver simply because there are more than 8 physical CPUs, I
> suppose that's inefficient when "maxcpus=" with a value between 2 and 8
> (inclusive) is in use. Question is whether that's worthwhile to find a
> solution for.

Honestly, the concept of "nosmp" needs deleting.  We inherited it from
Linux and it wasn't terribly appropriate even back then.

Nowadays, even if we happen to boot with 1 cpu, there are normal things
we talk to (the IOMMUs most obviously) which are smp-like.


None of these command line restricted settings can be used in
production, because neither Intel nor AMD support, and both require us
to boot all logical processors.  Everything playing in this area is a
maintenance burden only.

~Andrew

