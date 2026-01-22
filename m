Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gA7MCR5jcmnfjQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:49:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9D56BA8E
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:49:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211766.1523248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viyns-0003YT-TJ; Thu, 22 Jan 2026 17:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211766.1523248; Thu, 22 Jan 2026 17:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viyns-0003WF-QQ; Thu, 22 Jan 2026 17:49:08 +0000
Received: by outflank-mailman (input) for mailman id 1211766;
 Thu, 22 Jan 2026 17:49:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I1tn=73=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1viynq-0003W4-TI
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 17:49:06 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3d07167-f7ba-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 18:49:04 +0100 (CET)
Received: from CH2PR14CA0004.namprd14.prod.outlook.com (2603:10b6:610:60::14)
 by DS4PR12MB999075.namprd12.prod.outlook.com (2603:10b6:8:2fc::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 17:48:58 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::27) by CH2PR14CA0004.outlook.office365.com
 (2603:10b6:610:60::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Thu,
 22 Jan 2026 17:48:44 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 17:48:57 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 22 Jan
 2026 11:48:55 -0600
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
X-Inumbo-ID: a3d07167-f7ba-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZuvQEgkPBmk2Ss897ar70x6C3/mHK+JsebCp93wHR5GHSEIUMC5PvCqsKYrLnmwaNRlFJcdA4ocUJ/wNaalEAwEpq/moVBBGXq/Tm6YfGAynArgXhw7qMeryR1ME9sX1PZdcO0P8/rq0EmZTBYk/aGNoj4B600Wd5YCDOaOJyQR2rL8fbEg3d0wS3gf9gCehev8mmFOXHoEQpgiqLF9fBPpFhzZQiqJcHUis9NtOOEyZscZqllgSciBIPEgIxbfivGIHUF0TAIHhpIxfOIw+kYsT2EYL/eKGnIrqLqksT6lRXgxvp9g9feiIAgZ4JuOJLUDaieLE41+CBpqBz2s/SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRil9PbVBhOa83C92+M8SdCtBsJOkobYTmtGebdb9L0=;
 b=xVqur7GbdguKoubEk+Hz6XAcdCBinOIte3mkpFDPOMnH956L+4Yv2XuAqfuIrAWzhinZn5KjQ0frAKBf2HpAXCWg4R4S0pE0vVBzmKVYaMnPWVpwOwZ8Of3kmfKh1xkcyY6uB1nWqbet+UNmc70uOkmGu4hkykiWV+SwylcdGJSwrIU9+QpHe0Sr9q1ZboIW7OEj9OpVqGMxue1llqy3UziS0RmvNrgQto4iFTM243WpQhdgHVCoKxcaJ4wj0FRoe/GXJ9QG/pFkUnUGUA1BsINDeyo4qSpvYH4Z9yeaEK2jwXoSl12LQ5ZP2hWeMfM0GZXU/pRkX/qo2C192NPj4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bugseng.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRil9PbVBhOa83C92+M8SdCtBsJOkobYTmtGebdb9L0=;
 b=W/BL9rXV1fVjUpZlzLimUg6eVSlPUByN5mi62UF6zf0tQv7fxKs/BtSHQD+R+MNV2EkgAkTwyOnjauysEbNnrF5rGGk5Pdg5biJ2ILm5m4H8Jkk7nPO4Qef1ggYgi4/F8qRG5OHq1+SVPqcUTiIGC7926Eq2+Qw6dPmNyTPxNzU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 22 Jan 2026 18:48:53 +0100
Message-ID: <DFVB2R4YCFTG.1WZYL3QRFKYUH@amd.com>
Subject: Re: [PATCH v5 2/2] earlycpio: lib-ify earlycpio.c
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20260121154757.44350-1-alejandro.garciavallejo@amd.com>
 <20260121154757.44350-3-alejandro.garciavallejo@amd.com>
 <5948da25-0b4d-48a5-983f-0fc9424774b3@suse.com>
 <947a4230-4a1e-4178-b7f0-ae5618f4303d@citrix.com>
 <02004b6ee5ddb57f4b834163a955d29b@bugseng.com>
In-Reply-To: <02004b6ee5ddb57f4b834163a955d29b@bugseng.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|DS4PR12MB999075:EE_
X-MS-Office365-Filtering-Correlation-Id: 32d6d7e4-42ef-4a9d-795f-08de59de84ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RTlaUWJvdUhxK01kb2NjMUdRTUJYRHFaL1lKVFpyRWVuVDBUK2EwbTROREU2?=
 =?utf-8?B?RmtoWWJLZ29SdW1KNXEyL2xvb29BaEZJTDdoOHEvYUlkbTVROGpUcUE2RDhx?=
 =?utf-8?B?MEJ3K1lKekZWYWp1WnhKMllkL09oc1NZcnVQNVgvUW5yb0dJcXoxaGdsT2lZ?=
 =?utf-8?B?Q0xhNE94UXQ5b2xjQjUrVjQ2U2k0ajNZVXV6b1c3MnU2dThXbjFBOFhrNUVN?=
 =?utf-8?B?dlBpQTlmdXlmM1p1ajlIai9ST3VFK2o3M0VzcTJZVGl1KzVtZXdLTWJrRzhC?=
 =?utf-8?B?KzRicjR6dzE0cmFLUEZnRHp0bEhvMWdVY2gvUUt2b1pteWg3aEM2bzB0N2pH?=
 =?utf-8?B?RExBT3lTS2hYMFZXVmlkRjl5SjdXMkJyWnpOYTJWVHg5cnJSWEt2WVRWKzAv?=
 =?utf-8?B?ZFdCaDJvVEFIWEJySDBsSGdOcnBlN0lXNjUyU3FiOGwxL0dqMDExeTRaeGN3?=
 =?utf-8?B?TEN4Z0JPYnFqUUJXSXQrT2Y0MmpaOUNzWFBlWTJLOWRJb3J4RndUSkplejJu?=
 =?utf-8?B?elNiSk9hb0RrT0loMm1EYTQrN2JHN0xhZDhYZGJVLy9yVFB1LzlOc3hPMjZN?=
 =?utf-8?B?UjRIYklTTGFoSUVnK1hNTHBSZjRTZVluZGhCT0MyQmYzMkpncnJqM08ydTZs?=
 =?utf-8?B?Q1BoTDhueTJjdmJyc0dQQmR5c1VzcVFhY0hOVER3cnA5N3NoUmhMOHBTc3A5?=
 =?utf-8?B?ZGQ1OVZvdVkybnUzWW45YzJpNEcvcDB0VzNUdkZpK25jcy9sSzl5enRNb2Jw?=
 =?utf-8?B?NWY5NVZKNU5nSUQ0TWlmek9TT3NieTQrNy9SVXJyRGRaOG9GeHhlM25iQmtq?=
 =?utf-8?B?K1ZpMUkrbytzQ2NwZENaa3dDNWp1RmdLWGljQmRuNWVLMi9QSUdVdGN2Y2JM?=
 =?utf-8?B?N1psQXJzaFZVbHVWU0xBU1dKcW54L2xJK3BmMlpwZngyR3laVWNUQkNOaGVB?=
 =?utf-8?B?dW8weFVVN2ZYNFlzT05vb3FxcEpGaXZBRjZHU2xqZC9hK3FVUkRBeUI1V3pi?=
 =?utf-8?B?L1pGQnpZbm1DN3VFeHNPNFdOTElwN1hWemlFQzdUUlpCblZ4NUJMSnM4WFVh?=
 =?utf-8?B?S2x0UVRPN3hTVUFNRWcxSXY5UGRMeHVRNklQQTA5RXk3TlIwN3pZQWNjQWt2?=
 =?utf-8?B?VHN0WjBBVklWS0xMcTNEVnlFaHVOd2NXYzgvcTNzSThIcnU0Q3czVkEwSFZj?=
 =?utf-8?B?Z0cydUNGUDBQQzV2c3N3Vzh2empjT0VocGJaSjVyZC8vNVNudGtQNUZZQjMw?=
 =?utf-8?B?MVYyNlhYbVZJWTRvNU51czlsSms4bDFFTStZV1FPeVBpVitrak9EdWFjL1U3?=
 =?utf-8?B?NGxwMTZhR21SNHVnUEM1ZURHc0d0ZEUveW0wSnM5b1dRbmZNUTU4dnExYUts?=
 =?utf-8?B?YVYzekY4Y3NDMjk4ZEpPOURBaVdWZjdIeCtOTjhHRG9kZEtvR3MyUkd0Rjhj?=
 =?utf-8?B?cDNVOHc0aEMrY2dIdEV1ZWxYUlN2WHJLRFpRb3BuQUdlU2tvNVA3MWZ1UXNJ?=
 =?utf-8?B?bitjVTliaW5EazVZbEJoZEp4dDl4dk90UXRPUHhHbHh4VnNLcTFVbHl4K1hs?=
 =?utf-8?B?S3pYL1Q5OVBaU3ByNXZKNDI4ZG5VTTdzWGg1S2oyclExYUQyd2NlaTR1TFg2?=
 =?utf-8?B?UEo2b0svR1FCTG5jSmJ1bVBxZ3Vvb0t3cWQ1a3pPZjR5TzRQaHJZcnp3bnYr?=
 =?utf-8?B?VVNqVGxTRDQ1QVpmYTBtR1dUZlZjZ01jQ3RsVFFLQmEvcytCckxSTHdmOVRJ?=
 =?utf-8?B?bWVqOWM5TTJQTGJwcjQ0cWp1cFQ2L0xYcHlUR1dueFNCQnBlc0J2QWpYRHIz?=
 =?utf-8?B?NEVoMEQ1bGtaWENzUnVKMDZSQUNzN3Q0NjZuMzVSR1FrZlJ4R2xYWStEcjRi?=
 =?utf-8?B?Y1RRbTY3ZDRINllRazMraGM3djF4WDZocHNUYURINW9zWkhKbGVpa1ZScEFU?=
 =?utf-8?B?REdxbTJaZTFMRmM1VHV1Ym1mZ0Z2SWtVNDFMM1hHcEphR2VnS2dnSXI4akdS?=
 =?utf-8?B?SXhjbm9WSFI3RzJTNjNUb2tLVFRkZU1Za2VENnRnQ1NoM0NBS2RjeFdyOU4x?=
 =?utf-8?B?NGp5RzRRWUNCbEpIaE9JZEhmYTE4ZE95bGY2VWZCRVQ3NEllc3hMSHMrV3BC?=
 =?utf-8?B?eVFXVzhxOWhXNk8wVVcvcnFzU3BoaGtnWU1TOTJDYWFCeGNxOWE4OTNzUExh?=
 =?utf-8?B?ZFlCV1JFenVyMkdicnVaRWh3Y0gvYTBPQ3U3WnJGL2MreUR2U0pZcjQ4RzJp?=
 =?utf-8?B?RnNKZHZiUGtpeVFKVEJZcnI4THFnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:48:57.6271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d6d7e4-42ef-4a9d-795f-08de59de84ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB999075
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nicola.vetrini@bugseng.com,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:xen-devel-bounces@lists.xenproject.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8C9D56BA8E
X-Rspamd-Action: no action

On Thu Jan 22, 2026 at 3:18 PM CET, Nicola Vetrini wrote:
> On 2026-01-22 13:50, Andrew Cooper wrote:
>> On 22/01/2026 8:27 am, Jan Beulich wrote:
>>> On 21.01.2026 16:47, Alejandro Vallejo wrote:
>>>> --- a/docs/misra/exclude-list.json
>>>> +++ b/docs/misra/exclude-list.json
>>>> @@ -121,10 +121,6 @@
>>>>              "rel_path": "common/bunzip2.c",
>>>>              "comment": "Imported from Linux, ignore for now"
>>>>          },
>>>> -        {
>>>> -            "rel_path": "common/earlycpio.c",
>>>> -            "comment": "Imported from Linux, ignore for now"
>>>> -        },
>>>>          {
>>>>              "rel_path": "common/gzip/*",
>>>>              "comment": "Imported from Linux, ignore for now"
>>> Judging from Andrew's
>>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2277362=
625
>>> this doesn't quite work. As I had expected, since the file is compiled
>>> unconditionally now in its new location, some violations are now also
>>> unconditionally reported. (Some, checked for at linking time only, may=
=20
>>> not
>>> be reported anymore for the *-amd analysis jobs.)
>>=20
>> Yeah, in hindsight this seems obvious, given that we're compiling then
>> discarding.
>>=20
>> There are two options:
>>=20
>> 1. Use an earlier form which adds the new location to the exclude list=
=C2=A0
>> (Still needs to be in this patch for bisectibility.)
>> 2. Fix up the violations first (only 6 in total)
>>=20
>> Two of the violations look easy to fix, two need the deviation for=20
>> octal
>> numbers, but two essentially-char violations look to be hard.=C2=A0 The=
=20
>> logic
>> is doing ASCII manipulation in what I would consider to be the
>> appropriate/canonical way, but Eclair does not like the mixture of ints
>> and character literals.
>>=20
>> I dislike option 1, but as (contrary to my expectations) this is
>> interfering with the *-amd build, I'll tolerate it.
>>=20
>
> I agree that Solution 1 is the easiest to implement. An alternative=20
> could be to fix the regressions for R7.1 and R20.7 (they're trivial)=20
> regardless and add casts to sidestep MISRA for R10.2.

Easy as it is, and while I'd prefer to fix earlycpio.c, I just don't have
time to do it now. The original incarnation of the patch I sent that moved =
the
exclusion would work here.

That patch, followed by the lib move (as it was back then) ought to work fo=
r the
time being. I'm not in a hurry though so I'm happy for the move to wait unt=
il
someone finds the time to fix the errors. Whatever you prefer.

Cheers,
Alejandro

