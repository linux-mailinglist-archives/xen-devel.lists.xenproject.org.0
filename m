Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD211C6971A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 13:42:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164672.1491578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLL29-00053k-4V; Tue, 18 Nov 2025 12:42:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164672.1491578; Tue, 18 Nov 2025 12:42:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLL29-00051S-1D; Tue, 18 Nov 2025 12:42:09 +0000
Received: by outflank-mailman (input) for mailman id 1164672;
 Tue, 18 Nov 2025 12:42:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/jeL=52=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vLL28-00051M-5O
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 12:42:08 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fdf0ce19-c47b-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 13:42:07 +0100 (CET)
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com (2603:10a6:20b:6::31)
 by AM9PR03MB6708.eurprd03.prod.outlook.com (2603:10a6:20b:2da::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 12:42:05 +0000
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4]) by AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4%4]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 12:42:05 +0000
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
X-Inumbo-ID: fdf0ce19-c47b-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mwrtb1CM46YpZz+sJw4vI25gHQ5Kagl2k/lAQ4AOWX6sa2fnId3swBUl/RoWe8XbnxrWiq2+Byjod7g883h5rWHG0wkq1hITPli1sLH2mQPdIlWmB3tqT/q7Lzm2k5J9pEFQG4VR7I30YTACVXwrofKe7MxTnzImTsmZJiP+KYb7GzAdvGuw5TdU5sbE8cRoRDFDcTNjFf4esDNa/EP+dEeq0Q/KOkGF3nDqHUk7wX1MlDM6RHpXbYrNmlis5qH+2665fTRGeE/5yStOoqsEy/eOujN+VRupWrhbVAbOMB3syv2rQmdvqY1YVJE4cWs423kOAyEITgd7Mb/CJh/fFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGqOVODywlgENKbFMufC+/eym8CzsgqWh5ggEqqyMvM=;
 b=ZLcbeuzNRl7Fm2US734PWlR3P9Ycdfrvrpj9o4fIi71SDWvPt8M8uW07oEvTgN3RiAc6Eu/sUvYBpdmnoynNbzlonV2KtI5WZYB2MfYMzB8726L0T+QZqfMRHlUnHj6S9qp0jrNpR57vitGEB6dFfKMNDVNdewjYFDPdRBS8iGnQIgNKRpKCgm7Lqqg6mK9Y+tqGSWTNj6hocimFtA0txhe/J+Y8UC8E1HVde8/U2JZfm7ku+zvYJPtPBrDmlFtP1R12Zy9kjNAun6ufVFA77o73j2DPxa+x5IGM2CeJ+QqLXDPBwuN9ceTiQ+H7hEUzte6gWo9HWi363tXSIxC0ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGqOVODywlgENKbFMufC+/eym8CzsgqWh5ggEqqyMvM=;
 b=PBHhXpIqQb6mex1IhfWM0bOAAs4xcGtz72QBMsJlMUMA+cwuNywsrdHYCdujI4Hg5+MZtyXqTKvOGEpeZ2b/bSx9eZchKQ0rzTFgzfzNxYMqRkMro8H0qL2M6cB5+6s+hLIH8MrZktQvbavGRy2zmGNopsOU+p+b48zr6+zoPuxZihW3bIlI2Amxa4pkHZi3m49/lrjV7EmlusfUT2HS9x9XsTPzKjSjXTQ90LUbr+zbooF6kLvU+MVU2UKpXl97EMAQqeCV7ZSsROAId+nB7chYHJR+1rHpAOZLFn3hBzq1e2ZNJxhDFGc/J9MEE+uEE5IHIXoWsGhl2cxT05NA1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <5ebcbafc-d391-4541-8df3-2742cef43be8@epam.com>
Date: Tue, 18 Nov 2025 14:42:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v3] xen: make VMTRACE support optional
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Teddy Astie <teddy.astie@vates.tech>, Penny Zheng <Penny.Zheng@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251114142207.279834-1-grygorii_strashko@epam.com>
 <225378f4-0ebd-4c77-ae77-807bbb03b0bb@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <225378f4-0ebd-4c77-ae77-807bbb03b0bb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:22::9) To AM6PR03MB4600.eurprd03.prod.outlook.com
 (2603:10a6:20b:6::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR03MB4600:EE_|AM9PR03MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: 905ec9e3-06e8-4f76-03b2-08de269fe0f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YlJ6cFZQTFlGUnArS0diVkV5NWE4WkpvdytVYkJwU3J5MkF6Nk82alF3cVJ5?=
 =?utf-8?B?QXBBYUpvanpqdG1MTVdhTVV1YkpIWnZrRW9yMmFIeFBUNUdKU0d3MFZjYmFp?=
 =?utf-8?B?T25uUUpmNllMUStIUTJZZ0QxeGY5ZHJ1QVUwM1ZBNmpxbHpFamN6Sk44d1Rk?=
 =?utf-8?B?Tm50aXgyRExJZ0x6Y0I2Q3RiUWdUOGlVcVJIbHIwTjlFWkhaTjlwTVVrUjcy?=
 =?utf-8?B?enNXZG5ENjNUREtOVElTaUJIVkt0SzJ6cVplblU5TjlVNWpEVGNYMW0vdGRD?=
 =?utf-8?B?THhJWEUrWVJEMmh1SnhFbm5ZME5VdGxjOWJWV1gwNXZWOHhIdVlOdDBGLzNy?=
 =?utf-8?B?NTlSR3MwK2UwZ0l3WHYveGdqalIxMGdndGFXeW83U2RnWW9LTjJ5dlJ6OTNY?=
 =?utf-8?B?ZWo5eXFzeFB3V25IOVhuODNJVjVNT0RRcGJIQmpQb0V1NzRrMjB4d1BkNjh1?=
 =?utf-8?B?bTJhMGFVdlI5RjBnYm1vWHV1Z0d5L1JXNWZzTk1oblkydkg2YUJJRENhS3dQ?=
 =?utf-8?B?eTlPbTVTRkxXeWJJY01rV2lqSFQyckwyL1VNZEpYUityRDBBTy9OdWpDVGNG?=
 =?utf-8?B?SkEwQzVhM1hydzc1MzYrbUM2elZkSGxZc1ZNWHBIRWtsZjdjZ1ZJTTRDekVw?=
 =?utf-8?B?NGNxWG9jRm5iRDFxQmRwQzZmYUc3dG82NUVMZ1I1RXNFakdXWFI1R2ZHbmR5?=
 =?utf-8?B?dllTcVVDNDZuMllVcmxqSFdrbWt2UDRFaUlmVXBhdGdxTXRWRHZXR3VDYVFD?=
 =?utf-8?B?NEpMVkVOaFI5bkRLRy8vb01tOGZTOTNMc3FRa1hCQVV4bEtibDlFYnYrQlli?=
 =?utf-8?B?RVdVU2IxUnl5ZVRmRmREYlRhT0krbSs2K2thNFdqVG01TDBpTEplRjVIWG9p?=
 =?utf-8?B?eVAvREh3UUpDSktGNWRpdHp4QXRqN2lmek0rWG9VekEzRUIyNjRxL2tpVXdh?=
 =?utf-8?B?d1JaWTJIVi9BVy83OEVrZFhMK0VwYjYyRzhWZUZNS2owOXZGWmdPSkJLejF2?=
 =?utf-8?B?MEJyTDJvWG13TDVXa2hNRUZhUjBKeVYya0Zaa3l0UjJNSmZBL2kza2dKdzlD?=
 =?utf-8?B?WnBMaGhjempjbkVYUFBZS2hxc3J6MTNmQ2N5VzhRbFBUdkhuazZOT2pjRHU1?=
 =?utf-8?B?SkFYUHBwUEptSjMwZWcrN2ZnZmVDTTAzTGJYWDlQSVRrSy8vWkp5aEJ4aGhz?=
 =?utf-8?B?alk2UlZoUWxMeDR3ZmxCMDdOUDZWblZWTmxqQ2g3ZSt4L1J1V24xTlVJK25Z?=
 =?utf-8?B?Q3V1T041eEdlMmpPRXBiaTB0L2tLTy9QK3VaMGFCakZ0aWErMmtSZVZEZGFv?=
 =?utf-8?B?ZUN4MitBR21jQ1JBekN5NDYrem1wQVhDcy9WMlZjdmo1dFVFNWhFRGszRytV?=
 =?utf-8?B?K2w1MURYMkp4bjhKZkt5dWRobmdCdGRVY280a3doUzM2eGI5WGJmUEZrRVBs?=
 =?utf-8?B?MTEyOThXNm5zbEUvUlhVbitSOHlZYjVZeCsvSjRSV3l2M2s4QStNZW9EY1Zk?=
 =?utf-8?B?NHhDSThOemdSK2VXbDRoYjZKVUhNRU1kdzF0NFEzRXdRdkdsWHhFaXZOZ29o?=
 =?utf-8?B?cUJTUVBKeDFmMktKa2xNYW44RFhUSHZuNFlmcWpyUHZvbjh1M1dnSnNUUTNZ?=
 =?utf-8?B?eW15eDdQNXozTjdZMS80ZzR1K2x3SjhRSXZ1RHlyNWNRbWdqa1JHNHNCWFNy?=
 =?utf-8?B?Z1Ewd3poNjNaYjNEVFZCdzhMaytNeVlpcStjZXFhOVZjWnA2dTEwa2Jwbm9w?=
 =?utf-8?B?QXVQYnVSa2toUnMvR2dMb1RnaG1Mb3JRbGhDNGY5enEzWlNlby9HTDV4bjE3?=
 =?utf-8?B?U3k5cXhTK0xrYkp0Y3I1ZUJVd0R4NktaWVNYSGxmOGp6QXhrYy8rc0thTXVx?=
 =?utf-8?B?WWFMOVlxa2ViS2FKUDJ4UmVmUWt6SnJhN3IvelQ1WTRBWjlQUnd4ckJMbTJs?=
 =?utf-8?Q?1fV5bCC1nskLCiplpSMqXkpta9eoKjCy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB4600.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azVnK0RpRTF6T0FhK25XYllmc2NxTUhXWnRwY0tYUjdtbHdST1N2ZXY2QW1y?=
 =?utf-8?B?TktXNHk2Q09JaXpldFBJNnQraU1ReXd3ZktGOWkvTGFjYUZMcGp1T3dwWHE3?=
 =?utf-8?B?ZmMzYUt2ZmJrVW5UQktPRDFPVUtQNHVEaGliQmUvNmcwaE5CcDgrbnVXd3Jo?=
 =?utf-8?B?ZSt4T1hWQzRjK3BTalNnQnBBaWlVTEd2S3JFSmVMM2pNU244MG5ZOWxRbUdM?=
 =?utf-8?B?a3hnRU9WZTBoZ0tvQlBOb3pwdEtNemdrOFNEYU1wZUJrODExMHNyelE4VjRR?=
 =?utf-8?B?eEJzOGhTSGZEOGdoVEp6dEZkbFBRazhNallUaVNIMVhVT1k5c1F3NHVHVk1V?=
 =?utf-8?B?Z3VhbHc0RHU3eXdGYURUdk1aT0l2Y1NTRVh2Qlo4LzBoWFRIQ2g1R3FCSFRJ?=
 =?utf-8?B?K1pWZHNJcTVyazdlMjNKdFplQ0E2TUxXN0RZd3I2dW9qL2FGVXAvK0NzNXJQ?=
 =?utf-8?B?MElmekQ3N0pXM0NTSkNQS1NSN21oWTJTN092cklLNnJubkdHaGZaQk5JZnhj?=
 =?utf-8?B?M3BoaU1BVjZBM1hsbm1WYm1USXZxUk9FWFp4VFE3YTdJcHdxRkE2a29CQS9I?=
 =?utf-8?B?Ri9ONGJHRDdyWjJWNnhCdlZOWmYwUGhYQ0hKZDl1NldqdGpKbXc4Q0dYdmZP?=
 =?utf-8?B?UWZnRmtDL282cWozTEpMbDF2dnVFNG1GZVVrc1NEdi9udnBZZmNpRWl2SkY4?=
 =?utf-8?B?MWE2VmlrRGFGL0JIb01OQVFsUGNocVF1dnZodUZDckNnd2tsNE11aFNjbmNj?=
 =?utf-8?B?ZmdGZklvcXlhSDNnRndmWmFCUHkzQmhKRlNQOEIyRnlxUC93WWlUOXcvcng4?=
 =?utf-8?B?NEpkb1B6azF0Zm1QaU9NTlVKOXIzTmVSbHY3L2tNSUVRQ3lJeHRmZ1NFb2VF?=
 =?utf-8?B?Tnp0cjJhT1FMYW1vaEV5TFdXS09qdy81VlJkaWxrNStrUWZHbE95Njhhd3V6?=
 =?utf-8?B?UGM3b0syQ0szMmZONXJvSlU0Y09ZQkNidEg4R2NMZkFCSWdrR3dlQmJHVDJJ?=
 =?utf-8?B?aW5oK0RoWWxzUFNCL0dHSzhrQnl5YzAzdTdtRmp2azhINXM5SW4yaU5WNEt2?=
 =?utf-8?B?U1AvWTUzTnNRL2FNZ1NDT1p4cXQzUFZwaWluOVMzY3J0R1VmbUFNU3dvOGYw?=
 =?utf-8?B?bm9QVmFlb1BReUsrT2hDNEg4d1BDUUdMdkpiMnNpQTBCaFo5VGYwb1hYczcz?=
 =?utf-8?B?N0F6MkI1M1NEb0FidGVUdklpUEJJWHUxbTFWbmptS0RGV0MzbnNLTHdHL090?=
 =?utf-8?B?ZklEREtKRWlOVmswend3UVRYUXlTTW0vNHRkN002N0gzNEQ1M1Q2L09WTGcw?=
 =?utf-8?B?WVVvdjN1M0dzbGtXY0o2SFY4dUlIMFBrem5tR05VdVFhYVVWWXhzZ09HMlQv?=
 =?utf-8?B?MDc5UjVzL2UxMkFvRms4SFZibFRRdTc4VzJiWVdUMWYzcGJZcS80cTVLS2xa?=
 =?utf-8?B?aW8zd2JJam5RYUtpaFllNjdMM1JFZEtaWVpXUEpoRk1WTHVaeEdobG9YK3Ji?=
 =?utf-8?B?bTZMeUpxeHJoajFDT2pyYTFsMGF4M252a0VYRGVpdlMwWjRBaGlZMUp3YktQ?=
 =?utf-8?B?T05zcEZCZDhQUmR2WDR3NEdpb3A0NVQ0RkUrbWJneTR0a3hVR1F4UUtQOTlZ?=
 =?utf-8?B?a204VjM4WENkRzM3R01IVVZHWXpUckJDUkNnME5VL2JuVWU3VHQxVTBkQTdw?=
 =?utf-8?B?L1haUXNBcVYyaG1BTGxiU1B1ZHBhc1Q1LzFBTjZsQlRSS2xMWkcxQlF2OTY0?=
 =?utf-8?B?M1RIYmtJb2dCUVN3bXNaRU5UQk1mNmpBOUM5ZStuSDZXNHYwdy9DRXl5eFYw?=
 =?utf-8?B?MSswU2FURHdIZFBXeTR6NkgySWZRT2VwdVE5bkJob2ZCY0sxVHR1UkZDNTYv?=
 =?utf-8?B?N1VHalRoOHhZUWZGUGM1TWl5SGZuTWIraitBanJBbkVuR3p3ZzFlR1VUQlRK?=
 =?utf-8?B?alMzV2hXWjN3aWNBYXpPYXFUaWdlZ2h2eHhBT2tnVWxFNWk1R3c4NzE2cklK?=
 =?utf-8?B?U0Z6MTFZSFBhVE9NUmFBTlBpTHJRQzF4TkFDb0dEbmJwSzJPcENodjNtaE1s?=
 =?utf-8?B?TUtvMklTRGcrOGN5U2hTQnU1M0NDc1FBMkw3QXdDSmQwTTN2OStuVjVmcWJs?=
 =?utf-8?B?S05jRDZ5elgxSzI3OGtHRkFubFgwSEV0RlMxREh4QmtBb2NMVnNFazd6N20v?=
 =?utf-8?B?anc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 905ec9e3-06e8-4f76-03b2-08de269fe0f9
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB4600.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 12:42:05.0288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vzvmKIyuWolp41LksWxM6YfZq72g0aEMPrNA4sQtBBT8jWQp0cT/W8xDM6U+nr6iLzhqzhz/9qUYvFjKnXUu3zCV923X0oZrEY6Kl9Eq1vc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6708

Hi Jan,

On 17.11.25 18:52, Jan Beulich wrote:
> On 14.11.2025 15:22, Grygorii Strashko wrote:
>> --- a/xen/arch/x86/hvm/Kconfig
>> +++ b/xen/arch/x86/hvm/Kconfig
>> @@ -35,6 +35,18 @@ config INTEL_VMX
>>   	  If your system includes a processor with Intel VT-x support, say Y.
>>   	  If in doubt, say Y.
>>   
>> +config VMTRACE
>> +    bool "HW VM tracing support"
>> +    depends on INTEL_VMX
>> +    default y
>> +    help
>> +      Enables HW VM tracing support which allows to configure HW processor
>> +      features (vmtrace_op) to enable capturing information about software
>> +      execution using dedicated hardware facilities with minimal interference
>> +      to the software being traced. The trace data can be retrieved using buffer
>> +      shared between Xen and domain
>> +      (see XENMEM_acquire_resource(XENMEM_resource_vmtrace_buf)).
> 
> Please check adjacent options above or ...
> 
>>   config HVM_FEP
>>   	bool "HVM Forced Emulation Prefix support (UNSUPPORTED)" if UNSUPPORTED
>>   	default DEBUG
> 
> ... below for how proper indentation would look like here.

There is a mix in Kconfigs - some places <Tabs> some places <Spaces> :(
Will change to <Tabs>

> 
>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>> @@ -307,6 +307,7 @@ static int vmx_init_vmcs_config(bool bsp)
>>       rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
>>   
>>       /* Check whether IPT is supported in VMX operation. */
>> +#ifdef CONFIG_VMTRACE
> 
> This imo wants to move ahead of the comment. (Feels a little like I may have
> said so already, but it may well have been in the context of a different
> recent patch.)
> 
>> @@ -772,13 +775,24 @@ static inline int hvm_vmtrace_get_option(
>>   
>>       return -EOPNOTSUPP;
>>   }
>> +#else
>> +/*
>> + * Function declaration(s) here are used without definition(s) to make compiler
>> + * happy when VMTRACE=n, compiler DCE will eliminate unused code.
>> + */
>> +int hvm_vmtrace_output_position(struct vcpu *v, uint64_t *pos);
>> +#endif
>>   
>>   static inline int hvm_vmtrace_reset(struct vcpu *v)
>>   {
>> +#ifdef CONFIG_VMTRACE
>>       if ( hvm_funcs.vmtrace_reset )
>>           return alternative_call(hvm_funcs.vmtrace_reset, v);
>>   
>>       return -EOPNOTSUPP;
>> +#else
>> +    return -EOPNOTSUPP;
>> +#endif
> 
> No #else please and the #endif moved up.
> 
>> --- a/xen/arch/x86/vm_event.c
>> +++ b/xen/arch/x86/vm_event.c
>> @@ -253,7 +253,8 @@ void vm_event_fill_regs(vm_event_request_t *req)
>>       req->data.regs.x86.shadow_gs = ctxt.shadow_gs;
>>       req->data.regs.x86.dr6 = ctxt.dr6;
>>   
>> -    if ( hvm_vmtrace_output_position(curr, &req->data.regs.x86.vmtrace_pos) != 1 )
>> +    if ( IS_ENABLED(CONFIG_VMTRACE) &&
>> +         hvm_vmtrace_output_position(curr, &req->data.regs.x86.vmtrace_pos) != 1 )
> 
> Would be nice if the too-long-line issue here was also address, when the line
> needs touching anyway.

I left it as is for better readability as an exception.
Will below be ok:

      if ( IS_ENABLED(CONFIG_VMTRACE) &&
-         hvm_vmtrace_output_position(curr, &req->data.regs.x86.vmtrace_pos) != 1 )
+         hvm_vmtrace_output_position(curr,
+                                     &req->data.regs.x86.vmtrace_pos) != 1 )
          req->data.regs.x86.vmtrace_pos = ~0;

-- 
Best regards,
-grygorii


