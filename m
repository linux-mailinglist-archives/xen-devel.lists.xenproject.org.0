Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VH0nGbzZJ2pa3QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 11:15:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC7965E2FA
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 11:15:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=pjmsP5dd;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1332537.1594992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWsY8-00041B-D2; Tue, 09 Jun 2026 09:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332537.1594992; Tue, 09 Jun 2026 09:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWsY8-0003zQ-A9; Tue, 09 Jun 2026 09:15:08 +0000
Received: by outflank-mailman (input) for mailman id 1332537;
 Tue, 09 Jun 2026 09:15:07 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wWsY7-0003zK-Al
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 09:15:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWsY6-00GkDh-4W
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 11:15:06 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a27d993-5cb7-0a2a0a5109dd-0a2a45088ace-26
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 11:15:06 +0200
Received: from [40.93.194.4]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a27d996-63b5-0a2a45080019-285dc204dbd9-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 11:15:04 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MW4PR03MB6556.namprd03.prod.outlook.com (2603:10b6:303:127::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 09:15:00 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 09:14:57 +0000
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
 b=PCXP6+nOgQs8T1o9LUAs/NR4ADLthiBZJIEh85N8sITV2AFm1xzrPgj5aHr5tgRE9gr0DMrJwOIMOWnZk++XCFLnU/V8aaAY6E98IUNkihI9balyNEukur2gdnlJztb+97/0QYtx80YtWtk2EwZ/oTSla/SQg6Tj+2LwqPrHl5o7Ymh+fle2U/vaaADg17jG4I4eI/e2TElsGG0I71LfaF3o8HsdKLQmrXbu31oMlm2Q78WMpRhDZ+Ol9jGfIPusiv5CfIUMP57pv1xsuAMxfVYjAPc3CMDZmz8HTegEeUKwUKx/JMOuXL9Ngi+E8MxCgFFZp8llkPLM4PhKMNF13w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZV7KmSeTuJVAnHZ9Dcqyvz4GbFhJkaHDoiujCVrTNno=;
 b=pvXe7VquhYrg8u9hO2+jP++XETQTtifMc4rccuzzEf3KIzaY95juK3BscgVf80/8XO+/a0KGmF6p/keOKwZBFB9N1Iqf0S7Ljqau0dI2jdqTVc6sB+xKWrv/w/t55ZL/BhdrrT+mxGZgSwrUZdR3muiyF/oEK6UD4gtNhqZIa6HP+JUIoBoeyC85riBcAQg/U+dQywezOTe+S657YFwG48vZgPlETwPwp0i1DV7wAr4oQ6TliMjL1hZ5vaffGt3zo65AxY607H8TA/ljRxLeWDBPxes507z9NMjcPiL33GQH0jxsJAIFZ21+1JZebj3ibELql0vuYMsNa5OAij41iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZV7KmSeTuJVAnHZ9Dcqyvz4GbFhJkaHDoiujCVrTNno=;
 b=pjmsP5ddU3+Mn55fiVkC3Khw/dBDt60epdUzDzV8Kf0Y1GXK1VhuOmN5hoaEHB7NUnL/fUKQaTlU7CaaPXpNlJz7gJ1n7A4E5lJhWkB6j/TqNZquJXLMdl8DSszYJ5QLemrnyuwCXX4JaGdmvuREsD9wwCRhGPpwj4ACiWfzMG4=
Date: Tue, 9 Jun 2026 11:14:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.22] xen/pdx: fix off-by-one index in offset mask
 calculation
Message-ID: <aifZjKqOrIosqles@macbook.local>
References: <20260609085322.92856-1-roger.pau@citrix.com>
 <a0cfb079-653f-4c06-8004-017c7f60ffee@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a0cfb079-653f-4c06-8004-017c7f60ffee@citrix.com>
X-ClientProxiedBy: MR1P264CA0196.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MW4PR03MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: a730edda-9310-49e5-0c95-08dec6079302
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|6133799003|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	OMLqKHlFHbeUGcPUcTTu1p9mJJdsIbSguSsZsK43W6bITQnVRd9hYUBHycA6xGVtIz3rmJ8iXHZzTUr+Sq6fjZZ9FGL7sWbds5YfgNMhG036QKZKO6zFGyQAgIUJvUrs9QBVZCmKRisWe6NzZT0WRgbKJ+GoXd++pHMAhaejtPyLzSHVEhFv1HX03AeyZBd1Km5wk2/UG1TM8oNh89SeX/5a4mDvpMrHFrT60D6WwaUFJVBSFrINI3h/En/seqKqEqyAYzRhB81Zh8ymg1yWGuXhheQcjdJd4GccbcOSXc2FEYfwTfZ9kfrlOoLZvvpdueZ67nA8/4mn7oidLhUy+0SDUHa2k0OnDA1JDUW+R2EVNhknlQi+u1ciYKPKrtT/hczbGxX53Cou4f5T0h9TyhXf73D59u/HMDbsVJKt6msa3WLGPLOlndTXX4CuCtTXn0+//MtRvmUHdNo4lUTKsqb3FCwvCGd7MuQpKSgWzohE85QEe/G1g0VJ5l0rOngNJPxNur3q5P9TwZo0DvdXu+nS71YD9IG5JEf0iq5jHw4FKqeahnfr04O716nWCp6zvUSSn+1YntkzVrNqWuJm7k3LoEL4WlpXdt3yRUuyBS3A0+VUuh6DJk1w3Tu/EFOV2vTWxDhnUPBmt9oGIXfb4rZz92V3K+0H5j4Itp9G2uooAanoApOw7HQOTlgtVZ7T
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?em9QeWRzK1VuYkpqN09xc1EzZ0g4UDVIMmRuNVJFOHo0aXNzR0dHVVlGbVdF?=
 =?utf-8?B?YWp5ZEFhWjI2RXZEWDVmMVpybVF3alRRbzZoWXY5cVNrN2tyNmtFR240aGJr?=
 =?utf-8?B?eXc2aEI1SS81U1loeEhvdEtDUGp6RFFlcmJvdUFMbjFxa3BCSWQxV1lCbEEx?=
 =?utf-8?B?eml2S3R4eUtxTHF4YjZrQUNuVFQ1bDBkNmdvODNTSzhLMU5xYjNaU3g4OG1M?=
 =?utf-8?B?N203TTBqYWF3dktBZXJWUFVZSkRubGIwNGZTUnlNTlhUZ1FpTWFCVjNYSDd1?=
 =?utf-8?B?U1FEOFdybWlnTGcrT0U2bzdGczEvTm9razNHbm5ETmlmN1AxcTNBQjVyOVVX?=
 =?utf-8?B?bzFCZDEzUGJPYnFyWXBnRXZvNlJDNk1JazBuK3ptVXFudDNYRE5talpteWJM?=
 =?utf-8?B?eTZyb1BhOEJGcXpQQ2VIcStqQkt6Y2Nvc2lGTE11RUJ1Y21oQnlLSHYxVlUw?=
 =?utf-8?B?VDlVZTh3M2V1NnJqOFk5TlkzdnFkbmZkUDkzcnBZakdtVnM4bkIweHZLeWx5?=
 =?utf-8?B?MzNyajNQeXpPTmJsVWx0d2hKRHkxWE9NRDJBZHN5NytKUlB6bXVKTEhndWpT?=
 =?utf-8?B?Ly9hM2l0SUhzZ3Ird1J2cWc2aHpMbmFUVTBGQ2tmT3J6dlF0dnNtSGhsQ0lL?=
 =?utf-8?B?NHdGRFJtZGV1b1h0dWpicUppczBKS2dvVjVyK1lROHl6cjdpTCtvaGxHcmNS?=
 =?utf-8?B?djhsMEI5ZFBnRTRpM1gzK1FUZHFNdmNzWkx5R0FYQk9JdFhQbk9GeHlLNnZt?=
 =?utf-8?B?NUsraGY0SW1hQ0JLVWdXZ1B0STNyRk5FcGwrZmEvUU04TTVoaXZCU0tZc0Nj?=
 =?utf-8?B?NU0wNXIwTUlLS2E5QXJkSkYzZ3lhTFR5Wk1hL2tLTmRWanF1dUl1Uy9nb1Uw?=
 =?utf-8?B?RHA0N3ZQQThISVZqQjZKMlhqZFZjRWRIaUFaaDFhZDZock4yVkYyNFFIYzI4?=
 =?utf-8?B?eFRyS3ZJKzVIVFdZYnM2ak1PaWN3bitvOCtpM0xWNUx4V3dGcGRjUm45WERx?=
 =?utf-8?B?bXVVTEJ6Tm5rdW5rNXpHRGM3VlZLK0RqSmNkcGhUWGhkM3djRzVtaUZaaWx5?=
 =?utf-8?B?N1lSc1BQRlNyNGhGSTBTdlRvbGZUTHVYMTFoSGEyV2U1WEpMWEJsMVp3S3R3?=
 =?utf-8?B?RGYrYjk3UWRDV05KTURxaC90M0pYenVDN1ZUOGNKOGlzd0hRRWRHbGlnNDBD?=
 =?utf-8?B?dThMNlMxYzFlUGRRY2RWZHA1QkNjcHpZQlZLQiszWFJMWjF2RVh0aDYrbGw3?=
 =?utf-8?B?K1VqOGc4RUlYTGpvTDEzd3ZHMHg1M29tcUV0T0grbHptUjI1RHBVbXNIeXZE?=
 =?utf-8?B?MGVkYlREeHcvTkVxdmxxbHdmYkd6QzBaemZqRkZEVml5VnI3a2RxQUEvQURj?=
 =?utf-8?B?OXF5Y3hiclBxMXdzdDhPYzdKSEM0U3lVSk9ReHNlREU0Q0ovVmJBWnZlcjQ5?=
 =?utf-8?B?SWRmVGl2N1dtUm5DcU45Z2JWNTVJS1ByQVBxZ2ZEUHVuNjcrT3V5YmVLNmd1?=
 =?utf-8?B?QXBmWThWZFpDWW54SWg3SThXZmEyOTFUWlN2Lzd0dWdqQ2ZwNzlQU3ExTWtZ?=
 =?utf-8?B?azNqUGt5TWJoSmtsSFR4ejJJeFhWbjNoSFVTTHR0S1JtQXoyM0poeEdNVUxT?=
 =?utf-8?B?elovV2grNnJZb0YySWxNTUQ0RUs4ckRtRjBXUEVhMDYxdjIveEdXMjVtN2pm?=
 =?utf-8?B?MWN1WlA1NXJ2MFI1UjVjaXlNM1QyVWtwdmdiY1gxNGU3SzdZUXhBNXdRcnAx?=
 =?utf-8?B?REVQazBlLzl2Sy9oSjR4V283eFpqaE4xK1p2empITjNQYjc0OFJnUGJ2MXRU?=
 =?utf-8?B?Vit3U3VndStkbTFGakVVNTg4RDh2cTNiWWFrM1ROdFYwOGs2WENIWnAwSHpn?=
 =?utf-8?B?V0VhK1NqNUxobE1MVzljeVdFNVhVcXpTUW05d2hwTllseE9GNllUL1cxTGxO?=
 =?utf-8?B?TnZKVHRDQ3N4YTNWWlIraVFGbFp4Ym45Ny9WWnhTM3Q4aDljTzhSbTBxTEtp?=
 =?utf-8?B?TFE5TGJzUjBBRmNTL3RoMFBGSkJKQVdkVGJCNjg5ZmE4dTd6N3hYSnQvbXFi?=
 =?utf-8?B?MzNBbTV6VmpONjdJWjVEUUxCcTVGSEszdFBldFl5NEErTXJod0k5Wlc5eFNq?=
 =?utf-8?B?bUlWMTJVL2NNUWd0QXJZaWprdnN1bk5Sa0xYRUUweUdGL0Z3YVduWlhQd1R4?=
 =?utf-8?B?WW5GWjFRcm1pSmFDQzBxY2I1ZkF2c0ZyU3BNeVF4aGZsWFU0WXpHNTNuS2o0?=
 =?utf-8?B?RXZsQk1FQy94d2JzeUJiUXREcUtTcjFZTGVpNmtNYkU3RHdlWWpXTUJNeGtL?=
 =?utf-8?B?RGtVZkVJemh5K0dnZURiWTVWUFpzVTdmTDhtY1dIbmZ3QmZsZWpRUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a730edda-9310-49e5-0c95-08dec6079302
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 09:14:56.8675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: parOHgmuJgr+W5CPG6n9YgG1doJjM+QewfQ8Fr6qit+lUDn3CZttKhOSY8w7glcdoMD0bblcAXFJqSDDQL/7wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6556
X-purgate-ID: tlsNG-c1860d/1780996504-BCB64DB1-F84284FE/0/0
X-purgate-type: clean
X-purgate-size: 1649
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AAC7965E2FA

On Tue, Jun 09, 2026 at 09:59:37AM +0100, Andrew Cooper wrote:
> On 09/06/2026 9:53 am, Roger Pau Monne wrote:
> > Adjust the mask calculation in case the last range is merged with the
> > previous one, as then the mask must be calculated from the previous range,
> > which the current one has been merged into.
> >
> > Instead of fixing the off-by-one in place, move the calculation of the bit
> > change mask to the next loop, after the ranges have been merged.  This
> > simplifies the logic by consolidating mask calculation in a single place,
> > possibly making it less error prone in the future.
> >
> > Also add a test case that triggers the bug being fixed by this commit.
> >
> > Fixes: c5c45bcbd6a1 ("pdx: introduce a new compression algorithm based on region offsets")
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> > diff --git a/tools/tests/pdx/test-pdx.c b/tools/tests/pdx/test-pdx.c
> > index d783186577ef..ba57f1793011 100644
> > --- a/tools/tests/pdx/test-pdx.c
> > +++ b/tools/tests/pdx/test-pdx.c
> > @@ -191,6 +191,20 @@ int main(int argc, char **argv)
> >              },
> >              .compress = false,
> >          },
> > +        /*
> > +         * 2s Dell R740, merging of ranges causes mask differences in PDX
> > +         * offset mode.  Useful for checking mask calculations.
> 
> What's the 2s here?  If it is what I think it is, I'd suggest "Dell
> R740, dual socket,"

Yes, it's what you think it is.  I've used "2s" in existing comments,
but I'm perfectly fine with spelling it out.

Thanks, Roger.

