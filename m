Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4268F75A938
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 10:27:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566464.885305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMP02-00020S-98; Thu, 20 Jul 2023 08:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566464.885305; Thu, 20 Jul 2023 08:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMP02-0001wx-5E; Thu, 20 Jul 2023 08:27:02 +0000
Received: by outflank-mailman (input) for mailman id 566464;
 Thu, 20 Jul 2023 08:27:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/JYs=DG=citrix.com=prvs=558be806a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qMP01-0001wC-9g
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 08:27:01 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30b1478a-26d7-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 10:26:58 +0200 (CEST)
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jul 2023 04:26:56 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5760.namprd03.prod.outlook.com (2603:10b6:a03:2d3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 08:26:54 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 08:26:54 +0000
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
X-Inumbo-ID: 30b1478a-26d7-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689841618;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=/DjRmCpyR41ndqdeo2ztSdCTQNy5XAVA3JYpNnatIeo=;
  b=ftnWY6hL7VgwqLsQWHpW9uHkZ1sj7j0WYvsNlDgAy4Fj4ycm/wRRfZvW
   31Ib4tDGKldjlw+MFBvQOG7RNHG/EkNH7Ha3PBHee9QaeBgb2ZH6uTeri
   SAoPqskD1Tl7skas/R1Be1y2gwvGudeIBSPTZAmbGFFhnCHiKvNLM9/ra
   w=;
X-IronPort-RemoteIP: 104.47.56.172
X-IronPort-MID: 119438774
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Ch9616kpu7fNlT+VY510n3To5gylJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeWW/UbKuLZDDweNtwbY3l80IA6pCGydY3G1Nt+30yESMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K2aVA8w5ARkPqgU5geGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eU3ITEtYwq+vbKd6bLjeswxhpsyHOC+aevzulk4pd3YJdAPZMmaBo7tvJpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVI3iee3WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHqqBNlCS+LknhJsqGS612cPLRtOb1vhovK0r0GQeYlwO
 WVBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQ5sOcmSDps0
 UWG9/vrCiZoq6a9Um+G+/GfqjbaBMQOBWoLZCtBRgxc5dDm+dg3lkiWEYwlF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9XABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:aCMXEahTclZrniC8DD8mkUFGdXBQXtkji2hC6mlwRA09TyVXrb
 HIoB17726TtN91YhsdcL+7Scq9qB/nlaKdgrNxAV7BZniFhILAFugLhrcKqAeQfhEWmNQtsZ
 uIsJITNDQzNzVHZArBjzVQ2uxP/OW6
X-Talos-CUID: 9a23:vKxboG/3ppn1GcCXT8+Vv1c7E8EFf2fg9if7Ck/gOUM0SOKEeXbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3ArYQT+QwAMvpmTn1BATxJuho5TmmaqJ2HGUsRtJN?=
 =?us-ascii?q?egcneNid9Hjizrm+YUKZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,218,1684814400"; 
   d="scan'208";a="119438774"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mj6B5YE8huTW1l3U6Wii6rXCReMMG04xbfwLrRwDRGscaB9W2/Rxq5vUgVCcPOpBYYj7n+O9Twi+wjl3bxRPY1hbp/rZyUphN5fm7H0o4oYaEu/rkKps37hdLClNO0NCVUT9A5BdnQO/wyRU0emVVkj9pIrgXUrM4tHJIfRUpFtc5aQ3GLbEX7RXDGdlNR8wjrA9UWOwwKvxh//LQCHoK+DOqoj+LV+6aY0GLDTPMUtXKCMWVyctC8srJNBOd+nbfHbQ2X7udOOgWBmLEQm+66OZ9NKWSoTIvvKJIefqJmkzXc3BjBDnCn/QzgfwACLoRyCMJjdm6LPuvytSUotWbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvAgEnMZzKsiO5gFVAUArv65sWJ/koiL8PS5eQmSiJs=;
 b=e2oEeOkYJgPmgfgEC1MHxqbS/+82LlQl2tus4SyYDXdEhEsjNAaei33ZgUh54UrKOTPBikTSvNHj9wiPC/kSE17+xKm86BXWI0ScpYj/sPhoYnrNlG3qI0tggCUHYCD9fN5lSXN5QDQZILEBVv35a4YXE+lTPFT+DwhB9uIxY1A8v20aw69hv5VZ2OqLcc2EZfPlXK19HC9B+O3fZfhFxoPtwKkB7b6lPLPBSroOQvW/IwVhnWHDJInp544I8p5W6/Zq2kaOU1ebjQCmBfOfr93QV6Cr13d2pqBq71rODh4UJlX1EIHVJQtXUPHW5fFc0z/ZL4+SwGKcGvkI47Pkuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvAgEnMZzKsiO5gFVAUArv65sWJ/koiL8PS5eQmSiJs=;
 b=QLrMQufRGVVfKDTMPYv+omkwjP5+eIV3lXbpZK07AgvBjBQa7QlWKGJCoe+uhyk10kKPjYo1EOnsLG03Hyg4aLxr6oCegOwI/LA/srngkrg3WU/pURlNxwpz4SfqXoqSywE7v7wGzzcwfFOmKyFz0dFAOSG9XYHvcdR28IL+WP8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 2/6] libxl: change the type of libxl_cpuid_policy_list
Date: Thu, 20 Jul 2023 10:25:36 +0200
Message-ID: <20230720082540.69444-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720082540.69444-1-roger.pau@citrix.com>
References: <20230720082540.69444-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0159.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5760:EE_
X-MS-Office365-Filtering-Correlation-Id: d2e00534-d6a8-4e32-58ad-08db88fb12fa
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B4uE0kWJPx/DzfZ/csNp1qO8g2z23vKPFWCQCkxOozLbu8qB/BjIjie3ImPL8UgzvwM1dJ3VMiqzY0l2eWAs5sKe0hr4E9lstcp4XvdG/50gGUM3xorZmciJbeQgqI4U8R5rkLz/6P7crEO2cRG8KJ7c7uiQMK3WXF+7koh5aS2T607xXTxjvXRqfx1gGvhC+VVWZ62kvXkV4z8chNDOg9rYfOazhZXHRB0TXoKXdHcNxZsbdXGUFppW2KkDe1UIz1V3a1I1dbl+yKJvS30AXu0T1ATj1Ms1JXfaKT2FSVZYaTATIHubAzHsQf4wvFvR+Kq9qtBQc/2ImRs+nbEAe2McQLWibeFgkWpjptUJw1O3YTbFT5BttD3fzpd25NqrYTf7fgRPaCFQ7/zJIrW7JQ6TjU+f4wqT0jTFomG6Iy1sIbz59XT3npkHZevn5uMPgr3uq3TIwj1WCtNUE0hMS90XfC6yrNKxxi5TnghrV/DdVJBZ2BeuGvB8BIszXFQqpqZynq11LxKeqVAU0a0gVAMEXAFMAEbgkiq++D6MyUERihyqqopnBkYK4B1JF+Iv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(451199021)(86362001)(478600001)(83380400001)(1076003)(186003)(38100700002)(41300700001)(26005)(54906003)(6916009)(8676002)(8936002)(316002)(2906002)(4326008)(6512007)(66556008)(66946007)(6666004)(66476007)(6486002)(6506007)(82960400001)(2616005)(36756003)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTEzOTE1V2oxb3ZVeUV2NVZ0OUx0R2VqNiszMFBaRzMwams2aXlYVnQ0QWpB?=
 =?utf-8?B?b29mek9kdUJGK2Q2Ynl4ZEVlOTE3Q2pGVy9XdG5pYVNnM1J3YWM2czFZcm5q?=
 =?utf-8?B?NTFPS1NSbjl5Kzg3UThuTkt6Vjk4MFo4N0VjNTA3UThTY1Z3QnByaFBmcWR5?=
 =?utf-8?B?M01FbURySzBaUCs0bE51bTlmazU0WnM4Sm83RjhrUmpncytmN1FFTUpSNFFq?=
 =?utf-8?B?cHlOWnMzQlk2Vi9kNTkzeGVGNEdwMDVRMlVTTytPcWtKZDU1c3FrZWxwUHdr?=
 =?utf-8?B?QkhZSDJvZjVGdmxJKzl5a2RZQ2lkVkhrUHllZHJNNnVRSTNYdWhHQkpJek9P?=
 =?utf-8?B?SkQ5dGpGQjRNcDdqUE1oV3B1bGF1OWs2N0VjZW1lN2JHQzNmSERCbVQ1RHF3?=
 =?utf-8?B?aUZSb2dhTjYraHdNRVFsVm9DVlBiL2ZYb0VLZVdDVHcrZHU3Z3V5Q3BnTWVt?=
 =?utf-8?B?TlVmTGN6SHF4Q09MR2dzVFVBSWRwbW1teEdHNTJJMkpoQS9KWG4rcDNjb3NY?=
 =?utf-8?B?ZGl2cWk0NEJ3RStMcjBpNXNpUHNtMXRJZ2NyaHcyNWQzSjh3ZXRnaFdaTG13?=
 =?utf-8?B?SVRRd0MzYnRBeHZtYWdLZ0NOYzMzdU1LdHllNFowRWx2TXl0emZRZ2FEZjFm?=
 =?utf-8?B?N3hkYXBwemoxUCtBMVVuc1c2WFZWOXF1RjNjUUpScXdlTTdLd1pUVFVyOXFL?=
 =?utf-8?B?T3FFdjM3Z28remxvRE40bEsxYjZXOHhPVVpmYWhmKzhhb0ZSVUNHMTdwNmNI?=
 =?utf-8?B?b1k0d0tyV0RiU1VlNnQ1ZGVMM3RSWURyTGFCb3pWWFhncUNieEpzalkzcGdw?=
 =?utf-8?B?UjNZYWdvYXpvTGhGWHJaelVtQWFUbjl3U1RhSWpEN3JXTyt3cXRtUmRWRVJI?=
 =?utf-8?B?YUxBQUxYTFFwR3RZRWttYVZNQWRtSW9ZQ1FZZkMyeFc2a0twb0hBNmlIM1Y1?=
 =?utf-8?B?cFU1S3RrUTdUZ3J5aEZsemp0V2x3c1U1ajFFeEZ2WDhqL3RUNFhGdnFnSWhC?=
 =?utf-8?B?cEErUGUrMklPMk1uVXNoR09GNzEybGI0M0ZjZ012a3NDTEhRTjRnMGJqaTZD?=
 =?utf-8?B?QnpKTStYY1lXVHIvTDJHS0h1dys1Ylo0Y01tTUR6MkZVa1E0UmIyNG9RYTlo?=
 =?utf-8?B?cUNac29ueEM3Z0ZKcGxtdk8ydGkrd2dnU0V2TjJXT0NKSW5CSTN4SzRMRmNo?=
 =?utf-8?B?MlN3WnV5U0Q4VmlWZlMybUNleStTTXdsamZFZkp3NVFtejJtNllOSVFNaExW?=
 =?utf-8?B?Mld6aCtKQlBLejZJUzB3SXJpcDh2SDVJSldJRWFrZUNFVWxGRDc0eGpjUjRS?=
 =?utf-8?B?R2pEMlphUUdGbUZpdGZDNkYvL1lKQzFDNmVuV2tqSkk1d09OSWR6ZEtDcmNt?=
 =?utf-8?B?UHpxa3JJNEFCbmp5SWxpQjRXdFFoQS9Gajl2dElmQ1laVWhJaGp6Z29ycXFt?=
 =?utf-8?B?U3lZblBZMENITU9QdmZoL2lycHVwa3dmZDFNQi9Oa3dJM2dwdjN4dXNjS1I1?=
 =?utf-8?B?bUlTbTNmcXNvRWhhWGRXcHZ1NHVONzlOdkFzWEcrZFJVSFZjM0tkREFLcURE?=
 =?utf-8?B?L1cvWmdpT0NVd1hWemJyVXJrbytmL0NqVWJLWXNiZlFiM0hmOG5wYjFCMktI?=
 =?utf-8?B?OUVkTVVpSnc1VUx5UGlkd21HcE16QjJOWkpGRXJaa3V6bjBEaDBFY29RdHdM?=
 =?utf-8?B?RENNVmVBT1liblY5V0FXWWljVWlRT1pLZE02ZDJVSUdNV3k5bkIyaGtwendN?=
 =?utf-8?B?Zm5TV0RMZ1pFcVBRQi9QQThJZW80dlBRcFBBVXlCTy9rV3ZQYXBveUEvVHpE?=
 =?utf-8?B?OUVjUks2SHErTXBkdzYyY3pjM2R6MG53TjJJTHBEaG9uWTA2OGJwdTYyb1hV?=
 =?utf-8?B?RlA2NFBYTG5Vd2FlazF6Q2owdHUzUmtiN0tBODNhekd1MnhETkhBSzFUNnZQ?=
 =?utf-8?B?S2VjeENHTGFmYlU4Ui9Zc09XMXZ4SExRbDU3dGFTcWtKK1NKMGlEWDVDWlhQ?=
 =?utf-8?B?SWdmOGZYeWdic05GOVpHSUhpcnZ1MHozK0hmajRYL2ZvRUFSaGpnUHJPQUU0?=
 =?utf-8?B?ajJnQkJOT3FlRVgxUVRwcllzR05NYzNnSVcwdmZMOFFKcXduN2dNbWdYZU1T?=
 =?utf-8?B?OHdsMjFkVSszVEdVZXd2SHBTWWFnREZqeXhrY2FBZDVFbHNCazZHd3p6N3Ra?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4vSJAUG/Tj69xWnyJCfUI6agWHNuObh23GeJhXIG/ZnY6yizuwf/PC+6GYi9JIN/vsG0VXT59D9tlOnpnIu4k7sV9mTrsNkwPvfTO6w+A9cmBHzbi1+h7zMmnNmSmhGAqrSEfJcGUpNZd6CqtWIXu3WbtDRg0ZHK/ytOYL8lavfexwUResiq7OXh6O8xFYDjIY/SEZJiTDV9x1FbRw5ACbR8TV/VMI9iLXbaF/Th2JKTQYA+NTcW51991Ai1GS4RyiwWM/zi9X7m7wDQPk29U71aZw+WfF5Iz/y3DplaDeyucSi7I/62rcVF/2h1Sd6nIE4YWvzybKCz+BuWtPoaVq7XaBiYKv7y7sca3xnfeG3jkbZbvkWPrYSbXYu/O/g6hulE6MN3gixlqt5nEAZA0P6fuKjeBvluMP86UGVdmCQhnrzLEPBjSMzJCNsCiV16b7tWs/j7yvzQ9myJM3XnAue1GCYZj4YAbeiUcG7yxyKnNYTlLGh4L6orQzV56rU4bfXPQ1v8vDqaJNTkjWRgX1yo5KFvbUzpKmQXNuymUyvHM6EI+GHLJV9vf8hkV7bCFJtIcXzogVLOeWUH/NoIYcDHjK0RrN8LNcvDGdTxNIxR3VlmuiWR5bQu6FiMX3iL5338d6CkpiddTbv3oXT7RVQ0jtI3mtz1FmZoNHUKK86mavWijF3hYpYPF0auSnKxjhe+XFQRevQjwIBTBGGev/WhOR9zCJG4lEvp9LR5nRD5A06LTI0gBnCRQQJal9IvfkuRoAaHYL1DgexPPTC6zukQ/wuspJYid2Xkm2284wdqZ/jziFlbfDQWr0SSLBKw
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e00534-d6a8-4e32-58ad-08db88fb12fa
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 08:26:54.2132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ztLEp0jOqdlrkrEQMauEoJ6IlX78pwBVEt0tQtsYZds5goEJchQuxSd5zSr5vpUY6aPEbhcXHJXxIQFPrSmsIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5760

Currently libxl_cpuid_policy_list is an opaque type to the users of
libxl, and internally it's an array of xc_xend_cpuid objects.

Change the type to instead be a structure that contains one array for
CPUID policies, in preparation for it also holding another array for
MSR policies.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
Changes since v2:
 - Add braces in the inner loop.
 - Do not set the policy to NULL.
---
 tools/include/libxl.h             |  8 +--
 tools/libs/light/libxl_cpuid.c    | 87 ++++++++++++++++++++-----------
 tools/libs/light/libxl_internal.h |  4 ++
 3 files changed, 63 insertions(+), 36 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index cac641a7eba2..f3975ecc021f 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1455,12 +1455,8 @@ typedef struct {
 void libxl_bitmap_init(libxl_bitmap *map);
 void libxl_bitmap_dispose(libxl_bitmap *map);
 
-/*
- * libxl_cpuid_policy is opaque in the libxl ABI.  Users of both libxl and
- * libxc may not make assumptions about xc_xend_cpuid.
- */
-typedef struct xc_xend_cpuid libxl_cpuid_policy;
-typedef libxl_cpuid_policy * libxl_cpuid_policy_list;
+struct libxl__cpu_policy;
+typedef struct libxl__cpu_policy *libxl_cpuid_policy_list;
 void libxl_cpuid_dispose(libxl_cpuid_policy_list *cpuid_list);
 int libxl_cpuid_policy_list_length(const libxl_cpuid_policy_list *l);
 void libxl_cpuid_policy_list_copy(libxl_ctx *ctx,
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index c96aeb3bce46..3c8b2a72c0b8 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -19,22 +19,29 @@ int libxl__cpuid_policy_is_empty(libxl_cpuid_policy_list *pl)
     return !libxl_cpuid_policy_list_length(pl);
 }
 
-void libxl_cpuid_dispose(libxl_cpuid_policy_list *p_cpuid_list)
+void libxl_cpuid_dispose(libxl_cpuid_policy_list *pl)
 {
-    int i, j;
-    libxl_cpuid_policy_list cpuid_list = *p_cpuid_list;
+    libxl_cpuid_policy_list policy = *pl;
 
-    if (cpuid_list == NULL)
+    if (policy == NULL)
         return;
-    for (i = 0; cpuid_list[i].input[0] != XEN_CPUID_INPUT_UNUSED; i++) {
-        for (j = 0; j < 4; j++)
-            if (cpuid_list[i].policy[j] != NULL) {
-                free(cpuid_list[i].policy[j]);
-                cpuid_list[i].policy[j] = NULL;
+
+    if (policy->cpuid) {
+        unsigned int i, j;
+        struct xc_xend_cpuid *cpuid_list = policy->cpuid;
+
+        for (i = 0; cpuid_list[i].input[0] != XEN_CPUID_INPUT_UNUSED; i++) {
+            for (j = 0; j < 4; j++) {
+                if (cpuid_list[i].policy[j] != NULL) {
+                    free(cpuid_list[i].policy[j]);
+                }
             }
+        }
+        free(policy->cpuid);
     }
-    free(cpuid_list);
-    *p_cpuid_list = NULL;
+
+    free(policy);
+    *pl = NULL;
     return;
 }
 
@@ -62,11 +69,17 @@ struct cpuid_flags {
 /* go through the dynamic array finding the entry for a specified leaf.
  * if no entry exists, allocate one and return that.
  */
-static libxl_cpuid_policy_list cpuid_find_match(libxl_cpuid_policy_list *list,
-                                          uint32_t leaf, uint32_t subleaf)
+static struct xc_xend_cpuid *cpuid_find_match(libxl_cpuid_policy_list *pl,
+                                              uint32_t leaf, uint32_t subleaf)
 {
+    libxl_cpuid_policy_list policy = *pl;
+    struct xc_xend_cpuid **list;
     int i = 0;
 
+    if (policy == NULL)
+        policy = *pl = calloc(1, sizeof(*policy));
+
+    list = &policy->cpuid;
     if (*list != NULL) {
         for (i = 0; (*list)[i].input[0] != XEN_CPUID_INPUT_UNUSED; i++) {
             if ((*list)[i].input[0] == leaf && (*list)[i].input[1] == subleaf)
@@ -86,7 +99,7 @@ static libxl_cpuid_policy_list cpuid_find_match(libxl_cpuid_policy_list *list,
  * Will overwrite earlier entries and thus can be called multiple
  * times.
  */
-int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
+int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
 {
 #define NA XEN_CPUID_INPUT_UNUSED
     static const struct cpuid_flags cpuid_flags[] = {
@@ -345,7 +358,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
     if (flag->name == NULL) {
         return 2;
     }
-    entry = cpuid_find_match(cpuid, flag->leaf, flag->subleaf);
+    entry = cpuid_find_match(policy, flag->leaf, flag->subleaf);
     resstr = entry->policy[flag->reg - 1];
     num = strtoull(val, &endptr, 0);
     flags[flag->length] = 0;
@@ -400,7 +413,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
  * the strings for each register were directly exposed to the user.
  * Used for maintaining compatibility with older config files
  */
-int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
+int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *policy,
                                   const char* str)
 {
     char *endptr;
@@ -427,7 +440,7 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
         return 3;
     }
     str = endptr + 1;
-    entry = cpuid_find_match(cpuid, leaf, subleaf);
+    entry = cpuid_find_match(policy, leaf, subleaf);
     for (str = endptr + 1; *str != 0;) {
         if (str[0] != 'e' || str[2] != 'x') {
             return 4;
@@ -502,7 +515,8 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
             info->tsc_mode == LIBXL_TSC_MODE_ALWAYS_EMULATE);
 
     r = xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
-                              pae, itsc, nested_virt, info->cpuid, NULL);
+                              pae, itsc, nested_virt,
+                              info->cpuid ? info->cpuid->cpuid : NULL, NULL);
     if (r)
         LOGEVD(ERROR, -r, domid, "Failed to apply CPUID policy");
 
@@ -527,16 +541,18 @@ static const char *policy_names[4] = { "eax", "ebx", "ecx", "edx" };
  */
 
 yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
-                                libxl_cpuid_policy_list *pcpuid)
+                                libxl_cpuid_policy_list *pl)
 {
-    libxl_cpuid_policy_list cpuid = *pcpuid;
+    libxl_cpuid_policy_list policy = *pl;
+    struct xc_xend_cpuid *cpuid;
     yajl_gen_status s;
     int i, j;
 
     s = yajl_gen_array_open(hand);
     if (s != yajl_gen_status_ok) goto out;
 
-    if (cpuid == NULL) goto empty;
+    if (policy == NULL || policy->cpuid == NULL) goto empty;
+    cpuid = policy->cpuid;
 
     for (i = 0; cpuid[i].input[0] != XEN_CPUID_INPUT_UNUSED; i++) {
         s = yajl_gen_map_open(hand);
@@ -575,7 +591,7 @@ int libxl__cpuid_policy_list_parse_json(libxl__gc *gc,
                                         libxl_cpuid_policy_list *p)
 {
     int i, size;
-    libxl_cpuid_policy_list l;
+    struct xc_xend_cpuid *l;
     flexarray_t *array;
 
     if (!libxl__json_object_is_array(o))
@@ -586,8 +602,10 @@ int libxl__cpuid_policy_list_parse_json(libxl__gc *gc,
         return 0;
 
     size = array->count;
+    *p = libxl__calloc(NOGC, 1, sizeof(**p));
     /* need one extra slot as sentinel */
-    l = *p = libxl__calloc(NOGC, size + 1, sizeof(libxl_cpuid_policy));
+    l = (*p)->cpuid = libxl__calloc(NOGC, size + 1,
+                                    sizeof(struct xc_xend_cpuid));
 
     l[size].input[0] = XEN_CPUID_INPUT_UNUSED;
     l[size].input[1] = XEN_CPUID_INPUT_UNUSED;
@@ -630,8 +648,12 @@ int libxl__cpuid_policy_list_parse_json(libxl__gc *gc,
 int libxl_cpuid_policy_list_length(const libxl_cpuid_policy_list *pl)
 {
     int i = 0;
-    libxl_cpuid_policy_list l = *pl;
+    const struct xc_xend_cpuid *l;
+
+    if (*pl == NULL)
+        return 0;
 
+    l = (*pl)->cpuid;
     if (l) {
         while (l[i].input[0] != XEN_CPUID_INPUT_UNUSED)
             i++;
@@ -641,20 +663,25 @@ int libxl_cpuid_policy_list_length(const libxl_cpuid_policy_list *pl)
 }
 
 void libxl_cpuid_policy_list_copy(libxl_ctx *ctx,
-                                  libxl_cpuid_policy_list *dst,
-                                  const libxl_cpuid_policy_list *src)
+                                  libxl_cpuid_policy_list *pdst,
+                                  const libxl_cpuid_policy_list *psrc)
 {
+    struct xc_xend_cpuid **dst;
+    struct xc_xend_cpuid *const *src;
     GC_INIT(ctx);
     int i, j, len;
 
-    if (*src == NULL) {
-        *dst = NULL;
+    if (*psrc == NULL) {
+        *pdst = NULL;
         goto out;
     }
 
-    len = libxl_cpuid_policy_list_length(src);
+    *pdst = libxl__calloc(NOGC, 1, sizeof(**pdst));
+    dst = &(*pdst)->cpuid;
+    src = &(*psrc)->cpuid;
+    len = libxl_cpuid_policy_list_length(psrc);
     /* one extra slot for sentinel */
-    *dst = libxl__calloc(NOGC, len + 1, sizeof(libxl_cpuid_policy));
+    *dst = libxl__calloc(NOGC, len + 1, sizeof(struct xc_xend_cpuid));
     (*dst)[len].input[0] = XEN_CPUID_INPUT_UNUSED;
     (*dst)[len].input[1] = XEN_CPUID_INPUT_UNUSED;
 
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 1cf3d400bfce..ef882cff3912 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -4869,6 +4869,10 @@ int libxl__setresuid(uid_t ruid, uid_t euid, uid_t suid);
 _hidden int libxl__domain_set_paging_mempool_size(
     libxl__gc *gc, libxl_domain_config *d_config, uint32_t domid);
 
+struct libxl__cpu_policy {
+    struct xc_xend_cpuid *cpuid;
+};
+
 #endif
 
 /*
-- 
2.41.0


