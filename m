Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 086C1AD1A61
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jun 2025 11:17:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010178.1388334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOYcn-0007wk-Ju; Mon, 09 Jun 2025 09:17:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010178.1388334; Mon, 09 Jun 2025 09:17:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOYcn-0007v8-GV; Mon, 09 Jun 2025 09:17:01 +0000
Received: by outflank-mailman (input) for mailman id 1010178;
 Mon, 09 Jun 2025 09:17:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Wg0=YY=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uOYcm-0007hF-CX
 for xen-devel@lists.xenproject.org; Mon, 09 Jun 2025 09:17:00 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20611.outbound.protection.outlook.com
 [2a01:111:f403:2405::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7bef1e63-4512-11f0-b894-0df219b8e170;
 Mon, 09 Jun 2025 11:16:55 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SN7PR12MB7348.namprd12.prod.outlook.com (2603:10b6:806:29b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.42; Mon, 9 Jun
 2025 09:16:51 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8792.035; Mon, 9 Jun 2025
 09:16:51 +0000
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
X-Inumbo-ID: 7bef1e63-4512-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGqsXG/HUGFv5Y2N4sDF0OwEMjWEUfYmNCmVx2JVQsuikg0P9BJrTVdD0nUdb8sCEqoQd7E3in7hh+2kbutc7myw69GKLf8BGHys3cN/7XV9IVq7Fsmg/p2TRaRGrbLSxWyVLz7HRnqNI5ZvLrKrmciKpkM6LFJ+MtSStAbflEhXcATBeDC8TWV40V7yZ8yiBWiwARW0s46b/3XnURtfJCFLY3Z5765IWfeXy0SdkEaGIWPu+AyFwAouQNmgAHlnBNmr14K6L81Dv9qINgvXxr/Xe0NQZ5R5DxkplU2AHgeNYXsQRcSOXVZdPz0TGHaIC0m+gOBkf4H3BlmoZKibtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Brup6HiEi6MvCymS0nURt6bPUnMSK4zX0JwNbDIjnig=;
 b=yJ4xBF9f7Io9ekHNUEikV7Y0mkWit0kxX/UgozBafCfXofLLjny6r+wsNlUAs4uN7SljTEgkb6YRi0N3qFMvRu31cb9qp/Zc9o/AGwrieh4KPGZdmnz6Y4j5aQptnTqpEst+tFrJmWIA9INTBPqoKGKSO6NEl+mKIO5+4zatowXnahAbRoQtuDY3G4acgs0Jzx9IKTMYUuCfi6UpiBxsgtQzNb+LcBjTvhAno/sDdx3CjHnxwHCM/VmZtb2qXmqxMLmDsMZS+VsTBjfCCxQU/xjTKWJtpP+bqCmJ0N/jtILDKAvEVTqAKP/Viqy53vI/YXyQz7Jg2REhUa1C4PzowQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Brup6HiEi6MvCymS0nURt6bPUnMSK4zX0JwNbDIjnig=;
 b=DodcbLOmvEK85MKNbfYhdiKDA5uFPBCyU6Afuc7pCf1V5x1WeShGHdjMJnHTGD2ubvCYAFVhmWtuTxUwxzztpggoQmOCS72owi1eC9LuZWheipoE55ueUW6yzBlulrq65bv6lDqWmYfVX1jKyXe86sJ4GKzvR1iNvLYaIa+ciUg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <f19d8968-7a2f-4f62-830a-4a7c578a1d72@amd.com>
Date: Mon, 9 Jun 2025 10:16:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm/mpu: Provide and populate MPU C data
 structures
Content-Language: en-GB
To: Julien Grall <julien@xen.org>, "Orzel, Michal" <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250606164854.1551148-1-ayan.kumar.halder@amd.com>
 <20250606164854.1551148-3-ayan.kumar.halder@amd.com>
 <ee8df4dd-1256-49e0-827e-c4dfe9543fc7@amd.com>
 <a1b87894-9c9f-4ed7-ab81-63cc27440ad4@amd.com>
 <b066c5fd-76e3-45c3-be1c-f8260d283cc3@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <b066c5fd-76e3-45c3-be1c-f8260d283cc3@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0475.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::12) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SN7PR12MB7348:EE_
X-MS-Office365-Filtering-Correlation-Id: 8beb8657-8f34-493d-cfbe-08dda7365e5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cEVKNE9QVzlvbHJnb2lWUGZEb1N1R3BSM1dyanUwaXlTN1NDdFQzTXB5cFA4?=
 =?utf-8?B?OVVpakFXTjJFMWlGdU5wNzRsZlJNcmVMQXN2NUVlYTJyck1HQVFXNE1vZytX?=
 =?utf-8?B?Z2tzSDZONHFJTGtjWU5KUkVXd1o0d1c1ZUlYTEdNMzFURGdyTE83bC9reUov?=
 =?utf-8?B?bm1iaWJQRXl1RHRyTDZqWGp1Zm5lbzlwaDFCbVZYWGFEcVQxUlZEQjlscVNz?=
 =?utf-8?B?ZWJEZTluTVVGandwYXZITGtLZmZvdkZvSUtXUzNnZHVtbm9Sb1dmSXFOaXFs?=
 =?utf-8?B?Z2ZUSStaSHEyL2h1eElRdDhqUWd2dmNSa09CVUdKTVlxV2YwT3Y5Mzd2aEUv?=
 =?utf-8?B?TFREeE91YXJlSUV3R0oxZ3NTZjl3ZnBlVVF2dENMNm1RcGhTVndmbWp0bG5S?=
 =?utf-8?B?VTVKZHp5MlA2bkRuSVdMOXlMMEltR0hOcEs0VTZTMTRJa1ZDR3pKQlRSbm9P?=
 =?utf-8?B?WFhKbjRwNzVRZkcwNUFjY21lNnNRQ2hnZVNBMnhpbW5FQ0ZPRmpBeXdCSjhN?=
 =?utf-8?B?Y1VkdUZheGJSUTd5dUR2MldCTXJFM2d2SU9GamVpVkFDVUFlOTE5WWwwRGV1?=
 =?utf-8?B?RnJQNHNwaFRlUXBKb0JxcklHK3pFd00rTC9Ld0wxNlhUaE5rcHNLenU0Z3A1?=
 =?utf-8?B?dGFkZ2lzYVo1WnlmN0Q0SzY1ODM0U0VBcTlNTzZpUGpVYk4zbFRrOG4rMU82?=
 =?utf-8?B?aFhHQXQ0UHY0cXpTWUwrbFlJc0VRQWxJeW9RZ1RZNmNIbElkOXhHTzNzbmtW?=
 =?utf-8?B?RFJ2RThjNWg3TkhuR01HQjROZ25JVWt0amhoL3lleGE5VkJHZ2d5TUhoL1pD?=
 =?utf-8?B?MDJjM082a1RsZml6cDZvQ3M5UlNYZGpCUnNLRm8rRWxoU0xQRXI1ZEt3VU9O?=
 =?utf-8?B?TzMvb21ZN0tpaTU4eDZiQ0xxdVBENmxwUEJraFlVTE9JTzFmd1E3WHE1YUl1?=
 =?utf-8?B?UHZJbElMaUFzSlJTQmRMeXhGbk4vMDl1LzZGOEdNd1RJeTFZNC9PWnNYWXJY?=
 =?utf-8?B?T1M0MUFZK1hUVWVnZGgxcmVxM1hRMDlkSEsxMDlYM25pQmFmMytFbmlyVXNu?=
 =?utf-8?B?TnRWZklkbmJ3ZkE5N0JZQWd1ZmxGaGduM21pcmwvckZvL1A0d1UzcTllV2c1?=
 =?utf-8?B?eVhPN1hOQWNqQUVRVmJubW1lRkgySWZnVjhoLzNDQXI0VHFyaENiNDFRdlRL?=
 =?utf-8?B?ODdWdm9CczEzM1pEaEVLNFllWHhmTXJva2hNbHY0cEVYY25HQ2ZtSFBUaTdm?=
 =?utf-8?B?ZnRzcUFXaW5YcFVxakZ1c0pqUTcyZlluSXdha0gvdVh4eUJtbUlLK0RSeXVS?=
 =?utf-8?B?WHhCZlFsTWpIUTM2R29wT1JvR1JOUWZ6ZkV0eFdhOHdjWWxNM2wydzhxYklw?=
 =?utf-8?B?UjJlRyt2ZXF6QmJha3VaL0ZnWStPTGUyMWx5ZUlMS2RaczQ4cHZrVkZCRmpx?=
 =?utf-8?B?WlI0aDM4NEt0MnQ1QXFmbzM1MlZycjJCcGt6VmxydVpxQUFvVyswM2wxR25R?=
 =?utf-8?B?cDlVODRFbEFGWUhZVHQxQlU2c0xjd2VkM1Y5ZHVLWUtZSmJQRzAwNVdrZURE?=
 =?utf-8?B?TjZwWUhxdzRuK2F0TmVtNGJRWGx3cGx1eGt5anNiTHJpV2dEbjZ6dEg3Sjht?=
 =?utf-8?B?VXpXQ1dBUkV5ejRTcVFha0tYOEk1MVVhYm52RTBQYTNRclk0OHY1a2YxTFJr?=
 =?utf-8?B?VFFRL2xtWmFPL0FEbVQvNDQreFJIY2Nha24waDhXcU05djZaNkprL3JjdHpZ?=
 =?utf-8?B?Q2RSUjV5L1p1aUMvU0NGZ3RRVENTVWZwMk1JSjgxYzRCRklmRll5TitTOHc3?=
 =?utf-8?B?VWZXdnEzZWl3UjR0bDlDeEZXYisrRU5HUFcwVWZDSE9qcmlTMDdxRXMxQ1ZM?=
 =?utf-8?B?Q2xueEZhY2xkbmpOdW9jVGRBSWJLeXFpK3cwc01aWEZhNXVuQXUwK2NGZWs0?=
 =?utf-8?Q?nJ1hFrgaSus=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTBVL2pSd3JEamM1SVJmd1JPZXNKdEFIOTZ3M2U1d3ErZ2hNQTdvRmJ3RkR2?=
 =?utf-8?B?ZWVOakhjUklyc2did2FXeHFqcVlja3BCWmlQVWVxb1E0Rkl0ZVBmempCRFor?=
 =?utf-8?B?blJHUlFOb2FEZnF6cjJDYWN5aDFGdDZEWWtjdkh3TGpicy9pVTcyM1FwTHFH?=
 =?utf-8?B?UnJaZGlaakl6VDh5TWlPRys2Y09oSDlvaDIxZENLeTJiTU12NEtFaXVXYSs2?=
 =?utf-8?B?NTF2dzVRRXNWY25WdUxLQjBpMTRyK1IwYkJhMThxVzRLNU9SYWlmamhwcTVi?=
 =?utf-8?B?Y3hIT1hzSm9lTnY2QjZKSW42dXVaNHYya1RNQklQZ0dQSlI4bFJodkRQNkNO?=
 =?utf-8?B?SkdMaFdJcjBoVDdrcWpoVzZMa3k3cm9FQ2lFcHpoMEN1b0xxZGpsWFpwc0NF?=
 =?utf-8?B?eS9xM0RUZE9WRU9nM2t4RXRLNXhPR1RjZ1RZa0xTcEprWndtdVVuZU50Q0Rr?=
 =?utf-8?B?QUZHR1Z1eWNMY0ovMXNhajFrc2NvbWRCaEJkNE1GdVl2eTV5MDVKVnk2Rmwv?=
 =?utf-8?B?ai9KUk43MjBqK3FHemNzZVU2RWprRkVVVkxCeHZTejJCbVcxZGp3RUxTcGF6?=
 =?utf-8?B?MWhRV3VwbzdIaXcyelhxTjduSHpncUtPT1ZSMHAxYnBjN3NGd2M4YXJnRWpZ?=
 =?utf-8?B?dGczQ1BEbGxSTVVEVWpzUjEyNlBuM0NTSUlZd3pqeDF3VTNxZTUzQjNhbjVo?=
 =?utf-8?B?M2ptcWxFK2FLYVArSGtzUDY5V21FbVorb1Q0djdtRVpOS3dEOWJSTFRJcnRT?=
 =?utf-8?B?cERjOS8yMWpWaTZOQ1ZMamFWeDRtVlhYcEJzM2RGQkhpNGpEcnRmeVBBd1RV?=
 =?utf-8?B?dWpEWnA4Y1dYdTk0WGxYQVY0Z2Y0T0F5SVFTMzRKU3p0MHNySWxFWTRRQ3Bk?=
 =?utf-8?B?N0ZNcGRkNGkwNmkxakM3QTc0RmhsOU05R1RYV0w1MjRjNFVkZElnVGZJK3Fw?=
 =?utf-8?B?MjJYdHlGdXlOOHpRSVVqcmJaTWp6OVc0SzVnL05nMnVYMEdoZjJ1dlFlWXVr?=
 =?utf-8?B?MWEzQ3lHdndVUTBhR1VybkFZb3ZEQy90OWREa2dOSjN1dlBhME5IUUFRQld0?=
 =?utf-8?B?VU90LzF5bysrdFZjeFc3LzdBeG9IQURmQjd1K0FRT002TVp5ZitEVmJxaUdp?=
 =?utf-8?B?MXM3M2hNTHdwWWl0TXpJcy8xNmlqb2xSMDA0RTB4SHVoNzlyTlgyQWNucUZh?=
 =?utf-8?B?MFJsQzV0RzZDNERiWSt5UHJKYzR2N3ZCUXpUWnNielNQcmhPREpMSjFWUlhh?=
 =?utf-8?B?NkxScnltV01YQ0p4dGVwLzViR244WU5rQWVGUTU3TzB1N1gyalhvaENwNmRv?=
 =?utf-8?B?RnNhYzZUOWRQZzA4WWoyYVJDRVgvS3JFS2tyaEJqY3l3bTdXNkxzYlJwSWox?=
 =?utf-8?B?R0M0ZStOckpCZkpYV2RrWTNtMDk3anQrZnZtVDhLS21NUEVzdmpBZkdBdkdV?=
 =?utf-8?B?NHFtUEM4djhMdEthWGc1Wi9icGcxKzJCZ1VnWkoxTzZ1TU5hQ3J4cm05Mmlk?=
 =?utf-8?B?dEZpdWlENFJwNnZBb3JuQWxzSVZ1YzdOUVlUTW1VcXd1dHZWdnY5VVlyRFQ1?=
 =?utf-8?B?bExCbHVrQzA1VXJNNjE0cUJ5OC9zS2lhSkhCRmxrRWh3SmxKWTEzcE1vZnlU?=
 =?utf-8?B?b3hjckI1cU95bmU3ZHZ6bldXR3RGZzM4YWV2eUR2MDVnQzJrTnhnN21ZcXBv?=
 =?utf-8?B?OFJVSVJZejQ3T0M5OEhIYTM4VU9WZXFsdWl3RVJteUNFOU9KbFZFSHF3S3ZY?=
 =?utf-8?B?OUlmVThHUnhPUzZoRjViTzF0cUI5d080aVlDOWc2WW9UQWh3SXhaV01sUSs1?=
 =?utf-8?B?ejQ0Q0NSd0dBWnA0TFdrSE9ZTWY1NUdTREJ3aTB6RlJoYy9VOVlYb1RMTnpt?=
 =?utf-8?B?a1dXS3ZKK213OEFBUFFxQzNGYi9RY05sNlh4T3pXNkFMK2tEc0RXRGpQSTZq?=
 =?utf-8?B?S3J6REFzcFZBZDMrU2NnMERkL3pMZTU0ODlPdW4zdFd1dC9jTWQrdWltTVgw?=
 =?utf-8?B?anBKWVYzUjRvYWJtODhreHpBSktrbGllamxlSnlMSUhMdHppRW5Jc2hCSTVw?=
 =?utf-8?B?NDBkc1hsWHJoSExieTJJK1hmaE45OHRIdDJDaUtWcm15VHp6TURUQi9ScEha?=
 =?utf-8?Q?SxKjoU2q9WD0z05ruL+uXH6DY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8beb8657-8f34-493d-cfbe-08dda7365e5e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 09:16:51.2563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8IWjdZ5z/58UE1BXvp5HxVYERDhezJt8SCz2pvBsnzvzEsm3K6Z2QZWgpwcCIHtyX2IWnBYLe6n/fphhzrB5qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7348


On 09/06/2025 09:42, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 09/06/2025 09:27, Ayan Kumar Halder wrote:
>> On 09/06/2025 08:41, Orzel, Michal wrote:
>>>> diff --git a/xen/arch/arm/include/asm/mpu/regions.inc 
>>>> b/xen/arch/arm/ include/asm/mpu/regions.inc
>>>> index 6b8c233e6c..631b0b2b86 100644
>>>> --- a/xen/arch/arm/include/asm/mpu/regions.inc
>>>> +++ b/xen/arch/arm/include/asm/mpu/regions.inc
>>>> @@ -24,7 +24,7 @@
>>>>   #define XEN_MPUMAP_ENTRY_SHIFT  0x3     /* 8 byte structure */
>>>>   .macro store_pair reg1, reg2, dst
>>>> -    .word 0xe7f000f0                    /* unimplemented */
>>>> +    stm \dst, {\reg1, \reg2}  /* reg2 should be a higher register 
>>>> than reg1 */
>>> Didn't we agree not to use STM (I suggested it but then Julien 
>>> pointed out that
>>> it's use in macro might not be the best)?
>>
>> Ah my last response was not sent.
>>
>> I realized that I cannot use strd due to the following error
>>
>> Error: first transfer register must be even -- `strd r3,r4,[r1]'
>
> Ah I missed the "even" part when reading the specification. However, 
> we control the set of registers, so we can't we follow the 
> restriction? This would be better...

I am ok to follow this. I just want to make sure that this looks ok to you

prepare_xen_region() invokes store_pair(). They are in common header.

So we need to make the change wherever prepare_xen_region() is invoked 
from arm32/mpu/head.S. This would look like

--- a/xen/arch/arm/arm32/mpu/head.S
+++ b/xen/arch/arm/arm32/mpu/head.S
@@ -58,33 +58,33 @@ FUNC(enable_boot_cpu_mm)
      /* Xen text section. */
      mov_w   r1, _stext
      mov_w   r2, _etext
-    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_TEXT_PRBAR
+    prepare_xen_region r0, r1, r2, r4, r3, r5, attr_prbar=REGION_TEXT_PRBAR

      /* Xen read-only data section. */
      mov_w   r1, _srodata
      mov_w   r2, _erodata
-    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_RO_PRBAR
+    prepare_xen_region r0, r1, r2, r4, r3, r5, attr_prbar=REGION_RO_PRBAR

      /* Xen read-only after init and data section. (RW data) */
      mov_w   r1, __ro_after_init_start
      mov_w   r2, __init_begin
-    prepare_xen_region r0, r1, r2, r3, r4, r5
+    prepare_xen_region r0, r1, r2, r4, r3, r5

      /* Xen code section. */
      mov_w   r1, __init_begin
      mov_w   r2, __init_data_begin
-    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_TEXT_PRBAR
+    prepare_xen_region r0, r1, r2, r4, r3, r5, attr_prbar=REGION_TEXT_PRBAR

      /* Xen data and BSS section. */
      mov_w   r1, __init_data_begin
      mov_w   r2, __bss_end
-    prepare_xen_region r0, r1, r2, r3, r4, r5
+    prepare_xen_region r0, r1, r2, r4, r3, r5

  #ifdef CONFIG_EARLY_PRINTK
      /* Xen early UART section. */
      mov_w   r1, CONFIG_EARLY_UART_BASE_ADDRESS
      mov_w   r2, (CONFIG_EARLY_UART_BASE_ADDRESS + CONFIG_EARLY_UART_SIZE)
-    prepare_xen_region r0, r1, r2, r3, r4, r5, 
attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
+    prepare_xen_region r0, r1, r2, r4, r3, r5, 
attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
  #endif

  zero_mpu:
@@ -93,7 +93,7 @@ zero_mpu:
      beq   out_zero_mpu
      mov   r1, #0
      mov   r2, #1
-    prepare_xen_region r0, r1, r2, r3, r4, r5, 
attr_prlar=REGION_DISABLED_PRLAR
+    prepare_xen_region r0, r1, r2, r4, r3, r5, 
attr_prlar=REGION_DISABLED_PRLAR

So this would look a different different from its arm64 counterpart.

Are you ok with this change ?

- Ayan

>
>>
>> So,  I am using stm with the following comment
>
> ... than a comment and hoping the developper/reviewer will notice it 
> (the code is also misplaced). I am ready to bet this will likely cause 
> some problem in the future.
>
> Cheers,
>

