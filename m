Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E72AB17F3
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 17:07:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980108.1366583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDPJQ-0007sp-Ix; Fri, 09 May 2025 15:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980108.1366583; Fri, 09 May 2025 15:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDPJQ-0007qF-G0; Fri, 09 May 2025 15:06:56 +0000
Received: by outflank-mailman (input) for mailman id 980108;
 Fri, 09 May 2025 15:06:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SZc7=XZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uDPJO-0007q3-LY
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 15:06:54 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3dd721bd-2ce7-11f0-9eb4-5ba50f476ded;
 Fri, 09 May 2025 17:06:53 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso12346625e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 09 May 2025 08:06:53 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f57ddd5esm3481753f8f.6.2025.05.09.08.06.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 08:06:52 -0700 (PDT)
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
X-Inumbo-ID: 3dd721bd-2ce7-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746803213; x=1747408013; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=woMqZGKCr5yftOBKrZ28Zuc7Gp/g1ahjYQi4FND/Frw=;
        b=Z/g8tZQ+SNH6orImE5LZsde+ERR1Np7be7DPunVAzxDax9wGMU9LFyp+QiPwzKSagc
         VoGosYSl8ZXWTRp/ShRwJ69JlWcTkB8CJQ8HbUqQY/pbBGRDT12W38Z69/Q0GcRNibkf
         wWSAT6rPeT3Q2NaFWLMKKG8JRU1TY9OEQdKto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746803213; x=1747408013;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=woMqZGKCr5yftOBKrZ28Zuc7Gp/g1ahjYQi4FND/Frw=;
        b=d43hZ6XO1K4U2r9uubtQk+SFeasvxZH+mPTHbvGruD7G8QEE5An4tVulkMt+ekkKtF
         StNTbFJ3Q7zg/FsiQyBKROPZMMHiqCfrAVBDK0Ik6lExJVIxx5oRKj06xax2V8ys2Qgv
         FD2SPUGfJhoEyr1fhxpgL5Vh/Z3Rwzusm808Q25gdEQd3oE0RhXRHLaFIRBdBFMz6BsH
         E3orIUOnF//fm20CXEEi6n4XEiRi+WRe+KLRD1uhZin8arQI0CUYXMeiLCOH8+j/8tVp
         rhc2Uj02+qbb06VXfK6r0EfjSrmlCxIhNKWUTMWZq100TB1hp3uwiZTkMrwZCtp6qE/Z
         Kjbg==
X-Forwarded-Encrypted: i=1; AJvYcCW4G+moeQQkfmJ01aERNL6ciZ5AwqeGz85RRNG76zWT8NT2JPvzXqtdVydhQXs/f1gEtiqxLS5YqeU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxtGDb1Qam1AxF44GWHj+/LZBuKD7mSvuLF6jYS3HRxmMlmAeZk
	EU0q6TdQx/HvQ2Br0ZMzBX0XMMO2Z7qIRV9K78YQ9dVS8e0HWqxmaUaRM3m92AA=
X-Gm-Gg: ASbGnctfadXv4VGdTm7cSp8VYAIf9x6DphuitrOqLgoj8Vavc2+jbBi3jCnebW2M6aB
	Co3P1DP7pD4R3N3/dooDJdEfuLQHpPP7VZwh+rfqXcWJ73KyeejRSKvBEe97VlmiiFnY3SwiO5k
	OPxPHMOm+07DYjbKnejwDMYIygi1u4F/HEhjgvQl6ASt1SJR7MAHQPfuOahXzeBrR6DMLB6RH/I
	fR6wL2cyA6FL5OGEsafAnZo33xdQwkNMMUuhcjRS8OeQtQ5pU/DMS1vWk6xO7mLEaUMVX0GiaDL
	DhQaCYggmmjyoTj9MEBSyEuXKbY/hT18uSGZ71gFIrGHLu0V1qDNqCb+dbJUjqqBechOZsjp3Ss
	H6NZFtA==
X-Google-Smtp-Source: AGHT+IHV5QYRzhy5eiFa9DOlj09Sqt/BL+AHbIY9cP46TPmZS1co0Ul5f9vJsRcsRZXjHRGuMjagwA==
X-Received: by 2002:a05:6000:4020:b0:3a1:2df6:822c with SMTP id ffacd0b85a97d-3a1f64898dbmr3259912f8f.31.1746803213021;
        Fri, 09 May 2025 08:06:53 -0700 (PDT)
Message-ID: <d3731a36-8aeb-4494-813f-38e8cd24e3cd@citrix.com>
Date: Fri, 9 May 2025 16:06:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Allows Secure Boot for Kexec
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250507094253.10395-1-freddy77@gmail.com>
 <a197c145-1fc5-4482-bce9-12511a816a63@citrix.com>
Content-Language: en-GB
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
In-Reply-To: <a197c145-1fc5-4482-bce9-12511a816a63@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/05/2025 4:04 pm, Andrew Cooper wrote:
> On 07/05/2025 10:42 am, Frediano Ziglio wrote:
>> Ross Lagerwall (4):
>>   xen/lib: Export additional sha256 functions
>>   kexec: Include purgatory in Xen
>>   kexec: Implement new EFI load types
>>   kexec: Support non-page-aligned kexec segments
> I realise a lot of this is coming from kexec-tools and/or Linux, but it
> looks very very mad.
>
> From patch 1, we're embedding this in Xen:
>
> xen.git/xen/arch/x86/purgatory$ ls -lah purgatory.ro
> -rw-r--r-- 1 andrew andrew 30K May  9 15:24 purgatory.ro
>
> yet -Wa,--strip-local-absolute alone halves the size:
>
> xen.git/xen/arch/x86/purgatory$ ls -lah purgatory.ro
> -rw-r--r-- 1 andrew andrew 17K May  9 15:25 purgatory.ro
>
> Looking at purgatory itself, we enter at purgatory_start, load a local
> GDT, set up a local stack, call into C for the hashing (and nothing
> else), then jmp to entry64...
>
> ... which loads a (different) local GDT, (different) local stack, loads
> the GPRs and then jumps into the new kernel.
>
> Combined with kexec_reloc(), that's 3x we change GDT and stack in
> several hundred instructions.
>
>
> Looking further at patch 2, we only set up 3 GPRs; %rip, %rsp and %rdi
> pointing the parameter block.
>
> Patch 2 also contains an a large amount of EFI-editing logic (all
> vulnerable to XSA-25), which AFAICT exists only because purgatory is
> built non-PIC and wants relocating.  I can't see any external
> references, or anything that couldn't be resolved at link time for a PIC
> build.
>
>
> There are two things which purgatory does which Xen doesn't currently
> cater for:
>
> 1) Setting up the GPRs in that manner
> 2) The digest checks
>
> #1 is very easy to fix and can probably even be done on the current ABI
> (older Kexecs using purgatory won't care), and #2 ought to be easy too
> by extending machine_kexec().  We can do the digest checks
> unconditionally (it's a sensible check irrespective).
>
> I think that removes the majority of this series, with no loss in
> functionality?
>
> Given that we're leaving the signature check to the dom0 kernel (which
> is TCB and therefore can in the UEFI-SB model), we just might be able to
> get away without any hypercall changes at all?
>
> Thoughts?

Sorry, one extra thing.  By doing the digest check in machine_kexec(),
we can also inform the user that the kexec kernel looks corrupt, and we
won't be entering it.  (And probably try to reboot rather than hanging too.)

~Andrew

