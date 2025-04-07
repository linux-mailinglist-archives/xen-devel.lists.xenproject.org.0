Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 828B1A7D66A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 09:43:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939292.1339461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1h8S-0004lt-5G; Mon, 07 Apr 2025 07:43:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939292.1339461; Mon, 07 Apr 2025 07:43:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1h8S-0004jX-26; Mon, 07 Apr 2025 07:43:12 +0000
Received: by outflank-mailman (input) for mailman id 939292;
 Mon, 07 Apr 2025 07:43:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxXC=WZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u1h8Q-0004jQ-T1
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 07:43:10 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3393b67-1383-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 09:43:09 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso33084715e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 00:43:09 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c30226959sm11017969f8f.82.2025.04.07.00.43.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 00:43:08 -0700 (PDT)
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
X-Inumbo-ID: f3393b67-1383-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744011788; x=1744616588; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vp+EyQO0bnLgQcexw23Vk/21s7yMa6oJPnt9uaxkPyQ=;
        b=pxzBIAkV+/PKUxxy5HTyFg7ijNpZTu1H1gZY/xfitEg6jsyb0rZP+LClJ4zH1PB7lT
         Vktxkk6EvUBuWm/f5DKv5bBvX7lr2HtlUwRkVkTGYi5gWuDgME4eWXH68RtiCgLibVT5
         HnXAR/pb31gsJP44HGGghA+UNFIDcYTMWHNT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744011788; x=1744616588;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vp+EyQO0bnLgQcexw23Vk/21s7yMa6oJPnt9uaxkPyQ=;
        b=vo5ciLXzYSGXcF6NeB68HdU2xHVZP3jvEwNE9cp7QjDEwkdzTY6Kuk4vhSHzmV5T/D
         zVpUIucJxQixoD8Nur4irUG8tvklT2nlLKvEceBhr84UixTMvsXW+ZoOhO/j2px/GObG
         pfEkuxFqtoeBjYW0vGfjy2UB2r5QW5MYI85HCpVnPszMlQpMgymDfwOJTi7dii5PD/qe
         D68H8bS+Mas0w0ziwr2HpRDJbl5AkNHe9mNcg9uFakWHJhDhKrb+EeftXTFDc4XPOMd5
         20wsoXCUGoWeEdCSesaQVq7nlMgHmu1j1btF5XmhBqhF6wmUXZGqXh2GV6h3PhmD6BiQ
         1SIw==
X-Forwarded-Encrypted: i=1; AJvYcCWhT1V0U3R4jTJCZLYvhA52tmTjtHTdBmKYNU7bemZEFGN55jRalmlecj9tGumQcjvF51z/Cl6bTDc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywj1GtDG8Km617Xn8ZBhYafGhtgvjZNhwCCi2Lqjox7o+nPm2vy
	iuuIMDtr9bmEEZ+GlodXJh3aUoA6KBW/A3+JluWDN/9Fcn42Ji0ZYJp//iSQ3SHW7SyE0PRt5L2
	Q0tk=
X-Gm-Gg: ASbGncs+YVcSzMlsyrHemr3juo4+akDT5Wx/7QIxighJ0ru0/C0igUERi89NLYiHD28
	aYX05EeDqxxB2Mpoch0WGDz4l7nAAlf1LsZcVTU7iqLjDgPD7/O0uZVM6f2EHPb5R4ZJmDo58Ss
	Me53rTe7UQNeIRtFeziXytGdAVGF+xWfrhs5qWIv8XgezMy/fxYZTf+Rs3ZC7ry/AO/JclY36uF
	ssgX1LavTptCAapgNaeMhIRqi0jiF6v8JjmH2ljKBbsLFhzYKUgjFqFyEKIW/wzIhHOMfSbkIa3
	mhs+0sI51lz2fF6wEGPDA9W4890WLtVxHERvO1JbR9i42sQ521I5NZwLhsw9NDF5QBU7qQQw0kj
	wFj654lI/vQ==
X-Google-Smtp-Source: AGHT+IGF8h3Z0Bg3+HdPE2XXVb4othsH67D8OZ1KJFqSbIKUtkwJ13UpluQsahACO98wInzYQW5OfQ==
X-Received: by 2002:a05:6000:186c:b0:390:e62e:f31f with SMTP id ffacd0b85a97d-39d6fc0c42bmr5651875f8f.3.1744011788659;
        Mon, 07 Apr 2025 00:43:08 -0700 (PDT)
Message-ID: <641ff3bd-8fe9-4384-bd61-51fb51a3a778@citrix.com>
Date: Mon, 7 Apr 2025 08:43:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New Defects reported by Coverity Scan for XenProject
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <67f26722e020c_13a342abaf9ddd9a0513e7@prd-scan-dashboard-0.mail>
 <7e5fe92d-4f67-4413-aa72-5771f8d61570@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7e5fe92d-4f67-4413-aa72-5771f8d61570@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/04/2025 8:26 am, Jan Beulich wrote:
> On 06.04.2025 13:36, scan-admin@coverity.com wrote:
>> Hi,
>>
>> Please find the latest report on new defect(s) introduced to XenProject found with Coverity Scan.
>>
>> 1 new defect(s) introduced to XenProject found with Coverity Scan.
>>
>>
>> New defect(s) Reported-by: Coverity Scan
>> Showing 1 of 1 defect(s)
>>
>>
>> ** CID 1645644:  Control flow issues  (UNREACHABLE)
>> /xen/arch/x86/hvm/vmx/vmcs.c: 774 in _vmx_cpu_up()
>>
>>
>> ________________________________________________________________________________________________________
>> *** CID 1645644:  Control flow issues  (UNREACHABLE)
>> /xen/arch/x86/hvm/vmx/vmcs.c: 774 in _vmx_cpu_up()
>> 768             vpid_sync_all();
>> 769     
>> 770         vmx_pi_per_cpu_init(cpu);
>> 771     
>> 772         return 0;
>> 773     
>>>>>     CID 1645644:  Control flow issues  (UNREACHABLE)
>>>>>     This code cannot be reached: "vmxon_fault:
>> if (bios_locke...".
>> 774      vmxon_fault:
>> 775         if ( bios_locked &&
>> 776              test_bit(X86_FEATURE_SMX, &boot_cpu_data.x86_capability) &&
>> 777              (!(eax & IA32_FEATURE_CONTROL_ENABLE_VMXON_OUTSIDE_SMX) ||
>> 778               !(eax & IA32_FEATURE_CONTROL_ENABLE_VMXON_INSIDE_SMX)) )
>> 779         {
> Is this perhaps an indication that Coverity doesn't understand asm goto()?

Yes.  That's a false positive.

~Andrew

