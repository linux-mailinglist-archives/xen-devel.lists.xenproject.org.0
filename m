Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E032730494
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 18:07:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549021.857337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9T1f-0003qz-5c; Wed, 14 Jun 2023 16:07:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549021.857337; Wed, 14 Jun 2023 16:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9T1f-0003p3-2r; Wed, 14 Jun 2023 16:07:15 +0000
Received: by outflank-mailman (input) for mailman id 549021;
 Wed, 14 Jun 2023 16:07:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9T1d-0003ow-JD
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 16:07:13 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe12::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84e3a10b-0acd-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 18:07:11 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7428.eurprd04.prod.outlook.com (2603:10a6:20b:1d5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 16:07:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Wed, 14 Jun 2023
 16:07:09 +0000
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
X-Inumbo-ID: 84e3a10b-0acd-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WTWsfBpLpasMfkThWChAB8V0+DXx1CEP8PmJ773huzZuSabhu4Jr+a2dZq+dukmV8dm7F36Opdrgajqhn42uq8ITVy/TsljQNcm62kmYmESXR6exrMwhdnqcFb5K5x6R3XGztRySBlWu6QuLmDlk1x7fe8Lo0JDkkqTPWa9peBPEXwyda/6Nsg3QpCiy6HPnj4vSf7zmJSZqg1ufV4I2R/Rf7uAbFVnQF0voSCKWYbvnA/SF5AoVzscFSYRao6I6BNYEhgsTBqAl9ati92a76o8InQoQuHsmE6A5cKJIQwwJPECi40l5z8QuyhabGv4/aAI5FmNxKH8am8YH5UJo1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdLN1IgKFlYB0/23G0Y7VBn558guk0oug7RQ6CXwIjY=;
 b=nn6YPNA1d6wRMtsvvLEWjL4TdUhDzfq+3Un98cp3NpqMX8HOtsH3GT7KczQwO6WqEi806INmflPZS3kwJKZxuiKPkXj6+nsqtYLOKOV3Cxz5zvKf/lzwb+j+lffzUWh7fceGu2woUUfgXGUqVRZ5iM8IJXLR9NnNwBOFboRoBGpoCg1fp6pIUSIX7so4CRQ2p+My88N7MzkO+lVFamN4d9PkxoLSCapneP15oTWYdMh1qgnxoNdRlHwYypzsxh6k8mHTCCnF1ra5hmLn2K0Hcs90BaYASbkFnHkS3unebgH76g2uc2RUrZVUHSLvu4WCPE88NSR8arMPlLTrXrUlMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdLN1IgKFlYB0/23G0Y7VBn558guk0oug7RQ6CXwIjY=;
 b=0jjJZ/RhJfN5k/p1UI8A4LTogNaiCL0PDdRNNYCU7SCjW09ROr8zvjHHoe/jEgRfw+C02DN4kSZYysWLxiqzvixZ8PiHbqPOGFKTaaPT17yPbtb+/hLvJM/QaoZ981OF4pK+7p9KQsmW4JIEQo22aL5VGUXHj+T0R7eRyFldzb8vDNaw+oAZRKaebrwn8CaiHTWYN37RqVMh6D4a9vLb1aiuo3dgHN628j0ttH0yEFAMKulm0afDW6vAA2gpuq0xhSqeGtgL52k0mq2s814Mrxtv57R3qorelKKpQaPEbg1Q8Nxv8GFzhX4CmYOi9a0mvSRDFwEMtVNUMoFFamvP5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <303b0288-d372-315b-16f9-4116d7f478fc@suse.com>
Date: Wed, 14 Jun 2023 18:07:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Arm: drop bogus ALIGN() from linker script
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7428:EE_
X-MS-Office365-Filtering-Correlation-Id: bc105a4e-f4df-4b4c-fe0c-08db6cf167ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CjnV98rAxzPGPfHfZTJk6ybBctV/8IoR7Qne5zy3v3HwUXe4XNieVGjl+GsfznOQA2+dHwEHnOwGgZ03wQajX99QeKNsAA5d0mkVmIpptLjDlyLFmlOde5OYcdcxoV6gjiMr73FHvLwpU06tXN/yRNPgGA/4pIW30b4MYe+yg1J1RY7OR14VDqPFL/p8yx+DBk+vLlKBesPAvboY0H3wxfbPaL6PSb2vbngbWXoaC0lfckgwawidUYSWyN5QKcQqiN1Mn90lOrNzL+Rw2SFCYp5bH0/UdOXTKf5OpP7CQKiToP2e2uzhV6vAysjpQzWk46/bzZq5N8CaR2xLQ/G/yCLcxyJTpvcKGzyO2NTeXv13oLAQDBeKjL/1pMjcZAIgR+5FLYHTZNr1F27yQSHtDkip5+UgOGzz9KUoVGCg5uweWhYDAeukyqQf+oo801MSIHfnGsRNP4QoAu6VhhSMbM6zq2EfS6PUw7czXAuHBznDGRWU/D2+8logv2WaQVRz7jfFZOdA6I5BXSy3nSIciGlQtKGzIIiqidithqgUVNRDXgEhf3PbBxR6oBCdXYXK9TxegzTZPO+5Oiw4jK/oIctNaxcV4iY4XO0mjhY0RetbdlaBq+QS194xhPhGB9A0M4PlfqcU58DBVweaBmhRMg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(376002)(346002)(366004)(396003)(451199021)(6486002)(86362001)(36756003)(83380400001)(2616005)(31696002)(38100700002)(6512007)(6506007)(26005)(186003)(2906002)(4744005)(54906003)(6916009)(316002)(4326008)(41300700001)(31686004)(66476007)(5660300002)(478600001)(66556008)(66946007)(8676002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1c1NGtqdHc0YVVpNG5ST0VSY1ZCSC9tZE5iWVdCdWt1NzZjTkl4ZThPZE0z?=
 =?utf-8?B?a20yck0rUnRBV3lMTUxCRTJwWFhQN0Q4U1N1dVpTZU9GUWwrRE5ZTFhaOEo1?=
 =?utf-8?B?MjJFZUw0RGpBbVQxQ0xqRGdvNDhlS1o5QXJxSGhQMWNVRGFoci9wd013S0Yw?=
 =?utf-8?B?Z0oydCttUXZOQzBvbUpOWXNFV1ZkSXVlNURpNjdhMjN0S0RQWkdnelpkZCsx?=
 =?utf-8?B?RnpxM3FiL014dXVHQ3lSekoxVWNCUENWaENlS01SeUk4RXBSUTVVTmJnUTRW?=
 =?utf-8?B?L1lYS2UxTVJpdXNIdXZvKzdnY2ZvN0YyMm1nYTc5T1hLRmlEZ3lzaWV2Qlds?=
 =?utf-8?B?UzhhbWJndXhtMTNydHZGWnB2bCsrWWVaOU5aVTRlazhITjB4MWs0SG1wbkp5?=
 =?utf-8?B?dWJ0R0UrQ2w4ZVFDWUoyL2RtUTBXUW9BM09oYVNjbmJZbXJrczNDb3JhTlo0?=
 =?utf-8?B?ZG1vU2ptS3RiUXdoSkd4V1Z5S05HcTJ1dlFxdzVyQWRVbHN4OTZWVVBoY05l?=
 =?utf-8?B?OHZ5dmx3YzM4MGsvN01EbjNwTDNwNERScWZVZ25oNFR6akhqd3NxTUxQZFZF?=
 =?utf-8?B?TGRGMytINS9ra1hTMUlVaGVKN1J3cCs3alVkL2ZPUFJoSzMzdXloYVFvUGE1?=
 =?utf-8?B?NlI1YzNBTURzK1dOMk91SWw2UWlPblZuL0NqQkpXZXVDblF4Slc2MlN1dVZv?=
 =?utf-8?B?TjJ2cVdyRVlVY1NBL1ljdllsZ3VnaDEyWlg2anlzay9WUS9nSE9Fb3R0TWtz?=
 =?utf-8?B?Z3lmalNzWTR2TUg1N1RJZ3R4UGpjcEI5RUU2QmprUmtxWTI0VGhJM3p1QSt2?=
 =?utf-8?B?WFdpeE9yVWxFUWtydGRZL3UvVExQd0p1UVNyZ3I3QWtTbGh4T0JXUS9ieW1w?=
 =?utf-8?B?VzZYbGYrcmZXSXpuUXY2MGZNdVFTVmhhZURQdUZOdnM2Q3IrWmV0SG1HSGc4?=
 =?utf-8?B?TzVUaytaTDlrWjN5WEtvR2RiUkNDdjUyS2pjWnQ3bUZvR2c2WHdRdmpoV2o5?=
 =?utf-8?B?dTVGdGRObndMWWJDQVdkcStiQTdQWEt5bXJVOUtzcmJweUxrZlNldnNvOTFz?=
 =?utf-8?B?VVIwTGVUYWg5V0tyQy94RGpPN28wa1VvelNrem93b1ZEdEtlVVFRZ1ByRTRj?=
 =?utf-8?B?Q1lScFJSNjlUYWhpWFpBbWx3YVdFdDlLUThuT05OTzhuQm9WRE5wV3RWL3dl?=
 =?utf-8?B?Q1lZWHJ3TWtqV2hMK0hwdW1hZ1M5TEJxVU1qZlE4Ni94THpOcTZsSXMxNE5k?=
 =?utf-8?B?QTJrZ3J0elVZMEQrM05KWGdGSnJFQVpMaVh6UnVhTkVxSnF0S2lFVkZIZzlL?=
 =?utf-8?B?cUQ0NnFsYTRlMVh5ZzNkOERid2hrNndwMy9nQjhtU2h6NHUzWHNLNTJpcnpJ?=
 =?utf-8?B?Q2duRXRCOEJRQml2Mm05TmVLZXdUUy9PajdkNW05R0orazdmYlVTczg3T0Vw?=
 =?utf-8?B?UW1FRHQxVFZxM2RHOVpEYnJKMThndmliaEZQRG1pUktBc1MwcjJUL2ZqUWlH?=
 =?utf-8?B?MmlXWUpsb0dsUzV4WVVoNUxJemRTUiswR2ZBQmNlZWhTQlhZM1lsMlZLbjdT?=
 =?utf-8?B?UlEvRXFyNnlaOStleVRHK1VscFBMa003OVF6TkFRVThtRHp2VlIwK2VKZ3M1?=
 =?utf-8?B?RmkrcldGSG5JMlo2WGNuelF4M0J4MHpERm1pczgreTVwNXF5SW85U2Y4dEtT?=
 =?utf-8?B?Y21rbHIybjFaZGV4YVJkaHd6QTZzMWtNOXNCekE4QTNNNlQ5Q3dnS2dlcVEy?=
 =?utf-8?B?citCKytBdlJxb1Y2bldMR2RYS09pWHBtUitoRnJ2RDNsdGRqcEVUUkk2T1RW?=
 =?utf-8?B?dFhEa3ljLzB0Q2E0c0VQb2ljck9vL0VidkFnNUh1WVJBT3VmcnF6VjRmWGxq?=
 =?utf-8?B?MDhTT0szV2ZNdXFIeGhhcWNMMHV5T0dHZTg0NXZhNmsrcm1NcGU4MndXMWdn?=
 =?utf-8?B?QmI1dWF0WXpFR2lXRkZZUlV5UjNvZDVkUzd1bDg4cGcxMkZ5dStKWVgzYllW?=
 =?utf-8?B?QmxKdEh6UFN1a3B6MTV6MmNXZ0k0ajN5MFVTR2Q0QUxLOC9LaU4xaU5ZN3JN?=
 =?utf-8?B?QVB6Q3VrUVlQbmhyYW1yTWJDaDBVYUorMFdna3VrbnFWeGpndDVvcUprdTdD?=
 =?utf-8?Q?4I5/ffRqQQj5iZ2zB4K1AEIhS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc105a4e-f4df-4b4c-fe0c-08db6cf167ed
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 16:07:09.0937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ahu8Jf9sUjVWLVzpX4Z1NuPjD0Q17tbgDGXoAIaHhuR0ZAFuHWTUEeG9odG4FeR9QRH1ci0tdE/9cWktuS4AAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7428

Having ALIGN() inside a section definition usually makes sense only with
a label definition following (an exception case is a few lines out of
context, where cache line sharing is intended to be avoided).
Constituents of .bss.page_aligned need to specify their own alignment
correctly anyway, or else they're susceptible to link order changing.
This requirement is already met: Arm-specific code has no such object,
while common (EFI) code has another one. That one has suitable alignment
specified.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Note how RISC-V had this dropped pretty recently.

--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -199,7 +199,6 @@ SECTIONS
   .bss : {                     /* BSS */
        __bss_start = .;
        *(.bss.stack_aligned)
-       . = ALIGN(PAGE_SIZE);
        *(.bss.page_aligned)
        . = ALIGN(PAGE_SIZE);
        __per_cpu_start = .;

