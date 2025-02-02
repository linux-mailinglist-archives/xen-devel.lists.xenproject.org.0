Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFE7A24EE0
	for <lists+xen-devel@lfdr.de>; Sun,  2 Feb 2025 17:11:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880415.1290488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tecZ7-0006LB-GI; Sun, 02 Feb 2025 16:11:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880415.1290488; Sun, 02 Feb 2025 16:11:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tecZ7-0006IK-DB; Sun, 02 Feb 2025 16:11:21 +0000
Received: by outflank-mailman (input) for mailman id 880415;
 Sun, 02 Feb 2025 16:11:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=okHa=UZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tecZ6-0006IE-69
 for xen-devel@lists.xenproject.org; Sun, 02 Feb 2025 16:11:20 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55cdedb5-e180-11ef-a0e7-8be0dac302b0;
 Sun, 02 Feb 2025 17:11:18 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so36134125e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 02 Feb 2025 08:11:18 -0800 (PST)
Received: from [10.16.14.83] ([185.201.63.252])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c122500sm10457039f8f.54.2025.02.02.08.10.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Feb 2025 08:11:16 -0800 (PST)
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
X-Inumbo-ID: 55cdedb5-e180-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738512678; x=1739117478; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xa9FGBnBUkp/9/4ESnna9rVdpzJAZZ632SMyuDf5GFE=;
        b=PIJ/iCsi810g6Yjmm22o8s6YTfWWhqxC5WoFJFth9vSjL/LCULpmnrL8ndnDJyC3ua
         lkf0DD92NxPiKcbDsZM025+vbzhiDQCTnfX1OPsp+HnX+g/IHvae13thplCqMp1eBPta
         GsVb+2mdNRDfHUaUs06vzTypRVmOmq27q6vM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738512678; x=1739117478;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xa9FGBnBUkp/9/4ESnna9rVdpzJAZZ632SMyuDf5GFE=;
        b=aXau/c5Skw0BoCNyGHNquExlXmI/ldSI9SKlr+2CEX72M52yAvrSSGhfRM95PW5MLA
         rnxoiW6WgY+Oc1plMKFor06coRXI6yczoQ6vux5mzMMHSZNgPav/1yPWu0POIHtN2UdF
         D20gaAkPRR4SPS3qLM3UMXS1qnrb25HdBi6QujEeq4eIpwXWLNZSziY3DsXhWAMqxJvH
         UAwz38g8NGeC9UhvlNEUT5jhx7hFjiAtXB/4Xiv/LgJnAZ1e9jpaXqAMRlTjbth2PCLq
         BlRrIYXQ4TYn8UezYPDOUE9RaOPbPs8tuNqRLoOemXrlXpyMEALDK++ABRixenT1q0eE
         oT6w==
X-Gm-Message-State: AOJu0YzeLMy9Xklvb+/XZocI5PbHgP70Dk4vLTFUPI3C5zoTfmEw8p/7
	nl4ral9/ummzWI36sFQjqf19UfU3Tso9oIbe7RcfCERuNrLi+0zbAG0fDNQ2sho=
X-Gm-Gg: ASbGncs32elfBwRHkG5RK5iXf2GHiu+4KMfdIlWqQ1dKNWC6KtySulkstfoF0uTsR4Q
	I2/vTz+58fbkkP2cPi/J7E/WoZTt4OaDN2sE0C8NihujXPe7wqzKsGtvKsOSpkurgnqnqefO28K
	Y6by0IvZ5e/2U/ftOLHHW58tFS8j3kII/4Z+7W7CXZ45ON2t0yY1ejhBwaTJOr7MRbPvAVtJ0Rc
	CM40DNdyAZIBcvd7kOyrqTtFklP8iBVT9f7z34oZPi4LcQwLTNpl67xGcDRuyPQukCVQO+mb2Y0
	HcvngQFfcwx10+ReG5TiHYxYrg==
X-Google-Smtp-Source: AGHT+IEaH4W/p2JDy5nKDlaeWhwWplOebhnOiCvRq4zOeqaXFxjrR9o9WOp6JR1M6SLlwMJisDQ/sg==
X-Received: by 2002:a05:6000:4025:b0:38b:ed7b:f77d with SMTP id ffacd0b85a97d-38c520bc46fmr14366232f8f.52.1738512677769;
        Sun, 02 Feb 2025 08:11:17 -0800 (PST)
Message-ID: <4218bce7-b615-40d7-8d40-b2553d8b1662@citrix.com>
Date: Sun, 2 Feb 2025 16:10:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen panic due to xstate mismatch
To: Guillaume <thouveng@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <CACt9=QgsSM18to9M5k8+3N3NvRoNVmAvsQo5oLO5-A0dm7VFNg@mail.gmail.com>
 <CACBT2OvVcDzoghr5SSjfvA5c9=LDs7DC6Z1Pi0QJ2sv0YFcEfw@mail.gmail.com>
 <CACt9=QiZhq94_=gSpSs782tM9uYQqvgrmOXeGw47C31-dwcrgw@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CACt9=QiZhq94_=gSpSs782tM9uYQqvgrmOXeGw47C31-dwcrgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Can you also get `xl dmesg` too, and attach it?

I think this is a VirtualBox bug, but I'm confused as to why Xen has
decided to turn off AVX.

~Andrew

On 02/02/2025 4:01 pm, Guillaume wrote:
> Yes sure I can collect the output. As you said the change is good
> enough to start the dom0 without errors (at least no apparent errors :).
> ```
> Xen reports there are maximum 120 leaves and 2 MSRs
> Raw policy: 32 leaves, 2 MSRs
>  CPUID:
>   leaf     subleaf  -> eax      ebx      ecx      edx
>   00000000:ffffffff -> 00000016:756e6547:6c65746e:49656e69
>   00000001:ffffffff -> 000806c1:00020800:f6fa3203:178bfbff
>   00000002:ffffffff -> 00feff01:000000f0:00000000:00000000
>   00000004:00000000 -> 04000121:02c0003f:0000003f:00000000
>   00000004:00000001 -> 04000122:01c0003f:0000003f:00000000
>   00000004:00000002 -> 04000143:04c0003f:000003ff:00000000
>   00000004:00000003 -> 04000163:02c0003f:00003fff:00000004
>   00000006:ffffffff -> 00000004:00000000:00000000:00000000
>   00000007:00000000 -> 00000000:208c2569:00000000:30000400
>   0000000b:00000000 -> 00000000:00000001:00000100:00000000
>   0000000b:00000001 -> 00000001:00000002:00000201:00000000
>   0000000d:00000000 -> 00000007:00000000:00000340:00000000
>   0000000d:00000002 -> 00000100:00000240:00000000:00000000
>   80000000:ffffffff -> 80000008:00000000:00000000:00000000
>   80000001:ffffffff -> 00000000:00000000:00000121:28100800
>   80000002:ffffffff -> 68743131:6e654720:746e4920:52286c65
>   80000003:ffffffff -> 6f432029:54286572:6920294d:31312d37
>   80000004:ffffffff -> 37473538:33204020:4730302e:00007a48
>   80000006:ffffffff -> 00000000:00000000:01007040:00000000
>   80000007:ffffffff -> 00000000:00000000:00000000:00000100
>   80000008:ffffffff -> 00003027:00000000:00000000:00000000
>  MSRs:
>   index    -> value
>   000000ce -> 0000000000000000
>   0000010a -> 0000000000000000
> Host policy: 30 leaves, 2 MSRs
>  CPUID:
>   leaf     subleaf  -> eax      ebx      ecx      edx
>   00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
>   00000001:ffffffff -> 000806c1:00020800:c6fa2203:178bfbff
>   00000002:ffffffff -> 00feff01:000000f0:00000000:00000000
>   00000004:00000000 -> 04000121:02c0003f:0000003f:00000000
>   00000004:00000001 -> 04000122:01c0003f:0000003f:00000000
>   00000004:00000002 -> 04000143:04c0003f:000003ff:00000000
>   00000004:00000003 -> 04000163:02c0003f:00003fff:00000004
>   00000007:00000000 -> 00000000:208c2549:00000000:30000400
>   0000000d:00000000 -> 00000003:00000000:00000240:00000000
>   80000000:ffffffff -> 80000008:00000000:00000000:00000000
>   80000001:ffffffff -> 00000000:00000000:00000121:28100800
>   80000002:ffffffff -> 68743131:6e654720:746e4920:52286c65
>   80000003:ffffffff -> 6f432029:54286572:6920294d:31312d37
>   80000004:ffffffff -> 37473538:33204020:4730302e:00007a48
>   80000006:ffffffff -> 00000000:00000000:01007040:00000000
>   80000007:ffffffff -> 00000000:00000000:00000000:00000100
>   80000008:ffffffff -> 00003027:00000000:00000000:00000000
>  MSRs:
>   index    -> value
>   000000ce -> 0000000000000000
>   0000010a -> 0000000000000000
> PV Max policy: 57 leaves, 2 MSRs
>  CPUID:
>   leaf     subleaf  -> eax      ebx      ecx      edx
>   00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
>   00000001:ffffffff -> 000806c1:00020800:c6f82203:1789cbf5
>   00000002:ffffffff -> 00feff01:000000f0:00000000:00000000
>   00000004:00000000 -> 04000121:02c0003f:0000003f:00000000
>   00000004:00000001 -> 04000122:01c0003f:0000003f:00000000
>   00000004:00000002 -> 04000143:04c0003f:000003ff:00000000
>   00000004:00000003 -> 04000163:02c0003f:00003fff:00000004
>   00000007:00000000 -> 00000002:208c0109:00000000:20000400
>   0000000d:00000000 -> 00000003:00000000:00000240:00000000
>   80000000:ffffffff -> 80000021:00000000:00000000:00000000
>   80000001:ffffffff -> 00000000:00000000:00000123:28100800
>   80000002:ffffffff -> 68743131:6e654720:746e4920:52286c65
>   80000003:ffffffff -> 6f432029:54286572:6920294d:31312d37
>   80000004:ffffffff -> 37473538:33204020:4730302e:00007a48
>   80000006:ffffffff -> 00000000:00000000:01007040:00000000
>   80000007:ffffffff -> 00000000:00000000:00000000:00000100
>   80000008:ffffffff -> 00003027:00000000:00000000:00000000
>  MSRs:
>   index    -> value
>   000000ce -> 0000000000000000
>   0000010a -> 0000000010020004
> HVM Max policy: 4 leaves, 2 MSRs
>  CPUID:
>   leaf     subleaf  -> eax      ebx      ecx      edx
>  MSRs:
>   index    -> value
>   000000ce -> 0000000000000000
>   0000010a -> 0000000000000000
> PV Default policy: 30 leaves, 2 MSRs
>  CPUID:
>   leaf     subleaf  -> eax      ebx      ecx      edx
>   00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
>   00000001:ffffffff -> 000806c1:00020800:c6d82203:1789cbf5
>   00000002:ffffffff -> 00feff01:000000f0:00000000:00000000
>   00000004:00000000 -> 04000121:02c0003f:0000003f:00000000
>   00000004:00000001 -> 04000122:01c0003f:0000003f:00000000
>   00000004:00000002 -> 04000143:04c0003f:000003ff:00000000
>   00000004:00000003 -> 04000163:02c0003f:00003fff:00000004
>   00000007:00000000 -> 00000000:208c0109:00000000:20000400
>   0000000d:00000000 -> 00000003:00000000:00000240:00000000
>   80000000:ffffffff -> 80000008:00000000:00000000:00000000
>   80000001:ffffffff -> 00000000:00000000:00000121:28100800
>   80000002:ffffffff -> 68743131:6e654720:746e4920:52286c65
>   80000003:ffffffff -> 6f432029:54286572:6920294d:31312d37
>   80000004:ffffffff -> 37473538:33204020:4730302e:00007a48
>   80000006:ffffffff -> 00000000:00000000:01007040:00000000
>   80000008:ffffffff -> 00003027:00000000:00000000:00000000
>  MSRs:
>   index    -> value
>   000000ce -> 0000000000000000
>   0000010a -> 0000000000000000
> HVM Default policy: 4 leaves, 2 MSRs
>  CPUID:
>   leaf     subleaf  -> eax      ebx      ecx      edx
>  MSRs:
>   index    -> value
>   000000ce -> 0000000000000000
>   0000010a -> 0000000000000000
> ```
>
> Guillaume
>
> On Sun, Feb 2, 2025 at 4:32 PM Andrew Cooper
> <andrew.cooper3@citrix.com> wrote:
>
>     This is a sanity check that an algorithm in Xen matches hardware. 
>     It is only compiled into debug builds by default. 
>
>     Given that you're running under virtualbox, i have a suspicion as
>     to what's wrong.
>
>     Can you collect the full `xen-cpuid -p` output from within your
>     environment?  I don't believe you're suggested code change is
>     correct, but it will good enough to get these diagnostics.
>
>     ~Andrew
>
>     On Sun, 2 Feb 2025, 15:32 Guillaume, <thouveng@gmail.com> wrote:
>
>         Hello,
>
>          I'd like to report an issue I encountered when building Xen
>         from source. To give you some context, During the Xen winter
>         meetup in Grenoble few days ago, there was a discussion about
>         strengthening collaboration between Xen and academia. One
>         issue raised by a professor was that Xen is harder for
>         students to install and experiment compared to KVM. In
>         response it was mentionned that Debian packages are quite
>         decent. This motivated me to try installing and playing with
>         Xen myself. While I am familiar with Xen (I work on the XAPI
>         toolstack at Vates) I'm not deeply familiar with its
>         internals, so this seemed like a good learning opportunity and
>         maybe some contents for some blog posts :).
>
>          I set up a Debian testing VM on Virtualbox and installed Xen
>         from packages. Everything worked fine: Grub was updated, I
>         rebooted, and I had a functional Xen setup with xl running in
>         Dom0.
>          Next I download the last version of Xen from xenbits.org
>         <http://xenbits.org>,and built only the hypervisor (no tools,
>         no stubdom) , using the same configuration as the Debian
>         package (which is for Xen 4.19). After updating GRUB and
>         rebooting, Xen failed to boot. Fortunately, I was able to
>         capture the following error via `ttyS0`:
>         ```
>         (XEN) [0000000d2c23739a] xstate: size: 0x340 and states: 0x7
>         (XEN) [0000000d2c509c1d]
>         (XEN) [0000000d2c641ffa] ****************************************
>         (XEN) [0000000d2c948e3b] Panic on CPU 0:
>         (XEN) [0000000d2cb349bb] XSTATE 0x0000000000000003,
>         uncompressed hw size 0x340 != xen size 0x240
>         (XEN) [0000000d2cfc5786] ****************************************
>         (XEN) [0000000d2d308c24]
>         ```
>         From my understanding, the hardware xstate size (`hw_size`)
>         represents the maximum memory required for the `XSAVE/XRSTOR`
>         save area, while `xen_size` is computed by summing the space
>         required for the enabled features. In `xen/arch/x86/xstate.c`,
>         if these sizes do not match, Xen panics. However, wouldn’t it
>         be correct for `xen_size` to be **less than or equal to**
>         `hw_size` instead of exactly matching?
>
>         I tested the following change:
>         ```
>         --- a/xen/arch/x86/xstate.c
>         +++ b/xen/arch/x86/xstate.c
>         @@ -710,7 +710,7 @@ static void __init check_new_xstate(struct
>         xcheck_state *s, uint64_t new)
>               */
>              xen_size = xstate_uncompressed_size(s->states &
>         X86_XCR0_STATES);
>
>         -    if ( xen_size != hw_size )
>         +    if ( xen_size > hw_size )
>                  panic("XSTATE 0x%016"PRIx64", uncompressed hw size
>         %#x != xen size %#x\n",
>                        s->states, hw_size, xen_size);
>         ```
>         With this change, Xen boots correctly, but I may be missing
>         some side effects...
>         Additionally, I am confused as to why this issue does *not*
>         occur with the default Debian Xen package. Even when I rebuild
>         Xen *4.19.1* from source (the same version as the package), I
>         still encounter the issue.
>         So I have two questions:
>         - Is my understanding correct that |xen_size <= hw_size|
>         should be allowed?
>         - Are there any potential side effects of this change?
>         - Bonus: Have some of you any explanations about why does the
>         issue not occur with the packaged version of Xen but does with
>         a self-built version?
>
>         Hope I wasn't too long and thanks for taking the time to read
>         this,
>         Best regards,
>
>         Guillaume
>


