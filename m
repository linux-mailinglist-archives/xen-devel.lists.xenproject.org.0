Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D76A371651
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 15:57:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121626.229392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldZ4i-0008Pt-FJ; Mon, 03 May 2021 13:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121626.229392; Mon, 03 May 2021 13:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldZ4i-0008PR-Bz; Mon, 03 May 2021 13:57:28 +0000
Received: by outflank-mailman (input) for mailman id 121626;
 Mon, 03 May 2021 13:57:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gWh3=J6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ldZ4h-0008PM-00
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 13:57:27 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d8ac41e-d727-4a40-bb3b-24a8baa39817;
 Mon, 03 May 2021 13:57:25 +0000 (UTC)
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
X-Inumbo-ID: 0d8ac41e-d727-4a40-bb3b-24a8baa39817
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620050245;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2mHMDwnB+Qqg6IwVstKSE+kgeSH2vCxjdn0ovWOL3ug=;
  b=anhN2r/Us4YJbyZAtGEok7+Ionxb8N1WtLDFHuu33i4TZ8ogdsmhL7tV
   iVPxoiKvVWeVfKpZ3I9e2KZxK1NR8fuafsfJ3hVnpcS4yPfSy7mchtCoX
   lHu+k8OEG2IQxjrMTDnEGhNeFtz1GoadP2/FrR4oiXClqh70hig1oOR62
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: f+RXXpwoaCxVOzy1YvpgcFILvFKFzdRtb+9XDU0K+4ErjkJVIx6Pgtlxkqeo7DfC4jdKITSUpO
 tDhnu8WCoC4OBEVa2nMtGQeGadnBNIIwnjLtAyGr+geaUVUKj1FY3A4Z7VxzAM1J4RDIR1GxGL
 ji9uSaSKkltaDjObWlL70ydfgCOkzbAV+flh+TvPlSZPxam5wIiZ+h+Y+phOIxxWhct4MWDHb7
 1EPkcVK0R98DIw089Mo8BZcMIlDiuxq57Oj2EG4XnHRfqbXgaCqZUYFgt4G30Lsi1Ul3P4b5us
 zBE=
X-SBRS: 5.1
X-MesageID: 42948339
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:tSMnGalyUspn5cqHHdfqyiIy5iPpDfP+imdD5ilNYBxZY6Wkvu
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/NIyKMaVI3DYCDNvmy0IIZ+qbbz2jGIIVybysdx94
 dFN5J/Btr5EERgga/BijWQPt48zLC8n5yAqvzZyx5WIz1CT4FFw0NHBh2AEktwLTM2YKYRMJ
 aH/MJIq36BVB0sH6eGL0IIVeTCuNHH/aiOCXI7LiUq9RWUineQ4KP6eiLy4j4lTzhNzb0+mF
 K18TDR26PLiZCG4y6Z7UD/xdB8mNztytxMbfb89/Q9G3HXpSuDIKhkU72GljgprO+o80ZCqq
 ixnz4Qe/5dxlmUUmapoQb8+wSI6kdQ11bSjWW2rFGmgcvlSCk0A8BM7LgpDCfx2g4bk/xXlI
 dotljp0KZ/PFf7swnWo+XsbVVMkHG5pHIz+NRj9EB3YM8lR5J66bAE8Fg9KuZnIAvKrLoJPc
 NJF8/m6PNfYTqhHgrkl1gq+tCqU3gpdy32O3Qqi4iQ2zhSqnhz01EV8swZhmsB75IwUfB/lp
 z5Dpg=
X-IronPort-AV: E=Sophos;i="5.82,270,1613451600"; 
   d="scan'208";a="42948339"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=izw1mRqaUMxg9D2lHlLxrCisQMULMjbr12UlyD70JA7WFYdPIa+/MaTAEgcONATilS3JMGYUu10JE+y6pyqF7wPdE6OOQaLvqR5680NwSSIoAwK9XhUHpkkdmElkURiUuvE1VPIdJQhF8h9hQpRmIkzCdLtyOhglRRL8S7gnig9BFphwZoruhulZKojAr9cylBeeZEdtntYEmMZFdhb+kpZA77zVLQhHleUkwsr7Y8b4yiX9qQxG/FqBCJNdZzL5mc/jd83erOrYQb4UD10C8KDiVyqcxAif06KcwQTZX+Kdlx+WW9IdLKbgt0RC9kf6+jrwmobXXsdNN+T/XCuXVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2mHMDwnB+Qqg6IwVstKSE+kgeSH2vCxjdn0ovWOL3ug=;
 b=Om8Cs0p5LLt6/z64DRlJS5xjH/zXKk8RaB1bSQF2FhzIRmj1ZkHQWaOwVHqP2VSkcvvDBAZOdOBrvCtmdiB402WJS1GBgIRwLm6mHkkXY5ZkllNLEFSRy4vEUJfwkhAz5HTeXZUMcrzb/VzEMN+MfbJTXGVUuxUIVBW5FZ+bwsnpQ3iWp7Vk5FGDDjcOEv6McmvL+lH5EgGm404UjokloBQplvoHn4NQSh7iQlDkzHL00VyGa1FLqY2ej/W5Z38vhNz71hFrBjaQSQx8+TX2nxV9vyDR/9QhOykHDUxFvDnZe3kQOx0nW5s1FZh6HtmscgRvCpkudF/XW7UNppOdow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2mHMDwnB+Qqg6IwVstKSE+kgeSH2vCxjdn0ovWOL3ug=;
 b=haIfum2iOZikJRVWcRVNyIVOZUdFeCU/1q4hZVD9C21wttALjrV0TnpPG13Cd1t99bL1PLJCG7loHPhGICp2ZUTTXqBM8vGmQZsLx9lIRZEq7dx8rbcOVNjXgcDcQJJjHq4VhpUGipD/StkxDWHGRps8C6qi5FL9KdnXhMP0iL0=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
 <8ba8f016-0aed-277b-bbea-80022d057791@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 03/22] x86/xstate: re-size save area when CPUID policy
 changes
Message-ID: <5a954be8-e213-36d8-27da-4c51243dc280@citrix.com>
Date: Mon, 3 May 2021 14:57:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <8ba8f016-0aed-277b-bbea-80022d057791@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0033.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36858282-df07-4e1d-b9fd-08d90e3b5f91
X-MS-TrafficTypeDiagnostic: BYAPR03MB3862:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB386210DB0922AF26230C5AC3BA5B9@BYAPR03MB3862.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S+RIWxxYV2l97tXxfBV6o++n5gNOYU+e0pzj50B2cjQIR6M2wWrow7+o7m/aeVjDVBazy+cQQv0bhK5OaaGNG3siQv3zM1xNNeaLC9POcos9bp8ubcZql2XyaxQaZjkee/sZ0kWuzCpqi6i9bWZnapR4daKAp3LOkLlEFko7M8Gi246pB/btkTBTghoQFjbn8uTMa8EEYLn7SQTk2SjkOgIh6vXwE2DxianUHU4PrNySHhX037oqnMlSsbqBAe5lN6FcdLxoigLWQBN4xvUWo9t+BhHlE8kNHeyvpqN1s12jWpHtAMtq+65sVT9gk4s9I2NVAgwn0NRlMT3yLJ7FwGDoBYfRhRUdPSYQ8dSuzO6euyOow2CKXeBitV2G3X8kJ/GGggVtfuGTBkn0BuH68BOUdFuvvgLAlChv8aCOaTFTN7socI/rmO1WpQBz/YzeD72GBO5idopCzVtzeF6o54krylNcDIcI58cVf4uUuO8PU3EDhfI7GtimycZWEVOdidOFSUhi1bmYHxX3mIMvprBk0GmWHXFB38RBbsyKQXDxyUiHqXPWZNFUatc0BSvs1jOmcu+3ZlH8buvNVuUN4vb3Zpvw3HSL+J/2aRwrdo6eR5FB6dzSnZdfPCnCv7OLoOEq9VtbdzHFzmJsC6L1S4CTCquQap81gNPSNz+yec1BHO0sOQRTav2BDS+zu7yd
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(31686004)(66556008)(186003)(26005)(83380400001)(54906003)(110136005)(16526019)(956004)(6666004)(66476007)(5660300002)(8676002)(2616005)(66946007)(316002)(107886003)(16576012)(31696002)(6486002)(86362001)(36756003)(4326008)(2906002)(8936002)(38100700002)(53546011)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WlF3emNkWVM4a2FESVRUcXRrOUZHQ0dzT1h0d0hQWDRHN3dmZldxNnh4R082?=
 =?utf-8?B?RWtqdS9SYjAxbXNVWHZ3OVdmcGxnQS9BRWxoMk82K0lqbi9rVmg0bGlYcTZj?=
 =?utf-8?B?YUZPaFdXaXlkQm4yUWQzbXFtQ01OV3BCOEI4SUQyMGpjdXdDZEU2OGV1ZHBJ?=
 =?utf-8?B?V2l3Q0JsK3lSVEdYUG4vMDlscWJMVUNrVlJYcXA5SDZxOW1sQlc5OE5DN0dV?=
 =?utf-8?B?UGtaZlQ4T1ZHVG9uckFzZDB5TlBHK3huZGM5bFQrWVFsem9pU0JVeDcvSnlO?=
 =?utf-8?B?VmlETmdvQzdXZ1JZeDZ2QUtrK2pNdjZzMnFVZTdMUlUrUWpPamFZYkxKOWxY?=
 =?utf-8?B?Tkc3YmRrUGlnaXV2dHhtb0ZSaGRWVmZ4RU91MVVYWlFXZStEdjVlYmxxVDJF?=
 =?utf-8?B?YXRqMGFNWllpeXlteTdXNTFTT0NWRUUyNDVIb2dYTmxhRmtKN3JwMGNLRlBN?=
 =?utf-8?B?MGwvYkEvSFlha2R1anhVaFEwTis5R21Gc2ZGZW0wNWk1bDRHUTJENGJwTWhE?=
 =?utf-8?B?aGJvQjN6U2tjYWJTRTBoOXdjeHJ6aXQzVDgzMGJBVXo2T1dab0ROM0VaaE9s?=
 =?utf-8?B?TytDdkgzcmlROXprSldaVnhzbyszSktuQVZoU1VTTnBZM0U4UzRWY1pQemJa?=
 =?utf-8?B?RkhGK3lxcEFwZW9sMkdQNldIOWRnMkRrRC94SGtqTjRrK2VURWgyWWRVMW0r?=
 =?utf-8?B?cnBEaDVROFdwMnd0RWFSWXY2SDV1TUhDY3VhYnRlcDI5c0JZME9kRTN6Z09z?=
 =?utf-8?B?SStmZlUyRTNhUTgrcVZ6K2NFYVBUdVcrNFlxM1o1a3RpY1pVL2xJTk1ON3FO?=
 =?utf-8?B?aTFTN2c1ZVcxQko2VndoanFIdkpwYytPSTdxaTJzUFBuRHV6djA3SVY4b2tY?=
 =?utf-8?B?RFlScHcvRzZiN2U3ZTd2bUZZMi9jL2hiYlRoVjF5MWtmU2ZCTEErTmh2NWIw?=
 =?utf-8?B?R0NGdzRZeDJWNGtDemRTSUNuS010R2Z6NGhvcjVRaC9MbWFoeG9RU0pOVWI1?=
 =?utf-8?B?K2ZsU3JQOTN4S254RDFtaHpMSkJsZVh1UWo4RmIyQllsaURkMjV3QmRkbDly?=
 =?utf-8?B?N2VVZlRCL0ViNjcwMnVHR2xPbzN6N0U5NDRjamlwSWkyM2MrdW8yWk8zZmMx?=
 =?utf-8?B?bUUwdU9ScTVxZkFRbExOQVFEWWxnVTZrREZFZ2dTYlNiOE1MeGt4aVZ1eHZl?=
 =?utf-8?B?SGdSQlE3ZUgxYlVJQnp3eGd3YmJkK1FaajkwdHBJbEUxWGFPN0UrN1JvMzJk?=
 =?utf-8?B?WmFDcDJQL041M250ejJIWW10VVhQT0tBT0VTQzN5T2lVZGVHZ09sSlBKWFNJ?=
 =?utf-8?B?RW9ybEd2L2hiVlZhYzdDS2JBcjB0RFBocFlTcXpaWDBLZ3ZqQzNOQ0FmZFNP?=
 =?utf-8?B?eHhYY2hNRTg1c0RqZG1jZ3M2TlZmakpodi94Z1ZtNSsvbEF0NlJUWTZaVFhU?=
 =?utf-8?B?M2JBOEs5MXhhME42TG51cTArZUZ1czlpTWZtRU9WNXRxckxvMXpnUHNzbnVx?=
 =?utf-8?B?RitvSFhVN0duVHIzNEZaWkpDRE5kaUdJREtnSVBwcWU4VHdUKzB4M0gyYUor?=
 =?utf-8?B?L0lrdzQ1cmtnQXp5U0tsSG40dEN1Z29Kb0tlbW1pcWtwL25FUUd0eUxrQjhE?=
 =?utf-8?B?UXB6a2RnZGxmMnY0dDZFS0JIQ0p5ZVZ6YWU1aHY3bHNtWlFPQzRER0xaeEJx?=
 =?utf-8?B?TUdoM0xGRGJvdEROSWdxK05VYThmaUZHRjArS2RiZXpSdlk2QnpsaTdvOTVk?=
 =?utf-8?Q?mMzZv9y3aLwZcqGcPQij4L9lQJLjHcZfdxSkcSy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36858282-df07-4e1d-b9fd-08d90e3b5f91
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 13:57:22.1709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B1Z6dStPX/UBMfqcjIjvAeHH4orUJIn0Z95uLhL1ocRCcw0GKg7rx/FDcb4Q36r53rGVpW5ajRLRoB0LxAqllq7mkcP/h2VTuASWsUN6EqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3862
X-OriginatorOrg: citrix.com

On 22/04/2021 15:44, Jan Beulich wrote:
> vCPU-s get maximum size areas allocated initially. Hidden (and in
> particular default-off) features may allow for a smaller size area to
> suffice.
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Use 1ul instead of 1ull. Re-base.
> ---
> This could be further shrunk if we used XSAVEC / if we really used
> XSAVES, as then we don't need to also cover the holes. But since we
> currently use neither of the two in reality, this would require more
> work than just adding the alternative size calculation here.
>
> Seeing that both vcpu_init_fpu() and cpuid_policy_updated() get called
> from arch_vcpu_create(), I'm not sure we really need this two-stage
> approach - the slightly longer period of time during which
> v->arch.xsave_area would remain NULL doesn't look all that problematic.
> But since xstate_alloc_save_area() gets called for idle vCPU-s, it has
> to stay anyway in some form, so the extra code churn may not be worth
> it.
>
> Instead of cpuid_policy_xcr0_max(), cpuid_policy_xstates() may be the
> interface to use here. But it remains to be determined whether the
> xcr0_accum field is meant to be inclusive of XSS (in which case it would
> better be renamed) or exclusive. Right now there's no difference as we
> don't support any XSS-controlled features.

I've been figuring out what we need to for supervisors states.=C2=A0 The
current code is not in a good shape, but I also think some of the
changes in this series take us in an unhelpful direction.

I've got a cleanup series which I will post shortly.=C2=A0 It interacts
texturally although not fundamentally with this series, but does fix
several issues.

For supervisor states, we need use XSAVES unilaterally, even for PV.=C2=A0
This is because XSS_CET_S needs to be the HVM kernel's context, or Xen's
in PV context (specifically, MSR_PL0_SSP which is the shstk equivalent
of TSS.RSP0).


A consequence is that Xen's data handling shall use the compressed
format, and include supervisor states.=C2=A0 (While in principle we could
manage CET_S, CET_U, and potentially PT when vmtrace gets expanded, each
WRMSR there is a similar order of magnitude to an XSAVES/XRSTORS
instruction.)

I'm planning a host xss setting, similar to mmu_cr4_features, which
shall be the setting in context for everything other than HVM vcpus
(which need the guest setting in context, and/or the VT-x bodge to
support host-only states).=C2=A0 Amongst other things, all context switch
paths, including from-HVM, need to step XSS up to the host setting to
let XSAVES function correctly.

However, a consequence of this is that the size of the xsave area needs
deriving from host, as well as guest-max state.=C2=A0 i.e. even if some VMs
aren't using CET, we still need space in the xsave areas to function
correctly when a single VM is using CET.

Another consequence is that we need to rethink our hypercall behaviour.=C2=
=A0
There is no such thing as supervisor states in an uncompressed XSAVE
image, which means we can't continue with that being the ABI.

I've also found some substantial issues with how we handle
xcr0/xcr0_accum and plan to address these.=C2=A0 There is no such thing as
xcr0 without the bottom bit set, ever, and xcr0_accum needs to default
to X87|SSE seeing as that's how we use it anyway.=C2=A0 However, in a conte=
xt
switch, I expect we'll still be using xcr0_accum | host_xss when it
comes to the context switch path.

In terms of actual context switching, we want to be using XSAVES/XRSTORS
whenever it is available, even if we're not using supervisor states.=C2=A0
XSAVES has both the inuse and modified optimisations, without the broken
consequence of XSAVEOPT (which is firmly in the "don't ever use this"
bucket now).

There's no point ever using XSAVEC.=C2=A0 There is no hardware where it
exists in the absence of XSAVES, and can't even in theoretical
circumstances due to (perhaps unintentional) linkage of the CPUID data.=C2=
=A0
XSAVEC also doesn't use the modified optimisation, and is therefore
strictly worse than XSAVES, even when MSR_XSS is 0.

Therefore, our choice of instruction wants to be XSAVES, or XSAVE, or
FXSAVE, depending on hardware capability.

~Andrew


