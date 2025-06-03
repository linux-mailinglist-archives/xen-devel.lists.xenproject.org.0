Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C117ACC75B
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 15:07:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004403.1384111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMRMD-0007ZW-HZ; Tue, 03 Jun 2025 13:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004403.1384111; Tue, 03 Jun 2025 13:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMRMD-0007Xr-EW; Tue, 03 Jun 2025 13:07:09 +0000
Received: by outflank-mailman (input) for mailman id 1004403;
 Tue, 03 Jun 2025 13:07:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pD2F=YS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uMRMC-0007Xl-DE
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 13:07:08 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6f6a35a-407b-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 15:07:07 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a367ec7840so3867237f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 06:07:07 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7f8f1adsm163686335e9.7.2025.06.03.06.07.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jun 2025 06:07:06 -0700 (PDT)
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
X-Inumbo-ID: a6f6a35a-407b-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748956027; x=1749560827; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FngO5pKUv6NzNJwHYN5lAHIoRoCkz+A9NGjhJrIfxq8=;
        b=N6otXvrYW/i1BK2PlzaGCo4yB2OJ9hPNJYzdIjsDXCgqeI0N8ToWw/AsDTLRHww9eF
         eGESZQDU4KZMIpKmDrz+dJ/XieFmqNlTXgmZFAsAADM1nvq3l+FNEy2/SR8lnkUV2Ers
         IzDZM5f3bu91tmv9p+/Rj66PFJLSIYqPWzUUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748956027; x=1749560827;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FngO5pKUv6NzNJwHYN5lAHIoRoCkz+A9NGjhJrIfxq8=;
        b=MSgqRUKavNevhT/s0yabCBhp+iGqs/BIpRbCjRX9qo3aiuVqz4q9U/Ut2gYbmcW3wz
         EGV8HWZx13XuQRD/MetQWOev1N2aZU0yeshmeCLuS0YSQgCbU1wdb97cHlnyt9wrfKvs
         BitcAQfKWYiaQWLbQVeQP6w/6b13Llyupyh678iScXRka/apjnQA/mTf89YlJy9zEMtP
         mulyxSbuoFD9x+IXs38A5zalatepolLuiqjAKyKCrTYZ/fsYjFc3nqAM7CTZpuf8fn5W
         4BFpq36z62MkDtQcgEAOHcCawfL9kvgyQsHT3ENdgdfuLlVlgbT6XzjcE5SPMS/0oj4d
         Re1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtwAB6rh5lnP0VTFgxbNT3doz3CI0l74NrS6afYsEeeIEpI0D6UseEFrjJjyZHGlJtrQKA9zliv1s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrRzaTF4bt6sht+bQ/O5w92emVoX/Y9ObROtTSzx6gZQjou3LV
	cfDru3B3fF6A/jZK11eM/ksz17y6tb3ZKDrr9A75eifu18SL+mGko8lUC0IeKRGaSqw=
X-Gm-Gg: ASbGncu1K7gJqm5ZGBffJB6eykKybSr99jD99Ban2P7L94lPOmh4im7NQNqFmMR22wY
	QQvTUSAuV3VSFJDiDVA975j2BPs6+oz/Q8elnwz9uqMV5gFco2lvZ8VzKlAAiTf4aveQHAUhgQ3
	tz4Nn1dZLfchSksjMcnUF1GLXt0BPxIoVYNgBvaYU0Kd/fdfNm+HmBMG5/3RqEsv4a+hvw4roVR
	4dQLoyT+H7KZodz3U935sGAR44QrMkX/djY1Lb3QnFD+e/nYDEBn5DFKre5C5WtmFM96YbtsFcb
	9QyE1Cy9d5MZKHN71ilYXnlrpYOVLIGO9FljgliKA/lY+lJWODU7brw0+75b0+a7pfNkHPaaTe5
	yBs8yThnibwRHbYbb7ZbBPOV6Lgg=
X-Google-Smtp-Source: AGHT+IFI6JSvm4b5n6po8K43DCmmCp2oC0SuzxYYiG1EGMT0P1mD04Jfv9A2MGtELK+60oLYrUmMrA==
X-Received: by 2002:a05:6000:18af:b0:3a4:efc3:88d3 with SMTP id ffacd0b85a97d-3a4f89ddd87mr12902257f8f.28.1748956026807;
        Tue, 03 Jun 2025 06:07:06 -0700 (PDT)
Message-ID: <7d2a09db-2379-4dab-ae9b-cc4fb0ed11cd@citrix.com>
Date: Tue, 3 Jun 2025 14:07:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/9] tools/tests: Fix return value of test-rangeset
To: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250603124222.52057-1-anthony@xenproject.org>
 <20250603124222.52057-3-anthony@xenproject.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250603124222.52057-3-anthony@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/06/2025 1:42 pm, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
>
> Otherwise, failed tests are ignored by automated test.

Fixes 7bf777b42cad

> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

