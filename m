Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAXrNtD0s2nYdgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 12:28:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAF228238D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 12:28:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253551.1549732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w10g4-0003LV-Nt; Fri, 13 Mar 2026 11:27:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253551.1549732; Fri, 13 Mar 2026 11:27:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w10g4-0003Iy-LG; Fri, 13 Mar 2026 11:27:36 +0000
Received: by outflank-mailman (input) for mailman id 1253551;
 Fri, 13 Mar 2026 11:27:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SvP/=BN=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1w10g3-0003Is-G3
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 11:27:35 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0089034-1ecf-11f1-b164-2bf370ae4941;
 Fri, 13 Mar 2026 12:27:33 +0100 (CET)
Received: from DS7P220CA0042.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::35) by
 LVUPR12MB999162.namprd12.prod.outlook.com (2603:10b6:408:3a2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Fri, 13 Mar
 2026 11:27:27 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:8:223:cafe::34) by DS7P220CA0042.outlook.office365.com
 (2603:10b6:8:223::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.16 via Frontend Transport; Fri,
 13 Mar 2026 11:27:27 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 11:27:27 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Mar
 2026 06:27:25 -0500
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
X-Inumbo-ID: a0089034-1ecf-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISx8sNcd4K1X5/YRgiDM9Gl0no0EYtAViZxW08zqm8/8LDHfLuLiGsVTaKCh6S0azxCw72fR5DxFlI0XZ3f3c0LwCuCpdFv4hdZHxAnBs38Z1MZ43G9Fh9cRBpygUtM28EXqzir7mXfy3qdb6+nhPoNzlie8fdvxDk3TSVmPvsQboEpbwiWIg8U6IBBy5laweZvP4rCv3PmfY6jmkzGNy9GZX3aOHTfZM2QJh7d4O31hDdSO7ytDQAQu/mFndDUqIgk7MPW2xGvqyGNe2SrhLSTdAwCW2YBzymrimXOcNQexDcLYWzM2cjwngtbuhwAarHVhjLWPAvxTLwVSkr/ZNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7jeo7FjACy6+3xAmpUGqOgAc/b1qt2HxxFvx8aSx5U=;
 b=JiOC/ddw7NhZuelGqlUb5FGR19+I+UFEjK/GJYvpDwOF1cVR2WVTeGA/cRZVal6vrKza/L44KvZx8u2FCu+WGe6UxgeQsMBW+Kp1ppSXj8HQV4Vb8yyFW4IzcGnjQYlj1UfPZE5I8YwYMpvt0xGmwUG8iYQmFYb+0O7cDePV0ak8TVURUHe9YgU57WpJm2D5JRXqrl1nv7VdIkyMkN87wZztS4FlpMYUBDvnyPkhWKuoCpGVTCAm0nlGVriwi3+w1ZGZRruCUCGqE7rWguUN44VMyBwOaHJsD/O9cXI17IhjcIvzpMY1A+1nDOJOSAjCq4VWaaNyTVRAHDUWsdH11g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7jeo7FjACy6+3xAmpUGqOgAc/b1qt2HxxFvx8aSx5U=;
 b=UdsHncO7Wl68t/E7SKdRJ1Y+sHB3uLGyAMgr7V5IFTpoq80jIDBRfRgZdA0lol4UeKgTkJOOjukYAwqO7hcKHz5PoZMcoLl1oAWpa8oMQW8sLmM5o/zvLyCZhkBLxq2UKAauEc+lCJJmphTBq1DD6Z/TyWokWYs50oBzkmwXSJE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 13 Mar 2026 12:27:24 +0100
Message-ID: <DH1M9WRZYYCB.2345TIX8OTAGA@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: Re: [PATCH v5 1/5] x86: Reject CPU policies with vendors other than
 the host's
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20260312112116.22563-1-alejandro.garciavallejo@amd.com>
 <20260312112116.22563-2-alejandro.garciavallejo@amd.com>
 <92d21438-9573-45ce-a589-d292d1c31ecf@citrix.com>
In-Reply-To: <92d21438-9573-45ce-a589-d292d1c31ecf@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|LVUPR12MB999162:EE_
X-MS-Office365-Filtering-Correlation-Id: 267a16f5-90d9-4f0b-8761-08de80f381a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|18002099003|56012099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	6H6s2igukdcMz6ZCgjBWAaYg70Stwt6I3Dva6Ci+m11j7Wbs8FYJdnL0fR33babJqWoHINpzqFNh1YtLZon98SNymQsmnJgLn7ud+/p8KBpAfVpzi5V7fCVx0Y0nN4vKhE4ZBRSwmDicY3+wsasswJcfaZJdljrvC/C7wKKHNlBtTuV89clcHP8JhBGWLTXWIEENKDktcNhmxuPcyPaS6OH9s2q98GmVC+rgUFR5Hi9a3cc+jFG3+pOBTwG+SNXks7unFD6Rjp7wTFOy5r5KD7FDg3cjWnXodQR5VO4+9L7rgdGysuxUUXgH+tqkEDF0J0FdsNtpEUSNZmRjtglYUqR18p7rVagqo4LgNLq+iETvxZxrxcPLaWNbAxVeptLPdfA8JvsZtmRccendq53IVkTaW4gFhKDClQ+2YTRh3W7iojFqB7P086gIk8BQGIlNqMu8dUL0fktD0Hn47GLtzLZ0D3kZ2AE21t5W2lGaa6tZqNmA8VtNkUg+R5Ly5LGYTP0nBZCJWiE5JAXPD6SLqlE0tz0iFwtp3q6idQ5bL2Qe7AeAQQGkQitBQ8tVYnuk0WSHYfxfc/4k1I152G6YTZkPwYAjdiY/3lxDdNLQDztURrxWVfHut38ZDqlddO/kPPRzuulu9gzmby+d9gigNZY6h7S/DPmHHFo/Jf7YgI8HfH+4+hlV1gOVM6PyCCKqWrj66gjUQV6Ay21NOjCD2uDmJo1wLhNG+Yf1CoUp58U=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(56012099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o66xJ+OU4X+dgN2mDM8J+R7/zHut4ZeucmbVqep6i7gVlX0yRTCODD6ilPPQRZPIsozVN4nozCwydvxDqoK9weXqIbs5oni/KWKBnn0W5WJJa5TrxmOCbfcNkGtWt6PCYwzuz4Nf/Hhp/Fl8jwtYESprWfQpHDoB6xXOZd00h9OzhZ9KZyyl6LauMIIZqtyd13f7ekB5soCc8J9awldHktc3i+KmSTG3k2tZIqRi5WZrwTAWUWSCSyVfHKxwVwCWdic7jSBZZXcIbziZVB54506pf0de2UW3H+kW555rYCj+rwtUeI8q+1YnEgdcv/1Ie3V7Ue4XMkGdhRH4XldWbiEZKchaKzI5qP9hxWfqWQ7moN9/WMFoYhZVfnM9b08LcVlhMLG/l8U/iP1GWFP9wUbZX0Wj/IzFDSuJnRMqOPeZOxgQAhCTzVIIzCrp4BUa
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 11:27:27.3169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 267a16f5-90d9-4f0b-8761-08de80f381a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR12MB999162
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org,suse.com,citrix.com,vates.tech];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,amd.com:dkim,amd.com:email,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3DAF228238D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu Mar 12, 2026 at 10:01 PM CET, Andrew Cooper wrote:
> On 12/03/2026 11:21 am, Alejandro Vallejo wrote:
>> While in principle it's possible to have a vendor virtualising another,
>> this is fairly tricky in practice and comes with the world's supply of
>> security issues.
>>
>> Reject any CPU policy with vendors not matching the host's.
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> ---
>>  CHANGELOG.md                             |  5 +++++
>>  tools/tests/cpu-policy/test-cpu-policy.c | 27 ++++++++++++++++++++++++
>>  xen/arch/x86/lib/cpu-policy/policy.c     |  5 ++++-
>>  3 files changed, 36 insertions(+), 1 deletion(-)
>>
>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>> index c191e504aba..90ba5da69e4 100644
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -23,6 +23,11 @@ The format is based on [Keep a Changelog](https://kee=
pachangelog.com/en/1.0.0/)
>>     - Xenoprofile support.  Oprofile themselves removed support for Xen =
in 2014
>>       prior to the version 1.0 release, and there has been no developmen=
t since
>>       before then in Xen.
>> +   - Domains can no longer run on a system with CPUs of a vendor differ=
ent from
>> +     the one they were initially launched on. This affects live migrati=
ons and
>> +     save/restore workflows across mixed-vendor hosts. Cross-vendor emu=
lation
>> +     has always been unreliable, but since 2017 with the advent of spec=
ulation
>> +     security it became unsustainably so.
>
> c/s 0f1cb96e9785294f149ab3c7feb90c0eb9daeede was when it got added to Xen=
.
>
> I'm certain there's a whitepaper somewhere from AMD about this, but I
> can't locate it.=C2=A0 It was partly marketing about how you could buy AM=
D
> hardware (which was cheaper) and live-migrate your Intel VMs without
> interruption.=C2=A0 It would have been nice to find for posterity.
>
> For the changelog, can I suggest this:
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index c191e504aba9..377711d40953 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -23,6 +23,12 @@ The format is based on [Keep a Changelog](https://keep=
achangelog.com/en/1.0.0/)
> =C2=A0 =C2=A0 - Xenoprofile support.=C2=A0 Oprofile themselves removed su=
pport for Xen in 2014
> =C2=A0 =C2=A0 =C2=A0 prior to the version 1.0 release, and there has been=
 no development since
> =C2=A0 =C2=A0 =C2=A0 before then in Xen.
> +=C2=A0 =C2=A0- Cross-vendor support; guests can now only be configured a=
s the same
> +=C2=A0 =C2=A0 =C2=A0vendor as the host CPU.=C2=A0 When added back in 200=
9, with enough trickery
> +=C2=A0 =C2=A0 =C2=A0Intel and AMD CPUs could be made to be compatible en=
ough to live migrate
> +=C2=A0 =C2=A0 =C2=A0a guest, but the vendors have been diverging since t=
hen in ways that Xen
> +=C2=A0 =C2=A0 =C2=A0cannot compensate for, and the advent of speculative=
 security issues has
> +=C2=A0 =C2=A0 =C2=A0put to rest any possibility of this being a viable o=
ption.
> =C2=A0
> =C2=A0 - Removed xenpm tool on non-x86 platforms as it doesn't actually p=
rovide
> =C2=A0 =C2=A0 anything useful outside of x86.
>
>
> which is closer to the style of the surrounding bullet points.=C2=A0 Also
> s/domain/guest/ which is a subtle but important distinction made by the
> Security Team when discussing configurations.

Sure on both accounts. I don't mind the contents so long as there is any.

Should I consider these on the "doable on commit" camp? Or do you want a v6=
?

Cheers,
Alejandro

