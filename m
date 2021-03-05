Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4201032E3A2
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 09:28:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93506.176443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI5nh-0000W5-M7; Fri, 05 Mar 2021 08:27:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93506.176443; Fri, 05 Mar 2021 08:27:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI5nh-0000Vj-Iz; Fri, 05 Mar 2021 08:27:09 +0000
Received: by outflank-mailman (input) for mailman id 93506;
 Fri, 05 Mar 2021 08:27:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FAw7=ID=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lI5ng-0000Ve-1W
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 08:27:08 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8037fff-4e9e-4fdc-9c45-59f90a6fee8d;
 Fri, 05 Mar 2021 08:27:06 +0000 (UTC)
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
X-Inumbo-ID: f8037fff-4e9e-4fdc-9c45-59f90a6fee8d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614932826;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=vh8POYMFxyx0VkNrX2N0alcZPj8n6yeCP8JvSUVPOA4=;
  b=HTOPLeJZS/p7cO/v/Ff6l1c8EpIXxrRUkQw5X1XUXzVYqbJi3dZ20BLq
   CNUHVH/n0zywuZSR20dxHX1WKApQJV3pk2PO3CZmPO5a4a2p1GCLwRqL1
   ukaQUEj0qcLxAQZFWBT5bYwGwTGiJE+hYaNYmZRQnzhedkbh4/wZaCiZK
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: oB/TpDvz2UsCGoxyFxG+hM3jVLgMaSzl1Vsb7uib6LOH2oeMiSf3d5yLqotKESAYzEkq8X+6Fq
 ZRGcp/FrFhQWpeNwllKZ8Eyorar1HQBeozx9F50eRPHRqYuGcD6Jqd+iXr+54Rhtas+9BjM/Qn
 etOW2r68qeI3MEel1dqhQf3kEIMdvVJ1WgVc63AOwfZ7i3nX736unmz25PtDnN6z8wExwdJbJw
 ACOpM01mLUSPofE/AS6Z2keIonJYv9gxsDLLcaRHc0iC6tlDwo43DDdQWPjVweQO1nh9QLO3ik
 kQ0=
X-SBRS: 5.2
X-MesageID: 40025730
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,224,1610427600"; 
   d="scan'208";a="40025730"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCCsthJtrbxHDRobbdgSXWJwHjwOmQYCzDafY5q12oDUSp4OIQW1PB7YO/xshaaBeNuPZjLmp7iWMlHfS3jWPyLyWX+eXJnq5vmqqJEFLoqQuY0kngZS7zs4yOgfAVMINzro2Q1VJ4F6pz23Se1kgHY/TPkTUq+3fdGAAVyc3LcOhyclQNDAa3P7xBcSaICboxeBMSIqOT58BMDeZFiX+mXsNl6+TZzNeW5X87cKGQu7Mx7cBlP5Q0DSxxMmUm5htohelnKecSWX9RqS/c+kaVtNt1uSkk5MVjgwRcFO2QXnQcfnRgSDpz0FSw2sfmtGd9RYiBI7FXI39GPVK74rcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/a65TvFqrVTo8Q59SmXe5rwnFCzjuHoRiLLEmL9zKg=;
 b=UXzYEE9NoxDiVMY5ashFLOu0FvaAO282SmB7TqLlmOrukw2HeCNAniGoFqD2gHAxIEx6I2yOxK44ln0krcDfW7egVAtlBuGfWdRzMa47zoHXZJkGM14PH6QSDqbN2QQ2Hsbzqh+8V0Nm1Qn7d8nW2ECasMWutHtMszZ5JH6TFQgKH2z/PDW8WE9o/+O9/tqGYUiZ3NZt0mbQeO2jIRmKDCSCz/IpFSJEHyQXNK1VlwvUuwUdm20xEAGPJms6CdsrCL+9XyW5nQVfFXgjQqLFh5LX2nEWbaGYrsRv/PJWYJ1kKn9LgEv6yWl7EE0MFGFovwCFcO5KFCQ+TNYWnY5khg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/a65TvFqrVTo8Q59SmXe5rwnFCzjuHoRiLLEmL9zKg=;
 b=wvXVHR1uah2vOYpTRq5yYZd0yECeq/Mkn/NmAtyjEbmmUlqg2u8ezKb3jYIX1siv9lm98jnlDARkarsOV6nkKc2rwdwAsM3vOZlVJeXb1kb+5xR1lfC5LHh9pGOyCIAG/PTA7l/XuqnLFqtP9YG6yLHpBzFdwsUAkJaWtbwNMyc=
Date: Fri, 5 Mar 2021 09:26:36 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	<xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>
Subject: Re: [PATCH v2 for-4.15] x86/msr: introduce an option for HVM relaxed
 rdmsr behavior
Message-ID: <YEHrPIL1EhWjWY+9@Air-de-Roger>
References: <20210304144755.35891-1-roger.pau@citrix.com>
 <9fa2be52-9d1a-e841-5bb4-3180b4b5b033@oracle.com>
 <c8bcb182-2f6c-accf-6b94-440de8af3617@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8bcb182-2f6c-accf-6b94-440de8af3617@citrix.com>
X-ClientProxiedBy: LNXP265CA0072.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 350d46bb-da99-4f61-1cc9-08d8dfb06805
X-MS-TrafficTypeDiagnostic: DS7PR03MB5607:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5607ADA29EFD28D62E63AF938F969@DS7PR03MB5607.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3PyBwov+TgqOdEngGmsWUyPtsFdQxKF2VbVB013w0gLyfsY9c+0Jwdt6eyfd+N8431l2WP3eStFToapcvdStiYfyNbmQGHEEjmckI8XmnTBUr11ltCAaUlsUKRbbhy8AEhoGjynV6vRuKMYtEDclnd4uvjynrj/H41AEaBW6/hxjBfYp6mNjtxaqD+FOHwVjByfDCIbxd0hEZYboQUfr/hZ4c0qv4lkPdy7mf7YjUUjECz+5ywSb9QN1rC81SbL2MlKws9j5CEShfk/Pm1IzVtWS5SPu0tEdH/eZRqqmf9Uyip32zU/xc/ORGYc9NnSY7ZaIBmH+qYxgReAGRirUCVhf81Re/SwNXYS0ynZ/XsaYDoLeW8NCsm54vxXwvYYslqrkqet3UgSEakvpyNEpkhm0wIvBpO/luaixeeR6u29W2KNBEu6eIjJ94Td4syWeamxDe7wj5zNC2fAz1BwrdRaWV7j3RKU4qyaPchpqZoEOMaTSpm2N0aKNvbaYbdGAgwzIGfE6ED8MkV+Dsw401ZAcRW8/TSOZ/yTyF4R5BpG3KCKRAEpQ1nNDA31rPhtn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(5660300002)(53546011)(9686003)(66556008)(316002)(478600001)(6496006)(83380400001)(6486002)(6666004)(2906002)(6636002)(85182001)(86362001)(26005)(186003)(6862004)(4326008)(8676002)(8936002)(33716001)(54906003)(66476007)(956004)(16526019)(66946007)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SHF1NHNHelBxUTFsb05lNE44SXMyQnBSNUpoc3FOTHF4OWVxankza0NXMlRl?=
 =?utf-8?B?Z2J2eDQreVByK2tqT0xMWkFUV2pyaHA4bTF4RnREN2t5Y25Pb3R0ZVIxQUNq?=
 =?utf-8?B?RnpJTGsxcTBMaHBROU91WGhPYy8vTkZpY2hjMS9TVEZPdStpZTdDM3F5ZTlz?=
 =?utf-8?B?SDBJbU9zQzZRNXlYK0llMFpIcHNGMW9pbW9PS25lUWtabEw3dW9TenB0bWNV?=
 =?utf-8?B?RjJGMnFscEhJVWRGdFZ1Rnc5ZERQM0o4RFhEeEhJQml6YXNpNzVMVEdhWTh5?=
 =?utf-8?B?djBablU2d0VwdGxGUGRvclJtQmw5U0Exbi9xQlhXeHNteVpEOGlDeC9kbktP?=
 =?utf-8?B?ZzJnRU9JczdXbDlWRGhBTzdPUUw4N2VoKzMrMFpKOUJURTF4Sm40OE1DMFNC?=
 =?utf-8?B?bEZUN3owRVZaY2c5UUw4NGJWODA5Ulo3RUZWaFFnRG9ycUR2cC9GckVRQkdD?=
 =?utf-8?B?UEVDTWxJZFBwbEs0a2xsa3h5ZUI2UVRnTWJOOXNXYjAwRGdZZCswMjdIbU1l?=
 =?utf-8?B?SzFxd2NMbVJvdWQvSnpHbTdETkZ6ak9xVFYvMFhvWSs4aFk3cWdTV2hrb1BQ?=
 =?utf-8?B?N1krbmROckkvM0ZnSHoyS0t6M040VWRNMW1LZ3hjMUFiME9NdFJuL1Z4SGtX?=
 =?utf-8?B?S1hkTER4SHNTamE4b2JDNmRsb3dPd1NNS2lwbFgyVnNMdGRuZVZuOGs5eFpW?=
 =?utf-8?B?K2RkYzdaZ3dwSVBKZnRleEdHSVU4MXhtWVVaOCthbEhKcW91anZCcWswTEZh?=
 =?utf-8?B?aEZFaGtBZ1U2bWFXMFR3d2JhM3A5U215alExUnJReDY5dEZZUlVOcWttdVpm?=
 =?utf-8?B?VVlHa2FiTUwvRTRmOExXNUFSM1Q1ejlTRjVSWUhVc2dFU2FBWFc5ZXkzV0I2?=
 =?utf-8?B?SzJnWjZIT2xvMkY5N0ZlOEJQZWxjQnlPdlluVVFCcG9aZk0yREUyWlU2N3o5?=
 =?utf-8?B?cVJMTi9RY0RpUWN3czNUeThkNjR2bVV0cmpaZTNOMFNBRU1CK0I3QnRVbTFR?=
 =?utf-8?B?dXhVay9qNm1iLzNTSFU3VlNwd09BdTV1ZEtOaDRYamNBa0ZlU0g0UjBiQW5U?=
 =?utf-8?B?bk9aSTVRNFhaeUt1SzNJSmF2aThUZ3pEai9Pbm9RTUxHZHlyRVJPQktpQUgz?=
 =?utf-8?B?MUFFRi9rM1d6OGl1ODdEcDkvOTFJOS9lS2lhSzJTL0grNlJ0Wm1wZUJYM0Fa?=
 =?utf-8?B?TjhxL1ZoNC8wTnUyc1U4OEJkNWgyeHRTVnBRaWhUWkdRajBUOGd3L3JxQUky?=
 =?utf-8?B?Q3dtWlcrV1RzQ3NvVEdmTktTMmd0ZTBwUEJyTU9KSEZ2cEVkMUN2WDZ5djV2?=
 =?utf-8?B?b0hmTUYwSEVmR3N3VjE2cmxsR3FSWFY4M2V2Sm9GbC9hR3FBNnpuQ0phTDV0?=
 =?utf-8?B?bDZMMXgyVmlKMHZBdERoYXVkbExLTkVEVk1oTDh0WW1ZUVRsUmZNcElRL0w1?=
 =?utf-8?B?ZC9lUlUxdGQxalo2OVlJcFZYK1NaNWRxUkNERDQvZXdVMm5jb0pFaVlOemVL?=
 =?utf-8?B?WTUwTXB6cVJsc2t6U1JXSkszUlBKUjQzek51NGc0UC9tMzZPRnRtd1RKU0F0?=
 =?utf-8?B?RDRFcjZHV0MzdDBiVnVZSDh5L2daZk1OWU5wYnVyaTBGT1FlSlNHbURzQzg5?=
 =?utf-8?B?a2o0L0JsRmNNR1pmZHpqZlhmNlk4bitJazBYa2plWTRKc2RpVWJld0JoSjly?=
 =?utf-8?B?ZjNPcktlc0xrYVBrbVRRVHNpanJ1aW1yaGEyMmw4N2RKWGZLd2ljVkQ3VDVC?=
 =?utf-8?Q?9ETcFUsZXXf8zdgyvB+we53RSet0uGKBA5gDEnG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 350d46bb-da99-4f61-1cc9-08d8dfb06805
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 08:26:42.6503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UrwJ8g+hCjcAARTbq7ghuJ5f7xWGQJTMHVj5jtR2slrRPJ+oGjYvm1w2wBNNL1M2RsjFx5tBAKXtaPg3a/TCAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5607
X-OriginatorOrg: citrix.com

On Thu, Mar 04, 2021 at 11:28:16PM +0000, Andrew Cooper wrote:
> On 04/03/2021 23:09, Boris Ostrovsky wrote:
> > On 3/4/21 9:47 AM, Roger Pau Monne wrote:
> >> Introduce an option to allow selecting a less strict behaviour for
> >> rdmsr accesses targeting a MSR not explicitly handled by Xen. Since
> >> commit 84e848fd7a162f669 accesses to MSRs not explicitly handled by
> >> Xen result in the injection of a #GP to the guest. This is a behavior
> >> change since previously a #GP was only injected if accessing the MSR
> >> on the real hardware will also trigger a #GP.
> >>
> >> This commit attempts to offer a fallback option similar to the
> >> previous behavior. Note however that the value of the underlying MSR
> >> is never leaked to the guest, as the newly introduced option only
> >> changes whether a #GP is injected or not.
> >>
> >> Long term the plan is to properly handle all the MSRs, so the option
> >> introduced here should be considered a temporary resort for OSes that
> >> don't work properly with the new MSR policy. Any OS that requires this
> >> option to be enabled should be reported to
> >> xen-devel@lists.xenproject.org.
> >>
> >> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >> ---
> >> Changes since v1:
> >>  - Only apply the option to HVM guests.
> >>  - Only apply the special handling to MSR reads.
> >>  - Sanitize the newly introduced flags field.
> >>  - Print a warning message when the option is used.
> >> ---
> >> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> >> ---
> >> Boris, could you please test with Solaris to see if this fixes the
> >> issue?
> >
> > Yes, still works. (It worked especially well after I noticed new option name ;-))
> 
> I'm afraid I want to break and rework how this bugfix happens.  Solaris
> is still broken on all older branches and this isn't a suitable fix to
> backport.

Right, I think that's the reactive part of the fixing that we spoke
with Jan, but I think we would still need something similar to
rdmsr_relaxed.

There's at least one other MSR which Jan identified that we also want
to handle MSR_K7_HWCR.

Thanks, Roger.

