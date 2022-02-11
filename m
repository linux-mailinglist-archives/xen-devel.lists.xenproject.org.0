Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 807094B20E7
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 10:03:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270248.464469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIRpI-0004xw-A1; Fri, 11 Feb 2022 09:02:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270248.464469; Fri, 11 Feb 2022 09:02:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIRpI-0004vw-6p; Fri, 11 Feb 2022 09:02:48 +0000
Received: by outflank-mailman (input) for mailman id 270248;
 Fri, 11 Feb 2022 09:02:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dFbI=S2=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nIRpG-0004vq-ON
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 09:02:46 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f679065-8b19-11ec-8eb8-a37418f5ba1a;
 Fri, 11 Feb 2022 10:02:45 +0100 (CET)
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
X-Inumbo-ID: 5f679065-8b19-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644570165;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=sFJ7vHZLreRxlZg8j1a+Hf8zN3kE/6BfXYc1RVwX+8E=;
  b=Nw3Dpz/4/rWYZtugNH4WlKRLibnHP4wrQMPFylEThoYtmvfaOl0HPaD9
   JloZUsVEezEBeNto+KhgQhkvl8h2JHjA4axjMAABZhPh63Juwd+xb62b7
   d28UuLzjDViui80hXemzeKmKF69xWkg3gH1zoKuneqBW/gj0aXp51zrur
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: fZbxRwMWMELa8BsgtPOv94sgOCTI3j9M17UBJZskzu3CF6iULGrDh6/c60dK4H7OgdzcZh/cKX
 YVRsBBWjn/lRJbUzTBewZx8VOdkY4GDacav/WHIIMCC9DK5U+IARQ4h2rM7e6dH0/2UmzStssp
 SqFuCn/OXI93KajiWsthxhxFe5V3TJpOI52FspDGhiD6p24a3eGVcVms+dGeCaCnhwcjffcveT
 WSkx/yA9QMZsIO/dco/wnqyfLy2rq/O9IEqW8+yKuvTvziQp0EaDIi1e/JhHSfUegH8mn0AIj+
 r9IiTivfkA739AveFj1PwZso
X-SBRS: 5.1
X-MesageID: 63446092
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:WUjHEKkhDg6Igp/KUZnElt7o5gxvIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfXmuCMv3cZ2XxLtp3bY2/9U9QvcOAy9I2GQU6qH1mHiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2Ncx2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NFzkJmcEiQiBb3vxbwbTThWFCBCApQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glr2pwQRaeED
 yYfQRpWdDrdaDMUBgkWEbQyjvbzwV//fyIN/Tp5ooJoujOOnWSdyoPFMtDYZ9iLTsV9hVuDq
 yTN+GGRKg4eHMySz3yC6H3ErunKlCXnWI8DPLS9/+xthhufywQ7GBAQEFe2v/S9okq/QM5Eb
 VwZ/DI0qqo//1DtScPyNyBUu1bd4ERaAYAJVbRntkfdkcI4/jp1GEAAcBtERIcFv/QmZmFy0
 EGokdToOQNW5ej9pW2myp+Yqja7OC4wJGAEZDMZQQZt3+QPsL3fnTqUEI89TffdYsndXGipn
 mvU9HRWa6A70JZTv5hX62wrlN5FSnLhagcurjvaUWu+hu+STN70Ptf4gbQ3ABspEWp4crVjl
 CVc8yR9xLpXZX1oqMBraL9cdF1Oz6zbWAAweXY1Q/EcG82FohZPh7x47jBkP1tOOc0ZYzLva
 0K7kVoPuMMOZib1MvUqOtrZ5yEWIU7IT4WNuhf8NIQmX3SMXFXfoHEGibC4gwgBb3TAYYlgY
 MzGIK5A/F4RCLh9zSreegvu+eRD+8zK/kuKHcqT503+idK2PSfJIZ9YYArmRr1ot8us/VSKm
 +uzwuPXkn2zpsWlOXKJmWPSRHhXRUUG6Wfe9ZAJKL7Zf1YO9aNII6a5/I7NsrdNxsx9vuzJ4
 mu8Sglfzl/+jmfAMgKEdjZob7aHYHq1hStT0fUEMQn61n49T5yo6atDJZI7caN+rL5ozOJuT
 ulDcMKFW6wdRjPC8jUbTJ/8sI09K0j72VPQZ3KoMGolYpptZw3V4du4LAHhwzYDU3isvswkr
 rz+ig6CGcgfRx5vBdr9Ye60yw/jpmAUne9/BhOaItRadEj23pJtLij90q0+L80WcE2RzTqGz
 QeGRxwfoLCV8YMy9dDIg4GCrpuoTLQiThYLQTGD4O/vZyfA/2elzYtRa8qyfGjQBDHu5aGvR
 eRJ1PWgYvcJq0lH7thnGLFxwKNgu9a2/+1Gzh5pFWngZkiwDu8yOWGP2MRCu/EfxrJdvgfqC
 EuD9sMDZOeMMcLhVlUQOBAkfqKI0vRNwmve6vE8IUPb4i5r/eXYDRUObkfU0CENfqFoNI4Fw
 Ps6vJ9E4gOyvRMmL9Kag30G7G+LNHEBD/0qu5xy7FUHUeb3JoWuuaDhNxI=
IronPort-HdrOrdr: A9a23:en3hgqnZodz4BT9FcYY8ZJGpIhbpDfIQ3DAbv31ZSRFFG/Fw8P
 re+MjztCWE7Qr5N0tQ+uxoVJPgfZq+z/BICOsqTNCftWDd0QPDQb2KhbGSpQEIcBeOlNK1u5
 0BT0FWMqyIMbAk5vyQ3ODDKbkdKXO8gdiVbJzlo0tQcQ==
X-IronPort-AV: E=Sophos;i="5.88,360,1635220800"; 
   d="scan'208";a="63446092"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNYmODpVDxydugSmm36gtB9reoXYcgngKzTXleXWzDnOeZGaBxq+VDAyMKJrWC9lH0dZG35YB6WXhuD2ZIno3Xoq/fdT2bwj2uYAh/l3tQlEkVwdDUbUCCJAwy+orlJjJaDEe8PpdxShCbUjMNewCEYdGpWtdKTUz7+If1bmNBwepUIivldKDpLigGfjKuTU4ATWamxAes+1+qa8JjWa1m/ssEZWeT7AaAxTipAqcxirkwwI7tyCdNZNmVd1rDE4E+CymE8b7S8HQkTrrvjgCfrtv+a2wigMQOpx6LN4gHKy4n4IqXGylUWuCyskWu5XlSSOUl612oXMWdastIar2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dv+VwNmuL7unPD8m05z/0WAG7OmF1zQHlan0/tURldA=;
 b=PVbrQQN4jVW+25PtS5WeAk+tM+8r6VFcGcMgxj64wweK3zdFUoZjLtX4bFdLErJCAZxJPkMzWFbKdTwj2QlqLWn39Yzz6wuNTZz9PIrrpBr/W9jqQIBOmeqoQy0uGCPQq0gbRx7w9V6UzCv2oCRl8hA6tUC/NJXVv2SM8z3YFyj7Tc8plA+sWT2TXZ/T4wJZU3pXBQCjZxRNM8s7EAoe5nKxEu60W6/rWKVw6E15horuXiTWnjEJJ0ypPxkmqooV3QzkbTARYBZaB2WYl7AoK7biymerJjvG1hoBCL4hJT8wCtny9/36VPkdiJNaEZh+idwcE+R17Z0bQJNTFVXGUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dv+VwNmuL7unPD8m05z/0WAG7OmF1zQHlan0/tURldA=;
 b=eq9UAz04M1g3AQrTgILp3cR/eEwzVc8rKpK4exuuzoFojZQGyeS4wnjJ1kmTEefMPh1M3N39viinHuBDXc7Qs0SN4R9azgXXXX3vBO0ryFYKzI48P1Fb7dlTvOh7sFD2FmEtYVfCeqpZ+RQejicq2xQRgSPz98AxkeKOxHRODs4=
Date: Fri, 11 Feb 2022 10:02:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Norbert Manthey <nmanthey@amazon.de>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH CPU v1] cpuid: initialize cpuinfo with boot_cpu_data
Message-ID: <YgYmKiZaX2vZYgKP@Air-de-Roger>
References: <20220211072327.1213-1-nmanthey@amazon.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220211072327.1213-1-nmanthey@amazon.de>
X-ClientProxiedBy: MR2P264CA0192.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::31)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b3ed7a4-12eb-45a2-436d-08d9ed3d4173
X-MS-TrafficTypeDiagnostic: BN7PR03MB3540:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB354068953356500BC84D7C3F8F309@BN7PR03MB3540.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MdWOUrqR9gvfcBs6zp9NgqmCmKbPDoJIlywMLZGAQmr4MQWetAeHd1/cH13toq2hHJ0oQTbs8iJYUXF7vrfmF+ItL9Oe/eIspydNsUZv9Vny+vMAqbbTu8SWqOh2PWW8igUOo0N2dzvApL1c2EC44ec5fZkLXTRmggcmsjFYgyAONx8i0UP7m4IBuCH/UtEPiekCViPXONQfveX9xmCQoWYWHiC0aB9mCnWYC5VMt4d9Hj6254WiuKDSgdUURrfgmIMqAQsC3jckaZ5O2lFKJySBh3vgrBpXuMFThTvQ+710Jq3CLEyZjVtTwqKf/c3zEXhrrYeJEH2eRyciFJ4eBRAerB9UuwMLgK4k+gFeaKImoGdPPD+CyKsg7z0TjIYg7s96MDi/G+W2AUBdiKXTH33EAHsPes3ZYgNO8eWYz0rN2BACXnR2YH24sneMUiSJjjgzbyxJxDh8wiSaIClXkYar/Y26rjopXuHEfBRg7AEM9Ufb4BAoHKtV/6LcOzdEaoCUgJVsP9+T5ytdajgwIfeW2JpmUM57PZmDNzJh0Ts5XDPZDb8E0ZDPvfuZ0CWfLv5my/GlnXFfEOFbBgNoavKoblj56+WilADrjg2sE3cqkFrbWIBybBCNOozRcguiPWFDLX8j+Ts/X0QL9cQqOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(54906003)(8936002)(316002)(508600001)(6486002)(9686003)(6506007)(6512007)(33716001)(6666004)(6916009)(2906002)(86362001)(85182001)(4744005)(38100700002)(66946007)(4326008)(8676002)(66476007)(5660300002)(66556008)(26005)(186003)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ditZWHhZdFVtd0RIYWpTVkhFODcvTXlWdi9pZUdUYTc4aitSYzR0MGRWRGJS?=
 =?utf-8?B?QVllSjNSVG5NYTg3eEF1SDBLQ3lsRGFrVG96QU0wYW5lV0NNc0wzNnFCS25H?=
 =?utf-8?B?anpEaG16YncrQkZ5L2ZaMTE2cjh6SUcyU0I0Yk9zNlZKYVRxZmRwVXBrSzhx?=
 =?utf-8?B?bWt4b2pHa3FPMjNhWnkyUWZsM3FmZHI2TEUwazh1ZHFmZFY0QzdpQk1ENUMr?=
 =?utf-8?B?bFpmWmxHUzQybEpyM29sQkkrOTZVdkZzTUkxV1YrZEREUGxXb1lqV2RJSkZT?=
 =?utf-8?B?ZU1kbUJFM085ZjgxWkxnUEtXQUFpWTExQUdIS1pUL3BzaGYvWjRLMzQ3blBF?=
 =?utf-8?B?U0g1SUs1NlpibUN3WjA2cUhUb1RNdDM5Y2JaQXNtOGRxbXVXQzFkc1VkaWM1?=
 =?utf-8?B?UVNMTkRnT3F0Z2tBdFpWcnViaDlGbXJiNVRCa3ZvV1MxUWc0UnR0RFFpSWZZ?=
 =?utf-8?B?SjZaV0p6Q0xGTUNaTVJaQWZSZ1lWeTVxSjZpcEJFWXdOSFBBVEUzUGF1Q01N?=
 =?utf-8?B?TDlwOVY3L2lOcFpFZlFmMFUyRUlSYUpWV2RiTFJEUHpTbk43cldMVEhQUlQx?=
 =?utf-8?B?MEVyd2xIakJhQWFLR3JXa2JuY2d3eEZoKzcydzl2cU5ybUpYOHlLcE4yU2VU?=
 =?utf-8?B?UmM4ZmdxRThrb09SaTZoSXRLbkdTVncvK0VxYVZaMkRmZnhyeFBtUndCRzNp?=
 =?utf-8?B?RzNpeDBjOHhTZjI4MTBnV2g5dk41cE1sNlZkdEFvUnZlMnN5eFoxa3krbVJk?=
 =?utf-8?B?VmxncjR2ZGFNZEVkSk1DY01kbFVUMG83SHBOS0RiaUpVV1QxRitXTDN6UkpU?=
 =?utf-8?B?N3JMd3BUek9vaXhiemR1TGludjlRZnFFYWlXSy9pWXlWRDV6T2NibGxwNW9z?=
 =?utf-8?B?SFhhYnNxU0ZxN2xFUkxKOE83dVErS0h4SUl1REljbi9sbjhhd0oySmc3Nnhk?=
 =?utf-8?B?KysraE55ZnFaUVVib2pUL3VJa2NCUFY5RHp4eWZ0cU5NT1lWK1BDVG1tblBM?=
 =?utf-8?B?Yk1GTWVha0NEdXJLWENWaHJtVUdMeEUrRzVTUnJFQWFhd1IrYS9BSjdVNE83?=
 =?utf-8?B?aDNzZDA5c09hdXlIb1FqUjVpekZIN1RJZnJFUFVLdHlRdjVwMnFkSisxQitv?=
 =?utf-8?B?L2FzWmxwMjUwdGMrWFIxb1NST0VVcWl2VVhsWmVQVCtkeFFqZ004c0M3WFIr?=
 =?utf-8?B?bkk2WWVleUhWcVRvbno4TEtsbVg0bDZha0NDT2hqS1VNQ3oyRGxVOG9JT3RS?=
 =?utf-8?B?b3lOei9CSWFoakNCVW55U0Q4SWlldXlvUVdlMWxZMlVHR1pwcFV6QTdjZmdT?=
 =?utf-8?B?c1cyRjJMcTVGcVVwOU1RRlA2NWlpQnl0M08zZkJkUGFYSjR5b0owM0ZYR1JX?=
 =?utf-8?B?WTRweDZLSEpIemQ3N2V3dXA4UmxyMldrVE9rZit5ajN6TGRxeUJVTGR4Z1ln?=
 =?utf-8?B?ZDZUSVFySkFxMkZQTlVrMHJUM000K1RGcWtIRWh2aGpsNjFBSGQ4SnhZOWRG?=
 =?utf-8?B?RnNZNnFyVFpoK2dNNjk2cHlaNmRyMTE4YiszVmpibVRCMFJPUWxiNmhuR0Nj?=
 =?utf-8?B?ZExsMWN3cWlZZVZlMi80SWdCVFE4Sm1oQzN1WmI1ZG12b0d0QXAwVGU4aFBX?=
 =?utf-8?B?NFFLdjkzdGNEYWhFdytja1p1eDRud1VFb1d2cUhsZ29ZUmMvbytFTmEzQTVC?=
 =?utf-8?B?cUpuVGdGc0x2aGlYVzVMZitPdDRwU3ZIdEtYeGZxRUlDTW9uRVF1N0pEKzVz?=
 =?utf-8?B?WXcwck1XVEZTR1dMcW9PenJHT1BlVHpZYkJjRksrNnJEQW9adGlaYWdOc3FU?=
 =?utf-8?B?TWxjUWdudnVnQ2lPQ20rbU9uWVVHWnZIMVA4bk5EcE0zcU93WTdiOTlhejVk?=
 =?utf-8?B?cGd0ODhFZ21YRnRodVc3alJNWHdqOXZLU2JnVkdGSHVCZGJvVXdRRjl2eFdY?=
 =?utf-8?B?Y281c1FyTStuTzFFVHU1dmpjcWU2WlhsMHhCU1JNTVFZY3F4Y3ZRQ0lBUHhm?=
 =?utf-8?B?QWJnWWsrNW5NYTBTOU9lYnJlcVZoOEFsYWVMTHhYaFNsUkh4R1paSm94U3RC?=
 =?utf-8?B?bnByZ1lmUS9uVTFNaUtQYm1ZSEVDeCtva2haWVYzb2cwUkxXNzFqL2YvN0FT?=
 =?utf-8?B?Q1ZZUmlUM0hZaSt2NWVjd2dxSUxKa3BYYzVkLzFlUjRhUldPT3JBQllkYkp4?=
 =?utf-8?Q?+TE5j8GtZOi+TDkFTd+btNs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b3ed7a4-12eb-45a2-436d-08d9ed3d4173
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 09:02:39.8215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dpc3uFzb+jJYp5H4/WhyeeGvZFMYU/F0S4YdgL9k6puTJaw9lZVGqjKk9x2feH8xO68fGmunOKS3M2AIuT0RwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3540
X-OriginatorOrg: citrix.com

On Fri, Feb 11, 2022 at 08:23:27AM +0100, Norbert Manthey wrote:
> When re-identifying CPU data, we might use uninitialized data when
> checking for the cache line property to adapt the cache
> alignment. The data that depends on this uninitialized read is
> currently not forwarded.
> 
> To avoid problems in the future, initialize the data cpuinfo
> structure before re-identifying the CPU again.
> 
> The trace to hit the uninitialized read reported by Coverity is:
> 
> bool recheck_cpu_features(unsigned int cpu)
> ...
>     struct cpuinfo_x86 c;
>     ...
>     identify_cpu(&c);
> 
> void identify_cpu(struct cpuinfo_x86 *c)
> ...
>     generic_identify(c)
> 
> static void generic_identify(struct cpuinfo_x86 *c)
> ...

Would it be more appropriate for generic_identify to also set
x86_cache_alignment like it's done in early_cpu_init?

generic_identify already re-fetches a bunch of stuff that's also
set by early_cpu_init for the BSP.

Thanks, Roger.

