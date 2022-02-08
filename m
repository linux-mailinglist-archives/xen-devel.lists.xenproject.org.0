Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC644ADA1D
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 14:39:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268336.462141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHQhu-0006XP-Db; Tue, 08 Feb 2022 13:38:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268336.462141; Tue, 08 Feb 2022 13:38:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHQhu-0006VH-AS; Tue, 08 Feb 2022 13:38:58 +0000
Received: by outflank-mailman (input) for mailman id 268336;
 Tue, 08 Feb 2022 13:38:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GmUj=SX=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nHQhs-0006VB-Sf
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 13:38:56 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 750fdc00-88e4-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 14:38:55 +0100 (CET)
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
X-Inumbo-ID: 750fdc00-88e4-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644327535;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=BlNxdStduyd1Jk+OXHvoG/zMyC3keL19g/Retcq96xM=;
  b=G3+mndhZDkOQxtrf8FZhpzuAQyv77g0zDA3nyKyfeBv6WJMdaVnnv9oH
   mxQUIedSSE05787NvOHDGguufjPFRmpOy/5nN6wJhzKOgWPRvU27QcwN9
   Qxp1y+evcfV3x5cP8qm9QQIcwsKMJUde3ver+HzUtGk1WsAEeKp0+c33c
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZcvmdNvItn8WS3dvwscPkMMlaCZaz2xOdAQo38F5mGcTeR+hE72Yi7irtrAGTuPoGax1PUxPKb
 xZNzZoWEaXProAKGX961NfpJZpDyuubyHr0ybZjrR7vxJCTLcOUu75tnIOQmAyjVfUr+SKBMOr
 2WNVL+av/2zIpzgNzWYd1P+cDDqLS8A/cexSUzgA8B0xGYFxYJWBQJ+h+kpcm9JbwEpCW0YheW
 OcVDWRZEmAHBu8p+AboJL690IfO++/2uBQ7sToEogPYYc4eaEtCkm798aYjcfjYM7CXLtDYH6w
 8QbTyRpAGJpVlLscrVZ5mZD6
X-SBRS: 5.1
X-MesageID: 65944919
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rF0nQ6LEMOVulcpIFE+R8ZMlxSXFcZb7ZxGr2PjKsXjdYENS1zFVn
 zEXCmzQPayKNjanct9+Od/j9hxT6MTVm9dlQQdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Ug7y7Zg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2Gn89fx
 /AU7aWgREAYEPXP38ocQ15XRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2UuI4EgGZp16iiG97Eb
 Og5QztoQi/jQCxhGk0PCpU+jeS30yyXnzpw9wvO+PtfD3Lo5BR4zbzFINfTPNuQSq19t1yEq
 2fx2nX2CxAXKvSS0TOAtHmrg4fnly7hRJgbErH+8/dwmUCS3UQaEhhQXly+ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c8BZE/A+rhqMzKXUyw+DAy4PSTspQOIhsMg6VDk7z
 GijltniBSFsmLCNQHfb/bCRxRuwMyUIKW4JZQcfUBAIpdLkpekbqRbCTc1qFqKvufTzFSvt2
 DCBrCU4hLI7gNYC0uOw+lWvqzCxopnESCYl6wORWXiqhiteYIOmfIWu5ULs0edbLI2ZQ1+Cu
 1AJg8GbqusJCPmljzeRSe8AGLWo4fetMzDGh1NrWZ47+FyQF2WLJN4KpmskfQEwb5hCKWSBj
 FLvVR15659MEnSPNPdOc4/2Oupyzu/OFMSiWaWBBjZRWaRZeAiC9SBoQEef2WHxjUQh+Z0C1
 YenndWEVihDV/k+pNaib6JEiOJwmHhirY/Gbc2jl3yaPayiiGl5oFvvGH+HdagH4ayNu205G
 P4PZpLRm32zvAATCxQ7ELL/z3hXdxDX5ris8qS7k9JvxSI8SQkc5wf5m+9JRmCct/09eh301
 n+8QFRE71H0mGfKLw6HAlg6Nu+zBMcm9CxqZ3V3VbpN55TESdz+hJrzirNtJeV3nACd5aIco
 wY5lzWoXa0UF2WvF8U1Zpjhto1yHClHdirVVxdJlAMXJsY6LySQo4eMVlK2qEEmU3rm3eNj8
 ubI/l6KHvIrGV84ZO6IM63H8r9ElSVE8A6EdxCTeYc7lYSF2NUCFhEdeddte55VckiYlmLBv
 +tUaD9BzdTwT0YO2IChrYiPrpuzEvs4GUxfHmLB6q2xOzWc9W2mqbKsms7TFdwEfG+rqqike
 8tPyPTwbK8OkFpQ6tIuGLd316MuodDoouYCnAhjGXzKaXWtC69hfSbajZUe6PUVy+8LoxayV
 2KO5sJeZeeDNvT6HQNDPwEidOmCi60Zw2GA8fQvLUzmzyZr577bA15KNhyBhXUFfrt4OY8o2
 8k7v8sS51DtgxYmKI/e3CtV636NPjoLVKB+7sMWB4riiwwKzFBeYMODVn+qsc/XM9gVaxskO
 D6ZgqbGlo9w/EuafiphD2XJ0MpcmY8K5EJAwmgdKgnbgdHCnPI2gkFcqGxlUgRPwxxb+OtvI
 Ww3ZVZtLKCD8jo01shOW2egR1NICBGDoxGjzlIIkCvSTlWyV3yLJ2o4YL7f8Ecc+mNaXz5a4
 LDHlzq1DWe0JJn8jnkoREpoi/3/VtggpATNlfeuE9mBA5RnMyHuhbWjZDZQphbqaS/raJYre
 QW+ED5MVJDG
IronPort-HdrOrdr: A9a23:AysADqvSdx8Llp+MU+9wjEpJ7skC7IMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK7yXdQ2/htAV7EZnibhILIFvAZ0WKG+Vzd8kLFh4tgPM
 tbAsxD4ZjLfCdHZKXBkXmF+rQbsaG6GcmT7I+0pRodLnAJV0gj1XYDNu/yKDwGeOAsP+tBKH
 Pz3Lshm9L2Ek5nEPhTS0N1FdTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJqpmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87isIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNXsHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa13ackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmP29yV0qp/VWH/ebcHEjaRny9Mw0/U42uondrdUlCvgslLJd1pAZFyHo/I6M0kd
 gsfJ4Y042mdfVmH56VMt1xNvdfOla9Mi4kD1jiVGgPNJt3c04l+KSHq4nc2omRCeg1Jd0J6d
 L8bG8=
X-IronPort-AV: E=Sophos;i="5.88,352,1635220800"; 
   d="scan'208";a="65944919"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0e3nBd2PKXPrIsXxh4TKxpi8nN5JnK4cQNkE4wGXi5TKSKJnnWNOAqca9cPA/sn0IvZDqRw5QJLQDq1tHXq8OxQ3g+6ERU/3kA7FAL4utNe15WhqFM04Q3dBwgOfgCK5z660Rad32u6y7qF7sY/XsEaqcfM5/VIEziUu3FAN8vORbOQCphH3L29srvETXvm0SxI1XIduWxWv4pbdC3XIAgC3BnKIpNfePqFBgBNRMgl+T1TDK9KQR/bFx5WsCiETY1DFsEtStXuGePnMyX3doioagXCEFGwwKZYnyxxBL2ZV3nwSudT8kU8o6ye7NwLVbJvAN8RdPindsPm2L5c2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MXIVqAJvO8QmSJQwwKXoLxAPzz8IG3cA/GAg6WI+9jA=;
 b=oNHck7LcZnwQYDTiuguejl8ZdhWZ5iX/W8UuZ2sA69kE+cPobk1MlJpwHQnfoJvaaqyScb2LEPWtMjCmuLp+5y+ty53I9Ct9V7+Tcr8I0EieR1J/m522Vtw6hYIT69eb8VouFopzpMVCX0fd7a5Lp1RsEqg4FcYLoouUrDwdD7oesXp/1WQjvbEygqrDfsAJrj272Zp5tofvfC5z2OsZuxEADmxwDAgekPIdNYtFFR1pHbxkntPb1E8K6D1i4ZThL0XYyS8BV4N+a34I+5BtLqh8/wFT5WfEoO8wVPtEbDVbRILlYH0hLPtaSXp204WBTovbr1Es0ha3OOl+odBwvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXIVqAJvO8QmSJQwwKXoLxAPzz8IG3cA/GAg6WI+9jA=;
 b=DwfBDYkO0C22ZRi1p7g6RAyvaSuCxm1BK/UbT26pMBjvWc1iQcRATExP1b7eyounsp3y0B8AuvDtFsb7+UE0280jyYV7hzD7Ant4XY0IzRWQHNnuBxEes49qbGivedSBN7X9DURgMSAr52TWl2Rnjzd644h/2YU9GcRkjR75MX4=
Date: Tue, 8 Feb 2022 14:38:42 +0100
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
Message-ID: <YgJyYkrEGVduPVLg@Air-de-Roger>
References: <e8fc7872-c7d0-f389-c507-335b809ffcbc@epam.com>
 <21c8125a-2f79-1a4a-494c-db9e4be2a1a6@suse.com>
 <4276fe72-558b-7d95-6430-d4330989dbe8@epam.com>
 <ad985f4a-10f0-4a2d-df02-cde915fea3f1@suse.com>
 <f7669670-8eeb-9966-5ba3-e8f9c03ce3d3@epam.com>
 <73e08285-6bb1-5842-899f-bd6502406e49@suse.com>
 <be3f4222-6580-4c89-a202-c003b6feb9b4@epam.com>
 <e91965c5-0802-adf8-0c17-522f86ebf231@epam.com>
 <YgJK2zPszyTXGxMM@Air-de-Roger>
 <0f83fa71-c252-6e6c-47c9-3ef899b45901@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f83fa71-c252-6e6c-47c9-3ef899b45901@epam.com>
X-ClientProxiedBy: LO4P123CA0519.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d224da6a-e154-4ca9-05be-08d9eb085603
X-MS-TrafficTypeDiagnostic: SN6PR03MB4061:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB4061F1145B44AC9E14C2D2358F2D9@SN6PR03MB4061.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JjME+lZVJ4+wfNcM/tZF8bDmWiy2RWEF+w41fg1TGsn0sUytZKhzplK2lqTm/p031sAgHGXXDCMSJDDPP6v9TT1UsosXYjIiy5JRCTYUhqDZkeRcghPP9fDfFb6rm/JlLrgDIG/32j+QLZKF1oS5bj/hm68SRm5XMKZ5J6o6u3gxrWvRMOydAO4HNqXFNG7BpFpfW87aLKRONTOZsNEtj2bmg5oF3hGg3DxPNoKTo6I5ZBdeI7CIRrbkrGO2VjF6OtzaqdMzDDU6vsBcLjvBd2169zjr+R4ntvcXqEBVoWNd8Lg0U8n2104eRSwWJ3aXYPzhhcr3WRjJHvLFMl5uH3AejhcFTKWFktk8oOtdgUC1W9+0xwWO/hg/ZSLtGNP37hiiQ6swFccvlc5t4p/ErjtSIR/uEowJU1e63B+G1R90MMb75R+7/uyQsHhq5wMxAR2pWG62ZZtzdzXwJaxr6D3BDI8jpLl8SunV/12oI7+72EHoGO8tECPlDZ8ksY5ASKHoM/QEcx7MbSIqpfmv+wqJF7iqxkAQPr2QZCY+bQB8TuQPS+KeAonKP90KRVoqWRR5IVRlmWG+VtSqQ7TC1PCpUQmE1B5jC4wE6/Yf4U81I9LxO722RMSXC3/l05Oe4LHjapZpUJvkoVOgRdRobA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(54906003)(6916009)(7416002)(6486002)(2906002)(86362001)(66476007)(508600001)(316002)(8676002)(5660300002)(4326008)(66556008)(33716001)(8936002)(6506007)(66946007)(38100700002)(82960400001)(9686003)(53546011)(26005)(186003)(6512007)(6666004)(85182001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFN6dkRhWVJvbmd5b1NNWDFpVHVCWW9UbVc4eTBpYVRmMmk2c0dPZ3FHTlJ1?=
 =?utf-8?B?NHZlUkE2YmdEZGFubkwvckFMZWdmR2JDWlVhaVpmTzVhempIOEdvSmlBUUZC?=
 =?utf-8?B?bE42TkpQVHQwNWMvSkV1VitvdmVEUkJMcHVlbkh1QzNGZlo2M0F2aVZJOE5G?=
 =?utf-8?B?MysyVkJYQ1dXV1k4V2xrZ1hPMkxXekpaZmUxdW5FeVBKODhXblZUWkY4cjE2?=
 =?utf-8?B?RERxOHNGZnYyVGxZOWs2dTlTSDNZOFE3TVYxOERYVmVrbjFac3NSNHMyTCtn?=
 =?utf-8?B?ZWdQV0h1TUtXSitHUmd2a1hNbnl5QWJUWHA2YlJkTjdDZzZVK2hzZEJTbEg1?=
 =?utf-8?B?dm5jeHBmR1pyNk1icE5PY0hmYXdGQk9Semp6MzZTNWk1SjNqVzR1V2NmNVZB?=
 =?utf-8?B?a1VINTNISmxheUd1RkY1WjNjMGRONllRRW9zU0dZUm1tTHVhU0k4N0JacldI?=
 =?utf-8?B?blczRy9oR1ZOOG5zS1FqYlYzc3BFTTZOd204dEFCSVh2bWZkRW45NUs0OFFX?=
 =?utf-8?B?WUNWWmp4aXp1bWFmTkg4RzYza1Z2blhGcy9yb1BReFZJMzRoWWpQdTJNaTN1?=
 =?utf-8?B?YU1oVjRjcmNVR0tsZ0RZQm1FZEdOT1VjK3pxZ0VQd2JmcVY2NnNIaDBTZ0Fq?=
 =?utf-8?B?RGZvVDZmRVpsNjhqbEVTclhmVHRGby9hT0VmZi9Dclc2ckFFdVVBOERDcjBG?=
 =?utf-8?B?UTJWVFFkRml1dmlHZkxIMWhWdHdZdHlJVXhjUnY4emRQbm5GWi9tYXJkSmFU?=
 =?utf-8?B?WWxWdUZRK25ZampwL2RrR2pwcDR2UE43OVF0RldyTnVacnlwbFFySzdZRmhO?=
 =?utf-8?B?OVMyVzNkLzdDVld2QndvNndYRHRSMUR0eTlETWQ3ZjBNOTlMMnNjblRSaGgx?=
 =?utf-8?B?UmFRc0dKbmF5RjVZM1JMdTU1aTREQm5aY0NuTDFCOFN1U2JzWkY2Vndqd0E4?=
 =?utf-8?B?ckhQWlFhbXBJRVh4ckRUOU1EeFNGd0tjWExSQ25vdThCN0NrSWQxamhiek11?=
 =?utf-8?B?MDFVd2oyei8wdGp4VnZ4NVd5dkFXbzJ1ajg2OVN4QlZUT1AwSFpuTnhPUG1y?=
 =?utf-8?B?emx0MTR0MXI4NzdxVndzMTZMUzBtRnhVeWQxZlhJTnMwdm1aVi9EOFBLOEta?=
 =?utf-8?B?Y1UwT2VxYXltM1ZxS1g1bCtBczFkVGhrZTdGQlUzZFFzd2pBNDkzcWgvcU1z?=
 =?utf-8?B?RmhjK0N3aUNFVlRJVWxIcUZmcHovRUtla3pBQUVyVmN3dTJMS0dsYTlwWTRO?=
 =?utf-8?B?ZkVEOXJpdFZaOE9pNWVmZXVjeWxoOWxFR2REWUoyUjVDQzZXRlpkY2V6VVcv?=
 =?utf-8?B?c0hKNFMzTHVwcDRRUWp3dDgyLzZENVVSM285UUxHL295QlFBYmN6NTNrSisv?=
 =?utf-8?B?c1U4UGlPZHBZM2k5Z2RJM0hDajBUSG5rMy82Ymx5RTFpRmFRaWZFNWUxZC9K?=
 =?utf-8?B?UWkxNzJWM0Vnb3NyVHFnbk1xbkIrTTNVejVETzJvRkhsK0pYOU9GQW9GOW1m?=
 =?utf-8?B?eCs3a1VJZGxxZHJFbDN1cHZleGJvNnErSkhlbTc3YWt0VG9CY09UL0VkMEth?=
 =?utf-8?B?N2JkWU9ZZEhvNVB5R0pBdlpwV21ZV1dnUVZiS2k5eDJDVXBqV3AwOVV3RnR0?=
 =?utf-8?B?d0hJNTBCVTFkdFZrVUNySTlJUmRMMnlybTRnS21sWVBTa1RCdzZQQmtPcldx?=
 =?utf-8?B?UEdGTlNTblNsN21aRmlaWlpSeEpKZnJ1SndENWhGbkZOa2IySHZKZGhKRGtR?=
 =?utf-8?B?c09jMGVzSTgyOTgrMmFuWXlrZ3k4ZjJzbWVVbEhBWTROR2YyRFNIaDQ0Q2FR?=
 =?utf-8?B?NXV1NldFNFl2YjFPU3FNN0xETTY4bi9kdmFMcFdlOWNIcmJWdUZLVENPSWE0?=
 =?utf-8?B?cVZ1SXZncE02YWIyLyt1ajdPWHg3ek5KaEdjM1dkNkZHSk5XcWdpVDY1S0o3?=
 =?utf-8?B?cnpEMlVHZG42NzJZMGRTWVg0OFNWbFJiblppQVl5RzBEdUg2aTh6dCtMNmR2?=
 =?utf-8?B?aDQ0bXFGZ1RubDNQcExhelBDUGtqQnlLQ0FxQ09qSzV3QlhOeWZXZ3pMQXRv?=
 =?utf-8?B?NStmeDZadjhra1E4bzIyaTZuSHc2ekZGUDU4bGVqSDVBMFJranFFY2paZEtz?=
 =?utf-8?B?djhIVk0xeWFhSWpodU9RamFTSE9jcHcwZHVJSFMxY0dIZjdvSTlHVEFmMDRp?=
 =?utf-8?Q?8WbidepaDQIHoAVk13agKkc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d224da6a-e154-4ca9-05be-08d9eb085603
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 13:38:48.8689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4QmsmLMlbtzkRahQHoRTmeGuQXQYTZofNAdxFQnXY2O+Cde9CZ8BVp2EKcaw/3gFBo5LuKl8+ekbu+1GYxGLJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4061
X-OriginatorOrg: citrix.com

On Tue, Feb 08, 2022 at 11:13:41AM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 08.02.22 12:50, Roger Pau Monné wrote:
> > On Tue, Feb 08, 2022 at 07:35:34AM +0000, Oleksandr Andrushchenko wrote:
> >> 5. You name it
> >> ==============================================================
> >>
> >>   From all the above I would recommend we go with option 2 which seems to reliably
> >> solve ABBA and does not bring cons of the other approaches.
> > 6. per-domain rwlock + per-device vpci lock
> >
> > Introduce vpci_header_write_lock(start, {end, size}) helper: return
> > whether a range requires the per-domain lock in write mode. This will
> > only return true if the range overlaps with the BAR ROM or the command
> > register.
> >
> > In vpci_{read,write}:
> >
> > if ( vpci_header_write_lock(...) )
> >      /* Gain exclusive access to all of the domain pdevs vpci. */
> >      write_lock(d->vpci);
> > else
> > {
> >      read_lock(d->vpci);
> >      spin_lock(vpci->lock);
> > }
> > ...
> >
> > The vpci assign/deassign functions would need to be modified to write
> > lock the per-domain rwlock. The MSI-X table MMIO handler will also
> > need to read lock the per domain vpci lock.
> Ok, so it seems you are in favor of this implementation and I have
> no objection as well. The only limitation we should be aware of is
> that once a path has acquired the read lock it is not possible to do
> any write path operations in there.
> vpci_process_pending will acquire write lock though as it can
> lead to vpci_remove_device on its error path.
> 
> So, I am going to implement pdev->vpci->lock + d->vpci_lock

I think it's the less uncertain option.

As said, if you want to investigate whether you can successfully move
the checking into vpci_process_pending that would also be fine with
me, but I cannot assert it's going to be successful. OTOH I think the
per-domain rwlock + per-device spinlock seems quite likely to solve
our issues.

Thanks, Roger.

