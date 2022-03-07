Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1684D0381
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 16:56:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286207.485627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRFie-0003Cm-1K; Mon, 07 Mar 2022 15:56:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286207.485627; Mon, 07 Mar 2022 15:56:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRFid-00039E-Tk; Mon, 07 Mar 2022 15:56:19 +0000
Received: by outflank-mailman (input) for mailman id 286207;
 Mon, 07 Mar 2022 15:56:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gfv=TS=citrix.com=prvs=0582ef7ee=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRFib-000398-Br
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 15:56:17 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ce3261c-9e2f-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 16:56:14 +0100 (CET)
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
X-Inumbo-ID: 1ce3261c-9e2f-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646668574;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=hx2gAxBHrnWckVQL0StG1ROI0FpWyR+BNGHkPWm7YWQ=;
  b=a9Lt3ckKhGfaJhFIxBGcbMWlem0kRUIQZZh2xg7NxrcrwN2QMm4qRhmb
   zd5iXFSDSVnaLaU2B/P/q24BOh3tHsJlOUY5dnAFhz8YvQjBQU3Rqa56t
   //sEy1mH1ml2VXd0bmnyGeg2L4YbI61hT77BUOEQmGrakISa+ipZU0uL8
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67971345
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Bp6rP6k2gfR9aZBSg77PB+no5gxuJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNUW3Ub/uDY2Twed4gadm2/E0BvZTUzdViGgA+qCljRCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DiW1zV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYbQZwFYPvxeMhQxRRA35SDJZD5rTgPi3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3oHZvwCufFf87aZvCX7/L9ZlT2zJYasVmQ6mPO
 JNCNWcHgBLoT0BKK14GVJIFheKQ2F7/fhxEmWi2nP9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0zzDwsGLtWZxXyA+2i1m+7UtSrhXcQZE7jQ3sBthFqf12kCEio8XFGwoeS6okOmUtcZI
 EsRkgI1trQ7/kGvStj7XjW7rWSCsxpaXMBfe8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLT5lvaCRSHmd3qyJtj70Mi8QRUcAeCsFQA0t89Tl5oYpgXryos1LSfDvyIevQHepn
 m7M/HNWa6gvYdAj86Ti1n7k3jWQtpXAXlEZ1z7SQGmC8VYsDGK6XLCA5V/e5PdGCY+WSFido
 XQJ8/SjAPAy4YKlz3LUHrhUdF29z7PcaWCH3wYzd3U032n1oxaekZZsDCaSzauDGuINYnfXb
 UDaomu9D7cDbSLxPcebj29cYvnGLJQM9/y4DJg4jfIUO/CdkTNrGwk0OSatM5jFyhRErE3GE
 c7znTyQJXgbE7976zG9Wv0Q17Qmrghnmz+NGMGll0v8gerCDJJwdVviGAHSBt3VEYve+FmFm
 zqhH5HiJ+pjvB3WPXCMrN97waEiJnknH5Hmw/G7hcbYSjeK7FoJUqeLqZt4ItQNt/0Myo/gp
 yjtMmcFmAuXrSCWcm2iNyE8AI4DqL4i9BrXywR3Zg32s5XiCK7yhJoim2wfJuF2pLQ+lqcvF
 5HouayoW5xyd9gOwBxEBbHVp41+bhW7wwWIOiuuej8keJB8AQfO/7fZksHHr0Hi0gLfWRMCn
 oCd
IronPort-HdrOrdr: A9a23:gzyBuqpwZxMH48ulsf99XkYaV5vDL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBThHPlOkPQs1NaZLXPbUQ6TTb2KgrGSugEIdxeOk9K1tp
 0QDZSWaueAdWSS5PySiGLTfqdCsbu6GciT9JjjJhxWPGdXgs9bnmNE4lHxKDwLeOAKP+txKL
 Osou584xawc3Ueacq2QlEDQuj4vtXO0LbrewQPCRIL4BSHyWrA0s+wLzGomjMlFx9fy7Yr9m
 bI1yT/+6WYqvm+jjvRzXXa4Zh6kMbojvFDGMuPoM4ILSiEsHfhWK1RH5m5+BwlquCm71gn1P
 HKvhcbJsx2r0jce2mkyCGdrzXI4XIL0TvP2FWYiXzsrYjSXzQhEfdMgopfb1/w91cglMsU6t
 MG40up875sST/QliX04NbFEztwkFCvnHYkmekPy1RCTIolbqNLp4B3xjIZLH45JlO11GkbKp
 guMCmFj8wmMW9yLkqp9FWH+ebcEUjaRXy9Mws/Us/86UkioJk29Tpb+CUlpAZxyHsMceg02w
 36CNUaqFg3dL5sUUtcPpZ3fSLlMB26ffrzWFjiU2gPUpt3fk7wlw==
X-IronPort-AV: E=Sophos;i="5.90,162,1643691600"; 
   d="scan'208";a="67971345"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRv52r3Kmzu53E3rSqjyReAzHfApIW0r1RY8v57Q2Sh9xzkvhIEYDnVjRWvRPnGGpCo04Q7Eq/ofyk0Y0pMjGicTUnxKe40GZ9v/S1DQLG5um3nuLGcXmasN1ybCoFOJrh+kHtORq7Ep3M7lV2UrFfhFa/v5tjEfjLnlVIzya/a9yVbPFmnLDyl3pzoek1N+eguy/T9grU8xx+khI3NNr3f9w9YlfWtSUG0ZEkjMFiwYLAOaS7kTQunKEUv5S9nCAx0dPzda1SGqUVh7oDBNMsYrUr+xuuQyxbtASjbV+KTZPNnDe4nyHbpsoPTCw//eKSZy59rnAwohlzGXXt2Xqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJ4EYjrcFXlo3aS7BX2YYz8Oqio8yDQPlQTvRa6h9Vs=;
 b=JJA61VHNdktkc44Am11E4pZuYLqzxm/29mej+DTSaLHofyk7FF7MeeDlikpzWJ0Fmwj/z+YM5gzY3Sqr3ayE9WvFOHHZpMsqhfAEmotHwqor4P8RIsSp39G6TSEObDjM37TnJ98JkPkWazP0HBA2/2hfpq/zjZ4O/TuVFKuVZDD2p5k6BpwWx+CtZ2dmsWTYsqJupC2xPnHsZ9WN7LBZFT+ca8ahnJXGPF2ajVy9Lgbjxy0qJdJqvlrH1ARhwIK3hXEI4fW0TiLMJ6XTwbQ98qGTMujiGBytnsUGw9Uz1qE1Z0z0FyuMiwTzF0AxdPupvptaAGTZ2w8r8sexRd1BlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJ4EYjrcFXlo3aS7BX2YYz8Oqio8yDQPlQTvRa6h9Vs=;
 b=ptfvPz3iY+2R+m1AcpPXB0Efat+v0AFpswibom0Vlxy2hOW9KEqcFHpjXCM2ERgFk1P9iCbttSC6dOOFfYStGPMGzdHljaVWyM13N539ejSwlS+MKsDBJZGL/CRS9Vuy3udfAIgAlprING26qvYbIGKKaN873cqPYL37l5fs30U=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] livepatch: set -f{function,data}-sections compiler option
Date: Mon,  7 Mar 2022 16:55:58 +0100
Message-ID: <20220307155558.72876-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0507.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b1a2a0e-b91c-4bbf-7907-08da0052fe51
X-MS-TrafficTypeDiagnostic: MW4PR03MB6489:EE_
X-Microsoft-Antispam-PRVS: <MW4PR03MB6489A3435C08954DF00004848F089@MW4PR03MB6489.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tM/fc0cR/So5aFfd6x7xQZQEyJtkRGNujeNFHP9zhy4HY7g3l0PVVeLupuQwwRIFgpDMftJCqHSa4T/mI234M6kk2W3nfSSJgmvsPZHuq/dC4AVmThLobzqanQI7hUyRvR3+JaW7PlUgolNcRaeFW4jGJkEuFb2+XpN1ewG4KW1pVTAgU7I4TxibLB7PJHQG7PEpcuvs9lFkhno98j9UfxbtsPJ3lzFLlV//uBhGYwYFliq3KXEQSNmJ0N1I53A+6E3VMoZPg7X3eeOcx0Wmb+pALmJE4X57XPDshcGGPj/Jzso8cYSCM1GbW/v2sGesrQFWv/S9jg2njqBRC9PhJJEc1jfIU4tB2VCJwm3/dT49lbnhwm2wjWc7ZtB4VB7bgUPd9CMAASnoa8VJXnCcGFP159Xr2kClgIbC/RLQve/nKdVVvqa0Pdd+TDy7VPdpBjGZUPHPaLmhzsqzwRr//obFMVFCIdVTDO8/vFTz9W2SDSB37LpKtwchDVXomAsAm4dZ7OF68j4Kn0L7Vbt3ic083mxVKfyAJC8amyP2l0t0nG6jQW8lQ6nO5Xb+6NWoXSWZTt26a1UTNeng9dkNBf1uBWB/8VIUsl1133DA6gnQm1J+Y6gOcLyS1XuoGu8Ov5ah3sV34uAPokNxUvixjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(186003)(54906003)(6916009)(26005)(316002)(6512007)(82960400001)(66946007)(8936002)(2616005)(38100700002)(6666004)(83380400001)(86362001)(1076003)(36756003)(4326008)(8676002)(5660300002)(508600001)(2906002)(66556008)(6486002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2NpNVVEWUFyVjhmKzRJNzVkL1hWZHRma3N5d3BTZXdqN3p6ZVNTaWx5Y3Q1?=
 =?utf-8?B?azJZSzMrMEhYQWRJUG1BKzV1d3d4ZzJuNFhObHJPeUJWOEhjNXhreWtxTDAv?=
 =?utf-8?B?aWwrMHk4RWZEdkZZZ0xYYTU4RStoYm5Mejd2b1gzdjdoemxpcEptVGlHbXhN?=
 =?utf-8?B?eFBGelNSS3NmTHA2Q0VPbThydjJEUmpqeUZyRjdIT2lleUNNZVRPbXFoMFNM?=
 =?utf-8?B?djdHTVRKdnVHWlNMNlY3MGNBTEpWSTQ4WmpYZC9DZzExZ3FiL1k2WXNwWENV?=
 =?utf-8?B?bTZQQXUxWUo3Q3BOeHpLcDMxZCthRWtqbFhpWjRyTXk2NStKSGYyWExhajJX?=
 =?utf-8?B?aFE2Y0VpNTY4MS81eGsvdTZUeERGTUl6dzYzZzhveUkvU0VTYmo1TzlaSklT?=
 =?utf-8?B?UXNhd2tYMDIraUl1ZzVkN2Q2cTl2WTJENTRKZkxrOUw3eGxhZTZFZ1J2L3F6?=
 =?utf-8?B?L2JYRFN3eWV4UWxPbEFyNnZDanl2ZG9hRUlPUFJVUWoySnR1V1Bzc0VxVy9v?=
 =?utf-8?B?Mlk3UGdWM2NFMGJlYldsdWNwWHZTdUJ6WXljTGc1MlcwR2ZrTzJnUFBtT29v?=
 =?utf-8?B?Zy9yYmQvU1hnLzFENHdhd1FhdjNuL3FYYXZON295WXZ2cG4yQ2V5bnYzeUls?=
 =?utf-8?B?enhJM3dTTTNiNzFKbFRqaWNLaE56NlpPMW9kc0IwVnpRbTlkbFBDcVJ6MjN5?=
 =?utf-8?B?R3U2MUE0Sm1oTnFXZkZvT0pRZDFMUHpoWXBzaHJHTlZPakhLckxuTVFwc3pk?=
 =?utf-8?B?NGV1bmNhY29xZm9KYzhPOUlZRjgxOW1TSkhVNm1LQ08waGp2VHYyTitXL05z?=
 =?utf-8?B?WlpOZ1Bsb0R4S1ZSeThJK09IWXRqYUFxZjRCRFhhREVNNmgzbDJCRWd5aTMx?=
 =?utf-8?B?UmIrNisyZU14Y2JQUTNzd3FmZFR2dlp6SVVUVEZwdDJkdEFrZDFIRXJJbzRO?=
 =?utf-8?B?Wm1DUDJrS2Q0aE1BUis5RElyOFJZVDFNemViSjNhWW1ERkJENTBBQU9xTmhn?=
 =?utf-8?B?bk9ybEp3Rnlwc0lCY25URUg2MlJiTUZOKzVYUHJDeXp4d2o1LzNaQmo0RjJo?=
 =?utf-8?B?cjZzWFJPZWtUWlFkMHFPMWs5cXdvdHdUOE04RlM3NGJqQXlneER6RXBWYzdt?=
 =?utf-8?B?N09aZlN0T1ZvNEMzWlBoYWEyTGhpNm0rdC82bitiSGlRTFFZNUltR2U2bG01?=
 =?utf-8?B?VmN2ZVUvZXp3SFlSbzVGS2xrNnlLYjN4Mlg1Qjh3L2FlVjdaOGhIT003U1lT?=
 =?utf-8?B?TlVYWGhWekJwL3NEYUtvM2l3bGhvdmd4Yis5bUlxSkRURUNPTlk1M29oeDl5?=
 =?utf-8?B?UFVZUHYrdVNCbHc3aElrR2JKMUhjVWh2RmlMOC92YS94Z1lvT1pBUUZRL3lM?=
 =?utf-8?B?ZW9QSERmZlROR3doZGFESWNHY0JRZ2MvVzVwWDBNc3dWSFJ2V0w3TE9CSWVU?=
 =?utf-8?B?aFpZMjFVOHlGWHBIMjlTY2dwRE1tSHROOFhrMDhKWUp4Q1lETVpHSC82clRq?=
 =?utf-8?B?K3dreVgreU5CZ2J6SVRVcWFMbE11OEtlSEZwTnFlemNqaS9qYSs1d0M1WURV?=
 =?utf-8?B?dXBkRWNlOUtuUDR6QmVEblNyNEZaN2ZmTDA5Z3p4WWVwYmNXRDMyRUl5RHZo?=
 =?utf-8?B?L2t4ak9wZFRnS2FFM3lQQVlQVGtwdVpza28zSGVQVjN5ajdMK2tPNnV0Qjl1?=
 =?utf-8?B?c25BcFdXZnAwdEZKY1BzUFp4N0phTUNhY1d1dGpoallodHo4LzNWS2dtN3hO?=
 =?utf-8?B?bld6bWErNk9YZnd3WUFIRDBPMExyNGRxQU5MTjNtdzdodldnZXBHMVYxbjUx?=
 =?utf-8?B?RmVJRWJTU3lzRFp5cWQrOU01cDFtM3JMaWdVc0k1RDk0VmI1VkZsQklSZUFx?=
 =?utf-8?B?ek0xZVJWdFdXSXMvS3RoVGdLaWlPNTEwREdDYU1LU0szY3krRmJDUSsyeFg4?=
 =?utf-8?B?OUIxVC9BVU1HaXdPNjNvSVhKblBVaFRJSkVseitoRUxZV0kvazhuMkQ2ZDg5?=
 =?utf-8?B?NDZURDZSVExsTjU2cStIc25GTXEydEFtMGJWSXVZSnRQYjE4K1FuZDA0NkpL?=
 =?utf-8?B?amJBU2U1bXloRHg3NzJiQVNPUzRqcnhrM1pYY1JpN24wZzRxMW80VGRsM2c2?=
 =?utf-8?B?R2JSV1h4MTJ4MkxFZnBFSDZlb1FsVWM2d1VLakZ2L0tTRTBGdlN6cnA1bHBB?=
 =?utf-8?Q?NUXzseYOcDzmjcwdDG+AOBU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1a2a0e-b91c-4bbf-7907-08da0052fe51
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 15:56:08.2916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OKRE44Ic0751vF5l5ygzvOLg4MWPPSdCejwVpLe1FA0TfGwicfnkiN7GNc+P2SDuz3CUrQ4IVZ9N1XN+idHOGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6489
X-OriginatorOrg: citrix.com

If livepatching support is enabled build the hypervisor with
-f{function,data}-sections compiler options, which is required by the
livepatching tools to detect changes and create livepatches.

This shouldn't result in any functional change on the hypervisor
binary image, but does however require some changes in the linker
script in order to handle that each function and data item will now be
placed into its own section in object files. As a result add catch-all
for .text, .data and .bss in order to merge each individual item
section into the final image.

The main difference will be that .text.startup will end up being part
of .text rather than .init, and thus won't be freed. .text.exit will
also be part of .text rather than dropped. Overall this could make the
image bigger, and package some .text code in a sub-optimal way.

Note that placement of the sections inside of .text is also slightly
adjusted to be more similar to the position found in the default GNU
ld linker script. This requires having a separate section for the
header in order to place it at the begging of the output image,
followed with the unlikely and related sections, and finally the main
.text section.

On Arm the .data.read_mostly needs to be moved ahead of the .data
section like it's already done on x86, and the alignment needs to be
set to PAGE_SIZE so it doesn't end up being placed at the tail of a
read-only page from the previous section. While there move the
alignment of the .data section ahead of the section declaration, like
it's done for other sections.

The benefit of having CONFIG_LIVEPATCH enable those compiler option
is that the livepatch build tools no longer need to fiddle with the
build system in order to enable them. Note the current livepatch tools
are broken after the recent build changes due to the way they
attempt to set  -f{function,data}-sections.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Introduce CC_SPLIT_SECTIONS for selecting the compiler options.
 - Drop check for compiler options, all supported versions have them.
 - Re-arrange section placement in .text, to match the default linker
   script.
 - Introduce .text.header to contain the headers bits that must appear
   first in the final binary.
---
Given that now the header is explicitly placed in .text.header, it's
likely possible to simplify some of the ordering of the object files
for the prelink.o generation, as arch/x86/boot/built_in.o no longer
needs to be the first object file in the list.

It also seems on Arm the schedulers and hypfs .data sections should be
moved into read_mostly.
---
Tested by gitlab in order to assert I didn't introduce any regression
on Arm specially.
---
 xen/Makefile              |  2 ++
 xen/arch/arm/arm32/head.S |  1 +
 xen/arch/arm/arm64/head.S |  1 +
 xen/arch/arm/xen.lds.S    | 49 +++++++++++++++++++++------------------
 xen/arch/x86/boot/head.S  |  2 +-
 xen/arch/x86/xen.lds.S    | 22 +++++++++++-------
 xen/common/Kconfig        |  4 ++++
 7 files changed, 49 insertions(+), 32 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 5c21492d6f..18a4f7e101 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -273,6 +273,8 @@ else
 CFLAGS += -fomit-frame-pointer
 endif
 
+CFLAGS-$(CONFIG_CC_SPLIT_SECTIONS) += -ffunction-sections -fdata-sections
+
 CFLAGS += -nostdinc -fno-builtin -fno-common
 CFLAGS += -Werror -Wredundant-decls -Wno-pointer-arith
 $(call cc-option-add,CFLAGS,CC,-Wvla)
diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 7a906167ef..c837d3054c 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -120,6 +120,7 @@
 
 #endif /* !CONFIG_EARLY_PRINTK */
 
+        .section .text.header, "ax", %progbits
         .arm
 
         /*
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 66d862fc81..e62c48ec1c 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -133,6 +133,7 @@
         add \xb, \xb, x20
 .endm
 
+        .section .text.header, "ax", %progbits
         /*.aarch64*/
 
         /*
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 08016948ab..836da880c3 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -30,9 +30,16 @@ SECTIONS
   _start = .;
   .text : {
         _stext = .;            /* Text section */
+       *(.text.header)
+
+       *(.text.cold .text.cold.*)
+       *(.text.unlikely .text.*_unlikely .text.unlikely.*)
+
        *(.text)
-       *(.text.cold)
-       *(.text.unlikely)
+#ifdef CONFIG_CC_SPLIT_SECTIONS
+       *(.text.*)
+#endif
+
        *(.fixup)
        *(.gnu.warning)
        _etext = .;             /* End of text section */
@@ -78,10 +85,24 @@ SECTIONS
 #endif
   _erodata = .;                /* End of read-only data */
 
+  . = ALIGN(PAGE_SIZE);
+  .data.read_mostly : {
+       /* Exception table */
+       __start___ex_table = .;
+       *(.ex_table)
+       __stop___ex_table = .;
+
+       /* Pre-exception table */
+       __start___pre_ex_table = .;
+       *(.ex_table.pre)
+       __stop___pre_ex_table = .;
+
+       *(.data.read_mostly)
+  } :text
+
+  . = ALIGN(SMP_CACHE_BYTES);
   .data : {                    /* Data */
-       . = ALIGN(PAGE_SIZE);
        *(.data.page_aligned)
-       *(.data)
        . = ALIGN(8);
        __start_schedulers_array = .;
        *(.data.schedulers)
@@ -94,26 +115,10 @@ SECTIONS
        __paramhypfs_end = .;
 #endif
 
-       *(.data.rel)
-       *(.data.rel.*)
+       *(.data .data.*)
        CONSTRUCTORS
   } :text
 
-  . = ALIGN(SMP_CACHE_BYTES);
-  .data.read_mostly : {
-       /* Exception table */
-       __start___ex_table = .;
-       *(.ex_table)
-       __stop___ex_table = .;
-
-       /* Pre-exception table */
-       __start___pre_ex_table = .;
-       *(.ex_table.pre)
-       __stop___pre_ex_table = .;
-
-       *(.data.read_mostly)
-  } :text
-
   . = ALIGN(8);
   .arch.info : {
       _splatform = .;
@@ -207,7 +212,7 @@ SECTIONS
        *(.bss.percpu.read_mostly)
        . = ALIGN(SMP_CACHE_BYTES);
        __per_cpu_data_end = .;
-       *(.bss)
+       *(.bss .bss.*)
        . = ALIGN(POINTER_ALIGN);
        __bss_end = .;
   } :text
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index dd1bea0d10..92d73345f0 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -9,7 +9,7 @@
 #include <asm/cpufeature.h>
 #include <public/elfnote.h>
 
-        .text
+        .section .text.header, "ax", @progbits
         .code32
 
 #define sym_offs(sym)     ((sym) - __XEN_VIRT_START)
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 506bc8e404..75925fe145 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -73,9 +73,7 @@ SECTIONS
   _start = .;
   DECL_SECTION(.text) {
         _stext = .;            /* Text and read-only data */
-       *(.text)
-       *(.text.__x86_indirect_thunk_*)
-       *(.text.page_aligned)
+       *(.text.header)
 
        . = ALIGN(PAGE_SIZE);
        _stextentry = .;
@@ -86,8 +84,16 @@ SECTIONS
        *(.text.kexec)          /* Page aligned in the object file. */
        kexec_reloc_end = .;
 
-       *(.text.cold)
-       *(.text.unlikely)
+       *(.text.cold .text.cold.*)
+       *(.text.unlikely .text.*_unlikely .text.unlikely.*)
+
+       *(.text)
+#ifdef CONFIG_CC_SPLIT_SECTIONS
+       *(.text.*)
+#endif
+       *(.text.__x86_indirect_thunk_*)
+       *(.text.page_aligned)
+
        *(.fixup)
        *(.gnu.warning)
        _etext = .;             /* End of text section */
@@ -289,9 +295,7 @@ SECTIONS
 
   DECL_SECTION(.data) {
        *(.data.page_aligned)
-       *(.data)
-       *(.data.rel)
-       *(.data.rel.*)
+       *(.data .data.*)
   } PHDR(text)
 
   DECL_SECTION(.bss) {
@@ -306,7 +310,7 @@ SECTIONS
        *(.bss.percpu.read_mostly)
        . = ALIGN(SMP_CACHE_BYTES);
        __per_cpu_data_end = .;
-       *(.bss)
+       *(.bss .bss.*)
        . = ALIGN(POINTER_ALIGN);
        __bss_end = .;
   } PHDR(text)
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 6443943889..202f0811d1 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -350,10 +350,14 @@ source "common/sched/Kconfig"
 config CRYPTO
 	bool
 
+config CC_SPLIT_SECTIONS
+	bool
+
 config LIVEPATCH
 	bool "Live patching support"
 	default X86
 	depends on "$(XEN_HAS_BUILD_ID)" = "y"
+	select CC_SPLIT_SECTIONS
 	---help---
 	  Allows a running Xen hypervisor to be dynamically patched using
 	  binary patches without rebooting. This is primarily used to binarily
-- 
2.34.1


