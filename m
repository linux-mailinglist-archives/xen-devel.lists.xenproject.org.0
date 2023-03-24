Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC326C74D1
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 02:00:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514125.796104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfVmH-0007pU-48; Fri, 24 Mar 2023 00:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514125.796104; Fri, 24 Mar 2023 00:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfVmH-0007mr-0W; Fri, 24 Mar 2023 00:59:33 +0000
Received: by outflank-mailman (input) for mailman id 514125;
 Fri, 24 Mar 2023 00:59:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJ5Y=7Q=citrix.com=prvs=4404309fd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfVmF-0007mh-Dx
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 00:59:31 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f974175-c9df-11ed-85db-49a42c6b2330;
 Fri, 24 Mar 2023 01:59:29 +0100 (CET)
Received: from mail-dm3nam02lp2040.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Mar 2023 20:59:25 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB7125.namprd03.prod.outlook.com (2603:10b6:a03:4e4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Fri, 24 Mar
 2023 00:59:21 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 00:59:21 +0000
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
X-Inumbo-ID: 1f974175-c9df-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679619569;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UOrsXXI+gitwyJteiz5sY36PimzJWGRLR+y7xl4e+Kw=;
  b=L4o0ItBMGn4N4c29Atto0F6En0vJcXeJlsOKhHAiAcdz/xUuiAVB/auE
   MxHvqh38YuGUYE6eaW2CHbpNGURSRkoHfeGibuRlxXIxseNlt0pHystfR
   k1hB1/3XQVL6ckjcOrT1TQFaT5LRZcsVUGdJjhz5h15fNTeJmdeISHKfA
   A=;
X-IronPort-RemoteIP: 104.47.56.40
X-IronPort-MID: 102020412
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2lzjcqAx0p+qhxVW/+jiw5YqxClBgxIJ4kV8jS/XYbTApDhwgjQBx
 2cfDTiGM/fZY2v8L9gkPYjjpB4Pvp/XyoNqQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GhC5QRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw47tIKyJl/
 LsidRMVdRyd3u+O8bfrVbw57igjBJGD0II3nFhFlWucIdN9BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI++xruwA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE37eVxXmjBNtIfFG+3v06p3mt929MND01e2ugqN20rlGUXN0Kf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwB6J4rrZ5UCeHGdsZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaNSUQLEcDYzEFVgoP59T/oIA1gQnLR9wlG6mw5uAZAhn1y
 jGO6SQ73LMaiJZR073hpQyfxTWxupLOUwg5oB3NWX6o5R94Y4jjYJG07V/c7rBLK4PxokS9g
 UXoUvO2tIgmZaxhXgTUKAnRNNlFP8q4DQA=
IronPort-HdrOrdr: A9a23:dmabKK2XCo+MI0mL7dW3kAqjBbtxeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5AEtQ5OxpOMG7MBbhHO1OkPUs1NaZLUPbUQ6TQr2KgrGSugEIdxeOldK1kJ
 0QCZSWa+eAQGSS7/yKmDVQeuxIqLLskcCVbKXlvgxQpGlRGvhdBmxCe2Km+zhNNW977O0CZf
 2hD6R81lidUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpixBiSgSiu4LvaFQHd+hsFSTtAzZor7G
 CAymXCl+qemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQBiTwhh2ubIFBXaTHmDwuuumg5Hsjjd
 GJiRY9OMZY7W/XYwiO0FfQ8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6mI71esMnp
 5j7ia8jd56HBnAlCPy65zjTBdxjHe5pnIkjKo6k2Ffa40Dc7VcxLZvvX+9Ua1wXB4S2rpXUt
 WGP/usocq+tmnqK0wxi1Mfg+BEmE5DWStuDHJy/PB9mAIm40yRh3FouvD32E1wrK7VAqM0lt
 jsI+BmkqpDQdQRar84DOAdQdGvAmiIWh7UNnmOSG6XXZ3vFki93KIf2o9Fkt2CadgN1t8/iZ
 7BWFRXuSo7fF/vE9SH2NlO/grWSGuwUDzxwoUGjqIJ8YHUVf7uK2mOWVoum8yvr7EWBdDaQe
 +6PNZTD+X4JWXjFI5V10n1WoVUK3MZTMoJ0+xLE26ms4bOMMnnp+bbePHcKP7kFislQHr2Bj
 8ZUD36NKx7nzSWs7/D8W3ssl/WCz7CFMhLYdjnFsAoufswCrE=
X-IronPort-AV: E=Sophos;i="5.98,286,1673931600"; 
   d="scan'208";a="102020412"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwoJFO7TfMZAQ4hKom4iy6nOk/Vpg/z3Y5qFwtn1VG7UWYFJpkzzlAQXCs+AfDPGk2cXT53qir3pG6qfdxCKXnEODQR1cAm+S//sL2FgRFWTlcC41mmrGebLxJo9+3VlVqohfCEDFJZakHuxdriLqO873TdHmQNr+Mkr57DT9ivBNQmUXtRGxhKZMhtAGVfTg5SbZuEuTa2zUA8r4pafCPmXEpZeNRpyyw8DJRqca60C/1CMvDOcnRY7ijs0tdzd6cY5GpCxd4Afe51NDR4Qm6c/mNx0kP5Yn98/aGpdBgDyUdSQNEtnV6zLFVWyfiwkUVrgvM7NI0GZCuhpTWtGyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/HrkrxERqn0yUqYmnFPk0U/F1xuWcG6atPbU/wV/ag=;
 b=R4xfWpUnqeRCIIRa8IRTxkkVjCJsuh8i+5eQ/yh/T8lsJlSBBkAZqBxQjuNprRINxIqLz6kFJFcGenggVb7iQQmjZdHJbcBVJxXSeGxlBg3nsn51Sr8ZT83nRmC3Jz0aN/l7syWoyJpW0aaznIzI2aUngAE75FtUhh9as8qXE6KC8Hszk38HxaybMi4FkgcfwvcjG9KUDIEj4JYWv5r+81aR86rqXXnFcsyE8jnRUcH9ZGMlWYG/n/nzzw3iiIF7SFRAUG54qEFj54+0MbfigERg2X/C7ghjJu+SBKeJVK8JOCahLkP//rXhpJSfyYcds9NMdWJJZirUkTJ4YWeTlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/HrkrxERqn0yUqYmnFPk0U/F1xuWcG6atPbU/wV/ag=;
 b=l5GarpyaJS9OYg5Gm0w514fjVJY2bBa9CQDojdfmi28mNVWSrxfCBqsHyBrfar6gMRg2L3sYoBcMFbPyY9ous9zECzeWIO4PZmcg79Xx7PNbJ0luAyegZwHcJtnxHij83i5rnZdoyC/mZfRUrZNwU8zdGM0POTcoB6w0n8wbpVE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6f59d2a4-fcb6-77a1-2cd4-51e032fc80f4@citrix.com>
Date: Fri, 24 Mar 2023 00:59:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH] x86/hvm: Improve hvm_set_guest_pat() code generation
 again
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 Edwin Torok <edvin.torok@citrix.com>
References: <20220810133655.18040-1-andrew.cooper3@citrix.com>
 <74d0425a-a206-2bcb-50d6-e5bb4c5e2bf3@suse.com>
 <77198021-f45c-9d75-c1da-5022d3ca99a2@citrix.com>
 <1eff8db6-c358-9597-6096-0a1312d59712@suse.com>
In-Reply-To: <1eff8db6-c358-9597-6096-0a1312d59712@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0209.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB7125:EE_
X-MS-Office365-Filtering-Correlation-Id: 5173c725-9dd5-453d-45c1-08db2c030072
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qR/V7+XKGPlGms3odIVoMIRs2vnauZwdpOayS2fc3TxgSNRqoiIz8ynMojFMEpNrjLz+YXI85qpdRGKKq2HjrEw/79uPZ1bqrQfmRKVvltZPj/kuK7i4LW9k5nFpnhX9STwrHe7P6+ZoT5Kh9k++kfNugz4+wbMZe8C+DPmIm8FJWtOnGyXIz1GUT+RUMLYe3pedP7dH9CuwMvYuCoMG4NAJ5dsfhXFsc5WEubEbznRVtXEKAQdnqlNfSDMDIAYskSE59zyAgVPui7VnwhTpu+16M8J/oys2OZRkMxBttVON5h5HlnSnqhv6mQyHcV3ksCBTNb3SpbXXT/PyXHWpfLfZlm5U8PnuFizbZ3Vzu4zENp3k2a4KpS4QaJA0glj8SVGvEohP3k3+RbHjkqw88OLi2mzSLcPPmdPypy/mlalklXMCqkiJfj4tbq6HMNx/JVK191QJcyXIz2rRCdOv2U5LNBVXzNCUPfQ8nlqY7f/qEwoReoCTxNO97ujHNzsOWqKVaubvB1yeOULHaEKInBfdN+ltQXXh2JYLi3GvZWXeZ1tNytfTxpDTady0Q9wzlpzoPteC0MAsCz0wTejSNDTqeMcvtTzKPsLrdlIlWDVfoIkFEziYU5SURexpKUQwKQuf1gkIWtAcq0lyohiLloK8/0zIAjDpLboWL7lYmI9BXu5aHeXBOwaJGZeVPUklXi3csDaW7+mY5bx3BD9YkflcCOAEJXF+6Cy4EYi7Ux4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(451199018)(36756003)(8676002)(6916009)(66476007)(66556008)(54906003)(66946007)(4326008)(41300700001)(5660300002)(82960400001)(8936002)(316002)(53546011)(26005)(6512007)(6506007)(6666004)(186003)(478600001)(83380400001)(2616005)(6486002)(107886003)(31696002)(86362001)(38100700002)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bE5kMFdvbzR3N3dDTVFicHhQUFFUQkVlcmNuMHhyZm9UTGo0dUNZRnBZWWhV?=
 =?utf-8?B?ZE9QS1NobzhmbXBVVFI0YmVoSFFGTm9jSWtSNERKM0pTSGNtS2JEREZNcE5S?=
 =?utf-8?B?dXdwVUdaSXpoZ0V2VGtaQ3BCeGQrcEg0ekpYR0lwREozZ1ZDYXY4N3ROWm16?=
 =?utf-8?B?bnRGbzhPeThSb0F6S2RaSDlSTWtDT2tGWHJZQmI2ZWljSFpzajVKTjcxVnpK?=
 =?utf-8?B?RlVaS1VBUHpKSXREVWtSMlFPMk1nanphREdPY2lPeUUwdS9yUXIxVno2NzFl?=
 =?utf-8?B?ak9mQ0FDWmp0M0Y2bm1SSXE2ZGNrZUhsMU5iYVkwWEd0eWdEMGNPM3hQaDJF?=
 =?utf-8?B?QVRRYk41Uk5Ubk9BSXpXdFE3bHF6ZDh3dXNLYlZzaVNocEF2cUNYUml4TnVN?=
 =?utf-8?B?a0FBT0VhZWpKcmpZc0xHWHEzMEdWZ0dmekJDU3ZmaWVSbTFQMWcxeEZjSzkx?=
 =?utf-8?B?N1VaVXlFNVhsek04bSs4YW1RVSsyY0Y5YTVMeGhGWERqYWg5dkdIVFkzeXdR?=
 =?utf-8?B?bHpHOVcrRk1mR20zcjh6aksvQnlLS1JkZUlPVTh6TWgzMTNHRWh5UDdZZEQz?=
 =?utf-8?B?Z0I5ZTNFWEhITjBDcnh6dXdwSy9JYzdWOEVoVFVjcHFGWlo5aFVuNWpVVmZk?=
 =?utf-8?B?b1NjZ3AxbWRxYm1razlLTTZlU3kybGdFMTdhRGVJUkVjaWhTTXcwaGx4cWE5?=
 =?utf-8?B?UmpwNVZoWWxCZ0FuNjBKL21kM3QxY0NLbjEvZitVZzhqSjhwVGJPS1pyTWov?=
 =?utf-8?B?ZzJZRkJSMGc2bytyN2tvaTRjOFJubFRteTgxUmdPQ2pBellKV1F2MUo3UUdU?=
 =?utf-8?B?YnhwdUxURjk5QklaM21hZXV5TWdzZ0VCT0hrQ1dyY0kzcDZya2lPSVVwT1Zs?=
 =?utf-8?B?Y1pscVBvZkE5UnN0cnJVYUhCa0xhOEFXNFdQSDVhSld3UExBbG01R0ZyaVdY?=
 =?utf-8?B?Z0JoZEJqRXBiOVZoNXA0OXM2aUpCbzl2MFBDeHNIaVYvNHJ0SHBCZXFqSlF5?=
 =?utf-8?B?Q0t1L05tdWoxK1IvM1VYamh0eWtzdjdSbW5OMlozajU2Zm9VOVZETU5leUhF?=
 =?utf-8?B?VS83elBiSUFVRTBJakFmRnZyY0VSUlpmaDVOSXNQQWl3RzFnbjVneDV1Q25Q?=
 =?utf-8?B?WGZGZnRJT1I2ekU2QWFaTmNoN0pVTTFaQXZMeDFrZkVZT0NRUEp2bVBtcVdO?=
 =?utf-8?B?U2diWVZ1UE5GVjZ2aVhmclF4QjNlZjFCRHFmRjcwazJFeEdRN3EyMGc4aWRl?=
 =?utf-8?B?SjY0UTFOeExZclgvSkdCU2VJa3NENXVWNEd4S0dSKy9LOTcwbHJKZUlRcTNF?=
 =?utf-8?B?MVdpSXhrQmMwajRwSldKamVpZjR4NkIrVkV6cDMwQk5WSFNDcm1FaUlpYkpM?=
 =?utf-8?B?WnVUY2xtbDNEZFliSCtTem5UT2JrWlNnVDU0S3p4WHZUR3RwKy8yMXFOWm5V?=
 =?utf-8?B?eEs3UU8xWm8zQ1BFaGtJOUwrdHNPMmpTamx5MWtjZnhNVWxqZzFsaVFGVWZC?=
 =?utf-8?B?NjU2SVY1aENpOGN1VkJlOWF6REUya2dSYjNVTDNYbkEvbTRVdHh4cm9qdUhu?=
 =?utf-8?B?MFBQTHhaOHNzOWh4VFlIYlJGLzhtREIxYXhkK1pENU1QaVdaTEI2SUtaRUU4?=
 =?utf-8?B?WWZnazZ3UkFBbmtnc2pvZlEvMGtaaGluMU5qZWk2WEF1L2FONkduUzV2RDNK?=
 =?utf-8?B?anh5QktnT2xKeTJXc3h3OUo0Q3hTSmprak1TSkFKc0JtSDJybkIvM0VzUGNW?=
 =?utf-8?B?VFNFRGFiWHNBV1lBR0p2YXVPQ1F2dFAzdDByU2VMUnprTTN2cVJKRlVvRzAy?=
 =?utf-8?B?UkYvRjdJUEltL1YvVG5rTkk5TFB0eVRwWTdKdkE1U2gwNnErOUtXZThHT09y?=
 =?utf-8?B?Ukw2azdXNDZmeUtCTWRVUzFuSUZkcnJyOVEza0xXZWJyRzBCa044amx5cU0y?=
 =?utf-8?B?TklZdnk1YnpjOXpTN1NzUHl5M0tPNjJKYmlwbHVCYi9sOXZEYm4zM0I1aVNZ?=
 =?utf-8?B?eG8zTGRPVTVzZGFESStBZnNubm1TeUFMNHpNcHNTK1BvQTZoTGRCK29RTVgv?=
 =?utf-8?B?alVVTCtDV0NpQzlCdE5GRXBPclVibUEwRDZIcmZtdUErRnprWGRITXdMRTdH?=
 =?utf-8?B?ZTZqNjRiNGUzWVdkSTlmdDNuYlAza1oxeVM2RFVXamtVQW5ZZmxsTE9GWDk2?=
 =?utf-8?B?SXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2pG4LvWLoG/eXGrGIhrt+OysiPTYSSd4X2xkSBXSRmj2Xufpn95w8f3PPcOgn8qExy7LS6f30WCkcp4+NR5jETzS6f189+58S8WAmDJfAWQgwmEcC+pUmZi0C25QMA26Fp7KGUSwzuWNdjMsIKlF8d6f6L30a+hHeUC3WFrW1h3vzzxUa5MI7XxDQtzpkAoSkT22MKPf8SoiahEjwm9mUvwFNPMiD4QfqqhK3f3wgftaPDMQT43QS+YXe5PmRdSp8bIYFwKMXYjiXEqICmXLAw0dpseyxCmVGhiZf1bEGxktbnG/AL1VPTzbQ40PcC5l4S+IE+JKfav17gNs6w04sWAqJmHXxvfb6vnntJFVtNFIAAhvsD627Wv+HLdvTRb8PN6Sy9VNg6MdwsdWnF6HcTznZ03GQkEl1DrIBgJiXKL1Hh+Uplvsf0dt/LPz82UNbie0sfd9x2ngrFRoF4VoedtdBI59YzaRbQuNX9cG1GCM54jX87JqKnMXD45PhWhjNlE4JhvxHa4W/aiYKDartyLFtjcvYES2M35uEEa95FDOy3IRElAFm1XbGcW4GmYg4ooMWpE/qN0s75ictVrlzRbmxUwV6PdiO9EU3g9O2dc/B1sAXPl1LYlBExnmsZ+3kFSbAmTYiHds9CEuBHT5ooEgiQNdO35guD9yCg5vXvupAAGnoDlCx6rnCosW2O2vFwtISglj0zJC3tz6bRbsHGL5NfmOdROKxwD/g3zpPmldfp5XPxDt9xJhnGQRpD+kFINwsZSEigP6zE2WlP6CIudF6NFbl5lReYwq3Q0pzggqOHP1+4n3H50o2n9ybdNQsoEQk4by7ZQMJnf1lYL1Y6Kh/xi7tBJwynvr+Xmqtlcx7RCdHLd6d102qGKY08Ng
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5173c725-9dd5-453d-45c1-08db2c030072
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 00:59:21.0819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCFqCBWFAJvz24HXvlKhWcqUeNJqTXTUH1pRfMzO9+iDmBwUeYyzuuRwQVivZnnyDjrc4XhNe2Qm0CH6HVKFLXDAnFBpTkZQlucXvmNup/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7125

On 19/12/2022 7:28 am, Jan Beulich wrote:
> On 16.12.2022 21:53, Andrew Cooper wrote:
> Again - one way to look at things. Plus, with Demi's series now also in
> mind, what's done here is moving us in exactly the opposite direction.
> Is this hot enough a function to warrant that?

Yes - from the first cset, 9ce0a5e207f3 - it's used on virtual
vmentry/exit so is (or will be) reasonably hot in due course.

What is more important in the short term is avoiding the catastrophic
code generation that Clang still does with default Xen build settings,
also linked from the commit message.

>>>> --- a/xen/arch/x86/hvm/hvm.c
>>>> +++ b/xen/arch/x86/hvm/hvm.c
>>>> @@ -302,24 +302,43 @@ void hvm_get_guest_pat(struct vcpu *v, u64 *guest_pat)
>>>>          *guest_pat = v->arch.hvm.pat_cr;
>>>>  }
>>>>  
>>>> -int hvm_set_guest_pat(struct vcpu *v, uint64_t guest_pat)
>>>> +/*
>>>> + * MSR_PAT takes 8 uniform fields, each of which must be a valid architectural
>>>> + * memory type (0, 1, 4-7).  This is a fully vectorised form of the
>>>> + * 8-iteration loop over bytes looking for PAT_TYPE_* constants.
>>> While grep-ing for PAT_TYPE_ will hit this line, I think we want
>>> every individual type to also be found here when grep-ing for one.
>>> The actual values aren't going to change, but perhaps the beast
>>> way to do so would still be by way of BUILD_BUG_ON()s.
>> Why?  What does that solve or improve?
>>
>> "pat" is the thing people are going to be looking for if they're
>> actually trying to find this logic.
>>
>> (And I bring this patch up specifically after reviewing Demi's series,
>> where PAT_TYPE_* changes to X86_MT_* but "pat" is still the useful
>> search term IMO.)
> I don't think "PAT" is a good thing to grep for when trying to find uses
> of particular memory types.

This is not a logical use of a particular memory type.  Being an
architectural auditing function, the only legitimate use of these
constants here is all of them at once.  This is the one place you firmly
don't care about finding when asking the question "How does Xen go about
handling WP mappings".

I have swapped PAT_TYPE_* for X86_MT_* now that Demi's series has been
committed, but that is the extent to which I think there are relevant
changes to be made.

~Andrew

