Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA287584070
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 15:57:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376815.609833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH403-0006h6-IA; Thu, 28 Jul 2022 13:56:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376815.609833; Thu, 28 Jul 2022 13:56:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH403-0006dc-FL; Thu, 28 Jul 2022 13:56:27 +0000
Received: by outflank-mailman (input) for mailman id 376815;
 Thu, 28 Jul 2022 13:56:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=byP2=YB=redhat.com=imammedo@srs-se1.protection.inumbo.net>)
 id 1oH401-0006dW-3F
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 13:56:25 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10206557-0e7d-11ed-924f-1f966e50362f;
 Thu, 28 Jul 2022 15:56:23 +0200 (CEST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-PpOK6jCFMG6uVJEJO-0KTA-1; Thu, 28 Jul 2022 09:56:21 -0400
Received: by mail-ej1-f72.google.com with SMTP id
 hs16-20020a1709073e9000b0072b73a28465so656537ejc.17
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jul 2022 06:56:20 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a1709067c4a00b0072ab06bf296sm452703ejp.23.2022.07.28.06.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 06:56:19 -0700 (PDT)
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
X-Inumbo-ID: 10206557-0e7d-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659016582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xzeK8l/uhh2RfJXF9pYM//ZAFUY+QQVx2w6hysVQfyA=;
	b=XqLqCannSyPdVeNLsD3h2kEDaprXBikiKUZh0R1S0JiVOivj8FKsFz7gOL7KXuoQu8lHh6
	pg+Aq1r9j4dCpt8rnPnwf1uxt6j6hgzwG1L8q5pRldGpaW1+suCbZj/LnsNVI3FC7Qzw5e
	hxOa9ZxU6pQ2HLtofLVTqxxsP2rnUFA=
X-MC-Unique: PpOK6jCFMG6uVJEJO-0KTA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xzeK8l/uhh2RfJXF9pYM//ZAFUY+QQVx2w6hysVQfyA=;
        b=guFyZCnQFdY4WGjFpAmZpiFAuh3yEHbCk9VIS0nDN2czTpNPOUxZ/JPk0WVGMV5gaG
         35BrvzVrJ7M97ka5MyyL5HHF/3Evs+/nbqvffRwZc22KD24/MM19iIKyvM5GUfZ7NvBR
         38ggjLrJ7D6fgGn17HLzsxbhz6Ssn8/kF5ifwc5m+dt03lzFvbyawCcTPTzdRnq9WJuP
         f3Sn7wNV1nm2er6cj/yA2jVZVe/cXEtWjc0k3WRqbE93ClIF2W5dBKP5knCfppx/ns4r
         RDJxc/kqTp1LI1rQu2bkLLoloLl+MO0GvNNiFZIalN3Akgewe9tHNVxIEzqtfQ63s+lw
         WUZA==
X-Gm-Message-State: AJIora8dvLkop2Hghs2dNgZ7TKlNf+eKxFPYYpeotPYv97qdgxLtPprf
	kkihslS9dsIbeZEeri1ops83XZj4oB4jRZNEQt08JXOpTDqINCpPWyu0GibItuGIQG8pq+/WVKy
	l14LuJq0OifIJU2ki/vLM461rsZU=
X-Received: by 2002:a17:907:2cd3:b0:72b:5cc2:bc1f with SMTP id hg19-20020a1709072cd300b0072b5cc2bc1fmr20747962ejc.574.1659016580023;
        Thu, 28 Jul 2022 06:56:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v/Wp9CFeFCCLrSsPscRefsCFJJMjFEMt0m//2qi2v8fgpX1ZbFUyoGPrJhRbdCCU7dofFG0w==
X-Received: by 2002:a17:907:2cd3:b0:72b:5cc2:bc1f with SMTP id hg19-20020a1709072cd300b0072b5cc2bc1fmr20747937ejc.574.1659016579561;
        Thu, 28 Jul 2022 06:56:19 -0700 (PDT)
Date: Thu, 28 Jul 2022 15:56:18 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Huang Rui <ray.huang@amd.com>
Cc: "anthony.perard@citrix.com" <anthony.perard@citrix.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Trigger" <Trigger.Huang@amd.com>, kraxel@redhat.com, mst@redhat.com
Subject: Re: Question to mem-path support at QEMU for Xen
Message-ID: <20220728155618.2c390be3@redhat.com>
In-Reply-To: <YuI4HXKaRnnS9foV@amd.com>
References: <Yt+XS81vmsWoJA5y@amd.com>
	<20220727101930.66ed56e1@redhat.com>
	<YuI4HXKaRnnS9foV@amd.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 28 Jul 2022 15:17:49 +0800
Huang Rui <ray.huang@amd.com> wrote:

> Hi Igor,
> 
> Appreciate you for the reply!
> 
> On Wed, Jul 27, 2022 at 04:19:30PM +0800, Igor Mammedov wrote:
> > On Tue, 26 Jul 2022 15:27:07 +0800
> > Huang Rui <ray.huang@amd.com> wrote:
> >   
> > > Hi Anthony and other Qemu/Xen guys,
> > > 
> > > We are trying to enable venus on Xen virtualization platform. And we would
> > > like to use the backend memory with memory-backend-memfd,id=mem1,size=4G
> > > options on QEMU, however, the QEMU will tell us the "-mem-path" is not
> > > supported with Xen. I verified the same function on KVM.
> > > 
> > > qemu-system-i386: -mem-path not supported with Xen
> > > 
> > > So may I know whether Xen has any limitation that support
> > > memory-backend-memfd in QEMU or just implementation is not done yet?  
> > 
> > Currently Xen doesn't use guest RAM allocation the way the rest of
> > accelerators do. (it has hacks in memory_region/ramblock API,
> > that divert RAM allocation calls to Xen specific API)  
> 
> I am new for Xen and QEMU, we are working on GPU. We would like to have a
> piece of backend memroy like video memory for VirtIO GPU to support guest
> VM Mesa Vulkan (Venus). Do you mean we can the memory_region/ramblock APIs
> to work around it?
> 
> > 
> > The sane way would extend Xen to accept RAM regions (whatever they are
> > ram or fd based) QEMU allocates instead of going its own way. This way
> > it could reuse all memory backends that QEMU provides for the rest of
> > the non-Xen world. (not to mention that we could drop non trivial
> > Xen hacks so that guest RAM handling would be consistent with other
> > accelerators)
> >   
> 
> May I know what do you mean by "going its own way"? This sounds good, could
> you please elaborate on how can we implement this? We would like to give a
> try to address the problem on Xen. Would you mind to point somewhere that I
> can learn and understand the RAM region. Very happy to see your
> suggestions!

see for example see ram_block_add(), if Xen could be persuaded to use memory
allocated by '!xen_enabled()' branch then it's likely file base backends
would also become usable.

Whether it is possible for Xen or not I don't know,
I guess CCed Xen folks will suggest something useful.
 
> Thanks & Best Regards,
> Ray
> 


