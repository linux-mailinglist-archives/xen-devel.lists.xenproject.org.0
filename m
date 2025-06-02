Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AACACA99A
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 08:54:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002776.1382171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLz3s-0006JZ-A8; Mon, 02 Jun 2025 06:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002776.1382171; Mon, 02 Jun 2025 06:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLz3s-0006H0-71; Mon, 02 Jun 2025 06:54:20 +0000
Received: by outflank-mailman (input) for mailman id 1002776;
 Mon, 02 Jun 2025 06:54:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yeyf=YR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uLz3r-0006Gs-8E
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 06:54:19 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20626.outbound.protection.outlook.com
 [2a01:111:f403:2416::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66443776-3f7e-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 08:54:16 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by MN0PR12MB5713.namprd12.prod.outlook.com (2603:10b6:208:370::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Mon, 2 Jun
 2025 06:54:11 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 06:54:10 +0000
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
X-Inumbo-ID: 66443776-3f7e-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W9xFAWaBzy0hhzVacfDY9G1vxWyDLALYxTznFaSYOrVNba+jpUq347cwlUEiIvw+8iQT3nO7mCy/NEM999MBVygidQdkKFuuK5KXyCGrx5VUOsEEDcg94x+4kKaiU0xjLXm1LCzvKuBg78lNNsDP88u+wklM+aC860WeaH722LZ/TqiA4YriYAqCYTVztN5hBNRTN+PHFGsqSge33Hy79OPBg1K78ODEo2SPi9BifVRM1atIDxadKrDf75fAjOCZzmPKRdwfUBjelvNBcBBYkXlMRBT2CMVcSRBzfV/Q7FWN+0/YeAUxK4cCi4PCy0VTxLC5JzWPGDTwuQuI9RFKUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBAgPyn6HzTm/4YpoVVOEcj5/JuxWsqz64rHlPDUomY=;
 b=DSh/upPBQj6iF94N5u1hzRmn2+bh0A8wktKb/QW9HV7/2VBVyz7dQl0QRCe9vECq60UZtlDYFmGWEQ4QTBeNW1f7vdGObmno4E+W5oSGN8BProfkwzcK64SZTR8nxIVwbpH6H4vw7d+OTDsNC7TRmC37oJDxAcPuhEwie0lKG88bJP3Ty6W+jwgQTsC/VKhOqZoLI+fwBTT8+V7eFLtCD1zOx0kr3Eo86jX4H1vD6XVJPi5TaCPvScfFxs7jdWRlIEgv8odqvHEGElotVCdZqzenPpZqT+caP6oOzebYrw2TL5y8hHHpWiEovZF+op2tpUuDLEzWBe6V7kmmjJL1dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBAgPyn6HzTm/4YpoVVOEcj5/JuxWsqz64rHlPDUomY=;
 b=T3sKPwr0/SY5bV6IlorGmqlZi/gs2es1FIHLVNVENzNwiT0gWPgOa9cYEeTdtJEJjbr2qffHNEIygMcPYgz/syBMQgZXz0KCp96I35VBU3wp/N0yu3TPgaCTRuPhPLuNZOxDRDXWAAsC2bXOcIx02zBYtaCx4aev/DMz4jG0Zaw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <01c5ad19-2add-4270-948d-ecdf3d5e8bd6@amd.com>
Date: Mon, 2 Jun 2025 08:54:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm/vgic-v2: Fix undefined behavior in
 vgic_fetch_itargetsr()
To: Jahan Murudi <jahan.murudi.zg@renesas.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250601163212.2988162-1-jahan.murudi.zg@renesas.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250601163212.2988162-1-jahan.murudi.zg@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::20) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|MN0PR12MB5713:EE_
X-MS-Office365-Filtering-Correlation-Id: 1017dfd2-48b6-42e8-b07c-08dda1a2464e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TzFHNFhNMmlySVA5UU1ZaXpqUWpuQzArci9mVUVPMmtzQVhMMGJZNmNnSTVQ?=
 =?utf-8?B?a295UFV0bGY1NEczUDdvUC81MGxjVWtBcldRWFk5b2YyZFlSd0JPWUJ3L0lC?=
 =?utf-8?B?Zm9hRWg4dENTY3A0SktINkFhc2w3dFI2QmhieEFxNDJGMFRSZjB1TFFYMkJn?=
 =?utf-8?B?bllxM2M5Z1RFajdyVmphanl6SGhGM2pLaDdWRGpSQmVDc0N2ekVVSWJpdWhS?=
 =?utf-8?B?TEplU1ZRK1laWWx1MC93RWFUWHdCWk8rODRVYWU0QlFIcEsrUHlNSDNhejVR?=
 =?utf-8?B?eXJWMGx4MndoVjdHMjRxZ2NzUGtyeEZKZkR0Rng4U1g3dkRpV0RtUWtyRnlQ?=
 =?utf-8?B?ZkRTTWZFZjUrc3VXYUR6SGNGenJEcDkvZ1Uzc2YwejJMYXg3eHQ5NUFWZjZr?=
 =?utf-8?B?ZHpLWUdMWXJTeWNZSVI2cUlqaDR5WG01ZHgrL1ZOaHA2a2JyWVU2OCtoSVdj?=
 =?utf-8?B?RkpuZnBmaXF0eWlPckx0VnNsdlV6TnRBcStWTk9NWDRONWZsYVVJNENTSnl2?=
 =?utf-8?B?SlRkaW12Ymo1cGRaLzNaQ2JhdWg4QTJFdGxIc3NXWGFBZkU2MUswVkFKcUpE?=
 =?utf-8?B?WTNEeFhxWXBTRGZRUFB1SXlNMEtFQ2hiT3FQYVNTSnYzalZFWDBmTC9qUjhY?=
 =?utf-8?B?NGptejRvSCtPSlFFbVo5SU9IRlo0QTlyL05NVUNVYWU2VTVRLzZsTS9qOUJ3?=
 =?utf-8?B?a1B3NlB1aHllSTNPWVJFTEZKeUV3Yy9DbzBVSmlPa05oeTNEUzNYTFlqWVlz?=
 =?utf-8?B?bnNlMlpZbFFIem0yS2l2cVhNU3VodCtSMksxN3gzS2RMNVJVZnFFL3BWb3pD?=
 =?utf-8?B?d2lTYVcvU0U1NEhhSUgrZnZaOFRXWi8xQS9BSmxxcmtuQTlEVGpieXpPYXZM?=
 =?utf-8?B?ZEFKc3dKclVvanE0WE1HV0dTWDhmZFBKRHBOdENaYU53ZFJvY0pZQ0JCZFYy?=
 =?utf-8?B?VURsZmFxK0tZRy9lS0ZzK2QraXhkdFBNc2hoeTJOTUU1aTFzNloxMjEvM2dn?=
 =?utf-8?B?b3RERjFkYnNiemxFSDl6RHNqaVI3VGZuNk00NERRRDNjeTd1YldsRkFQZU1F?=
 =?utf-8?B?MmdRaUVldnJIVUpRSDF5bno3SDI1OCtnOWV5NjJ0Qm5DSHgrY1Y3MW5LQkx4?=
 =?utf-8?B?d0NDTmsyMmNDT2ozQzRrQjRadlE3V2JMQkRrRS9HLy9FUjhRWkhhM2VYNGJI?=
 =?utf-8?B?b0pUVXBwRXVIKzhWZGZTbkJwKzRJZ05wZ3VUUEYycDdKNFNzYkp5MU00MHBU?=
 =?utf-8?B?L0pWa091SGJKQVhTbGtuelZNS1B4WGxLTnBmOTM0S2dhWG5ibHQ5UFpRTmk4?=
 =?utf-8?B?cEIyQisvTzZXN0MwK3ZhMTUwWlErUENpamhyOWRRdStsUUdtQVdBZ1MzUExm?=
 =?utf-8?B?RW5WbXM2VW4wbjJ3aWtPMlM1UWV5NUt6Wk1vUklBOW5ram4zNVJRMjNPaXF5?=
 =?utf-8?B?TGtnRWovUlhZMy9na2N3OTNpcFpDT0VXSyszSVZXTm02NzR5ZDZDWGsxOWtk?=
 =?utf-8?B?dUgydFo1TXNkTzlEREpzb280d0xnOWVQdmdoNmNJQzJtVmVweWFEb0liMzZn?=
 =?utf-8?B?R1NHbnN3cjExV2xRSEg2SjFZc05HR25nOXlDZXFja3JCWFFDR2RGRzVEZGJz?=
 =?utf-8?B?bDJ5N3NRT1VaMWY0VkMxbVZRU1BxdEtNamhKWllLUnZlbUFjK1NHTlBOenJ4?=
 =?utf-8?B?WU5jY2JlWmlxWDFiVnNNWU1lWGpUaEdGTGlHRDgwZFVFall6Rmw5MTdEU0M0?=
 =?utf-8?B?YmdrREVSU3liVy9rTjNQOVN1L1AreXg5TjJnY3FiZHpGQi9DTE1xM2Q5NW5r?=
 =?utf-8?B?eE1NWHFwdEF0OEdaZ1RqbEZMdzh1NUsrcmg0L1lsalN2bElaSll3enpXTi8z?=
 =?utf-8?B?TmJ0bUpFU1JkN2FnakZUV2VQcXpCZU9RdEVORGxmVnF3ZHplMmhVa1RpVU5B?=
 =?utf-8?Q?T8yweKOEDWI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S09iT2NCMWRkVEY3bTlCWHZsemo5N1J6YTc2TURnSTdXbE9OZ2k3eHR0cEVI?=
 =?utf-8?B?VW9HK2xlZWhIeW9VdTJqTGNTaU5RNHgzaGFhT0I1TmpWNzF0aytEaHJXdi9J?=
 =?utf-8?B?YjRMYjV5dW4vNStuRUUyTzlMb1V5NmpHNWxDZTNheExyZUdHY0wyRmF1U01K?=
 =?utf-8?B?OGxZWUw5V0QvK3J3Y3VuRUlpaWhLWFZJL2JubTBNUm5ROE1WSjQrbTZrQy9F?=
 =?utf-8?B?OVBaOEd5UGtpUDFZRC9EVjgxN3FUNlZqRGxQVHoxaDBVUU1DVHBtTjk4UU5z?=
 =?utf-8?B?aElMejFPVjBuVWM5N29uMDI3ZUduSS9tQ3VKOUZKUDNIZkptQ0hyM3BpZTdF?=
 =?utf-8?B?NHVjODVLdUZsb2pkcGNudzBNeThNbjRLQmtXNWRqMTRLKzdJTW9PZEx6alMz?=
 =?utf-8?B?MEFXUFovNHVWbXJtS00yR3NvZ2srRm9hWWpMWXovWjFaSmNYNlExWDJpK21s?=
 =?utf-8?B?ZTdZRzYrWW9RUXZqMnh6Ym5jQ2d3YTc1ZUI1VEh5U0huT0I3Y2dlbFFqQ2lN?=
 =?utf-8?B?RHZJMlE4NzBFZlVRdW55RnhoSHIrelZ3cDZDU3pzVVhwUktQVDlac0wyb3VH?=
 =?utf-8?B?VUZWQi9sWjJEc1Bhb09odEFPanhGZDNyb3ZJcVdvV3RBWStqUndzUThMVTJi?=
 =?utf-8?B?eDVDVHZmVEw2OFppbmJJbjhOWTBTQk1xamZqS0JKU3ArdW4ycDZUVmtlaTlp?=
 =?utf-8?B?cTdXNHRSRUpkTnh2TkwwWUllMjZSNHdwcmZlL0tFdVhKRmdTcEpFWjNYMmJU?=
 =?utf-8?B?emNiNGZHS2hWSEFRMHVSMHovNTF2bkVTdmRjT3NCMGJ5WEluSXQvdDFia2tt?=
 =?utf-8?B?RmdiU2llSFgySW5CWk1NUEMrQWozRlpZNldJK3EwLzJRbUh1cDJwTXpqcUVY?=
 =?utf-8?B?TUhJUmFXN0wrSGF0eHl1TkFPcE1qWnlwdlN6RkpkLzZrRTE3VHhiS3VJdzd3?=
 =?utf-8?B?NXFTejh4U3dsUUN3V0FuLzNUY3cwakZndnFFSUNZYWVMNFdxSjJXNFdkYmpw?=
 =?utf-8?B?czY1UDZyOGYxZG1LUnNDZlRwcW00TmxEOFlMNE9wTjI5bDYvenZscklsUjRv?=
 =?utf-8?B?SkNYNE45R0JMcGZ1WklHaHZxazByK2FsL2lUTm1OYlhjV0x0L1R2TTR2dDh1?=
 =?utf-8?B?UUVVMEVVVWZpUklCaHV2MkNpbnc5V1E3U1lnK2RHR25uaVBVcnh3WFZUK1Ux?=
 =?utf-8?B?T043dU8vNTJnZTQremNsQmJ6SFdhNTlrQ3FsejU5VlR0bmNwK3hGYlAzbXMr?=
 =?utf-8?B?MkZ4QkgzZ0Rxb3hTRnlkVFpveFYvL3FmTEZtejNYMDZCZVd4ZlMrQlRCbEVz?=
 =?utf-8?B?eU1DR20yNTMrM1BNQWR1Mmt6K3J5UXl3R2xvTTdXUzR5WWhJYVplRExVRS9Z?=
 =?utf-8?B?UWV4VWZNOGt1VTA4blpPTmhzaGZBODBodm9tM292NGwzLzhPUmswNFFvZG9P?=
 =?utf-8?B?cmIxNnhMaGxwQUZyT1lCZ0pBZnExUHZMZ01IUVc5V01XRzN4NXFtbERDNm5W?=
 =?utf-8?B?ZzA2cTN0bThLc2dZWjFYY0NmWU9RdVdQdFFnR25UMTNIUTgzSTdCcDlwQUpw?=
 =?utf-8?B?ZWE2ZHl3NmM3bVczMGllUy9xOUJ6VEg0WitwcW93T2Z1N1Q4ZHdvbmJMd3pG?=
 =?utf-8?B?SlNsZk1NcnFYMDhkL0VxcktpaDE5U0JTRldPd2NmMGZSaEgrZit0Tjc5YUIw?=
 =?utf-8?B?TWRiVFowLzV0aksxUGM2aE1tSGNQaXcyQ0s4aDgyZlI3RkNCS1Z6ZUoxemw0?=
 =?utf-8?B?bkVRWkd0bWd1K2lsQXNLRXZ2WVZKQkg5OGIxeEJuVFlBbXNUblN0NmNiTzFs?=
 =?utf-8?B?U0xwdUJ2Rm1kUmJ1WGxuQnRLM25TYUpmR1kvVHA4Z3dTMUpOaEZySUc0OVE5?=
 =?utf-8?B?aFJjWHo0QzYxaytuKzZIOVJza3Z0VVdwcW5EeGhtRWZTaXRtQ0U1aTBReGJj?=
 =?utf-8?B?NkRyQzl4VzFCQnd4YW1UajJ3NC9PaUFZa3NjR1JMZ1hIZjRhejYzbXBYRnJM?=
 =?utf-8?B?WlRNVnQ2dzBySzVYZ1h1RTc1ZFl1ODBMZ05YRkJvdVpnNWlsRlFCbGJsVXZX?=
 =?utf-8?B?c29LUmVKRnZiczZmNUNkZlg2Z1luNDhtY3d5STVoc2dVcGNFNEhieGlqV0NS?=
 =?utf-8?Q?SA4s=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1017dfd2-48b6-42e8-b07c-08dda1a2464e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 06:54:10.1245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3N1yREqgUYzZobNh8Q9e58SmLDMWnaqgeqt9E0SgrMq8hF5IoPKGd0t1vLNIPkYr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5713



On 01/06/2025 18:32, Jahan Murudi wrote:
> The current implementation performs left shift operations that may trigger
> undefined behavior when the target value is too large. This patch:
> 
> 1. Changes the shift from signed (1) to unsigned (1U) to ensure well-defined
NIT for the future: Use imperative mood

>    behavior for all valid target values
> 2. Maintains identical functionality while fixing the UBSAN warning
> 
> The issue was detected by UBSAN:
> (XEN) UBSAN: Undefined behaviour in arch/arm/vgic-v2.c:73:56
> (XEN) left shift of 128 by 24 places cannot be represented in type 'int'
> (XEN) Xen WARN at common/ubsan/ubsan.c:174
> 
> Signed-off-by: Jahan Murudi <jahan.murudi.zg@renesas.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

> 
> ---
> Changed since v1:
>  * Added space after subject line
> ---
>  xen/arch/arm/vgic-v2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
> index a19d610178..642407fd5b 100644
> --- a/xen/arch/arm/vgic-v2.c
> +++ b/xen/arch/arm/vgic-v2.c
> @@ -70,7 +70,7 @@ static uint32_t vgic_fetch_itargetsr(struct vgic_irq_rank *rank,
>      offset &= ~(NR_TARGETS_PER_ITARGETSR - 1);
>  
>      for ( i = 0; i < NR_TARGETS_PER_ITARGETSR; i++, offset++ )
> -        reg |= (1 << read_atomic(&rank->vcpu[offset])) << (i * NR_BITS_PER_TARGET);
> +        reg |= (1U << read_atomic(&rank->vcpu[offset])) << (i * NR_BITS_PER_TARGET);
>  
>      return reg;
>  }


