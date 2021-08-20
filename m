Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 558923F274B
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 09:07:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169268.309209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGyby-0001cW-78; Fri, 20 Aug 2021 07:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169268.309209; Fri, 20 Aug 2021 07:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGyby-0001aF-3T; Fri, 20 Aug 2021 07:06:42 +0000
Received: by outflank-mailman (input) for mailman id 169268;
 Fri, 20 Aug 2021 07:06:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nWHd=NL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGybv-0001a9-TS
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 07:06:39 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1824ad0-30c8-400b-98c7-97b7bbb5b683;
 Fri, 20 Aug 2021 07:06:39 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-6EpUA_PtNL2WDzM4Xu6cow-1; Fri, 20 Aug 2021 09:06:36 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5472.eurprd04.prod.outlook.com (2603:10a6:803:d3::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 07:06:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4436.021; Fri, 20 Aug 2021
 07:06:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0P190CA0012.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 07:06:33 +0000
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
X-Inumbo-ID: d1824ad0-30c8-400b-98c7-97b7bbb5b683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629443198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fdZpzaD+AyVoy4zykKcdr0VFCy/g9MjibvR0nMgESdk=;
	b=DdfVjrCTsRFYLoRALQgD1SpSojMCAqw60G/QXtEPQnmSdW5piPPqidnVAJ2YW/kgnWWMCU
	oJrQOJMGlup0iECX7EV3A3eDAt/EF/9oRJH1HYj/SqWd/ynPatW9wINBFH9ZdtVEUjPOSV
	vlZN8D5loqzBtIKlyIAIxM9+lBTPTec=
X-MC-Unique: 6EpUA_PtNL2WDzM4Xu6cow-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLp8OV4AIr6NNJ9ktta+YOIlek3xp+kEOMYXYU7zoqe6URnHylhKx/0VennrgxIEWy1hjyqux4ptDcqKxW65/nj/cDQurqd3ThmnS6AGfC+R4Nfu/M2N4GMeAoEXqnbvaET7iAgfem8ekjam/py2zoP3kK7RVanOr0FG4Uweu847Mzs3pmjbzg+4R7+heZmxbEQb38JBXIQwLXLVHND3p+7uDGaBqw5ryu3PRahTHS6VhvrbtItciQEsZm1CU1Xc1+CWxcBl29IN8OgPW0CLzOLFi14JXGt9N8FFhPNqlgrAowSx7GzVeAj2pai9nM1NvZTtPJo9nWPSEcqkRipNug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdZpzaD+AyVoy4zykKcdr0VFCy/g9MjibvR0nMgESdk=;
 b=kiUYHZhIbZQd32K8pLY77/4rxHdyEUlYCBrsfnHBgXIm3tiunDrhyIq2Z0CnivbpdI3sSGpOHynxUwrzqtEX/rvUuG6VRinwIE82HvPE2gWiArv+x88xCOmJu947YWaH0KxWhim6m0zdqfFrb7zniCxh9ocVrG4pTWZjI+phf2PKbQ2G9pZ9VTS7ffrzCMplp38U5lfZFdPpVcTSa97+AclY2vUSIP66+MxOKS3aTCcU6OHEbTWPBU3FCsipCuI9ot++9KuCp2D07BX3ZAf/i8p2iKwUe57lRGw8h+K8tQ/w9zNyHZknypluYwGOiN3+u9BX47/UMQNIS4/oaXB6BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v1 03/14] xen/pci: solve compilation error on ARM with
 ACPI && HAS_PCI
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1629366665.git.rahul.singh@arm.com>
 <97d39d3ee398d6018bdcaf745f00d039df6a92ef.1629366665.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5fad114f-06c4-120e-0a48-da7045fb85c5@suse.com>
Date: Fri, 20 Aug 2021 09:06:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <97d39d3ee398d6018bdcaf745f00d039df6a92ef.1629366665.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0P190CA0012.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4663e88b-6969-4003-2202-08d963a90b46
X-MS-TrafficTypeDiagnostic: VI1PR04MB5472:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB547295A549CE5AF7C8E5E0CFB3C19@VI1PR04MB5472.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PMsBd+c7OMp50HmUk7ivKkk8pMN2y9amUeSx8eCnXtcF4xQPWe1zCwhRWY3vrwkP0kzpZxURWFC0x+JP4Y3EP9F0yQeC1fjCiJjsooi8euJ2fnWLuVeHwLI6P0KOZYdB+nnFPvHGBEIehTRKvogGukbqE3l2vhRiiZzI7WcBmr9bU0FFICL6PTDsSQxRCLS0CX8lBTGwat2EKIzXAJ+fTEfu59ZTNAvjzflHNsUaO2FhNkT2axrmvsAmRdB1wIIZYEbdzQeiSPmpI4tXW+ZEwZPwSwweABdRwlm5eAcNSF6Hw6hyFjSl9u6mE/J4J8wBLvsAI/61BWkCiLdLPL8jLAK8cqiLCcbvaECA1tA0B7W9pT9PFWWh+tlJG5IMKiCUuyjOxPRkWNt/1b6Sd7N8Xoh2zMbLJbGBzO1H5siqDDfRyJr16AyjcN9eCegUBdNCYw+EbV18adJFZfiAvGGWELfFudllocaO0n0biiQnCmR+rb9UAKX9yrC39nyPahHqRUfBLOT8mkXtHkowD8H7+A2ABWYvQ7WRX7XuaPI+GM7anFr/0kv+bBZCNm3u5aXdB5T9mNdBY8eWhIigflQvwzZVc8DOtr4eLe3DMZiikcHrq7pJg5EHtXD/xfh5jfKdvE3GlmNWdxpgzjAXyzmpueIDwrnW2eGSh2zhV3xbpj34MADov9DBuY+rGABn9uZr/CBrOdq42rApCrM+IILFJ30To96n8wF5SEKAqmoxHck=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39850400004)(346002)(396003)(136003)(376002)(316002)(478600001)(66476007)(956004)(66946007)(2616005)(16576012)(31686004)(2906002)(8676002)(66556008)(38100700002)(53546011)(86362001)(6486002)(36756003)(4326008)(4744005)(6916009)(83380400001)(31696002)(186003)(8936002)(5660300002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWdoUlN3bXI5ZHczUHdQdjl2dkZjZi9MdHNWY2xwUC96bE4rWjl0RnlUYVh0?=
 =?utf-8?B?RUJvMWtZaFQydTdBZW9mbjNSdENrUWRmQlpENWhXNk92K1A4ODJsOThCckIv?=
 =?utf-8?B?czV2amZ4ektzSVUwWlVzemhxT2RPUVNtendpQzUvVVpNTHpVWEdPV1dPZWdo?=
 =?utf-8?B?SWpPY3NVOUoxQmt6ZXF2VVJtQWl0azMwb3ZiYWFBSStyRStHdWZRcTd4YzBP?=
 =?utf-8?B?bGJndUQ2aHFiWkRnNFhZcm1lOWFneXN1eWdtS25FQmtZNXplbHJsdkpDdzN3?=
 =?utf-8?B?SEVVWENsWXJiMnA2cjFPL2VEOWZ3dGRZUFJnRTRLZFo3aVNIaUNvUEovMWlq?=
 =?utf-8?B?MUJOUnR0K0xHc0hKK0dBeml4b2hwTTZqb3ZqeUNqNGhiRlJJbHV6TWt2c0RB?=
 =?utf-8?B?eFZiUkdsdm9JVmpVWjFZRXdycVRaQmVha0hRSWlHaXhYTDBzZDhZQ1JyMzB4?=
 =?utf-8?B?QjNENlFIN3F4djJ0eHo5VnE1R3F6d1d6MDJyVy8vN0J5VFc5V2NMVnVaajJR?=
 =?utf-8?B?ay8xRnRDejVkMSt0N0ZnQ2JLM0VWb0RyelRvaW1Oa1FXOHgydlJKbnJXRFhm?=
 =?utf-8?B?U2N6NXVrMHJHTGVwY25FTER1ZG1UTVRDQkxwN1ZNVEVOOGlLR1JvRGEwUWNZ?=
 =?utf-8?B?bm5jM2ptbWxnSk9wSkVhQml3RVplNStoQWdpbWtXVG94WmN5RSsvTlo1N01l?=
 =?utf-8?B?VUw5MjZVT05FaTIrMnlvay9CQWJ3V1pRcnJ0dXJFTFVzb2hOSW1sMno5dWpC?=
 =?utf-8?B?Nkp0aThLT01vTlNTUVVNOEhjektjNi9MbVdaR0ZZWjFQNDd1bHBSaVJaS21W?=
 =?utf-8?B?dVQvU2hLLzcvTzBMYlZiYXE1RGJlSUlpbUVxazlRSU5xK0tFU2RIeDgxRHVj?=
 =?utf-8?B?VHZlaTVhSWw5MGJPMXhvR2FuUWczckFGTU1SL2g4OUNGUTZQNlhWR2ZwNnRJ?=
 =?utf-8?B?MG5yRk1hY1BtK1RzL0czYjQxZXdWUnJtZ0VnNkdNWjJ5WENiaUN6dHJHYUxj?=
 =?utf-8?B?VzRlcjJuZTJpenFPUUN4T2tEN1NIV2xXVTRCWVpsY1FTZGZKRUxralp1Z3NB?=
 =?utf-8?B?ZWluaGxFY3BZUThvVnhKUWZjdlUxSGhFU1dmeGc1YjhyYmFyTGRoQ2crd0Nk?=
 =?utf-8?B?LzVYdVd1WjM0bVpLQ296SktLNFVoakk4Ylg3SUQ5T2RQdGpXZFlIaTVCWG1Q?=
 =?utf-8?B?c1BjZUtoVTA5SzgxZ2ZaazVza05SSXpBYTczUHlUZHpyVC9uaWNPdEEvNGZR?=
 =?utf-8?B?ay9IVWJ1Sk5QNWJVNjdKdFJzRzNSQlE5UmRxc2hOdStpTXJKenJXQW83UDJx?=
 =?utf-8?B?SVdqS0M2K0FEOWo1NmNDQWJHQlBPNWJqdHI2N3ZpaWJ5SldPYnQwa3Bkb2Q3?=
 =?utf-8?B?OTRsRmNxZG5veHAwZ0d4aG44c0NHZlBvUm1ncVVRZWlwcHV4Q3ByQlY3aXBS?=
 =?utf-8?B?R1oyOXhxQXJjNFdGYjNGSnBqcHhDend5YmdVUFJScmlpSnpraTlHSC9YaW55?=
 =?utf-8?B?OENXbXQ5azRTSDhFQ2JGUml0dE5CdmZ1RnF5SzQ0SmIzY2puTjF1SDBPVVRy?=
 =?utf-8?B?OEhwSlZ0dTFpY2x5Z3I4dk5OZnBpSk43eEdEVVZIckdoN3pBemhIOGlBVFpX?=
 =?utf-8?B?dG1KZXJ6cFFueEtPWUhJK2E1UkdQTU80VmRMYkdHNC96N1VXWWd0OTJhdEU5?=
 =?utf-8?B?eENrSUVGejJ3anRlZHJFaVZmdC9jVFZqdlU5QlU4MFljNmdvRmZXMTNHMTNn?=
 =?utf-8?Q?/OioflahtuhxxbZiObjquhE46ofbCNyXj363nEd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4663e88b-6969-4003-2202-08d963a90b46
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 07:06:34.0673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N4SMa4PHNYBwEymzxfRYBvd9h3yJIJvMBY1l8jRDsQmh+xcrcIMO77FL8VYHzEMqKaGEnrxx7rHmtXd3OKN/jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5472

On 19.08.2021 14:02, Rahul Singh wrote:
> Compilation error is observed when ACPI and HAS_PCI is enabled for ARM
> architecture. Move the code under CONFIG_X86 flag to gate the code for
> ARM.

Please give at least one example of what it is that fails to compile.
What an appropriate action is depends on the nature of the error(s),
and from looking at the enclosed code I cannot easily see what it
might be that breaks for Arm.

And as suggested by Julien for the earlier patch - you will want to
re-order things such that compilation doesn't "break" in the first
place. Title and description would then want adjusting accordingly.

Jan


