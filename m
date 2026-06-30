Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IIJuC52CQ2qGZgoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 10:47:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5842D6E1CBD
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 10:47:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=BbSUntyw;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1348524.1606261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weU7Z-0003lY-KC; Tue, 30 Jun 2026 08:47:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348524.1606261; Tue, 30 Jun 2026 08:47:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weU7Z-0003im-Gi; Tue, 30 Jun 2026 08:47:09 +0000
Received: by outflank-mailman (input) for mailman id 1348524;
 Tue, 30 Jun 2026 08:47:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1weU7Y-0003ig-5A
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 08:47:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weU7X-00GjtI-5K
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 10:47:07 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a438276-bab6-0a2a0a5309dd-0a2a4506a6d0-42
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 10:47:07 +0200
Received: from [40.93.201.69]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a438288-08de-0a2a45060019-285dc9452dd9-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 10:47:05 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM4PR03MB5999.namprd03.prod.outlook.com (2603:10b6:5:38a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Tue, 30 Jun
 2026 08:47:02 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 08:47:02 +0000
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
 b=FKMxC3PeWlgBRY1BDeevT21SzhFQls4BmeCXKxTEZ/+KQ2kSxN5bLXEnXdU3e5O5BzeXiIxEMhBMOkqjaxe+2ywUKg8JkfMhaNUQ0iB/e27A8OfdbhZtAO8dd5zmj1Yx4Xze4jY/Zv3TG6IuBu3UsrKt6a8dtL/Q07NrXM4ttmCiGEIqcmH8xTlFm7KvsCfWaX1dcgjXcMvH6sJfu8SlJjfOKjLSltFhUJfSgL1ohuyvkBe+v6mm8DdBHcNKoP1fosYveollX/J5uM/yAcHW9vPP6pDonTzY0+XPCVN0xl+WQFwHWh7hVzUuWuaowGQb6HyiP/yKf+zOBnQ26bhQuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FaE5M2G91RJ95ssCnBMS17pK7bJH4/CmqQFkfQik4M=;
 b=aCwKea0C+wS3wJhhealzXprNql8e4qEqMsOvcbfmt9lJQ2PZyoB8F0i8u3TGlxK+EC8LZX+xVfD38M3dUQpofq+d6PNc6B5cD/xf4X9HbXaowzC2shhx8hPsmWUl3chE3tIyIJ58SwswX2m7ldklMRWo9w5tnaXPopM8TKL6IFBS0p6taSc1fSc65ge9jzxB65MaU5notILsXYUD97cG41tHMfKHo1PkFDksVg7nYCLnGqAQog7GOyFzzzwl/NW/1S5gGYw/5ez6nj5iYObODnPTF5LFYokipEHCl0jlh5wnwVu6geNR/ejUz3OaxYoA0C/Q5j4X7HXUo366oNDG8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FaE5M2G91RJ95ssCnBMS17pK7bJH4/CmqQFkfQik4M=;
 b=BbSUntywwmLRhdEvGix72VF/DHI4rHBikYN1zHkgBog0hZL0RkgpIbt9EbVgD4H5G/fsriQ+7oVGWiy911qEXg2yW/Wp9Ug8tDKDEqhgJal/8JaD7+vCpFKwiHUtibd2ijqMDrh3XAX0PrMaakm2wNcnjh1d9mglytEJI9/ZkBk=
Date: Tue, 30 Jun 2026 10:46:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ryo Takakura <takakura@valinux.co.jp>
Cc: xen-devel@lists.xenproject.org, ross.lagerwall@citrix.com,
	sstabellini@kernel.org, julien@xen.org, bertrand.marquis@arm.com,
	michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com, anthony.perard@vates.tech,
	jbeulich@suse.com, taka@valinux.co.jp, den@valinux.co.jp
Subject: Re: [RFC] xen/arm64: livepatch: enable attaching callbacks
Message-ID: <akOCgoqbGhZbjcQx@macbook.local>
References: <20260629020128.30561-1-takakura@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260629020128.30561-1-takakura@valinux.co.jp>
X-ClientProxiedBy: MR1P264CA0103.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::28) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM4PR03MB5999:EE_
X-MS-Office365-Filtering-Correlation-Id: aeffff7b-cbf0-41d1-0629-08ded684279b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|3023799007|22082099003|18002099003|11063799006|5023799004|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	rWy22PenYSd2WQ2S2m+RSzI+Lu+/l4DlmpqVtVuqQV3KfJhf+vgaQOnXOO82t6jZJmCtGkOkXv4P0I7zjIdI/XenzAEof3HghcrWJ/QuOyFJhYEy9LJqU+B8PkgHlSBkXuetAf0yFMQs6fXk3ekPiwSiJyslHqhZ4hys9lIHX2a/+PuSiDf0+qE1Z9G88YqFodpPPm9pnFTTz272xmtTzamdo2JSnjuKMCz3BEC0w2NTOgOZZQCHivrl44paDCl0CaKYAQWV7GmHooZ8ikiEWN3su5Rkfc3X8vsMA8zIwZR5fIgb3qaAJwdFYgAuR/GduVTUiN0SB+hhRKSpi3PshXM9JRYaeHHjGygAL7ibe4ucmiysxIbQYe6bRFNZGnQv46eG60Evno0DYkcLfjXCvbVLiX7K0ggexZWGUDtScojdfOXJwOdxje2KUWShORiUatGwdo/KDIaI6i9mm65jP+tHFMzLP26BggPqL2fayFdF3b/oO83jym6+2lhGz9JArt++ikucsGpjCXPhA7JpId6CWrVTOQfqKi68vXwGu8NAeO/S6cjDyFaB8wX/ckofShDwhV/XV2PWX35XitcNtvmWLVJ72OykFuATZ/GBcQeoZX5P0TGnMNKdasroyXVD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(3023799007)(22082099003)(18002099003)(11063799006)(5023799004)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KytLV201NkduYVIvLzF6RVAyMS9ET1lNOElMaGgyZHNjVzY2dlRCMlpxSVpT?=
 =?utf-8?B?MVZ4VktkRmZVU1Z6VENwRVdpUEQ1Q0p0R01jeCsvRlpKZzJPSTI4V3A3Tmd5?=
 =?utf-8?B?bERJcHlXY09SNDg1UXhEcmFQK0hGVFhrNHFudkxYYVA1OUVSalN5SnltQnhr?=
 =?utf-8?B?SUpGUkgyUGY1UDl6dVd1bE9WZVZ6UXhVeGlNUFliOC9kRUE1eUQ4N1l3MFFS?=
 =?utf-8?B?cVFDajR4ekF5KzEyMndEOUhqMXBiYWZxS3d1TnQzU1JlWkkvcU9ubzhyR09m?=
 =?utf-8?B?OCtTVVp4OGFrZEtVYzRYZnJRcTdZZG0vblBDRktvSkwwakozQldZakJSS08y?=
 =?utf-8?B?Y2tiQVFsQlNBRnRaSnFiZ1l6TCtPa1Y2RnVKQkdySzZpZWxKZUQwcHJMa05P?=
 =?utf-8?B?UUpPUmx6TUt6dkk1a3Z6R1hodDA0ZEhRSFd3WDRWc0lPYlN1TENBbWhhUERq?=
 =?utf-8?B?c2dRQ1gyaUVYZ0diRG44OUpSeS9UWUR3RExHU2pOdE1IQWhwWWFVdjFjbVBq?=
 =?utf-8?B?T0o3N3ZpcEZmSllLUTY0NEpSU2dObEMvcUZQYjdKSCtrYTlrRzZqNURtVEkr?=
 =?utf-8?B?aE5janhoa3p3MnFid1JqRmYrV3JETnpkVGRzc3dwanhNTzJLeXhMeVcxUDZY?=
 =?utf-8?B?OEFFUnlvcVZIazVEMjhId2M2V0tDck41cmJBdklLeVJNdUdRS29ubXVNeXRt?=
 =?utf-8?B?bTB2WUhlTWlrbmFIUkIveHB6L1p2dnNhVHhrcWVNY1lKNUxyc2UwSUh0THM1?=
 =?utf-8?B?eVVyTU16eGlGTkhWbEEzM1p1Y0ljdTlnd00yc2hGUkpBdzZFL2NBQTJFbzR4?=
 =?utf-8?B?d1BjTlNTczg2c0E0d2hCVXNwZjRndXE1c05jYnUrSnFSZFg3R0s5dVR0bGRz?=
 =?utf-8?B?QlZuaVFJS1I2bWdKaFJsKzRNL3NCcmpQZjFnL2hGRFhpY3l3cCtDQ3llcUFt?=
 =?utf-8?B?b3YrdlBreWdzWEdsNmJ5Y2Fabm1Md2taWUVQYWhzczQwMnQ2UmhKYmJQaXhW?=
 =?utf-8?B?dHNIY0pxZlFVOWJIa2JoanAzSTBhRmxIOUxoU2hucU1GOHV5d3F3dFZTbk5o?=
 =?utf-8?B?RHk2YWRKbllwcjF0ckRCcE04SXFoTmVsZzBpNEpHSWMwZlhWQ1didjJTMk1L?=
 =?utf-8?B?WDJzT3BRbTc2ZllsZEFkaGdLZGoxWmpvcGUyZVFTVWlXYlpJWUkrTldmMmhK?=
 =?utf-8?B?b2F1WXdORzlnUlBVOWNqQ25VcHdyYnFDeFlDZHV0dWV1MUpEWndodmRqZitm?=
 =?utf-8?B?UklpMXZ0ZE8zZjNhckxKZ0FZT0FGWTdnS25SdkRXb1U1MlRnQ3dXVFozTUxh?=
 =?utf-8?B?d2tKcjZOSzRhUkNBdloxOXFVTzM5cEdxTlRjZkhJWnhTanQ4ekhmY0RXYy9B?=
 =?utf-8?B?cmI4cko5dk1zeHRqcXNTZkt0Yk5SK3JlZEYrUXVTSVFQRU41clZXNXgyS1Fu?=
 =?utf-8?B?d3dIUG9qMWxuSlYrWXl2R0hHOFowd1FDOTZkQmlabmpvV3QyNlpwdkZMS1Fp?=
 =?utf-8?B?MUN3NktwMTM4akNxVkdDczNpa2JpL2FvL01UL3FrZnN6K3Q4OWk3WWVHazBq?=
 =?utf-8?B?Zm9yQnJacURkcGZ0ZVFyRmZLWHdkWE55anFaMkoxbFM5c2RBSHJLM3ZOMS9P?=
 =?utf-8?B?M1pTbjlkV2lKcDB2UU1MRG1BQ05NVG4wOVhac0UvYVRSZ0t4V0E4ZHJoZXNr?=
 =?utf-8?B?SS9ERUY1ZDhJUkNENGZQNnJITStUVDJaRnNmZGF5K1lxWm1nNzFNVHRkNjJJ?=
 =?utf-8?B?aVJYcFBnVTZoZWF3TGxxUEw3eVprNmVoVTVOTi90c1EzbFEvazJ4THJ0U25w?=
 =?utf-8?B?TENUVXROS09QV20wRWVaTmhNN3ZXbGcvRlVOVmYvcHlqOHFnK3V0WHk1YSta?=
 =?utf-8?B?VjZKZ3VwOXhvellybWlVSHZqeTlZTUE4STBBbVN2azRLSFpnSmxGamxSNDRE?=
 =?utf-8?B?WmVYQUFSVUtyK1RTV3JOcG5LSmR2d2tZcVIrZWFTRC9oVWNNWVdDUDR6Q1RR?=
 =?utf-8?B?ZGZSNEJNdlBmUWVlRTBRazRIRU45SGJDaFFmRHd2S0dDOE5tcjJXd21mTEd3?=
 =?utf-8?B?NHEvT2xqYkI2Q1NYVHdKSUlHV095RGpDS28vY3R3Ri82WHY3eCs4OHhabVQ1?=
 =?utf-8?B?cktKemRtR1M0bStIRmdGckZqdnRZUnJKdXlMd3hlRFBLT0dUdURBOHNyWWU4?=
 =?utf-8?B?RXc5NW9FRTlUeDhnbWNCdUpmeFRPaDF3cFpDSEIvSm01WXNWNThnY01lcVhr?=
 =?utf-8?B?bmh2ZTMxY09zS0xGRjVqbkxJQXNwNGUzVGUxRW1iZldjSGFERlEzSVQ5VDc1?=
 =?utf-8?B?SEhyWllXTU42ZUsrUDg2c0xObEw4a29BQUZIb1k5VGM0NDU5ZjZUQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeffff7b-cbf0-41d1-0629-08ded684279b
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 08:47:02.3456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6l3C6uZmn+038VWjDm+965VssmwEJN6nQCOhvE1LGo3FVG8DPaAZMJqwfUIE3cZrcvyvcu74s9CfBn84N7+qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5999
X-purgate-ID: tlsNG-16d1c6/1782809225-C410F68D-E8427A50/0/0
X-purgate-type: clean
X-purgate-size: 14978
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:takakura@valinux.co.jp,m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:taka@valinux.co.jp,m:den@valinux.co.jp,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5842D6E1CBD

Hello,

On Mon, Jun 29, 2026 at 11:01:28AM +0900, Ryo Takakura wrote:
> Linux ftrace allows registering callbacks which is useful
> for debugging and tracing events. On Linux, it is done by
> reserving function entry points at compile time which can
> later be patched to branch to a trampoline.
> 
> This patch implements similar callback feature, but with
> different approach using existing livepatch infrastructure.
> Instead of reserving function entry points at compile time,
> the traced function will be livepatched so that it branches
> to the trampoline.

While this is an interesting usage of the livepatch logic in new ways,
may I ask why not do as Linux and add an empty function preamble that
can be replaced at run-time with calls to hooks?

You could still re-use most of the livepatch logic for handling the
addition of the hook calls, but it would be nicer in that we won't
need to move the original function.

> The role of the trampoline(illustrated below) is to preserve
> the context while jumping to the tracer function, and return
> back to the traced function with its context restored.

Alternatively - why not use livepatch-build-tools against a build with
the added hooks to generate a proper livepatch?  This looks a bit
fragile to me (see the question from Andrew about fixing up
instruction pointer relative references).

On x86 at least we would also need to adjust the bug frames and
exception table contents, and the contents of the symbol table to
account for the function being moved.

IOW: it looks like overall this is a lot more work than possibly
reserving a function preamble to add hook calls?

> trampoline:
>     Save regs
>     Call tracer function
>     Restore regs
>     old_addr
>     return old_addr + 4
> 
> One can request the feature by setting @trampoline_buf to 1
> which will allocate a buffer for trampoline.
> 
> Signed-off-by: Ryo Takakura <takakura@valinux.co.jp>
> ---
> 
> Hi!
> 
> For the future, I'm thinking of linux-like extensions
> which help tracing and debugging by passing:
> - saved registers
> - caller information
> - private data
> - and so on ...
> 
> I would appreciate any advice or suggestion.
> Thanks!
> 
> Example payload file:
> 
> #include <xen/lib.h>
> #include <xen/livepatch.h>
> 
> static void my_tracer(void)
> {
>     printk("livepatch: do_domctl was called\n");
> }
> 
> static struct livepatch_func funcs[]
>     __attribute__((section(".livepatch.funcs"))) =
> {
>     {
>         .name = "do_domctl",
>         .old_size = 4572,
>         .new_addr = my_tracer,
>         .new_size = 32,
>         .trampoline_buf = (void *)1,
>         .version = LIVEPATCH_PAYLOAD_VERSION,
>     }
> };
> 
> Sample output:
> 
> $ tools/misc/xen-livepatch list
>  ID                                     | status     | metadata
> ----------------------------------------+------------+---------------
> trace_do_domctl                         | APPLIED    |
> $ xl vcpu-list Domain-0
> Name                                ID  VCPU   CPU State   Time(s) Affinity (Hard / Soft)
> (XEN) livepatch: do_domctl was called
> (XEN) livepatch: do_domctl was called
> (XEN) livepatch: do_domctl was called
> (XEN) livepatch: do_domctl was called
> (XEN) livepatch: do_domctl was called
> (XEN) livepatch: do_domctl was called
> (XEN) livepatch: do_domctl was called
> (XEN) livepatch: do_domctl was called
> (XEN) livepatch: do_domctl was called
> Domain-0                             0     0    1   -b-      67.7  all / all
> Domain-0                             0     1    3   -b-     457.2  all / all
> Domain-0                             0     2    2   -b-      42.4  all / all
> Domain-0                             0     3    0   r--      32.4  all / all
> 
> Sincerely,
> Ryo Takakura
> 
> ---
>  xen/arch/arm/arm64/livepatch.c      | 104 +++++++++++++++++++++++++++-
>  xen/common/livepatch.c              |  40 +++++++++--
>  xen/include/public/sysctl.h         |   3 +-
>  xen/include/xen/livepatch.h         |  13 +++-
>  xen/include/xen/livepatch_payload.h |   2 +
>  5 files changed, 150 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/livepatch.c b/xen/arch/arm/arm64/livepatch.c
> index e135bd5bf9..b7c9aba94e 100644
> --- a/xen/arch/arm/arm64/livepatch.c
> +++ b/xen/arch/arm/arm64/livepatch.c
> @@ -15,6 +15,29 @@
>  #include <asm/insn.h>
>  #include <asm/livepatch.h>
>  
> +
> +#define AARCH64_REG_SP 31
> +
> +static uint32_t aarch64_insn_gen_stp_pre(unsigned int rt,
> +                                         unsigned int rt2)
> +{
> +    return 0xa9800000 |
> +           (((-16 / 8) & 0x7f) << 15) |
> +           (rt2 << 10) |
> +           (AARCH64_REG_SP << 5) |
> +           rt;
> +}
> +
> +static uint32_t aarch64_insn_gen_ldp_post(unsigned int rt,
> +                                          unsigned int rt2)
> +{
> +    return 0xa8c00000 |
> +           (((16 / 8) & 0x7f) << 15) |
> +           (rt2 << 10) |
> +           (AARCH64_REG_SP << 5) |
> +           rt;
> +}
> +
>  void arch_livepatch_apply(const struct livepatch_func *func,
>                            struct livepatch_fstate *state)
>  {
> @@ -34,12 +57,87 @@ void arch_livepatch_apply(const struct livepatch_func *func,
>      /* Save old ones. */
>      memcpy(state->insn_buffer, func->old_addr, len);
>  
> -    if ( func->new_addr )
> +    if ( !func->new_addr )
> +    {
> +        insn = aarch64_insn_gen_nop();
> +    }
> +    else if ( func->trampoline_buf )
> +    {
> +        int rc;
> +        uint32_t *trampoline = func->trampoline_buf;
> +        uint32_t *tp = trampoline;
> +        void *orig_cont_addr = (void *)func->old_addr + len;
> +        unsigned int trampoline_code_size = len + 12 * ARCH_PATCH_INSN_SIZE;
> +        unsigned long trampoline_start = (unsigned long)trampoline & PAGE_MASK;
> +        unsigned long trampoline_end =
> +            PAGE_ALIGN((unsigned long)trampoline + trampoline_code_size);
> +
> +        /*
> +         * Make the payload text area writeable while generating
> +         * the trampoline instructions.
> +         */
> +        rc = modify_xen_mappings(trampoline_start, trampoline_end,
> +                                 PAGE_HYPERVISOR);
> +        if ( rc )
> +        {
> +            printk(XENLOG_ERR LIVEPATCH
> +                   "Failed to make trampoline writable: %d\n", rc);
> +            return;
> +        }
> +
> +        /* Save state before calling the tracer. */
> +        *tp++ = aarch64_insn_gen_stp_pre(0, 1);
> +        *tp++ = aarch64_insn_gen_stp_pre(2, 3);
> +        *tp++ = aarch64_insn_gen_stp_pre(4, 5);
> +        *tp++ = aarch64_insn_gen_stp_pre(6, 7);
> +        *tp++ = aarch64_insn_gen_stp_pre(29, 30);
> +
> +        /* Call user's tracing function. */
> +        insn = aarch64_insn_gen_branch_imm(
> +            (unsigned long)tp,
> +            (unsigned long)func->new_addr,
> +            AARCH64_INSN_BRANCH_LINK);
> +        *tp++ = insn;
> +
> +        /* Restore state before continuing original function. */
> +        *tp++ = aarch64_insn_gen_ldp_post(29, 30);
> +        *tp++ = aarch64_insn_gen_ldp_post(6, 7);
> +        *tp++ = aarch64_insn_gen_ldp_post(4, 5);
> +        *tp++ = aarch64_insn_gen_ldp_post(2, 3);
> +        *tp++ = aarch64_insn_gen_ldp_post(0, 1);
> +
> +        /* Original instruction. */
> +        memcpy(tp, state->insn_buffer, len);
> +        tp += len / ARCH_PATCH_INSN_SIZE;
> +
> +        /* Branch back to original function. */
> +        insn = aarch64_insn_gen_branch_imm(
> +            (unsigned long)tp,
> +            (unsigned long)orig_cont_addr,
> +            AARCH64_INSN_BRANCH_NOLINK);
> +        *tp++ = insn;
> +
> +        clean_and_invalidate_dcache_va_range(trampoline, trampoline_code_size);
> +
> +        rc = modify_xen_mappings(trampoline_start, trampoline_end,
> +                                 PAGE_HYPERVISOR_RX);
> +        if ( rc )
> +        {
> +            printk(XENLOG_ERR LIVEPATCH
> +                   "Failed to restore trampoline RX mapping: %d\n", rc);
> +            return;
> +        }
> +
> +        /* Branch from original function to trampoline. */
> +        insn = aarch64_insn_gen_branch_imm(
> +            (unsigned long)func->old_addr,
> +            (unsigned long)func->trampoline_buf,
> +            AARCH64_INSN_BRANCH_NOLINK);
> +    }
> +    else if ( func->new_addr )
>          insn = aarch64_insn_gen_branch_imm((unsigned long)func->old_addr,
>                                             (unsigned long)func->new_addr,
>                                             AARCH64_INSN_BRANCH_NOLINK);
> -    else
> -        insn = aarch64_insn_gen_nop();

If we want to go this route, and use livepatching for this purpose, we
need to branch the use-cases in common code, and have arches provide
both a replacement and a preface addition hooks IMO.

>  
>      /* Verified in livepatch_verify_distance. */
>      ASSERT(insn != AARCH64_BREAK_FAULT);
> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> index 7515a040ad..8863ad5ca3 100644
> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -280,10 +280,30 @@ static int move_payload(struct payload *payload, struct livepatch_elf *elf)
>  {
>      void *text_buf, *ro_buf, *rw_buf;
>      unsigned int i, rw_buf_sec, rw_buf_cnt = 0;
> -    size_t size = 0;
> +    const struct livepatch_elf_sec *sec;
> +    const struct livepatch_func *funcs;
> +    unsigned int nfuncs, trampolines_needed = 0;
> +    size_t size = 0, trampoline_size = 0;
>      unsigned int *offset;
>      int rc = 0;
>  
> +    sec = livepatch_elf_sec_by_name(elf, ELF_LIVEPATCH_FUNC);
> +    if ( sec )
> +    {
> +        funcs = sec->addr;
> +        nfuncs = sec->sec->sh_size / sizeof(*funcs);
> +
> +        for ( i = 0; i < nfuncs; ++i )
> +            if ( funcs[i].trampoline_buf == (void *)1 )
> +                trampolines_needed++;
> +
> +        if ( trampolines_needed )
> +        {
> +            payload->n_trampolines = trampolines_needed;
> +            trampoline_size = trampolines_needed * LIVEPATCH_TRAMPOLINE_SIZE;
> +        }
> +    }
> +
>      offset = xmalloc_array(unsigned int, elf->hdr->e_shnum);
>      if ( !offset )
>          return -ENOMEM;
> @@ -323,8 +343,8 @@ static int move_payload(struct payload *payload, struct livepatch_elf *elf)
>       * them on separate pages. The last one will by default fall on its
>       * own page.
>       */
> -    size = PAGE_ALIGN(payload->text_size) + PAGE_ALIGN(payload->rw_size) +
> -                      payload->ro_size;
> +    size = PAGE_ALIGN(payload->text_size + trampoline_size) +
> +           PAGE_ALIGN(payload->rw_size) + payload->ro_size;
>  
>      size = PFN_UP(size); /* Nr of pages. */
>      text_buf = vmalloc_xen(size * PAGE_SIZE);
> @@ -335,9 +355,12 @@ static int move_payload(struct payload *payload, struct livepatch_elf *elf)
>          rc = -ENOMEM;
>          goto out;
>      }
> -    rw_buf = text_buf + PAGE_ALIGN(payload->text_size);
> +    rw_buf = text_buf + PAGE_ALIGN(payload->text_size + trampoline_size);
>      ro_buf = rw_buf + PAGE_ALIGN(payload->rw_size);
>  
> +    if ( trampoline_size )
> +        payload->trampoline_addr = text_buf + payload->text_size;
> +
>      payload->pages = size;
>      payload->text_addr = text_buf;
>      payload->rw_addr = rw_buf;
> @@ -690,7 +713,7 @@ static int prepare_payload(struct payload *payload,
>  {
>      const struct livepatch_elf_sec *sec;
>      const struct payload *data;
> -    unsigned int i;
> +    unsigned int i, trampoline_idx = 0;
>      struct livepatch_func *funcs;
>      struct livepatch_func *f;
>      struct virtual_region *region;
> @@ -737,6 +760,13 @@ static int prepare_payload(struct payload *payload,
>              if ( rc )
>                  return rc;
>  
> +            if ( f->trampoline_buf == (void *)1 )
> +            {
> +                f->trampoline_buf = (char *)payload->trampoline_addr +

You don't need to cast to char *, the type of trampoline_addr is void
*, and we use the GNU extension to allow void pointer arithmetic by
treating the size of a void or of a function as 1.

> +                                    trampoline_idx * LIVEPATCH_TRAMPOLINE_SIZE;
> +                trampoline_idx++;
> +            }
> +
>              rc = livepatch_verify_distance(f);
>              if ( rc )
>                  return rc;
> diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
> index c7cd9b4eb0..e79615d7c9 100644
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -1010,10 +1010,11 @@ struct livepatch_func {
>      const char *name;       /* Name of function to be patched. */
>      void *new_addr;
>      void *old_addr;
> +    void *trampoline_buf;   /* Trampoline buffer when set to (void *)1. */
>      uint32_t new_size;
>      uint32_t old_size;
>      uint8_t version;        /* MUST be LIVEPATCH_PAYLOAD_VERSION. */
> -    uint8_t _pad[39];
> +    uint8_t _pad[31];

New fields should be preferably added at the tail of the structure,
and the change here needs to be propagated into livepatch-build-tools
livepatch_patch_func structure.  See:

https://xenbits.xen.org/gitweb/?p=livepatch-build-tools.git;a=blob;f=common.h;h=7f3a82ffdb29d2d1d117c1ccb20cc328bdb0529a;hb=HEAD#l135

This is sadly all very fragile.

>      livepatch_expectation_t expect;
>  };
>  typedef struct livepatch_func livepatch_func_t;
> diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
> index 45c8924f34..7a81763cf2 100644
> --- a/xen/include/xen/livepatch.h
> +++ b/xen/include/xen/livepatch.h
> @@ -48,6 +48,8 @@ struct xen_sysctl_livepatch_op;
>  #define ELF_LIVEPATCH_POSTREVERT_HOOK ".livepatch.hooks.postrevert"
>  /* Arbitrary limit for payload size and .bss section size. */
>  #define LIVEPATCH_MAX_SIZE     MB(2)
> +/* Size of a trampoline used for function tracing */
> +#define LIVEPATCH_TRAMPOLINE_SIZE 128
>  
>  struct livepatch_symbol {
>      const char *name;
> @@ -109,13 +111,18 @@ unsigned int livepatch_insn_len(const struct livepatch_func *func,
>  
>  static inline int livepatch_verify_distance(const struct livepatch_func *func)
>  {
> +    const void *target;
>      long offset;
>      long range = ARCH_LIVEPATCH_RANGE;
>  
> -    if ( !func->new_addr ) /* Ignore NOPs. */
> -        return 0;
> +    if ( func->trampoline_buf )
> +	target = func->trampoline_buf;
> +    else if ( func->new_addr )
> +	target = func->new_addr;
> +    else
> +	return 0; /* Ignore NOPs. */

FWIW, indentation is wrong here, you are adding hard tabs.

Thanks, Roger.

