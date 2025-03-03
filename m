Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF56FA4C4CC
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 16:21:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900477.1308368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp7bw-0005Kf-Lx; Mon, 03 Mar 2025 15:21:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900477.1308368; Mon, 03 Mar 2025 15:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp7bw-0005If-Ig; Mon, 03 Mar 2025 15:21:40 +0000
Received: by outflank-mailman (input) for mailman id 900477;
 Mon, 03 Mar 2025 15:21:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2B8f=VW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tp7bv-0005IZ-Aw
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 15:21:39 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32d2d657-f843-11ef-9ab2-95dc52dad729;
 Mon, 03 Mar 2025 16:21:37 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43994ef3872so29721315e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 07:21:37 -0800 (PST)
Received: from [10.81.43.157] ([46.149.103.15])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43b736f75c6sm162141035e9.1.2025.03.03.07.21.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 07:21:36 -0800 (PST)
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
X-Inumbo-ID: 32d2d657-f843-11ef-9ab2-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741015297; x=1741620097; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PqYY4ajlQ/GTBXMkQJZSaO5R+/3SVrjjYulyoVX3xeA=;
        b=RYr59rEvbTE9QPKsf9EZEYvgaDXmXpJQJVrQtYv77C1fOk4wHPwf9563WM92N0TmNE
         jjzN2RLg6s8Y69WFVZf7fsU02ZI0RiSWo0xgvWplS0f4b2vYbczhFtle4erLdBtirhgH
         gtZk7U2/TIb/gcPqYvGX3RU6Fy3rAb47rzjcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741015297; x=1741620097;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PqYY4ajlQ/GTBXMkQJZSaO5R+/3SVrjjYulyoVX3xeA=;
        b=wKUmOLLFVmHe/7IDhYAqtdHV9L7uzf/+ZWAX8lNhHMv1bvA0VRa6B1qwyCYiXUYHgN
         dPq3/X6c2VsKPqzC3QcOjNHaYhOYdknHESqj9epxk+wFIms8VH++eGkJVuPRtFISXUde
         tkBvCJNesoCS3cPCGR/psRxEPmkRJFOtUti8J9tx2EUDJ6XsmpDE/3r+b2rFegMj5nyG
         ro9P0fV6lOoRax4x5LagmDkSPvLW3mC2siKsmB+ybRVcH69Q3BF3j+aise994GA+rTsX
         IJhTBaw4cpqG+QDEO8H4vX8+noRiZ4D50OXPXTZgZvmsZ3ToBaHGzWh52H7/jzg5Yn+Q
         d7Tg==
X-Gm-Message-State: AOJu0YxTWx9rAc9U8xPBTloj+NMd8n8f9nA/0e6JGgX3RoXz38CXlLdt
	59ipSHwFZ+WDY70zYxmT5Uukt2VYMPeGG0+plhmgM4GkQKDTwHo0rXXvz/fbVao=
X-Gm-Gg: ASbGncuTZ7PIJr8zcEGZauEVTbSHVri0IUn68+TC7z/ZSmLNQDG0pofwdIcq+ZgMi0g
	3l3OOw0elCQHSnO7gFZzT40U4gSdL9Ycpeu3e6dFiEliXaZETpmQPf2gNQYc6qy2z4mcbcHo9qK
	DnG0mhXTJ693/tTBBwVcyOavHgaM746NiMGOjGQoDSZu83QRURMTJcWaoQ8Psgc7E/TLZUtkWi3
	OPnRMBBi/q4mbiMnahL+UZ8ymJAgRTmaSMy2jVMXnaoThA4tZIGcLwjSScyszhLTX0rWUxoIEeO
	nD4bZMrI0Je6Y0ihZOMntKMTe28XbzVDqq+t8kZf+kMOgOh+9ttAmCo=
X-Google-Smtp-Source: AGHT+IF8j7w/kY2vRJVQzvXdr9Gi4/gGvmJ0pO0JI/LY0waMYO3JBSP/nMWzh81k7bLcbOCZmeSdew==
X-Received: by 2002:a05:600c:46c6:b0:439:942c:c1cd with SMTP id 5b1f17b1804b1-43ba6704504mr129466105e9.15.1741015296683;
        Mon, 03 Mar 2025 07:21:36 -0800 (PST)
Message-ID: <89fc9950-92bd-4226-b96e-f0e091a6071c@citrix.com>
Date: Mon, 3 Mar 2025 15:21:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 2/2] SUPPORT.md: Define support lifetime
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250303141754.26452-1-andrew.cooper3@citrix.com>
 <20250303141754.26452-3-andrew.cooper3@citrix.com>
 <Z8XHBA7hL4uuU29w@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z8XHBA7hL4uuU29w@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/03/2025 3:13 pm, Roger Pau Monné wrote:
> On Mon, Mar 03, 2025 at 02:17:54PM +0000, Andrew Cooper wrote:
>> diff --git a/SUPPORT.md b/SUPPORT.md
>> index 2bc5bd81ee39..a72798aeeae4 100644
>> --- a/SUPPORT.md
>> +++ b/SUPPORT.md
>> @@ -9,13 +9,13 @@ for the definitions of the support status levels etc.
>>  
>>  # Release Support
>>  
>> -    Xen-Version: 4.20-rc
>> -    Initial-Release: n/a
>> -    Supported-Until: TBD
>> -    Security-Support-Until: Unreleased - not yet security-supported
>> +    Xen-Version: 4.20
>> +    Initial-Release: 2025-03-05
>> +    Supported-Until: 2028-03-05
>> +    Security-Support-Until: 2026-09-05
> I  think there's a typo here, it should be:
>
> Initial-Release: 2025-03-05
> Supported-Until: 2026-09-05
> Security-Support-Until: 2028-03-05
>
> So 1.5 years of support, and 3 years of security support?

Oh yes, I've got those two the wrong way around.  Fixed locally.

~Andrew

