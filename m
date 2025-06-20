Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 614B4AE18EE
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 12:31:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020803.1396938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSZ1i-0007hj-Eg; Fri, 20 Jun 2025 10:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020803.1396938; Fri, 20 Jun 2025 10:31:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSZ1i-0007f7-BR; Fri, 20 Jun 2025 10:31:18 +0000
Received: by outflank-mailman (input) for mailman id 1020803;
 Fri, 20 Jun 2025 10:31:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQmk=ZD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uSZ1h-0007f1-SP
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 10:31:17 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b28761be-4dc1-11f0-a30e-13f23c93f187;
 Fri, 20 Jun 2025 12:31:16 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-450ccda1a6eso15164925e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jun 2025 03:31:16 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4535eac8e19sm54523785e9.21.2025.06.20.03.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 03:31:15 -0700 (PDT)
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
X-Inumbo-ID: b28761be-4dc1-11f0-a30e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750415476; x=1751020276; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Zu2JUyMtVf4W61pXTxOrDQ/5q2YnhtKq7a8USSKDZs=;
        b=kbRFVpxyfWPljtuTDJduwNpXcAAokxTdTJ5OcmNo+o9snM58xu0dT9bmBWiJIvKbCY
         QaRTDVdKSzJoGbUvcNoZVZuN74pPiFQBy0MD4RCVLUv12jh5otJc4A30g8/+JwJL1Qvq
         iYfGvbCOE0z07tECXrLnufI7HaUs9T1eySGfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750415476; x=1751020276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Zu2JUyMtVf4W61pXTxOrDQ/5q2YnhtKq7a8USSKDZs=;
        b=q/C0W7ZYMYE7obkZyk+pVsgc50y/gAQIfTeUmsdK6/QERLrXHhlDYOH6QbyFkeM596
         4aJWELFNKzfdXvqXivx+MaEM7HVLLHWN4ZzVNkNJ90o6YSf/YpNYSHmB+1jvfAGSmRjn
         59wzKOvRe1EFA7gBpesYDurpU3w94UAp5ecIg3HyVRau9lr7s8MObXt6csojlJ2nEbNW
         7Xz/JnIbMrDmcG1O44PahQQpuVLlBb3VT1umKPwkHidvgYNppZl/dolNhOAc/y3cC/Z2
         i9ViXF4A2bMRqt1C+GyKXi6T7LOdU5OFy2ccs8rv81T5Zi/MV0mwJem9k5XVbwij/AuH
         w2OA==
X-Gm-Message-State: AOJu0YxaZID2yh1n6si752ldJkY7nXCLwKMPd8uMjKm9Oki4smePk+2G
	NrrDtnjnEyotYAPeMG03OELZ4I0ysGHy9tFzwLKREJ8k9LIcsOTjsesxwKfjlPmpnmQ=
X-Gm-Gg: ASbGnctzyohq62sJECXSg3au/SMcPRVgE0EcH+zfNzCsYeDE2LYkDQeOh3VgpKsU1ly
	G+0vgFntG/b+4XQm4D1U7llNRZbBRhHYQbJ3x0NL5SiytqAS3OsotFZzM/QPW40S/ZYXXZa6fLL
	wvt+P4LAzXu/tR0eQEfRRy9bDVQrqCffw9Kfcv8OXOJ7q+MAYgNW8bzlKnBwCGFi03EaXzpD/2N
	/JEcuk/nZoyyAGmQf+J+WT5lFn2hQkly3WWIROI+IGMx7riJoX4hAy7xAysoM4BrR0C04kU8TAX
	VXpWEKEVsEwhvnboSdJtmQGbnu/1ZHGAMmQ0kY+QcSI3JPCaVQh6Ty65r2RuCpwQvKK3Ov7KsPx
	68VDy1dQDI2EmmyIWp9o4HTs0KCkIRQ==
X-Google-Smtp-Source: AGHT+IEzeDSOLbShiPaJpgwwCdMMxx81y4RPsn8wh8l2SUxKq2E7MgBxcUUJa4mtdDW4U+bu1XCI5Q==
X-Received: by 2002:a05:600c:8905:b0:450:cabd:b4a9 with SMTP id 5b1f17b1804b1-45365a051a2mr16694785e9.29.1750415476182;
        Fri, 20 Jun 2025 03:31:16 -0700 (PDT)
Date: Fri, 20 Jun 2025 12:31:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Jennifer Herbert <jennifer.herbert@cloud.com>
Subject: Re: [PATCH v3 5/5] livepatch: Verify livepatch signatures
Message-ID: <aFU4csM2UFNeCykO@macbook.local>
References: <20250602133639.2871212-1-ross.lagerwall@citrix.com>
 <20250602133639.2871212-6-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250602133639.2871212-6-ross.lagerwall@citrix.com>

On Mon, Jun 02, 2025 at 02:36:37PM +0100, Ross Lagerwall wrote:
> From: Jennifer Herbert <jennifer.herbert@cloud.com>
> 
> Verify livepatch signatures against the embedded public key in Xen.
> Failing to verify does not prevent the livepatch from being loaded.
> In future, this will be changed for certain cases (e.g. when Secure Boot
> is enabled).
> 
> Signed-off-by: Jennifer Herbert <jennifer.herbert@cloud.com>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
> 
> In v3:
> 
> * Minor style fixes
> 
>  xen/common/livepatch.c          | 103 ++++++++++++++++++++++++++++++++
>  xen/common/livepatch_elf.c      |  55 +++++++++++++++++
>  xen/include/xen/livepatch.h     |  10 ++++
>  xen/include/xen/livepatch_elf.h |  18 ++++++
>  4 files changed, 186 insertions(+)
> 
> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> index 92d1d342d872..56a3d125483f 100644
> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -14,6 +14,7 @@
>  #include <xen/mpi.h>
>  #include <xen/rsa.h>
>  #include <xen/sched.h>
> +#include <xen/sha2.h>
>  #include <xen/smp.h>
>  #include <xen/softirq.h>
>  #include <xen/spinlock.h>
> @@ -525,6 +526,106 @@ static int check_xen_buildid(const struct livepatch_elf *elf)
>      return 0;
>  }
>  
> +#ifdef CONFIG_PAYLOAD_VERIFY
> +static int check_rsa_sha256_signature(void *data, size_t datalen,
> +                                      void *sig, uint32_t siglen)

I think both data and sig could be const here?

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
> +#endif
> +
> +static int check_signature(const struct livepatch_elf *elf, void *raw,
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

FWIW, it's a nit, but I think there are too many exclamation marks in
the error message above:

"Error, multiple signatures found\n"

Would be better.

I'm also wondering, would it make sense to allow multiple signatures
to be present?  I guess not because livepatches are built for specific
Xen binaries, and then we know exactly which key is embedded there.  A
livepatch would never apply to two different builds with different
keys.

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
> +#else
> +    return -EINVAL;

EOPNOTSUPP would be more accurate here.

> +#endif
> +}
> +
>  static int check_special_sections(const struct livepatch_elf *elf)
>  {
>      unsigned int i;
> @@ -1162,6 +1263,8 @@ static int load_payload_data(struct payload *payload, void *raw, size_t len)
>      if ( rc )
>         goto out;
>  
> +    check_signature(&elf, raw, len);

Wouldn't it make more sense to unconditionally fail here if
CONFIG_PAYLOAD_VERIFY is enabled and signature verification fails?

IOW: if you built an hypervisor with PAYLOAD_VERIFY enabled signature
verification needs to be enforced.

> +
>      rc = move_payload(payload, &elf);
>      if ( rc )
>          goto out;
> diff --git a/xen/common/livepatch_elf.c b/xen/common/livepatch_elf.c
> index 25ce1bd5a0ad..b27c4524611d 100644
> --- a/xen/common/livepatch_elf.c
> +++ b/xen/common/livepatch_elf.c
> @@ -23,6 +23,61 @@ livepatch_elf_sec_by_name(const struct livepatch_elf *elf,
>      return NULL;
>  }
>  
> +int livepatch_elf_note_by_names(const struct livepatch_elf *elf,
> +                                const char *sec_name, const char *note_name,
> +                                const unsigned int type,
> +                                livepatch_elf_note *note)
> +{
> +     const struct livepatch_elf_sec *sec = livepatch_elf_sec_by_name(elf,
> +                                                                     sec_name);
> +     if ( !sec )
> +           return -ENOENT;
> +
> +     note->end = sec->addr + sec->sec->sh_size;
> +     note->next = sec->addr;
> +
> +     return livepatch_elf_next_note_by_name(note_name, type, note);
> +}
> +
> +int livepatch_elf_next_note_by_name(const char *note_name,
> +                                    const unsigned int type,
> +                                    livepatch_elf_note *note)
> +{
> +     const Elf_Note *pkd_note = note->next;
> +     size_t notenamelen = strlen(note_name) + 1;
> +     size_t note_hd_size;
> +     size_t note_size;
> +     size_t remaining;
> +
> +     while ( (void *)pkd_note < note->end )
> +     {
> +

Stray newline?

remaining and note_hd_size can be defined inside of the loop to reduce
the scope.

> +         remaining = note->end - (void *)pkd_note;
> +         if ( remaining < sizeof(livepatch_elf_note) )
> +             return -EINVAL;
> +
> +         note_hd_size = sizeof(Elf_Note) + ((pkd_note->namesz + 3) & ~0x3);
> +         note_size = note_hd_size + ((pkd_note->descsz + 3) & ~0x3);

Could be have a macro or similar for this ((x + 3) & ~0x3)
manipulation?

> +         if ( remaining < note_size )
> +             return -EINVAL;

ENOSPC might be less ambiguous than EINVAL for both the above?

> +
> +         if ( notenamelen == pkd_note->namesz &&
> +              !memcmp(note_name, (const void *) pkd_note + sizeof(Elf_Note),
> +                      notenamelen) &&
> +              (type == -1 || pkd_note->type == type) )
> +         {
> +             note->size = pkd_note->descsz;
> +             note->type = pkd_note->type;
> +             note->data = (void *)pkd_note + note_hd_size;
> +             note->next = (void *)pkd_note + note_size;
> +             return 0;
> +         }
> +         pkd_note = (void *)pkd_note + note_size;
> +     }

It's a nit, but I would write this as a for loop, as it's clearer then
the index advance:

for ( pkd_note = note->next; (void *)pkd_note < note->end;
      pkd_note = (void *)pkd_note + note_size )
{
...

> +
> +     return -ENOENT;
> +}
> +
>  static int elf_verify_strtab(const struct livepatch_elf_sec *sec)
>  {
>      const Elf_Shdr *s;
> diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
> index 52f90cbed45b..12206ce3b2b8 100644
> --- a/xen/include/xen/livepatch.h
> +++ b/xen/include/xen/livepatch.h
> @@ -38,6 +38,7 @@ struct xen_sysctl_livepatch_op;
>  #define ELF_LIVEPATCH_DEPENDS     ".livepatch.depends"
>  #define ELF_LIVEPATCH_XEN_DEPENDS ".livepatch.xen_depends"
>  #define ELF_BUILD_ID_NOTE         ".note.gnu.build-id"
> +#define ELF_XEN_SIGNATURE         ".note.Xen.signature"
>  #define ELF_LIVEPATCH_LOAD_HOOKS      ".livepatch.hooks.load"
>  #define ELF_LIVEPATCH_UNLOAD_HOOKS    ".livepatch.hooks.unload"
>  #define ELF_LIVEPATCH_PREAPPLY_HOOK   ".livepatch.hooks.preapply"
> @@ -49,6 +50,15 @@ struct xen_sysctl_livepatch_op;
>  /* Arbitrary limit for payload size and .bss section size. */
>  #define LIVEPATCH_MAX_SIZE     MB(2)
>  
> +#define SIGNATURE_VERSION(type) ((type) & 0xffff)
> +#define LIVEPATCH_SIGNATURE_VERSION 1
> +
> +#define SIGNATURE_ALGORITHM(type) (((type) >> 16) & 0xff)
> +#define SIGNATURE_ALGORITHM_RSA 0
> +
> +#define SIGNATURE_HASH(type) (((type) >> 24) & 0xff)
> +#define SIGNATURE_HASH_SHA256 0

You could possibly use MASK_EXTR() for the macros above?

Thanks, Roger.

