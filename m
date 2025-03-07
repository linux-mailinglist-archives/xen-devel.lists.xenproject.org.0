Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2A6A56283
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 09:24:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904674.1312517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqSzh-0005Zd-Tz; Fri, 07 Mar 2025 08:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904674.1312517; Fri, 07 Mar 2025 08:23:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqSzh-0005YB-Py; Fri, 07 Mar 2025 08:23:45 +0000
Received: by outflank-mailman (input) for mailman id 904674;
 Fri, 07 Mar 2025 08:23:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+QIi=V2=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tqSzg-0005Y3-LD
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 08:23:44 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060b.outbound.protection.outlook.com
 [2a01:111:f403:200a::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7af7eac7-fb2d-11ef-9ab5-95dc52dad729;
 Fri, 07 Mar 2025 09:23:43 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SA0PR12MB4446.namprd12.prod.outlook.com (2603:10b6:806:71::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 08:23:39 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 08:23:38 +0000
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
X-Inumbo-ID: 7af7eac7-fb2d-11ef-9ab5-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgisgvgeWkpV5ry1sinW8fMcn8kPvVTrLH3TBN+7YHzUYnrjGaMCqwWt23o3QBeLOqt80IoovguX0BKUr6TIMNc95dsgm8WXsX46z7spRpzXZLhsMLW+q5C8lfC6fA3mg3UCZLMlfg4Qbi/OGk653bIUbyyR1KMdLsD3Dtv7dmOETOKHRJrA54gorAabdxwjbbPSpywS/9VVSApVhnjpcMY9rJUlIV9D1IooT/0yDX6zYhtlV+OYljmCqrMV1aYum+cp7vwFRSxLjt14/Arxyg4xyQJzIqcqDsXykP1+eRq5ZGeXR7+zV5L4y0cPlMLexBWh49gM41Q9uwBQ6NJ35Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjakkyh8QSy5O+s7gra1Uc30sOF38GlooyqMRZUOe9g=;
 b=Kux4N/qoNz5GE80qYxiNF8R0f/nbQXPGvwn48/1xXqKH4MEvtaZQrZmSWRZDOzFbXJ9VpTVr9OX+DTV7q4w/QGapVpMquk6DnYQaUOPzHqIhTgov29OYRK/OeVnc19h5oRRV4V9J/9dym5nfQjSU6LPkw+vHMlXcVkVADusHX4ZZK83MXBKMQtPGs8NU7YStZHG8CcWKQLw+DCV/2hADOmPhNHJAT1W0AmG03gdgkTUvZAxfKDOulL6dzvcwKaJGbs5zew8SyqOyW1fCZRrJsmhpEELxLQ2isUedpT60wu8cCc7hDcDi9bwwN9MFk+RFtKhJcvlGJkDFni+qs7FoQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjakkyh8QSy5O+s7gra1Uc30sOF38GlooyqMRZUOe9g=;
 b=oV2N7KgqmxovIu2vuj+GRMqSjlwWJQ2v4Y2sHZtG2pV8YTBPqW41s+mNKLHW6RreLrJ1j3HCOLCHOWG9HZ5stf6V3n23WDECkNhgAeeRRPgLiDsBFngmoxXa1CWgy2Di0/zMwEd+1L2kp6nHbghd6KgqBRVo7k3hpgkKSpYQM8Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <18061830-538d-4101-960e-a34941fe30ad@amd.com>
Date: Fri, 7 Mar 2025 09:23:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | fe5757f2
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <67c9da9b3186_2e7497fa83084b8@gitlab-sidekiq-catchall-v2-66447c6578-4sqjw.mail>
 <1ca1105b-2ad5-477e-9707-15c5423a6aaa@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1ca1105b-2ad5-477e-9707-15c5423a6aaa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::13) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SA0PR12MB4446:EE_
X-MS-Office365-Filtering-Correlation-Id: 029be9d1-c062-457b-4682-08dd5d515caa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZEczcjJxdWtnZG00N3g1SW1yRG4zWHBaOUtPUm1WeEIvWjMvemxFdGtxTTZJ?=
 =?utf-8?B?WjVoeDJPVXZ2bW5WTVgvTU0zVnlVTTBmeWgyYU9UTXhHMEhSZlZ1ZkFBVGNk?=
 =?utf-8?B?SDJpUk5XS1FOc002MWtGL3V5UWVYMXNNVkRyVTF0QzhqZjdsb3JoY0VhcnB2?=
 =?utf-8?B?U1FRNDI1bjhvdm8vWUlHVXJwMUZwZnV4UXVwc052TDFBZUovb2M0cjNNTDM5?=
 =?utf-8?B?ajJTTWwwaW5vckJxaEgwYXA2NURpWVpKZ0s2SW1HemRVVXVFNSt0QWZoVVp1?=
 =?utf-8?B?OG9kMXNLdjl1S1dJblFYOStCVlFNbVFveTdReUdrb1BLSzZqbkFtSThLelR1?=
 =?utf-8?B?WkJPUlFaU3VITlYzNU1zK0dSMDYyRkFiZDI4QTVrMUdFV1ZTN0kvOHVtMGZq?=
 =?utf-8?B?N1Flalhmdjdqb2FxVEhkc0hsYW5ZdTUyQnRGVVZUVkIyckdYaEVmb2ZMVldR?=
 =?utf-8?B?elNYa1BNRVFaV1MwemNJczBLY3VWRGQ1cTdFL2dJcDJnRDl1b2g0c2NLVDhw?=
 =?utf-8?B?Nit0VUJFK1VNWngvYWk2ZEYvT0hkNE1mcktYOXpTVDVEOTY5NUFJWWVpdkV4?=
 =?utf-8?B?Tno1S2F2clRoNGVzU0ZvVGh0WU9scE5YNExPcVk3aktpT0xHQUVRT201dlJH?=
 =?utf-8?B?TktIMU9YK3dSZ3AwNTB0MjNNS2FDMURUcVRZQ2Q1aFhSVmVYYVdIVzk2eC9k?=
 =?utf-8?B?aDZVKzJDVXF3RW1qR0h6UFZqMGNlNXEvdzVWdzhhWUVma0QwMGlIV0ExL1VP?=
 =?utf-8?B?emIyS3VTR0YvWnhTYWJnMUJsWjJheFI1eThCYis0cm1uUjAxOHorVkVNbytI?=
 =?utf-8?B?WitBa1NEdmFYdFdsNkNpY0lKdkZXRUZ1OEozWmMzTkNqbC8xZGkwM1NxT1Ur?=
 =?utf-8?B?azVrbHpBU1VYNVBiTHcrYTJoc3c4NnQrR3NUa1F2MWdhWFliRW9vMTRzUVMr?=
 =?utf-8?B?OTZ2dUN5S1drWHJubnRpZlI0c044K2dxNzdFSFovU3l1dXlUcXhpOUNnRnUw?=
 =?utf-8?B?Nnd0ZzNueUVTa2ErVThRalBIQm96NnhIZjBzV2huVmNkVkdQdnM2Mnlsb29O?=
 =?utf-8?B?Qmp0UHlaMmNab0w0N21EOUNjYUtqY3JaVmZaeHNsNDI1MXNxWTBLRHU4MU9z?=
 =?utf-8?B?TlNhN1BaMmFVQXpqbTlEVnFhZWFtK3AvczBSWUcvOHQyS2kxcmNqTzNvTHVa?=
 =?utf-8?B?VkFzN2ROelV0SVhveEpIK0F3aG4xcG1EY0N2R0h4Yk54Q3AvMlM1SzFTN05K?=
 =?utf-8?B?Vk5NZWRoV3hGQkpMU1E2MFRpWEZxUUQ1cWZjaXFLRnNzZVh1VnM3bytadUtM?=
 =?utf-8?B?OGkvekFIZ1JMdzF3SVpyZEdtQTN3K2VhaTl4MExYbGZBZHRRZUxwaFFPaFBG?=
 =?utf-8?B?dzczYVV1L095ZTB1MU1aUGZMNkh3anBIc0F2dVZ0V2lDdGwvY2ptSkpPdERN?=
 =?utf-8?B?VmhXNFRKVElkaFpWTEQxcnpmTU5IREdCeDVwKzFrZ2pMTW5EcFQ1VGhtMmJC?=
 =?utf-8?B?RTlxTDJocmI2bi90UnJoM1M0VGpXWEJjbURuSU5CS2wvcEZEV3cyc0pmYjNu?=
 =?utf-8?B?R2w2TlQvNm1TeHBwelJwclB3bTVYUzc5ZzhlenNpV0ZGYTJSUmMxRjB0Tks2?=
 =?utf-8?B?Tm9qSjdOSktRVCtjaTZnUXU4S0dENDdiV2NaeVhrNFBjODRJTWVKcEliRmgw?=
 =?utf-8?B?bzFvNTFmRFJzR240WEVCNmxBR0IyVHF4V2dKbXpwL3NUMUFsdEZpbHVFTEU4?=
 =?utf-8?B?L21iVWFvQkdOU1EvOWRCY0Fjcis4RjFpNktqMi9nSThzbXlZSCtORDRjTjVq?=
 =?utf-8?B?eGZKbEZjS3FoSG03Ykg3UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWw0QmEwM1dWYWd1ck9PaUF1bHREaVU3T3JDMDhUdmlvTDQ0UnhCNnN0NStZ?=
 =?utf-8?B?MTd2bEdSL295dVI3RllBNisyWmJKKyt0b3psbE1UOFArVEo5V1owK0tTdVNw?=
 =?utf-8?B?Um9qZ2VpeDZpS01PbFVIbXBPRXR0dVNab2o3d08vOWFoZ3ZYZndpVjVXT2hK?=
 =?utf-8?B?UGVEMXdyaHNtMW5BYTB2dDlWaFRuSVJaRUJFdHJLK2JVTWp6VzhoU1ZBUlVq?=
 =?utf-8?B?d094Unl3Q1dtb3IxRlpmcExqK3JTMzNEN1Fsb3djTU9XQzI1NGRHa2U0RGRw?=
 =?utf-8?B?Smd3ZGl0VXdQNGwwTFhobThWL0VOclhlaXlaL0FVUEVRY0lRNkZPS2g4Zm96?=
 =?utf-8?B?SElFNUVhVUNocFNuOVVBRVBYaHNuMzd2N2V3NXhUdjlRZGkvSmxWaDcrU1Zh?=
 =?utf-8?B?UEZ5TWQzMFBlWWovdWVrRytib3UwaklyZGZoK2hudUQyOGlITlhSdVVUNVFi?=
 =?utf-8?B?OWJUV1h5M28zTW9BcndHTm9iQndzdnRBQkkyK3FFNWhwbnRmaXlPUStnNzk1?=
 =?utf-8?B?WmVFcXc1d2tCaEtYNk1Wa21oQjBXU2Z1bmZnQStPM0swQVFEQVMwQXYyWTBo?=
 =?utf-8?B?Rmp1Mk0yR0taZXV2RXNXTjJUM3hKZUlOdmNEZWRTM3FzWTdWZW5PTEc3ZTVY?=
 =?utf-8?B?bXJxNUJsMjZaTmtTaUpFSTBVVUtUNlZXUmdDOEhZVERJTlR6bXRPK2hPM1F0?=
 =?utf-8?B?WXpDRWRYRXpIaVdtZ0F4NThrVVU1b2FDc1o4WnRGd0cwOHhwMHYwczJrSEFk?=
 =?utf-8?B?ekxwdS9iUUExZHhhMnl5anlKdWViU1MxaDZHaERUeG1WT2xxVDIwcUluVmtV?=
 =?utf-8?B?djBCMGJLNkQ5QjNhYU9NZnBHVVMvY2E0MUVWSlM1MWJrWW55Mmg5MENNSXMy?=
 =?utf-8?B?dVlyd3hVdzkyL01WM242NlRHMjJRcE51ZEFncm0xa0xnbzFITm5Xa2ZwNXNp?=
 =?utf-8?B?WmtEek5QNmlvVHRZeFFvNWpiUnJKd3I3UXpEaEY4RDhSaUxYVjJOSlh4WmZr?=
 =?utf-8?B?MDRVZ21tTDh4cDFTbW1zeGFJRE1pSkMrMlRIbDBiSVlUY09SY3B0b0pCWXJy?=
 =?utf-8?B?cEc3c0d5YzdMaERvUVJhL3pqZlp1UkJ0ZEhheGpIWGVxMTNPcm1lc2JzRE52?=
 =?utf-8?B?ZnR1dG4wbHE3clpaOHpHWlB6Skh0KzdaVDJ2ZnN6cWd2Nllyei95WWFweHFk?=
 =?utf-8?B?aFlxRWgwT05Rbk5QaWlITVcyd3J4UUllMlE4L3R3bERVT1I4WlVOSDBJZ1l0?=
 =?utf-8?B?SUF2MVR1ODNPMHBJNkRLVG5HQ0UzcXpLQTJUWWZVVWtaZjVVM1NCSEJWemhO?=
 =?utf-8?B?WGFablVNUjJSeHlkUmtwWVAzRTR4ZHllUkVFQk9tc0sydVptUzVKQy9zWEtt?=
 =?utf-8?B?Z1l1eE53OWFocWVjYy9ZbGllZkdla05tVzkzeFJIbVJUL2V5RzJuMjNCZldr?=
 =?utf-8?B?VVdGRFNUS0RKcURZN3VFR3I5aHVpbDJ0N1BVaHN0c3JLOEltMDhEeFFQSzBj?=
 =?utf-8?B?bE84MmFLbnQxTjl1VGd1MlFzRWRuY0o2eWZrTUZ4U2J5V01QcUZUUDRCRTZN?=
 =?utf-8?B?WHB6a2M5aFI0YVhzWVVudmhlQUwxRFl5byt3QktGcFpwRml1Z2c3aHpjeUxU?=
 =?utf-8?B?T0ptdE1VVHVxRGRiaTZpQ2xuWjltMytOSld0RHBsamMxMDlqblE5eVAwaDEy?=
 =?utf-8?B?aTREN21TNThpUytudzZRRVo4bFFpMWhlcUdaYlVmZlhwWW5RRUFQc1RXOWZI?=
 =?utf-8?B?WU9OcHB3TXc4V0M0K1Y3WXBOaldRNzFkd1RSNUFSa1JKbklzcW5vcHdTZDY1?=
 =?utf-8?B?UXRxaFFuTkpEVDJFUDJzT2tVU2FHc3NXUjJURm4wcGNZL000REZ0bCtMM3Qv?=
 =?utf-8?B?WG52QlV3OFBpTHBkWDJpb0tPVkZFZHhwYU02SFNmS2hNT3FyT2VadkQ1QWtD?=
 =?utf-8?B?YXc0d25YbDVJMkw3YWNvditwY0xacy9aRmloc0lNQzNCWm5heUNkUjZOU2J4?=
 =?utf-8?B?YjduMEV1aFp5QTNxZHdDbjdFOURMRlMzOVZYWlIvSkluYkI0ZzRlOXh6L2FC?=
 =?utf-8?B?emxoVWJmVWlOazNnSDNweEZzK21CemNRVlZkQjIwZ0laSDVVQTc3cUljeFRp?=
 =?utf-8?Q?U/N8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 029be9d1-c062-457b-4682-08dd5d515caa
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 08:23:38.6854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KZUDRNoaGyRkXcNWKo8DlGRhNJRU8AL3e/Dzfg/gVzC3BU97Kh+GXccQG1Br+KuT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4446



On 07/03/2025 08:28, Jan Beulich wrote:
> 
> 
> On 06.03.2025 18:25, GitLab wrote:
>>
>>
>> Pipeline #1703410235 has failed!
>>
>> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
>> Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
>>
>> Commit: fe5757f2 ( https://gitlab.com/xen-project/hardware/xen/-/commit/fe5757f25de6062732c088ae54e2180236632552 )
>> Commit Message: xen/events: fix get_global_virq_handler() usage...
>> Commit Author: Juergen Gross ( https://gitlab.com/jgross1 )
>> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
>>
>>
>> Pipeline #1703410235 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1703410235 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
>> had 1 failed job.
>>
>> Job #9334349344 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/9334349344/raw )
>>
>> Stage: test
>> Name: xilinx-smoke-dom0-x86_64-gcc-debug-argo
> 
> I fear I can't spot what the issue is here.
AFAICS, the explanation is in the latest MAtrix thread under failed pipeline
and Juergen wrote a patch for that:
https://lore.kernel.org/xen-devel/20250307070507.30102-1-jgross@suse.com/T/#u

~Michal


