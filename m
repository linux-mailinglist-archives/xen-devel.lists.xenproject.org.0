Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JSdOEcZ8IWowHQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 15:25:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2E86404BF
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 15:25:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=yeuGvXZo;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327830.1592555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV84T-00057G-Go; Thu, 04 Jun 2026 13:25:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327830.1592555; Thu, 04 Jun 2026 13:25:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV84T-00055r-DN; Thu, 04 Jun 2026 13:25:17 +0000
Received: by outflank-mailman (input) for mailman id 1327830;
 Thu, 04 Jun 2026 13:25:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wV84R-00055j-JP
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 13:25:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV84Q-001bbu-WA
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 15:25:15 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a217cb8-2eae-0a2a0a5409dd-0a2a4503c20c-4
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 15:25:14 +0200
Received: from [40.93.194.68]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a217cb9-672d-0a2a45030019-285dc2447010-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 15:25:14 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM4PR03MB6032.namprd03.prod.outlook.com (2603:10b6:5:393::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 4 Jun 2026
 13:25:11 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.007; Thu, 4 Jun 2026
 13:25:11 +0000
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
 b=jmaahrUb9B/52iTEJxuvcViuwFPyiceS8zhELacVxCXy0gDCFIrVqCHM/QrmSjMi+bcThBE6rKlKHivmgXAC45agPfit/A/GSyon7lkGcyQhFDvZfVa1bo0/8MMQ0hFXlw7CL4SNAx7SxlkM+08+yLMee3OLZ67ftKc3sP8Mi35zmC/tGVZvhgSmPyLewHcygyjSrT4CtDHfLy4k2wMYAIX6aNnN7jY6/KI5JZb9QsL5s1Llu/e3b0tzJ6K7xM9pHmfYcVJCzXRq3+Jv4m3370WPld1OaA30kL9+iRDu3nto/EIPO7ov1ldjbHd6PT+7c21/CyuVwcszxUAqpS740g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZniSIW/Rc1/xhhcMTqlySiploY+OrdH6XCa8i6J2iGk=;
 b=tq+/hWq/xAYDHLTm/AEK+70MTWGxp4Z1/YAC4XtRnXxpnwnL6uVKfH5DWk3eqLxqR9GXw9Mf8FTQTCFF3NXkwuPGl42SBiutAScRwDTrUKTqTiyxDs+4V9VO4r98Pc5Xwp8ASB09e/JORbhRVuosWKnMNeLBT4+KVX0XB0uJbV/gCk5e8okllUolFsydkQqiR3YQFTPai8f8JZC+Xp2YOetgxGAQ7yJG90/e+E0JOPyFd4IdDyPA9RwA/QBaoRIGOip8RJ+jBAMitoME9yB7i3w28QtZdQaeF3VnmDHPKVFlUW/xBsCzOtRZQSwYxLJsuijI8e9UwYE/ju4HIwgdgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZniSIW/Rc1/xhhcMTqlySiploY+OrdH6XCa8i6J2iGk=;
 b=yeuGvXZo+5L/Wt5/1WZIpNx5zd5eQBtSGmDz59RbVXVit4nzMS76S+igAGmqPqYxgY7j2wvcrKolAMIG8s9PwUhSfmWLBoKe6D7q4Om0bIzrlphpeqKBRjsFyHVQXSZbskAgn70t2S0HoNRx00X0CXYWWnx16Z4NRhC2EXpa0jA=
Date: Thu, 4 Jun 2026 15:25:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] CI: Remove .cirrus.yml now that CirrusCI has shut down
Message-ID: <aiF8tBNVsqRa3oti@macbook.local>
References: <20260604125530.2718761-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260604125530.2718761-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MA3P292CA0067.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM4PR03MB6032:EE_
X-MS-Office365-Filtering-Correlation-Id: 0714810d-e136-440d-d2d8-08dec23cb473
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	CX9xZmN27uErCohoTj4Oi7k4rIJckVQSbxONQc0vivEKfW0Q5zmj021UNigbFcHstvdYRpa2EWB3mRftDUmkKRk3TArsp/OUIXWV2vSbZTm0S3yFoP1tOfi+rl2VQOMHEfA30WmCxKD/9moGKTzEiuMceeH0Nza/DnOOLHmZg5aUw2UNDQTsfCzyVQ5gMh5dbGy+o8UgyDTrn1ofnw8MSuFSLZrk23DaPQAEWH2JRKwyw0ZGk9J2bqgZbdUB+fvHrevwGPPhBpCWXSMe/rdv+YGWqSldxDiiCJVHSvx7h2e0OQqAV19b6oGFUNm/3nFtpOEQx6ceJe9jj/+B/LWeOoPPvW0gunN61DdXIsTH3fG5oSqRhMy8DOcuwAX1T8J7JTiCtllT6oLaxTA7YFgMIQQ4yXSc1NJ8RAoRMyoekn1D8Qf0+QANtts+DFc7YjGGb5uNkg+5YnWiki4w9d20ZZGdO7PAX8tuLycY5IRreXbxY/xfM/lHEm2p1i/+Nh39slVGwjWEKrlpKK2hHDGNzpcdcigVgDp+Derres6NcWGEATxZ3aBZePyAWQbW2+bKUh3rQrBYQ5m3v5jZBfxijhxO8txUzuDOR6C5a1KSf0xhQMmrA+tj+pm+0AFI69GVaofqzcod/Uzz7OfOmenbEmXa8vFoU67epsOxktsZdfZ4lO9NWs/MrfzRFGCcExMN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1RrT1BlLzE4WkN1ZDJJS21CSUF2a2hCOTlNZS95OUdRdXlRVVI1eHhhMEVK?=
 =?utf-8?B?dEh1Sm1Ra3EzKzEweE9KSFd4TzkwUkN4YkxhNUhDMkZjeHhwTUIxUlArV2J3?=
 =?utf-8?B?QU44MVpTQzlBUSsyc2tSK2N2SHJsdHFydGQvd05iUHJ1YVJPNFgrN1VWaDZk?=
 =?utf-8?B?SXVVT1ZQekhmQ0Ftb1crdDk0M2xKYTZyRFFiZHB0TnVYeWtZSVRVM2Z3Qnow?=
 =?utf-8?B?dTg4WFlseGJ3b3pKaWZqWnM4RmhOU3hvS3cyZFQydmFDZVY4clgweGdMSUdX?=
 =?utf-8?B?QkhsZ2Z3SjNrUjRMUUphMGlhM2pMY05jK0w5QkhaNVJ5YjBiZWVxTU85S2Z6?=
 =?utf-8?B?MmVUOStHWUJwK0pybU5NK1dpR2hJdnByRm5sL1dnSndDekhJelVaVWZmWmVy?=
 =?utf-8?B?TU5pOGxlK2JyTERrNlI1U1RWMUJCNXl3M0RUT1pSMUtZbFlwRk0xMWZONXpk?=
 =?utf-8?B?eXo1MXdIbFNWbVNDaEZRVTRkd3FYOTV6QTBSd2NuYXpCNHVCZFhOSERzMU9j?=
 =?utf-8?B?YTVJdWR1bTBTWWIzYXFoVUliN3VobHovQnY0NSszNmtpdG52bDRid2p1L01Y?=
 =?utf-8?B?Zk1xVWN4MnZGQmM3SlNBeVV3WlI5WGJla2ZPQi9JVjAzSjMveFVrYW94QmtJ?=
 =?utf-8?B?YVd6eTdnMG1oM0FKSkFJM2VhL3BsdEExUVA1K2VYdTFlaTlSSi9tdm84Rm5m?=
 =?utf-8?B?ZUhaTWNtdUxQckg3UTRkbWpHdHNBUng4NWIxaWg3dWYwSUlvNFNDWkxQNnVH?=
 =?utf-8?B?eG5xMVRFWmVOQitiQ1daWnhXR1R3YWRXSjh3RDFCanZJTk92UEE5TGFxb2Zy?=
 =?utf-8?B?UjhNcjJXRUdVSkhHaVU1TWNyOGttNUcxdHpOdXkrKzI0OG42TGR5OUk5ZWxs?=
 =?utf-8?B?MHRPclEvT3pVNGE1RjUzZ3FJT3hXS0FLWnRNbElCazBWTVd1QS9lbysycHkx?=
 =?utf-8?B?K1kySmNNSXVyL2FGdmxNM0xQdDUzS2xKczFrTzJpTzVPczZ6R2Q2NDd3RjUr?=
 =?utf-8?B?ako0UE0xbVViZVc1aUM3K2RXTVdOZU5qYWxhNTNLaVN3NTZSS25SWTNXbGlF?=
 =?utf-8?B?aXpsYmZxL25UYlhkM2xnek0vQldqSjRQZ0twRW1TNDZuM3E4WEY1SlU2dktM?=
 =?utf-8?B?NTRkNUtXOUtDTjd2L2tzeldkbllPamkrV2c3dFJnUWNWWVlnRnhxTW9XNlRM?=
 =?utf-8?B?VXRUVUVYVmxOUUlKWUMwaXBHYktrc2E1QnNYdUZwVG9LQm1zQUNXUUdiajBB?=
 =?utf-8?B?Q2JacG5EVG0xZUdMTDVTeUpLYlZ2UVR3Z2NNRk4zUUYxZFA1VktVVWhSV3JM?=
 =?utf-8?B?MzYyOHd3TWZLOGdIYTNYY0ZvQTYvQlQ3U0V1dU9lQTlmOVRvSnhISSt2NDdB?=
 =?utf-8?B?b3BheEpremUwRXVkV1hlLzMrcWVEb3ExZGc0SEJWUUxRbnorZWRqZXVvSXhQ?=
 =?utf-8?B?M3paT2xMc3lVZ3J2OWJkQ1FiYXc1cW9VdDBLcG90UnNGS0JqVVRnMTZ2ZnJv?=
 =?utf-8?B?bkFoeHFXMEd4MWNOWThadzg4RUVwTS9CZ3ZZd0pDbEVHMk5YdlNKanlSRk9V?=
 =?utf-8?B?Unp2cEgzWHBjUTVRNktVTmU0NWdBTk5aQ01tZ0RQZml3OG5zZEJtbERPakw5?=
 =?utf-8?B?bkxaME5Qd0ZET1M2aHl2QUJ3S085RjFRbzJCOGw5SERDaG50RjhLMjFsZVJP?=
 =?utf-8?B?Tm1yZDJSVGhlTEZ3eWxrd1FQRWJXOXZDbE5zN1g0c1Q2S2tBTVRmeDM4RmZX?=
 =?utf-8?B?Tzlwc1hUamgzUVh2OGYwdjQzQ0hZYTZzZmtyVFh1RlJHZkMwS0FZQ3Z2b2RH?=
 =?utf-8?B?Znp3d3pTUExuV2NvL21RejJ4Y0h2V01tbVhtS0thbXkxTnhXVGlUV2JDeita?=
 =?utf-8?B?eVRSMlkvOVBpVjlmbVZLVm5lclN4c2hGVmE0VWZaNjFTRVpBTXZHbzlqS0Ju?=
 =?utf-8?B?V0U3WGFqZTRJZERPUjRjcC9nL0hDNTZDeXdseDQyeUpIZDdYTThHM0hPeGx6?=
 =?utf-8?B?WUJ1ZnlGVTRZTXlFUTM1R1dyS0MyRnVSd3BkeXdHZDhCekd3WUtOYWdic0F3?=
 =?utf-8?B?SjVQUVFKSXpOWEEzWmcwbGcxa0xEWjg0SmkvRkVCZUhndEk3RWFIdDFVZW1n?=
 =?utf-8?B?OHpkVVIxSmtvNWoyTHR2dTNRT0NPbWgycjBsREphQ2d2MDVKVGxnWG80c1Vw?=
 =?utf-8?B?dnFVMWE3bTNGSlpQZ3I4ZDN3US84a1UzaW5FczNKQ0V2Y1UxNjQ3R09Kc3do?=
 =?utf-8?B?S3Z4V2dHVFMwbngrcU5uOW5oV2lPcUtUOVdjaXVQejU4N0ZVYWtSMUpMYWFa?=
 =?utf-8?B?ZndJNkkwWEN5Z0F6aDBOTTZkWnRDRVpaWXpYU1NMNSt4bnhjNjVIZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0714810d-e136-440d-d2d8-08dec23cb473
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 13:25:11.5652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oj98Pnaj9MSDdf4/1jqlXWNUeWg/ALJ9hqW6rQB6Xt4N9ngmN4JtorPY/Ptct8dp82Gt8122SYcYGIrKhkHB4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6032
X-purgate-ID: tlsNG-33051d/1780579514-37B4C938-7270A5D5/0/0
X-purgate-type: clean
X-purgate-size: 211
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
	FREEMAIL_CC(0.00)[lists.xenproject.org,vates.tech,kernel.org,amd.com,cardoe.com,gmail.com];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D2E86404BF

On Thu, Jun 04, 2026 at 01:55:30PM +0100, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

What a loss.

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

