Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NKYOg8LA2pmzwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 13:12:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4451F51F1EF
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 13:12:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306723.1578547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMl1W-0002Qn-3m; Tue, 12 May 2026 11:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306723.1578547; Tue, 12 May 2026 11:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMl1W-0002OF-0x; Tue, 12 May 2026 11:11:38 +0000
Received: by outflank-mailman (input) for mailman id 1306723;
 Tue, 12 May 2026 11:11:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wMl1U-0002O9-Qx
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 11:11:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMl1T-00EC1r-MG
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 13:11:35 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a030adc-2eae-0a2a0a5409dd-0a2a4508d71e-28
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 13:11:35 +0200
Received: from [52.101.201.67]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a030ae5-63b5-0a2a45080019-3465c943cb0f-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 13:11:35 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MN2PR03MB5312.namprd03.prod.outlook.com (2603:10b6:208:1e9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 11:11:30 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 11:11:30 +0000
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
 b=S8LKEFURr8ZcTlm6D6bsKOb+ylOPfQFY8pUj5uiGgv+33TE4iI5awqBQicV6Ghhsb4oHXridWw9P29KEjLpl7vw1Ana5YKR5TiCydqu/BPg0WT6z5NgCXUhhLwaAQMh1P0Q6EMZw06MUN2Q9xccA32Ukfu02i/aDnAojKaZYumitFlrckaL8aRwMJuYycmD7I3RH0azImqZ9wxCOr037O0CZ3NRmhdIB9cDPE53KKuMN1oSskrQd3ldBt73OgLZd85mVGObwaQkaGZbgI+l6n2VaNJy44Ku36JKGLa1zxOPNrFD8pPREawCDpr0IE/Dq77qxsgIxswjNxP6tCQf9VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWreu2g8IqKYu/Eg2gQn2qeacYML4OnsnZs+qppdjN4=;
 b=U0sY1MA9drygee3a2KU6L0RvTK6c+G1WqA8p6FqEiTHJ19clSvRCBaZL6aCLC56+qL2WZKT0y6CNV0jPx2rPB+N7HFAuwvQ6vdqsoZaU4fgs8zMxeEJCrVzJAhIi2yMSvRygKU6xXxTIJwjRRXEY5/RdTXArY3U1tc8C25MS9z66J0Lrk6ntOq6bcqnyiJvH8YDwlSO8CpwPFuy4L3y0s4UuWNjv09tb3BuYcexwSAfzHodzag574zFIU+5qV49BCXShWx346l3l5Wc+qWmuzYk1YBh6A0zil1PkzhPyd9Uj4YqkUkQtKswlkGWyJIuPrdcrizBH/JRuKWJzEm3fVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWreu2g8IqKYu/Eg2gQn2qeacYML4OnsnZs+qppdjN4=;
 b=uNfCoHHRYzSyKtEbx6V0zA7lx9AVmiJJdLL+rTiEZyKARWYYzA9YkqYaRZMlQ89O3afX0IdrIwWBGxsjS/vloCPKb5SCJU+OBiQJgjW6vQMKDVld2no9isWBmKWSdkACloxWKJWDC1OcIKcFfBU4iTg2c3lXF9GGefiaIcEH320=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 12 May 2026 13:11:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: Re: [PATCH v3 5/7] vpci: add SR-IOV support for PVH Dom0
Message-ID: <agMK3qCDKWTlNXMa@macbook.local>
References: <efb254c2-f52a-408d-b225-e4e03935d05e@suse.com>
 <d0916f22-b5c0-4c93-935c-4cbe17e626d4@epam.com>
 <e5844c28-aa68-4bf6-8287-a4ceeda3a1d2@suse.com>
 <878q9vt0lg.fsf@epam.com>
 <e9610f70-85b8-44d9-8e13-da26d506d5b7@suse.com>
 <877bparq9t.fsf@epam.com>
 <1d591ff7-599d-4dfa-b521-bfaded430a76@suse.com>
 <925f2076-f98b-4102-ba45-a85a83861c9f@epam.com>
 <agLruvURfBUb-VgF@macbook.local>
 <37888ed4-b800-4a8a-b9c2-f69ce3526de6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <37888ed4-b800-4a8a-b9c2-f69ce3526de6@suse.com>
X-ClientProxiedBy: MR1P264CA0013.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MN2PR03MB5312:EE_
X-MS-Office365-Filtering-Correlation-Id: f099390c-c076-405b-3a50-08deb0173806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	JRmvw74ggBgygjTO6HYuhae8Yti3X9QwLqIaPmXq4xyyS//tLyCYnR7oVo78e1mSi2Dz91THL4a2KNOpR4U7AjgwSw65LFL+Orwh/GF4Ca3bW2u7KjKqeU3oS5I+ezxOv2PFzP4+0EKYhf1og6t6UJWkvrsMWJB07C7L4s8vZociv2rWiuZCHUX/J7jGpHdUHtczQE1aIVsv/oAsV+M+deAJ1UxcmD1wqrGH5G9+/6sR6UFuPFl7oXpfrEjNDVrf5s91qV6VVRQaTuHFP+L6d7L69MzxoweRQn+5/soKhFjFyk388GViyGd1BhvepSHRwQmeP52WpZaXPAqMGGJ8IEo8JBrEmdlD+sBBVi6tMrV4L7GvI7v9zGLest0Yv0+DC2Zsl4NL4gFgr74pMgDo4qOimQYJ2bRaZB2TiYrisvN6mS7vnd3ZCLS3rVDNCJYPKzO2b33YqTwsPP/ietDcQNXNDFkl9xboJ16KYogLtF234vDUnqzjk2iepg0YH5ztXgAbF2pdNOmdMTYmgh6TYir7IBB8f4VG/sQvAbi6BYMIu4TLp4BOKywZ6LAqeM8Hca9iGCE299maf2AUL4l4yH3ALGueuWjPSvAHTwdEMyKthp8/WGxeX+UJvXoNo9sOp51hECTuUmY19wsz6DclOk/4Y5S7W/j0fnmkRRB8FCp8K43NPIz3fOHojif7uvd9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUVBbEE3YVZReFBWSnU5K214c1RtanNEZmtRYVVlN3A5UHlMdnpSMW56SjNn?=
 =?utf-8?B?eW4wcmZET0lOS281czB5Z1cxMjZJZk5sUzRQZE52ZW1JSU1WaXdMdmphZ1dZ?=
 =?utf-8?B?Y2xZQ3EwUjZQMldqR0JtUlNYYjNoTmlyYWlhWHNCTjFvMVJsL1d6SUhUZENT?=
 =?utf-8?B?WlEzQzMzRnRJWmJVZ0lhMW4xSUZmOG1KSWlyUGdvR25XVThEUWIzalhyTWRl?=
 =?utf-8?B?LzBkMFBQTjlWWVBQQ0RRd0U3U0RERjc3OVl1NEZMczhoZFZYYTU3dXdobW91?=
 =?utf-8?B?aU5ZYVBCT2JLVkVRbnU4ZFU2YjlQcmhRQjcxVytrMGNkK0hBRWFPYzBWVFNE?=
 =?utf-8?B?Q1NCOGdlQjZwSFJXczVmRGx6RTlWaUhld1h6ZWIvNjIra2FkSmk1Q1Jja1c3?=
 =?utf-8?B?ckNSU3MrMUM3c2JHVDlZM0g1N2RRSUJQdVdRdTlacjl3ZlF4RjlUTUdBRktE?=
 =?utf-8?B?eWVqb0YyZm5DcU5ORHFmMmlvVVlIekVhbUJDRVlBS3N2YnMra0hpbXZ0amhn?=
 =?utf-8?B?ODVwV25kSFdrS29PR0p2RW5jdkh2VHVvRER5NitYOEJ1OXVkb0lrek0rb2ZT?=
 =?utf-8?B?NlZSd0JMTlB5U0hqQWtxeTNUMExqK1EyMVpkbjhmUEV5NDRwL3dHZ0s5aW9o?=
 =?utf-8?B?OHRSa0Y1Q08rVlRtOEZDbEZrQ3hYVkxvN0RvcVljdStMVGx4bXZvMkdjN1Mz?=
 =?utf-8?B?T1Ara2xWWldzaUV5ZFVQZmVLcklrcTN3RjhIRVlzeEZOVTNCcnl6NXgyZTc5?=
 =?utf-8?B?ZkhmVkliUGRvRnRpWUJrN29CUkMvREVaeUcrMkxYWEFzSStIOEIvaEdPSnRv?=
 =?utf-8?B?VjM4emhhcFNnK1BmVU8rdklaYlFUaFd4M2R5bXBWQmtzUnRuWlFWMmVHc3Yw?=
 =?utf-8?B?R3VuSVNENUtvaVBmbitkdm5pQUpTOHNURjMwSUUxNlZoQmU2amhGc2RFMHVw?=
 =?utf-8?B?Q1ViQ2hXblVuRnhqMjYwc2pBdWQyUzkwd3ZpWWFqMkRSZFhST1EzOGt6Z1Bu?=
 =?utf-8?B?YlNWMUhLU2ZqKzhobmFlbUV5c0hQdnRYaFQ5c01YZW81VExGMkFHaCsybUdI?=
 =?utf-8?B?dlZsZzRqbkc0Q3BxYTdYZnM3VzQ1Z0Y4NGw4U0lXS0c5NStYOU1EZjNodzlz?=
 =?utf-8?B?MVRzMlFFSGZoSWdGdzhCaGs4SVRPblZhSWs1OC8vOHphWDZ0d1dHMkxFWVR2?=
 =?utf-8?B?V1h4cjhUOUNNV0xNdUlLeFQyWmNMUjMveFJqVFIxM2kxNk9rT0dkU0FZbTM2?=
 =?utf-8?B?UHFNS2JOZzY1Zzg3b0IyTFRRaTNjQTVrdjREVlFueHVvKzdjU1BhRDR3TDFN?=
 =?utf-8?B?bXloL0d2OHptUnM4Y0gwcllrNXY0MTdkL2cyMkVpK0pkTEhTMHpJc3Y5dmxx?=
 =?utf-8?B?SG5VSG50cldDVlpPaVV3VkM1cjlOVGdWZFRaMGdZcFBJU3EwNTdvOXJWVWds?=
 =?utf-8?B?S1NWaUIyWTJPNlhoTm1Bb2JEejd0UkZFNU1kRkxaR1puQXZNWkNhMmFoUTRu?=
 =?utf-8?B?dHR0Skw5NXMxTkpSQlF6ZjZScWVVQmtnTEhXdnJORlpISWdsbmVhbHFjWTZ3?=
 =?utf-8?B?bWZpVThtZzhEbFA2dFdtekQ0SnJVRUIzMUNGbEt2b3IzTW1xMjJwcXJzOExN?=
 =?utf-8?B?aXhyUWFIUmpWTUw4MnJlbTB2enBnckNNd3Qxc1JkeVdRTHNXaXQ4SkRxbEE5?=
 =?utf-8?B?Y3NQcW0wOVM1WXBFOWlYckY1dDVWSnhtbTQ2eEw0YUNvbGlvV1NFWTlXazRt?=
 =?utf-8?B?Q1dmUUt1QWVRWHVuUzRybjVCcVFzTlcrdEhPNGExcDJkUm9iSENBRE5HRVNy?=
 =?utf-8?B?V2RJZi9URU5DajQxWFZNTTN0dWo2WE1Zc1ZsbG9kMW44ZHI3WDBvS0RTMmFY?=
 =?utf-8?B?MGNpSDlTRkoyb1oreWN5WDlSQ1VsZUwrYnlTN2dTVHhtT0luczhUdSsvRTBU?=
 =?utf-8?B?MWRmallyYlRlcDY4RjBEN0JzNTY4Y0l3V3hlZFFGdE1nWG9xT2w3eGYvS0Yw?=
 =?utf-8?B?b00vZE5ramZHOXVvR0VOeHpPcm9MUmhjQXgxMVg3akZ0MU5jK2JPMHdFdVhy?=
 =?utf-8?B?LytBUXk0aXhvUE1JTHFqNjc1SkgxdktTc2RpUERMN2k5bkRoMVVoWnBpQmIr?=
 =?utf-8?B?elJKMXFGckJBZnBFNmg1ZXpVSkNPZERmcVFkWm5rYjV6bFkzSGpzcUdsdjVn?=
 =?utf-8?B?Rld2UzhxWDZsY2I1ZXgxUy85QjZwblc5cGtxT2pSUkJoMUE5TG14WXQ0bHE4?=
 =?utf-8?B?QTZxYWN1OWw5ZFlITzRaTFZGTzAzWDhiZ0txWDN3N2FLYk1mbTREcUxmMktC?=
 =?utf-8?B?Zkk5YXFISkN1V29abDZoek5DdzVteEdXT0YxRW9zSDNMenJTZm5BUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f099390c-c076-405b-3a50-08deb0173806
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 11:11:30.7253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ATOiKUbvrrgG5s3HJjhfCtUZIru+T4TbKaT8Nl5NMaNiPgfoXVRb+4Vi4dooKY+OXk58HXz8hyEfEb26Ltuog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5312
X-purgate-ID: tlsNG-c1860d/1778584295-C447DDB1-D224ADDD/0/0
X-purgate-type: clean
X-purgate-size: 4040
X-Rspamd-Queue-Id: 4451F51F1EF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Volodymyr_Babchuk@epam.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:Mykyta_Poturai@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 12:44:48PM +0200, Jan Beulich wrote:
> On 12.05.2026 10:58, Roger Pau Monné wrote:
> > On Tue, May 12, 2026 at 07:32:20AM +0000, Mykyta Poturai wrote:
> >> On 5/12/26 09:20, Jan Beulich wrote:
> >>> On 11.05.2026 16:10, Volodymyr Babchuk wrote:
> >>>> Okay, so let's clear this. If I remember correct, you discussed this
> >>>> with Mykyta in the previous version and suggested to put the vCPU to
> >>>> sleep for 100ms.
> >>>
> >>> I don't think I did (except perhaps from a very abstract perspective),
> >>> precisely because of ...
> >>>
> >>>> I don't think that this is a good idea, because guest
> >>>> kernel will not be happy about that.
> >>>
> >>> ... this. Instead iirc I suggested to refuse (short-circuit) handling
> >>> VF register accesses for the next 100ms.
> >>
> >> Do you have any suggestions on how to ensure that we accurately catch 
> >> the window where 100ms have already passed, but guests haven’t tried to 
> >> read anything yet, to flip this back? As I mentioned in the previous 
> >> version, Linux, for example, doesn’t attempt to re-read anything if the 
> >> first read failed after 100ms. So it appears to me that this approach 
> >> would be prone to racing with the guest for getting to the VF first.
> 
> When we do the write to the control register in Xen, our timer will start
> ticking before the guest's. Hence our 100ms will be over (slightly)
> earlier, and a well-behaved guest (having waited for the full 100ms
> according to its own tracking) will be handled fine.
> 
> >> One 
> >> approach I can think of is to somehow swap the register handlers back 
> >> in-flight during the first read by the guest if 100ms have already 
> >> passed. However, this would still depend on Dom0 for registering VFs, 
> >> but in a more convoluted way. We also can’t add the VFs before 100ms 
> >> have passed and add timing checks to all register handlers, because 
> >> pci_add_device and everything below it expects the device to be 
> >> functional at the moment of addition.
> 
> I fear I'm not following this.
> 
> > We could maybe do some middle ground here, kind of similar to what
> > Linux does.  The overall idea would be to put on hold any accesses to
> > the device(s) PCI config space for 100ms, that would include the PF
> > and any VFs.
> 
> For the PF, at most parts of the SR-IOV capability should be thus
> constrained, I think.

Linux blocks access to the whole device PCI config space, but that
might be simply because it's easier to implement that way on their
side.  Certainly the spec doesn't mention any restriction in accessing
the PF config space during that window.

As a simpler approach we might want to reject write accesses to the
SR-IOV capability during that window.

> >  At the point when VF enable is set Xen already knows the
> > position of the VFs in the PCI config space.
> > 
> > Any PCI config space access attempts to the PF or VFs during that
> > 100ms window would cause the guest vCPU to be put on hold, and the
> > access would only be retried once the 100ms window has passed and Xen
> > has registered the VFs with vPCI.  This approach needs extra logic to
> > put vPCI accesses on hold, similar to what Xen does when mapping a BAR
> > into the p2m, and a timer to defer the adding of the Vfs and the
> > unlocking of the affected PCI config space region.
> 
> I was meaning to have this done in even simpler a way: Simply record
> when the VFs were configured, and within the next 100ms terminate all
> accesses (read all ones, discard writes).

Hm, I thought about such approach also, I was mostly worried that some
drivers might know the device has a shorter initialization time, and
hence attempt to access before the 100ms window.  However simply
discarding accesses might be easier to implement initially, and hence
I would be fien with such approach.  We would need to log any such
discarded accesses during the init window.

Thanks, Roger.

