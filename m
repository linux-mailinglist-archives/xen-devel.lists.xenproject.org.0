Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD039E5EC7
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2024 20:30:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849253.1263884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJHXz-0000qA-7W; Thu, 05 Dec 2024 19:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849253.1263884; Thu, 05 Dec 2024 19:29:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJHXz-0000oF-4F; Thu, 05 Dec 2024 19:29:59 +0000
Received: by outflank-mailman (input) for mailman id 849253;
 Thu, 05 Dec 2024 19:29:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wNEb=S6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tJHXy-0000o7-Ag
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2024 19:29:58 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f19fbd9-b33f-11ef-99a3-01e77a169b0f;
 Thu, 05 Dec 2024 20:29:56 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3862a4b8ec2so89603f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Dec 2024 11:29:56 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3862190965asm2748754f8f.82.2024.12.05.11.29.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2024 11:29:55 -0800 (PST)
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
X-Inumbo-ID: 4f19fbd9-b33f-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733426996; x=1734031796; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Jrm0cAtT507kZI0+GHeU1830OSWqdmqJYqV3CAdFlb8=;
        b=fnrrTC/rCwM1j905UDOZJFYzGWXMjEcNKGnwWNQG/83Bx7chZ/zt6con5R2J/CY4oZ
         0U62+kEX50nzJht1hX1GNfskcM74Lc3HrWpGJByJG4+OEn8xP+ei1AwHK5il3ddLniPL
         tyAzCr88dcQVGfdbf8p+dvuZk8j6HEXwdDAYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733426996; x=1734031796;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jrm0cAtT507kZI0+GHeU1830OSWqdmqJYqV3CAdFlb8=;
        b=XbdMP56QZvocj3MUJsFfqTZRj5RxZ+z6WAksk//VYE1OmvSgRR0S0xnX7OXlM3RY7U
         9YVwMAUKUOCL9qvv7H/26I/2emKWoahQEHfhXQwr45vQEa0YiPQH3b5mOiSa8sSk7zA/
         KjWzz0Fx/XGrIA5qC5CBETaiSbH1JmgQAnAlZGbyaA/L2DfdgTjT2BELs7sO1bXHJrgi
         PDDnuihYug1LNHLAkuatWqQSXOZPyUSjcIohwEYMocRb4JPnircQA97Jpoip0kVzNTad
         fudCy+MbJ6x0cFRhObOkb4d0EKUq2eTc0yZwLhE91bVrnzkXoyUteFAPye3zOy5bdYrR
         /nNw==
X-Gm-Message-State: AOJu0YzwrEvSflVUxKh/lNNQDLo+S04zNQR7YnABZE04p73R9J5OnwAo
	UTqVb6/XrDR7j1dRcIQtfxWWVD1qhHvzwxtYLG3WYznH2sOjFLULkMS0wsgi5ZAr1AtqxN2hsxZ
	V
X-Gm-Gg: ASbGncuZQX6Tst/reIMsFuVfHn2pPkaav5AUSGWsGyoEZCUqNoqTqdCf+JpwUw2WoQf
	CHsZBY2paziVucdzATAMU7UlqE0SAreFVWkeH9swyActq1Vmo7BgHNJaoCUV8QbBhLRLDbgKYSL
	mhkoXFdGQulizowC29q2NEploYnb4PdCz6VYqzP650FKGqknrPMfwohYq9plqcA6IaDNhLITXII
	fGWvpwtK0RUFy/7hArphjNuIRJIl5eDUcWwltn15W7iXuYS3QOnDRuamOYuYagnerB4tk9HqZ+6
	Kcy9Wj9e10M7lA==
X-Google-Smtp-Source: AGHT+IGBMiYKBRQoOq1OGegWXCZcE45iK4QvL+h3JdgjxMqy+8TQxknxTryho9iRGZiaRSKc51nwcA==
X-Received: by 2002:a05:6000:793:b0:385:ef39:6ce9 with SMTP id ffacd0b85a97d-3862b351418mr253154f8f.21.1733426995920;
        Thu, 05 Dec 2024 11:29:55 -0800 (PST)
Message-ID: <f0ca35df-b999-4cf8-bd54-9fbf29e5117c@citrix.com>
Date: Thu, 5 Dec 2024 19:29:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] tools/xl: add suspend and resume subcommands
To: Anthony PERARD <anthony.perard@vates.tech>,
 Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?zithro_/_Cyril_R=C3=A9bert?=
 <slack@rabbit.lu>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20241203220641.4202-1-jason.andryuk@amd.com>
 <Z1Gz0VrMZ5degOUJ@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z1Gz0VrMZ5degOUJ@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/12/2024 2:08 pm, Anthony PERARD wrote:
> On Tue, Dec 03, 2024 at 05:06:41PM -0500, Jason Andryuk wrote:
>> From: zithro / Cyril Rébert <slack@rabbit.lu>
>>
>> The xl command doesn't provide suspend/resume, so add them :
>>   xl suspend <Domain>
>>   xl resume <Domain>
>>
>> This patch follows a discussion on XenDevel: when you want the
>> virtualized equivalent of "sleep"-ing a host, it's better to
>> suspend/resume than to pause/unpause a domain.
>>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Suggested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> Signed-off-by: Cyril Rébert (zithro) <slack@rabbit.lu>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Committed.  This definitely warrants a note in CHANGELOG.md

~Andrew

