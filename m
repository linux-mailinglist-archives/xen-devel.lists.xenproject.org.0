Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1971380B15
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 16:07:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127377.239398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhYSv-0008O0-8T; Fri, 14 May 2021 14:06:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127377.239398; Fri, 14 May 2021 14:06:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhYSv-0008Ku-3g; Fri, 14 May 2021 14:06:57 +0000
Received: by outflank-mailman (input) for mailman id 127377;
 Fri, 14 May 2021 14:06:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSkR=KJ=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lhYSu-0008Kk-14
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 14:06:56 +0000
Received: from mail-il1-x136.google.com (unknown [2607:f8b0:4864:20::136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3614fd90-b3f6-4415-8d89-29236d4a0ad5;
 Fri, 14 May 2021 14:06:55 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id v13so25879222ilj.8
 for <xen-devel@lists.xenproject.org>; Fri, 14 May 2021 07:06:55 -0700 (PDT)
Received: from [192.168.99.80] (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id t7sm3068586ilq.34.2021.05.14.07.06.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 07:06:54 -0700 (PDT)
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
X-Inumbo-ID: 3614fd90-b3f6-4415-8d89-29236d4a0ad5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=R4gCuqdbZR815nXx2XVEAAsDO0qJ8mZy8Tzf13PeXRw=;
        b=IETsefp/ddaBv67PB9DwzcBjShhaX873XycpoRKkMCKFRHECqeDTtDzXPsmph0KL/0
         0EW7sCQ5V7cAmGYnLtPzplJ+8EhLBdwC2joA93USf76Bxa/HyWuVhzRtjCXUyx7wvWcj
         B2weCbs7gGz0br63woBP633R7m2JHQ2VUnq9+nrdA96L7KVmuT1U9iuzxI/1mfEc+ri+
         WgPxdLhDpQwuubRZ6I1SUEdnlbt394yfkm3EF3KwjEB9A0CW8JKyUIhVjlsQMZkQtWQb
         QBliIPfHpcgfUkeFkcO43fbqNllnV6uBY3BFGpj+DcDdaUlDpQMWV2PCTRqNruPwZRH1
         sFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=R4gCuqdbZR815nXx2XVEAAsDO0qJ8mZy8Tzf13PeXRw=;
        b=s/dc0KqXUo/0NppOQaRbzn1oK1vr7LHlYK3thJOTk7Bi0vRMHNjS7nqq0XdB35HqBn
         z8TWrQmDaRZJHvMf1XJiBkUxA1iPrBCMs2Ynxpe628wor48I+Xf80wdlturOyl5OLMDD
         2TiWsc1z4lBPXkV1qeuMWhnByAdBWypOobZqaOdRWI301eC/IwF/1Qr5+JsxAAIYWBxG
         i4iXqv79cLi+AxQaNCK1K5JH9+n5f4DEQ/df+Xq/JQkM1Q+UzxL/Bzi5hq28w0IDSH1W
         SgNttY5pHbJjYjWTkUAlYMAsuDX5afebhQQX4KWsAO4o/YKfwfwc29Yv4+8ldCABhDdd
         AFRw==
X-Gm-Message-State: AOAM5330E+H8Ecz4gLy11mr2rrj6guZHPO8u3WxNqeDU7fTCNMInMDCo
	QxvwcXBatNotvuTWT1pmW5E=
X-Google-Smtp-Source: ABdhPJylsAg5N0IK+T5+EJrrTV3WwEBwg+lAI3XbJ38wuYsMOY+RKBJs4s+/eBw/u02YpGo+A49tZA==
X-Received: by 2002:a05:6e02:f42:: with SMTP id y2mr29468885ilj.216.1621001215109;
        Fri, 14 May 2021 07:06:55 -0700 (PDT)
Subject: Re: [PATCH v2 0/4] Support xen-driven USB3 debug capability
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 xen-devel@lists.xenproject.org, Lee Jones <lee.jones@linaro.org>,
 Jann Horn <jannh@google.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Douglas Anderson <dianders@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>, Petr Mladek <pmladek@suse.com>,
 Sumit Garg <sumit.garg@linaro.org>
References: <cover.1620950220.git.connojdavis@gmail.com>
 <YJ4cqntf7YdZCOPk@kroah.com>
From: Connor Davis <connojdavis@gmail.com>
Message-ID: <e2d96a91-3f0f-d2b3-9a1a-16caaf82c24a@gmail.com>
Date: Fri, 14 May 2021 08:07:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YJ4cqntf7YdZCOPk@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/14/21 12:46 AM, Greg Kroah-Hartman wrote:
> On Thu, May 13, 2021 at 06:56:47PM -0600, Connor Davis wrote:
>> Hi all,
>>
>> This goal of this series is to allow the USB3 debug capability (DbC) to be
>> safely used by xen while linux runs as dom0.
> Patch 2/4 does not seem to be showing up anywhere, did it get lost?

Yep, just added you, sorry about that


Thanks,

Connor

> thanks,
>
> greg k-h

