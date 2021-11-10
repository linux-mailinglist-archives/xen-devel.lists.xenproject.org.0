Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8141144C22E
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 14:36:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224300.387534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mknly-00052Z-6L; Wed, 10 Nov 2021 13:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224300.387534; Wed, 10 Nov 2021 13:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mknly-00050T-3B; Wed, 10 Nov 2021 13:36:18 +0000
Received: by outflank-mailman (input) for mailman id 224300;
 Wed, 10 Nov 2021 13:36:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mknlw-00050M-Dq
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 13:36:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mknlt-0002i6-2P; Wed, 10 Nov 2021 13:36:13 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.19.173]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mknls-0007EF-SB; Wed, 10 Nov 2021 13:36:13 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=2HeERBqFGcE4/ONKmD9LNZi0lWIeIzEOqoGVgt5VdOE=; b=iSm8ZZirp9dxbI15HpnKpsJdlg
	1RyQeeaH/SS/0sbWXeD+m2Ur3CL6r4sCQ3OihnNymkbVBbRsUAKLyso68cvIQnX/FOiCsil1cx7Xi
	r3gHtRfRaLFYddrA0VBsYpOfBH+o40a0x5NGipVSO/EkON721DCAs342HEAbnFOxdhFY=;
Message-ID: <010fa02f-e561-e7a8-9638-5246db9166b4@xen.org>
Date: Wed, 10 Nov 2021 13:36:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH-4.16 v2] xen/efi: Fix Grub2 boot on arm64
To: Luca Fancellu <luca.fancellu@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Ian Jackson <iwj@xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20211104141206.25153-1-luca.fancellu@arm.com>
 <81685961-501e-7a41-6f6f-bc4491645264@suse.com>
 <alpine.DEB.2.22.394.2111041351490.284830@ubuntu-linux-20-04-desktop>
 <97C884F7-0577-4996-AB79-0A07A8D48FD8@arm.com>
 <alpine.DEB.2.22.394.2111041431070.284830@ubuntu-linux-20-04-desktop>
 <9E52FA33-422B-4B1C-A6AF-601CDF565700@arm.com>
 <alpine.DEB.2.22.394.2111041449180.284830@ubuntu-linux-20-04-desktop>
 <e4b2e1be-0e41-0e6e-5ea8-3c12b4593724@suse.com>
 <alpine.DEB.2.22.394.2111050825240.284830@ubuntu-linux-20-04-desktop>
 <9bd58aa4-602b-4c64-e759-581513909457@suse.com>
 <alpine.DEB.2.22.394.2111081805530.3317@ubuntu-linux-20-04-desktop>
 <191dd1b2-8e2a-ee91-f401-dda4fabf4c7c@suse.com>
 <alpine.DEB.2.22.394.2111091350510.440530@ubuntu-linux-20-04-desktop>
 <3B8E0C6E-0522-4F73-B6C2-827FA45C87BA@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3B8E0C6E-0522-4F73-B6C2-827FA45C87BA@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

On 10/11/2021 13:05, Luca Fancellu wrote:
> I thought having the EFI_FILE_HANDLE global in efi-boot.h was a “no go”, but if it’s not then instead of
> calling get_parent_handle in efi_check_dt_boot (that is the main issue with EDK2+Grub2), we can do
> something like this:

fs_dir_handle is only used by callees of efi_check_boot_dt_boot(). So 
the global variable is not an option for me because the risk is not 
worth it (it is easy to misuse a global variable).

Instead, I think fs_dir_handle should be an argument of 
allocate_module_file() and propagated up to the first call in 
efi_check_dt_boot().

Cheers,

-- 
Julien Grall

