Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DACA76072B3
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 10:44:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427438.676485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olndR-0000gC-To; Fri, 21 Oct 2022 08:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427438.676485; Fri, 21 Oct 2022 08:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olndR-0000d6-Qy; Fri, 21 Oct 2022 08:44:09 +0000
Received: by outflank-mailman (input) for mailman id 427438;
 Fri, 21 Oct 2022 08:44:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=opYQ=2W=redhat.com=lvivier@srs-se1.protection.inumbo.net>)
 id 1olndQ-0000d0-Nt
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 08:44:08 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85c44ef3-511c-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 10:44:07 +0200 (CEST)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-612-oKeQ5cWLMm6vNCCiXxiRYw-1; Fri, 21 Oct 2022 04:44:04 -0400
Received: by mail-qt1-f199.google.com with SMTP id
 cc18-20020a05622a411200b0039cdeb3a699so1906203qtb.23
 for <xen-devel@lists.xenproject.org>; Fri, 21 Oct 2022 01:44:04 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 f7-20020ac84707000000b003431446588fsm7668132qtp.5.2022.10.21.01.44.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 01:44:03 -0700 (PDT)
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
X-Inumbo-ID: 85c44ef3-511c-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666341846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OgtnC9HGsNuLdyZttExUaJKDQyO65ihPNHSrfyWjW4k=;
	b=Cgv0eDtpdgc+Ds5CmZdp9WFZoFpbWCp7mVGmz/nO11DMCyzS8DyDQomoc8G4JgQFJq3Ive
	LV/I5UQbgSAUmXiJk4v2OgD9uP3L8hdBIYbZpMG48ZdehS8OHg+B423Gv/KPKwa8Uuo9sM
	ADS7RxNSA5rxUr4pnP3EW2fqgDSJGIg=
X-MC-Unique: oKeQ5cWLMm6vNCCiXxiRYw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OgtnC9HGsNuLdyZttExUaJKDQyO65ihPNHSrfyWjW4k=;
        b=Qju/N0Cgi5QXdTOd8ycztq8GL0nwVW7efDex9dFNqKMcRbZFEAADFm5Wu0q86GCS5K
         YOSgTrHLtHqgTbzJGP0tiayxfPMKwXZbroV94k4t6MhiCw3HPHUB7kG80Chn2xQdGgS6
         vdm3GwX0vErJqqriKtaZj+2h8BWl5UNTGkC3Qgl1tyqVpbIBLVI1eytmXVCIQzBX/so3
         WK0VNxDMKN9RCD6+u7EgtHMOVar4V/nIKvQzgSGAEnD63Rd/GXZEV5vRy3MaML40WsJX
         1BiuQPhQYcxJYsUmg/lChLdziqJf1ICUu/pP68VP1fTWO2WtWLHgVpVj44FMePKmJKyt
         suzQ==
X-Gm-Message-State: ACrzQf2p3ef5uUBUSEaRwSIdXmhd7Jd8IMtmpVQ3RmFqVicodxOe81Wa
	ws8AnL3wBPNJ9JGU1wNfxhQpG2XE2n7YkTJRZ/WVGoQ9iTZd6CnQJ8wM4AK6OsDApG7Ws5swbhn
	3+3tumF7fO+TMsVhUycm1aqHlIUM=
X-Received: by 2002:a05:6214:d08:b0:4b1:7127:f615 with SMTP id 8-20020a0562140d0800b004b17127f615mr15634939qvh.92.1666341844224;
        Fri, 21 Oct 2022 01:44:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6JJsnzxeixtY63ogvNQl94ky4fV5fZcMZxPyI0H491y9Vc3Mp02kLYSv2y4rUpZ7nrpzuTvg==
X-Received: by 2002:a05:6214:d08:b0:4b1:7127:f615 with SMTP id 8-20020a0562140d0800b004b17127f615mr15634924qvh.92.1666341843987;
        Fri, 21 Oct 2022 01:44:03 -0700 (PDT)
Message-ID: <b595c7fe-bf31-7cc1-e7ed-cad390875bad@redhat.com>
Date: Fri, 21 Oct 2022 10:43:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v13 00/17] qapi: net: add unix socket type support to
 netdev backend
To: Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Paul Durrant <paul@xen.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefano Stabellini <sstabellini@kernel.org>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Blake <eblake@redhat.com>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Ralph Schmieder <ralph.schmieder@gmail.com>,
 Stefano Brivio <sbrivio@redhat.com>
References: <20221020162558.123284-1-lvivier@redhat.com>
 <CACGkMEt9Hoo=GAuCUqMcBjqNvs94fEPA_GU9Z7TOh8c7Wam55Q@mail.gmail.com>
 <87h6zx4qsk.fsf@pond.sub.org>
 <CACGkMEsnq2pFaLwBpzpCSiD8jZrx77SUTn_6JhGG9jKe1PJkwA@mail.gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <CACGkMEsnq2pFaLwBpzpCSiD8jZrx77SUTn_6JhGG9jKe1PJkwA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/22 08:50, Jason Wang wrote:
> On Fri, Oct 21, 2022 at 2:46 PM Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Jason Wang <jasowang@redhat.com> writes:
>>
>>> I've queued this version and will send pull requests shortly.
>>>
>>> Any future comment we can do patches on top.
>>
>> Please give Laurent and me a few hours to try to improve PATCH 17's
>> commit message.  Which you could then integrate without a respin.
> 

I'm going to send a new version, only patches 15 and 17 change.
I moved some changes from PATCH 17 to 15 as asked by Markus,
I have updated the commit message for patch 17:

     net: stream: add QAPI events to report connection state

     The netdev reports NETDEV_STREAM_CONNECTED event when the backend
     is connected, and NETDEV_STREAM_DISCONNECTED when it is disconnected.

     The NETDEV_STREAM_CONNECTED event includes the destination address.

     This allows a system manager like libvirt to detect when the server
     fails.

     For instance with passt:

     { 'execute': 'qmp_capabilities' }
     { "return": { } }
     { "timestamp": { "seconds": 1666341395, "microseconds": 505347 },
         "event": "NETDEV_STREAM_CONNECTED",
         "data": { "netdev-id": "netdev0",
             "addr": { "path": "/tmp/passt_1.socket", "type": "unix" } } }

     [killing passt here]

     { "timestamp": { "seconds": 1666341430, "microseconds": 968694 },
         "event": "NETDEV_STREAM_DISCONNECTED",
         "data": { "netdev-id": "netdev0" } }

Thanks,
Laurent


