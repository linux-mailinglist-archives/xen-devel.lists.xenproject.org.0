Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0DD4C5513
	for <lists+xen-devel@lfdr.de>; Sat, 26 Feb 2022 11:07:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279726.477529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNtyN-0004A4-Pd; Sat, 26 Feb 2022 10:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279726.477529; Sat, 26 Feb 2022 10:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNtyN-00048E-Ks; Sat, 26 Feb 2022 10:06:43 +0000
Received: by outflank-mailman (input) for mailman id 279726;
 Sat, 26 Feb 2022 10:06:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y5OK=TJ=citrix.com=prvs=049eb39b2=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nNtyL-000488-AD
 for xen-devel@lists.xenproject.org; Sat, 26 Feb 2022 10:06:41 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c73de111-96eb-11ec-8eb9-a37418f5ba1a;
 Sat, 26 Feb 2022 11:06:38 +0100 (CET)
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
X-Inumbo-ID: c73de111-96eb-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645869997;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=zsEPMi+b0GEc3CfqJk274DNdvD+Emc0oA23mYPTyylQ=;
  b=NvF42VPzC46UeJUWOddqicNgos2rwCSPhQqjyFGRTOzLnG9ybxEzVfI5
   Zn7e7se6VMhUL8lEQOwhTdv8t+j/qVR8GT2k1ZTuOJgA5pkSOVD+q4MYp
   81L2aP42K1GWJScQdbICSIzgFRFLD37nvtVTAo4amsrr42Jq8C3xdWgdR
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65047790
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ff8/Yq1AxVRR2fqZefbD5fdxkn2cJEfYwER7XKvMYLTBsI5bpzYFz
 GcYWWzQbvrbZ2Hzc9wlOoq+o0wB6pHUyYU2SwU5pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tQy34Dga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1J5ZngYBgFA5fonfQsCStBEBllOPNJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u25gSQqmPP
 6L1bxJDRi7tfkZOA244M5wzo7fvvXjbfzxH/Qf9Sa0fvDGIkV0ZPKLWGNjfd8GORM5Vtl2Fv
 W+A9GP8ajkGNN2EjzuetHv0gvTImwv0XYsTEPuz8fsCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySWosLVBkPi5iTe51hFBoQWQ7ZSBByxJrT851acVkEbYgN7TNk2hZUEXD8Sz
 VrXkIa8bdBwi4G9RXWY/7aSiDq9PykJMGMPDRM5oRs5D8rL+99q0E+WJjp3OOvs14CuR2msq
 9yfhHVm390uYdg3O7JXFLwtqxalvdD3QwE8/W07tUr1v1oiNOZJi2FFgGU3DMqszq7FHzFtX
 1BewqByCdzi67nXxURhp81XQdmUCw6tamG0vLKWN8BJG86R03CiZ5tMxzp1OV1kNM0JERewP
 hOO5l8IuMILZCPyBUOSX25XI557pUQHPY64Ps04k/IUOsQhHON51HsGibGsM5DFzxF3zPBX1
 WazesewF3cKYZmLPxLtL9rxJYQDn3hkrUuKHMiT503+jdK2OS7EIZ9YYQDmRr1os8u5TPD9r
 o832z2ikE4EDoUTo0D/rOYuELz9BSNjVMCu9pcOLbbrz8gPMDhJNsI9CIgJIuRNt69Uiv3J7
 je6XEpZw0D4nnrJNUOBbXULVV8ldc8XQa4TVcD0AWuV5g==
IronPort-HdrOrdr: A9a23:ViKQxKwd/8suJBgr1MdbKrPxzuskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjlfZq6z+8I3WBxB8beYOCCggWVxe5ZnO3fKlHbak/DH6tmpN
 xdmstFeazN5DpB/L/HCWCDer5Kqrn3k5xAx92utUuFJTsaFZ2IhD0JbTpzfHcGITWvUvECZe
 WhD4d81nKdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInly6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXsIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6U9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfFz9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmcwa+d
 FVfYDhDcttABOnhyizhBgt/DXsZAV/Iv6+eDlNhiTPuAIm3kyQzCMjtbgidzk7hdcAoqJ/lp
 f525RT5cFzp/AtHNBA7Z86MLOK40z2MGTx2TGpUB3a/J9uAQO5l3ew2sRw2N2X
X-IronPort-AV: E=Sophos;i="5.90,139,1643691600"; 
   d="scan'208";a="65047790"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lq5OjQ8Tsy0ncR4/Oa/qKKNFSYWWL7SG7bua4RNfyCvr3t8xOCKv74uTPcR6S6ELS+gndF5xnTEzh1mhzaSPNdXaLk0HUgGIaLAYbvBZYbN+AUnA9lX9LdmDTM86EchWNSQvL7fK2sVIa0PI2GMxPinNEOA5j2oOIGg2XpbdydyboWzZLSWswqD26tHYJ3UR00IiyGWB3pXuJIE1KuXrq2O+fQ6GdFMfLucrR+KBdpxOPDoqSEiQ71qw6EltGBjEAE7p4A192RSfZ2/QN6sqU1nRdfb39KVjMZIJ2nQTOyNDupThc4UsU8QcDhZkMCj8OCzfRruifFi5MZGEdYrJ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0xCVDIM20YR3TZi0k5lqQzK2c1CZyooLEaYcIANKSQ=;
 b=DmZGpmqoUe04ACS040lPXX2hYY911HyJ2xXPgZlUk0ERJD39CBAX0qxo/ma+aoH6jzYLn3vRBh/H+GsHfrA67iUyaq2mr+oMx3RkMukiQyufqLjCbDvqEqlex71KXEvUDI0wSdUpo/2qIRRTezZjwWuzbbI8t8vwXQdRpzfW0h/gRlIbsx8wrxVQ4Wv/gDfcOuEz4z6iwiJJqFDjbul0mkvZlooANWdi7ftjxxDk/Rn1FBsSF53Neu9YemG1Vf4+bc7OT/G9E/QOsBEb9Y6x802o8Kn9uL7b00E2U30K2Dw1bJwpGWQWEjV19VP8o08bw7f+o0vPxRi1LuDWPMA9fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0xCVDIM20YR3TZi0k5lqQzK2c1CZyooLEaYcIANKSQ=;
 b=Te3uoDmep63HMZCsGoD9mTLDNpcmDgw5X5SccSU6dtSEFUiLYC6wDJ94TSc0PYOuNZrdanlAN4RIR9IM1OBrJ6sSUN3HPlvfqeb7X2jCZjpzUUDGV+1HLRptPPaoTJKh39Q3i3WypIz+2owY7N9HxZtY1bqo36l8i0TX4sRIOwA=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Alex Olson <this.is.a0lson@gmail.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2.1 2/2] vpci/msix: fix PBA accesses
Date: Sat, 26 Feb 2022 11:05:54 +0100
Message-ID: <20220226100554.2664-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d8da3251985684ab9099ce95a8329a7e35535a7b.camel@gmail.com>
References: <d8da3251985684ab9099ce95a8329a7e35535a7b.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP123CA0020.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a167a006-47bb-4ff5-26f5-08d9f90fa8e6
X-MS-TrafficTypeDiagnostic: MWHPR03MB2925:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB2925F86F8A6D80D2B757F85D8F3F9@MWHPR03MB2925.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t70UQQeOmmoP+2N0tHh7emT0Dv1I7/sa7Lo7oMNqjVCfPlBAUPkGIRm6YA29uIowZKBFblWCyK9HjAcoJCcIJ0P77QSzmIzhjna3RDC6voezZk7dT9/dOBQivJ80d+MH0ZRFl4cMf9fOqebUrPlybY0JORsqrUerZxq1lyryxUXae9cNKznoX/NNSM/zHF99nem6AwF8yU9NYvxH308pSJeBUwVrrWDhIXWIRqL0GQIeUiU47aUignEjjrexcxndrcFYDixa/ZvyEFQWgp4ThDKiuBh8HJUSeK5y/ybwhLga+RraatcSIMeSVWPHrmRYwBbLPlXY3U0t5YsVZIZ4OuCtaMwi/7D4NMvyTS6wBRY1fhmHGynf21ybu4jkIHrzgmKmOVN6her9q6IirQ0HEHGBpdITnexAvzHrkhysVBIVl0RoFIvkz1B2Ymz5ClOa5xmbWsZHLIhTOxPGUrM3CiqzxWyVQI1SYYeN9E1n3W3aC8c11jbf3SYNNGVUB3gnnjoiudGhKeUyfehw2XqoZlldDplRuWtStKm13XIMDawb3z0Zbs7hiQ9AB1UYDubTSHXsmyyEEjmCqPjxnarjo4KW+0iX2Ud8gB4QLBQoiMKcLS/7w5Ql5oML09z9IatOEK0IJtuMcvp3GqlIe+dNPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(66946007)(66556008)(66476007)(5660300002)(316002)(8676002)(508600001)(1076003)(2616005)(82960400001)(6916009)(54906003)(186003)(6512007)(38100700002)(26005)(2906002)(83380400001)(4326008)(6506007)(86362001)(6666004)(8936002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEFIVHl4dllwMjJmZnM3RmYvTzQrNVVKM0JxNk1mdEY3UDBpVFJKMUVTNy9s?=
 =?utf-8?B?OHRLTThnRENZby80bGJBYk0xMi9RRHRhR1BYRlRyam0wbWtKL203aVZ6K3Uw?=
 =?utf-8?B?SkU1QVlRdVcycDlzTmVmTFlTcjZDVnAzMUd4dW5tSkVDaFZUejZIT0xjcy9P?=
 =?utf-8?B?bTZtN0tWLytVajNCd2ZFdmVJOXMzTTJwYXJRdlZBa0ppK1NGeWNIRGtnMml1?=
 =?utf-8?B?RkZjVm04b1l2cmt0Wkw0NkZoVmhjL21ZYjdjaDJZNE9ieUo2NmhTWE1zWFE3?=
 =?utf-8?B?Wjg4SitGNVA4YmtkSlZSZkdzNnJHeXdGSmJCMlo2UHR1UGVWL29xanYyUFRP?=
 =?utf-8?B?aEpHOW50UnV2b3lxQzAxZTRBR3BPTjBaeWx2V0hYS1BiU3R5VmxsRC80UFZE?=
 =?utf-8?B?eGRPM0J3VlBwSnNQNHQ5eXFyVTZyYVIzS01ZQ0JwU09Sa0pLWkRjWHFabkcy?=
 =?utf-8?B?L2grNWF4THlWYjVpWDB1NkxscHVaRVNSQmJhUGpKZmJmS1lGNWplSm54Mzho?=
 =?utf-8?B?emlvUkJnVTVveThvSU9pWVIrMVZtSWdVbHFlcCtNd1hOcGpsRFJDWjVVYnVX?=
 =?utf-8?B?U0plMU1xZEdRNFNNb0xLckxZYUFCbXpIaVJhSnF3VE16RHI2OWg0WnNaTkFw?=
 =?utf-8?B?V2M2Qm9tNHVBcmprajhablYwaG1iSjF0UncyRTBMTW1aaW9UdUZ2V2dsZXNi?=
 =?utf-8?B?Y2pqZ0loRjk2TE0wRXluak9hVkF5aFlTZlVWVFFHMnN3UnZHam5HWmNaSVU2?=
 =?utf-8?B?SGlHQ0xtRVQ2YkZ5TjVERTZuMjhieE9pV0N6QXc4Z3F6U2xpemZEQVNwMzlz?=
 =?utf-8?B?Q0NoeXFmenhua0pSYkNOOWZubWRYeEI2YmRMMm9KR0dBRU9OY3p0L2VETkxZ?=
 =?utf-8?B?UnZROHpqRVFEVHNQSEVzSmxCanlTdnBpeDRzMGg5NFY4L3RsQkN5TStkNno0?=
 =?utf-8?B?KytGdlloeDM5dUZHUE5tWGprRVplQ240ZkZqWFNhTzdVUGkydnVMSm5qU1oz?=
 =?utf-8?B?amRIblF3cTVuSXQ2M3ZHL3dRTE1YRk91WXFIb2dFZmZWNUtnWGZmbmJKNUow?=
 =?utf-8?B?MTVnUVErOGVodnlRbjZMNHV3UC9PejJlNTc4MCthLzlRMnRXNkxnVjZ6TXoz?=
 =?utf-8?B?VWdLQzh3K0pFeDh6bCsxMjNpVG1tTG5acHNoSGVlNGpHMHg4OTZRT0VTbkhw?=
 =?utf-8?B?cU1SS0hrUGZxRCtiR09ibmIwZ0dPbm14Q3hOSXhHWExXSE1CVmhlbUY2VTRV?=
 =?utf-8?B?bFM2dG5NR0ZGWHRuQTgvV1g4NDl0bXF3WG5MR1hQMVUzUE16eWVQRy9pNlJl?=
 =?utf-8?B?a2RrWlAxN2RvLy9zU0ZmZXN5T3d0ZUlpclBTS1hxZDRvc3ozQmdwb21lOXA0?=
 =?utf-8?B?QmR1VitkOGI5MUpHMzdNVUZsTlZJOHRabVhOUWUrTkpEaFNVWUNFNC9BKzNP?=
 =?utf-8?B?VmVmNUJwNjVoMTVGOG1wZlNScGpKV0Fyd1V0ZHI2OGJ0cWVWUUprdjBzMU15?=
 =?utf-8?B?UmdQN1dLejJFeGJoc1RudWJZMU9nZ1ZyVXREb0VlVkZMTTBUOE1kMk0rWE1O?=
 =?utf-8?B?YmM4UHdxWDlpaUM1K2lCR0cxaTVTSkZvekFCeUFhMVh0MEk4dGdoSUZIU0NS?=
 =?utf-8?B?clJHMDhrSjRyTGsramhXa3BUUmJIalpwNnQrTjVQZHdnY2lHc2NWWHVUa09u?=
 =?utf-8?B?TkJIdHh3UnRYcldIL2VvSDVzbkI0Lzd4V1JFMkdaRkx1bCtKaTREYUo1djQ0?=
 =?utf-8?B?c2R3YW5xS2liV0puM3dEem5ySTM4SmIxMjdJeW1sQURWd3EvZUFpMVRNMytm?=
 =?utf-8?B?ZEhRZVc3WjROQWFZL3ZUNzhqakw5cTNQQWRrMHltTFQzMmRBSXRCeUl0ZGJr?=
 =?utf-8?B?N0tkV2kyZCt0RG5sWFFpVGRyY2J6Skh4NEhvVWQvZFNJSiswRnJuRk56a1RI?=
 =?utf-8?B?SXZjY0cvbFNuREd0cXhOekgvZmtjNzlXTUQ3dFBVakVkSU9IaGJZSVM5aVZX?=
 =?utf-8?B?SkZzcTR1MWFVY3R0V2dvZ05WZCs4dCtXdjluRFhLNUpMTWUzb1ZLcDc3eGVz?=
 =?utf-8?B?eDErdGVqN1V4QUNzdzRnS0E2aDJxQWdzL242RXdESy9BdzR1d05RV1FKRmk4?=
 =?utf-8?B?WXh6akR4WDE1aXhnSFlpclBxZytDYjV0WnFzUlF6ZnhxQm1zTlBZekNDT0Jl?=
 =?utf-8?Q?ESuFWn90kmuP+vmD/UXX7os=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a167a006-47bb-4ff5-26f5-08d9f90fa8e6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2022 10:06:30.5147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ggDswAyaNnzuaHIULKKHDwSZD94NG9zhSJ0a4KOClpJbeIDpIAYLC8jH+Is5tLZHE7euO9VR+7zqbcOqV8NNFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2925
X-OriginatorOrg: citrix.com

Map the PBA in order to access it from the MSI-X read and write
handlers. Note that previously the handlers would pass the physical
host address into the {read,write}{l,q} handlers, which is wrong as
those expect a linear address.

Map the PBA using ioremap when the first access is performed. Note
that 32bit arches might want to abstract the call to ioremap into a
vPCI arch handler, so they can use a fixmap range to map the PBA.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Alex Olson <this.is.a0lson@gmail.com>
---
Changes since v1:
 - Also handle writes.

I don't seem to have a box with a driver that will try to access the
PBA, so I would consider this specific code path only build tested. At
least it doesn't seem to regress the current state of vPCI.
---
 xen/drivers/vpci/msix.c | 56 ++++++++++++++++++++++++++++++++++++-----
 xen/drivers/vpci/vpci.c |  2 ++
 xen/include/xen/vpci.h  |  2 ++
 3 files changed, 54 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index a1fa7a5f13..4775f88e1f 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -198,8 +198,13 @@ static int cf_check msix_read(
     if ( !access_allowed(msix->pdev, addr, len) )
         return X86EMUL_OKAY;
 
+    spin_lock(&msix->pdev->vpci->lock);
     if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
     {
+        struct vpci *vpci = msix->pdev->vpci;
+        paddr_t base = vmsix_table_addr(vpci, VPCI_MSIX_PBA);
+        unsigned int idx = addr - base;
+
         /*
          * Access to PBA.
          *
@@ -207,25 +212,43 @@ static int cf_check msix_read(
          * guest address space. If this changes the address will need to be
          * translated.
          */
+
+        if ( !msix->pba )
+        {
+            msix->pba = ioremap(base, vmsix_table_size(vpci, VPCI_MSIX_PBA));
+            if ( !msix->pba )
+            {
+                /*
+                 * If unable to map the PBA return all 1s (all pending): it's
+                 * likely better to trigger spurious events than drop them.
+                 */
+                spin_unlock(&vpci->lock);
+                gprintk(XENLOG_WARNING,
+                        "%pp: unable to map MSI-X PBA, report all pending\n",
+                        msix->pdev);
+                return X86EMUL_OKAY;
+           }
+        }
+
         switch ( len )
         {
         case 4:
-            *data = readl(addr);
+            *data = readl(msix->pba + idx);
             break;
 
         case 8:
-            *data = readq(addr);
+            *data = readq(msix->pba + idx);
             break;
 
         default:
             ASSERT_UNREACHABLE();
             break;
         }
+        spin_unlock(&vpci->lock);
 
         return X86EMUL_OKAY;
     }
 
-    spin_lock(&msix->pdev->vpci->lock);
     entry = get_entry(msix, addr);
     offset = addr & (PCI_MSIX_ENTRY_SIZE - 1);
 
@@ -273,32 +296,53 @@ static int cf_check msix_write(
     if ( !access_allowed(msix->pdev, addr, len) )
         return X86EMUL_OKAY;
 
+    spin_lock(&msix->pdev->vpci->lock);
     if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
     {
+        struct vpci *vpci = msix->pdev->vpci;
+        paddr_t base = vmsix_table_addr(vpci, VPCI_MSIX_PBA);
+        unsigned int idx = addr - base;
 
         if ( !is_hardware_domain(d) )
+        {
             /* Ignore writes to PBA for DomUs, it's behavior is undefined. */
+            spin_unlock(&vpci->lock);
             return X86EMUL_OKAY;
+        }
+
+        if ( !msix->pba )
+        {
+            msix->pba = ioremap(base, vmsix_table_size(vpci, VPCI_MSIX_PBA));
+            if ( !msix->pba )
+            {
+                /* Unable to map the PBA, ignore write. */
+                spin_unlock(&vpci->lock);
+                gprintk(XENLOG_WARNING,
+                        "%pp: unable to map MSI-X PBA, write ignored\n",
+                        msix->pdev);
+                return X86EMUL_OKAY;
+           }
+        }
 
         switch ( len )
         {
         case 4:
-            writel(data, addr);
+            writel(data, msix->pba + idx);
             break;
 
         case 8:
-            writeq(data, addr);
+            writeq(data, msix->pba + idx);
             break;
 
         default:
             ASSERT_UNREACHABLE();
             break;
         }
+        spin_unlock(&vpci->lock);
 
         return X86EMUL_OKAY;
     }
 
-    spin_lock(&msix->pdev->vpci->lock);
     entry = get_entry(msix, addr);
     offset = addr & (PCI_MSIX_ENTRY_SIZE - 1);
 
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index f3b32d66cb..9fb3c05b2b 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -51,6 +51,8 @@ void vpci_remove_device(struct pci_dev *pdev)
         xfree(r);
     }
     spin_unlock(&pdev->vpci->lock);
+    if ( pdev->vpci->msix && pdev->vpci->msix->pba )
+        iounmap(pdev->vpci->msix->pba);
     xfree(pdev->vpci->msix);
     xfree(pdev->vpci->msi);
     xfree(pdev->vpci);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index bcad1516ae..c399b101ee 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -127,6 +127,8 @@ struct vpci {
         bool enabled         : 1;
         /* Masked? */
         bool masked          : 1;
+        /* PBA map */
+        void *pba;
         /* Entries. */
         struct vpci_msix_entry {
             uint64_t addr;
-- 
2.34.1


