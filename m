Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DTUaBg5LJ2rruQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 01:06:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A64965B20E
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 01:06:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=cb7uW0uC;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1332134.1594782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWj37-0007Iz-4o; Mon, 08 Jun 2026 23:06:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332134.1594782; Mon, 08 Jun 2026 23:06:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWj37-0007GE-1O; Mon, 08 Jun 2026 23:06:29 +0000
Received: by outflank-mailman (input) for mailman id 1332134;
 Mon, 08 Jun 2026 23:06:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1wWj35-0007G5-7h
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 23:06:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWj31-0021MW-Bl
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 01:06:23 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6a274aa8-2eae-0a2a0a5409dd-0a2a4508a158-34
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 01:06:23 +0200
Received: from [40.107.130.129]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6a274aee-63b5-0a2a45080019-286b828149ee-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 01:06:23 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by AS8PR03MB8442.eurprd03.prod.outlook.com (2603:10a6:20b:528::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 23:06:21 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 23:06:21 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E6CMU3nNEE3/ZmqC4z0XKoEz8EBI5A81+wtiwYV/CpdqaGSL2E0SCs59jjTI+Ob5zlOT6iHA0r/oB62+lPYx2k9phzFTbLRj5Vra67WBvR0DXM78sGTvW21oKXLYRgBw5SxelrCCMSdsFu+Lb7j6YaoczMLgnJuwtGW6bc9F72TCRGq/h1zmMqUmgElr9PIcxQ3Tyza9cJ6tfF5hacBANo3mec0i9+uswyMq59I+NHjSMurf5lWaqlT3m0pyoCjF+fMKGwY1kU1rZrDJvjDz2hHjtxIx/hMzx38x/g+BmvsE6y1oyReY7Iu34whbJL6Q4TGtkEehPSlzoupO+/Uxbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7/dTcQ7+fH6+STG4KEZJq9g48cqodZ/QsRPNB+d4Yg=;
 b=VsxliG9E4KJVEBMo2IzBc16TZTKqtmVNSdfIe+9Ix/3WOnV9RFLjJob+BPLEo2TEBrqS8tNsDLElSEfLG0x9jtHxi9LQOjjcPBz7Km+M1a5l8ERSVypi9iPdoTqPaTW3lEL1DJsC0czI0ypUNdqlYGVbuYYF1xXUGF5SNfM4LKBYIhsznP08BoS1XLXTIBoBk1sqEnp6S5RSXWiNsL04lbOF2vlkTllG2J0VWCSKIxMhEEYgt9Nln9p9z2ZXdopDj5+S8DWgcN8e04AjnRSy5oTQZI4r7hJKHHE287zXFdmc2L77CcPFQqun2uzJAKqGMXV3WkwwpUKrbuhrQ3LSNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7/dTcQ7+fH6+STG4KEZJq9g48cqodZ/QsRPNB+d4Yg=;
 b=cb7uW0uCuJBu7dAUygwJp08NslMkykZlU2x2gRyCSyUwAMH+TYO/7qXYTEmfpnv2P2OtBayPFgOp3J4t6l+g/FcantTQ0nC1Vb4wxw7MTYhKVpznnX+pd48thGyUQSqSciu9wXHPgz99J2Wuo9eOVwQFi/k+oJrnX34TM/ZgUjsKuZPDabVRBVLIKxb355U5ep5OOn7QaU8Jxt80wGzIKMLZbmbMioaFQqV+LbilwglQPPEh8lPp3496yvL4M6qxWk6smnSEQGozTBDUpGgU2YrqWXLPL79dv7olROz+99KxGELTmbCkgIm5OWxiOaEmUorzvNPlBNTNeBzqn0KBsw==
Message-ID: <8c57e619-7b37-49b9-ae55-67490956d12c@epam.com>
Date: Tue, 9 Jun 2026 01:06:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/23] xen/arm: vsmmuv3: Add support for registers
 emulation
To: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <25adb33c4be3932c2d946cf7757c933eb042476c.1774918270.git.milan_djokic@epam.com>
 <6d1806aa-b009-407a-9a7a-476f9f4deb70@xen.org>
 <f7e7f42c-43f1-436a-9d06-ab44619f2da0@epam.com>
 <648f587f-8621-472d-9b2c-e88fe11444a4@xen.org>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <648f587f-8621-472d-9b2c-e88fe11444a4@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0102.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::43) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|AS8PR03MB8442:EE_
X-MS-Office365-Filtering-Correlation-Id: dcfa361b-146e-4a95-1cdd-08dec5b28dc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|6133799003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	b6t8Y2TP+LsC6VUwYzhu603vmNKbXHh2+wQCJrAQ/Tdn4kGiAqUHVcRZf+yQkrGukOcXPIiOu4FJWjE8CrZwQpA39+tE33PvDGCDXYb5fYa/CbYo80JSFfQIuZeHQFFSp52BLD9006/TZHbXlwDES6VaWcwjRHmuPHx5ySCjDnjNXq5kALWCB+f7Qwv6mYffR2R7vphgts+CXSCqNMZO5DLeoHP+03jyfUzLrV42Uy1Uu45JuXS3b5A/0XvihNA+2SIAIa9Eh/zLiOfBXF2FWpj2TrEUHb12dc9CcymQgB50ofhGZhxZgYLDlVwxHeQhOevPyHS7pqOOxL1/MXyQ4yWVZVK9oQbz7nDGWF+WKvb3f/GTux7rJm8ZPZB5I0VdXPxLMuDiqSjhL9n2bmC90sJ9PpBTC4qd6qe/c3Dcirq1VmXz3rgasEL/kfjC08CMNS3T1dieu6uxjlO9OHt/CX/Ct/Evd9z5eiQzyH9oI+hmGLh9gCk3uOMdQ3ox5F6Dkjh8bY6l3VqIcUrmwCXHqK8IwaJoOG4he01mG+H1tBLHlsyGm8EegRDJ35ty+e5VY7msHgwcJ41N6tIOM2n/XDspK14CXAD8jY0AvXh/lxR39zxt5xCAcSJ0mWCF/toNxMG6odBnXqAbksAf7+utdeLNDJDR92z8Qcn25vbBepumuNGMXstcHcoM4cO+eMcY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SysyMVV1ZGpjNTZycTlFT0FYc2lOaG8xNGt2MHZTMTNBMkpBckdXT29iSkV5?=
 =?utf-8?B?SmNrdm8vcURzZEoycUlERlh0LzY4eW5uOEx1czg0WnFyWXFSTzBQcnVZency?=
 =?utf-8?B?RTRVMFdpMUV4c0o1MmowbHJvQ0NJMDFJaFMwZjhKcllOUHBGcUkxazlPR1Ez?=
 =?utf-8?B?aFZrM3RneDMwOHd2QktDVGJhRVRKYjg4OG9UMXZycTc0dVRjNDhwNkdaVjB4?=
 =?utf-8?B?aytTcm1HNTdVM25Hc1pJWEMwK2YxRWIvajcrNU1XVWZtMUY2am1sSms3Yk50?=
 =?utf-8?B?U2MrcnNzcUhITW5DS3UxcWxnVFhQdFlPaHE4TVA3ZkpFOTVCOXhoZWUwODFU?=
 =?utf-8?B?OXhQYnJPWGR5blp6NTNLcUNnVENKMmxPQWRVRHNwUkphY3NsQ2Z0VStSNC9W?=
 =?utf-8?B?SURyM0dZdGVRRVVJT3BvVUE2RTJMcHB0QmFUV2h5dC96d0gxR3NIbFVvNytJ?=
 =?utf-8?B?d0J0eVNsNDZSK1JVK0p3OUJKN1hJSStEV2JSSmRhOGRmY2hJZHNZQm5XODlI?=
 =?utf-8?B?YTl6L1RsQVcwNERXSW54N3lRay9wTFhmcm03SlRkYnhsMFh2K0JOWThjLzlm?=
 =?utf-8?B?bDZVS2hPNTJNQXhCaUgxcUI5QzdSSlZxK1hVajVtbDYwbXlidWZwL2VuUFly?=
 =?utf-8?B?OGRCOUdGUmoveTh3U1RnVnBHVW5tcmtXNWdCZ0NVZTBDY05BUWFuMStNa1Ex?=
 =?utf-8?B?V2oxdTFNZGMyamdvTFpIdWxIREc4OTF1ek1aV2xRNHBhVWE0UE9yWFNXUi9r?=
 =?utf-8?B?QmhjakM2Y2htUlUweFJjM3pJWVhEdkNTbFhjRUhJYm5BTjNQbnY2aEdkZXF0?=
 =?utf-8?B?MHZVK05aWUY2RGZueGVCZVpRMWQ0NDBEUUQzc0gxU2dEZkszMDJFK1JDUVNz?=
 =?utf-8?B?UWl2VXYxRDR0c1pWQmJMVjFZUC80T1RXbWNDdVNxNi94MWFzMDRtNi90LzRu?=
 =?utf-8?B?QU91TGxXVlFDdXY0elJRVDBzRUtZL0M5dkdzL2wvL2NaTi9JbzRXdVVzdjlj?=
 =?utf-8?B?UCtrL2tGZ2VVa1l6YSsxUkxYNWV1VDg1MUgyOCtCTm5oYy9vZGRzZkRVSkRl?=
 =?utf-8?B?RVlQcTJMQTJSQ1ZCT3ZxNXZPMGlMV2tCcTMxVjNMZGx5dFhIL1FjdVgzc0tW?=
 =?utf-8?B?QzcwdHR1WDh1dERabjBGQUQrWXRWdzNJR0YzQWxkSlNHS2huMzFMNC9qVW51?=
 =?utf-8?B?bVVidFlpK0dNUzdVMUxaZTBSTk40dVZoM2VNbFhPbjYxYUFOejU4LzJGTU5J?=
 =?utf-8?B?QTRlSEtUMEFTY1RnNm5oaFpVL2NjY1lwMk40ak5MUFhKRVRIMEc0b3V1R2Nm?=
 =?utf-8?B?a1IwekVROHo0TG1qMmx1SUl4Z0RuOWZKOHpvc1BTK0pudDM1VlZlUFZ4ZjhG?=
 =?utf-8?B?RDgvVEJ0TU4xcGVrU2ZpNkY2YnNhSTdxb2dOTXk2UDBORDlFSWNVa2RuODJQ?=
 =?utf-8?B?NGpldkYyeGFGMW51SUI5Q1BCeitNdVA5Nlc1anJZUHZzb1ppbURjdTYzcmh3?=
 =?utf-8?B?KzJ3NXZHNFdzdU9PbnFEZFFlWWg0Ly94TEFEL3hWSUlBeEVVdFIvUHV3Znlm?=
 =?utf-8?B?d2x4a0R5NVJuNE1JMmtwTGQ4bkg3UnJyT0VRcnR4RFVCRGdnbSsyVXVDM20x?=
 =?utf-8?B?WUozM25TdE5Gd1BTWDlJMTE1S2lpRGZyK1l0TU12K1BOZUd1VHR2dXdhN3RF?=
 =?utf-8?B?dnkrQk05bCtOSkpkYWw2dDBKbGhEN2VlWDNZdktvZjZZaUZHRkY0TnVQcUVu?=
 =?utf-8?B?TGdGZC9oRWhHYWhLK1NkdThFY3I1bGpMMm0zeEY0ZEhYZDQ4ZTJjZ083ZXk5?=
 =?utf-8?B?azMrNXdLMHJ3ZFhPYUxpeUlzVi8xaGhjT3h1aEJNVE52UjJyRWgveSs2azVY?=
 =?utf-8?B?d3o0OFRMMWZGRVRJOUU1QzNPa0l4ekY1czZSMXZ2NEUrbGcxd2FqTlp4Z1Vm?=
 =?utf-8?B?TDdsTG9HcjZhbkprbGtJeTlWS3hvUXBDcjlLSjMyc3pubXM1ajFGNHF3Tkpw?=
 =?utf-8?B?ZmJlR1NTRkNDcisyZHo2SHd5TWJoMG5YcW9HZDJ4TTdCN2pXVUhQTDEwVGg3?=
 =?utf-8?B?L3RHMGliNlRQdWI3YWYzT056UitUZ2pOalZGT3lzQnRFOGxUMEkzbGFFQnRP?=
 =?utf-8?B?QllFN3UxemQxeThiREdqdmxVeVczZ0E5MFhWMzVseFIzbDVUQWo5eVhvQXFl?=
 =?utf-8?B?NFJCdXpuREhLYjBwbXhTRUVBb0lrTVVtQVFncy84eDJWNGFUT0lNdUl1RTdr?=
 =?utf-8?B?QWJtVVFidG52cDdQQ0hVRHMzWTJ6Wm9uS2FWOWxuZ0pldkZmNTJGT0NULzJa?=
 =?utf-8?B?U1dMQmwreVpPL0NKVlZTaC9BSzZLVCtPRFhSbk1XWmVNNkpWbFlBZz09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcfa361b-146e-4a95-1cdd-08dec5b28dc9
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 23:06:20.9549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7IHjUiqpJrVXyGroLijY/tsT00UaxIoAKeKFMhkhPAt5YgJcvxjopP6UcadmHatLOgil205T0QlSQ7MMn6pMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8442
X-purgate-ID: tlsNG-c1860d/1780959983-BDF6ADB1-D6F6238E/0/0
X-purgate-type: clean
X-purgate-size: 11192
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A64965B20E

Hi Julien,

On 5/24/26 13:49, Julien Grall wrote:
> Hi Milan,
> 
> On 18/05/2026 01:17, Milan Djokic wrote:
>> Hi Julien,
>>
>> On 4/14/26 10:10, Julien Grall wrote:
>>> Hi Milan,
>>>
>>> On 31/03/2026 10:52, Milan Djokic wrote:
>>>> From: Rahul Singh <rahul.singh@arm.com>
>>>>
>>>> Add initial support for various emulated registers for virtual SMMUv3
>>>> for guests and also add support for virtual cmdq and eventq.
>>>>
>>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>>>> ---
>>>>     xen/drivers/passthrough/arm/smmu-v3.h  |   6 +
>>>>     xen/drivers/passthrough/arm/vsmmu-v3.c | 286 +++++++++++++++++++++
>>>> ++++
>>>>     2 files changed, 292 insertions(+)
>>>>
>>>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/
>>>> passthrough/arm/smmu-v3.h
>>>> index 3fb13b7e21..fab4fd5a26 100644
>>>> --- a/xen/drivers/passthrough/arm/smmu-v3.h
>>>> +++ b/xen/drivers/passthrough/arm/smmu-v3.h
>>>> @@ -60,6 +60,12 @@
>>>>     #define IDR5_VAX            GENMASK(11, 10)
>>>>     #define IDR5_VAX_52_BIT            1
>>>> +#define ARM_SMMU_IIDR            0x18
>>>> +#define IIDR_PRODUCTID            GENMASK(31, 20)
>>>> +#define IIDR_VARIANT            GENMASK(19, 16)
>>>> +#define IIDR_REVISION            GENMASK(15, 12)
>>>> +#define IIDR_IMPLEMENTER        GENMASK(11, 0)
>>>> +
>>>>     #define ARM_SMMU_CR0            0x20
>>>>     #define CR0_ATSCHK            (1 << 4)
>>>>     #define CR0_CMDQEN            (1 << 3)
>>>> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/
>>>> passthrough/arm/vsmmu-v3.c
>>>> index e36f200ba5..3ae1e62a50 100644
>>>> --- a/xen/drivers/passthrough/arm/vsmmu-v3.c
>>>> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
>>>> @@ -3,25 +3,307 @@
>>>>     #include <xen/param.h>
>>>>     #include <xen/sched.h>
>>>>     #include <asm/mmio.h>
>>>> +#include <asm/vgic-emul.h>
>>>
>>> vgic-emul.h is intended to only be used in the vGIC code. I am fine if
>>> you want to use it in vsmmu-v3.c but it needs to be renamed. Maybe to
>>> vdev-emul.h.
>>>
>>
>> Sure, I'll rename it
>>
>>>>     #include <asm/viommu.h>
>>>> +#include <asm/vreg.h>
>>>> +
>>>> +#include "smmu-v3.h"
>>>> +
>>>> +/* Register Definition */
>>>> +#define ARM_SMMU_IDR2       0x8
>>>> +#define ARM_SMMU_IDR3       0xc
>>>> +#define ARM_SMMU_IDR4       0x10
>>>> +#define IDR0_TERM_MODEL     (1 << 26)
>>>> +#define IDR3_RIL            (1 << 10)
>>>> +#define CR0_RESERVED        0xFFFFFC20
>>>
>>> AFAIU, this is covering all the bits defined by the SMMU spec. But some
>>> of them are optional. Does this mean we will expose those optional
>>> features?
>>>
>>
>> Right now only mandatory features are supported (SMMU_EN, CMDQ, EVTQ).
>> Most of the optional features are not advertised in the IDR registers,
>> so guests are not expected to enable or use them via CR0.
> 
> Guests are not trusted by default. So what is the guest tries to set them?
> 

This could cause issues on the guest side, as it may lead the guest to 
believe that additional features have been successfully enabled (for 
example, if the guest does not verify the advertised capabilities in the 
IDR registers).

I will also mask the bits corresponding to unsupported features in 
CR0_ACK to cover this case.

>>
>>
>>>> +#define SMMU_IDR1_SIDSIZE   16
>>>> +#define SMMU_CMDQS          19
>>>
>>> Can you add some details how you decided the size of the command and ...
>>>
>>>> +#define SMMU_EVTQS          19
>>>
>>> ... even queues?
>>>
>>
>> The CMDQ/EVTQ sizes are currently set to the architectural maximum.
>> Since there is no direct dependency on the underlying hardware queue
>> sizes, using the maximum supported value seemed like the simplest option.
>>
>>>> +#define DWORDS_BYTES        8
>>>> +#define ARM_SMMU_IIDR_VAL   0x12
>>>
>>> I am not sure which implementer this is referring to. But how do you
>>> plan to handle errata? Are we sure they can always be handled by Xen?
>>>
>>
>> This is currently a dummy value used to avoid triggering guest driver
>> errata/quirk paths. I will replace it with a more meaningful value.
>> Using the Arm implementer ID with the remaining fields cleared should be
>> sufficient.
> 
> I am not sure to understand why would that value be unused. Do you have
> more details?
> 

I think that the IIDR is always used by the guest driver during 
initialization to identify the implementer/product revision and enable 
any required workarounds.

If that is the usage you are referring to, then using a generic IIDR 
value would prevent the guest driver from activating any 
implementer-specific workaround paths.

>>
>> My expectation is that errata handling should remain in Xen rather than
>> the guest.
> 
> I am not fully convinced you will be able to apply all the errata in the
> hypervisor. At least with close to no cost.
> 

Yes, this is potentially problematic. However, at the moment I am not 
sure what the alternative would be, as I think that guest-side errata 
handling could be applied incorrectly due to the emulation layer.

> [...]
> 
>>>>     /* Struct to hold the vIOMMU ops and vIOMMU type */
>>>>     extern const struct viommu_desc __read_mostly *cur_viommu;
>>>> +/* virtual smmu queue */
>>>> +struct arm_vsmmu_queue {
>>>> +    uint64_t    q_base; /* base register */
>>>> +    uint32_t    prod;
>>>> +    uint32_t    cons;
>>>> +    uint8_t     ent_size;
>>>> +    uint8_t     max_n_shift;
>>>> +};
>>>> +
>>>>     struct virt_smmu {
>>>>         struct      domain *d;
>>>>         struct      list_head viommu_list;
>>>> +    uint8_t     sid_split;
>>>> +    uint32_t    features;
>>>> +    uint32_t    cr[3];
>>>> +    uint32_t    cr0ack;
>>>> +    uint32_t    gerror;
>>>> +    uint32_t    gerrorn;
>>>> +    uint32_t    strtab_base_cfg;
>>>> +    uint64_t    strtab_base;
>>>> +    uint32_t    irq_ctrl;
>>>> +    uint64_t    gerror_irq_cfg0;
>>>> +    uint64_t    evtq_irq_cfg0;
>>>> +    struct      arm_vsmmu_queue evtq, cmdq;
>>>>     };
>>>>     static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
>>>>                                   register_t r, void *priv)
>>>>     {
>>>> +    struct virt_smmu *smmu = priv;
>>>> +    uint64_t reg;
>>>> +    uint32_t reg32;
>>>
>>> Looking at this helper and the read one, I am bit surprised there is no
>>> lock taken nor we check the access size.  Can you explain why?
>>>
>>> For instance, we should not allow 64-bit access on 32-bit register. The
>>> rest of the size (8-bit and 16-bit) is IMP DEFINED so it may be easier
>>> just not allow them.
>>>
>>
>> Most of the configuration registers are expected to be accessed in a
>> serialized manner by the guest driver, during driver initialization.
> 
> I am afraid we can't trust the guest to do the right thing... So we need
> to make sure this could not lead to an invalid state in the emulation.
> 
> Furthermore, on baremetal, when a two pCPUs are trying to write to the
> same address, you will be able to see value A or value B but not a mix.
> Without a lock, I don't believe this is upheld in your implementation.
> 
> [...]
> 

I see your point. I will extend the locking to all registers with 
potential concurrent access.

>>> NIT: The vIOMMU is per-domain so it is sufficient to print "%pd".
>>>
>>>> +               v, info->dabt.reg, (unsigned long)info->gpa & 0xffff);
>>>> +        return IO_ABORT;
>>>
>>> Per section 6 of the SMMU:
>>>
>>> "
>>> For all pages except Page 1, undefined register locations are RES0. For
>>> Page 1, access to undefined/Reserved
>>> register locations is CONSTRAINED UNPREDICTABLE and an implementation
>>> has one of the following behaviors:
>>> [...]
>>> "
>>>
>>> Here you seem to implement page0 so the default case should be write
>>> ignore and therefore IO_HANDLED should be returned. BTW, you don't seem
>>> to handle page1. Is this going to be handled later on?
>>>
>>
>>     From page1, right now only EVTQ registers are emulated. PRI is not
>> supported, but might be needed in the future for the PCI support (PRI
>> queue registers also belong to page1, but not emulated atm)
>> So I think that page1 will be handled when PCI support is completed.
> 
> I am a bit confused with this answer. Are you saying you will handle
> page1 for the event queue register in another patch in this series?
> 

Sorry for the confusion. The EVTQ registers on Page 1 (SMMU_EVTQ_PROD 
and SMMU_EVTQ_CONS) are intended to be emulated in this patch.

However, Page0 offset is applied when decoding register accesses, so 
these Page 1 registers are not handled correctly. I will fix the 
register decoding accordingly.

>>
>>>> +    }
>>>> +
>>>>         return IO_HANDLED;
>>>>     }
>>>>     static int vsmmuv3_mmio_read(struct vcpu *v, mmio_info_t *info,
>>>>                                  register_t *r, void *priv)
>>>>     {
>>>> +    struct virt_smmu *smmu = priv;
>>>> +    uint64_t reg;
>>>> +
>>>> +    switch ( info->gpa & 0xffff )
>>>> +    {
>>>> +    case VREG32(ARM_SMMU_IDR0):
>>>> +        reg  = FIELD_PREP(IDR0_S1P, 1) | FIELD_PREP(IDR0_TTF, 2) |
>>>
>>> As the page-table will be used by the HW, shouldn't TTF reflect what the
>>> HW supports? This would allow the vIOMMU to work for 32-bit domains.
>>>
>>
>> If my understanding is correct, Xen SMMU driver only supports AArch64
>> table format, so I think that we can't advertise 32-bit table format in
>> the emulation layer even if the hardware supports it.
> 
> Do you mind pointing me to the code? The page-tables are shared between
> the SMMU and the CPU. So we ought to support both.
> 

The reason I assumed only the AArch64 format should be advertised is 
that the Xen SMMU driver currently appears to require AArch64 table 
format support during device probe.

In arm_smmu_device_hw_probe() (xen/drivers/passthrough/arm/smmu-v3.c), 
the handling is:

/* We only support the AArch64 table format at present */
switch (FIELD_GET(IDR0_TTF, reg)) {
case IDR0_TTF_AARCH32_64:
     smmu->ias = 40;
     fallthrough;
case IDR0_TTF_AARCH64:
     break;
default:
     dev_err(smmu->dev, "AArch64 table format not supported!\n");
     return -ENXIO;
}

Based on this, I assumed that advertising AArch32 table format support 
in the emulation would not be correct. However, I may be missing 
something regarding how the guest page tables are shared between the CPU 
and the SMMU in this setup.

> Cheers,
> 

Best regards,
Milan


