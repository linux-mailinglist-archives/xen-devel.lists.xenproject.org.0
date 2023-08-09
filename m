Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7915A7752D7
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 08:25:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580669.909040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTccH-0002sU-Ls; Wed, 09 Aug 2023 06:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580669.909040; Wed, 09 Aug 2023 06:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTccH-0002qL-JA; Wed, 09 Aug 2023 06:24:21 +0000
Received: by outflank-mailman (input) for mailman id 580669;
 Wed, 09 Aug 2023 06:24:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTccF-0002qF-U0
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 06:24:19 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20607.outbound.protection.outlook.com
 [2a01:111:f400:fe12::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d708c03-367d-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 08:24:17 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8692.eurprd04.prod.outlook.com (2603:10a6:20b:42b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 06:24:14 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Wed, 9 Aug 2023
 06:24:13 +0000
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
X-Inumbo-ID: 5d708c03-367d-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hm5Q5MPJkaGWVRSFijfYYlwflyp6YVPFEwnGyUTBDcz125Byvb44H/oy2jVgN3RwqL5l1LY4Cb2e1yS8bvYLVPIQN4fjEVb0qaBNT4+FhGTcw+H1HoUjqNFrLDliMAlnIpW+8cB5Vk4hlaJFA4ANkhXFV5JPYuXHjoXGItDXbWTRTCvEgSk7oyC1Ca+mv/d8n4BFMutY1+J/uas/YHHaXmRm0w44+yNZwu5D/bmERjQ8piWN12t0vXN7XX8Zv6q5Ykh/ZIJQy2AZh9ebId/2zLoQ8VDSYHerNsTqSv7u8rNb4yEcn/nXqZevHawuE/EMe9QSIBsypctLxeI2baDPHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZcQPoU4wDplfHrsiYLp28heQKr7vwf8EIERgo5gXJWM=;
 b=UNcMeBu49OW/B+MK33TqQwm2SrzKDFbA4WXV6S7PLUF78WFe0rIO7NIRiRO1XW8jz2/Fd99G4evTKkCfe4K7RRfeHVD8lfyus+stjfYj1fdRkqdlTGRNCqpn+A9tbvFVE1/CKU48kM1ADQ6+Xe9s2gREtBoUn5XgR7/adWSJEPDzt/5wEllMNg9KBTs/ZlvJBXmf5jI9lEpGs9SUYG3LaZQFYgDreO27THhQKN8nC0EolSoYerxo/rFG1WQJFHxqWaTU2BHPEqoCLqcztnLOPYvrciKDolvBbrhRq4vYLte5NebajldnMCavoxTEy1L3ejTvv+NAlsWhVZNXyP6j5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZcQPoU4wDplfHrsiYLp28heQKr7vwf8EIERgo5gXJWM=;
 b=1mGrltdpyhOsdef5WIFS47N7HAntZn4osPHFnk4p8tTrs1fdls6CnEE+jx/Al6Nog/OsJe/tjE4FnPITR08MsYjdyhwMmh4IT3z3S1aZYmxmYCTqdhM6+fNAQ+dNTHGRDLrlpK0KCjoyfr2euy9F8KmaubqzuQCZg+80tD4oOMw+tC4Uz4E9FTDs8MrywB+kQLIWWxiXlag38MSEGCduexVwAsJgdsmTaVJpi4i2jmVHY+jwsMh/9isqmFXFD6VSjuXAIzTnRM4/JmIFGZqYUfVfEiicBIII6aLeEd1EhkUbS60I5rsk58QtPhWAI3NdQl+XyvIYZQXlLjQQstPCng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <456d6bb5-8fa2-d47a-5d1a-b3bda20e0a5b@suse.com>
Date: Wed, 9 Aug 2023 08:24:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: MISRA violations in hypercall-defs
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>, jgross@suse.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <5972799c-99a6-73f5-eff2-b24469f7428d@bugseng.com>
 <01fbd921-8092-aedd-33ec-ef170d8ec6fc@suse.com>
 <alpine.DEB.2.22.394.2308081457530.2127516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308081457530.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8692:EE_
X-MS-Office365-Filtering-Correlation-Id: ce9c384c-88c9-4cc3-2083-08db98a14022
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NJovWp9JWr0FpETeEZoujc35TfCwZh+t5I8m43PeJJW551Zo+o4lxLva7ibaI+o4oBImgQ4hLmsMr1HxZ7oy/guREg3MDMX77VAGfU4OGADIl6hJwXO8R9xeRKmv9FXTseHre5Da0QlFmj2+t6rW6TnjqZKSzcZtMreWbzXNRVyuC5FA5KtLaPZe2QvBcJNiQKI9Ws1PGKQAK8PkLUG64mFwKfZhKzPlrN/235ypsaGPEvLlFCbmeDJScV73LrG6ufLIOUXQ0TKut8FKUdbacDlry2/yE1mvAeC9A86XAxJsds8GQcWuXHHzAc62FT4G3W+ONfsgLH7HFTrxzKmraeSTQOs5PKxbALpeEq/XwjtW2ZejhddTk/2zUr1mvJL9dm78Cacxi1ns7KiBbiZxiiHgnIuT0ij/Q3qbyNOt3SyWDLziMLyej0zLbKZZVsIVbvpUKwOyuePBudW+wOn6e5kBh7WClkXIgIHTM2CYPn69jE6kVIsLboJG6xYbRMO2Qw2RdnddQ9oxfJM5bi+GkaN4eTC7vK2//526v+rVVnF46C1EQZXr/WZInKs8LcVLIoFxDJn8DJo1YoKhE4gp2PK5FgFU7ZIia5t9QZEag/Ekl04b/it8kjOTb5LtMTD6WY9l4A91T52VLPu4Pq32uw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(396003)(39860400002)(136003)(346002)(451199021)(1800799006)(186006)(31686004)(86362001)(316002)(31696002)(66476007)(4326008)(6916009)(66556008)(8936002)(8676002)(2906002)(53546011)(5660300002)(38100700002)(36756003)(41300700001)(66946007)(54906003)(2616005)(66574015)(83380400001)(478600001)(6506007)(26005)(6512007)(966005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2hvMm51KzZtNEZPUTlDcmdzU2lFMURyV1l0WXFtV01KKy91R0RMYWxxNjZN?=
 =?utf-8?B?MHhMNFdNcGEwS1hBSzRadFN5aXRiMllGMngxZ0RqU1I1N0wzSEx0dVJLUDFy?=
 =?utf-8?B?bHNCMy9HMlVLWlBmNWRVeHJUSmlsNUgycm13dWN2RUxNOFRwOUhRUE9yR1N3?=
 =?utf-8?B?Nzd4d0t1eVIyZEF6cEswTVVOSTFnNjlxSGRjbGhxV3VPNUpUMW9tMU1oVStP?=
 =?utf-8?B?aTltc2tROURIc3VBbmpmNWp4cjlKUTk2N2MzcUYxRmMxdUdpa21RWlZUZWFz?=
 =?utf-8?B?S0RCTVNaK3VQbE1NbVhmODhSeW9rTGs1SktzenVjNFVYQk1FcEZlZFdqVldB?=
 =?utf-8?B?K2V3NUtBcDFQVWNYcmlFbXRRUjJLNkh0L0pjR2syYzBITG1vVU5aMy9Ba0la?=
 =?utf-8?B?bjlCb21tRHh2WGs5ZnlqU1lSRFJSQVNLU1dkVEVUemwxUStIUk9IeVpyV2xj?=
 =?utf-8?B?aklrdEtMNWUrano1WGs0VFVuWHJIY1dyRUNRZzRhOHl2YmYvZlo1MEM5cjJT?=
 =?utf-8?B?VmpQM29tTXJZZGU5dUhSaXFQcVhBWExSNnR3YzdWT0tjNEhaQnlSN2pHV2Ji?=
 =?utf-8?B?OUtUV0tiRWpoZXdQNEF3VzBPRFNMbk1UbnJ5UUJHVjVkY1VRQ0E1cGk4Z2ZO?=
 =?utf-8?B?VVVhUjFZNEcrVWdoeTdmaEgrZnNqQmlKOWRNQU82VlBvR2R1bEZORThMRDlC?=
 =?utf-8?B?ZnZDYnBUb1lWc3o0Vzc0d0h0SFppQzI4d25vWWt0RWhsZDVaMHlDM1NXRTgz?=
 =?utf-8?B?L1M4VTVoSnp1K0VrVWJlR2V3cVczUU5LSGlGN0tCV1JmcDk3Y0hDRkl6UUZt?=
 =?utf-8?B?TnhRWW5BYnltMFZNQklsdW4wUmZDNTVtdEtGMlN2U2FSc0JKQUpZV2dTbThV?=
 =?utf-8?B?VG5RcXF0bEgwNER4M0k5TXBiYWNucVhHbG9EdDVQVU9NTmpiNVJBOFZuNEFM?=
 =?utf-8?B?RUJERnBzTE9sSC92UkwrcXdLWVR3cHdGTHFnR2NhbnVNVDlsakR2d1dtemhj?=
 =?utf-8?B?Tm1kbUZQWVR0eXREa1l4QzJFWmRvS1VEQ1dBdEtKRlBaN3hSdkl1TUtrZkYv?=
 =?utf-8?B?SEw4SDkwMndEWnF5VW5yQ0V6clUvdEZ1RW1nYVEyQlBHL3dCeEw4bTVaQmJM?=
 =?utf-8?B?TkpFY2F3TmIwcWp0dHRKSUc1OTdobG8ybTBhK2RJRmdCekRyRW5WRUtOdHFQ?=
 =?utf-8?B?SUNYeXd6d3JMMXNvUmF2bzgxZUF2aHdST3lkU2F0bkFjWjFDa3dpNHdNUkI5?=
 =?utf-8?B?M0R0akhLeWFiajdZR0ErdE1EOFJpajJoMVpSeDVsNVdkSEN4MW1IUGVHWW9l?=
 =?utf-8?B?aFhkSnNFd2cxazZCdUpPRUtnbVpTRlh6bkNpOVhoMkpweXlHNmVrQXBlc2sv?=
 =?utf-8?B?SDNoeGJSN1RubEk5VjIyeEZhbitxakNIcHcvWEIzenlnbzhZOThQTHVHTFFQ?=
 =?utf-8?B?K3VWSlMyeHNLT3pvWFNzMjZYMWxQc3hWb3FmK2VoQmVLOGdLSndYZHFYM0hG?=
 =?utf-8?B?QWpBeHFacWhKcHppOTRyQ3NlRlc3MTlQZjFFZVgwNHpGY1B5eVJ1U3FlNHVv?=
 =?utf-8?B?cnlaeXZzVDJtNjZsRGR2RU5GY1ZBd0NWZ2xCMFRmeTEvMy92Nzd3dDBxRHRU?=
 =?utf-8?B?eTdqamR3NThST1pOeE9EaGJvNUtFcUtsbC83NW5yVk1hZktHclhxcGFmNWdL?=
 =?utf-8?B?N012MEJaMG56TVh6cEU0VWlqVHhwZUdNNXlIdWZZL2pGR2NreCtkUUppeW9q?=
 =?utf-8?B?QUsrN2tUT3A2OXJkSlM5bU9FWUt2TlV2TlVGQXNWMFQ4SGEvNmR0N29jNXlL?=
 =?utf-8?B?UDFvYTJkSkpJUlZzZE5STUhwVGdwdk80UUd2TVd2cVhxcXFlYnVGRlp3Ykpi?=
 =?utf-8?B?aUFtZE9uM3JGZm5nVTlZakFia1FnMnFiQmNDNnBZeXJrbmIrbW1hV3NjSHhz?=
 =?utf-8?B?ak5zUkh0RlhUbnc3bzZ4SEtrdUtWNXpON2pNSk1TTWNQaUwwVmJxYW5OVUdw?=
 =?utf-8?B?bU9nRWxFa0plTVNGaEEwdWNDZ2wzRkg5YkpLbGpuazB6Zjk2OGZYMVlHTHg4?=
 =?utf-8?B?ME9vUzNWTGF0YzNGTkZJRCthb1J3N2dpdzU3MVEyOFJLVGdBZ1VKWVhWYlp1?=
 =?utf-8?Q?GPyRCXFGRyH0U0Mpyhgs1xraB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9c384c-88c9-4cc3-2083-08db98a14022
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 06:24:13.7481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Po88BpC7tFo2cUM+m34sYmUh6FHEecPBbqmXB/HgKAV8/4j6QTmYMHw+lIWOEtYloQtV5Xr9vAcQZSBjldVvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8692

On 09.08.2023 01:22, Stefano Stabellini wrote:
> On Tue, 8 Aug 2023, Jan Beulich wrote:
>> On 08.08.2023 10:47, Federico Serafini wrote:
>>> Hello everyone.
>>>
>>> I would like to to ask your opinion about the auto-generated file
>>> xen/include/xen/hypercall-defs.h which contains some violations of
>>> MISRA C:2012 Rule 8.3:
>>> "All declarations of an object or function shall use the same names and
>>> type qualifiers".
>>>
>>> Such violations can be seen at the following links
>>> (copy and paste the link on you browser, including also the characters
>>> after the '#'):
>>>
>>> - arm
>>> https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/origin/staging/ARM64-Set1/218/PROJECT.ecd;/by_service/MC3R1.R8.3.html#{"select":true,"selection":{"hiddenAreaKinds":[],"hiddenSubareaKinds":[],"show":true,"selector":{"enabled":true,"negated":false,"kind":2,"children":[{"enabled":true,"negated":false,"kind":0,"domain":"file","inputs":[{"enabled":true,"text":"xen/include/xen/hypercall-defs.h"}]}]}}}
>>>
>>> - x86
>>> https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/origin/staging/X86_64-Set1/218/PROJECT.ecd;/by_service/MC3R1.R8.3.html#{"select":true,"selection":{"hiddenAreaKinds":[],"hiddenSubareaKinds":[],"show":true,"selector":{"enabled":true,"negated":false,"kind":2,"children":[{"enabled":true,"negated":false,"kind":0,"domain":"file","inputs":[{"enabled":true,"text":"xen/include/xen/hypercall-defs.h"}]}]}}}
>>>
>>> Some of the violations are due to mismatches on the return types
>>> and the use of `ret_t`.
>>
>> We already said that ret_t will need deviating. For parameter names
>> it ought to be possible to suitably rename, like done elsewhere. Whether
>> that means renaming in the generator script or in the definitions likely
>> again needs judging on a case-by-case basis.
> 
> Is it the case that ret_t is purposedly defined as 'long' for 64-bit x86
> guests and 'int' for 32-bit x86 guests?

Yes.

> I am asking because it looks like we don't use ret_t at all on ARM and
> on the public interfaces.

And I wonder how you get away with this. Aiui hypercall return values are
32-bit on Arm32, so I'd expect you to be at risk of truncation issues in
a limited set of cases (see in particular the bottom of compat_memory_op(),
where out-of-range values are saturated rather than truncated). But maybe
in practice this can't happen?

Jan

