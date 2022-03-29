Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF364EAA1C
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 11:07:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295734.503354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ7oF-00046u-VS; Tue, 29 Mar 2022 09:06:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295734.503354; Tue, 29 Mar 2022 09:06:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ7oF-00044Q-S9; Tue, 29 Mar 2022 09:06:39 +0000
Received: by outflank-mailman (input) for mailman id 295734;
 Tue, 29 Mar 2022 09:06:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kdRh=UI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZ7oF-00044K-3H
 for xen-devel@lists.xenproject.org; Tue, 29 Mar 2022 09:06:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a246f57-af3f-11ec-a405-831a346695d4;
 Tue, 29 Mar 2022 11:06:38 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-sthdSA3LOe-kC67W6xfuxA-1; Tue, 29 Mar 2022 11:06:34 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB4148.eurprd04.prod.outlook.com (2603:10a6:208:5f::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.23; Tue, 29 Mar
 2022 09:06:32 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 09:06:32 +0000
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
X-Inumbo-ID: 8a246f57-af3f-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648544797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NczOJ8uNRrGfdvQ0qCNkYsZdURpk9LmRZrtaxHOYxYw=;
	b=WBxSdBJuj6lL8Yuwp7OEu0azVhtBIPFoi0taghiAwY1mL1T68bjA6aBuuDDgeGQx9l3zI0
	cLmUcdZo3V7feYnfHgGWR0I2+twG+u+s99v/mvjwv1D2FLr0fYFJeHTMcwwN1czeAfAFLX
	QoSAnt/ovPAVAFYU1DeygwuajSWHxDk=
X-MC-Unique: sthdSA3LOe-kC67W6xfuxA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMeBDzYnfp+S4lY+zRuuAFbX8bqZcsSBa1o6UVWulzFTZN1LFCM95GGSV8Lxdu3yf7Ak4hSfPWBOPmphui7Lo2WV7bRldXHdvuR5s5D5rlIdMZCZ8wXIn4TbRaejtiM+bLtVKaLhl8zbchdfLubgW9cAbBoH1PveDktzCLjLaIlR7qwNbRh4m2mV9YzN60T/IXEX5y6s8jVNINOMZTvzCUTO7OmeOCZccbDI0JoSTdUWwpzM+qVgwRRpNN+HaVPCvJPduIoVInRp8tpgcDFTXU+xZ8ZecbK08p+6tI9RKjCRq88BsxP20ThttCDr9NJC0CeZoI0aMl15KbFQqaPJNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NczOJ8uNRrGfdvQ0qCNkYsZdURpk9LmRZrtaxHOYxYw=;
 b=a4g6oaARxAlwUClWe1cgfi/JX6NMNYkYBjh7xBrkwsmnZWvp2uWqHYvi+1HzDB3zgPIGdKimLbKxMiczxUon5j25dPhBtbrV1qG5ttnBoni6NxCRZtCX4UgW4J6AKPdwIvGT6TyakndvIOLtfKnzlShzI9AXzyouAquBvHI4fwtW0ysXNlXcdfs8vaY9Ic2IGOkkQtj+lcUUFqUueW5zhRAcqDAvfVK7pL+hM92EvTp04DYpEXphkv5tCh0F3NLEyV++5dNk2FvtS4K4fj0JXk24cAB+85AILrKOSlKonHDynqLSuSu2SqQqlTJ7ozW4EMXyQqQ21lsRIJkQKCZDAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8082fa7e-3c3d-245a-5064-d562df196b65@suse.com>
Date: Tue, 29 Mar 2022 11:06:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] xen: Introduce a header to store common linker
 scripts content
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220322080233.53134-1-michal.orzel@arm.com>
 <20220322080233.53134-2-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220322080233.53134-2-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0005.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::17) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a9b8240-5139-47a4-676c-08da11636b22
X-MS-TrafficTypeDiagnostic: AM0PR04MB4148:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4148DA028DCB025EF9DD78ADB31E9@AM0PR04MB4148.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1o/9FNkA7MfgdbailaUxisai2l0FfAmZ0K9FE81Rxm3GL4VpJGJQlmvEI9iCS/HHGIQQcebDVIiDv3T7g8ZAiMWos48MmSUb2aM2rcHhDio0h6jteOdXad3flKcxdAQ29/hlwT7A/WGB3J13T98Wfrz6KLr7Tffi0nLZUXq0oqoCVenZvQvre/XAcUUjuTdqWA/i32yZ8magYndHt82Wy4h9bbogjxHaDDLQ8wzi0jKu5zxwKAHVcu1hg0JtQGfFJV4jpNwnX4MBv/7J/pLdzDlBhhfUElSKvTel8VciFw/QipcVWfcFoOlY1FChXYmOMjgUnC0+G/Ep4e9u0MlzmI6NYF6vSBYXyj0jj1TAOYqNCoZP7sce9i0GfoLglu0zvo50wNJTNY+s9a3WR22XUsGZRA8r5HSUBm+bKOYf9kQIIp5TKNYc29EAp16wSq3elndaCp/uLVFTlohvses+l4QUW0ru7BLgWWTquVJSaUTUytL1gDBllbN219VDOihn2St9NxbYaKUHTlz+E/OAekM+CPF/mTLnLrSNFKdXJp/k4P/w/zp/gAc23WOQE0FNhz7Tb7p2LfD+zTw2rPo1pc+/FGVvNMtdOyU5hEgt3ocvxl0Q6QLaRyHUqzCkn8a1wVpbCzcBXzM3fKD46nsFj+OJ1AWWgABrUW2DhZNNzqaRcrNnV+SuWQ9zXH9Y+XTEI5OpJL5eHpQ0BkbtJFoClUuH3KH5UNxIP0Qok4GGPos=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(31686004)(36756003)(6512007)(316002)(38100700002)(53546011)(2906002)(508600001)(6486002)(5660300002)(86362001)(186003)(4744005)(2616005)(7416002)(4326008)(8676002)(31696002)(6506007)(6916009)(54906003)(66556008)(26005)(66946007)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzlBR1k0VjcwcExHS3BRcTAwdE9aMXpFZVNuanQzYnA5czROOWZzV1JSeFFO?=
 =?utf-8?B?elVjOXVoeFRLN1FodG1UMFNkY20rdDBDOExxVTBVNWs2N1FCa2xmTHhERFZO?=
 =?utf-8?B?VVlJMjRxVmFINVNZQU9LYjBkbVhHZHFqV09VaFB6SkE3TkgwMkpMUlA0MDhz?=
 =?utf-8?B?c0ZKd0tvNk56TVh4RWVENDRGQ2JYbGpMQkJqNFJjaEFTZHUwVlNhMTBIMEZu?=
 =?utf-8?B?WDYyYkwzT1E3N0cwb3lwRXlFU3Z2UFh5aFdNSElhYk1IaUZBOHcxUGJrZURw?=
 =?utf-8?B?NlZaTWl1VHhya2gyblRVWGVkWnJEL3dGRmg5VW44TUtaT0xmVlJiZzZ6THpa?=
 =?utf-8?B?cG0ySUVBWUk4RVZxTlFhMTZrY3htZCttWDN3YjZuTlFuQ205U2plMHFiM3Fu?=
 =?utf-8?B?K1FsYSs0RXQ5cVByYkhadjJYNldUbHFva25hSlRlNUVoaFdsMzd1OUlKbVJn?=
 =?utf-8?B?VXFSQ1RTVXY4YlVnNTNkeEpNU0xiMmp1bHNRR0crTUdjTW1kakxOekNEZzVD?=
 =?utf-8?B?SkRkWkh2dGxtOHVXTHBWRWdaQmcwOW5nUEViNHZ2dVFjclVpTmdwY2F2M0JC?=
 =?utf-8?B?U2tyd2hGWFNNSHpJdVE2SHBybWVIRVlxT3lNc0hCcmREdHN0b2hFRmFXOGJw?=
 =?utf-8?B?VE10S3NCQTdOc3creDZIRVRUN3FERDZ2MUVrYmI5SWtaRG1ObzV3V2FreWQ5?=
 =?utf-8?B?NFhKMXV5QW5UMEpld2dXL21PTkdRN2R6dFQwdDZsSG1xcGZTVnVTUjdFS3BL?=
 =?utf-8?B?YlhRbmZkQ0pRMkUwTGJKOVJYLzZWRkhOcmNFd1B4Y2xnZTAxNWdQZ1pIdDlB?=
 =?utf-8?B?enZWcFZ6aWY3RWNXeGhTTTBOL1RMbVZiaGM2NXJzVjk3VUR6Rk9WU3JiZ2NW?=
 =?utf-8?B?d1JXNHFyRTFtMjZPY29Qb3o3dTl4SXo5K2tZV0dieGk4RW5rRFdJZUJDVkhD?=
 =?utf-8?B?WmkySGtZSHlhM2lJMnM1OUdycDBLUEthS1NraVFBRFY5dVRhYncxSFNzOHFn?=
 =?utf-8?B?V0E1a3REQUZRaTBlRHVLTmFSOWxmck1tODcrMDRqeGE2K0pCVzV4QW9HOS8y?=
 =?utf-8?B?aGE3Rm5RVkFhZTQzUnY0MHNWdUpSR0dCc2p6UktlWVlFM0pBdHdFMlB2eTRH?=
 =?utf-8?B?R1czLzQyakh0bGtRR0lTc3JKbG11WkxBTTNZUU43emxsY3ZXNk5NTzNlTHQz?=
 =?utf-8?B?bGJWYlFIVVBLRXJGTTRCVzZrQVpyNFZ6MFBjQThrUUF4NzNwL050bXBjVzhw?=
 =?utf-8?B?ZXZFMVBFQnd1NFl4TkZMdFIrYnphR0FPRHRVQi9HaXVSVkw3SjJ3WnhXNWZt?=
 =?utf-8?B?eGtVYkkxb0RkcXhNTnVPdFBJd3h2V1RiNnYwMVNaaGwwSlpwTXlkaDVoY1lv?=
 =?utf-8?B?MVRlMkpLbncvak9IMEw4Z1ZoUnMwTldkaWVVZ3MxTnJvWnJKc28xOFc1bW5t?=
 =?utf-8?B?ZVk5RHUvVFhGMXpCYlJ5aWc5aVVOWG9hL0p5bHQ1cGxJQ1p0NXUyV1J0NWNQ?=
 =?utf-8?B?SU9kbzNxc3d5MDBTT01ubzFhU3o4TGZmNGtMaDJvRmFTNGdNeEVTWkZaWEtl?=
 =?utf-8?B?VVpNc2g4NWJCZDhTOWNlVlZkNXU2UDVTTkFvN0ZmS2ZqRjJOR1NIZ0F6N214?=
 =?utf-8?B?VUwxT0kxem9xY3JtbVEzRlVPNm0yOVpHTkprNXZvQzdUREl2eGt6aFl4TEdt?=
 =?utf-8?B?ZTZaUGIvb2I4MXhUN1E2MzJ3aVJpTEp2d1RqcmZHazR4aTFVQXp6NzlIR2lp?=
 =?utf-8?B?TzcwTHF2M29Gc2ZicFpiVTEySGx5U0RIVHd0L1JGNkE1WEFXWXVtMEtoSlh0?=
 =?utf-8?B?d2k5N3FGUkpLVU9kdjhldXQyMzRZL0tBRytXV3diV2VhN2lGVzZ5cDZZU1pi?=
 =?utf-8?B?RjNmN0FnRTBkQW93c0Yvek9ZRTlLWWFyUWsxTTNkUkdERk5iSmZkd1RZM1dI?=
 =?utf-8?B?Vmd5RDVXQnppcUphV3pNUDVLTnJuak5EM1Z0RkwwcHo2ZnQrbkhMYmVOS2tw?=
 =?utf-8?B?YlFrOEJjUHhyZkN6L091dGZBZUlQeHI2cG1ZOGdvSGt2N3NYb1I2Z1RtU2lG?=
 =?utf-8?B?YXdmK1UvMTNIVzV3ZmJBY2xFbmowV1dialhYNFBkVXpxS1FQYlY5dVZCdXZX?=
 =?utf-8?B?RXVjeFFSMUJmekFCdzc0NVU2aHowczZlZmlkKzlrdUtSK3ZVT3NXSEpsdEto?=
 =?utf-8?B?cDRQRHlGY1R2WC9jWkltV1ZlL0RiWHI1NENKMm1iNFN2SFpvQXlZeHo2TSta?=
 =?utf-8?B?Z1lYWWpMMlFtV2hQWFBHa1NCZlFBR21DRUY1MmpJczRVVHc0Snpod0FBNEI0?=
 =?utf-8?B?Yi9zVXc1RlN4YUZBQ3RXM3BSQ0ZIUXhGQ2h3YzBPVlFYVitPc1NyZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a9b8240-5139-47a4-676c-08da11636b22
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 09:06:32.5384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HdxBNI4cLn5u/atV34jOldfV51wkUeNa5xLAgYjuU1iENUAOit28jb3guMLgJW8e864vFhFStUPChSjXSqZUPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4148

On 22.03.2022 09:02, Michal Orzel wrote:
> Both x86 and arm linker scripts share quite a lot of common content.
> It is difficult to keep syncing them up, thus introduce a new header
> in include/xen called xen.lds.h to store the internals mutual to all
> the linker scripts.
> 
> Include this header in linker scripts for x86 and arm.
> This patch serves as an intermediate step before populating xen.lds.h
> and making use of its content in the linker scripts later on.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


