Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 460039EDCFF
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 02:17:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855450.1268361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLXpc-0003Bv-6a; Thu, 12 Dec 2024 01:17:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855450.1268361; Thu, 12 Dec 2024 01:17:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLXpc-0003AB-3e; Thu, 12 Dec 2024 01:17:32 +0000
Received: by outflank-mailman (input) for mailman id 855450;
 Thu, 12 Dec 2024 01:17:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IXdK=TF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tLXpa-0003A5-8E
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 01:17:30 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da9acf96-b826-11ef-a0d5-8be0dac302b0;
 Thu, 12 Dec 2024 02:17:29 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-385e3621518so13998f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 17:17:29 -0800 (PST)
Received: from [192.168.189.19] ([81.6.40.111])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3878251c4e1sm2564022f8f.89.2024.12.11.17.17.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 17:17:27 -0800 (PST)
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
X-Inumbo-ID: da9acf96-b826-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733966248; x=1734571048; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=18uw1qSoAWfFGPpqjRt2lgQFGAo3CbWDaWK05fK9KmM=;
        b=SO0Y2L67D7hD0hby9Jqlfz9qYhbFGOTNkj2pEluat3+9z80sThKmQcW7e2Corh+iLQ
         iclBbc2t0YgyQX4Sx1HrLYJ8z4WhSl/pw5p3JIaDDjE3rVe7cJs58mAfD5TKv9C+8RhK
         zNd6OqbRkSIoiN8mtcjFQ5hOsfBRd6GkBlbTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733966248; x=1734571048;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18uw1qSoAWfFGPpqjRt2lgQFGAo3CbWDaWK05fK9KmM=;
        b=C+zT3bnpCR2gM8LLidCBZ9MkDWDvMVKiXfZUDt5zih6eyKkJJy3c3DgW6npvnD0Mh5
         V1oDZ0RQl0OPmfowRX6nUF35fx3jVH9HB1HrltzBRhjZGfXXgW5XjEOroVkmb84wVjIr
         1atqWYx5HPtMuPaeeLl4KV/5gEsnDVU/g/ri4r1kLjndGwhGlvGwuMSvbz7LnwR/iqk+
         sqW/tFUHTyWAUoXz/gjP/ztOfc6NNkKyO+9aFwyfd2zxXdrQ7g+80zTaeycVLNB1fo6h
         0rH8cD9ZIVk+xH1EVjwz2oaK5BQNhZ4EMFmbhYolrLAvKhlmpRhSl/QyZ/eS9CtgMTT1
         f4Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWzpK8Y+grDz89N5tF7+1Goyyf4Gnls6rTnTfdchlP618i8x9kROydXaY69Kgx2Z8JAHvHM2pOzGFY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5urovES4UqIa50BAPBMGfOCta7J9ETG41w/ljrK671JCgQISa
	mi7kOUeQiQ8q6ah9SzO8X8GubT2SzhTEso6Jg7Tp4DJtd2HFnqwJGb12UppJDkI=
X-Gm-Gg: ASbGncueQALRPxscHlvdDuPKiVoHO2rjcX9iwhtESB5wRI9+nRMoFv26/YHX6Dg6l06
	sgisQ2LlwcrhCzS7lgthNVpyxz58HfUunVAGpm7B6KWAcAVjW9g1QZG/grIJDaW8Mr0r9ex9IBS
	bgBLDDYIZ+pkj+jLvL1YWFEGeHBk1Qr6IhcTxdGD6WqezpRvxJmaqREhb6FNh9A61GmfVsnVFo2
	3glG0M7p0fVv9nLUo9PzHWjETmLCpKzDVgZSymnK8MnDQLKmfBpNO/rIpa8bqmI09Q=
X-Google-Smtp-Source: AGHT+IHrVSqxm+RQc72lUrg49gTNgalA7n18Z1JXGeInPdIpjqSF++ynetQrTMpQL65yRS+bedk2mg==
X-Received: by 2002:a5d:6487:0:b0:385:fc32:1ec6 with SMTP id ffacd0b85a97d-387876c37abmr1153850f8f.50.1733966248214;
        Wed, 11 Dec 2024 17:17:28 -0800 (PST)
Message-ID: <fd9ea545-0eb1-4803-9d1e-df15c5805fa3@citrix.com>
Date: Thu, 12 Dec 2024 01:17:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add stack protector
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20241211020424.401614-1-volodymyr_babchuk@epam.com>
 <f1e86e0e-985a-41ae-a94c-979288275257@suse.com> <87pllx3gib.fsf@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <87pllx3gib.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/12/2024 12:13 am, Volodymyr Babchuk wrote:
> Hello Jan,
>
> Jan Beulich <jbeulich@suse.com> writes:
>
>> On 11.12.2024 03:04, Volodymyr Babchuk wrote:
>>> Both GCC and Clang support -fstack-protector feature, which add stack
>>> canaries to functions where stack corruption is possible. This series
>>> makes possible to use this feature in Xen. I tested this on ARM64 and
>>> it is working as intended. Tested both with GCC and Clang.
>>>
>>> It is hard to enable this feature on x86, as GCC stores stack canary
>>> in %fs:40 by default, but Xen can't use %fs for various reasons. It is
>>> possibly to change stack canary location new newer GCC versions, but
>>> this will change minimal GCC requirement, which is also hard due to
>>> various reasons. So, this series focus mostly on ARM and RISCV.
>> Why exactly would it not be possible to offer the feature when new enough
>> gcc is in use?
> It is possible to use this feature with a modern enough GCC, yes. Are
> you suggesting to make HAS_STACK_PROTECTOR dependent on GCC_VERSION for
> x86 platform?

(With the knowledge that this is a disputed Kconfig pattern, and will
need rebasing), the way I want this to work is simply:

diff --git a/xen/Makefile b/xen/Makefile
index 0de0101fd0bf..5d0a88fb3c3f 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -434,6 +434,9 @@ endif
 
 ifeq ($(CONFIG_STACK_PROTECTOR),y)
 CFLAGS += -fstack-protector
+ifeq ($(CONFIG_X86),y)
+CFLAGS += -mstack-protector-guard=global
+endif
 else
 CFLAGS += -fno-stack-protector
 endif
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 9cdd04721afa..7951ca908b36 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -28,6 +28,7 @@ config X86
        select HAS_PCI_MSI
        select HAS_PIRQ
        select HAS_SCHED_GRANULARITY
+       select HAS_STACK_PROTECTOR if
$(cc-option,-mstack-protector-guard=global)
        select HAS_UBSAN
        select HAS_VMAP
        select HAS_VPCI if HVM



Sadly, it doesn't build.  I get a handful of:

prelink.o: in function `cmdline_parse':
/home/andrew/xen.git/xen/common/kernel.c:216:(.init.text+0x20f2): failed
to convert GOTPCREL relocation against '__stack_chk_guard'; relink with
--no-relax
/home/andrew/xen.git/xen/common/kernel.c:230:(.init.text+0x246f): failed
to convert GOTPCREL relocation against '__stack_chk_guard'; relink with
--no-relax

which is more toolchain-whispering than I feel like doing tonight.

~Andrew

