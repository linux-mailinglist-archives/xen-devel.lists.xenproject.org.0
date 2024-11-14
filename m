Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2AF9C90AE
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 18:20:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836673.1252584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBdWN-0001h9-6L; Thu, 14 Nov 2024 17:20:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836673.1252584; Thu, 14 Nov 2024 17:20:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBdWN-0001f0-3c; Thu, 14 Nov 2024 17:20:43 +0000
Received: by outflank-mailman (input) for mailman id 836673;
 Thu, 14 Nov 2024 17:20:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3TDs=SJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tBdWL-0001dP-7r
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 17:20:41 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3587dc9-a2ac-11ef-a0c7-8be0dac302b0;
 Thu, 14 Nov 2024 18:20:36 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a9a0ef5179dso162861266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 09:20:36 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df26443sm84540466b.14.2024.11.14.09.20.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 09:20:35 -0800 (PST)
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
X-Inumbo-ID: c3587dc9-a2ac-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmIiLCJoZWxvIjoibWFpbC1lajEteDYyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImMzNTg3ZGM5LWEyYWMtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjA0ODM2Ljg4MDU2MSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731604836; x=1732209636; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QZcXlrMpxv4w8LpWq29ZIWB587Yx2gBsEg+bkONCJyQ=;
        b=sxP7YsdshpvG4oQL0BpoUe21UIJeMTPimuQbDJaYDlbRAt6iwySrZvekt0IKYH2XNu
         rBsoyhu2j/oBoLryXQVicG2aSxypm6MCzLLnOSSAlFAJv2EFDTmEFdjcb6yAMUGM23A4
         vIT5VU4BRGfJ6CpYIzP0ZeMnyY0dAI9tOw5BY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731604836; x=1732209636;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZcXlrMpxv4w8LpWq29ZIWB587Yx2gBsEg+bkONCJyQ=;
        b=kIa/pjusZI0bJuelSyUytNpx5VjZvorJFo0T+dTZ63ehprSo3wwZgNKt5XvVDTUTBA
         9stMPecAEOl4sn5c2rLPGE8C3fVkVepl+v9tOITkxsd7ZegcGWn3n1ePC85XcE9d1TN1
         5AJKChiQCeMu4BePpfoxEl8S4AfMaTuX6+Qwph44XBlxPw6qqLGZ4bMrtBTTXn7kD2Nm
         +6vkFqk4vOfPe8+F/xzzciQIqVXto+4uwedEuzWuVs8ZW4aYPooHIDOPg8yHL7mqZsWW
         Bw370sR2nk1PQ8A9r1zUtW1O7Ox9/nPko4nPU7+iRfqFMZuAvSyRjRRE1GtaTdOiFCP7
         a28A==
X-Forwarded-Encrypted: i=1; AJvYcCXlDtmL5ocDhYq58FZgiRh3IST768kx0z1AkIbu/3qx4NAB4gYhw2y7v0DQCoUCLN459rAf236czco=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRNKfRmxDRA+UWr0r8+XqtJCxoEKnUmVehZADb5RJqwknFkSBz
	DkQTxm/R+IgSWusUauZoBn+LJSWvMA6Pn/BtjdqPySMXbmhHoOggVxLqbksFDSJwH+fW7+kHTA2
	I
X-Google-Smtp-Source: AGHT+IHFSqW/sWwfWBkwZfByD5EZbs3rT/lTOFyY3PeD/eiNZ0RnblAkNQ7MC0FWrvXDQwr58lv0xg==
X-Received: by 2002:a17:907:1c02:b0:a99:42e7:21f with SMTP id a640c23a62f3a-a9eefff178dmr2422708466b.37.1731604836294;
        Thu, 14 Nov 2024 09:20:36 -0800 (PST)
Message-ID: <76df49a7-9982-4f9f-a2a8-9b5f4ff023e5@citrix.com>
Date: Thu, 14 Nov 2024 17:20:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86/ucode: Remove the collect_cpu_info() call from
 parse_blob()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241112211915.1473121-1-andrew.cooper3@citrix.com>
 <20241112211915.1473121-2-andrew.cooper3@citrix.com>
 <f0072d5d-8626-4708-91a8-503a33e99ec5@suse.com>
 <c9a24b52-6498-41e9-aa20-a3cc5c2b1027@citrix.com>
 <1faff790-3909-4de4-9283-af001238c7d5@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1faff790-3909-4de4-9283-af001238c7d5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/11/2024 4:15 pm, Jan Beulich wrote:
> On 14.11.2024 16:59, Andrew Cooper wrote:
>> On 14/11/2024 11:11 am, Jan Beulich wrote:
>>> On 12.11.2024 22:19, Andrew Cooper wrote:
>>>> With the tangle of logic starting to come under control, it is now plain to
>>>> see that parse_blob()'s side effect of re-gathering the signature/revision is
>>>> pointless.
>>>>
>>>> The cpu_request_microcode() hooks need the signature only.  The BSP gathers
>>>> this in early_microcode_init(), the APs and S3 in microcode_update_cpu().
>>> That's microcode_update_one() after 502478bc1d9d if I'm not mistaken.
>> I wouldn't necessarily say "after".
> My point was merely that there's no microcode_update_cpu() anymore, as of
> that commit.

Oh.  I totally missed that.

I'll fix it, and make the rest of the paragraph a little bit more direct.

~Andrew

