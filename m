Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5hWGI9eEQmrm8wkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 16:44:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E89826DC321
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 16:44:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=hclfPskV;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1347650.1605485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weDDp-0000Ec-HP; Mon, 29 Jun 2026 14:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347650.1605485; Mon, 29 Jun 2026 14:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weDDp-0000CX-EH; Mon, 29 Jun 2026 14:44:29 +0000
Received: by outflank-mailman (input) for mailman id 1347650;
 Mon, 29 Jun 2026 14:44:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1weDDo-0000CN-QP
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 14:44:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weDDo-003zkj-2e
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 16:44:28 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a4284b8-5cb7-0a2a0a5109dd-0a2a4509a650-48
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:44:28 +0200
Received: from [52.101.53.24]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a4284ca-97e6-0a2a45090019-346535184d7e-4
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:44:27 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CO6PR03MB6227.namprd03.prod.outlook.com (2603:10b6:5:358::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 14:44:24 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 14:44:24 +0000
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
 b=mdZg89FHHsL1PbT19XUY9z/5BBcYwmHrI9ZjtSZmV9R1S+8aWNFJZLhTEUHcet6W34B6AdocG0oIUwgtVaPhK7jJE6wozVFgNWnFeK1bLn0T+4PfJS6BF+EdwusoEOrQ1SbRzysVJ6cv3HWQtB8JOqMOXs9j9HIcWKzqSCwIZvOp912571WCP0XQzMOhezt2RpqbGntyg0sEYRDkUVHG842i4JWkkEI/Px/CBuMAJ2cgPKeLMP5n9k4azwc6gJrHXtutu6upYk7vrs0wQz/m8QZ5wEGVVwCKCU3rHom8CdWkXHeVSVoaAT8IMNp4Akdn2XK/OI/my5+vmdEaLZAegg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5e7GOFqcAMsmly9qKlMY7zA6rOCcC4BtBCVQBAjDO6I=;
 b=m5arWTmldvb1z2DP3JvYqYa4eVNHzasgclWFFVyVZpW/3Avm/KV5W3tOyWh9zDlgU1RcYg2yzfloTj4dAaP4o2XMzuCRUJnDl05OV/tUxVpBxjNh5jEktpIiswcJDQMR6MIfnXvK/zYAsrhozq3OLrzdcvE7DaLl56sTsk9HGKXlXr5T/+mEd9uRCPSRT2JfSZX3e97Ec/kS9AOqbvXEv8Y52P09IOnlIBp3NXxRtV3ar1foFX3+loQTWUjPV/JQRBe+H1cRZoIyxmWTUaOaxxP5ss3dlX9w4gin2QMAZ0UTSKzSYa8GdUf+iikUV+chHD+JNU2XPojRZYigxqFjsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5e7GOFqcAMsmly9qKlMY7zA6rOCcC4BtBCVQBAjDO6I=;
 b=hclfPskV09PxR9bTvAuOvt+vVxdpkzJpOmvKKebA3N6GK2zyOOliWmaTm8+71d0NKuYMVHox0y1bG6PiUHVK9xu9jkd/bmNVDlVoE+Ul73D+D8mJlZ+V2f4orU0MPGwyuBsG4qntpvzcSSkcDLoaGaXkYO9sAKvnIcBZoVUcNVg=
Date: Mon, 29 Jun 2026 16:44:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.22 v2 4/4] char/ns16550: bound execution time of
 ns16550_interrupt()
Message-ID: <akKExHlTunGnNngj@macbook.local>
References: <20260629094531.55555-1-roger.pau@citrix.com>
 <20260629094531.55555-5-roger.pau@citrix.com>
 <f8251836-4b7a-4fab-9f1c-e95d4444b989@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f8251836-4b7a-4fab-9f1c-e95d4444b989@suse.com>
X-ClientProxiedBy: MR1P264CA0136.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CO6PR03MB6227:EE_
X-MS-Office365-Filtering-Correlation-Id: a8f710ec-3d36-4f29-29d0-08ded5ece95f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	sESLIeTDZzSEhhWB3zsGob1V8UnOsaiPR3igZFr0TqzlYjlY4lPZNgx9QvJ615M+GHbNKbmzP65umYkPYFYc2GWophZvs3I3zDhjxUC6zwQkrTPstVVD6HNOLd8o7eWiFoNPBxDHU+B3Ypdh5uknf8JLnepeJHHslHDHI4Ky/NtyPZpvOdemruVgcGNCy+/hz1T/Gd/QqruGwB1mpeDyhjzpIEtcz6Yh3FajA6e5nkzAXowH9Vf0RIPDLS7p1+8sQGzXJU/2NJOO9KUdTcJdV5X2UPaC3BEv7GbevuoujNDRprWaZ6Uk1Rk1GobBV+phkRgncTZoV9grD8petJLko0O6upMApaXo8blVEJTuRK83QV33tEl8jUtnPp/pmoNj+df7qKNJ6Ypo3JvA16DVPHVXJ3RZTyEaWT9SrA9DBE7d3O/9TKpGDMhUlWAC6ESUboIDSerZ7SNtbyW/udFqjV5sm5JclgdPmteIqCYwthytPNuo+WXA2bHsRmaOW9PUZKticut5HL1j/X+KdqzB7UrVk/041HZOWcfJOgQuYMFEiA/BZ0qdDbardWEFb4/C4cwEgWFYAgggaW55s+kFZVAmEuqqM+/FgefE32cbgO+3LddeiB2zjdXMk8ysPFd0MwyRAIzVtUKARXYKa1Lg/52G4NjlyG5FDfoPUBs/n4g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGJNdW9xQnpiUkZuZXpmVTBkMDVZZ0p0cFE0R21sWHY4S0dxN3FoV2hKK1pF?=
 =?utf-8?B?clBkZHVOZUNWL05yRW5zQ21INDAzZ0VHK3pWaC9KSm1XMVA5dVBacEhWcXRV?=
 =?utf-8?B?K2hBNGhRcjNzaVFlNE1kOHk3cURJQ0g1Um5Yam44ZjE3UW1zd3d1b3kwcVR3?=
 =?utf-8?B?TWg0ZmtEdHVhN2RVbDJjODAzMFZ1YzRpWEkvdXpURHp5ODZ1ZXBjOVk2TFVo?=
 =?utf-8?B?NThrOWpYVEMvbEtKZ1JzZzJMSUhLck95V0Fmakw3SlBCNWZXQnVtU0JBUWVP?=
 =?utf-8?B?Z2pmc09NV2VnQVlvWllaSlQ5SGZZUnBiclllVjdaOE9PdURDbzFzZHA5dDRD?=
 =?utf-8?B?QkFPUEE1dDB2SUtEN2prS3NSTlhhOVZKcjBFMklHYVhiZDFuUlY3Z2RMZGNV?=
 =?utf-8?B?WjhNc3dyOWxnYmJNY2lHWXAwSWZLM3lucjhsSTdRc1kzZnZ5cjBNeCtSWEJV?=
 =?utf-8?B?MWppaTczc0ZwRlMxMG5NNjhnWi9JSDdvQVlMUHE1RnYyRjhtVWZuaU0zWWlv?=
 =?utf-8?B?SnAzNEcweTV3dTVOYkkvTTNuMGR3bmFMS2cvQXYvdWNTNm02eHcxTERlK2w4?=
 =?utf-8?B?b0oyVGVjUmN3NlF5OVpySFhEZzkzUDY2dWdrU1g3bXBZbGdUNFh2Y2IrZFJG?=
 =?utf-8?B?TERJVGZEMGFGd0lUZTc4eWcvZGFZUXVFWkRJM0dDVVlnZUJwVk9zczc2VDds?=
 =?utf-8?B?QkFCNWdEajl5Q0xwem1ZVFhZVGt4dnBWUHRvZDd4NnN0enZMOFQ3VDd4dEdJ?=
 =?utf-8?B?RHVXRHhmQU1FeXN3bU1LUmgzY2pSdWVxRDh6bCtOTFFxaWJBK0xuenpZQmJo?=
 =?utf-8?B?dm9pcFIwRnUvd0VRcW9WRVJBOXcrWXZ1UEFDWGZhS3RMYWJUbzRlSXF0Ukxt?=
 =?utf-8?B?VlJlUGVtVFlWODhJNHA4dE9obVZuMVhhVEl3b1c5cUFqaEVCTE1iVTFaak5a?=
 =?utf-8?B?NmJERmsxRjh6RHZqaGh2OWtvek5JU3AwWG9KV3NLYW5zNzF5bU1SZndHalJM?=
 =?utf-8?B?bVA2aFlXNDRveXg2bjFqSk4xNThQQzhTd1Z1VmlDazdZdjJIai8xQWQyN1hI?=
 =?utf-8?B?cHdGc2tVMGt1allSeVlvbERFTzhoaEdxTEtTV3JieFNhQTZXb1kvU0kzd3hU?=
 =?utf-8?B?SUk0dUlSc0wxRlFQS0UwbnNaVXhVaGNjZ2lMMldXR2ZwSEQrQkh3R2Ywckkr?=
 =?utf-8?B?WXBJSHcxYTQ5ckZFMnQ2WE0rZ0QxeXhGam0wbEdxV3NBRThmbzdTWS8zOG5P?=
 =?utf-8?B?T0lTaE43emRhZllIalNnQnkxeGhoWnZvQXRmdDhuWnluc0kxRWUzMHYyRkhB?=
 =?utf-8?B?T1lQL0xHNnhibGFDeGJCcEZqcUxrQnBqUmRiS3JoY0sxNDc2VjIyZTB1Rk52?=
 =?utf-8?B?ck8zcmxtY0xTeThMUzRtMzdvZVJabkxzWE5FemQxQXFaa2FCYWI5ZVBiWEF4?=
 =?utf-8?B?V25QY1lMcThEMjVvRlEwNFVVQkdIdHhnckY5ajY1OG9ONVFBRTZFUDBwRkNY?=
 =?utf-8?B?RGlUcTNtWXJmNGVnVFA4TnJjNWNXZ3ZrVDRHekhUOGtyWjlNcWVuZ1BFN3RC?=
 =?utf-8?B?YlcvMXNLOTVNYStFbktOTjBwS3NVME1CQ21oRnRXSWJISE5VbURSTDhWM25u?=
 =?utf-8?B?Y0lWUkdwV25qMEhxK1ppVDFHVmxSMkVPSEZvTjZaTEdUMUh2RHZzcjVzU2tl?=
 =?utf-8?B?OU54K1JmVzYwRVE4U1diV0czUDhMQXFYUFo3M2dmYS83a3dBVXRLaWN6NDYr?=
 =?utf-8?B?S0lFclZudmVDMFdMZ3lIdDEvVWJmd1hsQlNMelhreVVHN3FJODV2emQ3U0ZO?=
 =?utf-8?B?dDlOVXo1K1h5b2xrNGUvSzVsdU5zeXRKc3ozOHcvWXc4bGpvOERudGcybmtE?=
 =?utf-8?B?TUQ3Sm9KUDEvSXp2N2VhR1UzNWsydFArU1hLb1ZlUzdIMGFTVW1vclhIdGY4?=
 =?utf-8?B?byt2NFpBcDZ0RW1vZGdxU0ZSSHlocFNwM0R6WnIvZzEwWnNSdDRncmxXS3U4?=
 =?utf-8?B?UnoxQkNsMWZIMnpZS011cjJaNk13akY4Y1Z0RDdUVGFEeGFKLzJrajB4MHhk?=
 =?utf-8?B?NzE2UWdBMGtJanBWazlLK2hzcmRlT3I2ZVJEOFliRVcxNTZLa1UvRTF3MmY5?=
 =?utf-8?B?TzZzemVVaEhFSDVON1ZTdndMd0ZOaTlic2x5UzNPMnBZRFVnYlN2djhxUTFa?=
 =?utf-8?B?KzBkOGxRWUYzcHhqYTlJRXBWTjVURFRZQmN1WVFhbDNod011Zm5NeEZ2WXVD?=
 =?utf-8?B?bzFXUkZRSEZ5eURNL3Vvbm5pQlphVElDZi9ibnBxN0xRT1UycElTaHJIaGph?=
 =?utf-8?B?cGhESmZjQUkxc0UvcktEQ2hpSUUrM0hYZ1ZZVWVtNW9kaEErazRYZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f710ec-3d36-4f29-29d0-08ded5ece95f
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 14:44:24.0130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: srkUn43f2ctSlZKJxwLH3ZcgSiHi5DsqnOGcx1iK6g+93x1CW1MfiKXSSdpopDZMbJgk1om6gdkXx7qjo/kR8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR03MB6227
X-purgate-ID: tlsNG-bad1c0/1782744268-4492A986-DF9953E3/0/0
X-purgate-type: clean
X-purgate-size: 1855
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email,macbook.local:mid];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: E89826DC321

On Mon, Jun 29, 2026 at 12:39:45PM +0200, Jan Beulich wrote:
> On 29.06.2026 11:45, Roger Pau Monne wrote:
> > --- a/xen/common/irq.c
> > +++ b/xen/common/irq.c
> > @@ -54,3 +54,15 @@ unsigned int cf_check irq_startup_none(struct irq_desc *desc)
> >  {
> >      return 0;
> >  }
> > +
> > +void disable_irq(unsigned int irq)
> > +{
> > +    struct irq_desc *desc = irq_to_desc(irq);
> > +    unsigned long flags;
> > +
> > +    spin_lock_irqsave(&desc->lock, flags);
> > +    desc->status |= IRQ_DISABLED;
> > +    if ( desc->handler->disable )
> > +        desc->handler->disable(desc);
> 
> I'd like to point out that __pirq_guest_unbind() has this the other way around:
> Call ->disable(), then set flag. Similarly move_native_irq() only calls the
> hook with the flag clear. Whereas fixup_irqs() doesn't care about the flag at
> all. Also considering the wording "disable" vs "disabled", I think setting the
> flag afterwards is better.

As this was done inside of the locked region I didn't think it
mattered much, but yes, the ->disable() handler might itself rely on
the previous state.

> > @@ -190,12 +191,38 @@ static void cf_check ns16550_interrupt(int irq, void *dev_id)
> >  {
> >      struct serial_port *port = dev_id;
> >      struct ns16550 *uart = port->uart;
> > +    /*
> > +     * Set quite arbitrarily as 4x the time to drain the TX or fill RX FIFOs,
> > +     * set the upper bound as 5ms or the timeout_ms value, whatever is higher.
> > +     */
> > +    const unsigned int delta = min(uart->timeout_ms * 4,
> > +                                   max(5u, uart->timeout_ms));
> 
> You may want to also update the description accordingly.
> 
> Preferably with respective adjustments:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks, I've applied the comments.

Regards, Roger.

