Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LIVF/izb2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 076604815D
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209089.1521207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viCvm-0000OF-SG; Tue, 20 Jan 2026 14:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209089.1521207; Tue, 20 Jan 2026 14:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viCvm-0000LX-PN; Tue, 20 Jan 2026 14:42:06 +0000
Received: by outflank-mailman (input) for mailman id 1209089;
 Tue, 20 Jan 2026 14:42:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwra=7Z=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1viCvk-0000LR-TL
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 14:42:04 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2dfac964-f60e-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 15:42:02 +0100 (CET)
Received: from CYXP220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:ee::9) by
 PH0PR12MB8798.namprd12.prod.outlook.com (2603:10b6:510:28d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 14:41:56 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:930:ee:cafe::d4) by CYXP220CA0005.outlook.office365.com
 (2603:10b6:930:ee::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Tue,
 20 Jan 2026 14:41:57 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 14:41:55 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 08:41:53 -0600
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
X-Inumbo-ID: 2dfac964-f60e-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZohLDdIpVPd4QT4jddnMdnwCp5r8Ks4g4pcTLHXTWbX7Hvki2MnwhsW35eZNteNufR087ekQtDNNRxr+tOgmvf5ge/wpdjyVBPF8nCAfilieD1APRRjncibadd/lXuKw4ouphduP9mG+NDB50EW7A4Be0raRLNU5hUFF/uMQC8rHBPAxacYkSmI5gycDNv68CrI/6aJ3PJaotV22XsMY2c5Q07EH+RarzwCUbsx3t+2Ref5EZnn3jdAM50ZFRBM4c2e6bym8YviJY8CFdgfyR8lvkDFnJKuZU6e/YH1FId2NxIZJ7l6+BdefekqzOJD8G+tUoloCAaU64IzxojILgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPbcw+ui/fJN2VTuuPN9dNeVCrPVeklnWr9PY372TSI=;
 b=UzDkgqyOvStbPP03mmF87BFIQ/HvCUSBg7d25s4+aLBzHEBY9sbYLKQtQvVytQ0O9certZ51AVQZIuEFqK4ECzZ0PvBSKGRa/2WDNqNU0b8HF+F09N2Oc+T8Ru+S4XgRSDp7kx8uye8UX6Z7+sZ7ZJkveNQ6PXL2VVjDpa9vCZyy8moQe/kcmNs0toDuM2dUCd6WTVOhQ3meTmlSGCOUON7BP2TGZtL8YhIcE6xz7lfR2aKZsyUgJp9V6wSTY5OBgaq5IrutI/IYHLL17onOWxQOVI5Eb68iAjsbDqCIc7jWkW7sEPyY36eu90xn15Fwo7ORrER4klvWZQCZNzSqnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPbcw+ui/fJN2VTuuPN9dNeVCrPVeklnWr9PY372TSI=;
 b=hEsDNmfNCFqwhMu4Ngm4NKipcQHy7JboCf8StxCkgCRc69QXfeK0cWk+ZLeMgYSuXiBgWyLlJIAzHEpgC04cOALgztr3Vk3aWWK6L/EYeRi+5tfmQTfAXeh1ffZ21kvAdj6YnIupIkNgUMeaOqq/HqzOP0JTRZDZNt8JUypY/1o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 20 Jan 2026 15:41:52 +0100
Message-ID: <DFTHUH7DLTPT.2IBD4N9XTTR8X@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] x86/svm: Intercept Bus Locks for HVM guests
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
X-Mailer: aerc 0.20.1
References: <20260120095353.2778-1-alejandro.garciavallejo@amd.com>
 <20260120095353.2778-3-alejandro.garciavallejo@amd.com>
 <5c554703-f7e6-4625-be07-4fc607b2c4b5@vates.tech>
 <fb53b679-701f-4028-a75c-c4d153b80619@suse.com>
In-Reply-To: <fb53b679-701f-4028-a75c-c4d153b80619@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|PH0PR12MB8798:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a9d4e15-ecc7-41f2-0db7-08de58320f08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RmMzQnRHbUgxeWJzZW91RER1TzN6REhKSEdTV3hpNVd5NElVai9CWEk0K0Vy?=
 =?utf-8?B?ZndSVDF6aldKRWpQd1c4N2J5TURjaVlHK1FLa1d1T2t3VmZ3ZUF0dXQ4aHR3?=
 =?utf-8?B?eFdNS3d0dzdmck9GUFRZb21uVTRuRFNTb0Jlc0JHWGtPWFY2ZmpHekExVThh?=
 =?utf-8?B?U1EyUzBpYytCcXN1QThwK3hsZHNoaGoyU2o5M1hOTDlIYUs1UWJVZzVoUC9Q?=
 =?utf-8?B?SW1EY2tnWDlnbFdveUdKY2lLRjRubEhuOVMxS0lvSFNxckpYMXZoRGszc3dR?=
 =?utf-8?B?bHBuajBGbm91akJqa2ZDb1orT3NyaFFSOVAxd3RhSUZ1WUtnSU9NdzZsVlpq?=
 =?utf-8?B?RnZRelBOUktZUUlmYWwvZm93SHpxZ2V3eDlXdGE2aHY2ZFlPdVNGaTRnMU9a?=
 =?utf-8?B?bjI5TWY0NGU5R3htTjErU09tZHUydmdoS1YyanJ3ZVlLbVJPeEk1U0Z1UFNU?=
 =?utf-8?B?V3FKM3FSYnc5QkcraXIrQlBMemF3VG83aUprSEVLME12M25YWWdUREFmTUVV?=
 =?utf-8?B?QzU5NmRNbTNGSXhyR1FEQnJFajJwaVAzNnBhRDVNNUNrMmtyNzFmSTQvem9P?=
 =?utf-8?B?ekVNbnpzN3BubVlmL0xESyt0TXNmM3pXb0grQjdxOVJISGlxLzdtNXViUUdK?=
 =?utf-8?B?QmUzTURrSlBtZDRHRzM3ZlhjYmFEcUpsR1RGY0wxOGNXeTRqOS9jdVRvZ2Z1?=
 =?utf-8?B?OWdzVDk3T2JzblZad0JCNjJ4RzhRVk90c1M4d1dKSy85YTRoU3dlTTJuZ0ZN?=
 =?utf-8?B?UllBbWI2U1NYYjJJbjBrSFVQRUNtRXhoeXJhdk9CazVWcTNkSktvaEpJSVhx?=
 =?utf-8?B?SHBtYkpZQU5Edk1LWkYxTjFxaTdGTW9xZHQwWmR5NHB6WW5QQ3FHWDRWZ0Zl?=
 =?utf-8?B?L3RIMlFJM0RDSXpkbkFxYjhxWmFqVnhQc1h4VDRTcDJQWm8vejMrdWVFMmIw?=
 =?utf-8?B?RVBOUmJybDJoTVh4VVQ4RW43V3ZoRnpuNzNZTkkyOHNqWDVPemhXQ05kSzNE?=
 =?utf-8?B?ak5qY2VueEcvbVB4Z2pudGJMSkJBUnFXOGNoWmxLS2JSdDNtTFV5dzhDaGZJ?=
 =?utf-8?B?NU5EZERVNWxHSTBmVU9wbkdmZ0I5UncyNWxlenRpNGpIWXBWYnZXU1NWdVpP?=
 =?utf-8?B?dnRKdG1SVTREZ2JlaGVaeUJMMWh6b0s2SE1ZWU5aYWNoSkNrdnlsNEtvcmNC?=
 =?utf-8?B?V2loNUtSVFM3MHpPMTRHRll4MEZ3a05rZ1k0dEtZa1hvdCt3NTFKa256V3N2?=
 =?utf-8?B?SWRsalB6UUl1cWpHK2VyWUlkUDBBU1JmYUxHZjN3cUVIeXVBVTBaTTlqaWR5?=
 =?utf-8?B?b2xFWFN6RFhpOFFFdVRYbkN6VkNWYjc5NTczaVhuZ2l6TWpZUXZPUjZVclB5?=
 =?utf-8?B?WC9DUjBTa0g5T1pGVk9OREs3bmF1TUVuQVNybXpIS1gvUXlVMk4ySXRvdC8v?=
 =?utf-8?B?SWJYa2xOdUUvazVkQ21wY0w0ZWUvbHFjQllKM2xTSGtiZldmaDVUNVZwL2x6?=
 =?utf-8?B?ZVNuejZsS05HMW5nRmwyS1poTXRsZEJDaFJTbE56RnNhVVJ1WnF5ZWZabDVS?=
 =?utf-8?B?SVJGVzJwd2dOUmg0UVdtUUd2ZFZXTEJvMTlDeXMxSFl5NDhKRXZha1Bkcldx?=
 =?utf-8?B?SXlkRGhZWWZXYjhMZUpkS25EWmRNd0lQQmhaMjhuaWxNcno0VFRUbUdZT3k5?=
 =?utf-8?B?c3U1UVdibEFPZmlSOVBVaWJUVndPbStXQU9iWGpiTXI0aUtQdGNWQTNVYUZt?=
 =?utf-8?B?ZVU3ejJBQ1l2TzQycHNQUzg1ai9OYUloeEJWS3dIVEpHNGFEVW5YZjR5Rkdj?=
 =?utf-8?B?R3dOV3pBOUFSazZGRmhmaW4xT3EvbVlOREZQS29aMjk5b3JWVm16bi9BeEgy?=
 =?utf-8?B?V0VJWVN2am5mQlVQZ2ExWWFXOEJzb21JY04xMmo2ZXVLNW9EdXdmY1VkTHBw?=
 =?utf-8?B?anBVSWY3VkFsSjBKK25OcXRHZk1SNEVNaUJJcExsUzgrR1FYR0tnVUtUdldn?=
 =?utf-8?B?Z2xUU2hoQzRQUm9BczIzdW5wUmZyZXQwTzRtOFl1QVhHeURYTU1PTTBPTGJz?=
 =?utf-8?B?Nk5mbEk4YUo4QUhIOVB1UDlLMUxITi9xVVc5UDdiVTcraXo3OTZVdFlPRTVl?=
 =?utf-8?B?ZWNIRS8rckovWEIrU3owWXNMd2J6cHlOS280R2V2YWRlTTROZ3ZUTEhYMXo2?=
 =?utf-8?B?Nkc4aEVyM1oyNEswSmdhNXA2N0JHK2JVR0c2UXJRZkRXZnZQZENkeDFKOUxm?=
 =?utf-8?B?cmlXMWVLRjJXUTNKckFVS1lPdDVnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 14:41:55.6114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a9d4e15-ecc7-41f2-0db7-08de58320f08
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8798
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 076604815D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Jan 20, 2026 at 2:29 PM CET, Jan Beulich wrote:
> On 20.01.2026 14:11, Teddy Astie wrote:
>> Le 20/01/2026 =C3=A0 10:56, Alejandro Vallejo a =C3=A9crit=C2=A0:
>>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>>> @@ -66,6 +66,12 @@ static int construct_vmcb(struct vcpu *v)
>>>           GENERAL2_INTERCEPT_XSETBV      | GENERAL2_INTERCEPT_ICEBP    =
   |
>>>           GENERAL2_INTERCEPT_RDPRU;
>>>  =20
>>> +    if ( cpu_has_bus_lock_thresh )
>>> +    {
>>> +        vmcb->_general3_intercepts =3D GENERAL3_INTERCEPT_BUS_LOCK_THR=
ESH;
>>> +        vmcb->bus_lock_thresh =3D 1; /* trigger immediately */
>>> +    }
>>> +
>>>       /* Intercept all debug-register writes. */
>>>       vmcb->_dr_intercepts =3D ~0u;
>>>  =20
>>=20
>> According to APM,
>>=20
>> INTERCEPT_BUS_LOCK_THRESH does
>>  > Intercept bus lock operations when Bus Lock Threshold Counter is 0
>>=20
>> I assume that when set to 0, we intercept all bus locks, so if set to 1,=
=20
>> every 2 bus lock (since we first go from 1 to 0, then at 0 we intercept=
=20
>> the next one) ?

Correct

>>=20
>> I think we want that to be tunable, as intercepting all bus locks may be=
=20
>> too extreme we probably want to intercept every few ones instead.
>
> Otoh bus locks (as opposed to cache locks) would better be rare, or else
> perhaps such a guest deserves some extra slowing down?
>
> Jan

I agree with Jan. buslock operations are so rare it's not worth being lenie=
nt
about them. They ought to be more expensive than they currently are for the
caller, in fact, so they notice and not do it because there's rarely a rati=
onale
for them to exist at all. I'd be happier if the ISA didn't allow them at al=
l.

Cheers,
Alejandro

