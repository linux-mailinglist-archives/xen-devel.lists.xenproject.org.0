Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOy+KNeR12k2PwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 13:47:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC1B3C9D77
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 13:47:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277142.1562407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAnr2-0003lm-5G; Thu, 09 Apr 2026 11:47:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277142.1562407; Thu, 09 Apr 2026 11:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAnr2-0003kC-1w; Thu, 09 Apr 2026 11:47:24 +0000
Received: by outflank-mailman (input) for mailman id 1277142;
 Thu, 09 Apr 2026 11:47:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wAnr0-0003jw-7L
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 11:47:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAnqz-00B2PN-JX
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 13:47:21 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d791c6-e002-0a2a0a5209dd-0a2a450ab9f2-30
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 13:47:21 +0200
Received: from [40.93.196.19]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d791c7-ee98-0a2a450a0019-285dc413726a-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 13:47:20 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV5PR03MB8387.namprd03.prod.outlook.com (2603:10b6:408:35c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 11:47:18 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 11:47:17 +0000
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
 b=v8p6aV7hkIe0XkM9WyB7X3rirr9aL5L+fgV1Nn7iPG/gzbJUthsSidRMqR94OgkdIcwFUuKKprfZBEN5i8D7BT/TnFi2Qv7v76iGt2cYYKpOEN5MrxxGRdL4CXY+rb29/FQr2GI2SwQ1MRMjpkxsNyKK8YTqp00tKGySSsyz9CiHN2WLducB5iqU+122chIKkXv1slUCrT/+cCohpK0btux7QYLxDiKxXC7rC9i42HGxMBeQ4mQ4R/gLfiTBkTKcR2HXW6+MaxtVzXwiQF24R8SU6bTk8caqdoJ3MlBz4rSr7+jFySDZ9aaCXTQL2QvMwz4fdjhKwXGCfmztrstrLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6Zvtn+ZQQ9XXES2Ko5NN7Qt68GnFrmqrpOHfcBVcpI=;
 b=qhEIRaHk+RyGn9v9JA30964IjXm48wM/FALl8sAfEdcehEMjV3e9P1Uut6Vsu+g792fjS6TdxXv5kcnxeQOG8jRdO64tZ8xolGRoHYybuwgwoyHzNZ/6G+w4xzq3hEyAduAyV8bP67ufVh/1SScdpp+mzvnFV1yok+xiDMbKSAt0AV7O8ylgJth6+vH5jlTQHf6w3XGHVDVwAnVP5L6sP6roU/jXApvV3bB9gkUK2q6s2YBBPRqE+Va+X+yclcTRicy6yrxyzicZPzfu2EAk8OJxvw59l8opO2xz+ll58cz70cjyA/0q225tKW6zA0biNPgdt4TvhZiIb3M+sH0q/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6Zvtn+ZQQ9XXES2Ko5NN7Qt68GnFrmqrpOHfcBVcpI=;
 b=tku4sttpdFF5pkR12pPzMXQ39vN9MTJCDFzc/GNjs/yc9/YqifrhtbKXIVlC3CIT7Z5NjP6Zsc8Ys1TS+3pXDxCEobr/gYEoS3bj2EkOUSPnjdcmxTKk3itHiKg8wvOHipULyOm6jPU7wmeXHr6bG+UdUmj9mvc+PscxAt0XcJU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2ae13059-e0ba-4cf7-bda0-9a21cd428509@citrix.com>
Date: Thu, 9 Apr 2026 12:47:13 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/3] xen/common: llc-coloring: Fix off-by-one in
 parse_color_config()
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <20260409113934.197619-1-michal.orzel@amd.com>
 <20260409113934.197619-3-michal.orzel@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260409113934.197619-3-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0159.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36c::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV5PR03MB8387:EE_
X-MS-Office365-Filtering-Correlation-Id: 0de9a269-0de3-49c7-0cd8-08de962dc056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	zj1oEXJwUUJefH4lqMZTAf6Y26Qt2rYX6kcXTyEJANxBc4dUNZ2n5YBGlx4CTQGwJnCEeix2Mt77y+olVdLjUYhIeW3jzCW9KxVtZd2bdRtWTu/8OQcuILEcOIRgoVtozPpNABEXkIl4nLzBe4iMSd7Ef/83fWFnp4ST4+M/NVLAfgu7siaLL7uUIhvtS7ziOZdQ4k9hUlTaefxcvjIzD2eKqhnAURWCaJVOe3Xi4WyUUSgzS4fFd/DMyDhyg7R+KKSxiSB0WsiUaBs/ASuRdBF1SYOLBLGITLGuO3ESV51vclZl6ABDhnZFJsAVi4ujVBZUdwltVYww8eX5uBn4fA1wrmxXHpWAzJx1yHOCWc+oF60+qqFdOZaSO4I0u34xnqVHuQB9zv2y9tS6y/RSgKu+rOVUWzQTSp2FnaxfU9Yd24kMRHXEXPMHZ7ckoyjPxrDEo0zkW++Tqv3JkpsAU3KVur9cZP1rExyAZa8HEini96nzgoa1GEQHQsDIYPinRXjc0d9V4uY7H+oFpIlzTNO7f3/rN6odgbl5VH3vyAXADJJ72ISrtFLJbjZk1cUVWlhkzcYDeoZiUy6uZZwH7jyM73i00OD/swcte2cJ2arjFtRr5G7yegDtTIdVxwnUcUIMOSaDzFOpd33z72UgAewxY/RR77ZCrhcypPjqxwWm/f6f9IsYhuD9/IddZXqo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekxYd1Y2ZHRhSkNBZDhJQVoxcHRLbmhqQ256MXRhWnZEM0lIcmNlRnlyem9i?=
 =?utf-8?B?eDZjUVAzOWN6cGRSTmo2aDZmZm16a1JjV0F0ZnVUbTdJNEwrSVNoTy9waVVT?=
 =?utf-8?B?SkNCazhQQmRjaVVXVDZsdEN6a3lXREZMbzRIdHJQdU1FNXhqSHdnT0wzOHRG?=
 =?utf-8?B?bWxXVkN4UTJIZnBtNjhua1lTUjlvL0lmWkF5YkdkYXp6Zk9vMzc0NE5wUUx1?=
 =?utf-8?B?REZkTDZ1TGhiV2t3OU95K29aYkdpZGM4SkdUVndabEdxc1MzbHBLRmRaOWww?=
 =?utf-8?B?cTJDTnBhN3cydWVFZnJMZVFhdWVRQldTeE5tR0g1UlhoQ29HS0ZmYlhTR3J4?=
 =?utf-8?B?bDYrMTJBaFlPMHJlQjZKVGtLTjcvRWRuckN0ODJaNUVuRHc1ZTUrQTZ1UEg0?=
 =?utf-8?B?ZGhueWlia2xTajlOMG9yVXNEM1lJRjZ5R05JVG9uakRBai9CNHhzMDV2ZW9x?=
 =?utf-8?B?MXZVQmxUYWt4bU9OT1VySlVhZ29CY2JlRllKVUVSQjMvUXNoRUZqZHM1cHpy?=
 =?utf-8?B?RFU0alFmV1Y1ckc0VjM0TzFQSWpoMXhHWmVBdExTK1FrajlTR1lOdlNXNjVN?=
 =?utf-8?B?SDE5WmJPZUtNMXNNWkRqY09ZeHdtTDJubVYrbmVuc1BPYWwzM3FQTVJQRmdH?=
 =?utf-8?B?b3hNcThESjVwcUxwK1dxelFUbXVITUEwbk1CTGxVR1ZCTDVhZ1ZYNUFINW9F?=
 =?utf-8?B?OUFudnBvT3NtS2JtT25HWHR6V3ByZThqZU14b0JTc2J6NXp2U3RCQzdobFRp?=
 =?utf-8?B?S2t3RjJMNG1ZQ3AwSGszK0RhbGR0cGxrOUduTkF6cHJkaldoV0NobXZqejly?=
 =?utf-8?B?RTFqNUpLUlIzWWpybkRIZDZsUU5HbWhwTWRuL1ZVQ2xUcldRejlPV3J2MXlL?=
 =?utf-8?B?ZmgyTGZJSFhsdENGd1cyb1JpZFAxNnVXSkhoaGVBNFZKc0NNNU44Y29XeVBi?=
 =?utf-8?B?aGd0WklyMTN1RmFaWlp0YWNLeWVXOWVBYjdHNExFSy9VM0NRaFZpOUo0cFNB?=
 =?utf-8?B?OGlvTnZtZHoxMzNLbHBsQzBadmJId3hua3lhS0Nya3RlSGl4cVJVTVZyUVFB?=
 =?utf-8?B?aFhMUURTemJncFJ5ak82NXhVV3NIREkrTSttb0U3UXNIV0tnSG9OUElyaTh0?=
 =?utf-8?B?WDdTSzZRWEora0dMMmNiOXZHT09EOG5ZVWs5R2hzdnF1bEtNblN5TWdiZWRG?=
 =?utf-8?B?cnZMRGJYUjFvbGJEaS9IdStaOE5BajEzMndDNnNYMk9rNFpMMGE2LzExNlg3?=
 =?utf-8?B?QnBWZ0FNTnVFV3BwYU9HTDZvZmUrS0lybmdLZFllbGo5aHBqZTFnaG1ISEp4?=
 =?utf-8?B?RzJ1MmhoeWdtREd2VTZzV0V5S042L0VFaFFWN1pvMFhEeEZJb2NNOHh4b1Fm?=
 =?utf-8?B?WC9JNjZhZDBIVEQzczBtVkFBdVZZMlpXbmdyMnhFTVhWWXMvQTBRTlp4Vytu?=
 =?utf-8?B?dXNXa0FCZkZSdEJ6VldPRmJ2M25BOVFXTFJEb3BFWEhJdXJFSjYxM2tROUN4?=
 =?utf-8?B?NkpIT3RzZGVkR1owaHA0dC9hN3hocU83akVJRXNFQ09KL2E2RHVEOWFZakZF?=
 =?utf-8?B?V3V3SUpzL2Y3Z25RZDlHbDkwM1p4alFhVkhnZkhzVUtwdGkwSWpRaXUvYUlh?=
 =?utf-8?B?L3ZjMjBvYXBxUUJIeTdDYTBsdURZSXRBaXFsZjQxT3lwNmU3bngyRWkxazZR?=
 =?utf-8?B?ZHg5dkRxbjRlTGpTaHV5b0IrOUptSFBFaWk2N2ROTWdrZGFwTUNIUFovdkFI?=
 =?utf-8?B?UkMyYnRNRStRVC9vam1ucGsvUlVlSXNuOUpCS3hLK0N1NTVrZThGeVdwRDY3?=
 =?utf-8?B?RFZTWUZ6Z2wzNWtHVmJPZVJzdU1BaE9iNCtPM1R1RllIVFZxZzBlWFNPT3NM?=
 =?utf-8?B?WUM3a2NuM2wvcmM3cGhrV3dDaHFMYWtiTGh5dERWR3ZVdTc2N1IweU9OLzVk?=
 =?utf-8?B?aWlpMERkV3ROWkRjZURGUUNJV2ozZ1lKaCtqY2w5dmIwbWo1R0huTWhOa3hr?=
 =?utf-8?B?M1lQK3h2emRTWk5MeFduZWxMekgwSUNpVytqdmJUaWZ5NDBWdlN0RDFkSGxM?=
 =?utf-8?B?RkJYS1dPU3RvQStRSUJZRlhsSHRDd2NGT25WWFVoSThXZFlmTUlPTDY1WEVw?=
 =?utf-8?B?ZzltdWU0MnNMa21tQzRScVVuTEMwVnJINUpaTkxlK0IybnowME9qbGNBTGQz?=
 =?utf-8?B?SWxKZ3VSYS9nRFlVc2pPbkl3cDFtRDh5MHlYaENOd1BXS0hZSUdYQ29JSUtM?=
 =?utf-8?B?M2hVQ01nWTN6amVrUWQwVVNQY3JIZ3dUclZXeXhadzZvYzBLN3QxRENRV1VF?=
 =?utf-8?B?V3VzNmJ4Nm9PbWY5bjhQcSswYXJFOFRKZEJQbnQvRUtuRlJCOGV6c0NCOHhi?=
 =?utf-8?Q?F10Xh4ndBTb/T/3E=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de9a269-0de3-49c7-0cd8-08de962dc056
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:47:17.9508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F8Fceog1Z9EfFy5xSWLhAi77Cr+fT7ACcdcxJ2R3wC7+NF0DFrHYAAudZ5WU5aGTMCgB0ehXUgyr3ylcQUbdJAr/gW1NY2S6MPQYiHNN+aE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR03MB8387
X-purgate-ID: tlsNG-4011c0/1775735241-C4C1A0B1-3ABB6216/0/0
X-purgate-type: clean
X-purgate-size: 1506
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:mid];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0EC1B3C9D77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09/04/2026 12:39 pm, Michal Orzel wrote:
> The check uses >= to compare the total number of colors against
> max_num_colors (which is ARRAY_SIZE of the colors array).  This
> incorrectly rejects input that would exactly fill the array.
>
> For example, with NR_LLC_COLORS=16, specifying 1 color for Xen and 15
> for dom0 would fail.
>
> Change >= to > so that exactly filling the array is permitted.
>
> Fixes: 95ef5ddf8a ("xen/arm: add Dom0 cache coloring support")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>  xen/common/llc-coloring.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
> index eb7c72b24023..30c1594dac9f 100644
> --- a/xen/common/llc-coloring.c
> +++ b/xen/common/llc-coloring.c
> @@ -78,7 +78,7 @@ static int __init parse_color_config(const char *buf, unsigned int colors[],
>  
>          if ( end >= NR_LLC_COLORS || start > end ||
>               (end - start) >= (UINT_MAX - *num_colors) ||
> -             (*num_colors + (end - start + 1)) >= max_num_colors )
> +             (*num_colors + (end - start + 1)) > max_num_colors )
>              return -EINVAL;
>  
>          /* Colors are range checked in check_colors() */

This boundary was changed by
https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=cba8a584de171c8c4510709c2edc9f1cf86b21ab
because it was off-by-one.

Are you saying that the analysis in that patch was wrong?

~Andrew

