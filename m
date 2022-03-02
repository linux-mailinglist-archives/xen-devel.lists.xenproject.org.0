Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E834CA811
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 15:29:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282278.480931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPPyM-0000cD-KS; Wed, 02 Mar 2022 14:28:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282278.480931; Wed, 02 Mar 2022 14:28:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPPyM-0000a1-Du; Wed, 02 Mar 2022 14:28:58 +0000
Received: by outflank-mailman (input) for mailman id 282278;
 Wed, 02 Mar 2022 14:28:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LB9Y=TN=citrix.com=prvs=0530a50c4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nPPyL-0000Xm-AX
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 14:28:57 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 165621bb-9a35-11ec-8539-5f4723681683;
 Wed, 02 Mar 2022 15:28:55 +0100 (CET)
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
X-Inumbo-ID: 165621bb-9a35-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646231335;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Uv6+k4P+pq/NsyHUUBb3gegl0iO3HUiZOvNvr/hkT1s=;
  b=EmHrMjtiumErP4dK43Z+n6EJpc8p5ropFmAmL/NLxaIZnhAz2bYK8vct
   dBElmz9ZkyeoyBfiYLLFdv0YcpIyzH2ABetqNf5+FXpRhyb+5cmLKqWxg
   JCwEeYVEkabeMqQBba0uVLxHk21/86f8uL3hZeZCWr19QOfD75Vm90bUt
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65302961
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:pxiJ26oHSCjSw/44ffkVUe3SPfdeBmIzZRIvgKrLsJaIsI4StFCzt
 garIBnVO/aJY2SkKNB+Po229B5XvMfRyNNiTQRlriBnEC5H8ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvW4
 Ymq+KUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBHJfjv9hNWglhOR5aGvVU+bbpGHKurpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI1zbWAOxgWZnea67L+cVZzHE7gcUm8fP2O
 ZdCMWA+Mk2ojxtnGg8qCasZge2RpFLbSzhYmmi7u7Y8/D2GpOB2+Oe0a4eEEjCQfu1ZmUuSq
 2bu9mHwEBYcctCSoRKH73ati+nnjS79HoUIG9WQ5vNsxVGe2GEXIBkXTkeg5+m0jFakXNBSI
 FBS/TAhxYAx80qxR9W7QBy8o1aDpBcXX9cWGOo/gDxh0YKNvVzfXDJdCGccNpp276faWADGy
 HerpfzOOWxmoIS/dla6rqWVpB2LMzkKeDpqiTA/cSMJ5NzqoYcWhx3JT8p+HKPdsuAZCQ0c0
 BjR8nFg2ux7YdojkvzioAuZ227ESo3hE1Ztjjg7SF5J+e+QiGSNQ4WzoWbW4v9bRGpyZgnQ5
 SNU8yRyAQ1nMH1sqMBvaLhVdF1Kz6zcWNE5vbKJN8N7n9hK0yT+Fb28GBkkeC9U3j8sIFcFm
 nP7twJL/4N0N3C3d6JxaI/ZI510kfa5S4y9B66NP4Amjn1NmOmvpnsGiam4hT2FraTRuftnZ
 cfznTiEVx729piLPBLpHrxAgNfHNwg1xH/JRICT8vhU+eH2WZJhcp9caAHmRrlgtMus+VyJm
 /4CZ5ri40gOC4XWP3iImbP/2HhXdBDX87it8JcJHgNCSyI7cFwc5wj5mutwK9Q4xP0Ozo8lP
 BiVAydl9bY2vlWeQS2iYXF/crL/G5F5qHMwJys3Oli0nXMkZO6SAG03LfPboZFPGDRf8MNJ
IronPort-HdrOrdr: A9a23:ok4bvKgwAR1gvhTT75pcEoxmgnBQXzh13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskaKdhrNhQYtKPTOWxVdASbsN0WKM+UyHJ8STzJ8+6U
 4kSdkENDSSNykKsS+Z2njALz9I+rDum8rJ9ITjJjVWPHtXgslbnnlE422gYypLrWd9dP8E/M
 323Ls5m9PsQwVeUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZpzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDl1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9kfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWz2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 gjMCjl3ocWTbqmVQGYgoE2q+bcHUjbXy32D3Tqg/blnQS/xxtCvgklLM92pAZ1yHtycegA2w
 3+CNUaqFh/dL5nUUtDPpZyfSLOMB20ffvtChPlHb21LtBPB5ryw6SHlYndotvaPKA18A==
X-IronPort-AV: E=Sophos;i="5.90,149,1643691600"; 
   d="scan'208";a="65302961"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DoLDk55JAlb6DWt9Lc5jdbn3zekeMF3gnDdYE+ZZOrHyGWK1iWOpSo9By1jCvobYNTdMyncHxT5nt7YUumwfmwycwLR6mxE3PDx08neO2IAgGwJnGAA+MWJLBf+LUMLgYbGLEuEDyyg5e23s80/Uim7Qd4oGmBYD9+pgNCQExxkHs9Aup1wB1TRJCM71Sbe27ZdSeS8Hdk1SuuM4ghTscB7y1E/H9Zr1oFahTrA7Domf6W+rcswPH9SWQprt3b5VjQe/B61oK3/oamDKhIngQy0DOb48uq0hrVePBEXSLFt+FwqvuI2PWRGLYV6/t1D3693blDfKKvpZv5gQ7aM6hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXqJC3FYz1zgAzycpIM3RwRbyRXV+eqnGOl8ZN4IR7w=;
 b=mtXokVnSmQlbFSWEnVeVR/wd9R/tRfpI9LGLDEOAEZq7+qrRMNhBPT1YNoI8n7tFmmpw9IDluxazPAk/8Ezynl0v20RSzTws1w4lfrC7DgiyHRids5tqNY8sbRHsxAExtMPQSpXy+xDFB67sadcDl0DoF4F5bh8q4awGpOAbV5xYGGbwvEDqlFUKNCyChoeageLfhnEt5zYBoFgclJsUZxWWtW4iICyzV4na1MuSahAu/1n27I/rKFJBAqq9irtJXCcBGg9uN2RB5RswHQfQpKV6uP5CBOUIRl5Tqk2PvM5WHhAZ6a+c56v9WQ0FrGqYIi76Fjf5oCTZWKICtAAUAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXqJC3FYz1zgAzycpIM3RwRbyRXV+eqnGOl8ZN4IR7w=;
 b=m7J2xEqvcnJb4RgQu2GQBgGEnY4hZ0sCLtqjRXwuCKhzrXBo/MqrvvmGK5d0kzsDzBwKyar0vI3zMQAD08pt6RWBtnSZkcT29XCTeV4WoDyeLKRD1aOCXub8lIfmFIgxzNOid8SBr485TaDjB/tv18OyTmoP3VC9PEnbqvIa0+Y=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <ross.lagerwall@citrix.com>, <konrad.wilk@oracle.com>, <doebel@amazon.de>,
	<julien@xen.org>, <Andrew.Cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: [PATCH 1/4] livepatch: update readme to mention --xen-depends
Date: Wed,  2 Mar 2022 15:27:08 +0100
Message-ID: <20220302142711.38953-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302142711.38953-1-roger.pau@citrix.com>
References: <20220302142711.38953-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0125.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f516a324-02bf-45bd-1132-08d9fc58f815
X-MS-TrafficTypeDiagnostic: BN6PR03MB3330:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB3330BD763E6B12BB13A4A35C8F039@BN6PR03MB3330.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hX2dYJKiUMp6U8u9xSRYboAp0tZg1AvPN/1qN6dX1iZKUO7urCAsLCJCG71s7G4ONvTJhNVMeOmIUkUmz5RNl/DIVfClTwehihxAaXoRkzey3jFW09SZrodcD/JqzVMiTGH6u3oP2CV6o6QjeItgczQe+U4VciSg+U9x8kc9edblyBlweLaD31kO5dx47wnVUwbpPIrZLKgbhLInVxdSWaeJ9WEOiLzDm7yCrfJ8PfrJm18sQoMH2iiEruGqoQGU8uuNp8IkGWWVj1NDS+WEMdXsHwUmN/v+Z2r2UVEd3mPasoAM6wbDBZY+vc+LPbIAMREDb9nxFw2RYuLY3qFABkA5KuyiCI0q5RgxohjGyoh3zvUekZIT5Na2ip14bQ/AALh5Ao1fFFpfiVA5r6sU7ojN5VYb596KDpbzHVe3MpkkwwlbqHKFevYYCjlp2mW74mC231MD/RC4np99cj32BDtJox0jIzQ37FR08F2KUUblkdtFMav9J6egp116qs0+wlR32ywJ4UN2VryBfM/G4xCNjTRhBLN4b8zOg3ZPl0yEyx5fwitiri+NgFNzXyVm80Kg9pHu/HwLUb3iGGt5yzFDGiAH76ghCFQyV4hl+5kBI/BwiveY/BaPYFk0akX79k1Is60EnU1ZFmnja3IYOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(6512007)(6666004)(38100700002)(66476007)(66556008)(86362001)(66946007)(508600001)(316002)(6916009)(4744005)(82960400001)(5660300002)(6486002)(8936002)(8676002)(36756003)(2906002)(83380400001)(26005)(186003)(2616005)(1076003)(107886003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVBYb2g3SlU5L3BpYXl5M09DemJvRjd6aG9yRGdLaFVmMGNpMUF5WnB6Q25R?=
 =?utf-8?B?VldxN21SQ2RFRzFyTHpNbmt2U2UvZFlGYlBMQmhNdDdYV3ozbmdxNXFVZGtv?=
 =?utf-8?B?cWE4SDY3amVmbmJmMzNyeEpRZWZXWjE5d2RCN1ZkMnM3aC9zQ0wvWE45aXhs?=
 =?utf-8?B?Snk1QktCQlE5eDY4S0xWVjdkUVdFVnh5bm90UlRmMXZKQ0VSSW9haEhTdExK?=
 =?utf-8?B?YTVHOWxFajFtM1EvR2VwT01acUo4WDVKRUNCZmpLcmRaQVF3Yy92QVE2Y2JZ?=
 =?utf-8?B?R0RaRVhZSnhHTXV1U045eTducnV0VUxoNlJUSzhQN1NxeldqdDZHUVN1TEtY?=
 =?utf-8?B?WHNSVlJmNTNRWGhoRm5kYXJKcU9EWW13bk5WR0E0Q1R2ekJqRmtzeDE2dHM5?=
 =?utf-8?B?WW54c2lxWDN3R1Y2ai9RTkVyZjZCN0VrSE9Ia3MxM1prM2ZDMm90ckJMR0lL?=
 =?utf-8?B?OGgzTzAxR21Ebm9sYzFRUDRVSThVK2NyMnNXMUpOVkZGajVONTZxVUdzZi9N?=
 =?utf-8?B?aHVadUpIYVY5WEVHWVJPUTl3bStlcTBVUXBXY3oyb05Md0lZTVM2ZSs0K2pJ?=
 =?utf-8?B?VS81aUY1RHA1WldtTTJ2SG5lWE5DdkIxeVhMY1huNlcwS0Z4T0xseDYyYmZh?=
 =?utf-8?B?clcwd2xpbzRVaktEdTUxQlk4STh1R1Nsam5KZjdieWcveFlJbC9ycDRtNzVx?=
 =?utf-8?B?QXZTcVVqWGdUUWhSa3VsS25FaWtTbHB3ZmMzR2ZabzJML2tsRHcwUzI5b1kw?=
 =?utf-8?B?WmxZeWwwVnBLNnI5TmpjN2tERXlvK2dmcWM2SXg5cks2dU81R1Y2VENRMU5E?=
 =?utf-8?B?cUtzZmNLckFmdDF3S1EwemVjVU55UlkrT2dzNmRMMzJzSUZCeVlNTlp4MUxX?=
 =?utf-8?B?ZjlqYm90NnI1RGtuVVF0VU5xL09lWEFOcTdMZ1huNC9nZ0NvaGJGNXgzVE5P?=
 =?utf-8?B?VDFFbkUvWGFvait4R2FFRytJcUNzdndpNURuYnFNckQzMnVhRUN3b0hFai81?=
 =?utf-8?B?SXAxSVNWNXR5T0J3ZXNnSHNibWNhMytZNCtBajl6b3FFRVZKbitHb2ExdGlw?=
 =?utf-8?B?OWhOZmdFM09GWHI3cFZQUTFBaVYzaUpKNWd0RW5ZUy9reDJyL1J0Vjk1RTBY?=
 =?utf-8?B?c2VlaTkzYkQ5YXRzdnBpS2NaMkQxNDQ0UlJDRDd2eERvdnYvenoxUFhmOUl0?=
 =?utf-8?B?OHZqeWo4QmQyVEJUK1FaYTlzcTNVc2kxYUdWYkROWWoxZWJFSTRqNGJrYkpw?=
 =?utf-8?B?WHFxMUQ2b0JFOThBUXNtdzRpaG9JL29sSGFsQWwzQjdGY3BZczlaNmtLeng1?=
 =?utf-8?B?VWkvRVNDVFNla2ord0phOGtLWXNhUVRrekIyUWVDYUtMVWFyK0RYUGRESi9m?=
 =?utf-8?B?bnNlczd5V1BTWGszbUxJdHc1bmlaNUM1SWRCQk43enhDNUIwNUE3Ym9HMGVP?=
 =?utf-8?B?TDRBa0J2VFNzaklGVi9nYlBkUkZGbldEL1lWOXdmcDVoRlBDWW9yQmNESnhq?=
 =?utf-8?B?MEwzb1AvVENKQUpGS0ppY0FhTlA3ODI2WWVTUkorNGlDTkhLcm1LaWh6ZzJE?=
 =?utf-8?B?OE5rUW9pQ1VXb2pGbGJnQzR3M3FoaUpIUHRwdTNodytlZStSK2ZZaGxDbjVs?=
 =?utf-8?B?SlhkZ25jclFmUmM1UmhqeGt0eFRuVFk5c1FjdHdYUGdhUEpFeHg5UnVwV3VH?=
 =?utf-8?B?d2FJL2x1MjlXSldoL09DbzJPQStnQTlKOEVpaHhEYTAyWWxPb1JxamtZam9U?=
 =?utf-8?B?ZTQzT0xiZkFMaTRVRXo0VmpjSHR0YUMwMXdiWG1sbFhud1RLMlV2L0NYekVv?=
 =?utf-8?B?blJubkh4Ky81Rzd6V1VpbGk5V3piallZaTNrWUU2ZVA4MXpsb1F6QXBwbEtu?=
 =?utf-8?B?RkNmdHRoYkttS1Myc1VENnRsQ2Q4UXd5NmNqb2ZnYzFkSXVZamZ4SWYzSGpx?=
 =?utf-8?B?TlZUY3JVUzJtM3Q5MEJ3VjBHa3ZBS0FqTDUzYkNxK0h5Zi91cU84Njg3VXNN?=
 =?utf-8?B?bEh0QkcycVhOSnh4aU1ZYkJmYko1a0FLaHQ5ZjByNjI1d0NocngzTllPeFNi?=
 =?utf-8?B?VGNiNWlwMW1UZHYwbFY2WEEvWnZCOW9XSG1jL3F1UmNFSE5NbWJLRnU5eHg5?=
 =?utf-8?B?SCtIQXh2cHhHZWJoZnZGMXJ4QUZld1hQanI3U0JpaTdSQWFEV21YQ0YxaXhZ?=
 =?utf-8?Q?V29x7qL8cpwjQJW2VqXuj48=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f516a324-02bf-45bd-1132-08d9fc58f815
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 14:28:50.0280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U3N4Gy76DFa2vPVCOKFgb94DZ1fA8UEVonjjLzsIxcT4oJV8Byu68/sDv7nW6Ae+p3jG/uPk+5QNyHsadNoHjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3330
X-OriginatorOrg: citrix.com

Fixes: b19df7b2c05e ('livepatch-build: Embed hypervisor build id into every hotpatch')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.md b/README.md
index 653c624..b48a3df 100644
--- a/README.md
+++ b/README.md
@@ -24,7 +24,7 @@ Next, build a live patch, using a patch and the source, build ID, and
 ```
 $ cd ~/src/livepatch-build
 $ ./livepatch-build -s ~/src/xenbuild -p ~/src/xsa.patch -o out \
-    -c ~/src/xen/xen/.config --depends $BUILDID
+    -c ~/src/xen/xen/.config --depends $BUILDID --xen-depends $BUILDID
 Building LivePatch patch: xsa
 
 Xen directory: /home/ross/src/xenbuild
-- 
2.34.1


