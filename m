Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 594CC2B0394
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 12:12:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25684.53610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdAWF-0000Oo-AG; Thu, 12 Nov 2020 11:11:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25684.53610; Thu, 12 Nov 2020 11:11:59 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdAWF-0000OP-6X; Thu, 12 Nov 2020 11:11:59 +0000
Received: by outflank-mailman (input) for mailman id 25684;
 Thu, 12 Nov 2020 11:11:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kdAWD-0000OK-7c
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 11:11:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96784ba8-c6e5-4de1-b085-637cc44b1891;
 Thu, 12 Nov 2020 11:11:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3AF7AAB95;
 Thu, 12 Nov 2020 11:11:55 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kdAWD-0000OK-7c
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 11:11:57 +0000
X-Inumbo-ID: 96784ba8-c6e5-4de1-b085-637cc44b1891
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 96784ba8-c6e5-4de1-b085-637cc44b1891;
	Thu, 12 Nov 2020 11:11:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605179515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RVhyz9+tgsb1IKzvh1NSweZs4qIqQYJPqSFCQwY3nqA=;
	b=WmgFpNHOG11ilsGTXFE50a93DQ4Qvaij2VGFe3CjESUrc86m6NbaeoUUsDAJbxJ8G5H+g/
	uG5HMxvkgbpj1u+2dw6XKioAQUbvMBNDxgY1UFZKP5RJA8P47Y405woJvCcg/hqB5lroZx
	ZXOar975N0V23kfO1RZQOEbIWippdFA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 3AF7AAB95;
	Thu, 12 Nov 2020 11:11:55 +0000 (UTC)
Subject: Re: [PATCH V2 02/23] xen/ioreq: Make x86's IOREQ feature common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>, Tim Deegan
 <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-3-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5aa67969-0571-ee1b-bbe1-0b936a85acd2@suse.com>
Date: Thu, 12 Nov 2020 12:11:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <1602780274-29141-3-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.10.2020 18:44, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> As a lot of x86 code can be re-used on Arm later on, this patch
> moves previously prepared x86/hvm/ioreq.c to the common code.
> 
> The common IOREQ feature is supposed to be built with IOREQ_SERVER
> option enabled, which is selected for x86's config HVM for now.
> 
> In order to avoid having a gigantic patch here, the subsequent
> patches will update remaining bits in the common code step by step:
> - Make IOREQ related structs/materials common
> - Drop the "hvm" prefixes and infixes
> - Remove layering violation by moving corresponding fields
>   out of *arch.hvm* or abstracting away accesses to them
> 
> This support is going to be used on Arm to be able run device
> emulator outside of Xen hypervisor.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>
> 
> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
> 
> ***
> Please note, this patch depends on the following which is
> on review:
> https://patchwork.kernel.org/patch/11816689/
> ***
> 
> Changes RFC -> V1:
>    - was split into three patches:
>      - x86/ioreq: Prepare IOREQ feature for making it common
>      - xen/ioreq: Make x86's IOREQ feature common
>      - xen/ioreq: Make x86's hvm_ioreq_needs_completion() common
>    - update MAINTAINERS file
>    - do not use a separate subdir for the IOREQ stuff, move it to:
>      - xen/common/ioreq.c
>      - xen/include/xen/ioreq.h
>    - update x86's files to include xen/ioreq.h
>    - remove unneeded headers in arch/x86/hvm/ioreq.c
>    - re-order the headers alphabetically in common/ioreq.c
>    - update common/ioreq.c according to the newly introduced arch functions:
>      arch_hvm_destroy_ioreq_server()/arch_handle_hvm_io_completion()
> 
> Changes V1 -> V2:
>    - update patch description
>    - make everything needed in the previous patch to achieve
>      a truly rename here
>    - don't include unnecessary headers from asm-x86/hvm/ioreq.h
>      and xen/ioreq.h
>    - use __XEN_IOREQ_H__ instead of __IOREQ_H__
>    - move get_ioreq_server() to common/ioreq.c
> ---
>  MAINTAINERS                     |    8 +-
>  xen/arch/x86/Kconfig            |    1 +
>  xen/arch/x86/hvm/Makefile       |    1 -
>  xen/arch/x86/hvm/ioreq.c        | 1422 ---------------------------------------
>  xen/arch/x86/mm.c               |    2 +-
>  xen/arch/x86/mm/shadow/common.c |    2 +-
>  xen/common/Kconfig              |    3 +
>  xen/common/Makefile             |    1 +
>  xen/common/ioreq.c              | 1422 +++++++++++++++++++++++++++++++++++++++
>  xen/include/asm-x86/hvm/ioreq.h |   39 +-
>  xen/include/xen/ioreq.h         |   71 ++
>  11 files changed, 1509 insertions(+), 1463 deletions(-)
>  delete mode 100644 xen/arch/x86/hvm/ioreq.c
>  create mode 100644 xen/common/ioreq.c
>  create mode 100644 xen/include/xen/ioreq.h

Iirc I've previously asked to make sure the diff here gets created with
git's rename detection enabled, so we wouldn't see 1422 lines deleted
and 1422 lines added, _hoping_ they're all the same (or going through
the extra steps needed to compare old and new code), but instead seeing
just the diff between old and new files (which in the ideal case would
then be empty).

Jan

