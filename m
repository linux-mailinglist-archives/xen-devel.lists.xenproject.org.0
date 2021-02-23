Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEEE322A64
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 13:18:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88746.167006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEWd5-0006OZ-Du; Tue, 23 Feb 2021 12:17:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88746.167006; Tue, 23 Feb 2021 12:17:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEWd5-0006O7-9v; Tue, 23 Feb 2021 12:17:27 +0000
Received: by outflank-mailman (input) for mailman id 88746;
 Tue, 23 Feb 2021 12:17:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UeLE=HZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lEWd2-0006O0-P1
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 12:17:25 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46f47052-6738-4e75-b35d-737404c18497;
 Tue, 23 Feb 2021 12:17:23 +0000 (UTC)
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
X-Inumbo-ID: 46f47052-6738-4e75-b35d-737404c18497
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614082643;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=6B5lLyzjoNzPFmwuDmERxt8fR91d9DWd3QrM6/1ZnqI=;
  b=NF5Oy20g3xZ+4wfNvXQnZ3ffadO6i5Z9Y3kBvcx+liGcdTW6LuOnA1uc
   aAwwCr3ARWR195RJCFq0KJuinXAieVvdVgMAyWJQ66eIobpc055o6HEyl
   id6wJe7Ztv7iRIh/jERt8P0J7UUvGh+KgkWyKPXcu0dI7XIiJ8G4FAwos
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: I+E74cw3AHxp7YawhHMtesxL62lXw4T/VTYIOSn2yKkd+0pNngsaEmqJbaidNSy+7tOUjfMyYY
 Z0N8N1Nxof3k79jcScTGKLjD9WMV56JedJgyRbQNYR8AMfX6/Y6nM5jSguaZpWZfZKdrnfHRXu
 /YgK38wscWefONQSzxsAnPar+r1PUdCNl3zHNbzU7gwuBlxF0IeYDMkiIqlMxfuOSqaFaO5Lq1
 O32ilnM4wqgMRuoZZygfewpqjhV1QQHB7547EPwsriL96ys2pQXFlun8OHB2w3cb0+Ge8mZOIv
 YLc=
X-SBRS: 5.2
X-MesageID: 37836393
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,200,1610427600"; 
   d="scan'208";a="37836393"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMuLUlW1fscXoVtU17HHFHtAEW8cH22EslQLCEQQzh7OA9INBtpRoYgadpUeqMuVwG0woPp77FBBlHy39Mjfe0+e9Vvtl/Igr56gf9paJLagkqhtcP48nvny+j+0+AZ2A1McrHTY2TNDeZgFmgJhp2K83dGJjJLcfe0ZRqjCBbVJaJmmUE19T+7VVQazLLI+MGW/6bz1eGh+74tBjRGf1DIaP3WFv2HQFddaf4bgd3UMC/kITG2r1P3P6VT7ZN4pXhmljhj1qIh5ZnaxW/nxAOGawTooX2S7b4asxxmm5UJLBFcEGyaz03FQYVsIdhN9Dj0bOZWY1wNiHaXsC06M1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NubZbynDjJjRzoU5i+z36kQ7herjb7QFxkiBN4s8hE=;
 b=HrPn5lTSDTAMPF38DWJCAaYnfjjrTaE2iuTqevVx33LxAaPn04rF23ZSOjIvYCekHVxntWQ+VR99hXZRs8EHKCAWg5L37jiwXTUVcipVoae1dDPu0eyaCg8LMtjfhwWfs3uM0mdG2u4h0AV4bievrLhbM0eLrlFqc923fVr+oE0caUwRYxrFZn7SVBMVTLgOkuP4cxV7Iwo3PbNCj5W/krqRMNvbdFJXu/8WcNGNCnYFSYxBTCSKzR9xVaX4ryFgCmPBPKw1e1A4zJozOKx99piyuATwVqxciFbg53j4PqCwhN2yqlcDTeh1fcVN+lgYLkoUT37XGssJaBQGMQ6M6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NubZbynDjJjRzoU5i+z36kQ7herjb7QFxkiBN4s8hE=;
 b=dK3M+Hl+BBzBJ6SO3O16zTP6nxD0bDMS/zclmdY8jK7Sv+2w36BQpI9EQHyC70AJ/u28dN5xvV4sfaM8VME/5KDEN3ECPNwRuBZzvs87NKNRCEzFQYrvchThUkOXrMsTM4sJNdlWyfICTwVwIkCNCB6HUZItKlHLgk6Q+fFfWFg=
Date: Tue, 23 Feb 2021 13:17:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <andrew.cooper3@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	<xen-devel@lists.xenproject.org>, <iwj@xenproject.org>, <wl@xen.org>,
	<anthony.perard@citrix.com>, <jun.nakajima@intel.com>, <kevin.tian@intel.com>
Subject: Re: [PATCH v2 2/4] x86: Introduce MSR_UNHANDLED
Message-ID: <YDTyScmud26aiaMi@Air-de-Roger>
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-3-git-send-email-boris.ostrovsky@oracle.com>
 <YC5GrgqwsR/eBwpy@Air-de-Roger>
 <4e585daa-f255-fbff-d1cf-38ef49f146f5@oracle.com>
 <YDOQvU1h8zpOv5PH@Air-de-Roger>
 <ce2ef7a3-0583-ffff-182a-0ab078f45b82@oracle.com>
 <307a4765-1c54-63fd-b3fb-ecb47ba3dbca@suse.com>
 <YDTMIW5vBe0IncVR@Air-de-Roger>
 <2744f277-06fb-e49f-2023-0ec6175259dd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2744f277-06fb-e49f-2023-0ec6175259dd@suse.com>
X-ClientProxiedBy: PR3P195CA0029.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb05d81e-82d1-41fd-deda-08d8d7f4f786
X-MS-TrafficTypeDiagnostic: DS7PR03MB5445:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5445BB2528197853F74E271F8F809@DS7PR03MB5445.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JPbq+3cTwU8xuJX9NDjmAm78CIkdbxh3u4nAXPEyAgggAitCfFj53q24QG5kfVcAz1c5Q1pv1LfQ6uBIj3uoCKc/oD/301uLzvEib4J5J33VcEsU+OTdi2q47tS92SkuHi7GfLpaPBi5ohHp9wsnrwd9j/RRslm1OrUbZXVgQH2vobjcVEbNrBmfvkjVc6owi2cz4MZl12HKIcOm/zmURMMO+pJ+k6MSBnFcvTv2hSjmHz6hLOqjIWE1KcBWRZe4e9l69GGIa9PlINsZUPIb9HA/Lxm3Fv4oRiOXCiGEd8+3IZzfgEygpiCYc3xU4mx2soy0DDYZSmwi6Fqr1yiLm+IL13kKO076nTc1kUMrqCXWnFssnYk+T7QLLQqcbxnV8ErH/Qa7W0GtfgihAd6MA1Bo6nboUdtTh8/BESA/Qr1IX/hjkppmL2ChkpGEAnzE9+0OsCgMurBsCazqTFXqhr2g6YgpkaSHjmmEdpd6nCOp3058OLZsBecjJeTf4DoWuw2AsU73HFa8uV5irlZ8gQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(33716001)(5660300002)(16526019)(83380400001)(86362001)(66476007)(66946007)(6666004)(2906002)(316002)(956004)(53546011)(186003)(4326008)(6486002)(26005)(9686003)(6916009)(8676002)(8936002)(478600001)(6496006)(85182001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UFd3T2ltWmFjbXl3M1VBczg5RGdBODFRYnpVaVQ5Unk3K2M5M1lHMzc1ZjJ4?=
 =?utf-8?B?MVRKcnVGV2FBdFFZMzVsUmk2UDVrZFhtRTk4bFFYNDRBZ3JNUHoxQTRGL3dl?=
 =?utf-8?B?a01pWHlVbUZ6QU1kRmEra1VhRU1WY0RVN0c3d3BuZVprRjR5TUpDVTlCOU1O?=
 =?utf-8?B?MitwY25iVEZPVmZRTHIwZWpZbGlVM2NtTFd0UHFTRTc5NVhQSnVnZWQyckh1?=
 =?utf-8?B?Z0crU3NpU2dCbXJObENZTW1ON0o5c0JaZll2QTdzaStweHhaMzVVTmhIMDVt?=
 =?utf-8?B?QU1KUzV6eDl0VHNtVDRBaDFUYVlNZEkxQVhvajNRckJuUGM5ekppOEZibjcw?=
 =?utf-8?B?U2dOMGJabTQ3MEpmUEhOeTNndUxLd0I4U29nRGsrMFkxeUdTQmp0My9TSUht?=
 =?utf-8?B?R2NLK1BWL1hZNE8rTlJuUzRzYktnT3ZVeFhUVXE3SThML0I2cC96UXZIa2da?=
 =?utf-8?B?SlF0V2cydEtMUisrbFM4YjROR1BFYUtad05TS2VLamNwdHFnc3Z6L1Y5VzRi?=
 =?utf-8?B?SFlKRkpQWWtINzN2VzlWbjFxRkpWN3BoQmFFU1ZGYnNGS1ZsczBiYis3bkxx?=
 =?utf-8?B?d2gvM0ZjSWZnYlVFYWFwS1hMTFRMeW5FY2grSG9oNmo5UXRJbGs3dmFNZ2lP?=
 =?utf-8?B?cVRzRVpmaEpNazZ0cC9pQ0grdEszSUZnMEpsWkhSQ2ZqMUMrV0I1Y0ZzOUNk?=
 =?utf-8?B?Snd3VWxwc3ZZdWNPSFc0S1VvSGNqZkZGOGZWMEdmblVTL0dpbVdZY3N1N1hm?=
 =?utf-8?B?NXJReDZTS01DRDFxU3VmaGk2QlpabDNMeUNLc0dFcHEvWVo5clhKRkdVZ210?=
 =?utf-8?B?L0tIZ055bnltSGxtRjBpVzQyd3ZsUG9iT2cvUkwvaFNleVMxb2lPQW9oZVQ1?=
 =?utf-8?B?SytQbE0xMm9tOXVjM3ROeFltdkpUbXlEN1IrYTU3M2NKWmZmK09TSnZuSFZ1?=
 =?utf-8?B?T2ZDaUI0N0VLZU9WSXpyWGphYkhLbmRGS3Y1RUNicEs4MkszVndPK3JHZXVN?=
 =?utf-8?B?dkpFM2lwejd5aUdaYWlic29DditXS1Q2VmpGUUFldUVUMi9ZRG56em84NE5q?=
 =?utf-8?B?d2t5YzhlUy9ZN3FuMXJvZ0l3QzBkakc2NmUxYjZNUkFJQ1Q0czZFdzNxWVZv?=
 =?utf-8?B?UnRwWGJCUWI1UVJDcjBOUkFkYjRyUVFGdUpQTDE0ZTlSSzZGMzV4dFQ0V2ty?=
 =?utf-8?B?QTRCem96OTA0RXQ3Z1JCRytQTnplRzh6OUVlV2lacHJJMW12MWhBNjhWeFZj?=
 =?utf-8?B?bjhBTEJLd2E2WElmWVlUTUlBQ1ZWNmdmb3FjSENQQlNNRThaTTUwTUR1eWRZ?=
 =?utf-8?B?THRoY0ZBaVBIbGVkMDlzam94eDlTWGtSUXZXZWtoWU5xQUlpNlNJelkzejhp?=
 =?utf-8?B?bCtQU2Vnd2FqcW9HOHMrRzFEZzZWblFCZTZ1ais5R3BSNFdoZDN3dGlZZ2tU?=
 =?utf-8?B?bkllTGJiN3JOdklXQWJyOVBJL1hwTTk5WkJqOWd2RUJET2RQeHlUU1BCV0l1?=
 =?utf-8?B?cEJPOHRCSngxK2x4dDhtR0o1L1RsQkgyQmlHYXZkS1QwMFVjL3Q2dExEZXRr?=
 =?utf-8?B?WTFnUjh1Zk1aOWdtdjJnRzVhbHVheFlDZGwxOUpjV1NYWHJLY3NIYU5zU0Rn?=
 =?utf-8?B?Mncrc0t5NlVkRllxeEFSYnFCb0ZHbWZRQW9GRE1NU0RWMm1NOHRhMDlFOTRC?=
 =?utf-8?B?ODBrNkZwR1I3c0xaOWVoMVJKMFA5SldUMXd3cURtTDhNM093UmZOU3lFeUQr?=
 =?utf-8?B?UlBRWVFXb0ZtUDBMbzhIVWpRdGVUVjNWQlBBMitBK1QyODVBbDVKNERuNzhE?=
 =?utf-8?B?TWJKZFZFMEhpN3pFTTdNZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb05d81e-82d1-41fd-deda-08d8d7f4f786
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 12:17:20.0476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P+3csdu/manMx+HfFbRyxAKZ56Sml5cAiaJwX9aZejAWs9VmfGY2A3fBuePmIZkIJvETwPP2YDN8bsHiABNEHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5445
X-OriginatorOrg: citrix.com

On Tue, Feb 23, 2021 at 11:15:31AM +0100, Jan Beulich wrote:
> On 23.02.2021 10:34, Roger Pau Monné wrote:
> > On Tue, Feb 23, 2021 at 08:57:00AM +0100, Jan Beulich wrote:
> >> On 22.02.2021 22:19, Boris Ostrovsky wrote:
> >>>
> >>> On 2/22/21 6:08 AM, Roger Pau Monné wrote:
> >>>> On Fri, Feb 19, 2021 at 09:56:32AM -0500, Boris Ostrovsky wrote:
> >>>>> On 2/18/21 5:51 AM, Roger Pau Monné wrote:
> >>>>>> On Wed, Jan 20, 2021 at 05:49:10PM -0500, Boris Ostrovsky wrote:
> >>>>>>> When toolstack updates MSR policy, this MSR offset (which is the last
> >>>>>>> index in the hypervisor MSR range) is used to indicate hypervisor
> >>>>>>> behavior when guest accesses an MSR which is not explicitly emulated.
> >>>>>> It's kind of weird to use an MSR to store this. I assume this is done
> >>>>>> for migration reasons?
> >>>>>
> >>>>> Not really. It just seemed to me that MSR policy is the logical place to do that. Because it *is* a policy of how to deal with such accesses, isn't it?
> >>>> I agree that using the msr_policy seems like the most suitable place
> >>>> to convey this information between the toolstack and Xen. I wonder if
> >>>> it would be fine to have fields in msr_policy that don't directly
> >>>> translate into an MSR value?
> >>>
> >>>
> >>> We have xen_msr_entry_t.flags that we can use when passing policy array back and forth. Then we can ignore xen_msr_entry_t.idx for that entry (although in earlier version of this series Jan preferred to use idx and leave flags alone).
> >>
> >> Which, just to clarify, was not the least because of the flags
> >> field being per-entry, i.e. per MSR, while here we want a global
> >> indicator.
> > 
> > We could exploit a bit the xen_msr_entry_t structure and use it
> > like:
> > 
> > typedef struct xen_msr_entry {
> >     uint32_t idx;
> > #define XEN_MSR_IGNORE (1u << 0)
> >     uint32_t flags;
> >     uint64_t val;
> > } xen_msr_entry_t;
> > 
> > Then use the idx and val fields to signal the start and size of the
> > range to ignore accesses to when XEN_MSR_IGNORE is set in the flags
> > field?
> > 
> > xen_msr_entry_t = {
> >     .idx = 0,
> >     .val = 0xffffffff,
> >     .flags = XEN_MSR_IGNORE,
> > };
> > 
> > Would be equivalent to ignoring accesses to the whole MSR range.
> > 
> > This would allow selectively selecting which MSRs to ignore, while
> > not wasting a MSR itself to convey the information?
> 
> Hmm, yes, the added flexibility would be nice from an abstract pov
> (not sure how relevant it would be to Solaris'es issue). But my
> dislike of using a flag which is meaningless in ordinary entries
> remains, as was voiced against Boris'es original version.

I understand the flags field is meaningless for regular MSRs, but I
don't see why it would be an issue to start using it for this specific
case of registering ranges of ignored MSRs. It certainly seems better
than hijacking an MSR index (MSR_UNHANDLED).

Thanks, Roger.

