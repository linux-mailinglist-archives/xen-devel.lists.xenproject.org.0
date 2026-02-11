Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEDFAKG/jGmisgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 18:42:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C71B126B22
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 18:42:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228139.1534498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqEE8-0007rX-Qj; Wed, 11 Feb 2026 17:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228139.1534498; Wed, 11 Feb 2026 17:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqEE8-0007pM-O7; Wed, 11 Feb 2026 17:42:12 +0000
Received: by outflank-mailman (input) for mailman id 1228139;
 Wed, 11 Feb 2026 17:42:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gWxp=AP=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vqEE7-0007pG-Rs
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 17:42:11 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcd283c1-0770-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 18:42:09 +0100 (CET)
Received: from PH8PR22CA0003.namprd22.prod.outlook.com (2603:10b6:510:2d1::6)
 by DM4PR12MB6109.namprd12.prod.outlook.com (2603:10b6:8:ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 17:42:03 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:510:2d1:cafe::e7) by PH8PR22CA0003.outlook.office365.com
 (2603:10b6:510:2d1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Wed,
 11 Feb 2026 17:42:02 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.0 via Frontend Transport; Wed, 11 Feb 2026 17:42:02 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Feb
 2026 11:41:49 -0600
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
X-Inumbo-ID: fcd283c1-0770-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eUwERUnadp0LZE8owYAhc+XB8r+O7D6CvJDWr43QVTQGn+H1FZn0eAmbipzxUtqK6rX8GfnTgMiWH/Nau0FDwFd924MK+i/TwX7S0o3pNp9ltmqYQzGtcXUdkSD31IQPGQ/ymBKU5DLp8ccS1zpgAF41GYaHi5dawU1Kc5JYRgKxELwPDi2nINYhQiAxf+p7FkGpe5BrrHgtDgko1Wdz7YrhnAoMH0nmeXlMA6U/me1pg1otXKNC6/vTL4MAM1akiouVyfbRp+ptdFT9LC+9TxRodQOwmCDSPhnxg0049gsPYiox/208P64edYsRYFWu2Jbhh2bm25rhEb7qpupUyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7s+q3xsik3zSUdvoW+sB/pYMv9Mah5Pivq6sXERP4ck=;
 b=gKcvwh20KdshPW8nBxdmbKu/bouNV0vgCyyrRKNU7/a4hHFjgUI1Qv75J+Ugnq14fUyN/BrT0pNYR8JQVJgXbFOM7rROipupwsnqK8iMGvAaYXJUiH18Eqvp8pLHUVzPoOVqesazMEhdAtKn+2y1r8d+ldGhjA98q9FfF8kAHgT2QaoTqE8tRiFXM2j059kLgNN61bg4wifRp3jlmmSlJfpSkwp9BuWAmwXqeYfHuZJCU+JnJvN51ineAugsldggyaYGYMDcKewSQwzql06MhZIv+g2F/xGvdszAC/HQbVvMxLuCzqtxpgFdEohse3sS/HqMUevAXB/HeSZCL/loqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7s+q3xsik3zSUdvoW+sB/pYMv9Mah5Pivq6sXERP4ck=;
 b=ohG5zuMWOCnhPqEnVbh9nxrgLhIjp8GX2Sf/beCbtHBLrGy+wnH/gAGOh0RoUIx+o28pZLIaecCsIkXR84xej3THUJaO/YU2lX5LBbnavjOOJwK5FRCJSC9IPSTvymSsRHRyjpantYTFxfl2xsMPEj7DJ1Jdr1B9eyvUW29NB8s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 11 Feb 2026 18:41:48 +0100
Message-ID: <DGCBG8493YBL.17QYWCVX62YDQ@amd.com>
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 01/12] x86: Reject CPU policies with vendors other than
 the host's
X-Mailer: aerc 0.20.1
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-2-alejandro.garciavallejo@amd.com>
 <a20d3f93-2209-4035-bacd-8bd00fb12d77@suse.com>
In-Reply-To: <a20d3f93-2209-4035-bacd-8bd00fb12d77@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|DM4PR12MB6109:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b98156e-98f6-4159-26d6-08de6994ddb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VzJHZ3V2eDV2bUVqZUlObXVVQm1iYWtZWjVpemtYMFNhT3Mxa1FwRWd4Ym16?=
 =?utf-8?B?MWk4YmM1SndTSzAwalhVY0I2V3VhMzlDenZBR0hJYmE5RmtmS0MyamFOZjNk?=
 =?utf-8?B?Z3l5MmpBN1M0UkI2aTlZcVQyNDJ6cXpjRE1SZ3gwdU9qR0RkRE0vYWdXV3Ra?=
 =?utf-8?B?c2ZJQTRqdkI4ZmcxaEZ0NGVVeC9TMlA1V3UxMllib1VjODRvb1E0eEEzOUtL?=
 =?utf-8?B?SDdiRmhMYU54MWpXUEsxaDdsN0Z0ZS9vR3RsMU1LRUdKMUJlN2hnT05RRkNT?=
 =?utf-8?B?TnFicEIxWG9PTHY2RkpIVzZCRUdLblJ4c2JiR0YyNkFGTFRzZ3lIZnFreDJE?=
 =?utf-8?B?dnE2ekVWMkJLM1Nac3pHUVFvdXVGUzBMSTg3NG9RaTluWlk2emtEM25lbEw5?=
 =?utf-8?B?bW9UWHlSenpicHNSZmdZZldBa1lHb2JPTnF3SCtDWHhwTzlwZWRjd25qaDM5?=
 =?utf-8?B?MWJXckFVZU5tMjVraG5wdDB3WVViQURUV1dQSnJmeFJsNG1FaWo0VHRZY041?=
 =?utf-8?B?aTVpdXo4RURqTWlTM3diTk1IMXpFWGw3Ry90ZldSRktGdHJsQU9LbFJwbUtL?=
 =?utf-8?B?U1czcWdBK1dpTDdxdjU5UGpWMEc3VkdSUXZ1dFNwUGVzaXV6QjVBSDVpMlN4?=
 =?utf-8?B?LzhPNXk1WHlDT0FzV0ZlNEhLd0o4bGFWaHJTMDRDVVg2ak9udW1ObGxnNVpX?=
 =?utf-8?B?L09iYkROMlNuMW1hYU53eVNDNC9PbVQ3UCtSeTRUdFpiMkJnd2oyQVVXczQv?=
 =?utf-8?B?bEVQMmZMcjNtR2l0RUFlclpueFNMckk3ZTVCbWRSczB1OWFCaTBHZVJqNC90?=
 =?utf-8?B?OE9BUUlWa1pqUXM5M0ZoazNSNW1DSVBOZzZrcFh2NlJGa3ZwNWg4K3NqZUJ6?=
 =?utf-8?B?L3NlTzFNcHluQWJpbW1iVSszaXdDelhYTlQ4OVp0NkNCZEVQY1MyS09ubjQw?=
 =?utf-8?B?UVBTc0hya0RrYW9ZVjRDc1FQMzJ4ck1KeVNtYUpZRURIRG96Yks2K2pmYVVU?=
 =?utf-8?B?UkZuQmVLWlhEeS9sdDR0UXVIWFFuMkxxaHVLYXFWMVoxZ2xhTk1zc2dhY3ps?=
 =?utf-8?B?c0NxbEh6U0t2aUpEZXZPbXR4Vnl2RGd6WXp2N2VtaHh6a2tXb0VqV2xMQWdq?=
 =?utf-8?B?ZFlvTjhuS0pvQ3hxNzJ3SytjUGZaRW5uOUpBNVFxQ295eGRnM1orSmFpRXJF?=
 =?utf-8?B?dW5ac2NBbjNmUWZVdHBPbUN5QkYyNUx6dkpic2tGZWdyRnI1WFcrUVN1L3Q0?=
 =?utf-8?B?NHNuTjJ2b3llc2NxTHlHaktTS1NZaDRJalF6eUlzd0xERGh2TkNnaXdBcEZk?=
 =?utf-8?B?MDl2WEliQlRxM2h4VDZ4dXRNWVdvd2d6M2Y0N0JjbUZFZTRwNlhXdUtIaStu?=
 =?utf-8?B?OERtNUtWTXRCUWZSK3ZVU251MVRzTFR2Nm1kS3ZQU1VlMkphSkFRbDdUOE1n?=
 =?utf-8?B?WE1mZlFtNDlxdENLakYvd0hmdEJPMmlxS0RDNHh6SHBXMXlsQnhuUWR1dERT?=
 =?utf-8?B?TzY2bGx6OS9ZMU1NMDNwN3lvaWpDVGJEbE5iTUttUmVybEg0N0RoN2Nadm1P?=
 =?utf-8?B?Z1BxeHpvMGxCUnlnbDI0VTdacUZEWHU4VHJ2Mlk1YkxZTG5vNSszK1BrRkVh?=
 =?utf-8?B?dFNTc3owTmJncWVBV1NsYUdjZHYzYXlJR3pjZVZrMndWOGhVZFAvUUZpbGVI?=
 =?utf-8?B?NzRNdXhUbFEzazNlVEYwM2E4cks0UUQ3SGgwZUx1U1Q0SWl1OWVnejhobXQ2?=
 =?utf-8?B?K1NsMXp3L3ROOWkwSVdzRzdIdjhpWFJIajZ5eGRydmozTUpEZktmMTFDWW1W?=
 =?utf-8?B?TVBNZWE1SzVhVEFvSXFGa2hHcFNZVnVSZjNya2xYbUh1ZGJuT3l5dm5jamtN?=
 =?utf-8?B?QXhEdEZjMHZlSFVmM1Mzd1BGdTJrcCtmeGp0c2xoaGdUOW1ncDZ0V2F4Z01Z?=
 =?utf-8?B?U0V4eEdIVDVZWEs4RFBWS29YQ3pCU0JpTlFWWnQ2Uk1nYjF5M3RiOXQzLzZB?=
 =?utf-8?B?UUJrSnlnaG5mOUdLUFBQZXREL21Bay9sRkpOTzVHTnlZTk1FaXdmNlJRdE9k?=
 =?utf-8?B?OU80WEdteTU1cmNXQzVUVFZUdUpBaDN5K0trRWNqOHJJcTFXVDh3Q0pOWWt3?=
 =?utf-8?B?cytrc25QRGxPNmREVVFaTTRhcWNJNHRVZHhWS245VVZRQU8yeWM2OC9DSHI1?=
 =?utf-8?B?WWM3YnlleXJBVmU1N1BmNmpjdFExODBLRU4yR2JVZlR5VEQyOWFSWmR2NWs3?=
 =?utf-8?B?VTNOU2ZIQkcwY3lHU3hPTi9GcnlRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TxWvzka+AcHt8++BqvqPSwT4TQF7DdltrcrMK8Phpj+ie0sKy+aaY/3JP+B6rIooG76sufSkhlmwWjYVBnUiUt1vGrpyNZwwknihNvPZ27RgQ+4B7bMNik4Y3pUmnmfKQ6Hgi3TH5l2WBwcAtsyJXjIqn1bleW1dSEmQgglbkQxQT7I76wKdzVcdrgljM9CDmxPwa19W2yxRQpoJXIr47giNoh4GfpFJz6627JoOZTN7Fwk142KNQUIbEFLQ8UPxYorUfUhNr57FA7GITaYx0fth+7lEQ+PNFEh8XgyJLqxnThUqTlfEEqoq9bDYpae4YhVgkpFdbO9Lk2JGTD2IDkHJV8cQqYvBcmXbYuUkaTYnMDSlhWdwLQXn3ZyMSYQ875C8BaM7qDxFX2m+2MpTI4ALK8h4x8k3q1wuJ6dCskLEo0HQ/khygQLSKWKhHKyH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 17:42:02.8101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b98156e-98f6-4159-26d6-08de6994ddb5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:mid,amd.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6C71B126B22
X-Rspamd-Action: no action

On Wed Feb 11, 2026 at 4:41 PM CET, Jan Beulich wrote:
> On 06.02.2026 17:15, Alejandro Vallejo wrote:
>> --- a/xen/lib/x86/policy.c
>> +++ b/xen/lib/x86/policy.c
>> @@ -15,7 +15,8 @@ int x86_cpu_policies_are_compatible(const struct cpu_p=
olicy *host,
>>  #define FAIL_MSR(m) \
>>      do { e.msr =3D (m); goto out; } while ( 0 )
>> =20
>> -    if ( guest->basic.max_leaf > host->basic.max_leaf )
>> +    if ( (guest->x86_vendor     !=3D host->x86_vendor) ||
>
> With the subsequent "unknown" discussion also in mind, I wonder: Should w=
e
> fail the request here when either side is "unknown"?

That'd preclude the creation of VMs on new vendors. At that point, might as
well drop support for unknown vendors altogether. I wouldn't mind that.

I was thinking of comparing the x86_vendor_id bytes instead, as I answered
to Roger. Then the invariant that only $VENDOR VMs run on $VENDOR hosts is
preserved even if we don't know about them.

Cheers,
Alejandro.

