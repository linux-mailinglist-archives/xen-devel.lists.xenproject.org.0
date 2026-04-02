Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMQgGktzzmkpnwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 15:46:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C13EE389FC6
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 15:46:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271938.1559899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8INF-0007dj-GK; Thu, 02 Apr 2026 13:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271938.1559899; Thu, 02 Apr 2026 13:46:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8INF-0007ar-Cv; Thu, 02 Apr 2026 13:46:17 +0000
Received: by outflank-mailman (input) for mailman id 1271938;
 Thu, 02 Apr 2026 13:46:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w8IND-0007al-By
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 13:46:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8INC-008Mwd-OT
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 15:46:14 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69ce7315-2eae-0a2a0a5409dd-0a2a450599aa-32
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 15:46:14 +0200
Received: from [52.101.57.54]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <roger.pau@citrix.com>)
 id 69ce7325-3760-0a2a45050019-34653936402f-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 15:46:14 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH4PR03MB7602.namprd03.prod.outlook.com (2603:10b6:610:236::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Thu, 2 Apr
 2026 13:46:11 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9769.014; Thu, 2 Apr 2026
 13:46:10 +0000
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
 b=h8/UQc8axSA41dqS1CITE6TMp0E6/UDjena30otZAjx4wiJ3g4A1zDBuA7QYcmEGTxRC6KwavOkU24VkD9BzxOSelsFNRV6YXN8MocUN9qw3KnP4jMKn9Oct9eYfdN04g7GzvYmlEj2Mg2neMTF6Gcbc8uecu7iAMakHBU0qO4m4OoUTsI3NXHodINrl2wHZYP0NknVQXWi6lO0O/DHGbqisIa+V3vAOZDfWqHnFM1cVOt5z75ybk91G2peFluDXxeGFaPNgZCBK+z+QcJGtwMk7vDeEv/NfEN5OXwq5+WNb05YF6nNbp+PCQti4hO8is7pyz7T91CJpOSkSXrTJNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjuCzCu9l3c0FgRD9+k5xTZ56Hp4cgz6aZuEbcUI6e8=;
 b=hQQTI9k5demWbyfd31HSdCJ8YJRzt7dNHeIKSLnDeLhlC2gP5XRg4EupuZ0+8QKlvHOffWBbQ0pdmrOcuH146j96Ujg7pEgFITLvlzLiYR6T9Kzi71yU81xoEPEwsdn4IuH1boEN6F5uR/FXYORJQzZ7hi35a7BJJ312OD12wZWwE5GzbiAeGjhUqxWqaEVwK3lG1qpMOpa9dNdS/9qfCptcoeEaPPPozgx18THk4vB/HVraG7YKiPfOOoKRiYXsgBfIR0o+H7XeJJMYR/ooN8K8sQtAsUCP/+KMygUMe7qqSi4TtYsHbLAn/qIF/peY0U9xPInR6KAXeMHOrwi3Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjuCzCu9l3c0FgRD9+k5xTZ56Hp4cgz6aZuEbcUI6e8=;
 b=w8gMFhbUwI61qRf+xe2YLrCh5r9NLh0TbF43U4v0RSGupKFOnh6KOI4k8BobGaydqhU17Bi45rju0dSuByCUZDpENKF+McLGbYqPtXNjLqlfuIuhG3CVvDwtJozqTqwpE87/Ou2vr0Wj/ALY6ySATJ3S3VzHO55UZsXtMLGrD28=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 2 Apr 2026 15:46:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH 1/2] make ioremap_attr() common
Message-ID: <ac5zHQO4k-Hr45BO@wifi-campus-l-10-3-197-236.u-ga.fr>
References: <924f3ef2-7883-4322-a921-edc814c96719@suse.com>
 <81e4f7e0-df57-4a5b-b16d-fe668682d94c@suse.com>
 <ac5d1zBaSQk7f0nE@wifi-campus-l-10-3-197-236.u-ga.fr>
 <b7e7b1e5-60ff-419f-9a89-2ac7fc3cd21c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7e7b1e5-60ff-419f-9a89-2ac7fc3cd21c@suse.com>
X-ClientProxiedBy: GV0P278CA0024.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:28::11) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH4PR03MB7602:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d9b4212-b736-44ee-d3b1-08de90be32e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xZX9BYiqUNalaCUx97Dt27XSOs91G8zTouosVk536PvAOZ/QxRiXYOwZMMeUlBOTHzluyfIm/GNsBwjhpeJrjimej1zzjGoWWVUsNscVbJyQdRZCD4lxh2SsO/Q8yiA9r+xmehBZ4BxwLGYQjH6rbAnt96iR4BpAts2yEeZWz9h72gbdYR2hrsMPklfnmN56wwddBikgMIjBELl2+vKaLmwqNByGrhmbo00eKrH9bOdjEd9NE1ELAyKS1jldcG0OWJGMIIJtqpEDE3PGbRm6f4sWPwg22yTqIgVawojiWVx4B7psJgpnXg6/1yQ8Aq2oF/4cRqdABoab7mHzQJbgTBsXLGp4r7n6jalCsWc+yq9uwfPMGUIW9SvXCyHd+BQleCBuLEEqM56p0H6XUZlbA893zc6cWGLExE1tC8k60YD50968/jXt6WKjMttjS5w34rWApGIdkLZ2iqOroaz486rTU3eXzIemQm+LKhyXXF5GVbcieu17s4IWdgOlAi3VQ9bCEozknIFntT+wTjMXtgRIy9xLbDtasx41pW6eHKeZKLhq8L5xYwQ1fvMIx9AqzSNxVXs6tBiJkVtzcQLqeO0u4HUbKZjbKjacPU8YPHQzSCbSog96rH8kYI+hFc630wLot/4a5ceYUJU4xyEOCCmowbwbd1b7xQA0kzREfSPnj5tMi+LLdvUeW0T9hQaQeB5mhYArXrZpluAQ4Gaha97N0CBdcaLqnB9rv/Z2Wkc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aG94bjU0ai9OQUxCa2R6VVFDOWFIWWVlWHpNNEtCdEdhTFJ2THQwcEFFWmpZ?=
 =?utf-8?B?MGR1WHNtellJeXdJVktlYW1kM0tJMXhoQmJ6WHQ3ZkpQejB4aDVBalB2anpN?=
 =?utf-8?B?Q0wwZGcwSldFcnkxU05Mbmg2aUFZcHYwU3NhSXdFQ2ZnbTBFb3VXSi9NbDd3?=
 =?utf-8?B?dUMrSGlEcmE2QVpYZXcyb09uRE1sZDJUSjZIdDh5SHl3a2hUVzJNMlUwZ0Rn?=
 =?utf-8?B?bmlaYjVsaFRTWjU1ZGNYN1o4QTFOcG9keDErUzl4VVcvR094OUt4WmNjVmI1?=
 =?utf-8?B?aTNKU01udXpSRG5SWVkyMUpoRyszWUtvNzBhUWtqbElsVkVJY1c1aFdxeHEr?=
 =?utf-8?B?NTliUTIvYVJtYWxOOWttcDNrL3VBcXY2WkpnVkNWbEJHWTllWkFHWTlQYmxq?=
 =?utf-8?B?MGI4V1RWR24zNUFac08wZTFHdjJjWUVqdlhOaEJVTGNjWkdNVGlhQzFKUU04?=
 =?utf-8?B?TG9LaHF3Sk5USkJ6V2Zab3NMZUxqQmFwREtKZStNYlE1U2hDRlBQbktsZUhS?=
 =?utf-8?B?Uk1abHE0WHczUTZnY1NIeUpzSWp5YXFQbVhOQlZ3ekxWbGdtaWIzMU9vRzd4?=
 =?utf-8?B?QkUyRGVFbDYrSDRieVZqcTRLWHdsNkV6a2VKSkRRK0RXRDQrcXBkc3MwdnI1?=
 =?utf-8?B?Q3JhTXNOWnB3Mllwb2RHQ2g2TC82eUNCenM4VDIwMEQzeUsvZHBjNWZqdTdj?=
 =?utf-8?B?dDF1WGc3Y2VXNVQrZndOandxSklBaURIUDJvUkNYcmJPZ3BtaGhINm9TZkwz?=
 =?utf-8?B?bUtFcGNxRkNiSnhQa0VTbVNWZ2FtT1M2RHhSNlpQbFhHeDhlRFJWR3I3dUww?=
 =?utf-8?B?WGJhUEVuTmV2ZENNcUNVU1dQK0JLa2hFSENhcURXWkFLV1dXN3ZOZURId25Y?=
 =?utf-8?B?NFVRcjZUd3QzRG1TWHpya1NBM1hIczhJZEFucVFWS2tvdFF0MHpEaGxLV1pB?=
 =?utf-8?B?dGl1Ums4T1hXdC9oaE1PWXZ1dVpIVkpoVlR5bnJzNzk1aEduSjBrSEpvTXBn?=
 =?utf-8?B?OU0zRXA1QWJrNS9OT3BOUGtGTGhJeERiQ25heWVhVVh4TVdUakVSV1pwSHhR?=
 =?utf-8?B?dzZ1QjR6Mk9xV09oWUo4WHJHS25MN2VuRnRwMERyTW1LVXNTOHNHV2p2MlpS?=
 =?utf-8?B?eXdMeTVlRmxlc1VodDU0bVM5eCtLc0U5d0I2bTNRbUFVeGkwZEJaaVZsSUVV?=
 =?utf-8?B?b3NUTitCanZ6VWgzdmpPbEZFNzlnNXJIMmc5RlFpYzJkaTNkOWxqK1BhdU5z?=
 =?utf-8?B?S3I5MzdDblZpOFBaRVhsSWNySStUTEdqN3NWalFWMlFuS3ZIN0puSGJ4clpw?=
 =?utf-8?B?TlplVlFJcWFENk9ieVcvMTJabCtSSUhyZFVXMVg3NmwxZFNGcDIxTVdaYktk?=
 =?utf-8?B?UnlNLzZwelpMdXRKRlM4NDUwa09MK3VmcU14Q1p6RnIvbENTN1dwQ285amVP?=
 =?utf-8?B?enVTcldvMGlyemsvajhmRFI0V0dieVNOWVJ2RHplVnMwVmliSDlPY3Q1R1JD?=
 =?utf-8?B?dksvMHo3OTVlTE5tKy8zek1peXlxMUNnUUdaVUQwNERuaE1mdEUxZlVrb0Q0?=
 =?utf-8?B?OG1pRklvTmxVL0VNZDdmTm5seXhkTW9hdkdteDZITlRyaUtMTFFIWEJKMVg3?=
 =?utf-8?B?cWhWaGp0MWhwWERQNis1WHVsR2xXa1hvZlpXZTBHVVB1bTlEWmJSSmNTWVpX?=
 =?utf-8?B?WVhiT1NzbjUwNDJrQ0Z3Tm5GQVIyTlRzOFU3VDhVQ0JmU1hqMjVJaXpjU2JT?=
 =?utf-8?B?RVRuSzRicWhCdmhlZk5jY0hqcCs0Ky9uZ3pjSWRyakxlS3FjdDhIU1MwMEZN?=
 =?utf-8?B?K1Zpa09DWmtOVEl6YlVoOVE3OVRLaXFPNjFHNGx6OUdvSjk3MDV6TUVTaE40?=
 =?utf-8?B?YXhxOENGMkdKcTJNWG5FdCtNTERteHpRTVo5c25RMnV4OFhDUlBoTkxLVUI3?=
 =?utf-8?B?d3RrMExoeDluL1QrZ29WWFM0R3NlSTRoeFIvVmg3d0w1dFMwQk5PRGlMV0xL?=
 =?utf-8?B?Zk00TTF5VXM2bHc0T0V2U0UrSU5EcjZXRkNScUFlWDJ2NE5FYWRSVlY4L0Ns?=
 =?utf-8?B?eXBNRFR0NERYdXhodG5VMEpkeWZoVnRmbXY2UDB4Tmx4OW9XTmxoRWZqVnV5?=
 =?utf-8?B?U0dPdnNJR3lKd3JFa09YTzZHemJsNkZGVVRXUFVOYWJYbVhuWndNcVB4RjAy?=
 =?utf-8?B?TEhzK0t1dVZiSFBFUS9nblhQdllNbHNzOCtvcndGdjBvenJ1YkRIeWJidCtn?=
 =?utf-8?B?eFFBay9tSGt5eVNEQnV6b255eDZSNUNoN280TmZJUmJxa0JIcmpwajdnbi92?=
 =?utf-8?B?WUZQVytlUVhLWEptM2Urb2cvclNkaE5JZk9kZVh3R05ZaFdTM1lhZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d9b4212-b736-44ee-d3b1-08de90be32e6
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 13:46:10.8054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yC5xnvf56S2uApgJB66ab93MMo5vLOQHUFvD7ZXrbB5jKSdRqnbZk8mFPEOhXKP3+bkmz1pD/agDKVMkDg+3BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7602
X-purgate-ID: tlsNG-c201ff/1775137574-393EC96F-E7ACA0A9/0/0
X-purgate-type: clean
X-purgate-size: 4054
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
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,m:tpearson@raptorengineering.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,xen.org,kernel.org,vates.tech,amd.com,wdc.com,gmail.com,arm.com,epam.com,raptorengineering.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,wifi-campus-l-10-3-197-236.u-ga.fr:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C13EE389FC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 02:42:54PM +0200, Jan Beulich wrote:
> On 02.04.2026 14:15, Roger Pau Monné wrote:
> > On Thu, Feb 19, 2026 at 04:51:54PM +0100, Jan Beulich wrote:
> >> --- a/xen/arch/x86/mm.c
> >> +++ b/xen/arch/x86/mm.c
> >> @@ -6166,41 +6166,15 @@ void *__init arch_vmap_virt_end(void)
> >>      return fix_to_virt(__end_of_fixed_addresses);
> >>  }
> >>  
> >> -void __iomem *ioremap(paddr_t pa, size_t len)
> >> +void __iomem *x86_ioremap_attr(paddr_t pa, size_t len, pte_attr_t attr)
> >>  {
> >> -    mfn_t mfn = _mfn(PFN_DOWN(pa));
> >> -    void *va;
> >> -
> >> -    WARN_ON(page_is_ram_type(mfn_x(mfn), RAM_TYPE_CONVENTIONAL));
> >> +    WARN_ON(page_is_ram_type(PFN_DOWN(pa), RAM_TYPE_CONVENTIONAL));
> >>  
> >>      /* The low first Mb is always mapped. */
> >> -    if ( !((pa + len - 1) >> 20) )
> >> -        va = __va(pa);
> >> -    else
> >> -    {
> >> -        unsigned int offs = pa & (PAGE_SIZE - 1);
> >> -        unsigned int nr = PFN_UP(offs + len);
> >> -
> >> -        va = __vmap(&mfn, nr, 1, 1, PAGE_HYPERVISOR_UCMINUS, VMAP_DEFAULT);
> >> -        if ( va )
> >> -            va += offs;
> >> -    }
> >> -
> >> -    return (void __force __iomem *)va;
> >> -}
> >> -
> >> -void __iomem *__init ioremap_wc(paddr_t pa, size_t len)
> >> -{
> >> -    mfn_t mfn = _mfn(PFN_DOWN(pa));
> >> -    unsigned int offs = pa & (PAGE_SIZE - 1);
> >> -    unsigned int nr = PFN_UP(offs + len);
> >> -    void *va;
> >> -
> >> -    WARN_ON(page_is_ram_type(mfn_x(mfn), RAM_TYPE_CONVENTIONAL));
> >> -
> >> -    va = __vmap(&mfn, nr, 1, 1, PAGE_HYPERVISOR_WC, VMAP_DEFAULT);
> >> +    if ( !((pa + len - 1) >> 20) && attr == PAGE_HYPERVISOR_UCMINUS )
> >> +        return (void __force __iomem *)__va(pa);
> > 
> > Sorry, I'm possibly a bit lost: I see that on the bootstrap
> > page-tables we map the VGA hole (0xa0000-0xc0000) as UC-, but I'm not
> > seeing this being done to the directmap?
> 
> I'm not changing that aspect here, do I? ioremap() used the direct map
> (apparently assuming the cache attribute is suitable), and so do I now.
> 
> Yet then, to address the point you make anyway, I certainly see use of
> __PAGE_HYPERVISOR_UCMINUS in l1_directmap[].

Yes, sorry, I know you are not adding this here.  Just took a look at
the code, and I couldn't find where the directmap entries for the low
1M get adjusted to use UC-.  I should have made the comment clearer.

> >> --- /dev/null
> >> +++ b/xen/common/ioremap.c
> >> @@ -0,0 +1,42 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-only */
> >> +
> >> +#include <xen/mm.h>
> >> +#include <xen/pfn.h>
> >> +#include <xen/vmap.h>
> >> +
> >> +#include <asm/io.h>
> >> +
> >> +void __iomem *ioremap_attr(paddr_t pa, size_t len, pte_attr_t attr)
> >> +{
> >> +    void __iomem *ptr = NULL;
> >> +    unsigned int offs = PAGE_OFFSET(pa);
> >> +
> >> +#ifdef arch_ioremap_attr
> >> +    ptr = arch_ioremap_attr(pa, len, attr);
> >> +    if ( PAGE_OFFSET(ptr) )
> >> +        return ptr;
> > 
> > IMO it's a bit confusing to deal with the offset addition detached
> > form here, I would rather do:
> > 
> > if ( ptr != NULL )
> > {
> >     ASSERT(PAGE_OFFSET(ptr) == offs);
> >     return PAGE_OFFSET(ptr) ? ptr : ptr + off;
> > }
> > 
> > And get rid of the !ptr check in the if below.  So that when
> > arch_ioremap_attr() succeeds it's all dealt with in the #ifdef
> > protected block.
> 
> Possible, yet I deemed the other variant better.

OK, I'm not going to insist then.  It just took me a bit to notice the
extra !ptr check in the if condition below.

> The assertion you suggest isn't valid anyway (see the last sentence of the
> description and xen/arch/arm/mpu/mm.c:ioremap_attr() prior to Michal's
> "xen/arm: mpu: Fix ioremap_attr region size and return value"). Now that
> that's changing, things may indeed be possible to simplify here.

Oh, I see, right you are.  It should be:

ASSERT(!PAGE_OFFSET(ptr) || PAGE_OFFSET(ptr) == offs);

Thanks, Roger.

