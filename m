Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGrBC/nc1GnzyAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:31:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 913793ACE08
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:31:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274848.1560825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3hm-0007Ko-Tu; Tue, 07 Apr 2026 10:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274848.1560825; Tue, 07 Apr 2026 10:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3hm-0007IV-QJ; Tue, 07 Apr 2026 10:30:46 +0000
Received: by outflank-mailman (input) for mailman id 1274848;
 Tue, 07 Apr 2026 10:30:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wA3hl-0007IP-Bm
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 10:30:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA3hk-00Flbu-Nk
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 12:30:44 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d4dcd3-2eae-0a2a0a5409dd-0a2a4506b72a-16
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:30:44 +0200
Received: from [52.101.52.66]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d4dcd3-0df0-0a2a45060019-346534423da9-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:30:44 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN8PR03MB5027.namprd03.prod.outlook.com (2603:10b6:408:db::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Tue, 7 Apr
 2026 10:30:41 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 10:30:35 +0000
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
 b=CndLYmBHc0aMXMVFGuAX0NRoS7jHaOUz3hEwZhxGhkwlTZad2dK+cDZBB1E/3L2o1QJwUmHbadyjG/1PSkWXgatKYCjahU0kU2olscEoFdvfNj0/vj4Rndb1fxKYFpVvNEC/pDxYzgExq5Bb0i6Ro90yepx3PKj3K068XUTc/I92IvY7QA60Xj2XmwOOVG+igKAAGBsuQVWiEi0uXGzuFAHLMOgdhreK62aEpH5lxd9Kz5FF1M9EgxYI36VN410gxa8Y/jKIJpPS1rX5fw5PqEVmisyFuk7KrIjg3buBTdmGSWAi6yl8H27QmvDRo2fKsMLTSqx01rFjuV7KetYVXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJmN9nmRaihS2ZFAeEmVjXKX31zk7XhTbvO4dzJ5iXY=;
 b=L5YRN80fgaOGCT3f83NIqq80VmjvCjKA3x00fXcDKDftKgJwc3LzBtbYY2M2QmqF22xQhVXI72U10QsIYY00AycGeeXPfWYg7vUVEut0W/8tNt66q/JKCEskTNqD+dBr/sNTKRRP01CGIBgelc/RbRKXfsvpK5tlU7rnFRUufPGylZJD2i6ZN0jyM0XXcttBhPF/o4wSGubhLLe41uBc3YHVRC/y5pP1KMdwoRc9jUmePRHIuD6wgN3pX7apkiC09kazwdBaInH+c08e8flS1bMPky9RrT7u3wU0JHdztB5AfowWOrYJHC74+sIT7LNiJWeAMgmUdvFyeTv5ZaftBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJmN9nmRaihS2ZFAeEmVjXKX31zk7XhTbvO4dzJ5iXY=;
 b=kNfbmvBgOyfg7lEglz54J77YY3lzEEx7Ky6PtGIFFOPxea7RnSnZM8s+FtVDwqFz2mR6e95Rj0ouNik5NMH18BXQJ/hK1yhYlMez9t7KfqIHMWtFVkb6CRqrCPTAET0NHTydS/SK7hoU8rx9RPPHpbfN2WY/C9+TSyMYB7/ywTo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <884db6ba-19c3-4073-b1e4-631d286ec5d2@citrix.com>
Date: Tue, 7 Apr 2026 11:30:32 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Kamil Frankowicz <kamil.frankowicz@cert.pl>
Subject: Re: [PATCH 2/5] llc-coloring: improve checking while parsing
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <63284ab7-8e38-4448-a789-1b9c23c4d95c@suse.com>
 <97d6ba6c-4ffe-4e1b-814a-d51a0bcf363e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <97d6ba6c-4ffe-4e1b-814a-d51a0bcf363e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0313.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN8PR03MB5027:EE_
X-MS-Office365-Filtering-Correlation-Id: f17311b9-c7a2-4fab-3f38-08de9490b486
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	uBunPjIly6ERKxypnoPPX+pCSvdkY2/VG3HRZjdjU7ZGptH4+BpadQ6BCtPDTkV119p6vhDMaoh8VUS4DWv0cZAemBm+kYCKftT27kyTIoscSXFnw1PBVNhR/wDiEj00d9AmcU4eyh1gqasBDaK+7rRf7XdN9D7Llz3ZH5FkaLt+HVsq8bB6f7lm0DPOcKAupUrJzdGCK6ZlnPl5L1JbrMcIjwFej+HSQb2aT/9uom5Sr51/iuT8JCXvCF5wdwdeYC7i/Jd3zYLwKWnjoIJISE5dsRxj3zubzITdb/EFIjoWL0U7EKLZuTH2ubowBAdGnmqW4XgEa/HurpBwNpnUf5IeLftg92EPR33ASD9gChttzdVqF1VEVVT0JCqkJ5QX8eBPumE3z4tJQUQhwHLg7Pz1XGyxYIAL+UioGREwFxYglWlXWCbofFpL2d9BlHMrS2Ii1ha8wvxEbh3cxu5ekVrgg7xsP27OUfpMrxYd7i/eP5+ZOk7y1tBhF+ZY9n23x9ROVaP1OwVNO7++ctYHp/Ew40M0JNErI0xEfLKB99ZIR3wfrz4tSn/4crcBZrBh0oipX+5JuLl9168gnSppyjqVYeolfO9UlHUlCplEprJNF9X+u8jYhsiuH8Vr/srEMgYePPiRH73KXRQGfHQ3GWEQR+RTfb1HJ52xypQyG7ZPTnP9MiwXSCSjosxgkEyWlFoCnMOsymKKjgJlL3T00mDGZIpgTVHrrPIFydbPUO8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlBiQklsY2dBREtENDkrRnhpeU1xZnZhQXVBSGIvZkR0ZW9GWDVzcldnRkd1?=
 =?utf-8?B?MUZhUFFlOElQdUZ2dU90SnV1U01oQVZyNkQ3LzgwOVlIUk1jcmNXTzd3NDFT?=
 =?utf-8?B?RDlPdU5NVlNiWmZXMm9OeXB0YUJld3poLzRXK0NwZUllQXVmblhkcUJrRFhG?=
 =?utf-8?B?R3Z1NXA0azZzVmhQTjU4UmdvVXhvZjUyaU0zT3pQY2k0enlVM216MUlWTXpP?=
 =?utf-8?B?ZmlvbVQxblMxWWtMTEVLb2FKdlI1Z1JlUEUwQnM2MFN3aG5OWmRNQWNJeW5y?=
 =?utf-8?B?djN4OUZDeGFFWlQ1YVRySjhSd0VhNWZZdkR0dzgrckloZHdFTEVJVkFEN09M?=
 =?utf-8?B?ZnJCTldKcmM4T2pLdE1NUHp5ZVhIaWVzUXJjRE15ajYwajZzTjBKOHQ1N1Mz?=
 =?utf-8?B?b0Z4bUd6Q2FZQmpHTC9mcTJhRGZna0djV2pTUjhBeTkrb1RueXM5SlR5MnpT?=
 =?utf-8?B?NzlvOURPWnBGUHhublIzVk95SGdQUlgrYlB0bnBWY2g3c0ZiV0J4K0JsRHVn?=
 =?utf-8?B?Vko0Tk9PdFNiMFRaanFqRWEvVDArajd3MjZLUzV4bWRQa2F1NkZiTTBNUnVT?=
 =?utf-8?B?eVlBZk9WSWFEWlJYM29KNVY3Q2dhTURHa0dQV2h2YWc5MFVSQWRIM0lkSWVH?=
 =?utf-8?B?Tmo4dW8rOXlrNDh6Z1Z3N2o0K1ppM1NIZ3FCVjdlME1MMzNyaFpsVWV4ZHVh?=
 =?utf-8?B?SzBOaGZpN0ZjY2tyL3hZWXI3TGl2czc3RDV1MjdnZ2t1aXAzVGpwVUZYcXp1?=
 =?utf-8?B?R3NaM2pFUXJFcWloaHdVUGRWNU9sUG9ldTR3a0szbFQrTUVuUGVrL2FaN0x4?=
 =?utf-8?B?R1F1K0l4cmdvNzE2bjdoWmx4bm5jOFhNOTd1U0hoMEJVSWNYS1MxQUFOQ3Z2?=
 =?utf-8?B?SzNOOUdiSHJIa3BnRzhaSTZMUHV5bjd0bis3clVybVJscHRvRUR2elNKZjlQ?=
 =?utf-8?B?dFhaUGt6TnJZM2E4aVprQ3VFWndZQzdyMWJPOVNNOXU2YjQzZmxmZmlrK3ZY?=
 =?utf-8?B?alhTUUZOdnN4TVdpN1djMXI4dDJXUUZvYmhRbmJSUEhQemtydURWZStUZ2Rr?=
 =?utf-8?B?N2pFVXh6RndBUHdyaGJWYzJjZlE0Q1BzRlZJZStSdXJFS1Myc0ZEdmxHbi9h?=
 =?utf-8?B?TEswemsxajVwMnJCU0ZYU2xCNWR1RTBtUS91TVNEbVBVcEtoR29iSHdqeFhV?=
 =?utf-8?B?c3ZqNU4yWlAvcjQyQTlJcDNGbVNQNzN4dDl2ZHdzVTZ5dDNjaTFWY1pLcDRl?=
 =?utf-8?B?V2paMG12ODBIalBoY3k2RXRpZ2FrRzJiWDhNc0dLMkRVdWIvajlYdUlPcXJP?=
 =?utf-8?B?NEJEdEg3WU9LR3Mzc0pFeWZkWjlBclJLdnVWY1ZVMjBJTUk4WkxvODhPVk5i?=
 =?utf-8?B?TkVuN0hMcUt0MTcxSUZxbGNzd25vVWNaVWYxdmIyaHhJem5jNFhHeDZFVUEv?=
 =?utf-8?B?Q3VlaGdrcGs2MHlzUGNBcTBrZ28yRks4c0FNemU1eStBbW9Tc2NicG94d3pB?=
 =?utf-8?B?aVI5T0o0RUhlc1JscEdSWFRDZFdZZUZMQ3FFODBlbUh5aXZOR2QrMHlDMzVn?=
 =?utf-8?B?SmN0MGl1di9uYm80Qlc4NXVqcmFzaGdSWTZWT1B2MHNTSi9rbG1XWEtXUjdv?=
 =?utf-8?B?ek1NRy9seEN2Mk1jaTZGamdJaUtPQkNXS3RHS3VKRjByRmh0RHBWZVNtalgv?=
 =?utf-8?B?d2xMckN4MkN4bGFjWDA1b0RiUldIazVldWxMUmhmMTZkYVBmbDVJY0IxaCto?=
 =?utf-8?B?T0dMQ0NpdXpzQnhndWdGM0locVRUbFBKUFEyU29oWlY2VWJNMHdWRTAwV3Y5?=
 =?utf-8?B?NkFYUDRaZy9yZnlIYTNtbDcwZ2xPTnI2b0owNWw0NHNHSTRsSWtpZTN2cE9i?=
 =?utf-8?B?aitRaG1LZnBEdXVWTkJjQXBONUZhditpQ3lIdXlvQkFrUEJjWnh1VXl4TFYz?=
 =?utf-8?B?c25aYjhGdXdXTWtaMUlPYmNUSkRHU0htVDJQd2doa2xIc1FmQ3VuK2lPM09v?=
 =?utf-8?B?THlCVVNSRjhocTZta1dFRkRWM0dDOUVSUVpZcjFJNkphM3VXdjZzS052OTAw?=
 =?utf-8?B?SFdNUUxuM1RkVHJ3Z3dPTnFuOWhRV1NodFZJWlFjeFlQM25tYWlCZitIeFQy?=
 =?utf-8?B?enRJa0lPMmJmMUJnNUFWRTZjN3pwWjIxSHNmRVBKS2dqY0F6cDh1anBBbFFs?=
 =?utf-8?B?a3FuTytCc0VFMGdiNXB1YXJPbTRhMGJSbTJuMkhNa1VKTlhmWDJwY0gwMEhJ?=
 =?utf-8?B?ZTZsRU9mTzJtdHZwb2ZHYXlNWkxnWnN2aWhkMXJLbDBxUk9DL0hQcUdNOFds?=
 =?utf-8?B?ODdRbzRmM084RDZTQWpNMEduazVGYkFpcllqOEo3UWZjMU9HaTFsTjRjRmt5?=
 =?utf-8?Q?G5wfMAxh1h+HyB/s=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f17311b9-c7a2-4fab-3f38-08de9490b486
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 10:30:35.8919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rMDcLNsQ8fYxmN2wpVfi+sVI+Kr0ZOH5El8onp09tD/aUxrDRrbJ4DNp8grqJk0fZKM61I902xzteK9mbyKD4BleYawbSSfmH77QKX45nTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5027
X-purgate-ID: tlsNG-16d1c6/1775557844-AE12E3D8-FD5B9EE8/0/0
X-purgate-type: clean
X-purgate-size: 1839
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:kamil.frankowicz@cert.pl,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid,cert.pl:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 913793ACE08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24/03/2026 4:37 pm, Jan Beulich wrote:
> We can easily avoid the risk of wrapping UINT_MAX <-> 0 by applying a
> check against the compile-time-constant maximum number of colors.
>
> Additionally the overflow checks suffered from an off-by-1, as the parsed
> ranges are inclusive (e.g. end == start being possible, requiring 1 array
> slot, while availability of 0 slots was checked in that case).
>
> Fixes: 6cdea3444eaf ("xen/arm: add Dom0 cache coloring support")
> Reported-by: Kamil Frankowicz <kamil.frankowicz@cert.pl>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/common/llc-coloring.c
> +++ b/xen/common/llc-coloring.c
> @@ -76,8 +76,9 @@ static int __init parse_color_config(con
>          else                /* Single value */
>              end = start;
>  
> -        if ( start > end || (end - start) > (UINT_MAX - *num_colors) ||
> -             (*num_colors + (end - start)) >= max_num_colors )
> +        if ( end >= NR_LLC_COLORS || start > end ||
> +             (end - start) >= (UINT_MAX - *num_colors) ||
> +             (*num_colors + (end - start + 1)) >= max_num_colors )
>              return -EINVAL;
>  
>          /* Colors are range checked in check_colors() */
>

I think this is correct, so Acked-by: Andrew Cooper
<andrew.cooper3@citrix.com>

However, the parsing logic is also ridiculous.  Most of the complexity
comes because of parsing a bitmap but storing it longhand in an array of
unsigned ints.

Instead, the global variables default_colors, dom0_colors and xen_colors
should be bitmaps sized by NR_LLC_COLORS, and d->llc_colours should be a
bitmap sized by xen_num_colors (which itself is bound by NR_LLC_COLORS).

With the default of 32 colours, this would involve no memory allocation
at all, even on 32bit builds of Xen.

~Andrew

