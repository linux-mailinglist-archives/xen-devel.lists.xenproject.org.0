Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0F62B8215
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 17:43:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30112.59869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfQYA-0003k6-ID; Wed, 18 Nov 2020 16:43:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30112.59869; Wed, 18 Nov 2020 16:43:18 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfQYA-0003jh-Eh; Wed, 18 Nov 2020 16:43:18 +0000
Received: by outflank-mailman (input) for mailman id 30112;
 Wed, 18 Nov 2020 16:43:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PiVl=EY=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1kfQY9-0003jb-Bv
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 16:43:17 +0000
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85c13aec-8045-46c3-97d1-f7985819122c;
 Wed, 18 Nov 2020 16:43:16 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id p12so2064096qtp.7
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2020 08:43:16 -0800 (PST)
Received: from doug-macbook.local ([2600:1700:7b90:52f0:fcda:1820:8a59:569b])
 by smtp.gmail.com with ESMTPSA id
 g123sm10208612qkd.135.2020.11.18.08.43.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 08:43:15 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PiVl=EY=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
	id 1kfQY9-0003jb-Bv
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 16:43:17 +0000
X-Inumbo-ID: 85c13aec-8045-46c3-97d1-f7985819122c
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 85c13aec-8045-46c3-97d1-f7985819122c;
	Wed, 18 Nov 2020 16:43:16 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id p12so2064096qtp.7
        for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2020 08:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cardoe.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=n0+UbWi80WPkeLpVmxvdvkL0jkpg6ZmFMVGBtN4prO0=;
        b=AQ4Ma1lo6rI3rfSb3cwI6cbxSxgYKslN2jaonu99oSswID5UzwoDNwCidpfy/7roQW
         mC+Z0Cf0JTZ7xqVeltvyfAxZkdPOhoOv7GSwQLMIbO1yjA7Lt0padowjpUS/SxvFprLm
         wOLzK50io9TXP9xTb7ixCOze+MwPbuPX8NYDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n0+UbWi80WPkeLpVmxvdvkL0jkpg6ZmFMVGBtN4prO0=;
        b=WCbxATpLDBT3j3qBaBw+AEfjY6Wps0sipv7iuI8R1AvuBEiFIQQFSrVz/NrDmxJY7Y
         iXr88zd495j2c3BoXmesFqeQR+t64tkcnR1XXU8TqWICOqdo1aVWLTLZeSJWeuFAI6sd
         7MXAcOmPYQlex9k3ax2fsROTJTxcy7kCCtHOim/5l7ktOFVWjC8pD1dJos/W9MTAOvcm
         /CmSwuDAquYrA21jQfI+J8q/k9OEM8fdpun27ZFTlAODbiN/iuHq3aM8l9H4QWgRkrPX
         TRl9MwL1s52V9NuXRo+YTAQSu9vDcPO2QKie8WvVQ9CGRYacNq+R1rNqkxEzWlz5A/95
         bBGQ==
X-Gm-Message-State: AOAM533ElGTpGgnmMaWzviRQb0xpp+CwiDoRK8KltvqE5LD39e6OBjL2
	mYX4DOVQhCH58NPOxtFQCHHzNQ==
X-Google-Smtp-Source: ABdhPJybt0mTTaVo54toN+R3e7L6+VyvqC8d8Oo3cv4CYf5TjymegGOck1LcoSVHnKL3rmvsQ1U0VQ==
X-Received: by 2002:ac8:6c2a:: with SMTP id k10mr5269048qtu.89.1605717796502;
        Wed, 18 Nov 2020 08:43:16 -0800 (PST)
Received: from doug-macbook.local ([2600:1700:7b90:52f0:fcda:1820:8a59:569b])
        by smtp.gmail.com with ESMTPSA id g123sm10208612qkd.135.2020.11.18.08.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2020 08:43:15 -0800 (PST)
Subject: Re: [PATCH] ci: drop building on CentOS 6
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20201118162706.66551-1-cardoe@cardoe.com>
 <9d24beae-1bcf-5a05-5c1e-a0cd45dfedd7@citrix.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <8ed3788f-41af-8330-341b-7829e580d9af@cardoe.com>
Date: Wed, 18 Nov 2020 10:43:14 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <9d24beae-1bcf-5a05-5c1e-a0cd45dfedd7@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 11/18/20 10:39 AM, Andrew Cooper wrote:
> On 18/11/2020 16:27, Doug Goldstein wrote:
>> CentOS 6 is no longer supported by upstream so we cannot test against it
>> for future Xen releases.
>>
>> Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
>> ---
>> CC: Andrew Cooper <andrew.cooper3@citrix.com>
>> CC: George Dunlap <george.dunlap@citrix.com>
>> CC: Ian Jackson <iwj@xenproject.org>
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Julien Grall <julien@xen.org>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Wei Liu <wl@xen.org>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Do we want to drop the dockerfiles as well?  We probably also want to
> drop one line from containerise as well.
> 
> I can fix on commit if you're happy with this.
> 
> ~Andrew
> 

Yes. That would make sense and should have included that. Thank you.

