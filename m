Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CC03087F0
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 11:51:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77980.141645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RNQ-0001k1-Ap; Fri, 29 Jan 2021 10:51:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77980.141645; Fri, 29 Jan 2021 10:51:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RNQ-0001ja-7g; Fri, 29 Jan 2021 10:51:44 +0000
Received: by outflank-mailman (input) for mailman id 77980;
 Fri, 29 Jan 2021 10:51:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AjHm=HA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5RNP-0001iW-AL
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 10:51:43 +0000
Received: from mail-lf1-x12b.google.com (unknown [2a00:1450:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9064fdc9-da66-45d3-8edb-27caf1a0b9f7;
 Fri, 29 Jan 2021 10:51:39 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id u25so11859161lfc.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jan 2021 02:51:39 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id o14sm2461733ljp.48.2021.01.29.02.51.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 02:51:38 -0800 (PST)
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
X-Inumbo-ID: 9064fdc9-da66-45d3-8edb-27caf1a0b9f7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=pZyE1wGOPQk3xLfPf/fgqy0xhrzhtmWqkNYJ3eDhOi0=;
        b=cdIF47CFpNf3mL9QruLKepTSLi93Ad66pELEpc3WEuC8pAhJH9hf/RIDRKmNJCKjRN
         V481wTLqmchLPOV6eh7WwFvo/QbpmPdxG4l/b98IkzeINp15QdHmqaiq6ZK/gBpOHh2y
         Fpkf1b+Xb5Auyj+yiLknV9P5wiyyP4xo9XTBJf3geJhZ+Oew8Jle0ctozeaJi5/zBHZ6
         WW4poELIMTtkADX6BEtRraeK06dLQ5CyvRifkgC15txs3YNmNyMV1aPRH/sVyffN3NRg
         /uxh3rNJHpTPB4nL8Opm6pNXhxU6qY/lM1O5ou44m1Osflb14qViOabc0ld9y6yhaZNX
         BmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=pZyE1wGOPQk3xLfPf/fgqy0xhrzhtmWqkNYJ3eDhOi0=;
        b=CCVRXcfqC1CIM1ezmEGI4SWWJzsPg/8bc23Xh3D+QiyUMoncCZoOUDRizXKL1Or18I
         NrIU5W1K3LRxmbiu+MpwY+eGrkA8Xg9co723Wqyyw43+Q+eOPF3hRLtLiwNNFbUDsD05
         8iPnm1L20suoo8akgumq0/L4F/wwTOK4F3+AscOBMrAf5+VqDIQr9i/TAeEUU/AGEPse
         9EB7USmOIdde/ndcgPK9+ESwj+qbEY4VSW9FenFBcBJFBghllJSdeVoWvt5p+ymaFzSh
         Tu8DlGQnSZUcu74evGZwhjX4QNzNStm/7ZsNxLE1sEJBhy7u1rtQqo2G+Eg16KRGwmnY
         mtwQ==
X-Gm-Message-State: AOAM532QTgl6nbVggOjcK2XoR+8AhrHLULDmIeVxW73F/acjPGUI07WX
	LdQyXgH2uU5k/TZckCmmCKI=
X-Google-Smtp-Source: ABdhPJz6xesRE23oPYsUh5tT5zpO+uF0V4yIy5ijnr68ljvBlzs4RKYg8zr1HLnpPD4FVPpcIXgaPg==
X-Received: by 2002:a19:5e1d:: with SMTP id s29mr1971326lfb.440.1611917498649;
        Fri, 29 Jan 2021 02:51:38 -0800 (PST)
Subject: Re: [PATCH V6 00/24] IOREQ feature (+ virtio-mmio) on Arm
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Chen <Wei.Chen@arm.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <Julien.Grall@arm.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Kaly Xin <Kaly.Xin@arm.com>,
 Artem Mygaiev <joculator@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
 <DB7PR08MB3753D1F61623C538FCEF77059EB99@DB7PR08MB3753.eurprd08.prod.outlook.com>
 <9b21efce-42c9-1bdd-e97b-342dd6130620@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <e096c7ad-f206-2773-c4f4-ed3071251cbc@gmail.com>
Date: Fri, 29 Jan 2021 12:51:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9b21efce-42c9-1bdd-e97b-342dd6130620@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 29.01.21 10:49, Jan Beulich wrote:

Hi Jan

> On 29.01.2021 09:13, Wei Chen wrote:
>> I just tested the v6 and the latest backend service with the latest staging branch.
>> They work well.
>>
>> Tested-by: Wei Chen <Wei.Chen@arm.com>
> An faod this was again Arm-only testing?
Yes, unfortunately I don't have a possibility to test on x86, if I had I 
would definitely perform testing.
I performed code analysis (the diff between V5 and V6 is small enough 
and these changes unlikely will add regression, so I was thinking that 
if basic x86 test passed on V5 (thanks to Julien) than it would likely 
pass on V6 as well),
but please don't get me wrong, I *completely* agree that even an obvious 
single patch must be tested.


-- 
Regards,

Oleksandr Tyshchenko


