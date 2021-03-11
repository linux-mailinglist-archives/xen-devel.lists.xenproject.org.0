Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D8C337A1F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 17:55:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96702.183263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKOaX-0006IN-CS; Thu, 11 Mar 2021 16:55:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96702.183263; Thu, 11 Mar 2021 16:55:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKOaX-0006Hy-8R; Thu, 11 Mar 2021 16:55:05 +0000
Received: by outflank-mailman (input) for mailman id 96702;
 Thu, 11 Mar 2021 16:55:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0MTW=IJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lKOaV-0006Ht-8r
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 16:55:03 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9bcecb91-1268-47f3-950a-9a8b9e056763;
 Thu, 11 Mar 2021 16:55:02 +0000 (UTC)
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
X-Inumbo-ID: 9bcecb91-1268-47f3-950a-9a8b9e056763
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615481702;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/gIkKx/bC+gRtnu+EyjWFScdDRrKTbNa60/cIkbI+4E=;
  b=TjfwTVzvKUvYfNn2sBMj0jAcHj3BQwR6qzj/TLBu7lbYo3vKYakwY93q
   CvIJyABflo9k1lNfsX3Bo/fwroZPLb52zx+TLM5sRi72Y9/JG0c4f+Ssz
   lKLHRvY2C1LSL8wVoeuPTY7R5hiQDZyTu9iaTk5+Rhzj5U6Pil8aYFwNF
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: uMmMyZKnjSFEwDHlDdlcoMQyyOuufpKkK9FfHZQ0VTV9gtMSwmbLrIT9Ut6kZ5otgzoJRSmAwF
 EvTlXYV68QEy6d+aoCbUDJ8gEyjxQTJUyP9n6Dy8e4x2VF4U5orO8uiIfWuQdkVbn30gSbZvvE
 ivcijMdnDn2w/Wl6aDFjoeV6n+BW0twFza+ETWJZavTrl3Zb0THR7jTbU+eSQXXN0sqaW8JQS/
 dow+KC1cLmxBRycVzEn9K5dyv0t2+jUdF25CuFWBRK0aWdSI9Zn6WkKK0+PzOka87oKers1t0s
 xBQ=
X-SBRS: 5.2
X-MesageID: 39254916
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Hn15Ual2+MMFtnOQPLubArK696/pDfNOimdD5ilNYBxZY6Wkvu
 qpm+kW0gKxtS0YX2sulcvFFK6LR37d8pAd2+ksFJ2lWxTrv3btEZF64eLZsl7dMgD36+I178
 hdWodkDtmYNzRHpOLbxCX9LNo62tmA98mT9IPj5lNgVxtjZa0lzyoRMGemO3Z7TgVHGpY1fa
 D0jaB6jgCtfnkada2Aa0UtYu6rnbP2vaOjSQIKBwMGxWC15Q+A2frQCBiX3wobWzNLhYo4+W
 LGnxeR3NTYj9iLjjXy12rP448Tvd3m07J4dbexo/lQBzX3gAOhZIBsVtS5zUgIidDqzHYPvO
 TWqx0jVv4DjU/5TyWQmz/k2wyl6S0v7WTj1E/wuwqHneXJABYzC89MnutiA3zkwntlhcp91r
 lKwnLxjes0MTrw2Bnby/flSBluikKorXdKq59rs0Bi
X-IronPort-AV: E=Sophos;i="5.81,241,1610427600"; 
   d="scan'208";a="39254916"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dhz5sXeCQgbGDYUdwKPCtciMmoy1Fimjc2BFgVM4hwL/+Q99hX3IzyYlNacR7OMZP2i7YsWHCJdeCvFOMws8RIvLaZCXp2CEgU/gw9ZRBR02e9ogXTjCgH4A+E1tuKXmlyiQ4wluSCB2fTVYPR0OVLA2GlFq81g0Xiouwcfo2rMarmFfLJKGvHlCB73cNeImewHjKxFSlb9L5vMO1/gdlrYYnXzm1rYbchSeKOtfRClHjtEJf6I5n12TPWbEARQaPiViB7aSqS9Yug839bdWmozFr7rDoJIDr+p5NfmqHnyt25gTdU0eWJUAqqUDSRjOLo9cqvFCSaFWCIIR7k2yCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjGpfmg6FSHoZxKGbxFAs+ITC+qglhp0If7gHSlolr0=;
 b=iBoXDRnhUnBqlYEZHspynKhYphfiKP51dvcMZ0qHz81pI9MrpjXm1Uyf0j3UxppFgHkOlrfhK5oj2muqiJM4AmmWYNK6VlAfI2zJ3N1ePYve2WwLTdnSiHxH3E/evAuRspNYvZ3ZqHMXmxPrd0+GGT50IgWjAheIFIje7YzXN+I/FdysE3cUws6IBshuVpSGvg+miO7RgEssQIySpvJnzlxjfB+/lIR+pVU9YQxnlH6WlhSWmAQARoC2oWxal0Ih632jaOxm/lcFcTg3NbyC4LeH3PkmysJsLgWAaVQdNvZdt/0HOnpVbcfPjhBz31rDCmO899aC6wJh9/7L0G06ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjGpfmg6FSHoZxKGbxFAs+ITC+qglhp0If7gHSlolr0=;
 b=QOmw2yA+MWySzGTpCmOki9bMFm09UImegnHiO26ZtPKqVqhkF4wFGjtLIx4TBDepJPphQy2N6j6MdOudCmtltPYwjimaMB+EN4IFyHLXs21M5gJ30s8kNbNdqnvuwCJ11GCDJ75ZGHwbSVfOmsv+6HYTFjJvAyzbu8CB/VbVrAc=
Date: Thu, 11 Mar 2021 17:54:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, <committers@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: Remaining MSR wrinkles
Message-ID: <YEpLNWnFdDqC5y4M@Air-de-Roger>
References: <YEj39oqZA0y/af0c@Air-de-Roger>
 <24649.6523.991714.489131@mariner.uk.xensource.com>
 <78536b74-2e6e-02ae-6655-d14fd97b3d37@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78536b74-2e6e-02ae-6655-d14fd97b3d37@suse.com>
X-ClientProxiedBy: LNXP265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46a7c74e-ed25-4586-7755-08d8e4ae4f64
X-MS-TrafficTypeDiagnostic: DM5PR03MB2972:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB297299CF6FD8C1F4E5DB7F6A8F909@DM5PR03MB2972.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wsMxjOomwJ0MYK9gN0qXHqO/cObmfKbYeyc6ifi8kQ1UfYXU8zlUBdT9Wt9xmlkTkAexofvWGBvewS88ewYtGL00kTD8ciSFigaYz32ooTIIRDF8hAygcYgMQ3WgcnOtSVXNfC/WMt6mCs2ewGTgSZ6AsnOB090by9+yIaoXZwt0iA/xk3fOw6nNw1oeGsIc4zyCj0Q4QNMleZeBNll1S/C0umCRKxkUrEIWBaCfEePpV1D+KmGHbPUbRs2g21oSFQPlOvZocWhSKBOtjoHj1hGsjxZ7ECrI+z8bt6gJ0W2B33fLt5aBHlKb3PK+NR5Wo/SqmR7HJreu+2GdDYGkFlrkaMkdG7mo3IOvNpC72y6i1Wu0TEsj80EdQhDNDcIYRAOpDrcQ5fw9kgSciEahM+t7qSf18EWY4frz9bMguYRU8ZyuBnXD0+ob30puvln9mgSE9iTr2kvHliIH/KeqmBN/RfDwgdJ1jCwfuwBV31V4p6My4JO3c4SC9LYasoiw6BH+e0N1w6bpnVc7Nx2k/qa/NyaIi/mbmNxKNJa9ADzXuXEbxuRlFe79gWLR/ZNQ6uFPjIcCR12o6RCu7/jZfyBDcvKw7HOLxQOyZ/vunzY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(396003)(136003)(376002)(39860400002)(346002)(86362001)(54906003)(9686003)(7116003)(66946007)(186003)(66556008)(6666004)(316002)(8936002)(6916009)(4326008)(66476007)(2906002)(3480700007)(53546011)(956004)(8676002)(6496006)(6486002)(478600001)(26005)(966005)(5660300002)(33716001)(83380400001)(85182001)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eXl0UGk2d2lHcjhQTWU5NzVURnhOSkoyS3ZFc094ZFZJbXQ3dkE1c2syL0xj?=
 =?utf-8?B?VXM5UVp5Vit3Rlh0ekJwY2JCRmZWVVpVVFdlU2I1YVkyYTE3c3Q0YTVRY0xq?=
 =?utf-8?B?SFZOZWpUZ29Pc2Q3QVA2WmlhbUhzLzZ0TUpQbkFVcnEzMkhjNGJ0MnR0eGpZ?=
 =?utf-8?B?VndPbjFxNGs3bkVLSlJaNnNyZVQ5LzBsOEozTHVyN2Q4VEtJY1JYV1NlYTg3?=
 =?utf-8?B?a0VRek0vY1ZTT3pTR1FpaitRRTZMU2E5NG5MZDNZbzRCQjJ5NkExanE3d0d0?=
 =?utf-8?B?b29VYm1rTk5vSEg3N3hEVWR0bS9UbW9VTERtRUpCaWRhaEpTNkQxdEJaTXJY?=
 =?utf-8?B?Y1d6aW9UMWhKZDFVZFFadlN2L09DcjRGbFdrWmdvWWdlV1JUNjZ2aU9YL1VT?=
 =?utf-8?B?Rm9wTklpb1F4TEhXQk9ac3ZzSmk0RTQ4MktWN0N1M3FCaGs0WWI4SEN2YjFV?=
 =?utf-8?B?L0FxMW9GVldjekdnN0RhR25MMlFzMms2OEJheENyZVQ5RlZIRlF0UkY3a1Mz?=
 =?utf-8?B?ZnNoeENFL2dDS2Y2V1JEaWovNDBmVDNtRGo3VHUvZ3NOWUtnVmVpeU83RUVX?=
 =?utf-8?B?dXZUekZSUE45RGpYS2FyUzRvaGxsNXNwWFEyMzJ4WGhxQVU5b3Q5OHBZVFpK?=
 =?utf-8?B?Tng2dkcweUVscW1yZ295YVI4VHFZS1Z1Y2JuYWd0S2NkalhvR29CaUJJc0Iv?=
 =?utf-8?B?NVJwSENMWk1ENll2K2dtbExjcDRMVHR0cDFDRHBKUUZucFpERWlHQzR4cGJE?=
 =?utf-8?B?cWlabDV3Rm5CSnEyYlpHbm1veGcwa3FnZ09ZWmpOZFJ2RHhiRkw4NmdsRFlJ?=
 =?utf-8?B?UWxrUlNXamtHaDR0ZEZyMUNnS28zQ1VWV3lkNXYxbm5yVU81cEhXZU91MDJK?=
 =?utf-8?B?Tmw0VjlZT2VtaG8vVllPd0cveGxMSk5yTVdtY2tWRzk4SEpoMGt4eWNhZmsw?=
 =?utf-8?B?cGJJSzE2c05hUkROR0JKc1BzTmNLMDFSODMwVkVrUklpZlFVbzF2cGdrUC8r?=
 =?utf-8?B?djR3Mk02M3g3WG1XdmFhTFFDZ293L0p1U3R6d3phR3Q5QWhLL2szQXRLTS9S?=
 =?utf-8?B?Tmg0cHhNMVUyR0tSdXZJd0R6K0NDOWw1QnNRZlVhTnM0MXNTWExMcDg2ZmVR?=
 =?utf-8?B?YmtRM2FkdGlsUWJvc2xteDhuRitGT2dhMlJDZmRLSVhEdmhQNlZnaFI4TkFI?=
 =?utf-8?B?VUlndjBac0NlOVVrMUoxeElLdEh6TDlpUUtnRGpLOGVIS0w1Qk9RcjBkTlJi?=
 =?utf-8?B?S1NtMG55QVdKeHZ2eXlmL08wb0J2YUFhYmFUdWFXSGtyZ05RQngyc3N0d0Zl?=
 =?utf-8?B?QWxMb0hVNjRpSjZSYUtHL29aTjhkazRibWtCV1Bnb28rS0c0SUVYN0pzcDJI?=
 =?utf-8?B?S3NoKzNCRy9KK0E0VHBVc0RuVElvNTNPNEk2RUVjTS9PQVg1UzVJb01VR2Jt?=
 =?utf-8?B?ZzkwNDVIU2tkamFSQ09GTXFueGl5eitlaFpoYSt4elR0M3hSNERZc0prNldi?=
 =?utf-8?B?RDQ1MXRBY0liTmcwUVpjalF5bFBWQUFJeFd4UlRrb2pqVWlVQk5BWkdYL29h?=
 =?utf-8?B?d2ZNaGlGb0ozN3ZvYkRkZGdlOHJEZHZJc3poZnNFRUIxc21yb3NCMlkxK0or?=
 =?utf-8?B?RW9CcnFRQ1VEZ2FpUzJFa3Buc1gzbWIxMWdUbHRxeWcwMFhZVkV2RGJEV3BQ?=
 =?utf-8?B?eXBoZ3p2ZWlEOFNqRnBpQy9LbFp6VlNwNzNQbGIvVGdGaURCZlBkTUFJaGpD?=
 =?utf-8?B?NnJtdHlRb2FtVXB0emtuSkJsOHc1MWRJbE44V1FDTXF1NHhuMXkrZTQrbzRh?=
 =?utf-8?B?L3hGOTR1UnRVWThxZ2EyZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46a7c74e-ed25-4586-7755-08d8e4ae4f64
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 16:54:18.1287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eA5QwJV5J5aEr59/T1LRcpKID76JE+X4JJJ3YYrKuEZckQn54nOFqkIZYdXZvt69VJ0EZFLJGlcJO//Yhb/Gbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2972
X-OriginatorOrg: citrix.com

On Thu, Mar 11, 2021 at 08:55:29AM +0100, Jan Beulich wrote:
> On 10.03.2021 20:09, Ian Jackson wrote:
> > (I bounced Roger's original mail to xen-devel.  I hope it made it...)
> > 
> > Roger Pau Monné writes ("Remaining MSR wrinkles"):
> >> 1. MSR behavior for PV guests without a #GP handler set: PV Linux versions <
> >>    4.14 will use rdmsr_safe (and likely wrmsr_safe?) without having a #GP
> >>    handler setup, which results in a crash. This bug was hidden in previous
> >>    Xen releases by allowing unlimited read access to the MSR space.
> 
> I've not observed problematic wrmsr_safe() so far.
> 
> >>    Jan has posted several proposals to address this:
> >>
> >>    https://lore.kernel.org/xen-devel/7e69db81-cee7-3c7b-be64-4f5ff50fbe9c@suse.com/
> >>    https://lore.kernel.org/xen-devel/d794bbee-a5e5-6632-3d1f-acd8164b7171@suse.com/
> >>
> >>    Which all rely on the fact that for PV guests Xen knows whether there's a
> >>    #GP handler setup and can hence prevent injection of a #GP fault if no
> >>    handler is present.
> >>
> >>    Andrew opinion is that we should instead try to figure out which MSRs the
> >>    buggy Linux versions try to access and special case them. Andrew also raised
> >>    the point that continue running with a 'fake' (ie: 0) MSR value might be
> >>    worse than crashing.
> >>
> >>    Part of the discussion has also happened here:
> >>
> >>    https://lore.kernel.org/xen-devel/4da62f0b-8a08-dd84-2040-fd55d74fd85a@citrix.com/
> >>
> >>    Look for the last quote.
> >>
> >>    Another option is to document that PV Linux < 4.14 will require msr_relaxed=1
> >>    in order to run. That as Jan pointed out will also imply PV Linux to run with
> >>    a faked (0) MSR value instead of crashing.
> > 
> >> For 1. I do agree with Jan than this workaround is likely the best option we
> >> have, sort of resorting to request enabling msr_relaxed for all Linux PV guests
> >> < 4.14. Whether we want to limit this workaround to the read side only I'm not
> >> fully convinced. There's something nice about having symmetry in the read and
> >> write paths, but if all the calls we have identified are rdmsr only I prefer to
> >> leave the write path unaltered and request users to use msr_relaxed if write
> >> issues are found later.
> 
> Especially if Andrew's ambiguous objection was against the write side
> only, I think I'd prefer to go with this latter variant. Considering
> that dealing with the read side alone is sufficient to address the
> observed issue, I'm even inclined to prefer this irrespective of that
> constraint.
> 
> > Thanks.  I find your explanation and arguments convincing.  I have
> > read what Andy says in that link and I find that less convincing.  In
> > particular "I don't think we should legitimise buggy PV behaviour" is
> > not entirely consistent with our previous approach to
> > bug-compatibility and support for old guests.
> > 
> > Accordingly, (with committer tie-breaker hat on) I would prefer to
> > apply the patches from Jan.  I don't have an opinion about the read vs
> > write question, and will probably be happy with whatever you and Jan
> > can agree on.
> > 
> > I don't think I Release-Acked those patches yet so, for those two,
> > 
> > Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> 
> You didn't, indeed, but "those two" is slightly confusing, the two
> links Roger did provide are just different versions of the same
> patch. Hence I'd like to double check that it is exactly this one
> patch of mine (of which I need to send another version, at least
> to include Roger's requested documentation of the behavior, and
> possibly also the write side equivalent - still waiting for Andrew
> to come back and clarify the scope of his objection).

I would leave the write side out. Now we have the fallback msr_relaxed
option which should be enough to cover for any write side issue that
might arise later. Also you have not identified any problematic
wrmsr_safe so far.

Thanks, Roger.

