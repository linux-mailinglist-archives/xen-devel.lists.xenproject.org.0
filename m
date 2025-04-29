Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BFCAA1B3C
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 21:14:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973011.1361252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9qOp-0008PT-Jd; Tue, 29 Apr 2025 19:13:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973011.1361252; Tue, 29 Apr 2025 19:13:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9qOp-0008N5-H1; Tue, 29 Apr 2025 19:13:47 +0000
Received: by outflank-mailman (input) for mailman id 973011;
 Tue, 29 Apr 2025 19:13:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yPhw=XP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u9qOn-0008Mw-K8
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 19:13:45 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ed1ec03-252e-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 21:13:39 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so45061765e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 12:13:39 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073cbf030sm14702049f8f.46.2025.04.29.12.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 12:13:38 -0700 (PDT)
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
X-Inumbo-ID: 0ed1ec03-252e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745954019; x=1746558819; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UX6tO0/f8tzM35VSZEpfCuQP+GztRd/ihEJf8UXpFmQ=;
        b=bRHOcZdxoE10EC7Rp7wN5NaUNXO0DPv/BFLKbPRn9BchjKJzNDxu+qxbX26uevGbgy
         BzI1N3mKwIluEsRXC3LSP2cLPH7S3/Bt+LYUEY7+AVG9K+VE2QEJZ65bQjkPWtnpqE9L
         JPlidJzSIt+vg3qhSrg8fET5x5bnPuNbrGVVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745954019; x=1746558819;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UX6tO0/f8tzM35VSZEpfCuQP+GztRd/ihEJf8UXpFmQ=;
        b=lyVf/NXipL0XnUNf0s5cz0OuKE+FVoz3/74nD9QoMpiPNDzjrTgK2GorJc7ftJnYTs
         T9k8vFpUsAAxCWHvJc2owZP5VTax8VWEIdE7Ayzea46sBEDo9StRVDeJ5V7+Hrn+IMzZ
         8lkB1+foynum+2kt9x7iYMnEeSUhk9QSU+tq7OIIDBGwzr/xornGpBul9T+kXaJlf12N
         fA54lIWTv1beMABaHK9Sv+VHveRRPCQg9S3v0yu45yWcn9YUwvO+qz9AzJ2fSGFNIG4U
         e5E21gTcWJLSPjpcrktlnpuJ35IMCO6wCbhS/QxwUiJad27XBa/szXydLNpkJXxz5uy6
         FYfA==
X-Forwarded-Encrypted: i=1; AJvYcCXRcZftVT94L+HuqNI23tVxv1WtbSI5IQQFEl9XzAxTJgYVf+1lB7HuD/gzY8dtbuoIMFAad90R9J4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCrUqvH0j0/kEVeUKFH0eDSdYRWTGytMwQTeURwcFBqpVB8V2F
	b0H2FocUtTMTZUTghZOmogNs3qzI+ucklxFOb/ZZAXc3FY7+ohZMKh0k9u1izPE=
X-Gm-Gg: ASbGncvRqzBbpiogUp7zw2wY/ewyxkADaFLniiGfhVFvqv/72AtMQKnlgDXHHpaoutz
	ZpFj3z3XHGwAIAOQLEMY9awq0sNszhYyp1PP+DwpZaxCNPB2XztV8CMfmV6eiLMdi/dwjxN3khE
	yeRa8zE6PxJS5YgNp/mSVNdyAYSMsq621A3CVL6+3DNWQBBl5OQt2JadyB5OuA0Li13kAC0hmAV
	eFdBE1YnxfxWaYfYUADvn8wgZsD4DmzoiKYurigZPaXSh8+IkstcEOu3AagEDD6oMxwyn7UcPAq
	No0AKtzZrFay2RaW9RjpwYnI0IDsqzdA4bWUlRhkzcc/S9sDf2oPokZD1JQQk2fEmHG9as2dPIp
	51aSgJg==
X-Google-Smtp-Source: AGHT+IHx8NsqmGZdCp+0xXgpqGC9ZFTWYMoD2+M6VSNKH0/6Nh2g1o/zmEoF1Kr5VT2M349EDM3B0A==
X-Received: by 2002:a05:6000:1446:b0:397:5de8:6937 with SMTP id ffacd0b85a97d-3a08f7c9a56mr417279f8f.41.1745954019072;
        Tue, 29 Apr 2025 12:13:39 -0700 (PDT)
Message-ID: <81ed8b53-1a40-4777-ab87-4f4abe032dbc@citrix.com>
Date: Tue, 29 Apr 2025 20:13:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bitops/32: Convert variable_ffs() and fls() zero-case
 handling to C
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
 Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20250425141740.734030-1-arnd@kernel.org>
 <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com>
 <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
 <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
 <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com>
 <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
 <aA8nF0moBYOIgC5J@gmail.com> <aA8oqKUaFU-0wb-D@gmail.com>
 <CAHk-=wgJfWfWa2NTiTmev+Xr=e8Uo=aFkrXujLAQBVAVN-VigQ@mail.gmail.com>
 <B364FF6D-DFCC-42A7-ACA1-6A74E27EE57E@zytor.com>
 <67be5eee-b67b-409a-8309-829f891b9944@citrix.com>
 <916BD58C-E6A7-495E-9A60-722E130AC7A7@zytor.com>
 <e5e97ff8-9670-40d1-a0fa-69504d34c4c4@citrix.com>
 <956DB0ED-F3DB-456D-8D06-6F40DBDB815A@zytor.com>
 <06d04c13-76e8-45fb-a563-e365e1f19362@citrix.com>
 <CAHk-=wig1E4B-e1_6=it1LfVQ64DJsVgO6f6Ytnbzm2qChbAdw@mail.gmail.com>
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
In-Reply-To: <CAHk-=wig1E4B-e1_6=it1LfVQ64DJsVgO6f6Ytnbzm2qChbAdw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/04/2025 7:05 pm, Linus Torvalds wrote:
> On Tue, 29 Apr 2025 at 07:38, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> I tried that.  (The thread started as a question around
>> __builtin_constant_p() but did grow to cover __builtin_ffs().)
> Maybe we could do something like
>
>    #define ffs(x) \
>         (statically_true((x) != 0) ? __ffs(x)+1 : __builtin_ffs(x))
>
> which uses our "statically_true()" helper that is actually fairly good
> at the whole "let the compiler tell us that it knows that value cannot
> be zero"
>
> I didn't check what code that generated, but I've seen gcc do well on
> that statically_true() thing in the past.
>
> Then we can just remove our current variable_ffs() thing entirely,
> because we now depend on our (good) __ffs() and the builtin being
> "good enough" for the bad case.

That would improve code generation for 32bit, but generally regress 64bit.

Preloading the destination register with -1 is better than the CMOV form
emitted by the builtin; BSF's habit of conditionally not writing the
destination register *is* a CMOV of sorts.


When I cleaned this up in Xen, there were several factors where I
thought improvements could be made.

Having both ffs() and __ffs(), where the latter is undefined in a common
case, is a trap waiting for an unwary programmer.  I have no particular
love for ffs() being off-by-one from normal, but is well defined for all
inputs.

Also, leaving the constant folding to the arch-optimised form means that
it often gets forgotten.  Therefore, I rearranged everything to have
this be common:

static always_inline attr_const unsigned int ffs(unsigned int x)
{
    if ( __builtin_constant_p(x) )
        return __builtin_ffs(x);

#ifdef arch_ffs
    return arch_ffs(x);
#else
    return generic_ffsl(x);
#endif
}

with most architectures implementing arch_ffs as:

#define arch_ffs(x) ((x) ? 1 + __builtin_ctz(x) : 0)

and x86 as:

static always_inline unsigned int arch_ffs(unsigned int x)
{
    unsigned int r;

    if ( __builtin_constant_p(x > 0) && x > 0 )
    {
        /*
         * A common code pattern is:
         *
         *     while ( bits )
         *     {
         *         bit = ffs(bits);
         *         ...
         *
         * and the optimiser really can work with the knowledge of x being
         * non-zero without knowing it's exact value, in which case we don't
         * need to compensate for BSF's corner cases.  Otherwise...
         */
        asm ( "bsf %[val], %[res]"
              : [res] "=r" (r)
              : [val] "rm" (x) );
    }
    else
    {
        /*
         * ... the AMD manual states that BSF won't modify the destination
         * register if x=0.  The Intel manual states that the result is
         * undefined, but the architects have said that the register is
         * written back with it's old value (zero extended as normal).
         */
        asm ( "bsf %[val], %[res]"
              : [res] "=r" (r)
              : [val] "rm" (x), "[res]" (-1) );
    }

    return r + 1;
}
#define arch_ffs arch_ffs

and finally, providing compatibility for the other forms as:

#define __ffs(x) (ffs(x) - 1)


The end result is fewer APIs to implement in arch-specific code, and the
removal of undefined behaviour.

That said, I don't envy anyone wanting to try and untangle this in
Linux, even if consensus were to agree on it as an approach.

~Andrew

