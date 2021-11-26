Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC7645F099
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 16:23:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233192.404496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqd4Z-0000H2-TX; Fri, 26 Nov 2021 15:23:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233192.404496; Fri, 26 Nov 2021 15:23:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqd4Z-0000EB-QO; Fri, 26 Nov 2021 15:23:35 +0000
Received: by outflank-mailman (input) for mailman id 233192;
 Fri, 26 Nov 2021 15:23:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=skxS=QN=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mqd4Y-0000E3-Ow
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 15:23:34 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1997003-4ecc-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 16:23:33 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id l22so25105164lfg.7
 for <xen-devel@lists.xenproject.org>; Fri, 26 Nov 2021 07:23:33 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id n3sm520285ljc.92.2021.11.26.07.23.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 07:23:33 -0800 (PST)
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
X-Inumbo-ID: d1997003-4ecc-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=c6UA1L7mibksgWxwi+0e8uoYps7Z0SB9qdqFTSJCfQU=;
        b=Re18SX9KXZX8eS+hxqIbm8TOTNlvusykZlRqE2kawhdFdUXeLXDUF7s4EOkaf1FAx5
         dP9jTUKVesbBCdQuUw66vQ1Xey/qvx5W0BCTr76snoQob2j4jNzMk1icrHmv/Kaue2pl
         f5Xn/OphsMoPK9WDBfx7JIIZjZcEwQjN3rNkIls4TO2h5zzRIBgmRFylZmrzzvv92i9o
         4g3u7cqbF4+BHzqEmOrOOf2SBv2GNA/h0/vq4Ry0pQwgPTCmSSrf4fzAQCmhb6NMt1yz
         kt4Uk4JVewPGFSnxdOia1ufsqofuWlH46s98NSiyD/n5+UrGYaXpjf0kuqyfTsfOymT9
         s0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=c6UA1L7mibksgWxwi+0e8uoYps7Z0SB9qdqFTSJCfQU=;
        b=m3HIG5Yol1rtPQFe5f1c1B8egkWUj7cucdefGQ0fQ6VYgF8K04p5awAB/8glVN+4CI
         Iumq2jHN+/1MCh/xcp64Uq8PIWPXEZiRvVxzW3TqIdvwALk3hf/izLKRQL5N7Npo0Z+e
         wcurRXfrNVqCwz5DRTVsGRd/3Yz2JukVMz35Bpkbcio3qO+4o9ecpxgG4nXLnyii7rwy
         gi8dH84YfVRrE7cLU/ImuExBLBcvGDh2w2c4GREDc5UO6Uq+sODP/13Vu8s59hlX6M7T
         DHMfjpWLTvmx5clA2l5voXYxV1JoIZXA0+v1c5oBTX/H+hXt3vAvIGLYeqGYKhRuopxJ
         lHYg==
X-Gm-Message-State: AOAM533cxzMasnnpJxDXYOXNsNHo++obZzzQ+fiYVO3hbKJXINhkrz2H
	JnXTmCwdTb3qDlfacu6ShBQ=
X-Google-Smtp-Source: ABdhPJwKgyuJKQGOF56JoY2ClvsXS59QLaQu/YuFHrAvd/c6BapxmYexE/6pO8mv6RWJIM+Aglyf1Q==
X-Received: by 2002:a05:6512:1093:: with SMTP id j19mr30895246lfg.340.1637940213535;
        Fri, 26 Nov 2021 07:23:33 -0800 (PST)
Subject: Re: [PATCH V3 4/6] xen/unpopulated-alloc: Add mechanism to use Xen
 resource
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <1637787223-21129-1-git-send-email-olekstysh@gmail.com>
 <1637787223-21129-5-git-send-email-olekstysh@gmail.com>
 <042a46ef-c20f-5cc7-8f9a-75b8731f661f@oracle.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <0a8b74ea-111a-690f-fbe5-ae79b814461e@gmail.com>
Date: Fri, 26 Nov 2021 17:23:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <042a46ef-c20f-5cc7-8f9a-75b8731f661f@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 26.11.21 17:17, Boris Ostrovsky wrote:

Hi Boris


>
> On 11/24/21 3:53 PM, Oleksandr Tyshchenko wrote:
>> +    if (target_resource != &iomem_resource) {
>> +        tmp_res = kzalloc(sizeof(*tmp_res), GFP_KERNEL);
>> +        if (!res) {
>
>
> If (!tmp_res)


Good catch, thank you!


>
>
>> +            ret = -ENOMEM;
>> +            goto err_insert;
>> +        }

-- 
Regards,

Oleksandr Tyshchenko


