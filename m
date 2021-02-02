Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE1A30CCEC
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 21:21:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80719.147847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l729o-0000LM-Sf; Tue, 02 Feb 2021 20:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80719.147847; Tue, 02 Feb 2021 20:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l729o-0000Kx-On; Tue, 02 Feb 2021 20:20:16 +0000
Received: by outflank-mailman (input) for mailman id 80719;
 Tue, 02 Feb 2021 20:20:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hKoN=HE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l729m-0000Ks-IV
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 20:20:14 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 48f434b9-a5a7-473b-ae9a-0ab9bc10e455;
 Tue, 02 Feb 2021 20:20:13 +0000 (UTC)
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
X-Inumbo-ID: 48f434b9-a5a7-473b-ae9a-0ab9bc10e455
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612297213;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QgP6yjKg+mlauxL/HyT5hLy0ghIAYuihbD/tCZr3B7c=;
  b=MJs/Dej/pwdYiMxC9/IMPNBorKffCLdiyQkT5WKVTrfcaiEp0pw3kqXK
   hhf5Denl2BYuDKKMdno6D2SYHopN7PH62d666PFHp94nHKe4V0M8WtbxI
   RDf+eKfzNRTblmuxZ0z+nT+ll+OV6megEe57qACjsD628OKV2H4QwPwi1
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 05MAMcZDHTXpvnN7QUdfKdGQCNESx24zxLjArGvTN5AtaHhxA9aaUqYruoy5ION8STlVJGXNAm
 u2Jy+pM9+jRKiaoT+6sQpR5X90cmiwxK0wjxuRb4xlHGvPClFNdDnT5sr46Y9vcLuSL85z9swo
 fVgDaz8MKFJ2GEeDgXWp+u6Rpzf396vl9k2f1jCIUp2LhtpPhSdhBPLvAO4dJvAU7Au7m+vdA3
 Au8dWi2h1KfpLfwbzSsaCblsb+zNBU243jXeBBabsJTRVlEO7QJ74enJ0tW56WV5RilGtzr3A4
 3zo=
X-SBRS: 5.2
X-MesageID: 36361996
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,396,1602561600"; 
   d="scan'208";a="36361996"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/eG/z9QhHDlDYrgXuln820Xwt/gwyo+0lgKYryQxmtJ0FxgcGhzKmLcVAKlwiuBDTiPT9BKRYNVDXL1Wj6Q/738TgKpRNSNyUNATLdeVFmiu4xc2CQbzC09o3340Vx1Oa0OONaMsnd91K4Vjme0ez63P13h3yhLRbzRe+M5o20mpTDst1aHQfGNOWVijQwAs3U5zRt8dmQvRBg8Wo2VOGONw/NOPMFaxHNjSDT3kX2/V+ROnVWMtSflaO2TdyboKwKkpcNGpOBeBm6wKtZYitG0K+O39RGxhuvx9UK91xtFObxGN72bERRnwgC1PEq84pUBxbjLaLuZ87vVigIRrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWFxTOYSry2yTzeXDwa9CxCFiIJ9+9gB22vrE95pGKA=;
 b=LXcbxAf9jThKZA34PqxDplemnPK22Xb3XPLfZ4U+MjgfqTxlhBF/NFMx+iIYvdWHby+KRdG5RS6cYr3AbUmN4/6xxsEMSQjO31VoFRDtwUECeXTGIPISkqTPh3yo1pslIUOcDYeph/JzbjVQMUMttYwKqewG0cURFY23b4M71H5dy45GKji1bY/SAGI5VpD6W55YC9YIkshFT2btj4oL1zZz7lHcFuylkCF4P1Zs9EOC/QL6yzT5nMgDo7I3gPrYu8i0s6ur3Zvuv+heGOCRDV+Zyzd1dxSA4AAuwg9t6fU4xr78yVuhWzp3+pPlURIegB6+4VzrairjZ2BX5Bqy9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWFxTOYSry2yTzeXDwa9CxCFiIJ9+9gB22vrE95pGKA=;
 b=Q9mZz444Z3CTa32dmI3FD8kkWsHjiqWh6bgX/Wo6THyFjxnwF5nt36knagF33a2/rkiE+tsMaOlCGJSYtAah8FrLP88xV6N0EvjYvmpA1FO+V7Vxj+4YmSHlBCpzO/Fnq5gniACIbhdUCZp5vqpF1c2LbvN6hxLbnMquCSGSSu0=
Subject: Re: [PATCH v9 00/11] acquire_resource size and external IPT
 monitoring
To: Ian Jackson <iwj@xenproject.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Jun
 Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
	=?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>, Tamas
 K Lengyel <tamas@tklengyel.com>
References: <20210201232703.29275-1-andrew.cooper3@citrix.com>
 <24601.17287.280124.602809@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e2cecfe6-2cd0-0d92-8f17-0283bc1f8503@citrix.com>
Date: Tue, 2 Feb 2021 20:19:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <24601.17287.280124.602809@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0453.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::33) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6d2bdbf-4420-4b4e-f869-08d8c7b7dbeb
X-MS-TrafficTypeDiagnostic: BYAPR03MB3975:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB39753D99890C2186D83FB660BAB59@BYAPR03MB3975.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3MvCagPPMUYOWZyAuBOjAHGVki6SmvSZY3Rr7pZgZDWt9q0Rt6ZZuycBiKnhYmJW0K2acmvxSeXH53HUCr778ePerWD2p2hCtpQAXHjCsKovP8WfCmC8pKqliyj8Gt/ggHkXhROpeFaKoD33Je82uZpIsif7rp/hyzOJnD9WSe+emlfcFSvLG0Foi1fAZ7RsLjSZMyfQ95MYMqAppWCVzjAST3wsszMplbA70NcTZmDiSgf9aCWD+XA5VFJcPf9QYvza7pKJa+670p95D8HrqWWwkfRIjBg+/9wpZJsA6RXoGvzBkL/3awF6z16Hkst4gwi7zRQFohRVuxZG/5ut1j/mBtGE1Y4JXNl1/m4h2MkyoqUl15Vc7f9IPrWrfFcifUGn85jzk0Zte/eMgnsOjvuSGQ9ApDq+KQpbP9qGOm13kT0vRKinEIkPb64ZhQttbBit5GbE9HUmXlKvkqyedpi3yzZ8hdkAWViehV4qlw429xdsp+fb777TG4y5C1YRd8/DvVasn55jKvy79rH1lw7/2wDVCcmHmNL6n6LRtcnW1xeIG2qLqUyMg5cpAbPnEvnCvlS1sN/K4DoXw/VgkFfeMX4rGJwk1fFpLkIhax4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(16526019)(956004)(26005)(8936002)(54906003)(186003)(5660300002)(16576012)(36756003)(31686004)(316002)(6916009)(86362001)(53546011)(8676002)(2906002)(2616005)(66556008)(66476007)(31696002)(83380400001)(6666004)(6486002)(4326008)(66946007)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NVBEZWs2UHJ0cTNUQU9UbGFzNmxHWHl0NWl3NnNWMmdGRElLUWJWek8wbEI3?=
 =?utf-8?B?eCtPQWRwZTdaQkxwaGFOdEpSUllnczZ2VVBvSVl1dno0bUNQWFlMSXRabHh2?=
 =?utf-8?B?WmM1c2ZJcnQxZ1FvL3Y1T3gxZ2ZJRjUvMjQzTjY1bi9XanlNQ21CQ1lKN3Ix?=
 =?utf-8?B?SURkL05CdjBwZFEvbENYdjJ1T3o5SkdSUWFnbll4UVQ1c2dmVm5LbFFpZ3h2?=
 =?utf-8?B?clBpMFhuT2RTcDZrNUU0UmpwdGx2Q0srbE5EelovSk5PWEp2K2JHdDNObCtt?=
 =?utf-8?B?MVZUNVdYWWQ0Ymk5aHA1WFJwS04wMkpON2dFRllyQzd6Wk9vY1JURDgxQVhC?=
 =?utf-8?B?N3Uvck5IQXhFVTBMa2F0WnBQQkpsRHBEYTVKSzBtdGYrNm8rMVVtRkp3aG1o?=
 =?utf-8?B?MVhjOHlOeXVZb2dCajFEUVVGbDFYUUFIVEZwNzErSWZhSUtoK0xsVGV4b2ll?=
 =?utf-8?B?NU44QU9iZ0x2SWtWNVMvYnZWWTB5YlNGdU9oZnVCWThUL3dQaDZKRjhuMm1J?=
 =?utf-8?B?UlVnMVpmdXkrVDgxSC8rT3RteUNyTVprVzJWL0x0QkM0eXdhaUhMc3VwM0tk?=
 =?utf-8?B?amFCYmNpejRtNmMwNGlGMmFNaTI0d3h0TGJFMHpWZi9GMm92STN1OVp1TEQy?=
 =?utf-8?B?aWM4Q2wvSC9qd2k3cE0rY2NnNDdxRnAvdlEyM25pekhDYjFIQmNNSUd3c2lw?=
 =?utf-8?B?WVFoU0pGK2E1SHcvVkIxbkxhaU9JMkNyMmFKZUd0bFg0MXduNGZNeXc2Rkpv?=
 =?utf-8?B?OWUzVGQzNWF6ck9uQVpKTGROekh4VGJBUlBUWmg5K1JsV2tvanBkZ29CK3hL?=
 =?utf-8?B?RnpkQk5nZWl2TjBtUDBuN1FRWklZeGJROUdtakhnWFBjeU1maUJyODlPVEth?=
 =?utf-8?B?b2FGelI1M3NZOHNnQjE1ZjgyT1ppa0VQeklCSmR1TVRRRGV2cDBuMHJEektX?=
 =?utf-8?B?SU5tUy9kZFMvN0tWVEQ2cTJaTSt0WDRhdVFyWGpmQnU0QU1XejZ3MXY1V1lN?=
 =?utf-8?B?dVFmb0wvRXBOMjQ2Ny9TdkNHYjljT3ZJR1VWMGNHTG8rY0xJQ0tKZ1kxcG1q?=
 =?utf-8?B?NkdSN3QxeTNYYmlTUE1lb3lHMi81MXZacUREY25ER2w3YVhPQ0Z2em1NSk5L?=
 =?utf-8?B?aWlQdDNxSjlyNVNPcXljaVY2S0NaSmNXUmhjZjhWaHVsMkl2VmVtdFA5bVAz?=
 =?utf-8?B?OXNGcGh6Ui9ZZ29GNjFlYXZ3UUxFbFNYdUZXRXh6dGZDVjZGbGJObUp3MzFX?=
 =?utf-8?B?VnNtWVFMczF6Vm93aDBTR1FZSUlUNVdnMGphak9OUktmN0xlb3I1V0dkZzh4?=
 =?utf-8?B?ajhXYThvQUUyOHRvc0RHMzZSMWYydHA1ZzFOVVZ2OVZWZGdDRDdBUkY2QXVH?=
 =?utf-8?B?aDJDMDY2WnR2ZDNXdFFtWmRQd2dJWStlR1VHSXFiaU8zeXVManNZQ3hxZDVu?=
 =?utf-8?Q?mLVdBvYI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d2bdbf-4420-4b4e-f869-08d8c7b7dbeb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 20:19:35.9140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W8LGu65JAoL3kv3fASM6vTaQJfu6+y4pZSndz1dQ00YPg9RcUDiiuzA/J2RaiMIUIBs2qTojqQ0VdBDHr7rZp07aVDd61i1pLRk2JjRd5vs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3975
X-OriginatorOrg: citrix.com

On 02/02/2021 12:20, Ian Jackson wrote:
> Andrew Cooper writes ("[PATCH v9 00/11] acquire_resource size and external IPT monitoring"):
> ...
>> Therefore, I'd like to request a release exception.
> Thanks for this writeup.
>
> There is discussion here of the upside of granting an exception, which
> certainly seems substantial enough to give this serious consideration.
>
>> It [is] fairly isolated in terms of interactions with the rest of
>> Xen, so the changes of a showstopper affecting other features is
>> very slim.
> This is encouraging (optimistic, even) but very general.  I would like
> to see a frank and detailed assessment of the downside risks, ideally
> based on analysis of the individual patches.
>
> When I say a "frank and detailed assessment" I'm hoping to have a list
> of the specific design and code changes that pose a risk to non-IPT
> configurations, in decreasing order of risk.
>
> For each one there should be brief discussion of the measures that
> have exist to control that risk (eg, additional review, additional
> testing), and a characterisation of the resulting risk (both in terms
> of likelihood and severity of the resulting bug).
>
> All risks that would come to a diligent reviewer's mind should be
> mentioned and explicitly delath with, even if it is immediately clear
> that they are not a real risk.
>
> Do you think that would be feasible ?  We would want to make a
> decision ASAP so it would have to be done quickly too - in the next
> few days and certainly by the end of the week.

Honestly, I think this is an unreasonably large paperwork expectation,
particularly for changes this-clearly isolated in terms of functionality.

I'm going to explicitly disregard build/compile issues because we're not
even at code freeze or -rc1 yet, with multiple weeks yet before any
potential release, and loads of tooling.


Patch 2 adds a new domain creation parameter, which is an internal
tools/xen interface.  Default is off, and it needs explicit opting in to
(patch 3), so it will get all the testing it needs in an OSSTest smoke run.

This patch does introduce one new use of a preexisting refcounting
pattern currently under discussion.  It many leak memory in theoretical
circumstances, not practical ones.  Work to figure out how to unbreak
this pattern is in progress, and orthogonal, and needs applying uniformly

Patch 4 adds a new resource type, which is an API/ABI with userspace. 
It is a new type/index so has no current users.

Patch 5 adds enumeration for the IPT feature in hardware, as well as
context switching logic.  All context switching changes are behind an
opt-in flag, so a smoke run will be sufficient to prove no adverse
interaction in !vmtrace case.

Patch 6 adds a new domctl and subops for controlling vmtrace.  All brand
new functionality with no users, and bounded by the opt-ins from patch 2
and 5.

Patch 7 adds libxc library functions wrapping the domctl of patch 6.  No
users.

Patch 8 is example code demonstrating how to use all of the new
functionality.  It is built, but not installed.

Patch 9 extends the existing VMFork feature to cope with VMs configured
with this new functionality.  It is a no-op for regular VMs.

Patch 10 extends vm_event requests with additional optional metadata
about the tail pointer of data in the vmtrace buffer.  Doesn't alter the
behaviour for regular VMs.

Patch 11 extends vm_event responses with an optional request to reset
the vmtrace buffer position.  No users, and a no-op for regular VMs.


All of this new functionality is off-by-default and needs an explicit
opt in, for any behavioural changes to occur.  While there is no
guarantee that the implementation of the new functionality is perfect,
the development of it has found and fixed a whole slew bugs elsewhere in
Xen, and the new functionality does have extensive testing itself.

~Andrew

