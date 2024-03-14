Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EAE87C1B8
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 17:59:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693405.1081436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkoQc-0001Hs-U0; Thu, 14 Mar 2024 16:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693405.1081436; Thu, 14 Mar 2024 16:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkoQc-0001G9-RR; Thu, 14 Mar 2024 16:59:38 +0000
Received: by outflank-mailman (input) for mailman id 693405;
 Thu, 14 Mar 2024 16:59:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QCks=KU=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rkoQb-0001G3-DL
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 16:59:37 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b783b32-e224-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 17:59:34 +0100 (CET)
Received: from BLAPR03CA0119.namprd03.prod.outlook.com (2603:10b6:208:32a::34)
 by IA0PR12MB8745.namprd12.prod.outlook.com (2603:10b6:208:48d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Thu, 14 Mar
 2024 16:59:28 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:208:32a:cafe::a9) by BLAPR03CA0119.outlook.office365.com
 (2603:10b6:208:32a::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21 via Frontend
 Transport; Thu, 14 Mar 2024 16:59:25 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Thu, 14 Mar 2024 16:59:25 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 14 Mar
 2024 11:59:24 -0500
Received: from [172.17.162.8] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 14 Mar 2024 11:59:23 -0500
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
X-Inumbo-ID: 3b783b32-e224-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZm0f1OsglXIhLirbMUs4HjIOtZA6h1TD03ux0JRagDYTuwd0fz8OI73OfdwejO1M13i0E0QQTHsg6jkXuVPxe4dRaJJeta8/mvo4NSsllLGXc7PpOOZ7UApXxtMTrtPJW0niUDDItMA5WQ92dU6NeT5UchSBea79JaUYdBS9YvGVcFDqBNmh5RO+vtDvHH+gd9h8g0OkNefaS8k0rJPdpE6ExRwQq2RC74NXupWLgPJ8KNpeZcuqemp+IWd4BtRlNFTxR1wpDzKsQGjD+40Jq+0aY16/Wh+XlzlJBPEMvLw0yV8T/v5tp5W6YFWRpE8ajptlQSeE2kDi+phjn27fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wiNG0Ak7+U+SIt+PZ8WIA6lzrnMnIqjZFnuNRPS1Kek=;
 b=E1NRIY1s28M4KYgIz5EZsg5tAA7tJituL8pKYA4Ky1ROxHeo6ioYyehDAvih/8lw/pwGkTZPWObo/euHYkOP3Q/GHua9/g3nJPujyNSmTqh8HMcc0ptXQCD+b1aPi5htvhDNo98HbF3zz23jz1IXae69x4jiTH1J/VqwljPCua9jRkzz1ZA6B4D2E7NCMbqu3UmRCJSG8LDRtCX1zGGSHjeGELNF/fpMura6U6JBlCnyvTJSa1r9FNsFbPOmeV4Ujc9SdIj/ejOMLoYXBAIBl9SaPyEAvnWj7dRMKgJ6kbsI4EgwtMBDcyVTuBYRLRhB4PiJpJlj7gFz3cp4XyVaJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wiNG0Ak7+U+SIt+PZ8WIA6lzrnMnIqjZFnuNRPS1Kek=;
 b=GfasofVWOhdoqmaqGG8MGEghDij5LB3ExjBN6YIafPt0PLKpTHTeHjuIOu0YStgU33uHEjfBNAmbbSEe4U7v6cjpRyGPfJwQCoav2pWGq8s7nB6n7NdQCLZF+xHREkn2EdZvtb02vyNRtWrWoJcQoFJwg8FHFGQW7KhItTrbV8o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <ae43789c-37e9-42a9-b570-d073c4fd4cf5@amd.com>
Date: Thu, 14 Mar 2024 12:59:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/PVH: Support relocatable dom0 kernels
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20240313193021.241764-1-jason.andryuk@amd.com>
 <20240313193021.241764-4-jason.andryuk@amd.com> <ZfLIBHTbcbGqFAhY@macbook>
 <afb3aa21-cd8b-425d-a4fa-b9ca57367d28@amd.com> <ZfMKuUqopaj-Gubu@macbook>
 <a531578e-ade0-45bb-b916-e195e51e97cf@suse.com>
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <a531578e-ade0-45bb-b916-e195e51e97cf@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|IA0PR12MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: d89d4ca4-2ace-46b3-8cbd-08dc44481ade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T9j7NPn5mk0mBajiXAjU1lvHF5A0YhcqPbSle135i615wC+3XV7Ptu4PBWFWkFnwELkHMvJM5HFdYtQi/JFotGqs0zbjxlkXfBr/1P3QNCsFGKYmsru5oNKHVXEUZnG3fFrkr6tuZKWp27dzzSePTESyMI6fpik1tnds9Vb4vuEO840sSOh0oGLvZc2CskAvcXE81Oitk/nWxbSPImYfzEvKd92L7rO0UnoRGvbm7l5qLeB/ZV+nzjc6Bk3K55eHH5rfN+1AmPADobOiLh8x19bVaSVNquPKIjkhoCdtr/Xbrtdh2M1SEVpwR1tkj/iytqYbewjwlMiIM7utwPPlFyN+jRPVA6Rdtkbe3P2uyGV3L/wtkd8ZZUmAVmuaGTMcHx96YG/ftrvCso5wxUrnLZmX9qfFfoBd6TMkOj2H9t4EoZKf/NzS4faCwyBQYnH86VoKNI7gzvsMQ2uFYjk3MkpGvRkPxdEvkE+DJ3WNrEDuxO2ISP9+n7UHckCJ/QmIUszmyo/cJPcVWJ8TQsNyW7j9k7k4TFxfnvst4Iq0DbtmD1m4oqFGzspu4w0wt8HZGT24vJUBoqLqw06gggN34Xtc7Ghb/1CnilhNlDIN6HyAtMFFMtKgC+ILvDuP7EJs1jWHvme/e7WNQlWtfQ0CjlAh+pYBYL8M9XeF8HwQCR5inuAcftjJaJJPft6Bim5e3z917QJBZv37gOGnurVKITkPio+jK7ddqJpr+abHba7uHH+CitTCj5+pTIpAaIjG
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400014)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 16:59:25.8425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d89d4ca4-2ace-46b3-8cbd-08dc44481ade
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8745

On 2024-03-14 11:30, Jan Beulich wrote:
> On 14.03.2024 15:33, Roger Pau Monné wrote:
>> On Thu, Mar 14, 2024 at 09:51:22AM -0400, Jason Andryuk wrote:
>>> On 2024-03-14 05:48, Roger Pau Monné wrote:
>>>> On Wed, Mar 13, 2024 at 03:30:21PM -0400, Jason Andryuk wrote:
>>>>> @@ -234,6 +235,17 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
>>>>>                    elf_note_numeric_array(elf, note, 8, 0),
>>>>>                    elf_note_numeric_array(elf, note, 8, 1));
>>>>>            break;
>>>>> +
>>>>> +    case XEN_ELFNOTE_PVH_RELOCATION:
>>>>> +        if ( elf_uval(elf, note, descsz) != 3 * sizeof(uint64_t) )
>>>>> +            return -1;
>>>>> +
>>>>> +        parms->phys_min = elf_note_numeric_array(elf, note, 8, 0);
>>>>> +        parms->phys_max = elf_note_numeric_array(elf, note, 8, 1);
>>>>> +        parms->phys_align = elf_note_numeric_array(elf, note, 8, 2);
>>>>
>>>> Size for those needs to be 4 (32bits) as the entry point is in 32bit
>>>> mode?  I don't see how we can start past the 4GB boundary.
>>>
>>> I specified the note as 3x 64bit values.  It seemed simpler than trying to
>>> support both 32bit and 64bit depending on the kernel arch.  Also, just using
>>> 64bit provides room in case it is needed in the future.
>>
>> Why do you say depending on the kernel arch?
>>
>> PVH doesn't know the bitness of the kernel, as the kernel entry point
>> is always started in protected 32bit mode.  We should just support
>> 32bit values, regardless of the kernel bitness, because that's the
>> only range that's suitable in order to jump into the entry point.
>>
>> Note how XEN_ELFNOTE_PHYS32_ENTRY is also unconditionally a 32bit
>> integer.

Linux defines PHYS32_ENTRY with _ASM_PTR, so it's 32 or 64 bit to match 
how the kernel is compiled.  The Xen code parses the integer according 
to the size of the note.

>>> Do you want the note to be changed to 3x 32bit values?
>>
>> Unless anyone objects, yes, that's would be my preference.
> 
> As mentioned elsewhere, unless the entire note is meant to be x86-specific,
> this fixed-32-bit property then would want limiting to x86.

PVH is only implemented for x86 today.  Are you saying that the comment 
should just specify the values are 32bit for x86?  If the note is reused 
for other arches, then they can specify their usage?

If this note is to be a variably sized array of values, then the 
elements should be of fixed size.  Otherwise parsing is ambiguous 
without, say, another field specifying element size.

Maybe XEN_ELFNOTE_PHYS32_RELOC would be a better name to complement the 
PHYS32_ENTRY?

Regards,
Jason

