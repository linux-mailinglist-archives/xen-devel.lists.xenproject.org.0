Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B43126044E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 20:11:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFLbj-0005cz-W4; Mon, 07 Sep 2020 18:11:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Tp4=CQ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kFLbi-0005cu-1w
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 18:11:10 +0000
X-Inumbo-ID: 7754ba3f-4b00-422a-b3b1-998c57fa3b4e
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7754ba3f-4b00-422a-b3b1-998c57fa3b4e;
 Mon, 07 Sep 2020 18:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject;
 bh=D6Io+FnlSB2TGsdpZSVt0EIpE7gWoR05y5lrzY7rPOg=; b=pHX052Z8YNZZ5ny6T9cXz7juyj
 udx6Jj0kd8BPC+DiPKVsk90hEUYTSgYchCy8W2stGNb/zmwlHqortNwDZHabfEapWLheQvA9+y7TI
 OR1a0p5MurvpILYVA0A07rKf7VhlWm/9XVeFGJA6KyT3B0rawYzfTA3FXrUvkPfKkFso=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kFLbg-00077B-IU; Mon, 07 Sep 2020 18:11:08 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kFLbg-0007oM-CJ; Mon, 07 Sep 2020 18:11:08 +0000
Subject: Re: [PATCH v3 0/4] efi: Unified Xen hypervisor/kernel/initrd images
To: Trammell Hudson <hudson@trmm.net>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <b8BKlNQRW9YVOeX7T7TU64N8ek2l9Klzq0TVfkmLC3vzz4K2Gx6KHSLKjEHIlk5wjT0S0k-uieet1mvDEgHwSpKzg1LIiEL_eZPfpKDhpfo=@trmm.net>
From: Julien Grall <julien@xen.org>
Message-ID: <77b23ff2-b204-08d3-aeb6-b9049861a9f2@xen.org>
Date: Mon, 7 Sep 2020 19:11:07 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <b8BKlNQRW9YVOeX7T7TU64N8ek2l9Klzq0TVfkmLC3vzz4K2Gx6KHSLKjEHIlk5wjT0S0k-uieet1mvDEgHwSpKzg1LIiEL_eZPfpKDhpfo=@trmm.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

Hi,

On 07/09/2020 18:45, Trammell Hudson wrote:
> This patch series adds support for bundling the xen.efi hypervisor,
> the xen.cfg configuration file, the Linux kernel and initrd, as well
> as the XSM, and architectural specific files into a single "unified"
> EFI executable.  This allows an administrator to update the components
> independently without requiring rebuilding xen, as well as to replace
> the components in an existing image.
> 
> The resulting EFI executable can be invoked directly from the UEFI Boot
> Manager, removing the need to use a separate loader like grub as well
> as removing dependencies on local filesystem access.  And since it is
> a single file, it can be signed and validated by UEFI Secure Boot without
> requring the shim protocol.
> 
> It is inspired by systemd-boot's unified kernel technique and borrows the
> function to locate PE sections from systemd's LGPL'ed code.  During EFI
> boot, Xen looks at its own loaded image to locate the PE sections for
> the Xen configuration (`.config`), dom0 kernel (`.kernel`), dom0 initrd
> (`.initrd`), and XSM config (`.xsm`), which are included after building
> xen.efi using objcopy to add named sections for each input file.
> 
> Trammell hudson (4):
>    x86/xen.lds.S: Work around binutils build id alignment bug
>    efi/boot.c: add file.need_to_free and split display_file_info()
>    efi: Enable booting unified hypervisor/kernel/initrd images
>    efi: Do not use command line if secure boot is enabled.

Please make sure to have the patch sent with "In-reply-to" pointing to 
the cover letter.

git format-patch should do it for you.

Cheers,

> 
>   .gitignore                  |   1 +
>   docs/misc/efi.pandoc        |  47 ++++++++++++
>   xen/arch/arm/efi/efi-boot.h |  22 ++++--
>   xen/arch/x86/efi/Makefile   |   2 +-
>   xen/arch/x86/efi/efi-boot.h |   7 +-
>   xen/arch/x86/xen.lds.S      |   1 +
>   xen/common/efi/boot.c       | 139 ++++++++++++++++++++++++++---------
>   xen/common/efi/efi.h        |   3 +
>   xen/common/efi/pe.c         | 141 ++++++++++++++++++++++++++++++++++++
>   9 files changed, 317 insertions(+), 46 deletions(-)
>   create mode 100644 xen/common/efi/pe.c
> 
> --
> 2.25.1
> 
> 
> 
> 
> 
> 

-- 
Julien Grall

