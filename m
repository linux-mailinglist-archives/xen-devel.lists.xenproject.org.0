Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCDC924041
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 16:16:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752512.1160735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOeIh-0004cs-JI; Tue, 02 Jul 2024 14:16:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752512.1160735; Tue, 02 Jul 2024 14:16:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOeIh-0004a8-GE; Tue, 02 Jul 2024 14:16:07 +0000
Received: by outflank-mailman (input) for mailman id 752512;
 Tue, 02 Jul 2024 14:16:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWIE=OC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sOeIg-0004a0-4I
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 14:16:06 +0000
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [2607:f8b0:4864:20::82a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c2a8a91-387d-11ef-92e8-0d9d20120eaa;
 Tue, 02 Jul 2024 16:16:02 +0200 (CEST)
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-4466884aadfso12508231cf.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 07:16:02 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4465144505esm41570971cf.56.2024.07.02.07.15.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 07:16:00 -0700 (PDT)
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
X-Inumbo-ID: 9c2a8a91-387d-11ef-92e8-0d9d20120eaa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719929761; x=1720534561; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jNsPV/tq7eAyprZ6ckvBHQT0Gv/qBLe0Z2hyPTDnYtk=;
        b=NBSMSCPuUiAp766daC+pVRk5hKHk2Fy7rSWyKaWmxHvdlLqyPGodIBN4D+VW6SA+KM
         vj+AykRFbGE5sQpL6vvLdT2bxDPlO46TxXU6Hn+sD253kqrkhPIaNMcWLSjvw0b5CK/m
         Lk+3mIQBU6n53eT5o2mVk3fcJow+i7C3iSr2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719929761; x=1720534561;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNsPV/tq7eAyprZ6ckvBHQT0Gv/qBLe0Z2hyPTDnYtk=;
        b=OIFtqiEF13a3XOruklBUtBemgFAqIFDMjIg8h1iENrKeuer2erbGTm3J9RcBlPtmj4
         QXSNo2JVtl0b4FbxrhDon1zaYkV+XvSu1Qr9nVM2XH4J2R+8LR1a8mBV5A+VWMD5kVt6
         C8NgJ3Uo1IvHVRdFN+f4wZq0V6mTWdPFpmp7QimXeZQoZlXp2EqsU57axhPgXACEWrEx
         MdhIuPpWFYk4Z5QJjyXojzAdgPpo4YSkRvPjqHMPcpSGuya5IKcYv3PjsM9dE7CQPgNB
         ks+T8gP9WbUbdChwt2lGKkLa6cW9HkslY0+od+IAF29Zm1pJks78gN9QaftJxiLDF/rb
         +SMg==
X-Forwarded-Encrypted: i=1; AJvYcCX9xsQxaWdINza54Rio4HpuW38LRU0zYlRH86JaBSRU6mBSRpgSUwJVSbiwqV3uDOWWNkdMRK/BiXZMAaDO8RiS28i1nUy2IAtEbwKKn5c=
X-Gm-Message-State: AOJu0Ywgf2IlsT66pG3MHzezGegL0LgUl5CS7+pdakEzavIjrko+YTfg
	8FhPDyDhhxu3YUgTFsilIuXgr4vFYr8Zq65PngPo4QHVHDgGrM5UxOsJREEazuw=
X-Google-Smtp-Source: AGHT+IGmcUXuN87O7rzl0P07YI77grmybtgDRGona7eTEv0k/X997SzRaTwCBC1fi2dXEMAcwnhYEg==
X-Received: by 2002:a05:622a:7b89:b0:446:63e9:dc81 with SMTP id d75a77b69052e-44663e9dd9amr116273371cf.63.1719929760834;
        Tue, 02 Jul 2024 07:16:00 -0700 (PDT)
Message-ID: <0f719364-4125-46bb-bcea-35ad3b4a0f32@citrix.com>
Date: Tue, 2 Jul 2024 15:15:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] xen: Fix XEN_EXTRAVERSION after 4.19-rc1
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240702134310.1307657-1-andrew.cooper3@citrix.com>
 <643ada7e-b265-4283-9c52-f6cf6239fe26@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <643ada7e-b265-4283-9c52-f6cf6239fe26@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/07/2024 3:14 pm, Jan Beulich wrote:
> On 02.07.2024 15:43, Andrew Cooper wrote:
>> EXTRAVERSION needs a . separator for numbers.
> Not exactly. It needs the 0 dropped, if we follow what we've done in the
> past. Then ...
>
>>  Currently, the banner reports:
>>
>>   __  __            _  _    _  ___   ___
>>   \ \/ /___ _ __   | || |  / |/ _ \ / _ \    _ __ ___
>>    \  // _ \ '_ \  | || |_ | | (_) | | | |__| '__/ __|
>>    /  \  __/ | | | |__   _|| |\__, | |_| |__| | | (__
>>   /_/\_\___|_| |_|    |_|(_)_|  /_/ \___/   |_|  \___|
>>
>> and xl reports:
>>
>>   # xl info xen_version
>>   4.190-rc
>>
>> Fixes: 4a73eb4c205d ("Update Xen version to 4.19-rc")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

I'm happy either way, but it definitely needs changing from what is here
now.

~Andrew

