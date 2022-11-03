Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07941617C75
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 13:22:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436448.690560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqZEr-0001sd-Cu; Thu, 03 Nov 2022 12:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436448.690560; Thu, 03 Nov 2022 12:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqZEr-0001pk-9c; Thu, 03 Nov 2022 12:22:29 +0000
Received: by outflank-mailman (input) for mailman id 436448;
 Thu, 03 Nov 2022 12:22:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OB6F=3D=citrix.com=prvs=299187ae8=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oqZEp-0001pe-7e
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 12:22:27 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bad08dd-5b72-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 13:22:25 +0100 (CET)
Received: from mail-dm3nam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Nov 2022 08:22:15 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB6630.namprd03.prod.outlook.com (2603:10b6:a03:38a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Thu, 3 Nov
 2022 12:22:13 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c%5]) with mapi id 15.20.5769.021; Thu, 3 Nov 2022
 12:22:13 +0000
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
X-Inumbo-ID: 2bad08dd-5b72-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667478145;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=KOAUBAuyUvN9JIeHF+V2qhgbd3oiAxvtloICLMP7GTQ=;
  b=dTUO61Jlk/s5ri+G/jqAUihZvj5rOxpsn4yd+GTboOzmatywNITWlv1M
   puvELRx4iKQejlQi6uYe+oksLW1pF6vfasxbobVbS7j/p3T5RcUY7RjAu
   3Ju/F+51ecgg0gd++T2XjpicEeuPKrn0sPG+4wARqmd+EC3qhXI0ueNu0
   E=;
X-IronPort-RemoteIP: 104.47.56.44
X-IronPort-MID: 86623273
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:UeNm7KM7CIxZayTvrR2blsFynXyQoLVcMsEvi/4bfWQNrUongjQFy
 GUZWm7TaK6LN2akKIp3OY6w8U9Svp/cyddkHgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv/rRC9H5qyo4mpB5gdmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0spYGGJg7
 6YWFBMURTWZ2MeZ8ainY+Y506zPLOGzVG8ekldJ6GmDSNoDGtXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PRxvzS7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLVrCz23bWQxksXXqoyV+GC+6A7p2bD22k0JhYIXACWk8uQ3xvWt9V3b
 hZ8FjAVhbA76UiDSd/5Xhu1u3WEoxQYUpxcHoUS5gCXx6/Z/wueHEAZVTNbc5o9s9IsTjEk0
 UWGkpXvCCAHmK2YTzeR+6mZqRu2ODMJNikSaCkcVwwH7tL/5oYpgXryos1LFae0ipj5HGr2y
 jXS9iwm3e1P0YgMyrmx+k3Bj3S0vJ/VQwUp5wLRGGW48gd+Y43jbIutgbTG0ct9wE+iZgHpl
 BA5dwK2tYji0bnlePSxfdgw
IronPort-HdrOrdr: A9a23:YyjKDa0uw5dixSNsQ5lhzAqjBEgkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7Ar5PUtLpTnuAsa9qB/nm6KdgrNhWItKPjOW21dARbsKheffKlXbcBEWndQtt5
 uIHZIeNDXxZ2IK8PoT4mODYqodKA/sytHWuQ/cpU0dMz2Dc8tbnmBE4p7wKDwMeOFBb6BJcq
 a01458iBeLX28YVci/DmltZZm4mzWa/KiWGCLvHnQcmXGzsQ8=
X-IronPort-AV: E=Sophos;i="5.95,235,1661832000"; 
   d="scan'208";a="86623273"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F6iv+zR8Oy3nVRaPzJ9Qi5EsHKXa3DdCwmsxUBCtG7Bqb2g+ZcKbscpxqwnODVi1sUplr6Q6ILkj5oC7PQdbrmWAt8qKx6C60R112Ylm54JRSt0O0LwDvVrjkXvJeTvAwsv9ztqbDwDwjzWz46cPnHAmUzzmlTGRG8fpgk427qcr284N3AkzUPg2AaQoDjkuhUntOCe6R3fHuYDmvBBKU/YlW8NCDirhR4X+yAAnzZO4mWF3tw1MlQGwrYooqZ60hj4AgfavWGHy5SUtBStGLVvpd3cSovlVUET6AMjcIEfxnxMjXaE08BvBfOwL44oNae4jJJgNLfGo4ccBD/8qBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3t9xB6iOPr8y/byF6KKMPelveYpY7HLpyDfj/bV7PVo=;
 b=Q/vIyR3b9cdldzARxh9zgKntnVNYIrKaZYKPnwDEX+WkPtAM+wy7a8XpNJZpKKQrPCwazrGNXf70PGHEw1Gbx61R8N4FAwLlr88Wsl5w/8lqtKuN2bfwooMHl9jL3X26H0AWQa9acz4qvWP2EPST8QtQbkrcsXC2iCF7aZlQQVyG/LGNZ3wlLOTAnCoa+c6Abw4qezeW0DhOR1h8aVMzgbZ53s9l226NyYtAoAmdVXp6le3LafBCVeiUcRZI4u30PNX10kQsOcR3f4kQXVRC28KBSJcBKkvKGIUCC+Jwrpbg6teui30spWSQ3qvISrPAwpeTilvc5xvURuEivwP6eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3t9xB6iOPr8y/byF6KKMPelveYpY7HLpyDfj/bV7PVo=;
 b=AD6h0msUs2teZ2wMeHuUCzQHIkmzqA4lwQlrgLlTDydsxxtCnGs4mTNs9g+hCKE+TyBbjxqx26L/314eDfUyppqCIOorDi0+R5vEcRAEm0zGTyKjbdZxXxW6mzOuLnQ2gbqF/g+NDuDT7of+nU4tcUwUQvMZCR0Wzpo372wtuNo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 3 Nov 2022 13:22:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Leiber <paul@onlineschubla.de>,
	"G.R." <firemeteor@users.sourceforge.net>
Cc: xen-devel@lists.xenproject.org
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
Message-ID: <Y2OwzjfUnCFf2EDU@Air-de-Roger>
References: <CAKhsbWYU5_DGbGK2i_uhooXk4EzCLLO4SJGjDsvAkf2udQGsbg@mail.gmail.com>
 <Yc3/ytwCHFtR1BLi@Air-de-Roger>
 <CAKhsbWbRinNavBq4NnQ64nVrfWoOQWV0mM3Foao4VBYUWjoSnQ@mail.gmail.com>
 <YdQgf2+E467kuTxK@Air-de-Roger>
 <CAKhsbWbrvF6M-SAocACO5NvBaitUQ9mB5Qx+fMGtn_yVu0ZvEA@mail.gmail.com>
 <YdWsPWqALWBRGtqW@Air-de-Roger>
 <CAKhsbWbvjEcA220TTHGB3PPbfLmdS_MuK5Mn3Xvrr+JL=dHK7w@mail.gmail.com>
 <YdxIbLYRYh4hvVGj@Air-de-Roger>
 <CAKhsbWYHhveuwTjaiSGKCqf41nSHZKdt7W_y0qp-x09Pce22SA@mail.gmail.com>
 <735adbe4-238b-bb7b-ba91-eb53759223aa@onlineschubla.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <735adbe4-238b-bb7b-ba91-eb53759223aa@onlineschubla.de>
X-ClientProxiedBy: LO6P123CA0016.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::6) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB6630:EE_
X-MS-Office365-Filtering-Correlation-Id: 53890bbd-6389-420d-c2e6-08dabd96094a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U17LPD2XO/NMNSdXlx33rTvRvYFFHgH9IXxQU0W1Sut83SzZNvpCRIL17YpZw3MQwNHeidLxoXCLkjsoggEwd3NiNt+y8jkBd/ic2rQvg+yYzixEZe63ZrNi59Rr3OmgPhiATGlz7eUVpJllYQORn6ST0gSN4/+px88L2TatScdIUG/Rg7BvYi6/NusVOErnoCvBSg7EEBoiCfOlymhL19g8k8hpFtGCKC3YIfTp/DOyIxJhs/OvokLG+wqvC8KDthMsrw0T0N4bO+VJwpXELl2N8hpQtQDCUmygRg9Xd5jrd8H4aPyIK5ZScpbmG4WQqGgMtIeMyOiblM7tfTX0CMlo0GrwZi4yfaVll5JWyzsSs2/LSgkvVQnvu1aQxtbEQ0xJJYqTNZCWP7LtjY0PSnKYg2TY+V8MaKI9NoRsPVm61mXYXZt7w3thaiYz79zirgL9QFyjw5M8WtZB7cCcJLCxJriHUQsWK78gLUxw0lx6E5bVyfj5xMiUavT8wCGJ7tfj2gVNqFpiXdnv3+uTgBt0gTFklsWlQNpeQhlUzAFgGa8EirNCF4/mnZP5QHr93vn5L0I4rs/UYPYraKPLbPb1HE4Ez78laXBO6vIQsVsmMyo0ZjFbusX8hFWPrVoiLRkJAdpIIPFcpqvABDXYxM6yMMyECqKWVxaX5BRTcvhlvw7ZXP5qINldEX0w5+kmOKo94Ye6x9TOMvN43iBttA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199015)(82960400001)(38100700002)(85182001)(86362001)(2906002)(6486002)(478600001)(6506007)(6666004)(26005)(66476007)(8676002)(66556008)(8936002)(110136005)(66946007)(5660300002)(41300700001)(4326008)(33716001)(9686003)(316002)(186003)(53546011)(6512007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUFtN1pEMmdocngzZFluWENLd0tJcFN4L0dQTzA3WXRoR1VocjRXTytGazZ3?=
 =?utf-8?B?QSszUTB1M2R6SkxOL1M2ZkRtQ0tPTTM1cmhqUjVaWU40WHcyMlErL0xWUlFu?=
 =?utf-8?B?NFB4YkhNdnVjRzlISm5wWHdPbnpoNHRTZ1FmZC8rczZnaGVKK2FJc3lpb3BM?=
 =?utf-8?B?amFQY09JY3lYb1VoTHh6Yys0aURqZ1d6TkxmVFk3ZVFCL3NlUnV3bXJzNkdM?=
 =?utf-8?B?Q1dkdmtQY3ltWDI4RXB4YWlDSWJ4YVNQdmlnTTQ0bWlRc0lvcE5XdXVsRTFs?=
 =?utf-8?B?dWJYcXdwcXVlV3ZiK0JXbXlyWGhDa2RTYmhxeWhjNnN2RysxSVc2NE1QMHQy?=
 =?utf-8?B?YTYxejFqN21EdzBHdmZ2akh0U1ppcG9WeWdTa2hDQVp5QzlETENGSmFkakJk?=
 =?utf-8?B?b2VmYTlHNkFhbTZYUVNUcTdEMlpvRnJLbHd1azlocEpMOU9ZcmtOMTlWc2wz?=
 =?utf-8?B?eURjenZCZStqajJSMFp3emsvck4vVHJUNWRHbENRSE1TeFZrNTB2ekU4dnpx?=
 =?utf-8?B?YVJ3eFBJbklvZW5EVlVFMEpqSWlybHpQVSs1TVV1WFYwaU5yVENoak1HTnRM?=
 =?utf-8?B?R0c0dEJIRDJQSWFPdDYxVklWUmE3QzQ3NWJJS1J3MEVBVmlNQ05wbHhLaFo2?=
 =?utf-8?B?QnhoQVM5cnVYREx6cGx5Q2gwcTVwWE5tKzR2cHF6UDh5TEdmN0F3WUJnMnBU?=
 =?utf-8?B?dTE5dHVIUjhUSjZEbFVxWVk5Q2VEWlk2K3NINmk1TEdRVUM3dWhoM210RVRJ?=
 =?utf-8?B?SVBERWtYOGZFKzVVN1RtZTBucERHbmRPYjRtQlZoT0JsUWg1eE1sak8wb25v?=
 =?utf-8?B?V3FVTUFBQWRJaE4xRWM5enBDcU1lV0JkNkF3bU5WOWJkNlVNM0JWTjRtTkNv?=
 =?utf-8?B?ZnZBSnBqYWFIQVRuZk5TTDFFTkRqV2ZhT3hnYTFQaXczWkpKUmFzaGFzbm9K?=
 =?utf-8?B?c3dRaGpEWGVnTkdDUERJOWFUMXFHS1JSY3czcDkrUmZuZnNXR3NteGdHMjJC?=
 =?utf-8?B?M2xTa25LWFhxQVJweWtpeDVJeXhQZU44bUdja1dQaFY4ZGlZT2tlc2tndWJM?=
 =?utf-8?B?a3dmczBSbkY3Vm53ZHI2bDZYT29YMC9EaDhjNlZBS2I2UlpNSnd1eEQ5MXU4?=
 =?utf-8?B?TWpSaGxON0VtcXNISjZZM3BaUGUyKzIraEo1VlJ6WUNYN29wUkpjOEdxZTYy?=
 =?utf-8?B?UnBzbDlnUmdNbDFKTTltdllTZUE5T1JSN21sMUZabzdoUG9ONHgzYk5CK3VT?=
 =?utf-8?B?UFF2YzBiVDNDaUo4NmQ4OHFTQW1YLzJNb0JZZjd1VkxneGwyZWJsb0IvTEQ2?=
 =?utf-8?B?TXQ5ekY2SmViWWRnV2xvZENTdDlDWDJ4WWgxUDJSb1QrQnJSdUVZVFp5eWhn?=
 =?utf-8?B?bDE2UXdMZXNCdjdxNkV6UFRxZDF4QnhTTjdWLzVHRXQxZ1NCK1BGemlGOVNT?=
 =?utf-8?B?NUNoc3pQaHdhbW0yaUZWYjhzWk84NldiazRYZXJHZUJhV1A2am1pMy9MdTh6?=
 =?utf-8?B?Q01DZ2p5VjNjcCt3S1NFSTFsZ2dPdjc3SElMVEFnMkpiUWp2UDJlT21ERUR2?=
 =?utf-8?B?REREbDVJeHdNUW5KTC9TajllUHVQNUR5cmk3RllRNFg5YW9WcDQ0V2VnKzdE?=
 =?utf-8?B?RVByTlVhZnJSV1BaSUFqUnV5bmpLcUp5YmhmTEs2MmJBeDJTQjdJekJYK1pU?=
 =?utf-8?B?cW14UTVKTXQzYWRZWGRBRFZkbFZSeHl2MUFEY1oxWU12YkI3OElqNzllL0w4?=
 =?utf-8?B?QWpFY1lkdUQrLzU3aW5ERG5JSmNRbVB2dU5hV0FQdEMwY25RQkUydXRLUE1o?=
 =?utf-8?B?Ui9pMW5Xa2ZxSkhqT3RoRVRqNWNuWTI0VWxJSWg2NCtIVEVPS3BBRUUvL3Js?=
 =?utf-8?B?THA0Q3lLcDRUaFZIZkp2clgyQzlzRkQrTEQxUHFhNGRjVUxSbXdDcUJka3Fx?=
 =?utf-8?B?OGVqYlRhTURjWkQwTTk1RkRJK0pESjFGM0FiWlZUVkZWQVF6aHIvYkZnZUZF?=
 =?utf-8?B?blBlaU5yV3JrSk1pQ3JWQWNyWTFvbWVNSDE5d1p5TldkZ3RYZXNmSXl2ZzBY?=
 =?utf-8?B?ZEc0V09WbFJvNEcxS3k4Q0xmLzRjaUR4SkU1NW5kMHB6aStHYzhJcmFiQVpL?=
 =?utf-8?B?Uk9aMERiSWRzb3ZvaXhyY3FUaUc0OFFNaFQ1ZlFsRWoyem81aXlVZmNseStn?=
 =?utf-8?B?OXc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53890bbd-6389-420d-c2e6-08dabd96094a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 12:22:13.3750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BHRyhIVAp7GsWtUnmel3wfCFN6TH+lRwYutvF5mNHTWXTJNTRUs7ZnDPTucPLB6oq8UB2OJUoTD6dxXPdJCElA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6630

On Thu, Nov 03, 2022 at 07:58:52AM +0100, Paul Leiber wrote:
> 
> 
> Am 30.10.2022 um 17:36 schrieb G.R.:
> > On Mon, Jan 10, 2022 at 10:54 PM Roger Pau Monné <roger.pau@citrix.com> wrote:
> > > > So looks like at least the imbalance between two directions are not
> > > > related to your patch.
> > > > Likely the debug build is a bigger contributor to the perf difference
> > > > in both directions.
> > > > 
> > > > I also tried your patch on a release build, and didn't observe any
> > > > major difference in iperf3 numbers.
> > > > Roughly match the 30Gbps and 1.xGbps number on the stock release kernel.
> > > Thanks a lot, will try to get this upstream then.
> > > 
> > > Roger.
> > Hi Roger, any news for the upstream fix? I haven't heard any news since...
> > The reason I came back to this thread is that I totally forgot about
> > this issue and upgraded to FreeNAS 13 only to rediscover this issue
> > once again :-(
> > 
> > Any chance the patch can apply on FreeBSD 13.1-RELEASE-p1 kernel?
> > 
> > Thanks,
> > G.R.
> > 
> 
> Hi,
> 
> I want to confirm that the patch in an official release would make quite some people very happy. E.g. among OPNsense users, there are some who
> suffer from the network issue [1]. FWIW, I compiled a kernel including Roger's patch, and it seems to be working without trouble in my OPNsense DomU.

Hello to both,

Sorry, I completely dropped the ball on that patch, didn't even
remember I had it pending :(.

Will do a build test with it and commit later today, I don't think I
will get any feedback, and it seems to improve the situation for your
use-cases.

Thanks, Roger.

