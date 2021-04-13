Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC2E35DCE9
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 12:55:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109684.209389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWGho-0004LF-OS; Tue, 13 Apr 2021 10:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109684.209389; Tue, 13 Apr 2021 10:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWGho-0004Kq-LC; Tue, 13 Apr 2021 10:55:40 +0000
Received: by outflank-mailman (input) for mailman id 109684;
 Tue, 13 Apr 2021 10:55:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Zkz=JK=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1lWGhn-0004Kl-HC
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 10:55:39 +0000
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 494cbfa0-d0bc-4f7f-81a2-d6ec36a3c214;
 Tue, 13 Apr 2021 10:55:38 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 u5-20020a7bcb050000b029010e9316b9d5so8496396wmj.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Apr 2021 03:55:38 -0700 (PDT)
Received: from [192.168.1.186]
 (host86-180-176-157.range86-180.btcentralplus.com. [86.180.176.157])
 by smtp.gmail.com with ESMTPSA id c8sm22243008wrd.55.2021.04.13.03.55.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 03:55:37 -0700 (PDT)
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
X-Inumbo-ID: 494cbfa0-d0bc-4f7f-81a2-d6ec36a3c214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Gyk1R/2jQPlA3t+EKRdfQlscDn+3pd+/7/4XIApaYIY=;
        b=GQR9ItVP2lXEmeKH6pJq+uciicpt0/e79sg09QrjQU/vGjzbmg5bm8ehPGSfel7iw1
         n7CDZqTMCQ8LnGWXqY0YGrvvDXcpXSzR7u/uO9m72JUafzD3sBhC9IDw8iUyHj44t0i+
         tLv1D/KPWRJ7FLKjOjW2I/Ml7XdDWzZbSlVIQh34pUOqXesQgUV2aizs5BV3MOSrgSOn
         /FLZGAOxyiP5oHSZXKZcTbI1bPN5WUE1GY0SRNBjvPP5b2+/pdDnj0yz4DgkGASqNsez
         wl5E3vgz15+3wZezXpYn+4yiMvWIhvi78Alr/QIfmC0Qz9w2+2ySeQkxaLhPDFQdj4wA
         +fEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Gyk1R/2jQPlA3t+EKRdfQlscDn+3pd+/7/4XIApaYIY=;
        b=apPku8Eb8wTZM5l3ao8AJSd/aJ8Ehx2cd8L/8ennP0hMLC5NDYwT14gTKxoqG1jeYq
         CvxJ7Rn1Ifmp45VshBGdrxvZxinH5qRJdnnHMWIz1wFsGKNlppspp71uhl9xw7fi3o7Z
         Kt1oMUX+yVRecOqYAYCU+WmtJH4VyK5uYBxiFohjSPyb703ZaZQw6ydOjIk6nXfVT2Bj
         DwPDhnCLdOZoh7IgFgmW7NCsl2W+rTTaVYJh7HZbNyjYDj2QBX1f6O3QScOy+qr+4SAN
         OO7uCBGt+gnT2GvjSHHXJTPtVopwQ9hb/QoVHtNLCu8Jz6VdWRf2sgfPkZt+GA56RHcq
         GIHA==
X-Gm-Message-State: AOAM531++y98paMHAfQhPIZJZwn5ft18rBR8m7YtQVCFT/W5LnwaD7Kh
	45AbVXOCiqO5L6EM0iI/19A=
X-Google-Smtp-Source: ABdhPJyYSZuBIwhQYL7lM0XOhccS5FiKDIS28Ur5j6d3ses1tVkhHXkv8w2yLY42L9hiDUqcsDVQJg==
X-Received: by 2002:a05:600c:1550:: with SMTP id f16mr3557871wmg.22.1618311337654;
        Tue, 13 Apr 2021 03:55:37 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: xen-netback hotplug-status regression bug
To: Michael Brown <mcb30@ipxe.org>, Wei Liu <wei.liu@kernel.org>,
 xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 Paul Durrant <pdurrant@amazon.com>
References: <afedd7cb-a291-e773-8b0d-4db9b291fa98@ipxe.org>
 <f469cdee-f97e-da3f-bcab-0be9ed8cd836@xen.org>
 <58ccc3b7-9ccb-b9bf-84e7-4a023ccb5c56@ipxe.org>
Message-ID: <54659eec-e315-5dc5-1578-d91633a80077@xen.org>
Date: Tue, 13 Apr 2021 11:55:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <58ccc3b7-9ccb-b9bf-84e7-4a023ccb5c56@ipxe.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 13/04/2021 11:48, Michael Brown wrote:
> On 13/04/2021 08:12, Paul Durrant wrote:
>>> If the frontend subsequently disconnects and reconnects (e.g. 
>>> transitions through Closed->Initialising->Connected) then:
>>>
>>> - Nothing recreates "hotplug-status"
>>>
>>> - When the frontend re-enters Connected state, connect() sets up a 
>>> watch on "hotplug-status" again
>>>
>>> - The callback hotplug_status_changed() is never triggered, and so 
>>> the backend device never transitions to Connected state.
>>
>> That's not how I read it. Given that "hotplug-status" is removed by 
>> the call to hotplug_status_changed() then the next call to connect() 
>> should fail to register the watch and 'have_hotplug_status_watch' 
>> should be 0. Thus backend_switch_state() should not defer the 
>> transition to XenbusStateConnected in any subsequent interaction with 
>> the frontend.
> 
> Thank you for the reply.  I've tested and confirmed my initial 
> hypothesis: the call to xenbus_watch_pathfmt() succeeds even if the node 
> does not exist.
> 
> I confirmed this with ftrace using:
> 
>   cd /sys/kernel/debug/tracing
>   echo function_graph > current_tracer
>   echo set_backend_state > set_ftrace_filter
>   echo xenbus_watch_pathfmt >> set_ftrace_filter
>   echo register_xenbus_watch >> set_ftrace_filter
>   echo xenbus_dev_fatal >> set_ftrace_filter
> 
> On the second time that the frontend transitions to Connected, this 
> produced the trace:
> 
>   set_backend_state [xen_netback]() {
>     register_xenbus_watch();
>     register_xenbus_watch();
>     xenbus_watch_pathfmt() {
>       register_xenbus_watch();
>     }
>   }
> 
> which seems to confirm that the error path in xenbus_watch_path() is 
> *not* taken, i.e. that the call to register_xenbus_watch() succeeded 
> even though the node did not exist.
> 
> 
> Other observations also seem to confirm this behaviour:
> 
> - Running "xenstore ls" in dom0 confirms that on the second frontend 
> transition to Connected, the frontend state is indeed Connected (4) but 
> the backend state remains in InitWait (2)
> 
> - Running "xenstore watch 
> /local/domain/0/backend/vif/<domU>/0/hotplug-status" *before* starting 
> the domU confirms that it is possible to create a watch on a node that 
> does not (yet) exist, and that the watch *is* notified when the node is 
> later created.
> 
>> Are you seeing the watch successfully re-registered even though the 
>> node does not exist? Perhaps there has been a change in xenstore 
>> behaviour?
> 
> So, the TL;DR is that yes, the watch does successfully register even 
> though the node does not exist.
> 
>  From a quick look through the xenstored source, it looks as though the 
> only check on the node name is the call to is_valid_nodename(), which 
> seems to perform a syntactic validity check only.  I can't immediately 
> find any commit that would have changed this behaviour.
> 

Ok, so it sound like this was probably my misunderstanding of xenstore 
semantics in the first place (although I'm sure I remember watch 
registration failing for non-existent nodes at some point in the past... 
that may have been with a non-upstream version of oxenstored though).

Anyway... a reasonable fix would therefore be to read the node first and 
only register the watch if it does exist.

   Paul

> Thanks,
> 
> Michael


