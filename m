Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8555E9F6446
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 12:05:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860266.1272316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNrqr-00083i-3C; Wed, 18 Dec 2024 11:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860266.1272316; Wed, 18 Dec 2024 11:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNrqr-00081g-0a; Wed, 18 Dec 2024 11:04:25 +0000
Received: by outflank-mailman (input) for mailman id 860266;
 Wed, 18 Dec 2024 11:04:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bs8F=TL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tNrqp-00081a-QB
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 11:04:23 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20614.outbound.protection.outlook.com
 [2a01:111:f403:2418::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6144c79-bd2f-11ef-a0d6-8be0dac302b0;
 Wed, 18 Dec 2024 12:04:22 +0100 (CET)
Received: from SA9P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::7) by
 DS7PR12MB5960.namprd12.prod.outlook.com (2603:10b6:8:7f::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8272.13; Wed, 18 Dec 2024 11:04:17 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:806:25:cafe::48) by SA9P221CA0002.outlook.office365.com
 (2603:10b6:806:25::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Wed,
 18 Dec 2024 11:04:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Wed, 18 Dec 2024 11:04:16 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Dec
 2024 05:04:16 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 18 Dec 2024 05:04:14 -0600
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
X-Inumbo-ID: d6144c79-bd2f-11ef-a0d6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgxgkXDHz27Eb2cY8rrFXLoxjTElOKMZFgWLOj4/h5uHXla+RE4+KT5P0rVWpNb+RXkZnEsWArEtAEHsOhxXu65/7tjGQIwTP+uFrKeLuhtuxQVlMRCMNV7/5jvIgcqxQYYCi7MbcMXrRm3NG/npUGfZZKifFGUskIswWnPyYI2WvtRBjWEeV4o7TIXKe1oMWroL/MmPfsMdP4JdgrKUT+lBNgongav/ie3aB3SEkORBRFH+w6jOMmIbCUklIEHRHkkSjJCYAmoo6LjZHXIyYi55gju/L5N9Jmh8fUZk4Rstpthp2n2gnqvFuNi6Lxq00LNRVfDDag7xXqWNNKMX1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6oyg3UAEEoS6KmfSIKZS/ox7qYB9qUdjW8ynVgWaGw=;
 b=bjtTvmyUnxrslL0ovYAC0L0liGA86qLET3++KgpmCZdVnQ8AXp7ZhDP8L10UFOFW/gp2OrtxRuVCUZW+oS3BWi5tLtZQM8f8JVJLluxT5pK9cwvBIwF/VaBnrXhM30zd71B6E0VWEY7nJxUIR/6+cExUlEMxVJhLZAWQxqyxddc6bKfXm71ByTpW3cRaGRw7djjnlP8X4/yQFQKdvfPI17svu5kJ/9vCn0yPyBi5XhnQvqWz+1ua9xnNHbgQhDBsdbGgsmpx+450nDm8ZtQVNaLVkxnK9ywuWQhlhF3mtqpZYtHhGTsRF4d92Mc/q27QWyG2AiaaO18B77ssICDX1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6oyg3UAEEoS6KmfSIKZS/ox7qYB9qUdjW8ynVgWaGw=;
 b=18IgHWZmvTYTKhlYlDFBYX+FkFKle5TDyom9AFRytHGsdwjpOe7cyCR5IROX0Asz+jxKCRZcJRBzi+g72xxMSu9klwQg2v+FRLKoQlc071AmSuiJnl5t9RII4pcqTZcfM2y1GJ7tibgx2nFm7mqXPbS35uMYH7ZaRS8V+W2h5do=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Content-Type: multipart/mixed;
	boundary="------------TAN6g0S0GHYr0iX8Poz0G0UU"
Message-ID: <2423b111-0a3e-42f8-a11e-02d81fa75eb5@amd.com>
Date: Wed, 18 Dec 2024 12:04:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/kconfig: allow LATE_HWDOM config for ARM
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Julien Grall
	<julien@xen.org>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20241217114719.2870676-1-Sergiy_Kibrik@epam.com>
 <4e437c60-4fee-40ed-9d2a-789bac0b36d9@xen.org>
 <63b21760-7dea-423b-a9d8-64d213c40b2c@apertussolutions.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <63b21760-7dea-423b-a9d8-64d213c40b2c@apertussolutions.com>
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|DS7PR12MB5960:EE_
X-MS-Office365-Filtering-Correlation-Id: 606575ed-327e-4e56-648c-08dd1f53b6fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SWZLRzhtMitnczRXK3AxdWt2VTZ1Q0djTmZHMGZud01ISjRLcVBWOVRhMzF5?=
 =?utf-8?B?cW4vWTlMRzhhWHZvR0VyMmQvZll6ZHpQNzVNU3lwQlVWRFFTWWJSdGdabFMw?=
 =?utf-8?B?TE5FM0xpSGxGT1RVQWpJOW8vdEFhYTIvUXpycmNRL2J1b0plSTNsUXVZWjR6?=
 =?utf-8?B?WFR1QWk4ajNWTU1wTjcraTV5L1hud3MzbmxvaGl4eU1kYUlLT3R2S01KdkJK?=
 =?utf-8?B?Mm9obXJwR29UMU5OeWRLRnRTS1RBQ3UxcVhNdDhNU0JJcDQrTXNQYm5HZDhx?=
 =?utf-8?B?R3FvamltTm5qbDh6TjFqemdvMllTcVNwZ1dLTnk0cnVOTW1sRUF6SmZqR2xr?=
 =?utf-8?B?a0ZPWE1CajQ5dHdXOEpKOFU5Z2g5a1NRWmFLT1RqRGJjV2w4YnRDcFozK3Mx?=
 =?utf-8?B?Y3F0cnR2SDA2UWY0WDJINXVIT3FKQm40bUJGaDlibGNJR0l1UmFSMlRxY050?=
 =?utf-8?B?ZkM3UHdXREZJQ0t4V2I0bDUwVm92eGcwcXhzY003V0ZIdlcxNTZoY3BUck5i?=
 =?utf-8?B?MFNvTzZLcWZIcEw3WERvUDhFeVJCcmZNQzdMZWlnQWt4b1lWZXZUdThtYS9C?=
 =?utf-8?B?UFREaUtjR0JwQ0RSeCtEdHlKcVpVRmVycjR5ekVjQVprZkFKQjFETVQxOHd6?=
 =?utf-8?B?WEUzbHVVaU54eXA0YTczTUY4S3k3a2QvclBhMzYrdXNsemp3dURQVzc3ajJK?=
 =?utf-8?B?ZWVQZGdVaDZYelBsUWQ3TFdqRFU1MFlCczFGZkJrRDg4S292MTFCVlc5TEht?=
 =?utf-8?B?bGlkTFZKZ0VvaG83ZGhxUUNWUS91NmNqVzdLNlZCNk9WT1RvNVdISklCQ01l?=
 =?utf-8?B?bXRvLzhWTGNiVS9lT2RiblkyeG9wdWNvREtKWFppblN0WGxvN0Z6cXRhQ1hV?=
 =?utf-8?B?dTl2RDNiRlJZd2haNE5JVnB3NXo4dGo2YUdhTy9qRmpQejd1QWpVdk9vWDlI?=
 =?utf-8?B?Ynk2dmUzaUVuWUQ3UkxNM08vckUxdUFvZWdVbGR0NWNSRHVvMXlaekk3QytO?=
 =?utf-8?B?QS9EUHNwV3pxM20xZEtIZ0ovclhBd0J3ZDlMZDlzZEhQYkwvcWpTRjUyQnUw?=
 =?utf-8?B?Z0lqd2RCVjhrUzVuL2JoQ1ZKYTY5QnMrZWF6dXJ4dVNxNUNPRTcwRGVRNzFx?=
 =?utf-8?B?NVl2YUIzUTZycVM1YkhPYUYzU2lSTG9HeWhCejlveUJhd3Iva3lHT3VFRDkw?=
 =?utf-8?B?YTZrRFN1ZmlHNDU5RDlaajFja0h0QnRXcGN1Tzh2L1FTcHo3dFdpbTVaWTh1?=
 =?utf-8?B?TFBkT08wUXhXdUk0SXdURE1Zd0FqS09WZFRXaVVYWWk4cFM4bUtkdnoweU5w?=
 =?utf-8?B?aVMrV0FwM2ZKQ2hOYWo0Z0xDdFhQOXdhNGhnYk9tOFAyNFBhTmd4dUZlMk01?=
 =?utf-8?B?VlVsSElBVHJsMjhiN0hncG1tODdtcjBuQmRIR0ZjSm1lNTlOUTQ0NElxMGRJ?=
 =?utf-8?B?ekQ5WGRSU2d3L2J3ZHRJWmVPbzNmVHZ2Zk5wSE1KV1U0UzQzNDl4ZWVQRDFB?=
 =?utf-8?B?UEpCV3FYeDNHODBhYytVMU9FRG11Nm1PQUxBQm5qSnB1MDBBRkc3QmVRSUdx?=
 =?utf-8?B?NmdWOUdtOWUrSGZPTFZBVjJrS3dUcXNibS9IWmNPbXhDQkZ3TCtJQ2YyeWYy?=
 =?utf-8?B?SUFjNGs0NTBDS2R5WEt2VVNzUGJYK205amtTem5RMThXSGhWT1BqSjRWaEFw?=
 =?utf-8?B?a1BaRXRaanM1djI2N3ZuMFY2TmptbnkveDVJREt4VnB3QWFpWW5hUHpSUk9W?=
 =?utf-8?B?UFQxUnBab1FDQWtZRldTeE1Ed2J0aDZsWjliL2NXSHl3VDNZLy9pQ3l6MHVz?=
 =?utf-8?B?bW9TTCtZNno0UEdYc0x5V2dTSkdKRENOZmt0Z0prVzE4VGNFMVVqUk13UmlM?=
 =?utf-8?B?UmpBK1cvS1IrUVM5eUs4Q2d2YVJqL2NJVjNGSlVpeGFoWS9kSWRjUGtoU1dO?=
 =?utf-8?B?c0NqVWJYTzdkQWFGZTVXU0ZKeVAxei96WHV5TzNhS1ZmNXlDcWgyQ1JLNE5X?=
 =?utf-8?Q?bI0LW9aLsq8ow9sekQxB1oUineUOFI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 11:04:16.8372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 606575ed-327e-4e56-648c-08dd1f53b6fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5960

--------------TAN6g0S0GHYr0iX8Poz0G0UU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 18/12/2024 02:17, Daniel P. Smith wrote:
> 
> 
>> On 17/12/2024 11:47, Sergiy Kibrik wrote:
>>> Allow to build ARM configuration with support for initializing
>>> hardware domain.
>>> On ARM it is only possible to start hardware domain in multiboot mode, so
>>> dom0less support is required. This is reflected by dependency on
>>> DOM0LESS_BOOT
>>> instead of directly depending on ARM config option.
> 
> 
> Just to make sure my assumption is correct, you are looking to do a
> multi-domain construction at boot time, with at least two domains. One
> of those two domains is the "control domain" and one is the "hardware
> domain", aka late hwdom except it's not constructed "late".
> 
> If you want such a configuration, I would highly recommend you first
> enable setting flask labels via dom0less (assuming it is not there)
Speaking about dom0less and FLASK. A year ago, I did sent you (privately, through
AMD hyperlaunch collab) my attempt to add minimal steps to enable setting FLASK policy
for dom0less domUs. You then told me that you have a slightly different vision on how it
should be done. Any update with that regard? TBH I though that you're going to add this
support together with other hyperlaunch patches.

For others reference, I attach my patch created back then allowing to specify FLASK labels
for boot-time domUs, which I used to assign different FLASK roles for them.

~Michal

--------------TAN6g0S0GHYr0iX8Poz0G0UU
Content-Type: text/plain; charset="UTF-8";
	name="dom0less-flask-support.patch"
Content-Disposition: attachment; filename="dom0less-flask-support.patch"
Content-Transfer-Encoding: base64

RnJvbSBmYWU3NWU5NDA2NDFkMTI0OGQyY2ZmZGU5ZWQ1NjhmMTIxYTc1NWY1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQ0KRnJvbTogTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1k
LmNvbT4NCkRhdGU6IFR1ZSwgMTIgTWFyIDIwMjQgMTM6MDM6NDIgKzAxMDANClN1YmplY3Q6
IFtQQVRDSF0geGVuOiBBZGQgc3VwcG9ydCBmb3Igc3BlY2lmeWluZyBYU00gRkxBU0sgbGFi
ZWwgZm9yIGRvbTBsZXNzDQogZG9tVXMNCg0KQXQgdGhlIG1vbWVudCwgaXQgaXMgbm90IHBv
c3NpYmxlIHRvIGNyZWF0ZSBkb20wbGVzcyBkb21VcyB3aXRoIFhTTSBGTEFTSw0KcG9saWN5
IChlbmZvcmNpbmcpLiBUaGlzIGlzIGJlY2F1c2UgdGhleSBhcmUgbm90IGJlaW5nIGFzc2ln
bmVkIGFueQ0KdXNhYmxlIGRlZmF1bHQgbGFiZWwgKG5laXRoZXIgaW4gZmxhc2tfZG9tYWlu
X2FsbG9jX3NlY3VyaXR5KCkgbm9yIGJ5DQpzZXR0aW5nIGluaXRpYWwgc3NpZHJlZiBpbiBk
b21haW4gY3JlYXRpb24gZmxhZ3MpIGFuZCBhcyBzdWNoLCB0aGV5IGFyZQ0Kb2YgdHlwZSB1
bmxhYmVsZWRfdC4NCg0KSW50cm9kdWNlIGEgbmV3IFhTTSBvcCBjYWxsZWQgc2VjbGFiZWxf
dG9fc2lkIHRvZ2V0aGVyIHdpdGggaG9va3MNCnhzbV9zZWNsYWJlbF90b19zaWQoKSBhbmQg
Zmxhc2tfc2VjbGFiZWxfdG9fc2lkKCkuIEluIHRoZSBsYXR0ZXIgY2FzZSwNCnRoaXMgcmVz
dWx0cyBpbiBjYWxsaW5nIHNlY3VyaXR5X2NvbnRleHRfdG9fc2lkKCkgdGhhdCBjb252ZXJ0
cyBhIHNlY3VyaXR5DQpsYWJlbCBpbnRvIFNJRC4NCg0KQWRkIHN1cHBvcnQgZm9yIHNwZWNp
ZnlpbmcgYSBzZWN1cml0eSBsYWJlbCAoanVzdCBsaWtlIGluIHhsLmNmZykgZm9yDQpkb20w
bGVzcyBkb21VcyBieSBhZGRpbmcgYSBuZXcgZGV2aWNlIHRyZWUgc3RyaW5nIHByb3BlcnR5
ICdzZWNsYWJlbCcuDQoNClNpZ25lZC1vZmYtYnk6IE1pY2hhbCBPcnplbCA8bWljaGFsLm9y
emVsQGFtZC5jb20+DQotLS0NCiBkb2NzL21pc2MvYXJtL2RldmljZS10cmVlL2Jvb3Rpbmcu
dHh0IHwgIDYgKysrKysrDQogeGVuL2FyY2gvYXJtL2RvbTBsZXNzLWJ1aWxkLmMgICAgICAg
ICB8IDEyICsrKysrKysrKysrKw0KIHhlbi9pbmNsdWRlL3hzbS9kdW1teS5oICAgICAgICAg
ICAgICAgfCAgNiArKysrKysNCiB4ZW4vaW5jbHVkZS94c20veHNtLmggICAgICAgICAgICAg
ICAgIHwgIDcgKysrKysrKw0KIHhlbi94c20vZHVtbXkuYyAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMSArDQogeGVuL3hzbS9mbGFzay9ob29rcy5jICAgICAgICAgICAgICAgICB8ICA3
ICsrKysrKysNCiA2IGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKykNCg0KZGlmZiAt
LWdpdCBhL2RvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQgYi9kb2NzL21p
c2MvYXJtL2RldmljZS10cmVlL2Jvb3RpbmcudHh0DQppbmRleCBiYmQ5NTVlOWMyZjYuLjRl
YmEwNTI0YWQ0MSAxMDA2NDQNCi0tLSBhL2RvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9v
dGluZy50eHQNCisrKyBiL2RvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQN
CkBAIC0yNjAsNiArMjYwLDEyIEBAIHdpdGggdGhlIGZvbGxvd2luZyBwcm9wZXJ0aWVzOg0K
ICAgICB2YWx1ZSBzcGVjaWZpZWQgYnkgWGVuIGNvbW1hbmQgbGluZSBwYXJhbWV0ZXIgZ250
dGFiX21heF9tYXB0cmFja19mcmFtZXMNCiAgICAgKG9yIGl0cyBkZWZhdWx0IHZhbHVlIGlm
IHVuc3BlY2lmaWVkLCBpLmUuIDEwMjQpIGlzIHVzZWQuDQogDQorLSBzZWNsYWJlbA0KKw0K
KyAgICBPcHRpb25hbC4gQSBzdHJpbmcgcHJvcGVydHkgc3BlY2lmeWluZyBYU00gRkxBU0sg
c2VjdXJpdHkgbGFiZWwgZm9yDQorICAgIHRoZSBkb21haW4gaW4gZm9ybWF0IHVzZXI6cm9s
ZTp0eXBlIChlLmcuIHN5c3RlbV91OnN5c3RlbV9yOmRvbVVfdCkuDQorICAgIElmIHRoaXMg
cHJvcGVydHkgaXMgbWlzc2luZywgdGhlIGRvbWFpbiB3aWxsIGJlIG9mIHR5cGUgdW5sYWJl
bGVkX3QuDQorDQogVW5kZXIgdGhlICJ4ZW4sZG9tYWluIiBjb21wYXRpYmxlIG5vZGUsIG9u
ZSBvciBtb3JlIHN1Yi1ub2RlcyBhcmUgcHJlc2VudA0KIGZvciB0aGUgRG9tVSBrZXJuZWwg
YW5kIHJhbWRpc2suDQogDQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbTBsZXNzLWJ1
aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tMGxlc3MtYnVpbGQuYw0KaW5kZXggZmI2M2VjNmZk
MTExLi5iNmM3NjJkNmVlM2QgMTAwNjQ0DQotLS0gYS94ZW4vYXJjaC9hcm0vZG9tMGxlc3Mt
YnVpbGQuYw0KKysrIGIveGVuL2FyY2gvYXJtL2RvbTBsZXNzLWJ1aWxkLmMNCkBAIC0xMCw2
ICsxMCw4IEBADQogI2luY2x1ZGUgPHhlbi9zaXplcy5oPg0KICNpbmNsdWRlIDx4ZW4vdm1h
cC5oPg0KIA0KKyNpbmNsdWRlIDx4c20veHNtLmg+DQorDQogI2luY2x1ZGUgPGFzbS9hcm02
NC9zdmUuaD4NCiAjaW5jbHVkZSA8YXNtL2RvbTBsZXNzLWJ1aWxkLmg+DQogI2luY2x1ZGUg
PGFzbS9kb21haW5fYnVpbGQuaD4NCkBAIC04NjksNiArODcxLDcgQEAgdm9pZCBfX2luaXQg
Y3JlYXRlX2RvbVVzKHZvaWQpDQogICAgICAgICAgICAgLmdyYW50X29wdHMgPSBYRU5fRE9N
Q1RMX0dSQU5UX3ZlcnNpb24ob3B0X2dudHRhYl9tYXhfdmVyc2lvbiksDQogICAgICAgICB9
Ow0KICAgICAgICAgdW5zaWduZWQgaW50IGZsYWdzID0gMFU7DQorICAgICAgICBjb25zdCBj
aGFyICpzZWNsYWJlbDsNCiAgICAgICAgIHVpbnQzMl90IHZhbDsNCiAgICAgICAgIGludCBy
YzsNCiANCkBAIC05ODcsNiArOTkwLDE1IEBAIHZvaWQgX19pbml0IGNyZWF0ZV9kb21Vcyh2
b2lkKQ0KICNlbmRpZg0KICAgICAgICAgfQ0KIA0KKyAgICAgICAgaWYgKCAhZHRfcHJvcGVy
dHlfcmVhZF9zdHJpbmcobm9kZSwgInNlY2xhYmVsIiwgJnNlY2xhYmVsKSApDQorICAgICAg
ICB7DQorICAgICAgICAgICAgcmMgPSB4c21fc2VjbGFiZWxfdG9fc2lkKHNlY2xhYmVsLCBz
dHJsZW4oc2VjbGFiZWwpLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAmZF9jZmcuc3NpZHJlZik7DQorICAgICAgICAgICAgaWYgKCByYyApDQorICAgICAgICAg
ICAgICAgIHBhbmljKCJDb3VsZCBub3QgY29udmVydCBzZWNsYWJlbCBcIiVzXCIgdG8gc2lk
ICglZClcbiIsDQorICAgICAgICAgICAgICAgICAgICAgIHNlY2xhYmVsLCByYyk7DQorICAg
ICAgICB9DQorDQogICAgICAgICAvKg0KICAgICAgICAgICogVGhlIHZhcmlhYmxlIG1heF9p
bml0X2RvbWlkIGlzIGluaXRpYWxpemVkIHdpdGggemVybywgc28gaGVyZSBpdCdzDQogICAg
ICAgICAgKiB2ZXJ5IGltcG9ydGFudCB0byB1c2UgdGhlIHByZS1pbmNyZW1lbnQgb3BlcmF0
b3IgdG8gY2FsbA0KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hzbS9kdW1teS5oIGIveGVu
L2luY2x1ZGUveHNtL2R1bW15LmgNCmluZGV4IDg2NzFhZjFiYTRkMy4uNGI2M2I2YzM2MjQx
IDEwMDY0NA0KLS0tIGEveGVuL2luY2x1ZGUveHNtL2R1bW15LmgNCisrKyBiL3hlbi9pbmNs
dWRlL3hzbS9kdW1teS5oDQpAQCAtODE1LDYgKzgxNSwxMiBAQCBzdGF0aWMgWFNNX0lOTElO
RSBpbnQgY2ZfY2hlY2sgeHNtX2FyZ29fc2VuZCgNCiANCiAjZW5kaWYgLyogQ09ORklHX0FS
R08gKi8NCiANCitzdGF0aWMgWFNNX0lOTElORSBpbnQgY2ZfY2hlY2sgeHNtX3NlY2xhYmVs
X3RvX3NpZCgNCisgICAgY29uc3QgY2hhciAqc2VjbGFiZWwsIHNpemVfdCBsZW4sIHVpbnQz
Ml90ICpzaWQpDQorew0KKyAgICByZXR1cm4gLUVOT1NZUzsNCit9DQorDQogI2luY2x1ZGUg
PHB1YmxpYy92ZXJzaW9uLmg+DQogc3RhdGljIFhTTV9JTkxJTkUgaW50IGNmX2NoZWNrIHhz
bV94ZW5fdmVyc2lvbihYU01fREVGQVVMVF9BUkcgdWludDMyX3Qgb3ApDQogew0KZGlmZiAt
LWdpdCBhL3hlbi9pbmNsdWRlL3hzbS94c20uaCBiL3hlbi9pbmNsdWRlL3hzbS94c20uaA0K
aW5kZXggOGRhZDAzZmQzZDQ1Li41NzVhMTQxZWUyNmEgMTAwNjQ0DQotLS0gYS94ZW4vaW5j
bHVkZS94c20veHNtLmgNCisrKyBiL3hlbi9pbmNsdWRlL3hzbS94c20uaA0KQEAgLTIwMSw2
ICsyMDEsNyBAQCBzdHJ1Y3QgeHNtX29wcyB7DQogICAgIGludCAoKmFyZ29fcmVnaXN0ZXJf
YW55X3NvdXJjZSkoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCk7DQogICAgIGludCAoKmFyZ29f
c2VuZCkoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgY29uc3Qgc3RydWN0IGRvbWFpbiAqdCk7
DQogI2VuZGlmDQorICAgIGludCAoKnNlY2xhYmVsX3RvX3NpZCkoY29uc3QgY2hhciAqc2Vj
bGFiZWwsIHNpemVfdCBsZW4sIHVpbnQzMl90ICpzaWQpOw0KIH07DQogDQogI2lmZGVmIENP
TkZJR19YU00NCkBAIC03NzQsNiArNzc1LDEyIEBAIHN0YXRpYyBpbmxpbmUgaW50IHhzbV9h
cmdvX3NlbmQoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgY29uc3Qgc3RydWN0IGRvbWFpbiAq
dCkNCiANCiAjZW5kaWYgLyogQ09ORklHX0FSR08gKi8NCiANCitzdGF0aWMgaW5saW5lIGlu
dCB4c21fc2VjbGFiZWxfdG9fc2lkKA0KKyAgICBjb25zdCBjaGFyICpzZWNsYWJlbCwgc2l6
ZV90IGxlbiwgdWludDMyX3QgKnNpZCkNCit7DQorICAgIHJldHVybiBhbHRlcm5hdGl2ZV9j
YWxsKHhzbV9vcHMuc2VjbGFiZWxfdG9fc2lkLCBzZWNsYWJlbCwgbGVuLCBzaWQpOw0KK30N
CisNCiAjZW5kaWYgLyogWFNNX05PX1dSQVBQRVJTICovDQogDQogI2lmZGVmIENPTkZJR19N
VUxUSUJPT1QNCmRpZmYgLS1naXQgYS94ZW4veHNtL2R1bW15LmMgYi94ZW4veHNtL2R1bW15
LmMNCmluZGV4IGU2ZmZhOTQ4ZjdjNS4uYmExYjNkZWY1MmRiIDEwMDY0NA0KLS0tIGEveGVu
L3hzbS9kdW1teS5jDQorKysgYi94ZW4veHNtL2R1bW15LmMNCkBAIC0xNDgsNiArMTQ4LDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4c21fb3BzIF9faW5pdGNvbnN0X2NmX2Nsb2JiZXIg
ZHVtbXlfb3BzID0gew0KICAgICAuYXJnb19yZWdpc3Rlcl9hbnlfc291cmNlICAgICAgPSB4
c21fYXJnb19yZWdpc3Rlcl9hbnlfc291cmNlLA0KICAgICAuYXJnb19zZW5kICAgICAgICAg
ICAgICAgICAgICAgPSB4c21fYXJnb19zZW5kLA0KICNlbmRpZg0KKyAgICAuc2VjbGFiZWxf
dG9fc2lkICAgICAgICAgICAgICAgPSB4c21fc2VjbGFiZWxfdG9fc2lkLA0KIH07DQogDQog
dm9pZCBfX2luaXQgeHNtX2ZpeHVwX29wcyhzdHJ1Y3QgeHNtX29wcyAqb3BzKQ0KZGlmZiAt
LWdpdCBhL3hlbi94c20vZmxhc2svaG9va3MuYyBiL3hlbi94c20vZmxhc2svaG9va3MuYw0K
aW5kZXggNzgyMjVmNjhjMTVjLi5iYzE1MjBiNGI1ZGQgMTAwNjQ0DQotLS0gYS94ZW4veHNt
L2ZsYXNrL2hvb2tzLmMNCisrKyBiL3hlbi94c20vZmxhc2svaG9va3MuYw0KQEAgLTE4Mzgs
NiArMTgzOCwxMiBAQCBzdGF0aWMgaW50IGNmX2NoZWNrIGZsYXNrX2FyZ29fc2VuZCgNCiAN
CiAjZW5kaWYNCiANCitzdGF0aWMgaW50IGNmX2NoZWNrIGZsYXNrX3NlY2xhYmVsX3RvX3Np
ZCgNCisgICAgY29uc3QgY2hhciAqc2VjbGFiZWwsIHNpemVfdCBsZW4sIHVpbnQzMl90ICpz
aWQpDQorew0KKyAgICByZXR1cm4gc2VjdXJpdHlfY29udGV4dF90b19zaWQoKGNoYXIgKilz
ZWNsYWJlbCwgbGVuLCBzaWQpOw0KK30NCisNCiBzdGF0aWMgY29uc3Qgc3RydWN0IHhzbV9v
cHMgX19pbml0Y29uc3RfY2ZfY2xvYmJlciBmbGFza19vcHMgPSB7DQogICAgIC5zZXRfc3lz
dGVtX2FjdGl2ZSA9IGZsYXNrX3NldF9zeXN0ZW1fYWN0aXZlLA0KICAgICAuc2VjdXJpdHlf
ZG9tYWluaW5mbyA9IGZsYXNrX3NlY3VyaXR5X2RvbWFpbmluZm8sDQpAQCAtMTk3NCw2ICsx
OTgwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4c21fb3BzIF9faW5pdGNvbnN0X2NmX2Ns
b2JiZXIgZmxhc2tfb3BzID0gew0KICAgICAuYXJnb19yZWdpc3Rlcl9hbnlfc291cmNlID0g
Zmxhc2tfYXJnb19yZWdpc3Rlcl9hbnlfc291cmNlLA0KICAgICAuYXJnb19zZW5kID0gZmxh
c2tfYXJnb19zZW5kLA0KICNlbmRpZg0KKyAgICAuc2VjbGFiZWxfdG9fc2lkID0gZmxhc2tf
c2VjbGFiZWxfdG9fc2lkLA0KIH07DQogDQogY29uc3Qgc3RydWN0IHhzbV9vcHMgKl9faW5p
dCBmbGFza19pbml0KA0KLS0gDQoyLjI1LjENCg0K

--------------TAN6g0S0GHYr0iX8Poz0G0UU--

