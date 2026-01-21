Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDXFG9m1cGndZAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 12:17:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6D455E0B
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 12:17:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209617.1521571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viWD6-00015l-Nq; Wed, 21 Jan 2026 11:17:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209617.1521571; Wed, 21 Jan 2026 11:17:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viWD6-000136-Jq; Wed, 21 Jan 2026 11:17:16 +0000
Received: by outflank-mailman (input) for mailman id 1209617;
 Wed, 21 Jan 2026 11:17:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZBm=72=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1viWD5-00012v-Bc
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 11:17:15 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc411f27-f6ba-11f0-b15e-2bf370ae4941;
 Wed, 21 Jan 2026 12:17:14 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV5PR03MB8409.namprd03.prod.outlook.com (2603:10b6:408:35c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 11:17:11 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9520.005; Wed, 21 Jan 2026
 11:17:09 +0000
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
X-Inumbo-ID: bc411f27-f6ba-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f21WM8A86tgTBvzKpsCfMpBlcL3i/CM4EEhOkUQiolSoHTfZ3RxgygdT1i7I2JEEfNLQ4MndeAy1XE2cTm6bRf/ZCNmtfrJUw4gCIbn7ixycD+gKupQg1fh75ChpbVe62Jmx27f53YJZkAl/LflUzHkGOlGnDoJ/RIyV8TlabDogzt/V/bQ0WtrhNaY1UCORCSzJ+WNtf9g8qk1d4+mQpbyrj8PGanmmK02yA/si0tcI3PmfddSXuTTiTTFhPWtc+B7186BzlHw7up+u3mTdv4nyHC0AVsfYj0W/1ADZINmouXa044CQC91IPaHtweBzR0114BwRr53X9A6zGfSaSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKv0P6YLHMGbIrPftXIXlkcyzSLEj4XBAkEKLdidU7Y=;
 b=pAXZNTydn3UpXIoqiMciwNtXZHdMf7Dy4nQ7o64dKm0Nnu0IfiIA3Tjua9qnQlpKCyUG/EGZlsdLGBEy9tYmzgGajofZmWiKFLENExZAqNbuaP1BjzynOngyfRm6YcKXmsFqH/FH3SuCmdgOhwS4a2LgYsZjRCSJ9nhuc7FunruitsmxnBgeztS0NPVIxyr9XZ2Bhh2UtIelZG+ZucpIookSAF1xWgDRt4WN+53g1wKIJ3smoqLzn/kW9FGgSZcjuiUiR3RE5xZJr0EqcUmHOzV/FiCkLLX1B47l53l9rbdM7wG9Cb6VlMaQAcwIMwIUZmGi6UwVy3x/K/Fc3v0seg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKv0P6YLHMGbIrPftXIXlkcyzSLEj4XBAkEKLdidU7Y=;
 b=y8nUov5QDWnxUsagC2u/8Wx3tHwxaxIe9AiIG6wQ1ilulcgiW0I5ZQJsNwIB970WGt/McW0X8wYlQsvxIy5VYzjtRT+ulKYoNHK+xOWDoPeHfwUC+OJ/3fBWfMRFbDOvaPm8h2B279aFT6496FrauL0Pi+toEbobTUsE2iZV1qc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 21 Jan 2026 12:17:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	James Dingwall <james@dingwall.me.uk>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] Partial revert "x86/xen: fix balloon target
 initialization for PVH dom0"
Message-ID: <aXC1sFjIRUEB7qOW@Mac.lan>
References: <20260120140648.25977-1-roger.pau@citrix.com>
 <b515af46-87f9-49eb-9d05-08315b25eb96@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b515af46-87f9-49eb-9d05-08315b25eb96@amd.com>
X-ClientProxiedBy: PR3P193CA0052.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::27) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV5PR03MB8409:EE_
X-MS-Office365-Filtering-Correlation-Id: 234588b7-f69e-4543-2417-08de58de9e60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGZpYzJWS1VvdjhxT3JLdCtMOWNzOGUxd3RFVHBRM0ZGYlhISXBRNndOODFH?=
 =?utf-8?B?TE9KaE9GOUw5OTNOUmttamQ4bjFUZStCNFE0Y0RLbllFOVdZNjhJU3NpNThw?=
 =?utf-8?B?c3hJbC82UDF4VVpnUEtrY3A0Z1cydFZLdzhCWDRZai9jVlNWWjQydzcwQklK?=
 =?utf-8?B?VHV6YjNxS253QXFZSUVkYm14LzdFWlJKdjl4RTYycWd1aDBJWUoyKzNYQlVx?=
 =?utf-8?B?cEdtRUlFUk85aWY2VXY2ZU4zS1hMWGtiL3MyVlF1UlEzd1NHd2VMekZtYzNh?=
 =?utf-8?B?azFzeUlGZTNJTngrQzlmb2xybHc0UTlMMngzbWN2dzdRNTlMelJObnZLb3Bh?=
 =?utf-8?B?TWp4blJCMWJmR051djVmcVBZWkVQb0VtWkJEaExxRkVjUHpJS2VTNnRaZ0l4?=
 =?utf-8?B?VzFkSzdGL0w4cCtmL2xQMUkrSlNoOVJuVDBoVDh0ekhGc3RPRG81cXZUNXNH?=
 =?utf-8?B?aUo0QUpOenFwWC9kUjdWdHgxdndON3JTZjJYSHZxQkNyWDA1YVZrNmN0UXQ0?=
 =?utf-8?B?VngycW5Tc1c3Q1R2VVpZYndQS2NDOXNZWEJydE43VTMxdGZScWRsWkYza2ta?=
 =?utf-8?B?cWVyT1N5eTl0c08rcWJaOWpYZWg2anRUbWM3ODdqZzZOVy9tajBudUZHS0NT?=
 =?utf-8?B?Nk1GZllQci9qa2hHUkhiMVZEbmR5ZjN4NjBuVnpnTklwcUJJb3k4K0pPbVVw?=
 =?utf-8?B?WHZMZmNCWVBoczU3YzFoN0o4WkVXdkVtUEd3Sm9PSVA0dFcvSGNYbWtWZ3ZJ?=
 =?utf-8?B?QklLMSs1NldJVS8rVWNtcjZWc016cUpzOVdpLzJYbXhhajZhaFRmQllIcUVG?=
 =?utf-8?B?VzRpUi9WN2NkQ0J5MGFlQnJsclpzaFRhbk8rVHZtNGFJV0dzV215czBZNEFF?=
 =?utf-8?B?a1dRaHlXYUNpUEd3TnhjOUJRNzF2UVArSEY1VHREWWhBanI1QWIreE5DVW5y?=
 =?utf-8?B?Z1ZrWDV4M3lXTmd5U3U5S0x5RVd0N2NtWmFrRS9IL1FKTDFTSkhKV3lVNzZT?=
 =?utf-8?B?SEEzU3lMMlZaN0dneEphUUJQWDZnL2dvNmFoT2c4enpydmJQNnk4L1NFMnBu?=
 =?utf-8?B?T29lenJPa2NCc3ZvU2Zyc0ZZY250OFN6NEdqYUhaVnYxWGZzKzZvRXJXRk1C?=
 =?utf-8?B?dWs2dFU1ekhKYmZ0NWVLaVZsMGFDS0dqZ1cwYlN4RXNvRVZRL1FIbU5zMXNU?=
 =?utf-8?B?NEpLbFhZcWhEQ1lEVDVOcVo4eWs1YkNzUytwMmxLNENzMDB6aStsNVdDaUxj?=
 =?utf-8?B?RHhOd0xqM3VtQ1ZlZTRZSVJZVGFpejlFZHU5Vm42UkdQNFNiZ1k0bXBMRWlm?=
 =?utf-8?B?aS94d0FtcWxmS0V2ZGV3dWwrK00zYlhiYXViemNCNWIyWDdiZ0MyZm5uYU5o?=
 =?utf-8?B?TCtvOTFsT3pPWDBkK3NCd3VhaUtkaFZHeStLWWhUSVo4RmNkSWc5TXpaWUxl?=
 =?utf-8?B?UzN0RVVhTHJHNEhrNXZsVmh0ekg0SEdxMmZFbUo5aU5Ca1g0cko1bFd3SDlS?=
 =?utf-8?B?MndZM0hEalQ1WUtyU2RPTTIrUGl5U3ZqaWZDSnNpS3RwVTZlWnh6WnVVY2Jk?=
 =?utf-8?B?NzdUOGhVcXpCZHZCRGdYQVhMZVR6TTZkUm9wZi83THFEQ1pPM3RWZXJBMElw?=
 =?utf-8?B?NHdLQ0tpU05oOFJFa3lXQWdBdTg3bUl0RkZ5V0dTK0lvOWpnM3dTQm1mZFYr?=
 =?utf-8?B?UlI0MnpwaTFGZWE4RTlqWlFpTFQvSEkwWGo3S05Pd0pSUHZQcFM0MVEzRzF6?=
 =?utf-8?B?OHJTVG50Zzg5VnNFcklmMHhBTnVEQ1d1bFQ1bC9WNzdMdHB5OFJFQlUvNzZ1?=
 =?utf-8?B?V2pDdzlCWGI0ZFNPMnNMRTBVZG1wUEFQeWtIUzRjVGtVM3dGYzMxV250THdm?=
 =?utf-8?B?TThZUEtpeXBqMzNOQzdYSDV4S1RNOGdEYUExSXVGNlhUSUtzWW5yR2c0dmw0?=
 =?utf-8?B?NEZrRHo5YitNdVI0UmNsbDZwbXg0b3liZTladFY5MkdQci94eHZ6a1BiVWkw?=
 =?utf-8?B?NmVteEZhd3NOQ3lxYXkySjJtTzJCZEoyc3hpajRWMThqc0N2VXhVcjNBVEpY?=
 =?utf-8?B?VU02SzF0K2Q5T2F3bkQ1OXp4a0tCZ2tkNmFWVmN4VmR4NjFjdnRKeVo3M3Q5?=
 =?utf-8?Q?xnsU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEtiSDZFb3lRQmZoWi9yWjF6b0o3ak9FajJGV1lMLzFINm5EQVVZcE1sVWtR?=
 =?utf-8?B?L1Zrd0Y4bU5MTk5BUWN2cVBRdG1nbmZJT2liRHl4bWFHT3o1ektBNy9aVGhY?=
 =?utf-8?B?YkUyem5SdmRucWF0K3RXQzgzRUtpRHFlOVl1RUxwQXBOcUd6TnlteDVkU2cy?=
 =?utf-8?B?RS9KKzNObVFweCttVW54K09pQTcyczJlbDhjV1l2QUMvcThKVEMydDBQSlhI?=
 =?utf-8?B?ODkyNHdYVElvZHRVL1Nsa2NxVkttbzlGVWw0QVFSTHlRT2UvOUhublY1SnQx?=
 =?utf-8?B?WVk1bU81OGZGVVZudW1nbEJNL0RkZG1hZU05QlVFWUhGM2paUi9kcXVCN0hQ?=
 =?utf-8?B?YTE3NTBsVk1PYkoyTjFUY2YydGJ3YTRhcGtrRmY5OFJidllnNXpwZEI2OFhI?=
 =?utf-8?B?MmVncmRZSWd3UnFVZ3lNVTgrbDVsdUJqSFJxbGR5WmErVTVvNHY2MVVxZzIr?=
 =?utf-8?B?QlhodUtrTE16b3ZNSzZlQkRKRmJ0SG5vdGhGWExyK2JWMkFjOE5Sa2ZSSXht?=
 =?utf-8?B?SFJpSlhTajROL015OENSR3lTTTN5ZnlmSmVDR0NERmt3cnNFUVF4d1NudURK?=
 =?utf-8?B?NEhTdFdoSjBGYjhnaDZEdVVuK25VcnVVaFNZZGlUaCt5ZEF5QjUweUQ4MTBF?=
 =?utf-8?B?QzcyMnlZL3M5N3U0R0o5MzFTbzhMc0ROeFBwbzFVbktGSG96enNEN3pjcnk1?=
 =?utf-8?B?cEpvOEZ5cXFJaTltQjNPSHNmOVBtYXhKbFVhcDlEK0JQQ01wRFRpeU9lS2ds?=
 =?utf-8?B?NFA2Q25tb3NOKzBXdzNyTlMvMFRCY1hTM0E0bmFnS294Q1B6VWJzWlBYS0hI?=
 =?utf-8?B?d1p2Y2ZEYmZ5dE9Qa3dXcWxTbFMzY3VMU2ZXWmxoWER6NGkzTFkvSWZLT05s?=
 =?utf-8?B?ZndFM1F4NFFjQUNKMmFlUjU3bnhkeFlUN2k5VmtkU1RxRHp4MjBVckpsVksv?=
 =?utf-8?B?K3VOeXMvdXFsS25JMGx6TE0yc1YyNDY0TSsrQlpEeE4rRjZqaHNUZjBDanEy?=
 =?utf-8?B?V0licjRNaVVuQlpoc094UC8zbUlaL0UzVjRGY3JYM3RScUVNWWZucmpLSzhF?=
 =?utf-8?B?Ujl0SFNtVFo2QTgyakZYZHByeVlKaHNlQ250L0hTeDNIS2ZZSHJOQmxFM2RP?=
 =?utf-8?B?RmlSbldKclBHNzMycHI1ejRpZVY0eHFaV2RkVXk0bjc5QjBtMDFjWUNqN3lo?=
 =?utf-8?B?TzhiOFlPU01RbFVjRXNRTXJWdDhmWUV2UVhMK1poQUpCTERBU3BJTVlVZmhu?=
 =?utf-8?B?V1RPOEZ5MlpId25PdERZWHJIYWZrREhSRDhVSGFmdkcycUlBa2hIZ3ptemtB?=
 =?utf-8?B?Z3JTb2h6cEc5cEp3SGFPRHNlc1FOVkJoSlh2Q0FGVm1aZlpKRys4eFJZeTBP?=
 =?utf-8?B?Ym5XS2FNSlJmS3dPajZGZCswTExSMmNlZENRVEFURmhGVHRPNWNVQmdTVTZv?=
 =?utf-8?B?RDlhNDQxZkc0WWtSQm1DY0JWYVpmL3N2MFlodFJBZjhyVS9DMEswaFN4bUFz?=
 =?utf-8?B?WHVrTVAwMW4yMy8zUktROVhEOWhZMDQ2UUZpMnc0ZHpTR0xMQ1RkR2JVNjFi?=
 =?utf-8?B?c0NnNmxMV0lZK0F4U1ovVCt0MEozRUVTWUd1eEh0SkphOWhjMi9pa2h3WUV1?=
 =?utf-8?B?MzY0djg2RU5ldk9GRlVTUEhRYU1ZeUJ4dnJiN0hJUXJ5dDROdUk3Q1dDVERm?=
 =?utf-8?B?Wnk5a0dCejB0UVBpVUFiRy9VN1JLaXFlcldEZi92TC9qMmQ0YVUvcVRkWDlV?=
 =?utf-8?B?ZTNjT3dKRmMrOE9LYUdod2gvRTNRY1hzWlBmMWNWRThsdERSRjhFNUllQXNV?=
 =?utf-8?B?ZFRVOW5DY09qZGMvQVk0TWVWbkF1QWI5ZXVPdHF4NmI4dWZRbDVxR1pWZC9j?=
 =?utf-8?B?N2JpUW9jdVk0cTYxZ1krMGozMjQ5V2pzWHlHVFhGY1BDd3FZWUUxa2lYbnVw?=
 =?utf-8?B?UXE1OVhOTWF5ZnNXcVJiMmxVU2UrOExiSDB5SUJJYmNaS3NUTlBFZTZXYjFj?=
 =?utf-8?B?MWlrNjgydFRxVlo4TVpBbjdoaWh3MlVLclNXZVJoL1pON05YSmptbWkwSXJ0?=
 =?utf-8?B?eHF1TjZQK3BNRE53Y0NSckRwU2JBdDRkMGZobG9lenorOThxYzYxdmVDSWZQ?=
 =?utf-8?B?aVJkNnR1bjNIVnZBN2ZFU2RxN2RjYzRDM1EyZ2pnMitJTEFCK0hlR1dBdnlS?=
 =?utf-8?B?Y0xrSml2eVQ1eGp3SXV4eGRtZUREOHpMeTRINVlkVmZqUUViRG9oM2p4MDNX?=
 =?utf-8?B?SE9maUpWZjBvNHk4L25pM3FsODFsellRM0xxMWpqYm5UM0lpci9KSEt0QU5k?=
 =?utf-8?B?SEVCd3lxZHNENmVDNSthZnVGdklSYkJJNGdWNURMcFJ1L2czWFhVdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 234588b7-f69e-4543-2417-08de58de9e60
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 11:17:09.8257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JCf4i/bB0t5tTnLGY23+GDNXnTWusXPJsj+A4dGhjIZkrNpy5Uy4tskvzzog/XvE4/rVtiMS3WUPoM+pRKid/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR03MB8409
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,dingwall.me.uk:email,citrix.com:email,citrix.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:james@dingwall.me.uk,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CC6D455E0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 03:10:06PM -0500, Jason Andryuk wrote:
> On 2026-01-20 09:06, Roger Pau Monne wrote:
> > This partially reverts commit 87af633689ce16ddb166c80f32b120e50b1295de so
> > the current memory target for PV guests is still fetched from
> > start_info->nr_pages, which matches exactly what the toolstack sets the
> > initial memory target to.
> > 
> > Using get_num_physpages() is possible on PV also, but needs adjusting to
> > take into account the ISA hole and the PFN at 0 not considered usable
> > memory depite being populated, and hence would need extra adjustments.
> > Instead of carrying those extra adjustments switch back to the previous
> > code.  That leaves Linux with a difference in how current memory target is
> > obtained for HVM vs PV, but that's better than adding extra logic just for
> > PV.
> > 
> > Also, for HVM the target is not (and has never been) accurately calculated,
> > as in that case part of what starts as guest memory is reused by hvmloader
> > and possibly other firmware to store ACPI tables and similar firmware
> > information, thus the memory is no longer being reported as RAM in the
> > memory map.
> > 
> > Reported-by: James Dingwall <james@dingwall.me.uk>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks.

I've been considering what we discussed and as a separate follow up we
might want to attempt to switch to using `XENMEM_current_reservation`
for dom0?  It might make the accounting in PVH dom0 better, as that's
what the toolstack uses to set the xenstore target when initializing
dom0 values.

Regards, Roger.

