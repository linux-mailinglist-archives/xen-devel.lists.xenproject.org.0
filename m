Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 544FF44596F
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 19:14:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221844.383746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mihEU-0005Tt-V3; Thu, 04 Nov 2021 18:13:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221844.383746; Thu, 04 Nov 2021 18:13:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mihEU-0005RY-QK; Thu, 04 Nov 2021 18:13:02 +0000
Received: by outflank-mailman (input) for mailman id 221844;
 Thu, 04 Nov 2021 18:13:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WbKJ=PX=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mihET-0005RS-3g
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 18:13:01 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d64687b4-3d9a-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 19:12:59 +0100 (CET)
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
X-Inumbo-ID: d64687b4-3d9a-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636049578;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UNMBh6J8ducn9YkE2jwVJGDIyB8ONaSfyVKdjtTks0c=;
  b=KUdLm5Iq2hEOuE1mENurB8n+QKeUTNyL8tb0XsIlZcrsZwgDBzGmGkkK
   9GSHniUFh+VpxUVSMTyl/Jjh6uJc7iUm9aFL8GspRBSVbvJpa0MTmQ5Rt
   sOL3mwedqdQd66PN+NJOUGtih7baU0YUWEzeUWdb5goNqCEgUWUOKksiV
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0U2ffWiGqDbbVoJptVtjykFHFWLAlCCPfxpDtWLX1OeNT784EY4noKNrhee8weXpPa89CyEXaN
 sjEujFp6c7WhgIq/DB6RpFjh+P4rBvi/FyRO+kGoyYwcFXGse5VszQA9Jv6/EyB/ptybLrCKIh
 KkEHGWNO+mS71P7aFK+bPiLIUhDqrdsOJcOZfRsuIi+ykYwrWWO9vAsWZroA/7aWVR6EnEdbJ+
 bJtdcGjwc43/SXFOwDApgWTAA87b8VhEY5/EF7+ZIXG65+prR1mpTy2S3mPwYmXvr3msSGuGqh
 zmWooNCWThjFThJ+ZRxbS6J1
X-SBRS: 5.1
X-MesageID: 59049044
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/wVaR6u3U42zGiwxOx3wSREFuOfnVKFZMUV32f8akzHdYApBsoF/q
 tZmKW6EbvvbamKjKd5zOd+19EtUvpLUzNFhTFE9/iBjHypH+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx2YThWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplnqW2cQN0H7T1qukeWCFaDAhlOKh45+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6DN
 pJFOGIzMHwsZTV1CnA5Fb0mod65nzqmIg9Rk0iP4oYotj27IAtZj+G2bYu9lsaxbcdahEGDv
 Urd4n/0RBodMbS3yCWH2mKhgPfVmiH2U55UE6e3ntZ1hHWDy2pVDwcZPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsg/IHc4MOSatgsljLk/eKpVbCboQZctJfQPcfsvcyGB0z7
 22EnNjRByNGq7iQd23Io994sgiOESQSKGYDYwoNQg0E/8TvrekPs/7fcjpwOPXr14OoQFkc1
 xjP9XFj3OtL0abnwo3ipQif6w9AsKQlWeLcCu//emu+pj10a4e+D2BDwQiKtK0QRGp1o7Tog
 ZTlpyR8xLxRZX1uvHbUKAnoIF1Pz6zVWNE7qQQ+d6TNDxz3pxaekXl4uVmS3ntBPMceYiPOa
 0TOow5X75I7FCL0NvImPd/pUpRwlfmI+THZuhb8NIomjn9ZLl7vwc2TTRTIgzCFfLYEyPlX1
 WinnTaEUi9BVPUPIMueTOYBy747rh3SNkuILa0XOy+PiOLEDFbMEO9tGALXMogRsfPVyC2Io
 o03H5bblH1ivBjWP3C/HXg7dgtRcxDWxPne9qRqSwJ0ClA5RDF/UKKInu5Jlk4Mt/09q9okN
 0qVAydw4FH+mWfGOUONbHViY6noRpFxsTQwOilEALpi8yFLjV+H4PhNep0pU6Mg8eA/n/d4Q
 +NcI5eLA+hVSySB8DMYNMGvoItnfRWtpASPIyv6P2RvI88+H1TEqo3+Yw/i1CgSFS7r58Ewl
 KKti1HASp0ZSgU8UMuPMKCzz0m8tGQ2kf5pWxeaOcFafUjhqdA4KyH4gvItDdsLLBHPmmmT2
 wqMWE9KrujRuY4lttLOgPnc/YuuFuJ/GGtcHnXasunqZXWLoDL7zNYZAuiSfD3bWGflw4mYZ
 L1Yn6PmLfkKvFdWqI4gQbxl+r0zuon0rLhAwwU6QHiSNwa3CqltK2Wt1NVUsvEf3adQvAa7V
 x7d+tRePrnVasrpHERIeVggZ+WHk/oVhiPT/bI+J0CjvH17+7+OUENzORiQiXMCcOspYd19m
 epx6tQL7wGfiwYxNofUhy9ZwG2AM3gcXvh1rZodGoLq1lImx1wqjUYw0cMqDEVjs+lxD3Q=
IronPort-HdrOrdr: A9a23:M07Oe61yBy7yxkXQhm+gCAqjBSJyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJU80hqQFnrX5Wo3SIDUO2VHYUb2KiLGN/9SOIVyHygcw79
 YHT0E6MqyLMbEYt7eL3ODbKadY/DDvysnB7o2/vhQdPj2CKZsQiDuRYjzrY3GeLzM2Z6bReq
 Dsg/av6wDQAkj+Oa+Adwc4tqX41pD2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbdz9U278t/U
 XMjgS8v8yYwr6G4y6Z81WWw4VdmdPnxNcGLMuQivINIjGprgqzfoxuV5CLoThwiuCy71QBls
 XKvn4bTohOwkKUWlvwjQrm2gHm3jprw3j+yWWAiX+mmsD9TCJSMbsIuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBDjCOP0DofuN9Wq0YafZoVabdXo4Ba1lhSCo08ECXz751iOP
 VyDfvb+O1dfTqhHjHkV1FUsZ6Rt0kIb1K7qhBogL3Q79EWpgE286Ig/r1dop9an6hNDKWt5I
 z/Q+1Vff91P4krhJlGdZI8qP2MexrwqCL3QRCvyGvcZdU60lL22tXKCeYOlauXkKJh9upEpH
 2GaiIAiVIP
X-IronPort-AV: E=Sophos;i="5.87,209,1631592000"; 
   d="scan'208";a="59049044"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVpfzJiUlcsx8Cv+AkbyoGt7yFpk0bgBN5z05a/CcrvmxKy+e2Vk6B12irsAZlyIe3qqd0lQ/j9CNXuAlazI5vkZj0BMakuWyzDhQdsIOZ1ymgQG1/KMv9Xx2o1aANtPkwYlGp26TCxeO1yBz6aFHFyfiribD/oVxYK71sT0f1ZyV+6KF3m5U/QsBk88Th+wEOpo8Fwpn9llVUBXXU8XLUSjw2rlE/3I4HxHhTUbPvv0y2bMl5BGkOi+HNdfpbaqZVC7F1t2hIZSJnHMEEcpUrKyWXRlCdZQ4OWmnruWwakIFlSxhvRk4rzJXy/VfxQ+KzahUTdIxG0bvgIm3ho58Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEodEYO9+mLTTYwln4jMIKZDYM2iI2UzxSLjaZNcxeg=;
 b=RFqfdTOZ4HQiN1yl5YHzMMpOdVIVkWAJRU7X/yY1XcyBdBCYKW08ZDLHZpjSaDYdUoJ6ebfBZD/8BPU60FLPzqF8QTG1Lpovufsb0PVkuA0TVY6ki6wGy+cTeecvfLQPQ8iFbS9p2GDvFA786o/0CWgLx5mde360va5XKWAyi8Hg1rXIomh4qSP4ziwAKe7ARsjzkkzfWXGLgNKzdw1LEO3qAljrnu1tQPkgwluLm0H3otCGeQWuzuuAnpwZGszLLgFGAEHMypP2cd5doEm3mZMit2BCautsXnZuyQPri+eEWp6t1Xdae939XMpouzhlMNvAJm2IC6KhLsq7Ji7erA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEodEYO9+mLTTYwln4jMIKZDYM2iI2UzxSLjaZNcxeg=;
 b=kblV0tOmY5VRZmE2RfS7QrsAwUx0lmLUycCkjce9PK7gCVkGYYali+F1JkF/HicehdtOVgfFi/5HAX/PfJOhgn5F513+RsJs5K7s5XOilMgv7ZXdCF/G4wtN2zYrfn/pcCmPymHc68ch71uoPaSkUBAnf9NY9OESVtu+hyKbljg=
Subject: Re: [PATCH-for-4.16 v2 1/2] configure: modify default of building
 rombios
To: Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
References: <20211104161121.18995-1-jgross@suse.com>
 <20211104161121.18995-2-jgross@suse.com>
 <24964.2546.976689.929650@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <758e53b5-c967-fa3d-50dc-b547e2736f27@citrix.com>
Date: Thu, 4 Nov 2021 18:12:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <24964.2546.976689.929650@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0107.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcd69a70-4cf8-4763-3074-08d99fbeb82c
X-MS-TrafficTypeDiagnostic: BYAPR03MB4293:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4293318027914794FD917775BA8D9@BYAPR03MB4293.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g0XIElnkHIhRhBdFWqyMihml0q68vYEgNh07B99yTbr0uSKlgxfg6JBTeHpKk3Dc64vxncT3gLT/7F8mV3G6LMjw5lBFxybS680jvynIt+brUEwaiBu16B6F3nhxcQiXYSsXnHEMJepiEiCMmKxWQrYjpmPAdfI34vd1PxTIGw9IR5kMwIUIScGbTg/r75QAet4MWgPBEzo4Uh5cRNuKBylRa5sChwYtP4IJsYoVp8s6PiUd3KLx8rRCfXeGDnHk2GT9+56n5vPxtZW+cT8Jr/h1i6C9giOfkBPwga84148qiTFLumRENjUtpG9xzJbSNB4xNtuOA7NjpNQdd8LG/PnM/2hsocXo4MLre1grezuiX6/PmG4w4010jvvYXPybiCzOh0qiojtGemCTf9Sl1Ec8GdbTlss8/12IakxMm0LkMKENOkvcVoT3G3z8rpoQnvLJ3sbhm5ovBlP1+D7npJ87ibUtw3YRVKk4Xnyp5RlPvNo5Beq/1QeiCkb8WCG4mixorwRaPqI55pzEX+3JODinF+ntYhWO6JLvrTyBDw84ehf4QZlNVD6DPzSxczUfa18ywCrdh+WnDGZzDu+v/p1D8C1ROY8iM/Y77jVqUPFGxNtIwbEwfafFG7HOUuvdht6Hl3sNcgbxbSMHUwO6CHOwAbhQXCFT9G6fYSAAukPdP5I/YWERVgT5SqLkupYSDoU7Tli1INskcjtXzt1IuGYX6lx3AH8uZeblh+OS/M4Rl5U3V12s30itmn0yPSXZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(6486002)(31686004)(508600001)(4744005)(8936002)(8676002)(16576012)(110136005)(316002)(2906002)(186003)(26005)(6666004)(86362001)(38100700002)(2616005)(956004)(53546011)(31696002)(66946007)(66556008)(83380400001)(66476007)(82960400001)(36756003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXpFZFNyRzh3RjdXWTliUmVjMnpzMm5kaGxzbVRNRDNZN0o5YklOQ29zRXlt?=
 =?utf-8?B?TElZZUhjVXZKZlp5TlVRbjJKRkpOYUg0aE91ejlnM1hPWGJacWd2L3plQkQy?=
 =?utf-8?B?emRCQ2ZWd3RNelRDeUJTMlUwS0tic1YxSHhPdmVQQ1B5Slp4Ry9FblhMcWFO?=
 =?utf-8?B?Q3lkV2VBRFZVNkhTWGhHSThIcC9JbEkxd0RjbnBPYzc5RHhNZFZ3WlJvQzdt?=
 =?utf-8?B?d0cwY1A1bWMvVVlmbzYrN1h5U3dqYng4ZTcrSk56U1oyZWdMdHJzUis1dGZU?=
 =?utf-8?B?bW1kTndaSFpXa1lpU0MzVUlaMTVnbkc1eFVwRjVSb3B1VVQ0Q2FVSEg2b0Nm?=
 =?utf-8?B?b2tPeXZiNDNqWk5VQWtyS043K1JwWVd3Vmx4bXlKQ3N4RkJhRU5vMjRENXZB?=
 =?utf-8?B?dFNtYVFUcW5sQ2RPRnJZbEpNVUk0dXIvTFlRNEZwdnF3amEvSTl4bTZYVGlG?=
 =?utf-8?B?MzB5dm5lSzlDakxJQ2tmYTByb2N4WFptcmVQOW5qOVNhQmVLY09xK1piOVp3?=
 =?utf-8?B?VTUxQys2aU1CM0JmSEJwb2ljU1BPb2xMVm1lTlpETVorQzAyeC9sZzBmN1BS?=
 =?utf-8?B?QVovc2I2R0dnV1MzRklJZkNFSjJYcVhSeUY1TW0rd3FZV2JVaG1NWGJpN0xR?=
 =?utf-8?B?amtURFRvdDhhUmpJTFlQQWZBTEpsbGo2cVhTT1Rkb1Y5blBLazBQcFFoS0R2?=
 =?utf-8?B?VlRtNHFFL0pVMldvUmY4V1E5NTgyYjIzTS9lbjM2bE9wRVd3UXJ0a2xWamFi?=
 =?utf-8?B?VmU1a21IVTkvdm5sZkYxNG82cFZ4NUpoYWhpRnlwdnVOb1NYbUtLKzNVMkpY?=
 =?utf-8?B?WmoySUh0V0lXemcvdU9WeXo5dlBLaFVKdXNaVDRZVGxCSUNDVW50RER5SlpS?=
 =?utf-8?B?Q2N6OHZVbFFZeE5qV2hna0t6WU50R1NOdFJtNjd4WXNiMlJEQ09qR1U5bnk0?=
 =?utf-8?B?U0hhMlZmaVVPQ2RTbDExd1hhTnlBWWRFN1B6Q0xIME9zT3dQZ3ZZVXRXQ2Rt?=
 =?utf-8?B?VUNOQjNTY3ZCZGJyZnJLR0g1Y3hlMTA0VVd0empidG4vbXhDWkk2aU5qVnhK?=
 =?utf-8?B?bXJBb3RmK3dHVkVQb2Y3Tkx4dkluQ2owSzRVc09vOXdMeXVkbmdZeXRNeUR5?=
 =?utf-8?B?TmU4OTFXcTZhcWJwSFFRRlV6d3VFRUtGK0g5VzdCaFNxdG82S1BLSHoreU81?=
 =?utf-8?B?OHo5dy91eDUvaGVEbDRPU3l4UW5xOTZqQTk5NzdteDZvejB4VG1wKzdaNVJS?=
 =?utf-8?B?T01xTlhsQVVVcnU5NFFQdkNuMzE1NlNTdTljZVRSR3B6MWNjLzRZOGtOdEVp?=
 =?utf-8?B?RU5PbVF0WDYvTkVYTjh2cGJBZXVYU21nSjhzNm9rK3FPWEdmNlMrZ0VvQ3Fz?=
 =?utf-8?B?eE4wUXFCdTRWTFEyc2dLM3F5QUhiTDJzb0p3RDNkSFp0eFZvdG8weFVyemxV?=
 =?utf-8?B?Z2ZmM2JqYThuWm84V2xuU1FGOHdYRjFZZURLdzNxWlNVclI4Z05xT3QzTnVF?=
 =?utf-8?B?VTBtU2FDZk1KT1gyRlQ2TTNTMUpDbUdmaXFpemFnQWlhczNZa2REZkR1dHJn?=
 =?utf-8?B?ZkNqaHVORng0ekpNQWNQSFJHYkJsQWc4bXR1N2JBNEJycU1oQ0ZKaWF3UGN0?=
 =?utf-8?B?VFYrOUt5NHdKbFdxbjVyblJTejdXRWg0UDlnZWE2VUxON1V4eWhQeVRGejFR?=
 =?utf-8?B?TUJ2b3NuaFpqTHJQVjd3aDRVM3NyT3pPNk1wVU9tMVpTUzhOMnhmQlU0TFgy?=
 =?utf-8?B?aERTUlFpZFl3eVF6bUxhSjlLZlEwTGxmeTI3UzZOd0xTMHptRVl2MDJrejd0?=
 =?utf-8?B?MFZsaTRWcTZnSFRibjVnUnNMUWRRbWk5QVBKVXEyNVpEd0ZzMGEzazNMV0t5?=
 =?utf-8?B?dUM1UHhKNXlJa2lJa3pQVDF4bk1OUE9KUkRaNjJ4Zm9rZEV4SjVwVE9EdWtT?=
 =?utf-8?B?RHRlS2VMRWJVUkNycFpZckhoVElkRlhSK0tkeXdrZGFIZ0syUWRrNlFFdUpI?=
 =?utf-8?B?WndNbnN6cmp2OWE4UU1HUS9uQ3NoWDhHOHRyaHFlazMrc2ljaGU5S0Q4RDhl?=
 =?utf-8?B?NnA3OEFJNjBaQUJrSXBKbUxWdDVZaEg3clVYTzVnT2ZyTXdpWUxTZ1lIVDZU?=
 =?utf-8?B?TnBsenVuNU81TW9JSXlza2Z2R3E3b0VKa0lyS1RTd1NWSW45MmlHUHpDSURW?=
 =?utf-8?B?SVRWK2l4clc2QmFhZkJxMXBMOWFBb21oUmtpdjZPQStBRWsxZW96OEd2V2pu?=
 =?utf-8?B?cEtFUW03TmFNSXBHZ0FoWlU1L21RPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcd69a70-4cf8-4763-3074-08d99fbeb82c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 18:12:53.4101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPVukNfwiuHRzr4RpdrOrc0SZNT41IHu7bVRMR7AWl1lJp/9Cso5MyzVkifVsvLSiMGhrLlTQeezcdRHGfQK1rl8gC0nBaOD//peLAmXEVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4293
X-OriginatorOrg: citrix.com

On 04/11/2021 16:27, Ian Jackson wrote:
> Juergen Gross writes ("[PATCH-for-4.16 v2 1/2] configure: modify default of building rombios"):
>> The tools/configure script will default to build rombios if qemu
>> traditional is enabled. If rombios is being built, ipxe will be built
>> per default, too.
>>
>> This results in rombios and ipxe no longer being built by default when
>> disabling qemu traditional.
>>
>> Fix that be rearranging the dependencies:
> Andy, you asked for changes to the usage messages.  Are you happy ?
>
> Thanks,
> Ian.

LGTM.

~Andrew

