Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id tSV1Et/v+ml1UgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 09:38:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8B64D7521
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 09:38:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301209.1575511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKWp9-0004uj-R4; Wed, 06 May 2026 07:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301209.1575511; Wed, 06 May 2026 07:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKWp9-0004rl-Nf; Wed, 06 May 2026 07:37:39 +0000
Received: by outflank-mailman (input) for mailman id 1301209;
 Wed, 06 May 2026 07:37:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wKWp8-0004rf-Ts
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 07:37:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKWp8-001ZLU-8H
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 09:37:38 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69faefbc-2eae-0a2a0a5409dd-0a2a4502cf22-32
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 09:37:38 +0200
Received: from [52.101.53.16]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69faefc0-af86-0a2a45020019-34653510d9ba-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 09:37:37 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS7PR03MB5397.namprd03.prod.outlook.com (2603:10b6:5:2c0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 07:37:34 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 07:37:34 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qrehkN8HmIFtWUZJT8Ey8WRwKCPkxR7RiWXkfvuUUXvDDVBRAnki0cAm/PneIJO/UOEGoLP/6gjFP5prsDCBxSKqwxR/d3p3sviqBRG/+Wn8rPsjkZWYKAKbIrJXwihwZAG+J9PcwCdASvYYotXSUL3a5PoADc/SfZhJvRuuwLwztcoynjGJrIGei9ksfxXPTOgcYFsnHfX/dGWVx1zgszZ/OqPZRyN5wKrB2ZdJgOilNVDxYWXOWGjk0ruqol8HiAkP9Csfha1avqZThMPLKtdEgjD7Z8cFii9jvqrBT8lo3sSJBbG+l8nPwDKCLmoYsGzTlu+dXgV0QtUUZm5Z3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rtytr6SViiZKOuuPe4d8UQ+wj1J1v5jWo6JEOqd5jr8=;
 b=xUUlBvW0vBfWk8fVxjS5yyfr/Q56vvExhMcLxHJoi2W4BEp/5HjJGP4qwd//iNVfFXl1Bwo4ZOBVOiwjbDXpZ5xcdE+8UdEmz18RveT2IR/dSICpEeGGWrak5T3rrUMmpD8wH6tsNZA0jlo6KgK3S9Qp06tgygE+3VbaQ8gppgZp21wnFZeMqsK7Jl0QUSddP5t53r1Zt2ePYOv8/TyavR6rvYyLfQXhEULLV4ORD8ZPb3ysqAvf8INkiK8Smz5Yp0GLykjXwnFe1vnCO1c4N6YcVzkKuyPD5Z8cglB/8bB4Br/VMKXVqVDkGzP8nhkOg1LG4teAkaZZPb0o+mvf2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rtytr6SViiZKOuuPe4d8UQ+wj1J1v5jWo6JEOqd5jr8=;
 b=d2pCJ/whTZPBWcN6l8anlJhNFr1N0MVi/6KhoJx/llq2097MZnlA+RL5CpqnO/oSsfyTyURVc2f65RckwGCROhYwzAyE1vpJH8djKq+n3f9PsIHRcNCOWsN40LcNlqEEMtN0vyKfEwcd1LQiwlulkVLC+H3bGu0eSRqzsO6J6S4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 0/2] iommu/amd-vi: remove zeroing of MMIO region
Date: Wed,  6 May 2026 09:37:17 +0200
Message-ID: <20260506073719.40075-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0096.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::10) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS7PR03MB5397:EE_
X-MS-Office365-Filtering-Correlation-Id: 87d8e8d5-f64d-4e16-ff54-08deab4256e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	1SWt3XdjFWBve/oYzFAvGF09b+RZAqQZOBYPR1LKMYWsPQi/kw/K50OveDzeTGXRrkhOwVUcIm5ThkCKEZPnvHAlTdrwNnQTIOO8S/ykUTTBzUOvuugulImFqDpVsLX/6+qrc/waxfgTqWftILz9g6OhQXYUFkQFx/ZOR1k2AH0y3rxXvV3D/2fN3eOZWpn1UC402TARPEl8ASptCZ3qFcYWmAATjZyBlWJVGN71MpCDPQGLHly04u8GQv0NkO5pS0ae/0ti7/xbXtypeWEbdLEmJbXK9wwi88Xezin5oOjjMgxkAAifYGoxwImfitSouVcxi2tGZH75DVWWqbacavjpN2T2a41/89gsZUE/bPbu9A8y+8GgQM21+8z4gtEqS0hVPYRgw0d3VLslEVYXkgtlTO+hKC2IFTwc1KJS9Yphckvl3VEEyD2R4UqUvJ3O8S1hzZn3n69/iod/dvxUEnT69pjeawl8UMcPeI2r4QWfTK3dJbZ7KT5QegTnLtKzLNaownFC4NWvaiHtWfz6PFERrF40w5uw2fjhu+zchdOOumXyr0A5+Yi4pk4+VpfYtTUfjOjaj8QYvRy7D1MEh+fFFvKYKT+Hs1nMYJQE5xbGqPXkvzL7yBwGsNLNA3osU7zIZnbjTOBZT7iHeZAzA0VtnrCH7wlAGMMv4r3EJTHqDCayxoYuUWlt3VTfRMpQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eitYcXhCRGpwMmh2VWZpdFhxdlhqRGFDaTdpd2tXNGJadnhUSTViVFR4aDlp?=
 =?utf-8?B?ZXVHVGxjNS93TEE2bTNmc0FHQ1N1M1NFWjgwQ0JKUktjVkxKbHV2MW5YbCth?=
 =?utf-8?B?UFR6VzhZQU4yOXNuWElXQlYvMjN0SnhFbmFQR3YzeGhFdHRPbjhSc1I0MXB5?=
 =?utf-8?B?eFAxMXlUNi9OSWJibFJLZllwalBIWm01MkVRYlRtQUtkeG54Vm5Td09NU045?=
 =?utf-8?B?RlFZS1N0cHFpZ3kyeWNXTUp6SjVhRzA0Y0JLN3F6MmlpWjFQSE53SUN3RExv?=
 =?utf-8?B?aTltL1JwMDBtV09VTjFwdXpUR3B1Nm5HZCsvNmNBZFFUcWdQUnV2cFlzMzN3?=
 =?utf-8?B?NFp3cGpKbGFIUjZQeDBiSi9CaFBkUkp3dVJUajJjOWhKYWN6a0xRdTJxeWUy?=
 =?utf-8?B?SlRuQm14NW1ra0VaQ0lPZFE2Y1VuVStxYjFwY3ByR05iS2JFbU5xaGpFS0lm?=
 =?utf-8?B?TUh2dmdjNmIvYTFUcFhNa0VORFVvVzlQa010ajQ4ZFFSYStJeWFhNUxGV2Z0?=
 =?utf-8?B?QnNvWVovb0RGU0laNTkybTJxNDZzOE9MR09SN3JSMDhNc1hyNGVaNUlROWZ6?=
 =?utf-8?B?cGVTaDdkY0c1dXI0VURlS1hMQzFNMTRORGdab0Y5cjg4SUhDM3ZydDNWWjBi?=
 =?utf-8?B?MzVQbDc0MTZvVklKeCtxTTFDLzBQbENjMGh0TXZhc3NMNmoyOGk1VVBCR0ha?=
 =?utf-8?B?VmIrVzhxOEhrbHpLZ3JiQTY4Y1pWNFFxeXh2VkxGc3pqeTlZaWJsdzBhenpj?=
 =?utf-8?B?bEw0Kzk3dmZkOXJ5YXg2ZUhTME1HWE94S2JYRzZCN3NNczJVY2dROEhoRGRK?=
 =?utf-8?B?TlpSV1Riakh6eXN4cTZTNW1XY0ZQZ1dVbzRGUVlMc3hDcVNGckpQV2lldHlr?=
 =?utf-8?B?MkJiTk5uVHlrMFpWc0hBRGdzZUU1cG1qd084MjlzTjdHaGFpTVBOR3RTY1Bm?=
 =?utf-8?B?VVlBelNEVGc0cjB5QTcyMzZlZi9uMWc4b2FnNC9OZThsU1pXaUFYZ0lOd21Z?=
 =?utf-8?B?NGhreGVvZ0tUVlhJb1BCSTVjakhXRzhza3hRb2wzV204LzNRQ3dtdzlHNVhI?=
 =?utf-8?B?THdHaTVLZERkdFJaMEdVaVIvb2cxUDBoQ3JtZWVNM1NSdGVFa0VJbU5LNW50?=
 =?utf-8?B?K2NESWJPc2U4RyszUHRqMzNac2hJQlR0RjQ3QmJVWFhadXdPUjJUUzhxcmx6?=
 =?utf-8?B?Mm1rQjNXd3RNMDFKM3FhYmg1ZlFpcGRyMmtSdzI4UG1tTlQ0YzFhK0t5VHZJ?=
 =?utf-8?B?WG5wb1VSNmRwU1UydDZqSDBDbGxVWDlGUndpYXNrVGZnWnNoMnYvcHNYQkZN?=
 =?utf-8?B?K0lyeGRLWk10Uno1QU5iSmtQTHlhbjJ6UFJQUE5tRFF1WFZkMUJzOTY3M3p5?=
 =?utf-8?B?aGdBQ0E0Vkx2OU9lMElNSjE0NUdkQ3VNcnc0TzhxVDdhMk02bFMxNGYvN1RV?=
 =?utf-8?B?R1l0dVpFdTRRMlZYMDZ3Um1QcnFPbktxd2hieXc5b0FRWVF4Zk5BOFBXdE5m?=
 =?utf-8?B?SitDT0M1THJtV1hpSUN3Vk9uQXl4bFdheU1ENWdyemZUK0dBK1FUYjErUlBn?=
 =?utf-8?B?NVpSV0dIaVVZU3dpdkpVdG8zWE9hREl2V0h5NWpwelJHelNEcHNYUWpTVWEy?=
 =?utf-8?B?Ni9LbVR0YnhUVG5Jd00vWnRGN29NODUzOUNlNlAvcmpDV3JxQkIvRDJqa1JK?=
 =?utf-8?B?Z25ObmdsWGhwd0NCK1doVzZGZG9LWElzUXNDZ05GTzNleGFISTNkY3JIRTN0?=
 =?utf-8?B?VkFiMDlNdkpZVTZBcnBaZ1Y3VDZGWWxSNjYxU1NhODdGdFlJMjBwbW0wbndv?=
 =?utf-8?B?ZHpBVnpoMzFydUZobmpybEVrVTJvb0ZoT1dMUlZTb25XclYyYkVSSW9vaGt2?=
 =?utf-8?B?aHJmNjZCQkVURllKRUNlWGd1eFVUcXQyaHJnaS9wTFFiQ3F5L0QrVVRFTkli?=
 =?utf-8?B?TGlwcWx4ZmhPRkhzY2Zra2JrZEZkQkl2cXVkY3lsakZQZ1lFb0VoZUxtanZ6?=
 =?utf-8?B?eTI2RmlIeGVSMHRiVHlOeUdwRzBvakhEejBQWDlWR3NyU3RLcHo1OVlqKy8w?=
 =?utf-8?B?NERmK2cyR0lMcmVrUllGUmk5eUpyUk1iYXd4alJ3bE92VmFFV3IyQnY4bFVM?=
 =?utf-8?B?MEI2eDA2ZzVTOVlERlJtR2tlMzNHU3hwLzNOQ3U2RThiL05lMysyNHdFc0M5?=
 =?utf-8?B?SWY1K2R0N3N5VDB5L0xCcXE2aURsaEJ0aHlDYWFXa0RITm56NXJhaEdSV1l5?=
 =?utf-8?B?eE1WOWM5c0pncW1UVnFqZ1NoV0w5SXpZNktOaHVWWFhIalBVcll4WEtqVVp5?=
 =?utf-8?B?Y1hZazNLZkpWVlN5R2xNRU9IcFhuUDlsVit3RHFFUjlsRlYwZ2VHQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d8e8d5-f64d-4e16-ff54-08deab4256e3
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 07:37:34.8235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ysQBnV0SDpfKl5eLBz4nDEaO7hYANOvtxznVulYkty+PnIviyUKpnXr8DBcTsa0L4XqRZkckDjkguPG6siLE+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5397
X-purgate-ID: tlsNG-720697/1778053058-83B60161-4DA8ADED/0/0
X-purgate-type: clean
X-purgate-size: 595
X-Rspamd-Queue-Id: 9E8B64D7521
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

Hello,

Unconditionally zeroing the whole IOMMU MMIO region is dangerous, at
least on an upcoming platform this puts the IOMMU in a broken state
that's not recovered by the init procedure in Xen.

Get rid of the zeroing, and instead attempt to disable the IOMMU ahead
of enabling it.

Thanks, Roger.

Roger Pau Monne (2):
  iommu/amd-vi: allow disable_iommu() against non-initialized IOMMUs
  iommu/amd-vi: do not zero IOMMU MMIO region

 xen/drivers/passthrough/amd/iommu_init.c | 34 +++++++++++-------------
 1 file changed, 15 insertions(+), 19 deletions(-)

-- 
2.53.0


