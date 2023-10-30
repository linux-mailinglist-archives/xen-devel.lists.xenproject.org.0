Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE7D7DBE35
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 17:43:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625332.974542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxVMR-00062M-8m; Mon, 30 Oct 2023 16:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625332.974542; Mon, 30 Oct 2023 16:43:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxVMR-0005zk-5r; Mon, 30 Oct 2023 16:43:31 +0000
Received: by outflank-mailman (input) for mailman id 625332;
 Mon, 30 Oct 2023 16:43:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxVMP-0005ze-0J
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 16:43:29 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe12::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7331ecbc-7743-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 17:43:27 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8453.eurprd04.prod.outlook.com (2603:10a6:20b:410::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.15; Mon, 30 Oct
 2023 16:43:25 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 16:43:25 +0000
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
X-Inumbo-ID: 7331ecbc-7743-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOvx6lieOsII1T9lPP7lo6zn6C4WwSR4T7idp/r0OdytCFC58nBlKmV7klYGlwc2RX6CgGO2iRy+lSFp2SVa+NsJ/MJlIytahiQSAZBeK4dtsuNXl3c40bhh0J46BklZRKEY/gJbAvj+UWyhDPEcElQzsxoK1PND9+mbD4BQtIKhZ+DBmMA603mBbyPjsho9XxEl26hYKGt5LKSbs47KyM76V1ot0l+fpT7CgjuGWMQkkV4CrDso4m/CqhUMC+7z6+icmEYoTJeLLAQ8APp7LLltrl52V6K9zgFEXCN3nICgZ9zBKcxB2//AQe8mJPUdT1clhEmxzR2YX6U4GxOYWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RdCj2um+EEp7a3DsFWKtm4OIAliSxHWpJd/XJ48iS/0=;
 b=eoycnbHXbq7nCFYleGJV/+hvDpNr8eJeteWwzxtu22yZVeV8RI89z65yuW+8elVTH21em2hXToTPC76GTMBO9Qy8KwOSRwem9yf88/reru3wpcbPMX/LO8FLXdATnaf0dAw4uNWdCM0qyFL0SefEcJUr2wAVrufl+Sk7Pp4/CkGAXYj3o4CG7AFQJfEdPZF2tiWmwAMw+ecei15bPPy8SA5BOUkUiP4AbFRHmbM/Hryb9d5014TkezEb2JadqitsNYbpmEXsEzPov/UlIJstzLcKMFTe5XhOY5xgVlFECIGutlopwEFohHK+qVvML0Vb/SIsgBhquqpsgGN42Xs8kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdCj2um+EEp7a3DsFWKtm4OIAliSxHWpJd/XJ48iS/0=;
 b=0KwcZGSVn93aexob5jK1J8QPjTGeVZ4KYv8UXP4cUE7ipY9dcMCJcTKsMTyz/f7TeWAXatLqaTkgr+p30It4TeoVmBv5N4yujIrq9ffwohEDKncKxWgkun9cGr2E4p8yZLDjA+KyqEbz10VThMW+LdFpbfU+o8LKr4aA3qnU5HNBAB6e47dOb7jMqyJkSRTQCPHtAX279cOFykSmsi4IjjflGp+uYo4Wn5KUheFAv2aRVYoGBO5BdLTdbJtAKlIuJI8XlFX+wO9SWapG8PBIWa6oSeE1lg1VTBg08pwaanUNJqNx1wDyGbb/zCdKvXxAPl2CcLQlfZNcahgibPc3CQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a826292a-44de-c149-0831-01578d9b38c3@suse.com>
Date: Mon, 30 Oct 2023 17:43:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 12/29] xen/asm-generic: introduce stub header pci.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <597a482c70fef196e245a5d898ea6314a0c479ca.1694702259.git.oleksii.kurochko@gmail.com>
 <d4dca6d7-ac54-beac-26fc-5eaf80783a73@suse.com>
 <d1e5d5fed5732274b2d4582b7aac4c3c2151d30a.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d1e5d5fed5732274b2d4582b7aac4c3c2151d30a.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8453:EE_
X-MS-Office365-Filtering-Correlation-Id: 900a47dd-a0f4-4c95-edc8-08dbd96755e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BdAdruuuKx9vIrRso0lWKaCtD9DdcvVDWiV/fRRdidsItyVvpIdKOCk20IFl1naL8XqF70FzpO51M9NmOiMx8xcVKken4d/fRd7lnI15wUjEaJLDBqtRn8QjgAiaDYxBecphUqm9rgCmsE9Sx3gmRcJvVk3RE6MqJfFgNR0XayG8UBWW6/8FnNU/LCeUw3F1ZIznHLBGtnpDcDtjp1/0r6RjHMvMpH28GEUu1/hkI3qrVfaj20tvnxZpp+Te39pe1WhtwNcn4xMl1pdZcyHCx3fPUAO8NitLO65KDuByXdOp0EC7KLqqIl6olmEBZeF6FlFt0KWqzBivgOvXjOML5Fdtt/1wJSqQWftHeJePK0e9EMe2xKYFOtTjvFvPdNKMwAThFerrP8Gqq01wbdOXeJezXkg+mpPccRBkL1HZMl4fl30HirC4HuI/UbGrIrgNkNMI0n5GTH+G77nNTJm0jZndxg/pTkl/wkib9nSjXajPFtMfFxw0g3TuwDXHJj2BKEx5LE5fEJCQR2ddMH6LerK9bYZGkyTZTlBlQt6Cw0tweeeAR49nklQO+wh0bBelIQmOc1sVD6XxIBkIy1W12R1Ew7DepBWFyy/caDyvMdqVoGZwDbu/dcn4onaiCFnh8Sz1QhdF7d9RH4Tp4nuIY02WJJdmaMAzUAzuSBD2XJQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(366004)(346002)(376002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(2906002)(4001150100001)(316002)(66556008)(66476007)(54906003)(6916009)(38100700002)(478600001)(53546011)(6486002)(6506007)(66946007)(5660300002)(6512007)(2616005)(26005)(41300700001)(4326008)(86362001)(8936002)(8676002)(31696002)(36756003)(31686004)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHd5UXhZTlZGdXRwSGxtVmg3Nko2SU5tTlpVUzJjc0JWYlJ0V0hKK0kwZk0y?=
 =?utf-8?B?eEw1Y3pzamhERmFqa25PdGdkQUgxbWpjNmtjOG8xcnZHQU16bzBDMXU3cTJo?=
 =?utf-8?B?MmdvUUZBRUFEcHJhNGp2NVZaZ0dDbW5iajg2RE9LSlU4bWFTYlp5V0FBdVN1?=
 =?utf-8?B?Z2w5UWQySDR4RWVud3VjZ0NtakU5Y1lUbFRFbVk1cUxUdldQR0U3MHF2TTBO?=
 =?utf-8?B?S0E5R3kzdFlyL1N4Q2VtenMwanpCek1Pb0Z5ZFYrRDZMaFBLbVFBMC9ybDJK?=
 =?utf-8?B?OWdKUHJObHdFUkk4NnVUOXdWODZ2bFpSallKY2Z5a3lFUExuZU5BZWpCRnZo?=
 =?utf-8?B?bDZSMUJCVFpXdzUrMmpBMlBScGViSDdaMU5QMDBtR3dBS2VFRmZFYnVWWnBq?=
 =?utf-8?B?Z3NwRUpzNnZWOEQ0SXBHZUxSS3VsR0pLa1pLbVhudWdTU05oaExoMjF3SkJI?=
 =?utf-8?B?RmNTcVlmQjhqdS9VS1RqWGExbGVOUExCMjMveUNvZnpicis0UVRpQ1JxMDVP?=
 =?utf-8?B?Qkcreno5NzgybmFrb1ZHcUVNdzNtYnVGdjFlRzRkU0RHRG44T3ZhMDlhTXhJ?=
 =?utf-8?B?bXRKMzhPYkp1dW04dmpqWVdERGU0OEtxZWdYc3p0L2EyRGYyM05VTDlhTHpN?=
 =?utf-8?B?cXFBdFpSeTQxQitKNEZ0WGFxME9yYWJBOFlPZ1Uzc21uZjZmY3VYaDlWZ1py?=
 =?utf-8?B?cmtlQ3VFSENqbTlQNWd5QXk4VDBISktmNHB4STVpMW41dG5rd09UZ0VxWWgr?=
 =?utf-8?B?TEh0WnFmcm9aQmlrVTYzaWN5S0ZHZ3RDTDdlUTlqUmNEc2RzZXJuS1U2Ritx?=
 =?utf-8?B?VkxTN3JIVHp2OTJBRjYzbGtmaWFGL3RYNGk1dTlpVHBRWURCcHRuWEVMajlW?=
 =?utf-8?B?dXJUVFdhU2hHQ3JwbVVhR0Y0UFNnbWxBTVo5NDZpZTZ1MVJrYzFhZDkzZnlW?=
 =?utf-8?B?MHVTTTZYVWl5OWdQVjArc1JwT21sNkdCeUg3M2xCYWI3dFJTMmVBRVg2MXYw?=
 =?utf-8?B?NzNocjJwbytyeEdpMjRGTStBaDhKN2ppak55MHRrOWtTR0dKSHdubmROSHZL?=
 =?utf-8?B?V2pGZEs5SkNzS1JZZjRaUmRNamN0VTE0M0VYc05QZFlVMFVVSjhROUpWZDI1?=
 =?utf-8?B?WnpFeDhEelIycDJreU9xeExuc1hvbUsvMTNDZUIxNThHbG1Nd0xNNCtIcUgr?=
 =?utf-8?B?cngvNE00cldEL3RtTzE0eS9rOHlGZjNwbkcrcW9tMVdkU1JEU1RIZnZwYUdr?=
 =?utf-8?B?b0wxVVV2SXJzYkd0MWhQclRsVjhKdnVYbkl5dnhOYlJJSmR2TC9lY1JzVU5l?=
 =?utf-8?B?MXdUeXRuVVRZOHJ2V0dJczkvbXFIUlFQZCtoNGxEVVYrV01FL1ZJSjZuOXNX?=
 =?utf-8?B?K0ExUktwMDdmUEhTU09MdlYvN3FQQXA2S2FRT3dJVUoyeW9idkJ3OEVkMVMw?=
 =?utf-8?B?Ti9hVVNzT1R1ODM1Q1BlVVA2Wnk4eUtEblpoUURiT0R2VXFnRFlYdXhzT1FO?=
 =?utf-8?B?a29LMTZKbEV0YmtiOGlIN1hJWWhBZHJNTDV4TmJuSnZCa3Z5amZWOG1IZWFi?=
 =?utf-8?B?aUxNdUVIKzl5UG9MMjUyczJYNDZJRWtraGlTRXpyNEpSWW1FREl6cUZxV05j?=
 =?utf-8?B?MS94RmcyZXZ6bVZEZVozVElvTm1JbWxRa3VJNWV0dmZHV0k3aU4vdVRtQVhM?=
 =?utf-8?B?d2w4MEJLOVVXenExaG5iemRCWkJKS3BkK3lCcHpoekZ6Z2dqN2xmZjNiaWNM?=
 =?utf-8?B?dmd3NFBUOFMzMnUzYTEydWpDdEdRZ2d6dWJUdTBJemhQVzRHQmtRRVZmZEtH?=
 =?utf-8?B?dGU5aHNXU2o2aysrTWQ0Z2ZDb2xJNU5odUN3UnIydXRQVTlLQ1J0ZXZPWCs3?=
 =?utf-8?B?OG4xaWY2bTZKQjFwcnVsK3I2RGVMb1lGczRXWjNSWGxNMWxSU013aWt5RExZ?=
 =?utf-8?B?cWxRSGJvOTBFNWhqZVpaMFZrMnVzelNmcTAvZWRtTE80R3A4THRPeUdZd3pZ?=
 =?utf-8?B?Rno2dlFaN2ZwaG95V3FIQ2M0UEV5NXV0ekpqOTdNMCtaYVhkYjFsNzFJcXlN?=
 =?utf-8?B?LzlsZ2MxajBtd0ZiUC9QTlBjT1Q5RDZ6ODVlcS9CRzN4UE55WEI0ME9oaVhB?=
 =?utf-8?Q?WTuk7dSZrugSUWp1yTACbLSSE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 900a47dd-a0f4-4c95-edc8-08dbd96755e3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 16:43:25.0180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l1x+ZEKR1Rw+wMxSYPFjq5cym40tdrySUj4mSaALkxtwf27G5InJXF7jH2zl33ueImx6V1xBDmY125rD4hQIFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8453

On 30.10.2023 17:34, Oleksii wrote:
> Hello Jan,
> 
> On Thu, 2023-10-19 at 11:55 +0200, Jan Beulich wrote:
>> On 14.09.2023 16:56, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/include/asm-generic/pci.h
>>> @@ -0,0 +1,18 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +#ifndef __ASM_GENERIC_PCI_H__
>>> +#define __ASM_GENERIC_PCI_H__
>>> +
>>> +struct arch_pci_dev {
>>> +};
>>> +
>>> +#endif /* __ASM_GENERIC_PCI_H__ */
>>
>> While more involved, I still wonder whether xen/pci.h could also
>> avoid
>> including asm/pci.h when !HAS_PCI. Of course there's more than just
>> the
>> #include which then would need #ifdef-ing out.
>>
>> Jan
> 
> It looks like we can do that but only one question should be resolved.
> In ARM case, in <asm/pci.h> there is !HAS_PCI branch:
> 
> #else   /*!CONFIG_HAS_PCI*/
> 
> struct arch_pci_dev { };
> 
> static always_inline bool is_pci_passthrough_enabled(void)
> {
>     return false;
> }
> 
> struct pci_dev;
> 
> static inline void arch_pci_init_pdev(struct pci_dev *pdev) {}
> 
> static inline int pci_get_host_bridge_segment(const struct
> dt_device_node *node,
>                                               uint16_t *segment)
> {
>     ASSERT_UNREACHABLE();
>     return -EINVAL;
> }
> 
> static inline int pci_get_new_domain_nr(void)
> {
>     ASSERT_UNREACHABLE();
>     return -1;
> }
> 
> #endif  /*!CONFIG_HAS_PCI*/
> 
> And if is_pci_passthrough_enabled(), arch_pci_init_pdev() is used by
> all architrectures but pci_get_host_bridge_segment() and
> pci_get_new_domain_nr() is ARM specific.
> Does it make sense to add them to <xen/pci.h> and ifdef them?

Counter question: Is the arch_pci_init_pdev() stub actually needed?
The sole caller looks to be in a file which is only built when HAS_PCI=y.

For the Arm-only stubs (which are called from Arm-specific code afaics)
all it would take is that the respective .c files include asm/pci.h
(possibly alongside xen/pci.h).

Jan

