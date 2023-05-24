Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5219A70F906
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 16:46:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539102.839650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1pko-0006ha-AY; Wed, 24 May 2023 14:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539102.839650; Wed, 24 May 2023 14:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1pko-0006el-6G; Wed, 24 May 2023 14:46:18 +0000
Received: by outflank-mailman (input) for mailman id 539102;
 Wed, 24 May 2023 14:46:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1pkm-0006ea-EV
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 14:46:16 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb89bd5e-fa41-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 16:46:14 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7731.eurprd04.prod.outlook.com (2603:10a6:20b:249::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Wed, 24 May
 2023 14:46:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Wed, 24 May 2023
 14:46:13 +0000
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
X-Inumbo-ID: bb89bd5e-fa41-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTKvqIc34rVLRxPtkz/6dcnWrAEY2BHEOUTV3B3IOGPiVhsi7PXRw6LmCJh3Kd4+pp8aKiYo/76pFrxoJ9BU0KdDO9JIEv9b114RNW7va7NiYYOeLmynr7NOsGliAn5b6pkvgRRx0JTiK5xf0wp8vr8iQfthOKsyyJM3q3wEI1VGvgr2yjeVQwwZ8ZuYzNvxmE9XsuISvRf594AwsvZBFwZlNi2676SjUzlpvdEzVdoB9L1fuBnANqju+I0IWg+GUTBWHcDuyF3V+mtmX5tCcbfgPMZ/QtyCYd/I2Lc/WAXyZfthxaiNGdFoJNm8tR4QELin5iOgxm7hVwgWvIPDZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKhIpjGFbTpCafpQ6OgOSTqaUpsjgeE9DjSPmiuRRIc=;
 b=J6G69r79zC4kpP3T/ZY4Rs9OSXqoJlgm57lRS0SOY2TJ7M9NIc6ahW1Nl7JWuWCDFWsptjV8x9aFjgN4bVZ7o1GGk8lVXG4eQGGldXjkaYa8XD3GyCwLEMOj9FidlR/D8VYh/35hxuEw38RBXumDV+zcfzNFGpG5aHd/eTBT430IO5cUjhBV5ffiE5Ee2FLxCRwUYHoExiGQrEhYtf+AjbIq7YkkvT6vJUlSc0n19x7fBJ/3R3PfDCQfwJCGjoplJkTfp+L7C15Z6thWAu8BSPlrcKFL6L8TIKWXgX4Shp6nIirx6hZwzHz2aSwyhCLqBse4SEBBgVYKb+yukQXjSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKhIpjGFbTpCafpQ6OgOSTqaUpsjgeE9DjSPmiuRRIc=;
 b=ND42XOid+LfogJJw5bqmuVoWbslP0ar0tQ4+Qfz26KjI89t34aJl+FHPY1pNX4NmmbVewY5Pi1XQ82ew49OutJSGQxRb2sU/fDOI8L2kO8ye0Udu54otCClU4c7b3QAqUltLtMe5rKNidpl9JsBT6Dj7iH6z5V/OfRKFwcCSnqcI+33Pdj23tJ2UZVtX866vjpx2j5VlTdOR47nqlCLCWabVc6yy/5DWkrb4p42ptkkTN56LTk6+uxbe5129ABPQaGK4dvKb78WF2XVQ3LxCJvcZgWMPwku4OwacxZSDRcmrp3c+OcNmDbw+31NjUhCuErUxwaXmuvPeUvTEJ++o+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c2df76b4-1a17-8383-d73b-7c7b7fb9ea3f@suse.com>
Date: Wed, 24 May 2023 16:46:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] x86/iommu: adjust type in arch_iommu_hwdom_init()
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20230524143050.17573-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230524143050.17573-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: 48d85244-4e90-439a-3bba-08db5c659eed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tDxcVFa+rSrqOMUrbJ3p2pFlGMmEGjZDUoYGuhDxjDpIF5Gba9eEzeOS7P6+ZT/G0pdGDyQcEfBVNFENUtqzLl/pThtDSsb8LZjtHx8Seo56aBbUs3pIkPt51lqderXaHLKW4nQ1SBq+edxqNLhQwX8L0yBxxYJdnSt5Jfr3q4I9FEq8pkZ3y1AqpeLnxd9oadzf2qko8pcTbKC6Gz26EuZh1lkBKnsdyPr3Au1zBPHfw0rsV8Uh9WEon3Cn2/uW5iY7PmPkGqQ5VnEtXCYgIs5JScQr+xZCHWD3/bM9k/XGk9Twi8RvqxArmirnojHSzPef7oBmjE4RbF/yPaSQdawHkB41fMzlSoW5YXg3vUt75gVjUUnbHquLcliWgWJdsh5eMvVRXf9ttGZv90TOZwGQNP8eZfCEVLeAWoe1p9fSZuH/H48KTaSMPHplmW8jG2lG1I6TgsDsXqvC/r/6DO29TaofNlCvl0pMotQe/pHBr4UodKz4GZIw06f5KX7V5NUhN4PnmlWLXkCCpGeNxer3WkUSegYND6skiW6CB6mnMpdkygOp5mfnd9/MeF7RPS/36ZOiwpkqBCUDica5w+wKlNteVtTZqxlTS8uHAwD6/YtDR9GTdvWn2MrNgK6e6sgtD6+OMa5JJDZ0EvCodw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(366004)(346002)(39860400002)(396003)(451199021)(2616005)(26005)(186003)(6506007)(6512007)(38100700002)(31686004)(478600001)(83380400001)(6486002)(53546011)(8676002)(8936002)(4326008)(6916009)(316002)(66946007)(66556008)(66476007)(5660300002)(4744005)(41300700001)(2906002)(86362001)(36756003)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHJoTVlYWDhQMFFYaHJNN3NVY2ZWZENabS82cEE0S3cyMWlLbjJGcHBOa2la?=
 =?utf-8?B?Q3pVMTJYVk5IYWpmWWRMWjJuT05tRU5yZVJZQmhvbm4wQmlHOXBIbzVpUTB5?=
 =?utf-8?B?NWRzcHAwYzZjdEhFbkJpaHN3bGhBNlVzTFNuL2hDcXB5MlRLUkFQNTRUOUpa?=
 =?utf-8?B?Q29meDlkZE45RXpQTithWGxpVmxQUko5TnU2SG51dS85S2FzbFRONWNFblpw?=
 =?utf-8?B?eFZJUEJLR21CTEZHNnQ5ZnljSWl2MnFPdUtzVnJmM2VIQ2JvbGZaTjJEK3Vy?=
 =?utf-8?B?ZFVtUzQ2aDZBdmxEdmE0TE96eDFJTlpZN1V3bGR4dS9GK2swTm1VWW9VRU1l?=
 =?utf-8?B?VjdOT1NCRXAweW1JUWRIU2ZqOG9KYVp5NWRhRmNZc0dQSW1USDRQdWllSzVl?=
 =?utf-8?B?K2RXSUd2MWFjRm9WLzduQnR4ZUVWbzVFbHVhL1FzanVCTGdUZlJwcUY2Kzgy?=
 =?utf-8?B?S1h3c08vdTVwc0RUbWQwazRzaWRnU2JnbjNTWUZyMmhpQ1MvdE0wWmxGbDVy?=
 =?utf-8?B?dXMza1VEb0VCWHpLaWJ5UER6b1Erc2oyWWZNYm00K0JtOHlEZy9TOVZCM1M2?=
 =?utf-8?B?enZmQ20yYk1BajRpS2Y2MzA3QVc3cjFsNTI0QlRJZFc1clFpdmNLeS9OQUpu?=
 =?utf-8?B?VjBoWHlSb2dTRVZSUmhmNStDN2FKVGs5LzFvdEk4ZVRYVEJ2QVdTRVpISUVj?=
 =?utf-8?B?eGhtb3lySnhKbHVoMUFMWWpWcG5KVU91UEdUREw5YmFvQURQdGxCTW9hMjdL?=
 =?utf-8?B?UW81NHl5SUNnR2F2cStZT2NldDBSbzZ6ZUV2QlkyVHlxTUZnSFhxdlo3Wmor?=
 =?utf-8?B?N0dYRmh3V3FodUZsRTJYQXpvdWZUMk54Zzc0M3libU9aSU84cnF6Z09rOXdh?=
 =?utf-8?B?R0lWSjhrOFZZQU9sYnNrMjVEdFZqaDBtNGY4ZUN4ZkdXRCs0aE12c2NJd0Ro?=
 =?utf-8?B?QjBLWm1MUUc0cStXaTNSalhEcDlUSUttQjBXMEZhOFhya3hUWitLWHFrMGhU?=
 =?utf-8?B?WDZNYXoycS9lTE9VZSs3SGExT2UrbUlaWUhNek9CYURsdmpxdmtpR1hSeW1Z?=
 =?utf-8?B?VkQwV0JuMk5pY2hnZmZYUFQwa244blluTi9RQ1ZiVWFZdm1MRmNVUUUrQmpL?=
 =?utf-8?B?bkxnM282b1lLSTFpRGl1aWMxK2tQNXhwb0xuM1pyRHJPc2lMVGJqL3k5bFVH?=
 =?utf-8?B?MUZBRWV2ZGRCU0NtOXZMdEh6RDcyZFF2ZlVLT1B2bmpLandYNVUrandsY0VE?=
 =?utf-8?B?VktDUmZTbjNiZGh1ZHJOd2N1UUhxYmNDckhzSlc1VzBWSUJxV2RIb2RJVVFM?=
 =?utf-8?B?QnFGdzNBQVFRWCtCTWI1U3dTbWFBOS94T2d3Z1Q0OTNVL0xwNm1rc3N1Tk5h?=
 =?utf-8?B?VlYrUnp4cDNUdXYzcjVtejROelZkVC9jU0pwZ0FTUmdlZDlJTGh5YkxTTE5Y?=
 =?utf-8?B?bWMvUzJmbTJBY1ptUzBFZ2lpMU9WY09KZ3Nkdzg2bmFxb3NGTUw4T2FvVEJX?=
 =?utf-8?B?bkdiMjY3L0RKTzFxTXkyS2hhMkVPYzFYQXo4NzcvWkg4YWU3M3hVLzhyMnRP?=
 =?utf-8?B?dHh0azhCTGROakx0R0xkeGI5aFBXUzNua3VpMDZCV29XZzRrRGVLOVo4SUV6?=
 =?utf-8?B?aGwvVi80SllkTEl2bHFFeS8yVlVaZ1Mva3h3eWlvczhaZnppb3cwakNKYnJU?=
 =?utf-8?B?b2swbnNPN1VIYVAyKzErQ3F1M2VvSS9hVUswL09LR05VK24vWDNFcXR4bndY?=
 =?utf-8?B?ZnZvWHp4OUVKdHlVZCtTNG85Q0xkMUF0czNOTmdnNXNaVXhQYzFTc0E5bGtY?=
 =?utf-8?B?VVVJQ0lPRm5OL0c5dHovWHdiNjVkNFYrWXRwRGlkZHNtdmRURDhpMXJuMU1C?=
 =?utf-8?B?d290b2J6cHhTUCtLUGZxWDM1Q2lmVnVnLzg3Z0lqUURCREQ5cmZKK1dxMCtp?=
 =?utf-8?B?STNQZW5mc2ZWZXNudlozUG5VOXc0SndTVzlCRVJjb1QwV3V1WTRHWVlPSHJI?=
 =?utf-8?B?OGZTaGlOQmQwRGZSZDdNNXpmSjk0SGhRU3NaZExNMVBISlFUdXFVS1YwWjhM?=
 =?utf-8?B?YmNqK216OFVVWkRwTUx5VUNjRlB3TitFTzZMZ0gxc284T2IraC9rY1ZDUUNs?=
 =?utf-8?Q?nyNP25eI1fgQhDl9yxtYg03ev?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48d85244-4e90-439a-3bba-08db5c659eed
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 14:46:13.2772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJTcHnciEzFLdOxHk9wvm0hu0oUqGnQi6ptedpN+GR+zteyXxpFmt5unljgimEYdN1YzZUxiL/W0sDW/JtaX+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7731

On 24.05.2023 16:30, Roger Pau Monne wrote:
> The 'i' iterator index stores a PDX, not a PFN, and hence the initial
> assignation of start (which stores a PFN) needs a conversion from PFN
> to PDX.
> 
> This is harmless currently, as the PDX compression skips the bottom
> MAX_ORDER bits which cover the low 1MB, but still do the conversion
> from PDX to PFN for type correctness.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



