Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1353BA38F1F
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 23:35:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890955.1300075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk9i8-0008Tk-5G; Mon, 17 Feb 2025 22:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890955.1300075; Mon, 17 Feb 2025 22:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk9i8-0008RH-2N; Mon, 17 Feb 2025 22:35:32 +0000
Received: by outflank-mailman (input) for mailman id 890955;
 Mon, 17 Feb 2025 22:35:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xGAw=VI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tk9i6-0008R9-7T
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 22:35:30 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d36c46b-ed7f-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 23:35:29 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso29187605e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 14:35:29 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b8471sm165969675e9.37.2025.02.17.14.35.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 14:35:28 -0800 (PST)
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
X-Inumbo-ID: 7d36c46b-ed7f-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739831728; x=1740436528; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6heibP1Ixa2J0igyTovBhk0tXgWi2vWzAlY0yioh1UQ=;
        b=ilbKb6PQiTtSE7VSYvMg4oTOkFV+2HLKF2fn9FImttS07AkDcko35ujOuKz6X92MQz
         n4heuD9Y+bfLEF0K+sCOtyCz1XKHd1i0xaLdWUzTmDs5orc6zwcomEvfBVsewwYnWAk/
         NoNaB56J5CbqH6cO2HlphxWCKmv6T9BarDAbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739831728; x=1740436528;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6heibP1Ixa2J0igyTovBhk0tXgWi2vWzAlY0yioh1UQ=;
        b=qZJpa6m9FCe4m7plyp/kyBea/GcFnUKOC4wzogjzUnVnjtGafrhWgH5O8uEva+P1Hd
         FfzCMu9AUtLG7ZiX8+MFeY3CgcChs5Wg15OEdD3cHEziIl7UaYxy+g/fqWtcjGpDQk9C
         C4PRN8DBp6T+6/rbom20xRbOi8Lr54UNIdGYOaEoy7w5OOunM/TJK0W/6tMnDToQTSoC
         2VGPgoE5nqyJSFUG+SCcHcnYJ2DQkhG0fbzihegvAOr5M54jseZ28Wy+939OXlu/R+uH
         bH2JG4M5E6/EzVGnSzY1CROOWH0ZOHSatqJ7bJmOrz+xfW3dwoMC6c6VTSQIshygL5pf
         PBEg==
X-Gm-Message-State: AOJu0Yzd/GFkqxl2DBqZkbMysEO+t0Giy+dkE/wDb34Z4sq7Kbgs8820
	0K8h/UGxWcFNRsfaqVzY7t3qUiJkbKGpiRcSmk6TAQwrMC48wStuKXVJzo1mhkg=
X-Gm-Gg: ASbGncskvCoZzLEoqoHD0GVI8/0iWl4FN3MUQ3aF2eJRZkYKsMHJ7XkoEdv3vi/0yfu
	ym9ypAjmF4MPYRnaSXoVs43DZHpRoxbcnj+LtzILd4h+L1a+tgU7HTKm/52PIXfER9VWQ6ckGe8
	ZjU1PhIRb5+cgHtsayQJkCX+NMWn6CfpdSTRt8FazUiaYyWh6uQZLDyPMitF8lS2MbsCAHmVXoI
	BEIkjt4RZzkCEFWZnQ7lYRcaP7e5gMCKIjcdJu47UFTgphti0Ckm6CXb9dqkM+GCqDeYoIw39Bk
	UYsGNJoJX6G/iM7vn/HvDK7RKuudPdlIOcP+se+CIBSfAq1/+69LIcY=
X-Google-Smtp-Source: AGHT+IFr/oSXzcztP+GJ36n2jif8UvP98t+pimYAFEQJcvhvL0gFl8fqQDJOEhxhsRRKDnlkeG/bnw==
X-Received: by 2002:a05:600c:3c9d:b0:439:6ab6:5d46 with SMTP id 5b1f17b1804b1-4396e74b143mr99363265e9.27.1739831728504;
        Mon, 17 Feb 2025 14:35:28 -0800 (PST)
Message-ID: <9e329d19-d304-4aa1-9064-baa997238fe9@citrix.com>
Date: Mon, 17 Feb 2025 22:35:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: early crash while loading dom0 kernel between git:19730dbb3f and
 git:414dde38b0
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: "Greg A. Woods" <woods.greg.a@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <6CBF18F6-8AF8-4A22-A4EC-0D7F382FA815@gmail.com>
 <4be50b34-f4bf-46fd-b851-53db26272877@suse.com>
 <BB0FB055-42C1-4181-90C7-012A02387595@gmail.com>
 <87175acd-3bbe-4aa5-8925-ae2fc721a29f@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <87175acd-3bbe-4aa5-8925-ae2fc721a29f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/02/2025 10:10 pm, Andrew Cooper wrote:
> On 17/02/2025 10:02 pm, Greg A. Woods wrote:
>> Note again my local patches do not change any actual code in the xen subdir.
>>
>> The "has no endbr64" messages are possibly due to the fact that I'm still
>> using GCC-9.x on NetBSD, and as I understand it that compiler is too old
>> to support ENDBR instructions.  I disabled the related build-time tests.
>> I can build with GCC-10.5 on another host and try that too.
> Can you attach your .config file from the build?  Those messages ought
> to only show up in builds where ENDBR's are present, but it's possible
> that something's out of sync with the various Kconfig controls involved.

Godbolt thinks that GCC 9.3 should be sufficient to be CET-IBT
compatible, and my notes (in Kconfig) match.

https://godbolt.org/z/1r9PqYb8j

~Andrew

