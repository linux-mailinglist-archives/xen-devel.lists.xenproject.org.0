Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0807D7F40
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 11:04:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623608.971603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvwGg-0003Bg-GD; Thu, 26 Oct 2023 09:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623608.971603; Thu, 26 Oct 2023 09:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvwGg-00039z-Ct; Thu, 26 Oct 2023 09:03:06 +0000
Received: by outflank-mailman (input) for mailman id 623608;
 Thu, 26 Oct 2023 09:03:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I5Mm=GI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qvwGf-00039t-KO
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 09:03:05 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20617.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77b34d49-73de-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 11:03:03 +0200 (CEST)
Received: from DS7PR06CA0028.namprd06.prod.outlook.com (2603:10b6:8:54::33) by
 DS7PR12MB5718.namprd12.prod.outlook.com (2603:10b6:8:71::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.33; Thu, 26 Oct 2023 09:03:00 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:8:54:cafe::88) by DS7PR06CA0028.outlook.office365.com
 (2603:10b6:8:54::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.35 via Frontend
 Transport; Thu, 26 Oct 2023 09:03:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.18 via Frontend Transport; Thu, 26 Oct 2023 09:02:59 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 26 Oct
 2023 04:02:59 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 26 Oct
 2023 02:02:59 -0700
Received: from [10.71.193.58] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 26 Oct 2023 04:02:58 -0500
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
X-Inumbo-ID: 77b34d49-73de-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVOtsEwI8nC2zB39uhTClgeJPEq0mcfL8lT/gS2yeKRyoCcWnA9ui4yGTCDmatbsuOY3EmbVCRKydPI8hhIZy+zfDz20FGYsieKfK4i4V1b/zJfT363GY99Ih9mRUcpzRswPV0h7uj4S1ffjNygvahDp1BUA9RzTnbigouA2C43L6Q3ZtMULoA1eCuvU+gGO8PiyBgOlF82YTRZCqnY42XmIBnN8D6eqJpMgXR7OJEPYpKlJeKPW5ZekFzppzzsYT/q9+InXKfW0l9H/3dN6IYJuOjqBgGVv5GR8vU30rzc9hkQRQFDVCnpLVO98lP3HZ/w0bC8vyUhsxnusA87VVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIK2GiO9xi8jpj0JqkeN7ZLEgMP1E9mQ9ocUZONKLPo=;
 b=QrL686RWQKTNzS4lmDPidW5Lm4ArqQHKcmHeTJK3J8rpRPSLx1HJ/8GsfdwWQ0OBRMk4Q/KqmbaeAu813Ydx4XlX0Eq3N9R4c3KwaBLNo7kFUagKsXLhmmrOlXLixMOTCdaWxczGuajWjdH0byiXwhXcWSm9G/y5Xq6uYVGWI7/Gr9fbub0nnlVu2sD+5dCSySGy+2YJT7BWZrbN7mKZy/J3bDcIkfoCDWAgYHmoNKFYA04EtEESkYY6jigGUcytVAXHzNTP0CTX5aJpV9NsGornHz+zVzQYd1pJ95QFBGgb6lBBGUnPiTH8x7cCvxKrNWjpNxDmov8JCUaJZZWEhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIK2GiO9xi8jpj0JqkeN7ZLEgMP1E9mQ9ocUZONKLPo=;
 b=jhvBTZWef9bXnsiNytdbCVpSQpjEbNWcNcAQ5rjrinMYDV+FW/vuE8hWx5qoen7jKZz4+Mtt4BYgXxA79/IznH3ybY5WBARewo9151nfziVU6o4qcdzy9R9hkvNNG+FyH9KljDESqyKPI6t4Jv4JRhqqTKOLY80BR+1E/cHBxtM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <6547ffb8-f8b8-4fe9-8ae1-4451a7e87cfa@amd.com>
Date: Thu, 26 Oct 2023 11:02:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN] xen/arm: arm32: Use adr_l instead of load_paddr for getting
 address of symbols
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>
References: <20231025170304.2331922-1-ayan.kumar.halder@amd.com>
 <6c4c8023-1d6b-426d-9c9d-c45f01c9c5d2@amd.com>
 <12be1b5e-2bdc-49bc-aeea-3372291ced8a@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <12be1b5e-2bdc-49bc-aeea-3372291ced8a@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|DS7PR12MB5718:EE_
X-MS-Office365-Filtering-Correlation-Id: 27509310-636a-4edc-7eb0-08dbd6025a63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NUicH2+uOqCwfxg0HnNZnz5vzlC2iDybntGUg2ZECIbGvpbcPnOKkDXT/xNoEYdo3VfbpLhGvTApo+oeNdNQUMjYdAE7Hs+IK9NbzH5Edmo/gzKq+2+FRWHTzRzwmdFMeG4dzqiiDSquSM9RBgpeI1Dl3ZYNOFc13SE7mLQRv5X84dRwhuJBtPMxp3yd8V69bGykbhPELTWITpBtfv5cjGnT7kTd5qqQktDOZ3jlB7Sd5M8VsXCI6+cXo5yuc1BBoZDLl0LMSPqNWrWTd3qgSciMBnxFQFCaeFg6P0ezoj537u1XWtk7Z53spdSGAePxQQkfQHPtOZ+LY7jBgXxEtwseQa4HIRDTNiwwCk636D45EDTuQg/wfnMnLDiqTbbwJHphcafpbv2VtzrGvo3O2RyZ0qiX9iN4p0Hg1UNvk0j+YjBg4P+twnZu7pZ4YGlBFCuDFn4NDus0nN0Am0KU0gCRaqhHkej8kotDteM5zTR3R2c5wRMIWFuR9BGy+hTJ4BXWYQfJ15DXNXH93FUGc3nIkJAJjLYCWu+dvTLEb8fu5T1AC7spdXE5UzkB1PSVUanezDxqqXCTN47kxycYX59vjhFsLCqsyLErlG7jHR4NrWxjIdnsECI4+HaqFkd1Wja6x6IhtRaANkft3+4/UF7M6FEmsxhQ4dlntvSkHzHAUFTkbBsWSreCgf6XQfqS+gWhW1LVgM90KnwcyORqy5KLEihmGTNKljbrpmGRT+nGF/mNRYz+KZtAtBA1+fkV6jXbNHQwjofq8TjyZ7sTxvfS/8Yd/3EKYJX1Bwwtj0/mgTlm1l0jnBjprRj+DpDr
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(1800799009)(82310400011)(64100799003)(186009)(451199024)(36840700001)(40470700004)(46966006)(8676002)(70206006)(5660300002)(8936002)(41300700001)(4326008)(44832011)(110136005)(54906003)(2906002)(316002)(86362001)(70586007)(16576012)(36756003)(478600001)(2616005)(31696002)(53546011)(31686004)(36860700001)(26005)(81166007)(40480700001)(47076005)(356005)(426003)(40460700003)(336012)(82740400003)(83380400001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 09:02:59.7024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27509310-636a-4edc-7eb0-08dbd6025a63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5718

Hi Julien,

On 26/10/2023 10:40, Julien Grall wrote:
> 
> 
> Hi,
> 
> On 25/10/2023 18:59, Michal Orzel wrote:
>> Hi Ayan,
>>
>> On 25/10/2023 19:03, Ayan Kumar Halder wrote:
>>> Before the MMU is turned on, the address returned for any symbol will always be
>>> physical address. Thus, one can use adr_l instead of load_paddr.
>>>
>>> create_table_entry() now takes an extra argument to denote if it is called after
>>> the mmu is turned on or not.  If it is called with mmu on, then it uses
>>> load_paddr to get the physical address of the page table symbol.
>> I wonder if we need this extra complexity.
> 
> +1. We used to request the caller to tell whether the MMU is on. But
> this made the code more complex. So I decided to remove it completely.
> 
>> Can we just remove load_paddr macro completely (I have a plan to do this for arm64 mmu head.S)
>> and open code it in create_table_entry? I don't think there is any benefit in
>> having the if/else there to use either load_paddr or adr_l. This function will also go
>> into arm32 mmu head.S.
> 
> While I was ok (I am not 100% happy) with open-coding load_paddr in
> arm64, I would rather not do it on Arm32 because I still haven't figured
> out whether I would need other use (which could not be replaced with
> adr_l) when fixing the secondary CPU boot code (it is still not
> compliant with the Arm Arm).
> 
> So the question here is what do we gain by removing load_paddr
> completely? We still need a register allocate for the offset, and the
> macro makes it clearer what's the code is about.
I agree that it might not be super beneficial. My opinion was based on the fact
that why bother having a macro if it is only used in one place and consists of 2 instructions only.
That said, I'm fully ok to keep the macro if it improves readability and the only use would be in create_table_entry.
Then, on an arm32 head.S split, the macro together with function would moved to mmu specific head.S

~Michal

