Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8B14E72CC
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 13:14:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294693.501197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXipo-0004Pa-PJ; Fri, 25 Mar 2022 12:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294693.501197; Fri, 25 Mar 2022 12:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXipo-0004N8-Lc; Fri, 25 Mar 2022 12:14:28 +0000
Received: by outflank-mailman (input) for mailman id 294693;
 Fri, 25 Mar 2022 12:14:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+r7I=UE=citrix.com=prvs=076f4df05=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nXipm-0003yA-8q
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 12:14:26 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b38bf91-ac35-11ec-8fbc-03012f2f19d4;
 Fri, 25 Mar 2022 13:14:24 +0100 (CET)
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
X-Inumbo-ID: 1b38bf91-ac35-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648210464;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=aXGSnq7Asbji8xl47AkphaOqInjN4mO6j2/PHcXvF6k=;
  b=Y+9ajURWby2Q19XtGEaooWdNt/1jX13QAVFeIAb8NMbdqEBUz02EO9kQ
   l3k0dielJLRfgK+2oqIZkQfleAzA7IucWxWG5EL0vr2dQLGBVXThF3z7F
   hMLSbHLzImFADJTb+sXxoLQHrbgJPV/yXoaopvQdHCF7TYNWp3gk/pfJa
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67568004
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:p/hloKuQCWcLYG8mM83OHw9CNufnVP5eMUV32f8akzHdYApBsoF/q
 tZmKT3QPPfZMGfzc4ggPYyzpB4Av5TWmIBkHFNuqStgEHtE+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jX5
 IuryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi9zN66TqqNDDSVpNHtXF/Vn1pTofSOW5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AO
 JdHOWI3MHwsZTVOGVxODa8up96qrVagcQdBsQm5lYwOtj27IAtZj+G2bYu9lsaxbcdImkeVo
 ErW8mK/BQsVXPS95iCC6WmEnfLUkGXwX4d6PKaj6vdgjVmXx2oSIB4bT122pb++kEHWc8pHK
 lYf8y4np7Ua/k23QtTzUhu0rWTCtRkZM/JZEvYz6QWE4qDV/wqUCGUCQjNbLtchsaceRzYny
 1uIlNPBHiF0vfueTnf13qudqDqpETQWKWIEaj4JSU0O5NyLiJ06ixvUCNJuFqGkg9ndGDfsz
 jTMpy87750MieYb2qP9+krI6xq8q56MQgMr6wH/WmO+8hg/dIOjf5av61XQ8bBHNonxc7Wal
 CFawY7EtrlIVMzT0nzWKAkQIF23z6yMM2LuxgAxI6gGrR2Ho1+NVq8MuxgrcS+FLf04UTPuZ
 UbSvyZY65lSIGamYMdLXm6hNyg55fO+TIq4D5g4evILO8EsL1HfoEmCcGbKhwjQfF4QfbbT0
 HtxWeKlFj4kBKtu11JarM9NgOZwlkjSKY4+LK0XLihLM5LDPBZ5qp9faTNii9zVCovd8W05F
 P4Fa6O3J+13CrGWX8Uu2dd7wao2BXY6H4vqjMdca/SOJAFrcEl4VaOBmO58JtI0xP4O/gstw
 p1bchYJoLYYrSeaQThml1g5MO+/NXqBhSxT0dMQ0aaAhCF4PNfHAFY3fJorZ7g3nNGPPtYvJ
 8Tpj/6oW6wVIhyeomx1RcCk8ORKKUT67SrTbnHNSGVuIPZdq/nhp4aMkv3Hr3JVUEJadKIW/
 tWd6+8sacZcFl4+XZeMNJpCDTqZ5BAgpQ67ZGORSvF7c0Tw6ol6bSv3i/48OcYXLhvfgDCd0
 m6r7d0w/4Ehf6ddHAH1uJ25
IronPort-HdrOrdr: A9a23:MINJkKsxv+OQwjGUOUDlTeYn7skDeNV00zEX/kB9WHVpm62j+/
 xG+c5x6faaslkssR0b9+xoWpPhfZqsz/9ICOAqVN/JMTUO01HYT72Kg7GSpgHIKmnT8fNcyL
 clU4UWMqyVMbGit7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.90,209,1643691600"; 
   d="scan'208";a="67568004"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UhcgxfER9dhp+JHCAhI0xd0HNKa7z05E/iNSg7/aeQeM0iyu02CVvQz64061ZeccmtJKqUkuIVtZ9GdV1ippQdK0krUvGBwiVeapuOf6tm1RAShJtSbEtYkbLaZTMRicL0jdKqFpup8JeM7ynaRwlK627lwa7GPAtkVlwln3OtuxOjqEY1ngyyhfHNnthO8jn+6Y70nL7gzjB6GEICQ85N7WMsm5GHTfRWnwkJVXrCQMw/CTzhvoIzuIyiSAsFLauAJaIqv5NEne7F02gVa1KRQI09iBzv7aG3FlnNrUOXOf1Vh+vNbHBwQaMx26fPW8ZKVI1fc1Zdd8gFFYSrPuTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTAEg/p2JLm4oxOESQGTiHI58wXjfmiSMoEPMLa9WlA=;
 b=Qt5l/DBbWW+fWsm3gzMqj3F4WhWnECtn4Dxt9bo33qhYEbZliO490chrG3Bqkx8eDmu95C8BNhgbAjx/X3JNjrEmi3Ycfec2km4ejpahDr2uz5az7coV++GCrTAUOCxj2U6AAtitsIiRs4X3O1MbDhC4Ic1WejuQ8iBGUnt/j9+ED2ZTSjBNxwBh04C31IjX5rBxI5rIgzGemuV18FInvnsAHU0g4kXpbm5ql77DrsHgljh3i1bvBO3JmwacKUc2ejPuwhMd9W5TIajY8H5q2rRjbg+hhqH/u46k9dnNn+3sEhhRIntgwd+rN+gb3w+RLjgkvDsYiz/ifr8bNyvpgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTAEg/p2JLm4oxOESQGTiHI58wXjfmiSMoEPMLa9WlA=;
 b=Pi3I74EETLe78C+L1/ebhIRIr1dv21xQWd/3H7k4FDknqyUr4n9VW3RqKHbTXvSpsbP0ZphSVHQmEVkE+HVDEEHTCm1SxguCS2Sncyf+ieklLgeGwDU1lF1P+4V4wobaXqEEUYiCHRaPdVWKpet341s4TYLJWgNjXd7zqrkxlqs=
Date: Fri, 25 Mar 2022 13:14:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
CC: Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel
	<tamas.lengyel@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>, "Wei
 Liu" <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<JGross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Alexandru Isaila <aisaila@bitdefender.com>, "Petre
 Pircalabu" <ppircalabu@bitdefender.com>
Subject: Re: [PATCH 3/3] x86/mem_sharing: make fork_reset more configurable
Message-ID: <Yj2yDz7gld9y8ILI@Air-de-Roger>
References: <fb927228a8f68ce983ae0b46e6665b5b8dd0764e.1647970630.git.tamas.lengyel@intel.com>
 <fb437a16517d343ba3432aa64b9e14b34630a750.1647970630.git.tamas.lengyel@intel.com>
 <YjySMjegTNFBE5RK@Air-de-Roger>
 <CABfawhnnAehxaByyncaYAjSSbddJi8yeTnjcXX_a+st8Q+C_+Q@mail.gmail.com>
 <YjyWW2CkQv1ckvXM@Air-de-Roger>
 <CABfawhn-QiUBuq9c4tzr=9nL=J-ntm1hf23mbeRu-qCAKRDj1Q@mail.gmail.com>
 <Yjyfygi6pE+UVhjM@Air-de-Roger>
 <CABfawhkQoOnKv7OWNus0WBY4CjX+1uU1ZeZgQ-mU-sRtQFE3QQ@mail.gmail.com>
 <1bcc54d8-e766-1d53-6bc8-bd67f8838d73@suse.com>
 <CABfawhk4pyUGV=QGua3WNghbp-tk0yOzSSp6_x8o1Lg-8OXhNg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABfawhk4pyUGV=QGua3WNghbp-tk0yOzSSp6_x8o1Lg-8OXhNg@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0157.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5cdb02a8-1056-4b2f-9558-08da0e58f91c
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5535:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB553580243C26AB0D3564DCA88F1A9@SJ0PR03MB5535.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jCJJ8zxjC+mVdQvKvbqM1+Sh5Urt/gaNSE7eVKahPDJVaqbHban+a3nC+IlENDLN+RUD/4jXH8eQWANa1uMsSLYUZGLGKurTKDmvH1twV06rnAPSjxBD1t4jDbRjaP9tYaCVIImauGXkP/vP70om9H0NRZyMfQmp64jDV5VpkPyR8BBW3o3knQatbJdNeL0VXQXLY0GgW2056rfGZRExd/4MDFuLUQEQGyc534suHfhaPDWWj/UXUJAElOA+tRpbiIUxUv35JtGfNYeJPl9+9qk4M8BQ5+A6Qtz7YFUMtPlDROiQjmga2lC5YRc9P5JOHPP5vdV8Z7PDIlPQjyNPT6jV2HhH/kURqsnW+pVRtm3hm7g7piNaTSWvO6IahOX5kwEJBZvPw1Z8rum2N1hZELtddxIWJ/nr+jxULORxGg4pBWPTaH5J7yh3T5FhtJE+wh/aVm+f/sXxh9FFHjyUTSAFIWTDN4C+n3WQURZcqKkHovIc5+L6hZ0ApAcBl86Fsc6TM2mpB0hagYcgBTaHMwBQrlFedhnnAqpjWvSAcS5j/MrR3JxNPx8J6+TJ6yzq1nUv1G2G2H3Ct2WhtLAFL9oXyI12mD3PwOY4tMXG+7/UZoVcUGxWfNYXK4+l4XSe5c/95VwjS8vXPlqvBWdONQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(9686003)(6512007)(2906002)(66476007)(4326008)(508600001)(85182001)(54906003)(6916009)(26005)(82960400001)(38100700002)(66946007)(33716001)(316002)(8676002)(6486002)(66556008)(6506007)(86362001)(6666004)(5660300002)(7416002)(53546011)(8936002)(83380400001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHJMVEtlKzZDS29Fb25Gd0lvc25IWkp1YUxKMno3MC92L3pmcm5TSkk4SlMv?=
 =?utf-8?B?eEFteEFkd1VFUHgvb3AwRXpXUys2d1pRcjJvTmh4ZzFxSnVvZjF3RGZHc0d3?=
 =?utf-8?B?U2ZYOVViMnNYZmRHNENTTlMwUWdSR2Q1eGJzSS8yT1VXQ1hDMkZOejBxeHYx?=
 =?utf-8?B?aXJWMFl4ZlV5TXAvdUpyV3VmU214QWtqVHZsYU10bTYrOThIOCtVT09XMjhM?=
 =?utf-8?B?Q3NiZjZLeFRlNWZIcndBckdPNmJMQXJHaTB0V2UxRkV5U0lyaEV5c2VKVW9L?=
 =?utf-8?B?Vld2N1M4V0ZwSXFsazN1SDBhY0VWcE5WWVBXb3dXYXprNExHazNmVmxYR05G?=
 =?utf-8?B?TVFkcUhWZmlYR3IwdW0vdkgzWkpSVnVmclJGdkZ3NWF5NVhkVW0wV3hZMzZ3?=
 =?utf-8?B?Qzc3ZmlJMHZjamhxdFJ2c3NEWXJISmhxZjNOanJlT3BZQk91VHk4WjdBbkNj?=
 =?utf-8?B?NjlTUW1FRElUQWtxRngvRXJ5Q0hvTzV5dmxsdHZZaFlrZWdteThKY25pcDZJ?=
 =?utf-8?B?OXlsT29zais4K2NMcC9oeUVpb0JhcmpXYVovam5VSml2MURvS1FEUEhXdmVJ?=
 =?utf-8?B?YVc4RFZqaGwwUVM4cTVia0VJRmszNUJpM0pHTDcrU3NRY1JQR1Q4RVVWa1JH?=
 =?utf-8?B?T1R2MUorYXVOWEtRZVNyS2RESEVuYUROenVSV2lwenI4cjBYdE1lR2VUZG5Y?=
 =?utf-8?B?MmRvRzQ5WDcxL0NtaDd3ZXlEbW9xSHlsVHVtZml5bE1TRFRWREhSRWE3SnN4?=
 =?utf-8?B?TDFYQnBFbUtkTHo0ekpiOXBDL0xaMVgxWDNnNnlxOEYxVTZPL2lkcGcwWjRP?=
 =?utf-8?B?WkVvcmo5Y3hCNnpORTQ4TTgyTlRZanFlcCswL3VLWDQ5LzBqWlVzV3RGck1Y?=
 =?utf-8?B?QTlBS0d1cmFyYi9jVkp5Vi9mNkdJdXhnakR4MDBQN3pETkQ4YWg4OFA3OU5i?=
 =?utf-8?B?TWg1a0ZVWVpIdnhPK2E3b1hWTEl0NEVtVU5BRTcyZGdDWnFLYVN0ZlZaZlYy?=
 =?utf-8?B?c2JyOGR4S1ZVc2JqQm5nbzZMcWd6TG5qcmhrVzV5ZHc0ck9EcUwrWVhZNGN3?=
 =?utf-8?B?Vk5BTWZDRVJyaXZ0a3k5QlpTVHh5Q2xYV3QvRHZKSDIxYk94REJEbXFTUExr?=
 =?utf-8?B?bGxjZjZzeVozS0dOVldXZm4wNGZ2S0dOYktmcWsrSFAyU2VSZnErYktQQTho?=
 =?utf-8?B?TmdRcGoyYTRQL2xIQ3pIS3ZaUVZLT2xRLzJnT1VIcTQyT3laTUI1T3NuNXJi?=
 =?utf-8?B?T0Iwa05sMlhQeUU2TktRVTN6SU4xMHZMVE81VHV3RFN3dWJtWklsYk5sdG5T?=
 =?utf-8?B?SkpiaEw5UGIxZWFISGJYY2h3aC9DZXRoVWt1cUtHK0xKRDVQbi9hRDRJRkFT?=
 =?utf-8?B?YVlhQmRIeGJXYSthbU5XMnNkZkU5aEdodjY5YTBQL3M0NnV2aTB4WDFLU0Zy?=
 =?utf-8?B?eDMrQXlocStrankrRUxhcFlZaXRTV0dUNzVUL0VRb1ZHb0RNVUk3c2V2KzQ0?=
 =?utf-8?B?MVlWRFd6d24zMVFVMm5Kc00vTlZlSGhVKzBDaXVmbWZzSU1UUFAycWFWbTVJ?=
 =?utf-8?B?SHZSK3VzR0R5MlRhcWlMQjVpK1lSd1FSUEd0c3pxd3ZXN3JyVVoyMTRCMEFN?=
 =?utf-8?B?RGRQekUzWmxGTkR6bUJiSUVvbndCemQrbmJjV1FkVUJ0dWVNcWJFRnR3TGtX?=
 =?utf-8?B?K3FwYzBqTHNpTkxPeXVVNXlxRXNZeE40bGx3TkNMZWNlOS9UV3VCVWhLMUY2?=
 =?utf-8?B?OHZlV3M4NzQ1bGl3dG4vT3JTUERuNVdITW8zUTlKMVJheGI3NjVvdU1YeEZL?=
 =?utf-8?B?cmY1ank2UTJVdjVYdWs1Z3lxN3RGeFRDWmJEWm5XLzVONU1RdVlKWWdFU3E2?=
 =?utf-8?B?a3BkYTVGZndUWXdpU284SEEyRDRWVG1NTFptMjZEdDhWb3pwNmVpSEZidHlL?=
 =?utf-8?B?NXM0UGpQV0g2dmZZaE1xVEZ4RUpDNUk3RSsyV0l1ekc1VC85M2U4Tng0Mnpt?=
 =?utf-8?B?SnJVUW9Nd2VRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cdb02a8-1056-4b2f-9558-08da0e58f91c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 12:14:12.7063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JsndE2WVAGJ2cSXC6PgIvgvdufuGKFCB95MXakuyZa0GqVNeOhgz+1/3W064gRBH/gIZURQQi4xR8zm/sVhfKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5535
X-OriginatorOrg: citrix.com

On Fri, Mar 25, 2022 at 06:48:42AM -0400, Tamas K Lengyel wrote:
> On Fri, Mar 25, 2022, 5:04 AM Jan Beulich <jbeulich@suse.com> wrote:
> 
> > On 24.03.2022 18:02, Tamas K Lengyel wrote:
> > > On Thu, Mar 24, 2022 at 12:44 PM Roger Pau Monné <roger.pau@citrix.com>
> > wrote:
> > >>
> > >> On Thu, Mar 24, 2022 at 12:22:49PM -0400, Tamas K Lengyel wrote:
> > >>> On Thu, Mar 24, 2022 at 12:04 PM Roger Pau Monné <roger.pau@citrix.com>
> > wrote:
> > >>>>
> > >>>> On Thu, Mar 24, 2022 at 11:52:38AM -0400, Tamas K Lengyel wrote:
> > >>>>> On Thu, Mar 24, 2022 at 11:46 AM Roger Pau Monné <
> > roger.pau@citrix.com> wrote:
> > >>>>>>
> > >>>>>> On Tue, Mar 22, 2022 at 01:41:39PM -0400, Tamas K Lengyel wrote:
> > >>>>>>> diff --git a/xen/include/public/memory.h
> > b/xen/include/public/memory.h
> > >>>>>>> index 208d8dcbd9..30ce23c5a7 100644
> > >>>>>>> --- a/xen/include/public/memory.h
> > >>>>>>> +++ b/xen/include/public/memory.h
> > >>>>>>> @@ -541,12 +541,14 @@ struct xen_mem_sharing_op {
> > >>>>>>>                  uint32_t gref;     /* IN: gref to debug         */
> > >>>>>>>              } u;
> > >>>>>>>          } debug;
> > >>>>>>> -        struct mem_sharing_op_fork {      /* OP_FORK */
> > >>>>>>> +        struct mem_sharing_op_fork {      /* OP_FORK/_RESET */
> > >>>>>>>              domid_t parent_domain;        /* IN: parent's domain
> > id */
> > >>>>>>>  /* These flags only makes sense for short-lived forks */
> > >>>>>>>  #define XENMEM_FORK_WITH_IOMMU_ALLOWED (1u << 0)
> > >>>>>>>  #define XENMEM_FORK_BLOCK_INTERRUPTS   (1u << 1)
> > >>>>>>>  #define XENMEM_FORK_SKIP_SPECIAL_PAGES (1u << 2)
> > >>>>>>> +#define XENMEM_FORK_RESET_STATE        (1u << 3)
> > >>>>>>> +#define XENMEM_FORK_RESET_MEMORY       (1u << 4)
> > >>>>>>>              uint16_t flags;               /* IN: optional
> > settings */
> > >>>>>>>              uint32_t pad;                 /* Must be set to 0 */
> > >>>>>>>          } fork;
> > >>>>>>> diff --git a/xen/include/public/vm_event.h
> > b/xen/include/public/vm_event.h
> > >>>>>>> index bb003d21d0..81c2ee28cc 100644
> > >>>>>>> --- a/xen/include/public/vm_event.h
> > >>>>>>> +++ b/xen/include/public/vm_event.h
> > >>>>>>> @@ -127,6 +127,14 @@
> > >>>>>>>   * Reset the vmtrace buffer (if vmtrace is enabled)
> > >>>>>>>   */
> > >>>>>>>  #define VM_EVENT_FLAG_RESET_VMTRACE      (1 << 13)
> > >>>>>>> +/*
> > >>>>>>> + * Reset the VM state (if VM is fork)
> > >>>>>>> + */
> > >>>>>>> +#define VM_EVENT_FLAG_RESET_FORK_STATE   (1 << 14)
> > >>>>>>> +/*
> > >>>>>>> + * Remove unshared entried from physmap (if VM is fork)
> > >>>>>>> + */
> > >>>>>>> +#define VM_EVENT_FLAG_RESET_FORK_MEMORY  (1 << 15)
> > >>>>>>
> > >>>>>> I'm confused about why two different interfaces are added to do this
> > >>>>>> kind of selective resets, one to vm_event and one to xenmem_fork?
> > >>>>>>
> > >>>>>> I thin k the natural place for the option to live would be
> > >>>>>> XENMEM_FORK?
> > >>>>>
> > >>>>> Yes, that's the natural place for it. But we are adding it to both
> > for
> > >>>>> a reason. In our use-case the reset operation will happen after a
> > >>>>> vm_event is received to which we already must send a reply. Setting
> > >>>>> the flag on the vm_event reply saves us having to issue an extra
> > memop
> > >>>>> hypercall afterwards.
> > >>>>
> > >>>> Can you do a multicall and batch both operations in a single
> > >>>> hypercall?
> > >>>>
> > >>>> That would seem more natural than adding duplicated interfaces.
> > >>>
> > >>> Not in a straight forward way, no. There is no exposed API in libxc to
> > >>> do a multicall. Even if that was an option it is still easier for me
> > >>> to just flip a bit in the response field than having to construct a
> > >>> whole standalone hypercall structure to be sent as part of a
> > >>> multicall.
> > >>
> > >> Right, I can see it being easier, but it seems like a bad choice from
> > >> an interface PoV. You are the maintainer of both subsystems, but it
> > >> would seem to me it's in your best interest to try to keep the
> > >> interfaces separated and clean.
> > >>
> > >> Would it be possible for the reset XENMEM_FORK op to have the side
> > >> effect of performing what you would instead do with the vm_event
> > >> hypercall?
> > >
> > > Yes, the event response is really just an event channel signal to Xen,
> > > so the memop hypercall could similarly encode the "now check the
> > > vm_event response" as an optional field. But why is that any better
> > > than the current event channel route processing the vm_response
> > > encoding the "now do these ops on the fork"?
> >
> > Well, as Roger said: Less duplication in the interface.
> >
> 
> No, you would just duplicate something else instead, ie. the event channel
> hypercall.
> 
> 
> > > We already have a bunch of different operations you can encode in the
> > > vm_event response field, so it reduces the complexity on the toolstack
> > > side since I don't have to switch around which hypercall I need to
> > > issue depending on what extra ops I want to put into a single
> > > hypercall.
> >
> > The two goals need to be weighed against one another; for the moment
> > I think I'm with Roger aiming at a clean interface.
> >
> 
> It may look like that from the Xen side but from the toolstack side this is
> actually the cleanest way to achieve what we need. The vm_event interfaces
> are already strongly integrated with both the mem_sharing and mem_paging
> subsystems so nothing is gained by now for no reason trying to keep them
> separate. So I strongly disagree with this suggestion and I'm going to keep
> it as-is. I appreciate the feedback nevertheless.

I'm not opposed to it, I just would like to better understand why you
are proposing such interface.

Thanks, Roger.

