Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKggO5c1sWm0rwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 10:27:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6354D26073A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 10:27:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250908.1548248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0Fqq-0007kK-2e; Wed, 11 Mar 2026 09:27:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250908.1548248; Wed, 11 Mar 2026 09:27:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0Fqp-0007hE-Vo; Wed, 11 Mar 2026 09:27:35 +0000
Received: by outflank-mailman (input) for mailman id 1250908;
 Wed, 11 Mar 2026 09:27:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tK7a=BL=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1w0Fqo-0007h2-HF
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 09:27:34 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87f1909d-1d2c-11f1-b164-2bf370ae4941;
 Wed, 11 Mar 2026 10:27:33 +0100 (CET)
Received: from CH0PR03CA0227.namprd03.prod.outlook.com (2603:10b6:610:e7::22)
 by IA1PR12MB6041.namprd12.prod.outlook.com (2603:10b6:208:3d7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 09:27:28 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::71) by CH0PR03CA0227.outlook.office365.com
 (2603:10b6:610:e7::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Wed,
 11 Mar 2026 09:27:22 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 09:27:26 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Mar
 2026 04:27:24 -0500
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
X-Inumbo-ID: 87f1909d-1d2c-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L8tIst6WlaYAb0lWAMMJDQc05DwDKFCP3vuEI7xCTRbTv0k/AQ9++zQDqNdI2iTE0ETFPTJZNWC1rw2jW+L4k5nNVdxVa5ApaOwz6IjjlV1KMLbJJ3Pvxwd6BTEBVWJSjOx6S3PjMFPsuxXNGIf/aqWAzQZp+M1nf4NwQ/HrSgKOWbvZoIqL32qrh1KACHCoGw3nUJidWkgels6GyLIPa7TmqAcHoi1Z3HFC0z+AUESa4BFyHLyJWFDxJbSG4b2nLN8sCauK2UR10U8w8gJ871ElMJnd1NtXD8VIbwC3aPzHHuzzWc+1df7UV//8DHhGGc2IW3A9NspilwYqEkmKUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNrrOymFCnhDiqnrfwMeebp+A/+//ewqO1p99oDlPs4=;
 b=jLaLueIJeomi5Q3Pj9l2Y5tvTyug70xunrrmetEw2SpTE2hyr3HcN0lnqLElQT2mB93cIbQBd84YyQ/6gR2MuoZP1GalDar9WoBnmHnj0SKDI2mSiw/1fDaYP+YhBU1ulDzwlTcZuW5huy00hGOIAHi7HQ9+f5yXows6FTkv5+rP1Mwky4rXUUzTeL0iLnEUNzfpbdH1IfE4uQ9eL4WiKegc904w7DkTML5LHtrJHYubzy3bBe+lBtHIX3YpZzSDaAumRP5EA+GBFS/muo2lokM/Kj3N4g62AM/PhFevQDHARwOxuSRciPvYf5I1DUZytBz+uB0Artx6rHNMdL1LuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNrrOymFCnhDiqnrfwMeebp+A/+//ewqO1p99oDlPs4=;
 b=o2XkGPkz6t2MU0abAWveCSyD2yCooRMoH2jrHIuGWvj6Qm7ml0FTgNWCCWxoy9rTPv4Htt8/cAiN8CT8me9fYnUgvQfbcovMTUNo3fFgLIpRcmH56HQ5R6ubYj/nUOyjR0nfwUJzwiP8Xm+6Y2iz9lAjxTbMhQSSjhICGp80XAM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 11 Mar 2026 10:27:22 +0100
Message-ID: <DGZUGX2F941D.4SJTXQNVTJ9U@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 4/4] x86/svm: Drop emulation of Intel's SYSENTER
 behaviour on AMD systems
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.20.1
References: <20260213114232.42996-1-alejandro.garciavallejo@amd.com>
 <20260213114232.42996-5-alejandro.garciavallejo@amd.com>
 <f63e2fa3-65b9-4dcd-983f-4e753ea21bd0@suse.com>
In-Reply-To: <f63e2fa3-65b9-4dcd-983f-4e753ea21bd0@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|IA1PR12MB6041:EE_
X-MS-Office365-Filtering-Correlation-Id: 172a8972-44b0-425a-6952-08de7f506893
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|22082099003|56012099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	ajJ9u3A1Asb0AhIiHYd7S/fWWnGflSeFUiDTjGQm5pm5S0iVszOnpqcHq8sdFKEveFb6R5vtmpvdldbK7dqD7fE34P/J3UB0vGN26Pub8BjHPSAKmhEiXsGqvajPplFU5tGxfnRxPSZcTDn9lBkXz+p3zxIIK4onCY+cT5d9bzfZEa0jWbyOQLstDP/G2rR18gtcQlt5AKP+Bn6J8vwyhqePRMXxS64/yqChtDgzsha1AjlQIOvZnW3/+JiRnNguSckf2h5ozdnqw0C0yArEmMxTYq+b0wpxEjNpJUdjcL+s36d2/CAfBYk2DT6rarrlYOpAbw3Iqphf+PNzztB+3DCVKT6TKkIIPDJIbKpkjLTWBgnlSTa8pu6i/aoFHcFJAhsgBlWpLLKtjnmOXt0NeSNb+plAr5oe5XJHG5mK5lSnnHEqrBe07c9C4GqtvUaApVMbq8O+eqUJc5FRBw3iF81esoAzZVa8Sb8IC+gyNhHbtUVYjIs/+mK6bCP+/gXyQTeng8RV/VM3gDYA4FJ4mzcRH9gPMgllpeug/YAN51NabVdXs7DS4IqwLrX55/6fILERthChmJUE5EiYmp7S0335LyE8rloUtL0OBuLCMTHro85+xlJob7EcFgh5izl7MX9b+f97+ouZNcVKNA/ZuFPpebs/L7F7kL58GBKr+PS76RlOsnpUoYH9lhjS5ECp1toeHxpb0WgPHFZpTvl93CX6le/z54PLIot2now6BE2XvpdRDv2AQgXqXIoYqDd455pUuM0ZXYHRlH8aovT8sw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(22082099003)(56012099003)(18002099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	h5xsG9CHu7E3Fl79BwdIxE89XoWP39oKwLDD2ix/p+b20jG2CIG0UABSEzsRkj3HAPx5O70t+slwpeXqrYagf591/QikyZ1oHpeBLyh3CdkSSEQ56CPPotGVilWgtflME4M+k7dVLkq0qYGx8fMjhycmWHQQbpNIoZtRenRQuvsz60YkDhNVViKei4sTwcAe5pUfpxY23oUcOgPLPTkbj7MKxDb5Q0gyYG8NFfbiTgldfuxNMkrg/+BRmhZtfLkj1cB0ZOVjUFf73SrUWf44suQPW3Ve+1VGpgOYYilzWZTEO5+Ewr/hqgsPOQMNcTPFQZWDvW0Ci+Axv5tni2Xwb4IRdh/zh1CnJmkztQUCPbA1XNN0WTDodKaavT+fXUDTVMjwgWn7/A0dQCkleaZNn9J4XYeDz6JTZcSoQQl/8M05ABCoMeDCwKjhsZoaarvI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 09:27:26.1465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 172a8972-44b0-425a-6952-08de7f506893
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6041
X-Rspamd-Queue-Id: 6354D26073A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:dkim,amd.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Wed Mar 11, 2026 at 9:46 AM CET, Jan Beulich wrote:
> On 13.02.2026 12:42, Alejandro Vallejo wrote:
>> @@ -501,6 +492,9 @@ static void svm_save_cpu_state(struct vcpu *v, struc=
t hvm_hw_cpu *data)
>>  {
>>      struct vmcb_struct *vmcb =3D v->arch.hvm.svm.vmcb;
>> =20
>> +    data->sysenter_cs      =3D vmcb->sysenter_cs;
>> +    data->sysenter_esp     =3D vmcb->sysenter_esp;
>> +    data->sysenter_eip     =3D vmcb->sysenter_eip;
>>      data->shadow_gs        =3D vmcb->kerngsbase;
>>      data->msr_lstar        =3D vmcb->lstar;
>>      data->msr_star         =3D vmcb->star;
>
> May I suggest to do writes by increasing address order? I.e. while this
> already looks fine, ...
>
>> @@ -512,11 +506,14 @@ static void svm_load_cpu_state(struct vcpu *v, str=
uct hvm_hw_cpu *data)
>>  {
>>      struct vmcb_struct *vmcb =3D v->arch.hvm.svm.vmcb;
>> =20
>> -    vmcb->kerngsbase =3D data->shadow_gs;
>> -    vmcb->lstar      =3D data->msr_lstar;
>> -    vmcb->star       =3D data->msr_star;
>> -    vmcb->cstar      =3D data->msr_cstar;
>> -    vmcb->sfmask     =3D data->msr_syscall_mask;
>> +    vmcb->sysenter_cs  =3D data->sysenter_cs;
>> +    vmcb->sysenter_esp =3D data->sysenter_esp;
>> +    vmcb->sysenter_eip =3D data->sysenter_eip;
>> +    vmcb->kerngsbase   =3D data->shadow_gs;
>> +    vmcb->lstar        =3D data->msr_lstar;
>> +    vmcb->star         =3D data->msr_star;
>> +    vmcb->cstar        =3D data->msr_cstar;
>> +    vmcb->sfmask       =3D data->msr_syscall_mask;
>>      v->arch.hvm.guest_efer =3D data->msr_efer;
>>      svm_update_guest_efer(v);
>>  }
>
> ... your additions would want to move down here (and the other writes may
> then want re-ordering as well). Preferably with that:

Sure.

> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

Alejandro

