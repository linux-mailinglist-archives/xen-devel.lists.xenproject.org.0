Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 798C87A1E82
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 14:21:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603118.940015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh7op-0000ch-FN; Fri, 15 Sep 2023 12:21:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603118.940015; Fri, 15 Sep 2023 12:21:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh7op-0000b1-By; Fri, 15 Sep 2023 12:21:07 +0000
Received: by outflank-mailman (input) for mailman id 603118;
 Fri, 15 Sep 2023 12:21:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cz4l=E7=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qh7on-0000av-Sc
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 12:21:05 +0000
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [2607:f8b0:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56acff29-53c2-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 14:21:04 +0200 (CEST)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-690471b5889so488233b3a.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Sep 2023 05:21:04 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 j7-20020a62e907000000b0068a2d78890csm2880358pfh.68.2023.09.15.05.21.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Sep 2023 05:21:02 -0700 (PDT)
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
X-Inumbo-ID: 56acff29-53c2-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694780463; x=1695385263; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJiLAj5J5sVFAB6Sudbt5JOrVFGYXWPrTpyvAmzXaTA=;
        b=cri3QpjQyCMCpaNiGY9pKvHqCNODDBIADlgr7UznUAyfGAk1uMznICJwYps6lr6Yox
         nQVJSmK3cVbVm+lAMukB6BgXQPROJ2k/nATVd6kmdIp9X1gNY0NXhhBXoNjX7RkPyNac
         OQP2WIYTVPB11TIYA0UHN/DDPXDIgGIuLuvvXsJX1Kcl0sVju4B/WGAdtPNfrLrAgDtw
         iN0EzEU7IrEe6LMtCqUQZH7iQ1d/hBmUuguo7dwvTdRnnuMLDWmt46vEHVRMvnmsMb+W
         s11KyhH68ZkliunAOEKgzSs7B3eW1kcVcHwdopbio4s6+wq1vg931Le/18ft3JzQouZ+
         DdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694780463; x=1695385263;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JJiLAj5J5sVFAB6Sudbt5JOrVFGYXWPrTpyvAmzXaTA=;
        b=ZgMshyu+t7R7JvcPmOaLubL1mGUjHWFJInYlbkimRoMxiywmgmOQ0OI+u1ZSs8jS6n
         aEZb7mPZSY4Xir/yS4eHDQiCGCzLbimyZZjQ82dkoVmgYeCB0gwUkwqbbu+u3/U0hvNW
         pjA1NunaZOGARLEwAPSEQmUvDih0n2GTz258fY4tpOX86C1d0NVxdq3NxYRKjwfPwzOL
         yH/RJpCsByw1rkm7dIQu4GKBMCmQwA+6d9/hrn8zl/qmKXVH8VqIsUsT5QCdz+Acz6PN
         UFsZprfodvqW+PSXz0/gF/dDXXtkzfTM5Nn2DZ2PynNOhBiN5STNcJjIvu29R4mwj8rb
         e86Q==
X-Gm-Message-State: AOJu0YzQhbqQecTfxf+9dcPVJRjbZHafMKdqrRNq6L8ojBJ0bweeusCb
	OtivcwY4fKrcxcuQtUBk1RA=
X-Google-Smtp-Source: AGHT+IGjCn/2nPl+bU0z1TIZ+Y13T5D9H7Q0+jF7ne9nm9YCVlGpzexjZfOcNGeOgsIrFWlt+T9BgA==
X-Received: by 2002:a05:6a20:9752:b0:14c:40d1:e911 with SMTP id hs18-20020a056a20975200b0014c40d1e911mr1369852pzc.42.1694780463061;
        Fri, 15 Sep 2023 05:21:03 -0700 (PDT)
Message-ID: <e17dd8a7-91d0-fc30-203e-09058ee5e61d@gmail.com>
Date: Fri, 15 Sep 2023 21:20:58 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230912232113.402347-1-andrew.cooper3@citrix.com>
 <20230912232113.402347-4-andrew.cooper3@citrix.com>
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: Re: [PATCH 3/5] x86/emul: Add a pending_dbg field to
 x86_emulate_ctxt.retire
In-Reply-To: <20230912232113.402347-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/13/23 08:21, Andrew Cooper wrote:
> diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
> index 698750267a90..f0e74d23c378 100644
> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
> @@ -588,15 +588,26 @@ struct x86_emulate_ctxt
>      /* Canonical opcode (see below) (valid only on X86EMUL_OKAY). */
>      unsigned int opcode;
>  
> -    /* Retirement state, set by the emulator (valid only on X86EMUL_OKAY). */
> +    /*
> +     * Retirement state, set by the emulator (valid only on X86EMUL_OKAY/DONE).
> +     *
> +     * TODO: all this state should be input/output from the VMCS PENDING_DBG,
> +     * INTERRUPTIBILITY and ACTIVITIY fields.
> +     */
>      union {
> -        uint8_t raw;
> +        unsigned long raw;

Minor nit: this should be uint64_t for clarity.  Otherwise, it's not at all
clear that the raw field covers the entire union, unless you remind myself
that Xen does not support 32-bit host.

>          struct {
> +            /*
> +             * Accumulated %dr6 trap bits, positive polarity.  Should only be
> +             * interpreted in the case of X86EMUL_OKAY/DONE.
> +             */
> +            unsigned int pending_dbg;
> +
>              bool hlt:1;          /* Instruction HLTed. */
>              bool mov_ss:1;       /* Instruction sets MOV-SS irq shadow. */
>              bool sti:1;          /* Instruction sets STI irq shadow. */
>              bool unblock_nmi:1;  /* Instruction clears NMI blocking. */
> -            bool singlestep:1;   /* Singlestepping was active. */
> +            bool singlestep:1;   /* Singlestepping was active. (TODO, merge into pending_dbg) */
>          };
>      } retire;
>  

-- 
Sincerely,
Jinoh Kang


