Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC63B0C6D8
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 16:49:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051595.1419954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udrp8-0004zr-ME; Mon, 21 Jul 2025 14:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051595.1419954; Mon, 21 Jul 2025 14:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udrp8-0004wj-J0; Mon, 21 Jul 2025 14:49:02 +0000
Received: by outflank-mailman (input) for mailman id 1051595;
 Mon, 21 Jul 2025 14:49:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQHN=2C=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1udrp7-0004wd-0r
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 14:49:01 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5e7c371-6641-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 16:49:00 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-451d54214adso31826525e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 07:49:00 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4563b5a4055sm105563275e9.5.2025.07.21.07.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 07:48:58 -0700 (PDT)
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
X-Inumbo-ID: d5e7c371-6641-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753109339; x=1753714139; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bDQf67r7MOzRePNmWgBecjyZv8IMi8LJeeaDlQWL4ZU=;
        b=TWUV/c+zliVINPc3eou1283iG/9jEka6SIrI0dn8eVuUnK8h8zdMN3/3zbUq8E8Uz5
         Cc6IKpDP4kwda54sR2Pcd7AxRpagLyRZW1IrYNuvbWeMhVO+Sf/IsUhSO8hUW+pRVrFi
         kGb6iWlWW7onRdWfXdbi7haByukgQZozskXlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753109339; x=1753714139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDQf67r7MOzRePNmWgBecjyZv8IMi8LJeeaDlQWL4ZU=;
        b=DxAxA5ukT16TYadguzXhA2ooN5lJTEPovvBerm8pIPKNCMJJG+zdKcI4Tjp/RKFNPM
         P/4s8vFcqxQAIQbTMtkPKtUDpBVH1ZNDbbsDETJd8sK96eCiRcxUokYy6tD/IQNOrNG4
         qkBh671hRFf0ykc1bQxFe9rzkIEsgZ7ZXWZoQ7OXWkNRNdce4fygZxdL3W7DFKPDc9mC
         dQ64zSAmoYNnWVali9zwRhhZ5lz+NbiVZ288Pcg9ssFx4vetZzNZHsb/UI/5ICdmlovl
         HmQWUjYJovl0xkonvRq7lYlKO456gN8/pLBUOfyWw2Pv3WaVAWEhZ4GqP9itgAnvy9yN
         nr/A==
X-Gm-Message-State: AOJu0YxgmebPUsKeAqR/wWnjhJboj8ohNV/dLMW7/RCWGFamRTxIlZj3
	rsp2/CJG3xbXLY9mLqnmh1x7juPha5D8r1fokuh9aO4qzB+kws3o4KoemMVUKQsSuak=
X-Gm-Gg: ASbGncv8i/sKSUyrnBD5qWlpCQ5sy78L8RqnwFgtKQUgiXarnwukvrxbQTM0atAdRH+
	P3QDCZQHmr0dPEbX2c776muZXx0R7/gdGvNo8s1o82DHNv1KxJYwWljDQ6i8Cqg1o8NmU9wlUZy
	aTWM9Bn2aztFeP97gtL8FstwPuz0h4aABnzfvG16xJw5DHUE2UwyASS/b4kiI0DinjVOF5WjG1n
	6koFM73ZZilYNyJWSIFivuHfDDVwOi+1u0BMBkBP8ksPEgDkrfWZcfD1G+hyxzD+UqFrNZJBk82
	5jgGNMl4WWACtT+DP2L+fqKwwCi5wlbi/yqMfwv7DU940ekxb1FOduP902/O32c3120zU3LzAxv
	1Hx9ZxEuynSVCmD4fAmXfVbXy/ih/mpZ7hypvP6BRasSm3oAQjYfimZzE0zXGsjYSFw==
X-Google-Smtp-Source: AGHT+IESDH5ODZX/lLpkNnsAgN/DDH6kUQoLGAuoDPCNtHR/tkIkyQLOacCtvm5pQzk7YPKn5tIeog==
X-Received: by 2002:a05:600c:8b0b:b0:456:12ad:ec30 with SMTP id 5b1f17b1804b1-45635e6d91cmr151867075e9.13.1753109339082;
        Mon, 21 Jul 2025 07:48:59 -0700 (PDT)
Date: Mon, 21 Jul 2025 16:48:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Chen Jiqian <Jiqian.Chen@amd.com>
Subject: Re: [PATCH] x86: don't have gcc over-align data
Message-ID: <aH5TWXWFJ1IOH220@macbook.local>
References: <f68299c4-7aba-4bac-a50c-182f3cb5686e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f68299c4-7aba-4bac-a50c-182f3cb5686e@suse.com>

On Wed, Jun 25, 2025 at 11:04:14AM +0200, Jan Beulich wrote:
> For (aiui) backwards compatibility reasons, gcc defaults to a mode that
> was the exclusive one up to gcc4.8, establishing 32-byte alignment for
> aggregates larger than a certain size. We don't rely on such, and hence
> we can do with the psABI-compliant 16-byte alignment.
> 
> Savings in the build I'm looking at:
> - .data.ro_after_init		 344 bytes
> - .rodata + .data.rel.ro	1904 bytes
> - .init.*data.cf_clobber	 232 bytes
> - .init (overall)		 688 bytes
> - .data.read_mostly		 864 bytes
> - .data				 600 bytes
> - .bss				1472 bytes
> 
> Overall xen-syms' _end happens to move down there by 2 pages.
> 
> Clang doesn't support the option, presumably because they never over-
> aligned data.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -8,6 +8,9 @@ CFLAGS += -DXEN_IMG_OFFSET=$(XEN_IMG_OFF
>  # Prevent floating-point variables from creeping into Xen.
>  CFLAGS += -msoft-float
>  
> +# Don't needlessly over-align larger aggregates.
> +CFLAGS-$(CONFIG_CC_IS_GCC) += -malign-data=abi

Instead of using CONFIG_CC_IS_GCC should be just use cc-option-add to
check for the option begin present, regardless of the underlying
compiler?

Thanks, Roger.

