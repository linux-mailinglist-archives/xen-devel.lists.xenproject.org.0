Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDBE2746EF
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 18:47:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKlRB-00069a-KR; Tue, 22 Sep 2020 16:46:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cWTz=C7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kKlRA-00069T-2L
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 16:46:40 +0000
X-Inumbo-ID: 01741aa5-edc7-4485-9aa7-d365d94ea884
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01741aa5-edc7-4485-9aa7-d365d94ea884;
 Tue, 22 Sep 2020 16:46:39 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id b19so14705322lji.11
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2020 09:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=BLRGLhcUIhVvNtoaHSvdnc9LDJiV3a0ixwch5s+oXpc=;
 b=klNTjtDn2a9dXa+YLn4SKwx6xPx46WPI807Q3SIL2A4i03P1TYvZzdkFVEXJxWB9u4
 DSRT/i0OMH3W2xGgb8mpnRQflzc+6OiA2VWZ/eOnsRdrO9529/Yq1sKc7YUBeXFQV/bs
 z/jk+ZRLPZX0po0FGFX7NTJSm/Javmbe9fqEF/X296KxskC/EsOX/yM0+6TrBB+t9y4W
 2p+nGq06B1HojXhXtnOZFcXkXaTgIdVevxb1dqVH6/OUM7f3lEPkazZwlh8yKkMQr7xo
 QMh5Oy7ILozqUwjqxXHSdMJLy7Si3N89tyPljvsNWeiBfu5ZtbO3+cdvTpl9Rq15jJwY
 o8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=BLRGLhcUIhVvNtoaHSvdnc9LDJiV3a0ixwch5s+oXpc=;
 b=nNIdSEpRkaOkG/08nRCRWXgr7iAsfh3+k40va6IZSXNTElzlkMhq+fr1ywtoQAXQVH
 gyJc04oJXICh/Elc4ByKkgwxWxd6ZEOmPYxgKQkBqlGxFxEDBlKzd0HgYqmI6wQH5WQW
 Rx1v9jv3mgZ1A9aDdJZGbkG5N+1BCEl+P0P+9A0lwl23g1wyUQmBjnWbqsrxolV6s91W
 IPr2ngtMTQyGoFbAjY7krRsfT5GxDJ41J+b1Sy6seR6Y1068K5UP1AE/bIkFS91fF2EC
 X24KqE7dcwkVfftWuF/1/abrNhJLGVg3ObZNwtSpk6mOqz5bP7hONIgaiURkRB8zDzSZ
 MBHA==
X-Gm-Message-State: AOAM5316cYCubiO21qF1MP/nvC9SsgW83wynwl+kRIqpES2EtKG9fYK5
 6FvBD1Odpi49AWWaQAb9nZU=
X-Google-Smtp-Source: ABdhPJzsKLh16jTlRq/6ncgUYSEKE9K0oabepwJR0I8X2+khNe/QDhy75gCgN7lVm6DFO9NfZuXpfA==
X-Received: by 2002:a2e:86d3:: with SMTP id n19mr1933875ljj.368.1600793197961; 
 Tue, 22 Sep 2020 09:46:37 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id n4sm3653694lfe.246.2020.09.22.09.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 09:46:37 -0700 (PDT)
Subject: Re: [PATCH V1 07/16] xen/dm: Make x86's DM feature common
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-8-git-send-email-olekstysh@gmail.com>
 <70919183-5215-2efb-d399-2b2d5dd8b5ed@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <bab6a331-359c-51d1-3f82-7ef6a28e9d00@gmail.com>
Date: Tue, 22 Sep 2020 19:46:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <70919183-5215-2efb-d399-2b2d5dd8b5ed@suse.com>
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


On 14.09.20 18:56, Jan Beulich wrote:
Hi Jan

> On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
>> --- a/xen/include/xen/hypercall.h
>> +++ b/xen/include/xen/hypercall.h
>> @@ -150,6 +150,18 @@ do_dm_op(
>>       unsigned int nr_bufs,
>>       XEN_GUEST_HANDLE_PARAM(xen_dm_op_buf_t) bufs);
>>   
>> +struct dmop_args {
>> +    domid_t domid;
>> +    unsigned int nr_bufs;
>> +    /* Reserve enough buf elements for all current hypercalls. */
>> +    struct xen_dm_op_buf buf[2];
>> +};
>> +
>> +int arch_dm_op(struct xen_dm_op *op,
>> +               struct domain *d,
>> +               const struct dmop_args *op_args,
>> +               bool *const_op);
>> +
>>   #ifdef CONFIG_HYPFS
>>   extern long
>>   do_hypfs_op(
> There are exactly two CUs which need to see these two declarations.
> Personally I think they should go into a new header, or at least
> into one that half-way fits (from the pov of its other contents)
> and doesn't get included by half the code base. But maybe it's
> just me ...

I am afraid, I didn't get why this header is not suitable for keeping 
this stuff...

But, I don't against moving this into a new header (probably dm.h?)

-- 
Regards,

Oleksandr Tyshchenko


