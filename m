Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 016C4ABFBCC
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 18:58:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992371.1376133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHmmA-0000R7-7i; Wed, 21 May 2025 16:58:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992371.1376133; Wed, 21 May 2025 16:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHmmA-0000PA-4Y; Wed, 21 May 2025 16:58:42 +0000
Received: by outflank-mailman (input) for mailman id 992371;
 Wed, 21 May 2025 16:58:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iqa2=YF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uHmm8-0000Oy-2O
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 16:58:40 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d78cd754-3664-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 18:58:39 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a3673e12c4so2821517f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 09:58:39 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca5a84csm20355774f8f.31.2025.05.21.09.58.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 09:58:38 -0700 (PDT)
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
X-Inumbo-ID: d78cd754-3664-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747846718; x=1748451518; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UPyVRz9pXq4sGeCwWjKLzIei9u3zxgHoNDinNdva4vY=;
        b=rw7mvv/F3YeVjUdcLHsjbSy4NFtiNxU2dwNdDWyLu4l2INeJmJ1pr+YUzMA96YozYa
         QT6EnqAYYUEj8n4nwfmLPZz1Hety3MfWwICAuwiGWvXr2JYh1uaqNmiXm45lrNTmoSBh
         ZAD98VNFJcQe7BJnRA8ickbDmsyQgPrUtxvc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747846718; x=1748451518;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UPyVRz9pXq4sGeCwWjKLzIei9u3zxgHoNDinNdva4vY=;
        b=DfLD/1ZT/uVOdTpRVMIFNOic+gYyTnZL81ySSlmZLbzpgOKQ7G+6Yr7n7MdmN/FKml
         IVp8Z+DvVDsp7K1Cc+qeuBi05nYBpp2W4juI5oy7eDwzLLNuvtqTkIm7WS+MjPKKtEvO
         V3mJhz138NDB3ZqU5lhh5TZCcOKEONj4OGMehqRl2PJ2v7ApU2rzePbbvA1pE4lLyLp2
         1qMpY7Vi7dg9KqPgwFTPfiDjedJte/jHXgfSKbRgX4AHRwsYayqaxOtZkyFWc7SCdaYy
         yQcx9sCHsOxBfvRMU9M6GjORCxP/NKoG8DaCP/hx1BeycFB0gkTLRj37fDLKqR1NPmcR
         4c0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXK/yARysreRDAq3A4vuxGdsZnG8tJRlyEKPpgps8aHpS3Zz/Zae/Zrn8of/lFiFRBYBqvSd/OLhjU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzBbifPEN9K4LqFyxqIoi0tYVTITo3perervRRyi9cmwl2eeD4Z
	MYCgZwdcAZgdhvUaP1zx1I1wtjwbhAN7TGSxyiBs3U2d8uR8fWI5IpbngVy2xkOrhZc=
X-Gm-Gg: ASbGncuwcCYaApBfZ4YuJi7biX/P57xZwZXtROwh/5UeL1rvlJFAZkbKePgRXFWDIkP
	VGK58XiszYjgkQoo4eL9WU/tqfOhA2J8Redi6eBgMoJTQVm/tyiZV5zUSTEg9s03GgYYCnkcg4X
	vZwm28KMMlTtalPclajsb2i1wo181+RAsuaOVcu0xQol1TYXpWW3H0Z6mCjA4MA7lmOQCHTdxIY
	JnslRpidof5gQO6cIjfKdky2EEi4ABp+mpx4XZI+WkOUZofsC+tUQKhruD2aHVXHa/cDhdCYYqn
	q2G8s0E+YmZnYGrD858fjYrvl2g2lGt1Fccj31hL+ngS1mfPLpkv3QAuLJZ8FfwOMsWh3AlRuOZ
	6zoary0JbUAJpd1fh
X-Google-Smtp-Source: AGHT+IGrffbGCaVt/A3GOj3E5l3Rd9O4oUQG3nLUQFA0w0In1SB1U8RhmuNVdZKtkIbmmlQu1GbKuA==
X-Received: by 2002:a5d:5f46:0:b0:3a0:7017:61f6 with SMTP id ffacd0b85a97d-3a35c825eefmr21237666f8f.14.1747846718497;
        Wed, 21 May 2025 09:58:38 -0700 (PDT)
Message-ID: <e3f405f8-82bf-41b5-badb-bd5ac51b1833@citrix.com>
Date: Wed, 21 May 2025 17:58:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/boot: print CPU number in bring up failure
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20250521165504.89885-1-roger.pau@citrix.com>
 <20250521165504.89885-2-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250521165504.89885-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/05/2025 5:55 pm, Roger Pau Monne wrote:
> Print the CPU ID that fails to respond to the init sequence, or that didn't
> manage to reach the "callin" state.  Expand a bit the printed error
> messages.  Otherwise the "Not responding." message is not easy to
> understand by users.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/smpboot.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
> index 0189d6c332a4..48ce996ba414 100644
> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -618,10 +618,10 @@ static int do_boot_cpu(int apicid, int cpu)
>              smp_mb();
>              if ( bootsym(trampoline_cpu_started) == 0xA5 )
>                  /* trampoline started but...? */
> -                printk("Stuck ??\n");
> +                printk("CPU%u: Didn't finish startup sequence\n", cpu);
>              else
>                  /* trampoline code not run */
> -                printk("Not responding.\n");
> +                printk("CPU%u: Not responding to startup\n", cpu);
>          }
>      }
>  

I'd suggest printing the APIC_ID too.  The next step here is always to
cross-reference with the MADT.

~Andrew

