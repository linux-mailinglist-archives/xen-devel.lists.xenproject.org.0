Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 015279AC9DD
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 14:18:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824570.1238711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3aIl-0005Qc-8s; Wed, 23 Oct 2024 12:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824570.1238711; Wed, 23 Oct 2024 12:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3aIl-0005Ob-6B; Wed, 23 Oct 2024 12:17:23 +0000
Received: by outflank-mailman (input) for mailman id 824570;
 Wed, 23 Oct 2024 12:17:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fY0y=RT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t3aIk-0005OV-AF
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 12:17:22 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf78ece2-9138-11ef-a0be-8be0dac302b0;
 Wed, 23 Oct 2024 14:17:20 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729685833812767.7603354852624;
 Wed, 23 Oct 2024 05:17:13 -0700 (PDT)
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
X-Inumbo-ID: bf78ece2-9138-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729685836; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UdljNj+7Y/qbVoM/qSko+osKK/+7RkzDet813pKjw3VJ+lBFFwBmKAMryJmBC2nGDn7VkIoSjQGD288GcbGNIeBGPSlRJ/OcnsLPBMtYtZNiLvYGF8QfEi6p28gJ7B0eRxFOpOouAWyCVxY/t53pPaKHsMLSiOKIlG2peCs/Fhs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729685836; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mtKcHRm9zMX9jcImlJ/4YOoL214/MVZzhYhb6tm+M1w=; 
	b=ZfErIBh91ltkuUXvbmUsPfECzXNqk60lkcq0laxVvC9w7mmLLbWpOoX+OWnWuSwY9N/0ZHoZ5qzjwWJLNEo/ktDte7vEk2tEiOkPL3cROVwbCDkHpALJojliDilrTa8Ty9KhHrPyEka5vgA645nx5OzOx+86oHD+2O84N14Fku8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729685836;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=mtKcHRm9zMX9jcImlJ/4YOoL214/MVZzhYhb6tm+M1w=;
	b=WZ3tFQ7tQsYJoD8YKrYxLqnWu3bqwm1MtzU8mIMW4E2sqEii6fEcAwuPy6Ar431v
	I0orgktRDEgl+Fy05kfSYUdQd4oY7CEdAYIifQH5x8KzChWHSGT+AFacdsZz+3a167N
	98oJBnhLC7kMfNj/mSVJEM/6pFDnJx0pPlP8SDcY=
Message-ID: <20a904a2-3d33-441f-ad15-2111ec0c8064@apertussolutions.com>
Date: Wed, 23 Oct 2024 08:17:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/boot: Fix microcode module handling during PVH
 boot
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241023105756.641695-1-andrew.cooper3@citrix.com>
 <20241023105756.641695-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241023105756.641695-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/23/24 06:57, Andrew Cooper wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> 
> As detailed in commit 0fe607b2a144 ("x86/boot: Fix PVH boot during boot_info
> transition period"), the use of __va(mbi->mods_addr) constitutes a
> use-after-free on the PVH boot path.
> 
> This pattern has been in use since before PVH support was added.  Inside a PVH
> VM, it will go unnoticed as long as the microcode container parser doesn't
> choke on the random data it finds.
> 
> The use within early_microcode_init() happens to be safe because it's prior to
> move_xen().  microcode_init_cache() is after move_xen(), and therefore unsafe.
> 
> Plumb the boot_info pointer down, replacing module_map and mbi.  Importantly,
> bi->mods[].mod is a safe way to access the module list during PVH boot.
> 
> Note: microcode_scan_module() is still bogusly stashing a bootstrap_map()'d
>        pointer in ucode_blob.data, which constitutes a different
>        use-after-free, and only works in general because of a second bug.  This
>        is unrelated to PVH, and needs untangling differently.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

