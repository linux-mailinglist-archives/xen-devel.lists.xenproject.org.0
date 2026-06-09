Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y485JBRIKGo9BgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 19:06:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C519E662C0C
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 19:06:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=oS0rF+VS;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1333695.1596869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWztv-0005Wm-19; Tue, 09 Jun 2026 17:06:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333695.1596869; Tue, 09 Jun 2026 17:06:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWztu-0005U0-Tv; Tue, 09 Jun 2026 17:06:06 +0000
Received: by outflank-mailman (input) for mailman id 1333695;
 Tue, 09 Jun 2026 17:06:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wWztt-0005Tu-BB
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 17:06:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWzts-00Dj5F-NU
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 19:06:04 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2847ea-2eae-0a2a0a5409dd-0a2a450c8910-28
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 19:06:04 +0200
Received: from [52.101.61.30]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2847fb-62f1-0a2a450c0019-34653d1ecc2e-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 19:06:04 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH7PR03MB7953.namprd03.prod.outlook.com (2603:10b6:610:24d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 17:06:00 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 17:06:00 +0000
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
 b=WN/Zh4VUw8H48DndWe+PFxxRf4rhNdH1k/5iY9K10v11FmEDsNX6+2Tb0fS4OcsGcr7vjSSi+yNT906+cw7MRPTiQ/KH6Sq8XCUliPdBoUNkoih95kwpLW2JviY+F+IGeYgRcOXsPPPG2UmQQ4EOD3Uxw7r+0ryPeHE1t4lKHuxKgEZM/6qDJz2J+/de+mnZV7c29bk32p6nduZGc6bbdP/GOPkLDENOqIQwl3KlcB9RVaej1ftVWkOhQ7B4YjTHNZ0/3/uiDIZqc2fKcLWsxuFaBtze4MtNXy1ynp1Bb9Zs0vhgSwTckK/hqXcRvYgxfaK5Kv5erIrwD3sgVPo6mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjLVxGHqeQXNiv+DlIzuvtQVJzPJba4K/dA5j/DRXy8=;
 b=yKxJ3esVj4JV8yHGZDuwQidapGEeusrKvq2eT2/BCCnN70Zq+Ka/7jnHMXe6HKlbb44NcwMqvdZSuSBSGzthOx01amlDLFz/rVREhshn1tOmiikm6ByWbxxYVBToPFWrodZdSLWSuLlSR50HK6eQNOxOW27o5LJgEbbj30BynyrWOOv9aOwu1rDUqPVQmXWY8fBj+e/lxzmQ4hv3oZpmVanTRCFTI2cdyJ7px+lsAFsVLq82pYB3J6MJ9pjEmrockELtXfHOfgyBLCAPYvZp6/CYLyjg2z/vyH7dJR1vogwgtkxxphBgHSj2QJYpgB+nifMQPlR8H8sKQYkxwVMb9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjLVxGHqeQXNiv+DlIzuvtQVJzPJba4K/dA5j/DRXy8=;
 b=oS0rF+VSKsZ3EZFSFoOffzH2GSreDau6AbfKMIIuu2+NVmr+y5Uwdug/hL71zwyjWOvOedU60eZiZBGJwJr+v595CFnHkl02rcUl/f/L4rbk+nprS3u7gUyznJjwZsvozQVFc9OB8B428IJHSwDWhrbzKKxRQw7nEG73YUlAtJA=
Message-ID: <14aa7799-96d3-4f3f-baf4-22ae457d7e32@citrix.com>
Date: Tue, 9 Jun 2026 18:05:57 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH for-4.22] xen/x86: Always strip xen.efi
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20260608173108.2848469-1-andrew.cooper3@citrix.com>
 <aig_sPP3MpBbddXr@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aig_sPP3MpBbddXr@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0419.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH7PR03MB7953:EE_
X-MS-Office365-Filtering-Correlation-Id: 12274b4f-0ea8-4406-bffc-08dec64961b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|6133799003|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	Bm7/Brioeov1ZlVB2ExombJGgauyGKuPIYlTa+4rTkT4EuYbkkoBemji9T/n+/gtDzXbx4SmTWgK+7Fu876E1/pvaO99Btzu05xlYYhAHkrEczMXrgHUDTBS9Gzt+ZlGObLC2kWc04G4X1sDgEDRUn4E7EIkRpwRnJBnY4+6VyCu22OtT2jSftOEgNdTrpggL4O4UrcQpkHwDFevGYK6HmK0FAP3g+mC1aRFt0gnUIP6oqaVriHVLXd8eWTtoU6tIyU8bCBW/07SUJB/HG0tOGYaL/dvBArjzDNGlKSfaHLaOCvuL1e1jvhYbvHWTh6jofe1tRaFthAuSQjEoqNcahNukSe4CT/C8/UTtcikq5yUx3dm5pdNBghWoteR330KkwuKmVHzfPvBF2VslRwsILyHZALLhLY7HV7icsNzWAu8Mf3/3Muvc+/SWEtieO6132ewXxLOqWKeIZUn3OxJ+UZGejfQJ8Mj+bbj9yCiIWR56WbleeMODa1A056Bt+UUJwrfI8DTkks2OIGgFKqu7Zzg/8WIS6RiHdZFUI2U5LkTz8jiQL6KuYvNSZPZlYeRB3QdjwPOYJgLaXgpcT+Upzyv3Iwm1L8oooqrDi2Sn3KWR1EVl9bhdhnLkrRydvlFXTHcwUFolVTTEJOcCr851w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTJabERGa0t2c01YNlloMUVEamt2M0xNellVNm1NSDRia0JkdlhnWEFNZGJo?=
 =?utf-8?B?aFE0WjRnY05SM2JIS3pHc3FTMVNJNGQraG92STBxWEtaZERYSlpTcE5ZWGdM?=
 =?utf-8?B?TDlyazFJUEJLTURCMHpEYXNUZ0lXQUszeUUxTDZneS9mQ1pSVDltSUZQVEEv?=
 =?utf-8?B?YWRtMjRCVTFIanBrdWlwam1CNTBmMG9XcDN4WHhWdWduVi9KTnJVWHdlb2dr?=
 =?utf-8?B?Sjh4eGZkZFhtTXpDOGt3K0RXTzhvb29oaWtOWmVUV0MvTjdFSnZpYTNsSHRX?=
 =?utf-8?B?TDBTWUx4MGdMUXJDUzRwQVJZVEFxRHVMbDVPRC9kYjdtenR6ZTZLZzQvcEFo?=
 =?utf-8?B?L2NieURDZ2tBRnp5aVNXKy9tRC96WWxoZk9UQ1h5RmVKZDJtZHNiSU51VUVk?=
 =?utf-8?B?NzNiYjB1bHcwcGpaZDFydGNjR0VLSTVPVVp0cnVreHdER3FSWVVxamlBR2J5?=
 =?utf-8?B?WCtTM1NRZHQzZUg3d3pUYlNhSUhMeElPS0I2enhPUExsOWdFa2xXNVM4aXFj?=
 =?utf-8?B?Tm1TQ0YraXE3SnlaT3dhTmQxMGR3SjArWk50U3hvMVMzNlF4NlpBY1Fld0dw?=
 =?utf-8?B?YmVjVmQ4ZTlNNnc2elArck5mMnFtZXh3bVBTTHdmY3NJRGpHcHFxZFBObm83?=
 =?utf-8?B?dGNoVG84TXZrdTAvNXoyeUY1NFFuQ3hhUTlaL2U4elpuK3pIZSt3dFdKeVhK?=
 =?utf-8?B?N0RzMmV3NkJ3Um9jK1ZtYmJwc1BVUlF2UElyd2NIcC9rTUJIaTk4M1BsM1VR?=
 =?utf-8?B?Yjdhb3NZYVdtSTVzcDhSMmNxNkZ1ckN5bTJMVFQzRExKYmxrV2RTdFAxdXA2?=
 =?utf-8?B?OWJuazF4QXZBMjFXK21HbHZhRmNBRmlhZDRBeTlQcjN6UmlDbVJ2ZmNpbGZL?=
 =?utf-8?B?WTc1OWc2ZEk2b3VaVm11R01vOFZtRC9VKzJkOUI2QnZocjhSOSt5ZmFlcDIy?=
 =?utf-8?B?bHlGclZPVlJSS1Jjc3FVMnF1cVdqYXZBVXRUc3pMWW8yTml3bE1OYVNjaXlV?=
 =?utf-8?B?VUpJdjVhLy96S29QZzNyVmFVYklBUkpDcmFWZ3lCaUZpVDM0SnI3VDJOYnZj?=
 =?utf-8?B?cFdmNnhTOGtLTWZaWjQ5VUJDQ1h3V2JtM3RKZlZaL2V2NUJPLzhTVHEwcC9t?=
 =?utf-8?B?RnlYd3llWmRueDF6SUtLY0oyTzFFVlV3UFNNdDRNTHJvQkhNMWVxdnlRWTIx?=
 =?utf-8?B?NWNvZ1pkRXk4Z2IvSVZwRVFaOFR1NEtCV0JYYXNmeFdIdDFYemxyK3NvZzJy?=
 =?utf-8?B?OU1lVk5WcFcxa05hRDZtZGdlcXlwVnN0UFpOb29KVEwvcytwRWFkYjVKMVdF?=
 =?utf-8?B?aVZXN1FUbFdOaG14cGNhZmtxNFB3c09YSkdYcTNuK2ZWOHE1SGNVS3dnWGlP?=
 =?utf-8?B?OXpRWHA0Y3RIK0N3bXVZMFU1K0dhL0twYXZRdy9FMUQxa1ZJNkpsTVE2NVBk?=
 =?utf-8?B?dDZJUHRibnNFREM4ZG4wNG1NbW43L0FtMkdsd2ljN2xHMVRLM0xVZjU1ck5r?=
 =?utf-8?B?THNkc2tvQ0o2Rk12bzRQUncyK1o1MlI3TzIyTW54aWtMRko5MDBpYUNGNllt?=
 =?utf-8?B?K3BFNFYvZUc4aGNiZk8wVzVJZDE4eXB6Slk3UXlzMEs4alVZcnBIcXhoUWo1?=
 =?utf-8?B?WXJqM2xJT2MrT0F3VmtudzV2elR0V0xrNkdoWnRsMkVUVGdMZ3F3bnR3Tzht?=
 =?utf-8?B?VElPOTZTSEJBNlJtcTlpRmpoRU9NZk9sL0tDTWFYQTljR003K29JaTVvdzI4?=
 =?utf-8?B?eVBJU2xFZEpOaUZsN1Q5Rld6TmNhc1ArRCtDbnV0K0xuc1lrSklNK1RaTWhi?=
 =?utf-8?B?SU9XKzlKUVUyUnRpbi9nTEFtQkRVb3Y2STAwRUROWmlIeFg3Y1NXWWtMWW5I?=
 =?utf-8?B?cVFYSW9yY0hrMnpKVzRUbDVzWnNGRVh6MDRDK2E4c1ZzRmhPYkxLbEtEalEr?=
 =?utf-8?B?WGt2SnkrWi9xQUwrUHBtSnp2Z1dEQzZ2dVZsR3creDV0MmZLNjFhWDF2T0hL?=
 =?utf-8?B?TXZsYktyeGV0dm9NS2ZSWW80bWhXUHMwU1BhVExHZVZYeUExM0tPWmZIc2lX?=
 =?utf-8?B?VWFFbVB0Q3QzdEFxL3BqVUxiVUNvT29OWmFKd0JGTzdxVG1mUHUvMHl5Zkh3?=
 =?utf-8?B?TXMwemtaZlRKN3IwQm00WFE0SDJqOUdkTVhKRjdhdFR2cWVreEJFNU9JOEZU?=
 =?utf-8?B?V25TMnptUlZnbk1qRkJrMUswNTRTbGZWWG1BYXp4S1FoSU9taG1mVFF4cGZ4?=
 =?utf-8?B?bUJRaW1BMDVscE56QWF4c0tQelVkT1VTQWZJcDZZRjhZeEk3WnMyM1JEUUJ2?=
 =?utf-8?B?SXVZOUp2Mk00MUQ4MWVzcHpXbWQwUnBVbmtteWtLejZoTGVKdnhFRUlmSklB?=
 =?utf-8?Q?7AgJTB7ExKfoPPBw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12274b4f-0ea8-4406-bffc-08dec64961b9
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 17:06:00.8582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rEWEGYSp1HM8BqPqWZYL/4b0qjbjObcCPa1HTpQa6cVird5ZEHIolDp9C/uJg5t53DwBZcTr0oqODch9NeWM/Xz2mwyt/VGh+reHGuzx4iw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7953
X-purgate-ID: tlsNG-d25034/1781024764-E176ECF5-5800729E/10/73395122804
X-purgate-type: spam
X-purgate-size: 4072
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
	FREEMAIL_CC(0.00)[citrix.com,lists.xenproject.org,suse.com,vates.tech,gmail.com,invisiblethingslab.com,apertussolutions.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C519E662C0C

On 09/06/2026 5:30 pm, Roger Pau Monné wrote:
> On Mon, Jun 08, 2026 at 06:31:08PM +0100, Andrew Cooper wrote:
>> From: Frediano Ziglio <frediano.ziglio@citrix.com>
>>
>> xen.efi with debugging symbols is ~45MB, down to ~9.3MB when stripped.
>> Multiple firmwares (as seen by QubesOS, Trenchboot, and XenServer) are unable
>> to boot xen.efi when debugging symbols are included.
>>
>> Either way, having debug symbols by default is abnormal and contrary to how
>> the non-EFI path works.
>>
>> Produce xen-syms.efi unconditionally, just like xen-syms.  If
>> CONFIG_DEBUG_INFO is enabled, these will contain debug symbols, and if not,
>> then not.  When xen-syms is processed by mkelf32, the debug symbols are simply
>> discarded.  For xen-syms.efi, call $(STRIP) to produce xen.efi.
>>
>> Some old versions of binutils ld managed to produce efi files which the
>> matching version of strip couldn't process.  This includes Binutils 2.26
>> included in Ubuntu 16.04.  Delete the workaround for this bug, and require a
>> less broken toolchain.
> We should then bump the minimum required GNU binutils version in the
> README, as strip is also part of the binutils suite itself?
>
>> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Teddy Astie <teddy.astie@vates.tech>
>> CC: Frediano Ziglio <frediano.ziglio@citrix.com>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
>>
>> For 4.22.  This was posted previously as
>>
>>   https://lore.kernel.org/xen-devel/20251208133945.61375-1-frediano.ziglio@citrix.com/T/#u
>>
>> but merged the two patches and rewritten the commit message to make it clear
>> that failing to strip xen.efi is causing boot failures.
>>
>> Previously xen.efi.elf was produced but it's unclear why, and unnecessaerily
>> different, so I've dropped it.
>>
>> While this does want backporting, it can't be.  Xen 4.21 and older still build
>> test with Ubuntu 16.04 and choke
>> ---
>>  .gitignore            |  1 +
>>  CHANGELOG.md          |  3 +++
>>  docs/misc/efi.pandoc  |  8 +-------
>>  xen/Kconfig.debug     |  9 ++-------
>>  xen/Makefile          | 19 -------------------
>>  xen/arch/x86/Makefile | 11 ++++-------
>>  xen/arch/x86/arch.mk  |  7 -------
>>  7 files changed, 11 insertions(+), 47 deletions(-)
>>
>> diff --git a/.gitignore b/.gitignore
>> index bfc7bdf043c3..49e2c6961768 100644
>> --- a/.gitignore
>> +++ b/.gitignore
>> @@ -224,6 +224,7 @@ tools/flask/policy/xenpolicy-*
>>  xen/xen
>>  xen/suppression-list.txt
>>  xen/xen-syms
>> +xen/xen-syms.efi
>>  xen/xen-syms.map
>>  xen/xen.*
>>  
>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>> index 5cf19372a361..71d1e9ab8c69 100644
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -14,6 +14,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>   - On x86:
>>     - Enable pf-fixup option by default for PVH dom0.
>>     - The libxenguest bzImage loader now uses the system liblz4 library.
>> +   - The install-time environment variable INSTALL_EFI_STRIP no longer exists.
>> +     xen.efi is always stripped, while the symbols remain available in
>> +     xen-syms.efi.
> This is not x86-only, AFAICT ARM also seems to have a rune to generate
> a xen.efi image, which will be affected by the removal of
> INSTALL_EFI_STRIP?

x86 and ARM are entirely different, with x86 being the weird one.

ARM, like every other systems codebase trying to do EFI, is a raw binary
with hand-coded MZ/PE+ headers.  In our case, it's deliberately a
polygot which is both EFI and Linux zImage.

Notice how the rule is this:

$(TARGET): $(TARGET)-syms
        $(OBJCOPY) -O binary -S $< $@
ifeq ($(CONFIG_ARM_64),y)
        ln -sf $(@F) $@.efi
endif

~Andrew

