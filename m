Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3B1ACEEB7
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 13:52:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006717.1385943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN98m-0002Xv-W1; Thu, 05 Jun 2025 11:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006717.1385943; Thu, 05 Jun 2025 11:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN98m-0002WP-TH; Thu, 05 Jun 2025 11:52:12 +0000
Received: by outflank-mailman (input) for mailman id 1006717;
 Thu, 05 Jun 2025 11:52:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uN98l-0002WJ-K7
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 11:52:11 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82b531b0-4203-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 13:52:09 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a365a6804eso637888f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 04:52:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3132c0bee0csm1361977a91.47.2025.06.05.04.52.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 04:52:08 -0700 (PDT)
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
X-Inumbo-ID: 82b531b0-4203-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749124329; x=1749729129; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EReIriDEQXp6cLyaYJEvTn78WU91hQ9ZJ8NIrV1XUGc=;
        b=NYnaH8JusKzVaaOwIcmQ8f8Z11wMvTCimsHL9HPTy9w6M6GPxyGd5bcZn31yQwStud
         fPX76OUkZe5w+4ELY10jqUS+ndr0+/oAxo+Y/5E3BDVdSaFCT9FPNSFLzHR7WYtX4+5D
         YAXpRl24+WNUKsgyN2MwcOPIfqDOuIt5vt+udNJ+jiflku6LLmYnnMoZktXxOfJThecH
         kdzqLW8S5FWrzAYeSh1ur62u/xnbNcuPL/Uv5TLD5dwxD37UEcICG5BAL1idPj55cXJt
         K+BDJ78sROSbc9ZlL2/z7BNGwpkPzc7dh/9Y/qxYvLOV+5aro1m+lXr5Qf1n7rvXTbre
         MiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749124329; x=1749729129;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EReIriDEQXp6cLyaYJEvTn78WU91hQ9ZJ8NIrV1XUGc=;
        b=CYq9n4IYkcTW7/YsWT0S87NN7oKBQcuCPA1l4Y/VLbaDJxf9dkPY2+eJLdHcM1odZ7
         OjUI119o7tb0mnLJ6HTq7FB5r8GQbZo7VVf2OZeoD8QkqPesW9j4Spj3PPE/Uxzvc2Wq
         C1tHF82+2chFln93UDXjR2Lwk9+sqEuuoEZXlXGvX1Qa53j/zf3FLNNCxtzbvgALquXc
         xnTl0dusHQsw3IOWPpYXFY+A4wVPodxvQwjy6K/n7k8yPM/2EcWFxx3I8DUTPgU3/lP2
         t3sT+/oHCHVDm6DG34KQ4uPKt7AoxXQIanQv9DkKkR1MsYlPW3iLPriV9zpocRdL9AXP
         FyFg==
X-Forwarded-Encrypted: i=1; AJvYcCU+Zzf9DNvhuXyCr7Eq/O5/Ajg7Mt7owtxvvhThlUIb6iCJeJNmR4EXBnjtCwbw+5ALTPqMbb4E8rI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwrJlON8Z6mwGmwUkNr9baWKw5GEUrcVM829npvVshSDp4CELb
	mumaR519vsX31fy5ft0Y3F+aHCooU16I+o3YWgsL2d4LG5vMUjnXaR19a4EhfeCeBQ==
X-Gm-Gg: ASbGncvE/kS10b4foIYo6kKYWFUUwMGNB39MrXRzg34SUU3uf/EwK3z+2T9OrQpCGf9
	0vq0gNV6SyXdtauPCASzXQcVwnHUauU6hyJa7tkRFNR1mcLG4viP16RbXHxuWLF4WEYfWuF7D9j
	ULKFIP5PJyreU13lvI2wbNJsUBnQR6aKm0O4OiDrmiyc/vzuoZxQBjGkM6CPcTw7HFGfwa4aUqW
	RKR145mbroZh6C7S1JNrIihds9PR4WV7FIhnF1HrX9AaGtFQsox5a85RevpLaKrzck9Dqn0Vilw
	ci4O2UPi4oslw6M4uMLtxKj2gZX7g93sdZyo49afhEU9GRXTUxvsu89Romo88+48yPOtPXwmNzs
	oDRSf9YGIJ8VNxcsHqmHvHQV0Tu34ghpxDopE
X-Google-Smtp-Source: AGHT+IHjXgUzV5D6bLMcskK4eG/BYyk3buMkeoqG7VwR7efRcL9C6K/iklOKRQfNn8T5jxXTr1IkLQ==
X-Received: by 2002:a5d:5850:0:b0:3a4:f50b:ca2 with SMTP id ffacd0b85a97d-3a51d8ef67cmr5374927f8f.8.1749124328809;
        Thu, 05 Jun 2025 04:52:08 -0700 (PDT)
Message-ID: <8e27de1a-0534-4c22-9c62-fe292779e2a3@suse.com>
Date: Thu, 5 Jun 2025 13:52:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] livepatch: Verify livepatch signatures
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250602133639.2871212-1-ross.lagerwall@citrix.com>
 <20250602133639.2871212-6-ross.lagerwall@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20250602133639.2871212-6-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.06.2025 15:36, Ross Lagerwall wrote:
> @@ -525,6 +526,106 @@ static int check_xen_buildid(const struct livepatch_elf *elf)
>      return 0;
>  }
>  
> +#ifdef CONFIG_PAYLOAD_VERIFY
> +static int check_rsa_sha256_signature(void *data, size_t datalen,
> +                                      void *sig, uint32_t siglen)
> +{
> +    struct sha2_256_state hash;
> +    MPI s;
> +    int rc;
> +
> +    s = mpi_read_raw_data(sig, siglen);

sig apparently being an input, can't the function parameter be pointer-to-const?

> +    if ( !s )
> +    {
> +        printk(XENLOG_ERR LIVEPATCH "Failed to mpi_read_raw_data\n");

Both there and ...

> +        return -ENOMEM;
> +    }
> +
> +    sha2_256_init(&hash);
> +    sha2_256_update(&hash, data, datalen);
> +
> +    rc = rsa_sha256_verify(&builtin_payload_key, &hash, s);
> +    if ( rc )
> +        printk(XENLOG_ERR LIVEPATCH "rsa_sha256_verify failed: %d\n", rc);

... here: Instead of mentioning function names, perhaps better to say in normal
word what failed. E.g. here "RSA/SHA256 verification failed".

> +    mpi_free(s);
> +
> +    return rc;
> +}
> +#endif
> +
> +static int check_signature(const struct livepatch_elf *elf, void *raw,

"raw" is an input only, too, isn't it? As such it ought to be const void *.

> +                           size_t size)
> +{
> +#ifdef CONFIG_PAYLOAD_VERIFY
> +#define MAX_SIG_NOTE_SIZE 1024
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

I can see why finding another signature of the same type might be a problem,
but one of a different type should be fine (i.e. unambiguous), I suppose.
Irrespective I find it slightly odd that you pass in a pointer to the same
local variable. The function, after all, is free to alter that variable
ahead of encountering the next matching note.

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

In principle new code is supposed to be using functions from the xvmalloc()
family. (That family deliberately does not include xvmalloc_bytes(). I think
you mean xmalloc_array() here anyway.)

> @@ -1162,6 +1263,8 @@ static int load_payload_data(struct payload *payload, void *raw, size_t len)
>      if ( rc )
>         goto out;
>  
> +    check_signature(&elf, raw, len);

You entirely ignore the return value? (I was first wondering why the stub variant
of the function would return -EINVAL rather than 0.)

> --- a/xen/common/livepatch_elf.c
> +++ b/xen/common/livepatch_elf.c
> @@ -23,6 +23,61 @@ livepatch_elf_sec_by_name(const struct livepatch_elf *elf,
>      return NULL;
>  }
>  
> +int livepatch_elf_note_by_names(const struct livepatch_elf *elf,
> +                                const char *sec_name, const char *note_name,

So the plural in the function name is because it's both a section and a note
name, whereas ...

> +                                const unsigned int type,
> +                                livepatch_elf_note *note)
> +{
> +     const struct livepatch_elf_sec *sec = livepatch_elf_sec_by_name(elf,
> +                                                                     sec_name);
> +     if ( !sec )
> +           return -ENOENT;

(Nit: Too deep indentation.)

> +     note->end = sec->addr + sec->sec->sh_size;
> +     note->next = sec->addr;
> +
> +     return livepatch_elf_next_note_by_name(note_name, type, note);
> +}
> +
> +int livepatch_elf_next_note_by_name(const char *note_name,
> +                                    const unsigned int type,
> +                                    livepatch_elf_note *note)

... here you only look for further instances in the previously found section.
What if there's a 2nd section of the given name?

livepatch_elf_sec_by_name() also doesn't look to be making sure the section is
of the correct type.

Why is it necessary o pass in the note name again? A typical "find next" would
find the same kind as the "find first" did. Whereas here by passing in a
different name one can achieve "interesting" results. (Getting this correct
may not be necessary, but a comment would then want putting ahead of the
function.)

> +{
> +     const Elf_Note *pkd_note = note->next;
> +     size_t notenamelen = strlen(note_name) + 1;
> +     size_t note_hd_size;
> +     size_t note_size;
> +     size_t remaining;
> +
> +     while ( (void *)pkd_note < note->end )

Misra objects to the casting away of type qualifiers (and I do, too). More such
further down (and at least one instance also further up).

> +     {
> +

Nit: Stray blank line. Perhaps you really meant to move some of the variable
declarations here?

> +         remaining = note->end - (void *)pkd_note;
> +         if ( remaining < sizeof(livepatch_elf_note) )
> +             return -EINVAL;
> +
> +         note_hd_size = sizeof(Elf_Note) + ((pkd_note->namesz + 3) & ~0x3);
> +         note_size = note_hd_size + ((pkd_note->descsz + 3) & ~0x3);

What use are the 0x prefixes here (and then only on 2 of the three instances)?

> +         if ( remaining < note_size )
> +             return -EINVAL;
> +
> +         if ( notenamelen == pkd_note->namesz &&
> +              !memcmp(note_name, (const void *) pkd_note + sizeof(Elf_Note),

Nit: Stray blank between cast and cast value.

Jan

