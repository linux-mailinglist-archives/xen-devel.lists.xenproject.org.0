Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F21F4275FD5
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 20:29:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL9VE-0004ds-2t; Wed, 23 Sep 2020 18:28:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Zf1=DA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kL9VD-0004dn-DE
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 18:28:27 +0000
X-Inumbo-ID: 5e692063-d60a-4cc4-87e2-368677d3cedb
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e692063-d60a-4cc4-87e2-368677d3cedb;
 Wed, 23 Sep 2020 18:28:26 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id z19so987153lfr.4
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2020 11:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=s8P5t1IE9nOgQQ6oKAJ+xmG7T+tyqwN+bs3JCMjjaPA=;
 b=IY93T9m6oHXnv/eZ/qiPXj9/2ZtqgW8S1H+rXZho89aVklN+MPQ0Y6pAUh5CtcIO1D
 gYKuG+pVgWfznvSPUC7K2mVuCRFrlSvbrFBfGpndlZTvB8vzHWIQcedXowC1hpL3nFYN
 NIh2yT5Wjox1DV5n0ZthMCmgki053mPZ1z4tnUFBOP2xbYBVO1s40HmtNOoeKyV6qK0h
 LJ4nc+ZFTCs8gM8Cp5pavU+7mpNV9QkqM0crVhJVhzSTnwRVTJJjfunNu9wL0anZS8P8
 eQi4v18SovOHhei7B5tDJlu8ku2Hb2UcXalUpD7CB3zGQrOLj49v2rtzahlnSCRtR8Lk
 RF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=s8P5t1IE9nOgQQ6oKAJ+xmG7T+tyqwN+bs3JCMjjaPA=;
 b=Cc/pe481W7Qd2gUxdA0baqzhVfIFd4zNeuNLpg8NSpa77HahApijrAk5Ne31cRBt8Y
 LqOmCQdcq56Wk3krBqSxse3JY+O3PqvCFclsDt864mwp6G+0n952bQ4q6MHGP24wBeAp
 zSq8q5Y6A4uZNsKLcHSy056746BvV7IQDSslqLBbAlPLvTTM9ijJfeYklKj9GMEbTJ5+
 Q8/YootOfTtdMzZfckLvMVkqeIZQbAXWikj8VSu3+/Y13Ew4Tzqd+d+25cuWAfqziPeu
 AxG3w4Sb48mbpkQH2CQgRWXuga33xcYllozuglPDD1sexiNAA9I17p9b59MUMYBqk96q
 jfIg==
X-Gm-Message-State: AOAM532JYLZKgbafD2mJL8+AxJGFtwG9cbXj80OjOHlwcYYRa2O/2M3K
 XUAwu17IxtQpM94V131B3lI=
X-Google-Smtp-Source: ABdhPJyfJVSk7HfkE7Gzh8gld1YlU20d6woe7+ukdtOmySKTLkijtUdnfI3AFq1QyiYushDz470xkQ==
X-Received: by 2002:ac2:5f50:: with SMTP id 16mr386684lfz.420.1600885705533;
 Wed, 23 Sep 2020 11:28:25 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id t13sm5562875ljc.70.2020.09.23.11.28.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2020 11:28:25 -0700 (PDT)
Subject: Re: [PATCH V1 07/16] xen/dm: Make x86's DM feature common
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-8-git-send-email-olekstysh@gmail.com>
 <a34a3b3a-0ebd-d938-e35f-07c641462953@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <129970f3-4097-a77a-a730-9873f24906dd@gmail.com>
Date: Wed, 23 Sep 2020 21:28:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a34a3b3a-0ebd-d938-e35f-07c641462953@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 23.09.20 20:35, Julien Grall wrote:

Hi Julien

>
> On 10/09/2020 21:22, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> I believe I am the original author of this code. So this needs to be 
> fixed accordingly.

Sorry, will fix.


-- 
Regards,

Oleksandr Tyshchenko


