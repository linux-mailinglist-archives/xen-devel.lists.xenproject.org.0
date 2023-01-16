Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB4D66C838
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 17:37:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478865.742327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHSTe-0000NY-Ba; Mon, 16 Jan 2023 16:36:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478865.742327; Mon, 16 Jan 2023 16:36:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHSTe-0000Kb-8G; Mon, 16 Jan 2023 16:36:54 +0000
Received: by outflank-mailman (input) for mailman id 478865;
 Mon, 16 Jan 2023 16:36:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SJiS=5N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pHSTc-0000KV-M4
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 16:36:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2047.outbound.protection.outlook.com [40.107.22.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9f00981-95bb-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 17:36:50 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7361.eurprd04.prod.outlook.com (2603:10a6:20b:1d2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Mon, 16 Jan
 2023 16:36:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Mon, 16 Jan 2023
 16:36:48 +0000
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
X-Inumbo-ID: f9f00981-95bb-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOfY0HTQ8rUg1f96n40RvSVfla/PQ1xU5QLlCrXbwF+BSBGtsoTRtcJ7QO6PZVzR13oBHON5z/dMRPytEhl0z3pB+XuAXDnM0u5YMrmyWXP3bh0pwoxDMFLgdgnYq8YPidN7cfzSInUA5oM1bEfS1k1W19K4EmUfdQpxbT4iGmQBWPIsBjNQlrum/uWnNceuQsbjmvJ08s2Je/Tl7dLSB42x2Rre240frawZEC69LJGrPwXmR1FMwvxa6gXYo+tgCkAaea3JwNK9j743/IRZ+dKkGMkQotpCBuZNTdG0DdvGp5HtryzxK+gFp5l+hL861O0VAZAWrmTasbDkng53Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xdH49lKk6w+lR4PnD6C6TfMo64NpFmgTwni8Ne0AeLc=;
 b=AdubrvxhjxdBVFP3gsmSL+nLZAaNzVU4/z7h+nITs2f1rEV/+hV0dztwrTkuVSX637CZxUpW/OfpK3axYODrDow9xExAz9v46Ysix19BInxcwwzzyab14ilQp0U6QFyJkymdhHH8DZ98/4ZQFu9iZNKwhYoruEoc0wzn0BhBWWOZp6W/iKLQYutwyXGy1EREq+KhI3IUgVI2ZuiCX/7WzBclp2WYgUdgSslzGmQQcWhigd4YWCb8g4brLu0o9Gjabsn1dwCNVeOjOnLP+QWtct5i63lQgurVfwYOr+FAguQiPDGPt98j+M25AnXgOC1Y+Z+SM7Unp70xS7WsX7L2kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xdH49lKk6w+lR4PnD6C6TfMo64NpFmgTwni8Ne0AeLc=;
 b=AM+aA1my0/OFt/u5Qor9adMEPy4hXTDYq362fHpFj+0MQ7S5PGj5frr3xDm+OnsPkkieKeadxltIwH/5XbhKqZSG5OmwUjoCEPKUbF60RqKgCQSDLePZtFfZiM3GBzf3agotIrQ9TpojpGUP/NKsPH+rQlXLIghGKn1A7+/vX3a/R/PZt3UyGY5jDmaYO1+w8fMqHfepcviBWbCgtjrrdW94B/+w/8xSxcWd8yMeQ8xxXYiZd4Ejf+ZRmkJKfXdTxpsdcOIiS0zunro+eyBWoLZEm6gHBnFq7ug8jOcBeL/VgdVZD/6UaS8bATMNRCJ1Vku1b2ZCIpPDJeDV2N1OeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f8018fbd-bb6e-ca2a-3c97-5d6bbbb7b0e0@suse.com>
Date: Mon, 16 Jan 2023 17:36:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/8] x86/iommu: amd_iommu_perdev_intremap is AMD-Vi
 specific
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230116070431.905594-1-burzalodowa@gmail.com>
 <20230116070431.905594-2-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230116070431.905594-2-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7361:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ccfec04-912e-48ce-04fd-08daf7dfdcd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qc9XBzk8Fy9PWGktL8KybUUzhqYUAMhnMI1orJZnDmUir5dqsYkVkm96K6u0oGVPyht27P6g5OX2oI2zUodi7FEGriEsC4mWqU1hRvbmDKChqYRhZgtrFv+EuEnkbpDYl9SzHIB8cX7ZMqVoTOxNVt9H9SLFSlyo4dt85JwhPBrWY+apqi6zC2twSEy1Y9Uy1B90gt1xVgGrIDzZLEY8/iEby1owCoiuGEuAccYvVfaCI3wX9g71O2p6mjMl/5A43pBn55mQO29SoTQGYAIDGWhSNa/qbmMm3LX6ouQIfJ4bBKh9ov78yXObWCLVJ6pkCROR7NqvXsw7nzQ56LWT+Ux+e2uwtXAcm9zM4ROebgT8rsK4zVYYaYmC0C0a35H36y16V+hqsfgT8AeiZLhdOTH6JKO7t+GJTrJgM4AD2KOEzv8wBwOXPcdQpN8wL1c7R2qaIJmuYWoGK9vAzECTpDsntbDZjl+LTAkCQbEN6jygXCWUVXPQCaavN8nBLXREWbL6BdlOipqegHiIofR/WlUoz+TwtHoZtiKrhi5CH6HcGKNHsbsef+uO62uxpc9K7Rhn0jjBnlAMBOzLbB3cGdG4OA5UIyNdx3IAK5799y33ZyJ9rVt/4YM3wJFM8yrGR3og2S19mvYddgBRQ0Bq6C5UNez21xBWtMqAg/w88A4IKMPKFPbBL0ZPifgocLOW6f6tLFJ+saHtJqq09+ZkhEhNvk8Ve6ALARAuijlmLTI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(346002)(376002)(136003)(39860400002)(451199015)(38100700002)(36756003)(86362001)(31696002)(6486002)(66946007)(66556008)(4326008)(26005)(6916009)(66476007)(8676002)(186003)(6512007)(478600001)(31686004)(54906003)(2616005)(53546011)(316002)(8936002)(41300700001)(6506007)(83380400001)(2906002)(5660300002)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjR1K3BBSDNlWVJhaXAwUWwybWRJditkbG9OaG5WaURuM2l0aWg4NTBaTnV4?=
 =?utf-8?B?cUNmTXQ0S3ZzM0ZPZ3dOam44M2YyY2E5RzB6TDJlQjhldzJHcHlaVzFUOW5F?=
 =?utf-8?B?d0pCT09UT2pBa0xKNmV1UTNrMnp0QVdSZUhnd2w5Zmh1SFQrZHFPcUMyTUF0?=
 =?utf-8?B?cWRBVHNHZWpmMkNERXJMaUQzeE5MdVVrU0d6cE41TDNvSWNtZ05aYnZVd2N1?=
 =?utf-8?B?QUV3Nnpsb0ltbjkvUE9tMVQ4SXl5YjhSMmdhdVYycFNuMzh2ZWJxUE55WFBq?=
 =?utf-8?B?NUU3Y2NjUE04Rjl0WTJJWGJUMlczV0VQWnZNY0t3bXFJWHZoaXBZYTk1MGRK?=
 =?utf-8?B?RWg1ckxxL05paGZnYWJBSUFPUEZybzJpRUJUN216cUdOT0VwMlNPWDdDWkdJ?=
 =?utf-8?B?eVJJQXZFMzA4TGpkc0VsZjFHM0k5bXBoajNkUHVMMXR2MEJNMUpldjhqeE1t?=
 =?utf-8?B?M2FVTW1mT1R4Z0JZMUlQenVjQ0dreGZPWnpWUEdEc3pOSFRPNFBOMERjaXdR?=
 =?utf-8?B?c1pHcnZUZng1Vit6VERySTVqUTJQUFowcTNGUUxHSzNaSnk0bmRud3hwNHNl?=
 =?utf-8?B?bTJBQnlFdnU1TTNFRjRpQUM4OWJnd2Fqa2F4UExlRm1aL2FYbWZTSkZwU0hl?=
 =?utf-8?B?aGVkUUUzZ3Q5bFdDMk9wTVpkY1plWTU4b3U4L1UvNGxyQ3dwOThkMkhjaVV6?=
 =?utf-8?B?MzA1aXJQLzhRb3JmNTkvZGV6MmptMm1Qc281U0xYNzU5aEJlQzh3N0cvSkxO?=
 =?utf-8?B?QlB3SVhDR1BFVGxObFNSZFltc2ZQaGtKK29hRU5DSjlBOEkzZUZCMEEveWtS?=
 =?utf-8?B?YlYwOEM0MCt2NXpkTnZPS1ozTXBLbldzcjMyTVdJajZmOXNlK2hZNldPTnI1?=
 =?utf-8?B?cTBMR29tV05wWXdVd2dXdm5hZVhyam8zTFF6MC9DNnR0QU80bWdBbS9GbHFa?=
 =?utf-8?B?UFZ2QVVNanFWOHZlQ2hnUDJGWlQ4NDJBckNuNUVRQXo2SlN4bm5Rb0ZleVhK?=
 =?utf-8?B?STIrUzF0SGVRbUJsOXZGbWJVMU5VWUpUeTBJSVlpVUgwbjl3dVRZUzUvVzFa?=
 =?utf-8?B?V25qZnV3L1pNd3IyaUFadVhnVmVUekExVmtXTCtseVYvb3pvc3BNei8rV1lD?=
 =?utf-8?B?c2t4a3lUaFYwRDJ3WHBWNXNwZngyMDU2NWxSZTIxRFZnSzI5MkpiSlRXNWVB?=
 =?utf-8?B?RkpjSW16aHhWNk9nQUpraS9lRjI2SkIraUpXN3VaQ2t4WVVUbHVqV2dsYnFQ?=
 =?utf-8?B?Y01xS1A5NWltMExwQ1BwR2ZxKzBsamdrcXg3OGZHWjRQWjd3ZXJZd2tCMlZL?=
 =?utf-8?B?Z3hGVEZhY0xOeW9zN3V4eFNyNDRFMmxDeWxHMG5LLzlLcFpBOG9McXdhSjZS?=
 =?utf-8?B?NUlVU2NMTVJtZ2pwNE9TaEhkaVVBbDdmTDhodGVpNU52UXQyRXFqbEtZODY1?=
 =?utf-8?B?NzRLYy9zeGJ0OWlwN0NNd0lhVkFIQzcvTFR4amZ5V1FkYzRVTTZvelhzY3dQ?=
 =?utf-8?B?dXlKWXIxanhJTnZHWGp2VlNvTDFkNWg5OXhrNWlKZG5wd3d0bTZZZXE3VkxZ?=
 =?utf-8?B?WHljTzVwbDhsNmtBdkZIYzZHaFNuLzdQTWRYd292UUlBbEVtU1FRUWlpbUVR?=
 =?utf-8?B?WUMzZGF4M3FOeStFWUs5M0Z5NnRya3lYN0xEclhMZ01ZbVcvSmgvTkw5cnNS?=
 =?utf-8?B?aG5JSkdPeXFESDJEZ2g0ZW1DQmVIMkFpY2NYTDBSVGh1TTNWYVEyRXNvQUZD?=
 =?utf-8?B?MlBvb3Z6Q0NCb3ViZ29aUkUxVk5DdUhJVmNrU0Y2cHlJMGFSditEOGIyRWZE?=
 =?utf-8?B?dXdVMzI3RWhNOGZ0MVloWHNHMmQwa2l0ZWdVNHRhOEt4bzVMdlBHc1dLc1Bj?=
 =?utf-8?B?RC9tTG9UeGQ3VDd4VDYvSFFRbXN0eFc1UStueE9UNnFkM1VZd3lhWHVIQzIy?=
 =?utf-8?B?NTZZK29uUitZVktpalJsYmpsNDVNTy96ZUFyR2RqaUpySzJ0ZGEwQjdEbjBa?=
 =?utf-8?B?cXVKSDRYVCtxVllKV0xEcC91YWJmUkxPeWhlUTM1cy8yWjNDQVQrUkcxdWFE?=
 =?utf-8?B?OCtRZkZZQlJySGtKVGlkUUJZU3ZreFcwRkR2MUlydWlCWU5yRXBTb0QzOTZT?=
 =?utf-8?Q?/w76bbY9iPslY5HMx4ea7KCaz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ccfec04-912e-48ce-04fd-08daf7dfdcd9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 16:36:48.3355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qQnw2wlY9hJVq1051c+uLdzQ9bL+ZBpOJAUuAP/UrDEOKO2rUfme2RZ3B3udDFhmHpYlzUa9WZkBipmWRwq5ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7361

On 16.01.2023 08:04, Xenia Ragiadakou wrote:
> Move its definition to the AMD-Vi driver and use CONFIG_AMD_IOMMU
> to guard its usage in common code.
> 
> Take the opportunity to replace bool_t with bool and 1 with true.
> 
> No functional change intended.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



