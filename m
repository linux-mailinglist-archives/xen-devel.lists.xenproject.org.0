Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E05A7142A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 10:53:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927432.1330179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txNRs-0003AJ-2F; Wed, 26 Mar 2025 09:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927432.1330179; Wed, 26 Mar 2025 09:53:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txNRr-00038J-Vc; Wed, 26 Mar 2025 09:53:23 +0000
Received: by outflank-mailman (input) for mailman id 927432;
 Wed, 26 Mar 2025 09:53:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a+/s=WN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1txNRq-000358-On
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 09:53:22 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20610.outbound.protection.outlook.com
 [2a01:111:f403:2413::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25af2c71-0a28-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 10:53:21 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DM6PR12MB4169.namprd12.prod.outlook.com (2603:10b6:5:215::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 09:53:17 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 09:53:17 +0000
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
X-Inumbo-ID: 25af2c71-0a28-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OH7u18YXeTZGPFU5sJZqc4iY9rXlqbl7N5RlWsYp2e1ZG3emSvFcuOuNFQPwHGbp73s4IrRlCXY3y84kNlCzei74Tq2ZgPM9RrLFyG5lnx2ltHAI20Z4tdGPlHyJgEt3FkLcM8cbGIuzy8cWILI/Mr+j4inQFxtNBH3lpTQTNmCr2xpr0vxRA3LRMF5JvZhxOA65jqs1H0kKXjmAEHgEUDnkwwW7FMngap6uXs9abhAgJ5qQZWsx7yT22bcRx2W28GOJuKbuBJxqxnmniwnXzbim6W+Lfg8+dNqNSH+ytZLWvHW/EHInCCHIaceeqrTeyWghjeZvEcq2dAaQhwTkCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ww1C03i96xlOESi9lAh0G7AQCygX+oICVAn5P4Go9o=;
 b=zVBaSyXfsd3YJ5QzE30vbnLUHZ9UKxv9FQzF4zRL1w8s7p0ovxMtOT/3MNvQ336y3tNcPHBhkh8OrLYBzbAkeCUNsE9lduITdbjdRnCVALKf+hi4AD5dpIxDgRju4TQ4O6CnxDxu4Yhuwnbv+vE5hHoeXuP/6boRYzECapjzI6FW8m2IAboSInxm3U+XnCeSosqjlKDr5JwgmBzONq0dd5g388h9z8i3rqm9Q8ZQdRNMWDs+SJcZqZnyxFKoI52OPAlHal4JEytHNDVQMk1Mxv3HTUbp4emzwHBk3rA/ofpGtTkjI8C8oHQG+IB0rboKPmILXlCG9m7uqTdKiZIjpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ww1C03i96xlOESi9lAh0G7AQCygX+oICVAn5P4Go9o=;
 b=FOeXXTO2vF8kzXs8WSxR0TZ69Nub0Jehy0bgCNHy3Uc7xuxfI9aiL2uM9SWBNLlO9BlvR6o8mMpsUv242467Xkv6bToOnnXfAlwa2Ir0q6RGrRYwhT0ETYzvvcQfIXytOaERM5w4oe1wulUxxI0nD/GIVjNyrDPRB3fH3lV8taE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <7071bb45-8a01-451b-90eb-5350c05da215@amd.com>
Date: Wed, 26 Mar 2025 10:53:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] xen: introduce Kconfig ARCH_PAGING_MEMPOOL
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jan Beulich <jbeulich@suse.com>, Luca Fancellu <luca.fancellu@arm.com>
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Wei Chen <wei.chen@arm.com>,
 xen-devel@lists.xenproject.org
References: <20250317200727.798696-1-luca.fancellu@arm.com>
 <20250317200727.798696-7-luca.fancellu@arm.com>
 <85ba02a9-f9f9-4141-85be-a9a2d431e450@gmail.com>
 <26583ecf-4057-46b1-8f87-f4589d7bec17@suse.com>
 <136cf1c5-d1e5-471d-b560-51632b444e41@gmail.com>
 <94865aea-043b-4f52-adb8-d2d78dba293b@suse.com>
 <0957c74f-a53d-4107-bc8d-e13d7c308d39@amd.com>
 <763b3dc7-68c9-4984-9e55-7bd57c356bd7@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <763b3dc7-68c9-4984-9e55-7bd57c356bd7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::13) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DM6PR12MB4169:EE_
X-MS-Office365-Filtering-Correlation-Id: e2af990f-f8d9-40db-38eb-08dd6c4c0879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VFFMaEtzMG1KT1BEeHJnaTdDVWZFdktKTDMzajZ6Zkdqb2RnTGhHL3dJNDNi?=
 =?utf-8?B?ZWhZZUV2YU1uNXVIMEJmK0FoOGwweWtPb2tKYVNTc080dHpsSDFxcnJWMjZZ?=
 =?utf-8?B?N3F4N2kvck85RExNMS9OZXpoQWpUUDRmYVU5NmV4aHVxOGI2TWJXYVNqUUpl?=
 =?utf-8?B?MGpEN2ZlNDMvNng4dEt1SmtuM3NxcEJzYXA0SlcvdWlsNVpBZ1ErclltZDRG?=
 =?utf-8?B?bUlROVZVU1A5TGFZdWNKMFFJcjlKOUw5Q09QWGh6bHo3enVoS0h0QjQxRnF0?=
 =?utf-8?B?SmF6OURvZlZ2R3B2aDNCd2duSUNpclVGRGJBRzY0b284d2dFQ1hXSXR6MHpz?=
 =?utf-8?B?eUJXcGtFRFZ5Tlo0L1dxVzRSQkR3NGdQNmlodWFkem9QK3lxdkZjR2tuTTNX?=
 =?utf-8?B?akpaWlFZK05UbVR5T29Sek45OTdHU1Ntcmd2d1NadVRvMUpLZUhlRjlqV2V1?=
 =?utf-8?B?UWlyUHpmemo5Wjh2Qks1T1JSVTE1VVdBbktEeVdDSzgrMW9WcUsxR3M4N1JP?=
 =?utf-8?B?WVNrK0RTUnNZWXlYc0hwdHB0MlZ1MWZzdndSWkExQkFDM1hWY0xNSmExUUxV?=
 =?utf-8?B?MkM2N3F2NVdqRCt4UElKM0RNVHN2S0FGTlJ5d3FrZ1FJYVpuQnlxdVJ6WGVv?=
 =?utf-8?B?UDhKR1BQQ1cxbUlkMC9RK1pDSTlRYWJTWUd5YnRiQUlYeWJ6UHc3S0huM3Vv?=
 =?utf-8?B?aDh5M0hEdGlXbDlBc050VkZMOFdXNWJKT3k5ZUdXWVBMQndFZXBuY25ycXRj?=
 =?utf-8?B?RGhHdHBNSVJTMHB5NEhLTCtsc3Uzb3hTNWJKSTI2MVYyVU1jVFF6YWZ0V25J?=
 =?utf-8?B?WjJZbHdUMXVyKy9MTVZFZTZqTjZHK0tUYjdNWTFOMm9CZjk0UG9yZWxHOG1s?=
 =?utf-8?B?TSsxZWtSK0h2aVBGWnN4blVESmsxNzl6OTF1dEpMMVU1MkRpT3NOU3p6bERI?=
 =?utf-8?B?TVVMUDY3bHhQaDZQL0NQYmlzZytBQTZiMjdPc2xWNW5LbGVEcVV6SmVkMVNu?=
 =?utf-8?B?T1R6cGJWUlBJbmEvOUFiZk91dElnWjhESEozb1VCdnlVeVZzMTQyYTVRM2oy?=
 =?utf-8?B?ZU5TaktaS3I0alB4bzh6VVFhejBISDZrL1FlZVVQMVRBSzArSklZVXV3RFJ1?=
 =?utf-8?B?dHZ6UmVuUUNYRDF5UFRpQWpMVUd4TVIyQWVYdmthM1cxaDBPaFo0QmxjNUVj?=
 =?utf-8?B?TW5yRmk5L3NqR0lmMXFpdDZ6ajV3dFZtcFhnV1JzYmpKNzREY1ljQndMZ3gz?=
 =?utf-8?B?dGFBVWdjUmErQlhKaXZSWVA4cEJBV2JnSVVkNHFFc1BTQWFJbXRISDZ5V09U?=
 =?utf-8?B?QkQzSkd0RW9TSHMzdmxPZ01qcnIyTVRyWG1MK3h5b3JBa3BIQVpxeS9YVUJk?=
 =?utf-8?B?MzQ0RmE3ZXFwdW92akx4bmFHOVBwZjMwenQ0Ky9RRzhoWVlHaU5RRGd1SERS?=
 =?utf-8?B?VnAzenpoU09RQzdCNU5idWhnYXRreE5zNi8vNHZ0YXByTXJFMmhZT3o3SlQz?=
 =?utf-8?B?b2FhWlg5cFpudjc1SkRXck5hc2U4NWhjQm8yL2psZXZpTUljalFTVEMwVW9U?=
 =?utf-8?B?M09CZUZVSGZ0aHRla2p4LzZZNjVBSU85anQ4ZXBnTGNWNElnN0VoZ3JYL1Rh?=
 =?utf-8?B?am1IYnBCMnVEbno3Y2NLUFpvZ3h4M2pVM0lWQVNadmoxMzU0TVJmNGN1aFBL?=
 =?utf-8?B?bkhieE9lS0FiVmJqM3hZNUt6QW5vM0U3RE1Va2Ixd0trMkN5OFg4bWdSeWp4?=
 =?utf-8?B?NVdpbkhjRVZiM0V4TkZFTk55aSthME0zeHFHNVBFRkwzYmN6UzNOZndDNEdY?=
 =?utf-8?B?OEI5MUcxY2hFcS9PWFNkUDVDNzY1SnNjMVIxUHpiVjNYYm1SNDVBN0JxL3No?=
 =?utf-8?B?YlpZR2QzeWlsZEtHVXcyTlpydGVCdjc0TEFqOERxRHFvdURYQXJoeVBrTjRT?=
 =?utf-8?Q?9JoVW32Pjhk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXNrNjkzY1RCSXVHTThLaHhrRUpRSUY2RXpURGczMkc0ZjZaZGRVNy8xNHNQ?=
 =?utf-8?B?VzNoSm4yVWZmRVJYaXZJUFNhQmt2SDBuSXBmOThuRi9NMzhUdjhkOWpteTFo?=
 =?utf-8?B?dkt3NjlMZGRrUHI4WEhlZFYyTkdWVFZJSXdhU0ZIdjgwVGFQeGJjb1NVVmNF?=
 =?utf-8?B?dTduMU5kc0d3RWZPUGFsV2wrbEZDRWFaOGFSZnNCVE9uU1E1VHVYSHZBY3Rk?=
 =?utf-8?B?c3Q1VERlazNJYUxrS1lCdXNkblN4R0Y2L294SlI2ZURCaEl6QWVJSEF6VjJO?=
 =?utf-8?B?ZFFzMUs1NmRvVHR4UzdMa1EzaHYxM0ZqQmhrS0ljOWQzTGVlMlJXeWZJMXlC?=
 =?utf-8?B?R1lmalZwakdDQWYvZE9NbFZNNnI5V2hGWDVpdHdQZ1ZTVUJoRi9qY0RsOFUv?=
 =?utf-8?B?b1BZWW5UZTRIZDlSQmtTNk44Uy9UZFgydE1GY0ZzVEV6cHJFZDJScjlRQWFr?=
 =?utf-8?B?UWlQKzV3ZXoxaFp6ejhaVm5qY1RWb0NkM3BjTkgwM3NCeUFlT1ZJSUVRWG5S?=
 =?utf-8?B?NmNqOFladm1pME9NRElaMGdML1pXeWJvWDI3RVhJRXYvN3E2VXAwSmFaSVgy?=
 =?utf-8?B?akE1TkgzaFdRbUt2bUttWUhZa0FZY054eHQrS2R3TU1WMVQzYm5hbE1tenZa?=
 =?utf-8?B?b2NSRHdneG1vdE00VC9XWVZ3bjhjclZVanV4aGttNlJ0ZjkyNzlhWmdYNzVR?=
 =?utf-8?B?UVNKVHRodG9HVUl4Z1c5MjRvZWlTUXdoczM0WUt2a0owLy95YkRqaHpsVm9p?=
 =?utf-8?B?d0FZUHdIQlhpcEtHclM2YUNmeURhUGM4dXFIY0h0N1gvOVEvYUEwRmtKRnV0?=
 =?utf-8?B?WVhEU3N2Ym0wV0xHNjlOM1NmcVZIdDBCaHI4K1NaMTRScXBCNmgrb2JjNDM1?=
 =?utf-8?B?WW1BUWVKcWhQaHF6TE9sZHJ2SXVMQkppNTZjNitxdzFXcGtMeU5vL2VJMW9k?=
 =?utf-8?B?WVdhYnU2R1JZTGxnU3poVVJmK016K3V5RWZBQUZQMURUL2lPa3YvejVLYlV3?=
 =?utf-8?B?YzE4OW5YSENDQU9vaUxYRnFjUTBYN1krV0tEZjJDTWlVNTQvbjBydGhtYkFH?=
 =?utf-8?B?YzgzWjRnaDdwZWoxSVhLU1QrQ2szeml1Q0ljOTBjTUVqb2FMWWJFNGFuTWV2?=
 =?utf-8?B?M1V4L0FYZnpHRHF1S29CTDVSNWREQnZQZm0vQWhiUjFMZDZuN2p2L1kxYTRv?=
 =?utf-8?B?VlV2QVplK1F0N0xGUEhpWEFQR1dEcExuM1lJRjkxSTQ4T0p6VFFnUkQxMEE3?=
 =?utf-8?B?Z041VktabGNVOE5IbzE2SlloTGdOamV2OVljQkZzcjZtSmZ4WmY3bU12alJH?=
 =?utf-8?B?THNSNnJKU2Y2dUlZSEFUV1F4VExiYUhZcWRjUjllTURkWXVVRDBHUWYxNnkr?=
 =?utf-8?B?RGxwRkw5WGROY29ZQmJRL3VOYjNCNFRoRjkxTkhVWEp4TkVmQXo1cWJNZGhR?=
 =?utf-8?B?N2N3Y1NwdTltZEJLcktCellVWWhmQllsTlNvQTF0enpwTEw4OGE2dXBUK3A3?=
 =?utf-8?B?YmI5QkM4c3VHeGpMWUcvVituVElHKzN2MkpQNGlqT0R2SGVBQzZLN29ZN2pH?=
 =?utf-8?B?TXMzZ05IUEtVSzRDQkEvVEhHckFXSDlEWW83NkxvbmNud3JCM0ZmcU9Qd1lH?=
 =?utf-8?B?akZoR1BaT3dCL3E3V0NuMjRJMlloMVN6NGx4UGlmZWVubDZWRFl1eHhvMENa?=
 =?utf-8?B?Z3FoZ29TZDhEcXVnWjBYSFV6UkdBYXlMR2dHS3pOQ1B5TFhlLzJBZXdXWFh5?=
 =?utf-8?B?cXF1VmxRdDR6L1ZZMzZoU2V5RnhaZEpJNFdqVTBnMHFwU1NseGdXU0tXaXZJ?=
 =?utf-8?B?WkJFeDRvY29nazdwUWt3d0U4OUZicXZ4b25VQ2J6VFhXZHNSM1lvVWpoa1RT?=
 =?utf-8?B?V2h4ZTJobXFUalU4eEdYUXp2MGlUUWdpV3RENHpOZ0lLeGlLT1pBSTFJa01F?=
 =?utf-8?B?U1I1eXQyMHkxeHdUdXVsVkVxdzhtSXVCY01uVkR2ODNqdmF4YThUamhodkJM?=
 =?utf-8?B?SVlFWEp2ai9DMnlqak11KzFkY1o5OFc2bjZOeVFLOXl1TjV2UWZKcnNpd2Uv?=
 =?utf-8?B?UmwxVERnRlpCeitBT0hGZEFld0wrSzJzNTdWM0RNTW9NVzNJTWNkRCtvVXhZ?=
 =?utf-8?Q?N+dLVFw/M87sJfPBloqYnqxvm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2af990f-f8d9-40db-38eb-08dd6c4c0879
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 09:53:17.3701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KoeS4cyIeR21IJ3gxsK08+ybWhjo4APANuU//0RbyCjlHGJwKAx4+cqYQpa3iWM/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4169



On 26/03/2025 10:46, Oleksii Kurochko wrote:
> 	
> 
> 
> 
> On 3/26/25 10:39 AM, Orzel, Michal wrote:
>> On 20/03/2025 08:32, Jan Beulich wrote:
>>> On 19.03.2025 17:31, Oleksii Kurochko wrote:
>>>> On 3/19/25 12:35 PM, Jan Beulich wrote:
>>>>> On 18.03.2025 14:05, Oleksii Kurochko wrote:
>>>>>> On 3/17/25 9:07 PM, Luca Fancellu wrote:
>>>>>>> From: Penny Zheng<Penny.Zheng@arm.com>
>>>>>>>
>>>>>>> ARM MPU system doesn't need to use paging memory pool, as MPU memory
>>>>>>> mapping table at most takes only one 4KB page, which is enough to
>>>>>>> manage the maximum 255 MPU memory regions, for all EL2 stage 1
>>>>>>> translation and EL1 stage 2 translation.
>>>>>>>
>>>>>>> Introduce ARCH_PAGING_MEMPOOL Kconfig common symbol, selected for Arm
>>>>>>> MMU systems, x86 and RISC-V.
>>>>>>>
>>>>>>> Wrap the code inside 'construct_domU' that deal with p2m paging
>>>>>>> allocation in a new function 'domain_p2m_set_allocation', protected
>>>>>>> by ARCH_PAGING_MEMPOOL, this is done in this way to prevent polluting
>>>>>>> the former function with #ifdefs and improve readability
>>>>>>>
>>>>>>> Introduce arch_{get,set}_paging_mempool_size stubs for architecture
>>>>>>> with !ARCH_PAGING_MEMPOOL.
>>>>>>>
>>>>>>> Remove 'struct paging_domain' from Arm 'struct arch_domain' when the
>>>>>>> field is not required.
>>>>>>>
>>>>>>> Signed-off-by: Penny Zheng<penny.zheng@arm.com>
>>>>>>> Signed-off-by: Wei Chen<wei.chen@arm.com>
>>>>>>> Signed-off-by: Luca Fancellu<luca.fancellu@arm.com>
>>>>>>> ---
>>>>>>> v3 changes:
>>>>>>>    - Introduced ARCH_PAGING_MEMPOOL instead of HAS_PAGING_MEMPOOL
>>>>>>> v2 changes:
>>>>>>>    - make Kconfig HAS_PAGING_MEMPOOL common
>>>>>>>    - protect also "xen,domain-p2m-mem-mb" reading with HAS_PAGING_MEMPOOL
>>>>>>>    - do not define p2m_teardown{_allocation} in this patch
>>>>>>>    - change commit message
>>>>>>> ---
>>>>>>>    xen/arch/arm/Kconfig              |  1 +
>>>>>>>    xen/arch/arm/dom0less-build.c     | 74 ++++++++++++++++++++-----------
>>>>>>>    xen/arch/arm/include/asm/domain.h |  2 +
>>>>>>>    xen/arch/riscv/Kconfig            |  1 +
>>>>>>>    xen/arch/x86/Kconfig              |  1 +
>>>>>>>    xen/common/Kconfig                |  3 ++
>>>>>>>    xen/include/xen/domain.h          | 17 +++++++
>>>>>>>    7 files changed, 73 insertions(+), 26 deletions(-)
>>>>>> For RISC-V:
>>>>>>    Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>>>>> Mind me asking then why RISC-V needs this at this point? The stubs surely
>>>>> were added to address some build issue, not because they are actively
>>>>> meaningful?
>>>> Only because we have stubs and not to have redefinition compilation
>>>> error. And, yes, they are not actively meaningful now, at least. I am
>>>> okay with not enabling of this config for RISC-V but then seems to me we
>>>> have to drop stubs in riscv/stubs.c. ~ Oleksii
>>> Well, I don't think it's "have to", but I agree that dropping them would
>>> make sense then (and be desirable).
>> @Jan, @Oleksii, is there anything blocking this patch to be committed (Luca
>> question does not seem to be answered)? Other patches in the series are ready to
>> be merged.
> I think the change in xen/arch/riscv/Kconfig should be dropped with dropping
> arch_{get,set}_paging_mempool_size() in riscv/stubs.c as they are defined in
> xen/domain.h for the case when CONFIG_ARCH_PAGING_MEMPOOL=n.
Ok, thanks for clarification. @Luca, please resend the series with this change.

~Michal


