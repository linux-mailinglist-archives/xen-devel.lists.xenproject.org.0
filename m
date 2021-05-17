Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F34E382DDD
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 15:48:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128264.240840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lidbn-0006kM-Em; Mon, 17 May 2021 13:48:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128264.240840; Mon, 17 May 2021 13:48:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lidbn-0006ha-BS; Mon, 17 May 2021 13:48:35 +0000
Received: by outflank-mailman (input) for mailman id 128264;
 Mon, 17 May 2021 13:48:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X6rY=KM=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lidbl-0006gG-WD
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 13:48:34 +0000
Received: from mail-ot1-x32e.google.com (unknown [2607:f8b0:4864:20::32e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4dee4ff9-b37a-4522-9bc7-e0050e95dbf0;
 Mon, 17 May 2021 13:48:33 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 q7-20020a9d57870000b02902a5c2bd8c17so5578637oth.5
 for <xen-devel@lists.xenproject.org>; Mon, 17 May 2021 06:48:33 -0700 (PDT)
Received: from [192.168.99.80] (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id f9sm3160208otq.27.2021.05.17.06.48.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 06:48:32 -0700 (PDT)
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
X-Inumbo-ID: 4dee4ff9-b37a-4522-9bc7-e0050e95dbf0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Y7G3TzUfMF26NrwSfO4KjIdPwYhYispCIDNJBE6rnKU=;
        b=IlUjmEUztnRpvBfIDXO7inyXDXdMskWLTvaqVIFQNg/sz7Sm85rGV+V/NycCnzCMqp
         pR41oIEn6xzSWBDCE66TpcjX6qvaIxxkpGkrsNqRDG6fpqnsu2OSG8vTPdzkJ4UQcAmF
         vCk4Og0AUaXC+Rx6Tycg1z1yITNJBeGIVh+EKO+wJpyfqne9xBYo6GBQVfvgLU03xVpB
         qHvIQ3dwr+nVtRMdn4xrH2UGRqgIu9jxk4ditSoGxHEyIiEN7hQeODI70v97xH6/mTw3
         0h3rOWsJ0JiedFQaXs1hiDZDR4l0+g8RR+/wHKjxHwaBPWEc0DGLcB9//Ng8jc9U+/9E
         a5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Y7G3TzUfMF26NrwSfO4KjIdPwYhYispCIDNJBE6rnKU=;
        b=cykTW77MJ5VJkYKe1cV4X9tA2x315TtUCDAPjL1EW8j2oevI0ke+5/t2ia3/dqzkII
         gJ67YAwop4j/UHsookWxELSG8nkNV8Q/FFo3ZoWQXSo9QYxttAXsLucMkIEJLxin5Ftt
         hm3u7c58O28Tgw/OjOlgsGe2mbYIfYZSTejk1gkDcXWfx42Udr6HFN78iL1QESpQyHg3
         kv3j4MlGmgulg6iuiJEoS0fhaxsng++U/ZLBIt6Q2Eq6599wxQGzuEZYF+U8VR2bZ1Hy
         jKZoLHph21xIFp51G/MqW0DjL+qZVsaJ9NDrivdDQnEc/QYGfJJVRzT1dqOqN6cE8Lmn
         B0ww==
X-Gm-Message-State: AOAM531A6cT3f87ypcbOazVlEBumT5KxlGKvn8uyjLgzHOF0yhCrnI7p
	t11WQd9ByhsnT2JhqC38ykU=
X-Google-Smtp-Source: ABdhPJyLzO83i4D+oIyg6HoPQKkQpEgGaCBeACLMXfFi8Xmghwtvoqj4t3iSgcq4bojWvN+4i7BQhA==
X-Received: by 2002:a9d:a14:: with SMTP id 20mr45335812otg.86.1621259312975;
        Mon, 17 May 2021 06:48:32 -0700 (PDT)
Subject: Re: [PATCH v2 1/4] usb: early: Avoid using DbC if already enabled
To: Jan Beulich <jbeulich@suse.com>
Cc: Jann Horn <jannh@google.com>, Lee Jones <lee.jones@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <cover.1620950220.git.connojdavis@gmail.com>
 <d160cee9b61c0ec41c2cd5ff9b4e107011d39d8c.1620952511.git.connojdavis@gmail.com>
 <8ccce25a-e3ca-cb30-f6a3-f9243a85a49b@suse.com>
From: Connor Davis <connojdavis@gmail.com>
Message-ID: <16400ee4-4406-8b26-10c0-a423b2b1fed0@gmail.com>
Date: Mon, 17 May 2021 07:48:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <8ccce25a-e3ca-cb30-f6a3-f9243a85a49b@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/17/21 3:32 AM, Jan Beulich wrote:
> On 14.05.2021 02:56, Connor Davis wrote:
>> Check if the debug capability is enabled in early_xdbc_parse_parameter,
>> and if it is, return with an error. This avoids collisions with whatever
>> enabled the DbC prior to linux starting.
> Doesn't this go too far and prevent use even if firmware (perhaps
> mistakenly) left it enabled?
>
> Jan

Yes, but how is one supposed to distinguish the broken firmware and 
non-broken

firmware cases?

>
>> Signed-off-by: Connor Davis <connojdavis@gmail.com>
>> ---
>>   drivers/usb/early/xhci-dbc.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
>> index be4ecbabdd58..ca67fddc2d36 100644
>> --- a/drivers/usb/early/xhci-dbc.c
>> +++ b/drivers/usb/early/xhci-dbc.c
>> @@ -642,6 +642,16 @@ int __init early_xdbc_parse_parameter(char *s)
>>   	}
>>   	xdbc.xdbc_reg = (struct xdbc_regs __iomem *)(xdbc.xhci_base + offset);
>>   
>> +	if (readl(&xdbc.xdbc_reg->control) & CTRL_DBC_ENABLE) {
>> +		pr_notice("xhci debug capability already in use\n");
>> +		early_iounmap(xdbc.xhci_base, xdbc.xhci_length);
>> +		xdbc.xdbc_reg = NULL;
>> +		xdbc.xhci_base = NULL;
>> +		xdbc.xhci_length = 0;
>> +
>> +		return -ENODEV;
>> +	}
>> +
>>   	return 0;
>>   }
>>   
>>
Thanks,

Connor


