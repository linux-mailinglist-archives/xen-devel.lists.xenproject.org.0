Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4INTFr7sjWnG8gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 16:07:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E07C912EC48
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 16:07:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229260.1535243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqYHG-0002ml-Du; Thu, 12 Feb 2026 15:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229260.1535243; Thu, 12 Feb 2026 15:06:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqYHG-0002kO-AW; Thu, 12 Feb 2026 15:06:46 +0000
Received: by outflank-mailman (input) for mailman id 1229260;
 Thu, 12 Feb 2026 15:06:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zRx/=AQ=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vqYHF-0002jg-MY
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 15:06:45 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70c7262a-0824-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 16:06:44 +0100 (CET)
Received: from CH0PR03CA0310.namprd03.prod.outlook.com (2603:10b6:610:118::33)
 by DS0PR12MB7557.namprd12.prod.outlook.com (2603:10b6:8:130::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 15:06:39 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::64) by CH0PR03CA0310.outlook.office365.com
 (2603:10b6:610:118::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 15:06:26 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 15:06:39 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Feb
 2026 09:06:38 -0600
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
X-Inumbo-ID: 70c7262a-0824-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEqcSYiqUrnc5bLthVvi4riYJY9bfvshFx6YUTUoPkuM/RmoFbSuT7BTN/iht7P8ygVQ3+mrgAexXkO5nbdO3PP8SKlUTZuNeCqFtvlyV2hXSSiTwtrUHMUAG/nTFPHVck9RxWkMk+dAhhUZEn+vbDwijkNBe2B9omKMmOoFF4VOfCh9CB8DfCSNaWpGxP9Q7/gaGbwS7KjU8kSYFd2HgB8NPSSMy8SVgvpngol9NrxGW2QF7qDltOaR7nR+gGlO2/cmS22QwcAc0etIJT09AZ+mmLp8IdlpgkRpBAqWpmW66FY9n2pnzbwUIwsLhktRQP2aDYN8L8PZCTUW4P6J+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CViXR9wDyIBVwA1N+AzkjLIJmHoN8bTgbQtlPLtNqOk=;
 b=yhsyXUfXETo9N2XtKnhcOfv+lfKCS8WaINZYRAMRyNr0NESOdKNcN9rsukedySbuw3sPqe794u3hyZPWjErnNLFC9ofx28xoggdGFDt0A/tPtrB/FI76MOO7ylfAouGb0D7TZF5LAACHOkIpsXsyoB9Y/EF3tc1+pIa9YH4mZEuw/HdWaWurO/pAMAP6tCvcL8Ixk/RgEq2eOTJNCm6WNYDyJMMn74iYb3u0lKX+BnN4uwggDkvoVlvjKnyuRzSThAbZEQX/ZgKcVInCRYnCaC6vdtAEdys+Ysnkexj59cjHsZ7i7Dn0i55us/Vz5C1MsiltAACdHLE9UJhZd0ZicA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CViXR9wDyIBVwA1N+AzkjLIJmHoN8bTgbQtlPLtNqOk=;
 b=dFBYTdhlqvszvHLqdiF3Tl/p1CafZu6gNe2us5jKua7apgPMILAdPqxbYIJtj7QYiKwOAmuG1Bej1xUpmINwp/mghmAEktgfl33d2e2iFA/NH6Zk8uOM3UA/Kuyu8cAqkXS3hFqrpRphlEb3/k2u7H7dz/j+bRG7A0B6TgxWYA4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 Feb 2026 16:06:37 +0100
Message-ID: <DGD2RYDMNWSJ.2JIIPRX6WYWJE@amd.com>
Subject: Re: [PATCH 06/12] x86: Migrate switch vendor checks to cpu_vendor()
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-7-alejandro.garciavallejo@amd.com>
 <dea3752f-1926-4fb4-b0df-305ebbea4aa2@suse.com>
In-Reply-To: <dea3752f-1926-4fb4-b0df-305ebbea4aa2@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|DS0PR12MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: d683e7dc-97de-4c3c-6844-08de6a48531a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M2dZbTE0NGZZWUs4MjUvRjJ5b3hsRDZBb0w4dTBCb3JZVTdFaGJ4cDJiWVAy?=
 =?utf-8?B?ejBXeVpYM29aajNQTmkrb2RzcmNQS29ub2ZrejcwUlhlS3BDQkllZVZ0VC9J?=
 =?utf-8?B?anZHQXNEdE1iem9kaGpTUC9UT3RDZDhjSDdnNkZCTmlYOEZpZFRoVERqbm5j?=
 =?utf-8?B?Z2k0ZEh3b3MvLzl4OWcvbXpDbnNyTkFWR3cybE5GR1lyWWpUenBydVo5S24y?=
 =?utf-8?B?OGdWTDVYaFVKTzBFVDkzL2dtVzdtS3QzOUg2OGUyNzk0SWNYbzdvNUFOYVdr?=
 =?utf-8?B?cHBVcnI4U1JpVFpFR1JRTmpOQkNmMlpOc1pyeTdzbDM1ZEF1MVV0MzZ4Q0hh?=
 =?utf-8?B?d3dhOFlYRGozMmJmd0U3bHhHYkFFOW42RENjUUFYcDJrSEU1ZXJJM0xYWmp0?=
 =?utf-8?B?LzVoN0tESnA3aUdQSG5XZFZydEdvb3FMQkJFSGdPalRYMGZ3RUNIQXRqMXpL?=
 =?utf-8?B?a0FRbms4alowUGpEN1QwVTQ1citFM044RGtjSHdLMjhSZWIvcFAxekhNRW5q?=
 =?utf-8?B?anlRSEdrSU5CbG01NlVzRWE2cE9KM2FIRnNqUk5vZTFUdXEybzZ4QlBFV29v?=
 =?utf-8?B?eDNqeEhCUjJuMjRKZTZXY1pad2Q2NStVWFdTckZ4MGc1YVloZnV5TG9uUFZs?=
 =?utf-8?B?YzdQblhUOWJGSVExSE04NUtzdExGeTFOOVJwbzRVYXlISDlpc3RmcktPa2xF?=
 =?utf-8?B?TnE4OEpuZ0VkUnk0Zjc2d1hMOWIwVW4zeGVNTktUSVRaOERSWEN0TnVkYUVP?=
 =?utf-8?B?aFRzdWVaRUN6ano1S0xmVEF3OWNMY3hwTE1XNHd6alJrR3FTSzNTZXU5TG5y?=
 =?utf-8?B?djJRMzNGeGNscitZdkVPY0ZqT1p5NDJVZ0Z3VFMzVjRoNDZLRllMZk42WjN1?=
 =?utf-8?B?anhsZmpLbFlRUStCb0RBOHk0Y2RTQVBqa3pXWEQwM0psQmhxQ2QrRENuVnVU?=
 =?utf-8?B?TU9KaGQ1NHBSWVdaZGxycTNOZjZiTjAvd2dhaEJRdEc4azl4aytsakZ2dlk5?=
 =?utf-8?B?dGVXUCtzWk9qZEZ0Y0ZtLzlBN3FBTEQzRkxkaW9vUVE5ZVlQNnZiYTBhdVBG?=
 =?utf-8?B?WlkxOXdjVVoxTVh3STFsNmRiNkZvVHRFMnVXczNBRVg4K1JibmhHdHFFdWVV?=
 =?utf-8?B?MGxscTFyNjR5djhQNEhoRWpFazBobDJlWWhmbFNkOHNYMkJlcnBMb2ExOWFY?=
 =?utf-8?B?Q29BTUc5Tnd5OHRGZGU4d0oyNFJSbVhzUzBjYVZ0cDBBcHAwYm9qbDdEck45?=
 =?utf-8?B?QnBTK3lkWWdwbmVIMFhWMHZwbjhPcHFyTW9JUytUeThxOUxubFBVMUVlNVdK?=
 =?utf-8?B?bHNBcDQ1TU95YTV4cHNTeUFpRi9VU0dUd0llaC9EZ1JXZHhtMkE2dGFJU3cx?=
 =?utf-8?B?Q1B5V3UrMUVQYjRoWCtDSjZsMlR3d0ErdTVWNUdPOVZ3OHNLQStOSmNQYXZj?=
 =?utf-8?B?SWtXSDBEcHJMMzh5b29WaWlncjlyVjFJQnlibExXakJiUWxFOW5FSzFHNTNB?=
 =?utf-8?B?Q1FRZGJoVXU3MDZMNWZiUlQ1WmRaV0VjU0x2MDlHd2hMcUZ5aS80di90TUhw?=
 =?utf-8?B?d3VRNjdaUVl0VVdCWkdNR29EREJ0WFMrZVdsb01rMHE1UThzLzhSZWF2YTFv?=
 =?utf-8?B?T00zaEJ0N3V1dEVYdG1tSTJvenQraHU0MEFWaDZ5N3VoNWZaYzhuQ2g4YnAz?=
 =?utf-8?B?WUw4TnRrd3FlMTkxQmpoT00wZjlocjU0L09GK2gydldIU0NPMlVwRHVnTy9s?=
 =?utf-8?B?aTVDOTRwdUIrc1o2cWhtOEtmN1J5MUJTazVFVEx3b241RGVZMkhaZGtqanBy?=
 =?utf-8?B?bGxObGo0R2dQY1VnelVBaWdjajVFa0xhOGpYQ0l6bDRBQUhISFVOSUtHVzR5?=
 =?utf-8?B?ZHhWLzdnWm1wWFNVT2NDMkNOM1FWQlVWQkc3Q0x4N2E2clMybTk0c3lnZUxF?=
 =?utf-8?B?WkVoZjNwUGp2alk4TlRYbUJXbkpRZHFuV2JwNXBuaWRZWXZhbEE2REFSNlpv?=
 =?utf-8?B?a2dNdTZDbi85alZrSmxLb1VXaDI0dWY1VEZZMk1UdFdhU1ROVDJJOW9jQ1Zr?=
 =?utf-8?B?cVlFTlJSN1l4MVc3eHRaWWlueWdrY1ljNGJEYzFrSzNYanhDWWlSWlg3cnlX?=
 =?utf-8?B?SG9UeW5STSsrekc5d2szSDNXMzhiRGQybDN1azljN0ZmTGZFUXZvM3VDYWsw?=
 =?utf-8?B?ZFpJTUhFOUxmSWpRUEE3NXVHZmRBUWNnVWc5cmorYnIwUXorRmtNVHZLUnJh?=
 =?utf-8?B?VkcrTzRBM3BrVTByczBxS3A2ejR3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jnz87LzrstBU9XnBUXhZuAOJnDJbh6XY8si3Bqu/1hjyyLeT3H3gfBdmMOgrao+h5LhXmeBtfNGrXp9N0r+jyvBYnq3ayIJMkdan30hwtPJb1zjArThxvsJsvudAm5b6EEvbtx9PX+o1fMvgUKZ25Ppj0hMizynMQKmAI1Qd/qBxXtnVw38Ip96Bfl73n/O9ceS17rZHzIefZ6Kr3fs81b2ZDnHEhsRPB0H38d6Tmc+wBAsEyDgL+Hjwv6W3Mk3EF27AVxhlwEM78QFfJMMwNd5IJCm31Xctdfxk9y9JzYujkonON37Nl15lsdQ4Bzy6uvq8K4UxwVJeqd1gyxpYHTa+OrLsoAFXFK+OP41UsMN5ucMssLuBi7N28y6+uKJ3rVq5+kZzEAgVgvRzDjnQDw0dwK0GiPhgxHiNFI7L5h6rT+A1sjBp+wDW3jwqOzhW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 15:06:39.7079
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d683e7dc-97de-4c3c-6844-08de6a48531a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7557
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E07C912EC48
X-Rspamd-Action: no action

On Thu Feb 12, 2026 at 12:06 PM CET, Jan Beulich wrote:
> On 06.02.2026 17:15, Alejandro Vallejo wrote:
>> --- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
>> +++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
>> @@ -133,7 +133,7 @@ static int __init cf_check cpufreq_driver_init(void)
>> =20
>>          ret =3D -ENOENT;
>> =20
>> -        switch ( boot_cpu_data.x86_vendor )
>> +        switch( cpu_vendor() )
>
> Nit: Please avoid screwing up style.

bah, yes.

>
>> @@ -141,12 +141,10 @@ static int __init cf_check cpufreq_driver_init(voi=
d)
>>                  switch ( cpufreq_xen_opts[i] )
>>                  {
>>                  case CPUFREQ_xen:
>> -                    ret =3D IS_ENABLED(CONFIG_INTEL) ?
>> -                          acpi_cpufreq_register() : -ENODEV;
>> +                    ret =3D acpi_cpufreq_register();
>>                      break;
>>                  case CPUFREQ_hwp:
>> -                    ret =3D IS_ENABLED(CONFIG_INTEL) ?
>> -                          hwp_register_driver() : -ENODEV;
>> +                    ret =3D hwp_register_driver();
>>                      break;
>>                  case CPUFREQ_none:
>>                      ret =3D 0;
>
> This of course is a neat (side) effect.
>
>> @@ -165,7 +163,6 @@ static int __init cf_check cpufreq_driver_init(void)
>> =20
>>          case X86_VENDOR_AMD:
>>          case X86_VENDOR_HYGON:
>> -#ifdef CONFIG_AMD
>>              for ( i =3D 0; i < cpufreq_xen_cnt; i++ )
>>              {
>>                  switch ( cpufreq_xen_opts[i] )
>> @@ -191,9 +188,6 @@ static int __init cf_check cpufreq_driver_init(void)
>>                  if ( !ret || ret =3D=3D -EBUSY )
>>                      break;
>>              }
>> -#else
>> -            ret =3D -ENODEV;
>> -#endif /* CONFIG_AMD */
>>              break;
>> =20
>>          default:
>
> There's a change to the function's return value, though: When reaching de=
fault:,
> -ENOENT will result, when previously -ENODEV would have been returned for
> compiled-out cases. It may well be that there is a dependency somewhere o=
n the
> particular return value - did you thoroughly check that?

It's a presmp_initcall. The specific ret value is inconsequential.

>
> Of course this may well apply elsewhere as well; I did not go through and=
 check
> every of the switch()es you alter.

It may. I did check, but that doesn't mean I didn't miss any.

>
>> --- a/xen/arch/x86/cpu/mcheck/mce.h
>> +++ b/xen/arch/x86/cpu/mcheck/mce.h
>> @@ -137,7 +137,7 @@ void x86_mcinfo_dump(struct mc_info *mi);
>> =20
>>  static inline int mce_vendor_bank_msr(const struct vcpu *v, uint32_t ms=
r)
>>  {
>> -    switch (boot_cpu_data.x86_vendor) {
>> +    switch (cpu_vendor()) {
>
> Would be nice if style was updated while touching such.

sure.

>
>> --- a/xen/arch/x86/cpu/vpmu.c
>> +++ b/xen/arch/x86/cpu/vpmu.c
>> @@ -815,7 +815,7 @@ static struct notifier_block cpu_nfb =3D {
>> =20
>>  static int __init cf_check vpmu_init(void)
>>  {
>> -    int vendor =3D current_cpu_data.x86_vendor;
>> +    int vendor =3D cpu_vendor();
>
> It is only seeing the plain int here that I notice that cpu_vendor() retu=
rns
> uint8_t. I don't think that's necessary, and hence as per ./CODING_STYLE =
it
> should rather be unsigned int. Which is then waht would want using here a=
s
> well.

Hmm, I need to check whether it affects codegen. Probably not seeing how it=
s
all inline. Will do unless it has terrible side effects.

>
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -319,7 +319,7 @@ void domain_cpu_policy_changed(struct domain *d)
>>              if ( cpu_has_htt )
>>                  edx |=3D cpufeat_mask(X86_FEATURE_HTT);
>> =20
>> -            switch ( boot_cpu_data.x86_vendor )
>> +            switch( cpu_vendor() )
>>              {
>>              case X86_VENDOR_INTEL:
>>                  /*
>> @@ -427,7 +427,7 @@ void domain_cpu_policy_changed(struct domain *d)
>>              if ( !(p->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON))=
 )
>>                  edx &=3D ~CPUID_COMMON_1D_FEATURES;
>> =20
>> -            switch ( boot_cpu_data.x86_vendor )
>> +            switch( cpu_vendor() )
> As they recur, I wonder where these bogus style adjustments are coming fr=
om.
> It's not like ...
>
>> --- a/xen/arch/x86/guest/xen/xen.c
>> +++ b/xen/arch/x86/guest/xen/xen.c
>> @@ -63,7 +63,7 @@ void asmlinkage __init early_hypercall_setup(void)
>>                    x86_cpuid_vendor_to_str(boot_cpu_data.x86_vendor));
>>      }
>> =20
>> -    switch ( boot_cpu_data.x86_vendor )
>> +    switch ( cpu_vendor() )
>
> ... you would have used a bad sed pattern globally, as here style remains
> intact. Further down it breaks again.

This patch used to be several. One of the primordial commits seems to suffe=
r
from this. Will fix globally. Thanks.

Alejandro

