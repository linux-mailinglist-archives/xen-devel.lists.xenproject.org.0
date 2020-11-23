Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F982C02E0
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 10:57:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.33695.64832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kh8bP-0001S6-Er; Mon, 23 Nov 2020 09:57:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 33695.64832; Mon, 23 Nov 2020 09:57:43 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kh8bP-0001Rh-BZ; Mon, 23 Nov 2020 09:57:43 +0000
Received: by outflank-mailman (input) for mailman id 33695;
 Mon, 23 Nov 2020 09:57:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SOx=E5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kh8bO-0001Rc-0u
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 09:57:42 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b0f31a6-0d6b-4e6b-8438-f59cbbc32c30;
 Mon, 23 Nov 2020 09:57:40 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/SOx=E5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kh8bO-0001Rc-0u
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 09:57:42 +0000
X-Inumbo-ID: 7b0f31a6-0d6b-4e6b-8438-f59cbbc32c30
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7b0f31a6-0d6b-4e6b-8438-f59cbbc32c30;
	Mon, 23 Nov 2020 09:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606125460;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=FACOP9clLsqQRO2M9eoube6dA+RVyfetgtZuOvtMFuo=;
  b=BQLtG0QSUhKcicBJSoXjpy0EQ4TICGtsc2Z5OUNtm+QS1u2uoPVjjKlY
   Sj4P0TNw6GMV5wZW7XHxkfjy4Lyr1t6/+HY87hLQcFH49uxomYapUyOC6
   ZihV/UPfxcSx0HLZ3/Yt6/3eYW6iI+LbdiNwPLSlrqvAi/C1CCaFEhXeS
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +Qc82t5JRKzqzJRCJ+u7kUzebj3VM7I8RacvfF4bkSQ74mRFVrlLClbz/CARfa51WAXdEEc/PZ
 /QbEVxs0cJ7LfqWG8H6FfDidq7TIBTV6O4mSWuALF3ngfJOWoQhRUFbh76epx09iTcl5c8i3mq
 IFvmm+K1Dyz4kEG2bs92G2M9mGmMwI0UGneWA3VEO39R8Z4bQyKDxZh/+S8QL6EMIHRXzZVqHQ
 sDhkqpFndOwTH/c7sVw5Q3GEDYXiquHI3BCMBdBU+B/CU0pdLcrk/lcuM9RKWxZfoNGzktSb3Z
 Yeo=
X-SBRS: None
X-MesageID: 31960572
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,363,1599537600"; 
   d="scan'208";a="31960572"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiJkjNlbv5isphXqBD6pLOjy3J4UT5FXjV2MpNGgp3ysB2Up0ErUFmDtFU3VfPMef0k/Y57tTurcLwlVdP3Tp7G6+CkYlsLA4Du9SwFWw/jQAMYFd0NZq1YRa88YZfrUPr4yKrXQc4P0boiGDpVgbmTDWjkb2dG9zzQLD42MRZ3MPccACKc1WFgkw5EI2rr+0oKX9mnfERAkVXQYL6+UyvMBPPO0cd2/EcxFeWXn5arZQyN81eNJEYgfn3Mj9wfEesT1Z5lRZVb6amTXTfqoFXmkNyvLrTnkAcTNvw+6Vi/132TGjjBmCFCnNOzyIbVFmOx2E5xehSXCaZLcl8TBbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hwAq/saEr/OrWnzPV+cn/1xvxOm5C3fwrhPvbNNontc=;
 b=ALTrKs7GhprmMCnQp7QdDI9hlGnd6nZksWbr0qjNhTvdLIAhvUWKhajfxPslyRsYIugfJDcXlxYDWx6hvOD6GLNDuJc3pJYzELP7iazJpEkq/uhqh0D4SNPe6hCwZSPfZl0lbj/bDEmJ3g/chWqCEWLXzTtmfCE9PA+Wt5rPc5AofKO4Mse5N8SAcD7ea2N6rIwBcnCYFGRCq1BeoxnenhwLG8fuxY4O0SMlMQWiS8KSvnwGaBlkkDkvxzDqSRD7WB9mmZoLdK6XG0KPyupjRaP/K9DXfxirs2EyMWYTB8CcRYF3F9Z5ilaWKDL9mCqlSdP7xdGxbwzF8a0NdvGGzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hwAq/saEr/OrWnzPV+cn/1xvxOm5C3fwrhPvbNNontc=;
 b=t3joNi+0UKr9RBitbME7oXNXb59IJLL8vDyfKfANLP5iR/8YBg+PYlSrQ7bdSCY8pYLqVpZ3G20CWtvuBKIt1Y6PWbE+U4YoCamffHiqtjeg4X+ElC9relSFp9yzBuchUzzqKN9acraz88nVqEybM6iitvoqUHg8lA3x5ALSfmY=
Date: Mon, 23 Nov 2020 10:57:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: Jan Beulich <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201123095713.orfpg72r73m7f46n@Air-de-Roger>
References: <20201119155718.GB4104@antioche.eu.org>
 <20201119165734.GA4903@antioche.eu.org>
 <20201119175733.GA6067@antioche.eu.org>
 <1a50e1e2-b69c-afd6-a179-316231512004@suse.com>
 <20201120082855.5z4cibcd5djlwmgp@Air-de-Roger>
 <20201120085249.GA1508@antioche.eu.org>
 <97f371a9-00fe-33fe-8923-c247f44f9af6@suse.com>
 <20201120092754.GH1508@antioche.eu.org>
 <20904a6a-ac64-755d-d228-4c49faf66fb5@suse.com>
 <20201120103824.GJ1508@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201120103824.GJ1508@antioche.eu.org>
X-ClientProxiedBy: LO2P265CA0302.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e457a894-4116-48d4-62ed-08d88f962960
X-MS-TrafficTypeDiagnostic: DM5PR03MB3371:
X-Microsoft-Antispam-PRVS: <DM5PR03MB3371DEC7E709EFB6230246DF8FFC0@DM5PR03MB3371.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fhp68/h6a9zBmPKH1aZ7UR94h71fLNOA0mwf5Y8vgP0z8gDIxkFA9C/7SUzEVYkXeT/8UDoJNL0WBxMbzsyoI5E5b9OXz2+qI+O6/dBr2MooSiWVwOUOSWZ9VzJ+X0ln4B8JqsuG9D/GMN8D2tLli+l2izTfRWvYLextnkxiz57Ane5/8Z/PKYO+qJJiP1Cd+449GDU7RqGWkueQDh1MqynN8ze/nJoQXUJmCVZZvhBCe0JLUfUmSwJinec+kTX2ZnF2zIONm4JhGdWgQ2SstBbbyDRXpkTpDBpJTHYRvzqIHQTnG1mjJuT0y/k6BxicM+qy9FXe3U0H/zvDPJlc8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(366004)(346002)(376002)(136003)(39850400004)(16526019)(6496006)(6916009)(9686003)(83380400001)(53546011)(1076003)(8936002)(26005)(186003)(85182001)(66476007)(66556008)(4326008)(33716001)(2906002)(316002)(86362001)(6666004)(66946007)(6486002)(8676002)(956004)(5660300002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: pYDPpQ9xjG6RHXHsan0Ge+mNHWEcmp6prIS3esD5t68/Ckebwb9po6bxRHCgEJo8B9yfUKnakGtr0jirhYjA0J3mFe+tPJ1NwOP40yMWVcpyRqSu41v+J0hHTC2YXCkNKPqZR0uKzLtWgDkpyPb++eTiWFi+CcD6cvxecf1T5ZMdrd/Sj4LR76YS88ZYQ6VSqmznY/Y8oqb6WH2DPvNxMJK6DaIw+TR22+UUNL3FlpCti+CiJfJJ+WSQ6kdFqPVcBIyzHMmEXDlYMnk7bFcd8GCNataontDRqPxzzXcr47AkzDkWanwKTtsCSH6R2PA1UbavRe3WJBvskTsmNn00PJSiehMJlcEoxs5I5Vd0++BOPW37VTYeggFNeTODNe5+W2L673tZoh4W41Ll8JAbRfOi9RXvMsei8DHEpil2oGQyubKLJD9I59wej13b2hPHITCd2+MGHFXUcu3hQhyID14b19aG34ufZk/U4kDAExPzWzdMBdklekUDcY+58mGerkfr0zJ96Noocs1F6YSwSAq9aTFT8cCAjjSGafQcOci8ZK7UFRIQj7Pfn9ov2jolcDsGDi/xhdwxifNvmnlvdwNVJCFuWdtyzBPdhE8zGwin+wU+gJmXNFKoiBYVlimrTXaleVsANcnDP3GAb3MXQWj1diShU3SK+GOSuMX42bDwhHpM8plv/+DJy2d5p1ey+NcgD5Ik+XqPddZG5Rb4s27WMlRKU+Mu7UV8io5FWxbtGjZIgeIYS05z1wKGT1E0JuTae51L33el7tnrmmOUyDROo76GFfEurHBiE44MzYbWapHyh50SyhzEgj90GPUOJv7XakjPZKAl3cjNK8mlHwn7W0Lmnk8dRX6/L5FWc0t/e/3OgCVw5lUGtMhXMszYCV3EozFmS6bCH9n4bqSW+g==
X-MS-Exchange-CrossTenant-Network-Message-Id: e457a894-4116-48d4-62ed-08d88f962960
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 09:57:17.6238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1csaF3NxAtqpW+QE0glJfB4qFgZBVHjRTsORgEqFalxFE+6ENjMKTa5TwBOIwH2gL7a58UHGi//sHGmkVnFmyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3371
X-OriginatorOrg: citrix.com

On Fri, Nov 20, 2020 at 11:38:24AM +0100, Manuel Bouyer wrote:
> On Fri, Nov 20, 2020 at 11:00:05AM +0100, Jan Beulich wrote:
> > On 20.11.2020 10:27, Manuel Bouyer wrote:
> > > On Fri, Nov 20, 2020 at 09:59:57AM +0100, Jan Beulich wrote:
> > >> Well, anything coming through the LAPIC needs ack-ing (except for
> > >> the spurious interrupt of course), or else ISR won't get updated
> > >> and further interrupts at this or lower priority can't be serviced
> > >> (delivered) anymore. This includes interrupts originally coming
> > >> through the IO-APIC. But the same constraint / requirement exists
> > >> on baremetal.
> > > 
> > > OK, so even if I didn't see where this happens, it's happening.
> > > Is it what's Xen is using as ACK from the dom0 for a IOAPIC
> > > interrupt, or is it something else (at the IOAPIC level) ?
> > 
> > It's the traditional LAPIC based EOI mechanism that Xen intercepts
> > (as necessary) on the guest side and then translates (via
> > surprisingly many layers of calls) into the necessary EOI /
> > unmask / whatever at the hardware level. Our vIO-APIC
> > implementation so far doesn't support IO-APIC based EOI at all
> > (which is reflected in the IO-APIC version ID being 0x11).
> 
> OK.
> I finally found where the EOI occurs (it's within a macro so s simple grep
> didn't show it).
> 
> When interrupts are not masked (e.g. via cli), the ioapic halder is called.
> From here, 2 paths can happen:
> a) the software interrupt priority level (called spl in BSD world) allows the
>   driver's handler to run. In this case it's called, then the interrupt
>   is unmasked at ioapic level, and EOI'd at lapic.
> b) the software interrupt priority level doesn't allow this driver's handler to
>   run. In this case, the interrupt is marked as pending in software,
>   explicitely masked at the iopic level and EOI'd at lapic.
>   Later, when the spl is lowered, the driver's interrupt handler is run,
>   then the interrupt is unmasked at ioapic level, and EOI'd at lapic
>   (this is the same path as a)). here we may EOI the lapic twice, and the
>   second time when there's no hardware interrupt pending any more.
> 
> I suspect it's case b) which causes the problem with Xen.

Case b) should be handled fine AFAICT. If there's no interrupt pending
in the lapic ISR the EOI is just a noop. Iff there's somehow another
vector pending in ISR you might actually be EOIing the wrong vector,
and thus this would be a bug in NetBSD. I certainly don't know much of
NetBSD interrupt model in order to know whether this second EOI is just
not necessary or whether it could cause issues.

Can you actually assert that disabling this second unneeded EOI does
solve the problem?

Thanks, Roger.

