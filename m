Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D61EE5F32A2
	for <lists+xen-devel@lfdr.de>; Mon,  3 Oct 2022 17:36:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414931.659371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofNUl-0001pw-QR; Mon, 03 Oct 2022 15:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414931.659371; Mon, 03 Oct 2022 15:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofNUl-0001mj-NQ; Mon, 03 Oct 2022 15:36:39 +0000
Received: by outflank-mailman (input) for mailman id 414931;
 Mon, 03 Oct 2022 15:36:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bYUz=2E=citrix.com=prvs=2680ed0a5=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1ofNUk-0001md-Ah
 for xen-devel@lists.xenproject.org; Mon, 03 Oct 2022 15:36:38 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25a7f957-4331-11ed-964a-05401a9f4f97;
 Mon, 03 Oct 2022 17:36:32 +0200 (CEST)
Received: from mail-mw2nam12lp2049.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Oct 2022 11:36:25 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by DM4PR03MB6999.namprd03.prod.outlook.com (2603:10b6:8:45::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.30; Mon, 3 Oct
 2022 15:36:22 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::7131:3804:744b:d7cc]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::7131:3804:744b:d7cc%7]) with mapi id 15.20.5676.030; Mon, 3 Oct 2022
 15:36:22 +0000
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
X-Inumbo-ID: 25a7f957-4331-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664811392;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=LdOKGX8bJmrJEhyC3iL/fLVfztRgHIFPJ4QQ/cJd2Os=;
  b=ay9GZ0qh2VRIMq84tkFSV3Svt/A7n6AZDIzBjwdvFO9MMX45fvZmrWe6
   GEHlV5LXowvSJR+5iLrlxkp6ynrmyXvVyeAOMqUQEcm6pLBDvT+uDzXD9
   8QPvzNWaic0JPC2PMLAdjD+rhn2W4uLknh2bx8quFuVSMSTF/e91k5KI3
   0=;
X-IronPort-RemoteIP: 104.47.66.49
X-IronPort-MID: 81514597
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8TggBqok8sQGwLxmZOgZT6yjC4BeBmKkZBIvgKrLsJaIsI4StFGz/
 9cnaN20SrzTNTykP5w0PZPnthk2DaWlyodkGgdo/n03FHwR8ZGdC93IJ02pM3mZfsHPEhI/4
 8sUZNXOJcxkQ3GArU6nO+C8oHItjPnZGev3BLDIY3EpG2eIJMtZZTdLwobV1aY00YjR73qxh
 O7PT+3j1H6N0DIqYjJMu/rb+Bph4/6t5DlC51Y0OqBHt1XUmyRKB5lOea3pI3XGGYQFReTSq
 8Qvbl2a1jiAo0pyUIPNfpLTKBBirmv6ZFDW4pZuc/H+xEIE/kTe645jXNIEc0Bblj6VqN54z
 dRJpPSYRBwge6bBg4zxaTEBe81FFfAAqeSvzUSX65TJlRSeKyC0mZ2CMWltVWEm0rcvaY1x3
 aRwxAAlNnirm++wybSnfehg7uxLwB7DZd53VtlIlFk1PN5+KXzxa/yiCexwhV/csvtmD/fGD
 /f1XBI0BPj2j7+jDX9MYH42tL/AanAS6FS0onrNzUY8yzC7IACcTNEBmTcaEzCHbZw9o6qWm
 o7J10v8WkpBH9qc9QbGoyj1gcGQvQmnYatHQdVU9tYy6LGS7ko6LURMEH6E+7y+gEP4XM9DI
 UsJ/CZotbI16EGgUtj6WVu/vWKAuRkfHdFXFoXW6inUkvaSv1nfWDZCEm8phN8O7afaQRQF2
 1iTkN6vKSFptLSNYXmc6q2VvXW5Pi19wWoqNXZZFFdYsoaLTIcbry/WV+psC7WJhcDXQx2t5
 2uhiDcxiOBG5SIM/+DhlbzduBq8q56MQgMr6wH/WmO+8hg/dIOjf5av61XQ8bBHNonxZkODp
 2QDncW25eUHH5aL0ieKBvgOdJmk5/+fNTraqVpuGYQx+TOw/XKqYYFX5nd5PkgBGswDZSPgZ
 En7sAZY9phVenCtaMdKj5mZDs0rye3lCo7jX/WNNN5WOMAtJUmA4T1kYlOW0yb1ik8wnKojO
 JCdN8GxEXIdDqchxz2zLwsA7YIWKukF7Tu7bfjGI96PiNJyuFb9pW85DWaz
IronPort-HdrOrdr: A9a23:w6HFNqkeutTGHBxKjwWBroUg7i7pDfOWimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdC9qXO1z+8X3WBjB8bbYOCGghrhEGgG1+ffKlLbakrDH4JmtJ
 uIEJIOQ+EYb2IK6/oSiTPQe7lP/DDtytHLuQ6q9QYIcegcUdAE0+4WMGamO3wzYDMDKYsyFZ
 Ka6MYCjSGnY24rYsOyAWRAd/TfpvXQ/aiWLCIuNloC0k2jnDmo4Ln1H1yzxREFSQ5Cxr8k7C
 zsjxH53KO+qPu2oyWsm1M7rq4m1+cJ+OEzRfBkufJlagkETTzYJ7iJbofy8gzdZtvfqmrC3u
 O85ivIdP4DkE85NlvF2ycFnTOQmgrGokWStWOwkD/tp9f0Syk9DNcEjYVFcgHB405lp91k1r
 lXtljpwKa+nXv77VnADvXzJmRXf3CP0A4fuP9Wi2YaXZoVabdXo4Ba9ERJEI0YFCa/7Iw8Cu
 FhAMzV+f4TKDqhHjnkl3gqxMbpUmU4Hx+ATERHssuJ0yJOlHQ8y0cD3sQQknoJ6Zp4QZhZ4O
 bPNLhuidh1P7krRLM4AP1ETdq8C2TLTx6JOGWOIU7/HKVCIH7Jo46f2sRG2AhrQu168HIfou
 WxbLoDjx9MR6vHM7zx4LRbthbQXW66QTPhjslD+pkRgMyNeIbW
X-IronPort-AV: E=Sophos;i="5.93,365,1654574400"; 
   d="asc'?scan'208";a="81514597"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYPiIVU0AE6JD3lWryyBt4Rj8aPl3ZwuGmoGpT9AApIsz66hMUNUsq7mdMuR+jUhln1QocmrsA0sEnYCPXixh8RcPtt89qi8edzJsFosZskd45gBYxJBLKcyk4Ulp67MrEr7lmSLSDxDcgcKICnRdn+oG3HlQmiJKAcnf+QLhBhLjog+zAEMqR5mBbss0G6lWvKef9cL0+a0F5edtvw23zPI+I3NOl0ezgcp5tVVvIf8+t70aXDSUxwbw/QxxVv96PE6jtkKGIQmVomPr+vk2maT44gecz2I1OETpSPogxWtXNpIvlRpoZUfjiKE3bEDxaZe93ELg0U3eDc9Wtljtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+v7Lt6xppYz2C1L+zl5aH+VAWqvbi8V9iqYxWZOcFz4=;
 b=PSLF4svmSKlSrsLvC8918XK77sskr2eFhvfxBf8y4SfFhh13k8aQd13xAea13CDR5X00zEE7mgk9gSHFqyKzKtUGqT0eQRi9MRtjmvbWHIOSRKhC4imy9i25JJGO1M7tsexUQLI9P60VF2IK0sEuPJyImieftqzd8tyzSH/KNzHbdYIAyoL2Gqn2JBYxFqUbPAT217FAnSllKAQBMRmKGmboz2njz74bWr0ZQbdGfISQM/eubJT8An+OmGlUMz9o5geQLJ/jTk9s9sMmaxES0qpL2pYfSys9euzjL5SYdNyuO9h7dS2ezQHgyxbS+nVX0mQkXksvHMbsvSwg5jPQ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+v7Lt6xppYz2C1L+zl5aH+VAWqvbi8V9iqYxWZOcFz4=;
 b=tP4SHzhGRCsT53l567EKcyffi3rmGloly6BaEcQr2Mw4HvndxXL8yk6Ynp2rEsGomi/gVwemb5z3NMWSlB0W9SantWixj5yAIaSecA4vmDc3YwMbta7EnEG22N/YF2OGS0dBSpl4KjL2lieW3wjqiSyK8Eycu37FwQczPfG7mMQ=
From: George Dunlap <George.Dunlap@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: "Stonehouse, Robert" <rjstone@amazon.co.uk>, Evi Harmon
	<eharmon@linuxfoundation.org>, "Bottali, Natalia [C]" <bottaln@amazon.com>
Subject: Thank you for a great Xen Summit!
Thread-Topic: Thank you for a great Xen Summit!
Thread-Index: AQHY1z3j7Maw5qM4qkm8TD66C9ir8A==
Date: Mon, 3 Oct 2022 15:36:22 +0000
Message-ID: <C9D69BDB-CC87-4173-97CD-22850631EEB7@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB5669:EE_|DM4PR03MB6999:EE_
x-ms-office365-filtering-correlation-id: e28624df-f27c-4327-2362-08daa5550669
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 9x3509kvLj06bLZHdtR+B25wWb4ryORG2puRXLno0MoZnUfqnox2rutwrPRknp9ZXbi93JOXypk7TSo/rErEi6PW8MFBEJjS7UghzL1hLnbYhCnsTc6v3b9yE2kTSffrDfh6YBlEqFEngX/Cy+rz9+n9K5bJ5R68xFKouZ3pU8koso29jHB6i1is554+80zcdxDWoG3fRVwHF3rbgbc0Cj3iEV4WpfYFmFaPtvL6h7czBtJcK3JDBKFWv5WPIvsc70fem18lXy9YXIvUD4kwKhAKRHf5N0Lwf7APkx+b8qQOwm/y95vCDCaFiz6rDHDHzUBfOcGigzdZhAulhttUmxtE2lYsf+OM904bXS8bXo75Pp4Wi8TFHjPxCvkN7xv1UASR/caXGHU3kj/W/L5tilqikLF1ZTBBexSBi/p3K54vP2C7X3fRje4cXNhbm6Muc0sg/jJf7IP6No+G3jW+DDFRvs5VaXR9CKdABjWgpM5Jwis2Zc+VjCFJfqlJQ7NMF2/bfAfOun5hdW0IRPLFAUmDAs8Dd1/YRHUN7hFeIkElGZht4FHzOFqpM/oL7G6+wR3a06ZKlXkKPzPW0o83hOGLoo9E0nE8+AjmekvV79Ok974+7xuIwnNCckpeTQl/bAWhG6nnQMIhN6vSh3Kfmv5llF0ROyrbmGvmCdgOa/2XFCKH2aXTRbmYHBg2YFhRQ6DXL+6WEUZ7RvrLwLZE48xBmSj2PTkDptasGUBjjhFkgHR3Zla13Ew/2NIbHAQyC3NJsz7t1zPEJZTW6rKofR2ImedHTqYPwtE0/SAhVxfnoUzIuSNuG7Ha2NKJ1Rcs
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(451199015)(26005)(38100700002)(41300700001)(122000001)(99936003)(4326008)(64756008)(66446008)(66476007)(8676002)(66556008)(91956017)(66946007)(76116006)(186003)(2906002)(2616005)(33656002)(8936002)(6506007)(4744005)(6512007)(36756003)(86362001)(5660300002)(38070700005)(71200400001)(6916009)(54906003)(478600001)(6486002)(82960400001)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d2FyWVpacVppN0IxbDVoRkxrQUJtYWs1TUJPbmJpTWJFQitmUE5uNCtBQWJo?=
 =?utf-8?B?MWR5dzlqTys0anJudXo1UTRTdThaYUhkTTlhbU1waGwrbS9sVzVZUm56RVhV?=
 =?utf-8?B?VDlNV1AwcGJyVkJLdnVoUHE4KzlqUU1LZXhwT1pLVHNRdXVRQlBjRkFJSUJv?=
 =?utf-8?B?VEdGRGhFNnJzYWpIaHBUV0U0MHlJSHpqdld5eWd1VEJOdm04Zit0Z2crY2p5?=
 =?utf-8?B?aWgzaklKTjNwaG85OExhckx6MDNudURLUWZPRE5qU0EyLzYycVJTRWU2STV2?=
 =?utf-8?B?eFAxYUpvYzk1N1JpaC9BKzNkbmxadFdHLzJIeFowZ2Rxa0dtdVY2L2ljU1lp?=
 =?utf-8?B?WjNZZkI5RmF3YzlmVVJTTS9YeWpqZ3Q4SU5POGJNVEN1TGgxMUFMbHYvbTFN?=
 =?utf-8?B?VW9yV0VIbWRLUWM0YndBekQ2eFZBeEZoU1QxM2JHbEtONDluNnREYkc0Qkgw?=
 =?utf-8?B?Wk9Ka2JWSjRxU2FpbVprSC9EVVdQRjArUE04U1F6WW1iQlh4OUdXcnBGY29Z?=
 =?utf-8?B?TC9VTysyU05GU0xOWU4yajFvL2hieHgzVzQ0VGdXTGwwRXRaczBoa3JRQTlO?=
 =?utf-8?B?Z2RKZUVreUppWVRVMjBkeDNabDVJNW1VbWNHVG40U0tlV0Yyd0ozMFVrWkUz?=
 =?utf-8?B?NXBYQ3huL1BWa1VSL1ZST2syYVZJRy9yQVEwN3VON3dpSkprVXB1WGhjWXpE?=
 =?utf-8?B?YnB4NUZJRjh0V25VU2xsbEY5SDNrZVRwTnp6SjBwNHJ3V0lNcUlpUE8yUFJh?=
 =?utf-8?B?ZGhsMVlrSkhHc2hQVVZPWko0SlVYaXdCOEJMeVhYV1pJd1RQdmdqUk91UmZE?=
 =?utf-8?B?VDVZdnhTcng0RGpwZDJhTWVValFOOTQvTjRzQXlaR0Z3OTZTMmozV1VUaTJI?=
 =?utf-8?B?YmR5YWw1a0pKaGlqWUx1WWsycHBYU2FXSUVrWklnbnpma0s1TnBINnhMclAx?=
 =?utf-8?B?cnRWNGtPTzZJT0RKRmFxNnVoaDdGSDVQUFRCR3AwZWlJbklSSFNPQWtEN0Np?=
 =?utf-8?B?QXByb1liNWtyczA4RlRBZlZGbGMzZ2F5S2QxU0liaXF0cVZjNVhuQzlGeUJk?=
 =?utf-8?B?Kyt3WWZKNU0zUU5ONnd1bHdRa2c2bHJXZWpHNzJza056RWF2d2FPd1dnZjl6?=
 =?utf-8?B?ZWpiNFFxbW54VzNSYmJLVk1qTEpQZ1UwcVZESDhick85UnBYNFNOYXA4ZHUz?=
 =?utf-8?B?cU4wVDdwOEFiQU5aUGJkbmMxdU5FZ0laeFh3WEdJRkhrMWxNc2o1Q3dCNU5i?=
 =?utf-8?B?STIzaVRxd05RWERTelp2VEt5bS9XMzdTWmxNRnlyWmd0NDA3c1haeFpkcDU3?=
 =?utf-8?B?QWllSFkyT3FaazV1WlN0ZENOU1FLcXgxWHA2WmdGS25XOEdTZlRENUNYV2hM?=
 =?utf-8?B?NlFqdEpaanhJYzBPNnZwbUpqSmlXL0hyelU2bTBQdmNhMkpSM0Z6RlM1RWFP?=
 =?utf-8?B?Q1o4OGhsZFNUbjdKUFM2MU15RW5LOFhleGJBbGtPZ0E3TXRHWkpyNm1aeEdZ?=
 =?utf-8?B?QzBtRDhpUnVaN1hYMnBuMnA1VzZrcXZBYTRKVkZ3QU1pZm5XUDFOM1ZqRjRh?=
 =?utf-8?B?RlFpeVNJNVdWcW5kbXkybmFGckxYNkRhS1lVMmF3MFhwdTZnQTduVWE5VWp4?=
 =?utf-8?B?djRienk0bmc5azN5U3lhVkVtTnI5aHVBeVpLU2RlK3drbTNCSmRQSEJJa1Ji?=
 =?utf-8?B?S2c2eVVDellxK1AwcGFHazVhRWFYajlrNzNOaCtwTS9GVDJlbng2ZnJ2SUww?=
 =?utf-8?B?dHhvOEtlUnpYd2xjN1ZGOXVNd3JOSHVVMmpiRmtTOHdBaVJZaS91S0tvV1pm?=
 =?utf-8?B?aitBY00yNXltZVEwQ2F4eGhMd1dhSE1QblUxYnQySkcyQUFRSE9wVXcxd2pC?=
 =?utf-8?B?ZHNSWWdDM3RTLzkzbUIvWWlSU0I0TzBzY3ZEOXEwdUprb2hBaDI0aWpXR1Zp?=
 =?utf-8?B?a0o4UUgwUmVpaEl3VUFMRFp4L253aDZBaFFzZVd6TFRTN0k5UDdtNHhuWThn?=
 =?utf-8?B?bUJkL2JTN0NUZUVHbUlCRitESnNjdWU5U1hldzdVdWNicjNxL2srUUEwSjA5?=
 =?utf-8?B?SGJTc1JpTXR0cTZqOEh2K0ZrK1E4Mk1uRS8veVNIZUlLY0hLMGZ5dnZFWkFK?=
 =?utf-8?B?S3habnZVTnl4ek9rVmhZQVhtNDdzc2RKa0RNWmdkdW56bzhJT1ZvK2RkNDln?=
 =?utf-8?B?RFE9PQ==?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_FE743CA3-BD9A-4215-8027-AEC4244BEA57";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e28624df-f27c-4327-2362-08daa5550669
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2022 15:36:22.4390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: svgyGJap7NRZcDlKCoc3T6NpXVHMUVw1iQwJERVXWxSMix6gWzd3JtYGDrbZ9vnOPOVLw8WFXRhE+xii6Rq1PE7yH5BWXuc5iR+nEWuyyZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6999

--Apple-Mail=_FE743CA3-BD9A-4215-8027-AEC4244BEA57
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hello all,

I just wanted to say think you to everyone who participated, both =
physically and virtually, in this years Xen Summit, for making it such a =
success.  Those of us putting on the event can put up the stage, but =
it=E2=80=99s the presenters and attendees who =E2=80=9Cmake the =
music=E2=80=9D, so to speak;  it=E2=80=99s very gratifying to see =
everyone engaged and participating.

I want to also thank the rest of the events team, who did so much =
=E2=80=9Cbehind-the-scenes=E2=80=9D work to make things happen: Evi, =
Natalia, and Robert.  There are so many things that =E2=80=9Cjust =
happened=E2=80=9D, and so many problems which they researched and =
presented me with a few simple options; the event would not have nearly =
been the same (nor me nearly as sane by the end of it) without them.

Hope to see you all next year!

Peace,
 -George Dunlap

--Apple-Mail=_FE743CA3-BD9A-4215-8027-AEC4244BEA57
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmM7AXIACgkQshXHp8eE
G+24ZAgAop7R/Ope4VLYI/GD0J110hyhSbd7UQ7zjdvdC6+JoyZVerxbQWERqY7A
ods5+48SGlfXC8kiA1cwQ1PC604MxnUqM8HtMAwXlREuAanWGDHhGoy5pFDPoAiF
p9udITkMjE+HgWuw0YEZJqw8OqLf4zvjcsfiVgeIgJnilVTQH3prZFzQc5ghpg8+
Mtn4UdwvPA7BKtJNSlO+5vclWmE1F+89dfyzd9RV6WNk68nU6p2M6CCc1QMmomJL
Ih9JDPmX6n7zV1AfH71zP8MwHUfl3RhUoxqd1iJeJ5AsHp4l97eg6FVU5MQ42BVo
oc5c4Obrtuou1sOXw3EvPUFMyLkYPg==
=EkQ7
-----END PGP SIGNATURE-----

--Apple-Mail=_FE743CA3-BD9A-4215-8027-AEC4244BEA57--

