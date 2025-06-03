Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4172ACC087
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 08:53:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004010.1383657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMLVw-0003af-Cv; Tue, 03 Jun 2025 06:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004010.1383657; Tue, 03 Jun 2025 06:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMLVw-0003Yk-9i; Tue, 03 Jun 2025 06:52:48 +0000
Received: by outflank-mailman (input) for mailman id 1004010;
 Tue, 03 Jun 2025 06:52:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Vtc=YS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uMLVv-0003Ye-43
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 06:52:47 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20629.outbound.protection.outlook.com
 [2a01:111:f403:2412::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59a1b0d2-4047-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 08:52:45 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by BY5PR12MB4291.namprd12.prod.outlook.com (2603:10b6:a03:20c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Tue, 3 Jun
 2025 06:52:41 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 06:52:41 +0000
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
X-Inumbo-ID: 59a1b0d2-4047-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jx8QXT/ub6qZy7qkt23+ZopCerFT6NFROephBWicB9YYLPBfSBkyBxU4RqmbcplKLTxwyKM35HcTWCMojUBXzKnGtuQHJr3+hYQ+5bB/Mt0zvc+gwAAVRVI1b9cSBwrDSn2A5hC7LcuVqoiXPRwLZAKX4T75XbixuEAHhm4SzBDgb5NYNvUfii9RnDOzf05s/mFTyZL9kyOXSQpwBpvI8EssyHVNEQX6QXceXkvabAlwJnQ/343LX3pYdY5z5Q38Aab6ilj1cZjOSLzGruHFX058h0jXt6ja0ixPj+zGUHp8uT/cVcp3QFOF4dNcBZUEexGjbZv4/CrkqzoFHcPQkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hzp8RN9hwOzJoIap6EqlJQLus6f0OAqb16klUeUD3kk=;
 b=yIRPF7yklAQZskocUUXzJj4Xyjt16L6/H4mFJb4bjpfA7/xCMy/+ShArti+I3MjNka82lcjyHANfCC8ffKmP6SqkMpM3xMzfISrDTv8lbfh79aQ7b6D0QcHOkw+z6nsF0t6wJCuxqlpYy12MYeSQEM9CD1x+QwUcNi4QO6kyGbe43Xg0Vpv8dux2EiG/klSk74f23vx7PHOWMkdkrQ4iwMpSv6/B+5DIn6t4zRBiyTEz+oAMXkGMSvDm6fIxSvaiOSfsImzT75O5cSgltxapfmitUMiku73J/ogysNjcK2Ce6VFVWRdmBbfiBKtTBQLuIlmnc5g72IA+QhyrCJt1Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hzp8RN9hwOzJoIap6EqlJQLus6f0OAqb16klUeUD3kk=;
 b=Q9NHFvXRM3y4BDU/QMsEyoZmxqff6HmRd+W6wrQucelCQGbg4I/QinGa0rkSuOr26Q4bqOnES3HFG11fbA2zt79m6DbWA7L8WyUMsAYXNp1rkckjHP3H42Dr5fnB2ClqBaIUHLQ6vxLFe85eK5yIhlzeSNPOZveivahrh3sa/Q4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <6438a00b-a0fe-419d-b57e-5e1af48d43ce@amd.com>
Date: Tue, 3 Jun 2025 08:52:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/vpci: Use $(CC) instead of $(HOSTCC)
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>
References: <20250602150929.10679-1-michal.orzel@amd.com>
 <aD6aVzDZ4zDyEBHV@macbook.local>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <aD6aVzDZ4zDyEBHV@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::6) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|BY5PR12MB4291:EE_
X-MS-Office365-Filtering-Correlation-Id: f1ec3087-109f-43f8-46fb-08dda26b3c22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2NHTzR3UjFvU001ODA2Qmh6WUJjajhMM0hucUQxWVJLekFxRDdBc2ZkcnpI?=
 =?utf-8?B?QXY4UGJpc1lTTVR2ZmE3d2FFTFVXanc3UFdiR04ranpoa1BVWmI2NkdIYmhs?=
 =?utf-8?B?YUFZMi94YVUzWGtwSXorekxVRllSMnVIOHV4TUJXVEZMZjNZVjl2ZG16ZDIx?=
 =?utf-8?B?U2NUWVdPMkZPNHErS0s4Yzd0aklVb2I1N0N6dDRPbWRRS3ZlSFIyU01PcE13?=
 =?utf-8?B?c2wrVHNreis4RG1oMjdrNkgwbktYMlZzVFYweXQ2UlVTcTdIejZFYlg1ckdJ?=
 =?utf-8?B?ODM0YTlHekdRejlrdlBlNDBQcXlMSmpSSjRIbVNOZUpyVVBUME0xMWl0SEhF?=
 =?utf-8?B?ZnB3ajFlYmR0UEFKbVEyV08wUzFtQnBIYUcvcHBjbTcvTXozYVRrcVlDMzNF?=
 =?utf-8?B?QjkzZFdFVHQyK282ZUdhdkRYTDRpcXlEY1VGR0RCR2U4bjIrYTVOMUJPRFBW?=
 =?utf-8?B?a0dnVHFIY0xQQnBoM0FEVDV5d2hqOWlsOUtKdU9FSGJIY1UzZDh3ZGR5aFNz?=
 =?utf-8?B?Z0xzcUVXbTVEY1N6a3VKdlJzOTZ6MjlpbW8ydXo1cFdhZVliYnJmSVROMmZr?=
 =?utf-8?B?R1l1VmJXcnVtbUpTc0MzS0xmWjc0a1h2bkpQcys1c0grMENyQ3J6YXRQTDRH?=
 =?utf-8?B?dlltQnU0a0lJLzJSSWN5ZGYrQ2l2WlcxVWo5dklRcjlQQWI0ZVdSVlRuTlZv?=
 =?utf-8?B?MTg0Yks4UXVrTnhFOUtpMnV3L3ZGaGVIVHBVdXNVQThOeEVTQWlncUdzeENQ?=
 =?utf-8?B?TzMxT1lsbmJ5dVE4SjJGZkVWaWpPQWN4Sk8vMDZRMHp6dlVILy9PR3BwNHlS?=
 =?utf-8?B?S3NjWFkwQWtDMnZHbGRUSS9yejJKQnQ1RThia2JIc2F3N3BGR2JFZysvOHV2?=
 =?utf-8?B?c3puWWgvQU9jeDdpNDJ2VExQdWVvKzlJMUdqbEdBMCtocUdBSlpJcU9hMHZG?=
 =?utf-8?B?US9aZDdITFFWZXkxaWU4YlFzM3M1ZExNSU9kWW9QYU5nS0pnTTIxY3hKK3A0?=
 =?utf-8?B?M3Y5dGFNSWMvdmpaQmEvUHRjL3VvcnNkNzVOZDFmMDEzSktXMkUxUUlYd1c3?=
 =?utf-8?B?MTV3VTI0ck00UVkwaE1kWUpSRkc5aE5XWWZMVFB0NDZ4U0NWV3hMaktBY1Ju?=
 =?utf-8?B?MFRJd3NXVXlsVk40MHNXUkY2Qm9ld2pMRWY5dGZVZUNlR0Q4MXBETm9FbGFy?=
 =?utf-8?B?VlhlSFBWTm1MbkgwNE9EcjNDZlVpcEcxaGU0bk5ad3I1aEt0dFM4dG5lcWJ2?=
 =?utf-8?B?NXpWN0FwSnpEdDhBQjdzb09kMldDRDBBUkw2MmRxRjd1MlRaanNmangyMmJF?=
 =?utf-8?B?ZGExTWdCSWFMcGc1cWhhQ29wYy9Xbkk1QXdPWnpKcW1xY0lQbTA1bDlNRi9m?=
 =?utf-8?B?T2ZWTmZ3KzN2aGhEMTB5S0pHMmd0RTRuQUdBVW10YUxPaS8xdit3UDBXSDdV?=
 =?utf-8?B?SHVMN082S29hejUvdkVNSnFBeDVzTTc0ejFhQi9Gb2dzSlE4MjlpcTJDNE1v?=
 =?utf-8?B?MnFpc0VmOWlqQlkwNVY0aEVHa1liR3ZDYWFIT0d3aDdaUGRSQVJxc21NQ20x?=
 =?utf-8?B?WDN6bThQVjUwSUVaaE1ZZkRFZmxnY01WZlRxb00wM1Yzenl6SUozY0FjektD?=
 =?utf-8?B?NEdPZFAzaUt3UFBKbzJRekFNd3NUWFJOQU5ndm5peFdpZ2dsejFjVVh2OS9R?=
 =?utf-8?B?MDJvS0FlaFJTRk12am1zNURkWmFLelIzc0pZbVZDZHFnRk0zUG83b0NpZXpo?=
 =?utf-8?B?SnpvNUlmYjdDcHQzVFF2c0ZiRkdkSkZveUNpK3M4SUJKMEdwNDR3ZG5TM0NI?=
 =?utf-8?B?TWwzdnBrcDFrMldhVkwvb3hIbmpGYVp5eElLa21TVkxlZ0NDOVlSb0JCdk40?=
 =?utf-8?B?QVBWczVVTEI4K3ZDc3pOcGJOVHQ0YUZJTDdiNTFGZDBDS01YNzl3SGZOTXo4?=
 =?utf-8?Q?EVC8xQbPooA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDJKMDl3R2E3amJHL2pkakkxMG1tekI1cnNZUWNtQmREYklvWGpzR0s1bHJw?=
 =?utf-8?B?TmJzUi9PUjdxeFJSMElXeU8xVDg5YjlwMEdXRlA0aGZ2NlJvS1BxMGlKM0lK?=
 =?utf-8?B?dE0yNHh0bFdZcFdma081bEtIUlp6RGlqUEJhWE9ZajkzWVpDKzJMZmhucklD?=
 =?utf-8?B?OVlRSHdEbFFSQ0ZubDlHV3ZwT2Q4SlhMV08yK1hjTk5SVEVoMG80b0t3YS9G?=
 =?utf-8?B?NlM5Y2VqOEtRRk9lVDNIbkd4Wkp4LzlDRnJuNmlLRWU4dXd1Y29EblZ6alVk?=
 =?utf-8?B?UjkvQ1dITTlCT0Z3ZGZlZ2tLT0xCK1Y2V3kvUU5vRGtydkNDRWdDb21ZUndJ?=
 =?utf-8?B?aHFFYkhQUmhIRnJVd0d6d3pxWVFVUnRzbnhtNlBGNVpHSnZ6QW91emVaMEh3?=
 =?utf-8?B?bGF1ZE9oWVVTZUJPYkhRZU1OMFNVQXJMZmJrZjNJaWlpeFE2d0RybXdaZDRN?=
 =?utf-8?B?dU9kK3dUMVpaM2Y4cHF5NWppNnplVzZZbXlmU1RHeVNLYVROQk9mUFBVZ2Zi?=
 =?utf-8?B?K21jR1RubmsxNEphUmVUVmZkbjBtZ3VTbDBlb2ZpVWh5RE5kNml1VWNNRW1E?=
 =?utf-8?B?dlZIY2czRmRtdnpKYTM4NGpaeVpFa0R4eFNUOWtHNUdIdU9xT29wUlE0NTFT?=
 =?utf-8?B?NEE4eGZnTGoybVJjb3liVGhKZXc3ZDhLRnVBSWNBNFpnZWVmZDR3V09GMlAz?=
 =?utf-8?B?NkpVL21lVkkwNThZOWczT3ZCZlJZUUJjaWNuWUE3Yi9rTGRHV3RVaXpldkdE?=
 =?utf-8?B?cm9mWHc5U242VE5uQVdMSXZsN2laNDVoVG1ZaC94aGhocmhtUitpRW55NXJl?=
 =?utf-8?B?TnVlYWNqWEhmV1lWWlNjUFpNdVBtYjBJWTdvdFN1ZW5ncGZrc1hxTW1rN2o0?=
 =?utf-8?B?Rk9hS2VRdm0xNWtZUXFmckV6QUtoZ1c2aVd3Mkk0SW5abDBFOVAvaGVjQ0V0?=
 =?utf-8?B?bjVxTEVxNE14Y3VHd09jSk5NZXpQbTN0SGQ5Q1ZQWHJIQkVUN2ZzL09FaE5V?=
 =?utf-8?B?c1l3WTd4QWoyVXBjczdZNWExS0kranl2bEpEd01lOXd1bkllRXZGQnczWWo3?=
 =?utf-8?B?WXpoUHcrM3hWK21FbHo3WVROYnVWSktsWlNLUmg4OFBvaUJCV3NYbThydnA4?=
 =?utf-8?B?M3R0dE1hWXZ5S25zM0pUa0JncklMdmd2TU41Z2JnS3MxdER2djRDaldJSyt0?=
 =?utf-8?B?dDZrekdLZ3haOWI3OFJMRGZmSXhPRjhybGt0eURsQU9ZRnA2NlN5R1lVL3Vw?=
 =?utf-8?B?L3pTT1hYSGFSVmtwaVpaNjdlbWRjNHJzMXRrOVFyTmdlamQxWDVBUDlLUDdp?=
 =?utf-8?B?MkdJR2VEU2NrMC9QTEJoUldxUGdHeVo3U2MzUjFSZGxjbTdKUFcvM0ZTV1p5?=
 =?utf-8?B?VWhVUTZHOHFQRVVteG1ESnRsdjBNT2FiVnlPSmQzSW1mNFJxSTg0VGxuc3Zi?=
 =?utf-8?B?bDlRa1pqQjF3ZHBGdDVnUGU2TkN0SEtvTTZxREdwSWpqOWp3eUU0V3NLZWZ0?=
 =?utf-8?B?Y0hrS29Pa1dMUmlHVktnQS9vSlY5YkZvaVprcTJJbk0ycnY0emN4Smt0OUt3?=
 =?utf-8?B?d25rZE1tNG5HVHJReE85YVNEWTN5SnA4dGY5U0RCZVM3bnZuc3Z4dDJLeFVy?=
 =?utf-8?B?cFBkYW5DUXUyWWtwdjFlQ0l0MVNxek5yWDRCbnMzZE42R055dDhsYkt1OG92?=
 =?utf-8?B?elJocnd0RXlkR0lDU215eGYvaEhOMzhRZkwzMzhZN2JKOXc1bzQvRmJvWG8x?=
 =?utf-8?B?Z0ZRVVN4RktaWDdrcUsxNFZIaFB0a3ZHUHRTMG1qcmlDTUkrWkp2dXpOVWNh?=
 =?utf-8?B?OHFhVkM3QU9JNTVSUCs5RnRSUWdvaXpBN1VPRE0xWXNXWHNEWnkyRkdDVHFK?=
 =?utf-8?B?U2R1RllUaWpPR3ZRcGV5TGRwSGNPZWdLWGIrdlo1MUpDelp1OTJQM3A1aGd2?=
 =?utf-8?B?RWZEdnFqMkxZckVPZWRFZ3o1U1UwZ0o3WkNvdFRDdEhmOU9FVFYzMlNNSFpz?=
 =?utf-8?B?alhuTnhMQ0VROXdNU2hlVGtQZTZqbkJOM1ZiSnBXaHBmUnNXZVBCaS9EZi9x?=
 =?utf-8?B?eWlWd0JIRWJKVWh4bmd0SWhWOGFNYkhZWUdtR3pPOG1Lcm1jM0Z6UTE5MHpv?=
 =?utf-8?Q?VHDp+TyBhzeDxbZjDPOEiYeIN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1ec3087-109f-43f8-46fb-08dda26b3c22
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 06:52:41.2328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v7Xy8BuTI4dmA1OdUFAlfa7CqHzVh4xPIYW+4/tSvmszpZcqGE6AdVYALpM7mc4g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4291



On 03/06/2025 08:46, Roger Pau Monné wrote:
> On Mon, Jun 02, 2025 at 05:09:29PM +0200, Michal Orzel wrote:
>> These tests are supposed to run on target. HOSTCC can be different than
>> CC (when cross-compiling). At the moment, tests installation would put
>> a binary of a wrong format in the destdir.
>>
>> Fixes: e90580f25bd7 ("vpci: introduce basic handlers to trap accesses to the PCI config space")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>  tools/tests/vpci/Makefile | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/tests/vpci/Makefile b/tools/tests/vpci/Makefile
>> index 9450f7593a41..1101a669e118 100644
>> --- a/tools/tests/vpci/Makefile
>> +++ b/tools/tests/vpci/Makefile
>> @@ -11,7 +11,7 @@ run: $(TARGET)
>>  	./$(TARGET)
>>  
>>  $(TARGET): vpci.c vpci.h list.h main.c emul.h
>> -	$(HOSTCC) $(CFLAGS_xeninclude) -g -o $@ vpci.c main.c
>> +	$(CC) $(CFLAGS_xeninclude) -g -o $@ vpci.c main.c
> 
> This was already posted in:
> 
> https://lore.kernel.org/xen-devel/20230313121226.86557-1-roger.pau@citrix.com/
> 
> And got no feedback.
> 
> I'm happy for your change to go in, but you might also consider
> picking up the run target adjustment part of that previous patch.
You're the maintainer of this file. You should tell me what I need to do
unless you want to wait for Anthony feedback.

~Michal


