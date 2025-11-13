Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4246C56B25
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 10:53:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160854.1488898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJU1V-0008B9-19; Thu, 13 Nov 2025 09:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160854.1488898; Thu, 13 Nov 2025 09:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJU1U-00089f-UP; Thu, 13 Nov 2025 09:53:48 +0000
Received: by outflank-mailman (input) for mailman id 1160854;
 Thu, 13 Nov 2025 09:53:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xbc0=5V=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vJU1T-00089Z-G7
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 09:53:47 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2e9bfe8-c076-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 10:53:42 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU0PR03MB8855.eurprd03.prod.outlook.com (2603:10a6:10:40d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 09:53:39 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 09:53:39 +0000
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
X-Inumbo-ID: a2e9bfe8-c076-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r6vcwsUic/P2OFZnXwlL+EcFJqWIKqCt4Zw/qQxgr8+Oz9Ogkziz5D4SXP6uB/pJmv3s17XfJ5jf7x/6BTrhpU13MtUdPn+jqK7+00mGlgtZDluNRsMpUhUBrOktbDto3mJKVNmmhntuPCNIPf0eBKbB6aXSUnE2pLwfhhmQXLGRlUFBKbFnXzs6thVQlzJqk7sLgsumrTqDGuYWa1rAHhoPMhtvBG3s/4ybCW9wGJRqlc6iJ5E7hlEwJKcL0yfaH+Qt5N6r+WS7SIhiK1vvZy251RVLooCCw4jCBvLNhfHQ5wfvS/bwFUEdz0WMgJ0J6eWcTcduMQklpXpGOnGX5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FUsUl6w46Bh78hBSMK/B+3FKBrMR0h9jVX2u5E/VfiA=;
 b=TjwOMxh5RpC6EjxQNG+YtTLMSixU2ceHXC65104Hm8+dbWLDmYxbu+mTsU5ZRK1FgAAXcFaxm9jZ4nho/81tlKIg7EbEpdglefRS6sjnjRdaxTHvSJSnSPF/tM2EBpj0IsursQulWfDSHVqzx0Y60MSNr/3Is+t308hi/N9X7eb8Fx8KjBBcHSHb76u04g0R6S+s9Pot7Xd382weY3NN/pnDkACQ+CWfzWigkzCWxenn6nkmYbJ4yE9VZs2xRdZn1uDEdVgiNhjeZMZqhcpD/M06TwPHKEA+ZhNLi+xJ426RFJQLDGk9eV5CpwlE/+354bHn0DdJJ6QFO+GHkrKC1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FUsUl6w46Bh78hBSMK/B+3FKBrMR0h9jVX2u5E/VfiA=;
 b=E6CbtvJoL8KchmttC2Z6lYlriNprHwl3XvH+zK5ZjQ2XUSRYsICB+58UFjJJBSTjB7JGWGc2a+WGQE3fZ4Tpmz+1ubzQU/TzB+/hXUx9zbHrPum7pHIAP9vP5ApAHVPZNbl4QS9E+GAGHgbaOvVsG+4W5ntslSyHrUd9SpAPsT2tbcDkv84sx+y2UZWCpzzGMKlAkvQcmUcWfBreFxyVCnpQUH0Am+zGvogGX4QNrII/xUhcIFAzDzxhXOdNiILegnhNV57o1tirFjSKhtphcQaryDtSVQ8cfHL2bqfhw+5gJr9/4O+SfLNrFltYsVgv3My2+OwUapg7N3LRr6W4rA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <9f6a14f8-3290-47bb-9c35-5e9e06285720@epam.com>
Date: Thu, 13 Nov 2025 11:53:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] x86/hvm: revise "cpu_has_vmx" usage for
 !CONFIG_INTEL_VMX case
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250924101417.229108-1-grygorii_strashko@epam.com>
 <7b2fe09a-02f4-4575-9e42-1328f3a40f1d@epam.com>
 <cc64ffb5-4419-458b-9526-fa765eda7bd6@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <cc64ffb5-4419-458b-9526-fa765eda7bd6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0012.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::7)
 To AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DU0PR03MB8855:EE_
X-MS-Office365-Filtering-Correlation-Id: 228bf51d-54af-490e-6641-08de229a85b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?STBiNUxqS2ZvdE1OSkQzU3Q3T21HTDYvWWdxTGZDSHRCZWp5TkdZUmJFWTN3?=
 =?utf-8?B?NE1IcVlIOG9zNTE1VCtSd1R5WGRBQS9yVVBVZ3Z0M1Y2TzhLL3FFSFRFNGFh?=
 =?utf-8?B?c0hzbUJmMzJaUkRXY0ZTeG9GOC9mdTBEVE5yNGZZbW1HTkR4WllLdG41RG0y?=
 =?utf-8?B?YXNOWHBseUFCTnVGSGxqZWZrUERQazgweUJYVWZSd1FRaGNNVTM0ZWFCZmp3?=
 =?utf-8?B?TFcyL2YzSHNWa21ZaXBXaktLL00vR3E5dGFGZU5hSlVYWTZ2NnpLMG1oWHJo?=
 =?utf-8?B?Rm1nZHF4WnNVNnh0WWplTXc4VHByU0ptSEdETGlZdUhCalFVdW5TdVN5VFZX?=
 =?utf-8?B?KzVUK2lXL3lFT2xYbDhXWnJpeWI1REdMTDZZMXBhUElWZGdRdCsveG9MOTAw?=
 =?utf-8?B?NGVLRjlXKzJ2eWJSNkJjbnVxS2JHRCtrTCtPaGVRTE1JNFFIcFF2Z0FkOGhr?=
 =?utf-8?B?bzkwMEtkODZ5anh0aWRKRk00NnBOVHpINks1K2pWaGdoSm1YS3hOMGJNTGJQ?=
 =?utf-8?B?djUzcFZETVVpaWt4Und3Wk52TGExcHZXK25ISGlBQ09qa1RwWXBtamxHMUpp?=
 =?utf-8?B?QmljU0I0cFlhRXErbmhIaE5rZEhqVnJOeWp6K1p4SUtKZG85LytrSFc4OG93?=
 =?utf-8?B?MUlSYnh1N1FEVmx2MzZjaW53eVRmSmo2b2lsM2tSMlpQVUsrYWZTdmNMZWFD?=
 =?utf-8?B?NjJVOVVwcnJBT2pWeGtSR29sRUFjOHFUa1cvdHFoYXZXK0d5eXZuS1Y5eGJF?=
 =?utf-8?B?MHgwZ2pmR2xHZUlsOStXT1htK1FPMmhtMW1mM1laMUIwVnE4TWVXOWhNR2NI?=
 =?utf-8?B?bHp6cnByL0tzWFFzSGxFbXVtcFVudXVyaTdQSGdONklGZ3NpKzNTVUphWUg4?=
 =?utf-8?B?STZKMGFWS2hlS0UzUEdHQXdxS2w1T25MM1JjMEw4Qmtaa2k1dXB6N2lEWmtz?=
 =?utf-8?B?ajc5b3RWQVdMOGFNSzBiMWU2SzIwNUVNSGJnVWc5dG5aTnhwcEJhZEZWazZ0?=
 =?utf-8?B?ZnJJbWJGTEthRGRqOUw4R0luczk4aDgwalY1VUxQL3B3MzVSSHc3dC9IdmlK?=
 =?utf-8?B?V2VxdFF6VWZtZlVvOVVKakxpU2xDSUF4ZHdVc1B3dUVvOGZRTFFJcXkyNHh3?=
 =?utf-8?B?K2xrWk4xRVE5Y3hkWlJ6Uk1rTXJQNUMya2NZVEhTVVZLSjlnYUVMRXFBYkdM?=
 =?utf-8?B?N29Rdzl4UUhhejR5TFhRaitQVUtjVzVyNTdWbzRvSXIrT0FoNi9NNVFZdmRm?=
 =?utf-8?B?U1lUNXpZMGdhVDJ2bkJ5RE9QT1hLUnllZjdrRmgwYk9uVStsbmtSVHpwbWlF?=
 =?utf-8?B?K25DYXI4T1RQbnVIWVdYRDVEVG5nYlhrSEQyMXV2dkxBcCtYT1Nwc1pjWDZF?=
 =?utf-8?B?TGhzY3ZFWG85ekVOamZPWWxSTFdTK1FlSmxUWFRyOEdlSVV0VWlBaGNnTExL?=
 =?utf-8?B?US9oeXRoRVNCbFFpUWR2K1pBS2RPUDhxNmxvaW5pancxVENHNzVxNGE5SXpj?=
 =?utf-8?B?NlM1WUo4R1Z6U3ZJRngrd0sxT1ljVk1NZVVrM3had3FUN1ZXcUxUQnNjS1hY?=
 =?utf-8?B?alI2c2ptT214c0JDdmJsbmxralhOcnVwVlM5MzJ2ZmRQTmJ4MFdzQk9IQ0NL?=
 =?utf-8?B?RU15S29wUmtUalFpdjNIdzZoajVzcXFvcFhtQ3Q4UkpRMmc3aGpuR3B0dktN?=
 =?utf-8?B?OVZoUS9uVUQxcnJ1anhTT3hDYjJNcG5xYXB6WDBVZnFRUitCb0t4djJHREE1?=
 =?utf-8?B?V1RHRkZOdEI3TTFhb1NqSGlxeUNGbktCdE5Na1gzVHRuRjh4UTI1U1BoVFNV?=
 =?utf-8?B?UzljMStGVGxuWHFiZ2lKc0c5Z0hBYVJnSndkUjlqN01OWWppVTFDWVF5VnFu?=
 =?utf-8?B?UzBHWFZXenFXREdIaUIrNEFDVDBIeG5QU2lXWlZpTHJneUNpOGMybzVUOGlh?=
 =?utf-8?Q?fx9LHYfyKfnC+lx1PNaZ8SI3MOuhoFy7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWh4VThwVlRhSWVuNU44NWNYcjBsb205RU1RUTNYMDF5MUNEQkppREc3RnUy?=
 =?utf-8?B?OGRKODkvTEhVUmVCcGt1Ync3OCtrZndYdWdtdmlqdTVsWTdVRC9lRDlZYTFw?=
 =?utf-8?B?T0VyTWtiVFNPd2czVTExTEltZnRTNmRQRVQzMmFGSUJyZUxocVNGSmYwTEtm?=
 =?utf-8?B?SnczVWdvK0N5MmxJYm1BTjRUQTl4eXN3Umg4dlhFbU1nYlBBN0Q4K0ZveWJn?=
 =?utf-8?B?MU0vUmo5ekdWSk1NVlZ6RW5NT2k4ZHFzd2ZTa1BZYXdsbjBnK0RodXFXV0Z4?=
 =?utf-8?B?UXY5UGFtWDJ5YkFxUTNnUFZiTTE5V1BoT0dXT2MxaG1YbHMyY2FtSnR6azVp?=
 =?utf-8?B?T3c5RE0vTGRoUHdXcnk1WExmckc4RkFnOEJTb0JtUnRxV2VJSThWU2ZjSjRi?=
 =?utf-8?B?ak95QUQ5c0ROZ0pCMjk1TmVvSFJORXlVbFdvSEZDbHVBdGRKanhxVnBRUDEr?=
 =?utf-8?B?ZnVNSkJKdVc4ZjV3ZkwxSHdmdm16dTZTbzdlSE1UK2M2L0h0d3V0ZjF0ZjJN?=
 =?utf-8?B?QUZ4QVg2U1BkSFFZN2tCTDl2VE45WElabGJVaWlCUWdKZnhLUktFQ240ekRj?=
 =?utf-8?B?MnFBdytXYzM1OXhTaHdSTDkrcXdhZkFDbEZ6bWs0R2lubVpEODRnYUZRRGxP?=
 =?utf-8?B?ekhNaDFWTUMxVHpzU0VMZkc5N2I5NTkxTy9pcWIzWGpWelJVeDFIamhLbUhi?=
 =?utf-8?B?WWNVVXc4MG9VS2VOclNpUGhtRFpXQkVPWk5aaXJCTG11TTExcHFRQnFqZWZI?=
 =?utf-8?B?b0JXUUg4bG9laW9JaWhVTEtZazh2TEdkR3AvSzAwYnNPNUZlanlRaDAvZFhs?=
 =?utf-8?B?R2ZnaUg3emxUMDJoU2RIZXQrYnlEMTRRcTNycjlaRGQwQUMxUE0ydkxVU2U2?=
 =?utf-8?B?WHV6d21FRE5LOVNVZWhBRFZ5TWhKQ3NqcVgxck13cWVyVG1lbVQvei8xdjdl?=
 =?utf-8?B?M3J0ZFFGUFBWVUVsMUp5S21VUEE4T0xFMzZHMURPK2lQL1lKeUdRb0FmME01?=
 =?utf-8?B?UHdxbTBKZEt5bVp1OUhNOVFxK3ZiZjB0N28xb3dwelNCTmZOajh1ejBxLytk?=
 =?utf-8?B?TU43NFRtK2VDZmx2bVdyQWhIU1RrUnBncThJSyt6bUxRUGFiSDVQcGhlalBY?=
 =?utf-8?B?RkI0dVE5N0RjUE02MTMzNTJHUmd6amtYWVR2eFYzRFJZeVlhWUVOQlNXa2VN?=
 =?utf-8?B?ZnMzTGZ2WC85c2VjcGZWUEFOL0pqNVZlLzFzTGxmeGI4VlIxZW5sY1RXcVhu?=
 =?utf-8?B?UVQxRmpib3JGdGhGSTI1MWlKZnRCZUhVekRpVzU4U0tOR2IxY1F2SVBMTWR6?=
 =?utf-8?B?R1dZbUNNemJodE5SRExmaWxGZmZZUHY0S08vQ05JcW5tQTJ1Um9rRFR5WmdG?=
 =?utf-8?B?OTU5M0YzcDV4WENVci9VaEV1NWY1Z2lSemVna3AxNi9xOHNUNHJreUlsRnB1?=
 =?utf-8?B?bDQvQTVQNDAxd09KMWNYVkhTMXJVaFJhenBPVWpnQVlYaDhqUGdrZzNsdzVz?=
 =?utf-8?B?dkxhd2tUdEhYZUNhU0J0R01wQ1pKQjdXUWxkZ0EwMFllaHZ3YkdzSzVnT29m?=
 =?utf-8?B?bXdsSGNvbTlWVzlOTklDSkJ1dGhNYWRRT1ViUCtkVnJ2cTB6bjljOEp3Rlo4?=
 =?utf-8?B?TjRtRlJwU0g0cE5ORmpubnZLVVRveGc3azI3WW82Nkt2RitkdmxQUW9hVFdh?=
 =?utf-8?B?dXVzWStJMmdlQWNGRm5UcDRrQ2dFMTdseHVrYlNleDJjbTZ6U2lieE85bmNG?=
 =?utf-8?B?d3dxd0dXbVo4OUoxa09mcjVzR3dJVTFNTnQ0L3JsOW5sTkh5MHR5V3hZZmRP?=
 =?utf-8?B?RTUyNjZTVWRqVTgxUTh3SzJpZTJEV0tkRzhEQTNPeGg5U2k2T1IxdVc4K0M1?=
 =?utf-8?B?cDBnOHNyUTBnYjRZSktxUGYzYnJaeFNPTW9hNDRQSzM0TWxJZTBmd05GOXFR?=
 =?utf-8?B?Q2I2dWwwZ3ZHN1ppTGRyMVJCckkwVmVkcEVDaVE2SDV4aFNTOUZVVjRQTDBW?=
 =?utf-8?B?eGJmbnBQSCs0TlpUS0lnUEtMTW1WUEJrdERmRGRUSUxNOGZIUmEyUlY2bUJP?=
 =?utf-8?B?Z09XdTRTR2J2Z3pEU0RUMytneFhkSGJWWDErcDdMczhjeC8wMVY4dW5hSE8z?=
 =?utf-8?B?eTV5TW12N20xMXE3bWpLbjlHdExLaUsvZkhLVlkvUGZ1T25OTFlMS1NDc0x3?=
 =?utf-8?B?dVE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 228bf51d-54af-490e-6641-08de229a85b9
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 09:53:39.8536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UHOTxJQRWCaf64pkZaNKwDUkVIGXqxkrwRWn4zNa0Ix0Wpju0/4PaHuk2apmHRtyMuedsvkpPRikAGuEyoJLOm4qRGfH0OfP/bQA1wQby6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8855

Hi Jan,

On 13.11.25 09:31, Jan Beulich wrote:
> On 12.11.2025 21:25, Grygorii Strashko wrote:
>> Could it be merged if no other comments, please?
> 
> It's on my list of things to put in. However, since you ask: You do realize that
> all your recent postings were while the tree was frozen? That's okay-ish, but
> when preparing a release people would preferably focus on the release, not on
> what is to come afterwards. This change of yours, like quite a few from others,
> will need to wait until the tree is fully open again. It having been progressed
> to the point where it can in principle go in was already a courtesy, considering
> the timing.
> 

I'm very sorry for disturbing you and being annoying in this regards.

> 
>> On 24.09.25 13:14, Grygorii Strashko wrote:
>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> Since commit b99227347230 ("x86: Fix AMD_SVM and INTEL_VMX dependency") the
>>> HVM Intel VT-x support can be disabled, but it still keeps VMX
>>> code partially built-in. Particularly in HVM code there are two places:
>>>
>>> 1) hvm/dom0_build.c
>>>    dom0_construct_pvh()->pvh_populate_p2m()
>>>       ...
>>>       if ( cpu_has_vmx && paging_mode_hap(d) && !vmx_unrestricted_guest(v) )
>>>       {
>>>           ...
>>>           [unreachable for !cpu_has_vmx case]
>>>           rc = pvh_setup_vmx_realmode_helpers(d);
>>>
>>> pvh_setup_vmx_realmode_helpers() allocates memory and configures
>>>    HVM_PARAM_VM86_TSS_SIZED
>>>    HVM_PARAM_IDENT_PT
>>>
>>> 2) hvm/hvm.c
>>>    hvm_set_param()
>>>       ...
>>>       case HVM_PARAM_IDENT_PT:
>>>
>>>           if ( !paging_mode_hap(d) || !cpu_has_vmx )
>>>           {
>>>               d->arch.hvm.params[index] = value;
>>>               break;
>>>           }
>>>           [unreachable for !cpu_has_vmx case]
>>>           ...
>>>
>>> Hence HVM_PARAM_IDENT_PT/HVM_PARAM_VM86_TSS_SIZED are used only by VMX code
>>> above code become unreachable in !cpu_has_vmx case and can be optimazed
>>> when !CONFIG_INTEL_VMX.
>>>
>>> Replace "cpu_has_vmx" with using_vmx() to account !CONFIG_INTEL_VMX and allow
>>> compiler DCE to optimize code.
>>>
>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>> ---
>>> add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-604 (-604)
>>> Function                                     old     new   delta
>>> hvm_set_param                               1602    1473    -129
>>> dom0_construct_pvh                          4438    3963    -475
>>> Total: Before=3567191, After=3566587, chg -0.02%
>>>
>>>    xen/arch/x86/hvm/dom0_build.c | 2 +-
>>>    xen/arch/x86/hvm/hvm.c        | 2 +-
>>>    2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
>>> index 5551f9044836..5ac2cf8394d8 100644
>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>> @@ -473,7 +473,7 @@ static int __init pvh_populate_p2m(struct domain *d)
>>>            }
>>>        }
>>>    
>>> -    if ( cpu_has_vmx && paging_mode_hap(d) && !vmx_unrestricted_guest(v) )
>>> +    if ( using_vmx() && paging_mode_hap(d) && !vmx_unrestricted_guest(v) )
>>>        {
>>>            /*
>>>             * Since Dom0 cannot be migrated, we will only setup the
>>> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
>>> index 95a80369b9b8..70331aeec9a0 100644
>>> --- a/xen/arch/x86/hvm/hvm.c
>>> +++ b/xen/arch/x86/hvm/hvm.c
>>> @@ -4302,7 +4302,7 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
>>>             * Only actually required for VT-x lacking unrestricted_guest
>>>             * capabilities.  Short circuit the pause if possible.
>>>             */
>>> -        if ( !paging_mode_hap(d) || !cpu_has_vmx )
>>> +        if ( !paging_mode_hap(d) || !using_vmx() )
>>>            {
>>>                d->arch.hvm.params[index] = value;
>>>                break;
>>
> 

-- 
Best regards,
-grygorii


