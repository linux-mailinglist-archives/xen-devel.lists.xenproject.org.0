Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DC1A810C5
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 17:54:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942488.1341624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BHH-00045C-QE; Tue, 08 Apr 2025 15:54:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942488.1341624; Tue, 08 Apr 2025 15:54:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BHH-00042c-Nc; Tue, 08 Apr 2025 15:54:19 +0000
Received: by outflank-mailman (input) for mailman id 942488;
 Tue, 08 Apr 2025 15:54:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wQ/n=W2=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u2BHG-00042W-Df
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 15:54:18 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062d.outbound.protection.outlook.com
 [2a01:111:f403:200a::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8e9196e-1491-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 17:54:17 +0200 (CEST)
Received: from PH0P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::22)
 by IA0PR12MB7578.namprd12.prod.outlook.com (2603:10b6:208:43d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 8 Apr
 2025 15:54:09 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:510:d3:cafe::6b) by PH0P220CA0004.outlook.office365.com
 (2603:10b6:510:d3::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.19 via Frontend Transport; Tue,
 8 Apr 2025 15:54:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Tue, 8 Apr 2025 15:54:09 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Apr
 2025 10:54:08 -0500
Received: from [172.25.231.87] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Apr 2025 10:54:07 -0500
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
X-Inumbo-ID: b8e9196e-1491-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EALQOqQAfkg8HltfE43i4aQLDwxF6FQGI/9HSoDqwrjAaAno5Bslu2haNNg/OO9MqQMz7N1Rqkz9/cNgJ2CKpFFSRometW7/71P5PUHXDyS6/RK46yBhpGUaWj7SrrIzDydDoB5n2Mf6G54mAAatEJxyk/CI5B4nndzY+UQ6WVWtaH7ezb+6cxn82PbZmA4saqNmh+ys8On/0N/Jbr/EC3YrAqpNfnVRBogaqlzerCrN5V1iIIcHn6djWv7K+5cueGYGMUhTCvRzZ7p2qZaHTuy/juR0YuqpJ+B+a0ZAJ76/ePzwT1GGJly0yQHc+YrhGb3Kdmyd4Ynw90uo/T8LMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oimtqNgEpt+EfMUq0op+T3qOiCU7mQDxhP5+FthfH7k=;
 b=StA2farIfsSLrzV5LLLT0rkp2sjaxmW/8Sfg+21LzBlPPGIfV9ZkzZXTYcNEpCeI/wqqXB7KCK0oYMcKFe2sQswIbrLRnDUG9hyWNapYJqsfPddOq6pbAL5dXu4lUgidXm4QUphxbZND8N+h0zHfDn1qEmRsXTBASQdQghvU5aT4wsZskIhI8XAYIPE4SAhDqYKwJ9j8kdT0jWDV17wxKujWdQlDFVQCwWLOQseaCcNGd173If5lRnbG60uOvJ9sBTj7c7S23CwuI4+CtK4zIaKLgYNuLnKqBNesTLH+NyU8v6CRPDk5VohsMd0ZwtPlWo0v2FZXMM3C0hfSBowl0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oimtqNgEpt+EfMUq0op+T3qOiCU7mQDxhP5+FthfH7k=;
 b=dJ6pMfRSZgNc00HKPOqUEj/g6Arl719YW5pl89dTtx005LZlgURt6VgsnJdmvpAtUU/HltLzOkGIO1uJmVrsQGBjQas94wDKOJr6/Yr0bU3VYAXqd1bKB8xe+FFqPuZo8/3riij3NokSYrx2SNKRUd2Bo3swA0mGGPckDSDas2Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4c06dd95-a4f9-47bd-8249-de7ad5e81a52@amd.com>
Date: Tue, 8 Apr 2025 11:54:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/libxl: Skip invalid IRQs
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <20250407192641.83554-1-jason.andryuk@amd.com>
 <3ddc038e-9792-4eb7-a1bc-3ce0cf3fe33f@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <3ddc038e-9792-4eb7-a1bc-3ce0cf3fe33f@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|IA0PR12MB7578:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c299b66-fe6c-4d0f-56ed-08dd76b59975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?LzVBeVlyWXlsWWlyRmMrcmxHYkdPRi9EMTJzcGFxMFN1ODAxdnhuZkhBeXBZ?=
 =?utf-8?B?ak0rS3A0b2JqRlFhZTNLTDd6MkV5ekVWcmVEeVo5c3N3N2psSkFyMlhBM0lm?=
 =?utf-8?B?UldzcTJBSkczN05hb3Z5VVA3c0toM0RnQ3RaY2tNNnJ2RGE2Y1Z4QWhWQlox?=
 =?utf-8?B?bGdZakw0YTlBb09scE9vSHN6NTh1bnp0SUFabysyMk8vTFR2clRHaStHQUJ4?=
 =?utf-8?B?a0sxN3Z6QmRSZmFkdlhWU3JlbzlQR2s3WnZvczBGTzB5OXRBN0lTb0VVRith?=
 =?utf-8?B?RFE3UDFYQ3UwNVdlcmlPVUhRTWNxTFdHbE92cjN6T0VST01zUnc1cUNrRzRm?=
 =?utf-8?B?VzNXYWtISk1YL1doTkxCcWhKN3RFYlpJY3FtMFdwdDdrRzZFazBZQkdzUXVH?=
 =?utf-8?B?eEZOQzZWZ1J2N0ZpVXNrY011NHE4NHA2NlhTcWxueEVtQlhoY3VhdzFIdjFv?=
 =?utf-8?B?ekpiKy9BejBEcitrUG10eUgvcnUzNmlsR3ZLeHVLOEErZGtUMys2ZTlEUHhS?=
 =?utf-8?B?Mi85TlZwaThXSHlENmR3TWtZeEgyUUk2TytRdnIvRnFLUTFMZXd4TW1Sd0VQ?=
 =?utf-8?B?SEJ6bzFWS29MZ2xyOFZOVnlTT3grNlpZMlh3emQxWTQ3R2twOVhkUENGVDE1?=
 =?utf-8?B?RnV6NENQdDZ2RFBFUTRYQXVMdXdGQWN0NDBUTUVBb3hlVThxSm9WcytQWndQ?=
 =?utf-8?B?Tkt2Mmo3ZVo5WVRsLzh0Q2xleFFTUFVLR1lKVCs3TnR3cVFvb2ZDMVpjY0Zi?=
 =?utf-8?B?c0xud1hRbGJKaDdCeXVVVGpkM0UrSTMyNi9HckdGZ2piUXR3MGs5dTFXemZL?=
 =?utf-8?B?WmRJcGQ2eHRTRTByMUkxWkJDdXQxK0JLbHRNMW90a0xPdnBkczNqSWp2ZlNp?=
 =?utf-8?B?MWxtRnpWZC9RU1RJQjl1ZExXcEUxUHVERDBEL2ErU1pyWGo0NEJEcEdsaG5Z?=
 =?utf-8?B?NVp3UGdKa2Z6R0ZMT2VLcVpmVWpoL1ZCbFBucGJqRmJTRGUvZTZKMnEweG4v?=
 =?utf-8?B?SW1Gb2MvS2VUc0NwS0FydUhNak03U0MwSm9ZUktoYzQzWWx4ZkVsUU8yS0JZ?=
 =?utf-8?B?UzV2VkUwWnBIOEtVbUJNSC9VQW90NjNZN0dGOHB2RXozNEdzb3E4OGVoN3ZV?=
 =?utf-8?B?alplZGlMeWNHYXhTYi9kL2l6azdSZTVINkY2OFJCUUZpZytmcSs3eDEzSWFI?=
 =?utf-8?B?Njdpdkgrc1gyd0JOa3VDZnFWUktXQXVjYkhjVTIrWEovWWNCRk53NEdydFlu?=
 =?utf-8?B?Nlc2b0hpZ1pCUjhkV1YwNjdFekdiREhMeVlyaFJGTll2elNROEQ5OUhudkNW?=
 =?utf-8?B?RGlURGRoRDM5aEtubW9vbzdoR2hyRHFJcDhOZDdMZVJxNENibllpckxnK2pB?=
 =?utf-8?B?bTRkUFNEaXhoOEs1Q2orYk9pbkdkVTdmUUpkV0FDZ0VCUWd6TmtlVzcvaEJw?=
 =?utf-8?B?dUVkemJJUFllNVg5c3VVK004eWhHYklXUFVyZ0dZNE1DaUtuR3VWeHpsREI2?=
 =?utf-8?B?ajNBWjRKb0tkeTRSdTRENi9VdXRnZUNzUy9sWEd4ejlheCtEc01FL1VXS1ZT?=
 =?utf-8?B?eHJSTUJvWjNtbXhOZ0ZaQ3VYZTdLMVVXVm4ydWxxVGpmN2JnRlMvZGVFYkZ0?=
 =?utf-8?B?OXp3U05JdTN4aTJLdjR6R09VektVdDZwYTZQVGJ0N2ZieUVhcHZyVm4za2hO?=
 =?utf-8?B?S0FSN1hKd3UyYkhsVXFSaFZ6bVhJVU5nOXBRamNnRnhXMEE2NFUrUlZFQ1dk?=
 =?utf-8?B?SWZBbzFOS1lPQnI3QXdQeDdlYzB0QVZWZXVsVk9nN0hVdC9VclR0dnB6VXN0?=
 =?utf-8?B?bGxZZE9GZlkvcHBNTFNCVzNWeU9ZN1FEZkpYeUtzb3h5N2NLN3NXMG5iNUpz?=
 =?utf-8?B?Qm9IOFBPNU1zb0RzRFY3b0hrUmlMZDB2MnQrYy82RnY0SlExSnpZRklIWGY0?=
 =?utf-8?B?Zlh1RldkMXhrYytWamFPZGMzMzJ4Q0N2Wk1hUzluTEtncS9FVGJWNnRtWXJK?=
 =?utf-8?B?ZzJqcWRYa1d6TDBRMUJGTEN0YjVZSWhOQjVMSklqdmkvZlVnUGI4eUFHMFRB?=
 =?utf-8?Q?rRtf8j?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 15:54:09.0678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c299b66-fe6c-4d0f-56ed-08dd76b59975
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7578

On 2025-04-08 02:24, Jan Beulich wrote:
> On 07.04.2025 21:26, Jason Andryuk wrote:
>> A PCI device's irq field is an 8-bit number.  A value of 0xff indicates
>> that the device is not connected.
> 
> Nit: "... that the device IRQ is not ..."
> 
>>   Additionally, the Linux ACPI code can
>> convert these 0xff values to IRQ_NOTCONNECTED(0x80000000) because
>> "0x80000000 is guaranteed to be outside the available range of
>> interrupts and easy to distinguish from other possible incorrect
>> values."  When the hypercall to assign that IRQ fails, device
>> passthrough as a whole fails.
>>
>> Add checking for a valid IRQ and skip the IRQ handling for PCI devices
>> outside that range.  This allows for passthrough of devices without
>> legacy IRQs.
> 
> Which makes the code here even more Linux-centric, I guess.

The actual check is limited to the 8-bit value which is not Linux-specific.

> A couple of related notes, yet most not directly affecting this patch:
> 
>> --- a/tools/libs/light/libxl_pci.c
>> +++ b/tools/libs/light/libxl_pci.c
>> @@ -26,6 +26,9 @@
>>   #define PCI_BDF_XSPATH         "%04x-%02x-%02x-%01x"
>>   #define PCI_PT_QDEV_ID         "pci-pt-%02x_%02x.%01x"
>>   
>> +/* PCI Interrupt Line is an 8-bit value, 0xff means disconnected. */
>> +#define PCI_IRQ_LINE_LIMIT     0xff
>> +
>>   static unsigned int pci_encode_bdf(libxl_device_pci *pci)
>>   {
>>       unsigned int value;
>> @@ -1495,7 +1498,8 @@ static void pci_add_dm_done(libxl__egc *egc,
>>               LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
>>               goto out_no_irq;
>>           }
>> -        if ((fscanf(f, "%u", &irq) == 1) && irq) {
>> +        if ((fscanf(f, "%u", &irq) == 1) &&
> 
> For this, "irq" ought to be unsigned int. Same below.
> 
>> +            irq > 0 && irq < PCI_IRQ_LINE_LIMIT) {
> 
> Not sure about this in libxl's style, but it feels inconsistent to have
> parentheses around one relational expression but then not around the
> others. Personally I'd drop them all, but the alternative clearly is to
> add missing ones.

I'll drop them, and then it all fits on one line.

>>               r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
>>               if (r < 0) {
>>                   LOGED(ERROR, domainid, "xc_physdev_map_pirq irq=%d (error=%d)",
>> @@ -2257,7 +2261,8 @@ skip_bar:
>>               goto skip_legacy_irq;
>>           }
>>   
>> -        if ((fscanf(f, "%u", &irq) == 1) && irq) {
>> +        if ((fscanf(f, "%u", &irq) == 1) &&
>> +            irq > 0 && irq < PCI_IRQ_LINE_LIMIT) {
>>               rc = xc_physdev_unmap_pirq(ctx->xch, domid, irq);
>>               if (rc < 0) {
>>                   /*
> 
> This is doing things in sensible order: unmap, then remove permissions.
> The map side though adds permissions only after mapping. That's kind of
> necessary because the value to pass into xc_domain_irq_permission() is
> an output of xc_physdev_map_pirq(). Yet then the latter should have
> failed for lack of permissions, unless permissions were granted another
> way? In which case what's the point of granting permissions here?

Permissions are checked later when binding - XEN_DOMCTL_bind_pt_irq or 
EVTCHNOP_bind_pirq.  But I agree the ordering is a unusual.

Regards,
Jason

