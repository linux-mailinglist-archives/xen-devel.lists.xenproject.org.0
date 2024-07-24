Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B9F93ADB2
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 10:02:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763863.1174205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWWwj-0005sq-Fh; Wed, 24 Jul 2024 08:02:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763863.1174205; Wed, 24 Jul 2024 08:02:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWWwj-0005rM-Cl; Wed, 24 Jul 2024 08:02:01 +0000
Received: by outflank-mailman (input) for mailman id 763863;
 Wed, 24 Jul 2024 08:02:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rh+e=OY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sWWwi-0005KI-OP
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 08:02:00 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 009e2cf8-4993-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 10:01:59 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ef283c58f4so40303861fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 01:01:59 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f937aac1sm17373635e9.11.2024.07.24.01.01.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 01:01:57 -0700 (PDT)
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
X-Inumbo-ID: 009e2cf8-4993-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721808118; x=1722412918; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FMtjqeS9qCuN178jGuhz9jycjtdh32KlfCJNMM9kOqw=;
        b=XEBpjLxXSQ05hFbVjUPR7WZCfh7VkYZn/OgdJnVtnzcvqOfvYGAWBKTn67H/IinCWs
         97sWuo9OlczmgDxatMd42RLCNFGJ9oDWGV1P4pyLPD2T/SBPsx9/7mkLSJnatJKitusq
         TARE0nnr+APCuUTDBMc+J0vkcDcHZsrufbdfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721808118; x=1722412918;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMtjqeS9qCuN178jGuhz9jycjtdh32KlfCJNMM9kOqw=;
        b=C44G5QkNMqWa8Cg1O8QbqJc/EZrd36biHszDtv37NsYHcYRVaDMWMWY4vAaPZvASyg
         bKd4zFjfbnQggr+bL7rLoDqQ+JOfxMmEXn8h3lcg8YH2/eqlpLA5BcmuxQ8I/UEMwEh+
         DBHAX23a2NNexcH1leYrfEddJagNn6sMN2yiHRNTtBvOsvJpFEQ40eY7Hs7Ff1Suhs6R
         4316LXCW8GAA/H3mixyfVsVKE0bBmk/SG+034TRt+mD3S0kzU9xufhJ0BYEsLgIVVsJ0
         ffiw1cqlaOIfBGkaeU5lPlpzaIxwCKQEFeu5xje/k842d9J2NoNBEdNEv5UmFm6bF2dh
         L3Dw==
X-Gm-Message-State: AOJu0YybuFTZ+tW3s5OC5XtAEuoftl+0s//tWUDsC4yR8Ot8LD85VcGZ
	fluCOYiqxrxfv/G8gAT2T6ECu9v8jQkZPbVzP4iq1na8hgjpMILT6hzR8+LjflI=
X-Google-Smtp-Source: AGHT+IEt1nM4FyIrR5teQWl7diGloh6nUQV7IoFZDFODJg6vJdJoLL5+m3mzgeqcHA2E1Bvp0e3+PA==
X-Received: by 2002:a2e:7212:0:b0:2ef:2c4b:b799 with SMTP id 38308e7fff4ca-2ef2c4bb8d6mr61857391fa.28.1721808118404;
        Wed, 24 Jul 2024 01:01:58 -0700 (PDT)
Message-ID: <69c5a7d8-7d71-4bbe-81f2-5f8a07e0d5e8@citrix.com>
Date: Wed, 24 Jul 2024 09:01:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] tools/libxs: Fix SIGPIPE handling issues
To: Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <20240718164842.3650702-1-andrew.cooper3@citrix.com>
 <4758a806-712f-4ec2-97e8-a31b493b2c31@suse.com>
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
In-Reply-To: <4758a806-712f-4ec2-97e8-a31b493b2c31@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/07/2024 7:58 am, Jan Beulich wrote:
> On 18.07.2024 18:48, Andrew Cooper wrote:
>> While the purpose of this series is patch 6, it has a side effect of reducing
>> the number of system calls substantally.
>>
>> Using a strace of test-xenstore as an example, we go from this:
>>
>>   rt_sigaction(SIGPIPE, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fda8278e2f0}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fda8278e2f0}, 8) = 0
>>   write(3, "\v\0\0\0\0\0\0\0\0\0\0\0\30\0\0\0", 16) = 16
>>   write(3, "xenstore-test/502673/a\0", 23) = 23
>>   write(3, "a", 1)                        = 1
>>   read(3, "\v\0\0\0\0\0\0\0\0\0\0\0\3\0\0\0", 16) = 16
>>   read(3, "OK\0", 3)                      = 3
>>   rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fda8278e2f0}, NULL, 8) = 0
>>
>> down to this:
>>
>>   sendmsg(3, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\v\0\0\0\0\0\0\0\0\0\0\0\30\0\0\0", iov_len=16}, {iov_base="xenstore-test/504021/a\0", iov_len=23}, {iov_base="a", iov_len=1}], msg_iovlen=3, msg_controllen=0, msg_flags=0}, MSG_NOSIGNAL) = 40
>>   read(3, "\v\0\0\0\0\0\0\0\0\0\0\0\3\0\0\0", 16) = 16
>>   read(3, "OK\0", 3)                      = 3
>>
>>
>> I.e., it removes 2x rt_sigaction(), and turns all write()'s into a single
>> writev() or sendmsg().
>>
>>
>> Reads are a little more problematic to deal with.  Xenstored will produce a
>> full package basically in one go, but libxenstore's reading is horrbly
>> complicated by virtue of it being completely different depending on whether
>> xs_watch() has created a secondary read thread or not.
>>
>> Andrew Cooper (6):
>>   tools/libxs: Fix length check in xs_talkv()
>>   tools/libxs: Rework xs_talkv() to take xsd_sockmsg within the iovec
>>   tools/libxs: Rationalise the definition of struct xs_handle
>>   tools/libxs: Track whether we're using a socket or file
>>   tools/libxs: Use writev()/sendmsg() instead of write()
>>   tools/libxs: Stop playing with SIGPIPE
> The title of the entire series containing "Fix" vs there being no single
> Fixes: tag throughout, afaics, leave unclear to me whether any or all of
> this work wants/needs backporting. Please clarify.

I was on the fence about whether I should have used Fixes: (2005 commit)
in patch 6 or not.

Also I've had a spectacularly bad run of luck with the CLOEXEC fixes so
leaving them to bake for a little longer in staging is no bad thing. 
That said, I am likely to backport them into the patchqueue imminently.

Personally, I think it is very buggy for libxenstore to play with
SIGPIPE, but it also came from reading the strace of the CLOEXEC fixes
and thinking "well that's clearly broken too" rather than from a real
SIGPIPE problem.

~Andrew

P.S. Then again, the Xen libraries all get away with murder doing things
that libraries must never do...  I think it's still unforgivable that
libxentoollog adjusts stdout/stderr if you pass NULL into
xc_open_handle(), and that we have 5 different trivial few-kb libraries
which are co-dependent on each other when it should be a single one.

