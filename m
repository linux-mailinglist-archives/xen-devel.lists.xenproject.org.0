Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DDB782DF9
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 18:12:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587703.919073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY7Vw-00052x-CI; Mon, 21 Aug 2023 16:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587703.919073; Mon, 21 Aug 2023 16:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY7Vw-00050k-9Z; Mon, 21 Aug 2023 16:12:24 +0000
Received: by outflank-mailman (input) for mailman id 587703;
 Mon, 21 Aug 2023 16:12:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0mH9=EG=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qY7Vv-00050e-Ho
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 16:12:23 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80c358b9-403d-11ee-9b0c-b553b5be7939;
 Mon, 21 Aug 2023 18:12:20 +0200 (CEST)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1bddac1b7bfso23597415ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Aug 2023 09:12:20 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 c15-20020a170903234f00b001b9be3b94d3sm7226088plh.140.2023.08.21.09.12.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Aug 2023 09:12:18 -0700 (PDT)
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
X-Inumbo-ID: 80c358b9-403d-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692634339; x=1693239139;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rKTly9oTX4+KyayCl1SolSAY8q0smxB2Uu0g9MnMWxY=;
        b=W28CnbMKLuHAJ1nZAY0vLMW6QBC9vd2CAH1Q2WmdMWFXS0wV4wO9JhZMULuZWOKBuW
         xE7973PuBqORBU43eI7S6gLXmEQn7PTysuXSgresJF7EN/EhsJDcnoIQwo1BQ2+fIwFp
         QJaXAR2QynZeTS2zV2QknKpBZK6H/oBXzCGuDxARnJ+waqVLZvmTDAjUzBqBE+dc6qLk
         3CbEmKlHu8OrChXsNP19WZw1FCH1p4gXgbSyrT7i0UH7sKLryDYYctBT65s6Xl7FCMB3
         k1VHIEcPh+4jhECBnJ7xm8poGCVHZFfH1yGXpOs70mHGc/vNvDKAjYMZ8c3Q/eJPbv20
         T9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692634339; x=1693239139;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rKTly9oTX4+KyayCl1SolSAY8q0smxB2Uu0g9MnMWxY=;
        b=ZyICGxnfv+WAeOWqBIDBDek7xi1dj/hq0tZW63hnnPECCTzA75VnGX09i50yKbfYmn
         Ey1tnA+mVRft8W8CCb0aefB4pUvqLLW0KemkmvWdUVty5wEhDtSR4fk33lsN93dF9PUh
         8OCPHK4r6iHnnmM+vqMsvoIaUIrtZ2nVoF5VbcQSo76QA7D8LHUR0UojZ03TP3vQ6zIl
         hiwtkpct5l8Hjh9OpCBuvHdEWYu2qFcFOezDKd1OW4fxdVFbaJPOJ68XoHm0R/lncFEQ
         hZ4PyUVpf1bRHlhN0xS1FbCQdJqymDaGovDJ5UWFuOgQRfOmoUOFTMQeuvSyWhJApYCw
         BH/g==
X-Gm-Message-State: AOJu0YzHSd3zFMBo786tdfC+VxFnY8NZy/q8Z9ZGKncgNI3pioF111Cx
	9mZ4KmpPKqdViBMDNRwmRK8DsVmHeMnDzA==
X-Google-Smtp-Source: AGHT+IGRW7tIQT/a5noxRjopqMIqcfr4qLMkihuqTD3tp71vZzZfPFxv73L1vQNFK3rH1MuHBr823g==
X-Received: by 2002:a17:902:e806:b0:1be:f37f:a8d5 with SMTP id u6-20020a170902e80600b001bef37fa8d5mr12001822plg.10.1692634338630;
        Mon, 21 Aug 2023 09:12:18 -0700 (PDT)
Message-ID: <dcd6a5db-239a-9ade-0236-be91744e3b98@gmail.com>
Date: Tue, 22 Aug 2023 01:12:13 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/5] x86: Fix calculation of %dr6/7 reserved bits
Content-Language: en-US
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
To: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <5fa229fc-9514-abc6-5e72-2447a2c637d0@gmail.com>
 <eb2a3feb-b226-0d90-51e8-c541b5e2dfd8@gmail.com>
In-Reply-To: <eb2a3feb-b226-0d90-51e8-c541b5e2dfd8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/22/23 00:56, Jinoh Kang wrote:
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> The reserved bit calculations for %dr6 and %dr7 depend on whether the VM has
> the Restricted Transnational Memory feature available.

s/Transnational/Transactional/.

It was in the original review, but I missed the change.  Apologies.

-- 
Sincerely,
Jinoh Kang


