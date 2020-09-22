Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C03F274659
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 18:16:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKky2-0002hw-FO; Tue, 22 Sep 2020 16:16:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cWTz=C7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kKky1-0002hr-MQ
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 16:16:33 +0000
X-Inumbo-ID: 493baf5b-e21e-45dc-a8b5-9b711d81c97c
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 493baf5b-e21e-45dc-a8b5-9b711d81c97c;
 Tue, 22 Sep 2020 16:16:32 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id x69so18675777lff.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2020 09:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Q2codj6oy24hUdaEzVp9hzZRJk4q5mhvewYcPYZXJsw=;
 b=nf8zbAWNiFWuneKQvvEZ9N5LV0D2DhfpH+U39yHcizPa0sST6WhHhzMM+YlCv/12yW
 LhUtXZbp9+IU5BWh9jg5H/Xp5GkAFBQpwBznA46CKqqLUoRRDeo1PnyAdgJtryv9GW+x
 geESHqtb6wpvEKw70GapBj52YQYW666XJWpMOBWvXQUzIkqTjdTGPCggs3ntkvFt3lEv
 BHaoz0MmbY9RibSjh2755jWa0Wessn21xL6fAOdwkj+jGLmI9xJwUYqC1g7GEimMMtc7
 kYfT25uRWjpl4EXJmvrrrSGnQQOG9xElBrVra7eyOZLcdxjEnHiFSr0vqJ6w3jSKn/7J
 C1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Q2codj6oy24hUdaEzVp9hzZRJk4q5mhvewYcPYZXJsw=;
 b=Q+UgRyM9eLzdA/VI2k/CYSqlTq3VgcGxqtZxNuqBfnPA/GLJD7gtu6yEysmrPjvhGv
 sEVjixsp8sMMdo5lLCGUA3cGJcgG5nerooKME+SAFkN3b4zrGcRohYJsGH+JnjLPFTRC
 0gpnAUlLCd+ojRVtvN1RySJJ+zpad291ewP+b/+Vz1JBNO4feG32h0Udw2MI3jODVKqY
 5PnXM+33hthP0JfMIEKkXCPM9wkMtchX/8jW+gtitSJNNtwOe84JBziW4JtsgUXPA2E1
 ccNfSfw/Dd0DvNncTpzGlMUJQr6ZHY3WGBTodf3rZAs8NlfIMx5sVIIYpaUrwOGZ78he
 oIFA==
X-Gm-Message-State: AOAM530EAdxsnoR7r8mw6L1C07/OgIVXIMELux1bGJkcTSMA1mNL5Q8o
 GrAF+D/4kBULCma9ZP/BY+o=
X-Google-Smtp-Source: ABdhPJwHk26vRf0Rm2eMpN1cYOCwBy06TnJnZ4Nq6n3XfDsmVVzzmsYTNzP8zBC5d9bUuLvuHCFuug==
X-Received: by 2002:ac2:43ce:: with SMTP id u14mr1770561lfl.363.1600791391580; 
 Tue, 22 Sep 2020 09:16:31 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u9sm3917235lju.95.2020.09.22.09.16.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 09:16:31 -0700 (PDT)
Subject: Re: [PATCH V1 03/16] xen/ioreq: Make x86's
 hvm_ioreq_needs_completion() common
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-4-git-send-email-olekstysh@gmail.com>
 <2d6bbc2c-dc4b-f873-ed70-87b29f53620c@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <25e96f6a-030d-1285-7bdf-54a1ce160423@gmail.com>
Date: Tue, 22 Sep 2020 19:16:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2d6bbc2c-dc4b-f873-ed70-87b29f53620c@suse.com>
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


On 14.09.20 17:59, Jan Beulich wrote:

Hi Jan

> On 10.09.2020 22:21, Oleksandr Tyshchenko wrote:
>> --- a/xen/include/xen/ioreq.h
>> +++ b/xen/include/xen/ioreq.h
>> @@ -35,6 +35,13 @@ static inline struct hvm_ioreq_server *get_ioreq_server(const struct domain *d,
>>       return GET_IOREQ_SERVER(d, id);
>>   }
>>   
>> +static inline bool hvm_ioreq_needs_completion(const ioreq_t *ioreq)
>> +{
>> +    return ioreq->state == STATE_IOREQ_READY &&
>> +           !ioreq->data_is_ptr &&
>> +           (ioreq->type != IOREQ_TYPE_PIO || ioreq->dir != IOREQ_WRITE);
>> +}
> While the PIO aspect has been discussed to some length, what about
> the data_is_ptr concept? I didn't think there were Arm insns fitting
> this? Instead I thought some other Arm-specific adjustments to the
> protocol might be needed. At which point the question of course would
> be in how far ioreq_t as a whole really fits Arm in its current shape.
I may mistake here but I don't think the "data_is_ptr" is supported.
It worth mentioning that on Arm, all the accesses to MMIO region will do 
a single memory access.
So we set "df" to 0 and "count" to 1. Other ioreq_t fields are in use.

-- 
Regards,

Oleksandr Tyshchenko


