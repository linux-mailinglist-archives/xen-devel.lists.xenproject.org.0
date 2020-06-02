Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF55D1EC1E0
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 20:35:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgBk2-0001pM-ER; Tue, 02 Jun 2020 18:34:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KEwc=7P=gmail.com=tcminyard@srs-us1.protection.inumbo.net>)
 id 1jgBk1-0001pH-Kf
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 18:34:25 +0000
X-Inumbo-ID: af0b8bec-a4ff-11ea-9947-bc764e2007e4
Received: from mail-ot1-x331.google.com (unknown [2607:f8b0:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af0b8bec-a4ff-11ea-9947-bc764e2007e4;
 Tue, 02 Jun 2020 18:34:25 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id e5so4358473ote.11
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 11:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=sKWUgJpThmKqU1P7r9B8mHRzCHfP384f5WiFg0t3rG4=;
 b=BrCAm/GZaP3OSihkbJSVTifT4Gy9Nx+6gqAV3OkoN77N2rnDnmjObhM3Zd371su4WQ
 Hy5zFobxJYWXRQTb73J2cxrhJM67yGi4aOcdCI5Om7mMBb58Fw8WR3saEOpu/1pKVuCH
 J8oa+hLJMjtS0dkJjCl/uqn0FaoYMSgiUM8dI02XXdwgnPHN9vppWJfwpMOh0+S1JIWq
 3aNKVHpfY80nFsKFX2tv3EVHTIEc3XoJrplYdRD48FoqjSyRVJjAQN8l/ac3sVcBn1kW
 K+T8GDwp/574911RqJM/Vsl5nN7XgXtst4OFSPJ013HC9ZEzMT6bDcugVEav6rNI19os
 sxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=sKWUgJpThmKqU1P7r9B8mHRzCHfP384f5WiFg0t3rG4=;
 b=fKhG7MluOnSZ5ZLUDSF9IQgCo28rZdby5vwawbiwGYGaty0TfnApmp8oRDg9wK29t+
 WUIRFdMQjXYEkeeFjz3Os2hxJLiIj0oCXvMuuby23PBkTbPFUmHU9bbI4Gv1jHa6sCrF
 iq+3VdRR0Ki5cOeaP2w2FmN64EEkpcqlxngstfhjKwVjcPxtJwClsyplYItq+sbTHtz1
 0cwUlMmBtXuDXCLFXWb4uSVAJcHVKlDXo/H1BdqPwie4oi1yky3YmEsRvAH0kIosZe3s
 0RYzujwIVbmMavCfXKNWoIi0Sdp0n1O6jbtAdLibvknUj6cWsgZ6TXXvyvjwg5znclUp
 q4mw==
X-Gm-Message-State: AOAM532rIQ8gwkfHXjmLRMGGzQ3gImXlNhHM+5x44zZg/6E3OQqxS/jr
 8Ab64X7q3WQ7f+TPsYaegA==
X-Google-Smtp-Source: ABdhPJzROjGKYIIh+KssdSku7RLfTwrW7l20Fq2IPX/64kpQaHOQfXHtnPPuKGsepolWnkD8lfJgKw==
X-Received: by 2002:a9d:768a:: with SMTP id j10mr497816otl.188.1591122864395; 
 Tue, 02 Jun 2020 11:34:24 -0700 (PDT)
Received: from serve.minyard.net ([47.184.146.204])
 by smtp.gmail.com with ESMTPSA id k61sm816593otc.21.2020.06.02.11.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 11:34:23 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:c5fe:632c:ef7e:a82b])
 by serve.minyard.net (Postfix) with ESMTPSA id 14024180044;
 Tue,  2 Jun 2020 18:34:22 +0000 (UTC)
Date: Tue, 2 Jun 2020 13:34:20 -0500
From: Corey Minyard <minyard@acm.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Troubles running Xen on Raspberry Pi 4 with 5.6.1 DomU
Message-ID: <20200602183420.GE2880@minyard.net>
References: <2187cd7c-4d48-986b-77d6-4428e8178404@oracle.com>
 <CADz_WD68bYj-0CSm_zib+LRiMGd1+1eoNLgiJj=vHog685Khsw@mail.gmail.com>
 <alpine.DEB.2.21.2005060956120.14706@sstabellini-ThinkPad-T480s>
 <CAMmSBy_wcSD3BVcVFJVR1y1CtvxA9xMkobKwbsdf8dGxS5Hcbw@mail.gmail.com>
 <alpine.DEB.2.21.2005121723240.26167@sstabellini-ThinkPad-T480s>
 <42253259-9663-67e8-117f-8ba631243585@xen.org>
 <alpine.DEB.2.21.2005130810270.26167@sstabellini-ThinkPad-T480s>
 <d940d405-5706-c749-f546-c0c60528394d@xen.org>
 <d19f82a9-160e-ccc5-ebf9-8eb397dbeb08@xen.org>
 <alpine.DEB.2.21.2005131249570.26167@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.21.2005131249570.26167@sstabellini-ThinkPad-T480s>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: minyard@acm.org
Cc: jgross@suse.com, Peng Fan <peng.fan@nxp.com>, Julien Grall <julien@xen.org>,
 roman@zededa.com,
 "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 boris.ostrovsky@oracle.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Snip

> > > > > whether
> > > > > this was already done:
> > > > >      1) Does the kernel boot on baremetal (i.e without Xen)? This should
> > > > > help
> > > > > to confirm whether the bug is Xen is related.
> > > > 
> > > > Yes it boots
> > > > 
> > > > >      2) Swiotlb should not be necessary for basic dom0 boot on Arm. Did
> > > > > you try
> > > > > to disable it? This should help to confirm whether swiotlb is the
> > > > > problem or
> > > > > not.
> > > > 
> > > > It boots disabling swiotlb-xen
> > > 
> > > Thank you for the answer! swiotlb-xen should basically be a NOP for dom0. So
> > > this suggests swiotlb is doing some transformation on the DMA address.
> > > 
> > > I have an idea what may have gone wrong. AFAICT, xen-swiotlb seems to assume
> > > the DMA address space and CPU address space is the same. Is RPI using the
> > > same address space?
> > 
> > Another question, is the DMA request bounced? If so, are we sure the bounce
> > buffer is in the first GB?
> 
> Yes, it is. This is actually where we spent the last few days, and I
> found another little related bug in the initialization of the
> swiotlb-xen but now I am sure the memory is under 1GB (0x34000000-0x38000000)

Was anything ever resolved on this issue?  It just kind of ended for me,
and I looked in the main kernel and didn't find anything that looked
related.

Thanks,

-corey

