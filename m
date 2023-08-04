Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA3B76FA4F
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 08:43:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576908.903582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRoWa-0000dc-R1; Fri, 04 Aug 2023 06:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576908.903582; Fri, 04 Aug 2023 06:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRoWa-0000ax-Np; Fri, 04 Aug 2023 06:43:00 +0000
Received: by outflank-mailman (input) for mailman id 576908;
 Fri, 04 Aug 2023 06:42:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRoWZ-0000ar-6p
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 06:42:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25612bf2-3292-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 08:42:57 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6788.eurprd04.prod.outlook.com (2603:10a6:208:18e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 06:42:55 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 06:42:55 +0000
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
X-Inumbo-ID: 25612bf2-3292-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNpQSb1DKdlGkCwkqyq1os1zxY3MqMRr0PUSZH9onK4vR8L9L5W6ReJU4p6O9Q7jCmQ6BCk7ppAXo4DxO0EZfPE8pVMB3r0M2w/hw9gs6+QlajaytFP/0UhlntJRgc5g5trro8Ma74f2Daa2jS5hldRZNmpSPO4ClHXshwWh3RJvhsYgEoAfXjbAKgJXs3mhQ/1ZFVNIsvS2t3smvcPpi3WfFhG0ePc6EqTjo3Gk7JfJVfV8A0WbR0Wu/CGK4DJWWugCR7XTZuEhvgC2Kn92qVqXjcWFAzxHyu8HSH+owDfvO2fVMRAqXmbuJNX/NNhGGTyN982ROl794DMWKYDnRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MipxFbC5XW6h6ZSCdyA1uHNCMDd+wtvdifl8Nc8zk8o=;
 b=mdfTz19GaVYXhkiRgmX91VbcHqiQtj3FlJTA+qfYsRe54jSnGX96I58ANGl89Idn89WbDZ+pgn+1ddIr1LZqY3M9W0nzum0BosaZ2NZhZDtwxnZOXdXhjOk8dKwFIhdNbks2pJfj7gGDTm9EuEu+ZzJkXeywVeMtj6oQqO/1Do5r/+gWA6iVE2iN3oK1EYCR8EVafUhnZZn9Sm5bBEJpyMfqD4tjrJ5PyVygh2hZD0g7X4WK47WoxylR/Q/xgys2OjQW+7o4UMmBlxoyVTZ6rIhg3bblZSoiQB4MifxtkA3q28thZ2HCbuXwk5+zH390zYwbzdMgGWUg2WX0hUWoHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MipxFbC5XW6h6ZSCdyA1uHNCMDd+wtvdifl8Nc8zk8o=;
 b=Wi6fGfz/VSiCOuEEtj/oFyMBLhHgBWhBRczPZQa+Lw5vTms8/jD4PV3q10yb6ClfVpd7bw+BnJRlGPALZe0DIXa00Z4NQQgtHiA+jJFTGKjYf960jL8K0fvSm6EN8vsn2aeQbKQTQWugD/0DaM73GipdTmQwvxQxdp9c/MkfHFz9Ldh5qUGuk6cYyQJzdyHUvieGmaMJ3/LvsGoYgdvIjiEMZN+I7Oy0D8lyjCSo3qOVgUeysLq4mOxw6x/zzDzmw4gHnLPUHHDxLj1Ya1ivz+Zd3sUWyD87XVUe53cDo/ibgKGSqAytHMgzekrrNzwiY/bZH8tLaNkXEmRDbW9ZyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3a6ab847-fd31-60e4-2558-feed71d670dd@suse.com>
Date: Fri, 4 Aug 2023 08:42:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH 07/11] xen: address MISRA C:2012 Rule 2.1
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
 <7f8cbd8c8ad64cd3a0d099f31cb4d3fad48aa63b.1690985045.git.nicola.vetrini@bugseng.com>
 <e2d71138-e714-3c19-d5b9-94b322a47191@suse.com>
 <alpine.DEB.2.22.394.2308031648340.2127516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308031648340.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6788:EE_
X-MS-Office365-Filtering-Correlation-Id: fcec7eec-f73d-4be8-105e-08db94b60892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z5DPAWAIcO4j3WOuy5K4LvG0QxKsERPdJ5kd/V4yxyABbz0eDEVqZJydYBr0wkM1on/NmVYLOFTQJ2wLaPqIwXLtWykQbmcilQKHJK2mj7SdWhHNxpznp4NSVOVqoYFf33KKm85LyLkiAg1HHJvsRBu6Kz4Co6ZqGKVp/eOJpZF1HXrocl7Y5kR7sANVhSKkKaZlY7cx5E7XLmvXXmgKM4RM/bv3LjNeJpt/qo4MySDudS0wWlmXMRu4sXxUH4L0sdtFDkPFQmNFtLbiWzLcOQG1rCll2WJ7ZGY8GQ3z36kdTEHJJuA2eECe+po5ryZDTpE42QIkk27pBqjKe9Sj0xbXFtk1bRwhFi4YUDaPX8/jwmJL/f3qMoJ5RrutGENrWmwc3uenAeoOwt9QtYbfG47MiGM9ReXRhoeJqdAOvYn2YT1Q2MLznfO1AIr37DbWNTK74hF2NE1GS1NVzuyI85ZQHVqB7YO80fyt5V1d+nRtUa1APy6CBQHH94E47fsYsDjRINNunZxA2jsmTA2/Wh1o2QlLTLe455GmwdzXDNs3aP5kdKWPxdctp/CLVxlNCz1Rxxetawr9X/J53CbitP++IaSP+ins+ZztSxjcoAdUDReS9zmajZXuGQaEXQt49g2ilyVu1mOoazbUeStWmg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(39860400002)(376002)(136003)(366004)(451199021)(1800799003)(186006)(31686004)(66556008)(66476007)(66946007)(6916009)(54906003)(4326008)(316002)(478600001)(36756003)(6486002)(6666004)(38100700002)(41300700001)(2906002)(6512007)(8936002)(6506007)(26005)(8676002)(53546011)(5660300002)(31696002)(86362001)(2616005)(7416002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUhnY2lDdkg3VTJhNlpGYkVnSlJ6dko5Smxhc1kzTjJOU2ViUXhTT3JncUJu?=
 =?utf-8?B?bVFYRlVwK3dZdEN4TnRDWDVrZzZXWjd3dU53ZnI1STUxZW1NcGprdHZRZStR?=
 =?utf-8?B?dXA2ZmtHa3RjY1lwakRqWlVjS0FndGoybkJhVU1LMVk4S3poNlplUnNwZ3ZI?=
 =?utf-8?B?UXB1ZDRBdlo0dWR2SFFaQ1VyOTVtU2xjZFIrcHp6ZnR6clFwMGcrYTFQdWdS?=
 =?utf-8?B?WVIxN3NsNE0veTIzbHMrd1A2L1JlSnNXazdMbURydndGMWVkTXQ1MTd5OE5h?=
 =?utf-8?B?dFp6amVkU0xpQ21wWTVjR3hwSDB0UDkrOXZQT0VTNVptMzRnSFJqclJWSVFB?=
 =?utf-8?B?cXdBYWNSd0VQZW5wSjM3MTBiblNQVlpXZEhLeTZBZUEwOXNjSU5TNWFUYldZ?=
 =?utf-8?B?K1RhcnJQdUQvRnpZZkhVL3NzVHl6S05TVDcrU1d3emRxZkNCSi9qbWM5UnJq?=
 =?utf-8?B?R3d3czNOQThOK3lTYjdpTVlEU0l6WGVOdm1aeHg5SVNlYmhjdVRQdkw5Wkhu?=
 =?utf-8?B?UzJodm5GZ1hMcmRpV1VMODAwRkNzdEk0U1BYaGdPaTd0UjltdlkvUHJtWnRQ?=
 =?utf-8?B?TDREZjJYYkZKNXFGbUxwaGxrUFJwM29uayswYnpLNXArNFozZjl3blAvSFhJ?=
 =?utf-8?B?Qkh2N1RCeG1FbWt5Tng2aHBuem1ZZ3liSTZMcmNVbWZQSWdHZm1JTzg1Yndv?=
 =?utf-8?B?RFVSamdlMm9jWUd0U2krbUlMY2kzdGNlS1YrOFd5cXhVSVhJMFFhMHllWm9J?=
 =?utf-8?B?bjhNUHQ2SDFnVGIvSVVqcGhMcjVhMVRQMlljTW85UTBIbU5mTDJKVnlaK2xy?=
 =?utf-8?B?OUI0bzVNS3cxMjNFTUl0eFhYNDEwaSs2b0tVOGJPM25GQU1hRFlNQzlqdXdv?=
 =?utf-8?B?dmlyYVZzQnd2T3J5K2dlVmlnWnBlc3hkM3QrRWxoTlV5YVVzaEIxbFl0Tk5o?=
 =?utf-8?B?NE1ZdFNnRG9YZXNaQ0FMSDVYNVZwUzdZNmdrcWE3ZHp4ZVQyeXBoczVNQkQ3?=
 =?utf-8?B?dEYrMHZyUnBXaEI3OFhIK0RFbjJ4RFpVcTBwQnMyQXFkRkZQaURqR3pMdDV0?=
 =?utf-8?B?a3dIa3ViUHMzNzNqZ2IxOHF3TTQwemJqQ0d6T1Y2UWQ1VDFBdUw3VmdXRTA4?=
 =?utf-8?B?U2RwOWFJOXlKbDJMV0kyZHgzTkJQak10NzlxM0d3amc0US9tUTU4VHY0K01M?=
 =?utf-8?B?R1gxZ0FJN3hBODk0YXRoZVNKaFl1anpyWGFpRE85enRvaU5jenNTd2c4WERE?=
 =?utf-8?B?N21vdFhqYkgzNDRHNVAwdkZsdld6elkxQW9zVDEvdHpVbnl2c1lRKy96L3k4?=
 =?utf-8?B?VWRlZC9wM2QyaE05dnhzb2JsNW1reTN3dUdPTUtkcURMRHFDZ3RZMHJhcmZr?=
 =?utf-8?B?WlpwaFdoK2MxY1RaUkNMb0k0ckRXbXZQaTlHajdzRkFtMUdPMjRiQitVWVlp?=
 =?utf-8?B?QjBCY0VMWjhaM0RmcFNPR3dMeE4yK0lmcTM4NjFYRW9GS0RsWUlqRHpsS1ox?=
 =?utf-8?B?bCtIdk5aTmtubUVNalBxblNmRThGeFIvQ2RCVk1VSmZMMGJsM2VvNnBtL2FY?=
 =?utf-8?B?SjlFY0N3OEJFY1RsMUhTb0cvMDhWWTZ3SCtaUDdONWhHYm1OZno1Q2wyZ0tS?=
 =?utf-8?B?Rlphb3F1SnJMTlROSVRKNGZTVDFZY3VRTEE5cjlKOGd0czNDTkFqUFhyK05C?=
 =?utf-8?B?d0pGZzB5WUpyYWMwdElWdDJnbEd4S2NTZTdFUThCTHR2WDN2TmlLUTB5VzZo?=
 =?utf-8?B?VjkwR1dJTGd4KzVrbTBQSCthZXJBak9Wc1djczRPTGdaWXdLamR4SDRieFpy?=
 =?utf-8?B?Yno3THdCOC85a1hhSFYzZ2laVGdLREg4QmZ5dU9SdEI3TElqRFZYRzJodmZP?=
 =?utf-8?B?cUMzQkdSc0NCWGRqdVlhWWVWU3ZnTytySFBmbFZOZHJDWDFsaGZDOFpkcUQ2?=
 =?utf-8?B?VCtNMkw4Ynd0RUJBMWVHUlYwSGpKOCtCQzR6SXd0L2JnbDBaVFJJUlBNUkt6?=
 =?utf-8?B?QUVwVGdHbzBhNWVlSEJwUElFVFpIcnRIRGZYZkVBckRCMy9xaU1kVXMrZ1R3?=
 =?utf-8?B?NU1wcjQrbk8vUGNxaUxib1djOFdEcmFDeFRvMUVnUXV3R2NlUGIzQktSRU1L?=
 =?utf-8?Q?dhkAgJhfpPBygBZqoh76RV/gP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcec7eec-f73d-4be8-105e-08db94b60892
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 06:42:55.3311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: edPSYE0WXOau9Pi9pg17ZrCBERaTdqwQ3IlMgkW6cepUBHfbX/Vc6OdI2ptyjhp0oGGRlzJB4exg9kio5qJCbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6788

On 04.08.2023 01:50, Stefano Stabellini wrote:
> On Thu, 3 Aug 2023, Jan Beulich wrote:
>> On 02.08.2023 16:38, Nicola Vetrini wrote:
>>> Rule 2.1 states: "A project shall not contain unreachable code".
>>>
>>> The functions
>>> - machine_halt
>>> - maybe_reboot
>>> - machine_restart
>>> are not supposed to return, hence the following break statement
>>> is marked as intentionally unreachable with the ASSERT_UNREACHABLE()
>>> macro to justify the violation of the rule.
>>
>> During the discussion it was mentioned that this won't help with
>> release builds, where right now ASSERT_UNREACHABLE() expands to
>> effectively nothing. You want to clarify here how release builds
>> are to be taken care of, as those are what eventual certification
>> will be run against.
> 
> Something along these lines:
> 
> ASSERT_UNREACHABLE(), not only is used in non-release builds to actually
> assert and detect errors, but it is also used as a marker to tag
> unreachable code. In release builds ASSERT_UNREACHABLE() doesn't resolve
> into an assert, but retains its role of a code marker.
> 
> Does it work?

Well, it states what is happening, but I'm not convinced it satisfies
rule 2.1. There's then still code there which isn't reachable, and
which a scanner will spot and report.

Jan

