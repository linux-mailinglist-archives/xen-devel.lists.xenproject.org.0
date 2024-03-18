Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0474D87F1EA
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 22:20:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695135.1084690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmKOU-0006XG-Fg; Mon, 18 Mar 2024 21:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695135.1084690; Mon, 18 Mar 2024 21:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmKOU-0006UM-CL; Mon, 18 Mar 2024 21:19:42 +0000
Received: by outflank-mailman (input) for mailman id 695135;
 Mon, 18 Mar 2024 21:19:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KtFp=KY=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rmKOS-0006UG-UJ
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 21:19:40 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38f70f5f-e56d-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 22:19:37 +0100 (CET)
Received: from BN9PR03CA0891.namprd03.prod.outlook.com (2603:10b6:408:13c::26)
 by CH3PR12MB7641.namprd12.prod.outlook.com (2603:10b6:610:150::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Mon, 18 Mar
 2024 21:19:34 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:13c:cafe::1f) by BN9PR03CA0891.outlook.office365.com
 (2603:10b6:408:13c::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26 via Frontend
 Transport; Mon, 18 Mar 2024 21:19:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Mon, 18 Mar 2024 21:19:34 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 18 Mar
 2024 16:19:33 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 18 Mar
 2024 16:19:33 -0500
Received: from [172.21.216.216] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 18 Mar 2024 16:19:32 -0500
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
X-Inumbo-ID: 38f70f5f-e56d-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cB/rDWXK9ZlmHYqGfM+WBjM16yLrEeoZh7DgChCv/6/nHj/qSbsIgvYkCU/pwXkzruaqwgLlg/WGmmZdhmbDBH9a3J15V005Mzu8IQtgihxlDASvtIUppUE/k3AbHWoiSOVwkNwfz6soEiNFDomt+CbUD9V7sR1fVDspYRy8xrXZcPAhWhG7zpEOouzk6hXI0VdyERVgRm1nCo4cSRGcbYmgTBj51davkjkTJO3zGoDHaDfcUSWRHreYDfgZZF5QcK5Jmlenf6CR71RwOU/qT+owR24MAibym11llHLE0b89fOpS2KdQDWXzkDBa7WFSIVW0CvBv/Hhh3MwkzWmXzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+rZjqPCJXjW6MluSM4Nqyv82XjBn/kSPGLI+d6DwM8=;
 b=f3UDar920FfWgSb/SI1iz+voeC9aBjt+Jnm0486BNj0dGneTsjkjgJzJ1BkswzQBEIkruq/iGMzM8UC3pvnVlbT8jEIm/1wbRjdxOsTGod/sH+hZg0yykgo27Si2Wo0iqpXS/BLSmjP/tIOrriO6n0qzGg+ahgVUHlHuH5hflBH5Uy/HmHPNDAx3eIS0hk4hmC9AxWVAZ04sLA3F9QPI9NLg4THEVLcPxSE4jWaZ73+BOTANbOD8r3LR9EfjLHogH/b4QOK4cdrhcXk/siaA2xM7ESPUeWnlXiI7rTZvnSRKYlzKScr4v1hkjpVfCQ6EcB4A/s9lN/ZigFiyNH/dYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+rZjqPCJXjW6MluSM4Nqyv82XjBn/kSPGLI+d6DwM8=;
 b=x1RhcJrvM99cDKm6vhWh82kJjhim3UMiqWgkJTUrF/qDFik84R+L3+BdV9cK5XbxtLOEtKWLmwgPjnte76bIRlID99V2qZCPU0H1GKTphhb1A1XrOsQfeFolOAKVhKcvXwLqwGyLsEywebva7WK+PlY69hThEFd1hwGT0E2hEPA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <769e4e95-1c76-4e07-b623-27b35ef388ef@amd.com>
Date: Mon, 18 Mar 2024 17:19:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2 3/3] x86/PVH: Support relocatable dom0 kernels
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20240313193021.241764-1-jason.andryuk@amd.com>
 <20240313193021.241764-4-jason.andryuk@amd.com>
 <945609d6-741e-4934-a4f2-6e5597ce5dcd@suse.com>
 <a4f18ccc-c878-4924-a110-6afaaea1b01b@amd.com>
 <43c49aa6-d690-467e-8ce3-ca37b9d41e76@suse.com>
Content-Language: en-US
In-Reply-To: <43c49aa6-d690-467e-8ce3-ca37b9d41e76@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|CH3PR12MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: cded4abb-773f-4775-cd88-08dc47911c15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7PeIoTGlobISdYDo+XplnYPUxOJa5swlmqPqh/BQJ7PPLg0bDj1sVH88iLksgPHssREwAR010b3F5nmJAuWOfcMCq/mpTkJxtlEHgoleFX00h493ScbhhkHwIz9iaOQP3Z1B6AQr7JXgkbouruDq17VS8l1ORuwhskkvFZavyTH3K8qcsU8hwDtozw2D2AKeGGGVk/03tmmd6bxRSGpafWKfeBSO9xEHM3RlmzLUGphM9lXF1V6qCLjyb8S0vv3NWiTdTyJ89/s27cnMX6IIK2geO2WEuEQ/LuqadvqA2dQYWDEqdsUcPZEsIVM1Dfz014cecbWVqYx0TTfE/zKPyhHsX0HSWfC2GtlSWmQAzb5F3cFUffYEHkqmHe+QjbSuBpbMVfSYpqR+SpZaHCHvmAJ1TWaKj4YU5KF+Qvo7Ijgl2kuMij701qd6DJcjwxwATZ//XOmjvPmNnTSXg6ow55Fzq92MCaHBQJ5vrsM2Dp01OyH8PvPVIE/qafGkibgCT8cQHJ4Qz3HBIAgkCuZW+5vWEzmqvvZn6bUzjPy0AM/OLEDXPULdx9Q0x4owXA/NctyDPJI0meuDCZe3TBh6QbKE99KIN+6/xsTZFiA7SDqNQ/g3GSj9NxlAWcSrKTsEKNxGcURt41KaAI1TCAcKS+ZmyPAo2JLgzGrUEBAzFNwN/YoYn+OJb6BOmoY4uNF0k86CXcp37ajwUMFIVmWBcU+ofsVqaSreArTDazN2QR1FZ1U7/kpk7rrH7h7FkJLG
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 21:19:34.5226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cded4abb-773f-4775-cd88-08dc47911c15
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7641

On 2024-03-14 10:19, Jan Beulich wrote:
> On 14.03.2024 15:13, Jason Andryuk wrote:
>> On 2024-03-14 09:21, Jan Beulich wrote:
>>> On 13.03.2024 20:30, Jason Andryuk wrote:
>>>> --- a/xen/include/public/elfnote.h
>>>> +++ b/xen/include/public/elfnote.h
>>>> @@ -194,6 +194,17 @@
>>>>     */
>>>>    #define XEN_ELFNOTE_PHYS32_ENTRY 18
>>>>    
>>>> +/*
>>>> + * Physical loading constraints for PVH kernels
>>>> + *
>>>> + * Used to place constraints on the guest physical loading addresses and
>>>> + * alignment for a PVH kernel.  This note's value is 3 64bit values in
>>>> + * the following order: minimum, maximum and alignment.
>>>
>>> Along the lines of what I said on another sub-thread, I think at least
>>> alignment wants to be optional here. Perhaps, with max going first, min
>>> could also be optional.
>>
>> Interesting idea.
>>
>>> As indicated in different context by Roger, the values being uniformly
>>> 64-bit ones also is questionable.
>>>
>>>> + * The presence of this note indicates the kernel is relocatable.
>>>
>>> I think it wants making explicit here that the act of relocating is still
>>> left to the kernel.
>>
>> Ok.
>>
>> How is this for a new description?
>>
>> """
>> Physical loading constraints for PVH kernels
>>
>> Used to place constraints on the guest physical loading addresses and
>> alignment for a PVH kernel.
>>
>> The presence of this note indicates the kernel supports relocating itself.
>>
>> The note may include up to three 32bit values.
> 
> I'm as unsure about always 32-bit as I am on it being uniformly 64-bit.
> One question here is whether this note is intended to be x86-specific.
> 
>>    - a maximum address for the entire image to be loaded below (default
>> 0xfffffff)
> 
> One f too few?

Whoops - yes.

>>    - a minimum address for the start of the image (default 0)
>>    - a required start alignment (default 1)

Jan, in the discussion of patch 1, you wrote "Hmm, shouldn't the order 
of attempts to figure the alignment be ELF note, ELF header, and then 
2Mb?"  My latest revision initializes phys_alignment to 1 and updates 
that if PHYS32_RELOC specifies an alignment.  Do you still want these 
other locations checked for alignment values?

Regards,
Jason

