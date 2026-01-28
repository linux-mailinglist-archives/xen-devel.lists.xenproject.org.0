Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YN/9JlrSeWlCzwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 10:09:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EAC9EA63
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 10:09:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215286.1525493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl1YG-00087G-Na; Wed, 28 Jan 2026 09:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215286.1525493; Wed, 28 Jan 2026 09:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl1YG-00085L-Kv; Wed, 28 Jan 2026 09:09:28 +0000
Received: by outflank-mailman (input) for mailman id 1215286;
 Wed, 28 Jan 2026 09:09:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pnMD=AB=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vl1YF-00085F-04
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 09:09:27 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09f11b19-fc29-11f0-b160-2bf370ae4941;
 Wed, 28 Jan 2026 10:09:25 +0100 (CET)
Received: from MN0P223CA0018.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::35)
 by MN0PR12MB6222.namprd12.prod.outlook.com (2603:10b6:208:3c2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 28 Jan
 2026 09:09:19 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:208:52b:cafe::6d) by MN0P223CA0018.outlook.office365.com
 (2603:10b6:208:52b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Wed,
 28 Jan 2026 09:09:18 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Wed, 28 Jan 2026 09:09:19 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 28 Jan
 2026 03:09:19 -0600
Received: from localhost (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 28 Jan
 2026 01:09:18 -0800
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
X-Inumbo-ID: 09f11b19-fc29-11f0-b160-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RjRHs47FsBBgXnGGC6FEzOMHBdG8PZEAIpEyEytQuMBbbTbDluhF5Ox2qbHo72oHIqtZtPnX9gP82/tuRgigwz5KUjII0bsdOuovLiNu5EIpgpbUU39/i5W1ESD4ODlj7fSI8n/mQI74eVm4Y9+KBD7CWh87vDsb6GhPq48RZcRHcDL8R+duH8+mIl1UkRxhQHzFbDQgIFMsxUXiBLh494slvL+XWdlaPxtFRPxL8DqzD27Imz8tloG+claLffP8ZL0Od3rBllHgvNObjfiTw0Db2SRZYfl47FYoAcILiBmW+UVmcWbTP4DwVASrsjigFI1ZDfghSWMqnx+I9eS01g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+nHptbgsDRWgez9degAsVCHy3Mam68+SQX5W1RzfTO0=;
 b=U7WWWc5Pghftsjo6kctjwFpGbGlhJm317nKRvfnHHJKwL0hlXWRLbVWVXZuiekYQEr7AKxixOTrB9bMUWwZBhcDCvJY/B7+o5FvOnirKMMGejhcoUolyBVINb/xTdStgnRnWvFGF8xTGqJ2KZXTvnBbZZLDk+pud6l+JntBPxBjxrGeet9/Q30Rqoxuk2fwPXkCNNPRPQ/t6kegSCjOlXchenYw5FWl7WL1HXB21+kIh5m+zPF7ibx1Jko8h08PE71EVZ1oDX/HA5l96YvVa3pZAlxKw1Iwpz6S7II06Sku67Sl3ojZl/CtEY7Zj2c5IIUDb+IdooiCRv4Dcir4GsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+nHptbgsDRWgez9degAsVCHy3Mam68+SQX5W1RzfTO0=;
 b=R2XVCbsVraxD3DjO8Z5iavs7LX4+7yVSekjfLWkDHcuicnbEeBk/NTi6H+EoRqjXnBa147XE8SD3bpEXEVFMD70rjtCqXQsQ0WhzLgSftf9zwOsA5kpX1A2v6qegoc/U2wwWNym6AE0z5KjMJrnGvtQOYG/e+ZgPBx+7kX6V2lo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 28 Jan 2026 10:09:16 +0100
Message-ID: <DG03S6HP7OIO.18ACUNFC24X1Y@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] CODING_STYLE: Establish a policy with regards to
 copyright notices
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20260127182403.141459-1-alejandro.garciavallejo@amd.com>
 <b42af5a5-6237-47d2-9b74-0154ef8c2020@suse.com>
In-Reply-To: <b42af5a5-6237-47d2-9b74-0154ef8c2020@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|MN0PR12MB6222:EE_
X-MS-Office365-Filtering-Correlation-Id: c9506f9a-35a4-488b-4a56-08de5e4cebc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cDRNOVhSNTBVRHZoekZXbTIvRnVVancwRDdOMkRhbzBRNktvUjBmZWpHeXdh?=
 =?utf-8?B?YjAyK0Z0VTlnKzFZWEpZaGZVRWV6aWVCYWZxNkZzdDFXNERDR2FmbFVvRlRW?=
 =?utf-8?B?VVNKYmx5Uy9OaDRCK3d5d3VXcnRFZkV0Rjg0Qjg1WG1RQm1xRHFZa25PMVlm?=
 =?utf-8?B?bFpTQXV2R2ExOFFLR2hHOEg3cUN3ZXVzMjIzN1I2RDI4VUhGVC9va0dQSjg0?=
 =?utf-8?B?dkovNmpxdnFVYVFkOWowbDRTK0M1c2NPNHRTczNNSU9ya0VoRlNDTXdSTThT?=
 =?utf-8?B?b0NyWVVlVm1IRzZnMzFMQkFBY1JGZ2ZFTHB4akdtWC96YXV4T3drV0VxUStZ?=
 =?utf-8?B?ejJnN2NENVNQczdqdlp6ZkdrSTZqb2IwSnFPeWlwU0JMb2ZqUmlVcEZTWlBP?=
 =?utf-8?B?TjM2UkdmalE0cVZoUnRGWUQ1dW40SXdOZldzaGp5WnJjNFRiVzcwNlh0cTAr?=
 =?utf-8?B?WUVOdjNVSzFETStnaGQwYUx3c3ArZUVrdVhwa3JncTBCZC9TV2FoN2FQc3h4?=
 =?utf-8?B?R0tiRzZBV1hSUmtPTGlFK0svcHhucFErR1hra3ZuRUcyb1ludUVwbTM2Wk82?=
 =?utf-8?B?azdQN0tISk1ka3kvQUdDWG1WbTB0VWwzak85R2dsLzI4V1hrTHRzYWR0a3NK?=
 =?utf-8?B?VU9DZUIzSlVienVOTmtFd1FTQ2NoemRIeHlsZVNYUEJHWS95Vll3d0dmM3Qv?=
 =?utf-8?B?dDNiWlFDWU1jdUQrK3Y4RTl1TnlvUW5ieWNQL3c3UFhHcFpsUWIwZVR4bW54?=
 =?utf-8?B?NFRhUE15c0J4NWZScytEajN5NUdYSjIvUzIxYk1CSFFYMG5RR3loV01MTG91?=
 =?utf-8?B?cG5Za3pHR0tQcEdKeVhiQW9HL1FtSnNjWFdLNjcrSEZWQXhoblJSWUlGdHlK?=
 =?utf-8?B?N2JtblFuQ3p1bEF1eHpuaElXRTNHeG5PbE5ydGlJU2JlUFhRN1EyTjgveXUr?=
 =?utf-8?B?dU42UktBdkNkc0cwb0hOVFVaUlpjYnBaRlV1SWF0aGQ1Yk5pOFBsM1VOcWJG?=
 =?utf-8?B?U2JuQlVtTnpDUkNHaXhabm15TWUrb1l5Uk50ek9tZk9hOVp1UlFaMVIxaHBy?=
 =?utf-8?B?UlRYeko5dTBCZVNHVE1Kbzh2MzF1WXgyUXE1a3pickJxV1NHenU4TmFkb3Bm?=
 =?utf-8?B?SUF4Q0I2SUs5SUNSLytzVTEwSnY2bUEyelFXMU1lSDJ2RnpEYVVUVU0rOUx4?=
 =?utf-8?B?OHFPYkR1QU5ON1V6dUY2NjJnWmo5M0RjaE5zdE1ydGJPS0xSdmZoN3VFMmww?=
 =?utf-8?B?NGw5RnIxbUY3R0ZuWmlQOHBMcHV6SWJJNlFXSHAyc3RGMmFadmxNSFpzRlY1?=
 =?utf-8?B?RmFSdWFMMzNUVVk2dUlIMmJRZm00bTRrRmZPZnU5Y2h6UzhzVCtzRzhuQnB6?=
 =?utf-8?B?bS9WSVFQRUxrQVNDUmF2WkROQm80eWc2R0Iyc3k4SXZpdFhqWTZrZ3RNQ3VM?=
 =?utf-8?B?SytsTDIvN0pqLytuemNtMHk3WWN6TlBqOFY4dUg5bkJNejNFanBVbmF1cTda?=
 =?utf-8?B?WlBRTnNCbWsvem5pSTh6T1lJZDNLRUFCWHJUaDR6K1YwdGp5ckpYakgxbTJK?=
 =?utf-8?B?SzVJNi9kL2JxODBCR3I2Wk4zMzBvTnkrZFVmWmdkY2h0cCtabXVDeHludW1F?=
 =?utf-8?B?bDBNbEZnWGp3ZklXNTNDSmYzNXdvb2hWVGpUUFV1RitWa0NIZ2x6K0Jja3Fa?=
 =?utf-8?B?a2lwcUVCN1BoWE0rUWd0Mzg4SmhRcVplTEtucmpjTHQwbHFXamFHZ05UdHhH?=
 =?utf-8?B?M1BDRWgvUEs1VjZRV2RRUUlzQVFYQkJROHBYVnFMa2NRNGwyYTNGMXZSR1Er?=
 =?utf-8?B?Y1ZGOUpJV0xNNC9JV3Ntdnp3bGgvTTZDcDZYS29pSmM5b05MWWlqb0FoL01F?=
 =?utf-8?B?WlJQTlhwYW9sK1lmMFNqY0xlRDFGWnlMNWFRT3BTNmpCVlBOWUs0WnpPK3RI?=
 =?utf-8?B?dkt2Y25WK1YwQklQR0JzUml0N3FobDdaV1VDb1BNS2FTeGJWd1E3c3ZxNmFt?=
 =?utf-8?B?SFRmQVQvUXovOXZNdEVZSFQvcEFmM2xHUGVQVWF4dStaVTVRbUR2bHZwOTMz?=
 =?utf-8?B?NXFDMmYwYW5Pa2xtc3dmUU1GSGo5bUZzaG5mQUN3djNpU01ack0xdEd3cUxl?=
 =?utf-8?B?VDcyU2hUVWRsblZqTHRwbFlVME0yNWNHQ0hjTkdUYWNHbGloWitMUnkrSzI0?=
 =?utf-8?B?WXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 09:09:19.9183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9506f9a-35a4-488b-4a56-08de5e4cebc9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6222
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: E6EAC9EA63
X-Rspamd-Action: no action

On Wed Jan 28, 2026 at 8:04 AM CET, Jan Beulich wrote:
> On 27.01.2026 19:24, Alejandro Vallejo wrote:
>> This patch modifies CODING_STYLE to severely discourage use of copyright
>> notices when their presence is not legally mandatory.
>>=20
>> Copyright notices are redundant on commit, misleading from the time the =
file
>> receives contributions from anyone not represented by such notice, and a=
ctively
>> harmful for attribution by the time the original code is long gone. They=
 are
>> plain wrong when added on code motion.... the list goes on.
>>=20
>> All attribution worth keeping is version-controlled through Signed-off-b=
y,
>> Co-authored and the like, DCO and the cumulative contents of git history=
.
>> License banners have already been superseded by the contents of licenses=
/ and
>> SPDX tags.
>>=20
>> Other FOSS projects have already moved away from explicit copyright noti=
ces
>> where possible, and severely discourage their use when not.
>>=20
>> Apache and LLVM take active issue with copyrighted contributions and Chr=
omium
>> takes issues with copyrighted contributions not attributed to the projec=
t. Some
>> Linux subsystem maintainers already frown upon copyright notices too, ev=
en if
>> it hasn't reached the point of being a mandated requirement yet.
>>=20
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> ---
>> The actual changes are almost verbatim from the LLVM guideline, but it's=
 not
>> exact. Wording can be adjusted as needed. I care about the core of the p=
roposal.
>> Saying "please, drop the notice" on contributions where it's clearly not=
 a
>> legal requirement, or have the contributor state that it is a legal requ=
irement
>> and why.
>
> This "is a legal requirement" ...
>
>> --- a/CODING_STYLE
>> +++ b/CODING_STYLE
>> @@ -24,6 +24,24 @@ license, e.g.:
>> =20
>>  See LICENSES/ for a list of licenses and SPDX tags currently used.
>> =20
>> +Copyright notices
>> +-----------------
>> +
>> +Copyright for the code in the Xen Project is held by the respective
>> +contributors. Because you (or your company) retain ownership of the cod=
e you
>> +contribute, you know it may only be used under the terms of the open so=
urce
>> +license you contributed it under: the license for your contributions ca=
nnot be
>> +changed in the future without your approval.
>> +
>> +The Xen Project does not accept contributions that include in-source co=
pyright
>> +notices except in the following cases:
>> +  * where a committed file already contains it.
>> +  * where a committed file is renamed.
>> +  * where such notices are on files from an external project being impo=
rted.
>
> ... may want (need?) reflecting as another bullet point here.

Hmmm. Yes, that would make sense.

>
> The wording of the first bullet point also can be taken to mean that addi=
ng to
> such pre-existing notices is acceptable. This may not be the intention?

Good point. That was very definitely not my intention.

The refinement also applies to the second bullet point, so I can add it as =
a
separate paragraph stating existing notices are to never be modified and on=
ly
removed with the express consent of the current holder(s).

------------------

Do you have a take for/against moving all existing notices to a separate NO=
TICES
file (a-la Apache). The existing file for them (in httpd) looks like this, =
so
they took the liberty to rewording the banners to be more digestible in sin=
gle
file inclusion.

	Apache HTTP Server
	Copyright 2026 The Apache Software Foundation.

	This product includes software developed at
	The Apache Software Foundation (https://www.apache.org/).

	Portions of this software were developed at the National Center
	for Supercomputing Applications (NCSA) at the University of
	Illinois at Urbana-Champaign.

	This software contains code derived from the RSA Data Security
	Inc. MD5 Message-Digest Algorithm, including various
	modifications by Spyglass Inc., Carnegie Mellon University, and
	Bell Communications Research, Inc (Bellcore).

	This software contains code derived from the PCRE library pcreposix.c
	source code, written by Philip Hazel, Copyright 1997-2004
	by the University of Cambridge, England.

It'd blur the scope of existing holders, but code moves and so do their
contributions. Keeping a banner on a file after a refactor is just
misattribution.

------------------

In short. There's 1 question in 2 forms I'd like to have an answer to from =
a
core maintainers.

Would you be willing to ack a change along these lines?
  1. to a Copyright Notice policy within CODING_STYLE.
  2. to the relegation of existing notices to a NOTICES file in the style o=
f
     Apache. Apache in particular mandates the file not be touched unless
     absolutely required for legal reasons.

(1) can be done without (2) if (2) proves to be "risky" in whatever legal w=
ay
it could possibly be risky.

Cheers,
Alejandro

