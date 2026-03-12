Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNY2IaXJsmmvPAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 15:11:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E30AD2731DA
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 15:11:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252447.1549129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0gl8-0001nU-7G; Thu, 12 Mar 2026 14:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252447.1549129; Thu, 12 Mar 2026 14:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0gl8-0001l9-4Z; Thu, 12 Mar 2026 14:11:30 +0000
Received: by outflank-mailman (input) for mailman id 1252447;
 Thu, 12 Mar 2026 14:11:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=17Qz=BM=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1w0gl6-0001l3-Qu
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 14:11:28 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a8861dd-1e1d-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 15:11:26 +0100 (CET)
Received: from CH0PR03CA0019.namprd03.prod.outlook.com (2603:10b6:610:b0::24)
 by DS0PR12MB9057.namprd12.prod.outlook.com (2603:10b6:8:c7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Thu, 12 Mar
 2026 14:11:17 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::99) by CH0PR03CA0019.outlook.office365.com
 (2603:10b6:610:b0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.28 via Frontend Transport; Thu,
 12 Mar 2026 14:11:10 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 14:11:17 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Mar
 2026 09:11:10 -0500
Received: from localhost (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Mar
 2026 07:02:38 -0700
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
X-Inumbo-ID: 5a8861dd-1e1d-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vpmd9RGo7BiJyRPhdE3gvBIryy7pFAD6al1gukHKtG1h6gPM4qfPOv2/ctHAWjnb4DNs2KwbvZFmjwMf77irMObj91wyDGhXJMzkdXxLEURm8h1Cz0h1DlrhV4S3wBY34c9ytJwWv1iDXP8J7no11jQ+fCOJWjcplOsOLBPBf7UPR/nmXm8TkG6cBjaSNPQqOdYp6CS87GEt2R07gJ0ROBvYgHHAw8cD8qv4ltxOf/6ZvCLwrAexN5B1TQ1HhgFDbcUkLY4A75pOrbYVFhAzXOTCfIBuIl+WFMQ7XdRcM5uWVdJhKlJOF3Cj9uXGwRuOJBZV0+t643L5wUFdvTfaRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ygk6T4hWc/DWYmyFTOeqWe2L6qfEZIP82s69SGYY8OU=;
 b=eTRBb1Ps85l3CM8vjMvbkWmrtlP/18jfL+fJgESr9ZVc7pZN9cmW8xC4Ms+mEXMwY36yffnoNblk5Y5zsyaFTBRyl/uSVDAlsaI664NxJOiSMBfge4w3HfZgD5zZqMcja9R4cDxEKit9XiJ9QUY/WT8WdK3Z+pXF9g0YeqQUbtDRRZMIxiNnKFwiESeu8naLIQ0DL7fTW2G+ienZu4f3l1SfNp40EOlgWqLpPrGml6CnqsF/c74BCJJvo9manhddiYOlx5qWr9X2/dJHMrsXM36i6BSplWy8MxCDBiCdxdJ3mceXKetGhNuaGMCQ7p8xsBicR8I6CW87eiptyaHsRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ygk6T4hWc/DWYmyFTOeqWe2L6qfEZIP82s69SGYY8OU=;
 b=JYMRVU1/TobHKRNql4xl9KdGrdl22VfWTPbrk0aSGMPMsHwskV1De5X3szAmWvhOl8RVQfxVe32pJots09gXYlWRsSN2PpNVm9aTYkwcJ9pV0R7HrbX0dTvTfN6SZhm1GshX1/AA6y3RHjK7TGaXePAeHnUDLS3Czb7eDzQVXac=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 Mar 2026 15:02:36 +0100
Message-ID: <DH0UY76CXR3S.2VR0A0K912P8R@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 5/5] x86/hvm: Un-indent the HVM_FEP block in the #UD
 handler
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20260312112116.22563-1-alejandro.garciavallejo@amd.com>
 <20260312112116.22563-6-alejandro.garciavallejo@amd.com>
 <12ed74c0-1ea2-4458-881e-ccb7e59e0088@suse.com>
In-Reply-To: <12ed74c0-1ea2-4458-881e-ccb7e59e0088@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|DS0PR12MB9057:EE_
X-MS-Office365-Filtering-Correlation-Id: 55eae381-80d9-409a-e080-08de80413aa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mv+VWNt6yWxkGeRibxlM456wH+T37Me3t+p2wn6FlYFiZZsUNl+aD1NdNTbPjHueqoa0V67jkI8MHQl4Rq60lmDr7qrZ0NFkfeV1uyTN74iLU52ht1FvVuy8sD3eF3YStQYf0H0HrEKlROQcYsUjY5EEvzLsL8pPwszLEpxLD8ygiEYgkaKmvd0H8qvQ3qQGeVItmGupUz1W8knuuD/v2VxjEZ7u5mZ8CWOPv8XuuI7DcKrGqvFq2IZn0Qryh8WbDPiha0ljr8qeVrnTfsmU5xwfJZIWWTK3t+Iaqmpnfepzd//xe/3NKIV3IQCUpUXuczYRBIRLEv5gDH3Q9YxGymqaw0+I0uUQcYKewJP4sSjaBSMPl9rGszob1X3cdGurvdb/98Z/sEEfDt6qxqj3ihLbt8CjZ+gQvurqqGbCG5o+GwJMdC4WBW2iZkyqJ3ikxr/WA66KKfKiBm36VcGiUC2jrxemd2mdlFL9NKnxkDYEhSYfNB+WkuXvaoJALUMGCbucRTx9k1fMBtmgTkrA6uubZCdcCzjdLW0e/jRMOO3xFJQ+39a8nlsTqfyRvCwxquUWnGLEPE1h8spYclHQF7FAyEpd07DkSJHAJUa6c3LfIdPKiJWw2zLS0151CD8EjmcSzDR8xfJ4arIEXNOTOh5B1j8V/3prN/zboLlLDRewkEtLZo+V3Xb0tBRvs03zJFEp9dLj8glwGFFj/exFKr1VUcsgjF2IfkiqqhPKkApP+iwreun/dimWwPItoNSk3Jq7jn6EpXoIJvFWXhZ6QQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7vsOIiIL/mZsSodla8WIpj9j4ROVfIIpNWpfpwxy2GAVl/wZDpNBrvarEVyKzP1RqF9H8xcRSkccx3bEiUWRW6jFV/GEFABFdkvjOkewB6RyVW/V0jETkbVSHvllJBtufoe+zEi9njhLdtph4fHeE7wi596yeHhF+qs/RGsV837hm7ugl4uzSM5oplpMyuB1goB9hLxsV0gs7JYkvvbd/liOM3aZmlRB3MH+FCwB3LezmutwnafCKinqGeT7KKowWmWi1jXOixzP+4eZSXhJR5sQkv2LIf7rMpq5pyJt+XZGHkpEZE77ol8Kmt/IsHxNQXNl7l7XVA1VfBJdkiObBHxUV7thfLOngrdFHqFFEIzEfr1acKN+Vuwj58if3pqjTTPLXeJht9xs181eAvORLodrme0XpYDIxW2fF8D5YB43e5OtbbtrrjEDpGLBTEMG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 14:11:17.7497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55eae381-80d9-409a-e080-08de80413aa0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9057
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: E30AD2731DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu Mar 12, 2026 at 12:42 PM CET, Jan Beulich wrote:
> On 12.03.2026 12:21, Alejandro Vallejo wrote:
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -3837,35 +3837,34 @@ void hvm_ud_intercept(struct cpu_user_regs *regs=
)
>>      struct vcpu *cur =3D current;
>>      bool should_emulate =3D false;
>>      struct hvm_emulate_ctxt ctxt;
>> +    const struct segment_register *cs;
>> +    uint32_t walk;
>> +    unsigned long addr;
>> +    char sig[5]; /* ud2; .ascii "xen" */
>> =20
>>      hvm_emulate_init_once(&ctxt, NULL, regs);
>> =20
>> -    if ( opt_hvm_fep )
>> +    cs =3D &ctxt.seg_reg[x86_seg_cs];
>> +    walk =3D ((ctxt.seg_reg[x86_seg_ss].dpl =3D=3D 3)
>> +            ? PFEC_user_mode : 0) | PFEC_insn_fetch;
>
> While of course functionally everything's fine this way, I'm now entirely=
 lost:
> Why are what were ...
>
>> +    if ( hvm_virtual_to_linear_addr(x86_seg_cs, cs, regs->rip,
>> +                                    sizeof(sig), hvm_access_insn_fetch,
>> +                                    cs, &addr) &&
>> +         (hvm_copy_from_guest_linear(sig, addr, sizeof(sig),
>> +                                     walk, NULL) =3D=3D HVMTRANS_okay) =
&&
>> +         (memcmp(sig, "\xf\xb" "xen", sizeof(sig)) =3D=3D 0) )
>>      {
>> -        const struct segment_register *cs =3D &ctxt.seg_reg[x86_seg_cs]=
;
>> -        uint32_t walk =3D ((ctxt.seg_reg[x86_seg_ss].dpl =3D=3D 3)
>> -                         ? PFEC_user_mode : 0) | PFEC_insn_fetch;
>
> ... initializers before not initializers anymore, when all you're doing i=
s
> (supposedly) re-indentation (and, necessarily, moving decls up to the top=
 of
> the scope they need to live in)?

walk cannot be initialised at the delcaration site because it relies on
hvm_emulate_init_once() having run and you made a strong argument to preser=
ve
the current form so I left cs next to walk, as it was before.

>
>> -        unsigned long addr;
>> -        char sig[5]; /* ud2; .ascii "xen" */
>> -
>> -        if ( hvm_virtual_to_linear_addr(x86_seg_cs, cs, regs->rip,
>> -                                        sizeof(sig), hvm_access_insn_fe=
tch,
>> -                                        cs, &addr) &&
>> -             (hvm_copy_from_guest_linear(sig, addr, sizeof(sig),
>> -                                         walk, NULL) =3D=3D HVMTRANS_ok=
ay) &&
>> -             (memcmp(sig, "\xf\xb" "xen", sizeof(sig)) =3D=3D 0) )
>> -        {
>> -            regs->rip +=3D sizeof(sig);
>> -            regs->eflags &=3D ~X86_EFLAGS_RF;
>> +        regs->rip +=3D sizeof(sig);
>> +        regs->eflags &=3D ~X86_EFLAGS_RF;
>> =20
>> -            /* Zero the upper 32 bits of %rip if not in 64bit mode. */
>> -            if ( !(hvm_long_mode_active(cur) && cs->l) )
>> -                regs->rip =3D (uint32_t)regs->rip;
>> +        /* Zero the upper 32 bits of %rip if not in 64bit mode. */
>> +        if ( !(hvm_long_mode_active(cur) && cs->l) )
>> +            regs->rip =3D (uint32_t)regs->rip;
>> =20
>> -            add_taint(TAINT_HVM_FEP);
>> +        add_taint(TAINT_HVM_FEP);
>> =20
>> -            should_emulate =3D true;
>> -        }
>> +        should_emulate =3D true;
>>      }
>> =20
>>      if ( !should_emulate )
>
> With this, the purpose of the should_emulate variable effectively vanishe=
s,
> without it actually being purged (unlike you had it earlier).

That goes away with patch 6, that I neglected to send before.

>
> Jan


