Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBD957B793
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 15:34:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371781.603640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE9pj-0007qm-Ba; Wed, 20 Jul 2022 13:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371781.603640; Wed, 20 Jul 2022 13:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE9pj-0007oy-8u; Wed, 20 Jul 2022 13:33:47 +0000
Received: by outflank-mailman (input) for mailman id 371781;
 Wed, 20 Jul 2022 13:33:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mPGa=XZ=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1oE9ph-0007os-Pb
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 13:33:45 +0000
Received: from ppsw-33.srv.uis.cam.ac.uk (ppsw-33.srv.uis.cam.ac.uk
 [131.111.8.133]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9308976c-0830-11ed-924f-1f966e50362f;
 Wed, 20 Jul 2022 15:33:44 +0200 (CEST)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:60300)
 by ppsw-33.srv.uis.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1oE9pY-000iGp-Sg (Exim 4.96) (return-path <amc96@srcf.net>);
 Wed, 20 Jul 2022 14:33:36 +0100
Received: from [10.80.3.248] (default-46-102-197-194.interdsl.co.uk
 [46.102.197.194]) (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id A54F31FA31;
 Wed, 20 Jul 2022 14:33:36 +0100 (BST)
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
X-Inumbo-ID: 9308976c-0830-11ed-924f-1f966e50362f
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <8fa727c8-3ee8-44e5-74c3-2c9c585f12c0@srcf.net>
Date: Wed, 20 Jul 2022 14:33:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] x86: also suppress use of MMX insns
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 ChrisD <chris@dalessio.org>
References: <c35482f1-f1a2-5326-2ecb-9e97881fab01@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <c35482f1-f1a2-5326-2ecb-9e97881fab01@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/07/2022 14:30, Jan Beulich wrote:
> Passing -mno-sse alone is not enough: The compiler may still find
> (questionable) reasons to use MMX insns. In particular with gcc12 use
> of MOVD+PUNPCKLDQ+MOVQ was observed in an apparent attempt to auto-
> vectorize the storing of two adjacent zeroes, 32 bits each.
>
> Reported-by: ChrisD <chris@dalessio.org>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

But while we're at it, what else might we have to clobber to stop
nonsense like this?  x87 and avx come to mind.

