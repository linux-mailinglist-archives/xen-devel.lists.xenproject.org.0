Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJL1ND8UcmksawAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 13:12:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B1D66769
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 13:12:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210896.1522491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vitYD-0005kU-6d; Thu, 22 Jan 2026 12:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210896.1522491; Thu, 22 Jan 2026 12:12:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vitYD-0005ho-3E; Thu, 22 Jan 2026 12:12:37 +0000
Received: by outflank-mailman (input) for mailman id 1210896;
 Thu, 22 Jan 2026 12:12:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I1tn=73=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vitYB-0005hi-6a
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 12:12:35 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1e9fb5e-f78b-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 13:12:33 +0100 (CET)
Received: from BL1PR13CA0254.namprd13.prod.outlook.com (2603:10b6:208:2ba::19)
 by DM4PR12MB8569.namprd12.prod.outlook.com (2603:10b6:8:18a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 12:12:27 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2603:10b6:208:2ba:cafe::f6) by BL1PR13CA0254.outlook.office365.com
 (2603:10b6:208:2ba::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3 via Frontend Transport; Thu,
 22 Jan 2026 12:12:24 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 12:12:27 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 22 Jan
 2026 06:12:25 -0600
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
X-Inumbo-ID: a1e9fb5e-f78b-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D8ScAi3WN6Wjzw8BZEFmGsdfV9ogBJEifUD+X0zQjb+v2PYG8q1u1EAtRGC3N9eIEEaMPz2Vm8xO30vLBMfiQQ7MIZMGrBl6NVPi4WG5XeQ4+oNqAV1A1YPww/PWZoZq/fLM5vtkHkNWLKB8+GelMwCpTZfwouDonigykIMq8MUMsN7V+cfhIZzpFueEYYC5lKdHi74kIuTwqW75XFQAnVkGXlLHV2rRK723g/2ylEDj2TTBm84DaGUz2AsqezYvTxskcuMUIoB3Yku7FiCDRtfinqa1tgcXVsu+TyTJpDVdYPE1OVrBHR9O5C9rCU/G7JZKZk3v5B8cD8GibWdbGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDr0xrEgeEMieZpD7AE89s8wHRx3himgYI7UM5k53uw=;
 b=ODHj4ENCAaVpZzDPZMboA2TDhH+ZGXDNbF30ef/zvE/huf488JK+lchrNfKnaqhAvsNvHm+PjfUbh85pKrcsSm3Rn3IUgv+ukCP8ukGc5YQATjrx/SjT0bCtVJIXKS+ZVEoDlPBl5cZFyzDWN5jrd92TMD3E+czXazjHjfuwhvmIY8vMnQ1DyOleiwh6xOHOx1FUCnL//7Tkn+F2Tknt31tVXGQsZk1+mtyCZSiesvgUBKlS7+t2GCaHiMgXw90Hkn5CRe7ZB0u4raQPfxTDBkOdmwNXuKQE6MlyaRui38yg1NQG9IMBEdgYxLzLM2ZnxcGeZP9oNDWXDjpHpnHBPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDr0xrEgeEMieZpD7AE89s8wHRx3himgYI7UM5k53uw=;
 b=DyTQr2vBjMRlKhwzuHfKf8fkFcqQf8zhhb+2fKqChYkUJHFlqtpAOiai9nxlofUDw4ozaANmo0Tp5Qt8XiWbeG8VrGQBKcvnIWyfPo78GcBCmkplZ7HA49OhHeur4CQhyIoD5njpC7r+zR00LTp7pmC+FPVQzo2ouOt1FnJQ3KM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 22 Jan 2026 13:12:24 +0100
Message-ID: <DFV3X4D42O0U.Z901YT156HF8@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 1/2] xen: Allow lib-y targets to also be .init.o
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20260121154757.44350-1-alejandro.garciavallejo@amd.com>
 <20260121154757.44350-2-alejandro.garciavallejo@amd.com>
 <526ef477-0730-4e22-a82f-4c598ad78e0a@suse.com>
 <b7475771-3ae3-426e-9255-d886ec0b2ba9@suse.com>
 <DFV2FIFSCOPM.3O550OQ2G1KB8@amd.com>
 <7304f5e0-f55c-45c5-ae4c-3d3adc53a0b3@suse.com>
In-Reply-To: <7304f5e0-f55c-45c5-ae4c-3d3adc53a0b3@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|DM4PR12MB8569:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fac3d5a-4f3f-46a6-51a5-08de59af826b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VFgrQ3JZbTZNd3JmWm1hLzgxWnFla3laS0d4eThZLzlpdG5nVjN5Vm96RXl1?=
 =?utf-8?B?SldNU3VtaUFMbjMxaldGeERLcVlNZWQ4TklGU2xoT3BiQkJuWjRiR1VFUDEx?=
 =?utf-8?B?SW13VEZ2R2JNekJVeDRoOExrbTJTY3JUNklsNlA1Y0dWcTc0UWYxckQxaE9q?=
 =?utf-8?B?VS9oQUYvUFhWcXNEWm9qSlhRK0FvRjN0OUhnQmV6aFRrd0RpZk1teTg1OTlE?=
 =?utf-8?B?ZUFRU3RiQm5KUy8wMCt1TGExL0hjRlk0QTF4TEs4NWxibXovajZYSVVSWnUy?=
 =?utf-8?B?OElzZmZNdVgwKzVxZS9Sb2lscXB4ZjEwYm82YlZmVEdHdFBwTk02Z2ZPQy9F?=
 =?utf-8?B?czZvaURPVDl5ZlV0STQrNnBVTjM5ZUhvWWp0bUtwQk5OMkJKTWN0ZU5kdjVD?=
 =?utf-8?B?ak5CcGhhQWVhM0xHQWJOTWZuUnVrenBtUTVJSnV0MnZzVWdzNmwyRDhOb3F2?=
 =?utf-8?B?YXgyQWJLdEptQU5ZUWJrUGdLWlJpRll6akd6djMyWmlUaTNoTC9ZN2tLV1FH?=
 =?utf-8?B?bTQrWGhrM003Ykx5TEZKM3lFb3JrNFg4MXBndEovdFZvNUN3RVBEclJDT0JT?=
 =?utf-8?B?SVU0Z2oySStVazA3SUtSOUFHT1lTQklQL3IycXVxdEpjeGpZTEJDU1dDcWxu?=
 =?utf-8?B?SXJZU0g4TjlNZUpFUVNzOWozWm9mTTZlaWJWU2hUQkllSEZ1NlZwbnpsdnpw?=
 =?utf-8?B?aXp4MWJ6MzRGTUQ0QXc0NFZrZVZGS3BQc3l2ejFJWGdPM0Zjd0hkVERaaDdU?=
 =?utf-8?B?ak9sQ2FsV2p4WVkrZWNiWHRtL0ZwUE5GdGRpWSthb1ZZeEo4YUtWMnIwVDkz?=
 =?utf-8?B?V0d0TEVIYktmMUxONVJwZmRHOE9MeDJqcWFJV29HckY4c2Y0QUc1VmlLMTB2?=
 =?utf-8?B?ZUM3YXY0aTBRd2J6VkUxTW9vaUlBOXlnOElnRFhMTksxMFhhVmdWYmRZWWt4?=
 =?utf-8?B?TnBYZWlmVlJGWFNvZHI3QUVROTBtRkN3ak1yRStCemUrOXd2VXdISUsydWxv?=
 =?utf-8?B?cmRuSmRFN3k3MXF3ZW03eEI0d0VqQS9aMGdVWE5sRTRhTm9UenZzOVZPdFFP?=
 =?utf-8?B?NEJVL3BjMS82Tk42NGVOTlpGVUxnbWdQWktMeGhCZXVRc2w4dm5qK1pzR0F5?=
 =?utf-8?B?d0RIanhqSjdTbWtQTDkzRjN0TjFvSzJEWUg4ZVNFUjZ2Ukx3emM4NTlwK25D?=
 =?utf-8?B?Z0l6QmxDd0FiQ1EzQTdmN3pxQUtqMWphejE1c3pnR21CU3VRa29aUUVFeDZH?=
 =?utf-8?B?aGE4UElhZ3UwVHZIaXFtTjJ0b3VnVVR3c1U4SUtVQjFQMWVObXNOSU43Ny9Q?=
 =?utf-8?B?eDNQRE9jM1g4TXdkRi9veEZWTGJ6SFFUQmxlbjd3VTF1WVlmNGw3NG5kd1g4?=
 =?utf-8?B?Q0wxK0d5VFAxdEs2R2RCOERLcjZwSER0RklOVitJNDQwL3duQkQwNHVKWTFm?=
 =?utf-8?B?UVBqRDJtdW8xcGtEME9POTNkU3NOdm1YMnU4WUpoUWZlNjk0V1ZmTEVJVHFB?=
 =?utf-8?B?RExLZGZ2cDdVM044RXVrck45UU5zOUxZSzExZ2xCUFgwQm45Wi8vaG1qRXgw?=
 =?utf-8?B?VzdtRjFRTyt5d0pybTVCY25HcTRBQUk2SHh3UHBDN3hHZTVqRFFLSG1kVmhH?=
 =?utf-8?B?ZlpZYVh5UWRLSGltdCtkTFczVUpiUXBZUnRiZElKakh3aE85WHVha1ZXNnlF?=
 =?utf-8?B?a0NPZXdNSUhrb252SGg5S0I2NW9YVDd2eUVyamFueEFkMUJqMDMwL0ZqZnhn?=
 =?utf-8?B?YkJwditqSmRYblZXMm9OcWhUUkU5QTMwaHg0d2UvR2NZL3dIYS9FeGtWZFl4?=
 =?utf-8?B?Rk9NdTloeWJ3dDZ2RWFUZHF1T0pwc2tORHZ3TEhCOC8xZTZGM2t3OG9uTUpU?=
 =?utf-8?B?SE9OSmxpbC9qNHBKWWxWeUw2WkoxQm5sekcwUXlVSGxkUDJwSDhrcEtmWktv?=
 =?utf-8?B?eGtGcFJSNkc2K2pCLzBMWDdhMlZEK1VKMkdZS25vU0F1cnptWUlkVmozWENj?=
 =?utf-8?B?N29KUUFaMjNuUm9FVWZnQ3JaWVJwcGpZSzQxQUlVWStkV09STVVsZi91SnBa?=
 =?utf-8?B?SGZmaDdXWllMNTVzUlc3UGNYUFh4UVc3ZmVuaGIwUXNwREVCUksvOU5nbTRa?=
 =?utf-8?B?ZkFnalZpdFlxU3RUYTRaZUZNSjZDK0p2aitWM2taR1NlRStxOFBEN1ExTWds?=
 =?utf-8?B?cnovUkxHd0R2NEpSdER5QmZDTHY5c3VvcmdzTDZnT0l6cEo5aWprbGNWMWtO?=
 =?utf-8?B?T0tGNi8zSUttZDRWT3lMYjhKSlZnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 12:12:27.4968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fac3d5a-4f3f-46a6-51a5-08de59af826b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8569
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,suse.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 45B1D66769
X-Rspamd-Action: no action

On Thu Jan 22, 2026 at 12:04 PM CET, Jan Beulich wrote:
> On 22.01.2026 12:02, Alejandro Vallejo wrote:
>> On Thu Jan 22, 2026 at 11:01 AM CET, Jan Beulich wrote:
>>> On 22.01.2026 10:49, Jan Beulich wrote:
>>>> On 21.01.2026 16:47, Alejandro Vallejo wrote:
>>>>> There's some assumptions as to which targets may be init-only. But
>>>>> there's little reason to preclude libraries from being init-only.
>>>>>
>>>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> I can't tell (yet) what it is, but as per CI something's clearly wrong=
 with this
>>>> change. Both xilinx-smoke-dom0less-arm64-* and qemu-smoke-dom0*-debug*=
 fail with
>>>> it in place. qemu-smoke-dom0-arm64-gcc (no "debug") was fine, suggesti=
ng it may
>>>> be an early assertion triggering.
>>>
>>> Or an early UBSAN failure. I think ...
>>>
>>>>> --- a/xen/Rules.mk
>>>>> +++ b/xen/Rules.mk
>>>>> @@ -130,9 +130,9 @@ endif
>>>>> =20
>>>>>  targets +=3D $(targets-for-builtin)
>>>>> =20
>>>>> -$(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS-y +=3D -=
DINIT_SECTIONS_ONLY
>>>>> +$(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y) $(lib-y)): CFLAGS=
-y +=3D -DINIT_SECTIONS_ONLY
>>>>> =20
>>>>> -non-init-objects =3D $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(=
extra-y))
>>>>> +non-init-objects =3D $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(=
extra-y) $(lib-y))
>>>
>>> ... this is the problem: You're _adding_ library files here which weren=
't there
>>> before. Why $(lib-y) isn't here I don't really known, but as per the CI=
 results
>>> there must be a reason for this.
>>=20
>> Apologies for the unintended breakage. I should've checked the baseline =
for
>> arm before ruling out this patch being the cause (it did fire in my pipe=
line,
>> but didn't consider how this could affect arm and attributed it to a spu=
rious
>> failure).
>>=20
>> So we're neither doing UBSAN nor collecting coverage data from libs? Gre=
at. One
>> more task to the pile, I guess. Seeing how...
>>=20
>>  $(non-init-objects): _c_flags +=3D $(cov-cflags-y)
>>  [snip]
>>  $(non-init-objects): _c_flags +=3D $(UBSAN_FLAGS)
>>=20
>> I'll try to clean this mess. :/
>
> In the meantime, should I give your patch another try with that one chang=
e dropped?
>
> Jan

Sure, thanks.

Cheers,
Alejandro

