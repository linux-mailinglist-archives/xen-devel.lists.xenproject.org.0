Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8FCA9B018
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 16:05:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966386.1356610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7xCA-0001oZ-P1; Thu, 24 Apr 2025 14:04:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966386.1356610; Thu, 24 Apr 2025 14:04:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7xCA-0001lb-Kv; Thu, 24 Apr 2025 14:04:54 +0000
Received: by outflank-mailman (input) for mailman id 966386;
 Thu, 24 Apr 2025 14:04:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KF8R=XK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7xC9-0001lR-CC
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 14:04:53 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15068069-2115-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 16:04:48 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4394a823036so10474675e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Apr 2025 07:04:48 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a06d4ae0c3sm2173164f8f.29.2025.04.24.07.04.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Apr 2025 07:04:45 -0700 (PDT)
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
X-Inumbo-ID: 15068069-2115-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745503487; x=1746108287; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Xxpv0yRGCcRy4bvVn3wUom7PcRVRG/rxXEeQkIO6LWU=;
        b=skTX9g9fxTIbiD8arm0aIkHV7ykJZz6Tbldf8AaLBY66TYP1IUGYq1rH8zcb023d95
         ynopYt+lQ+A1/QCL72w01j9yHxRI7ilhm1PG32xQ/36T5m6bAI2IL8JM4BBRJ+DUJFDG
         71i5i6XTENRv3+aBObi1rrpSuJYgTqsHdnQI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745503487; x=1746108287;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xxpv0yRGCcRy4bvVn3wUom7PcRVRG/rxXEeQkIO6LWU=;
        b=XzQNKkIPkaDQ3uqs/PauLUdEBbz4vUYrXW15Xn6uFcTtTXfjVfNyWsxfxDQXCWocrv
         lJysofKsvqmembWO6hWoCqS3d2XmZ2KrghgiGMWWstbgresCkZP9nBEVJqKAaGP4wlbx
         WhKs5rOhywkELRq8vq63sW/oDBReU2MjURVCuHhRSgUIG2+wpTxnbj7An3k/cCjHJwfW
         pyAMjF5IL1Si1h9TChGVmPBoWxL4Iu8zWEEh7erVpBUIt6KiZlFJCpyn3Olga3O2V4NN
         UT48IIGTGSJZkmKsU+mp6xMB8Vg5tXjI8Zum0g8qnGrzHLtaWc+78hgpLwMiW+6npLdF
         7PNg==
X-Forwarded-Encrypted: i=1; AJvYcCUOLVBLIXiXHCU4H21cmOQFXmHm2KuXiLjxmV6xhtxuyKJj/Skv3aLm5A8EbF6gJTjJmz7DGTmt1lU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5ekzxLRzAkwBxIripqwF5sAhWwkCOPREDvOH1/IacStPriuQa
	9pm1kfb5dqNcIdI97xG+CI824kcsH75lETFqBCU5n+TD0TQeOF7Wtna0hZeGZ+A=
X-Gm-Gg: ASbGncvxHptu3/kyU/WYy5w6t+0uF3PHPSnYgsrM/+xfixLbV17acMLEARgCoZWYI6f
	/r2VcGacl+PRuQss8JouQPg7u1yYH6pNWlK/j3Y5jwprM8ME952EC9H8LIdM6RMLsmweKGZEZtV
	88CL7or8gkk6fRaQUx9X9kTNsHRhwC6lpgAXrwTe+J/fv+BvzE9HYmHw6VuubVNZ85rxiDlyA+7
	NDUMcI/FbM6UbYcqRnbczXbNdsFk/l3e13uT8Vs1Xn2kfA+1mMsbaNf4cHHEEei6FvFgL/FOroT
	qqnuGDmC6/wsxdLFYG4AKDZniMExkul42KUT1ULUmHvstU+I1oQay5ENgT0YYWdPuey4ewAS2yY
	UE81AJ7kphEuAWkXS
X-Google-Smtp-Source: AGHT+IGoE3ihziAEJXsspY6laCE6Uygh/fPcfmGS2qIZbyw1tTet9pVyn+zlZyMbh/QzHTr3nNtp2w==
X-Received: by 2002:a5d:47ad:0:b0:390:e62e:f31f with SMTP id ffacd0b85a97d-3a06cf5000amr2185367f8f.3.1745503485881;
        Thu, 24 Apr 2025 07:04:45 -0700 (PDT)
Message-ID: <659665fc-e938-4c2d-9707-b44f637bb6fb@citrix.com>
Date: Thu, 24 Apr 2025 15:04:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: UBSan bug in real mode fpu emulation
To: Fabian Specht <f.specht@tum.de>, xen-devel@lists.xenproject.org
Cc: manuel.andreas@tum.de
References: <l2jnq5cxgkzcdkndp3mjf76nd7wdp2pbstkqo7llaarmbfqdge@bxdydela4rcf>
 <7e3b941d-ec4e-4158-8844-a3cf236c8d4d@citrix.com>
 <lfakyg5jqdnbm6kleldta52xm6pzdy2fikr6ydxw5rs4wplefv@ymabtpq6fdvq>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <lfakyg5jqdnbm6kleldta52xm6pzdy2fikr6ydxw5rs4wplefv@ymabtpq6fdvq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/04/2025 2:13 pm, Fabian Specht wrote:
>>> if ( !s->rex_prefix )
>>> {
>>> 	/* Convert 32-bit real/vm86 to 32-bit prot format. */
>>> 	unsigned int fip = fpstate.env.mode.real.fip_lo +
>>> 					   (fpstate.env.mode.real.fip_hi << 16);
>>> 	unsigned int fdp = fpstate.env.mode.real.fdp_lo +
>>> 					   (fpstate.env.mode.real.fdp_hi << 16);
>>> 	unsigned int fop = fpstate.env.mode.real.fop;
>>>
>>> 	fpstate.env.mode.prot.fip = fip & 0xf;
>>> 	fpstate.env.mode.prot.fcs = fip >> 4;
>>> 	fpstate.env.mode.prot.fop = fop;
>>> 	fpstate.env.mode.prot.fdp = fdp & 0xf;
>>> 	fpstate.env.mode.prot.fds = fdp >> 4;
>>> }
>> Several things.  First, please always the UBSAN analysis from the crash.
> (XEN) UBSAN: Undefined behaviour in arch/x86/x86_emulate/blk.c:87:66
> (XEN) left shift of 65535 by 16 places cannot be represented in type 'int'
> (XEN) ----[ Xen-4.20.0  x86_64  debug=y ubsan=y  Tainted:     H  ]----

Yes, it is a shift into the sign bit.

>
>> There are several different ways that shifts go wrong, and I suspect
>> this is a shift into a sign bit, which is notable given the unsigned
>> underlying type.
> Might be, but I am not entirely sure. Either way, it should be fixed
> through a simple cast to unsigned int I think.

I have a sneaking suspicion that this is sufficient:

diff --git a/xen/arch/x86/x86_emulate/private.h
b/xen/arch/x86/x86_emulate/private.h
index 30be59547032..9f3d6f0e5357 100644
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -385,9 +385,9 @@ struct x87_env16 {
     union {
         struct {
             uint16_t fip_lo;
-            uint16_t fop:11, :1, fip_hi:4;
+            uint32_t fop:11, :1, fip_hi:4;
             uint16_t fdp_lo;
-            uint16_t :12, fdp_hi:4;
+            uint32_t :12, fdp_hi:4;
         } real;
         struct {
             uint16_t fip;


The problem is that a uint16_t bitfield promotes into int.  A base type
of uint32_t should cause the bitfield to promote into unsigned int directly.

>
>> Also, are you aware that the test isn't properly in Real Mode?  It's in
>> so-called unreal mode (not actually a real mode, but a consequence of
>> how the segment registers work), which is relevant to how you manage to
>> re-enter the emulator for FLDENV.
> Yes I am aware. But the bug should be triggered regardless of the
> current mode, right?

Well, that depends.  Some CPUs trucate %eip to %ip at this point.  Xen
doesn't, which is why the XTF test doesn't crash in a different way.

~Andrew

