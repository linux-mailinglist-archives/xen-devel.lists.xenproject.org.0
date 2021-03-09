Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4EB332ED3
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 20:14:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95720.180694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJhnx-0005V6-8a; Tue, 09 Mar 2021 19:14:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95720.180694; Tue, 09 Mar 2021 19:14:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJhnx-0005Uj-5S; Tue, 09 Mar 2021 19:14:05 +0000
Received: by outflank-mailman (input) for mailman id 95720;
 Tue, 09 Mar 2021 19:14:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7uN4=IH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lJhnv-0005Ue-J1
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 19:14:03 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6768ce61-3420-43f4-9c77-f92a8408f2bb;
 Tue, 09 Mar 2021 19:14:01 +0000 (UTC)
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
X-Inumbo-ID: 6768ce61-3420-43f4-9c77-f92a8408f2bb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615317241;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fBgNYMacj11GtJoYCFbzdu86nNPk6f6rNknw1z05nUw=;
  b=NwJC/VTFTJiKCyw+33QZVx3/c9Ze0D1COybAX72duVfzsog8XhoaeZJU
   llNGctISRn5P3mZSydejyig38+VIlFvB4IUFhp9A9UQIUtCt8FjIQ+X9s
   RVxwGyOi7haiBz7nj/VrD1aEbG6jmXch6f0OYjDzEROh5BrImwnc7rZUX
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: bjq88UMO4fEqz0qyNMaqW6uBk0fQUEXWI/QedXLDZAMuaC3N4O3XII36aoYpD26RqczYEF/GLl
 dSt9Hi6W+a/PeyIzmv01anGTmC8PGPMBF2+rDdqQcK/mBRzR1xCBDeUq4/uFzZNQacuGd08MKQ
 XXAaBXPACbWVGf+IDYdIrnugCMKF+dNkhKsgSjL3fNLx5jTkBD51brhLgOKgHSHhlgYzvH7sme
 htGe5mIh1ArhVaD5OGPuI9Xxc1cbEJ9/EWRUvetfge9He4foRKNU38TP/fE+1hT4n2FlMsJOBc
 n/4=
X-SBRS: 5.2
X-MesageID: 38888634
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,236,1610427600"; 
   d="scan'208";a="38888634"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPbjplJdwLL8w4B8uJRzEMlWKtmBstzrE98T4fj1l4iZvJh8MJLnB5WParKZpoNBVaVSyQF3cvSocb9yHEXP69KcoVKCTuCHERX1b3pViPg0WpWIgDjJKjk8qqm1Fbt8UWy80aoGuAf1XuxLDyOLsE8V86a5zRaBpacM223wydBK942pXlmbNSx+RFJZhkyPTbumOK0zoBdeIfRCPQtrfsqwlwVe0cPC+C9CGOUM2gags86quq7XZbhghGTNQX1KhL55kFVlEXJpyROjmVPD83rBeBAySlH3KyADE+K011n0OfMOn1vCxQPT3/XmJ6ugTGLqMIVsdDbmvxBW2VizRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfO6ef3wgV/TbuhMnJL6aV6osA8DxyC8z9uW1C6WK+Y=;
 b=Hk9J7KovVzqdiGKPl0FSP9vKVw5jmHVm+sXbFi+QXkHz7uZlLEeM2CCPFuW47qLO2B+zwbMUs7bygc5UK4/G8OkewIlqGVtPH0Tz8PQV9VWvm4Cd/hP0+3UDN4QyTFlGjZLp3hy2ReTD+wKW8fDItYhmLPIXuUl72bPy8HuxxQlea1lXHldJRM9tr/WTT7KycJo0xruSeIRWtWut/dYSFvKyr8QXIvYGS3EiMxYuAYWA5dkdA2ICGcUbyivioXC2f0soGLr4H5JCWEGTq3nGBWES1BHdaYeGJPQs0D8U62reKM/M2cZqhawp/w/xIwZQzBcpxeh0TmfuNBKM3/NdDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfO6ef3wgV/TbuhMnJL6aV6osA8DxyC8z9uW1C6WK+Y=;
 b=YDmM83v5bzNWrb2gHW2v5Fbv+Zvxpi2d9hU5DgHckwEZyvsx4LJu8OxEAXt/oXxeaBWhLQDVVq5JihtH+Khh4Ud09haZ1g+e8SjE9IfsEshzgUcGNk8gq8xJFxVSDCwEKsrD6uq4Oxlg5oJVJOqJ1JLjDLtU8X6oaGIBCTLHMmE=
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin
 Tian <kevin.tian@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <20210309105634.7200-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 for-4.15] x86/msr: introduce an option for compatible
 MSR behavior selection
Message-ID: <dbf31ab3-bae4-0b86-9bb6-bdd4e66e155b@citrix.com>
Date: Tue, 9 Mar 2021 19:13:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210309105634.7200-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0106.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6caac718-e51f-49f2-ec2d-08d8e32f702d
X-MS-TrafficTypeDiagnostic: BY5PR03MB5348:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB53489B5B62E80BF967032212BA929@BY5PR03MB5348.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ltjcgwnTRsi3XDjYmK6HE4F/jQiRuce9OefKaXwQm50OHd6znfXmtvDFOgQAMweeGRP6vD1LgqZrdIK3p+fKAImA5bjOXOfuEah6dybkweoFSptqmhzkTiC1pI7kon464/2uyAn2vpxBLufNrUx78gzViJWaIeezOg2O1d8aJoQ6Sp/jLw2Tq75sX39GF81l4TYg0LVAR1XirHVg1QR34f3MN/Nmf+1iFypvaoHIFz7qh8XCqCIYV2Cx/hOTVUOQhp5NJUGsUcaekpSNyScpNAhdN2eokEmOJSUOufjUthmC9ZcaiA7A5O7PqvOr6VyRTU9/ytsThxOpdtvT02o0VLk5FAKAJ/SxG9U17ZmkG2UVkV14O/TAgDcS/309ULqrFwih1uqWxI+tKr4mBsIwZkg36+gHrhrXEZYvsTyM27YFPMX9/aGZ9jxRlbCIfzmKIvHFy+iMfacAyfNXx1ZeA8FaDMQtsoFzQkRJolM4QbWz+RsLehxiNyEwZaBoLIfhhXyqZHi8m5gUnkvIwxYxfImVRNuCk4Myb6RQ/x/FxpNw9IDwm1jknK2hsgpQm2pbWUVKbq+Fwdlmpv/44vmgi79OV16V/T9DFH+lHe/5tYY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(478600001)(53546011)(6666004)(16526019)(26005)(83380400001)(186003)(66476007)(31686004)(2906002)(956004)(2616005)(5660300002)(8676002)(54906003)(36756003)(6486002)(316002)(4326008)(16576012)(7416002)(8936002)(31696002)(66946007)(66556008)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YWNFSlpUYzc2a1JPV1VMRlZNYzVBN3FaQnVrclpJbkZKSzU4bTdTb0UxaWU0?=
 =?utf-8?B?NVlsVE5Da29oYlpuWTdmUlBwUzRMTll3RTB5Z3FvOTVtaVNQSG84N3FQNEdG?=
 =?utf-8?B?dzlZb2cwTWlPeDFoUWNrNkJEV2hLY0U5dDF3VTYvL1lFTEp0TEhlbE1DQWdX?=
 =?utf-8?B?VFdZMFdCcU95S0ltM2l6YkdwSlVmd2N4SjJwYm1IMmUzU216azFqclJWTzR3?=
 =?utf-8?B?anRTR05pZ3V0SHpNMXYzNURZUHRxZWN2MWw3WmJWWU5Uc0RLaFBGSXVNN3VD?=
 =?utf-8?B?eitsU1lmV1p1K1JHdTU2SGtYS0Z2T1BDWFlkVmRKRjZ5aWVlV0RpL3pyRk5s?=
 =?utf-8?B?T3BCMzZOTUltMFV3K05BdVFNbDROUll0ZDJOZFBNekNqTmxSOGFrRXJWc1FR?=
 =?utf-8?B?VktyTlFRMEU0OURSV1MwQi9ucTE3VXNsWWplY1l6ampuQ3Rwbm1rbDhhSURJ?=
 =?utf-8?B?QmtMMkU3dWhPVERvYVFiQWhMREZZRUFwQ24zajYzZU5rTkJjWEJ0amRkS2po?=
 =?utf-8?B?Qy9CZnYyWE16OU8rNDdCRGl4b1VjMnF2TERXUUZsTjVsVkRsNzJ1Q1VPMEVU?=
 =?utf-8?B?WlltZituSUdqREFxN0pVdlhESmRvbjRnTWFYV2RGUjRVL3BkWldDdGlGK1Np?=
 =?utf-8?B?VnoyT2NGY0czNmxjYXpoYlc2cWtWZkQ1UlVPU2trd0F1TjlyTTJPT2pmT29z?=
 =?utf-8?B?czFyS0I1WGJibjk0eUlwUHdmUm9YV0x1TjZnTTB2cmZKN3pLUFQ5ajhTUWJo?=
 =?utf-8?B?aGhSSWp0cUZwT0grdFc0cWxISWtsWjFpLyt4N2d4WjA4bFErY29HZk5HZC8w?=
 =?utf-8?B?NGp4bG8zbWcxek52L09MT0VFeGRmV2RWcU00L2JLV1lKQjY3eXNYbnptdlgr?=
 =?utf-8?B?bThXbE9zZC9lRGMwWm9QMFJ3MTZ0MTVKelBlNmRlNytNZTRsM0U4VFVReXBZ?=
 =?utf-8?B?OUpobTNGVGZPNGIwaW44eWpDNkd6OU5CWXJ5RU4rOVhSTjZnUndSd1V0WGNF?=
 =?utf-8?B?d1hkTFZkNmFaVVBEMU5TVjVNRmYwZDRCaWsrd0JqM3pyNGI1SG9aUVB4OXE0?=
 =?utf-8?B?Z1I4YTh1Ym4zT2h5QVlJSXJYVGdRSWpLbDQ4TnlwYUJkdmNYc0I3MUtCVHc2?=
 =?utf-8?B?NWVRQkplZGFYK3Jvblk2RU4yc2dQa2hjY2pGTC9Cb21WTTNGc3BoRDVqQk52?=
 =?utf-8?B?UWEyNnlJTWZUMzVWR2l4eXZtWTA5QWpUREdOckdTelpVQTJsaFBzUE1ZZWJV?=
 =?utf-8?B?OFR1OVVHM0pVU0JHNkQ1Q2RSUlNBSm5CaTZqMGVkb0VCYzZoUXE0Vk5ZSGxE?=
 =?utf-8?B?Z0ZZaXdYeWwxTGZobkxrQ0FUcGRTTnRLMTFBeDhrbDYxWVhiRHpxYkFFaEor?=
 =?utf-8?B?R3hyUjFZTENrNDVBSkpkc3d6UDVST1ZyUThGRVZNMnplLy9uOG8zL1BYRERk?=
 =?utf-8?B?Z1NyMFRCSTlhWDQxcDZNYjV2dXU0OS92U0V6UXVKT01ZZmdWL0V3YWx3U1lK?=
 =?utf-8?B?ck0vemJSL0NpdFMycEhRQ1gyaktudU8xSVJMYThhRThvL1VtVnFpdVNBalp6?=
 =?utf-8?B?Y2lKMVVRajBwYWFVd1BqQXNaNWZaTkxkWGZhSmYxUjV4eS83aFcxZ1IzbDJh?=
 =?utf-8?B?TDdIUGJ1S3o2WnlKTFR1ZWwyV3l5NU9kdDN1UTVDdkZqTmI4QTZKN0FXbkxx?=
 =?utf-8?B?NzM1bVNzckRNOUppTVQ3WDV4dzV6QmFyZHVWWmw4QUlsejJtWTU0Vmt2anZ5?=
 =?utf-8?Q?g9TPuxWUPDX9XbcyNfvUUZHWh9bugBG+EextWAI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6caac718-e51f-49f2-ec2d-08d8e32f702d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 19:13:36.5906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+2ucrpi80eRTqNXSqTVNxWsTaI3EFhElO4C5HnADTMGpuMOZgSjkOMARxAvUnESLQfvcut0oJb3oCdhisZnvpdOzTkOFFAKgcsLVxUDuPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5348
X-OriginatorOrg: citrix.com

On 09/03/2021 10:56, Roger Pau Monne wrote:
> Introduce an option to allow selecting a behavior similar to the pre
> Xen 4.15 one for accesses to MSRs not explicitly handled. Since commit
> 84e848fd7a162f669 and 322ec7c89f6640e accesses to MSRs not explicitly
> handled by Xen result in the injection of a #GP to the guest. This
> is a behavior change since previously a #GP was only injected if
> accessing the MSR on the real hardware would also trigger a #GP, or if
> the attempted to be set bits wouldn't match the hardware values (for
> PV).
>
> This seems to be problematic for some guests, so introduce an option
> to fallback to this kind of legacy behavior without leaking the
> underlying MSR values to the guest.
>
> When the option is set, for both PV and HVM don't inject a #GP to the
> guest on MSR read if reading the underlying MSR doesn't result in a
> #GP, do the same for writes and simply discard the value to be written
> on that case.
>
> Note that for guests restored or migrated from previous Xen versions
> the option is enabled by default, in order to keep a compatible
> MSR behavior. Such compatibility is done at the libxl layer, to avoid
> higher-level toolstacks from having to know the details about this flag.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thankyou for doing this.=C2=A0 By and large, Reviewed-by: Andrew Cooper
<andrew.cooper3@citrix.com>, subject to some pandoc syntax fixes below.

However, I think it is worth saying explicitly that the reasons behind
the changes in 84e848fd7a162f669 and 322ec7c89f6640e (not leaking
hardware MSRs, and not breaking #GP-probing) are still legitimate, and
this influences the change in behaviour between msr_relaxed and 4.14
(i.e. read-as-zero rather than leaking).

> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-li=
ne.pandoc
> index 4737c92bfe..6cf61a5c57 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -740,7 +740,7 @@ Specify the bit width of the DMA heap.
> =20
>  ### dom0
>      =3D List of [ pv | pvh, shadow=3D<bool>, verbose=3D<bool>,
> -                cpuid-faulting=3D<bool> ]
> +                cpuid-faulting=3D<bool>, msr-relaxed=3D<bool> ]
> =20
>      Applicability: x86
> =20
> @@ -789,6 +789,21 @@ Controls for how dom0 is constructed on x86 systems.
>      restore the pre-4.13 behaviour.  If specifying `no-cpuid-faulting` f=
ixes
>      an issue in dom0, please report a bug.
> =20
> +*   msr-relaxed: Select whether to use a relaxed behavior for accesses t=
o MSRs
> +    not explicitly handled by Xen instead of injecting a #GP to dom0.
> +    Such access mode will force Xen to replicate the behavior from the h=
ardware
> +    it's currently running on in order to decide whether a #GP is inject=
ed to
> +    dom0 for MSR reads.  Note that dom0 is never allowed to read the val=
ue of
> +    unhandled MSRs, this option only changes whether a #GP might be inje=
cted
> +    or not.  For writes a #GP won't be injected as long as reading the
> +    underlying MSR doesn't result in a #GP.

I don't find this overly clear to follow, and it also misses stating the
default explicitly.=C2=A0 How about:

---8<---
The `msr-relaxed` boolean is an interim option, and defaults to false.

In Xen 4.15, the default behaviour for unhandled MSRs has been changed,
to avoid leaking host data into guests, and to avoid breaking guest
logic which uses \#GP probing to identify the availability of MSRs.

However, this new stricter behaviour has the possibility to break
guests, and a more 4.14-like behaviour can be selected by specifying
`dom0=3Dmsr-relaxed`.

If using this option is necessary to fix an issue, please report a bug.
---8<---

Other pending Sphinx work is drawing together the "how to contact us"
information, so the various "please report a bug"s through this document
will turn into links.

> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 23bbb6e8c1..d217c223b0 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -749,6 +749,7 @@ static struct domain *__init create_dom0(const module=
_t *image,
>          .max_grant_frames =3D -1,
>          .max_maptrack_frames =3D -1,
>          .max_vcpus =3D dom0_max_vcpus(),
> +        .arch.domain_flags =3D opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXE=
D : 0,

Can I request

.arch =3D {
=C2=A0=C2=A0=C2=A0 .domain_flags =3D opt_dom0_msr_relaxed ? XEN_X86_MSR_REL=
AXED : 0,
},

please, to reduce the patch complexity of further additions inside .arch.

> diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-=
x86/xen.h
> index 629cb2ba40..f9d0e33b94 100644
> --- a/xen/include/public/arch-x86/xen.h
> +++ b/xen/include/public/arch-x86/xen.h
> @@ -304,6 +304,14 @@ struct xen_arch_domainconfig {
>                                       XEN_X86_EMU_PIT | XEN_X86_EMU_USE_P=
IRQ |\
>                                       XEN_X86_EMU_VPCI)
>      uint32_t emulation_flags;
> +
> +/*
> + * Select whether to use a relaxed behavior for accesses to MSRs not exp=
licitly
> + * handled by Xen instead of injecting a #GP to the guest. Note this opt=
ion
> + * doesn't allow the guest to read or write to the underlying MSR.
> + */
> +#define XEN_X86_MSR_RELAXED (1u << 0)
> +    uint32_t domain_flags;

The domain prefix is somewhat redundant, given the name of the structure
or the hypercall it is used for.=C2=A0 OTOH, 'flags' on its own probably
isn't ok.=C2=A0 Thoughts on misc_flags?

~Andrew


