Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8503C7B1AF0
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 13:25:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609518.948633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlp8S-0004LE-Kj; Thu, 28 Sep 2023 11:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609518.948633; Thu, 28 Sep 2023 11:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlp8S-0004JY-Hc; Thu, 28 Sep 2023 11:24:48 +0000
Received: by outflank-mailman (input) for mailman id 609518;
 Thu, 28 Sep 2023 11:24:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qJIK=FM=citrix.com=prvs=6283bbd10=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qlp8R-0004JS-Dp
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 11:24:47 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f1bdc20-5df1-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 13:24:45 +0200 (CEST)
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Sep 2023 07:24:42 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6256.namprd03.prod.outlook.com (2603:10b6:a03:303::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Thu, 28 Sep
 2023 11:24:38 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3%5]) with mapi id 15.20.6813.024; Thu, 28 Sep 2023
 11:24:37 +0000
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
X-Inumbo-ID: 9f1bdc20-5df1-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695900284;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4GMBvUHcjS0yrLicBqUm/d84Gjb1TM7PxO/V3P1aZhg=;
  b=AMJLhgRcbk4h1brIdygKlYu9lNkHDfnVaChvyv/FuHh+fAfzdjdeLf6A
   p+il9k/htXS0NbF1wBvrGBdiVmBsOHVAj0mx8mLRKjxSe5IhgMXeJkiV/
   uQ5+PCZEflPF2FfszV2ElCtRzSbOdlwAKVxTzLEqPs319/GepW4dA6KlT
   E=;
X-CSE-ConnectionGUID: 1rbSC6gnSCOx1qghDwlkww==
X-CSE-MsgGUID: RQQKcMwzTq6l95YB08IncA==
X-IronPort-RemoteIP: 104.47.55.108
X-IronPort-MID: 123915832
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:Rd4BWaAlAnaRkxVW/8ziw5YqxClBgxIJ4kV8jS/XYbTApDsghjBWy
 WsZC23TbP+IMzPxKNBwbNu19EJSuMfQx9ZjQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48D8kk/nOH+KgYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsMpvlDs15K6p4GJC7gRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwo/x9OkoQ+
 vojAxcdNwmMh86pxLGkVbw57igjBJGD0II3nFhFlGmcKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+Oxuuzi7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqCn937KfxnmTtIQ6LoSB1fVPn0+v3zIXWUAnfwPrgP+yoxvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/vrGDhuvbu9WX+bsLCOoluaIjMJJGUPYSsFSwot4NT5pow3yBXVQb5LD6qdntDzXzbqz
 FiisCE7jq47kc0P2qO07F3DxTmro/D0ohUd4wzWWieg8Vl/bYv8P4iwswGDvbBHMZqTSUSHs
 D4cgc+C4esSDJaL0iuQXOEKG7Lv7PGAWNHBvWNS81Aa32zF0xaekUp4ulmS+G8B3h44RALU
IronPort-HdrOrdr: A9a23:b5QSxqC21V2gLGTlHemQ55DYdb4zR+YMi2TDsHoBMCC9E/bo8f
 xG+c5x6faaslkssR0b9+xoW5PwIk80l6QV3WB5B97LNmSLhILCFuFfBOXZslndMhy72ulB1b
 pxN4hSYeeAamSSVPyKgjVQxexQpeW6zA==
X-Talos-CUID: =?us-ascii?q?9a23=3A7ZfcPWpZ0o6Gy9Geifg6F1jmUZk/eEb2knjWGGS?=
 =?us-ascii?q?fGT9wR725VluT57wxxg=3D=3D?=
X-Talos-MUID: 9a23:j1a4wgkc4N4pmVoSfifJdnpYDf5L6IGxGnwUz5FX5viubXxRPTy02WE=
X-IronPort-AV: E=Sophos;i="6.03,183,1694750400"; 
   d="scan'208";a="123915832"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9rwbH9ZfQhVeht4qqdc5OtTPBktK2EfIZnePDfL6R8oXo70dSiUz8lRk77hx72xtKvyDfMdT75DxtbTnraGoWP1qnhxRY/Mb/dERpCcJOMNvXmUz2zKO6I+ydFrq/zTUtulEbhgfz6ts29aYXqpIehIf+5ndpoEk9V7Nc0OUue4mdQP8QhUFbzw8yWSYoE9xWdMD8zApE9wI5FzKKCCa/8Bg9qKckSVUc1Sf8lj4QdMU9U9qD3lzGec7N0S+Wt/pg1uQJ8A+ltgjXvgrrF5xUvVrdFdvoP31Xi5NlJ2OltphywX590DXNSVUSNCwXb1T1p5IV7KH2Zn2Jc5bapplQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIyDJ3eRzRBEP4lF+DKyXWjmFWrVuwlBaH/GUuCd39U=;
 b=dkUrRrgUmv/NNgiNBnHcgpAWRmvHgeU23LvFVgNNMz9NTr0JBeASbMu63TK1j36it3oikfB4DBH5EYHBKWPyfKBxyoQRWLW0iFgZCAn/X8mNZJ+YfkSWvkYZ2LAaX4M3X+fK+MNuaJD/6ycMbSr4hT00eqzqbLuQmsu2u2N598Q2eiL4z87oRt5IbuDGS2Csa4A62UZaVRWn/oeSGPoBPvy4N4U4Lx414HKdhKAyxqJBmygzFIEQTqEnW4DugUt/oaSbxxUwRXac7rNXvhv7ehp6lLo1cbcgw+/GPkljfZBzWWXzKecpJ6E8AAAY6KK08Chguf5i2nAnIukxKlYoDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIyDJ3eRzRBEP4lF+DKyXWjmFWrVuwlBaH/GUuCd39U=;
 b=raO0MQaf4SQoghS0lbsl6NUpMMvOeXFU2mB5yQM5WDYYGHr0LlEzx5cCJhDvJ2UlPw1KHC6DiD5iclCtuXr+yPTIce6/jxomIKyvimg0Pnz0r1wKQIL1d9gSP/5tVqvdKAOuJT03iXImpWcK7SYfbkTNlJR69yi5JeMp1rxYkkM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 28 Sep 2023 13:24:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v3 8/8] common: convert vCPU info area registration
Message-ID: <ZRVib9rVoHZCxTLx@MacBookPdeRoger>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
 <ada41793-629b-3864-c2fc-412bd8d0047d@suse.com>
 <ZRU4QQcFL5Le5cFz@MacBookPdeRoger>
 <c82494b6-d6c9-8252-4eac-5c50fdf7e477@suse.com>
 <ZRVSOi-nPTagCWq9@MacBookPdeRoger>
 <cc175a33-0e04-4731-3bc2-ed15eb62525e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc175a33-0e04-4731-3bc2-ed15eb62525e@suse.com>
X-ClientProxiedBy: LO3P123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::16) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6256:EE_
X-MS-Office365-Filtering-Correlation-Id: 1449ecc4-8396-47b5-4f01-08dbc0157fe1
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jjO7wziFsBDFUK3cUUsXDdd2pasymAtsx2Nrkqy1gAnmGitZfPyd/4n/paHhCXc98cPUbImvkC9oDaqvSKbMiBOEa+pgVNIvrTJ4vW11hEItZYIZnfC68n6xb8ghc2BtIcZHFc8/tAkaXhwGRCkb6C+hV2qIGgBDaaUZ54UZUbJL7CGIlUgM+L7gqOeE0+62Z504RKWojy68DpNmizmLeZ4pQxHvo6ns+4F2Yk3BAAcHVlbAGoKYT4hIzKg0H9cpvkvlVO8jPc1ptVOf5QKO8oP49uu1OpdyhOOZKjUZr9xMfr7SoUTpOWNWW5tGIw3j6Qyyd5axji3cEWQGazpHLH9yqe7JUlwUSe34Mu64oIjCQxCKo4V09Y6P64hGfJoUAoIJLYEoEX9WZ8+3rw9D9zV6fXhR7nqpac6SPYZCS/+m6r/j+03MnOgDmwdEDhIhk6uXiVqJvMYNAPOqf/Y8eo5sNso+NWhJ3CKVwRD+iJOASOPfl/isvM/g2Gjqb+UR5daXh2PeCVWZvUvz4U5mp1XxTSMrO01ar5+O2vHUDPFgFXiTpWWQHyJQXsAJlryh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(39860400002)(396003)(376002)(346002)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(316002)(6916009)(66556008)(66476007)(54906003)(66946007)(478600001)(38100700002)(6666004)(6486002)(2906002)(33716001)(85182001)(86362001)(41300700001)(5660300002)(8936002)(4326008)(8676002)(26005)(83380400001)(6506007)(6512007)(9686003)(53546011)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WklRRjUwQlVneStaWkFMVENrRU5sZEtTN2k1VXRuUFhISUE1QmNaQVJkUkt4?=
 =?utf-8?B?ejJBaHFTNVgvaHlRMnhtL1Q5NkJaVTNRVWNiNVkvMUdFVFZTcDFaV1pOLzcy?=
 =?utf-8?B?RVd5UEVZMmtQVE9iTFBmcjRyZzMxNTE5ZU5YSmpUbVVFbzV4OXVCTFZnUjFB?=
 =?utf-8?B?akN2T2NLL2I0WithMHFHd1ovWUFGK1YwY1NOT28rckpHd091bU1aY3l2emNB?=
 =?utf-8?B?bUwzREtQaG1tK0JCMlZXTTJVbTY5SFNjTlNNbUtVaDJRaVBlQVVxZmlLa3lY?=
 =?utf-8?B?RXFQUlZRd3lTc2crVDdOTTh5S0pEbWJPcUNTQlN6S2xLVmplbVRHczk2aVhZ?=
 =?utf-8?B?OXZCQlNwRmNDaTBXZGMrMzkvVkFPNk1WL1JOMHJTcXFJVkh2RHlickQ5OEdn?=
 =?utf-8?B?R241bVlwZnRxVkc4NXMwd2l0TkgraWJwRGdqeW84SGVmZ0s3cHRyTnNwTVI5?=
 =?utf-8?B?YTRrdHdFRTNYYVh3cHF0WXR1QWloTlhCZC9oUG9ONWVJeDZySmZWTXM2T0lK?=
 =?utf-8?B?N3ZhR0VrNlViSTcxTnpQWnEzTUZvUVBXTHo1TTkyb3FmMWcyWHJudHJ4c2JK?=
 =?utf-8?B?TVpqYmZjMzNneTN2dFN4VXkzbndrOHgxdCtqYkd4K0FiMGVFNkZ2YlkwNUdC?=
 =?utf-8?B?THhQdEx1VHhaS3hOT1FVSXN2dFRneVdKVThrVll4V0RQWWVqMW5NenhwdjJr?=
 =?utf-8?B?T2pFbDl6MnN3UkZRNTJ2Z1lpRmVnM01uQVNrb0h2TThtK1JUcUR2UHZSL21X?=
 =?utf-8?B?TzFnQ3psZE5vbjhtQU1CdFUwRjE5ekU0RElwK21qWDdGNGNlWlRLaGpRNVdC?=
 =?utf-8?B?QVVtTGs0M1N1VDRhTElDbmN4bGJ6eUFpNHd1dHNnT05WMHhkY2g1ODhodm43?=
 =?utf-8?B?MXNuRmE4LytzTXpZbVRmeG91MG1aWC9EdGJ1R0RuVS9SZGNGbHFsL0ZBclhh?=
 =?utf-8?B?Q2haOW1IRU80WWQ0dkdPcWp1Y2I3WnkyaWkyVlFQbzUrNE9ML254Y0p1ZUNC?=
 =?utf-8?B?YldxNGZucUJFTHMyWkM1MWxyOVI4RExwV0V0YjB3ZjVZRFE3S2xpTDJNQzhR?=
 =?utf-8?B?dkpoekpkQ1owWFR0TkNQSm9RZk10SzRjU1BPUFR0VFRvTW5tb0tOcjFlOS81?=
 =?utf-8?B?RnJtS3pKek5YMFZGWHBMbDRaK0JMNFZyek8vbE5JV09yb2owUjZLMGlqQ2pt?=
 =?utf-8?B?VzhkUkFYS3N3aDJidC93WS83dGpDdzBBTWNab2xyU0MxU2srQmNFUmZLYjZJ?=
 =?utf-8?B?Rit6THlzbE9GYTJJdUpKUXN5bTYvN2poS1F4NU5DMm1WWUtCWWtCWFZ5bGpo?=
 =?utf-8?B?V1FWYTRodXNNSkNyZWlIWkhya1BhSUNGbVRrQldGanoxNnhTVzdDaWM2UmV4?=
 =?utf-8?B?cng5ektacldFSlVzTXZkU3V1T2xlaG80Ym8zNWZHMjFqTnNRRmMyNC94K3M2?=
 =?utf-8?B?R0xJZkNYdks0cHROV21LL29hZzBqeERwSkI0dFM3QTFMZFdiVDVNdjQyR2p5?=
 =?utf-8?B?RmZxQVZoanJqWGdBSkVKc0t3RVcvSm5BcVVLV3pDYndNd3J5eUFUV0t0eEFO?=
 =?utf-8?B?aTlzdkNabmV1dlR2Szl2T09tcXJPTUtkaHBJcE96TllQMXFWalZpTkZ0MXVR?=
 =?utf-8?B?cUVzNVB4L0h5Mys4cmgxbjFxOGVteU53ZHlVSkN2eFJocTJjbDNPeEQ1SUZO?=
 =?utf-8?B?RUpubllwVGMwUlRFSGR4UE9pekhPdkJ4UTlrdHVRZ0FMODg1ck03M3pCUG1F?=
 =?utf-8?B?NkZNb3RBeEJaRzZrS203WG5zTy85OHZhODdPWnRObjRIVnRRWkZrQU45NHFh?=
 =?utf-8?B?N0R2YVpvTktGZWJqdW9wc2ZGVTVGNnBrNXo1bjEzMDcrYjRreGhObzUrZWhS?=
 =?utf-8?B?RmRGdEVOcVljZnk0cjBVVEpTd2c5aGRKWFYwVHdTaThVWCtyekVzTGhMbnRs?=
 =?utf-8?B?RjR6UHc1L2twUCtnWXFaZm1nWVgyMEdzcEtGRHp5NFNSVTBpSnM5V2ZLY2Js?=
 =?utf-8?B?cThQalBteUpOZ2dKcENsQjJlY0lUZFNBV3dZMDJHbWk4dW90Q2pTUDU4Wmlx?=
 =?utf-8?B?K01YMWR1MzlGbG51MmlNRzUybWpzVnhoQnNyRkwrNVdkWllyQ09LMGtWTmRB?=
 =?utf-8?B?c3JkbmtTUmFjM3RLczJGWXljNThWWnMybDBiRWFaNDhaSVM4ay9KaFlFS2l3?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+JpPfOsoppEIA9ZAbiDv2XT8eLRNQC7zlGBx55YSF2HTQ6+jzVP/kMLZrxU/LE1JpUyeXP4Z2ASKKDMB2sx/Sk9oTGu2pakjjJGjE4qCQwekKmO3y460Hq7qBE0WeJamx+90wLEuPgMOJJHx3Id/ylBOfD1cfYWm/45FvP3bGzgAy8Kwvbuwn4buRHfgl4fq91QiHnCSkgBFwmbIlEVhx/ukTl1NlPA+CRkkGuZDarBK1zdQxknWwZ9/Fjif7WCNjlAKwqVZnpu0op/a9NrtyxGhWuWYAngH5SeIf+7+rBAdLhkp3Oo13TcBlg15Z+Fu87nlkum/+xktPPvZuwaBSh03ooup+Z2N3EHeFXLLtf81gh+ykCFld/B6a2TD9BaFrTMxJqmICGBp1XDsO65iz0OlvMGyR8f9sdA/Q0NYdixQzjUuGTyV3LXW3aLf3QgpwW3CgQ+1H9et7Q1B46SeLLs1mrv+vy7qFd3QCeJo/FJMp9MBhEMI0sQ8SAtPaFOiJ8VNCZRMvzW3sSjugjerFQHbBUqFEuhljLl4t9tSQdPNIzbiziQSAkSByTGhIuP7aUr0nHEqM4G3zrTgPW9zQIybzMQzFp4NXtLipgHYvsT1qF64RJVyQ0cNnh7ttTEBndxqJl/Cr18NaET4Vg8pk5InCU8vcAd7ij0/eQD0G4VuxmewP7csS/6DTZRqHjmdm80fqkUBD8WVkaWXH+SnoE8V48JaPKj9KHBCCPKmjXmQI+mZH4i7NCH4uQ8hF4FXwSoodUIVKOaBwj/HiNmWet4S3Hupy4M8XENkaK2Esea7SdsoMR1V3C/Xoj/KCiJ3yGbSgMWPmEywn1GPKo4b7UhFs+zKMP63xQJsmplOl2AqxAYNTvxpHDBcQanVCHuklkLzqYbPKUSjfJeevR81EQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1449ecc4-8396-47b5-4f01-08dbc0157fe1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 11:24:37.8035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJaS4xq7s/1fu4m1WL73XOz02FNmoccvF6uCryYO1Biz5LRdwkxkzAZ7r41km9GN6dOtbbmFbWnqi+ODUH6wyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6256

On Thu, Sep 28, 2023 at 12:35:23PM +0200, Jan Beulich wrote:
> On 28.09.2023 12:15, Roger Pau Monné wrote:
> > On Thu, Sep 28, 2023 at 11:53:36AM +0200, Jan Beulich wrote:
> >> On 28.09.2023 10:24, Roger Pau Monné wrote:
> >>> On Wed, May 03, 2023 at 05:58:30PM +0200, Jan Beulich wrote:
> >>>> @@ -1633,14 +1528,44 @@ int map_guest_area(struct vcpu *v, paddr
> >>>> +    {
> >>>> +        if ( map )
> >>>> +            populate(map, v);
> >>>>  
> >>>> -    SWAP(area->pg, pg);
> >>>> -    SWAP(area->map, map);
> >>>> +        SWAP(area->pg, pg);
> >>>> +        SWAP(area->map, map);
> >>>> +    }
> >>>> +    else
> >>>> +        rc = -EBUSY;
> >>>>  
> >>>>      domain_unlock(d);
> >>>>  
> >>>> +    /* Set pending flags /after/ new vcpu_info pointer was set. */
> >>>> +    if ( area == &v->vcpu_info_area && !rc )
> >>>> +    {
> >>>> +        /*
> >>>> +         * Mark everything as being pending just to make sure nothing gets
> >>>> +         * lost.  The domain will get a spurious event, but it can cope.
> >>>> +         */
> >>>> +#ifdef CONFIG_COMPAT
> >>>> +        if ( !has_32bit_shinfo(d) )
> >>>> +        {
> >>>> +            vcpu_info_t *info = area->map;
> >>>> +
> >>>> +            /* For VCPUOP_register_vcpu_info handling in common_vcpu_op(). */
> >>>> +            BUILD_BUG_ON(sizeof(*info) != sizeof(info->compat));
> >>>> +            write_atomic(&info->native.evtchn_pending_sel, ~0);
> >>>> +        }
> >>>> +        else
> >>>> +#endif
> >>>> +            write_atomic(&vcpu_info(v, evtchn_pending_sel), ~0);
> >>>
> >>> Can't the setting of evtchn_pending_sel be done in
> >>> vcpu_info_populate()?
> >>
> >> No, see the comment ahead of the outer if(). populate() needs calling
> >> ahead of updating the pointer.
> > 
> > I'm afraid I don't obviously see why evtchn_pending_sel can't be set
> > before v->vcpu_info is updated.  It will end up being ~0 anyway,
> > regardless of the order of operations, and we do force an event
> > channel injection.  There's something I'm clearly missing.
> 
> Considering the target vCPU is paused (or is current), doing so may be
> possible (albeit I fear I'm overlooking something). But re-ordering of
> operations shouldn't be done as a side effect of this change; if the
> original ordering constraints were too strict, then imo relaxing should
> either be a separate earlier change, or a separate follow-on one.

Let's do a followup then.  This will also need an RB instead of an
Ack:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

