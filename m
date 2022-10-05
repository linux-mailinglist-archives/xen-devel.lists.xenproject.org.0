Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EDF5F5514
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 15:11:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416174.660819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og4BB-0000nG-1M; Wed, 05 Oct 2022 13:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416174.660819; Wed, 05 Oct 2022 13:11:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og4BA-0000kE-Ul; Wed, 05 Oct 2022 13:11:16 +0000
Received: by outflank-mailman (input) for mailman id 416174;
 Wed, 05 Oct 2022 13:11:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L813=2G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1og4B9-0000k8-52
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 13:11:15 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70052.outbound.protection.outlook.com [40.107.7.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 302a64b9-44af-11ed-964a-05401a9f4f97;
 Wed, 05 Oct 2022 15:11:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7396.eurprd04.prod.outlook.com (2603:10a6:20b:1da::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31; Wed, 5 Oct
 2022 13:11:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.031; Wed, 5 Oct 2022
 13:11:12 +0000
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
X-Inumbo-ID: 302a64b9-44af-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUpW5/boUP9FgkrlT8fuQMcrTLqpEtorOCMjMXK7UiZBfEZwkOTOjD/KoHhRqP70y9iF+AP1oBh1eZPjCvfwNKAfpFYEl+8tDwTDUolTmlTjQjgLD7ZegDEkOD64QDuUrJunpKgvCk8YZWiRCyw4U5lqcp5HoVULZZa/Jf9Nw2CYspcxFq1ivHQqcJj208Y6tOTURfEfKbA8zmd9+ysaKOYFDfPKMASMLr4GWt563UqK2XvWSmkgmDXAWzPx1jiw5GHIQU6gMZ/Mjus9WGimOzIJYpRQs321R6oL61hDzJoosU1MYM7pXOK7glYAu0pwbvDcCZnTB/3osWN5PGmU7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9S3L1ME6oQ7xAf2QeMd4hnxdZC/PG4RsY/PeNf2WK8A=;
 b=nd3VLgGlcEq631XqDruGJAwNFZnTqSfoYGK1yLvWhCbQ/PjQ36znMzbrogqHXWHXzby3AFO/aOvAPOMFlWDbs7nXJ72ULh1QQYGam+bA2Dah5J1WtIXcgxJrPEhV7MAfpT+1tbhny6rXpOIBdULnW16du7gP2dg0UeEa0RiN3p1ytQhHApr4RvE8+6ml9fK3TE0IGx4UBBYYIOM5XLlugPY9fF1dJkOdMY/1p8J4N7tzz0WHIGyj80XP+72ce5Sw6QkSAPmz8gfVsqiroKtaN+zr2yDaVyDiamLNlJssgJxuydYWuJY1kDL5Gh6RFbtYN0Jn0Xpj0G9cP7QDLkrTXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9S3L1ME6oQ7xAf2QeMd4hnxdZC/PG4RsY/PeNf2WK8A=;
 b=v9xFMOVZ7dBDn59EUxTa+sFHJ5J/HGKvtUw2XA8NX9yJrts82GsJp9KfXvzVjT1Zv69E5DCw5tnENHov4VqQL9b821OGdYXsfcpn6jOVoPhvmMoXs6KAu/UnE6o1wSM2qxm8OipM0Oxyy+mVOsn7Vjh0kfM+V+XZm/uY4Dc9LT45up4XgOwQypZ8suPW/Up+9qU4HZ8QqjjxN3tFOUlQwFzYyJmihiJ73rKo0WjHfwr678yeryCvwggEwxWad3Tm7Rqdfh5F7MTO666zouHJNrhVe/Y03bnjsjCm7JrHVjWU3YN7CYfHsvLymTwXsrBxsUAKruYilfLoDRAFHpa5WA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e8142d80-217d-7053-1bae-cd7abff17b78@suse.com>
Date: Wed, 5 Oct 2022 15:11:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/2] x86/cpuid: Infrastructure to support pseudo feature
 identifiers
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20221004160810.25364-1-andrew.cooper3@citrix.com>
 <20221004160810.25364-2-andrew.cooper3@citrix.com>
 <50324b35-5b75-18b6-6ee7-fbe9b5f5d662@suse.com>
 <ccd05cfe-1f77-5bd3-996b-bfcaf2ae30f8@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ccd05cfe-1f77-5bd3-996b-bfcaf2ae30f8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7396:EE_
X-MS-Office365-Filtering-Correlation-Id: eab3c5cd-3d95-4c05-a9be-08daa6d3134a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lXKNL0Gcq5TN8l0axZp7uJ3+yvBShatp6BoeRJkuSjvyfmjR8SI96tERcjg7xEDqoK5EHlKo4p7m7wWg5F4jseoLrsscesfoZ2Zbrdrwe5pmf7eSjjptYDI/Y4aEgMd90/W/p6Rx8DgL1Xut6khEZugEl1Xk6qpukbfzMOngqwO6nK18NRSNgeUCcnRCp43AUUBPABPeA5c1JQIFEYMZzTHC1KmXlVbPMYwVurhOmz/Aq/bNbNWo+0rohsG8yBXb8Lko+csjsIKEmJ3QPLytRJIvkpFWhBRR55j6vvXWkL1y1kDbqS3/KLry5obVnkaGtvTRuawcp1lNsdgXFMtQyA7suOA5GR8wu2Q6Vl8YsQAjtxBydfMWZV0L99YfaAT9Pizve2CuDuwdYv+AWXYizaEYKdlxHdV2tFfC6YJEu3VqDpAJ4M7I/gdMg2b0yV8VoZwlR2ePUUb31k4ZXkv/Gn9vYh9swJj7kmXRUAgSUzA3h3YYHnGdoqMmF4FQc70UDUsfywm+8yZLjCsawn6SViOu3FIbMKtvkqBzHG5MvMj3135bk0zPUMBJpHUpwuLXqRJ8giwSqdxfemu3R6rBrzbFj/MDX9SGiKwoJdN1pQtdJKKDlxM+9JgOuUC9MJHXY9VjG5MbfTAIrH2BL3q50B4G1E54Dt+OtATnSpfGNFbJ9czZKk+0bH5t257WN3n8fXCY/mf9btgnISPZUXN346vlNEH15IvhhkT0JMgZS0KACzmcMhIpdGLYE1+YMNin1DY9Se5rVEKhWzR4eJkBb2oJ9dg52Zrnskqhh1GrTqA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(366004)(346002)(136003)(396003)(451199015)(4326008)(6512007)(6506007)(26005)(2616005)(186003)(478600001)(53546011)(6486002)(2906002)(5660300002)(316002)(36756003)(54906003)(8676002)(6916009)(8936002)(66556008)(66476007)(41300700001)(38100700002)(66946007)(31686004)(83380400001)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWY0M0trMEwrVE05ZCswTFpxVmlQdkJIa2V6U1p6d1VhMnZQdXNlV2NwQnRQ?=
 =?utf-8?B?ZVZPd3hpRGNUcEt0UHZ1bmZ2OG9TY0pKTVVRSTFFTnNMODI2MHZQNzFBOTE2?=
 =?utf-8?B?c2RqbUNNQ09lelFaVTlFL3YzZ3ZXWng3TzJsYXNlUEFNTlRobU1SZmRLWTBx?=
 =?utf-8?B?a3hpN0lJMEc2L1hiZjNYKzhqT2kvVnFkdHZtRkZkUytmQzFvOUw2dUd5d2dB?=
 =?utf-8?B?ZnRGaEhXc1FJVjNVeml2VWJQT0loNWR3WmxtYzJ4TlpZWjlDaGJJWUpVZnV5?=
 =?utf-8?B?OE5MOGpjSkFaY2ppd3FLRTZuZE5ydDJFRm9FdVpKbjhBVmJaYThodmdKa1dv?=
 =?utf-8?B?VC9Kblp5bEl3aStJWmpUZkdlYXRIMTRDSTdkbkZyK2Q5L0dQWUN2c21qbDVx?=
 =?utf-8?B?VkQrK1d4R3ZDVDZkOUwxR282M0k0Mzk5RVFpNWQ1emNlbjc3V1RlS1ZwN2R6?=
 =?utf-8?B?eUUvSEQvYlMvRkhaMjJMMUJPOUdxc3MxcTNUcmNLRWJnTmJmb2RXRURQSndP?=
 =?utf-8?B?b2Ivb2R2VUl4UEpPYVRNWFd6eTBkS282RWRQWGs0L2V5K01FZGpib3lrVWJa?=
 =?utf-8?B?VEFOalBKam9PWWFPb2JHYUs5MGg5emc2OEhZUHUrSmZoLzlLbjN3TEdNNjlt?=
 =?utf-8?B?Vm1iQ25Zak92YmNTOWF0NUJ1TEo1aTZ6aktXTFJQRWNxbHFSQnBzZzBoaUpH?=
 =?utf-8?B?ZEdoazQvN2tub1ltb1NDOC8xa2NEYThCWHgyOFczZDZQQncrK2RXYkM2djdr?=
 =?utf-8?B?cmU1OVpPVXIwZ2s0KzVHa3luQW83RS9USzdaYzhWazk4bU1mbDIzNDRxS3FO?=
 =?utf-8?B?bmRpc1BmdS9NNElCZTdPSUIwNmJwVGZmYk1tdllHV2xxMVh6Nm1zcTJkbW1D?=
 =?utf-8?B?SVlNUVJJSEptdWpMVjhQVEZFYkxYZTV1K3FOMGp5cTJSa0xWcW5vZnV1Rlhq?=
 =?utf-8?B?ZVl0Y1NYZDRZM1lEVk1JTW1sN3N0aFQvODlGcTJ0cllWRUVBYnZucThGV2k3?=
 =?utf-8?B?eWVMdjVuSkVhVlFybG5icGFOZ29NdGllb1RuS1VZUmUrTTY0Uk9ZQTFGTkly?=
 =?utf-8?B?N1NhSGgxb2RQVlQvVnFSZDVtVERzYTJrSlJVV2llTU1CU0JJQzQ5Zlp5dE9N?=
 =?utf-8?B?NEhCM2d2YXJhWlZ2OGpKaUZmblcyS1VYUXhjczFYTUZ0VTFYZ3dqWkIzbXhw?=
 =?utf-8?B?WTR4ZE4zZkpMVnE3TDhtKzIrY2tMZzJWSlU3b2doeThheExGMUtFa2ZTNFdZ?=
 =?utf-8?B?Ymp1TEtWU00xNFUrQnF1cUZGQVVnSEJLU2ZrUnU3b0JTTGV2cHdRWXRMQVlR?=
 =?utf-8?B?UWZOODlvVDQzdncwczVHWHYyU2t3aU9iajNGdjdNdlRwVUpVSHROcVJ0T0Fa?=
 =?utf-8?B?ekUrVGtXSmgvazU0blFTY21pR2tpTzgwaGo4SExQR3BoazIvVkljZ2NlMkFG?=
 =?utf-8?B?UnFIWUIwcUxLTjlmSXBPRC9HZXBRQm1JS08zMXMvbWtoMjlqVGJSR1ptL09C?=
 =?utf-8?B?bHZQWTNRTGY1eHl5czZpZXJ5WWlYMVRtZUNaMDRsV2cwOGpndzRqSkhyMWow?=
 =?utf-8?B?dHNPK0dWRHdubnVuTFBYdDM2cmlEUm9GZFFtR3Q5S1RObS9wWC9qZ2kwaG1r?=
 =?utf-8?B?SktsaVVMb2Jqa0hJeEYzWjRYRWhnd2ZrYkhCQTIza1dlR2FXNHRJdEd2VlFt?=
 =?utf-8?B?Y25GYXl6b3dQVDRONFlYZU1sZ1pIR29QZFRvc09weFp5b1BFUysrOE5JR2Uw?=
 =?utf-8?B?S2kwTCs2czJmNEtxTS9PSVA3VytWemplVnIwaklNbi9hMGRIMi9mYUFnWThF?=
 =?utf-8?B?Wm93cm05Qy9Nb1I3Z1JQbDZqT3Q4NkNlMG9SbG9ObHRHWDg1WXMzMmNwbVFV?=
 =?utf-8?B?WFJYZkRkTmxXUkdnYVVZVUpSbG9XaUhjVFVEL1JrQjNJTkM3SlNTSFZrQzM1?=
 =?utf-8?B?ZGNUQ2ExZ2YzTUhwaExvWDJDeTd6VFVXU2FaRFAxbThEQ0xxRkNQajhhLzY3?=
 =?utf-8?B?bjA1eHA1ZlhGODM1L0pJa0UxZ202Rm5JMGJqNUNFNitHRnh5VGplYnJ6d3Mr?=
 =?utf-8?B?ZVhLN2hORE1wRXVUelgyRUROZ0Zhck52cWdFOTZXVVkxU2EvT216ZHpGR3dQ?=
 =?utf-8?Q?SnGSlYoaLBhPnFSY2nSUiq3s6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eab3c5cd-3d95-4c05-a9be-08daa6d3134a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 13:11:11.9566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IN/Zvfutm66nsvZRbcL2hH6JHbWvpMnG+dTeVpUBrZ5eQO3lk+N87UvkLfxJCJZgjCC5kMv0Y0g89XIwPUR5WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7396

On 05.10.2022 14:58, Andrew Cooper wrote:
> On 05/10/2022 07:59, Jan Beulich wrote:
>> On 04.10.2022 18:08, Andrew Cooper wrote:
>>> A future change will want a cpuid-like identifier which doesn't have a mapping
>>> to a feature bit.
>>>
>>>  * Pass the feature name into the parse callback.
>>>  * Exclude a feature value of ~0u from falling into the general set/clear bit
>>>    paths.
>>>  * In gen-cpuid.py, insert a placeholder to collect all the pseudo feature
>>>    names.
>> Hmm, I was envisioning this to be fitted into the existing model in a
>> less adhoc way: (parts of) MSRs holding feature bits aren't very different
>> from individual (pairs of) registers of CPUID output (in the case of
>> ARCH_CAPS there would be a perhaps just abstract mask limiting things to
>> the subset of bits which actually act as feature indicators). Hence I'd
>> have expected them to gain proper entries in the public interface
>> (cpufeatureset.h) and then be represented / processed the same way in
>> featuresets and policies. All that would be left out at this point would
>> be the exposing of the bit to guests (in patch 2, assuming the split into
>> two patches is then actually still warranted), integration into
>> guest_rdmsr(), and at least some of the tool stack side (xen-cpuid, for
>> example, could easily learn of such right away).
>>
>> However, since I'm pretty sure you've considered such an approach, I guess
>> I might be overlooking some caveat?
> 
> I have on multiple occasions considered putting MSR_ARCH_CAPS into the
> existing X86_FEATURE_* infrastructure.  In the future, it's likely the
> right course of action to take.
> 
> However, doing so now will break speculation safety for guests in some

Considering further text - s/speculation/migration/, I guess?

> cases.  The featureset API intended to be safe to treat as a regular
> bitmap, and this is how it is used in practice.
> 
> Honestly, I didn't imagine that we'd get bits like RSBA and RRSBA that
> need to be treated with opposite polarity to be levelled safely.
> 
> Even if we do end up putting MSR_ARCH_CAPS in X86_FEATURE_*, we still
> need to remove the featureset api (replaced by the cpu policy
> infrastructure and libx86) to retain migration safety.

Well, I didn't mean to suggest to put all of the feature-like bits there
right away. Just the one bit we're after would do for now. Afaict that
wouldn't affect migration safety, while it would allow doing things in
Xen in a more "natural" way.

Jan

