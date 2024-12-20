Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6499F8999
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 02:39:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861595.1273560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tORyz-0006ZC-6q; Fri, 20 Dec 2024 01:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861595.1273560; Fri, 20 Dec 2024 01:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tORyz-0006WP-3u; Fri, 20 Dec 2024 01:39:13 +0000
Received: by outflank-mailman (input) for mailman id 861595;
 Fri, 20 Dec 2024 01:39:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tu4b=TN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tORyx-0006WJ-Vc
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2024 01:39:12 +0000
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35510a9a-be73-11ef-a0d8-8be0dac302b0;
 Fri, 20 Dec 2024 02:39:09 +0100 (CET)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-4361f796586so15085325e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 17:39:09 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366120088esm31993515e9.13.2024.12.19.17.39.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2024 17:39:08 -0800 (PST)
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
X-Inumbo-ID: 35510a9a-be73-11ef-a0d8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734658749; x=1735263549; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4ebt9RfFNlU+kCB4CV1j8AEPPTxXG9SHQgcbE7oz8Lc=;
        b=gPbIC4lkHDk/xKvpdkRgvRJ4N0Y0mh9SFELSOJDTS94nOcuZ1/dRC92qP4IiW3ztU+
         jZAk7DUrLDSnCOqfjMokSYHYRUAqQ7x+YbmxMOvb34C4HoJaN6mNKE0JRvOX4yNCVQaD
         JYIxqApGA8ORPHOOasfd3/Bc5d7/fs+rOQuEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734658749; x=1735263549;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ebt9RfFNlU+kCB4CV1j8AEPPTxXG9SHQgcbE7oz8Lc=;
        b=xBH1J5Z1i5UNTNcoDJJFEqWdXly0SFphYTAKkYXD7oS8RZ6iuaiX2ciQmo+/637hq+
         WOdtMpAhiZ0s1zbPVY+5a0IItRrjoyRMSYbfUszNRL03emtgBII42j2GSx5QTfgG53QU
         YMuzYd+a5ncLCoFyl53x368uvRn8pnTNrN0mULrPT+phshR+VWyREeRAGwGeMdZYDNAO
         /89yogtzhhpfC0DWiv5qoS4EAmSWTHnGlNbG99W95u/fnsBn7EqDEXGXN4Fo/b8V9DIm
         J/g5ZPyHuHBLSKJbq7uk4WXWfsRUvITxGqplgMrgPJzF+/E5OPS5qX/YaNbQ6eHgdfYI
         m1Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXI4RZWGL8SPoHgL78pYfii/w68P8RnqP6PgP/2LY9EaEHO9UxpeohM3/Y1ZIECZwhFT0o8lpuYYUM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHhgtEL/AYRyv0ojkZ+AI0tuetnG2acjJhPePr+oevG9ux6vve
	gJGBeP3/PiEEsPyO9JLUbpBCeoeInIJYy/c39uvI35VK9xpiJ5T7/s07vhG1Eps=
X-Gm-Gg: ASbGncsj36ThWI9C6GiqEwoS56hZ2QJ8qG2LCmlA6S2a/C8DHGxGxTlVIqegRCynWrP
	qSTRkVp3VMM6nnwMVBltAQGjaP/rtiAX7tv2b2RJJEKv4gniSeM63kCJMhyl1aMjlEkBGl2gvgm
	sYUP6T40DJA6eHXv3mCWtsBvsn1kpeB10KI88R2o1vEGtyMUX5T1qU2oql2op0J0hizTPPrai1x
	cbW7VX5S/nueRdA2Zm0WjxQMIlr1bkKUHevjsFyBmsy+WNSeXzpCn+H4fXqPxPj0QbHm2l0GnKI
	oh1cWIwJ7d+GoXBt71Vk
X-Google-Smtp-Source: AGHT+IEaM6MkZFZl3KmiAg6nD02zKSlYWnEyf/5dVUkNhm+rsElC7GOnheMem/9YEpGNrUbt2mLwbQ==
X-Received: by 2002:a05:600c:4fd3:b0:431:54f3:11ab with SMTP id 5b1f17b1804b1-43668b600c9mr5900845e9.33.1734658749151;
        Thu, 19 Dec 2024 17:39:09 -0800 (PST)
Message-ID: <43166e29-ff2d-4a9d-8c1b-41b5e247974b@citrix.com>
Date: Fri, 20 Dec 2024 01:39:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-6.12.y] XEN: CVE-2024-53241 / XSA-466 and Clang-kCFI
To: sedat.dilek@gmail.com
Cc: Juergen Gross <jgross@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 Sami Tolvanen <samitolvanen@google.com>, Jan Beulich <jbeulich@suse.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Kees Cook <kees@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev,
 xen-devel <xen-devel@lists.xenproject.org>
References: <CA+icZUWHU=oXOEj5wHTzxrw_wj1w5hTvqq8Ry400s0ZCJjTEZw@mail.gmail.com>
 <099d3a80-4fdb-49a7-9fd0-207d7386551f@citrix.com>
 <CA+icZUX98gQ54hePEWNauiU41XQV7qdKJx5PiiXzxy+6yW7hTw@mail.gmail.com>
 <CA+icZUW-i53boHBPt+8zh-D921XFbPb_Kc=dzdgCK1QvkOgCsw@mail.gmail.com>
 <90640a5d-ff17-4555-adc6-ae9e21e24ebd@citrix.com>
 <CA+icZUVo69swc9QfwJr+mDuHqJKcFUexc08voP2O41g31HGx5w@mail.gmail.com>
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
In-Reply-To: <CA+icZUVo69swc9QfwJr+mDuHqJKcFUexc08voP2O41g31HGx5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/12/2024 12:27 am, Sedat Dilek wrote:
> On Fri, Dec 20, 2024 at 12:26 AM Andrew Cooper
> <andrew.cooper3@citrix.com> wrote:
>> On 19/12/2024 11:10 pm, Sedat Dilek wrote:
>>> On Thu, Dec 19, 2024 at 6:07 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>>>> On Thu, Dec 19, 2024 at 5:44 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>>>> On 19/12/2024 4:14 pm, Sedat Dilek wrote:
>>>>>> Hi,
>>>>>>
>>>>>> Linux v6.12.6 will include XEN CVE fixes from mainline.
>>>>>>
>>>>>> Here, I use Debian/unstable AMD64 and the SLIM LLVM toolchain 19.1.x
>>>>>> from kernel.org.
>>>>>>
>>>>>> What does it mean in ISSUE DESCRIPTION...
>>>>>>
>>>>>> Furthermore, the hypercall page has no provision for Control-flow
>>>>>> Integrity schemes (e.g. kCFI/CET-IBT/FineIBT), and will simply
>>>>>> malfunction in such configurations.
>>>>>>
>>>>>> ...when someone uses Clang-kCFI?
>>>>> The hypercall page has functions of the form:
>>>>>
>>>>>     MOV $x, %eax
>>>>>     VMCALL / VMMCALL / SYSCALL
>>>>>     RET
>>>>>
>>>>> There are no ENDBR instructions, and no prologue/epilogue for hash-based
>>>>> CFI schemes.
>>>>>
>>>>> This is because it's code provided by Xen, not code provided by Linux.
>>>>>
>>>>> The absence of ENDBR instructions will yield #CP when CET-IBT is active,
>>>>> and the absence of hash prologue/epilogue lets the function be used in a
>>>>> type-confused manor that CFI should have caught.
>>>>>
>>>>> ~Andrew
>>>> Thanks for the technical explanation, Andrew.
>>>>
>>>> Hope that helps the folks of "CLANG CONTROL FLOW INTEGRITY SUPPORT".
>>>>
>>>> I am not an active user of XEN in the Linux-kernel but I am willing to
>>>> test when Linux v6.12.6 is officially released and give feedback.
>>>>
>>> https://wiki.xenproject.org/wiki/Testing_Xen#Presence_test
>>> https://wiki.xenproject.org/wiki/Testing_Xen#Commands_for_presence_testing
>>>
>>> # apt install -t unstable xen-utils-4.17 -y
>>>
>>> # xl list
>>> Name                                        ID   Mem VCPUs      State   Time(s)
>>> Domain-0                                     0  7872     4     r-----     398.2
>>>
>>> Some basic tests LGTM - see also attached stuff.
>>>
>>> If you have any tests to recommend, let me know.
>> That itself is good enough as a smoke test.  Thankyou for trying it out.
>>
>> If you want something a bit more thorough, try
>> https://xenbits.xen.org/docs/xtf/  (Xen's self-tests)
>>
>> Grab and build it, and `./xtf-runner -aqq --host` will run a variety of
>> extra codepaths in dom0, without the effort of making/running full guests.
>>
>> ~Andrew
> Run on Debian 6.12.5 and my selfmade 6.12.5 and 6.12.6.
> All tests lead to a reboot in case of Debian or in my kernels to a shutdown.
>
> Can you recommend a specific test?

Oh, that's distinctly less good.

Start with just "example".  It's literally a hello world microkernel,
but the symptoms you're seeing is a dom0 crash, so it will likely
provoke it.

Do you have serial to the machine?  If so, boot Xen with `console=com1
com1=115200,8n1` (or com2, as appropriate).

If not and you've only got a regular screen, boot Xen with `vga=,keep
noreboot` (comma is important) which might leave enough information on
screen to get an idea of what's going on.

Full command line docs at
https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html

> dileks@iniza:~/src/xtf/git$ sudo ./xtf-runner --list functional xsa | grep xsa-4
> test-pv64-xsa-444
> test-hvm64-xsa-451
> test-hvm64-xsa-454
>
> Is there no xsa-466 test?

No.  XSA-466 is really "well don't do that then if it matters".

More generally, not all XSAs are amenable to testing in this way.

~Andrew

