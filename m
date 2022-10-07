Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EF75F7D29
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 20:10:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418216.662965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogrnH-0006VJ-E5; Fri, 07 Oct 2022 18:09:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418216.662965; Fri, 07 Oct 2022 18:09:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogrnH-0006TN-Au; Fri, 07 Oct 2022 18:09:55 +0000
Received: by outflank-mailman (input) for mailman id 418216;
 Fri, 07 Oct 2022 18:09:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PW8X=2I=citrix.com=prvs=2723e59b2=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ogrnF-0006TH-Uk
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 18:09:54 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b35aafa-466b-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 20:09:52 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Oct 2022 14:09:41 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SN4PR03MB6720.namprd03.prod.outlook.com (2603:10b6:806:1ef::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Fri, 7 Oct
 2022 18:09:39 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5709.015; Fri, 7 Oct 2022
 18:09:38 +0000
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
X-Inumbo-ID: 3b35aafa-466b-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665166192;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8zW/ySgS+9lnKtxD52Ap3bwv+jUBAFcFRypajQ4fiiY=;
  b=VgogzukGIu0tVY0aMouRFFVqsS7W6+XnAnYzeKtlZlakH1aOGObkWu+2
   sUq+UBbwuz7001pyAMT8WPLZSluB/e6TyII2e5RLW1t0Znaw9X65gRWvC
   PsEL/NV+Ikp3/UynOLc/UBLCMJ0/874hM8u+H+xje8DpoRi8+w0lPTQKV
   U=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 81866402
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ZEXkk60JRUTkdVqwkPbD5Qlwkn2cJEfYwER7XKvMYLTBsI5bpzYBz
 jEbWmuHO6zZNmrweoxwadnn9UsGupCDmtVhGwo5pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNJg06/gEk35q6r4GtH5gZWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqVE6LtpCG9zr
 sUDaw4GTE6xocKN7+OSH7wEasQLdKEHPas5k1Q5lHTzK6ZjRprOBaLX+dVfwTE8wNhUGurTb
 NYYbjwpawncZxpIOREcD5dWcOWA3yGjNWEH7g/F4/NpsgA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE1rafw32nANh6+LuQ6uROh3CvmV4oJCZGaUee8eCykHyGcocKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRur7+9WX+b7q2Trz65JW4SN2BqTS0ZSQoI5fHzrYd1iQjAJv54C7K8hNDxHTD2w
 hiJoTI4irFVitQEv42k+XjXjjTqoYLGJjPZ/S3SV2Ohqwl/NIisYtXx7UCBtKgRaoGEUlOGo
 X4I3dCE6/wDBo2MkyrLR/gRGLau5LCONzi0bUNTIqTNPg+FoxaLFb28KhkkTKu1Gq7ooQPUX
 XI=
IronPort-HdrOrdr: A9a23:sCQDD6jW3FUN1Rs8wokAuG7wIXBQX3l13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICRF4B8buYOCUghrTEGgE1/qv/9SAIVy1ygc578
 tdmsdFebrN5DRB7PoSpTPIa+rIo+P3v5xA592uqUuFJDsCA84P0+46MHfjLqQcfnglOXNNLu
 v52iMxnUvERZ14VKSGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3z8FOgk/gIsKwC
 zgqUjU96+ju/a0xlv3zGnI9albn9Pn159qGNGMsM4IMT/h4zzYJLiJGofy/wzdktvfrWrCo+
 O85yvI+P4DrE85S1vF4ycFHTOQlgrGpUWSkGNwykGT3PARDAhKd/apw7gpPCcxonBQwu2Vms
 hwrh2knosSAhXakCvn4d/UExlsi0qvuHIn1fUelnpFTOIlGfZsRKEkjTRo+a07bVTHwZFiFP
 MrANDX5f5Qf1/fZ3fFvnN3yNjpWngoBB+JTkULp8TQilFt7TtE5lpdwNZakmYL9Zo7RZUB7+
 PYMr5wnLULSsMNd6pyCOoIXMPyAG3QRhDHNn6UPD3cZek6EmOIr4Sy7KQ+5emsdpBNxJwumI
 7ZWFcdrmI2c1KGM7z74HSKyGG5fIyQZ0Wf9igF3ekJhlTVfsuaDQSTDFYzjsCnv/ITRsXGRv
 fbAuMlP8Pe
X-IronPort-AV: E=Sophos;i="5.95,167,1661832000"; 
   d="scan'208";a="81866402"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adwIheHNMlgIVqaNggpWUxkduE/5Ov8EJe7WYKub0ACYyyy3DV68p0G7NjWXRLdEAWLE7TWaPGKgfMaZkoD6gq8AcdKOzZlDPJ9pU6X2ZW7zScUnZ4orD3cVsh3g+sOV/9vsDMvVielDw/yKzT6WSoSKtDmE21FJW7ZBvby6KdGtIPx3jo/AHiyJq4N65c3fH3+uW8BO1x4NIqP0EcCzLAR5Fk3xIIWRV/d8+zPgTSUgkY7qmucqYGLB48XNwoOJQ4BjMmmR6dBxin7O5mf2RTQvOqrvRupv/chs1l6VJn2N2OBwjfgQeR0QRFnuvsT1nGQxmqhs4h5ehhWt2HBXtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zW/ySgS+9lnKtxD52Ap3bwv+jUBAFcFRypajQ4fiiY=;
 b=PCffC4v/bSPtYdMCFYsdKtGnq+I1u7dRT+rw7iLNDP73txae4C/CvRC1KstIRIgAL/q/KsIqRyeda6CTKyYv/Tnh3sGUxWCD5OEwmPS8Molkol5aweXdQqEJXoqaSUWWQFUJftqWfW8oNzGrdjr6pgmnAT4R5rX8lcqQ9ITy10QJPRArcvfoCzZ9xOYpuqNbiHU/cSOKBwS9qG6XYQY35/zhOG5+UXqA/XuEj1cAQYhkFmT0M4vTFwn6jSTAB9fdTSprZB9sLjiiKMHmPC3IhNKmkNhgrlU2ChqZxo/CZ6uvLumdiufAezdZ73RgM53Wt67mhrRfoMOKoTTVKaFV8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zW/ySgS+9lnKtxD52Ap3bwv+jUBAFcFRypajQ4fiiY=;
 b=AoguYWjEEvPfRC8K7NnRzvDROgtObbIrMcHlhBc1NgjT3EruRkrCo8b3CyfNm5Qz5ZX3GnJeFLImN6Nzjo/IvGTy1IJa/aprKZwXyB+m94VyG/PRtC85B+lR6e++EZCwQidR1lBUyd/c6KXzoHo7AooeSy+55qSyIuFcAAPWByg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 0/9] gnttab: further work from XSA-380 / -382 context
Thread-Topic: [PATCH 0/9] gnttab: further work from XSA-380 / -382 context
Thread-Index: AQHXmmIPP24RGEexIEa6TxPxC+1g3q4FcpIAgABIlwA=
Date: Fri, 7 Oct 2022 18:09:38 +0000
Message-ID: <25c2b0c1-d5fb-7a4a-016e-1d3192510d28@citrix.com>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
 <806fa06b-adee-caa5-0b6d-aaf1282fca11@suse.com>
In-Reply-To: <806fa06b-adee-caa5-0b6d-aaf1282fca11@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SN4PR03MB6720:EE_
x-ms-office365-filtering-correlation-id: 72d50bf1-7b5a-4e45-c177-08daa88f1985
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 eeazbK7oO+3rP0Q8+PHcufnIe14hrRJQqh7+5OlaGqIRdlqG6PoNAW5a6Jh0AXhJl5gSHmNrl89Mm1gCYSjoQ9vDNovxkJvWByz2NmLuQd2VTk4Lg4JNBub5CnRTE546PI11vd9ysk1QjuY7aoSyUBTzvTUcJLIFJNBSpuhgwVg8lOveIub6W69okKG70C9SR0EEh5W/rv8THGLXWMVE1Ov7Cx9DyNmXMUNGzga8dPmECdSCvY0onu8PpGMylqfmulFMTWyrJY/6oXgH+sxA7A9B2B67nBaBxhxe6sPpeyt9rfP/U4tZWxe0ySFSsA3ZsbXghU4vF9WC+rJWeHqi1M9Lpqdp6XSNBeYYJsP/W0yLod+oGhhBHFzrh4RAzhfxku0tCqukYP97j78BfvGiz03y7Pg3jBWUmKxsZurV7fCfvMGFQEmwiFEGN+7Jkw+90AxijWnppSRBpmYfc8GzqSkQj87mKfy038ZGfXxlBN4YaAx/VrxoBUAQQa5EW5VTo05c/zSB8gYl16XvjzAURHKA9xrC31CCAv6v/828FGoAVZV6vQkS2jB1dOzqTZyVcMhod4Lwd60kOwVUnr9XC9ww/QWZvWTJQo4C6L3s0Q/ULGrMfNiD/HD4CiU12tRsM9uSukGiuyWhMJPaW+ITBduer2zjHOv83pjpy/6wo9nQcXcovAsPcqB+cH6wb5DwuZljD3uYJ4m70+8osGUmMMQQqkVl1uWJc4HbHTqWbOXkw/n3gbnDHIH1KJA5kzHabX1UhSfNk4UjJGhZmE/wo6a86kje3PmRrLLWbNT0a7sGPSXJpnnhPdJUWJ18gVtwG8LBB7AP/gUDijgQHCa0fg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(451199015)(66446008)(31686004)(66946007)(76116006)(71200400001)(41300700001)(6506007)(91956017)(66476007)(64756008)(2906002)(66556008)(8676002)(5660300002)(2616005)(186003)(26005)(53546011)(31696002)(6486002)(83380400001)(4326008)(8936002)(86362001)(478600001)(54906003)(6512007)(110136005)(36756003)(38070700005)(82960400001)(122000001)(316002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TUlhd2huSU93ODYvSnBzSGFjSHZ0Q09kbEgrZm4vbXFuS0theElQZktxc2Vl?=
 =?utf-8?B?Z2RIcGFJalgwZXNxTHd2TVZDbUJPUXg4MjhSSFhSU1hSOE5nSUo4cGFBa0p1?=
 =?utf-8?B?TmZoOUN5bVNpRm4yMEtHRHZNZ2J2UExIZ21BT29hOTA5aFkwcVJaNGJjRGFh?=
 =?utf-8?B?QmxmZklLZHNZMXBrYktjMS9XbFY5dnh2T0t4QW9oYWYwWTRncklqeERnVTN6?=
 =?utf-8?B?S0wzR0RjbjhRRmJ2LzdJcjV4a0hkVG9odFBvWmVWandlRkFUMjJhOUVkU0hK?=
 =?utf-8?B?TVlORHZpRVRPbGUzOVRJUWN3R0dSbUV0Njd3RFdmNklLQ2k0YTYzQUpTaDBD?=
 =?utf-8?B?WTBCdGt3OE5DeFhMdk9Yb0h1ZkttTkRCZXlnTlg1YW5USThOcDlFai8yc3h4?=
 =?utf-8?B?cDhUQ3RVNVlreksyZ01NaW90M3ppRTRYUGhkb0J4U0NEQlVLdEloQmx0Wklm?=
 =?utf-8?B?ZUh0bzhyM1AwN2QrdVZIV2xOQmducktWM0Q1SE9uOHU4TEZ6aU14Y3FXZVNE?=
 =?utf-8?B?TTNtdjUzazdYUldZN3BpZmxQclNaK2hmaU9vUXlGNUw3T3E2T09tc3dWYjMz?=
 =?utf-8?B?TjBKazB6U1dpNndSemlFdFRRT005czNjd3FrL0tidWZXWjF5T1ZxVFBzblhu?=
 =?utf-8?B?L3g3TDlVZkJZeUNIY3pFUHk0VHFFUTR6aTRjNlNrcVZPNDMwVzAzREE2a2Fy?=
 =?utf-8?B?SStlSlFycDRzR1drSlYyYVFzVXgvTUlDb3VDdUw1ZS91RTJSdk9pdVhveitR?=
 =?utf-8?B?K3ZWSHVxVVd1OW9xSlZEczlkcTZFTFdDK0JzTDVLaDBjVjdTQVBoYjRLVGNh?=
 =?utf-8?B?RmsxbEJlRDdtbUMrOG9wSWk2YW8wdWdVTUlrTGxFOE1vRlZKRU8wTFM2RGRz?=
 =?utf-8?B?bjN5Q2RMdlFSU1ZncW0wRktVeDVRd3RoSlJHV3VaT1JUWUZiNHg0emFwRXZH?=
 =?utf-8?B?WHJKbFpRcDQxc1VqM1VIaVNkaE1POG83YWhiVFlLZThyS2lnOUl0WmRWQWhw?=
 =?utf-8?B?ajQ4TVh1NXdRendmY3pDZDcvT0JqSlB5YnVrbmdnbXlFeXUzMTRJZVBaOFhl?=
 =?utf-8?B?ZFV0VHU3eXZoR1NUU3NJUE42Um01Uys3eW5LU25icGJLazRiRUZXTUc3cWVT?=
 =?utf-8?B?RHZLM0xyQWpzVFQrQXR6N1BsSURFM0tCSjlVdnhKOWNpNGhvQkEvazR0YWRR?=
 =?utf-8?B?M1FqcThEVEp4ZW1QVjh2VGJ1YjFoY0hRZzhVdzhNeWZLTkZSSVZUUmRldU15?=
 =?utf-8?B?T3VxV2NKd1pvQ2NUWGd4Q3h0b1ZuT0pBalhacUFjTEJ1RWRUaDZmOEY1Ymgw?=
 =?utf-8?B?WXFVWTZsczczOVdJVm9BYjFWU3ZGYkRvYURTckRHVHErZEJWajBpallTcDRw?=
 =?utf-8?B?M21XRHl3ZHdxWUs5TmdwNW1CcURQK1lLWTNHNGp5elZ5OE1oSU9IVU1BdDZm?=
 =?utf-8?B?SW8rNERXcTArd1g1ck1pazVMWE5tdms1VlVCaXREUU93RFNxWHVBd3hpbkg1?=
 =?utf-8?B?T3d2L2RPRFg4RG9GWHNDUUxFR0ZNWTUreWllVXVvQXIvM1dlaWdKSHZybE5Z?=
 =?utf-8?B?MlhLTERrZjRsb0Q5cDNSWG1sL1N3T2kySnlZalQ4VVBHRGtGR0JEZWVLMVFH?=
 =?utf-8?B?d2ZjRDFJS2pMbHVraG5HTThmdkdsalhCVDhFZzdvQXdwQ3F3dUh6Z2NlV00x?=
 =?utf-8?B?TnZ6eVZ0VXN3Y2ZnbTNMTnRYZXJNbmVCUXI1anVDODU4QmFNeHRYUTJ3dTV3?=
 =?utf-8?B?RHZhRWFCbk1Ddk9WempZYU9ZOUo5SlBxanZGYldGSXBLRVlzSVU2UlV6bDFu?=
 =?utf-8?B?TWxRbVlRQVFQUHRHQlZJclVOZzZuNVpBMzEyOHZIbW1qRlltQ3Y2bS8zZ21z?=
 =?utf-8?B?N1RMcWlvamowQVBkb1RreHFMNitXaVBoTm1lRE1SY25xUGhmdEkweFlNUXgw?=
 =?utf-8?B?NVRDbmFGR1FmbzZQODdpVHV5NzZxT09BSTVERzVDYkZqc25SNkc5aUVvNUUx?=
 =?utf-8?B?dTlDNGJ5cVNBWmh6L2p2MzdoZlRCa0JoY2ZCcFRuZ3FITmVwUklvdnBpT0ZR?=
 =?utf-8?B?YjE1bS9Rd1psa0NCWjhxYVN3bTVPWGQrdXVmNUdWM09HTWdYeEVlRW9PdTdG?=
 =?utf-8?Q?qxDl0aFN9DgLGuLgFkAt91UJF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D5231C091E0C2428AAAB160C07B40B4@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d50bf1-7b5a-4e45-c177-08daa88f1985
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 18:09:38.7707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0VKyYybdif1MhVV+/Rg3a2AHRMpZgByf1wKsQ+S6AEacidw2OKVfgHAXhnrVyXaYz4j7rnkOgD/fdRZOnv+4MHtHuMi9idpkwvcMGe03vGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6720

T24gMDcvMTAvMjAyMiAxNDo0OSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI2LjA4LjIwMjEg
MTI6MDYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gVGhlIGZpcnN0IGZvdXIgcGF0Y2hlcyBjYW4g
YmUgYXR0cmlidXRlZCB0byB0aGUgZm9ybWVyLCB0aGUgbGFzdCBmb3VyDQo+PiBwYXRjaGVzIHRv
IHRoZSBsYXR0ZXIuIFRoZSBtaWRkbGUgcGF0Y2ggaGFkIGJlZW4gc3VibWl0dGVkIHN0YW5kYWxv
bmUNCj4+IGJlZm9yZSwgaGFzIGEgc3VpdGFibGUgUmV2aWV3ZWQtYnkgdGFnLCBidXQgYWxzbyBo
YXMgYW4gb2JqZWN0aW9uIGJ5DQo+PiBBbmRyZXcgcGVuZGluZywgd2hpY2ggdW5mb3J0dW5hdGVs
eSBoYXMgbGVhZCB0byB0aGlzIHBhdGNoIG5vdyBiZWluZw0KPj4gc3R1Y2suIFNob3J0IG9mIEFu
ZHJldyBiZWluZyB3aWxsaW5nIHRvIHNldHRsZSB0aGUgZGlzYWdyZWVtZW50IG1vcmUNCj4+IHdp
dGggSnVsaWVuIHRoYW4gd2l0aCBtZSAoYWx0aG91Z2ggSSdtIG9uIEp1bGllbidzIHNpZGUpLCBJ
IGhhdmUgbm8NCj4+IGlkZWEgd2hhdCB0byBkbyBoZXJlLg0KPj4NCj4+IFRoZXJlJ3MgcHJvYmFi
bHkgbm90IG11Y2ggaW50ZXJyZWxhdGlvbiBiZXR3ZWVuIHRoZSBwYXRjaGVzLCBzbyB0aGV5DQo+
PiBjYW4gcGVyaGFwcyBnbyBpbiBhYm91dCBhbnkgb3JkZXIuDQo+Pg0KPj4gMTogZGVmZXIgYWxs
b2NhdGlvbiBvZiBtYXB0cmFjayBmcmFtZXMgdGFibGUNCj4+IDI6IGRyb3AgYSByZWR1bmRhbnQg
ZXhwcmVzc2lvbiBmcm9tIGdudHRhYl9yZWxlYXNlX21hcHBpbmdzKCkNCj4+IDM6IGZvbGQgcmVj
dXJyaW5nIGlzX2lvbWVtX3BhZ2UoKQ0KPj4gNDogZHJvcCBHTlRNQVBfY2FuX2ZhaWwNCj4+IDU6
IGRlZmVyIGFsbG9jYXRpb24gb2Ygc3RhdHVzIGZyYW1lIHRyYWNraW5nIGFycmF5DQo+IEp1c3Qg
dG8gbWFrZSAib2ZmaWNpYWwiIHdoYXQgSSd2ZSBzYWlkIGluIHRoZSBjb3Vyc2Ugb2YgdGhlIHJl
c291cmNlDQo+IG1hbmFnZW1lbnQgZGlzY3Vzc2lvbiBhdCB0aGUgZXZlbnQgaW4gQ2FtYnJpZGdl
OiBJJ20gd2l0aGRyYXdpbmcgMQ0KPiBhbmQgNSwgaW4gdGhlIGV4cGVjdGF0aW9uIHRoYXQgZWFn
ZXIvbGF6eSBhbGxvY2F0aW9uIG9mIHJlc291cmNlcw0KPiB3aWxsIGJlY29tZSBhIHByb3BlcnR5
IHRvIGJlIGhvbm9yZWQgdW5pZm9ybWx5IGZvciBhIGd1ZXN0LiBXaXRoIDIsDQo+IDMsIDQsIGFu
ZCA2IGFscmVhZHkgaGF2aW5nIGdvbmUgaW4sIGl0IHdvdWxkIHN0aWxsIGJlIG5pY2UgdG8NCj4g
KGZpbmFsbHkpIGhhdmUgZmVlZGJhY2sgb24gLi4uDQoNClRvIHRoZXNlIGlzc3VlcyBpbiBwYXJ0
aWN1bGFyLCB0aGVyZSB3YXMgc3BlY2lmaWMgd29yayBkb25lIGluIDQuMTYgdG8NCmFkZHJlc3Mg
dGhlIGltcGFzc2UgaW4gYSB3YXkgd2hpY2ggZ290IHRoZSBzYXZpbmdzIGluIG1vc3QgY2FzZXMs
IGJ1dA0Kd2l0aG91dCBpbmNyZWFzaW5nIHRoZSByaXNrIG9mIGhpdHRpbmcga25vd24gYnVnZ3kg
cGF0aHMgaW4gZ3Vlc3QgZHJpdmVycy4NCg0KDQpGb3IgcGF0Y2ggNSwgdGhlIEFCSSBtYXggdmVy
c2lvbiBpcyBub3cga25vd24gdG8gZG9tYWluX2NyZWF0ZSgpLCBzbyB0aGUNCnN0YXR1cyBhcnJh
eSBhbGxvY2F0aW9uIGNhbiBzYWZlbHkgYmUgc2tpcHBlZCB3aGVuIGdudHRhYiB2MiBpc24ndA0K
YXZhaWxhYmxlLg0KDQpUaGlzIGdldHMgdGhlIHNhdmluZyBKdWxpZW4gd2FudHMgb24gQVJNLCBh
bmQgb24geDg2IHdlIG91Z2h0IHRvDQplbmNvdXJhZ2UgcGVvcGxlIHRvIHJlc3RyaWN0aW5nIHRv
IHYxIHdoZXJlIHBvc3NpYmxlLCBzbyB0aGV5IGdldCB0aGUNCnNhdmluZ3MgdG9vLg0KDQoNCkZv
ciBwYXRjaCAxLCBJIGFncmVlIHdpdGggdGhlIG9ic2VydmF0aW9uIHRoYXQgMTAyNCBtYXB0cmFj
ayBmcmFtZXMgaXMgYQ0Kc2lsbHkgZGVmYXVsdCB0byBoYXZlLsKgIEFkanVzdGluZyB0aGlzIGFw
cHJvcHJpYXRlbHkgd2lsbCByZXN1bHQgaW4gdGhlDQpraW5kIG9mIHNhdmluZ3Mgd2FudGVkIGlu
IHRoZSBwYXRjaCwgd2l0aG91dCBtb2RpZnlpbmcgdGhlIGh5cGVydmlzb3INCmRpcmVjdGx5Lg0K
DQpXZSBzaG91bGQgaGF2ZSBhIHBhdGNoIHRvIHhsIChvciBpcyBpdCBsaWJ4bD8pIHRvIG1ha2Ug
YSBiZXR0ZXIgY2hvaWNlDQp0aGFuIGJsaW5kbHkgcGlja2luZyAxMDI0Lg0KDQpIYXZpbmcgd3Jp
dHRlbiB0aGlzIG91dCwgc29tZXRoaW5nIGRvZXMgc3RyaWtlIG1lIGFzIG9kZC7CoCBUaGVzZSBs
aW1pdHMNCmFyZSBzcGVjaWZpZWQgaW4gZnJhbWVzLCBhbmQgZm9yIHRoZSBnbnR0YWIgbGltaXQs
IHRoaXMgZXF1YXRlcyBpbnRvIGENCmtub3duIG51bWJlciBvZiBncmFudHMuwqAgQnV0IHN0cnVj
dCBtYXB0cmFjayBpcyBpbnRlcm5hbCBYZW4sIHNvIHRoZQ0KdG9vbHN0YWNrIHNlbGVjdGluZyAx
MDI0IGZyYW1lcyBjYW4ndCBrbm93IGhvdyBtYW55IGdyYW50IG1hcHMgdGhhdA0KYWN0dWFsbHkg
ZXF1YXRlcyB0byBpbiBYZW4uwqAgUmlnaHQgbm93LCAxMDI0IG1hcHRyYWNrIGZyYW1lcyBlcXVh
dGVzIHRvDQoyXjE4IG1hcHBpbmdzIChJIHRoaW5rKS4NCg0KDQpGb3IgdHJhZGl0aW9uYWwgc2Vy
dmVyLXZpcnQgVk1zLCB0aGV5IGNhbiBoYXZlIDAgYmVjYXVzZSB0aGUgZnJvbnRlbmRzDQpzaG91
bGQgbmV2ZXIgYmUgbWFwcGluZyBncmFudHMuwqAgV2UgYWN0dWFsbHkgYWxyZWFkeSBkbyB0aGlz
IGZvciB0aGUNCnhlbnN0b3JlZCBzdHViZG9tLsKgIFRoZSBzYW1lIGlzIGFsbW9zdCBjZXJ0YWlu
bHkgdHJ1ZSBmb3IgcWVtdSBzdHViZG9tcy4NCg0KRm9yIFZNcyBpbiBhIGJpdCBvZiBhIG1vcmUg
aW50ZXJlc3RpbmcgY29uZmlndXJhdGlvbiwgZS5nLiB3aXRoIHZpcnRpbywNCnRoZW4gdGhleSBu
ZWVkICJzb21lIi4NCg0KRm9yIGRldmljZSBkcml2ZXIgVk1zLCB0aGV5IGRvIG5lZWQgYSBkb20w
LWxpa2UgbWFwcGluZyBjYXBhYmlsaXRpZXMuDQoNCkVpdGhlciB3YXksIHRoZXJlIGlzIGRlZmlu
aXRlbHkgcm9vbSB0byBpbXByb3ZlIHRoZSBzdGF0dXMgcXVvIHdpdGhvdXQNCmltcGFjdGluZyBy
dW50aW1lIHNhZmV0eS7CoCBJZiBwYXRjaGVzIHdlcmUgdG8gYXBwZWFyIHByb21wdGx5LCBJIHRo
aW5rDQp0aGVyZSdzIHByb2JhYmx5IHdpZ2dsZSByb29tIHRvIGNvbnNpZGVyIHRoZW0gZm9yIDQu
MTcgYXQgdGhpcyBwb2ludC4NCg0KfkFuZHJldw0K

