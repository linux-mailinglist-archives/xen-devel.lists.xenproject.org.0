Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kME3Fx+0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4FE481F0
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208745.1520897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi9tZ-0000eF-Ag; Tue, 20 Jan 2026 11:27:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208745.1520897; Tue, 20 Jan 2026 11:27:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi9tZ-0000cH-7u; Tue, 20 Jan 2026 11:27:37 +0000
Received: by outflank-mailman (input) for mailman id 1208745;
 Tue, 20 Jan 2026 11:27:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwra=7Z=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vi9tX-0000c9-TV
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 11:27:35 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 035dbf58-f5f3-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 12:27:34 +0100 (CET)
Received: from SN7PR04CA0181.namprd04.prod.outlook.com (2603:10b6:806:126::6)
 by PH7PR12MB5856.namprd12.prod.outlook.com (2603:10b6:510:1d7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 11:27:28 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:126:cafe::9b) by SN7PR04CA0181.outlook.office365.com
 (2603:10b6:806:126::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Tue,
 20 Jan 2026 11:27:28 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 11:27:28 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 05:27:25 -0600
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
X-Inumbo-ID: 035dbf58-f5f3-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOtKC+DOhNxZm5TbaYAaKd+QDB9npSrJz1Zn33AC8YSjndh56r5ZANpvVfTnWqrDfugT2SSa9JtsOsGrh52UDT+u8pHpMn9AqX23C2YVaD/zYMJVmGU2RnBSYiZz+OqMYkLdexekNWvlD7IRYwENzL4C6E6fNXBUouOPlQ5dUx5brJPENTZ14x+UsulVjuCAnvgZPEhzp4r5Lx+bkjA+/MAfxgs/DukfW00IzugYa8BuJDyttJ+84b7Kfodp5Qq/TlpIE0U+d+N6t1kox6y1xx25edOUhUZoLN2/w+lTaT5MdXkOSTDXnOvEmoHmFKXo4ARVnRG0yBLvzmFToojoRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sF/rVKYe57a6LX6mKKlustCtZSCbtdcyWs1yNIDOwE=;
 b=kdKSxlSXbgpP3MZS1nToAjefKFI70ieEOu4a/d629DVnlBzJjc28mQzQbfhMLtm0rsaxWiv16SiOkAaq7QN1grlRO+mOSGSP0fRlbCpCbEBpxrrwvEG9CW53AP/rvV++xVDIEIDnbbav96uw1VXmCZ8XoX52V9/7/y1kiWPAalm8EfXR8gD85hWb6Dx6/6jhtrc97hcK288AAm2WKMBNIgGFJswbHSKWGUWIgq+6BOrrDcldNQ/N/Rz6GO4IC/dEXcc57vS4zQMaiRRI7P6qbLy9DBj4j5A1gr0Om3LFMWKs4eqj3v9JKA7XHzTf/1sJG6yiYQGjrFbfkOVFmnuvZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bugseng.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sF/rVKYe57a6LX6mKKlustCtZSCbtdcyWs1yNIDOwE=;
 b=NGCR1VtAIZxdySQ4mUAyOxX4ByJ3V4w9TZe0uujlKJISgPeurBzYUSOStOedEeX9xyhGdJqC/seQW+yiorOfx6EMU1QgAPNtRnCjpds3T0vZW2Ytb4fLMIAhL8eUKPjjaQyjdfp4rhpoPK5kR/ubnk0Ohn9Ld9CE/yxVCqoDYGo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 20 Jan 2026 12:27:23 +0100
Message-ID: <DFTDPKJN6EHE.3LH3Z9WEO0AGW@amd.com>
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 4/5] docs/misra: Remove earlycpio.c from the Eclair
 exclusion list.
X-Mailer: aerc 0.20.1
References: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
 <20260120093852.2380-5-alejandro.garciavallejo@amd.com>
 <1d374226e3f91ab3bbc05c3354c8f8fe@bugseng.com>
In-Reply-To: <1d374226e3f91ab3bbc05c3354c8f8fe@bugseng.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|PH7PR12MB5856:EE_
X-MS-Office365-Filtering-Correlation-Id: 16de88a3-457e-459e-026b-08de5816e4ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dlpsdGthMDVvRVYrN1pMdU1qWHVvYWdzdlFaQ0xrd0U1TERJTzNuVDl1VCti?=
 =?utf-8?B?SSsxSnZKUmVrSENKZHM0R09hb0RHMThTRXBpelJzd0p4MnVqSTdYSEVnR0hZ?=
 =?utf-8?B?V0lmek1Fdkd2emhZOUtFZEhTREc0czJ2cGRVdzZyb0VOZitMZUlSRXM3WGN1?=
 =?utf-8?B?OUg5Smk0clRKQWJiNnZScUhwOU5rbDltR05USHZaaXY0bTNsWmxhR09yTFFE?=
 =?utf-8?B?UmY1QitRTjgxaFVlM2czdTFWWjlMZ3dabXJHbFJrUWlERURGMEphcE95NDYx?=
 =?utf-8?B?NFB6c2FHSzZ5UXU2K3UwdWxNYkMrU3YyYTVwRC9rUlhlZ1RGTzltOTdwckc2?=
 =?utf-8?B?b3duaER5RVpyQzhKYmEybVNta2hNaU1laUJDQkcxekhqWlZXeDdmTndwVG5K?=
 =?utf-8?B?cDV3ayt4cTN4ZWd6eVdtWG56VlJqdkp1bWVZckVzVzhibVdIOEpnZGhsSjYz?=
 =?utf-8?B?U2FSbUJuUkxqWEZheVpnY2VLak9NZEpMR1VrSnVEcC9vMnJJQTJvSGtBazlv?=
 =?utf-8?B?VU5RWklQRlB3eXh2RXg2MDJ6aW1ZTDBMOU9iTjgrRTFiU3ZCaDFHMHFrMUVu?=
 =?utf-8?B?L25hQ0tZcmZTUDdBaHBOTjYrcWllSUhOYksyNVV4Uk8vNms2SzRNRmtkRlNJ?=
 =?utf-8?B?QXpKQ0hiU3dKTEc3UXZBWmN3RkNpM3RwY3VDOVNqZEdZWlhzbjhnQk0vc2RF?=
 =?utf-8?B?aTRpNFdsS1kvQ3ZEME1tR0tqUjlsQVV1NXd0NFl2em9ycGpsWlV5WGVCeVhJ?=
 =?utf-8?B?a2EvUCsvdDRxKzRYSW9xek14MGQwdVNWaVd5TmZGRVA0TDRwZmpPUFlHYmpW?=
 =?utf-8?B?ZkZoTEhnVW5lT3A0bzErWjEzT1FXekFsdG1xTTI0a0NUeG11UWpvSFFMcmtE?=
 =?utf-8?B?WFZEV0VJcXN0eDJVbXdLRmUvL0h6L2NER3p2OXdjQmVoYXVCTHVEMlhEZ1pl?=
 =?utf-8?B?dXVCMmozRWZsK2d6SzdrWGlyZVVrK2IrVHJtT0huYTdsS3EzT1ZGaGhLOFJD?=
 =?utf-8?B?b0dONXk5K1g3NEJQTSt2TnRzajhwRjFNSEhWOFAwN0VKbHQvWjRpdkpBZExU?=
 =?utf-8?B?cGxOSEtkdWsrcEtQRUxDcjMzYVNOZjV6UnhYQmdBVTRRWjdQYWVDb1ZsenZv?=
 =?utf-8?B?SFppbUlrWXNSRzBLeitrMDhjRE95TmhCMXpoU0l0elpQdnpvM2lybkkrQmZt?=
 =?utf-8?B?cHZzZVhCYm5haHFlMGM1YUI1bG50cStId29wbXlxMjJIMW1odVZkUTNwM0Ix?=
 =?utf-8?B?NXM3Y013bU5aRC8vSXVFSTVONXJubGxiR2lRWGFLbTF3YlNrQlZQTXloUGJI?=
 =?utf-8?B?WDFrem9ZdFRZbFdYenhYOEN2WThHNUY4d3V0OXQvZjRVblB0Y1lpZmxWUVFZ?=
 =?utf-8?B?M0VtdTZmOUg4RUtPQ1FpTnBzeFZyRTVBd0ZyY2ZzVWtodkkzNThFZVRoRDdX?=
 =?utf-8?B?OEJDWlgrMlFtQ3kyZXJ4blNkbFM0Z1BQNGN3dDBZUkh0ZTlDYVUyUmpFZjA3?=
 =?utf-8?B?ektPcE0ycWoxVDM0VG1jQVRXeEFGanJjcmVNVEZRcUI5OU81L2NFVWJPSzVU?=
 =?utf-8?B?Q3ZUbzhBQm1SeEhvSXdvMzBkTUZ4dUpBSUZ3cGpWWFlhaGNlaVdFZmpYRUl4?=
 =?utf-8?B?bHExdlNHOGNYaUp0ci94enBHMWdESHRSU25XaGE5enVwQW9EWDBIYmo2SDNW?=
 =?utf-8?B?bW5jc0JXN3Exekt4SkhkY0N6Y0VPT3Mwd1hOSjlucEhLSWVPSUJMZUI4Qm83?=
 =?utf-8?B?aGFqYXViZXcyV2NCMlBIM3JpcjNwOHNwOHVmaEhOWklHZGJFcmdvWUFXLzdZ?=
 =?utf-8?B?bnlneEYzWmpOckZCSEZEVDVYTkFuZlQ5ak9PQUdYbkd4bGgrMG9HN0Rsci9D?=
 =?utf-8?B?S2RVQVZUVU5HV1pBc3RnVndKVUt3Q3ROUHBnc2g4T1ZLdnNDL0FkejNOeWRv?=
 =?utf-8?B?YisyM1R6QVRvblFLaUVyclFwdHVsemN3K2FJUzdaNWs0U2FOVEdEWHV5Z3Ar?=
 =?utf-8?B?dUFuUU8rYTlpb3NpVHRRQ1RudTdIMzZGL0tZcUFoRjNPOUV1cVRJY1JwNHlu?=
 =?utf-8?B?eXk2disvL2E2TXVxanphSUV6MEdGQjhteGUrNHVFR25rZ3NsclRNVCtYVG9m?=
 =?utf-8?B?VytrNDRIaGdIMEJkOXZsOHlBS0lxQUNCS0U2dEpFWnEvREIrenJNYWs2Z09R?=
 =?utf-8?B?LzREMFVTZm9SS0tVKzFzdVdWWVkzcnA2K3Nid0ZzT0hubERsZW9reFQ0bElI?=
 =?utf-8?B?bmJqcThLSFE2eGF2YVVoODJnbkx3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 11:27:28.1598
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16de88a3-457e-459e-026b-08de5816e4ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5856
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:nicola.vetrini@bugseng.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CC4FE481F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Jan 20, 2026 at 12:21 PM CET, Nicola Vetrini wrote:
> On 2026-01-20 10:38, Alejandro Vallejo wrote:
>> It's clean.
>>=20
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> ---
>>  docs/misra/exclude-list.json | 4 ----
>>  1 file changed, 4 deletions(-)
>>=20
>
> Hi. Do you have a link to a pipeline?

In the cover letter. I only run it on allcode.

Cheers,
Alejandro

>
>> diff --git a/docs/misra/exclude-list.json=20
>> b/docs/misra/exclude-list.json
>> index 388397dd3b..273e24db4a 100644
>> --- a/docs/misra/exclude-list.json
>> +++ b/docs/misra/exclude-list.json
>> @@ -121,10 +121,6 @@
>>              "rel_path": "common/bunzip2.c",
>>              "comment": "Imported from Linux, ignore for now"
>>          },
>> -        {
>> -            "rel_path": "common/earlycpio.c",
>> -            "comment": "Imported from Linux, ignore for now"
>> -        },
>>          {
>>              "rel_path": "common/gzip/*",
>>              "comment": "Imported from Linux, ignore for now"


