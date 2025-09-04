Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D1CB448DB
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 23:53:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111011.1459960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuHtU-00055V-0I; Thu, 04 Sep 2025 21:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111011.1459960; Thu, 04 Sep 2025 21:53:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuHtT-000536-TV; Thu, 04 Sep 2025 21:53:23 +0000
Received: by outflank-mailman (input) for mailman id 1111011;
 Thu, 04 Sep 2025 21:53:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ehPD=3P=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uuHtS-00052u-IV
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 21:53:22 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2417::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91d66909-89d9-11f0-9d12-b5c5bf9af7f9;
 Thu, 04 Sep 2025 23:53:20 +0200 (CEST)
Received: from DS7PR03CA0124.namprd03.prod.outlook.com (2603:10b6:5:3b4::9) by
 SJ5PPFA5F0E981D.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::99d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.28; Thu, 4 Sep
 2025 21:53:16 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:5:3b4:cafe::2d) by DS7PR03CA0124.outlook.office365.com
 (2603:10b6:5:3b4::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Thu,
 4 Sep 2025 21:53:16 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 21:53:16 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 4 Sep
 2025 16:53:15 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 4 Sep
 2025 14:53:15 -0700
Received: from [172.31.134.167] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 4 Sep 2025 16:53:14 -0500
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
X-Inumbo-ID: 91d66909-89d9-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NCg8Met6HEC96Lfkz2cLhNO7FaFbYTOEd67tLi358+VxazoNlHUEE2FRl6Sh6m/BP/JTM4FHR7Jiw652dttj6jwuHTZlQ+Fqaoyrp52bnptkvtPJ9ChzxUSAyNIw7+6va2H5NjePKdCA/o5T7IXbx9YkS9Xhe8H7J96Fi3VVMhLnP5qIC4ogoCdPShwUfqQFi7C0ReoIaPGv6dkIJirYBHeLGD/eb4cvhXPCNDUAE018qbNOynnReief8O0WdwTaHJWZ0+imqp4XIIt4iJag8f1ygRwve9onsrzGDMGeDEm7eV7XElmvCCUVDJtOxKPM/R6MNWbDgXtVeQ9ONgr14A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLg0Bop3g9RNrWHcZaV6FS1fa74+VJ9gCzTt5m86b3c=;
 b=RHxLlJb7z2Ec/8pyPgEsSCiQkuRzAXx1afAHePUBqQjF750p1pZMg7XtE/kSTSayEuZG5aF+8YlPEiPYMvq8GUeAkCjU13mfLIPbSnrvOfVr6MGTxObcTnL5BbleFVF5Ck458gyBwMDgoiM/F4tvKsi2XXDHIjqLyYKZd1kGk8Jxk9KlMDHnXiaBMX3WoWcMUfFe2nTI0qfqTabS4MxEYSB09bCZgTneW5lpBlxYJVOhNhckyY4wJdOEjjd52BlF4JIJRlJ5n7pP9wboyKBcaSZjk34/WzH6963fLvsyIHx10CdsWvrPb7k1ssCVVx8FQ17LXdFI/l+ZAgAwuGf6GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLg0Bop3g9RNrWHcZaV6FS1fa74+VJ9gCzTt5m86b3c=;
 b=Iq8a42HzSPwYPA7tUo6W4E3Pb6Qi2azdyxc2xXqrRRGRwY028apX8ee3Yla1njxtxiwrEGqQHajgbYH/VEeNPp/x8ejpprNUGco+K6mh0GrGwRevoIVki2Cy6CPs2R0yaqAVPmZ+Bm7yo8ykLjFuBh6vAO4BD1VzTVrQp7t7/iU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d8af4ded-1473-42b9-9f52-187936e4dd1e@amd.com>
Date: Thu, 4 Sep 2025 17:53:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH] symbols: discard stray file symbols
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <2412a7a0-bdcd-4647-8ea2-8d2a927dcde3@suse.com>
Content-Language: en-US
In-Reply-To: <2412a7a0-bdcd-4647-8ea2-8d2a927dcde3@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|SJ5PPFA5F0E981D:EE_
X-MS-Office365-Filtering-Correlation-Id: d797facf-dfa3-42b3-fdab-08ddebfd7415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUJuUnNzaGNsbDJLUjNQMktqdW1IMjM4ejU4bzZzZjd0SWdHNWdOTTQ0RkNY?=
 =?utf-8?B?MytpSDE5ck0rZTB3bUpyWjJGbHpmOGExWm9lTmxBV2dpaWxxc3hBK1MvMXg3?=
 =?utf-8?B?MjY5bGJjSEhQUHkyamVaWENmbHMyVmFiMllsT1dsQ3RNazAwVVVGU01sUXRX?=
 =?utf-8?B?Tjh1eWRBdjcrd3FFVlM1L1M0Y1FYTXhIOUl0Q1Q3MFZRNHkyMWIxZWJxK2xo?=
 =?utf-8?B?dERCd0p0bEtuWGZyeVZGN05td1lRVk1tVUJHSng1TU1rR0RTMnQycVA2d1ZC?=
 =?utf-8?B?NnNVTndkdXVvMVRQamtpN3pWQUQrU3dERXkybWh6Q0VXZDRocG9OWC85bFp3?=
 =?utf-8?B?dHNCVWVCbFk0c0tWYVQrZkE0YWN6MU4vL291ZFN2Tjhybnl0dGlabHRya056?=
 =?utf-8?B?NElsL2ZaWDdDRWZUQWZQa2NDVkp2UGx0QjY5V1gvSDhjcVNaY0pOUE9FZUhu?=
 =?utf-8?B?S2Fsc0NpZGhPY3ByZGgvV3d3Mm96VDBMYU9ESElrOENXZGNQb0JyVHZPdmxX?=
 =?utf-8?B?WDkzNnI5bVVSR2lTVVExOXViMU5FNHFLbDB2YjZxSkwvbTFmRE5Vb2tvWlB1?=
 =?utf-8?B?S0ZncnRSY202VC92YWIwODFpcWhZWExSd0JIK05vUW1JZ2tjZDJTa2tVbUxI?=
 =?utf-8?B?TlR3TFBLV29aZ3pEaDgrdjJvbXJuODgyOUJKcWRCNFNKaDM4WmlKYWw0T3U4?=
 =?utf-8?B?VTY4ODU2WTR3Q2NTSVNCVEVtdmpLUTZzUmx6MUJMa25sT2k4NWpGUHNLOTVs?=
 =?utf-8?B?TnZyR2tLM3l1QlNVK1BqbnJURmNBODFxWG56KzZOdDlSQzF5N3VBdUZGV1or?=
 =?utf-8?B?UllVeEdRSHZtQi9YbFM4QmpESnFJaVJ2Z1RBQ2xSQ3JaaEtxNzZEcjFKTnFt?=
 =?utf-8?B?ek5SNkVMMThreGVrSExEUEsyRUdLZmpNcGQ4aEduMHZsMTZ3Z3g3Y3I0R0or?=
 =?utf-8?B?SUJiUDkwdmd0clhkeHJDTnhwNXNSYzBXUHVZTWQwV2wzRlkrTytMY0tVcmww?=
 =?utf-8?B?aFQwd2djT1ozRlhONEMrZDBaRWc1Mk5hKzhkY3g5aC8vb1hGSDVxczhvZEtX?=
 =?utf-8?B?OHlyOGMzbTVKV3NqQjUraHF6eXpNSGhiT1N3bGdXNWVVTHBiWDhvWEpjcnhq?=
 =?utf-8?B?SVN1UmpMckVJeVpodjBqb1hMVWl3UTN3UHh6bE5IVDEwL3RZbkE5Y2Z4UlFk?=
 =?utf-8?B?UUFKQVlXSmZwOFVaZkJRMTFFR3EwdllNZ0tpd3d6dTdMYzhERlRtYjJ3SWh6?=
 =?utf-8?B?NEZ2eE1VUGFMSUV3eXovOW5SbnRPWUR3RC9uMDFlZEVIbUdnTlNHYThoL0FR?=
 =?utf-8?B?YzNNMFM5akFJMjBXSVRTSHZ3U3pWT0E0NDB4akF2N3lTU1dNWE1MTFR6ZTQ2?=
 =?utf-8?B?Z2NpdDQ0aTM1NFdJR1lMS2pyazIvU3VpOFJmVWhXaWQ5VmFYZzlURkVFM3RL?=
 =?utf-8?B?ZGd1NklhdytTU0F5WUh5dnRHV1doQ2xhSEdQbXFZL2ZQSmU3elplUW83bEpm?=
 =?utf-8?B?L2U4QTdjZmlka3NhWmsyUWR3Wit6N2g1bFBLVE9EcDhIeDZlS1U5a0hjZklN?=
 =?utf-8?B?VjRVU2RLRU9HMGNsV3VwYmM0dTk2eDlDU3F3ei9IcmlLTmw2cmhneW4vWGxz?=
 =?utf-8?B?UEwvREl5WDZWRkJpUEpGVnFOQXpGcE1wZklCOHkvWWk4MUtoTk9QaS9KV0lh?=
 =?utf-8?B?NDVUV2pLWXZFK1lrQmoxZUp0RnA0bDArU1JxNmxkNXBYWnpZQXpST0t2WTJO?=
 =?utf-8?B?L0VlRWJxUkRTTndVRkJXc09ERHYySEwzTjQvWmxxSHFoWWFaVUxKUEY2ZXVH?=
 =?utf-8?B?dTRuQWI2azVGWFdWN05WMER5ak9IaUFZNElEekc5OTFjZjRES1pGWk90aGU4?=
 =?utf-8?B?N3A3Tk04OE5DV3RBQzNweVNqQVR0UUlKcEx1eFpHdkdCM2lXZzhYdTVzdXlq?=
 =?utf-8?B?WjBNQTB3cUZvWVMxK1lUTVdIb2w1MXdVWjdpbEIraXVhVXN4SUxsZVpJVk9X?=
 =?utf-8?B?TW94Rm02SDFKWGdJQ1FGZXJjeUZGTXBTWHEvUmlSbXpKUnpKamRHZGd4TDdO?=
 =?utf-8?Q?0h71yR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 21:53:16.2571
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d797facf-dfa3-42b3-fdab-08ddebfd7415
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFA5F0E981D

On 2025-04-16 05:00, Jan Beulich wrote:
> By observation GNU ld 2.25 may emit file symbols for .data.read_mostly
> when linking xen.efi. Due to the nature of file symbols in COFF symbol
> tables (see the code comment) the symbols_offsets[] entries for such
> symbols would cause assembler warnings regarding value truncation. Of
> course the resulting entries would also be both meaningless and useless.
> Add a heuristic to get rid of them, really taking effect only when
> --all-symbols is specified (otherwise these symbols are discarded
> anyway).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Factor 2 may in principle still be too small: We zap what looks like
> real file symbols already in read_symbol(), so table_cnt doesn't really
> reflect the number of symbol table entries encountered. It has proven to
> work for me in practice though, with still some leeway left.
> 
> --- a/xen/tools/symbols.c
> +++ b/xen/tools/symbols.c
> @@ -213,6 +213,16 @@ static int symbol_valid(struct sym_entry
>   	if (strstr((char *)s->sym + offset, "_compiled."))
>   		return 0;
>   
> +	/* At least GNU ld 2.25 may emit bogus file symbols referencing a
> +	 * section name while linking xen.efi. In COFF symbol tables the
> +	 * "value" of file symbols is a link (symbol table index) to the next
> +	 * file symbol. Since file (and other) symbols (can) come with one
> +	 * (or in principle more) auxiliary symbol table entries, the value in
> +	 * this heuristic is bounded to twice the number of symbols we have
> +	 * found. See also read_symbol() as to the '?' checked for here. */
> +	if (s->sym[0] == '?' && s->sym[1] == '.' && s->addr < table_cnt * 2)
> +		return 0;
> +
>   	return 1;
>   }

I looked at this.  It'll drop symbols, but I don't know enough to give 
an R-b.  I can't give an actionable A-b either.   Maybe someone else can 
chime in.

Maybe this is just showing my lack of knowledge, but could any symbol 
starting "?." be considered invalid?  I don't think I've ever seen any 
like that.

Regards,
Jason

