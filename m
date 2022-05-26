Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0A5534C9F
	for <lists+xen-devel@lfdr.de>; Thu, 26 May 2022 11:40:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337506.562113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nu9yW-0008Qh-3q; Thu, 26 May 2022 09:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337506.562113; Thu, 26 May 2022 09:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nu9yW-0008OM-0G; Thu, 26 May 2022 09:40:12 +0000
Received: by outflank-mailman (input) for mailman id 337506;
 Thu, 26 May 2022 09:40:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jalH=WC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nu9yV-0008OC-0J
 for xen-devel@lists.xenproject.org; Thu, 26 May 2022 09:40:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d560deff-dcd7-11ec-bd2c-47488cf2e6aa;
 Thu, 26 May 2022 11:40:10 +0200 (CEST)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2172.outbound.protection.outlook.com [104.47.51.172]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-UmvOOUKVPrGYAsMC7KhIig-2; Thu, 26 May 2022 11:40:08 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7703.eurprd04.prod.outlook.com (2603:10a6:20b:23c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 26 May
 2022 09:40:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Thu, 26 May 2022
 09:40:07 +0000
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
X-Inumbo-ID: d560deff-dcd7-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653558009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W61iktpzTnKmgSm6nbbdsEvacfyQfreBrED76hKaPIQ=;
	b=au6LowMFNxrIHBlsWumxvR7ruh+PfFXVzY9vjjP3Lyrh+2gj7rq4MmyvbipHzbI2Xpu7rQ
	5I9vbmjfw0SCw8bftYh4dWQzNkCS3G+m5M6upYljgozzWo/cyxjEvbv9r1/EMOb/JiCOsj
	EGX9jBYxJIL8SkxdTc5Gl5kG1MMtfZw=
X-MC-Unique: UmvOOUKVPrGYAsMC7KhIig-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+2zil9uEW4JN0btdLIbMXpdG1f4L9l0E2rBjW14uYTm6BhM4YmxpBHjHQbp5AzmKbemNUgNFtMynLYCtbjkDW5FLnLDA4ldsoXpH4gvS1uGJBXGYnIZrqx9I1zHBg826YJPN5C79EGGh8FtJQTG6OFo5d94E7FsPKw6SiCR0oR85Zmop75dI2f3FUJtZuZXrga4LnB70wJLtuGuSpnOoE2QBQhg0e5xBZpsVIt1Zyx4iUQyPq6bCZng/pARNqhA5EljyDn4PP5UD6ZV/IHmj7pIlm9bNHbJVveIK0I0uNjNgXOBgRE+hYZ/O6c3/Ysh/dWrHZAtBU4xQGPlB8qqGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W61iktpzTnKmgSm6nbbdsEvacfyQfreBrED76hKaPIQ=;
 b=DKEKM2S1dOu20JEj8KXOhRABxBnefKV6nZi7D4ZnIjciKDVHDgzGJgRsk4OFTP+O6aEQw2tenmo2PL6LEqqSPRax0F822Ai/Ausa7pUzdIZswWIzig6MP/cBq6baMVO8y1MqGdIx/SW27aB1dujUd72Z6SiiVJSZ021tymUtnb6lZIqFtnAHGXhoUj6KGYj6zx0yo8jhjKyhBRVNQOQbLwg0VhosyBKMA9Pl1uQp4Ngi37XeFLG1c4vPfWr17ZK+TZl19X9rYhUObWi1NawQhUV2U4ctXQconrcJ0N/E4UsEAstPgcAHxZuzpxEYAo3BCtD6zAqI+nbZWBXe+xWj5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <39c930ba-f5b4-14a4-ec48-19dba9a21509@suse.com>
Date: Thu, 26 May 2022 11:40:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/2] docs/misra: add Rule 5.1
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, julien@xen.org,
 Bertrand.Marquis@arm.com, George.Dunlap@citrix.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop>
 <20220525003505.304617-2-sstabellini@kernel.org>
 <6604372a-67a1-6ad2-bbcf-d6b4337a4bf0@suse.com>
 <alpine.DEB.2.22.394.2205251813290.1905099@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2205251813290.1905099@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0017.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60b2d460-d7e4-4eae-ecf0-08da3efbb80c
X-MS-TrafficTypeDiagnostic: AS8PR04MB7703:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB7703B52736EFCDDA0774F1F1B3D99@AS8PR04MB7703.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lxOsrg3dLoUX336/iJrlB651SIZ0i7q0zXB7R4TcbB+CJPqRphEDnxrA4JS5VPz9MI6RbwSu8KLCM3Xbq1UQuU/wImB6D08g/Hk/rXq4ZLY14u3CvmBoyja4cOAzuSsqWBCEctX1mt4z4CrB7jPosmVXmXdP/L7DJZ1xsfltlVM8qoTUYuOrMbn3xIq6dWnLAVecnx4gT6UexKJcJzWK0RJcHerYaYmDbJ9QfKeUVXSY7X/zOeLRx/GYjhW2K5+18aZYVr8CbwaHljVDgG8uH8oiJIINLYasVqi+sQD9DLCidzg28GJ+sVHJ8syArMZBvx86F41RSzt8kCbDVjouhOplnnPouEVsAgNgxGmWR9dwcu9EHKwAHuSZh59+i2Mt1RQ2eMVB/sVb0EAcm+opHVzZL8uqU9zUTqCJmb9NGjl6310reg943XXqvKMKKSmj3LgD8wueoRpAvSDJ/JkUNDrqfvoeRbd2/s9yE4keutYbSssUgfHffPBO/G82gNRHxp0v21/ssCpsZErAOQClvOqOovET8FvXzLzfB+n//enxO99veHXoD7tu48tJkLOIVGZKMGrTq4tVrck3QDGrrXNETfGGho1Q2vnYwtlnfcJyAmm/OgzGKM1qXeSnKKjeESbojd92jAXgRnzprP40syAHj1ODb0tTSaAQFGJS2B482gFimV3TGc13oOPEh5EHSGzT1VhfpN5v4eBpdX1QU9BR4f5LL1FjhDynS7bYpMI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(6486002)(86362001)(8676002)(4326008)(66476007)(66946007)(66556008)(6512007)(6916009)(316002)(83380400001)(186003)(5660300002)(2906002)(53546011)(2616005)(38100700002)(8936002)(31696002)(6506007)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mms4enlqNmluMG0yTzgvZHBjMk1IU0g4VE1oaXlWa0trYmtqTmZ1OTJmK0sx?=
 =?utf-8?B?bXpVYU1MWkdEblhMWXgrUFo5c0xMUVNwSWhhZ1F6UHBmcWx1am5WQmEwMGU1?=
 =?utf-8?B?aXRwTU5iZktyMXU5OWNyVjN1aDRIaDR2ZDZYOVFTOWYwNTRYOGMxK09QOFNL?=
 =?utf-8?B?UnpqRW9ZVWUzNytnMXlZemg2WEc5L2grayt4SVRRaTRPamRaQWFSdDhIY3NI?=
 =?utf-8?B?WGd1U3lneTFlaldORzc1bC80NkNrQ2h4SEFqSUt5dFZUbXBzeXllNDdFVVor?=
 =?utf-8?B?YjJGaXZtZmYxbC9PZlVvMlZFODFxTWJtMkJOcEVpU3NYMDliSTBka1NlejhW?=
 =?utf-8?B?OXJYY2p6ZTZpdXJjZFdoVjQrRXdRckhMMWFXcTZCOENjK295ckY4ekh4eWRW?=
 =?utf-8?B?L0c1N2xiY210QjVwSDkxS1l2Rlp3S3krcmx5bGhSdXlneWx1eWdCaFZvVWxK?=
 =?utf-8?B?TnFaYjBxdlRSSlc2VzhxZnRxVWYxcHVwSmFkNVZkUkpDQUNvL3JrRUw3T0FN?=
 =?utf-8?B?VXRXU3RmSmZoZ1NRaVNZd1pEaXR1SVpmWmZZc0ZDWHlCbjRHbkhERHIzalZp?=
 =?utf-8?B?eTZzbzAyWU1DQXlSZmIyVXN4a09EaEpQWU5BVW9RYnZVSDBUWjA4Zml0cDl4?=
 =?utf-8?B?Sy95WVpvSlovMms4d0FXa0FPZHNHNzd5d3RZZkwvSWxqa1lXcDQ3dTJrTGFv?=
 =?utf-8?B?R2hYMXNzK3lLditaYzBrM2VUN0ZWOWtkanRvcUdBaXNHV2tTbXpJNDN5c2I0?=
 =?utf-8?B?ajNxZk1DeVk5aTdwSENQaWZJRFNUbW9QZUlTbFYxekc1TDRRTkl4eU01a1or?=
 =?utf-8?B?TE9IQU9zcm9HY29nelcwWmluVnNTUlQ2QmZGWEtacXJzK2t1THJUMjNSMGRD?=
 =?utf-8?B?TTc2eUZHQ1VOTmVLMGk4UFVYdzlURlhGekI3U2NhZWlpRGIzV3ZjY1IwR0c2?=
 =?utf-8?B?cnVnUjNSOEd6ZVo0N3BVd0pTMExabWtMWm1FTVNjWi90Qmpnam4zS2ljdTZ6?=
 =?utf-8?B?bElIUFNWbklHb0llYjFqWitBLzdVUkdLRzVNdDdOR0hJeDNXaVRSSFFFYlB0?=
 =?utf-8?B?RVQxKzk0WWxpMWZwVllsQzlvanllS293YStFRG1Da05iZWtWQzk0c2VDVmtM?=
 =?utf-8?B?WXR5K05mQ1Q2T1lNU0RPaTd5VGZ2NjBzcE1JbjdtMDVIaVl6bjkxR01MZDF0?=
 =?utf-8?B?LytpVm45S2NpZ1FMVjJubENabEU1OGpUcmkyQW52dDB3YWoycFZtOXkrV1FH?=
 =?utf-8?B?cjVnYVo1NVRZNHlVRXY4L0JHVDBsZ21EVm9TTUtxNHBHUEkrNGphbEV0d3ha?=
 =?utf-8?B?SkE1UFF0ZjZQUlBHN24rRmpsQTFnd0U0REJ2di9BejF1dTZkbHpEbXVudkF6?=
 =?utf-8?B?Wk1xQ2FoUlcyVXMvcXlleFNOR0l6TTVnSmVEKzUxUktGZXN0T0xSVzhCRHFX?=
 =?utf-8?B?NWlKZ3NNeTgxZlVpTUx3eTZVbnd5Y0ZaMWdDN2FjODZKWVFWNmd6NFZNQ3hy?=
 =?utf-8?B?c1ZTSFl3Q3A3VzJobWVRdTFuQWlBajN6b0llZWkyYitsWnN4OUx1c0EwU0pk?=
 =?utf-8?B?ckhCUVg0SWpCQUhPaUVZZEppWVJ1dHk0R0pkUHhId29TYlJRTW1SYk9pOUE2?=
 =?utf-8?B?U21MZE1BaVY2ZXVBSWVqL25XdVVBVGtvenYwaEJ3eVRLdXZCVG5KR2lwZ0Rs?=
 =?utf-8?B?WkNvWW9QaW9pMUEwUk1sMFcvcGhIVEtSN01SZVhRT0s5M1NPOGtDSDQxQXJ0?=
 =?utf-8?B?Yld3b3JRTElqb3JVVERiTHhtano2R2l0U1hVVytYOFBEVk4xektRVEgwLzJv?=
 =?utf-8?B?QmMwblY2V1RKTERmam1neGh1UVZEdHd2ZEw0aEJGTTk1cGtFaHFuVjhubXFL?=
 =?utf-8?B?ODUxbnBIZjBKRzlyQ0FwMHNhNUxWUG9MbHN5WW1hU2NVVTRxZWxFUFdmRVRm?=
 =?utf-8?B?Vy9EK1VNbjQrNXhSSHY1N0xMODVsUW9aakJRUlRIZ1FvQnBRYisveWw4VWNy?=
 =?utf-8?B?dTZmeDR1MGNoQVlBcTJ3Q01OckhWd2VLZWYya1NLQ2cwWkJTYUo5MmR4Nkc0?=
 =?utf-8?B?eklZY2xRYlJjQTFIajdKU3AzbXQ3V2hQMkN4WGdTN3ZvbmExSUM0cnNsYThO?=
 =?utf-8?B?SWhDU3VIcU5NMU1jeEpzV0pRaWZUVHFHc09LR1FYUWxia2JvNnRtOXJmUit2?=
 =?utf-8?B?R2lmd3lhcXRuRDNibkdMSExKeklwZkZiUGRRcFByZlNMMldRT3FiaGNndS9P?=
 =?utf-8?B?ZlYwZFByNDJPckhwSXBjdVhZWTdXamxSMzBKK3NrQjJSQnVLTkRzamN0TGhu?=
 =?utf-8?B?NllKU2Z3YWNjNlBXOG56WXFBOXQvNnNuOTR5L3BXOEErZUh0NGR0OW8ySHlz?=
 =?utf-8?Q?B6DCF/aZKphUE4N+7ieXAOBp+SI2qsh4ujpi0RGlzEkts?=
X-MS-Exchange-AntiSpam-MessageData-1: PA1rdajFYQZnEA==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b2d460-d7e4-4eae-ecf0-08da3efbb80c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 09:40:07.3164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GmE88wGmv7Lap+Pb1wOZ+Azc11eU8etk0443AyY1lJpfXdJWhKaYpR0SR+XAXPWensFl4236B57tHXy0ii4+HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7703

On 26.05.2022 03:18, Stefano Stabellini wrote:
> On Wed, 25 May 2022, Jan Beulich wrote:
>> On 25.05.2022 02:35, Stefano Stabellini wrote:
>>> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>>
>>> Add Rule 5.1, with the additional note that the character limit for Xen
>>> is 63 characters.
>>>
>>> The max length identifiers found by ECLAIR are:
>>>
>>> __mitigate_spectre_bhb_clear_insn_start
>>> domain_pause_by_systemcontroller_nosync
>>>
>>> Both of them are 40 characters long. A limit of 63 characters work for
>>> the existing code.
>>
>> I have to admit that it hasn't become clear to me why we want to
>> permit (if not to say encourage) the use of such long identifiers.
>> If 40 is the longest we've got, why not limit it to 40 for now
>> with a goal of further reducing? A 40-char symbol plus some
>> indentation will already pose problems with 80-char line length.
>  
> We can go lower than 63 if we want to. I chose the closest power-of-two
> length -1 for the NUL terminator. But it doesn't have to be a
> power-of-two. So we could go with "41" if we want to.
> 
> Anyone in favor of that? I am happy with any number between 41 and 63.

Why 41, not 40? 41 seems yet more arbitrary to me than e.g. 40.

>> Otoh, as said on the call, I think the public headers want
>> mentioning explicitly here in some way. Part of them (most or all
>> of what's under io/) aren't used when building Xen, so won't be
>> seen by Eclair (aiui). Yet they are a formal part of the code
>> base, and e.g. ring.h has some pretty long names (albeit still
>> below 40 chars as it looks). So once we're able to go down to e.g.
>> 32 for the bulk of the code base, public headers should imo still
>> be explicitly allowed to use longer identifiers.
> 
> Actually I thought about writing something for the public header but I
> wasn't sure what to write. What about:
> 
> - Note: the Xen characters limit for identifiers is 41. Public headers
>   (xen/include/public/) are allowed to retain longer identifiers for
>   backward compatibility.

Fine with me, except I wonder in how far going forward we actually
need to play by that limit there. Proper name-spacing is particularly
important in the public headers, so may warrant a higher limit for
certain (unusual?) circumstances.

Jan


