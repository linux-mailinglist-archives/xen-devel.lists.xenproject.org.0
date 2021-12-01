Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 836FE464E27
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 13:44:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236020.409382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msOy8-0002pj-Ci; Wed, 01 Dec 2021 12:44:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236020.409382; Wed, 01 Dec 2021 12:44:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msOy8-0002mw-9Z; Wed, 01 Dec 2021 12:44:16 +0000
Received: by outflank-mailman (input) for mailman id 236020;
 Wed, 01 Dec 2021 12:44:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fqf2=QS=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1msOy7-0002mq-Hx
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 12:44:15 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62942c44-52a4-11ec-b945-1df2895da90e;
 Wed, 01 Dec 2021 13:44:13 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:40180)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1msOy2-0011sW-oh (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 01 Dec 2021 12:44:10 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id E949D1FDDA;
 Wed,  1 Dec 2021 12:44:09 +0000 (GMT)
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
X-Inumbo-ID: 62942c44-52a4-11ec-b945-1df2895da90e
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <420124f7-634d-8d9d-9cbe-34ed6a66d80f@srcf.net>
Date: Wed, 1 Dec 2021 12:44:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <21148e89-4750-3112-1096-36119be96c7e@suse.com>
 <09aaf19a-b03e-7f41-208e-bfc6bb968049@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 3/4] x86/altp2m: p2m_altp2m_get_or_propagate() should
 honor present page order
In-Reply-To: <09aaf19a-b03e-7f41-208e-bfc6bb968049@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/12/2021 10:54, Jan Beulich wrote:
> @@ -2237,11 +2243,11 @@ bool p2m_altp2m_get_or_propagate(struct
>       * to the start of the superpage.  NB that we repupose `amfn`
>       * here.
>       */
> -    mask = ~((1UL << page_order) - 1);
> +    mask = ~((1UL << cur_order) - 1);
>      amfn = _mfn(mfn_x(*mfn) & mask);
>      gfn = _gfn(gfn_l & mask);
>  
> -    rc = p2m_set_entry(ap2m, gfn, amfn, page_order, *p2mt, *p2ma);
> +    rc = p2m_set_entry(ap2m, gfn, amfn, cur_order, *p2mt, *p2ma);
>      p2m_unlock(ap2m);

While I agree with the problem you've identified, this function has some
very broken return semantics.

Logically, it is taking some hostp2m properties for gfn, and replacing
them with ap2m properties for the same gfn.


It cannot be correct to only update the caller state on the error
paths.  At a minimum, the

    if ( paged )
        p2m_mem_paging_populate(currd, _gfn(gfn));

path in the success case is wrong when we've adjusted gfn down.

~Andrew

