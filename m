Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A4D8A032D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 00:17:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703678.1099486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rugGE-0000TN-88; Wed, 10 Apr 2024 22:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703678.1099486; Wed, 10 Apr 2024 22:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rugGE-0000RQ-4b; Wed, 10 Apr 2024 22:17:42 +0000
Received: by outflank-mailman (input) for mailman id 703678;
 Wed, 10 Apr 2024 22:17:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rcYN=LP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rugGD-0008JC-2m
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 22:17:41 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23fc59de-f788-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 00:17:40 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0789BCE2AB0;
 Wed, 10 Apr 2024 22:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C77EC433F1;
 Wed, 10 Apr 2024 22:17:36 +0000 (UTC)
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
X-Inumbo-ID: 23fc59de-f788-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712787457;
	bh=hyzAmNc5yc+bIFBdfeWPrFehNQaEIVwneQZVyo52llc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XbJmXkSCSVU/BJu7cXjZ5eE7ndytJ9RQ5SLEYdooy/fH3QtQ5GaDrcItj8PRg/4/+
	 K8kh7w3f45t8aygNXU6jYtMLtxVUDGCBwIDK3eNuIGIwZBiJNTuE+WNlMZb9ZFzDEb
	 xJo2i/n7DgHsZVqph9eC3s6OECEEcOKXmv+2fcdYOXrLTvohuJ50JMqQCGe12P4iQv
	 ZpTP3p6rIz4+eDShuNkucQbsP6pNBmG7JTYT2BVB+4pmMQedgTFcm3x2Eb1FqFKPll
	 T243HNSBTOGpRUC020f7uteV3YD3RBVo5HNC3ZqwD/fY5vzqus59HecklqPRrMOWYU
	 s/j4aVs+Xkdig==
Date: Wed, 10 Apr 2024 15:17:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>, 
    Roberto Bagnara <roberto.bagnara@bugseng.com>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] x86/emul: Adjust X86EMUL_OPC_EXT_MASK to placate MISRA
In-Reply-To: <20240410194531.1500509-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2404101517200.711344@ubuntu-linux-20-04-desktop>
References: <20240410194531.1500509-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1780247962-1712787457=:711344"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1780247962-1712787457=:711344
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 10 Apr 2024, Andrew Cooper wrote:
> Resolves 4740 MISRA R7.2 violations.

LOL!!


> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
> CC: Federico Serafini <federico.serafini@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> of 4935, so 96% of them...
> ---
>  xen/arch/x86/x86_emulate/x86_emulate.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
> index 698750267a90..d92be69d84d9 100644
> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
> @@ -620,7 +620,7 @@ struct x86_emulate_ctxt
>   * below).
>   * Hence no separate #define-s get added.
>   */
> -#define X86EMUL_OPC_EXT_MASK         0xffff0000
> +#define X86EMUL_OPC_EXT_MASK         0xffff0000U
>  #define X86EMUL_OPC(ext, byte)       ((uint8_t)(byte) | \
>                                        MASK_INSR((ext), X86EMUL_OPC_EXT_MASK))
>  /*
> 
> base-commit: 0e7ea8ca5fc9bce9248414f6aaf2dc861abd45d9
> prerequisite-patch-id: 8d06e56c5d8a52f1387e1f5a7fce6a94b8c4a1ed
> prerequisite-patch-id: 13355d26254b979c79de456c9a6ea6a9c639ba63
> prerequisite-patch-id: d1f308616490257685a49248e29f1b3516c2dde4
> -- 
> 2.30.2
> 
--8323329-1780247962-1712787457=:711344--

