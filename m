Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A16C29DB8AA
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 14:29:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845478.1260889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGeaD-0008LV-Md; Thu, 28 Nov 2024 13:29:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845478.1260889; Thu, 28 Nov 2024 13:29:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGeaD-0008It-Jm; Thu, 28 Nov 2024 13:29:25 +0000
Received: by outflank-mailman (input) for mailman id 845478;
 Thu, 28 Nov 2024 13:29:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=53lb=SX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tGeaC-0008If-AQ
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 13:29:24 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c52d63cc-ad8c-11ef-a0cd-8be0dac302b0;
 Thu, 28 Nov 2024 14:29:19 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a9f1d76dab1so144294166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Nov 2024 05:29:19 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5996c1945sm66320466b.19.2024.11.28.05.29.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2024 05:29:18 -0800 (PST)
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
X-Inumbo-ID: c52d63cc-ad8c-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmMiLCJoZWxvIjoibWFpbC1lajEteDYyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImM1MmQ2M2NjLWFkOGMtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyODAwNTU5LjI2MTk2Nywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732800558; x=1733405358; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bo8khfxQEyROCPM9BIiGe8UB9lbU+wqhWzgGKkylDOA=;
        b=tg6qCMFVlZ0h667ltI+tHlpSnDE2LF/JFsq6gBH0WQnyi3/npt7M/bjmkNB/M9iFdr
         IzhHmDSlMXsc2/wDzkE0bqOkUhw1xZeLco2tZzOGJpBMQYJMQqJwgktmgNbfVZsuThas
         W6gG08RM5fg+cv1GNiVsPsurwIdak0s8C8uO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732800558; x=1733405358;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bo8khfxQEyROCPM9BIiGe8UB9lbU+wqhWzgGKkylDOA=;
        b=vgGxIGnzckPcVBvgxF5BidtoAUWF8vz/+ZsTQhX6WKudxwANOS0Rmn+sbBJdCS0Dia
         EWIeIhZlHvncjH8u8ZBSI3FAVIEhNakFwgKWiDWXnKRm2GVo6wESreGkfQECF7FFBbLU
         Wd2x5HuUWN0n+UE9LkYxMmQvOaVgCwuCpE+beIMFHsc233nms+rh6z94N8x7S+iS3UM/
         9SSRzJr9Nh3Q1LX7VjtyrfJcaRHv0tuBUOEO3k50gcCBXlepBtC03q0fwuGlxWU1i0TW
         O/TBJqwyOqtAmfOVaIb/HwfSEQ7OZ4lvqn05jFc8J78cjKtW0KVIVNkoIs9Pc8+Nv6rW
         unmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfIpEWXKYlgyyF08HSfKyLFbOsUGt2YFmLnSiHeYCVGzwRXzaJNxZ6caMS3Jvb+z8XDCwLEFfMQmA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywmw+1nCruYO9PZszPttv4q/u82EXYw1FisZQyzxUnCiNh4fMZh
	drpVeR6gMYkHsNLbLNW3VxWfjXeOJ/zICfB9W59biOhFhqyy1lU9wbh27Am6MFngb7ps0/K9HKU
	I
X-Gm-Gg: ASbGncu990cBfh0tNLfSR3VUqRQ/Ao1t/AR22J7PX16g+FdUL9mY02m/LnixVTn/UW+
	Lyu7YClZOLrdw979Kyk719xgWlJblkygk8nx8X7FaMM3qI7YObYgfWxuF9r9gEPywrlN6+ahwN+
	U58/URDD+9km/dS4xjc7qYKCjaXcuFMGIhwNGfho2JzP3PnlMR/JfxDNPRaqWpr/IPwQDTNGCCU
	elN4YcjQBxSUurt3q+e8wV2DMd3mIt8iAFpZ1mZGwUbCW9EDup/ClGzZ8Yi5Dg=
X-Google-Smtp-Source: AGHT+IFIhVKVh4WSymt3kQugmw3bXloehRAGzb4U5v28lFCWKiBPJKVypRQDGxKUzR0dTsFTV4JESQ==
X-Received: by 2002:a17:907:7802:b0:a9e:441c:f729 with SMTP id a640c23a62f3a-aa580b2e09dmr770015666b.0.1732800558513;
        Thu, 28 Nov 2024 05:29:18 -0800 (PST)
Message-ID: <27f89a1f-8cbe-4fb3-af84-c92448295423@citrix.com>
Date: Thu, 28 Nov 2024 13:29:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: correct VPBROADCASTMW2D predicate testing
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <d06c56c5-f67a-435b-af26-ed5d6a472ddd@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d06c56c5-f67a-435b-af26-ed5d6a472ddd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/11/2024 1:28 pm, Jan Beulich wrote:
> Due to presumably a copy-and-paste mistake VPBROADCASTMB2Q was tested
> twice instead.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

