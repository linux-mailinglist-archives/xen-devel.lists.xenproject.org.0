Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC6F803AD1
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 17:50:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647188.1009995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAC9Y-0005En-TJ; Mon, 04 Dec 2023 16:50:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647188.1009995; Mon, 04 Dec 2023 16:50:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAC9Y-0005CR-Pu; Mon, 04 Dec 2023 16:50:40 +0000
Received: by outflank-mailman (input) for mailman id 647188;
 Mon, 04 Dec 2023 16:50:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAC9X-0004oH-1r
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 16:50:39 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 403f7988-92c5-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 17:50:38 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40c09f5a7cfso15839255e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 08:50:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c459000b00406408dc788sm19249838wmo.44.2023.12.04.08.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 08:50:37 -0800 (PST)
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
X-Inumbo-ID: 403f7988-92c5-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701708637; x=1702313437; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Jm90OFxUl5ehXt5wrUuk/uvgAsW1jqHXp26bMI2lys=;
        b=IZ4by1WhcJSCht8ZyzeGaX3VklE+GpnIEqFJ3l/jjlgRCYECTyN/VEe7S77eBrWAv+
         4tlqyMp9UKlki32Dha2FRZJNjvC4Fnut0/sL/j5OotlS591vwbG3TFMseN2T/bccXBU5
         YcBXpXrRL79CaZYEOAi8M6vKeJCFH+Wkc5LwXbuGW5OcbluJYSQGfsbuBITGARcwaXUK
         tCnLlPuCUAj2vk4VYV+E6GvTxQ65mF8ceynzcDY2w9qWOgKgzS4TSW4ovY5aOPTiQnWr
         nP9vP0z65apbk9npR46UF9ZhIWBh2OeL5d7M/pSXLql02foYfarojWUPELFiaN4P25qt
         BNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701708637; x=1702313437;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Jm90OFxUl5ehXt5wrUuk/uvgAsW1jqHXp26bMI2lys=;
        b=BMDV5rA3aMi5ds6z73davt63GV9XfVx7Xci1pB2N/y23JLNQW0bANgbU7eLXrL3arW
         8NdB1d1j6d60GjoXyQzwsboSRvj1cAsf4wHmKEfScAVLCJw3mkuP6txuEs634rdynWZf
         DQTydJh+nSHyNOb25k3I6TK/lGzPXOOjj4fzdl54PyzJHGMDT7uBH/ZQ4hzVjFatwZH2
         meDKnACtrIGafT3bNXAvoTwi7TrrsWKcNG73XP1aBzxjbyVnDyDK5sRrJgV4GG4vD/eF
         WUuBP2XmmhqgNH7l3BSLK9O7cNWD2o2rQXxuUB/Uu3lVX575eLdHyKCSSoYkjY53JCV7
         kNZA==
X-Gm-Message-State: AOJu0YxXYyojCSWmrx55afJhoGVPSG+qsIhSkdN0209KuVVoywEmTNck
	FRiEZqURt1hBbbpWohAG3U2XaWt/6cbibtCNj8Km
X-Google-Smtp-Source: AGHT+IEfblEEQNMrJsqzjA3aGulFxWr3piqfrCGRUdGJKkP4YNOpu5VqUgSFIoeaxZ80/qvp1rcpGQ==
X-Received: by 2002:a05:600c:6cf:b0:40b:5e59:ea17 with SMTP id b15-20020a05600c06cf00b0040b5e59ea17mr2546834wmn.182.1701708637488;
        Mon, 04 Dec 2023 08:50:37 -0800 (PST)
Message-ID: <8fc5333a-1529-42d2-a90f-dbaff9e2f23f@suse.com>
Date: Mon, 4 Dec 2023 17:50:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANNOUNCE] Call for agenda items for YYY Community Call @ 1500
 UTC
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
References: <CA+zSX=bpVoB7vB0_FgxadybyjTP-SL7a4uFZRwRXtA-CPqZ16A@mail.gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <CA+zSX=bpVoB7vB0_FgxadybyjTP-SL7a4uFZRwRXtA-CPqZ16A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.12.2023 17:25, George Dunlap wrote:
> I'll be running the community call while Kelly is travelling.
> 
> The proposed agenda is in
> https://cryptpad.fr/pad/#/2/pad/edit/SvabZ2utDN3G7XRSG2k1NSLJ/ and you
> can edit to add items.  Alternatively, you can reply to this mail
> directly.
> 
> Agenda items appreciated a few days before the call: please put your
> name besides items if you edit the document.
> 
> Note the following administrative conventions for the call:
> * Unless, agreed in the previous meeting otherwise, the call is on the
> 1st Thursday of each month at 1600 British Time (either GMT or BST)

IOW in the subject it's 1600 UTC and YYY == Dec 7?

Jan

> * I usually send out a meeting reminder a few days before with a
> provisional agenda
> 
> * To allow time to switch between meetings, we'll plan on starting the
> agenda at 16:05 sharp.  Aim to join by 16:03 if possible to allocate
> time to sort out technical difficulties &c
> 
> * If you want to be CC'ed please add or remove yourself from the
> sign-up-sheet at
> https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/
> 
> Best Regards
> George
> 
> 
> == Dial-in Information ==
> ## Meeting time
> 16:00 - 17:00 British time
> Further International meeting times:
> https://www.timeanddate.com/worldclock/meetingdetails.html?year=2023&month=12&day=7&hour=16&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179
> 
> 
> ## Dial in details
> Web: https://meet.jit.si/XenProjectCommunityCall
> 
> Dial-in info and pin can be found here:
> 
> https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall
> 


