Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D19A69666F5
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 18:31:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786528.1196098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk4Wl-0002oA-TI; Fri, 30 Aug 2024 16:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786528.1196098; Fri, 30 Aug 2024 16:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk4Wl-0002m0-QR; Fri, 30 Aug 2024 16:31:11 +0000
Received: by outflank-mailman (input) for mailman id 786528;
 Fri, 30 Aug 2024 16:31:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YGfl=P5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sk4Wk-0002ls-FG
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 16:31:10 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 420acf57-66ed-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 18:31:07 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a8679f534c3so211486366b.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Aug 2024 09:31:07 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988feb1b8sm230985666b.38.2024.08.30.09.31.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Aug 2024 09:31:05 -0700 (PDT)
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
X-Inumbo-ID: 420acf57-66ed-11ef-a0b1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725035467; x=1725640267; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tVwyDbMKzTjeM5/tUK//WOodT3aZ3ZT6PJ86JPXdyU0=;
        b=F6RB4rrpDRXuK8OO2eMiv8Vtiy6XB7+DnZLwFDCG5h48+R+uOiNQBoMI+0HriGihbn
         f45cvDCi4+h7INHiCbAA8redswS+QqRoecbrlQLGHj11Zo9CLVxnOUZVqpyYofTebwjL
         qpRFCVF4zdnXrMiTvFE5okiDDEz9okaR3ZjG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725035467; x=1725640267;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVwyDbMKzTjeM5/tUK//WOodT3aZ3ZT6PJ86JPXdyU0=;
        b=AhGkhgT+CBZ9L+gD90wmYsk7rTCD6WOEXZaG5sHq6/nSovlzQxqUr1FdTPn04DnBf0
         HOSCN25WOb7ywX4z9tlnnbhxMBIrFzouIxIVQrg54d4lQWQ2IXANKaSQomIrV3poFnpl
         QC1B5BLf/jjWZBbZYBOmn54U6VhtaVOmN2PRS/1m1brU/AinifkP5/NNVVapKrFHzioS
         yKkdOdfnGHX6qLNo9cUQVtAq/M7gSYEjyOLs7lWEqIOUmV8F/JosZub2emhPgWLEeAz4
         aUskGE8HWYRGygxENshrvgYM0ZftTfBE2r44TCfaimkhR6BJ2EfEi662Nc+3blmR51cW
         eCqA==
X-Forwarded-Encrypted: i=1; AJvYcCU4Gxe+OG64de4yCj00E980Ne6snAhBkLsCPspZX0a6a0arinMOBEhIWG/v+F25SiTXtN5ZXYM+QVk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIW4LLLqS+orc0Zc2EmbPGXfJB25Hpc/6PrulJ9D92NrG9Dzmw
	5Tm8pjV7K0zo2Bs2oFqT1bpg1NivStXcsJt5ZzAtmuLNJm5eZTBTa2jpu9WzTXk=
X-Google-Smtp-Source: AGHT+IENfdzpxG6hDkgLJyZExNc4MOXW0kQH/ewg6rYOmhNiRE25V2Ew/waXQ6SKCNKbtnLq3HRB0w==
X-Received: by 2002:a17:907:980f:b0:a7a:929f:c0cf with SMTP id a640c23a62f3a-a897f83ad77mr583139866b.21.1725035466278;
        Fri, 30 Aug 2024 09:31:06 -0700 (PDT)
Message-ID: <ca2aa9b3-44cf-4a44-9111-1d7e8c9b4dff@citrix.com>
Date: Fri, 30 Aug 2024 17:31:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/time: prefer CMOS over EFI_GET_TIME
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
References: <20240830095220.49473-1-roger.pau@citrix.com>
 <20240830095220.49473-3-roger.pau@citrix.com>
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
In-Reply-To: <20240830095220.49473-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/08/2024 10:52 am, Roger Pau Monne wrote:
> The EFI_GET_TIME implementation is well known to be broken for many firmware
> implementations, for Xen the result on such implementations are:
>
> ----[ Xen-4.19-unstable  x86_64  debug=y  Tainted:   C    ]----
> CPU:    0
> RIP:    e008:[<0000000062ccfa70>] 0000000062ccfa70
> [...]
> Xen call trace:
>    [<0000000062ccfa70>] R 0000000062ccfa70
>    [<00000000732e9a3f>] S 00000000732e9a3f
>    [<ffff82d04034f34f>] F arch/x86/time.c#get_cmos_time+0x1b3/0x26e
>    [<ffff82d04045926f>] F init_xen_time+0x28/0xa4
>    [<ffff82d040454bc4>] F __start_xen+0x1ee7/0x2578
>    [<ffff82d040203334>] F __high_start+0x94/0xa0
>
> Pagetable walk from 0000000062ccfa70:
>  L4[0x000] = 000000207ef1c063 ffffffffffffffff
>  L3[0x001] = 000000005d6c0063 ffffffffffffffff
>  L2[0x116] = 8000000062c001e3 ffffffffffffffff (PSE)
>
> ****************************************
> Panic on CPU 0:
> FATAL PAGE FAULT
> [error_code=0011]
> Faulting linear address: 0000000062ccfa70
> ****************************************
>
> Swap the preference to default to CMOS first, and EFI later, in an attempt to
> use EFI_GET_TIME as a last resort option only.  Note that Linux for example
> doesn't allow calling the get_time method, and instead provides a dummy handler
> that unconditionally returns EFI_UNSUPPORTED on x86-64.
>
> Such change in the preferences requires some re-arranging of the function
> logic, so that panic messages with workaround suggestions are suitably printed.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/time.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
> index 272ca2468ea6..0eee954809a9 100644
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1305,24 +1305,36 @@ static unsigned long get_cmos_time(void)
>      static bool __read_mostly cmos_rtc_probe;
>      boolean_param("cmos-rtc-probe", cmos_rtc_probe);
>  
> +    if ( likely(!(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC)) )
> +        cmos_rtc_probe = false;
> +
> +    if ( (!(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC) ||
> +          cmos_rtc_probe) && read_cmos_time(&rtc, cmos_rtc_probe) )
> +        return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);
> +
>      if ( efi_enabled(EFI_RS) )
>      {
>          unsigned long res = efi_get_time();
>  
>          if ( res )
>              return res;
> +
> +        panic("Broken EFI_GET_TIME %s\n",
> +              !cmos_rtc_probe ? "try booting with \"cmos-rtc-probe\" option"
> +                              : "and no CMOS RTC found");
>      }
>  
> -    if ( likely(!(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC)) )
> -        cmos_rtc_probe = false;
> -    else if ( system_state < SYS_STATE_smp_boot && !cmos_rtc_probe )
> +    /*
> +     * No viable clock source found.  Attempt to provide some guidance to the
> +     * user about possible workarounds to boot Xen on the system.
> +     */
> +    ASSERT(system_state < SYS_STATE_smp_boot);
> +
> +    if ( !cmos_rtc_probe )
>          panic("System with no CMOS RTC advertised must be booted from EFI"
>                " (or with command line option \"cmos-rtc-probe\")\n");
>  
> -    if ( unlikely(!read_cmos_time(&rtc, cmos_rtc_probe)) )
> -        panic("No CMOS RTC found - system must be booted from EFI\n");
> -
> -    return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);
> +    panic("No CMOS RTC found - system must be booted from EFI\n");
>  }
>  
>  static unsigned int __ro_after_init cmos_alias_mask;

Hmm, I know I said "fix the crash first, cleanup later" on the prior
patch, but I'm tempted to retract that.  This is very hard to follow.

Going back to first principles, at runtime we need USE_{XEN,RTC,EFI} to
select between the various methods available.

At boot, we need to figure out what to do.  I think we want an
init_wallclock_time() split out of get_cmos_time() (which is badly named
anyway, given EFI), and called from init_xen_time() only.  In
particular, the init stuff should not be re-evaluated in
time_{suspend,resume}().

Various details we have to work with:

 * ACPI_FADT_NO_CMOS_RTC, although we know this is falsely set on some
platforms, hence the whole probing logic.

 * Booted on an EFI system, although we know EFI_GET_TIME is broken on
millions of systems, and we only find this out with a #PF in the middle
of EFI-RS.  Furthermore, more-major-OSes-than-us strictly veto the use
of this service, and it's not only Linux; it's Windows too.

Personally, I think "cmos-rtc-probe" is inappropriate/insufficient.  It
ought to be wc-time=guess|xen|rtc|efi.  We should be able to influence
the behaviour more than a boolean "probe or not".  The Xen case might be
better as "hypervisor", although I can't see any evidence of Viridian
having a virtualised wallclock interface.

I think the init logic wants to be:
 * If ACPI says we have an RTC, use it.
 * If ACPI says we have no RTC, probe to see if it's really there.
 * If we genuinely seem to not have an RTC, probe EFI.  This would be
quite invasive in the #PF handler, but not impossible.


That said, I'm still holding out hope that we can simply delete Xen's
need for wallclock time.  Xen only uses wallclock time for the
non-default console_timestamps=date, but even then it's uncorrelate with
dom0 changing the platform time, leading to actively-misleading log
files.  There's a reason why "time since boot" is the norm.

~Andrew

