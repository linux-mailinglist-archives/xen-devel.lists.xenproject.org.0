Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1535F783B61
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 10:04:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588213.919700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYMMj-0002fF-Ic; Tue, 22 Aug 2023 08:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588213.919700; Tue, 22 Aug 2023 08:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYMMj-0002dD-Er; Tue, 22 Aug 2023 08:03:53 +0000
Received: by outflank-mailman (input) for mailman id 588213;
 Tue, 22 Aug 2023 08:03:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qYMMi-0002d7-7C
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 08:03:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYMMh-0004dA-8k; Tue, 22 Aug 2023 08:03:51 +0000
Received: from [54.239.6.178] (helo=[192.168.0.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYMMh-0001SF-2L; Tue, 22 Aug 2023 08:03:51 +0000
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
	bh=7uGygNoSEeND/ygDnmTHVw77TbgvBGr9JfNizRux7CM=; b=6XrEP7Qxu7N5ainuNVPlLmiYA7
	wHfLmk3RiJzI3dDVxxyTvW6oHvDBDCl1353JasnEHOzjihM4D60v/MvfXY8slXV/uGb+IaTOG2X1K
	masNaEhDWJu33sAAgrS5PrRZHgSjC/8lsiGMVPRQkTJxG4P17136oyukdIEsy4RJ+27E=;
Message-ID: <de59a660-1566-44eb-8fd8-b99499e97e99@xen.org>
Date: Tue, 22 Aug 2023 09:03:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/misra: document gcc-specific behavior with
 shifting signed integers
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, nicola.vetrini@bugseng.com,
 Stefano Stabellini <stefano.stabellini@amd.com>
References: <20230822010228.2517542-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230822010228.2517542-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 22/08/2023 02:02, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> v2:
> - split << and >>
> - do not use the word "shift" instead of << or >>
> ---
>   docs/misra/C-language-toolchain.rst | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-toolchain.rst
> index 785aed1eaf..4c4942a113 100644
> --- a/docs/misra/C-language-toolchain.rst
> +++ b/docs/misra/C-language-toolchain.rst
> @@ -200,6 +200,15 @@ The table columns are as follows:
>        - ARM64, X86_64
>        - See Section "6.29 Designated Initializers" of GCC_MANUAL
>   
> +   * - Signed << compiler-defined behavior
> +     - All architectures
> +     - See Section "4.5 Integers" of GCC_MANUAL. As an extension to the
> +       C language, GCC does not use the latitude given in C99 and C11
> +       only to treat certain aspects of signed << as undefined.
> +
> +   * - Signed >> acts on negative numbers by sign extension
> +     - All architectures
> +     - See Section "4.5 Integers" of GCC_MANUAL.

I noticed that all this document is referring to GCC. But we also 
support CLang. Did you confirm that CLang abide with this behavior?

Cheers,

-- 
Julien Grall

