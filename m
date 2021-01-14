Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DFC2F6110
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 13:33:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66981.119203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l01oZ-0006Kq-RN; Thu, 14 Jan 2021 12:33:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66981.119203; Thu, 14 Jan 2021 12:33:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l01oZ-0006KR-O7; Thu, 14 Jan 2021 12:33:23 +0000
Received: by outflank-mailman (input) for mailman id 66981;
 Thu, 14 Jan 2021 12:33:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D7Rz=GR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l01oX-0006KM-UD
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 12:33:21 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efb92614-6d7c-4f1b-88bd-def19c4627d6;
 Thu, 14 Jan 2021 12:33:20 +0000 (UTC)
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
X-Inumbo-ID: efb92614-6d7c-4f1b-88bd-def19c4627d6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610627600;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=SZTJqyf51UHRC29AEYtZhg58QScikzYHLHboQZbGea4=;
  b=CUlL9ouyq2zjaE+HDoc0ZNnMn4/hlSAYZcV4uapys2lL1ntmG6e0d2Hg
   yCqTba0CkttJIplAa0TwEM9VmOG885ZJcIe3Tatbu4RDM6DiiBog2vp3Q
   CmnjmTApHVyuny5zvIu+We64FG3aM1eV/yNeH2xqzg/bi3px90bvAt882
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: c0JsIoHgW1VcNuNQPvhOEY9Tpu0KfaOIcHCij6oO3vkdK1svE+noLz1igdcEat2gZ/qw7YgQ4c
 iG3h52iWHXKLvVzqGksOwLzCMJ5gTRPDA8NAY3vbYBmtix11uvGbfAnJT7ewzqHmJZuFI0Y5Sy
 0IKmRA5NWiLIxJTEgMH9HjgH2gYozwY09WPsOXnq0uLCyFfADwvANtyQajIXDTwuBGvSt7tW58
 VaR5UEHKBnjPEzThaI5T9AYggF6sSfO8ZzDS/IRb9Kgqf4e3w6WSZKoiYFsOCbAotnww9SxP+Y
 GSY=
X-SBRS: 5.2
X-MesageID: 35449205
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,347,1602561600"; 
   d="scan'208";a="35449205"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LLrzogwEHjm/FACkEs7m+wcwjY3wezmYMYKazHBFTBP6451+5jrfrI143TmaTxXA6MLs2uZSbsBddnjL9CgkU3lGiJwCXcaoNYCUFdNwv+rKuKgcKprnowD/I+FswanUznAcH633SaUOtu1APQHOKtikRmkC81YfeSCpwafejM0T5j2dPZEIFdtDJMF13lT5njqmBw1dS8KRchPKSj4tmDWOXk0GPCiZPc3YJkKcJQER3ygXDS3nASevPbbegP5nQyugJABcvCqk9CxwKy5rsNrObjPa0DMnGwN5/mRzx5rZjFppURKNao7sV+QGir8pmeyDYhIkjTV0ccMASIt5rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVSKPH8TnNPlKmdU1/6CQBgQzGKpe/o0zQe31caU5UQ=;
 b=m7j1DrCMD99E5Eem3G91NFhhh4baPwdltkM4jcylA84/QRe6B61+Q5QLxid3RA2HlHNza4v39BxpXd2dsgj8+4mJ+udIp7h3v1CEnt6Hs3nyCpliyAU6gX6WvgS4y23y3upEV5hWo0lgJlVBlG3Fk+DrFYjCUl3pVaN3HHnBY74aLfIMoavWC6pOU/LIT9D0DOCfN7+grO1rSPHcYFT8KhWPvJXxhE+6clfFYilwpjWZPHTRUIyFq/ikeMBKjjfjpfPd7gYICV2iL3ZvB1OakCz9kSeNYZ3dV9KdI+g5dy3VY+5AIllz4CegSs066uxUg/NZ0vYeduBZfOkkMnHsPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVSKPH8TnNPlKmdU1/6CQBgQzGKpe/o0zQe31caU5UQ=;
 b=W69U6CHgf0qqFofuOSqCY8SOaB7ul2M7/oAXagsdgcLZR6t9XdmOvq6zkvHBhB5+QPWRwWcRRWD8JtomnPppyVXxiH4YBdGqsszaNzkNBjdyFNXKvCBZldy5ALDER2i/aG7ppVETcYNBLU4uC6+t72fyU13AeaojQyagy7/GKBg=
Date: Thu, 14 Jan 2021 13:33:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Tian, Kevin" <kevin.tian@intel.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>, "Cooper,
 Andrew" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Jason Andryuk
	<jandryuk@gmail.com>
Subject: Re: [PATCH] x86/dpci: remove the dpci EOI timer
Message-ID: <20210114123307.aq6ysxggevzfyvwr@Air-de-Roger>
References: <20210112173248.28646-1-roger.pau@citrix.com>
 <MWHPR11MB1886695BC900030C025DD09A8CA90@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210113131100.p5xiyfgtp5s5rktz@Air-de-Roger>
 <CAKf6xps-GOMSsYzDHf9wgyjDes0X4hnaq9vBsn02rCv-DadW8A@mail.gmail.com>
 <20210113180558.do2xq4iaur6kyuy4@Air-de-Roger>
 <CAKf6xptFiFdh=Uwbia-6BOpB4_qO7h1PCST4WT-0BXTygssFaA@mail.gmail.com>
 <CAKf6xpuTgdpqBx7AR8QUA8nJgn64X9ttZns2aSEcwjjvzqw_fA@mail.gmail.com>
 <20210114102205.ferwl6y7idooqy3y@Air-de-Roger>
 <ecb3298d-39f1-183e-6ef6-2771dc3f79cf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ecb3298d-39f1-183e-6ef6-2771dc3f79cf@suse.com>
X-ClientProxiedBy: FR2P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57b59842-e6cd-4a2d-0780-08d8b888904c
X-MS-TrafficTypeDiagnostic: DM5PR03MB3290:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3290A628BCC7ACD203BBFE388FA80@DM5PR03MB3290.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LDCVdRCoEruowg9vEHaRPXupFxuuHm4huGBiX3gJnwGheGQnEOPja/pduN+3m4+rDX83aWW8YBEllKsVhCV4b3WNai16jrp/efPwoka5eavDE8hNZoPHqcXlti5gwjJjjyBKdoaXQ5Cas6BHaMbVYishw+swDHtGvBkvEwxE8/w6w3slaXIDz6Q5JD40XU0DMzm6Ej0Aevi8TDnnhFttZioG6yLGN7ZH5u2VusKJk9mxLoOpyU1cBAOrRCQqKyPJcmlDFR5NHAk/me+ozT37zf6OmDWMWBYwdcfNgAeTwhuYnCDx/4qVubm4L/vSGrqAFKaa/1Md1yOvXf/qd1B3M2uivpyFlAf05JJkSAPvcoCybcuuLFUqToJEiDmGyODhuiUbhSQN1ElL8Yg2EaAfKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(1076003)(956004)(53546011)(4326008)(85182001)(26005)(8676002)(5660300002)(6666004)(2906002)(8936002)(6496006)(16526019)(478600001)(54906003)(186003)(6486002)(66556008)(66476007)(86362001)(316002)(9686003)(6916009)(33716001)(66946007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R1JyTkwyenMrWUVXVjN1MVB5S0RtZEs2RGxVV1NRTS95U0Z5T1R6WWFvVi9I?=
 =?utf-8?B?Q0NRL0JJaUhuSzR2a0tMTWM5dzJYaEcrSWFwa084RnZrc0NNZjRvUWs1eFI0?=
 =?utf-8?B?NUNyM0hOMiszajNzTkRMWCtHOGxETWRiWVdLb3FyWjlNdkNoUE5WNDQyQTJ4?=
 =?utf-8?B?K09PYjFjaGVIQTI0djFoU1dQTEptNzFvd3JqdVZJMFBtNHpPRHZzaDlPcURW?=
 =?utf-8?B?VFRINXRuUHFXSW5kZks1d3FRQnBFZzh4WFRLaGNKdGc5d3lDOGRMN2pvNUU4?=
 =?utf-8?B?RG1UNkExM0lRZUsydHA1VGpoS0s1M1Y3T3IwTXhucmNHRFFvV085TkIxWlNn?=
 =?utf-8?B?NjhCMk8xSXNwK21sc0ZVaWdwa1c1YkFkR0dRc0dHNndSRUtWYm4zR2RvZnRq?=
 =?utf-8?B?aVJ2Vmh4ZUErMG9rN25SRk1hSmVJNGlLdXJGNStJNTRYeTBGWHFtcjRFRHRI?=
 =?utf-8?B?T29meDBIVVh2bWhtTzBYUEJlVXhtSFBPU0RTR2h1U05BSjc5NitBWlBQS3E1?=
 =?utf-8?B?ZUlWenNWSUpzQmczeFNtcGNrVEFxVktVdXl4R3RQOEVwcGs4WWFGNVE5SHUz?=
 =?utf-8?B?U014OXAvL29zSEo2WW9TY1hWeVd6UDdGRkxJL05WZmlRMng4bFhhVmRzS2hV?=
 =?utf-8?B?UUpGMWZkZE5udTg5OEkvcXFPdGRwWXBZTTEzTUZaUGE4TjFkQTY4QWNSMlNv?=
 =?utf-8?B?V3VWaCtoM0JzTDhZcFR1bFhmQVdWWWtlNXpJd0lBOTc5YUdTQWFpeVhpZjZq?=
 =?utf-8?B?dnNJRk1zaHQ1c0RoZHVVS2tDSWJycW1WejNJQWxnaTNycFZaeUxKRjV1Ukhq?=
 =?utf-8?B?Q3kxQlBLNUJ2YytTN29zQnVFNzBJVTlLeXVmYWVDR2YyY3RqeHBEOHBRVDhl?=
 =?utf-8?B?dXlaQUxMejI3KzEwMGJaa09BdXUwZEFrYkIwa3VXcXlUSFVndXY1NVNValpz?=
 =?utf-8?B?UlliemQvbWxLS25ydHFTN2YxYWF6ckJ6c3QyRjJtY3VPZkg0YWRzKzZrMzBD?=
 =?utf-8?B?Qng5MDR0S0FvNXBuU0lFdTBSTHZSU3djNVNVR3doWEFGeEZwdVdQMjNLZUIw?=
 =?utf-8?B?U2s4L05hS09LNjlhU2JReE9JMzV1RnRIdk1WOE8vSE1WNXJUMmFFc1lKTFpo?=
 =?utf-8?B?cldQNTdPVHlVOXIza3hKQ2JuTERMVjlPNndQQjBWT21pUGZJNm9YcTJQU0ZV?=
 =?utf-8?B?MktsZU1Haitwa2xhdWg4NjZrVytROTVlSGRBTXl0T1dPVkQzVUZ4Y3J5OWEx?=
 =?utf-8?B?VytONnQ1Yld5S2xGSGhJQVRGNU82c3hlTDJyWW45VEdJdHBiMEE5TjE4ZDBR?=
 =?utf-8?Q?Zql4Ne3iW0tNnGnpLOj3mrCWc/2Z5UXR7W?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 12:33:14.7844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b59842-e6cd-4a2d-0780-08d8b888904c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kAWbyxKK5O0J/Q7kpx8tNs9FnKmSm0aI0IBJHYUzQLetEq3GaZAfxmoOetzUJcgG69HUUjIUUHk6LbyN++w8ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3290
X-OriginatorOrg: citrix.com

On Thu, Jan 14, 2021 at 12:45:27PM +0100, Jan Beulich wrote:
> On 14.01.2021 11:22, Roger Pau Monné wrote:
> > On Wed, Jan 13, 2021 at 04:31:33PM -0500, Jason Andryuk wrote:
> >> On Wed, Jan 13, 2021 at 1:34 PM Jason Andryuk <jandryuk@gmail.com> wrote:
> >>> I guess I'd also need to disable MSI for the two devices to ensure
> >>> they are both using the GSI?
> >>
> >> lspci in dom0 shows the USB xhci controller, iwlwifi, and e1000e
> >> devices all with IRQ 16 and all with MSI disabled ("MSI: Enabled-").
> >> The two linux HVMs run with (PV) linux stubdoms, and the HVM kernels
> >> were started with pci=nosmi.  Networking through the iwlwifi device
> >> works for that VM while a mouse attached to the xhci controller is
> >> also working in the second VM.  Is there something else I should test?
> > 
> > Not really, I think that test should be good enough, the issue is that
> > we don't know which OS was seeing the issues noted by Kevin.
> 
> Why a specific OS? Isn't this also guarding against malice?

No, I don't think this protects against any kind of malice (at least
that I can think of). It just deasserts the guest virtual line
periodically if the guest itself hasn't done so. It will also attempt
to EOI the physical interrupt, but that's already done by the
eoi_timer in irq_guest_action_t (which would be the part that protects
against malice IMO).

It's my understanding that according to what Kevin pointed out this
was done because when sharing a pirq amongst different guests a guest
can get interrupts delivered before it has properly setup the device,
and not deasserting those by Xen would get the guest into some kind of
stuck state, where it's not deasserting the line for itself.

TBH I'm still trying to figure out how that scenario would look like,
and why would just deasserting the line fix it. On the vIO-APIC case
you would need to forcefully clean the IRR bit in order to receive
further interrupts on that pin, so maybe the issue is that switching a
vIO-APIC pin from level to trigger mode (which clears the IRR bit)
should also deassert the line?

Thanks, Roger.

