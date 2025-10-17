Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC9CBEB045
	for <lists+xen-devel@lfdr.de>; Fri, 17 Oct 2025 19:11:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1145331.1478383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9nxs-0006Wn-JC; Fri, 17 Oct 2025 17:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1145331.1478383; Fri, 17 Oct 2025 17:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9nxs-0006Uv-Fw; Fri, 17 Oct 2025 17:10:04 +0000
Received: by outflank-mailman (input) for mailman id 1145331;
 Fri, 17 Oct 2025 17:10:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DH0H=42=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1v9nxr-0006Ew-BX
 for xen-devel@lists.xenproject.org; Fri, 17 Oct 2025 17:10:03 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d70c513-ab7c-11f0-9d15-b5c5bf9af7f9;
 Fri, 17 Oct 2025 19:10:01 +0200 (CEST)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 MW4PR03MB6330.namprd03.prod.outlook.com (2603:10b6:303:11d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 17:09:58 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 17:09:57 +0000
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
X-Inumbo-ID: 1d70c513-ab7c-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=udQgi49fgTh+MuaJxVBY0e2WwILeJ/31tHOSaaA9RjckCANv5wIsSCJyE+LOKYGZ7tkpq6tZv7Fu+3xTu4GudiOEgBnMjjuvOauZrjEKkZQqrok7FKJtfNwDZrSGSW1m/PY4swBWOmR7wHB3ZznmPbe+t+CEnFTj/DUYSlSMQ9gtcj+FG9V3r3/pagy7xOqgg+KiYT+JNorJ0nQ+P9ctjyGhpCbSeZ94Bqhmrsaa0czrzBcU/kBoL1DG1OciHdET4AToHMBwEx4Hmv3zfrLUVIATCc18nbwW57bpS81CurNidHDItfhHclWAhfiK2Au3G+FUET0zCoxq0MLX/diICQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YdvUAmZ5liJAv7L7Vr9Ost9+syXmp1Vx/zvaiMjLIxk=;
 b=OEKaTNqSV+9pALmx0qEopnTbX+mpq07ummvM5gPxpexumyRBQ0/UusaFr01WlygGpWCYtPqo1Kr1ukyew2aW+TZbuqJ8WzuaCKHlt2HOodaQtlmxcIQhkzPK+X4HREVDRrSnQzqnIxGMwSZ4fqwJY9VU4PEgZS+ebZ/YNwgKeoNHgcXT7Z96zjoGhvVHxTJ2S2dixu2utSDUZqYfjpfHA5WqWd9p9WkhjXogpijL1IQ5taXagpRYCjLOZ8JowHU15fY0cLx439VvtDf0otljg/T3E+6MUgxsTISIyDMzMfMOvV/p7FVap5at5207Wn2ZhZDi4nnud34b633UTmfP3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdvUAmZ5liJAv7L7Vr9Ost9+syXmp1Vx/zvaiMjLIxk=;
 b=N1YcGYUMNOz4JM99Xys5/V9EZyEGahi7Zro+pLGm7k8pZz/FsY6nH1oe4iYDwC9bWPesQOO1LxoQ0l8KFWaUEWPKJyS0zFRh7XleJqlQt73cFQq7YL0rtywB2eq8vH4n776cKcV7iern/6nA13Yd37K3+NvjD3dWHGpZoXxKBP8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <bdead1be-cd8f-4cca-ae70-e9744ae8b556@citrix.com>
Date: Fri, 17 Oct 2025 18:09:54 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: xen-devel <xen-devel@lists.xenproject.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Denis Mukhin <dmkhn@proton.me>
Subject: lost serial characters on boot
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0096.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::14) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|MW4PR03MB6330:EE_
X-MS-Office365-Filtering-Correlation-Id: d34c8ff8-7b6e-457f-3fd4-08de0d9fffb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFBmREk5RVBlb2lkQWNSbnQ0Rkpjc1NDVkJUMXRGRlZJRmU1UE5DcSsrV1Uv?=
 =?utf-8?B?eTk4Yk5qZ0hiS0c0OXh6UzZ4TUVaZ0VOTngwaFBDYmVxcFltbElscmFNWU5V?=
 =?utf-8?B?UXN2VmcvUE0xeWVDcWVQZmVBbjNZSWwwbHYyMnpCeXRxWUhuRmdJNkI5WTZJ?=
 =?utf-8?B?ZDBzNjJOd0NwVlN1eC83K0p3K250Z1duMzh6ODFjV1NtZTNKc2JxTUhjeEg4?=
 =?utf-8?B?T3JCU0t6em12UkQ4SjM0QmhMTHJ0ZEJ4QUx5NEJGVGIyU0FRcFUzVkk1d2tU?=
 =?utf-8?B?Z0ZVOEpZa3RwNU1URzRtbC8raWxsRElkTzBUckxEMWRrRnFMZzBxdTVkWXpq?=
 =?utf-8?B?Q1l3c2Fiak5lWmpublFKUUMzaFhwamxCSGx0OElTM2xDc3c1KzJZSEl2ZWtX?=
 =?utf-8?B?OHBIY3BMbkp1YjVvU1d3cTNjVGY2R2QzMHpuNStmMzlnVCtzUkI3dWtlOS9s?=
 =?utf-8?B?U2cwL2FaRGl4dHZ6RlBkcHpVakdhYUZwV2k3L0tpcE8zUnhFRjMveXBvZk1I?=
 =?utf-8?B?YmpyNUtZaW51eDZlVFR6WWhWRFRyRnQ4TytITWszczdtZlltZlFVVisvelZy?=
 =?utf-8?B?d1VOWHQyOS8vRnJlbXhBMHlGZngrNStDSmtlRkVKbzYrK3E5ZlREOFFQMUhM?=
 =?utf-8?B?cDRwQzlDdTk4RUdJM3Z4ZERQSUo1MGppbkk2YlNmSmJ2c0V4eWR4OUYzUnFR?=
 =?utf-8?B?VGQrcmZuaS9IZzR0bzlCcXVPMGtYaWRlRUJaVFZZaVh3VHpxalI5a05YclVo?=
 =?utf-8?B?OTViMmlGejNQTnNOVVd5bkNKNmJFMkpPcmtFR3BabFBUK3ZRd28zZUxtWHB4?=
 =?utf-8?B?TDMvRDhGTjdXeU5YM1k3Z1BoUnF1RnY0R3Y3VXl2NlB5M1M5UjAzSWt0SkEx?=
 =?utf-8?B?R1FYTnI5eEw5V09nQkM0ald6dDNjamVTSzlaa2UybVNPOHFzaHhaNXBmaTZ5?=
 =?utf-8?B?V2g0aXVuYnFzWm1iQUUwNnlxR3ltS2VYVDU1L1FQNTZsWnVBQTlGeUZKMm40?=
 =?utf-8?B?QzAyUHY2bC8rdlg4RzBWMm5uckhoenFYd3ZxNHpPUGVPR2IrdXlpb3JzS05t?=
 =?utf-8?B?bGxhVkJsclVPTC82K1VUeXJBZFJnM3Npd3RoRVk2NzZSU2xxeGExbThseW1o?=
 =?utf-8?B?ZTVsaVFCSS9pNVNTODVuSHZoL3VGNG51QmlnZnZ1N3Jhd1lITDBlTzBzQmdG?=
 =?utf-8?B?MU9ld1FGZ2R0WU54S2JFMlJUaTVTTzVnQmo3azVUSEpzZERsZ2xtTm1ycWxJ?=
 =?utf-8?B?bDI2bnBHSjFBSXJoYmNleEpRWU44MnpRcDJLWTI5b2FUSENBTk9PZDVndU5S?=
 =?utf-8?B?SlNQNVVjWW02eVFaZUNuY3JUcXB6cEZsSlZpendkcG5jaXg2L2JSYkNsR1hl?=
 =?utf-8?B?b3Z5WGU5eHhFT2xKSVlqUTREbUJtZXJKa2tGUmloa09IUjlCRkhQTFRxcEh6?=
 =?utf-8?B?UUt3Y1ZudUx5ZVhEd2dvNkpjQUNlUkpFVWZYWjNncWIyb2E2cU1oNUU0c0l0?=
 =?utf-8?B?L0hmMkNzOG5nbStqeXRnNTdKSERDWktjWUhybVZTMWtobzJBWUt1SVhsVnRV?=
 =?utf-8?B?ZE83cEFqS0RpY3hHZmxEczZNNFQyN3dqaDZUVStBaEVLN0Z0ZTRsNGxMQldp?=
 =?utf-8?B?SGRKdUx5Y1FjL2tpYUF0MGplZFBKcGVxUnJQL0NHM1FUTktOTEpiTEVRQnIv?=
 =?utf-8?B?WGdIN1J3RUwyTkZab2VHTHczdDZtSDZuZ2ZNTmtiS0x0SjI4Z0dSNURZelAx?=
 =?utf-8?B?ZFUwTXhjcDFkVDhNTy9sSXYwMlVjYmVOVEtUb3Z3NlZGakxmaVBQUllTNnI2?=
 =?utf-8?B?YVNDR2czdkYvT3ZRaVJjUUo1TWRucDArUFNQOUZiRkZKUjhteXYrVkFMTG9x?=
 =?utf-8?B?bTE2QSt6bjRweDdMTU1wOXZBNExmQ2NjdjgyTUVZZkN3elBtRjRlcm9pZDYy?=
 =?utf-8?Q?LwcZZXf0UvKuAdFob7oR3sdEkmr+6BCq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDA3Tnl4VDRWU1c1ZE9oRW9UNE5RQzZreC9LTjg5cVNnUCtiNEZNWnFlaCtU?=
 =?utf-8?B?eGQrZ1VVZ0N1V0doTzErd2FLUTg3ZEI1b2MxZUpDYkZSbWRsbmNiY2JGNUpP?=
 =?utf-8?B?WlkzK01GRElKWHRudkxkbVl5Umk3TUdTd0RuMXlzak9mY0kzTDNwUFpNcUNY?=
 =?utf-8?B?d0lsTFdVSDIyMjFTZ0E0Y0VLOVl6U0lCemM0b2svVGtQQ3l0Nks1dGQ0NFNL?=
 =?utf-8?B?bC9NVGNDRzJaSkQxNFVyQnQ5enpaMXhBdlVHWE82RmVIUGtsZWh0S0g3SG5w?=
 =?utf-8?B?OWI5cUppL0pkc2I4N0RiYlpjc3JGVjRWOFhrVTlxS1JnMGxaZkQrRjZtS3dD?=
 =?utf-8?B?cndlZlBSV2VKNXdDdmNobTdhMG4rODhWQUZMT21ZdGYxTCtrdE92amJOaW1x?=
 =?utf-8?B?cEZlUWh3aFd1dzFRRlczU2FvWjJLOVEzVk16eER6aHErKytEQVh0K0o4bGc5?=
 =?utf-8?B?cGI2OWxTSWxtQ1dYRUZoK1hCWExoSFpYTHBkVnFhVlFSc0dpVjNQbUNZSHpE?=
 =?utf-8?B?ZkRORy9Od3ZaaXZyalEvWEN3OXQ3N2Y2eVc5UGpVUUlqc0cxaDk5dHRvaWNz?=
 =?utf-8?B?V2JRTmtxWEQxdnY1bWhHU0R3bHU5a0NxcHgzUmxwRWNSRWExVUtENmtTVS9I?=
 =?utf-8?B?T2RsaGhQMmJsNUttdmV2RGg2c3VITVp4QzA3eTNsNWlTN0hPYTlyazZoZ1lj?=
 =?utf-8?B?eTNnZ09lb2hKVUhsVzE0R21uVzJjM21qaFhZOWRHUjMrdkFZSzdvcmw2VDBv?=
 =?utf-8?B?ZmpHUGljeWxCT0lYaTE2VnRyc2x5b2IrczNsQ0c0V005S0Y0RHJRRTVyU2hu?=
 =?utf-8?B?Z0lrcXZiYkV0WEhZS1RFY204ZkFpcW5RN0VLbnEwU09aNS9yK3FoWVFpVE9w?=
 =?utf-8?B?d3dTQngvbUFsYWxXK05md2RNNkRSVXlESmpkYUgwMWNSWm1PSzQ1d2Z2M2Q2?=
 =?utf-8?B?SWZBU2RBRkZpNnc1N1J3cHJJUThQTEsvZGlDUE5aNmxVTUZQQjdZRkRUUDRS?=
 =?utf-8?B?SWJwZktHK0s0c09KcEJEekFPRjBzajY4T01WVmMyVWVHUHlwZjNQWHBTNW5y?=
 =?utf-8?B?TnY4WitQOU83dmFmcURhTWFkRHZwb24xZmhYUHF6SGJiRkV6Wm5BWVl2YkZq?=
 =?utf-8?B?S2k4Q2tkYWZqWUhFdzdmYmpOUVhFTUNkaksxT1VKM3VFRXNlRS9peEp5c1Zj?=
 =?utf-8?B?VGV1TE0vL0Q0WmpMSUdmeDE2R1VqUERJQ2s4bVNjaTlncm1ER3pWVVRQMEc3?=
 =?utf-8?B?WjlJM1RlWm55alZYZEI1YmlQUkNuQWZUeHhsVmtUckp1aW1NZG1GckdieTRN?=
 =?utf-8?B?NTc4YW9UTk9tdEVkYk5VY3o5ZzlMU29WTDdwMFFXS3pTMkNoVVR3QURITS9v?=
 =?utf-8?B?OGhkb2RWeERFYzMxTEx2bGI0TzFKc21Ydjhsa3ZkSmdnVGlqMk93S2ZZVG53?=
 =?utf-8?B?TldMbHZIaVNJRGM2WEVTSEhOWW1YZzUrYlJ0dXNVWUkvTzlaYlV3UnNtWjhi?=
 =?utf-8?B?ZFVjN0RaVG1kbHdZWnlNUm12Z1I1RzVHM1Q5Ni9QVEhzcitDcXE3eU0yV1NK?=
 =?utf-8?B?QlY0K0VSSzJGUEd2UmQ1UmdUWXVLS2FDam8zb3p2UENMc2pheGg2UEliZi9F?=
 =?utf-8?B?aXorcGRldE8vOFJDZ3dxYThWakZwVWJVY0I0Q3haSnh5M2ZNV1M1YnM2TnJN?=
 =?utf-8?B?ZGFSTXJHbEpHRGpUY21RYlFWS1lXcFNFTzBXQjFxN0xUYVdRNkhwQkwwUmdN?=
 =?utf-8?B?TDZTdHRvMDFvSitlMjkrQ0JWYThOcEdPZms0b3lQMGZLQzVrSDd4bk1ZY3lH?=
 =?utf-8?B?Lzg3TkhzR0VOT2wyOXRoQUZSd3ZCaDV0Y3ZOaWdvME56Nk1pTlpGRGMwbktH?=
 =?utf-8?B?N1Q2ZmJVeVcwTFZJQWVGZVdPZ1dZbXVJR0RqaTBYL3dleHlPdGlHQXh2ajV3?=
 =?utf-8?B?QWlyV2piaWRrWXFkNVk3MVFrcUI1UDhyV0tyL1dTV29TUzRreGNxb3N0UXlJ?=
 =?utf-8?B?cUliUWZ1Z0dablVpbE9hTUhuOEt0d0FzZ3dsL2kxNC9TUWUwd0U2N0NMT1Vh?=
 =?utf-8?B?ZUpMYzU2R05PNjc1aWN0cDR3YVloWFcrSnJVQUZib3ZLalVWSEJTMzhrUDYv?=
 =?utf-8?B?aUowVlV1ZHJiMlluSXlyTHlsaHF1V1M5eWNRMllBS0VpeERIM21RWitEUzhu?=
 =?utf-8?B?U1E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d34c8ff8-7b6e-457f-3fd4-08de0d9fffb1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 17:09:57.8680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eoXtESXqByCvOcYEzgzn4GDHAaDUvhChNrO8aK3ZUCPvpBvOC2usEZCNqTH2BrLpWQtUsmnPZLjkQ/8meBtRMQRbEwFwv6LWSSKS/tRGZoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6330

Hi,

I think we've got a bug with the serial console.  I'm reliably loosing a
small part of the boot message. e.g.:

(XEN) Latest ChangeSet: Fri Oct 17 17:24:59 2025 git:5e79cfcd2100
(XEN) build-id: d1536ff6698b3e3ba307d551abf
 Family 25 (0x19 Stepping 1 (raw 00a00f11)
(XEN) BSP microcode revision: 0x0a001137

whereas from xl dmesg after the system boots, we see things correctly:

(XEN) Latest ChangeSet: Fri Oct 17 17:24:59 2025 git:5e79cfcd2100
(XEN) build-id: d1536ff6698b3b8968e883fc39e3ba307d551abf
(XEN) CPU Vendor: AMD, Family 25 (0x19), Model 1 (0x1), Stepping 1 (raw
00a00f11)
(XEN) BSP microcode revision: 0x0a001137


The lost bit of text differs even when rebooting the same Xen binary,
but it's always around this area, very early on boot.

I've been seeing this for a little while, but one of my common dev
machines is showing it fairly reliably at the moment.

Checking a transcript of the terminal, we're missing characters, rather
than having additional control characters causing the corruption.

I suppose I need to stare at console_init_preirq() some more, but if
anyone has ideas, I'm all ears.

~Andrew

