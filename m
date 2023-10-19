Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD017CF6D5
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 13:30:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619235.963993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtREU-0003CG-PP; Thu, 19 Oct 2023 11:30:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619235.963993; Thu, 19 Oct 2023 11:30:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtREU-0003AY-MO; Thu, 19 Oct 2023 11:30:30 +0000
Received: by outflank-mailman (input) for mailman id 619235;
 Thu, 19 Oct 2023 11:30:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtRES-00031f-E2
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 11:30:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6fd1ac8-6e72-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 13:30:27 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8762.eurprd04.prod.outlook.com (2603:10a6:20b:409::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8; Thu, 19 Oct
 2023 11:30:25 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 11:30:25 +0000
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
X-Inumbo-ID: e6fd1ac8-6e72-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lW5mf1bwLZyc8EzFrRJ3W5AmtGbdCixkqTRkH8HKGfFEts0qihZr0jU06SpLbXqu8CaHCejXIUbA+h3ezbZvh1FaRsfxPlU6qpbGgoR0cjBaZX9aRp2TwK38ZtdO+LPcDKCT2gjoq4WRF+KJFhhk241/NpppzFHB7teOXq3Xs/yj4XNT7eVwR1oZ2Rg5jDzkM5zL5lfs23Tqi+rQj8NJHpIHQUXcp4I932ZwxAGSmz0yR4bkrU3CYc7stYDfd0Wndw8n9bZ4cKnGKPgF/UQDjf4El5CKrIEWIkymsafNb862aNeBqW0+bJzUFcnEfCF08IYfqDd7DkCoPejbbGXDFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6y35kJIW413wlhYkU3Hog62Q5BxjFc4/67pLKvk1hw=;
 b=Di9V1WdAbIhG6SZAL+NwitYjJD1eP5OkTuE1ULd+6KbpxQLDoqsZTEcJnUP9QjM5Oqx8vYvI66di/cfhbY3mI6ZzQiWjkHHLePowuvayFm3qm52NtlaRTOtCLG4Cybpp+ahZNiycLZi8TvZFEJ6ttKlY/sYV3uHmEMMzknLIodoSapj01YF9SKTvJDRflmovQABI7wKjhg4Ghvtp9Ob+XRX658wSJCK6axuAIdC8GfET8ByQTnA3niRyGSwFOEcWpGJ1gVccsWbBD5C9ygrDPdDkbJOKAq3K4+LRoJt2IQC/MDW8rF1yXoAQs0x2SAk8fMho2hPIR4fkx/ht//mBWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6y35kJIW413wlhYkU3Hog62Q5BxjFc4/67pLKvk1hw=;
 b=N3F/Mcn+oLMx6TBuH37luzfu0kYERpH6Rw7XRUdVLdcEOk5gGkuz+IzTbfVEDx2Lor4RYF5Yw7KiZQ+3AqmV2XxRYvqTdH+hVGt9rtjIr/I8JytY7ngESOIenm+BxJRlVwSocFP9uk0GcHGUHgkqCA+CxkebPBvRQql4Cf3PHMzurYi0NPKJ2zXqlaWFkycOng8W8KtC0KxdIPU0RD9aNgxpTSeHC4JKOvu/btPI+m3dzs1ZTB6tQsioa3tdFcbNxzVbc6k2yiTWqdpRG26xadS3nfRH4tNv2GtB7kY35CAAjTbnIua6nj/2HUc7J75MTgPToHjRnn812ZQwCdyX+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <73a8d43d-9626-fde3-9e81-a65bb9096712@suse.com>
Date: Thu, 19 Oct 2023 13:30:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 22/29] xen/asm-generic: introduce stub header delay.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <b16677ea84860ae7143339b8c856f0da7f8c2b6c.1694702259.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b16677ea84860ae7143339b8c856f0da7f8c2b6c.1694702259.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8762:EE_
X-MS-Office365-Filtering-Correlation-Id: b286f09e-7fac-4bb3-7105-08dbd096c9e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7QdqTex2SYi/cVXL56CZAIEYr6KdEGrDNtUZjXx1vcX0+8onX0QXHJSaX3q+/MUrxPRWepFT+TwuY4dQT8GOmVX65FtaEukfhAdJKZfpV66uc94VbiP6t+AQHkAd6RObi4tIjGIPtoKXO2B7j7HepZvdYGafpIOVlcK/skT+9Oi/4hGuLbF2qBaPPnE7hvrKyjXc1gDlkrY7fe5PgmgDlViIvrY4flOHFSEZgGMhmqpeiyHMM8K9kEMDSuiZrAnHu3CMBCD8fvrYy6nSQ3sBC3pq02p1cW5O0Pajdpl97gBhfUdgLxL0rHoz9OMWprEuNa42Mnbt4+q5ovxNN3QQPYDsnZjAWCEj0Rfw2qmEDbA6j0qvhZ6ww8HcedoGBu5CQP5Xw+Fdmr6Oe2NmWsX1rhPepBOBKLTstUQu9mmnn0oDbBGf1+ZYqXdO4NByFND/T3xDKXNdlIdfMX3QGnonHrmcfkn0VGJuz++8z7Vxd1fGHg2k/FabvOjiiwa70CNeND0hlEKv0PwQyBfEOaUSLyrBOO/w22MbjoOOnD9VoThjALQIZMjUbdJPxBJ3fVlaQZu5xJ0QAWlrdbXB7P/tJGtHOFdD0b95uoAn5+WjKSCI6paOHYog7idCqifOU9EqeCSbh1JKoA57CfvGLPkefxC6w4Q0bk6Dfsv3Ak8DhrI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(136003)(39860400002)(346002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(31686004)(86362001)(2906002)(6506007)(38100700002)(41300700001)(5660300002)(4326008)(31696002)(6512007)(26005)(53546011)(2616005)(478600001)(4744005)(36756003)(8936002)(6486002)(8676002)(66946007)(66556008)(66476007)(316002)(6916009)(54906003)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0ZSRGw1cnBacmRrQno0ZjV0cERKc2l1YUZ6NllUVUpSenJXTnRlSS9DUjFS?=
 =?utf-8?B?UzNaUjdNN2NscU1IYWx5R0JGVExkRzVYV2orc2xJb2dRakQwNjZNZzBFQkU0?=
 =?utf-8?B?L1BiNm1lVHBTWmVwQlBCcE4zS1p6b2xjejFUelk4TU1oSC9LYWZqZGRzWC8w?=
 =?utf-8?B?OEcwUmdvMDZzb0RLZ3MvajVOMVJ3V1ROZmtTTDNTalBkNm5nVW5TbG0vbG5o?=
 =?utf-8?B?blpISityZ2IyTk12OCsySnpFZ0JMVVpNN29iZzNiUXMzRnZFbkJ0d1huMnU3?=
 =?utf-8?B?WmtoR0Q3Z2pRdm9Da3BkOGQ4MExiKzZKTlVOUUo2dWlyeVFZM01BRHpRUk5I?=
 =?utf-8?B?Nk5LcHYrWHpiZU44OW56Vk8zV09JdDRQVVYrcG1wMm5YMmxvR2pGTkxRR0c4?=
 =?utf-8?B?TStzTkt5amFUTTdqTkNFZk1qL2NxRmUycCt1SFpETFFwMjhxdHl4aGE3QmZT?=
 =?utf-8?B?MHhuTEJyTnZuN0g4NFVLemt1aG9YWmkzRktHcXUrejZJMUlLU1ZBdFNRVGxM?=
 =?utf-8?B?OEUvVWpZQXZYcG1qZEVRdGV4K0cwcHE3TGpLN2pHNDlBbEM4R1BXTXR3K2tZ?=
 =?utf-8?B?WUlOQnhnRVZ1eG9YdFpNS1RVYWFDMVg5RTl4U3JkZ3orMjdjVi9vblBYeUdU?=
 =?utf-8?B?d3BpQjZHUXozb0xtL3lPQTFoaUFXZWY5c3JHdU9wcnoxWUxoZmRMazBxSVlC?=
 =?utf-8?B?THZUWDR4N3BPanlLT295andNckMrbmd3SFRGK05TeEJTQmFZM3Zhd1B2bDFa?=
 =?utf-8?B?VW94TTNaMEJCenI3MEpSSDNvNGpzQjI0LzJwNHVoNGxPU0YwQysrSTI5SEVT?=
 =?utf-8?B?ZGVCb0Z4czdFNXNnNkY4MFVRTW9vZkszQ1h1WW1pRnNiYk9qR2MzdXRacGxT?=
 =?utf-8?B?czVsVm1tc3RiVXloQ2pGTW5XejZJMmVDWmJlZlJyb3c1TWZFQXBTTDUwVEkx?=
 =?utf-8?B?OGQ5cUxjTVhIVDF4SnFGUXZxNFl6ZE03T2lDdmNUaFluQ2ZJWEtLNkFHYVFL?=
 =?utf-8?B?bFRvQ010VFVhREpOamE0a0lWb3RLb0ZKWGsvMVJkV1RvRVV1aHVabnM4TDha?=
 =?utf-8?B?M04rdG5yenJlalh6cEFZeDBrZ1F1S1NYbkpWN0x0MklzRmNvUGtHbWowK0Nu?=
 =?utf-8?B?cGV4TzRqWXU0Um5LNSthRXFHbDlxWU04OFYxa2h1eCs2R3VpY2NYLzFzTnlQ?=
 =?utf-8?B?WDYxRUxydHlaV0xsaVRGUy9WMU9aemZLRnMwT2ZHUjlpTklmVmVIZG0rQW8x?=
 =?utf-8?B?S0pIM01qd1U1T01tSlQya2VPZTNvTVJnbUpLV2w2cFltZitOUGNHUjJjV3dr?=
 =?utf-8?B?UE9TM25NNjJ5TmI4bGdnYkh1VzcvbHF3LzFoSjhiajFZR25GR1EvVnB0RjNJ?=
 =?utf-8?B?cTBNRlR6dUFLK2ppRDhrZG5UcVFRZ3Njb045SURvY2FKMjRiWFE2KzlwZXZW?=
 =?utf-8?B?bkVROUdYekp6NkNnRVFIeVdnSmRKMkpTTmhJMDEreHNBQzhsNlM1RngyUkVi?=
 =?utf-8?B?THNYem9mK3pNZUIveVh4bHFhWkVEY0FlYmt0TE5aWlo0czRrWW9TeU9vaWRX?=
 =?utf-8?B?WTdnM3Y1U2p0T1ppNjZJWGtiNWRLMTM1eHBYUVd6a1UxZ0hVajExTEYrZysw?=
 =?utf-8?B?cFZEOFBwcDhHclIwODRtNURteGNOT2xyMkE2cWVJbjNnN0NDNFBkTGpyZVpu?=
 =?utf-8?B?QXZXNU5yVnNXOVpwY0pjZzlKRDZkWEJpRVNvWjFQQ3hvREpKNlRBdzVHQUZm?=
 =?utf-8?B?ak54b2Q2dExQSWdUeWcxa00vUFR3bkJ5TmFvNGRjWnRaZkNtOHVMUUtMM1Bs?=
 =?utf-8?B?YjNEQ3ByR0lXMURMSHpMK29EYTRtTzNXbXhiOG5CZnY0OE5vbzNQUXV4Z1RM?=
 =?utf-8?B?bUNlWlJ4ako5Z3RZTE9MUC9OV0ZxNWFmLzc5VkVxNTJlYUdSS1VSMHlDdEFj?=
 =?utf-8?B?S1RaRDRsWC9UMitwdTNXVWZYdGw4TTJoT2pmZGY1KzZ4TDJRTXRQUmVuYWFG?=
 =?utf-8?B?NHNaNTNkbXpyOHBNTjZ2Q21qby9qeGExL0ZvU0RnT2dDWTVseTgrcy9qVG1R?=
 =?utf-8?B?dzBFRVF0ZGEyWGdiTHgveVV5K3hvNDA5dEtnSzlMTXBUeVBtS0JkLzNRQXVN?=
 =?utf-8?Q?++0YfCNcESuzQSpTi53zTOJam?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b286f09e-7fac-4bb3-7105-08dbd096c9e9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 11:30:25.5864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +lDcN/1ItW7j1t69W+jRJq2MeIRZ+KptzUgfwkEEo5nQ3DU8rr8mbCuhq0M+Gm0vEhAYgEuMGoQw8y//ccBgVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8762

On 14.09.2023 16:56, Oleksii Kurochko wrote:
> The patch introduces header stub necessry for full Xen build.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/include/asm-generic/delay.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 xen/include/asm-generic/delay.h

Besides the implementation below not being acceptable, imo we should do
away with asm/delay.h altogether. x86 can rename __udelay() to udelay(),
and then the declaration can move to xen/delay.h.

Jan

