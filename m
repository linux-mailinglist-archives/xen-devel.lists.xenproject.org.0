Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2264B6614
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 09:30:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272828.467796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJtEH-00040B-F4; Tue, 15 Feb 2022 08:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272828.467796; Tue, 15 Feb 2022 08:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJtEH-0003xm-Bm; Tue, 15 Feb 2022 08:30:33 +0000
Received: by outflank-mailman (input) for mailman id 272828;
 Tue, 15 Feb 2022 08:30:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vySV=S6=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nJtEF-0003xg-V6
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 08:30:32 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87980c30-8e39-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 09:30:30 +0100 (CET)
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
X-Inumbo-ID: 87980c30-8e39-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644913829;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=tDllKgtO2htz+ZZHLYCR6A0+9x4NhEnUsKsvjNLx9go=;
  b=WOUzZC97fSA++qsCJgmMw+SRin0471dnGNTybUO2w2Tk8hO/v5BRWwMR
   sPPEvpbyPg7wuyYhTxybKCdh4mOJKr4bgw6sfflB006qpCedmv50QcT22
   TGERRU6G/rfFSuMJjiBdFkJFRRju8Syo73eS+6bnXpnih/wF6APoAg64J
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: JfIZVh2G5jJgY+68ig1bYOe/tOWHVYTQneVklUb6cZL7osaif+ZxT4JJrLsGFYUMM8TERaLrY/
 6s9ctO8TUsg2ypJDwekYZr3wMxbr/gj6wxvelsiHC3eO7RK7MHbwrml/ccYjczgRjkQMFWudap
 +LJOrf+2/CJNAW4ry+VcMY3r69kRHJ1NdE6DvyZaZuCibKWo2aau5G01nKVCtIeMWW7u4v/7ur
 qiXE1t59uoZG4jcwup3vpfw86KuucT+fMi2RsDfKvzMcHOmq4NCA7sZDMvai6GRb6lDogJUq32
 gCQkRvX0DuFSM3ETFqQFdpc5
X-SBRS: 5.1
X-MesageID: 64121692
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8bbmTa1CDG3V9vRRJfbD5dt3kn2cJEfYwER7XKvMYLTBsI5bp2MPx
 jBOUGmFbvveNjD2ft1/PoSzpxwEsJbcmIJnQABkpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o5wrNh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhusBjz
 9tGlaSJbB4JD5XqwvUTTAFFOnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6Diu4MBhm5u15om8fD2a
 s5HbzZ1aDr5eQx9Gmw9MJIUsd2FiSyqG9FfgA3M/vdmi4TJ9yRP17zqPMvQa8a9b8xflUaFp
 UrL5238RBodMbS37j6I8WmlgOPVqh/qQ4IZFLC+9flCjUWawyoYDxh+fXKhvfS8vWuvVNteJ
 lI89zInqO4580nDZsP0XwC85mWFuBEcc9NKFqsx7wTl4qDZ+RqDD24ICDtIcsU7tdQeTCYvk
 FSOmrvBBzZirbmUQnK17aqPoHW5Pi19BUgGaCwfRA0J+e7Kpo0pkwnPRdZuFq2yptDtEDS2y
 DePxAAuirNWgcMV2qGT+VHcnynqtpXPVhQy5AjcQiSi9AwRTJW+e4Wi5Fzf7PBBBIWUVF+Mu
 D4Dgcf2xOITCZCAkgSdTeNLG6umj8tpKxWF3wQpRcN4sW3wpTjzJui8/Q2SOm9MItQDdzTJW
 Hb2oCNg3LkJLXW1dbJeNtfZ59sR8YDsEtHsV/bxZ9VIY4RseALvwByCdXJ8zEi2zhFyzPhX1
 YOzNJ/1UC1EUfgPIC+eGr9FuYLH0BzS0o86qXrT6x28mYSTa3eOIVvuGAvfN7tphE9oTei8z
 jq+Cydo40gFOAEdSnOOmWL2EbztBSJlba0aU+QNKoa+zvNOQQnN8cP5z7I7YJBClK9IjOrO9
 XzVchYGlAag1S2adF3TMSoLhFbTsXFX9yxTAMDRFQzwhyhLjXiHsM/ziKfbjZF4rbc+nJaYv
 tEOetmaA+Qnd9g00291UHUJl6Q7LE7DrVvXZ0KNOWFjF7Y9F12h0oK1JWPHqXhRZhdbQONj+
 tVMICuAGsFdL+mjZe6LAM+SI6SZ5CNDxrsqBhGQfbG+uizEqeBXFsA4tdduS+kkIhTf3DqKk
 QGQBBYTv+7WpIEpttLOgMi5Q02BSoOSx2JWQDvW66iYLy7f8jbxyINMSr/QLzvcSHn16OOpY
 uAMl6PwN/gOnVBrtYtgEuk0kfJitoW3/7IKnB55GHjrbkiwDu8yKHexwsQS5LZGwaVUuFXqV
 xvXqMVaI7iAJOjsDEUVeFg+du2G2PxNwmvS4P05LV/U/ihy+LbbA0xeMwPV0H5WLadvMZNjy
 uAk4ZZE5wu6gxssE9CHkiELqDjcci1eC/0q78hIDpXqhwwnzkB5TabdUiKmsouSb9hsM1UxJ
 mPGjqT1mLkBlFHJdGA+FCaR0LMF14gOoh1D0HQLO0+NxojenvYy0RBcrWY3QwBSwkkV2u5/I
 DE2ZUh8JKHI9DZ0nslTGWurHlgZVhGe/0XwzXoPlXHYEBb0BjCccjVlNLbf5l0d/kJdYiNfr
 eORx2vSWDr3eN38g3kpUkl/pv2/FdF8+2UuQix88xhpy3XiXQfYvw==
IronPort-HdrOrdr: A9a23:kSfH9a1WODI2eLdjJh2bVgqjBVByeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YcT0EcMqyPMbEZt7eC3ODQKb9Jq7PmgcOVbKXlvg9QpGlRGt5dBmxCe2Cm+yNNNW177c1TLu
 vh2iMLnUvpRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIE/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF/nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSvmOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KOoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFqLA
 BXNrCc2B9qSyLbU5iA1VMfg+BEH05DUytue3Jy9PB8iFNt7TJEJ0hx/r1qop5PzuN5d3B+3Z
 W1Dk1frsA6ciYnV9MNOA4/e7rFNoXse2O7DIvAGyWvKEk4U0i92aIfpo9FoN2XRA==
X-IronPort-AV: E=Sophos;i="5.88,370,1635220800"; 
   d="scan'208";a="64121692"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqpfXmareJtaIOketMri8T5y3/h/EKv+3P9Z3UxO8OjQAXiZRzw4e+RdMA+WzvTq9tS3/+bXKW3xZ6/QHKcfzd0BzkGJkng9/pB9/occJmfqF/exS+VI4KHjWLaUsM5kBoB+Y6d/wnGr4/2tPKUX2OShTuwSABHPbfaoY9E5ltOPtTmmf3fm1UD8uOgPtneh6/fP9PAAqcrySGGIzyv4mB2JIVy76DO5Vjq5IiEVrWoEeiiNsNevklutQP3VVgtgPfwfZxgUseoaKcZD8mr7HQXguPN7Y3Yg/fxD6kNR8RKnnwAnpor2KA+S27eoyo8v7ucoNR1lEYWgTho+VocURg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDllKgtO2htz+ZZHLYCR6A0+9x4NhEnUsKsvjNLx9go=;
 b=CWAlmNA5BR2EjgReYeNyB6FbSprY7BQDpGcl7nVpaZSk0oc0jaZL+dgFQknTi4pkmJyufiaBdZd6m7Fc/86EwUQjaXmrm+dYqtUbSh9EBn0HzsyI3vop2TCfGDzAfvqVhjseBb9sb8+0RJdl5hOoqPDUoJ7IpmSFCR905q5op+TOWYgXfVfvlA946hwglpTw84O1ibZBXRZnQjkJHBXwLm9UsNsnvsZk2dP8I7AuV/gNK/GAgpmROJVj3kXcRbwR8nWnt4FB2rlSlazYPnm2wcD8Pndvhp1y3MPNPrBX5ApmIiEJ6O5y92+1fFgW5OVr7E7rUe4bs1vsuum5e/GEiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDllKgtO2htz+ZZHLYCR6A0+9x4NhEnUsKsvjNLx9go=;
 b=Gc2q5VeWE++X3qHgCX0P15isIWmupe43qbqcTfnY57M3rl/0Xs/cFR0pCKraaVDBvlCj4H9t+V44mr4XJNDW3KIjdYCGjoeyhuLM8MSgQZY1pdjgYPejwE2grtIJcmwxKT/Dbx42CS/Qvn/sDiRATsNivy1IHqYUHAhWUObM+A4=
Date: Tue, 15 Feb 2022 09:30:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>
Subject: Re: [PATCH] vpci: introduce per-domain lock to protect vpci structure
Message-ID: <YgtkkAoYZ3MZsygD@Air-de-Roger>
References: <Ygo40L4dMPJjZKRF@Air-de-Roger>
 <746860aa-c403-1eca-0a75-587c5d10c8c2@epam.com>
 <Ygo8M3Y6BLzljn15@Air-de-Roger>
 <114b8578-ee13-b67d-e282-d060187ef509@epam.com>
 <06baf0c8-d7d2-50b8-ea8f-1d422ceac728@suse.com>
 <6ccc7add-c13e-555f-b341-ce37118746e5@epam.com>
 <f0e202dd-1f6e-4aac-1381-a64a7fd12270@suse.com>
 <ba901778-ce63-12f2-0a54-d56998090200@epam.com>
 <3538350c-0a63-59fb-7bba-fe460c0f1607@suse.com>
 <2a750ae8-9ca7-2e74-b878-11b98fcb4ca0@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2a750ae8-9ca7-2e74-b878-11b98fcb4ca0@epam.com>
X-ClientProxiedBy: MR2P264CA0087.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7273e851-974a-4bfa-f9a3-08d9f05d637e
X-MS-TrafficTypeDiagnostic: MWHPR03MB3086:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB30860A52777E6076DBE6CFBC8F349@MWHPR03MB3086.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: igkuHcnu7PbpjaLj14PfakIxbpX35U1kcRmlbMPd/UakmA/Au7AIXyQdTHMQ22xvML3oKFqqmZCK1mOJdas1uozO+d0sMt+SatbwZL/A7vuQDNJNlL+LS3a+lrXxpKO0ZGi2uxnnOOyS/HNuuspE+OGwJAbkf02weoJ/PmpMnIPT83CnzcPAK9wIZJ0s3cX7Zr2YvUkbC4I6BUGJZeoLOT5OLaSL6MOR8ep0Ulrc9gmXoYWcKZ9XHP8MD5a4qOKOGfXW3EbZyB0ilr/XBfALJt+XxBTgAdBec+mrTYKR+osKypVUEkA214K09qxqYFRhxEj+zTGJw/QKm4ldPJH1lsC1NRewTAYUA/o2XqKEKmzv4ovySM7Sk/CkNNwrPalQv+1Phnn8ejzt54veoXgGzcm5JpE35mwjbGl+evXDz+0ABnnwT2VI3F3sauOchI/F3kAF0b8w/a8V4OE2+3wJj45tr5Vp/9jFQB+6s31aCZ7XEgCF0iXq5+ReVRtNCECoGNfVdKlUeqr7MeYoKl9tkmC7mpYzph5kYmkZvMTT7VYtYie1JSyUUxp+kh/YANScYqeCmYBE/QmRZiY4ypM146qD/OLh/m4Gpl/4m4lnAxhRfsoqkfjFmT4d4wXPk6g4PSbsxeUdshNdn1rEJP3Lvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6916009)(186003)(508600001)(26005)(6506007)(6512007)(9686003)(83380400001)(85182001)(54906003)(33716001)(4326008)(2906002)(82960400001)(38100700002)(6666004)(316002)(66476007)(5660300002)(86362001)(7416002)(66946007)(66556008)(8676002)(6486002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVU0ckxGYVdhMHBnZHZyNSt3QXJQN05DKy8yNk5CVDRVSWVyR3hyYnljektx?=
 =?utf-8?B?U3I0T0lLMG1HN2RRQ0U4cmY2NzJEempnVmpoaktOY0o1WHhRNk5FL000U3c4?=
 =?utf-8?B?YVdBZzhLeDRJK2RaUlJzeDFIL3JNRTlHZGIrQjNjbTdRR09PLzEvR2ZBSzBa?=
 =?utf-8?B?NkpjMlp4L1NkK295WTZ5bDVTL0ZIeEM3SjdwYVJ5ZGJxYktCRFRoSkxWT1hZ?=
 =?utf-8?B?L3NSd0NXQU11anhEZkVMYTYzY0NsWkdYN2oyNmY1cU5Pd1Q1eW1CbnNzQkZ6?=
 =?utf-8?B?eklya2xPQVdIY2x4T1VnVzRUYWRsV3ZtYjhQeHJKL1ZVVFdJN1VYL0VHeCtY?=
 =?utf-8?B?YzF3alpwa29XR3hBZFhRL3huRVVhaUh3WlowdG5aMHN1Q1ZXaGtBMENaamZr?=
 =?utf-8?B?K1RRakk4S2lMUjdJcXR3WTdybE1VdHg5WFNoMEZGQ3NGaWtUdWs1M3lhTEpT?=
 =?utf-8?B?cTBWeG1NRmtoeXh3QXg1cVNoNmpsaGNzY3lGU2NKcjBOWTY1U2FsaVpNVnVm?=
 =?utf-8?B?T09rQU9iYW4xbkRZaXFuYnpiNk9zaU41VysxYTl0Uk12TDZuRkhiRzduOG93?=
 =?utf-8?B?YmpJR3oxaXZ5MHlnV3ArQ1lYbk9OcnNqS2lnOU83d2t3Uzl5ZUEwbVF0QlpU?=
 =?utf-8?B?ekxtUzM2dGR2N3p2SU9EK0pWZzZQY2ZsZ0VjYzFiRzc1dUVtRm1iUTB5UWVE?=
 =?utf-8?B?R08zUC9IWGZmRFBZS3NiQjRjMWtaN0FFMGYxN1NFUGl0SVR2TUV3VmtHbkM3?=
 =?utf-8?B?ZUNha1d5RHdyVnZQb3JnZ3ZvSzQvZ293QkVOV0NCT1VvOUxvNnZmWkRPcXZ2?=
 =?utf-8?B?WENhMUgrSjdXZzlYZlRSSytvdkhCejBiNGg0M2NuOW9xRTVQVlJpNHJwMytR?=
 =?utf-8?B?bzdrTk9CaEw1aE8zdkdKN3dkOGUyZTV1RWwvK2xSTXZpdEhhT0NUcWd2SE1m?=
 =?utf-8?B?cFY3dXVlbnlvY3A1cWVuUW1JUVFDSytuNXNla0xxN2ZwNElsRDFIL0VnTnRO?=
 =?utf-8?B?TWNSZ2pnQTQ4eDcvc2pPYkhJT1RDNXhwd1pGeVhTcFJnKytDTkJqTGNyMG0r?=
 =?utf-8?B?ZHVybGg4b1dUbE9HY3pJVTBGenFPZnIwV1pnMVVIMDRZc0pwK09nbHVoRjZY?=
 =?utf-8?B?c3BOMzcrcUd0SW1hYkhJQ2R1Z0JFSVR0L2xweHpuKys0Q3gybWhOejRyTE5T?=
 =?utf-8?B?RUlhNElibEZ3V0h5R2ZVcG5yTlRZODlOV05WUXdUekN6RUZLN1pCM0tLcGxq?=
 =?utf-8?B?RzRWZnB0WWJnU05EdndxbnFNVjJPWWQ4RFJuQkJsUzA5WXJYeXYvc1QwVG5C?=
 =?utf-8?B?MlR3cGdVeHVld3EzUEgxakVSRkk4QTY2RGg3KzZsQk5wbW5BWGdnNXRNdTZ0?=
 =?utf-8?B?RkxQQVFnekdFaU16eUpGQVNtOU5BU3hXT3R4YnM1WWI1UGtwQ29JS0Y0SG11?=
 =?utf-8?B?a2dTOTBVNUNCT1pyUkEweXJjeVJJWm5SSDdqODhwWm9rZktJVEJLaXQwejl1?=
 =?utf-8?B?b0hOc2lYMGN1QWhnaGppNlhoUHNXbXVsb0tFZFMxdkNIa0RDYWhVNDRRbnRR?=
 =?utf-8?B?ZDJ2WTRIT0F3ekFLVmMxNjI1RVhtTzl4UGd2Smc2UTV4WGdsUUp1UUo4WVpU?=
 =?utf-8?B?bDZEYTV5UGVnc1ppU1BmNDREb1dBYXVpeEdXcE9BQm52UHZ2NXBFcTJwNVRD?=
 =?utf-8?B?U2lJYVR1bHVFSDRVNEFWeE1oakNaaTVTWEZWM2JqYnNpN3Z0WHVMbVIvMWM5?=
 =?utf-8?B?NS92WlpLMjhwdkVWbFFXbXdheHkzSjJkbThqYjZWRTRXNkVONDhDQjdRRU9Y?=
 =?utf-8?B?YWpweDVXaU80UGhwdVgzV3VyYm9qZUlLV0pqczZLVldPbFJHWjZVOVA3emsx?=
 =?utf-8?B?MjE2aS9ocmJZZGdUMzltV2lzNll0TlQ5Q3ljaVl3Slh6S1c1V2lIK3VWWGJF?=
 =?utf-8?B?K0ZRbVFFTXpLckZqUHBNNVFuKy83VGxWeGk3M08xeGpnNGRPZnpzeENON2hV?=
 =?utf-8?B?a0Fkb2UvbExnVnBpaGVBaWpXdDQyd3o3Y0R0ckwrS1d2M3lBb2JTRmlLWGQ3?=
 =?utf-8?B?cHRUVkJyVWttWUNnTGlQL1RiQjk3cmxDZ0Q5Q3NZL0RXVmlKeXBuNjZVYjhI?=
 =?utf-8?B?VjJMblNreEkrUkgrdkNkeTFPcWx2RVlubEl5aWRQSW80dGx2TGZWU2tsL3cw?=
 =?utf-8?Q?VPmEsPdCAIXfDyd19DfAnOU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7273e851-974a-4bfa-f9a3-08d9f05d637e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 08:30:14.4807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CH+kmumB26JD+47pkUgL7UY0CHX/6aUoHLfPQSlLGMl9dGS3oKFia/NZVBc6wVdIW5YlIuqpHDgYnl6AAC5rPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3086
X-OriginatorOrg: citrix.com

On Mon, Feb 14, 2022 at 02:00:26PM +0000, Oleksandr Andrushchenko wrote:
> /*
> * FIXME: apply_map is called from dom0 specific init code when
> * system_state < SYS_STATE_active, so there is no race condition
> * possible between this code and vpci_process_pending. So, neither
> * vpci_process_pending may try to acquire the lock in read mode and
> * also destroy pdev->vpci in its error path nor pdev may be disposed yet.
> * This means that it is not required to check if the relevant pdev
> * still exists after re-acquiring the lock.

I'm not sure why you need to mention vpci_process_pending here:
apply_map and defer_map are mutually exclusive, so given the current
code it's impossible to get in a situation where apply_map is called
while there's pending work on the vCPU (ie: v->vpci.mem != NULL).

Also there's no need for a FIXME tag: the current approach doesn't
require any fixes unless we start using apply_map in a different
context.

Hence I think the comment should be along the lines of:

/*
 * It's safe to drop and reacquire the lock in this context without
 * risking pdev disappearing because devices cannot be removed until the
 * initial domain has been started.
 */

Thanks, Roger.

