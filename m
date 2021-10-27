Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5411B43CB6A
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 16:01:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216991.376814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfjUP-0004HC-19; Wed, 27 Oct 2021 14:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216991.376814; Wed, 27 Oct 2021 14:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfjUO-0004FQ-SZ; Wed, 27 Oct 2021 14:01:12 +0000
Received: by outflank-mailman (input) for mailman id 216991;
 Wed, 27 Oct 2021 14:01:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ie0f=PP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mfjUN-0004FA-BC
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 14:01:11 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5638c9b8-372e-11ec-8461-12813bfff9fa;
 Wed, 27 Oct 2021 14:01:10 +0000 (UTC)
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
X-Inumbo-ID: 5638c9b8-372e-11ec-8461-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635343270;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=2i9GfYNWeX3Ze5Ogj0jctuP2WAEbgnGUkdmNAC0myZU=;
  b=ejH8KkZwiIKeOlQCurNVZYtHl1yxFouIRYyro2U/b4itmJMIUnn7ibju
   jnGRNfC/ZjfiRWnhHcLki1mvoype/XTo4tLzUazlHStChRXgVrwu5X6ur
   XXTFEJv+OFY8071aVknbjvhgyhHp6fSKStjPjwSooNnDUZoJo4nbdAST8
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: hx2+bg6HnU+EHOPVlrlIQK3cloXHRV9h5NtVW97K9ufx8fmKwaAWDdCoYlwtgxWt0QmKLRJUdB
 iJ10SZ4vZvCplg1RMX3qvkR+k/rlVVb5HegIUbsdb2He1Ksx+P9Ue4w82BlYSVpyVooKh3CDIa
 dhNAmN7Zu4LS5wHDjPmiOkoPXQEctl16nIZi7At8OIt8VTyP8vVN530fttyoe5gdOL8ogPVEzH
 mnjEUzGs7TFpH3lfivzAdlEkUViaDhar01SGQGPEkLfB6M4nMTo9teWajr6emk9ZRJheqqM2BA
 zCtRCl1mh6scp/3Bv8KAt4Xw
X-SBRS: 5.1
X-MesageID: 56350266
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8lh3VKC8yTj05RVW/9/kw5YqxClBgxIJ4kV8jS/XYbTApGwjgTFUz
 DMcXDzQOPrfZTGge4gjbtm+90wHvpeAz9VmQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX550007wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/hRKzw9t/1
 P509oWURQdwM73hkfwDXEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHvuRuIcCgmlYasZmMtOOd
 tQ+dhhWakr8U01GYl01IZEGtbL97pX4W2IB8w/EzUYt2EDMyCRh3b6rN8DaEvSLWsd9jkuev
 njB/WnyHlcdLtP34SqI9Degi/HCmQv/WZkOD/uo+/hymlqRy2cPThoMWjOTo/O0l0q/UNJ3M
 FEP92wlqq1ayaCwZoCjBVvi+ifC50NCHYoLewEn1O2T4qTz2VqSCHQvd31YTNAm7cImaDUyy
 FDcyrsFGgdTmLGSTHuc8JKdojWzJTUZIAc+WMMUcecWy4K8+N9r33ojWv4mSfTv1oSkRlkc1
 hjT9HBm74j/m/LnwElSEbrvuDmruoTSBjA84gHaTwpJBSsoOdb7OeREBbXdhMuszbp1rHHd4
 xDoeODEtYji6K1hcgTXGI3h+5nyvp643MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK51gMvsAIbCHyNPcqC25UNyjM5fK4fTgCfquNBuein7ArLFPXlM2QTRfIt4wSrKTcuf5mY
 srKGSpdJX0bFb5m3FKLqxQ1itcWKtQF7TqLH/jTlk3/uZLHPSL9YepVYTOmM7FihIvZ8Vq9z
 jqqH5bTo/mpeLalOXe/HE96BQ1iEEXX8ris9JMOJr/Ze1M3cIzjYteIqY4cl0Vet/09vs/D/
 22nW18ez1z6hHbdLh6NZGwlY7TqNauTZ1pnVcD1FVr3iXUlf6i166ITK8k+cbU9rbQxxv9oV
 fgVPc6HB60XGDjA/j0ca7j7rZBjK0v31V7fYXL9bWhtZYNkSizI5sTgIlnl+h4RA3flrsA5u
 bChiF/WGMJRWwR4Ac/KQ/uz1Fft72MFked/UhKQcNlecUnh6qZwLCn1gqNlKs0AM0yblDCby
 xyXEVETouyU+90599zAhKalqYa1ErQhQhoGTjeDtbvvbHvU5Guux4NEQd2kRzGFWTOm4rima
 MVU0+r4bK8NkmFVvtcuCL1s168/uYfi/ucI0gR+EXzXRF23Ebc8cGKe1MxCu6ARlL9UvQy6B
 hCG9tVAYOjbPcrkFBgaJRY/b/TF3vYRw2GA4fMwKUT8xSl24LvYDhkCY0jS0HRQfOlvLYco4
 eY9o8pHuQWwhy0jPsuCki0JpX+HKWYNUvl/u5wXaGMxZtHHFr2WjUTgNxLL
IronPort-HdrOrdr: A9a23:2kzo3KPMMihaMsBcTyH155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/uxoX5PwPE80lKQFm7X5WI3CYOCIghrQEGgP1/qG/9SCIVyBygc+79
 YZT0EWMrSZZjIW/KWKgnjILz9J+qj5zEnCv5a5854Cd3APV0k2hD0JdjpzX3cGDzVuNN4cLt
 6x98BHrz2vdTA+adm6PGAMW6zmq8fQnJzrTBYaD1p/gTP+wA+A2frfKVy1zx0eWzRAzfML9n
 XEqRXw4uGGv+ugwhHR+mfP59B9mcfnyPFEGMuQ4/JlYAnEu0KNXsBMSreCtDc6rKWG70srqs
 DFp1MaM8F6+xrqDxeIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FczPCgnBQ8u1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTtXpCSoETAYUh4rD3xHklUKvoIRiKq7zOSI
 JVfYPhDbdtAB+nhknizyhSKIfGZAV3Iv+EKnJyzfB9nQIm2EyR9HFot/D3qE1wgK7Ve6M0l9
 gsDZ4Y5o2mNvVmFp6VJN1xCPdfWVa9CS4lDgqpUCHa/ec8SjXwl6I=
X-IronPort-AV: E=Sophos;i="5.87,186,1631592000"; 
   d="scan'208";a="56350266"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dle5zqP0YH9M+hp1QoDPPlBFkY8h2yLseu8tuhzwEh4Gm8uYAFd0VMCPBnvv+YYvCXJRjc30a7uX7UG5sUJvDREuqTTjnKeH6Hhm+tuD86KRqV8ciJnmpHljEjwWBuHdwgKmySNI3Foj5b+XrZdRgrpbrDA66KRQ4933o5oeWfE/YYxVep5iMq7UT/8D4ZYsYWh4+o1g93mlemQRAGZFg6i3Gkiv1dVaM+bVE/UB1xEnn/N5CkmxV4RMcabV4eyfjAwxh+aXksjLOntWuIICxziZmt49FPbkdkat0NRLUhq4tkfatxIk3QoB3yVgLOuojTW7W6bpy1SJW125o+7NfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEFq9Noxa0+tac7zwTnn1lh6K/4Fwca86hbVXGfBKb4=;
 b=Ey1X7M1R1ihLtF0+J9tvvVdd+Eg0eR0fsCodK77nO0ANb2W+vFov57uGrtX/uTJMUqALUP4JbV7BTCt0E3NyxKUCtpyxEN/5QkLTJOt8J8NM3ERqirqDxaPymAC6J3ZIuWH33qCAKSgXD13/MzbTmuNEg3iLJWijOCyLR+B0POOdq3oHVW+p7p4psxiDMizk8d18umKnGVK7oCraUtHfcVtUyvSEKdxlLoHV9YGv0aStOFpS+mF5aqxXplSkoqR03DidXPKa4BPidiL4m/w2DU8s0TiLOiEIytzKT1J05Cw7o1yFTNaP26husYXGq+kjUvzb8dqFt22ZR3tsefbKig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEFq9Noxa0+tac7zwTnn1lh6K/4Fwca86hbVXGfBKb4=;
 b=Fh4BklOde+PEmf4tP5mnr+PxulUGo2UEXHLFvkbsg0ve3d73NCUor3mH/AV02wPFv6yrN8YnCOm0PrMlRV/olIucayr84RG4Ln620BRChwIS6Bpo8b+8ggQLf7rf6JUd19++M1H/SOWihHOTnohp6OUXytVnB8RFz4DAaQ9uDYY=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH] x86/cpuid: prevent decreasing of hypervisor max leaf on migration
Date: Wed, 27 Oct 2021 16:00:50 +0200
Message-ID: <20211027140050.67509-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0149.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f964a496-0953-45d3-b7c1-08d9995237ce
X-MS-TrafficTypeDiagnostic: DM6PR03MB3673:
X-Microsoft-Antispam-PRVS: <DM6PR03MB36737C3553CDAA3A2186B64E8F859@DM6PR03MB3673.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NK0LFjzmqUfDR+9TyQt0RFJK/bJllGAzrD0fcwHBDutqdQy49QEi5y7Hr8EAoqmVIrZyFAAuZ1h01i4RE8GHumdANMRVDtQ6u5f4NftKmz28gqhRm2SrMx7+9gymnngBx/QkQn5B2fZiyCXn4V32uwpdxoWrsYDnruiAla9T7anGNiPnzjt2cSou2FnHP34WBVURR/L5bL17mTw7liu9ew3rruUaOwj6Z19nHZq2o3XA/wAzHM6XrJwOxyhEzRspcwlhksiwqrqaTr11OBpKJ1GGzb7KZMO6WEvdGAmMYoey7foyJNa5dcQIIHeLO7+2XdKtj1hNZsr83ymJ/zFh9x0DVYrrO6wTMrow1p9ds1DnRepBF29k0x7orc/VQuWb5lbjWs/veRNRj+JXLbN+9C0aIZ4O2SFmboXiRrRxjxwGYag1T/VhuKtNiBmvoNlSYbKivf2djjFaSe4i6A824vMfC9YnWbeFtlYg9LFHFi9HB/YsRDjalAyzj2TG0ohO293yswWWyh5/i1BgMemv9zI8BqI++Ts3HrZ9BBk66TBJLv/BtM/Jqu02UtSHfxz5jQdBhpqUkQdlZhuOirDa5jIKubV7rAJ9lht9x8i1RAHG0WJCyZ8GvKCSvlypx5iut4QFFvi/+aS6WxDD8qg3iw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(4326008)(1076003)(6916009)(186003)(83380400001)(38100700002)(508600001)(6666004)(26005)(8936002)(8676002)(36756003)(5660300002)(86362001)(956004)(2906002)(6496006)(66556008)(66476007)(2616005)(54906003)(82960400001)(66946007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXVacjFLTFBUZFRnVnQrQjZZVm5uaTRYcXorQXd0anRXSmtZY1MxOHZUdDUz?=
 =?utf-8?B?R1cxdW8xMDhkUjVoY09zaWlCL0E5L3gyZENUOFBLbmh0QlRPQmY4enJHejFG?=
 =?utf-8?B?SjlHZm55N2xEcGdSaGZYTEtzTm9ZaGlWUWZYeStiQ2wyVEpjazR3VFM4V1ZI?=
 =?utf-8?B?YTlWSEtrcnFaTjlFZ2oxODQvanVycEVYQUdlQ3pQeFV3bU5oZk9McFlyclJ5?=
 =?utf-8?B?Q1J4SzJ0YXRPMTkxRnVJU3djbkQxMnBHQkVzN1BUa096QUFpUGUrYmVuOEhH?=
 =?utf-8?B?QTFnTU5CSFhrMkJiS1hpWENGREc3WnYxUjBGU3U1eWhTMy9QOTRqZE5SK2NN?=
 =?utf-8?B?aTR3LzViWUM3NnRnREZHSTlNQWlxR3dqVmhWYktkc2xoK0FwTytYTkdLTmdm?=
 =?utf-8?B?bXRnTWtBb01tT0NaeTlrRXpGWDZqMGRRNG84WmxxMndpYWNMaWN4eVE5QWxK?=
 =?utf-8?B?NGhJK05CaUhsZkViYUwwNmdWdVRFUlpLR2xNZzZxTGg2U1IvUFVydDMrOFUx?=
 =?utf-8?B?eUF3OWR6d09ub1Mxbk9zdWVyRy9yUFlQcnVBZTE1S2lmSjF5TnlGVGVtSnhO?=
 =?utf-8?B?TnlEKzdsVFRHdHUrRXByTzkyblIzNE5jTkFTT0QwNExnU3pVUWM4cmVZOXlW?=
 =?utf-8?B?TDZoZVljUGEyR053L0VVSGJGdkVHcGJrTXh6QmRhMjRIeDhlWEZXWWx5V3M4?=
 =?utf-8?B?MFYvWE9HS2YvemFVaGprRHA5MXNXR2ZZSjg2ZEVlNDAxTFNpTWtsWEpjb3RK?=
 =?utf-8?B?WjBFa3FxbHdIcVRkSGVzQmxvY05idXloWVpyUEZwQ000TEE0MUNSSlR6OVdY?=
 =?utf-8?B?UFRpdzFHU2FqcXNlYi9EN3pmUklEK2k4VUNjU3dBditEM0RreU1qdEx4Z3VL?=
 =?utf-8?B?ckdnUVFKY0Q1WDhNdjVnRVBJV1k4dm85R25FUE5hL1JZbU1Fcit5QXAyeHBs?=
 =?utf-8?B?cno0VzlFZExxTVJwUEwwdG9WV0J6T2tuWWp0VnFDUTVybHFKdUdIMGlUT2tI?=
 =?utf-8?B?YzZZcG5ESEZLMG9QcjBQYXdsOVBNQmJERlNnQ0ZKeFQvNENkbGR4Z2czRlZY?=
 =?utf-8?B?YWFEZjg0NUtOcGN5d0ZXOUliUHZORjg2THhGUllMcGNvcmIrK3QxMUduaWFx?=
 =?utf-8?B?M1laZXNKcWYxdEdiYVBkc0s4VmZjZTJEWXgvbEdoWDRXdjN4OFFjYnBycmpk?=
 =?utf-8?B?dHVYY1M3S0FHaHA4V1JIUTN5bFBwd1hhNSthaWhiSlFqS3ZDTkNUVy8vT0VV?=
 =?utf-8?B?dnhUcmxqNGRTVFNYdk1uaEozM0huVUpWUVl4UlN3cHcxR0RZeEQ0NzFrbExY?=
 =?utf-8?B?ektKMkFJUjVSMjdFYkdRVGZJU05qekR2bEJ1cURsTUJoUU9MSTd1NjRpQnAy?=
 =?utf-8?B?U21LM212V2xiUTYrd3VDWGt1Y0pZdk1FVkhZSkdCSmcrTWNNNVpwRTkzSkNa?=
 =?utf-8?B?WVh4VkM2UWdhKzRRZjhLa2hwUXpTUEpMUWN1U016TnBadDBTemdrMDEzcUJk?=
 =?utf-8?B?U2tZMlZSM2Z0SkRFTFNtRi9yZ1VBWmdyZGNKZE1ld3VrQU1VVHpmQmVjTnU1?=
 =?utf-8?B?M2NFZTJacjlnSm4yNGh2bk5HZXhUVjhiK01wL080c3k1NDQzcWFYNkNLYnM4?=
 =?utf-8?B?T1FVN1RsUmpGMXNWQWtHSWRrN256ZzVHTnYzZEsxSmIyem4wSXJvMUdIdEtR?=
 =?utf-8?B?RVdGL21uWnUvZHhId29WdlkzbHlFSXZkVjRBYTVqRlpoN3F4bWttblFxR3lT?=
 =?utf-8?B?cWlXbTdzUFlhdHFzZW5uUGlzcnQwd0g2TzZjTVBhdXRKWGdRREhSSEtsa3BY?=
 =?utf-8?B?bTRNMHhIbTdIVlJhRDlKYlpDdU9ZV3lER0FZcnRXMU1CMm1rTXdobGxoM2lk?=
 =?utf-8?B?Mkc5K0VmZ2IrcGRCU3ppbzBmTldhclJlQVJpa0R4anh1SlZaU3pkYUlHa09C?=
 =?utf-8?B?NjA3d2RyTk5nR0QxaURIaVpXbTlZQTJQTEJKbmlBdlc2dS9WL0xNUTJkekRE?=
 =?utf-8?B?WmIrU0V6OVVNNS9aKzc2Qk9jSHhnNG9ybjhYVm1ieGdrMWtuUkQvZUh4d2Nw?=
 =?utf-8?B?cDZ5TEFQNXp3ZitEOGtVenR6c1M0eUxnS3RYUjhyb0EwZ24zUWRHQ3ltaWRm?=
 =?utf-8?B?Q1lzVllCV0hzc0VsQ2JobjAxYnUwTGhSeUZlNkF2UmhJNzU1Y2pBN2gyM2dG?=
 =?utf-8?Q?QRA0bW2ma6mfIhiqXveMbUs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f964a496-0953-45d3-b7c1-08d9995237ce
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 14:01:05.4060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rWoTwW0IeOzISE9SFJnp6GmVCOu4r/SBWj4qVtqpRVs5Asa0UrB2gs5tBQ0+vlnoFRl19T/F0gf1m1sKOgCSBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3673
X-OriginatorOrg: citrix.com

In order to be compatible with previous Xen versions, and not change
max hypervisor leaf as a result of a migration, keep the clamping of
the maximum leaf value provided to XEN_CPUID_MAX_NUM_LEAVES, instead
of doing it based on the domain type. Also set the default maximum
leaf without taking the domain type into account. The maximum
hypervisor leaf is not migrated, so we need the default to not regress
beyond what might already be reported to a guest by existing Xen
versions.

This is a partial revert of 540d911c28 and restores the previous
behaviour and assures that HVM guests won't see it's maximum
hypervisor leaf reduced from 5 to 4 as a result of a migration.

Fixes: 540d911c28 ('x86/CPUID: shrink max_{,sub}leaf fields according to actual leaf contents')
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
---
Regarding release risks:

This is a partial revert of a commit.  The main issues could be that a
partial revert could break the build or leave the remaining code in a
non-working condition.

Breaking the build will be easily discovered by our automated testing,
while leaving the remaining code in a broken state is unlikely, as the
chunks reverted are isolated from the rest of the change in
540d911c28.
---
 xen/arch/x86/traps.c                | 6 ++----
 xen/include/public/arch-x86/cpuid.h | 6 +-----
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index a1c2adb7ad..79fd276a41 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1086,15 +1086,13 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
     uint32_t base = is_viridian_domain(d) ? 0x40000100 : 0x40000000;
     uint32_t idx  = leaf - base;
     unsigned int limit = is_viridian_domain(d) ? p->hv2_limit : p->hv_limit;
-    unsigned int dflt = is_pv_domain(d) ? XEN_CPUID_MAX_PV_NUM_LEAVES
-                                        : XEN_CPUID_MAX_HVM_NUM_LEAVES;
 
     if ( limit == 0 )
         /* Default number of leaves */
-        limit = dflt;
+        limit = XEN_CPUID_MAX_NUM_LEAVES;
     else
         /* Clamp toolstack value between 2 and MAX_NUM_LEAVES. */
-        limit = min(max(limit, 2u), dflt);
+        limit = min(max(limit, 2u), XEN_CPUID_MAX_NUM_LEAVES + 0u);
 
     if ( idx > limit )
         return;
diff --git a/xen/include/public/arch-x86/cpuid.h b/xen/include/public/arch-x86/cpuid.h
index 00926b1fef..ce46305bee 100644
--- a/xen/include/public/arch-x86/cpuid.h
+++ b/xen/include/public/arch-x86/cpuid.h
@@ -113,10 +113,6 @@
 /* Max. address width in bits taking memory hotplug into account. */
 #define XEN_CPUID_MACHINE_ADDRESS_WIDTH_MASK (0xffu << 0)
 
-#define XEN_CPUID_MAX_PV_NUM_LEAVES 5
-#define XEN_CPUID_MAX_HVM_NUM_LEAVES 4
-#define XEN_CPUID_MAX_NUM_LEAVES \
-    (XEN_CPUID_MAX_PV_NUM_LEAVES > XEN_CPUID_MAX_HVM_NUM_LEAVES ? \
-     XEN_CPUID_MAX_PV_NUM_LEAVES : XEN_CPUID_MAX_HVM_NUM_LEAVES)
+#define XEN_CPUID_MAX_NUM_LEAVES 5
 
 #endif /* __XEN_PUBLIC_ARCH_X86_CPUID_H__ */
-- 
2.33.0


