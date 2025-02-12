Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A71A32486
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 12:14:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886331.1295997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiAhI-0003kY-7S; Wed, 12 Feb 2025 11:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886331.1295997; Wed, 12 Feb 2025 11:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiAhI-0003i6-4k; Wed, 12 Feb 2025 11:14:28 +0000
Received: by outflank-mailman (input) for mailman id 886331;
 Wed, 12 Feb 2025 11:14:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UtzN=VD=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1tiAhG-0003i0-Q0
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 11:14:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20627.outbound.protection.outlook.com
 [2a01:111:f403:2612::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84041162-e932-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 12:14:24 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DB9PR03MB9757.eurprd03.prod.outlook.com (2603:10a6:10:452::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 11:14:21 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%7]) with mapi id 15.20.8445.011; Wed, 12 Feb 2025
 11:14:21 +0000
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
X-Inumbo-ID: 84041162-e932-11ef-b3ef-695165c68f79
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlybw8Tu0IoRzI05r04FkO+7ankMy5lM9GU8R74q+KG86JDati8V11kF2/8Nbq37VKIIwIXMr49RN/ri2S2m65l3e1rWsIRWlQIUy0/EvD7gbPK5Qp3CSwgvHlorgYFbt+rgrvVSl8Qr+baVuqdIA/uI1aRNvq3kko3Mo22aeCL5R/TsQJ4JCEQs9WdIXJLN2olbOpNPEEeBbOGBdNXJ6p4eE4QHuyycu/5b9IrTjy1d0Fw1V08r4/ljndABR92VEJMqhJSQvNJl6RtQf+gKGjG55u3iPqJWWf/eh2K60HL5OwjzUr3DJOmeP/FvVnh4yUQxSl5NXbN9tcyBwqJMlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hfIY02QUznaK4d6/XoO+GQlC7A/IhYOshcF2Baofbs=;
 b=QZnHuEZZmMpoBRD5qWv6TmTE2lFbWiAw88A7gY+0j8swsSTeCvNgr5iOOd6FWPa67/Zjn2uYzfkzu1EcBA/6WRYOhFs/1fW0c57saJC/avRE5ofoAMGU+F72wuTyVfL6KDhjDfZ54plPyA8ELkWxFK82tb7C3efYnzKHqXilS+hQwrWbP5pmklnMYMPde7ZORq/miaR0273yWYKtFjn6QnHehEPIuHlPm9Ce2CIKRH0I5DkYm/aqIy1Z+t9LPm5fG6WdiJP9HlG5N4RmbOc9Gd47rnmKNgZhDWLtaIjPGxgOCObJ5GgkhsyyMSM+I5uZIkqC/Yyt+lAC4i/okgxa3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hfIY02QUznaK4d6/XoO+GQlC7A/IhYOshcF2Baofbs=;
 b=QVSMoyweoxhEh9hVKb4sMilPLbv3/X3wzloS8Vi1wScnlaeTqZYJm+yZQIRjfNSs2RycnaD2zOfMQT6QEMeYx0sqou0yHVt07hMtpwkyG/MuSlz4JxcZTUyeCDFlVKOL5z+vAMSf4oNHNc3pL9+05908NSrfQh1sKYuoxr+kkbyw4DvVbXsLDSfsXbQnIZRMKjwRalrYcJEIUQUVYagcpFfKIB22Y7rVf3DCGdVx4RfYmMrDytJcVpEUP1cuDqHjT6xwqx2GHaoxwRXqhOFaCwm2lCWG9+S+2xWJbKpqwE8oBzpBoEk/cSJBHesI0r+fJfUA+TZQo9ndmssu123Mtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <65fcc449-3b15-4e14-995a-ddd3bec9f3d0@epam.com>
Date: Wed, 12 Feb 2025 13:14:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Coding Style Review and Automation
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Andrushchenko <andr2000@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>
References: <5a15f8e2-079c-405a-95ce-92585ac529cd@gmail.com>
 <alpine.DEB.2.22.394.2502111426380.619090@ubuntu-linux-20-04-desktop>
 <Z6xma27ZxfeHK6Y0@macbook.local>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <Z6xma27ZxfeHK6Y0@macbook.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0203.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::11) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DB9PR03MB9757:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ab03205-0d9b-4da2-b627-08dd4b566697
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MEEzczk1VkgyVk9OK1BhZ3phRDJLck1HK0J4Z2FVR1lhR1NJR2Rwdjd1NFpR?=
 =?utf-8?B?NVJSTmFQNkJqNXd1SHR6UEh5aEYxNHZEQ2crbDN4WG15K3doUUl0TTJFUXJV?=
 =?utf-8?B?TStOSGJ4bURna2RJRTJWU3VTQVdDVzlpL3o1ZWIzNXZLQS9XU0pxNFdHNzJO?=
 =?utf-8?B?MldYTXlmaUNkVlJZOWlxMUdQQW82MldWWlB3b0ZoUFJkd21IVnozVGY5RVp1?=
 =?utf-8?B?Ris5SUU4QmViVTBWVEtEK0h1ZXlqZDBJM2dKZE54Q2JxMGRJdjVDa3U5cTNw?=
 =?utf-8?B?cVlxWFBGdHZSUkdWbjd1cytnMFFuL2FOTmY1bHMrcmZZUE1zcVV0eWtiU3dE?=
 =?utf-8?B?dW1TNncwUTlueFd0KzY0RTVpZTVxRW9hWWttK3RXMkVDbkdCWlhzS1lqN3RL?=
 =?utf-8?B?WVZnMTBHTlJBUGFscklZeUdnVkozODg5Vkp6MHlUWTJIQkgwUDNZK2RSVU9P?=
 =?utf-8?B?K1FycmVnSkVWSGlXRDduZnlKdm9CcHJYM1U5TVhQNVkydEZ4QzBPVld0Smll?=
 =?utf-8?B?bUwrS280Ny9tbEhDVWV2UmR4cGZGQ0lUUmVKOFlyRm1FR1BUWkZVQ0xsSDJN?=
 =?utf-8?B?NFh5ZEdOYjd6WmhmTkJDWVFFUFlZY0RkbzVDMlZKV1FKMlQ1eWQwa0c0RDY5?=
 =?utf-8?B?eEg3V2dIYzBiZmpQQzl5NVZhQnhrUUJ2dWIrd3BQUmpZTmdvOXFPOWE0aTJX?=
 =?utf-8?B?OUpZOHFnMk9OaTJscFRsRlg4K1VEOGVBalMwN1piQ1VmTmhkNUhMRm5yeXhE?=
 =?utf-8?B?OTQvSEVlcEx0N0xEcW0wYXFLUFBUTjlWZGZSK2RMdHdNQ2pqb1RsVGQxc1Vv?=
 =?utf-8?B?NTl3UUgyTktVeTlEUzJudEk4MEpFRnV3N2QvYnBHSkREcXpYTlRUQmNFeE8y?=
 =?utf-8?B?dUxBWGlBTGd5bmh0ZEgzcGovT2R3TVRyVjRwT1EvaHFqd0hQQjF5cGt5Y2Zr?=
 =?utf-8?B?V0JpM1I5bWV2YkNvdmVjbWVxVzJ5RHBEdHhtWW1kTFRqdTNORkl5aUpNZXdu?=
 =?utf-8?B?UVBFVFRRTnZSa3krVHRQTzYzcXV2My9Gd3hHOXZNYVVhdnoyVnBSMjgwTnRs?=
 =?utf-8?B?K0w3ZGNhVFQvOVV3NjlvVjE3cXJRZi9mWlFLTmJEd0xqeGJBYnVZNmFPZG5O?=
 =?utf-8?B?OVltejloem9ST1F1MW9EZkdRcUJhMExxSWZScDRZVkl3UzBhbWZhS3FtTW4z?=
 =?utf-8?B?UTNtb293YnR2aGErMUJTZ2hDTjU5NlU2QzRvYkQxU0E1NkZ0SFkzZ3VKSVlm?=
 =?utf-8?B?d0NTUVVZekJ4cGYrUmdQYVJMemNBVGRvUGJQL2p0WDBYR1RQVTFjWDAyMDdP?=
 =?utf-8?B?bDNnZ25DVHFzVkJrWG1QMkk3dXoyanJHeGQ1VDJMVmVGa2VFbTNJSDhqenB2?=
 =?utf-8?B?MURZWmlMWXJsUWd1TjV3Q3g3bHVhN0cvYTE1WjdCckxzUUYyc05xUks4QVdC?=
 =?utf-8?B?NWt3UllJdkdWYVIxVlFhejhGSURBZWI1Yytqb1B1MnB0N1o1c3h3REM4bDdR?=
 =?utf-8?B?ZUxxQ2lTZzFzM2NyQkhxcGZQWDRzV2czYnEwcVI3K1Rxeis5c2FOUVN5R21q?=
 =?utf-8?B?SWtHZk9BZU12MmJrT0sxaEJOeDNYVFVIZlNmZW9hZG1ERWN5WUZLSzgzYjhx?=
 =?utf-8?B?SzR6SjJvYVNRejVuRTZTdVduZmFWZnpRN29lT2p2SHg5djZlV0ZpR0hncU5W?=
 =?utf-8?B?K1hHUGkrQ1ZYY3BQR3QrK2hnUFFocUdXdlpTdTlCcjFpdzIrcWRYUmIvbXZx?=
 =?utf-8?B?TXJwTXJibU1QaGs5b1lxOTJ4Uitqb2JTejduQm0raDlLZVJJNERIbnVtUmxv?=
 =?utf-8?B?SzV5NTRRSzhqQkd0OHBQNFZLcmo5Y1NxTERXM2dBaWJLRUxlOUYyY3MvUmcw?=
 =?utf-8?Q?9VaMQhkmto0q4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnJKbjJ2MzdkRkwrRmVwbmRLOTdSMzFTSHMzQjNHcGcwVkhaYm5ZRllLd29R?=
 =?utf-8?B?dS9mNGY0KzA5YkJSUzVuTzdyMjhseFNUcVZtMU1OVGRzL25CWEo4WGFVZTJk?=
 =?utf-8?B?TmpwYU50aldQNTlNODAzNUlkVEJGRW93TzNjbkFFZXRKR0V5MXFLVkRuL3hL?=
 =?utf-8?B?Y3FoSU9ZTnJUOTV4aHl5RDVmYUtqUzl6NlpzWHIySUgzN2Y4Z1FJanorMnZJ?=
 =?utf-8?B?aE0vTERuNzJtcWpDSlgrS3lGak9VdkxKSXpsTU5OdlN3eUZvQXlhNi9UVVVF?=
 =?utf-8?B?cmxaaGVadllVdElwa0pRcllEMjJ4TXhjcVNWbmx4ZmhJWEtyWis2OHNNc0Rh?=
 =?utf-8?B?dWNkTU1tMTV4bmNubktyZmdVUStHTk5zaEdTc3lBR2lIL2lzalhrekE4cHNr?=
 =?utf-8?B?aDFMb0tjNERJTk1PbjQvbWlMdEx4b2N3WlIvcGl4aVdQaDRXMVlNdHN1MVBY?=
 =?utf-8?B?eDFpMWVTMTZ3bXpPUTc4VTRnUGY0b1J2OWdWTGlyRDFtRmFvYWw5WlJrUVpv?=
 =?utf-8?B?dWZNeFl0Y2RHdDlFNnJSeG9GNFlxalAxM1dsZGdodVE0VVVYVjRJUzdnVThp?=
 =?utf-8?B?TllyQmE0c24vQThQSEdFRDlKa0czSTVoNWNZYUxDSTZ6TTNNdW0wTXl4emF3?=
 =?utf-8?B?UDdrVjJ3S1dmYUVwQTZIMHZnOWFUcTdFNldPazM1VUdVQjlaQkpKL1FWcVpt?=
 =?utf-8?B?SVVsaDdQVlJ5Q3ozeE9nNUlIUHA3Mndnejd2S3dQSnRGUzhaQkhkMGpTNllU?=
 =?utf-8?B?bXdaUEh2Nk85SFNveXI4U3Y4aUw4UDduM3VmVEJ4YWQ1Z0YxMTJFREJPcHIy?=
 =?utf-8?B?VzBybFU4U0hhNStLMEpKUHZLZUZIQW9wNHdleFA0clowZVROWWphUThXUXFC?=
 =?utf-8?B?bDN4SzdOZHdocjRUNVFQR01nOWhleVVNbS9BWmo3bUl5eno5dVhJUUVQY2k1?=
 =?utf-8?B?MlJhUUozZi9MdFAwcE5DcmxkSFpOZzVwTnBNYmNFd2RpdEhhRWN3TklhUnhh?=
 =?utf-8?B?THVKYzlUTyt0YXdycWFBa051UVhQdUEyUkRLRjlOYnBTb2hGUTFnNk14MTNz?=
 =?utf-8?B?emRUM2sxbnRnQU1qNkhKTWNqd0FXSlExaWJsVUhEbEpPblk5TEY1MTh5QXJQ?=
 =?utf-8?B?YjZWMGZ0ZU9lNnVjMzFsdjVIMXJBMDNxd1VXd0ZSalVuaTlLdCtSZE9jVlpZ?=
 =?utf-8?B?ZWFkMDRoTTFYS1VQb1pra2YwdjI0UjI2b1RRdTJUUFRjYU1jQWJXUi9iSXZx?=
 =?utf-8?B?UUEyUGhUTHg1ekZ3MHJ3dFg1bjlhMk9SbVJKWldhUVN0NzZKVUhuU3duck5p?=
 =?utf-8?B?VkN3aEVRQm8zRHhKd2svN0NFd0VvQTFoN1lKMmFRekVpRTMrRTIwYVl5TkNH?=
 =?utf-8?B?MUpnbkJBak0xeHMva0p6R3NTRjVsT0Ywb2N4NUl4QlUzZWVRVjhRVHdjU0kw?=
 =?utf-8?B?RExEZjNwbmt6WHdhblJGcUhSZjhPSnNML2xkdmxGQy9nY2E5cG8rUko3N1VE?=
 =?utf-8?B?ZXFrWjcyREtDMWlRVld2LzRSc3NUNVJRT2lOa0Zkend6ZVJHeFJ0eDNNblFj?=
 =?utf-8?B?Qy8xZktzRm0vZW1PLzlHZ3V5TnJaQWJ6UmZNRERJcFJGeENzaFRycE1aWVMz?=
 =?utf-8?B?MEFjbEpwVTZjSi9OOVdGN29GS2xIamdWeFo4OG9wS0thMWxqcmhVMnkvaW1Y?=
 =?utf-8?B?V3dDbVJaUk52Vmg1NjZ1QVdnb0ltd013RDB6VkdZQWZXNjc1dDdCZHMyclpa?=
 =?utf-8?B?T0VzWE9PY2wxMXkwR1FEbkM2akg1ZFhLSTlNd1BpRzVTcTkvQlVoVnZtbkY2?=
 =?utf-8?B?VWluUU1vcnZQQThBNDg3REU1dFJKY1V2MG1GSE1kMWpJU1FEUFFkTSttdWRY?=
 =?utf-8?B?WFFadStiZ0VoNGcvVkRnMm1qYWwxczh4ZGxrcWluUVFCVU9vQWsyaTBPTnFm?=
 =?utf-8?B?cVNyWm51MEVsYXRJYUtZREVZK0lEd2JlcGdYdmdCWTFmdTRUK2MrSE5oaDlB?=
 =?utf-8?B?Qjh4WnRHRXY1dk15REpSMm9jYXlEWHJYUkI0UlBCUTd3ZnhvYlQzZWNlUUtp?=
 =?utf-8?B?SVpPUEhQdkNhZEdMVmRtSHZhRWJCT2xxNzdJc3dNUFFGZjJVaDhIMUpEc1NE?=
 =?utf-8?B?NUJpbVY0b1M1TGZNa1ZJd3dtaCtIY2d0c09ZdDZ1bU5hT3BGcXRRUk45NUEx?=
 =?utf-8?B?T1E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab03205-0d9b-4da2-b627-08dd4b566697
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 11:14:21.8023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L2BQ51vIQPmVmbTnp6V0X7hgmlJv2E6OcacdpvaeG0xgRT60efDCsdbuvuYau43yvli6cKhhdL58/N8d2JVEtn+aATAFI+wokWLG30RYClg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9757

Hi

On 12.02.25 11:14, Roger Pau Monné wrote:
> On Tue, Feb 11, 2025 at 02:33:08PM -0800, Stefano Stabellini wrote:
>> Hi Oleksandr,
>>
>> This morning, we had a discussion among maintainers, and the suggested
>> approach moving forward is as follows:
>>
>> - First, it would be helpful to see a sample of the proposed changes
>>    applied to a single source file as an example. If you could provide
>>    such a patch, it would help advance the discussion.
>>
>> - If the changes are acceptable, we need to properly document the new
>>    coding style in xen.git. If not, we will need to iterate again. We may
>>    also need to add a "xen" template to clang-format.
>>
>> - Once finalized, we will proceed by making changes to the Xen source
>>    code piece by piece, as you suggested, rather than applying a single
>>    large patch.
> 
> No objections, just wandering myself whether it was considered to
> initially only apply the new style to new chunks of code?  Using
> `git-clang-format` or similar as suggested by Anthony.
> 
> Is the adjusted style expected to be too different from the current
> one as such approach would lead to hard to read code due to the mixed
> styles?

Sorry for may be dumb question, but wouldn't it be reasonable to consider
adding just .clang-format specification to the Xen code base without
automation features?

For example, I've downloaded .clang-format from [1] and using it with my editor
which supports clang-format integration. So, I can just select chunk of code and
do auto-format on it. It speed ups my work very much and results make me happy more
than 90% of the times.

So, it would be nice to have it out of the box while cloning Xen code instead
of searching for it, even if it's not perfect for now.

Unhappy: it's probably "known" things - identification of complex defines and
static struct/arrays declarations.

For example original code:
DT_DEVICE_START(ipmmu, "Renesas IPMMU-VMSA", DEVICE_IOMMU)
     .dt_match = ipmmu_dt_match,
     .init = ipmmu_init,
DT_DEVICE_END

And after auto format (me, personally, unhappy):
DT_DEVICE_START(ipmmu, "Renesas IPMMU-VMSA", DEVICE_IOMMU)
     .dt_match = ipmmu_dt_match, .init = ipmmu_init,
DT_DEVICE_END

Best regards,
-grygorii

