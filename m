Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEC24D2F0B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 13:30:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287788.487983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRvR0-0001s2-Vu; Wed, 09 Mar 2022 12:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287788.487983; Wed, 09 Mar 2022 12:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRvR0-0001pc-Si; Wed, 09 Mar 2022 12:28:54 +0000
Received: by outflank-mailman (input) for mailman id 287788;
 Wed, 09 Mar 2022 12:28:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QNbA=TU=citrix.com=prvs=060736ad3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRvQz-0001pW-Lq
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 12:28:53 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 783c8599-9fa4-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 13:28:51 +0100 (CET)
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
X-Inumbo-ID: 783c8599-9fa4-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646828931;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=P67N1ZTTgEkSaeRsVd6VH9tLrg2gd+J93oVT+KeOBWU=;
  b=WJSE49UguD/QZhs0h7OpY/3a7ICW/FEl+9RbN7q+9NV/l5KbW4MlXq49
   BPuyKNWrOszeGVuMB0X25fD0QisMkDmOKPCRLeYcvBRRaxk7hw0BDbCXm
   mja3P5eT2ILDUldCMdqN3aAI1Xw1J43/wu7SN95FMiYJDZCY1D4q9j0dX
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65807213
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:0yf62qxhybXGf+RSxtl6t+fDxirEfRIJ4+MujC+fZmUNrF6WrkVTy
 WsaC2mDOP2MM2Hzed5/btnn9E9TsZbUyII3HAJppSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYz2YnhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplspDpCl4CM/z2h+1ef0F/CXguY4NL0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2J0eRamEP
 pFxhTxHKzPDZxR1HHYsV5MRo9iEikn/cyRXpwfAzUYwyzeKl1EguFT3C/LrfdiNSdRQj1yvj
 GvM9GTkATkXLNWajzGC9xqEhOXCgCf6U4I6D6Cj+7hhh1j77nMXIA0bUx28u/bRokSzQc5FI
 koYvC8nt7Ev9VeDR8P4GRa/pRasvAMYWtdWO/037keK0KW8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq17ayIpDm/PSwUK24qZiIeSwYBpd75r+kOYgnnF4g5VvTv15usRG+2k
 2viQDUCa6s7isJSlPyQ8AH9nDvvisDuVFdluCvadzfwhu9mX7KNa4ut4FndyP9PKoeFU1WM1
 EQ5d9iiAPMmVs/UynHUKAkZNPTwvqvebmWA6bJ6N8R5r1yQF2ifkZe8Cd2UDGNgKY46dDDge
 yc/UisBtcYIbBNGgUKaCr9d6vjGL4C9TbwJtdiON7Kih6SdkifdokmCgmbKgwjQfLAEy/1XB
 HtiWZ/E4YwmIapm1iGqYOwWzKUmwCszrUuKG8ylkEr7i+rCOCLLIVvgDLdoRrpphE9jiF+Jm
 +uzyuPQk0kPOAEASnK/HXEvwaAiciFgWMGeRz1/fe+fOAt2cFzN+NeKqY7Nj7dNxvwP/s+Rp
 ynVchYBlDLX2C2WQS3XOysLQO6+Av5CQYcTYHVE0aCAgCN4P+5CLc43KvMKQFXQ3Lc6nKAuE
 KVdJZno7zYmYm2vxgnxpKLV9eRKXB+qmRiPL2yiZj0+dIRnXAvH5pnveQ6HycXEJnHfWRcWy
 1F46j7mfA==
IronPort-HdrOrdr: A9a23:+5gWwqk0dK+nAM9oWP4Ev2jvRUXpDfPCimdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcLC7WJVpQRvnhPhICK0qTMqftWjdyRGVxeRZjLcKrAeQfhEWmtQtsZ
 uINpIOdOEYbmIK/PoSgjPIa+rIqePvmMvD6Ja8vhVQpENRGtpdBm9Ce3im+yZNNXB77PQCZf
 2hDp0tnUveRZ1bVLXyOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mOryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idgrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT1vDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amGazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCR2B9vSyLaU5nlhBgu/DT1NU5DXStuA3Jy9/B96gIm0kyQlCAjtY4idnRpzuNId3AL3Z
 WADk1SrsA8ciYnV9MMOA4/e7rENoXse2O7DIvAGyWvKEk4U0i93qIfpo9FoN2XRA==
X-IronPort-AV: E=Sophos;i="5.90,167,1643691600"; 
   d="scan'208";a="65807213"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=em2rBtJuvG44AIN4t+W8ZwnymOynFu4DKXWimma7nTQUqQrQU7nPGr64GQbZhMGvmBBpu4eXujgHSAcO7mV638UDeiP1ziBRdo1MmtfBJZcQU/j8B7pAA/FetInmfq9dhWHoALdqEKuiNDcqQi4K040jCRh5bUQN+Z8Uf4tutVksmxbA0KiIQKoIybSXfdVLT+gXlOyR/PgB7XjvygdANLAGyPo9qOtba2E2AmyfGzdsGZ79WIWGytWBNnTToyCsPjn8hvvPahnvSK31H9E8AS3aMAP8kXZbLFptVrO7Pbkh7lUaO9HlNH8Xlk0psMMmorZpUD6byg9Ex4OfoO/Cyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dY8amo89ajKpys5sAOASBo6UmFGefJUev3QWXdCOhg=;
 b=P/a2ff13qOMtLT337uBu+nChuhNNqbKtQpCLYB5Yrf0UIqGU+EoB2rJoqMeNOBjcAO1Tmpqp/nEbPZBnYbHUNldkrFM+clEnN0JeymMqKx39rRxw320NXQG0ymnmYJG5ksCM/EBHhIzcmuC3bgh9RYHeYCh7qosU9S4yW4y5ZoIoFTFAtpzH6DvsKZtFmpb3xzitHLIr8nvpsDJhGInkLdBl7a0XMUF9Uad1FBQSwBKwEPu/DJhOrsMLtNv9Az3rjQmxkUfKPYKsQRygxhNrB6Cn//PMQ2SopIq5WHhKbmE7NP7l3IUn6qvnwpanAL+adlS7v8QXmZ/XOXnAtKWgWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dY8amo89ajKpys5sAOASBo6UmFGefJUev3QWXdCOhg=;
 b=W613nLlbGijlp51yMeIJk0J9ADcqgNphYdgHEY3faTkE/jdGwSEUHpc0gzhtLTNwyBq7RmAFhYVSfj4f4V5S2oy/KouIx0waJ6Ur2WJBIIvZzwAzDvzmfeX6T0O9eRMphI2yOCCnJDmBUXjHDpc/+KgBH7FBTh7GZTdYpG3+yYA=
Date: Wed, 9 Mar 2022 13:28:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v3 0/2] livepatch: enable -f{function,data}-sections
 compiler option
Message-ID: <YiiddqMEBtpI0W65@Air-de-Roger>
References: <20220308134924.83616-1-roger.pau@citrix.com>
 <3dcefa20-829a-ca13-941b-ede25ef81813@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3dcefa20-829a-ca13-941b-ede25ef81813@xen.org>
X-ClientProxiedBy: LO2P265CA0060.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a8acab4-ac5f-4d79-4d93-08da01c85956
X-MS-TrafficTypeDiagnostic: DM6PR03MB3596:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB35969AA333BEBC22D9D81AC88F0A9@DM6PR03MB3596.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9bauWFTveQVLsPWg7e4gv3IAJLlOwABf148vT1pjt8Nu3JQ8ar+oamIhsfsERrbDL5SYGSSFIPi2ChX+RA0AdFzjmbJ1zT9gHeCHhERSv0kUJqmMRcP4223QOr+OqoQmPUQKkPBkG7CMw8p1OxHq6AoMNichL2bq5yGJnnYfwZbwiEBK6pnJci1EEwX4ajmrUeqQxN2H+BImycjoFVSrwMFC5PmsbHskrLYbQYLAqu0CWvpC+RpWmy7jTR4zKtfykWSTg2ih1MzHaBr8w9Zt1pZzXvV7khpb8FXAwOno47/XPirQaJEXb68wp5dfF3V7D/WkNwcaCR7BSsk0TMmasNinN14dxWANfHu0uA3tGva/t9bPcCTvF5nT7PdSp6OOd23d+ET5JaxvL8ot1BB/svVNe5uZwZqJ53Zrmato5IHgSMD2Gshw5gbyzapNMog+UsguhhqzlL3UHfNdRKwIjr2c7akkiOivi+mpZXiTW+1Xb1hDJqS28ILsj0OZZCZIy7yx2zyOIZxSkDwWUs8psFgtroUGxwNQttNOm6smaQ7QRiiKK6QUBOMdlZ38znczBpoHWBpsoF71Qlmakw/HjDwOjwPLmoYGddxn5QxSfSIedhyp2Uk4HMyq0sEGjKRcsfZQKCx6yhxKyVsIsmPRMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(4744005)(6506007)(83380400001)(6666004)(66946007)(6512007)(6486002)(26005)(38100700002)(9686003)(53546011)(5660300002)(2906002)(8936002)(508600001)(66556008)(33716001)(66476007)(8676002)(316002)(107886003)(82960400001)(54906003)(4326008)(85182001)(6916009)(86362001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXdBeUp5Sm1UK0FUZ2lZMXQvOU1mRUpySEk4NjJtcE14cEYyaHFrRTVjNFhq?=
 =?utf-8?B?anAyUUQzRFEvYnNISDFXRnF2ZHBYa0REVS9IT2hMVWJHM2ZvYTFYbFkxbXZj?=
 =?utf-8?B?NkhaT3JtaUI2amtVSGp2cXN2ZStFaWQ2TlpTZkp0QlRtcDRrQXpjOGlUYzNJ?=
 =?utf-8?B?d1ZQNWVCQVNnU3B0bXREN1JOMWJYYWVYcDQ2T3pTK2gvZk1qalhHcVNTSjFw?=
 =?utf-8?B?cW9oa01UK3ZOY1RWNWZWODRJazNtK3h5a1NSL3ZaWWdWSkZoWEpoYytJOW1i?=
 =?utf-8?B?YitNamppVnAraDMrazcrcVFQM2MwWDB3L1UrNDc4NWNDWkV3TTdDOW5OTEEw?=
 =?utf-8?B?dXQwUTZSZlltNnRCRk5mL2huWExnbGt0REEvcG83T2h5N3cxL2d6bG82SFBD?=
 =?utf-8?B?Sk9lUUdZL21SVVcvbE9mRXBFT3hNaXpkVmc1SlRsOE92TSsxUnRneVdaVjk1?=
 =?utf-8?B?bUpPTWVuaGtsRzlhMTI4b2RKcC9aM0U5S0g1QkZ6L0tKbjFvZ2xra3dBalVG?=
 =?utf-8?B?Z2E5WEZ1aFhHckFhUXZZMjZrYUdwcW1Id1lVQU9qL2pwbDJaRnBVZ2ZNMlkz?=
 =?utf-8?B?dnpnOFg3L0NWMFl0ZGFnUU5Oejdza0FueW9ZWUIwNy9UZExrUWU2M252Rjdj?=
 =?utf-8?B?WGI1ekk1WjZvYjNZY2pVVlhtNnJxaVJ3ZVREREFJeDJSL01vc3RwUUMvTlhq?=
 =?utf-8?B?QlpML0N0ZkhkVE5QcEZ2WUt1RGp5czdLVXpydXBPMGVoOWZBd2RvUFkweGlr?=
 =?utf-8?B?Q0YyWTBUOWxaUUJxMGJucGlUcFkyYm1DKzBzKzV2bVNnOFhxcFlNT1BPc08v?=
 =?utf-8?B?RU9oN1piOFJWQ0lSazVTSWdrZmQwbnlVVDVqNzEza3VxYWxKYjF0eWg3WnlR?=
 =?utf-8?B?aUZxTEZwWE1VeURaSk10U2hJZXZKdGI4NzlLK25zeExKcjRZSnQ1K0UwQUg5?=
 =?utf-8?B?bHdvU25nVnlrWitTSTloaTdqUWJjandnQzg4UnlJdHhOQ29lSDBKZHZGS3h5?=
 =?utf-8?B?RWZ0R0RWenN3eDVLTUVRRk42ZXAvcXlBVlV6WHBtOGJzV2F1ME1UbVJIR0Rs?=
 =?utf-8?B?b2tzcU5IVmgzUjc1L2Z5U09tdkplWlN6SnNXckh3YWE4aHMycURCZFdXcy9K?=
 =?utf-8?B?Tm1Yalc0UXBWNWpiUnpXZ2J6emxrNjNWb09pY0xWelU2cUN4Ym5sSzJacktS?=
 =?utf-8?B?V21ybFc5RHRNZ2VRUllVeFo5dmV4MVAxai90UHdqVkdRRE9aekRUaEpRMUVN?=
 =?utf-8?B?TkxEN2VMNTZ6Sys1ZUtNRlhFeXZIL3RVRGpxeGI5amN2RGhuNXo4MmlqVmRZ?=
 =?utf-8?B?VEFqUnhNTXhGcU0xSWs2NVl5QitXdWs4RnpoTlpSY3p6aTFhbGw1d3IyUW5v?=
 =?utf-8?B?L2lreXlyOEV5NTlVQWhyT1g2aDlqRTJmdHlpWnlndmNnUE0yNURtZGNXYkE5?=
 =?utf-8?B?dHhkcUNEakRHUDRPWXRoNHRpVzhhbTlYMlc0Zno4R0JvRStVMlNtOTVHUTNz?=
 =?utf-8?B?anRrRlZqcHRYRE1NelVkNW1tanpIQ0JyTno3YkY4WVlrRVFLVUR0WkZTcVpi?=
 =?utf-8?B?RGtBZUtvM2dHVHlUYXFpSk1HUTcxV21NZEdLeWlTNldUZUtOQ3dkM2xUVlU5?=
 =?utf-8?B?S25aZFBLQmNYT0FEZ2MvMkZoUVVYUW41SWpqMlRKTVhwcnh5VkkvSlpPOHFI?=
 =?utf-8?B?T0p1N3lncmloWUlmdXF4YTdMcjA2ZWIvdG53Um1LQWlPL3d2T1FkUVUwek5K?=
 =?utf-8?B?RzRKSkFPRFI3M05WUG9yc1RXOWllMElETmtJWjE2Y2ZMbm1RTWVteFpvMVlX?=
 =?utf-8?B?cXdoQ09mRkNYdmgzZWg0MFQwQjhkdTlDYjVsNUllUk1PUFgrNU12OWhaTGli?=
 =?utf-8?B?eFUzdkFvQmdQZzZHN2d6blU3K2NmSnlFRm5UWWtKcFNtbFhOcHJxUE9Vdzk5?=
 =?utf-8?B?MnF0T0R0WHdYM2tsZ0ErOWRXVzdHcnp2TThQUTQ5TXZ5Y2Y0Y1JNYnJLemlW?=
 =?utf-8?B?c3BXbkg4d3VTYSt2QVZXTXZnNHEzUkJnVXV0SVVyMkp6NlA1ZCszRFBMck53?=
 =?utf-8?B?VUFHSERrb1F5bGlTcXk1WVpZK1NTN1BOUzJGM3pIUSt6MDl6OXdlNHVKT2Iv?=
 =?utf-8?B?YmNpVjRUK2M4R2NHZGw2RjhkR00zT3BnVmZNRlZtZHRPUGNMR0pyYXh0UzFO?=
 =?utf-8?Q?Yw03I94h3lIUOfC97par5Mo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8acab4-ac5f-4d79-4d93-08da01c85956
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 12:28:43.3073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGjsczImLw0ySND1DNwDHrC95DCePflZ6p6Li0PesjWGOlx+fotuUwlthYt7rKzmYbxWBTAhcwvamyYZaqcIPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3596
X-OriginatorOrg: citrix.com

On Tue, Mar 08, 2022 at 02:52:55PM +0000, Julien Grall wrote:
> Hi,
> 
> On 08/03/2022 13:49, Roger Pau Monne wrote:
> > Hello,
> > 
> > The content in v3 has been split in two patches, but is still mostly the
> > same. The main difference is that first patch does a bit of cleanup of
> > the build logic now that the header object file doesn't need to be the
> > first one passed to the linker script.
> > 
> > Thanks, Roger.
> > 
> > Roger Pau Monne (2):
> >    xen/build: put image header into a separate section
> >    livepatch: set -f{function,data}-sections compiler option
> 
> For the Arm bits:
> 
> Acked-by: Julien Grall <jgrall@amazon.com> # xen/arm

Thanks!

I don't think Acks require a scope tag, as you can only Ack changes to
the code you are a maintainer for?

OTOH a 'Reviewed-by:' tag would indeed need to be limited if it only
means to cover xen/arm bits.

In any case I've added the tag as provided to v4.

Roger.

