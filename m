Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E157F3AC5
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 01:39:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638328.994785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5bFe-0006hf-P4; Wed, 22 Nov 2023 00:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638328.994785; Wed, 22 Nov 2023 00:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5bFe-0006ep-Ly; Wed, 22 Nov 2023 00:37:58 +0000
Received: by outflank-mailman (input) for mailman id 638328;
 Wed, 22 Nov 2023 00:37:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q+k4=HD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r5bFc-0006eO-Qd
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 00:37:56 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6016b822-88cf-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 01:37:54 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4083ac51d8aso30512575e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 16:37:54 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c089300b004080f0376a0sm318242wmp.42.2023.11.21.16.37.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Nov 2023 16:37:53 -0800 (PST)
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
X-Inumbo-ID: 6016b822-88cf-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700613474; x=1701218274; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nB2LDbE3P1q+lYK7Rw1XZuQRMktjRTI8WM+Mp9sGJ9o=;
        b=lAal4tW6tnxWV2Z+ndEwBBe7PkBd+Kk7LdH/BGpPCmkpYWrHf3PzmccDWJqxuUPhzn
         VphTGog/gVBcR7mdhi31tV7/1kuoKg8hgVt3Ty4OS2DUaPW7R78nqeIfijojM5quBe9c
         I4aYgAaQKgGJwqmQifjUMroZ6SugTmVff83VY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700613474; x=1701218274;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nB2LDbE3P1q+lYK7Rw1XZuQRMktjRTI8WM+Mp9sGJ9o=;
        b=f8h2phHGu7Po8axRqF30Mu/iVNlM/InGkObedwXd8KtXlBkN1HcgmTy347kn1taoGj
         ae/YnhUP7lFNaH0KU4xXFuMgd9z+jIlg0mUbgvMGGY9OAS3X2xrr+EmIVXQqPvejjJS0
         MraUIyjzt1yqz7Q8HmugMKoo0YJK9ZA5/Rj9CgYIuPePSFvdXxKFy+eUAGFpzTUeXvZ3
         8/TdqVD1vrmr8pOUDglE2rm2D9oaIYmusKZBU3Fp/XUwcKKl4Vm4WYWoLD/IoQCXTIB6
         y2xniwck9+f0qc548oJSAMNL2zfQrVtP+TFxx17tu0ARlPatPSFwPIfKFxPENMI8WHby
         uSEQ==
X-Gm-Message-State: AOJu0Yxft7apZDCOulvaATca0cA042i68Uq5Tp3o8hJxZyPEOAVTuaPX
	Ui6jaCrgsx3zNlOHnBHmiiJ2AKTWANs5hgIQ5gE=
X-Google-Smtp-Source: AGHT+IGgYm67tzb3DIj8WUmvS9470ZAaWbBNHZ3lYhQ2BRZSqgw25kgOcE5sUZWchR63z+2mOMpGmQ==
X-Received: by 2002:a05:600c:4c94:b0:40b:2b12:1463 with SMTP id g20-20020a05600c4c9400b0040b2b121463mr660510wmp.9.1700613474190;
        Tue, 21 Nov 2023 16:37:54 -0800 (PST)
Message-ID: <804bc3be-256b-4a07-8779-06a5c2be1cef@citrix.com>
Date: Wed, 22 Nov 2023 00:37:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] x86/vPIT: check values loaded from state save
 record
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <08e0708c-17e2-4a5e-aaf7-5f60a40f76db@suse.com>
 <584f566f-a0c9-49b5-b592-89ac4f1ecd05@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <584f566f-a0c9-49b5-b592-89ac4f1ecd05@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/11/2023 1:47 pm, Jan Beulich wrote:
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

Looking in the datasheet, we have:

---8<---
After power-up, the state of the 8254 is undefined.  The Mode, count
value and output of all Counters are undefined.

How each Counter operates is determined when it is programmed.  Each
Counter must be programmed before it can be used.  Unused counters need
not be programmed.
---8<---

So software is required to explicitly configure a mode before using it.

As long as mode 7 doesn't behave unsafely, I think we're good.

>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> For mode we could refuse to load values in the [0x08,0xfe] range; I'm
> not certain that's going to be overly helpful.
>
> For count I was considering to clip the saved value to 16 bits (i.e. to
> convert the internally used 0x10000 back to the architectural 0x0000),
> but pit_save() doesn't easily lend itself to such a "fixup". If desired
> perhaps better a separate change anyway.

I suspect that at this point, it's not worth trying to fix this.  We
can't change the stream format without a giant overhaul.

> ---
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
> +    hw = hvm_point_entry(PIT, h);
> +    if ( !hw )
> +        return -ENODATA;
> +
> +    /*
> +     * Check to-be-loaded values are within valid range, for them to represent
> +     * actually reachable state.  Uses of some of the values elsewhere assume
> +     * this is the case.  Note that the channels' mode fields aren't checked;
> +     * older Xen might save them as 0xff.

"older Xen" goes stale very quickly.  "Xen prior to 4.19", or "Xen prior
to the time of writing (Nov 2023)" if you're planning to backport this.

> +     */
> +    if ( hw->speaker_data_on > 1 || hw->pad0 )
> +        return -EDOM;
> +
> +    for ( i = 0; i < ARRAY_SIZE(hw->channels); ++i )
> +    {
> +        const struct hvm_hw_pit_channel *ch = &hw->channels[i];
> +
> +        if ( ch->count > 0x10000 ||
> +             ch->count_latched >= RW_STATE_NUM ||
> +             ch->read_state >= RW_STATE_NUM ||
> +             ch->write_state >= RW_STATE_NUM ||
> +             ch->rw_mode > RW_STATE_WORD0 ||
> +             ch->gate > 1 ||
> +             ch->bcd > 1 )
> +            return -EDOM;
> +
> +        if ( i != 2 && !ch->gate )
> +            return -EINVAL;
> +    }
> +
> +    return 0;
> +}
> +
>  static int cf_check pit_load(struct domain *d, hvm_domain_context_t *h)
>  {
>      PITState *pit = domain_vpit(d);
> @@ -443,6 +485,14 @@ static int cf_check pit_load(struct doma
>          goto out;
>      }
>      
> +    for ( i = 0; i < ARRAY_SIZE(pit->hw.channels); ++i )
> +    {
> +        struct hvm_hw_pit_channel *ch = &pit->hw.channels[i];
> +
> +        if ( (ch->mode &= 7) > 5 )
> +            ch->mode -= 4;

How does this work?  If we get in an 0xff, we'll turn it into 0xfb
rather than 7.

> +    }
> +
>      /*
>       * Recreate platform timers from hardware state.  There will be some 
>       * time jitter here, but the wall-clock will have jumped massively, so 
> @@ -458,7 +508,7 @@ static int cf_check pit_load(struct doma
>      return rc;
>  }
>  
> -HVM_REGISTER_SAVE_RESTORE(PIT, pit_save, NULL, pit_load, 1, HVMSR_PER_DOM);
> +HVM_REGISTER_SAVE_RESTORE(PIT, pit_save, pit_check, pit_load, 1, HVMSR_PER_DOM);
>  #endif
>  
>  /* The intercept action for PIT DM retval: 0--not handled; 1--handled. */
> @@ -575,7 +625,7 @@ void pit_reset(struct domain *d)
>      for ( i = 0; i < 3; i++ )
>      {
>          s = &pit->hw.channels[i];
> -        s->mode = 0xff; /* the init mode */
> +        s->mode = 7; /* the init mode */

I think it would be helpful to modify the comment to say /* unreachable
sentinel */ or something.

~Andrew

