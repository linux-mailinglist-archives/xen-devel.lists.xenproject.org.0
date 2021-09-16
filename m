Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF2C40DE72
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 17:47:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188602.337820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQtbs-00072l-Hg; Thu, 16 Sep 2021 15:47:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188602.337820; Thu, 16 Sep 2021 15:47:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQtbs-00070j-EU; Thu, 16 Sep 2021 15:47:36 +0000
Received: by outflank-mailman (input) for mailman id 188602;
 Thu, 16 Sep 2021 15:47:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2MkR=OG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQtbr-00070b-JZ
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 15:47:35 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74df0400-818b-4010-a7aa-886f30a48d57;
 Thu, 16 Sep 2021 15:47:34 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-3-3LExGeY_PzaXhva-uZ9fJw-1; Thu, 16 Sep 2021 17:47:32 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3934.eurprd04.prod.outlook.com (2603:10a6:803:1b::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Thu, 16 Sep
 2021 15:47:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 15:47:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P250CA0029.EURP250.PROD.OUTLOOK.COM (2603:10a6:102:57::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 15:47:29 +0000
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
X-Inumbo-ID: 74df0400-818b-4010-a7aa-886f30a48d57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631807253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ODLk6buZ5bRYNHDO5mkilEfQa+D2sDqx44UesSdg94=;
	b=QkC7+i+OQcniulVjZ8PI0ZSiGUrEqikur/7oCFRIIX7uF6xYuV0mJE+J8+RrQ6Ws23JgP+
	ootzaQ+II068V3y9/Iq+Q6kTBEdkxgYDsTvbTFz4cznhbHeFf/hy1XL2pwBk+Z3tWI1PFW
	MRCwVyQUjFXE1QheDf4MDClcWqX1DXk=
X-MC-Unique: 3LExGeY_PzaXhva-uZ9fJw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhBdAfDgxlYeQczniHLpSAKw1o9LTK5KPZTgl7r3Nfy8CGv/w6qCrdGvS0WOtP4ufnhbFoBkuVYRTL8yo3uzOH1OGBYHzYrxxeg7UeIzfURm3hOP5ZUm35SFFGD3trPqJtQ82RWaMWqTPvetS63Z02WzLzejPhYH+WkTnMhXhndNl5fSE03/kmwQlgvfB8YwwrEUSDFKB3PAVuEV9EE8b52fWCL0rKmBicHyJ1bhN1BIqfR/LaIgrJC5vGh+wpkFLCFwinnPolKVgq2UHiqmaBWJRdsuGy5NQTtl5SQWPLbWzLgdJedJbHaOrrBpg7gQaf4jRdIs1kwDP1WWmXW1lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=+ODLk6buZ5bRYNHDO5mkilEfQa+D2sDqx44UesSdg94=;
 b=nn/6/qAEQ271143Xq51MqZRxtT9Py2SZtSJipc216OjnMop26oo2+9XNlKXLA/nFqzK0Py3Tq2UPKJ9OhVUCSUrYHcmXU7x9sQU8vA3Zn6HZdaNVUCxkV1xzUxWmn2l+1UolxjeNF4HXpjATW3lcrnNYPZ1Rzu3DgKJLQrsq7Bv85N/Gn5T1ltVjuiD8MLco3kts94GfDu1yNmETp8q10y6b7kIwqQcfsf92qqqwFEa7FvRCYReB+8ZCte841wFNvI/C4D5wLdaQGTkdrkIGVWNXfjka8FuJg5YnulH9g+l5jwi7YpEk4OukgNw/fyKPYwRk98EjHOXp2q2AwpK0Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH V2 1/3] xen: Introduce "gpaddr_bits" field to
 XEN_SYSCTL_physinfo
To: Oleksandr <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 xen-devel@lists.xenproject.org
References: <1631297924-8658-1-git-send-email-olekstysh@gmail.com>
 <1631297924-8658-2-git-send-email-olekstysh@gmail.com>
 <03b1a1bd-2630-0ee7-b995-114632f527aa@suse.com>
 <6b1c715f-e71e-718e-3cde-b298a5a38807@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ebb05297-b9ae-c475-b2f2-4c06e986f99e@suse.com>
Date: Thu, 16 Sep 2021 17:47:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <6b1c715f-e71e-718e-3cde-b298a5a38807@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P250CA0029.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:102:57::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96b8fcb9-5045-425f-9966-08d979294af5
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3934:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB393480201CECF66BA87F6E37B3DC9@VI1PR0402MB3934.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D7IsiVTi03NSm1sKEs0fWo4rD6N7hMjzS6xq4qnjehckww0XGOk2aOGaJUg6TG6manNcDWaOogcNBguihzWL+TdQF3v87yyO2QRFJWeJc455Oy7cf1Pe3Lr/sca2mYFRsO5Y1FzsBLNX/4PlNJR705c3Q8xlsaTyJdy2ibndefJBlsva8CCFyPkC/690xpe4FoSOY8yIQCXkNx3U5jnqDOD05iJkvPFjrLBiG/fm6hXVTcyeSuKIMRkeiglGJBtRn4BuODwaDfTEf4Ynuk2/FhutoqVWMhgkwoHpRdP9xKa/dorPc4SgpGp/QHZt+x4TC2BxzrTyAnbosvcz6eEvl633DsvXBNG2EaArc4w8c/iX55R3sb+HPTAl/CjQncp2SOHqKQSoe2IAOi+XWMjpDVRPhgHZokD+QnOjQne1mLzzXQGQm2+1SdETox0CONH7/6b9OajjmI6kmNMeOBrjo7cSkXYOJoEjaVe3jGu54uBlNOc9CJS/CXqKCJ7oAy9ZVZ4HMGaCc2bS5JIF3pL8Q6mu1No0nCYCOwA0BNiHe6dMH3TpPrZdMDMR3Uv5B927zxgEUYzWkVy6tCflBzaGMiV0cYhoC89DxCVwzJmSgr9iEZS09MQ6ELZIPtqrwB91ctUfNPcCSyW/6IwZ+ZdpTiqD8KLcDFnIP0zzA5PvADWpc0piZeehBdDvld+A69KUVpJF3I4qXy+cs5wj4MZ8RTH4MOuFflTPv4jC3//xjZs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(136003)(376002)(39860400002)(346002)(86362001)(66946007)(7416002)(53546011)(66556008)(31696002)(66476007)(31686004)(316002)(16576012)(2616005)(8676002)(4326008)(478600001)(4744005)(186003)(5660300002)(26005)(38100700002)(956004)(36756003)(8936002)(2906002)(6916009)(54906003)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHVGR2Foa0JQVzl0M1U3Y1FkL1pRK1pRZWM2dnBDM3M3VHFwQU5JOHF4cFhz?=
 =?utf-8?B?TnluUldZNmRGK2h5ZkRuT291TEJVamsrd2xjTGJVMU9jckZHaTRHVDZ5djFq?=
 =?utf-8?B?eDM0RTBDTm5Fb2tZbDZzUkZYeHdBdGFVQnhZa2xQR3p2TFNNODNmeFEzZkR6?=
 =?utf-8?B?WnYwVmxIL290TzdaN0d6dCs4ZnJGQ0lxc1lYT1FUUFpJams2b2MrZGhKdjNP?=
 =?utf-8?B?NnAzbllKaGtPY0E0VTVuVnVnZW1RWG9ITWVzUUlkYzJmcFBGd09iS3Rkd0Fw?=
 =?utf-8?B?K2MyYkxuUmIydTVyWFJFcDNObmVzVGp3UCttVXJPZ1l0RmZydFZ3YVRodXZR?=
 =?utf-8?B?bUMrUnh2L3NHWFo5bDgxbnpuSFY2eThqeERGYkQ4eWsyODJvZTJ6NUR6OUpj?=
 =?utf-8?B?dXplTmpxU3ZPUDVZeVhWd2xFdmNzZUlXYkV5dVppczl6VTRlaTIzcXg4d0to?=
 =?utf-8?B?aWJoNVFTZVo4OWcwczVsV1FFVC9JY2xmalhKUjh0SFhCTDdhMnl5L2FGbENo?=
 =?utf-8?B?WVVNT3lhTXIrbTJpQ2VTVDM1dldtT29KZk1zRmZTYklLM21rc3dnMUQ1RUEw?=
 =?utf-8?B?RTdUQmFBVm1PQTBEWWtJOXB3QjkydGFQVkc0eDJyeXQ0bWliaTZxWWN6Rlhl?=
 =?utf-8?B?cTVSTFErTmpDY2VSY0MwVTJtK2FVbUZxRk5UcEcxMnFxQzFhTVRnbVhmT0RF?=
 =?utf-8?B?Y05kaDFNS3NSTjZlcllXUm1SUG1LaVFhdkRKRjNXZHJFWGVXT2JtczJoVFVX?=
 =?utf-8?B?WVZsR3NLUmdFUG0xY0F6RWphUEdnMnpPZVE0TFZzb3ArMVk4VDBsR2h2SkdK?=
 =?utf-8?B?eUIxb1lLVHlvSXVON0ZrMFVHNnI0cTlGOFk0d1FhV3dtRGNFZnBJbkF0Zlpl?=
 =?utf-8?B?Z00xeVM3WGoza1NCUWc3OXFUd0hiOTNLMW1FZDE3OVhRZXZ2cURlSUV6dkIz?=
 =?utf-8?B?QVNncXhwZDRkcDllTFlRVU5uRjNKYStPekRCNXNYenlaK3NocW9lNFRpVW84?=
 =?utf-8?B?bCtsd2ZyUStLK0lWQXJpem9UTEg2OFl0b0xzK0RuaUtzd1pKbEJnT0ZBK2lG?=
 =?utf-8?B?b1I5S3h6YURnZTdhRHBXNWtobE15enRrcmtwdEwvZDBSeEpiZTJIRHVHcU8r?=
 =?utf-8?B?RDczQWo0WlNBV1l2QWE2L01NT2grZmJWc2krdGFVRWx4VnpFWVlvUjhINHZC?=
 =?utf-8?B?VWNkSm9xQzNZMUxjSThXT3NqRjVBTzh4RmQrclpuT1JIdTBPc3RXRlFDUW93?=
 =?utf-8?B?dzJ3UW5taDA0UFN1L2pleWlORU9XRm43YlZHNzN3TnE1SGFUTXZNVGhPM1h3?=
 =?utf-8?B?YVBaUmhrWUVpNExXUzRWQ0xqVnE0RHlpWFVEWDJzUCtPRkRSZGpURFdycldZ?=
 =?utf-8?B?ZHRaR0cyUCtKVXNXSElqeTRoZmtsa1BsekZNNDRUZDBGWE91dnRwUWoyRFQy?=
 =?utf-8?B?aXdyQzRhYWJCR1hBY1lCUTFsUkpmeFVXQngxRENITEFKUklqTDJBUHBVd3Yz?=
 =?utf-8?B?akpwcWVlNHVUZmtyNkJONHJTWEh6Z0gxdXZ4QjgvNnQraFN5Qld0YkN5YUZQ?=
 =?utf-8?B?SW1rbDBCbG4xMmxFRFMwRHIrVUdiQUF1bHJXSHhrbXA0Ri9pWUYrbEEwTGdl?=
 =?utf-8?B?dnd3V01LNkJPamZ1MnBFWGZJaEthWjMxdGVHL3pUMm4rM2JXWGd0OGJ3UVBR?=
 =?utf-8?B?d091OUZINmxGSkhYRlo1MDR4eGU4bEg1NW9Hdk5YazF5anVHc2Mvc1NRMFRR?=
 =?utf-8?Q?NvaKDJ+IQ4WRm831HMM2WbSTdN6uvIWi1aYyq0w?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b8fcb9-5045-425f-9966-08d979294af5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 15:47:30.9044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SUEATkh5UDUC6xTba0rTxQmeSn4Xind+Nf3nWh9+AP0+jF+8FaOz6dH1NdxByUQKZtBlEh+qADfMEgLSM/QPQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3934

On 16.09.2021 17:43, Oleksandr wrote:
> On 16.09.21 17:49, Jan Beulich wrote:
>> On 10.09.2021 20:18, Oleksandr Tyshchenko wrote:
>>> @@ -120,6 +120,7 @@ struct xen_sysctl_physinfo {
>>>       uint64_aligned_t outstanding_pages;
>>>       uint64_aligned_t max_mfn; /* Largest possible MFN on this host */
>>>       uint32_t hw_cap[8];
>>> +    uint32_t gpaddr_bits;
>>>   };
>> Please make trailing padding explicit. I wonder whether this needs
>> to be a 32-bit field: I expect we would need a full new ABI by the
>> time we might reach 256 address bits. Otoh e.g. threads_per_core is
>> pretty certainly oversized as well ...
> 
> I take it, this is a suggestion to make the field uint8_t and add 
> uint8_t pad[7] after?

I view this as a viable option at least.

Jan


