Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F23595FD7
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 18:09:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388373.625010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNz7Q-0007gO-Pt; Tue, 16 Aug 2022 16:08:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388373.625010; Tue, 16 Aug 2022 16:08:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNz7Q-0007dZ-MY; Tue, 16 Aug 2022 16:08:40 +0000
Received: by outflank-mailman (input) for mailman id 388373;
 Tue, 16 Aug 2022 16:08:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eoIU=YU=citrix.com=prvs=220aa051c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oNz7O-0007dT-8N
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 16:08:38 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad4548cd-1d7d-11ed-9250-1f966e50362f;
 Tue, 16 Aug 2022 18:08:35 +0200 (CEST)
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Aug 2022 12:08:09 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5544.namprd03.prod.outlook.com (2603:10b6:5:2d3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Tue, 16 Aug
 2022 16:08:08 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.027; Tue, 16 Aug 2022
 16:08:07 +0000
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
X-Inumbo-ID: ad4548cd-1d7d-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660666115;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=SaieZhczY+8s0OVgPCLhMTCyCP5l1OnZctEKpgoE698=;
  b=QEg5np2PEEh61nEuSTHXcvyVKOMJTUOWWQTcsELZIV8NnR4n02sH4qzJ
   qBmNNUSIS546qEX4goBxwN9MI2o1wmzGFD04avSwg1+8hXfrS3OOdjxQq
   Frr8mWUO7DDzMddjLsC9/AGk2YcAueuD5SQ+yjhuHhgoZgpkYoD+JMx87
   U=;
X-IronPort-RemoteIP: 104.47.70.101
X-IronPort-MID: 78220367
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:F4wSsKw60tkqdMnsXhN6t+ezxyrEfRIJ4+MujC+fZmUNrF6WrkUEy
 GJKXDvQaP3YM2fxfN0iboXj8BgB6MTQz9RkT1c5qCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg7+s9JIGjhMsfjb+Eox5K6aVA4w5TTSW9ga5DcyqFFNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiM+t5yZqgpDvkQPPpMTb5LwX6v1ZwKhxLidw
 P0V3XC5pJxA0qfkwIzxWDEAe81y0DEvFBYq7hFTvOTKp3AqfUcAzN1PPk80BKs2yt9nCFNQs
 tsFOjItNwyM0rfeLLKTEoGAh+wFBeyyZMY1nC4lyjvUS/E7XZrEXqPGo8dC2ys9jdxPGvCYY
 NcFbT1ob1LLZBgn1lU/Ucpi2rv3wCanNWQA8Tp5poJui4TX5CV33KLgL5z+fduSSN8Otk2Zu
 njH7yLyBRRy2Nm3lmrfqCr32LCncSXTc6MiKrCG9OZTrX7UhWMLFzsMdHakrqzs4qK5c5cFQ
 6AOwQI+oK53+EG1Q93VWxyjvGXCrhMaQ8BXEeAx9EeK0KW8ywSTC3UATzVBQMc7r8JwTjsvv
 neWktKvDjxitpWcU3fb/bCRxRupIjQcJ2IGYS4CTCMG7sPlrYV1iQjAJv5hDaq0g9vdCTz2h
 TeQo0AWjbgJkdQC0an9+Fndmi+tvbDAVAtz7QLSNkqb6Qd+aJ+gdpafw1HR5vZdL66UVlCE+
 nMDnqCjAPsmCJiMkGmHRroLFbTwv/KdamSE2BhoAoUr8Cmr9zi7Z4dM7TpiJUBvdMEZZTvuZ
 0yVsgRUjHNOAEaXgWZMS9rZI6wXIWLITI2Nuiz8BjaWXqVMSQ==
IronPort-HdrOrdr: A9a23:tbvfoKFNwWlC9sTEpLqFwJLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNNICPoqTM2ftW7dySeVxeBZnMHfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj2Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oK+RSDljSh7Z/9Cly90g0FWz1C7L8++S
 yd+jaJp5mLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjow4OyjhkQGhYaVmQvmnsCouqO+ixV42mJ
 3nogsmPe5093TNF1vF7yfF6k3F6nID+nXiwViXjT/IusriXg83DMJHmMZwbgbZw1BIhqA+7I
 t7m0ai87ZHBxLJmyrwo/LSUQtxq0ayqX0+1cYOkn1kV5cEYrM5l/1cwKoVKuZEIMvJ0vFhLA
 BcNrCb2B+QSyLCU5nthBgq/DVrZAVqIv7JeDlYhiXf6UkqoJkw9Tpl+CVYpAZByHt1ceg72w
 yPWJ4Y641mX4sYa7lwC/wGRtbyAmvRQQjUOGbXOlj/ErobUki94qIfzY9Fk91CQqZ4uqcaid
 DEShdVpGQyc0XhBYmH24BK6AnERCG4US72ws9T6pBlsvmkLYCbehGrWRQriY+tsv8fCsrUV7
 K6P49XGebqKS/rFZxS1wPzVpFOIT0VUdETuNw8R1WSy/i7YrHCp6jearLeNbDtGTErVif2BW
 YCRiH6IIFa4kWiShbD8WzssrPWCznCFL5LYdjnFrIoufkw36V3w3sooEX84N2XIjtftaFzdF
 diIdrc49GGmVU=
X-IronPort-AV: E=Sophos;i="5.93,241,1654574400"; 
   d="scan'208";a="78220367"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BoCkY/5NEGqyOeQKImKvUZJYPwigWRdy3/ivptY4mDU4N6YGXW/KJkMynI87bvFOJAueUQPmA48vD0jVVC3+4DXq38d/WYMxoXEIHH8J7iVGUPsY75o1ThQgc6WVfKTpixWKqVtObf+M0fTfFtdGxe66Pg/MUHrURR8AS0qoAAieYiv2+HP1oOrHqc3va4ZlzMZ1WKW4Mj4uAnkbOIl9W6uRI4joZbqbvtJODVvs8gYaYT8YFS7c8IQ8H2tbhgU11nla2Lc+tOxkZvUejmUKgmqWthrENo8MHZtrZUZxJiR76KMtKeA4qIfYFTSbunnwtpt/9SxnjH9LntgYMlh7Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SaieZhczY+8s0OVgPCLhMTCyCP5l1OnZctEKpgoE698=;
 b=fAxI8VFLZ2YO5hts1hQ7kcqR1IqyEr3+gI4OL7oXNwaQ2bXZRRLFneZ6M1Lq36lj9EfsV/ewn4IPkMN6VrN5sPPAllrd7O7hbDzZi7z3f7aERoB6SlOT/qQcw40ahDBbOR2dB7te+oDYufJ0rP9vMPCWcxfIzh+8ZW28h51EEmVmc5bhhZ1L7P0p8Mj/p093pQlYdAJ72jjwXzIJlnyMpnlud3pM0gsS6ioEJ3cVYgN29nXfwWJvI2gzo7DO30cTfuMn1TWzVHuqYCXzxCnXDO76JhTMFtJ0Vz6629Lj3dfxlVYLnkAcuwahcktOv734QFpx2gDnJ3/U1dH3WYYzaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SaieZhczY+8s0OVgPCLhMTCyCP5l1OnZctEKpgoE698=;
 b=W3+AkuTG5QKlZPon9vR4IoBK1QQ/dIS3Sp00JU5KnYCVTK8LUkqr1OzD8oz/t2etfZ9ZxjF74xeoMBHnDjP/B2HXSe6px+LSMMKgRiWjvdxhVfO1iD7gdzU/AJgV6Ne0mn/UCGkvUEgmeV0VguEL4PIP6sGaq+8YF8GhwMlRrUU=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Chen <wei.chen@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [XEN PATCH] build: Fix x86 build without EFI
Thread-Topic: [XEN PATCH] build: Fix x86 build without EFI
Thread-Index: AQHYsVtOBicyb/5hREGrPWYjX4A7za2xsgiA
Date: Tue, 16 Aug 2022 16:08:07 +0000
Message-ID: <19362add-4d71-89f1-2f90-74901b4c79ea@citrix.com>
References: <20220816103043.32662-1-anthony.perard@citrix.com>
In-Reply-To: <20220816103043.32662-1-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00d8087f-473c-456e-f18a-08da7fa18252
x-ms-traffictypediagnostic: DS7PR03MB5544:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 5VYl/xvqZKu2ZaTkuxmdDFzK1zWnLgtLqkaDcu0Z/8+QUab5qy6FndUT7DWjdnBrjbKMlGCFbKdvqzpmx+80VdpnnonSXSoJJk99GXk7qoDh4sGkAsUsgoGwVeH+lamVs/SllTq0Qfb/rFvUTU4TyNw/P4w5IEcdidQhM1+pcEoXjBZmAuE4jTekZvqrawwJt8kUR3Nc1LXVOR0PP86eKgmpCaMbJsKEms2RwWCO0v9esFuxLXLifVVeVqh9W7nTH+IHEsfWIdBg9RdJSOBLoSlI8N++ekJu6UDsRsRDtcsvTmWza1cO9Oz1+9wjFiggDXKEhvGPnmcIMrvuCBF/sE8mcswY0hZ7Iihau71+L0u25SnSUodHcC7+x9I29JLcah7i4zXuMsVQxT/wdgy09XK0L99sxSuCAbUTJqdURfB7jOA88EAcxbGmMryXbkkRbPL0D9MENEn+EQH1NsE1HgbJNU7U812PlMtW2NyGNSGUzkq9UQKpY8GqFlsavYriDzlBYKAGk5vTd5vGYAXqxALg5JGyYPIAP+nklYTDmgrZw5kDzapW721ZCbRDbq1DIAcsvfJNmOzdtSNJyGy/2ws0lUbsuBnU0nKD6HMP7poGB2urNaL4xaztUhRlPMKsgZgcZrBPOVqi1AWSf9shssoalvDDQgt08xIU9g+3mAJ0tQh37wHlCxxd4ectp05Iquyn9YX3vUhWVrCqHXwRjv5o7NNHhe3KLjqk5pvRaYApS/szDLBC5p7x3Zj0HnmG/xDk0ckBUuDGpu9DXSpNMX+m+tcpo/EvhKhjDvcyNQdBCSLztyF2wtXifpS40/Hrg3AZjGrt1ttLe980erYuYSHiAf2OyNHYmnswQyZsaXJemBAVYiSrehM58gtDLbiV
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(136003)(366004)(39860400002)(376002)(82960400001)(54906003)(316002)(31696002)(110136005)(38070700005)(5660300002)(4326008)(76116006)(66476007)(64756008)(91956017)(41300700001)(53546011)(26005)(6506007)(66946007)(8936002)(66556008)(6512007)(186003)(2616005)(107886003)(38100700002)(8676002)(66446008)(86362001)(71200400001)(6486002)(478600001)(122000001)(83380400001)(31686004)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M1FHMTRDZjg4U2NEcVljcVFVSnVlV2Z0SE5sOFVLcXBTdS9SYmdXM2Y1VW1j?=
 =?utf-8?B?Sm50Umc4U29WQTVhb2YvUDlxOGdPVno5ZFBmM1QwaW5Fek5VVGFRaERwNDdS?=
 =?utf-8?B?YnkrYTIxZ3NPbUlBd0YxYVJnRG1NcnQ4SVZ5dHErcldzS0doOHQ0Qm1Cbmhs?=
 =?utf-8?B?cHVQcWE3QlhGeGoyZ29YQkVUK3VKUGU4QmYwWEwvYTgyTG9PVzR3ajlHQytK?=
 =?utf-8?B?RUVqTmN6M2pUTTFLMjFpYzFDUUM4NWZXY25jWXJya3d2cTRJdG1kaXdOQjVv?=
 =?utf-8?B?ampEWVk5VWxSUUcwT1RlMHRSdHNtWXY2bFlRYlkyelcvZGV3QkRPOTdmUDlI?=
 =?utf-8?B?UU90ZWpZWnNaZ3UvUWh5NjRaVmV1eE05N0NaZXZ3ZHpPOGlGYkwzamYxUU1k?=
 =?utf-8?B?bVhITk1sNHh3cDA2US9LTE1QQjRvd1NQY3ZkMGRuK1diSWhEdDVBWVoxTmtO?=
 =?utf-8?B?MCt4aG1YZWNVS3JaMlJ2UFNNN3IyKzhLMndWU1dmdURDeE9MeTZnSEN4TFg0?=
 =?utf-8?B?REpQUFdUZlBQa0d4RjhZKy96NitLcGZMcldwSWFVdDNVSURnNGVuWUhkSTJH?=
 =?utf-8?B?OWQ4bFRGVTJRdkMvdFB4R1VQTFV3bW05L0kyTUkzaW5KUk1ib0xJU21aSlZj?=
 =?utf-8?B?RXQvbWM5UEU0R2tQd2k5dU5sQit2VWZxck9LV1BJVUhtR0lqY0pTbnk4TnVN?=
 =?utf-8?B?bno1ejEzdzU1TGxCV2I2cG9jRGpIQ2hiVXMvK0U3UFdVRlZzZ2pOWUovdXZB?=
 =?utf-8?B?MDJCUlVVUG5ZZldSVDFDbTRJbEFYQnZOVUxNa0tNSjBGZE1DOXhIaExaVkYw?=
 =?utf-8?B?dW1pbHJGTVdCNTZMYyt5cllTVmlyS3pIRTU1UlM3SUlYMXg2N0I2WWxmaVFU?=
 =?utf-8?B?bFRrMnF4WW9JNlBYVG5xYllOUjNrckM1OXExNnQvUUJqVkIzVTRHQWlYZ0tU?=
 =?utf-8?B?blJ4QVVodXdaUEtJeDdCSGVGWXB0TGJ4ZVE5ZFUzaFYydzYrYmN6QWx5Q2NZ?=
 =?utf-8?B?TkpERkhwVnRqeDBhQjlnejVGQ2pxUFR0L0kvaDFYMG9RUmhJTGEwYkgvblZj?=
 =?utf-8?B?bC9UbWRjUE5BRmk2RStUYUdvREVvMEdNTWlpay81aWNweHZVMkJ0cWtwZDln?=
 =?utf-8?B?bW55SkxhTm1VQ2dULzFXbDBSRENGQktBWjVKNE91SGlFanFFWVBrZ0NzZEU1?=
 =?utf-8?B?SGZxR3R2OFA4eDBqSzI3U005NkQwb0ZYRVlPdFdjZFpGNW5sQy9yQlJMd01q?=
 =?utf-8?B?RUl1UGVqNy9rZEd2REFjQmZiYm5hZmxUR1gxUmRiSVluc1huVTZXbzNEWVk0?=
 =?utf-8?B?eENkaUMxbFZodEx6SjRmbkxlRWNsc0ZVWitENW5RdG0zUHMxUkhuVEdPRU9p?=
 =?utf-8?B?UW9QWWpQTjg3cGx6RlMvbFEzZDJHWHhnejFZQW02d3ppbldOVFNQRlJ2VlFX?=
 =?utf-8?B?YVpkU08wZHBGaXZFUVRYOXFlRjNwVGIxa3hJTzVNTFcvaEFkeWh2ZnpsN0E3?=
 =?utf-8?B?QURqR01Td084dVJHSnM3Uk1lNU02RWtnbHRHWVVGK0xzYWYwWURkWXkxUEVI?=
 =?utf-8?B?WVE3Qm9VeFE2ekdpdWRoMmRrbVRkb3ZOSE1yQlRmY1g3ZFdvdXBaQnB1U1RW?=
 =?utf-8?B?KzhVV2c5Nk1FRjZaYlhZT0JLbE1hNVJzbTVsa2RhVXd3b1Q2VjJiaTVSWkxi?=
 =?utf-8?B?ZisvaGpDT1NsbUFGTmRRREJPbG5CeENhdGJtMUFxM2lES2toc1RrTE5YRUtC?=
 =?utf-8?B?VllCNzlidmJtRGNnUCtlOWE5ZUoyRlZCOG5GL1RRTDVwYUZUL3Y4TkVIL3ZZ?=
 =?utf-8?B?OFhxcnZGdlBiVjFGckwvQ0Rvbm1WVEdMNzA4OTR3c1BDUmE0RExBSGUzTDdE?=
 =?utf-8?B?OFk4NjdhZExUZGFXdmxhclBEbVhYTktLTUpLdGo2MUNiT0FlNFFOV0pTL1V1?=
 =?utf-8?B?QVExU3BiYUdWMHRvdTBrYitBTUdnZnhWc2JUVjBBR1pobUkzVnRDUHM2eGlB?=
 =?utf-8?B?M2k5c3ZYcDhqVnJjMUhweXRwWkhydnpPYVYvWG1kcmROR1Q4K0UwZXhaQWdO?=
 =?utf-8?B?VUk5d2N0dUs2TWJudXVTU0R3QVR5UWNyVi9iOW5GckxKQlBGV1hCVUY5TC9t?=
 =?utf-8?Q?NbojfbvApm/JR3KETMf+ls+Ix?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E10E5D0D81B4CA44B4864511A708C739@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?NmRWYzRjRE1uVXJkOU96ZG1hRFlMYVJycklDMmRaNkVzZDh5ZkYycWxGYnRM?=
 =?utf-8?B?Vy80NVFTbjVUZlB2cFlGM3JzTVkrLzM4L1o2WVdDaHloNDg1djlPUHhMOHhH?=
 =?utf-8?B?aExsbVdEdVJORE1lcjlMVFV3NnVJWmoyRncvKzVoZ3oxQlYvaWJ4QnN2Q0pK?=
 =?utf-8?B?MWZsVHdkV3piOHd0ZlVOQWdoL0p1K3NNRnAvR3c5NDl6eHZ0dFNYY0lnYTll?=
 =?utf-8?B?OHNvbHh0TElVYVUxS2tSU08xd29DOGZaRTI1YWVPdC9ON0Rkbnd1N3VsZFVx?=
 =?utf-8?B?SDlobUxuN0dPOHBpM2dOUVZwVXFIRktza083RkwwTXFtUit6ak9HL2Vrenl6?=
 =?utf-8?B?SjhZeHFxR1VqU1hTN2lrcXlYWmJNd1ZwcjhsNDB5R2ZvNE9DMi8rWCtuM0w5?=
 =?utf-8?B?cit6UVMvQTRMOTNOVSt1UnlWNy9nV1QrSk5yNkJvTzdFZGh1eW1sTjBmMDla?=
 =?utf-8?B?WmtLcUlFRHZ2aVhiYWZTa3ZMNXhkTWpNOW1td1pYOXVLUk5WaitpWnllZmdB?=
 =?utf-8?B?TFhGLzNMTlpsTGN0NTc0WFpaREUvb2w1WkVLZGpoNytnRDVPMjFXd2dNWDB5?=
 =?utf-8?B?NDZjajRPOHNuMStqbWxKT0dZcG50RTBUY3VjeWU2UjEyRkw2WWRxcHViZ2c1?=
 =?utf-8?B?UGIxUi91ZkN2RWVNQXkzTGsyL1g5b1hhZ2x3dmJxYzlqbUZyTWNUWGJFTVVw?=
 =?utf-8?B?OTNLb0UzQTlRUnZqVWVxbnh1NC9aTS8xaXJTZUZoT3lNU2Y5WExEalNDVVZz?=
 =?utf-8?B?d256a0V0NzhtOHNnRkZFQzdtRUlUdy9WUENoS0hOUCtNRjd3cEdKeDZZM3Zn?=
 =?utf-8?B?YUxKeUNYYkU4MnJkcEFFQ09uUDZla1Y5TS8xUCtZQmF0dzd4Uk5KREl2Rm5j?=
 =?utf-8?B?Tm1KWWtMa21NUTM5YVgwRDZuUlBDdHNEZHRvVm15WG42K2dUalFaay9ZSlhR?=
 =?utf-8?B?SGpuK0dMT0E4VkVsS0paTHI4MmxKbEUvRGRJK09DOG5XMm5XemtXUUZCOVdw?=
 =?utf-8?B?VEx6U3FtUUF2NDVxSTVlSnRvREtoRm83cEgwMUdkQVV3Skc4NGFTSWNtbkhs?=
 =?utf-8?B?ZUsyNEJkTjBteHR2SWpTK3liYXdHTlF1K2RWRTJwSEZNN2trek5xajhyV0VE?=
 =?utf-8?B?VThrZEZyelpvd3RRaElCbFBmeFp1d3lFemFLckVUVjc0MG4xelc5WEVPamg5?=
 =?utf-8?B?bkhMTXdYdUJ5UEtzVDJScXR6a1oyM1JkZGJjTFo5UEgxVFpNQkRrZE1HdDl5?=
 =?utf-8?B?NTBsTzFSV3M0d1NHV3FYUFNDMXVsNGllMFoxMTVhVHZsWXNkT0o5bjAzZmF6?=
 =?utf-8?B?WjJxdDZkbTF3MmZwdGZhQnJLYWIvZTVwUmk5SFVmc010bVZWbjM3TGlKalRv?=
 =?utf-8?B?bXE4dWR5R2lIUG9iM3RuSE1LU2J1R09FWjJOWnArZGZOTjk5M0F0bm92Q1Rj?=
 =?utf-8?Q?FiM7TKEZ?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d8087f-473c-456e-f18a-08da7fa18252
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2022 16:08:07.8813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cj1KKS/AzXkuR038ndA8/7R7ascUkSzIWF9MvC0AQmsWWyzhFgw4BpPdy4uT879XkiirjRYRaT11m4BUHC16aWwQQCIo+JK1ucAvHkGqaFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5544

T24gMTYvMDgvMjAyMiAxMTozMCwgQW50aG9ueSBQZXJhcmQgd3JvdGU6DQo+IFdlIGNhbid0IGhh
dmUgYSBzb3VyY2UgZmlsZSB3aXRoIHRoZSBzYW1lIG5hbWUgdGhhdCBleGlzdCBpbiBib3RoIHRo
ZQ0KPiBjb21tb24gY29kZSBhbmQgaW4gdGhlIGFyY2ggc3BlY2lmaWMgY29kZSBmb3IgZWZpLy4g
VGhpcyBjYW4gbGVhZCB0bw0KPiBjb21mdXNpb24gaW4gbWFrZSBhbmQgaXQgY2FuIHBpY2sgdXAg
dGhlIHdyb25nIHNvdXJjZSBmaWxlLiBUaGlzIGlzc3VlDQo+IGxlYWQgdG8gYSBmYWlsdXJlIHRv
IGJ1aWxkIGEgcHYtc2hpbSBmb3IgeDg2IG91dC1vZi10cmVlLCBhcyB0aGlzIGlzDQo+IG9uZSBl
eGFtcGxlIG9mIGFuIHg4NiBidWlsZCB1c2luZyB0aGUgZWZpL3N0dWIuYy4NCj4NCj4gVGhlIGlz
c3VlIGlzIHRoYXQgaW4gb3V0LW9mLXRyZWUsIG1ha2UgbWlnaHQgZmluZCB4ODYvZWZpL3N0dWIu
YyB2aWENCj4gVlBBVEgsIGJ1dCBhcyB0aGUgdGFyZ2V0IG5lZWRzIHRvIGJlIHJlYnVpbHQgZHVl
IHRvIEZPUkNFLCBtYWtlDQo+IGFjdHVhbGx5IGF2b2lkIGNoYW5naW5nIHRoZSBzb3VyY2UgdHJl
ZSBhbmQgcmVidWlsdCB0aGUgdGFyZ2V0IHdpdGgNCj4gVlBBVEggaWdub3JlZCwgc28gJEAgbGVh
ZCB0byB0aGUgYnVpbGQgdHJlZSB3aGVyZSAic3R1Yi5jIiBkb3Nlbid0DQo+IGV4aXN0IHlldCBz
byBhIGxpbmsgaXMgbWFkZSB0byAiY29tbW9uL3N0dWIuYyIuDQo+DQo+IFJld29yayB0aGUgbmV3
IGNvbW1vbi9zdHViLmMgZmlsZSB0byBoYXZlIGEgZGlmZmVyZW50IG5hbWUgdGhhbiB0aGUNCj4g
YWxyZWFkeSBleGlzdGluZyBvbmUuIEFuZCBidWlsZCBib3RoICpzdHViLmMgYXMgdHdvIGRpZmZl
cmVudCBvYmplY3RzLg0KPiBUaGlzIG1lYW4gd2UgaGF2ZSB0byBtb3ZlIHNvbWUgZWZpX2NvbXBh
dF8qIGFsaWFzZXMgd2hpY2ggYXJlIHByb2JhYmx5DQo+IHVzZWxlc3MgZm9yIEFybS4NCj4NCj4g
QXZvaWQgdXNpbmcgJChFRklPQkoteSkgYXMgYW4gYWxpYXMgZm9yICQoY2xlYW4tZmlsZXMpLCBh
ZGQNCj4gY29tbW9uX3N0dWIuYyBkaXJlY3RseSB0byAkKGNsZWFuLWZpbGVzKS4NCj4NCj4gRml4
ZXM6IDdmOTY4NTliMGQwMCAoInhlbjogcmV1c2UgeDg2IEVGSSBzdHViIGZ1bmN0aW9ucyBmb3Ig
QXJtIikNCj4gUmVwb3J0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBj
aXRyaXguY29tPg0KDQpUZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+DQo=

