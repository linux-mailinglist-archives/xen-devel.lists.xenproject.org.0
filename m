Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3DB313324
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 14:20:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82861.153222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l96S4-0001eu-86; Mon, 08 Feb 2021 13:19:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82861.153222; Mon, 08 Feb 2021 13:19:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l96S4-0001eV-4A; Mon, 08 Feb 2021 13:19:40 +0000
Received: by outflank-mailman (input) for mailman id 82861;
 Mon, 08 Feb 2021 13:19:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=atCq=HK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l96S1-0001eQ-TJ
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 13:19:38 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50bd079c-3295-4a88-9812-3a292d555968;
 Mon, 08 Feb 2021 13:19:36 +0000 (UTC)
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
X-Inumbo-ID: 50bd079c-3295-4a88-9812-3a292d555968
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612790376;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=GAdXufS+KLlvQJv/WZCnx33EJabByXdMoyrmOQ598Aw=;
  b=PsbG6hihINq0yE6WpKniLy9axqXe/5btKRW1QLULOjAwwtwNUiArr3D7
   hbiE/iTyXUOI4hwEfDdv+oXen3dI9S743f587tdfGI9kxe53ZF+RLOAeN
   7pYe+7kh/eXH/8mxoma0sQYQcAXI+2Q1q/hxru3RM/yJfYUgn+N9F0Eg9
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: CzNSBcy1REGjVGrIsJAxSyz1R8VXG9ExyALxSNh7SQavjoIJlTx0XggtyIfzXrbaidRyBBjX5f
 PUNGjHKkEPi4aTIU3Fs5Cy3VQoaJjTf0ariEpAEYH+oW68GujNVId18paHLGj57XnjE1wMhqGv
 45ztj8yk6T+tvDoM70D4Nqay3y9MT7ffiLGIRQkpeOeBwGpWmA4j9M3mXfFpW3wx/Y3ZJIgK9C
 45LZDH2V71Hs8aRcRvjuCDJY2Z57Mr5RIQwOJQZyVDRu7oVChHBrQXAdLC0l6Z6109Hz012sG7
 NoU=
X-SBRS: 5.2
X-MesageID: 36765489
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,162,1610427600"; 
   d="scan'208";a="36765489"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DVz6PznaE3RTymjN6t2GZYjw//5j6yTM3bIFfdjcP9/fBIF8atc+0r+HiLOH84hEB0ik3py7mJ4dQMLhrgSuR6J4fiCbMJftAbEuTJJGNB2ye0MVZviiqThlDgu54mFh0t1Mqa9WT/hszXMSWpBcu2s5AasIHnJ7Z9CfwuxTiDlwGdLDTpMCSBAWiBk2WdEuUnjj1ZMsXX4am16vqBMiKeQbaLp+Q7VrdfaH0nBVfSS0Bv4H2AZpsjb9aL1mCZzG6ZUJTwsy6UJkO7ohqA4yoidjO2emQFFIEi/mKIG6ZgOGv3Owl5FfnYIhvm81yjlrT2RgVEy9H4bPFD/4wHp3mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tV/26+qgpw3p+QQ995YyObvTlk8eaguLbR203PlOHrw=;
 b=ZABxf0UxZrsYIHYUlezTheiuMYAfHJfNjoZDk80KLNrNUtYfJHtua5iJQt5DU5RcKv9Yd+e5psDrNgd3OGLimFMFPTORL5Lt97PPvRMjN4JZ9vqk5K2f+eXiP/hjeAhNg17zV8V1PVuzGUR7/Z/Nk9ymrvfI81IFBWqVnzn2arhQK8lAB/ICKbJqe4hbXZO7V0W7C+/CZS4j9UbQOXcMwfOM2qTZ5YHanQ9LIFGENS6OJBsgjWLtSmGMatpn7Cgor1NorO2z1qHZpWSU5CLUdsoO9AyWL1eN6qRKU0eXVsatTrpIARtjrgjHql/WM5WMSZNpCV5Yo/j4OCWaDxL/iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tV/26+qgpw3p+QQ995YyObvTlk8eaguLbR203PlOHrw=;
 b=X+mHgXdHnb7TCSlNB9e0xJU6PjiwsZhpmuD3JZl2h0/hpO2qhaGI5RpXvZSd23YmQ788ODWXb+gM25uXoDqdFJziTJ3qNd8b9MztdzKLKF0TnDheLxln4olXA3eOy1y7rLLpjgIunYR2csAYqzRuqudeLcSFV3vn+CePPSQ0mkY=
Date: Mon, 8 Feb 2021 14:19:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Claudemir Todo Bom
	<claudemir@todobom.com>
Subject: Re: [PATCH v2 3/3] x86/time: don't move TSC backwards in
 time_calibration_tsc_rendezvous()
Message-ID: <YCE6XlA14A2Qsq8H@Air-de-Roger>
References: <b8d1d4f8-8675-1393-8524-d060ffb1551a@suse.com>
 <80d05abb-4d53-3229-8326-21d79e32dfe4@suse.com>
 <YCEGshHDEH9bJU7y@Air-de-Roger>
 <ae8d8e02-9d2e-a26e-9321-cae0640a0dee@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae8d8e02-9d2e-a26e-9321-cae0640a0dee@suse.com>
X-ClientProxiedBy: PR1PR01CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f34633b-f2c7-4357-6a60-08d8cc342c5c
X-MS-TrafficTypeDiagnostic: DM6PR03MB4300:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4300CB6A4BF920365371E3E68F8F9@DM6PR03MB4300.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: muPCv3eVfXtxcKAjIJCAPnpDwykAMARxr/6nKuPJ1dbVlRjlQevo/eaULqWvs/f4G0nI5s3UgR4lrqu+YXTdemJXwBDi0j+vufDGM3Qkec5XTtSNvoZObcXV1rjzrKxIr3+2yENLa+apIIjYGblMzC05AzYmD46ddNEt6osMWkjxiwXkTp5UpKjDA3w1lfQgkSZKu82GDYzNmuhHm1eiKUk09YePzTswlovpqiFCzzBls9HGXbrh1bD7c0Ag4kMz+bFOKAHyuZBEJKYMkVy6sDJ58L9zSy08yrcy3gxL4x8n+td6G3+tGjXaidFDkGixrQplNtAgeOGCj+RBD2UDmE08j1+xrfzH9UKcSK3BxTKfCqgW5FcY3hJ/q7fJG1rdIE/KMxRdkYAKkpBVvvEadlbB+LKWRdUG+3heGTQxLn9TPRXP5iLtHzNCdgAn+iGN8Y4/KGftwnpoysMscBXt3DOfO+chUiZIyYFQAo7+PszeJ3zUFF9ljHXcaKLN/Vzhqy2bvp/C9vpOh6d6rXm3rQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(366004)(136003)(346002)(39860400002)(396003)(54906003)(6496006)(316002)(66476007)(66946007)(5660300002)(8936002)(2906002)(9686003)(956004)(6486002)(86362001)(66556008)(6916009)(85182001)(26005)(186003)(4326008)(6666004)(33716001)(478600001)(8676002)(16526019)(83380400001)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UTE5WFNESjhKS2xXNGwybVRiKzI0VW5sclBYdGNZR2lFWXpKcFNqdDBtY253?=
 =?utf-8?B?WEo1ODRLc2Exc3BCN0haOUhMVXdXVmhoTmdIUDdDZThNSTdHSjFrQTBhbEgz?=
 =?utf-8?B?c2cxYTh3SVlVeTFsVzhCNXJyQkh6djloblNTODV0QnFKcmZtdW1ERFBIUXVR?=
 =?utf-8?B?S2hQemo2enNHNWdzRTdjRFV3dnVSbWEyRzN3UnVJRFNwYjZNNlZmcFdUQjFu?=
 =?utf-8?B?VHEwZmhnYkRGWFBrWmI3Wjd5eWl1aFJuR3RhRzJGcnhVNXRNQSswVDkxSk45?=
 =?utf-8?B?NkxwN0JabmpBTGdzaTB0dTh6eitaT01LOEZzNHdkRDhoaHhsb0xzVGJOODlS?=
 =?utf-8?B?YzNzVEM4UzZXUzBZUFdFRmxMaWJJcXhzd3JWeXNaVWhQcWorajNlbHJqVGhh?=
 =?utf-8?B?cXlXRTZYSW1NaFRtT2tsQnIzVnE2U1gyaklHTUJJUzRZNXNkUW5kRWk4R0pt?=
 =?utf-8?B?Um00cnY3RVJLalMzNXZldXIrTVlMcVdYNlJ4SGF2eWxsZkhRKzF5MVdreXJ5?=
 =?utf-8?B?cjdVSE5hR2Z6cnJXQ3NVcVc2aXQvMVkydWlwbWt5R3ZQd2JqcStsMHdFdWFP?=
 =?utf-8?B?YVA2d2d1UFU5ejI4bVhVdHl6ZkpHZGJSaDVrR2FnbjUwM0cvSDFQY0FMa2VZ?=
 =?utf-8?B?QVJHanRxYUtCZ3IxdUMwVlpGWVN5V3Y2SmJ3akJwMWpueC85RU56TDZqZ0RY?=
 =?utf-8?B?VEwzOUdYTitJRW9nRWV5N3NKMDRxNW0xTTVYSW8xTlBpdWFIeHVTYjB4S1Fi?=
 =?utf-8?B?MVAxa25EQWtzT0YrcHZGWDkvN1pQOWtLY01IZEw0R283U21OYUJQZWJyYTFI?=
 =?utf-8?B?Y3p3dThUay9OaHRKVUdTSEs0OTlQWDNZZEVVcGRTLzh5ays3YWpHaHlRUUlG?=
 =?utf-8?B?UzdiYTJENWt3dkhZemRJYi9OZmFBM0VLM1NOVUs4T05wendZNHpIcHFFNDV4?=
 =?utf-8?B?N0JCbVJ5enhhZGlkcEVsZWo0anh1YjYvUmRuRk93QnRoMHltZlVUTm9BN2Z0?=
 =?utf-8?B?TFBDT3I2a280WEtlK0RyU2hyTVBGL0V2VndKOHNSQzlwOXFuY3ZUWEtHMHJX?=
 =?utf-8?B?VmRMUjgvdG9NT2tXWUY4YkdIUUtxaG5wQUFjZ080NXFkbU1oQTBnWVU5Ky9B?=
 =?utf-8?B?RTdMS0lMQjR0cUdreE1YNm1LalBHOU91aDJPN2ZKVU42NTlLSVlzVUdaOFRC?=
 =?utf-8?B?bTNpMWdJWU9QTlh0ZnhuTnFCU08wamdwcDZzNlliRENXcXdJZ2I3TmFsQ0tJ?=
 =?utf-8?B?SSszNXFsT0ovT1lYTGtNSnVUcEpDZC9TTUltZ0lCSEV1ODAvTkszcmpOaUo4?=
 =?utf-8?B?Tnh3dnhEK2wwQkYxRnljbkN2eDdLblBMK1R1VVYrWGtLcUoycXY4ZklXY1hh?=
 =?utf-8?B?YzA2R2szWnVSZUxpMkpENVo5cHh1T1FPdDJ0bkx1ditBeGxGdWM4dFlnQlVN?=
 =?utf-8?B?T0wwV2JCQ0FoK1hRK3gzeXRFT29ad2Ixa2FXMmxrdEVPUWFLWnh3K21sQnR6?=
 =?utf-8?B?SW1WRnY0cjN6Y1ExK0M1YnVxWVJZUnJKdjhVUjRPYWtYM3dyS2plZ21hWmtT?=
 =?utf-8?B?Umd6V29POWNhUmJEMDdTbzR2QnQ1WjNMMW5QbmtVVHIzejhxWTZNbEJyaWpI?=
 =?utf-8?B?VDljQWcwdmpwdzRGSFRranlGS3ZqbGhvRytTUktaTlNnRmplUy9uS3BYTDVo?=
 =?utf-8?B?dzU1L1JFMjRSeEUwU3BQYVJCSUVsbkI4UWdoMnRGMFN5Y08weHh6OXJycFlH?=
 =?utf-8?Q?MkXHaF91DU6Z41rh5BCYTZIlBPY6u8wvA+c8TEG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f34633b-f2c7-4357-6a60-08d8cc342c5c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 13:19:32.8908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WrLjVJOSkztHDdQb24jD7ioTMV9RjCORNkN5/n2fhz6kwfRhJuPnlE4hJpi8OhAWk80vxOY+VV1xM1uBBy69eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4300
X-OriginatorOrg: citrix.com

On Mon, Feb 08, 2021 at 12:22:25PM +0100, Jan Beulich wrote:
> On 08.02.2021 10:38, Roger Pau Monné wrote:
> > On Mon, Feb 01, 2021 at 01:43:28PM +0100, Jan Beulich wrote:
> >> ---
> >> Since CPU0 reads its TSC last on the first iteration, if TSCs were
> >> perfectly sync-ed there shouldn't ever be a need to update. However,
> >> even on the TSC-reliable system I first tested this on (using
> >> "tsc=skewed" to get this rendezvous function into use in the first
> >> place) updates by up to several thousand clocks did happen. I wonder
> >> whether this points at some problem with the approach that I'm not (yet)
> >> seeing.
> > 
> > I'm confused by this, so on a system that had reliable TSCs, which
> > you forced to remove the reliable flag, and then you saw big
> > differences when doing the rendezvous?
> > 
> > That would seem to indicate that such system doesn't really have
> > reliable TSCs?
> 
> I don't think so, no. This can easily be a timing effect from the
> heavy cache line bouncing involved here.
> 
> What I'm worried here seeing these updates is that I might still
> be moving TSCs backwards in ways observable to the rest of the
> system (i.e. beyond the inherent property of the approach), and
> this then getting corrected by a subsequent rendezvous. But as
> said - I can't see what this could result from, and hence I'm
> inclined to assume these are merely effects I've not found a
> good explanation for so far.

I'm slightly worried by this, maybe because I'm misunderstanding part
of the TSC sync stuff.

So you forced a system that Xen would otherwise consider to have a
reliable TSC (one that doesn't need a calibration rendezvous) into
doing the calibration rendezvous, and then the skew seen is quite big.
I would expect such skew to be minimal? As we would otherwise consider
the system to not need calibration at all.

This makes me wonder if the system does indeed need such calibration
(which I don't think so), or if the calibration that we actually try
to do is quite bogus?

> >> @@ -1719,9 +1737,12 @@ static void time_calibration_tsc_rendezv
> >>              while ( atomic_read(&r->semaphore) > total_cpus )
> >>                  cpu_relax();
> >>          }
> >> +
> >> +        /* Just in case a read above ended up reading zero. */
> >> +        tsc += !tsc;
> > 
> > Won't that be worthy of an ASSERT_UNREACHABLE? I'm not sure I see how
> > tsc could be 0 on a healthy system after the loop above.
> 
> It's not forbidden for the firmware to set the TSCs to some
> huge negative value. Considering the effect TSC_ADJUST has on
> the actual value read by RDTSC, I think I did actually observe
> a system coming up this way, because of (not very helpful)
> TSC_ADJUST setting by firmware. So no, no ASSERT_UNREACHABLE()
> here.

But then the code here will loop 5 times, and it's not possible for
those 5 loops to read a TSC value of 0? I could see it reading 0 on
one of the iterations but not in all of them.

Thanks, Roger.

