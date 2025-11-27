Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32981C8FF5B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 20:00:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174327.1499275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOhE0-0008Sv-KM; Thu, 27 Nov 2025 19:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174327.1499275; Thu, 27 Nov 2025 19:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOhE0-0008Pt-HU; Thu, 27 Nov 2025 19:00:16 +0000
Received: by outflank-mailman (input) for mailman id 1174327;
 Thu, 27 Nov 2025 19:00:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jSjm=6D=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vOhDy-0008Pn-Ie
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 19:00:14 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ccf6f1c-cbc3-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 20:00:12 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH0PR03MB6147.namprd03.prod.outlook.com (2603:10b6:610:d2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 19:00:09 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 19:00:08 +0000
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
X-Inumbo-ID: 4ccf6f1c-cbc3-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aLbi87JenYpaz7hph1m2aom+UqUOSINiS9ysXQEw24JqHV0bTogCZGy5GhEUAnsZC7VEtXU0Cvn9ZclzlLbnFBbVv7jReFYfgeNHBX9KQDCEA/UzNAyFCg4DVhMf00oU/+6T1+3I6bK7O8I/7XpUufUUgtRLxOxOnTeEjFGNDASOkfvH+EB4xF5KGt+OfAA9oegUqgFq05bBjSu6GS+5dT3AHTzS3MdTOkz7akinbgdn+0vb01pwqNe4sqZev4FtYl9IBr5ZCbjgRNz7+e1/IsIVOoYvGqTryLderE1uI4InLx5wmuI4I74wW+u6GEhy/JuiRWsukkEQbNtiAhE2EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7wJlR7qEARQva3sdo/oB5CDQMH8trI2DZKgM/JXrpA=;
 b=oDenQMaWftytZs9Zex9JMkYNz4RO+u9KNFfBcY4RjZwWjOyIKN+jAY52TY8sGcrogthhRo/eGdtVSXrS8sNZ2Id2jqoYCXLWLSI66mP4MVDJBM5cT28Z29RzOnv2y6yxvQGLgvjMa6GIe6rP+tCFKKH24LbDD3b0bgPPxuuwUTlySKgk4SS5Jh3X5+xezFeQDnImU5r7UrCiB+R8NTKxHiLQX20VJhHJeIIc4JnW6dbelOJAQktBYpzLgKTXCPqB2tkRmdrnw3IhEyJdX95I+jo5XvUdj1ixDB/tY65THw7GfgCIVfISh/vUXF0x48i5+enYo57UnXYdhz52l14DwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7wJlR7qEARQva3sdo/oB5CDQMH8trI2DZKgM/JXrpA=;
 b=tMthip0AgRt6xHDPngrgsDQLR1zwOh+x2kYfP2FEmgqXfWFgOgpFOkwQUlmPVITxJUzVPyyjHKOtValnaoYdktD2gqUtLw6/A5IpMelhXRZqKw6PJp+4Y24BqFn09Ph87TmaGuZHoZdrpL6Z18GgXWYw6IAUINycIYirisV756o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6a60f01e-33dd-466c-a93d-6b0720180ccd@citrix.com>
Date: Thu, 27 Nov 2025 19:00:05 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, roger.pau@citrix.com
Subject: Re: [PATCH v3] x86: Remove x86 prefixed names from cpuinfo for
 intel.c
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20251126191945.3386781-1-kevin.lampis@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251126191945.3386781-1-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0497.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH0PR03MB6147:EE_
X-MS-Office365-Filtering-Correlation-Id: 42f1d581-d446-49cd-6c98-08de2de72f5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXg3YWhjL1kwK3hCZjU5VUYrRlE5bHFyenlrcGpzY0FKMWlJYU8rUzRXTjhW?=
 =?utf-8?B?dG1zb3VrbmVab2E5eXRnUHptSEdFY2pvc3cxVThKa2VreC8vck9ITVVsWXJW?=
 =?utf-8?B?VkV6MUNXR2lTalErUm85RTdLSFhkTTd5SE43MVI1VmJlc09jRmN6MlVVdmRp?=
 =?utf-8?B?akZHbXhudis2ZjlUcHNlREJFQytHOEFQTHF6V1FwSGVlcFFnV0NyeDFQRmRI?=
 =?utf-8?B?TWpnQXNvZnlZcm0xNXR3c3VsSXZEMHlwZnhBUzBna2FndGFpODFLU2RhQmdn?=
 =?utf-8?B?dzVPL21Kb0dtQ0JYSTdpeVJUUHVXWk1wRkdaYXRKcXZsQ2s2Q2haMnBNYjg5?=
 =?utf-8?B?b21GTWo1WkhDL2loOUxuOFBzaTQvaDF4ckQ1ZjdFa1RrQlBXUDg4bFVDWFJv?=
 =?utf-8?B?NEFQdGM2alVMa2VERXc2N3hlNUYzQ1ZQd25WUURiOW1uQ3RsMmVaSFh2ODZr?=
 =?utf-8?B?RWdKbmtvOWJSYjNaLzhJM0N1TmkzU2NicGk0OWJ3OVduelpxdkV3NE40VC9S?=
 =?utf-8?B?TDJqRVhIWkpYNWtqNVRvT2J0enFNbUFpdnVVQWxVcXJ2NzJiVkQ3TmFGRXNW?=
 =?utf-8?B?Y0w3SUYzdGg0cHdNTTZBUmNnUDluUE1uV3lrekJYTjlhMmlPUHp0bWdHS0Vj?=
 =?utf-8?B?WVVGQnY5cGdycTE3NGsxOVppRC9RMUI3Z1p6MHpLd2tqN2tNVG1ZSUNLaFBz?=
 =?utf-8?B?Z2VlOWRhMVFnQjVaczB0S3ozZ0N5QnZuVEJKekNjTmpFVlJJT2RpQ1ZFYUg2?=
 =?utf-8?B?OHMyQno5WXlzTFd0L3RCQ1ptdnZpQ3owQWUrbHZqSmJPRmMySmhhdmEzQXJt?=
 =?utf-8?B?c3BrUWdCTFFuY0x3aXd4aVRkVC93ZU5JS2lEL2g3L3M2TmtmNEJQZDJVSmxt?=
 =?utf-8?B?OU1HZnRXalM4enR6V3pZSW4xQmhpMlltZlRhM1oyYmQ0SDFPWFZnd0ovaUdh?=
 =?utf-8?B?N05QZFo5VFRrbHBUQ2Jwei8vbDBySGZZSWVubVdwbFZ2ZlpNdE5xa1Y5R1V0?=
 =?utf-8?B?eUJ4OHdrd05uRXhLRXRrYWl0QWhYaFhYUHZpdEl2N2JhZW9ybG12aC83YXpK?=
 =?utf-8?B?VVA2K2Q1dU5lRVVhYUlpeVRCQzB5ejBTbEYyT2JKMTlLZit6UTNSOUxta0hC?=
 =?utf-8?B?encvazJXalJCWW8vRVR5QVJTeWIyWFZxM1B5UlRNSEY2QUQwb3BCLzM4SHBE?=
 =?utf-8?B?MlJjbDRJSjdHaGgwWDhIcE92bnI3eCtJRVBidmp4VFhXUjhmZ1k4RVd4OVgz?=
 =?utf-8?B?VUk2emFjbEdoTllaKzQxVXdNRHZNa2NMR1V3Nkx3WmpnekNnc1pBbnlDdERY?=
 =?utf-8?B?R1JUU2lHZHFjL2JsWU01RkVQdm16cmFNLzhEWDBqdG1qNExybjlkcjl2NnN2?=
 =?utf-8?B?TVNiY3JEV2pMeGN3OTBkRHdDTGE1WGprL3FqYVBwL3VUZHU0LzZFeUJVNDNq?=
 =?utf-8?B?eFdvWEhlMElJMHVLTDJDQU5lS0RLa2ZqbHMyNjVMQ29rRlh2RysxUWhvRU9z?=
 =?utf-8?B?bUhmeGdQS2pRd2FLRWtkZmUxREJLcHp5b3IzZEgrNTV2ZFErQy9OU05oc0Jx?=
 =?utf-8?B?UGU1WHNUazN0R2RuQ291Zzk1MFhNL1I1N0NOdmZyak91dlF4VkVOTFNBQkJE?=
 =?utf-8?B?c1lOVjlRa1RBTENwVnZrc3BaWmVrSzBsKy9ISkZydWFqK0N4b0tZMHNJKzVI?=
 =?utf-8?B?WnM3TmVhcVN3YytmZzVvMzg5MHJZN3N3MXliSWwyLzN3TkM2d3ZLcXhsN2oy?=
 =?utf-8?B?YVN0eGd6bVM4OGwvMXo5cVZuSWhUdkFST3dYQmVFRzZTb2NadTR4bkRyaDRC?=
 =?utf-8?B?ZEZLanF1d3ZuVjBYUG1mWEJGczZYWVR2aURGQnlkRlBMY3VUMVZMdndmakZn?=
 =?utf-8?B?MXA4VFVPQjJLK3VuUk9GQVErRXB4TTNlOHFCTWFsSnQwcEE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTBEbUUyRXdCbjBxMWFRL0JhSnhCa3I0eHZsZ0lkQzNiYzlEWVUxT1pxVjIw?=
 =?utf-8?B?SGFSV0kyTmIzcTZaU1lFOGhvMHRML2xhVzMrbWZZMGZNdkRiT0Y0dTlUSmZP?=
 =?utf-8?B?MXlqL01KcEdLWHBOV3BuTlp2dG1kazMxTFFCTHZTUkJQOFpOeE85c2J1Mkht?=
 =?utf-8?B?YlNMbVpCY0VRR0N5NlZ1bEdSRlJUcGkxb1pIQ1gzRVk2S0dKc1lZTkwrVWZT?=
 =?utf-8?B?cHVqVTZLeTdYOG1MaXdqV2dVWDR4cTNlU1dWeEJwS2c0WGpGWG51QTd3K2o4?=
 =?utf-8?B?WWlzUVJKQ0VGTmIwQ3F1RkpMQUl1TzZSd3haVUs3QkxCZlJUSG1MdWxVTlR5?=
 =?utf-8?B?dXN5TnhFWWppUGdBMjF1TDZ4My90Q1lJSWx2MjNCZWJUSVFuTEd4UUhoVG5w?=
 =?utf-8?B?THRhaFFqQm5GUUN6Yjd1SEtJOVZRekJQSGZpZ05RdGR6MHFhc0pyNTUyMWlE?=
 =?utf-8?B?WHVKQ2pVa2NLakVzMWtoOGlSOHdvQjhZOEl4MGVnZ3ZzLzFwYW4zV2ZiNDVW?=
 =?utf-8?B?ai90NlpOVVhCVzM0ZDdwOElQcWNjL2xlS2NJc1Q2QzlSamI4ai83MGV5RW03?=
 =?utf-8?B?dGtMOGVRZElMNnZvbk4xdDlNZllCTlhGbDA3L05ZNG5aN3BRZGxuNk04b1V2?=
 =?utf-8?B?WnVwMG9oME50d0U4dEt2Kzl0Sm5TeWJ6WWYxSXNqNVdoUEhQM2FJa3ZldENp?=
 =?utf-8?B?cW9IRVdBVFAxaFV1MTJLS2ljdzg1QUxSdXRGNDBKMVpEYmFVRGUrZEdLYWdP?=
 =?utf-8?B?MjZRTkxET0ZGdlhqZW9MMW9GMlVBOXJjUEhQVk4zQlM5cHN5QWx0SzFReTNo?=
 =?utf-8?B?V0E5M2QvRFZ4S0d6SUcxWmRGTm1rVlBCRHdLaUtWRWJXTGxLNkpDRnBUcys3?=
 =?utf-8?B?cHdTSUdtdFkvWjdyR1VqeVVQTnUzd2dIaDQvTU1TQ2tsbm52Wmt4SHIyR25M?=
 =?utf-8?B?V3hVZUlpKzI2eHlkajRLOFBNVE8waklTVUdtQUZPYm5YSlh0NW9kVUdQdzZo?=
 =?utf-8?B?dXMrQ0lkTnNwdmFtYTVsaHFQYW9qb0ZyTkdnWlF4RDBPQjVlVzJxY2VlM1pC?=
 =?utf-8?B?ak5CaVpCMDU2QTcvSU81NTZ2Z1RrUmUzTEJrN3pHT3VZQzZhZGNRcjNZZWFJ?=
 =?utf-8?B?MjJFYUdEb2VTTDRZd2pGNXFuMnR0WVVyLzV2OHJpZ0hBbUt1dVlwRDhaalhD?=
 =?utf-8?B?UVFUMTlhSkc4c3VYNVlkaUlWOFNFRjV6aHpTQWN6RWErQzlEa1djSTRZNDA4?=
 =?utf-8?B?R1lPNHlvWGc3R0VPTFVaNjZrZk04cEhLbUd3cnliU2JiejV3bGhCTW40WXlj?=
 =?utf-8?B?WWgyRnJiNXR4b2g2R1pNN2JIY0FMK0xIczZnQlBUMUM2Ukt1NDVzNnR3OGpZ?=
 =?utf-8?B?dVpQVXRyVUpSMS9oOUJHd1loaDdRaE1RdWY1T2pQWnJkdURoUWpqTHlxdHQ2?=
 =?utf-8?B?bk42NENNSURHOW1mMlU1eW9Rc0tFektwOHFHYXpCWGFTYWJuSHpYd0I2MVVC?=
 =?utf-8?B?M3MweGNWbFpwNFc0dWo5RnZBcWR4ZlRSUXF1L25uR3piVU5nSkIxaCtoUEhZ?=
 =?utf-8?B?ODJVVFNLMkFyVHJIVENTK09BMERUSGQzYjZWWXc4Z211QW81NkJnYXJVV2dD?=
 =?utf-8?B?YTBEZklabks1anR4akNvNzY0VmNVcWJCamhxNHFpN2dGaCtnRFJRN2VuL0M5?=
 =?utf-8?B?eldDMXZUdWcvMk8vSDlJZ1lnMWlpOXBsb3hGMnlwdFk1Zm5JakxzTnZab21o?=
 =?utf-8?B?MEl1c3laKzlrMlBYVVZsQUdmeTN6d2Y5cFB4Z2YrVUh5YW9KL3IzVmF1M2dM?=
 =?utf-8?B?bUxYOUVnTGF1YU9qUmlsakpVaE5vb0srS3RDbVhkREh6aHMzZXFnenE0RTlo?=
 =?utf-8?B?enpPVGhuTmg3YW5kVFJhWnBjemMxNjFZTFJQRVRBQlpEVkNtbjZZUnFjaUZw?=
 =?utf-8?B?SVZLK201N0NuMGhNbnhDVUEzd3dtYk1LenRLKzh6YitRWGNMMU5Wa3ZNMllN?=
 =?utf-8?B?ZFhTYmh2UWVVRENERjJtN1NjODlMbG9pY295amkyTnJMdTh1NVROTk95d2tP?=
 =?utf-8?B?RXFCN2NXS09rVGlUTklXa2diZkxjYkFuL3BVY3Jva3lMbWV6bnFuL21TSXg5?=
 =?utf-8?B?cThFeG0wYk1rSFo4cnlUSythQWNFM0x0UytWWkpWWXdwbit6U2FLV1pyUjUv?=
 =?utf-8?B?RkE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f1d581-d446-49cd-6c98-08de2de72f5a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 19:00:08.8967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qflhn6IIV/5CDFb7kqgfm7qPJXAtFMcOLFr+iChu1npwT4yGcqLGXoYnxSn5vuSl+kAZ3JE6ktLT4x+ZWboT5Uv17gBU9HtMTnBMJzbOKWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6147

On 26/11/2025 7:19 pm, Kevin Lampis wrote:
> diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
> index 6f71365b7e..ff20f5667f 100644
> --- a/xen/arch/x86/cpu/intel.c
> +++ b/xen/arch/x86/cpu/intel.c
> @@ -137,28 +138,29 @@ static void __init probe_masking_msrs(void)
>  	unsigned int exp_msr_basic, exp_msr_ext, exp_msr_xsave;
>  
>  	/* Only family 6 supports this feature. */
> -	if (c->x86 != 6)
> +	if (c->family != 6)
>  		return;

The f in vfm is Family.  This condition should be dropped, and the
switch() gain a default which simply returns.

> @@ -265,7 +267,7 @@ static void __init noinline intel_init_levelling(void)
>  	 * so skip it altogether. In the case where Xen is virtualized these
>  	 * MSRs may be emulated though, so we allow it in that case.
>  	 */
> -	if ((boot_cpu_data.x86 != 0xf || cpu_has_hypervisor) &&
> +	if ((boot_cpu_data.family != 0xf || cpu_has_hypervisor) &&

Everywhere else, you're turning 0xf into 15.

I've pushed an interim
https://gitlab.com/xen-project/hardware/xen-staging/-/commits/andrew/intel-vfm
which has the style corrections and these two fixes.

> @@ -657,14 +670,16 @@ static void cf_check init_intel(struct cpuinfo_x86 *c)
>  	/* Work around errata */
>  	Intel_errata_workarounds(c);
>  
> -	if ((c->x86 == 0xf && c->x86_model >= 0x03) ||
> -		(c->x86 == 0x6 && c->x86_model >= 0x0e))
> +	if ( ( c->family == 15 && c->model >= 0x03 ) ||
> +	     ( c->family == 6 && c->model >= 0x0e ) )
>  		__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
> +

This is logic that becomes buggy with Fam 18/19.

https://git.kernel.org/tip/fadb6f569b10bf668677add876ed50586931b8f3 was
the Linux fix, which will want adapting as a prerequisite fix.

>  	if (cpu_has(c, X86_FEATURE_ITSC)) {
>  		__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
>  		__set_bit(X86_FEATURE_NONSTOP_TSC, c->x86_capability);
>  		__set_bit(X86_FEATURE_TSC_RELIABLE, c->x86_capability);
>  	}

Note that Linux's opencoded "c->x86_power & (1 << 8)" is really the ITSC
check above.

I'm about to commit the resync of intel-family.h so that will rebase out
shortly.

~Andrew

