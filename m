Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA0E47037B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 16:07:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244000.422141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvhUN-0008Ip-Pz; Fri, 10 Dec 2021 15:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244000.422141; Fri, 10 Dec 2021 15:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvhUN-0008Gc-Mj; Fri, 10 Dec 2021 15:07:11 +0000
Received: by outflank-mailman (input) for mailman id 244000;
 Fri, 10 Dec 2021 15:07:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o/FQ=Q3=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mvhUL-0008GW-Lr
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 15:07:09 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d60d4c9f-59ca-11ec-ad7a-b7ef48004f0a;
 Fri, 10 Dec 2021 16:07:07 +0100 (CET)
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
X-Inumbo-ID: d60d4c9f-59ca-11ec-ad7a-b7ef48004f0a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639148827;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=e+QBid0dfClaHU4kPXjbkLwl7aP0ZrOhv8nDFh4vOKI=;
  b=PmTsQTZ2mxgVO6SP/rWH8V025qGnHcEiAiuxTeoJbMtf2u3M2QLCp+06
   0r4V3zx9h/jESHB6OVG015Q8t/nxEiVqBaYI5zZCco2ecc3av2/9lDQnA
   P6OWTvDggvZcto4fptdauj9O8D0Tt0z8pUPJAhiUHT/C7Beoff1ZVJlnc
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: A271ZuiUczvl67zjsTHEO9ohmfEqhN3Dj26ivXM0SAie4ALlS7malkGThZCKKwjKvyqJf70Kx1
 hlRhhneRQc8ZOXb3H2M03eAIZwGslIkjAGRrU3s8HoLsPjUsDCJwq+/hFRos2rRHU6zr/HM2MO
 R5g8fyyJQ1shmnWlPfAEVjzwC/T/xU1HYOMYOoYPbplC/RgOQgs7k/6qcg7BydIagrHze8pHCY
 C1qF4a6PIThmVT+okyjHhbyiSFr/DqEKUsYYQNqyEQWYUS8sNugkI2kGyg0royYL2zwXKnl9pt
 m8RxXXEPNKwwa8w8ezTX8m3h
X-SBRS: 5.1
X-MesageID: 61806446
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:TKnItK1mNw8xf5tsmfbD5XJ2kn2cJEfYwER7XKvMYLTBsI5bpz1Rn
 DQcDGrXafmPZWf2Lt51YIng8BhQ6pLQmNNjSAVqpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn970Es5wrZh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhlupxk
 O1J7cGMChoHPZD1lLo2QilxHHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6Diu4YIhGls2p4m8fD2T
 vUhNSQsY0X6Zz5WC3IGEYgzhcazmSyqG9FfgA3M/vdmi4TJ9yRzzbzsPdz9atGMA8JPkS6wv
 Xna9m70BhUbMt23yjef9H+owOjVkkvTR4Y6BLC+sPlwjzW7x3MRIA0bU0Ohpvu0gVL4XMhQQ
 2QW8Cczqak59GSwU8LwGRa/pRasrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQy3
 0KNt8PkA3poqrL9dJ6G3u7K93XoY3FTdDJcI39fJecY3zX9iIgJjkr3So4+LO2ooN7IID2u6
 CG6hSdr0t3/kvU3/6m8+FnGhRelqZ7IUhM5623rY4610u9qTNX7PtL1sDA3+d4Fdd/EFQfZ4
 BDojuDDtLhmMH2bqMCarAzh9pmN7u3NDjDTiEUH83IJp2X0oC7LkWy9DVhDyKZV3iQsJW+Bj
 Kz741o5CHpv0J2CN/cfj2WZUZtC8EQYPY65Ps04l/IXCnSLSCeJ/Tt1eWmb1H33nU4nnMkXY
 MnAIJ7zUCpEUfU7lFJaotvxN5dxnkjSIkuJGvjGI+mPi+LCNBZ5t59bWLdxUgzJxPzd+1iEm
 zquH8CL1w9eQIXDjtr/quYuwaQxBSFjX/je8pUPHsbae1YOMDxxWpf5nOJ6E6Q4zvs9qws91
 izkMqOu4AGk3iOvxMTjQi0LVY4Dqr4j9y9mZnJ1Yg7zs5XhCK72hJoim1IMVeBP3MRozOJuT
 ulDfMOFA/9VTS/A9ShbZp74xLGOvjzx2mpi5gKpP2oyeYBOXQvM9oO2dwfj7nBWXCG2qdE/s
 /ur0QaCGcgPQAFrDcD3bvOzzgzu4ShBybwqB0aYcMNOfEjM8ZRxL3CjhPEAPMxRew7IwSGX1
 ljKDE5A9/XNuYI87PLAmbuA89WyC+J7E0cDRzvb4L+6ODP05G2mxYMcAu+EcSqEDDH/+bm4Z
 PUTxPb5aaVVkFFPuot6MrBq0aNhuIe/++4EllxpRSyZYU6qB7VsJmi98fNO7qAdlKVEvQaWW
 16U/oUIM7u+J864QkUaIxAob7rf2KhMyCXS9/k8PG7z+DRzoOicSUxXMhSB1H5dIb9yPN93y
 OstopdLuQm2ix5sOdealCFEsW+LKyVYAakgs5gbBq7tixYqlQ4eMcCNVHeu7cHdcchIP2krP
 iSQ1fjLiLlrz0bfd2Y+SCrW1u1HiJVS4B1HwTfu/bhSdgYpUhPv4CBszA==
IronPort-HdrOrdr: A9a23:57I5lalNZoiuF3ca9kD5fXD3zFLpDfPIimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdeEYbmIK8/oSgjPIaurIqePvmMvD5Za8vgZQpENRGtldBm9Ce3mm+yZNNW977PQCZf
 6hDp0tnUvdRZ1bVLXxOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mJryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idhrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT1/DRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amHazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCS2B9vSyLbU5nlhBgt/DT1NU5DXCtuA3Jy9vB96gIm3UyQlCAjtYkidnRpzuNLd3AL3Z
 WBDk1SrsA8ciYhV9MIOA4we7rGNoXze2O/DIuzGyWvKEhVAQOEl3bIiI9Fkd1CPqZ4i6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.88,195,1635220800"; 
   d="scan'208";a="61806446"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F19eNeFCVVOzMqHNbc/kiDsN1e9mruytmJ+7cPTvBGSn29crSEFyhSN6tyy/XttVAa888qGVUARfIUbnyzzLfchTx2cUXDZu8C5JdnmrmqlOU+BNdKKdt1T01A706SOVJAWsHkoM7zyDBcMSU1NNFAQkrMtoUVCspRR5nl90bG8/QSM4hMIyb16ByVivlj942NRARGXnq6ALADosC6dXbfFPsHCEGk2bqYsuh/5zFgzU1t+ntr7oKof1bcrs0PH63O+hj+Hdp085JwBTjiFR5gNOOLImunZo2qaxX8XrWLjL+zHCF5XGdyGDaFQlkPtS6xC8KI8lXhEmGX4Z21GkIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDCPmv99RgsOQid8kfkssZfAP/dlCNB1gprSfG0nPq0=;
 b=m2hkrXRBvhSFszCyPc1WDlXLg0GN56CZoGo7UNBvNP2y5zZX/cPB0QNMlT293KYdzaCg0VwB5jBsqFGS1135BtdZHeJD//d0VBOOKyvDBOJMTt2SJd+W7nP4JLKSd8KIWMYXYjZlC7DJX6pPpCiyCA9d8OZxs3/Tv1oWdl/t2tsRL5YJxYU2BoGlkBS2TVMQnzLJ1ro196oMFbv4g/KUjIgqbJobTAIjSsQCFB1+O6/fvJyzO/FazTQMnicuxgRRPZ++soFurOv97CwvWpOZQRsizQDYHckdHDSGaCcRrzCsDNwXXG2cuqA98btZVJ284dBWr7bBwg0cveZcXd353g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDCPmv99RgsOQid8kfkssZfAP/dlCNB1gprSfG0nPq0=;
 b=QiI0wv308AfstNgH2ZBuT7ocKlortY5qjcBwE2kK8KaFjMDWTzUvp+4Xz57GFeRPz0Uu0XhtINWYLwO1TbQQLj2WGrvQWJ3c1qzC9OIai8CLgHCsXJjc9yXhh2hjabrERcy0KbzpB2vxm3zAGGi1XK5jxQk6IpMio+qt+xtALyA=
Date: Fri, 10 Dec 2021 16:06:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2 12/18] AMD/IOMMU: allow use of superpage mappings
Message-ID: <YbNtBPv1M1lIyEOd@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <cc93398d-982a-edbc-4ddd-b5459cef8f9a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cc93398d-982a-edbc-4ddd-b5459cef8f9a@suse.com>
X-ClientProxiedBy: FR0P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34409bca-9372-45b1-72da-08d9bbeeb04c
X-MS-TrafficTypeDiagnostic: DM5PR03MB2556:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB2556798C8A007B3EEF4C19C88F719@DM5PR03MB2556.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NBArWivEYo/LT5JWUfvsBLR/QJdSuH9B7GZmIvNoPxYDH71hgyPHtm+C4YYVtDke4wJYcdZ/gGjpAh3ZefWUygPVX8BZgvVNYfbGzwXiEoxe/cZeP4pOhOHJNrTlFO0hY5r/X3Ny+wJglGvsHsaDS58LpDLp935bJ2qrg00JL8oRtF/XIrdmL7uiidaMZqIgFu8lFYpv5jC/9wllA2sjq6xQ6daoRD4FHthTqkZRiUbZEOWD5KfVuF7j5iUIOEG9uzORZJygFdBYceVVYgRiRZJJ4lv8wftCjjBGoeEZW8gpT9HhJ0WsPsbqVEFycyKnhEM0bb6k9uj9Q1hPrOtgC41W442sLkqAEY3rWPRo8OK42cNGSb9luRaQRgmpmULvmmmEYDU9BBtSFwfP8xNbJGMRX58OzwkAu24cSVntn2Cjy3pJ92o4KjYOCpcW0PYB6bGRHO9iq38m7ZVlL3v02p4rAUVtt9xq1dGKroAhL9isaHTnwijZt3bEzLGAynV5FzUeVoeuCTHVnvNGkUINQhO8kLF0tDwECdn19bXPR8RlVw90U6iRxarc9XMLtINUJe3RqcLOHBzpIEBDXUL0M0PFOUo96oWbdQ5ApK+p6/MTApwNPo7fl95XT9tdsWG88k7DnAmKPaZIfmA1odGxuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(9686003)(86362001)(6666004)(83380400001)(66556008)(6496006)(38100700002)(956004)(4326008)(26005)(82960400001)(6916009)(8936002)(85182001)(508600001)(316002)(2906002)(5660300002)(66476007)(186003)(6486002)(8676002)(66946007)(33716001)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkxQRWpqeU10bFlCS3lZSDNxbnpTMWJxY0dFbFZFb0psbkNUdjRvdDJZY2NM?=
 =?utf-8?B?TWNjbHcyUzVNMVZBaVUreXFZZnNEcW9LUlByekFObHI1V3VZamNMdXlrOWJ3?=
 =?utf-8?B?dVJaQnhjcmp0YnZMT0hiRlN6Zndqemk1bVhObEkzNkN4WG1PS2padzZGQVRG?=
 =?utf-8?B?KzRDdERaRXgxT3NSVUVNS0hPcVkraDE3TXVFTGNFbzFPT1JzWCtvcjlrZCs4?=
 =?utf-8?B?YlphWU1iQXVpTjh5cUFXK0JPUTFwajlhL01GSUdFSTF4d0JJc3FvU0NRUzBt?=
 =?utf-8?B?QjM4bXJOeHNxVUJLZUlYTld3dWFGM0JaazlDcjU3RTlKbDJGOHdDemNEQWh4?=
 =?utf-8?B?K3hpZGFrbnlRSWp4NFdNS3d3amg1Sk1KWTZNVGlWMVNtSEJpTCtWTUR3aHJ1?=
 =?utf-8?B?cVJmdUJuSjVMU0JkaVJmRzNQTEcvT2FjV1k0Z2tSUzBEYmZsM3BwTEdKeUhH?=
 =?utf-8?B?MFhOTlEweC9VZ2lGVng3empTaHNGZlFzRkdnK2hBWEFxYnFJSEZ1NGdHL2Jk?=
 =?utf-8?B?VWxrcGFpbTA3Z1owMHRpU3BSejBUbFBCb1dIVkVXWXNRWlJNRU1EMHJKZDV3?=
 =?utf-8?B?SHQ0U0JJNHZLNVJOWUkvZEg5V3E0WDlLSTVpQzRETm5oeGJKWlJIZGIrL2lz?=
 =?utf-8?B?bFZYQlB0S0JORHdWQ2U4bE55T1A0L21ucE5KanJYdTl5b0gxZmRLc2gzbEtm?=
 =?utf-8?B?S3MwOTY0Q0tYaHZyQzhWem81T2had1VnTy9yS2RqWTZ6MlBGUXZBWmZTUGN2?=
 =?utf-8?B?VnpHdnZBbURLMEYxZDYrL3VWa2VENmxiVnBYMlN5TTVXZlk5OThoQWdYNHZu?=
 =?utf-8?B?dlk4Zkd1VTNJcmxkbU9DMmdvMXE5STUvbzJ6MGJQcWtBb0pDU2trKzU1ZTFH?=
 =?utf-8?B?YkdUeFJiRFJsRjNjb0M1WFlUaGx1ckQzbUhIL29ZYmxSVlNpQWRwcEFQcHlY?=
 =?utf-8?B?N2I3Q2lwV05lZi9Va3ZkbERZL0FiZjg4aGp0d3E0czl2MTVpUGhnV3Zid0M4?=
 =?utf-8?B?WFJtZ24vWTZzMU9qeWxVajg4S1pSVHAxM1Z6TkwzOXA2L0dZcm8vNnFlU05X?=
 =?utf-8?B?L1lTMzBOcjVrSkpSUU5sZDZmVUVFMk1Rc3lhbTVlbEZodC9YQW50QnVPQUV0?=
 =?utf-8?B?RzNQQ3lEYmNaeVR2b2NLU2h0UlpJWFhZVXlWNHZqclhMRXJJVzdLdktGVDJ4?=
 =?utf-8?B?cXVoaHVyblpMNVpTZVRQbGlmQ2IxT05aZ25tU1g1dmVDeU1WOExVOC9QUDJM?=
 =?utf-8?B?dTg1WnpVcHUvcEw1d21mUG1QLzc3TDdGcmx5ZGIvUVJKa0tJank4NzBHUFp4?=
 =?utf-8?B?SXV2QlJjZ1BuTG80MVFiNWIyTTN1blZQQzd2QlFzc2JkQk1qZ2J1YktNZERW?=
 =?utf-8?B?Qmkxc0hRU2VZYnRxR2JsVjQxNm1wY1ZydWRaUlhPMUsrbmtnSTU2dlMzbFh0?=
 =?utf-8?B?WCtVZHJteGJwRk9JOVZRV3hHK3Qvc2FaMzdENVNsNytXL1kwYmQxajUxVWhS?=
 =?utf-8?B?WmtGLzJVcy83YUNSbHNhUUVrR3NrOUN2aU1vUUQ2UUNHbEQyb1lENDcvSWRl?=
 =?utf-8?B?a0ExT2YyeVVZT000bXN1dkVsSzhNK2V3c3A3ZGFSellNanNGVVE0d1QzQXQz?=
 =?utf-8?B?cVl4QTlDaW5xNlAzZXNIMkNrMWxMYzNHamZCVVNLdnlaMExYYlpTQ2N3QUFt?=
 =?utf-8?B?SzE4SFBlcXdDSXJ4N0pRQWptV3lDcWk3eS9idlp6Rm5tUXZhc0NhZmJqbXBS?=
 =?utf-8?B?VE1DNUViZmx2bTRWUEY2MGROWlY5SzVsVjJtNkd6ekNPVGtWYmNKek00WW1w?=
 =?utf-8?B?cExoZm5ucmFFWjF0YTYyejJmdDdCM0kyV2FRSVJmQ1RBN3gxTWtaaGtxcE9V?=
 =?utf-8?B?MUpqeWFvU3Z4NU5mNHk2Qjc5V1dKKzlUUW04QXhpUHVpb2FvOVlJREU1WXd0?=
 =?utf-8?B?cDBIV3VxaTBnZGpSUkZHcW1DNmhnUyttNHBURk9reURCTUhSNG90RDdOdi9n?=
 =?utf-8?B?akxWTVRkdVlSUzU4My9iS2RYc0xwTmtDVFJtcC83ZmVwM1l2RUJFMDRlbGFI?=
 =?utf-8?B?ZVJQNEllMmRkQ1VPdXNLa0pBOUYvMzlxTmRLNnd4Z2FYTnNTcmsyU1JNNGpw?=
 =?utf-8?B?eFdVcGhNQ2NVSUdyaVQ2N0dmRGp1VVdwWGVkU2RDYmI5cDc0WFc1Q1hQejRn?=
 =?utf-8?Q?jON2HrRrnoT/58036c03Haw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34409bca-9372-45b1-72da-08d9bbeeb04c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 15:06:48.6336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sDgruFc/7N5zOAS8gh42QNYW4k25392cVB6gyGhN/Y8Ao5RLJcC2OVxoasEkHfgVXdDA1l8EulyQ1SKQOX7KyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2556
X-OriginatorOrg: citrix.com

On Fri, Sep 24, 2021 at 11:52:14AM +0200, Jan Beulich wrote:
> No separate feature flags exist which would control availability of
> these; the only restriction is HATS (establishing the maximum number of
> page table levels in general), and even that has a lower bound of 4.
> Thus we can unconditionally announce 2M, 1G, and 512G mappings. (Via
> non-default page sizes the implementation in principle permits arbitrary
> size mappings, but these require multiple identical leaf PTEs to be
> written, which isn't all that different from having to write multiple
> consecutive PTEs with increasing frame numbers. IMO that's therefore
> beneficial only on hardware where suitable TLBs exist; I'm unaware of
> such hardware.)

Also replacing/shattering such non-standard page sizes will require
more logic, so unless there's a performance benefit I would just skip
using them.

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I'm not fully sure about allowing 512G mappings: The scheduling-for-
> freeing of intermediate page tables can take quite a while when
> replacing a tree of 4k mappings by a single 512G one. Plus (or otoh)
> there's no present code path via which 512G chunks of memory could be
> allocated (and hence mapped) anyway.

I would limit to 1G, which is what we support for CPU page tables
also.

> --- a/xen/drivers/passthrough/amd/iommu_map.c
> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> @@ -32,12 +32,13 @@ static unsigned int pfn_to_pde_idx(unsig
>  }
>  
>  static union amd_iommu_pte clear_iommu_pte_present(unsigned long l1_mfn,
> -                                                   unsigned long dfn)
> +                                                   unsigned long dfn,
> +                                                   unsigned int level)
>  {
>      union amd_iommu_pte *table, *pte, old;
>  
>      table = map_domain_page(_mfn(l1_mfn));
> -    pte = &table[pfn_to_pde_idx(dfn, 1)];
> +    pte = &table[pfn_to_pde_idx(dfn, level)];
>      old = *pte;
>  
>      write_atomic(&pte->raw, 0);
> @@ -288,10 +289,31 @@ static int iommu_pde_from_dfn(struct dom
>      return 0;
>  }
>  
> +static void queue_free_pt(struct domain *d, mfn_t mfn, unsigned int next_level)

Nit: should the last parameter be named level rather than next_level?
AFAICT it's the level of the mfn parameter.

Should we also assert that level (or next_level) is always != 0 for
extra safety?

Thanks, Roger.

