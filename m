Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D3A5FA26D
	for <lists+xen-devel@lfdr.de>; Mon, 10 Oct 2022 19:06:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419300.664069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohwDn-0007ph-24; Mon, 10 Oct 2022 17:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419300.664069; Mon, 10 Oct 2022 17:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohwDm-0007mW-Ve; Mon, 10 Oct 2022 17:05:42 +0000
Received: by outflank-mailman (input) for mailman id 419300;
 Mon, 10 Oct 2022 17:05:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qYuc=2L=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1ohwDl-0007mQ-HB
 for xen-devel@lists.xenproject.org; Mon, 10 Oct 2022 17:05:41 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3ca9a08-48bd-11ed-964a-05401a9f4f97;
 Mon, 10 Oct 2022 19:05:39 +0200 (CEST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-332-6iR5IGC2MRa5nE9NriFQpQ-1; Mon, 10 Oct 2022 13:05:37 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 az35-20020a05600c602300b003c5273b79fdso3636660wmb.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Oct 2022 10:05:37 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c089300b003c5571c27a1sm7263313wmp.32.2022.10.10.10.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:05:34 -0700 (PDT)
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
X-Inumbo-ID: c3ca9a08-48bd-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665421538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PIyB/HY40+8TeBToBpv65MXDYl/DWNxmK/k3JvGCIiE=;
	b=PiMNZMXYIjwHTRSp9CrTHy6SAKZJUVjFHCIsBtjmq00NKlxFrwm75xbUyRWrpcXTgP4e84
	oI72jmcQugS57KJQiPqy6k9hGtxKc4f2TVZIcI7QhTIxa7jt1410wMqVm4sRR8TuGeWH24
	vEaCEu+pxxZq7N7opy5bDhh6I1eXRSI=
X-MC-Unique: 6iR5IGC2MRa5nE9NriFQpQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PIyB/HY40+8TeBToBpv65MXDYl/DWNxmK/k3JvGCIiE=;
        b=KcF28Lg0HgQcCdrOPOkJu+vCv63ZAOoxnLoagqnUDQfH29ldn/aipvuFyjmbjpO9Ek
         MZjcWNBPKgF25fR91wZnBtnmU2U/PqdIRuSeONW+zsv1VeVxOhErHX9htyXikTiysSe2
         VywgRfbfHj1eSfg25cwpg4lJc+xZ1lf7K78YhU2d+gOOQLrNaRmHyCqyfrIfrAdHYftw
         3yG0Uy2jjbC2Tr+SA6Ri6iudDActcKtCI3yinwYD926pHgtQz28GX9uCfVpN4+FiIPMU
         JjLBgoZH/jgTLBPOoogJ87/JNuud2fsucAIo8q4jZXTlAzZCh0NAlg0iu8YWQegSEMGz
         65ug==
X-Gm-Message-State: ACrzQf2w20SwhygfDFoM0c+Ol7xzDlP2U+WTZNbWQYK9IkkIt4nT3YyG
	WMkmpi4EavHqkhHXDySPijtmUm0Zo1S473L/FIb95vTkk1X3h0T2BvzOreIpIXflxwxU9VytZoA
	rC8Hzs0ikNjXdJyiDhRtVEtlBd44=
X-Received: by 2002:a05:6000:551:b0:22e:4499:a478 with SMTP id b17-20020a056000055100b0022e4499a478mr12211626wrf.459.1665421535013;
        Mon, 10 Oct 2022 10:05:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6MDzV9L01F029gTj1ssLnHEx3xEyweFq79VqCpbwfJHiOCzNf0Eeex8rsDJwqhIumi3/kkGQ==
X-Received: by 2002:a05:6000:551:b0:22e:4499:a478 with SMTP id b17-20020a056000055100b0022e4499a478mr12211606wrf.459.1665421534723;
        Mon, 10 Oct 2022 10:05:34 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:05:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Nadav Amit <namit@vmware.com>
Cc: Alexander Graf <graf@amazon.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Ajay Kaher <akaher@vmware.com>, "x86@kernel.org" <x86@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	Srivatsa Bhat <srivatsab@vmware.com>,
	"srivatsa@csail.mit.edu" <srivatsa@csail.mit.edu>,
	Alexey Makhalov <amakhalov@vmware.com>,
	Vasavi Sirnapalli <vsirnapalli@vmware.com>,
	"er.ajay.kaher@gmail.com" <er.ajay.kaher@gmail.com>,
	"willy@infradead.org" <willy@infradead.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"helgaas@kernel.org" <helgaas@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v2] x86/PCI: Prefer MMIO over PIO on all hypervisor
Message-ID: <20221010130413-mutt-send-email-mst@kernel.org>
References: <9FEC6622-780D-41E6-B7CA-8D39EDB2C093@vmware.com>
 <87zgf3pfd1.fsf@redhat.com>
 <B64FD502-E794-4E94-A267-D690476C57EE@vmware.com>
 <87tu4l9cfm.fsf@redhat.com>
 <04F550C5-786A-4B8E-9A88-EBFBD8872F16@vmware.com>
 <f1a7e603-2e64-fd2a-1100-f2898060e3f7@amazon.com>
 <DF8775A4-5332-412C-9359-749E96E83907@vmware.com>
MIME-Version: 1.0
In-Reply-To: <DF8775A4-5332-412C-9359-749E96E83907@vmware.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Oct 04, 2022 at 06:48:11PM +0000, Nadav Amit wrote:
> On Oct 4, 2022, at 1:22 AM, Alexander Graf <graf@amazon.com> wrote:
> 
> > ⚠ External Email
> > 
> > Hey Nadav,
> > 
> > On 03.10.22 19:34, Nadav Amit wrote:
> >> On Oct 3, 2022, at 8:03 AM, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
> >> 
> >>> Not my but rather PCI maintainer's call but IMHO dropping 'const' is
> >>> better, introducing a new global var is our 'last resort' and should be
> >>> avoided whenever possible. Alternatively, you can add a
> >>> raw_pci_ext_ops_preferred() function checking somethin within 'struct
> >>> hypervisor_x86' but I'm unsure if it's better.
> >>> 
> >>> Also, please check Alex' question/suggestion.
> >> Here is my take (and Ajay knows probably more than me):
> >> 
> >> Looking briefly on MCFG, I do not see a clean way of using the ACPI table.
> >> The two options are either to use a reserved field (which who knows, might
> >> be used one day) or some OEM ID. I am also not familiar with
> >> PCI_COMMAND.MEMORY=0, so Ajay can hopefully give some answer about that.
> >> 
> >> Anyhow, I understand (although not relate) to the objection for a new global
> >> variable. How about explicitly calling this hardware bug a “bug” and using
> >> the proper infrastructure? Calling it explicitly a bug may even push whoever
> >> can to resolve it.
> > 
> > 
> > I am a lot more concerned with how we propagate it externally than
> > within Linux. If we hard code that all Linux kernels 6.2+ that are
> > running in VMware prefer ECAM over PIO, we lock ourselves into that
> > stance for better or worse, which means:
> > 
> > * All past and future versions of any VMware hypervisor product have to
> > always allow ECAM access for any PCIe config space write
> > * No other hypervisor benefits from any of this without upstream code change
> > * No real hardware platform benefits from this without upstream code change
> > 
> > By moving it into MCFG, we can create a path for the outside environment
> > to tell the OS whether it's safe to use ECAM always. This obviously
> > doesn't work with MCFG as it stands today, we'd have to propose an MCFG
> > spec change to the PCI SIG's "PCI Firmware Specification" to add the
> > respective field. Future VMware versions could then always expose the
> > flag - and if you find it broken, remove it again.
> > 
> > Putting all of the logic on which system potentially prefers ECAM over
> > PIO config space access into Linux is just a big hack that we should
> > avoid as much as possible.
> 
> Thanks Alex. You raise important points. Let me try to break down your
> concerns slightly differently:
> 
> 1. Enabling MMIO access should be selective, and potentially controlled by
> the hypervisor. The very least a "chicken-bit” is needed.
> 
> 2. PCI SIG would change its specifications to address unclear hardware bug.
> 
> I think (1) makes sense and we can discuss different ways of addressing it.
> But (2) would not happen in a reasonable timeline and seems to me as an
> unnecessary complication.
> 
> But before we discuss how to address the issue, perhaps we need to first
> understand it better. I am not sure that I understand this MMIO bug, and so
> far nobody was able to provide exact details.
> 
> So I went to have a look. It might not be super helpful, but for the record,
> here is what I collected.
> 
> First, we have commit d6ece5491ae71d ("i386/x86-64 Correct for broken MCFG
> tables on K8 systems”). It tried to "try to discover all devices on bus 0
> that are unreachable using MM and fallback for them.” Interestingly, it
> seems similar to FreeBSD code (commit 2d10570afe2b3e) that also mentions K8
> and has similar detection logic in FreeBSD’s pcie_cfgregopen().
> 
> Then commit a0ca9909609470 ("PCI x86: always use conf1 to access config
> space below 256 bytes”). The correspondence [1] mentions some bugs: ATI
> chipset, VIA chipset, Intel 3 Series Express chipset family and some reports
> on Nvidia. It turned out some devices had problem probing - to figure out if
> MMIO is broken - the way the previous patch did.

There's also a statement by Linus that MCFG might not cover all buses
in that thread.  I didn't think the implications through yet ...

> All of these bugs are circa 2008, of course. And note that FreeBSD did not
> take a similar path. The correspondence around Linux patch is endless. I
> admit that I did not understand whether eventually the issues were found to
> be per-bus or per-device.
> 
> 
> Back to the matter at hand. The benefit of using the MCFG approach that you
> propose is that it can enable native systems to use MMIO as well. However,
> since the list of bugs is unclear and the problems might be device-specific,
> it is not clear what information BIOSes have that Linux doesn’t. In other
> words, the benefit of getting it into the specifications is questionable,
> and the complexity+time is high.
> 
> Can we agree that the feature would be enabled explicitly by the hypervisor
> and Linux would enable it based on the hypervisor input (through some
> channel?)
> 
> Thanks,
> Nadav
> 
> [1] https://lore.kernel.org/all/20080112144030.GA19279@jurassic.park.msu.ru/T/#u


