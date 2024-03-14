Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A732087BD2F
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 14:01:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693205.1080979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkkiN-0003i8-NV; Thu, 14 Mar 2024 13:01:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693205.1080979; Thu, 14 Mar 2024 13:01:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkkiN-0003gN-Jw; Thu, 14 Mar 2024 13:01:43 +0000
Received: by outflank-mailman (input) for mailman id 693205;
 Thu, 14 Mar 2024 13:01:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QCks=KU=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rkkiM-0003g3-BW
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 13:01:42 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe27e87b-e202-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 14:01:41 +0100 (CET)
Received: from BN0PR02CA0046.namprd02.prod.outlook.com (2603:10b6:408:e5::21)
 by MW6PR12MB8833.namprd12.prod.outlook.com (2603:10b6:303:23f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Thu, 14 Mar
 2024 13:01:35 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:408:e5:cafe::b1) by BN0PR02CA0046.outlook.office365.com
 (2603:10b6:408:e5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20 via Frontend
 Transport; Thu, 14 Mar 2024 13:01:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Thu, 14 Mar 2024 13:01:34 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 14 Mar
 2024 08:01:33 -0500
Received: from [172.17.162.8] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 14 Mar 2024 08:01:33 -0500
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
X-Inumbo-ID: fe27e87b-e202-11ee-afdd-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GdQTB/btjcGaMAVbp0lABPRf0/PeVeDJDJ9yOg3zu2ijum8tOS0c0cpqAvVNC1UJvSsqBDEYGjfseZDpNkw00Ne9E5POXxcgW05b0OB7TuWNre6gSlYHKTuRQwikcl4jHhIaYJl72Cup645OANXmKmo/5W/PFrIMBgukBtJVLLozBj4AHpZ0AeRZzYEKms0t1pAHhab7tPbkylpDlfOLkiaCP3VSe2R6IYoPEcZ7H7lNE6RBENy7mmZz9x0TjgaB+LkfA0+VULeVhrPvQkH2RzXZVIZmLvELEd8JGsE03YskHwF19CJePt00gKu/t7AaCBQFMD3BpjBMz+hkfu680g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DHtA8NVvw/hqNNL6V0lTnnxoGT8K7/zE/1b3H+04ic=;
 b=CRZXeifnvilGo6pCpBVYyonYIlZ/witq4ow1K2dLgRYGfdHSteBapBPNWPjw+D9FvuxBib1Vt/jB1jbWd1Nhtd48cGgghcn7d4d68u6g13nT3jZRu/vscQvuxYZJV0GNeeOdJV0bmgqFhYsaKzMoe+XTGOTzxG5zXSKdZ7rTXJNi585XNFfe7UUxWrYxC6jqrfoZe/bGYa0jfNQM88Czqc9ZsUamTppY4MZ2032qvETjJRYXEaXIq4qHuUDA9B9YAyBvX6rWQSLUAJUZDHoQuirGiNQzPU4i3cH9ms9N/SSftyHKasRyvjhMnDfvepYlCbjURT8Qt2jiy6hZMcOF4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DHtA8NVvw/hqNNL6V0lTnnxoGT8K7/zE/1b3H+04ic=;
 b=xAn5iJwBEwW6O0qZ0GyyhAIP0cLhaoOTapHzs/tIzb26KYNlnnf5tnwNg1Rlylc7xCbrQ1yDmj0I+I+8fcxBhOfptKSPcEIZAyMfGLrK0VeZ2k27lkpwgt5dsDd8hLxaqTUtnuGyzNUIiTEAhq1o1K86DaoD7aPePIWvepokwio=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ec76d730-e8b8-4354-8d7d-7b6e923e2594@amd.com>
Date: Thu, 14 Mar 2024 09:01:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] Revert "xen/x86: bzImage parse kernel_alignment"
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
References: <20240313193021.241764-1-jason.andryuk@amd.com>
 <20240313193021.241764-2-jason.andryuk@amd.com>
 <82ae53ac-f2d1-4d86-8719-4e5cc2e5f57d@suse.com>
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <82ae53ac-f2d1-4d86-8719-4e5cc2e5f57d@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|MW6PR12MB8833:EE_
X-MS-Office365-Filtering-Correlation-Id: 97d96a7b-56c5-446f-3413-08dc4426e091
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KBWSN2JS8BVT4oSZxBlWhWTT+OVoT/0iLC+lnB/YETEmopF9bjs1QIKZdmpBupNgC/SXj/3Xfcw5h8jmfpNv1jGaHjUm5wsZot1/1DblBCzrrTpBu4Fv8H9yyVY3C9vvOnheSdXFJpGdzrcwVprjys7hFZiCjJKeGHTAaGlQHS2zGrgNE6m2J+F+Fnu5niK6qYlO/PvhUlZIGUe4u+Vo4qNZR8PfoWCe4YTbsnV7yoFFwaQuLHivpAgfQoGHW6UmbkWGfAefqBAdBLEPnIqIy2DSJUCEOZYJdh979XMSHZOLlUZTR1ntsHBmeUTRlw/r3V7EFAQI2ivPdRg7nyAUveqY3JHSKWWudr0X7ph9lbnIV4dGQIsR14s4ShhX1rfk6ZcZzv6BAPBwh4IW5cXC25KjE2ZaLIZDYpZ6WZqRLDmZzl0XqIvOA8bsmuFpMouNZgMjYS3IF1RT0Z63nBk0xM9Vfl5yLyOIlAXXWw6W1zfmDCqZuavCTWSVB0Jv+dODk4Hifou9xsFOGe2Gxvue8UliVYpADHUwrUTxjCzYWEFYP28znlIW7LubCKTgPcEUjC7k+kj/8KBpqtdxTT8n05QSB3j4QK89/z7MknUzQUrF2RGRHrjyNwumNaFeRQu6HmvTpUJQHtOzHWlc/IS75MqMYJVheZxK4hLwPmeGpOHTYTkCeVgQgsCGPaIhXpoIt6y7dCh+D6Y3Pk18KY6uLpLRss87FyGajfRwFJxS4emiYpz250WZ9M0Bw5n0NpRT
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 13:01:34.6357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d96a7b-56c5-446f-3413-08dc4426e091
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8833

On 2024-03-14 03:11, Jan Beulich wrote:
> On 13.03.2024 20:30, Jason Andryuk wrote:
>> A new ELF note will specify the alignment for a relocatable PVH kernel.
>> ELF notes are suitable for vmlinux and other ELF files, so this
>> Linux-specific bzImage parsing in unnecessary.
> 
> Hmm, shouldn't the order of attempts to figure the alignment be ELF note,
> ELF header, and then 2Mb?

This patch series makes Xen only relocate when the ELF Note is present. 
Linux PVH entry points today are not relocatable, so that needs to be 
specified some way.  This new note also includes the alignment, so there 
is no need to try other means of obtaining the alignment.

Also, the ELF header values didn't change with CONFIG_PHYSICAL_ALIGN, so 
that didn't seem reliable.

Thanks,
Jason

