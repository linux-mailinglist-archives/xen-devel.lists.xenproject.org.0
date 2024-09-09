Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4100A971559
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 12:30:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794212.1202987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbeT-0002KB-1H; Mon, 09 Sep 2024 10:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794212.1202987; Mon, 09 Sep 2024 10:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbeS-0002IS-Tz; Mon, 09 Sep 2024 10:29:44 +0000
Received: by outflank-mailman (input) for mailman id 794212;
 Mon, 09 Sep 2024 10:29:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4iu/=QH=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1snbeR-0002IM-NM
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 10:29:43 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20625.outbound.protection.outlook.com
 [2a01:111:f403:2412::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c18ddb1-6e96-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 12:29:42 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SJ2PR12MB8181.namprd12.prod.outlook.com (2603:10b6:a03:4f6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Mon, 9 Sep
 2024 10:29:37 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7939.017; Mon, 9 Sep 2024
 10:29:37 +0000
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
X-Inumbo-ID: 6c18ddb1-6e96-11ef-a0b5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hemg1DXgVYPywY5xp3QLbRJ1470oTlKtbNdrZWNXn13S90uJKyQ175p7tzmEtUJwHf7CokK0rDGyN83LwH36gWXHpel4w5LS5I/p5t871n42Tz13NxJTQpkCk5r5zO4XAyj/YLCvZK2NWDlusXjjZ7q4i1xDejZHgiiFB9fKdD7MMk4PzKrZOjPdeS70nzw4kHnRL6m1p6QN7ikB9Fsli3n9M81pa7RYlrmO85hucMFK51Jr8LRKz+An9OBisrhPELuKRRiaO20aXN1Sd+sgvGY1R31wNoHoAa0M6D3AqCcDSHnHWffe1fZK7nIBhM2OgL8c2x/1GDJrgCSKctShBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2XQsAwenDUBpH4RUBEG+YIRhYhM5ZS9gFhUlag3Wno=;
 b=L6aCKpGC/L3OXvJDr9uFIAnSx7gE5YS9GaQPEDibqUOjADSQe3ujYmwFjTS7JjGylFu/xHt6D5c7a5HAj1O6Ts1dLaxh/M1cXEaEXpxVo7mNJQ+HyRoYADHpI7vmkAVHSQyMiFGB06R5fsIQfmBKMgkKiWRK+wMVF2HlZj9DqXDBsEf+p6QtPSPA3kpftf8bERP9Hk/DImIx1T8BA9zd+WzOsVuS5da9cNeXORwlJlR8WvB/O2B9SwoqeFgZuOAR7R0ht4KhKI2eFoDfk99ISJu/3kdk4Y4Ifx40XrF9US7R0g55FABl2hYIHZbAJlXe2oBpwDuufM2Y5LwDdY3uXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2XQsAwenDUBpH4RUBEG+YIRhYhM5ZS9gFhUlag3Wno=;
 b=fKP8InIzV7Quo8T0Q5KyUvGd/QlkhpwUhAZiitSIN63GfiJrtUPUt+BgZX3X6y6tBmXjQcBKsNTtbunJ7Ab4KTuAacDoSg3jpiRrRXPdahQo/FYLZYd47aReGZBgHPjGWjOj6DG1sRQqD4GTfPGZDNDI8By4WRXvnlQ4+fz8nCM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <7021af49-a409-46c1-993b-4ddd7975564d@amd.com>
Date: Mon, 9 Sep 2024 11:29:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] xen/arm: mpu: Define Xen start address for MPU
 systems
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Jiamei . Xie" <jiamei.xie@arm.com>
References: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
 <20240823163127.3443404-3-ayan.kumar.halder@amd.com>
 <efc024ad-1e1c-45d0-9511-cc0c082dfef7@xen.org>
 <c0de7e6c-43d0-46ec-8cf7-ba1855caac82@amd.com>
 <c375468f-fc1d-42d2-91bb-7878f0300c55@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <c375468f-fc1d-42d2-91bb-7878f0300c55@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2P250CA0005.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::10) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SJ2PR12MB8181:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a9a277c-ebf6-416d-58c0-08dcd0ba4df1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZnZQTjBGVU9XY3YrVnF6V2t4K3VaZ0pZcnFOVlNpeEpVcGJuUXY1U3dBN2ZK?=
 =?utf-8?B?b2gyK1lnQXVQdlpMZHp4Rk16b1FYSkdmR3psM2UzMFplNjJXVXZabnhaNmFu?=
 =?utf-8?B?ZHJoM2JPNXlFWWRiaGh0N1FKSEFnK005QUdFck1NWnVXa0xUUGpVV1l4TXhS?=
 =?utf-8?B?RnRNZWJtNGJxcjJKaW1Wb09rTTcxSy9FT0ExS0xpMWQ2RFBzUFdxYUtDelRr?=
 =?utf-8?B?YnBydGxtcElWc09JbWFZYnJjYnlVc3I0Q1ZCSUZ0RHd4Y2d0RWw1Q2I1WUhp?=
 =?utf-8?B?bjNwRFNtL2p2MTA4VjVjRHNJWXM5MUJmMDV5L3J0MmprVS9zMXAyc2J5NTVq?=
 =?utf-8?B?Q2tiTFpqejF4Y29VRDB3Q2h5STE3Zm5haVVUTXFxeWs1UjdQRGpZZTd2RmVP?=
 =?utf-8?B?OHV3MVlDQmFCcEIwV09hS1g3dTEvelJIbkFTeURLQ3V6bnRVZnE4ajFjRzFq?=
 =?utf-8?B?eE13M244OWVyaE1RZG1tNTkzNlhsb2VWdGpYLzU5bUZYbHRxN1h2RWx4Y0pD?=
 =?utf-8?B?aXFMbDVJL2Zpcy9MR0psUkVhbDdpVFVpSDhvSmhDUmwvaHdJQ0tiTXZHZmV3?=
 =?utf-8?B?TVc4cG5OWDZidkw5Y1p1ZkNiNmRlcHFjcWdhZTZSaGVHanNaN0Nod0NTa0RO?=
 =?utf-8?B?amRiUTYrR1lYbUxUU1dzcE1QMitQU3NMYithRGwrUE5sZDY1SysycWtaU0Uw?=
 =?utf-8?B?Mm9NQTJkRnNjaGY0MVUyWTN1Z3VBc0pWYzliZnpjUitHMGlvVlRVRjNrbVh4?=
 =?utf-8?B?S2VkMXNTeWNUUG56YkVEbm9yUUhIZHhwSnZ0a09zYUxIbUw5S2grMUQvcUl2?=
 =?utf-8?B?aTBGenI1RjJNc0JLQm91NkMyYVpUUWxZOU5FL3hxSGswNVJlOVNvbGxCOGNP?=
 =?utf-8?B?OUZvU2JWd3paT1NwV2p5UGswK2RoYzVKZkVnYnBPRFRPM1ZqaWxDK2tYN2ZN?=
 =?utf-8?B?U2NmM0k2MWRqc3dWeU14Y0txem5GRDhRNGxvL1FUMGptcDFqcStvL3IwSTZU?=
 =?utf-8?B?dC9ZNlRMa2Z5aTB6cDlLamI3aUhvTnlPYmgzaUVOWUY0NnNLSWRXbHVrbjk5?=
 =?utf-8?B?M1RIZ1BwdHlZVGxvd0RVSzJUQk1zTmZUMThKZmYybzBCZEZmRW5IYlR4N2JM?=
 =?utf-8?B?dU9MRExpTkpabXI0amgwWFJ5Smw2SHJ2NUVTRUFmRGdOeUtZaFJ1bUFUVk5t?=
 =?utf-8?B?MTgvVWlRQW94aTFiZlFkOHBQeHpCMW10NlFKbVZ5NkFGNS9Db0VXUGh4elVY?=
 =?utf-8?B?eEVqL3AxRDI1L2toRnRQTjZ0UE9GaG1aSWFBWXkwRXE0TklyNXZnSk9UUnl0?=
 =?utf-8?B?YWpsdlAyVlQzNnN4RWVUVjZiVzV1Vi8yNXdvallKSXVtZit5a0tqL09CWXpa?=
 =?utf-8?B?c0VEcXZicnVTYlo0Syt1dXJhRTFJMHdvMFFRNlZlUytTUW4wQStvbGcwTDdF?=
 =?utf-8?B?R2k2RzRGdHpPVEp3dG54NkFGN08vbXBNZ0lvLzJCOUJsb1RLRXMvbVFMQkZj?=
 =?utf-8?B?ckk1cXMvUVd0VUMyMGo1VDQ4Rzh4d1p3M01La2hHQjYwcGptRDdEM1FSeGpT?=
 =?utf-8?B?R0FlNXEyUzc0OE10aGl6ZTBEVDk0dTFjVWlWNU1zK2QwUXlKSVYyRThvdU9v?=
 =?utf-8?B?OUxOU2JsdDAzRFJyZDVyRDJQa21UQTB2cEZjcUlmVFRKZWh0S3ppTUFPSVpR?=
 =?utf-8?B?dU1PYkhmTXVFOTdiSG1XOG1pWTZTK1BXQnhFS0UwbjdubXkybnNVaER6RHMv?=
 =?utf-8?B?KzQ5d1RraDJwdU5LVDlycmZ6RGIraVBUMjNLRktLN3hGaFIySjcyL2FPTE52?=
 =?utf-8?B?cHRYZHozaEVtYWJ0TThHUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzI3V1g1aExETHROclhQbkpQZS9OVG9PV0l4YTF0UHBaZjRsbGZZMTlVdVY2?=
 =?utf-8?B?MTA4L0ZkaGJnc0hhc0dHYzh1YTRWRHIzSUF6Q25rdEp5K2ZQRVkwQmFidWdk?=
 =?utf-8?B?eEhDK2RvRVhhWVNhMy9Dem1reDc3YzlESVQ0em5hcVg4OHRGNzBxZVhSVy8x?=
 =?utf-8?B?ZDVnMXllNjBVMWRZcW1TdzFKQThvbEdrQzlhR0FrYkEvYXhLNFNRTXlIcC9W?=
 =?utf-8?B?clhla28wek5VTmZwbm5uNlcvdlo2Ym0xNUx0OE4zcjhlYXBab2E1aFpvRVpY?=
 =?utf-8?B?cFFweWNsUW9BdmJmbzNLR1V4blNSU0JpZS9peTkyWS9icW8vN2RON1VidUJq?=
 =?utf-8?B?SjRPdk92KzJTL3RMZUcveWQwY1kxVlNnM0lrR2JYN2dyQTFTR3dnbW1icG9N?=
 =?utf-8?B?NHA0dkhtaEVNaDV6VWNGUWtnaHc5QTk3SEZLS2VINmlIdzBNWDdES0g0Nzl4?=
 =?utf-8?B?VGxGS3UvVW55UWdZcGl6WTUyZ1RxMi9nZmNTNzUrS3phV0hUZnZPR05MUnVm?=
 =?utf-8?B?dHFIOGR1bXkwMDBvOVpSUzBncWFPSjhaRUFkNUxIRFBmZ21KZ3ZES2Jta293?=
 =?utf-8?B?VXp0S2hlUWZRV3o4dzF0TVZtNXRWbDJ4WmlPa0o1YTgrV0ZzNFZRWlVySlZi?=
 =?utf-8?B?ZEZwd2o1cHVZbnpBZm85bkxEdjVPRmRvZ3YycU9CRUVmazE5aDQvUUxrRFBm?=
 =?utf-8?B?ZTBtU1Vza1BzUTcyK0hXR3FWS3g4bGdvbWl3TTZlU2dsNHJrOCtwYk81dzdn?=
 =?utf-8?B?bGNjZVVmWlJKSUJzOVp5UmsrWGNtcitlc2pmbWJUQVh5ZkQ3WFlUdEFzU2VC?=
 =?utf-8?B?dXhWdjdacU9PVzYyY204ZjZodkJ2eWUzRGJOcFBSL2NaWkp0NEVRZCt5UXF6?=
 =?utf-8?B?aUMzNTMrcmdMZXk0RUZJZklzdHZ5MldmNHNKUWFSTkpDTDdGYktndkRHak5W?=
 =?utf-8?B?MXBUVDI0ZU14VDNlblNELzRRVEZXcTFTa045SXJoR1gzWkJVazhjQmZlWEFi?=
 =?utf-8?B?NTl4OUJJVkIxRGtuMFFTODJKQ3d6OE1NamhZcUFNb0FzdTFrcnBGaGxKSm95?=
 =?utf-8?B?VFdrNnhEZk1aSlZlOUVXbjdtUllkRGYzUEl3OExldDhBU1pENkVsekVEbTRh?=
 =?utf-8?B?UmpicUJPTGJkUytDR2YxZHhCWDUrYlFYZ3FDVXhmcEFVdkdCOFdOZUlQZmRN?=
 =?utf-8?B?RDJTb0lMZVk3Ynp3azRHelJCN1MvWUY4OHQ5THlGaTUvYkRVZWlvVjVpQlU1?=
 =?utf-8?B?V2xIWnNJQlBFd01mQWkxNmI1VUFENC8rRkNKbDAwL1pBNnlpTlBrUWpuNm0y?=
 =?utf-8?B?aC9yZ2x5aENOWnExekRnd3p5ZGlhWTgrOWF5dFQwUlFiTjY2bkdxckRqazda?=
 =?utf-8?B?YVp0Z2JsUjhjY0dTM0tndk5lMk9vUmd5UGdsbGRaNFFkSGRSdzdhMzJ6dUIr?=
 =?utf-8?B?YXgwRlFiYWRYVGVqSExENlB6cnFkdW1tbWc5NDZrVGxtSmdXM1FzV0xBVE90?=
 =?utf-8?B?dlQ1MlMvdXMwejR6SS9vWFI4NktLaUNRMldiRGZKdm9VL3hBMkV6Z1I4V2JP?=
 =?utf-8?B?VlJmTWsyK0FlclVlTmlPRUE5dmphVSthZWZsTUJzQlFOcWNpZ2U1alBaMW1Q?=
 =?utf-8?B?eHpGV1Njb2QvSEVMK3FzcFYyckprQ0VSVTlxY3VtNU5UOGdpZXlxRGJlZEc0?=
 =?utf-8?B?a0pFQzZjaktHM1A4QStuTW82MmRzeEVvOWhEQUlSVXJSRmcxTGZpZnAwSVRI?=
 =?utf-8?B?YWVZbEpkbk9mOUlJSkE2Z1FkZXAzN1FhaG5wV3lHVHZCeVFmZCt4MVFsd1Yz?=
 =?utf-8?B?WGtsU3dhM1Q0ZzlGNjl2N24rZThHV0YvMlgyTk1qc1FzcTE5ZlJHaHdEVTZm?=
 =?utf-8?B?YXVXWFNEaFo2bjFsRUZoWC93V2pYdm9UTHRZRGZQbG02QXBvRFpxNTJVbE1Z?=
 =?utf-8?B?V2c1S2FNRUw5SEdveWpySWl6ZGVreEwvT3A4L3d4bEJXQ013K1VRWHcyVmFy?=
 =?utf-8?B?c0NDRUdEWlhUbmVnampLeTJwSUdLWFdZY2k2cEZlTlBvYlRJL3V6cHEzWE9F?=
 =?utf-8?B?a1JZMlk1cVl3VmxsNTBTbzIzMG03OERrNXZxRmJEbmk1VzdxVGg0bFdrNHFv?=
 =?utf-8?Q?5GFiBdmdcmPrjbrjNcAFVQe6n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a9a277c-ebf6-416d-58c0-08dcd0ba4df1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 10:29:37.2396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9QKs18J6bttHgK/7lrGYHmoBZVquDVk3XmVlCfX4dhntQXZgZ0FEDmdw69ISIVtG6iCFo6bpQESZr8/Qgz5s/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8181


On 08/09/2024 22:13, Julien Grall wrote:
> Hi,
Hi Julien,
>
> On 02/09/2024 15:48, Ayan Kumar Halder wrote:

>> I will rephrase this as ...
>>
>> "Used to set customized address at which which Xen will be linked
>>
>> on MPU systems. This address must be aligned to a page size.
>> 0xFFFFFFFF is used as the default value to indicate that user hasn't
>> customized this address."
>
> Reading this comment, I would like to ask some clarification. In the 
> context of the MPU how do you define a page size? The definition is 
> pretty clear when using the MMU because the granularity if defined by 
> the HW. But for the MPU, it is a bit blur. Is it still 4KB? If so, is 
> it actually realistic (we don't have that many MPU regions)?

 From ARM DDI 0600A.d ID120821, C1.1.1 Protection regions

"Protection regions have a minimum size of 64 bytes."

Thus, I would infer that the minimum page size (in context of MPU) is 64 
bytes.

Also, if you see the register fields of PRBAR and PRLAR, the lower 6 
bits are 0 extended to provide the address.

So, may be I should say

".... address must be aligned to the minimum region size (ie 64 bytes). 
0xFFFFFFFF is used ...."


Let me know if this sounds ok.

- Ayan


