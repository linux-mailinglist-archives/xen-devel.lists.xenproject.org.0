Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 098A2393529
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 19:52:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133613.248981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmKAb-00064e-Kj; Thu, 27 May 2021 17:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133613.248981; Thu, 27 May 2021 17:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmKAb-00062J-Gf; Thu, 27 May 2021 17:51:45 +0000
Received: by outflank-mailman (input) for mailman id 133613;
 Thu, 27 May 2021 17:51:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ln4B=KW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lmKAZ-00062D-GA
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 17:51:43 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02ae2b51-a4c0-4b52-a49c-53f4d5fec426;
 Thu, 27 May 2021 17:51:42 +0000 (UTC)
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
X-Inumbo-ID: 02ae2b51-a4c0-4b52-a49c-53f4d5fec426
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1622137901;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=RplwToqZnieUaG74kOJgoIkY7Bw1MiVGskyzvpop7V4=;
  b=c/LSWVZmlaJWGM3/GbFOAoTa4YF4t286RzvmU+nDXJAbd50ZqObhCuUY
   iXVQIwd8HNFD/tWmWbeGDn+/Ffs43/RNWR68EbXUDRslTUklqzkyTPUfa
   fLiC3euGLYo9gdX0NcvJWYUItXKZEMgvkgJJms9yqVgPgqb7gcTCNCV+V
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: E9n+5l5F/+uGWeVPM/fSAaBoea4ywLTRw4UOQO1DZAmVtuOXDafXpqlbfVRA/PRKy6imIaZ7K/
 9jXFazRmAmW/towMU4u+nMjFwqEsTFy52xtUQa7mgQPJ+ctSRbx58qYgZKU/TwMv79ZOyo6yKH
 Lutp4UDDGQhEKCA+JzY5aYP3LFfX2foptPbnFY/ioY4FAh0uWm+wzEbChd/NI4Dz5ceuW6g1Xs
 r35NRLCPpTSM0Ma2nVjob9pZiysMOuzgQic5dRZZIWxE7Soq+7O/EwT/ZA/ngJfK+JKxGXtKRS
 M9k=
X-SBRS: 5.1
X-MesageID: 44773758
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:q5bYt6DKO1G1+DPlHelW55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZAmPHrP4gr5N0tOpTntAse9qBDnhPtICOsqTNSftWDd0QPFEGgL1+DfKlbbak/DH4BmtJ
 uJc8JFeaDN5VoRt7eH3OFveexQv+Vu88qT9JnjJ28Gd3AMV0n5hT0JcTpyFCdNNW97LKt8Lr
 WwzOxdqQGtfHwGB/7LfEXsD4D41qT2fIuNW29/OyIa
X-IronPort-AV: E=Sophos;i="5.83,228,1616472000"; 
   d="scan'208";a="44773758"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WBWWRWf7a5dRszMN1saMfbfvqYWDMculWjSlZmO/7WTEvA/BJWtBj3Q6aQWXPrCbWfCkw3c/qQ8og/6AdDY9aVsJYaj7oR7MVL/bOC/lGCneip/NVQDOuRPZxWvnypKhUATMIJSEL5E6TTrCfNq99H3n+1GZIk8vlYw2zJNQP5xwakUyJHUw1J7PanzJnfrALDIFBWyVWlJZJiQaFbwc/9V+ABStEmZmya2UYOZ4iTWyMiD02U3hCDK7sBKpptdvaG/5XGkzRHfnP38QkyILl6UFFmxBTUvpsJ/1ERmPGi/+9K+ZwGuRsPk2fvza88clbgJ7Tnc1NH+RBZlgHtsxwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXk/lIH67X4AS0ZicYstO/5YdJ2JQuV3H4o1mIQpy9k=;
 b=Dpno08pgCNchkPfsKMV2P9AO21nLJncgW5yrfjBtPazYnPG2jHYw33u35mi25lYg0SWLBmxCvYWuFLzc3otHDUn34hB6fkTt6xwAxWT4pCb3Nn91OCOjLMXB1x/8V6tjllOwEAbTgu6EW1dKr+V+7NOqr9br44wAnpZWZThb3arUicXLMYDJw0kO44xfT1H9GjFFiz9aRmOnTl6F+kd6U6L4Hgp983vE3j8DRpHkWDNL8Qc236LTayWzzR7zjI+IpQctMkjt4k+yRSZnkLDda55uXsaP2CICAptwZNUvrmiL1d7YCIb1ldlrtIi1RjFtyB61bUoHYb/8ZAvw956k4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXk/lIH67X4AS0ZicYstO/5YdJ2JQuV3H4o1mIQpy9k=;
 b=OtwJdtkB//RaRemWNhy0b58WaDGkiiW2zF3CY1paIW2BnHIuWc5klVu0OsPrmgwqPxBNcsil23npUNb3vnUk/mIiJ9eaIzSv6fgO8MqWKlGk+XHgWk9FzEeDrPb1AvVKugrxudRGr0xUmNiMOtyIumVWRxV+C1gur761ANcsJso=
Date: Thu, 27 May 2021 19:51:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Olaf Hering
	<olaf@aepfle.de>
Subject: Re: [PATCH] x86/AMD: expose SYSCFG, TOM, and TOM2 to Dom0
Message-ID: <YK/cJM2fpzSq77Gy@Air-de-Roger>
References: <c5764274-1257-809e-a2a7-d87b9d0fe675@suse.com>
 <YK9ZXJuPk1G5SGnK@Air-de-Roger>
 <b6693807-95cb-7925-587d-1e1e2db8c798@suse.com>
 <YK+dNgom3cVzkcFF@Air-de-Roger>
 <ca774a12-c054-3383-5f38-2c09b66be681@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca774a12-c054-3383-5f38-2c09b66be681@suse.com>
X-ClientProxiedBy: MR1P264CA0078.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d245ae4-d9dd-47bf-799e-08d921381397
X-MS-TrafficTypeDiagnostic: DM4PR03MB5968:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB59680B4B8C89FCD548B1B4468F239@DM4PR03MB5968.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oj/X7NJQAJimJpSQwsIre7TPEJ3tTaNjG5t8BtxnTn5FBwhC1tDfn+2ckCzOEcuuRuvoyZ6KEi5ws/yqTWMKR6SQfVLB1DZTpQptYWGe28XAYMOXhszuYKAV0OB5d4h57fYuJDJzoJ2dOqBFtG4sy3DCybxD/2XsViaWDw+b12Ylraf22kqjZ0R4gceTlq642eocHjMCq4YlxM7Dc7ITtDQ3QIoyyDItddFDzxDFJCtnBsywklYIpZq0gz206adWNcifmh5hgkVpLeZwzPcp9Nhb4pNMmhFG+w2Y2d2vRR5mmLA/eUQzmMAEGH+YU+A2l3+lPhvUY1FvOxu0PjAOI+FaxqMLEJZF9cNoYTEIvcGCwO9mjpjWfZHez/v/qVf1GgtkGgffzHpGVh92/gn5Xp5a//LUEW2pONdV/rpnpAfa9IR8iyDnMCJOuAFNczJLhm1vXyrHe9s0OafHSVO67EeEX6d7oI+xBDo2jx+f2MOiHKR90D6Nlp2nS6REwU+8wm+HRk0ODQMHxovY5W1xrdl3E2Akwo5c9ndogWu9AefOgbOKSkY0uKc6dm7ABZtIJYM8skePFcr9p+ODnNFlktap5nEU70Ym8aTT/PHK7aU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(38100700002)(26005)(85182001)(186003)(54906003)(9686003)(33716001)(8936002)(316002)(4326008)(8676002)(86362001)(6666004)(2906002)(83380400001)(6916009)(66476007)(66556008)(6486002)(6496006)(53546011)(66946007)(5660300002)(956004)(478600001)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TW9kNWlpb1g4RGgzVFlJbFhwUlFlQjJQTmVCb3VkdUFmbU00bDcrTE9CdEJY?=
 =?utf-8?B?WEhDK3g4Q2VUbUFzd0xzR3h0NGU0a2hTTlZoYWVKUDR6aTN4NHN2Smk0cFpx?=
 =?utf-8?B?dm9kT3BuVXExZk51RXJ2RHA0eXpuS2prZTN3c0FFcVhrclpXa081RGZMd2pC?=
 =?utf-8?B?dXpUTENYK0VvQytELzNhbHd1L1hzR3ZKcmgrOXdJc29yNnA2TVZ4RzY2TEp0?=
 =?utf-8?B?dDhUS0wxR3hIRUZQUmNWRXp6RWx6bk5iRFdVWFl6b3hVSG5hc0RYUzN3c2xK?=
 =?utf-8?B?dWRLa1plK1R4b3JjVEVKZThLeWMzNTV3bXZqd2IzbE9IU3BZeTVFTnlFQlJ6?=
 =?utf-8?B?SUJuQ1VaRkxGbGxraDVEbHFaZ1Q2b3hYb2R4SGdMbHQ3c1dxQ2t4RS9zZlNp?=
 =?utf-8?B?QVZIVzYrYWRrYWo5dncwcDFoMm8wMmEwL2pGbTcrb014Y3Q4WGdtNTJCR1B2?=
 =?utf-8?B?WWprQiszSVNFRjBIdmNTTFNMaWtKbmVYczZzOGRjUHFka1N2VzMxTk5wWTdX?=
 =?utf-8?B?ZXNGQ0FOUEpuckZ2QWFGcUFMMVl3OHpYWVZRbWRpdFdzWWM0ZmtqY1puNzJn?=
 =?utf-8?B?UkNyeXZVRHFkdTJNckRKQVNVSmhYeVU2TkFLWW9TakdXRDJ2cnhCNzlMNDZo?=
 =?utf-8?B?elEzZ1pzMWFjcHRmeDU2RHJqRDJpdFRBUHF3Yk0vQmtQUDNNMURhSGs0SEN2?=
 =?utf-8?B?NVNuYnB0SDhqcys0L0dVZHhqeGp4NW5UeEFQenRyY0tOaVcxUkNzN0tsTzhY?=
 =?utf-8?B?OFNER1lsSmE2YWVRRHNaZTlKMGRuZzdvSUJ1c0lnUGFFR1J5MjFGVjJnVjkv?=
 =?utf-8?B?QysvdVBBcEpRa2F0UFBMY1BOZ21yL2xaZ2k3NkdHbDRtTnF4YnlSWVBnTTZR?=
 =?utf-8?B?Q3VKRG9ZOUpZdW5XR1JJZ1BwTlJLd3VRMEVtV2tVT3FEakQ5Q1ZCQXNlUnFY?=
 =?utf-8?B?bEk3RlFmb25YTU9ZRzlsMi9zc1F6K09CQVVNWm9uOFpFWENOeUF1bm45bmlL?=
 =?utf-8?B?OWdYT05iWjdYVlBHSVhacUgzQStmTEhvdEU1ZkhxbDd1NGRjQkVYOUozeHh3?=
 =?utf-8?B?aTR2NDhDYitNenQwWGpRMzlMS21Ka21YczdjVGJZNlVIenBoSzErOTZvanp5?=
 =?utf-8?B?dEt4eTRuQzR4aUtROG1POUN1TWVyRkQyY2NwdTNjS293RXViRUFoVUovd3Ja?=
 =?utf-8?B?azhJM1FXd0Z0RGsxU3VScHArMXhaTlhkNElMT3E3MWN4N0t4TEp0cEtGRGFG?=
 =?utf-8?B?ZEo5V2ZZUXZoWHZxZzdzSlpDeU5Rb04zMk52TnczQkVIMThlWVA1U1d1UmRH?=
 =?utf-8?B?dXFkWkpIS0tKQitJMElZWUZMdmcvSmx3UEQ5cHVjN2RRVXNxYk1WZkV5dzA3?=
 =?utf-8?B?S0twZXFkb1VGWXdvY014R0VRUWpHK2h6UnlBMTBiV2pKZGV2SytldTNRZnVG?=
 =?utf-8?B?UGZaY0N2aVYxamdyN2pnREZpMDN1YVJQQlRFWWNnRFFmRUM4WVNJZGZDanUz?=
 =?utf-8?B?UkpaYnJGM0VGRWdya0F0N2ZjTUFOV2RiWlVMU3Z2TXcrSnF6KzU0eWhTaXAz?=
 =?utf-8?B?ZTBkZnF4YmdNOWpLcjkrNWJhcmVkSHAvbmhiRDVjMWgxcVo2VmRuMk9hRndU?=
 =?utf-8?B?emhFMUxOd05IRHg2eWkxWDZGZU5lYzJMOWZ3ZU9ZcllJS1BjdWlNbjJadmpn?=
 =?utf-8?B?b0x3QWgvTlloT0dqanUvcFVqdENZakt6MnNrN25WTUF3bHBtYnVhVXFlRkh0?=
 =?utf-8?Q?eWePM2BwKfIjpS7TlErZOCjjHrOH0XMSYFAwPIL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d245ae4-d9dd-47bf-799e-08d921381397
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 17:51:38.1330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gyhaRP6djQHn2c9HhIcCL9qXDWGKXSVKvVqb58ev1j6yQd87uquqnWgbK4dUBEat8u3/IjrbQ8E/xxUeZvs1tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5968
X-OriginatorOrg: citrix.com

On Thu, May 27, 2021 at 04:57:04PM +0200, Jan Beulich wrote:
> On 27.05.2021 15:23, Roger Pau Monné wrote:
> > On Thu, May 27, 2021 at 12:41:51PM +0200, Jan Beulich wrote:
> >> On 27.05.2021 10:33, Roger Pau Monné wrote:
> >>> On Wed, May 26, 2021 at 02:59:00PM +0200, Jan Beulich wrote:
> >>>> Sufficiently old Linux (3.12-ish) accesses these MSRs in an unguarded
> >>>> manner. Furthermore these MSRs, at least on Fam11 and older CPUs, are
> >>>> also consulted by modern Linux, and their (bogus) built-in zapping of
> >>>> #GP faults from MSR accesses leads to it effectively reading zero
> >>>> instead of the intended values, which are relevant for PCI BAR placement
> >>>> (which ought to all live in MMIO-type space, not in DRAM-type one).
> >>>>
> >>>> For SYSCFG, only certain bits get exposed. In fact, whether to expose
> >>>> MtrrVarDramEn is debatable: It controls use of not just TOM, but also
> >>>> the IORRs. Introduce (consistently named) constants for the bits we're
> >>>> interested in and use them in pre-existing code as well.
> >>>
> >>> I think we should also allow access to the IORRs MSRs for coherency
> >>> (c001001{6,9}) for the hardware domain.
> >>
> >> Hmm, originally I was under the impression that these could conceivably
> >> be written by OSes, and hence would want dealing with separately. But
> >> upon re-reading I see that they are supposed to be set by the BIOS alone.
> >> So yes, let me add them for read access, taking care of the limitation
> >> that I had to spell out.
> >>
> >> This raises the question then though whether to also include SMMAddr
> >> and SMMMask in the set - the former does get accessed by Linux as well,
> >> and was one of the reasons for needing 6eef0a99262c ("x86/PV:
> >> conditionally avoid raising #GP for early guest MSR reads").
> > 
> > That seems fine, we might also want SMM_BASE?
> 
> That's pretty unrelated to the topic here - there's no memory type
> or DRAM vs MMIO decision associated with that register. I'm also
> having trouble seeing what an OS would want to use SMM's CS value
> for.

Right, I think I read the text too fast. I don't think we do need it.

> >> Especially for SMMAddr, and maybe also for IORR_BASE, returning zero
> >> for DomU-s might be acceptable. The respective masks, however, can
> >> imo not sensibly be returned as zero. Hence even there I'd leave DomU
> >> side handling (see below) for a later time.
> > 
> > Sure. I think for consistency we should however enable reading the
> > hardware IORR MSRs for the hardware domain, or else returning
> > MtrrVarDramEn set is likely to cause trouble as the guest could assume
> > IORRs to be unconditionally present.
> 
> Well, yes, I've added IORRs already, as I was under the impression
> that we were agreeing already that we want to expose them to Dom0.

Indeed, I think that's fine.

> >>>> As a welcome side effect, verbosity on/of debug builds gets (perhaps
> >>>> significantly) reduced.
> >>>>
> >>>> Note that at least as far as those MSR accesses by Linux are concerned,
> >>>> there's no similar issue for DomU-s, as the accesses sit behind PCI
> >>>> device matching logic. The checked for devices would never be exposed to
> >>>> DomU-s in the first place. Nevertheless I think that at least for HVM we
> >>>> should return sensible values, not 0 (as svm_msr_read_intercept() does
> >>>> right now). The intended values may, however, need to be determined by
> >>>> hvmloader, and then get made known to Xen.
> >>>
> >>> Could we maybe come up with a fixed memory layout that hvmloader had
> >>> to respect?
> >>>
> >>> Ie: DRAM from 0 to 3G, MMIO from 3G to 4G, and then the remaining
> >>> DRAM from 4G in a contiguous single block?
> >>>
> >>> hvmloader would have to place BARs that don't fit in the 3G-4G hole at
> >>> the end of DRAM (ie: after TOM2).
> >>
> >> Such a fixed scheme may be too limiting, I'm afraid.
> > 
> > Maybe, I guess a possible broken scenario would be for a guest to be
> > setup with a set of 32bit BARs that cannot possibly fit in the 3-4G
> > hole, but I think that's unlikely.
> 
> Can't one (almost) arbitrarily size the amount of VRAM of the emulated
> VGA? I wouldn't be surprised if this can't be placed above 4Gb.

I would say it's fine to request such big region that resides in a BAR
to be placed in a 64bit BAR and then be put above the 4G boundary, but
anyway, we don't need to discuss this now.

Also I'm not sure how big VRAM regions does QEMU really allow.

Thanks, Roger.

