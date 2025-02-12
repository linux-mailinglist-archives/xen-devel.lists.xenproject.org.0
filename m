Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09158A32D42
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 18:21:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886701.1296320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiGPr-0008OK-E8; Wed, 12 Feb 2025 17:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886701.1296320; Wed, 12 Feb 2025 17:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiGPr-0008MV-BM; Wed, 12 Feb 2025 17:20:51 +0000
Received: by outflank-mailman (input) for mailman id 886701;
 Wed, 12 Feb 2025 17:20:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p9NR=VD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tiGPp-0008Ke-55
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 17:20:49 +0000
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adb98e19-e965-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 18:20:38 +0100 (CET)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso35529735e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 09:20:38 -0800 (PST)
Received: from [10.81.43.157] ([46.149.103.11])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a04f217sm25337795e9.1.2025.02.12.09.20.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 09:20:37 -0800 (PST)
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
X-Inumbo-ID: adb98e19-e965-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739380838; x=1739985638; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HdkkOFQw/ilOoO1aY89tYbviAs4hXdDnJpnRD3O4cOQ=;
        b=Pj08JnKVVv97rLGv4lNYHiDorzVZ2yWdTr3S+JJE+UmIWW00vFiQQpyob/UDhuSa8v
         c6KLTCnUtIhs+Ak0SzhqBYc2I71mwYLRjf9NTzqQJaKEBfLTipjxoU51N+CLYNdSJ/P/
         AFDcDxu5BMqJc0SnbVT/kqq0oGu54KgIHlCDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739380838; x=1739985638;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HdkkOFQw/ilOoO1aY89tYbviAs4hXdDnJpnRD3O4cOQ=;
        b=NLphm7I0aLANISHdiX6Bl5ol+ZS2d24EUmF4+A6ikJvF7SCOAcsTuzlmIFCKW5E7/N
         ofIz/aGegiaxvTKh3OPEmsHsL1PcutzdmDsiT7XfDnuqnoeUQTDcd0kW7gHG1q0vGeLl
         Wtlgz7Rim2odTeT475r1gnjO5kK/LiUCdpE9MYJqeiwJZuMyPe15s5Rtrc2Dib5GJGX8
         X6itWxGJsC9ZRBArfJ8VICQkriQrzORSwjhoNeK+FM3YAgUG1t1lrQyOsJx35QnBpCg7
         BL0Xq0F/qS5hJ0CZ870BEOmEu/9r0DyKMQaph0t1yj+wbqWXLFZB7wP01IfsFHHKivXZ
         5eow==
X-Gm-Message-State: AOJu0YyGtMaVIn9cVBNYWDWI799FKmV3GLjjSIo5Uv+ricSQ/GjWvCCW
	M3JAf+e8PEepYeWgry+FuUHqUXhk2SP108yFcqB/U2bToVE6Za5h7OXpsfLfblluX2q0LvJpi0r
	imJ3Z1A==
X-Gm-Gg: ASbGncvpqSL2uofqYhfy3DZVSgXKxW//oHYe/i24kKUrjSBIthusSj7W4PGJU9omxp5
	UydkoFt5ws4T86aptcEMJtMWsvFFNR8K1u/qp0K5SNVvEGUEhIxZEgE6i2qXaIDWJsCAQswYS42
	jMu1+suqpZtA/NxGQRXb+AJBrri2pEEXrcF4yZMflYzeOKDscTlWbQCAoyb5w/XsTxCSfNHlpcO
	DrVv3S1TeI/7/H309nROU8sozgK4xl0VjZALP2r9L1XktkyS8432vPkelxnHAdAYTCLU1hxNfcT
	29xWakDzUBkd3ldppuBgcmtvwA==
X-Google-Smtp-Source: AGHT+IFC2BGDg9/vLp/FoTQVxT6Vxaf+uam+TeBMu2IQ6upuudgctC/Xrm3jP+F24XWVZJXG32Fvgw==
X-Received: by 2002:a05:600c:870a:b0:439:554f:f64f with SMTP id 5b1f17b1804b1-439601202c1mr4935715e9.0.1739380837892;
        Wed, 12 Feb 2025 09:20:37 -0800 (PST)
Message-ID: <65338578-dd6c-4f01-807e-da389cc60cb8@citrix.com>
Date: Wed, 12 Feb 2025 17:20:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: blowfish failure to compile
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I've noticed the following failure in XenServer's build environment

> make[6]: Leaving directory
> '/builddir/build/BUILD/xen-4.19.1/tools/tests/x86_emulator'
> In file included from /usr/include/features.h:535,
>                  from /usr/include/bits/libc-header-start.h:33,
>                  from /usr/include/stdint.h:26,
>                  from
> /usr/lib/gcc/x86_64-xenserver-linux/12/include/stdint.h:9,
>                  from blowfish.c:18:
> /usr/include/gnu/stubs.h:7:11: fatal error: gnu/stubs-32.h: No such
> file or directory
>     7 | # include <gnu/stubs-32.h>
>       |           ^~~~~~~~~~~~~~~~
> compilation terminated.
> make[6]: *** [testcase.mk:15: blowfish.bin] Error 1

It's non-fatal, but it reduces the content in test_x86_emulator which we
do care about running.

Elsewhere in the tree we fix this with -ffreestanding -nostdinc
-I$(XEN_ROOT)/tools/firmware/include but that isn't an option for
test_x86_emulator in general which is hosted.

However, it is an option for blowfish.c specifically which is
freestanding, and for which we build a 32bit form in an otherwise 64bit
build.

Therefore, it stands to reason that:

diff --git a/tools/tests/x86_emulator/Makefile
b/tools/tests/x86_emulator/Makefile
index 294d27ebaa08..e46fd8becb96 100644
--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -33,8 +33,8 @@ HOSTCFLAGS += -m32 -I..
 
 else
 
-blowfish-cflags := ""
-blowfish-cflags-x86_32 := "-mno-accumulate-outgoing-args -Dstatic="
+blowfish-cflags := "-ffreestanding -nostdinc
-I$(XEN_ROOT)/tools/firmware/include "
+blowfish-cflags-x86_32 := "$(blowfish-cflags)
-mno-accumulate-outgoing-args -Dstatic="
 
 3dnow-vecs := 8
 3dnow-ints :=

should do what we want, except it doesn't.  Somehow this is getting
injected the intermediate blowfish.h:

> blowfish.h:617:99: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or
> ‘__attribute__’ before ‘/’ token
>   617 | static const unsigned int __attribute__((section(".test,
> \"ax\", @progbits #")))
> blowfish_x86_32_I/local/xen.spec/scm/tools/tests/x86_emulator/../../../tools/firmware/include[]
> = {
>      
> |                                                                                                  
> ^

and at this point I've got completely lost in this build system.  The .h
generation seems to loop over each cflag, and while that looks plausible
for vector generation, I can't see how it works (except by accident) for
blowfish.

The problem is the generation of $flavor, but this logic is completely
opaque.

~Andrew

