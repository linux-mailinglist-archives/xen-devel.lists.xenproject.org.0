Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E31D258673A
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 12:09:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378652.611965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oISLv-0008C7-3G; Mon, 01 Aug 2022 10:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378652.611965; Mon, 01 Aug 2022 10:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oISLu-000897-Up; Mon, 01 Aug 2022 10:08:46 +0000
Received: by outflank-mailman (input) for mailman id 378652;
 Mon, 01 Aug 2022 10:08:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V0wp=YF=redhat.com=mprivozn@srs-se1.protection.inumbo.net>)
 id 1oISLt-000891-1w
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 10:08:45 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebc9ceef-1181-11ed-bd2d-47488cf2e6aa;
 Mon, 01 Aug 2022 12:08:43 +0200 (CEST)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-htTe3GA5N_y0jDiRWQUvlA-1; Mon, 01 Aug 2022 06:08:41 -0400
Received: by mail-wr1-f69.google.com with SMTP id
 w17-20020adfbad1000000b0021f0acd5398so2337402wrg.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Aug 2022 03:08:40 -0700 (PDT)
Received: from [10.43.2.88] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a7bcc84000000b003a325bd8517sm16349951wma.5.2022.08.01.03.08.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 03:08:39 -0700 (PDT)
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
X-Inumbo-ID: ebc9ceef-1181-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659348522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q0dar3qMSEwc1Q6O597FToFvC0epSd5f4tDBDDk8XSY=;
	b=Tw5hDsACZ+3+Wtv8Z6bM+A6sCLm8eLKsfI/yJgcm7QqCxBPoD460QZYLTqbWVOpeat1TB+
	O1VHD6wQpJVWPoqOEW3kQVhG0HO4+GT0b30d5JWM7QRGeFRYGutDUaSY17MtLCCz+KzOSp
	yIahnJ/zMT++RH6SUXf9QVPraBpizjE=
X-MC-Unique: htTe3GA5N_y0jDiRWQUvlA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Q0dar3qMSEwc1Q6O597FToFvC0epSd5f4tDBDDk8XSY=;
        b=l3b5+FEnNkHGSgiZUxj5D4XfH2Gm2zHMQ6TIHsm+1jONRncdMyQJHCfrKa8qcqeW1K
         AX30gVs6DUokH3xxSWT4cYLt31H84Pk26lInq08+JFVKxe2pKACu/q9NS12E0fzbsOMX
         kO1uKCEx+XQEnXeXpmD2tdBTYtv4CV9I1PQp+YBv3Daaxr5vqzTzB7e/w9LmKeHu0Tun
         iBgBDh0pAhLxhjawCCg8FSpIuJwukrUA4nyGXrn6/b+sYzuRYUMV+AGEusLKLD9fLQte
         sXdmsJ7tfettRVWTQtaaE6gZNhZZnR8RC/Qh2WeJ1LsFct8Bl1uqmdH2XonRVL+qn4Tk
         YRgA==
X-Gm-Message-State: AJIora9z6GWM25AK0RbfCUbHzJPjt7IppV8GjikoSSNYKcY3a0ROJaNY
	xsT4XOYswGxXhN5bR+w/bKChyYvSj6v+rnQOjdUbYHixXTEqZwu2iew8e8wkFWCSlGFzJhzkHyP
	SgGGO005GCuiab2nDoCFo7TIC9eg=
X-Received: by 2002:a05:600c:198f:b0:3a3:2dd5:8e35 with SMTP id t15-20020a05600c198f00b003a32dd58e35mr10537606wmq.121.1659348519811;
        Mon, 01 Aug 2022 03:08:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sManSNJneqp9RkPW7iNpcj47VsnBdDOwEGAoLbhA3D+w6lKBuapTx0+PM15uMxeS1wj1fqAw==
X-Received: by 2002:a05:600c:198f:b0:3a3:2dd5:8e35 with SMTP id t15-20020a05600c198f00b003a32dd58e35mr10537589wmq.121.1659348519538;
        Mon, 01 Aug 2022 03:08:39 -0700 (PDT)
Message-ID: <8947085c-bcc4-e599-0636-3a7f1f7b9ac6@redhat.com>
Date: Mon, 1 Aug 2022 12:08:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [libvirt PATCH] libxl: Fix build with recent Xen that introduces
 new disk backend type
To: Julien Grall <julien@xen.org>, Oleksandr Tyshchenko
 <olekstysh@gmail.com>, xen-devel@lists.xenproject.org, libvir-list@redhat.com
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20220729155024.3327364-1-olekstysh@gmail.com>
 <d29b2ad1-fa32-4897-a113-c8a0864c6630@redhat.com>
 <7444eeec-5a7c-6a18-ffde-cb32528a0e20@xen.org>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <7444eeec-5a7c-6a18-ffde-cb32528a0e20@xen.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/1/22 10:51, Julien Grall wrote:
> Hi Michal,
> 
> On 01/08/2022 09:23, Michal Prívozník wrote:
>> On 7/29/22 17:50, Oleksandr Tyshchenko wrote:
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> Xen toolstack has gained basic Virtio support recently which becides
>>> adding various virtio related stuff introduces new disk backend type
>>> LIBXL_DISK_BACKEND_STANDALONE [1].
>>>
>>> Unfortunately, this caused a regression in libvirt build with Xen
>>> support
>>> enabled, reported by the osstest today [2]:
>>>
>>> CC       libxl/libvirt_driver_libxl_impl_la-xen_xl.lo
>>> ../../src/libxl/xen_xl.c: In function 'xenParseXLDisk':
>>> ../../src/libxl/xen_xl.c:779:17: error: enumeration value
>>> 'LIBXL_DISK_BACKEND_STANDALONE'
>>>     not handled in switch [-Werror=switch-enum]
>>>                   switch (libxldisk->backend) {
>>>                   ^~~~~~
>>> cc1: all warnings being treated as errors
>>>
>>> The interesting fact is that switch already has a default branch
>>> (which ought
>>> to cover such new addition), but the error is triggered as -Wswitch-enum
>>> gives a warning about an omitted enumeration code even if there is a
>>> default
>>> label.
>>
>> This is expected and in fact working correctly. We want compiler to warn
>> us about enum members that are not handled in a switch() statement.
> 
> For us this is treated as an error. Is it intended?

-Werror shouldn't be enabled when building a package, exactly for this
reason. Header files change and we might get a warning or two when
building a RPM. However, we definitely want to treat warnings as errors
when developing libvirt, i.e. building libvirt from a git repo. That's
why we get -Werror enabled in our CI too.

> 
> If it is, then I think this will be a problem for Xen because it means
> we will always need to fix libvirt before accepting a patch in Xen (see
> more below).

So we have a chicken egg problem. Xen needs libvirt to compile without
any warning to merge a patch and libvirt wants hypervisors to have the
patch merged first. Well, I think in this case we can make an
"exception". Our demand comes from quite a few cases where we burned
ourselves by merging our portion of a feature before it was merged into
QEMU. And according to Murphy's law, QEMU interface was changed
rendering our patches (now commits) useless. But I believe this is not
the case with xen staging, is it?

BTW: every other package that does switch() over libxl_disk_backend enum
will need this fix.

> 
>>  The
>> 'default' case exists in some places because we suspect the value might
>> not have been validated before. For instance:
>>
>> libxl_disk_backend x = atoi(argv[1]); /* or parse something from XML */
>>
>> switch(x) {
>> case LIBXL_DISK_BACKEND_UNKNOWN:
>> case LIBXL_DISK_BACKEND_PHY:
>> case LIBXL_DISK_BACKEND_TAP:
>> case LIBXL_DISK_BACKEND_QDISK:
>>    // Neither of these might be exectuted ..
>> default:
>>    // .. in which case this will.
>> }
>>
>>
>> But we are not very consistent in putting 'default' case, sadly.
>>
>>>
>>> Also there is a similar issue in libxlUpdateDiskDef() which I have
>>> reproduced
>>> after fixing the first one, but it that case the corresponding switch
>>> doesn't
>>> have a default branch.
>>>
>>> Fix both issues by inserting required enumeration item to make the
>>> compiler
>>> happy and adding ifdef guard to be able to build against old Xen
>>> libraries
>>> as well (without LIBXL_HAVE_DEVICE_DISK_SPECIFICATION). Also add a
>>> default
>>> branch to switch in libxlUpdateDiskDef().
>>>
>>> Please note, that current patch doesn't implement the proper handling of
>>> LIBXL_DISK_BACKEND_STANDALONE and friends, it is just intended to fix
>>> the regression immediately to unblock the osstest.  Also it worth
>>> mentioning
>>> that current patch won't solve the possible additions in the future.
>>>
>>> [1]
>>> https://lore.kernel.org/xen-devel/20220716163745.28712-1-olekstysh@gmail.com/
>>>
>>> [2]
>>> https://lore.kernel.org/xen-devel/E1oHEQO-0008GA-Uo@osstest.test-lab.xenproject.org/
>>>
>>>
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> ---
>>> Cc: Julien Grall <julien@xen.org>
>>> Cc: Anthony PERARD <anthony.perard@citrix.com>
>>> Cc: Michal Privoznik <mprivozn@redhat.com>
>>>
>>> Please note, the patch is tested on:
>>> https://xenbits.xen.org/gitweb/?p=libvirt.git;a=shortlog;h=refs/heads/xen-tested-master
>>>
>>> but should work on the master as well (as the same code is present
>>> here).
>>> ---
>>>   src/libxl/libxl_conf.c | 4 ++++
>>>   src/libxl/xen_xl.c     | 3 +++
>>>   2 files changed, 7 insertions(+)
>>
>> Ah, I couldn't find the commit in master, and it's simply because it's
>> not there yet. It's in staging:
>>
>> https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;f=tools/libs/light/libxl_types.idl;h=66dd1c62b2a3c707bd5c55750d10a8223fbd577f
>>
>>
>> The patch looks correct. Do you have any estimate when it can be merged
>> into master? I'm not sure what our, libvirt, rules about xen staging
>> are, but for qemu we require master (even unreleased yet).
> 
> The patches usually land in master after our test suite has completed.
> One of the test is to confirm that libvirt is still working. Therefore,
> the Xen patch will not be part of master until the patch in libvirt is
> added.

I understand that but what can we do here is to disable -Werror so that
the commit can land in master. And then merge this libvirt fix. Does
that work for you?

Michal


