Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF1D46E8CE
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 14:08:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243016.420278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvJ9j-0001mj-Sw; Thu, 09 Dec 2021 13:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243016.420278; Thu, 09 Dec 2021 13:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvJ9j-0001jl-Nw; Thu, 09 Dec 2021 13:08:15 +0000
Received: by outflank-mailman (input) for mailman id 243016;
 Thu, 09 Dec 2021 13:08:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xsbi=Q2=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1mvJ9h-0001jb-VE
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 13:08:13 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10868c8f-58f1-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 14:08:13 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id i12so4136499wmq.4
 for <xen-devel@lists.xenproject.org>; Thu, 09 Dec 2021 05:08:13 -0800 (PST)
Received: from [192.168.1.186] (host31-48-92-117.range31-48.btcentralplus.com.
 [31.48.92.117])
 by smtp.gmail.com with ESMTPSA id d15sm7760566wri.50.2021.12.09.05.08.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 05:08:12 -0800 (PST)
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
X-Inumbo-ID: 10868c8f-58f1-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EDv5LdRBTHuyI6mwmppUY3/oYgq6Hd4tfClt02EQ6Ts=;
        b=YamEmiJhi5xLaOpJyir9xTnQYBKmqibUGk24dA1vBR6sDdD/PrQW1YdK9QVfCWr394
         RQ9jJPTdogw/ekf0Ot7D8sA2YyKTkjm6qfyjkKSmEkC9b6SUJQc6NGQMG+M15OjrgXU6
         z1ai69sSn0p7jXtM91hwrgp6uf8KcrwnhOPaYmDxRen0TH90SL5EGo1R8yqH3+D7jXPR
         OyUMZgMCGNZsw0HseLsQsB2Ob4UES1Yefg8zaBiUPC3MBm020cBKr1HI1QgsBkb/xTX/
         Vwu26IMtX2feBfHALSVHbZ9lvD/5HV3y9n2rtn/Qae9SjDYCi8bc9802i1W6tc/tcjVs
         skOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EDv5LdRBTHuyI6mwmppUY3/oYgq6Hd4tfClt02EQ6Ts=;
        b=By8bHUkts1ymgs0yFY0VebZh5cBQys1AfSoN38ZUFHRY4laqJIoDwrejf/EDtczaB4
         0HZPQOQeMP8xATDyNcex93BDsuJTC6xFgDRTUKgU0fzFfJMMzYfZ6uhvvJkIb040ShvI
         BC2Ag8EXQ7e5EgWMsufk6XN92YC2VrsB82b/kTpiJ6nKdotct8uSLSB29WZmd4UoSyh7
         Dy9fN6FodtFF5r498hTvCuBiyWKlrAX5sdJ0Zg0+k81TVxex9LT2WoNiYA1rO9MJXpLX
         JXmKKVrpJx/3W+jy/aqWGPGdZWZPwzNjIBcJeJkXpRcDWvL1aIyGZvwE0P45aUREePzl
         gqyQ==
X-Gm-Message-State: AOAM532dFFZl1USugi+6fmMzmTYCBMIZhls3L6stiIUKHlhbPfQqTpxI
	exqDDv1yQeQvYel6njRDhxc=
X-Google-Smtp-Source: ABdhPJzQpmZ+bp5NSFvZNylbTZHqcc2HAJwv7oNhNj0JWXjhsYKdzmpwdeR9f/9SqB9nTyE7YwZNbg==
X-Received: by 2002:a05:600c:3506:: with SMTP id h6mr7026917wmq.122.1639055292612;
        Thu, 09 Dec 2021 05:08:12 -0800 (PST)
Message-ID: <fff78341-1e35-f245-e1ce-47f0fec9b86b@gmail.com>
Date: Thu, 9 Dec 2021 05:08:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Reply-To: paul@xen.org
Subject: Re: attaching device to PV guest broken by your rework of libxl's PCI
 handling?
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d82be159-c4a4-73a7-9fb5-2128b6925e3d@suse.com>
 <CAKf6xpuDwV5nv9c3CX+Lo4e+dM=Uo=iv1nmeNtQNObfgD_wChg@mail.gmail.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <CAKf6xpuDwV5nv9c3CX+Lo4e+dM=Uo=iv1nmeNtQNObfgD_wChg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/12/2021 04:58, Jason Andryuk wrote:
> 
> My attempt at a fix was this:
> https://lore.kernel.org/xen-devel/20210812005700.3159-1-jandryuk@gmail.com/
> 
> It was in terms of PCI & stubdom startup , but that is the same as PV
> hotplug.  There were questions about further re-work which went
> unanswered, but my patch at least restores the old working state.
> 

I guess the question is do we need to wait for 'connected' in any case 
other than initial creation?

   Paul

> Regards,
> Jason
> 


