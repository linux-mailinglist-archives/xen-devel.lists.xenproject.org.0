Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sB8eDSW0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D06CE4820E
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209141.1521258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viDg0-0008R7-Aq; Tue, 20 Jan 2026 15:29:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209141.1521258; Tue, 20 Jan 2026 15:29:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viDg0-0008P7-7R; Tue, 20 Jan 2026 15:29:52 +0000
Received: by outflank-mailman (input) for mailman id 1209141;
 Tue, 20 Jan 2026 15:29:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwra=7Z=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1viDfy-0008Ow-Lm
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 15:29:50 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da595e14-f614-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 16:29:48 +0100 (CET)
Received: from BLAPR03CA0014.namprd03.prod.outlook.com (2603:10b6:208:32b::19)
 by MN2PR12MB4109.namprd12.prod.outlook.com (2603:10b6:208:1d9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 15:29:43 +0000
Received: from BL6PEPF00022575.namprd02.prod.outlook.com
 (2603:10b6:208:32b:cafe::f1) by BLAPR03CA0014.outlook.office365.com
 (2603:10b6:208:32b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Tue,
 20 Jan 2026 15:29:43 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022575.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 15:29:43 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 09:29:41 -0600
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
X-Inumbo-ID: da595e14-f614-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YtUrFs6N6d2zwGTkYX47q1J2I080/Of0ichJIDvmrCFsqrveJQtCyfecInzJ871lmwp2OCY5V4UY2ZC018M/wJztNZZwY8d9qoEYoAYHl+jJj2aFiTZOGkkAuSHzX+kuteO0d1uwrGS39+ETXmUHsMaDPOa7BU8pnJByE2/OHBnXv8AMs32I6NuCM4VBPcCvbRhFRCUrJiAVRYumJxUqN7ZTBoqAlWTqPN/e1BWdZfHOCps47agLgtnUKGIxvhbpGHxPdG5vlq0NYUQs9eziJ+PIApju3luxkmtXQPNlSoGEQ2TRN+RygOuXwq+eskCL33uK0OxMIzDIzhc8WKpxFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9JCMNMBer5Wp1TRYXZxQi8tNDNDYcjg0B2NevyZzQk=;
 b=KBbDkRrTYEQbQPBfCZXu68fJBZv6WoPpjLV/ZH1SjO9sAXVDmEoZ7zgTttwwCc2K3SOBUM/iOYlVKTHMBh9BcamcHNz/jP00nT5UmvZzKG1qjehBSffs5j6ujNcpAJlAjwKoKh5k6VIBzsShiTqcwbWKQBQIzbdCCYzDnE6vyvOj4o61U9lhmquZJS91Z7JZy7p0Es4OVibAu8ggqkd0UjuIjcemCeNciCU9W5IYj9m+X+FnWk/grFmwkT0CYG9BjTbUcfuFi4IOO7Zs1U+rdTZMJG0kA47+ayecYXRmLn5oR1TVd3+jjiDcUDGFMVFI4eF4AkMaf9diGCs4op498Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9JCMNMBer5Wp1TRYXZxQi8tNDNDYcjg0B2NevyZzQk=;
 b=ffAD5tUWxcSZ5FY8gXNzY225f8EaHgL5oN0/Cj3Oi82tuUtP+WU3dttSmfJ0EM2WjZb+HXmOMLucEy0TfXqddVImbGUg/RchoIHMwQY90wkRFI1Z/+CCAq+XztMONFJrsvUEnIkCUzbR2AmwjRI7DULtpCypPmrM2FFblR9n1Nc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 20 Jan 2026 16:29:40 +0100
Message-ID: <DFTIV2PQIDUF.2LXNNXVPG8AZA@amd.com>
CC: Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v4 1/5] x86/ucode: Add Kconfig option to remove
 microcode loading
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
 <20260120093852.2380-2-alejandro.garciavallejo@amd.com>
 <bbc462d5-0db4-45a4-9217-893159cc2975@citrix.com>
In-Reply-To: <bbc462d5-0db4-45a4-9217-893159cc2975@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022575:EE_|MN2PR12MB4109:EE_
X-MS-Office365-Filtering-Correlation-Id: ead18343-f110-4adb-bad0-08de5838bc72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?KzQ2U3JSWWJwR1RoRERWcmIwcWdTenRYOU1yejVSL0lhZTd4WXN4NjhxY1A5?=
 =?utf-8?B?NlRLVVFRZnhLMUluazdkZVhsSkZQMDRtL0lET2U0dDRYRlZ1VkZHZGVNUms5?=
 =?utf-8?B?K2lwUStoRHpFU0hFbXZ5aEU1bS9zSHVieEhzd0UvV0JHbVdlVGN6T3ZuNWpP?=
 =?utf-8?B?OXRHS0NCVXphTnFXNWE4bncvK2t5cENNMTlFdHJnc2xLeWRJYnJwWlBmbWxF?=
 =?utf-8?B?Yzg3bHpvOHI0cWNPWW5ucGFCa3Bqcyt4U3I0a2Q5VXhyVDh0YzJaTEhDZ1B5?=
 =?utf-8?B?b3BMZXNRWGhqZ285bDErZ1owUEdlM1N5aGFWa3ZiUC90VFhVZjJJazBNQkln?=
 =?utf-8?B?VC9SYmdWSG1NS29Ia2lHK08xN01rc1hGNndDQ1pTTkdDKzFzWUtId3VsRW5K?=
 =?utf-8?B?M0VBbXdOK3lBOG4wa0xvbklTY2lxeGRjaEUxVTdubW1XSUFqVFRna1diR1JK?=
 =?utf-8?B?UlBwd0Exb3FaWDRhMVQ1RUdYbXh5TWpIOVZyUTJDajgxL1RtRmdkQ0NmeVVB?=
 =?utf-8?B?ZnEyZTg4WW5KbWUvaVZLVktDMnRDTlN0NlRGS2RSRUVVMDk4MExBcjI2WGxW?=
 =?utf-8?B?dmtqZ3l5TENLTU0yUEIyaW9DMGZXQ1ZvQ1ZFeWtUNjFYenU3UDJCaDBYbGVF?=
 =?utf-8?B?SkpZTWVLM09sWksvcUhTbW8rdzJ4bnMvUGNmYWp0d3lWbGFwaFBycnNtNHI4?=
 =?utf-8?B?VFM3Ykh1YmpUOEdkcXZUU1dKNE4xcDFiS0JnL2hSa2VPNjlNdkpteFRxTE1V?=
 =?utf-8?B?UEo5a09BcWUxRmtWb0JBdWo4WC9wdW5VUXVmcWtQb2FNaEJzajJ3cHZiQnRL?=
 =?utf-8?B?THhTSDY4NWhWSEp1cWN0c1gvSHdNUktoWllhYWJvWUdiam1PMEtseXp1UnJt?=
 =?utf-8?B?emFzZ0pGdDhKQmZDb245NmtxV0RORkI3dWdmdG5BUHREdFFkQjdSTSs4VHly?=
 =?utf-8?B?cXRhUnl0TGtJMHVFQ3d4V1Yya2Y5cEhOMDR1TFk1blZ2Vkx5S0dEMlkvcmw2?=
 =?utf-8?B?V1lsbnp4bFJZencrVFF2YnJVZXFFZ1QwVmt2QU5JS01LdFJHNWR2ZWdmMHJr?=
 =?utf-8?B?NHMrR1djZUR0WlZSN1EwWDVNSEhEOW4xZ29BcHNab3JaWkluYXRkNEk0SFBl?=
 =?utf-8?B?ejJ1NjllVkFSNCthY0Z1TlZyRVI2QXJXUk5raWdIWFF2VG9CQm1saThlbk5S?=
 =?utf-8?B?b3pXOEtrdUpNVm1jQWY1bjlVYnI4NmJhMjVJTDFoSTE3KzVWS1plekN3dGpR?=
 =?utf-8?B?RVE1QStkVi9GWk13MGxiS0c2ay9xSVBWblBFelA2UEpQTld2SUFnN3pGQUV1?=
 =?utf-8?B?dXJKWjlUT2hxT090QUQ1WHhkeDdCSHhtU1NXd1JoNTBRMkJ1WWhPdEQvMmY2?=
 =?utf-8?B?dHpZQ0xjemYxbGVaRzVwNElTTnh1TkttakFNcUFudkxCendtRFpwdVVkV3h0?=
 =?utf-8?B?UlkyMEMrS1B6enM4ckRNbjY3NmtmbUlFUTR4czY0aC9MamFFYWNnSlEvakRB?=
 =?utf-8?B?RkNRZUMvcHRpMkVWTmNha3lvU3VISzRVVnN1dy9TQTR4NW9XTlkrcy93M2ZU?=
 =?utf-8?B?djVnTm0zc0NGVUlnK1FtZ1FDaGlPUXlYYjE1Sm8zdGIvRUt5U204aUpDWENU?=
 =?utf-8?B?V3MxUTVERFRHMC82NVdzVFRyS2h2dVIzYjhnK21kRTBGdnhZR2VwYW5KVCs4?=
 =?utf-8?B?SGRHeTF1T3Awc3hWNGtxMjdFSXdlY1BLRDlpMlpYSmV0SHpEN1JBeUJsVGRG?=
 =?utf-8?B?WXNucm1qRTZ4aHhpMUFhYXM2N3BCOFNpWmZGdlUvNW05Q2ltVEFRZmZxUjMz?=
 =?utf-8?B?UVY1Y2xCYmFGeGxZQUFOTUYwRjQ5d0NxdFNaeExTYnNkS0c1VzMwaEVIeE1w?=
 =?utf-8?B?STd5Qk9MRXdOR0JaSlRuenl0cDBZQ0h5c09Ec1BFQW5FZ05ER1BSeGJqNWFk?=
 =?utf-8?B?ZlkwUk1CQW9XTGhkVDR3N0ZtcGxVM0hzdERCY1lscUlDd21oNlZjaXNYbzFa?=
 =?utf-8?B?cTFIN2l5TnIwZ3J0TmNLclBPbzNEZitQUmlEOHdhSGpneE9GUlBVaHpKV3d2?=
 =?utf-8?B?ZFltMEdXSlp2MWUwQXpZTVdZVm9xZ0phRlIzQStRVmxCUTZNQUVvT2hwWE44?=
 =?utf-8?B?K2RleW56dkNQSjZQQnl2VXNyZmY3UmpEWVJTVy9iL0ptRGxOSGpBQlFLR0Qx?=
 =?utf-8?B?YzhxREZBalBGTzNkYWtwNGduVXRXYW1zK2V3TTdHb3grZTBCQ2VBL1FId0x4?=
 =?utf-8?B?eFU4Z2NzN3B4bWRoWkxENTZGOFN3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 15:29:43.5805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ead18343-f110-4adb-bad0-08de5838bc72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022575.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4109
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
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D06CE4820E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Jan 20, 2026 at 3:09 PM CET, Andrew Cooper wrote:
> On 20/01/2026 9:38 am, Alejandro Vallejo wrote:
>> diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_h=
ypercall.c
>> index f8eca48170..2ac9fc2d96 100644
>> --- a/xen/arch/x86/platform_hypercall.c
>> +++ b/xen/arch/x86/platform_hypercall.c
>> @@ -317,8 +317,11 @@ ret_t do_platform_op(
>>      {
>>          XEN_GUEST_HANDLE(const_void) data;
>> =20
>> -        guest_from_compat_handle(data, op->u.microcode.data);
>> +        ret =3D -EOPNOTSUPP;
>> +        if ( !IS_ENABLED(CONFIG_MICROCODE_LOADING) )
>> +            break;
>> =20
>> +        guest_from_compat_handle(data, op->u.microcode.data);
>>          ret =3D ucode_update_hcall(data, op->u.microcode.length, 0);
>>          break;
>>      }
>> @@ -327,8 +330,11 @@ ret_t do_platform_op(
>>      {
>>          XEN_GUEST_HANDLE(const_void) data;
>> =20
>> -        guest_from_compat_handle(data, op->u.microcode2.data);
>> +        ret =3D -EOPNOTSUPP;
>> +        if ( !IS_ENABLED(CONFIG_MICROCODE_LOADING) )
>> +            break;
>> =20
>> +        guest_from_compat_handle(data, op->u.microcode2.data);
>>          ret =3D ucode_update_hcall(data, op->u.microcode2.length,
>>                                   op->u.microcode2.flags);
>>          break;
>
> Very minor.=C2=A0 This diff looks like this because you've dropped the bl=
ank
> line between guest_from_compat_handle() and ucode_update_hcall().=C2=A0 T=
hat
> can also be fixed up on commit.

sure

>
> ~Andrew


