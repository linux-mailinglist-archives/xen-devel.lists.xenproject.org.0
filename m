Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD184258AF9
	for <lists+xen-devel@lfdr.de>; Tue,  1 Sep 2020 11:07:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kD2F2-0005IX-0N; Tue, 01 Sep 2020 09:06:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LLAq=CK=gmail.com=boqun.feng@srs-us1.protection.inumbo.net>)
 id 1kD2F1-0005IS-3m
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 09:06:11 +0000
X-Inumbo-ID: 1471521c-1a62-4dc0-b686-03925ac0750a
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1471521c-1a62-4dc0-b686-03925ac0750a;
 Tue, 01 Sep 2020 09:06:10 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id p65so340119qtd.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2020 02:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=D1PJjxl04vIbaOs4ebAEDi29TuKqnfLhXms4e4vAfJA=;
 b=QTp0drHkzoxPRdICP28IjclRm08/ZlHuAEtqzP1QG+vFQRN0wCHglbA4imGiRgaqQO
 vks9z3Oso2USraYzRybz8FI/N6N3pWRsUsc5mUvct+cAoZvC9nP8Q150X3oE+lVOh+uI
 cc5eAaKJppdn4BQl1wpeaony/BfyeOocoxpuZh716y4jvk1A8r/m/WkOXkLisljNgvJB
 BC+UzYfw2mq6UumWvrmF6vC9yUvrTEUAWTzGbkL+CrArI1Hh4guazMfegiUJHg1JaONv
 tjMS9UnBxWu3DcNoGgnvuzvZzihXwkA3A7lzQaDpeLmVP2VDewI206ZixijmZreELJ2C
 A1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=D1PJjxl04vIbaOs4ebAEDi29TuKqnfLhXms4e4vAfJA=;
 b=UFsZ17UElBkK24f/ycGs+ROcdb26Vygwkdpvm20hjl7SQ36LpGaxlJNo+BmMTJ1kZb
 AhWlPg/GqWIPLVKLoG2VT/zl2OnxWcQa4xpUXIeEfRkTBRGzMYI/DjOzOQI9XSLFyrtJ
 IAN1krCptZkEAhEe/cw5nVCTmB+6lDYYR6g+eMPq7/iEOwX+gvCumTfGNcey1E0Q2cHX
 98FQiKkI2nPeLORQg8/PCC2wCe1cOxIOXsDsKACQOXF0+mvJyqoPcPvE7Hof8e5g/0DL
 coEc0PZIL6sxFqqCFCsLw65z8Yr5FGutb7K/09DOvcpd86Va3/DkEEY3PdOAEj6cLLVE
 mFFw==
X-Gm-Message-State: AOAM530IEWv0I043yutcXboa54gDNNOMlvNpvV+90zVmM5WDAWM1SIHl
 BbfgT9DGmvGb7b3z/qqINEA=
X-Google-Smtp-Source: ABdhPJxt3ZrWQoEsnnEytmhabGXMOaQWqtDOIGFcf7SKiVbdrdYBFa/qMAesxlpKByq3CmY3wYvUtw==
X-Received: by 2002:aed:2c06:: with SMTP id f6mr732113qtd.362.1598951169970;
 Tue, 01 Sep 2020 02:06:09 -0700 (PDT)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com.
 [66.111.4.228])
 by smtp.gmail.com with ESMTPSA id 16sm821427qks.102.2020.09.01.02.06.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Sep 2020 02:06:08 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailauth.nyi.internal (Postfix) with ESMTP id A373327C0054;
 Tue,  1 Sep 2020 05:06:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 01 Sep 2020 05:06:06 -0400
X-ME-Sender: <xms:_Q5OXyPVVGbcpSw2EztgFitqADIXh0znK6ysN4qTLzqv55nU0M0zsA>
 <xme:_Q5OXw9O1ucVg3XzURv5aBq9MWR-ujm1IY0XBjjrSQuPefDtuFYRg4XAcGDZcBkMp
 tcXR3XAdGe7v1BMaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefjedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhn
 ucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrth
 htvghrnhepveeijedthfeijeefudehhedvveegudegteehgffgtddvuedtveegtedvvdef
 gedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphephedvrdduheehrdduud
 durdejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtd
 eigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehf
 ihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:_Q5OX5QOlS9hptseCXLPkG7f68kHMQUlI3i-jPDbOGRzKYLyASdR7Q>
 <xmx:_Q5OXyuZ4zrB-ZbtoRa-Rpu_UoWQUIzoHuQrRiWd91wlsnAL9BcM1g>
 <xmx:_Q5OX6edbEi7U5puDhdDP9GBqTCRDrm3ddwWE59ZoxpGMHZzP9Qovg>
 <xmx:_g5OX2_-nLoht5YCspRL8HNcVmpA0wZmAAc-P8oKxThtmQZ08oqIImQ4auc>
Received: from localhost (unknown [52.155.111.71])
 by mail.messagingengine.com (Postfix) with ESMTPA id 897A630600A9;
 Tue,  1 Sep 2020 05:06:04 -0400 (EDT)
Date: Tue, 1 Sep 2020 17:06:03 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org,	Haiyang Zhang <haiyangz@microsoft.com>,
 Jon Derrick <jonathan.derrick@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Steve Wahl <steve.wahl@hpe.com>,	Dimitri Sivanich <sivanich@hpe.com>,
 Russ Anderson <rja@hpe.com>,	linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,	Megha Dey <megha.dey@intel.com>,
 Jason Gunthorpe <jgg@mellanox.com>,	Dave Jiang <dave.jiang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob Pan <jacob.jun.pan@intel.com>, Baolu Lu <baolu.lu@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 Michael Kelley <mikelley@microsoft.com>
Subject: Re: [patch V2 00/46] x86, PCI, XEN, genirq ...: Prepare for device MSI
Message-ID: <20200901090603.GA110903@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
References: <20200826111628.794979401@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826111628.794979401@linutronix.de>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Thomas,

On Wed, Aug 26, 2020 at 01:16:28PM +0200, Thomas Gleixner wrote:
[...]
> 
> The whole lot is also available from git:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git device-msi
> 
> This has been tested on Intel/AMD/KVM but lacks testing on:
> 
>     - HYPERV (-ENODEV)

FWIW, I did a build and boot test in a hyperv guest with your
development branch, the latest commit is 71cbf478eb6f ("irqchip: Add
IMS (Interrupt Message Storm) driver - NOT FOR MERGING"). And everything
seemed working fine.

If you want me to set/unset a particular CONFIG option or run some
command for testing purposes, please let me know ;-)

Regards,
Bqoun

>     - VMD enabled systems (-ENODEV)
>     - XEN (-ENOCLUE)
>     - IMS (-ENODEV)
> 
>     - Any non-X86 code which might depend on the broken compose MSI message
>       logic. Marc excpects not much fallout, but agrees that we need to fix
>       it anyway.
> 
> #1 - #3 should be applied unconditionally for obvious reasons
> #4 - #6 are wortwhile cleanups which should be done independent of device MSI
> 
> #7 - #8 look promising to cleanup the platform MSI implementation
>      	independent of #8, but I neither had cycles nor the stomach to
>      	tackle that.
> 
> #9	is obviously just for the folks interested in IMS
> 
> Thanks,
> 
> 	tglx

