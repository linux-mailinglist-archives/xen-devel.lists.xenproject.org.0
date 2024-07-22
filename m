Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E835938BEB
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 11:19:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761572.1171537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVpCN-0000YP-Rh; Mon, 22 Jul 2024 09:19:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761572.1171537; Mon, 22 Jul 2024 09:19:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVpCN-0000W7-O3; Mon, 22 Jul 2024 09:19:15 +0000
Received: by outflank-mailman (input) for mailman id 761572;
 Mon, 22 Jul 2024 09:19:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JAiy=OW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sVpCM-0000W1-Cu
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 09:19:14 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75e872ce-480b-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 11:19:13 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a77c9d3e593so386735966b.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 02:19:13 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c7be6f8sm399076866b.76.2024.07.22.02.19.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 02:19:12 -0700 (PDT)
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
X-Inumbo-ID: 75e872ce-480b-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721639953; x=1722244753; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d6VEfOLTGJ+RuHev7qljds8DEypYkTZxz0lWwbVUhN8=;
        b=UFgIDc7VA/kq/asI2svZVBQ2CjphDpqx7lgS19lDsm83uiR3F7L9eG35mQe7v8asfl
         1WhEhBmon2rrBIgD1VuBzhJab6Q1LDPNHtTrkJYnd8A8HALVu5k9Ftt4pzRC5VtWfsGS
         3paIzDOKNFLy+h0QUtAK31T6gKKMdt519FCtkRm3pUOaaGHFJ/R0ejszH6osJx4LA4ro
         Hx+IW/+nyc2WHW64145017KblsdXvRYNC0HMfyIQ5MR/Nccs2Qh2wXFMq/NfKOprxiJi
         K6LbJlqxIcRxinUMkHsUp2ExMrNPtzYUaOYqSGEwInHte+NGdFDUSpwQXIBk+tUWe3wN
         zbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721639953; x=1722244753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d6VEfOLTGJ+RuHev7qljds8DEypYkTZxz0lWwbVUhN8=;
        b=KgOnCQBJfyZ2jo/C15Iy7ukN9uttu50WvV9E4/8diM71lPxsiDynOseq1QI16WWs7f
         W0tZhxZyOpt9LKw1Om2NWS0ZLnGgZkawqFoCYHyOlc2v+fzELJP98bu7ShSvQJeF/NQD
         3W4VF3p6TIo8DjLP84NlXzN/SLd2ybfNmHVAej7ifj8avcYzsM+c4jF/PSnemoqdq/1C
         63qR8vpwzaIq0IJDlOECueExEfFzTf+0dTfPGT8UFNwV84P0R5bDm2pnjduYQpMUGuS3
         XrXklKgFHuwnSwE3DsSvR9FJG3tQOWYWzHhn4BcL+C2p1UjmA2yroa/zWoGpJvhIyTqT
         6J4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXx4OKS9KWVeKBSUIIQR5vEJDgtq52bPKr+yD6tKBr07os8dcB78xfVVtHkKryc8FXsq9im4OTPSLm+tBvG9cea3EC0BxHjuOEey9rZsUs=
X-Gm-Message-State: AOJu0YwN6537ar4hzLzqIuqRve501YhcBIoHfKploqpeUS2/dX7toY0g
	43GttJUm1ZHF6YJy/Xp4pk55NXksnEe2z71/VCWxEQJ3yP983I83upa41PBVqpE=
X-Google-Smtp-Source: AGHT+IFS3Zn8s/ol87S4kv6XDUlg+Vgzm4vTYr3OhFxcM7IrGlzTveu5UCxLGnRUAwispgONuoyt1g==
X-Received: by 2002:a17:906:dc8f:b0:a75:1069:5b94 with SMTP id a640c23a62f3a-a7a4bfa6ecamr437723266b.21.1721639952795;
        Mon, 22 Jul 2024 02:19:12 -0700 (PDT)
Message-ID: <7d278c21-e966-4c72-9955-63287f422f79@suse.com>
Date: Mon, 22 Jul 2024 11:19:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] tools/libxs: Fix length check in xs_talkv()
To: Jason Andryuk <jason.andryuk@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20240718164842.3650702-1-andrew.cooper3@citrix.com>
 <20240718164842.3650702-2-andrew.cooper3@citrix.com>
 <78c73bac-deb9-4e6e-8027-fb78369f695a@amd.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <78c73bac-deb9-4e6e-8027-fb78369f695a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19.07.24 23:14, Jason Andryuk wrote:
> On 2024-07-18 12:48, Andrew Cooper wrote:
>> If the sum of iov element lengths overflows, the XENSTORE_PAYLOAD_MAX can
>> pass, after which we'll write 4G of data with a good-looking length field, and
>> the remainder of the payload will be interpreted as subsequent commands.
>>
>> Check each iov element length for XENSTORE_PAYLOAD_MAX before accmulating it.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Juergen Gross <jgross@suse.com>
>> ---
>>   tools/libs/store/xs.c | 17 ++++++++++-------
>>   1 file changed, 10 insertions(+), 7 deletions(-)
>>
>> diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
>> index ec77379ab9bd..81a790cfe60f 100644
>> --- a/tools/libs/store/xs.c
>> +++ b/tools/libs/store/xs.c
>> @@ -571,21 +571,24 @@ static void *xs_talkv(struct xs_handle *h, 
>> xs_transaction_t t,
>>       struct xsd_sockmsg msg;
>>       void *ret = NULL;
>>       int saved_errno;
>> -    unsigned int i;
>> +    unsigned int i, msg_len;
>>       struct sigaction ignorepipe, oldact;
>>       msg.tx_id = t;
>>       msg.req_id = 0;
>>       msg.type = type;
>> -    msg.len = 0;
>> -    for (i = 0; i < num_vecs; i++)
>> -        msg.len += iovec[i].iov_len;
>> -    if (msg.len > XENSTORE_PAYLOAD_MAX) {
>> -        errno = E2BIG;
>> -        return 0;
>> +    /* Calculate the payload length by summing iovec elements */
>> +    for (i = 0, msg_len = 0; i < num_vecs; i++) {
>> +        if ((iovec[i].iov_len > XENSTORE_PAYLOAD_MAX) ||
>> +            ((msg_len += iovec[i].iov_len) > XENSTORE_PAYLOAD_MAX)) {
>> +            errno = E2BIG;
>> +            return 0;
> 
> return NULL;
> 
> With that,
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

With the suggested change:

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

