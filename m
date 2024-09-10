Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5F19736FA
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 14:17:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795465.1204824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snznD-0003ku-A8; Tue, 10 Sep 2024 12:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795465.1204824; Tue, 10 Sep 2024 12:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snznD-0003jO-71; Tue, 10 Sep 2024 12:16:23 +0000
Received: by outflank-mailman (input) for mailman id 795465;
 Tue, 10 Sep 2024 12:16:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HEI/=QI=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1snznB-0003jA-HH
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 12:16:21 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20607.outbound.protection.outlook.com
 [2a01:111:f403:2418::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b8e84f6-6f6e-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 14:16:19 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SA3PR12MB7805.namprd12.prod.outlook.com (2603:10b6:806:319::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.19; Tue, 10 Sep
 2024 12:16:14 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7939.017; Tue, 10 Sep 2024
 12:16:13 +0000
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
X-Inumbo-ID: 7b8e84f6-6f6e-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCZyXO0/yiIzo9USxTWZAKFdYFoLl9oW8LPKT0UZnLEGEuceZGCrDdQHIo8Jttzj8CIOki1GyfkevAu8LIAY14IakBpl0TuVlou3lXFx0Ne91EvjCA7P3kTRiqJk7Z3EzfK1Qtwk1kiRg3P1g7yBP8cz1S7c8DKG3U4J7ES5Tbxjg4k2uR8de3DxYCjQ6gsmMNXne1V2nh2JY7Cno8Sk8IbEgcRM6a/kodiZjes9vl/FQDsB7MJkWLvTaSQdNjwUsLlw3mGimYN3g6A0sMgNcG5zK9xsdIQABibLp0bzyUBUXRhiqiCTnfuN66ONey6wRe7trMViIYo9xCWIhmC2Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4G6CYPUEyx9C49GtL81PyqSUV/LZIWqTk5/JCVktjU=;
 b=WP+TTgaDkUnxeXS/hkPPX+zs/8WFUFuyJNN66Jym15sW8Y9Zl7aPzqXgOI6ZEQpr6yU/cX0EDCBevGSCMUHHSvcvH0hjk2epxD3wz5hsS7433un/Qr4r8pVwc/i5Di8xZYxIPYtVBmSN6IBMHW9nofjEJH91bT9YNW8ouTvXvxpddjxSrO0FGiKFjPdLyZpMAdPytT5pmK1jDBQLACIfl15xvplorYhpLq+8dVCDNsBxBF2P00AmkLhU5AdJZkoQl633mkcrZyQ930zJwAborugaCr8bSR10dsXXE3Lf0tk5wDVLQ1KIO+wGRxbdPAedtdFrUB9jb1oqIOzkRcvUeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4G6CYPUEyx9C49GtL81PyqSUV/LZIWqTk5/JCVktjU=;
 b=pVFPYAmD9uriFv+wenSlhm9n3D/+bZo6lj2/x/fxBsGI+KBy+Ds9QPhehCUHPxw+2M3FZ2rzX5nFzeAHE92Dka6L33dT1Hc4ozAla9NTUMVZo2uVjakkwe5xyIONJBb6+zCUpVHVD2SNUKRABZtiWXNxS8IhHoSvpTvM4kviEho=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e44de6a0-de56-4fbc-90d9-c3dd2f623b57@amd.com>
Date: Tue, 10 Sep 2024 13:16:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fusa: Add Assumption of Use (AOU)
Content-Language: en-GB
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org, Bertrand Marquis <bertrand.marquis@arm.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>
References: <20240906101318.1419954-1-ayan.kumar.halder@amd.com>
 <57632c2f-82e6-49bb-b989-e75c95070b03@xen.org>
 <46b9567e-d27c-467b-b21d-65d63b6cd1e2@amd.com>
 <5de31172-8319-4cd3-9486-a6992a5cdc22@xen.org>
 <880e0578-c27b-45d3-8ed6-91ad648fa735@amd.com>
 <c308f03b-247d-4fd9-a9b4-f630d8a22bee@xen.org>
 <alpine.DEB.2.22.394.2409091252570.3672@ubuntu-linux-20-04-desktop>
 <d3ebe193-4228-4fda-b7f8-0849c41ed999@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <d3ebe193-4228-4fda-b7f8-0849c41ed999@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::9) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SA3PR12MB7805:EE_
X-MS-Office365-Filtering-Correlation-Id: 54c93384-5c8e-4495-8ad7-08dcd1925d0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SjllajM4T2FyQTdJb2VDRXFlcS90ZUdXQUIrZjJmTGNiYjFGN0ZHaEpVTXRJ?=
 =?utf-8?B?ejBSaC81ZHBNVC90Qjg3U29YTmk5d0MrYXl1VTlyb1Z2UkhubUU5aFVxZmh0?=
 =?utf-8?B?VldlY2xWbmdBelNHcnJVQkJBTjVrTDR0WjdsaW84MFhjcnlFU1JaTWgwcDRj?=
 =?utf-8?B?dEhkZUFIYkkwSGJQNXo4WFJvaUI2bGJNNmpjVitZY3ZuNkJ2emRkRE80VjZO?=
 =?utf-8?B?V1NUc0JzZlpkdlc2eWx4ak55QkdlTTdMTG9oNjVMaklPb3cwNzZqRlByYmtj?=
 =?utf-8?B?T1JkTU5LQTd1c2EzZGdXUEtDQnNnNnlqd3VzemRnV1VXeGJkSmpKSE1mbWI1?=
 =?utf-8?B?REcxWDRBVHh3eVJocTA4Vm1ZSkVaS0p5QmhSRFBkVlR6a3I0WjlRdkIwY2VS?=
 =?utf-8?B?U2xzQjJ5ZSs3M0l3TjR6TE00bCszQmwvVGZ3YVRCS2s4cXhsU3FBT3c5bllr?=
 =?utf-8?B?SExybm04VjlIVGw5T3IrTzQxZ0sxbVZLek1UTjMxcUJ3dUZLWUZPbGdQaVhq?=
 =?utf-8?B?YkI5VXVnNXQ1RW5lVUZOUEltelovWUFDUXVGNlBaMVNWdG5YQzhVWHRlUFk0?=
 =?utf-8?B?dDFrNnhlaUxwSndyekc5UDBvYXF2aW0yR0t4N0ZJUDVOVU9VLzJHWDJHempp?=
 =?utf-8?B?TW1aV1JLYWMzQUhSMGkzS1A1N01jOXlxMGI0TVJyb1RHcXFHdksrNmxZanBZ?=
 =?utf-8?B?NDk1dkpua05obFNqUTYvbjUySmRJVldXYUI5L3c1SUxHSlFyZlZLdzVieDI4?=
 =?utf-8?B?Mmw5cTRFTWlTY09KM1NFK09nN0tyaVliWmNKV3dRNjlZeUZ3ZEVkR1Y1Sk9r?=
 =?utf-8?B?cWszaFVqTTlVMlMxRXhUYkQ0Z0wySzBqcDNHQTNEcmgrUHRzYXBrQjVvSkNQ?=
 =?utf-8?B?cjB1VThNTFhyK0l1d1FlcC9NWS9QajE3ZjhJK29hUlBvKzljNlQya2hFcjdZ?=
 =?utf-8?B?dC85UytyQlRrUGl6c0xjWmg0Y2hLVEhrL0JZYmk0VjRnQ2N1bXlPMUVweGR6?=
 =?utf-8?B?cHZFRkRvaHFVWnJsWlByWUxYS2luVzl5cmFLT2RPQjhiRmgwZktoRmpxRGoy?=
 =?utf-8?B?a1JWMExwczNBd2FEeXhTTU9IUDMvRi84NDlvazJHTWsydmwreWhkQmNGZmlv?=
 =?utf-8?B?T096Nk9Ib1gwYzB6NzBkYyttVHNuYVpFQ3lPY3FDZ0xyN2FpZjlTenhlQ3FI?=
 =?utf-8?B?ZTJjbVVzUU9ubW9SaFBwZElQYVdUTmlRK0JzWXBTR05jOTR6RFVXbVh1QkRu?=
 =?utf-8?B?Nk52b25IZWdjNm1lQ1NlNHdzVXo3d0JhQ2RFeUpPeGhSWEVkNzRHcmNVbUZa?=
 =?utf-8?B?aUVPY1o2K2NnRE15WHdYUWhoeVZQMGIvYy9wdTc3bTBIUVNhL1FMT1U4Z3pD?=
 =?utf-8?B?VW4wY2p3ekNpTjY4cWNtK0IxQVRvNWJYRUl5TXhudnJ5cVY4NVVLTXNjaXR5?=
 =?utf-8?B?ejlRVThHVGJzcjhuRW5EUFFmK2VDaVUzZHRMQkNWMzlweWhHNlpoc0gzNWk1?=
 =?utf-8?B?WDZ1VzA1Rkx1dUVBWmlYb1U3VmRRMFRrbkFpODl0Y3c2eTNHc25yS01hb2Vz?=
 =?utf-8?B?aDFkUWtTNVRTZ1ZZNHp3ajNNQk1LM0QxcjhuR296Qm1lc2RPOTNZSEFERlUw?=
 =?utf-8?B?ZGJFZU9qa2s1RHR3Nlp1cldhb2xnTlVzamhsNWVaZkw2bXdqMXNBNm9aSTNV?=
 =?utf-8?B?U1lqWm4wVmZFOTVIdGtITmtaMTR3QmNwbjNGb29nUzJtQTlKNXRQcmhSaVJ2?=
 =?utf-8?Q?tw3X/g16tpH7aNyl3A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHdkYi8yMjNjamZOcnMzSEhxQmlNOU1KOGlGN0lwZFVQYkNwM3BpdVdsQWVD?=
 =?utf-8?B?Wk1ROUU0QVhTTEhoUUF4N1RvdUt2Y1l2K1RBNU9WUkFTS1RjamkvTmpyVlVO?=
 =?utf-8?B?aWFGYzR4T0RSV0ZHU0x4cExqd0dRN3dSOVpJMThiUE9pN0RERDUySkJTRXJv?=
 =?utf-8?B?Rk1RdFdweUtSdU43akVuaThjRFB2Rk5MRjdyZHJiWFRUWWcvN2FvU3E0aTR0?=
 =?utf-8?B?WEpZV1F3Y0RkTWd4MnNiVmcraVlxcHB2cllPLzNqQ1BvaEtGVDBTSFFLdjgv?=
 =?utf-8?B?Smp4OW9aQnR0aDFtUVQ2M2E4Y3Z3cnVkUlVid0VZdzRFK3BNSG5BWTF1Nk5l?=
 =?utf-8?B?eUpYUUtqaXc3eHhRL1dSdkxKRDJFVkR0YkVZQ2I2VHBUcEZOY0h0aUR3Rmt4?=
 =?utf-8?B?WVRIcXJkM29QOU5GY1d3R3RKeU1sWWRJbmZKMFdxVURITUlYcko2NDhwUE00?=
 =?utf-8?B?MENNNWZ3ZEJ1RmFtWU1aMG5sWkFVTHduVnBVM2pJT2R3dSs5N0x0WjBHUlFF?=
 =?utf-8?B?MUQ5cjNGam00WjNUV0ZlYlZNZjNZd2xLUjVmVzVUV1BqazNuck0wcUV3Nmpa?=
 =?utf-8?B?YlcvUG1FMzdZc0VNMFYwdUlWdkFDS0xrYi8xRlQweGZIU3ZLY01kY1BHSUhF?=
 =?utf-8?B?UGxKTmV5WFpPbnBmaUdIOGpCQTFyY2NCNndhZitvSDVtamwvaUM1dm9FNE5M?=
 =?utf-8?B?cWtqdG9lZTF1dERHWEtUdkF3WC93aDJsV3k3NWk4L2xYUW84SUxZRTBCVnds?=
 =?utf-8?B?ZnRsQ3hsR20xdDhGN3MxNEpLaUpxOG5nelpBUzVRakRyMFpzbUpqcXhwTlZF?=
 =?utf-8?B?ZFhlYTFxZzNFSEt3V3VXRGlHVCtQaWM4eFM3dUxTVjMrWHkxaEFMQm5Za25j?=
 =?utf-8?B?cS9CZEtBSUo0REk5bW02S0kyMEtSZ1pwWGkrckVoZmpqNzlOSHhRZGVuYkNO?=
 =?utf-8?B?NXR5VDkyZlBlWXBFMUVZVkh0dmJ3cVhiZTVIb2tsMEFlYlU1TlVOT1NHYlZn?=
 =?utf-8?B?NkdiUTBYWlpaTUw2a3BnbFJHRHIyaUZjb2FkM3NHZXRVdDlTbUpiNlQzMXJB?=
 =?utf-8?B?U2RUdmVVNG03RDZiVXRGeDI4SzhHWjk5cEtHazRuS1RyOG1YckcvdC85M2Q4?=
 =?utf-8?B?bTN0K3hUdGQ2ekVaNEN0Nk9jTXRsaHQ2QlNaQm9mM2s5Z0RFVzMzeDFleE1B?=
 =?utf-8?B?ak54KzdnT043TmFaWWRPdjlVb0lscndmOXg0ajV2bUhreHFIQnpxcnIycCsx?=
 =?utf-8?B?RDJUYkhiMVhpc2lVbzV1eDZDNzFtVW9XVWp5UmkwcnYwQzR3anBvNEtteTgv?=
 =?utf-8?B?d0wxd0hvR21xMm96SUJ2aTgxTXVIaXdqcXNBSWpYOGNEUEpXcXU3TFArMm5X?=
 =?utf-8?B?OW5QU3BJWDQ4a2tEdkw2dnhySmJKZlRIa3JDSDZ6YzF0emM0S2ZPMFhrc1FM?=
 =?utf-8?B?SloyTnFkN1ArRi9xV3gxUWwwN2s2VERMZWwxS1lHcVJCTllOVURhdkMrSWR2?=
 =?utf-8?B?RTAxZXpEZnRGZDJiM3FHZ0FLbmZVTEhKVWZBcmMydTRONFlzT0RtSFVjUGZJ?=
 =?utf-8?B?bjFzT1J0ZEpXSUZOOC9yZi92SWNUMkovUkxLSFFkekNhUkxtbC95OXJZYUJD?=
 =?utf-8?B?TmlYYTZPNSsvbFJNZWszTzNOOSthNEErekUvT3NLeWRhQy9SK2pnMGJvbXB3?=
 =?utf-8?B?a2FPbUlxSDhzbjZvMmhJMVdwbW1YN3JUSVVFaVh4UEtuSVZiVndOdWlnZ09s?=
 =?utf-8?B?TEgwUGNpeHlKMXAzaXc3UGlGbmlOZ2IrOFVUcUlMZEVDWDhIOUUrVFcyNjRw?=
 =?utf-8?B?RGtrVmJteFpsdk1IdnFmVkFzVlBrT0RHVXNWVTVYS2VtY1B6djkweHd0a2hJ?=
 =?utf-8?B?OHYzV3JpeUNMdllRUmNiSWllWENLVUVkdEhJK2xRdGlLU0g5bWo3d3VqQnE0?=
 =?utf-8?B?MVovd2xKdWJpUU5qNzltZ0pxeWRqV0pBZ21sNVo0ZHl3WUsyWmpGN0wzK3dT?=
 =?utf-8?B?TXVUWkFsaEcyMmdzNGRrZlhpUmpiZ1pLNi81Q0F1eGtBRmJsYUVpMGtrSnl3?=
 =?utf-8?B?clVqblI1cjhwakVKWmpLNDM0cGlpRzlweG9ZTEMxbHJUbGJ2N3hxREVSaTN3?=
 =?utf-8?Q?v2nG9YwDLGwzAbDUuMqNRhzuq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c93384-5c8e-4495-8ad7-08dcd1925d0e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 12:16:13.8675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /LBktwkfyjTgw9JlDu0YsSyRCRY2Nzji0Oyy/ziUqPWhJUzxG3/zG6uAURFU0/xYzhkC9ab5tTgojcZdyLC9eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7805

Hi Julien,

On 09/09/2024 21:59, Julien Grall wrote:
> Hi Stefano,
>
> On 09/09/2024 20:53, Stefano Stabellini wrote:
>> On Mon, 9 Sep 2024, Julien Grall wrote:
>>> On 09/09/2024 10:50, Ayan Kumar Halder wrote:
>>>> On 09/09/2024 10:11, Julien Grall wrote:
>>>>>
>>>>>
>>>>> On 09/09/2024 09:56, Michal Orzel wrote:
>>>>>> Hi Julien,
>>>>>>
>>>>>> On 08/09/2024 23:05, Julien Grall wrote:
>>>>>>>
>>>>>>>
>>>>>>> Hi Ayan,
>>>>>>>
>>>>>>> On 06/09/2024 11:13, Ayan Kumar Halder wrote:
>>>>>>>> From: Michal Orzel <michal.orzel@amd.com>
>>>>>>>>
>>>>>>>> AOU are the assumptions Xen relies on other components (eg 
>>>>>>>> platform,
>>>>>>>> domains)
>>>>>>>
>>>>>>> Searching online, I think the abbrevition is AoU rather than 
>>>>>>> AOU. This
>>>>>>> would also match how we abbreviate in Xen (IOW if we use a lower 
>>>>>>> case
>>>>>>> letter from the expanded name, then the letter in the acronym is 
>>>>>>> also
>>>>>>> lower case).
>>>>>>>
>>>>>>>> to fulfill its requirements. In our case, platform means a
>>>>>>>> combination of
>>>>>>>> hardware, firmware and bootloader.
>>>>>>>>
>>>>>>>> We have defined AOU in the intro.rst and added AOU for the generic
>>>>>>>> timer.
>>>>>>>>
>>>>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>>>>>> ---
>>>>>>>>     .../reqs/design-reqs/arm64/generic-timer.rst  | 19 
>>>>>>>> +++++++++++++
>>>>>>>> ++++++
>>>>>>>>     docs/fusa/reqs/intro.rst                      | 10 ++++++++++
>>>>>>>>     2 files changed, 29 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst b/
>>>>>>>> docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>>>>>>>> index f2a0cd7fb8..9df87cf4e0 100644
>>>>>>>> --- a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>>>>>>>> +++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>>>>>>>> @@ -116,6 +116,25 @@ Rationale:
>>>>>>>>
>>>>>>>>     Comments:
>>>>>>>>
>>>>>>>> +Covers:
>>>>>>>> + - `XenProd~emulated_timer~1`
>>>>>>>> +
>>>>>>>> +Assumption of Use on the Platform
>>>>>>>> +=================================
>>>>>>>> +
>>>>>>>> +Expose system timer frequency via register
>>>>>>>> +------------------------------------------
>>>>>>>> +
>>>>>>>> +`XenSwdgn~arm64_generic_timer_pf_program_cntfrq_el0~1`
>>>>>>>> +
>>>>>>>> +Description:
>>>>>>>> +Underlying platform shall ensure that CNTFRQ_EL0 register 
>>>>>>>> contains
>>>>>>>> the system
>>>>>>>> +timer frequency.
>>>>>>>
>>>>>>> The wording in [1] (not yet merged) implies that CNTFRQ_EL0 may be
>>>>>> It is merged:
>>>>>> https://xenbits.xen.org/gitweb/?
>>>>>> p=xen.git;a=commit;h=51ad2c57a2d21b583a5944a0dc21c709af022f3c
>>>>>>
>>>>>>> invalid. This seems to contradict the Assumption of Use. Can you
>>>>>>> explain
>>>>>>> the difference?
>>>>>> The requirement you refer to is written from a domain perspective 
>>>>>> and is
>>>>>> about Xen exposing the frequency
>>>>>> to domains via CNTFRQ and/or dt property. In case of a presence 
>>>>>> of dt
>>>>>> property in the host dtb, Xen could for instance decide
>>>>>> to emulate CNTFRQ instead of relying on the domain to parse the 
>>>>>> dt at
>>>>>> runtime.
>>>>>
>>>>> AFAICT, you can't trap CNTFRQ access. So what you suggest would 
>>>>> not work.
>>>>>
>>>>>>
>>>>>> The AoU on the platform (hw/firmware/bootloader) is written from Xen
>>>>>> perspective and is about the platform
>>>>>> exposing the correct frequency via register. This is Xen expected
>>>>>> behavior on the platform. In other words, the platform should
>>>>>> expose the correct frequency via register.
>>>>>
>>>>> Xen is able to deal with broken CNTFRQ_EL0.
>>>> Yes, this is correct if the user provides "clock-frequency" dt 
>>>> property.
>>>>> So I don't understand why we we would want to make an assumption 
>>>>> that it
>>>>> shall not be broken. What do you gain?
>>>>
>>>> Refer https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/
>>>> linux.git/tree/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml 
>>>>
>>>>
>>>> ```
>>>>
>>>> Use of this property is strongly discouraged; fix your firmware unless
>>>> absolutely impossible.
>>>>
>>>> ```
>>>>
>>>> We wish to put the onus on the platform/firmware provider to 
>>>> program the
>>>> register correctly. Otherwise, we will have to document it 
>>>> somewhere (may be
>>>> safety manual) that User needs to provide the "clock-frequency" dt 
>>>> property.
>>>
>>> I think you will have to. The integrator may not have the 
>>> possibility to
>>> modify the firmware.
>>
>> Without getting into the specifics of CNTFRQ_EL0 and clock-frequency,
>> given that this is one of the first AoUs, let me clarify the spirit of
>> the AoUs.
>>
>> When we say that Xen is "safe" we mean that it went through thousands of
>> tests so we are sure that in this specific configuration it is as
>> bug-free as we can reasonably make it.
>>
>> "in this specific configuration" is important. Changing the
>> configuration might expand the scope or invalidate some of the tests.
>> Think of moving from a board with GICv2 to GICv3 as an example (we are
>> actually targeting GICv3 for safety, so this is not a great example,
>> but just to explain the point.)
>>
>> So the AoUs are the set of assumptions Xen has toward the rest of the
>> system to make sure Xen operates "safely", with the word "safely"
>> defined as above.
>>
>> Of course, Xen could totally work on systems with different AoUs (see
>> the GICv2 vs GICv3 example) but it would be outside the safety
>> parameters. In a way, it is similar to "security supported": there are
>> a bunch of Xen features that should work fine but are outside of
>> "security support" for one reason or the other.
>>
>> If a user wants to use Xen on a system that breaks one of the AoUs, they
>> can, but we wouldn't promise it is "safe". For instance, imagine a user
>> running Xen on a GICv3 system if the safe version of Xen only validated
>> the GICv2 driver. Similarly to "security support", sometimes it is a bit
>> of a judgement call and it could be argued either way.
>>
>> In the specific case of CNTFRQ_EL0, if we think Xen can be "safe" on a
>> system with a broken CNTFRQ_EL0 (thanks to the clock-frequency DT
>> property or other mechanisms), then we can remove this from the AoU. We
>> would probably have to have a different AoU about the presence of
>> clock-frequency. Otherwise, if we think we cannot really promise that
>> Xen is "safe" if CNTFRQ_EL0 is broken, then it is better to leave as is.
>>
>> Keep in mind that users interested in safety, they are very likely to be
>> interested in the safety-certification of the entire system, which
>> includes the hardware as well. It is very likely that users will choose
>> a safety-certified board, which I am guessing would have a working
>> CNTFRQ_EL0. This is just a guess, I don't know the relationship between
>> CNTFRQ_EL0 and achieving hardware safety certifications.
>
> Thanks for your input. I am open with the idea to require CNTFRQ_EL0 
> to be valid. But I think we need some consistency across the safety docs.
Agreed.
>
> In this case, I think it would be inconsistent to mention 
> "clock-frequency" in the requirement.

Yes, I see your point now. So the requirement should just state.

"Xen shall expose the frequency of the system counter to the domains in
CNTFRQ_EL0".

The AoU will complement this requirement

"Underlying platform shall ensure that CNTFRQ_EL0 register contains the 
system timer frequency.".

It makes sense to me.

@Michal , any inputs.

- Ayan


