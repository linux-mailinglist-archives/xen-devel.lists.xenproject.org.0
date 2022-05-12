Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC500524569
	for <lists+xen-devel@lfdr.de>; Thu, 12 May 2022 08:12:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327416.550218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np23G-0004JL-Vh; Thu, 12 May 2022 06:11:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327416.550218; Thu, 12 May 2022 06:11:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np23G-0004GT-RS; Thu, 12 May 2022 06:11:54 +0000
Received: by outflank-mailman (input) for mailman id 327416;
 Thu, 12 May 2022 06:11:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vwa/=VU=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1np23E-0004GN-Mr
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 06:11:52 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69f8691c-d1ba-11ec-a406-831a346695d4;
 Thu, 12 May 2022 08:11:51 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id 16so5156598lju.13
 for <xen-devel@lists.xenproject.org>; Wed, 11 May 2022 23:11:51 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 17-20020ac24d51000000b0047255d2119asm617346lfp.201.2022.05.11.23.11.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 23:11:50 -0700 (PDT)
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
X-Inumbo-ID: 69f8691c-d1ba-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=NEB+jrNm+Tn2FtofeaBVpeeoHMLJsewS6l3Qc041rsM=;
        b=NNEUu6kPZ1arfW4eHUTQDHxPZV/kgJ370ELIRRoRiXNWZ5JJi9ZCFJO/R344mtpCg0
         vrL8s3NxqydBsjCxs5i3xi6bIjgpDLx/+cyNPZScHQ4l3rj85FQUP8NsYNUKGPyKHiwL
         HkLijvpLEQCy8RojLGQhtygKeI+z+sETXEpoy5R+qPsiQgVbcQokY51YeREWOqH2qspM
         rNibrz1iHC4ETdUPQBJutTzoVJlSAmvAjiiUAjOGdBaQMREZx2lZg9Gh0RHnQEd60wTq
         yXnEBA3TkTar00aJ1t5mx+OkH2e8EamaGMjyBereZye249/Hpp8mTJrGf2KQAlwKUCrS
         UFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=NEB+jrNm+Tn2FtofeaBVpeeoHMLJsewS6l3Qc041rsM=;
        b=dVPLk0sDjQ4g0WBECa8+2MFsxWFi9YqCgiMUZVWYCdIbIw7dYxhM+AdmAurPTQG/h7
         PvCJOJw77myAPqjZDa+7a0FkWfgm/JxQuibY34UabAFSV6l/vIsm+hU2t2Yu2mSfbUYO
         rT3m3rwSSBd+mxMxKLIneWjWFiVnwl4oopVlizxH26JqWtRTsLrLP/SvSZ6pdgnYyMO6
         2ku16JfNcBDbeJy0Ziev6Njxt3CQGZXesp8qFo3bhNZqKBHYTdH9DBZjS5819YwiQAeY
         yvlZ2KdwgzKgGZ7GZmg17GL0AzzjWJvWEIV4Uft86veBzIWWpvpqxGel22rmk5m8vhYD
         MTzA==
X-Gm-Message-State: AOAM5323acOeEtc41EAJYnJRXisJyr+k3qmK1N5GRYnlzkR0FQYIGinS
	XGPBh0Y/CeIUm88I1Wk0T+g=
X-Google-Smtp-Source: ABdhPJyMRNpNOP2eL5Vb3YEt2h7dyYcK52kqLFmo+atTAmUfpAkUnaLLPD4zU5Qj2p/8dIrpHs9V/Q==
X-Received: by 2002:a05:651c:895:b0:250:c5ec:bc89 with SMTP id d21-20020a05651c089500b00250c5ecbc89mr13159344ljq.251.1652335910783;
        Wed, 11 May 2022 23:11:50 -0700 (PDT)
Subject: Re: [PATCH V2 2/7] xen/grants: support allocating consecutive grants
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Christoph Hellwig <hch@infradead.org>
References: <1651947548-4055-1-git-send-email-olekstysh@gmail.com>
 <1651947548-4055-3-git-send-email-olekstysh@gmail.com>
 <8409e636-94e3-e231-f181-c76a849534a1@gmail.com>
 <24748b59-e2ed-1d7d-801e-ab9dc12b0983@oracle.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <749e79d0-c920-adee-c145-edc4153a99f9@gmail.com>
Date: Thu, 12 May 2022 09:11:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <24748b59-e2ed-1d7d-801e-ab9dc12b0983@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 12.05.22 00:09, Boris Ostrovsky wrote:


Hello Boris


>
> On 5/11/22 2:00 PM, Oleksandr wrote:
>>
>> On 07.05.22 21:19, Oleksandr Tyshchenko wrote:
>>
>> Hello Boris, Stefano
>>
>>
>>> From: Juergen Gross <jgross@suse.com>
>>>
>>> For support of virtio via grant mappings in rare cases larger mappings
>>> using consecutive grants are needed. Support those by adding a bitmap
>>> of free grants.
>>>
>>> As consecutive grants will be needed only in very rare cases (e.g. when
>>> configuring a virtio device with a multi-page ring), optimize for the
>>> normal case of non-consecutive allocations.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>> Changes RFC -> V1:
>>>     - no changes
>>>     Changes V1 -> V2:
>>>     - no changes
>>
>>
>> May I please ask for the review here?
>
>
>
> I had a quick look but I am stuck on get_free_seq(), I need to stare 
> at it some more. Unless someone else reviews this, I will try to get 
> to this in the next couple of days.


Thank you!


>
>
>
> One thing I did notice is
>
>
>>
>>> @@ -1452,6 +1624,13 @@ int gnttab_init(void)
>>>           }
>>>       }
>>>   +    i = gnttab_interface->grefs_per_grant_frame * 
>>> max_nr_grant_frames;
>>> +    gnttab_free_bitmap = bitmap_zalloc(i, GFP_KERNEL);
>>> +    if (!gnttab_free_bitmap) {
>>> +        ret = -ENOMEM;
>>> +        goto ini_nomem;
>>> +    }
>
>
> This overwrites 'i' and will break error handling at ini_nomem.


Indeed, will fix. Thank you for pointing this out.


>
>
> -boris
>
>
-- 
Regards,

Oleksandr Tyshchenko


