Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOd0DF1d+mnmNgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 23:13:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD4B4D3D32
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 23:13:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301108.1575448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKN2H-0003E3-Bn; Tue, 05 May 2026 21:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301108.1575448; Tue, 05 May 2026 21:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKN2H-0003Bn-8a; Tue, 05 May 2026 21:10:33 +0000
Received: by outflank-mailman (input) for mailman id 1301108;
 Tue, 05 May 2026 21:10:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKN2F-0003Bh-KG
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 21:10:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKN2F-00FIyN-19
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 23:10:31 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69fa5cc2-5cb7-0a2a0a5109dd-0a2a4501e97e-6
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 23:10:30 +0200
Received: from [40.93.201.34]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69fa5cc4-c1f2-0a2a45010019-285dc922066a-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 23:10:29 +0200
Received: from SN1PR12CA0072.namprd12.prod.outlook.com (2603:10b6:802:20::43)
 by SA1PR12MB9472.namprd12.prod.outlook.com (2603:10b6:806:45b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 21:10:25 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:802:20:cafe::19) by SN1PR12CA0072.outlook.office365.com
 (2603:10b6:802:20::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.27 via Frontend Transport; Tue,
 5 May 2026 21:10:25 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 21:10:24 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 5 May
 2026 16:10:24 -0500
Received: from [172.22.180.48] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 5 May 2026 16:10:23 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqJ0OkX2yrXLiT2h1SRFZ/GwtOXTeTR/h0ZKqvHXZtj+R1Uaj4iGu/soOe2qrOUw4kBechkD3W6EtkjeK04yqCV3H+r/8y+LuWxJo4gVMfMZRweKkf1WE1fnzxe9DJDtvGDB9Ig4AqTkto0vruiPWOLPY+1L/SsCSsP1ISYYNxi0O/LlUoJ8Z3ZcAmTXfJ4nt6o2NihMIcE1gOB/5CO5XohdexV8Xi+3iCvRinF/BIUCdc43iMUpAtIkf94vhBP3BhK6Y9s87BnLiG81tkFIDhPIDWLoreSufayL1j08P8gqzkbn7bS/b7yWGF+wCHgh71gT0/jjVUZwFv4pzDkq5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FcoxPBlPRCsC4B3NbAyDyF622Hveg/a75eKDYCh94E=;
 b=aqqA4a1eYrvtXkIv0YaAo4bm50aKSPZLCeFcVwcWi64gttiV4ogewSjBFgnGYYlquzFVlGoPurFULgRBcL6zO9rgNVQAk7TBejC2TO/VpoSnIboUVngNcP5AmdcMBXiD4o6/pQ2OhK30dWqrvKFa+Xx/h9zbCshUPPdZR2j2PeVpFsmPzVZO6LaBqYNbaKSk6kPLnaf2a/vIW+i7n2LbkGKBYenae3erwM9jqjRwp5D3k6y8C1aecEma9fnTbnp5FtsVGE+NIrfwA7Yi6bw/dqdJ9r1IelIJHQWCpAS+Z6Ank8//l3D1W5Qkf22yIVTtyccWAWKfHd3dSoVviYCsoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FcoxPBlPRCsC4B3NbAyDyF622Hveg/a75eKDYCh94E=;
 b=CEyjH3lbAD8wqKIEpTy8uwJTv+bOlF4GCu0c1Mnelsrx5W23p5+85h8gntSVD4/Lph5Y5kjRC6I6zVbJsC1RE0GWrwz4EverGbcCQpD0e3L8NWRHoN0VXGJDUcpzi/j/4/fCjJA8YRWHede0r3Fbu5BuvdRCgXPMwqFwjvraD20=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <089b9287-addb-4736-8174-f8a297de877f@amd.com>
Date: Tue, 5 May 2026 17:10:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v10 2/2] xen: Strip xen.efi by default
To: Frediano Ziglio <frediano.ziglio@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Frediano Ziglio" <freddy77@gmail.com>, Demi Marie Obenour
	<demiobenour@gmail.com>, =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20251208133945.61375-1-frediano.ziglio@citrix.com>
 <20251208133945.61375-3-frediano.ziglio@citrix.com>
Content-Language: en-US
In-Reply-To: <20251208133945.61375-3-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|SA1PR12MB9472:EE_
X-MS-Office365-Filtering-Correlation-Id: 44152470-33cb-4ff9-afbc-08deaaeab9b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	0N5QSXrgr9/Hfln3VY3mN7R74gpmLg/jMFLhIWmLf/m4hSly46FgBLXeYoq2zSk5SDUT+pF54NfERrsBqvTNaOX4jW7fMgnsL15l6KM1fbaHBs++aFEdyloFDjxJhz7J2Mbwh+dK4iz8SW5Hee+ZWbHq8OcguaTJX3GIs0FbL9T+wfWxqQiwe3J3lHICoxZqVxtLnXrubxLLatUBsCPYKrHvQvWu6zvl2JbXZBg0Xhe+OmMyviIw7jYpy4ETWfWU3/LWAvgNhNP9gMImvEHBEYMv/i/nHZlS0+IYK3ewZVHwXTdL4p/7QFvibH5h/2+/e4TZaFB3ntbpvY9wWNKJb3PqPSSY6hfsE7TYMFplZRkBYGw3FobS9n978dj9fwScVSakxT7SXdfhfk08ZCXJ4wDBxT2mZFUF4V7VbEFWc9ROJ0mKptv6ptvr+ahZMOFT/NHZaG27O7lc4ASOet+7uPcikXU5G9iCLXITI88WHoE7Xf8juE4mu38ZL8jsSd8G+yyl9uZT8/2ao5JbM04tKtiSVIxHy5VlLOOdjLJ7j1qSHLGs4z9Vlumn0U139Blaad8N289DoeTKMORYB7ae29bBoYe0ec3/MNPSbku0e4k11+25hu8H2HqmZf4DX5JLHJrEJxDoram9Nh1wsZb1mxu6Tr+aXRzoBYlswYA+wdnrDyA5Nj5KS8gHrIIdrkACl7sHRMXonMhCGx3c2F78Mvw20utFZgfmnjs6U/n5SV4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TLFFy0clTYwzbss+yz02rb3wmjcQiJffNHv6iQAsr5axiQW/Np7+VznloPjV1Nv27sO8Z26AtzY19Wqn3+L+wOVbfy9PiXD3dSe8aNHeLFwjSvReUNF9FHGFNjnM6BVlsRicCTMXu8un0mXeZRU/f0UNYC2ZpnT1dYrRkFTMdC9j7XIPNqzVSZ+KqNL2i1qtynpV/9sUGASd4FHsk5CXSstX6FZsr/svjw9hfGZAlod9e5VoHNLDK25w0JmhAmMD8lCGHGqLde5bX9uHs9vCp35EurXqWNpWSlthVgX/TnCERmfu17XBl9NKg6mz3B1vV+XlHUeIb0T619Vl/fXT4KHgA622t7xIlmECd9lvfErNGEPZY5wf86EVH99m4bXQlJ6FhUK6K1aWlGZVwrDZUECU+muL+OS6RuXChuXjMxPB8NpgaaU68LqgJeTS+FFt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 21:10:24.7781
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44152470-33cb-4ff9-afbc-08deaaeab9b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9472
X-purgate-ID: tlsNG-d62444/1778015430-BF07EFF4-044A71D2/10/73395122804
X-purgate-type: spam
X-purgate-size: 672
X-Rspamd-Queue-Id: 8DD4B4D3D32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:frediano.ziglio@citrix.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:freddy77@gmail.com,m:demiobenour@gmail.com,m:marmarek@invisiblethingslab.com,m:stewart.hildebrand@amd.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[cloud.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,gmail.com,invisiblethingslab.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	BLOCKLISTDE_FAIL(0.00)[165.204.84.17:server fail,10.180.168.240:server fail,2603:10b6:802:20:cafe::19:server fail,10.181.42.216:server fail,2603:10b6:802:20::43:server fail,40.93.201.34:server fail,10.42.69.1:server fail,192.237.175.120:server fail,195.190.135.10:server fail];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]

On 2025-12-08 08:39, Frediano Ziglio wrote:
> From: Frediano Ziglio <frediano.ziglio@cloud.com>
> 
> For xen.gz file we strip all symbols and have an additional
> xen-syms.efi file version with all symbols.
> Make xen.efi more coherent stripping all symbols too.
> xen-syms.efi can be used for debugging.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

While there is some discussion about patch 1, it seems like this patch 
can do in independently of it?

Regards,
Jason

