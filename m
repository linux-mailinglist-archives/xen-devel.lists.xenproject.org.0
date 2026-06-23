Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AvjsAVJuOmqV8wcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 13:30:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E796B6BA2
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 13:30:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=eCR3bjMx;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1344209.1603326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbzKF-0008QN-N2; Tue, 23 Jun 2026 11:29:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344209.1603326; Tue, 23 Jun 2026 11:29:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbzKF-0008OD-KB; Tue, 23 Jun 2026 11:29:55 +0000
Received: by outflank-mailman (input) for mailman id 1344209;
 Tue, 23 Jun 2026 11:29:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wbzKE-0008O5-EQ
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 11:29:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbzKD-00DOTt-1w
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 13:29:53 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3a6e19-bab6-0a2a0a5309dd-0a2a450a847e-44
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 13:29:52 +0200
Received: from [40.93.198.65]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3a6e2f-93a5-0a2a450a0019-285dc6411fe9-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 13:29:52 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5805.namprd03.prod.outlook.com (2603:10b6:a03:2df::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 11:29:49 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 11:29:49 +0000
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
 b=vpE05sUhU0c92KCxBnHQzMpkWV/9rO6p+cseijL3oehQ0fDkGwqudaVzj3KbnCW5LCNULrB/Aaiir+37qgXL7zYh0vW2K77PyUCfZipxDyeUYBAHT1Vdt5YeQ0lcA/qnhZCohg3OWAMVwWJchVYr4MnTGk1Rf88WGZR8MtTqHSWABI2nBL5O9blkbItWUOaCIuMyGO9cFHL9mtX0uX38DKsl5l7PZ4shrbbUW/pxYHjvLAkyNevT7gvUcDX2nZMTX7JbnOWdJzWAUHm8mGIMp4hlaYEx5SDroLDleYQzUGAO/Z+kkEmOBRersrkeEAVhf2onsK/BbzFglxh50fMm6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWxO4HJ0abRJyVtTvUOK5Cu3raoYwrFxxF20CHrgGZQ=;
 b=swV2UYnebYHzwfYxPX2z/XFCat/xYt+a/DXpUr0KyfNOp3jcZQSlGL+TYVpbpJ8pUZ/r3qOTTJ0RjVe0gLnDCM+klBXN2SM0H7o1wh4AVDUY6evIPpKThmx7vLvLsiLrowWKVi/Hr7YdjRV7LC+bwGnSJFxfFPe/xbG5h7+t1IIDgOUdCqi/2OdtEgZ4P3vGrjWFQoTCwRBK4I/gyHew6DV3c5R/5GCWdmoE0Es5aDRQOGi9uwNGByzBEXrP9Np04W2dAWdv0yFY287YyyEsa2DPCMiaZe4eKklrbbr3cqCCEm4WQ2gKc2xTxZXeBBkl5A0kOb5rS3iNUqhxtFYfxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWxO4HJ0abRJyVtTvUOK5Cu3raoYwrFxxF20CHrgGZQ=;
 b=eCR3bjMxRnz5omXMpMlg2XuGgnxssU0nKhWdwUSF5L6maAqvRP7RBun/1NpIKG8FgkJAxlWnpq7eKmm/6/iHwwCUmQ5t1AlsndfaYy96tByBTKytWsYVg6dt8u17vMG+z/ZLc8KbhongYahGsnaPrDEAtFCqSoa0kdjR5nlJQZE=
Message-ID: <0343b00c-2553-4df2-98a5-327636a4cb05@citrix.com>
Date: Tue, 23 Jun 2026 12:29:44 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v3 02/23] xen: arm: update p2m_set_allocation() prototype
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <a63794ac32e157ea44c3450fc5fb6f2842e00680.1781693963.git.oleksii.kurochko@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a63794ac32e157ea44c3450fc5fb6f2842e00680.1781693963.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0017.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::22) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5805:EE_
X-MS-Office365-Filtering-Correlation-Id: 355c2b35-e50a-4154-d194-08ded11abc2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	yGdCS7jt1AJXKWcxSHaCCtRWpZIoIQ4t1gL9omQRO2CVRm5hPRQ3CJJ8PVuhufo2xrbq3uU1RGedKK5aYeqTAS51TSznNnuZfH/4RSP2vdBV1+XJ/F4/ksMVyXfRH9Wm4opb9DjNmVTXtL8UmfpoMQif6r4gulf200NewkyTWYcOeTssKbwLsBfVC0KRD3Emh1dHgh0f2PM5i7OkREHbXmfnytRKgN+xiit/QBKSxOXHs3D5VAZ7KqHX5r9fZoIJO8w9jF9B7K65mfR731tlh+vtqsPjXfnaRvIXci/pvJFKRv/xHlFssmvKI1I48DnWSYpx3KuctHh5tNKbv9GIOmJV2rzkgJMxfsqJ9Olj+UOy/hWdYd5CB59fMp/7VH9ZCkzPvSuOSevQJCCyAeSNSN59kY5122sS83+LoMn+4nGy6UfiNCxBBG/t47m3WuFp2K0gUt4oJ0VuYqx/NE3+b4scvEU/swdMJFM++grqNx1Fqf/jNC+dgtalos054CHz8jbGblqH7PJAItSgXpQbNXvz5sc46AmA77SWU0mNkvz0K0r6RY/mtENDFZlmsKr/nM51h+1vPBzWAExbGMcoZio5GH5pI9m2iz+ybZy4s6+0BIt4eoTjs5ay7wq7Ajm2CAwRn19hD6Gk37UZRBe55bqiirod/aXqv5H61lDvINc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEhnWXFseFBKOFhHTEhIYjdqTkV4c1IrWmFKSHUrVTJBYUpINVdZMU1Ra0N5?=
 =?utf-8?B?aEFVVWVHa1Bnck1hNU8rRHNvVUkvSUJVdVFUMElPOVozZkRNdVdySmxqcDBH?=
 =?utf-8?B?ZFIxWkt0ZDlDdG02MzJLRmsyREVrVWVrelZ0RnlhZGQ5cUlxNXBoYTJ3NXly?=
 =?utf-8?B?bmNpSmFJYVZGUFAzL1BBRDFqclpUSlB1K3ArZ3JGMkQyWE1qaFJXODFaQmwy?=
 =?utf-8?B?VEJDcSs3S2lDNmhRZk11RHJYY0hUSlQwVmk1YVBwanJSZTFZTVNxK3IwOVE4?=
 =?utf-8?B?R0dlTUxYVHVBK3B5VlhxTUhHN0tVeGpjV3YxUTVoeHhwdVdIR3BUbHdiZmFT?=
 =?utf-8?B?WlVnZ2kxV2ZERHFXdDJqY1FnMEQrMmx1cGJaNHlEREFEbUVJVWlkM0EzWFMz?=
 =?utf-8?B?R280aCtKVDdoaUE4MkFrN1RsZUY3WmZiVll4QjVnM1ZUdTQ5NjZBdU5pRlJy?=
 =?utf-8?B?NzlsVFVwM1ZVUnEvWUpjQkc5UHdXWEsrWkVqMjZ0YWVlanErak83TDNOQy9q?=
 =?utf-8?B?MmZ3M1QraE1IR2lOSGIvdGw2V2tQa28wN0loNnVlRTdNNDNwSGVGWjVZZkJR?=
 =?utf-8?B?cUxCZ1lGZjE5b25mWm9QeFJXL0hkSzVBSlZHS2VwNUtEOFVrM21PUVhTY20x?=
 =?utf-8?B?bW5PdFdKTmFCaERITEhrOHdZeUhXRUtQT2p0eFptbkY3WHB2ajA3ZmxyZjBl?=
 =?utf-8?B?WUs1KzQ2ckU5ZC9ySUhZT1RlZ1NkbmE5T3pvTXpmZTNub1ZsY0tHYVhIVmNn?=
 =?utf-8?B?VHhtTjl1QUEwRVRRTjFjNDF1QkkwTTVZRTBob05VZytYMjBtUU4yV3I1OVlX?=
 =?utf-8?B?Z0tkRVhMeGR1Q3AwNnhXQ0tOMUtuWnlMdGJ0Tys3am1LbkZ4NFBnUG1hbW9o?=
 =?utf-8?B?WVd2TUFHSXRGQnZINHcvY1Y1UzhIZzZYRFdKVVZra1NsMTAxbEhJd2ptT3Jv?=
 =?utf-8?B?STRPNzl2blJGWEJlVUhhSWdpV2Z0UDFnMG81MUhHandZZGE4WS9UVndzNkdo?=
 =?utf-8?B?R0swNFpOVUMySFVPbUVmejVIbGZUREVZamZGUWRrTnRxZllCdlVMM2RhMEtV?=
 =?utf-8?B?VzRNbk5vMldQcFNqZWdhdDZtMzhOSytxQ1NHVzZvZjgxYnJaQXRqN1NUUHB2?=
 =?utf-8?B?MFM5RS9PQ0w3SXljN05nWmJMRWpWKzdaaFlxbFJ5ajZqSGthN29NVnA3QkY5?=
 =?utf-8?B?THhqanpCai9EbnAzUExoclBaTzdvNnlKQzY5R29pRzZzSXhuK2NaenFCNmRi?=
 =?utf-8?B?c3Q3MVozKzFtUmdZWDhIU3dNenhwQzJNSDcrcGZzYWkrVGo2cVpyMXMvb2Jx?=
 =?utf-8?B?ZGMxMGNqcUx0YUtlSU1uU3BLc21pUGpuZzFjdVVOajVXU3ZsZ3VqaGhKeVAr?=
 =?utf-8?B?blY1Q3ZuVVpmZC9RdTl6ZFJvNGZjakQ5dVM1cmNma0U3VnlPSU1hMHJoemJL?=
 =?utf-8?B?RTdlQ3czd0hQYXlYQUdxSU1RdHFBQlVOdzUvdmVsd2xKSHFtSEZFSGVZN1Rl?=
 =?utf-8?B?UzFaOG9yeXd4TnBzWUdDb1huZHpzSjkzaXRScHkyeHMyWjE4Y08rOUZjWDU1?=
 =?utf-8?B?SklmZUdYbEs5YU1VVTgvbnJUd2dLdTZIZzgzTTA3T1E0ekRuazRYZ0ZicTZD?=
 =?utf-8?B?S3IrOWhGNkc1V2dGWkxJYlcxV1VabkFNQThtamNnQklBSkVYRlJ0eWtwV0hC?=
 =?utf-8?B?VHhxM0hBMUFOaVR5U3ZhbTBVRmdmM1RhQjJ2VzZCcDhUYkFBb1RXT2tnd2xs?=
 =?utf-8?B?SU1qdVhwUDJOeUcxUmU0RnZkTVNKMnp1emswSXlYNkZFOVZLd3FnS2ZEbGdt?=
 =?utf-8?B?K0Z5aHIxb054QjlyZGgzZG5UTVJ3azg5S0RSbWNGdTl3OHhUNlpMNmg2MVJw?=
 =?utf-8?B?M1o5cEdxWUdyTm0yenBmUE1JaTBhYkNDd0RkR3pBdkF6SEtFcUtnZ2hnVC9C?=
 =?utf-8?B?R0dic3U2SllFaEdXM0JwMFVWdXlhZ3ZDRmxreVcvc2NNaXJMSkpLcjd1bUx5?=
 =?utf-8?B?TTUxamJJTS9BU0JnOTNpZHlYajNXNGVJQzBWYlAzZHBidVBJSlovajgyekpl?=
 =?utf-8?B?R2h6dS9rZ2hMVjBicktqa3ZUeEowTFBRYjdUVWFtS2JWaHVhNENYSGxyUS9Q?=
 =?utf-8?B?ZWd3KzEvS3hUVTJwUXBsVFc5MXBnWkFmNmE5N0NCcWxTN0djejRVcEJ2aXU5?=
 =?utf-8?B?SUc1ZXdEdzIvVFU5dy91Y2lXWWRlRXA4cnlXM0tJcjZtUk5QcVE2WC9Kdkww?=
 =?utf-8?B?bSs4ZWxEU1FCVnNqOWJId09NZW9oZ2FGM3F0MXlyTzlNeFZvTzExWVRqSksr?=
 =?utf-8?B?MlY3NDFtQk8wTmlZVm11b0lTaFJITm1rY01zQ2JXdUlFWlNiYlJhUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 355c2b35-e50a-4154-d194-08ded11abc2d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 11:29:49.0598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B8GiMr3K4buOyAdaXA4vwLr1dx0SccUqpL66x0RrowtlnVyBfiNWIVXnz9ENE4gbU3nMpLt8leO5JEUAkadS15bo+6qSaJNRsBUgUIxn/YY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5805
X-purgate-ID: tlsNG-4011c0/1782214192-B2DECDB8-699C712D/0/0
X-purgate-type: clean
X-purgate-size: 1812
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid,citrix.com:from_mime];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[citrix.com,microchip.com,kernel.org,xen.org,arm.com,amd.com,epam.com,vates.tech,suse.com,wdc.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38E796B6BA2

On 17/06/2026 12:17 pm, Oleksii Kurochko wrote:
> p2m_set_allocation() signals preemption redundantly: via a bool *preempted
> out-argument (set to true) and via -ERESTART return code, both at the same
> time. This led to the caller-side ASSERT(preempted == (rc == -ERESTART))
> added solely to document their agreement.

Well no, it's not redundant.  A NULL pointer is used to signal that
preemption is not permitted/available in the current context.

You notice this below, but it does invalidate the description given in
this paragraph.

> diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
> index 51abf3504fcf..e5c6be7c0890 100644
> --- a/xen/arch/arm/mmu/p2m.c
> +++ b/xen/arch/arm/mmu/p2m.c
> @@ -133,27 +130,24 @@ int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
>          return -EINVAL;
>  
>      spin_lock(&d->arch.paging.lock);
> -    rc = p2m_set_allocation(d, pages, &preempted);
> +    rc = p2m_set_allocation(d, pages, true);
>      spin_unlock(&d->arch.paging.lock);
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index eacfd93087ae..c3818ffed45f 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -747,7 +747,7 @@ static int __init domain_p2m_set_allocation(struct domain *d, uint64_t mem,
>                  domain_p2m_pages(mem, d->max_vcpus);
>  
>      spin_lock(&d->arch.paging.lock);
> -    rc = p2m_set_allocation(d, p2m_pages, NULL);
> +    rc = p2m_set_allocation(d, p2m_pages, false);
>      spin_unlock(&d->arch.paging.lock);

Passing booleans like this makes the code unnecessarily hard to follow.

At least use ", /* can_preempt */ true);" so the context is available
directly to the reader.

~Andrew

