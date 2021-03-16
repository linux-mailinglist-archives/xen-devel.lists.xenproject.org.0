Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E0633DF9F
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 21:55:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98469.186810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMGhM-0003qA-KG; Tue, 16 Mar 2021 20:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98469.186810; Tue, 16 Mar 2021 20:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMGhM-0003pl-H7; Tue, 16 Mar 2021 20:53:52 +0000
Received: by outflank-mailman (input) for mailman id 98469;
 Tue, 16 Mar 2021 20:53:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BLMP=IO=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1lMGhL-0003pg-2i
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 20:53:51 +0000
Received: from mail-pg1-x52d.google.com (unknown [2607:f8b0:4864:20::52d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e39a9ea-3556-46d5-8192-0b3414a6509f;
 Tue, 16 Mar 2021 20:53:50 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id w34so22370464pga.8
 for <xen-devel@lists.xenproject.org>; Tue, 16 Mar 2021 13:53:50 -0700 (PDT)
Received: from ?IPv6:2601:1c2:4f80:d230::5? ([2601:1c2:4f80:d230::5])
 by smtp.gmail.com with ESMTPSA id y19sm18798333pfo.0.2021.03.16.13.53.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 13:53:48 -0700 (PDT)
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
X-Inumbo-ID: 6e39a9ea-3556-46d5-8192-0b3414a6509f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vxGHpLyrbonFYrwtGokt0tk7MeUMi7n2NCzzUY3q9ZA=;
        b=Hj4RcyurvjzOSz9dvEP3ZC1sHILcsUVF0y6WQgGfrOc1VK8j+IfjHKUV5ENzIBtNWx
         8Ih1XfbmRkjR4mVegbbg/xBCByp+A4PFF4ebnG3MH+Kp7UZaL2q6pi6elMAoiU6ea7dE
         bRuyqfB9uyp2IJsdsxAzOejPe/a6JMMtEbBztOr7O3xcNdS9BCnJCt2BP9I43rYjU8AJ
         hY5ZJjFvBYgTTsn8JJprz3apafLp9FbKVt3wZnBVyp+ynj9CbO4vXZsveUTRd9bC6fgu
         fQ9/Je3KbXSPOgBZppnVQYkzDHeMBALiChM2lFO+RSGYPwimbtBZEpE91rHSKJjPpRLr
         9fmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=vxGHpLyrbonFYrwtGokt0tk7MeUMi7n2NCzzUY3q9ZA=;
        b=C2TFKl/AFSAmeXgI1EO1bfYhQPluiSElA056KOTEwHMdU1wD5msIFS7PssmSmzzo6O
         GtQP1xHTQcDdvFwa1U6S+dWs/2v3nEdY6ZnlNr99/hO45vKQ8c6cM3ZFiAKis7+8geXz
         5vZWamCwGP6E3St76nuH04I0PsSwQ9kG+FMZ4zpD9nWz4KdiPhptMGMFBSUao4K80avw
         /25omXuQ3moh7XHp/780htabWFF6uDUBp2dMiGd+xr43SJmeqd398uC3/NEPhf9Nwijb
         2dYdv/5T3JIYZ8bXtxIEh6dJGTLoUZHDdqJ5+OB7NrQGlVFceME/m9b8renGqOKCRfFl
         DDnw==
X-Gm-Message-State: AOAM533SZPlhybvg1JhHmo83aS1Kpw6gxZ+g1+AZDYtzz5ezskNp48Ee
	KYSVgveOJ/m6pprOloyBGWw=
X-Google-Smtp-Source: ABdhPJyVf9iitM7749tPEdmtMpONXdZmDrk2c5JQKsc7c2mIJtNgz7YO/e9q8idQv6fFelmA4Mpyig==
X-Received: by 2002:a63:4654:: with SMTP id v20mr1326032pgk.129.1615928029360;
        Tue, 16 Mar 2021 13:53:49 -0700 (PDT)
Subject: Re: Working Group for Secure Boot
To: Roman Shaposhnik <roman@zededa.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, =?UTF-8?Q?Piotr_Kr=c3=b3l?=
 <piotr.krol@3mdeb.com>, Olivier Lambert <olivier.lambert@vates.fr>,
 Trammell Hudson <hudson@trmm.net>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <9280f0d0-e994-71c1-9482-63f97296acb7@gmail.com>
 <1039be05-cbf2-95aa-5eba-246fb06be8e5@gmail.com>
 <e1d7b456-e710-d699-8fcf-234de10e9b36@gmail.com>
 <CAMmSBy9DFuSE_74=rKkKOsxscgg-oF1Dc8bPQF=PbZUAHLnH3A@mail.gmail.com>
From: Bob Eshleman <bobbyeshleman@gmail.com>
Organization: Vates SAS
Message-ID: <ec8bc062-5d91-5914-faeb-b17af2e2d006@gmail.com>
Date: Tue, 16 Mar 2021 13:53:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAMmSBy9DFuSE_74=rKkKOsxscgg-oF1Dc8bPQF=PbZUAHLnH3A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/16/21 1:07 PM, Roman Shaposhnik wrote:
> WFIW: all 3 time slots work for me.
> 
> Looking forward to this!
> 
> Thanks,
> Roman.
> 
Thanks Roman, same here!

-- 
Bobby Eshleman
SE at Vates SAS

