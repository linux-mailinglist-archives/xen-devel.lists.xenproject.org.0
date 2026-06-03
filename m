Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BpjqC6g1IGp+ygAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:09:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B48F6386B1
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:09:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="TgOE/DFi";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1326458.1591903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmHn-0004tW-7a; Wed, 03 Jun 2026 14:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326458.1591903; Wed, 03 Jun 2026 14:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmHn-0004ri-4p; Wed, 03 Jun 2026 14:09:35 +0000
Received: by outflank-mailman (input) for mailman id 1326458;
 Wed, 03 Jun 2026 14:09:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wUmHl-0004rZ-Q0
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:09:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUmHl-00Fuav-6O
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 16:09:33 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a203594-2eae-0a2a0a5409dd-0a2a450aa656-38
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:09:33 +0200
Received: from [52.101.85.21]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a203598-56b3-0a2a450a0019-346555159c13-4
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:09:32 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV3PR03MB7780.namprd03.prod.outlook.com (2603:10b6:408:28d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 14:09:27 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 14:09:26 +0000
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
 b=OtCLJTgBzLsY/MGvB9nsXgkocJabnXUTvhRFmsSO9Yt3MpnnI8kS63+KzYcWPzR7k69vicKJuXZihnzwARxvTn+8U1JZO6jnkQoakO2DbD8T0tk5isAPlUsfFXGJ5++y+vVg0vy/pTFmWLajs6Dv8d4VKzKTWJL3wJjTooHuXs7yg9rMyudGGOlkDLVDjFL21Nz80+PE7Tsq9nRDDpHh+HliRYWzXF0uua0Y9HZChXlkF8aDr82Zwyb/5yvaEPD8DlxzGRXPGBDzkA4Oq7xPQZGgzkEedhwcOnomStlUkpirxhEcq36PQFaeseOqjgP55qivBtdNNgnE0UGu4wGAyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgWBbqUzXSksfQ87V4PcN2EEQwa0ggyTG32PbFywC2Q=;
 b=mdnSv9U7xLEfc1bEWk/HTtCC95qSXFxuQaC24orN/st7zHzgXyndApcWRbD1L9p0FHFOf6kaF2Wi2TZHu5bHJaKy4NtbMghq6LWDLyvyItKHFTekffdhV3/XhEM7NvVHwQfXTq/TVW1zQ3FiagmGQIVhSEFps8XKuGjBMhHwfC+SudUb8idE4FGUd2HKN+rv+5XD22ZwVhe/sZk7ulHJCMsU7EUi2YQuIJDGKGfaGRTyNWefLGYGlDSgUPAStmoMkJ2BPh+lLz6YMP2CWb0We6D4uWKanbs9JKA3J3/fvHDY3qi+cKuOdTOcTvFgpBE9eWdYiubpDBz/0NO1WbECCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgWBbqUzXSksfQ87V4PcN2EEQwa0ggyTG32PbFywC2Q=;
 b=TgOE/DFiih9A6xbncyfs9MKb/9JwqV3dP5U3vInPhF8Sy6TInD6JYnPQzFn85aWAIVINFT3UtpLE1ypN8XgFlOGFShZ0XD7hFQ/rNBapxOQyGlEdGPAaB6Lkc4VYuXA7oVMq8PDC51ZE/ms9W5tKApXpyu2HvhBFIkS8NuQ5V/Q=
Message-ID: <1bc5ffbe-6bbd-423e-a77f-f810710181b3@citrix.com>
Date: Wed, 3 Jun 2026 15:09:22 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: Re: [PATCH v4 11/16] PoC: libs/guest: use foreign copy during
 migration
To: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
 <20260603130603.776452-12-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260603130603.776452-12-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0024.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV3PR03MB7780:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a139cb8-d85d-47b8-a552-08dec179b8b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	zgpj6veWER8qPyuyRiG559q/tn4xBV5iBbNA1r+rkRqIN/wQ6ARqL3tVbIxIJWY2cncKbA6Ur91G52a5iHqVw4xO5/dXwOkEVyhoIIr6EqKUShWpGzQPGjO7iUoeUjV7Djb7qd6yvRJ9I8W+caKqv3p+Bb8BRhYWeyKI9lDaxzPJ2Y6JM22jlU8sOErxnUbN2gMABTXasmgVRhdVu6GV/CFl/qvuZWLmtNjCHhQ36g7+igoiAD3giHyvp9qQu8NwtwOyisqJv5AzTfk+GQDDaORTDYDqsa+PorNZxQKF5ox9GBueBTbg39wQ7cIg5ZfwegkG6Zs2aPw0kGnTeyh58iVWylxwest5Hpp2ExGx2A6UbAEAVk+osOn7JpsR3OuqW7xY51trQ+o8KeHuuLjDL9J9cL/7YOrsvn6Er+NaCS63NFfbkqQzoeQ0kBtX1azuv9dPdi/m8wBHpb0+PnAd8mWeQowmVNZcUZoMj7u3z9Ojy1b9kxPlt9YqDrdrIp6g02s+WJIlqtaVtqTU9YnH/7jbFEB5yXegNF0Jwmu8L63kzmdEmBEQYnaWMHYDK3PFh/MrY+GqxTLaBPREVZnJExfNm+KSJmFCUloH0YVwogDPmcLoDP0eJsCfAgnWxZFGrYFPZOkVXFgFlb79F+KXVYD+QHKFYqV6pgTBbpbP3XKd/PhzR/oHnObK7S+xAaxh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHBjNWYyNjl1Mm1EbHJKc1RPcGYwT3VGK05DZ1crY1YwLzA3YmE3akF1bHR0?=
 =?utf-8?B?MGd2YWxoSmVCVHFNNFJrOVRSWThOcldFWXRCamZoRGhPSG9vLzRUaElwS2lH?=
 =?utf-8?B?T1AvYnhRam5mMkhNU0t6TlR2TnpOYm9qUzc3bE5DV05QVFRQalVWcVNneHdw?=
 =?utf-8?B?bTZ5QWVNdllndjNQcDZEenkzbmlDZEIxUlZiSmZuek9JYUx5NllnMnlmV3VJ?=
 =?utf-8?B?K3loUjdZMWJ2NkdDTkwvd1l2T3htNnZHQXAveWZ5UUYrczY2YllJWGpGc1RJ?=
 =?utf-8?B?TW1sL0svRU9CZkxib1pMai8xSWVxWGlENnRZUmVNM2VJMDBxWjNHdWo2MTdw?=
 =?utf-8?B?VzZRLzgrNkhYQ1B5dmpiNjI4ekNmT1k2UWZvTCtSMExDYVJpQnpTdVBBamp1?=
 =?utf-8?B?Q2pvdFZqM0JlNVQxb1BKaEp1bWhxZTRnSGk4SEpuM3g3Rm1WdXg5eHc5aU9J?=
 =?utf-8?B?WW93REVmdjA3S0RGclVlS0lyeS9RRzJKa2pXOGpUMXlxbjU1NU5ONHpPNjc3?=
 =?utf-8?B?angrSXRNYzJGL2c1cjVFWVpITWRXcndoU2hxY2VnOTU4SXlhczZvMUdmVEJ3?=
 =?utf-8?B?OVBSc1UrcUN0Y1ZBaDhQblEwT3d4WUFWc1p5czB3b2RYaDVWQTk0dE9yaXlR?=
 =?utf-8?B?T2ZrLzNqZ0FNUkRtUDdwNy9nazBmQVJ6THc5dUZSVWd0c1JUUXlJS3M2ZzBx?=
 =?utf-8?B?RzFFTHk4STVPSVJtTG9tZTJXR3dKc3FSTWZjWDVMQ2ZRd2lMa3VBUlowN0FF?=
 =?utf-8?B?a3hDeitnRFRrYTFRSGxIYW9zSWpxMnlRZWhOYXBxdTM4eU9KR1M0NTNNK1pG?=
 =?utf-8?B?eUhmMmJFUHAxVmw0cnU3aGRWRlZhd0EwdGo2dDZPaHo4V3hUa3R3ZnVTYkE3?=
 =?utf-8?B?WjgzUzgrTWRQM29CdDZkbWxNK0hSYlJHR014U3ViNm9vWkJwT2l5ZmFQWHpQ?=
 =?utf-8?B?YUdEeWllZ2pndDZSMVMvaEhydlcrcmlWZXNQUnlveVcwUU15ZFRZelR4cVBs?=
 =?utf-8?B?amdNeEIwVEV2RTE1VUMraU96VHFHditnMWE5akRVejZaaENIbFdxcmc5QVFZ?=
 =?utf-8?B?bXUwdERLZXd0UEZ4WVQrdjIydGxtTW1xV21YL2RBN1NRYmNZL0hOUUx3aEJB?=
 =?utf-8?B?RGs1djBMU3djZzdMRktQYzV5QnJuV1BkQkRoVmtjMzErN2dkYTRwZnVWajZE?=
 =?utf-8?B?VmVrRFkzM2hoaitSam1pZVZqZ05SOExnUDhKYlByaStnYUxhYlkrZXFwdkNk?=
 =?utf-8?B?ZEVWS284QjZTcm4ya1BENHFVRFhJTXcyelFEa05Fc2UzRGhUV1VjNjlIQUdQ?=
 =?utf-8?B?TEUzV1VXK3gvSGNqM0Z5bHo2dkxrOHNUVFNwRkJsV1YzbTcyVTBYdTFTT0hF?=
 =?utf-8?B?Q3JBOE95dnYvM3BLOE5IcW1SazRTUktpbitoa3hyNXR1UFFZNWhObm03Y3JR?=
 =?utf-8?B?MFlYcGVqSUprSWh1WjJxaGJnQlJ0TzdnQzdITGdBTzhpRlcwN2NnQm9JRFI5?=
 =?utf-8?B?cGhWWXVPcWhKcG9hdURjTlN1dVBVdTlQaHBSdXovTGZTMW1YTzFnd1hpZitV?=
 =?utf-8?B?NmF3N1NWcldDZ1UvYzc2TTRRUHQwd09YSlFSS094WDEvTjlMaENSVmlnTEpE?=
 =?utf-8?B?MjJoL3MrTzRJVmVwVFZNbnFwNmdJU2FUNnkxT21aNkZnczJUK0dWeGg3blkv?=
 =?utf-8?B?YktkQi9oakM1c2NnWlZrdzMzZ0J4S0pFQVVNUUErZWhWMTRkUGZlSldLL2VX?=
 =?utf-8?B?dGg5YVB4MWRKQW9FckllRmMrUkFzVk1YenhxVXd1WkhIaEZaWTFMSnYzMTZT?=
 =?utf-8?B?UGx3aEZKTVpBL1M2TDBFRUgrazlFZC9EUnZWNkQ2M0Q3eUpuVFVwd0ZWMzRi?=
 =?utf-8?B?TWlYaEQxZUM1N3hZMTB6SG85bGZkNTBSTCtKYXFHU1crcHc0Ylo3WHZXdDFJ?=
 =?utf-8?B?RHJ0UWxwb2tXbGN2TmNPRWQ4bTU4TW51Q29RdGV1cDJkWkQ5dUVxbTNMNHZK?=
 =?utf-8?B?bVJCaGxXaHpueCtFQUo3MW0zWTNhUWdkUi9xZE56a0RhdUpYSEVuQ0NaN2la?=
 =?utf-8?B?UFJ2blFVMGhYeG4rNm5DU2xGMVdHUU9EN21SbXVhc0FGTGx1akg5Q1RwMXVE?=
 =?utf-8?B?cENnNGEzVTBjNk5rYWRaNW90dHZiTnVoenN5dHJmWXJZNmdyWVJSWEsxcXNL?=
 =?utf-8?B?bG11MUlVVFhSaFBuK2lqNmJ1TkV3cnpONlBDNENUcWgxSG1aN05HVElKMnJW?=
 =?utf-8?B?dVh3RU9vUWRucGR5eHBaNGdzQXNIcjkyNnZacS9PZjE1UW9ZbUo5U2p5U2RG?=
 =?utf-8?B?TGZhMlhOcnVrMjN1WnFocWpMT0l4VkdXdkdFM1hlNEN1QVR6eTlLdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a139cb8-d85d-47b8-a552-08dec179b8b1
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 14:09:26.8887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DxomglauPHNPA8tso9zHytu+z911a4jjivWIPy88etjipJ+YtVwZE3AOiYOkQ59mkNoMFWeRy7EjPOEeJLWCjf216LhwQa9yUwoxDYEcHCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7780
X-purgate-ID: tlsNG-4011c0/1780495773-7DD828B7-F9E82BF6/0/0
X-purgate-type: clean
X-purgate-size: 1681
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:edwin.torok@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:frediano.ziglio@citrix.com,m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:mid,citrix.com:dkim,citrix.com:from_mime,citrix.com:email];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B48F6386B1

On 03/06/2026 2:05 pm, Frediano Ziglio wrote:
> From: Edwin Török <edwin.torok@citrix.com>
>
> ministat confirms the improvement:
>
> ```
> x baseline
> + foreigncopy
>     N           Min           Max        Median           Avg        Stddev
> x  20     1.1306997     1.1447931     1.1356569     1.1365742   0.003242175
> +  20     0.4311504    0.44180303    0.43616705    0.43600089  0.0031094689
> Difference at 95.0% confidence
> 	-0.700573 +/- 0.00203311
> 	-61.639% +/- 0.133355%
> 	(Student's t, pooled s = 0.00317652)
> ```
>
> The tests pass too, which means that it has correctly migrated all guest
> memory.
>
> Frediano: This PoC was adapted to be included in a final series.
>
> Signed-off-by: Edwin Török <edwin.torok@citrix.com>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>

This patch is definitely out of order, seeing as you don't introduce the
new hypercall until the following patch.

But there's also absolutely no information what those stats are.  From
memory, I think it was wallclock time of migrating a VM, but there are
no units or sizes of the VM presented, so those are just random numbers.

It also doesn't state whether it's measured from a PV or a PVH guest. 
However bad PV is (and it is bad), I think the improvement will be
better in a PVH guest, because the foreign map/unmap operations being
replaced are even more expensive in PVH.

There's another area in libxenguest which would likely benefit; domain
construction.  Even with kernels and initrds in the MB range, foreign
copy is probalby a win, and it surely will be for e.g. the ACPI tables
which are a few kB.

~Andrew

