Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B947765E98E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 12:11:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471807.731813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDO9E-0008FC-Hd; Thu, 05 Jan 2023 11:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471807.731813; Thu, 05 Jan 2023 11:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDO9E-0008DG-Em; Thu, 05 Jan 2023 11:11:00 +0000
Received: by outflank-mailman (input) for mailman id 471807;
 Thu, 05 Jan 2023 11:10:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lIpW=5C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDO9C-0008D0-Ns
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 11:10:58 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2080.outbound.protection.outlook.com [40.107.249.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0e0defa-8ce9-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 12:10:57 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6929.eurprd04.prod.outlook.com (2603:10a6:208:181::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 11:10:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 11:10:56 +0000
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
X-Inumbo-ID: a0e0defa-8ce9-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWZoSVZvVS+yUg0EpG/vMUAWdVh7Qo1rQaUII+hhTEbOZzXd40K+Xfg1Bsb2St6lhcHH+X3KuvXCBVu9lk7DgMwvPua9effvt/RTqnGYzkEm/4dpJfA4tyMi1euxjP3jSMAO2k9tbIYnUZje0xREeiJfFMo93SMDuOXes9+Zr6DrAj75wvJRFhrtiQ0HrtY9iEeOccAJE4zpTFjLu/CNFLMAItB+HCl7xZSb11DEkkw1Ne5ubIwEihcMG/mp9f5Lvzfk7ZniUDKF9T1vf+7wUW2uBGMcS6EccPQgFizn4yV/CoF+NqDxyHlARI/OlsUl/fb6W25l165lsjRMKklPgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUugKwc+XLh8jVo+BdOIcApbl8H5L6XGAwjWzprilPQ=;
 b=MK31eb6SjI/yXHQ26o2U1qacXuWd5JhoFc+O3P3VcrwrmUMCgrCaQ8C4CucMhl4UZfUNo6FbH8EC+hzVC+OttvKYU/PQRA7hKkOj+Vm+ZlJGZs3imAxSQEnPgFu8O1hUydvafIIqbSem/RlN+Y3+r3s2xmUT/26oSWJyLQTXeiVJ6Cx9HI8e7i5o45tfKpK+MwSVsskFLiMoOk0c2WfxeI2XJfanVEOEHwMgJybc0lvPLnO56KbxG16peR8uM5p/W+MVtWriRIJwm9IDFF5aYhZT4sYerbEb8ZZJBekDb9grUxTuR8U3rJmzkXc82e5qspT0ZggBMV1MLyQIAt0XtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUugKwc+XLh8jVo+BdOIcApbl8H5L6XGAwjWzprilPQ=;
 b=ODjQ5kewyuCXTJX3CKR0265bER3XIRcv/DPSRzYl7EGk0lOdTTUJZDI1mq2OhZRxxfoIQdG/BD1OXGjMOmvD8Uo8tYdW6O++q4Ea+hbbA/rxPU026cldN8SJJa91C1Qn6urKZ0V+QbIRu31t4xp0aaO08YVAfeCQYos+6oxUTqIjHcUBilTjLMI7TG7Yb8+ILUTVcRYtYNsrJO0vkULDtCiM+cTD4PAxtQRiW6Dhh4Wk/XGXl/9g6hfev+KHjwsbgZL00wEqkGVjX/22NjLb0AYu/tMqt0jDgGkjzmI3EWzNcU5ovFY0CbVYIrC42m4czmz/GSXTYiFsD19N2C4M3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ae3f21f6-6a66-2fe5-9d4a-3f93e6dd64d7@suse.com>
Date: Thu, 5 Jan 2023 12:10:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86: adjustments to .fixup section handling
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: 516afa8e-5c22-4e95-a115-08daef0d8429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	moD69y5FSppqjtD+p6wntZ4D4cgsMjR4/ZGuXCAKFyPUm4zo6hCJm+cQdOgMxrL9PvXtXyAUW1WBSQINJJZ1Z8PIBz9IXQ/EWZkXCyDiJOY5OnJTw7FJM6/n+NQ7COS4tHvtmVNHczCG+Sp+ynHE3jiMWo+tdjOkp3lYaxKRdJlGL/cfNPi/bwX3hr/+R22lR9/xnJV8eS+vkYjPJ2qU0O4c3fNXRm4AQpPbLt6MVjuABCMkISikg5a+Ov+rMbvPGsjnRRftdkUUVQho3RJxwJw34brRD3PuWpzdxQM4AQZgtbWAb+bZcGYpnH0HEU06t0gGcQATQ7lTqZwalq8ZfhFJgNuPUOh1637ibw0rmur04wsoKdRZKl51pY0tWZactzgsvzrTzAITcPgXqt84YGEsyD3aEZfjzawbYaKpsSQMWEW3CJ+UZuJVJWFCiRP0Q2RdIG9BBUOas24+6FqaFxnu3/sXO8u4yzGDHw6ti4M382aEXt4qCvdyNSO9s+tVnhG+KsHD03FyB90+pESdHMPPhJDv/z/YYwWrF+PUJOxJtWfLRT2lJCgAcD7KvD6ZgMZRgyLXrP8hkuAwDuIBvjCzmLFu6KTetjT8VDNdz5D37I3IVuNGGDOrx8qYsq4qGfeHGKb9OqqwPVrXLKwRQx+1q5IuTNbpMwt/WcbjO0UaDi6b2DuliquwfatbTOADfpPu0VZ1TLvyt84VThp5xQTWdvd/9WhA5oSrOOn/P4j1RIKy1yrV4AM9NMU4W11F
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199015)(31686004)(5660300002)(316002)(8676002)(54906003)(6916009)(2906002)(41300700001)(4326008)(66556008)(66476007)(8936002)(66946007)(6486002)(6506007)(478600001)(36756003)(186003)(86362001)(26005)(2616005)(6512007)(558084003)(31696002)(38100700002)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmZsWFRXVXRwNXpUWDVUL25DdDVoQTRkakNXc25TMEhHSEVZb2RDNkJUSjgw?=
 =?utf-8?B?YUE0RWdidnFxb0JERkFxTGtUZUtFU0tXMFh0QzMrWisvQkVQcndDRWlVenRI?=
 =?utf-8?B?NHBQTWQwR3E1dHFlSk1ZTHVSN2hQZlJrcVhaNFlVbGlMbjl5c0JyRjJEQ0dX?=
 =?utf-8?B?alV0VnV3YVgwTGt5SERqaXh3ZXhiVHd1NmducXR0ZXVONEQ0QVFnSktvR1I4?=
 =?utf-8?B?QXF3aXJZUHZTRTVYV2c3d2lNbDhEamwzbzB3ZHErb1NPMFkxbkhiRzhnWmN5?=
 =?utf-8?B?VFBSL1dja3ZKZFk2MWR4S3hNdThRWUEvSE5BeVV3Rkg4Zm5Pc29ONWNtRHYy?=
 =?utf-8?B?ZXlGeVI0YTkyTzc5QlFERGMxUWZ5TklxNTFrREgzcUwyTTJDaHFYOTQyRDEv?=
 =?utf-8?B?eW1NRzEyNjU2TmZ3SnR0RVhhdkNiMTdUWDl1SWtTVkJiOEZoNWpYTHJhOVA5?=
 =?utf-8?B?NUZLZnVUS2VQRXd0MnBLWW5nTlQ4MGU5eE9FZjdJZXdoZklNeWhkZnc0MU1Q?=
 =?utf-8?B?eXk2Zm1jSHpobzAvQ2RtcUVsaFRPOXNRZ29pckJvVU9ES1pncFllT0ljL2hC?=
 =?utf-8?B?RHZrdXo4WkdnY2JkU3c4WDUwUi9oVVk3WTNjckNyWlo5blRGNzFraEJIaGZP?=
 =?utf-8?B?TnptNnQvNEt0dlRmSlZsQmZUUk9xcTlwN1hmN1M4OVZWcUtqVVFJOUZXOHFF?=
 =?utf-8?B?dEhWV1pRcElXYllpZi9NZERkc3lLWTZMWDRvdm9RV05sTGFTK1gwM2hFcVNa?=
 =?utf-8?B?RjA4YWlDbHNzZ2JwMGw4N21EZ0RJN0M1eU1NUVNLNjhDVkVPbmdPWG00dVpD?=
 =?utf-8?B?alpmdGNpWEl4Nmozc0FHeWhOUFpTQndqaG5iRWcxbndWa2VrZ2JCdE10Z0FG?=
 =?utf-8?B?TldudHR5N21HUXdIMzF2MzVtNVlHdjNhRnlxblFKQnJUWGU1RGhOWWdsWFha?=
 =?utf-8?B?dlU0YmxtUHErU0EvSkk2eUZ1UjNGZEk3dU1XNzJ0UVpndzhuQXFGcEZKRUFS?=
 =?utf-8?B?UjVHRFhRbUxsa2dBR1BmU0ZuVDJkbEpLRzNpcUhxNUxiUjc2OFBKZS9Udkdr?=
 =?utf-8?B?a0ppVnhZcUFNOVFnemR1OXhkUDN4Q2JKWTdJa2V0UGZOTW1EU2pXVHhaR3Y5?=
 =?utf-8?B?Zy8yUEU2TWVZK2F5eUI4QVBCZmdXWHRhTVJPYkNSRWZuNGNGNTZiMWxEQkw5?=
 =?utf-8?B?L1VDd0dpRXQwc3NmMnFqaXh2QmQ3TTVpM0tJMndGcGFnUFAzOTVObVM2SWM4?=
 =?utf-8?B?THJ2eE1Md2Qrdkc3THB5eDFxaGdUMWFQZitTeHV5RHNZdHJWSjBId01aQ2p1?=
 =?utf-8?B?QVloeEkyT2YxaFZBZ25PSVh4VzhSTzIrSkVxQ0dqTjJEWFlWSU9XRHRvczlB?=
 =?utf-8?B?WWh6S3F5endxMmFaRFN0WmRjbTJCT0xMaVFWYWZEWE8zNDluWjRDb1JkcE5q?=
 =?utf-8?B?bFhFazFCYkI2V3ZBMHZPTERyNlFLa1g4U25FMWQvV1RSc3I0eTMwanltQzFl?=
 =?utf-8?B?UnJXcnV5dmZteXJZZzZzRStGTVRlMkp2NThaOE4wV2U4eFRKbEFmQWl1bmRi?=
 =?utf-8?B?ejJHU2tNWWVlSTErK051TzdCb0dIT1FyNkpXYmF0L1NLR2VucU1TdWhiTGU2?=
 =?utf-8?B?ZDQ3dlB6NUZEK011V1hNdVdoS0VFWTFVZEE1TlZUenRsL1BoRVlFanBNRzZI?=
 =?utf-8?B?SVhwZFIyQWFlYUl0YzJEYkhuOVlxeWVIMlBRcC9zaE9SZ25rUjVoUXEvZW1s?=
 =?utf-8?B?Q1pRL3VoVnRPcmhHdmRqSTV2cytRNmhFdVZGRG82OW9tcU51ZEt5VG1NU2Yz?=
 =?utf-8?B?aEVUMWFLR3VhOE9yNm9CZzFCQ2VlM2xrN2ljd2VDd0xGUWI4OTlnc3lCdm9Y?=
 =?utf-8?B?QkozT0JrV0J3ZVdQcDRNS1JJeEJvaHEwenA5Mk1rSFR1L0JWRHJackRsYnZu?=
 =?utf-8?B?Y0toZkJhM05td2tDb0t2MTdlQ1JSbGdqd0RDeFVLWTR4R3piRll3NVhvRVV2?=
 =?utf-8?B?Q2J3S29ZUHJrZWpSQ1FwczFjZmlvK0dVaDVIekFSSFh3U2JBWXluS3RIWldz?=
 =?utf-8?B?WEk5RzNEdHdBc0taenhaMVV4dGFJSnJJUlVFenVlWTAxeStaNlVNNElsZkhx?=
 =?utf-8?Q?k0EFqKPS1sI9A/UY9e7AvviqR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 516afa8e-5c22-4e95-a115-08daef0d8429
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 11:10:56.0092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: padRoTB60SLNRoV3a9fmw9Zx70KJNpLIH6RdmH90E4ma+DKGhHbt/ybxFqKBIQbdgO/kIm++gEWMzdY8YaXtMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6929

1: macroize switches to/from .fixup section
2: split .fixup section with new enough gas

Jan

