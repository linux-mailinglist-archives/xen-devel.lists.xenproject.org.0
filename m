Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B005754EA
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 20:26:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367763.598879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oC3WJ-00033n-6j; Thu, 14 Jul 2022 18:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367763.598879; Thu, 14 Jul 2022 18:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oC3WJ-00030w-3A; Thu, 14 Jul 2022 18:25:03 +0000
Received: by outflank-mailman (input) for mailman id 367763;
 Thu, 14 Jul 2022 18:25:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4joA=XT=citrix.com=prvs=1872ec3d0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oC3WH-00030q-9X
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 18:25:01 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 425e6351-03a2-11ed-924f-1f966e50362f;
 Thu, 14 Jul 2022 20:24:58 +0200 (CEST)
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Jul 2022 14:24:45 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 14 Jul
 2022 18:24:43 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 18:24:43 +0000
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
X-Inumbo-ID: 425e6351-03a2-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657823097;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=nig3n99PepNWWrv6rObTVnq+5T0F8QPKeXChqjVlbWA=;
  b=SUPZ9NBU0x++qZGWjQG+SHnBQNftiY4RJgsIhmxXBtw6RebXCoatDrBI
   +ZmRqDWijD7wJzXCgk2eIKj6zE4MoODaPPrOhOofSsLZRcPdDlZpzqIRt
   qs7sG2bSmeRQ45l1H+ws7eD5foqzxhQvZtEk0uEPTNE0QuqJEfjQEIIBF
   k=;
X-IronPort-RemoteIP: 104.47.59.173
X-IronPort-MID: 75642553
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:CqexVKjJF2ipjiMX5CgKXIWTX161nxEKZh0ujC45NGQN5FlHY01je
 htvXj+BO/6CYzOjLdF3Oty/8BwEsMDdn9U2TQJp+3s3RXkb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglaAr414rZ8Ek15Kur5GtD1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eJdQp5tRYL291s
 uUVLmAgdDylqc7nz+fuIgVsrpxLwMjDGqo64ysl4RSHSPEsTNbEXrnA4sJe0HEonMdSEP3CZ
 s0fLz1ycBDHZB4JMVASYH48tL7w2j+jLHsF+RTM+vFfD2v7lWSd1JDENtbPd8PMbsJShkuC/
 UrN/njjAwFcP9uaodaA2i3x2LOVwH6gMG4UPI2m39tApFOP+mcWBQUfDQCgmtCjpHfrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAgUzVILvIvssQ7QTg3/
 laTmpXiAjkHmLicVXKc+6rSsTqoIyERBXcYYjMDSw4M4t2lq4Y25jrNRNt+FK++jvXuBCr9h
 TuNqUAWhagXjMMN/7W2+xbAmT3EjoPSUgc/6wHTX2SkxgB0foioY8qv81ezxelEBJaUSB+Gp
 ndspiSFxOUHDJXImCnTRuwIReut/6zcb2aahkNzFZ488Tjr42SkYY1b/DB5IgFuL9oAfjjqJ
 kTUvGu9+aNuAZdjVocvC6rZNijg5fGI+QjNPhwMUudzXw==
IronPort-HdrOrdr: A9a23:84IEHq1fyZyWOwqb2vl37QqjBRFyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHQYc2/hdAV7QZnidhILOFvAv0WKC+UyrJ8SazIJgPM
 hbAs9D4bHLbGSSyPyKmDVQcOxQj+VvkprY49s2pk0FJW4FV0gj1XYBNu/xKDwVeOAyP+tcKH
 Pq3Lsjm9PPQxQqR/X+IkNAc/nIptXNmp6jSwUBHQQb5A6Hii7twKLmEjCDty1uEg9n8PMHyy
 zoggb57qKsv7WQ0RnHzVLe6JxQhZ/I1sZDPsqRkcIYQw+cyjpAJb4RGIFqjgpF5d1H22xa1O
 UkZC1QePib3kmhPF1dZyGdnTUIngxeskMKgmXo/EcL6faJOA7STfAxy76xOyGplXbJ9rtHod
 129nPcuJxNARzamiPho9DOShFxj0Kx5WEviOgJkhVkIMIjgZJq3PsiFXluYeE9NTO/7JpiHP
 hlDcna6voTeVSGb2rBtm0qxNC3RHw8EhqPX0BH46WuonNrtWE8y1FdyN0Un38G+p54Q55Y5/
 7cOqAtkL1VVMcZYa90Ge9ES8qqDW7GRw7KLQupUBzaPbBCP2iIp4/84b0z6u3vcJsUzIEqkJ
 CES19cvX5aQTObNSRP5uw/zvngehTMYd228LAu23FQgMyOeJP7dSueVVspj8ys5/0CH8yzYY
 fABK5r
X-IronPort-AV: E=Sophos;i="5.92,272,1650945600"; 
   d="scan'208";a="75642553"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFY90l9qWo6WCjq1WCPhIbgucKS7Ae5w9qMtK99sFATo41Rb9IQJ7LCNNk/O/IvaEB9Y0jOQvk1wTRBi5m0YZGZ6yoL84WLrwxN445+MAGl8X+hp0VoR6z4PiOk+N5Dx3naw2u1f42eke+OJ4zAgId6N43W6F0SNV+6XsHqbkFNASBGn2MnlFFE7YBbSAFOQ4MXRH24x3yqfJ2WPvyy2lu8T2q0glGecUzQgobK5hqyNpMPZOUjHMJKSopUrpK27OXuEJa6wJDv2PVgswCldx3erQKhqbRwkbPnZeeyJOZq1s+S0++VUbMSRAHuFJ8lISjXKPzrTE29zDIF6UYLylQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nig3n99PepNWWrv6rObTVnq+5T0F8QPKeXChqjVlbWA=;
 b=h4tymM3Q+jMu3FzyWHL8WtIaZn4S44KM+8AiAoa7KgT7AiynVd9/WPTQ5EPQbUl+SA1jQd1NWj3oDPsXw+KPGEO1+cW39acdrSyEExQnFQpHIEoxfHXK3NFSAQP0hA7oqf5aJDWBHJo23eXkVJPKElbNrKlYbiS9/pUXphKZgCA68JhWi+QYNewtzvaNayxPMtEHTifSrIVy5XixkJpU68RUBdc+fJEWlb0ELu/pbtcetkMWy3HzQvbHY8G+Fflxqz5hpzBpC/+JXz/BFdMMGzKe7R3kK53MtoKKi6AB4/XKYhizazndoKMi06RPXG8J5ytphCVjnIcftjoflANFtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nig3n99PepNWWrv6rObTVnq+5T0F8QPKeXChqjVlbWA=;
 b=kUdsankuF/23fsmePsBCW9pncNKFUudS3c9tsVl+OFIEhQ+fW/CTMH1G2UHiPpMEGhmi4OcpaTgL0CqV2Ihbqazr6OzpzQ7IbQdu51BAiCI9ju/r5veXE9qSS3qdjvLZ9/cEnANpqtQuGDinc+qBjNT40oDVJT+9EICQZC8D5ik=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Mathieu Tarral
	<mathieu.tarral@protonmail.com>, George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 1/2] xen: Fix check-endbr with mawk
Thread-Topic: [XEN PATCH 1/2] xen: Fix check-endbr with mawk
Thread-Index: AQHYl4+Dg7FHxwiGFEGkNOu8rM/Cw61+LtiA
Date: Thu, 14 Jul 2022 18:24:42 +0000
Message-ID: <8790939e-7f92-a3b5-9433-335b9875693e@citrix.com>
References: <20220714143907.25938-1-anthony.perard@citrix.com>
 <20220714143907.25938-2-anthony.perard@citrix.com>
In-Reply-To: <20220714143907.25938-2-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e61f88f-3476-451a-0097-08da65c61f5d
x-ms-traffictypediagnostic: PH0PR03MB5669:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 k0u3CAEHzD8nU2mh4d0bD9AhhlExkLdhFKb9VV4hE4tWrAa0Abtl88g4a5CIrADtV157atN9iAHaQeMHCOlSrnz4yfQE4hVxiB06Gu6Km2Az/eiKVjvKT2IAU72ZUhdIB6B3iHUs0kWKHHTuxpN/0eCUzZk3ZE5p94KQ3vprP1PXTxy5vZVOeDHIs+adka6sVOEE8Vy3HObJlqfFlaPbDoz8C+JKFzPpq28t7WJzj1nRO9UqJKw5upmD13srnwNJ+W/ZZeHx5cngCj2OsmKlL2tJ1dhf0A3hjg2/ZItkGTXnhdtvYspYdtmaGjGc4v6WEKTliEpENdMVjaoiMtSqypPNFoTbjYqPtwXqiy6P8PmdG61s6ZlCLP58KgEPio29XuBAQYyu6nlVik+yr2aBQDhoq+81bls26KbVBGJxg8uGM9lSL8Uw2QuFuX0rIqklo8bkfqLQ9lkNEB4BJulghDUTK2zRRIcnML3ilJt/gTioIPNoesLXLIMeOAHXL0py9dB/Jz5bXsPe0uUDRztjsXzXuIBXtlucYuX2tGa/I9Q8ls4IGyeuvM/LrEeR79y1Z6mL1QQSOejJuQNLGX9g9WjKraVfth4n4SCzZYZDW7mcCrryiwJUFFjtQlOPA6ktAQ5v9OP/ZwA6t2jstBjYWoZi+Kd6aR7E9PRvjucYPD2L+B/9AiKM3xBYV5GVBK2QY+x9yRk2sM+96/QsZ/VzB4Bs2mU5gmeAvB+nNG8FbracwDBvkrX3vaWyTW8Qk13IAvNT2rizROoudacI546/oI1bNcwBjzxNbiTHJCblhfyr2XLBucNUglxjSrlT8n33nBfWzF1srDr1GnNllKWK5IZGtaBPShOPoWxMnu/pqbaHYUOXuWu0F7XUsNiXsJAKHgIa8I9n/XeSNiIyf/XyJ2jGUy0zjxi9+SrVQhE4weI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(136003)(366004)(346002)(31696002)(86362001)(5660300002)(38070700005)(186003)(2616005)(82960400001)(8936002)(4326008)(66556008)(91956017)(2906002)(66476007)(8676002)(31686004)(64756008)(38100700002)(26005)(76116006)(66446008)(71200400001)(66946007)(110136005)(6486002)(53546011)(6506007)(36756003)(316002)(41300700001)(54906003)(478600001)(6512007)(122000001)(4290200001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cDYwL0RTQnpoVk1Jckx0MEp1YlEzbERGbGQ0TzQ4LzFoa21UNnMzQVZ3Y1pE?=
 =?utf-8?B?M1NFNm4yV1VNU3VvMUpsbXNtRkhiMUtiRThlVjN5TldZdG44S2hCcGFELzVU?=
 =?utf-8?B?Vi95Nnp4Ry9YRS9HbHVJZXZqb1NTNE1ueFV4V2tKQmVBWDVQd290UTNvZW9R?=
 =?utf-8?B?TVpNRjUvdXIxT2J2QUtxamRlTzE4OXFqTmp6VnNQaHJxQmNzZENQKzZxY2Nk?=
 =?utf-8?B?U0dtSXRmNTlMOGxJaDVYOU5KQm1wTVFDNVBEZFBoODcvVkpiS0tjL2QyRU1G?=
 =?utf-8?B?YkxSK2FpS3B3dVF6eVphZ2c4Lytvc1luQzR0SWtzYTZyRmRITEtvUUFKcVdL?=
 =?utf-8?B?Ry8ycVRqMDd1bEZuQ1BvNDJIY3JFMVRCOUtaSHNJa1J6MFBOUFJwNDkvcGox?=
 =?utf-8?B?aEtibG5KckVodFNCbmoyV1hyWG8xZ2xUblZvakJ4VVhnbkZXMyt3Y1hVbHlZ?=
 =?utf-8?B?MWdGbXBycVBWTTBBeU1Ma01LUFNuNU83RFI5elpHNDJhQWlRMVBIajlwRFZ5?=
 =?utf-8?B?Z2tIK0xvcFNRU2xVYWY5Nk1SR2F6YjJxbk8yaHE5UFkxcU40L25xYmNqTzV5?=
 =?utf-8?B?dkcxNmlyeGZZUHpoYXRoQmtOeUJWRkVNUWlUZFFzWHJ3eGJtekpDdmkxcVo4?=
 =?utf-8?B?TnVQQVFQODdvcVNZaGFHSUVBNittSi81NFR3QmZUVGZNdkZiaFRha1phNkNp?=
 =?utf-8?B?UVpHY2FFejBCZzlGdzFSRy9MWFo4ZkpDUUN5cEY5d2R6V0cwbjJJMlFjRGF3?=
 =?utf-8?B?akVWaDVUL2VlVjBYelF1bjRibk1BajFSb2dTa09nMkxJankrNWZvVnpWTlBF?=
 =?utf-8?B?dmFXSWNRcEhOOXhGZWNKVE5scVZoeVVsMTVsV2ZKMUdibXlEOWJnU3pxS3RF?=
 =?utf-8?B?U2FMU2RweU5VZ3N2bTJ2cmxRNlppcnFjVXZ3WnFOdUZWb0ZGVWRZampLT200?=
 =?utf-8?B?enBBM0xTYjJMN1JXUlFxMzltR2orSjBINHNTQ2tGSE84Y0RRUGFrbXhOejBG?=
 =?utf-8?B?YUdjdndNSWd5c013NDNFYnZBWStkZzJWZFVUQXNxL0pMTGdJc2lrMHM0WkI2?=
 =?utf-8?B?a3BWYWZwTmNZZ2c1SWttWDExRTk4Z2NsV2hSbVZCVGgxYTVYZjZJUEovbklG?=
 =?utf-8?B?OUNOd2twWFU5ODE2aGlZNUhobFpQRURVekY4SUxrekVwd1N4WHNoeUJRYURC?=
 =?utf-8?B?bXg1K21ITlBPazloc0pvblZDQmZEK1MxeERiOGNpOHZkejY4YTVUSUI5SEVO?=
 =?utf-8?B?Qm0rdGNZaHVCZ0kzRFVNdEtESXVNRHpvMDRTQS9LK2dvL2wxN3ZDK2VaWDkv?=
 =?utf-8?B?NFQ0MWxIL3k3SHFPbFJIR2lvbDQycUQ3VWVkY293cVJ1VUVWRzdaMmxJMnF6?=
 =?utf-8?B?Q1d0V3owdkU5eFlRM2ZvSG9RVGt5ZzNwMFJoNU5tQld0Q3lHbzlCMm1jUXRC?=
 =?utf-8?B?Rzh0RGx2NCszbHlhL2h5L3lYRlAwT2c2SCtVU1hiZEswZWV0N1pYWXFOTTNM?=
 =?utf-8?B?aDRiZUxoeGxDTWZOUS8rKzFaeHdSNzlvYlNGNlZEWHd6S1BQOS9Wc3l0MkJT?=
 =?utf-8?B?YkdKaUxnZnBjRnJsWTFHM3BlYlFMNGROYU1kQVBXQUlLMkdZMC9wQ08wZFpv?=
 =?utf-8?B?WWN2NGFudkZhQVBYZngybkNtRk9Dbjl5ckdPRER0YmJVNUpLTkpLeitJbDdj?=
 =?utf-8?B?SGt5THVMUElZNFFSV2tHcE5vM1RCL2RVNXdRNlFFVGYxVlZzQ3dTenVjRXlq?=
 =?utf-8?B?WU9kaEFQczNBczk3TDRFckVRTmZZUk1LdDlLWU5md3lYbDZ5N2V1bDVxc3Bh?=
 =?utf-8?B?L1JqNDJXanV5ZXU4RklrbEJFall5U09vQUx3Y1B6SDhneXRmRU5tVFF6cWFX?=
 =?utf-8?B?NEpNczdkQ0dESzBMQjhDeVRvbHhFVDhENjU4bktDbjlYZGtlS2xtaVk2LzEv?=
 =?utf-8?B?SHdzRXRhbTJXbzRrQWxyTnV4N2VVQVdPVEZLS0p1RVI5ekZIVDE0cFJ6YnBk?=
 =?utf-8?B?UUgrMDNTUWE3aGpEMXJiT0U0UFVnZU5aeEQ0VVBDWjZLTFBwSFpmZ245RmFT?=
 =?utf-8?B?WkVseksyNHA0YXJhT25uWUt5b1BJOGYwWEh5SlZ2V0x4NXJBdmlxTG5tbGxQ?=
 =?utf-8?Q?Hpw16IhAUUkfBpzrMMPkCGYXX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC5C1F5FDBF63E409CF7F61DD3547FEF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e61f88f-3476-451a-0097-08da65c61f5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2022 18:24:43.0308
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QE39xA3jtJ+P+107Ju7Q8bVnU0mLoa79ZGQOnYQ05Irs4aH4jPKRbUGhQWan6C8Oumr60V/7zSEWSrIztQ0tUurZej+Vl6Vo2lmvXR6QnK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5669

T24gMTQvMDcvMjAyMiAxNTozOSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+IGRpZmYgLS1naXQg
YS94ZW4vdG9vbHMvY2hlY2stZW5kYnIuc2ggYi94ZW4vdG9vbHMvY2hlY2stZW5kYnIuc2gNCj4g
aW5kZXggNTUyZjIzMzkxMi4uNjRmYTlhNTZiNyAxMDA3NTUNCj4gLS0tIGEveGVuL3Rvb2xzL2No
ZWNrLWVuZGJyLnNoDQo+ICsrKyBiL3hlbi90b29scy9jaGVjay1lbmRici5zaA0KPiBAQCAtNzgs
NyArNzgsNyBAQCB0aGVuDQo+ICBlbHNlDQo+ICAgICAgZ3JlcCAtYW9iIC1lICIkKHByaW50ZiAn
XDM2M1wxN1wzNlwzNzInKSIgLWUgIiQocHJpbnRmICdcMzYzXDE3XDM2XDM3MycpIiBcDQo+ICAg
ICAgICAgICAtZSAiJChwcmludGYgJ1wxNDZcMTdcMzdcMScpIiAkVEVYVF9CSU4NCj4gLWZpIHwg
YXdrIC1GJzonICd7cHJpbnRmICIlcyV4XG4iLCAiJyR2bWFfaGknIiwgaW50KDB4JyR2bWFfbG8n
KSArICQxfScgPiAkQUxMDQo+ICtmaSB8IGF3ayAtRic6JyAne3ByaW50ZiAiJXMleFxuIiwgIick
dm1hX2hpJyIsIGludCgnJCgoMHgkdm1hX2xvKSknKSArICQxfScgPiAkQUxMDQo+ICANCj4gICMg
V2FpdCBmb3IgJFZBTElEIHRvIGJlY29tZSBjb21wbGV0ZQ0KPiAgd2FpdA0KDQpJIHRob3VnaHQg
SSdkIGZvdW5kIGEgY3VubmluZyB3YXkgdG8gc2ltcGx5IHRoaXMsIGJ1dCBhbGFzLg0KDQpSZXZp
ZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4sIGJ1dCB0
aGlzDQp3YXJyYW50cyBhIGNvbW1lbnQsIHNvIEkndmUgYWRkZWQgdGhpcyBodW5rIHRvbzoNCg0K
ZGlmZiAtLWdpdCBhL3hlbi90b29scy9jaGVjay1lbmRici5zaCBiL3hlbi90b29scy9jaGVjay1l
bmRici5zaA0KaW5kZXggZjYzMzg0NmIwZjc5Li44MDk1NWY3NGM3MWMgMTAwNzU1DQotLS0gYS94
ZW4vdG9vbHMvY2hlY2stZW5kYnIuc2gNCisrKyBiL3hlbi90b29scy9jaGVjay1lbmRici5zaA0K
QEAgLTY0LDYgKzY0LDExIEBAICR7T0JKRFVNUH0gLWogLnRleHQgJDEgLWQgLXcgfCBncmVwICfC
oMKgwqDCoMKgwqDCoCBlbmRicjY0DQoqJCcgfCBjdXQgLWYgMSAtZCAnOicgPiAkVkFMSUQgJg0K
wqAjwqDCoMKgIHNwbGl0IHRoZSBWTUEgaW4gaGFsZiBzbyBBV0sncyBudW1lcmljIGFkZGl0aW9u
IGlzIG9ubHkgd29ya2luZyBvbg0KMzIgYml0DQrCoCPCoMKgwqAgbnVtYmVycywgd2hpY2ggZG9u
J3QgbG9zZSBwcmVjaXNpb24uDQrCoCMNCisjIDQpIE1BV0sgZG9lc24ndCBzdXBwb3J0IHBsYWlu
IGhleCBjb25zdGFudHMgKGFuIG9wdGlvbmFsIHBhcnQgb2YgdGhlDQpQT1NJWA0KKyPCoMKgwqAg
c3BlYyksIGFuZCBHQVdLIGFuZCBNQVdLIGNhbid0IGFncmVlIG9uIGhvdyB0byB3b3JrIHdpdGgg
aGV4IGNvbnN0YW50cw0KKyPCoMKgwqAgaW4gYSBzdHJpbmcuwqAgVXNlIHRoZSBzaGVsbCB0byBj
b252ZXJ0ICR2bWFfbG8gdG8gZGVjaW1hbCBiZWZvcmUNCnBhc3NpbmcNCisjwqDCoMKgIHRvIEFX
Sy4NCisjDQrCoGV2YWwgJCgke09CSkRVTVB9IC1qIC50ZXh0ICQxIC1oIHwNCsKgwqDCoMKgICRB
V0sgJyQyID09ICIudGV4dCIge3ByaW50ZiAidm1hX2hpPSVzXG52bWFfbG89JXNcbiIsIHN1YnN0
cigkNCwgMSwNCjgpLCBzdWJzdHIoJDQsIDksIDE2KX0nKQ0KwqANCg0K

