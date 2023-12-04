Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A50BB803BED
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 18:47:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647265.1010213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAD1l-0001im-2q; Mon, 04 Dec 2023 17:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647265.1010213; Mon, 04 Dec 2023 17:46:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAD1k-0001fU-W9; Mon, 04 Dec 2023 17:46:40 +0000
Received: by outflank-mailman (input) for mailman id 647265;
 Mon, 04 Dec 2023 17:46:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uft2=HP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rAD1j-0001eC-JY
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 17:46:39 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1262964b-92cd-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 18:46:37 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40c032962c5so29031515e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 09:46:37 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 r20-20020a05600c35d400b0040c05c768afsm8588814wmq.9.2023.12.04.09.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 09:46:36 -0800 (PST)
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
X-Inumbo-ID: 1262964b-92cd-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701711996; x=1702316796; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l0SOcOhAedmGbSblAZ4sqnCPC/P04NuInPl8PQK3Mjs=;
        b=Nrp/0xh4otlSL2myjDO9+1R2xA+aZ8iOZaA8UwJqerRe3P1bZQ1La6o0EIL+YatZha
         LKHHj+leAjyuYiFM5mxHLz2gETSrifGUXpllOsiXN+JW/RHGkhg2WXrwmvENWbVKc4p8
         1QlzJ/QjbM/ssyBmjzrHORUsK6XpF/e3baEOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701711996; x=1702316796;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l0SOcOhAedmGbSblAZ4sqnCPC/P04NuInPl8PQK3Mjs=;
        b=xMZ6v00B2XZpwdmW03IB7oGzA9nQ+eRNbLlngcpfHCXEp6uFHK5oh4B80eB4t9B8Y8
         6L4cuaGIFDac46dsU6LzB2OS2t03b0wSXjjp0wTMil60WW0fJ+pqkHbNjrDSw9mFpUvX
         Fd9rZxvU1n/nmihQqlmKy5N7s/kJwv26mBHdnm8NU4MPLEQNwlHTHpH5E/+D55uxNY95
         TQBSvJ58XM46nXh31IaRr6kiFdqgFmolIC0SvL81aLSLIUdieXsHILS8aksa//xXkUFf
         SJvfqFGXZA8O1TpG4iY49gtcdv77Y2mPaFQI26MhhSvsCEl25QWokFIrGdVt7kK/IoEj
         rGLw==
X-Gm-Message-State: AOJu0YxiuW5bjgmQE3lm2FKpChovXq2YuM38OvKxCIEvmLz0+sP7J+Xe
	zcZ+TYvY4Y/OS8q5tKXHBb91XQ==
X-Google-Smtp-Source: AGHT+IE+ElWLnSJSKr1KibRJlCfKHM5W7Q20K3f6H90Tmvo9Jxtp7HCioElHE4eqMgLhgMwqNtxV7Q==
X-Received: by 2002:a7b:c396:0:b0:40c:f1e:5ed9 with SMTP id s22-20020a7bc396000000b0040c0f1e5ed9mr294923wmj.217.1701711996415;
        Mon, 04 Dec 2023 09:46:36 -0800 (PST)
Date: Mon, 4 Dec 2023 18:46:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 4/6] x86/vPIT: check values loaded from state save
 record
Message-ID: <ZW4Qe1H-v0dqu2YS@macbook>
References: <49a17ffa-c873-4b0f-81ed-9587053ca159@suse.com>
 <cf1ff132-878a-4cb6-8eae-1995a78576a0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf1ff132-878a-4cb6-8eae-1995a78576a0@suse.com>

On Tue, Nov 28, 2023 at 11:35:18AM +0100, Jan Beulich wrote:
> In particular pit_latch_status() and speaker_ioport_read() perform
> calculations which assume in-bounds values. Several of the state save
> record fields can hold wider ranges, though. Refuse to load values which
> cannot result from normal operation, except mode, the init state of
> which (see also below) cannot otherwise be reached.
> 
> Note that ->gate should only be possible to be zero for channel 2;
> enforce that as well.
> 
> Adjust pit_reset()'s writing of ->mode as well, to not unduly affect
> the value pit_latch_status() may calculate. The chosen mode of 7 is
> still one which cannot be established by writing the control word. Note
> that with or without this adjustment effectively all switch() statements
> using mode as the control expression aren't quite right when the PIT is
> still in that init state; there is an apparent assumption that before
> these can sensibly be invoked, the guest would init the PIT (i.e. in
> particular set the mode).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> For mode we could refuse to load values in the [0x08,0xfe] range; I'm

I'm missing something, why should we accept a 0xff mode?  Don't modes
go up to 7 at most (0b111, mode 3).

> not certain that's going to be overly helpful.

I don't have a strong opinion.  Could be done in a separate change
anyway.  I guess since we are at it it might be worth to check for as
much as we can, even if it's not going to affect the logic.

> For count I was considering to clip the saved value to 16 bits (i.e. to
> convert the internally used 0x10000 back to the architectural 0x0000),
> but pit_save() doesn't easily lend itself to such a "fixup". If desired
> perhaps better a separate change anyway.

I would prefer a separate change iff you want to implement this.

> ---
> v3: Slightly adjust two comments. Re-base over rename in earlier patch.
> v2: Introduce separate checking function; switch to refusing to load
>     bogus values. Re-base.
> 
> --- a/xen/arch/x86/emul-i8254.c
> +++ b/xen/arch/x86/emul-i8254.c
> @@ -47,6 +47,7 @@
>  #define RW_STATE_MSB 2
>  #define RW_STATE_WORD0 3
>  #define RW_STATE_WORD1 4
> +#define RW_STATE_NUM 5
>  
>  #define get_guest_time(v) \
>     (is_hvm_vcpu(v) ? hvm_get_guest_time(v) : (u64)get_s_time())
> @@ -427,6 +428,47 @@ static int cf_check pit_save(struct vcpu
>      return rc;
>  }
>  
> +static int cf_check pit_check(const struct domain *d, hvm_domain_context_t *h)
> +{
> +    const struct hvm_hw_pit *hw;
> +    unsigned int i;
> +
> +    if ( !has_vpit(d) )
> +        return -ENODEV;
> +
> +    hw = hvm_get_entry(PIT, h);
> +    if ( !hw )
> +        return -ENODATA;
> +
> +    /*
> +     * Check to-be-loaded values are within valid range, for them to represent
> +     * actually reachable state.  Uses of some of the values elsewhere assume
> +     * this is the case.  Note that the channels' mode fields aren't checked;
> +     * Xen prior to 4.19 might save them as 0xff.

Oh, OK, so that explains the weird 0xff mode.

Thanks, Roger.

