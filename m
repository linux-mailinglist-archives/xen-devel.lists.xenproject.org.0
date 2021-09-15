Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C0940C199
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 10:22:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187307.336118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQQAn-0007Eo-7T; Wed, 15 Sep 2021 08:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187307.336118; Wed, 15 Sep 2021 08:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQQAn-0007CN-4B; Wed, 15 Sep 2021 08:21:41 +0000
Received: by outflank-mailman (input) for mailman id 187307;
 Wed, 15 Sep 2021 08:21:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wWxD=OF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mQQAm-0007CH-2V
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 08:21:40 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 089bfe83-7ffe-4b35-afb4-701ecab992c0;
 Wed, 15 Sep 2021 08:21:39 +0000 (UTC)
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
X-Inumbo-ID: 089bfe83-7ffe-4b35-afb4-701ecab992c0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631694099;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=RH7xwGIdol7s79gGtxpS5ozKt+VBklOPd/I/V+y5fd0=;
  b=X6irJydKbZULHQaETjUTVaHzs/OBWiBqrjrhTM8CznoL9RbS0RQt28qT
   qTG5DFwSWXOUlE6y2GLQqgK/89HWBRr0vHA0/GQ+sCHeJcbEAsnT4oJAS
   5W2z00SQ9uAK/u3lX0J959O4sxxc7WDYCl3UWpvfisdRRxj6TIeiwRLxo
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: kSRl9OQFdxrrQfG2ta0ZSHY5zughj5udQSqXxHFWAF6Um5TH9nmjKFj2lP+ex5Ao7V/lha02V/
 xstB7ou/fJ55K1UI5eldUkrRhRqmpNaJWO2yke/vQWxb8PnjCBirbVfEACAfkHFdeN8dRQWnzx
 CDz9nW7QYKmIxzaoh5D3iNRUmhQM7c+8K7aEXh64xnss6P+T/gu96Gb60RQPgrzQ5kc/e2//iB
 amI2cVj5F5k2Q66SQdgez1vsqcTVkmfDG3hjKsav2tH2SaieJaMfPigdcCypRz0GakvSCLQR/v
 WDV/yJs4YVoNrT0ZPZdBnznG
X-SBRS: 5.1
X-MesageID: 52774695
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:9HxskqgyBTYcm42gslW486NtX161XhcKZh0ujC45NGQN5FlHY01je
 htvXz/TOfuOMGChKN8na4i+9RkPuMODzoIyTAA6/yFkH34b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0FU/NtTo5w7Rg2t8x3IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /11n82xSFd5OpHru84ZXDsHMz5lA/BZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t3J8RQaiPO
 qL1bxJvL0THYDlfPmtQI7A5xdexlETFXS1h/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 mDM8nn9AxoaHMeC0jfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKaliY2CttRQ70+1Cau4K7bwVm5GXM6EyEUPbTKq/QKqSwWO
 k6hxo2yXGE+7+LLEBpx5Z/P8mjjYnF9wXsqIHZeFFpbuYGLTJQb00qXJuuPBpJZmTEc9dvY+
 DmMsCF2rLEal8djO06TrA2f3m7ESnQkSGcICuTrsoCNtVgRiG2NPdXABb3nARBodtjxor6p5
 iRspiRmxLpSZaxhbQTUKAn3IF1M2xpjGGeN6bKIN8J6nwlBBlb5JdwAiN2ADB4xb67ohgMFk
 GeM4FgMtfe/zVOBbLNtYpLZNijZ5fG7TrzYugTvRoMWOPBZLVbflAk3PBL49z29wSAEzPBkU
 b/GIJnEMJrvIfk+pNZAb7xGiuFDK+FX7T67eK0XODz8jePFNSLKEOxcWLZMB8hghJ65TMzu2
 483H+OByglFUf24ZS/S8IUJKksNI2R9Dpfzw/G7vMbaSua/MG1+WfLX3507fIlpw/ZcmuvSp
 ynvUU5E0lvvw3bALFzSOHxkbbruW7d5rG46YnNwbQr5hSB7bNb99robers2YaIjqL5pw8lrQ
 qRXYM6HGPlOFGjKomxPcZnnoYV+Xx23ngbSbTG9aT0ycsc4FQzE89PpZCX18ywKAnblvMcyu
 eT4hAjaXYACV0JpC8OPMKCjyFa4vH48nuNuXhSXfokPKRu0qIUzcn7/lP46Jc0IOC7v/DrC2
 lbEGwocqMnMv5QxrIvDi5ebotr7COB5BEdbQTXWtO7kKSnA82O/6oZcS+LULyvFXWb59aj+N
 +VYy/bwbK8OkFpQ6tcuFr9qyeQ15sf1pq8cxQNhRS2ZY1OuA7JmA3+HwcgQ6fEdmu4H4VO7C
 hCV591XGbSVI8e0QlceKT0sYvmHyfxJyCLZ6u44IRmi6SJ6lFZdvZ6+4/VYZPRhEYZI
IronPort-HdrOrdr: A9a23:Jg93S6p3Yk0KIlJrURikTQMaV5vOL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBfhHPlOkPMs1NaZLXLbUQ6TQr2KgrGSpQEIdxeOlNK1tp
 0QDJSWaueAdGSS5PySiGLTc6dCsae6GciT9JvjJhxWPGZXgs9bnmJE4lHxKDwKeOAKP+tzKL
 Osou584xawc3Ueacq2QlEDQuj4vtXO0LbrewQPCRIL4BSHyWrA0s+2LzGomjMlFx9fy7Yr9m
 bI1yT/+6WYqvm+jjvRzXXa4Zh6kMbojvFDGMuPoM4ILSiEsHfjWK1RH5m5+BwlquCm71gn1P
 HKvhcbJsx2r0jce2mkyCGdrTXI4XIL0TvP2FWYiXzsrYjSXzQhEfdMgopfb1/w91cglMsU6t
 ME40up875sST/QliX04NbFEztwkFCvnHYkmekPy1RCTIolbqNLp4B3xjIbLH45JlO71GkbKp
 gsMCmFj8wmM29yLkqp8lWH+ebcH0jaRXy9Mw0/Us/86UkgoJk29Tpd+CSz9k1whq7VcKM0l9
 gsBJ4Y4I2mfvVmHJ6VO91xMvdfcla9OS4kEFjiaGgPR5t3c04klfbMkcAIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.85,294,1624334400"; 
   d="scan'208";a="52774695"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xsfg29d6nQijV227xIrtff5jRdj9mQ+u8w9kiMivZUVyHVzwWmP/oExKxxMBrZGbvv9cJLvHVTzsCSTZOUhRaXKiqszuaBQS3JuOnknaYGMwK5EZHlhkKBPrGytW8f1QcO6wjHUgkQAwiaNuJ62sJMWjcFAYwi2uE5nejZHjiZ0e+P2I1tE+WOF4B2Sld8qy0LfptwtCPAn6/uFlc8VihdRwlT6cuBD1f877cnMeF+rDabz4BKm11l/qMYQ6QsWkaTiQ4jmGOASxxK4DIk/T7UaJGnJZEU1t/ye3P+mTeGkbsyp2a+zZiconpj9JLrjf7cQqSsbq8YJa966SQotgfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=l1g5PWVzKl8h5wZ1rimfreosePf43AUvwJvgZD4ri1w=;
 b=TA993vvhtn1dq2PNMBYQwisuzLuBcDGh7OJMsGJVUZ5YC+JbczO11GysNXGpYh/HaOMf0Z5D7j/c8nnbSMuvpByZxkUiSkqc+JoY/rgwNxRVZqKQZ9iKpqX+rA50xeqEpsM7lDUjOT5pV0/1DK5SIqU2u9RzWWaDF1RB+6O6U4lU1FF3lkz89XhCThreUFnvwzgabCszhxNJ2xB5q2MWI7GdDztpjnsbULS6K0vsCgwH35jaZkWHLKKcOaYPorsHPsQCvPL4iYWqEiafXJOvJXRjsbm8tFFtjYAmltRstyA+uAzB378Qo8JrU/Mrx9mnwSjaFGq8MTO5Z5TCwqb39w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1g5PWVzKl8h5wZ1rimfreosePf43AUvwJvgZD4ri1w=;
 b=DE1L9J6RJKSe6VTzK6Cu9YMa1MyyWJvkD3omZhB3cb4OK2Z/aN8/E4lFmaEEus4z6TVEcdd2PBZv6rC4dnDi1cXwtf4j9P9PUZo3M6YHhBxrBG6oCGXNOmmMoZkCMeHrxNfi011n9On7p8YQWIRwds9tBRVP48ESvN3Jv+fHeYI=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86: quote section names when defining them in linker script
Date: Wed, 15 Sep 2021 10:21:23 +0200
Message-ID: <20210915082123.21795-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0447.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e36cd702-6cc6-4a32-4ff5-08d97821d1bf
X-MS-TrafficTypeDiagnostic: DM6PR03MB4539:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB453970FB39B5E62758338C7D8FDB9@DM6PR03MB4539.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y6SL6WtJU+VvNMN+5gIJQeK95rkFfg1vOc8LX5+J1y8oXtkiPnzpVC4NhH5KWxTYtKE0KTq4cY5Qm+mj2aNpdAs/vO2Ag/rLJpGUfPokFAWincZdHV1WLncLr8o/fQYSl/F40MUQJRly1h2aq6cg0ZSMlOwP2bNYPypVgvaZMQQe0J6nkK5LFw9nvQbtNFm7FwMXx/XeD1Ngsuf7WXpu3msGhbos68vB8XZRaHW9c/04vyFy/28sN+PSJnMoia51vrZz1MAhaCb/oDaz60fpqemiLkNBHIq9aYtGA0EEWfvmzMPWo8O6g33ARZrB+bPAKMJH9823yrv3l3sSjgA6TgZxMQKFfvdKhZIMoKeCLh6Yzzns28l9Tvt841MM0U6zuFWz/60o9bJVDqA7DxMNc1hxmuDsGCg0OeLzKM/3phzNPVb2DXrNhEfJ/YwJ2m4IzkhSO7EpbYsK19S4sw8MwYjfaZXwy/vZefj7LyupfJpF5/enRXApKg6BgoPk79WtS9oW5tGXBQtylMl2X/Cyv28xldLWVRrfn5rZC+a5DC9oywicycdC5XLvB4I7dzx41r9YwfyYbxOz6Ya3i+PvfpruPKxA1Mxa/mU8Ap5PyuQgMB89yVEUjkt3Jhs/BJ7MguIKz78ufn1vMzI/uabzuKq3dxVSw4bx2XntihVnC3+jo0ygVsLki3kuK+liv0uZdzY8Tr/Qmkj8+/ih3MkHeuX7DbPXhG9gQ9XzYmI3FLE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(83380400001)(2616005)(2906002)(478600001)(956004)(316002)(1076003)(54906003)(36756003)(8676002)(6486002)(4326008)(66946007)(38100700002)(6666004)(6496006)(186003)(66556008)(66476007)(26005)(5660300002)(966005)(6916009)(86362001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzExb241YWRzeTU1Q3JYbW9nUXB0WmRMUUhjTU5BNy9tU2VxU0dkZlF6b0ll?=
 =?utf-8?B?YWJOcFFUa1dZK083cm1LdHNEMDgzeFA1VFNRMW5IaURDOEtLOU1sMXFhQnFy?=
 =?utf-8?B?QmJkN1M4KytlVFp2OHRIS0hONjR2YkwyeDd2Vk1Xc2pLTUNRdmFGcUZHWmYw?=
 =?utf-8?B?QmplT1J2MWlDUDdlaTk0MGVOYVFiWVNEVjBCOGNTbWdsZHVWODg2cEdUc0Rn?=
 =?utf-8?B?aVpQSEtpK3lvV1U5Vm9RblVKUTI5ZjFhb1RrWEt5d0p6WnhLTnRJajdtYmFD?=
 =?utf-8?B?QmVTMUhYQnRmaW5ZcHhpVjJlQVRTcWpMQWlaYzh5SjJBSEFONXNDZ1pPS0Ur?=
 =?utf-8?B?ZFJjUGVXV1JEUXRsS2xrRHNaaks3d21HaG8zY1lGOCtOS2Jvb1laTDc4YUJp?=
 =?utf-8?B?UFdDQ1VzcFVSZDViWWVGQkJtc0w0WWNRZVBzZTBzbDNrYlVKYkdhTkpNcWVN?=
 =?utf-8?B?UjVKWEcwR0N1VzRsaGhkdzhLdklTUWs5VzBPRzZuSmttK0g0d2FZelNkeTdv?=
 =?utf-8?B?a0kwbDMxMWEvTzB0cnc0R3JIZS93SzlIY0lqTDJlSVh0WE1sbHFDYnhIR0Vz?=
 =?utf-8?B?UURiYndoYThJM3pNdUU5YUNtSVZXUzRwS2UzUllBSDhsQ0lUZWdtWFpTMlhU?=
 =?utf-8?B?ZWh1NmlVcEcvRkdDV2lINXdXTWgzd3RNQXpqY1IwdjQxczlKNzd0cHZyeEYz?=
 =?utf-8?B?d2pUTHJhaFd3UC81Ry9GV0ppVHVvYUtodFpjTjU2b085NXVML2thdFN2a014?=
 =?utf-8?B?Mk1TbjZRMXZPVHE4R0lsMTRsYmlXQ0ltODFTNHIwbGJuL0E0ZHpkSER5VWVC?=
 =?utf-8?B?NEJDNFlYeXdFMUFLUjVYOXRIWE5PTXBmR2l4SjZHNCtaZk5mS0lLaEdNbmVp?=
 =?utf-8?B?VjdYeE5wczA3NEpZSHNMSjVLWmtDTWd2Tjh1YnRid3F4UytlbTlCNUV5emoz?=
 =?utf-8?B?NTBaM1lQN0pPZklJck1MT3RZcnNKMUt3TVJtQzdVMHQ0RStERjhEZmtuVm0x?=
 =?utf-8?B?U2l6L3lsUWJJWHdScVo2VUNxZENDYWRxZDdPWlVJbmdVTlhlbnVFRkVkN1pr?=
 =?utf-8?B?aFRsUUUwbmV5VDhHYWRVZCtRR2NFVTEwM0VWQVcxd2U3bi82OTIyODE1bFM5?=
 =?utf-8?B?NzgzWkNBWlV0cEFpRFR1ZE4wWjhRa1d4RFVWVkF6ZXI3cHplSTVxRE11L0p3?=
 =?utf-8?B?ZUE4eERiNzRFbWF3dHRibTVDaTA2VVRvc1RTOHhQNU5GUlBuZXc0bEdEOE16?=
 =?utf-8?B?cmlMNksxQURGS2ZLZE9mU3c3ZUhCdnBtNlpycDJaL24rM0dyOGdaUW5rRndh?=
 =?utf-8?B?OW5vck1LOWtKSmJqanhIOWxnSjFUY3F3ay80S2ppOHI0OTRnb2JDb2hjaHlU?=
 =?utf-8?B?cWJtYlFOdW1OcjFCcCtVR0NXYWh3MlE2UEdjYVg2ODlLdGduZnNRclA1Nmtk?=
 =?utf-8?B?a21kZ21mSFk5WmU3dzhDWU9WTHZIOTY2dWxHR2lSU0xUQWJMOEVaT0R0dEtR?=
 =?utf-8?B?YmZVYllXUDllNkVwcS9iM0s0VjV2RHJ5eGs3c2VpczZQalZjZWU2ekhYVzBY?=
 =?utf-8?B?bWJ6Wll2OGZpTWcrMldtZ2xlUUNpTEdGa0RiMFRsSWxtdEpkcGtWbTR2SklB?=
 =?utf-8?B?STJzbTg4UWdkZnM3YTVoRENuTnJ5bzdwdyttN05qLyttV2d5ZmJ6R2lTb29O?=
 =?utf-8?B?ZFlnaitIVjNIZlBhcmdjOWJRQlEvZ2VBUDBqS3BuMC83QTZxUy9JdUlkTjQ3?=
 =?utf-8?Q?v4PH8j4JqMP/cUMSs2FOzxGMpftaKIgEXQIMMun?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e36cd702-6cc6-4a32-4ff5-08d97821d1bf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 08:21:29.9866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ojFPCZLhb+HBL/RavGFyxbEVL29PLRrSEr781eYkVh7AZo0EzEYE4K6rI65jNsuTYvUWFgG5TMHn2rInfLRaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4539
X-OriginatorOrg: citrix.com

LLVM ld seems to require section names to be quoted at both definition
and when referencing them for a match to happen, or else we get the
following errors:

ld: error: xen.lds:45: undefined section ".text"
ld: error: xen.lds:69: undefined section ".rodata"
ld: error: xen.lds:104: undefined section ".note.gnu.build-id"
[...]

The original fix for GNU ld 2.37 only quoted the section name when
referencing it in the ADDR function. Fix by also quoting the section
names when declaring them.

Fixes: 58ad654ebce7 ("x86: work around build issue with GNU ld 2.37")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
This seems to make all versions that we test in gitlab happy:
https://gitlab.com/xen-project/people/royger/xen/-/pipelines/370610794
Plus the FreeBSD Cirrus-CI:
https://cirrus-ci.com/build/6690836768358400

I'm slightly worried that LLVM ld requires quotes to be present always
in order to match, but I can confirm such quotes are not present in
the sections names in the output binary.
---
 xen/arch/x86/xen.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 955d5cf4a0..11b1da2154 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -18,7 +18,7 @@ ENTRY(efi_start)
 #else /* !EFI */
 
 #define FORMAT "elf64-x86-64"
-#define DECL_SECTION(x) x : AT(ADDR(#x) - __XEN_VIRT_START)
+#define DECL_SECTION(x) #x : AT(ADDR(#x) - __XEN_VIRT_START)
 
 ENTRY(start_pa)
 
-- 
2.33.0


