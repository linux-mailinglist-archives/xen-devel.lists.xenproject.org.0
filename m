Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A59FFA48300
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 16:32:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898250.1306835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnfrv-0004my-UO; Thu, 27 Feb 2025 15:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898250.1306835; Thu, 27 Feb 2025 15:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnfrv-0004kU-RW; Thu, 27 Feb 2025 15:32:11 +0000
Received: by outflank-mailman (input) for mailman id 898250;
 Thu, 27 Feb 2025 15:32:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymMN=VS=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tnfru-0004kO-U2
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 15:32:10 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2416::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01771964-f520-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 16:32:08 +0100 (CET)
Received: from MW4PR04CA0041.namprd04.prod.outlook.com (2603:10b6:303:6a::16)
 by PH7PR12MB8594.namprd12.prod.outlook.com (2603:10b6:510:1b3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Thu, 27 Feb
 2025 15:32:01 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:303:6a:cafe::ee) by MW4PR04CA0041.outlook.office365.com
 (2603:10b6:303:6a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.21 via Frontend Transport; Thu,
 27 Feb 2025 15:32:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Thu, 27 Feb 2025 15:32:01 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Feb
 2025 09:31:59 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Feb
 2025 09:31:17 -0600
Received: from [172.31.223.240] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 27 Feb 2025 09:31:16 -0600
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
X-Inumbo-ID: 01771964-f520-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qk8QpzXceadSdA7o0cGWhnRaGArfecSppharQRXTHWTxm2dzUdGadpzRUHMYCxBzKVIelMJhnlJoNPWUcoiylYJ1FlTx6iZblwcnf7vlSUujYUBQzPsWs9/YWS6jmyBg/TvCbXK7PVm3JhNwzS66vx9pH3b+SjWTyeU1dkQDTGgBexba78MQWX3wDtJHlg0n2jXMT/laWlOgUYAUyewmiJFG1UXycfokORATebsCTvg+C9n6dHoRQFWyvUQY9S1MWPfH4DU+s8aDc6+MXssTMTyRMheUEas8lU1r7ZRINujJ3DDbQHqJAn7046g6v9bkiKvlnryylidhXMkmG2v8oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nMM1yqvMNfokV5I8KePf2SbPLDoME1nwtdBMKk5wmY=;
 b=PieLisN/NNDvcRDyiaI0R0/ycosfX+9PM0GUooX2Jej/Cu1TBgTGg0N3BeHM2LFsbVWDhQBgTJT+jlXUWCKIAKGoMJK+5sf8FKaFsBItq67GqQb+CPBdwjGWDdMr+4htpEEzqXfJ9Xxy+wMqdo0cdMltugT4PQc+eOxr4lain9RC9foYC67D80Egfju/ZigDhqNVyzib8Z7rhJGaBODomxjluxLNl/kB4cxxN0wj7zD30mwN2ghLpn7hUG8TeVa7sP3O/aCiZL6+bV4kT9HcheT4F3+gyGDx3Sc0aLITzjf1KwIGuqezq5u88e2lcMJCgMoSwdWzAJ//ct/4TtVBzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nMM1yqvMNfokV5I8KePf2SbPLDoME1nwtdBMKk5wmY=;
 b=OkCQuVNkm0MuUnuVvj4Yk8JjFTohM/i3ISyNWGxjQ1j0uhS4iGmcxa/W2jSS0yW3ROZbo0VZY4SEyHpx5/6yYd4h6BI50WHAva/MwvVfIvkM5U1uNoROrT9dWzrhsKfXT+0HE13aqeTzRQHIJjWAtuTXnF5X6k9qRStzyXe/E/g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8a046a27-c0bc-42ec-accb-17a36135563f@amd.com>
Date: Thu, 27 Feb 2025 10:19:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/pciback: Make missing GSI non-fatal
To: Jan Beulich <jbeulich@suse.com>
CC: <stable@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui
	<ray.huang@amd.com>
References: <20250226200134.29759-1-jason.andryuk@amd.com>
 <22a46f43-d60c-465d-9ae7-4d84ca9108d4@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <22a46f43-d60c-465d-9ae7-4d84ca9108d4@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|PH7PR12MB8594:EE_
X-MS-Office365-Filtering-Correlation-Id: 45f243da-50a4-4da6-ce12-08dd5743e15a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVFwR1ZKNnNUYjVnMXBTTWl5SURHVUhiNTFpM1I3bUQ2MVRWNm56MWgwRnNl?=
 =?utf-8?B?OTR6ZmpTei9Wd1VkUEU2VWxXcmlFMDAxTVlISEVKMU8zeE9SM0hPeTcvcnNj?=
 =?utf-8?B?aGF3RGh1Z0xzSFZpOTVSbDIzRWo0S0pGYlUwbVZvQ0VpV1RENVJmbmxsTmJl?=
 =?utf-8?B?ZmU5MlhJUU1KajNXNzNLZlJwVllJbnlEZ0FCWFlXcGpZUjdXYUVWQ21oMjVV?=
 =?utf-8?B?VDJMeEtUeEwvdWxNRlp3bHo2T3Z3OHRwamJ1cVJoUjZvTUVmV0k0cTVXQVV1?=
 =?utf-8?B?cGpycy9hSjZldDFIY0Q5SFlTL2grejhiVFVzd3JlVC9CVUxzbW9Rb3R2OHEw?=
 =?utf-8?B?eGo5YzhDU2M4Um1JQ2NFQldueldHTWU0ODd2V0hnL2FveS9qYWxqc21Lakk4?=
 =?utf-8?B?ZU4vODhORHpvbGNRaDJZaWx3OVc3VWVoVk9mTEFSMnFycHdkWitPMXZ2UVVH?=
 =?utf-8?B?aWJRMHQ3L0Npdjkxd1c0bnpUalp2YVdlU2JMU2RRaUJqT3RKRU1XSFp1YjdY?=
 =?utf-8?B?SVREdTJUWU90L3dyWUo1N2hoWUVRUHlpMDVhY1RtRmt3QTJzbjhpUzZuQm1L?=
 =?utf-8?B?L3NpR3NsZzVlT0h1YVFBNFYvTE9xa1ZvSTYwNnNwa3M5cEk1Q0Jab2pmdW80?=
 =?utf-8?B?VkYyU211QXplbUxuWlFiYWsxQk8vdkxYRFdEN3ZvbmdHcnFhRklWU3hYNXJZ?=
 =?utf-8?B?RHJvS202MlBiZ1lRLzdDWjFUY2NCdGdtcWFHZG9sR1pHUDc3SXJ6SndFbDVR?=
 =?utf-8?B?YTRyV0NFaGw3cUVRWXFoRFNESkxub1kwclNnbWhiZE1acUZEVThkSTI5djYr?=
 =?utf-8?B?OSs5TGUxY1BQQzdqVVR6eHpucFNZVnBZcXRkV0lBSDZob1NWM3JhMzhFNWRx?=
 =?utf-8?B?bll1TUhRNXNrR0t2OEUwVDRTbGZIUTVCQ3RzMFJBRUZrTG5TWGFnL3pMbExs?=
 =?utf-8?B?cHZnZ0RVUmQ1bFBsM3A5MFBOeWFCcVpBUGd6OGNoekJXOTFOZW45ZmRjTXhq?=
 =?utf-8?B?NDE2Y0xqQkZhQU1ZZXlCdUh5blJlWmhSZS9nUE9JbCthaTJwOEViRVZranpq?=
 =?utf-8?B?MDVTN25LNnFlbm9WczBBSnR4SzlXTHFnR0JqeS8zQkVMWlVZVnVaRDZjTzRJ?=
 =?utf-8?B?WkV0K280OGhkenh4LzlPOWVvYjBmZGw2MlV2L3Q0RmlPMkJncXh6OGNUcE1B?=
 =?utf-8?B?U08vUUVTeGc4WW0vSGhFR0tvM2Z1M1BPMnc2QklSTGlRV2JheWkxN0NKMFpP?=
 =?utf-8?B?NHlrOG1qUzJuclhJaFgvbjU0czNCSzA3RDNnaC9qT3FVd1YwTTZibTBQVmtY?=
 =?utf-8?B?Nk1Nd21taXdlUWpRZ3dXeHZtYUtHcTk4aVNTdUxYUTVMR0NHMFZWalhJb0tS?=
 =?utf-8?B?UVpubHJ2NitwQUw4VUlGMlNpYmFVaTlYLzBneDNCRWNXZk4vL21WMEY0RmF2?=
 =?utf-8?B?d3QzUTlEWEt0S3Y0RkNkaEtTYm01ampuNmFjQXRGTGNhSWE2QnlSUWE3STlk?=
 =?utf-8?B?RXVOaDNBZFduUDBGdUVTUnVVNC9KNjRCQmZzTDdQWGNvWVp2eEE3c1MwMW54?=
 =?utf-8?B?MlJyR0pkU3lOQ3FlVVJWUzJDS3hNTWUvSjVud2NwdklwZlZhcDBHZFZ6NmRw?=
 =?utf-8?B?UGtCN1creWVpaWVFZ3hJeG1sZ2Y0YnhFMFExaW9CKzJNTzh4VGovR1M4TEVm?=
 =?utf-8?B?RzI5ZGhhUU1nZkdkQ2UzQTJCTC9td1lLUUNXMmZjR2g0Q3N4eEszQkpiaVMy?=
 =?utf-8?B?Vzc0RzFhaG5QVDB0dkdvOFhjWkY3OXlla2wyMmx1QzVrdUJhRmluOWpIZXIw?=
 =?utf-8?B?dklaU2xXTzZDUlVuM005UnVPYWsxclZsL1poL2lVOHQwbVA1cmhGbzhvT1o3?=
 =?utf-8?B?Ty9TbHkzUmZzQzVPWHZ2dG9qT1B2TUFwOTRLWlp4L1UrZ2g4QnBpWlljd1RQ?=
 =?utf-8?B?R281Z3FxcnlNL2d1YmtWK1VxVlA0WlhnaitwQzhsSGhxMnhxMmVCU2sxMDJ3?=
 =?utf-8?Q?7X1JIjJexLBvB6jaGRVUciSu6K7tls=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 15:32:01.0165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f243da-50a4-4da6-ce12-08dd5743e15a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8594

On 2025-02-27 03:23, Jan Beulich wrote:
> On 26.02.2025 21:01, Jason Andryuk wrote:
> 
>> --- a/drivers/xen/acpi.c
>> +++ b/drivers/xen/acpi.c
>> @@ -101,7 +101,7 @@ int xen_acpi_get_gsi_info(struct pci_dev *dev,
>>   
>>   	pin = dev->pin;
>>   	if (!pin)
>> -		return -EINVAL;
>> +		return -ENOENT;
>>   
>>   	entry = acpi_pci_irq_lookup(dev, pin);
>>   	if (entry) {
> 
> While I can understand this change, ...
> 
>> @@ -116,7 +116,7 @@ int xen_acpi_get_gsi_info(struct pci_dev *dev,
>>   		gsi = -1;
>>   
>>   	if (gsi < 0)
>> -		return -EINVAL;
>> +		return -ENOENT;
>>   
>>   	*gsi_out = gsi;
>>   	*trigger_out = trigger;
> 
> ... I'd expect this needs to keep using an error code other than ENOENT.
> Aiui this path means the device has a pin-based interrupt, just that it's
> not configured correctly. In which case we'd better not allow the device
> to be handed to a guest. Unless there's logic in place (somewhere) to
> make sure it then would get to see a device without pin-based interrupt.

This is actually the case that fails for me.

05:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. 
RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 06)
         Interrupt: pin A routed to IRQ -2147483648

Interrupt Pin is 0x01, and Interrupt Line is 0xff

I'll have to check the existing code to see what it does.

Also, thanks for catching the commit message typos.

Regards,
Jason

