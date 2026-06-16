Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lnLcH/kgMWqAcAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:10:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD56B68DF0A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:10:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=YPvzXVmJ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1339029.1600138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQjn-0001kk-Tt; Tue, 16 Jun 2026 10:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339029.1600138; Tue, 16 Jun 2026 10:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQjn-0001iy-Qv; Tue, 16 Jun 2026 10:09:43 +0000
Received: by outflank-mailman (input) for mailman id 1339029;
 Tue, 16 Jun 2026 10:09:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wZQjm-0001is-0G
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 10:09:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZQjl-00GCsr-D0
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 12:09:41 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a3120e1-5cb7-0a2a0a5109dd-0a2a450ab2de-8
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:09:41 +0200
Received: from [52.101.53.4]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a3120e4-56b3-0a2a450a0019-34653504b7fe-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:09:41 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BLAPR03MB5588.namprd03.prod.outlook.com (2603:10b6:208:290::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Tue, 16 Jun
 2026 10:09:39 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 10:09:39 +0000
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
 b=vAN5w2xCYg0kA3b9BXf4Vj6MegA95OHouTl1TQa/QS7XeVbeg37n0xy2o7Ec47A9tmtdMn6U6UcOtc9KPsrLWG+NGJU/C9H+aWYSikMDQFuaOUg+mL8t6yvp1VSKitaAW+E6Ntqgf7s9flniZ+9jcRER+PuTyy1k4od1kXPtEhIvr8lImjkW2akRYttAr6hYE6/GMiqCdEygxDH6esyPOESebslw4HLQA2caZ82IBhG0hkN3/c3tP+FBeKZHDzJuHXiXRFBZyRNM2aEyR+S7+V1QOb6AfM9iRMq3WsPyCEoLmd5HAra0ttue9YyFyaqcTD0B9eqHM7TMMLK4D5ur9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2DM5oA962p0FCbZ79ZqsSjpfWuSDMGjke80jnPspQc=;
 b=anrUhWFCvJ8f4Fzp85xcumNQptEQmmA/dC+mBGx7b+G9+Ty3pv9siWQh8qO5EaQutLXJJN5u2u2EWh8UxfgvLfNG/DHCvJPUTm5CS+JpAqQqRk3hUs2QxP/uf9ipTiAm4gruSqsjSH23DSJySFLT8z3Kvr1YiN62DNcKR4RIfO2V6ZE8L1BRAuWRoUHkRHw7QJKqpM1Hv8NmH0ai1lSTgnCIu0Hx09pn3ZV2U2n91X0Aw2Uh6LLuQztjRnWa51qAToOJ3piyVmdhK30PaFpAF75LeSsqZ4ycBE4X3jekugk8aKgAX/Znat0M72njBB9fOahnw7hyPdqbghmB11lP8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2DM5oA962p0FCbZ79ZqsSjpfWuSDMGjke80jnPspQc=;
 b=YPvzXVmJx3pX8xv71zneStps2Yt/EkV/CIZ9dsqdKSd28lXsVz3UalKVHXlvWureQbskxdXV1RQCoDUNwD2i8+ns2FFx98OsVqXASvHB1oNJu/HCnVYHbtMiqMjK2xXxGFv3duu6PlwJUMn149E8NDWAMN1/bIfnoGoXPCVCeX4=
Date: Tue, 16 Jun 2026 12:09:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH for-4.22? 8/9] x86/domctl: don't imply I/O port
 permissions from I/O port mapping
Message-ID: <ajEg35K0t4igVhmX@macbook.local>
References: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
 <a88eb54a-f0ff-4ad6-971f-ae526297a15d@suse.com>
 <ajEVgN9h78QFh6mZ@macbook.local>
 <532152af-30fe-4a70-afbd-b0b5c1d1382b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <532152af-30fe-4a70-afbd-b0b5c1d1382b@suse.com>
X-ClientProxiedBy: MR1P264CA0177.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:58::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BLAPR03MB5588:EE_
X-MS-Office365-Filtering-Correlation-Id: 635766cb-5e40-4619-4cb7-08decb8f6027
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|6133799003|4143699003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	GKfIKloW0kKILKl4JldsLYUfa0X09RsEqj0wf8oMWkRgJIYTVqmmbaYAQ7MNyxc8Bgn+j1MC8Qsx9WZOYQj7mJNdz2FPRvRstbWOmAxZ/pZkWXNPXalSjL0TVqbTR4EPVjwrhoHHakqJ9RksiT1Ioh8kpMZtFuCT5AHBWCpM4oFuQXTRpiNvUIpw6qsnAw+vULZ6DrXwDl+rW4OKX4Z472jqphddZ/dPY6CJZKOriLgMlfc+CI3gxRb4nujDDv201y5eWqu/yj4nQ1BzsUud/aeqW8jEJv68RwbU1SmcZalk4v3miUPQUBVuBnR4TPtoGasEIjSTV3bPaapSfrf7HfbCjn8hSSZ57EScSs0glBJeOkgry3GHChT7ouuazDxJ+LKj/PSr16SPmQyigz7eYyejFHIZxd8jhVOx4zhQvUYg/kfaVTixB8YMLL9Q0iQOdH067Wgghy+XTm0dyl2ynnoTeoLGKIBCeRAmBA+WK0D0VatlAAybasr1gTsxCGuk5j9zjSADBvSzcz+WdAIImKooa50x/oH/anhSADndFshSWtzejnXeVK++VZ3LwtaEV1VUgXa4pOdrNbNpinFLIMfu+sW5ciV2wbfTJutz3YFD1Gvifk+yqGD4WE15K7H/7xJlnpufvgDsDaYFjKCV+jiOZ4JUaqCEC56z6UlCfXEOhng/gwtbeCJcql4NHbnW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(6133799003)(4143699003)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWs1OTlLV0RTYmM2b1Q0S0VBdXlkVW5xcExOQ0IwbDBKMDR4QTNHRmpiRkto?=
 =?utf-8?B?aFlsN1dpakZuU28rK25sMzA3QlZ3WkQ3OVp3L3lpallZWEFUVUhRaXBOZlp4?=
 =?utf-8?B?QTR1OVlPc1FOVDVvcVhYTlovekpQcFhNVW1jajNNbXZHdlkvSndaeFdUdGh0?=
 =?utf-8?B?ZWxzenZjL3ZTL2ZjR0x6U3pZbHc2TytiU1pGUXM1TVN6aXh6WVo4emhvT3da?=
 =?utf-8?B?c1Z2eFdCdzZRRWpvTUpGbW5yQnZndUo4OWpTOXp4MjNKMHNxNmhqbmh5QTJx?=
 =?utf-8?B?SEt2aEtrMVVyenpsdGtMR3JRWGp0RzZ2VzliOUNwbm8xejZRUkI1ZEsyY1Er?=
 =?utf-8?B?NU13NVdpb2xFWkNjaWNibHo0dUZkckE2dEhNSDYvMmZJQUEwSWJxMVZDSjJ1?=
 =?utf-8?B?SDZyUFcyWjJtV0xqWEdHY1FzYlVNZGVzaStTMUtTMVNwMmdRS1FZT0hXU0wv?=
 =?utf-8?B?WUVrcE5nLzgvVzJTbXNNeTMxMkhYbThwdDk5QW9Cb0lBSlVFYUdqVTFFb0Rh?=
 =?utf-8?B?MnZhZnM4UGd0Q1AxeVVWM3c2NXlDd09rd3BCbC8xTVJMaDk1SjMyZktieVRW?=
 =?utf-8?B?Z2NidENHend4Qk9xbnByQ3BNZHBVTXI0eDFkTGJFK0Q2b05sUTVNaHExTXl3?=
 =?utf-8?B?aW9naWxDMXNoSHl4SjBzYWNPeG9MVUVEbThZYmF5ckg0cEFodkU2dTBCV1RG?=
 =?utf-8?B?YmRjK0E0TmFoazRnaUorc0pmTi91ME5jVDZsSW0xZDVtaFRoemtoaFE4V0tC?=
 =?utf-8?B?U2J1YWoyR1BXcEdZZFlxaHhheWwzaVVxeitXOHZWbWNHSjhVUG5mN1dIZ2lB?=
 =?utf-8?B?QTVRdDNsV3haYmsrNXFnbFFteXlEamlnc0MydXFTWEZPS3gzL3FHa3lMcTNi?=
 =?utf-8?B?SEpqeHg5S2NVMi8xNlQyeHV4NjcrQ2o3WjFmam5Sd05FdFA0NUhBTUcyK3Fk?=
 =?utf-8?B?YkR0MFd0dW5oWUNRZ253N2xraHhGSWdCczZqY3JGcUZDeWhVZHphcjdHbjdJ?=
 =?utf-8?B?VW5DZkwzU3FTL1hubnI5ellZcTJFREQ2NE8yT29uKytvZ3hNYXpzTFRkM21G?=
 =?utf-8?B?TzYyQjIvdHBYUFoxcXRWVEQwcU1IalZPekFZVkFzdm82R1VzNkdnS3MwLzl4?=
 =?utf-8?B?MlFLY0tOaWhYaURqdnNzbGVGMm9nV08zei9sMjdVcUcxcUtBLzd6TXVlU29o?=
 =?utf-8?B?Z1RscnMvd0pBcVRaUTRJczloYmFzMWVDUkZQU3E0UnBpV3VYYlIwOTVxM0Qy?=
 =?utf-8?B?VWRiT2FLOFc2M1VWcnZ1L28rRHozOXJYTGNjayt6OFlnU2FpRkJLRE4zQ09t?=
 =?utf-8?B?bGpxc0NYK0tOS2xKeDluOTAvTDU3dm1yT1lHRjd6Z2F0ZnVvejBLM1dPbXVw?=
 =?utf-8?B?T2lFM25xWEVFa1RuVW4vNGNxcXk5bCtNRkdXZE1VVUh3QW1Pb0lmY2s5K3FV?=
 =?utf-8?B?RXBQdmxQaUo3cTdETWVHczNXbDZ4MHZ1ZTUxbGV1dWRzcWQ3UytKNVJESW9h?=
 =?utf-8?B?VHgybFdhcjVSNzZKVWxKc3VzbDlXUGV4WU0zWDdESVE0eENIYkhBckN2anBt?=
 =?utf-8?B?ZTNYY2h4WWxwZnl2NFVGRWJkdjVScUFhQTlMZ2pCbTRqS05zTGxIYzlPN3lr?=
 =?utf-8?B?SldLYWc1TGdaVzZTV2ZqTmRiTFl0WUN3VDMvV1VOd3RtMHdnNTRvNmpGRWRh?=
 =?utf-8?B?NVk0djYvYzlaOEtoYzViWEV6dzZNS0JyekF5VGgvaSs2YTUzU1N2TFYxa0RJ?=
 =?utf-8?B?b2NjdEg5ekJoeFV6UjRMK2oxS1ViT0tpOE1sc3daVnZuUDZkaDhYL3ZEQk9u?=
 =?utf-8?B?ZDNpaTV6Wko4NjF5RlBRbHZtdXV5VVp6Q0V0alNrQlpLSnRKeHN5WlQvdVpH?=
 =?utf-8?B?Q3lMZ1hhMG1xMTFRNFZObDY3bEw5WTZZdkVjTk8wMFZDcnYwS0NWaEpBSGVl?=
 =?utf-8?B?Q0dlUnF6WlNxZGgyd3JBQWQxbjl4MUpzdERGa1lZckp0d1pEenVrRlhndnhW?=
 =?utf-8?B?bFVIVVVzbmRpUGVVS09lTUd1cFFxNWFuVlpVallRZ1BGdkVYU2FMUHpYcW93?=
 =?utf-8?B?VUxpNmlUM1ErWkduNWhkckhCc1Z6bjB4VkdCQ0lmUWIyOWZPcStORU0wUTJn?=
 =?utf-8?B?VEJ0L1ZpYkt2bStSVndFOEVLc2pyaVhUdDNGaFJkN2FTazJDd041Z2tHU1VJ?=
 =?utf-8?B?YmhIeHlSRFpjSEhuUVpVVU8rNkZxeXJTN0hqMDJZdll2MENOQ1pydE1VWjEz?=
 =?utf-8?B?K2lVcTNHeHgwUjFOK0N1eGJjLzVnOEZvd2ZTSWd4NWJRa2ZpY3p3VzF5dEZl?=
 =?utf-8?B?QndBYlNFU25LWEhudGNmUkRWcTZVWEZIUm9aNXVwM3dZZklRSWRldz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 635766cb-5e40-4619-4cb7-08decb8f6027
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 10:09:38.8911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: krdGst+SomCFOAof8k1QkV80AP7BtDOY+DmI/CvC6z9cf/AMq9XLKudhEmmfqXdTwKqJcEg73JbPj7OGbHImVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5588
X-purgate-ID: tlsNG-4011c0/1781604581-725748B7-E39997E2/0/0
X-purgate-type: clean
X-purgate-size: 4321
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:oleksii.kurochko@gmail.com,m:anthony.perard@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,gmail.com,vates.tech];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,macbook.local:mid,citrix.com:dkim,citrix.com:from_mime,suse.com:email];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD56B68DF0A

On Tue, Jun 16, 2026 at 11:36:53AM +0200, Jan Beulich wrote:
> On 16.06.2026 11:21, Roger Pau Monné wrote:
> > On Mon, Jun 15, 2026 at 04:16:11PM +0200, Jan Beulich wrote:
> >> Rather than granting permissions when mapping (an operation that DM-s are
> >> allowed to carry out, while they can't invoke ioport-permission), check
> >> whether permissions actually were granted when adding a mapping. This then
> >> also allows relaxing the necessary locking.
> >>
> >> Fixes: 192c4dabc344 ("domctl and p2m changes for PCI passthru")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> libxl has libxl__grant_vga_iomem_permission(), but I can't spot any I/O
> >> port equivalent (nor a revoke counterpart, btw). Everywhere else MMIO and
> >> I/O ports look to be treated equally.
> >>
> >> Qemu uses both xc_domain_{iomem_permission,memory_mapping}() in
> >> igd_write_opregion(), but only xc_domain_{memory,ioport}_mapping() in
> >> xen_pt_region_update() and xen_pt_{,un}register_vga_regions(). Is the IGD
> >> region special in any way? Clearly this can't work from a stubdom.
> 
> Both of these remarks are relevant to your response below. I realize I should
> have Cc-ed Anthony, for him to comment on them.

Partially yes, but those are only for the callers we know.  My comment
was thinking about possible out-of-tree users.

> >> --- a/xen/arch/x86/domctl.c
> >> +++ b/xen/arch/x86/domctl.c
> >> @@ -714,9 +714,14 @@ long arch_do_domctl(
> >>              break;
> >>  
> >>          hvm = &d->arch.hvm;
> >> -        iocaps_double_lock(d, true);
> >> +        /*
> >> +         * NB: The double lock isn't really needed when !add, but is used anyway
> >> +         * to keep things simple.
> >> +         */
> >> +        iocaps_double_lock(d, false);
> >>  
> >> -        if ( !ioports_access_permitted(currd, fmp, fmp + np - 1) )
> >> +        if ( !ioports_access_permitted(currd, fmp, fmp + np - 1) ||
> >> +             (add && !ioports_access_permitted(d, fmp, fmp + np - 1)) )
> >>              ret = -EPERM;
> >>          else if ( add )
> >>          {
> >> @@ -747,15 +752,6 @@ long arch_do_domctl(
> >>                  list_add_tail(&g2m_ioport->list, &hvm->g2m_ioport_list);
> >>              }
> >>              write_unlock(&hvm->g2m_ioport_lock);
> >> -            if ( !ret )
> >> -                ret = ioports_permit_access(d, fmp, fmp + np - 1);
> >> -            if ( ret && !found && g2m_ioport )
> >> -            {
> >> -                write_lock(&hvm->g2m_ioport_lock);
> >> -                list_del(&g2m_ioport->list);
> >> -                write_unlock(&hvm->g2m_ioport_lock);
> >> -                xfree(g2m_ioport);
> >> -            }
> >>          }
> >>          else
> >>          {
> >> @@ -772,15 +768,9 @@ long arch_do_domctl(
> >>                      break;
> >>                  }
> >>              write_unlock(&hvm->g2m_ioport_lock);
> >> -
> >> -            ret = ioports_deny_access(d, fmp, fmp + np - 1);
> >> -            if ( ret && is_hardware_domain(currd) )
> >> -                printk(XENLOG_ERR
> >> -                       "ioport_map: error %ld denying dom%d access to [%x,%x]\n",
> >> -                       ret, d->domain_id, fmp, fmp + np - 1);
> >>          }
> >>  
> >> -        iocaps_double_unlock(d, true);
> >> +        iocaps_double_unlock(d, false);
> > 
> > I think the new behavior is more sane, however the problematic aspect
> > of this change is the removal case IMO: we cannot be sure whether
> > existing callers rely on XEN_DOMCTL_ioport_mapping also removing the
> > permissions, and hence Xen no longer removing the permissions might
> > lead to leaks.
> > 
> > This is a risk we might be willing to take, but it must be stated in
> > the commit message.
> 
> I've added
> 
> "While no longer granting permissions upon mapping is "only" at risk of
>  breaking guests, no longer revoking permissions upon unmapping strictly
>  requires callers to additionally invoke XEN_DOMCTL_ioport_permission. Or
>  else a security issue would arise. In-tree code already does so."
> 
> >  And likely in a CHANGELOG entry so that external
> > consumers are aware of this change and can adjust as necessary.
> 
> Will do.

Thanks, Roger.

