Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 672217E2004
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 12:30:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627922.978838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzxnt-0002Mg-HX; Mon, 06 Nov 2023 11:30:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627922.978838; Mon, 06 Nov 2023 11:30:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzxnt-0002JO-EX; Mon, 06 Nov 2023 11:30:01 +0000
Received: by outflank-mailman (input) for mailman id 627922;
 Mon, 06 Nov 2023 11:29:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gUrR=GT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qzxnr-0002J8-TZ
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 11:29:59 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d13ea4ef-7c97-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 12:29:58 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-32f7bd27c2aso3086085f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 03:29:58 -0800 (PST)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v2-20020a05600c428200b0040303a9965asm11704826wmc.40.2023.11.06.03.29.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 03:29:58 -0800 (PST)
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
X-Inumbo-ID: d13ea4ef-7c97-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tibco.com; s=googleworkspace; t=1699270198; x=1699874998; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PjV4O4c3JZzkwIriMCXrHJSY161Nk7xmbKTqvB8Whvg=;
        b=Or91uPnpPttoAumdVatweqLHOBg8pYBIGoPh8gq8xbkbesWsWk4A33AxkYUw3WmVlL
         KcDyH3ZNdOL9nmu7mnjtmigV27zI5TN197n9dS7RlQPbAEXUCY0l3Vfh3+GuSR8SXnPa
         7sWZRUlAebjMAG71mOYszF4Ti0eIoXfdwNnn4WAgZsxbdFo/C8g757S7oYyk2ThMo47z
         i4QmhdogBiu1OC64MPD50zC7I5mMnAGeC3UdeBKbk5UH3oxwcPvzJREfqxrfYxjpUztR
         D/glB86vcFCtAam43nle+RVgjxX6f3Mj47Ib36OXzzBswKEzpy+mXcDrYn9Sz0yzJ1S+
         6FGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699270198; x=1699874998;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PjV4O4c3JZzkwIriMCXrHJSY161Nk7xmbKTqvB8Whvg=;
        b=NtGm5HVKeibC8Dhgs7nQlELldybQYTIik4sPV/k1mZTXGwpv1FUlsTWWqSyZzLibU7
         tKXWXyQOCqsGpxzVviSGZv60EjjQiievKDqHn42TJofWu38DGC3MPGgAR26TaU6eGDME
         oLxYcdSCi1kutkYbyvfpt6r4nCjnUbNsZmbF42xT4zEaDsrTeMfBGOCLTls8LT4X68xO
         +G3n6UPqEvjJ1BOzbEXM6NUC0ECIAAAtJfQcIT4gP3NMEGaBfEFGlgoURtsVO0fPPYDm
         ZqvdJYd2o+3b0ok/R56R8eooSlLjomgSnSeDeTVuH0PgWqcK2ZSSI/bAX2FP4iZZfW1R
         bfew==
X-Gm-Message-State: AOJu0YzhYF+T2l3CCUZTozg06zL/lDQyBSZI6M2LWH3g8JksN+zXk1oS
	T2/HvqHY6EfuJqgYoIVYjrVqYg==
X-Google-Smtp-Source: AGHT+IHH+th+UqrD6fpV9iv+m81TdCNhIV3D+bEzFI8C1XxafQo+FrCuDHRkPJGM/YEus8BhrkhZWA==
X-Received: by 2002:a05:600c:4fc6:b0:408:5a1c:9de7 with SMTP id o6-20020a05600c4fc600b004085a1c9de7mr24748613wmq.7.1699270198364;
        Mon, 06 Nov 2023 03:29:58 -0800 (PST)
Message-ID: <3620b635-0014-4def-b4c6-aadf099b0410@tibco.com>
Date: Mon, 6 Nov 2023 11:29:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools: Remove all DECLARE_* op macros in xc
Content-Language: en-GB
To: Olaf Hering <olaf@aepfle.de>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <20231106081946.1055-1-alejandro.vallejo@cloud.com>
 <20231106115852.31df968d.olaf@aepfle.de>
From: Andrew Cooper <andcooper@tibco.com>
In-Reply-To: <20231106115852.31df968d.olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/11/2023 10:58 am, Olaf Hering wrote:
> Mon,  6 Nov 2023 08:19:46 +0000 Alejandro Vallejo <alejandro.vallejo@cloud.com>:
>
>> +    struct xen_sysctl sysctl = {0};
> What is that zero doing here? I think a plain {} will do it as well.

Indeed.  It needs to be {} and not {0} to compile on some obsolete but
still supported versions of GCC.

~Andrew

