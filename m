Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FCA7A45CF
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 11:24:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603847.940941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiAUA-0002mf-OV; Mon, 18 Sep 2023 09:24:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603847.940941; Mon, 18 Sep 2023 09:24:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiAUA-0002l2-Fv; Mon, 18 Sep 2023 09:24:06 +0000
Received: by outflank-mailman (input) for mailman id 603847;
 Mon, 18 Sep 2023 09:24:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ngl4=FC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qiAU9-0002kw-3D
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 09:24:05 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b46ce80-5605-11ee-9b0d-b553b5be7939;
 Mon, 18 Sep 2023 11:24:02 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3214cdb4b27so800407f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Sep 2023 02:24:02 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 z2-20020adfd0c2000000b0030ada01ca78sm997095wrh.10.2023.09.18.02.24.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Sep 2023 02:24:01 -0700 (PDT)
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
X-Inumbo-ID: 1b46ce80-5605-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695029042; x=1695633842; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=01bfqL1o9GQf5MGzBnMccgiNsQz/p9A/ecJp+iqhVA8=;
        b=QUhpzhRk4mfp+V/OcvIz3GleknEQ2dpl+FzUs2WQQ1Mgu3eK5y78kFTW+6uUMofgFP
         z3X8cLEQkwsdSA3P+aPdHxV6kY9STX3UVJrx4Wz2Iamwdb1Fwd7z5R35Hhk+tmuLdzk/
         FEMkZ1+JgzLr/aZ6rguB4gTJlreSSTQRfjGvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695029042; x=1695633842;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=01bfqL1o9GQf5MGzBnMccgiNsQz/p9A/ecJp+iqhVA8=;
        b=KDIoThVFReH7f9y5+b+g8GlD0VcMyqn40nuTy1GjjdvNUH88I5DClQlSQoK+jYdHfK
         X8d/gUVgUcVQBzbanvSjYJ3Fj9ulLmIIjBarEweMMjBoJYs2S3iijUGZ9x+Dd/ZKnbtj
         t/C/cqqMomrL1j2WF+bEKyIQxDMtdLa5F6FeXfM7KWb892x9LMhDlF7B4btewQH1cgKA
         7Txz8gA1ygPDJiAbutZWF+MwPJEfbiCD6GugXEAlSc2zcnq5IS8TKQHNkv37fNqfLaxr
         iyByJDcl/RWGbak1CYPMPOLnGNpAwlt2rGtn89mJyPstqTMHddjmTRFkhGh/zv+l/Mwl
         i+Ew==
X-Gm-Message-State: AOJu0Ywr409zCO6iQtQPNNJuRJs8Ljj60m3YkTkr0laoQW+EbURinoAz
	J8bjTwqjXK2jjaOgbaClBct7gR34loZWbMAJzhI=
X-Google-Smtp-Source: AGHT+IFbx9bRKLwXcfGHGvQyCuydQM/JCAwsXJohhoJQpXZsQALdsC0h6opy2FcSzBzfr2mZkrca3Q==
X-Received: by 2002:adf:e54e:0:b0:317:5e91:5588 with SMTP id z14-20020adfe54e000000b003175e915588mr6685429wrm.3.1695029042177;
        Mon, 18 Sep 2023 02:24:02 -0700 (PDT)
Message-ID: <334fb537-ef7c-97e1-3274-736c4a2549b6@citrix.com>
Date: Mon, 18 Sep 2023 10:24:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/7] x86/emul: Fix and extend #DB trap handling
Content-Language: en-GB
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jinoh Kang <jinoh.kang.kr@gmail.com>
References: <20230915203628.837732-1-andrew.cooper3@citrix.com>
 <20230915203628.837732-3-andrew.cooper3@citrix.com>
In-Reply-To: <20230915203628.837732-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/09/2023 9:36 pm, Andrew Cooper wrote:
> diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
> index 94caec1d142c..de7f99500e3f 100644
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -8379,13 +8379,6 @@ x86_emulate(
>      if ( !mode_64bit() )
>          _regs.r(ip) = (uint32_t)_regs.r(ip);
>  
> -    /* Should a singlestep #DB be raised? */
> -    if ( rc == X86EMUL_OKAY && singlestep && !ctxt->retire.mov_ss )
> -    {
> -        ctxt->retire.singlestep = true;
> -        ctxt->retire.sti = false;
> -    }
> -
>      if ( rc != X86EMUL_DONE )
>          *ctxt->regs = _regs;
>      else
> @@ -8394,6 +8387,19 @@ x86_emulate(
>          rc = X86EMUL_OKAY;
>      }
>  
> +    /* Should a singlestep #DB be raised? */
> +    if ( rc == X86EMUL_OKAY && singlestep )
> +    {
> +        ctxt->retire.pending_dbg |= X86_DR6_BS;
> +
> +        /* BROKEN - TODO, merge into pending_dbg. */
> +        if ( !ctxt->retire.mov_ss )
> +        {
> +            ctxt->retire.singlestep = true;
> +            ctxt->retire.sti = false;
> +        }

I occurs to me that setting X86_DR6_BS outside of the !mov_ss case will
break HVM (when HVM swaps from singlestep to pending_dbg) until one of
the further TODOs is addressed.

This will need bringing back within the conditional to avoid regressions
in the short term.

~Andrew

