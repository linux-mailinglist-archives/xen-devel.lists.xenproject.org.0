Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wC9bAO4DcmmvZwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 12:03:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 574BD65AB4
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 12:03:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210784.1522401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1visSS-00026v-Gw; Thu, 22 Jan 2026 11:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210784.1522401; Thu, 22 Jan 2026 11:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1visSS-00024l-EA; Thu, 22 Jan 2026 11:02:36 +0000
Received: by outflank-mailman (input) for mailman id 1210784;
 Thu, 22 Jan 2026 11:02:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I1tn=73=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1visSR-00024f-Ed
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 11:02:35 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d960ba43-f781-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 12:02:32 +0100 (CET)
Received: from BL1PR13CA0310.namprd13.prod.outlook.com (2603:10b6:208:2c1::15)
 by CH3PR12MB7570.namprd12.prod.outlook.com (2603:10b6:610:149::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 11:02:27 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:2c1:cafe::7f) by BL1PR13CA0310.outlook.office365.com
 (2603:10b6:208:2c1::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.2 via Frontend Transport; Thu,
 22 Jan 2026 11:02:26 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 11:02:26 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 22 Jan
 2026 05:02:24 -0600
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
X-Inumbo-ID: d960ba43-f781-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zDI/e30euLTNY6CPFkIE+KAIETIzGGyPI9sHOdUxds81pnyZuItVh0N6OQpkQAIbJq9g7B4zMuVDYQFDehzkZcdvMGiFdYGpxKOj7c8A0W6qD70bUVMfMzqo4YRgSuBk93fBj+j9YlVj8yiAv3N203ZfkfH7fj1+9F6FW+KeJ/SIrGZpzzdn4YxD0+OwT3qgwL28STmEQC+RQP8NlFIBUqpoNT7UbpnQWXj8fePa6A3i45nkThbiRQoCgR0ipiszc2W/Yfgq5JjsgjCQo5UZ0MQB3yCtpslkUvoPivOue7jq/ggnh0ZvJHDlbDx0+cHbcNHEo67jaw00pyn5OtQGLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LM8YiTQwtVwHP2YnilcnhoC7qDPxU22vJbVwDpcGvwU=;
 b=rvn1jnjImJL6ZLTiSnyurTUxxfbtF8rVjKqHTEHP68qMHVC8oGtj/TH8wdbJ1zXIRaYAfyoTerN9b8yjpWIbXdo2fmL/fgtXunHQ33ueQn301HQmKB68n6CK3bOWwzG7Xy7UZfqfN8/nSK7D4ya5ZUWYRMwBqEQXJ/8oy8GrEX+AzsZQDjmVi1tDLejqkR94PO7kw1M412AxT/QCTi+kf5zKuPO/Mwxnnxt2daGFR07MB6CZ00YkWmrJFujnsxLD3okhKViWV6DgS61GqAR+rID5iyt9JCDXm2sVD+jFunBexNgA4gOb1TjiDcxfoiOC/di8urtH7hztdgSrYU20UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LM8YiTQwtVwHP2YnilcnhoC7qDPxU22vJbVwDpcGvwU=;
 b=GCQDfeEaNiimlj4+ujOJCRYJUhpBblD9H5Y8EEDEe/6N3WxDsyINV78OsS+X83WAwuWX08T2xYL7vPjNoSgNHs92A1gTLfmdvsdiNQDdtm3EOhpsHC81oasdIYLVq4cmLux6XElTtLMuYv33Y3V9yq9xeA2uhNWF7cy04iPKIU0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 22 Jan 2026 12:02:23 +0100
Message-ID: <DFV2FIFSCOPM.3O550OQ2G1KB8@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 1/2] xen: Allow lib-y targets to also be .init.o
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.20.1
References: <20260121154757.44350-1-alejandro.garciavallejo@amd.com>
 <20260121154757.44350-2-alejandro.garciavallejo@amd.com>
 <526ef477-0730-4e22-a82f-4c598ad78e0a@suse.com>
 <b7475771-3ae3-426e-9255-d886ec0b2ba9@suse.com>
In-Reply-To: <b7475771-3ae3-426e-9255-d886ec0b2ba9@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|CH3PR12MB7570:EE_
X-MS-Office365-Filtering-Correlation-Id: 25159a5a-d254-46a4-a866-08de59a5ba9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eCtGRnBSbkpPNjk1Q3ZaNW8ySmJra08vUDdDSFkvT3RyKzQ1TU11N210N0tV?=
 =?utf-8?B?MHIyWTZmN1V3dVNXUmlHZnBINGxpZ0RNQ2lFV1BDOTI0SGVwMk5lN1BxWXc0?=
 =?utf-8?B?a2k5Mm1xMTB3a256Z2dtT3lNVGtqUFo4U3pRK0tROGdYMU42eHU2bkVYLzFM?=
 =?utf-8?B?anNDWjhLQnk3SHJVWG9aaEMxZHVlMFNtUVBYVXhwVGFURGJDRUh2Mnl0UlQx?=
 =?utf-8?B?eUxZbXpsQ2VhWWs0OWFzK0thWDNOQXBEUHlkWWZxMTAwV010Mmc5VEF2MUlk?=
 =?utf-8?B?a3dBNk15ckl1V3Ayc3MzbG1jS0hHeUJyQlhaYUJxZGovbkYvMnNhK0tGYkpy?=
 =?utf-8?B?TTRRWnpwalJsdW13Mm5rK3l5TFRLSU1iazd2S1YzNnZmbjlnY01vUWxDYVE0?=
 =?utf-8?B?ZXNKNXcrdC8rb2hwblU4U1RweU5PRXFvV2ViUkVDamtqeTErVjFLREJDRkN3?=
 =?utf-8?B?N21YQWJLQ1E4eDZQUFlyclFtQ1ZiUExYN3NZOU9WQ2t0RlNZYllWRXA2SkJ2?=
 =?utf-8?B?ZTgyOFRVM2N5TzRGUzliREVyT1FOeEl4czY5eE5hUTgwWTFXVEFGcnJPam5N?=
 =?utf-8?B?d2QrRmpSVEppdVZDVHgyV3F0Y2pyWk9CMDRSRnMwa1dVY3F1bWNQWjJzVkRB?=
 =?utf-8?B?UmdpYWd5SWN6bjhxVTdwdVU2bDBLaUMvZWtFZ2IyUE9vM0pTaFF6Y2RTc1FC?=
 =?utf-8?B?dnl6WFg1aFNPM1RSbjdUVzVtOWNUcC9NclBlemYxVVhJZkNwclhodWNDUmsr?=
 =?utf-8?B?MWl0aHBFY3Ftd0xKZUxneGlDN0Mwa3dOQWxmeWJ6YVlBVzI4K0pmdzRnR0RW?=
 =?utf-8?B?QlA4aTgwZGcxQkJFRW9qR2dLVlFueGdiY09tTmlyeEFaWHFodW0zL1R1dXNK?=
 =?utf-8?B?eTVlNlJ2eDBSV1c2dkEzN3AwWWFFc3dBWVhsUXFhSmVHdEg0ZUhCRG8yTWhL?=
 =?utf-8?B?TlhjR0RiSjdSSWxKcDFmazZ4aVZwemhwTzQ3NWx6Vm9vQmtySEdKeklBaFhN?=
 =?utf-8?B?c3NFdkJTb3htQXZxZnM0UVBOSVpmMTRFM3Y1a1JjQ3Y0RlJrSk9USGxUYzdF?=
 =?utf-8?B?aHNjZkg4cURiUllIRll1Rk15QlkzUWpMd0R0NEl1UG13VkFDck1KYWpFYjZY?=
 =?utf-8?B?ckNnWjdlUERLYS9TcVozcjVWRXlJVXJRalk5S1orRkIvaXJFendXRmJPZDZt?=
 =?utf-8?B?QmFmdFdHcDgxMVFCUjFSVjZKdGoxNHVjT1ZzTVlqMmJQWGdJWEt2K2tEUmF0?=
 =?utf-8?B?dDlITDNQckNWL25yZjJubXg5aGp0dFNNdWxieU5uTUk0Nmc0VnZJelJnRWNs?=
 =?utf-8?B?bUJzVjdVd0k1L05yOVVSK0JTRTRyWnZlWmtOa3F5aWR2elpRajlDMU1KeHVj?=
 =?utf-8?B?VlNLTE8zVUlWMVhzeGxORVMzaHhJbnZsRUN3TkhTbzFDQnFydjBlZ0dONmdT?=
 =?utf-8?B?Zjdoblc4NExHTGRWdnBUYndpdTZHdVJKUTdvcE1nVmhyWmxUUjFXQmlSZkI3?=
 =?utf-8?B?NkplWHBXOHZRcXJGditTK2dnbktXQkI5Q0dNWTRhZzYzcUt5TmpLc1dUQVcr?=
 =?utf-8?B?ZFFEeHFmazlyNUl2NXVLZXhRZXk5OU4xTGQ4Zk5jbmYxU0pxeU9RMHRYdVh4?=
 =?utf-8?B?bzRhQVBrK3BqaENNeFUzNCswUnZqV21sVXozdk5ZSk9jR2JwaS9Pak9xSHB6?=
 =?utf-8?B?ZE1xMW1LbjRHOWVRVlZIL0V3Snk1SVBaL2h3aHRvQm1OaFpTTVM3RlVEYTJV?=
 =?utf-8?B?NkFzWGRaQkF4QmFabGlOWE4xYXpiQThJckd2VWtuWXR2azRiSS9GSDJJTnU2?=
 =?utf-8?B?Z3ZXczFmcUtTcUp0TDF3ZGVJK2xZa2t6NEwyNGRFTDJJMDJoRE9TRVlKZTd2?=
 =?utf-8?B?WVl3enRkZUxkbnF5bkRjUGVZRUdqK3YyZVdJVnR4REV5bC9oc3QzdkRudjdG?=
 =?utf-8?B?SHQ0WGl2Wm40cU9KWnhhSzc1T1JBZncvcG1GcWpaWW5WOCtMeUNreTgwcUFR?=
 =?utf-8?B?cEtzeWtWMlFNNUh4RFpLb0oxd0FrT1ZLdzZIL0tuUEduTUkyb1RHZkJwOFZK?=
 =?utf-8?B?Mm5PQWxHWmxqL1pxQlVLMGc4NnNNeHgzeEVhdWI3SXc1OGgwenBDYldmcmh6?=
 =?utf-8?B?S0x6dHptZmlyemprUnJSQUNia2g4MU5oUWdvYXUxbXczVjY1OTNhWHJvbW9q?=
 =?utf-8?B?ZVVVWkFCM0ZPR3hSM3RVanYrMlJ3STlBWUZBOG9RN1l0YmlVU1hjY21qbEpP?=
 =?utf-8?B?aFl2MHpFVDd6b1gyQVlRUjdwcjNBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 11:02:26.8058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25159a5a-d254-46a4-a866-08de59a5ba9c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7570
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 574BD65AB4
X-Rspamd-Action: no action

On Thu Jan 22, 2026 at 11:01 AM CET, Jan Beulich wrote:
> On 22.01.2026 10:49, Jan Beulich wrote:
>> On 21.01.2026 16:47, Alejandro Vallejo wrote:
>>> There's some assumptions as to which targets may be init-only. But
>>> there's little reason to preclude libraries from being init-only.
>>>
>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>=20
>> I can't tell (yet) what it is, but as per CI something's clearly wrong w=
ith this
>> change. Both xilinx-smoke-dom0less-arm64-* and qemu-smoke-dom0*-debug* f=
ail with
>> it in place. qemu-smoke-dom0-arm64-gcc (no "debug") was fine, suggesting=
 it may
>> be an early assertion triggering.
>
> Or an early UBSAN failure. I think ...
>
>>> --- a/xen/Rules.mk
>>> +++ b/xen/Rules.mk
>>> @@ -130,9 +130,9 @@ endif
>>> =20
>>>  targets +=3D $(targets-for-builtin)
>>> =20
>>> -$(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS-y +=3D -DI=
NIT_SECTIONS_ONLY
>>> +$(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y) $(lib-y)): CFLAGS-y=
 +=3D -DINIT_SECTIONS_ONLY
>>> =20
>>> -non-init-objects =3D $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(ex=
tra-y))
>>> +non-init-objects =3D $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(ex=
tra-y) $(lib-y))
>
> ... this is the problem: You're _adding_ library files here which weren't=
 there
> before. Why $(lib-y) isn't here I don't really known, but as per the CI r=
esults
> there must be a reason for this.

Apologies for the unintended breakage. I should've checked the baseline for
arm before ruling out this patch being the cause (it did fire in my pipelin=
e,
but didn't consider how this could affect arm and attributed it to a spurio=
us
failure).

So we're neither doing UBSAN nor collecting coverage data from libs? Great.=
 One
more task to the pile, I guess. Seeing how...

 $(non-init-objects): _c_flags +=3D $(cov-cflags-y)
 [snip]
 $(non-init-objects): _c_flags +=3D $(UBSAN_FLAGS)

I'll try to clean this mess. :/

Cheers,
Alejandro

