Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id teVoEy0xUWpfAgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 19:51:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9175373D1F2
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 19:51:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=CpW8F17J;
	dmarc=pass (policy=reject) header.from=citrix.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1359740.1613171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiFNP-00020E-Dm; Fri, 10 Jul 2026 17:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359740.1613171; Fri, 10 Jul 2026 17:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiFNP-0001xW-As; Fri, 10 Jul 2026 17:51:03 +0000
Received: by outflank-mailman (input) for mailman id 1359740;
 Fri, 10 Jul 2026 17:51:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wiFNN-0001xQ-DO
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 17:51:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiFNM-007dN7-Js
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 19:51:00 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a5130f2-5cb7-0a2a0a5109dd-0a2a450188bc-24
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 19:51:00 +0200
Received: from [52.101.62.43]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a513102-3ea4-0a2a45010019-34653e2be71b-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 19:51:00 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by PH0PR03MB6349.namprd03.prod.outlook.com (2603:10b6:510:b4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.18; Fri, 10 Jul
 2026 17:50:55 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0181.012; Fri, 10 Jul 2026
 17:50:55 +0000
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
 b=lnDCdAMsiTRsFtUuP/o2hA5067rY14GK/uCJOFIGZNjq1hpiiFHqP8AEQMWxqnvOSty6UmjjaVgCkzV95LD9TYXtK6EBduykpHiz0/+HOcUm2iblM63A2v0qDGqiEde5zejewRXkw2knTYUoIUnIwUx2bN8ih08meHNfxblwUWoraK6kKKnCfBY84hoJ/o13KLg7J/L9dPteReCYMT+C6n777BGYhus0IxgJ64Q+CmeYXbu9kXM1X1S9RKJT53f78YZaDU4MpOtUeBlDNvuX5+PnTrCW5FFZuY0nj/Zm9Rvuf7jey3r4oIljbSPLYTb5IOx3Vq40yamt1V0W6ppPfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4POsCqeKiQ2NeQ3Q+7N2d+qFV4hhI73PlcVr3Lvcymo=;
 b=iGjfKEpHMPpgDznFug60p34gRCxhVIwmyzw5L/6JUgSIs3eaUGwJmh39Gt7ZN/ZXHD9uxY5B6kIw+7PptO2tJBfPsEbShF6suIWjNTWcJYX8x8spTLo4gxy37VmQqKSqxMomy15ZVS2E5I481LMkqPg4htDaJ50WNWLnPpDYSF8xHOreDeNvfNcH21QwjsEVaAOoajyRbHBH5rm4G/1TiCldjsGvadqG6VXqjy6d68f/Pls+nZ6kbO17c/J8H1Pw876h5JttWGYYGuwJntWqBx9iw6J1jMqnXVf90M/HT1Klnzb7kYxfh7DJwYf2ogoOQ5S/iUm2gzTa10Nr1PToKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4POsCqeKiQ2NeQ3Q+7N2d+qFV4hhI73PlcVr3Lvcymo=;
 b=CpW8F17JgCddGdttGjYQxrJHkoM6HS4bwWvdOfq3EJK0hmkVNgc6SWKktZRH0e8fiWdZuXuF+2wAGdxNN/oICLunyVMj90KUHjgit39E08i4twZ+XnzXLp8T1+onLRHSGMMp1ZzFZmrCoIYC3Dvebcs33d1MoydWWcqeu+k9INI=
Message-ID: <7f27b48e-2c94-4991-8a7f-5b3bd30f9f00@citrix.com>
Date: Fri, 10 Jul 2026 18:50:51 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>, Andrii Sultanov
 <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 1/6] xen/arm: report proper GIC version via
 XEN_DOMCTL_getdomaininfo
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <20260710135503.301746-1-julian.vetter@vates.tech>
 <1783691837.8631fc262581453bbf619ec5b2062170.19f4c5180aa000edb5@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1783691837.8631fc262581453bbf619ec5b2062170.19f4c5180aa000edb5@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0097.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::12) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|PH0PR03MB6349:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bb89d75-65a7-4b2a-924a-08dedeabcacb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|6133799003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	yPttxM7PcslOWftSey0qxqVl4KY9ykhqCc5+MAnlmqlEfJH8B0qHg2sinYbcV3bBMVrkcrmgw4R+gYysxXmXUbVaUiU4PO3t/vVc0C37u2ELeXyPvEahhOYevsDuXjDTNgBNQe/NHusIL7itfm3HyZfMpjZvq8SFlsXkctTLptRNoo4hS4o7qQ669OtvRPPDuGtcEdv9pESGsmxXyHslN7prDSfocIpTrDweXFxYl2rcbfRnbkF2kshJ9VfKMPz65DVhBacZdH1mvq06v1zUBE7UUd7nMGTKFsRvv8Png5xtprIrmmpm5X/zZhlFnxzinuO1yadqjN0dfF323T6PvX7aNSVvDTnkeiWv0dBTfV7vxmDg3W5sgWXYiovey8NDniZ/8YsbgXYqwb9aQtdokQ2U10dzku3hFOH11dzOAJi/xrvR0oJDwZCi0fBaTDrS+X3moNhxDFw2vUBiDxQwsKxPgAh7fF/DtIMEQ1LSF2GoGHlxpY2eON3BA6SKlqd4pSjVD9dLBck6OlBwPNlcbB93gyuYtkpn0METYHWVLtL6jEy5xn+3ubV6hCy8CST1Ts1nweoeYALwC5mL8mMiiCFUBCXAJ6Y3fEdLjybLS4xBT2rTbAQiEVyLqHI83LC2ldKWREliV/b/WhLtV7MuTQsAtkB9MZXQcFAWkIZZAbU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(6133799003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3QxWG4wa0Z4ajE1RkNiekJuM2IzL25JaGpoUmdjL3VDRWs2L0RwNFRDb1Uy?=
 =?utf-8?B?MFJSQkFZVG5hNHJ6NSs0WHhXLzJUbi82Q1JwdE5iK1VkanhwWDFEUHpyWmtQ?=
 =?utf-8?B?NUVPYUE1N2ZJdlAzSk9DQWFOMHY5Y2dOSTRzbkNaaUhISk9YYnllYkpxY1Z0?=
 =?utf-8?B?Y2VKdlNZUks4UWozdndGVVVBK3QxNjl2WlR3OGwxZWVSUlcwdGlSV0kxbFND?=
 =?utf-8?B?Qjc5MC9jTXVpOURONFUvd0FpYjJIWDkwWG9QZGhwTmtHZzY5eStVZjRVT3FZ?=
 =?utf-8?B?cWVmRWJzNG43TGpwRG40bUxEdkpkc1dJQVh2NEV2ZnBxVzJHa0VSMXEvNjNx?=
 =?utf-8?B?dGczb2dVV1NITU5oRktjZkMrZjVVOTQyZWw2ZTRGWXUwdjRDaTFUVVpoTU85?=
 =?utf-8?B?eGo2R2tBTllZUXNaSzl5VWlkS2laVVFHV29OdGI5Q1oyVStQUWtvUWt5Nk1Q?=
 =?utf-8?B?ZE5SMFg1UHNJNnJRZExOZFVsaGF0M2I0ejh2TEhNeGNQSTBFMU5wVlR5M3Rn?=
 =?utf-8?B?azhJZmxTQXEvZkdnQ3NIbWJaTTdGdlhERFp3aGZRR1NUVHNsNTB2d1lsMFI5?=
 =?utf-8?B?RnFTZ3J2WnV0dVQydk13UjBzUXJ2clpLKzY2dTFmZ09lME4yL3Z2cUhGZDl1?=
 =?utf-8?B?NitKUUtlSFpEVVRWbXQ2RGpvbDhBaURMWXR1OGtVVVh0NnBSRkMvQkc0R3Bk?=
 =?utf-8?B?N1JpaitKMTdXUXVGbmtiM0gzcXQxUG5UMWlWeGJsQ291S0syam43NmdSOVZm?=
 =?utf-8?B?RVlmLzB5MGN3UkZwMi9JTEJPYjgwR1k3eEVkaVptQkh1VzFUSE1KQ2FUc1gy?=
 =?utf-8?B?V2pyM2ZtNzZyRDA2ZjgxejRQM3NyUVgwQVFRRi9jYVRYYnZBN3RXbXRoSWRu?=
 =?utf-8?B?WlI0Qjg3OXhWMkhWRWtTamdFTmwyYUwrTkJYZHowVWM4WG9sbVRWUXVVeXNr?=
 =?utf-8?B?TC9Jd2w0MzhadGhhZkszeUdHTEl1U2d2dWF0TjZUa2x0WFBOVDZmVWFhYTB1?=
 =?utf-8?B?SlQ0dk1nMVFOODhGdXVYL0VnZ0dqS005MWlsdUdWcHNJQlhhazZEeHAwZjRX?=
 =?utf-8?B?eExobmU5blRyYzRqcTR6cWxzK3hvOG5VcVcyN2UyeG5MMStMYmRjd0xtengr?=
 =?utf-8?B?NGV4VTcwUDcxbFpveGpCSnBFNGZEU3p2bEhqV1lJS0h2eW84L0YyVVVBbzkw?=
 =?utf-8?B?NXJrZTdjZ3hKZ0NrSUVKY0hpUmZLSXFzSGJrejFsOHZ2a3Jxa2psYXgxVStS?=
 =?utf-8?B?cUt3NnlMRHhoZzdwbGs0M1Q1MmhFWnh5Q21zTWxDWFN4Zk5lOGoyNm9rMEVB?=
 =?utf-8?B?VXFCME1qcVhCNHp2RnlCek5ickltWjhPckUwZXREaEI4UlA3dXZQSTlQcWd6?=
 =?utf-8?B?dUp2VjRyenQvZFk5R0NWZmlzbEVnZitveHh4WDhCSHBWcktCZVJoSHV2Snh6?=
 =?utf-8?B?ZkNKRGh3dCtKM01sQkV5bkxRYzBvT1VTcklTam5xUHVRRUlrVU9ReHYydUw5?=
 =?utf-8?B?b21yN1F2ZEtHd0kzMTNrQk5iTUpFOEF6WnJDUCtTYlVoeHdEVTJzZkgrL0Iy?=
 =?utf-8?B?aUlBMHRDUnpTaEZvNi9XNWZJaXRkdTZSZjdHKy91ekp5ZmdjZ3BkZGdWYzdV?=
 =?utf-8?B?Y0hCOE40R1pQZ05QcWlOSVFGOXd2V1BnTnIyMkt3Y21DMFN1Qlp6UTI1alJ0?=
 =?utf-8?B?WmRjSjdsajVqaS9mR2RLcFVBRjVqZlJTVjZjVW9SNlpyUDJSc2lkSFI3Rjd4?=
 =?utf-8?B?WFdFMWhxUlg4Qy9FZ2lCbENyTzdyN1VWQkJ4TlpNai9zTWMxaGR0Z09VUC9i?=
 =?utf-8?B?M29MUjFZUnh0NTRZOUZzeGRUOXZaSCtxRTFUNXFud0NTS29keDZ4ZVZMVXZy?=
 =?utf-8?B?N3JSTjZuSTh3UEV1YkZML1RXQ1dscHgzelRpaDZLSE9iQTBIdkZNZldLWnVn?=
 =?utf-8?B?cUJra0dKRkh4dERHcktTTG5oREYxVkJxdFZvU1dwdDE4NnMrNHk0eldVdDdk?=
 =?utf-8?B?SjdYMU1Xc1dybEJOSUtrd25JOTA3cVNyVDBGVHY5ZWp0OHN4L2xOZXh6Tlc3?=
 =?utf-8?B?K2RLSXJPMFAwdDFGS1BlKytBU2VxeUNwM29WNEp2djVlcmc2bUFULzlyQVZW?=
 =?utf-8?B?Zyt0aFcxdXRsZjlGNEZFaERjNDJ2YWRuYWlBMCtVUjZoZU1FclZiMW9aNXNS?=
 =?utf-8?B?VHVLY3k2WngwNmp6MU5pQVF5MXRIUVIrMlROckhiTmtPdFplc1lUSXVWRk5o?=
 =?utf-8?B?aTRQMnBSbnRORTJ1Qk5OQ2tiNCt3VGJsN1kzbE9IdWU2dHZySjVlaGlCbEov?=
 =?utf-8?B?V2kxY3RmMzVjNnVLNW40ZHhBOHppL2cyVStnL3gxMTNZZ2ZlajdaZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb89d75-65a7-4b2a-924a-08dedeabcacb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 17:50:55.7708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NbNZCKdqgDmkYCj3y4g6gt4t8qJpy3fxkTCsAEJgmFRqzW1gkdFykDKp40av8N+jrdW+dEqiDsdQrv/OnI6ZX88h84pkqeVYMHkw5KGmKyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6349
X-purgate-ID: tlsNG-d62444/1783705860-6CA9D0A8-27299035/0/0
X-purgate-type: clean
X-purgate-size: 1102
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
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:andriy.sultanov@vates.tech,m:guillaume.thouvenin@vates.tech,m:marmarek@invisiblethingslab.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:oleksii_moisieiev@epam.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:teddy.astie@vates.tech,m:julian.vetter@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,invisiblethingslab.com,arm.com,epam.com,raptorengineering.com,wdc.com,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:from_mime,citrix.com:email,citrix.com:mid,citrix.com:dkim,vates.tech:email,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 9175373D1F2

On 10/07/2026 2:57 pm, Julian Vetter wrote:
> When creating a domain on ARM, and passing XEN_DOMCTL_CONFIG_GIC_NATIVE
> for the gic_version field in the struct xen_arch_domainconfig,
> arch_sanitise_domain_config() resolves this to the approrpiate GIC_V2 or
> GIC_V3 version the domain actually has, based on the host's
> gic_hw_version(). That value is stored in the domain as
> d->arch.vgic.version, but can't be queried through any other domctl
> later. Toolstacks that create and build a domain in the same call
> already have this info from the createdomain reply and never need to ask
> again.
>
> Toolstacks that create a domain and build it later from a separate
> process do need to ask again. But, the ARM implementation only fills in
> info->flags and info->gpaddr_bits. info->arch_config is left zeroed, so
> XEN_DOMCTL_getdomaininfo always reports gic_version as
> XEN_DOMCTL_CONFIG_GIC_NATIVE (0) regardless of what was actually
> configured earlier.
>
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

