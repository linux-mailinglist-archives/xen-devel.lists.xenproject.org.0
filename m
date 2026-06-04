Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Pd1UGHR8IWoeHQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 15:24:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD579640496
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 15:24:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=nGr9nbQn;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327825.1592546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV82p-0004c9-6A; Thu, 04 Jun 2026 13:23:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327825.1592546; Thu, 04 Jun 2026 13:23:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV82p-0004ZL-2w; Thu, 04 Jun 2026 13:23:35 +0000
Received: by outflank-mailman (input) for mailman id 1327825;
 Thu, 04 Jun 2026 13:23:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wV82n-0004ZF-No
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 13:23:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV82n-007TEE-4F
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 15:23:33 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a217c4c-5cb7-0a2a0a5109dd-0a2a45018746-34
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 15:23:33 +0200
Received: from [40.107.208.49]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a217c53-c1f2-0a2a45010019-286bd031230c-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 15:23:32 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM4PR03MB6032.namprd03.prod.outlook.com (2603:10b6:5:393::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 4 Jun 2026
 13:23:29 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.007; Thu, 4 Jun 2026
 13:23:29 +0000
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
 b=RUmLwcSPaDkgQMc1yo45tpmhfZiGnIRutSROe6ow0e3HE8aZj20pn8afFMeJweZTSRtPr9+E+SEFN5lq+WAGxdA+aeGjey9QF3o/N2Quo2l4UAN+wu3lEdCGeLdVHKtKHH9c5pxzqvbcjVXMYg5DHaenl4RH/PUGAHmfwKBI26/S6z+mVs6XjUhl8I8cahFBoP66QGwjm6AGHF2D2wSa6St6nydnMdeQdI7EDLrtNGKRvOCZNi3xaeLIdpcuP9BnpCzMD8cg5+nHTYxXPAUWRuR9mfmWhDz+f2w0/h0LlAYWopz+DicJVjkEGW8zoVaTmOTuOt1ltJXjso7ouOe1XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lj3ABC5OISg7ZNV7TW34OkFC8pBPXFaniSWfi9HmYbo=;
 b=nofk0IsrTEEljIHaww6RbcvVbKtA1NdgxryoVix7UqAHI3aqJrkHx0VTZYt7oE+D9uE3odL0aOQ66j7wQ2sPexmpjGEDPdjMM8u67RYRAmwNLmrvlalb/4lxlV3JhXeF35LZnANm1F/pSqLL4HWleoXuQj0SF9LEucB4zabLFxhVCfaiOatz9VnTmNJ5chtHXxo+M+JDtAVXCDy/tkieqp6XjyPnj+2G4tRi5juWRHunVWGL1q8XbLjWi0YCCbG4GFqiPtusPZNAUOvo6AvBxcKtSY6U4G645SbXHzbYMnovUBobM2wKAdNYfLpnksPaESeNU6jWp0UjR66aldxrfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lj3ABC5OISg7ZNV7TW34OkFC8pBPXFaniSWfi9HmYbo=;
 b=nGr9nbQnGhxTib4zIn7TbD6hYDFpKselnMy7kyXsQeBOCtJzRGXQZNusPjbrLDELTGjawfyssKXzqOhbqGRUgcfYXyY5cyu766SgnbcHWsmaQAmxNqzaSeZAdavbOti9r0p8uyu8AXJcLnLWK+nsWT0jyeYiizZAOxGOanPo4D0=
Date: Thu, 4 Jun 2026 15:23:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH for-4.22 2/2] x86/mcfg: relax memory map checks on newer
 firmware
Message-ID: <aiF8TlCNRxuojjP0@macbook.local>
References: <20260604104605.92516-1-roger.pau@citrix.com>
 <20260604104605.92516-3-roger.pau@citrix.com>
 <f72e590e-0e81-4bc4-8097-fe83ab5d945b@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f72e590e-0e81-4bc4-8097-fe83ab5d945b@citrix.com>
X-ClientProxiedBy: BN9PR03CA0552.namprd03.prod.outlook.com
 (2603:10b6:408:138::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM4PR03MB6032:EE_
X-MS-Office365-Filtering-Correlation-Id: 05069a04-b6e0-42ad-8b7a-08dec23c7733
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|6133799003|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	x8T1cClHcoF07UnzFSKcsLVmqBky90Jlg96hwGKqsI0tFvNegtvXhO9+xKu9p3c2ar6OTKTEVPun2XqbHC/WeqawmIqunTdOOKYe09pks4+TFzaAq3dT6hWPV+YUGtz7kZPp4XJ2FgRwNYcblYp4uXxVLqNvjkU84VWtU15IAHeb93il8TIQcZo1dE2ni9oUdTyq+6dhfMslOa3qrpc4/IXOLr7IpaJkLq0NUDDVuAwbF07MP+FWVb80OralM71uyZfXjwOsl6WAOTgE2o5l45t5IrhlSUlvIq6fbjwMvzWdS//Xi5Ho3mOVe0CgXlA/KlLkDmjjNtovIcpKoeAeNNxwyc4hxCB7V0K8D/YmjzbO5b3Phld8CBELU6x6FH1UzxxGLd2wCFbT1j1WCeTMd4AS0n8mBZQZ1wZflOu4xOmzltv95MskTvvJUUpCwtaAh4OwlMc2xUBJGuiGix95780AyFTLYcAzcBrNFmqi2Uuu1ivhOZkOnuiZK2DwMVY4XIL+nBK1OotPQWh4epxaoG5KUR5YA7wsRm0L1VCnmOzh8PSlMgKEanZQ8aYW03D9C6akpHkYt3dDQzIpr5Jy5noZdLUBj48t/+8smRICk4LAMrw1LJtADO4gPMLzQych22wOcs4MEF9iydagzDGHhIN91Lx8WYMfSMeQaXN4TcnfPEHxNVS7R6pCBjVlSlVa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUVRcEgvdWMwdkxWK2loWDBpTjhLVmgrcmlxdjZJNkF1Rmo5ZXYybmpBL3U5?=
 =?utf-8?B?eWowQ1RjcGVLNmdXQVIzRUY1MmlBL2RWN25acU9qR0h0aGEyM1NPc1FzVS9N?=
 =?utf-8?B?QzE2NWdiQk5QZk4vKzlyOXZ0eXphUUVFcHVMK21rMTZaMWo0bTJDckp4NFlw?=
 =?utf-8?B?aXBBVWFGRE1BTXIyRStwUWxyQ0tsU29BZjROR0l3QzBodEg4SFUwUGJaTGY5?=
 =?utf-8?B?SkltRzlxTEZrUlhMR1hQc0ZCZ2ROajNlZXl3bmNoWVROZTl6TU04azJGN3dn?=
 =?utf-8?B?MnF1NlNTakZiM1l0MlJxYmhWejBvVU84UitYTEt5M0prRG5tOVI2WVgyMmZW?=
 =?utf-8?B?OXlmOWdaQWVzQlJHVEJKV1FJV3JwTFlJYnRHZXhDdFZ1OS9vdWNvTDJrVm9M?=
 =?utf-8?B?ZUhlUVdsalppWWNvMUpCdHI2VXVOK0VqaTBXM0M3N3RPVndTNWdIaFppNUJp?=
 =?utf-8?B?bGVhNi8wRnBObXFHRS9iUU0rbkg5anBwTk5ENWEvTlhjenZoS2p4b0QzNkVY?=
 =?utf-8?B?dWw2L3p4TS9LVnZVb0JRQytXeEN1TXMwMnMvKzVxQm9EZGlVZnpUTzV5bzVy?=
 =?utf-8?B?R3ZQY0twOUZnZlpGWkZ6eUZpazNYUmZMSDZ1cmRBQlNnTHo5Q1kzUnF0WTF5?=
 =?utf-8?B?VWtLYmpCWGFIUlUrMFZLMUNsU0FlaUF3Zm1vUEhCNG1DODBnVG1oYnRwV25u?=
 =?utf-8?B?SFpDMG5wdUh1KzBtT2MzUmZUcWpmdkVPTlA0djZFb0FFNzhVWXd5b0Rzaml1?=
 =?utf-8?B?MHBQL25NYkVEcG5meVZxWWRReElzYzFqd2llK0JhSTF1NEZEbGVqOFFldk01?=
 =?utf-8?B?bE9sL1RoUlJ0S0FvUzdMelpxZWFHeEVnZmR4eS9qMkVuVTFjVk5QMjlQTDNM?=
 =?utf-8?B?NW9kTzlGQTk1aE9VT0xCb09hT2kzQmhhTm1YRHJjOGV5RjkzandJUnRmTzJU?=
 =?utf-8?B?cms0NjNtK3hxVEozbVBURHBZSFZFY3hkYUozd2JqSVA5RjljVXR4MFRKTW14?=
 =?utf-8?B?eUM3V1hYVnJWTkpXZjlmVW84UW5OQWdpRVNSWlZkYUdsRGttTVBlNzVhMXhD?=
 =?utf-8?B?Mmd2TnBZajc5ZytpaFFyVEU1RGNDOVdJN1FrZW0xVW4zbU5lRDZyWjJLS0V0?=
 =?utf-8?B?Q2JhUW55Z1ZKVTNoSnVxUWVLY0xpSzdnM0ptbkpZZTlTc3pZclFsSFhzOGFO?=
 =?utf-8?B?ejZ1VGU3eXdaa0pqZ1o4WGVtSXJuc0xmdmY0aDRQSHVaNEpheUg2eDltd21V?=
 =?utf-8?B?bzFYNEh0M0RLaUo3NFBXVGhHQmxrczIrQi81WWV3Ti8zNlA2SUordGl1Mkds?=
 =?utf-8?B?SCtpSE9TQktiQ3FBOG05OEpYWkNGdTVraGVBUGhwaHpJaEtJK1owV1RZYmxw?=
 =?utf-8?B?NE1tRndMRWliV09GUHdKUVFtMFRQMGw3aTRocXhwR2Jzd2JLMXk5a2M5ZmRl?=
 =?utf-8?B?NHppM3Y0QmcxRUFxSXNlSk01VFVCS3V6ZWlDc1pBVTFMVW1MNHJJa25maGVz?=
 =?utf-8?B?WjBreDNJbHJyUFpaemMwQjZOSGtCQWdnYzAwajU0RGtzakgxbHpQZFpFVHZn?=
 =?utf-8?B?ZEdSalFoUXVsaGVMaHYzT0VUeHdEOU1CVFZjYVg5UklOSlBxajB6My8rSG9T?=
 =?utf-8?B?anZwaW5paFJCZ0FKOHBxU1lYWHJsTm10MkNWam5lRkYzdmxGRTNoTjhoS1lk?=
 =?utf-8?B?SHdKeFlNWGxNUEZ4KzBKUnQ0Rkx4SSs3V1JKMk1iRzlMUHhSdHp3TFNOZVhE?=
 =?utf-8?B?M3QzbEI2VU15d1ExTUI2WGE4NHQ4VERGeTQvZVJLWU0wNFo4NXdEWEVVamNX?=
 =?utf-8?B?MVZtbFdzeUNjVmxneCtXaWlTa01VL1BmaGVqUFVFR1RFSTdQRGhnTFh1c2Jz?=
 =?utf-8?B?Wm1mTnFURzliQlMyeFlBc29mUUltRnNCWEwxakxqY3hkd0RtYzU0eUJzSkdG?=
 =?utf-8?B?eXE2Tk9lLy9ISGZ0UjkzMUY1NHZiakZaNGNldElvQXJ6LzZ1K2c4VVNESUFC?=
 =?utf-8?B?WmxxOGMxbnZGUEMvbnlSZ2F1S2sva3ducXNZaHFjLzdYcWxSUFdnVWpjWDFa?=
 =?utf-8?B?a2lvRjdRSWdVdDlKUUl5OGl5NlZsRHhXR2xESU1lendBQXY4cXgvMTgyN0hK?=
 =?utf-8?B?Q1dXaHlKZFZ6b25tbkNnUHM0NVFsa1ZieS9kQWZpeC84U0l6d3NqUHc5NU8v?=
 =?utf-8?B?YjhVQlczS2JRUDZtTHJqUTBXbTV0Y25TbVRXOTVnVE8vV0lhWFZyRjVqMENj?=
 =?utf-8?B?S0F4ZFQ1a3MrN2Y5Qk8vVEdYSWxFdHVwbVJ0bGUyQmJ0SkZsOWRlbXRIdEx5?=
 =?utf-8?B?UlFLTU5nKy95aWpJWEp2ajM0b0JXUVZtcVBNb01haGV6RnJFZThwZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05069a04-b6e0-42ad-8b7a-08dec23c7733
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 13:23:28.9636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EC25d7/YmlIHvmbdO/1+AaEiM0m+mXH53kiWlVlrakPjFkGgUmAPahRTw5lMvkA2oQFmSTwQAj0uqm41GZD1dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6032
X-purgate-ID: tlsNG-d62444/1780579413-AF754FF4-1A025F0D/0/0
X-purgate-type: clean
X-purgate-size: 4734
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:teddy.astie@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,suse.com,vates.tech];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD579640496

On Thu, Jun 04, 2026 at 12:08:30PM +0100, Andrew Cooper wrote:
> On 04/06/2026 11:46 am, Roger Pau Monne wrote:
> > Per PCI Firmware 3.3 specification, section 4.1.2, ECAM space must be
> > reserved by declaring a motherboard resource, but there's no requirement to
> > mention it in E820, so we shouldn't look at E820 to validate the ECAM space
> > described by MCFG.  The specification additionally states that: the
> > resources can optionally be returned in Int15 E820h or EFIGetMemoryMap as
> > reserved memory.
> 
> I'd take out the ", so we shouldn't ..." clause.  I see it came from the
> Linux commit, but it wasn't great there either.  It's a piece of opinion
> in the middle of quotes from a spec.
> 
> Then, I think you want a new paragraph between these two, saying
> explicitly that some Lenvovo systems do not mark MMCFG in the memory map.

OK, I will move the last paragraph here then.

> > The more strict logic was introduced in Linux in 2006 as 946f2ee5c731
> > ("[PATCH] i386/x86-64: Check that MCFG points to an e820 reserved area").
> > This was picked up by Xen when MCFG support was added in 3b35911d709e
> > ("Enable pci mmcfg and ATS for x86_64").  Apply the same approach that
> > Linux has done in 199f968f1484 ("x86/pci: Skip early E820 check for ECAM
> > region") and relax the strict reserved region checking so it's only done
> > for firmware manufactured prior to 2016.
> >
> > When dom0 is booted it can always prevent access to misconfigured MCFG
> > regions by using the PHYSDEVOP_pci_mmcfg_reserved hypercall.  This brings
> > Xen's early usage of MCFG (prior to ACPI AML parsing) in line with the
> > implementation in Linux.
> >
> > This fixes an issue with detection of extended capabilities when running
> > Xen on a Lenovo system that doesn't list the MCFG area as an
> > EfiMemoryMappedIO region in the EFI memory map.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > I'm not sure what's the best way to attribute the logic here with the
> > Linux commit that introduced this, more than referencing it in the commit
> > message text.  The code is too different for me to attempt to label this
> > change as a backport of the original Linux commit.
> 
> I think your commit message is adequate.  It does provide all the reasoning.
> 
> > ---
> >  xen/arch/x86/x86_64/mmconfig-shared.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/x86/x86_64/mmconfig-shared.c b/xen/arch/x86/x86_64/mmconfig-shared.c
> > index d0cbc151705d..e24a78c8d1d3 100644
> > --- a/xen/arch/x86/x86_64/mmconfig-shared.c
> > +++ b/xen/arch/x86/x86_64/mmconfig-shared.c
> > @@ -13,6 +13,7 @@
> >   */
> >  
> >  #include <xen/acpi.h>
> > +#include <xen/dmi.h>
> >  #include <xen/init.h>
> >  #include <xen/mm.h>
> >  #include <xen/param.h>
> > @@ -369,12 +370,15 @@ static bool __init pci_mmcfg_reject_broken(void)
> >      typeof(pci_mmcfg_config[0]) *cfg;
> >      int i;
> >      bool valid = true;
> > +    int year;
> >  
> >      if ((pci_mmcfg_config_num == 0) ||
> >          (pci_mmcfg_config == NULL) ||
> >          (pci_mmcfg_config[0].address == 0))
> >          return 0;
> >  
> > +    dmi_get_date(DMI_BIOS_DATE, &year, NULL, NULL);
> > +
> >      for (i = 0; i < pci_mmcfg_config_num; i++) {
> >          u64 addr, size;
> >  
> > @@ -390,7 +394,13 @@ static bool __init pci_mmcfg_reject_broken(void)
> >                 (unsigned int)cfg->start_bus_number,
> >                 (unsigned int)cfg->end_bus_number);
> >  
> > -        if ( !is_mmconf_reserved(addr, size, i, cfg) ||
> > +        /*
> > +         * For firmware from 2016 or later relax the checking and also consider
> > +         * MCFG regions in holes on the memory map as valid.
> > +         */
> > +        if ( ((year < 2016 || !is_memory_hole(maddr_to_mfn(addr),
> > +                                              maddr_to_mfn(addr + size - 1))) &&
> > +              !is_mmconf_reserved(addr, size, i, cfg)) ||
> 
> This comment is half stale already, as "relax" is really only relevant
> to the prior behaviour.
> 
> "For firmwares prior to 2016, confirm that MMCFG is marked as reserved. 
> For 2016 and later, also allow MMCFG being in a hole."
> 
> It's also worth saying that this fix is different to Linux's.  Linux
> simply ignores the E820 on anything newer than 2016.  Personally I
> prefer the more cautious approach of saying reserved-or-hole, but this
> should be called out in the commit message, I think.

I've adjusted the in-code comment and reworded the commit message to
notice this divergence with Linux.

Thanks, Roger.

