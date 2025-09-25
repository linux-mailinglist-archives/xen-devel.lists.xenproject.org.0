Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E75B5B9ED6A
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 12:59:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130405.1469984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1jgp-0000Ab-GL; Thu, 25 Sep 2025 10:59:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130405.1469984; Thu, 25 Sep 2025 10:59:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1jgp-00007s-D6; Thu, 25 Sep 2025 10:59:07 +0000
Received: by outflank-mailman (input) for mailman id 1130405;
 Thu, 25 Sep 2025 10:59:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jamk=4E=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v1jgo-00007m-8r
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 10:59:06 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a41216ac-99fe-11f0-9809-7dc792cee155;
 Thu, 25 Sep 2025 12:59:00 +0200 (CEST)
Received: from PAVPR03MB8921.eurprd03.prod.outlook.com (2603:10a6:102:322::9)
 by PR3PR03MB6410.eurprd03.prod.outlook.com (2603:10a6:102:7c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 10:58:58 +0000
Received: from PAVPR03MB8921.eurprd03.prod.outlook.com
 ([fe80::1fbe:d673:80a7:6ebd]) by PAVPR03MB8921.eurprd03.prod.outlook.com
 ([fe80::1fbe:d673:80a7:6ebd%5]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 10:58:58 +0000
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
X-Inumbo-ID: a41216ac-99fe-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rLp+runs/gsYFEWsb1gw7aBQ22VZ3JsrMbLL9V6SGL/LhVUJScH15mNizXq9wN4Bf2cjYlqdnPp+mLPjg1reFf1umk6ezilHVDK3sqsRTB2cZWIacePyHKkYtTGUmbiqzXqJcTw/3pyhatKPwziBjpLyWHtfSlvuRR3/XidsOL5XMBzDp1R51YH9regIDHJ8jfR41TJBgARJ9aYXtrLy1LWM+8Tb9Xx1Z8EqESc8lOeG6RCWCvU66oHdaxfJ+fSN1JCrPxq1H74AibQsd/9IUhfjYD2YR+90y7fulOnvFoimlIoo790pM7frgsSUKLRzgfZoMTLGGOj9w/oBjSQ4Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xp+sKjvwtCRLj0REPVNn5U0LAcgr2vdjnzREMqTFThI=;
 b=x3pHqxjVfQjcb4majXX5QpG8160jgckWkGDUQ+1DlRsV66TC/oi9paePD45FyIJ/YFi1UJpaaS+GfAFaBK/I/q/8iu2k1Spu6eq7tRHwte4eJyOhwyT+B2f1lTfY4cGg3iiUcdqKUZcB/nEeZUsTtgx9oM+F5fBrCEI78JPpeeG/ph7HNE4rJNQpvr/XmReXBOXNjU2cMr80HT8E8gVi3+MOq+8Lvswv+biSPxS/ocETj0AsfngDxsv4zwDy1gLdJiIhgbf6FJExEg4MOVIYEeIoDe+yXtbQmBaxCr7+sI8umjsT3leD57c0xfLJeU3c72beyD9sC/zioE1edEneEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xp+sKjvwtCRLj0REPVNn5U0LAcgr2vdjnzREMqTFThI=;
 b=t6LBcWym/vXRIQRT3AP0hQ4TY7q3TGR+Xxg7uFakW86U26EjOZPZ2kuCluaN46nnmqho+EQPL9O0rQTk+aoUKEqbyK+EzFRPjGwTrTPuEMheo/Ivwj7jrPloWxZOT5O5M2VWlndYuRH2LZK5+IMStI17hhMGWjjoiuzG6Yy4WketPe+Ihs6mzAqt4fDNJD3u+bXdOO5lZXwG7sa0OY9rV2zliA15ULxH+/F3F9uSdQ1aJf2vifMzgh2lEKo149LoqpsjuDkKQYlzEUYJ+cz9jjhhEq8iWIjvOnfh5s24d5euwVaqkDVc2SK3wXAchDpyLb0ra0l0wWSAw5WL6JmNGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <9e6a8f9e-977e-43b1-b1f9-182b28512445@epam.com>
Date: Thu, 25 Sep 2025 13:58:56 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/arm, xen/common: Add Kconfig option to control
 Dom0 boot
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Alejandro.GarciaVallejo@amd.com" <Alejandro.GarciaVallejo@amd.com>,
 Jason Andryuk <Jason.Andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <34e1b5036361745db2fde233e0935a568c0ebc90.1758729618.git.oleksii_moisieiev@epam.com>
 <2954ab89-cf30-4b00-87c5-37449a571fdd@epam.com>
 <2475e7ad-e9da-491c-80b3-dd39b81d7c1c@epam.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <2475e7ad-e9da-491c-80b3-dd39b81d7c1c@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0384.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::18) To PAVPR03MB8921.eurprd03.prod.outlook.com
 (2603:10a6:102:322::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAVPR03MB8921:EE_|PR3PR03MB6410:EE_
X-MS-Office365-Filtering-Correlation-Id: 137eb653-ae20-46d0-e9c3-08ddfc2286ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MTU3T0FFa0lGRC9VNVFUZUZPMmN1SVlWeHArZFhNQjVtYWNsc1RhZ1k1MzBZ?=
 =?utf-8?B?QTdIM3pJVEI5enZETkVETDZLNng4RlZlMkd0SDk3dXhicFlncmE0N3FlSGpW?=
 =?utf-8?B?NVp0ZUx1ZmZEQlJyOGJkWm5rVXlnWDFVQUpobCtkbisxVTNpM3UvLytxWTJp?=
 =?utf-8?B?azVYYmdXejR4VWtNY243Q2MyWFFxNU4xeVB0UW4xRk9pdFpENWMveE1MRXNu?=
 =?utf-8?B?b3o2Q3dGdXR0VDRpR2NnaDBWbGY1b0pZUWpxY2V2elZFWUdFd0R0T2ljTEVu?=
 =?utf-8?B?VURSTzZkcFpDMmVyTmhQVHBONFdESytEMVpFRVBvN0RvK1dyTE1SbXh5V2ZR?=
 =?utf-8?B?OWdJODBIZ1F6b1dxeEhuVzR4M2dhS3RnWk5WeEJaSlQ2cFBxekF4UEd2NWps?=
 =?utf-8?B?Q0t2cW9iMzFXQXFGdmora1pFZFVOczVDK3BtTno2MnlxWnNCVzN1THBvRG9r?=
 =?utf-8?B?LzkxLzFJd3VXWVdxK3poaWhtTlFnQmNGSStncW1obkY4M0dYL2dySituOHNu?=
 =?utf-8?B?Y29ybXh5M3Z6M2tqZXhIS2lKTU45RVg5TFU1alQxS3lHbElJWXIrSXZJNGg4?=
 =?utf-8?B?WWtmeGQrT3k1SlQxcTdBckZZTlZkNVE2YU5VK1hlMlUxcDZyVlZ0ckFJVEJu?=
 =?utf-8?B?RS8ydmR3enRQQ1BGNTUzdTY0bjcyU1hiRDMxTkhDZGFXNFZDazJ3czBnS3Ix?=
 =?utf-8?B?ZmgralducWFrYXdqTTNVMlJ1RUNTR2RTY0dkWDdkZzNJaWovN1ZpSzRrT09u?=
 =?utf-8?B?NnZuU1VkREtiVXM0T1NoVCtQb0dBYWoyZFV2WXl4cG9FcXNIVkx0RkJUWkIx?=
 =?utf-8?B?SnRkdU43TEQrbXROcGs0NGlKY0E2cG9MbnJJVG5RLzRrU0hualc1eEorQ2RH?=
 =?utf-8?B?V0VWUnE3MHZGQVk3dkJra2pYdkVyb05KVmk4anBicFcwT0wvWloxeGdQQ1hG?=
 =?utf-8?B?SUxGeSthM2Q1RlQyMzQwTjRrb3h3UlVBN0lUaXRtSGNzYTZpeURuVGFpR2Yr?=
 =?utf-8?B?SkwrKzB3UEVUOHoycHFnSzJvZHM0bkJDWXM5NlF0TldjdGRJeGZsVUpDa0Mr?=
 =?utf-8?B?bHo1a1dmeWpOSksvdkg4L3FYSkVOa2pPVndHeHRiQlFBbGI1Mk1QZUhwMGNF?=
 =?utf-8?B?RFMvMlE4Rzd1RkFzRkI4d1Vmb3QrWHlyTCtiZkloemx3SW1xbVJQc085aTE0?=
 =?utf-8?B?UTEvWDNjQ1FQb1dSN3pLSU1JUndIU0I5K1Z0MWE5OEJ4TkhqaUhoRytXNnh3?=
 =?utf-8?B?QWpCZitwNDFnU1NJa0NqbGUwS0YvK2REYTA2ZXhYUFBuY0xNZkhuMC9sSnBD?=
 =?utf-8?B?NXB3VWVtbkJVRnZzOGk1YW5PdnNTM2NqOUtKMmR5c0Y5MXJwbk51ZENYUDdD?=
 =?utf-8?B?aHpWVUN1SDNlaW5aWFB3dGRLNmJiMUUwbjNVczN2NDRscUpZT3RtaXRybEVY?=
 =?utf-8?B?a094U2REU0o4bk90eUp0WVdoZ2I1cndhM0NxN054clVGRTEvNnFkdkloMTdH?=
 =?utf-8?B?S2p1TEVPSUpELzkweDFxeEhFTjh0ZXBRYlFGNHQxVnJlY2JlNnVTbHpZeHds?=
 =?utf-8?B?dlVVd0hWS3R1NmoxVU50R21ENTV5N1U5T3VoTWtrS3JSaXhnNkJQU29KTGtZ?=
 =?utf-8?B?QnkrNDh2WnVQOEpzakhpZjl6R2tUamprVGVVbE1XdVBmclZPdGo0a1lMb09q?=
 =?utf-8?B?VHFjdDhUQzI3Wlo0dUEycC9wdVAwWDBGZ1Z3U2NpMEdOdTcvWWlzYmdOSjZ5?=
 =?utf-8?B?KzdYSTR2bDNJTTlQakhRYlVCR0JLU2hIcTl6OXJLajUzYlN6TlZzODU5c2dD?=
 =?utf-8?B?Szhvcmo1SlFHdVhPQ0I5WGxSWGJ4QW5OdkZlZ0xlbGowS3VnTCs3V0lRdGVC?=
 =?utf-8?B?ZjFRNklwSDdEdDBlcDcvTDlJcTNtYlFpaVhaSDBnZXBxRUlPaExhbmtReUdT?=
 =?utf-8?Q?ENuHE+Z4LOaLU6t1AKXD7tHBIWok7DqF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8921.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjFodysrRW1QR0MvOTJuRUZDSjN4ejNiMG9rN1B2Y09MYldBU2VJTnYrT2h6?=
 =?utf-8?B?RjVka3BHQ1JwRnlKZmUwSnpyZkxBaURDcGpCNXF3RHIwendwZWc5MUZoRDJ5?=
 =?utf-8?B?QlVTOENtaEU2NUpKZEIzNkpZT21MYkpUUkRJM3JrelBMNE43Y3lydDZIK0ty?=
 =?utf-8?B?MnB4QXFXNXRCbXlWckpYaHo1b2lnVVBoNER2Sk5OWU9SSEgrMEdJK2NxQkM3?=
 =?utf-8?B?eTBzTmlMcDE1eHlDazVzUGhpYjlFZWtRcnFGWmhqNFIwU0lWclltRnFIQ2NP?=
 =?utf-8?B?ZHpXTWJxU3d1aitzSHA2eVdXLzFGekozemtwSVIwaktUUms0eDRHT0U2aVNM?=
 =?utf-8?B?cmQrcnRoeFoxclEyVTJnMXE0UGt6QmV1Y3ZVTzk5S1d3eXV0ZWpScVpBd0pB?=
 =?utf-8?B?aUE4aVVLREgwL3dDSTJ2blhLMElBRC91N3FFYTM0Z0c3Mm9DRm9PdEdyaG1T?=
 =?utf-8?B?T2t6NE0raWIwdXhrUXMyaXZXVXp6ZFlsUUViTjB3R0tIWWJFd2x5S21oeDVs?=
 =?utf-8?B?ZUhINFpIVW53d0JYTDdmVXAvOGFPYnFwOTgvbVNnY2MzNnhyd1RRVk5pZHYv?=
 =?utf-8?B?eEQwZVFiUUJNQUtxM1p3SGhLTzN6NFFRWEl0RkkwZHVWYndMUCtoYVNIYlpS?=
 =?utf-8?B?NXRVMEl6b1c3bWtaTjZ4TWRpM2pRbEcxa2htcFR6RHJZNXAveGlldWlZVFpK?=
 =?utf-8?B?SEMreEdrR0YxVTRwdmtnU2FwQ1pNNnpQU3lUeVF4S2U2Z2NaWFNOc2MzMnlP?=
 =?utf-8?B?VWVYVVprZVVvVTVTL2NTWTNmRkdyTVFpcnZ3NzQyUHh0RWEwelcrQk1ONWtQ?=
 =?utf-8?B?ODh2RVBWTmVERkF6QytoeWFCVGVpbklOQjloUVFYS1FMQjhqODJOZkNzWUsy?=
 =?utf-8?B?SEpuaHZFeUVxbnduem1xeEtFZUlybXNDY1hZTmE5cyttTG1CeTllWnpxVkRH?=
 =?utf-8?B?ZU9EVjhDTk5SSWlVS0xkRlVGVUdhcTBaWk5RWjYyYXJ3VjV4Q21xbkhVYzVU?=
 =?utf-8?B?dkdOcFJGcXhpaGYrUmZDUnpxUis4K1VLOVdjaURIaFBWaTBvVlF3VXlaMDFF?=
 =?utf-8?B?cGpaRzFqdHhmKzVuMlFrRkwrZC9vU2NGaEprQW1Pc0xKNVZsdmxIeFBweVY5?=
 =?utf-8?B?WjZsWEZJOWxnUlZUVVJraUxpbzdveW5ocnNPd2dYOHdyTjFwSEJKQjNTb1Zm?=
 =?utf-8?B?NTBUL0MrOUtOU1BXbC9uQkIvQUlzR1Yya3NDbmkwN0IzN1ZUN3NzVFlGNmRJ?=
 =?utf-8?B?RlBuRUQ0NTBoQ3pSNGs3eTd3U3RRWkpVcmZ2emtGTHVXVGQ2T1UrangzeUlC?=
 =?utf-8?B?VzJybWNRS1ptWEZ1eERBRVZTTzludWJVbnAxTlBsY0J2TUpSaWZYOWNRUHBz?=
 =?utf-8?B?TUF0WXpzcXNLTTF0MWJ1Wm11YmpCbzN1TlpkdWtnaS9wNDlQTUlrdHhIclZs?=
 =?utf-8?B?RTg5dnhFT09ieXFlM3pTRjRXS0tOZ1dDVFBwWGdvR2kzKzUyQlozd3o0Vmh0?=
 =?utf-8?B?TEJXMlBPYUhvTEJBTXBzYVJ5SjVGcWxYZjhyTXdXZGJkRnZ3c0x0ZmhFRzd0?=
 =?utf-8?B?SlJkYVBUWFo4SmxweWlxZzdFY2lEcytQeER4UkpNZmlmN0drL3JubFR0eVgw?=
 =?utf-8?B?RGV1WlhYdi83eVZ4WDF3cVFFQ1pwaW4vQkNmNXZWNGZKMUNxZm41cUN1Vyt4?=
 =?utf-8?B?OFdRYnZRMGUxV1I2bVFoL1dYdVkzTzl1ckdmdW1XTjFXVVNNQnR4djI4MXVG?=
 =?utf-8?B?bDFVYjdpWUxZejNMTm9qV0dDUDlER3hhRWlpays4aGFFSHdybi8xWHJ0QVNu?=
 =?utf-8?B?TG9Xd0I0cjRQRS9GQ2xENEcxb29LOWFsNmp1NFlINlNraTZXTWRxRGk2c3Bz?=
 =?utf-8?B?QlZJQ0pqejdTUUJTRDV6b0FRUnNMV1lUR2VrM2ozVzBMOG1zYUFsV2h6cmVL?=
 =?utf-8?B?QXg0bS9RYnFnNkpPc214eTc4L2w3amdxTWw5dWhicm00V08rblBITDZHNlR1?=
 =?utf-8?B?cWtlZitrTHRrZU5JTEpUNXN3Q3NqK0ZxSmdUT3BJYUI1QWRNS21kVnhlVkZ3?=
 =?utf-8?B?bENwbHpWRVN6TnljaTVhN2EzRFpTQy9JOGZCTllScjFDQUo5SHhDNkkrL3Zu?=
 =?utf-8?B?Yk1RV3E5dUgyZTcyY1hyS2VoYk1DMUd6WVphaFFsbEg3UHg5dmdKWWExdkxC?=
 =?utf-8?B?N0E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 137eb653-ae20-46d0-e9c3-08ddfc2286ee
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8921.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 10:58:58.2247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CoUcz4DO+/uhAGgsRL7V2u87mAcRXGkZq1hY182XY+IjkijAcEAnh5EPLLHqcd5juDDrnXLZsa09ZcsiXcIkKpNHWjj7qtiUl2ppaA13OCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6410



On 25.09.25 13:53, Oleksii Moisieiev wrote:
> 
> 
> On 25/09/2025 12:22, Grygorii Strashko wrote:
>>
>>
>> On 24.09.25 19:00, Oleksii Moisieiev wrote:
>>> This commit introduces a new Kconfig option, `CONFIG_DOM0_BOOT`, to
>>> allow for building Xen without support for booting a regular domain
>>> (Dom0).
>>> This functionality is primarily intended for the ARM architecture.
>>>
>>> A new Kconfig symbol, `HAS_DOM0`, has been added and is selected by
>>> default for ARM and X86 architecture. This symbol signifies that an
>>> architecture has the capability to support a Dom0.
>>>
>>> The `DOM0_BOOT` option depends on `HAS_DOM0` and defaults to 'y'. For
>>> expert users, this option can be disabled (`CONFIG_EXPERT=y` and no
>>> `CONFIG_DOM0_BOOT` in the config), which will compile out the Dom0
>>> creation code on ARM. This is useful for embedded or dom0less-only
>>> scenarios to reduce binary size and complexity.
>>>
>>> The ARM boot path has been updated to panic if it detects a non-dom0less
>>> configuration while `CONFIG_DOM0_BOOT` is disabled, preventing an
>>> invalid
>>> boot.
>>>
>>> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>>>
>>> ---
>>>
>>> Changes in v3:
>>> - rephrase error message when dom0less mode wasn't detected while dom0
>>> is disabled.
>>> - rephrase help message for DOM0_BOOT config option
>>> - update DOM0_BOOT dependencies for X86
>>>
>>> Changes in v2:
>>> - decided not to rename HAS_DOM0 (HAS_OPTIONAL_DOM0 was another option
>>> suggested in ML) because in this case HAS_DOM0LESS should be renamed
>>> either.
>>> - fix order of HAS_DOM0 config parameter
>>> - add HAS_DOM0 option to x86 architecture.
>>>
>>> CONFIG_DOM0_BOOT Kconfig option was introduced to make the Dom0
>>> regular (legacy) domain an optional feature that can be compiled out
>>> from the Xen hypervisor build.
>>>
>>> The primary motivation for this change is to enhance modularity and
>>> produce a cleaner, more specialized hypervisor binary when a control
>>> domain is not needed. In many embedded or dedicated systems, Xen is
>>> used in a "dom0less" configuration where guests are pre-configured and
>>> launched directly by the hypervisor. In these scenarios, the entire
>>> subsystem for booting and managing Dom0 is unnecessary.
>>>
>>> This approach aligns with software quality standards like MISRA C,
>>> which advocate for the removal of unreachable or unnecessary code to
>>> improve safety and maintainability. Specifically, this change helps
>>> adhere to:
>>>
>>> MISRA C:2012, Rule 2.2: "There shall be no dead code"
>>>
>>> In a build configured for a dom0less environment, the code responsible
>>> for creating Dom0 would be considered "dead code" as it would never be
>>> executed. By using the preprocessor to remove it before compilation,
>>> we ensure that the final executable is free from this unreachable
>>> code. This simplifies static analysis, reduces the attack surface,
>>> and makes the codebase easier to verify, which is critical for
>>> systems requiring high levels of safety and security.
>>>
>>> ---
>>>    xen/arch/arm/Kconfig        |  1 +
>>>    xen/arch/arm/domain_build.c |  8 ++++++++
>>>    xen/arch/arm/setup.c        | 14 ++++++++++----
>>>    xen/arch/x86/Kconfig        |  1 +
>>>    xen/common/Kconfig          | 11 +++++++++++
>>>    5 files changed, 31 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index cf6af68299..336b2ed242 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -17,6 +17,7 @@ config ARM
>>>        select GENERIC_UART_INIT
>>>        select HAS_ALTERNATIVE if HAS_VMAP
>>>        select HAS_DEVICE_TREE_DISCOVERY
>>> +    select HAS_DOM0
>>
>> Here HAS_DOM0 is selected and all dependencies also selected (
>> HAS_DEVICE_TREE_DISCOVERY, DOMAIN_BUILD_HELPERS)
>>
>>>        select HAS_DOM0LESS
>>>        select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
>>>        select HAS_STACK_PROTECTOR
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index fb8fbb1650..62602afc78 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -42,8 +42,10 @@
>>>    #include <asm/grant_table.h>
>>>    #include <xen/serial.h>
>>>    +#ifdef CONFIG_DOM0_BOOT
>>>    static unsigned int __initdata opt_dom0_max_vcpus;
>>>    integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
>>> +#endif
>>>      /*
>>>     * If true, the extended regions support is enabled for dom0 and
>>> @@ -104,6 +106,7 @@ int __init parse_arch_dom0_param(const char *s,
>>> const char *e)
>>>     */
>>>    #define DOM0_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry))
>>>    +#ifdef CONFIG_DOM0_BOOT
>>>    unsigned int __init dom0_max_vcpus(void)
>>>    {
>>>        if ( opt_dom0_max_vcpus == 0 )
>>> @@ -116,6 +119,7 @@ unsigned int __init dom0_max_vcpus(void)
>>>          return opt_dom0_max_vcpus;
>>>    }
>>> +#endif
>>>      /*
>>>     * Insert the given pages into a memory bank, banks are ordered by
>>> address.
>>> @@ -1962,6 +1966,7 @@ int __init construct_domain(struct domain *d,
>>> struct kernel_info *kinfo)
>>>        return 0;
>>>    }
>>>    +#ifdef CONFIG_DOM0_BOOT
>>>    static int __init construct_dom0(struct domain *d)
>>>    {
>>>        struct kernel_info kinfo = KERNEL_INFO_INIT;
>>> @@ -1993,6 +1998,7 @@ static int __init construct_dom0(struct domain *d)
>>>          return construct_hwdom(&kinfo, NULL);
>>>    }
>>> +#endif
>>>      int __init construct_hwdom(struct kernel_info *kinfo,
>>>                               const struct dt_device_node *node)
>>> @@ -2046,6 +2052,7 @@ int __init construct_hwdom(struct kernel_info
>>> *kinfo,
>>>        return construct_domain(d, kinfo);
>>>    }
>>>    +#ifdef CONFIG_DOM0_BOOT
>>>    void __init create_dom0(void)
>>>    {
>>>        struct domain *dom0;
>>> @@ -2103,6 +2110,7 @@ void __init create_dom0(void)
>>>          set_xs_domain(dom0);
>>>    }
>>> +#endif /* CONFIG_DOM0_BOOT */
>>>      /*
>>>     * Local variables:
>>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>>> index 7ad870e382..fbb290df60 100644
>>> --- a/xen/arch/arm/setup.c
>>> +++ b/xen/arch/arm/setup.c
>>> @@ -481,12 +481,18 @@ void asmlinkage __init noreturn
>>> start_xen(unsigned long fdt_paddr)
>>>        enable_errata_workarounds();
>>>        enable_cpu_features();
>>>    -    /* Create initial domain 0. */
>>> -    if ( !is_dom0less_mode() )
>>> +    if ( IS_ENABLED(CONFIG_DOM0_BOOT) && !is_dom0less_mode() )
>>> +    {
>>> +        /* Create initial domain 0. */
>>>            create_dom0();
>>> +    }
>>>        else
>>> -        printk(XENLOG_INFO "Xen dom0less mode detected\n");
>>> -
>>> +    {
>>> +        if ( is_dom0less_mode())
>>> +            printk(XENLOG_INFO "Xen dom0less mode detected\n");
>>> +        else
>>> +            panic("Neither dom0 nor dom0less mode was detected,
>>> aborting\n");
>>> +    }
>>>        if ( acpi_disabled )
>>>        {
>>>            create_domUs();
>>> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
>>> index 3f0f3a0f3a..2aeb361c63 100644
>>> --- a/xen/arch/x86/Kconfig
>>> +++ b/xen/arch/x86/Kconfig
>>> @@ -18,6 +18,7 @@ config X86
>>>        select HAS_COMPAT
>>>        select HAS_CPUFREQ
>>>        select HAS_DIT
>>> +    select HAS_DOM0
>>>        select HAS_EHCI
>>>        select HAS_EX_TABLE
>>>        select HAS_FAST_MULTIPLY
>>> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
>>> index 76f9ce705f..10a8fc8718 100644
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -26,6 +26,14 @@ config DOM0LESS_BOOT
>>>          Xen boot without the need of a control domain (Dom0), which
>>> could be
>>>          present anyway.
>>>    +config DOM0_BOOT
>>> +    bool "Dom0 boot support" if EXPERT
>>> +    default y
>>> +    depends on (ARM && HAS_DOM0 && HAS_DEVICE_TREE_DISCOVERY &&
>>> DOMAIN_BUILD_HELPERS) || (X86 && HAS_DOM0)
>>
>> Here you repeat the same dependencies. In general, if you introduce
>> HAS_DOM0,
>> which is expected to be selected by ARCH, then all you need is
>>
>>      depends on HAS_DOM0
>>
>> It's ARCH decision to select HAS_DOM0, or not.
>>
>>> +    help
>>> +      Dom0 boot support enables Xen to boot to the all-powerful
>>> domain (Dom0).
>>> +      If this isn't enabled Xen is expected to boot in dom0less mode
>>> only.
>>
>> "is expected to boot and launching all domains in dom0less/Hyperlaunch
>> mode only."?
>>
> Thanks for the review. Hyperlauch is not merged right now so I don't
> think it's a good idea to introduce new term.
> Agree with other statemets above.

Hyperlauch is partially in "git log --oneline | grep -i hyperl" and hope is to get it in
the next version.

That's, actually, a good reason to have this option in common and not ARM specific.

>>> +
>>>    config DOMAIN_BUILD_HELPERS
>>>        bool
>>>    @@ -125,6 +133,9 @@ config HAS_DEVICE_TREE_DISCOVERY
>>>        bool
>>>        select DEVICE_TREE_PARSE
>>>    +config HAS_DOM0
>>> +    bool
>>> +
>>>    config HAS_DOM0LESS
>>>        bool
>>

-- 
Best regards,
-grygorii


