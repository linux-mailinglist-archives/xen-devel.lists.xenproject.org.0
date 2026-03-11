Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGNLGR6usWmzEQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 19:02:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2B1268618
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 19:02:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251431.1548568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0NsX-0008Cu-Gk; Wed, 11 Mar 2026 18:01:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251431.1548568; Wed, 11 Mar 2026 18:01:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0NsX-0008Ae-Dh; Wed, 11 Mar 2026 18:01:53 +0000
Received: by outflank-mailman (input) for mailman id 1251431;
 Wed, 11 Mar 2026 18:01:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tK7a=BL=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1w0NsW-0008AN-0S
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 18:01:52 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ffeb0bc-1d74-11f1-b164-2bf370ae4941;
 Wed, 11 Mar 2026 19:01:50 +0100 (CET)
Received: from MN2PR20CA0044.namprd20.prod.outlook.com (2603:10b6:208:235::13)
 by BN7PPF02710D35B.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6c4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.3; Wed, 11 Mar
 2026 18:01:46 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:208:235:cafe::53) by MN2PR20CA0044.outlook.office365.com
 (2603:10b6:208:235::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Wed,
 11 Mar 2026 18:01:37 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.1 via Frontend Transport; Wed, 11 Mar 2026 18:01:46 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Mar
 2026 13:01:30 -0500
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
X-Inumbo-ID: 5ffeb0bc-1d74-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dr0Gs0qu45yXBUBSglHv44/qGOTa4orggIm+FWKGK/wSAJDfDrNI+yjsaFXXyetWfqjmQJkv+Dep2zecy6DOPUsx76PJIObV3PMcrCkp1B+Q74GcVPwVgxOJYYzMHtwekrKNKNLniw0VRip3mHiL+Aau0RcrwCiZj2OQauUEAeANapP2awFGwoTlolaoMjK8avWxNaLsrXoAaa2GyPdHFdcBEN6v1nHpEGgvjjoYGOdUhnt1yhba5BCQLz2S90hTpJxnNWpfsjIWueE9uO9G9Lhp20JMECSMDFGSUavb7im2JE7jPxAr/iQDoVtrKNzXB//mjGmV4wqhxhjiGg2nqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okI4fiejMMls0M1i0caJ90L2TUXisxMbRuJCnUtSXu0=;
 b=LzBMxnmKdhOjx8TAf5ir/Y7b0c6fcj1hvm2gitgDumInzF5AUEkbqd2cNp/1XL/kQiq65ac7LCwZtDMrZdoSWeWDeiZKm0lbihhxDRgPRYjHZAffzTvbzfucQxx2z1rlZTuVeB52GVbfFGksiUwyZ/PZn2Mv4ITfPND+SKrY7CJkkFtyZpP/rnLHayYsKtvQflofc8NA26h32/I00IAoA/yKSgsBoLf65f+vOhr+MiNoKeczO9AeHcSxGk9Gv4M/Mdr8LFauzDWUePiBdcIwQfi9w8l7nmgQOikRpJOvD++lTbRcvPTUrzuMz3SjMCcj8RRYYvkRhEelHXAx9il0og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=okI4fiejMMls0M1i0caJ90L2TUXisxMbRuJCnUtSXu0=;
 b=YKoxCDeOE0hKbzkKAZRvtyqcaNFYQSWJ+QmcD0UUunhJTS9jVOfR/sNvDTxLQE37LTGUn/i28bj9KTLt31xYUbORyP0+VnsxJKfB0ywub1+YXmOKGFry7lzSZI88vSxk4NwqyNXzc17ELa4JPgyYsUpULt5inbOg3KFKx0O8RN0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 11 Mar 2026 19:01:25 +0100
Message-ID: <DH05EHW9PD7C.132K81VFX47GG@amd.com>
Subject: Re: [PATCH v4 2/4] x86/hvm: Disable cross-vendor handling in #UD
 handler
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20260311142711.16754-1-alejandro.garciavallejo@amd.com>
 <20260311142711.16754-3-alejandro.garciavallejo@amd.com>
 <d76d6c2c-b81a-417b-9d4e-07f301e35dbc@suse.com>
In-Reply-To: <d76d6c2c-b81a-417b-9d4e-07f301e35dbc@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|BN7PPF02710D35B:EE_
X-MS-Office365-Filtering-Correlation-Id: c27c5355-b116-492d-541d-08de7f98428a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dif0zl2YGVvK6wZyWvmVhDB9iKip7jWMizMsPLNd024X0dguZikDqAfvvAF0zujWCAXzN4ipe/ghNQ6WtzNVPpT8lI+xk3t8i4mXLqkpsPAbWwYUvAm5CtTIJut9tM8DH2n8rjSJ59rVlrD3t0aGCT3jOFXI8l7f3Ur/G4BvJJ89/7h2bVV0SEpdk0stl9p0GfvNL4I9ydxnjOSe71tM++GuNL5gsqNQE6/ldwwU108MvvO5kVVZKuTf7ThILe6yZIn3mJTwNxy6CHrr4SgGKcE9sGun/YuG99n2F2fr6/9bOYNmKmJbMPNe/26HOs2iZnNTR/+nHmHGrt2eM/BJRNjj14UwrEY/ciiIFA2ilw1eAiaipU2S485iWTlonFwOJ4HbaU282ZdRyDQdqO/8V2BAMp4Uvj7xy42jeVC4m8ZxHKOiau6COgHUDfpntQIW1SgbTWAmH0XF+OOKKa/gYiNlvrcobZHhQj1THK1E1IF8RvgO/GWLd6/1gHdvR0ErIvb6SjMKTgKji8x4JcWJ0DhWiJXWZ0LuI5UbT33gHJ6j6TigKTnXidYaTy9O/e1m0hpNKtIueShhn3dXdJWtqVAqBfUcdP+z1aQYO78oliLBRNMqogPwljT/osXxSmQsQAcK5batfpm+h608JoqDqrEMa5FGzGqAmsmgvvmS6GQ7y8oJ7vHaOZ/GfUHqMvOnW5kB8DtKLxlmyPsKF1HRywVQWfHGvDDT5R3KpY6df3Mm73SxUmuMeDIu07K6F9pv65oXAJ1NeOiSDHxea2OCRA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wNWa4ehWMaSZchkpkLR6YA5PdR59cWUPrRX25vgl3StS/T1kFc7tLSQTDnXeZ9b5X0X1H/Hg3FzO6CcBXrI11PBXCl8tNikSBJLuu8BvuunZyLJs5PoLoRrr0ic2OiMamhphys29h4ABqS4iRJAY9WgVnpIScCQbPmt/J1zt//O+FodXjxsOQctXlq84uzMucaQuBGndgAW+9c8BR4maTtYMhlRsCJjf4REofyIk/u8lAyLzTa3VitPNkOrjWdp1Qn5S39RNd0iBAO/vN+K0OmgUCq5HJfMQ7Wfdx4enNaNojtuOT3htRBp5aM29GzyGCJUJbywPsikxMY+Y6xu1dKsGRv980bPyeFCTpObNzjvHgx5UP7D3CZR0xZ1iwNFj6z38ndz3brC7hSleYDkxZVP4Fpwr+UsXuFjsWuJfMuxtk/Xi8Qh2n4sDS9yV8AIN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 18:01:46.0743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c27c5355-b116-492d-541d-08de7f98428a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF02710D35B
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:dkim,amd.com:email,amd.com:mid];
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
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CA2B1268618
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Mar 11, 2026 at 3:59 PM CET, Jan Beulich wrote:
> On 11.03.2026 15:27, Alejandro Vallejo wrote:
>> Remove cross-vendor support now that VMs can no longer have a different
>> vendor than the host.
>>=20
>> While at it, refactor the function to exit early and skip initialising
>> the emulation context when FEP is not enabled.
>>=20
>> No functional change intended.
>>=20
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> ---
>> v4:
>>   * Reverted refactor of the `walk` variable assignment
>
> "Revert" as in "move it even farther away from the original".

Revert as in not split the assignment and restore the orignal syntax _of th=
e
assignment_, which was the main focus of the prior discussion.

It's hardly my intention to add unrequested changes, but I can't address th=
at
which isn't explicitly requested.

> As said, you want re-indentation,

This is an ambiguous piece of advice.

Of what? That can mean moving the prior logic back to its original location=
 and
crate a minimal diff (1) or simply collapsing the indentation of the block =
(2).

(1) can't be done with hvm context initialiser moving after the early exit,
which I explicitly mentioned in the commit message I wanted to do.

(2) can't happen because declarations and statements cannot be mixed (thoug=
h I
really wish we dropped that rule).

There's a third option of keeping a silly { ... } around just for indentati=
on
purposes, but that's worse than either of the other 2 options.

Maybe there's a fourth code arrangement in your head that does all this in =
a
way you find less intrusive and I just don't see it. If so, feel free to se=
nd
a patch I can review. It'll be faster for the both of us. Or tell me precis=
ely
what's at fault here.

If it's the diff, I'll go for option (1) above. I don't care enough about i=
t to
argue.

> so please do just that, nothing else that isn't
> explicitly justified (like the moving of hvm_emulate_init_once() is).

I'm not sure if you're fine with that motion because it's in the commit mes=
sage
or not because it's a refactor that shouldn't be in the patch. This stateme=
nt
can be read either way.

> With
> this put back in its original shape (can do while committing, I suppose):
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

I don't think it's very obvious what you mean to do on commit, so it wouldn=
't be
appropriate to agree to your adjustments, seeing how I just don't know what=
 they
are. I'm happy to send a v4.5 on this particular patch with whatever else n=
eeds
modifying. Or a full v5 even. Or review whatever you wish to send as a v4.5=
 of
this patch.

Your pick.

>> + reinject:
>
> I'm inclined to suggest to indent this the same as the case labels.

I didn't notice the extra statement in CODING_STYLE for labels inside switc=
hes.
I tend to do that myself, but thought it wasn't in Xen's style. Sounds good
then.

Cheers,
Alejandro

