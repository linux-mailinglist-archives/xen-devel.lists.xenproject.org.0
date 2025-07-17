Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B1FB08D9C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 14:55:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046820.1417192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucO8I-0000lg-6I; Thu, 17 Jul 2025 12:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046820.1417192; Thu, 17 Jul 2025 12:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucO8I-0000kE-1f; Thu, 17 Jul 2025 12:54:42 +0000
Received: by outflank-mailman (input) for mailman id 1046820;
 Thu, 17 Jul 2025 12:54:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjFy=Z6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ucO8G-0000is-3a
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 12:54:40 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20610.outbound.protection.outlook.com
 [2a01:111:f403:2409::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31e431e1-630d-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 14:54:38 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by IA0PR12MB9045.namprd12.prod.outlook.com (2603:10b6:208:406::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Thu, 17 Jul
 2025 12:54:33 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8922.028; Thu, 17 Jul 2025
 12:54:33 +0000
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
X-Inumbo-ID: 31e431e1-630d-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wS4zNCywbmEVQI8jBMDcogqwFYuFy/p+j2b+rPIuSQOCUVQJfihWAHYQMg85jQKX+EitJr1OiSYr3+cfbxmCFoH2NQTPs6j3JxA1fPtfIpKhkB+ZYxCDLL49T7gLYE1six9fTa4N4KJVW/OAxt/tMoczwCNyq6Ebwebgg+470cnrqoiHWtOacEo/gwupChhrFB8S4/Xkhg7YBntHLx7KWJ7fT/XoW/UJNwSMdnW3H6cv7Fhuoy4TP3QzkfJ8wHLfhq8jsI9nEEX1G3/SPmmEJ/KEUCQ/VB4gWH17gv+oc7hFFVGYtJICKN552teQaChpzIjLF4ie3SGQfDeZjIz73w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WfF4Lp9C8aqBJ4UpT4VZIun+uhkOa2LDtmbOWFHEeIE=;
 b=EB5OwSFMM4gZk2DDfDYB61vBhqXAqPQ0Xa2mihurmIZ2pW3LyMBOqSzHfMo+ktRxhNW6L7qi6HslV+voT0qnblqjHdnDuHD3MM8FwlwCVAViaSTX/PAtoa2oBYW0VIatIOGxagVWJnVIT5ngMkVqwdyjHGoRifNFJ7COK7dJ0WLLqR4vSq/GgKS9+s1WNpPznoAOJFwDh2Nhx5yvfthVlDWInb+7f0nF2lcbBWVNzR2wXUvwYRow6D06TDuQVYbcqOtVXbqSxCsH+s+nTNKYi/D/NVOE/T1CnYCEqqvn935M0qj33zp2mP39sAUoMQSPPKHdxLe16ja5FLTEojBZRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfF4Lp9C8aqBJ4UpT4VZIun+uhkOa2LDtmbOWFHEeIE=;
 b=YUtatn6cm1gaICEDrXdQo2EHkX0KAretZNtfpBUzhCMeGzucNsXWvPJeg8LrcPDYi4TMjhxoyUXmqMNODDSWyduB/FVpYwyl+TbGIrm5iaai72gcbeSLQAcZQ5T2B89mGY2U92vjRD32n153PTyjZmA2Lg2XSqxqs8R0PQh8JbM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <43e05cb4-c17e-41ac-bd14-413e073f2c2e@amd.com>
Date: Thu, 17 Jul 2025 14:54:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm/mpu: Implement early_fdt_map support in MPU
 systems
To: Hari Limaye <hari.limaye@arm.com>, xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <cover.1752565274.git.hari.limaye@arm.com>
 <e6a881be371c54a6bceccfac2a7c2fae887ea023.1752565274.git.hari.limaye@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <e6a881be371c54a6bceccfac2a7c2fae887ea023.1752565274.git.hari.limaye@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::10) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|IA0PR12MB9045:EE_
X-MS-Office365-Filtering-Correlation-Id: ba7d492e-a2fa-458b-8681-08ddc53113db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TjFsTlUrbElpMzhVaDB0V2wySzBLQTlnMFJqRXRVM0xabEEwNlFHN0N4dkpn?=
 =?utf-8?B?ejBFQnZkcUtsOW9XUFFBRmtXQVoreGZsK1pOcFdVUlFTTWhVVXA3MThyYzdv?=
 =?utf-8?B?V0RKS3U4bTBhR3lvSmx5VU15dHJNeGR0WjBiVmtSUThyN2hGdzdKdFhYeDI2?=
 =?utf-8?B?VVZWNzZOZVRiM0xkSitqSFZFRjJ0V1RUcEdLK0FOc0RsVWl4V0hPNnlDZVhl?=
 =?utf-8?B?OUlEUnZLZHRURUhVTk04dzlPeXJzcytSNXBjTWtxa0oxZjN6a25SUlJHTm51?=
 =?utf-8?B?SVowcEM4KytVZE1aeG44OFBMeXlVTEYyYnZxM0Q5ekNkY1g0cEZ3TCsxOG15?=
 =?utf-8?B?UkplTXdNc0U2b1p6OUh3QmhnbWlQTTFJWEd3Ty9BVzRPdWsxZmt3N0IvR1Av?=
 =?utf-8?B?Wm9GK1JIRW1LVU91Z3NvbFZ5QlY1enBpdkhqYUJ3aFNmRFVTU3IwN2hvK0Fr?=
 =?utf-8?B?M25IVlAwbmdrUnFhbzdUZXRmdi9YeDMwUy9YZjhrRUwxZ2t5MTlyd0NOeWpv?=
 =?utf-8?B?SU1DYzQxTGprMXh1RUNYRFlnNGtJVWllODZPV05ETzgvenR5Tnk2OWRqWi9E?=
 =?utf-8?B?QlBYUmZFajQvSG5MaFJDaVMvMXMvdVlQckVKRDd6dWNxYjZkdGxPMEpzQ29E?=
 =?utf-8?B?K3h3bjhNbUx0Ym96ZTR0MmE2bjlWVURBYXVYSmdxNnR5Mi9KZlFIQXdwVmQ3?=
 =?utf-8?B?cVJxVEY1UDRUaDY4ekJQeVZjUk5UcEJBaUhkdkhGV2N2WDlIdXE0MnZzZVg5?=
 =?utf-8?B?eExWTC9OOGJTM0RITzBpRWRkaVBLVVlQZVp2MGZvQk9jeWpuNHh4UXdONVFm?=
 =?utf-8?B?R0RxbHMwUFBHd25jTmQ2MThtU1M3SmhhVU5hVVppMDRaOExsTmN6djhnRHk4?=
 =?utf-8?B?elFxM1pGc2dFWGg3TXJnMWhkSEJIcjg3bW1tclN1RXFsNlV5RDYyWDJ6SWlI?=
 =?utf-8?B?MzF6bmhxYmhEK2JWTXZPd3Q5V1dDZ0lZdEl1dkNyRlZEWjZ3eDMrd2hRaUNF?=
 =?utf-8?B?dG5qSW92UjZPZ2hDWUlQSDF0WGRDS0dXUVdyVmxLSEhJeW1FbGFTU1BzTXVV?=
 =?utf-8?B?bDJsd0U3ZC83ZktmMFJiQUV4TlFlR0JsM0ZURFphcFROV1g1cE13K3E2RkRt?=
 =?utf-8?B?by9TbHN2VHZnSlpiSERiSWxzbFZLOXNVeTBwREtSektIaWFmMkQwTHFMQ1NH?=
 =?utf-8?B?alZPUkkyRzdGT2RUbFl5c0s5cWpjRTF1Z1pDcS9tMXdZSW5Hd1Awd2t4ZEgv?=
 =?utf-8?B?dVh4QTVXcyt2WHIxd1BNWnh1N0JmRlFpTWxRL2FNUy9VNUJhVGMrSUZMNERM?=
 =?utf-8?B?ZW1veU1hbzRzQXpKUzZwejI4WlU2K2lzM3pKODRJeXVMMWpZU0ZoRTRMa0xq?=
 =?utf-8?B?cHJXM2JQNkI5NklURjlBV0JmRXF3MG1WMThkdHhCblNIZk1DTXhjNEo5V2xy?=
 =?utf-8?B?NW03QTQ2aFMrSzBUM0NITm1JNFdlSHdPODE1bkNLUmFDNnNzbFgrTlBJT3dz?=
 =?utf-8?B?ZSs1eEU2NDNoVnVvWkwwLzZCS29lYWVzYXZWQk1mWURaTWh3amZRTFFXaXFv?=
 =?utf-8?B?RlpjSlFqa01vL0ZLaW5PYWFsbW4vRTVramFZWHY0dG1XdGVuU093bTZ2UGww?=
 =?utf-8?B?aFNXbDlsL1R1WmRINkpmQkVzelRzdkFBTEZXQ2tmeS93NEJIRHZuMldwNVRi?=
 =?utf-8?B?ZjV2QStBd3lhblpEY1NaL29TamtyY1gvcnpTcE1IU2FlYU40YXdVdmxON0g5?=
 =?utf-8?B?am0vUk04V3NhcFVVWUlYSlovVVN0czdkYytqLzBaUkgrSVRuQzFpb09iWlZE?=
 =?utf-8?B?M2pIT0VJcFRULzVKTkJEUy8rMm1tRTA5ZnowZEpyUUZEQjV3amRtZTJUQUtS?=
 =?utf-8?B?ZytlbEVkZGp4QnBjTXBLaUdXRSs4dnFqVkNobk1mcmwzK3dqTC9jV3dGTldj?=
 =?utf-8?Q?ogqTSdisn0I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmtKOEVVbVJwbWtLWk9mUXZxS01na2ZZemhJY0JlaVd0VjRnZUc5UmxXQkh3?=
 =?utf-8?B?emxLdmt4a2lGWmhOdThpdWZCQnJHT1k3RnhteEEvbFNZMVFkaXhpZDFxc0pZ?=
 =?utf-8?B?UVBZd0lNb0pzRFBZZ2JNSkM1dXd2VGtFV2lvNkN5LzNFQTNDOW5Ha3NhaytY?=
 =?utf-8?B?SlFxQlJmdGlIcktjUm9vSjlkRXVNNXBaVEFsdHg5a1dER1V0a3VHdFZUaGkx?=
 =?utf-8?B?SnU4NmpFekpqd2dJZ0grM2M1UStrcmV2T0w2OFk3bi9sa1ppMU5KOWY2UGxa?=
 =?utf-8?B?emg5NHB2OWRsVzlZL3RHOCtQOXVPaFhtRk4rbFlwNUNLZ1dTcDFvU1BnU3lC?=
 =?utf-8?B?cEdOcjR5THE2NHFNcGNSbWNTUjArK2ZXYXh4cFdBbnk5dFpRenZNdmlvSVRu?=
 =?utf-8?B?TEkvVW4wcXF1aXFmMHRNQi9pclg4ZjVQWFIrSTBuOFJvNVN1bjIvWFA5eEcx?=
 =?utf-8?B?c1hSdVFVSXVsc3lpdkJwbmRQd05MYXJqRWFkYjFvcTZLZGluZDZkdzg2WDQv?=
 =?utf-8?B?WlhDeU9naTA1VFI0SmJOakg2VnV0c0dOZU0xc3NtejZVL0NKV21aNUlQc0JE?=
 =?utf-8?B?clphNlZYajA5Tkh3MnZoRlhuY29jQVQvTzZHYVdWMnpQNlZGMnl4V1Uxdktz?=
 =?utf-8?B?eVdIeUNFWTBabjFlQmpJRmdjVE1LdEVyRlUrdGFxMUE1V3RoeEVhc3BqaHJu?=
 =?utf-8?B?ei9abUE1d1VUUHFTRjBZbzJXd0UvcGhYNSt1aGgxQ1ZFTk5nbnVic2c4dHlN?=
 =?utf-8?B?MklwNzdYN095MWg2NzExVTQ2UXZHL3VHc3FKQUU2WEV4ZFVQOHlqNk4xNVIy?=
 =?utf-8?B?OVFtWktqemd4MkdQL3hvL29DOXlEMENKMnMwbEdRNUtWcGlRb2cxd1NEYkJr?=
 =?utf-8?B?blFmd1VaUXVuZDdzVlB5enhQZlFwNzU2eG5SNlhWOVhPQUQxN1Y5d2xhQmRV?=
 =?utf-8?B?KzExL2t6QXZRRUFWOHZBeFlTbGFVVTVlTXlmM2NBYldFYnpMdmZFOVluWC9r?=
 =?utf-8?B?WVFPOTJ1bG0rdzBUOGR2VkhGUHZRSFpldUk0aDF0NXZIeFFYYzBKV0J2SnI5?=
 =?utf-8?B?Z09xK2JkeHZIYWM3YVFhYkxiL1ZDdkNpd1BON21HTkh0TCtRN0tOdzZyZmF6?=
 =?utf-8?B?UkEzUklCUXQ5N2dzTTRBcmhIZ0xudlhPbWxLQkx6b3lqcHRmUjVSWGE2TWkv?=
 =?utf-8?B?c1J5RFlkMTJqL0Jzc0lhUkgyTEQrdkoxTVk5M2k4UktRcWhlc3VNV1NkWVNw?=
 =?utf-8?B?am5scmZ6SGgwb1I1ZkNSK0pVUDhtM2I5UyswT0JvbXpXbDZVSWZoblE2TXM3?=
 =?utf-8?B?SC9JQ3NaWWo3aW1YUWp4Z3hlTW5tbTY3S1dJV3kwd0Z6U0ZEcFFpZXhhYWI4?=
 =?utf-8?B?ZTRvWVpRbFBLT21QNHRGd25ZYjVWVDVmRkpIU0VNbm1oWXM0K0JjUkZ1TkMw?=
 =?utf-8?B?MEJjWDZ6NDkvOTdFVmQyT0p1a1dlZnpNNUcyQU0vMW03OVFmaWNGa25oZ1I0?=
 =?utf-8?B?OXJoQUk4VmYzbk1SRkh4RS9OMDdoUlY3TFdrQmN0alVpS2c0WlVHZ2pKVjJ0?=
 =?utf-8?B?ZjdJSWREWUpMMVowSUdiY3dNdXlRYk5nT01jZ2dhMG5SLzEvVVEyRTkxQlBS?=
 =?utf-8?B?UEk5dUNQUlJKcWFicTNnV2dDS2lBOFNReXliVDB6a3hZQmo2cGdacHhid25Q?=
 =?utf-8?B?ZG9ITjlkOXNDOGxveWljZWxQVUVZbWxxRTBsbDMxU1B6RmZFNzBhLzdPVVR3?=
 =?utf-8?B?elFuS2lCbjZpdlB6L0p6NGhzRnZRMjdtbkJZckh5MTZDTlZkUUVQN2NaSDRQ?=
 =?utf-8?B?VnZFUXpGK0NpZ0J6TWpremoreWhDZ3VjNWF6SHJld1ZiUllobmdTKzExamY2?=
 =?utf-8?B?US9CYnJSQnRZZ2RjcjZEZzlYQ3hkNHlZaVFFUnNnYm9IQU5TMEg2ZkJ2dGFD?=
 =?utf-8?B?WUZWY3FETUZqcEhUdWJxQnNJZ1lQNUhzUm9JaStQcDBHNWtFRFhlMDh1elEv?=
 =?utf-8?B?dmNSWWNKUVlyNjZOOFRSYWNyVzFoUG5jQTdYS1ZjTVhxM21QTmFKWlFpeHdj?=
 =?utf-8?B?MGtOS0w4b3JFNWtCUU5RcG9mbWhpUGdzZndkb1dycGwwbklBNytpcWk3MDdH?=
 =?utf-8?Q?gVRGOrzT2bTS7xCYIgLGFhaQk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba7d492e-a2fa-458b-8681-08ddc53113db
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 12:54:33.7235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4n49z0g15rro+Gv3SZ/qbtbXHWI6nYtfTzdIjoDAZkyGrIh/rQAfAxoV96os8sLV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9045



On 15/07/2025 09:45, Hari Limaye wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> Implement the function early_fdt_map(), which is responsible for mapping
> the Device Tree Blob in the early stages of the boot process, for MPU
> systems.
> 
> We make use of the map_pages_to_xen() and destroy_xen_mappings() APIs.
> In particular the latter function is necessary in the case that the
> initial mapping of the fdt_header is insufficient to cover the entire
> DTB, as we must destroy and then remap the region due to the APIs no
> providing support for extending the size of an existing region.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from v1:
> - Add Ayan's R-b
> 
> Changes from v2:
> - Rename mapped_fdt_paddr -> mapped_fdt_base
> - Remove full stops
> - Add sanity check for MAX_FDT_SIZE
> - Improve comment regarding early return when DTB already mapped
> ---
>  xen/arch/arm/mpu/setup.c | 83 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 81 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/mpu/setup.c b/xen/arch/arm/mpu/setup.c
> index b4da77003f..a8cea0d9af 100644
> --- a/xen/arch/arm/mpu/setup.c
> +++ b/xen/arch/arm/mpu/setup.c
> @@ -1,17 +1,96 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  
> +#include <xen/bootfdt.h>
>  #include <xen/bug.h>
>  #include <xen/init.h>
> +#include <xen/libfdt/libfdt.h>
>  #include <xen/mm.h>
> +#include <xen/pfn.h>
>  #include <xen/types.h>
> +#include <xen/sizes.h>
>  #include <asm/setup.h>
>  
> +static paddr_t __initdata mapped_fdt_base = INVALID_PADDR;
> +static paddr_t __initdata mapped_fdt_limit = INVALID_PADDR;
> +
>  void __init setup_pagetables(void) {}
>  
>  void * __init early_fdt_map(paddr_t fdt_paddr)
>  {
> -    BUG_ON("unimplemented");
> -    return NULL;
> +    /* Map at least a page containing the DTB address, exclusive range */
> +    paddr_t base = round_pgdown(fdt_paddr);
> +    paddr_t limit = round_pgup(fdt_paddr + sizeof(struct fdt_header));
> +    unsigned int flags = PAGE_HYPERVISOR_RO;
> +    void *fdt_virt = (void *)fdt_paddr; /* virt == paddr for MPU */
> +    int rc;
> +    uint32_t size;
> +    unsigned long nr_mfns;
> +
> +    /*
> +     * Check whether the physical FDT address is set and meets the minimum
> +     * alignment requirement. Since we are relying on MIN_FDT_ALIGN to be at
> +     * least 8 bytes so that we always access the magic and size fields
> +     * of the FDT header after mapping the first chunk, double check if
> +     * that is indeed the case.
> +     */
> +    BUILD_BUG_ON(MIN_FDT_ALIGN < 8);
> +    if ( !fdt_paddr || fdt_paddr % MIN_FDT_ALIGN )
> +        return NULL;
> +
> +    /*
> +     * DTB at this address has already been mapped.`start_xen` calls this twice,
> +     * before and after `setup_page_tables`, which is a no-op on MPU.
> +     */
> +    if ( mapped_fdt_base == fdt_paddr )
> +        return fdt_virt;
> +
> +    /*
> +     * DTB starting at a different address has been mapped, so destroy this
> +     * before continuing.
I don't understand this scenario. Can you describe it in more details?
I know that early_fdt_map will be called twice. First time, mapped_fdt_base ==
INVALID_PADDR and second time, mapped_fdt_base == fdt_paddr. What's the other
option?

~Michal


