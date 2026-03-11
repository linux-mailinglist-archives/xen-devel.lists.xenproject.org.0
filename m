Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGcbIRljsWnQugIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 13:42:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E09CB263BC0
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 13:42:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251082.1548362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0Irw-0002oe-Nw; Wed, 11 Mar 2026 12:40:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251082.1548362; Wed, 11 Mar 2026 12:40:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0Irw-0002mi-LE; Wed, 11 Mar 2026 12:40:56 +0000
Received: by outflank-mailman (input) for mailman id 1251082;
 Wed, 11 Mar 2026 12:40:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tK7a=BL=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1w0Irv-0002mc-Hg
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 12:40:55 +0000
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c110::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8aad7e35-1d47-11f1-b164-2bf370ae4941;
 Wed, 11 Mar 2026 13:40:53 +0100 (CET)
Received: from PH7P221CA0071.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::24)
 by MW6PR12MB7085.namprd12.prod.outlook.com (2603:10b6:303:238::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 12:40:47 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:510:328:cafe::ec) by PH7P221CA0071.outlook.office365.com
 (2603:10b6:510:328::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Wed,
 11 Mar 2026 12:40:47 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 12:40:46 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Mar
 2026 07:40:45 -0500
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
X-Inumbo-ID: 8aad7e35-1d47-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AuCMEP9XpWU3ctKIjFlHgv8tUHBD2D577Y0Lf5B/eh1aMV5ERR8mBIWsOpeGvpcpD5CWZiwU3VWaRDyduuuDeVo57M7b1wiEw5J1FmpDmwj/qqGox8g0jPw0elVQ9SvEbCxpFEXzQoLdAEXSFhtK2UKVtit9LYfpDejJ/jjVtfWBhuVMle+fWcXrGtUtShC7PoG4fsC/GeRwrUztoM11J90Q4+dx4p8+i5Cy79XJey97GoMNJBMI3zaSjGbAt34fWi1wZMnO0s+d69nz0LARpB4SqtvJPbQNyj9hMzKua803g975jjNgAVsc+6K0vPosjTSja+qFFVMR3taSTECgOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkIQXLNOHmFB9zDorOhqVCMM0hyznygcYm0FFlY59vk=;
 b=o0yK55K08Ag2vHYZGVT4sALGePyTTg6pv7ZSuFdzePPwtPXcPq4xzO5jdpNur+xXCKJrki18HPRodbMaDsbAOW33+y8ZHJHstjPzrAM8VLjoEq2XWLhKZgXO0AUryaA1Vu3p1B7eEkDhf0jIDWbYwcb+7c+7kdfbjF9O+b7oaZ463C2lG3T2xTYAOiKs7Q3UwtJa/CX3M10jISccsrh9T/FSKdkkO6eJVnKv5sbbJEyHmSsN8wPoLov/2Pt2iEtYzE9NB8koXtAJ6JfPsXGMh9XVreA6A7QWFexB9GEihTwzy2QxDh9Fi1A21+ltkBvZaaGgyL/JTXTghZIlOD4O+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkIQXLNOHmFB9zDorOhqVCMM0hyznygcYm0FFlY59vk=;
 b=RglvFu5sGsbTJ7/mFcFJqNt2aVc32yIe06JbTCfe2gdALxv5NU4GUp2/+SPOh5Jk8Cz77K5yYWzvlLlOAJ6L2IU46SEwQ++u8mwn+WfM065dmhuEkcioD7x/GOp96FGeNeyHabf63915JppZhQFGGt9JItEQmfh4eF1jhD7hFKU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 11 Mar 2026 13:40:44 +0100
Message-ID: <DGZYKZ2PYXJU.1F5BZQKPFZOTF@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/4] x86/hvm: Disable cross-vendor handling in #UD
 handler
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.20.1
References: <20260213114232.42996-1-alejandro.garciavallejo@amd.com>
 <20260213114232.42996-3-alejandro.garciavallejo@amd.com>
 <813d3fc9-170a-4f25-872a-3688946c236d@suse.com>
 <DGZUFMGSILDF.3ES3YACXM6AG4@amd.com>
 <f5b74658-3a5f-47ac-8eaa-3f7fbf431a32@suse.com>
 <DGZVMOYWFGY5.3NSQ9DUBFDOLR@amd.com>
 <66926b3b-82e0-4595-b54f-e73cef396ea2@suse.com>
In-Reply-To: <66926b3b-82e0-4595-b54f-e73cef396ea2@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|MW6PR12MB7085:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d679ad1-7eb7-46d1-93a0-08de7f6b6b3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EplUtRIzctCE5VNr1hhQBufyXtpzmVnHlRFB5UFfM19puqbegZp+EBYYex0tWNt0W+WwNsrC4CINi2zyvnsGfBIfL/htcMQ88UTcqwKQMFiAbATJl4BZU3RDCV+g1h/+ZvAJvBPufiu2Il1j2GIIGpjWcsSDjsj/tusSbaGKiI/vRwfaqcERbKf1qQe6DynltjU+Oi9S4m50CVjSA5nFrO6NBmoWUYGgyFSUD5FClLhH0qCZGpWf3K1xwa5ngS51DFWt2Cbz6xo6F73YSNwc7jhDOxN4/HHiUeoBSwyfgOxQwp0o8d1Mo2HB0QJOPQTDP8ReDWUkOtIdEf1I05Z1TO16d2AMqa2Ks5sS4XkDdCQBWSFtZ+MSTnmLLouetMyRCoc/KZWDCJnnzahTD3z2ka+A2qS1leVqzBK1ljOypwrX1h7qtyrwvMthJ2OzAcl2sRoxD8oamS8uWyHA+jNTbWid6zchLIYqDLrJ7oApT1z9tuOUbXlrq/PmT8K0f4M8xbOYVDeSfDd+mhLyhyNfwD9kJKMC4X2LleUF5QCqnBT8pkE4NpRONSuzg0sRShk7efjDURPtsLhYu33j4pxrruh7S4P448DKZ38f9y1eGmBmjMQjgHQ3UlrI2+7Krm2hzYA5NeFH8lMnu37qT4obDxnKTnK4qwmgEb2F0yo14UYcbP6noAB9TuITA0m6BcQqM/6N8f6kM3aMjbmmYUAKnWcITUcNHeKVF0n1oTLtDZr8rFzgaOeqLA0bsh5BvsO7L3tVf9OxN5ZkZnL6IPVhlw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6CFXoKZQ6Wa2G3HrgAt8Tb420P09OoE1X8ffJ9lSEMtQ5mGnD2y/NFgKSuGb0bIp/NxcB8kkeP5pqh1ZiO5uEBBFS03diDjUDYUf8eX+j9ebn2qgH2Vhfk/4o1HKxqxcgxLcPArzQPipyMJY41wJGnvP2+A3wDCt0UvZ5+u6VPkma/oIfmLfQr9BjQP/qXUJeyQUviVqFN7ldko9BzJhPlzYQrjHT4+b7FGfhcjcFSCrNUH8VXNNTLy6rEG7z6cD5tHt2jyMFRDOkfBhH7jiYO+2d93aKHt7cIXU6yrPFEaMIg88MkO8yeFJ3QBGDaX3VkCnmC6FuqEvCRbjZfZxtdrecdP0epLNzIZNK7HVzK1FyCSKfBC58LPJ+jYP6wC1iBx44FrY9n6tZ5AcTqcwHOA0p7UyyIphfLKy+mmC/nmRzhAxx2UMw2jPrwR0ept/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 12:40:46.9603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d679ad1-7eb7-46d1-93a0-08de7f6b6b3b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7085
X-Rspamd-Queue-Id: E09CB263BC0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
X-Rspamd-Action: no action

On Wed Mar 11, 2026 at 12:06 PM CET, Jan Beulich wrote:
> On 11.03.2026 11:21, Alejandro Vallejo wrote:
>> On Wed Mar 11, 2026 at 10:30 AM CET, Jan Beulich wrote:
>>> On 11.03.2026 10:25, Alejandro Vallejo wrote:
>>>> On Wed Mar 11, 2026 at 9:35 AM CET, Jan Beulich wrote:
>>>>> On 13.02.2026 12:42, Alejandro Vallejo wrote:
>>>>>> -    if ( opt_hvm_fep )
>>>>>> -    {
>>>>>> -        const struct segment_register *cs =3D &ctxt.seg_reg[x86_seg=
_cs];
>>>>>> -        uint32_t walk =3D ((ctxt.seg_reg[x86_seg_ss].dpl =3D=3D 3)
>>>>>> -                         ? PFEC_user_mode : 0) | PFEC_insn_fetch;
>>>>>
>>>>> Why is this initializer not retained?
>>>>
>>>> It is, it's just that the diff is terrible. An unfortunate side effect=
 of the
>>>> removal of the braces. The scope collapsing forces it on top of the fu=
nction,
>>>> before the emulation context is initialised.
>>>>
>>>> It's set up in steps. walk is unconditionally initialised as isnsn_fet=
ch, and
>>>> later (after emulate_init_once()), OR'd with PFEC_user_mode for DPL =
=3D=3D 3. See...
>>>>
>>>>>
>>>>>> -        unsigned long addr;
>>>>>> -        char sig[5]; /* ud2; .ascii "xen" */
>>>>>> -
>>>>>> -        if ( hvm_virtual_to_linear_addr(x86_seg_cs, cs, regs->rip,
>>>>>> -                                        sizeof(sig), hvm_access_ins=
n_fetch,
>>>>>> -                                        cs, &addr) &&
>>>>>> -             (hvm_copy_from_guest_linear(sig, addr, sizeof(sig),
>>>>>> -                                         walk, NULL) =3D=3D HVMTRAN=
S_okay) &&
>>>>>> -             (memcmp(sig, "\xf\xb" "xen", sizeof(sig)) =3D=3D 0) )
>>>>>> -        {
>>>>>> -            regs->rip +=3D sizeof(sig);
>>>>>> -            regs->eflags &=3D ~X86_EFLAGS_RF;
>>>>>> +    hvm_emulate_init_once(&ctxt, NULL, regs);
>>>>>> =20
>>>>>> -            /* Zero the upper 32 bits of %rip if not in 64bit mode.=
 */
>>>>>> -            if ( !(hvm_long_mode_active(cur) && cs->l) )
>>>>>> -                regs->rip =3D (uint32_t)regs->rip;
>>>>>> +    if ( ctxt.seg_reg[x86_seg_ss].dpl =3D=3D 3 )
>>>>>> +        walk |=3D PFEC_user_mode;
>>>>
>>>> ... here.
>>>
>>> But that's the point of my question: Why did you split it? All you mean=
 to
>>> do is re-indentation.
>>=20
>> Because I need to declare "walk" ahead of the statements. Thus this...
>>=20
>>     uint32_t walk =3D ((ctxt.seg_reg[x86_seg_ss].dpl =3D=3D 3)
>>                      ? PFEC_user_mode : 0) | PFEC_insn_fetch;
>>=20
>> must (by necessity) have the declaration placed on top before the emulat=
or
>> context initialisation. The options are...
>>=20
>>     uint32_t walk;
>>     [... lines ...]
>>     walk =3D ((ctxt.seg_reg[x86_seg_ss].dpl =3D=3D 3)
>>             ? PFEC_user_mode : 0) | PFEC_insn_fetch;
>>=20
>> ... or...
>>=20
>>     uint32_t walk =3D PFEC_insn_fetch;
>>     [... lines ...]
>>     if ( ctxt.seg_reg[x86_seg_ss].dpl =3D=3D 3 )
>>         walk |=3D PFEC_user_mode;
>>=20
>> Line count remains at 3 in both cases, but in the former case there's a
>> comparison, a ternary operator and an OR all adding cognitive load to th=
e
>> same statement. In the latter case there's an assignment in the 1st stat=
ement,
>> an if+comparison in a separate line, and a separate OR in the final stat=
ement.
>> It's just simpler to meantally parse because the complexity is evenly
>> distributed.
>>=20
>> I can see how the current form was preferred to avoid a third line (and
>> then a forth due to the required newline, doubling the total). But with =
the
>> rearrangement that's no longer relevant.
>>=20
>> If you have a very strong preference for the prior form I could keep it,=
 though
>> I do have a preference myself for the latter out of improved readability=
.
>
> Strong preference or not - readability is subjective. I prefer the presen=
t
> form, where the variable obtains it final value right away. More generall=
y,
> with subjective aspects it may often be better to leave mechanical change=
s
> (here: re-indentation) as purely mechanical. Things are different with
> objective aspects, like style violations which of course can (and imo
> preferably should) be corrected on such occasions.

Ack

Cheers,
Alejandro

