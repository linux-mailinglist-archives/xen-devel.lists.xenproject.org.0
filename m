Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E37B179AE
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 01:24:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066579.1431759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhcd0-0001wz-9Z; Thu, 31 Jul 2025 23:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066579.1431759; Thu, 31 Jul 2025 23:24:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhcd0-0001u8-64; Thu, 31 Jul 2025 23:24:02 +0000
Received: by outflank-mailman (input) for mailman id 1066579;
 Thu, 31 Jul 2025 23:24:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8WGx=2M=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uhccy-0001t8-Sv
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 23:24:00 +0000
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [2a00:1450:4864:20::443])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6da84e61-6e65-11f0-b895-0df219b8e170;
 Fri, 01 Aug 2025 01:23:56 +0200 (CEST)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-3b78a034f17so183051f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 16:23:56 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3abf33sm3809078f8f.7.2025.07.31.16.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 16:23:54 -0700 (PDT)
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
X-Inumbo-ID: 6da84e61-6e65-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754004235; x=1754609035; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xLgPStNzTXXuRMG53wsjkLEgXKGoQ4rI4EuoXsMzNo4=;
        b=qVissG8Bo6A19qw3EwTxrTe5zh8eMeMWr3cKlF8WP/kYEdlz/gBNlm/j3eKt/EaycE
         YKNfbx91kBMTCHCIvENFH3qGTEXmKs/85bNipCkoF9Ys/bdbhcQIYvPoobh3Orac1JaE
         0cbhuMjFw7Dk7vZK+MERXVyXcc2IyBzHJCEeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754004235; x=1754609035;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLgPStNzTXXuRMG53wsjkLEgXKGoQ4rI4EuoXsMzNo4=;
        b=obUyh/Nu0ydKgxLZTXOSfkh3zd8zIGvWctAlClL+Ycg7HWOvQcSIFMgNnS8oIjGlQq
         8nmz1Y9ZPhwXWrGcwBQ5ZhZGrytb0zKeVVvG/y69lm5kBcLHomATeodKCCqJdxC77ild
         QaSE/kBCZiEpHyv4sRuDVze1vb6zEdQkhocH2a9KW/kVG226iv/dv5BtiOTdKF55Idwg
         VeeBOy0e/kcJV6MNgVRHW6248XlbUzKO3i6o4TBAFzJeaMF8rAcwA1Gg5oTDDwGvqqr8
         C0DOK1kNnh68vCo1T3PAdDl7W3Vn3hyXiLYUecorcfSyGufS4aCjFb9FQk6JgwHlEBMH
         +BDA==
X-Forwarded-Encrypted: i=1; AJvYcCU0OasVR+rwibnOP1SejiBZN9ZqTzcZoVRXqzxuvR0WAD3Qgfz29yo14VDCBfnlTJGw7fD57/LvEGs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxutqKU48jkWycx2Ut5HQFeB3105foH11/V3V28+op3NhMaWyGc
	/CsEO163BJymowK8PRrnVBUVIbAbVfzOgzR9ydzWGeC8VSFFof5ER8L2xdUTwdgNBN0=
X-Gm-Gg: ASbGncvnl6IGMrwHQK3QlRUnQWXrKZwdlWIYlvWrc3ae/zvuu2rCdm/6YXue6nuG7+B
	xDR8qJWLMBemDS5H0sGDI3JtGWzTcoVR07qgOpwwNIzL6nmM1CWA6TWOV+jNiJ+nq2cSFL3dHdk
	KGe09V2cvKc6Q+NEj6/UuZti+WSVNwVu/93wWpV+MANHklNaleB1Sp3CD7LqGI/rtHFX8AP50hf
	bseXYvL7dcEJ7GdVIn185WYUclvkWfgMSoajSplvGKNetFD9iqi43z6Nbe2vDgLE9z7j8iDrapT
	7nwvDBfscxq0/S64/Hg5ZJUGg7MqrqKEOL/shQlcoZVJmUUpoLuFyM82ququM8E18ncoyUEilOo
	kBlUwoTF3Zi8UbK4AS5Ww5IgDrUwTdAHs7CHM4P/KzSn6mDFUNRjHmpHa5jewHUQClA9X
X-Google-Smtp-Source: AGHT+IHfTlD5ZQwAWsd4QEFeymXlWNN4LHym9+xX7zGbW5D1PP0931PK85koJA0vWN0mqwe37f9E6Q==
X-Received: by 2002:a05:6000:1a88:b0:3b7:8832:fdcc with SMTP id ffacd0b85a97d-3b7950093b6mr7863729f8f.38.1754004235369;
        Thu, 31 Jul 2025 16:23:55 -0700 (PDT)
Message-ID: <ecb7767b-bf51-4914-8efa-43be9412338f@citrix.com>
Date: Fri, 1 Aug 2025 00:23:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4] xen/arinc653: fix delay in the start of major
 frame
To: "Choi, Anderson" <Anderson.Choi@boeing.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>,
 "Whitehead (US), Joshua C" <joshua.c.whitehead@boeing.com>,
 Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 "xen-devel@dornerworks.com" <xen-devel@dornerworks.com>
References: <88a17c994f85270982e03912c9c9db916ca69d4e.1753395268.git.anderson.choi@boeing.com>
 <69b04328-59a1-4186-837e-19d608054aa7@amd.com>
 <c6ef1aa7fbb4a9e92896f4454682ba0d7bf9cfb3.camel@suse.com>
 <BN0P110MB2148F944A565E5031260501E9027A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <BN0P110MB2148F944A565E5031260501E9027A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/07/2025 11:52 pm, Choi, Anderson wrote:
> Dario,
>
>> On Thu, 2025-07-24 at 21:28 -0400, Stewart Hildebrand wrote:
>>> On 7/24/25 18:33, Anderson Choi wrote:
>>>> Fixes: 22787f2e107c ("ARINC 653 scheduler")
>>>> Suggested-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>> Suggested-by: Nathan Studer <nathan.studer@dornerworks.com>
>>>> Signed-off-by: Anderson Choi <anderson.choi@boeing.com>
>>> Reviewed-by: Stewart Hildebrand <stewart@stew.dk>
>>>
>> Ok, cool, there were versions of these series that my filters did 
>> miss, and that's why I replied to v1. :-/
>>
>> Well, scratch that email, and sorry for the noise.
>>
>> Regards,
> I appreciate your feedback.
>
> Could I get your ACK for v4 patch as well as for v1?

It was committed on Monday

https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=f2927d8343aef714339fa455074bf56d2b878b3e

and backported to 4.20 and 4.19 already.

~Andrew

