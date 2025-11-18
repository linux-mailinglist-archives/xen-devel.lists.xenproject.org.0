Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD88AC6B79A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 20:43:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165306.1492092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLRb5-0001UE-7Q; Tue, 18 Nov 2025 19:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165306.1492092; Tue, 18 Nov 2025 19:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLRb5-0001Sg-4V; Tue, 18 Nov 2025 19:42:39 +0000
Received: by outflank-mailman (input) for mailman id 1165306;
 Tue, 18 Nov 2025 19:42:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YPWA=52=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vLRb3-0001SV-8E
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 19:42:37 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id baf82344-c4b6-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 20:42:35 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB6381.namprd03.prod.outlook.com (2603:10b6:510:b4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 19:42:31 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 19:42:30 +0000
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
X-Inumbo-ID: baf82344-c4b6-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZrAxy5sO1FnxnFcWcdbpTIuvd/PI9KkeJmc4osCEr+5iWVY6McVatIlZqIXI8r6X2j2Rih7Mnv/o6xOcXTKKeMgIa0sWIAj9D56OJm3GE70xymdbYFfGMF/6/iJnUFaoRHBZvJI42uf5y7t19gLY/tddhK6PrEye/CduIWK259eRqzxiVQFk5S9DypuAowiiTMu2sgUTGdp7dN9zHeKHwIH8CCGuwNYiH/k8u/5d/HsQadpA3k60eNT21s3rAUsdKjTV8uZCd0oW/mHN/bnWHBGmsgKHZwu1oxr5lVoWtxWw2pjZUEbIH4AxwvBBMBLwgZbRJ0nCe985apaIpJOQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7us3+rDzc8EVNdKmlUwZMDntOWgubbA+JKPaclBEaQ=;
 b=RIBE1Sog9/vWG5S3Xr66hJjsvCla8plXMMkQWpKaiz1dQS8VtMZgnX2q8dvqa9XiZx1eSC1IeUr1G8aUDWLRmnORP1bDI5DJXgTgB52yFmynqWUws/XMlSHpVnobTs0rO2gC5IrkeOt0oi1NHJC+tXmtCVPfqXgz07PCKYJMbo6jyGe/sc21deBL0EGG4kIUJa7ELumW16rO/NG+aRfkcqcuh0pFPYQxaI+wo6cyrN2X3fBkPfV3fS7eu5UBmnjWwQjimaXDia4CosxWCxVYmRUKVG7Ldk/fpIH3rZHUy0d9wZoC+tMqsneMTw/YRnqEEw1PuoDdif4GO4ywdA+xPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7us3+rDzc8EVNdKmlUwZMDntOWgubbA+JKPaclBEaQ=;
 b=vxZh75RXMxuw1pOSje1B0bd0SCbkeZPfZD4KNdKitc164d03yBhcxdcKsRcuyb6kCW0jEcqGXEfo2zJhGCrsLWHgH3KH3avcmM+tiGOcBB7qREeYkDdvnRojYi7bKZSQCmOQzFrTIRTNDKYwy64iXOEjBh+ln4ApP1/PAPc4/PE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <15a614d7-1646-4ad7-a298-edb77baae279@citrix.com>
Date: Tue, 18 Nov 2025 19:42:28 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] x86/Intel: use host CPU policy for ARAT checking
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <53ef6c9a-1115-4bb4-bb7f-e2595ab9d0b6@suse.com>
 <65cb802c-922d-4bee-9dee-566367bec6ed@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <65cb802c-922d-4bee-9dee-566367bec6ed@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0225.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB6381:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fdf05b3-4b75-4411-8e39-08de26da9caf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YXVZN2lJVmdKd1RZM3NaZzFDQU9kYkp5S3ZnQ0g1VFhMS3lSRC9RN2VvRGxo?=
 =?utf-8?B?Y1FvdzZYWXBsWHc0NENsUDNYdDU5ZTJVb1hWOXpzb2NwOVEzMjJGNXdwS2Fj?=
 =?utf-8?B?ZklYNzhBY0ZPV3E0TkczY1ZKaFBGaVBBYXgzVHF4UEN6Z1lYc0tRc2I5ckY5?=
 =?utf-8?B?dFVRcEt4bE1UMEdxZHVnSitiTzRNcDk1M2xqdmVWK0V2cVk2bTdjSVF4RzEz?=
 =?utf-8?B?aG53cThoOUJLNk5vVU9sUVhvUmhSSWJsZXNDTnR2SFVxMDViQ0lQbzlxSmNq?=
 =?utf-8?B?N2IvblUxM3B3OE5XaUxVN3hocGM4KzVrRFdXOXNLb0ZJcnhRM2hiTkFmRU5q?=
 =?utf-8?B?d0xCZnZSY0hSVFNiazh3NG1HbWR6UjJNZC9tcWZSR2N4aHowWmF4OEt2ZWpi?=
 =?utf-8?B?T0xaSXJkQi9ydjA1Q0J0U3NZellkNFpwZTY0aHRLUFVZWkl3MWM1UXJjbXFu?=
 =?utf-8?B?N2d5QlIyNEwzN2Z3MmlvdndNWFpMMWxKUWlPZ2RHMXExWkd3TE16elVpUHRz?=
 =?utf-8?B?aVdUd3lmeXdBcVVtR0FyQ1Y3Wk1ibm9kRzFNK01vTVFScmpDS2hqTFpTYlM0?=
 =?utf-8?B?emR0aUttTVFXaUNMZjF6c2FQY3NWK20vQldqOXpnWFpTZ0c1SU1oaHRweEhJ?=
 =?utf-8?B?MFNXbUVMYU96cUY0VTM5Z2FFU1FHN0sveXF5QjV0MXNtTHhwTklmU1E4a0NM?=
 =?utf-8?B?MXdYeGh3eHFwN1hpUVlHN1IxcXdXd3pQdWM2bDRhU3k5bkdHdCt6bEdBRkE4?=
 =?utf-8?B?UWt0SXluNS9EMUlKcjgrQkxScDhZdmJaOEdmSTZ0c0JWL3RFUGJkbEFRVDIz?=
 =?utf-8?B?a3RiTGpaV2k5VFpDbEQxUlRCWGI2bVlwcm9rb3pubmxyL3QwczB0bm8yOGJB?=
 =?utf-8?B?RGM3QkJYUkIvYWVubnNSeDQrZ0VGMjdHUm1oTGFqOUJsS202WS9VcStpTmFE?=
 =?utf-8?B?amk3cWlLdi9JdmJQcVpxK08xMXpvYTFLeXJKazQ2aytPWEtoZ0RxRDNCTVFm?=
 =?utf-8?B?d0tEMFR2NFVYY1FVOEpiNTVuNG1mZTVvQ0ZQSjJnVk1ONVJVQjgzem5yb2tk?=
 =?utf-8?B?OVh0NldRSk91bmZUNU5GcHlqcGd0cEl5VmV2ME9aSnp3MDBTM1ZDU29uSWxG?=
 =?utf-8?B?WC81M1krWllPMm5sMmQ5NVRpVFI4Z2g2VUg0M0sxQ0VML1lURXFNTzM3M0ZD?=
 =?utf-8?B?dSsrSGt2U2NFazdDT2pJYkMzQTFXNllqVGlXVGd2YUlKcXl3a0JRK29ZUEdz?=
 =?utf-8?B?dHdvQzdhczJEY3lIWEdwS0FEa1djNlp6TVAvMTc2U05kUW9ndk4vS1NOMmdi?=
 =?utf-8?B?Mkhkb21oNFcxaURWb2JUYVVNYnd2M1ovd2wxZHE2bzVld2RBTlVNa0hGYlRD?=
 =?utf-8?B?R3I0VFB3eTFpZitIc3dvSWJybFBRek5hRkRMZEJhTXl2RDBjSi9ZQzRJcDBY?=
 =?utf-8?B?T1hlTWpUcUUxSEhEMFZXVHB1RHhyYzFCWEdnRUkyMDl1NWpZWVJFNzcwME41?=
 =?utf-8?B?SWJ5U3crcXZRM2FYcGE2am42Q3FZODA4eW8vS2hmdHZwK255S2hvNnNDMWZr?=
 =?utf-8?B?ekxXZG9tSE14Q0F1MUZBa3VJTTFKT1J6clMvWWNVSFZWOWQ2MCtjazI0MW1U?=
 =?utf-8?B?WER2UFlWK1l4OVRXTzVGeDQzVVFjTnBvbS8xQWRaVkN4Q1ZoRTQ2N09nWVp5?=
 =?utf-8?B?aUhCQXBVNW0zdzdnbWtVaG1VUEp3SFR2QU5lMEVuWmZQSy9SZVhpYUM3NXVV?=
 =?utf-8?B?dVNKRXlxSmxhYXk2eTUrcVQrVGgxWUtDSG5td3lua0I1YjdCdTV6QVpGYWdo?=
 =?utf-8?B?eUVDYWhwUERRYi9yWE5FNTNCRCtJZlQ5Y2hnRWxmVHFGYnpOc1loQnNPMExx?=
 =?utf-8?B?QjA0Q2xnOWhNM3cwV3dBVUExVzQ1WW5qL3ozRlFsZEtBU1BjNzVKVTIxRjRh?=
 =?utf-8?Q?+n7JmUlmAPUNGMF7MpidiBNymgzAL5TJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGluOGpHMWJxMjBhRll2SWhmR3JobXNWd3ArcGRUREJnNGN3RzJrRjRYQndT?=
 =?utf-8?B?NEdNOFNkWHJtWUY3TlBVYkRmVDgrM1Q0VTg2OFlDZ3ZvV2g0YXZjRFVYK1B2?=
 =?utf-8?B?OG5MeWRIdlhobzhLbHZkMVhEZ0lHYkdmdHNkMVFTMVU5dVlvVjRDM0M2UUNi?=
 =?utf-8?B?c21iNW9pYXBlRHV0T05kWjNod1lHK2lIVThQMjcrNkNHUlYvakg5bUl6R3Vl?=
 =?utf-8?B?VXNYNW9KR21MMEc4Q0FvSzA2YTdVVGp5MjE4OG1kYnZDNU5GRVE3cGlHc3FC?=
 =?utf-8?B?U1p1NXRxa3lGRlpFeTU1emJ5OVRWSUVGNFR3ZnkrZnU2cEIrVUFYVEgzc0Z0?=
 =?utf-8?B?SlIrelRmdy9Ia0ZvbWFORElYcXMzRkl6S1BFL1VYN0dqTm5PSUJqZWhOcHBX?=
 =?utf-8?B?NzNVSFl2UER6RnNJZWdUYnlpT05lVXo3RjFPZWh4ZVZ4RE1YdWhRcTJzU1lm?=
 =?utf-8?B?cmtwbVJWQ2VKQXZQRFRjYWJlanM2Z2VidVBGNlZJN24wTXpDeDR6SnY2cjFx?=
 =?utf-8?B?d2lKUmU1TUJiaUJLTzNKcng2bHF3OGVOZ2NWeG1YQ1ZEUVVSV2djK0E4YjB5?=
 =?utf-8?B?dDQvenllVElLWUsxeUlRdzQ3R05qQUJFU3VRcTI0d2xzS0xzcEZIaUs4MTYv?=
 =?utf-8?B?dHBRa0N5R2oxeHBVZzJ2QzV5M3NrZDg1VnFleGRiaFBJTDgrTC8wc3E5YVJB?=
 =?utf-8?B?L2o4ZDN5bFoyRzBKRkx1NEJPeGdTK2hqaTBYaEUzVTl2b05TQy9YVG1Hbi9p?=
 =?utf-8?B?WksyVVBuNFpBSkxjbW9oVjlhZUFxdm1pKzZ4bUV1QTFWNHZ6VGx5aks1UW9T?=
 =?utf-8?B?ajBKV3Nac1hPZ0N0cXBYRTBqOGwzc2xpMnVESnF6MUNnTG9zUU5CSnhOaWox?=
 =?utf-8?B?bGFxeXRsYmptdjA0cVRUeEhPWEV2TUV3bU5KN0Y1YnZZNG83S1FKY2s0Rk1P?=
 =?utf-8?B?L043ZlRqSEQ0WDVmZkNHNkhuNk1YK1R1Y0JUQkFpYWFRRmJSMW5LVDRZRWFW?=
 =?utf-8?B?R2V0N3ZLZkVQeVlrbzZtV3luWHdLRDRyckFnWEJ3WkkxenN3d0NZVmdhd0Mx?=
 =?utf-8?B?ZVh6eEsrTlRTTHBieGo1MzBBeVkzOGp1Y1hkZEsxTHAzY1hMT3o1emVhNVB3?=
 =?utf-8?B?UVh0dVptV0VlWVM1a010MlRTY0tKeFgyS3hkYXZaZmhpVEVVcVk4dkNTYWlw?=
 =?utf-8?B?dkUrY21uYVBaTWtvbDBEWWNDS3V6RmVRbzkyOHE0OUNWWG5LVFBvZ3A1OFdF?=
 =?utf-8?B?VklZRW5XL3VQVGlvR3ZxWXM0c2srZlJMdlZ1N29pTmpGSWFMNi9oR25FYTY5?=
 =?utf-8?B?OTAzdlhmemYwRzhEajhlTU1xOTM5SUN5UnF6WEd6T2dYemJBenhublp4MWxJ?=
 =?utf-8?B?clpsNWVnNGdidnk5bXptUVdJU3p4Q1hVMzFkVE85cHR3R0hiT0J4SHdONFAx?=
 =?utf-8?B?V0tGanJJUVBFL1RhVlAwakFWYXJRcTlSY0craUVxQ1plSVJteUZ1OXdWRWcr?=
 =?utf-8?B?SFZXdzFCT0tpVHVpZ3p4cEdDMm1Qa2lNY1pRRm95V0tLTFhMUjJFSFRZSTVa?=
 =?utf-8?B?Mjd6SEhQdnVkV0I2NGRWQzRKOXp1S3A1QlZIZktVNUo4aWRSQXN2cUZVc09N?=
 =?utf-8?B?ZjNRVSt0Z1pPQ3psN1RwU25lcGdBSDE1eXhRaTA4S2ducldXQ2hWTHJTOVpZ?=
 =?utf-8?B?MGdaRWR1QUFtTFM2VFdpMVJNM3BBejVDak1uU2hFaXc2RmlXNFNOeXJlV0Jq?=
 =?utf-8?B?bU95dDJYeWozWktqbitMVnJDSXl1bTN3NmdKY3NsNEt5ekJJVUNLb2prVEVa?=
 =?utf-8?B?STA2dzVWYkVablNKQy9KRHZNV0Q5d1hjRGljYTd2TVRLemJsQ2tNdVlDNWZR?=
 =?utf-8?B?QllSYSsvQzQ5d2E5WnpSZHBOMHY1cUs5SVpnc1AwZkNveXcvT29IeStuemE2?=
 =?utf-8?B?Q2ZZTEhLQkQydVBBV2lLMVdqckpWSVovQ1I3TitGOWRGT2ZWN3Qyay9pdzNs?=
 =?utf-8?B?OW1Wd203M3MvS3JDRDA1bVBMTDRXWWpOSDhOblNuYlp4RCtPeWxNK1U0c05W?=
 =?utf-8?B?QVBmYUhYaHU4SXVzb0FGRzZWU3VnNENJZ3p6Wm1LYjNwbFB1dDJzTkdNYjVn?=
 =?utf-8?B?cm1xQ05maE5SUVBpOTNydU5zb1NUbnRHckxMdHM0dnViblNQc1ZoSjlTZDBW?=
 =?utf-8?B?UWc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fdf05b3-4b75-4411-8e39-08de26da9caf
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 19:42:30.8284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dTnEt/+REqofM8mB66q2U/aC1P+1nIwFCyCvGFyOQMjY9pDOqT8Q51BtIgdpSnB8cXKY/39ULDuqqt1peTfOghqrLw9Obi427SQS2LvdJBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6381

On 18/11/2025 3:08 pm, Jan Beulich wrote:
> There's no need to invoke CPUID yet another time. However, as the host CPU
> policy is set up only shortly after init_intel() ran on the BSP, defer the
> logic to a pre-SMP initcall. This can't be (a new) one in cpu/intel.c
> though, as that's linked after acpi/cpu_idle.c (which is where we already
> need the feature set). Since opt_arat is local to the cpu/ subtree,
> introduce a new Intel-specific helper to hold the code needed.
>
> Further, as we assume symmetry anyway, use setup_force_cpu_cap() and hence
> limit the checking to the boot CPU.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> The need to move where cpu_has_arat is checked would go away if we did
> away with opt_arat (as mentioned in the previous patch), and hence could
> use cpu_has_arat directly where right now XEN_ARAT is checked.
>
> --- a/xen/arch/x86/acpi/cpu_idle.c
> +++ b/xen/arch/x86/acpi/cpu_idle.c
> @@ -1666,6 +1666,9 @@ static int __init cf_check cpuidle_presm
>  {
>      void *cpu = (void *)(long)smp_processor_id();
>  
> +    if ( boot_cpu_data.vendor == X86_VENDOR_INTEL )
> +        intel_init_arat();

I really would prefer to avoid the need for this.

Now that microcode loading has moved to the start of day, we can drop
most of the order-of-init complexity for CPUID/etc, and I expect that
problems like this will cease to exist as a result.

Notably, we've now got no relevant difference between early_init() and
regular init().  That was a complexity we inherited from Linux.

~Andrew

