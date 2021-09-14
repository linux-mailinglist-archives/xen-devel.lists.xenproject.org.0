Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5341140C145
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 10:10:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186978.336096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQPzo-00050Z-Pz; Wed, 15 Sep 2021 08:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186978.336096; Wed, 15 Sep 2021 08:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQPzo-0004xy-Lu; Wed, 15 Sep 2021 08:10:20 +0000
Received: by outflank-mailman (input) for mailman id 186978;
 Tue, 14 Sep 2021 17:38:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bbdn=OE=quicinc.com=quic_tsoni@srs-us1.protection.inumbo.net>)
 id 1mQCNm-0003o9-Hn
 for xen-devel@lists.xen.org; Tue, 14 Sep 2021 17:38:10 +0000
Received: from alexa-out-sd-02.qualcomm.com (unknown [199.106.114.39])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 820cb494-aa54-47ca-a38b-356928eb3106;
 Tue, 14 Sep 2021 17:38:09 +0000 (UTC)
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 14 Sep 2021 10:38:06 -0700
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 10:38:05 -0700
Received: from [10.110.72.52] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Tue, 14 Sep 2021
 10:38:04 -0700
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
X-Inumbo-ID: 820cb494-aa54-47ca-a38b-356928eb3106
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1631641089; x=1663177089;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=LxUYjTCuKp+eIbODD4m5XJrEET+FLPtks/iYvJ1ETf0=;
  b=TbQxYx6+6Q1f7FbnXYXHDQR4s+WGQx1N6tN1NkG9hZgl7TJN9ITUcgZN
   PevcAK6+It6y8j+mbljpfe+R4psE1qA92AiUieWvlqiUJwVKC5a/0pOGv
   5vlZoTnH+7nPxDmOc5Skm5+DyTN9+6xojdAYj4lq4Ro47OkNlwcI7hoFN
   M=;
X-QCInternal: smtphost
Subject: Re: [Stratos-dev] Enabling hypervisor agnosticism for VirtIO backends
To: Stefano Stabellini <stefano.stabellini@xilinx.com>, AKASHI Takahiro
	<takahiro.akashi@linaro.org>
CC: <paul@xen.org>, Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
	<virtio-dev@lists.oasis-open.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>, Arnd Bergmann
	<arnd.bergmann@linaro.org>, <jgross@suse.com>, <julien@xen.org>, "Carl van
 Schaik" <cvanscha@qti.qualcomm.com>, <Bertrand.Marquis@arm.com>, "Stefan
 Hajnoczi" <stefanha@redhat.com>, <Artem_Mygaiev@epam.com>,
	<xen-devel@lists.xen.org>, <olekstysh@gmail.com>,
	<Oleksandr_Tyshchenko@epam.com>, Elena Afanasova <eafanasova@gmail.com>
References: <87v94ldrqq.fsf@linaro.org>
 <alpine.DEB.2.21.2108041055390.9768@sstabellini-ThinkPad-T480s>
 <YRuSPT9075NuWRYS@stefanha-x1.localdomain> <875yvkh1p1.fsf@linaro.org>
 <20210903080609.GD47953@laputa> <87czpqq9qu.fsf@linaro.org>
 <20210906022356.GD40187@laputa>
 <alpine.DEB.2.21.2109131615570.10523@sstabellini-ThinkPad-T480s>
From: Trilok Soni <quic_tsoni@quicinc.com>
Message-ID: <e9df2014-b691-1ee4-7fcd-03912d0aed59@quicinc.com>
Date: Tue, 14 Sep 2021 10:38:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2109131615570.10523@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)


Hello,

On 9/13/2021 4:51 PM, Stefano Stabellini via Stratos-dev wrote:
> On Mon, 6 Sep 2021, AKASHI Takahiro wrote:
>>> the second is how many context switches are involved in a transaction.
>>> Of course with all things there is a trade off. Things involving the
>>> very tightest latency would probably opt for a bare metal backend which
>>> I think would imply hypervisor knowledge in the backend binary.
>>
>> In configuration phase of virtio device, the latency won't be a big matter.
>> In device operations (i.e. read/write to block devices), if we can
>> resolve 'mmap' issue, as Oleksandr is proposing right now, the only issue is
>> how efficiently we can deliver notification to the opposite side. Right?
>> And this is a very common problem whatever approach we would take.
>>
>> Anyhow, if we do care the latency in my approach, most of virtio-proxy-
>> related code can be re-implemented just as a stub (or shim?) library
>> since the protocols are defined as RPCs.
>> In this case, however, we would lose the benefit of providing "single binary"
>> BE.
>> (I know this is is an arguable requirement, though.)
> 
> In my experience, latency, performance, and security are far more
> important than providing a single binary.
> 
> In my opinion, we should optimize for the best performance and security,
> then be practical on the topic of hypervisor agnosticism. For instance,
> a shared source with a small hypervisor-specific component, with one
> implementation of the small component for each hypervisor, would provide
> a good enough hypervisor abstraction. It is good to be hypervisor
> agnostic, but I wouldn't go extra lengths to have a single binary. I
> cannot picture a case where a BE binary needs to be moved between
> different hypervisors and a recompilation is impossible (BE, not FE).
> Instead, I can definitely imagine detailed requirements on IRQ latency
> having to be lower than 10us or bandwidth higher than 500 MB/sec.
> 
> Instead of virtio-proxy, my suggestion is to work together on a common
> project and common source with others interested in the same problem.
> 
> I would pick something like kvmtool as a basis. It doesn't have to be
> kvmtools, and kvmtools specifically is GPL-licensed, which is
> unfortunate because it would help if the license was BSD-style for ease
> of integration with Zephyr and other RTOSes.
> 
> As long as the project is open to working together on multiple
> hypervisors and deployment models then it is fine. For instance, the
> shared source could be based on OpenAMP kvmtool [1] (the original
> kvmtool likely prefers to stay small and narrow-focused on KVM). OpenAMP
> kvmtool was created to add support for hypervisor-less virtio but they
> are very open to hypervisors too. It could be a good place to add a Xen
> implementation, a KVM fatqueue implementation, a Jailhouse
> implementation, etc. -- work together toward the common goal of a single
> BE source (not binary) supporting multiple different deployment models.

I have my reservations on using "kvmtool" to do any development here. 
"kvmtool" can't be used on the products and it is just a tool for the 
developers.

The benefit of the solving problem w/ rust-vmm is that some of the 
crates from this project can be utilized for the real product. Alex has 
mentioned that "rust-vmm" today has some KVM specific bits but the 
rust-vmm community is already discussing to remove or re-org them in 
such a way that other Hypervisors can fit in.

Microsoft has Hyper-V implementation w/ cloud-hypervisor which uses some 
of the rust-vmm components as well and they had shown interest to add 
the Hyper-V support in the "rust-vmm" project as well. I don't know the 
current progress but they had proven it it "cloud-hypervisor" project.

"rust-vmm" project's license will work as well for most of the project 
developments and I see that "CrosVM" is shipping in the products as well.


---Trilok Soni


