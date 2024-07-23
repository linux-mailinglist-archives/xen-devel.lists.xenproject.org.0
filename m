Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC90393A062
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 14:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763123.1173350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWEKC-0001xr-Bf; Tue, 23 Jul 2024 12:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763123.1173350; Tue, 23 Jul 2024 12:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWEKC-0001w2-98; Tue, 23 Jul 2024 12:09:00 +0000
Received: by outflank-mailman (input) for mailman id 763123;
 Tue, 23 Jul 2024 12:08:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BZ+O=OX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sWEKA-0001kl-Hz
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 12:08:58 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56232b7c-48ec-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 14:08:56 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2f0271b0ae9so2673561fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 05:08:56 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30a4d70d8sm7435012a12.1.2024.07.23.05.08.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 05:08:55 -0700 (PDT)
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
X-Inumbo-ID: 56232b7c-48ec-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721736536; x=1722341336; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Sc9OLN0Pb08EzBZUz0Rj5/+5mfUVa00ktITdGCAZ7c=;
        b=ZK+SgXyQ1GuFeF9GSVjYT6KVKcnhQjTUBeLtrZv26wJRMOvqw5PAimC7oEHoxzQK/3
         IjicEe1XJQmgw0NTOoUWQjKoHlWbqf9Rfp7BUpiz3fyNIBitvwaN63P3ePKIXx+I/JBB
         mUKv5K4UB8CM1YsE1dfBpHbyPGORlW7i/XgEIfPN1GbWpvFTP7BYRLyr91W3/n3B1or2
         jsO+kPo6Ktyw6vpENxRp4gaHIWLe1uTzZgfB4NwdZGhDeR2FowqtrRmUfulQPbV64hzL
         ilQ1L5QJeZnGNt81vOOAr2QIZ35aXZGp5tBpN7ZTAO5z6YHlvSsJWy4FH9rEQCEU4obF
         traQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721736536; x=1722341336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Sc9OLN0Pb08EzBZUz0Rj5/+5mfUVa00ktITdGCAZ7c=;
        b=aS8URVW842sICbXGRc56WJC9y1ajAjDgEBFzBkNw7LfVTzVt67HiDTRCRPNbAUKT9+
         utbIvHg1QmcVo6MgN4XgevN7BuMw6Gh9S6+SidctYFOxuLGY2znkjvOuVMPryQtWXogH
         Srzof2xFQvzldsznEGSFu671COKFqwIdk3xEPDnYinGENahdgW3TIC91GIS4Z2pvF9Rd
         8RXk+OdaGgYQrdYlVGhTA7ScpAdxvMSKBmkx+2iwOADHER51zvqSqwGaf5To7HXTc//d
         tWLGyS2n+aJzilknRYJ20WcSW0aMDRudPri9GdFA/V/cf+MrkOzv9vIgkeCQvOSii1FA
         Q+mg==
X-Forwarded-Encrypted: i=1; AJvYcCV0PyLnxA8kmfgThJE2u64QW8VwZFiAaUywoSb2sO6SrdqNJFtCkEuu+tcl73R/qJ4u0H+eTn+cgFOKSBNmL5iCHYlAOn8kJx0J8AywLaE=
X-Gm-Message-State: AOJu0YzOfHU6H1sdRt946DnrZkdkmtpzO7fWoqVMSKbzoWnzz7wX/Qsi
	Z8AikYKvz4RNaCw2S66cQL9bSRi4vX4FS6J+UJBi0OzUFiCMhgVNccSY9OH1YiY=
X-Google-Smtp-Source: AGHT+IG8aMy8iizL7PNwtEZSrTevbpaP0RUSl7/8+ytXnYM1zGeZj0MaHIMlLz5JLnHKDevPPfb16Q==
X-Received: by 2002:a2e:7e07:0:b0:2ef:2c86:4d45 with SMTP id 38308e7fff4ca-2f01ea6df8bmr18400651fa.27.1721736536025;
        Tue, 23 Jul 2024 05:08:56 -0700 (PDT)
Message-ID: <6cc32731-8346-4839-8a59-9a613505ae20@suse.com>
Date: Tue, 23 Jul 2024 14:08:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] tools/libxs: Track whether we're using a socket or
 file
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20240718164842.3650702-1-andrew.cooper3@citrix.com>
 <20240718164842.3650702-5-andrew.cooper3@citrix.com>
 <8cbe6c8c-1401-4661-9319-e174ffce7461@suse.com>
 <d6cc1f6f-fd37-4911-b3a4-59915727841f@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <d6cc1f6f-fd37-4911-b3a4-59915727841f@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23.07.24 14:07, Andrew Cooper wrote:
> On 23/07/2024 10:33 am, Jürgen Groß wrote:
>> On 18.07.24 18:48, Andrew Cooper wrote:
>>> It will determine whether to use writev() or sendmsg().
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Anthony PERARD <anthony.perard@vates.tech>
>>> CC: Juergen Gross <jgross@suse.com>
>>> ---
>>>    tools/libs/store/xs.c | 5 +++++
>>>    1 file changed, 5 insertions(+)
>>>
>>> diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
>>> index 96ea2b192924..f4edeb05f03b 100644
>>> --- a/tools/libs/store/xs.c
>>> +++ b/tools/libs/store/xs.c
>>> @@ -65,6 +65,9 @@ struct xs_stored_msg {
>>>    struct xs_handle {
>>>        /* Communications channel to xenstore daemon. */
>>>        int fd;
>>> +
>>> +    bool is_socket; /* is @fd a file or socket? */
>>> +
>>>        Xentoolcore__Active_Handle tc_ah; /* for restrict */
>>>          /*
>>> @@ -305,6 +308,8 @@ static struct xs_handle *get_handle(const char
>>> *connect_to)
>>>        if (h->fd == -1)
>>>            goto err;
>>>    +    h->is_socket = S_ISSOCK(buf.st_mode);
>>> +
>>>        XEN_TAILQ_INIT(&h->reply_list);
>>>        XEN_TAILQ_INIT(&h->watch_list);
>>>    
>>
>> I'd prefer to set h->is_socket above the current
>>
>>      if (S_ISSOCK(buf.st_mode))
>>
>> and then use h->is_socket in this if instead.
>>
>> With that:
>>
>> Reviewed-by: Juergen Gross <jgross@suse.com>
> 
> To confirm, you mean like this?
> 
> @@ -297,7 +300,9 @@ static struct xs_handle *get_handle(const char
> *connect_to)
>          if (stat(connect_to, &buf) != 0)
>                  goto err;
>   
> -       if (S_ISSOCK(buf.st_mode))
> +       h->is_socket = S_ISSOCK(buf.st_mode);
> +
> +       if (h->is_socket)
>                  h->fd = get_socket(connect_to);
>          else
>                  h->fd = get_dev(connect_to);
> 

Yes.


Juergen

