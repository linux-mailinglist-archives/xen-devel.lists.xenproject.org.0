Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D003AC8A0
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 12:15:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144397.265774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luBWt-0004Ji-K0; Fri, 18 Jun 2021 10:15:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144397.265774; Fri, 18 Jun 2021 10:15:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luBWt-0004HD-Ge; Fri, 18 Jun 2021 10:15:15 +0000
Received: by outflank-mailman (input) for mailman id 144397;
 Fri, 18 Jun 2021 10:15:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUMw=LM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1luBWs-0004H7-Fh
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 10:15:14 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0de32527-2123-4f4a-bc46-d555eb2f36aa;
 Fri, 18 Jun 2021 10:15:12 +0000 (UTC)
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
X-Inumbo-ID: 0de32527-2123-4f4a-bc46-d555eb2f36aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624011312;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9cL0jfa7gu+vak3Z+tix5HDGpbgymew93gq1QkmhVkU=;
  b=XMm+UH3+uJ4s8+wDhDvWX+iScgAUXMAc+02qGFi+3yK/Oou1ToNVCcCA
   Nlr/rjNLS+U/SIe9lnNrkdczEdsUZMU58ct5v2lB5lSmd12LMdqWJZZ6q
   mwGcpr7zuFPakdV7oApESj/3CaIfTWN4juUF5167tqewSQyCa0wsAc9aS
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: a0Olj0259qjlTRGaNER4aKtFQDzF5+/YvaOa6UEhpCCGPDASdnkMX8d1wdjno28JbO6uA+6NFu
 PDXpu8j8XMqZju4eZfl72+SzTPegD+N9ZWeBZssVjH0WHvGfNEi+n2m95Wrb9FZdbbLgCyn+g8
 1lHMsDpawkEZkWC1u9TR5pTwxBh/dthkXb7JC8kY/3oaDJeZoOZdY8k6P/r18mNfi/ZOFiZVEb
 zvyGQUOXGrt32V2sd7EdVn/d8zOIuCds55x4d72I7sn0+plaNC4uqGdhm+10ZKuiMBNMhSPQqK
 7MU=
X-SBRS: 5.1
X-MesageID: 46447279
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:/qy77qiQHHwQWxPybOL9JTX/rHBQXiAji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPE3I/OrrBEDuexzhHPJOj7X5Xo3SOTUO2lHYT72KhLGKq1Hd8kXFndK1vp
 0QEZSWZueQMbB75/yKnTVREbwbsaW6GHbDv5ag859vJzsaFZ2J921Ce2Gm+tUdfng8OXI+fq
 DsgPZvln6bVlk8SN+0PXUBV/irnaywqHq3CSR2fiLO8WO1/EuV1II=
X-IronPort-AV: E=Sophos;i="5.83,283,1616472000"; 
   d="scan'208";a="46447279"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CK3GdFSHc4MuvaisFwOSmzB//A6sl29Onspib2ZmdnuTynXHBLtOwDVM0gWNSIqqpUKPVZREjxdsg+SLhv+PBO6+A3zefvM21ujjs5L67FkNazxTDNdTgB3zFXQ5ZX+e+LrGouOfzwsYfL57+74vyjoNeDZ0gHqsxneIlt1qfcUH6ibuyFRBs8tCaVZWSCSM5IZ46Rd/HeoNy/OsJHC4abxKFID956menF3RrHdkQ7cVCq4Tg9Jqwzjj7u4xvV7NZwUkUNNr2TQ0yLyzXNy65RYPifcPARAPzAp53vBVgeSf8iJSZFJ/udSoRiNZMfDDy+5QZDfrw+yeC6AqN0gYHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYijSs5H+YfN+SKleG5HxJrXs5ojrMbCfsis7erSI4E=;
 b=bFQx8985cwZjghIc+VMN3ic197YHAvIvML7cCC/XxEtOfsGmXo0veatXwbaN1TXwLEU3LahSDrIQiFVC1FKQC2B0aSLn7O+xH7Adrm6ri8uUYVMxq+Sp38OHxEMlnD+N9zPPgdjxUr4PL4/zC4ed+jY5K/xMe8iwGTO8vUL1nZkVhdsjfE8EcSOVkyIIJKNE8GSKXYpT8puyXEx2GPQYrZPsZdXzFfr3SLHxZ7dEw8BTCS40WU461IgSFDIYF2mVMji/2+mHkoV+PPM5ZJsSFPSHaXHKOwraoOve0JCAtloFG6fzBly3X/I8EZDsMDazUW51xlGUT/pWg/y3MxwsYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYijSs5H+YfN+SKleG5HxJrXs5ojrMbCfsis7erSI4E=;
 b=LPlkRVcwZRX4vbbuRIhIJMeM9UFEWzxAROaCj5POx94eiOXFJ7BOVWep7KMxLWDmXyLRp7I/uCwE9JjROqASHu0+9kZ8xg6K2EnMLOAW5LmG+0FabIqs9S1gx0eiOfCOUtM+Q792yxSS7Ou34RQ9bNSvG07Dp2ukr9GG6FLb7O4=
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Tim Deegan <tim@xen.org>, Juergen Gross
	<jgross@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>, "Petre
 Pircalabu" <ppircalabu@bitdefender.com>, Dario Faggioli <dfaggioli@suse.com>,
	Paul Durrant <paul@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	<persaur@gmail.com>, <christopher.w.clark@gmail.com>,
	<adam.schwalm@starlab.io>, <scott.davis@starlab.io>
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 0/6] xsm: refactoring xsm hooks
Message-ID: <7219a9c8-f6c0-a86c-bf47-5b38c579170b@citrix.com>
Date: Fri, 18 Jun 2021 11:14:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210617233918.10095-1-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0141.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::33) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d0736f6-ca1b-4316-c8c0-08d93241f1ed
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5837:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB583769E279DB09AD0717A9EDBA0D9@SJ0PR03MB5837.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JH3ZdG0smzs+lZkxTW0+b1pd9j+fcCIgX3LPXefxqzsxp9G1DHYM9esjfMXzAoNZXfReRnWHb+EYma7TjWpVLIEgSU1ZiRsq8cVOw5mqa+0yNUlVOj4SWs/qTvJe+/ewQnwjBKtLEu43MBZ1Gm6ukXgFcyySS7YX/rGP6nveEzZTrdXcNHDUtRhfJdBc5fHCAIT9IYZ2bn3mwqb9F3Wirwzid+zR7yCIvbY8ltX9aHK2TtggJsU2lWFcJxaqL4IDI4XCYp1xJKAnHogSbEq1UgiGucpgbG5Ls2E3+EfuSg8bjqPQCuoYtBwZIT8//EC/Nbeh5p3jKm5Tx0EZH3/BK/RLLABIjKD6iwOjaiNEoIrsePmS/BI1AVt2QK7qH7q7Sk1ZmC9HvXAZ6Z1wcp2TEiCr+CDB3uG1AUWfqPV3/V2jMw7QNjK1G52DyaGhXAQXqOQVWKUSdTYeJvnhRNZ1V6Ppk4/tZ2cXgD073n3IDRDc3cx438oyJhSbEyspM7vIzLU9pd1asSxDP7ROHdBcO5Cjrk+qb2z/V69x7Ah6jnaagnh8EkLvi0geKblcyawvAn7s3UV9l0I43dgqJxHNBKmWcvuE62gRuZvVrEPP3tMd8U7OTczDRadb5GXbtw/ccVo4Z9Z27L1APjBqozOxclWJIB7tNfIVklPO/3MhdWMzxhtGh9lf2HRXPBgxfcuZmZ+EzOx/Kg2tWDWuTVqODv+yeysokgRhjpgs6vi3Vsi+ZFFZb7r71Jp9/NR5ZgtsX0sQzomnsZJfKyBittPJYOuOk7I0hc9ySbt8ofsPNxTciSvyBjoyYc/U0LSp9SCP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(39860400002)(346002)(6666004)(5660300002)(8676002)(66556008)(66476007)(7416002)(83380400001)(16576012)(2616005)(956004)(66946007)(36756003)(31696002)(38100700002)(2906002)(6486002)(8936002)(316002)(16526019)(53546011)(186003)(478600001)(86362001)(31686004)(54906003)(4326008)(26005)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHU1Q2VmVC8xTTFvdG1ORHZyQngxYTB2WU1Uam9KMVNIR1JNdHFTV2s0am1U?=
 =?utf-8?B?WUFKbjVCYjhqNjFwRmR0cGJyQk5SbTB2aC8rYUgvUkR2Y2Z4cWFzekxYdzgr?=
 =?utf-8?B?RmJpYXphSWwzeUdzYUQybHRNMi9QTXpsbXZ4TVZ0UmoyVFQrVHd3aVBSOCtr?=
 =?utf-8?B?NGdvRWZQMDJvb0IyMDJQSXZjV2V5NE84WjZkL1htZk5Gb3JZeFhEa1l0bFVW?=
 =?utf-8?B?NDloclVreG9Tb1V4Ymc3ckhaNDVaaFFhU3Bqa1hnRVUwTy90QTQ0Wi8vdHN5?=
 =?utf-8?B?cEZSN1VoY2UzTFZMT2MxWjFsM3Jra3hVc0RTN2tLYTVZTjZuT0FIRDM3R21D?=
 =?utf-8?B?R0g5RDJZQXpXNUoyeGo4c0lDQzkxUTFBUkNxRW9NMHJFekN1czJrMkpPNk9T?=
 =?utf-8?B?ZkcyTW1MRy9CZm9JcGJ5SnRXc3FOS0l0V2ttM1JmbHBBNm1uTHg5Z0hvdzJZ?=
 =?utf-8?B?NmxYWDZ5eUtiRUZnNHlROFlYS1FTdE9yd1ZNRVdVdEV5dEU5ZmFCTkJlem1j?=
 =?utf-8?B?OUhQVVNGRksyeExENklYdlJvZDY3U0lma2ZJRi9idUtyK3FZRkR5N3VTTGxY?=
 =?utf-8?B?YXRjQVRyUFpTNHpOWTZrWmRjQ0NSbEFsQ0JrcDNmUS9jT3U2bmdpZjBwdk1h?=
 =?utf-8?B?V01GbU54amVIZ01RVmtNNWMrWmR5UUFFWWtOVllQQVJDMEt2RllFSlAzNTQ1?=
 =?utf-8?B?alQyTG1FTGxRZnVFNDlsZ1NBMFpHcWlCSHZYWStibStxNGpUTXFwU1lHMEJO?=
 =?utf-8?B?Yzh6UnJRdUQzKzkzUFM1clBMZ09McEdxYWU0VmJKVGRDYU00Tm9rY1piM2I0?=
 =?utf-8?B?eEl5VE5xUHhGc2ZTNTlhckRHN1dNNWNzbmNFQjY5L1BBcFVyQXRlV0pCekhC?=
 =?utf-8?B?RzI3MkZFUmJ0OGZxbWszaFloUGsxMCtZdFl3cXNYUkUzQmQ5ODUwNSsxSFFu?=
 =?utf-8?B?MDdYMmdKc0JFb1ExNThiTXlJVk11UFJ2VU1EcWdpTGd2UERyOVlyN0RuR2xi?=
 =?utf-8?B?YWNKYXFqd2U5c3E1c3dRTEJYcTI2aTlIclZmMEpNWTQ2bWQ4SkJFTGE5clF0?=
 =?utf-8?B?WjcyVUtwSXNWQkFUMDdYSUZ4WVVwYXR0T2FNVEM2RDdEbnp4RjU0QmJlMVpK?=
 =?utf-8?B?UDhQM2tiZ0JzVlExVE5FVlMvbTJIZDk5KytTL1B2RHluYnpwUDZaWnFMNUtN?=
 =?utf-8?B?L0x3YW4yM05CRWk2WDVENEtWR09pZVFLYncraGlRcEJ0WGxtakt4YkkwNm5E?=
 =?utf-8?B?SmFPL1NzY0IxNlZpOWRjdTNlZ1UxSzU1WHhnL3lIdVNaSWlHaGxGemdvRDl1?=
 =?utf-8?B?NjR3S2Z6a0ttZFB5VVZPeURJUHY5eUk1cCtKZ3hrSHA2V2tQZkxWbHc1V1BV?=
 =?utf-8?B?VjZQTzczYXVsbFRsZXRud2ZtT2VpUGtXbFI1UWVWZkREa0xyOEhCd05UelBr?=
 =?utf-8?B?VXR0dDJKM3JXZ0tIUzJXajBtVmVpNVJtZlh4Sllyamlyd1ZmcHRWbGZVMUlt?=
 =?utf-8?B?a2FaVEl3WWJxWnFGL05tSmxVMDZrcTFvZjh2SEVUcksxaHdUZXRYQldaVnBa?=
 =?utf-8?B?b1d6NWYyRjQwUG1sRGRvcjZxbTduaTNuZWM1ZnZKbWMrMWh1MlFiRGpDUDBY?=
 =?utf-8?B?VGNJcXpZNmdNdlprN0cyUStPVzI2N2dUeDNjVEhnTmViZ25HNnNHclcvcHZl?=
 =?utf-8?B?YnlvaEtoK3gyZC9udFBFT1RVdG5ZelRBQThwODI0c0R4TzB6Rmo3amRJRDlZ?=
 =?utf-8?Q?1kcAKDX3rlMxgDrRmoX5Kk9VPWN3dyfEx1Ux+DV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d0736f6-ca1b-4316-c8c0-08d93241f1ed
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 10:15:06.6239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xuEmrpgAapBmfhba4wm8qomzcqRgwfkV0+SjkwMszjOpbTbJH0AmjaTcwaF/N+Ogmy5hk7iotHgbkhD6QNLyRCFvAGvYRzbrrAMG0EV9ghA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5837
X-OriginatorOrg: citrix.com

On 18/06/2021 00:39, Daniel P. Smith wrote:
> Based on feedback from 2021 Xen Developers Summit the xsm-roles RFC
> patch set is being split into two separate patch sets. This is the first
> patch set and is focused purely on the clean up and refactoring of the
> XSM hooks.
>
> This patch set refactors the xsm_ops wrapper hooks to use the alternative=
_call
> infrastructure. Then proceeds to move and realign the headers to remove t=
he
> psuedo is/is not enable implementation. The remainder of the changes are =
clean up
> and removing no longer necessary abstractions.
>
> <snip>
>  51 files changed, 1309 insertions(+), 1413 deletions(-)

The diffstat is great, but sadly CI says no.=C2=A0
https://gitlab.com/xen-project/patchew/xen/-/pipelines/323044913

The problem is that ARM doesn't have alternative_vcall().=C2=A0 Given how
much of an improvement this ought to be for hypercalls, I don't want to
lose the vcalls.

One option is to implement vcall() support on ARM, but that will leave
new architectures (RISC-V on the way) with a heavy lift to get XSM to
compile.

Instead, what we want to do is make vcall() a common interface, falling
back to a plain function pointer call for architectures which don't
implement the optimisation.=C2=A0 So something like:

1) Introduce CONFIG_HAS_VCALL, which is selected by X86 only right now
2) Introduce xen/vcall.h which uses CONFIG_HAS_VCALL to either include
asm/vcall.h or provide the fallback implementation
3) Switch x86's current use over to this new interface

The iommu_vcall() is a red herring, not adequately documented, and needs
to stay in some form.=C2=A0 Specifically, it needs to not become an
alternative on ARM, even if ARM gains vcalls.=C2=A0 I'd be tempted to rewor=
k
it in 4) to use the common vcall() by default, and leave ARM as the
special case overriding the default behaviour, along with an explanation
of why it isn't a vcall().

Obviously, name subject bikeshedding.=C2=A0 alternative_vcall() is a bit of=
 a
mouthful, and I don't think that alt_vcall() loses any salient information.

Thoughts?

~Andrew


