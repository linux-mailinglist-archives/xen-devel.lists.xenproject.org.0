Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B07FB392F6E
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 15:23:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133355.248600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFyn-0004GI-9N; Thu, 27 May 2021 13:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133355.248600; Thu, 27 May 2021 13:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFyn-0004Cj-5I; Thu, 27 May 2021 13:23:17 +0000
Received: by outflank-mailman (input) for mailman id 133355;
 Thu, 27 May 2021 13:23:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ln4B=KW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lmFyk-00047U-NL
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 13:23:14 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ea5061f-4aa9-45f8-8b17-4b9dccad93c2;
 Thu, 27 May 2021 13:23:13 +0000 (UTC)
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
X-Inumbo-ID: 2ea5061f-4aa9-45f8-8b17-4b9dccad93c2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1622121793;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=uGFEt31AlLcGiQ6k0/MJ1xX2VZ/H6EaHnQra1yn73ts=;
  b=aL00czIMpc+/07o1dV6ffcjuJh0/McP37PlO09G/puK7NebACAGGbRmz
   Pqpw5TMc8rzDYpl8sqccZTrXMcnV4Lu23rrthu3s3HWw3H1OE8qW/occp
   85efXHj/1zA7g1S0cgWjj5QmScZntVf/YRfYmUiYs2/DUCdaNB9sJsaU5
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: z4YrM1QBnMpiw+8+d0C4fVvAtEdRV15hXjUKqWvHgJfY0faxI9F2gaf9dQoC2dgjYkgg3jbgx8
 UH88B0/c3iXv47XnCIDcz8uFGTySxTIBd0M8RZ3im7lvXmRo+Y/EZTrn9ZtXFC+bBiHLHbAieF
 haBDTr54ZvZVwc3p5PIPmkUCUCeZKl0dDV39fbp8oLIdRI/GpKQyLlhulmq6k9t+Qbb1wclJSN
 1xivlrTaZK59E7x1KvAWyIENEMqRmiHd9f19+sZL6FFJNtyvz98aH/QutnJbu2NL3kpiRNa86u
 SKk=
X-SBRS: 5.1
X-MesageID: 44745403
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:FOgjIqETj3m9vaN8pLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-IronPort-AV: E=Sophos;i="5.82,334,1613451600"; 
   d="scan'208";a="44745403"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acrfl938ETe0Mb9QocAs3Lang4bMlQxxtdlB6U0GYQ0MY8m0+VgJzr7WUXfoeYK/7ghSnB8gg2cbOUDxTs0+XYIdrLNpqv14fmVoo2jBZom7wupmgupCVpgklw1ICsyJz3BmTC0CZe+3e2fRooo4gug+pZaQUY7Uh05+uwubcrS7+PGkyueT133mSUaYvwqXbcIElfyKh5T++8JtE+p0aapkO6n4pj5dC7sQ7yhlxevz3yvS04t9pdlUW1ZeJIuZNPZ5rDQ3MxfgHmbkVUcM87f0PjBdkb3ouG1KtUetsEtXhdkcFsCaj8FQTx+S/dIbBq2cqSWraHXPI3WsEswMew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWqLceelXSTusqka6is1EUFhUZE4FAj3O4kFPQ/zR+0=;
 b=DVKf/nfZABFqyBA9Hh5s5NYhVUcmqB8oGk49E6A7rH9MPdKFDn8kGjk67KcgpQjTWgfCEDz7Kest9IOehKI0ZgG0BJEyilEokiM1P3ZY/zHbQiCjWCy7YD/qWkXas/h1xm3e7UAF0Fajl0iyIyuBAHqjpmj9Wt1/0EXpKAHX2c/3H4qlzHyIpzKrqiXqcnTwU84cmVpF/zW9yRbktDEs/+s78BJwpoNeYahzZQL2vghTF8Fgl2s/XdTi55hcCY2mECFPARaGQAUFXLoLLt1L68AhPbFDLKncTmEDiFXfoqc60GmdLyQqL+eBrYDub5WnpmooGLeCjQg/koHTQED69g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWqLceelXSTusqka6is1EUFhUZE4FAj3O4kFPQ/zR+0=;
 b=Yf7s8k4JilKF3IXXMrMCY+c9sE447+MKus+LYhoRrbca6fmmmvkTc9f6ssiQ+DRFlnA0++lPMzhvxrqhoC/s6CPwt9Ocfrr18l6Fp1e7aP2hFWyZoudXfsgQxpBtZsDQvx1ycFZDNvlefD52KwSZjhQwMv5q4VbpN5GadN0DW4k=
Date: Thu, 27 May 2021 15:23:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Olaf Hering
	<olaf@aepfle.de>
Subject: Re: [PATCH] x86/AMD: expose SYSCFG, TOM, and TOM2 to Dom0
Message-ID: <YK+dNgom3cVzkcFF@Air-de-Roger>
References: <c5764274-1257-809e-a2a7-d87b9d0fe675@suse.com>
 <YK9ZXJuPk1G5SGnK@Air-de-Roger>
 <b6693807-95cb-7925-587d-1e1e2db8c798@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b6693807-95cb-7925-587d-1e1e2db8c798@suse.com>
X-ClientProxiedBy: MR2P264CA0169.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::8)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05075e69-2fc6-4c54-4557-08d9211291b8
X-MS-TrafficTypeDiagnostic: DM5PR03MB2635:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB26355B27F2F67FD83909937F8F239@DM5PR03MB2635.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S/mcSoRkwj0WVlr3ALjs28AZSVRVdVgsgwWGm5hQ2Pe9Q1L8LrZSc+dLonbQPA4rs7hAhobYYWKf4W25+jKCD5SqB+RBAVCw0qLk8FLuR8zafg4AMrcLkGT07XwFCeW+tMyqBBaSH54NLYcmOXzRnWkJWXZ+W46v0QhWRrc5gfp1xLLJDzQ+z0tImFHweeOUJ1Tm7qMKG9qDauQozkYvwI02cC5dz9zPq1bFV780F9EVxDWiexySxhPomgKuFoInAEsoMkq26d0iZY4R6j1eYX3oImfEi054zU4AcrO/5OMjLntxEvdv+2TCDQN8zudhQvwW/PR1VErXjO++vNwtf09GxEMSPb3IWcxfP4+49PU0URtH2TcVglZJvM+46r4Scncu+n9AEOT5LXBU9Zn1/NOkCB5DyxwUC9GjMs2Dom7cH52sVnGuJmSqU/r0/CiHSVGb37c4cgBlKIEZoTkBrVD08yR7APKPrHbMw5InxExPXIK2/2dC7/B+95VOrENrsKgDuBsDaU9PgIwVzhNZZH1Redjk4L6y2k+RLaEmf/QQRtB7309ZmC3zpNouJffb57gBVnLeK7WaobQFrutTwbDcSw6pHLGvCkOc3bKsd4zJHfYtuRSSwJJqAYWMMb+XaY3lb47zDSv/7kHxISQPoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(396003)(376002)(39860400002)(346002)(366004)(33716001)(478600001)(26005)(86362001)(66476007)(956004)(316002)(6486002)(186003)(8676002)(8936002)(2906002)(83380400001)(16526019)(4326008)(6916009)(5660300002)(66946007)(38100700002)(6496006)(85182001)(9686003)(6666004)(54906003)(66556008)(53546011)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bHdnaHR6ZHUrNDk5OVpBa0d3TlJ1aW9nVE1DQjEySTZpVmhhcWxMdXB3L3RK?=
 =?utf-8?B?cEk1cE1pUHp3UDhhWGRNWTJDRlRUMkUzNmVlais1K2NvenZpZnN4Vi9BanNE?=
 =?utf-8?B?a2UySVhGU0JLS1dtZVZ2ZXl2T0wvdHpvVXlIc0F2WHNJYnZZUHVXSjJqYUlJ?=
 =?utf-8?B?M1YrSm1mMU9lbDltWjZJWHJWdmFRNHRQaEg5TFZPbTBRSjBVNGVnSWdSY09I?=
 =?utf-8?B?Z2FIM3ZUL2pwMUF4TU13YXh2b1FBYnBhK1NaSjU4c1dOM1lxR2pQUFFRRFJi?=
 =?utf-8?B?ME1JVHJhSjVMNE5YdUVzd2UwcUtjeHBRYUdzSDB2MUYzakFVV1UwSDE5c0NK?=
 =?utf-8?B?MFpsUFpOeGFkQnpIbHAxZEpXaWQvM0gzRGFESTRFcXF3QlNiTTVtenFjTnIx?=
 =?utf-8?B?T3d3cWhUQ0lHcXNXRm9FR0YzRnlNSnFwejFBSTRmS3hKZWpCU0J4OUtUdzZr?=
 =?utf-8?B?ejBOdDI5cnNCVWtPZjJOM2tHcm1ocEo2NkhnQkFubnJMcEQzNVMzQU5ESFc3?=
 =?utf-8?B?UElpMjZ2VlFMZzMyQWg3bTJxcmNHdUFDditMYS9CQUdrMXFBMzlUZFhqZjFV?=
 =?utf-8?B?TlFDOXdrMWxscWg2a1BZT1lrandyUXE2ckoxK0o1STFDWEx5cS9hdTZHektp?=
 =?utf-8?B?WGsrOFVjelJiWmphNTU4NDM2R2ZYbTNRNkpjZXhPdmZJZGFnM0tFTmdGVGN1?=
 =?utf-8?B?ekxKcFZiNmxhUzVvck5iM1Q3OVhXbmdwOTZ6YnRoVlNqdWtYKy9Xb1dsYkgw?=
 =?utf-8?B?STUySXJuZVZnNU1MMnZTV042Qm82Ry90aSsyWHBvVVVsRFJYU25CeG13NFJM?=
 =?utf-8?B?YWRIY20rcXVGUWRzNnFEeHVicGhDV0FNZTg3S0xvMk1yYXhXSkR1dTlabk9q?=
 =?utf-8?B?V3lTZFlRVkdXUnRzZ2RyZFg4UTN2Y0ZCU1Y2VUF3dW4zdHJScG1wd3p1dzgv?=
 =?utf-8?B?YUZxeXdoalppR3MvNTlYSGVLWG5UalRZL1JOZ2kvK3JhSElHbkpOVW0zWnIv?=
 =?utf-8?B?V3NHSXo0SVowc1BES1owVnlLd2JTbEdWWGhkKzNIWXYyTFpla2JIdHhJTkFx?=
 =?utf-8?B?VmlHWitTZ2hRVjd2VFZRK0h4d2hPM0RvczUvblBvTW1STDFPQmJGK2VDMFRt?=
 =?utf-8?B?TmxHNjdZcWs4cFhHdHVvdDR3Ung0UUo0dDNnMUNKd2xDM0U0NWxtbFZIS3Rr?=
 =?utf-8?B?L1p5QVFWR2V3VHlBb3ZteFpOZlI5MVVRbkdMUFBPcktPRkovd1hqRzZqTEZw?=
 =?utf-8?B?aEg1UGhuTnZOR0ZBbGwxMjRBSE9VOXUzMHdUUUJ4TTRvdUhvWEVUYUNXaEhY?=
 =?utf-8?B?L0xEUGZBM28rZlZ0L2xMRXhEajU4cWN0L0hhbWMxSEhxTWkvZXY0Vm9XVXk2?=
 =?utf-8?B?cC9leDQxN1dSM1E4ZTdqcXlmYkk0RzRpSXl0aTFUd00yQTVvM3JVOHJxMExp?=
 =?utf-8?B?YjdkclRIcHpXcVhWT0wybGlTRkxrUXp4eTRBd2gxTm0wZ1NoNmw2TUdiZTNL?=
 =?utf-8?B?QlR3RFJGbDMranNaT0ZnRXRxV3RrcFBGUlhiV3EwRldWR0V5b1VXcFNXVTRt?=
 =?utf-8?B?SFFjdkRyZjFtcmk1WmkzNXArZnJrMW1URFl1cTFlckEwdFlhVFpQR2F3cUdT?=
 =?utf-8?B?dWdVR1JCUVBNQzFnQ3IzSkp2RlVwVk5uOWViSlhZU1dqVTRKbnVPUkE5SkY0?=
 =?utf-8?B?VjU5WVRHRFp3SlByNStKemFoWlJDY1l0a0ZhbDlxd1k2elI3UHNQMmxwU3gr?=
 =?utf-8?Q?HWMSJeKacYf/HGq7JlMVbBvRl64L616f6eiXlON?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05075e69-2fc6-4c54-4557-08d9211291b8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 13:23:09.2634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9mm5ie3WH62ZhWr9UBywvpRRI9DMeZQZXAgXApwI8pPvNymn/WivJTYIMazK+toIPabU8Jk00xfumt3ooWAEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2635
X-OriginatorOrg: citrix.com

On Thu, May 27, 2021 at 12:41:51PM +0200, Jan Beulich wrote:
> On 27.05.2021 10:33, Roger Pau Monné wrote:
> > On Wed, May 26, 2021 at 02:59:00PM +0200, Jan Beulich wrote:
> >> Sufficiently old Linux (3.12-ish) accesses these MSRs in an unguarded
> >> manner. Furthermore these MSRs, at least on Fam11 and older CPUs, are
> >> also consulted by modern Linux, and their (bogus) built-in zapping of
> >> #GP faults from MSR accesses leads to it effectively reading zero
> >> instead of the intended values, which are relevant for PCI BAR placement
> >> (which ought to all live in MMIO-type space, not in DRAM-type one).
> >>
> >> For SYSCFG, only certain bits get exposed. In fact, whether to expose
> >> MtrrVarDramEn is debatable: It controls use of not just TOM, but also
> >> the IORRs. Introduce (consistently named) constants for the bits we're
> >> interested in and use them in pre-existing code as well.
> > 
> > I think we should also allow access to the IORRs MSRs for coherency
> > (c001001{6,9}) for the hardware domain.
> 
> Hmm, originally I was under the impression that these could conceivably
> be written by OSes, and hence would want dealing with separately. But
> upon re-reading I see that they are supposed to be set by the BIOS alone.
> So yes, let me add them for read access, taking care of the limitation
> that I had to spell out.
> 
> This raises the question then though whether to also include SMMAddr
> and SMMMask in the set - the former does get accessed by Linux as well,
> and was one of the reasons for needing 6eef0a99262c ("x86/PV:
> conditionally avoid raising #GP for early guest MSR reads").

That seems fine, we might also want SMM_BASE?

> 
> Especially for SMMAddr, and maybe also for IORR_BASE, returning zero
> for DomU-s might be acceptable. The respective masks, however, can
> imo not sensibly be returned as zero. Hence even there I'd leave DomU
> side handling (see below) for a later time.

Sure. I think for consistency we should however enable reading the
hardware IORR MSRs for the hardware domain, or else returning
MtrrVarDramEn set is likely to cause trouble as the guest could assume
IORRs to be unconditionally present.

> >> As a welcome side effect, verbosity on/of debug builds gets (perhaps
> >> significantly) reduced.
> >>
> >> Note that at least as far as those MSR accesses by Linux are concerned,
> >> there's no similar issue for DomU-s, as the accesses sit behind PCI
> >> device matching logic. The checked for devices would never be exposed to
> >> DomU-s in the first place. Nevertheless I think that at least for HVM we
> >> should return sensible values, not 0 (as svm_msr_read_intercept() does
> >> right now). The intended values may, however, need to be determined by
> >> hvmloader, and then get made known to Xen.
> > 
> > Could we maybe come up with a fixed memory layout that hvmloader had
> > to respect?
> > 
> > Ie: DRAM from 0 to 3G, MMIO from 3G to 4G, and then the remaining
> > DRAM from 4G in a contiguous single block?
> > 
> > hvmloader would have to place BARs that don't fit in the 3G-4G hole at
> > the end of DRAM (ie: after TOM2).
> 
> Such a fixed scheme may be too limiting, I'm afraid.

Maybe, I guess a possible broken scenario would be for a guest to be
setup with a set of 32bit BARs that cannot possibly fit in the 3-4G
hole, but I think that's unlikely.

> 
> >> --- a/xen/arch/x86/msr.c
> >> +++ b/xen/arch/x86/msr.c
> >> @@ -339,6 +339,19 @@ int guest_rdmsr(struct vcpu *v, uint32_t
> >>          *val = msrs->tsc_aux;
> >>          break;
> >>  
> >> +    case MSR_K8_SYSCFG:
> >> +    case MSR_K8_TOP_MEM1:
> >> +    case MSR_K8_TOP_MEM2:
> >> +        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
> >> +            goto gp_fault;
> >> +        if ( !is_hardware_domain(d) )
> >> +            return X86EMUL_UNHANDLEABLE;
> > 
> > It might be clearer to also handle the !is_hardware_domain case here,
> > instead of deferring to svm_msr_read_intercept:
> > 
> > if ( is_hardware_domain(d) )
> >     rdmsrl(msr, *val);
> > else
> >     *val = 0;
> 
> As said in the post-commit-message remark, I don't think returning 0
> here is appropriate. I'd be willing to move DomU handling here, but
> only once it's sane.

Hm, OK. IMO it's fine to move the current domU behavior here without
fixing it in the same patch, and do the fixing afterwards.

At least we would have the handling all done in a single place, and
you are certainly not making the domU case any worse than what
currently is.

Thanks, Roger.

