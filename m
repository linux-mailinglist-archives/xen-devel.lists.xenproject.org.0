Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E974AF51F
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 16:23:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269322.463376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHooE-0004KA-Ih; Wed, 09 Feb 2022 15:23:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269322.463376; Wed, 09 Feb 2022 15:23:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHooE-0004IO-E1; Wed, 09 Feb 2022 15:23:06 +0000
Received: by outflank-mailman (input) for mailman id 269322;
 Wed, 09 Feb 2022 15:23:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFrC=SY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHooC-0004Gg-CS
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 15:23:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c35f87c-89bc-11ec-8eb8-a37418f5ba1a;
 Wed, 09 Feb 2022 16:23:03 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-iO71Va-pPna6Eb4Z1hgLYg-1; Wed, 09 Feb 2022 16:23:02 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 15:23:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Wed, 9 Feb 2022
 15:23:01 +0000
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
X-Inumbo-ID: 2c35f87c-89bc-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644420182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i1Md3ZIRNSaIM1GYErnLqwUeDHWNbqRXGvWGdrEokmw=;
	b=mdgcmVgqZdGn+GM4vPIXzVwwHjDca+5Kl5pO7yTkltnZACuXuj9nWCqqaPL8TXpowo0ASM
	LA01jSbDXlMG4fTf3E5L0gfQF3y7LAFBaxT0M3qzSkBOr8ZjAirwVladjgbLKjyFJ6Anvz
	ax758PD7+nmTlbB6NtUsp/dLelIOScg=
X-MC-Unique: iO71Va-pPna6Eb4Z1hgLYg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIasw6VSSM97SLoNXL2i0ZcUNuDbnBpw3veghtln8eQIYD1LTySjrdI6RECzWyYciS1mPy4EFeJng93ypySTshtE9a5xmf1r73Aizzq/sWw1Et+cYpNfAueGn10rR+9MBL9J16w9LjP3T6+ap/ArIB7XZIAIiJ7SxcrNyFEupjjiKiG+hPaTKl4ssvwLldW1lE+ELfmtZjVUzC5wVrkRkLnbogDEbG1dYm4PXfQ0WVVAfLN4PrtIwl3++eHsL7CiLw9AJ11IrJ33t5cuqk7vfVeikK06K6ES90FPe2F6xUsmZxZ8R6e4laWNzzh4pxUlRMWXvvJWIrUbqy8zL2Ci2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1Md3ZIRNSaIM1GYErnLqwUeDHWNbqRXGvWGdrEokmw=;
 b=WzJ7u+Dr88SrGH7hXIaFOO6sQxksR1PAGD4TuNq8NvodIIzX1BLQtBpEcpTPA38bErnuPQa+XIMyEi9xNvN0VcLctFHAz9yi3CZzf57XHyuZaKJV6tNpm9wZf2U5mIntbBB6Kay0F62+YvPcVZTN1jmjiKVMKRyZSsmuRz65lAnmIfi/mfg01YsaVEkWYUmbdlgfiBt2fmaZW/CyFhq9uaKM//bvBV5WG1fntXkGfDuYRyBmKC//wBQpIUHVBhm8+3P7/Mn9WXPnFmKwtVVmR2O4s6IRzTxUuvcmJ+XhbSRsqEKFu5VIpO8FV+uKrxHfLgQj97gRUcEcO8LPQ+rsEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2bdd699a-9644-ee6c-c75d-c5577c836f62@suse.com>
Date: Wed, 9 Feb 2022 16:22:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] x86: Use low memory size directly from Multiboot
Content-Language: en-US
To: dinhngoc.tu@irit.fr
Cc: xen-devel@lists.xenproject.org
References: <fe2e94e8-9e46-82be-6e83-391f4709ef75@suse.com>
 <20220209131251.387-1-dinhngoc.tu@irit.fr>
 <ad339015-c5e7-d776-17a3-2dbd337fcd4a@suse.com>
 <000801d81dc8$8f15b9a0$ad412ce0$@irit.fr>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <000801d81dc8$8f15b9a0$ad412ce0$@irit.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0025.eurprd03.prod.outlook.com
 (2603:10a6:206:14::38) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c4ae8de-4f00-4b53-2252-08d9ebe00f47
X-MS-TrafficTypeDiagnostic: AM8PR04MB7300:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB730020661ACCE956383E891CB32E9@AM8PR04MB7300.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TH5csufaEhytgkD0aGHs0cwVyxqKnZfy6svRrJEj4VuV8TlC1wg+RggtdPnN2cgz8wQddYDFHo6fZOtnscxd+DMcz9yA3Rz16EwvPAW+1jMOesRKJV3M4HsJhmzmodRzIiccnfvVUc7vmDp3CuM22yKm07tDG+DfvAHkRHbDupMXiTXpGvy+4/wEg4Lcu5ghf5EE2ggVhVoKD2oxlb7wUg1NTpTue1ifV4/mhVa+FcVSDDKFDf2ZcHtdiWUvCLeJmBVoTiOY/JP/gcXXpgJXXPXBghub1J7EBZmoERIpWzCoKqcBwdJWG5fGaqBCCbensVuc5l/jioD2Exh/TFuF2FLxOB+JCOAYU9fd4Gn2mf4Df48WixLf/SB8AWkM9/k5n63ayePCmi5ap3/EqBhdLg3gtPpn6BfqVe8c3S9Z1RroXobF6i9tRdWqV2+Oq9vgj0Ok+bcLm2VULCO1ptRlrksQLqsnXaqKwjnzIj+tdDe3PJe4SLcD4davU5QW3v646RQgPWaog6xm6DGRtcg/N5gGSidlrDMKZR3kq3Jza4W5dpZy8VfqEMt8IwwrjnUyJFPFIRK9Bie49bweSoYD57Pmf6m4p6hBOcuN2AzLBr7leQDrw+yw026X1jjdOIgn2YI60sRye7zBmoWJAIfNs0f/WKJJsvMD4fH7+ULFhDiGBrzvLoio30udAnWpCViQEmd1L9bzRSOdjKfNLxJKRDWwHJ7jXpXfg843czpHtGU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(31686004)(53546011)(38100700002)(2906002)(2616005)(5660300002)(6506007)(6512007)(36756003)(186003)(316002)(31696002)(4744005)(86362001)(66946007)(66556008)(508600001)(6916009)(8676002)(4326008)(66476007)(26005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTlzYzQ4VDlsaGdkZE9mMlluRENBbnBYMk04NlN0YmNrRS9ZdWsvM2M5OXF5?=
 =?utf-8?B?em9FSmlJOVVhaU1tME9JbnV6dGZYT2Z4ZC9oOGE1TWRscG1DOE5lWVpiREZ0?=
 =?utf-8?B?YXpTSXlYeVdlZFNHNEZEdlduZnlhVi9oSFpNUGU1T0s5c2k5TmF0RHZseURl?=
 =?utf-8?B?RmsyYjlzS1pHU2V5S2FoR3l0R0RCVjhJNmREZVlGZmorYlJITTlrZlFXalU3?=
 =?utf-8?B?WHBFVldCRFVqZElxVGdnUTJOUFFvM0tIY1h0citNcW1nVDRxS3ZPYVRadTJM?=
 =?utf-8?B?WWdBL2ZMTGVZZjdKRjVSVkk4UmN5YmVsdzc0RWUvb25FYmY1YWZUQ0w5bGND?=
 =?utf-8?B?SUdJaFlSQlViVjJRU1Nydi9Nb1p1OFBxbUo0ZHBxZ3hZU29JMXR4MWV1YzFo?=
 =?utf-8?B?bGNpdFpvV0NJWGVRWEtRdi9IK1FDdFZEVVB6bC94MEhuZ1RGRVc2akc2U09K?=
 =?utf-8?B?OVVLR1BqaFg5NjhhRy9oQjJXbUtqU1hXYklzWk1zVkZ4NlBMT2xBUVdPbVcv?=
 =?utf-8?B?Ym82Q0FrWEZscmc3ME54Y1NOaXEwb3lNTFM0ZXVXTEJ2UnRUWmI2alY5YWN6?=
 =?utf-8?B?cXRjVFpkczY0ZjFXa09qbitrVkRYKzJDOUFhRlVuQ3VncjN3cERyWHdhcmt2?=
 =?utf-8?B?VkUvQjdKbUlKekVKL05aYW5Ic2hlc3o5ZDR4blVmUkUvenVXYTUzblVrdDFO?=
 =?utf-8?B?MEFpeE8vRHdKQ3p1d1ZqOFZ0aFZhTWpXZXNsUDRpZzRST21RL3FpU3JuTjRy?=
 =?utf-8?B?a0xFNlN0ckU0UkxTN3VlanZkZHB1QkQxU3dSU1lsYjJTTzVGaURZN0hjMmVT?=
 =?utf-8?B?YjRFb2FkYWdDWThFNk9PY0czUFIvK3RTSkVWQTE0ZVFQU0JVdStHamFDU3Zj?=
 =?utf-8?B?Ym9FajN1SDhJdTBiNlhFaCtuSFhrWlpWMVNDN0tUZXUxR1hIaHpyTzI4WHBr?=
 =?utf-8?B?UCtBb2pHK2ZDNTBvMHh4TFpnbDNOYW4ybE9IQTkrQ3BmWGJYazNuNzJDcGZY?=
 =?utf-8?B?MU1lYjYvcjRVeG5yZVp6T0k2U2M3Q05tZFlISW5IY20zWmlHUHpDQnVLWXVI?=
 =?utf-8?B?dzN3M3BuRW9NbU54NDEzSS8xUk5MMkovRHNZN3VSb3o0aHViNlh2ZFBsNitE?=
 =?utf-8?B?SjB3Z042VXRyNEo0ZEI5SWV2RTE5TDlqRlk4a3FEVS9UR2kxR0hEUXpRb1NE?=
 =?utf-8?B?MGdCY1I2aXR2NWJDUDRDWVJLbHZEMGs5cFB1VXdia0dnbU16d0R3RDY1RXZv?=
 =?utf-8?B?Sno3dzBlNzIwSGNTTk50QkptV1AvYXVtOTJ2VncrOWp3TDFYYjF1cTU3clBq?=
 =?utf-8?B?L1MyRUtNRTJwTTZPVGt0ejR1cG01b1JOUy8xVEdHZ21FelMyczF4WUtqaEty?=
 =?utf-8?B?WDkvWjdDYmpCbk15RGpUY05TWlRkNDdhTE9nSzZuek9JZnBlZ0xtelpjS25J?=
 =?utf-8?B?UDBTdmxJRmMyOWowbEYzcjQwQTg5dlpHRGFqcWhJS2VTOFhFNzd2Ly83Z1RM?=
 =?utf-8?B?ZWdxSmJucUxkc3krVDl1RXI3Q25qRXBnOW9LNjlPQzNkcCtBVGtYWDZlb0p4?=
 =?utf-8?B?blp1OFgwZmJXeUl2eWRySFpNN2h5RWdTWUIxQjlqQlR2blRWQ0h0SlNvMVJ1?=
 =?utf-8?B?N1hoN2htSlNyM3lRTFd1OU5GV1p2RDFFbG9uN3ZhNmR2NnJCMCtMNGhiOXFo?=
 =?utf-8?B?dldXSHE2WEtIL1BRSUZ2a09NR1lFWjhTWm5lSEdmRktpN2EzVnVDbndGL0Ja?=
 =?utf-8?B?M3VockxWNFNSL1Vkd0lxeWs5MTB1Nk5WbHVkclhUcHJCR2dLSFRyZHIyZ1BP?=
 =?utf-8?B?MzdiUFIyRmRjbHJTNm4yZXZjWlAwQi9nekFJSmV2YzdzTUlnaldma3N3Y0R4?=
 =?utf-8?B?a2hLNzhkS3N4WXQ0eDBEVHUwMHc0M1l1bWk2bGdaQU5iMFQ0WDJsMDBQRVFw?=
 =?utf-8?B?MFhXb0hZZzBiYkdpR29KSkIvK1NkTmdZVElaMjVQZjErT2l0dW53MWpFUUM5?=
 =?utf-8?B?V2NML2pGbndZb1QxNW03TWE1VkttYmNuK29MNXJJRm41ckZkNXMvcDlPaW5i?=
 =?utf-8?B?VlArNzFKQUZUK1dvNTJWMnliTzBacHRRVnJzTHhBMFhsRlBsZy9HWnJYWTJy?=
 =?utf-8?B?dU9HL1BKcUQ4R0pkQmZHamFmQ3hqODM4SmF1MkszamZlUS9YemJ0SUYwMUVU?=
 =?utf-8?Q?N9edkqosUwQ04bkrUWaTUhQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c4ae8de-4f00-4b53-2252-08d9ebe00f47
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 15:23:01.3032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P/1strGiM5n2zhk3k4ynY5eQMpjBj06oQXnnCLtmBF0Aj7YvdiKL1ZvryqueoXyZD3BAavH9jox6Iwoeqy5Jqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7300

On 09.02.2022 16:20, dinhngoc.tu@irit.fr wrote:
> This change should only affect the particular case of booting with Multiboot2 without EFI (e.g. legacy BIOS or Kexec). Other cases like Multiboot 0.x, EFI booting (with or without MB2), or bootloaders that generate the BASIC_MEMINFO tag correctly shouldn't be affected.

How that? You're taking out the reading of the BDA value altogether,
aren't you? This is certainly a change affecting other environments
as well.

Jan


