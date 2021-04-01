Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3485351198
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 11:13:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104203.199023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRtNy-0001IB-Oo; Thu, 01 Apr 2021 09:13:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104203.199023; Thu, 01 Apr 2021 09:13:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRtNy-0001Hm-LY; Thu, 01 Apr 2021 09:13:06 +0000
Received: by outflank-mailman (input) for mailman id 104203;
 Thu, 01 Apr 2021 09:13:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m73y=I6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lRtNx-0001Hh-7W
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 09:13:05 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8268550a-75d6-4898-9536-6747e970796d;
 Thu, 01 Apr 2021 09:13:03 +0000 (UTC)
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
X-Inumbo-ID: 8268550a-75d6-4898-9536-6747e970796d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617268383;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=LiR6CcfMz38H6AH3iC600Pju/Q4fqaW6qXchljKs1/k=;
  b=b73Bv9hQeBMKvdEWj0f5RzSYzB1g3tlhNJu6o/UiwHLKs0Qg0EYu47iz
   sE0yqlaCdI96Cqe5vOpFGf1qWtpvhVnQGH9A/whD9Z2OdsLc/tYnEd0/Z
   L0hBkHKC322et1AYNsgnTMIMt4+KbYGRxyOaD9vG+ET/SM9PGHLBnKDFE
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: yOin2xhUPiG9rcEqeJg85pwO1j5MmEAv+Mw+8mo80L1iH7ZjAX3Bcs2B0dv4XLpD2reC82osrq
 mZgw5WxOS5SBJ+1BLotH/rgaKtaL18pxaWhGq+eQLjSbMR7wifs+UVMDBQrZSxe0gpsgz2w9TQ
 S4Hfa4tLuoP29OHLxApRvjyTMwagj0cr3NracDC0tYJcQwdy43X3LC+ypboyUKFlV8AqJMK0qU
 3HtXFF2sxAlyQgjV1e+Q1W2Ia6dW4iAfyqouoM5VLoLI9rGOa2BAeCFIszTrVguse8aRzKf8nA
 xl0=
X-SBRS: 5.2
X-MesageID: 40667943
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:bdQNVK9yEsJqE4OWDStuk+AOI+orLtY04lQ7vn1ZYxpTb8Ceio
 SSjO0WvCWVtB89UGwt8OrqBICuWnXZnKQe3aA0HZOPGDbro3GpKoYK1+rf6hntATf3+OIY9Y
 oIScdDIeb9B1R7ksr2iTPQe+oI+9Wf9bDtuOG29RpQZDt3YKJt5RoRMGimO3BxLTMrObMJUK
 OG5sxdpyexEE5nDfiGOg==
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40667943"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ji8WuRR92PjjWwgnmBN0sCIzNklx+i8y3br/G6jNgp0lhFYtledXcWslHxU3BhyZUPOzaQ7buQEVMNkPdyHTiQxgtV41SNkmEIQuv5L7QxBZglmYkVIbuMhu6ROf4vwy3SA15YpnhDy1iEXTwRwLF6EEULarX/B74RLD0omCuT3tDUkeLUZ53UoaKI8sfK1lYwZKohmQZtgCe8k5VDQDv7irGIIRf/bjq2PheCIW7brWJ7X2HRkgPrh+nraH7MBwpwnnTrkK+1g2NKbphl9bQc1Ac1q77qlyzcn4Txq8XF6E8Z10PtdTHmzIzH/GqMi6od4a0jx8YTIELvc0UKnlsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6xTik7cg0w5yMM+5ODaWnDwMfxiWiQ9Cpu9dj2GIqM=;
 b=JG99yIG3H4oqFfVSTSJ0zq/BKerlbYEWUgmZvnh4ov9sQUwAcquolhFWUNYkXPH8EbVaNBcEjS9UL0v3UzQZEcRUWemRzd2s+I2dWHMgtWFc4j6zSawt+720RVv+8h7XE48ZxtjGTU+Tgmy6jQLRMdXx0Dc6e9T+y6FSUuiPAnpm1z6XC/PlEqDXkhBpeyqQLvI6JJZJ8DX9cRzHDCZmcRHffYPv6270t7Yv2Rbv2zUmkpTH7I7wddARVfRa35wjuARzSAXQ6NcYn+iF3SIqjgOH59uAAoQWLMMSDdWgZPpEuqFLi589j6jXl13EPEIPUo9qn1ByyQ2jNCmDBBXsbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6xTik7cg0w5yMM+5ODaWnDwMfxiWiQ9Cpu9dj2GIqM=;
 b=o9A2RWYmKa/5VCgcbXB6iJj0FGNAdhYfPuEKpj20yAcQxtVN3dmJbx+tQBa7df8x/xKlmaySMIxRzcN/EVXcOrSsSoyeSGMaWSiuiaXH/xwakL4Xl6yQeYfob5km6OSXkg/pGFFggm/Ypwq7NDvDPcPIgiOaMGpJPPQWVUsCEME=
Date: Thu, 1 Apr 2021 11:12:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, Paul Durrant <pdurrant@amazon.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 01/11] x86/hvm: drop vcpu parameter from vlapic EOI
 callbacks
Message-ID: <YGWOlHRvYTTy5wBh@Air-de-Roger>
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-2-roger.pau@citrix.com>
 <b4b66347-e06d-1c34-12cc-324f3097259a@suse.com>
 <1bc56db3-203d-1fa8-ad5c-68d97d584600@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1bc56db3-203d-1fa8-ad5c-68d97d584600@citrix.com>
X-ClientProxiedBy: AM6PR10CA0037.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ca16840-e7cc-49a4-017c-08d8f4ee57de
X-MS-TrafficTypeDiagnostic: DM5PR03MB2489:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2489C831F182721277C57C238F7B9@DM5PR03MB2489.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +gpL9/+jKQNnz7KMuMr3KaOxKOfPVqTlxSNuxVo+aAG66e4xs7weJ8woZwkDpEirW274k7OJZnIDrZqtDdKtaLLEMmTQZr2AYToMqE3bmmu5g2+dMbPN8s3CU9JJPqBdrSD3tysFwmgetV3kowOPwpxe13CE/HMl/MiAJCiKt5WUqJZ9JvBfwuP7YTVYDKNSBbLEABxF2YBlLqAcb4AoNgdhUFlSxWDkAOirQVN3sxGO09gH29QNLpFYwLY2ms8rz3neH80YZiGoZ+I8HEpwmoAofuDG+kLANKBkutyM8SlQMh1SaR21B7/Al9xb8jQC8MKoeA7KqENLV7BmjTcmRPTSMxag6wNMCUX+qmrkKkQMglSjc5MuWawgrgb9ufffiSlec4mk+lwuc9QaBZwFJQuD/P0HCE3+A+xTOdr0euvGUk1ovLgl2n2Q3uDQnGHJEEDRaBkHnci9AZ0KOKjUkhNZXgaWmTBkdg6XK57CS2o4XVxyUIuq9gkmJvPTZ06xqFmuNhfFzlQtGYwVCmkx5ci+sMcnCA4enkW67urewP5rCK0N1/GyTHcOpJUxtochBlQRFkkoCkVHmDpXWk+JpoOMyAi9XZ+jSQ52C5khx7hfJgHww7Rvxr4IZWIhVNnozwLHuca7uq0Iqx3cEx+IigPy/q94qfNWxoN4bXjDI84=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(366004)(376002)(346002)(396003)(39850400004)(6666004)(16526019)(956004)(86362001)(53546011)(5660300002)(9686003)(83380400001)(85182001)(2906002)(186003)(6496006)(478600001)(66476007)(8676002)(66556008)(66946007)(33716001)(6636002)(316002)(6486002)(38100700001)(4326008)(8936002)(54906003)(26005)(6862004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VWdwZDAxTUxTTWVDdDJ1cWpkdW4zUmJIYlVoay9BQkt0WFh2clUvLzRLTzZK?=
 =?utf-8?B?clZaVllTdXRBbkVNUk1GL3F5OXdWamVpL2UyZXZ6ZmZMWGlXYWZhZGNJeVlO?=
 =?utf-8?B?V3MyckFiMjZ5b0VodnZSNkFyZjNvekZKd3p3MUpRSVZFdXZ5QkVMaHUyYms1?=
 =?utf-8?B?Rk5GVXlGeVphZ3RqQ3RiL01CMG45NjZSWnhhcG5tY1lHbXF5VVBiSjJ4NTFr?=
 =?utf-8?B?MXZDY08xWWFuZUE3MTNSWmFieHNvSzVtTVBZNFB4ejV0b0FEdmpDTmlvRDcw?=
 =?utf-8?B?YktoUk9ZK1hiUUVmWDNsR3ZLYk5WMjBJdCt5TCtzMHNqYkhKd2FiSDJVZFpo?=
 =?utf-8?B?OHJ2M2RVaDMrcHZwV2V5cnkxS0llbFRYajRUd1pJc3BzeVRiM2ZYQTZKK1Ft?=
 =?utf-8?B?NlJZTENIYXZRd0RPTkw0S09OU2hjV0NUOU5DbFRRS2lCcnprZUlQK3JZb1J4?=
 =?utf-8?B?SjJtVXdqNlpOVlB3azB3WGxCdm9sK2hKdW5TS1NxWUlMRVNnaGwyWFNTc2xk?=
 =?utf-8?B?d2pMZE9qZ3k5YzdxYkdCTlk4U243ekUvWWg4UUpzdVl2L3E5MDlVQi9obEhq?=
 =?utf-8?B?TDRkaGpqVWVuTC8rcUVFdThjYjMxUit6TU1rVlQwSGlEQXVpSGtFTjUvcTZD?=
 =?utf-8?B?aC8zSmE0UXpHMGQ1eHRveGY4cG1XNjRjQnRXNmJ3VXZobi95Vm10OFFmdW1G?=
 =?utf-8?B?bnJFeFZaUkhLQkZkamJqQmhQVzJWdmFzMUdkcXNRSUxWZ3ZIUE1qb0F0YjFK?=
 =?utf-8?B?VkNKakRaMUFCbExEdUtKV2VJR2FSWlhCTEo5TS9JQUo4T0NjblQ4NUYrazZV?=
 =?utf-8?B?TWJVbm1MWnR4Yk9tU1d1c1VSK2R4TWp4bjdaM3ZzbjdMWmNEU0ZhdXJuNi9H?=
 =?utf-8?B?SE0xS0FRUmpTaHhSczdJZHZub1FEeEhvRmZ5MzBoRHBaQ3hsSlNkY1R4QkF0?=
 =?utf-8?B?WTk3dEtadDdtSk9LL2R5aTNrenRCc09LekVFSHZ5ZitmcGNONm5oL3NRK1A1?=
 =?utf-8?B?cnpDOU1CT0g4d0NhclhNUFRMaUhQRnQ3czdBQXdFbExvRlV3aWc4MXVIZTRa?=
 =?utf-8?B?ZjN4d1U3amRiRk1VTEVzclpsTitxeldJYUhCWlU2TDVrL3p2ZVE5emFiUld0?=
 =?utf-8?B?OTEzai9ySEs3Ym9uYUtERXJHc3BXazdwY1lYSWpGbDJIOG1QVFNEVk5CNUxR?=
 =?utf-8?B?TTZma3dIQUFBNUdYMy8zY2hsNExWbUNrZ1FHN3dPK1dyeW1zZzllSlFKcU1s?=
 =?utf-8?B?Z2p0eDBHdDYxMGdmRVhlQnpKOVhNeDJkemZBdVg3cWtvcjRCb0pEVzBHNGNa?=
 =?utf-8?B?YXhpcklSSjFsU0FVajMxdzJZUG1zeXp3QkdxUzFuQ2pmVmt0cWNsR0lrWTJr?=
 =?utf-8?B?KzkwYW5XcW16cERQWVBQTnprMUdJT1RSQUM3NWJXc0JPKzBYa0VJaDBnYm1p?=
 =?utf-8?B?eW5veGtZNUtqUUxFY2xuTmRwOG9HZGE0by96YVFRWk9BOXJMUjVFS3MzTlY2?=
 =?utf-8?B?a0drVHVNa3dMcEFZRjlOMW5EaDVuK0N6SGdCTUJGSzZsb3FBUWV4djFwTllp?=
 =?utf-8?B?ckpuY001c3o4K3pHcC9sODFBZEpHZVpHSmJjR2dPWG1OelZTYXBMdWRRYldj?=
 =?utf-8?B?U0c1RjF0bWJYRDlxTXFjc29KYXhmR1BFMkJaejF4QnVpbGJQM0cvVVFnWUFZ?=
 =?utf-8?B?M3lwQ1puejlxV2VNNmwrcGxDdjVYNTl6M3FOL29rb1JUN2FTOTZGR1BUS1Fu?=
 =?utf-8?B?cHQ3Z0VFd2dNdko4SlZYb3dBejVUWU1uVTdnYW9jMFEvZm1XRk1IOGtNQzhC?=
 =?utf-8?B?TUpYVkpmMWJOQzJtRlU0QT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca16840-e7cc-49a4-017c-08d8f4ee57de
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 09:12:58.7471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mcWL9cQzj3LyBnIq9w2boWASGM5lbWzcvrezDy1n1n2bnOiSzIPzkJjT+XUJ/0amRywt3C6DT0ylUHTXbAN1Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2489
X-OriginatorOrg: citrix.com

On Wed, Mar 31, 2021 at 05:24:24PM +0100, Andrew Cooper wrote:
> On 31/03/2021 17:02, Jan Beulich wrote:
> > On 31.03.2021 12:32, Roger Pau Monne wrote:
> >> EOIs are always executed in guest vCPU context, so there's no reason to
> >> pass a vCPU parameter around as can be fetched from current.
> >>
> >> While there make the vector parameter of both callbacks unsigned int.
> >>
> >> No functional change intended.
> >>
> >> Suggested-by: Paul Durrant <pdurrant@amazon.com>
> >> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >> Reviewed-by: Paul Durrant <paul@xen.org>
> >> ---
> >> Changes since v1:
> >>  - New in this version.
> > I'm afraid the situation with viridian_synic_wrmsr() hasn't changed
> > since v2, and hence my previous comment still applies.
> 
> Only just spotted that line of reasoning.
> 
> Longterm, I do want to remove all the Viridian special cases, and handle
> all of the state via architectural mechanisms (cpu policy for static
> settings, and the existing MSR records for dynamic content).
> 
> A consequence of this cleanup is that guest_{rd,wr}msr() will be
> eventually be used to save/restore dynamic state in the migrate stream,
> which is why I've been engineering guest_{rd,wr}msr() to work for MSRs
> in "current || !scheduled" context.
> 
> As such, it is important to retain a vcpu pointer because it will not be
> current on the save/restore hypercalls, which execute in control domain
> context.

But you are never going to restore an HV_X64_MSR_EOI MSR, as such
should never be part of the migrate stream in the first place. It
doesn't have a value itself - it's only used as an alternative way to
EOI an interrupt.

I still think the EOIs will always be performed on the affected vCPU
context, but I don't want this discussion the block the current
series, so I'm just going to drop this patch.

Roger.

