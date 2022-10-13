Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0525FDCE4
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 17:14:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422267.668171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oizuF-0000ED-Vn; Thu, 13 Oct 2022 15:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422267.668171; Thu, 13 Oct 2022 15:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oizuF-0000CN-RM; Thu, 13 Oct 2022 15:13:55 +0000
Received: by outflank-mailman (input) for mailman id 422267;
 Thu, 13 Oct 2022 15:13:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xhTA=2O=citrix.com=prvs=278783dfc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oizuE-0000CH-KP
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 15:13:54 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4b4de17-4b09-11ed-8fd0-01056ac49cbb;
 Thu, 13 Oct 2022 17:13:52 +0200 (CEST)
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Oct 2022 11:13:34 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5840.namprd03.prod.outlook.com (2603:10b6:a03:2d0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 15:13:32 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 15:13:32 +0000
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
X-Inumbo-ID: a4b4de17-4b09-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665674032;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Kzobd9ofSwAjqBK2rHCoIxcXnftEy8smg0J8wQGSSSs=;
  b=fp+kL/Tq3m3h0KjtDzeTCyMf6LdofnCjSyY1lGeH/u8rb4IZhge5gVL/
   qK7u+KYZTPTTwiSD/PK4xQYis6CExz2bPoeUHeiEtKJUBY3EOYlHF7YUW
   sewjix+XmceqwUGuwsExrSN+4kmKO6gvJuDEBHNDCdr4fr4h0OIC/QMMP
   U=;
X-IronPort-RemoteIP: 104.47.55.172
X-IronPort-MID: 85190391
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:43CJlanartauVNfo0hU8t83o5gwYJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLC2uDOamOZ2T8cookbtjj8BxXscOGy9U1TgtoqSk0RiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6UqicUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9XuDgNyo4GlC5wRnPqgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfDnxX5
 7sDGAk3fBmvotvoz62dW9grmZF2RCXrFNt3VnBI6xj8VKxja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvi6Kk1YZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXOmAdNKT+zhnhJsqHGU4XwOKSVMbEv4j+DnkEOxZI57L
 WVBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQqrNQzRCAq/
 laRksn1GCd0t7mIVXOa8KzSpjS3UQAXJ2IfYS4PTSMe/sLu5oo0i3rnUdJLAKOzyNrvFlnYz
 jSHqiF4mrsSiNIQ2ruy1Vfdijmoq97CSQtdzhnWW0q14wU/Y5SqD6Sq5kLc9u1oN5uCQx+Ku
 31ss8SX8u0mF5yGky2JBuIXE9mB5euBMTDaqU5iGd8m7TvFxpK4VYVZ4TU7LkE5NM8BIGXte
 BWK5lkX44JPNny3a6Mxe5i2F8kh0annE5LiS+zQad1NJJN2cWdr4R1TWKJZ5Ei1+GBErE31E
 c7znRqEZZrCNZla8Q==
IronPort-HdrOrdr: A9a23:7hi6eqyxHpsTn2JPNzUwKrPxdegkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMUs1MSZLXPbUQyTXc5fBOrZsnDd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadv/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZfbxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESutu/oXvUiZ1SxhkFwnAid0idsrD
 AKmWZnAy1H0QKVQohym2q15+Cv6kd315ao8y7kvZKqm72EeNt9MbsBuWsRSGqm16Jr1usMr5
 5jziaXsYFaAgjHmzm479/UVwtynk7xunY6l/UP5kYvGbf2x4Uh37D30XklZqvoJhiKobwPAa
 1rFoXR9fxWeVSVYzTQuXRu2sWlWjA2Eg2dSkYPt8SJ23wO9UoJhXcw1YgahDMN5Zg9Q55L66
 DNNblpjqhHSosTYbhmDOkMTMOrAijGQA7KMmiVPVP7fZt3cE7lutry+vE49euqcJsHwN87n4
 nASkpRsSood0fnGaS1rep2G9D2MRGAtBjWu7JjDsJCy8zBrZLQQF2+YUFrlde8qPMCBcCeU+
 qvOfttcoreEVc=
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="85190391"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRuuoB/FBaJZ0lsj3HSUEi5hHW4t/ue1vh0c0Fa1yPxqsfnpE3iE6BGsIY49PZPSkCqeB4dq/e6lVOGbZfpWAzlpQZSwOuDX4FcmwK9IXHBWcxSi9amB5S7B8sfpvc3BFaxFpSfSHiZ+EdRF8ayUz9opZaxq3JGFXtH8vRIJD58vDouMLrxj8sRw1/deCuVsEOUuaRzE3pZce24v7F9fOTmEuaMrs40nYL0suIWoiA7diX0Uosf3YTZp8fZBBZ6YPdvCiTZdpP0saBl0ajxTW2WrGRnJgt5q+KkYNE7KajyK8M7CT4eiFj9txiWQGan86si/N/HLUI+Xq2hClZNC1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kzobd9ofSwAjqBK2rHCoIxcXnftEy8smg0J8wQGSSSs=;
 b=m3NjSdHtJAQdTEaLLRjcU5qf27GgfuK9mPS4S0gjXL4SN1zBUsMLuBvtrDrYE/HFg+G94STclAyg01IGVdO/c7DCeP3ZUzryW6ISEqx2TvFRVKzpxSB5pCQj8DoW3kT3q58em2/j+ZH6zQkLUh+sUoFA5nTlFGD8hTCg9xsG080LtPHZRLwGPeEZOFxors3VodDk33fjHBXXLRBYb+87b71f2A79Tb4qx9YQlg0QavepA7q/X5V7GF4HAJrzMsT4w/ffwaNO8G91cHAHn/2z9oongXtWbpZ484zRlxgWBDAKiYkSDXe0GDCX36k7K1uHW9+LJ1D4A7Uu5vjuJldqNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kzobd9ofSwAjqBK2rHCoIxcXnftEy8smg0J8wQGSSSs=;
 b=cg313ul/bPApQ98f9nDLsVpi4nGVS3lbZUCYRHTwqfomxs4PQnfUKpxwKXcg8ZYsFkcpz0o2wlYKBegPasqfrKJDcus4zRQaIQR/lc+oa5Nqf0KUjQvLkK1bbEoUbBkHxaMZq4UCKyXRxcKGLAWHFtWI3o/u9QzLGLBpoWdi+MM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Christian Lindig <christian.lindig@citrix.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, "Tim (Xen.org)"
	<tim@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>, David Scott <dave@recoil.org>, Julien Grall
	<julien@xen.org>, George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [XEN PATCH for-4.17 v5 05/17] tools: Remove -Werror everywhere
 else
Thread-Topic: [XEN PATCH for-4.17 v5 05/17] tools: Remove -Werror everywhere
 else
Thread-Index: AQHY3wSKbtadNN9MxUWVvxvJ2AO7864Mbq0A
Date: Thu, 13 Oct 2022 15:13:32 +0000
Message-ID: <b38e17b3-a4d5-c95e-1cbb-71b5ede8c51f@citrix.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
 <20221013130513.52440-6-anthony.perard@citrix.com>
In-Reply-To: <20221013130513.52440-6-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5840:EE_
x-ms-office365-filtering-correlation-id: ca05ba7f-a9c1-4d8a-3725-08daad2d7e0d
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 wWEuN2uQtivmYFWA/nvYFMC5l1NAyyioHWxW96wKhynJpv3vNeaHXOTFKXnbl9sJFeYGuuS85hyli4Dy77tWjM81Dk3xkd6NfBJVOFTNIBkjw/uL/wwHfnG03jaqIHmBnOPq4jwMBOwD9QlHh5m0YYn7WQbls/SmwaHVxccD9nfKfMcbVPS6bRYGfpNGgfIwfFRAMmwgL7C5IsECaRB+rj0Fa+57fcpjpxfvkjVhRh4urrHlxAeBHHmiBVbQzWVEy2d4rkyMPucngRHHxkChhBR4bAfHrxKQsKKXUpU0SuwJpXJk3Ebxd+HoNU/AR724wGiA54qzVmoReHHsn6Ik0SGdpU4iHk0A9HLP5zoWL53anJ1eUZWA4TBGyo3owiLM1lBZq94sIqfFMgOX91GZEEai9FQVhWFQhWlEctuU9lwayI/X3T2YV3JzdeI/SpmzksxZFoqo6T7z+W5cp7nbpXCwL4dfAZTq1Wv7V7M8CePYNZZ0pH3IxhnfypOEIwMM9WXIwY1hxhHn8wNJ4mJA2iVBHTg4zDqbhub2hYsqucLfEM247kXnF4U0tHGa1sBBewALP8b/dasPY7jji40h5lVB+Jud5+/Gvq6PbAr1GK1zQVqhLnEWdaKGoi+64lqGCLBFIu9v76P+8/8KDkU3WGq/Tx51lFDe1WfoJtZvmd2iAauz8rMW4gKz7EcIjVOD7qBpN3AEeEqIiFaaDWBXOqCo8s/BbMBwWNNgJCw2IAl9vH8XRYjv3BMpInMZ7S6PbJ57VV7k+fc5qOVMWcb2JgJsLegTnyMKrNFJsMAThHkjzc906ua8drbRy6hOKQACFXNauUUYf+iBEORUMnqcxQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(451199015)(36756003)(31686004)(86362001)(31696002)(38100700002)(2906002)(4744005)(5660300002)(82960400001)(122000001)(186003)(2616005)(38070700005)(6506007)(26005)(6486002)(53546011)(110136005)(478600001)(6512007)(71200400001)(54906003)(76116006)(66946007)(66476007)(316002)(66446008)(91956017)(66556008)(41300700001)(4326008)(8936002)(107886003)(64756008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WExJWjQrYlkrYU9PNUp0RXlNL1NZSEc5Mi9jYTZGdk1xcm1EMDRCWWorNDlI?=
 =?utf-8?B?RmM3MFZkeWk2SGM3L1ZESXdYTTZFOTc0S3RZNmo4bE5zL2F2bldrL0dYOFA4?=
 =?utf-8?B?SUYreE5FU2tmeFhJNGp1c1RTeVVYMFRBUnk5Vmppb0tzd0xFdHg3eWpZdllm?=
 =?utf-8?B?WXZjL05xVlJYZ3VzNnhHMHRYVnNtZVorMVN3WVcrSXNtREtRemk2bmgwdlRE?=
 =?utf-8?B?WmkwWTlzbVV2bWJtSkhEWFFJbDVYRjlBWGttYWYrVlNUTFlXTmY3NnV0Q3lT?=
 =?utf-8?B?Nk5iZ3FPaFpRcHRHR3BqNXBEWkw2ZmlHOHZLZ0VUSEJNckw2cTludDl5QXRv?=
 =?utf-8?B?Si82MXV4ZjZLaldsNWUyM1owM05CMTVNZk1qc0xmUUlSYjFldE5RSldxOFFu?=
 =?utf-8?B?YUdKTzdLNlVuL3FQd0J5OWFJOENGN1R5ZDJlMm82L0ZzS010TDlUeXdaY0p2?=
 =?utf-8?B?VllWc2FlSFdqYjcxME5xL2MwbXRmMVRROTR1QkcwU0ZieDVudHBuRGNSUTZo?=
 =?utf-8?B?UTdNQWFoUkc3QnIvN1doRUNxc1BhT1dPcDFVTm1ZbkJteVFYWlJLdDF3SjZR?=
 =?utf-8?B?QWFXN0RSRXZPQjZEa0dlN01ROXYwbW1HMERMNTRNS1ZWbnN1ZDZ2d3JPVzhr?=
 =?utf-8?B?dVkwZWtXNUZRckYxdkp6cWc1aUR5RndwclI2RzhzZFVEUG9tUWhwSGI1bjFx?=
 =?utf-8?B?cmN1UU1JMFN3ZHlDR3FpVldBZjRtZzVpNnFCc3MyR1BhdGtsWHVLc001ZitB?=
 =?utf-8?B?K2RuSlRpRjdGT0Z2OEdnSjhRZ2VqaFEzYlIwSS91SGQxNlhvelRnUWkrT3JK?=
 =?utf-8?B?N1Y5S3pPOUpLTUJReW9UMFJMOWJMVkpiN3ZwZ1ZCS1hac1ZYcFFZbDJNUEVo?=
 =?utf-8?B?clE1V3RXKzhTYU1MRU8wRXYzQTJwOW5DVmtVdWU1RjdhVUJKQmF6OHdUWGl6?=
 =?utf-8?B?TGsrQTlXb3ZNRUR2eTR6MGhZUzJncEdUc2VPTzU2bEVsMHIwUy9xT3htU1l2?=
 =?utf-8?B?bHFNdStWUHRMK3l5NlVjVHVIWXk2eWlYWFY3R1JPUDhkcjNGdUg3U0t0VkJW?=
 =?utf-8?B?YmVsaU5uNHdsQ1o4Mm1EOE5GWE1nZ1czcWdIQW1aUTkrL3prMWxuT0tyNFo0?=
 =?utf-8?B?ZGlSL3gxOWRrYlVrS2Z0TEREdksrcXFZUk9BbDQrMmNicWZYMHZmc09CNk5v?=
 =?utf-8?B?SlNXejdwYW1UWW1yT0JFa2JYK25kRFkzbkRLT09Od3M0ZXJEUXhncjV6WHA4?=
 =?utf-8?B?dVhGRE53MTlzTzJIcHY2OS9CREpHV2ZIZUdJMHppdWNMSEVhTnNUSndZL2Zh?=
 =?utf-8?B?VmdLN2hMUEdhOUhsVUtkUGlkNFliN0F4TEpnQjFTZk5RY0R4MTRsWjR3UlQz?=
 =?utf-8?B?WThpRmxvS3k0aCsydzRGTFNmcDd5QzZRaTM2TzFvK21Bc2hENVpWRi9FOCtQ?=
 =?utf-8?B?Tk9VUkpWTXQ0TUVDRFExK3Nlc0hpSE5kdmpHWjI4MHR6SzA2RTA1OFQvUkor?=
 =?utf-8?B?YVJWdEJKb1grTHQ1emhmVE54bTYxdkc5OGFVZk5Iang2cFY0NWxHUzNGaDJQ?=
 =?utf-8?B?VGZ5ellkaTcvRjgyU0tWMEhkekc4MVdxZG1qVUJoRktpSGNib3VTS1NMUEo2?=
 =?utf-8?B?NXpsQmkyaFVxVDArejBaVG50dEgzVXkyR3kvR2hBcmNLSHBBbTdtN2NpYUQ5?=
 =?utf-8?B?VnZUU3JVWElwVVdxTWlxUG9PYm1tZ2FOY21wWHZoLzlRaExIbEZpSG02K1FI?=
 =?utf-8?B?M3huM1Bza1ViN0NXWVBrdGxlQmh4WlJIMkJhbWhCMElYbkZNODhhVGNyanIr?=
 =?utf-8?B?UEF0eHhlcm5xYy9XbFhaZDUxK0djMWplR3JON3dJaysrU1hCK3dmaG1FQUNn?=
 =?utf-8?B?UjJrdFBUM29OMUJOczFLUGpxQ0phM3BmOU52WTRPbmFRQzZBSTBidW9uQUEy?=
 =?utf-8?B?aGw2TkZYaDBPaVJxZXlEZ3dHdzg1Zy9tcmtYdHJCa1F5RWJ1VWU5TUJzNDlT?=
 =?utf-8?B?QlJ2c2YvdDk2UTVlL1p6RnhhckJoTW9pSFJRdnU0ck9YcCtGeEdSazlTRC9u?=
 =?utf-8?B?TkNHVldaMXl1aSs5TWxVSGh4aTFaQ1RvQjhnMFg5OTF5V1ovOW9IRm00ek92?=
 =?utf-8?Q?m0vhi3aj5pjHzTJJxQsO5G0Aj?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9964E338AB6AD4AB21303582A851249@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca05ba7f-a9c1-4d8a-3725-08daad2d7e0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2022 15:13:32.6119
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kY0UneJJt8NxTY/NnAce8BSLz6Jwi/1fqQDXyhyYreW/PF605pbEAFKpiLLhrEtRdKzDDE/hBCP2ztMYAULDl+8RbpOOHLWZeIKcyKTZc88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5840

T24gMTMvMTAvMjAyMiAxNDowNSwgQW50aG9ueSBQZXJhcmQgd3JvdGU6DQo+IGRpZmYgLS1naXQg
YS90b29scy9kZWJ1Z2dlci9nZGJzeC9SdWxlcy5tayBiL3Rvb2xzL2RlYnVnZ2VyL2dkYnN4L1J1
bGVzLm1rDQo+IGluZGV4IDkyMGYxYzg3ZmIuLjA2MTBkYjg3M2IgMTAwNjQ0DQo+IC0tLSBhL3Rv
b2xzL2RlYnVnZ2VyL2dkYnN4L1J1bGVzLm1rDQo+ICsrKyBiL3Rvb2xzL2RlYnVnZ2VyL2dkYnN4
L1J1bGVzLm1rDQo+IEBAIC0xLDYgKzEsNiBAQA0KPiAgaW5jbHVkZSAkKFhFTl9ST09UKS90b29s
cy9SdWxlcy5taw0KPiAgDQo+IC1DRkxBR1MgICArPSAtV2Vycm9yIC1XbWlzc2luZy1wcm90b3R5
cGVzIA0KPiArQ0ZMQUdTICAgKz0gLVdtaXNzaW5nLXByb3RvdHlwZXMgDQo+ICAjIChnY2MgNC4z
eCBhbmQgbGF0ZXIpICAgLVdjb252ZXJzaW9uIC1Xbm8tc2lnbi1jb252ZXJzaW9uDQo+ICANCj4g
IENGTEFHUy0kKGNsYW5nKSArPSAtV25vLWlnbm9yZWQtYXR0cmlidXRlcw0KPg0KDQpUaGlzIGh1
bmsgaW50cm9kdWNlcyB0cmFpbGluZyB3aGl0ZXNwYWNlLsKgIEFsbCBvdGhlciBodW5rcyBhcmUg
ZmluZS4NCg0KfkFuZHJldw0K

