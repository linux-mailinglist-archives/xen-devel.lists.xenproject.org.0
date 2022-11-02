Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB34615E1B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 09:42:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435622.689228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9Jg-00038Q-Kn; Wed, 02 Nov 2022 08:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435622.689228; Wed, 02 Nov 2022 08:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9Jg-00035G-I0; Wed, 02 Nov 2022 08:41:44 +0000
Received: by outflank-mailman (input) for mailman id 435622;
 Wed, 02 Nov 2022 08:41:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7+cO=3C=citrix.com=prvs=2981f1107=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oq9Jf-00035A-Cx
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 08:41:43 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ae788e1-5a8a-11ed-91b5-6bf2151ebd3b;
 Wed, 02 Nov 2022 09:41:41 +0100 (CET)
Received: from mail-sn1anam02lp2046.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Nov 2022 04:41:37 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5410.namprd03.prod.outlook.com (2603:10b6:208:29c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 2 Nov
 2022 08:41:32 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 08:41:31 +0000
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
X-Inumbo-ID: 2ae788e1-5a8a-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667378501;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=+xxM5wFKUi3p/4vPj61Bn/Dr2aDLwstqkvQRZEDlcxU=;
  b=JfwKzQiqw5ZYotOmUf5s6XrUfd9VcG/Y4zxewZ2Ht4INwq7ClLaILZDB
   qoyKe4E0JQACERw0pQaIKSuyenBqNJafshgOib+B1VgjdQaXank6e4O/V
   mJ0mWC7+TG+F7sikle+c995yP/YFWMjbISo98R49Z5q3xrnc2GRS5VZEv
   8=;
X-IronPort-RemoteIP: 104.47.57.46
X-IronPort-MID: 84413670
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ZDW7jKMAhUgfJ9rvrR18lsFynXyQoLVcMsEvi/4bfWQNrUon3j1Sz
 TdJXD/Xa6reZ2bzeN9+bYzg9k4E7MCAn9JgTwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv/rRC9H5qyo4mpB5gZmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0slTGV5Er
 fIKEixOah2ln7qw4qmJb+Y506zPLOGzVG8ekldJ6GmDSM0AGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PVxvza7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr+TwXqgBt1KfFG+3qJlx3eJ+2U5Mhw5VWWFqvWdpmG8QOsKf
 iT4/QJr98De7neDTNbnWAajiGWZpRNaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLSNrmK2YTzSa7Lj8hTGvPSkYK0cSaClCShEKi/Hhr5s6ihbnR9NqAqmzyNbyHFnY4
 z2Mtjl4uLwVguYCzaD99lfC6w9AvbDMRw8xox7RB2uj5wYhPoq9PdT0tx7c8OpKK5ufQh+Zp
 n8YlsOC7ecIS5aQiCiKR+ZLF7asjxqYDADhbZdUN8FJ31yQF7SLJOi8PBkWyJ9VD/s5
IronPort-HdrOrdr: A9a23:T1vjraxB4QQs05XqMvsaKrPxj+skLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMQs1MSZLXPbUQyTXc1fBOrZsnfd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadu/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZebxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESttu/oXvUjZ1SxhkFxnAid0idvrD
 AKmWZmAy1H0QKSQohym2qq5+Cv6kd215ao8y7kvZKqm72EeNt9MbsOuWsRSGqm16Jr1usMr5
 5jziaXsYFaAgjHmzm479/UVwtynk7xunY6l/UP5kYvGLf2RYUh2rD3xnklZqsoDWb/8sQqAe
 NuBMbT6LJfdk6bdWnQui1qzMa3Vno+Ex+aSgxa0/blmAR+jTR81Q8V1cYflnAP+NY0TIRF/f
 3NNuBtmKtVRsEbYKphDKMKQNexCGbKXRXQWVjiaWjPBeUCITbAupT36LI66KWjf4EJ1oI7nN
 DbXFZRpQcJCjbT4A21reh2Gzz2MRaAtG7Wu7BjDrBCy83BbauuNzGfQ1YzlMblq+kDA6TgKo
 SOBK4=
X-IronPort-AV: E=Sophos;i="5.95,232,1661832000"; 
   d="scan'208";a="84413670"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YTUCdhy4jNpOzaClFJZc3g/brb22/SqOL4bDz7j+sEHrFSf6Ce89hlDZfDcngVPgtkVWhuO+pHBcwGGfexrIp6skQmDiRC5pBkALo0+WqpwicSq4QLZOIMwsFEY/o05jpVgk1fnL7xmLH+gClugLiC0tKygV7JJM1PgMFaTX2Ci7dk0WBOCri4dtv7W5syPu5+4LolJw9XEzhX+BJCzhOVvE0VCpoGkGdt7mLahZ/NLAW3OTRbzISnYLZ10WbGhxvQYm9ijYvFkbL0u3ZiRO6XZV29KsJs1REgn9Kusm5N79gFnbZJ/plm3JhrzCPCE72gM03bLDOl4yR8yICXRNKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xxM5wFKUi3p/4vPj61Bn/Dr2aDLwstqkvQRZEDlcxU=;
 b=FrVlfcg60dPK0qgf2aOIUFgAFcv1F1BlPGcazwFDlraPg8YAJ9c2obbG9MuU6hH5Z3peQWHuNmXM+AUL4WvKr86jTGJiprvpCLKAxCK4Wjvqt5BgnFaQ4XXCCn1FhkDYSaTh7p5p8sK9aeAZDmIVx5AcRVn14AfQQnvpqstQLoQEIGLclagf24Ai24vBtneCktnSkB+5UyzM2EZanxC13pUmHEAZisJe6n431KVf46CJRvsi4Wnn50hYFEjS7WdyRIJq0WHitXlW393RhJGWtwzCfh69/noLtmWdUFbXMqmyBx36CuiLp9nrDw7NVrFtRnl8WRSTSzxEurggulcS1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xxM5wFKUi3p/4vPj61Bn/Dr2aDLwstqkvQRZEDlcxU=;
 b=tm+9agJEj4or9/OK23a5mgvOEdzBA4koO9/VDndRbR9G7/wsOLM4e389SwCo4LMQ6qgY6W59hPTABmGCngZa2KWuvTELSARh3h+bRXVIWvCMLdi3QJ1KfXe7f/DBHL9wG7uOrbp8I6ErLvhzYLnytX+Iw0alRlshntRM6imMdaE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>, Julien Grall <jgrall@amazon.com>, Henry Wang
	<Henry.Wang@arm.com>
Subject: Re: [PATCH 02/20] tools/xenstore: call remove_domid_from_perm() for
 special nodes
Thread-Topic: [PATCH 02/20] tools/xenstore: call remove_domid_from_perm() for
 special nodes
Thread-Index: AQHY7ga/5MFeaUWvXkWrm6X3MoCOY64rUcKA
Date: Wed, 2 Nov 2022 08:41:31 +0000
Message-ID: <0a0d2d20-bba7-e802-a1aa-476390cf38a8@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-3-jgross@suse.com>
In-Reply-To: <20221101152842.4257-3-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BLAPR03MB5410:EE_
x-ms-office365-filtering-correlation-id: 2db92370-b746-4786-14bf-08dabcae0ace
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 kgCd9haCsX6O/6AL8w5BeNyQjqzptJf5SEusdQEYv1e3aPtHfGPTxF6NSX17QLRoow7I+LSzSc2xSGNC2OR7gwtTbZGII2pJoZhGXUFzcz+hHSnIfG6k1d/a2QahXTmbEX1BhnTzjG0bCmqrlJHpeZ0BYgBLoB8ZrrTSDOJQ3QJLwITouDpgXjRNHDoPaJCZZw8SO0PIckZauV/Q3NRnhRlC3PtuPxRZh3nDjM+tchELIxQ37pS+FFF0uSTkA0VCUnRYrdnspcQBuOOBTfVzCfqNvpt1jO1f9g1d4ACDukemRhYQFNnguiCTAyD77o/B6+vUyuWoocQ5ipr5uy+0BGiLAJAa9SAzJbBNFxdEHWmtIcTyUkd6u1ONFBB6G1WznEIqZZgLdFIUD7AcE5sprVS6tAiNahUXvj/OLEW4g7pDCQGMLiFpZEOpkWwxjWpdaliG0jo2lOB9dCtiU8Y8cPHYJjm5GlbuoNGQ2yJi6LeDektNWoDbNRe4C7mHQchJ5G/TCbSAqGLJw7ljudjCtA86BhIMFLdERWO8K1uaYADnpZaDNgLCiv8SnSno3fJIXwHXgB2poIwUd+PF35OFVg1BozW10lc9FY+ZgQLEYoplAzUvxAZUfM6+k2nNSgiNYztsQgm3KRKDYsdy75jxEFxCyNQM+kZpWoEt2cURWrOV3ZBdY2b2fwU4QgNZztQikumlB9ujJiMPZj/211AjC4Hf99ZodulWUZJlWr393EXmlB/Y+klOtZZFeq8saqwooG64kMZum0w5VeEU2PlYsE0vgoZBGFX2338Ld+d8gtRVI2RJzHDTEJNwO6rzj4IqWGcsSVospegleJoeAgCHwA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199015)(6512007)(26005)(186003)(2616005)(53546011)(8936002)(4326008)(6506007)(8676002)(91956017)(66946007)(76116006)(66556008)(66476007)(66446008)(64756008)(86362001)(316002)(2906002)(38100700002)(31696002)(71200400001)(4744005)(83380400001)(5660300002)(82960400001)(478600001)(6486002)(31686004)(122000001)(38070700005)(110136005)(54906003)(36756003)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?US80R3AzQ0VvV1ZQNE5sajA1Z2cyT2RKbmxGenpZZHlsWEVLZFhrZmJZUWlQ?=
 =?utf-8?B?dFo2bCtMbzNiQTQ0YXZqU09VSWhiWmVFaTJ4eFd0UXU0bm9sVndhVHkvaUFt?=
 =?utf-8?B?Sy9MRVdrMkZ0bHU4MzlRajFWUEdSVVZPMFRpNXYrYk5icHZrS3RRTnhneHBa?=
 =?utf-8?B?NER4c1JmT2dMS0FlbUc0TmpIdlpvdE00KzljZURmMG43NWdOU0FmMVB0NXJS?=
 =?utf-8?B?dXg1ZjQrMmV0ZkFhLzFCU05KZkUrNVNoY3ZEbjRwb0NkNmtyTTdmRHFQNzZV?=
 =?utf-8?B?dmlrajhiSUxTWS93dk44b0xBSmV4MFQrSW9zSklleUUwblczWVdyZUNpVytR?=
 =?utf-8?B?bDhzWm05RVFPdkhCTWdFOEJrcW1YMDlwR01ZSjQxQjV4Mm05UWRvUlVFcXpp?=
 =?utf-8?B?TXZYbmVMajBXWHNJWkVzU2FIcjJ6VHV3YitHa1B2aWhmT0Y5b1VIelZFRlc0?=
 =?utf-8?B?ek9mU08yY2o4U1krL1lmU0ZTREUzWkgrTTVLeGVLMGE4SlZZb01XMzFaZVhW?=
 =?utf-8?B?U2pmUlhLWXQ4V2ViZnp3cUl5QXhxU1B0QTRwbnZTWTYzaVZwU2ZOYU43R0pk?=
 =?utf-8?B?ZCtOZTRXWDBjc0tJUmtwSEx5bTVEUlZnZWtuYjZ5NTYwOHZSZlQ2SHl4QkZ5?=
 =?utf-8?B?RGMxdUZ2UjBlQ1dkck1WNWtiOEpTZTkxU3hNZ25FRUJOTE1ORHRmODdWNnZQ?=
 =?utf-8?B?Y2ZIcGdGbWY2Y0JKZ2hwaFNxemZzTkE4cU9XY09OazBwbjUvV1VXSWpwM0VV?=
 =?utf-8?B?Y3pSeCtJV015dWNVR0szZGRSaDdDQldlaGc2RFE3ZjdCYUtoemEyY2pnTm92?=
 =?utf-8?B?YndTaVVnOVFmK1g1Q3lUSkNyeU9VeXRRQXVHeDFJQ0xQdVZYdmgxcTIxSVZI?=
 =?utf-8?B?azF1QTNGWmUxNWNSOHdmdzd0SklJSkg5R2thS21lWGthalRaUVIvaHJvUkYx?=
 =?utf-8?B?LzMzS3VOQjU3cDR3WWJSR3YzTUZmblQ1QWpCZjJNOFVCTDRGU2VjZFo5Mmh6?=
 =?utf-8?B?clJ2VkhqVVJRbyswVENYQUtwZ1Y0djNoSUFjMGlRTUE2dUM0N1VCdlFMc28r?=
 =?utf-8?B?eG9VVjd5Q1ZwbUdraStkOHE0dkJ0MktJaHZtblJkTEhNV05RT01DZDF6akRv?=
 =?utf-8?B?MEliUTJoeVdSa2NNRHk1MHZ2S0NKQ0V0NmlDTkNOdHg3bVdGYTNZd1laLzAv?=
 =?utf-8?B?ZmRNaEZrNVdCbW5vZE9VdjBDT0Q1QWpvWC9wK2tpbmFMVm5Mc3dLK1QwN25V?=
 =?utf-8?B?azFhS1VOVjBqTk1raldKWU52T1VYU0tReEZxUDNndTkvMUduUDMxdWRHOTRP?=
 =?utf-8?B?R211T2lHcitLTEtKdFJVa3BiOTRRblRqYW1pVE8wSUI5a1hnd0hsRWRtazZr?=
 =?utf-8?B?aEFlN3pkTi95aVVQeXBvK2dsQ2IvOUxGQ0h3VGZTdUo3dnFGL3V1T25iVlJt?=
 =?utf-8?B?TXFzUFZ1VThaY1Ayeno4T25XYTVXTEJLck5MODN5d3dJOTR6Wk9sY2NGQTdk?=
 =?utf-8?B?enR0dEpURHVSdUxBdUNMY1JBRmNYa1hDLzRzUHNjRS9IS1FkR1crVURybW5v?=
 =?utf-8?B?bVJxMXM3M1c4NENvRE4wajB3TmFieFRPcmpGTWpmd1dkcXdpenVUaTJ3aTZ2?=
 =?utf-8?B?Mm5ZMC9QMFZWaGk1RVZKNmllejNkTW5sL21tRGdKRzVhS0ROVi84Y2lsOUVt?=
 =?utf-8?B?N3BuUUtScEdNNW1vWE4zaXNXdko4a3pRY2lzZFpneVZINERDYlZFSDZOU1VL?=
 =?utf-8?B?TmZxVW5nblBUZURzbVAvazNRQlN3YVJMN2d1cG5ZcnlEaWtDb096UFF4YjVv?=
 =?utf-8?B?Zy8xNW02eXI4bkw3YXF3bHR4V3BuQU9RWW9CU2puQ09YVlllbW9sVzRLZ0JJ?=
 =?utf-8?B?WHlxTWI4QldYaXdEZWFoWDhVRkVIWnk2VjE3MU5Tbm5NL3ByZjBmVTdKYXlk?=
 =?utf-8?B?ZG8xQmQ0cmdnVHhWb1RxSWErQVVIeWRPcEV5bkRFVWlGMU0xN1pkYTAzU3BF?=
 =?utf-8?B?ekFqVGk0SGYwN0RpT3BpZm16UDRRT29MVFliOXFwWGRSL2N3MmlJUlNmaCtT?=
 =?utf-8?B?aThleCtmVUkvSFMzd1E4dG9ueldsZlZTQ2JmaERSc1QzS1NsUUNRaWNXZDlY?=
 =?utf-8?Q?MhJDzN7COpvoSGGawhSJO4tZt?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <36C99CB5A6A57A4FAC29E500A362E6C6@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db92370-b746-4786-14bf-08dabcae0ace
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 08:41:31.7643
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AayWB9fU3bX8WZ0bj6v2tzwxE7YjvRodqQBKwyfcytanQPGXgvlL22luJjOh7P7Y5omMIhlUsl7+Gsc47yO9Sv5H7x0sAGcxuUPC43mRlhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5410

T24gMDEvMTEvMjAyMiAxNToyOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gV2hlbiBkZXN0cm95
aW5nIGEgZG9tYWluLCBhbnkgc3RhbGUgcGVybWlzc2lvbnMgb2YgdGhlIGRvbWFpbiBtdXN0IGJl
DQo+IHJlbW92ZWQgZnJvbSB0aGUgc3BlY2lhbCBub2RlcyAiQC4uLiIsIHRvby4gVGhpcyB3YXMg
bm90IGRvbmUgaW4gdGhlDQo+IGZpeCBmb3IgWFNBLTMyMi4NCj4NCj4gRml4ZXM6IDQ5NjMwNjMy
NGQ4ZCAoInRvb2xzL3hlbnN0b3JlOiByZXZva2UgYWNjZXNzIHJpZ2h0cyBmb3IgcmVtb3ZlZCBk
b21haW5zIikNCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
Pg0KPiBSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCg0KSGVu
cnksIHRoaXMgb25lIGFsc28gb3VnaHQgdG8gYmUgY29uc2lkZXJlZCBmb3IgNC4xNyBhdCB0aGlz
IHBvaW50LCBhcw0KaXQncyBhIGJ1Z2ZpeCB0byBzZWN1cml0eSBmaXguDQoNCkFzIG5vdGVkIGlu
IHRoZSBjb3ZlciBsZXR0ZXIsIGl0IGlzIFItYnkgYWxyZWFkeSBhcyBpdCBjYW1lIHVwIGluDQpw
cml2YXRlLCBidXQgd2FzIHVsdGltYXRlbHkgbm90IGluY2x1ZGVkIGluIHRoZSBzZWN1cml0eSBj
b250ZW50Lg0KDQpUaGFua3MsDQoNCn5BbmRyZXcNCg==

