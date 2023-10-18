Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F377CD4BF
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 09:01:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618417.962041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt0X7-000082-Tb; Wed, 18 Oct 2023 06:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618417.962041; Wed, 18 Oct 2023 06:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt0X7-0008WG-QE; Wed, 18 Oct 2023 06:59:57 +0000
Received: by outflank-mailman (input) for mailman id 618417;
 Wed, 18 Oct 2023 06:59:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EezS=GA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qt0X6-0008WA-9N
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 06:59:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0cadaa7-6d83-11ee-98d4-6d05b1d4d9a1;
 Wed, 18 Oct 2023 08:59:54 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7021.eurprd04.prod.outlook.com (2603:10a6:800:127::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Wed, 18 Oct
 2023 06:59:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 06:59:50 +0000
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
X-Inumbo-ID: f0cadaa7-6d83-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fRjbV7svxcy2lysx/zhORa6LeypvRUc/YBlxGkTG7n7eb8wBkBeo4zCXQD4WCYAVU7v8BrpuO9JVWOfOmPCvdw8KqIryx7xCOiznFSS/9Jnk+r2QUuT38Aj956DluyHlSEObivtu+68sl1ybEeAc6Mlp+EjENQwubKmc8v4w2V/CSVH0/gc7OSUa8C+2idYMNHvq7exsbW4HFB0f/axQl008U7nx5BdKBLWdtKCzuvoFERxK6BHLjGg1fNVkYd+AIwWM5lCllp/n5KSMHdz0D7wl3vYe2MqWVJHKG04qsuNBpRHH7L7zWSIox3KvqOG5BtIxhhdYy3KTmTHKhjHwBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIz/ik3vsk6vDc/DQNaFVQMZLtxs2fRArKQLalAqgvg=;
 b=RF+P2oZooGf2PqjfJgMfFpbs8m5oDLt6YNEvllmdhorNuXNTnwn0hn0YShjDYwPG5XByrOFAoYih0LieuBUY4RCmPlztZ8eT0LT83YPuEL5cb01VLvTaaHPlKybYrvi4TNtgLpvjaWZuJ0nZTJ6w0bxcYQVjzXFhzc7MIVwDvWTBtntA9egfr/EeCW4MlgSMU15xdqYgiUvRJobFVxLsJezIfG1HWMc7o69yS04xntW3WUy7+2A+Ya43QFIAxOVGww6kmnlcpQRgsiUHmT5dPhxVHGoRQSPdn6Vl/Hub3HgTgNksc0EB5fYDWYmQ0GTwUNuaBp7pBsD9BUY07qjJuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIz/ik3vsk6vDc/DQNaFVQMZLtxs2fRArKQLalAqgvg=;
 b=30xdr0Ko7veB0oYP0wNOt+XjYgVyEFEgsDFRe5LUH0ljmyVmwxd6/G7hBlmN+eAJ8eK6fLd6My1HHp+TshSZ3+0cM2wkRL3YaKNySDMgImLH0nT0kOJNNenAsCU7AePEdTWgHrbXpJjI0l77Hy88h++2eFrILh46MME0ygZMouFuEInZ+Rs0uXOoxCbTt34oe6FqhdIavnb3h38PNhdfxYAp/sR0+P2f/1WLGJlli2he2u2w83tLTDSnwv76Z6fTHMGGd+Y3tUW0kvgjSQbGdgWOj9iXa0TwKBatnY0zGtticIp/VDYWcAAVYhbzbIB6oyeuubxb/5HvtlhG9MF7CA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <da32f4d7-7e17-b426-f080-993035d0ec44@suse.com>
Date: Wed, 18 Oct 2023 08:59:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: xen | Failed pipeline for staging | f51c9238
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <652f0b6b987b0_2c99ee41715dd@gitlab-sidekiq-catchall-v2-5c8bc8b6dc-2zmr8.mail>
From: Jan Beulich <jbeulich@suse.com>
Cc: "community.manager@xenproject.org" <community.manager@xenproject.org>
In-Reply-To: <652f0b6b987b0_2c99ee41715dd@gitlab-sidekiq-catchall-v2-5c8bc8b6dc-2zmr8.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7021:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d239003-11a0-44e1-609a-08dbcfa7d27c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ruaaYUUwD2GwKZSG5HOjwyKamx4UC/ZYs2VTA0YXXcAfhref5YS7eTl0xdIwTZS0jSEY8leWdPxJ2UccmS6vynnm+ys33SRz2XZo06Szdj6WORV5Cwl7jjH+ZNdcVvuimTPXURhv4l8P7YlBHjLR6dLUjRJe7c91OtTpDq/0OxQatRN+9Sva3q232cFbCKe/gZKnvBUNqCKR/w2gPQun6Qee5K6O8lv1k1+Q9KBTJ2nkEAOdGOO8oBSP5y0PstCU62Y3wwjKPd9b9HBgwidC38ujMieIKdz5uQUWnVmYnXxjT7ekVXU/1AExWwrUZEbPe/ZhD3gIQGCDQwoGNJJJNaR/S3vLL7PVIt9CTNeG1hw5+tK+M68Gder6A/WDdDh0y3sy6r9kMBuOIp4CQtcCwK9U7nPFXPi+W8OXeNsc0fpzGVx6quXeM6QQD4MLZZ07IIPhs7HiJs6U5afJNPbWrSHKkTFo31fD3Z9LK68o3xw+yQfPE1DrTsBmfSLa2GEDQfyqWylJqrXE3z8D6akZ+MURYE3oHmpuSkOypyZQbYuHptz42OPV8jExDKu1CyGKVxMNbBlr7hJePAHZsq7GXTpd9P4CfUDSzx3p2HwWgsXXBdqTmqQ46X77VYp3urWW+RVBUP+JLGtJANSox5PAiw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(376002)(136003)(366004)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(8676002)(66946007)(31696002)(66476007)(66556008)(6512007)(41300700001)(110136005)(6506007)(86362001)(53546011)(966005)(478600001)(6486002)(316002)(4326008)(8936002)(36756003)(5660300002)(2906002)(2616005)(26005)(38100700002)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckhsUllGU0NkSS81Qi8zbG0zSEZLdnZjN0FSdE83VkErK2xWNXIwWTRLMDlW?=
 =?utf-8?B?NzZEN08ySkdUNVFqY25YWVRnb0RsS0FUWDFMcXRHVytSUmRRRGZKRFBPVE1l?=
 =?utf-8?B?L2JLbHE3MWgwelJybVdQZXV4UFZDcTh5YWF2ZkFXZjhJZWs3N2VXTjY3Rmt0?=
 =?utf-8?B?ZDhUVzlsZHB4QVZPeWFkcml3eHAwaURRYjFUSWt5TmtMYUZEOGk1RlZPSzdO?=
 =?utf-8?B?Z1NqQjNYRDc3RGhZREw2QjNWbERGU085Z1JvbW5QL04wWTN5UFg3K09uTFFN?=
 =?utf-8?B?M0Ivb0EyV0JDUXBacU5wbnRjYzNzZVVpRWZjVDZtRmdrb3gxNERGdmF3eWhB?=
 =?utf-8?B?L3VJdVZiYmJpZGZSZUhLZEFGOVk3QndqOENDNGgxYmQ3OTAxZkdwT0FDd0Vn?=
 =?utf-8?B?b1dmaEZKUnZ6TTJuSUlyNFM4dFZvcnJycWY0cGp3QkVYdmNwbE1jMUNzNm5N?=
 =?utf-8?B?Uml6THhUbWVXRyttTEpFdlpnclFrWjd0Y2xvVHFma1VzN3Y2cHQxVnpoQ0k2?=
 =?utf-8?B?NVlZUFlTSzdpclBmbkNWUVlXRHRrUkJ3a0dUMnVNSkpJK2w2d1QzYTg3Yldy?=
 =?utf-8?B?eFQ3bjJmUEdXWEg4d25iblM4RnpYQlA5NS82YnVRYU5USjJSZzJDbzFrSTlB?=
 =?utf-8?B?anZjUm5QM0J2TzhHRkxad0FTd0Z2SWoyN1lrYXpqWFFpdjJlZGtkeTFhY0RS?=
 =?utf-8?B?cnM1RDhYUlpIQk5KZE5PdzRTQVNHZnhiUE5LbjJpOFJEZ05nbmdMK0JFOGpt?=
 =?utf-8?B?NHZzc243L05QWVdaYk5QQXZnQXpZR1hpQjBlR0FrbFVRQnRZVTZWRXF0OXpi?=
 =?utf-8?B?UXhOL2ZLbTgxT0k5Z2pEdlpYcDhuYUdvWFV4UnJUS284NUo4cXhiaENncWE0?=
 =?utf-8?B?NkdmQnRYMG9pSktkODdXZXRBV1pNMXhmcHh2Nzg0bUVLNGFjMDE1enFUcTc4?=
 =?utf-8?B?dU1GaVF3ci9oUHlKeHZMM2k0WEdab0hPMXpBR05YRmtmdzNMUDc4NU9wc3hV?=
 =?utf-8?B?N1JaZTVCcnZNUndJaXNjNW5yOGFweUpzZ2xvY2ltbTV5c1B3S2poeWdONTV5?=
 =?utf-8?B?bXZsRk4zVTUxV1p1eElDMDc0OGVaVkFSSGRUbUg1V0RrKzFLd2VXQVQ0MDF5?=
 =?utf-8?B?dHBGUkdIQlRoOXZCNFU4dlo4aGZ2RkplUENJR2diTkVGbmREdmliYTRETzFr?=
 =?utf-8?B?RUdZbDU0TTd5M0pJVXBMTVVRSXdFN2ZtL0h2UHBoL0RxS0RaOUJTd0s4THlG?=
 =?utf-8?B?ZjYvbXZaZXY4K2MweHBPN1doRnNsR3Rzclh6VFNWRDgxV2c3NG5wcDVaWFdY?=
 =?utf-8?B?QWMyakNjN29WRGc2WXZVK1NHNHRaSm1vVVNubHVMeGxjUVhzM3J5STBqUlRM?=
 =?utf-8?B?WjcxYXNNd1R1L2NYZk1kTmpQblJyTm9vVjJodjJMYi9BRFZGOFB1VG9MaWlF?=
 =?utf-8?B?YUVyWlg2c0tQRytmOTdadityQXB2UHBYVXhuQUZ1QkR5L081dmJSU2J4SXJM?=
 =?utf-8?B?cGhUSnQ0RGVDK1hsVHlSaWJMait4Zml5TjgzRE1qK2d2Wm1HOGt2TjBtNU9T?=
 =?utf-8?B?cjg3Q0wrMVp1LytMbDBsSFhXbitwSUpGdjlzRGs4WFBKblJIUFlBL2pvZk5M?=
 =?utf-8?B?bTR2UXJOQnRXUDBPZzVtYi9Xcm1TenB1VHNzWjhDd0QzN3lMY3JmZStrTDN3?=
 =?utf-8?B?L0dhOEZuZ04zNXNTbW81MjRqVTNHalUvM3IvaC8xZXlndExtOG9vY2J4NkZS?=
 =?utf-8?B?YVp4M1RIazRhMkx1WVFDa01pOTRqZzZCeUxtY2xmb2tzWDJHR0ZNclRjbGdU?=
 =?utf-8?B?d3k1RzNvNWdoVzRkWjR0MFVFMXBTWEZpTCtNZXZGUkNSMWQ0OTRXYTBpSHdT?=
 =?utf-8?B?L3JYTlhoRWZWVVUyU2ZYMkkyMi83MHZXT1kvZG44RlFzdDdYOE1NMDlvR01n?=
 =?utf-8?B?aEtsdE9zRnVtYnlQcXZiZ0t2ZWN0Y0c2OGxpQThaa2ljcmpqTEVjSksybXNQ?=
 =?utf-8?B?cUVlODFhTE5vd1VkQ1RtK0lDaHdRN1BoUUpIcXYxKzlHYkhRbTVqNTFVcUwv?=
 =?utf-8?B?REdnRkdHdXE1Ymt4Ri83K0E4cWJOUTBaMjI2YUM4TmFIam9FMFBTeWR1cDRT?=
 =?utf-8?Q?/NoQSad1ul8FkDKrC43vMOEiQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d239003-11a0-44e1-609a-08dbcfa7d27c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 06:59:50.2268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hjtBzxBtXLWwpOJwA04V6CZq+Ztncrwcudjl6ujRItT5PV1Hy+S73vpFDhkXMDz2yC8mfNmUUTDKCydijCEAzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7021

On 18.10.2023 00:32, GitLab wrote:
> 
> 
> Pipeline #1040204203 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/xen )
> Branch: staging ( https://gitlab.com/xen-project/xen/-/commits/staging )
> 
> Commit: f51c9238 ( https://gitlab.com/xen-project/xen/-/commit/f51c92383b8dc76233481e2814aa2e905fb9b501 )
> Commit Message: xen/arm: Check return code from recursive calls...
> Commit Author: Michal Orzel ( https://gitlab.com/orzelmichal )
> Committed by: Stefano Stabellini
> 
> 
> Pipeline #1040204203 ( https://gitlab.com/xen-project/xen/-/pipelines/1040204203 ) triggered by Ganis ( https://gitlab.com/ganis )
> had 16 failed jobs.
> 
> Job #5314335376 ( https://gitlab.com/xen-project/xen/-/jobs/5314335376/raw )
> 
> Stage: build
> Name: alpine-3.18-clang
> Job #5314335405 ( https://gitlab.com/xen-project/xen/-/jobs/5314335405/raw )
> 
> Stage: build
> Name: debian-bookworm-clang
> Job #5314335460 ( https://gitlab.com/xen-project/xen/-/jobs/5314335460/raw )
> 
> Stage: build
> Name: ubuntu-focal-gcc-debug
> Job #5314335478 ( https://gitlab.com/xen-project/xen/-/jobs/5314335478/raw )
> 
> Stage: build
> Name: opensuse-tumbleweed-clang-debug
> Job #5314335485 ( https://gitlab.com/xen-project/xen/-/jobs/5314335485/raw )
> 
> Stage: build
> Name: opensuse-tumbleweed-gcc-debug
> Job #5314335481 ( https://gitlab.com/xen-project/xen/-/jobs/5314335481/raw )
> 
> Stage: build
> Name: opensuse-tumbleweed-gcc
> Job #5314335458 ( https://gitlab.com/xen-project/xen/-/jobs/5314335458/raw )
> 
> Stage: build
> Name: ubuntu-focal-gcc
> Job #5314335431 ( https://gitlab.com/xen-project/xen/-/jobs/5314335431/raw )
> 
> Stage: build
> Name: fedora-gcc

Picking this as example:

../qemu-xen-dir-remote/io/channel-tls.c:510:1: fatal error: error writing to /tmp/cce3v8eA.s: No space left on device

I'm afraid I have to ask to delay plans to further switch processes to go
through gitlab until basic problems like (apparently) regular cleanup to
provision enough disk space haven't been sorted.

Furthermore I'd also like to ask that getting these reports sent to
xen-devel@ should be a prereq to further leveraging gitlab. Them being
sent to committers@ instead was meant to be a temporary measure only.

As an unrelated question: Do we have any control over the formatting of
these reporting mails? The grouping of items (i.e. the placement of the
apparently but not really separating blank lines) has been broken
forever, resulting in at least me always needing to think twice which
link belongs to which job.

Jan

> Job #5314335242 ( https://gitlab.com/xen-project/xen/-/jobs/5314335242/raw )
> 
> Stage: analyze
> Name: eclair-ARM64
> Job #5314335390 ( https://gitlab.com/xen-project/xen/-/jobs/5314335390/raw )
> 
> Stage: build
> Name: debian-stretch-gcc
> Job #5314335391 ( https://gitlab.com/xen-project/xen/-/jobs/5314335391/raw )
> 
> Stage: build
> Name: debian-stretch-clang
> Job #5314335454 ( https://gitlab.com/xen-project/xen/-/jobs/5314335454/raw )
> 
> Stage: build
> Name: ubuntu-bionic-gcc
> Job #5314335461 ( https://gitlab.com/xen-project/xen/-/jobs/5314335461/raw )
> 
> Stage: build
> Name: ubuntu-focal-clang
> Job #5314335470 ( https://gitlab.com/xen-project/xen/-/jobs/5314335470/raw )
> 
> Stage: build
> Name: opensuse-leap-gcc
> Job #5314335506 ( https://gitlab.com/xen-project/xen/-/jobs/5314335506/raw )
> 
> Stage: test
> Name: adl-pci-pv-x86-64-gcc-debug
> Job #5314335466 ( https://gitlab.com/xen-project/xen/-/jobs/5314335466/raw )
> 
> Stage: build
> Name: opensuse-leap-clang
> 


