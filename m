Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF6156A7CC
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 18:15:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363087.593436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9U9W-00071M-2U; Thu, 07 Jul 2022 16:14:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363087.593436; Thu, 07 Jul 2022 16:14:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9U9V-0006yb-Uj; Thu, 07 Jul 2022 16:14:53 +0000
Received: by outflank-mailman (input) for mailman id 363087;
 Thu, 07 Jul 2022 16:14:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+VJ/=XM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o9U9U-0006yV-Qw
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 16:14:52 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60058.outbound.protection.outlook.com [40.107.6.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee1e2e16-fe0f-11ec-bd2d-47488cf2e6aa;
 Thu, 07 Jul 2022 18:14:52 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB5259.eurprd04.prod.outlook.com (2603:10a6:10:1b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Thu, 7 Jul
 2022 16:14:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 16:14:50 +0000
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
X-Inumbo-ID: ee1e2e16-fe0f-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSIVuxJbJ3ylJBCB9QSrRIrmswjrOrAdqHFQaO0Mfe4FiqS1yc4HgFVJao1ls0wm9z1q8PE36ENzcbkQVjoLHYYup8xXujXZgNXv9iuq6huM2zbYXzg2bNFChmZgZlBZRrJ2nfEv6YJqZ/0gz1Wbj5DG3Au8xgw8dFY+S6KERRJQXxJBZrJ+CPHKsTFC6rt6ytpDI8CUihJlYVCY4/Szn8icJ4s8xtpKZbRwxFmdsJaVDHSWfIWNguqQV3riRFa9nJ7NrUJ5RbElcb35wXRdq8s/ZDfqNqTBdJqUWb5sgjjCv22OdQ9dyjlJWqCgBwwwSPKpQ714jsxf7APZhHKEoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZ+xp+shX5rvZzJBLBCke+xj1fPXSAeGOTHFM4g1iFg=;
 b=TJFyILZTOEe3Z92l1LT2s/r5KRSDSQDn/YrUhYdoHLoSTL+Rsz26xYiiT2P8CotpEC27/2awhTT6F5Q4MAAF9Bqvo6wJFFWYJ0HIB1Jbiuf3ejz8Kr5XgHTN6c+TCVRzSZHKl7PPpRoPf1qqsq3i+0OAxKv5x0xJBuogULe3ZMGThU496VccGh/QDdRQmMzt/oi7TN/XIGiMKVgr8jyHwwTYJLXKxBohkNFeb68VNvN4kqn3LB4vUA3SXrwZJzX5jWdXrGLTcX+Ysorxe4E0f0ue8zysySEW2vF7P7SArI3O3ss0hH6uIrmKzbWOpTuj64KWLu1Cl+mVlSVJFdo2cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZ+xp+shX5rvZzJBLBCke+xj1fPXSAeGOTHFM4g1iFg=;
 b=YDs525V8spDKx9d4LRRrkIRA9h+PTjEzdkXsHmad5/8wdVQOY+zyLxE46UKhPad4TQWdfU+u9vaGh6p9uXYgyf5MlIsw3+Z8n5plkBQ60A3LP12GKPRBKk9gIsGaunO0RmTc6rgf8XG4QLVIY+cTxW8I72LDXnVlpNWfiMTI6IcZ2A3W2gr4cfDnRT8UOwdXgBcSX46dfyKSJm+TJptxbwEnV0q0GY84zJVlDsSTYbTCVPXpU1F3RcsX+ZZ/WRECzaKh26qzGfiJ2cVxnJMnps2N3hQoLyU5ZKgWdn0cslZKbYS7qKAfqHf3aS9ylQ1f3EezW8XRKzRrTfev5bmpIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bb6b66e2-f5c6-55e7-aa76-edbd38a71ca5@suse.com>
Date: Thu, 7 Jul 2022 18:14:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: PING: [PATCH v6 0/3] amd/msr: implement MSR_VIRT_SPEC_CTRL for HVM
 guests
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20220517153127.40276-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220517153127.40276-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24301e8d-6167-4238-1d67-08da6033d169
X-MS-TrafficTypeDiagnostic: DB7PR04MB5259:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mp9YSGjucwllNB61qz1RoZUQL7VwqlsmA2ubbeO+s3Om+BCZs2AB6samzXdaekRSjkKoka64FrumbLwYfig64yfnV2FLD4NRWSq7fvCFxUyfSlESZfdJ19+J1QKdazOO8KbrNO3EohpYYvsQNXA+kOlD5zWKBlOv2h+KeWxJEZGGF4ECjNwfpc3IYmrnz4qww9MlFzz3sSL2+zEsTi4eebXgsuhE3rOdGT+P9yAMW6nOBb154jx919+hFt5UFlkUVkamv42DTFEYyVjiNWnGrMLJWwYvOE1nFb8jvOyrwCoz2XQnoKesNgsQtZ30tkZwVXnG4aj1POELYCXfTk22dngVJWbLoOrMveh+QyQNqwi7V2kf7XavpotbxFilDwT0KJ4gegvnOXctcHmRM/QytqWZBf+Tl9prhhBIyan4/S/in0xVV96G58yxPe8ewe6x+urtQ8+76p4RsbPdeZtrkP7gkqxIuVHEDQFXCyy/Crz/RpgzKdLen16mcW7r9uRti+yWY5CBrlVR15LUQOYkPegI5eWKWj03lh9J8ZQsF4bH3duKovGoujtphNDmfkNtbXodEsnutpUlBi4MpUDMsF6XnANgCi+2EDw3Md87y3p0a2a4ZAHqJkG3ntUEptTHmiNFsWiEVD913gqlMDPPzGwRaAQ6QfqgGdPQ0gX1Tf65OOT03UnPYrxjMx1UmNHp6F/PFRDwKn7kQzdkLggXHd0S1+UpYLDz3WnAMq8Jv3U0wl1m7ihGjnggH6cOlUL4w8D+urg2LktYYREFgGTHvoOGD6PtE4sFmU60xATXk3Vhb0jFrIwj1YYB4dwGTjrmTip+tX0fSX16Q/2ARBEDSslmkwuj/F3l1aVuorAj8cc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(376002)(136003)(396003)(366004)(36756003)(6486002)(26005)(6506007)(2616005)(2906002)(53546011)(478600001)(186003)(6512007)(31686004)(38100700002)(8676002)(86362001)(66946007)(8936002)(5660300002)(41300700001)(54906003)(6916009)(316002)(66476007)(4326008)(31696002)(4744005)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2NIb2gxNExzYWl0TktVa2xadWgxZU8yWWhUeEVZVEhuZUtYbFY1eTJkcmc3?=
 =?utf-8?B?WkhyaTVYMmlpb1NUazR5eUVKR1ptdlhuSlNXcXBtOGY3VjEvV1RhZUtEdUV2?=
 =?utf-8?B?Z0srREw1czJLcFNIbjdqTXN6T3JsbDRyYlhaVDJwRVQ0c0huSFlycTFjeXFr?=
 =?utf-8?B?MjlMMWo1eDJXYjlaWExQNGlQdDM2bVhLei91c0g2bUYwd0FZNFFqTlN6TXZP?=
 =?utf-8?B?U1ZUUmJXdW10Ykd1VG9WUnJ5Q2xRMVVFNVBEMHhKekZIWXBMWlBQY2s1Y0hx?=
 =?utf-8?B?TEJlM2dPREMwckxhbnEvS1lJbWVJZWQrT1Nyc1VQSTRtc3VlTG51S29sdE9I?=
 =?utf-8?B?eDdwR0N1cWFhU0NRQjcyVi9teldIYU90NFNwOHdYR3JQNkYzekhMVWw0c3g1?=
 =?utf-8?B?bVZaZzdxOTZXSVNxYXl4MU9VTmZ6MExIU2wwak1zVVd4NjJJRWFUbzg3U3I0?=
 =?utf-8?B?dzJTd2EzbW9seVVlOG5veWxFTnMwMHNkZVp6WUtYaUFtNzRoSWVINjNwOHR5?=
 =?utf-8?B?NzNHWERoa3Y5UXovV042SlJGdXFINHpXaDdMNEhQK1JCREpnNWtoNDNoQ0Vw?=
 =?utf-8?B?ZEw0YlRmYng1VFdwQithQjU5SHB6TjBnUGt5TExOL1hpR0JEL0srbEJjbnBs?=
 =?utf-8?B?cVBPUm5hRTdUdDFYcFRUcTM3SFEvajRGR1RROUR3Z1JjRllwWWxkWmM2cnRW?=
 =?utf-8?B?Yjl6TDFHc3phSk5CS3FsdFoxVCsvVlRmeHhPbG1PWE4rVUpqc1VMaUhYbTNv?=
 =?utf-8?B?UkpMTkhUekhuNVV5cVJIUGkvYzNpbXF6cUtuaWNUQk8rQ3Y5dENFYjcrdkgx?=
 =?utf-8?B?ZU9rZFd0MUtmMkEvd1V3bWFkYXZnS1NvdmR4TU1RSzVPVzRBZ3lHMGxxQkt4?=
 =?utf-8?B?Ri9Ja2pNRDkyN0lFMFhSTjh6TldUT2s4Zk5rRnlvbmwwOVVCZEdrNkNTSi9Y?=
 =?utf-8?B?cHVTNlQ5aE1KL0lUZzVpRXY4VUwyU0R6Yk43cjc0N2M0WlVYbEZjYzI5Ly9M?=
 =?utf-8?B?MTUreGE2cmdsT1V0WU9rdEMyY2V3dUd0U3JLc0JGcTZwcERaK3IxZ1lNZU5P?=
 =?utf-8?B?NWJuQjNEeC83L2NtNjVFRkdYVE85b3VMcHBTTWlkQ3hpSVM4M2poOW9nTnJK?=
 =?utf-8?B?VjIxaGJMNVpuSDdGaFRmUkFYTFV3MjNaU0Y3YVVBVHJnazhsRzdtVDZIUEFG?=
 =?utf-8?B?dkRkVkJQU3pQZDhHdUVPZTVBaWJzSnhBa1d3WWFsRmNVUko0enFndWNyMll6?=
 =?utf-8?B?RWQ1Zmc4WlgzbkZXQUlTZlA2UzhxaERQUzZKdDhFYVgwWHlRSnNqelMrMTB2?=
 =?utf-8?B?ZU9MWm5kODNtMEpuMkErb2NGZGRneTYwN09md2RQTjRlQklzNkdlUWs1STRo?=
 =?utf-8?B?TnJNK0srK0dJNE94eUhlZHFlN0xzUmp2S0RabTM5Uk9kWmR1UzZVanllZEZk?=
 =?utf-8?B?cDFhQ0dHZ3dRbzFYaC9CQWFkeTI0UEdTeGcvbDR4ekkzRVpmNEwzdzdKN09u?=
 =?utf-8?B?VWRlc0xnMnQybkRyRTJIUHMxTG5mSXNoMEM5VEtvUVVFWTJRRGFhSG5TdXoz?=
 =?utf-8?B?bVVjbE9Ma0dhSTRwdEZzdTgrMEIzM1ZTT3Bxc25vVnlWcHZLU1FKU0NRUENW?=
 =?utf-8?B?dlFFQ1c4ZysyalloS1BuWGl3OHEvMjJlejNjN1NZc1Q4c2VicUtrQXJ6TTlI?=
 =?utf-8?B?dVBjMm5obEN3aVhjYWhKTEc0R3hncEJEa2g3U25qUkNhOW9pVE9YakMrTVR6?=
 =?utf-8?B?YjdXaGE4YmVWdkUyR3FUZ1V5OGtBRzIxdUozRHlXVFZqN29MZ0JPbjhhVGlk?=
 =?utf-8?B?TEpmVVNlWkNTM2Rndlprb1NGK0thRFlsY2Z2ZUNhQStBbmwwakQ4ZTRNak9t?=
 =?utf-8?B?Z0tIZ21rdGhETm9nQUV6WGIrRGM4YTZVdkJqcEdwVFZhbkI4QTZVeWFvakky?=
 =?utf-8?B?U0NNYzEyMHExOWpMSTcyRG5ScHhVUHQxREk4UFlRYXBVa2ozeVBmZ1Vta05x?=
 =?utf-8?B?endyQ3lvRTJqeXlPNTlYVjJJRnZoa0ZGSUZmNXR0eDJ3L0VZUC81TzBnYndz?=
 =?utf-8?B?cFM3NzNDUHdCYUl5QVBRbyt3ZzRQeTh1dlB0M2F6NjZOZEdidm5EWitjS1dw?=
 =?utf-8?Q?OsUf/p2mguVaUjbpEqvHOWtlG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24301e8d-6167-4238-1d67-08da6033d169
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 16:14:50.0678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M9cRw21klJ2KKsi6lgb5mgxuKifAXbozRZ7MflYgMLj5jjMmAYq07/gpVvJ7GpkNYJDBEcAffkpZbXQaSJUU3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5259

On 17.05.2022 17:31, Roger Pau Monne wrote:
> Roger Pau Monne (3):
>   amd/msr: implement VIRT_SPEC_CTRL for HVM guests on top of SPEC_CTRL
>   amd/msr: allow passthrough of VIRT_SPEC_CTRL for HVM guests
>   amd/msr: implement VIRT_SPEC_CTRL for HVM guests using legacy SSBD

While, somewhat different from Jürgen's series, here the delay is more
voluntary (in that I had told Roger that I'd prefer to commit this only
with your (perhaps informal) agreement, I think we also can't wait much
longer. I'm willing to give it until the end of next week, so I guess
I'd move forward with committing early the week after, unless I hear
substantial arguments against doing so (at which point the two of us
would likely need to decide who's going to pick up this work while
Roger is away).

Once again thanks for your understanding,
Jan

