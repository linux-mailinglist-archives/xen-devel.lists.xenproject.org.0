Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E04723E1E
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 11:47:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544042.849526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6TH5-00071X-3B; Tue, 06 Jun 2023 09:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544042.849526; Tue, 06 Jun 2023 09:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6TH5-0006zN-03; Tue, 06 Jun 2023 09:46:47 +0000
Received: by outflank-mailman (input) for mailman id 544042;
 Tue, 06 Jun 2023 09:46:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tz0j=B2=citrix.com=prvs=514dea429=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q6TH3-0006zH-JG
 for xen-devel@lists.xenproject.org; Tue, 06 Jun 2023 09:46:45 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09b36ef6-044f-11ee-8611-37d641c3527e;
 Tue, 06 Jun 2023 11:46:42 +0200 (CEST)
Received: from mail-mw2nam04lp2168.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Jun 2023 05:46:39 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BL1PR03MB6023.namprd03.prod.outlook.com (2603:10b6:208:31b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 09:46:37 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6455.028; Tue, 6 Jun 2023
 09:46:37 +0000
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
X-Inumbo-ID: 09b36ef6-044f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686044802;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8AH9ucv6Vr+9sb1K8iUFIRorg3faODBLMLZ/P8Zu4Vo=;
  b=F9AKzOb+UtCl1qSm12AriLkSFZjTL16oGpcQH1uuA2EJSRzX2K7+1tp2
   X/hsuNnzmFAU4QUeS4tl59ermWo1LKhDWRkg1xIzIszKhMkne1ABr8F0p
   5yYqkQf2oVYv7Mrze4alelOk0J3ejqDgtaiyZ6jT7njnGtoy7bvKEwFiS
   Q=;
X-IronPort-RemoteIP: 104.47.73.168
X-IronPort-MID: 111630812
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:aiQRnaMOXi8LmfLvrR2DlsFynXyQoLVcMsEvi/4bfWQNrUpzhDwDy
 mFOUWHUM/2LYmanc98naY6/8ksGupLSx9VhTwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tG5gJmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0tdpL0xl0
 +xEEWxXXj2yt8mQxpnnCeY506zPLOGzVG8ekldJ6GmFSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vFxujaDpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyv12LSXzXqhMG4UPIy69qE2oWeN/GNQNxEmc1TgufSg03frDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBGjhHoLCTD3WH+d+pQSiaPCEUKSoHenUCRA5dv937+tht3lTIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRPeZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:jo182qxkjebVBlJWihbdKrPxuOskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBZpTiBUJPhfZquz+8P3WBxB8bqYOCIghrNEGgP1+XfKnjbalTDH41mpO
 9dmspFebrN5DFB5K6XjzVQUexQpuVvm5rY5ts2uk0dKD2CHJsQjTuRZDz7LmRGAC19QbYpHp
 uV4cRK4xC6f24MU8i9Dn4ZG8DeutzijvvdEFQ7Li9izDPLoSKj6bb8HRTd9AwZSSlzzbAr9n
 WAuxDl55+kr+qwxnbnpiLuBtVt6ZfcI+l4dYKxY/suW3TRY8GTFcRcsoi5zX8ISSeUmRUXeZ
 f30lUd1o9ImgnslymO0GbQMk/boX0TAjbZuCOlqGqmrsrjSD0gDc1dwYpfbxvC8kIl+Mpxya
 RRwguixu5q5D777VbADuLzJmRXv1vxpWBnnf8YjnRZX4dbYLhNrZYH9EcQFJsbBir15I0uDe
 ErVajnlYBrWELfa2qcsnhkwdSqUHh2FhCaQlIassjQ1zRNhnh2w0YR2cRalHYd85A2TYVC+o
 3/Q9NVvaALStVTYbN2Be8HT8fyAmvRQQjUOGbXOljjHLFvAQO/l3c22sRE2AiHQu148HJpou
 W/bLpxjx9NR37T
X-Talos-CUID: 9a23:1XhWKmEKtVV6c9VZqmJW6mA5MeY1LkSBlkf9En+TL2BCFP6aHAo=
X-Talos-MUID: 9a23:sQDkoAqkP1UN8/eF3TUezwBgNJg0wp6wMk9Orpk2ncbfLSFpYg7I2Q==
X-IronPort-AV: E=Sophos;i="6.00,219,1681185600"; 
   d="scan'208";a="111630812"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GdMwMtSASZeKLk+SWJ6LtgvVVgSMgrhnpjLg8VxZptHeHJHxSZAaD0BY4Vm9mMbAP75tcwRx1eExZ6+FWN7tDAp2ohljvRxJdxcd2f8WARksL4YIqVl8Ohxu8CGj/QppQf45y5JVINwFH9OJLU88FtSvxjeEMf4KHNbfP/k1s75uJEJ+f+mrxbAp24P3KtmK3tN1wYuEP6/ROvvTRBg5B4xLp1j2XlRIPjslorq710B2DbBwYSfDT4fN80dz9WXqWVYm9caC8ZD6FDI9vCwkdHR8UYn/tY41Isjk5/sYYqBrkgpwuB9jkw87UlID4wMQ3A2qJamKj8bVeJgL9ztV3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flFcnPFmr/9ZOdFlfvUV2gfpGaveBqIhb4JPdjFYFnI=;
 b=jvOz1IKDtPETcpQR8XOnA7/Yricr9XeCWVjnsssiTgSoLaOd5uokAVWlMkrEct1laIVQi+8/WQ/HpE9ffNJ/iE3bChx8Rr3/Bk6u8SI23FVASvBnunlKSexbAcct9S2oj8eWp2YL9t9lQOUlqipKA2GDNNg7YoC+ALrk59Selie1fXXtSrU07Py7uxw957+z9H0hzEixqt5egFA3q3HVeR0sOoVTYZL9S7R+OYW6BDk8NKKSUzHqQd0TsDRjzqh+ENni2YA5IesaM4T9oJd2SyUuz4EQdDcVkJ5GPWmPzk/6/ngiwZMx7t0CdEECcLbw3GvaRqszOgG++ZVC3AvqJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flFcnPFmr/9ZOdFlfvUV2gfpGaveBqIhb4JPdjFYFnI=;
 b=LLIsdbvfBvzm8xMg1JCuDfi+SN8MM5dGoBMdmQ+KGx3bB4QCsQs210c0y9wcdXAWdtXWvV6lGgIhtEvCaEuBdOyURkms25sNih9tHlLQJc4E7lKhXnLqXuBNtU4NosuYaD6ORmufJDtvvymAu96xHOsB5gUu519HmEI6C0SNq9o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 6 Jun 2023 11:46:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] x86/vPIT: account for "counter stopped" time
Message-ID: <ZH8Ad3Yzg7jJnuxY@Air-de-Roger>
References: <fd113adc-6d66-5a4f-78ee-766c197ced93@suse.com>
 <355c5379-ea9e-582c-0131-816204eb3ace@suse.com>
 <ZHiFliv3GV1aQnY4@Air-de-Roger>
 <dfc403ac-875e-b1a7-16e9-b2b443e57278@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dfc403ac-875e-b1a7-16e9-b2b443e57278@suse.com>
X-ClientProxiedBy: LO4P123CA0445.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::18) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BL1PR03MB6023:EE_
X-MS-Office365-Filtering-Correlation-Id: 67db92da-d779-405f-23c0-08db6672ebaf
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/px+iRTg2yMyxXQJwVrs02dRhjzsUX59rfqh9yoEg5ioL8O9/ItR12L3rmFmg/mytHtPdHikwR8WG4qeFkiBTk7cAeTEEckWWu/IgrwRaNaHYXb6mUJxgPcv5zwzIzrY6wWMRFZK0mSYLB1TZ+Tr7FxjzuJyH5K1Jt/5OQSNOc7nEHyz2iab/PQXMwq6awyMznhGv59FTtrxF6Ir4D3lZvT3GS1eOR8ec7RXIoMGlga9xb/xX57kUTDcdBgNZufTRJ98dGAJ3DcWwpmWGVQLEfMVCUpF0zpnMqihvwP0eZe6FOF1+E1X/f79+mspX5gpdcf2LohezZN1dRB7aeppu9Orc7lUTN3qkZ1CfyGFhh724lenI2g4wG4vwv370SHGtrOtecEPM3tjK3wI1eYjWh82515vi9xwjYo3XO5/3/iOgFxIxoRMeNvjiTC1FYAfMyTldp9vcn9QhYAVRc/cSc5iWELdFYguK4FL4u9AjE7XPCpThFC2bCy9ky7Ni6KKENL0y2kAR2Y5gi0DvKZtJHj0lFiI9gVJsJKJ6QfXidcwn09kE6velrFdaUhz7n6UtDbuf4dvqHV31a8owRXQ3Uo9w9qpFkqcZ9QHgll/F2E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(136003)(366004)(396003)(376002)(39860400002)(346002)(451199021)(6486002)(6666004)(83380400001)(186003)(85182001)(86362001)(38100700002)(33716001)(82960400001)(6512007)(53546011)(6506007)(26005)(9686003)(316002)(54906003)(4326008)(66946007)(8936002)(6916009)(66556008)(66476007)(8676002)(5660300002)(66899021)(41300700001)(2906002)(478600001)(15650500001)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clltYTdnYjc0blVDTDcwSXl2WGpVRFRseHB0RTJORVRTZHg5dEN3T29DajVo?=
 =?utf-8?B?L25vZlIxK0lOL1RWd21PK2ViV0JwKzJVQ0lNNnFaU2t1di90R0dIeVg4S2d1?=
 =?utf-8?B?RTAzeThaMlROb0oraWRFdEJqMTVGSFJzWVE3dks5UDVlcHB3VStlcFhjdEF6?=
 =?utf-8?B?MG1LdUVGZ1ltejVKM3ZFazJFaWNzaXRnaCtSeW5CTmYreXgyMENkdkliVHZL?=
 =?utf-8?B?OFV6NGQ3Tk5peFBxY0pLMkFnVHRNWjIrS2I2cSt1clFyRzdGWmF3Z2xhSlRX?=
 =?utf-8?B?VVByTDFWandaMVBGQlNzS0pLVUh3eU1lbHVsOGE4cTdGd0JQaU0zcnZWb1lu?=
 =?utf-8?B?cDZld2MvZFZvbGJ3U09TWFVlUEwvRmxxejdMeWNpS0ExSklMVmpTanRwdlYx?=
 =?utf-8?B?bHBzZjZIVDlrcW9GYXdOTWM1VXZsKzFEeUZnUDZQTVdLc3g4aU5Hd2xQOVFW?=
 =?utf-8?B?RUdEWU4zck5UN2lhbnl0ZFRzR24vSkVsdTdNSnQ3VitOSk9PVE13RktvenJu?=
 =?utf-8?B?NTZQNGQvKzROUTB0TlBpcllPRzFoUTJKT0tBVzRrTlJEbW1kZmdtT2Q1bUZa?=
 =?utf-8?B?VmNkazJFY2Q5byt5M29MZG56UlZta2lYMzhlallUS1gwNUVXUnk0NjZvOUpU?=
 =?utf-8?B?c2NZQ25GSWdGUFdPUlpkdW9yK1o0RXFIcVV4UitRZWJiNGQvMUk3UXVUMjBH?=
 =?utf-8?B?c01tRU5YY0hLTnp0ZFE1Nk1uMXpKK1JKRUh0QTJ3RjYyYVhjUWJhNDM1TjVP?=
 =?utf-8?B?ckZPN1dlMkxZOU5BV0lITzdQczlyL1FPVDd0a2syb2hVcElMWUpFa0x2aXor?=
 =?utf-8?B?Ty9aSVJVV0FBbzlkeDlQVUozTWhrZHdnYTdUOEphTjFKS1lVc09SZm1Wb2E4?=
 =?utf-8?B?b2EvNHRnRDlLTHZMbkJqWERrK1dNclJJRHJDd0hpQ2NGekcrN2VESDdVMnAz?=
 =?utf-8?B?c1Y2dWhlSGtqOUQveVAwTndKVjc5UHBpOHROcGRIU1VYeGM2M05aL1ROaWNm?=
 =?utf-8?B?SVlJampIM3ZneHJWRG5aREYySjA3ZVB3TkJIbjBja0h6TjlrRExRTVlJUzJO?=
 =?utf-8?B?TTJxQVpDVDFBa2dheEcxYTQ4Q0x2NytxMzUyVGt2Mm11ZklaUHNiSE9rV3Ry?=
 =?utf-8?B?VWtFTzNSRWpKWHhDZDArelN5N3FtRWx0ZDFISG1sc3NzMU5NZE1tMFBlZTIz?=
 =?utf-8?B?VFpNbS9XSDVZc093Z1gxbzNuZ1Q3aTdHYlU1enpsZmF1KzkrZGtWbnFEblBj?=
 =?utf-8?B?VWdOakJWTGZzb3hQcVpMTVloTzlnNFp0VnpnTUhwbXd0cEcvdkhVbUl5a0RS?=
 =?utf-8?B?UEc1YzhMK0c0Vm1VZ0d5RkhzaExKcnFTZ0NCSDVSTURzM2g5SGhiODJwUVdj?=
 =?utf-8?B?d1lqQ011dEZmclRHcWNSQmMxdGd5aU93Q25PQmN3Tk8vS2p1aGN3bWhOK1ht?=
 =?utf-8?B?THFiVGxxbDUzbXRJOGZsZXQrZEhxbWtWY1VnSXlwL3VnamNjVnBsNW55TVVZ?=
 =?utf-8?B?bE5Zazgrd2Q1SEo3bzhoeHY2Q0NyTE1nTG5OMWFTV2Z0VzcwMzlkd0drekxP?=
 =?utf-8?B?bUlMeHBraFJDR3diSFVHZDhwYWVldVIzc3RMd0RlQnE2cm13UEpJTThUdDBL?=
 =?utf-8?B?dnFxRGUxUXpkKzNieW9pMXFkYnlzUmREd3pNU1JsczRlaWxoNWR1Zkg3eGVX?=
 =?utf-8?B?b0s4OVZzcVVJSGRmSWxqQnZhWUFvdSt6Rng2NDVQdGYwYzd6aXJRc1BXUGNE?=
 =?utf-8?B?dDJTeXFiYUNwTHNLQmhvYjFXQ1FXWUI4ZDhTc2NBYXpGSjhIUUo2emFCL3lU?=
 =?utf-8?B?K05kQ1BtbEY2R1NFQ3RzZndIMFpqRXpaV3d1NzdScjhZbHRBeUNLcGRYb1la?=
 =?utf-8?B?eXAzQmtWZU1ZeTN0SkdZS1JQYyt2TUlzL3FhS2RhZHZvYzA2elphb3pSVmpq?=
 =?utf-8?B?a0FzR3QwbFBzcmJ1M0lzV1VvbllsS2k3clpWVVJzYlNhMUEvQW55cllTalhI?=
 =?utf-8?B?NlpSRUNjTHovY0w1YWFOK0QyQmd3eTA4dG1OMCs3S01hNEplb0lrNXFkMGxO?=
 =?utf-8?B?QjErNlpablZHcWt6eUVhdVpTSmxyaURqM0JRQWdhNWd0aU1pS3VsYndaZHVn?=
 =?utf-8?B?VzAyNnR4SldMdThMMWtNdjNpUnJ4LzJEZHg3dDZtaU1UOXZldzU0RFJPRUho?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Tr0hlJoDt0ycKLyv/BIotOxjO7nCPiVBQsfZXnGg4oYJGoEUbVzUxWJlvxgZZl4/B+OZt9aY9UrSd1hha1Yajs6FUAq+ZX9g68kKwRlXu7j81/gJQ13MdV8FCOZNI2IhUd/zSuXMkIcKQvHfcB7cby3coIkkUmnLDNGTPCqMsQaHpRQVwmLYUIQq4OsaAf7C8XjP/qzV+Y2P9Mcu+OQnP+EanVsij4OJc+/ScarwzpiOHqzapVlxu2yvcrorgJsGrpc6+hDxCzgyodGCzg8XofMs0DQtISZkzAaBxfimK9shbwfghPSBFpvtsm1TytJOlpGRkYa+UvZRfTO8KguBl/+haKCWBDCbPpxWkZ8ihh3XhA3xFYwdBGjNrCZj4jAF1Nqw/lVhiu+EXxLbLupsgi1v9P16CSRUd8tyMPEdYiRMS9bGzg5fjkqfHtfjyG2t1KeerIikcZYY5vpLgtx7hIv2nXX0WOY32RHpVongvuKgBN3YUz5edtu2F6Ot723H+W/gvzNsSZqBfE+PS+RNJ+3MPUnro+h9S05hvNIBKjF9Ut1OvviB7T08VbFoGNU3Hdc/yL5Ygi+4vAWM8ITQ+zFXbS39lZbQlveSgDuKM35uxnDtoW4wg/OUopngbdGC2yOfYiwf7YGBvITDts6Ec9ub7ecuSOQPqma7FTcmapAsF6EiYXwBoj7Qwm+BxZf2RWrwKmxSMo2P2Ca4kYI899tUUsHLeZcGYeyxJnKy2biaqi50t8qznnUyqGi+Io1zF1US+m/FI8ymnqqbK4Rs+PIiNR2BPsqqPpyLwwQvtFsx9bK1iAl6h8rmRGiLhu5U
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67db92da-d779-405f-23c0-08db6672ebaf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 09:46:37.2135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xf9wiKOy96NEYGF5tUkrHPS/SDoccu9jZunSZLsDjYamzel3Qk3uQWMRkU/bpMNUGA+mdThHoQw2CY05u84mQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6023

On Thu, Jun 01, 2023 at 04:20:13PM +0200, Jan Beulich wrote:
> On 01.06.2023 13:48, Roger Pau Monné wrote:
> > On Tue, May 30, 2023 at 05:30:40PM +0200, Jan Beulich wrote:
> >> TBD: "gate" can only ever be low for chan2 (with "x86/vPIT: check/bound
> >>      values loaded from state save record" [2] in place), so in
> >>      principle we could get away without a new pair of arrays, but just
> >>      two individual fields. At the expense of more special casing in
> >>      code.
> > 
> > Hm, I guess we could rename to pit_set_gate_ch2 and remove the ch
> > parameter.  That would be OK for me.
> 
> Well, simplifying the function is the less ugly part, so I'd be okay
> doing that. But doing _just_ that feels wrong: Why would we make the
> function less general when we still maintain all the data also for
> the other channels, just that we don't update it. My concern was
> really towards the further special casing of channel 2 that would be
> required if I didn't introduce two new arrays, but just two new
> fields.
> 
> >> TBD: Should we deal with other aspects of "gate low" in pit_get_out()
> >>      here as well, right away? I was hoping to get away without ...
> >>      (Note how the two functions also disagree in their placement of the
> >>      "default" labels, even if that's largely benign when taking into
> >>      account that modes 6 and 7 are transformed to 2 and 3 respectively
> >>      by pit_load(). A difference would occur only before the guest first
> >>      sets the mode, as pit_reset() sets it to 7.)
> > 
> > I'm in general afraid of doing changes here (apart from bugfixes)
> > because we don't really have a good way to test them AFAIK,
> 
> Right, hence why I'm asking.

I would say leave alone, unless you have a reason to fix them.

> > maybe you
> > do have some XTF or similar tests to exercise those paths?
> 
> I did consider making something, but I can't go the route of "try it
> directly and then compare with emulation results". Yet without that
> I'm not sure such a test (and the time spent putting it together) are
> worth it, the more that without being able to compare I might also
> end up testing some wrong behavior, simply because of not properly
> understanding the somewhat scarce documentation that's available.

Well, I would argue that just testing the device works as (you)
expected would already be an improvement, we could at least rule out
errors due to the device misbehaving related to our expectations.

> (I already had to resort to 30 years old hardcopy documentation to
> at least stand a chance of getting things right.)

I'm not sure I would be able to realize this errors with the
documentation I currently have.

> 
> >> Other observations:
> >> - Loading of new counts occurs too early in some of the modes (2/3: at
> >>   end of current sequence or when gate goes high; 1/5: only when gate
> >>   goes high).
> 
> Because of this ...
> 
> >> @@ -109,6 +112,7 @@ static void pit_load_count(PITState *pit
> >>          pit->count_load_time[channel] = 0;
> >>      else
> >>          pit->count_load_time[channel] = get_guest_time(v);
> >> +    pit->stopped_time[channel] = 0;
> > 
> > Don't you need to also set count_stop_time == count_load_time in case
> > the counter is disabled? (s->gate == 0).
> 
> ... I think you're right, and I should do so unconditionally. In
> principle I think this would need to be mode dependent.
> 
> >> @@ -181,22 +188,39 @@ static void pit_set_gate(PITState *pit,
> >>  
> >>      ASSERT(spin_is_locked(&pit->lock));
> >>  
> >> -    switch ( s->mode )
> >> -    {
> >> -    default:
> >> -    case 0:
> >> -    case 4:
> >> -        /* XXX: just disable/enable counting */
> >> -        break;
> >> -    case 1:
> >> -    case 5:
> >> -    case 2:
> >> -    case 3:
> >> -        /* Restart counting on rising edge. */
> >> -        if ( s->gate < val )
> >> -            pit->count_load_time[channel] = get_guest_time(v);
> >> -        break;
> >> -    }
> >> +    if ( s->gate > val )
> >> +        switch ( s->mode )
> >> +        {
> >> +        case 0:
> >> +        case 2:
> >> +        case 3:
> >> +        case 4:
> >> +            /* Disable counting. */
> >> +            if ( !channel )
> >> +                destroy_periodic_time(&pit->pt0);
> >> +            pit->count_stop_time[channel] = get_guest_time(v);
> >> +            break;
> >> +        }
> >> +
> >> +    if ( s->gate < val )
> > 
> > Shouldn't this be an else if?
> 
> They could, but they don't need to be. I ended up thinking that with the
> blank line between both if()s things read slightly better. If you're
> pretty convinced that's unhelpful, I'd be willing to adjust.

Just wanted to make sure my understanding was correct.  IMO it's clearer
if an else is used, to denote instances using the first branch won't
change s->gate or val and thus the second (else) branch is not taken
(iow: both branches are exclusive, and the code in the first branch
cannot affect the condition of entering the second if).

But maybe that's just my way of thinking, so I'm not going to insist.

Thanks, Roger.

