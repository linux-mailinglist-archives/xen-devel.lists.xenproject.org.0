Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8470FA386D4
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 15:46:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890563.1299712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk2NV-0005oP-Lm; Mon, 17 Feb 2025 14:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890563.1299712; Mon, 17 Feb 2025 14:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk2NV-0005mx-Hm; Mon, 17 Feb 2025 14:45:45 +0000
Received: by outflank-mailman (input) for mailman id 890563;
 Mon, 17 Feb 2025 14:45:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xGAw=VI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tk2NU-0005mr-VE
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 14:45:44 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcd8c81d-ed3d-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 15:45:42 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so29434175e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 06:45:42 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43991c84fa4sm676825e9.39.2025.02.17.06.45.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 06:45:41 -0800 (PST)
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
X-Inumbo-ID: dcd8c81d-ed3d-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739803542; x=1740408342; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xTpm7Ychb9XDmGycLPciGN5ukZsldrhM5Pw5qLvkJ2I=;
        b=ulMoVvPP0VSSZBf4Gp4U6C0pQpXDMBn2tiMwpGsPlf2kgMLHJnfVeUovCBj1E2Ce6m
         t2S1Xdf65KNhlVFUDLqixdYKr+j/yIFMtWYd1pRwypI0W4YLF47G4bDk/sMH6Y+lp6rt
         2Aa1WsRTFMr9obRJtGNSCHfPYxO2m9hD24SKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739803542; x=1740408342;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTpm7Ychb9XDmGycLPciGN5ukZsldrhM5Pw5qLvkJ2I=;
        b=H/VkVCJq/h0e7bRSSxD9sxT5l8rtIMfjHuhhKB6UL3h/nHdD4oDVA5gwh5a04gp6Om
         ZJgXyOpJNyf9sNckenKPn/29VG0IbZEXI7LRmv5Y6N2NlkQSeX1lCDudVziVdclM5SkX
         qOwU9I4/qKei81jLh3WSEy9epujaIpBMgOXD/LaSJIxUMNW6iTy8gUTwzm/GDBPvCMGw
         ujqLxeuD6W1+qo6jj4RMmce1oTXZn590UKzu899Mg9jLAmzRPLTlegGzQmwvncJBPH1H
         TvH09/WVXeZp7YkcjKIxcoQRCGmF7prnX+GzHh9I2GfDu55ZPzvmvFy8vXG2fD7sV8qM
         qbmg==
X-Forwarded-Encrypted: i=1; AJvYcCVW/IlKQxQZ0DYR7eLF4c307ceYtm0EkmKNV0X4gZBj506twCFLJxsift5VCbp2YtWCssmE3Kc+r/0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFUEp49VXbtQKjA+XHxhB1bqc2AUGdAWfs5pkAlW0SfGOqbQtS
	NCqAR9P7TZmE3euYDLK5CHjllm58lUzgvPlVz6bartclmDRBTBJIximEDBOk5cc=
X-Gm-Gg: ASbGncu3ry2PWDX+h0wZ/PhgzCwMNrSyl79lvb0Y9p7MuLS+tr84syJp/smKqglS8eM
	zp/GBFAlPXp8gMpHjfuL86pBuUNx5bzPywrzUTveE1AVqwNXlNqcYKajmU1OR1cOVf96BAHTI/3
	enSeD7El/QZdeAhZvbudpyYtUjR5FpMGTR73KixT4MbsheO0XQAh4/Bc0XDeHYjJtJA4lWFjApu
	fN5W7OY7db01kFfN8rfKINBDdV+UfXNgx1NtAo/M2wZck7oUpFZxrrD3rFAghiCqQC0xJwfsK4I
	Dzk7F29qBQ5XYst5C/XjPfmn3m5Egz6wKwjUES4amhr5wRxVox/+pco=
X-Google-Smtp-Source: AGHT+IEF4Egt8WOIXZY5lrShpxy3u4nEronfgfh69EKynQKfShdSqdyohkPleddmVntLKmNAATfdHg==
X-Received: by 2002:a05:600c:4fc9:b0:434:a929:42bb with SMTP id 5b1f17b1804b1-4396e7000bcmr96317325e9.18.1739803542243;
        Mon, 17 Feb 2025 06:45:42 -0800 (PST)
Message-ID: <f4f93da6-42e1-4a9d-b638-e44560f84408@citrix.com>
Date: Mon, 17 Feb 2025 14:45:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 v5] Avoid crash calling PrintErrMesg from
 efi_multiboot2
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20250122101407.52282-1-frediano.ziglio@cloud.com>
 <9d7b6706-7415-43d5-a66e-650eb67437fa@suse.com>
 <5c9ab6a7-2095-4f7c-8e5b-1942ad54420d@gmail.com>
 <CACHz=Zjru+BYnhFz97W1LGpTQNej+SM6-jZ-rqGE=D6x0rt5+A@mail.gmail.com>
 <CACHz=ZghOk1EET3_N3Rn-1+0anZ7e702cKux7U5bBf862fDfQw@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CACHz=ZghOk1EET3_N3Rn-1+0anZ7e702cKux7U5bBf862fDfQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/02/2025 1:55 pm, Frediano Ziglio wrote:
> ping

Ping what?

You have no maintainer ack, an outstanding bug raised against this
version, and a suggestion on how to address it.

I'd really like to see this in 4.20 too, but this needs a v6 before it's
going to progress any further.

~Andrew

