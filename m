Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9B393A061
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 14:08:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763116.1173341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWEJC-0001Pt-3C; Tue, 23 Jul 2024 12:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763116.1173341; Tue, 23 Jul 2024 12:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWEJC-0001Nf-0E; Tue, 23 Jul 2024 12:07:58 +0000
Received: by outflank-mailman (input) for mailman id 763116;
 Tue, 23 Jul 2024 12:07:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=402b=OX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sWEJA-0001Mj-Dq
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 12:07:56 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 319a935a-48ec-11ef-bbfe-fd08da9f4363;
 Tue, 23 Jul 2024 14:07:55 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a6265d3ba8fso57187666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 05:07:55 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c785b97sm543016766b.14.2024.07.23.05.07.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 05:07:54 -0700 (PDT)
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
X-Inumbo-ID: 319a935a-48ec-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721736475; x=1722341275; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gMM5Vk9Ch/boDrfecdJ+TXxssk3o6a0DiqHi2lNRops=;
        b=bP2/GAjOeG4vULeZ8fDpTosygLjXxeTa6pmrA84frlGyk01CDt9APQZiFc0XIgF+Ms
         9wY5sP5mV5raaQ6dH/nMYWCzirsPfwhiumTUqA6nlMqzXUdXYJBCPnymDeJz45DS8aK8
         FBaywsI/vfjP+fPRbf8TZcrs2dbTwxrK8FQ7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721736475; x=1722341275;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMM5Vk9Ch/boDrfecdJ+TXxssk3o6a0DiqHi2lNRops=;
        b=wdG9VoMeiFAsYWRifP1cy0xC/xxm2pqksS/Oa8MSk3N/lfeK4RPA80TPoSFuPjSyXj
         rLLKnCsthT5RvaRyssrjT0lU2cpGOiR+LExqFZlUtgNw8pqaoqOS58REsWFoA5Lv3Xiq
         RHXYRKHJCuSwy4MAAMVk0SDob77jTAv5EkfRVlo+98mw31s7MiJIubMCmKwJR+Fi4Thr
         y9kW3uG3N6Th/2YiXkBg0bL/7Y+vyfJoIZ0QQMWbYgoM1OGaMHDDzeI95OKtBbzoP2T1
         sUgkuQOuHMn80dzPNgDUD8KVGdQ1fkIS2f9jBwTSCqQNY8s8VQUpGCSkpDyS3HZzXPC1
         YDNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCMxfeQTqpQko9QnViUDMLDM0hTYuQpMre7FOPPQXKgO7BAC2+rvKNP5+QvyC+TfKQjqIWBJGUBI44FiOtL6e/s0LRAEmT++k0Cyo/ejo=
X-Gm-Message-State: AOJu0Yy5jCuR0+il3ggT4Uq1Z1fddmBeEeSIwzL0rB+KBiJiSNZigcBT
	kk2Bho2dRYDyLKrZGxca+4Dt9BDsCFbwaLBLpJntjZFdAURA6m7wOj+9p2FqHSw=
X-Google-Smtp-Source: AGHT+IFquNEQn68jck9AZEvkemsF0qppKAJ5vAL8AJ8ws1jxVB09cKTzaIvqBDrZPhFQMU0qSvIisQ==
X-Received: by 2002:a17:907:e8a:b0:a6f:6b6a:e8d0 with SMTP id a640c23a62f3a-a7a87c86785mr209633866b.7.1721736474790;
        Tue, 23 Jul 2024 05:07:54 -0700 (PDT)
Message-ID: <d6cc1f6f-fd37-4911-b3a4-59915727841f@citrix.com>
Date: Tue, 23 Jul 2024 13:07:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] tools/libxs: Track whether we're using a socket or
 file
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20240718164842.3650702-1-andrew.cooper3@citrix.com>
 <20240718164842.3650702-5-andrew.cooper3@citrix.com>
 <8cbe6c8c-1401-4661-9319-e174ffce7461@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <8cbe6c8c-1401-4661-9319-e174ffce7461@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/07/2024 10:33 am, Jürgen Groß wrote:
> On 18.07.24 18:48, Andrew Cooper wrote:
>> It will determine whether to use writev() or sendmsg().
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Juergen Gross <jgross@suse.com>
>> ---
>>   tools/libs/store/xs.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
>> index 96ea2b192924..f4edeb05f03b 100644
>> --- a/tools/libs/store/xs.c
>> +++ b/tools/libs/store/xs.c
>> @@ -65,6 +65,9 @@ struct xs_stored_msg {
>>   struct xs_handle {
>>       /* Communications channel to xenstore daemon. */
>>       int fd;
>> +
>> +    bool is_socket; /* is @fd a file or socket? */
>> +
>>       Xentoolcore__Active_Handle tc_ah; /* for restrict */
>>         /*
>> @@ -305,6 +308,8 @@ static struct xs_handle *get_handle(const char
>> *connect_to)
>>       if (h->fd == -1)
>>           goto err;
>>   +    h->is_socket = S_ISSOCK(buf.st_mode);
>> +
>>       XEN_TAILQ_INIT(&h->reply_list);
>>       XEN_TAILQ_INIT(&h->watch_list);
>>   
>
> I'd prefer to set h->is_socket above the current
>
>     if (S_ISSOCK(buf.st_mode))
>
> and then use h->is_socket in this if instead.
>
> With that:
>
> Reviewed-by: Juergen Gross <jgross@suse.com>

To confirm, you mean like this?

@@ -297,7 +300,9 @@ static struct xs_handle *get_handle(const char
*connect_to)
        if (stat(connect_to, &buf) != 0)
                goto err;
 
-       if (S_ISSOCK(buf.st_mode))
+       h->is_socket = S_ISSOCK(buf.st_mode);
+
+       if (h->is_socket)
                h->fd = get_socket(connect_to);
        else
                h->fd = get_dev(connect_to);


