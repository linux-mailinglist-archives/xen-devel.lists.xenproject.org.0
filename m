Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6E7345BA8
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 11:08:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100599.191837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdxA-00016D-2i; Tue, 23 Mar 2021 10:08:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100599.191837; Tue, 23 Mar 2021 10:07:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdx9-00015I-Pv; Tue, 23 Mar 2021 10:07:59 +0000
Received: by outflank-mailman (input) for mailman id 100599;
 Tue, 23 Mar 2021 10:07:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJMG=IV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lOdqU-0006c2-Vx
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 10:01:07 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a5c9fe9-1791-4d4f-85cc-967c23b49b1e;
 Tue, 23 Mar 2021 10:00:45 +0000 (UTC)
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
X-Inumbo-ID: 0a5c9fe9-1791-4d4f-85cc-967c23b49b1e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616493644;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=qezkb5E4ymN+jRIlFBx+OAG/L1HX+dmHCgIuqcfRKoQ=;
  b=MXz+aJImKURbM9QBL+DAaaTQDgqjNN5Rfb3Wkrh9dkSD1gzfXqHmISPA
   2e96Tr2rL37warFiuAKze3wiayqIgqwZ/Ehfrp6PGWv8IeEvLwHVGxDB+
   9BhfgLwvp7AavaaAydYK2ZUULXkd9CbkpSToeS7ACnmmPG+vKF/qiM449
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LRHjG6HXWKVYDE9/hwVYn0xynz6x2T+jpUbtQFhyFRt+iSK5o6PJZ7S58iQEVQDCrJTTA1BDYj
 7KE4NoXI/oqrilMuhHKqneXeeLXzRruCgWWUG4WV63q0uCqdCMUdstcjQOjEkT3RfiKKKOCKu0
 Xixx6GdxvYNJyAnNG18PoFOae2OGTrpBmrHJD5hPiPSlplJg4tMS3CiwCv1dH0XT4fmANW4ylg
 92gMtR+2Zf9dBrMMznmIYNyHdhJrSmMYDaok57u3QtXukM0RyieJl2OAfSX+XkX3cwMYz6EgXW
 eyI=
X-SBRS: 5.2
X-MesageID: 40055568
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:j8F96K59ymp6XOSSWgPXwbeFI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex/h3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdhHW3tV2kZ
 1te60WMrfNJHBxh8ri/U2cG9Ev3NGI/MmT9J7j5l1GJDsKV4hL6QBlBgGHVmh/QwdbDZQ0fa
 DsnvZvjTymZHgRc4CHFmAINtKz7OHjubDHRVo9BxAh4BSTlj/A0tXHOjWRwxt2aUIr/Z4M6m
 7A+jaX2oyCtLWBxgbYxyvv6f1t6b3c4/9iIODJtcQPMDXrjW+TFc5ccpmPpio8ru3qyHtCqq
 ipnz4aM85+62zccwiOyHPQ8jLt3zo053jpxUXwuwqFneXCWDk4B8Bd7Lg4TjLl6lEttNw58K
 VH03Pxjes0MTr8nT/w79WNahdylkDcmwtArccviRVkP7c2Wft0l8gy7UlVGJAPEGbR84Y8Ct
 RjC8na+bJ/bU6aR2qxhBgj/PWcGlAIWjuWSEkLvcKYlxJMmmpi8kcezMsD2l8d6ZMGTYVe7e
 isCNUlqJh+CustKY5tDuYIRsW6TkbXRwjXDW6UKVP7UIYKJmzKsJyyxLku/umldNgpwfIJ6d
 v8eWIdkVR3V1PlCMWI0pEO2AvKWn+BUTPkzdwb6IN+vrH6Wbr3ISyOQF0jiKKb0rQiK/yef8
 z2FINdAvflI2erM51OxRfCV55bLmRbUMB9gKd6Z3u+5ubwbqH6vO3Sd/jeYJD3Fyw/Z2/5Cn
 wfGDz6JMBK6FG3Smb16SKhGE/FSwjax9ZdAaLa9+8cxMwmLYtXqDUYjly/+4WMMj1Nsqs/eU
 NkO7P5mqanpW27lFy4oVlBC154NAJ48b/gW3RFqUshKEXva4sOvN2ZZCRPxnedPwR+SMnXCQ
 ZboFxy9cuMXt6t7BFnL+jiHnORjnMVqn7PcowVnbeb49z5PrkiCIw9ZaB3HQLXNhB8lApwsl
 1fYAscSkK3LEKqtYyVyLgvQMDWbZ1VnRqiK888kwOliWys4eUUAkY9cxHre8iNmgoqTydTnT
 RKgtUiqYvFoxiAbUYcoMB9Cl1Db2SRDtt9fV24TbQRoJ7EPCVeJF36wwCyulUIVESvzGkpuk
 ndRBfkPs3jMx5mlF4d7oLD1GlVWwymDgZNQ0E/jKk4PV6DlFxU9sDjXNvq70KYdkYCzuYBMD
 vMfDsVJUd0y8qq0QOO8QzyaUkOwo8vJ9rZBL8udqu74ALRFKSY0a4BBPNa55BjKZTntfIKS/
 uWf0uPICr/EP5B4X3dml81fC11omIji/XmxVns63W5xmc2BZPpUSNbbqBeJ9GX9G7/QfmUlJ
 1/kNIupOO1dmH8cMSPx62SbzlNLHro0BiLZvBtrZBfpqQpsrRvW5HdTDvTzXlCmAwkM92crj
 JtfI1rpLTafoN/dc0bfCxUulIvidSUNUMu9gj7GPU3c10hh2LSVun5q4bguP4qGAmMtQHwMV
 6Q/2lG8/DJUzCK2LQaB6gzSF4mHHQU+TBn5qePZofQAAKle6Vf51K8KGa6a6IYR66fG7kcxy
 wKkO2gjquSbW7/1w/Rtzcgff4L/GajXM+oAAWDXeRP6Me3PFyQgq2spM6/5Q2HOAeTegAdn8
 lCc0dVc8FIzj8lh4cz2jKpSqP2rlk++mEulA1PhxrowMy+/GzfHUtaKgXXjZVdQClLPhGz/L
 r42Pnd0G64/SNM1pbCHlpBZ91CG9AfSY7sMidlQPJgzIKA7u4omSRMYBAnEm46hnT8xopdrM
 iE5Mk=
X-IronPort-AV: E=Sophos;i="5.81,271,1610427600"; 
   d="scan'208";a="40055568"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZivyjKQBEOwHlLooMKDAqf6CUffsvfee104m6wGtNCfkSaHOBnXm7NvueKuDLRHoHqMo6KO2nEHUMkQYt/2Y/57s08y+ng65fsgiCsFqt2PV31l6xUL387kf6PPyFexF9xunIbmFFKAL9yAo8T3DTmsw191O0bVPf9SkUB2BaIbMCavnanFnzWxZS8Iah4fIwpDBCQiKSxFuYMRI8g+PzqEn9WuY5+vGOCeJwFMt2ZXRhJM81sBA9RV+gVfaQs0JOoShT6LF8WqD6z9+2yllMhj3GV0zu0tCobVbNxEv45o6mK2N/PuV2PjCrWWL9/doUDCiS5ldO5rszj784G6k1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUfWBdInOKZs5Um38UoLo/Lo9GJ2byqnYqx1gF9ZJ6M=;
 b=cGabuRCSEPAl9Cb7vL/2OQNC264wpsjMAIhDowdVM0jHXuNGO152K7Gw3w8GKNmaV0tcPk9qJHovMXgn/5G6oSma3aE7t7eYFNLrU/uJ8K2q12G3rj/YDTHCfSjFjlXm+fheAk0GvcHI15daiQzdSQr4uCPUq7k9n9TDg7vPI8drk+KL84vStfn9HTbmAEocwtdA+/iZdfr7svNXmOBAJCIpcqhbpZkKa406m2dMvIyp2jz7F7FB82jdEYDx87mMoQDZf9/W4Yw2+igZNR/j17cTdkzh5OJ1IfOaaVYUinTfD9bTUr/3m8m+UGzz57jSFyVZHDjT51NE5vlvM7cl6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUfWBdInOKZs5Um38UoLo/Lo9GJ2byqnYqx1gF9ZJ6M=;
 b=IclS5tlY5MpOhs7CuC4Mu/MZ2Hjx3guV62AzITTHaZzK2brBtQhv59RKfjcIuaRmw0Ln/vccd9BgHcQyBaB8eOFAFVa0myvBPnY13OKpe/rsdgmW1HfeGQUHM7wyxiIxATp9mINhykYmE4/2+X592w8XqNRpT/oiAatTKaQMSsc=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 11/21] libs/guest: allow updating a cpu policy CPUID data
Date: Tue, 23 Mar 2021 10:58:39 +0100
Message-ID: <20210323095849.37858-12-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323095849.37858-1-roger.pau@citrix.com>
References: <20210323095849.37858-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0110.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cd1d566-7a4d-44f8-6435-08d8ede283ed
X-MS-TrafficTypeDiagnostic: DM6PR03MB4969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4969AD90C83082EE8D7756798F649@DM6PR03MB4969.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kabRokzitRcDEOrGYV4IS+JvR4i+ZKC6/p/H00wwp9o7GVXn25jax+YYMSQ+E1ZqJ+6s5fEgOyez6VGR/iQ1BSUm3qHNCqhRPEJ7K5lqjB7LITGC/CHV9vwIxp8IXdppMvRIGH0wc0L6YbGy7bM2nn4ipb4rOz34Cyk5Iy00D2uG+f5kcGPX4GVM/s+pz0xdOXhkqP6LB4mD782PPlao8oojwtEWKsK9aW81f/qvXrBLlTMSCBIgC0nZ+6Nv2Ag03feNIv/62XibjgetPSLqNUygi2cpkpMKKdt2L+AMTd6NMx7psI5pRUijn7eVjUTH8C8cU9sKIAair7qsfli2utMAo7jFUmjdwFaGOHERmSL8FifyhBFmeHgS/8ZXXMyYZRhougn1Q7/bi0RJXOApULoLqBSFGHHBMEZUEiWuGi1n0VnWfuTokCHzdv0XlOcTPJLdujCRGi6MwHg5zJLXvbCXcrwPeb9NzlkCoYXcYds+2OzPr2hawv0yqwQSGLb8MXrbtjnTaCN8JhIk1y3zbFx9bbtgVsqh3CUAutxZ77xN1kH/h0GYTjAW1PNFcG8s1Mmq4uy92GZf65bt1fftbD9V9yIXBhyNO62gWMHRMHUlKwNe5J/iziawt1MpLAuW9NFhTpig+GdTwPbrXSojhEEjFOFzzRBN+OtNrWwTKkY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(54906003)(36756003)(2616005)(316002)(26005)(6486002)(956004)(16526019)(186003)(2906002)(86362001)(66556008)(6916009)(478600001)(5660300002)(8936002)(6496006)(38100700001)(83380400001)(66476007)(8676002)(66946007)(1076003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VEhBWVhTUGVTQ0ZVL2lLVVJPaEhlMnZiQnRRbENBaDBUVTkwZFc0YlVENzVN?=
 =?utf-8?B?OFNxaWhjWlJtUUdqbGVqQk93aURnQy9KdGczSUMvVmNGczNrTzhuR3dLSUxY?=
 =?utf-8?B?RTQyczdHOWMveFRaQ1ZjZVBuZWlYRVFkQzhtWFZwRDRCR3pKQ3QxSHVEN0Zu?=
 =?utf-8?B?dXV3T09wYTc5ams0ZWQ1TGFxcXdkaXFhV3kzenAvYXhUNTExZlB2SHd3ejYr?=
 =?utf-8?B?VTdpVlgzb0haMHA4MzJ4WThjY2J0SS9sQjg4eWlCcmh6anhxTzkySzg0YWcw?=
 =?utf-8?B?enJaRzc3cThQaXFuT1JnL1dlZDRzRFhhUlVxVlluV2hHd0ZwS3VCL3QrNEI0?=
 =?utf-8?B?L1VNZWlhVjFVQXV0Z1VoekFyekRpbm10QmlydWhhWEdiWkRPalRZZitUbGlz?=
 =?utf-8?B?c0k5RzVBeU40UEdxTnJ5MUJHWHVNb2p6eTVJdXMrWkNCaEpFNExBSGFIM3FC?=
 =?utf-8?B?Um5mcld1d3k0dERJTk5ESGgzS0NaMmx2NE15Z3l5TmZsOEZDamswaFFZbjJ2?=
 =?utf-8?B?MVdCWEtRQXE4RHVobVByNEhDb2tFMzJuMHNWWDNlWGpTLzVqMVpBTzgrR2hv?=
 =?utf-8?B?R0JzTEZkcExaNFFkcEMyUCtsdTN3aEovZmVNVDR4dUhDWDV1azlKS3ovcGV0?=
 =?utf-8?B?YzVQRVlWWlE5d2dWb09FTzZKdEdkZFhLbXorZkZ1Q1VEV0xPNDlMZm1nMi9N?=
 =?utf-8?B?MG9MRUNDM0ZWWkhoNVllc21aQ3dKRzVNOVFhaHlQVkhrVVVKMEtlcGNOVGh3?=
 =?utf-8?B?RkI1OTVWMUp3WWQxNVhJVUR3NkNHNkxPZ0YyZ3ZRS0wrSkQyaXZreElyMTZl?=
 =?utf-8?B?RnFudnN3MXR5VUNtTjhwVE5RRlJjeWMzenNGNzR6TWptK3Z2SVV2S1ZGVGxO?=
 =?utf-8?B?LzB1RnplWG53MDU2aldQM1d4OTg4WmhHKzBibHZJTk9IaWNLNEdONkcwV0Zw?=
 =?utf-8?B?RlphU1cwMVVrb0xSczVYQVFEbU9adjFwL0Jkazg2OHg1SW5reGxrSmU1Ykk1?=
 =?utf-8?B?RU4xdk9tZ0RNRTlKZi8zTHlOZTU4T2ZOTGY1UEUzcjI1bHlremdibW4zRTdR?=
 =?utf-8?B?VDJrdmx4bjJ6Nk1Mdi9UUEN6dkVSME5jRjJYeHBHcnR5dzhvYVNTTUpxRjZF?=
 =?utf-8?B?WkNDMkhjSzdKWnU4cGRacDUyemZyQ1QwSEs5R2JRMC9rcU9RYXFtb3dDUWtm?=
 =?utf-8?B?U1dPRndERmhuL09oU3lKc00reDFyME1OR0ZhdlltM3JDQURyZkIvTEc2aDFl?=
 =?utf-8?B?czZIelA0elQyaGVtS0ZwUFdNUTdXVFEzazBvQU1SOG1kaXRwRzM0QjNIalJZ?=
 =?utf-8?B?ZkVHenN4Qys5bzF2bUhSNnBjMDBpS09MMnI4SFh1aE9qemM5dmtvQ0YzVlZ2?=
 =?utf-8?B?cUhBUEZUcmZmVFlzMGdzL2ZpaVI4US9WeWxramc3VFNXZ2dVdXU4SkhBdXhy?=
 =?utf-8?B?aXZyeEJmdE44WWE2MENEOWs0OFhyQ3g4T0pBYncvekpZTG0yaVhPRTVQV0NF?=
 =?utf-8?B?eDZydU53TEFnUU54by9aTWNDZ3dDT3JqUzkwZGxndC9haTdXVVhtY0JFeWhx?=
 =?utf-8?B?RTVPYW9jcm1DMmlZOVJCQno5MU8xVzdtemx2MXZnUStWTGNWVVQ1dHV6b3dC?=
 =?utf-8?B?K0xGejBsTFdXK3N5QTdQbmxSN1RuUWt2bHVqVms5SGpOSVZib0xEWlZ6aWI1?=
 =?utf-8?B?a0ticW5vQUlWalZSYjc3T1RFS2tubXlEcGZnQmx1MUZCVlQybDlGL2o1M204?=
 =?utf-8?Q?Jzo7DxEt6hrXK2KuQmlwNhrOxv3ty9WC0/BgmAk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd1d566-7a4d-44f8-6435-08d8ede283ed
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 10:00:40.6730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Qhdy+rh58rr0VhubPn6TkOtICHB+XeOV1dHgdlYYOnDDgLXj9l9VQ31lXazB/B0OtiC/muxL1Vr/97+Mh7j3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4969
X-OriginatorOrg: citrix.com

Introduce a helper to update the CPUID policy using an array of
xen_cpuid_leaf_t entries. Note the leaves present in the input
xen_cpuid_leaf_t array will replace any existing leaves on the policy.

No user of the interface introduced on this patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenctrl.h         |  3 ++
 tools/libs/guest/xg_cpuid_x86.c | 67 +++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index ab34df1dc98..2143478fe4b 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2613,6 +2613,9 @@ int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t policy,
                             xen_cpuid_leaf_t *out);
 int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t policy,
                           uint32_t msr, xen_msr_entry_t *out);
+int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
+                               const xen_cpuid_leaf_t *leaves,
+                               uint32_t nr);
 
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 091aeb70c9c..13c2972ccd3 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -966,3 +966,70 @@ int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t policy,
     free(msrs);
     return rc;
 }
+
+int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
+                               const xen_cpuid_leaf_t *leaves,
+                               uint32_t nr)
+{
+    unsigned int err_leaf = -1, err_subleaf = -1;
+    unsigned int nr_leaves, nr_msrs, i, j;
+    xen_cpuid_leaf_t *current;
+    int rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
+
+    if ( rc )
+    {
+        PERROR("Failed to obtain policy info size");
+        return -1;
+    }
+
+    current = calloc(nr_leaves, sizeof(*current));
+    if ( !current )
+    {
+        PERROR("Failed to allocate resources");
+        errno = ENOMEM;
+        return -1;
+    }
+
+    rc = xc_cpu_policy_serialise(xch, policy, current, &nr_leaves, NULL, 0);
+    if ( rc )
+        goto out;
+
+    for ( i = 0; i < nr; i++ )
+    {
+        const xen_cpuid_leaf_t *update = &leaves[i];
+
+        for ( j = 0; j < nr_leaves; j++ )
+            if ( current[j].leaf == update->leaf &&
+                 current[j].subleaf == update->subleaf )
+            {
+                /*
+                 * NB: cannot use an assignation because of the const vs
+                 * non-const difference.
+                 */
+                memcpy(&current[j], update, sizeof(*update));
+                break;
+            }
+
+        if ( j == nr_leaves )
+        {
+            /* Failed to find a matching leaf, append to the end. */
+            current = realloc(current, (nr_leaves + 1) * sizeof(*current));
+            memcpy(&current[nr_leaves], update, sizeof(*update));
+            nr_leaves++;
+        }
+    }
+
+    rc = x86_cpuid_copy_from_buffer(policy->cpuid, current, nr_leaves,
+                                    &err_leaf, &err_subleaf);
+    if ( rc )
+    {
+        ERROR("Failed to deserialise CPUID (err leaf %#x, subleaf %#x) (%d = %s)",
+              err_leaf, err_subleaf, -rc, strerror(-rc));
+        errno = -rc;
+        rc = -1;
+    }
+
+ out:
+    free(current);
+    return rc;
+}
-- 
2.30.1


