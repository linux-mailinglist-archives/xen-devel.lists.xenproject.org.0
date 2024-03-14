Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C13F887BEA4
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 15:15:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693269.1081140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rklqJ-0006RY-CB; Thu, 14 Mar 2024 14:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693269.1081140; Thu, 14 Mar 2024 14:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rklqJ-0006P0-9T; Thu, 14 Mar 2024 14:13:59 +0000
Received: by outflank-mailman (input) for mailman id 693269;
 Thu, 14 Mar 2024 14:13:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QCks=KU=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rklqH-0006Ou-Pk
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 14:13:57 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1773e1bb-e20d-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 15:13:56 +0100 (CET)
Received: from CH2PR04CA0003.namprd04.prod.outlook.com (2603:10b6:610:52::13)
 by CH3PR12MB8331.namprd12.prod.outlook.com (2603:10b6:610:12f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Thu, 14 Mar
 2024 14:13:52 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:52:cafe::43) by CH2PR04CA0003.outlook.office365.com
 (2603:10b6:610:52::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20 via Frontend
 Transport; Thu, 14 Mar 2024 14:13:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Thu, 14 Mar 2024 14:13:52 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 14 Mar
 2024 09:13:51 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 14 Mar
 2024 07:13:51 -0700
Received: from [172.17.162.8] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 14 Mar 2024 09:13:51 -0500
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
X-Inumbo-ID: 1773e1bb-e20d-11ee-afdd-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OX5bxpBE1K8qGm27nPc6kHCiWIvBBm7Jtm90eHv6p+0wmSDcPX/PbEky9ELxLpPvpNO4KNNfz1dp2BO6MCb8TBlO5cw+5N+YCBPHqg6bXLLc8ROv6YCL5YRkqcKUqpq77fScrTwxUDZJeeuiLYk5vr9CAE5Gn0UmVH9s0rCXesfGwHV5/rkoPuTW0S0sHu5+Jtr8eFmXgGUTXbvhikEM17yqr9jeixRcOXikn3+YrI7sIFSSdzFcK855zCl/nykvXqmCuX2b4Rahewh8jLEwhNiWDwAqkhd5TQvQa7iltamTIxCzzeXauy0DlvnIvr1Jd5tIAyWyJ8Fk5YR9QCkU6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5wTw/V01G9PPcilKrECgw44W63dKh2A+HwVEmxQPNg=;
 b=bKSHeEZJl4ZDZh6rAyj2H6OGFEFuFeepoekibOXEoqsUVD5mrJXf6RXJzDk3KCW4+bR48ceBX1fSRTqLKffPxRhFFYfQea/bORxhZyKaB6+sW5FsFIwqKaQ1pgbqiEdKFXLFmJSTNgNNRhhusLYTLjlA6U1wWgjWxM53GuBQ1EJ4vcl9BsltuXcQYdk7tnqK35VR0EJ0ZpnJ88nfPbt6aKPucTD4msx+BUp07YJBtS3ipmdYE5a+w3PECDHCj52wyNn8QtcDF4BOYZVPHvOsg8e9/dFMQYzggPBTxuEpz3sNdlvlAgWnhQm2P55w13zdct6WbD9XeF+bq1NZ785XBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5wTw/V01G9PPcilKrECgw44W63dKh2A+HwVEmxQPNg=;
 b=vlFTSoMHeeid1U8TzthzFeUki/aVFgS89Sy0rwbREU6BQJOdBqj9UoAHGq96TOjkdNBN7kmc/sUJ2bDzUqrdLovmy1URmkS0Sa576AoSDPSmweELfgfDR7iQxLwA5ddYHCZVBIvkySH6IYz9wrnMpRlsJihVpx96skWvXCpYMRk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a4f18ccc-c878-4924-a110-6afaaea1b01b@amd.com>
Date: Thu, 14 Mar 2024 10:13:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/PVH: Support relocatable dom0 kernels
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20240313193021.241764-1-jason.andryuk@amd.com>
 <20240313193021.241764-4-jason.andryuk@amd.com>
 <945609d6-741e-4934-a4f2-6e5597ce5dcd@suse.com>
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <945609d6-741e-4934-a4f2-6e5597ce5dcd@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|CH3PR12MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: 23695a0f-a963-4ef8-89b7-08dc4430fa15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aM9aeTCv7ZSl2UGGUrDGSvz9sgdn0MJxOZUsIyViui295K73LXYcw7NVTLVo1a2yn6HpKZwjB+RhpmjD71OArfrP/HR3Y+ZepNfoOVGc+KklHeV+e5UW7pYHQfrzI5fUmMVSI7z//6pHTfDbltVxPeb4bMTTDfhjAUo/Rhww12WRsVK8M0VaIGXRPl73kffg09SUGBv5gx5QXY8RnnAOGgZxOnw47WQEHVWhvKYJcc1jmrrHI/UrnWaPv7J1Z1TDQNXabXOfosM9Jdeg3aG2vM9XRC4l4kxesRYcEzdH0chtUrST403XHFioly7n8MvCOIFwenIazMbFnYcMTJO2n6i/gVTZdrEMflcF0uXC0DSOcspwm2ymDOml0S3J7KzmkX3S62FOYffluPq0sd/jlFL6jHnIbJ9rQeyJzDkz19XUNH7wS1ySsady5SS2s0/0UWuXcNnRP4zzUh9we8y1yGc4x1+Nlswv2TK1wPnICtz7uZtt38+Tk7W3fsDpvpTTKYxUQJkm/1iRBFOUzeVR6dVSCdRxXtnmW1oRVJBFB5tGBAgCGViJibO59sy7Zlox1XNtoxr+cBDhQ7UoAGAKaDDRAhEc1p2RSdViSTqiJrVtMYNU+0QXk04PmKTMSdHoNTwu4H4ZMTdgZqJM1DCR3R7WLULnRLocRw2q7wHAGjshMp3eXvVYNAleWUqqSIKB9es+JzBR9bj5ZGrbGhNbiwyMDD/ALrd/KOFsyyrp/6Ozxz2wO4iSGHg8beGB4PR3
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 14:13:52.3664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23695a0f-a963-4ef8-89b7-08dc4430fa15
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8331

On 2024-03-14 09:21, Jan Beulich wrote:
> On 13.03.2024 20:30, Jason Andryuk wrote:
>> --- a/xen/include/public/elfnote.h
>> +++ b/xen/include/public/elfnote.h
>> @@ -194,6 +194,17 @@
>>    */
>>   #define XEN_ELFNOTE_PHYS32_ENTRY 18
>>   
>> +/*
>> + * Physical loading constraints for PVH kernels
>> + *
>> + * Used to place constraints on the guest physical loading addresses and
>> + * alignment for a PVH kernel.  This note's value is 3 64bit values in
>> + * the following order: minimum, maximum and alignment.
> 
> Along the lines of what I said on another sub-thread, I think at least
> alignment wants to be optional here. Perhaps, with max going first, min
> could also be optional.

Interesting idea.

> As indicated in different context by Roger, the values being uniformly
> 64-bit ones also is questionable.
> 
>> + * The presence of this note indicates the kernel is relocatable.
> 
> I think it wants making explicit here that the act of relocating is still
> left to the kernel.

Ok.

How is this for a new description?

"""
Physical loading constraints for PVH kernels

Used to place constraints on the guest physical loading addresses and 
alignment for a PVH kernel.

The presence of this note indicates the kernel supports relocating itself.

The note may include up to three 32bit values.
  - a maximum address for the entire image to be loaded below (default 
0xfffffff)
  - a minimum address for the start of the image (default 0)
  - a required start alignment (default 1)
"""

I think if we can agree on the ELF note, the rest will fall into place.

Thanks,
Jason

