Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE26A6065D
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 01:03:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913649.1319601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tssWF-0005en-PM; Fri, 14 Mar 2025 00:03:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913649.1319601; Fri, 14 Mar 2025 00:03:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tssWF-0005cw-Mm; Fri, 14 Mar 2025 00:03:19 +0000
Received: by outflank-mailman (input) for mailman id 913649;
 Fri, 14 Mar 2025 00:03:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXxa=WB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tssWE-0005co-8u
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 00:03:18 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b511d01f-0067-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 01:03:07 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-390fdaf2897so1348056f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 17:03:06 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb318a5fsm3670582f8f.79.2025.03.13.17.03.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 17:03:05 -0700 (PDT)
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
X-Inumbo-ID: b511d01f-0067-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741910586; x=1742515386; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p9N4YCcvK7R6tymxQcV9qGbYvN5kXJlP7prQksHWdZM=;
        b=cemcnH76MyGVZAUjAnRn0d7zdp+qtUgwWVjxDGAzxBNG3eWLZY1R875Dr0BfRd9/nj
         Y9b8q+95ZdqcMW2FKK8jZEnwfw+/ch7PAZbOdnV1dz45Vd3uMtqM/DIMiqJMsSNV1G33
         Dp2a1+SMU+FBSMCez6lrXJfNmgq85UMYk31sI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741910586; x=1742515386;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p9N4YCcvK7R6tymxQcV9qGbYvN5kXJlP7prQksHWdZM=;
        b=CUye1FJBywQFfaR74pAo8gTRaoVyBG/Zaq4gTUgGyLsiXjvftMXwUjjff2CVkN87Jg
         SllW74o7KHC5fe5gsv6mUjTBuV4TBQVOyMuuTewIkOKT+9LjX95Vc6fcswLO1B+wRu57
         qjQJ+p0bGdPTG9xQTMbTLWOu0rnmAkN3p39RzhPuBO6jWnwL6UPlk2D+sLVSichvf8Eg
         2c6iypRgxh9QnMGW0pUspxy77ZE/v5f/7zsSwQvGlehAO4v7wyi0Xr6FfABzUfAwfpXS
         PN60vUV3v8/kVvnVGLWJ836zTalW+niqjJLkNw7gXLQaZzyzygfs929Qss8IpCJMXEev
         +afw==
X-Forwarded-Encrypted: i=1; AJvYcCWw4KjqSqNeKMotkPdKzUjUtBakf5eiLegK4VBrrPdSAhuR8gkaP4wslQ8yQgpTFm6PmvVV/M6Zono=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwrrdoNkccEuGjrV5RymO0wIXUhyKxliFE3Tvt+UQRBXoViYIi4
	XS4OzvMaPwLo66+lrWeRC4KYxjT3WarX6PoqRkgU4WolDabIfU5uy13tBE2SDCg=
X-Gm-Gg: ASbGnctopjm2n2Uw7ZzgvxZlCzei4Qn2hdTSbuoQZpcVdAVdeQrEDFHL9iexlsO5XMP
	uQoPEP4MscqCtFoOGho/586RPpINvf6Bfk7aC61NfmJhPefgdRe/UfitCJoobVaPZHIvjMry3ma
	VMKX5KqNVodRMMcGpgLEVov6ZiJkjEEseQl1uBqJz4XROF2yNIQ1XdrzzozwaxECoEv367PUNQS
	cbMk+psj6psSfqTeqHNkqp01fws44hTsdHDhKbytOUD/FKy7QKlozb9a5nyrkefqEnOvzYLaqiU
	XXl2n7bmFuV9ZJXKGzdnh0zdCQKfHkyiM4enmjZvFn820BfD0/HOmdQ68pIDhddzSqG5DQRt/6J
	ex6EfB8Yd
X-Google-Smtp-Source: AGHT+IGo+QWGU8vkG7O6/BZFtmjCXBL+Y8JvHmQQRZKkAPVIYRAN3NPaY0QXzTuAcSxEpFugU0C0gQ==
X-Received: by 2002:a05:6000:2c7:b0:391:2e7:67ff with SMTP id ffacd0b85a97d-3971dce07bcmr421562f8f.10.1741910586353;
        Thu, 13 Mar 2025 17:03:06 -0700 (PDT)
Message-ID: <d3fa362b-0a4b-47e5-860b-d85183730379@citrix.com>
Date: Fri, 14 Mar 2025 00:03:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Update minimum toolchain requirements
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250307175435.3089686-1-andrew.cooper3@citrix.com>
 <05057b1c-cca1-4495-b037-47a896ab9f6f@suse.com>
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
In-Reply-To: <05057b1c-cca1-4495-b037-47a896ab9f6f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/03/2025 8:18 am, Jan Beulich wrote:
> On 07.03.2025 18:54, Andrew Cooper wrote:
>> GCC 4.1.2 is from 2007, and Binutils 2.16 is a similar vintage.  Clang 3.5 is
>> from 2014.  Supporting toolchains this old is a massive development and
>> testing burden.
>>
>> Set a minimum baseline of GCC 5.1 across the board, along with Binutils 2.25
>> which is the same age.  These were chosen *3 years ago* as Linux's minimum
>> requirements because even back then, they were ubiquitous in distros.
> I'm certainly fine with this bump, but my main earlier request remains: I'd
> like it to be clear up front what the criteria are going to be for future
> bumps. Imo what Linux does is at best a data point; we don't need to follow
> what they do.

I'm reluctant to try and put anything in writing, because it will just
make the arguments worse.

We can and may change the toolchain requirements at any point for any
reason, depending on the situation.

Retpolines for Spectre-v2 are the obvious example.  That reset the
compiler baseline to "bleeding edge plus secret patches" for all intents
and purposes.  Distros also backported those patches into their older
compilers.  Yes, we did eventually manage to make this conditional, but
that's not terribly relevant.

Here, I've proposed several concrete things which would be good to use,
and that we cannot because the baseline is too old.

And that's how it's always going to be.  We move forwards when there's a
good enough reason to, and the downsides are tolerable.


The Linux aspect is a datapoint, but it's an important one; it means
that anyone building Linux (i.e. ~all of our target audience) already
has these tools.  That is "there's no real downside" put a little less
bluntly.
>>  Choose
>> Clang/LLVM 11 as a baseline for similar reasons; the Linux commit making this
>> change two years ago cites a laudry list of code generation bugs.
> I'm less happy about this one. It'll mean I now also need to arrange for
> building Clang on my own, which so far I was quite happy to be able to avoid.

Prebuilt binaries are available. 
https://github.com/ClangBuiltLinux/tc-build has instructions for local
builds, and a script which tries to help out with what to turn off.

Everything in GitlabCI is available locally from within xen.git itself
via automation/scripts/containerize.  There's also FreeBSD testing
available via CirrusCI.

The reason for going with Clang/LLVM 11 is because it's a known entity,
and is already 5 years old, and it's necessary if we want to use
asm_goto, which was one of the key justifications for making the jump.

> Tangentially, as also mentioned during earlier discussions, it would also be
> nice to have an understanding what other basic platform components (e.g.
> coreutils) are required to fulfill certain minimal requirements. While
> putting in place a custom toolchain is (to me at least) relatively easy,
> doing the same for other base platform software isn't. For some of the very
> old systems I try to keep testing Xen on, extra requirements there may mean
> that building Xen there isn't going to be possible anymore. Which in turn
> may mean running the toolstack (built on a newer distro) there may also not
> be possible anymore. Which would, perhaps severely, limit the usefulness of
> such testing attempts.

As before, I don't expect us to change things unless there is a good
reason to.

That said, a few things come to mind:

We need to drop Python2 support at some point.  It's substantially EOL,
and we're about to drop the last test environment that has it (IIRC).

Make 3.80 is also ancient, and I'm still irritated at not being able to
use $(abspath) to fix XEN_ROOT.  We have an insane amount of ../../../
embedded in our binaries and debug symbols because of how XEN_ROOT is
constructed.

~Andrew

