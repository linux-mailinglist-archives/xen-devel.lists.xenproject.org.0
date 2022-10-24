Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96987609DB0
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 11:16:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428777.679263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omtYj-0005dt-4n; Mon, 24 Oct 2022 09:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428777.679263; Mon, 24 Oct 2022 09:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omtYj-0005b7-20; Mon, 24 Oct 2022 09:15:49 +0000
Received: by outflank-mailman (input) for mailman id 428777;
 Mon, 24 Oct 2022 09:15:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kmwR=2Z=citrix.com=prvs=289ef416b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1omtYi-0005b1-8Y
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 09:15:48 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70a719e3-537c-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 11:15:46 +0200 (CEST)
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2022 05:15:20 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA1PR03MB6497.namprd03.prod.outlook.com (2603:10b6:806:1c4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 09:15:18 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5746.027; Mon, 24 Oct 2022
 09:15:18 +0000
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
X-Inumbo-ID: 70a719e3-537c-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666602946;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=f4CL+ZSG6e/fVrBBWOzcAwZ1/nz14wSE5gXp0QWqDlM=;
  b=QU9foz1pmCjhT5q1UHBnkRT4TeeK/dvgu4CGLIRZhtexDgxpR5hW1C7V
   OOdCgVvEZmfN9yDt4yhv0PTppb3gPZJhKV3AMHDAg0MOEaNWgzOpaZzoe
   Vy7S/4A/PP6RlYMDsJ8QvZaZeX9FBpADbpHajbv2z2UiTUeNJ/eI2a4MF
   M=;
X-IronPort-RemoteIP: 104.47.70.105
X-IronPort-MID: 82460059
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4hCEZKNovd7QtevvrR2/lsFynXyQoLVcMsEvi/4bfWQNrUpxgjAPz
 2MbW26Db/aCa2H1ct50btvi8k4BuZaBnYBgQAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglbwr414rZ8Ek15ayo42tC1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eZ6sE8fR6Wnt15
 ds2MDRXbkDZ3MGz6efuIgVsrpxLwMjDGqo64ykl5xeGSPEsTNbEXrnA4sJe0HEonMdSEP3CZ
 s0fLz1ycBDHZB4JMVASYH48tL7w2j+jLHsH8BTM/fdfD2v7lWSd1JD3N9XYYJqSTNh9lUeEv
 GPWuW/+B3n2MfTPk2bbqirx14cjmwvYYIwZHuGo6sdLw2ezwHA2NTw8aHyS9KzRZkmWHog3x
 1Yv0jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcL8wwufHHlCcTdHZ/QvrspwTjsvv
 neWm/v5CDopt6eaIU9x7Z+RpDK2fCITcmkLYHZcSRNfuoG+5oYukhjIU9BvVravicH4Ei3xx
 DbMqzUig7IUjogA0KDTEU37vg9Ab6PhFmYdjjg7lEr7hu+lTOZJv7CV1GU=
IronPort-HdrOrdr: A9a23:c9eIwK+Uz/SJnxCZisVuk+FDdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdhrNhRotKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtJD4b7LfCdHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaF52IhD0JbjpzfHcGJjWvUvECZe
 ehD4d81kydUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInty6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXkIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6W9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfF/9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmc0a+d
 FVfY/hDcttABKnhyizhBgu/DXsZAV4Iv6+eDlMhiTPuAIm30yQzCMjtb4idzk7hdAAoqJ/lp
 T525RT5c9zp/AtHNNA7cc6ML+K4z/2MGXxGVPXB2jbP4c6HF+Ig6LLwdwOlZKXkdozvdAPpK
 g=
X-IronPort-AV: E=Sophos;i="5.95,207,1661832000"; 
   d="scan'208";a="82460059"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ArVaPxWpqPb9SFArRn6rpsgenIDAwx6ATNSAcqtHjMI56GaKwbgwYnysQz8o3aqhaXwHji6uClbwtGVe/rQ2ap1UEWG4/lP2Kf+QcNfOX7GUbnAg05HqeOZnsOp2OnYrPBCuKsohYp66lC2ZP6xAbSf6yO6u8zHMPGHccJewPfb4kR76WSFbwklDEaoGBSDKX675u5sMDrHJAQY7zJxfLEX17OP/oGb5WIxJ2IB8njaGVMCoTgSL62CbUe49vP8HNbGUDEEyHwJAQh66jtzsUkxuHBwpj85dAo3dicSwDrfZHG5NttPH2FtxsXIZzaGArC0ISPWkzTTLXXk5gjX0uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5+1lkwkbKm2lGolHyPNAs6iJWgMx/TbQAUcDeuqN1A=;
 b=guUKlhrB0IGkotBWZgl+a3YY+bwsiP++b5d9U/j6EFvuOZtxEStdHEgYQx9wYR3mzm7GlDxwxQtTpTysOh7jcoiWUxSFQ8GSKRxVD4GI0tB/bPqJs0KGOE6N5O6mzyTVD6lE77XjlY0RL9EJ+ZpoSa1HFGG+MsAhOIeD8jJR3XnL9eBqJnYuosBktCce/YWcrb/wtY3dAZhNB3b8bNNcb5fyZE3cnZakACFWHYmiZM4HzJ9RNA8BPmLtEO3QxUzXFxLYfAIZ59xf9ydYc5BdLlw/WTr8WlF5mrYbHb/VIh7ZgOx41kmF9SzAyGPTbFET9SzuB7APdLfQ0CermSn9gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5+1lkwkbKm2lGolHyPNAs6iJWgMx/TbQAUcDeuqN1A=;
 b=Jb2TfJ8+jYTW/zPtc/ONzVdtY4pjZdFfIqq5vCifd4c4sLe1VQjIIp3YCKrZ2pWkj3u6qlxWv9H8Zp2VtcWWQSBAwGtz6dcSH2xt9xPbLH5zBBmVJGWvCD7w8F0ApiEAAjidRk9OuzQZz22Q8CFUTtjcBoHPWCcNKe21iWTICpQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 24 Oct 2022 11:15:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Henry.Wang@arm.com" <Henry.Wang@arm.com>, Wei Liu <wl@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH for-4.17?] test/vpci: enable by default
Message-ID: <Y1ZXoRkvgKxiMdZI@Air-de-Roger>
References: <20221020102706.29267-1-roger.pau@citrix.com>
 <ba118539-4c07-d03a-9b52-a7a45e3d16f0@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba118539-4c07-d03a-9b52-a7a45e3d16f0@citrix.com>
X-ClientProxiedBy: LO4P123CA0157.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::18) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA1PR03MB6497:EE_
X-MS-Office365-Filtering-Correlation-Id: 318fc172-df68-4d56-d9ab-08dab5a044e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NP97yuKHG9xvxpG6LrXbcTxohgaKM9RovACalUmRPJgsWtbphkl4tEYUpui4xvDTmnpM8UQNGYG641TUEuXUKVP82ztd9DvpWH4FmoyC2G5mKvJ1Eu0/AyUHX/Iq3VtqHZWe3w8KpsprIlENb8yDZzUUKlK/DgedOtL1to7qXgAifI4OBTKa0SnrrkGz/iEovIWO6utk+IwFlkYUzEkjtIPAvxptHEoNCZHr6d7s7a+qYmrxg/qhUj4/sueojhX2Wm8zbdnXlWt+N/1WrbLSEwGv3VvQheMM31jT+zghmAJ8+kUfRgrStlTty5m5K3HRjGjynu+64HCVlal+XKZxVdZB6c14iVEQ4C35bsVmy3cnvl+PzjNX9uYKw7WGtHeVrcAe7JAFDaOQVbk1+bWReDg5yRq9jSvR8KgXnfel2abzKFx3XQZrQJ9DBf5qmTtGvcnCj7wkHSd51TC6VWsRb/xQfzR0xX4lMFlcmQ5Ham0C/aW6/GCl5vhhHeJw5LAHvefq3v54BwMLZHhZaKPKXh5uCUSZU1AmF79DDrLwnXqynghBrEKIJkUxAPV8oodNv8q3+ymfOu5748JZJO8VmKkOGea9wZ8X36/VZPHK0GTV74Fdk75y9ZlRgKy51BHXR47nVul8Jr3zSFQQJiN8EbqesYhJLNDMmwB4CcaKOFfyeSGwKbOKXFG2Zox4K4axMgXhCIFslKFE5mTrMlGgZQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(396003)(346002)(366004)(136003)(39860400002)(376002)(451199015)(2906002)(5660300002)(9686003)(6862004)(6512007)(26005)(41300700001)(186003)(8936002)(33716001)(38100700002)(82960400001)(86362001)(83380400001)(85182001)(54906003)(6636002)(316002)(478600001)(6486002)(53546011)(107886003)(6666004)(8676002)(6506007)(66946007)(4326008)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3BmR05LcG9idlBHMTJNcjYxOW5VY0pFYmo3ZDNyMi9pc3phTEg1cmZvMzJp?=
 =?utf-8?B?R2pqNmhJYVo1dUtHamhkcGpqV3RCNkZIaVRVMDR6bStZRmRhZGdiY1NDMS9C?=
 =?utf-8?B?RGp1aGpOeExkekFQdG1KaHNjZUd2cGtxTVI4R0M2UUhocFVEVWMrYlhmRzJG?=
 =?utf-8?B?S25obldXL2Z5b09lSGVvWllxUG11WHU0Q1JkKzlOREtSa0lVdkpObXlLL1pJ?=
 =?utf-8?B?bEJ2YzFpMG5Hd2FYUkFSSld5cDFFSW9JelRwRTd4YjJUUy9qVC90OFMyM1Qy?=
 =?utf-8?B?YTFZSUpML3hXcTlQWWgyck5IRUdVQ2QzWHpDTzJST2I3QkN4SjZhb29PbHpI?=
 =?utf-8?B?ZmlDTm5JVHJKd2N5R2ZVZUVCTEZ3cHorR1VkZXB0NXU0UnJEdzlMeVRSNFlB?=
 =?utf-8?B?OGlMSGh2aGJPVU5FVlIyV3ArQkFkQVNQQjNzTWxhbW9yek9DY1JFc2RsWUE0?=
 =?utf-8?B?T2hET3BhWVNST1FNYWFTdFhMYzV3MXptWld0aXdwdGRuT25OZ2NURDZjUzZ2?=
 =?utf-8?B?bDBUWFY3aGxvZXVmdzdISGdGeEVtVENYT2dNYk1kbitUZzd4SVFlQ1FnNHFz?=
 =?utf-8?B?WitrdUlWOGV1Y1VQOUZCdC96Y1A3TWpzZm9wUkpibHh0cHh2NGl1eE9HZmZs?=
 =?utf-8?B?eTdMWjZFam82bWd2VGpZRlVvOUw2bWJnWlg3U2laMjRyQ040b0dUZk12SmVr?=
 =?utf-8?B?QmRMZnZ1ME5QMWk0S2NUSEs3UFZoSEEyVFRZOXpCMldMN1hHNWJwT05jTEVR?=
 =?utf-8?B?LzY5ejNmd0VrSFp1aWtTclczR015VmdGd0RCeDRGR3Z0YnpnNWNBM3RQRTNt?=
 =?utf-8?B?VnBVaFNOQjMyTVNVM0hMeVdIR1laR0NVdCtxYmNvZ3pLVXFiQy9hRm1zV0Rv?=
 =?utf-8?B?eVFTZUhsUFNLa1JxSHAwdkxOWDRiUGFWMFZDeHF0cEUyMzV4b3lkcVBwZW85?=
 =?utf-8?B?U1FKN1RsV25qYW4zMC91QnhCWGt0TUlVQThmUWVVV2tDbmZNUmZtMysrNUUx?=
 =?utf-8?B?QnlJOGJ4V0hlLy9yekRicFRKNnRUOWZETjNGa3RSTUZ4ZTB2bFU2V1NCdW96?=
 =?utf-8?B?T2VuRFA0RnFlSTRJWkUwMHlZZGRxSDR1MzRrOVRKdjNPaGhZY0oyUmdIVDh1?=
 =?utf-8?B?Q2RDSXNBMUdlODRqQWhRazBXL0xJbkZua29UNWppdWxGTVhRdGkwS2Q4TGNR?=
 =?utf-8?B?Q3A1QWFjdGtxdlpnMVhRbjhndWNEZUtaeXpsYThtOGRYekp4Q01Ud2dOam9z?=
 =?utf-8?B?cUR3U3o4ZXpIenkrdTcwZGpyRmJJbkx4THROZnhRUUFiVnEwOHZyNjAySHJj?=
 =?utf-8?B?c2drR3NGQmhCdzBFMDVVVFdpTEZLMVJoS1E1MFY4REN3bHhFUTQza1JITHlH?=
 =?utf-8?B?UW9mRGE2YVBERkg1dFVNMHdtcEZzS3ZIMjNKeXIrZlB6anhITHpYU0w3N0pE?=
 =?utf-8?B?dlZMK3FoQno3WUo3YnBwMTBPeENBeENKRkZoay9ld0RjZ3VaNXo2R1diNHo5?=
 =?utf-8?B?MzkzVG1FTVBhODNaUDNXa0t1Z0kyRnJickNDMWdpbmRUb3dRWXBKWmV0d1c3?=
 =?utf-8?B?YmRqQit0b3JpejNjbnVpTWp3OWVTbkVidTI2NktDTitKVnlWRFdoUithMmFE?=
 =?utf-8?B?OVpYemVTZ1RVNUlFL2xUV1FxMEpSWFQ4UDFzaE1ub2VRZXFvaHRLZnZ2ZWNq?=
 =?utf-8?B?cVhKVlJmbkFmSzNBUWpDUXhzYnhnaWFQUnpLY0cvY1JoOWNLZGtTWXRlTUtt?=
 =?utf-8?B?RE8rNDNlQUlMYnpMNDNTQWhYQlZ1a2dUUENKQjlsN1BxcUJ1blVodlRLYlZv?=
 =?utf-8?B?UjVRdXNDTkJoRDFxNGl6VXU3VkNOcHlOU0IwY1pobWhWaXFMVnBJdWFEYlNq?=
 =?utf-8?B?SHpaajFlWU1pcUJScVl5Y2dtOUQ5R1B3SSt1UEhTWXlJczdZMks3WVNkbjQz?=
 =?utf-8?B?ZlZHZXFWMmwwWXNkcVJUMGpDNlZtMEQ3dFdhZFAvaVRIbmhCRE9iNmUwNis2?=
 =?utf-8?B?RENSQXJSSktHRHBrL0xETXVhK3l0eFp5SlFKVWo2aXRYL0hxU3cwUVZXRDhB?=
 =?utf-8?B?akRaUXJPY1hwT3hDZENRZzVldmcxTHRxcWNFRGRDR3k3Mmxub3NlT0NnUWhz?=
 =?utf-8?Q?4hJqJW//9Ld4v7U2VjU/08Amj?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 318fc172-df68-4d56-d9ab-08dab5a044e4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 09:15:18.4401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N/e94yxhJuG2nkUpZWUZV6Uy+UCOSRoGhKA5++Ordk2SHe8VedTY4BGV5NfJXtkRDuPgqY9Pf4EqiONq6S0AQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6497

On Fri, Oct 21, 2022 at 07:01:01PM +0000, Andrew Cooper wrote:
> On 20/10/2022 11:27, Roger Pau Monne wrote:
> > CONFIG_HAS_PCI is not defined for the tools build, and as a result the
> > vpci harness would never get build.  Fix this by building it
> > unconditionally, there's nothing arch specific in it.
> >
> > Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > While not strictly a bugfix, I think it's worth adding this change to the
> > release in order to always build the vpci test hardness and prevent it
> > from bitrotting.
> > ---
> >  tools/tests/Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/tests/Makefile b/tools/tests/Makefile
> > index 33e32730c4..d99146d56a 100644
> > --- a/tools/tests/Makefile
> > +++ b/tools/tests/Makefile
> > @@ -10,7 +10,7 @@ SUBDIRS-$(CONFIG_X86) += x86_emulator
> >  endif
> >  SUBDIRS-y += xenstore
> >  SUBDIRS-y += depriv
> > -SUBDIRS-$(CONFIG_HAS_PCI) += vpci
> > +SUBDIRS-y += vpci
> 
> I'm afraid this is only half the fix.  The other half is:
> 
> diff --git a/tools/tests/vpci/Makefile b/tools/tests/vpci/Makefile
> index 5075bc2be28c..336904958f6a 100644
> --- a/tools/tests/vpci/Makefile
> +++ b/tools/tests/vpci/Makefile
> @@ -22,6 +22,8 @@ distclean: clean
>  
>  .PHONY: install
>  install:
> +       $(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
> +       $(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC_BIN)
>  
>  vpci.c: $(XEN_ROOT)/xen/drivers/vpci/vpci.c
>         # Remove includes and add the test harness header
> 
> so it can actually get deployed somewhere useful.

For now I just wanted to get it to be built by default.  It wasn't
clear to me we want this installed, as it's a standalone unit test
that could be executed as part of the build phase (doesn't require
interaction with any hypercalls).

It's also currently built using HOSTCC, so installing on the target
would be wrong for cross-builds.

Thanks, Roger.

