Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDIGLrPekmlvzQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 10:09:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E5F141DB7
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 10:09:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1233809.1537164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrub7-0007oN-BF; Mon, 16 Feb 2026 09:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1233809.1537164; Mon, 16 Feb 2026 09:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrub7-0007mc-82; Mon, 16 Feb 2026 09:08:53 +0000
Received: by outflank-mailman (input) for mailman id 1233809;
 Mon, 16 Feb 2026 09:08:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sAgz=AU=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vrub6-0007mT-2s
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 09:08:52 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18deaf06-0b17-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 10:08:46 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BN8PR03MB4996.namprd03.prod.outlook.com (2603:10b6:408:7e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Mon, 16 Feb
 2026 09:08:43 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 09:08:43 +0000
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
X-Inumbo-ID: 18deaf06-0b17-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBB2rVK8YIjdTtJotLGZiKK/4Q9aDvrhRtZdPsLAzILkfa6ASbrGBNIr8oKnBpBRsplKjEG0SP0b+AxtZRxgWSHhHzD1jgpafUXiEDIZsGJc/rwa5PlEDjGKgOzV62nZYuJLG/YjYvOeuGCnvCfeh1JqeOvHxv3dRGh13xQsZYGqoXXRJGxNV96y0SecmnrEsGC+s3Ped3HssI5ObCrp8dJmKbRek8gPqr6jOg0ms45B4HysLlPrM0lG2IT0jOOB6FR9dFI1ps+DXQJ/eUlEynSdCcewFZ1tzzmaBqCA/8WafacOEMYlKy/nz3yOZA+yN+M09LkQGzNd5XgorUE+Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBFkYU5zO4LtipAAYY0sZcm+knroMLSl+ac7aDpY/3U=;
 b=ZQ1xZMQy84Zu3mvPshJuGe6GYg0NKPRW/7Wl1rYe0GqlEVZwCLqZm55e9TJm0NOwYCu4cRCr11tQZJyvCjNHYGqH2JYbei+F6K9galnKwzkQ44SfWpuIStaUe+Ya0WkvmIXItwA1kcTVHGHfGXXsThbhmZhAKqoaR5U/pxVtPsdUr50zmsfSBDxrUSKHYAWLWozI9UiPBjM9GEZqolfX/TY6SDt2sKLD3FEhNFuEJE7XjAyJ9j+FIxeP+hmW65+7T/JdCkleZ6JEAJNAzScJX9QjPlwg2ZWoPJcn8HLkp9PWjXk4IW1T6wzZmXrt/gvnDmEr4h4B1aptnaA0EhoP3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBFkYU5zO4LtipAAYY0sZcm+knroMLSl+ac7aDpY/3U=;
 b=r7K9pxvYX8D3r6gISARlOqefYfdfwXn6Ms95Xb4td+qri9+Kt3DQwv+yYT8utfBISxYwYiRmavCULUpNOTGLXOQwG4/qlPHcL6giwrH3ZSPSHcBtUhyObwyazd2hPWIzk77HZKJxd0DMWgV2H6LAsCMc5u02jC6m8G3kjYwVtz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 16 Feb 2026 10:08:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
	xen-devel@lists.xenproject.org, jbeulich@suse.com,
	andrew.cooper3@citrix.com, jason.andryuk@amd.com,
	alejandro.garciavallejo@amd.com
Subject: Re: [PATCH v2] x86/hvm: Add Kconfig option to disable nested
 virtualization
Message-ID: <aZLel_W_1B6684zC@Mac.lan>
References: <20260206210554.126443-1-stefano.stabellini@amd.com>
 <aYnAGQa56yvDoN0M@Mac.lan>
 <alpine.DEB.2.22.394.2602131350040.6031@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2602131350040.6031@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: MR1P264CA0001.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BN8PR03MB4996:EE_
X-MS-Office365-Filtering-Correlation-Id: 177df77c-0a17-4f94-b6fb-08de6d3afba1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d2hYd0M5OVhPTUwraFI5M2YyZGVwN3NsVHNSNXQ1cXZjYXJVYThsY1lvcWVt?=
 =?utf-8?B?NWYvTnVPNmd1L3lQZXNva2hoR0ViTi9wTU55L1NJMzJOQ0wzcjM5cnk5ZGVP?=
 =?utf-8?B?WE9jS2svb0lIaGhGdGNocnRIanZMRi85S2JpdXNDdVh2dWpSeDY2SHptTnha?=
 =?utf-8?B?U3lMb09Rck9VMVVvcXE2VkJCWExaZEhDQmdkak1KY1d3ejlaYkVFVThNWHNn?=
 =?utf-8?B?QUtlVnVGWEpKb2ZIMzU0TVhMT2pBODhjNXNVL09KV01zNlpLdXpnVnZpbUZ2?=
 =?utf-8?B?ZzVITXdwRzA5QXk2M1hGMXl0RzlHd2J2Umd0MkhWY2RrcmZFU3Z4ZFJ6dGxF?=
 =?utf-8?B?ZkFCYURJT0dDS1dQTUt3ZXlQV2RsbC9yZGpkTjNxV1dtb1ZuQW12S01kWmF1?=
 =?utf-8?B?T0VmWTJwQ1c3dEMzeUltZFVvd05YdzR3R2ZBY1JRYU1aMVp2QmJoZmpnek0z?=
 =?utf-8?B?VVRTTk9aZnUyNWY5WjdsYkxUcTFRMXNHVEkzRCtOeEw5WTYvZEJhR2F2UG9Z?=
 =?utf-8?B?R25mZnE2M21EdjFTVHhSdzA3cCt1eWs1V1Z4SXR1VVdocDRQNXNsaHkvbXlE?=
 =?utf-8?B?dVdvTU5ZdGhrY0VYVVJybm05WjZBZ3FTSHUvZHJ6c0tEeTloRElHQU13a1ZW?=
 =?utf-8?B?ejRtYTlVdzBmNExkc0FsT0VwOVZxQ3lsYkJZZ1JDYUJNcFBzQ3A2VFY0bzRj?=
 =?utf-8?B?RXdXMlRGVFljNCtJaHhOU3lQRE43ZjlSRjB3VG5qWEUyczhhdzlVdTFBTHIw?=
 =?utf-8?B?TXFyMGdORUtwMkxBRERWbW56OFpTSmdudStwd1NGeFRIUlI0dDNtUzV1UWhp?=
 =?utf-8?B?MEVMUDY2OHFJMzM4ZTFJa3Q0QzR5ZFltNUdFdnJyRmd2T0RMcWd3Z1RaTi9B?=
 =?utf-8?B?bFJIZnZlYUMvUWFkZk8xRXFQdnhubHRQbGc3TFRKeUY3TUZXekhjQkVUdTFt?=
 =?utf-8?B?bmVMSDF3Z01zMk1NN1BqVkg1U05BQllMN3pkLzY3RlNDdFZPRDZYZEtGK0lS?=
 =?utf-8?B?U05nd2V1TDN5d3VqaEtnOUhVSEpqYTZOUU5kQ0VsVDRFSnU3VFozTkl1MTFS?=
 =?utf-8?B?SmxWQlpoeS9ONzg3MnBPMSt5WHdhWjBZYjYwR2NqNmVDU29YZFFkazJTb2NU?=
 =?utf-8?B?anRsRHhaOUVpWTFpRmJhaGJFSm5MQzVJdmhvNHJMMVZhaFROenlVaFEvNkRq?=
 =?utf-8?B?U2xoSHoyeEZhMTI3QmV5YW5kTG5RYzlhV0xtYncxc0M0ak5WVEltTElZcGhI?=
 =?utf-8?B?UHNhTXo4WGRzV2lZNDV1SittQUdYY0hpQk5MSHhnZVZmM0p1ZUprMnhGZEI4?=
 =?utf-8?B?YnBuY2tmenFTWmFhS2Jod1EvejhzVTcwOEZMVUVXY0lERTQvaXZGMjR3eTlo?=
 =?utf-8?B?dWc2OGNqa0hyYzBUTmdvZGJvVEpFOS9xQld0UnpiQWtLajRFQ25iTU45RGxt?=
 =?utf-8?B?TVhwWjdybmNvcnZ1aEVvUDNQQXV0S0ttTUp5R1d1Z1NNU0ZzSDcxNHkzZVlT?=
 =?utf-8?B?V2RCbHViYjRjdGd2c25vNHpjK2UvVWRyaTBVQzlwSFpwRkZOaHFoTVd4dEVp?=
 =?utf-8?B?Q0pqbTBlekg5MU5tVS8rbTdFWG9LNHZodXh3azZtWVllajI5UXNpdzBDZmsr?=
 =?utf-8?B?OUtSS0I2c1hIeHdyV09YajFmd3ZNRDV5NzZ1bVY4MFFGaGRJanNkSTN0eFg4?=
 =?utf-8?B?UnpSNEFZTVkvTzZiWENoQ0FsVlVudUlMcitHSEdpaTdieEIxOVlaYkNxdU5Q?=
 =?utf-8?B?R05BbElYVCthSG8xWkQvMTB5NHErZENlUTA5OEVYejJVNW00WGJ4dVVDMmxh?=
 =?utf-8?B?QU8zcG5zbUY4a1VNd1MyTzdKbGpkNkthU3ZMeFFTTytVNzEvY081eVc0UlFH?=
 =?utf-8?B?TGxERVUxNGgwcjlDcWc5MW5MQkdNQWJ3dGdManpZZTJ3ejBNVVRmck81cUxR?=
 =?utf-8?B?Vjl6SWU3SzRXNWtCSjBMV1VtTjZnd25yQ0tPS2d2NXlWRVVuOFA2a2RHWVRy?=
 =?utf-8?B?OVR4dytVc1p0QmJ2R0xobzRuYk53M3E3dzFRNTU0R21YZWRSZUpqTEc3UkFC?=
 =?utf-8?B?aURRUW52TWxPVzhCNVRGRGlhbkdHb29HNjUrT1QreGNqYVgrN3c1SHUxT080?=
 =?utf-8?Q?/JzU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UE0veTN5V3RLakVESy80bnZ3Vk9RZ0lzZkZNa09ZZVZhV2o3b083c2Y3RmpZ?=
 =?utf-8?B?ZENOaE53a0REZnF4ckszYncvU1l6NEZnZEw4Ti9saFlpNTdyZ0JpaUY1dFRu?=
 =?utf-8?B?VmZ4RnJHZUdNdEZsMDJKU01MVllhamN1T29OcW9HNUY4YlZpMnhzdzlYMUhH?=
 =?utf-8?B?ZGg1WmpKcXBETGQvcHRHUFRWMUJGK1NNWlNOdzBMVjJ6djd0aWorQzBsNllQ?=
 =?utf-8?B?WGg2TTRJVk8wMHlBSWducG11NmJlQ2RjV1hWZzRiODliSzV6SjlkWWE0QmdE?=
 =?utf-8?B?VmlwdnM0QjQ1U1M1eVZxdTdzTERQY0diZkNGaUc2cXJJN0NMVmsrNHd5c0pN?=
 =?utf-8?B?VWc2MWFEOGY4aGZoV1FTNTJZVy9TWlVSaGpYSWt6RGNmc3ZtQVFmOEZLRnR0?=
 =?utf-8?B?ZXlDcUtJQlJPVEFBR3JyMno4ME82VlRreFdyUWo5aHRCa3p1Y1NNUTlleXU5?=
 =?utf-8?B?SlVoUTBjQVR0UHN4aElobWZseG1ReDhkWWQ5ZXgzTVo4YW0wSFBHRkVRb1Ir?=
 =?utf-8?B?Yk0reDFrVWY5NGVQOEJMaklYR3l4WnZYOWJKd2tmdU9oajMvRmR5Q0xFbFlN?=
 =?utf-8?B?b3RjLzN1NkhXMTFVUmxqYTM1RjBMTG1RN1RWV2gvUmJ5dXdkRURLcndSWjVU?=
 =?utf-8?B?bHJvVllpVkpVdFdOVForZjRDWUJyUUZCeSszMStDcGFBVmIwZDVMWjJZSnNE?=
 =?utf-8?B?UFU5dlFkSldDMHFuM1Y0TFYzZWhoR2k4T1RTbS82YnBtWkhXODdBWnY3b0dh?=
 =?utf-8?B?WnNjZGcvWENIQ09RRE5KWng0cjJuMDBQUWQ2R1hXc0hsN0JFWi9rMVU0dmdq?=
 =?utf-8?B?cHpvcmwvb0pEUGlTd3dRUW5TL3RGd1dFaWFnZTZ2M2Q0MmdYa045THo1bUg2?=
 =?utf-8?B?dXRuYTIxT3oyLzdMNVhMY1gwd1Q2RXVvcDdIbHZIcDkrR2ppUnhPK0pCbjRI?=
 =?utf-8?B?bGs3MFpBYWYvb056MGdUWDBlaWFEcjNPM2Y4R0Q5ZytpT0prUG0vN2FlSUh6?=
 =?utf-8?B?R2o5am4vVS9YcjFpNkRKdklna2g3TVJFaWdGN1pXZEZwbThVandnZXZUeG80?=
 =?utf-8?B?U3FUaFhsbFBRQWJwdUZZY2RtMUNCUE84WE9WaWFMSXEzOGgvWXVaMnk0YjZV?=
 =?utf-8?B?MlBVY0NzdFl3Y3VmNWpGK285SFZ2WHZHV0xQZlBFQ2xRUURtck5QTVE3ZXJi?=
 =?utf-8?B?SGd1Z3UwWTRxRitCTXFUbHBQUStJNGx1RzZYRXg1ODN2NG5oVjRtdlg4NXBS?=
 =?utf-8?B?V2JkY01SYzRVeWl2eFZOOXFSVUZOcnNnR3ZacVpMNHFvQjMyRzlucUpXL0Vw?=
 =?utf-8?B?cjJMU1R4cHAxdEdPQVAwenR6TmdhcHRobGJjNVJvZWNaRFhMNSt0a3ZlT28r?=
 =?utf-8?B?T3VmaWZzK0JHb3UwdDN2NmdlK2lvRllLRjZVUTZyeUl6byt6aUZadjVYSU05?=
 =?utf-8?B?dmxUSnppSHFWY2c4aGV2STBpNThVSGJ3OWllb28yRzBmaTA3S1kyeU5URGlV?=
 =?utf-8?B?Rk9yc2xNNTBOTlpXOHBUck5kRlNDaDdhSWhjMHZNMmhwMWR2VXBjYkJBTGRW?=
 =?utf-8?B?Vi9FblFPTkdJdEJyMGhnU0ZsbGQ3eVRYYzA0ZVFCTTNPUkhadFRCREZnV2la?=
 =?utf-8?B?RkxuRy9tWDY4T3VNNmZNakQrT1NzdUlxSEpSRkg0KzNtNVJhZ2g1YllQZ1p4?=
 =?utf-8?B?S2ZmQW9pQWVoaFRPaHlmVlFVQnZnVG1HaXA1UU8rNW9xSWt4SG9WVWlOMkxq?=
 =?utf-8?B?TXoxdEtQSTFMOENBenZuVThhNnN0R1RJUzc2YjZyeDZpcExCRnFYVU54S3E0?=
 =?utf-8?B?dzJkeWxtN3NQdEVyMkFCQzNObEpuc0lLYk9IY1U1cjU2b01EYkVJU2NJT0NF?=
 =?utf-8?B?bUwzajNqVlpnZnlITkRVa3Zrblg0dUtjZjV6aWllUmI3dUt1QWhVUnc3bVZ1?=
 =?utf-8?B?QU5mNTJqWmhPT2t5ODR5QzJ5OGxCUlFpY1V0eHREckRrS1RVMW44cmdyc0Rt?=
 =?utf-8?B?eUlUR1NzcGFyYkpqR0MyWDcycjA4aVZVdGZOVktUQ0VQRzU2YmJtM0lVempt?=
 =?utf-8?B?WGtRTDV2VklRbmhKZEh3N1oyWjAxeUJXRXFKdG1MQllMcklpdWltSHFtcUV2?=
 =?utf-8?B?TzB2bkZHdklobFJJTzVpckJGZnIwejJXLzJ0Z2V5SFJMc1M4aHNkNytxc2lV?=
 =?utf-8?B?eG1jWDZuK25yZFBsNjRKcmpGYTFiczEzdVdtMFZKUUlwdTBjRjFyeTkrUlRQ?=
 =?utf-8?B?UGdrYTRCSkUwdm41M0UrUmdTOCtvL25aWXB1QWkzbEhoa0kwV211eDBsNzA0?=
 =?utf-8?B?NTNCekdYWjMwZEhCOERvcVAyanBNL3N2MllXUGhEbU8zNDlYMkRHQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 177df77c-0a17-4f94-b6fb-08de6d3afba1
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 09:08:43.3106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TujBf9Go9TFvKJ8a0SWYNBhPRyxET2uWxgmVCcaoE3qxc8yr17TS1dEwzZJwwjpBr0LvdpZH/Pw7V0gnanenDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4996
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:stefano.stabellini@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:alejandro.garciavallejo@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 25E5F141DB7
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 01:56:34PM -0800, Stefano Stabellini wrote:
> I address all other comments
> 
> 
> On Mon, 9 Feb 2026, Roger Pau Monné wrote:
> > > +static inline int nvmx_msr_read_intercept(unsigned int msr, u64
> > > *msr_content)
> > > +{
> > > +    ASSERT_UNREACHABLE();
> > > +    return 0;
> > > +}
> > >
> > I think this function is reachable even when nested virt is not
> > enabled:
> > 
> > vmx_msr_read_intercept() -> case MSR_IA32_VMX_BASIC...MSR_IA32_VMX_VMFUNC -> nvmx_msr_read_intercept()
> > 
> > I'm also confused about why the function returns 0 instead of an error
> > when !nestedhvm_enabled().  We should probably make it return -ENODEV
> > when nested virt is not available or enabled.

Oh, I see.  The return type of that function is weird.  It should be
adjusted to bool (not that you need to do it here).

> I agree on the way of thinking but if we return zero it will goto gp_fault.
> So I'll just remove ASSERT_UNREACHABLE.

Ack.

> 
> > > +static inline int nvmx_handle_vmx_insn(struct cpu_user_regs *regs,
> > > +                                       unsigned int exit_reason)
> > > +{
> > > +    ASSERT_UNREACHABLE();
> > > +    return 0;
> > > +}
> > 
> > Same here, I think this is likely reachable from vmx_vmexit_handler(),
> > and shouldn't assert?
> > 
> > It should also do something like:
> > 
> >     hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
> >     return X86EMUL_EXCEPTION;
> > 
> > So it mimics what the function itself does when !nestedhvm_enabled().
> 
> hvm_inject_hw_exception cannot be easily called here because it is not
> available at this point in the header. But actually this function should
> be unreachable because when !CONFIG_NESTED_VIRT, CR4.VMXE is not
> a valid guest CR4 bit, so nested VMX instructions should cause #UD?

I'm not sure about nvmx_handle_vmx_insn() being unreachable when
CR4.VMXE is not set, the Intel SDM states:

"26.1.2 Instructions That Cause VM Exits Unconditionally

The following instructions cause VM exits when they are executed in
VMX non-root operation: CPUID, GETSEC,1 INVD, and XSETBV. This is also
true of instructions introduced with VMX, which include: INVEPT,
INVVPID, VMCALL,2 VMCLEAR, VMLAUNCH, VMPTRLD, VMPTRST, VMRESUME,
VMXOFF, and VMXON."

My reading is that regardless of the value of CR4.VMXE the execution
of VMX instructions will cause a VMEXIT, and it's the hypervisor task
to figure out what to do.

> 
> I changed it to:
> 
> ASSERT_UNREACHABLE();
> return X86EMUL_EXCEPTION;

If the above is correct, the ASSERT_UNREACHABLE() is reachable.

Returning X86EMUL_EXCEPTION without actually having injected the
exception will result in a loop I think, as vmx_vmexit_handler() will
resume guest execution without having advanced the instruction
pointer, and without having injected an exception, and hence another
VMEXIT will trigger.

IMO the best way to solve this is to make vmx_vmexit_handler() inject
#UD when nvmx_handle_vmx_insn() returns X86EMUL_EXCEPTION. You will
need to then also adjust the non-stub version of
nvmx_handle_vmx_insn(), so it doesn't inject #UD itself.

Thanks, Roger.

