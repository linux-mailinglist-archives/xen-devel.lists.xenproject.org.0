Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 832F3753530
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 10:43:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563542.880774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKENU-0006wb-WD; Fri, 14 Jul 2023 08:42:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563542.880774; Fri, 14 Jul 2023 08:42:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKENU-0006uT-SR; Fri, 14 Jul 2023 08:42:16 +0000
Received: by outflank-mailman (input) for mailman id 563542;
 Fri, 14 Jul 2023 08:42:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dZ6j=DA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qKENT-0006uL-6Z
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 08:42:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 531f152b-2222-11ee-8611-37d641c3527e;
 Fri, 14 Jul 2023 10:42:11 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AM7PR04MB7112.eurprd04.prod.outlook.com (2603:10a6:20b:113::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Fri, 14 Jul
 2023 08:42:09 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Fri, 14 Jul 2023
 08:42:09 +0000
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
X-Inumbo-ID: 531f152b-2222-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3Zb+Gk3knxNi3F4OAMZZyWXr0SMW6xHf3TOqHb2baPpjoXZC4AAcy/kLrFcFfwMvBwB1bK9b3Oopo0oKXP0szFICuS46mSAYVT6bLLUz6ZPS7LMWwGn3RQ1OY35huSgrdqnpiJ+ckkPc9UPVYN8feVjZ7YEc+2YwYai5f3taQfCM53Qal9raI2sQ1jKb9AJeXr+IDSOfILDd9CZWvz83MVPJkZZMezY78fsh3Rm+STagIMQ7rAR2jnxO5pDxkpt/nsQ7TkcorAeR7tMYKAYriGd67WkbNVQwZ9KgShEIt1ygxyUP/RF3mCPrKiRztqOwU7hrD66fiWJD6Zpu9SYZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1pb0GgA5M+V5KbnFMx4YxRFANsacuU+kNapv3ZEn48=;
 b=HuXLYuIPm60SllZDMeA8KiIxKXkbk7z0O3rXDkNnw3IIm84G6qWk0XSfNggu4XMEdWkPY56hcx0Paa+JaQ3rZ0XDKZK52no+WmiXGngQpQ5yjfTPbzrAX9D1znDMwMPlTGqAV9wRbpdg/mfpT5Ye6MKA9mehXqYvnwx/K4nnhEK88mcFzF2lCK9Pp89uzWkgJQLlYX3/8Py4j1CQA+90VggH3ngnHJEhO9EBJ1KFhpZEZCEkNPJeB2QTj3Bh4xVDVCCTqom/FMLgWNJcsiyl2i5EuLNbMN4fCn7Xxa+5lRmtlvZomFuhddSopORWkLxMeiaFHMcAIx6aYzymVuLtsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1pb0GgA5M+V5KbnFMx4YxRFANsacuU+kNapv3ZEn48=;
 b=udYCu6NE7BRlyNGb4/3c4ya5iDmTEpT7YDPmktdJjD5F/x0v9Z8beBZs+2rH+AedD1w3h7U7UB+IxopwBEooCz+BtBTL4gBn+bP0aW1DZQf9rhDUm+7eIl5YreZxlVoVUcu0/62zgRblgzJ1vNFKonIJz3WrkeNPx2vuvNJZ5r18in4ist44QJGBZO9juhgrirGpGk8km42/mSaZuOSbyAIfLUD+Rau+Y8mmN8/HysThro89lkC+USIOC7Mp+r/8EvT/zNX/0ZctLv4gTabH8g2bKunCKIbkSw4CIObjxQItZezsOJaEE4zxiSIxO31kWKwsJDFgQ3OITC95egvu2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0ab935de-824a-87ff-c541-a654019ceb8d@suse.com>
Date: Fri, 14 Jul 2023 10:42:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] x86/mce: change parameter names in function
 definitions to match the corresponding declarations
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <5d1b292f3bb46dccf7e1cae38903165c5e236507.1689321884.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5d1b292f3bb46dccf7e1cae38903165c5e236507.1689321884.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::6) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AM7PR04MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: 227c073a-f090-43c3-4f15-08db844635d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s0Qtg/Icim6t0O1s2UrkCb7DpQBdMGQii0WJr7iTzyLOipEhC/507lHtHf0/Uu0ZhJoWLq8vyngqTLAsTKvfNwDiiHoYa0AhG2Fcezgb80ZkBaiOkYtavfEHujWmwH1mrMK/B3xZR9/I97N4zHjH0/ILp5ogqJUryTe5xeL/asn5Y/NtdEy9+rwOeGlw1xcr0HleNT465bPflszlCQTtparXCEZtjcaWPSC2ffeqcvId0pOtKn0YnUa8D7pKYa0aF3Q04moIRzcM+1wd+HRYWXX/GxZKTOnIGO3zI1Vr1arWQJKmqvaqLuy1wHm2g9nOUopnItZBMwkl4hvubomCNoZe845Pcw5S+FYE59ng0kq4e3L35UALzjvWgCaHooKvh0t9vuJ1R2yLie5+stcmDfTfBA0a744sfJfZx3m0ENbBKpZCOTv0+vgbhCB+a+5y4dC94v7mQxTToYQyqZvJn3j6HK8+vGe75UBaWEMLvnftiHzuiA36prXH6+RVxoPetmiGMaDp8a4rWfXHwkWBufZzaCrilTBTz7vyJYH+CkhfXFB8FLtemWpw14spiMRYVL48k3JB9MLC3HAHJtRDejcWpdyMS9mOcvoUHXr6nQYjNlq/k6CrDF7euqJqaoqxpHhHzL16AXKBgFvLLC+7uQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199021)(2906002)(2616005)(36756003)(41300700001)(4744005)(7416002)(6506007)(5660300002)(26005)(186003)(53546011)(8936002)(8676002)(31696002)(6666004)(86362001)(478600001)(38100700002)(31686004)(316002)(54906003)(6512007)(66476007)(66556008)(66946007)(6916009)(6486002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T05wRm5iRVF2OTZnazI0eDFiYVhVbkVCY29FRkNiR29SM3N6d3VBZkthbGMv?=
 =?utf-8?B?cXVHK0dOVmUydXdJSlNRVHFPVDI5Qi9ZV3FVbHIrRFREcXV2N0JtaTFrNDhK?=
 =?utf-8?B?cjU1NXNUUkZaVlZoUW9rSGQ5TlpMMXIrYTladGJmT3BCVWxSb1lnY3hOT3JR?=
 =?utf-8?B?TGlkNjBYMEx1RUN5cGkwNEFyYmNkL1hjbnNhOVYyeUwrQmFJZFJzNE9EMkFD?=
 =?utf-8?B?eWFCYXhpTlJJbHg0c0trUmR5QmVDVUFlSmorcCtKQVU3eVI4STM0VXRMOTBI?=
 =?utf-8?B?Ritlc3M2WTNHUTlGbzRzYmNXL2t0SitUSWgvNWhPYlJ3WTRlb0RhZlBjak92?=
 =?utf-8?B?U0xLZ1pTUjVRSHozczhPcW15TUpKZTVsSklFaHRjTDFoTUt3WGRicUxoYTZ5?=
 =?utf-8?B?MEdBUEVlb0lYU29xZTYwcFMra1gvWXQvZXFORGZNUHUrOGpJcGJjM2VlcU1z?=
 =?utf-8?B?SnFQaGpUbVFGaUd0YUdQQVh3Z0Jla1U5YVVZaERNc3VXRERxcjZ6bXJTaUpH?=
 =?utf-8?B?eVpFb1NqaEk3aDZ2SzNoWWVzSFNkMXBkZHhhMDdoekpOK3oyV1RiRjA3WmI3?=
 =?utf-8?B?STZtRTR1MWRrSkZtN2N5NWJCSVFpVTF0MDFYanFxNjRSbm9xVmRyNnNzV3dM?=
 =?utf-8?B?Y04yQlQ2RVZsaEVzQ3lxU3NkMVhtc2tVaXFrL3ZhODNhVFNBdlVEZ2d0cjh0?=
 =?utf-8?B?YThLQUFZRU4raERGZkFRZnVpRzROYnhyTDJVWDFDd3poRHNiczQ5c3JTN2RN?=
 =?utf-8?B?Qng3NEYxNDBZSjNhYisvc3lVOUNpOGUrTzN1VEFlQytHejlZRE5LQUx3U0U5?=
 =?utf-8?B?SC9ONTNNQVRGaHg0UzM2K3lSY3NlbGw0aXg5UG9PbFg4T0RhbzNEZmx1Z3Rh?=
 =?utf-8?B?RXlOYzdsWmhXZVdzWVdwcm5qeDlqQkhUSEE4ekR6Wk1VcGEvVFNNUm1UTm5K?=
 =?utf-8?B?cnlVTFB3NFZUZHVlUDBwRlY1MTRjUnRzSVBydUlFWDRwckxKZUhlMjJ0eW12?=
 =?utf-8?B?VklxMTRxSnVTV1BSd04wanVNa1FtV2E5VXF1YW10V2o2UEY3MFB2ZFdyVVNr?=
 =?utf-8?B?RDVwV3VsMnE0MzRSa3pldm9CZWRBMldwaG9pdVN4NHFVOVZFUzRBTWplRUhH?=
 =?utf-8?B?VHpjc0ovY09qUFlMOWwwU1IyV0VYcHpPZFQ5WmVzTnRrLzIwa0NiZVpEMnpF?=
 =?utf-8?B?bmprZVFxTlV3OThVNFpWZ1QxSG5pSWZDcUhxRTJqOTJrR0xXUFV6eENKY2Fo?=
 =?utf-8?B?aUx3MHNrR1N5QkNFTy9NK0gwSlNDekhuaEtnRW9BQkx6Y3hPNlVhN1pTOTZ5?=
 =?utf-8?B?WWc4TVZwQ1JEVG9oamdYRFFkQ21yK3JVQ0MxRWprN09PNU0zYmdEbEFOelkv?=
 =?utf-8?B?RmtlVEJLUHg5c1E4N1JhemFQTjdpTFhZT0JQZEJ4VTgzbmtUU09ESC9wU253?=
 =?utf-8?B?ZmErSkRWNFVjYVlwSHo4c3hkL1BSYWFBZGJrZ1kvWko0Q1hRMW1OT21kZjhF?=
 =?utf-8?B?MzFIcGJVdmRGTmJhM2dCL3dneVk1SEZQYmhWUko4alFqUFdLK1pPMU1tb1FR?=
 =?utf-8?B?ajY4dHlBdUZCbDcxc29rRVV5MW1KL1VjVjNHYTRZNEpSZExtOWJDOXZlaWVj?=
 =?utf-8?B?V1BHVkpwcGI0YytBMlh6Y0JFampHQWMzQ3pBZWZrU2V6UjZZcEh5YnF4M00x?=
 =?utf-8?B?bVlLRWEyZnRZcSthRlFPRnZ1ZVI2V1FEaDN2OVlsSktVcUpBTkVSaDdSeWZ6?=
 =?utf-8?B?aXJUUUJCODRnVS9ZL1g2ZW1JT1M2WWN6azVFY01qMjBRdVNZeWJBUHJQR2ww?=
 =?utf-8?B?b0FmNjdzakU5aFh2Z0h1T3BCR0FRWXBWK3BSK092T2tZMFVvN1dsUVRWeGlR?=
 =?utf-8?B?WEVRTDBubCtnTTZmSnpYWDNmaUNXejJRZjF6NElMRmR0dkx1TTl1emFZODRk?=
 =?utf-8?B?VjVvaTFvcHU5SExEaTRWR2p0TVkwTU9DbVdNeWc2Vkx2QnZOYWx3cVMzTlVt?=
 =?utf-8?B?K2NDcWc5bXdOd25kcXZ1TmlJNC9uN3F1WllJOTZpaDJXNWVhVzRHSFU2eFpD?=
 =?utf-8?B?aGd0NGgxeHB6NGZRSTRnbWdSdUxGT1F1V3QwVVRid01Wa2s1T0dIeXR1SHZt?=
 =?utf-8?Q?X9BSpyAKFmGoBpZrRmbhM9QTX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 227c073a-f090-43c3-4f15-08db844635d0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 08:42:08.9878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SdhNM8O5MSYl72bjTS1G8fyhZ5wbEAJ594Xsh9bcheJjPZ4aQSg2WjdRK99KSb23imnPWRj8JVZgrANZ7DgSXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7112

On 14.07.2023 10:10, Federico Serafini wrote:
> Change parameter names in function definitions to match the
> corresponding delcarations thus fixing violations of MISRA C:2012
> Rule 8.3 ("All declarations of an object or function shall use the same
> names and type qualifiers").
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Would have been nice if ...

> --- a/xen/arch/x86/cpu/mcheck/mce_amd.c
> +++ b/xen/arch/x86/cpu/mcheck/mce_amd.c
> @@ -272,13 +272,13 @@ int vmce_amd_rdmsr(const struct vcpu *v, uint32_t msr, uint64_t *val)
>  }
>  
>  enum mcheck_type
> -amd_mcheck_init(struct cpuinfo_x86 *ci)
> +amd_mcheck_init(struct cpuinfo_x86 *c)

... const had been added here on this occasion; I may take the liberty
of doing so while committing.

Jan

