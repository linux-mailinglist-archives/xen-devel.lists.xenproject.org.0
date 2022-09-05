Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C75E65ADB7B
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 00:42:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399236.640337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVKmV-0003fl-Vt; Mon, 05 Sep 2022 22:41:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399236.640337; Mon, 05 Sep 2022 22:41:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVKmV-0003dk-Ss; Mon, 05 Sep 2022 22:41:27 +0000
Received: by outflank-mailman (input) for mailman id 399236;
 Mon, 05 Sep 2022 22:41:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+J0v=ZI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oVKmT-0003dd-T4
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 22:41:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de1b6056-2d6b-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 00:41:24 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 59B0160ED5;
 Mon,  5 Sep 2022 22:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F492C433D6;
 Mon,  5 Sep 2022 22:41:21 +0000 (UTC)
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
X-Inumbo-ID: de1b6056-2d6b-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662417681;
	bh=3HlGoPvoNOu2zy39eHiPtPohjAPnGT+sVn4pFvGIjj0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=c/NNt9LxvljVK1Fp73hlUH4VLO13CKhkRo2g33s3wxkbpNDkmoJM+KaARvioZVn6Q
	 h601EuNx2KGRS8egy0b1O6c1qu/udAbXt9XxAEy0FklLMs6XQZc7UYyrHvPwToZeyC
	 FpsiF8SQid58SPErprlVIXX/gWlbqc/aA7jsxWFd0nsyZbi9I1nxctTgNkPFYo3ThK
	 Q/P6/3Fk8OBYHLTYTE+ZbWXTJxWKrTIGg/ZzIbA2RBWz9ar25v1dhbSBT2CjWlWEMJ
	 T6m8KdDquDzbHeKcxaiAk7VkD/G0Svzo21aiHqffqy/gdp84M0BCZDW7AvT59w4Jvb
	 RyrJfUV16+I7g==
Date: Mon, 5 Sep 2022 15:41:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Rahul Singh <Rahul.Singh@arm.com>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 7/7] xen/arm: introduce new xen,enhanced property
 value
In-Reply-To: <EBF5412F-F932-4D25-A2E3-9F53D59ABBCC@arm.com>
Message-ID: <alpine.DEB.2.22.394.2209051530250.3931@ubuntu-linux-20-04-desktop>
References: <cover.1662023183.git.rahul.singh@arm.com> <d8dae49b05e6c59715016e0995b1275f3cb6e7fc.1662023183.git.rahul.singh@arm.com> <28b9679c-8223-ae71-d629-4ec31a72dcb2@xen.org> <36A408C8-36C5-4A39-80B4-F564445635C7@arm.com> <616b36ec-5a42-cb9a-2131-3aea1bec7c67@xen.org>
 <46897765-5063-49CE-8A8A-F4DA50570A08@arm.com> <a669182c-dab1-35b7-9bf7-caac1813e3ad@xen.org> <C27FD0DE-D8FA-4A67-AE0B-DF4030A65127@arm.com> <a14b4d4a-5ae6-4af0-2d00-49bbc688cd4a@xen.org> <6B0D4F4B-C7CC-4C04-9BA4-71976CAA82C5@arm.com>
 <cf2872c6-23e3-ced4-d7c5-2a5e6ade98ad@xen.org> <1874D575-E3B3-4221-925F-AF71D3EF0289@arm.com> <EBF5412F-F932-4D25-A2E3-9F53D59ABBCC@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1917976994-1662417118=:3931"
Content-ID: <alpine.DEB.2.22.394.2209051532110.3931@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1917976994-1662417118=:3931
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2209051532111.3931@ubuntu-linux-20-04-desktop>

On Mon, 5 Sep 2022, Rahul Singh wrote:
> > On 5 Sep 2022, at 1:59 pm, Bertrand Marquis <Bertrand.Marquis@arm.com> wrote:
> > 
> > Hi Julien,
> > 
> >> On 5 Sep 2022, at 13:08, Julien Grall <julien@xen.org> wrote:
> >> 
> >> 
> >> 
> >> On 05/09/2022 12:54, Bertrand Marquis wrote:
> >>> Hi Julien,
> >>>> On 5 Sep 2022, at 12:43, Julien Grall <julien@xen.org> wrote:
> >>>> 
> >>>> 
> >>>> 
> >>>> On 05/09/2022 12:12, Rahul Singh wrote:
> >>>>> Hi Julien,
> >>>> 
> >>>> Hi Rahul,
> >>>> 
> >>>>>> On 2 Sep 2022, at 5:20 pm, Julien Grall <julien@xen.org> wrote:
> >>>>>> 
> >>>>>> 
> >>>>>> 
> >>>>>> On 02/09/2022 16:54, Rahul Singh wrote:
> >>>>>>> Hi Julien,
> >>>>>> 
> >>>>>> Hi Rahul,
> >>>>>> 
> >>>>>>>> On 2 Sep 2022, at 4:05 pm, Julien Grall <julien@xen.org> wrote:
> >>>>>>>> 
> >>>>>>>> Hi Bertrand,
> >>>>>>>> 
> >>>>>>>> On 02/09/2022 15:51, Bertrand Marquis wrote:
> >>>>>>>>>> On 1 Sep 2022, at 19:15, Julien Grall <julien@xen.org> wrote:
> >>>>>>>>>> AFAIU, it is not possible to have *_xenstore = true and *_enhanced = false. I think it would be clearer if ``dom0less_enhanced`` is turned to an enum with 3 values:
> >>>>>>>>>> - None
> >>>>>>>>>> - NOXENSTORE/BASIC
> >>>>>>>>>> - FULLY_ENHANCED
> >>>>>>>>>> 
> >>>>>>>>>> If we want to be future proof, I would use a field 'flags' where non-zero means enhanced. Each bit would indicate which features of Xen is exposed.
> >>>>>>>>> I think that could be a good solution if we do it this way:
> >>>>>>>>> - define a dom0less feature field and have defines like the following:
> >>>>>>>>> #define DOM0LESS_GNTTAB
> >>>>>>>>> #define DOM0LESS_EVENTCHN
> >>>>>>>>> #define DOM0LESS_XENSTORE >
> >>>>>>>>> - define dom0less enhanced as the right combination:
> >>>>>>>>> #define DOM0LESS_ENHANCED = (DOM0LESS_GNTTAB| DOM0LESS_EVENTCHN| DOM0LESS_XENSTORE)
> >>>>>>>> 
> >>>>>>>> I would rather introduce DOM0LESS_ENHANCED_BASIC (or similar) instead of defining a bit for gnttab and evtchn. This will avoid the question of why we are introducing bits for both features but not the hypercall...
> >>>>>>>> 
> >>>>>>>> As this is an internal interface, it would be easier to modify afterwards.
> >>>>>>> How about this?
> >>>>>>> /*
> >>>>>>> * List of possible features for dom0less domUs
> >>>>>>> *
> >>>>>>> * DOM0LESS_ENHANCED_BASIC: Xen PV interfaces, including grant-table and
> >>>>>>> *                                                          evtchn, will be enabled for the VM.
> >>>>>> 
> >>>>>> Technically, the guest can already use the grant-table and evtchn interfaces. This also reads quite odd to me because "including" doesn't tell what's not enabled. So one could assume Xenstored is also enabled. In fact the wording for ``DOM0LESS_ENHANCED`` is what makes it a lot more confusing.
> >>>>>> 
> >>>>>> So I would suggest the following wording:
> >>>>>> 
> >>>>>> "Notify the OS it is running on top of Xen. All the default features but Xenstore will be available. Note that an OS *must* not rely on the availability of Xen features if this is not set.
> >>>>>> "
> >>>>>> 
> >>>>>> The wording can be updated once we properly disable event channel/grant table when the flag is not set.
> >>>>>> 
> >>>>>>> * DOM0LESS_XENSTORE:              Xenstore will be enabled for the VM.
> >>>>>> 
> >>>>>> I would make clear this can't be used without the first one.
> >>>>>> 
> >>>>>>> * DOM0LESS_ENHANCED:              Xen PV interfaces, including grant-table xenstore >   *                                                          and
> >>>>>> evtchn, will be enabled for the VM.
> >>>>>> 
> >>>>>> See above about "PV interfaces". So I would suggest to reword to:
> >>>>>> 
> >>>>>> "Notify the OS it is running on top of Xen. All the default features (including Xenstore) will be available".
> >>>>>> 
> >>>>>>> */
> >>>>>>> #define DOM0LESS_ENHANCED_BASIC BIT(0, UL)
> >>>>>>> #define DOM0LESS_XENSTORE       BIT(1, UL)
> >>>>>> 
> >>>>>> Based on the comment above, I would consider to define DOM0LESS_XENSTORE as bit 0 and 1 set.
> >>>>>> 
> >>>>>>> #define DOM0LESS_ENHANCED       (DOM0LESS_ENHANCED_BASIC | DOM0LESS_XENSTORE)
> >>>>> Bertrand and I discussed this again we came to the conclusion that DOM0LESS_ENHANCED_BASIC is not
> >>>>> the suitable name as this makes the code unclear and does not correspond to DT settings. We propose this
> >>>>> please let me know your thoughts.
> >>>> 
> >>>> To me the default of "enhanced" should be all Xen features. Anything else should be consider as reduced/basic/minimum. Hence why I still think we need to add it in the name even if this is not what we expose in the DT. In fact...
> >>>>> /*
> >>>>> * List of possible features for dom0less domUs
> >>>>> *
> >>>>> * DOM0LESS_XENSTORE:              Xenstore will be enabled for the VM. This feature
> >>>>> *                                                 can't be enabled without the DOM0LESS_ENHANCED.
> >>>>> * DOM0LESS_ENHANCED:              Notify the OS it is running on top of Xen. All the
> >>>>> *                                                         default features (including Xenstore) will be
> >>>>> *                                                         available. Note that an OS *must* not rely on the
> >>>>> *                                                         availability of Xen features if this is not set.
> >>>> 
> >>>> ... what you wrote here match what I wrote above. So it is not clear to me what's the point of having a flag DOM0LESS_XENSTORE.
> >>> When we looked at the code with the solution using BASIC, it was really not easy to understand.
> >> 
> >> I don't quite understand how this is different from ENHANCED, ENHANCED_FULL. In fact, without looking at the documentation, they mean exactly the same...
> >> 
> >> The difference between "BASIC" and "ENHANCED" is clear. You know that in one case, you would get less than the other.
> >> 
> >>> By the way the comment is wrong and correspond to what should be ENHANCED_FULL here
> >>> ENHANCED would be the base without Xenstore.
> >> 
> >> Thanks for the confirmation. I am afraid, I am strongly against the terminology you proposed (see above why).
> >> 
> >> I think BASIC (or similar name) is better. But I am open to suggestion so long it is not "DOM0LESS_ENHANCED" vs "DOM0LESS_ENHANCED_FULL".
> > 
> > I do not agree but I think this is only internal and could easily be modified one day if we have more use-cases.
> > So let’s go for BASIC and unblock this before the feature freeze.
> > 
> > Bertrand
> 
> Please have a look once if this looks okay.
> 
> /*                                                                              
>  * List of possible features for dom0less domUs                                 
>  *                                                                              
>  * DOM0LESS_ENHANCED_BASIC:	Notify the OS it is running on top of Xen. All the  
>  *                                                          	default features (excluding Xenstore) will be       
>  *                          					available. Note that an OS *must* not rely on the   
>  *                          					availability of Xen features if this is not set.    
>  * DOM0LESS_XENSTORE:       		Xenstore will be enabled for the VM. This feature   
>  *                          					can't be enabled without the DOM0LESS_ENHANCED_BASIC.                            
>  * DOM0LESS_ENHANCED:			Notify the OS it is running on top of Xen. All the  
>  *                          					default features (including Xenstore) will be       
>  *                          					available. Note that an OS *must* not rely on the   
>  *                          					availability of Xen features if this is not set.    
>  */                                                                             
> #define DOM0LESS_ENHANCED_BASIC     BIT(0, UL)                                  
> #define DOM0LESS_XENSTORE                  BIT(1, UL)                                  
> #define DOM0LESS_ENHANCED                 (DOM0LESS_ENHANCED_BASIC  |  DOM0LESS_XENSTORE)

Let me have a chance to propose a naming scheme as well :-)

I agree with Julien: I prefer this proposal compared to the earlier one
by Bertrand and Rahul because I think it is a lot clearer and "ENHANCED"
should mean everything. Also, it makes it easier from a compatibility
perspective because it matches the current definition.

But I also agree with Bertrand that "BASIC" doesn't sound nice. I think
we should keep "DOM0LESS_ENHANCED" and "DOM0LESS_XENSTORE" as suggested
here, but replace "DOM0LESS_ENHANCED_BASIC" with something better. Some
ideas:

- DOM0LESS_ENHANCED_LIMITED
- DOM0LESS_ENHANCED_MINI
- DOM0LESS_ENHANCED_NO_XS
- DOM0LESS_ENHANCED_GNT_EVTCHN

Any of these are better than BASIC from my point of view. Now I am off
to get the green paint for my shed.
--8323329-1917976994-1662417118=:3931--

