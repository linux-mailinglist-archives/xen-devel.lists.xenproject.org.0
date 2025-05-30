Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8FEAC885C
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 08:44:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000458.1380688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKtSQ-0003BL-M5; Fri, 30 May 2025 06:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000458.1380688; Fri, 30 May 2025 06:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKtSQ-000392-In; Fri, 30 May 2025 06:43:10 +0000
Received: by outflank-mailman (input) for mailman id 1000458;
 Fri, 30 May 2025 06:43:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lvem=YO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uKtSP-00038w-3w
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 06:43:09 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2009::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5710c887-3d21-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 08:43:06 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS7PR12MB6118.namprd12.prod.outlook.com (2603:10b6:8:9a::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.21; Fri, 30 May 2025 06:43:01 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 06:43:01 +0000
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
X-Inumbo-ID: 5710c887-3d21-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nWmMYCVaXXPpEHwG7nrknN4zfbqsT5oqKpevNj6E4LPehEP9hJFjBk/mA4aDcssDe9GHS9TMUJ1ZUOqVuRzw5IpAwjVsdgJSJeJ253iFGqGRoEhSb3weWk1bzSWxFZkpL2koUBAdWMMrpcqsDcbMXwhuAq9TbQM3OHcqKxNwH3hy8VHhHIOu1TBRpPBhES2HKKCsQHhhffU67muo8zqKcp8N+Pg9+BOvqBJrtMazsrXrXV1Y7eJrrtTO5ZTKMPPF1Rft5uWK/l0GKvYknZn0zjx7AXU88v81r+YKycZ7jdJVBuDlKM7NPMUqFoBtYYDlgCiMdaESFiJN/4ofxWkg5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FB3zugNpRFVBIAqtdCUbtKPwkQ1dbINzGX+e9fI+GlY=;
 b=QsbLG++FSJ0EFenfHz4LTk8siIv5l2eMTd9hcT67L6NcUp1Vz5bOEVR+NIpTa/WoFwkYVAfepnZpnKtgCe8RpCHzotPPBmhYx//cyMeSIagF/erHSXBjUo05bmfx75l1P+BK9xsatp+fhr5zeSVLf9epfns7xIv+IBd/l/YTqM+ScnBcMZIog5qA88MLxLxmtrEQ0nXv34pWbGH+ag99q7IprrDQbhaCdwT1yvSdOwg24mw3qcbdFCFghza0oEhv46YFxt3NreOQekkzVASdugMLm4KwB1YP1jAP65AelyM87Sd/1n0y0KSpWqAtiRxtp4fkGIJR7eNGL2H7UdXOeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FB3zugNpRFVBIAqtdCUbtKPwkQ1dbINzGX+e9fI+GlY=;
 b=IWa0PTb6kuCv3EDJpClYunOsKPtL9Z55z9hpLS11wbxva6b9nKiBZZgQftbAcgTyPJe1R4Mx8MYnM1cJGt4Dh8Q4M0ZszOki4aTAgnweGfeDZSfRvP4iDL0FHvCBd0oPgikY9NVeZo+m6O444wu2125PwzhJyLJE8i2WQR8WCNE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <83cc8e35-b670-4a56-ab5d-5356a44394c2@amd.com>
Date: Fri, 30 May 2025 08:42:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: vpsci: Fix typo in comment (SCCC changed to
 SSSC)
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <3881310bb93e20fd7d28d067e11ec9d19b68c60c.1748547428.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <3881310bb93e20fd7d28d067e11ec9d19b68c60c.1748547428.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::15) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS7PR12MB6118:EE_
X-MS-Office365-Filtering-Correlation-Id: 971f084a-3df2-4cd6-0c1b-08dd9f4538d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VS9uc1pNK2Z4dk9QbUloMmNucC90Vzc3aHF5NEVOdU9MMjdrRmg4eEhHUlJa?=
 =?utf-8?B?NHZML2Vya2QrMXlGd1E0NUo3dlNmMFFuYXhkdVdxTHRhUWFJMDRZQ3hqMmQ3?=
 =?utf-8?B?Y1FqZ0FMUW5pMW11dmt4amY5Q21DMXNwbFNPSkhHa001SDNpcTM4WU1leWo1?=
 =?utf-8?B?Snc0UUZVSVlKb2J6aFRYM2xCaWd1MXdpN0M0WWhhNHpLWStuaGtrNzFyOFZp?=
 =?utf-8?B?dHNvSHk5Mi9oaC9FbEk3YTBXYnFCZnVrUHkrNms3TXBYdlpMUWg4R3E4cHdK?=
 =?utf-8?B?ZGZFN3V1V1lsU096aVg4QUVrZFZpMVVsYTd4c2pDd093OVVLK0NtS1NhZ3B1?=
 =?utf-8?B?dE9KOGoyYUlyc3ZBbjE2NStOSlJBd3VPd2ptV0xkUlBzaEpTakVXRWI3RFJk?=
 =?utf-8?B?ZW8wd0VmYWpXakFJZ3Z0ZVcvYUNoSTVOakNUUzJmOFZnQ2dpMkNIZ1pFNlE4?=
 =?utf-8?B?VjFDNzE3dnZqdGdpWDdDK1g1VG1zc1VOU1VVOWpmdlFkZ1lGYklodmYySmFv?=
 =?utf-8?B?RnpHQXd2UDMxeUttRTlucnRZczB1bitQUHY3aFBlU0dYQ2lobTB0WXdaL3Zt?=
 =?utf-8?B?OGlGYmJBOGdvcGVEZUJzeTBYbHZROEl5NXFyZlk2dG8wVmF5c1JGc1YrVjFo?=
 =?utf-8?B?U2FNNG9JNC9ncDlkYmtYRVQ3bkpjWDdJOG1OSWovUWYrWW53OUhabVUzYXpN?=
 =?utf-8?B?USsrNTJwcWExWnMrd1R5Mk9XVXpzeDB6b2l2ZkpnekQ1WXQyMWZFOE9IS3cv?=
 =?utf-8?B?VWR6cnpwZ1d0cVpxMVhtQXFpbko4b2lZQmRxRTVLd3pjRE5GcnlUeDZ6amEy?=
 =?utf-8?B?ZzVYUHVWVWFVNFdEeHQvc29xeFdSQnhtZThNZ1VSVndtVWw1NHcyaWxGelJB?=
 =?utf-8?B?V0QwNXpIUUtnTUl5SlROc2J4Z3FBbzVsSy9nMXppazV0S3ZOVVNXWUtXQ09M?=
 =?utf-8?B?cFYzOHM3WFNxRmFqbTBmbTFDR3ZOMWFWWnFEZnUvM2dqYVNtRXdKVC9iVXpw?=
 =?utf-8?B?SWt1SUV4Y290UXR2azdCb21ESGlCeFJsZjJWMnV0K2dUU2I4dDZoRm53ckdT?=
 =?utf-8?B?M2hmY3dUR09sMEJWbVJreVJYTm42aDZOYmxJbkNMeXdqZVgvSzBHV09vTndI?=
 =?utf-8?B?TTg5MHRBRkZtWHpvRXRCWmdYWC9uK2k0OVpMQ2c3aEVZYWQ0K3kveTdscVF2?=
 =?utf-8?B?c0Q0b0tac3QyalcxUVlDK1drNDV6RUVBbXhtV28yRkhXamhnMzYzbUpTWmR4?=
 =?utf-8?B?NEdWSitKUHB2c3FJNnpZcXY2SHZIOXFOSHhxbmtOaEJqS3NraWFtMldBd1VR?=
 =?utf-8?B?dmZubWRXcFJZbWZady9BMlMwUlpEdG5pWjZ4M2Fpa1dEY25aVnE3K0FLbm1H?=
 =?utf-8?B?eXFxZWtVRlkrbzFyWWlzbVBqdVpsdnFkM3Z2TUlwTmhjcExkUkQyTmlEeXZF?=
 =?utf-8?B?UkZYK0dJL0k2VEVmUUdBUUovQ1hEb0REdGJlaDlFSUtUMkFWK1VBa3Z5RnB5?=
 =?utf-8?B?YjZ5dEJKWnRZU1IzZ2RLU0k5dEhEalRweUFLUk1kdEdJb01kcmE3Q29MNWwz?=
 =?utf-8?B?dWdpcnVlRE83RUpLTUtMMjhoRVhzRjF4Q1UxTVkxTG91cHBCUjNFUmRZM3o4?=
 =?utf-8?B?Si8rYXNRa2NWU1JmU0pqZGZvelZNVUVTeUFoMzJ5eHJpS2x2OXNwTnVTSGl3?=
 =?utf-8?B?YnBvdVArZzNJbEhZMW9kMFFWajVEK3hHRzdYSTg1TzRUNk42dnhUS2s5Qlc2?=
 =?utf-8?B?cTkzTVdUTHpBVmZFL3l3cm1YREFOZ0dCeTJHYTEwaWZLU0ZVZE03bENMQ2I3?=
 =?utf-8?B?aG5reWU3MENzMzdTVm9PVlN6L2hHaW5pOHJmOVRQZzRRd2J1c0JTZ1NGWno2?=
 =?utf-8?B?VU8wcGxrdTA2K2c3L2dqc3ZOeENza2xzL2x5NXFGUFlFbDlVNXVWZk5RS01E?=
 =?utf-8?Q?lT7en3nqWbM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0dtTEJxNmtZZFhsSkdrRG8ySzh2cjdITEpnVUI2ZTFzVDJBblNQaXo1Z0NO?=
 =?utf-8?B?dDg2WUlPdktocmxPd1dEa3VlVWVHNWtlczgrUGdQb1JNYjkrMzlWRTNjL1lS?=
 =?utf-8?B?d1FhQTZRZzhFRHZWdXZOdE91b1NlQmxzbEwvM0cxTTlEY3luRWI4eFN3SlZW?=
 =?utf-8?B?djJ0bzVkVVlSZWVudlA1YU15L2xvejd5SXpWMkpWU1VvdXZmWkF2NklocmR3?=
 =?utf-8?B?b0FDdTNSUU5xMUtpM2VWaWVsVmZaT29kNk8zakhZU21CL1ZJb2NnVTlHQ05v?=
 =?utf-8?B?Y0VWT3V0RE5FdEVYWWV1cGhJWjV1YXJiTFlYR3ZOcjZvVUZiTE9pQm1NL0o5?=
 =?utf-8?B?NjIwYkNhUklCS2NneXc5N3VCNHdVdGQwWVJlRVFqOWpONGtDL1pxR0htM0hS?=
 =?utf-8?B?bGhpV0Y2ZWo3UzV2YnZtaUEzd1NUaldZZXh4Q2o1VHZDVzBtdDFCZWZiVkg1?=
 =?utf-8?B?TkhCLzVxdGkxZ3VIL2ovWFc0VWRCM2tsNlJDYnQ4QnRFeWFIbVQ2S2Q3VklH?=
 =?utf-8?B?WkVnL2xDcUR0YkR3M0YvMXpTSGtKWFFNTUd0WEVUT2c1aEdWYTc1VStvd3hC?=
 =?utf-8?B?d1N2VWpSYzFYYnZVak9DNDM4eTk0Y0FsUEpxaTI0Z1JnZHhTOG5nUDNqM05M?=
 =?utf-8?B?bUJESkRTTlFnekhNbjM3cyswMVRzNUtKOUtUS3ZVQUZLWVRYQ1pHcnlZUVJn?=
 =?utf-8?B?K21HMll2clhLWGR2VHhYc0p4NmZJYzEyeFNvWXpEajZCN0U3Y1RBUzN1ajFW?=
 =?utf-8?B?Y3hhUFRnb1U4KzJscUZ3VDRha3lKMVBzOUhKUDJZY0llb2hWbFdnOEdPOXRK?=
 =?utf-8?B?Q2FJN1EzR3QrbHRmTXpxSUhlSGMzdy9xVU82ZHluZEx5NElUbW14Y0cxZTlT?=
 =?utf-8?B?aWVWalhBT09uQ0lLZWhWT25rcnIyeHpGaitjdHp4N1BzditQcU0wRldkMGo5?=
 =?utf-8?B?K3l6RFBONHRFQjRndW9jYVVEeUIzemdYM1JMM3lGSnIxMVZ6a2R2TUtnVEJW?=
 =?utf-8?B?WVE0V0FFSXRyRkFsY2g3Q1pybFdObzVuVngyM2ZhYzBpa1A4a2hwbncvZTda?=
 =?utf-8?B?UWVYUlltRmpDTTlvcVVUbFB0NVZJSVlMUjYwVHZHVTRMcHFFdFZFdWJaanJZ?=
 =?utf-8?B?Q0NZM0lmYlJJWHNLM2pTOVJJV1ZIU09qV0VVQkdMQnV3VDByeWpnZ0JZSUpT?=
 =?utf-8?B?M2dTUnpGaURIdUpvT2c5alR6b2VHRUpsZFFtazZvMzU3K01aSFE4ak41cU8v?=
 =?utf-8?B?N3NkdWVibTR5RFRVL1hKL1RyMm9EdU9KSUJDRWlBQ0R6blNCZE5mT0VpSDZB?=
 =?utf-8?B?L3c0Y21VZ09XMjVzalRYaTYwT0RlNWFtTUF3UzAyc1JtNTlNekl4MWJNV3dE?=
 =?utf-8?B?cnJEc2lOMWZ6WllnZVpmYllhVjhxSXR3RjVyazlnM3RpNmNuQzIybDJNcTdt?=
 =?utf-8?B?Q1gyVkJ0a0xoekFUTEVnelp1M0JJY043NHZDd0FYQllUYU1jejFSMnFwY1NX?=
 =?utf-8?B?NVJHV1hMRzk1NllWclE2SXR5cVZiNSt3aEgxUEFEOGFhLzBiMWdnSHRNckY2?=
 =?utf-8?B?UlBEc0lCSmhMUzhMVllMOTI3Nk1YSCtwdmUyRVVNc0ljbTRUNWlIOEt5d3Ax?=
 =?utf-8?B?aTVPYytCbmhOc01NTkRhb1NQNTh6ZVlEem52aE5lT3J2TTNIMnpPbXg0SVdv?=
 =?utf-8?B?MFdwbmFPaTBvempPbzZ5ZUVQSUpVZzFtNEl4bllTSk1mTmUranlzYmhwUWtY?=
 =?utf-8?B?WkF0UTIzU2svLyt6MXdoN2o3ckdnSyszeG13clY0ZDZKODluNWh3SHJiYkkr?=
 =?utf-8?B?V3lrOVdmOUJveUZDaDJkZ1NnTFp1aFJCSmN2Rm5PcFh1NFdiL1lpVVQyWE82?=
 =?utf-8?B?MDIxcFpEb2FTbnFJQnFBSFE0K0pHMVNIUlRodFM1NEtiR1RuVWlLaFhkQUdJ?=
 =?utf-8?B?ZVRFQUNYL3E2d3pIQkxiTW5tb3p1VXpHVDh5cHRoZnJVZkhwWHQ2UWVxbEha?=
 =?utf-8?B?MmdUUkRPdWwrNTBRbDFBNDlBVllPUXBIVnk0MGp1bWxHUmlWUGc4dHhsa1pL?=
 =?utf-8?B?eXlxV1JhNnY3UFVwZnVkMi9OSnNmeW45d3FPVVBSWXpVaUhhaENnWVYzN2NS?=
 =?utf-8?Q?SHn8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 971f084a-3df2-4cd6-0c1b-08dd9f4538d3
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 06:43:01.4570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HFd+/oHNoAA3BRvx8vZRatqmWYOCruvCoSveGWytVVlaEVyOLYSfejySyQLlH74C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6118



On 29/05/2025 21:40, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> Corrected a typo in a comment within vpsci.c:
NIT: use imperative mood in commit msg

>   replaced "SCCC_SMCCC_*_REVISION" with the correct "SSSC_SMCCC_*_REVISION".
> 
> This change improves clarity but does not affect functionality.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

> ---
>  xen/arch/arm/vpsci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> index d1615be8a6..7ba9ccd94b 100644
> --- a/xen/arch/arm/vpsci.c
> +++ b/xen/arch/arm/vpsci.c
> @@ -268,7 +268,7 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
>  {
>      /*
>       * /!\ VPSCI_NR_FUNCS (in asm/vpsci.h) should be updated when
> -     * adding/removing a function. SCCC_SMCCC_*_REVISION should be
> +     * adding/removing a function. SSSC_SMCCC_*_REVISION should be
>       * updated once per release.
>       */
>      switch ( fid )


