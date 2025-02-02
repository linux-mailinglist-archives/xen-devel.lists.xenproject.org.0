Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B96CAA24F42
	for <lists+xen-devel@lfdr.de>; Sun,  2 Feb 2025 18:32:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880436.1290508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tedpP-0008B8-9h; Sun, 02 Feb 2025 17:32:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880436.1290508; Sun, 02 Feb 2025 17:32:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tedpP-000880-6j; Sun, 02 Feb 2025 17:32:15 +0000
Received: by outflank-mailman (input) for mailman id 880436;
 Sun, 02 Feb 2025 17:32:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=okHa=UZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tedpN-00087u-Jb
 for xen-devel@lists.xenproject.org; Sun, 02 Feb 2025 17:32:13 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2cfdafc-e18b-11ef-a0e7-8be0dac302b0;
 Sun, 02 Feb 2025 18:32:12 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-436249df846so24534375e9.3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Feb 2025 09:32:12 -0800 (PST)
Received: from [10.16.14.83] ([185.201.63.252])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c11fadbsm10291907f8f.44.2025.02.02.09.32.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Feb 2025 09:32:11 -0800 (PST)
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
X-Inumbo-ID: a2cfdafc-e18b-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738517531; x=1739122331; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Qr05B+bjtYUuWI7T95HAJMA4JUdK8PegUUcWqyV5OPM=;
        b=JSCHBSesOZGhUhqwdQ0tWmdmBLLnAdcXYPst0RANFHejXMutHI5PSXj//2+lw3x2Hs
         rXbgmT9DuutuzC5usQHUBlADkfm9yEbxN85unCsaQmUUfXlg2JkXhsGk2LXZpfnr+Bns
         /g+CkoX4zV1r96bWu8Nbb7uNWyLaayPMpZaOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738517531; x=1739122331;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qr05B+bjtYUuWI7T95HAJMA4JUdK8PegUUcWqyV5OPM=;
        b=lLpkcpRbE67i4e0J+vtVtlhNPPqro7gXSx6leI1BV5KBKI8NtWRXR6kkLw11e1ad4Z
         ljWVhudXHVoiF30VAXsnc0xv6sU53L91eTku9Q5QwejhFwyuRHc2/oHacZz4W62yTcYm
         e7SE3FPXPP4zHQf3JlP2OFblvhTfMiYx9RGxYj4HYrVbyJEyTMLq+qOV8ZAoJIl3V2uc
         7Nn8nXkVuND9wIXwaBMeEEP33sl7Hyp+Tlp18BpVlg4NhJ/MG7eHTE1wTZbY3/LWnLNp
         zALX+P25vpuJnzFMq0QHgapBup8rF6GHN0u3m6I1Nbs1AV4Hi9IMGNpgfonuRLO8LIyL
         dMKQ==
X-Gm-Message-State: AOJu0YxXAFoFVNEKy126Q38/Mlh7VW4/Lvdap5Mijq1FN4s2VZx3qI78
	EPMj0Bnb4n6VWH8c5VOPvzOsLnX8r5Shf3fgL7tBJl1lcKoRdB8Jv00IL1WHdESrqGFH4ommbh4
	6Eks=
X-Gm-Gg: ASbGncuMECoQgq7PZ1fw6webPLZ6InIPIwvINvuatWxczjIP56d3Dy8waNV5FuKXFqT
	Md4mPfznyklBfHyM7QgcYw9HtcYJA0O4DKA8ioZ6XiBwTtJBW1iSqzgdM0ZMNhit0SDnxxUub4F
	ZfbiwyXdd5jfvF3L0uRybno/EZnwxNh7Bmzj0sm8E7m3Y6a2/qEjic5hXlFGfo+pRER2+jcvlEA
	uqyutOSVpFm3toM9SI7QPf3P2iHCE7HX+xYA7yhU/rpag/qFiFUvP/hLeh5wGXp9zGTjhmNhW7a
	qdTHj2APEwBTnBfjRfjJVwJNOQ==
X-Google-Smtp-Source: AGHT+IG2zhal0i9zLcsS7gdqOChUqnpmMiocQVSC5gmWRifFJO7aCcSR03sWiIdINtFrinqt7lxP0g==
X-Received: by 2002:a05:6000:1fad:b0:38b:ed88:f045 with SMTP id ffacd0b85a97d-38c51b61164mr17236856f8f.33.1738517531456;
        Sun, 02 Feb 2025 09:32:11 -0800 (PST)
Message-ID: <087acd38-868d-4e1b-ab0f-9dbdb0ceb8a8@citrix.com>
Date: Sun, 2 Feb 2025 17:32:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen panic due to xstate mismatch
To: Guillaume <thouveng@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <CACt9=QgsSM18to9M5k8+3N3NvRoNVmAvsQo5oLO5-A0dm7VFNg@mail.gmail.com>
 <CACBT2OvVcDzoghr5SSjfvA5c9=LDs7DC6Z1Pi0QJ2sv0YFcEfw@mail.gmail.com>
 <CACt9=QiZhq94_=gSpSs782tM9uYQqvgrmOXeGw47C31-dwcrgw@mail.gmail.com>
 <4218bce7-b615-40d7-8d40-b2553d8b1662@citrix.com>
 <CACt9=Qgc=wjyRujFT=T2r1pvpyqWCOwzXw18BLO0uca7KuPKJA@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CACt9=Qgc=wjyRujFT=T2r1pvpyqWCOwzXw18BLO0uca7KuPKJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/02/2025 4:58 pm, Guillaume wrote:
> I attached the output of the `xl dmesg`. This is the 4.19.1 kernel I
> rebuild but I have the same issue with master (just for info).

Thanks.  This is a TigerLake CPU, and:

> (XEN) Mitigating GDS by disabling AVX while virtualised - protections
> are best-effort

is why Xen is ignoring AVX.

Now, as to the bug.  From the panic line, you're seeing:

> XSTATE 0x0000000000000003, uncompressed hw size 0x340 != xen size 0x240

xstate is XCR0_SSE | XCR0_X87, and the correct size for this
configuration is 0x240.

There reason why it matters is because this is the amount of data the
processor will write out/read in for the XSAVE/XRSTOR instructions,
which are used for context switching.  These instructions are also
available in userspace.

Here, VirtualBox is claiming that with AVX disabled, it will still write
out the AVX registers.  This is buggy, but we're going to have to narrow
it down further.

Can you try building Xen with this additional line

diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index af9e345a7ace..5a5011ba8b10 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -789,6 +789,8 @@ static void __init noinline xstate_check_sizes(void)
      */
     check_new_xstate(&s, X86_XCR0_SSE | X86_XCR0_X87);
 
+    asm volatile ("vzeroupper");
+
     if ( cpu_has_avx )
         check_new_xstate(&s, X86_XCR0_YMM);
 

and see if the result crashes or boots?

One possible bug is that VirtualBox is shadowing XCR0 and the real
setting in hardware is 0x7 (including XCR0_AVX) rather than 0x3.  In
this case, the reported size is correct, and VirtualBox is failing to
honour the XSETBV setting.

Alternatively, another bug is that XCR0 is really 0x3, but the CPUID
emulation for max size is wrong, in which case the XSAVE/etc
instructions wont actually access beyond 0x240, and "all" that's wrong
is that we'll allocate a larger buffer than necessary.

The VZEROUPPER (an AVX instruction) should distinguish these two cases. 
If Xen crashes with it in place, then the XCR0 register is correct and
it's CPUID which is buggy.  If Xen boots with that in place, then
Virtualbox is shadowing XCR0 with a different value behind Xen's back.

~Andrew

