Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB2C7F645F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 17:49:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639933.997582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6CtH-0007NI-4v; Thu, 23 Nov 2023 16:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639933.997582; Thu, 23 Nov 2023 16:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6CtH-0007Jw-1p; Thu, 23 Nov 2023 16:49:23 +0000
Received: by outflank-mailman (input) for mailman id 639933;
 Thu, 23 Nov 2023 16:49:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xmv=HE=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r6CtF-0007Jm-Rt
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 16:49:21 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f1a5278-8a20-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 17:49:19 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4083f61322fso7991135e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 08:49:19 -0800 (PST)
Received: from [10.80.4.253] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c4-20020a05600c0a4400b003fefaf299b6sm2551438wmq.38.2023.11.23.08.49.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 08:49:18 -0800 (PST)
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
X-Inumbo-ID: 3f1a5278-8a20-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700758159; x=1701362959; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k2nDtylLcc3BPP0+cqRG/S5i7I32gLdlffn3QlEoOwo=;
        b=cHxxxaKwuB/5FbwGvYS6dro8BEpZAE4BGXgLZq7PijTWUB7Bnvan+uIXdrswiBEmb8
         5+/6w/VI8T6dHOYpXhBBOHiIIgAjdkXnGhFS66dJcsH0r+M7D7G6IIU4Ua12S5yIOjMM
         sk9c5wvwDYZ9B4uiSZFCRR3V9GY6M3+qkOtdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700758159; x=1701362959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k2nDtylLcc3BPP0+cqRG/S5i7I32gLdlffn3QlEoOwo=;
        b=WhI8EfPqaRzNajhQdLIxvJ42AuVe870WoJ4WlBphg+BLC2pVy5jRxnkVyxQbj2U0vj
         AsTyaZdd3b9ZqvHVORqpPiK1+wY6pi/NPyhIeP4OzvZNOvW26QjGp+tTsNBHO/lsPU0y
         nztveMEQelOJ8NXljac5AHztQg8q5KyBQpVx4r9WqWWiTCFQ+DtoV+wzZwv6eExd1Hf8
         S5ETNdX9ZCta2D54pnYHUvTTM3GWJzQr6QwZGUruJRZXU9OpV7Ku8cw0zulRsdTnjgxJ
         oVISQSXpchyvR60XuCvR8zBzdUPShubIVSha/KXpL4Czj+AtCsmUx5pD6FTE3JO2WBfy
         HZww==
X-Gm-Message-State: AOJu0YwXLytYIbHM0oAuaqwn+KupGT8BKkSW+R3RH6rBOph4LsnccVPG
	iwNJJPsNh5AtgbRKTs6y5tuJxw==
X-Google-Smtp-Source: AGHT+IHAe6uCoKQTWTIzllmbcJi0YxMuGhudu5sngNR+V2dT2IRA9TKOBPyANrchkOTW/WQUmUQAaQ==
X-Received: by 2002:a05:600c:1546:b0:405:3a3b:2aa2 with SMTP id f6-20020a05600c154600b004053a3b2aa2mr105970wmg.37.1700758159355;
        Thu, 23 Nov 2023 08:49:19 -0800 (PST)
Message-ID: <b4a967df-f08b-495b-b7a4-0632c8c271f7@cloud.com>
Date: Thu, 23 Nov 2023 16:49:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] tools/pygrub: Set mount propagation to private
 recursively
Content-Language: en-US
To: Andrew Cooper <andcooper@tibco.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231106150508.22665-1-alejandro.vallejo@cloud.com>
 <20231106150508.22665-2-alejandro.vallejo@cloud.com>
 <4d31c9f5-faf3-47f7-976e-2d5665ba446d@tibco.com>
 <e077f551-f4d4-4fe3-9726-2a877f9f718b@tibco.com>
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <e077f551-f4d4-4fe3-9726-2a877f9f718b@tibco.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/11/2023 19:48, Andrew Cooper wrote:
> On 22/11/2023 7:46 pm, Andrew Cooper wrote:
>> On 06/11/2023 3:05 pm, Alejandro Vallejo wrote:
>>> This is important in order for every mount done inside a mount namespace to
>>> go away after the namespace itself goes away. The comment referring to
>>> unreliability in Linux 4.19 was just wrong.
>>>
>>> This patch sets the story straight and makes the depriv pygrub a bit more
>>> confined should a layer of the onion be vulnerable.
>>>
>>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Sorry, wants
> 
> Fixes: e0342ae5556f ("tools/pygrub: Deprivilege pygrub")
> 
> too.  Will fix on commit.
> 
> ~Andrew

Sounds good.

Cheers,
Alejandro

