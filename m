Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCgnDajjsmnyQgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:02:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE4F2751E7
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:02:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252654.1549265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iUd-00062C-Ek; Thu, 12 Mar 2026 16:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252654.1549265; Thu, 12 Mar 2026 16:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iUd-00060V-94; Thu, 12 Mar 2026 16:02:35 +0000
Received: by outflank-mailman (input) for mailman id 1252654;
 Thu, 12 Mar 2026 16:02:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cgz6=BM=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1w0iUc-0005ca-0u
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 16:02:34 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e08f32ee-1e2c-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Mar 2026 17:02:32 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH3PR03MB7460.namprd03.prod.outlook.com (2603:10b6:610:199::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.13; Thu, 12 Mar
 2026 16:02:27 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 16:02:27 +0000
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
X-Inumbo-ID: e08f32ee-1e2c-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=efVoAg7JBhQUjeJqDsTUI2bpaXF1ZKRT2L4S6WyIUZHODOAikbAJVL6L15xDI3yV86Bd8TjfJxzJQRCyfSIzGzRSANnbjxh/wh7Elg0/5e4XgE4pXrygGdj08K0vJmbxomWI6IUvENLRuM0wrwN7eME0d+s6O54jCK+B4SCftl8J+0+z1qYmDt47eCLGeRp5jGPy8KCF1GSTekDxoMhssL52OTIEY8btxC7HZbbVpd9muws1IoQYAQP9TzF0g5i6qjLr1upHPHepXwztJlsy9kt/epBecy690fUW59emsX3Oy4w51EiMEsia2+AZNh5CZAMvSiqYBtLYVC30w0rRJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BB7gtCRowD6Dq30amHt+wgRUOuqwYw33JUSa5zOhmN0=;
 b=h7qncnbnrFV0g9kDh+owHBRcLo6ug5cywb7L4249v5zOVSsA35ZneDOuqu5JwfQT/tkXZ31jles5chSF/9R+VJUKKRVHR1WjOr51c2/dcuD8G1wvZjW/1Vbr229W9W10OVpVTGanfuC8sLxQNQ/Si2G+g656lDMCEluBpKqjVsQFjlIXXfNxTUFHwAsxES69zORUBf9JBrIhmpgsiAMxUNYkjjKVnxOBoeAdiQ6jjdaMVYf+vfIWSprvZzgbjekzEpVqhVPV8y2GrYp99/iKQJzW7kkGSR3tWhO0l28+BvH04CDdIrBFym2LeWRaYgLq84vgFnId7+YcbJsT96qRFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BB7gtCRowD6Dq30amHt+wgRUOuqwYw33JUSa5zOhmN0=;
 b=W9DkMQADLYVTt4CRbeGmPiTX9BB3U5Q0e75OHvAsnRs9sR32XTtDwd3ujcnUp9OHAmiweRwDnPL13zz0qroEmW0zEucs/faJ/ns6OO3LDMegyZwqWU/pANS17veCuXimAY5Gs4SeAGuP6OWn4QoMU/k0Gk3xpEVU1+oPF6JyMVM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5dc86501-dd23-494b-ad40-ee59aab3dabe@citrix.com>
Date: Thu, 12 Mar 2026 16:02:24 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 0/8] tools/xs-clients: add some man pages and fixes
To: xen-devel@lists.xenproject.org
References: <20260312155102.2862824-1-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260312155102.2862824-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0536.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH3PR03MB7460:EE_
X-MS-Office365-Filtering-Correlation-Id: 2950c126-9bc2-42da-9d55-08de8050c1dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	BvQ2Z0uKTVddXPP2vJaGjah7jj9St3C1xiXkpPHIFlm40oR7q3XKGVAvb+0euTyHfYEVvDuqZC/y4WaqGc3k00QWYho1ITcGyL1KsXtt3yZLtQFrK11zKZtQCr6tXfJA/96HCbT5Fh0E22KrhXs7giGIYMgjTw/Mo5AERyWO09bqGvR9I683P/+Ex6GZ/AW2sJiCwCdoV+8wUhSmPR6TtcrJqbttn5BFs+eRtaSxSswCsAvjzXvDK0ztKu+NMmSBdgImN8PHmNOzqrV6o0nozFIops87bXKa7Wnj7NeoRDci1YS8Gsuoc8evqQq/JNB6jX8kqyo2kdD3TbkGZkRhDWesQgnRcj6yNvbkmGLbR+xUJFetE+TqTNmbtRd+5W+tq/PSxmKpzzQWrY8AtZj34NGhbIOV5Fwye4N/RbnJA3Z1cXkQUfG3M+r0PXAcCemAjjZ37q8QhQOYgagalxo4jZL3889qYprBTYfcmpQ+xTpBppdZCqms0k+Xyh0mnwj8/O04RDJ9y4dO6zaDH6WNSBq+EyeD9/o2gahKJ+5sgoeDVng/C+lUik/7WVaHNW9EEum5RL8ZpCxkAgWeoeS+LjTI25q1zBlix+YMcBYspiTTChbyKAeuqi+/NI/F9kQC/XdB9+MKWMnqTVPEfanw/7q9A/1ppXAC7/wuZinOh2F7pTOzZzhEGxwyRGntIOTI+nxeUEEX2IZin+J1eHQMUCk0RmSIr1N19GfFbn6bSEM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VS94Zmc4dnludzlzWUpPSjZUSDErNTVHZVhoVHJNRXkwQzhENGhFdko0c0hY?=
 =?utf-8?B?N3h4RUEzVkFGNFpOUTVvcjd3cmZCZkJwRUtrZlVQbk4wQkZ6aTBvUTN3OXVU?=
 =?utf-8?B?RUIweXQ2ekoyMG9Fb2ZuenFVTlZVYXBsM1BHMGloa2h6eWxhdzdHQXpOR0xN?=
 =?utf-8?B?QTUvNHpTajRaY1lKb1N0Wk5ST3l5MEdaS1p0YlAyMWMzWWhlVU5MMm1SVzB1?=
 =?utf-8?B?V200UWxQVVdoa3J5cFJFR0FQUUNuMTNUeC9xK0thSG5va2QzOVliSnc5eEJs?=
 =?utf-8?B?NjMzeHFaOTdETXZ4VGJwejUrOWU5Z2ErRzRNc2d4ZDh3eXdvQzZtc0UzR3dD?=
 =?utf-8?B?aTdCWndpVGxOL2JpdnlpTE1VdHlXZVhHWDlaRjhzWlF1QnZ2MjZNQzZEL0xj?=
 =?utf-8?B?Sml1N1ZaU1psb1BBR3ZXOXFNdjBKY2FFM1NqdFQ4dkNjYk42MUZFeU1RNjJ1?=
 =?utf-8?B?bVd4MmJoUFd1NVVDcTgrdGcxRGVxVStJTVZhK1BMZTltc0VjUjVpUEI3UUxr?=
 =?utf-8?B?a3ZIbGNIcVdhTnhnL2pka21QdmNMTnh0U0xzUk5uSEFPdE04OFd3NFdTMDdU?=
 =?utf-8?B?VXNwdmk3K0RobEZiSVk4dGJUZFNQRm5udmhzMURsWVlmYkdDMFZJdUhwOHNs?=
 =?utf-8?B?bHFsMWJLZ1h2ejR6M1VXWWJYTTJhMDlIdVhFQlgrTjhNVWFEYURQSXRTSFZR?=
 =?utf-8?B?eWJpUHhWVXMzWkQ4a3gzeEN6Y0M3MTYzRVVYMEc0b1IvbFE0WDFQSERIU21r?=
 =?utf-8?B?U1c0Y1E2NllGS0NSY0Z5aG81L0h0VlFjUnhORkVQUDRpQzBHL2tMbEE1U1kr?=
 =?utf-8?B?YkJocVhzVDFna0psTllQeHdlaGN2Z1prUTVYcU9KR3JhTE5ISXE3NWV0Z0dZ?=
 =?utf-8?B?anVIZm16OEIyb1hheDF3RG5wSENTR2x6YWlhU2Z1UktYcWdtdHJaaHdqRWpT?=
 =?utf-8?B?ZzNTeWRNbXMvRXRoU2gycUQ5YXZkOFlZYXNqZ1JjZGdGQ3BNVWxZaERHd05G?=
 =?utf-8?B?aVMvalNoTFhKeTRFd3NjUVNvT3QvWEYycXB5UDdiN3RNOXRLSjdUUDBuaW4r?=
 =?utf-8?B?eUNKeXpqN3BWbFRuS2VyNmJuenFkQi9nWEZJSGMybGpUMFpRL2YzOGVIQUd5?=
 =?utf-8?B?VTh1MWZWcnI4TDduTFZvUlBQcTc4MTBYUmNxcVREL0JPbC93Zm85MHBoWHpZ?=
 =?utf-8?B?TmhqZmRvbUlDenVOV08wbWR2Vkh6Z0lSSGxmMWpXWDRWSFdDZGk2Q3BaaVlE?=
 =?utf-8?B?eFBlN1BPZlV3YkNiTTFFR09aOHJrbVRDaGg1eVV4RDJBWnJ2dzF0Rmo3VSto?=
 =?utf-8?B?bE5sZTdRZE1HeldxWGpocE55SHpGS2dIa0dLNWJRZmszS2xWSXhSQ2ZTS0No?=
 =?utf-8?B?K0R1VzZTYWlQSTlKWXl1TndmZVZuM0EwTllnb2YwZEQ1bHBaazRNZEFEZ1F6?=
 =?utf-8?B?RHJSbTlFT0lVeGlzUjNLaTR3ekxaekk2S2VhTFREcm1lYWQ0NzRmZmtmVjhY?=
 =?utf-8?B?K1RPSm45eU9vdEl2azRLYU81TWpIcThsQlhKTWZlYlBON0JvaHVnTzh3T1NY?=
 =?utf-8?B?dk5WVG1EV3FPQk8xcXppZ2p5U093R0pOZXI1WmNMdlQvK0NYSTViNVZvUTNB?=
 =?utf-8?B?aW9VempqOFRVSzhCbXk3azM1bTZxcnJYaUR0SVoxTnFKcVlZc3ZGZHR6bkgw?=
 =?utf-8?B?Tm84RUVFRUkySTFwTGV2U2J3L0tvdkxVREZFSTZaQUU0Q281TTQ2RW92ZVdp?=
 =?utf-8?B?K0xXeHpYSGZMWmtSYnB4VDAySnc3RkFJTU5EbmlSUCt5T0ZKNXpNOGNDSVRG?=
 =?utf-8?B?V3ZVVlRhclBWWldoK1J1cDVqZ25Xd04vRXZBNnN4R1c2YVFmTzNhbitHL0RL?=
 =?utf-8?B?QjBsZnU0MFBpbWxJamlObTRnOTVCZVJickErUHdBbEpKTW5FdlBjVVZxaVJh?=
 =?utf-8?B?TGp2SkRVSEc0QzZNQndMMDBlczB4cWorc3JDLzJCZ0FZcHBQUmdReVBPOEI1?=
 =?utf-8?B?ekgzdWpoWElsSTkweDZ1eUdOeTdwWUJ0STJsWGpXWEFDbmFDc0dtMG5DbEd4?=
 =?utf-8?B?d1VJZGFBaE9HYVE1MDZ6RjVBckZBNldYVExhT2psOHFEdktweHQvdVQzaEI3?=
 =?utf-8?B?aFZ2MjUxSXV2aFhRR0hLWEhqT1ZQZC91UjN3Z3JTbk1tNUlHTjBPbnZkdHVR?=
 =?utf-8?B?V2oxdjQyYWhpU3RkeE5oVkp4dmJXSnM3RTFYT1BjYzVobjlzMXFpZllwNVVr?=
 =?utf-8?B?KzJoUXhEQ2ZFcDRrNmU5MVB2T1pkN0w1TG5XdEx0Z0xZVEZ5SUZhUWhqM2xx?=
 =?utf-8?B?QjRvZFV6emg5bnQ1cEgxMW40NlIxdkcyL1NYT0tTdm9wSHNaNERTM2hOeXpT?=
 =?utf-8?Q?UK8+PVEdqzsaOeNI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2950c126-9bc2-42da-9d55-08de8050c1dc
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 16:02:27.3399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DpHVJddxzkYuWU4cX33OPZ0r1vz5VRk0IRKrRyrx9y8Av8tsJ1kcdJkaA6VFGz7OMSmoMOtVCMQB8//uMEmCVrP/GbGO+VYlomoAcQQOvo4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7460
X-Spamd-Result: default: False [-2.18 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid]
X-Rspamd-Queue-Id: 9FE4F2751E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12/03/2026 3:50 pm, Juergen Gross wrote:
> Juergen Gross (8):
>   docs: add -h parameter description to xenstore-* man pages
>   docs: add man page for xenstore-exists
>   docs: add man page for xenstore-list
>   docs: add man page for xenstore-rm
>   docs: add man page for xenstore-watch
>   tools/xs-clients: don't exit with error when using -h parameter
>   tools/xs-clients: fix usage information of xenstore-exists
>   tools/xs-clients: fix output of "xenstore-list -p /"

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Two minor comments, both of which I can fix on commit if you're happy? 
(With the patch 6 knock-on to patch 7).

~Andrew

