Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C51324B8DC7
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 17:22:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274290.469714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKN47-0004PU-UI; Wed, 16 Feb 2022 16:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274290.469714; Wed, 16 Feb 2022 16:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKN47-0004Ne-Oa; Wed, 16 Feb 2022 16:22:03 +0000
Received: by outflank-mailman (input) for mailman id 274290;
 Wed, 16 Feb 2022 16:22:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oYE0=S7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nKN46-0004NT-0R
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 16:22:02 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f37ed2b-8f44-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 17:21:58 +0100 (CET)
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
X-Inumbo-ID: 8f37ed2b-8f44-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645028518;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=D1BziOChSKGR/TxZIuNhqH1cTbshReBw7WPjgUO2h1A=;
  b=GHlc2fplMwK/4CCVdHmX0ftM+s4p7Q9vKxk+d9e1nK5NTDWvsX2hG5iQ
   graFXoWm2yW+YnmrUQwOcxmogTYRW5l7zWvxKawKSUceqffeaB7FnPnI3
   7vUSJfZ7gndlz+w2zhzgiLiDg1zuPR7imIz7CFs57Duq7ESHpiNCVzj2C
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: WiLMvEK0EY48zZ8lOhwRekVUdgJK6muWjPAq7DaL4ZzFsMbnre6QQ+iIQldxNOkylr4Pd9IiJa
 SxvWHm+8dzZWSDnHVezpDakJA8lMlm/BJYWfT+rdUewA+tgeO8djeAYcQPxGJlGoIvHQpev7LT
 GrAxohNPATnF2Ml4tYw52pVS5VJ1V9b6cDm31k1f+AMa31vNHmWiKE1IYpnjR+ldyjIqhG8tUg
 uTUAYwbXQsjStQuoSvPOfmWVRvk0WXSuvSZVlE0xWRHgVaVcJVT7RPs9FCnFkLdabVmXfH6ddG
 Mw0uVOyrmDVmDgbSpng5la4f
X-SBRS: 5.1
X-MesageID: 64256043
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Zw7+pKqd/runSbpkFfPwlx1XBGheBmLEYhIvgKrLsJaIsI4StFCzt
 garIBmPOf7cZ2L1L95yaoi2oRhS6sXVztJqHAI/+yg8RXhApJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw24HnW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnYO7ci5qN6jSouc6dTthKg1HIvVG6ZaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4SR6uAP
 5ZCAdZpRD/lTTRrEG1GM8wRuOOXuynGVSIfsHvA8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru/W70HxUbP9y30iee/zSngeqntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0RNFrOq4z7R+3yY3ywT+gKlEbFj5QQYlz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPPt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4P+RECnCBtJ6sybp1qHHb4
 RDofODEsYgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0idRowaJdVKGazC
 KM2he+3zMUOVJdNRfUpC79d9uxwlfSwfTgbfqy8giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmDOCLbimnk/P+efPOxaopUItbQLmghYRt/jf/m04M
 r93aqO39vmoeLeuMnOMoNFJdA1iwLpSLcmelvG7v9Wre2JOMGogF+XQ0fUmfYlklL5SjeDG4
 je2XUow9bY1rSSvxdyiZi8xZbXxc4x4qH5nbyUgMUzxgyooYJq17bdZfJwyJOF1+OtmxP9yb
 v8EZ8TfXagfFmWZo2wQPcvnsYhvVBW3ngbSbSCrVycyIsx7TAvT9966Iga2rHsSDjC6vNcVq
 qG70l+JWoIKQglvVZ6EaP+mw16rk2IaneZ+AxnBLtVJIR2++4l2MS3hyPQwJphUexnEwzKb0
 SeQAAsZ+raR89NkroGRiPnd/YmzEuZ4Ek5LJEXh7O67ZXvA426u4Y5cS+LULzrTY3z5pfe5b
 uJPwvCibPBexARWs5BxGqpAxL4l44e9vKdTywlpESmZb1mvDb88cHCK0dMW6/9Iz75d/wC3R
 liO6p9RPrDQYJHpF1sYJQwEaOWf1K5LxmmOvKpteEiqtjVq+LenUFlJO0jegSNQG7J5LYc5z
 Lpzo8UR8QG+1kInP9vuYvq4LIhQwqjsi5kai6w=
IronPort-HdrOrdr: A9a23:kjivu6jdaK+VyqZhLlvZn9Td7XBQXuYji2hC6mlwRA09TyX+rb
 HLoB17726QtN9/YgBCpTntAsi9qBDnm6Kdg7NhWotKNTOO0AHEEGgL1/qF/9SKIVydygcy78
 ddmoFFeaTN5QcQt63HCXODfOrIauP3iJxA/t2z80tQ
X-IronPort-AV: E=Sophos;i="5.88,374,1635220800"; 
   d="scan'208";a="64256043"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0liJgRmy/Z+yST0MTLAocwWaKTvsORwn5U2ywYp01jQKxJGmUzOyCLJYWbdIXKlhLIcPa6n6VxnvsNpctX1IlOtrg2CNZnP1vvg1He2Hqr+ejY73mzqM5l25A03qJ00C2Zn6tXG6pkABkwOPpjkTDpJPkp+nHPWVrbeufAoWlytKe19wT37PCOfCSrEY7WA8o/YH+NDVJ+FR0BywlJQr3L/omPTDwfhKOyLox/4260slcMwFA//Cc4XEg0g12mYBasXLySquUeWDogLCN7a8SBdj9SGPWJ03YOsawPwwVDBoGMOAPYxKmqxkdvFsZTSKlQT2jPbicVarESexHzQjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/LvDOtIy8kR/1dSVBF5RKlkbq0t2dXqF+GqtyJfVrM=;
 b=hGKQoDz8tgWwGgWKqRlazu4m9KkfUCTdVicjxrMz0yg4iNlMr3xiJ/B46+69DfPVfPjivfb09s1PAjOdwEIHFKSwQ8V3sgIiQELhZMUaE5C6MAoSw9Ibsz/P19GoC1hmFR5MKyXsplvhjl68kBQqhFEGr/9rsVjBcmh91QQZjhh5oplRXGDVLBYqAQ/ctrMa9QbvQNWn1/NLIDAdeOZnai6aGfDoFIdPHC9ogZcmVSjSgVWVZL9KejXMLc13e2FXMmhdT/m5mt/RXuhsqaviMYRP3v06OWXxbiohF1beptZqn3di5BnTQp/c5mXlhYZcjJIqNkoi0h7xuICpfGr1sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/LvDOtIy8kR/1dSVBF5RKlkbq0t2dXqF+GqtyJfVrM=;
 b=ELR1Fqh7S7ucMWx8sFYYUC/yIL+FdpRYfWFD/AITL+DY45Ru4Jp95czDdmAt4PVNWyoHjsFoKrfrbCfJO+fFdSZJVJCvYsbh5eptdCHcau3txgYUyfI2jSIPraAMWdjBTkjxVpaFZevV1vCrElQaZVsaee72ciu4BudjHt7dZfU=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/3] x86/retpoline: rename retpoline Kconfig check to include GCC prefix
Date: Wed, 16 Feb 2022 17:21:40 +0100
Message-ID: <20220216162142.15384-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216162142.15384-1-roger.pau@citrix.com>
References: <20220216162142.15384-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0042.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8912618-61c7-414b-3a33-08d9f1687155
X-MS-TrafficTypeDiagnostic: SN6PR03MB4143:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB4143D9C0B976DFE78AD1E4B58F359@SN6PR03MB4143.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O1/5QDIIdnrp3/a1umCzagELeemVooAbiIgtigd0HmCk8P8jecUwilbEQVWrL6kkZ02ENzYT3+Seic+GpDqwp05ZXbr4xbJM97RoWNgVDFOtuunQfDVAsUVFNlmhV2rsebnvuSsHxagPcOuwq2BJUEKzsyc+mQ8KsETthDmg+2kHOF5FnydI/0RRQGaz4H6Cu22FEQTgFWEUeevAyY094Eqn+5ewpO5pWE5mxBnxE7ExSaTMCXVVppOxJNuoiz0QcmKenDsalO6ppKP5Y/agnOV1rCM/DriZ4fl+kYMbGWfrOyPNcVOIIltV9GpjjlmlxhlTXdIXgT0WHTOoaSvXUFIPG8ORCyJ6gkWeImtmlVeUicYa685GHxen+vZkCow1DjVfec+UjLmzXOqaI8uNmdFiWH2Q2r0a2SlC+oPZgZEgDO3i7UjKXBOBAWAl6dPg++uQrXAM9yfzS0dIyczMveUoEIVworHr6DTVSb4v63cJWVSOyyP3DASja6N1w6F1GTLn+T9Vz+p2TVX6BsLbXpmxt6FdMFYN8Q47kR5b6T9L0z+h/0wzficwYRwfgs34NcxCczOrgx//cI75WqPcoW2yHUK/QaeyElY4a7ZFDyQdd0NJnergsovF2ClJs+bKRckdoN5xMOCYrVxoTnWt5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(508600001)(4326008)(86362001)(1076003)(186003)(6506007)(316002)(8676002)(6512007)(66476007)(36756003)(2906002)(54906003)(5660300002)(83380400001)(6486002)(66556008)(2616005)(66946007)(26005)(6666004)(8936002)(38100700002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXY2RkJ5VWRtQnFoamRna1hyTmpYQ3RYZW5CTlgwSzBmVWpnakEzVFd4bmEy?=
 =?utf-8?B?dGxzdXIweUVFY0lTV3pzaWxYU25ZeGYwSFRDOUVMQVhES0FKbGM2OFFxMmd5?=
 =?utf-8?B?Vi83TlZMVEN3T29SNEMxWWlscVJFRU80YjJ4K2lweG5IWks1T29aa0tKcG1k?=
 =?utf-8?B?cEVSWjFKQXZlbE9JV3A4MVU2MzBZRThCbnp6Ri9RY1l4cjU2WWg0ODNyQWUx?=
 =?utf-8?B?dHc3QUZKNGhtcmIxaG1vZFBtQVRtS0NQVzYxQlk1a29rOWpuSnRwWVBSTEli?=
 =?utf-8?B?R2FvQ0xRR1plZ1dROVhUNEFSanJKVU1IQS9jWXFmbitMM1R3UERpTittME1Z?=
 =?utf-8?B?eHRDdU5GbTB2bmcvblByM2d5emU0eGV2bGd5UjExYlV3ZExTd0R5SXAvd2pO?=
 =?utf-8?B?NUlndVdZV3pJYWl4dmptNXAvcWlOeEtzb1pvSjlLYmFqSGRmcXRMbHRXcEZr?=
 =?utf-8?B?NzZzbEhOK1M5dXJJRTNSWmg1VUhWOEk1NnIyMUtpSmxvMHhkd3IxNTdGYjN2?=
 =?utf-8?B?bFRpVFI2QW1DVkdLZ2tCUFJ3NGdTektKeFYwUE84MVYxcGF0YnB4dTRleW8z?=
 =?utf-8?B?RWx4cXhEV3VaSHZHZEI4ZTREeW9SWXlnMVVIdko3S1kxK0VJNlp2amZEeXpR?=
 =?utf-8?B?dVVIcEEzY0x3QTBMTmxxM2JsU1RDa2dvY1poOEJYRUk5QUppOTVwdXo4Mk8z?=
 =?utf-8?B?eWZzY1NMZTZaSWdXMlUrenNuWm5tOGZicEZ5OU9vM1ZJN2VqMWhENFljVExa?=
 =?utf-8?B?YWRWMkszRWthR21vdmQ4MmNzajYzWFY0VmtVcTUxbGg1U05yVE1tVzNsaWlp?=
 =?utf-8?B?c2NhZFgvd0lrc1Y2UGJnZjlTUzlZdUJFRUxQcHNhOU1QS2RpcndWQ0FPSHlK?=
 =?utf-8?B?WmFBZ05GbXZycFU4NFFFeVl4UzZSOFR4RjI1NmJ0Z3dONXRrTWNvRW5UYStz?=
 =?utf-8?B?Z3cyL2hsWUM1Y3c2MkxqaGJZR3NoeEg5elRHa3VVeThVZDQrNzlpM05YWXN4?=
 =?utf-8?B?YUlOSWhrN1hPWDNoK01iYUlTRWhBeFF5QzJSeXc1ZFJ2a3dWSWx0dlQ2QXpz?=
 =?utf-8?B?NE5PUUxaNWovdi9wU05TQ0FUMFM4bHVKUVFWSnlZa2dnQlZJcVNHZTZNcHJx?=
 =?utf-8?B?L2V4MXY4WkNkM1JueldSVHpwK0VyeEpicW12WWc1ZDFGOWxNSWFSVW0zeEpH?=
 =?utf-8?B?Mmd2cUMyd25xMTRMRlVEeHk2L2k3MXlWdm9JMmw4TXRGZVVXRitERVgwOHdT?=
 =?utf-8?B?bFU5VmlsUkJya3hnNEk3Rzk2eld3amtHTkxUMU9WdWU5VnkwdWZ6ZkFORjZF?=
 =?utf-8?B?aERLMVVDOTN0QmlyYTNyckdieTlJQlNkVUozY2V2MVdKcUVrNkxCd0x2SCtE?=
 =?utf-8?B?SzUvazFYSWJaZlJXNldsUGkyV1dNZTRYWjdyTUhDQ0V2aHJRMUExcER2MWtW?=
 =?utf-8?B?YWpUV0FZSzNHZUIrV1BXTzRZSzdIRHF0Zi9xVzZkWVJ5NHFSa2Y2OWlhTk5I?=
 =?utf-8?B?RWhvNXlqMFRmb1k3N2ErajRoUEJkazBVZkVwN3l0RHZ0ekdFUGNDcFI2aktG?=
 =?utf-8?B?MnVtd2JocXoxSTg1Y3pWSGloaFp6VURadW5LelduUGxFOUgxVHBTYS9qTkV3?=
 =?utf-8?B?ZkEycUdoNnYwUnp5azNEVW5uVnB6bFJvN1BlazZSOXBNekZ0TEwvUFpFOVY1?=
 =?utf-8?B?ZVgzZGV0YUIrQXFLZUFpaFJIdVNBSVpnOGZDMS9mSy9kQ3l1ajVkQTJtck5D?=
 =?utf-8?B?UU5kdUJvM0l2dEZLMWNtc2JEc1dyWVdzZkdidHJRWTFlL1kzRkQvSjZMamJH?=
 =?utf-8?B?NFpKdldLY2dNV0R1WlA1dU1ITjU2T1p2OGdNMUZWVlpNRW0vS29WVlRSWHVS?=
 =?utf-8?B?emRyUkovNStNUTA4SHplcTUrTUZGWjlzRjl4dUVERXpHM2tXeHRLMzdMUnZk?=
 =?utf-8?B?Q29ERnp1UXFTMmdMV016dHlyOVNHM1R1cjhQcXdBMGREeDdFUmZTZHVjSXdV?=
 =?utf-8?B?Q01LOERuQ01IR3hsbWxLc1MweTJwc2EvaW0zL2lqbkNRUlY4UlpoSEJwdDdB?=
 =?utf-8?B?dTBiY1ZNT0IzNVV4QWZSSkVXd1NsNFR2SDloNmRpTU9VMnJLMHI2YUN3eWlp?=
 =?utf-8?B?UkRlQW90bm8rSjE5dkRnOXg2RXg0WjFCVVRsSFR0Z2hCZUFpcUJUZVJqQzJI?=
 =?utf-8?Q?JUD6xwFW/LKQQxz421QzjkA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8912618-61c7-414b-3a33-08d9f1687155
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 16:21:53.1970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Po+kZwuMy//R1Bt3sv0dqCw2B+cBWJLQGqr0bNU3Pc+wjLpdYa3O4ReOsTVvRsC9DbYO8aDriqCOy8UgtNA3RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4143
X-OriginatorOrg: citrix.com

Current retpoline checks apply to GCC only, so make it obvious by
prefixing the Kconfig option with GCC. Keep the previous option as a
way to signal generic retpoline support regardless of the underlying
compiler.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v1:
 - Put def_bool before depend on.
---
 xen/arch/x86/Kconfig | 6 +++++-
 xen/arch/x86/arch.mk | 8 ++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index b4abfca46f..219ef9791d 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -32,9 +32,13 @@ config ARCH_DEFCONFIG
 	string
 	default "arch/x86/configs/x86_64_defconfig"
 
-config INDIRECT_THUNK
+config GCC_INDIRECT_THUNK
 	def_bool $(cc-option,-mindirect-branch-register)
 
+config INDIRECT_THUNK
+	def_bool y
+	depends on GCC_INDIRECT_THUNK
+
 config HAS_AS_CET_SS
 	# binutils >= 2.29 or LLVM >= 6
 	def_bool $(as-instr,wrssq %rax$(comma)0;setssbsy)
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index fa7cf38443..2da4bdb1ed 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -42,10 +42,10 @@ CFLAGS += -mno-red-zone -fpic
 # SSE setup for variadic function calls.
 CFLAGS += -mno-sse $(call cc-option,$(CC),-mskip-rax-setup)
 
-# Compile with thunk-extern, indirect-branch-register if avaiable.
-CFLAGS-$(CONFIG_INDIRECT_THUNK) += -mindirect-branch=thunk-extern
-CFLAGS-$(CONFIG_INDIRECT_THUNK) += -mindirect-branch-register
-CFLAGS-$(CONFIG_INDIRECT_THUNK) += -fno-jump-tables
+# Compile with gcc thunk-extern, indirect-branch-register if available.
+CFLAGS-$(CONFIG_GCC_INDIRECT_THUNK) += -mindirect-branch=thunk-extern
+CFLAGS-$(CONFIG_GCC_INDIRECT_THUNK) += -mindirect-branch-register
+CFLAGS-$(CONFIG_GCC_INDIRECT_THUNK) += -fno-jump-tables
 
 # If supported by the compiler, reduce stack alignment to 8 bytes. But allow
 # this to be overridden elsewhere.
-- 
2.34.1


