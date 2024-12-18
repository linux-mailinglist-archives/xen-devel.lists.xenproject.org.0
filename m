Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5957A9F6B9C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 17:57:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860666.1272667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNxLw-0001vy-Kx; Wed, 18 Dec 2024 16:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860666.1272667; Wed, 18 Dec 2024 16:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNxLw-0001uP-IK; Wed, 18 Dec 2024 16:56:52 +0000
Received: by outflank-mailman (input) for mailman id 860666;
 Wed, 18 Dec 2024 16:56:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xglw=TL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tNxLv-0001uJ-BN
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 16:56:51 +0000
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12b9216c-bd61-11ef-a0d7-8be0dac302b0;
 Wed, 18 Dec 2024 17:56:49 +0100 (CET)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-4361b0ec57aso65246275e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2024 08:56:49 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c806b84esm14459654f8f.108.2024.12.18.08.56.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 08:56:48 -0800 (PST)
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
X-Inumbo-ID: 12b9216c-bd61-11ef-a0d7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734541009; x=1735145809; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rCfZYLFaL906dU0HrHmsxkV1Raijev2paNdLSI1zp74=;
        b=E3lX65mX8ujyxZFlvXbZDDzJFBV1prUkoIw8Iopt/88ozOswBzNmDUCPgi2+z5g7lE
         +PQKd/Q02vW4zG2aV00waJi0omlUA4K+aAci33U+02WHfi27X0A9ou951UopCV6YT/ro
         bca9rmL2R7st3Iu6yRC43hrzE1d3Wj4d0ozZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734541009; x=1735145809;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rCfZYLFaL906dU0HrHmsxkV1Raijev2paNdLSI1zp74=;
        b=ZWeFe1oiBKyLgkN9PB532U4ljDjppjRYNQ92LweVjPDWR/28vN2MF7HsMVoIj4Sq7D
         mbt6gf1qRyyQG5VHrAwm9A/WZBJrjnnFu/MOmrk8JZdylQ19ovhlIHDceMIErvojKrV7
         SO/kgcrYWZepiEF/3F3BwtlHfLN6M2Sz5xtZam4lczkVPATBnyEKeDlC8RCnKMj1AW4Z
         bzE0NRJuwtBrYkz7AFg7e2UUD20MjwpH1GPZq4nJfkvdsVO7svNznIEyiaAOzUA7K7p0
         ylr7cvKjrmTS9E1ILUwH4DyfOYiY5ZAWJ4PB6O54HwlLFyLMVnTwj4MbsSG3xU2pPkLl
         3F4g==
X-Forwarded-Encrypted: i=1; AJvYcCXa5+SsO6FMjG41vmi1cG8fsCXlF1uV3ZNeINWQJjVm46hhUKYsv9s9ERr2afJfhFTRoe9nAhBEBfk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2ROEIjwnWJ6hLsBed4W5f2iVPNNXPYagUBg6woooiUjooK9YB
	6A/5m6UKq+O4g+vrgKX1NBvCS/v3axHYYLcun/4ts8CCDMbYaPtPHbK8ykw3T0M=
X-Gm-Gg: ASbGnctCeiJHWqzcA0XmQPrjE5k1Tun/XsmyumhqOJxTI29Q4nzscr5fL/qlifjNeMC
	66r70DT/hVI/nuQFH4VG3RGW6KmAqeK8Tq58lpqmb7U3Y7K51Hpw3r49sRIMSzm8aRcJ6FvzRfa
	ZsZfMnvinvF68X48m4njuhQgen3OZcs9/jVf1Zrjed2BzXSoxBsAMgViXyzcI/uJ09JYdQaK4TY
	M6BifncqBFTXqYGH5Rq+IBv+mpO1MgLg1UsUoP3Op4lMxD/RW6TeK65P2fmtw7nJI6R1oIcZzVQ
	97CngjTFc/w/D7PS0/GH
X-Google-Smtp-Source: AGHT+IGscwqeBK6TMxnQR/IVvCuMDPqf8iBLq84ZeNG3j5sA5ANLXz+ooGObX1wf1VwjJkss0PDD1g==
X-Received: by 2002:a05:600c:1caa:b0:434:f5d1:f10f with SMTP id 5b1f17b1804b1-43655368679mr36784645e9.17.1734541009048;
        Wed, 18 Dec 2024 08:56:49 -0800 (PST)
Message-ID: <727d8945-42f5-4715-a5ff-818ea4bca6a0@citrix.com>
Date: Wed, 18 Dec 2024 16:56:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] x86/hvm: Use constants for x86 modes
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
References: <bf7146a8ccbf05ddc74d4f451a5fa586309b9a50.1733132729.git.teddy.astie@vates.tech>
 <6a0ee425-96ce-4361-ad23-7f21c3398694@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6a0ee425-96ce-4361-ad23-7f21c3398694@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/12/2024 3:54 pm, Andrew Cooper wrote:
> On 02/12/2024 9:49 am, Teddy Astie wrote:
>> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
>> index 02de18c7d4..dbc37e8b75 100644
>> --- a/xen/arch/x86/include/asm/hvm/hvm.h
>> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
>> @@ -26,6 +26,12 @@ extern bool opt_hvm_fep;
>>  #define opt_hvm_fep 0
>>  #endif
>>  
>> +#define X86_MODE_REAL  0
>> +#define X86_MODE_VM86  1
>> +#define X86_MODE_16BIT 2
>> +#define X86_MODE_32BIT 4
>> +#define X86_MODE_64BIT 8
>> +
>>  /* Interrupt acknowledgement sources. */
>>  enum hvm_intsrc {
>>      hvm_intsrc_none,
> We discussed this in the x86 meeting.  These want to live next to
> hvm_guest_x86_mode() with a comment stating that they're not
> architectural modes.
>
> During your work, you seem to have only looked at the the VMX side of
> things.
>
> There are several callers of hvm_guest_x86_mode() and
> svm_guest_x86_mode() missed.  Also an unnecessary include, and a couple
> of overly long lines.
>
> https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=commitdiff;h=4f8f63d49776d69ed9a978b6601c13c54c579a98
> is the incremental fix on top of this patch.
>
> Does this look reasonable?
>
>
> I've just realised that the check in nvmx_handle_vmx_insn() is an
> incredibly complicated way of expressing guest_cr[0].PE, and we've got
> the same opencoded elsewhere, so I'll also prepare a patch prerequisite
> patch to sort that out, then rebase this over it.

No.  It's subtly not (only) a PE check, so lets leave it as is for now.

I'll update the comment to say that some users rely on the order of
constants.

~Andrew

