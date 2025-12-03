Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E016BC9F2E0
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 14:47:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176800.1501265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQnCV-0007Lb-17; Wed, 03 Dec 2025 13:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176800.1501265; Wed, 03 Dec 2025 13:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQnCU-0007JI-Ub; Wed, 03 Dec 2025 13:47:22 +0000
Received: by outflank-mailman (input) for mailman id 1176800;
 Wed, 03 Dec 2025 13:47:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mi53=6J=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vQnCT-0007JC-V0
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 13:47:21 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 962d8f8a-d04e-11f0-980a-7dc792cee155;
 Wed, 03 Dec 2025 14:47:19 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so47694325e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Dec 2025 05:47:19 -0800 (PST)
Received: from [10.188.153.1] (cust-east-par-46-193-78-210.cust.wifirst.net.
 [46.193.78.210]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4792a79dd66sm52057665e9.6.2025.12.03.05.47.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Dec 2025 05:47:18 -0800 (PST)
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
X-Inumbo-ID: 962d8f8a-d04e-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764769639; x=1765374439; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M0IkzHn1xtecF7m6P18vE/G57sjYgSI5qrcqOsl482Q=;
        b=ZXQA1JxG7GRM1Mloc7WSbFNpzdxPcZnVmQks+9B2OCBLqYIX1yJmW96blkCvrv2+DQ
         mGQJ/YMoV9olsDwQkxxrhgWAQ01scPLl51PLjhx/3gA5rXh7TtLmyYAZ6ihAZ1dhWL1l
         fNjzfcupiH0Om+/2r4LqfNH+qYF7oXdggwD2F6J3ffW7GV7mnF16Uliux7z1qCaNcGKo
         uOQTq1nnLX/0Xv43zUaNYAHsVwk1HNLrRAkDqJAzmpNYHW/42GJLaZVNy97bTJCJiomG
         fKYlZOKpAC5zWiLKBqn49Nlt57pXH0txz+VTw/JqW+Kf0rS0QZU5AIFqf2KyJ/dYvUq6
         IwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764769639; x=1765374439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0IkzHn1xtecF7m6P18vE/G57sjYgSI5qrcqOsl482Q=;
        b=QmVqQaaXqr022KahpJUZMEw4+ElJC8NsrrbDrmc2oeMF0r+zu9bCJC0lJI79uqbykC
         OLOgzOi9ifisEzhPVpARyCDyuZ7UazWdRqMdIwzMZsH/kmfyeXnhAIQ6SZ2BT2Q6XhG6
         aLDD6No3ij2XfRQ2m23GFQ/jT9zkRvYq0REm9jv5A6TsfOPv67h9xz/8WK/VOUnrK3zr
         kL0gy286w609xL2lDC/l63RddwAC5ApVfSetwP4IkZmvsK9paWhyUD6UBXlLcmzklm0Z
         YQEs5ifBFNVUErtUNLXIrLREv7u+BsV/qpv7jRMoMCVYkdr6hiszjcoASDZZFoyB9mBk
         INHA==
X-Forwarded-Encrypted: i=1; AJvYcCWD80sy/O9OM1TY/h6PVV6VYBmc+wfzjLVC4f5QkknMHCOtacSiF9TgqJnjqcdLa74waUuX5NXtnOo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzAwkpw6VswE6cxw0PM/hW6Q9G0pZII9uSKIXPXDr4Tb5BB+z7
	1v4fbcTJ19z8XKabMf6TK9vwSzed+lNNrWatWNjzmTqc0jABGGupZ0I2
X-Gm-Gg: ASbGnctVJCLDr7zspkf3pI3U5gPd34zTHkwGioXpEMGWSNQ8sDBD4qdlt9GUPAO+IdO
	bTz0BAXcdfBYw0AOTukdB+88VHEBLnZWh+fkcTHXrFNZgiQEtpcBk2G8ei+x8/DICPB1InZc2Tn
	FuRBKeeooDuEhftzIbn/9OwF3b4T0cpbcLDbqV9AZrowSrMq8frYfi16QW8eZIHTXIUwKFdTAE2
	ZOY0rK5lI4girtzbOAQ8VLnM7+8Glna7CNareij+8z/LLYjKpBNjJmtiJy3P//zc+Zd2UOOEiEm
	xCFZOxWPS32oFjHvF7Ykdb60Rt2i4U54/GCmvp0xZKPNX7dDPHyUa2sSyNcG6bTGzuc4NcNrZSt
	0wC/gvmExliUMnyCLihB94SC0IMXjfNGXXrygIbvCMtDVPv2qhIkxt+by+Mu1RXbUOEYnEYNIl6
	52+hVdFVUpwpOtDJE/U+fxny426LcUWEEjsHzH+wQWh9m787k9ca+HmXWMPaK9Gp5l50E0/wu6D
	g==
X-Google-Smtp-Source: AGHT+IGW+l+z5HI9KXKD/wxbuG5K99xEchBZhbSiKJjfy64n47baAlhNrESKon4aBf5BC4aHbkZeSg==
X-Received: by 2002:a05:600c:3513:b0:477:7bd2:693f with SMTP id 5b1f17b1804b1-4792aee39a1mr22064205e9.6.1764769638806;
        Wed, 03 Dec 2025 05:47:18 -0800 (PST)
Message-ID: <56246946-2cb2-4f9b-86b0-6e3807bfe130@gmail.com>
Date: Wed, 3 Dec 2025 14:47:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 4/4] CHANGELOG: Document guest suspend/resume to RAM
 support on Arm
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, Mykola Kvach <mykola_kvach@epam.com>,
 Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <cover.1764755558.git.xakep.amatop@gmail.com>
 <ba51b0ca5457566e1dbef2b6d6ff984dbc318895.1764755558.git.xakep.amatop@gmail.com>
 <b844a0bc-ee86-42fe-bcf1-f8a33a594c4c@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b844a0bc-ee86-42fe-bcf1-f8a33a594c4c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/3/25 11:09 AM, Jan Beulich wrote:
> On 03.12.2025 10:57, Mykola Kvach wrote:
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -10,6 +10,10 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>   
>>   ### Added
>>   
>> + - On Arm:
> Nit: If you look elsewhere in the file, you'll notice that there's no blank line
> between the section heading and the first bullet point.
>
> Jan
>
>> +   - Support for guest suspend and resume to/from RAM via vPSCI.
>> +     Applies only to non-hardware domain guests.
>> +

With the Nit from Jan B. applied:
  Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>>   ### Removed
>>   
>>   ## [4.21.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.21.0) - 2025-11-19

