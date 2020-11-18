Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F822B7A44
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 10:23:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29633.59199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJfm-0005mn-Pa; Wed, 18 Nov 2020 09:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29633.59199; Wed, 18 Nov 2020 09:22:42 +0000
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
	id 1kfJfm-0005mO-M1; Wed, 18 Nov 2020 09:22:42 +0000
Received: by outflank-mailman (input) for mailman id 29633;
 Wed, 18 Nov 2020 09:22:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4dya=EY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kfJfk-0005mJ-Pb
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 09:22:40 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aed6da41-192b-4848-828a-e248cec2286b;
 Wed, 18 Nov 2020 09:22:39 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=4dya=EY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kfJfk-0005mJ-Pb
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 09:22:40 +0000
X-Inumbo-ID: aed6da41-192b-4848-828a-e248cec2286b
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id aed6da41-192b-4848-828a-e248cec2286b;
	Wed, 18 Nov 2020 09:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605691359;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=nxPRv55g926gqtbMY1dG5MlPIFWgfxAq1OH8EPP1KNg=;
  b=AZjt7Q/67+nEntY8ACwqrYvzNl60mT74gUGaeRhpqRs8bOmSQwD+IOTa
   QdARYCjWJGVSsLVx6YVs5UsKDS4/m0AX5yTyor4dTmzr6IsnB8jsQSsHt
   tOywkiPag6eqnWbsenYUGyeTLRDLZR8piPKOfgQ7ZXaLVMeqrCTJYHQqY
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: w7ivJZBB14JlVS6jGGeXexx9ZkbKWZkhg51f+k8lu5WQPs5Ju0M7a7pDn602yfRKR7y2q8SFol
 y1vSIzYm648bxjgfBehYTOqhDMgNZjYfioSylVJgSYbI15ivdBwuKSQYLQD6Cze1XZyCaW/qQf
 MbmQJVkSOTTmRO7HYJTvL2XZCUDXvn/cN706vNLSjy5VZ9vdvvsDKPsgW8cD4W6zu7GDq1W0Uc
 XoEVzzF1w7ZLOvD+HRt/7GB55LNX+WsQK138t2Y4O/XPnWhQRU235/e67LmhHmKIF7tv1UR1rz
 8VQ=
X-SBRS: None
X-MesageID: 31410435
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,486,1596513600"; 
   d="scan'208";a="31410435"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5WMXFvwDJTfwBhJvoeL1EnANzj63B43MpIqwIH8vEP84mXNNdw+KOvwXvHmafeAzwK3fQgjrMdC6lmKb9wkSUCG4EK0TWlH98Tum7jVbYJtds+3Xm63B/NJWXHNc739f3YfR8eVGNAypH2ZcvfHW5JFzEkaMwbDfak8mLIYX/U7dmUeJ7ilGlE0JLb3nAYXr0b7jPV1+jwR0HLnsSGvvRYlgWQ+vFWvEPxJEWSprEQkWdNOPeiYa+s/3r041SPArymQ/qB+3W0bs/ZDGjD0iloYPtbUu0Uz2s9i+1/0jBMkyNknPMmYSflcEDxdQCJPydE9gCJpPpFkIx5EIDe3bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iay9eRW/aq5QUHDL1el8fdyJak5Y00b4sZKLgBI5u/0=;
 b=dkSG08Sov1HIBOX2/988Zc+tmy9kw2u8HAemsySbKGI/3CQaviiF7mVerHzC0vYzlRaUn4W+by43YTyzaTRz9Ue6fik/AR3UBt+CPQL/QcJxK7dyyd/Qt68uf0E67ZBfrYbujsTOY/INom70I/dfaqQZl7YQFA7UJnKzyz+pPVRgg0oipb9SXFRueiEiy4kLppQDZo1o5pl77Ii6d3/ZRnyVmLM7XTIp7UF8rP6h82p+Dp9jGIO2D1e/XrlqHtOhbfas6dXBHQBY3HnIysuMuuMg5Wq8/wYhGsfiBiL4lDrwMU1kfRZlPJmMTy3/LgowcUieVDS3WHAshAfo+HFVJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iay9eRW/aq5QUHDL1el8fdyJak5Y00b4sZKLgBI5u/0=;
 b=r7R/CFv2rytMx86RnQvMon1TJbQ9ngDbKGD0A0JzFno7TmJIKlNkNfIHzxIJShhHVJu1XefN31wiUNPpaMD39+IYmHVFfK00HaMKjZK+ioSqXkFj/KAyIniZnzCRqk3ngclVblO9YT4E5Q6tERJMghJAJ3NM6LGDjrsnbn4BVdY=
Date: Wed, 18 Nov 2020 10:22:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Tim Deegan <tim@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>
Subject: Re: [PATCH 5/5] x86/p2m: split write_p2m_entry() hook
Message-ID: <20201118092230.4trcagbv3lxiz6n3@Air-de-Roger>
References: <29d30de1-2a8d-aee2-d3c3-331758766fc9@suse.com>
 <7b2b7cc9-8828-41bd-7949-764161bbe7ff@suse.com>
 <20201110135944.hbsojy6eeyw53has@Air-de-Roger>
 <d73234b0-f22e-0783-3fbe-759ccb0ecc48@suse.com>
 <20201111121730.pblsf6inot5gixfc@Air-de-Roger>
 <7f916527-9a9c-8afe-5e5c-781554d1bd73@suse.com>
 <20201112130709.r3acpkrkyck6arul@Air-de-Roger>
 <51e646d4-3e1b-3698-c649-a39840275ec9@suse.com>
 <20201112175221.GB43943@deinos.phlegethon.org>
 <40055cf5-ab16-ad73-4446-3f8f730a6613@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40055cf5-ab16-ad73-4446-3f8f730a6613@suse.com>
X-ClientProxiedBy: MR2P264CA0097.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 750a6850-5e2d-4616-b093-08d88ba37c42
X-MS-TrafficTypeDiagnostic: DM6PR03MB4219:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB42191E2E800A5D6624937E0B8FE10@DM6PR03MB4219.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gX0kKPPwF53JZxg6mrjbE8u/j1ag1pmkkqXWs2QNiMSK0z0sJoxrxoctLXHrl38yMZSxzmltE6I52Asa7gyPEuJEK0iVVMCCBkW8qGdaiiS2mfF7sh+oezCc/AV1tHBtzbAA1d0DYmV297XQQcOGOW32teyhCkMhbGTSmf5JmgIUrzYMQtOuAE0V9BrAkDk+PizZi0aAzgGaJwt0Omn4U+QQOFdmVVzIR9ryL9V43hdbnPHdZ9cfFtt8M/iIdXKYq6ogCg19+HvR2LIifNeUQLt5CveswmP47xuoHw3tkSRecrWalWJJ0+z2FFN6iDpEGNayRUrYil9dzT+eEiDQ5p7df9IIp9oCGPAiRDsDsiOR3Kz7mgwgPItp9Q1vsTnt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(39850400004)(346002)(376002)(396003)(366004)(16526019)(53546011)(6666004)(186003)(478600001)(6496006)(85182001)(6916009)(83380400001)(6486002)(4326008)(26005)(54906003)(9686003)(316002)(86362001)(107886003)(956004)(66946007)(33716001)(1076003)(66476007)(2906002)(8676002)(66556008)(8936002)(5660300002)(70780200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: kSVKwKSRfzEvB3ahrgsxqAHNzxirershW77dYYL+6mBJ3eiI7HUzk7HcpsN50cfUfUo9E9cFZkBF8hubskFkJbwGaxVWgwq3XcfvldMAGn9sMlZe/sw7nPKvZwpZDQvnLyLd/ekI1J9gGxd9lsXZXmvHtdkONcsPz6uAxJ/xf7J4LP7TlKZktKbnoaHqr3ki3BLq1cnju95Yp6XO6xwKv6Jc0/4h3GwKl+8p/bY2nGQczWikCcJoAEA5XCxXIzBrnRBjpA+EkM5c2LI6QOwfJbiqFINSpkogjT0PqxQpG4zkPQTm351Fq5s1EmFcr37yBKP2qJTcyXfOOhNTREJo/+Dhg36W3pkVACPlgj3hpSzX3eSW9xwNhZgSPXEkq+3ztHBqPsx933ofznEUiGgIkjFWsKIPiee/2y62+TqgOhQZocbT3bNmQaRlrcwCLHNcOyAAfSvevrHLwfX3jU/O1WFAMrmjsyzgzjqc+0YBR9XBbB0fD+/21Vcj4ADhnu0VtsgAMGP3OZCgw9qGqYyEdWdPHdQTBS4UAx2zM5InC6R+UMaI8xDgq31pXnDqsac5frVsa4ks/yhSwOl+sIswNa7Ctc2EEuNUA61UtYkn2BVuuuiOpET1LZZvObJJwBeAALQI7z14uryLWG6/xPvk9PjZeG9sY4DHjHdjivwmvhaas6LQTeCFgL7d+vPsY2rOIgcRmsK/jzttSvQn3PBnBJaDbn1hyvRrGiOQRmrafeDdKc82IN5nXCQCXOKrvD+DE2ttMpuPGSOKcIwrotD08SHMF9w2oQWuLgXtkTSc0OCd6BGutk8No3Gkdn+T0b47ark+zOrzF3TKVcjbxW0TAoonoUArPkH0mxmghPeU8NXbh6Hg6nFooKuwl0+RF+N8Ljq6MDYhNmz13PigAYnzWw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 750a6850-5e2d-4616-b093-08d88ba37c42
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 09:22:35.5880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GDANoaFkE0XtB8u7hEcHUE6IzPLw4jBxpDrqLh/W+lMNBl0zzeY9qGAQo7MkF46al/EAPH5zmXHoPq/6+ql7ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4219
X-OriginatorOrg: citrix.com

On Fri, Nov 13, 2020 at 10:52:58AM +0100, Jan Beulich wrote:
> On 12.11.2020 18:52, Tim Deegan wrote:
> > At 15:04 +0100 on 12 Nov (1605193496), Jan Beulich wrote:
> >> On 12.11.2020 14:07, Roger Pau Monné wrote:
> >>> On Thu, Nov 12, 2020 at 01:29:33PM +0100, Jan Beulich wrote:
> >>>> I agree with all this. If only it was merely about TLB flushes. In
> >>>> the shadow case, shadow_blow_all_tables() gets invoked, and that
> >>>> one - looking at the other call sites - wants the paging lock held.
> > [...]
> >>> The post hook for shadow could pick the lock again, as I don't think
> >>> the removal of the tables needs to be strictly done inside of the same
> >>> locked region?
> >>
> >> I think it does, or else a use of the now stale tables may occur
> >> before they got blown away. Tim?
> > 
> > Is this the call to shadow_blow_tables() in the write_p2m_entry path?
> 
> Yes.
> 
> > I think it would be safe to drop and re-take the paging lock there as
> > long as the call happens before the write is considered to have
> > finished.
> > 
> > But it would not be a useful performance improvement - any update that
> > takes this path is going to be very slow regardless.  So unless you
> > have another pressing reason to split it up, I would be inclined to
> > leave it as it is.  That way it's easier to see that the locking is
> > correct.
> 
> Thanks for the clarification.
> 
> Roger - what's your view at this point?

So my main concern was not really about making this path faster -
after all this shouldn't be a hot path anyway, but rather reducing the
region protected by the paging lock, since it's a global lock that's
quite contended. In the HAP case we could move the flush outside of
the locked region thus reducing the lock time.

Anyway, seeing there's not much consensus on this aspect leaving it
as-is is no worse that what's currently in there.

Roger.

