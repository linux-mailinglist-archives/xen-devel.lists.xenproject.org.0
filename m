Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5363BCAE600
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 00:01:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181157.1504253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSkDq-0003tN-1m; Mon, 08 Dec 2025 23:00:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181157.1504253; Mon, 08 Dec 2025 23:00:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSkDp-0003rX-US; Mon, 08 Dec 2025 23:00:49 +0000
Received: by outflank-mailman (input) for mailman id 1181157;
 Mon, 08 Dec 2025 23:00:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZw+=6O=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vSkDo-0003rR-EK
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 23:00:48 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba735f2b-d489-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 00:00:46 +0100 (CET)
Received: from CH3P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::26)
 by DM6PR12MB4387.namprd12.prod.outlook.com (2603:10b6:5:2ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 23:00:39 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:610:1e8:cafe::aa) by CH3P220CA0011.outlook.office365.com
 (2603:10b6:610:1e8::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 23:00:35 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 8 Dec 2025 23:00:39 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 8 Dec
 2025 17:00:38 -0600
Received: from [172.29.90.244] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 8 Dec 2025 15:00:37 -0800
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
X-Inumbo-ID: ba735f2b-d489-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nVHoineSCpGhZmWYIj7Z+zT0TeRHQ3EapA7kWEkli3LbEt/YgeE2yVCXUKJNJYk8RqTsGOx6OiZd7Iif39y79ubeuaKwVQSKNd1lMxpRFiMr2JhGOgk8ttoIFCENaOiDmT7wmpok9MGEz78ZnnP0NoN/2g5cCMAH7aA0/CYVTvxNIX/UF1cG0ITmkx81cIcFEF7hK6773bzJKcHZrjYEO2BUS4oZVuSg6NMJ11mnn9GIvVoqtxo7ICe6iZiYC8hKN1wP3GlTvKvVSbq896AzX2vZO4lI78yVn5+WeYph3rpbJq+vV5fw7xLJZefAgkOczkfGDXUdq9HbYD/WXIJLGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1n+5BTEIBK43FX2PyPfouKdwJV5ikhIWV/5npraqfv4=;
 b=GFY0w9pqCqyy3m4PA2BCB9ZOu5cPAjXjxcDmQ/MvNZzlqOgDM5V1rfDjPHvqDNI1MivECpIQwMRUEzLgt2VldsNemesTO0un+jBcEVt/5LlTGlSyrd2j9m7LyJr/gXzjaSJNy1ov9G4od4MgkZ/JJuO3ArgWnMwLWo7Lpbazl6EYNmG3hDFDUmCVi7nRCwNmEiJkjZpJVyLqxndYuw4SRqYvFAfxHQImptxO2UfrjvBoK+7u0vFJwqf9ahVknGP6DcNi9J6LBQt734VYPVwexBhJcqBcWOj/JHvlGDF01uPx/SlyBWV3GPVM8QvEWBLB75QTRtstzUcVLTIJMUc7hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1n+5BTEIBK43FX2PyPfouKdwJV5ikhIWV/5npraqfv4=;
 b=R+Jz0FbEqgaSKfebY+U7fcUn9e6C75L9s7MbGtMW6T9LsiOxT7zZQqQOML2h1yPO+o2AAVC0yHWkscIXKMK3EtOwf1RARpQc+RPPGHVbbSzhmgI3TvKWEVu2IBQw8RdPGc1if7MEz9QiZoo5M9yWW4ZPozfNsis4R/QtTLpLTuo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <1675a966-1095-4aba-af74-828e4c68e6b4@amd.com>
Date: Mon, 8 Dec 2025 18:00:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RFC: xen/x86: Enable --gc-sections
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"Grygorii Strashko" <grygorii_strashko@epam.com>,
	<xen-devel@lists.xenproject.org>
References: <20251205222813.277164-1-jason.andryuk@amd.com>
 <6c10dbc4-3247-4a0d-9953-858d09df08a9@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <6c10dbc4-3247-4a0d-9953-858d09df08a9@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|DM6PR12MB4387:EE_
X-MS-Office365-Filtering-Correlation-Id: 0442488e-7c53-4fec-62ae-08de36ad9b11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MEJ2cVZaeW5aTWN4YmdhNG5YMkcyNWg4aVZScVQrRmVoQlFvVXpPY2tQWWhD?=
 =?utf-8?B?amV2QzgzemVna1FrdjVwbFVsazk1SWE1V1RkM091Sk1VdXJmSVFqY1h1bzBH?=
 =?utf-8?B?TzU1c0JsN2RDWDlkWjUxZ3pFWXoxZ2ZHMXR6eFR0K1NLUXRnNTlnZG50aEdj?=
 =?utf-8?B?dDMvc1l0WFA3MU9PeXoyT2lRU3QrREZUNkRRNElma29neDZybThEVUhRVFAv?=
 =?utf-8?B?VWp4Qm55YmZ4WGxNdzh3dk1OVGs3OUszbCt3VDY5R29TYmdteEczbkxoNXBx?=
 =?utf-8?B?K0tiek91NDFTN3JsazFrbmhxVUpvQVRhRElQdytPUi9rVVpSYyt3b3Y1NmRR?=
 =?utf-8?B?a21tVkpYYzZMU1hHYW80T3lnekxLQ2l0MDFIeTIwL0YzU0dMLzJSbEdoQU9U?=
 =?utf-8?B?NTUzQ0JDaitlbG53SUJIU1UvcmhSUENaQzBSMkgvTEcyd0FBdEc2RHVDUTRy?=
 =?utf-8?B?Rm9SaStTUjVYdjlUYzI0N2FkaDZRekpLdFZDUlIrb0IwY2lSZE1mS0tGdUYv?=
 =?utf-8?B?dE1IbWlQNVdYVCtRQXMvNWYydzJKNEtOam90eGgxeHY0YnVzUStkN21KY0VY?=
 =?utf-8?B?NFFuemZMbW9Wck45eDd5akhRRjJDNEVob1ArK3p4OVlqS1QyLzMrNHdqN0ht?=
 =?utf-8?B?MStrODBTVlZMNlIzV29NdnY5WlNBRlFOSURaYm1RRjBZUDZnejlEMzZJeC8v?=
 =?utf-8?B?NXZlWWtIUFg1UmhkYXVNYnBpWWRLN0lFcng3R0d4SXR0MFI4UTgrcmdvZXEz?=
 =?utf-8?B?V1UyTW9zTFBCR2xKYWFBOVZiakRyZ2pOdlBoMFI5bUtPTDg2N20yME5CcEFT?=
 =?utf-8?B?U04yUXlWcHpxTWdIL0dLV29DMzBadzBqVkhudzN4VmxrbEt4MUI2WWhCZUty?=
 =?utf-8?B?QXZpVzVOWWpGblVHQzBYekI2ZGhtVnY5bVZ1UnlKanphM3o5K2xjWE9IZGFp?=
 =?utf-8?B?RHZMR0JRSC9ScUFsZlBkUktiU3h0eUJkUTh3SHNEOEtLU2JpS2NMRTZiRVdS?=
 =?utf-8?B?WnFqeVZKYWd3aVBpNHdPK056dS9rWThRS0tBU29lbTQ1a0Y4a3RHekw3Vy9O?=
 =?utf-8?B?cHlvRmNGNXNFZXlRU25paEMrQktuU3JKWTdrYklDVkN6QkxhcEtYMjAzd1Ay?=
 =?utf-8?B?Nk1rdzlhWmp6b0hvbkZ6MVYxMGY0bmFVeDBTTWxnUlZXdFIvWm5vUkd0aDRH?=
 =?utf-8?B?OGE0ZEVoUGpGci9zVmlMWEpDNTFwRHBibnpvSHlzRnpEemhJU0JrNzdWK2Va?=
 =?utf-8?B?TXZOLzBHQms2UGhDYUJPVnJVWkJLaXpDV0JZWktxcDNCZ1ZWZGhHMXN1N1d2?=
 =?utf-8?B?TGtMcE1zVTBRUFJKZmZ4bWJRM2ZsSkdzb3lLdW5YenpuSGxDVHhPSnYxYmZp?=
 =?utf-8?B?SG9ndWlTcTZRdjFZOVZ5WG11Rmo4OXIxdXE1bkIrSmR5M2w5aXNUYkI4cERk?=
 =?utf-8?B?d254dm9jM1QycTRPTEdTQ1NDem1PS1BSTFlGWGo3SEQ5WG15L3gwOGl1SkdH?=
 =?utf-8?B?RlVmbzVLQzU5NkI5akxNbmg4OThZSmg2SG9xQ2NacG0zZmtRZEFrc1FuazBw?=
 =?utf-8?B?MmdLYldmQWN1SFUrRU1aRXo2Wm5oMzN5bXBURTdiTWx3dTE5ZXJmeWYvRTFV?=
 =?utf-8?B?K2JhR0NWSll3VDNDRHk2M1N6RVREZDdmMXNoWCtQQklmM2VUdzZWN1YwQ3hM?=
 =?utf-8?B?UWM2dTZNUVF4cDRjcUlPQk5jUTBqaEMzU2U2TUpndk5oN1Vubkl2MGxnTDZI?=
 =?utf-8?B?ZmlzN0Z4VmYrZjVyTDR6ODhxMlJVT1czazBPZTlaRmpkQ2tmei81d3JZeG1E?=
 =?utf-8?B?S2VHcWdEdzlJakNFeFdIKzBkc0hOVDFqZ2pqblBUUXFiam1IdEZCREdVZEJ1?=
 =?utf-8?B?VEdrRFpJYm84c1F0UE96WXo5bElFbmxmTmZYQXhmUGVuNllYbHBPSGlQdHM5?=
 =?utf-8?B?dXhJOVlpN3lLQ3ZUdHVKbXFKWnRmbEdxZkpaeCtMT0xHWnIyR1ZncnBKb3Vz?=
 =?utf-8?B?UTlnV2hPL2x4OEEvOHlibU1oU1NEeXRSMldKaTl5bmtNY08zQ3RiVEVEV3lL?=
 =?utf-8?B?UGJVa2hqbzhEeWFaam9EOGliWjB6cnVOaW0xU2dJaWlGakJFWmlUTTM3TzBw?=
 =?utf-8?Q?CKd4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 23:00:39.1237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0442488e-7c53-4fec-62ae-08de36ad9b11
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4387

On 2025-12-08 03:56, Jan Beulich wrote:
> On 05.12.2025 23:28, Jason Andryuk wrote:
>> When linking to create xen-syms, add --gc-sections to garbage collect
>> unused stuff.
> 
> What about xen.efi?

I tried briefly and it fails to link.  The GCC manual says it is 
considered experimental for PE and COFF.

I just added into EFI_LDFLAGS:
   CC      .xen.efi.0s.o
ld -mi386pep --no-warn-rwx-segments --subsystem=10 
--enable-long-section-names --disable-high-entropy-va --dynamicbase 
--image-base=0xffff82d040000000 --stack=0,0 --heap=0,0 
--section-alignment=0x200000 --file-alignment=0x20 
--major-image-version=4 --minor-image-version=22 --major-os-version=2 
--minor-os-version=0 --major-subsystem-version=2 
--minor-subsystem-version=0 --gc-sections --print-gc-sections 
--build-id=sha1 -T arch/x86/efi.lds prelink.o  ./.xen.efi.0s.o -b 
pe-x86-64 arch/x86/efi/buildid.o -o ./.xen.efi.0xffff82d040000000.0 && :
ld: kexec_reloc is too large
ld: kexec_reloc is too large
ld: 
prelink.o:/home/jandryuk/xen/xen/arch/x86/boot/head.S:60:(.text.header+0x48): 
undefined reference to `start'


>>   Relies on CONFIG_CC_SPLIT_SECTIONS
> 
> Yet still ...
> 
>> --- a/xen/arch/x86/Makefile
>> +++ b/xen/arch/x86/Makefile
>> @@ -137,18 +137,21 @@ $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
>>   	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
>>   	$(MAKE) $(build)=$(@D) $(dot-target).0.o
>>   	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>> +	      --gc-sections \
> 
> ... you pass the option unconditionally. Which may be fine from a functional
> perspective (little if anything will be saved), but besides being a little
> inconsistent with the description I also wonder whether the option won't have
> unwanted side effects (longer linking time, bigger working set).
> 
>>   	      $(dot-target).0.o -o $(dot-target).0
>>   	$(NM) -pa --format=sysv $(dot-target).0 \
>>   		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>>   		> $(dot-target).1.S
>>   	$(MAKE) $(build)=$(@D) $(dot-target).1.o
>>   	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>> +	      --gc-sections \
>>   	    $(dot-target).1.o -o $(dot-target).1
>>   	$(NM) -pa --format=sysv $(dot-target).1 \
>>   		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
>>   		> $(dot-target).2.S
>>   	$(MAKE) $(build)=$(@D) $(dot-target).2.o
>>   	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>> +	      --gc-sections \
>>   	    $(orphan-handling-y) $(dot-target).2.o -o $@
>>   	$(NM) -pa --format=sysv $@ \
> 
> Rather than having to alter three locations (plus another three for xen.efi,
> plus another three for every other architecture that would want to follow
> suit), should we perhaps introduce $(XEN_FINAL_LDFLAGS) or some such? That
> could then have --gc-sections conditionally upon CONFIG_CC_SPLIT_SECTIONS.

Yes, I thought something like thiat would be better after posting.

> I further wonder whether the use of the option wouldn't want gating by its
> own Kconfig control (dependent upon CC_SPLIT_SECTIONS). If nothing else than
> to have an easy workaround if either we had a usage bug (e.g. a missing
> KEEP() somewhere in a linker script) or there was a related bug in the
> linker that we end up being affected by.
Makes sense.

Thanks,
Jason

