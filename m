Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELQNLvmQyml++AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 17:04:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C53935D6A6
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 17:04:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267781.1557274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7EA0-00069u-JK; Mon, 30 Mar 2026 15:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267781.1557274; Mon, 30 Mar 2026 15:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7EA0-00066u-GZ; Mon, 30 Mar 2026 15:04:12 +0000
Received: by outflank-mailman (input) for mailman id 1267781;
 Mon, 30 Mar 2026 15:04:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w7E9z-00066m-Co
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 15:04:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7E9y-00Ft3B-Ou
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 17:04:10 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69ca90d9-5cb7-0a2a0a5109dd-0a2a4507e60a-40
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 17:04:10 +0200
Received: from [52.101.52.56]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69ca90e9-fd74-0a2a45070019-34653438a43b-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 17:04:10 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH2PR03MB5190.namprd03.prod.outlook.com (2603:10b6:610:91::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 15:04:07 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 15:04:07 +0000
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
 b=JdmgLJQmuf1r+9KcnQMYA6UUaFj4pPWdJMfYjzONPUo2QntqevyNRCE1fmfHTkSdteBkF0VNta3XBYvYBt0dsVzBEsQkKixflr93gvNGq0ma9mkVgvC4NmmKeWbujqL3zuIuLbgS2VBvU88lOYRBix+9nF7XN/qDB+uqbdWCaxsYU/9cXFA4qn2vrDzgZHZ6m+Mg84Bu6fbMB0ev9CLaE8LpHR3hkScuK0VD+ZK0bfOqNn7JPGPwyCEnnDPKzaah+sV9C8wgAfGoLkWEB8HDF0wG4qqLreoJ6KFc3GJLFkE5yf6U1G9N3xwoapX8YLsQRZQdS6qZaJO5O1YV+o67+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOEYxFkMgLVMEzDV0VHVibpdSm59ZWCphXiB0Z8mhOs=;
 b=PnZ/EU+eajKmfMBkoHbATiGUvtjC2oD3CmtTfjeX8eW3Ir4kH2Z3LyfCmmW6yEHRKW3zqFSbG777/FiUr/4pDcU9Nw8KChO/UUVaCqjQMYzttRCXOfLP+6tO2z2zY0ZXnE+/mNTE6DVCfJvZzrWwinyyh9+e13ld+E/E9bNNFCYkgyCAhUAz7+EXUdBOkhNj2EQ0E4Qs9vZ3yJxtgNhyFZ1CbkL4GCWW/DXErsPPLs1/050GeeJBMTbYQJApZiKW8pwliYk/DLdESsI9JiAqbrEkifp/qMsCh6+9OIf7k3Cgh5Hu4jaK0taFo9D9ucBe91WKcoxLc0RMntTBJIGclQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOEYxFkMgLVMEzDV0VHVibpdSm59ZWCphXiB0Z8mhOs=;
 b=su80s9ZYdeSseWsTTsiwRIfeGelZNO6yzNEe5RoAbaeRo88KxUsIiIYrZQMkDVFvgScbjknUOfFfZpJNP5KmNkpc+xYyry32JAfX9Fk4W2/qF7olgZZaCAzoBe8fx+Rvca+Ds4UYbMk2d9llZu8NmWEc9iv2qqtHX7jscYKMduQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/uart: set a default baudrate if non specified neither found
Date: Mon, 30 Mar 2026 17:03:50 +0200
Message-ID: <20260330150350.10657-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0030.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::13) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH2PR03MB5190:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dc9de83-bfca-42f6-623e-08de8e6d9730
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	t9D3X/FeoFcGmS0Uv7k7kqzVieSCfd0fzkEgO6sPmnLrAgqSfuM3W+U+xMf0dVqcoV1wVoKxK5MoE7HoZYlJu1hRpnVE/NuRpn9+B2f3QQDwxyBZSZjmC1nrac4Y6zSsUxLtjiCK5FIMsiyyl0NmYSmIIUpyoEsQBXPeJ2QqA19uzQTyn2F5V6jk/7RpskBIbpv8G4quCTeZ/+fffKrESK658YEx4fDBh1X27aaRcblhhHNxPM3vy0SdgrO9YJwPxjH/gFgyjd2sG9TFmCYjX3WlmRYL3g9G1y3j/azCJwS+h+qyS7MkN+w2CFQeQYRnYPbtdCcX91mQjxl4Bykfy6RLI0eFN9aS/h5O+EUEmvSHgftbb9jxN5hE++5tR4au8xKjh/W0rpuvfsNO1W97E0fjfFYp9sFQ+3txY7B03fH9lmyecR+wnvvCyMCKGM3D9O7SXiWZTZfu5/NnPXMDiiWtLZ32xNKAJahThgSX6uA4CYYiUlynOFHRTw3kV67gss8g5sivZf+gGT7LcSftHUGZ6mHXMrHoylDCySUgj5OMU2olRYyr7cDf6OdNdNMzgNcwmB5Jl3BMu7spBe/ju6kSmjyJioHqNnMknRUBD4AziXhElXCLJ++7p/yVT6s7/wdm+uo57TJVnoeZc/O0JmSG8ye7S07BAX5kP6pBZ2Es1rffOp32udAyY2kiE95wU0XyS6RIGRn0X6b2faZ+G88rsxuQ6WNB4mFRWIzhKiQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVJwVDY1Q0RpNGltSFhCbWRkblJpalZhSWFHTFdzb0FHKzFkaTJ4RlRQb3hJ?=
 =?utf-8?B?UERyTW5hVmFscG9KQkRUbXI4R0RoVkt1Yk1WbERpMDlGc0xLKzJvWkJ3d04w?=
 =?utf-8?B?Z002YzJ5dCtHdnlXcm1OSWVyUmVtWERCeldUenZTRmZwOExMYlZlNzMwcXNp?=
 =?utf-8?B?UG8vZ2tRNFIzS0hFLzRDaWVsRVAycTRyRXBhMWlONXJMSHRaUTVhK3hTdFZv?=
 =?utf-8?B?WXpjQW5yM21TcURPalFMUlFkZUdxRXhQYi9yWVRUTzhFTUVYbnFERUUrTW9i?=
 =?utf-8?B?N3pNQm9qNzVxK1VFUk91N09LdHhNSW41ZmMwWDllL2ZEbGsrNGNrc0xlOVdy?=
 =?utf-8?B?a1R4KzNwMmxRWjg4b1RwaE51b0ZRMDZxeHJWcWJxME16VEJQeXBmaCtGVmI2?=
 =?utf-8?B?ZzZySmxFNlFJUUp4N1plQzlhNXZ2VWhWT3pOdWNOVXlqamVMdHFKbTlFV3da?=
 =?utf-8?B?aGhVRkdIa0hKWWRCcDJwb05PSXY2Y2JNWmZYVDRNNnUzWnpRbFNlWlk4Ris1?=
 =?utf-8?B?amRpMi9sQUpQRlVNZmZYR3VydjRVR2VTcUZNME0reHRESU1UL2xFdmh3OVZk?=
 =?utf-8?B?azR2Qld0K1AxSVZoN05oZkFOQ1p5L2ttQUpPRHNSTHhOV2Q4b1BEa1IzRHJJ?=
 =?utf-8?B?aGFJNHJWQzFqd29udXgxUWlsWHZjTGxyNWdsQnNTT3h3STZ0Y2JwOVBzNndP?=
 =?utf-8?B?TkkybEJnb1dadExaR0JqZkk3TUovWTVPdXJObEl6SUpJQnkyT291M05wckJF?=
 =?utf-8?B?TStsWGpqZ1Y4aW5YT0d4Tm1CbGtRd0dwME1jUHZyaXFmV0g2bGVpVlUzZnlz?=
 =?utf-8?B?WnFWZThDZVBQNFdqRytiWW1zdHhwdjdsblRaN2V6QTVuVnE3RDV6bGY4Y1M0?=
 =?utf-8?B?ZjMrQTQrUGlIZFZ3b0tmdW1USVNoWWhNcmJybFo2R2w1YkRKampHNWNGbHJv?=
 =?utf-8?B?WFY3eUVDdzg5R3c3Mk5nakg3L2ZQczVSMEk3cXlNditzYU9qWXkwc3RXRW9L?=
 =?utf-8?B?alpjVTdtTmIyTDVvNVhrVFA3ekFHMUlMS3BBeWxKS0xsdTl6cWY1aURZWXI5?=
 =?utf-8?B?ZmxNZFU1cWcwVUdrUEwzZHZXeXJMSTdCbldDaElDSXNqMVByZXlpM3VIbWtU?=
 =?utf-8?B?QU5OT0lacHppclBXeDJqU253YURaN04zMFNQVms2MzdqcHJTVGRiU2sxUmJl?=
 =?utf-8?B?b1BhMlJmYW1aY3RrRjd6NHBSbjc2dWpEd3JKR2cvZEtQcWZ1ZHRIc2RyRFh4?=
 =?utf-8?B?bk8ya3krYzZOYlZwRVhzRlptTTRaT09Bbzlzd1FxWTUzZE9pM1pRZncrNDla?=
 =?utf-8?B?dExialJCVmwzbTAxaXk2U3kzdTFKNWFKbjdyRVVHNjd3dXNETkJUVlR5bWt6?=
 =?utf-8?B?RFhuUnN4ZTBjRUIxSXhFYTR1bUJyQit5bTc5U3RUODNNb2JnV3RJV0ZkYWxF?=
 =?utf-8?B?dkVxdlJJMEVPRDdUby9EN1lTL1NzTWpTaE9KUnNwOURBd3JFUXgrckE5Vk0r?=
 =?utf-8?B?RzV3VFRTdlpNRWhaSlo1MndwRHFETFJZNHcwUkkvWDUvYjRHNkRrMml3VE9Q?=
 =?utf-8?B?TDJJYkVuSWpsMldDcU1UUTRxbDZPZTU0b0NDSTdJREduTnZlMnJud2wrdXhr?=
 =?utf-8?B?MDhTYmpqcVhHc1ZWMll0V1VwNUFHc2IvdjQ5a2FVVy9zNWRYSjRvcmZEcVd3?=
 =?utf-8?B?OCsrRmgxWUJEa0lhUjFwWGFQdi9ibTVramtwSzR3dXVXdm9ublFpR2pMQm9k?=
 =?utf-8?B?bWNMTk4rTVFDeTlxZGhDZVZvYnorSVFOV0xxLytGN3JzUnAxdUdtYTNvaVFt?=
 =?utf-8?B?K3g2T0tFR3ZoeXc3RlQ5aVEwTWk4Q2lIRWgybDZGazIvbEJrdHJhdjhlV01D?=
 =?utf-8?B?SUxNNnR0ejN4dWRSbk9tb0lSUkY4VGhwU1ZGajFZYUZLZW84NjFQMm9HYWU4?=
 =?utf-8?B?TFFXdEhBZXp6Q3JsNUg5SlN6S1gyK2Z3YmNJcWIyeCtINWRPZEdJWFB1eGZX?=
 =?utf-8?B?UlBiMHFhaU5EMmxrNDFaNWlFVHBEUVRTNldRbHhmRU51bDRQSm1qS3VBZ0d0?=
 =?utf-8?B?K0RTOW4rRVU2U1d5NVJzM0k5UUJFQlhGNG5hd2JhTWk5RXN0MDEwOVdaczV3?=
 =?utf-8?B?anY5bzlmWWMyMUJJdVMyejdMTWZnWHRxT0I1azEybW4yZTBub3EvRWFMRFRr?=
 =?utf-8?B?QnFRc3pOSiswQjBVR2xpZGdSOThFeHRZaGxXSUFISkFKZysvS0o0ZTV6dEpU?=
 =?utf-8?B?NjRmSWRNUVFxVndPaTc5YVdxVVJuY0s4WlR6aWRDcGdiT0V5SHFFVjR3NVA5?=
 =?utf-8?B?aGxMOFFUY1YzTXkwcDRxRjB5NUt1SjRqVVRTSDNJeXQ1NHdYcVl5Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc9de83-bfca-42f6-623e-08de8e6d9730
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 15:04:07.4873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0wMMFuYXADswC2Px3FA9JzVQ+BJ1el6Xmw99q+Q6Z7nDSsAyxDRBlavdeGZV4sMXtxozwxYzYU2uMO79LoaIlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5190
X-purgate-ID: tlsNG-ef75cf/1774883050-4F6A7303-55EB69D0/0/0
X-purgate-type: clean
X-purgate-size: 1495
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[lists.xenproject.org:server fail,citrix.com:server fail];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2C53935D6A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If the user has set baudrate as "auto" (use whatever was configured) but
Xen cannot find any set baudrate use a default fallback baudrate of
115200.

Otherwise the console will very likely end up being non-functional, as
further values are derived from the baudrate (like the transmit timeout),
and using -1 will result in screwed parameters being derived from the
baudrate.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/char/ns16550.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index b23e85a3c68b..130e292f057d 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -346,9 +346,16 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
         if ( divisor )
             uart->baud = uart->clock_hz / (divisor << 4);
         else
+        {
+            uart->baud = 115200;
             printk(XENLOG_ERR
                    "Automatic baud rate determination was requested,"
-                   " but a baud rate was not set up\n");
+                   " but a baud rate was not set up\n"
+                   "Setting baudrate to %u\n", uart->baud);
+            divisor = uart->clock_hz / (uart->baud << 4);
+            ns_write_reg(uart, UART_DLL, (uint8_t)divisor);
+            ns_write_reg(uart, UART_DLM, (uint8_t)(divisor >> 8));
+        }
     }
     ns_write_reg(uart, UART_LCR, lcr);
 
-- 
2.51.0


