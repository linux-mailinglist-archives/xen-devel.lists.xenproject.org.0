Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED09A45E40
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 13:11:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896475.1305175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnGFh-0002Wv-CE; Wed, 26 Feb 2025 12:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896475.1305175; Wed, 26 Feb 2025 12:11:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnGFh-0002V7-96; Wed, 26 Feb 2025 12:11:01 +0000
Received: by outflank-mailman (input) for mailman id 896475;
 Wed, 26 Feb 2025 12:11:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GPjD=VR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tnGFg-0002Tk-8P
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 12:11:00 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcf08b3e-f43a-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 13:10:58 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4398c8c8b2cso67832225e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 04:10:58 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba5871d8sm19021925e9.37.2025.02.26.04.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 04:10:57 -0800 (PST)
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
X-Inumbo-ID: bcf08b3e-f43a-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740571858; x=1741176658; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MzbG8QxDGqMkZUwW0VAoZPcS/KsYGG68b2J/yrH9J7E=;
        b=GQvj1gv0oO3T2xKCefa9f8r+g52XVNjQy+k8zEsp+WfaXIF5HDFjFOkNLazZQk4fsP
         ryCSDhYDlso2bhmO4SBPUQV0Mu0/2a6g3wgTx5Z/amGZBLJ3qCSwdvQHyOiKjvp+bPfL
         752J0/rAYPtPESf6VDIsZqPnMfM2ddWsa3AGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740571858; x=1741176658;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzbG8QxDGqMkZUwW0VAoZPcS/KsYGG68b2J/yrH9J7E=;
        b=ESgg023IT3MALftr9nFiJoMZxLKmCR9oquHV7GgvL8dbm6zCgdsNbnIs/V2PLyAbJ4
         2v/LtmqImOCM/Esu7OBK3XWfRT78hEDdxZGNvKo0Er80/8iRWvjV5X8PgBjfPzplTsmm
         J4ysPqJiQminOUdQ1DaU5NvfiEhsu8juXPA7DEQfUnGUBLhViOQ5PexzHJE5alo4jEvt
         J1EDWuEPRjNfCRCIfU3dpfscmkoRb9+wWAKv/z/4Tf++Ksq1McfSSdpWApJke/rZBX8C
         aYotrZMOq7B1gjTRl0HvLAQySIR4Wg4Tt4zpWkWYD/V40SC3M1gey3iQWmw3MItzP1X/
         AZZg==
X-Forwarded-Encrypted: i=1; AJvYcCUqwsnjpXVO/+YH/KAYe04PmEn30NRFXdEXl4gI8xiqykrHkG0FvkpUwRnFjZSs7rSUI1EXFJsUxjM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/jHgXYCGmNw0kH7rKMIoprhwBtkpUF+lG7n+LtD/JIxQAh/LW
	zabpp0YJijsj8Pd6xXJ2+25BoFEeqZNIw+ztgw0gGzX73A5wAiSgr//eq3t4fiE=
X-Gm-Gg: ASbGncuEsyyuCy1+muRdp7BjczaPMsP/V/CHYcFL9sBJ0GUpmLn/RqpwWz3jsdTUOhm
	/Zckk5mx1hAaGnAqKoqkaSEqN2jBQhb6R83UY7RdtxsB6RS8iXKq0rei4YcT7INiZIcz6ne2SGI
	IO3kJE0sXTwM7n5kv7A1IS8AwLR71gTKkyJbZImWypNBIAabxEYqUyGMLPQhCAIAvtmsMHcFwnE
	arBDsg8VVUVdIsXZNyme/7pkw3s3YLTw+wJh28qSgvBu8LCA+m9wv2TXEW5JTuQ6oJzzWPKTPlF
	BDIEpLrzxXCIZxtFtbYMeE7gJK28jVhfvzI+1oGzfp1UqdZeM//9dKt1BPGGCULG2w==
X-Google-Smtp-Source: AGHT+IFvV6m4CxinhzADODJR4ZBb1Pn6dzx+EU6S06Cc+hvwYtWESts1u+zAU+cKwQoil5Kwak17FA==
X-Received: by 2002:a05:600c:1f90:b0:439:8544:1903 with SMTP id 5b1f17b1804b1-43ab0f64430mr66481955e9.20.1740571858310;
        Wed, 26 Feb 2025 04:10:58 -0800 (PST)
Message-ID: <2295052e-3999-47ef-bb74-ca8517296abf@citrix.com>
Date: Wed, 26 Feb 2025 12:10:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] PPC: Activate UBSAN in testing (for 4.20?)
To: Jan Beulich <jbeulich@suse.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1740540262.git.sanastasio@raptorengineering.com>
 <a1bc84821cf9018549fb1dc0aeb8fd8f9bfeb002.1740540262.git.sanastasio@raptorengineering.com>
 <4d5511e2-ff07-42fe-b57e-7e66c999d811@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4d5511e2-ff07-42fe-b57e-7e66c999d811@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/02/2025 7:24 am, Jan Beulich wrote:
> On 26.02.2025 04:27, Shawn Anastasio wrote:
>> From: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> Also enable -fno-sanitize=alignment like x86 since support for unaligned
>> accesses is guaranteed by the ISA and the existing OPAL setup code
>> relies on it.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks. I've committed this.

Oleksii, seeing as how simple it ended up, and seeing as how you're
currently writing the release notes for 4.20 while excluding PPC from
the list...

Views on this sneaking in at the last moment?

~Andrew

