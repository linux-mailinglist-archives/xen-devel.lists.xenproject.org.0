Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2BB39487B
	for <lists+xen-devel@lfdr.de>; Fri, 28 May 2021 23:51:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134121.249683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmkNC-0002UF-Eo; Fri, 28 May 2021 21:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134121.249683; Fri, 28 May 2021 21:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmkNC-0002SO-B1; Fri, 28 May 2021 21:50:30 +0000
Received: by outflank-mailman (input) for mailman id 134121;
 Fri, 28 May 2021 21:50:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W8ur=KX=amazon.com=prvs=7756afe29=anchalag@srs-us1.protection.inumbo.net>)
 id 1lmkNA-0002SI-KJ
 for xen-devel@lists.xenproject.org; Fri, 28 May 2021 21:50:28 +0000
Received: from smtp-fw-80007.amazon.com (unknown [99.78.197.218])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e4e52f1-809f-4863-a3bd-90925a9c0585;
 Fri, 28 May 2021 21:50:27 +0000 (UTC)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.25.36.214])
 by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP;
 28 May 2021 21:50:25 +0000
Received: from EX13MTAUEE001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id 1C50FA1E03; Fri, 28 May 2021 21:50:17 +0000 (UTC)
Received: from EX13D08UEE004.ant.amazon.com (10.43.62.182) by
 EX13MTAUEE001.ant.amazon.com (10.43.62.200) with Microsoft SMTP Server (TLS)
 id 15.0.1497.18; Fri, 28 May 2021 21:50:09 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D08UEE004.ant.amazon.com (10.43.62.182) with Microsoft SMTP Server (TLS)
 id 15.0.1497.18; Fri, 28 May 2021 21:50:09 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP
 Server id 15.0.1497.18 via Frontend Transport; Fri, 28 May 2021 21:50:09
 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id D5E6A4001D; Fri, 28 May 2021 21:50:08 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 8e4e52f1-809f-4863-a3bd-90925a9c0585
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1622238628; x=1653774628;
  h=date:from:to:cc:message-id:references:mime-version:
   in-reply-to:subject;
  bh=rc/9y3ypxvjAsFbfUCSM+1dHQ6N3pxPlJofRB4Y3Fno=;
  b=vADY5aULc1CBxb4qITHynMW6v7IB1p4JkM+DvtPSCQsatKoDJlvqznKH
   khf8on5AhYrS8yyM+OYgPd3DoWcMnGOxwtK11x/8eva+fVxSvFo8wdq3e
   4sDG6VbwiXB1Q8KzHf7FW0X18EqxxefxOJq9mppe+24tOuKDAYTEh0pgk
   I=;
X-IronPort-AV: E=Sophos;i="5.83,231,1616457600"; 
   d="scan'208";a="3874630"
Subject: Re: [PATCH v3 01/11] xen/manage: keep track of the on-going suspend mode
Date: Fri, 28 May 2021 21:50:08 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
CC: "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "hpa@zytor.com"
	<hpa@zytor.com>, "jgross@suse.com" <jgross@suse.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "roger.pau@citrix.com"
	<roger.pau@citrix.com>, "axboe@kernel.dk" <axboe@kernel.dk>,
	"davem@davemloft.net" <davem@davemloft.net>, "rjw@rjwysocki.net"
	<rjw@rjwysocki.net>, "len.brown@intel.com" <len.brown@intel.com>,
	"pavel@ucw.cz" <pavel@ucw.cz>, "peterz@infradead.org" <peterz@infradead.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"vkuznets@redhat.com" <vkuznets@redhat.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, <dwmw@amazon.co.uk>,
	<“benh@kernel.crashing.xn--org-9o0a>, <“aams@amazon.xn--com-9o0a>,
	<“anchalag@amazon.xn--com-9o0a>
Message-ID: <20210528215008.GA19622@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
References: <20200925190423.GA31885@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <274ddc57-5c98-5003-c850-411eed1aea4c@oracle.com>
 <20200925222826.GA11755@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <cc738014-6a79-a5ae-cb2a-a02ff15b4582@oracle.com>
 <20200930212944.GA3138@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <8cd59d9c-36b1-21cf-e59f-40c5c20c65f8@oracle.com>
 <20210521052650.GA19056@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <0b1f0772-d1b1-0e59-8e99-368e54d40fbf@oracle.com>
 <20210526044038.GA16226@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <33380567-f86c-5d85-a79e-c1cd889f8ec2@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <33380567-f86c-5d85-a79e-c1cd889f8ec2@oracle.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk

On Wed, May 26, 2021 at 02:29:53PM -0400, Boris Ostrovsky wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> 
> 
> 
> On 5/26/21 12:40 AM, Anchal Agarwal wrote:
> > On Tue, May 25, 2021 at 06:23:35PM -0400, Boris Ostrovsky wrote:
> >> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> >>
> >>
> >>
> >> On 5/21/21 1:26 AM, Anchal Agarwal wrote:
> >>>>> What I meant there wrt VCPU info was that VCPU info is not unregistered during hibernation,
> >>>>> so Xen still remembers the old physical addresses for the VCPU information, created by the
> >>>>> booting kernel. But since the hibernation kernel may have different physical
> >>>>> addresses for VCPU info and if mismatch happens, it may cause issues with resume.
> >>>>> During hibernation, the VCPU info register hypercall is not invoked again.
> >>>> I still don't think that's the cause but it's certainly worth having a look.
> >>>>
> >>> Hi Boris,
> >>> Apologies for picking this up after last year.
> >>> I did some dive deep on the above statement and that is indeed the case that's happening.
> >>> I did some debugging around KASLR and hibernation using reboot mode.
> >>> I observed in my debug prints that whenever vcpu_info* address for secondary vcpu assigned
> >>> in xen_vcpu_setup at boot is different than what is in the image, resume gets stuck for that vcpu
> >>> in bringup_cpu(). That means we have different addresses for &per_cpu(xen_vcpu_info, cpu) at boot and after
> >>> control jumps into the image.
> >>>
> >>> I failed to get any prints after it got stuck in bringup_cpu() and
> >>> I do not have an option to send a sysrq signal to the guest or rather get a kdump.
> >>
> >> xenctx and xen-hvmctx might be helpful.
> >>
> >>
> >>> This change is not observed in every hibernate-resume cycle. I am not sure if this is a bug or an
> >>> expected behavior.
> >>> Also, I am contemplating the idea that it may be a bug in xen code getting triggered only when
> >>> KASLR is enabled but I do not have substantial data to prove that.
> >>> Is this a coincidence that this always happens for 1st vcpu?
> >>> Moreover, since hypervisor is not aware that guest is hibernated and it looks like a regular shutdown to dom0 during reboot mode,
> >>> will re-registering vcpu_info for secondary vcpu's even plausible?
> >>
> >> I think I am missing how this is supposed to work (maybe we've talked about this but it's been many months since then). You hibernate the guest and it writes the state to swap. The guest is then shut down? And what's next? How do you wake it up?
> >>
> >>
> >> -boris
> >>
> > To resume a guest, guest boots up as the fresh guest and then software_resume()
> > is called which if finds a stored hibernation image, quiesces the devices and loads
> > the memory contents from the image. The control then transfers to the targeted kernel.
> > This further disables non boot cpus,sycore_suspend/resume callbacks are invoked which sets up
> > the shared_info, pvclock, grant tables etc. Since the vcpu_info pointer for each
> > non-boot cpu is already registered, the hypercall does not happen again when
> > bringing up the non boot cpus. This leads to inconsistencies as pointed
> > out earlier when KASLR is enabled.
> 
> 
> I'd think the 'if' condition in the code fragment below should always fail since hypervisor is creating new guest, resulting in the hypercall. Just like in the case of save/restore.
>
That only fails during boot but not after the control jumps into the image. The
non boot cpus are brought offline(freeze_secondary_cpus) and then online via cpu hotplug path. In that case xen_vcpu_setup doesn't invokes the hypercall again.
> 
> Do you call xen_vcpu_info_reset() on resume? That will re-initialize per_cpu(xen_vcpu). Maybe you need to add this to xen_syscore_resume().
> 
Yes coincidentally I did. It fails the registration of vcpu_info with error -22.
Basically because nobody unregistered them and xen does not know that guest hibernated
in first place. 

Moreover, syscore_resume is also called during hibernation path i.e after Image is
created. Everything is resumed and thawed back before final writing of the image
and then a machine shutdown. So syscore_resume can only invoke xen_vcpu_info_reset
when it is actually resuming from image. I had ben able to use in_suspend
variable to detect that luckily.

Another line of thought is something what kexec does to come around this problem
is to abuse soft_reset and issue it during syscore_resume or may be before the image get loaded.
I haven't experimented with that yet as I am assuming there has to be a way to re-register vcpus during resume.

Thanks,
Anchal
> 
> -boris
> 
> 
> >
> > Thanks,
> > Anchal
> >>
> >>>  I could definitely use some advice to debug this further.
> >>>
> >>>
> >>> Some printk's from my debugging:
> >>>
> >>> At Boot:
> >>>
> >>> xen_vcpu_setup: xen_have_vcpu_info_placement=1 cpu=1, vcpup=0xffff9e548fa560e0, info.mfn=3996246 info.offset=224,
> >>>
> >>> Image Loads:
> >>> It ends up in the condition:




> >>>  xen_vcpu_setup()
> >>>  {
> >>>  ...
> >>>  if (xen_hvm_domain()) {
> >>>         if (per_cpu(xen_vcpu, cpu) == &per_cpu(xen_vcpu_info, cpu))
> >>>                 return 0;
> >>>  }
> >>>  ...
> >>>  }
> >>>
> >>> xen_vcpu_setup: checking mfn on resume cpu=1, info.mfn=3934806 info.offset=224, &per_cpu(xen_vcpu_info, cpu)=0xffff9d7240a560e0
> >>>
> >>> This is tested on c4.2xlarge [8vcpu 15GB mem] instance with 5.10 kernel running
> >>> in the guest.
> >>>
> >>> Thanks,
> >>> Anchal.
> >>>> -boris
> >>>>
> >>>>

