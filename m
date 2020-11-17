Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0292B5B81
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 10:06:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28810.57929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kewvL-0001WX-5y; Tue, 17 Nov 2020 09:05:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28810.57929; Tue, 17 Nov 2020 09:05:15 +0000
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
	id 1kewvL-0001WC-2m; Tue, 17 Nov 2020 09:05:15 +0000
Received: by outflank-mailman (input) for mailman id 28810;
 Tue, 17 Nov 2020 09:05:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rcuG=EX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kewvJ-0001W7-99
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 09:05:13 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 68dbd055-1b1a-4c05-9070-af20e6ad1b85;
 Tue, 17 Nov 2020 09:05:11 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rcuG=EX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kewvJ-0001W7-99
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 09:05:13 +0000
X-Inumbo-ID: 68dbd055-1b1a-4c05-9070-af20e6ad1b85
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 68dbd055-1b1a-4c05-9070-af20e6ad1b85;
	Tue, 17 Nov 2020 09:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605603911;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=I6V3IFZPZ0tgcXQy4GN+Z6LIOsDCEQWL4NBeeSvTAbM=;
  b=ccaeFqngaZH7u1HW3F/87+0J3N2SZpfbtNjbfIgKsNIs70ZZyx3Zo8iw
   pdWc8PBRDjCFqHdlZYYhPClQclgMHKYkRYVt9yu4GFuAd45d69cx9r9NJ
   nSvtWfIAd9BBoc3Ef8qsKT6nJv74cOlHI/lgPt2tzIiZIiKDEZb4Zp3Sv
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HcPHcS/Lcbx6n68FtFrO8mXlYvZFzzOYm/yes6ZLrtP38OhcOPx2+0SCfS2sy7/tbzldzLfkzt
 nx+gwig/47V2ewiBb1TvFBYl3gzZYefah3RvBkNPMyu0TLoSskpdVj03Ek4YSbNa7E8aM9hpEw
 fmUVLHs5ERURCsqt/ljQUWh5b9z4RynKZVWqQeFOntMDwY4lzxjBq5PqOiwDP60qwahW5XZZTV
 XIcidg3T5bUA5YvHwQMjurAXSNlXdqSPcrKyi03yGqmT1nimRlL9Zo69T8G/olZUvafWGnoKVm
 080=
X-SBRS: None
X-MesageID: 31661718
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,485,1596513600"; 
   d="scan'208";a="31661718"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=atN7j9XJk3tB6tWxBd2p2iMSSUlKnX7mpMk0/FbNLYWDWR522FBiysleuMCJDdj89p+V5upEuY74oWk4nBH78/9AYPin7ZL7sMgzwdRlWAwM004wMtjQjE4bzQ8n1/VuwtGtgarWKtGte40PCDNhN+hExW4tPJLUAyQsYvG98+klWHBVQrXfdANx5Athjr19vh/AxSHLLOcWQSnOtjT5UCyf9aO6PdrTn+YRR7KTJVUXO+HvyignWhCuXG73aqKP82ke0iKl9otzJ+LA3DDAn9VKhot251s4h4gwtrhtgPQ3Vvnhd6MGXvXUJ8G50LJYt9EWowPdHVaFz26KGnQ1vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6YdC8A8tj9JNAjiSUIsSjQHIdlAHYWeca/gAv2iKGk=;
 b=bxyha9D2KDo7wr61WgHjE8uD71UF8sagBs8Y2WAIJ8G3XJQu0O1wbbMek2HVVLXTdXRbfAcenN9gB05jxduMUQq/HxW1hohaMbAmKNaBBt8O+Td15eDL5GQ7J3qjxwb8OxKghmLkjq9+GJy+j2qSypBbJyBhS6pAnnRS5MRLdopNOiEUaQ97fsgCqXruH7xJEik+YcVnc9k0X1HLO7ZDRQi6yJj17OFBfFvucYA8S06I/mlLSvMF/6dyxarpUAxktm9q2R31damFclG2DcNojHOrLmjbaFIKOaHYUcOA0BPwqrusCIzuqpRhxwSrISUy4OzekVeltWq8OTcXTEpwmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6YdC8A8tj9JNAjiSUIsSjQHIdlAHYWeca/gAv2iKGk=;
 b=g39y2yz5lQ8/NcXwQA9kQNSNGKGyKsLUkM7OZmfbIRjIMfA5Pzqr0VHY8OVdKPWZcH5laifAaJCIfCUI5VmmLSdCH0SJJU3PfYbvGnNN/76try7F4kNuqmKOYaw/fcVmG+biYzDjwBuN9eyD8NwBNZyo/n5NubLI2EIcT0eH/24=
Date: Tue, 17 Nov 2020 10:02:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: netbsd PVH dom0: xen clock event stops
Message-ID: <20201117085448.2haekgpbcspwmqja@Air-de-Roger>
References: <20201115174938.GA3562@antioche.eu.org>
 <20201115182416.GA30231@Air-de-Roger> <20201116182211.GS840@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201116182211.GS840@antioche.eu.org>
X-ClientProxiedBy: CWLP123CA0145.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:88::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1600e786-68cf-4c2a-8639-08d88ad779a6
X-MS-TrafficTypeDiagnostic: DM6PR03MB3580:
X-Microsoft-Antispam-PRVS: <DM6PR03MB35802955606949F5465E4B948FE20@DM6PR03MB3580.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2FuLegZML/WxKaR/A7IXUNa0YCNYFLThftaYQ38juR6tS3jUITTlOwFySEQAZSBwN44qd38JmJkQFbk4gpgJ11D+6ehnt81AXN7rrSkA6Ise8ldN+moW1p+lbv8YKc4uz7fem39kYlmndVgpqbx9ehhMOljj2XBV1YHRWWKzvy6DncJn5R3ACq4YKLaYST+1rUko8GpTDApQqx+wvEUNpZD1te6aztIsuUy+CUC92toyduE7sKMVe1X4tQOxjCDOqJJPxMyDOS2PR4Xi+fH9pq4CRTXC8O179lvY4nkiGrMfkwgSZEh9V3Z/jA2yXr6rCfeq6ZG4bztfEwTIyuwLCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(396003)(346002)(376002)(39860400002)(136003)(9686003)(2906002)(83380400001)(6666004)(85182001)(1076003)(6486002)(86362001)(4326008)(66556008)(66476007)(66946007)(6916009)(478600001)(186003)(8936002)(16526019)(33716001)(6496006)(8676002)(26005)(956004)(5660300002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: K7aCeq26uPHOrFoFNh/Gnyj/1lu0gP+qbI3FgWKr49viWze1Pn/ja3bVg1h8+kDIMOM3b8MSZi6MWJ++afs92H1L/+ezX49/1Pd8ZSTV0UZLBreZv9UD1R5mscfYFSZGgCh+/7sJ8ic3MwvUnWphBt+bhgZbpob/ebQ46nPdeTnn6JAWBMw5b/m6jpJgZIc4PTSNIKhZWL9RFqO9qlwYZEFFUDtsEB2Xd352lyfZpED+TNdRfGC30pxNxyCSLwRe4+GriwuDGA8n73WCFc8UldTCpv8TH9Psg0nY6GTGN3YcJ/vG8WKxRfiUtkQ6zI+P0HzhawhyaqbyJbpnwoVXRTycWkrhl8ElOZCHqPC2hQIzz2KcyqG0oKC3cdHzdl1XbyGP5ZGNI6TV6MLn/STOlsP82aIQzcKaIJM7dOBHag7HQ+2rRZHPmaIyJeMoCzOXKzH7m8k2Fh+98cxXpKCI/AMqvGWdqjboTxh4wwzY4nBbfYQWUTFU/MzY/2vVd7DmDg6IxnLMyXpbxuYTn+ghsp1Lrc8cIur5GTCZdl2nPYpBT3ki9623spFsHfDMVoyeDYI2ZLGGYDG35gTRuugFrCwIgi9jB2xNe48AEN+izEeW1zIy38HdmOQIHmy3VtQZ6dL80k96+sDQv+TlncKV8DhRfvYG0Veph/b5UDjRc9OQ8E+YHTDbnphaoK3KT826ep8I0ASlcfeDE2RmOq7usFuB9BbR/qklccbgeNn/CIvNtbTKXXjo/t/p8BIYNEaKxMMtIfqPLqvqEBQcU1PShJWHbMJcABa6FPorO3A1Tqm+IgeGxpk9r3yY7u0SdXG8UAoCEJWQse489qKv7unaHr5OYj1NDFPDmq/MAQusa3GzeMg9H17E0VAWGEGr2jdcYtV13JDVAeidG/2cbQEqcw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1600e786-68cf-4c2a-8639-08d88ad779a6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 09:02:13.7817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mo9YdprKkD2O2XOi9DjxSX56wpsf4zqrsORPtXtk4jBwRkGHlQzMjQEH431zrVpbG+0HR0eCu8O272/RFAxB+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3580
X-OriginatorOrg: citrix.com

On Mon, Nov 16, 2020 at 07:22:11PM +0100, Manuel Bouyer wrote:
> On Sun, Nov 15, 2020 at 07:24:16PM +0100, Roger Pau Monné wrote:
> > On Sun, Nov 15, 2020 at 06:49:38PM +0100, Manuel Bouyer wrote:
> > > Hello,
> > > I spent some more time debugging NetBSD as a PVH dom0 on Xen,
> > > With Roger's patch to avoid a Xen panic, the NetBSD kernel stalls
> > > configuring devices. At first I though it was an issue with hardware
> > > interrupts, but it more likely is an issue with Xen timer events.
> > > Specifically: virtual CPU 0 stops receiving timer events, while other
> > > CPUs keep receiving them. I tried to force a timer rearm but this didn't help.
> > > The event is not masked nor pending on Xen or NetBSD, as confirmed by 'q'.
> > > Others events (the Xen console, the debug event) are properly received
> > > by CPU0. I don't know how to debug this more at this point.
> > 
> > You could try to use dom0_vcpus_pin command line option and then dump
> > the timers using the 'a' debug key, this way you can see if CPU0 has a
> > timer pending (which would be the vCPU0 timer).
> 
> thanks, this helped. This was a bug in the NetBSD kernel, which would show
> up only when there are enough physical device interrupts (which explains why
> I didn't notice it on PVH domUs)

Great! So all interrupts are working as expected now?

Roger.

