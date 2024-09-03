Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EBF969F4A
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 15:43:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789227.1198780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slTo0-0005n7-9R; Tue, 03 Sep 2024 13:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789227.1198780; Tue, 03 Sep 2024 13:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slTo0-0005jw-6Q; Tue, 03 Sep 2024 13:42:48 +0000
Received: by outflank-mailman (input) for mailman id 789227;
 Tue, 03 Sep 2024 13:42:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7TnF=QB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slTny-0005jq-QE
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 13:42:46 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 668a32a1-69fa-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 15:42:45 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a8682bb5e79so656064166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 06:42:45 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a898900f25fsm681607866b.75.2024.09.03.06.42.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 06:42:44 -0700 (PDT)
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
X-Inumbo-ID: 668a32a1-69fa-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725370965; x=1725975765; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3+T8bYfo0Nwyx+mz0vUxJhoFsomkPBZVPIfDECFd97U=;
        b=QdVbGcYgEoTF5fEmP6KPoEc0pRbXaH2dUQOkooKX5vGbPFqrD9TFBOaB4rgtfHoFwW
         TFXJykUUrGE5StlZD48Nhm6wCnurrBNK333xKVwqQkAiHjmzCTVtFUScWxs6qbDY/8BN
         jH+GvzAxjYaL6oqNokjoq4a8gvOKZlCtRBRDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725370965; x=1725975765;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+T8bYfo0Nwyx+mz0vUxJhoFsomkPBZVPIfDECFd97U=;
        b=Kk7a/xVbMVR+AWDV8Gamv1Af+Bs8QyCovv9wpqMpXI1w/2aa7DCt46vpzJkm/NajDl
         nw/NpU8HHQFp80UdiyhSe7lQ6yJwi6TnwD07UOmcBN3IfpP837MX90UQL6ddlLYEDVVN
         D6NZqfishbzxunxUytf4/7UnGdp6IS6MKoc12R08B4PGTZOzW1O6r6rrTB+zvZyNL6H7
         Fgkx0DU1B5wFGof4aVT6G1DlVpI2BQLwJLm/5Fl17kVhC4waATGVaM+GQUMRMwqnCz2J
         EHFUmGAKMELRA3xUcO7gLjNl5EjwFJCQk1fWzln4jGeIM16WzuNvHqhdp48BoQB0tCCg
         HYJw==
X-Forwarded-Encrypted: i=1; AJvYcCWeK+QSKi7fQGi68L02v9ymYdNdSfXyRUimmcT0SdlfFmCcAiQis2NCm8oAIKA1c8IvQ0/d6Wn5PEY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKkQrkOgSYntCAC3Y1+d84pmZOsdOO6G4eVx2gDM+JFOZ+VLvg
	IW9yvaE6cpsYf5bstxonxSbvQ0MgbWUKDddu6GPkfT1XnIgNO39lwWPdUXFAKO8=
X-Google-Smtp-Source: AGHT+IGTSqjq7dkPpjbL9E4BAVlC/Rz/+3UAioCQB544cbz7aK+62s1h4/cSuRk+auMnmM3+UP4aKA==
X-Received: by 2002:a17:907:a4e:b0:a77:eb34:3b4e with SMTP id a640c23a62f3a-a89fad7b7cemr530361466b.7.1725370964946;
        Tue, 03 Sep 2024 06:42:44 -0700 (PDT)
Message-ID: <64e9b214-280c-44f9-afdc-62f5a1ed3d4c@citrix.com>
Date: Tue, 3 Sep 2024 14:42:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Call for next release manager
To: oleksii.kurochko@gmail.com, Kelly Choi <kelly.choi@cloud.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <CAO-mL=y+AGD7Yw2WNK7GWKBEYvcHXTHFbRSSJLFREHMG_KGwZg@mail.gmail.com>
 <95f1d300de710c568f55669b160d72f6746d4456.camel@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <95f1d300de710c568f55669b160d72f6746d4456.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/09/2024 9:16 am, oleksii.kurochko@gmail.com wrote:
> Hello everyone,
>
> On Thu, 2024-08-29 at 12:05 +0100, Kelly Choi wrote:
>> Hi all,
>>
>> I'd like to thank Oleksii for his hard work as the release manager
>> for 4.19.
>>
>> As we prepare for our next release, we welcome any interest from the
>> community in becoming the next release manager.
>>
>> Feel free to reply directly with your interest, or you can raise this
>> in the community call. 
>
> I would be happy to continue as the release manager if no one minds.


It is common for people to have multiple goes; it should be easier the
second time around because it's not all new.

As the prior RM, you get first refusal on doing it again.

~Andrew

