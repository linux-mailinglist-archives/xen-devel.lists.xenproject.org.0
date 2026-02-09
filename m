Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UA2nBfkSimlrGAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 18:01:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 296B3112CEE
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 18:01:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225925.1532539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUdd-0001qN-Jr; Mon, 09 Feb 2026 17:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225925.1532539; Mon, 09 Feb 2026 17:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUdd-0001oH-GH; Mon, 09 Feb 2026 17:01:29 +0000
Received: by outflank-mailman (input) for mailman id 1225925;
 Mon, 09 Feb 2026 17:01:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/dId=AN=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vpUdc-0001oB-4X
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 17:01:28 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5b8ce1f-05d8-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 18:01:23 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5632.namprd03.prod.outlook.com (2603:10b6:a03:28a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 17:01:20 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 17:01:19 +0000
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
X-Inumbo-ID: f5b8ce1f-05d8-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OXyQo78R/nZmzHfi1Nl+DISAaA75A3p3G9dokMkWWWEjMfzh5zWYvDTzvVCsJHKs4JBResvBFo0I2VaXsU2SKTeAeHkOqTf6m+AMp+zwILuOKLYFUeWcoY4SLHyiil0myYci/DJ5gBie6lTZMw44VVw/wfWh3aHRARwhZ4xwyJ/nHNK+2ZTNpS9hpotlwR2g84GseHgThesr9wwPLtAgVaVJJhVU/htE/E9GrwZJXDMmDT/jTWF2dMfmLw0NjFA0x63+I+QeQlbYEJDJ56z1HzSvnw/v0y1e/Sfb/qJPS4T/9mP9zWIvdkMq/FLRfY1rKDjQHSm0ZADdQIWWyfEsMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkMLS06LOzOuAMlRKpcofuI3opLzojEgUC2Po7VbYYc=;
 b=xN3fkrz3Axrhn4vtT+S3eCujU+TTK/z37+ofG74x38wxXWza0d7e/YwycPa3FplfVTRsdDLQ5IAu7xnxOgwat8COUVJPPMbiCg4chEoo+gM/6cX90KJzJweIv1pxl/7KZv9GO9RKaO8/A9OaX/yc5G1vVebGY15r+Mgl+YIhcsB7nfE03o3+I0YQYzuRuIQhhT35Ro3leU2//B4A5RN3mFGhU934I0l6o61oYzavZxZIkVLoYa8ujshGMwTPTF0rCBb1wnrpeSEG3m5ejCz66VSaxOk730Gg9JQwBCLPOOVns5oD6ORoRoYUETmPHndg2YAA50brTIxE0mLCQRqdaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkMLS06LOzOuAMlRKpcofuI3opLzojEgUC2Po7VbYYc=;
 b=O/bVAS4ayzQ3R5fh7NbDpVai/XDZxAElYzM3C+I8oTzRuk6aDIMvBgXuqwWcgZRpCp9DFAou530XQpCCIw7oGUrikAERkSoPry548vMUN6EFuoMnBetggTVA2iiRadd2ma9iFJ1lPLh5Mk77uAariyn3fUTWStcr9PEwY6w6IHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5fcaa5f3-20de-43e9-9341-9c405ac34370@citrix.com>
Date: Mon, 9 Feb 2026 17:01:16 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Tim Deegan <tim@xen.org>
Subject: Re: [PATCH] x86/shadow: Delete the none.c dummy file
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20260209104104.7840-1-alejandro.garciavallejo@amd.com>
 <aYnyY2MArv4vTXsY@Mac.lan> <DGAJI3UYR98J.FU94VABOFZ5N@amd.com>
 <aYoDiDiJ4rRLxhmw@Mac.lan> <DGAKH0QH3EG8.8GOWCPNH2Z79@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <DGAKH0QH3EG8.8GOWCPNH2Z79@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0211.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5632:EE_
X-MS-Office365-Filtering-Correlation-Id: 7675fb3e-fdc7-4352-9960-08de67fcd89d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?REpqQkxYZ2gwRDFMbzhKZ3dyWHJYM25EdmYrdy96clNCNDdBdnFiWm5kWFhl?=
 =?utf-8?B?UHU4b1hoL0lhV0NzZm1Lam5TNDVvTVBJYkVtVE5NekZSZTJiR1Q0Z2tDQ3lT?=
 =?utf-8?B?QllaUGNaQ1lWRGVMVVQ5OVd5UXh1OTZmMWJrQ2piSE1WUGcxRHA3OTFrbytW?=
 =?utf-8?B?dVZ2REgxdURKSXg0bExXWGhhVXB6MlpPWlhRR2wzVFY3WVVuak8rM1paUDg1?=
 =?utf-8?B?dkZ0K0Q5ZGc0R0Jjbmw3a3JhZXltSjVmeWx1cjZidWhSRDBnb1d6d2xzMlpO?=
 =?utf-8?B?RHMvd09jdncza2pKd0VkaHhQR1VtNXRSWkxlUEJzbWpZZGNrMGxsemkvQlN5?=
 =?utf-8?B?WWE5TVpia1BYUEROR0w1RGZBU2RQZTM1MENlOXk0TG8raDZrcWdSOURZWjM0?=
 =?utf-8?B?TWM5MzdOcldaSVVzWHV1a0FVbFdxcXFoSTNLYkt4MnZXV0V6Rk1vWDFWZVlr?=
 =?utf-8?B?ZlIyamhxbnZOTlVxckpFT3RHeWgxMHI5RkdEd3Ztdy95MXJrVTUzTmxzN0Yx?=
 =?utf-8?B?Q2hhdU1yY3JoczVJdTZ0Ly9JdU90NURGTDlDSjJJRmVHKzJlZlpOWVRRa3pK?=
 =?utf-8?B?cDZ5eWVaY2dBQlAvcyszWXF2Zk1HcmtQbTR6ZUY0aUorSVF6Y1g4NGRiRTlX?=
 =?utf-8?B?NjEzZFcvclZMbTNiQzFHTDBkYkxUM3NCdzhEZ0tNQ0ZlQmh6MTROV0RWZlNR?=
 =?utf-8?B?SmlKUDdEWXoyR2hGL3dJeGV3RFVxZFUvWi9WVlZUc3Z4cFNRNUU5UUp6aHpI?=
 =?utf-8?B?SlBvcGp6c2Z3eWw5VmxoY1dtbXo1TUdIRldJMjUwS0s3Vm1EUEd3Z20vUDhX?=
 =?utf-8?B?SFdmZkVXUzFPV2IyWkpQUHZKQ1ZEZ1MyQVd1Q2pDTnF5bFVZVjFlbHNVUCtG?=
 =?utf-8?B?NVBjckRwSWFxQUlsVEp4Z3FwM241dVFqdU9tbTFjQkVEM21RaVRsbkJPeEQ0?=
 =?utf-8?B?b1lUUGk2K2RhYldWbnM2VGZSbWF3T05Wd1lZYnd1TWRBYU10TkpxQXdUSU13?=
 =?utf-8?B?MTdmdlZsRXFFcW9lb3FCWGp4aW81UkRWMmZiQmZTMzhFNW4yMGhRS2RSL3pB?=
 =?utf-8?B?R2hPU213QzRPMm9jamUrcEZxdzBTbXp6bmVFK2JjZThNeXRLTVBnbDJseDR1?=
 =?utf-8?B?b2luSjFkK3ZQc2g1d0NyOWx1SFJvOXpHd3lZcmFmQUdPRTlaTUFnKzB0LzZs?=
 =?utf-8?B?TmY3RUJaQzUvbU1YK3ZOS2NESjlEK0ttYW1OQzdPR0JXdWZ2ZEZjZUFwdGNa?=
 =?utf-8?B?VkppMW44T0RoMHRZQnl5TDBvZXVDUVFVU2FFYlZiRXVHT29kRXQ0U0RoZXNo?=
 =?utf-8?B?ZlQwMGE3eHVCQXlOa0c1WlVKRHF0U3Rwd3o3VGpNdE8yKy8reElXUUZsS0J4?=
 =?utf-8?B?WXBXZGdxS2lSeDVBOVBVMjBTRE1qQW0vNDhBWW84aTVQN1lXYW9ML2tyT3dM?=
 =?utf-8?B?OXhHdHZtV0pTNmtFcWNjWk1ValFXODBoaS8wVmpJM0JudXJ2eitoU2dsR2Z2?=
 =?utf-8?B?WTZtQlpsalJjN05OSjFGVFNBSFdaZ2JRVHdJS0xmU1dzYkFwd1VrRXlFaHAv?=
 =?utf-8?B?YXhQZnVjbXlkeHhieDk1QVpVc00xWGFpM3BWT3pFc0pHcnh4eXA2cmRhVXV1?=
 =?utf-8?B?WU5TdmIwcjBsaGFSb3JrOTl0M2RTcW5xOW1EMU4yWU5QMzlWdlpMQ3V3TWMx?=
 =?utf-8?B?UngzWU51R0ttY05UcGxOYk9nZW55SUlKcVBlck9SRnNQbWVPWW9RZDFCQU95?=
 =?utf-8?B?MWlTdFJ4SmswQnJOckdXaWxlVHl6cDlyMC9rOHlydzJrc2lwUUFOdXFlREZu?=
 =?utf-8?B?Q2FXaFEvUFNPekdWRDE4S0FNbTExU2ZwT05LRzNtdldJUzZVSzdqdXVyekpY?=
 =?utf-8?B?TENGNzhLS0tISm5lZU1TZkNwdWJwakROdWZrdEplZkhOTGpTYU9HNWFNMWVt?=
 =?utf-8?B?Y1dFa0Fnd2JXZGVpODBQMGJXRS9sbnpQOGxJY09HSEw1R0pJM003TWc4Z2pX?=
 =?utf-8?B?WnQ4djZiS0VRQkQwZkkyRjZzTC9GTXpvanhuREpiUXdGbDkyRWJxNjJwS1lh?=
 =?utf-8?B?ZWFQbWNSQnoxQ2xtWnViMmxwVzFzeUpVWmVxWW4vUDBLOSt3OXJUdWIwc0Iv?=
 =?utf-8?Q?mvoI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTdMMG5SaSsvNHZsV013dk1pREgwMjhpMkE4Vzd5alJSM2htUmpnQ08veDdi?=
 =?utf-8?B?YmF0UlAvTWVielZaSEpKSlZMQ3ZaNDdqdVhHK1dYVm9yWUtia2pUNlIwdHly?=
 =?utf-8?B?M2dRUG0vYmxOaE9EbTAzaEpEM0wwR3Q5TXVYK2xKb25wOGQ0R0dlOHhGeGhx?=
 =?utf-8?B?YndWQmkxOFo5d3FiSG1DS2Nva1dvbGxZd2N0Tm5YODZHN3dlYmIxZ2JYL09G?=
 =?utf-8?B?ZGE3Y1NzQkZRSVlIOFZ6dXZmbVNFMHluRzRUUmpyQllJSFNuV1ZzLzI5MWJD?=
 =?utf-8?B?OE5uK3ltU3pRdlF6L3dBU1l5UnJYczRQN3d1Q3B0aXphRkNmRkhPc2pNb2RK?=
 =?utf-8?B?UUlTQmhQUmJuTFZ6UkhYMWJQWFdidnp5K3BZcUVkL3FNcGVMaW1pYjlsSjI3?=
 =?utf-8?B?elJVYmJGY0FSL2UxM1kzL3NvSytlNFRzdW1PRDhVaWpQSXcvTUdjb3REd2Fr?=
 =?utf-8?B?QUdZMmJrOFlRdTVaNWw1bVY3cTNDVUlzSmJwN2hZOWFMclYxb21XOFRBaHk2?=
 =?utf-8?B?YWJUckNCemUxMHJnczlrdXl2UzNLeS9mcjlzZkpEL0FGN1gzMFppWTZRUTBB?=
 =?utf-8?B?d052blBGSlp5NjNkOEhSZ0I5MUVPMitFNlcwU0dyUzFzaXlsMll3ZW0wSEJG?=
 =?utf-8?B?YU9IMDRIWi91N3JRUjVFRU5YaGpRaHozeXozeE41b2hPL3Vpa1gzU2dZWXJr?=
 =?utf-8?B?ek9xTXVxUk01RUN3WDZWUUNlZUhaY01SNm4yU0pDUWlnUmlWZVhTbVFIYTMw?=
 =?utf-8?B?TWhCWUxCRjBQOUZmeVhRZE5Vd3BJcytaS215SFVsUG12NkVDMzN5U3o1Y1Q4?=
 =?utf-8?B?TEo1UnMwb25INEtRcWQ3WkQyZDcxRGZYY3dkOTVIOG9kNzY4enhvNjVoTHlH?=
 =?utf-8?B?c3NjQU5WNjBNRHVpd3NBUWQySXpUR2lSVnhGQ3NyOHRZcVZhWmIwaXFDSUl1?=
 =?utf-8?B?RUx0Y1JTUUtDR0Z0L2dFb29qUnliRk9rVllvem9KcmtMc09zTlFadTlqS01s?=
 =?utf-8?B?eUxJSjdVaWF2YzZFcmtPQ0xyNmF3Z1BTS1V4R1JWTWNVam1NVVJwUUhFVDVo?=
 =?utf-8?B?djl1SXhuejNmdmdXSnp3ZHJLQkJiTnlpaFQyR0E5UFdKZ0JPaWEwbnkzM0ZH?=
 =?utf-8?B?R0xGdWxITGRNOG9YL0FCOGM4aUFrSXF4TEIxMWhTbit3cGFuS2s4bkFhaFYz?=
 =?utf-8?B?bnpCN29LQVpnNE52M0pnVjA5d1V0Z2pHYnMwcHgzZnBob2syR092QkZhdE4z?=
 =?utf-8?B?R1BoNnV6VzFVMHdlNXZ4RlBJaTJZT2lhL3c2bWp1U2hDdzR1QXV2SndLK01L?=
 =?utf-8?B?dUdBdi9vcTFzZ1hFV0o1RVJ0RW9VbEd4Z2ZvNTd1T29ISWR4OHlWenYzS3N1?=
 =?utf-8?B?bDVnYmRaMlhCZlh5ckdZakdSTko3b0RWcjBVc2RpeEpHbk1VVTRXcUUxZjJt?=
 =?utf-8?B?YmFuMzhDZ1BuMHI4VTRDU0tTYlVvTzBWOXh3d0tBbGc0UlphRHk4WnR2T0l1?=
 =?utf-8?B?cjExM1pHbkFYa0U5Nnd2WDNRcVh0S0ZaQXVmbkRyV3cvZXI3YmF2V3FNM1V2?=
 =?utf-8?B?UDJiRjRJdzYyYkVZbUxmMEVqZjFDcjY3VWEyUEN6QjkrdnJqSFUzbGlWTDVW?=
 =?utf-8?B?VTR3L3BNaVJUS2YxSWRFZ1VXRGlvYytITnpXdk9PK0g2MzF6VmdRQlVySTR3?=
 =?utf-8?B?eWpZclkxbkIzOENyMDJsRU44YjlQY3Mya3FoaW9SU0tRTnp3b3BVM0c4cUor?=
 =?utf-8?B?eFFaZUZ6V29VZG1nRWQrM3BWY2dJSS84Y2dxNysya2pJbzVqcDdXcXRtTUtL?=
 =?utf-8?B?ODBGcGppc2dkMUNaRlZTeCtkdjh6Wmw0VHBtQXB6MmUwRmJKczdZdVBFU1VO?=
 =?utf-8?B?OHFkZUNtNFZYZlhITzFjbllCUlJBeXAvd2g5Y0pudXgzbFd2OEdKQU1YOUpi?=
 =?utf-8?B?cS85dFlPQzJlMG9RQTZncVFDNndNTy9ZMW5taS9OdTdLc3kzRWFHTWQxWnYy?=
 =?utf-8?B?OG5pTFM4bWJUMGVTU3l1bXVscTk5UzFjUXU4VVBFazFLMFIyZjRvcmxoMXF5?=
 =?utf-8?B?VUIzWUxVVWIrT25ScGw2dVI4NnAvTlF6WFY2aVpCQzAxRjQ5VHBIa1RQZXBo?=
 =?utf-8?B?YTFBdFRsT2pJN1BCQVVhWk9FTEN6OHcvbWlPR0FwdFh1MlFMNHR5WlU5UmRs?=
 =?utf-8?B?ditDMnk2ZHdTalRTMHlxemw5UWlMeE53NjR4TTg1eTJFUU5Ub0NGaUZTRStP?=
 =?utf-8?B?OU1DUWp3NktZQ1BNdFZ5RHVJTmdWWTJHb1ExeEk0ZU5DYzZLUUVSYXUzL0xL?=
 =?utf-8?B?Z3NuUW1LRUQ3a2RjMnczUWVoQUN0ZUN5Tm1UcFF2Tldib3NOZ2Ywdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7675fb3e-fdc7-4352-9960-08de67fcd89d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 17:01:19.8501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oCuEzPNE6Pn5CHSy551iqEWah301ccZhvP+0xT/AwPKz2txvvzBbGkO9I7yk+6tclphpS/cKcLkrFevjl7JrM1EQpY/vtnU8vqMBUa4Le+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5632
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.18 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:tim@xen.org,m:alejandro.garciavallejo@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim]
X-Rspamd-Queue-Id: 296B3112CEE
X-Rspamd-Action: no action

On 09/02/2026 4:20 pm, Alejandro Vallejo wrote:
> On Mon Feb 9, 2026 at 4:55 PM CET, Roger Pau Monné wrote:
>> On Mon, Feb 09, 2026 at 04:35:04PM +0100, Alejandro Vallejo wrote:
>>> On Mon Feb 9, 2026 at 3:42 PM CET, Roger Pau Monné wrote:
>>>> PV needs shadow for migration.
>>> shadow in the sense of shadow paging? So PV-only + !SHADOW means migrations are
>>> impossible? Why can't Xen operate on the PV pagetables rather than using shadow?

This question doesn't appear to have been answered.

Because PV guests can read their own pagetabes, and need to not see an
absence of _PAGE_RW where it has a writeable page.

~Andrew

