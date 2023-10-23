Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2430F7D2FC4
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 12:25:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621263.967557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qus7T-00084O-1b; Mon, 23 Oct 2023 10:25:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621263.967557; Mon, 23 Oct 2023 10:25:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qus7S-00082Y-U6; Mon, 23 Oct 2023 10:25:10 +0000
Received: by outflank-mailman (input) for mailman id 621263;
 Mon, 23 Oct 2023 10:25:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qus7R-0007zu-0q
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 10:25:09 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fa498ba-718e-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 12:25:07 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6945.eurprd04.prod.outlook.com (2603:10a6:208:17f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 23 Oct
 2023 10:25:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 10:25:05 +0000
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
X-Inumbo-ID: 6fa498ba-718e-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnbnAX69CnoVJ2zW039P7LSlt85Tb0zxNhe0YUtsTRmqqE4K2Mcuy/o3CxPxCaK0sAQzSmSzdpJeqxjGsyLXFv2FLiTsBkQdjHZq5etrow+ha8Q5EZp92BrrWoVCAzu49D7dhyO3QWW/iGE1wesj7LRSlsV4mpXcR4OTYcFQFuaSURwD4bxNa5MJiOXVYVbXcCk2frKnIemUrXxtWVDf4geW0OhOKtNu+LRMzInyaBnSXGXpnswjMw+yMGOsJtLh9FK/kKrj9se/5vQWhpQ+F4Uw6Aze6twxDMwZ7Hy20wSe6TK6Bi67VyE13wNHH2LXick0r/hmKKibVqj2XBdIYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4PRHKkat7M4ioykeJINTSkaphKNDoNSvsERK/Q6BAI=;
 b=Qt0wfQkqHhLyYT2I98GUVaCaWDTTi2OZDEZrQ5EOU1PfqgrpV6jwBOXhGYh5t5QiFzSyr+EA0AdoW3VWK0MdShjVUmuT/5dPDi2EM2ZU10geDiF6/UMzM3hWo3IhNJtcShrGj9VZThF6dJJzhFvd64u9HFStEGYdBWdGlP2Oh8rB6IwXBozxAkN4EMNanWWxqQ9CtTXAJ06JfIdhn8ZcBTs1wXx06Ml1y4RiVNqT6Rh89CmzgNoUzyZhBv8LaLZO6Ls1erzE2V/JOqEMcdS5A17p5oSJT9CPlvh8tRIANHhvbrKuMWKXEuIQ+vp8StWRZjtdtu2fHQoNQdZ3Y3nyyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4PRHKkat7M4ioykeJINTSkaphKNDoNSvsERK/Q6BAI=;
 b=TCJo/8U/Mg92Z1mRgt1c5cOnthlpz9Cp6twKZkzzy/o+91LrXVqhTtb49x5Bma+/LFxe7ZyCUXt6F0kBsdtnGuzHF2wYsy19Wnh5UuImZjOOtzV/1qmHqTOYcCYDBOUtlOOaVVSTkk29zqttmXU249tixIRUvukVNNG4ff++kU2hqnxh/aDuXWtzMYMyjHQvVP1EFHe06vG4QM/XojoTOHI5IY/2Ms+RnaL3AKzLb6MFlzovcsfgVkLtN/uWjLG7G4mjKdSiczbJs8essNV1gWtuIgnrvpvCbUscvuVTtgvb1pel0y97hVtK/1gP4PKK5f8Z2lkwRIwe6Ynx9CgwvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b6f18c91-3dd1-15a6-6460-19a317f3744a@suse.com>
Date: Mon, 23 Oct 2023 12:25:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/4] CHANGELOG.md: Use "xenbits.xenproject.org" in
 links
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Community Manager <community.manager@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Chen <wei.chen@arm.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
References: <20231023092123.1756426-1-Henry.Wang@arm.com>
 <20231023092123.1756426-3-Henry.Wang@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231023092123.1756426-3-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: fd3cc2b4-80ca-49af-e64f-08dbd3b25302
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/xFQ6Pq3RNrOLYcFC3fx9VJWRw42JkRoFckkC29tf09hIz0vDQswamPnmut348NMWRDDjYO9+UUDM7OHS0iNymOlRikaqPDZx8PLWtctzQ3vcQz+3Je/nswAAn8AMPpmrHtX/eEYkZGnhE7d7NlOUHGBiZpQPwrU6Ba/L4vCwRcladHwuTq4JubFBoGSkFk6R779b0avulTE3jBLYMt+2vLDASNAZBBwD6zYW7PdRZUgVVf8NzmOfrKUUkFJdVwOyAhgeXJrovtn30UahmkZqELI1RGExh1WjC8e/PXrIfqX9fVkVIyDBauHTXpWiWbbHPLOuF50QzzUqtf72rUYC+SvrWQ28v3Y/eiP2o6t+dg4WqpY69yCz7UWITrI7QFxFxZ54A95rrpyVjoPPAjJuUo5UiGaUiFhn2Gny6KNYuYdM2G+/zN4dPHHYtzKsFDKV2xvhvCWYkz+yi9Jb8kte92SP+HdUY/0f2PhLdbolo+Nf/gOiQeYV8yxJnPtpbEwGEMR/vRy8ln+jEUF+McfMxJ3ccvrUcSMv6jE3GrfmNAttF363LZugyq73GVzSfA7gzi95Ik/8BStHW40LUlE9OPFL18iYK491N1CubwcKIckCk8/+zT4fdzh+/563Z7nxbZn6zky31usMpfQJOOLyWJeSt6uZbPejhlnZMdDVtPshfQIj6kA44chfK1ExM586YiLd4k9lGO/tHuH0mlLMEi6ZnfnAwR3oTsgFuBLoP0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(31686004)(2906002)(4744005)(6916009)(5660300002)(8676002)(4326008)(36756003)(8936002)(41300700001)(7416002)(66476007)(66946007)(6486002)(316002)(478600001)(6512007)(6506007)(2616005)(53546011)(66556008)(26005)(38100700002)(86362001)(31696002)(54906003)(59356011)(219803003)(207903002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDhBaXhGME9ldXp5WXh3QXFmdEpienlPbHJLRlc3ZEtya2Q3anFXNTRuTmdF?=
 =?utf-8?B?NmZYZkhTVzkvYTlZeG5jekorZi82NklPOGhYNW9MR0VFT21ZOHVKUmE0YUFW?=
 =?utf-8?B?Mk5EZ1lVaFBvYXQ1bldSZEkyZndGWEUvMitHd3pmRkRVYmRueTB1ejJGei9t?=
 =?utf-8?B?U2lJQXlUWEVNQ3RBcGdITmd5cXJ3Rnk5Q2d0UExva3RTVldvT1QzSXNLVHpZ?=
 =?utf-8?B?WnBTbkxwNWtYRlZjYm52blZJYzRxNDhwc1k4MUVsK1dkRlVlRktZdzcwZHVx?=
 =?utf-8?B?cEZnNE1OSUlVaDkxVyt3eXZ1Q2NLckpIOHl4N1hkUi94emd0WEtkUXdIUVMz?=
 =?utf-8?B?TTBzN0JnL0V2YTdvSmtpRUw5TEJNbUNtSFZ3YlZ1SE82aWlRSVZXTVNvR2oz?=
 =?utf-8?B?VUtPUktWVk5pa2RlNnhjZ0hjTHhCSkVmcnlFNUpaa2tnS3RLbUJLMnpQd0hj?=
 =?utf-8?B?NkpIb1RpSlljdjdlMjZuNVlDRGF1NXE2MjBsSzI3YkRyS3lIamRpNXN1MzNK?=
 =?utf-8?B?TEQ0YjY2ZDRNTjRqaGZOd3N4Q3hsamRxWHM3UHBoKzZweEgvR0xCL3hLcWJ2?=
 =?utf-8?B?NkFKNkJ6VkU1TVVoN2FrQm10VU4wZVVBQlVRZmsvQU55Ni9ESEF5Z0tzdmV1?=
 =?utf-8?B?Y1JFVDUrYld6K3AxZWFvV004QzY0VjJpTmZuTlhhNmFJU2tIaWxVdTZFcExI?=
 =?utf-8?B?T2NoSDkxS1p6UVppZisydkZ0MTFFcUFHcDgwUmkvWktRZzIrMGRFbWxkNTUy?=
 =?utf-8?B?a3QyVHRFNklkcjZvcXNmZVRZay9BTXc3TkZVNC9jK24wczUyRkdxNE5aUkNi?=
 =?utf-8?B?S0dZdCtuN25MczhOLzVleXBEV1o4WXF4bmpVVkJnKzI4Y1VHWnZqSm9KSFJz?=
 =?utf-8?B?ZkdiQU4vN3NkbFpYVkozM3V5Z2lNYm52VHU2SHc5TVNVVExGaDQwUkhka0hL?=
 =?utf-8?B?NGlzdDRsMGd3Vk81bzRxVnY3dHA1cUU5YXI0L2MxSGhXNlM1WmpkbnNtdVM1?=
 =?utf-8?B?Q1Z5WFQxNkdFenZwUnlwbXhyKzY0OWZXYit6cUlqTDNRK1BETkVVRmRmb2ZY?=
 =?utf-8?B?eitCNzJkakVUVFBDMU4yRWljcjhVbjQ4Mmo1S2xFNHFSNnhhcCtvVDRXWHhz?=
 =?utf-8?B?bkhxU3V5L2NQZzI4NitJUlBKYVoySk02WWowWHFZUktxVFdVVFl2Z1c3Ri9v?=
 =?utf-8?B?dTRBem9EVlAxc05GWmRGZFpPNUNPa2txOE5FVGhZNUwwUHZBWFlhZ3VCU1pB?=
 =?utf-8?B?czVDVFZOaWFnZ05aa2Z3NS95QTYvWEk1eUhGcGpVRjk2ZFh6Q2JBUUorZGRW?=
 =?utf-8?B?TldLQTN4ekxnMmpDb25wUHFFeG9nQVhWKy81bGtKWGVkRStROFUwajV2d2FO?=
 =?utf-8?B?OGtLRC8xRGRPcDcxWlNDWm5NQ0YrcGZTWVAyQnBQbU5COUVpSmNCM2JCSmFV?=
 =?utf-8?B?TDBRLytZY2pjbVlCYkl6N3V2Ty82b0dHSkVhMjJiMzBHY0hmQzM4R2Z0eDFW?=
 =?utf-8?B?dnV2R0FUOHA4ZVFrQ25ZMXkwNUxGZW9Xb3hJWEpDekZZV2JCa01qZ3FIeXpD?=
 =?utf-8?B?N1dPOURxYlBMamRBUnFUQmV1aDUrdmJJV3ArUmJzMmJPTlFsY3Rjck83dXU2?=
 =?utf-8?B?T2JIbGVDa0lPMVFzTG84WDJSVUdlZ2hrbHZxYjB1aU5YMVU2cTZGbkQrRjVF?=
 =?utf-8?B?RkJFYXFMUWFwRXpKb2R2UWxuZUhuWTRaK1U0VTlXY1FqQ1ZWSHlwNzRvR1hq?=
 =?utf-8?B?K0RvMXdGd243VGhYdzZMdlhjK2hBU29OZXE0cEp4aEVadjFkenpWVC9nVjJ4?=
 =?utf-8?B?VTZ3ZG1GdHAvanZzN21iUkxlam92RnF3UUlKYjA3b3YxekZpRURLN2RoUnJw?=
 =?utf-8?B?M2Y0VlNrYWttRkZ2djRkdDdJR2dQRkU5Slp0QjJmZEFiTzVuUWl0WHBuUDR6?=
 =?utf-8?B?K29nSWtiUEpBNU5NK1o0UEJPbVpReW1iTWVETkMwYWNwcVZJWEpCVURoaXgx?=
 =?utf-8?B?Q2ZJbFlTR3h3T0IwenBDVVBhS0RvOW5HWTA3eURDN2VPNWxBY1JoMDlicUZK?=
 =?utf-8?B?NXladU5MUDZuaXRMVGhDcE1adW14MUpiVnNwTi9iL1NEVmM5TGxydlN1SVpl?=
 =?utf-8?Q?d1gwwnwD3oAtZ9J8f6fDMgDpV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd3cc2b4-80ca-49af-e64f-08dbd3b25302
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 10:25:05.4867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rpZiIdOMpbpMHFMruKkmmn4VZF6cBR+9KegGYNzHaQYNjx7LEQySu5FMZvUCQJULJ7c/5sIl/kQI0rmn+GaVxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6945

On 23.10.2023 11:21, Henry Wang wrote:
> Compared to "xenbits.xen.org", "xenbits.xenproject.org" appeared
> later as a name, with the intention of becoming the canonical one.
> Therefore, this commit unifies all the links to use "xenproject"
> in the links.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



