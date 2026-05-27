Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FDMLiIBF2p80wcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 16:35:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3121E5E5F3C
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 16:35:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320582.1587862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSFKs-0007gL-Ae; Wed, 27 May 2026 14:34:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320582.1587862; Wed, 27 May 2026 14:34:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSFKs-0007di-7a; Wed, 27 May 2026 14:34:18 +0000
Received: by outflank-mailman (input) for mailman id 1320582;
 Wed, 27 May 2026 14:34:16 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wSFKq-0007dc-ID
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 14:34:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSFKp-005MpM-KX
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 16:34:15 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1700d3-2eae-0a2a0a5409dd-0a2a450ab5b0-34
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 16:34:15 +0200
Received: from [40.93.194.27]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1700e5-56b3-0a2a450a0019-285dc21bca18-4
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 16:34:15 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by IA3PR03MB8021.namprd03.prod.outlook.com (2603:10b6:208:502::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 14:34:08 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 14:34:08 +0000
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
 b=jbThJ/OfMKL1NYAKBsQ8tRRhgH+VnFAwUVEYdH1vf9jpxwIPpkpKf86wlf6HfbsQ4e26lhosGYvXegbc5yZs0PPinakHbyqZJhhndaHbhII60H7CYyHzKwcCyaUMxIfaeywtWHnIRGaL8wNVS4cZohUilrcDnV3FXZWj+Uepa6kdKDj1XgJxUkkjnYXR61mPKXK8seTWIYwmcX8unpihyuulJ4VvogeUCL5t7ZCM8tToWwZcM8wlQrKZDL7csRgARdGONpVG2V/LutqzLbp93AJwu3wJXdZMb+GTvIXQPZy2ztZCjSFzWnVuYx75+JD8zmv6mEnAowAnwVM4snWsIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9L2Mu1KrNMAjehP1E37RfcDrG3fxTSBlXRii7MMts4=;
 b=lU8HHWSivaHcO/0+wW3nRTLF3j0eX0R7VK2NJ7C+R1T3w+8DNmcThxiXnmyckqMR+Le2Hxu0lsIIZz/T7Ol7CXHrBebKRFGCKCTdAwrdXzAIAiq5EhDcUkfz0FBdjBKZg5zoD9NG7t/W66/ShXkY0nX2ZBKzIF1oG0WAtpazqRkEWSjsYdWMA6+1rtjeP619nk9NY19x5VZPN3eNoYbh5DEosTI6Q+HJGId54CjrHlSQnfSSljSHMy7F9jNtli1rJ97Vd1CMg62exeACTx6XwJ2s+6fz33yv3Wr5z2Qvxe9IhbRiv/CZuNmesT7r+MGBCUqkQKodvbcjmpCOoPGXkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9L2Mu1KrNMAjehP1E37RfcDrG3fxTSBlXRii7MMts4=;
 b=A5xJZK7YqdOrDoq1/gXRjZ+dabtiFt/+I5KweoSR0TtOY0A8rhY8kLeeb19zRtnUTBY6agpJEPac7j+h4ZfA/NhBJlQbRBW8k+XmZOnC4H1uDTGi3SiQ/MSjBYtNJFn99mgeVfHK8GQteqy6a1ZEMPPv7qaoskNNlgpdmO9S2n4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 27 May 2026 16:34:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
	Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] vPCI: resolve MISRA R10.1 boolean arithmetic type
 violation
Message-ID: <ahcA3EbeHu2ErSrs@macbook.local>
References: <e23266191a366abe66d8104783d97578aa8734a4.1779428826.git.dmytro_prokopchuk1@epam.com>
 <984c91b8-3d2c-4431-bdf1-4a333ac341d1@suse.com>
 <alpine.DEB.2.22.394.2605261508390.182011@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2605261508390.182011@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: MA3P292CA0052.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|IA3PR03MB8021:EE_
X-MS-Office365-Filtering-Correlation-Id: 9585a6c3-56f8-4301-55f7-08debbfd027e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wvo+pMMQaMvMs6yaWJJJWWUW5ofDijYfgH69jyfyplr3LfO8CbRtU5MQnILiySRnB4dRE9zvHDa5XrS9Hs1Xnf11gR8CQAwjOCJnlIeG/UwSY78KY3DqJW7S5FAhJ17fPmeFdsI5VImgEVnaMt3cl06T7DS083VDIedaClFk0+E8Djm8dVjRwRgGA62K08HDnjqbCJ3DzK3QHruqKHDmQCLS26AUzQytAHGoFIDIGP5ZJlMbXz6oGlGYycZWTXyRyjA/Q6sD6UgU+Noa3KAhf5MT7I2BjTD4HwChfIIOVX1kGdfaz3NLkJXunZpfOw2n3lTCony1eCwfqK+Ygez0bLmvQ4ImgFmOYxVo8wBzI+TMnV7rRbtlN6uszShHhW0311zfdBGnfYqVmUxgpEUAqu6TZwiBuxRdwWBIYS1YR3+E2Ipj7gh5UbFPhZZEX97mjLjLWstICw1s8RodzEn50zEYL8bB5X/vVpR12zcVl8nXJ/FnQKD2oCXboK5wb+wPBV7L4QzgFcuEjcH/zYfHK3lFBNAwIWTQOBk/ZU6CAQQZAsAAWlI92TxLwRQwFLADwHDTxwM7ya5AUXo32wxyNPjRrxjTAjFHlY94yJBDEjjWJt95CfWaOvLEz/EjAItkmAexQbQdq6fVVrC2PdnFdDYFdKT4abQ6WIFmRfO1cuotEmouEpIm4kt4VSVnNlBe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjlOdENFaWtGWWhtY05qbDF1eS9JU2pHM25CdTQzN3Y0eHlrZzYzcWJRbm5m?=
 =?utf-8?B?RGdzeVZ1Tmt0N2JmUkhNNXBRTkE0OWVxblNaZmQyYVI0L0NNYW5LRHhqOWM0?=
 =?utf-8?B?WWhGVDJ3eTEwRjJWVHdSLzZ4Vi9sRlJON05UazBwN0dmV1pvd2Fjd1FaTVhH?=
 =?utf-8?B?YmJSc0FqWlR5ajk5ZUtuQXNxRHc5TXVYZ0RQcVl5MXF4ZWx2QjAwZXFoTTV0?=
 =?utf-8?B?cFRpKzVnaWxubEZKS3o1Rmk2d0UyR1pjTHZ6WlVGTmlidUZ4OXF2MEx0RHFT?=
 =?utf-8?B?KytDL3hNd2FveEg5T1dxOXRwcVF2bUc2elI3RkNqbThqTUF0cysvb0dHOGtj?=
 =?utf-8?B?RWUrcUdVdUNSNkh3MEdGSS90bmhOMHQ0R1BDNUVOQXBSQ215aElkMmt1UDg1?=
 =?utf-8?B?L2NhY1VNR1FyZFJyWGYxMmkzUEptQU1raHk5MDhVVWdCM2trSnEwQU9ZVnpa?=
 =?utf-8?B?U25Gc0tidmpKRmdLRUZ0eDB5WGJvZDNEZktmeG1pTm1QR0czSkIvL3cwa1Vj?=
 =?utf-8?B?T3IzbnpqdDMzOGdZZW1tbW9ta3FyNFFtL3BRQjdCZlZUTlJWMkQxQ3liRmVW?=
 =?utf-8?B?YTdPekJsOXVSSDIzRXRTMVA4ZkNKemZBdXhOZ2NVNzhoSHg4VUxzcGtwOVlu?=
 =?utf-8?B?aDBkNE1xUTdURVhKOU1lbGRwUmxiczJSR2ZJMmNhL0lkdW9vWm9pSWZqWGpP?=
 =?utf-8?B?RHp4U2RHeEZJOG5RekJqclVnRFVwWWJmVTZCMlBVcFJ2dHE0NlZaa01zY2VK?=
 =?utf-8?B?Vm9IeHk3OUd6cnVRNEVQb1R5MjU0OGtiNEF1Qm9LR3Y3Q0xXTmpYdVI0TTcw?=
 =?utf-8?B?SE5vZE9ETFJONmc4Ky9rR3VUemxkY0FVWGc3OHMwWWFyTWtORE1uc21CNk4x?=
 =?utf-8?B?NThIR2R6L1hPRU91Njk1eUdsV3VTRzNGTWF6UkJhRmErakhxTUVNdWxwWnRq?=
 =?utf-8?B?R2h0UGhQbU5taXBqbk8zdGhkeGI3MWJ0R3BMOG9QNThOYktqYUtLN3NXTWxK?=
 =?utf-8?B?NTdGcE5xUkpOa1JaR2g1ZXN4L1NuUlRtUDlIK1ZsTi80dGxEMG9iUmpMOFlu?=
 =?utf-8?B?RGJkNEdSS2ozcXVvM1d6aVR5cWxOTUtIMG9ZdFhGRUt0MjJMN0xCb0RHbTc1?=
 =?utf-8?B?Q0dNWno4NE91a203T0JwS0FVNXRtbnVDKzg2Nk42QU1CTGV5Y1VwSGlPQ3dG?=
 =?utf-8?B?WjRzVW4yVUZYRFkwd29NVWN0UEx3OTF2ZXNaWnZ3MFdaKzdnSU5DMjJ6Z1A0?=
 =?utf-8?B?ZERNaVduSkJkbFZreFJ0cjdXOGEySXRyNHliVE9aQkZOR2FZUHl4bG5iZ0Nw?=
 =?utf-8?B?c1p6Q1pMdWI1V0V2d24rN0ZFVnJYdUpWT3VoaStZcWk1SlEvQm1qK0p1SjEy?=
 =?utf-8?B?UWVrTzgzeUdhNWdrUEJ6cXpkMlpFMFpmejVzanJwa1cvckpSOWR6aXQzYUNX?=
 =?utf-8?B?b1BWUUZjZnB2bm5yMGIwd2pZQ2I2YU4zRzQ4U0h4b3V3VWVURUdRcVpTaHAw?=
 =?utf-8?B?U3VWcnZ3dm1MRWIyUStoUHJ0d09DcnVEZDdrZzhxbGVKVWVCYjhlMVJZSGdT?=
 =?utf-8?B?RjkzcnBtQzZ6OVNGTnFFZGZXRzUyazRCWXpyc0JBOWpTUHhOWmFjMUd3blYw?=
 =?utf-8?B?RVM4WGxCRHJEdWZmMnN3dVVza2F0SWlGQUNweCsya3pTbERvVmdoVU9WOUVC?=
 =?utf-8?B?ZStBWjUrdGJneGozcHZURW9kc3RyYmllT1RKSGY2cEFwbnA3SkNuMWZSajla?=
 =?utf-8?B?NTFFV29rZHdsM1ZpUlhESDdMRStnR0szU05QZGdCNmVNbGUrVkRLdy9VMGts?=
 =?utf-8?B?MC9MQ3dVa2tvRDNNTUNyK1VvaHd5WU0razN4OW95WmhtNXNCejczc0hqMm9n?=
 =?utf-8?B?TjY0ZmVwREc3djZTYWhueW13RGN3N0JXdktUeWtndGpKNWhaVWk2UE5iSzRi?=
 =?utf-8?B?dHFKcS8zSEwyV1lGb3g3UXR2U0sxVTdISzR5Z0JadHpOWmsyZ3VkNUU2NU5k?=
 =?utf-8?B?RmxGcmQwU2hrdE01L0svYlA2dE92MCs5akJyc00xbVJ3eEJsK2paTlp4RnVC?=
 =?utf-8?B?UE55dGR1VE1VT2ovQUhldE5YdmFSUHdDck5vUzh3UVUzQ1RWU3lPYXJFMEtn?=
 =?utf-8?B?eWZCZEtZNFFhRkNHVmZjblU3NjJadjM2Zzhlc3hRekdHbFdxQjYyVzZmKzla?=
 =?utf-8?B?aXA2cVpxTVdOaCtjeTVQcVhaRDc3SzU3R1FXaERIQjJxYWlFa3hTZVRXVVFy?=
 =?utf-8?B?c1JpKzNuVm1Oc3IxT3JHQ1pmdWJyMHhpelkvNzVscU1OSVBRT0tXRkZjbDNR?=
 =?utf-8?B?RG9Sc2tVU0kreUtqTFNPdkNMNkRGVnBkVFIzSWxxdnB3VTJxcjQxUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9585a6c3-56f8-4301-55f7-08debbfd027e
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 14:34:08.0545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMXcCarG8X68CTDPRnLRA2p99fsXYsEmSCbyDnhTIA65WQyxSRLL2P93mpvVDl94P/xnXHunGJPhWdYq5y4tRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8021
X-purgate-ID: tlsNG-4011c0/1779892455-70D608B7-A2856631/0/0
X-purgate-type: clean
X-purgate-size: 2350
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,macbook.local:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:dmytro_prokopchuk1@epam.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3121E5E5F3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 03:12:23PM -0700, Stefano Stabellini wrote:
> On Fri, 22 May 2026, Jan Beulich wrote:
> > (extending Cc list)
> > 
> > On 22.05.2026 08:13, Dmytro Prokopchuk1 wrote:
> > > --- a/xen/drivers/vpci/header.c
> > > +++ b/xen/drivers/vpci/header.c
> > > @@ -586,7 +586,7 @@ static void cf_check bar_write(
> > >          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
> > >              gprintk(XENLOG_WARNING,
> > >                      "%pp: ignored BAR %zu write while mapped\n",
> > > -                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
> > > +                    &pdev->sbdf, bar - pdev->vpci->header.bars + (hi ? 1 : 0));
> > >          return;
> > >      }
> > >  
> > > @@ -647,7 +647,7 @@ static void cf_check guest_mem_bar_write(const struct pci_dev *pdev,
> > >          if ( guest_addr != bar->guest_addr )
> > >              gprintk(XENLOG_WARNING,
> > >                      "%pp: ignored guest BAR %zu write while mapped\n",
> > > -                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
> > > +                    &pdev->sbdf, bar - pdev->vpci->header.bars + (hi ? 1 : 0));
> > >          return;
> > >      }
> > >      bar->guest_addr = guest_addr;
> > 
> > Well. If I'm not mistaken we had discussed situations like this (long ago).
> > Imo the added verbosity gets in the way of readability. If we absolutely
> > cannot or don't want to deviate such constructs (of which I expect we have
> > more), then we ought to consider alternatives (like changing the variables'
> > types in the case here).
> > 
> > As to deviating: rules.rst, according to my reading, says that &, |, ^, or
> > shifts would be okay to use with a bool operand. What's wrong with also
> > permitting this for other operators?
> 
> In my opinion, if we are going to treat bool as its own type, it makes
> sense not to silently mix bools into arithmetic with int types. I also
> do not find this patch less readable -- I actually find it more
> readable, since it makes it more obvious that hi is a bool.

Another possibly less controversial option is doing the arithmetic
based on the register value directly: (reg - PCI_BASE_ADDRESS_0) / 4.

TBH that's likely faster than the dereferences done to get the base
address of the bars array.

Thanks, Roger.

