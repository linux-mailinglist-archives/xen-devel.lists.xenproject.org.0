Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5570ABB032
	for <lists+xen-devel@lfdr.de>; Sun, 18 May 2025 14:22:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989073.1373412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGd20-0001Dv-GT; Sun, 18 May 2025 12:22:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989073.1373412; Sun, 18 May 2025 12:22:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGd20-0001BW-DX; Sun, 18 May 2025 12:22:16 +0000
Received: by outflank-mailman (input) for mailman id 989073;
 Sun, 18 May 2025 12:22:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uGd1y-0001BQ-FI
 for xen-devel@lists.xenproject.org; Sun, 18 May 2025 12:22:14 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9e5de3c-33e2-11f0-9ffb-bf95429c2676;
 Sun, 18 May 2025 14:22:12 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5fbee929e56so6473325a12.0
 for <xen-devel@lists.xenproject.org>; Sun, 18 May 2025 05:22:12 -0700 (PDT)
Received: from [172.18.118.114] (ip-185-104-138-68.ptr.icomera.net.
 [185.104.138.68]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4383f8sm437517866b.113.2025.05.18.05.22.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 05:22:11 -0700 (PDT)
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
X-Inumbo-ID: b9e5de3c-33e2-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747570932; x=1748175732; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tGw/VGJW36MK0FIdcvrioGeqrP9M9zDZ4ZMi00iHbzU=;
        b=Pc9ZuTVFaVMuQiyIGxEu5sbGljnuw6Vc9hK8jpGr1F/NEbUVvMghqhiSf8nPo4+gZk
         BkQsu4+urco1QdbTKtV72n5NQKDw8LYy/Lhwm+BH3940b+7B5yAuobKwPxelj0hh+wna
         sYiGbu2XVrnvTVo9uBh9Lc9Nap2ed+RLwv4Yv0Am8H6BCr4mvqcsfcSKaix+BtoCyv08
         z16/XFQDRqZf27qAdhaL9/P7EFV13WsVJTethbqPkqlt7zlA/3IXCK7ElEwN9Vw/86aM
         PkgEEPUjP634qPLAM3zycvWlm2ovavjQiKP2yKCWXJR0P07HjZBo3BQaN5cv1fNNaXEK
         9Aww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747570932; x=1748175732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tGw/VGJW36MK0FIdcvrioGeqrP9M9zDZ4ZMi00iHbzU=;
        b=f1+QS9op/C6PFc74/HbW1wz2Fp28WHdrvzPbvR69gcH1VoDBS3vtLVVB+C/Cm1PuL9
         Bh/IsPlHuUbEG6svbeHzOurKHxl8zLvL2f4gzmuEJ3MXLpkOlM5EQM1QfsqNEYs/4m6j
         xjxNPVSgjPnrBp3fXjsRcRieXHZla5D0MuLso9z2lwOCA5qz5POsQCW5GnI29q3MDJkB
         gEaLzk+u7WPm8Dzn0eDUtJQZeT4qcv89PBAWbOVEJukpFzd97+6EOtM9vuh/K31NfuZ6
         K/JEq3dnbgtWD16aS7rBCiPwtnGezWMAvFBR+cLIorFz4eGDePVKI005HpNBpAUSOclR
         M82w==
X-Forwarded-Encrypted: i=1; AJvYcCWwVTq3BWYPrKIyNPR3XeCJta3qa7xgvBQPDs1AVrnuFO++VPCiFhufPzoyJSZNplkdGVfdYU6ym5k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+1a12SFgYwlcQnhalz3Fke2t7ICiYZdLxMtWnHA9O9CzkhEST
	6VwFf4K9nobLmhU2fPKSvBgTVk4fg/2tAn2BZNeEoqPKySagmE2o7Va1c1Vyb9Ty8g==
X-Gm-Gg: ASbGnctqRXMCX/9nUbjx8kzf42TyYB2m2CR2Oi30mksEHYtEb7iOXeDyU44O5MJOOK0
	q0FNa0mL2T7T/uFkZ4C+UshRD6KklB6xKtiCVEmmKl2XavBtypw8/SSLzy13aWUlAQ4VD3wYIpD
	WBpDRrgs5gH8Wy99UvOk3YiMze1VQI+0zI5OHL1dzooc7XvZ36NkWrbHxvHGAUUi9O2datzwl5P
	vxJdThcQe78ZF7gL6ITsaKiPiLEldDTv0VZ/JeNxnR8hRCPQhXTtw1gPfveGYmCdM4VHGG1aM+M
	+HXkO/Q/5tBM4w4YcTWafNJhQoK3R9raa98fQ742JK9v+jyGYq8COAIO9p+tHfEEbTo9iblFmgs
	Ve1gCCvcofIJMHYvKMt6Ov3R+
X-Google-Smtp-Source: AGHT+IFo3JqDCEsob3zzI8Ku7HrchXncLl/NgpoXrLwULONmnkkao8LUjk99E6VtWUM41t0/A8kdIQ==
X-Received: by 2002:a17:907:7b97:b0:ad2:39a9:f1b8 with SMTP id a640c23a62f3a-ad536f3867fmr869897966b.57.1747570931804;
        Sun, 18 May 2025 05:22:11 -0700 (PDT)
Message-ID: <9e9882d3-fae7-48ca-bb8d-071ffe2f4a21@suse.com>
Date: Sun, 18 May 2025 14:22:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] livepatch: Verify livepatch signatures
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Jennifer Herbert <jennifer.herbert@cloud.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250515093822.659916-1-ross.lagerwall@citrix.com>
 <20250515093822.659916-6-ross.lagerwall@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250515093822.659916-6-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.05.2025 11:38, Ross Lagerwall wrote:
> @@ -79,6 +80,9 @@ static DEFINE_PER_CPU(struct tasklet, livepatch_tasklet);
>  static struct rsa_public_key builtin_payload_key;
>  #endif
>  
> +static int check_signature(const struct livepatch_elf *elf, void *raw,
> +                           size_t size);

I think it would be nice if this forward decl was avoided. Which looks to
be feasible if you moved the definition further up.

> @@ -1202,6 +1208,109 @@ static int load_payload_data(struct payload *payload, void *raw, size_t len)
>      return rc;
>  }
>  
> +#ifdef CONFIG_PAYLOAD_VERIFY
> +#define MAX_SIG_NOTE_SIZE 1024
> +
> +static int check_rsa_sha256_signature(void *data, size_t datalen,
> +                                      void *sig, uint32_t siglen)
> +{
> +    struct sha2_256_state hash;
> +    MPI s;
> +    int rc;
> +
> +    s = mpi_read_raw_data(sig, siglen);
> +    if ( !s )
> +    {
> +        printk(XENLOG_ERR LIVEPATCH "Failed to mpi_read_raw_data\n");
> +        return -ENOMEM;
> +    }
> +
> +    sha2_256_init(&hash);
> +    sha2_256_update(&hash, data, datalen);
> +
> +    rc = rsa_sha256_verify(&builtin_payload_key, &hash, s);
> +    if ( rc )
> +        printk(XENLOG_ERR LIVEPATCH "rsa_sha256_verify failed: %d\n", rc);
> +
> +    mpi_free(s);
> +
> +    return rc;
> +}
> +
> +static int check_signature(const struct livepatch_elf *elf, void *raw,
> +                           size_t size)
> +{
> +    static const char notename[] = "Xen";
> +    void *sig;
> +    livepatch_elf_note note;
> +    int rc;
> +
> +    rc = livepatch_elf_note_by_names(elf, ELF_XEN_SIGNATURE, notename, -1,
> +                                     &note);
> +    if ( rc )
> +    {
> +        dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Signature not present\n",
> +                elf->name);
> +        return rc;
> +    }
> +
> +    /* We expect only one signature, find a second is an error! */
> +    rc = livepatch_elf_next_note_by_name(notename, -1, &note);
> +    if ( rc != -ENOENT )
> +    {
> +        if ( rc )
> +        {
> +            printk(XENLOG_ERR LIVEPATCH
> +                   "Error while checking for notes! err = %d\n", rc);
> +            return rc;
> +        }
> +        else
> +        {
> +            printk(XENLOG_ERR LIVEPATCH
> +                   "Error, found second signature note! There can be only one!\n");
> +            return -EINVAL;
> +        }
> +    }
> +
> +    if ( SIGNATURE_VERSION(note.type) != LIVEPATCH_SIGNATURE_VERSION ||
> +         SIGNATURE_ALGORITHM(note.type) != SIGNATURE_ALGORITHM_RSA ||
> +         SIGNATURE_HASH(note.type) != SIGNATURE_HASH_SHA256 )
> +    {
> +        printk(XENLOG_ERR LIVEPATCH
> +               "Unsupported signature type: v:%u, a:%u, h:%u\n",
> +               SIGNATURE_VERSION(note.type), SIGNATURE_ALGORITHM(note.type),
> +               SIGNATURE_HASH(note.type));
> +        return -EINVAL;
> +    }
> +
> +    if ( note.size == 0 || note.size >= MAX_SIG_NOTE_SIZE )
> +    {
> +        printk(XENLOG_ERR LIVEPATCH "Invalid signature note size: %u\n",
> +               note.size);
> +        return -EINVAL;
> +    }
> +
> +    sig = xmalloc_bytes(note.size);
> +    if ( !sig )
> +        return -ENOMEM;
> +
> +    memcpy(sig, note.data, note.size);
> +
> +    /* Remove signature from data, as can't be verified with it. */
> +    memset((void *)note.data, 0, note.size);
> +    rc = check_rsa_sha256_signature(raw, size, sig, note.size);
> +
> +    xfree(sig);
> +    return rc;
> +}
> +#else
> +static int check_signature(const struct livepatch_elf *elf, void *raw,
> +                           size_t size)

As indicated before, I also think it would be nice if this redundant
function header was eliminated, but changing the #if / #else / #endif
placement.

Jan

