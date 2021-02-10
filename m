Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D83315FB0
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 07:47:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83482.155489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9jG5-000725-EN; Wed, 10 Feb 2021 06:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83482.155489; Wed, 10 Feb 2021 06:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9jG5-00071g-BG; Wed, 10 Feb 2021 06:45:53 +0000
Received: by outflank-mailman (input) for mailman id 83482;
 Wed, 10 Feb 2021 06:45:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gno4=HM=unikie.com=jukka.kaartinen@srs-us1.protection.inumbo.net>)
 id 1l9jG3-00071b-D2
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 06:45:51 +0000
Received: from mail-lj1-x236.google.com (unknown [2a00:1450:4864:20::236])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b0ce87f-e799-4d48-beec-2afbc68f30dc;
 Wed, 10 Feb 2021 06:45:50 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id e17so1390944ljl.8
 for <xen-devel@lists.xenproject.org>; Tue, 09 Feb 2021 22:45:50 -0800 (PST)
Received: from [192.168.1.7] (adsl12-kmo.oulunkaari.net. [213.255.164.81])
 by smtp.gmail.com with ESMTPSA id t27sm256401ljo.93.2021.02.09.22.45.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 22:45:48 -0800 (PST)
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
X-Inumbo-ID: 5b0ce87f-e799-4d48-beec-2afbc68f30dc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=plIu20ef33Gm0Sap/98ltm0awXIsXPGHKtC6qSVBUUc=;
        b=mT31oQf/ijljow1ax2FtFFp0EHYSQQJLioMMzbxbHuq7kAI17GcZ3pXf/g/uu0Iw3D
         wzlVdjWmtYjrXKdeJtk/XCE4xxqeFLPuPAt0eVCS2TwNfW6epAZHEqLKTZX/Jg7O/98B
         EntMYkmxeroYg/J559lkXG5W8p/PO2zFmJUQE+0glKEM0ZYqm0TROu6OR3ZjxiF/RHms
         GLNo8n3UiB884ND+qpfICN9Pewe/tO3Sbk3d51YOcuiamfu49ZFxbA3k0sIb9kmPoXFl
         KW323hAXaJavumn03lhckv9b4ZxdYvHxXj4RQSj4tG7gFVUC1FsoGy3nGSR9PKlzMSFj
         QRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=plIu20ef33Gm0Sap/98ltm0awXIsXPGHKtC6qSVBUUc=;
        b=NXpaMnXrDjFg64e9BFADPnhRTxfv5b/2JgXIVBLiFxjckHY/tfs+IkRdwRI9/4bnIs
         fc94B2Zc8bQbLB4anDkYrRL1r92yV+BetgxV3+eNSEOSpmQl6GM8vQ4bFWEzm3jNoJFV
         xILOP479ZGJzFc09htqVFCt11djILpvqlUJyzrpgH0I9scPQHL8XfB+MMTA30mUFPi9Y
         oGKw9mc8qtbs5AZIVKeSB/WmqcxrdNqMbd0D4fLGzEASA2oMl5DKO5NsOP1a6mfJaNWD
         8yTddkm20t4Hlb8Ens0cpXdZQ2bDI0S2BzqwIj/s6mN/qi30zDXq1s7f8WTeM0cZkqoU
         IPIg==
X-Gm-Message-State: AOAM533mbFNyd+/FsC1ldIGAJ8FzglH2MXsZz3prBJwDqU3oTFjeIvuV
	u/LNZw0EZRayLs26LlH8TnadcA==
X-Google-Smtp-Source: ABdhPJw8WhFnvylP18RwvzfuQpdmnJCu2mcda7B2DkJQSP5qOxl+4/xUIWHJiyE/2ZSEdvqLBe8swA==
X-Received: by 2002:a2e:984a:: with SMTP id e10mr996526ljj.160.1612939548876;
        Tue, 09 Feb 2021 22:45:48 -0800 (PST)
Subject: Re: [PATCH v2] xen: workaround missing device_type property in
 pci/pcie nodes
To: Elliott Mitchell <ehem+xen@m5p.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, julien@xen.org,
 Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20210209195334.21206-1-sstabellini@kernel.org>
 <YCM+BBvcMoloMXeT@mattapan.m5p.com>
From: Jukka Kaartinen <jukka.kaartinen@unikie.com>
Message-ID: <739f5d0a-5649-b7d6-a75e-511a6ac3fc64@unikie.com>
Date: Wed, 10 Feb 2021 08:45:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YCM+BBvcMoloMXeT@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 10.2.2021 3.59, Elliott Mitchell wrote:
> On Tue, Feb 09, 2021 at 11:53:34AM -0800, Stefano Stabellini wrote:
>> This fixes Xen boot on RPi4. Some RPi4 kernels have the following node
>> on their device trees:
> 
> IMO I like keeping the reference to Linux kernel d1ac0002dd29 in the
> commit message.  The commit is distinctly informative and takes some
> searching to find in the thread archive.  This though is merely /my/
> opinion.
> 
> Two builds later to ensure I've got a build which doesn't work due to the
> problematic device-tree and one with the patch to ensure it does fix the
> issue and:
> 
> Tested-by: Elliott Mitchell <ehem+xen@m5p.com>
> 
> 
> Note to Jukka Kaartinen, people who merely build from source are useful
> for confirming proposed fixes work.  The above line gets added to commit
> messages to note people have tried it and it works for them.
> 
> 

Thanks for the info!
I tested the fix and it works fine.

Tested-by: Jukka Kaartinen <jukka.kaartinen@unikie.com>


-Jukka

