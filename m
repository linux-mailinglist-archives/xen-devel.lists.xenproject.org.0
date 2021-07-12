Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 625F23C6723
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 01:49:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154910.286096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m35fR-0003th-8W; Mon, 12 Jul 2021 23:48:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154910.286096; Mon, 12 Jul 2021 23:48:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m35fR-0003qa-4t; Mon, 12 Jul 2021 23:48:53 +0000
Received: by outflank-mailman (input) for mailman id 154910;
 Mon, 12 Jul 2021 23:48:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pbkG=ME=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m35fP-0003qU-Vw
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 23:48:52 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5231a08-e36b-11eb-870f-12813bfff9fa;
 Mon, 12 Jul 2021 23:48:51 +0000 (UTC)
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
X-Inumbo-ID: b5231a08-e36b-11eb-870f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626133731;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZDT1nEqRbZnUvCFs3RdjtBs+jIlcpKvZMrvsxYuV0fQ=;
  b=MmQQ5TvUeGs+hm0MUGmF6xrXjjm4MXROk/mofKnopVvWgtDyoXsiOxvv
   B67iuJBuo1kXdUcyr1mcl+fpluUcj0Cxyz2u70HXlzu8QAvhy7tVtMJMy
   DAWB+0QRV496ZY4PE9F6AUHCuueZqo98whtp/yanTd61R3XPEbnkA8p73
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0CZqER92cZ19JpEBI9UM9FDTBIu9q/+FvgSOtvE7NncPmaY1EkUezuJkfFTGtcJ0mIqDTfYJEA
 XSWr5J61uZL7YxqxaCUmOuriDL0j5SF7V6/iNzuSZNYL9EN/sETUGoLrcMhMfhSIYiKOO3/EyX
 OmbCqcPxv83JA4VNT29RRj/4ZP8A6igJg58mpXDcd6C837ws7MkD9s5YbUnjiWynGoyN2phS5M
 wIpMls3xklbg9BZQ0Wo9vj5zfxzyRRETD9QGtTyH4bAIDJhtQ7ib5UBHtzHnmmDcPsmuDhhZKL
 MRE=
X-SBRS: 5.1
X-MesageID: 48118809
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:j/3CQ6rkQq9rcNx/D3TrML8aV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-IronPort-AV: E=Sophos;i="5.84,235,1620705600"; 
   d="scan'208";a="48118809"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JvzJP9Gxtj8AjGWO4B46CtIDTQ/KjsZgs1ZZAgz6ZItHoxYke/afEuiXImRZzr40BimUMEILYwMXmWboF2B55n2myOaGpYkoECXReQSRzNUfSfTI8o6rQmGhRGIl8gI5+AofdbSWp6T0YaUErbNSWN4teYpSILzFvKjeFgbOpbChvbVZ83lMsbNkrfHC2MvNu2GCH8RSxcaOpnZIhor2Hy7igPGO0/5NpYtTQDYH7b8aSSZRTZ2i6dEMq7kZfDxilfxeRcKErBEfVk2PxYP4I5fcglvstE6oA1aDmQVx/gAKhgAOnyMVpuBgjRH6SBV861okQ8W2yeHVawIT2wQBTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qin92F4bC2RxTlzUZNheYyJ0+TFTswG2B7/ZNScveJ0=;
 b=mPhJGJmEdcUTlBNOj3l+KS+CHcEj4dmWXaVJG1E+EmpmG+GamO+gTygiIdA1X1r2X9eB9Tpnp+jWKZqXVSFOhqaiLyx+Vzm/jBjBOXVeUYkmGSakssBZlGOUYmcGcYaVOB9Lye3v6gIHBSLoSfkJPSx7AchnnE4GjssXgDQUxc5IriwHTv5vuMXm0y/FdFEt18+M5oAAuTkFMXhaWAOANDfGT1JA0h2P+HaYvhI38jA2q045Zjo+x8nC4q4uxR3s8Sh4cF4T+w1+y0pADsxNBUJadEVHeAJS+b2/qNmyXdyxI8bL5lnRzsWYk4IwehgVqbZcCpkfY5d8Tn6hupfZyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qin92F4bC2RxTlzUZNheYyJ0+TFTswG2B7/ZNScveJ0=;
 b=vPsQ9GiaWW3bErV3HG8uM4ksW8aShmrXxr3A9eX1R7bYtj89PqVNTDQ/ZLyeA/mHhzrXfQpPQ+nE7ogk3RSi/ZpddonLKtVf62iKH1vnseThx0YwO1yKQJMwKzd484eVQ3oaMDx5fp1pFM4qX9RVzrOO4HcUGF/pVDYwcqHauqc=
Subject: Re: [PATCH v2 01/10] xen: Implement xen/alternative-call.h for use in
 common code
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-2-dpsmith@apertussolutions.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2a794038-f4f5-1525-5af8-d89b687a8043@citrix.com>
Date: Tue, 13 Jul 2021 00:48:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210712203233.20289-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0079.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 682c7b3d-83f8-4f60-86fd-08d9458f95c5
X-MS-TrafficTypeDiagnostic: BYAPR03MB3669:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB36691267897FBDC41606A2E8BA159@BYAPR03MB3669.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7rX659tChKy8/j86SZokQ8WsiWgk4h0z+tne+fBTwKwnwMNvKDaxJ+9R1CZGAJuivR4jZVxjbozWbAWwMFSDGydUMJIq03NPl5K5s2a5rLp5xwlhQigTVhEwMUwyslivVon2PaTo0v8ufGkrrlzgo71swbow2bprZWmO8ZPC1kkVPNYH7nkIr4O/pd/m41mD8EqEPERouccDUDCNcEI4cxxj8NHI3BpmcIHaAcXbc7a81gxw3T8O5zfYBiZXJmXVu1rs8CvS490kZLP+IMdM6bdOXpppozwkNtdnu99TJW3DDfK2UDF1fSRG4uHCFjvMCYReRKBMZn8Ls9gn7dbSCPx1tYj0sbZSyM2juZWu+RqNfoX5VRNaHZHHeyn330nU6ipP5LnUCr39P6is75kfxCwdmNDEfPq1dicIpvN6f11LYuoGL/+LpoFWNNsmCItag0/BOGcPeD2KOiZlQT1FDhN8W5vSMCeMNSZszyBOC9GO5Uy1uneVHwDIL++oBTXD3TOxxmTa4SQDmz7qGe/JYWirwsCVAfgR7sffArHOp4P396TJYK+2PDrvZOV6idoHSKOr7pwL9s7BfE/lwqex9GvSZeuqdnW4tIqIEnDLoPBrWH6jvyjEHskPlNouy6PCXnc3+xgTJTDt09kz7w9MOPcZCkyrhh4YYQUhRahRUrsUwAzsfNvsW6+g0U/84xASY+dprGQyB9BjqDvP/mLu2fZc62x4rZAk6UIAkvi/2H8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(38100700002)(478600001)(86362001)(8676002)(316002)(31686004)(66556008)(66476007)(4326008)(2906002)(110136005)(6486002)(66946007)(54906003)(2616005)(26005)(956004)(36756003)(31696002)(5660300002)(53546011)(8936002)(186003)(16576012)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blNyWkxHcWNOaFVuNVk3V1NFQXRLUHRpT1lKdVV4Q1RFL2hVM0t2dGhsRUVr?=
 =?utf-8?B?UjdCT2hxYUdmeWJMV0pSZlhKQUNsRStyUEVSdnVQN1kvMTg1bGdGOUxWaFdi?=
 =?utf-8?B?V1ZRZndvWHFMb2xQVkovZWNzVHpLRFJyVXZVaEFMUjlWMkc5ZXg1UTE1dnJC?=
 =?utf-8?B?V3RTUWU5TWoxYXU0L1NJZnBkT3NDK2hZMisxd1kwZFJOWm45MDN2eXczMnlZ?=
 =?utf-8?B?UWszcFF2YzFYSmZHdUg4OVh0c1NVK2ZGVFMyNXlTWHRyU09mUFcrYmU4Znp0?=
 =?utf-8?B?RldHRDAvRzBiMlAxdk9xYmNhRE9JSXJlU0FrYW5IZ0ZaMktyZTNTYXh0SHQz?=
 =?utf-8?B?TTczeHRjdlBmRnBmNGVHbXNra3c2cHF0bzQydjhRa1dBVm5CaXI4bGVFTXV3?=
 =?utf-8?B?RzBjQjBxejVyZEZMZE50RWRFRlg4cVgzOHY1L1pxRDZrb2lGcVBmWFdPMTVQ?=
 =?utf-8?B?S1VKa3ZwYUtUa0hFYzhENWJDWHlPekhlSDVlS0szK3B3RW90R0IwcUwxY2hx?=
 =?utf-8?B?MzhNTi9PaUUzS1ltd3Bob0tkQkJwb1A4N3J0YVU5bXQ3VzUyMHo2ams3bk9r?=
 =?utf-8?B?RG54TUNLSE1WSUMwUmhrR2J0UGhNNEJCaHU2UXVkRmtrL012dW1CWjV5eThC?=
 =?utf-8?B?blBkbzZJdks4cVBJeUpTTDFFUURrYUNGWDdmZmFGZUlmZk5IS3N4VDZLZ0do?=
 =?utf-8?B?V09ZYU50UzVUUk5PcDcyaXNTeW52OG9jUGFuSkhBRzNJMElnelpHcmhQVnRr?=
 =?utf-8?B?a1o2VVRmUEhqaXZRMTRjcnlqZEc1WUhTNFBVNERDWHV1Mm1ZTmNoUlhjTkpN?=
 =?utf-8?B?enFnaGZlSkFKNWNPamEyMVFucmQ1UVdCUm82VW9qQXFZU0ZiRjdBc0lWd0g5?=
 =?utf-8?B?YTA1RUlpMDNiVUhtSmxZWlg5Q0FScGtIZUg4UTM5UEZIZFAvN0djZ0dDdmM5?=
 =?utf-8?B?akVQWVZXWEszTE5pZmtyQkhiT1BqNVNnN0lkLzhYcE4zVThud3FNUU1INkxJ?=
 =?utf-8?B?ZjUzRVd5VlZIVGpBRXU1NjUveEVwS29kQ0Z2RUJyOThYemJramhNWkg4WFhT?=
 =?utf-8?B?ajYxMHJnQ01ObVhVODFpaFdyb2ZvTDVYdVNMdWIyUmNnbmN0MzlKY09IcTN5?=
 =?utf-8?B?NHJmb0dtV2ZhY1dCOGtDeEtPSERLTWdkUDRiU3A3RmtrbTZLN1g2NlBCdEVR?=
 =?utf-8?B?d0o0OUpRUWZaZG5LY2dFalZ1L2ZTbnpxTytkYnh6cmtOZGV5a2YrbW9VS3dC?=
 =?utf-8?B?d2NxUEZSaDUvMDZCQ0lCbldCSDgwS0dUbTEwTEZFc2N4alJVYWJqbHFVSk8r?=
 =?utf-8?B?VEZqL2J5QklPYTJDSHNhNzVKTXZxYzlJNy9qVTduOTlPdlcwV3RJODNnTDV1?=
 =?utf-8?B?YktEeEs0S0x4RDBacmJZNkxwZm8zU2ZNQVl0OEh2dkd2VGxkZGxXUVNMbEJs?=
 =?utf-8?B?UU1XeS83Y3gxT2xYU0pVNEcwWWduU3pYS0c1ZmZuQmM5NHBIMzdnNEpneFp3?=
 =?utf-8?B?eDMwMDUvUkM1UjE4enQ1Sll4NlJRSm9CUUUrNFZJampZNWVWeDNDSnRzN0N6?=
 =?utf-8?B?YksyZStqcnhlZDNJYUErcTJXbFo1SlpBOTh5cStmMURhNVM4MElpNkhuWkRG?=
 =?utf-8?B?T1MyU2RRNUk4aUl2ZzZVbmtTZ2RKVjBUOHo5a1VKcFVrUUx3aDl0dDRQYUIx?=
 =?utf-8?B?b3NUWldWVzBuc2F1a0VncUJTNnovL3RvWDBkRVIzMW45OHQ1SHFReFQyM1gz?=
 =?utf-8?Q?2hClDaEIfo7oH4YOT9kc95Ylh62X7HkDobfgVg6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 682c7b3d-83f8-4f60-86fd-08d9458f95c5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 23:48:44.8444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGjcBwyr2PUxzozc+J4pIbCD2gpNWxHVLkpb1AAkecSsAde1bVwwVIKn4qt7N+B4bx2WRK8fOhpzYHX7057j8+s2SyIlhSYcdAoUFrRhZyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3669
X-OriginatorOrg: citrix.com

On 12/07/2021 21:32, Daniel P. Smith wrote:
> diff --git a/xen/include/xen/alternative-call.h b/xen/include/xen/alternative-call.h
> new file mode 100644
> index 0000000000..11d1c26068
> --- /dev/null
> +++ b/xen/include/xen/alternative-call.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef XEN_ALTERNATIVE_CALL
> +#define XEN_ALTERNATIVE_CALL
> +
> +/*
> + * Some subsystems in Xen may have multiple implementions, which can be
> + * resolved to a single implementation at boot time.  By default, this will
> + * result in the use of function pointers.
> + *
> + * Some architectures may have mechanisms for dynamically modifying .text.
> + * Using this mechnaism, function pointers can be converted to direct calls
> + * which are typically more efficient at runtime.
> + *
> + * For architectures to support:
> + *
> + * - Implement alternative_{,v}call() in asm/alternative.h.  Code generation
> + *   requirements are to emit a function pointer call at build time, and stash
> + *   enough metadata to simplify the call at boot once the implementation has
> + *   been resolved.
> + * - Select ALTERNATIVE_CALL in Kconfig.
> + *
> + * To use:
> + *
> + * Consider the following simplified example.
> + *
> + *  1) struct foo_ops __alt_call_maybe_initdata ops;
> + *
> + *  2) struct foo_ops __alt_call_maybe_initconst foo_a_ops = { ... };
> + *     struct foo_ops __alt_call_maybe_initconst foo_b_ops = { ... };

It occurs to me after reviewing patch 2 that these want to be const
struct foo_ops __initconst ..., and there is no need for
__alt_call_maybe_initconst at all.

The only thing wanting a conditional annotation like this is the single
ops object, and it needs to be initdata (or hopefully ro_after_init in
the future).

~Andrew

