Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25003321A81
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 15:46:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88141.165618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lECTe-0003xi-Gk; Mon, 22 Feb 2021 14:46:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88141.165618; Mon, 22 Feb 2021 14:46:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lECTe-0003xJ-D3; Mon, 22 Feb 2021 14:46:22 +0000
Received: by outflank-mailman (input) for mailman id 88141;
 Mon, 22 Feb 2021 14:46:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w45/=HY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lECTd-0003xE-5M
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 14:46:21 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ca78438-57aa-4654-87f8-6416a19a7a62;
 Mon, 22 Feb 2021 14:46:20 +0000 (UTC)
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
X-Inumbo-ID: 1ca78438-57aa-4654-87f8-6416a19a7a62
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614005180;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=XtPu81e5ECsp17twcbkQo4WLNEM8H6KJjOumt4fkz90=;
  b=IKr4uDRzbZj7eWpW1c4BxtivdM66I/pynEOH+roB8u0fdes4u2gciAG5
   O9/qBPkUlXbR1EyhKcSM7pxdbDj3rbaftB3o/eIhdaon7fsY/l+YK5e9N
   OqRWOGWQ1p6D90mtufeB2OqP3YiCjE4jAuJGsdkjptaGdlF9kCuViedOL
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GpHzofYtOioQ7Swf8sRu6kijspYGgVnryXNhpBZJAfcUsv1v6FBJpN6RRevA/8HugoJXnxBMv5
 eN4Wdgb3PaFP03zmZ7gwcozX1/HoeBg3QawXGWTF7GWa3fcEDhz8L9ks74ChbDaYy3nSkmgLhw
 86uDfnoCL594Xv3Dm8B9Q11C/Ox5+X6IvyMzAeAfgHyEBE52lnivPHTkb94li8q6DLf/RTniSK
 JgHK9WOLrq9/ECmbMmq8ZBGQkKJROwGuNTGrKeLLlMPsVcYHVdB42zX80gYNA8m17uaiCxi8hg
 iiQ=
X-SBRS: 5.2
X-MesageID: 38111707
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,197,1610427600"; 
   d="scan'208";a="38111707"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YW7XWaViBCnvESqwAxr6LaINwkR25d5qYw+uc17+0LKMQqQIqfzc/ydgacJHPq0ItiSwa7pSLanaRAe3C3qKyB2y+ePEi8hdGAb/aL89335fLW03BCsJDEf2B3U2LfmBEtAE4OdxZ6QbkXYARy6Xgz7NY/sCtCj4xKziwN4LNkzLrQ43EnWHXSHtpCL28y9xtUe/0DbktqPk2ECcecrw2FEwj6b5XX696apQqa9bAPH476Mckx7Y1huLnFNIzk3tefxIsqj6erwlAV4E1Ld1MRx1RPZn4ehmvWXfl0U9T9tWtco2ojavWiGNPv4D4RBfP1VpAE6tqaLDa/NYU9Sw2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5znb0meEW6WIg2ygXXgb/pfy3QminwbKmrSm+/8LeM=;
 b=mw7z8U0PSBziBhdR3V+Lm3Y2k1dVC7oTSWhSmXIIYJ1lWhs5mZBPqaMjgGJ+zAK5zV41LjS+1eIc9ZxrcFnYuQJdWbSVdD3x7lQGyeh8sR5mN75mYKMXNV2a1Wp2PraKVSSIs3igJfpYbhlUw/LXxaM5BirIjD+5xyr472Ztb0MTXKApq4MCirSuVarkvJZ9UJJz+DnRPaKFrs756HpI2azLdin6TxSAd3Izpv9FHe2GnFSKV+yOkLsrG9Nfvlo4YNdjDKe3t6MABlADsLbxOH+ZR7RNM1ICIBK6JNNA3rt/5oE92CZg0UthnlgQYntoaWn9AeBkqY9tJ0+pHe4Opw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5znb0meEW6WIg2ygXXgb/pfy3QminwbKmrSm+/8LeM=;
 b=RNvodmJbmmNu/uFJAF5qkfNUbL2fy94tZVtX5+0uMp+KtjpdEFSLgZvqFd2DD7xDYczba9+zS/eNQ54s84w/+rm7VQuyh9CEXrlWFI+kgyTzcH5ciwTLmQ5SRrgAJcVF/mXNDE9UVRsItmHoldyHYPWHp5mEonNN4+4tpie/L5g=
Date: Mon, 22 Feb 2021 15:46:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: [PATCH][4.15] x86: mirror compat argument translation area for
 32-bit PV
Message-ID: <YDPDsxgSJMPUk1DW@Air-de-Roger>
References: <bdedf018-b6c4-d0da-fb4b-8cf2d048c3b1@suse.com>
 <YDOW+ftkNsG2RH3C@Air-de-Roger> <YDO8CM0prPjoo/X1@Air-de-Roger>
 <d66da403-8054-0313-cf1e-cf3c539ce33a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d66da403-8054-0313-cf1e-cf3c539ce33a@suse.com>
X-ClientProxiedBy: MR2P264CA0170.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::9)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e7bb71b-0202-4536-12d6-08d8d7409b29
X-MS-TrafficTypeDiagnostic: DM6PR03MB3676:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB36763B70E35810231A69D87E8F819@DM6PR03MB3676.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mw05rfo/9XmRh0P3J+XQKFrjrckY0NqNQ+kAHrHzfR0WJafnOZ5FJ5M3U5Ct5tMF5grDF9lrzitDBXkE4DbvgTzqQl3Zh/ybqOhsCFjsMlnglN2AwdGllLv6kx9HhxKaJDyw2ieZbY3gkMIMsoI+IMBfRE0D3yDLH7CJICYdQIFhtfJ6/FdQeY/Ggjw3+8tmNwIWdzwtKeNqMWqQEBLVkO7uzS8Os36xsQzjyundPLvEm6aqeKAs3h9W+hQHWIUITAPaDK+5d3nuP6xzmkjnqRVLE590hWaN2PR+4Y5sTUEZPh4T0cmPTk2gxW1LQBZo3ZNTuXnBtWlx4ZQRuxHr55pE9cHh6BZjsXNLO5bUpaw+efV8Cvc+CW0HmC8eoZYy/DzSIJ2Bo4ew73pqOO1DDQSr21gdnhCLqV1fdYU8gjLRB4X7gE0QOaCpi5hqxj2Qmq0rWEMzGs7IEqLIK0/zDnSD9D/ZSOq75gOJPxKTwv7Yv90Oyz8161cqXIo25AGpIyesEhVU7klS0R6YD0i+uw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(26005)(316002)(53546011)(83380400001)(86362001)(2906002)(6916009)(478600001)(9686003)(16526019)(6486002)(956004)(4326008)(186003)(8676002)(54906003)(66946007)(66556008)(85182001)(6666004)(66476007)(33716001)(8936002)(6496006)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TG5TR0dmZ2RRWVhmYkxmZW4zQ1NUT3VJSXhXWnhFSDdCaHRScUhwMEdpWXdw?=
 =?utf-8?B?SkdkMGMxeVhMc1BLWDkrQ1Qza3RUYmNOTUcwWkJueXRZbFg3T2dOaHdyZjhs?=
 =?utf-8?B?TFFlV1BsV3FoMENUNnQ0c2VSdnhHbGxNZXVoL3FhTk5XVEFhSTR4dExCMGVi?=
 =?utf-8?B?UUlyK0p4QmFoMk5QcGJqWVNXYm1KYU9SQ3FISlZGZGFaUExKZkM2Ynh3YUxx?=
 =?utf-8?B?dTFlZHlYWjlmdzRnWlZuRDJaUnpoYUlnUG5oVHhZR25xaEVXSWtVSklKSmFv?=
 =?utf-8?B?cW5ZcCtpTWRVT3Y2OTQreUhlUGpDWWJhdEt4K2RpVUZ0VThxNWtkd1o2WHRt?=
 =?utf-8?B?V3p1aFg4V1JhdkVJREJ2SjgzQjh0eVRNQ0pNMS9sdzVjNFF4SURsRlZUNE9X?=
 =?utf-8?B?U2FoYmZhc3h2Y09IbktSZlhyL3hFOHk0cnhNcERFbFpvM1FMUGo2Rk9MM0hM?=
 =?utf-8?B?VUdyN05TMmM1WGFWQzhMcW1QWWRtODk5V2RSQkpwTlZ4UWRhOFFYUVpsKzYx?=
 =?utf-8?B?TVdIRUpTOVR6RWNVb0laWmErc0J1MzZ5akVXS0xRNHIrQm1aMW0rNk4ra09j?=
 =?utf-8?B?V002N0pMN2c0T2ZzZkoyNzBXckIyS3BEbnpGWWg2QlJEMUN1RlRzTHI5L0ZC?=
 =?utf-8?B?enA1dzFTaWJTeTRoV3B1VmxnNHQ4aGMzaHhzc1hYNU1xRGNTemNQNUVJM1ZT?=
 =?utf-8?B?L0tWM2p1ZGs5dk8yWUV5TnAyVmFkd2FKSm8vVVplb1BOWXM1UXdxRWJLaUVY?=
 =?utf-8?B?d1FwanZLTUx6Yzdha0RLbXRHOVN6SlBvYlBYcFVtVVlJemlaSVZ2elJQenBw?=
 =?utf-8?B?Nm1LL3ZMTHBMRTA1REcwTDNUVmN1VXZhT2FTTG5PV2FtOWp0SHJBRnJ1WkNm?=
 =?utf-8?B?NU1JTytUNXNXRFN4bSs1ZjFiYjRLUk1STEdyZzVkS1daZGEzR1BWRnh6SVZH?=
 =?utf-8?B?Qm5zVWJXa3N2eE4rdWdyMXUvUGU0MlVqRU5sdlZyMXhzNnN4QmdpSWVwbnJX?=
 =?utf-8?B?NFRVUzFWQ3M5ZkRsUUNuTW1rRWNPWXV4WjMyM0JwZUdsYTBINzdGMndKa3Z3?=
 =?utf-8?B?Y2dRNnJPRXFtMUtjb0pDNDJ6OXdXaGM0dGNuendDMHNFN3dmVnVoWXZGRjJS?=
 =?utf-8?B?S1RFL3FwSitDaldQMVdvLzJEeWRuQU4yQ09SaGlIalB3cGsxUWVIVDZkdTRG?=
 =?utf-8?B?dzY5VERqbUdBY3ZtYVRTa3dpMTRpRi9NRHdnRXg3bUlMZGE0Tlh0QUsrampL?=
 =?utf-8?B?SDd5WjJHcWphSFpDSWt1eWlPRlF0TG83VXc2QVU1cGw2UHB5d2ZtU1NqV2NE?=
 =?utf-8?B?aXJnazc4cDJObkx0ZElqa1BnbUxtVG1VNVFITm1JbkpTRndNeW1Ldm11Zk9p?=
 =?utf-8?B?OVhDVXI4L3BrM3M1WXFld3VnTmRRSFJlUTZEcm1sZ1BJWlgxK2U2a1ViTldk?=
 =?utf-8?B?eXV1d2lHL0FRTE8weHR6SVBPQ3BlV2VEUXNFU2N3ZG5kN1FBT2tmNlFHS2I5?=
 =?utf-8?B?L0gvaFdiN2hvRTRlK1MreXRuSUpKYkJURnlhdHgxT0N4dHZSUUxaSjRmR0tX?=
 =?utf-8?B?YU5aK2o3dUxLTWpURGpjTWpUc1lsVVp5OUZpa0crOUYvbE1PMlhvbFUya2Iw?=
 =?utf-8?B?dU1rOUNKVHlWeHN5ZVVYR3JKTG1HQmpvNkw2UWF3eFRkbytoUWdIcGdJMVVp?=
 =?utf-8?B?SjIzek5vcUhoZzhWaU5oZzhDbXNPWmsrYy9jVzNDM3pEdXYwcm9pb3UrcElN?=
 =?utf-8?Q?zQvLHaGrwoy8fXDlwCD0/DfnilI1VJCBGb8vo6z?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7bb71b-0202-4536-12d6-08d8d7409b29
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 14:46:15.6353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JO3CR6tIPWWE7E8Ip8k2IbwqFGX5us4h6MjDQgVAzQfBJkIhGOLZ6dLrtjDSvhhIP50Kj3Go1mrRLfU9o3J3Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3676
X-OriginatorOrg: citrix.com

On Mon, Feb 22, 2021 at 03:20:24PM +0100, Jan Beulich wrote:
> On 22.02.2021 15:13, Roger Pau Monné wrote:
> > On Mon, Feb 22, 2021 at 12:35:21PM +0100, Roger Pau Monné wrote:
> >> On Mon, Feb 22, 2021 at 11:27:07AM +0100, Jan Beulich wrote:
> >>> Now that we guard the entire Xen VA space against speculative abuse
> >>> through hypervisor accesses to guest memory, the argument translation
> >>> area's VA also needs to live outside this range, at least for 32-bit PV
> >>> guests. To avoid extra is_hvm_*() conditionals, use the alternative VA
> >>> uniformly.
> >>
> >> Since you are double mapping the per-domain virtual area, won't it
> >> make more sense to map it just once outside of the Xen virtual space
> >> area? (so it's always using PML4_ADDR(511))
> > 
> > Right, that's not possible for PV 64bit domains because it's guest
> > owned linear address space in that case.
> > 
> > It seems like paravirt_ctxt_switch_to will modify the root_pgt to set
> > the PERDOMAIN_VIRT_START entry, does the same need to be done for
> > PERDOMAIN2_VIRT_START?
> 
> I don't think so, no. Argument translation doesn't happen when
> the restricted page tables are in use, and all other uses of
> the per-domain area continue to use the "normal" VA.

Oh, OK, thanks for the clarification. AFAICT the PERDOMAIN2_VIRT_START
slot won't get populated on the restricted page tables, and hence will
always trigger a page fault if access is attempted with those tables
loaded.

> > I would also consider giving the slot a more meaningful name, as
> > PERDOMAIN2_VIRT_START makes it seem like a new per-domain scratch
> > space, when it's just a different mapping of the existing physical
> > memory.
> > 
> > Maybe PERDOMAIN_MIRROR_VIRT_START? Or PERDOMAIN_XLAT_VIRT_START?
> 
> XLAT would be too specific - while we use it for xlat only, it's
> still all of the mappings that appear at the alternate addresses.

Well, given that such mappings won't be available when running 64bit
PV guests I still think it's unlikely to be used for anything that's
not XLAT specific, as it won't work for 64bit PV guests otherwise.

> I did consider using MIRROR, but it got too long for my taste.
> Now that I think about it maybe PERDOMAIN_ALT_VIRT_START would do?

Indeed, I would prefer that rather than PERDOMAIN2_VIRT_START if you
still consider XLAT to be too specific.

Thanks, Roger.

