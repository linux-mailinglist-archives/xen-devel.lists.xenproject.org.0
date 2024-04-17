Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD308A8B69
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 20:46:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707685.1105808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxAHZ-0000Nh-6K; Wed, 17 Apr 2024 18:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707685.1105808; Wed, 17 Apr 2024 18:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxAHZ-0000L2-2l; Wed, 17 Apr 2024 18:45:21 +0000
Received: by outflank-mailman (input) for mailman id 707685;
 Wed, 17 Apr 2024 18:45:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f8dp=LW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rxAHY-0000Kw-3k
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 18:45:20 +0000
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [2607:f8b0:4864:20::f2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a23c77dd-fcea-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 20:45:17 +0200 (CEST)
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-69b5de48126so365016d6.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 11:45:17 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 y8-20020ad457c8000000b0069b6d595aeesm4962126qvx.60.2024.04.17.11.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Apr 2024 11:45:15 -0700 (PDT)
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
X-Inumbo-ID: a23c77dd-fcea-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713379516; x=1713984316; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3WB46TT8zXli4tc8CTyQiuWb+XMv4FhC1zDhRjfeR3Y=;
        b=i6P50lzWH0e5ziq++5YuIJwvBxK2Fb51Uc9ugkjlKoytj/eTJCRbI6XbujtPbqa2wv
         Ror4lZoUjFAU15HHntkVso0gJGe3CPkqFfhskf57GydaCQyiFLwdk9RYSPGapuG+4Mz/
         DY3RDf0mta+o4ZKq8NIs63sBggNaCIbj2TLX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713379516; x=1713984316;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WB46TT8zXli4tc8CTyQiuWb+XMv4FhC1zDhRjfeR3Y=;
        b=SKmWrvfiIP9w+0T+UhRd95XbymRiRwK/fOwzS8JCtZVaP/T7ZUCTpMCaXdtZMbsNcV
         rIXtKB1LivKXdt+Iz4JYPl9HXQ54wmefm5pZ2+0v32wIHVFeXspU25KT6CUvs5ztGuLc
         W8EUAfaIU8/3v9BKcCp/g568NQFUcL0f1c8IbbLS6I0L2pA7IJdYOcmMiJo1mndgehFP
         7QI+8pQ7LjUnhIUn58RotGG316eNTiQbBkbLSEjlJv/ljKCJCppPfAxKHUJepsL1pOe0
         B1AzuokgDvQPgDCVPUlIZqzzSjj+tezmp/reLzS67B3vrrd6SQOu0q9gSsp/bqILRVFx
         i6Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWlaMfFO6BWTKEUOSkzBovJYsjdRfriu8z1b2pImnUN/qxpjl5WLmYS9dRDrQWnuH8w1OTICmnmpzpQ1g/hPQOs39J4QPCykKFCVqRmCe0=
X-Gm-Message-State: AOJu0Yz1Va16uv4i7QF+UMGpJ1hObFN4gN5jELIdlFcU4KXqyJa/UeeK
	gPxejCLX43a9Hn+z0V6xqeoA4mJSIofmOPnW7+9d/VV5N7Kl79eI+weeCFuYUEM=
X-Google-Smtp-Source: AGHT+IFrPlOWkqpTTWVmIx8b3dhkKkYjs6jElEBFk4Rcusd3nM9ulyDo7ipCJNjOiDuclmjY54KvSw==
X-Received: by 2002:ad4:5007:0:b0:69b:6626:7684 with SMTP id s7-20020ad45007000000b0069b66267684mr266146qvo.37.1713379516415;
        Wed, 17 Apr 2024 11:45:16 -0700 (PDT)
Message-ID: <455d2eb3-0d77-4c2a-8cd9-6a0824b9b07c@citrix.com>
Date: Wed, 17 Apr 2024 19:45:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] gzip: refactor state tracking
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240417143716.27189-1-dpsmith@apertussolutions.com>
 <20240417143716.27189-5-dpsmith@apertussolutions.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 xsFNBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABzSlBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPsLBegQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86M7BTQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAcLB
 XwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
In-Reply-To: <20240417143716.27189-5-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/04/2024 3:37 pm, Daniel P. Smith wrote:
> diff --git a/xen/common/gzip/gunzip.c b/xen/common/gzip/gunzip.c
> index 1b448d6e3655..8178a05a0190 100644
> --- a/xen/common/gzip/gunzip.c
> +++ b/xen/common/gzip/gunzip.c
> @@ -4,18 +4,25 @@
>  #include <xen/lib.h>
>  #include <xen/mm.h>
>  
> -static unsigned char *__initdata window;
> -
>  #define WSIZE           0x80000000U
>  
> -static unsigned char *__initdata inbuf;
> -static unsigned int __initdata insize;
> +struct gzip_state {
> +    unsigned char *window;
> +
> +    unsigned char *inbuf;
> +    unsigned int insize;
> +
> +    /* Index of next byte to be processed in inbuf: */
> +    unsigned int inptr;

perform_gunzip() passes in an unsigned long size, which means it's
truncated in this state.

Please at least make these size_t.  Life is too short to deal with the
fallout of this going wrong.

>  
> -/* Index of next byte to be processed in inbuf: */
> -static unsigned int __initdata inptr;
> +    /* Bytes in output buffer: */
> +    unsigned int outcnt;

See later, but I think the comment for outcnt is wrong.

>  
> -/* Bytes in output buffer: */
> -static unsigned int __initdata outcnt;
> +    long bytes_out;

See later, but I don't think this can be signed.  It's only used to
cross-check the header-reported length, which is done as an unsigned long.

> +
> +    unsigned long bb;      /* bit buffer */
> +    unsigned bk;           /* bits in bit buffer */

As this is effectively new code, "unsigned int" please.

> @@ -27,7 +34,7 @@ typedef unsigned char   uch;
>  typedef unsigned short  ush;
>  typedef unsigned long   ulg;
>  
> -#define get_byte()      (inptr < insize ? inbuf[inptr++] : fill_inbuf())
> +#define get_byte()     (s->inptr < s->insize ? s->inbuf[s->inptr++] : fill_inbuf())

This is a bit weird:
> $ git grep -w get_byte common/gzip
> common/gzip/gunzip.c:40:#define get_byte()     (s->inptr < s->insize ?
> s->inbuf[s->inptr++] : fill_inbuf())
> common/gzip/inflate.c:224:#define NEXTBYTE(s)  ({ int v = get_byte();
> if (v < 0) goto underrun; (uch)v; })
> common/gzip/inflate.c:1131:    flags  = (uch)get_byte();

NEXTBYTE() gets an s parameter, but doesn't pass it to get_byte() and
instead relies on state always having the name 's' in scope.

I'd suggest turning get_byte() into a proper static function.  It will
be more readable that throwing extra ()'s around s in the existing macro.

Except...  fill_inbuf() is a fatal error anyway, so that can be folded
together to simplify the result.


> @@ -72,16 +78,16 @@ static __init void flush_window(void)
>      unsigned int n;
>      unsigned char *in, ch;
>  
> -    in = window;
> -    for ( n = 0; n < outcnt; n++ )
> +    in = s->window;
> +    for ( n = 0; n < s->outcnt; n++ )
>      {
>          ch = *in++;
>          c = crc_32_tab[((int)c ^ ch) & 0xff] ^ (c >> 8);
>      }
>      crc = c;
>  
> -    bytes_out += (unsigned long)outcnt;
> -    outcnt = 0;
> +    s->bytes_out += (unsigned long)s->outcnt;

I can't figure out why this was written this way, even originally.

AFAICT, outcnt doesn't even match it's comment.

/* Bytes in output buffer: */

It looks like it's the number of bytes in window.  This also matches the
"wp" define which I guess is "window position".

Anyway, irrespective of naming, the cast is useless so lets drop it
while modifying the line.

> diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
> index 512d9bf0ee2e..5735bbcf7eb4 100644
> --- a/xen/common/gzip/inflate.c
> +++ b/xen/common/gzip/inflate.c
> @@ -119,7 +119,7 @@ static char rcsid[] = "#Id: inflate.c,v 0.14 1993/06/10 13:27:04 jloup Exp #";
>  
>  #endif /* !__XEN__ */
>  
> -#define slide window
> +#define slide s->window

Given only 8 uses, I'd expand this in place and drop the macro.

But, there's an entire comment block discussing "slide" which I think is
wrong for Xen's implementation.  That wants to go too, I think.

>  
>  /*
>   * Huffman code lookup table entry--this entry is four bytes for machines
> @@ -143,12 +143,12 @@ struct huft {
>  static int huft_build OF((unsigned *, unsigned, unsigned,
>                            const ush *, const ush *, struct huft **, int *));
>  static int huft_free OF((struct huft *));
> -static int inflate_codes OF((struct huft *, struct huft *, int, int));
> -static int inflate_stored OF((void));
> -static int inflate_fixed OF((void));
> -static int inflate_dynamic OF((void));
> -static int inflate_block OF((int *));
> -static int inflate OF((void));
> +static int inflate_codes OF((struct gzip_state *, struct huft *, struct huft *, int, int));
> +static int inflate_stored OF((struct gzip_state *));
> +static int inflate_fixed OF((struct gzip_state *));
> +static int inflate_dynamic OF((struct gzip_state *));
> +static int inflate_block OF((struct gzip_state *, int *));
> +static int inflate OF((struct gzip_state *));

These are the only users of OF, and it turns out it's a no-op macro. 
This code would be far-less WTF-worthy if it was expanded as part of
patch 1.

>  
>  /*
>   * The inflate algorithm uses a sliding 32 K byte window on the uncompressed
> @@ -162,8 +162,8 @@ static int inflate OF((void));
>   * must be in unzip.h, included above.
>   */
>  /* unsigned wp;             current position in slide */
> -#define wp outcnt
> -#define flush_output(w) (wp=(w),flush_window())
> +#define wp s->outcnt
> +#define flush_output(s, w) (wp=(w),flush_window(s))

The combination of these two isn't safe, I don't think, especially as
one caller passes wp into flush_output().

There are very few users of wp, so expand it in line, and turn
flush_output() into a static function.  In particular, it will make ...

> @@ -560,8 +557,8 @@ static int __init inflate_codes(
>  
>  
>      /* make local copies of globals */
> -    b = bb;                       /* initialize bit buffer */
> -    k = bk;
> +    b = s->bb;                   /* initialize bit buffer */
> +    k = s->bk;
>      w = wp;                       /* initialize window position */

... this look less weird.  I'd suggest dropping the remark about "globals".


> @@ -1157,18 +1157,18 @@ static int __init gunzip(void)
>          error("Input has invalid flags");
>          return -1;
>      }
> -    NEXTBYTE(); /* Get timestamp */
> -    NEXTBYTE();
> -    NEXTBYTE();
> -    NEXTBYTE();
> +    NEXTBYTE(s); /* Get timestamp */
> +    NEXTBYTE(s);
> +    NEXTBYTE(s);
> +    NEXTBYTE(s);
>  
> -    (void)NEXTBYTE();  /* Ignore extra flags for the moment */
> -    (void)NEXTBYTE();  /* Ignore OS type for the moment */
> +    (void)NEXTBYTE(s);  /* Ignore extra flags for the moment */
> +    (void)NEXTBYTE(s);  /* Ignore OS type for the moment */

I'd drop these (void) casts. They're not different to the timestamp above.

> @@ -1224,13 +1224,13 @@ static int __init gunzip(void)
>          error("crc error");
>          return -1;
>      }
> -    if (orig_len != bytes_out) {
> +    if (orig_len != s->bytes_out) {
>          error("length error");
>          return -1;
>      }
>      return 0;
>  
> - underrun:   /* NEXTBYTE() goto's here if needed */
> + underrun:   /* NEXTBYTE(s) goto's here if needed */
>      error("out of input data");
>      return -1;

Just for completeness, this is a dead path because fill_inbuf() is
implemented as panic().

Fixing this wants putting on a todo list somewhere.

~Andrew

