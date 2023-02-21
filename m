Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4C269DB93
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 08:58:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498547.769417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUNXC-0008Bz-N3; Tue, 21 Feb 2023 07:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498547.769417; Tue, 21 Feb 2023 07:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUNXC-000891-Jd; Tue, 21 Feb 2023 07:57:58 +0000
Received: by outflank-mailman (input) for mailman id 498547;
 Tue, 21 Feb 2023 07:57:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUNXB-00088v-0o
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 07:57:57 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 724f6b9f-b1bd-11ed-93b5-47a8fe42b414;
 Tue, 21 Feb 2023 08:57:54 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8583.eurprd04.prod.outlook.com (2603:10a6:10:2da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 07:57:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 07:57:52 +0000
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
X-Inumbo-ID: 724f6b9f-b1bd-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elDEMYtweG2Y6E4x7W51/0o+YsHF92GXa9hQ0xo5Yc632Ck9vUJ5l7WJFh5X7e5ibDCRQKoUkIGJVhJYM/T560nuvXXFZjZx3eBxMaE5k/eWebqRBAXKGsE5H5T3zxwYdGRlwrHUdfojb6MU9BrO6sM3H/hoRqbpbgvYjrKDBfCKjlmlQRVuwB91ACVqZx7Hp2rWmDYuSwlHeFVAXBsVDEHD1o/L3pgD+YZgPnNDihdaKqdsN1q9Pujo1vnmuo8m5MlksmLrmaxvwDBRb7j+Zl9YjZ7r3xQJUv2M40nE8ok+VXWZIp+dw4O1I8zchEfwCCpe33EIaUjviD727NxHeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjDnJ4XLe5+/l/qcuZDVurmHSwIiuTvS1d+zludeCt0=;
 b=EVxch5FLOLRHQhslSIpKKTWysgN2wsJ5mRlREA0B+AvJGwGnB4Czx6SrieItcxORj1rCF6GFwb2tNoerlNf+mcKzRV8eNAwcQRfXuEQvrzjw5/OxesBE2OygHvi2YTwKLPP2VC+nyc/4kQmnNs87HJhjxcFOhALF8WozfJZHSK+IvLjHVmCUVOIzhuCO7ly1i/pZJELBvHED3OAt9OeeMDhGiKxsX+8mBeWqYRYTM/UhnoUkjnQHLbFzp/TTrmMQENVYBQ4UjDp+FFGZ0BccRcZ7Pl+lk7G5vrPR01vssANY3DmX4k7CCeWqODnDLMdLYz4lmsSMQOEZ8FnmmlzQYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjDnJ4XLe5+/l/qcuZDVurmHSwIiuTvS1d+zludeCt0=;
 b=i6vM6UGD/Nqxs/uzdK2h2IW7EZ5ifQ+LtkIeYZlGbYYxkVon9tlg3aH8U7oBE3rFDi9cjYg8DZqT+uahkyyRaKiFR/vKnzxMuyT3op0yMX83zRtCPGNCJzGX1cIKdTDEEtJtCu5a9cY2/gD3xgdWVqrjCNpP4PzWh0yUFwR8wP8gE6x5ndjOusyrwt3r6oicmgthfoSkdX2uMETUSJ3mq82ektfZbkfhtflhkcVaMdlGBXV8ymWaM5owiqVkUlW/4Yge7Ca0X9ima2X3Q8vk3F1wiPHHQ64eWoE9nb64b9iO2PHRbhGuOeuAfAg69Edn0MXa7fH/nl0SOCppXewm+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <764e4fe6-b4b2-551e-dec7-8307eb94630d@suse.com>
Date: Tue, 21 Feb 2023 08:57:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/6] xen/x86: Use SPDX (take 1)
To: Julien Grall <julien@xen.org>
Cc: demi@invisiblethingslab.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230209230020.52695-1-julien@xen.org>
 <34dd6673-a8b2-977c-adfd-928418cb5435@suse.com>
 <8e2d3064-c7c3-4a3c-2f11-a04a68662447@xen.org>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8e2d3064-c7c3-4a3c-2f11-a04a68662447@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8583:EE_
X-MS-Office365-Filtering-Correlation-Id: b4af3fd5-2ccc-4339-9b68-08db13e15512
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KD5Y5o0QH7tetH+aIaxq6fXkEX/nJGm2iZFwGHg9H75vxjkdj40WZIT0oBAveg41oObtzuPcgfF0cXmH1s+1POHmg251e1V5ezLcTKaS4mUnX/UuWgr1nfeE1pfkm13dfbsHqFM5bLZDegbDK+X8B+Zi95IlKhhuh5l/DrAhzeotHI37rPBnQlK08yOYX6NUJb0NEOEzt/meW2PEHP1xFjbKjid8rVFNjaOwYch2ukJAx38EAlhEk9IRVUYjR0QB2Bpp6iYlg/eL+4uMJaYp4uvGIR4MaynKGQtiHVEs8yIFO9XJ6qodh3/cSokR+ufYTuyEkzJfctlnnQfrOMDqOf5/Y6+kQYi9+d6WRHwxnQFObkg1VeSoUfeGQbwzi0Ycr3gNozp0zpyljZY0MUDS59YEb1DEBP3CuPaGGgqxHxPITsLmqNO65363cdmxD9IXZOmbS9RI05qVwbSHcl0NDoNnU4uAyrzX/yucdOr6IvE0/hO/P6f7bN8n4C7h7A0Dash6mjv+nbWLscEiOLfgemgcsBcAyWur5v4MAzTHc3ptFqUhVF0NjlQxDcVsJlLbTPxd2MQvGZp9Ul+rIadJo+kPhN9b6zjiyhF3W12qy9mUpQw61mIPf9GOzwcCT5+8n2u4u8CEAsXCoy+BkU+OZQKJq8lXbxBddPtyzxFK8vPx5H9wh9B5wg7ScLHfXTllanv5GkOLN0HGT/NVWJ77i6AanCdD4HTjpAk90j1HI2k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(396003)(346002)(39860400002)(366004)(376002)(451199018)(38100700002)(36756003)(31696002)(86362001)(2906002)(8936002)(41300700001)(5660300002)(7416002)(53546011)(186003)(26005)(6512007)(6506007)(2616005)(4326008)(316002)(6916009)(66476007)(66946007)(66556008)(6486002)(54906003)(8676002)(478600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TU4vT2U3aCtaVUx5M0ljamFtNXVkZE5MSUlmZ1FiZnhJWjZ0VHQ2ODFsclFy?=
 =?utf-8?B?TTRzZmVvWkpsSVdSQk5VejhheGpQaWVaVEJMWDFEZjRVeFZ4ZWxIUlRpaXBn?=
 =?utf-8?B?T2l6TkhONkd1RGIzbkVGTWJTK3lFQkhtRnQ1SkxzRklCYXFrOVRsNE9NMlk0?=
 =?utf-8?B?K1U3YmErT0FDS0l1K2xpTVJ1VzBUNm1oTi9PbWhYWjFhSm5JYVRidnRDWXBI?=
 =?utf-8?B?SllCZ3k2VFhnNVJTOTJCcldycko0S2xxRG5wZGRHaWdHVGJVR1RTSHJkSnJm?=
 =?utf-8?B?cWFyRkxQYlFkRHQ0SzVjaHdGcktwVmIvbUpNejl2VmNqQ1VCYXloaTRTSENZ?=
 =?utf-8?B?eGZKcVpMTlpNRC90VktQSFdCVnFrd2Y1cGh6dGozUTFxY1BCaTV1dnBFUktO?=
 =?utf-8?B?SHRIVm9RcllwVXlNYjBtOVZPM3V5Ymo4MTJUcGR3akdqdWhnSjhxUlIvY25N?=
 =?utf-8?B?VXl0TDM3b0ZTODFJVTZqZVdzUzViN3Jhc0t1ZXlEVWdEL0RjRG5WckVNcDlP?=
 =?utf-8?B?aStzL2IyZDVFUXV3RlI0TjJxV3crbVArSC9LWEhUc2N1dW1QOWRZWkhUdURT?=
 =?utf-8?B?VnNKR1JJRjdBQjlKQlhrTHhTY3pkTmlaUFZFUHZCWXkyS2pGT0NmT2hDd2t4?=
 =?utf-8?B?ZlNLeGRqNlN1dGo4andSb0lpOWFSTVN5bWlnTzZ0RUg3NjJncm1xU3VnTHNY?=
 =?utf-8?B?Z00vQVJRWVZ1NlNzdEY3c2YrUllZdFBRMGJ1SlFuMFdGVlNLNDRUWFRCZ1JH?=
 =?utf-8?B?OXY4SllUL0tHZFhxbTF5MHFUOGZRSnU2TjhZTG1JbW96bm81K01mOWFtTVlr?=
 =?utf-8?B?akdPYWN3czFzVFFieklpeXRLakpFMXFHZFNEVXBkUHJVV050ZUtqS0owK2Ux?=
 =?utf-8?B?L3VNOW5xQ1lYVjQwWFpQOHNZYmZlSHNtY0dyVzl2MFNxNlhkQjRPSVgxejNV?=
 =?utf-8?B?endIK3ZlVzJ4ZnNEeG5KQnFIUlY2RXZqWSs4aVVBenRlWGVraEl6bmxlT0hQ?=
 =?utf-8?B?MWtkWDRFYWRiSlA2R2dLT3ZjRVFSaFR1dDdrOWsvM0cxckszTW96WUY2Vktz?=
 =?utf-8?B?Z0JKMk1QRTdIRTJKOU8zbXpkODN3ODR2bkhoTW5uaXd0cTBzbHd2SEl1ZGhz?=
 =?utf-8?B?Z2VHQXR0dlU3aHpPWXdLVzI2M2U1T2k0UzNSbExETlNoYzMwckdiQVVkN0cz?=
 =?utf-8?B?N2E3VmRER0hYc2QzL3JrTHRRVkx2VHE1Wkw1a2dwMEtCV0lwQXE4U3FBczZY?=
 =?utf-8?B?bm5sZDBJNzRQTjhsdDliL2tHVG56TkRwRzNSanEvVU00Ui96WEVwOWpDNzNw?=
 =?utf-8?B?dTdGNjVWNE1oTzM3Y0VCMkpxNzRmUTBNUnFGYWZRVEJGT0dYWi8zd2RhaVNx?=
 =?utf-8?B?amM0RkhIMUt0R2hXd1AweTJXSnp6aWxPQVh4NHBLbm4wYUtxNTVEcFB3bWV2?=
 =?utf-8?B?Z0Z4V2JSdVRDeTJaSTRHaVFyTGNFTGM5UnZsbzFaaGRKOFVsYktKTEJ3dDZl?=
 =?utf-8?B?ZUNyeW4zYlNKNUhXT2RmNVVCSWZYUEJqS3JHbk9EUFFnWFlZRUhSNUlLV0JX?=
 =?utf-8?B?S2V6M0M5NXdtQTVMeTZTT2xpR3c3Mm12TFJha2ZBUVRGUzRuZmJIQVU2ZDFY?=
 =?utf-8?B?d3J3NnBvVjlRd1pOa2JuVlpPYkMydXM2U2FXalNEQkltb0orVUFjK0NZTkwv?=
 =?utf-8?B?U3ZZS1VTSUJVK0MvSUo3U3FjUXp1bmpHTDkwQjNRK25wMGVjdXlHTmtBdXFF?=
 =?utf-8?B?Z3dudFNXWEJNcnRoVWNHb1lsWUlUSWFXMXdZK3pSQW92a0VpOFFRbCtQaFJv?=
 =?utf-8?B?cm1aRkdxSGt3Q3V5MU9rZG1HK2p2eUFxdlgrNlg4TFJKR3NUb2VLcXdyODFV?=
 =?utf-8?B?UGRQZjhHc1JsNjBidnljUGs2Mllaa2dCNlY3VnhTVFRMZkZwMHVJZXBZaFU1?=
 =?utf-8?B?TG1tK3ZCMXYzZzJCTTJOclNQMUNEQXdmNi9tK3pucjJCaC9rWjFBaGYzeUkz?=
 =?utf-8?B?TlN6eWVYbWNWWURRTDlQRmdhaWxVZjhlQ1IxVHZMMjJaUGVtN05hait3T1dZ?=
 =?utf-8?B?MytkRlFiSzYvV1lUMzVhY3YxNkthbkJCWDJTVmNSbUxiY2N1YlNkdGZBc3Fo?=
 =?utf-8?Q?C49G9TaqNneG1uhH2Xnem1sC8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4af3fd5-2ccc-4339-9b68-08db13e15512
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 07:57:52.1721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CuPuZCn2cuMbSITah12YFwrN35Fc3acE0kU6gC2hBq+DwG+A1SjPLtNHdO+I4cR3LHAMcBdebM3BetTwOfIuuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8583

On 19.02.2023 19:41, Julien Grall wrote:
> On 13/02/2023 09:27, Jan Beulich wrote:
>> On 10.02.2023 00:00, Julien Grall wrote:
>>> Julien Grall (6):
>>>    xen/x86: Replace GPL v2.0 copyright with an SPDX tag in *.c
>>>    xen/x86: Replace GPL v2.0 copyright with an SPDX tag in *.c (part 2)
>>>    xen/x86: Replace GPL v2.0 copyright with an SPDX tag in *.h
>>>    xen/x86: Replace GPL v2.0 copyright with an SPDX tag in *.h (part 2)
>>>    xen/x86: Replace GPL v2.0 copyright with an SPDX tag in *.c (part 3)
>>>    xen/x86: Replace GPL v2.0 copyright with an SPDX tag in *.h (part 3)
>>
>> With the one further adjustment you did spot yourself:
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks! The series is mostly mechanical change. So I am not sure whether 
> I should wait for all the maintainers to ack before committing (it has 
> been already a week).
> 
> Any thoughts?

While personally I tend to ping and hence push for a complete set of acks
even on largely mechanical changes, I think the series here is yet more
mechanical and hence okay to be committed at about any time even when
taking the rules pretty strictly. Plus there hadn't been any controversy
afair on the subject of conversion to SPDX.

Jan

