Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKA5NbZ/oGnWkQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 18:15:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC0B1AC0B4
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 18:15:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1242236.1542871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvewi-0005DR-G3; Thu, 26 Feb 2026 17:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1242236.1542871; Thu, 26 Feb 2026 17:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvewi-0005Bc-D9; Thu, 26 Feb 2026 17:14:40 +0000
Received: by outflank-mailman (input) for mailman id 1242236;
 Thu, 26 Feb 2026 17:14:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KEVl=A6=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vvewg-0005BW-Gb
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 17:14:38 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fdc4bae-1336-11f1-b164-2bf370ae4941;
 Thu, 26 Feb 2026 18:14:36 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW4PR03MB6572.namprd03.prod.outlook.com (2603:10b6:303:12b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 17:14:32 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 17:14:32 +0000
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
X-Inumbo-ID: 9fdc4bae-1336-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CGa4rKmyqgP8tAYIfKA7WqdvcD7zjsx5TLM/9pVgTsM4/khoyPNJzgXOsV6CUuvZ2V8OqYgN41RFMoG01qJLOltkPOP856xASyxVfslyZt0Krmt+g22a5ggKivklFWU9Xl4fIHclLDUo6Ls65PMZTQSGatGPp5AG/eF1tJIBx07A8BWhOyB3TyPzTa1rwHigX16fCgnCnRoe4guIu0iWn2XK+oY0vo27x9iGsuk9CtIpbDLCyrgC0AHTkMWIYrjjo96KNSKlZx2frWFB124E57KMzE9+0/a8tXUh+fdEHGjMoHwo94T3NjtxhFAm3GSLm/veiMuhQnnWbZcRF/ky0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAm/JWVfE9j2pDcPeeWeT9ZTp2Nhqw8kMmRdLCNcRrI=;
 b=cJE7dXgjBOR8ISV10r4+JSIBfxBE6qVkGnFme0Eeu2z4vRromESGb0SjRGR88RHmK6ALGB9A5wEt8mSlcT8M1p1SaQN4L0V2mG0r5npypvSHYWujvgngd1Oz4M09Ep50lzeRGKtoBvSaGuXx9/XKAtSzPoJWMRUnbkfftR4X0t0QvAlsQ4QabtTUBX/pvxSzM9pgwNzeu61n3PnZ1afTjZSMvL44vWGhSTBEoujYhzvhlIQoQcbw8u5BSBDJzxx2n6lJgXeFBUrxW0a1UUVy8FFDflQJQV5Za+PeKeQWVITm++xSDLDy20XiYuV62ma7VXj/2Y5BwHoFrOKOJYU63w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PAm/JWVfE9j2pDcPeeWeT9ZTp2Nhqw8kMmRdLCNcRrI=;
 b=Dfsg5Ugog2UlVzVlLhldd1QbAl7lczkvYRjtGq21XnKwaZ7YcQMNmqGa2f/7v9o3qkhnx69HB+9RGzNmhbx2YUxYXVQ7YexXU58jXF33VPyVhRAa1eqqXn/F61h28PBsyOwRpPVQjVar8iJFYpwXiEz14cDZpuDg04yImN6AeMA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <53b251a1-948d-4c9c-ba0c-6f4fd99b1d6a@citrix.com>
Date: Thu, 26 Feb 2026 17:14:28 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] Arm: device.c is init-only when OVERLAY_DTB=n
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c50219c1-5a23-46d0-bbe3-ab4a871a935b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <c50219c1-5a23-46d0-bbe3-ab4a871a935b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0309.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::33) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW4PR03MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: c964f201-d0d2-4253-e4fd-08de755a820c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	CcEkSig5f8BPcsE1EZwfAWtxcP6Agb7/Aeo30zeThUgSs+JmVBDTqDUgF2MMX1Rcn27Tcwr/TC8DbHnNM1qkTZ8O6/QO/f6v55iIphsnKM5L7Fw9DGKPhe1hWhuZkySfm/n8QthfLkGn7wlTyVoHTRzLPs5H/sYi5DwZPmRuW9mFKeQPOV2AcDxwid/dWuiarKnU10QcmQDbRA4X5K3waQU1TGJJAcKfsknwX3UO1Vx8EAtXhhqO+kJyQh/deQHftnwMRD/vR7laqB3+Bug5kpBMq0GuWLeJqiO/tmS7zkIo5tbtxcw0Kq15feoRZsJPX6Bx53f/qawaWhapDaKpfDXMJGcmwaui+fJk8UAtPZfVKgEJvPy/LGTrloo2WRGaV6CV++yxcrcsx2+Yh5CDGy+N3bOCZcSP8TtHLJ+PZ7I/jZaggqS2Lt0WbGIIukAwF4gFOnUJrsDetTLWAE/u9k4N54yp0GkQnfNETLSs4faX04fVT/eA274tdUCD16A+2xT0FfjbBIZvyFALbIXALsPGtYzSgmZMuoPgiOMKSyTnw0DQthob/YAuHvWtU5kfbmKxhZtT3F6yhIF9tV3SH0FpHiQ0Dw9Gk4YaGWNBfqOYvNNSk6RrYWbvsUN+rex90+M14pmyNJBMU6tEMcZ3jaiBB4mxnzB2Akwu8fqLPJ+QnOaIGBgWHizFuMqHd+V+CTjIj5pAqFiKQdIXnPHmWFnzzJIPpadFdoLfEamFDuI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3hROG82eC9RdHBmQ1REUkdvdjlTditTRm0rRXZXMnFvSjhQcExHRUplZWp3?=
 =?utf-8?B?NzlpS3I1cGhQSEdReExJUG5JSjF4NXBJaGh1RHBaZVFLMDlCeVpDTzdsT1lD?=
 =?utf-8?B?Y01Fb3M0L1VvTEZXWSsvUUUzOEg4OEFsZ1VNbmRxL29hc0Jqd0VTM0psKzRS?=
 =?utf-8?B?d3AzSkxvYTdOd3grVXg4eDQrUTIvUlh5WFcwNHc3MUhLbzBKdVR1L2h3NEpY?=
 =?utf-8?B?REx3OEdacjFyWWRKSEV0cmhiTXVFc1RqSmlFT2NiMzRTd1p4dUtYaEZla2lQ?=
 =?utf-8?B?blViSFhqUEtjOVVKR0w5dFluYTA0T0NhaXVKVnBrQWRvR2dwdHNISFlWbmd5?=
 =?utf-8?B?QlhyY1l5MUNUN2FteG1hVTZuSlFMb0g4ekFIbXJrdkZVSDhyc1YxY2Vzby9Q?=
 =?utf-8?B?Z1BFemVpTWx4WmJSQmZySE13RnlEaTBreGFucEVxSVRyakZFNGdvRXlaU0Nl?=
 =?utf-8?B?N29VK0kvcUMrN3EvMmlSLzlObVZ5aXhCNDhnSlBYWVA5Q2dJa1VDUzFkQXFL?=
 =?utf-8?B?UWdHRi9tRTd0SEs3UHZBeGU4WGJiaDliUEMrK3dGd2FrNHUvWktLeFpmcnhi?=
 =?utf-8?B?aEhmYlE0b092Wjg5Yk5MVUNZd1UzZCt5VUY4LzdobVZQOUdXYTkyVVhNUmh0?=
 =?utf-8?B?bGw1OTFXNU1WK1JTTVozNCs4Wnh6dFhMNjg1WHdEVU9SVENDZkdkdlhZTDdy?=
 =?utf-8?B?MzMvMERHNmxVMk1zT0tmNVpMNkVNZit0OUIxOEVzakMxQ21yN01xZGRQejN3?=
 =?utf-8?B?eVRiNDFvdjZJTzYvaTlTOG5oUFFpWWtzYi9sbGMzNFE1eEczTmFLNkpZQkdM?=
 =?utf-8?B?a3YwK0hsZFRiNDBIdjZZVjlsMWR0a3E2UG5tQm9sQUVDdTZscFhWNmZzSjFF?=
 =?utf-8?B?WGJmcWIvSzkrU2ZPVDFDd1pXRHUxdktydFY3ay82VHVDUVlvQlpnSnZVd2p3?=
 =?utf-8?B?RXVEWGdnSk94YVgza0RmL3Nwdmt4VGloZ0pyei9vNlUrYytIdzVwMVBFSGps?=
 =?utf-8?B?YVdGUlJtL2JGcS83T0pad3plbDZYbS9aVFlWQXpBdDdqVHBGWWxWaENTbnFs?=
 =?utf-8?B?cCt3by9XbG82dkVuUm9jM0FNUlFFREx4cCswakVER1R3UndRSW9FK1FsZ3RH?=
 =?utf-8?B?dTdUVEJBUU9qS3ptSjFxd1pRM285K1l6TTFBWStBMyswdG5tbWowUDRvZndn?=
 =?utf-8?B?ZlB2SVdMWlVVcXYydmdnZGlrenpkMVMyOHFsa1ZBMGtFM1JySy81czdJK1VL?=
 =?utf-8?B?V0xKUHF3cnlsV3pSZzB1ZytqSkpPZnQ5Nk5lWUpGRGhiR0kxNVR2TWR2RVVD?=
 =?utf-8?B?YTlIR3RPT0trQ3VWNUlla3hxL0pnWFhuMCs0b3dDZU1sWlRPcFphcUtYcnVz?=
 =?utf-8?B?djBnM0dsbmlkNnVEZ1UvUkIwOFRDYTl1RS96ZGRsTjd0ZTZKamtPdHk5SkIz?=
 =?utf-8?B?Ylp5dlg4NjdmUzM1SXRuaEhRN291WVRSOXo4eWdWaXlkMnRXekhqdUU3S3lZ?=
 =?utf-8?B?T0hwbEVncCtVYVdGSjIzS1dXeFV3Z1FiSTlUZW9Udk5VeDVKeFVoUDNTenpv?=
 =?utf-8?B?dzVOQVkzTlFLeVhlbEVHc0dqY1p4dVhrNlZMTSt5MnhYcGREVHBzeUhsWUxP?=
 =?utf-8?B?MHdWNkhvTW0zUlQxMWwxTXB2cDVKbUFIZGFQSkZpZWFQR0VUbThNcHAyczBN?=
 =?utf-8?B?SG04WmxwcjlZMHZhYVJaYThDRnVBbktwNkFQQzIxK2NTbVVCQ3lmc2N1Q3Nw?=
 =?utf-8?B?MmN3K2dHWUtTQnhmU3NOMk1SSnVEb01GSmh5WEgxWmpXN1U3d2RGODNwczBz?=
 =?utf-8?B?a2FiVE1ZaDJuKzFEdWt5M2ZhSG5RWllSUndKaWFORi94b0lwSlNLVm5TNzR6?=
 =?utf-8?B?N0pnVDJwcENFT1l1Z2JmbmdqRXFUcVJ1elJKUmsrL1Q0NmN2Mm9JdGVOclRK?=
 =?utf-8?B?UDdjbnpaVHNsTTArQndLYm1RLy9FeEZFb3MvdlprV3MzbG0xbmNCNld0N1dL?=
 =?utf-8?B?dEFwUjYzWHRnaTZOM1IrM2FoVHBEUjA0UElxT0RyWFFQa25JTlc4aTZGUU9q?=
 =?utf-8?B?SEFlY09YN0hjYVF0bjEvWkJaamVPSmlrR0pTbW5HUUE2OGZMczN3R2p2allo?=
 =?utf-8?B?NitFSFRaNnR2OHRNZ1FnakJEc2tsRWpTWElnOS80ZUJyTFZBNDZmMzNPSi9l?=
 =?utf-8?B?T3J4NEFqL1k3RThpa2l6TXFaZFZhUjAwYml4NVFoc2N4RjRCd1NjY21rMXNQ?=
 =?utf-8?B?QTVzdGFlMTlYVXNTZExRSUlUMFJLcWQwTHJrV3ZmWGx2OUdCK0xWdVlabEx0?=
 =?utf-8?B?eHVoR1d4c0ZXQldTNE5Lc0VDWkRjZGo2a2I3SmxzU0dnRWhvMjJ6UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c964f201-d0d2-4253-e4fd-08de755a820c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 17:14:32.4803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hsLw4wesndViNvKl3f65vc1L4EZwhIOyOrWqxmzobbuJjNUEl1sclofR2yBdNd+RvPzFz9UazREqOOI7yrStEosIFEhDkek7VcVOYp9d9I0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6572
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3AC0B1AC0B4
X-Rspamd-Action: no action

On 26/02/2026 4:28 pm, Jan Beulich wrote:
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -15,7 +15,9 @@ obj-$(CONFIG_HAS_ALTERNATIVE) += alterna
>  obj-y += cpuerrata.o
>  obj-y += cpufeature.o
>  obj-y += decode.o
> -obj-y += device.o
> +device-y := device.init.o
> +device-$(CONFIG_OVERLAY_DTB) := device.o
> +obj-y += $(device-y)

I know we've argued over this before and not come to a conclusion, but I
still firmly believe this to be an anti-pattern we should expunge.

obj-y += $(if $(CONFIG_OVERLAY_DTB),device.o,device.init.o)

conveys the meaning more clearly and succinctly.

~Andrew

