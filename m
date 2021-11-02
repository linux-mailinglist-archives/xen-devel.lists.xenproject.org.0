Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C853442B9B
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 11:26:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219969.381042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhqzc-0003Qg-VY; Tue, 02 Nov 2021 10:26:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219969.381042; Tue, 02 Nov 2021 10:26:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhqzc-0003Ou-Rx; Tue, 02 Nov 2021 10:26:12 +0000
Received: by outflank-mailman (input) for mailman id 219969;
 Tue, 02 Nov 2021 10:26:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XxgO=PV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mhqzb-0003Oo-BM
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 10:26:11 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4bae8454-3bc7-11ec-8554-12813bfff9fa;
 Tue, 02 Nov 2021 10:26:10 +0000 (UTC)
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
X-Inumbo-ID: 4bae8454-3bc7-11ec-8554-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635848770;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fP9GhfUpuHXlRfro8yweo9DNQmJiQHuZqbQllEmNGEU=;
  b=M2z/h7p4ItcAVR3E8/i5M7cNwndDMaoW4w0vNnnlOQ438OQ9S2AIzrtj
   PEVTmF2F1PYc9v65YGZf0StjtBqjIcuyTDpeMz2nceZgJX700KXKiQU+5
   t0zKeBiutpNhJ8VEC85FKfv3G+pGVo5DUQD0wggvuK8b0oJbt8RJ9+LXR
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: H//Xupu3GSYFOCsZTdr8mi09v083DQVuCjRqZzieSIpPyiY+Ll2wWuXC0MDF01WPxKjyG/tgmk
 1T8MOhGKSrscD8IM3byPnUVM2uDpMqiuXgCwstOHE+zXum+6/ThMH+uwIG1ngyqaQYYqSADxOt
 wglEDjPnMOT8lLlOX/qD56wQuBpZ955AnMLBKzjR7IElsP4pyn9sTyBFER0Cj0Fk3nQZW/lEq3
 S1KJhPXsUo/uZ6tguDwgfr0l4bT19CaokCqAFD8M5Q04AcJNJin/Qz4MFAkUjGkEh6Ik+X6Xew
 1dbxM2ozXNJsl2+EICviINL8
X-SBRS: 5.1
X-MesageID: 57253776
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4oV/eKgklI0klmKSGcNfs+ozX161jRcKZh0ujC45NGQN5FlHY01je
 htvDDjQOv/eZjf9KogjbYq1p0sB65/Qn4AwQQVoqChjRSwb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cw24Dga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1mrMzpaA1xMJbildoMVEECAi5vFLFZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t2ZoTRqmBO
 aL1bxJsMEucIA9hK24XK7EXh8KMq1vYMD9H/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 nrP4mDREhwcctuFxlKt8Hihm+vOliPTQ58JGfuz8fsCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySWosLVBkPi5iTe51hFBoQWQ7ZSBByxJrT8yB/JX0kOFjB6RtEYpchuHy0lx
 3aVgIa8bdBwi4G9RXWY/7aSiDq9PykJMGMPDRM5oRs5D8rL+99q0E+WJjp3OOvs14CuR2msq
 9yfhHFm3+17sCId60msEbkraRqIr4OBcAM67x6/somNvlIgP97Ni2BFBDHmARd8wGSxEgnpU
 JsswZH2AAUy4XelznXlrAIlR+nB2hp9GGeA6WOD5rF4n9hXx1atfJpL/BZ1L1pzP8APdFfBO
 RGI5FwAvscMZiHzMcebhr5d7exwlMAM8vy+DpjpgidmOMAtJGdrAgk3PSZ8IFwBYGBzyPpia
 P93gO6nDGoACLQP8dZFb7x17FPf/QhnnTm7bcmil3yPiOPCDFbIGeZtGAbfNYgRsfLbyDg5B
 v4CbqNmPT0EC7agCsQWmKZORW03wY8TXMur9pcIKrbbSuekcUl4Y8LsLXoaU9UNt4xel/vS/
 2H7XUldyVHlgmbAJxnMYXdmAI4Dl74mxZ7iFSBzb1uuxVY5ZoOjsPUWe5ctJOF1/+1/1/9kC
 fICfpzYUPhITz3G/RUbbIX889M+JEj621rWMnr3eiU7cr5hWxfNpo3ucDzw+XRcFSGwr8Y//
 eGtj1uJXZoZSg1+J8/Kc/bznUiptH0QlbsqDUvFK9VeYmv2941uJ3Cjh/M7OZhUex7C2iGbx
 0CdBhJB/bvBpIo88d/og6GYrtj2T7siTxQCR2SCtOS4LyjX+Gan0LRsaufQcGCPTn7w9YWje
 f5Rk6P2PsoYkQsYqIF7Cbtqk/4zvoO9u79Aww14N3zXdFD3WKh4K3yL0MQT5K1AwrhV5Vm/V
 k6Vo4QIPLyIPIXuEUILJRpjZeOGjKlGlj7X5PUzAUP7+C4oo+bXDRQMZ0GB2H5HMb94EII52
 uNw6scZ5ju2hgcuLtvb3Dtf8H6BLyBYXqgq3n3A7FQHVub/Jol+XKHh
IronPort-HdrOrdr: A9a23:iGwV/KsGT/jWAIsBo42LtGgf7skC7IMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLnAbV0gj1XYANu/yKDwJeOAsP+teKH
 Pz3Lsim9L2Ek5nEfhTS0N1FdTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJqpmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87isIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNXsHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa13ackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmP29yV0qp/VWH/ebcHEjaRny9Mw0/U42uondrdUlCvgslLJd1pAZFyHo/I6M0kd
 gsfJ4Y042mdfVmH56VMt1xNvdfOla9Mi4kD1jiVGgPNJt3c04l+KSHq4nc2omRCeg1Jd0J6d
 L8bG8=
X-IronPort-AV: E=Sophos;i="5.87,202,1631592000"; 
   d="scan'208";a="57253776"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kAUOZKsMwwm7d/86z64gP2PH/n7tYjHsBfnBG25M/2/OgX9Z/ANrnc+Am/o6JS3qcsYINuiJ3p9M70s+9+TC2gWzKhcQEKKjyqJAF3/EucVs4lMmn8jphF6y/qyzdYorT3+IkR5X1rNQdSqjzHpnZ2Hj5R3e+/clkeIAsJHcWshjQjFIT85ZflOZ1RfLGeLdKgVj2NYNQtFmNX1xb+ILvp+BM1FbyhaNQYo8ikrsiOMwfYCULi5jUyp2egJxoA891/DMYS1w2Y+pj308fNRrd95P0adY0yO1tFvg3SqbFnI6JQrSPWdCfki1vmdXGDCeIlih+Oe0LA5llDjEa7PJvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKzL8tHt5zq+OtKw0WawyFTqW8we2cxtopue/iv5gcE=;
 b=Psu4KAY52D9yQNjNC2nqKXFwByXrRwLsiAV71EghYyhAZdZpWUidguc4yEC9/4/DFOCxKs/VSD5jw2hzWgbU5HxPhLUvKM/0pXGCGblz1p+QRQUdO+EDotGlPE38aK4YZSG6urM4TgbSg7vZlbJl4rU0hqulG2dP1myQ1+pvu5mIpjvXPEQAa7I/DNPHGJ9rlj2b0AzdqPQ7cFyM+DH4iIzYLk8NzA/DPf+2eVusVXpiK6Swh/cg6g9CgTRsVzqJjELNru/MXu7EK1w3LP8SPBuhdYTuQg2dtTRv9E09zYsfqxRpKTBsrxKKAALy2QNpOlSoXatd4OUgg9cq5tsF0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKzL8tHt5zq+OtKw0WawyFTqW8we2cxtopue/iv5gcE=;
 b=HdWYF2F3u0/vNOXnUJcA2RWvaJ0xy0uIghaogaap7LAhicIDzvA8ZVln0k+BGe84xRxj9F+boHmZbzJsLmw7iJreVCBIKR1ccFmyC7Dt2By6rBZFs1ebolQlPVLQykKS1SVbIGQZNBEfzDYQFEOidiJVwXZfSI55KpeS0/nL9p8=
Date: Tue, 2 Nov 2021 11:26:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH v2 1/3] x86/IOMMU: mark IOMMU / intremap not in use when
 ACPI tables are missing
Message-ID: <YYESOQU4M4E/MpPP@Air-de-Roger>
References: <09137aa2-649f-08fb-ba68-75f8eb16fc63@suse.com>
 <efe34081-c813-0e37-175c-8553b395e6d9@suse.com>
 <YXLeMsuykEhSdfUg@MacBook-Air-de-Roger.local>
 <8beac790-874f-3953-6cca-677c9bddfcac@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8beac790-874f-3953-6cca-677c9bddfcac@suse.com>
X-ClientProxiedBy: PAYP264CA0025.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:11f::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa76427c-724d-431d-0f65-08d99deb2e21
X-MS-TrafficTypeDiagnostic: DM6PR03MB5338:
X-Microsoft-Antispam-PRVS: <DM6PR03MB5338E848CA1AFD9D1B6EAF2D8F8B9@DM6PR03MB5338.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VI4FStEyI8u3y1tKoM4jFj/YRQz0wu2tydkHzmXya+dIg1DQ5u0VfJYQfSCNd+/E31FCLfTetrNyFxcQQQYDRi22HVhvwA4N7NmL8BghyA7l6rCrkcbc/SqdRqvtYgCLaTqIjBRHs4fmdWWBxpsJ27oIpD1UKHSMhgeBXmftgrQiJyNYvyv5GInz1+L11IMaDfeiT+K4ILeNhiw56+gasZz/pLqDs/Uaa1nHvuxFzMkElx2Cv89kIsfbAL9Ea0KpVhDPPw33Q7BrvdFSjYco0+3wVxWiwHP9SVDfhZRV2UA2Ule55ImZitdnKiEKgz9uBw6C/G6+YXPeBDCD1ls41GAjiTk31m69ZE77Nu+y9qJ44SwM8D0J5o0VWc9D73heoqlG94mVmJQg+NjQNCgmJwtOSe4OFfwRfZue0DYp/4xWnTw1yRxQoDrPOAfGAvYDuiT+2PrEMj1bwJCEWgVEA11egj3GEnroNsFWtO9nonLIYRFyI54m8s1aBSOL6aLjpHyoAliJ8unipnvb26QOJM0E3OpfE3UsxZsLRybk5uvIAU5rh7hxejnrEK8LVDSwgwMpt6XB/+JelQOIS6fHiraQLsgaAxWaxdKJ4Kta7O7iUDfRYbtvAgwej/BK6Sc5SNBHfBhhJIpd7MvOFdth3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(8936002)(8676002)(4326008)(956004)(316002)(66946007)(6486002)(38100700002)(53546011)(9686003)(508600001)(26005)(66556008)(5660300002)(83380400001)(66476007)(54906003)(85182001)(6666004)(2906002)(33716001)(82960400001)(6916009)(6496006)(186003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3RDT21hRWpuZkxYWEdZbVdwc3k5OEQxdFdsUVhYRFpFV3ljdkVJVyszUDEw?=
 =?utf-8?B?V3p0ak9QOGxZcVJsSFNzZVVGY2VoRTh5QkV4YytzMG10MUgyaFR2VE1SaHdE?=
 =?utf-8?B?b29TanY1KzBUbUZKclRCd09UUHlFUFpvVjNqREI1R055ZCtMQnBBTld1WVVw?=
 =?utf-8?B?V0Q0ck5MVExpZlFJdGZjNFBsKzBOM0RQR3J4ZkJHczlQSTNqa3hVTWErNmhy?=
 =?utf-8?B?c2hmU1hBZ3hZMFdDcUthY2tGUGw5emRMdnJXTk5aeXdKZkMyNFk5TTR1UDhp?=
 =?utf-8?B?OE5pVVg4ZWFLbjVJVU1xenNiTllSMHhOb3cwaHJVME9oMHZTVWVTNlVEMVVr?=
 =?utf-8?B?RDRLRFBBZE9Lb3dpSTNkRVh5Q3RkemY4ZXQzRmZpbCtUWEh1QUdjTmhWdWhr?=
 =?utf-8?B?OWVzYS9mOHlrT1VWaFprdlVTZVRxRWVEb3A2VXhoTFZ2LzVFNjVSN3VOTktI?=
 =?utf-8?B?QTA4Vnp4YkJRaHFpelh3YnNLSDAvNktVUUhwL0ZHZkdsQnpicUc0M2RDSXZy?=
 =?utf-8?B?OXdFNHo4NGppR0ZPY3VhcnVnMFFnVlRza0lZVklJOUlwUkc2MlNSYTQyZEhm?=
 =?utf-8?B?d1FQK1pBUmFsTzB5TXFpU2Q0TXVHSEYzZHNDYzR0OUxHMnBEbkZ5UmowRkQz?=
 =?utf-8?B?VkQrZ2lqcTR2K1NjL2Q5Y2lISGtIeFdqNzBuNFJOcm1hSDBna2d3WG9BZjdy?=
 =?utf-8?B?MU1INlNacGFpNUVLcldGaENYMGN1VXhzUDk1Z1pnQmpqWnRFUnd0UHF4RlNU?=
 =?utf-8?B?NEpaMjVuVWhSeHo2WW9oTkxESzhHMnYrbkl4VTQxYnFRUlBWYlpPNmhocml2?=
 =?utf-8?B?UStBQmpmZDlwMFlXcXFXVURBR2RWSE5zcmNsVzRSVDZnR1dyNEEzMlFxQ2hF?=
 =?utf-8?B?TG1JRXI3UUkyQ25mc09wYld6cEJmN3Vocjh3L1d4c1U2bGhVNW5oeEhZYTc5?=
 =?utf-8?B?bE83dWQyQXQ5SWI2S3dtSVplL2MwamVhWitXaVQ2ZU1mdkFBZjBKZHkzMys2?=
 =?utf-8?B?TnI0T0lWUWVYd3Y1SWRqYTcwSUdvMUlxQzFjaFNHaE5tczhneUZoVVVIRnVP?=
 =?utf-8?B?MHRhUmlaNVhpcDlPbndicHJCQ3BMRzlNaGV0Nm1Ta29oamJEWXh0Ly9LSlRj?=
 =?utf-8?B?WGtpVDN0TC9STXpnUytRUStXWGRpSEhheG8xVWMrNHFPZHBONFM2Z2VpSWR0?=
 =?utf-8?B?T2RyeUNRTkphMEFhWmNEaEJGYllNeFlnNHhYVHRTa0hUZi9ac1cwYzhoZlB0?=
 =?utf-8?B?SjhGQXhvSTROb3dPTFRNV295ZjZwdFR1S3FBbVIycFByWE1pb0M4VDZWZWxw?=
 =?utf-8?B?MDlXYjB4NVJXMGVTalRDSDMwOTZpYzU4cHBObHhhSHEvOUZkNmw3T3FISkZl?=
 =?utf-8?B?Ym1IZU9wOEtLV0NERnd5dXNHZGd5ZGUreUNJTnV2NVBpc0Y0TitObXh6V0xy?=
 =?utf-8?B?S09GbFZyS3hVa0dMN29ZV3FSNVZHbHpmUk5iWUhMZ1FtK095Z0lvTVhuS09V?=
 =?utf-8?B?SndiZGVoMEEwL0tHZ3prMzQ0Yk54RS9aVFFYbVNmZXZEQnd1bjlrQ2tJZGs4?=
 =?utf-8?B?YThQcmlPUm5YSndKSCtpWm9WamlZeXBESWtRWmdYdExIOGFFOTNicHhSUHJJ?=
 =?utf-8?B?WTh1WWZoMVpmbnFjWUhYaUJHTTJ6cjd4UisrSGZVeU9CSHBXNGVXckhHaHJJ?=
 =?utf-8?B?TDlJNTZUYUhQZzRERnRaK0ZxaVIxT0k3NXAwNGw0dUhDeWU5R3VyTmJsZm5D?=
 =?utf-8?B?UXprWWR4M1BDR1pwdEpURi8wSGx6QWgwc3BPa0c0aUNUTkpGQ1VaK1c3SnM4?=
 =?utf-8?B?SmJBcDZ1bUc1UnhsWDZzUUJ0ajVUV3pBY0tzcHFDYjNsWm5JTFdWRmwxTlY2?=
 =?utf-8?B?MDAwcUlwdCtBQ3BUeExGcUluQm5TdzBzZEFUZ0lxS3ZYVHhyWWJVbGtpMDBu?=
 =?utf-8?B?d3JTd3ZHNE9Zd29oMVI2dU9IeFJ5Skx6TGlYUHFZZmZBV2FpY0tkcUVhT3ll?=
 =?utf-8?B?M05veGV6bXMwMnBLVHl6YS9IaUgyeEQyNTFpVk9HZjVabzhONTY3WXc4U1Y3?=
 =?utf-8?B?eTRGZTljT2IrWC9OcnF3SFY2bW02NElONkpUOEU0WmZtMENvZDMrMXhZVnh5?=
 =?utf-8?B?aEM0b2REcG9EU3ZqV015Z0ZrMk1GeGhYVFRqWW5JT0xMSW9wZkZ4SVpXc3di?=
 =?utf-8?Q?hIQVnGJJQhXljon4DRXoadY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa76427c-724d-431d-0f65-08d99deb2e21
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 10:26:06.7614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ojojhr3MfB3J1ZzcJ70cVAv5yih7/X4CW2VZYoCoXwJFLeSCAWZzIkuQY5AA7VYFqinRp6ilct9xRwMO9nQdMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5338
X-OriginatorOrg: citrix.com

On Tue, Nov 02, 2021 at 11:07:25AM +0100, Jan Beulich wrote:
> On 22.10.2021 17:52, Roger Pau Monné wrote:
> > On Thu, Oct 21, 2021 at 11:58:18AM +0200, Jan Beulich wrote:
> >> x2apic_bsp_setup() gets called ahead of iommu_setup(), and since x2APIC
> >> mode (physical vs clustered) depends on iommu_intremap, that variable
> >> needs to be set to off as soon as we know we can't / won't enable
> >> interrupt remapping, i.e. in particular when parsing of the respective
> >> ACPI tables failed. Move the turning off of iommu_intremap from AMD
> >> specific code into acpi_iommu_init(), accompanying it by clearing of
> >> iommu_enable.
> >>
> >> Take the opportunity and also fully skip ACPI table parsing logic on
> >> VT-d when both "iommu=off" and "iommu=no-intremap" are in effect anyway,
> >> like was already the case for AMD.
> >>
> >> The tag below only references the commit uncovering a pre-existing
> >> anomaly.
> >>
> >> Fixes: d8bd82327b0f ("AMD/IOMMU: obtain IVHD type to use earlier")
> >> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> >> ---
> >> While the change here deals with apic_x2apic_probe() as called from
> >> x2apic_bsp_setup(), the check_x2apic_preenabled() path looks to be
> >> similarly affected. That call occurs before acpi_boot_init(), which is
> >> what calls acpi_iommu_init(). The ordering in setup.c is in part
> >> relatively fragile, which is why for the moment I'm still hesitant to
> >> move the generic_apic_probe() call down. Plus I don't have easy access
> >> to a suitable system to test this case. Thoughts?
> > 
> > Indeed, that seems it could go quite wrong, as apic_x2apic_probe will
> > see iommu_intremap == iommu_intremap_full (the default value) and thus
> > could choose cluster mode without real interrupt remapping support.
> > 
> > At first sight it would seem possible to move lower down, but as you
> > say, this is all quite fragile. It's even made worse because we lack a
> > strict ordering discipline or any kind of dependency checking, so even
> > if we mess up the order it's likely to go unnoticed unless someone
> > tests on an affected system.
> > 
> > While we can try to solve this for the upcoming release, long term we
> > need a stricter ordering, either as a comment, or even better enforced
> > somehow in code. The x2APIC vs IOMMU ordering has bitten us multiple
> > times and we should see about implementing a more robust solution.
> 
> So what's your thought then: Make the change (in another patch), or rather
> leave the code as is? I'm slightly in favor of making the change seeing
> that you agree that the rearrangement looks to be correct.

Sorry this wasn't clear, I've rambled too much: making the change in
another patch would be my preferred option.

I still wonder whether we could place some kind of checks to ensure
the logic of interrupt remap vs APIC initialization is executed in the
right order, but that's not release material.

Thanks, Roger.

