Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0896A344E7C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 19:25:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100417.191315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOPEr-0007KT-BQ; Mon, 22 Mar 2021 18:25:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100417.191315; Mon, 22 Mar 2021 18:25:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOPEr-0007K4-7q; Mon, 22 Mar 2021 18:25:17 +0000
Received: by outflank-mailman (input) for mailman id 100417;
 Mon, 22 Mar 2021 18:25:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lCKj=IU=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1lOPEp-0007Jz-Ua
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 18:25:16 +0000
Received: from mail-pf1-x429.google.com (unknown [2607:f8b0:4864:20::429])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2bdf8ecd-19d7-4c7c-9026-80119fa032f1;
 Mon, 22 Mar 2021 18:25:15 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id h3so11551633pfr.12
 for <xen-devel@lists.xenproject.org>; Mon, 22 Mar 2021 11:25:15 -0700 (PDT)
Received: from ?IPv6:2601:1c2:4f80:d230::5? ([2601:1c2:4f80:d230::5])
 by smtp.gmail.com with ESMTPSA id w26sm14498001pfj.58.2021.03.22.11.25.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 11:25:13 -0700 (PDT)
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
X-Inumbo-ID: 2bdf8ecd-19d7-4c7c-9026-80119fa032f1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IxoEKJOUOQFmvYGa36soNK+UytaHxHgyUxN5OgIsxow=;
        b=SGCkAK1nqgwb7kITZZ6i/gT5sc1vrPzk0//+H+ltfa//+5vfPjROMhQ3q7Yi/HcLuN
         GFS3HT8Yc/BEt14fbnqZAPq50oh8840X9W9Gn00ijU4GjxShkx4cjTn1XRybjrNQ4oOg
         XaIEfwYlHbNMEyzlCejJT/UWy5tRpWbmvPbJHd7yVSYoNz8w1zt2caPrD8f7DcQGzc/m
         tvxy6rVKtRNSS6v5vZyo6pfbw568cI2XUqynrOlIZyNExpI/xCkbL7N+ornb/wzzneiy
         OggTUkEjUt8sqyvkqVtsJMMSRQ8C84XSJiFGfMVVkbX29n3cMZlkUMeMpsPFgPBHyXix
         7zow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=IxoEKJOUOQFmvYGa36soNK+UytaHxHgyUxN5OgIsxow=;
        b=tK/2HpWZPGfphGIgJCN9XyH23DwYgS4TdM/P8PYPjpcWOt/seJhbMesXTnpsleVhJC
         bCnf+8cdqSti7mwsiO7DkC5VjGiyGq5UZX/319al1F15if/vuZCBSYX2rn+TaHMxuGJb
         afAyX7YjNCo/4yL3aLhRMTAY4kSOPWN3m0oOGf+OTx2jUOMPnMphvtShYUeeTu8oqD1E
         cDd/wCJ8ff8TrqiDuywuefBrHwaV4uHaBrIkrNUpSlj88ClQE1VxY/qAUyGvRv9XYbAJ
         yj/F6Gxc5GD97OGlLvNTDVwMRx4In02ANyQ3+wsordjV6fVW9Wd4l/FDhl7mSRvALXfT
         VngQ==
X-Gm-Message-State: AOAM5330JzOSaJN5Dh3Stju89CWDiitfwdEqONC5z9AmdPOYH/fE+5wV
	b6j1AmpN6qAa8dn8/NJjVDY=
X-Google-Smtp-Source: ABdhPJw4VeESk0vVXFZAdTBiDu08om918RRIrwSoRcqramhmtMpz67Fn5+NeaneUm1F9Zk0ljkfvoQ==
X-Received: by 2002:a62:5247:0:b029:215:719d:1aed with SMTP id g68-20020a6252470000b0290215719d1aedmr791280pfb.52.1616437514134;
        Mon, 22 Mar 2021 11:25:14 -0700 (PDT)
Subject: Re: Working Group for Secure Boot
From: Bob Eshleman <bobbyeshleman@gmail.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Olivier Lambert <olivier.lambert@vates.fr>, Trammell Hudson
 <hudson@trmm.net>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Roman Shaposhnik <roman@zededa.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 =?UTF-8?Q?Piotr_Kr=c3=b3l?= <piotr.krol@3mdeb.com>
References: <9280f0d0-e994-71c1-9482-63f97296acb7@gmail.com>
 <1039be05-cbf2-95aa-5eba-246fb06be8e5@gmail.com>
 <e1d7b456-e710-d699-8fcf-234de10e9b36@gmail.com>
Organization: Vates SAS
Message-ID: <d15dc646-977a-fcfa-049a-c5a35a899957@gmail.com>
Date: Mon, 22 Mar 2021 11:25:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <e1d7b456-e710-d699-8fcf-234de10e9b36@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hey all,

It looks like the following date works best:

Mon. March 29th, 16:00 UTC

The meeting place URL:

https://meet.vates.fr/xen-lockdown

Feel free to let us know if the time presents a conflict.

-- 
Bobby Eshleman
SE at Vates SAS

