Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 728A763C974
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 21:37:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449618.706485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p07MK-0002o7-34; Tue, 29 Nov 2022 20:37:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449618.706485; Tue, 29 Nov 2022 20:37:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p07MJ-0002lX-Vf; Tue, 29 Nov 2022 20:37:39 +0000
Received: by outflank-mailman (input) for mailman id 449618;
 Tue, 29 Nov 2022 20:37:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xNwm=35=citrix.com=prvs=3259bd577=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p07MI-00029b-AC
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 20:37:38 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7dc250b-7025-11ed-8fd2-01056ac49cbb;
 Tue, 29 Nov 2022 21:37:37 +0100 (CET)
Received: from mail-dm6nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Nov 2022 15:37:27 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6707.namprd03.prod.outlook.com (2603:10b6:510:112::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 20:37:26 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 20:37:26 +0000
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
X-Inumbo-ID: a7dc250b-7025-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669754256;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ydn3GwldrFnYARz4l62QS0t6WNVic/vs/te3E0tkNm8=;
  b=NGXKtxncIkTW8P23nDLmXu3NaDJq0CqP6abCEkyRnpyY5ZLmTje+zpml
   ptcufiEKg91AsjTXliDrIo3ARXReAofwEEPg/iVO7w3o8cjECIBzSkGtR
   4h4Z8vsTHM589dVg6KZ3tedvVMO3M4E8nxL9rHXlpyTJAjEInHY9d6tfJ
   M=;
X-IronPort-RemoteIP: 104.47.59.171
X-IronPort-MID: 88337397
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Z9+afqvvDA27d3WYJqr+spGygefnVJxfMUV32f8akzHdYApBsoF/q
 tZmKW3XbvmLazSnfd10PYzg9x8CvcLSz95kSgts+S89RXhB+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QaExiFLZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwdS9SMza6m8aMz4mVUq5PhvYha5f0I9ZK0p1g5Wmx4fcOZ7nmGv+PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgf60b4O9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPO3oraU12wzMroAVIBAQeFCBuKaTsW27fO0HF
 EsVq3UWrLdnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8ry62OCUTBX8PY2kDVwRty8L4vIg5gxbLT9BiOK24lNv4HXf32
 T/ihDc6r6Uei4gMzarTwLzcqzelp5yMQgtr4AzSBzih9lkgO9fjYJG041/G6/oGNJyeUlSKo
 HkDnY6Z8fwKCpaO0ieKRY3hAY2U2hpMCxWE6XYHInXr323FF6KLFWyI3AxDGQ==
IronPort-HdrOrdr: A9a23:49JDWaiYEECTo8t7s5lcdzZaXXBQX/J23DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICRF4B8buYOCUghrTEGgE1/qv/9SAIVy1ygc578
 tdmsdFebrN5DRB7PoSpTPIa+rIo+P3v5xA592uqUuFJDsCA84P0+46MHfjLqQcfnglOXNNLu
 v52iMxnUvERZ14VKSGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftxK/mHwOe1hI+VSoK5bs562
 DKnyHw+63m6piAu17h/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtSJV9V6aEtDUVpvjqzFoxit
 HDrzopIsw2wXLMeWOepwfrxmDboXgTwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp9KZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wXh4SqbpXVd
 WGPvuso8q+QmnqKUwxeVMfmeBEa05DWituhHJy4vB9nQImx0yRhHFoufD31k1wiK7VDaM0p9
 gse54Y6o2nBKUtHN1ALfZETs2tBmPXRxXQdGqUPFT8DakCf2nAspjt/dwOlaiXkbEzvewPca
 76ISVlnH93f1irBdyF3ZVN/ByISGKhXS71wsUb45RioLXzSLfiLCXGETkV4oCdiuRaBteeV+
 e4OZpQDfOmJWzyGZxR1wm7X5VJM3ERXMAcp95+UVOTpcDALJHsq4XgAb7uDauoFSxhVnL0A3
 MFUjS2LMJc7lqzUnu9mxTVU2OFQD2KwXuxKtmuwwE+8vl/CmQXiHlltb2Q3LD6FRRS9qorYU
 B5PLTr1qumuGjexxe701lU
X-IronPort-AV: E=Sophos;i="5.96,204,1665460800"; 
   d="scan'208";a="88337397"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GKwai/A221NuoZnKGboUsr5Tx3pwJzHGClky6nVPuZazxHf3i5V/jzyjwafzYSRscbbyt+LOz/pheG0dEX0rPDofGOK5EaEJmYasLxwc4O2vMmvy6SUPkuSVyzsc2dN6IdR39rQj3ChBtgWIwThQcB+FfZ6f13HUTFg6gw8LtZzbP/I/x63Sppy4j+6SeQZQuDIQOfZAO8byDUGafKBig9Txze5AMYrFLQcpioXMJ9x/DOOnnjGQnf70dNoAfZG2bEgqRo1KOOMdPvM6bXhYJS64THkWCI65daVgeV3x0UyUIJg9ZTtT8gf2wzTIFJLZcAmDypRZd6mmSQqydzchDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydn3GwldrFnYARz4l62QS0t6WNVic/vs/te3E0tkNm8=;
 b=HTqQdtKx5lmne6byAs/WvKG2QBthcVYRXtvSkjnKaV+0NELmqPJqwa+lSZg7KB/B38YwIO9sjCojFB2pwfIuT1iqxqjC0AlTcRPE9lKRpWVfTcKccFJiD0a2GXRQn+WomDr30ZpS6FBrPPvgtRsgskQELHfA7BeM4SzKXHhaxSLrLf/bmRatj2FVKjYfX4yMRNMsnboYfZ8vK7FHMI5dwskAj64ud7L+pCAAaJtAhq/WTPwTTXc0hQdaPC+sfPMBr8d58tUUoh+RETfLyz1O/ugio3MtZBBwNLKXCapsh37rE2fzo6sKw3nmeaZtj2nVPL8E5jto2FLQWjIfZVoOuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydn3GwldrFnYARz4l62QS0t6WNVic/vs/te3E0tkNm8=;
 b=n9vfBJK7GZxY7Ql9iHAAvhPyMkGnpoNaRBqYc8ZtF7i0+LCOXuBetVVLmMLTjLJ3aPrIhTk7HhEDVe2amGPSYgx1cqjC7361X1PfSsKTpdRUcJWyymQ9zdHuF9zagD/+BbQNAh8dHOsWmnGZ+3Y3+CoayJ9uNuTRMDSxV1uZkzI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] bump default SeaBIOS version to 1.16.1
Thread-Topic: [PATCH] bump default SeaBIOS version to 1.16.1
Thread-Index: AQHZA//5sKDKhmJOE0WyLAXwID/W5K5WXMYA
Date: Tue, 29 Nov 2022 20:37:25 +0000
Message-ID: <b2394e52-d366-6631-f61b-b022b8ab71bb@citrix.com>
References: <22d39f29-d87d-b3f6-d601-85fa1d4a72f7@suse.com>
In-Reply-To: <22d39f29-d87d-b3f6-d601-85fa1d4a72f7@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|PH0PR03MB6707:EE_
x-ms-office365-filtering-correlation-id: 57b03aa3-343c-4e64-af16-08dad24986ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 KsIMWrYjKTIsN6oavAIxs+TJ7rSOB8aj0S7ryRqhEpY+OOzO3MqXEVE6HVpvWlKRPhXk0Iubj+ii1Boy8SEcZsTHZ0JVw6h3KRZAqV1t2rpq1vASlNsfu6SU85ODSlqNuR/ho6cTO91lxNCvkT1ERFZNwH8+9sJIrlD8n63gREvdhRsgtxJj+5CPE0DYAcI8e3d9LgUhYOnGs/IK48Omc6Ddiy+SIQbZI3z6+ynD9ERyN8GGFos3hxfss+INwFe4IfRYTEUxYo/sw9WOnO2c+xceiNZWdhs1ZduF6CgBXCf2UTCQtiSaxp3/PH/m9pfuYQzmL9QS7kHG48RiODJ0EqWDwUDXFZrSP/YwJmbaL5TdVaxoEV498Qn+crbyT2zwQLsgBNgkXqpq5ve+h8XxsDSMgHPgBFcaVr7+XGn+DwVA2/NxpZvumUssNhLSENo1hgkcuVa8bO0oydBYT8B8MaoTDwpxlpz/A5O7EDSJo0t4c8vHOU1ORdbNwVXE+YlKtHkBDaLyXUAP7IiJVh/WqH4o3GJCcAp9zmCyrkV7RFR09e2eiRetJ90ceIHr8aieaeP5WOebhgwIYSV7TVZxBkvBiUaMdL7D3T3am7Af4S/CUOY4pPSZgO6KQ5ePp/AApHaT3JANuh9KkLKYROp/JqcGbYzKqYAyr6CPV5PF/wiebqBPv9D0mgNuQIi8p0sXc2aHYJU9Z3xu0JY6yxuqnxTteivtZel7MRiDfAqlcD4XvJDUcLfSKOYihMivGLr/oVOfCOqApjqSNhfMKlikLQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(451199015)(71200400001)(54906003)(66446008)(558084003)(110136005)(8676002)(8936002)(64756008)(4326008)(91956017)(36756003)(41300700001)(66476007)(5660300002)(316002)(66556008)(66946007)(76116006)(38100700002)(122000001)(82960400001)(38070700005)(86362001)(6486002)(478600001)(53546011)(6512007)(6506007)(26005)(2616005)(186003)(31696002)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OXA5TkZsUWxCU2h3WmlLblZSQmRlcTEzL1FBemdQY0JjNEIrMXAwUkFRN0Ry?=
 =?utf-8?B?KzJyWThQNG9XUmsycFpMZEVlVXZZTzRzbGRHSjR6cXlpWlZyemtsa1lzeHda?=
 =?utf-8?B?R09jOGh0aGxMNnpHNXVyRTVhM2t6MGMxMWFsM2pJTTdhL2tWOXByc2ljMEFX?=
 =?utf-8?B?cU9NdzVsRTJXaExVRWlKYmtUbkcwQXlCbkltOXN4ZjY3NTBqN2xCTmJ3VkhU?=
 =?utf-8?B?ekZWcTJPSW9xRVc3YWlGVlU2ajI1SlZRZjhCZEl0YjFrSURXc05FWUhjVFlr?=
 =?utf-8?B?ZUZ1aTFaclJ0NEV1dXZGSk9ZWkt1dnd1S2VpemVCcGNKUnh4bDlvUHg5a09O?=
 =?utf-8?B?MHRnQjFqTFdkQzRKZFFUUnJmelRhbjZJRjlCSDZNcHlVc3QrTGRGNnlyZ3Vh?=
 =?utf-8?B?MVQxdWRBcEhrSkViczdicTJrZkUyeCs4ekxSaUd1U1VYVWFZQ1NHbXhRbW9P?=
 =?utf-8?B?U1lldTQrUmhoZlNaKzZ3ZGR0N21FWHlCWC8rVnUzakJWaDNQOGJ5T2FkZU5x?=
 =?utf-8?B?czJ1TkwvNEFSY2h6RmhRaHdoSDZtbXBycW5oSkQyTmJXeW9wbVpRd3Nnblo5?=
 =?utf-8?B?MmMxZ0dNWXVTc05uRjJqbk5YVkNkU2p5Wmo4amVXTzhndmN6UlZYNTNrK1pn?=
 =?utf-8?B?UXNyQzZmUU9oVERNcmp3YWMwT2ZqRDNWRWFwWWk0REpFTkJzVGg2LzBwclBz?=
 =?utf-8?B?YWg2TVpZYmVxK3lQQzhqL0IrWXBhVXYwZCtwL294QVE3UmQ0emY4aUJVT2g3?=
 =?utf-8?B?TU5NUURqc3RFejdxU0dKSE4wY1l1a05EZFRpOHIzS3hsai80Y2xiOEFrUXpH?=
 =?utf-8?B?UkZaTkhvMkU0L2l0bW1RV0JxUkFXRkttRFNNZHRPY0Y4TmVnSHRJOStCV0Mr?=
 =?utf-8?B?Qm5tSjU1OFRWVmlyaTJta2pzdEtQR0FUYkNGL2J0b3dENWgyZ1hmaDNrcHAv?=
 =?utf-8?B?Yno0RkJBa0JXSnYrREZDNVlUNVFpeGpDOThWeGozNWw0VjkvL216SWY5YWN2?=
 =?utf-8?B?d1lHUy9GMUxCWkR4RjdCbklpZUhGM1VXUTAyT3oxRXJkNThRSTlhcFlEUUFW?=
 =?utf-8?B?cWVQOFE4ZDEzclpQY3VQU3czdTArQTV6OVNpTldyRmhhbmtncHFCdUFLQ3c2?=
 =?utf-8?B?OUNBSXdtdWc2aHNlRHgxd28xUzh0VHRNVEIzNjBzV3ZVaVZzTTROQzRBTEor?=
 =?utf-8?B?NllTV3d0K004dmtrbCsvTXBIZ00yWmR4ZWdwbUd0cFJpTjcwWnpFVTY0Z2J1?=
 =?utf-8?B?ZzlETTN2ZFZFTmFxTkNtSGNaaDFqbi9BYm9iQWRia296cjhYYkwyNDZwQUhO?=
 =?utf-8?B?bFJla1p3TVFyTlhuS285STE0Z09KUW1pRDJvZTBkMVNNTXEvMDN5VTV5Z1hD?=
 =?utf-8?B?VWxjVXJaWWsvRFI4QldEVEVFTG91ZVhzMTRBU1Y1UlBqamN3WkthWjJLM1RZ?=
 =?utf-8?B?MWVmU0hQcU9TWUIrQWhrdklJUEloVnFNcHU1RW1Qb0p0ZE04c2g0aWdGUHV6?=
 =?utf-8?B?YklvOFhzb01UWWZESjhhNmFBRmloN2d3WDJoT2xLZldzbVVPWWZ4c1podTd4?=
 =?utf-8?B?UFdvTkZZNHVsOUkyMDBFcHRtRFpwMUdXYllqd0xTSzJGTEJNTjFPMGNjaXI3?=
 =?utf-8?B?amFldDhOazZ1RFA5L256KzdFaGFpQkI3TzVhOEN4c2xEOWowdDQ5RnNsNmgr?=
 =?utf-8?B?V1N5cVNzUjZHdnhranZjOW9ZWVl6ZTZBdFB6dG1TWnNRUVdhV0ROVmg5WHE5?=
 =?utf-8?B?Z1BlNUJKSGlTK1F1L1NHdVpVaTJ3R0UxUW1pN1lRNjdqellFdjBCSFJ4N3pS?=
 =?utf-8?B?bkZFcFJFR3VPeE5VQThYaU50VHl6eTZLeXlXc0F1UUdPSnhIZnFCdmlhUTl3?=
 =?utf-8?B?cWdTUDhxcnRVS2FKaE4wR1pHbnVJYkZSZmhSZE52T0pFVUN1QU5weVVHeHMy?=
 =?utf-8?B?VVFaSlZYNmEwSVlRaTBWNndvOEt3VjVwVVBHM3hiM2d6ZXFwK2JIQlkwQlBY?=
 =?utf-8?B?SWYxTmFwcUg4aGRsemRmTmxnTVlxYUx6c2lHUFVpTUpHVnVvOUY1SnBZd3dF?=
 =?utf-8?B?VmVYcWMvUmRnMk1RN3NkaXU1K1JiMTliVm45N01PbDdCWDlIRDF5Tk1SYjJS?=
 =?utf-8?Q?FmRLqIGcJCf6oakX1OUB/EXsz?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C1BDB09808C6242A0904B99A75D094B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nhf+0sp7AhGgiST2Rx+j1aW27k+RYHiu1LuyuBeSvsMz1x0ERaZLsF0Sk+1woih4470VEhCW69IGqmSdDELfkDmNglx90kbpw3ZOWg6HopHFqoJIBehTNPOm7v3iDHT0o4Sz2UyE2iV2JV+sJY47heiqkFqRDNq1UOJHFVvfI85kooe4Y8DbGvjuPkjcRR8jl7azlrU44GXfVbKCJg88BB96hnPDVKXP0Gk+k2KSkZSaVT2rvqtShOEpRYZA/gi0Kf+fSV5hWX82XKTYC20AoramXZRQrVx+ZlXj+IJg6uT3GkalIw24gKzMYgqWllhADpTS5ZImpiRLgbT+YGvqYmHSibNzM4epKtvYtoQef1ozz9CH7mVzxjLBw+EwGZdOLUtJP17cWhDG4iUVRSFeTwN1NiDMBGBpCCyLKH1SF5zvz8iuw7SkmMZk5hzgdRtttdPTlQKx0kKtIVUfbsSS7slVSx3zYpAWtlkm7U29kXHFKrlOCXz69V1GpHBzgl3l/AYxt296M9KiTQdXmC9rHO13re5jEkWVZG9RN2h2hHk5MJ+EsaGilR/2Wvirep5BHHN2wDTdUV0djv6Z7RtkJ04ATnY3ewdCm0d834Sv/us8ROR0d+QkOZvw/1TPAiOAX+rtSfNg7ntWmka69GRpl8P5EBawN6zphYI24aI8iTks1LMH2w5+l/vutdPUJ4vb4Mtsu3PBM6/AhJzSCMoOZkzG9ZC+jiiJQnkJFWyDwV5ovhjRhVVFxfI8s/zCZjvVRk4I+s2IMljKs7CQQtk+qzfUu8Wbtvu09DBTe7x83mtgTX0rZYvk0dA/Zu7j8qc1CcvwjZtMeuiIIYSuPbbFlkZVaGTLNEJ4OaYXyEIuwbuVW9zx9klF1hkElsG565aN
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b03aa3-343c-4e64-af16-08dad24986ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 20:37:25.9787
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mPYOFNeDrZ7Lr4ZKunQmbQY7HK2o+BHukAJJPc5g8cvZ+2F3R2LIYK+tnGEjzyBkijHpUiUfCHSW+gZrhA3JtZqkTdsns5FAtCZ/i7Sv3iQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6707

T24gMjkvMTEvMjAyMiAxNDozNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KQWNrZWQtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo=

