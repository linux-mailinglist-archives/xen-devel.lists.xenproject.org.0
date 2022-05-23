Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F63C5311A9
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 17:39:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336024.560251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntA8n-0007CV-Jb; Mon, 23 May 2022 15:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336024.560251; Mon, 23 May 2022 15:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntA8n-00079t-GX; Mon, 23 May 2022 15:38:41 +0000
Received: by outflank-mailman (input) for mailman id 336024;
 Mon, 23 May 2022 15:38:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p/R5=V7=citrix.com=prvs=135d8345b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ntA8l-00079n-FU
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 15:38:39 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64d9ea18-daae-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 17:38:30 +0200 (CEST)
Received: from mail-dm3nam07lp2046.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 May 2022 11:38:27 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5555.namprd03.prod.outlook.com (2603:10b6:208:29b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Mon, 23 May
 2022 15:38:25 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb%5]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 15:38:25 +0000
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
X-Inumbo-ID: 64d9ea18-daae-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653320316;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0th3acWlvmeJ7eA6A4XDR4zJeEt6USaJWRfKMgTsRxM=;
  b=I0i2X7GzGwU0mTx5B5Ru+Neulo7RTWDESWE81I+RPfNPP0qlEcLyTUEx
   fN7dvV+KkczVgnRQ4+9Sy9agZTg6dRxTPQj0yx6LGWb1kdMsmyISPLDru
   9POMWTqTlk1qzHfq+VjOG8KmAL0H0UOmqg3dv+iasxlfCf7kNK+IGfJGY
   8=;
X-IronPort-RemoteIP: 104.47.56.46
X-IronPort-MID: 74477978
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pZlYp64eucWVihihYYfoYgxRtArGchMFZxGqfqrLsTDasY5as4F+v
 mBOWjrTOviDY2GneogkPIvlpkNXsZLQm4RrQANv/yg0Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YXjWFvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurS+FTYzE/TIid87dCJnSzN6ZrBeyIb+dC3XXcy7lyUqclPK6tA2VgQaGNZd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiUo4MGtNszrpkm8fL2T
 swVczdwKj/HZAVCIAw/A5Mihua4wHL4dlW0rXrK+fZovDmMnGSd1pDPbf6OfcWpGPlJvU295
 Wzsw2/THkgjYYn3JT2ttyjEavX0tSHmXIMfEpWo+/gsh0ecrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdwajvHeOsxoYWtxRO+438geAzuzT+QnxLmIJVCJbYdoq8so/XyU31
 0ShlsnsQzdotdW9S3iQ67OVpjOaIjUOICkJYipsZRQBy8nupsc0lB2nczp4OKu8j9mwFTSrx
 TmP9Hc6n+9L0ZBN0Lin91fahT7qvoLOUgM++gTQWCSi8x99Y4mmIYev7DA38Mp9EWpQdXHZ1
 FBspiRUxLpm4U2l/MBVfNgwIQ==
IronPort-HdrOrdr: A9a23:P101dqEUs6NKD3swpLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-IronPort-AV: E=Sophos;i="5.91,246,1647316800"; 
   d="scan'208";a="74477978"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kzbio585ZMSDylgFkZKq+LfgH8IUk0wt5wfXaCmUpjdyZFaOkK+XZFvB+Id1x7zNr9oQkKAkFa+8Dn09h2C4xWgl3yBNqP3EbzOSolqcpJ2E/o4eVUIHQ/aJGAxHAYlziht91rA5gJwx72im2TQweVtTLvEkIJiRyXZAdlWoF0gY8CRgiRFVm0JFefrYGsPGRAGfYrVR8vSRQXo3HxNRfpYktZI3seIiSVqFPbceEplOCyQRxUE4JIu+6zOuQoG4eyDrK7a5DSaz+qIT4UYZrnPtO5O7I4b+Kk+PX1zYXWYYCMnnfyOwnVpWLBc+tmDiHZ45HAlj87uDNYxkr5rYig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0th3acWlvmeJ7eA6A4XDR4zJeEt6USaJWRfKMgTsRxM=;
 b=B0O04L5cO+QdAwy+HZw6MbqFDs0NWBQJfFGIHofXgyLozUJW0qNtSvLo3z9X0ID+TVaXEYIJY2dTmiWNucMC6lYdsHwOW/1Qo24fkDckJ6t4hxZLlN0iM3og+SAjjrAL2ccU138KXZdNXS/LKSXZKL4FUxIIn6lGSKIRlGp/Cw0hl9TCrkhxpqAuDPOTR8jT4m8oWJFOpnjeodmZASuL0yBdOt1UskYppaYApfqxrvGUMEyVBGQpuE2L50/HArgTYv4lpqyF0oKoSk2XtMe5SrXspOZMpr2pefLLMUxvxTWT7y+z+TGj3YXQm5WUCH85brcaqWB8c2zqzLxTE8QNoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0th3acWlvmeJ7eA6A4XDR4zJeEt6USaJWRfKMgTsRxM=;
 b=OUM6zx4aqaHtUGjCBxwJ/kEgDyQjGoMklC15/Kn2TMAjMr07SXL0biR6L6KRRsAz5MxcSrzTT9TKCv/9YjfaOUwd6NdigZgRr+q3Oi6M3Vc31Bt/POtqXmm/h8ItkoDkB6h8cevpJJEjbWt723jZcPkjEUFty5P14uqpISB1zYI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Julien Grall <julien@xen.org>, =?utf-8?B?TGluIExpdSDvvIjliJjmnpfvvIk=?=
	<lin.liu@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, George Dunlap <George.Dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 4/6] xen: Switch to byteswap
Thread-Topic: [PATCH v5 4/6] xen: Switch to byteswap
Thread-Index: AQHYbrSoBny5rzyC0E2y+TdaF5bLfK0sjRSAgAALyQA=
Date: Mon, 23 May 2022 15:38:24 +0000
Message-ID: <d77a5995-a916-70a9-4bf2-efdb2948588b@citrix.com>
References: <cover.1653314499.git.lin.liu@citrix.com>
 <dcabb541d0b5ab7858ccf1c925afc334f3123ad5.1653314499.git.lin.liu@citrix.com>
 <8fcd30a6-9b93-6687-a0f5-1e035fa5f789@xen.org>
In-Reply-To: <8fcd30a6-9b93-6687-a0f5-1e035fa5f789@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0929dd7a-6b64-4085-c25d-08da3cd24689
x-ms-traffictypediagnostic: BLAPR03MB5555:EE_
x-microsoft-antispam-prvs:
 <BLAPR03MB555507AEA5787D5ADCB07740BAD49@BLAPR03MB5555.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 yGHbscSnTp8Pp/9Np8bujI2SDOAME3Aa6WdltSkn/G/qKwtcD0KPmds9X+YouvYqNG71pYiKll/Im+iWx/nzUgLSDmoL7nolsrDcbpfU0xScowfRjUdU+2mt8TUiD2GPtAhDPj4FVCJGj9XGJ7QC9bQRMgCiGQv68QpWX8JEMYsfe2Cuh1uWPc5PpmuE5/GzbzjLe0v9c9+u039vPqQGSIGEaa3fhDgVQmeyahpopSEhysFR1BpshBQSEiIgmmqJOllLKjslr82X8RiC7ZaPQyyT6QjSjPKRnoaChSpUWlHNx7cNoTBdCNo/s1ViAWWpc/IL4tpBfg4BDV+MARNkSfJf3eluIVUl9dnYj1DBnZL5fvB/b+QIXZcPurOWAh49FsFHbzw05WcpJSzKQCVJp8iimoPW1DqEj5pfC7eJt5PsolIbACY4zFOgMsbV1SAxTaF0l6sesOLvzCF7PZpBW2Gvuutxo4R6JpylpSQTjGXrqiqttrTDkvP1FmYbvtuWfLkULiTYjiwp809qgUYYbn9gu39hICEtQHPvL7jnjoNZKCjwVReNnZDIMHnaIH4mlhFoi66TJo3xajWpiNbLjrXMUWh/wmR6Jg6PMxK7LRKaH4oHKVEz6G2S01yPtRELPZMdEsH5B8LwxEXxT7fj/7U3pZ8E8mN06gyihVLpIR7EFxYoc4QrKxb58llm1C3bO03CXhtRjgeEoS/uSDZ8hyHsRyggykjfLGXcVFkOG9EiDvbBrGQ5TLKaPaPz+e2ZzBKLurNrHm3u9v3COMexUQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(6512007)(54906003)(110136005)(186003)(6506007)(2616005)(53546011)(26005)(31686004)(508600001)(6486002)(36756003)(76116006)(83380400001)(316002)(2906002)(8936002)(4744005)(5660300002)(66446008)(64756008)(66946007)(66556008)(8676002)(4326008)(66476007)(91956017)(82960400001)(38070700005)(31696002)(86362001)(38100700002)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S0tRMmQyRE9za3NMWW9nblYvQ01rUi9XWTRqbHhzSjE2ODlGS3RoZTNiZ0pa?=
 =?utf-8?B?WjZpTSt0M0xseDBYc0NvMkxRbjMrbk1UWk5Ja3dkdmF5eUxlYVdVczV1Y2o5?=
 =?utf-8?B?S2NERVVUNE8rTlpOc05UYU85ZklVWEtGdkdGdmg3NXBXOXRNQ1VsR1Y0T2Uz?=
 =?utf-8?B?QisydkxTL2VrNk9ERlF2bmdQQ0ZCZkdBMXRxN1pFbmhlQ0V3UzlZbjMyTCtE?=
 =?utf-8?B?cEI0Z0NnZEpzN3d6OWtwN1ZubTRVV1hIdzBmNDNtL0x3US9MSVJMbVc0MUkz?=
 =?utf-8?B?Rmx3Q3dNUUJjN1ZUU0txUjJxQ3ZPYklFV3ZtZ3B5bHR5NmN0dE9ka1Y0dDRa?=
 =?utf-8?B?Q2J0enpmcks3dkJ4YUlHUTdDNTB1WG16b0tJQVNWOGRsOUIzeWFDK3VZS0Vx?=
 =?utf-8?B?MXpqNTdDNEllaDVoVmx6R2VBWVU4c0s5cGc4aVA1dVdOL2tKUTlVNWFYb28z?=
 =?utf-8?B?cmkyZ0xWbkRSaER5VjFXblFDdmZ4eHVwdUxPKzBVT09BN3lGVTZ1djM2dnBW?=
 =?utf-8?B?Q3o5MDRQM1B3WkNESGxaejEycVdlTkVuODU3SjRxRzBpZnVSLzBBc294c2VJ?=
 =?utf-8?B?UFJOTEErOWdLTk9DV3ExT0Z5b0ZhMGRkM1krejFGYlIwdGt0MjhlUk1PVUJW?=
 =?utf-8?B?YUgzUi9jemVCczBzR1ZIT0szTHZUT0s3NzJCeEZjQmlOM1RycVF6T3d1SGs4?=
 =?utf-8?B?Skg5RjlZNzh0VzF4VGNzdjVHM2hYeUh0endoRWZNMjUrOWdYUmRydjA1U0VQ?=
 =?utf-8?B?YTdzL2NZZG9qZkRGYzc3SW1zS2pSMnRVTThkN3RaRHd5dUpsYXJWRVdXUmUw?=
 =?utf-8?B?UGgyUk5Lc2gzc3ZmNGVqUWVyTnNEZEwwUDcwdXdmMWpiNFIxem51eXFlUXoz?=
 =?utf-8?B?RDJrN3lsSXJvUk1tOW1PMFBUb1VkQXBzYWhSZDRyWE1XbXlOeWk0aHViRERW?=
 =?utf-8?B?ZmVraEgxeEVFTVdHdVplUHNMWWsxSjd1Ui9qZ1lpSGdiaGgzZzV6R3dqVmxP?=
 =?utf-8?B?b2lIdUg0NmRqMEhQQzRHU2JEVkxiZnRZTlFwU3pDOFgyeWxwUUFsQXFBNUFG?=
 =?utf-8?B?SjJoM2E1U3pXTU5BdXRZYWtYM1hPNXp5NWlyWmc3UWpic3dPWTc3WFAvUkdv?=
 =?utf-8?B?QnVHNFVNbTF0NWJ2RjZJeEpodnZONnVGemFuanpzd0V6V3NHZDRXZTNWdUpG?=
 =?utf-8?B?WnUwRUhSYjdxNnlBc3E4TVQ0em9sM2NGSEVFY21VeDREWERsbjRGcGhPdm5w?=
 =?utf-8?B?dDk2KzVxVnpjS2c0YU9FSzVjeFloYmhwQkVhMEU5UWk3RHZRYzBuV2tyK2lG?=
 =?utf-8?B?WVBqRi82dE5XdGh1K0pHTnFlbGNDYUxxWjZacjZBTEt1aXN3VC8zY3g5RjNW?=
 =?utf-8?B?aVorWVJjeDZJdUpKb1R1MTNyd293L2d5dUxWNGwxRzNDSVBlVFhsSnhLK05j?=
 =?utf-8?B?NU1xRXV2Y21ZRFVDNitTUDJsZXdsWDhpeVZCZGZEdUgzZUd0Q3pZbThqYzZS?=
 =?utf-8?B?MWs1ZHh2aU00Wk1HREdka285c3pPeFJJbmhqYm9NMWFUZFRucnlNWkNsdno1?=
 =?utf-8?B?UVdPWk5HQXoxbDA0dzA0Nkp0U0lXZG01RkUxQjNHVGc1SDdWdy9XeFVRdEcv?=
 =?utf-8?B?UjFDNmwySVdZdmx4V3BoaHM2NWRldVpGb0Rrdk9YOVhISG5yaHVSR3k5WHJU?=
 =?utf-8?B?Q1Fya1RraUpnZjBCRzJsc1BRa2tIQmJzSGRvdnpDRHlDbi9XWkYvRXIrTE1X?=
 =?utf-8?B?YW1aaXhYbG1nVWZucHJyazZGaUlFU2ptaUprWnUrN2JCTW4xMmpGM2thL0Va?=
 =?utf-8?B?N2hRWURZT1NFNXQyNFBwUy9EdHN1K3pwK2pBWHBFTVhrK3E1Q2Z1TWNReDgz?=
 =?utf-8?B?aisrOXJyQXg5MjQ1SzV5NC9OSWl2UC9aTnRWZ280TzFOYkpKM2wwMHlvQ3lD?=
 =?utf-8?B?c29FOGtiQlZxL2pEa2ZGWWEybFpCVmZUUEt1RWkwY0pZOUloUTY5RGhwWW1Y?=
 =?utf-8?B?eWNMSWhrNnVzODBuRG95THBRQW9EcDNzNlduMHBHQkFjTUNVU0Y4VURYeGcr?=
 =?utf-8?B?N1lPenpNTml6ckx5SmhZbUlzYVdkNE5QQjRLS2REVlBjVUIrcWszeG1oRUVS?=
 =?utf-8?B?b3NDNGh1WHl6c0lsM214ZFE3eTFoUXlFNXlPd3ZBRzRhc0dvUzlQVFJXcVJv?=
 =?utf-8?B?SGpmOGNiVmN0d0RPb05MZDVQZG13WWpuWW9ZS0wwWE1TTW54M05XWFdGODJF?=
 =?utf-8?B?dzBvV1Erc2tGWllMMXU5UTd2bElKRXBxenFTSzQrVzVXWVg0blRZb043Y0dn?=
 =?utf-8?B?VXpGYU9UVUl6aktQeStsZzBTWi8zMUowQmI0TzQ1bTIzR3pjSUY0bDdLOWp1?=
 =?utf-8?Q?7E69buyc4WNZaPJI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BEB54FE291959C42A0686610D001ED88@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0929dd7a-6b64-4085-c25d-08da3cd24689
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2022 15:38:24.9797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JKSFL4nLgvO/g/KIFBmbJwq+eKxWxyYIWvk+JCQizWDgJPvnF8+9rov4NWzpLU642nYrpZAeHlmjESzdppfqXx3KkMhJOoKD9WNwnYE8UZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5555

T24gMjMvMDUvMjAyMiAxNTo1NiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSwNCj4NCj4gT24g
MjMvMDUvMjAyMiAxNTo1MCwgTGluIExpdSB3cm90ZToNCj4+IFVwZGF0ZSB0byB1c2UgYnl0ZXN3
YXAgdG8gc3dhcCBieXRlcw0KPj4gYmUqX3RvX2NwdXAocCkgaXMgc2hvcnQgZm9yIGJlKnRvX2Nw
dSgqcCksIHVwZGF0ZSB0byB1c2UgbGF0dGVyDQo+PiBvbmUgZXhwbGljdGx5DQo+DQo+IEJ1dCB3
aHk/DQoNCkJlY2F1c2UgZGVsZXRpbmcgY29kZSBvYmZ1c2NhdGlvbiBjb25zdHJ1Y3RzICppcyog
dGhlIHBvaW50IG9mIHRoZSBjbGVhbnVwLg0KDQo+IEkgcmVhbGx5IGRvbid0IGhhdmUgYSBzdWdn
ZXN0aW9uIG9uIHRoZSBjb21tZW50IGJlY2F1c2UgSSBkaXNhZ3JlZQ0KPiAoYW5kIEFGQUlDVCBK
YW4gYXMgd2VsbCkgd2l0aCB0aGUgYXBwcm9hY2guDQoNCkRyb3BwaW5nIHRoZSBvYmZ1c2NhdGlv
biBoYXMgdW5jb3ZlcmVkIHByZS1leGlzdGluZyBidWdzIGluIHRoZQ0KaHlwZXJ2aXNvci7CoCBU
aGUgc2VyaWVzIHN0YW5kcyBvbiBpdHMgb3duIG1lcml0Lg0KDQpXaGlsZSBJIGNhbid0IGhlbHAg
aWYgeW91IGxpa2UgaXQgb3Igbm90LCBpdCByZWFsbHkgZG9lcyBicmluZyBhbg0KaW1wcm92ZW1l
bnQgdG8gY29kZSBxdWFsaXR5IGFuZCBsZWdpYmlsaXR5Lg0KDQpJZiB5b3UgaGF2ZSBubyB0ZWNo
bmljYWwgb2JqZWN0aW9ucywgYW5kIG5vIHN1Z2dlc3Rpb25zIGZvciBob3cgdG8gZG8gaXQNCmRp
ZmZlcmVudGx5IHdoaWxlIHJldGFpbmluZyB0aGUgcXVhbGl0eSBhbmQgbGVnaWJpbGl0eSBpbXBy
b3ZlbWVudHMsDQp0aGVuICJJIGRvbid0IGxpa2UgaXQiIGRvZXNuJ3QgYmxvY2sgaXQgZ29pbmcg
aW4uDQoNCkkgc3BlY2lmaWNhbGx5IGRvIGxpa2UgdGhpcyBjaGFuZ2UsIGJlY2F1c2UgaXQgZG9l
cyBpbXByb3ZlIHRoZSBjb2RlYmFzZS4NCg0KfkFuZHJldw0K

