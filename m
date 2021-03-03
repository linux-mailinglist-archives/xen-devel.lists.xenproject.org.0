Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DB232B9F3
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 19:38:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92976.175442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHWNw-0007Qx-Ol; Wed, 03 Mar 2021 18:38:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92976.175442; Wed, 03 Mar 2021 18:38:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHWNw-0007Qe-LF; Wed, 03 Mar 2021 18:38:12 +0000
Received: by outflank-mailman (input) for mailman id 92976;
 Wed, 03 Mar 2021 18:38:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vlpN=IB=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1lHWNv-0007QY-Fa
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 18:38:11 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d98d31c6-5b3e-41d0-939b-8ef3ea793d6b;
 Wed, 03 Mar 2021 18:38:10 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-vc7ok9OUPp29oZuXZa1ZMw-1; Wed, 03 Mar 2021 13:38:08 -0500
Received: by mail-wr1-f69.google.com with SMTP id z17so4968514wrv.23
 for <xen-devel@lists.xenproject.org>; Wed, 03 Mar 2021 10:38:08 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r10sm8601151wmh.45.2021.03.03.10.38.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 10:38:06 -0800 (PST)
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
X-Inumbo-ID: d98d31c6-5b3e-41d0-939b-8ef3ea793d6b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614796689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Azs7r5hzq+oJhnDSjjywtW9vxKYDAae858wPljQ2F1w=;
	b=CrfhmtRRjqAIXhdPjcvQGMMJJr/We1eGMbi0Hzh2B4a5Fa3v+0uxF9CTRk5ptAyKZh2i8k
	nADLdDktZDrPtZsmLXVl2NorWdaNKtBSJR/YBw8yS52YP3BbK+84j/Sc5TdYSW0vnX0ElD
	Kf02PP9+BZmwVY0LtBllDAAFnMnp2aQ=
X-MC-Unique: vc7ok9OUPp29oZuXZa1ZMw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Azs7r5hzq+oJhnDSjjywtW9vxKYDAae858wPljQ2F1w=;
        b=r3yk/cNJvS+K2xJfeMpETzDhbR8TjGr/+W3Ze+GVRlPFnNY7Fbjj5ZFf2NoJqB0lOj
         NL0pCcLde+/SVo/LgfOZfcuTvb2IcR3WnQ7ddynF7+fbUulBrwnCOwDNI3TewZLqL15h
         JUsLLHTOEa1l4KHgweAYD7oz8y8qDgbIP0CDj15uGvq7qRssogSP1mfyM5LjDyFbKRbP
         GqE17OV6rPJdfhMC+XiBKNKmf0JRClvzcuyiVcXILTLDU6ktOvv8WNKZMZEk+vrkhbI0
         OlLgslyQXujaRo5zK5qb4oliUdbBYIv3hNGBrMjIxqPgl4qRM9BGGUZ0xgBYkxtsHiHX
         TRlQ==
X-Gm-Message-State: AOAM531MLI2Ih4xZCm5jmO+XgBLFkxnJS64d2e2mQAhVB3cebbsSG5SP
	lJa4PSYNrj0dQeZtoNJlscupw/tMzXcplrEr6j3LFXOQ1zTPW0wXUMBi/cNjIPlG1y5vRei8iXS
	Hztm5UtDMPAfOE5Fmc821jFklTfA=
X-Received: by 2002:adf:828e:: with SMTP id 14mr27636556wrc.123.1614796687173;
        Wed, 03 Mar 2021 10:38:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwH/Hw0IbejeS6DgJJnJUnpPbEdOJiVBVsy5hA87NNUcL1xbXFsMP09GxNLjcIFhY0X+cBFOA==
X-Received: by 2002:adf:828e:: with SMTP id 14mr27636541wrc.123.1614796687008;
        Wed, 03 Mar 2021 10:38:07 -0800 (PST)
Subject: Re: [PATCH v3 4/7] hw/core: implement a guest-loader to support
 static hypervisor guests
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: julien@xen.org, andre.przywara@arm.com, stefano.stabellini@linaro.org,
 xen-devel@lists.xenproject.org, stefano.stabellini@xilinx.com,
 stratos-dev@op-lists.linaro.org
References: <20210303173642.3805-1-alex.bennee@linaro.org>
 <20210303173642.3805-5-alex.bennee@linaro.org>
 <224e4bad-6185-a457-ddb5-f04d5c16e2dc@redhat.com>
Message-ID: <a44ccf9e-9971-b1d1-7de9-4c2be5dbd5e9@redhat.com>
Date: Wed, 3 Mar 2021 19:38:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <224e4bad-6185-a457-ddb5-f04d5c16e2dc@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 3/3/21 7:37 PM, Philippe Mathieu-Daudé wrote:
> On 3/3/21 6:36 PM, Alex Bennée wrote:
>> Hypervisors, especially type-1 ones, need the firmware/bootcode to put
>> their initial guest somewhere in memory and pass the information to it
>> via platform data. The guest-loader is modelled after the generic
>> loader for exactly this sort of purpose:
>>
>>   $QEMU $ARGS  -kernel ~/xen.git/xen/xen \
>>     -append "dom0_mem=1G,max:1G loglvl=all guest_loglvl=all" \
>>     -device guest-loader,addr=0x42000000,kernel=Image,bootargs="root=/dev/sda2 ro console=hvc0 earlyprintk=xen" \
>>     -device guest-loader,addr=0x47000000,initrd=rootfs.cpio
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Message-Id: <20201105175153.30489-5-alex.bennee@linaro.org>
>> Message-Id: <20210211171945.18313-5-alex.bennee@linaro.org>
>> ---
>>  hw/core/guest-loader.h |  34 ++++++++++
>>  hw/core/guest-loader.c | 145 +++++++++++++++++++++++++++++++++++++++++
>>  MAINTAINERS            |   5 ++
>>  hw/core/meson.build    |   2 +
>>  4 files changed, 186 insertions(+)
>>  create mode 100644 hw/core/guest-loader.h
>>  create mode 100644 hw/core/guest-loader.c
> 
> Missing documentation, 

And I now see the following patches...

> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 


