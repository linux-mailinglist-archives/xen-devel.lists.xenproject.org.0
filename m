Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AL29OV4xEGoaUwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 12:35:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A885B2375
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 12:35:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316613.1586002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQNDa-00083k-Ko; Fri, 22 May 2026 10:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316613.1586002; Fri, 22 May 2026 10:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQNDa-00081K-Hj; Fri, 22 May 2026 10:35:02 +0000
Received: by outflank-mailman (input) for mailman id 1316613;
 Fri, 22 May 2026 10:35:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wQNDZ-000811-Bg
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 10:35:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQNDY-006tj2-Na
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 12:35:00 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a103152-2eae-0a2a0a5409dd-0a2a4502bc28-10
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:35:00 +0200
Received: from [40.107.208.68]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a103152-af86-0a2a45020019-286bd044f860-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:35:00 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BN8PR03MB5011.namprd03.prod.outlook.com (2603:10b6:408:7d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 10:34:57 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 10:34:56 +0000
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
 b=XlZolCsm5H0M17Zkl5kncQJ+2wYigUApxB0MjWE9pT6AG7eJ2O4uPojfNMTxaLb8ABoJwvmaCHfEKHhm7GOPBdmj1Hsw+Menwy0ZdmU5h2DEK/Lqhwa9DVWEfCyspoRd0FFhVR00wRooCadjSAYhP/KV+HybexZ+itRGG4UlZXnV8K2SOlLJqxpGZD+dKOMJ9G+xK5hcwOX5PYA+Cl3Clyr70J92j5XQSD/npfloax4yW/dAbgwRQA8yLP6IX2gFeBMWyz3hBbetmPTyO05vuijmAhHKbeGv6Hqsxp6S/mAMdZvPItCccuCcS1nNqQXBd0oopMbEANXy1eYCJcWp+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWP7YJdPS/j1ixt+uSE+Q6zmysZRvpfTfVl0bXO7ULg=;
 b=GtbCJk6QNStJ33492JPj8a1kaPgpRVpbXV+B2k6CFUQPNSj3+C76OxrIJQ4NlWD2qgcJS4QJyowwnJ5vrPc0coWSSIFx1E4Akawfd6DKXvwlcXd8Ng/Wee5x10wx/TmFTERq1NGGkwTc0aEpka3R8/qTtkgBG8HR228VmAeumGgbI76t447SfYYobGZZffMkscsFufCzwrFUMR4qMDNMVli6p7/vveAnB3xZ5Idn3s4x/doymO3UHXWXf9qlmcOHGEK5/Da3ZzXRyXfta3ZCBMA7dm+dArkraauQ7AfcQIO7GpEskm3VDmpd2VPtCo0HRFckAlb/YLat//wVv/mOkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWP7YJdPS/j1ixt+uSE+Q6zmysZRvpfTfVl0bXO7ULg=;
 b=poNMCR273Uj0uw2xZdfGxcns/ESQ7/HT+DP9fiLDLrv+hzirUmonL66J+8KKWzhwRFhUMCx2RKpj/1169sXF+Fw1wYuUqSHHoyMTa4D/Zg4KtYaaMpEvKRDwiALdqNC536wg//oLmezVVSJBR0AzctshZPVxTtZSXrdO28SgX5o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 22 May 2026 12:34:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 1/2] x86/mm: address Misra C:2012 rule 16.2
Message-ID: <ahAxToaWG6lccA9S@macbook.local>
References: <e3cdf68f-122a-4a41-a72c-8e6ed857b282@suse.com>
 <ddecaf67-a167-4a1e-8674-20284f6f02b3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ddecaf67-a167-4a1e-8674-20284f6f02b3@suse.com>
X-ClientProxiedBy: BN9PR03CA0071.namprd03.prod.outlook.com
 (2603:10b6:408:fc::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BN8PR03MB5011:EE_
X-MS-Office365-Filtering-Correlation-Id: 1de76ffb-c024-4df5-b35f-08deb7edc467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|4143699003|11063799006|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	feZJON4uDKf/1kGOuLUiOnT7EC0vpggwITm9SlA13qEfq2X8zxhpMFVnpiFOjbpg/EsbrtAC5wNi8tmOPjsZHbXxI0QNVZtJ/jOi8CVaJlhVPyfEWgmmvu3+Yygz0DroGlKjBi+x/JF848x1wmPmeeL69azxFK4piLw0kkxCpsGE/50acFpjAfcRc3usSosFyhTkvEqCJNiFCKct2EVzgCtKzYNXAeEm3hLWQxwiC8UVjGbumXDf6EDuGbV+vK5Ixf6wkELoIkq4MQm/BzMUIwR8hEEQEl/EtXnE3YbViJvQK4WJkNVh3UXhVMWnOAfWmCuMgEDxVWk9xChoQMbQq4F7U9H6e//8Nrcbi85GUs73HNVXwPCB/ENZIQCT5Zxug4gPUcmSVGhJzLP/taJBnw5ylu0HnAsSo+hkwpgiJjrbHq+A6mHeLxma7hRY/A8s2h4yAjK672OFUBW+xvjom2tZWlaKVqGcT7DCLmF7Iwfd5e4qQzCbVDHZ35aqKJKzKCHc0D1gqkEFb2wBZdzUAJwKau5MmFyJww53vfAx5fli/1dhQrVqWKvQF0s7tfL9yZrfvsHWE3T3IjLhNyvn6cIebm3MGCwrycO5vhlXh5gIZ07NRwxGplz0Nh1ISdPnt6idXDQSaGs4sbXBYHUDw/FhsMCkI6YCIJf+v0GrZmtE6Gra44COuPwu0b5jwwWe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4143699003)(11063799006)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDZyYlFmLzFBaVhzOFZsejJkQS8yS1k0K1JSYmVSNzNqR2U2ZEpUY012c1RM?=
 =?utf-8?B?VzZ3ZWIzTW9tWFdRTnZIS3dGVzZ0dysvNFQ0dXI0WWdOdTQ4dkFGWFI0WjJq?=
 =?utf-8?B?a2tkVndabU1UVzhFRkVqQkxOVXdhQW1LOVBJcE9Obm4zaThRbkNKTmc1VG1R?=
 =?utf-8?B?Wmd5WDFhUXdnWUJvT0VvWmZ3elQ1RDB1MXZOKytsN05jYm9BaDlvM0NpTGo5?=
 =?utf-8?B?YnUzclFLa2E3aHVFdTE0Szl3TUsrNFg5dTJ3NmxaR2tPVjloVCtXZ2IwTVFQ?=
 =?utf-8?B?WkFxanFoN2lRMUVnZldvZUhPbloxRUlWcXdiblYyN01xQ3RLNm8xSm9XeE9V?=
 =?utf-8?B?L3pQTWRnbE1uejZreUhqZEFsM2ZGeVNDMHJOem94NE05VzBBYk0xdGswR016?=
 =?utf-8?B?M2M3eUpkOVJ5TS8xbEd1ZDN5bk9QYjNpbFJJL3hRSkJhOHUzWmdjb3QrZkFo?=
 =?utf-8?B?SG9NNjV6S2E4NTd1c1phT0IzTFFKVTBObWJVN1ZiYjZUK3lOR2NoaG5WWDFZ?=
 =?utf-8?B?cXhoS1oxUERSR1NWYnN3Wlc4eFpkQXN5bmw3dXRWTStVS0IzTy9BaVcreFZB?=
 =?utf-8?B?NUM0bHR4QVp1TWRoMkRKRDU4dDEvY3k0QVgwZjNSM29JVXUrWVIyd1ZMTmt2?=
 =?utf-8?B?V0ZHeWdIWDZuY0JBeWRBQ280Sk1wOG5ib1NXN0YzbVVIa0lhcXZhUmt5TTMv?=
 =?utf-8?B?STg2cGdWcVBYaGY2RFMwVUdleWdSMG1UaFY5eThwMGJwL05TeE5TM3NGRVJi?=
 =?utf-8?B?OURlWnVUM0tXbEhMK01lNTZDZGlCUGpNTHdqMC92NHliQjlsU2paTXpDT3kx?=
 =?utf-8?B?R0dNZWx4R0VMWi9LWWtJckY1NFoyRzNDSXh2cnRwME1pZFdiWmIxNU16OEZt?=
 =?utf-8?B?d0VjUXFRYjhES1RFWC9mRlh2d0pDUFhvdkdBenFFbVFTVVpPTDh6TE9DQXdz?=
 =?utf-8?B?bFpnMFFxREJaUWZCQmlqMlhMVWIwRHIwQnhmRzk4OWpIYUdrVUdJUUJMWjFV?=
 =?utf-8?B?eVBlaWF0WTk5dWQxYWpyRGdxUkc4V2tGRjIzYlM4RlQvTFloTFdpYU5tN3NU?=
 =?utf-8?B?Q1cwOWlGbkJzQ0lhNjRPRmhlMkM1UDZ2NEg3TUVienQvSHk4M21QdzUydUV3?=
 =?utf-8?B?czBvV05qMEhidFFBZk54SUwzc3NVdS9SUUptblg3UGJWYWVka2tERHBWaWpq?=
 =?utf-8?B?dmhldE5sS05VcTN6Tm1YVmJLTml4NDBTRFUwSi9jQzVEYlQ1RDhpOWFIdEp6?=
 =?utf-8?B?TDRuY092TmF5dWdMZjNhVGMxR3VRZURTTTJWdVdtVENtSW9KeEl6WEZ4T21P?=
 =?utf-8?B?cjhKVGI4dEoxcHM4WGNKanB2TVpxaXYyenNRRmJyTWJXRXR5OWpLWHhLbE80?=
 =?utf-8?B?QjNNZVRnbURhYStlaDVkRVNmYzRwSzVPK0cwWVFjMlB4Znh2cm9aTHhnZVlG?=
 =?utf-8?B?NXJCTFlXSksrMnRFSEZpdllPL1B4N1EwaWRoWDhxNkwxVmYvZFN5bWVDcVgw?=
 =?utf-8?B?SGxUbFBoM3NVY2hTRy96VjQ3VjlNOCtrZzQrSnJENE1vd1ZRRFQ3ZmhJVFU3?=
 =?utf-8?B?bDNkck9sRzJsQ1BWODRQajlYakp1RzJWZHFsUkZ4TEtsN0JVbmlyYjlRdm5Y?=
 =?utf-8?B?STlMWkMzZHVKT1ZEZkErUElsSnJjckJKUWFyTXZyaUU2QzNpMDVaSzBUQU1j?=
 =?utf-8?B?SEhSWDZhblRPa3RoMjl3VUNRZDV2YUlhU2NGVk9LMkp6Z09KWVNEeUN4L0pF?=
 =?utf-8?B?THIxb0Jpb1R2Y1g5S2JMV2ZXeHE1enBhaUFyL1o5MnVBa3N2ZnBXckl0TlRP?=
 =?utf-8?B?cWxsMnN2SXkrc3gyUm4ydURCR2ZxQktYak9NbDgzVDgwd3BOZTRzZ3NvZ2pW?=
 =?utf-8?B?UWpSZHJoa3ZEd0xyRWVWNkh4NnVaNVhSZmRCVG5VU2RXZVVaZC84TStXQWpH?=
 =?utf-8?B?TExUUFV5WXRlcnpUN2NoZzhxOHVjTWdLNTVVanp0MU0xOEhzTFNIUkFnekts?=
 =?utf-8?B?WERiRllkMUttUHlrY0locUgvd1Ztd09hRGx3K0lXMS85bGtreTJUTUVWaXlj?=
 =?utf-8?B?RDJXNFd2K2FaWnBaK1JwSkVCL2IwNkFKc08vT0FtVUtEL3QyTXlyWTJ4bXZW?=
 =?utf-8?B?cHJyS2VGZllHTHdBZ3c1MGVtOEJSQ2o2am5ObzkxMGt5cklvT3J5NnNGMklS?=
 =?utf-8?B?eUhGcHcvZnRDUGM2NUJRbjNIaTVFdS9TdU9LMFRSTkwyOTR6QXlFdjFNbjJw?=
 =?utf-8?B?bVRMaUZ3Ry8xSzltNmE4ZnhaNVhmbFNpcUNMeG5nN25mL1pHSmpnRy9LVDFv?=
 =?utf-8?B?NC9ReTE3TzhTNkVPYU5GaDJmTFRBRklpWE0vVkFDMUs4QXd3d2Mxdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1de76ffb-c024-4df5-b35f-08deb7edc467
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 10:34:56.5551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5NNBttgGRGtWhxues6g3c39CY715j4Q3oSvmrwm/rWXfI1AfrCLU1yX3YdkdFSrWGWfKffYMQuH636Pvxb58xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5011
X-purgate-ID: tlsNG-720697/1779446100-83D67161-BC523BFF/0/0
X-purgate-type: clean
X-purgate-size: 435
X-Spamd-Result: default: False [-0.19 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 75A885B2375
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 13, 2026 at 04:05:55PM +0200, Jan Beulich wrote:
> ... ("A switch label shall only be used when the most closely-enclosing
> compound statement is the body of a `switch' statement"). Use a form of
> fall-through instead. No difference in generated code, except for some
> line number changes.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

