Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3D84A9918
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 13:16:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265460.458833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFxV7-0003La-Va; Fri, 04 Feb 2022 12:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265460.458833; Fri, 04 Feb 2022 12:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFxV7-0003IV-Ri; Fri, 04 Feb 2022 12:15:41 +0000
Received: by outflank-mailman (input) for mailman id 265460;
 Fri, 04 Feb 2022 12:15:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=46ws=ST=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nFxV6-0003I6-0l
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 12:15:40 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 288e60e1-85b4-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 13:15:37 +0100 (CET)
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
X-Inumbo-ID: 288e60e1-85b4-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643976937;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=7ZVk3LWMhdvQy6YVzmmNOu3jMzmBx8+ZuP9739N7bEg=;
  b=axryVhGM6Yj1CCByCm7iY61wHaCim6k3jifJ8M6mnynGkWVImvT7swsX
   xn2WMuZ90ukwDn8xUgjpGQGmAbtaHcun23D47Ckv5YVvjzjc0rHxdLkkR
   q41xSUN/TT3uKJCpMEU2L87+jWa5O0isy+0ZyEtRuENwNrpm/SZrXBSD8
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: hOsT1x04df9AA4wuVvfZ27wNo1vK42GvY54kEFTOU/37Y7MlUQPspD949T4ZPZ0qSO+O0/Jk8o
 UL8gC4nWb9MeV7ug++IZWn7m+AJBeJdT4lIuIHRVC+JuQ83CCGyrdrRkamSNFk7pYGMMSFq/df
 xfAQRVgDEMqSjgRmh3MU1df7an5S9cjovj8aL7ak1zDoFvHnAdvU9Ru6uKhqm0s2zxGH9rZZrM
 icFc8CyvPE86I8F8TIWy0P+kSxuOj+LVP45ySORMT8f/s7iTw7k5hMNf7PkcwVuv70b2tOsjl6
 d2MWZxZm2pRRbohJaC9TUicM
X-SBRS: 5.1
X-MesageID: 63900502
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tzXtqaKYyqiWnUgSFE+R85MlxSXFcZb7ZxGr2PjKsXjdYENS3zEDn
 WRJDDiGOKveZWX9KIhwOoi+p0kB65aDmN8wS1BlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Ug7x7Zj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB3Rw9Nz+
 ekUuafoF10vG6r+qcFCWSZHRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2Uvo4AhGpo3KiiG96PS
 eYUeyE2YS2cTABIGVEJNq8CmcW30yyXnzpw9wvO+PtfD3Lo5BR4zbzFINfTPNuQSq19t1yEq
 2fx2nX2CxAXKvSS0TOAtHmrg4fnly7hRJgbErH+8/dwmUCS3UQaEhhQXly+ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c8BZE/A+rhqMzKXUyw+DAy4PSTspQOIhsMg6VDk7z
 GijltniBSFsmLCNQHfb/bCRxRuwMyUIKW4JZQcfUBAIpdLkpekbqRbCTc1qFqKvufTzFSvt2
 DCBrCU4hLI7gNYC0uOw+lWvqzCxopnESCYl6wORWXiqhiteYIOmfIWu5ULs0edbLI2ZQ1+Cu
 1AJg8GbqusJCPmljzeRSe8AGLWo4fetMzDGh1NrWZ47+FyQF2WLJN4KpmskfQEwb5hCKWSBj
 FLvVR15vMNQPkqWNKNMO9zrDeEt/5nFSt7aSaWBBjZRWaRZeAiC9SBoQEef2WHxjUQh+Z0C1
 YenndWEVihDV/k+pNaib6JEiOJwmHhirY/Gbc2jl3yaPayiiGl5oFvvGH+HdagH4ayNu205G
 P4PZpLRm32zvAATCxQ7ELL/z3hXdRDX5ris8qS7k9JvxCI8QwnN7NeKmdscl3RNxfg9qwsx1
 ijVtrVk4FT+n2bbDg6Bd2pubrjiNb4m8y5gbXdxYwv5gCd4CWpK0Ev5X8FsFVXA3Lc7pcOYs
 tFfI5nQahixYmivF8shgWnV89U5KUXDafOmNCu5ejkvF6OMtCSSkuIIijDHrXFUZgLu7JNWi
 +T5imvzHMpSLyw/XZ2+QK/+kDuMUY01xbsas73geYIIJi0BMeFCdkTMsxPAC5pddEyelmbGj
 Fv+7NVxjbClnrLZOeLh3Mish4yoD/F/DgxdGWza5qyxLi7U4iyoxooobQpCVWm1uLrc9Prwa
 ONL4ev7NfFbzl9Gv5AlS+RgzL4k5suprLhfl1w2EHLOZlWtK7VhPnjZgpUf6vwTnudU6VmsR
 0aC2thGIrHVasnrJ0EceVg+ZeOZ2PBKxjSLtaYpIF/37TNc9aacVRkAJAGFjSFQdeMnMI4sz
 eo7ltQR7giz1kgjPtqc13gG/GWQNH0QFa4gs8hCUoPsjwMqzHBEYIDdVXCqsM3eNY0UPxBzc
 DGOhafEi7BN/Wb4ciI+RSrXwO5QpZUSoxQWnlUMEEuEx4jejfgt0RwPrTluFlZJzg9K2v5YM
 3RwMxEnPr2H+jpliZQRX22oHA0dVhSV9laolgkMnWzdCUKpSnbMPCs2PuPUpBIV9GdVfz56+
 rCEyTm6DWa2LZ+phiZiC1R4r/HDTMBq8lyQkc+qKM2JAp0mbGe3maSpf2cJ90PqDM5ZaJcrf
 gW2EDKcsZHGCBM=
IronPort-HdrOrdr: A9a23:QS8xqqDuS3j+0hzlHeg0sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHPlOkPQs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QD5SWa+eAfGSS7/yKmTVQeuxIqLLskNHKuQ6d9QYUcegDUdAf0+4TMHf8LqQZfngjOXJvf6
 Dsmfav6gDQMkg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/jIsKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF6t2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCmlqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0hjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXX9
 WGNPuspMq+TGnqLEww5gJUsZ6RtzUIb1u7q3E5y42oO2M8pgE986MarPZv6UvouqhND6Ws3N
 60QZiAoos+OvP+XZgNdNvpfvHHeFAlYSi8eV56cm6XXJ3uBRr22uvKCfMOlaaXRKA=
X-IronPort-AV: E=Sophos;i="5.88,342,1635220800"; 
   d="scan'208";a="63900502"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m40Yxvr2zyEl4vzNPAQDuqf6mMiVgqNHoOxLoySjw2Inl8zfNEEHeVI5h5xNG3snMN/a4V74WSkNGLfs1I+XsCu5hlR3Qm0cRWsvJ/1M+B6sjH2WvyyqRVT6gjGcFbB+lF8RAEsfprYPe3+FaBc7ytrHU56yMMwO1r3Yotj8whdAW9vrGxJpv0FSN9C4kidbBG/ifAjJ4jnD9Ow6qzvDXLdk9u5Oev6yNTtjRYwf3DYysdC2Fn4US/UMltNjcbQYJqFexNUN5QSRvWuZ2DxzXS5gGgB1wGTomHS28O/eJtbpIbICtfVrzAvdny48CemZNFLIz/es1si0emoGj7dX6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxcVPsnDzRDyHUMKl2zPufZvTJ9bZ9pZr7eWfrRfxBU=;
 b=mAXae7CO+zQyJ/coUsikEFN3yq3QoKzV6FYvMMx90JUaeep/UkRYIZS/eSYClajtBQwlJxa9JWzBcuLr/SCOf63/+RUbxxLuQRRj85vxqaVVvPomNBAwjYnR9SvfaEZDvPdx3JB0yHWl3tHx9N/BdQ2MOkdO4fA0dEzoDGHc2ze1a+QaT8fw7t3DbZCfMTwtuIuqnH6bHriPOIENDkBY5SU5RBsH8e0JJxlrDhsP7YsUwAxwQq5MDLhZbKodd32N3Wsg7YK0MBvfGun3w3lHvdLE7Tl34juBM9DuwjTNsFwM/I4A11YLvZkR6WeqBIkP31xocvzP2dU0rNTJMwqGvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SxcVPsnDzRDyHUMKl2zPufZvTJ9bZ9pZr7eWfrRfxBU=;
 b=W9QYTNwPaeDPIu7LRz7naWUCjtSMoALfDdHZhhlJpB+BJEHiCXHc+sQB+SVhvV6Dtp/fZcaRYpZkx0HR2j00nIjMpsHZduORc/BP6h6p2AEcfbRX7yfoMgakKh8J7q3BiUH/dBacX5wIzJtlB7Jru/OQYGA2IxVwhM7/H9TKiZo=
Date: Fri, 4 Feb 2022 13:15:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Jan Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "paul@xen.org"
	<paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Message-ID: <Yf0Y4DEG4b5d3pRi@Air-de-Roger>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-4-andr2000@gmail.com>
 <7209889d-8f17-61cc-72a4-97f6dbc1d54d@suse.com>
 <2cf022f8-b000-11b7-c6b9-90a56bc6e2ea@epam.com>
 <04726915-f39f-9019-436e-4399533c9fc3@suse.com>
 <9ed3f4ac-0a2d-ed45-9872-7c3f356a469e@epam.com>
 <c3a99712-cf7c-37da-aac1-f2ee00e6d53b@suse.com>
 <Yf0KcVD8W05A4fbB@Air-de-Roger>
 <55fc77e8-44c1-8769-f818-d68c05dec987@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <55fc77e8-44c1-8769-f818-d68c05dec987@epam.com>
X-ClientProxiedBy: LO3P265CA0006.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fa1dec0-9286-45f8-3464-08d9e7d80a2e
X-MS-TrafficTypeDiagnostic: BYAPR03MB3925:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB3925A28609E3B740C0AE2E4F8F299@BYAPR03MB3925.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MS+RZz/EaS+gzmQxdETgT9qd2Gco720ISka83w9C/Dm5qcX2n9IhJCZu4U/O6jImr8jwikDsXGQgbX4joQNRcCAOFrwHS7kCUHl8jHo7DXNvb2w7r4xLKR5xsh2RoaVn9nMO1TvTaoiGWbuh5EAI2jEO+jkf432JYbdjkOuG6zdAQNH+n9uBIzfURFb3En94nrwWpi9MBABp9yBuoECq2kQ8GK576NwnMDG1mqFNv53ZWEzG0hF8Qiv9a6KwK0zSgbpCB9Cz4RKUJGJ3TnGaN3IEh1+Jfgz91fhAxVsfBfDMZ/pOqLopDHhH+Yk7Pzh4pxeeUEGSKQnWmr60zf4pzoTU7zZptl19r47KJDenGUL1RqQ6/+GF9VotimL9FG1fCnVh3LCKP7WTq1cwyTB2+YBRpbuhi57Y8h/HJYvLkd6fZ42PHinUFCLV8hViR2nCxFlw8M4CxpA4fON2bK73XeGaL5Z2BZ0IZ356pU7BF03Cf6hf0Ef/Z6r+3qQvnml3fHeeaE4WAeNxrGFnkFuThIJho37YqaopLTmoc/8rr85qOr+4JtMgv+lBSjGtFS/A2yh26N4+C6yXh7VPt8qzqPwZX6y8JCpaymFYrhRfE74xcPp/5z9KiKqakW2Gd/r5OM9L1G+MU/OC+UUpFs8J6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(4326008)(66476007)(66946007)(8676002)(8936002)(66556008)(2906002)(83380400001)(5660300002)(6486002)(7416002)(38100700002)(82960400001)(316002)(9686003)(6512007)(33716001)(85182001)(186003)(26005)(6916009)(6506007)(508600001)(53546011)(6666004)(54906003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTZmZG02R2ZCamptZnBvd3QwcTBjWWJTak9oQWZGN3Q0aHFZdUFCZ3dLT1Fq?=
 =?utf-8?B?VTFwNDNybGRIWjgrWjJ5cisvNDRSMkdLelZoc2VJdC9lRE9sdHdBNzE3bVJk?=
 =?utf-8?B?b0g3NzNGZ2k1S2VRRFNWL1NHS1JaWDhjc3BXendNQTgycHVkUldwaEFNOXpL?=
 =?utf-8?B?LzBzSjZwZkEvVDVSNGFrSXJtMlFMRFF5ZmlMSkhteXZSdWJMeVBNQ2N2a0Fl?=
 =?utf-8?B?K2YxREZmOVNhVmdjSUJsUksxN1BQOHlBTjlVUnlvVjc2ODJFcnlCVFlCZVFv?=
 =?utf-8?B?eFVwMDJpZzZ5aWtxendselRiazRvM1JKc0dmWC9ldnFXc3pwWFk2NFlWdnlw?=
 =?utf-8?B?WFJPRnc0MXhMbU5GUDRyc0l1WU5XSlpORVhUR0ZYVzFxVFM4RnBCQ0p2NVNP?=
 =?utf-8?B?SEVJVHZRQ0orZzFybHNZQmNPUkRKSlR4ZVlLQXJmb0pwNWR0QUhtTVcreWZt?=
 =?utf-8?B?ZUROb2NONENJQlNJZXRheUhFRm00NklnR2w5NGdCR3dYL05OclZIdVJJOHJY?=
 =?utf-8?B?dXQ5cVVSbm5mOWVvMVBMOTlscUt1L0hjWWE3R1BYUWVaWEsrVHhJKy9Xc2Z3?=
 =?utf-8?B?SGpkQlJPazF5MS9KWDFKcm81RzhlZFV2YnpOYVlReStyLzFhSUIwaWFnTTNI?=
 =?utf-8?B?aUx6QTZUNkhVT2VDV3BBRExoOW9yZEQrREFJS1piVHQvaVNTeVRBM0dZQXdZ?=
 =?utf-8?B?RHhlUjBGS0hmbXE2ZWlEc016eCtCWHBQZEUzK204bThZa0hJVEowcTJ2S3Bk?=
 =?utf-8?B?OWEwWEtFbU85bVFXbVRyVVVRWFFQUEZHcUJoS3h1ZGlJWlFyNDhYamRYaVRL?=
 =?utf-8?B?YzlzUFZQenVuWTM5Q0VwYjYvT0k3V3hsNG15VHplSDFYa09IUXFJeDBqSVQr?=
 =?utf-8?B?a2dqV3JCb25PMnVXelBIemQxRFA5MzduUU1CT3BUdnZJREJrSlFHTGVZSFp2?=
 =?utf-8?B?dnVIdTRXTWtKd2o2UnkvWW5rYjlTZlJEMFNYbXpYY3NWdXY2Mk5IUUVxWHFU?=
 =?utf-8?B?N1M0Y1cyUGRQUkw4VHNneHQrZXhuSXkzQ3M0cjUxL2kySitVSUFPalBmc2lh?=
 =?utf-8?B?MjBzaDdGdWFCL1ZVMGlpMVd1ckdiUjJoT29oeW5TRFEvdEovNGMrNGlOTUVZ?=
 =?utf-8?B?bDdiZG11RmdwczJoUXYzZ3VFTExDRnZVdmNYNFp1elZtRXF4azRKeFRjNVI1?=
 =?utf-8?B?OTNycVFtZ0NDbUpjK0U5eEZIQXVKMGtRZHhtcXBLbUNZd3ZscmxTMWR2aVRN?=
 =?utf-8?B?WnlTcTFER2UrVjhGcjZRcEptQTF6NXpQY1dmRU1iMkVzbk9QSUwrSnRaa1Mw?=
 =?utf-8?B?cVQ1T2orUEl4N2VsOE53aTdObVU3YksyN0wzUEpJS2tvMVdIalVQMlhISWtI?=
 =?utf-8?B?VnNMeS9xdlJyQmpaaFJUYzBvTmsyb1Z2Q3NSNEFNS215aWtlOFc2NDEvM0VG?=
 =?utf-8?B?NGpzMmtvYWE4UFdybHpJSGJHVEZZMlQrL1ZWOE5aM0tlSkphZWRLeXRjcFVt?=
 =?utf-8?B?MFN5SkVqNXBnUTJ6bXJ0dTZEcG5jdDlReklLV1lTeG9HaCt1ejFIRzB5OUxP?=
 =?utf-8?B?Z05ZdWtGbmpSdkdqREJick8zb1AzVnIrUTBSNnpPSGRmdHN4NzBzcXU4WEt3?=
 =?utf-8?B?bVJpeE1BaWlKOXBSR2h1cHQ0V3hRaFhOZkhiSHRSOXlOSDd4VzRJbWdydWpp?=
 =?utf-8?B?WnNuaHFadE9vNGVsNWpVVVlCUk11dVg1QzZuNlhPUkoxa0NadHBob0I2T1lR?=
 =?utf-8?B?eko1eVVOMHlmUXQ0cGhldnN0L04zZm1GWHpzSUVjNElYL0kwT2wxSDlWQ2p0?=
 =?utf-8?B?MTNZZmlxM09GcXZVdzk3aGNIcmtTcEUvZGJMRHFqRnZUaGprMjVmZFBSWVRW?=
 =?utf-8?B?cDUvRjFXQk1hSy80MFFBU0JjYzBvQmpQVjc0aWpjcEtINVgxaEpqNENZQXhV?=
 =?utf-8?B?M2cyMk9yU3NwaFJIelRFOEVaOVZHZ00vbnFSNEltd2YyVjcydGRIblpjbHJK?=
 =?utf-8?B?OEJyMmJQUG55Vk41cDJ0UVZuTUprVm5mU1NxMk9FQmRvbmdwMGR0Q2JyRmtT?=
 =?utf-8?B?dXcxNTVHdjUyNURuYmMwM05tSnhvcVZZUWpuM2Vvd1FTcUlJdHJreFJsSzN1?=
 =?utf-8?B?UjFFRC9WS1NWck8wYzA2dGV5Q3lndWgyVzhLdUNQUEI5VlJNc3AzK1dYSlVy?=
 =?utf-8?Q?ZaFR/+K/GP3FcifeqFyOGnw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa1dec0-9286-45f8-3464-08d9e7d80a2e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 12:15:32.1262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cQRhv+7Wt3uCPRVWaDHIhzilw98D0itJGpfYZFPEfCjYIEXMndFmdVwq/gvLAXRAahew2+lcz3REu0gHq4wesw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3925
X-OriginatorOrg: citrix.com

On Fri, Feb 04, 2022 at 11:37:50AM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 04.02.22 13:13, Roger Pau Monné wrote:
> > On Fri, Feb 04, 2022 at 11:49:18AM +0100, Jan Beulich wrote:
> >> On 04.02.2022 11:12, Oleksandr Andrushchenko wrote:
> >>> On 04.02.22 11:15, Jan Beulich wrote:
> >>>> On 04.02.2022 09:58, Oleksandr Andrushchenko wrote:
> >>>>> On 04.02.22 09:52, Jan Beulich wrote:
> >>>>>> On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
> >>>>>>> @@ -285,6 +286,12 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>>>>>>                     continue;
> >>>>>>>             }
> >>>>>>>     
> >>>>>>> +        spin_lock(&tmp->vpci_lock);
> >>>>>>> +        if ( !tmp->vpci )
> >>>>>>> +        {
> >>>>>>> +            spin_unlock(&tmp->vpci_lock);
> >>>>>>> +            continue;
> >>>>>>> +        }
> >>>>>>>             for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
> >>>>>>>             {
> >>>>>>>                 const struct vpci_bar *bar = &tmp->vpci->header.bars[i];
> >>>>>>> @@ -303,12 +310,14 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>>>>>>                 rc = rangeset_remove_range(mem, start, end);
> >>>>>>>                 if ( rc )
> >>>>>>>                 {
> >>>>>>> +                spin_unlock(&tmp->vpci_lock);
> >>>>>>>                     printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
> >>>>>>>                            start, end, rc);
> >>>>>>>                     rangeset_destroy(mem);
> >>>>>>>                     return rc;
> >>>>>>>                 }
> >>>>>>>             }
> >>>>>>> +        spin_unlock(&tmp->vpci_lock);
> >>>>>>>         }
> >>>>>> At the first glance this simply looks like another unjustified (in the
> >>>>>> description) change, as you're not converting anything here but you
> >>>>>> actually add locking (and I realize this was there before, so I'm sorry
> >>>>>> for not pointing this out earlier).
> >>>>> Well, I thought that the description already has "...the lock can be
> >>>>> used (and in a few cases is used right away) to check whether vpci
> >>>>> is present" and this is enough for such uses as here.
> >>>>>>     But then I wonder whether you
> >>>>>> actually tested this, since I can't help getting the impression that
> >>>>>> you're introducing a live-lock: The function is called from cmd_write()
> >>>>>> and rom_write(), which in turn are called out of vpci_write(). Yet that
> >>>>>> function already holds the lock, and the lock is not (currently)
> >>>>>> recursive. (For the 3rd caller of the function - init_bars() - otoh
> >>>>>> the locking looks to be entirely unnecessary.)
> >>>>> Well, you are correct: if tmp != pdev then it is correct to acquire
> >>>>> the lock. But if tmp == pdev and rom_only == true
> >>>>> then we'll deadlock.
> >>>>>
> >>>>> It seems we need to have the locking conditional, e.g. only lock
> >>>>> if tmp != pdev
> >>>> Which will address the live-lock, but introduce ABBA deadlock potential
> >>>> between the two locks.
> >>> I am not sure I can suggest a better solution here
> >>> @Roger, @Jan, could you please help here?
> >> Well, first of all I'd like to mention that while it may have been okay to
> >> not hold pcidevs_lock here for Dom0, it surely needs acquiring when dealing
> >> with DomU-s' lists of PCI devices. The requirement really applies to the
> >> other use of for_each_pdev() as well (in vpci_dump_msi()), except that
> >> there it probably wants to be a try-lock.
> >>
> >> Next I'd like to point out that here we have the still pending issue of
> >> how to deal with hidden devices, which Dom0 can access. See my RFC patch
> >> "vPCI: account for hidden devices in modify_bars()". Whatever the solution
> >> here, I think it wants to at least account for the extra need there.
> > Yes, sorry, I should take care of that.
> >
> >> Now it is quite clear that pcidevs_lock isn't going to help with avoiding
> >> the deadlock, as it's imo not an option at all to acquire that lock
> >> everywhere else you access ->vpci (or else the vpci lock itself would be
> >> pointless). But a per-domain auxiliary r/w lock may help: Other paths
> >> would acquire it in read mode, and here you'd acquire it in write mode (in
> >> the former case around the vpci lock, while in the latter case there may
> >> then not be any need to acquire the individual vpci locks at all). FTAOD:
> >> I haven't fully thought through all implications (and hence whether this is
> >> viable in the first place); I expect you will, documenting what you've
> >> found in the resulting patch description. Of course the double lock
> >> acquire/release would then likely want hiding in helper functions.
> > I've been also thinking about this, and whether it's really worth to
> > have a per-device lock rather than a per-domain one that protects all
> > vpci regions of the devices assigned to the domain.
> >
> > The OS is likely to serialize accesses to the PCI config space anyway,
> > and the only place I could see a benefit of having per-device locks is
> > in the handling of MSI-X tables, as the handling of the mask bit is
> > likely very performance sensitive, so adding a per-domain lock there
> > could be a bottleneck.
> >
> > We could alternatively do a per-domain rwlock for vpci and special case
> > the MSI-X area to also have a per-device specific lock. At which point
> > it becomes fairly similar to what you propose.
> I need a decision.
> Please.

I'm afraid that's up to you. I cannot assure that any of the proposed
options will actually be viable until someone attempts to implement
them. I wouldn't want to impose a solution to you because I cannot
guarantee it will work or result in better code than other options.

I think there are two options:

1. Set a lock ordering for double locking (based on the memory address
   of the lock for example).

2. Introduce a per-domain rwlock that protects all of the devices
   assigned to a domain.

Thanks, Roger.

