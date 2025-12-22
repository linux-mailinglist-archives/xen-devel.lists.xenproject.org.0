Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8377ECD69C2
	for <lists+xen-devel@lfdr.de>; Mon, 22 Dec 2025 16:47:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192116.1511442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXi6s-0000Zp-8v; Mon, 22 Dec 2025 15:46:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192116.1511442; Mon, 22 Dec 2025 15:46:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXi6s-0000XM-5f; Mon, 22 Dec 2025 15:46:10 +0000
Received: by outflank-mailman (input) for mailman id 1192116;
 Mon, 22 Dec 2025 15:46:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mqKC=64=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vXi6q-0000XC-KP
 for xen-devel@lists.xenproject.org; Mon, 22 Dec 2025 15:46:08 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53f1b81e-df4d-11f0-b15b-2bf370ae4941;
 Mon, 22 Dec 2025 16:46:07 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB5921.namprd03.prod.outlook.com (2603:10b6:303:96::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 15:46:03 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 15:46:03 +0000
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
X-Inumbo-ID: 53f1b81e-df4d-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4O6ipPvBMqg8wjex1FoTcqmGm5oVQl7ikI5IP4uli+erw7Bv71dS66bJ/DAuFu8pZVtCtKW12upL3cu5OREH4/llqzHuK1l0EoYOwKWJtEOlrXHlq5yiWtlVi+9u4Lv4UcFoEjGRHwKbSrgHa/YKiZ6rgDAlO/WtQ8F4GlHXixzscLKKEan2799jk727YpTLVwyu4ReSqJFAqF9ZNH2Oycctoo/Kmwc79nJvIdbNTJRUhT0enoWn9MkJCQjHwQ3Xhk7RhGH2zhc1JyOLvT2p38WO8t6jc0aI/P6kFZ8MhPE6Qg6VKAYrbXf3LAel+TtBoOwNin+UVQeDDdzFnOBCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrXCpehgFdGcefb/Fwzjhb8ry+80hg3Zje1HgxPMH1I=;
 b=peJKGtea8kT90Y0MlEmmg6RTFPoxcY1TGimAENQADWAJNiihBMHaSrYJv5vznwl3r4W3V+3aYcSuidl7oKVyjlRX6GCqwd4tYiDDKGIjOfQMRr/nNdBodDLWSe5PPWiH65bUXwfoDuv05ef9v2XqLgTExU/myx1jC/nJaoKYwU6SiSL8haF90egFeDZXLfyFGEcwUIAknMlT0JxSNFRj14EdQerh5TMo9yYIEjCUQaL3ujTl0SKDeIayKHEBL80HU3Y0acqLFggwRfu/9Nq8/gLkFjWg4lDMjyCZcthqceFvPLToF0KKK1vuZ8nJMBFoFsTzi9iM6P8QFiMqu9rN6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrXCpehgFdGcefb/Fwzjhb8ry+80hg3Zje1HgxPMH1I=;
 b=MpAOUO8lpzqvqHYOWgaOcRhY6Xvlus9j/JjP2IoxopjZYxAYuFXq+e+UbVKbvaPheLhjL4NIad+wHOD1ubAUDwlwvXnlN1STPniFOFN+CfKU0h2c4Da+eG8zKP2YOpJQEZWXQqVq8Sf2ZEbxIzOy3YmjBL4vdUytwQC8lMUOiEg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c8d3a142-e998-4958-9b82-49c777f662f6@citrix.com>
Date: Mon, 22 Dec 2025 15:45:59 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN][PATCH] xen/domctl: add XEN_DOMCTL_CDF_ALL mask
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251111201627.3579504-1-grygorii_strashko@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251111201627.3579504-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0037.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB5921:EE_
X-MS-Office365-Filtering-Correlation-Id: e9764352-b853-42b9-2b28-08de41713635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NzNTN3ZydmExYnVjeGxWWU5tYm1ZRDJxR2IxTnF0c04xK3BOOXFwdk9zcU1Y?=
 =?utf-8?B?Q0t3MzVmRGx3czJaNUh3eUlSZWFrL2hxMEU2bUU4YWN1KzZKMnpaNGlWa1J0?=
 =?utf-8?B?TnBPZXFKcHdmcmc3em9PWjc1RE9ONERmTjhWK01XaHVtSk5keHBsdHM4eWd1?=
 =?utf-8?B?cERUcnVaZ0pyWllGaHdJR3NNdXQwRVBJdHVWcElJQkxkQXY5a3g0Vm5rSFZK?=
 =?utf-8?B?VkpJa1o1VEw2ME1Gc3k0L0thUFFZcVVnei8vMEdaZS9yM3lwUHJ0ZzV1cVFP?=
 =?utf-8?B?TTVtWlNDRWR0TFVmQyt0NExZU1M0WjF2YWxGcDlNaWtSV2xwTk0zcXZKejZI?=
 =?utf-8?B?dkJBdTVLTFptd1RBdUxqQmc5UEVFSDlrMFNGZTlEZ2tLTklaT0JrVzk4RWJx?=
 =?utf-8?B?K05VRFEyQkp1NEVFVW1NVFBYT2JQZW02T0JYd2JKZnhEd2lzZXNYeDlmRVRq?=
 =?utf-8?B?SFR0SGlFWnBKM0QyZ092djAzRFpScURzL1dMUHlSNjZaSnZxamZwcHpTWFpG?=
 =?utf-8?B?dUhMamZUdDZpWEVxRXd4Mkw5cXlOMk8yMHdSSXFkUCtOREhOS1BtS0NsNmI2?=
 =?utf-8?B?dlFreVdEcDBNenR0aU80bXdLZi85K3ZIQ3ZIR0RqRng4MnYySk5VYTcrZmt3?=
 =?utf-8?B?N0hzdHYxenZMaGZXM3dBTmRBa1NMZkNJek91NE1oOTlES2lTZzZMa0UvVmRE?=
 =?utf-8?B?OTNQdS8wSTNmcEdUSzVGY3F2ZTE4ZGhYOHh4QnpVWE16dUMyWjQ2UEpmN09V?=
 =?utf-8?B?dlRxbW1GdWJPdGFwMGJoYzIwdE1GOFVaWitrNnB5MzBFZkMvRFpyNkdLdFpa?=
 =?utf-8?B?dEhoanlkUDNaQUZ3K3VCbnpOa2liYVh1MEphN3NweTlxd3lTOFk4SS9aN1dw?=
 =?utf-8?B?VVZIZXM1aHV4dzN1SXlRbjZpTXBkUW9FNHlzM0NGczcyUXpCUlErNkVFUU93?=
 =?utf-8?B?ZVc1WXZ4bVVnT1laajdheEVaZE5pUDlLUS8zbGt0Nzh0R29qMFcremtLRVJO?=
 =?utf-8?B?MWdRMU5DdFRLRWFreURyMEpCSSsxbWh5aVBDSVlIWlo4aHpPZmxDYUhCTm1V?=
 =?utf-8?B?c2JNckdZZS9tY1dLZlk5bXhXVCtONUlueG9vYjZrZDBjQkMzSnUwV0FWN2ZI?=
 =?utf-8?B?L0pCUVUzd0pCZk9OTXJGdnVCY3JRQUIvdUhCdGdoa0pYZy84U2J4eXNhemI4?=
 =?utf-8?B?YXlGd2Jpd2FzMkJqTzMrUUd1cFlJbmRsUDkxeFNkamN1eUNjZ1FwTFlEV0o4?=
 =?utf-8?B?T2FBRlV3RXhFaWMxQkYxenZMQzdDSzE4Ymlic0RxNU9ZZlFma1dDUmQ0M0lT?=
 =?utf-8?B?TStLc3UxeFo3NjNlbER6eEtvRDh1VkZoRjJmUW13U1NGS3oyMURYZk04SlNk?=
 =?utf-8?B?TktydlV0Q1dtbFpORWxWNmhJVUdvMHl1Ym5xOFhYOGF3ZHExY2UxMDZQL0dF?=
 =?utf-8?B?VEVhMWphRTNjblovUkJkc1JDVktONU5lNWtoWVdEYUpXWnE2a2VBZ1NnZE14?=
 =?utf-8?B?OHk1aHlGZCtxOHhwUW01MUtGVC9zdm9pckdQMFJxNFF0N0UwK09XY3p0UFlV?=
 =?utf-8?B?em1CbG1vTk5vZEc5TllJamxFYUZ4dzhUa3R2OUVpMWdla0g4aE9uYkJjSFo2?=
 =?utf-8?B?NlZ4Z1pnT2xQMnJEL0RYcjhlZlUyaVJHQWJFeU9pNGxjZTFIdWNnWlByWXpR?=
 =?utf-8?B?WW54OVoyQW9WZGc0ajAwbk9uYTQ4YWVsbThaWm5iWHJRRnRPa0k2dEFnNTFy?=
 =?utf-8?B?VTVZeHllaXZQN0NJbXJXQnFQMW80ZHlOWFNJRmEvY3BISTFiLzJZd3dwQTNJ?=
 =?utf-8?B?a3ZwbnBGTW1oSHU3QkpoR2V0Q2tHelpQTHBXZ3plU0RheWFjTjdrM09yZE50?=
 =?utf-8?B?WndYb3JBZHJkZ3FHR3JWNjJrUzdGUFJyRXp3Vk9pRVI1Z3g2UlRmWUZ4WjRW?=
 =?utf-8?Q?ART77nTeR7nXFtn6bRVmoIjiwhi/yv82?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1Z6a0svR2NlOXN5c0cyYXRnbXhhSWFmalZXaWQwYkZ2TzZuWUd5K0JGT0c2?=
 =?utf-8?B?cU91YS9wSS9UWmltMnNvV3JRSXRTUDgyc2VZRXJWcUNKc3JkM2twR1g2eWVQ?=
 =?utf-8?B?MitWREZUVHg3UGEyQUdsNFE1QU1Yek4zSXdocTJnMzB0ZFJhQW5WQktnN1Fy?=
 =?utf-8?B?YnBUakdNdU9RbTRuaHVIOW82a2FlaVFEL2ZSOWlDeXlUZmpaaWNVUVlDYUx1?=
 =?utf-8?B?cG9zdmc2RitzTktpaDhIandqSE82TWh1RzJhS3NmUk1TcmxOOUF1NVlvT2J3?=
 =?utf-8?B?SnBhekhuaEQ3RytHV3NMdHRkSWVIVlM2MUxEbnJJV3ZWajBlcDNVUU5oek1P?=
 =?utf-8?B?dW1NeUJNNXJ6d2d2QjBmUS9TbkFpQXdGOUxMVU43UHF1VExMY3hRT0FkbCs4?=
 =?utf-8?B?Zmx1L2c5UnpoTW5mU3BrTisrRXdpYUJOOVlVR2NPSjZ6dG55cnc0UVdkaWFk?=
 =?utf-8?B?M0dvUDVaSWVkRWVWZjM3amR2bHZQZzNmVnIxcDY2NU42Qzc0ckh4RVphenBF?=
 =?utf-8?B?bm1Ha05DQ01jWUxQaFhDVXNBbTVLRlY1bkdIcEorMWpNdUQvMXo0NmJIeEV5?=
 =?utf-8?B?bzVRM0drR2V1TW94VmYycHNYUkRPQ1NHTUpPcjZaZTV0bWNkczVoaDFsOW1X?=
 =?utf-8?B?VTZweG1hSjI5T0hETXNRRUw1OTMxTERQMHhPNEs4Yk9abGd5VFl2K3YxcjZV?=
 =?utf-8?B?cTJHV0NjSzRPdThsRzJQRHRETk5JNlliMFNseXN0aHJBVEliTDRWNER3SlF4?=
 =?utf-8?B?MjhxTW5uOVNjRGhDKzFrMHZiNDFqMFF6ZjlJclNCcUV0Zzd4d2xpenlobG1V?=
 =?utf-8?B?QmwzNlVxejMzT1lYbHVqcmpqU1lETjBBdCt6QzZqWk9oVmVYWXMwUkVDOGVz?=
 =?utf-8?B?Q0g1VG1NMkdFbXNrRSs0TkluVVVZYkRXK3FFeFZlNUk2TEhzSEdjb1VLT3ZM?=
 =?utf-8?B?VVd4YjFCZjBYR05PblY5NUZVZmJwR010SEJTejhscHFUN1JLRG1ZSmpHRXds?=
 =?utf-8?B?dWUrWjNEOGx6ekVzRFpMY2NPUlZLckE2YzhRNUMwRXZzeE9DMHJFVldaRmtx?=
 =?utf-8?B?MFUveDhLeHA2emFlMVpBdkNRTFAyYlYxWVJOeUtmN3U5anlZbjdLdHowWEJz?=
 =?utf-8?B?R0VsRTBxTmlKbmdWZmVPdGJwclZ3QUppaGJRcUdkdlRTeStadlQ0eDRIdVBJ?=
 =?utf-8?B?azducXRocjhXR3dCOFRZTUdJNkJsSTlEUzhCUWRPK1hZSDVmZ3JySWYxNnNZ?=
 =?utf-8?B?U1BiOXpGYzdObCtNYzRVQ1dFR1poWk9rZU10UVN5NmJ1RENPWW9JQWVab3BS?=
 =?utf-8?B?YkRCbXdadndkT201SHZGMHR2dmN4V0lDNVhWd0RCTlR0Q1N6aUtzdU5rOEdq?=
 =?utf-8?B?S0lWb1VWSWFpa0hnNmFRWmIvNm9jVTluMEdHNUcwcUtRUkFOditMT2lOV1ZN?=
 =?utf-8?B?djVIRTExY1dWR21nR3NxMmJUYnlpc1VRaFJ3cDdmUDREL1RGVGlhUE1YN2hL?=
 =?utf-8?B?WTlwdHBpM1hiWjhlNmR6MVVxa2F4RnNCK0lDcFV0YmJkU205bFVvUGd3QXdo?=
 =?utf-8?B?dzVqUTVxY0l2MWNrUWlhZWhpbGc4d2RZUDJCOVJNOFlkQy95Mk1lZHl6VUk4?=
 =?utf-8?B?NjhRNmNaYVVzUWx3dGJWcnZGejBnWDdwWis2NVdqbVRZQytpS200N1RmcFVo?=
 =?utf-8?B?ZzZwS09zaWRXZGIyM0xrWDBIREs5RlhKWSt2bi9DbWFTVlc5VlgzV21VeE9R?=
 =?utf-8?B?dmxrd3RBNVR1RGdxcVE0NWpFRGRUeHFQSDBxbC9PQjRyZUMxK0FsNEdreVV6?=
 =?utf-8?B?bDdhMVMwWENxbWp0VHZkMGtuNlJqOXh4cW5VT3htSVhwN09pY0twMGdWTS8z?=
 =?utf-8?B?dGZUUHVxeWpUUzRVdHlrdSs4Z09QVlR5dDBDR000L3c3Ui9kMldzQzVkc0ps?=
 =?utf-8?B?OFVORGNWQk9va1BLelNGWkJIMHgxd0c1ZWcrY3pYTzdoWEtZN1hqRll5bmhF?=
 =?utf-8?B?V1Fzc0lyV0ZwN3ZsKzBwdEMwRytVc1VCRkhmb1NCbmtnaDFYTnFaaEJHcmNJ?=
 =?utf-8?B?bGsrdk9VSVhDMU0yVEJ5aStWYk5qYkZJUUNIM0lTUXlsQVRxQ05lSnNEZG1o?=
 =?utf-8?B?dXRtK2hHbERoRVc2elBmY0ZJT0hId1VvblZSdkRCN3ZZaG1NdTAyNWk2S2w2?=
 =?utf-8?B?c1hJL1FwUXc3WTNvSXJ5Q1BTMExrT3AzbDhORndDS01QYXJjTjZZeVhQcUJq?=
 =?utf-8?B?NHh0a1d2aHRKYkhZcC9Qc3RaZHI4YlFnVjRRT3BnOC9ONTB2SVorUThFQ0E0?=
 =?utf-8?B?YXlrcURCMjMyRFVlZXZjRFpVQmtiQkMzOUFvZUk0WXJKeVEvWXVxdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9764352-b853-42b9-2b28-08de41713635
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 15:46:03.1305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TX0+TS7czojcdAgw3RpQbngXCVu17eQAnpxp1ppA6OuGPHZhmwpCgP7X6Ufo3rOlmtPLqwavxBbeCl49bK6G7n5fJanKZ9RtjJDCn6n4SVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5921

On 11/11/2025 8:16 pm, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
>
> Every XEN_DOMCTL_CDF_x flag:
> - is defined in public/domctl.h
> - explicitly listed in sanitise_domain_config() (common/domain.c) to form
> mask containing all supported DOMCTL_CDF flags for "Unknown CDF flags"
> check.
>
> So, it is required to modify two files every time XEN_DOMCTL_CDF_x flags
> set is modified.
>
> Simplify the things by introducing XEN_DOMCTL_CDF_ALL mask, so
> sanitise_domain_config() no need to be modified any more.
>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
>  xen/common/domain.c         | 7 +------
>  xen/include/public/domctl.h | 7 +++++++
>  2 files changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 775c33928585..4f91316ad93e 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -730,12 +730,7 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>      bool iommu = config->flags & XEN_DOMCTL_CDF_iommu;
>      bool vpmu = config->flags & XEN_DOMCTL_CDF_vpmu;
>  
> -    if ( config->flags &
> -         ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
> -           XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
> -           XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
> -           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu |
> -           XEN_DOMCTL_CDF_trap_unmapped_accesses) )
> +    if ( config->flags & ~XEN_DOMCTL_CDF_ALL )
>      {
>          dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
>          return -EINVAL;
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 8f6708c0a7cd..94a8e3042cbf 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -72,6 +72,13 @@ struct xen_domctl_createdomain {
>  /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
>  #define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_trap_unmapped_accesses
>  
> +#define XEN_DOMCTL_CDF_ALL                                                     \
> +        (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |                             \
> +         XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |                \
> +         XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |                     \
> +         XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu |                    \
> +         XEN_DOMCTL_CDF_trap_unmapped_accesses)
> +
>      uint32_t flags;

The problem with this is that now userspace has a constant called
XEN_DOMCTL_CDF_ALL in scope which is unsafe to use.

If the new constant was within #ifdef __XEN__ then at least it couldn't
be misused by userspace.

~Andrew

