Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1646D60742D
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 11:36:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427490.676602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oloSD-0001bO-3P; Fri, 21 Oct 2022 09:36:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427490.676602; Fri, 21 Oct 2022 09:36:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oloSD-0001Ys-0k; Fri, 21 Oct 2022 09:36:37 +0000
Received: by outflank-mailman (input) for mailman id 427490;
 Fri, 21 Oct 2022 09:36:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=opYQ=2W=redhat.com=lvivier@srs-se1.protection.inumbo.net>)
 id 1oloSA-0001Ym-OQ
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 09:36:34 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d91bc124-5123-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 11:36:33 +0200 (CEST)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-570-96pLP3jJPdmmKXwGW4wsTw-1; Fri, 21 Oct 2022 05:36:30 -0400
Received: by mail-qk1-f200.google.com with SMTP id
 bk21-20020a05620a1a1500b006be9f844c59so2961557qkb.9
 for <xen-devel@lists.xenproject.org>; Fri, 21 Oct 2022 02:36:30 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a05620a25cd00b006bbf85cad0fsm9523029qko.20.2022.10.21.02.36.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 02:36:29 -0700 (PDT)
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
X-Inumbo-ID: d91bc124-5123-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666344992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K6+Nj7rw2ygq8wV7bZt+IrcWSvF1WDIQyRmejPr4x8M=;
	b=UswBF7Jx7bMXKnubRrcXa5mzsv010M864jp9zu9cYxZgrHskTU3nr6OwlFLsmzwsQ9EPt+
	OnFyS5IIRS30yrjRQhytrAeP3kQWXr+VBBRm+NGCzKOV3GaR89BWgQa2wMghxHOG8T2MiM
	xoivHoivMXoJ6+PVPk0WvPMOjvSj/gM=
X-MC-Unique: 96pLP3jJPdmmKXwGW4wsTw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K6+Nj7rw2ygq8wV7bZt+IrcWSvF1WDIQyRmejPr4x8M=;
        b=LksuQcRd93qTQGw8/6CuDYoPoR281K4Ntiwjtk05YdCpgUlQcdDqF1KZBuSZMPaAz+
         B5OHp7jSdy9VR7ClN4WqDOlcBUfjCNcN64bG+sgDn4hUPSuH7wFpKYSmGAq6th6upBv5
         cZE4+t+z6ltOxMfoujzkmJ807d2t3Qwx1+MDl4KaKe9nmh/GCHMa4C+83njHuBmTwDLM
         EwEGfxQKqVMwwrIxz6y01qUG1YJd91FkGtcWT5dt1cAqg+dNgxfZjfQKD7aigt81aKH9
         xrld7a1xa+5qdS1LcYpXtZmSqTVz6fqYSykV96EUm1wSBech3Hih3PBuJYWP0I+R+dN/
         9luw==
X-Gm-Message-State: ACrzQf3IRERvz65iMpdFQlcb6l3YlHMbNdB5/y7AYUFqAbjh608ucN/t
	33Va3KMDzp5IrzatURRxoBbcbk2HOJKSm7w/1UWdt3Fzka5R/qKUozbxgNXYqozWPTcmLzMf1V5
	LLi/1E1fnHBrrEz79t3WLelDTMag=
X-Received: by 2002:a37:ccc:0:b0:6eb:1095:e4d9 with SMTP id 195-20020a370ccc000000b006eb1095e4d9mr12992355qkm.93.1666344989793;
        Fri, 21 Oct 2022 02:36:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6LsNXsHJn0Hr35ZPPaELK7ir7BhcrwNfcxWQB/0oflDEFJ401P6SW83Ra/iR14SaWEQZaN6w==
X-Received: by 2002:a37:ccc:0:b0:6eb:1095:e4d9 with SMTP id 195-20020a370ccc000000b006eb1095e4d9mr12992340qkm.93.1666344989540;
        Fri, 21 Oct 2022 02:36:29 -0700 (PDT)
Message-ID: <30b445bb-a268-d2c9-209f-3b2390746749@redhat.com>
Date: Fri, 21 Oct 2022 11:36:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v13 17/17] net: stream: add QAPI events to report
 connection state
To: Markus Armbruster <armbru@redhat.com>, Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Paul Durrant <paul@xen.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefano Stabellini <sstabellini@kernel.org>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Blake <eblake@redhat.com>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Brivio <sbrivio@redhat.com>
References: <20221020162558.123284-1-lvivier@redhat.com>
 <20221020162558.123284-18-lvivier@redhat.com> <87pmel4th4.fsf@pond.sub.org>
 <52e989b9-6f8d-99c6-ef04-3ce32006b002@redhat.com>
 <87lep935hn.fsf@pond.sub.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <87lep935hn.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/22 11:12, Markus Armbruster wrote:
> Cc: Stefano Brivio
> 
> Laurent Vivier <lvivier@redhat.com> writes:
> 
>> On 10/21/22 07:48, Markus Armbruster wrote:
>>> Laurent Vivier <lvivier@redhat.com> writes:
>>>
>>>> The netdev reports NETDEV_STREAM_CONNECTED event when the backend
>>>> is connected, and NETDEV_STREAM_DISCONNECTED when it is disconnected.
>>>
>>> Use cases?
>>
>> This is asked by Stefano Brivio to allow libvirt to detect if connection to passt is lost and to restart passt.
> 
> Let's add something like this to the commit message:
> 
>      This lets libvirt notice when the connection is lost somehow, and
>      restart the peer (such as passt).
> 
> Who's working on the libvirt part?
> 
>> I have also a patch to add a "reconnect=seconds" option, but I didn't want to add it to this series.
> 
> It's okay to mention future work in commit messages, but not required.
> 
>>> Could similar event signalling be useful for other kinds of netdev
>>> backends?
>>
>> I was wondering, but it becomes more complicated to be generic.
> 
> Making something complicated and generic where a simpler special
> solution would do is the worst.
> 
> Not quite as bad (but still plenty bad) is making a few special
> solutions first, then replace them all with a generic solution.
> 
> I believe we should have a good, hard think on possible applications of
> a generic solution now.
> 
> There is no need to hold back this series for that.
> 
> If we conclude a generic solution is called for, we better replace this
> special solution before it becomes ABI.  Either by replacing it before
> we release it, or by keeping it unstable until we replace it.
> 

I sent the v14 few minutes before this email.

Jason, perhaps we can remove PATCH 17 from the series and only merge PATCH 1 to 16?

I will resend PATCH 17 in a new series with the reconnect option patch once this series is 
merged.

Thanks,
Laurent


