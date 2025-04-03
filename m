Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCED5A79FD3
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 11:18:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936398.1337657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Gi3-0001Nc-IY; Thu, 03 Apr 2025 09:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936398.1337657; Thu, 03 Apr 2025 09:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Gi3-0001L5-EP; Thu, 03 Apr 2025 09:18:03 +0000
Received: by outflank-mailman (input) for mailman id 936398;
 Thu, 03 Apr 2025 09:18:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t8zK=WV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u0Gi2-0001Kz-RJ
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 09:18:02 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2412::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 881f5e60-106c-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 11:17:59 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by IA1PR12MB9031.namprd12.prod.outlook.com (2603:10b6:208:3f9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 09:17:54 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8534.045; Thu, 3 Apr 2025
 09:17:53 +0000
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
X-Inumbo-ID: 881f5e60-106c-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P77cRVLXdQHRiiVc4ucYaDpPLvxBoWnOdPd01PE1youknQ2gv622EwdhJBvzPZ0mOkU9zxIoR0jrBNEu9yc63YvQuml0+HW//YUe/DQT/7KlL0rHo3DqGYIwzSQuwkgyHlNOM10TilUvmAe5f2u+zxj7DJ3Um4crQJ2BxL6/wbeGIplsuFGPpzyI3hoWHaZNreOCHdAP7h5TceUfdFKcNVBNkt4fwmg12eOBrovZqpGXA5/IG+vRtwIyrdb25JVpWtsKoLElJkWe7foeJMjtt6zDjnLc/JVZlHmkCuZP87YSBgJYAMc8aysaauFvPdPtofsIAqrHy5ZlHClf9t0aRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++bhdMV7NuH9qQaQkI3dgnz84eih/ED+vzvMYKUD00M=;
 b=kf38nnFqMG7mTMt2/+3qhXSfR9PCewoCKOZFVn5+5PNQlKa88q65V4N6hjZMUfNLuJgWvD1EoE4regbI7A2l6TMwAgog4U2tPjwAfGWY2Ebcj+/erD0MMMRn3Oyy9U8raAuikl1nVHgZ19+SH1MF0x9moJCSJF/VVvO3QT0734aBuvTJBewQEfXeELutukXZduol9oKVgfIx5Hv3zY8qe83qlBdmDSgW7ARZiAK2kmUUds9qkfspwpvI34sK0K7FlfI5Kbnx6YIggYrDg2KnQN4aoXcQQdI6UTytsd6DSKeaFc2XoSwCExEHkxnV1Rf7WLwrhwf4O5rV+szBFzRtUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++bhdMV7NuH9qQaQkI3dgnz84eih/ED+vzvMYKUD00M=;
 b=itiu5IOfX3wnVxXgWaONhjDqz/X9Ntp8Q9AsDoYdK1Xz0ZMH5Dlmg+XNus/kY4cESVOBZaSs1q3TuMxC/lZiYxVuedMSEUEsRXh8zJw796Td7F1sw4XCxft0NRHISlwzX2L3PvMaw4a3yyE8iQroOXNpE7gB+jgexyM+HbaQ4Kg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <44500161-1346-4c9e-bcb3-a4301c197913@amd.com>
Date: Thu, 3 Apr 2025 11:17:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] automation: Add Arm64 MPU build job
To: Jan Beulich <jbeulich@suse.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
References: <20250403081916.6834-1-michal.orzel@amd.com>
 <20ac780b-f5ac-4531-997e-362d72adddd2@suse.com>
 <2a8ab261-480f-4bfe-b2b7-7fdff4516078@amd.com>
 <a67d260e-fe1a-44bb-8b49-fa0509716da2@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <a67d260e-fe1a-44bb-8b49-fa0509716da2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::18) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|IA1PR12MB9031:EE_
X-MS-Office365-Filtering-Correlation-Id: c5d9b35c-7bd6-43a6-6244-08dd72906a0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGoxeEd4M0JpVkg4R2VHRXIxcmgyTitpR1BibmxHd2xlaHY4NG1kb0phcE52?=
 =?utf-8?B?ckxwUjFWVGdpU0VxSjVocHArZUlxMC85c1A3bkJiS1c2ZHFGTG5RTDYwbG81?=
 =?utf-8?B?UmRPYlF5TUdDZ3hMcEVPSTNpRVQzSU9Nako0R01BV2Y4aTFBV1dCdXFibXBa?=
 =?utf-8?B?NnFub2JPYTRKQzdpallaa0YzZnhJM2dnQVg3M3JxSExibXMvZ2pNeEZLNzF0?=
 =?utf-8?B?V1ZJMXZFOFFLSzVMNGJ3Nk0yQ1dhRmdOM0c3K0E0cUdKSXBVWjI2bVI3VXpY?=
 =?utf-8?B?Q3k4UFVpU2hLdG5SUlNNS202NGx4MjlVemlBaUdLZVhVRzZGb091TDJlSnJW?=
 =?utf-8?B?dFhhMVBxc1E3RWVQbUJhU0J6M3BDdS9xckRZS0Y0M3lpbTdqZThET0NjM3pO?=
 =?utf-8?B?Qi8wWHZlQU5wL0VKbTlFNUFBdDNkR3lpNmZaOTcxZDViL2tld2ZBd1BmSEZp?=
 =?utf-8?B?UFpJWjRVUWpnd1FjY2dpYys5VmE4N2Jpc0xoM29IUXUrY2drcmMzMldiVU9o?=
 =?utf-8?B?TzB6OW43dmlaemtFQlhmcmU5c3ZtOVpzbEt5OVN4Q0Y4YW9aRVNQemNjdUlS?=
 =?utf-8?B?eHdkZlliMTF0T2U0a1Y2eS94MkFvbUx3S2lEMDdwdUZjNkpjcWxBUXFmNG9q?=
 =?utf-8?B?Y1FjbWs2ZkNwaDNtSmxtU0F2akNqNm9ibzVoaFRQL2xNYTM3empncmtOQmRK?=
 =?utf-8?B?a0tsY0J5cFR6bEd1c3JDU0dhZXl0VWxFRFJ1QUhPRzdMLzc0RmVHTk5MaXpr?=
 =?utf-8?B?ekhHNE1jQk00ZjhNTVY5RnF2bHlJUEFHOUo3THhUUzVjYXZqNnY3c1Y5RWpD?=
 =?utf-8?B?cXM2dTQyV0VmWngwTjB5RW1FcWoxa2xNcG5WemQwR3JwOXRBRXk1M0Z2c1RU?=
 =?utf-8?B?SWJmcC9hQUFNYXYwa2dRZUNQeDl4MElYbmk5MkFKVVBVbDNkTVQydmtjdlhl?=
 =?utf-8?B?Q3RNNldJWEVMQk96MEpwMnFWQVhTeU8zREF5V29yQ3lPdUc0YjQ4aFBnbUs5?=
 =?utf-8?B?N1VkaVQrNXc2VjdsRG9Iai9DWDhxZ2NhSFZHZ1VZb0N5UmlPRnBzLzZHMFAz?=
 =?utf-8?B?TFFZckNRbHFUSU10TGU3dnVHRWRpa1VjSVhONzhIV3BZbU5NaHNaVFdJbkhB?=
 =?utf-8?B?TlVHRXF0MEtRK2MxZjdydm9Ma3NwRE54blZvUGpxZDVEdUhxTGlSSW5BUHU1?=
 =?utf-8?B?Y0poMFM1cjQ5SVRaZDlpOXlGc1NhNDg5NXNkaUFkdWVjNnp0WVpSdHNIZkdN?=
 =?utf-8?B?T3lUZGRzZGZnV2s3VDZIalV0WTJoQi9FUU1MYUhLZ3lPeUVlSGFGR2xFdmQw?=
 =?utf-8?B?MWNDaUF1SlgzVlJBMEhBOVpzTi9uT3M5dXpaeVhuakRrQ2VvTzh3dWdnSHh2?=
 =?utf-8?B?VEd5eU5aWVh3QUZrYWR1dGdiUlVsVUg1WFpQYk8zeTIvajVqdm1oc283R1hm?=
 =?utf-8?B?MEhMSXd3ZGVQWnU2SmVjamc1TlpkaG9VYjZjSmM1Y0NnTU9xQTRaOFZtS3hU?=
 =?utf-8?B?TnpFeitVUHVORjBMMFdTdGx3MDYxcm5VM2hjNTAxY0cwdlRLdXJjUEFDdnVC?=
 =?utf-8?B?MnRML2NUQ2xZNlBraVc1Rk5LTkI5aENaV3NHNGJUaVVDSXVZdERGeGVwS1B3?=
 =?utf-8?B?QWFJMnFaSXhwbGNQTGF4OVdteFJ6emtvRG5RREQvbFFzT1pxQmNlNXFjMVpX?=
 =?utf-8?B?OEc1VmZtNDVYbWUvcU93Q1FFVkc2Y0FXMDJWN3FQdWpLR3RYYW5ZUXF4SjlT?=
 =?utf-8?B?YThmZ0NuRG4rK0VUTEhJU2E0OGc0N3plNzhZL1ovVGd0cHZVYUVjUkJmbFhw?=
 =?utf-8?B?ekJxUjRFL2hHN3VzVEM2UnhXSjhuMU50QzVqUElBZlI4VWxjRnVObFIwcmVO?=
 =?utf-8?Q?0y+tzLKJtdlZQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTZRWGZBSWpjYUo5SmRtVTlTdDNvajJGMWpXTlV3a09USWR4L1NPeDlLb1Ew?=
 =?utf-8?B?Z0dvUkcvY0NjOXFQcGhsWXNrVHBDTWx3Umk2V1BuVWk2OGZ3T0xVMllvVlRF?=
 =?utf-8?B?RnZUNURpNXpxenZDREFVYlBHRUEyNmFENkxkMG5RZmxQVStuRWdhdko1SG9C?=
 =?utf-8?B?TEt6L2t4cndpeTBrY3BtaFlIQlJMeHlWTWRtdkRUYzduOW96RzJKMDcwckZ6?=
 =?utf-8?B?WHRIL25GZkowVUIyVU5UV0pqWlh2NzhVQ3BLQjhWTDhzSktxbXNwQnRyc0V6?=
 =?utf-8?B?aTBORThlM1lSbVZFK0QvS3hPbGFSUHE2T0VsYy84NFJ5dlplcnpib29xTGdw?=
 =?utf-8?B?YlVoeWFHd1dLRTAzNU5jaGFWWVphbXg1b1pKeSsrZndYY25Pbm4waGs1eHhz?=
 =?utf-8?B?cEI1WmI2aUF6V0lISFpkbDBzaVZOWjVLNkNGUWpVWmxVQXBlVTJuYVRZNnVH?=
 =?utf-8?B?eWcxZjBsMEhiV0EwT29JTTN0YTVkY1J4dnI3eHFIUDM2eld2NUR4TURUV2VU?=
 =?utf-8?B?UkNjaEJjK2phMmljYlZ6QXp6cm9CeXlha21nbldCN2cwMEhjc0lZZmVGWjRR?=
 =?utf-8?B?QWR4YnpSTmZVQStkU1lxcFRPM2UzL0QrKzhwQkNLeldxNUdwQTZqMndXU0ZT?=
 =?utf-8?B?aTM5K2ZWRlVMZmxGSFBLZlNrMjdKWlZXUDVnNTZyTHpyNnlPNE0wKzRGUjlO?=
 =?utf-8?B?cUk2QTZwUU1rN05BQWRoUnl1Y3Nhc2s4Y1Vhc2Z1ekovUTZyamVaQzRwVi9h?=
 =?utf-8?B?TUJFZDN1a0VmVG91M01OR3plMXdra1Vhc3Z5RE1qRStKWFdqam9FTWpVMko1?=
 =?utf-8?B?dHg3V1lmdmczakJPcWR1cnhWdDFrSzIwM0xjUUpkMVgwdTgxYXBNWllGeGpX?=
 =?utf-8?B?Z3lLbThrcVlhQ09PWmsxQnVYcFZWOVBCOW8weUxkWGpNYlJJaGlPNTJDMXNS?=
 =?utf-8?B?RVJuU0RFTFoxQ0YrNkcvY1B6NjhqOXY3eFRzcnlCbUxHb2pKUFU4OVozWjN4?=
 =?utf-8?B?S0luaHQ0Vk9ibzRIVElFcGY5b21ad3ZTdU5TMTlJQzQxaTlHVGxzNjR5NDlt?=
 =?utf-8?B?SHYwemcyM05KbTRORCsyVk5xY2Nqak54VzVTNWhIZlJGZS9Cd2JwcHZLbVVS?=
 =?utf-8?B?L0tJYjJvejl3WHgzeFR6d1hxK2tNQkpMbDVhbXhwOENsNWMrVDRrQTJSOE5I?=
 =?utf-8?B?SmFJbndnZGVjYnpnZ1JGaWd0dkNxMGxOZHpOTmp4Z0tEWHFVdk9JYXlmdFd5?=
 =?utf-8?B?WEFNcVUrOEVKZXlZU0J4OWM4d29IQlpSd0Vxd1RaNzBGanRNUXhKcWlkVVhS?=
 =?utf-8?B?YS9qNHdMTjZtaGhDdVlGMGdERFhHeVF6QXZaN0ZMT3FUbEgvRUkyMC9FRE1H?=
 =?utf-8?B?NFg5VU5ldDFEc3lJVHN5L0U2YTR1OU5EQnFQbzMybGV4Q0h6ZFFVOUZid1Nm?=
 =?utf-8?B?eDF1anFWL0JJRU5mL0cxUWhoYzFGVTlSV09OTG9rcmcrVEhZUzBJM3cxMjRw?=
 =?utf-8?B?ZWFuQ2hPWkxEdVRhNElEeHI4RFN2RHdDS2NRL1phZWljVEdsSW16ZjhBMENv?=
 =?utf-8?B?NW5lSFNZeGJpbUdwWUcxTFA3WkVXVXpJUUdnOE9ld2ozbmZDdGVNRXlidURv?=
 =?utf-8?B?Z21hZFRoMVJ0TnBoa3ZNVVNDWlZpV2pmTXFQQ29kWGQ4dHREdGJSR2U3QmpF?=
 =?utf-8?B?QXA0d2RIdjUrTjFXOGRsREJ3RTVMNlZDLzI5MzZKY0J3UWxydHNHNkVWelFJ?=
 =?utf-8?B?aXFLZ0o4UDdBY0tCN2dkc2dtTFh3WjFUUXRUeXZoc05YMGN2dVBtTTRZOVh2?=
 =?utf-8?B?L05wMHFoaS9HemtRZjE1L0NGbENqVW5kdk5IOXN1c3hLL3IwTFNEMEV0L2ZE?=
 =?utf-8?B?R083ZTNSMzFaWTFDMDRWdkFVOWlsYmoyRXNFZkhlOG1NN01DWmtYVmRtWXVz?=
 =?utf-8?B?YU00UmlOcEc2cE8zYW1POVNVMW5OakNjY2I0UHdWNHhDMzNUb1V6OUptU2FY?=
 =?utf-8?B?VnJwcGI3cUpZSkJNcmNZVW5IQkliOW9DWXVZRUZDK0QyQVY5KzgrYXRjaVhH?=
 =?utf-8?B?VTZMNjI4TVl6bW1ZanAzdTlyTWhYMklQQXp4RlJLdUVQYmlpTjNIQk5ETmUr?=
 =?utf-8?Q?J5lS/AoZQVjquXyZSeKO2ZLkk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d9b35c-7bd6-43a6-6244-08dd72906a0c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 09:17:53.8305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NcoQRgX3NuPClHivV21aF42NzdSz3uzKFUAH4a5Arb2ESVXLAJj2zaD3u9jzbJcG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9031



On 03/04/2025 10:58, Jan Beulich wrote:
> 
> 
> On 03.04.2025 10:44, Orzel, Michal wrote:
>> On 03/04/2025 10:43, Jan Beulich wrote:
>>> On 03.04.2025 10:19, Michal Orzel wrote:
>>>> Just like for RISCV and PPC, the earlier we enable the CI build the
>>>> better.
>>>
>>> What about Arm32?
>> The series to enable compilation of Arm32 with MPU is still under review on the ML.
> 
> Oh. Is MPU in Kconfig then missing a dependency on 64BIT?
Well, yes you're right although when I think about it, it's been like that (for
both 64 and 32) since the introduction of CONFIG_MPU by commit (in October last
year):
0388a5979b21 ("xen/arm: mpu: Introduce choice between MMU and MPU")

If you're saying that all the Kconfig combinations + targets like allyes/allno
need to build successfully also for new ports (MPU on Arm is kind of like a new
port), then I agree (I did not think about it and clearly others too seeing the
MPU patch above) although I'd prefer to avoid sending a patch adding dependency
just to be removed in 1-2 weeks. But I can do whatever you think needs to be done.

~Michal


