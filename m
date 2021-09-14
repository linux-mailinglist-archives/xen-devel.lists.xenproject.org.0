Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9CD40A80B
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 09:40:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186190.334912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ33E-0008Bm-9P; Tue, 14 Sep 2021 07:40:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186190.334912; Tue, 14 Sep 2021 07:40:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ33E-00089a-6N; Tue, 14 Sep 2021 07:40:20 +0000
Received: by outflank-mailman (input) for mailman id 186190;
 Tue, 14 Sep 2021 07:40:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K1wc=OE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mQ33B-00089U-Ut
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 07:40:17 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4159eba7-7f1a-4d3d-ab25-f05b7f08ac28;
 Tue, 14 Sep 2021 07:40:16 +0000 (UTC)
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
X-Inumbo-ID: 4159eba7-7f1a-4d3d-ab25-f05b7f08ac28
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631605216;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fxiKxw4TGOhF9oQQ/YHtDk0Qky1JfQs0RV5J2w14iVA=;
  b=BvxzB4wJpsQn9+pqjgEzYa+NJ9HPNm2QLjTuuBbYMAUUd3zcxdQ8A2Vr
   io7MHMW2nlCKZ9jFok1fAoZor8+zxkSk7tt9SfzePWv/isI8dA8PJuAqA
   BNuxluUmoHQUGLTUlsCgDQBQ5b0YXRlcyE2UVTSyi/UNbMrXYoU1/6al8
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3DWOVslmPQoMsJLPs7/4u6pBxqoK/sIGXSBv/4wma1PjFeXWnbVKc4JtgT8Y+ArlfPB6z7xQU+
 KPSPZ+T13ZQssFNqEUs7d1qL5gevTeU1agH9g0Wnb/E5zGB4BH9ThMaFux5Tvk4w3F/YihvH8v
 AD23kDgqBdUX72lPl8jpWRjDBal3O/LOlkBM9Kk+TwyLhl2+w+Zn/xhKMwQlxyL3nE06jFKgGx
 JOtfTqArIyvP0oCrdjvGJdfXl4JgSQTl7vsd4N70Pf/YKP9ADlqKX+doPihwFJN4+6Fi+T7YRe
 NW7SZyl0uFKEtAj2Xf0GCAsG
X-SBRS: 5.1
X-MesageID: 53059401
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:2gegnKmfNejnTAUCBUXHUETo5gyfIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKX2jUO/jZa2WkfdolYYW09RtQ6pGBmoJqTABppXtgFCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA185IMsdoUg7wbdh09c02YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PhgkIWSQy0NBbP3qMhCeQVFLQVQJKITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gpr3p0fQa6HD
 yYfQTxNTRLvSSNzAXwsK89khveFoXvTbxQN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wt
 m/Aumj0HBweHNie0iaetGKhgPfVmiH2U55UE6e3ntZoilCOwm0YCDUNSEC25/K+jyaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCskzM5QvhaOckB9jq95vX+/xunIkYdQWsUADA5j/PaVQDGx
 3fQwYiwX2cy4eHKIZ6O3uzL9mLpYED5OUdHPHVdHFVfu7EPtalu1kqnczp1LEKiYjQZ8xnLy
 jaWpWAVg7wJhKbnPI3qoAia31pASnXPJzPZBzk7vEr+tWuVh6b/PuREDGQ3Ct4acO6koqGp5
 iRspiRnxLlm4WuxeMmxfQnwNOvxu6bt3MLgba5HQMB6qmXFF4+LVoFM+jBuTHpU3jI/UWaxO
 if74FoJjLcKZSfCRfInMuqZVpVxpYC9RIuNaxwhRocXCnSHXFTcp38GiI/59z2FrXXAZolkZ
 c7AIJrzVC1DYUmlpRLvL9ogPXYQ7nlW7UvYRIzhzgTh1rybZXWPTqwCPkfIZec8hJ5oai2Jm
 zqGH8fVmRhZTsPkZSzbrdwaIVwQdCBpDpHqsc1HMOWEJ1M+Sm0mDvbQx5InepBkwPsJxruZo
 CnlVx8K0kf7iF3GNR6ONiJpZoTwUMsttnk8JyEtYwqlgiBxfYa14a4DXJIrZr17pvd7xPt5Q
 qBdKcWNC/hCUBrd/DEZYcWvpYBubk3z1wmPIzCkcH40eJs5H17F/drtfw3O8igSD3Xo6Zti8
 uP4jg6CGMgNXQVvCsrSecmD9VLpsChPgv92UmvJPsJXJBfm/r91JnGjlfQwOcwNd0nOn2PIy
 waMDB4EjuDRuItposLRjKWJoor1QetzGk1WQzvS4bqsbHSI+2OixclLUfqSfCCbX2Txof3wa
 eJQxvD6EfsGgFcV7NYsT+c1lfozt4n1urtX7gV4B3GaPV2kB4RpLmSCwcQS5LZGwaVUuFfuV
 0+CkjWA1W5l5C8x/IYtGTcY
IronPort-HdrOrdr: A9a23:EcJGiaqYuJ7vy8U24eQfAJ8aV5u6L9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPPHFXguNbnn9E426gYzNLrWJ9dPwE/f
 Snl656T23KQwVpUi33PAhJY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX232oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iBnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJDA4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWArqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocWTbqjVQGagoBT+q3oYpxqdS32BnTq+/blnQS+pUoJjHfxn6ck7zA9HJFUcegM2w
 2LCNUvqFniJvVmGZ6VP91xM/dfPFa9Ny4kAFjiUmgPK5t3Tk4li6SHq4ndt9vaMqDh8vMJ6e
 P8uRVjxDcPR34=
X-IronPort-AV: E=Sophos;i="5.85,292,1624334400"; 
   d="scan'208";a="53059401"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GfD+BQPsdTQCm2coeDGSxHLGRNXvH4ZbI3ReugqmZpzwICjWuxL5kdN8RMtViVyDTGVxEzJcJszT2KMEkuf77cBos4zGZITIqqT0gsY/XABJ76Tc5cJPgSiSH6PLP4z1WApbL1NdCJrkWQWYUTGHkg6mywKn4BkrJBsO/jr3a0PZLQGPzXQ234Sa1K4hAg8loLDK4jc+AV9fpqOyXAMg5Hnc9zy7C49e2Wacx0ybixsoEz8StP4jUy4n9UOnp1NotshXznBBF++uSv9YRJLgjVegyDf5BJ4i1kWDihjSeKIAw9/LRhUVvHhPn+dTUdIdJBI1xtb4E9RC5+qQZbtEDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Uz/3wz4bM261vF5JSn7CkFIYZz9cSOziYznu+yNe6cE=;
 b=Ctjn5Db3FoxU0cfONiSCCG7MjxRDY+8wPEh9glJLYF+v4qRRrwj20AM0BF4dzE9GR7YCy9gBz47QGHvqPca3G6u6e3h47r2FNV0lysNbAhnT64a0LGLsSaIjF+Hr/ND1HZ7fYNixrcmPU3pOllb1h4T7C6rqRupyFNhVsCBVPSKTBJl41f+l4qDfaN12rDY7cooGwGX971u2vDDE/e3UVYEFuk3vb4Y/EH6oZesrsoIuwWeASp7mTZD5sQ+bm8BGwfA8usP3YF//TQJuU2QqseHfz9J8Be9LCuOhGN3ZWX5Y61A5iYvDHoMkawH5CdTdYmnmXTUcEM4TLF1FLu/BpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uz/3wz4bM261vF5JSn7CkFIYZz9cSOziYznu+yNe6cE=;
 b=mvTIZMIC4Gxh4MZsaqxbxlEWYMZ5QN7ASOZEiXw89AaYVTU++LcCIWbMS6q8aZ3dou+drHYRJCSiGE5Q+CcbLn/Wr8pv2gela+VLpuPO/pog+G+WE00eBB7/yBTy2JmyMTDM7QebeyZLEZQXfspyPcuJsJ7s/ZlcE5Tmykqdr+E=
Date: Tue, 14 Sep 2021 09:40:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/ACPI: ignore processors which cannot be brought
 online
Message-ID: <YUBR2NqDJeucPYGH@MacBook-Air-de-Roger.local>
References: <370f1ebf-b8d6-70f2-b9c5-d642f710c550@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <370f1ebf-b8d6-70f2-b9c5-d642f710c550@suse.com>
X-ClientProxiedBy: LO4P123CA0058.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2629d739-bd18-4335-d990-08d97752e351
X-MS-TrafficTypeDiagnostic: DM5PR03MB2969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2969DF590339CB3D6E9D0E628FDA9@DM5PR03MB2969.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:345;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JhqUc+ifHgXxqVLHOjDfr+7CKt6tw072aVTW/vcWbV+8KoOsnZnOk7l+cYOKKVQuiRn1wXCXsrjGVT5zSjLuDGoDFUhTYnJVChs/9AYfQPo4Rm6zvwNYsyNo6El+ZkBgcjCY5nU6+Isgo/evXUlOH9SMaPWri0+J8nJ79+lbjki2bKgOkRpL9GD5gSuQg8OS4sW3Z81m58eOgSXxR+mziL3ZO7oyZ4Ev5ZjAXkmxgFYy4LPczWmGZ/IT3NxxA5Xu4M6j/CkzMzcwuDuVZ9lvIHodLrAsEKRgyHj46I4XSOthUB0ILZrti+CVVjXMvFBjSGJliTc8VF2VRl0eNZRMpVgURmUTyi6RT1ybwFoy2J+FCLR5lesdPKK+7+GZWuk+Qqv/tcrx7iddSQ/bpK9KxmwsR2N2anplRxFIEj02Lm24RnBYRm7HH6RSM775Abycgy/SzY1lQwAlbVCuxJwTAYFTahGSxkhuxoHClAdq4oLcZe3+Vw4GoX2vVTHX+DjO6/eFfHXTXo6/LS+jGkluL5I1e6sG3VrrPYDu5AMSQgqMISA5r2PF89AZ3fPpUM7Fz54Eqb6oyW4safv1cuQi+pN7SsgcBfvcyWlQIcVaBbDh5o0VLu0GIIhkCGWCvQ7L3s+2wU9MpI8M1B1+Y9SJww==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(2906002)(4326008)(66946007)(316002)(26005)(38100700002)(6916009)(66476007)(956004)(83380400001)(8676002)(8936002)(54906003)(66556008)(186003)(6496006)(478600001)(6486002)(6666004)(5660300002)(85182001)(86362001)(9686003)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEptdjczN0hlVHpTN1pzdmJMbWFvd1ZMcnZiMnNWZnNyOWNSWlppWThkTFBX?=
 =?utf-8?B?aDlpMnRuUmI1RkVka2V2ZE9NYlNVK2dDN3dOQmYxRkJZTmVZMTdNQ2xTR3FE?=
 =?utf-8?B?MHVwWmlEa292WjNwdFUwdDlRc20xQ2VHS2tlVGtsRWxQa3E4RnlNUFEyWUdl?=
 =?utf-8?B?dFdWeHVqeFpWR1dGT252Zzd4dHYxOVdCQWpERkFMV3RZVitEZ2s4Q2RxcUIx?=
 =?utf-8?B?Q2wwNFJxYURJRFUvekdWeFYxRFFqa2x5K1RSTlBDSWJENFI5eUI4L0VHTGFk?=
 =?utf-8?B?bEh6WE0zeVhxMGgxOWlFbDA0S2t5R0U1QXFSdmVjNHA3M3RPY05LSytRZ1Va?=
 =?utf-8?B?QlpCMGluYVJwUm9US3RGb0dOZTFoUjRZTHFLaWw1QkdvbklNWFJHSFIzUmFp?=
 =?utf-8?B?Wm54U3dZa05kMGdmYU1lYkxRbDFWcjFtTkpEWkM0dUQ0N2VveERsbUdlaml1?=
 =?utf-8?B?STdIN0VRNXNXbWhJSmZUd3hrakQ1RStWekJxUHE1QkhSTFU1TmVsNFFIQldM?=
 =?utf-8?B?WHdubEJrNzdwc1dTSm9ycXJKTXJGaXVhOWd5dlNCZWY5MnY5dW1RdFN6VlVx?=
 =?utf-8?B?RWN1VlZLUU5hYzRTS2kvSHZEYkh4Y3I4Y1o0WGs1dzVOa0IxODEvdHpTTDFD?=
 =?utf-8?B?QnRFVEJkV2JIWGJadlUyZDlDeHFnTUJqNFdTd3RIMU5xZFlJYm04V09FU0tX?=
 =?utf-8?B?RUVPM2JPUm9ZUTg5dUlTTmFvcUJNa1RpZUtTYVFkaTFGN1c4QVpBY0wwc2Ro?=
 =?utf-8?B?cDV1dlJoaXlTT1RBSTM3U1k2THdSaE42YzhINFVxQUhha0s3Y0VJdUF3OEtE?=
 =?utf-8?B?dUI2NXE0QUZ2RXlNZDdhRWFmSEJsRG1XMFNVc1pkRThmd2VzR0VMR2hEWFBV?=
 =?utf-8?B?eWVrakNrc1BnSUxma081R2JhZlZSNCtheFdZTlJWc3ZsakRLOTVvR1A1TnIx?=
 =?utf-8?B?UkNjSHFrVC9wZFlGYnhMTWxYVnZnTnlnTisyRjVkUzZkdmx3OXFxNW4yTmYz?=
 =?utf-8?B?ZFVlU0JWM01wQU1DYlRqWWVkeWZwaHRPTExqN2NxRXd0Sk9WaUpnbXlaOWls?=
 =?utf-8?B?YUVNSGNpMWtYR1BBbGt0YVQrS1RiWWpJcDhiUnBabHd3UTlPR1RsaFJJS3px?=
 =?utf-8?B?THJsaFdWVEhmVWc3QzE2RTdLZ1hHOWlpSTR0WFcvWlR6ODFDL2U1eHRWODN2?=
 =?utf-8?B?UzR5T3gycTNhTU1MbXZKN0EySmVqbEVIdkhpdHN6SkRxd3BrZHZqNWlTaW94?=
 =?utf-8?B?bXYwZ1hyMk9vSmJML0JQaURpdWU0SGhoVVN0WUhZSkNwak1BS2Q4T29iR1l5?=
 =?utf-8?B?OGFBYXRlQ0ZUTjJHSG1scGtibE9PQUtoaUdmUGNBZUhnRmx5bzFmZmZKNTFH?=
 =?utf-8?B?WjV5WVhKMEx3aFdhUkNzTDRuUFl3dXB3cHFadGsvTWl6SmhiYndqNEY3NGhG?=
 =?utf-8?B?ekVrSjI5U3M2L1hSYktpREFadVhUTmZPYktiTEJmNWpWeFllTDF6NHovSEtp?=
 =?utf-8?B?Sjd1TVFKcTZvQVBJb29IbXFMNlBpM3p2NmF3d1ZpWHlmbTlQK0NaNkx5ZEs4?=
 =?utf-8?B?TzhESzJoR21RSHpwbXBsV05uVlFmRmduTU9FV0lBYTExcEFBdjNqc3hER3Na?=
 =?utf-8?B?ZlNxM1htMGVveG5qTmEwMWE2eHdnZEVDeHNUTnNaN2JLdlRTZTNHaGZ6OGpN?=
 =?utf-8?B?ZlE5d1FXaGlHeW9pUGMxZkozL0xVUnMrMDQ4MzB6cklBYVBBWTJFQmZqZjZ2?=
 =?utf-8?Q?rYx2QwDj7WPgdxQ2/PIPkXBMMK5qvSi0/1gT0o4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2629d739-bd18-4335-d990-08d97752e351
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 07:40:13.5238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +DK3R1RBDCpVqZ1LSMyZF0d6G1+nxIiuzhHvRgXxtAQczYrt2lqRqLZzL4HAJFEf7OTy6zEICgm4S25XIwMs/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2969
X-OriginatorOrg: citrix.com

On Mon, Sep 13, 2021 at 09:54:01AM +0200, Jan Beulich wrote:
> ACPI 6.3 introduced a flag allowing to tell MADT entries describing
> hotpluggable processors from ones which are simply placeholders (often
> used by firmware writers to simplify handling there).
> 
> Inspired by a Linux patch by Mario Limonciello <mario.limonciello@amd.com>.
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

