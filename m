Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3874AD55A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 11:11:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267967.461733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNT5-00005T-1K; Tue, 08 Feb 2022 10:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267967.461733; Tue, 08 Feb 2022 10:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNT4-0008Uq-UY; Tue, 08 Feb 2022 10:11:26 +0000
Received: by outflank-mailman (input) for mailman id 267967;
 Tue, 08 Feb 2022 10:11:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GmUj=SX=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nHNT3-0008Uc-E6
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 10:11:25 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77273060-88c7-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 11:11:23 +0100 (CET)
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
X-Inumbo-ID: 77273060-88c7-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644315083;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=9IlNBvyj4Xt78XJk4IsnQgSM2HKibfLtdl2cxW9hgaI=;
  b=E4FXH3xIpfX4ZoZoLa3+IRtUlZ6IC44sSI2bll01NLfCDm56hvgyTFfI
   +c3E3jt/iUKyGcSk86D6RUd2ODh25nZbXT7BIXdqmf+Lt53rhdnjQ4aE9
   zvmllDAn2A6tGJ4b2e8zJy5cYu70P7a3K/8m3rN0uXFhyQHBMBiL9rV8j
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: pII45nKWVQwacj6Oprq5sU/Q0LsmTMQxRtCIuhj9BcwcGgnpWivAH2fZ1+rybeW0JRqp7vvRa9
 aomSOWRBjz6h5EM+AEhrsDs91cpSFyUE8EiKI3rXQv3H86Dqu9jZhFv7swe4eafN7NpisSjof/
 qBkwolm8UStAPloKzvHyvVpI+ukLrC0skXZMBMP+ckdwmpl5r3NeRvYVcBwSQapMlVbmlJ6Slh
 Llq0Ccq7bjVp7CLBPGdyRqlV057hjmDXsizADRhGETsqNyBfGuDa4/Q3kyk2Koi6WuNd+9OrhP
 1ti5Qu1k+nVKgYqj3QDAJFIP
X-SBRS: 5.1
X-MesageID: 65930190
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:HdaBjq8Y9yk7ZznDHVURDrUDoHiTJUtcMsCJ2f8bNWPcYEJGY0x3n
 zYbCDzUPqncNjPxfNAjaYzn8R5X65XTnYNrQQA+pC48E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rh0tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgg4
 Yl9mqatWTt4AaPyieo8XDBhPhxHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGgWZr3pkfRZ4yY
 eIeM2o0XBjhYydNFUYxEpYertaFhHrgJmgwRFW9+vNsvjm7IBZK+KDkLd79atGMA8JPkS6wj
 3ja8mHOJwAVPd2S1xKI6nupwOTImEvTUo8ICKex8PIshVSJ33ESEzUfT179qv684mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O/cz6ByJjLHV5QmZLmEeS3hKb9lOnPExQTsmx
 1qYheTDDDZksKCWYX+F/7LSpjS3UQAyKWIBfiYCQREyyt/vupwojhnPQ9BgF4a4ltTwXzr3x
 liiriIzmrEShs4jzLig8BbMhDfEjprUSg844C3HU2Tj6Rl2DKaCY4Gr8lHd4ex3EJeCTlKBs
 X4HnOCT9OkLS5qKkUSlW/4RFbuk4/KENjz0glN1GZQlsTO39BaekZt4uW8kYh0za4BdJGGvM
 BS7VR5tCIF7bVL2XYBNfpKNWvsk87nuNNvMb93pV48bCnRuTzOv8CZrbE+W+mnilkkwjK0yU
 aumndaQ4WUyUvo+kmfvLwsJ+fpyn31lmzuPLXzu50n/idKjiGippaDp2bdkRsQw9+u6rQrc6
 L6z3OPamkwEAIUSjsQ6mLP/zGzmz1BmX/gaSOQNL4ZvxzaK/0l7WpfsLUsJIdANokisvr6gE
 ouBckFZ0kHjonbMNB+HbHtuAJu2A8oj9CNiZHJ9Zw/zs5TGXWpIxP1OH6bbgJF9rLAzpRKKZ
 6Vtlzq87gRnFW2cpmV1gWjVp41+bhW77T9izAL+CAXTi6VIHlSTkve9J1OH3HBXUkKf6Jtvy
 5X9h1izacdSGGxKUp2MANrxlAzZgJTosL8rN6c+CoIIIxuEHUkDA3GZs8Lb1OlWcUqanWbBh
 1/NafrazMGUy7IIHBDyrfnsh6+iEvdkH1ocGG/e7L2sMjLd8HblyohFONtktxiEPI8t0Kn9N
 +hT0d/mN/gLwARDv4ZmSu45xqMi/dr/4bRdy108TnnMal2qDJJmI2WHgpYT5vEcmOcBtFvkQ
 F+L9/lbJa6NZJHvHmkOKVd3de+Ez/wVxGXftKxnPEXg6SZr17ObSkEObQKUgSlQIeItYoMoy
 OssouAM7Am7hkZ4O9qKlHkMpW+NMmYBQ+MssZRDWN3njQ8iy1djZ53AC3CpvMHTOosUakRze
 22anqvPgbhY13HuSXtrGCifx/dZiLQPpAtOkA0IKWOWl4eXnfQwxhBQr2g6F1wH0hVd3utvE
 WF3LEkpd76W9jJlicUfDWChHwZNWE+Q9kDrkgZbkWTYSw+jV3DXLX17MuGIpRhL/2VZdzld3
 beZ1Ge6Dmq6IJCvhnM/CRx/tvjubd1t7QmTysmoEvOME4Q+fTe40LSlYnAFqke/DM487KEdS
 TKGIAqkhXXHCBMt
IronPort-HdrOrdr: A9a23:4n4uMK+yiHC30URk5d9uk+FAdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc69qFfnhORICO4qTMqftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdOEYbmIK/PoSgjPIaurIqePvmMvD5Za8854ud3ATV0gJ1XYGNu/xKDwReOApP+tcKH
 LKjfA32AZINE5nJfiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvF
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfomoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A3eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqeTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQ/003MwmMW9yUkqp/VWGmLeXLzYO91a9MwQ/U/WuonlrdCsT9Tpc+CQd9k1wg67VBaM0o9
 gsCZ4Y542mePVmGZ6VNN1xMfdfNVa9My4kEFjiaGgPR5t3c04klfbMkcAIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.88,352,1635220800"; 
   d="scan'208";a="65930190"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gaPNl2pG6u8vNF6wAf54tXfJIlTc4bUMqxBs2YLcCSlDUrxYzweDvbwkQrkCZNAm+clB7jYGsyCklNn8Fl/CQ4zG73DaNVqtRQBxeVmbCa6Q1dbyB/mOMyqAt17exF/Q/XNqgoceRuAdtt9EM3w8UAYHDBJgknJwSCuganpNhTX8CuSnz4T9bj5FlRm167IeYe2a38IbTq5zr5ZSiK8EDdBLUs2lBxD3q7n9933tX69UyigwxI9Cx1dPSaaJCHloxB+Dff5eQqXnTFSrcSuTJy5nvDm76t/01bY6iwaR7B3A0q3CE4w5jYeSC6ZZ0VnDt7hn1cHah3fQR0768VEEdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LI9VW8Pk5kJ7LXO2kwg/5AE5zwMQHkvZPn1RbdhVvFY=;
 b=gdb5Fzrf1tr0OW9Wv6BvMJVoL/DiU1hIo5tpkwLaKF0Oq6h28jkZk/VsxMs+ZtOibSTRYc+Nlx/U4vT+QydSRwYAgthc+eDUow+6cGHXIdfbRsuVoCea/OjugYIrT8NlwPbLvkEAQurtiAx5JTwxTBd+mKc0+4wH1E6AqLAy9uipuEv8/8M9qKADrmgdJvhstYNAVXhryhbybz1AsIW5YCOZA302z5nI5/6oUdCOdsyZao1aAwbc7ZqGl7hqarms7y/XsPOqNvjPEr/VUydzNZkivfLu7S7aKfaINredaQT1WxiBTq6NnnK8Zpi4FrMAfb1/jbF54Vi8gZIFSPDvTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LI9VW8Pk5kJ7LXO2kwg/5AE5zwMQHkvZPn1RbdhVvFY=;
 b=WPXQ92PfCNSxdtesrU6n4WsAmU6FfF8TBfAPttI4YK7WcSUPPdLQI3Y07JOkDTivaOCGSPp9oq+tWUsX8SYljZn2ItqB6h2Vd7hTChsJ0lvJzti/XbCg5val3ap0/qhm64YqR4QSn/++R9rs9VOhq84KNcUvrm5YdIcKSlG7QFU=
Date: Tue, 8 Feb 2022 11:11:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	"julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "paul@xen.org"
	<paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Message-ID: <YgJBwrB/qDLSNMIu@Air-de-Roger>
References: <9ce90193-74a0-5642-d22b-6b8c3340c3cf@epam.com>
 <1f65ae7a-898d-2c27-0ada-d71d778b0627@suse.com>
 <YgEsRuckQJIQlkzf@Air-de-Roger>
 <a2a42c1d-d379-00cd-5d55-f443cdb02e97@epam.com>
 <e8fc7872-c7d0-f389-c507-335b809ffcbc@epam.com>
 <21c8125a-2f79-1a4a-494c-db9e4be2a1a6@suse.com>
 <4276fe72-558b-7d95-6430-d4330989dbe8@epam.com>
 <ad985f4a-10f0-4a2d-df02-cde915fea3f1@suse.com>
 <f7669670-8eeb-9966-5ba3-e8f9c03ce3d3@epam.com>
 <73e08285-6bb1-5842-899f-bd6502406e49@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73e08285-6bb1-5842-899f-bd6502406e49@suse.com>
X-ClientProxiedBy: LO2P265CA0477.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a36abdcc-469d-4f96-d176-08d9eaeb5952
X-MS-TrafficTypeDiagnostic: PH0PR03MB6738:EE_
X-Microsoft-Antispam-PRVS: <PH0PR03MB67389A5834471FF24467D4F38F2D9@PH0PR03MB6738.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UPzYPuC1MSvejOOurbG6R7cTi71FZkX9npPqLRwZMO4B8GFb7V6Rp43SspfzXjxRSiclUFF+TUsED6uVMxlSDtwtg3LC+LIbdsdERsVi+Ez7s2sBjsh/LO81dFAtVotweu1zOltRz0r3Fi0eBGNxUjldLxdfVvQJ8ntoPybAc3H5I3S+LlA5qfSyqB2FjEEnDfkqLYysgnnFCb4ztdtVdJSO5I59ZPCDaUSGAsZ/8za86aLQIXi7JolJbTVfg9Xj0gQeR4Ni2VCYaXdB3gyAd3T+FQyTuZXFSmGyKZy41+8tg+9shLOvvtsv9sPEtdgKz5DAZnmRndWIEyaoI1vgTzIJRv32RLSlCCfvu7MrzCHz1H8t0Y1gHnbuodwbfl8ADBahITa7m2gfEYO4oTIOuDDhhHmKwLgHIi/sRVcFElRjVGG4Vk/FuZpPwT27RL1ylqZw1c+gahGC4I1kbwOkldAkgPwIIPhhziIi6NpUoG0dGKmVqgWNuobrRI7/dXhyWJeHNIvNWvsvjIFax0R88JKewuGUm+giARULiJHDNLtcHiACyTE5mfW4pwGHpv+b+F7ljunal9/RKncf7F5L2weJsic4HFjEW3bZdGyQqiHvxdgqQZk6i5w7Pvl4DnjseipepxYq1QEOMQMP5tDz6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(5660300002)(8936002)(66946007)(66476007)(6666004)(7416002)(4326008)(8676002)(6506007)(66556008)(9686003)(508600001)(6512007)(83380400001)(54906003)(85182001)(53546011)(82960400001)(86362001)(6486002)(26005)(316002)(2906002)(33716001)(38100700002)(186003)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTRvRmI5aytCNFY4OWdjNk1zeGVSM3V5RzUzWis3b1BXSzZLK0o0TisxamRv?=
 =?utf-8?B?NzNldFhpSGYvNmNMREJNVUhodTRWZmxWWlBGM3E5eVVpL0tHK1JVK3dQeUdr?=
 =?utf-8?B?V0cxdlpvZ1dNczkvSC9RS0Y1VFR4M3ZmU0x4SWg5aVJkcHB1Q1cxNC90bFU1?=
 =?utf-8?B?MzYxcU1sS0pSU2VDQ3dreFQ0bGdTKzlibzRpMDFSVzFrNDFxN0hrOFRjVkY4?=
 =?utf-8?B?TFFqY1U3R0k4MmpFM2YrcXNkWEx4dU9GTVN0N3ZORnhxQTBKcEJTYXpyRFpK?=
 =?utf-8?B?YmQ2dUM1RmwzZXFNR09JQVlPYVhjaXcwb25HeHBYMXJWM01iL1JVZnh1cVNr?=
 =?utf-8?B?KzN2ZlRSQ09zQUJjZkNTNDNSZWlVY01DNkcrc0JZMWdXOGxVSjA1MTU1U3dm?=
 =?utf-8?B?V09uMC8vUnlqZWtqMWdZNDc3bmRDL2E1UTRVbFJlQjhydUp3SzUrcnNnS09P?=
 =?utf-8?B?NnpQSlV4V3VLRDd5UjNLMnhFelZudExrRXRORFloandmajNpMGNDaFlhWmt6?=
 =?utf-8?B?M3gwQXd5UXlVUjZLbzQ2c2lRVUVpNFFpZVJKbjB1TFZ1Y21CV1V2SXNoM0Q2?=
 =?utf-8?B?N1djaW9kSHBJMFlqNzk5UHhjb242cHJpeHUxMTB6ZndaZWc4eG04MFFYR09W?=
 =?utf-8?B?TXdMSGhQQklZYXRNOThidUZFK0NjUXMyZytXOXVZZ3l4MXErMmg5c09TazA1?=
 =?utf-8?B?TFZHRENPM09WZ2N0b2pXWGRIYmNNRlM3YkV0QS8vN1RjUkJqbm0wQzNFcjZn?=
 =?utf-8?B?d1lXeGplbmVsVVVwUWN6WUN4Zm9Nd2FJdURGNUh5SHNkazluMHgwenQ0K0NF?=
 =?utf-8?B?aFRDL1MxMG1XbC9qRmFsUXR3YVZBNDFtSmlheC9CQks0b1U5Sms5RGdHR2hW?=
 =?utf-8?B?Mk9pVDYyWndheFMxUFFaSU11Vld2cnUwTlZSdzhiNmhhT1dtRE9LR21ITmFv?=
 =?utf-8?B?QXdXM2lpem9malBOMEJjYVAwU05jcFA0WGNnVnV1b1JqK2wwems4aEdMSXgv?=
 =?utf-8?B?Ymg1bVRQTUN4ancwcUF0QUNNVnJ4SGRGRGV4VStWVGlJTE5VcTBkRWRsYVdt?=
 =?utf-8?B?QnViWGs0Q1BDNHEycnhhaERDczlyUjZPL3hRbThhNk5KM0l1RlhsR29PUlkr?=
 =?utf-8?B?clN3VE1UTmJpd1FGM1UwM2pqVWFNRmNGbWpROE5MVjdiSWowZkpWOHFKUGdR?=
 =?utf-8?B?Ym5RZldMcnMvdE5pdHVkQlR4bG5ubWJJbEkxZFcycEpOQWFIcUpZdHozYldP?=
 =?utf-8?B?WWtHZGREeEtOczZ0d0I4akEwbUhqNDFPYWRQeE9hZnpsVkx0eWVVYmxPVmFO?=
 =?utf-8?B?WUU2SitYZ0NuaUpzaU4vR0NYeTUwZUM5YzhiSGpleTFwNXpPdnBvQ1h5bFBs?=
 =?utf-8?B?TXRRR1FWUXJ5ZVQxS2c2dmJ0L0dYYlBqUGM2aUVoNTY2dmdqWFFNa1NHK2tT?=
 =?utf-8?B?eHlwWjgvdCtUSWo3Q2ZuNCtJMzRReTk2T0pRc2dvcWZnZ3NOZm5oM2NjcG9F?=
 =?utf-8?B?NzBHVnBsV2VhTExxNWV0cHl6Skh3YnFmMHZBSWhQdEJ2Mk1MK1RSUU1aWmFi?=
 =?utf-8?B?U0tIYzNwc3dQMVhyeGI0MDZTazM1VDk5d1RwK2xmK3FEaUZxNUxmM045WDY1?=
 =?utf-8?B?dGFpbndvMkNKL0pPZEl1cURzcTRQM25GVVp5N2UwSmhWQ1VndFhyNjBOQlpX?=
 =?utf-8?B?bkNWZVQ0V1RzVElaRFlwVFh2Z3MybHI2YjlsdG0weHlPeU5pbWdzRG5oMmlJ?=
 =?utf-8?B?UWppNlpYN3dOSUpwTzU1VEJHSTM3Sjk2MTc4T2ZzUDAza3U0cTh2dlBkNmJr?=
 =?utf-8?B?aDh1KzVHY095Q3BPS0ViTGE0b296MEV2VVA1bDEvVjZMc2lHSUZXU2Nod3RR?=
 =?utf-8?B?MTBIL1djT2JSeEpQZHA1V1RYRTRZVEhBamFVQmtibGVIbmJBNEdsU29DSGNo?=
 =?utf-8?B?MEFjYnlGcGI0L3d0OWVKWVdjcWcwZXhPT1djWXlvMFlPTlBYb3FpY2Zrd3Zl?=
 =?utf-8?B?bGFJSHY2TUF5U1lPclJBRE00L2E1ZHo4TmxkN083VUF5OU1LWnpsY0Y1OHJI?=
 =?utf-8?B?N3FLUVRmbXdldGdkcnI1OERVSXE4anZDanc3ZnBVSTRHcmVuRVJQSm9Ldncx?=
 =?utf-8?B?WUdONk9WUXpyQXNuYVluOFFJWTRsMk5veWo1UnhsVDlrUkFITkE3RHJkYTRT?=
 =?utf-8?Q?C7RWJCphwxTiRvBYsfQVbWg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a36abdcc-469d-4f96-d176-08d9eaeb5952
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 10:11:18.7855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jJ/Zh1ySzUtDIjAzyKTGSfPpB+Hv2HiOBsdETPlurO/GV4pAh/RCAsN2UW5opttMNO1XAm5ycprK91A7gG1ZSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6738
X-OriginatorOrg: citrix.com

On Mon, Feb 07, 2022 at 05:37:49PM +0100, Jan Beulich wrote:
> On 07.02.2022 17:21, Oleksandr Andrushchenko wrote:
> > 
> > 
> > On 07.02.22 18:15, Jan Beulich wrote:
> >> On 07.02.2022 17:07, Oleksandr Andrushchenko wrote:
> >>> On 07.02.22 17:26, Jan Beulich wrote:
> >>>> 1b. Make vpci_write use write lock for writes to command register and BARs
> >>>> only; keep using the read lock for all other writes.
> >>> I am not quite sure how to do that. Do you mean something like:
> >>> void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
> >>>                   uint32_t data)
> >>> [snip]
> >>>       list_for_each_entry ( r, &pdev->vpci->handlers, node )
> >>> {
> >>> [snip]
> >>>       if ( r->needs_write_lock)
> >>>           write_lock(d->vpci_lock)
> >>>       else
> >>>           read_lock(d->vpci_lock)
> >>> ....
> >>>
> >>> And provide rw as an argument to:
> >>>
> >>> int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
> >>>                         vpci_write_t *write_handler, unsigned int offset,
> >>>                         unsigned int size, void *data, --->>> bool write_path <<<-----)
> >>>
> >>> Is this what you mean?
> >> This sounds overly complicated. You can derive locally in vpci_write(),
> >> from just its "reg" and "size" parameters, whether the lock needs taking
> >> in write mode.
> > Yes, I started writing a reply with that. So, the summary (ROM
> > position depends on header type):
> > if ( (reg == PCI_COMMAND) || (reg == ROM) )
> > {
> >      read PCI_COMMAND and see if memory or IO decoding are enabled.
> >      if ( enabled )
> >          write_lock(d->vpci_lock)
> >      else
> >          read_lock(d->vpci_lock)
> > }
> 
> Hmm, yes, you can actually get away without using "size", since both
> command register and ROM BAR are 32-bit aligned registers, and 64-bit
> accesses get split in vpci_ecam_write().
> 
> For the command register the memory- / IO-decoding-enabled check may
> end up a little more complicated, as the value to be written also
> matters. Maybe read the command register only for the ROM BAR write,
> using the write lock uniformly for all command register writes?
> 
> > Do you also think we can drop pdev->vpci (or currently pdev->vpci->lock)
> > at all then?
> 
> I haven't looked at this in any detail, sorry. It sounds possible,
> yes.

AFAICT you should avoid taking the per-device vpci lock when you take
the per-domain lock in write mode. Otherwise you still need the
per-device vpci lock in order to keep consistency between concurrent
accesses to the device registers.

Thanks, Roger.

