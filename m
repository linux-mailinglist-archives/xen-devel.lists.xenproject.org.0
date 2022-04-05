Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C7A4F29B5
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 12:18:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298684.508911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbgGQ-0004LC-0C; Tue, 05 Apr 2022 10:18:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298684.508911; Tue, 05 Apr 2022 10:18:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbgGP-0004IT-TO; Tue, 05 Apr 2022 10:18:17 +0000
Received: by outflank-mailman (input) for mailman id 298684;
 Tue, 05 Apr 2022 10:18:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhpA=UP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nbgGO-0004IN-Ey
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 10:18:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b453fe4c-b4c9-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 12:18:15 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-l2LjAjnSPgibys-DhlTWtA-1; Tue, 05 Apr 2022 12:18:11 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR0402MB3596.eurprd04.prod.outlook.com (2603:10a6:7:84::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 10:18:09 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 10:18:09 +0000
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
X-Inumbo-ID: b453fe4c-b4c9-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649153894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GIuvHaYSSb3pg8QaG56joJLcG/IlkkOagWlfFua1ak0=;
	b=CAAFmY/0ZTwupCG8Muzmlq/mBTr6uRkb5FPgTqLLnqbcse+7GIQhxwCN3CF0lNJl737JLn
	3fVpIr/vk+AeLSJkP6o/m4uz/rvEgaLuBL1WW1uqqDv3yRp0ar9mhj4xlyyAGTDTh1WSYT
	l/8YsKKQdw8yF8Y1Pi+uChlKYA0bhjw=
X-MC-Unique: l2LjAjnSPgibys-DhlTWtA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXB3iRtsZQUrVZDQE9pXaGR29eN8uCdYDtsfTpokxlZF+SYwgs3/xCDIQTYEpsGwBqLBcDhs4fbfNZSEMGSlpfJYFTHs8diQpjbcaw16WkLQVBSOFaTpse4LR8qgYD4QLWRMHkHBiwyltfSd3ffGHZkkQU9CfN7ArGz3+4JvTUQgARlCICTDiQzkHwEBIfJkJrpYsDqBIkJHsoR1S34XGv2y9UtuiTfhbeZww9BIGOnfDDLI/9X7ysOsNhwajcty35sIDtsSG5aK56iN837KiGzLrX2VDU85vGGlxfCExpGAMC4bdPpFkA6Xa3h3Le6nFZdCqgNzVVWh/LKbGpx7tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DkQ4pP+5ENn0PQkqkyQdg6DcMTLH1hPRYx0uNcp37o=;
 b=ggwgCztYQ97yXKVKtCOL3d/NyHoHSOK7MIjFUtSqMO4VoNbWgqMnHdToqW7vDKm1lCK9ExFA0g6MbcKSsON9KsWGgshmtjU9X8ZFfAMhKM6+3ayowULWBGBJuiDhJnJT6apVbJHEZYCYNvLoGYJvqJ+9y3/wail75yqdpDOj695DSfHBfhppzN0uedUNCIFVEYIQ02axa4EBeN5YO9rfNVMFqRaYB0EVpAO1Oyp9/RbSNjzU8qXXPJc6lotqj2QmMkIPr3LatSG+Kblqh6MXSA2U/j9EkH1p0w2XQO8AkOD2JWfTy8gSOhKmg0dQ7yG+Yb897C+b0EFZbkCzx10rGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <75bd55fa-d29b-d49e-c3db-1bb952e4578f@suse.com>
Date: Tue, 5 Apr 2022 12:18:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] tools/firmware: fix setting of fcf-protection=none
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220401143720.23160-1-roger.pau@citrix.com>
 <20220401143720.23160-2-roger.pau@citrix.com>
 <e20b3d17-0c2a-b23f-d949-667072a54f58@citrix.com>
 <ed31e78b-087e-869b-8aa0-5d5d0f3183fd@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ed31e78b-087e-869b-8aa0-5d5d0f3183fd@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::6) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebd2399a-c4eb-4ea4-a47b-08da16ed950c
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3596:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB3596B8765A4C18F078D6356EB3E49@HE1PR0402MB3596.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qFwR9ydjoIW6BywaxRj1jahKPw7nzURiv7ZIeT6tZefwXtrg02gWa697/AxeLdmKHpgNd67K6gxY4afPi6dZQ5sW+RP8XEUvrt7Ca0Shvk7EnfMCSRzJYh9/g+qW5w15efouIabQh+vFqfWKWFt1A+f3Yd8GWqsy53agk/XMyH5ByuJQuguG2TLeTtEdbTNWPpNI559jjW1r5A52yxoHzTiQ+QRlkaSe+EMOx+XYZkrzGCdbidtU0ve/gRPysoU0W7lp/6BFoZnoD90FBCQEnbFTvpZXYGCgo8iNUEPzeVl742sHyLA2ZecQ4sLRKOselmgLSFcwG9ogwTE7HyLxIi3lkSnw4tm6b79lrSo+fD2YKoBeVhzcNOsHpUAlKe1YHqLF0pAipK9nx6bVklvIiex1GJoc4vE5Yi4OjtmKG3ppAHpcSFnSqr3qXm/Pti4ep1iVYSKIkqqHH9VYQJTzFqYvbImr8C62t6iNC9N7rzuSpxYUCuZu2ZSCQeruz8zAhbRM2batFFCz2nZE4Yze8xz5lmdxzCcN55TVFaCI43J0yGUNhZ6H7wGAgDzfD8S4M5CJqggJrH0a75NdZe7d62vH6NSUisHXvRItWkvClkre9nNy1Q+qUaizM+alVLbVz3jJGDhQdRxio3KwM4Akv257eV5v29Vdw4bEDOjHg7rfDwgJMSXKsFZ5Fa6hHk6FiHNCOCKvQRVcSoZXYWm3X9wyhi55uUe4imYdd6TgLH8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(8936002)(26005)(508600001)(54906003)(6512007)(6916009)(4326008)(66476007)(66556008)(4744005)(66946007)(6486002)(8676002)(2906002)(186003)(31686004)(6506007)(38100700002)(2616005)(316002)(36756003)(86362001)(31696002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8BL08eaguECCk3grYTDI0ECYXjo8+zk7ne7OUU0kB4On70E6JKPrLB95JvHN?=
 =?us-ascii?Q?945Fjw6ipqTC64amWQK2lVUR62NsCTXVNMRSUkBs/RZisB1UgA09TSFJIxiH?=
 =?us-ascii?Q?Y2Mnpxjdrl7KmaaPKISrLh+UajtATr64lqpWRO+zZ6NWfuwvKtq9LRWgh/ma?=
 =?us-ascii?Q?utxWeal1ZWDt58KQ2jDNX0kUaIFmODNrH1Hs5GFaGudwbUv+p9112QtC2dmz?=
 =?us-ascii?Q?zeUb0j7JNFQLfphWFZXu6QjPLtrkAGxiEm7C+t/TZm00YJHALPcHutZu3cXS?=
 =?us-ascii?Q?9uEozs2aPl3JD55QavAGIbWSg7edf0NBr6CeCaQFbYM8IxOzCeKwbwpYzGdM?=
 =?us-ascii?Q?6Bj5DEUcdQqr4PIElDoAF9ClVlM7sfYIPlKRdus/xqWCU6CQtk8vHz/SZL5Z?=
 =?us-ascii?Q?tP3ImEkqGOW3jYcUI7OgkjBsNS6slGFRbUnbf1dPxLGFK2isD13LdQJlTPih?=
 =?us-ascii?Q?ZpfzaQpA4mvx7OWKMxx0XivtMRovenrMGSRnToJpldd0+kl+X39R8hEV5m+Y?=
 =?us-ascii?Q?q92JenA2e53d7/Q1+9OnqT3gk5vXmu5pWR4JFsl32IEyJww5FahsFxuRcZ+3?=
 =?us-ascii?Q?C3md4y2BV0UX5uP98+YfZg5wP44Arqps00PnDlUR1e47U6SoK+KNVNjQ42Qm?=
 =?us-ascii?Q?/FXm32fiYIhg+oqH2lgSislzheVlGyWC1JKc9rm2xZ3j7FrcbhqCWEA0xL91?=
 =?us-ascii?Q?WOJ4vPpppjgeIvM+rIIE5YBxaYBXcrUnnTxL5sbRi4jOIBs4gMc1mzuXNZdo?=
 =?us-ascii?Q?HWTSyL4WHgiiluViGkrmEOYfkGALcAOKr8bGX9/q7kdnpad3gdi9XYnZp6A3?=
 =?us-ascii?Q?gIfe41NqHbcuywa+xo54mba6yZI5YffI/bTpzWg+0SM9i2IzDR6frmd3O9A3?=
 =?us-ascii?Q?62ePwhhdrA7J1M1BrgkN5l5Vn94iNlxBzKv3+/pLzDtrCrgB29BgPXl2LXhi?=
 =?us-ascii?Q?VTFxMet8RwZ/O8wlpIrsF0kCtjUaojCK8TbNXGw5l0ep63L2e7CfoCzM1DB3?=
 =?us-ascii?Q?lz1GAeLv4NeQvWkYiN5NSrHwB92EWP7FI/VHP1GoRhQCjMMRgAETPyI6w6Fi?=
 =?us-ascii?Q?orx5sX6DuCnqyZhl/m8nNP3cn3WMTIrVxx2Rg1G50Hfh5VnFQT6zDIWUI0He?=
 =?us-ascii?Q?WCrbX+4ws5+JSzooo3exRZETQR7jzQF4HQKHXY9X3jRjr7g/EnnWotMAvSDa?=
 =?us-ascii?Q?E7VZvWRXDO/X3vraudfvu3GGo+Tq7w6kpgUgLAobi2uqWH1KgLauoizmXIQB?=
 =?us-ascii?Q?V23LiyDyFtmdMZrEcNrj97a09g6hOQPMcmCLLgsdZiOEgxxfhqeCTAJrjDay?=
 =?us-ascii?Q?NIbRKKaRCYAa0swS46UJmZf/a7mmpLMYpAwIy2+GwYPjyXytdFCzpaV2vY91?=
 =?us-ascii?Q?8Glf06R6DkBdq09hc00ZHUxZW1ZzkEJTqeqGBr+ObrweBD0aSqqJ8Qln2IMY?=
 =?us-ascii?Q?a4xM4qRnSzjl5LxxaKLUF4ln0KhPg/qTnnibKcLhAmMxwwJn4qjjYqYO5b/m?=
 =?us-ascii?Q?3YJVWvWN2JcCp5LXwATOnGeVTXXq1tH4DpCR6MxWQKA1r3wLBuZxFqiTFlZk?=
 =?us-ascii?Q?Jo+mesdystwaR7Z14oEu2choPCBAmkSZvxc7wr/6WtPF+CIInZTVBsPPCllW?=
 =?us-ascii?Q?y697T7MYJhI5iEK2DIEbiqqVBEkUONx/lDz3iDDMt+1vVIVUOT7W2k8jPHwy?=
 =?us-ascii?Q?cOWn9rlv0FztXcyNVgVhTJFkxoN6mLX6q9VSk2xg87ZgVpPp253rQhwl08at?=
 =?us-ascii?Q?8qOiQ8Xbgg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebd2399a-c4eb-4ea4-a47b-08da16ed950c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 10:18:09.1758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SglviyhQSWTVSLk8mSrjkGQHaeQmmxAkiFh0qTAqGAmpnwqKTAX4uZsxt7PTgdx8u29v0o2g76FHJ92sOjlvaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3596

On 01.04.2022 17:05, Andrew Cooper wrote:
> On 01/04/2022 15:48, Andrew Cooper wrote:
>> On 01/04/2022 15:37, Roger Pau Monne wrote:
>>> Setting the fcf-protection=3Dnone option in EMBEDDED_EXTRA_CFLAGS in th=
e
>>> Makefile doesn't get it propagated to the subdirectories, so instead
>>> set the flag in firmware/Rules.mk, like it's done for other compiler
>>> flags.
>>>
>>> Fixes: 3667f7f8f7 ('x86: Introduce support for CET-IBT')
>>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> This also needs backporting with the XSA-398 CET-IBT fixes.

I don't think so - the backports of the original commit didn't include
what this patch fixes. I have queued patch 2 of this series though.

Jan


