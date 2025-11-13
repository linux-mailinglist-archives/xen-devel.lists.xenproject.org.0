Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B76C57BEA
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 14:43:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161573.1489495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXbT-0008Dh-8F; Thu, 13 Nov 2025 13:43:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161573.1489495; Thu, 13 Nov 2025 13:43:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXbT-0008C1-4s; Thu, 13 Nov 2025 13:43:11 +0000
Received: by outflank-mailman (input) for mailman id 1161573;
 Thu, 13 Nov 2025 13:43:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X5Bi=5V=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vJXbR-0008Bv-LJ
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 13:43:09 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aeffa27f-c096-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 14:43:07 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH3PR03MB7409.namprd03.prod.outlook.com (2603:10b6:610:195::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 13:43:00 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 13:43:00 +0000
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
X-Inumbo-ID: aeffa27f-c096-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDuyMiDa2AEUy520JwpATxt5jTjzIUzUm/yP2UYm/4FenczzyIwyVFo08wJFRi3mpKlPNuwZBguH0rNP/VaVIQR+krxVke9aybok0hN1SsM1vAsfTEp8tr03uKvxmn8TMtN1yVtUlQ28/HNIxbxrvZiJLqITVDDBd6QKqyY6xzMFME4bYH2Mi5C+5ndySHTvvhS3SnK6NsGDs8A4SQg6ATe37XWs2NwuUkByPumHDp4XOsfEwwgTVot/nUpeFMCIc59r2IiJ3AeoWF1ROKHDnoIQuXOhgwz2YhthW7MH2c3923WDOljkmyOm+3uDRHtg8wrAtGgh9qRs6fcm7Tc8Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntNAH0tx0QE9hqZHs7iYwSjyvb1lqboGJjbYOOLn2jQ=;
 b=ryh5+56H9pmQzJyOquEqKAwS0yAATWwkEhWzGfGh3tapesS+x3M/e8GP9U9n8v8iscQdGNtbCP0umkm50fozY3NVgELjqGY7AMj6X4E08pP0DScDbRdtJZjRSrwGWO81gbxT9+wW6d2gdxyhY6lUhzwM4yEkFYHEKmf95F/JFczz+4LC+A//kLTgpA8IShax5ZlCFU7w4hDKgtRxJUx6doNFtM5osCp0huqiGY7+YoE8AHkYJexawnZLE3DFGMESevKKAsVBf7U8CtM8QlslBolt5Ed52UywGQMDECM9HPjR83ee48nbfix93h8DM/tnXBrhU8mrO4oXXyWQMJN+8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntNAH0tx0QE9hqZHs7iYwSjyvb1lqboGJjbYOOLn2jQ=;
 b=k175Yye48xmFmmKYJokHpYuelEm/dIBVXqnVbAym6QtsjcSyTWGOpbRdmC2OdBaBhXhdp0QAPujBUjvh4VhbDDGTaELorLiLuzqyx8HyrDPLEuUbO3nhpL9I4SjecS2A4F9N2FggT1W0TJu+IRZjBSTTPxWAZOiv00r0w0dTiik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1dc03c2e-772e-40ab-b3a1-7c9d463b7250@citrix.com>
Date: Thu, 13 Nov 2025 13:42:57 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] mktarball: Drop double-processing of the archive
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <20251113130154.220139-1-andrew.cooper3@citrix.com>
 <ce976661-927c-44e0-a478-893242bacba3@suse.com>
 <b0d1b91a-a9fa-48fc-9546-b481c75ee185@citrix.com>
 <c0ac3598-c070-4b73-9e6a-49385338ea1c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <c0ac3598-c070-4b73-9e6a-49385338ea1c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0026.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH3PR03MB7409:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f0f123c-a292-446e-d263-08de22ba8fa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bFkwMnZsOEc3OGpGWTNML0ZBTFNXaHZPYUl6dXV3OWZwcWthTk1tdDlLU3J2?=
 =?utf-8?B?WUJ6QkhrZFhWZXU3ditFY2I4elpFMEhHVVBtZEFNZ0YwTEhJSDQ4UjFhcytw?=
 =?utf-8?B?VGE3ZlVhTzRoVitZaGpVTHd3MG1aRVlJYWxaUVRUcG9DcnV6WjVvSkpWUnp4?=
 =?utf-8?B?YXB4cWRacENONm00VDJIL1E0L0EwdGEyRXpjb0tSM3h1dURQY3NIb2JkbkRj?=
 =?utf-8?B?eURWU2EvQUVvQTF0d2oxQ1JTa0xLRzMvTnlVNldnT2NFWEo1bDZEWis2Z1ZS?=
 =?utf-8?B?WGxDRlloRFNtMW9TS21tOVlkeHJNdEI3QWZEVzZjOStSOVNrbDQxUHIvQk1p?=
 =?utf-8?B?djBjU3dNVk5ia2owQlBleERHUWREUXduay9vMEZ1WmVqTHQrKzlsZ21yQlRJ?=
 =?utf-8?B?TVhDTldlL3R5UFJ6aXBqTGdXaTVnOVV3MGdSd3N3cSs3eUFyZTR2M2MxTGhN?=
 =?utf-8?B?MDdPODVxbEtwR3RXSGpIdDJGQTh4ZlpvWGt4bE00RlNueVlOekNDbVN2a3lm?=
 =?utf-8?B?SFNheWVMNVMxV0RybUFJVFFBL25wUTVTalR2ZTRaWTR4dXJCYkhPZzhyNDNE?=
 =?utf-8?B?eldIc3B6RGI5U013WE16MUFXQVV1L1M2RzBLTDhPK01GVW9xRy8vcHU5VUVX?=
 =?utf-8?B?R29zT05jeHVHd0NXRXcwaUl1bXE3SFBWc1FEcEQ3bVF6WThNZW9pSmRhakND?=
 =?utf-8?B?SFViVEwra0pud3VMSXI5bUQ1VDM2bjQwWnJZZlF5eC85R2RSR1VnZWl4L3Bo?=
 =?utf-8?B?Vm5Lb1FNRDFWZHkwUkhIRFNTUFl1VW9NRnVXNVkwZGpyTTlrZk8yN25PMG9G?=
 =?utf-8?B?aXRtdGpuMWFOS0JFQ1B2SnVmZ0JWOW9qeFFUdlBZc0d4bDlLQTlyeGhrcUUr?=
 =?utf-8?B?cGFyL3gyL24yRXVKK1RvVCtWT3pBTnRJSHRDZUVJenhIU3p6VFB0cU9qelZt?=
 =?utf-8?B?eERIODByLy9mcTRaNjNwWjJreS9WWk02cVQvUkpwcEhWMnFiRmhjL0pxTzVE?=
 =?utf-8?B?cVZSUGI4aVUzRUhoYW5aS1c2RE5oK0tnYUNpSjJ3Um92ckhBQ3pGc0ZWTTFY?=
 =?utf-8?B?Q0JPdlFtMnpUQ1JSeDZDamx3cUpCSWZmSXRKQTF4NHF3eXZrYUY3VUJRdDIr?=
 =?utf-8?B?aWdWZ29ScEQzTXNwOElneXhRdWJ1WW1jTUdhVXpPMUdScWZsdHM5OUdWTnFy?=
 =?utf-8?B?Mkx3VnVsMEJ3dmJJdlg3WU42NGZ0NnpwbTlaa2tRb2lHcHkzeDJXWDc1UThz?=
 =?utf-8?B?aFdGYjVMdHVoNGtSL0M3cTNydVJDT0I3UzhQQzdzdGZ4SktFQjVqZG1za3JD?=
 =?utf-8?B?cVo0cXd3UlAzYUhQZHJRTGdqNDA2blhiaVlsTEI3SS9GQVR0NmtkdVJFN3pU?=
 =?utf-8?B?cElDdFpJYjAwamhVdlJZd3Z6eWRvSHdvcVo5YVJ3N1NtSDI2U0lKUElDT1NC?=
 =?utf-8?B?M3JKWTZyVHRQV2Y3Vm1FVHplZHA5ajlDN2gxMWxPS0plT0cxcGsxNzY2d3d0?=
 =?utf-8?B?cjZoV2VYdGtYZmozS1p5VTdvY0MrbUNXdkVmcmVQRUJza0dRRDNjejNtczBx?=
 =?utf-8?B?MnZndHRUWTFwN2dwS0lMMWVrR0djVnhYTUVDQW1vTzEwUE0rTzI2VzBMeHBt?=
 =?utf-8?B?R3RWQU4wOWZPeExmOU9uNndYTnV4eTNTRlNZVmliL3Q2TFJXTGhaaWgxL21I?=
 =?utf-8?B?SWFYdDNFODFIblhjcjAxSnpOK21NekxRQUJjU3VPSmhpa3JmdUNrckxpTzJQ?=
 =?utf-8?B?QTVaclFBQmdQcmk2MzNYL3pZNTlJL3hCSDBlTC9WL2hsSFFhdUR5dklSdWFP?=
 =?utf-8?B?WUsyZ3YvU3FuTS9qRFBHY1BzbTc3eXVQUmYrQmU3MVU3NWdtcnd0S0I2c0lD?=
 =?utf-8?B?MU9VdVZSTVBwS0ZidXJtWlhrZXc4WnRTbXdxeTVnQXZuaFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXlTYm5ad3A2THN2UFVtSENaU0NzMExJOS9xSWhLdmxGTXhEQVFxWHh2VVpw?=
 =?utf-8?B?TldYb2tFeVIxY3NMWnJrZGZZd0dSWnRmLzFxYkFneWNGdXBTMXZUSDNiN0NW?=
 =?utf-8?B?TEVaaEo3SnpNcTRTS09TWU8rYlM1Uys0ejFIM25XY3BVUENEb0w3S3pjRkR5?=
 =?utf-8?B?K2ZPY0tjM1BvaXA2cHlBbkE5ZktkUk9PSit3TUJVbUlxR1hybkp6MUhONFNL?=
 =?utf-8?B?SFRuaUFsUjRoMmxFcnR6bUlEd3kzSWNMVlFZS2hsbk9TTVZVWWlsOW5reW9W?=
 =?utf-8?B?SFAwdkIxeDFNU25mMVZmNHpKMGJGOWZTazh5aGxVQUxteXppT01Qa2dSWXYz?=
 =?utf-8?B?OG5xUmUzcG5XYjRrS0RWeVN5Q2Niemdxd1J3SG1Ed01ZZGErRS9GWVZGNTdn?=
 =?utf-8?B?THcvSDJKdEFJNG1UcXJyR1Q3RWlqRjgrMXVheStTdDd0MUdmUWRpQkhxWHQw?=
 =?utf-8?B?NWtHUERRbnA1Wi83QjRmTVEvVXg3aTlIU2k3NFdyUGhrUW9EYm9oVnhlTFVo?=
 =?utf-8?B?Z0lyS2s0OWdYaHhMeHNVTnVvT1h1SDhtcklkeUZtMWVXZnZSUEFWbkFJK0Fj?=
 =?utf-8?B?TThORVByVmVLdmptT2ZXQ0FJVEwzSjIzZFVSY3ZKUmh6R3lJYk9HdjRjSVE5?=
 =?utf-8?B?TWQ2VllibHI0b0Q0L1Y0QjNRVFh6bUZhTk5XV3lNdmJxVk45c3I5WlZ2RkFY?=
 =?utf-8?B?OXYwNU0rMnBYUnZNU0RyMUVicEdZdWVPZ21xWEtNREYzVkRtdHRIZ3VwbGFo?=
 =?utf-8?B?VDRnMkJVdy9aNFJ5dGw5K3BsMVNUN0F2Rk9jUE9leFYxalFCK0UzaGRDVjQz?=
 =?utf-8?B?VEpsUnFUQmVYUmJlcTBPaHZjNjd5d3U0K2ZoRXd4UU43TWJMUk1oeGFlUVE3?=
 =?utf-8?B?SGVPOHI3MkU3L2FRM0s5ZU4vZThtVTA3R2p0Y00yZG81TmkwUVVhV2lIRlRL?=
 =?utf-8?B?dVRjMlJHOUplL1lGbU5lYlg0U3AxcE1SWE11TmRJNDBWMFRYblEzQlVYN2FZ?=
 =?utf-8?B?dGlOQWQ2OC9GZXJTUjV0UTI0V0lEZU5UZWV5RnFXc2pOazZBMnFsdFdXa2V6?=
 =?utf-8?B?eUxjT2VCenIzRERDR0UvSk5vVG1tWWgycjBXYTBSRmFhUXJNdGlXa1Q5Z1Zk?=
 =?utf-8?B?YVZMWm5JaGNxTFNVWUs3OGN6cnhxcFZGWXVUYUlObndVWXRVd3Z5MUdmaDE3?=
 =?utf-8?B?bzdkTTE2emJDeE82ZUdBb3lQQVZZRFpPb045WFFObmRaRUZiY0RSVFMzeTFx?=
 =?utf-8?B?SFlycVdCOC9tTXhZa1VkTE5VSFNPZUlPZ3B4aktuY3RjNXJYejg2akdZN1JF?=
 =?utf-8?B?c1ZwbGhFNmpVYmJkNEVwU3hqY0RoOEdmTmdnQzdUTlNpNVNSOVR2YW0vemtK?=
 =?utf-8?B?ZmpqSnI1SzAzcnc3amIxRzQ4ZWZGVmtNeVJtaXhXSm5OTTV4SW4xUGZiY2Q3?=
 =?utf-8?B?Mzc0alcrdC9pbzRhbUFHZHRtV1NSTi90b29tdlJmL2R0L2xWb09oSFhCckJS?=
 =?utf-8?B?bEorS3hkUmtJT0UxWGxOKzRBc1JHTm1mMHBjek1sTlpmL3BYRmwzTzJyR2JX?=
 =?utf-8?B?dHNSK0FEWWNzV1drdXVNK3F4QTBHMnNDVnVWeEluL0xQbk9pczdjcElHZnJk?=
 =?utf-8?B?WnZwU01rTlB0aURaSzN1WjZVZ01IM1dsdzJuQUxxMERmSjZQUlVOS1ducEFC?=
 =?utf-8?B?aTFNWHFjam82aUF3VVVKRk91VTYrTEpNbFRXZEJJbGI0K0YzakdoL0djWkdQ?=
 =?utf-8?B?NW5SMVVMZjJvYWtRNnk3cXdMMFdCWmRla1B4YzFQc21pVGpBWVdqRm83aGp5?=
 =?utf-8?B?U3M5dHllMnZQV0tJT0tPQ1lHb0lUQ1MrbFNyNEVUOStrMFpCc3ZEMVhlTXpt?=
 =?utf-8?B?eUxNakwwQUFGc1dOTmJBMzRxWHYvU1ZLUjFJemkyQmxyVE5BeXZCNVlUNWJH?=
 =?utf-8?B?Szh3MGM1YWhMeUxxL3FHVWg1MFpLVDVHeGtKOU1rM3pQL3JZTGQyTE85Njl3?=
 =?utf-8?B?M2QwSHdpU0xmU013VnhzT3hoUjYzYU9FMWpPL1FYZlptQ0daRUpGOVlaTWF2?=
 =?utf-8?B?a0tnZnAxVXZRVlBXYWhzQkdMMEVZdzZnM1NlcklxK0ljb2hORzEyeUpueVhC?=
 =?utf-8?B?YUoxMjF1WGVNbFRTOXZkd3V3Tzg2dDJBaHhXVGFjeG0yN0dZcnNUTW92YTBj?=
 =?utf-8?B?V0E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f0f123c-a292-446e-d263-08de22ba8fa7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 13:43:00.4129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O6RJWKCzQZmLl1BTvsJB8MEVqJ05/dTYkyniH9DN9eGbQj54IqO3JDvsz2uK/4Z3xr8/J+v8qOIuynsLvY8+1FX/y36kUNhcGF8aPJrePwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7409

On 13/11/2025 1:34 pm, Jan Beulich wrote:
> On 13.11.2025 14:29, Andrew Cooper wrote:
>> On 13/11/2025 1:12 pm, Jan Beulich wrote:
>>> On 13.11.2025 14:01, Andrew Cooper wrote:
>>>> This is a partial backport of commit 63ebd0e9649e ("releases: use newer
>>>> compression methods for tarballs"), but keeping gz as the only compression
>>>> method.
>>>>
>>>> In addition to efficiency, this causes the tarball to use root/root ownership,
>>>> rather than leak whomever produced the tarball.
>>> I don't understand this part. Isn't the ownership whatever "git archive" reports?
>> This is fixing the issue you noticed about internal ownership:
>>
>> xen.org.cvs/oss-xen/release$ tar tf 4.20.1/xen-4.20.1.tar.gz --verbose | head
>> drwxrwxr-x andrew/andrew     0 2025-07-10 12:28 xen-4.20.1/
>> drwxrwxr-x andrew/andrew     0 2025-07-09 14:57 xen-4.20.1/.github/
>> drwxrwxr-x andrew/andrew     0 2025-07-09 14:57 xen-4.20.1/.github/workflows/
>> -rw-rw-r-- andrew/andrew  1362 2025-07-09 14:57 xen-4.20.1/.github/workflows/coverity.yml
>> -rw-rw-r-- andrew/andrew    96 2025-07-09 14:57 xen-4.20.1/.gitarchive-info
>> -rw-rw-r-- andrew/andrew  9668 2025-07-09 14:57 xen-4.20.1/Makefile
>> drwxrwxr-x andrew/andrew     0 2025-07-09 14:57 xen-4.20.1/stubdom/
>> -rw-rw-r-- andrew/andrew 24220 2025-07-09 14:57 xen-4.20.1/stubdom/Makefile
>> drwxrwxr-x andrew/andrew     0 2025-07-09 14:57 xen-4.20.1/stubdom/grub/
>> -rw-rw-r-- andrew/andrew  2252 2025-07-09 14:57 xen-4.20.1/stubdom/grub/Makefile
>>
>> xen.org.cvs/oss-xen/release$ tar tf 4.20.2/xen-4.20.2.tar.gz --verbose | head
>> drwxrwxr-x root/root         0 2025-11-13 09:51 xen-4.20.2/
>> -rw-rw-r-- root/root      4781 2025-11-13 09:51 xen-4.20.2/.cirrus.yml
>> -rw-rw-r-- root/root        97 2025-11-13 09:51 xen-4.20.2/.gitarchive-info
>> -rw-rw-r-- root/root        30 2025-11-13 09:51 xen-4.20.2/.gitattributes
>> drwxrwxr-x root/root         0 2025-11-13 09:51 xen-4.20.2/.github/
>> drwxrwxr-x root/root         0 2025-11-13 09:51 xen-4.20.2/.github/workflows/
>> -rw-rw-r-- root/root      1362 2025-11-13 09:51 xen-4.20.2/.github/workflows/coverity.yml
>> -rw-rw-r-- root/root      7035 2025-11-13 09:51 xen-4.20.2/.gitignore
>> -rw-rw-r-- root/root       798 2025-11-13 09:51 xen-4.20.2/.gitlab-ci.yml
>> -rw-rw-r-- root/root     15298 2025-11-13 09:51 xen-4.20.2/CHANGELOG.md
> I guess my reply was ambiguous. I did understand that's the effect, but I
> wasn't able to tell why such a difference would result. It's all "git
> archive", before and after the change.

Ah.  The first git archive does the right thing, but the result gets
expanded into the regular filesystem and takes local ownership.

Then, nothing is merged, and the result is re-tar'd using:

GZIP=-9v tar cz -f $xen_root/dist/xen-$desc.tar.gz -C $tdir xen-$desc

which retains local ownership into the resulting archive.

For 4.19 and earlier, I propose to add '--owner 0 --group 0' to this tar
invocation.

~Andrew

