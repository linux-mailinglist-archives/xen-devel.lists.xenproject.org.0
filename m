Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A003D881554
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 17:15:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696035.1086572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmyb4-00023j-4w; Wed, 20 Mar 2024 16:15:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696035.1086572; Wed, 20 Mar 2024 16:15:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmyb4-00021w-2B; Wed, 20 Mar 2024 16:15:22 +0000
Received: by outflank-mailman (input) for mailman id 696035;
 Wed, 20 Mar 2024 16:15:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CSxH=K2=redhat.com=clg@srs-se1.protection.inumbo.net>)
 id 1rmyb2-00021q-Sn
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 16:15:20 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09177410-e6d5-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 17:15:16 +0100 (CET)
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-HXTIKzDRNoa80nrM3xgv7A-1; Wed, 20 Mar 2024 12:15:12 -0400
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-6e678d894e9so6398829a34.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 09:15:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 x14-20020ae9e90e000000b00789ea3555acsm4666094qkf.19.2024.03.20.09.15.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 09:15:11 -0700 (PDT)
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
X-Inumbo-ID: 09177410-e6d5-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710951314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T4IhxAuWNgzsFqb6tIlcQFajJYSC/Su8joooqt+6RRU=;
	b=MhVWwfkRVTsHTL55ggC8jH3QlzeEdGBvtfP1jzvqOyuLa9kagWwNdfOo/dZiXD7+iaF8bs
	dkssLwOAQ2ubvPZ7l1VEAn1/dVrzEwPViGuD/J0hwaXltk1W3Ebcj5Wpn7ypm3fsFJ+EIP
	BJwXXog9MenSx7zuohcUf0P3i3dmzJo=
X-MC-Unique: HXTIKzDRNoa80nrM3xgv7A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710951312; x=1711556112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T4IhxAuWNgzsFqb6tIlcQFajJYSC/Su8joooqt+6RRU=;
        b=AGg4PQtGx5faeEjU37vQHEc5btPBaj942wbUMUwoes4RpsQu+ktt2e3j3GMrFqpLYw
         5StgsHDb05CnClC7aSLfbWc5aQN9ZQrYuDjpM8jG2qV09BDdrGNZXEJkyj0juGvV15TZ
         B8X0DXwczyKRSNriP/rIDNuhRQP5bCxMK4cWCTGs0mvusYNqVU2LpsjLZnbxyscxd2gp
         i11AX9+PAC40dFcA1Rg6BSkkYQWuCOzGvWapkfSXTA3ljZI7pcjz+IHBoT5t8wBDJvXs
         U6cLct86jUa5lxN3I19+crw9z7qMuml1UP7VgiejL/2W8aCIqBaOZ4IWffm4fZhj3Ji/
         9i1w==
X-Forwarded-Encrypted: i=1; AJvYcCV3D0bxSyu7ZR+yFjBNcZhjcyW+BExwVBHiyvKn/jT7r4rAIJFZDoJUuXgmwUXcRb/wogGgm75dovfuVhddqrw7em3TIFWmNowrETNbIMQ=
X-Gm-Message-State: AOJu0Yyihz3BwWXtb5mmhIBGdIJpa/1u+rowvSzgJAVHZ2GD1bCajvVo
	3vZYEc88eU4clsaBCUtYAuAvHBKz6o3EtajsqFofFmlplSR71+9s+R5UHs8j0o2DWmBZeuJlq93
	q8gC3vmEB4nX6LHke1Jjtb9DHu1FcsQp0X8zBUoIDxxXUeqFAjUr9DVPq7w9zq771
X-Received: by 2002:a05:6830:1d70:b0:6e6:8516:4866 with SMTP id l16-20020a0568301d7000b006e685164866mr12600256oti.16.1710951312072;
        Wed, 20 Mar 2024 09:15:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5SXrLrO24aMjWMzHB6MM12ePW1/UUxpm7nPE1oUi+NjEX/CxeqywPujgO7EBLwXPakP49HA==
X-Received: by 2002:a05:6830:1d70:b0:6e6:8516:4866 with SMTP id l16-20020a0568301d7000b006e685164866mr12600232oti.16.1710951311827;
        Wed, 20 Mar 2024 09:15:11 -0700 (PDT)
Message-ID: <d58d5134-dbfb-4c07-956a-5e8f3e230798@redhat.com>
Date: Wed, 20 Mar 2024 17:15:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.1 v5 09/14] memory: Add Error** argument to
 .log_global_start() handler
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Avihai Horon <avihaih@nvidia.com>,
 Markus Armbruster <armbru@redhat.com>, Prasad Pandit
 <pjp@fedoraproject.org>, xen-devel@lists.xenproject.org
References: <20240320064911.545001-1-clg@redhat.com>
 <20240320064911.545001-10-clg@redhat.com> <Zfr10JG2dTChsLVj@x1n>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <Zfr10JG2dTChsLVj@x1n>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/20/24 15:42, Peter Xu wrote:
> On Wed, Mar 20, 2024 at 07:49:05AM +0100, Cédric Le Goater wrote:
>> Modify all .log_global_start() handlers to take an Error** parameter
>> and return a bool. Adapt memory_global_dirty_log_start() to interrupt
>> on the first error the loop on handlers. In such case, a rollback is
>> performed to stop dirty logging on all listeners where it was
>> previously enabled.
>>
>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>> Cc: Anthony Perard <anthony.perard@citrix.com>
>> Cc: Paul Durrant <paul@xen.org>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: David Hildenbrand <david@redhat.com>
>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>
> 
> Still one comment below:
> 
>> @@ -3014,8 +3044,11 @@ static void listener_add_address_space(MemoryListener *listener,
>>           listener->begin(listener);
>>       }
>>       if (global_dirty_tracking) {
>> +        /*
>> +         * Migration has already started. Assert on any error.
> 
> If you won't mind, I can change this to:
> 
>    /*
>     * Currently only VFIO can fail log_global_start(), and it's not allowed
>     * to hotplug a VFIO device during migration, so this should never fail
>     * when invoked.  If it can start to fail in the future, we need to be
>     * able to fail the whole listener_add_address_space() and its callers.
>     */

Sure, or I will in a v6. Markus had a comment on 8/14.

Thanks,

C.


