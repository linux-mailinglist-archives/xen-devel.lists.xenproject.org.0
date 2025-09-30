Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DFDBACF43
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 14:58:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134274.1472238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3ZvS-00032N-OV; Tue, 30 Sep 2025 12:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134274.1472238; Tue, 30 Sep 2025 12:57:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3ZvS-0002zF-Ld; Tue, 30 Sep 2025 12:57:50 +0000
Received: by outflank-mailman (input) for mailman id 1134274;
 Tue, 30 Sep 2025 12:57:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwZw=4J=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v3ZvQ-0002z4-Vb
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 12:57:48 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e83cc60-9dfd-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 14:57:45 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by IA1PR03MB8310.namprd03.prod.outlook.com (2603:10b6:208:5b2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 12:57:42 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9182.013; Tue, 30 Sep 2025
 12:57:42 +0000
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
X-Inumbo-ID: 0e83cc60-9dfd-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M7y/IH80GKiOJU4s6gHeL2dPAYFLFvJkJsldP7qUhamkXp9FQpgbTXZFjgollYpa3qkQkgBzFUZyJEd/STHJBkM4gEuysK12lYMkz3RV/FqdiSL6ruMHaI8P/pxLlVmVdvcMviOc9W4rUn1xMTEmrlQ7Td7LULRlIUNtVwfCjzJ5uHBjKZm+RPBYjwMOQwTPrJww2LxlIEe95UgMbO0WFDyMinldY7KCcaCbtolopmxQqJviR9/wB3YXEd9W0DLYnEruZGnzEWY1H2RBGP/z519VrPmxUJQHBQg69xB5L8Nm0hQQipTVJxYRdayzpkkJFzrDnm2ZMKvKGIrJfVHaIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6nRTq4CBt+gGSBE+Yylg8cVhwqC9lTnCeCl7vO/9p8=;
 b=CEhzDq0tgxq4MnBeHluQov+D09/5Rab8gmZ24U2ZX8kp4v1zdGSLI4fe7rJRzY4zDga5EfLrZDkvJsUgsdG0Q09IAzYhYwHnATJPpInbwiEfBtjDPRcUPGoitF2SCtT8jz/QyscITKn2GRxHdfTwn53XVyDKy3GiCBO/7PWU04oSRHBOEeXsl7VgohIL9iYu4pYyYLY++q5nxXVoXaRreByM39Cw9da9HSG2SVLDsQ9J8Hc7gfcAjpm8RlUUImoHaDTJAfdG4tPqke3lvbmqi3m+XMpEyUu2+cAfkuzAQCbsQ0k/Ny5ZfbYcWRFA4RpWCyEyGtEE6li3AyWRUwd5fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6nRTq4CBt+gGSBE+Yylg8cVhwqC9lTnCeCl7vO/9p8=;
 b=JEXffMlOcjegUvfCNcNT9mFj1F8CIN83zf9iqnl4iuiCfs6JJUk9GMRjH05K2vBBSBq/aW6VHe02zKEYtqYwC7G4Tn+HBolsjn7YNxVmt2TA3TcSd4Ymuphyw0/h6hDahS/QZgb4srThCur3r5/V1e5+G5TE6u5tvlkKy1gDAZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 30 Sep 2025 14:57:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH for-4.21] vpci/msix: improve handling of bogus MSI-X
 capabilities
Message-ID: <aNvTwrcHsja65ndP@Mac.lan>
References: <20250929084149.70560-1-roger.pau@citrix.com>
 <DD60R7HDKJ23.1BYEORZH67NOS@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DD60R7HDKJ23.1BYEORZH67NOS@amd.com>
X-ClientProxiedBy: MA3P292CA0016.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::10) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|IA1PR03MB8310:EE_
X-MS-Office365-Filtering-Correlation-Id: dd4aabbb-a2b4-418e-987e-08de0020f17a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?LzlEVktYdE5GVjZUMjJ0Q3F4bHJ1aGY2UDRBenJYSkZab0d2SENSM1VDbzky?=
 =?utf-8?B?ZVN0TmlqRjhFTkFvQ3VHbm5BS3RSMHczVWc3dDdHWFhaMHFpRTZieHB3UGF5?=
 =?utf-8?B?OXBRb3lnaGhrcnpGMkE0ME10dVZwRFNzVWozSk5LTTUza3JTOGN1czdXNDl4?=
 =?utf-8?B?UUNNSVVtODF3a2doRklvdWU5ay93a1J4TFVUQUFiWUg3S211SmZaZU9HazE3?=
 =?utf-8?B?V2hqbHFSc0IzLytrbSsvUXV5L0R6dUlZOHB2MjhxT0xWTDZJdEtuSjlxNjNq?=
 =?utf-8?B?ZzFPWTBxSWdPdWwyeGIwRWtPYjR0TU5xVWtNV0dJUWxseVNscVFaalpNamJt?=
 =?utf-8?B?ditBQTUwd0JNQVdUNm95TnUzL3hPVDVJenZqVnlQNWJFeWpGTTNpVXA0S1Ji?=
 =?utf-8?B?QmY3QytubjJqRWhRcDN6dnhyY1pwY29VQkpLTVAyMkoyV0pybFk3ZFY0bG42?=
 =?utf-8?B?YzlmNldnL2RITWhCQzFPbWF1K0d6TzFDc3AxTnlPMVZEcmlaTldYU090M05u?=
 =?utf-8?B?UklDRlpRYmdRUEgwalJka1VqdERZc0ZtR2xXUGxqYmxFTGY3Z2JSZTNVWmhK?=
 =?utf-8?B?MHY4aU1MalFFMlZERjlvbnRPMVlvdWZKVWxKTThPUTdTdkd5TGlETnJmdzZr?=
 =?utf-8?B?WmZVMGRnT1owcmZNdERRRVA0T0diYkNKYmlZUCtYZlR6OVdXeGdGaHAzMmRx?=
 =?utf-8?B?SlNmM05IZzljejFjU3VCSlBzcVNrUzFya2twV2lwU1FUSVIyQXVkNDJGdmJk?=
 =?utf-8?B?Sk40TTR3Zi9PaVBobHBOOFNyM3BmZ1gxTmxNZ1NTMHNKWjZIQUVSMFdVQ1JY?=
 =?utf-8?B?d2FMOThDdGczS2t2azJCV000cURidnpNaEtsRTFOK1BKUkovVWVvUkZIU05v?=
 =?utf-8?B?SS94eDVMeWRodzZ5SU9EYzNVdEZVRlBGeEFPRm5IcVo4Y2NRTW00bGEwUW5W?=
 =?utf-8?B?YXdNd2o4enlPQk5qbmtIaTZBVFhUUlZwOHlvaC82Mm8waW5DT0R1ZVpKWlBZ?=
 =?utf-8?B?SDR5TXhOVDRXaU4zRmVNcEFzclVSWU12L2w1SGh0R3lnVUg3djYwcHhGbzJa?=
 =?utf-8?B?cUpmZzJ2bUhlalI3NDdjR1dxaG1TTy9yc05UQzF2VTdMcXY2eU9Ta3VIbkl1?=
 =?utf-8?B?Z1hDajVYdTBRTFAvK1RmUFJFQzVZR0tvUmlPUGFsbHdtZXZ3cWdZNTdCUndJ?=
 =?utf-8?B?VnVBV1hJL250UG5ybHJ1NUtzZlFvQk5WNU1icy9vMWJGMUo1VU5nNzU1R25I?=
 =?utf-8?B?WndmYmxrMGx2YVBqaFZPUTF3MjlRM2J0Uk9aaFo5MC9xeStnbHlyYUt0bUVm?=
 =?utf-8?B?VDk1eENvTEdKSWR2N1QzdEJINkdRdGRTcTAvaTI0NTA1MWVFeDY1eForeFZz?=
 =?utf-8?B?Q1hudTNQRlNQT3psR0p2V3VWTDhycCtnaGxMbUo2OHdaYUwyTDJzbHQ4WC81?=
 =?utf-8?B?RVRoWlZvWnFyUm9nUkpDRTh4ZHkvWmE3RWxvYUxocVlvRWVteTdpZzhQMU9r?=
 =?utf-8?B?MXBEMHF4TWdvMEx4SWU5c2g1ZVo1dmNNOWxiSHlkYitQWVBlZmt1bU5uRTRL?=
 =?utf-8?B?MGsxUXN5d3FwS1dsTXJaZEduRWd1aEhOaGdYTHpVTGVJVnNvcGhOSTJlbVRR?=
 =?utf-8?B?YklYeEs0YjdXaTV6dU5BS1hmVE9KUXczYTZaanV1Y2JLZlA5VGNxQnBseFNC?=
 =?utf-8?B?cmV0QVRNa3RiUTBIOGsrUUtTaVI5OFd1bFJvNTdpTmJieTIvWHY5eDhLOEpP?=
 =?utf-8?B?UFRDU1BKUUdGNFptMnJXdWxEdS9pUzhWOWtnNGduc2RDeDR0bHRyZURFTHVu?=
 =?utf-8?B?ZC9lUWhQMTF0cDFZRGhyRHFiV3ZVb1BVRVN3WCtiRUpWLzcwdEFQdVhaUVBt?=
 =?utf-8?B?TU1GR2ZINHhIaklacHNzYzJIL2ZDRDExNzJPa1Y3Q1BjZXBQRlRjcVhTeGc1?=
 =?utf-8?Q?T8Bzd7cWz1C6FILr6AHFX/g3dPavlDnI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzBoQ3JQYXhhZlhoWGdLUVlXVkpiZndyWkpqNnBPbThOLzVGMzFzeXArMUYw?=
 =?utf-8?B?eCtnQ25KLzdYT0YwV1kvVkNUNGdVTVFVbENVWmNqd0hZWVFud1lIVkxaQ2p2?=
 =?utf-8?B?clUwMXVub0ZMckFQNXl4ZGh2Q0hqdWNHblJJd01Uczg5VXlDWkVmQkE5cHJv?=
 =?utf-8?B?elp5M0JZYndxSm41MDVXK2pqV3h2OXZHcGNjV1preUczNytKaVhzelptNjZS?=
 =?utf-8?B?UWF0VENmaU13bUlUckFjSG5iYkpSbXRKLzFuV2VFZVFLQ0lncHJUN0JYcmE5?=
 =?utf-8?B?MXk2aTBRQzY3SXErUzEwRTQycmxESHFJcTZkRDJ1b255MVFzV3BYSjVXTWNS?=
 =?utf-8?B?N2VFVnR6QmdOUFhHU0NLekQ0QjV6cUhZa2JlNzJ3OVFQanRMNVZSNTFGUHFR?=
 =?utf-8?B?YlFJYXhyWHpjYVY4MHoxcXdmSFpnSXUvU0twczJiZjBjU2VNMVd3cjV4cnB4?=
 =?utf-8?B?N2dZQ3FQL1VTenRKRWg5WlA5TDlocG9CZnZ6Y3dmaVJZV3ZseFFiRTh6WTZP?=
 =?utf-8?B?Z0ducDMvMnBMN09vVTQ0Y0MyYXVCbThmQjYwUlhuWHBrMEF1T21waTQ1aXVa?=
 =?utf-8?B?V3JiWThJQ0JXYmZVY2hrK2NKNXVDTUZHU3p0ODRDb01UczluaVoyZUxBOGw3?=
 =?utf-8?B?eXQ2dFBDRFpKOVB2UUYvbFRMWUU2RWprQk5haXMrZFB0ejhRTkxFWGp6b1pF?=
 =?utf-8?B?T0tzVjRJOExUTkliZ3cyZkFZaERaT2VrbjFuRWlxUUp3VFF5ckR0NzkvVkt3?=
 =?utf-8?B?OGVqYnZjcS9weG9lcHUrcE9VZ1RuY2wySTdFQklRMUNwcWlJNG1rOG1hK0pL?=
 =?utf-8?B?QzFsM1JnTTBoQWZsTGg5cGdrT2NvS1RydmhvSzFQQmFEM09DaEhkVkEwTkpC?=
 =?utf-8?B?M1RkQ1hEM0hSMEw5WnZWNlV2em95K3VROTlYbkM2NU1ZU1JlczNhTHRuU0c3?=
 =?utf-8?B?bUU5QjhxYWlEQ1BDN05nNzJSc3h2cFFFcGpPS080ZnRHVVNsZlJJd3ZyVkg3?=
 =?utf-8?B?c2dzdXlwQmdvNnhBMW9pTHJFZWU4YjRVMEFiMjZXWW1JMmNjN3J1b2xVVTZi?=
 =?utf-8?B?aFNaL0pXeTU3bG9HaFZ6RDdpQnBhSnJGdXZtMlo5R1doT0JuNjRKdytkYkpr?=
 =?utf-8?B?SEpLVDJtUG9hcEs0b2hnVkNVV20rL0NWbFBobVN2OW9HNEsySEYxRmJBOGEv?=
 =?utf-8?B?UkgxS3o5NTcrbFg1aWtMbnhCczFIZG5vOUlzTktrb1pjVXA1S3JITTZtUXRt?=
 =?utf-8?B?RXJWalBSVHJzeWRueWNSVTBwdk00cmFBbCtwNU9xNjlUaUwzV2JWWm5RSk9M?=
 =?utf-8?B?NFl2RW1saHlTSkR2b3Vxcm93NU5hV3V4TkdYZjNqZzc3eE8yaTVLVFFRTEV2?=
 =?utf-8?B?aUNyc0JHUXAyQ2NqMWNtd21VWmprc2NVbFIrbkMwVk5xVEJTeVVEd1V1MFQv?=
 =?utf-8?B?WFc4RWVHa0l2bkxuN1hXSWZpaXpOU1FXdXV0eDdRbXlWZmlrWXRhOGliaXl1?=
 =?utf-8?B?SURNQ0x5RUJVUjBNb2NQY0tEcG9obEVLRzE3Y00xYXoxK2dIYjdyTnJKQmZO?=
 =?utf-8?B?V0xUSDcwV1pMSldZeU12em9EY2FoTzFUUVRXQ1FmNm9ucVZaRUFTdUZuQktC?=
 =?utf-8?B?cnc1emNCbVZENUpQU3VQRm0wMUxRNUw4Z3JobnQ3Z2EzUGtBNHdkQW9kenlq?=
 =?utf-8?B?S1A1a3BhOEFCUmNZUCtHa0E4U2F3bkphNXZwVXh1L3dKL2RKbEVwSTBMdXow?=
 =?utf-8?B?cm9xSHVjSll5azJIQmRiaHg0a0hZMHRTMHkvNDUrM0JQcHhSOUxJSUZTMi9C?=
 =?utf-8?B?amZpUW1yVnBUSE9JM1dHdXZMUVZlOFBVbElGcnRZN3lyV1IxbmVZUTFpNVlE?=
 =?utf-8?B?S2NnWE5kWGdBd21aM2lZN3g3eTdzVVhFUkxRdlo5djhmOXdtc0FXVDgwODZu?=
 =?utf-8?B?czZMRmgyMVk0SkxmRHkzejhPZ3N1TFhGekFEY0I0dTRLc0xyUWhwdzZJdnRJ?=
 =?utf-8?B?eCtoam9YQmE1OHo3KytXVnRjMHZxZWNFNzI1U0dOL3FIVVg2dG5jRWkzdXhJ?=
 =?utf-8?B?UE5YV3ZJdHU0OWpYSi9XakNmVkhaVW44azMxdWN5aEF3bXlhVitsTlpjemds?=
 =?utf-8?Q?wozQMvQIfFiSAHnbpOC4Li90E?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4aabbb-a2b4-418e-987e-08de0020f17a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 12:57:42.5444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1qHURzGQiMclGyGu1Afb6LsQLg8ZHfKGUXsmvpyECEKhsaQmvsSSQBfzuiVSHX6QRMJbhcQNVYIJNjBHUzoc8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8310

On Tue, Sep 30, 2025 at 11:15:01AM +0200, Alejandro Vallejo wrote:
> On Mon Sep 29, 2025 at 10:41 AM CEST, Roger Pau Monne wrote:
> > I've had the luck to come across a PCI card that exposes a MSI-X capability
> > where the BIR of the vector and PBA tables points at a BAR that has 0 size.
> >
> > This doesn't play nice with the code in vpci_make_msix_hole(), as it would
> > still use the address of such empty BAR (0) and attempt to crave a hole in
> > the p2m.  This leads to errors like the one below being reported by Xen:
> >
> > d0v0 0000:22:00.0: existing mapping (mfn: 181c4300 type: 0) at 0 clobbers MSIX MMIO area
> >
> > And the device left unable to enable memory decoding due to the failure
> > reported by vpci_make_msix_hole().
> >
> > Introduce checking in init_msix() to ensure the BARs containing the MSI-X
> > tables are usable.  This requires checking that the BIR points to a
> > non-empty BAR, and the offset and size of the MSI-X tables can fit in the
> > target BAR.
> >
> > This fixes booting PVH dom0 on Supermicro AS -2126HS-TN severs with AMD
> > EPYC 9965 processors.  The broken device is:
> >
> > 22:00.0 SATA controller: Advanced Micro Devices, Inc. [AMD] FCH SATA Controller [AHCI mode] (rev 93)
> >
> > There are multiple of those integrated controllers in the system, all
> > broken in the same way.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>
> > Cc: Jan Beulich <jbeulich@suse.com>
> > Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> >
> > While not strictly a bugfix, I consider this a worthy improvement so that
> > PVH dom0 has a chance to boot on hardware that exposes such broken MSI-X
> > capabilities.  Hence I think this change should be considered for inclusion
> > into 4.21.  There a risk of regressing on hardware that was already working
> > with PVH, but given enough testing that should be minimal.
> > ---
> >  xen/drivers/vpci/msix.c | 50 ++++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 45 insertions(+), 5 deletions(-)
> >
> > diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> > index 54a5070733aa..8458955d5bbb 100644
> > --- a/xen/drivers/vpci/msix.c
> > +++ b/xen/drivers/vpci/msix.c
> > @@ -675,6 +675,51 @@ static int cf_check init_msix(struct pci_dev *pdev)
> >      if ( !msix )
> >          return -ENOMEM;
> >  
> > +    msix->tables[VPCI_MSIX_TABLE] =
> > +        pci_conf_read32(pdev->sbdf, msix_table_offset_reg(msix_offset));
> > +    msix->tables[VPCI_MSIX_PBA] =
> > +        pci_conf_read32(pdev->sbdf, msix_pba_offset_reg(msix_offset));
> > +
> > +    /* Check that the provided BAR is valid. */
> > +    for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
> > +    {
> > +        const char *name = (i == VPCI_MSIX_TABLE) ? "vector" : "PBA";
> > +        const struct vpci_bar *bars = pdev->vpci->header.bars;
> > +        unsigned int bir = msix->tables[i] & PCI_MSIX_BIRMASK;
> > +        unsigned int type;
> > +        unsigned int offset = msix->tables[i] & ~PCI_MSIX_BIRMASK;
> > +        unsigned int size =
> > +            (i == VPCI_MSIX_TABLE) ? max_entries * PCI_MSIX_ENTRY_SIZE
> > +                                   : ROUNDUP(DIV_ROUND_UP(max_entries, 8), 8);
> > +
> > +        if ( bir >= ARRAY_SIZE(pdev->vpci->header.bars) )
> > +        {
> > +            printk(XENLOG_ERR "%pp: MSI-X %s table with out of range BIR %u\n",
> > +                   &pdev->sbdf, name, bir);
> 
> Would it be worth adding something here such that a device vendor testing their
> hardware under Xen can trivially grep for device bugs?
> 
> Something akin to "[Firmware bug]" on Linux, like "[Device bug]" or some such.
> 
> It would also let anyone not very knowledgeable about PCI know that a device
> they own is being unreasonable. Same below in the other XENLOG_ERR messages.

We could add indeed.  I don't think we haven't done so in the past.
If we go that route I would suggest that I add a:

#define DEVICE_BUG_PREFIX "[Device bug] "

in lib.h or similar, to make sure we use the same prefix uniformly.
TBH I think vendors care little about the output of Xen, as long as it
boots.

The downside of this is that it makes those messages longer, which
will require more time to print if using a slow UART.

Thanks, Roger.

