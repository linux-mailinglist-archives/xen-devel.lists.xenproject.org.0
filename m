Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B16F461B0F
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 16:35:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234636.407218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrigp-0005JP-7U; Mon, 29 Nov 2021 15:35:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234636.407218; Mon, 29 Nov 2021 15:35:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrigp-0005Ft-3W; Mon, 29 Nov 2021 15:35:35 +0000
Received: by outflank-mailman (input) for mailman id 234636;
 Mon, 29 Nov 2021 15:35:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMap=QQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mrign-0003uH-2A
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 15:35:33 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbde06f6-5129-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 16:35:31 +0100 (CET)
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
X-Inumbo-ID: fbde06f6-5129-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638200131;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=ovizBmOd9afB85beG6l95WMGrI1FjJYBuKIsdHrpGHU=;
  b=IuplQhplFiKS2Hsna2ZFt+dLqrHQeYCPMS4/vxmQZYboRfzjxO2t9Ivc
   NF5Dx5xYXC6rQFXiwmP051KpTeCjStl8VLYvY837G796uLxjqrvq2QFfC
   L1671B+lp6tJsHSe8NC/Pw/Pr2joWyk/JtRIMjHpZ4kBD4QqCe2E+kvmw
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 2wFeSJoaWZOWTcUp84o6rzHFkHw0OHf3YnH/DTriRNjNGAYwowpCFlWxcTPVlUfTmVnMRDlFdK
 AdSckZyba3lo3I36NRJzJLxPPYARErfvRtFqrX9Q4EQ9FpIe5OsMXJB2KNXDFNXSzJ20vNw2Mt
 OoR19ld8LAMhcBDGdGItHvU9kW7DTOhNPeIFUTYCmgcYkV37I1tsGqzA+IWyOuPy0oLMJ5QbKg
 9fkvcJLWR+8o0cc+PcuaTVxtnpVsJQPQkL9d7ehljTpvtuZbWxvwCgssOWW9DCKx54z6QOwbxQ
 x4SlebqDvsx4p/omqrfL0E3n
X-SBRS: 5.1
X-MesageID: 59208280
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ETcTOKgs/2xggZFm/DMiZgjaX161jRcKZh0ujC45NGQN5FlHY01je
 htvDWGBMqnfY2vzfN0ibdm/8E0H65SGx9Y3SgNqr3wwQywb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cy0IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0SuISgZwMFEJHUxu9FdBZ2LixiM4BJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t15oWTayOP
 6L1bxJDYjKDbFpVJ2w5VpASxs23nlviLGJX/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 mPZ/UzpDxcCLtudxDGZtHW2iYfnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM/pdI
 UEJ/islrYAp6VemCNL6WnWFTGWs50BGHYAKSqtjtV/LmvG8Dxul6nYsETNZePIimOEKXWIhj
 niGse7kGTJCv+jAIZ6CzYu8oTS3MCkTCGYNYy4YUAcIi+XeTJEPYgHnFYg6TvPs5jHhMXSpm
 m3R8nBi71kGpZdTj/3TwLzRv967SnElpCYR7x6fYG+q5xgRiGWNN93xsgizARqtwe+kori9U
 JosxpD2AAMmV8jleMmxrAIlRu/B2hp9GGeA6WOD5rF4n9hXx1atfJpL/BZ1L1pzP8APdFfBO
 RGI6VoLuMAJZyL6Mcebhr5d7exwl8AM8vy/CJjpgidmOMAtJGdrAgkzDaJv44wduBd1yvxuU
 XtqWc2tEWwbGcxaIMmeHI8gPUsQ7nlmnwv7HMmjpzz+iOb2TCPFGN8tbQrVBshkvfzsnekg2
 4sGXyd8404EC7OWj+i+2dN7EG3m2lBnX82r8JIOKbbYSuekcUl4Y8LsLXoaU9UNt4xel/vS/
 2H7XUldyVHlgmbAJxnMYXdmAI4Dl74mxZ7iFSBzb1uuxVY5ZoOjsPUWe5ctJOF1/+1/1/9kC
 fICfpzYUPhITz3G/RUbbIX889M+JEj621rWMnr3eiU7cr5hWxfNpo3ucDzw+XRcFSGwr8Y//
 eGtj1uJXZoZSg1+J8/Kc/bznUiptH0QlbsqDUvFK9VeYmv2941uJ3Cjh/M7OZhUex7C2iGbx
 0CdBhJB/bvBpIo88d/og6GYrtj2T7siTxQCR2SCtOS4LyjX+Gan0LRsaufQcGCPTn7w9YWje
 f5Rk6P2PsoYkQsYqIF7Cbtqk/4zvoO9u79Aww14N3zXdFD3WKh4K3yL0MQT5K1AwrhV5Vm/V
 k6Vo4QIPLyIPIXuEUILJRpjZeOGjKlGlj7X5PUzAUP7+C4oo+bXDRQMZ0GB2H5HMb94EII52
 uNw6scZ5ju2hgcuLtvb3Dtf8H6BLyBYXqgq3n3A7FQHVub/Jol+XKHh
IronPort-HdrOrdr: A9a23:tvtaiam7nJCo30Gcg0aE5ow5zdvpDfO2imdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPpICO4qTMuftWjdyRaVxeRZg7cKrAeQfREWmtQtt5
 uINpIOc+EYbmIK/PoSgjPIaurIqePvmMvD5Za8vgdQpENRGttdBm9Ce3im+yZNNW577PQCZf
 +hDp0tnUveRZ1bVLXwOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mIryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idmrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT6PDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amIazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCT2B9vSyLYU5nlhBgs/DT1NU5DWytuA3Jy9fB96gIm3EyQlCAjtYgidnRpzuNKd3AL3Z
 WCDk1SrsA9ciYhV9MLOA4we7rFNoXze2O4DIvrGyWeKEgmAQOEl3el2sR/2AmVEKZ4uKfa3q
 6xFm9liQ==
X-IronPort-AV: E=Sophos;i="5.87,273,1631592000"; 
   d="scan'208";a="59208280"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lljat2hlHMCcJxWYiHJeVYWXv0HGszZKq2wxSGS2h3RuNgBC1/7Qt+eeAOcYVrx9RJNyVqSfzjk3RAzUHL5B5vFYPCz8TEo9SZBMIwF8u6unntZBs4r4NhDSlh5fyHqD5lUIOl4wFDrzWm7e+cakZnA2pC1cWo3rt2Yz7Pz70VoVu/6T0fEpFkJjkp74NUqGnr+syyoVfhlMbIj1WuaM8AdKIUhI3+716xVwlGZF0g/cWmkJ8J0ddhaUby05lU1MoxWH4nBjrqTl5g9rwoJWqScHMapZ4Vky46rUN9Q25oAYdC565s2HgczDe/uS0OOvAmXvsY9S0q/e3Wv3Ftn5dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dj2zYVjV9zE+r8tX/vZbHlx8BZRHwcEypBJvmHSoHAU=;
 b=moebZdfD4hlYcWKwV/PBLRVMcIj6vblKmYliPkc7G0aXmjsjoM0QfZWcKTNMGvlXx+7VxEHrpMq9XkOaAUNK8WyG3x7o/N7YUjRBnqdlQeogy9WEmV4v0QnHHEvG8sIxAQNApgAqi3xPf4NVMOz/I0n4PFOn/fVCZdaT566b0vvgDv6TD8fcLJdXA++f626c0KjtN9IJp1OB7/ekxCzuVbABVf0LkZuU2ZQ3/FdZmPU2ScgnT3iNs6NYGiUv9ELVwWNFGksghAy/8vEdJvZkUdFjG78tXrE/JDTDaqK+OywFKWKMcSMZLDegup2eaQ2OowzmBY1H9Jy/iREWqz3DAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dj2zYVjV9zE+r8tX/vZbHlx8BZRHwcEypBJvmHSoHAU=;
 b=toX2SEoEHaQY4jjwFstBKv2qc/gJD0T8Hzy9ElIHMNYrhNidee+DOJwDSlyUQMWeZvVZ/mbEqAaSxwNZ93YEz/KP37GPzzyM+VdKJ6xYCGz+R4sbLZhuRJGm/mizm1O5Lvd6KCvCC7X3XEBXZP11+81M7CY3AA/MCad/Y6DG+K0=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH v5 04/12] libx86: introduce helper to fetch msr entry
Date: Mon, 29 Nov 2021 16:33:47 +0100
Message-ID: <20211129153355.60338-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211129153355.60338-1-roger.pau@citrix.com>
References: <20211129153355.60338-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0148.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d423a56-6c04-4b7e-823b-08d9b34dde73
X-MS-TrafficTypeDiagnostic: DM6PR03MB4764:
X-Microsoft-Antispam-PRVS: <DM6PR03MB47647A4984D945E104AB8E6A8F669@DM6PR03MB4764.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J/9p9Ksjcyi9rdMRyzBF+OXEpUKe2fw3sh2rnOlh0i8inC15MxbbcD3yE/rScqmCoOr98+DYvybTFE1zfI0E4QzvfKVFMFUWidYRboCgfnmCahUd59cr4bBEpt8qfLtJJ6K2gOmzrF8sXcOht+OA2wK+xjY+eNoxFv964SuoNWOri8/upBQrRlV3z0yfqmvq2jWCV44wAQsPZt05K2cn/QTRYA7N6KSp8EE9Vmbf7GQP9MQZFw7flxjeJUydH/pNxMa/mJQgthgwtTqzR7cGrurWJc6P6j5tG1Pux/Sr9EM6urN0WQuxTnCISkQ78UJsJgkcHytn/hiS1Yjkgtf749/8KdrBasbcM9jgQCqN9q6mmLsZ4OXR+wf7Yg8g5vUW4wl08EWEO4aOOmUbtOxwH2baXsCSZoBTfD7kzqHlIy1m9Th5OIv1DsTU+VSfCvaSrvmSMWYB8GbclyFREsxbwJGJUpRLnUAtUvSuwFqEbz7a+nVARkl2xMsoH+VZZal1HwiumJTscD+F3sNRTlLvlMe9h5Nm4H7MfB/s6Z3hwjPId7YoUmvb6w/xoG7Y6v+QU+pbf3EhbAHY7XUaVC/m7m84401lxo2/nBV4t8wE2i5TwGrLS+/XP2KLnPbWDuLSiJLsGcNTD4emaFQE9H5jKgGY92gs1ZZNbbphDKjtjOx58NzLrF/SOyt1TAOTPf7tTJ2kGwrNcQaW3PExNceoGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(4326008)(2906002)(1076003)(66476007)(6486002)(82960400001)(38100700002)(186003)(83380400001)(956004)(2616005)(316002)(6496006)(6916009)(26005)(54906003)(6666004)(36756003)(66946007)(86362001)(508600001)(8676002)(8936002)(66556008)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkp3bER6V0U5eGh0d3FXZ1hvMkZReE4vUW9uRU5DelVKQjh6S1U4eSs4a01E?=
 =?utf-8?B?U29vWG9DYmU5YWlzVGNqNGU4R1Nyc0pTWWpuNGU0YStaYVp4OHk4TGRXZmM4?=
 =?utf-8?B?V0RUMDFRYmxnS1hDNUZVUWQvUWF4TjV0UTgxK0RIeUJ4VGVKVW52QXBMTmJl?=
 =?utf-8?B?R0FYc0dLdjFrZmtMZWt4R0w4VEJWNVdjN3haa2ZtSWFZUi9wQWt6aWlYUjAr?=
 =?utf-8?B?ZWdDWWFBZW9YdWcxWS9pYjgyaUVrcVJjVm1CVzlGSzIyQklJMHdRams3KzlU?=
 =?utf-8?B?YkNlSkhTeXBGaXlHRUE0ZnkvbmNObDQ1SXpoTm5CK0RQV3BMcU1FcGN3V1pV?=
 =?utf-8?B?b3pnY2ZFaHVhTXNMSXhoQzh3MC9ocVdNbExHSHUxTUtTOHBrRDVZSVFvNU9s?=
 =?utf-8?B?VTZheDRLSzBxc3JpTDI2VWNXdXppUmE3M0J6bkRGVEkrOFUrSEJWYTZORHFm?=
 =?utf-8?B?dzNuNUxxZzhldytwMU8zd0ViekNNVy9LaVJGUnZ1WkthYnQ2SEdoUVBCVmU1?=
 =?utf-8?B?Q1VZRTZBR1hVQVp5NlJYVHdVWjg0a3hid09UanRUUmt4T3BDZFY5ZzFOVzgz?=
 =?utf-8?B?MVE0Nk5kUDFUTWtneHcrMG1qR0Zjc3dvZUEvRHJKa3hvZ3VrOWZGTU5wTnF1?=
 =?utf-8?B?UFFGU3pXaWtRN003MnRhQzZHT0RHeUNZWk9jYmZYTWdYY3U3bDBRUXpBY0xM?=
 =?utf-8?B?aEp2SEZuWlUyUWJlNENVbFJ0WHM1SkR3ZW81MUtkVFhhcCsvU2xjV01FRU9r?=
 =?utf-8?B?YWlES3JJWmZNTk5helFmZi81Vnp1UWkvSnZONHhVa29uTnE5aURPOXRpZDBY?=
 =?utf-8?B?TnpMMjlrWWRLbkpmc2hOQ0JrNW1aK0xOdnZHc2VvVmJJM2JJQTVTeEZodStU?=
 =?utf-8?B?TzBITklFMndHY2Z3aENPQVpUaDN1U2hyUHh2R0xYQ3JjL29EaWJtS2RHc0Mw?=
 =?utf-8?B?T3ZGZmlWaTFlRUZmOG1kOVlrYVRmcmZ1dEs2WDVWSHc3ZEJiK0ZPbklsZkZ5?=
 =?utf-8?B?Z05ValhWNTdHMHJZQ3JrTm9SZ3pWZHZnMTZGWm91c040SnNTM0YvaURtRXB4?=
 =?utf-8?B?ck9pd2ZuaEk5Q1ZDWTJHVHNXZUNiN0RvNnFFRTIydWlHdkg0cWdMMVBQWTlu?=
 =?utf-8?B?RTQrZ3k4ODhaUG1jbktoMFltK1BNTGo0QmhPakNRcm5vMjhRZFhpdU5rUHVl?=
 =?utf-8?B?SW5SMUNWdDRrYitnc1NOVFhDQ3NuV2hEZlVmS05LckpaNGFqZjB5cVNCQlRy?=
 =?utf-8?B?aUk5VVFFd1ZtS3l2YklhZk03eW0raWxlTFBLM3FzR0lERVV1VnMwYUsyMTlU?=
 =?utf-8?B?R3ZVUHo5dytYR0IzTEtiaFlvRytvK3hxM1JLd21sUUNGU215RmRSYXQwaUIz?=
 =?utf-8?B?MDF5MHR3MG05SlhpTWJyOFRSWkw1UGZua0lCOUE4UEtxOGRQQ2FVNHEvWThN?=
 =?utf-8?B?anB0MzJ0UnY3NXhHYyt3VkN2a0FQTHFrVmtzMzV6WUo0cnR2cnhJV1U4Ry9v?=
 =?utf-8?B?OHRmVXNGUVpndlFFVVBOM2xDSjgzaE5vUHFDcW93SW9kUmxTWHoySllmbHZZ?=
 =?utf-8?B?bDJsTUxwZlhKekRpUnhJUUR1aXMrUTd2aDErQjRmdEZNVjNJZDJxaXBTVTF4?=
 =?utf-8?B?dEUwSG1RVUNoVitRL3RnRXc1SDc5T2wzRzhnQXJtcmxqQzUxYUdHZlFqaDB6?=
 =?utf-8?B?dC96alExQ1pPSVRIdENRUm9Ea2JNL3JBRmRRZGNmSkZGTDBUdkJGbm5oRXFL?=
 =?utf-8?B?WW4vN0tITWtWWWt0Y3UwQ0VIVld2NjZ4dWRjT09FUDJsVEp6RDUvTFp0SDUy?=
 =?utf-8?B?QitBUFVOTFNnbnZUT2szMklLMlVmZ1Z4bzdhWVhiZ3lTblpwOFltK2puRmVy?=
 =?utf-8?B?eU5JOERXMWhHM2VOSFB3WFovRFJGQ2lGRjAyL3NvTlRRSnZjenRjSlFvbDVE?=
 =?utf-8?B?UTRTbDI0Z2F1MHZjcUN2Y1FjeDVRMUpSQktKMFZDMnJPbUllQlpYQzY3bDVJ?=
 =?utf-8?B?RUgzNjdDdlZaME1CdTJGSUVjK0lRM0hoSVJEQjdTcFJIZXJ3N1FPdnFFT1Vx?=
 =?utf-8?B?T1Ivcm0rbDcrdlNDbC9Ib3UySkdldVp4YVlMMW9paElXL1IwR1pEamRmZnVa?=
 =?utf-8?B?SnNzUGNteTdyR0F1b1BZdE83ME9VZHBsWTFTTXZOZVB0bG9lYWdvaXp4MjVl?=
 =?utf-8?Q?cp8LtJsR5e3F1d7msE0pWwc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d423a56-6c04-4b7e-823b-08d9b34dde73
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 15:35:27.6746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oIHbAYWQ/T1bKQqhypyiEQ2dkL1KNfArtqv0nR4dWnIEBT6YY9iir/QGNJDdO6Zm+G4wyf3OedqTZG2/yT2sVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4764
X-OriginatorOrg: citrix.com

Use such helper in order to replace the code in
x86_msr_copy_from_buffer. Note the introduced helper should not be
directly called and instead x86_msr_get_entry should be used that will
properly deal with const and non-const inputs.

Note this requires making the raw fields uint64_t so that it can
accommodate the maximum size of MSRs values, and in turn removing the
truncation tests.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v4:
 - Rename _x86_msr_get_entry to x86_msr_get_entry_const.
 - Add newline before endif.

Changes since v3:
 - New in this version.
---
 tools/tests/cpu-policy/test-cpu-policy.c | 48 +++++++++++++++++++-----
 xen/include/xen/lib/x86/msr.h            | 20 +++++++++-
 xen/lib/x86/msr.c                        | 41 ++++++++++----------
 3 files changed, 76 insertions(+), 33 deletions(-)

diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index 3f777fc1fc..686d7a886c 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -386,16 +386,6 @@ static void test_msr_deserialise_failure(void)
             .msr = { .idx = 0xce, .flags = 1 },
             .rc = -EINVAL,
         },
-        {
-            .name = "truncated val",
-            .msr = { .idx = 0xce, .val = ~0ull },
-            .rc = -EOVERFLOW,
-        },
-        {
-            .name = "truncated val",
-            .msr = { .idx = 0x10a, .val = ~0ull },
-            .rc = -EOVERFLOW,
-        },
     };
 
     printf("Testing MSR deserialise failure:\n");
@@ -644,6 +634,43 @@ static void test_cpuid_get_leaf_failure(void)
     }
 }
 
+static void test_msr_get_entry(void)
+{
+    static const struct test {
+        const char *name;
+        unsigned int idx;
+        bool success;
+    } tests[] = {
+        {
+            .name = "bad msr index",
+            .idx = -1,
+        },
+        {
+            .name = "good msr index",
+            .idx = 0xce,
+            .success = true,
+        },
+    };
+    const struct msr_policy pc;
+    const uint64_t *ec;
+    struct msr_policy p;
+    uint64_t *e;
+
+    /* Constness build test. */
+    ec = x86_msr_get_entry(&pc, 0);
+    e = x86_msr_get_entry(&p, 0);
+
+    printf("Testing MSR get leaf:\n");
+
+    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
+    {
+        const struct test *t = &tests[i];
+
+        if ( !!x86_msr_get_entry(&pc, t->idx) != t->success )
+            fail("  Test %s failed\n", t->name);
+    }
+}
+
 static void test_is_compatible_success(void)
 {
     static struct test {
@@ -763,6 +790,7 @@ int main(int argc, char **argv)
 
     test_msr_serialise_success();
     test_msr_deserialise_failure();
+    test_msr_get_entry();
 
     test_is_compatible_success();
     test_is_compatible_failure();
diff --git a/xen/include/xen/lib/x86/msr.h b/xen/include/xen/lib/x86/msr.h
index 48ba4a59c0..4d84b7cf27 100644
--- a/xen/include/xen/lib/x86/msr.h
+++ b/xen/include/xen/lib/x86/msr.h
@@ -17,7 +17,7 @@ struct msr_policy
      * is dependent on real hardware support.
      */
     union {
-        uint32_t raw;
+        uint64_t raw;
         struct {
             uint32_t :31;
             bool cpuid_faulting:1;
@@ -32,7 +32,7 @@ struct msr_policy
      * fixed in hardware.
      */
     union {
-        uint32_t raw;
+        uint64_t raw;
         struct {
             bool rdcl_no:1;
             bool ibrs_all:1;
@@ -91,6 +91,22 @@ int x86_msr_copy_from_buffer(struct msr_policy *policy,
                              const msr_entry_buffer_t msrs, uint32_t nr_entries,
                              uint32_t *err_msr);
 
+/**
+ * Get a MSR entry from a policy object.
+ *
+ * @param policy      The msr_policy object.
+ * @param idx         The index.
+ * @returns a pointer to the requested leaf or NULL in case of error.
+ *
+ * Do not call this function directly and instead use x86_msr_get_entry that
+ * will deal with both const and non-const policies returning a pointer with
+ * constness matching that of the input.
+ */
+const uint64_t *x86_msr_get_entry_const(const struct msr_policy *policy,
+                                        uint32_t idx);
+#define x86_msr_get_entry(p, i) \
+    ((__typeof__(&(p)->platform_info.raw))x86_msr_get_entry_const(p, i))
+
 #endif /* !XEN_LIB_X86_MSR_H */
 
 /*
diff --git a/xen/lib/x86/msr.c b/xen/lib/x86/msr.c
index 7d71e92a38..e9b337dd70 100644
--- a/xen/lib/x86/msr.c
+++ b/xen/lib/x86/msr.c
@@ -74,6 +74,8 @@ int x86_msr_copy_from_buffer(struct msr_policy *p,
 
     for ( i = 0; i < nr_entries; i++ )
     {
+        uint64_t *val;
+
         if ( copy_from_buffer_offset(&data, msrs, i, 1) )
             return -EFAULT;
 
@@ -83,31 +85,13 @@ int x86_msr_copy_from_buffer(struct msr_policy *p,
             goto err;
         }
 
-        switch ( data.idx )
+        val = x86_msr_get_entry(p, data.idx);
+        if ( !val )
         {
-            /*
-             * Assign data.val to p->field, checking for truncation if the
-             * backing storage for field is smaller than uint64_t
-             */
-#define ASSIGN(field)                             \
-({                                                \
-    if ( (typeof(p->field))data.val != data.val ) \
-    {                                             \
-        rc = -EOVERFLOW;                          \
-        goto err;                                 \
-    }                                             \
-    p->field = data.val;                          \
-})
-
-        case MSR_INTEL_PLATFORM_INFO: ASSIGN(platform_info.raw); break;
-        case MSR_ARCH_CAPABILITIES:   ASSIGN(arch_caps.raw);     break;
-
-#undef ASSIGN
-
-        default:
             rc = -ERANGE;
             goto err;
         }
+        *val = data.val;
     }
 
     return 0;
@@ -119,6 +103,21 @@ int x86_msr_copy_from_buffer(struct msr_policy *p,
     return rc;
 }
 
+const uint64_t *x86_msr_get_entry_const(const struct msr_policy *policy,
+                                        uint32_t idx)
+{
+    switch ( idx )
+    {
+    case MSR_INTEL_PLATFORM_INFO:
+        return &policy->platform_info.raw;
+
+    case MSR_ARCH_CAPABILITIES:
+        return &policy->arch_caps.raw;
+    }
+
+    return NULL;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.33.0


