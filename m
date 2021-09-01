Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0603FDF82
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 18:13:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176552.321258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLSrU-0002g4-2o; Wed, 01 Sep 2021 16:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176552.321258; Wed, 01 Sep 2021 16:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLSrT-0002db-Uh; Wed, 01 Sep 2021 16:13:15 +0000
Received: by outflank-mailman (input) for mailman id 176552;
 Wed, 01 Sep 2021 16:13:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2BIO=NX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mLSrR-0002dV-Kx
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 16:13:13 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81102a66-0b3f-11ec-ae01-12813bfff9fa;
 Wed, 01 Sep 2021 16:13:12 +0000 (UTC)
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
X-Inumbo-ID: 81102a66-0b3f-11ec-ae01-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630512792;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=HvvlN/n0WnyfSJuxCS3vjmgoOHALxUs8+4ZZAxp0Ed8=;
  b=WaHU6LM8OQbM/MGhAUFoBhQITBqYf52tPMckkuU4tyZ4HRIQ666Ijgek
   ezSOEHLUlafatuLcSFq+3gZJ0PqxiAJt3L9naHNq+/US2s7S9uD81JPwZ
   eDKg76jgpHH7DcrTkItFPzM6f+NdejKWXpzJuRpbibu4Ls1pgEpqMwi7L
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: gjr09FkSY08HDDV29MdiUKT/rneNt0X7U9fFtSFhq1QEe++zSzlICW/mIUFtakzC7vxvoe8ajh
 67T8B9xtSr+LGaPLqlRXyJlcgGVZ6Ciumx1fdvbnPBgtjZ7lFqnbu47pG5lEycjTllAHZx94bH
 Vxl3NGZxwOqSMqn+SmMRZCX0Q+4m2UhthqodgOkRK7LZ/nrOuCPntC6kRD5A1VfOuMzN5G6pN0
 kn6ycrgTSiNUDG6eMtSf9f1iPRMPINEAMRxf0xkQB2wiELjJyTPHz31J4AAwVFL9QNlRPwVYpO
 SXgXxn/1eMiz8KjRoEN9S0H+
X-SBRS: 5.1
X-MesageID: 52206275
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:9huq46hoVw77GhpT+UxzAz1XoXBQXhEji2hC6mlwRA09TyXBrb
 HXoBwavSWVtN9jYgBapTngAtjwfZqyz+8Q3WB8B9mftUzdyRKVxeJZnPvfKl/bakrDH4dmvM
 8LHsQQNDSzNykdsS+Q2njaLz9U+qjjzEnev5a9854Cd2BXgqdbhDuRQTzraHGeDDM2eKYRBd
 6Y4MxfzgDQB0j+eKyAdwU4tsb41qL2qK4=
X-IronPort-AV: E=Sophos;i="5.84,369,1620705600"; 
   d="scan'208";a="52206275"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PEd3Rn+azAXta2wzmUGSDW4o+AADo4swardXmAKHmIuiy4joq8yOmiViEfUVhIq19MO2NZ0tuXrCpO0ni5/awd5OPmp4qYplWiYL26Ui5FC1/i9M4qoShUk/mO74d/Yo2nNP+2L7sL2azabKrkReNKGqE3sfDtsOfSSR/bbG17G/vhWwEdMW9w+GW7sakfCpn/ksV0TNVTlo/56Z9xUn7k/i8duOMf9gkc/yF/uqPFo5yo96mmpOHpU5CXhuRlQOlkMHfggdAGGQ+rkigAHtEegKufFEJenWiBgOdDiZRmXg0rSsBz8mGasr2bhqwIeMb6qZtlbl4shrZzSvexSDdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3gAsDWXO8sHjqoatlOYh71lPbgIcsOnbCK8nxc/AU8=;
 b=IgFaIPFwhhJiYJS0zw7CxwqvXc6aEedghCJz0kJUprOhCoDrpxnSYaGO+NFccbBMY10r7Tc6eiTI3jYLpKiP09mK09t/OveUEMsH3TihLnSc5MhITb9P2kU8DGd0a3WOQNL8cCHSkvaEAtVYVIXApVVzm66EEveMc8AO5/KIcsqAd7fHKfLtzRl+hGqSwP0LHeyeuP0ZiKpyyxHiHQ4FHlc8veRwmT+rspemna9LrmlyhhqdaNCGp3BUcPcU5TbRZ/9naGcYJi/zAAq53O7zroQZ8ualvTOsb9t+5vX+ey+y38sN+9AKi9BKTYn9K00OxSQ4eBWhQm4eZz4Dc118/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3gAsDWXO8sHjqoatlOYh71lPbgIcsOnbCK8nxc/AU8=;
 b=owP3rKZPw4jaVsu+JwbkGzp1YieXzlpvuMW1fct51/emHFMHuBr+XqrFxjleRLHZo04gEy0ckV/SlNUb3dEIb8jk+B5Rp2Za2CyQsRZvsG0ZYPRfNhEH3cH8TzxkN9ji08RCGPVtKtcZIPVgKEC03c678W5rrvyrgqQUAJEX08w=
Date: Wed, 1 Sep 2021 18:13:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 0/4] x86/PVH: Dom0 building adjustments
Message-ID: <YS+mj/mxSJCIso6r@Air-de-Roger>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
 <a2b8421d-e608-2abe-b78c-924ab0bf529b@suse.com>
 <YS+GmC7IjxoODTu+@Air-de-Roger>
 <17c5ce48-11e6-ac97-fa67-294cbb8b79b7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17c5ce48-11e6-ac97-fa67-294cbb8b79b7@suse.com>
X-ClientProxiedBy: MR2P264CA0171.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::10)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fef1be4-0fca-4577-0fbd-08d96d636379
X-MS-TrafficTypeDiagnostic: DS7PR03MB5590:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5590E145E4C8C9F44E6171138FCD9@DS7PR03MB5590.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bxJew0XlIm2AISGmCQh+bEzt+9A0LDVSwyBB9dk/uw+R15Z/jkNr7RVFkLEm67V8SShZqNRD8UsQaQVaPuqQeUmZQhk7voeSg2C+BkrX9y5CfTIjIp54/Roenp/WbP3GFtoAnt4YeoEKt1mFl4su1wuZ1JtvYwSniBbba/ombyvPRkW2FlD88kFelvGSXVl9TPHIYgygFgftPOeIGoRphRkGwgVJAxOkGWOCfUkScgNIbQjdA1pT0Bfde1dUeSbkbE7mjVDrF9cMcerEkBuyNpCK5BWnuBFGAGVTSEHQF3cC4gYs9eiK5hC2JRJASHP9KfCxX0okF3w0TLW83p8tCrRAW4lgjckabCy/LMSyGiS5bAakiveai9dM9dUNbYyI3BuUbZFOvLO8KZWPRFbjxAO0hc85taZe9+JxcY6IAHJHknlQKco3yNx2D1yMDdojAL/NTDCMCbCVxYok+4Kq7O91JFhP/ZNZKv/FLoBwXCZ1ob9VAsLRss67LEno6mhQjHopSV/3PHBsxZprzYn+GAtlrQQXc2TFOP6gnqSjZLsin5z17COlxzaK8f4QDEO6dgLT34xt1ubHBOF7I0Jab6IVbD8kmKUh5qGWFplBgy+6ghewhHMteysOFmlYenHivrs+yPSZ8diSNTyDOBoZSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(346002)(136003)(396003)(39840400004)(366004)(86362001)(85182001)(316002)(4326008)(6916009)(8676002)(6486002)(66476007)(9686003)(54906003)(83380400001)(2906002)(6666004)(66946007)(26005)(53546011)(956004)(38100700002)(33716001)(186003)(5660300002)(8936002)(478600001)(66556008)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkNwZ3RHYjdFRlljOFlZRUdEVWE5U05PTmRIUUtEQUhCSmFpbmU0ODg1WEs2?=
 =?utf-8?B?MTJ0MmVnZU9QUG5MSVZhamwyWVdiT3p2U1g5eUxBUFF1MnpuTGtxdkl2YUdM?=
 =?utf-8?B?bm5JTUpJOHpTakhEN1V3bUgxMVZLSEJPaENSZzRtQnNRRVp1VHVJeGJrcVNY?=
 =?utf-8?B?L0FEUXJUamszU1cwZk9URGlQVzhEang5Q0ZYNlVhaEhkZVRZenNDRXY5akd4?=
 =?utf-8?B?aFR4bGs3VDZRRFBiYTBMeEhhRTFJRVUzSFczei9xZkRJTW5OYzczdVNESkxw?=
 =?utf-8?B?dkRhQkRoY01wbnBNRkJSUjdFMFVpKzM3OFdtY053cDFyWmo1MDIxSit6SEcy?=
 =?utf-8?B?L29sek1Ubkp2OHZsTGRQTXF2OEt1R3UrY3BNWnRISVpPdVhTeTE4OTM2a3JI?=
 =?utf-8?B?US9TL09jOVdRREUyODA2UG1LZ291N2wzV1NocnhYRjJlYllPQ2F5WGdXWmNH?=
 =?utf-8?B?S0FjQis1UHEvMUtkZWV5d3ptWXhkTXRYc254UWUwbHk1dlBvdElWVHVtYWJ2?=
 =?utf-8?B?Y0ZxL3JmVVdNcTJEWmUyak43LzNtUmhlak1zaTkycDg4SzVkVndjQ0ZmV1cy?=
 =?utf-8?B?MjBRT0xVOFZkRGJyK2RmTjVKQUJkZmtuVUVzQk5aR3RsMXFrRFIyTUsySmsv?=
 =?utf-8?B?UWdmUmdPbU10K0wzNWdHbU5MS2xPckVkbU9jOERNQWpES1lIRUZ1TVgxeWNJ?=
 =?utf-8?B?NE00aExzRm5URk9kSnkxWXpxUFdXQzlKYk40ZnFkb2JJajBiMEVQSm5tTFVE?=
 =?utf-8?B?dTdsYWpWcS9ZUG5McFN4V0h6Y0JRU1JnTWFkZ1NUWE5yRkExR3oxQ1BvYVpM?=
 =?utf-8?B?Z0VBQW8yVjNQVEd5RVcxckVWWXJvekJmOGdrMVIwNk04YjVoaGhGajZhczVO?=
 =?utf-8?B?QlNaVHphNmYrRytrQWxXZU1BVlpRNEo2UXRGdytraUpWL1A2RGRiR29XMTlN?=
 =?utf-8?B?U3dGTHZtZlAweG4ySUJDZG1EdG9SSWxhSkEwYWtJNmgydlBBKzNsek5EYXFL?=
 =?utf-8?B?L2JVZ2IvRVZ2Ny9sVFFoVkJzYkRDL3VHVTVBM3RsU1d1Mlh1cTVBRTdIRUp1?=
 =?utf-8?B?TlZMVXpoeXFHTWZGcTF5U3diVVI1NFRib3JjQzRRejJKUHVQR1ord0xtNXNa?=
 =?utf-8?B?YWNBNEkvN1A2czdNdDk1bTlyV1NxYmFXbkF4T0lHemRjcCt4cGhXR05yYnRn?=
 =?utf-8?B?aGNreUVVeERtSWdSS1NxL2hIcFlScFpnOFFDZTZlN2xVcTg2dFJoTHc2dXNa?=
 =?utf-8?B?YWhVWnZXQU16M3NOczFZSlpLNmhxQ2FMQ2FpSlBQRW5Mak9VdkNDWTBhN21o?=
 =?utf-8?B?QVc0b2xhdU4zS0JLd0RJakY4MlNKNTFxWnlmb005enBHQWc0a1QxQkx5ejZv?=
 =?utf-8?B?cjdldU9QSE5CcTE1UE03dWFUSnltcHNNdWhQYk1RN3hRYW5ZRVpEWWtaTTd2?=
 =?utf-8?B?akx5c1lYOVpHaWtBV3VNanExNjduUHFDUE5MSE1QalJBc2Q5c1BxWGgxZXF4?=
 =?utf-8?B?MHRKUVdtczA4aWJaWDF4cUFIaDNHOFJWamF2YmpoUXg2YUo1WUg5T3BrbnNp?=
 =?utf-8?B?STNpUXNialdTcE5nSFprLzZKTUNQS2pkV2U1YUg4VTY1bWVuQ3VjNDVXY1Qy?=
 =?utf-8?B?Ujh0WDNFNVNZM202OWkxaEhyRDdibG0wYWZPajAxYm5mcGV4Z3JLWnR3Wkkz?=
 =?utf-8?B?NlJxMG1vTTlJd3pmazJYMmpvODkwRWkrdWI1b3BoSXV5RFZ2N2tSYndRMnhI?=
 =?utf-8?Q?G7DBNlaD/lAp42WXI/PE6C+vOZvk+ghIgVMrcZc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fef1be4-0fca-4577-0fbd-08d96d636379
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 16:13:08.9854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oUKrbj29RCl5yKvLkjHwtpYVs1JGH5mOMotbej5gOofsiAfDWB5WzytGyzl6Qok0rf6qDsVdSmAN/yYsSmglKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5590
X-OriginatorOrg: citrix.com

On Wed, Sep 01, 2021 at 04:19:40PM +0200, Jan Beulich wrote:
> On 01.09.2021 15:56, Roger Pau Monné wrote:
> > On Tue, Aug 31, 2021 at 10:53:59AM +0200, Jan Beulich wrote:
> >> On 30.08.2021 15:01, Jan Beulich wrote:
> >>> The code building PVH Dom0 made use of sequences of P2M changes
> >>> which are disallowed as of XSA-378. First of all population of the
> >>> first Mb of memory needs to be redone. Then, largely as a
> >>> workaround, checking introduced by XSA-378 needs to be slightly
> >>> relaxed.
> >>>
> >>> Note that with these adjustments I get Dom0 to start booting on my
> >>> development system, but the Dom0 kernel then gets stuck. Since it
> >>> was the first time for me to try PVH Dom0 in this context (see
> >>> below for why I was hesitant), I cannot tell yet whether this is
> >>> due further fallout from the XSA, or some further unrelated
> >>> problem.
> > 
> > Iff you have some time could you check without the XSA applied? I have
> > to admit I haven't been testing staging, so it's possible some
> > breakage as slipped in (however osstest seemed fine with it).
> 
> Well, I'd rather try to use the time to find the actual issue. From
> osstest being fine I'm kind of inferring this might be machine
> specific, or this might be due to yet some other of the overly many
> patches I'm carrying. So if I can't infer anything from the stack
> once I can actually dump that, I may indeed need to bisect my pile,
> which would then also include the XSA-378 patches (as I didn't have
> time to re-base so far).
> 
> >>> Dom0's BSP is in VPF_blocked state while all APs are
> >>> still in VPF_down. The 'd' debug key, unhelpfully, doesn't produce
> >>> any output, so it's non-trivial to check whether (like PV likes to
> >>> do) Dom0 has panic()ed without leaving any (visible) output.
> > 
> > Not sure it would help much, but maybe you can post the Xen+Linux
> > output?
> 
> There's no Linux output yet by that point (and either
> "earlyprintk=xen" doesn't work in PVH mode, or it's even too early
> for that). All Xen has to say is
> 
> (XEN) Dom0 callback via changed to Direct Vector 0xf3
> (XEN) vmx.c:3265:d0v0 RDMSR 0x0000064e unimplemented
> (XEN) vmx.c:3265:d0v0 RDMSR 0x00000034 unimplemented

Weird, I don't see why earlyprintk=xen shouldn't work in PVH mode,
unless it's not properly wired up. Certainly needs checking and
fixing, or else we won't be able to make much progress I think.

> > Do you have iommu debug/verbose enabled to catch iommu faults?
> 
> I'll try to remember to check that, but since Linux hasn't
> brought up APs yet I don't think there's any device activity
> just yet.
> 
> >> Correction: I did mean '0' here, producing merely
> >>
> >> (XEN) '0' pressed -> dumping Dom0's registers
> >> (XEN) *** Dumping Dom0 vcpu#0 state: ***
> >> (XEN) *** Dumping Dom0 vcpu#1 state: ***
> >> (XEN) *** Dumping Dom0 vcpu#2 state: ***
> >> (XEN) *** Dumping Dom0 vcpu#3 state: ***
> >>
> >> 'd' output supports the "system is idle" that was also visible from
> >> 'q' output.
> > 
> > Can you dump the state of the VMCS and see where the IP points to in
> > Linux?
> 
> Both that and the register dumping I have meanwhile working tell
> me that it's the HLT in default_idle(). IOW Dom0 gives the impression
> of also being idle, at the first glance. The stack pointer, however,
> is farther away from the stack top than I would have expected, so it
> may still have entered default_idle() for other reasons.
> 
> The VMCS also told me that the last VM entry was to deliver an
> interrupt at vector 0xf3 (i.e. the "callback" one).

That's all quite weird. Did dom0 setup the vCPU timer? What version of
Linux are you using?

It seems to get stuck very early (or either fail to output anything
while booting), which seems unlikely to be related to your specific
hardware.

Thanks, Roger.

