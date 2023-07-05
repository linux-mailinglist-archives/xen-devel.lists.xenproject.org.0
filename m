Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 407D27491F2
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 01:38:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559565.874647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHC4Q-0008PZ-H1; Wed, 05 Jul 2023 23:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559565.874647; Wed, 05 Jul 2023 23:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHC4Q-0008NE-EI; Wed, 05 Jul 2023 23:38:02 +0000
Received: by outflank-mailman (input) for mailman id 559565;
 Wed, 05 Jul 2023 23:38:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UsP3=CX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qHC4O-0008N6-PR
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 23:38:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f930aad2-1b8c-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 01:37:59 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 29935617C6;
 Wed,  5 Jul 2023 23:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57D1AC433C7;
 Wed,  5 Jul 2023 23:37:56 +0000 (UTC)
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
X-Inumbo-ID: f930aad2-1b8c-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688600277;
	bh=DyKLPNUAgJMFu6qoqSKWIs84x3QhKTRjUa+S683YyIs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SjJbAJNdByWwpNMWJqOsJZ6TH8GEUJCorFpGTPfDeYFVn/fdtDgyV7VmWB2q7BPzD
	 SU+fH8Y0ks2Ep6uBY/aZHQMprTdqzhQUHFhbhX2DVgzJvgzkp0dARJJjsCNjkabgYC
	 gqh8QhRpbVsJdi33tHwIgr9+r3lbMrn5ahYaJsMxCWtoHPVQZn4+ExjLCGwppok+6K
	 s1AWe6DzC7kylh9x8c3DcKHCPpxJQkwi1zfBFXDFAnF+dLzeuKMnABY4qXXoo8cgpl
	 wntewHnnjyuhokMUgMI930/qn2aXARiGgJBk52pMGdti44fU7mcka//wH5Q8vT8Sl1
	 RvdNWarx4nDow==
Date: Wed, 5 Jul 2023 16:37:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH v2 06/13] xen/efi: fix violations of MISRA C:2012
 Rule 7.2
In-Reply-To: <9a791b84be74d7ca575eb94e070aae7294d95bbf.1688559115.git.gianluca.luparini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307051635170.761183@ubuntu-linux-20-04-desktop>
References: <cover.1688559115.git.gianluca.luparini@bugseng.com> <9a791b84be74d7ca575eb94e070aae7294d95bbf.1688559115.git.gianluca.luparini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 5 Jul 2023, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
> 
> Add the 'U' suffix to integers literals with unsigned type and also to other
> literals used in the same contexts or near violations, when their positive
> nature is immediately clear. The latter changes are done for the sake of
> uniformity.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
>
> ---
> Changes in v2:
> - minor change to commit title
> - change commit message
> - remove changes in 'efibind.h', 'efiapi.h', 'efidef.h' and 'efiprot.h'
> ---
>  xen/common/efi/boot.c    | 8 ++++----
>  xen/common/efi/runtime.c | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index c5850c26af..28a57fe434 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -34,13 +34,13 @@
>  #define EFI_REVISION(major, minor) (((major) << 16) | (minor))
>  
>  #define SMBIOS3_TABLE_GUID \
> -  { 0xf2fd1544, 0x9794, 0x4a2c, {0x99, 0x2e, 0xe5, 0xbb, 0xcf, 0x20, 0xe3, 0x94} }
> +  { 0xf2fd1544U, 0x9794U, 0x4a2cU, {0x99U, 0x2eU, 0xe5U, 0xbbU, 0xcfU, 0x20U, 0xe3U, 0x94U} }
>  #define SHIM_LOCK_PROTOCOL_GUID \
> -  { 0x605dab50, 0xe046, 0x4300, {0xab, 0xb6, 0x3d, 0xd8, 0x10, 0xdd, 0x8b, 0x23} }
> +  { 0x605dab50U, 0xe046U, 0x4300U, {0xabU, 0xb6U, 0x3dU, 0xd8U, 0x10U, 0xddU, 0x8bU, 0x23U} }
>  #define APPLE_PROPERTIES_PROTOCOL_GUID \
> -  { 0x91bd12fe, 0xf6c3, 0x44fb, { 0xa5, 0xb7, 0x51, 0x22, 0xab, 0x30, 0x3a, 0xe0} }
> +  { 0x91bd12feU, 0xf6c3U, 0x44fbU, { 0xa5U, 0xb7U, 0x51U, 0x22U, 0xabU, 0x30U, 0x3aU, 0xe0U} }
>  #define EFI_SYSTEM_RESOURCE_TABLE_GUID    \
> -  { 0xb122a263, 0x3661, 0x4f68, {0x99, 0x29, 0x78, 0xf8, 0xb0, 0xd6, 0x21, 0x80} }
> +  { 0xb122a263U, 0x3661U, 0x4f68U, {0x99U, 0x29U, 0x78U, 0xf8U, 0xb0U, 0xd6U, 0x21U, 0x80U} }
>  #define EFI_SYSTEM_RESOURCE_TABLE_FIRMWARE_RESOURCE_VERSION 1

To be honest in these case I don't know if this is better or if it is
better to add U only to the first numbers (0xf2fd1544U, 0x605dab50U,
0x91bd12feU, 0xb122a263U).

Either way:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



>  typedef struct {
> diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
> index 13b0975866..5cb7504c96 100644
> --- a/xen/common/efi/runtime.c
> +++ b/xen/common/efi/runtime.c
> @@ -698,7 +698,7 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op)
>  #ifndef COMPAT
>      op->status = status;
>  #else
> -    op->status = (status & 0x3fffffff) | ((status >> 32) & 0xc0000000);
> +    op->status = (status & 0x3fffffffU) | ((status >> 32) & 0xc0000000U);
>  #endif
>  
>      return rc;
> -- 
> 2.41.0
> 

