Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B46960603F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 14:35:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426705.675323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olUl1-0000Yp-3k; Thu, 20 Oct 2022 12:34:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426705.675323; Thu, 20 Oct 2022 12:34:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olUl0-0000Vz-WB; Thu, 20 Oct 2022 12:34:42 +0000
Received: by outflank-mailman (input) for mailman id 426705;
 Thu, 20 Oct 2022 12:34:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2BcH=2V=redhat.com=lvivier@srs-se1.protection.inumbo.net>)
 id 1olUky-0000Vr-NE
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 12:34:41 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8effd9eb-5073-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 14:34:38 +0200 (CEST)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-554-rjRp3jgSNia0c5RrhCXmLg-1; Thu, 20 Oct 2022 08:34:35 -0400
Received: by mail-qk1-f197.google.com with SMTP id
 de21-20020a05620a371500b006eed31abb72so5162182qkb.6
 for <xen-devel@lists.xenproject.org>; Thu, 20 Oct 2022 05:34:35 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a37f903000000b006ee2953fac4sm6990779qkj.136.2022.10.20.05.34.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 05:34:33 -0700 (PDT)
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
X-Inumbo-ID: 8effd9eb-5073-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666269276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mt2w1QBu5mUEUGCycb5JqIv7fp2CZ53pt41k7x8rZME=;
	b=AxlcGBlj2WNIzlKfIEhZQrCgjToNi57Ri1TI8YKb8jxtzlyGxdwPgenidmg+UY76RnyWfS
	fUGQah2n2zJC1WMhUgOKD8rA9cwp1kgv0yto624rRkPDlTfUrfQS7NNz4Kg6/+WRGQZdnV
	iTITxG7nvL5Czr80vrFn5GUL4CXj6tQ=
X-MC-Unique: rjRp3jgSNia0c5RrhCXmLg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mt2w1QBu5mUEUGCycb5JqIv7fp2CZ53pt41k7x8rZME=;
        b=e0ID2gBSuABJeb4L/KTIqLqNq9jC32JW4Luze4jud1gdZqHMICb+pnew2rkOI8zib+
         B/iVC0jxcn9Nhg5edgm417HPP7N9nUMg20P8pX3vEmZQI1sgmdEV/8FtdhQ3cpmVabrt
         BbR+APfalOD9GuJjHnDSYd7wts4VQpMFsOPt8nT4+ZP71axY6qlQMDtCC+gA15e1l8x+
         wagCkfCNyEIt74wUK8xOhCU+vPBjete637cQHtwtZd0cTxooMu33rB9j1jnedH45ytxL
         F0EU2f2+EWNyDxr/Dw61SHIiwFRXc4nuquu6DhK2KEQUyVPe9alD4Wp0/yU5uxoVqrj4
         Xk1g==
X-Gm-Message-State: ACrzQf105oGdhRQpbfdxTdQK1zoNz8g8z/518BZqsmbtVaLW7lcnElLP
	LTqcnhEy6RyfDFHLkoquxXu+QCg449y2eKc1p1W+YDsDDUqHKYF00RpdZoBKsBOw2clKBj5M3y+
	+7Fwj5ZjC1w2nOIVNG7AV6OGKSIY=
X-Received: by 2002:a05:6214:d06:b0:4b4:6bdb:27a with SMTP id 6-20020a0562140d0600b004b46bdb027amr10851275qvh.53.1666269274960;
        Thu, 20 Oct 2022 05:34:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7fP3HMuFXt7aawzYaT0jG/mMYGPxNNhF3lZwbpu5H0c20tQBtgdm2nu8Y1S5zCEHjhLEkyAg==
X-Received: by 2002:a05:6214:d06:b0:4b4:6bdb:27a with SMTP id 6-20020a0562140d0600b004b46bdb027amr10851260qvh.53.1666269274742;
        Thu, 20 Oct 2022 05:34:34 -0700 (PDT)
Message-ID: <a835b361-4b3c-6dff-05dd-9c0e7a1a3624@redhat.com>
Date: Thu, 20 Oct 2022 14:34:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v11 17/17] net: stream: add QAPI events to report
 connection state
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Greg Kurz <groug@kaod.org>,
 Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Thomas Huth <thuth@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Paul Durrant <paul@xen.org>,
 David Gibson <david@gibson.dropbear.id.au>, xen-devel@lists.xenproject.org
References: <20221011200539.1486809-1-lvivier@redhat.com>
 <20221011200539.1486809-18-lvivier@redhat.com> <87mt9u4m9d.fsf@pond.sub.org>
 <7eaa3255-7580-7e06-8b28-ae60ed5e1be6@redhat.com>
 <87pmemdcam.fsf@pond.sub.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <87pmemdcam.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/22 12:22, Markus Armbruster wrote:
> Sorry for the slow replay, too many distractions...
> 
> Laurent Vivier <lvivier@redhat.com> writes:
> 
>> On 10/17/22 15:23, Markus Armbruster wrote:
>>> Laurent Vivier <lvivier@redhat.com> writes:
>>>
>>>> The netdev reports NETDEV_STREAM_CONNECTED event when the backend
>>>> is connected, and NETDEV_STREAM_EOC when it is disconnected.
>>>>
>>>> The NETDEV_STREAM_CONNECTED event includes the URI of the destination
>>>> address.
>>>>
>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> 
> [...]
> 
>>>> diff --git a/qapi/net.json b/qapi/net.json
>>>> index 6a1a49749294..69f83bceff3f 100644
>>>> --- a/qapi/net.json
>>>> +++ b/qapi/net.json
>>>> @@ -895,3 +895,49 @@
>>>>    ##
>>>>    { 'event': 'FAILOVER_NEGOTIATED',
>>>>      'data': {'device-id': 'str'} }
>>>> +
>>>> +##
>>>> +# @NETDEV_STREAM_CONNECTED:
>>>> +#
>>>> +# Emitted when the netdev stream backend is connected
>>>> +#
>>>> +# @netdev-id: QEMU netdev id that is connected
>>>> +# @uri: The Uniform Resource Identifier identifying the destination address
>>>
>>> Is an URI the appropriate representation here?  It's not how we specify
>>> such addresses elsewhere in QAPI/QMP...
>>
>> I put in the event the same information we have in info_str and displayed by the HMP command 'info network'. What would be a more appropriate reprensation?
> 
> SocketAddress?
> 

I agree SocketAddress looks better.

Thanks,
Laurent


