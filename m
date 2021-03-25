Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B04349810
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 18:31:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101503.194240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPTon-0004ga-0w; Thu, 25 Mar 2021 17:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101503.194240; Thu, 25 Mar 2021 17:30:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPTom-0004gB-U8; Thu, 25 Mar 2021 17:30:48 +0000
Received: by outflank-mailman (input) for mailman id 101503;
 Thu, 25 Mar 2021 17:30:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vwwn=IX=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1lPTol-0004g6-K3
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 17:30:47 +0000
Received: from mail-pf1-x430.google.com (unknown [2607:f8b0:4864:20::430])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20ca499a-88b6-40c6-b83a-1780b5a386f3;
 Thu, 25 Mar 2021 17:30:46 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id c17so2773553pfn.6
 for <xen-devel@lists.xenproject.org>; Thu, 25 Mar 2021 10:30:46 -0700 (PDT)
Received: from ?IPv6:2601:1c2:4f80:d230::5? ([2601:1c2:4f80:d230::5])
 by smtp.gmail.com with ESMTPSA id i1sm6170632pfo.160.2021.03.25.10.30.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 10:30:44 -0700 (PDT)
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
X-Inumbo-ID: 20ca499a-88b6-40c6-b83a-1780b5a386f3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=JppXalVXiges66IliMlooSi5DLsqExUwrrbjlmg8Smk=;
        b=Ykf9PZU8qCOoeNQdUs8g+RFXb2CsI33DvImF1jxBdBTBA321eZIWK5KFtyZfTPNk0o
         oIeHgNIYshmaAR/zMFoWAD/7eKcuMce1u0hSm/1VcLcxtU7DejmvE8ZS1dqNXyufR+cS
         Z/KH9mtrnN76kBBE2Jj+fWOndH0p/rFoOYp/NsqXRWnaZWkK7peXskHpTrL+FpHVafuf
         1BociYY5mrZ+eShau1xLmKQI+MmwZ3Be8LEFEHxwh9eX7nHv166tIml+aHuyv1bbQW9E
         aXqRF8iCzCBY6tjP16mXXWiZyP1PViP1oSnzDBjm810G/KtpKL0AbldhUuENYEhSaEyI
         Vo+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=JppXalVXiges66IliMlooSi5DLsqExUwrrbjlmg8Smk=;
        b=s7Ie/T2eVFWRlkkLEP2W1QKsmRS3M/J/mc720nmrw7egmrfsvgWEgHHbit0bSRHxpO
         DtL9yasLtTdbdMmexCuV5APSG5/wPftvZVrfnqbd6HDiZQFEXK/3XQpEHFpwOGzAPEFe
         vGYOSPpK2ETWIDCZuy69/67dQ2vJTaLcGJQhbedwfcfCA3g/2bkPsZBX/LrM3hSwkeYn
         jM+K0GiL0YlE7XFZDFZrSNanG1FjmyebbrOPKRkXHTHLkn+gmpjBNd2JfEtjxIJBsfzC
         uioUomAAHZAig7Luyb6m5aoaFvoBrVKVCgH34KFUr32Y3cbboD+ZrCTfWyRsr06R35cW
         ljSw==
X-Gm-Message-State: AOAM531iOUJv8tmmXxo5PfPfCjSkwjGkXUOW4e/EtKbc9IIsfNtaEuNY
	4gaIwct9T7FQh78GFvaJXHU=
X-Google-Smtp-Source: ABdhPJyL1DW0B18xPAwCDsarEqNjvMgRGgC7u6Po+CpTsJxiL55MNi1KNAkyrDYRXuJo1A4zlCf3/Q==
X-Received: by 2002:a62:78d4:0:b029:1f1:595b:dfdf with SMTP id t203-20020a6278d40000b02901f1595bdfdfmr9224826pfc.81.1616693446081;
        Thu, 25 Mar 2021 10:30:46 -0700 (PDT)
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Olivier Lambert <olivier.lambert@vates.fr>, Trammell Hudson
 <hudson@trmm.net>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Roman Shaposhnik <roman@zededa.com>,
 Christopher Clark <christopher.w.clark@gmail.com>
From: Bob Eshleman <bobbyeshleman@gmail.com>
Subject: Secure Boot / Lockdown WG Meeting
Organization: Vates SAS
Message-ID: <82cc3e8d-0deb-d3e5-b901-3c2f39abf9bf@gmail.com>
Date: Thu, 25 Mar 2021 10:30:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hey all,

I just wanted to send this out as a new email thread in case
anyone missed the reply on the previous thread.

It looks like the following date works best:

Mon. March 29th, 16:00 UTC
https://meet.vates.fr/xen-lockdown

Feel free to let us know if the time presents a conflict.

-- 
Bobby Eshleman
SE at Vates SAS

