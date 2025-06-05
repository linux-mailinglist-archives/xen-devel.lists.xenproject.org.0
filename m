Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 597DCACEAA4
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 09:07:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006318.1385509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN4gr-0007rV-It; Thu, 05 Jun 2025 07:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006318.1385509; Thu, 05 Jun 2025 07:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN4gr-0007p7-Fr; Thu, 05 Jun 2025 07:07:05 +0000
Received: by outflank-mailman (input) for mailman id 1006318;
 Thu, 05 Jun 2025 07:07:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Otu/=YU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uN4gq-0007p1-MM
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 07:07:04 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20627.outbound.protection.outlook.com
 [2a01:111:f403:2413::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a92c5011-41db-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 09:06:55 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS0PR12MB7725.namprd12.prod.outlook.com (2603:10b6:8:136::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Thu, 5 Jun
 2025 07:06:51 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 07:06:51 +0000
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
X-Inumbo-ID: a92c5011-41db-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOJBAn7/H15Pa8rQ7Xs16Uytuv8wwPvO3Xv4N2FW59iJpvq46cXsncQ9V4FOjb7PSlIPVEpwuRfKnh2R8hJurTj9hbfSkq/dGhO4TauxpUERN5gBne3A2jv532b5UIJZbzH24MetksgPswEtt09GVMS+UQG9WxklJ9Zz6BWTapHLJuoLBKhXMPINj2bf6F4bFrKsDdH6XhZERJzuouADkHxuibsV8jRb/tXQlpGyEQ/b4+k01XmdFRis53WlKVKAmqYDZ1N/lO4zr0jRasAoogD2owUIlzGexi/AIhPDGNEcU7jcBe6LgUZMvt4viNMYmKQbIjYUTXWUHe8f2APJOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sarXzygds8mxl0ouTU6R4fDfRq9JNcq2nePTgyCoXNI=;
 b=QyqeGAyFvCQ6AGTj+uguf8pULIR/iwJPn/DXeZrP/A67wwpbBHovpvxZOOg8GRrj9aiSDe4G+iY9WyDwS8OpFKKr5g8T1IAvfSGfFB2i1c9gkEaLY3zlyqSBLhZXdFgQ5FW/o9UWe/tKrG1wjJjTN8s57XPuVAZ4PAYkwvnviIT2v4WUGOKQDUqLDXWrhlhfjCiEVCLib3ZmD6Fhd7YkkwT9e0Rc453PnH/ZuknyWTGwuhzGAsqlyHiPT//o3ZjfSFUms5f90DqIu/1InHLqxBeGV6Swz0/H7uiXWb9YLL4sO9LgEdVTIzjv+FVq56ZhQwaMTKkdWjKdHq1FEw/0Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sarXzygds8mxl0ouTU6R4fDfRq9JNcq2nePTgyCoXNI=;
 b=c56A99YN7mF8KLgYx/KMAQeV+kB7k6CT2qmPzYp+GU2fj9+kO5zni84UM1z7cqhcZDV+nemj0v39QVq1DL8Ni/db4tfCKuiZQ2DxnClnNwzfNcgHidk/kO3sYaIU8i20qBCCT1n7qg3FFaYVgODffu7LEmrnLFw8mIyQsrKVaBo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <a2f337f2-1f34-41f1-9728-5f87ef2c7420@amd.com>
Date: Thu, 5 Jun 2025 09:06:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] arm/mpu: Introduce MPU memory region map structure
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250604174311.754899-1-ayan.kumar.halder@amd.com>
 <20250604174311.754899-2-ayan.kumar.halder@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250604174311.754899-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::11) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS0PR12MB7725:EE_
X-MS-Office365-Filtering-Correlation-Id: d1ebf4f7-8508-4044-d9e3-08dda3ff8bcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEdGQm1aOXc0engvQ1RyRDZTMWZUWlJLQzRvOUtLT3dNaW5IQU1WUDVOaFNz?=
 =?utf-8?B?end3b2dJLzNPOWYyZkhJeW9WS3VZUTZkdUJuZDB1dEpGcEtxeGNNWFIyMk4y?=
 =?utf-8?B?bGFVL0RUcittZUpEUVJjSVZiWlJSSlFWdkNJb1JLS2swdVBETmQ2ZzVUWXdy?=
 =?utf-8?B?RzdFY0pCUktacXpaY0s2RzhTZThuZlRZWVhBS2diYUswYjM3dVk1STlLaDRw?=
 =?utf-8?B?K3JzWXRGaUJpTmlyQ1Vqa3NScHhRUTZPOENuSDNjdXo2TThBM29xQ1VPSGFL?=
 =?utf-8?B?OGxvMGM4NGlhb0l3ZU9WcU5mQnhaQnpzTXlJK2t3eER1d0t6YlJYdGVkREZI?=
 =?utf-8?B?T2RkczJDY01tUm1WQlRsTkY3RTU4c0RPdXdFK0Y2K2cxWStjVnFJOWhoYjZ0?=
 =?utf-8?B?U2F5ZGZWdDViMlMxT1lhamRNVVJhb1JnSkhhUkgwK1poUnJYNjdPaGJic3Fu?=
 =?utf-8?B?V2ZjaENSdjc0R0lMbS9GR0syMnQydzRoNFFPSHg1VUVXNlZ0NU1EYmt2Mzlq?=
 =?utf-8?B?eVlhNnBnVGhxeTNpMDRuMldKVzZhSUlqdDAwbDhMeGNreHZBZUtFdHN0dnlD?=
 =?utf-8?B?RkJnQ3liR3ZTWWNjVGVZQjlJTFJVOFg3aGtwYmEwcnhXQjFYc1IzY0NsRkMr?=
 =?utf-8?B?anRtZDZ1bVFnOW1KYlpyN1VCYjRhUTBTNGZOR2FCeEFOYU1BUEs0ald1N1JN?=
 =?utf-8?B?bmNpdExodVBZNDRoWmpPeTFMWXZoWjZBb3N5cUVvU0UxVFBvdTRGaFJLT0h3?=
 =?utf-8?B?aGN5dkdzNWFRalczbXA5UmJsM1I1NllxMkdRTnp0MTJOc3YvRUhjNU02VWhU?=
 =?utf-8?B?UEJPM0l1RDFRa0tiS0c2b0grdExkMUR3RE0xdVoyWTNsOGJTRUN1dWcyWDJW?=
 =?utf-8?B?QjJKMXVjLzFqbExZTVJtVWQ3MDhNdHJuSDBET0lTSFJpOTZFYWpRNlJIUjZ1?=
 =?utf-8?B?OThYSlBacmVCcmdtSGVsWFJwaEYzaEhrbTg4WGZwSUtCZXpIZTJqdkltQmEy?=
 =?utf-8?B?MFV4SFZSWkQxZDhXeExrUThoYmdER1pMWFFmTzNmOVR4MXFRSHVZbEhHQ2NY?=
 =?utf-8?B?YTQ0ZWFYS242NHJVNEtEdWhWTHJoTFRMQlNibTR4YU80UHBFMlpqMk5MNlBy?=
 =?utf-8?B?UVlnZTl4M0VLWkQvRlNWVUIrb0dLcTU4aG91aTQvZFo3eE9qdVBwWk1RcDVy?=
 =?utf-8?B?bFk1WSs1dEU5SE9wMGViYmdSV2RmNTI0d3hYeVRHdWFGRk5TeitlLzJGMnQy?=
 =?utf-8?B?UnJHTi8zOUppVnI2Nmsrbm1NenNmSHU0VitORUFua1UzTWxuSnB3UUxkNDNB?=
 =?utf-8?B?Rmxldi9yMTlRWWRJL1h5cVQ2NVVuVFRZZldqcjdxS1AycElxR21GY2xNamIx?=
 =?utf-8?B?SEx2NTRKdnNLTXg0VWlyOEhCMTdXNmNTbEgrY01uc0lpNXZNMGl6V2sxZ013?=
 =?utf-8?B?RXpsUXhJY0xUN3hFV01WMXhVc0h6Q3N1K2F3TE9wNitId2t6YlhSWG5xV2Vw?=
 =?utf-8?B?QTRKbVFVWjlyNTJJT3Q3VEU0a0c2ZzFnZDFwaVdKYnh2NVNJdGNRSU5pamlj?=
 =?utf-8?B?eGZnazFZczZteDE4SWZyU0kwTEMxYzNyUXVWWjFsblJ1QVFabkhpb0hNOGRa?=
 =?utf-8?B?YXlnTXIxMWxrVVk0MjE2ZHd4Y21BVytabVVpa2F6bGEvTDdrMmVOdVpYUWZt?=
 =?utf-8?B?MXpiZW1iSk5xd0R1WmYwcjNHTXA2SVBlTjIwb2RZTnVRYzhob2pNZmJQczRo?=
 =?utf-8?B?RWZmT1F1aXpiVzVGekN6TnBHZEMwdnRCZllKeUFNMG1nMzB4dm5xK3VVeDRO?=
 =?utf-8?B?UHZUNWlKa0RlTUM4UFpQZGE3UTk4bWNyUktYZGd3bTBPTEpnaTVxbjR1UUJS?=
 =?utf-8?B?Z2w4QmRIMmo2UThpeDhKVnNvdEtUT2ExeWpXVWxJdG1UWVJqajU4QzNjMStI?=
 =?utf-8?Q?0YpvyinA8/c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SG9aemJiSnRKbFNWUjNleHVJZkZOZGUzY2JRdmVleWlpcmdKTFNyQXRjL2lu?=
 =?utf-8?B?VHpvbVI2YUdHeVB1RDhaMmVRa2xQeXJyOStMdEcrN2x2RkpSQ3pEY0J0RWZL?=
 =?utf-8?B?cTdUZmZ2ZGFTU1d1YXkvUCtONEd6R0RNVnlzUGRjV3Y0UVNNUDIxaWRqN2wx?=
 =?utf-8?B?Kzc0bXgvbE9QTnhRVzFhNjRsN2NnUnBZL3JrQUdWZlBDRWd2RGltbGZSdXFn?=
 =?utf-8?B?aHN4NWQzZTVzQWVibG40QXhWcHJZbXRTNk13TWUxMFZNTGZHZTlMaXpWSFR1?=
 =?utf-8?B?Nm5XcmM2alh5MGJYa2Q5TTJHbWFHYmE1YjhJeXI5c09YME5IZW1WM0RSdVQ5?=
 =?utf-8?B?S01jNnR6eWF0Yk9LYTloWFZXM21qTlI4d29UajJaRWg0Q3dxZDRrcFRkVDNi?=
 =?utf-8?B?R3VuUW5udGJkNmxrcWFzbTB1ZXJ4K211L2JmMEkybWtIazhWQzZETkRQcjQ3?=
 =?utf-8?B?QzAyTXJzY3k2aVVrbU9LbXBwaXpoZ0pGNUNBSDE4VUsySTFOZmFKaEVZenBD?=
 =?utf-8?B?MzEzN0ZUVm9rcTNpREI4ZmJyOXluN2RWWjZDbTVWZ0xyV2lOdmxMUFMzMi85?=
 =?utf-8?B?K3ZaUTVMSjNwYmFiRHpObFhVTkhUaDNNaW1pS1dzbGc0NldTSHRnYzBlTVAw?=
 =?utf-8?B?ajJZcHVoa2xEZDFiOWV5U1U4L0p6U1JaM21kbVlES0NDRDVsVy9BLzZ5VnY4?=
 =?utf-8?B?NStaUzRraVM0dDgzTnh1dkxRcStTUE9nbWwxa1NEQitTaEZhMEZtcTVvY2Fw?=
 =?utf-8?B?aE1meUpvaVZidlpRS2FSbmVzcGpORzg1STBySHd0UUdtbDdJbnZrS1FsZFNz?=
 =?utf-8?B?SkF6TmJ1b3FDUW42YnRIa0tucWJhckU0TTRyYll0QUpCL3BPVkNvUCswcjdv?=
 =?utf-8?B?Vm5JaUdQdG9sKzAvK2lSZEJjbGlZMFlza0hDVVVVbm5WRTh1blRQSjV3Qjh4?=
 =?utf-8?B?K2FNOWxpM3cwUGJtY0ZFUG8wQ0ZPMTdnRTB2S0VVNFRraGNhNEtwRTBIeUZ4?=
 =?utf-8?B?Zmk4Y1JianFWZ1Z2QTBOcFdEK0VTZnJmVldiL09ZY3h5NUpHY0hnMEZwN0Mw?=
 =?utf-8?B?OUNla05KcnRWSGhuMll0UVpaaFlmZGsrclBOcXBGUFYvSGdtczhtZFZENCtv?=
 =?utf-8?B?Q2s2S0MvRmRNNmhuNWh0REFHRmhZY0N2MkNhb3RPR0FwZGNLVEI4bzR4ZzZR?=
 =?utf-8?B?d3RtVE41TWZPS2hqcWpRbkJlL1EyNEM2bk1LNlNXZjBYNmlTbmJ6VmN0YndN?=
 =?utf-8?B?dytCVFZMeGNkLy93L2d2RnlwSUo5MzNRUEZPWUI4N2tiN29pTU5qb1dVbXh6?=
 =?utf-8?B?MG11UzB2SjQzZnY2SUFQc3p6V25hRFBaZWJXZkUwRmxKMGY5UEQ5TUEvT1pG?=
 =?utf-8?B?bkU2MitGcWJ2NU1HL2FyajVNamd0U0lBMkFmTi84dW1JdmhWbWxid3NGRUsv?=
 =?utf-8?B?NUFBVE9xcW9NYTFpTHEzVDU2cDBPTjk1K0UxR3R5SjFxRy93dTJjK1c3cG9u?=
 =?utf-8?B?ZUFHZllVdUplNy85UW5pNVJNRG9Wcnlmd0VhdlNlWFB6dHFNUWk5QjBzU0lS?=
 =?utf-8?B?SHVNT3pJNGFTV2ZPUGNMUkpKbkUwRXp3NllXMUtQZGVZMkp4YjNGVFRUclZW?=
 =?utf-8?B?ODB1aTFwVEF0TC8zWC95Yk5XWHNEYzE0MWdmRGVzV05ibUwyWExTbU1pM3hW?=
 =?utf-8?B?Ry8zcHZmZ2NGemREVTltLzVzMW5jWlpCcWZWVFRLa1BFKzV4UkV2ZGpXWDJj?=
 =?utf-8?B?aW9SUHcxQUprdUJYdW9VVk94WEdFcHAzV3ZpZkpLZkhEdVl0UHN1OGJWdGMy?=
 =?utf-8?B?L1ZSRWcyN0xJTzMzN3dlL2NvYnlEZHZKa2VRamRYaEh2QkRRQWZIbE8zOGZt?=
 =?utf-8?B?Qk5rM2ZKcnBoN3VpKzN4YW1VSno2bGVYRnF1YjRjMkZwcnR0WTk3R0s2MUYz?=
 =?utf-8?B?RWVaWGVBSzRxWjFiWW1LY2dmY0lLbU1rcGZKUEl5SUQrem42VCtudlYvSjZB?=
 =?utf-8?B?NEgxVUtrUnUramcwdlh1Vmp3dkdmSTFSdXAwWVppWDU4NmlmMFJDc0JpbW1p?=
 =?utf-8?B?YllTclJQRzllQzdrWENlLzM2VllVTGJLZTFTM21qU0NtQnpwSUhtelNTZzE4?=
 =?utf-8?Q?t9G0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ebf4f7-8508-4044-d9e3-08dda3ff8bcd
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 07:06:51.5814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZyagwOyAFiV/xPOPLxq5xdq7TK8qfXOg8eIkRnoy2W4TnJ0q6JejD6XB9JioQCIm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7725



On 04/06/2025 19:43, Ayan Kumar Halder wrote:
> Introduce pr_t typedef which is a structure having the prbar and prlar members,
> each being structured as the registers of the AArch32 Armv8-R architecture.
> 
> Also, define MPU_REGION_RES0 to 0 as there are no reserved 0 bits beyond the
> BASE or LIMIT bitfields in prbar or prlar respectively.
> 
> Move pr_t definition to common code.
> Also, enclose xn_0 within ARM64 as it is not present for ARM32.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>  xen/arch/arm/include/asm/arm32/mpu.h | 30 +++++++++++++++++++++++-----
>  xen/arch/arm/include/asm/arm64/mpu.h |  6 ------
>  xen/arch/arm/include/asm/mpu.h       |  6 ++++++
>  xen/arch/arm/mpu/mm.c                |  2 ++
>  4 files changed, 33 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
> index f0d4d4055c..ae3b661fde 100644
> --- a/xen/arch/arm/include/asm/arm32/mpu.h
> +++ b/xen/arch/arm/include/asm/arm32/mpu.h
> @@ -5,11 +5,31 @@
>  
>  #ifndef __ASSEMBLY__
>  
> -/* MPU Protection Region */
> -typedef struct {
> -    uint32_t prbar;
> -    uint32_t prlar;
> -} pr_t;
> +#define MPU_REGION_RES0       0x0
The name of the macro does not make a lot of sense in AArch32 context
and can create a confusion for the reader.

> +
> +/* Hypervisor Protection Region Base Address Register */
> +typedef union {
> +    struct {
> +        unsigned int xn:1;       /* Execute-Never */
> +        unsigned int ap_0:1;     /* Acess Permission */
If you write AP[1] below, I would expect here AP[0]
Also s/acess/access/

> +        unsigned long ro:1;      /* Access Permission AP[1] */
> +        unsigned int sh:2;       /* Sharebility */
> +        unsigned int res0:1;     /* Reserved as 0 */
Here your comment for RES0 (which IMO could be just RES0) does not match...

> +        unsigned int base:26;    /* Base Address */
> +    } reg;
> +    uint32_t bits;
> +} prbar_t;
> +
> +/* Hypervisor Protection Region Limit Address Register */
> +typedef union {
> +    struct {
> +        unsigned int en:1;     /* Region enable */
> +        unsigned int ai:3;     /* Memory Attribute Index */
> +        unsigned int res0:2;   /* Reserved 0 by hardware */
this one. I don't think you need to explain what RES0 means.

~Michal


