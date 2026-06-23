Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O/iwBI+sOmp+DQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 17:55:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3AB6B87C2
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 17:55:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=d9KMEU85;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1344385.1603461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc3Sh-0007S0-Ty; Tue, 23 Jun 2026 15:54:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344385.1603461; Tue, 23 Jun 2026 15:54:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc3Sh-0007PR-R2; Tue, 23 Jun 2026 15:54:55 +0000
Received: by outflank-mailman (input) for mailman id 1344385;
 Tue, 23 Jun 2026 15:54:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wc3Sg-0007PL-1D
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 15:54:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wc3Se-00876K-L9
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 17:54:52 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a3aac32-bab6-0a2a0a5309dd-0a2a4502b268-26
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 17:54:52 +0200
Received: from [52.101.62.47]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <roger.pau@citrix.com>)
 id 6a3aac4a-fdf1-0a2a45020019-34653e2f3408-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 17:54:52 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CO1PR03MB5796.namprd03.prod.outlook.com (2603:10b6:303:9a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Tue, 23 Jun
 2026 15:54:47 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 15:54:46 +0000
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
 b=q3+iJGAeH8rmX2OdQrW2O18OKeUf8gPT3Xity+hGrGRlBRutFwUlUFUUYJ9ERt3VaqsZkQS/Q80FAvNv0jRR9BonPTges+PoDevILEsLuVNwghBkSacQNSUT4nEPogtkgEpxBG2q3spRRCRPnJA6+PqjFwY+v99SmUXgklULWdZrye0vPUqVwP+ZBnFbT+OGFD+jC+7hyRMbv9ZJ4hGaIzQ2+sp/IqoGMWsSJPEayTmhP6da/nyV6z8e4UpdxwFGjjLjz9l2BfyLTkjecSbo+rJseTyBF11uPiyb6Yo1Zmq8foOz/jnsUctJ/vbH5mgw4LRYo8FF43DuJqCcr6aY9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXuCzbMX/ENnDpKQCKwt9ujwVFhguyA4J0l3U/wMC+Q=;
 b=jltL570RbFMfJtyVa03V+lDileDSroLSU5IDduKv4Q4JVQthOa0O+iLFofg03oAbZ5HG90dgqEJbrTf86j4HrMqAnnYve58FXOS9GCU1f2tSSohJ81SGbzN+8Ctrp9y2iaAGYOROc45pBs0W0xV4zMz963/t/UF5dBMkc38zjAl1Z+jVA9AqTmb/zd9NThp2cymPMQqxgcGtPrqFzp5628Jpn18fU7cEWlhSLCZ8+H2HTu22PKx9PddpVz095jB2sDVOjq5henM0aVWqMl/koYcgzu3jtAX/nVGu6zcGJtgJpgDLD+kLFWxoeaDvt64y3MqI4820rjNXFyEsF7mwSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXuCzbMX/ENnDpKQCKwt9ujwVFhguyA4J0l3U/wMC+Q=;
 b=d9KMEU85VSMDjix9sEaLM9Lw94ReMtb+D2AL0aKjDIOpcvCYy9GAq4LaC3Z/sxIuVbuyyqjOXf6Sh7G+HGkquSCvovcZETXKR3/P3Be8qiw9dTRkS2IOiE+/d1RTy4upKxbmSgYpKn0mhRUerBr+kGQJkzsbGEK+GAMWb8sdU3w=
Date: Tue, 23 Jun 2026 17:54:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.22] char/ns16550: bound execution time of
 ns16550_interrupt()
Message-ID: <ajqsQr-bhf4SGf8Q@macbook.local>
References: <20260623103145.76383-1-roger.pau@citrix.com>
 <06c8caab-4722-4b02-991f-bdc4a4ac0ea6@suse.com>
 <ajqVNtt02XMUGk-X@macbook.local>
 <cdf9f154-896d-4faa-8c76-ca15cf5e706e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cdf9f154-896d-4faa-8c76-ca15cf5e706e@suse.com>
X-ClientProxiedBy: MR1P264CA0164.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CO1PR03MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: a62d42af-9293-401c-72e9-08ded13fbfb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|56012099006|6133799003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	Ln7mIgjVwLtdfdjCZyf3AgK6iGfyjvswc8q3jhdKJM5sNHGN4gQR4N1DGiGHXRaSviCbFVGM5f31k+EFeVwXAVB8n90ZGw1sBZ+XGmrIkmlKoQvgLNIb6wmgXN6TZG1UDWrB0RLJNN5yOMfsrNoiWT61qG1W/Q/wOOUmmNbAKKd3sSIInQ0F2USexpLRj/4Yb4kxKcUhfJ7X1cs9tucGLriwGYyf9SU8w0kdiJ62fiP4uGmde+1reDPm4XeADPLnVLMKYWU6YJBbQu7WhgL63GkLT33zx/3liYuZi6nO+uE01lcWHZs/QJNpbWPO3anBsiozZG8ppykN6IacxIyzytFIYtQ1Lkzch3KYCnU31as4ywY1SvNF2R6nPEnUHtjGef5HcdFk73yojvyaUW8/OcvsUuJHNOOsFXgmc7nEaR+U5GBUuFR4DJcion8h6ba4Bc4AB9w9ZxZi287fSPX/EkAZLDmb08cQXNfxMFLyvV0zCy+hlHz0ondDCdAY///0bBtXtouM9XR9caTeGV1t1ORl/iixo85p924cUvBdGLaFp2ki0kx7306BFwTTQRgDPiNeVzEwbls7nb8n/nZVGSL1m1m5EmnqlzzUSO6BjIiqNYtRU4Nrfkw+u75BQE+NPrbRy7jxnlzSG7t2vUaX3Xuj3R2YTZ+EUgDx4sxnG6I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(56012099006)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjdaQTdWa1JDekFEeU9aeXlqUDl3b0NmOVlJN0tJRUdBeE9rcU1MQTZDbC9U?=
 =?utf-8?B?Mi9mYnJMSlhmYnE5NVVlOEpSU0lrcWV0dTlpdjdtUEIzUUNXRUtCVmROOFlJ?=
 =?utf-8?B?R0FUYW9DcFR4aEg5UkFHOHBCR2UzWG42QUE4S2tkOWhhY3pQTmQxYnozWkRQ?=
 =?utf-8?B?TEZPTlkwd2NKU29BTHcvRjVmUlpsZFpHR3FNbExpMTZpVGV2bm1mY0FKVkN1?=
 =?utf-8?B?c0pzd0d6TmFLdjBEYmkrR0JTbjZ6WjRJbHZXL1JIeVBQMURtS2xQK09XemIz?=
 =?utf-8?B?QzNLLy83K3hPdHBCSmF4UnpSc21OWWRpUUhDdTFXTzIzbnlWYkV5OTRvV2Ns?=
 =?utf-8?B?RHVYeEp3Uk5HbXNPQ1BFQTk1cnd4aVlTWE54KzAvSkllSWM1a21CdEVZbGJW?=
 =?utf-8?B?aWsxNVcwMkF6VjhxbElBUEFZSEFGRHhUMTRrZDZ2b0Q2QktMUk5Ob3Z2b294?=
 =?utf-8?B?QlMvd3RzUmwyeVdwK1V6K28rU3pRbDhMVHFEbXlUTS9tR09zRHQ4bEhsUGhh?=
 =?utf-8?B?RG9CK2YrUXRtR1dOL1ozbUNYdk90cnFiUVF1VVZ5bWJZTHF2TnJZTmZCUjRx?=
 =?utf-8?B?ZE9zZlU1M0YzZmdSZUhEZ1ZxZmtpNUJVcTloRU12cXRCU0twanR5Z2hBMmh1?=
 =?utf-8?B?Zm8yVVp6NnRqYTI3QUVlSEs1MzQ1SVFoMXhSNm5TTU1BZmRJVEhlT1V6TEJI?=
 =?utf-8?B?Q1pibFJ1U1NiOGRwbXoyR091WGFGTWpLVjQrQUFIWDErMURyaVhYMFdYdzBX?=
 =?utf-8?B?L1UrWXVXSnVScmVBb2JEa1lIUU9CbExWc3htTU9jaVRJV05yVk01eE1jU29q?=
 =?utf-8?B?dUx2TUVsdC8xWnFmdVBGMHhRZ0N2cisvNFNLV1pwWmMyUFg0ck13ME9qUXRM?=
 =?utf-8?B?SDEwbXpDYkhaS2lBMjNYZ2hTZStiK3VWbTgzQk94OS9TTys4VU9XMFErWUha?=
 =?utf-8?B?SnE0V1U0bU1ZM0VWSzBTb1pSU0UybDM2SktjQm4vcHdpbnUwdXdwN285WHp6?=
 =?utf-8?B?djdDUXhGMTlYdEsvaEZUOXQ0ZWl6YXB5eW5KVU41WFdheFlsbG4rNDNqeXZ5?=
 =?utf-8?B?cFNXME5XaU5nckY0QmovUThyWjVIdjJ6Kyt4dWNSbGdTdkFpWUZNdlNYMEY5?=
 =?utf-8?B?UzhKTXYxR2dIUFNhU1FyeWxSTmQvMTRsZnk0bFpSNXFxTnRXbldLRDh1YnVr?=
 =?utf-8?B?UnZUNnJKL0tOdnY5dXNheitLV29XNVFldkVZL1lnRnpIVzdPYkM3K28zZFRB?=
 =?utf-8?B?T2REUjBGc0lwZ1FrRjFlVFFjQ29QYkpudGtSeExPcTI5SlA2QUErMUlYMU5H?=
 =?utf-8?B?cUZJSDhUTEdrK0Fta1dmWkRxaDRjZU5mNXlLMmNUcEZpdk0xNGN6SCtnK29K?=
 =?utf-8?B?RHUvM3orSzAvaGJrWlV4alNjR2RVbmE4Zk12aHQ0eEJWK0tiQUloVHdnZmtx?=
 =?utf-8?B?S0VtWnpGeDRVK3A5LzhzUUU2VUwwM2hyR3YyaGNHZXVvMGJoQXZUd2h1Nzc5?=
 =?utf-8?B?dmxHbDlEQXcrUjhqMnFZL01CeHpXZkptTzV6cC9pWDNObWJuS2lsQVZYTVIx?=
 =?utf-8?B?LzRwMHIvZUN2bytQbml3WDVRUC9tSTRNTUFZNSszdFJIZXovWGdMZ1l6WnZu?=
 =?utf-8?B?OE4zWmQwU3NxbVhmNXRtMmMrejE3Z3dpVVpRNFVJUVdNVVp5d1NvQkR3cjVV?=
 =?utf-8?B?d0VUUktleHY1dzF4S2RjTlNFYnl0ZDlicGJJZTkxQUF6Tjl3b3ZzbGQ3bE1M?=
 =?utf-8?B?NmZvMDU0aDJJK2hacmZLcmUrYThBcnE2UWFta2ZCZzBKZWFOSmpYdGZUSXNv?=
 =?utf-8?B?RW04VnZkSExRRE0relJoR0c1blRFenVVVllPMWl3dmdDa05oNWd0b2RMU0lo?=
 =?utf-8?B?VlNkT3R5bk55Umt6cXF1dWw0REw1QWRUenFCWnNESnpZaW1QQ0VqRWRLNy84?=
 =?utf-8?B?Q3JKbjVrcnhIRUV4azFLZmd1YXBEaXFMVTFRemp5UW9va1gwUWFHZ1hPbzdz?=
 =?utf-8?B?UG5xWG5BQUY2SnpUOFpoOTJ0K1ExMlBqZDd4aWpiblNhM3ZEKzVmdjNWcHFD?=
 =?utf-8?B?OGpzeldDcU8xZks4L0JxbVRBZ0RHMEEzRVpOSkNlVmd0VDhKa2JOeWZMalEy?=
 =?utf-8?B?TGpLcHlOWWsvbFJFVTJsTUhueWMzN0xrTHZkRU01YVJuZVFpb3ZNb0hub0Js?=
 =?utf-8?B?UTQ3OUlRRE14d3VkTDJNT2hVemt4UE5FVHk1VUJlSTFUT0E1R0tnekc2NllI?=
 =?utf-8?B?M3NNQ25iYm01TGNESG9xYUtYTjdQaUlCa3p5Um5XMlJ6by9sUzdUdmVKUjd6?=
 =?utf-8?B?UWxtRVBSampkUU4zZFV6UnFuc1dMM21Eb1g5eFB0ckpOaUtuaVdidz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a62d42af-9293-401c-72e9-08ded13fbfb6
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 15:54:46.5687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9QqD7l4cTDXcBRuE8h0Autd0vedFbPtnFWC7r5JVylSlEvocBNqA6Tj8RUBUZzL3xNf5ZH7LMWg8C4x9NGrNfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5796
X-purgate-ID: tlsNG-720697/1782230092-3FDD23F3-9C74C1AD/0/0
X-purgate-type: clean
X-purgate-size: 1859
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
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
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
X-Rspamd-Queue-Id: 5D3AB6B87C2

On Tue, Jun 23, 2026 at 04:27:12PM +0200, Jan Beulich wrote:
> On 23.06.2026 16:16, Roger Pau Monné wrote:
> > On Tue, Jun 23, 2026 at 03:44:06PM +0200, Jan Beulich wrote:
> >> On 23.06.2026 12:31, Roger Pau Monne wrote:
> >>> +    if ( uart->force_polling )
> >>> +        return;
> >>
> >> As the IRQ was disabled, is this even possible? I.e. should this be some
> >> kind of assertion or alike?
> > 
> > Hm, I wasn't setting IRQ_DISABLED before, and hence needed this guard.
> > But now with IRQ_DISABLED being set in ->status do_IRQ() should filter
> > any stray interrupts.  I will attempt to add an ASSERT_UNREACHABLE()
> > here.
> 
> Simply ASSERT(!uart->force_polling) should do here? It is not wrong to
> run the code below in release builds in such an event. If we kept getting
> interrupts (perhaps at a high frequency) we'd be in trouble anyway.

No, I'm afraid I can't do it like that, I can't put an ASSERT there,
because we can still get into ns16550_interrupt() after the interrupt
has been disabled.  In do_IRQ() we have the following loop:

    while ( desc->status & IRQ_PENDING )
    {
        desc->status &= ~IRQ_PENDING;
        spin_unlock_irq(&desc->lock);

        tsc_in = tb_init_done ? get_cycles() : 0;
        action->handler(irq, action->dev_id);
        TRACE_TIME(TRC_HW_IRQ_HANDLED, irq, tsc_in, get_cycles());

        spin_lock_irq(&desc->lock);
    }

So if the device is generating further interrupts in the window with
IRQs enabled (while we execute the handler), we will keep looping
around this, without taking into account the setting of IRQ_DISABLED.

This is something that we might want to fix, so that the loop is bound
by IRQ_PENDING being set, and IRQ_DISABLED not, ie:

    while ( (desc->status & (IRQ_PENDING | IRQ_DISABLED)) == IRQ_PENDING )

Regards, Roger.

