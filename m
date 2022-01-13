Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D6248D436
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 09:59:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257032.441424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7vw3-0000oP-7s; Thu, 13 Jan 2022 08:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257032.441424; Thu, 13 Jan 2022 08:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7vw3-0000mU-4U; Thu, 13 Jan 2022 08:58:19 +0000
Received: by outflank-mailman (input) for mailman id 257032;
 Thu, 13 Jan 2022 08:58:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=64pG=R5=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n7vw0-0000mO-N7
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 08:58:17 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0142828-744e-11ec-bcf3-e9554a921baa;
 Thu, 13 Jan 2022 09:58:14 +0100 (CET)
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
X-Inumbo-ID: f0142828-744e-11ec-bcf3-e9554a921baa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642064294;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=egLE6eI/hE/ARYckQ0FOhO/sHDb8m53a61kzgfnbf+s=;
  b=HBh0iql/OqUnYETTrAtQzLu9X+ptOf2DpwJKJ1iAE4FdJc+/g4HaaRox
   2VLXvM4ianTWME2r/LHSA4HCutWN3BTp68QnW89HTOI2jja3HwC7sJWmw
   fRbqozp6FfJU89z0QHzR8JiUdpve6OMlE25/LaqGh6cf5bxCCd0EaCF7p
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: G1VXi4/EETmoYBSUyKlR5wcTYW4wfG0y+xKMYZMLu4UUsXAQmJE+2cSL3X27iCJHUZbInh2pFG
 ZWbwxHH3RTB4fbA/hq2gIYdA/oJzimT3KVRmkPyfhJbzku82973FqbFjIf+WEjQvQQ+taLgxcj
 IVgH8azyV489+rLj+1SRXhzq0qN1QJX3gWNgCk5OcyUzmLNur94oGGRXyDVYNnXRox6w6yxuxW
 yCqAygC47sM0xLl4h9yYOFAmUk0b3dsbZyCYZqP7OHJt+ah7TuV1FhYxBs2KcgY21/U6TLBK1h
 +7gO7LxcfI03JRIiFTaWgtzv
X-SBRS: 5.2
X-MesageID: 61903037
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:XQenuK/7HYV/qgCu58FHDrUDQHiTJUtcMsCJ2f8bNWPcYEJGY0x3n
 TEbWW6FPv6LMWb1ft5yYdjk/UhQv5Pdx4IxGVE//y48E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dg2dYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhW7
 vxmmZueUD00GbaLxt0lA0lKPntHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGhWZo3ZgVQp4yY
 eIbWAVCUD3KSiZQZE0pM7Unp/rz1yTgJmgwRFW9+vNsvjm7IBZK+LLgKsbPc9qGA8BchF+Fp
 3nu9n78RBodMbS30TOY9lq8i+mJmjn0MKo7DqG188lPkVKax2ENIBAOXF79qv684mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O+o+5QKWw6zY+TGQAGQeUyVBY9wrsswxbTEy3
 1rPlNTsbRR1ub2ITTSG97GbrRu7Iy1TJmgHDQcGUA8E7t/LsIw1yBXVQb5LGai5lIetQWnYz
 DWDrSx4jLIW5eYJ3aim+VHMgxq3u4PECAUy423/QGWh6Q9oYZ+/UIah41Pb8PVoIZ6QSx+Ku
 31ss8+a4eMVBJeBjhuRUf4NF7Gk4fWCGDDEiFspFJ4knxy24GKqd41U5DB4JW9qP9wCdDuvZ
 1Xc0T69/7cKYiHsN/UuJdvsVYJ6lsAMCOgJSNjzSPNlTp9fbTWa2zopO3eojzD/vRIVxPRX1
 YigTe6gCnMTCKJCxTWwRvsA3bJD+h3S1V8/VrigkU35jOP2iGq9DO5cbQDQNrxRALas/V2Nm
 +uzIfdm3Pm2vAfWRiDMubAeIlkRRZTQLcCn8pcHHgJvz+cPJY3ANxMz6e9wE2CGt/4M/gstw
 p1bchUIoLYYrSeWQThmklg5NNvSsW9X9BrXxxAEM1eywGQEao2y9qoZfJZfVeB5qLY7lKUsE
 aVVIJ/o7hFzptLvoWR1gX7V9t0KSfhWrVjWY3rNjMYXIvaMuDAlCve7J1CypUHi/wK8tNcko
 q3I6+8oacFreuiWN+6PMKjH5wro5RA1wbsuN2OVfIU7UBiyoeBCdnyg5tdqcppkAUiSmVOnO
 /O+XE1wSR/l+dFlqbEkRMms8u+ULgeJNhELQDmAs+fnbHmyE6jK6dYobdtktAv1DQvc0K6je
 f9U37f7NvgGl0xNqI1yD/BgyqdW2jclj+UyIt1MECqZYlK1JKlnJ3Xaj8BDurcUnu1SuBesW
 1LJ8d5fYO3bNMTgGV8XBQwkcuXciq1ExmiMtaw4cBfg+St63LubSkEObROCvzNQceluO4Q/z
 OZ/5MNPs16jigAnO8qthzxP8zjeNWQJVqgq78lIAILihgcx5EtFZJjQVn3/7J2VMo0eOUg2O
 D6EwqHFgu0ElEbFdnMyE1nL3PZc2stS6EwbkgdaKg3QyNTfh/Ix0BlAyhgNT1xYnkddzuZ+G
 ml3LEkpd6+AyChl2ZpYVGe2FgAfWBDAoh7ty0EEnXHyRlWzUjCfN3U0POuA8RxL829YeTQHr
 riUxHy8DGTvdcD1mCAzRVRku7roStkorl/On8WuHsKkGZgmYGW63v/yNDRQ8xa3U9ksgEDnp
 PVx+LciYKL2AiccvqknBtTIzr8XUh2FeDRPTPwJEHnlxo0AlOVeAQSzFn0=
IronPort-HdrOrdr: A9a23:NFbqv6tmTwvLYkaBuUkN9ne47skC7oMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLj2CKZsQlzuRYjzrbHGeLzM2Y6bReq
 Dsgvau8FGbCAsqh4mAdzI4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kHEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 PxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72OeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl9Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlblrmGuhHjDkV1RUsZ+RtixZJGbFfqFCgL3Y79FupgE586NCr/Zv20vp9/oGOu55Dq
 r/Q+BVfYp1P7wrhJRGdZM8qPuMexzwqC33QRCvyHTcZeg60iH22tbKCItc3pDeRHVP9up0pK
 j8
X-IronPort-AV: E=Sophos;i="5.88,284,1635220800"; 
   d="scan'208";a="61903037"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m1LqlzRZj2DSWJL7fIKoPCi68RJSJYNUURkScMlp2Advtr66Sj4hNw4CkDtN6PAPUlxzfHhp44gKYJPVxmzR/6dbpoTWASoUqfpHSf0n7G1888oBUGANwU7kAXLQA8qzqgX8qdztifzCNk01bedEwjE1j7li+NKktJdqVA7vbSMPgqlul0sWmX3MD5RWJsLIZqrZZra7GGE6kE9t4rKdG5d0+Qz2XhonE3uzmwPoN6DDfhpPsDWoP+85X51QPY+ldtnGgMVk33Qa+bvJiaSXGChod6P96vsVKyDt9NNOVCwMov3pkALiwCkZ6vpmQug60qcbbRL3LvLjKC3snKUsMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+qhBTT7gxt0T6BkIeV794kwNlxY+fQEhIPLsg+FKjg=;
 b=Iykn2vef71H9yygn/T2OXVUX5Irmh1GZlkPRnYGiKVofUevHf4PLjc5ZnVZP5XMY1HJHas2MatoZ2CkYRHtm1j5jsE5iuI0NB4rQOC2J15Mv2/DrPynCEGZbD08/KS1MIp/+uJKAzKtH+nILMfnun2jIAR4e7HXRYc89LwFGu12KbkIa4kdvVaqX9/tCe0/4gfZErgvRXjLRGQ7x6I0/W/uU1JFx3/KOQWsdR//mhS2OtGKYrD/IbAFxT08cN+Rrp1t713FiO+hCYU3RYltn9YKzcz0G0wI+0+Cp/aAab26OBEUv9J2qBNUNuH9ItJ5U3Z1ZMKU+JC9BOa/fXWm+yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+qhBTT7gxt0T6BkIeV794kwNlxY+fQEhIPLsg+FKjg=;
 b=TbOdZQbCAlikA9lxj8h34Ja11hFbepBq5EN7vRXdxSsALqKl2cWgQ7LGI/B5poEOA7UWR9tnb6pm8Jd/R699NsnqAYATLy6Qb70Ru4tT59YrLsPI3oKykdk2OcghJXMXKVARefVSlpYRG5L7/+WHDMCy33QLQtzvXAJlAmF4fog=
Date: Thu, 13 Jan 2022 09:58:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Andrushchenko <andr2000@gmail.com>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <paul@xen.org>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 03/14] vpci: move lock outside of struct vpci
Message-ID: <Yd/pnYDBwsdyLrPN@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-4-andr2000@gmail.com>
 <c7a9020a-9713-47b6-45bf-5ac2c6d4157c@suse.com>
 <Yd73Aq4w2H1Eo01h@Air-de-Roger>
 <4fb1d547-6f6d-c4e8-b2ef-0dea780dd66d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4fb1d547-6f6d-c4e8-b2ef-0dea780dd66d@suse.com>
X-ClientProxiedBy: MR2P264CA0044.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::32)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18a313f3-f44b-48be-ccf1-08d9d672d227
X-MS-TrafficTypeDiagnostic: BN7PR03MB3779:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB3779BACD08C5445CD80559E28F539@BN7PR03MB3779.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3NW7nSGDXOYj1RZGI8PAfaLVQWmPfcpnWOSPH0dxYBANmvh1JacSXlUJamTnD5+5x3wzcuHmvoMQ2tF+M5dJHmKYTJQFQNKS5AwxCALUow5ms0M4KMQhtpC+cNYOTZH+30MB37xVBDqYDlxsJsQRLjbuHsHdFbrCfX6MItZdfNJQIGvPPn7dFjjy/UV5Nhu9GFChtVqZKWjTTCggecApTjtQwnVz8LO7l1gL/P+T3f6FRxL49THjI9IiQS6eAovXccMy0UpCoxEzMDva3lxQ3NjPb4qPAROKE9HHfljYyhcIs4acms3hAMmwxNlqFIJq6nK5cHgerV91EUJYn+EE1El1CkZKcm/MzyYmKgXj+a1fhwkd6QvM409+GhodbXz3IKZlS3W21VT3Aj4DgbunBFKQMMSbO5qBvlBRD65cw1eOAH/ap34mDR9oC4bb54u+E3HWYNh8/bmA+voHT+3l2MVPu8sODDbTfZ4eGyw9jUUOQCuDAls2dBd75pnM97ARY1eJFK1s14rqcvaoTHX93L10RwVEgywuLUb703Pfh18HoAmeb4Ub6W1Mv7qxiFRo4sH//AxPB3u61YY/5nB2XJcwlp8HLE0f/Wq/5AmjxIs0aiKA3gDxW9ijFUkXA7XsVgJBsu9GsbaxaMMG/gpacw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(26005)(9686003)(6512007)(54906003)(5660300002)(7416002)(85182001)(508600001)(86362001)(83380400001)(8676002)(33716001)(4326008)(82960400001)(66476007)(6506007)(6916009)(53546011)(2906002)(6486002)(66946007)(6666004)(316002)(186003)(8936002)(38100700002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VSs4TnE3SjBDWTZDdE82S0dPWVVYZVVLZXlYdnI1cEF0aGxNYjljbzRzNzNx?=
 =?utf-8?B?enZCT1FNNnhpdFNxNGdzQVcybGtTSlBXN2Y5MEZYSStyYmo2VmoraC9OeGli?=
 =?utf-8?B?MW9mdmRYSDRDUldmb2gzUGxwSFlJOFlxQzVDU05UcWgvdWJZdGlVRjhCbStX?=
 =?utf-8?B?THhrbzVFTUF1ZXV0dlA1dUpLOHl6UHMyYUM1TUtGRnZZSlV6Sm1rOWQ1Y2Ro?=
 =?utf-8?B?WVFQeTZCNDdmZ00rc2RKYlM3VjF5SUlCYXhKUUVXeFdSQk9UcWhsYTgzOVhL?=
 =?utf-8?B?eElRTlBONEp6bUc4b0JHOHNSQUwra2Y4M1N0QzhQZE44QzNZNUVFSnpyZHBP?=
 =?utf-8?B?K3o0VG0ybXVpUWxBYWhaWmdLZXg2NVpwRFJVSHBqc3RKRWRQbTlpK1h0SlFY?=
 =?utf-8?B?QXdJVmp2djBGZkR1SElMM1hWQWc0QmJmZ21KcUxqRDBEdmxPL0Vib1pvODN3?=
 =?utf-8?B?dkNzOE5hTG9yREYwaDNERzJtN1MyMm4ydVcreFRUc2FnR2tlQm1Tdzk5WDBB?=
 =?utf-8?B?WXU2MXpaTDVwK0I5TzAwc2RURW5mamtKUGNhZkg5RE5rWXgwUEFNaWFwNnRR?=
 =?utf-8?B?V3NKbVAyTExNdmdyY1BmYjZPaVJ1R3BVZk1Sa3NQT25CVEdUbDVBTUVjV0JO?=
 =?utf-8?B?cDBXNXhIVW53R093MXhRK0ZXWUJhSG9rU0tTcW02dEVPRkZ0ZUczUC9hQUFi?=
 =?utf-8?B?Z0xqSEQvNDlCcUJFbHlHZ3Q2Z1Zzc2VobGNlUi9ZQnVLdmp0T212UW82UWFG?=
 =?utf-8?B?eHYwaythQnNsbXV0MlhpV3p3c0JyL2U5Qm9Cb3VFODNGUlh4dERQNUtaYkJF?=
 =?utf-8?B?Yzg3UzRRQWFvNVJzdXpzNDFzMGtybThqNUpnSGFxUnFyT3lsNjlaWEJ0Vmda?=
 =?utf-8?B?Vkp6cFZzMHZFUzhIdGQ0R1BtRE1Hd1lVYjdzMElDdVdHaTFsWGpPSmNwZm9G?=
 =?utf-8?B?VW5BcTRzb1BiUTlGaTF5STNFM0FuMXgzeFBXcUlBVWpPMGt6L0VLQUN5MGVj?=
 =?utf-8?B?VCtzdXA4MFp4WFVJeUs5QndSUmFvZlhZcXUzajhyRmQ3QjdLUjIyNDFNdnY4?=
 =?utf-8?B?MDBrZGVCNzZTUmJWVUUwRnFnNnlRVStISnhOa0M2ZWlLVjViQkhsbW9EYmFo?=
 =?utf-8?B?S256VVkwcTU1S0FVNkNRS2FFZ05TbGdtK1FEckxoZ2NKNDdFTEFYZjJJNGdP?=
 =?utf-8?B?d2JiTkt3RnZVa1dORHhBcU5nZE0wNURPcUlvRGs2N0QzT2RKL0UvNzhnVlM5?=
 =?utf-8?B?WnpMVHM0V3lqWllyNkJGdGZNZUZOZVNjcHdubStOT2l1WDJycUVsT2x6R1dz?=
 =?utf-8?B?aElob0lmL1JweWZQb2pUZ0JVTkNoYkV2WVRReGxxbDdMYjB2b2RJUjV3YVZ3?=
 =?utf-8?B?Tk5kR3NsUDl0VDBoVm1iNGs0SUFUOGtRN2FKT0F1UXpVa0s3WU93WE5WU3FS?=
 =?utf-8?B?anI5akN0enlId25FaGw0VlUvb0RTLzNINlZxNXBaSURXZmQ2TStVZVg4MjlS?=
 =?utf-8?B?USt0QnlmMjVmaWJ1dzNyWFEwSE84ZzE2VWZseEh3NUIyMzFlSkluMzhaRXU2?=
 =?utf-8?B?UlJtTDZ5WFZWT0hqL013dDVRM0VTVC9pQmc2Tkp3bEFrWFdINmFvNzR0OTd6?=
 =?utf-8?B?YncxK0RXNGxVSkZOTmRrcXphMk1JVzYybndBbUNSeDFiZUI5bmZmeklrY3pn?=
 =?utf-8?B?ZE0xVkR4SkYxdklXeWQ5QmNBQ3dIbUJrR3ZBTE5QVEdpcVJvNjdhT0NQQTBv?=
 =?utf-8?B?aTVGTSswdWNaM0Q0VmVXTkhybEJxdyt1ODlHZ0dQQ0lnRG5hU0JBU2h1amta?=
 =?utf-8?B?MFlMTzFqNUZkaGJUejNmK2ZCYk4rTXBkSVpqYnM4NmtMVGwzZ0xqUjAvSzBl?=
 =?utf-8?B?UXp2ZFJtYitUcExTdE05NmZJUW5TRHozK2ZvSzR3SUlkWHY0S1pkZ2pZS0ZM?=
 =?utf-8?B?Mm5meWpOUVR6NWxwaUNLYlFOUm0ybjlVTDRHWFlGTzFoL2xiZ3lXNkRPTmNO?=
 =?utf-8?B?TDJLZVNnOS9TOWhIeG5KbnQ2TTlkb0RkYm1FVnBHOFNLWnZraTMrd0dmd2Vq?=
 =?utf-8?B?OXl6L2RIa1hoVTUySmJNL01EQjlnZ0RlajlnYmo0TnBPbXBoS1hVa0pldjcv?=
 =?utf-8?B?aWI1cnIrL3V2ZjVVbTR3VmJnSzAzaHJTcEhoSCt3b3ZyckQxSjc1OG5DV2lW?=
 =?utf-8?Q?83jcvmD7gwBZ5bH20Ens7Ng=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a313f3-f44b-48be-ccf1-08d9d672d227
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 08:58:09.3356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kGSTO+klN0tv7+FDhxjjT0beC0q7DvUEnmlS67tneJLva3tD6HsRjDL2Y7FJsaFc8roveojIVoWBTaeiXdW8Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3779
X-OriginatorOrg: citrix.com

On Wed, Jan 12, 2022 at 04:52:51PM +0100, Jan Beulich wrote:
> On 12.01.2022 16:42, Roger Pau Monné wrote:
> > On Wed, Jan 12, 2022 at 03:57:36PM +0100, Jan Beulich wrote:
> >> On 25.11.2021 12:02, Oleksandr Andrushchenko wrote:
> >>> @@ -379,7 +396,6 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
> >>>  
> >>>          data = merge_result(data, tmp_data, size - data_offset, data_offset);
> >>>      }
> >>> -    spin_unlock(&pdev->vpci->lock);
> >>>  
> >>>      return data & (0xffffffff >> (32 - 8 * size));
> >>>  }
> >>
> >> Here and ...
> >>
> >>> @@ -475,13 +498,12 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
> >>>              break;
> >>>          ASSERT(data_offset < size);
> >>>      }
> >>> +    spin_unlock(&pdev->vpci_lock);
> >>>  
> >>>      if ( data_offset < size )
> >>>          /* Tailing gap, write the remaining. */
> >>>          vpci_write_hw(sbdf, reg + data_offset, size - data_offset,
> >>>                        data >> (data_offset * 8));
> >>> -
> >>> -    spin_unlock(&pdev->vpci->lock);
> >>>  }
> >>
> >> ... even more so here I'm not sure of the correctness of the moving
> >> you do: While pdev->vpci indeed doesn't get accessed, I wonder
> >> whether there wasn't an intention to avoid racing calls to
> >> vpci_{read,write}_hw() this way. In any event I think such movement
> >> would need justification in the description.
> > 
> > I agree about the need for justification in the commit message, or
> > even better this being split into a pre-patch, as it's not related to
> > the lock switching done here.
> > 
> > I do think this is fine however, as racing calls to
> > vpci_{read,write}_hw() shouldn't be a problem. Those are just wrappers
> > around pci_conf_{read,write} functions, and the required locking (in
> > case of using the IO ports) is already taken care in
> > pci_conf_{read,write}.
> 
> IOW you consider it acceptable for a guest (really: Dom0) read racing
> a write to read back only part of what was written (so far)? I would
> think individual multi-byte reads and writes should appear atomic to
> the guest.

We split 64bit writes into two 32bit ones without taking the lock for
the whole duration of the access, so it's already possible to see a
partially updated state as a result of a 64bit write.

I'm going over the PCI(e) spec but I don't seem to find anything about
whether the ECAM is allowed to split memory transactions into multiple
Configuration Requests, and whether those could then interleave with
requests from a different CPU.

Thanks, Roger.

