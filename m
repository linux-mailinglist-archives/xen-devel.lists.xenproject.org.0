Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1542248ACF8
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 12:50:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255710.438253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Ffg-0005Da-Ua; Tue, 11 Jan 2022 11:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255710.438253; Tue, 11 Jan 2022 11:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Ffg-0005B4-Qr; Tue, 11 Jan 2022 11:50:36 +0000
Received: by outflank-mailman (input) for mailman id 255710;
 Tue, 11 Jan 2022 11:50:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wgp4=R3=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1n7Fff-0005Ay-2g
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 11:50:35 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aee92124-72d4-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 12:50:33 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 p1-20020a1c7401000000b00345c2d068bdso1255510wmc.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jan 2022 03:50:33 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec?
 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id v5sm7510208wrq.80.2022.01.11.03.50.32
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 03:50:33 -0800 (PST)
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
X-Inumbo-ID: aee92124-72d4-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3mjT8uOUaXwZAM7qHYhSjQcF0WApQ0VfQpUdQMCTHNY=;
        b=PUuH9JUfrtKJPZovJfBszrTCuqXEqKzhgcNcSMeOh8MhjiK1abWBj3EzDwxWvIpFXT
         jdqcfICz1GEW1x0AKS1Rp0jnsSLln3IYuUMAnnwdsUUnZxd+d0SUNe4bhMBXPOOfb7C5
         4hMrhV7sC27kqoDkfECHoKU9sX/r/j/O+34H2+rFFBLrxDMDJHl1uN0fhvqTCuN6lTRA
         NisA8EuRazVCqKtMnwXeyVTXCNCClg1dloNmcCh0/jNjKsP8wBA2gEwj43MytFifj2P/
         sn1KuIOiH81+3X/uKi/hYkOmYBmQ+10j9waAaVhspMpnsQxnq2G1xn0hsaa8Bv56TLKa
         Hx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3mjT8uOUaXwZAM7qHYhSjQcF0WApQ0VfQpUdQMCTHNY=;
        b=H7F6qaGhbyxBYfa4XCNmr+xL+Ckbu/WobznKKvX22A75otP5Sgb4And8U44ObW6Hqs
         i5jXPMKb+7UAZGFiXAGn/se6T6pdJLNpmaBnqsCg2kV4XvFs5YgzwWfzbtvHPWFqVT5R
         pgTT84HvHsQvgYy2tz2hVlTw3FAxW6k3/QaTKtyZC6xrnC09eX8wj3W6zZLk5ebJVW2O
         ACuSi8hD9HIPQR9j9qyIRjwiYCUruzE5lUymLxATUrA4PODSxlgNmu19P94DycxKyMWd
         87nfsHMO2RcrSQqXAQ9KrxrmM8vgflMzDDGMjsQElFZveno3ayrsshVzUHIhInFLBUqd
         ut0Q==
X-Gm-Message-State: AOAM530ayjEN+Abz6JmADpQVmQKOtKzFWeAhTQFCKJoEDdz2SZTxgHwz
	izSY/Ze5ddeVbaroFdTOCleqWuikq0o=
X-Google-Smtp-Source: ABdhPJyD/2zeNgJt0jUfqazXg0GzaHvKCe28hFdg85vdGdSuE+F64C/13sPRq66uGMpKfUmKhtWQYw==
X-Received: by 2002:a1c:6a05:: with SMTP id f5mr2162571wmc.178.1641901833442;
        Tue, 11 Jan 2022 03:50:33 -0800 (PST)
Message-ID: <74977663-c229-60c7-fae3-d13ff4a8d558@gmail.com>
Date: Tue, 11 Jan 2022 11:50:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Reply-To: paul@xen.org
Subject: Re: [PATCH] xen, blkback: fix persistent grants negotiation
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <20220106091013.126076-1-mheyne@amazon.de>
 <Yd1l01jTPwx5oBuo@Air-de-Roger>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <Yd1l01jTPwx5oBuo@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/01/2022 11:11, Roger Pau Monné wrote:
> On Thu, Jan 06, 2022 at 09:10:13AM +0000, Maximilian Heyne wrote:
>> Given dom0 supports persistent grants but the guest does not.
>> Then, when attaching a block device during runtime of the guest, dom0
>> will enable persistent grants for this newly attached block device:
>>
>>    $ xenstore-ls -f | grep 20674 | grep persistent
>>    /local/domain/0/backend/vbd/20674/768/feature-persistent = "0"
>>    /local/domain/0/backend/vbd/20674/51792/feature-persistent = "1"
> 
> The mechanism that we use to advertise persistent grants support is
> wrong. 'feature-persistent' should always be set if the backend
> supports persistent grant (like it's done for other features in
> xen_blkbk_probe). The usage of the feature depends on whether both
> parties support persistent grants, and the xenstore entry printed by
> blkback shouldn't reflect whether persistent grants are in use, but
> rather whether blkback supports the feature.
> 
>>
>> Here disk 768 was attached during guest creation while 51792 was
>> attached at runtime. If the guest would have advertised the persistent
>> grant feature, there would be a xenstore entry like:
>>
>>    /local/domain/20674/device/vbd/51792/feature-persistent = "1"
>>
>> Persistent grants are also used when the guest tries to access the disk
>> which can be seen when enabling log stats:
>>
>>    $ echo 1 > /sys/module/xen_blkback/parameters/log_stats
>>    $ dmesg
>>    xen-blkback: (20674.xvdf-0): oo   0  |  rd    0  |  wr    0  |  f    0 |  ds    0 | pg:    1/1056
>>
>> The "pg: 1/1056" shows that one persistent grant is used.
>>
>> Before commit aac8a70db24b ("xen-blkback: add a parameter for disabling
>> of persistent grants") vbd->feature_gnt_persistent was set in
>> connect_ring. After the commit it was intended to be initialized in
>> xen_vbd_create and then set according to the guest feature availability
>> in connect_ring. However, with a running guest, connect_ring might be
>> called before xen_vbd_create and vbd->feature_gnt_persistent will be
>> incorrectly initialized. xen_vbd_create will overwrite it with the value
>> of feature_persistent regardless whether the guest actually supports
>> persistent grants.
>>
>> With this commit, vbd->feature_gnt_persistent is set only in
>> connect_ring and this is the only use of the module parameter
>> feature_persistent. This avoids races when the module parameter changes
>> during the block attachment process.
>>
>> Note that vbd->feature_gnt_persistent doesn't need to be initialized in
>> xen_vbd_create. It's next use is in connect which can only be called
>> once connect_ring has initialized the rings. xen_update_blkif_status is
>> checking for this.
>>
>> Fixes: aac8a70db24b ("xen-blkback: add a parameter for disabling of persistent grants")
>> Signed-off-by: Maximilian Heyne <mheyne@amazon.de>
>> ---
>>   drivers/block/xen-blkback/xenbus.c | 9 +++------
>>   1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
>> index 914587aabca0c..51b6ec0380ca4 100644
>> --- a/drivers/block/xen-blkback/xenbus.c
>> +++ b/drivers/block/xen-blkback/xenbus.c
>> @@ -522,8 +522,6 @@ static int xen_vbd_create(struct xen_blkif *blkif, blkif_vdev_t handle,
>>   	if (q && blk_queue_secure_erase(q))
>>   		vbd->discard_secure = true;
>>   
>> -	vbd->feature_gnt_persistent = feature_persistent;
>> -
>>   	pr_debug("Successful creation of handle=%04x (dom=%u)\n",
>>   		handle, blkif->domid);
>>   	return 0;
>> @@ -1090,10 +1088,9 @@ static int connect_ring(struct backend_info *be)
>>   		xenbus_dev_fatal(dev, err, "unknown fe protocol %s", protocol);
>>   		return -ENOSYS;
>>   	}
>> -	if (blkif->vbd.feature_gnt_persistent)
>> -		blkif->vbd.feature_gnt_persistent =
>> -			xenbus_read_unsigned(dev->otherend,
>> -					"feature-persistent", 0);
>> +
>> +	blkif->vbd.feature_gnt_persistent = feature_persistent &&
>> +		xenbus_read_unsigned(dev->otherend, "feature-persistent", 0);
> 
> I'm not sure it's correct to potentially read feature_persistent
> multiple times like it's done here.
> 
> A device can be disconnected and re-attached multiple times, and that
> implies multiple calls to connect_ring which could make the state of
> feature_gnt_persistent change across reconnections if the value of
> feature_persistent is changed. I think that would be unexpected.
> 

Would that not be legitimate though? What happens if blkfront is 
upgraded (or downgraded)? Each connection should be 'groundhog day' for 
the backend IMO.

   Paul

> There are also similar issues with
> xenblk_max_queues/xen_blkif_max_ring_order changing after
> xen_blkbk_probe has been executed. We likely need to stash all those
> parameters so what's on xenbus is consistent with the limits enforced
> in blkback.
> 
> Thanks, Roger.
> 


