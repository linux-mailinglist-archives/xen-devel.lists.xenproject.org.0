Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4C9411307
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 12:42:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190723.340498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSGkh-0001md-8N; Mon, 20 Sep 2021 10:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190723.340498; Mon, 20 Sep 2021 10:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSGkh-0001js-4f; Mon, 20 Sep 2021 10:42:23 +0000
Received: by outflank-mailman (input) for mailman id 190723;
 Mon, 20 Sep 2021 10:42:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rxQs=OK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mSGkg-0001jm-EQ
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 10:42:22 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6edee32c-19ff-11ec-b86e-12813bfff9fa;
 Mon, 20 Sep 2021 10:42:21 +0000 (UTC)
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
X-Inumbo-ID: 6edee32c-19ff-11ec-b86e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632134541;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=RcS4Ias/qh+USI/Q0L0mrQZsXpX+mUfq8asXM59iWmA=;
  b=eUsJk/pfyrXdREIvalsKK2YM6zzqVQRRmMOw4LpytIqEKEkLlYceZpkO
   Jic3PPbkfWpAyo2XWy67TSjnzQOJborG3KqbPTFhBNJ70f7fopwsm43tO
   zkutXZe3Dqu9V+lmZd8sqDaC1d40lBtuwRVaB/xJNgM4mtyW6utiwHzjG
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4ey2PRfT1v/83B8s0szqxgn4fA+KHflC2asy9EYXjHgCxZpgQzXRsXWi3W+jFnZsVR5KIXM9rf
 LY/V+CFKO5yAlaoxDnHJo4Hro+/B3YnvIRup5v3Lh5GaMzb2I03i/MHBUOk8bND+36lztV2usV
 SEk1ZeI62em9lQk4PC1bXGJTsT1ZtGGrLLwC/P5d9RlihJM69yTbSQ0lnfQzvMmtDAZmtccjid
 XloV3DyUMa9V/gp3tnmdxeIwWuPR3fNQtCj31cI7KgYFOKTLNQlQxhxX9c27A6IH27Oof65exX
 F9YOOwVvEwXRcFsnPFQZyu9n
X-SBRS: 5.1
X-MesageID: 53096156
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:h8T7nKnOH15zjQxOZycp2Wno5gxVIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfCzqEPf/bYGKnKdEnbom/pBwGu8LUzYA1SwJp+y82ECMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA185IMsdoUg7wbdh09Qw2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PlfuMaIYDxwB4/rx94mVR8HAgZQZIQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gpr3pEQRKuAD
 yYfQWBkZkz6fTdvBgZULJAis8OsnVn6ciIN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wp
 H/C/mn/KgEXMpqY0zXt2nOzhMffkCXjQoUQGbaksPlwjzW7xGMJDwYNfUCmuvT/gUm7M/pPJ
 kpR9icwoKwa8E2wUsK7TxC+uGSDvBMXR5xXCeJS1e2W4vOKuUDDXDFCF2MfLox93CMredA0/
 nObkonRLAc2iZ+yFkim8LHLvBScYAFAeAfuehQ4oRs5D8jL+d9o10KUH4c7SsZZnfWuRmqhm
 GniQDwWwuxJ1J9Vjf3TEUXv3mr0zqUlWDLZ8ek+soiN1Qp/eIftTIih81GzAR1ofdvBEwXpU
 JTpnaGjAAEy4XOlz3flrAYlRujBCxO53Nr02wUHInXZ327xk0NPhKgJiN2EGKuMDirjUWSzC
 HI/RCsLvMMDVJdURfYvPupd9PjGPYC/TI+4B5g4n/JlY4RrdR/vwc2dTRfLhAjQfLwXufhnY
 /+zKJ/0ZV5DUPgP5GfmFo81jO5wrghjlDy7eHwO50n+uVZoTCXOEult3ZrnRr1R0Z5oVy2Po
 o4DaJPVm0sAOAA8CwGOmbMuwZkxBSFTLbj9qtBNd/7FJQxjGWo7DOTWz69ncItg95m5XM+Rl
 p1kckMHmlf5m1PdLgCGNiJqZL/1BM4tpnMnJy08e12v3iF7M4qo6a4ecboxfKUmq7M/naIlE
 aFddpXSGOlLRxTG5y8ZMcv3ort9eUn5ngmJJSekPmQyJsYyWwzT99b4VQLz7y1SXDGvvM4zr
 uT4hAPWSJYOXSp4C8PSZK79xl+9pyFFyulzQ1HJMp9Yf0C1qNpmLCn4j/kWJcAQKEqcmmvGh
 ljOWRpB/LvDuY449tXNlJuolYbxHrssBFdeEkna8a2yaXvQ8F28zNISS+2PZz3cCj/5of3we
 eVPwvjgG/Qbh1IW4ZFkGrNmwK9itdvio7hWklZtEHnRNgn5D7phJj+N3NVVt70Lzbhc4FPkV
 kWK89hcGLOIJMK6TwJBeFt7NryOhaMOhz3fzfUpO0GrtiZ48Y2OXVhWIxTR2jdWK6F4Md99z
 Oos0CLMB9dTVvb+3g66sx1p
IronPort-HdrOrdr: A9a23:3YPw1quPZsaslin1oN4xD2Ib7skCkoMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtVD4b7LfCZHZKTBkXCF+r8bqbHtmsDY5pau854ud3ATV0gJ1XYHNu/xKDwReOApP+tcKH
 LKjfA32wZINE5nJfiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvF
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfomoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A3eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqeTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQ/003MwmMW9yUkqp/VWGmLeXLzYO91a9MwQ/U/WuonlrdCsT9Tpc+CQd9k1wg67VBaM0o9
 gsCZ4Y542mePVmGZ6VNN1xMfdfNVa9My4kEFjiaGgPR5t3c04klfbMkcAIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.85,308,1624334400"; 
   d="scan'208";a="53096156"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pb0NNroX+5SGXbUyspNLTbnhOUeVScw39LwqvtEGtLmdtU5bdU8c3nCEulVYM+QVEeHy/DBi7QVY31R0Y2OWXOvy8+YOVa33su3yxmL+OfiK3PcLPAW/ei/n+ey57u6zhUxia7KQ6ciq05wC3MPLFRBxrpOFs/JnDTi5OLgDv39//nrvm+WXzTa/Dg1MXBTZnUyGUeIIJZFBZikl3moOevVklBt1UGJNRtNgltd+8zfgpGrkBCnu9A/GrRXGD/3tnFjuhuCTCeBQvz5u0hNhHzqtpCfT5GHYvIzL1tcu7Ni+KUrz+P+YZxymqqA0NEdqojI1RwaN0x4CFG7s4XAIog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=HREBB8T+nUmy+x6pP6ZXUpeHUyTGeO6nLNdZ6ilPr0w=;
 b=OBNF/HaCghDtYdwqTH/h3i/0yXQ6NtU6zi0U3J3AoHi6ODN2JR80rIZD1vE23qAXaCC5IkCbYfJcNjb2W2Q+Lu9jdfSut09BNoD+BYSYA228L6Ax57eEr/5VuB3wKauWtxkqsVNOHd6DX46eX2POcFYZTqsvCTDeLjphyKqybGPTT+zoWMhhiWO7S77XNQo8iXcJ4lw8elJzFoi0v4S3zrGXIgHujJB7Pspn+E9SN01yIvA2I1ncHoF9iAS+0EnBxzA0XrwTQfikPRvrK5swAa79mgPMwIGxLuJgstIo49AbisVajX6Hp+CHVNjcQ7ikaUWAaH46g0wg6qwtRXBd/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HREBB8T+nUmy+x6pP6ZXUpeHUyTGeO6nLNdZ6ilPr0w=;
 b=SeF74RnD7eCc1xHbqhqLU84N8PLDvefFst0hfD3epG7NkVzN/Mi8cdTYbpNZdK4MxGpvJaFW++RhqoMIALeOx59XVfqGXJiC8SI/oArcDoS57gsOWkofjtkBUnA5KcnGs1rqaIS1fauCc2VVMr7vsA8ESDc5zJm9VvuirGBPJqs=
Date: Mon, 20 Sep 2021 12:42:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH DNA 5/6] tools/xenstored: restore support for mapping
 ring as foreign memory
Message-ID: <YUhlfuPWEqnT0/42@MacBook-Air-de-Roger.local>
References: <20210917154625.89315-1-roger.pau@citrix.com>
 <20210917154625.89315-6-roger.pau@citrix.com>
 <b1fb5e04-29a8-c60b-c754-5a4275a0601e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b1fb5e04-29a8-c60b-c754-5a4275a0601e@suse.com>
X-ClientProxiedBy: LNXP123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f0a4a3d-9886-42c7-bb3d-08d97c234db0
X-MS-TrafficTypeDiagnostic: DM5PR03MB2553:
X-Microsoft-Antispam-PRVS: <DM5PR03MB255364E4B73D20DC4F7A07098FA09@DM5PR03MB2553.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: on+mgyz2DBjpkItOe/xtk0stwjV6wBF+rk0sG/NMtsREZPVxKRE4ndPxduIC3E9xNVp8ogqcbE3Qt1eioM+pIv4wLM62N+MkDVUIqSu/2hCUapelSwnBHm+foW4n49kXi8Wpi3YCnM61mmrF1owR9IKmkN3jgLnEiGDtwfGdGU8rJRbef9Dr4lJ+FjjZPu+INJ8szOCQ0BNLNRo6B6jiYnGCNMpt63m9tCw/2BwZrO7zZYpY92sZItRwZ4Kansd1LL8+Ua2uMYTwQQIoGyOMiSSgyU79Y8IpWXuBQ+caIgY4v8uF2KHlIMuDd5SiOAgAj1re4+RLktANia7Ens/8/PcSqE6bPVKxvqdkSslUm1QSjxJpjkw82efpWtorL7vb8W1vee1CIEz5sek7ghsT5V6auhpDysFVNjzC+2xt77Z+t26B0O1Pn6+XqdB3zZ8QLfbtgDkeDU9gJfO6xemtOt2BQgKBDTEDhCHRqjZVMNOmDpkDIlr0t6ynfjjjZIZ2EBibrcDmBNZboSVVdf06wgtl5xTZBnjfXMXWuc46S+Dc+PuR7Mxc44I6YIXT6SHpajeO9twTWUbICWpubyJokJemS75kAJULPGWVEolakV1lYPsCLoTBGHi55xrTNBKTUwuCf6tgDxcvwdnV3JGa8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(956004)(66476007)(54906003)(66556008)(5660300002)(4326008)(6916009)(66946007)(8676002)(8936002)(53546011)(186003)(26005)(6666004)(2906002)(478600001)(85182001)(86362001)(316002)(38100700002)(83380400001)(6486002)(9686003)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzBVRVBvQTFtNW9KekdEMnpubXphL091ZGhRVzFDTm1tbGZXUXFBZFlxRHdp?=
 =?utf-8?B?WXJpZTFxU1NMdCtvcEhYRnhYZVl1ZXE4Q3M0bnNTeGxHcmRBelV5MmFNaDVB?=
 =?utf-8?B?d0U0cmNDamx4NVg3VGFlK3lobHlNcks1bEhIVXMwTnUzVWYxNjF3QWx6ZGN4?=
 =?utf-8?B?ZmlFaFdCNFZNYW41U3g1Ni9BUVRadWt2UE4vUnpBbVl5WlJyaTRXcEsrUFBh?=
 =?utf-8?B?dWo4UGNZZ2FMZ0NQcVM5R2d5aE1jTFdSTkVWWURHU3Z0bFVZRHh4d3FpbjhT?=
 =?utf-8?B?OEJ1dUpzN1Fxbjg4MGxPYkxNSEYvdkRxNyt4YnNDYVdmTTIvWjRxWVFwZkZa?=
 =?utf-8?B?VTlsRjVqdjZVcXJ3ZFZ1MlplSzFzNTYxRUJHNHNxckk2elVrTDBMZTJreFhF?=
 =?utf-8?B?TFM5UHFmSFU3WHE0L0IyN3hIUm1YRGpFZjZIeWxWUVJpR2JMVUpHQ1hrRjB2?=
 =?utf-8?B?c2xjejZyZjZBb0xJN3dKM0tCcmdQTkhQb0NSRWVNQnhkYVdLdlgyUlBNM1dI?=
 =?utf-8?B?MTNLcFpWSFQzRzZqMmdJMHR5L3BmdnVUSUc4d3R2TEhQMHJTYzRHUXE4MFBT?=
 =?utf-8?B?Y3ZtM2U0QWRJZ1A0MXZGeEpTTjY0enQrWk1oK08xb1VPNDNUVzVCOVcwTXZ2?=
 =?utf-8?B?T3l5M011M1JVMHNRSG5MbW1GVzJoZ3VsNmMzZ1Z1Wjc5ZjVBeVZ0Q0FjVXRj?=
 =?utf-8?B?R0cyUytmcEsyKzZRWWIrUCtjTDRNMDVaeFRtZFVETFc1SlJFR0NCWnhxZWNi?=
 =?utf-8?B?NGRGak93bWhtWWx5eHRhY2VOV3pDZWR4ZEFBdStmMzlpRkg0bXNFa3MwQUtz?=
 =?utf-8?B?Y0RwVzBqdGFabXBrOGpTcng4SXNPTm9VSUU2eFRVMEFzVmlFdGs2NUxqKzl4?=
 =?utf-8?B?cmx3WldYVWJoSnNlNTJkOVRFRnBJdEI0TjgwY2dZSkQxSXBTSFMxelRXZFN2?=
 =?utf-8?B?Tjl6RElTNWF3RU5QVXhvNzNabjJSUUVtblZNNzFzY2w2Y2IvS2FtK3FVbnk3?=
 =?utf-8?B?cWhPMERjQ1R3OUhKMlhEdHVsVXorY3hXT2IzNURQU0hubVZONUJsRzgvanZn?=
 =?utf-8?B?bWhtV1VBS0ZCQ3FtN3F3MTlaQ2xFWTE3akl4M1dkLzd4R1E2Yms1ek5Uc1RZ?=
 =?utf-8?B?OFhJd3lOM2xLUWY4b1ZnK0Q4b3hQYThJYTk0d0xUUzVFeHIzYitMWmI3amlL?=
 =?utf-8?B?dFFHQlFaVkZqcmVSZHlHQ3pjQWdVTFh1YmZlK0pCQnEzUFR3Zk5RWVUwRlJX?=
 =?utf-8?B?U3BvMlBGOTBnUy9wejZveHE0RGtFMjE3V25CRVdvdjMyUnhMdzZ4bXZzRE1t?=
 =?utf-8?B?UjV4RkQvcm5XSVBXMmErZkRCZlNBMjdNUi9kQUM5dTlJOHRHTjc2OHVKOXVM?=
 =?utf-8?B?VFBmSGE4TXZoWk0wdE84YkJhb2NpdWxOWE5aY1dxN1FqakVMU1IvUnVSNThP?=
 =?utf-8?B?a2RIeExDTTdHWCt0dGNEdUViM3VYUVBrak9UbGFpWjJlbXVOUHRjQXNnWjBE?=
 =?utf-8?B?OU5GSmNCaE8zN2lWM29VR1d6dFdUQ3NXYzRGUzlka0ZiUE1qWGdBUUc3d1k2?=
 =?utf-8?B?NWJOenY2TGNNWVJ6a2NROExnMmFFSDZVeW5ma0tzN1A3WFJmYWRQdDh6TSsv?=
 =?utf-8?B?Mi9DNE9odW44aXYvMHBlU3JXbHdDdThhM2FJR3BXYzV4a2FDM0daM3JTdW9r?=
 =?utf-8?B?QkdUc3RuYUdpY0NodFV2V3oweUlydCtXUGQwZy9NUmhvdDBOU250bG9ucTRj?=
 =?utf-8?Q?8v1nhlPWTE50QybzPF2SD/GkDEYN7oRq0PEEcj6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f0a4a3d-9886-42c7-bb3d-08d97c234db0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 10:42:11.9729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hz4K8YU00hBP9pBrJWu2Xh/8u+XlFSIc47eSIocrf6AzIAVyt16L3ldTF+pjhDftKzaGhzxMiFpg3VURa2JFnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2553
X-OriginatorOrg: citrix.com

On Mon, Sep 20, 2021 at 10:24:45AM +0200, Juergen Gross wrote:
> On 17.09.21 17:46, Roger Pau Monne wrote:
> > Restore the previous way of mapping the xenstore ring using foreign
> > memory. Use xenforeignmemory instead of libxc in order to avoid adding
> > another dependency on a unstable interface.
> 
> Mapping a guest page via xenforeignmemory is no good move IMO. A guest
> not supporting a grant table for security reasons is a rather strange
> idea, as it needs to trade that for a general memory access by any
> backend without a way to restrict such accesses. This contradicts one
> of the main concepts of the Xen security architecture.

I've done this in order to be able to assert that the switch to
disable grant tables was working correctly, I don't intended this
specific mode to be something that is desirable or that should be used
in production, but I do think it's useful to be able to create such
guests in order to assert that the option is taking effect.

The main problem of xenstore not being correctly initialized on a
domain is that the "@introduceDomain" watch doesn't fire, and thus
other components don't get notified of the newly created domain.

This seems to be a limitation of the current design, where the only
way to get notifications of new domain creation is using
"@introduceDomain", even when the caller doesn't care of whether the
created domain as a working xenstore connection.

Maybe I can workaround this differently in xenstore, so that the watch
fires even when the shared xenstore ring cannot be initialized.

Thanks, Roger.

