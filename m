Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29302CAE431
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 22:48:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181147.1504243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSj5x-00028J-1h; Mon, 08 Dec 2025 21:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181147.1504243; Mon, 08 Dec 2025 21:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSj5w-00026s-V7; Mon, 08 Dec 2025 21:48:36 +0000
Received: by outflank-mailman (input) for mailman id 1181147;
 Mon, 08 Dec 2025 21:48:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NKnm=6O=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vSj5w-00026j-Dz
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 21:48:36 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4c8d14a-d47f-11f0-9cce-f158ae23cfc8;
 Mon, 08 Dec 2025 22:48:34 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by AS2PR03MB10057.eurprd03.prod.outlook.com (2603:10a6:20b:64b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 21:48:31 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%6]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 21:48:31 +0000
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
X-Inumbo-ID: a4c8d14a-d47f-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fMo/sebzQFY6dZlfXrPG1rO55J+JfMEK4xbYMsmSKnqEp1LAQS/4IjiWJpcW/xjIRs9dgFKQvAZ4KqSH7OEqgt8Xe4irf7X9woPCeJycfjp0txNayuZZ5G1Nn5eqzpYDVAOMa/DwGnRzjfkLwcHkHkMUYHpiJj19M/IyvoDWv3Z1Z7cH5ZiH9/3kwCiYnQ3lPCJFhxexqww8dBHTowvwoK+NmUWmhOlyDk54RnjdKROOhpNFJH0HAlJ2zpFezcEPAP4Jcd9+Z1iqpNRBu6pgRYUqqe52X4kjrC4RKkbYozmt10ko5CLUcvY2RcKGW2cNkDl2V7CpFbkQTX5qIw5VWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgeCzMJRWhWLkcmzsPeMXpR6mNV21H/+zRDJWNcFt58=;
 b=cbqBJjL0/+wzQrkz8L1spN1YTNevFGMFk7pQXSMdypGA0jKEDFZ5KEOtUTA6i/WzwFe2Wmnvrs8xp+PrcQMPiQvGWS4opzT7iIUSj7iJC+uk3xvZZskS8fra1fVY+VLejO9rS6RTaULdFMpqUcS9axX2Oy6YjfrqYmneo7kzBoXq/lFBAVZ7JPP2HB6+YLjz4X0DOjNUSh+3kKvg6GAMrbBNr14DtmLjtQs1GlqbIhfUCbNtqw/ffUGR7CixxxiVnumHrZjjyM6siDUkDwgNiiTEONRKug8strzFeaVxmuAHrulpjUd9RahIBJapHr2h1CfYIYj5Dyl2e43mo2XvHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgeCzMJRWhWLkcmzsPeMXpR6mNV21H/+zRDJWNcFt58=;
 b=j6y9hnGcoGMeX4uSj1qPtJcZU+fubACvEHHr/ORf9iPTSBkupmYVvTjpgBAlDU8WTpghx+0PCtYCEOZdo7GiYmvJvSPiT+nlvKDuy31cu+ZviqroAfdmpLHE/kQRzvENUgRSon5CuGYxyJsU8Q2oCPy5ZwGy+gIOA2fPqYQdbwu9/JdKYn/xzpjSUdQRupQfLVUNPfBNozSFbKBcvw/kFRZFvNd/sQMCCQEO2iHz7qMu+7fmBHSiMoqMl6z5mb7AqAe/Ndj7niPAwf4CVUTIooexgyG8E3nlfQuSEydFDw7Kc+597r9bGczAacmw6u+tEcgmScYT/KdXZVs2MbY6yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <7891d66e-cd51-4694-9926-cf8f62c3053f@epam.com>
Date: Mon, 8 Dec 2025 23:48:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] x86: move / split usercopy.c to / into
 arch-specific library
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <f46f89f6-242b-4433-958e-36088e567ccd@suse.com>
 <12852eae-849b-4576-a8e1-85edf401b455@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <12852eae-849b-4576-a8e1-85edf401b455@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::29) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|AS2PR03MB10057:EE_
X-MS-Office365-Filtering-Correlation-Id: dbddd457-e0cd-4aab-2cfd-08de36a3874e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UnpldWVuMG5pMDl5U0hrOHk0UjJ3b285SFQ3d3pFQjdVcXRwS2pab3FCRWtG?=
 =?utf-8?B?a0tkTG5rL0lUc1ArVW01cmcxOUxscVVVZmIrV1dUb1A1anBvNGoreUF0UHZY?=
 =?utf-8?B?QTY2Q3pWNEtxZVMzMXAxTEZocHhxdytvV2RtaDdnaVljWERWOXpsWWxKMEFy?=
 =?utf-8?B?bU1iQ1VTenVxYTJIVUdrTUdTenJBSjluQ0t5NFJCUUo1TGtiMkZFYVQ4Vlp2?=
 =?utf-8?B?WHh5YlVZK2JHT2JLZlNLUHRRejFkd3JqOExnZVgwb3JBK0pPK1ROVFZ2Tm5H?=
 =?utf-8?B?U1pGOW01Sjk5L1NDOCtQcFBjYk9FcUw2dUR4ZmVWakh0ZEdrcjF4OTVLVGpV?=
 =?utf-8?B?cEFqZ0xWeEFWK0JQRGJWT1FFWCt5M1VuWHNiQnNRZE9ScC9ScmlNNGZaQXVI?=
 =?utf-8?B?YWtjRnlkc0FBM1dSQjBIK3M3bE1NWk9aUWNmR2hWcWN0aUhNSnUxWUpHTFU1?=
 =?utf-8?B?eXlPbVAydkMvZlhTNkxocmtzaEx3bmdiOG9Wb2lHK05FNzJGZ29pZVV2bUZL?=
 =?utf-8?B?enRWQUI3b01TYlhuWGRmQmtrZkE5cWJ2bzRJcElwdDJ2MW1xR3NMT0t5WlUw?=
 =?utf-8?B?RUtuZWNyQ0NDVVVzbFczbmsyVEw1dVlzekUvbGc0c0Z1N09FQUJQTWlEczE4?=
 =?utf-8?B?RVJKRVlyYXBJdk9TcklhcFA2c3NCbEFidGxiejBqeFRxQVQvNHNCQUhySVhx?=
 =?utf-8?B?THhLeUtDRW0xSEFIczlMRnFtZkNZblFkR1BsU3ArR2tqamZhSFp6b1JZNVMz?=
 =?utf-8?B?c2JOOHRIWnE1dzRQNlVKYzJSRGppUE5yTkNlWkFTOVZnN2hzaVFqVjYvZDZF?=
 =?utf-8?B?emNoWndZelVDcE9VZTdyS1NEVjZrMC93ZFQzZ21XdXdta0dTMXJWK0x5akp2?=
 =?utf-8?B?dWhITWVMSzFObEQ1cEp0SitQTDZSVTRCUTdHL3dyeWRmQzVGYllmdndMY1c5?=
 =?utf-8?B?aWJlb2hMYkJuQTJRczlGNG1LZkx4MTROTHlYQkpXbHo0WHdINitPZHdva3lj?=
 =?utf-8?B?dXFlK0pGM2laTTBWNkhxY3dEWm9QUVJmNUllWEYwOVFETzhKa2pzQnZMTk16?=
 =?utf-8?B?aWN6T0hDb3lQYVNQT3VLazVXaEhvbUNVM09HZGNnYXNLVnQzeFFhQUM4OWwr?=
 =?utf-8?B?b29oT1F2dmlsbWJmRy9OL2s2VWlEZ3NYelM4TDU2c25CSkUyK3hPbUJCKzYv?=
 =?utf-8?B?WldDVlI1WTEranFJYmNvODRCY1NCVk0xZWo4WjBlNWVhUmp6N0dmSGd3N3M5?=
 =?utf-8?B?K29oZjFnaUJnM2hCUHlONHh4NnBoSWZCMGhoN1l3SXdQdXBScU9Td2Y2cWJx?=
 =?utf-8?B?QjNhY0MrTVA4bXB5Uko3YzZuRlIxQlh1WWpKY3grb2ZCd2Zja1lWblR5QmJI?=
 =?utf-8?B?Rm9iZ1JMeWNDMDgzZTdvbExRRDBPdWVxT1ppelVlSGprTEhSaTd4QUpOKzA0?=
 =?utf-8?B?V0EreTAxYkU5RUVNWE80V2RmRnE4M1JLRk1WWTgxYTdRNDlnYXhsM3crTTZo?=
 =?utf-8?B?WW01WjEvNldxYzZrbGV4TkZxUU82c2N1azZCYlp2WWZsSEpwdjc4R29tZ29w?=
 =?utf-8?B?aTdFWXNDK3JnZmVqcDUyUlFTRC83V1hvWVBWeWt5N09XYlZXL043Qit4UU5C?=
 =?utf-8?B?T1pGRmJxZ0hpdUtlc1Z2NndFOVBTZU9rbERkamlUc2hGKzhLODM5Z09BQzMr?=
 =?utf-8?B?RW5zZXo3d1oxMzFybjRseUlONXhHTTJ2YThhYlZ3YTc2TjJaNm9mUlZZLzZa?=
 =?utf-8?B?bjNWNi96K0FRQitXbmFoSVJteFVRTGZnaUtkOGV0SEtCZHF6bEhNL20xVUZk?=
 =?utf-8?B?Vjh1WHNUbWllOHAvMFF4cnVyc09lMnR6TnZLV1FSTXNUam1Uc2FVQjdpNFhs?=
 =?utf-8?B?L2crbG9kVXZWK0VocTlBOHZCRjBNbTFKS0puaFE5TU9DcUVWVFQ5dmc3V2VS?=
 =?utf-8?Q?0MppUYantLvXjKCjrYXLCXx4k4lN773o?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnlEZVVOWmNNU1RqUlF6WFdUMnNsMEVpVUdzOTNUS09ZTWlUR3ZNTlFzS2Zx?=
 =?utf-8?B?bU9aZXlvam1NSWxmYlRoZGNlT3JlZXBBWlQ5TldiZnV5VjN4MXJ3aVZOQzA4?=
 =?utf-8?B?U1Y0aHZYTE51MkhyRWticnJ2cDRNb1dqRThhczJhYVd1bHFSRkgyL2UyUmJD?=
 =?utf-8?B?MjczL1hpUVBWOEVETG5JaitpNDhzQzVsSDhhNGFWWm5HZGZmUnBDQ1dHRjJQ?=
 =?utf-8?B?YnpZK1ZiMERrNURpRWNpSDQxUFVZZTdYVjhpODFmcWdxSXNUbktQS3NKQmly?=
 =?utf-8?B?MlNIM2hoanc3V3YrYTNsYWVzcjNmSkJUWTZFT0lyWDNUUDVYTC83U21QTHZp?=
 =?utf-8?B?QTBKWHFwT203alI5TVhYeHpjaTgrdHVVYWNrOVZCQ3VhZGRzNTZTM3NqTFlZ?=
 =?utf-8?B?YW9HaVJkN2k5cHl1VUNVM1VxbDlLYzNTV3FJRGpjTzc0NGJUeU1rTDNvNWJK?=
 =?utf-8?B?ZEt0emMvcFpUbzZXUnFUYnFHVXVNTDNLa2NkV2Q0UGo4VFJVa3FHNTNrdkpt?=
 =?utf-8?B?SzA1RlMzRHNJWjZjN1A2aFQvL1RiQ1czUllwSkVxRUc0LzJ0ZWZUUXBGRGhG?=
 =?utf-8?B?cGtYc3lPeWRuZ2wybVN4UHdTNzNMTndabjM1ejJLZ0JVbkxXWmp4dHQrcTlV?=
 =?utf-8?B?bjRzcDkvVGJPVlZTY0g4djhkcUxkMGNNdzFmaDdpbGNpaFRFMW4vS0I2Vjhn?=
 =?utf-8?B?eE80a1YveE15TFlTb0szRkViSXlUTWY3cjBqWEtUYThuN2FIRC8wZXpuaDlS?=
 =?utf-8?B?Y3J0dWM1S29hQ2hmZkY3RDBxc1BUaXNUK21hUXBRTExiUS84V29ScjU1TmxW?=
 =?utf-8?B?eFlOZzhPeWtLZlFVbmQ5YzRDcEo5RGJjanYzcGxjbGM3aElTamE1T2JVQTJx?=
 =?utf-8?B?Qy8yY21DL3lEWjdxQVYzamNyQ2dNdG4yVjBOWnNRM2MrR3BUM1pWbWZ6WmVN?=
 =?utf-8?B?RG03T0pXTDdBTFpFNU8xSTFGQ0JoV0RDZ1ZHQWptTkhqeDM4VzRtYXFPUHlq?=
 =?utf-8?B?ZVl4V0EyZ3FWMThGTVJ3M2hBNWRNRkFtczVUeTJsc0ROZEdvTVJwbzRGQkpY?=
 =?utf-8?B?Ri9EMkJseEFJeXJWNUNES1NmZDRaVlFOUDlnN3RmVi9LNWJpeCtNdHhUbXFp?=
 =?utf-8?B?aVdQRFoySXRLckNhd3ZTKzF3UzV3WjBmOUdBdnJHREYvMVQ1bVdwSjM4Zms0?=
 =?utf-8?B?MjlsMmxpYUZCY3lQWUR6TlNDVnpmUkZ0aHhtdnhXZ0g4TDFVbVRQMGFFbXVk?=
 =?utf-8?B?L0hsVEI3dUpSczRlNVVHeEtwc3FwSll5UzJ3SHdzbzRKNmF6dDdocmdKeUJV?=
 =?utf-8?B?dkYvLzVVQm9zcXN1VnRNakpzeHVsZG5ieThRY2FEazlxOTFEWHZEMlRKYXlU?=
 =?utf-8?B?WmgxMVNVciswNERIT3k0d0hLUFV5RzZ6NXNPSTdKZ0lIdGE1YW1Pa3N6UWxa?=
 =?utf-8?B?Ti9sRDkzNDJpR0wwUEVVQzkzQ1ExbC9NYm9zT2ZQRmV6em9JREMzaUdNVG5r?=
 =?utf-8?B?dldzV00vRHN5VkRCWjdNVkE1ZXdVVGYwcGRTZmNwZnVYdFVpMTQ0Mng1d1pm?=
 =?utf-8?B?bWpKKzVvVDZDcVpJSnQ5MWR1WmVxUnlzNytyMzVLdkgwWUVBdFRkWWRTenhZ?=
 =?utf-8?B?MjV2REw0aWZoQVBVZklVZjJqQkZHMXYvYlVxa2pwSHBnaW93OVRuTWduUXRm?=
 =?utf-8?B?aVM5WHkrSmdMUXJpcTBGNFF3UnJZMnVKV3FRQmJhb01mQlBOdkxKOUJYb1VR?=
 =?utf-8?B?MlRLUHpTU2hBbkdNTGdwY2ErNmdIaXdmYnpuQ3ZoYmtLT3JScmt3VU5FMnRp?=
 =?utf-8?B?NEF0K1g3MmtodjNvcVgxUU1pZXRycmtwQ3lqT2p2aTFoMW5xZjhKc1BDRG5K?=
 =?utf-8?B?K3BOK3d5MzMxaGpEMC9oajJPN0N4RTJPdEZxL1E0R3NaMTFHNmF5TkRGUk9p?=
 =?utf-8?B?UnN2azYxdytBeEZUNVRTWm1EVVJ4MjVqMWh4bEZRZklNMGVZelJyNlI2T3Fo?=
 =?utf-8?B?aHVjbTVWN0ltUm1hMjBkTEoxVlduM0d1VkdkQXlFdE9OSFpNME82YmFUcmJZ?=
 =?utf-8?B?RlVJM3NzT2RrbFVtb0s2TW5zczFpOTRXa2puYThOMjkrZXlUaVhKUmZFbjhH?=
 =?utf-8?B?UFVSb2orb2UxdXR2ajVtMzN6QVhRaldMVzJWU0Frb2RpL2lkZHVBOEtCd1Bw?=
 =?utf-8?B?Mnc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbddd457-e0cd-4aab-2cfd-08de36a3874e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 21:48:31.1866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7IljhDhuCkugoWPBDBxQuJ8voC9oSW9IrZKLhHfG+48NM7WEV19rVPc5NyTnwfQvlBncVrMR5yH0epsFxFhBldaVvEs1593k/g4jizRhEA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB10057



On 08.12.25 14:05, Jan Beulich wrote:
> The file wasn't correctly named for our purposes anyway. Split it into its
> "guest" and "unsafe" parts, thus allowing the latter to not be linked in
> at all (for presently having no caller). The building of the "guest" part
> can then (later) become conditional upon PV=y.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
>   xen/arch/x86/Makefile                         |  4 ----
>   xen/arch/x86/lib/Makefile                     |  2 ++
>   xen/arch/x86/{usercopy.c => lib/copy-guest.c} | 12 +---------
>   xen/arch/x86/lib/copy-unsafe.c                | 22 +++++++++++++++++++
>   4 files changed, 25 insertions(+), 15 deletions(-)
>   rename xen/arch/x86/{usercopy.c => lib/copy-guest.c} (94%)
>   create mode 100644 xen/arch/x86/lib/copy-unsafe.c
> 
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index 61e2293a467e..dfb258d7ac1c 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -72,7 +72,6 @@ obj-y += time.o
>   obj-y += traps-setup.o
>   obj-y += traps.o
>   obj-$(CONFIG_INTEL) += tsx.o
> -obj-y += usercopy.o
>   obj-y += x86_emulate.o
>   obj-$(CONFIG_TBOOT) += tboot.o
>   obj-y += hpet.o
> @@ -93,9 +92,6 @@ hostprogs-y += efi/mkreloc
>   
>   $(obj)/efi/mkreloc: HOSTCFLAGS += -I$(srctree)/include
>   
> -# Allows usercopy.c to include itself
> -$(obj)/usercopy.o: CFLAGS-y += -iquote .
> -
>   ifneq ($(CONFIG_HVM),y)
>   $(obj)/x86_emulate.o: CFLAGS-y += -Wno-unused-label
>   endif
> diff --git a/xen/arch/x86/lib/Makefile b/xen/arch/x86/lib/Makefile
> index ddf7e19bdc1d..8fe2dfd88553 100644
> --- a/xen/arch/x86/lib/Makefile
> +++ b/xen/arch/x86/lib/Makefile
> @@ -1 +1,3 @@
> +lib-y += copy-guest.o
> +lib-y += copy-unsafe.o
>   lib-y += generic-hweightl.o
> diff --git a/xen/arch/x86/usercopy.c b/xen/arch/x86/lib/copy-guest.c
> similarity index 94%
> rename from xen/arch/x86/usercopy.c
> rename to xen/arch/x86/lib/copy-guest.c
> index a24b52cc66c1..25eeb35427e2 100644
> --- a/xen/arch/x86/usercopy.c
> +++ b/xen/arch/x86/lib/copy-guest.c
> @@ -1,4 +1,4 @@
> -/*
> +/*
>    * User address space access functions.
>    *
>    * Copyright 1997 Andi Kleen <ak@muc.de>
> @@ -6,8 +6,6 @@
>    * Copyright 2002 Andi Kleen <ak@suse.de>
>    */
>   
> -#include <xen/lib.h>
> -#include <xen/sched.h>

This will not build :(

   CC      arch/x86/lib/copy-guest.o
In file included from ././include/xen/config.h:27,
                  from <command-line>:
arch/x86/lib/copy-guest.c: In function ‘copy_to_guest_pv’:
./arch/x86/include/asm/config.h:270:32: error: invalid use of undefined type ‘struct vcpu’
   270 |     (ARG_XLAT_VIRT_START + ((v)->vcpu_id << ARG_XLAT_VA_SHIFT))


>   #include <asm/uaccess.h>
>   
>   #ifndef GUARD
> @@ -139,14 +137,6 @@ unsigned int copy_from_guest_pv(void *to, const void __user *from,
>       return n;
>   }
>   
> -# undef GUARD
> -# define GUARD UA_DROP
> -# define copy_to_guest_ll copy_to_unsafe_ll
> -# define copy_from_guest_ll copy_from_unsafe_ll
> -# undef __user
> -# define __user
> -# include __FILE__
> -
>   #endif /* GUARD(1) */
>   
>   /*
> diff --git a/xen/arch/x86/lib/copy-unsafe.c b/xen/arch/x86/lib/copy-unsafe.c
> new file mode 100644
> index 000000000000..a51500370fb1
> --- /dev/null
> +++ b/xen/arch/x86/lib/copy-unsafe.c
> @@ -0,0 +1,22 @@
> +/*
> + * "Unsafe" access functions.
> + */
> +
> +#include <asm/uaccess.h>
> +
> +#define GUARD UA_DROP
> +#define copy_to_guest_ll copy_to_unsafe_ll
> +#define copy_from_guest_ll copy_from_unsafe_ll
> +#undef __user
> +#define __user
> +#include "copy-guest.c"
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> 

-- 
Best regards,
-grygorii


