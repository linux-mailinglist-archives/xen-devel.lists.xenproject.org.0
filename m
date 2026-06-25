Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LTVIFiwoPWpgyAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 15:07:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B31846C5EC1
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 15:07:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=GXbhg1Cr;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1345611.1604428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcjnz-0007vu-JX; Thu, 25 Jun 2026 13:07:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345611.1604428; Thu, 25 Jun 2026 13:07:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcjnz-0007tW-Gs; Thu, 25 Jun 2026 13:07:43 +0000
Received: by outflank-mailman (input) for mailman id 1345611;
 Thu, 25 Jun 2026 13:07:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wcjny-0007tP-Bk
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 13:07:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcjnx-005Rbi-On
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 15:07:41 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a3d2815-2eae-0a2a0a5409dd-0a2a4504aab0-20
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 15:07:41 +0200
Received: from [40.93.195.60]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a3d281a-a01d-0a2a45040019-285dc33c9bf0-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 15:07:41 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY1PR03MB7261.namprd03.prod.outlook.com (2603:10b6:a03:526::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Thu, 25 Jun
 2026 13:07:34 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 13:07:34 +0000
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
 b=WC9UauOpbH7xl2i4/xjVDUzoPG2mvs87sUr5CCmunvvG2rWtCMDi6518ARIVoWY63CFj8eFMI/muGVyOqPsYwrCZLlohZ0dwmFkcfSLHNMTpzUvEoD+MG3r+JZ7zCEFYFjsxoNuak1HizHXtkE0svCT8GRRrqPNXhlAqjpdBnabEkPKrj3PXT+5+b3rbtDRoBcOVNEyqbzNbF9OHw/4s2ruSBdC9kIGnEwUbTQm82UBFSKEQE279SVOgc3mRXcsGcfre23PS14ZNh/hDpsMGSmETcIhIpxNehCKfevyyPZD8tqnJEjuN3r0mCbaAMkArJGUBYS2HKJowJPn4/+d9iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJAtNnNTQ0xDAY4Zu9aq3RpDUrWDd3fvU18IzTnvZuI=;
 b=vXdY4E4ODjk8lCrm17T5Mu45kZaR9YZltV4pTaGoUxaTLfRLvUMZyjLytAi+lRkBEZW4Y+mtHv0IA8BqlNyenyY3gFV0u4IUXBYJRLpIXaFO1bdv9Qm/umilwv/JNayH+XzwnELEJQ2YXcInw2OyiwifR6cwJMehTrHBrW5hKOo/b0DBDMwTxI/Fb4er4l884cj4evHsCYOVjmhagYkT5WCJHt06/GNHeB12GSMG9R6SP6BL8f6nNI6cpJaw1vpldyGUqlmf/JLpm13Z2rvPrV6uP+Z7KhpcFeJfyOtX0zQIMETFSC8RBh4ZDuqYQsLlKIk4admdjKP4PPY8v9mPgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJAtNnNTQ0xDAY4Zu9aq3RpDUrWDd3fvU18IzTnvZuI=;
 b=GXbhg1CrkW1cL7DiQiU1X+31HvrL4+QdutxEMuOg519TGZs4U75jp9DeZCzUUkivGAKAcvrKOKH7eKvzcnJ8+lgBH65xhAK09bYgMhemo4f0vO5kt1rMU66eUqeX6gZQp2UiWmR7LrczyfWiRsmcPstaXR+fg/D5znd9HjUpii0=
Date: Thu, 25 Jun 2026 15:07:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.22] char/ns16550: bound execution time of
 ns16550_interrupt()
Message-ID: <aj0oEQ6_g94Rg83D@macbook.local>
References: <20260623103145.76383-1-roger.pau@citrix.com>
 <06c8caab-4722-4b02-991f-bdc4a4ac0ea6@suse.com>
 <ajqVNtt02XMUGk-X@macbook.local>
 <cdf9f154-896d-4faa-8c76-ca15cf5e706e@suse.com>
 <ajqsQr-bhf4SGf8Q@macbook.local>
 <d7920786-7424-4634-80f0-994ea2857d1c@suse.com>
 <ajz-GVoEG4toMs3P@macbook.local>
 <2b574332-61f6-4a78-9dea-4b0973c8a3f1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b574332-61f6-4a78-9dea-4b0973c8a3f1@suse.com>
X-ClientProxiedBy: MR1P264CA0106.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY1PR03MB7261:EE_
X-MS-Office365-Filtering-Correlation-Id: a1b344f5-03fc-492a-124b-08ded2bab8db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|11063799006|6133799003|18002099003|22082099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	vr+Ex48xZVVYYpDNoAAO5VHGX3tk4omEmrC7HxK8tm53kG5YOt2otDAanwj0/bDGvL0WAAoPAbVjCj2/nV/+vJKH6nz4QNn5sO/3UTH4/YYwwPUsS7P411WmH1zpEsxoUdFuyJ/nNn0jK36exhovdcc7/cQB2Xwd2VqcXeXwcExf+8QwGhBdak4jxLfPwCyQe2uTZwYGpiiwwrIk4Vf1yZKfv7JmAFmHSXJbA4m3JZWTidlqACeL8HuZtXVbG+50U8pjmfJsKknlOy1ndH5yuv5raNby99WyWxfThxemxA/Y0jyBUXOjx6cOfzc7Hx2r6NwqKt8Emyv9CLF+4DQFnm4LcckuW5mLxb5cLDw5+wU61GgHroAe40TbcNyl6PIN8S8UcnuGwBHUxx4daEsHYCqE6+nA/0wvjhVa1r3GTFxyvtDzPmNd/OcCAUoZIrgeWVZW1kUR2qAEx06UUsc8DqBAYB/biRE4R1Nm5lDSPBIzl1c5qe0MTzI+JLQB5t9FtbEiIGikfGJJwnQMAxh4tF0kCJN4AaFl86bOQxoA9CtTDGFN9uoD6X5vwSe6kI/9Agh+LP3DHK+eI2AKds2C6g6LxC9dURAUlMOTvhUWqhp7znH4ToIIDJCoM1OsnMop/uAshdfD2RzD50Weys2e88StJjd8iPwD35ibBSpH1lQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(11063799006)(6133799003)(18002099003)(22082099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXRqcVhvUjVaUENFS1hsUnVhbGRHR0xHa1hZNGVOeitGT3NRV0F0eFZVZXJz?=
 =?utf-8?B?UWVQRHpjZ0x1ek13NHAwZW5LQ1NicHl1dndMUVB6Ulc3OURaOVl4WCtxeEVL?=
 =?utf-8?B?V3o0U0pYRUwwa0xwMGxSM3J4aGIva3ZrM1VVUysrQmtybUR1RlZwRzFETFdJ?=
 =?utf-8?B?c2l4MC9FTHpKSnBGS1gzOE9wdTJnKzNmYXI2WWRaK2NBR2g3R1AyK2xYZ3Ru?=
 =?utf-8?B?YWhocEg0UHZvTWFhaHBDRjBmNERsV2JtQ05VQ1FNVUpOVS9jR1FTZXVDTXJo?=
 =?utf-8?B?VDBNQkNoNTliQmpkZ3VER01HYXZ3d3BUczZGQzhXV05DTXdPbEhZOE1sK0dS?=
 =?utf-8?B?RzJSWkRVUnZ6UnRYSVpVN3d4TS9nbURwbzM4dTB0Zk5WTFhONUc0bnZXRktC?=
 =?utf-8?B?eXZDY3RyeHQzWkJVaFo1Mkp3QUpLNlkzWER1SmpkaGVvcmZRenhUeUpTN29s?=
 =?utf-8?B?aGl2SU9NdUJhMFkrZlNpUzdXYVBOemx0M0FUcGtpYTd0dWhEciszUk4raUUx?=
 =?utf-8?B?cThKNWx5dG9vazVFV1dtdnFVUkRWSTQzTDZuQSsvVFVCVzg3ZkNzc0VVMWs0?=
 =?utf-8?B?cEludEhGME9qNGxMeUVlRklNTEhnZGJXU2ZWbEhkT29LRDZLY1RYRXB4VUJC?=
 =?utf-8?B?UU1EdnljQ1pOemFpem1LNHpTbTU4Y0kxcDMyc1BPS2t5LzUvZ2JQRVlLVEc5?=
 =?utf-8?B?SzFnb1lHWjhMZnFHd0lOZnVhRFFuTXJIT3lQa1ppcDRSR3AyOHJXbFJ3Vnll?=
 =?utf-8?B?RlVtU2FvcUt6VDJhQVB3R0IrNXkyYms0WDk2WkwweldqOU02UzN0YkZhQlhx?=
 =?utf-8?B?MzBUVytiL2xmbWtmNFo5TWlJTCtNK1hGV2pjcE92YkEwQUVDVWR6MzVxZWl1?=
 =?utf-8?B?WjNXZVIwWHp4LzFCYWU2bW51T1JwbmFlQSsxV0EwSEhCcVRzTFVLUFJjeEpZ?=
 =?utf-8?B?ZjdyT1VDaG9aamc0VTgyMGI2aTVXQ1FOc0dzR3ZBZWpjbWZYSjEvNUJ4bldD?=
 =?utf-8?B?UTVJNFJOQTV3b2x3YjM5UVNSOEVoSHU4YTY2L1VyOTJpbUlFYkM1M20wTnRN?=
 =?utf-8?B?eWUrTGlCb0k2TGJGWTBQOTJDVVVFazhSS0NHbjhQa3pQeWltZDh2MjJSVVY1?=
 =?utf-8?B?aFJXdmlHNzJIQ1ZHV0hlOHdLQjlWWURodmwzRVBZaFNuakZ3VVdLYmtMeVZz?=
 =?utf-8?B?dEF1ZDhnY3E5TWFpOERmSUVMSkRZRXpud0VUa3llTFk3S2MrdXBBZGJIa2M0?=
 =?utf-8?B?WnArQkMwQmhuOXF0ZXNoME14SHZVOWNPN2FyWHpsbjdCNlFyOEpEMG5QSFJ5?=
 =?utf-8?B?U0o5aElVYnoraU5sMVREZC9vZmUvN05qaEZ3bzZSOGhsa1VPYWNpOTZsc1Jx?=
 =?utf-8?B?bGJsVS95YWY4ME1JSHdFbGhlREpvRi85Ry9wdGJnTUF4OVJFbUlUL0hWTG1j?=
 =?utf-8?B?d2F6UFZvcTdpR21jUFZFTzFtY3h5cGdjTXJyb09BR2x1dVR2Q0NTemwvcmZE?=
 =?utf-8?B?bm42RkxVeUxjdUdTQnpUL21jeHcyTEt4clFmSGxCWVBVVUVleEYrdWRnKzB6?=
 =?utf-8?B?WmZ0cll0Zmc5ZnlkRHpoeUpsWElRZC9rWDJGaGY3dUFLRTBSQnNENFhBZE54?=
 =?utf-8?B?Zm5wNFkzNWx2RWY1bUlwQllrRklSa0dGSHN1elJET0hnRVFWQk1meFg2WW4v?=
 =?utf-8?B?UEFSdmRTQTdLaEVlU0FVa2dpcTdlWjN1VTlUbjBDTkthZmFqMDY2WFhZbkh1?=
 =?utf-8?B?VmxESEd3YlFTcXg1U1hrcDNId2R5dUdrY1AyU0ZYTjZDTWx5Z056VzRLSmZH?=
 =?utf-8?B?dTUxeUhGTXFFZkhHVkpWTmoyWHNYTXFZSGQ4NS9aZkRwN1E1c3JDR1dqR3VI?=
 =?utf-8?B?dTkrQlhoUVlLRTQxZUY3WndQSGRGdTIxejVhdUhxVDloVVIyem5URXZnTStw?=
 =?utf-8?B?Y1pibjl5TUVBR2NkZW9rSGUzUFh4cW4rdmdpRTlOS3p2NERWWSswbmlDTkVK?=
 =?utf-8?B?MDZ3QTVDd3BHYWtFM1N4d2pvWVNPZHZ5TEJTOHg0TEtWeVpLUXFjcmtseXRz?=
 =?utf-8?B?V3FCSWthdXFHVTJsYmhKYVc4VFFRVkVLeFN2QkRCRFQvYmcwbGlUUW1SUVYv?=
 =?utf-8?B?ZVE1ZWYrTUpYNHFaZS9vMzZXS0J4TXRwbzhmalcwMWx6bjFra3YrcnJrRm5k?=
 =?utf-8?B?ZHlUVEI1WmF2T0IwbjZybUYzVDdYZlM1YkFRSXdITldWSTFDcGxHWlU5Q0VF?=
 =?utf-8?B?Z3VBbS9CclluTjFCYTNzYVFuV20rdmljenJselBXWUxPWjljWlRQZVBTUkJB?=
 =?utf-8?B?SFp1QWFJNS9jYTV4K1VidUJia0Q1dUxjMDB0KzNyMGVIN2lPTjNaUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b344f5-03fc-492a-124b-08ded2bab8db
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 13:07:34.2694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: indGixgaPsMmp//nl1rzgnxhUi9B2R3nbprG8NccC877+UTUbf4+akXH5HGemy/WNp4BAFpiuS2+JsGaXzeAOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7261
X-purgate-ID: tlsNG-ebf023/1782392861-AE3371CC-635E7363/0/0
X-purgate-type: clean
X-purgate-size: 4507
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:from_mime,macbook.local:mid];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
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
X-Rspamd-Queue-Id: B31846C5EC1

On Thu, Jun 25, 2026 at 01:31:26PM +0200, Jan Beulich wrote:
> On 25.06.2026 12:08, Roger Pau Monné wrote:
> > On Wed, Jun 24, 2026 at 10:01:36AM +0200, Jan Beulich wrote:
> >> On 23.06.2026 17:54, Roger Pau Monné wrote:
> >>> On Tue, Jun 23, 2026 at 04:27:12PM +0200, Jan Beulich wrote:
> >>>> On 23.06.2026 16:16, Roger Pau Monné wrote:
> >>>>> On Tue, Jun 23, 2026 at 03:44:06PM +0200, Jan Beulich wrote:
> >>>>>> On 23.06.2026 12:31, Roger Pau Monne wrote:
> >>>>>>> +    if ( uart->force_polling )
> >>>>>>> +        return;
> >>>>>>
> >>>>>> As the IRQ was disabled, is this even possible? I.e. should this be some
> >>>>>> kind of assertion or alike?
> >>>>>
> >>>>> Hm, I wasn't setting IRQ_DISABLED before, and hence needed this guard.
> >>>>> But now with IRQ_DISABLED being set in ->status do_IRQ() should filter
> >>>>> any stray interrupts.  I will attempt to add an ASSERT_UNREACHABLE()
> >>>>> here.
> >>>>
> >>>> Simply ASSERT(!uart->force_polling) should do here? It is not wrong to
> >>>> run the code below in release builds in such an event. If we kept getting
> >>>> interrupts (perhaps at a high frequency) we'd be in trouble anyway.
> >>>
> >>> No, I'm afraid I can't do it like that, I can't put an ASSERT there,
> >>> because we can still get into ns16550_interrupt() after the interrupt
> >>> has been disabled.  In do_IRQ() we have the following loop:
> >>>
> >>>     while ( desc->status & IRQ_PENDING )
> >>>     {
> >>>         desc->status &= ~IRQ_PENDING;
> >>>         spin_unlock_irq(&desc->lock);
> >>>
> >>>         tsc_in = tb_init_done ? get_cycles() : 0;
> >>>         action->handler(irq, action->dev_id);
> >>>         TRACE_TIME(TRC_HW_IRQ_HANDLED, irq, tsc_in, get_cycles());
> >>>
> >>>         spin_lock_irq(&desc->lock);
> >>>     }
> >>>
> >>> So if the device is generating further interrupts in the window with
> >>> IRQs enabled (while we execute the handler), we will keep looping
> >>> around this, without taking into account the setting of IRQ_DISABLED.
> >>
> >> Ah yes.
> >>
> >>> This is something that we might want to fix, so that the loop is bound
> >>> by IRQ_PENDING being set, and IRQ_DISABLED not, ie:
> >>>
> >>>     while ( (desc->status & (IRQ_PENDING | IRQ_DISABLED)) == IRQ_PENDING )
> >>
> >> Or perhaps ahead of the loop
> >>
> >>     desc->status &= ~IRQ_REPLAY;
> >>
> >>     if ( desc->status & IRQ_DISABLED )
> >>         goto out;
> >>
> >>     desc->status |= IRQ_PENDING;
> >>
> >>     /*
> >>      * Since we set PENDING, if another processor is handling a different
> >>      * instance of this same irq, the other processor will take care of it.
> >>      */
> >>     if ( desc->status & IRQ_INPROGRESS )
> >>         goto out;
> >>
> >>     desc->status |= IRQ_INPROGRESS;
> >>
> >> thus also having the comment no longer describe only part of the conditional.
> > 
> > I think this is racy.  An interrupt hitting in the window with
> > interrupts enabled ahead of the handler having set IRQ_DISABLED will
> > still set IRQ_PENDING, and thus the loop would get executed a further
> > time, and the handler called after IRQ_DISABLED having been set.
> 
> Hmm, I don't quite agree with how you put it, but I think I see what you mean.
> There's one question here, though: If PENDING is set first, and DISABLED only
> later, shouldn't that IRQ instance still be handled? If so, ...
> 
> > I think we need an extra condition in the loop, I see no way this can
> > be solved only by dealing with the concurrent setting of IRQ_PENDING.
> 
> ... such an extra condition would be wrong. If not, yes, I agree.

But PENDING is always set, regardless of whether the IRQ is disabled,
the normal flow in do_IRQ() is:

    desc->status |= IRQ_PENDING;

    /*
     * Since we set PENDING, if another processor is handling a different
     * instance of this same irq, the other processor will take care of it.
     */
    if ( desc->status & (IRQ_DISABLED | IRQ_INPROGRESS) )
        goto out;

I think it's valid to have both PENDING and DISABLED set with the
current logic.  In fact, the code in ack_edge_ioapic_irq() relies on
having both PENDING and DISABLED set to mask the source, as the
->disable hook for edge triggered IO-APIC pins is a no-op.

We could likely change all this to be more straight forward, but as
with the serial interrupt handling I would rather not do that change
during a code freeze.

Thanks, Roger.

