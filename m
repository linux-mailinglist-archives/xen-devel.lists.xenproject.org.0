Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4EB6071D7
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 10:14:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427416.676441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olnAR-0004LV-SA; Fri, 21 Oct 2022 08:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427416.676441; Fri, 21 Oct 2022 08:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olnAR-0004Je-PA; Fri, 21 Oct 2022 08:14:11 +0000
Received: by outflank-mailman (input) for mailman id 427416;
 Fri, 21 Oct 2022 08:14:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=opYQ=2W=redhat.com=lvivier@srs-se1.protection.inumbo.net>)
 id 1olnAQ-0004JY-OJ
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 08:14:10 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32429e1c-5118-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 10:13:09 +0200 (CEST)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-632-arVwFlfzMYW4mpJfNF84Gw-1; Fri, 21 Oct 2022 04:14:04 -0400
Received: by mail-qt1-f197.google.com with SMTP id
 22-20020ac85756000000b0039cf0d41e2cso1849961qtx.13
 for <xen-devel@lists.xenproject.org>; Fri, 21 Oct 2022 01:14:04 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a05620a448c00b006ec5238eb97sm9314643qkp.83.2022.10.21.01.14.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 01:14:02 -0700 (PDT)
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
X-Inumbo-ID: 32429e1c-5118-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666340045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M1oGuY3hYz1kP2fGJ81Oc7oOoKcRc84nCKNZWEROOKo=;
	b=fjFUuOLuT0D4e2fMq1yTS03ykSDK6ojaOUG+fkN/1BAJDkkpNu0KpeYsYjH7fuwFH2mPcw
	6S2MHaQSkzdIyrXYoI7GAw2y5ZkUH5xryBSXPIdfShQf2h/YeVZ4dP9MislSiYv/N7HjhI
	l0/GqvNwDBmyqPXNyLB8jhOdmECyYAA=
X-MC-Unique: arVwFlfzMYW4mpJfNF84Gw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M1oGuY3hYz1kP2fGJ81Oc7oOoKcRc84nCKNZWEROOKo=;
        b=6rZRvrjBeCot99xXcYLdlUgumuZb7N3BBXImw06MjcaY+CVNWSMgFSvqVpe31i2eYR
         84ChLcsv+qN2/NJtD+eWJBL9T77bLl4aQSt4LoVdkNNiKWWjTCN1iA0Afdyw3OKHWWOX
         sN2+ecsM1e9Qig7VgCQ3lWmzUYY0CTYldqU9TmnuJKT6B2qgqM9s9mdELoQ50edefNHC
         HiyHThqKVaccoH8fsz6dRPcvHV5xduQwEWs6ocXJFiDlIy1xX9qXA994IdhUlHLus/1u
         PgVwOnZ+XTZVA1ZW6uqhofRGjdotP6OxMsxKNTq/eddbjglQ9tmJEtQvTHPLPevh3mRM
         FdoA==
X-Gm-Message-State: ACrzQf1CGS1lkFz9p5tJiTrbMY9llmWdO9ytfAqhvYPPQBhtVWwPx8T2
	FZFsq6rcDkS8oPRM4tSYv8jXv9pgY7Vmfck7qMi9+AvwtdD94Y6e0IYCbG15PMbcytbhYu+uD5v
	a72H+uymWMHmeN2oELdbfc54nlPI=
X-Received: by 2002:a05:6214:c66:b0:4b2:5ca6:8a84 with SMTP id t6-20020a0562140c6600b004b25ca68a84mr15316582qvj.110.1666340043927;
        Fri, 21 Oct 2022 01:14:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6EslkviabCZJhy0eEKOVBAOOvIh0Y7TqQQHkO5cMXDG3L45V/wluujErL+SDw5ogHtSxfBng==
X-Received: by 2002:a05:6214:c66:b0:4b2:5ca6:8a84 with SMTP id t6-20020a0562140c6600b004b25ca68a84mr15316560qvj.110.1666340043675;
        Fri, 21 Oct 2022 01:14:03 -0700 (PDT)
Message-ID: <52e989b9-6f8d-99c6-ef04-3ce32006b002@redhat.com>
Date: Fri, 21 Oct 2022 10:13:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v13 17/17] net: stream: add QAPI events to report
 connection state
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Paul Durrant <paul@xen.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefano Stabellini <sstabellini@kernel.org>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Blake <eblake@redhat.com>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <20221020162558.123284-1-lvivier@redhat.com>
 <20221020162558.123284-18-lvivier@redhat.com> <87pmel4th4.fsf@pond.sub.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <87pmel4th4.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/22 07:48, Markus Armbruster wrote:
> Laurent Vivier <lvivier@redhat.com> writes:
> 
>> The netdev reports NETDEV_STREAM_CONNECTED event when the backend
>> is connected, and NETDEV_STREAM_DISCONNECTED when it is disconnected.
> 
> Use cases?

This is asked by Stefano Brivio to allow libvirt to detect if connection to passt is lost 
and to restart passt.

I have also a patch to add a "reconnect=seconds" option, but I didn't want to add it to 
this series.

> 
> Could similar event signalling be useful for other kinds of netdev
> backends?

I was wondering, but it becomes more complicated to be generic.

Thanks,
Laurent


