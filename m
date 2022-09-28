Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 481365EDC4C
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 14:07:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413295.656848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odVpv-0007py-R1; Wed, 28 Sep 2022 12:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413295.656848; Wed, 28 Sep 2022 12:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odVpv-0007mt-OB; Wed, 28 Sep 2022 12:06:47 +0000
Received: by outflank-mailman (input) for mailman id 413295;
 Wed, 28 Sep 2022 12:06:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RNMk=Z7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odVpu-0007mn-Vu
 for xen-devel@lists.xenproject.org; Wed, 28 Sep 2022 12:06:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70045.outbound.protection.outlook.com [40.107.7.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0597b201-3f26-11ed-964a-05401a9f4f97;
 Wed, 28 Sep 2022 14:06:45 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7219.eurprd04.prod.outlook.com (2603:10a6:20b:1d3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 12:06:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 12:06:44 +0000
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
X-Inumbo-ID: 0597b201-3f26-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FitsUuUCGw1Lih/g/XeVfr/+CbYixitWzXAFzUTiHRosDcI6/sOKGFBrao03ibCCCOQPpj8zl97SNA+NaUi5+FohqAk/IKBavwiwZDdapOgHZvdLgf3hWelzELsZlZQxd331eD2KqM3sui9LEDpQ61OjdwfCYWUZQ2fg9F/lltTL0VX3+D8BKyB3m8ZLM1YaILA4ggvkje+uZucs55zDw6V0Zh03ZwxuJ5BGcH2rpNhwRw/zWQY6uhTMuRq56QHtTMWue7Bf3qJQGjkrOfvv9QYVL0MNzXj28QL5ljnPSN4Jh/c3d5bQjtet+aDPNcetutjpG0HJvzsbyIOa8IIimw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBLInMlojnTFV21wrEZ2CRy1C0KdrYkbE46O3y3IEVA=;
 b=esjT8gpPrUUWeExVnSAtYP2wJptpjcYBbqE2eO5zqLG5H257R3l5zX7hz3IiKZ0zIxu2AMFaEdsN08fMxFonufgsCG2HEFzICA6WmTSuZerX/ITWE9DhFSkydUKOiASEqnqcxokn9bV8TgnUS4QIhsEzJcn4SmKT64NiLBcB18vq1uRB72u98rYczkco5jLTGgNYTngECNRpEPNpN8x5uJE5CxiL5sgPKNpvE4mXHJv6lXC/Ke+8VFKnkv8Qs9d4IL5rf+zNyn0ESb/nPKTdCTYxZdHHryeo45NvTKXxpM3d68uj6lQYThcrmX37EARegZcPjkMzuE9DFI9EtesjAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBLInMlojnTFV21wrEZ2CRy1C0KdrYkbE46O3y3IEVA=;
 b=nI6ZqcwezKZrdBUBOJctLr677/W+NerAR1z1YQxU0s3GlvhL2b+/8NP1WjdNmii8FuZfxKBtsIKGXX/d05zM4BrMk59p/awBWTBn5ItsyCqZKJT0IvmzO8GG8ZcceWOVXucO5bzq7T+m2gja+UjM0SEJHTd6BagNyNkfDVXI+ch9AMhqKQiofkRpSL8kA/OAmbI3UxZD0bId3p0PpRqJ9ZCG4A4c3DLrTWQ8IjCufIbI98Qewr1nkvgszU1Rp+AYczAzgok3pCcEvCncY2MiKGZrs20x8vMnfGaxIwkcQnGk3qXKOhh88orA/4t/zDKEU/DQJ1VgukvaF4Sxn3jvYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6d2e1b23-2299-01fd-0e79-1c9ab1b5bace@suse.com>
Date: Wed, 28 Sep 2022 14:06:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: Proposal for physical address based hypercalls
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <98b857b8-f36a-e935-8318-f17dfc3457ab@suse.com>
 <850214fa-7e26-8a19-c318-9ded849fffda@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <850214fa-7e26-8a19-c318-9ded849fffda@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7219:EE_
X-MS-Office365-Filtering-Correlation-Id: ebca70c6-5aed-4591-25fc-08daa149e8ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bD0STrwEUKifnOX2HbLKW4jzIDcbfYvjpK3R9IkcpdZ1JOuKpYNVUEiHil/U0avUj0ROnrVEgOySQ9m2WTxBKN43LhcsPpARJwJW+PxX4FU6XciTWurEPlK1P7ja8bZWuebTtCYeFlPwaoThexUdem6nzF/fPG1uF45WLvwNzM6UmtDpMFRq94Pc6WczK7BYJZ3oCeoV/Qoyj0/eTb1Echrl64oHxNz9AZmxOEfUQr9DDDBt+ZQVUrlQ2pMZoKpNwAp13IBE7OUfDtmQ42d3zlDm7psP7aCeIx/X53G2irusd04uICKWtgto7769zTQV90bQ6coAZ9O9UcUttENZyVlcbxh+q5awb+ggRhd/D2QYjLMvBtzef2NvRBGxbApozWw6+oXjykn21gI+FF14OEknnXjtVe9XudMtUJCW01g2C33zv9xQ5nD7ovCy6W1PrMJ/CTJKjq2hdnXDO4FHlS5y1PX9VFMgWn2K41aPpGcSv5oaZdVw3slvuBP4Pdz4IasythPjvILz85pQVTffLY/0izCUMTiZMtqWEZn8EjwXW8k7zA6v3RfkvEJEBpCQcCS2ZgKNIUAcKtcbAw+j0M2T/bSEKSEC1q4I1GKCXN9kFsPxa2mvYfTeLBF0tjj7v9s/EqI+KFPDdvatKj2l+HQi8brZSjw6+XYHEp9PlWbOPTNdKZC1fhpuJwnZXn6UkLFtwZf5QBhkXMVWOryZkuBlEc7+Mp6QKuULi0NIQcvDyxif5MnKnTvdUwaQ9u7afXYpxybG7tZL92Rj4A1kzdbACyDfE0oTlDblaAeKSFc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199015)(86362001)(31696002)(36756003)(38100700002)(316002)(6486002)(6916009)(8936002)(5660300002)(66556008)(4326008)(8676002)(41300700001)(66476007)(66946007)(2906002)(83380400001)(186003)(478600001)(2616005)(53546011)(6512007)(26005)(31686004)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2ZwQ3kzeW5SYzVYZUFHczl5ZVF4NDFNaTFDdWR6aXV1bFM4eW94V1Boa2VD?=
 =?utf-8?B?ckduaE8rUFZMQ3dibEJSbmkyR3VDSEwxTkZQUUlvUFN6MTh2ZGFJR25xdnN4?=
 =?utf-8?B?OWtQN0F0TW5FQmxrS3VhNU5lYjBJbG9ZRTc4djd0eDFqVWN6WG1EaUx0d3hQ?=
 =?utf-8?B?dGRUZkNQK3dtR2ErVm0veGo3eERpWW5USTVxNlJvWjJMZ25lUzFpbUo3KzB3?=
 =?utf-8?B?d0pQdlk5QlhPSkQwaDlZNjVDZHVJMmtWMFFVS3NZM1JCRnNDeG1IZHZ1eXY4?=
 =?utf-8?B?R0NZRE56OS9wVmZIT0Jad3RzbHowZTJ4WWZvTDR3ZXRmdVlOTzhST2U5U3lS?=
 =?utf-8?B?bnhBU1BhSjBTeUE5Rk9ldkx1RWJaYTZma252OUtSZ21MZ1dlSTlHN3dCK3Bj?=
 =?utf-8?B?UURqazVJZVlrbUVSdklleVU3WnNaNDA2QlVRZ2xiS1pMUlhMTnkxaE1iTHNn?=
 =?utf-8?B?NTBzUU5nSkxVOVZkbC9yS0lrM2F6MVZUMjJYRnZYV3gzNDBiTG5BR2VJd0h0?=
 =?utf-8?B?K2czcUFYWFVyQnFNRkYwRXBZRUp2M1poTVMrS2FQM3I0cnVZSlFtd2NFTFJV?=
 =?utf-8?B?ZkQyQzJFWXh2M3NhVVNXS0k3TGhabGFmbzBiZjdVaHdYREVWM3EvVlc3dUFa?=
 =?utf-8?B?d3o0NUhCNmJtT2hwcFlFYXpPN29WQU93Y3dxanUvemIyRzMvNHFaaUNpOE51?=
 =?utf-8?B?aXpvOC9EQ0U0U0NqZ2c1MjJPTUdsWS9FWmpMRGVzVkhZSGVvMzd5NEcvZkNa?=
 =?utf-8?B?Z3FqbzFFZExCK1M2OXJhWklBbkhyNUk0bkFEWnBMN2E1SEEva1pmdnFlV3lE?=
 =?utf-8?B?cGJ4ZkFnUkk5NDFOSXNFY1FLWStRSTJGZ2FaTTd3TEZPSHg1WFhITVlRZ0p5?=
 =?utf-8?B?cmZuem5QZG1oTytYNVdxSWFZUlBydGNKRnRRU1R6UXp5eU8zbm1IcTlWT2Zi?=
 =?utf-8?B?ZjhaS2FjMGplNzFtOUlGMTU4UWJmZVlueFRQbmZCRy9tQ1FpQ2NNQ2NDY3FC?=
 =?utf-8?B?MXZ4Wk93MThSeEx2ZkV3OGk3V25odHVmTVIvNGdEaDlkKzBscm54Z2xOZWR5?=
 =?utf-8?B?WGcwcEJNem1MMHBDRDE1MTA4RllLaHQxRVp5YkhnUXo0cCtTV3NGTks0MjhZ?=
 =?utf-8?B?V0hQZzQxUTlVOEwxNVBaYU41azNGaVNISmdCNElROFdkSUVmUzAvaExwOTdG?=
 =?utf-8?B?ZThaOXBZTjl2R2dCalpoWk9nbnZPRU4wK0N5VkxkWTMwQm9wcTk5aHpBUmtH?=
 =?utf-8?B?TldUaHM4ckpEQkhTOFNYb01EUVh2NldzSWExUDhuR1BEbnRuZlNpZ0lOVHVl?=
 =?utf-8?B?UDRFVGJDR1cxcXlqekZhbFUxblU1Sk9KUDZCM3dUWTNvQi9DWTVlejVkeEdh?=
 =?utf-8?B?OENhWHNoMXBHQTVLUWd4alNRYXMwZUh2Y2FGTzl6YVhsYjNNRDVDajZkTXlp?=
 =?utf-8?B?aUx4djZRTlJkeVJMMmp1NXd3U0hhWmNwWjZPRlIveGI1Y3ZzdWRSdEtFRHYz?=
 =?utf-8?B?d0NoWmJFaFJPcVJpM3RYQm50eHNtMjBLYURIV2hhNjliLzlJNHdDQk9DTStM?=
 =?utf-8?B?VGpkYmV2WnlyVzZDd0lnM2VpNWllY3Bzd3pYRHg0Um5VZTRKQ3hGZXR0Wi9K?=
 =?utf-8?B?VUVFdVM0QVExOXJBZGJLOVdZN0owaWdYN2YzOHRsMWJhbEVndlNNM2RMT0dk?=
 =?utf-8?B?Ry9HeGxiczdNZUVXeDdGR05FTDRBYUx6U2Ftb1NHUHAxZ3E4M0huY1QrQmNK?=
 =?utf-8?B?aFVzK093WEt4M1Y0aEtBTlY3a0NVb1BUeEV2VEh4YWZITEpNM2FnZDBQcWdk?=
 =?utf-8?B?MlZ1aDhUNnVOMVpuT1dNYjllQ3pvVGc5aTBjeWRqUmU1dXl6aVI4NFZML042?=
 =?utf-8?B?Z3RCbE5BSnZ6Y0VheFRSUXhGMEhiNGE0Q3ZvOWozdFQ4am10enVCQjRnaWpK?=
 =?utf-8?B?Y0NaTVlCYm5uVDdVMVd0TTVSaGlKNzNIbHB3UXpQTmdpNEJWS3F2blo1UkFP?=
 =?utf-8?B?UjJnMGxJQ0h5SjRHN2tkVGFpOTVYQUoybTdIY2pvRTk3N2ZHVG9HNmFjeERq?=
 =?utf-8?B?c3hjS2liZlArNmpLQUZaZGFCUEQxMWcvRGd4a05MU0d0T3BUOWloMjFzbG8y?=
 =?utf-8?Q?in9YHacQKZJ2OGRLrtBRJbF5L?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebca70c6-5aed-4591-25fc-08daa149e8ff
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 12:06:44.1472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ziv8kL4TDn4QZ//zO/lpSmcvqwr+3TXf7i+4+iz9XyQcxcO8K9NLScNhwcTWqmxmYDLfAp3WECJS6gVMdzAM6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7219

On 28.09.2022 12:58, Andrew Cooper wrote:
> On 28/09/2022 11:38, Jan Beulich wrote:
>> As an alternative I'd like to propose the introduction of a bit (or multiple
>> ones, see below) augmenting the hypercall number, to control the flavor of the
>> buffers used for every individual hypercall.  This would likely involve the
>> introduction of a new hypercall page (or multiple ones if more than one bit is
>> to be used), to retain the present abstraction where it is the hypervisor which
>> actually fills these pages.
> 
> There are other concerns which need to be accounted for.
> 
> Encrypted VMs cannot use a hypercall page; they don't trust the
> hypervisor in the first place, and the hypercall page is (specifically)
> code injection.  So the sensible new ABI cannot depend on a hypercall table.

I don't think there's a dependency, and I think there never really has been.
We've been advocating for its use, but we've not enforced that anywhere, I
don't think.

> Also, rewriting the hypercall page on migrate turns out not to have been
> the most clever idea, and only works right now because the instructions
> are the same length in the variations for each mode.
> 
> Also continuations need to change to avoid userspace liveness problems,
> and existing hypercalls that we do have need splitting between things
> which are actually privileged operations (within the guest context) and
> things which are logical control operations, so the kernel can expose
> the latter to userspace without retaining the gaping root hole which is
> /dev/xen/privcmd, and a blocker to doing UEFI Secureboot.
> 
> So yes, starting some new clean(er) interface from hypercall 64 is the
> plan, but it very much does not want to be a simple mirror of the
> existing 0-63 with a differing calling convention.

All of these look like orthogonal problems to me. That's likely all
relevant for, as I think you've been calling it, ABI v2, but shouldn't
hinder our switching to a physical address based hypercall model.
Otherwise I'm afraid we'll never make any progress in that direction.

Jan

