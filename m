Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEdJI9cuEGrIUgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 12:24:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B2A5B2018
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 12:24:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316567.1585949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQN33-0003Ij-F5; Fri, 22 May 2026 10:24:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316567.1585949; Fri, 22 May 2026 10:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQN33-0003Ge-C6; Fri, 22 May 2026 10:24:09 +0000
Received: by outflank-mailman (input) for mailman id 1316567;
 Fri, 22 May 2026 10:24:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wQN32-0003GY-CC
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 10:24:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQN31-006Rsr-I5
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 12:24:07 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a102ec1-e002-0a2a0a5209dd-0a2a4502d582-26
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:24:07 +0200
Received: from [40.107.201.33]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a102ec5-af86-0a2a45020019-286bc921b7b4-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:24:06 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH8PR03MB8225.namprd03.prod.outlook.com (2603:10b6:610:2c3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 10:24:04 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 10:24:04 +0000
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
 b=AhgMmCP5Qv0fqNSVoHabiKqs7UuLKub3OJmjacP0Vbj7z31AOx78CVBGSglcG3PaLAO5Pttmg/DbcRQV6fEaG7nTXDrSGAEEnlXL2aLX9sfJfFO7HxUmrUb/3fSpQQojCp6l85lSwgXWPkO/JR+TwmaQWruCPUeXPqV2nPFio1HX7mnKNuQwTL3XPAaTUPIeuXVWvFq/SLRIsQSka/kHqDF3v4dVdOFPgO4ByBqz39TgbJRWnMd9sToFhs4Uf4K01sMvWxE4NuYTykAdunKxoMEaBr1eoySxSBMqqyG4xCOwxe/S2pftaM5RuMJg3OI83evZGMNBhwG96k88F5iATg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDjxz7Uh0bEn7RrIjWauvVOuI4TTMgRfhG9fGDNH37s=;
 b=Qia8ExJS9JVEp1onw6Nhk2VYkFo619yUDJq/AfbqArMpJbIm1F/KW64AMPQiGM8WgXJ69qumsB+8lWilVVDfHJ5CWSbBVUOWIYznzriVd+Nl4NUPA8S6exaySjshrDniGekK+DMvXhlcCZD14ZxoJtyw6eHOudZE/c8U4MWlfn0gf9u2DLEx0pGYCcKpLAEpgmeOkGUquzybyPdKWno/4CNsFy9zSAmhjKVd0KwnMQYrJuwSnq0IcWSEU/SzXVoK1Ju5AqVEfnWdSFu0ywqDApM1AXTpGDvkvmXvxCyfXqJBFy/FhzXv02s+Uu54jr3B4WGd27sD077D/5Y5WhtoRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDjxz7Uh0bEn7RrIjWauvVOuI4TTMgRfhG9fGDNH37s=;
 b=i6DsON+TSbVkA8a2mBLHYm2K/2z4rV3VkC3I43dPhhmg0z4JVSr3+vmAWDbBkCpy8hFd6bqL2UilAIrJRKgnh3sMYev2upvF2l7aeIZqCL3Eu1Wk4vq5WBdx3c097mGpqTLZubZUONkdr9dWk8IBgdxwVRxuSw5gV0TdjvnBws8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 22 May 2026 12:24:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 2/5] x86/PV: rename a local variable in
 pv_emulate_gate_op()
Message-ID: <ahAuwEqst5aCJSj2@macbook.local>
References: <5eaaf72a-850c-4535-9f20-13b4feed38d1@suse.com>
 <871c0ca7-898f-4bc6-8115-d94d40b88301@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <871c0ca7-898f-4bc6-8115-d94d40b88301@suse.com>
X-ClientProxiedBy: MR1P264CA0021.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH8PR03MB8225:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b5e9c06-aa6f-4856-258b-08deb7ec3fba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	IQVnoPVimiCEEM2uH5ESJR+CX8jx2B+9JMfn4N4pBNyEHFGy7YL0yWqqOCaVgz+S6RCF7Q+Sc+e5L0h/lzez1KcMZjWvW2rGByV4cJIhgt779ymFa9PhA7VNE/PXyEgxBd1J3azDMGiiKKBHuCDKbdZ6bc4pCGb8b/ZRjXeqB4OyrDDRc3cioaMyFnPbhck8IOZU4zaJsB+m2JcTa6k4b71ajy87t1hPhrozR9Qgj3NR/j3fqtocmlUs858rmBGXyHojaSg3NC2REQGN2vPa+G4mX1PbR41rHQcAYMWxFLD5a4uW5UddwJ4vo3cuP66h+hZ4VpPp4DgPZ7Kbd3NJu0NNEPP8fVRWEG/7Ld9/DZeyQgDHbaDaHsghdsih2n24YfVz3q+96oHPOamWFUnCbQmJFmvzD+14NplgLqh3t4AXUsOCSL4GjgQHr6qVrEux6AtdmmkE/KUc4+Kyo822wNKT/M2V2oc9jQ0pE/2O5ytqDkUapJQNWOFopDZpUgUXwKp6KnyJSzM92uYl4HdMJ1G1lDlYMQRbhUTnBsnh+3xxksy0/ZZBodOvC1sKa//zCrR51ZSb1ShJ7XKDZeXfR/2EeGegstDfmTK1JfBSIKz4RVmzNqz6yaf56JTbSK032HDoOkbIn3JRE2dNrw4LHy3vh0oVVfcb83BruC1Lu9POhu4uA2GQq8Ld7P/jyyfR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkZsclJoTE1nZW9pbjhMWlVxMkdwZ1N6b0xDUUNPL3FicFN1TUtYcTdyR1F1?=
 =?utf-8?B?OVNOT3oySzZXVjFpVlRGaXJ3VDFYbzVDTnNBZHUwOHd0K252VndWdFF1OGpj?=
 =?utf-8?B?WmZzLzMvN3RaRGVrOFJrWEJ6NmlTdU5WQUhDMis0RUNIOVlKOUZuRU5BRC9Z?=
 =?utf-8?B?MUJoT2Q1ajdmcmI1YVRmcnlwSTA5aVVzRk02VXNGZmVBTjR1SnpsWFJWbkZK?=
 =?utf-8?B?U01maWRMMnU1TG5JSlVUNUptSUlNK3hrZk5CbENVNmJMMUhGZTVtS2ZoR1lv?=
 =?utf-8?B?Nm53aTVzWTc1ZTExZ0pmTm1COVlxVzlFVTJVdXh1dHJUTXRyQStkWTJVR3Ja?=
 =?utf-8?B?b29la3l0ZkprdCtWdmZqV3QvaWZxWDJncC9rNkw0NUFoSkczcmgyUjhSOTdW?=
 =?utf-8?B?M2hXbUZDeUhhQkN3RUNlL3lWZVpsL0I5SUt1cldaTlBnMUxkeEtmcmg3MlND?=
 =?utf-8?B?L3Z5TjJ4M2t6N2NQTmowTjhxNjc4UHJmeHRMN0NkSVdzcjJCaFh5azZ5cWJx?=
 =?utf-8?B?V09mYnBwS3JCS1lUOUVpVFROUzZNVnFKVE80eVhwSjA3NkFranBxbDRtSFB0?=
 =?utf-8?B?aHFIc1lSaTYzN0tFczZIcERjMmNkWVVMdEpKWE56N201SGhVc0dRV1hWaFY3?=
 =?utf-8?B?d2JGN3pQRG1NOC8zUUN2V2pMNUVKVzB1dVRyeVVDZkRwdFlyQzFVckorVGc4?=
 =?utf-8?B?MVdzelVNS1hIMHU4ZHlNMFFsemlCSm95aU93VGZPNzVJaHpVMkhCcVp5NFVr?=
 =?utf-8?B?dTJLcjRCRVhZTkVoaDhtRUY2Rm9PbUUweFpmL3hJWXRxNnJCempoNDh6SWMy?=
 =?utf-8?B?QXZHdFkrM3U5dlZTZHY1ZHdKVjdMT0QrNS9nVHZuQ1ZNYlFaVnNWNjJtVUVD?=
 =?utf-8?B?RmZuYXk3czR5aEQ4UmZtS0VqcHdOZHlsbXpVcWxwRkFVZFI2TmlhYWZOUlJj?=
 =?utf-8?B?bklqZ0M0RCtHcHU1azJjbk93dlRaRDlUZXZaUE9oMnBnZUFvM3NsNzhDekh5?=
 =?utf-8?B?UFRycytESHhqaDIxVlpsQThpZmFDcTlSak1sbzZMaHVaWkdKQnY5YytURTVC?=
 =?utf-8?B?YkNqSXZqQVNGYjh0N21WdXh6dlUxTzltNkFBcG9lREpyNk1JV2c2ektjYlMy?=
 =?utf-8?B?aWxJaUdBdFNuMFNvZlBQRTV0TlpVMHBMYk5TZTFTeGN2YUpzOXVHZk1QbVdC?=
 =?utf-8?B?ZE1CWm1zeVo4cGtralFXSmxMcnZaSXRGZnRRaCtiNkJyb2Z2S2ZCd0pRMVcx?=
 =?utf-8?B?bHhpY3lvV3hSMWI1UTdRNk9NaVZvdDZ5RHptVVVYSXFoRlBaT3hHS0Zvc0lu?=
 =?utf-8?B?ZVN6THRld2kwdVVzdDNhQk1Xc0xpUnMwM2pYMVZGYnVIOSsrSC9sYjJZdnpV?=
 =?utf-8?B?WnFCRExlMjdRNXczUjV1ZWFlS0NhODNUZlNTN3RmSVBRbTYwQ0ZtM1FKd3Vz?=
 =?utf-8?B?WUVPRHRHU3F6bG90eUFYNmpmYnMydlpOaTBYeDdPckdiaVk5R3ZmQ3YzTDMx?=
 =?utf-8?B?TCtib2pNNnVnY2E3cjc2RmhWTURsVVRYd2phTzNNcEtoMlBLYzAwL0NpdXpq?=
 =?utf-8?B?aTNrR3JQOXFDSEE2N2ZwQW92RU5yQVBiTU1HMFFiRzRUQ3ViZk9HVW54VmhD?=
 =?utf-8?B?Y0tPejhBVG9EY0hjWmw5b1JybG5TcUJSSnNrQVpKUzlaMENaQmhsZUpUbkdJ?=
 =?utf-8?B?ZTRFdDM2REh2TnYvTzZHSWxJamhaWG4zVnVDN1daOEJwMk1NUlowakNnWko4?=
 =?utf-8?B?VS9kZnhFTE5ZVklTU0dhbkMxWWlDUlFERjhmM25pNklxTVNFUDVlRVl2d083?=
 =?utf-8?B?U0NPTXVuK28zM2x2YUJlQjdPa2hLeDBRbytSYmEyQVNRUmlQMTFVZjlrZHNm?=
 =?utf-8?B?NE9Jd1pQNUE4L3JTRUtZSWRrVVFRQ0hacm5NUkp1MTdTTWduaGNpaS9jZWFB?=
 =?utf-8?B?SHRNY2ZmNmFlWCt1MWlHWUx6VFl4WHVaMVZSaTJ4K0lVNktQc3kxaGVVc0xT?=
 =?utf-8?B?YjFDYTcwbm1nOVpNdGFuaHgrTGpKdVc0dEtLZXppdlkrTlJQM1VZZmhuRzBv?=
 =?utf-8?B?ZDNleHFPQ0hmNmUwaHNqTVFMM2xPRVA4eTc1OE44VWlaVGJ5b2VJQnU3YUFs?=
 =?utf-8?B?dTRwK3dsbmFFbG1KSFJuSGsycnpoMzBOTzNhN0orbEJ6ZGc3dE9sbVNZYURK?=
 =?utf-8?B?em5YUTlTMjFKaWhhbFYzalN4MlNYcXZZVWpTS0Z4Y1VuN2x4UnNON1JJaGY4?=
 =?utf-8?B?RHRiSG9sNFVqdGtwUy9xLzcvcVI0dkdtTnQxNzBva00xaWZwM2N4czNFd09G?=
 =?utf-8?B?eUVDL0YycEJqMjZ4NDJHWkoxNTFuaXcvMHJ0M2t4aXJTbkdBZzRnUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b5e9c06-aa6f-4856-258b-08deb7ec3fba
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 10:24:04.4224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q9xzZDnTFNpCb0I0VzwAhUk0vcnSKVHLFxfBFhpfY48qhG/9Tj8EyiTpQ77t8xYDEDyTgeOMMVPLvIvMsy30qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR03MB8225
X-purgate-ID: tlsNG-720697/1779445447-83F66161-67B61E38/0/0
X-purgate-type: clean
X-purgate-size: 2020
X-Spamd-Result: default: False [-0.19 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo,macbook.local:mid];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E8B2A5B2018
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 13, 2026 at 01:44:47PM +0200, Jan Beulich wrote:
> ... shadowing a function scope one, thus violating Misra C:2012 rule 5.3
> ("An identifier declared in an inner scope shall not hide an identifier
> declared in an outer scope"). No difference in generated code.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Technically, as the outer scope "rc" isn't used again later, we could
> simply drop the inner decl. That seemed more error prone to me, though.
> 
> --- a/xen/arch/x86/pv/emul-gate-op.c
> +++ b/xen/arch/x86/pv/emul-gate-op.c
> @@ -286,16 +286,16 @@ void pv_emulate_gate_op(struct cpu_user_
>      if ( !jump )
>      {
>          unsigned int ss, esp, *stkp;
> -        int rc;
> +        int left;
>  #define push(item) do \
>          { \
>              --stkp; \
>              esp -= 4; \
> -            rc = __put_guest(item, stkp); \
> -            if ( rc ) \
> +            left = __put_guest(item, stkp); \
> +            if ( left ) \
>              { \
>                  pv_inject_page_fault(PFEC_write_access, \
> -                                     (unsigned long)(stkp + 1) - rc); \
> +                                     (unsigned long)(stkp + 1) - left); \
>                  return; \
>              } \
>          } while ( 0 )
> @@ -359,10 +359,11 @@ void pv_emulate_gate_op(struct cpu_user_
>                      unsigned int parm;
>  
>                      --ustkp;
> -                    rc = __get_guest(parm, ustkp);
> -                    if ( rc )
> +                    left = __get_guest(parm, ustkp);
> +                    if ( left )
>                      {
> -                        pv_inject_page_fault(0, (unsigned long)(ustkp + 1) - rc);
> +                        pv_inject_page_fault(0,
> +                                             (unsigned long)(ustkp + 1) - left);

__{put,get}_guest() return -EFAULT on error, and hence the
addition/subtraction here is wrong AFAICT.

Thanks, Roger.

