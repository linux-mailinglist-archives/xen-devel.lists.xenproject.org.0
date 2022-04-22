Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF10750B5FE
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 13:15:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310831.527778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhrFn-0007yY-Mk; Fri, 22 Apr 2022 11:15:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310831.527778; Fri, 22 Apr 2022 11:15:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhrFn-0007w1-JZ; Fri, 22 Apr 2022 11:15:11 +0000
Received: by outflank-mailman (input) for mailman id 310831;
 Fri, 22 Apr 2022 11:15:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QJ8Z=VA=citrix.com=prvs=1040bc4e0=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nhrFm-0007vv-69
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 11:15:10 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76dce5cf-c22d-11ec-a405-831a346695d4;
 Fri, 22 Apr 2022 13:15:08 +0200 (CEST)
Received: from mail-co1nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Apr 2022 07:15:05 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB5869.namprd03.prod.outlook.com (2603:10b6:a03:2d4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 22 Apr
 2022 11:15:01 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 11:15:01 +0000
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
X-Inumbo-ID: 76dce5cf-c22d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650626107;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=sdM0juol54++k7mEDcS/69RVsc58WDJPxPBHiAz/YR8=;
  b=V3XgkmLZGEdgNSUrKbPLdeiyEQz22xScQmXGSE6EPBxCoJF8OLW48/Sw
   bFT8+VfXNhShZFdvzE3VjqhPUQp7NexhCAde1wgG2+tuRFM9r4qK03nlw
   iH8qgBSgUGkpszY1q0XiglXnUOr7Ibci/6qXrcIx2XSCjs3nhjhxXd6od
   0=;
X-IronPort-RemoteIP: 104.47.56.170
X-IronPort-MID: 69093561
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5HFKNq82OAJeMERzW9FnDrUDh3+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 jcZUWzTPPbcYGDzeop1YYng8kMBvpfSnNBnTFFv/Hw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw3YLjW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnb6RTzYsJ/biobs+YgRpGQMkFpZ86LCSdBBTseTLp6HHW13F5qw3SWoRZMgf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHvuMvIAAtNszrpkm8fL2f
 c0WZCApdB3dSxZOJk0WGNQ1m+LAanzXLWwA+QnI+/NfD2773lAhl7LEL9fuUfuoXudMgXvfg
 0/f8DGsav0dHJnFodafyVqujOLSmSLwWKoJCaa1sPVthTW71mEVTREbS1a/if24kVKlHcJSL
 VQO/SgjprR081akJvHiWzWorXjCuQQTM/JSHPc98xql0bfP7kCSAW1sc9JaQNkvtctzTjtz0
 FaMxortHWY27+XTTm+B/LCJqz/0ITISMWIJeS4DS00C/sXnp4YwyBnIS76PDZKIszE8Ihmoq
 xjikcT0r+x7YRIjv0ljwW36vg==
IronPort-HdrOrdr: A9a23:9ajYq6/J4Y3/PRHVW4Ruk+FEdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdgLNhRItKOTOLhILGFuFfBOfZsl7d8mjFh5VgPM
 RbAtRD4b/LfD9HZK/BiWHXcurIguP3lpxA7d2uskuFJjsaD52IgT0JaDpyRSZNNXN77NcCZe
 yhz/sCgwDlVWUcb8y9CHVAd+/fp+fTnJajRRIdHRYo5CSHkDvtsdfBYlCl9yZbdwkK7aYp8G
 DDnQC8zqK/s8ujwhuZ82PI9ZxZlPbo19MGLs2Rjco+LCnql2+TFc1ccozHmApwjPCk6V4snt
 WJixA8P/5r43eURW2xqQuF4XiU7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBVys
 twri6knqsSKSmFsDX25tDOWR0vvFGzu2AenekaiGEaeZcCaYVWsZcU8CpuYdo99RrBmc4a+d
 RVfYDhDK48SyLbU5mZhBgk/DWUZAV9Iv/cKXJy+fB80FBt7QJEJgUjtY4id0w7hewAoql/lp
 v525tT5cBzp+8tHNZA7bQ6MLyK4lKke2O9DEuiZXLaKYogB1Xh77bK3ZRd3pDYRHVP9up4pK
 j8
X-IronPort-AV: E=Sophos;i="5.90,281,1643691600"; 
   d="scan'208";a="69093561"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEsoZUdkCGwK/BlNc0MJBdHxI5XwannbkH61LgcoD3JqYaskfuuxHdwp/PicwSYujbIb9i7KBuEcuTClQiSGdRhE2ZC8f5AudYJCSEXaZXToHrWJKCEtWpym4WYpmOksDe1I5PBJs7RErWYr6L0FY+kWn2Rw+r7YT4ZoDFzyFzcDsFGh2Ggwzn+tjdnr85NvECeQAydJYbg9VBdBREe/1shJR3c2HTpvAjV9Y13E7S+jSnxt2m1FkQ+Xt9BKZsrtBn5IvajIgWIgNgBbBbdlq+ffBfehhG9P/3i2wgfsGVeDYP4GU7IyxlNaQuFW3gej2/OQiJVlMYwTsccRW6tvMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mI5SyJacBSCo/wsyoSwR7GL/vzZDlGFK/IuOZiuFVso=;
 b=k6/KEEsm2ajTq5Yx5nu79l2XFkbnonwDR1zMtipQZ1dRKI0A3kehpl04j0FSaLUniXM1C7qR4bvy/9H7FaXFovnHrM9R5CIX0rHeWM6+YOQDo4TECg7Rk1P4GWQIE7O88v9GOCgFFJwbk4B4vPvIjR0rEeyEjL1VGat9fWMq/eEK8n0+MPVm5DQjWSKwLbkxcWTyUeRHaw9fMuV09GdQcxGa9MMzH+Sqf031mvhLDyyKN1cbWBvedUIre4BsDJDfbz7nH9myEnn8PY7xs3XnNqO82eELq6Ev5Rl7urKJTpMDC7j5BL+H/nqHI8ZR9TdTg+j2OO5vdT3Cu56fNjVtoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mI5SyJacBSCo/wsyoSwR7GL/vzZDlGFK/IuOZiuFVso=;
 b=eHWZXbWO2lIoD0qF5erIL+sXMZi5TP2SjAq0Oc2JKKw3v/w2fg17yED5Diip87FuPJVGP/Ff4e9aNXAklpNa0bM+sbQh0WXFnT0scsvNxbRg0TAb0NMNJSyvPVOlTlVgoWtVVB2a+mhczltZVc95t3yIrp7QQrPwW8DxLIvTvzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 22 Apr 2022 13:14:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC] x86+libxl: correct p2m (shadow) memory pool size
 calculation
Message-ID: <YmKOMC1TcQQUB6Lx@Air-de-Roger>
References: <c5844665-8ed7-d91f-a41c-9e4eb3e2bcc2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c5844665-8ed7-d91f-a41c-9e4eb3e2bcc2@suse.com>
X-ClientProxiedBy: LO4P123CA0495.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a16d040e-5a58-4110-9ec0-08da245157e9
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5869:EE_
X-Microsoft-Antispam-PRVS:
	<SJ0PR03MB5869923AF1B0CE344D693AE38FF79@SJ0PR03MB5869.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oJ/WYLDMB8d9a9GaO2QuEUM7FxTHjocm1tE8uL15r6JWgP+SmkRq6JIgaPnBRY9kj1lfKpyVjcL858ycLJZI6ONGDnR1Fo93QpGoPIxRRwPkLPSr4eweML/yeAQcvGl/dyadkmgsZYAy05Gnna85d0rcbiF4XLomthJpOxZJCfzZkeRAYxGJLp3A+Bdk+aGSEeYvdADpm+CDjcS37igV1JV3KeeRLO0VIZ7pDLjPQkcxgLjNf8gSt5ZKR65l0kH+ePlQhwi/FWKyATMuzQNzyNplcaNvUhafA/z0Ri0TEZZap3lSI9OF+3wD9nDmscmKTSxXJ63WJ4QSlTCWMZNJBGyHhvL85nls7OIr+3HZolW9vNgRmmDDy3mkT8mUAFyHHfw2iK/7/HqqWuNvtiamEU+Zl3+iahVHThZERsX9MWudq+Wis11CF5XYlmOb19tE2c+cIFGvSWeMFbLYzS49U1p81mAKhht622GkxN4p0lA3qzRmR31cfG/BgvenH6g4nNGR23M+3xTNMCnttuz51IhMrmBIwbw3Obh2CgiaE9Z1H1rYqbqkw8uy/TvEvE/KKVS+oLbP7M9Qg0BdtowIMmxuSd9cequ4GUwDaQ+1Tx7SjXYYQi+FzqdXegsyq/1H0wZMV0wgSOQy6Ayd07RrjQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(38100700002)(6666004)(6506007)(6512007)(186003)(9686003)(26005)(5660300002)(6486002)(508600001)(66476007)(8936002)(83380400001)(66556008)(33716001)(82960400001)(66946007)(2906002)(86362001)(6916009)(316002)(85182001)(4326008)(8676002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTFmMDZQSVFMZGJIQmkvQmVIUUJSWnBaUlE0QXRzQkhXSy9RZWVrTnhlNDB5?=
 =?utf-8?B?S3dHa1NtdDNmSzcxUXRMYjhrRXpxeTRpbE1PR25VM0krRCtWRGhCTkU2RzBN?=
 =?utf-8?B?ak5SdW4zOENaUldaRFV1eFU1QWFEbTE0QzdWc1Q5NGpPdDVTT0owSjBMVnhS?=
 =?utf-8?B?QVZ6VXcvVTdjS05wRVpEU2dWSDlXNDY1T0c4NTE5Z0NqMjZPN0t4enAwVExC?=
 =?utf-8?B?RjB2azZJbTVvRU1Rd0FSekxpTk82V3BlM25iVmpaeDVXZGtKZHNDSXBrWW1w?=
 =?utf-8?B?QUd1enIreE1SejlEM0wvZWpMUDhSK1NVbkVaWW4yWEhlRzJCdnZ6OU8vSktJ?=
 =?utf-8?B?K2J4aVJ3MVJLZE1maGNFN256QUhXZWFlR0RtbGlaY2IxMHMxblRIMDg5RENv?=
 =?utf-8?B?cmxWUXBEZVhzK0hBQ2xvdkZCa3lpUHlWRGtRUDgyQ1R4bUhhM09NVHlKU3Ro?=
 =?utf-8?B?d3pmSDZXWWF1aTduT2doZE1JeFp3cVNyVFpzeWlPaTUvMnhWU1FXNGRoam41?=
 =?utf-8?B?emRVL3h0bEZ6OWVkcVRQWll2UGhYZ0I1QXAwbjJFRE9jVE9KM0ZGVUFPcG1m?=
 =?utf-8?B?Wmw3eXlmT1lSSEZ5V0dhZ0s0V3VWSzhRSDFvRVRhOU1jTzZBY0pCemkrNi9p?=
 =?utf-8?B?enBhSWM4YUFENm1VVDduK2V4SmU0V041c0txbmx6TnQwdEJUcExqR0w3WUVF?=
 =?utf-8?B?U2xFV3cweGtGeGpjOVZoa1ZQcUpUQytmLzBWSS90QWRESlZqUW8yTmpEeWti?=
 =?utf-8?B?ZC9wZEJBSkR3U1RtUk1tQUhOaWNBbXBtaW1aY0U4Z29uMU95S01YblpKQUln?=
 =?utf-8?B?NndaTFMybmVoeUMwM2dZdXByK3IxWVQwcFFQUEd2bzFsSDFtTEJMWERPVnBu?=
 =?utf-8?B?cWF2QTI3RnAycEs5RVJoOWZnZU1NdDNqNENEWUNkNFE3cmt4SEFvMnk2K2tX?=
 =?utf-8?B?SmRTbkExbklTeXV2L2JCSFZpMWNnTDZDRENQay92SStOaWJYWEJrVGkwSWlk?=
 =?utf-8?B?RHdnRFUzV3ozYnkweVFvVFpwVytZMjdldmhMUmJkVjZSRU9mT2xmQUY0K29X?=
 =?utf-8?B?aDhTWU9Jc28rYTBSaXBvZ243Sis4N3lRbGE3SHV1TFA0aURXQXFGTDFPNElD?=
 =?utf-8?B?VTBDdURhb3lhNFQwbHdxaENiMmc3Y2IzbEo2ajR2MnZMV1ZpdDRyak1TT0U1?=
 =?utf-8?B?MFIvTEtoMUdVL2RhTmViLzFDUWprZVExczZaL3RZWjF5SnBsV0RvZWNTeUcr?=
 =?utf-8?B?WnN4MmV5VktQNWVRWm5oVXFZaHE1ZHZqUklLUTlPOUdOSFYveGEwNmo3SFdT?=
 =?utf-8?B?bDFuZ2xxZS9pcmxRbXBTOTZrOERRcmFMV0diVU5JZWdzeG5WUjgreUhXNTRF?=
 =?utf-8?B?K29mSk1UNFZBMDkwaXY5bGtybWdpWjN6ODlJWlBQdlVnN0xQTVl6MlJ2VmdT?=
 =?utf-8?B?M3ovbTNhUEJlRmpqWDVaYXlUSWJObFhHM2RIWGZuUUc1ZXhaaC9IU1RldnVp?=
 =?utf-8?B?c1RFTXVOMTRoQ0QrY0llWXo2cGdsWXEwaVB4a1lsY2RCaDVHVTNzNERURVNz?=
 =?utf-8?B?SGpPN1pvNDIzYTVIcGpidjlHYzMwYkwvQ241Ym1QZUxJeVl3VnNlZUZSL3kw?=
 =?utf-8?B?YU5XdTdlRjlleHdxRTBjUmFkd2NvYlNqcklvaTlJMXlXL1UwaTd6bDNiSHlt?=
 =?utf-8?B?S1FIeEtuTXBjVHZVdHZ0LzdJakpHTjZqbGJZZ1JQYjdqRFBrRlFVOVA0Mllu?=
 =?utf-8?B?Sml1eFpnZzBNN0FWaWRiTlRjTnpEN2hsemhLQ1NIME5DT2cwNHZRNVc2SlBH?=
 =?utf-8?B?blZscks4RC8xM3M0S3RqVmVENzRQVmZyU0tEVVZVaU1MdUZsVUc2V2tzWkpr?=
 =?utf-8?B?UTZURXd3bjNldkVDaUMrcStDdlZRQUVZVW5EMUsrUHRaYnpZZGdHK1VEWVFr?=
 =?utf-8?B?MjRnYmtvNUE4a3VWNmVrb1VacExyYUZxOFFpWUxqQkJBY0twcmFLZGc4K2FU?=
 =?utf-8?B?MXloQ2k0TWM2QzdwSFJmbWUyM1JaT1BtU3IvSStiTnNDVis1Sk9EdVVjaUNZ?=
 =?utf-8?B?elpJbGJDYU9YaXV5ekhsaWdneGswaExidmZsTSswRm8rRDNyOW10YXdjbHRP?=
 =?utf-8?B?WW5HcmdyZFZVRWJVQjd4VWEraDdMTWo4SWN5V3NDZEYya2ZpSC9UN3RTbEFh?=
 =?utf-8?B?SXdqRHppaTVIWWVMa0UrUUMyaVF6VUlpS1NQT1ZWNm5vK091c08xMDhlcGVt?=
 =?utf-8?B?KzR5VlJMVGFHTjlybzBqU3l1TE5HeElhYmFGM1V0cHpiWWdPaW0rZVRkZEpT?=
 =?utf-8?B?eHNXWDVPaHhaRVNJYk5YOHl5MmxsUG1hWm14RkVuN3cwcFBOTk9XUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a16d040e-5a58-4110-9ec0-08da245157e9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 11:15:01.4256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2abOXCmwQwYg9qW5PRCKQd41rNTChbsV9EX5uFPNz/taZLeB4qs2Cj0EQnvRFi4z78pWG7G1pWKqINb+gXO6jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5869

On Fri, Apr 22, 2022 at 12:57:03PM +0200, Jan Beulich wrote:
> The reference "to shadow the resident processes" is applicable to
> domains (potentially) running in shadow mode only. Adjust the
> calculations accordingly.
> 
> In dom0_paging_pages() also take the opportunity and stop open-coding
> DIV_ROUND_UP().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC: I'm pretty sure I can't change a public libxl function (deprecated
>      or not) like this, but I also don't know how I should go about
>      doing so (short of introducing a brand new function and leaving the
>      existing one broken).

You have to play with LIBXL_API_VERSION, see for example:

1e3304005e libxl: Make libxl_retrieve_domain_configuration async

> 
> --- a/tools/include/libxl_utils.h
> +++ b/tools/include/libxl_utils.h
> @@ -23,7 +23,10 @@ const
>  #endif
>  char *libxl_basename(const char *name); /* returns string from strdup */
>  
> -unsigned long libxl_get_required_shadow_memory(unsigned long maxmem_kb, unsigned int smp_cpus);
> +unsigned long libxl_get_required_shadow_memory(unsigned long maxmem_kb,
> +                                               unsigned int smp_cpus,
> +                                               libxl_domain_type type,
> +                                               bool hap);

Iff we are to change this anyway, we might as well rename the
function and introduce a proper
libxl_get_required_{paging,p2m}_memory?

It seems wrong to have a function explicitly named 'shadow' that takes
a 'hap' parameter.

If you introduce a new function there's no need to play with the
LIBXL_API_VERSION and you can just add a new LIBXL_HAVE_FOO define.

Thanks, Roger.

