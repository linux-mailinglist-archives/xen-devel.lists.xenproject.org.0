Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C3776B49F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 14:21:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574121.899304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQoMq-0007gq-5z; Tue, 01 Aug 2023 12:20:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574121.899304; Tue, 01 Aug 2023 12:20:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQoMq-0007eu-3D; Tue, 01 Aug 2023 12:20:48 +0000
Received: by outflank-mailman (input) for mailman id 574121;
 Tue, 01 Aug 2023 12:20:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OOcM=DS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQoMo-0007eo-V8
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 12:20:47 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6805a69-3065-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 14:20:44 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7695.eurprd04.prod.outlook.com (2603:10a6:102:e3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 12:20:43 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Tue, 1 Aug 2023
 12:20:42 +0000
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
X-Inumbo-ID: d6805a69-3065-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMSF/kDxDrmlWXFk5HTkBqPsaKf3b7eKWaIXNI6s6F5lEmOL6uC03xMJktkxNLFJk/g9ONNrRa5HfrrRG0Z9IpOcnjFqlQ2TO7yQCmVv94p2H27Gwt52f4CJWu7KDvyqwm3ibIFUCqg0DPjr9bgbibacvyPL9EH32tAsRUVRTZWrdXbas8oZ9nSEI9X9Y4zeZF4YgtZLCsu4Rb0/V+wicT3vK0Yobyq7n0IJy64CwTGux2UOmez/0emk61Oa+dB/IIWfvyoZVLFG5UJfpsLGteXDamehZ/3XSDBeHRmbEg1uddxURAd+f8Q5atpYR7iLsj+B4nSssKKdcMUZXqsncA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJAsgBWzXbaUDPMv8WqrnEVuL1ySu6i20kYftQ3JtMw=;
 b=j5VssgTIMw5QIqaIGvuaFyZq8LjLq8EgcfHNYnbm/HRm0nk1fow9P1Y28pfFtcaLEo4hxsKWjC0IHQgKX4YCkWsTmaFTEyEIQrlSJulox9OJ4mYrxiSVL8yXZ8Rj4lw3J5vbh5W0L54ySK3sU1AlpGusewp0MjbhNA0UZmHEeXB+VzmoYDY4Y5qy8J7uZQpm4sJ8+gC2Icm/uKMweddmoNGM5iZihXingJ811WBLWiNtBd0sU4g8guASj67lR/0jJIOLgdiz5+HS2CEjFcE1DVon/b3jR/IS6M0Yc6XypCp5QewbaY51sO8XpylH16V9XpKfKsxv7EhPb/3/KRIJ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJAsgBWzXbaUDPMv8WqrnEVuL1ySu6i20kYftQ3JtMw=;
 b=1rFz3LBimzzvu+8sGb9vOe3UGGGyv9DgpKsdu9EyrI8R6SsfIv5uf7SFXFUoxE0nMfiw7Gq2PMjmNXQqv6OPJDQJVBoXNdoyo+mQ61Zr7Qtkqm9oIZeQDqNTGYihuc3NZOWYVoonZ08nFcAt13pu6GT9/oynIVV6nsJsK8bjh05Z/g37Pz8ZUed/CjBIhCEdi40u/YJ7Q4jbE3Q1innt3ScreZM7pbghcR7LSLgQcUR5ufLQvBoSxDs1c/3rKy5Ioog2qsT8ucHj3AEEvOBvMkPPBx69AFrm3avYzzHiVnsZrd4mZggu+Uk7gcMLaVC7FDLWnegPHG9xsUnr0jgmUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0b2cb188-bcb1-1ed3-1181-9e1d0d98ab4a@suse.com>
Date: Tue, 1 Aug 2023 14:20:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 2/5] xen/ppc: Switch to medium PIC code model
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1690579561.git.sanastasio@raptorengineering.com>
 <335ce2a18f8cce679dd8b30d11560989131b4337.1690579561.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <335ce2a18f8cce679dd8b30d11560989131b4337.1690579561.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7695:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bf7b5ad-1b52-4986-a438-08db9289b99e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5Qvc/TFTdbsxvw6+6FkSXuPSuI8PPgGfgrRgyh4C/DcardTSZV3FYZfRggshHawqzv732ogWls1RIeH2hE5ih2XazJ09TVCoDd2f+QDS2qZM+8eUeC+oE30BoXAT6Gvbdr8SbAptPN9oXlL6XZ/BnukxjStnWoWR0wHXBQxHqGrTooccUgy6TJnEalM5ZKX4Wo5rdBsUUyp32bGdcPZbzHdJM+kATf4LfCqjyMnh0rNxnrI4RigZnzqOk9hEfqtm1L9ehMatAL4jGdGvbzP3VYBBsD9dKwSDDis4JT5C7UHu2eOg0PIpYdBTWPJjW4Vxx92ilmaOu4b5j5c1d06JmSuAE4hLTmUheu2GSItnE1isIt6D+4+X0S8I6oBiHKja3V7pv//MLHByKG1E7MGMJK/fUFdQYEUk6H7kdIfn+pFG6G2GKFYYm8+XTsVgTYtSNc9CjevTRNsMn4cTI7qTbl3/GgUifH/mBdn0Oz4oS2D6Xbpphm8bydmdO0678LpN2WfIgGdPG+Nt0y3oxmaYW32lFNLhDpAIZiC/OfEqrBPeVGI169HbFrJMGNrwkK2RhyivLsdWPAXEAWEraKx5DEEWK4CdRq8cY4WWPJO3JNPokN+MR5R5QDGnulNMSO7esmm4Djib+spx+IFYDo2Ckg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(136003)(376002)(396003)(366004)(451199021)(8676002)(8936002)(38100700002)(31696002)(26005)(86362001)(41300700001)(2616005)(4744005)(2906002)(36756003)(6506007)(53546011)(186003)(5660300002)(4326008)(6916009)(66556008)(66476007)(66946007)(6512007)(31686004)(54906003)(478600001)(6486002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjVQci9QOWRxTVd4QnRIZzdJSnZqdFQrVGlyRWVWYVlrSGRtRTZCOGI5QllG?=
 =?utf-8?B?aTZqWjdaYmxCSDc3eUpQTk9pMlFvY3QydjFBYkg3QkF0UGQ1ZDZBNkJiSWZL?=
 =?utf-8?B?SXdOM2tDak52bDhmTWdEdlkvUGR6RW1aNERFRTRzU2EycjFjSi80YVBoZVZm?=
 =?utf-8?B?U1JBR056Sm9EQ05GVyt3NU1IN01vc3pFc2dhMVdOSzc2YWV1ZWFEUGMzbE9U?=
 =?utf-8?B?ZVBBY0xiUGx3OTFmaW0xZkdhN0RVbE1KREJ0ZWh4Q1drcjgvek9wdXlRV1Q1?=
 =?utf-8?B?eUtjd1JmVEFLckNkUk5lcHMzUE5EMzJWZnlSZS9hVzdicGNlVmRnQlVSMW1r?=
 =?utf-8?B?S3NDcm5ZUGx1WHA4ZmJpNnB2d0s0NEpCU01iZ2hCMEdvOHVBanc5TjFhZmRN?=
 =?utf-8?B?ZERpSUt6K3NOaGJyV2ZnVS94RkxGUjEzbXNwQnZtai93SFNhNVpSc1l4Z05w?=
 =?utf-8?B?TERZQWhyNmZCREMwUUc3MjJOSDJpS3phZkxicDMwYWlJNG1RMVltSkozalFu?=
 =?utf-8?B?c09SalhFSWFjRXYwaWZ2NGZiZklCNGNUY0VtZ2pKbHZ0L3lpWWdLOElBdm5T?=
 =?utf-8?B?RU4zVFdmSUZIK29vVmRpR1lJL0M5b3lnWHNqTGN1NUJGbUtzTlU5Q0xmb1Mz?=
 =?utf-8?B?cU9VTDZ1YWJQQ0pUR2VLcFVlNXg2d01TcDFIYmJ1VEpocGViUVU5d3BCWjd1?=
 =?utf-8?B?Y2hDOTZkaCt3T3NRRHJSczZQQzFWM045VmZDdTNzeU1hWThQTEd1a2JYOHEr?=
 =?utf-8?B?ZTBIdGg4aTlmN0t2SHhVQ0ptMHR2Q3Zvb3NON28zaUhwaGpxQUJPZXZZenpr?=
 =?utf-8?B?VzRsSlZjdC9jbDRwQVNPVG1TTUxwUHExZFFiRStCU3RQcHFUcTFkTHoyNmV6?=
 =?utf-8?B?SDVNVldTdFYzUTQwV1p3eVQ4Mmh3S3kvVlZ1VkFyMlJyZ29BTEhFS2dJa1lu?=
 =?utf-8?B?U25xdHlPTHJDc1FPQ1pvbi9FUmk0NkFiUmhuclZoS2pFcXBzdi9KSnkyNmZj?=
 =?utf-8?B?QUl1dkVGR2dMMjFlMW9oNlhZUko1UWhycUVVMHhWS3h4STN2emYvNUxmMzcr?=
 =?utf-8?B?TXEwOE81ZEdjNnUvY2d0NjBSeTE5ZHRNTHQ0WmNDTWhVa3RNVkZQWjA1YkRn?=
 =?utf-8?B?ZE12S2V4RjlCdzJGdVpPL25TalF0V3A0bzhVNlFkcktWdWhKRlpJcFVzMWpU?=
 =?utf-8?B?dnIvcmVJV29TYWRkbUwxRnlTSHJ3TmMxYS9jVkRUZ08rYlhpbUF3U0xud3B5?=
 =?utf-8?B?N01ua25tdXZvZDNFVCs1VTcwMGhsSG1JVGRpQ25OWFFka21EcktXSUpFNUpW?=
 =?utf-8?B?SVFuWmFpVE5pMjlOVEtIdS9IcXJHT2VjNkpOUU9qQWxEYjdHbmV2d2NjUWhR?=
 =?utf-8?B?UDRiVGEzdDRJL3AyY2EwMGNURjQvUVZLcHl3c3RYNG5WaGovRG1JWWxqNTQr?=
 =?utf-8?B?aEpPRkVNblhOVkcxNEV3dnVGUTY5TGVtU1VEcnpSZmRncnMrT052UW5OM3p1?=
 =?utf-8?B?cHJ0WW5uc2pJNUtmbnpidHgwQzI3czM1UDVNZzBBSU0zY2FIc3RzdU84SGI3?=
 =?utf-8?B?Z1ltQUZXUThWNkkrTmR1aXJhMUtra0J4a1J4SndNWTVPZmlpSHlna1FlS1pH?=
 =?utf-8?B?Yzc2OW0ycjYybTQraEpJdXhxT0RCMlQwOFFJay90YlpTLzMvVlNtVENvK3A2?=
 =?utf-8?B?b0JyQ0Fzc2p5SGhlMkNWUy80WTZCQ3cvMXJJVEhsVUxPVk1IcDZNZTFkT1Iv?=
 =?utf-8?B?eWp2UjluZzNGK3VNSWoxMVFMNGJ3ZUE4OFBySEFtTGNMRWd3aHRQakMrNXRh?=
 =?utf-8?B?b2FQVVN3ekdOZmFkVXMxQXdpWmErUEYwZFVIaW5CNTlWSGRaNnQ1WG1QME1D?=
 =?utf-8?B?SmlXWWN6UjZVUlR3Q1RJQU5SekhNVjRremFqenZrMHU4dGtXU0xDYXF6N0cz?=
 =?utf-8?B?UXlXVXVpNHBGckcxby9ieVVmcFhoSXdSZUlVN3lETXN0QzJVLzFFa3hEQlJB?=
 =?utf-8?B?VXRHSGtVcHJGTmdaM1hxaGtKenc1Wm5mZlQyRTRhVFl0dGd1cU0rdVIyeTF0?=
 =?utf-8?B?NTJGbmRzVncxZDBmNmhQakgySFpHaGtzOVFHVkdGay9oOEdVZjFmOCtuUzdo?=
 =?utf-8?Q?YE5D7tVnqjVdhSYxCiua5oWcH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf7b5ad-1b52-4986-a438-08db9289b99e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 12:20:42.7648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xH7z5oPfZ6O0SQAin63ndwkf/XLBaE5HbVTAHBukt0YBedAa3OWwYbbaEHcjC/W82MRkYUPMkO6DPuTI6OpzJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7695

On 28.07.2023 23:35, Shawn Anastasio wrote:
> @@ -11,16 +13,19 @@ ENTRY(start)
>      FIXUP_ENDIAN
>  
>      /* set up the TOC pointer */
> -    LOAD_IMM32(%r2, .TOC.)
> +    bcl	    20, 31, .+4
> +1:  mflr    %r12
> +    addis   %r2, %r12, .TOC.-1b@ha
> +    addi    %r2, %r2, .TOC.-1b@l
>  
>      /* set up the initial stack */
> -    LOAD_IMM32(%r1, cpu0_boot_stack)
> +    LOAD_REG_ADDR(%r1, cpu0_boot_stack)

Question: Would perhaps make sense to use %sp and %rtoc in place of
%r1 and %r2 (not just here of course)?

Jan

