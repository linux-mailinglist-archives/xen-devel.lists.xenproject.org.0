Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5F12CFA9E
	for <lists+xen-devel@lfdr.de>; Sat,  5 Dec 2020 09:29:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45274.80802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klSw2-00056Q-B9; Sat, 05 Dec 2020 08:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45274.80802; Sat, 05 Dec 2020 08:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klSw2-000560-74; Sat, 05 Dec 2020 08:28:54 +0000
Received: by outflank-mailman (input) for mailman id 45274;
 Sat, 05 Dec 2020 08:28:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I8Sz=FJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1klSw0-00055v-G3
 for xen-devel@lists.xenproject.org; Sat, 05 Dec 2020 08:28:52 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef5f5c75-57fa-42e4-9477-e431c5981b23;
 Sat, 05 Dec 2020 08:28:51 +0000 (UTC)
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
X-Inumbo-ID: ef5f5c75-57fa-42e4-9477-e431c5981b23
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607156931;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=nAbXPK3nVMptgUPtprCki/nA5ZKt7Jm7DI5lfY9ePPc=;
  b=DMAtZpau7j3rRHHVjUcs9JAn82ZEfjA9IMK5md313UvDP3OgzBvZ2QwM
   Tk2LkDHnBl6rQzWHmrQmjO+PfDpXd1jQVBiu6wHFXrX9vgNlvSvHBFG2B
   wBQ9dASyNWkZUzhvq0XE4k6RmPM6Pi5vUV07KDsEmHMoIWD+A1CkzFmxn
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: eYwh+PWpzrUCxzctJsbE44MZ9g5neO0rDgE1/MapUWDDyJjJcDkADFBY/5UG205Xb4kbVvYDjz
 I4rgfs3td0I39Gu63LuRMDxRLGC9Fvev2q4sXWTiJRy4z2SesIces7TBxE7RPXc1WYWrwuwrrD
 Ez2FUj2wHJUiWHXQEKMGiTqHUYVMqEeKzWCM7QCr9KJZZ8SmnY3A8ymZ+UiqVdS5IS5yJhtwJW
 6fWQacRIO86MuS6sX/YCH5u6aacbQ5g3Q1HpGlO8o7bkloMdAKYv45pkdL6eicwgmCxTTsnx/n
 UAU=
X-SBRS: 5.1
X-MesageID: 32933548
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,395,1599537600"; 
   d="scan'208";a="32933548"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dAorNJtTrtqjtdkZq4+abiINL3eQcFnRaNHliSUIyD0u253/8ViKICtLaV9W6u5ZB6qRne8o31Ouk5pu/XRx1p+yvF0xaUGqDWspHo9bbNnf8TM7+K8Sviu1aNAds9nAfkx5NkkFX4rammP7wHSVvSdfj4X+aF5zjqV1jt9zZ8Ib9HZmdjeD89IRJIJYfYX6nYeZEkGodmpOrxoZ4IEZq9HqBlzYXehu5dJbvO06Y3L5h6txh31mUPebz4a0CBTNp3nax6no03Ob/PJqMVrAB3atmwaHdM/Tl0+QYiwf/w5pfjQ2GleAOr5INO/YAWJEtzd+njVSVY4oh9sHwxx+TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9fNEVGfoh0fiailX7qD0wLGaytrgfccSnKl9WE8ni4=;
 b=bWgHInKvCVxIruWrPqfIrYti3b8dj9kz40Pve1Qlagp6GmsDOpws7XDr51VNfHvMftQ93KdfMMhVEKlxshQ3JC4d+p6mRKQneT4VFA1HSp6zhBP0y9oNsvEJFjKEfcFlHJH/De/4ZlLRXram1wIuVXQufv+DT0jLTRtgwMwXCzpSGVTwY3pvm8iFmIxrYQdk2xkTXy+GNkKedTSKhob7zwhwzcXPjR8wTvvyzQySLV6R7NCCtb+IETJshZgmucfo/WVYzol9MNfkMwf6l8utiAZmu9vDSm8aJwU9ThyQxvBBUJ9OONc8fY0UoUT5BAKK316NfJVEb5W64frljFEUqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9fNEVGfoh0fiailX7qD0wLGaytrgfccSnKl9WE8ni4=;
 b=IxddIOrRAaW8F1o20ekjH5EGaj0VX0ugJZ+1o+P5tReFtrvufpQYuVOM0QnmjOB0PrFsNtERxKrQjPCvcYOFMoI7JYGCmXfqbcGswsIgo8LW/LC0zV1MqBgeS4MYEWhyen2OfEj8z9OvCcS634rbfegYtPEkXVihwQ+T8zIDx48=
Date: Sat, 5 Dec 2020 09:28:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
CC: Christoph Hellwig <hch@lst.de>, Juergen Gross <jgross@suse.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Keith Busch <kbusch@kernel.org>, Jens Axboe
	<axboe@fb.com>, Sagi Grimberg <sagi@grimberg.me>,
	<linux-nvme@lists.infradead.org>
Subject: Re: GPF on 0xdead000000000100 in nvme_map_data - Linux 5.9.9
Message-ID: <20201205082839.ts3ju6yta46cgwjn@Air-de-Roger>
References: <20201129035639.GW2532@mail-itl>
 <20201130164010.GA23494@redsun51.ssa.fujisawa.hgst.com>
 <20201202000642.GJ201140@mail-itl> <20201204110847.GU201140@mail-itl>
 <20201204120803.GA20727@lst.de> <20201204122054.GV201140@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201204122054.GV201140@mail-itl>
X-ClientProxiedBy: LNXP265CA0025.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b327aea6-b25f-4ab1-8c6d-08d898f7c835
X-MS-TrafficTypeDiagnostic: DM5PR03MB2633:
X-Microsoft-Antispam-PRVS: <DM5PR03MB263394985F4D59930BE1101A8FF00@DM5PR03MB2633.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZUyZ7OhZmf1Ez15i9i1H0YxEBaMq+v56qCt/shMttn1Wc1b37H7G1VswrDl8ED6599a8My+NrYZuKvFtjnBiya45Z6x/Y1YXRLmDpgPyZit5PGsrYlnWvrzX+rUWjlq4jmCvFw8el22yo8ENj6xYJsO6uh0HQRgqvp4YMkVx/HhElACDjMpaivFEJhD1hZNJb//RpS2R5KUGcFs5mdl2kRhG9Kq3jE5HtPZEtvX9Us+Ye9omvSx+tkodqTzzE9l5kbmxyC3xblRrwVvNs0Ss+gEEVW1JKh2qjRnPkVuH9k3sIrZPRYB0QSBsIm11miFiHZdg7Pd+C0owQ2Vc1dU4zQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(376002)(396003)(39860400002)(366004)(346002)(1076003)(83380400001)(6486002)(66574015)(316002)(6496006)(86362001)(66476007)(66946007)(6666004)(85182001)(5660300002)(186003)(16526019)(66556008)(478600001)(26005)(9686003)(6916009)(8936002)(33716001)(4326008)(956004)(2906002)(54906003)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WGZYZFR5SWNMdXM4eW9TSkpVZEYyVHhrQXdBdi92RHU0UTk0V3BRdzZnT1ov?=
 =?utf-8?B?b1BCcUNzU24xM2M3dFhSbURqMVNjbHZ2cERVaHd4ci9wbStaWEl1RjhIQkZx?=
 =?utf-8?B?bTQwamlZS0pFRjAxOWV0Tm1UMURyODVnR1E3dEt4NkxWRFNkeUc2OFpKMmx6?=
 =?utf-8?B?Q1U3YmFEL05zVExYK0Nsei9PeFk0eDQxNkhNUjFmWWIvczNXNE9OQTJrYkxv?=
 =?utf-8?B?ZXdQdHlpVTYxeG0zNTFRMVczWEJHTGpZVjc4cXJGSGRIeWFDNktsRzVKaTEx?=
 =?utf-8?B?NHFQZkY2MXV5SXVEQXAyamJNYXRmc2VwZExBMWRBUHIxMGlEM2tZQ3Fudzgw?=
 =?utf-8?B?RzR1NU5EME8rZzNoY3B0d0JNR2o2SkNFdUExTWt6a3Nhc1BuTWFUdlpFalpw?=
 =?utf-8?B?TjB2WUZEelFJL3JjUnVsc0pEYTc1Q01HM3V3NGkwcUlxSzJlbmZRNnVkQ1Y1?=
 =?utf-8?B?N1lML2dEVW5KemJBWEFDTjdIZFlRdmhkMGsyMjd5dFFqeDMzNXI0RkdWZnUx?=
 =?utf-8?B?OHNTOHJoaTQvL2Fqd3djWXZ2OUFULy9QcHV3KzNzUmtLZU9FS2JzQ3dNMGJF?=
 =?utf-8?B?Q2NUdGJWa0RJSHVwa3o1b0ovSjdOK3dGcG1IZXZnNXZLNWpyNFpwbW5qZjZ6?=
 =?utf-8?B?cmI4Mzhya2Z5L1p6ZG0wZTkzWGJtdGppd0FjQkFiK2RSZzZDcFhKdWgrMDNT?=
 =?utf-8?B?YUZnQXdUNVJId1RLeENFdnVFSWZKUU9iajRqS2kvMkl1SVFJTVFobTJSSmI4?=
 =?utf-8?B?VGcwcW9uR1draGl2VFY3MHRudFJkWVNGSjVrUGtVdkhvcmszTWhTcDBzQW84?=
 =?utf-8?B?MkpmT3pBcjlMNHVPcXBFNFdabWxTZDBhSU5hVllNeWRHNm1iTDhETEg1Y1pH?=
 =?utf-8?B?cHdKR2FWOHF6aXUzYTYxYWtPYTRwWHBPS1cwdmtVbm1OOSt0cUdBTTlTSzVp?=
 =?utf-8?B?NFFiOFIyM3JPSlFIY1BZdTI1VVBMUkllMG5aWVY0S295bzR3dzRQR21PQngz?=
 =?utf-8?B?dnIwUmxNbmhmcHNMRGU0VEhYRkhuU3krSy9TN0FERys3Y01jYmxVL3hXTUN3?=
 =?utf-8?B?MHhRZEZQOFp1MkxiaXFCNk5aT2xCUzVIRitaaTdnRHhEUkRDN25KcTdNNUZz?=
 =?utf-8?B?NEdEWU9nZWNmOVd1YWJsNHFyL1BiS2l2TTRIYlhrdys1VDRhVHptbVBBNW4y?=
 =?utf-8?B?WlkrQ0JwbEw5VGRacG00TGJQanJ3YVYzMjIrbGFpUFFJUWQvMGdtbkhZVVJN?=
 =?utf-8?B?bVNwd0U4R0JKdzFrR2dJQncwV0dVNHpFWTQyK0cxRFZoS1FhRTZpbi9ET1pC?=
 =?utf-8?Q?l/QfaI4voi81817yUS0zRk+2yWib5eDgj+?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2020 08:28:45.4539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: b327aea6-b25f-4ab1-8c6d-08d898f7c835
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A+wSMUz9CuE3zSFwWjzL3+mNlH0UNTchnLuVlNmIT8/tTrzLFGNNeUPxwrpVGfLULsJbWz8tINIqR/j220k+Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2633
X-OriginatorOrg: citrix.com

On Fri, Dec 04, 2020 at 01:20:54PM +0100, Marek Marczykowski-Górecki wrote:
> On Fri, Dec 04, 2020 at 01:08:03PM +0100, Christoph Hellwig wrote:
> > On Fri, Dec 04, 2020 at 12:08:47PM +0100, Marek Marczykowski-Górecki wrote:
> > > culprit: 
> > > 
> > > commit 9e2369c06c8a181478039258a4598c1ddd2cadfa
> > > Author: Roger Pau Monne <roger.pau@citrix.com>
> > > Date:   Tue Sep 1 10:33:26 2020 +0200
> > > 
> > >     xen: add helpers to allocate unpopulated memory
> > >     
> > > I'm adding relevant people and xen-devel to the thread.
> > > For completeness, here is the original crash message:
> > 
> > That commit definitively adds a new ZONE_DEVICE user, so it does look
> > related.  But you are not running on Xen, are you?
> 
> I am. It is Xen dom0.

I'm afraid I'm on leave and won't be able to look into this until the
beginning of January. I would guess it's some kind of bad
interaction between blkback and NVMe drivers both using ZONE_DEVICE?

Maybe the best is to revert this change and I will look into it when
I get back, unless someone is willing to debug this further.

Thanks, Roger.

