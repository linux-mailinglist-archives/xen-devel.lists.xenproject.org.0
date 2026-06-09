Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DzOcLdfVJ2pv3AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 10:59:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1857B65E089
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 10:59:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=qLklpRj7;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1332522.1594973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWsIG-0008PN-RW; Tue, 09 Jun 2026 08:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332522.1594973; Tue, 09 Jun 2026 08:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWsIG-0008NV-Om; Tue, 09 Jun 2026 08:58:44 +0000
Received: by outflank-mailman (input) for mailman id 1332522;
 Tue, 09 Jun 2026 08:58:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wWsIE-0008NP-QP
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 08:58:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWsID-00FaWg-Tc
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 10:58:41 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a27d5b6-5cb7-0a2a0a5109dd-0a2a450b8dde-36
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 10:58:41 +0200
Received: from [40.107.200.34]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a27d5c0-212f-0a2a450b0019-286bc82226f6-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 10:58:41 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV3PR03MB7407.namprd03.prod.outlook.com (2603:10b6:408:197::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 08:58:37 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 08:58:37 +0000
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
 b=Vov15qXtzf/gIxq2q8Ge1y1eqlHeyKFc945mpIh970m9cCgJ4y0NVB2SfgCFXySoAwGUpmG/cbvloijcSs+u4tM4HKoA8NSIEx2OiMCMfDJ7Z2Q6qhyOffGMqpNt5qbBD0tVYzItMscGnIyCbtxz2x00dJTOb0PQoWTl8JEIWZ30bpJRKuuPjtHiugvJ9IYnbQJMY5eM9N/eKb+yD5zIMFqoipJGn27IUqT6hfVLNdqiMzT7uVRJH8on8DGJ6JUZrG/+buTT50Du74ZKWglfG4fLfdBhGqkydDEbO1p7Sl60T3F+UifH8Hnb/cPtIlORePwMC1yoyOJsgeiU9jgTsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NgvfDeRltW+4bsBSBTVgAEp8xUfe+nP6mgKZYfKQg/w=;
 b=YNiMxYmTW4BImzu9pIDrG/C+B7DkYq3cfUnvcfoYudiu0U/cR5AH7mvJC03JA23efzegf1GooZkzicWhX1RAdeLI5nR1++kPe7Nz6wknqAsAsxBDURdgkTdcLn1172LP88zBK9goSeNf49hcIpF9nHrkHijiywHpag+9xSjG0juyYHz0C8XsFhjm/9ksr/LrgXu0QmREyQJskWi6Gha0F82jiYfUxN4QeaYYpJFlv8ffWUZa+fwCUs9QdLxbWh0q02Q+jCqlK4sH/eLIWMFXJ6GfS/bFEv8e0KXtSzeHGJb1+Cl/vbXFDZogmWTZu1RjrEbPyivtZrlKynD6pCHx2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgvfDeRltW+4bsBSBTVgAEp8xUfe+nP6mgKZYfKQg/w=;
 b=qLklpRj7ZZNInLMx9KBPuEn+HTKKcf0AH5qYrQg/EEllfoUOiy4iSmP1oFlkxsl+Oj2cQDN1pmnmYirV0vFOAbJJnTFLS4gEM69rCc4ARaFh+LmJiwCqRrYN0++1kbcltNM9wfLEELVY8ZH66di7lHTsy4F2/aoRlAZGwVxHt5o=
Date: Tue, 9 Jun 2026 10:58:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.22] xen/pdx: fix off-by-one index in offset mask
 calculation
Message-ID: <aifVuu_W_0BiAzhh@macbook.local>
References: <20260609085322.92856-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260609085322.92856-1-roger.pau@citrix.com>
X-ClientProxiedBy: MA3P292CA0045.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::10) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV3PR03MB7407:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f442c76-38a1-4aec-584e-08dec6054b79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HVuy5+QF9lpLpWu8k8NPb8qT1eB4TxicHiu6DXeiw2xud1pvM9UpZ832+NRkTYLRljQChqcWv86sZflgoEK48OXV9/vAiQFW5SptMlqgphFUGa/ItvyNQozFrmLGlIJKWNKKUXiztoYPcxss6ijIhiQTxl994/M8axp+ANnUh1Sm7DM2Ivvoh5rgXdfiUYM/oEl0xjeZmEZLEeyoKXUcMGpeMhQ4t+uIAkvrhosqVtJgdfZCJnF1vF5T3pYkd1pwZGToYqOe8hLvuJJQsdebiZ8ND1YOboPceiS1zl5DdLSTuK63Qxb/EdFVQXiYyzn8qQ+0yg3kofMFwWNdRt4gFnC5DAwo13351DYAU+Csaj6ytbbbu6NgcqzYWPG10fZrahjsZaFkG2we/GnIKE9hQ+r/f6pla/rglUiaFuWC43/2G1CRpgEb+hA8CCzieAaN+aX1Ax2F20LE9PRyyic3wNykSNqvXEaH1+4em+eJC8371HEeTrNMibyQelkt9lNc3zJOsBDTCGYR/dGKvdkEKyHicaPP/9ZXrtUoPkyQOMQb7HCslKktvSwuSif8vrrdFGbIAznHmV2/nDvQKRXsnrA9n9dA5s4imdO5R0YGxzqqv5uwLUuU0ER+ac55ZsLKwXR+8sxiWdz4WB3q+ohg3jdwAJPu03FYGIhrA6lv1c1oOPGh/vB13p5oLWMtDFS1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGtkcGVQWDVJakVrQW50T2hvL2FMSVpLK1hhK2JxaXlFNExGZXh1ZTVWL0tm?=
 =?utf-8?B?RTNJUkNKU0tIMTVpZGlnR04raSs2WjFRWTNtN29UWm1WcGw4eHkxMVJVSE9t?=
 =?utf-8?B?QW9yQXFLRkJpdUZyelM3bXZGOVBwZTFFTnA3Z0NYWWlmZ1BNcUlGbWhUNzRJ?=
 =?utf-8?B?a285cjdpWUhqY3NJQ3BsdTI1SVVUbHNQZm9BVk1EZHQ5U25BZUg0SXhETjU4?=
 =?utf-8?B?ajZWaFl1OTdXakZ0eS9Ga2hrUEhFR2pWT2dWWGUwZm9CdWNqcVdTeG9qZzFl?=
 =?utf-8?B?b1RSTVI3YzNiVG8rT1VwTE02cHZzNndHalVCSTdJVHBHRG9reUZ1dGR3Rks4?=
 =?utf-8?B?UjAwN2ZMN04zVnFEd3RwckFrenU0ZElpVlY5M3p3SEVEYWZSaUVTMGlwdlNN?=
 =?utf-8?B?V3VTU0wyN2xoUlZvSkRVaUJ4SGQ2a3kvTzM4TStiV0YvclcxaWZocUJPOThU?=
 =?utf-8?B?dDJtN3czSXZmK21sUjFRYXYxVEQ1SUVxSDlEZ3c5K3pna2hiV1g0Zi9IaEVZ?=
 =?utf-8?B?YWprUTJESC9uTVg5VTBrNlV5c1NxOC9DbFo2NWVROVJSeG1yUkkybU9KY2tu?=
 =?utf-8?B?eXVDWmIyQVFHM05XSmFyNDVVM0pEMm1IeExielRNYjY5Uk1oQmdJekNQNzIr?=
 =?utf-8?B?MnVxTmFHaHI5SEZ1NFRROWlSQmhBT0FXR0t4a2lDOTJEdlprQ1lHS0pJR3po?=
 =?utf-8?B?YTBuc0J1SzhHZnJDWkpER1FEalU4RkFZT2VKWlZ1VEl3Y25TMUdsN2xUbDk5?=
 =?utf-8?B?eEdtdExiWjFxRWIvemRPdS80dElOVWNoMVdlV2VtNzJjcEF1MTBDR3JZUW1I?=
 =?utf-8?B?d2E4RDlkSjRjYkNYMHdvaDlqQTNMUitqTEhZQ0RKYU8ycFNhaVdLb2VZRUFm?=
 =?utf-8?B?NzY3ZmhYWEs2VTZYWnB5L29iZXlTcmRpU0FKVUgvS1dZVkFWZnRBampUc0lp?=
 =?utf-8?B?a1N0UGgwYWJObmUzcWJ2eDZ2dFcwWjRYTFB4NTlBY3ViNmQ4WXdPVmp2Witr?=
 =?utf-8?B?dC80ei8xWS81bGZKZzBQUCsxWnB1ejFCRTUwa1h5OEpxbEkxRU5ubCtLTEpx?=
 =?utf-8?B?WW02Vmc2dlN4dnlKSGRTOXJ3N1c3N3FIeFpkR0FSVFBKY2JPTTk5TUIvcDBl?=
 =?utf-8?B?VDZyU0NGREpRYU55NUE3ZXN1OEMwWTcxUm90dWw2WmdJdmFqbjArSko3dnJU?=
 =?utf-8?B?S0p1OHFYNWFoZUd1bUx5TzZIM0hWZVJsYjRicFRkbTdqNUVMM1Q4QytvcFBJ?=
 =?utf-8?B?WldVNm1obHZ5ZjNLbHBtcHhzWHZJZElZT1NhOEtFanMyS0FoNUV6SkdEOGlF?=
 =?utf-8?B?azJhYVo5WUN0alVUL09wR3FldlRUZXFyUHZsRERvQ3hDMW5Tbk1KdkJ4SEpi?=
 =?utf-8?B?UGFIN3dWaEFRazFFZ1grMWpYVTB0NUdGdlVObU1KaUpyM0JvL2IwZ2lPeVRT?=
 =?utf-8?B?RzR5NVNvWVRIZVlya1kvUEVhSFFaTW1wcE9nN3pZbmd0R3dCUUJGNFpkRm0v?=
 =?utf-8?B?cHJPcGdYd0FVU2MzSmQvV1ZhZnA5ZnJ2ZVhkQlBnSTdzN2hSZExDYzB5UWFJ?=
 =?utf-8?B?cHNnYVdtMy9STkMyZ05YWitieDYya1BXemZRM2tCQkNZalhIN09EV0h5Rncr?=
 =?utf-8?B?aEI1SmFaM2tTZEJjMUpOaHF5dVdyb2xLRGxvMHZMZTV0NlJ2VHd0Vy81Z0Ft?=
 =?utf-8?B?cTZieThqdDMxanQyV28ra2xXUnRiWHRacVJ3VVhYK3ZySzJUTVBHdlVFZVZr?=
 =?utf-8?B?ekxEbUduZWpTeWY3L3NmcDV5Z25aQkZ0RjFtWkxxTFB3ZzlyQ09hZHFIZTM2?=
 =?utf-8?B?YWRtQnVNbHJTWTZtRE0rM3ZQbDhpN2NkbnZZZXlUNWJJa3FuYWJqQ1pOb0Ry?=
 =?utf-8?B?b2wzWll1UENpQk1VZCtEMGVQRHJvTk9JSzB0UTQ1NU50UFBnRXBHaG96SWo4?=
 =?utf-8?B?KzVQd2JWbmxRRnpORzhPY1pQWkJyRHAyNXk4bHo2MDVwSTJ4SkR0TTQ0SXNx?=
 =?utf-8?B?TGFKcGVxMEc4c3N1KytkMGJGd1hpWmlEVUppMFJkSDI2Y1FuK2pDQ1c1cEd3?=
 =?utf-8?B?TmhaVnNxV291NmVHcytWaWN1Ynh4YTJKdTQ4cHZZSnZ3bTMwSmNEdmVMNVJu?=
 =?utf-8?B?N0o2Sm1nb1RQT1lCUEM3aGhPblVjYnVObjU2eERZRlJrVUZWRnFaVTl4aW44?=
 =?utf-8?B?YW5NQWkvWUVRQW04dzdNenBrREtTeVhDMFNmSURuWkVxeTlMSngvbGVpVVdT?=
 =?utf-8?B?SWF2MHBDYWhwcXdSSnJnTmpyRFg1SkdmNnI0U0pHL3BvV2lLZkdrUW1BU25q?=
 =?utf-8?B?UUFGL0pvUW1Dc0J5NWxwTWQ0NHF4MjVTTlJ1RzdBRUY4VlczRVVOZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f442c76-38a1-4aec-584e-08dec6054b79
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 08:58:37.8466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: age3HSqWcv6ekIlvDMLL7/6D62brHlicK/j/hYFeEMSI7a5V0+H5bDG77zz4l+bNPItkBXP6t0+Y/YXzoNkUiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7407
X-purgate-ID: tlsNG-42698a/1780995521-1B77AF3B-AC32A116/0/0
X-purgate-type: clean
X-purgate-size: 3572
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,vates.tech,citrix.com,amd.com,suse.com,xen.org,kernel.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1857B65E089

On Tue, Jun 09, 2026 at 10:53:22AM +0200, Roger Pau Monne wrote:
> Adjust the mask calculation in case the last range is merged with the
> previous one, as then the mask must be calculated from the previous range,
> which the current one has been merged into.
> 
> Instead of fixing the off-by-one in place, move the calculation of the bit
> change mask to the next loop, after the ranges have been merged.  This
> simplifies the logic by consolidating mask calculation in a single place,
> possibly making it less error prone in the future.
> 
> Also add a test case that triggers the bug being fixed by this commit.
> 
> Fixes: c5c45bcbd6a1 ("pdx: introduce a new compression algorithm based on region offsets")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  tools/tests/pdx/test-pdx.c | 14 ++++++++++++++
>  xen/common/pdx.c           | 13 ++++++-------
>  2 files changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/tests/pdx/test-pdx.c b/tools/tests/pdx/test-pdx.c
> index d783186577ef..ba57f1793011 100644
> --- a/tools/tests/pdx/test-pdx.c
> +++ b/tools/tests/pdx/test-pdx.c
> @@ -191,6 +191,20 @@ int main(int argc, char **argv)
>              },
>              .compress = false,
>          },
> +        /*
> +         * 2s Dell R740, merging of ranges causes mask differences in PDX
> +         * offset mode.  Useful for checking mask calculations.
> +         */
> +        {
> +            .ranges = {
> +                { .start = 0x0000000UL, .end = 0x0080000UL },
> +                { .start = 0x0100000UL, .end = 0x3070000UL },
> +                { .start = 0x3070000UL, .end = 0x3870000UL },
> +                { .start = 0x3870000UL, .end = 0x6870000UL },
> +                { .start = 0x6870000UL, .end = 0x7070000UL },
> +            },
> +            .compress = false,
> +        },
>      };
>      int ret_code = EXIT_SUCCESS;
>  
> diff --git a/xen/common/pdx.c b/xen/common/pdx.c
> index 7e070ff962e8..a84c7d19ade4 100644
> --- a/xen/common/pdx.c
> +++ b/xen/common/pdx.c
> @@ -391,10 +391,7 @@ bool __init pfn_pdx_compression_setup(paddr_t base)
>          if ( !i ||
>               ranges[i].base_pfn >=
>               (ranges[i - 1].base_pfn + ranges[i - 1].pages) )
> -        {
> -            mask |= pdx_region_mask(ranges[i].base_pfn, ranges[i].pages);
>              continue;
> -        }
>  
>          ranges[i - 1].pages = ranges[i].base_pfn + ranges[i].pages -
>                                ranges[i - 1].base_pfn;
> @@ -402,19 +399,21 @@ bool __init pfn_pdx_compression_setup(paddr_t base)
>          if ( i + 1 < nr_ranges )
>              memmove(&ranges[i], &ranges[i + 1],
>                      (nr_ranges - (i + 1)) * sizeof(ranges[0]));
> -        else /* last range */
> -            mask |= pdx_region_mask(ranges[i].base_pfn, ranges[i].pages);
>          nr_ranges--;
>          i--;
>      }
>  
>      /*
> -     * Populate a mask with the non-equal bits of the different ranges, do this
> -     * to calculate the maximum PFN shift to use as the lookup table index.
> +     * Populate two masks: one with the non-equal bits of the different ranges,
> +     * another with the bits that change inside regions. Do this to calculate

Forgot to refresh the patch before sending, this line should be:

"another with the bits that change inside ranges.  Do this to calculate"

IOW: s/regions/ranges/ so that we don't mix "ranges" and "regions" in
the same paragraph which is confusing.

Thanks, Roger.

