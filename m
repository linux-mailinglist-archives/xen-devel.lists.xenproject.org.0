Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CECFC50A8DD
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 21:15:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310427.527264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhcGe-0003oL-6I; Thu, 21 Apr 2022 19:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310427.527264; Thu, 21 Apr 2022 19:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhcGe-0003ld-2a; Thu, 21 Apr 2022 19:15:04 +0000
Received: by outflank-mailman (input) for mailman id 310427;
 Thu, 21 Apr 2022 19:15:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O5Hx=U7=citrix.com=prvs=10361b9f4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nhcGc-0003lX-JO
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 19:15:02 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55dbcd3e-c1a7-11ec-8fc2-03012f2f19d4;
 Thu, 21 Apr 2022 21:15:00 +0200 (CEST)
Received: from mail-co1nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 15:14:56 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN3PR03MB2305.namprd03.prod.outlook.com (2a01:111:e400:7bbf::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 19:14:53 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 19:14:52 +0000
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
X-Inumbo-ID: 55dbcd3e-c1a7-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650568499;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Y9pWpwzid0b/vkalw4ptt9lOsRkxF6ApYEjPg2lVN/g=;
  b=gP/ThJ4f5FaJ/j0iDNzVJNSDcj30ksf8VtwWm+MIMT86y0C1rhx37MJb
   aoN8XrK8D3djU+ftH3AtwNTX0iUPYH6PUz+qw5mTEaHmNpP7JaUrL1Kwq
   ns5p3cQuytheR5ymgVXZ+wpRfOKvyPnwWTXKk+6RECBjyr0321vf7ZdCk
   c=;
X-IronPort-RemoteIP: 104.47.56.170
X-IronPort-MID: 69646445
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:fDWUpqhzA2sfhC9a6qJWrMEZX161bBEKZh0ujC45NGQN5FlHY01je
 htvUTiPbviIN2Lxe4tza9m+9U1VvJLSzYA3HFE+qS4xQXsb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhX1nU4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YT4yZ/zPifsEbwZJDw5cBvRI1eb9IVHq5KR/z2WeG5ft69NHKRhveKY/o6NwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuIEehWho7ixNNa+2i
 84xQDxjdhnfJTZIPU8aEskWl+a0nHjvNTZfrTp5oIJpsjaPklAtjdABNvLPQtupWd5yxH2Hg
 T7i3EmjLB0RLdKAnG/tHnWEw7WncTnAcIAYGaC89/VqqEaO3WFVAxoTPXOjqOS9ol6zXZRYM
 UN80ight68p72SwU8LwGRa/pRasrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LQHGz
 XeMltLtQDdo6bucTCvE8q/O9Gzqfy8IMWUFeCkICxMf5MXuq50yiRSJSct/FKmyjZv+HjSYL
 y22kRXSTo471aYjv5hXN3id695wjvAlljII2zg=
IronPort-HdrOrdr: A9a23:l7sujK3Bj8RfxUDIC0nFMwqjBetxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHQYc2/hcAV7QZnidhILOFvAs0WKC+UysJ8SazIJgPM
 hbAs9D4bHLbGSSyPyKmDVQcOxQjuVvkprY49s2pk0FJW4FV0gj1XYBNu/xKDwVeOAyP+tcKH
 Pq3Lsjm9PPQxQqR/X+IkNAc/nIptXNmp6jSwUBHQQb5A6Hii7twKLmEjCDty1uEw9n8PMHyy
 zoggb57qKsv7WQ0RnHzVLe6JxQhZ/I1sZDPsqRkcIYQw+cyTpAJb4RGYFqjgpF5N1H22xa1+
 UkZC1Qefib3kmhO11dZyGdgjUIngxes0MKgmXo/EcL6faJOA7STfAxxL6xOyGplXbJ9rtHod
 129nPcuJxNARzamiPho9DOShFxj0Kx5WEviOgJkhVkIMMjgZJq3PoiFXluYd499ePBmfIaOf
 grCNuZ6OddcFucYXyctm5zwMa0VnB2GhudWEANtsGczjATxRlCvgEl7d1amm1F+IM2SpFC6e
 iBOqN0lKtWRstTaa5mHu8OTca+F2SISxPRN2CZJ0jhCcg8Sjnwgo+y5K9w6PCheZQOwpd3kJ
 PdUElAvWp3YE7qAd3m5uw9zvkMehTIYd3A8LAv23EigMyMeFPCC1zxdHk+1829vv4YHsrXH/
 6uJZM+OY6XEVfT
X-IronPort-AV: E=Sophos;i="5.90,279,1643691600"; 
   d="scan'208";a="69646445"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+PE9aU3u8o0zkrZ/o8hCXp26F4IpuUstdgM+DEuMUR7KC7R7epSU31oTHXwo4nOjlokT3kiptSdaoANDEy8bTU2ykt5RGLHOWCgjpIR/Hhj0iaVQb3rcZzIaTChhdGuE8wtn7X4DD6MMp24sZawkZoeka8zuAeSRn1iIMqC8LB1h7Bbht3c+R9Mok2bTZYxPZHBC4zjoILMx6NZj1gHbXLqnZy3W0+KFiGEq3kH3jxqe+KjYXFpm2PuNU3PzA3nEFtxwJh5Z973nmGdEuCnNrh8/A7brc8zDc7rcVCr/IpALgbeHW+8hbGVugioCMuE1N9K6e1avsAY1TiTfIdBIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9pWpwzid0b/vkalw4ptt9lOsRkxF6ApYEjPg2lVN/g=;
 b=csQOvYtYyKiYaHh7MF1kw2ZnW/cQi61em8S7xQsXOzZbW9yYvl2/szlOVR4aWvHPBQFxORNxxHWDHOVV14lHH6rLnXzI9acf4g9wis3z6yxmAnWDSmznNKH0x3aL0DFzSe8Et57BnJQg0c7LyOGQRi841OhLii2HuWk97ndoOAiKtQNN2KqT+3Gw6oOoqCwkrRqis+Q+tBCIHTrFM/+VJxCV3kCy+lc1iPygDItQ1TRcRZATW9X1qq365z4HHL9XADsoEVZF0x02UKd+154tdsuGf+0xPsKxtbSr0dQAnefXKfurxoah67AQzix+CuaYhDKPxsnbpiTlOHhGbHOA9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9pWpwzid0b/vkalw4ptt9lOsRkxF6ApYEjPg2lVN/g=;
 b=iQVku+UB/CZmcCe7SiCPViZ7N0GLuTsluGH8sPlslADdbe8S2B1lw1dx7I1NlkXV2oLVKED7SIreNwCRXRwpIuDXubfovCqj7Vq3IiyhsqYh6PvxmG/vOSzPn7MTgrFzf/IJeIXovCXjHcsBk3i+6biyjRCYJnitNuLxfeb48Q8=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Paul Durrant <paul@xen.org>, Juergen Gross <jgross@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] IOMMU: make domctl handler tolerate NULL domain
Thread-Topic: [PATCH] IOMMU: make domctl handler tolerate NULL domain
Thread-Index: AQHYU9FUwjuogeCS0EWgGeBVFIanqKz3Yk2AgAAA74CAAAPwgIAA5uIAgAJydgA=
Date: Thu, 21 Apr 2022 19:14:52 +0000
Message-ID: <f69185ac-9d7a-6293-f2aa-d2e8fa9a8e52@citrix.com>
References: <bc61d9cd-5da4-e35c-fb21-eeba5ab6e529@suse.com>
 <8a8aa0c1-e6f3-2dc0-77d4-282af89f4ed6@citrix.com>
 <bd446b5b-49ea-3d6f-6792-7d785586ea69@suse.com>
 <226afabd-ea07-dd60-474f-c594d7468de3@citrix.com>
 <7d3e5ed8-dd92-bfd7-6540-fa75965eeed8@suse.com>
In-Reply-To: <7d3e5ed8-dd92-bfd7-6540-fa75965eeed8@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ff6e9f5-8d1f-4005-c19f-08da23cb369b
x-ms-traffictypediagnostic: BN3PR03MB2305:EE_
x-microsoft-antispam-prvs:
 <BN3PR03MB2305007F2259FB0B95967842BAF49@BN3PR03MB2305.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 tYY8x1w+XhwkCXe5qmmLF6eeQN6uz3CShso6YizTROCb0O8GJrfvdzwyimGROXySHgL6dvbhC5VWYw0whqXCkrwobidaSIjrfCHnJOnHNGWXOMYwkUaYg6EvRBW2mt38gpKhQgePSerEXlPUwG3Lsg90zut8UYoa4SL6n2oaUKDIFJ1w0i5vQS4RVREdE66oPJ6ovdX1Se1TeMQI62S7Wvkkg0ggAq61gwoH7xRUCExgqzETyrgQWOl2waoHUo3B192/VPtuatzYV+t60Bhx7zbuR4ccImvaI5gpZrbDK3izj5wqvNB7FKjBCPN20xQvLtvmIvcaKHwlslE0dQ9FMz2h9AppD5HngGUbVb9lw1KfZFc7wMlOqK14CWlW+xXbGhCzxqmqOwRbHttLQ0PPUFLF5LvuI943bk6B+mCr8zshI3HnCSwOSpMhuST7Mwtx14uAWEScW8RZhCTnupAjOCdLsB3toMCoFblEWi59pzDJBPNTCpFnWR9Mt7EOilioY8hkyvzIZC73Zs5SBVGNuojFr0AK6wpciYeUxvYpfHGbqDbLZ46/EX3vqdY6WNXwxGsm/pDK2rNiLm2u1Cw2c1O+8Keb5qzSthncmzmMEDrmHsUMSRszcPckVCswpLCoObEd7C1RnK5ry6ruvaMhIvnzFmqS23zU7FnPhOnjLuOqLyD5H5v+bqD9G0A71oWSKKJ/Qf72M8siNChjRnkqG++0E7nZnVXAPMiOJx83HSAyTsoJPBVkkYExDexRwjonODUewP2rGBcYZRzGFL4Y5Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(91956017)(6916009)(122000001)(76116006)(82960400001)(66556008)(508600001)(64756008)(71200400001)(54906003)(186003)(31696002)(86362001)(2616005)(36756003)(66446008)(6486002)(66476007)(6512007)(38070700005)(2906002)(6506007)(4326008)(83380400001)(38100700002)(31686004)(26005)(316002)(53546011)(8676002)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dU94MGdxdEE3WEdsQjErdEp0c0RHc25DWnF2SEJhRmFEUkxQc281QXNvckVv?=
 =?utf-8?B?MEhCT203cTZnM1YvcmFWeTBMZ0pqUlNHWUtEVk1SKzdTWXl0ZlJMQ3diQXpi?=
 =?utf-8?B?SmlzMmp4T3NlaEpsOEFmSEFTZ2VrV0dmeG0weTZuZkJUSXNKV2lqRHpMN00y?=
 =?utf-8?B?aUl2eXZaQWtHd1paQTJickFrclF0WkpSeXVPS2FPMk4yK3lQSWpWMjFxS1VK?=
 =?utf-8?B?dnpnQWVMVWRCSEwxQm93NlRVQ3FSY3BCQmZmdzB4MXVRMTRyMW9RK2xLZHFy?=
 =?utf-8?B?VGdjVmJwVTl1bU1valhEbVI1S0w2L0JPc0hHbDN3WlM2WGJCZEk2dDVza2Iw?=
 =?utf-8?B?UnZ5RU9iSnpZYVpnaFlwWmw5ckNTaVpHQjFtVnJ5UWs4RXJ0MDdNYzhmdkY0?=
 =?utf-8?B?MHp4QXoraE5iVVRqTDdHRVExN1U0WFVPaGJaWkFvTDBSeXA5SzRmaytlVjdk?=
 =?utf-8?B?UTNmTXdFMDkybk96RGMyWlNLb28rWHJ1aVBYMHJCZUJjNmtqcDY3YnpkNEVk?=
 =?utf-8?B?NlRTOXgvdGo3cGRLZ201K1pSQnREMWtDVm9VNjM4dzdwTjBTV2s1cDNVNFVr?=
 =?utf-8?B?R0M3VFFkMTU5bVNHdmJtL0taaXpCZDZ1MWdoNmxDc2EwVWRjQW1KdzFjUytB?=
 =?utf-8?B?aFJJWHVIUnFieVVxTFhIVFNzOWU3UkUxNWVBS1U4WWJLTTVEbGtQRU5DeVVq?=
 =?utf-8?B?TE00K2tnMUQ4UGJSbHRGRVNjL0V4T0ZQUzhNdUc4WWJZcHk2LzNtQ2VUR3hy?=
 =?utf-8?B?TndPRFU2ZHdPUnhPZGZBRkdCeWRUZWJ5WU1hZER0RHA4MnFmQVU4WlBicWlG?=
 =?utf-8?B?S1ljS0ljeHh3U1lQeWdEcnB4eXBsOExsWHl2VlNCeHkrUUlnNDZ5elMvWUFj?=
 =?utf-8?B?Tjk4d3paOStjNnZLdzRqZ2txTTNvRTRqeFl1ZTNhWUNrTlVxYnp2cUNDRGxF?=
 =?utf-8?B?TytRREhESmFNNDBlL2hnL3V6K0dZT3p3UzB0THozMnlTSVR1Ujk0S0RXTVZ5?=
 =?utf-8?B?dG96ME1lYTdHaklzSzNNd3JCdFptekVwZU0vRzB1M2N6amxyWER3Zk9obytR?=
 =?utf-8?B?NCtyYWNKWS9UalZEb0N4MStsK3FTODVQKzZneXE3UHYzeS95czZEYUJVOG1o?=
 =?utf-8?B?MC9NKzJPd1lFRjM3WkRQdzZuWUNUSEFyK2lCWHBaZS9lN3NudVdFbS8rdEdz?=
 =?utf-8?B?RTJiUU5DUlRXZG1uL3VSdjZ4cEpSYnM2Unh5TDhwWERXdmU1S1RyRHE3RWg5?=
 =?utf-8?B?VWVHYWZwenVMYTZHbUQwRHNkVTlCd3FHNXBHMDVpOXBCZWQybGVLL0VKdkZF?=
 =?utf-8?B?dnpXWlpIUmxzeGNTaUFGY3lyRHFVSDZNb2ZSb0tZNVhmM1JSYlRIVmR3WHFO?=
 =?utf-8?B?ME9UM29Wc2JDbngveitDeEdrY1Z6Y0d6T2svYXJmUlc2OTNCYVd3YnNCRERx?=
 =?utf-8?B?S0dtMnl5emFqTWovL08zSlVDbFJvVEZkY1g3bk12VmN4bHlEcU4yRy8zN1Nv?=
 =?utf-8?B?cWZzL21YMy9RTlNuNTR5Y2ZIWXBvUTd5S0JVeWJJNVY1a2R6a3ZDTHRBdVhT?=
 =?utf-8?B?MVNKZjBKR1RmdVFKM21VM2VVckVGKzhuenNmTi94WlpmQ0FadHR2YTFQckU5?=
 =?utf-8?B?N2RRNndUY1oxTjRrVjJLUUZ2NFZSMkJuRzNjaVFldHlPdnJ2VXVaY1hkOVk4?=
 =?utf-8?B?T0p3N2JWZFIyY2V2ejhkc2NwRDFtalNXdDBUTVRyaDRYL0w3bHFDbi9Reklu?=
 =?utf-8?B?UzNPN2VsMGhzME1iNGl6VjNTN0FTdEdlV1hvUzh0bHNkb1AranFWL0taSTVM?=
 =?utf-8?B?OGxQeGYzNWJmQVREQVFXNVcwdW81bmFtVWNud0hkVm9KZzlnT21JL3dWaFV0?=
 =?utf-8?B?ZjlJRHprZFZ3cHQxTnAvSGF6TmJMOVNHbHo2QXVDTTYzUTBhTitZQkRDU3pG?=
 =?utf-8?B?dS82OURlb0pUbUhEQ3hlU0puMzgrQk9paXBHeVVwNWpSM3QrYjc1bjNpdFVj?=
 =?utf-8?B?c3o3UlpVdnk3TXZFSDZFQzRYN01iREdMNUVzM3ozaDlnZ1RLVGs4WXFTeWRE?=
 =?utf-8?B?TVhYT3BWS0VtcWRHOWU1VnZOdW5pZHllR0lrSS9reEVtODFBdnBHWFpjZmhD?=
 =?utf-8?B?ZkZyckZEait4V3IyNWMxRk5OWENkK0I2eWZ5dElwVk1BM1lzbTJGbkpES3ZC?=
 =?utf-8?B?anQ0bDgrOWt2bWgwV1phaEUxYzRIRUc4ampKNTlRd01IeDd0SjJkR2hEL2hk?=
 =?utf-8?B?R3U2c1k3QVhsTUxFM3h1dnhxOFJ4N1dyazdrMExzYnBOVUhNZzVsU1V4ejla?=
 =?utf-8?B?THdsTzJNcGczeXdnekUwbDhlV3BGYmR1SXMrc2k0VzkxY01zL2pKZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E227B0879C332643A1FB392CD64CD28F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff6e9f5-8d1f-4005-c19f-08da23cb369b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 19:14:52.7544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WKNoa9KK1S+3keWZEbSWkPbcumOqZpTrEDuhYcGBAkh1RKRbBd4L9H9w/N5T8uptwwBmU3qizk1vK0385BoqTmcGct8aFoBIIaze1LfIYu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2305

T24gMjAvMDQvMjAyMiAwNjo1MiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE5LjA0LjIwMjIg
MTg6MDYsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxOS8wNC8yMDIyIDE2OjUyLCBKdWVy
Z2VuIEdyb3NzIHdyb3RlOg0KPj4+IE9uIDE5LjA0LjIyIDE3OjQ4LCBBbmRyZXcgQ29vcGVyIHdy
b3RlOg0KPj4+PiBPbiAxOS8wNC8yMDIyIDEwOjM5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+
IEJlc2lkZXMgdGhlIHJlcG9ydGVyJ3MgaXNzdWUgb2YgaGl0dGluZyBhIE5VTEwgZGVyZWYgd2hl
bg0KPj4+Pj4gIUNPTkZJR19HREJTWCwNCj4+Pj4+IFhFTl9ET01DVExfdGVzdF9hc3NpZ25fZGV2
aWNlIGNhbiBsZWdpdGltYXRlbHkgZW5kIHVwIGhhdmluZyBOVUxMDQo+Pj4+PiBwYXNzZWQNCj4+
Pj4+IGhlcmUsIHdoZW4gdGhlIGRvbWN0bCB3YXMgcGFzc2VkIERPTUlEX0lOVkFMSUQuDQo+Pj4+
Pg0KPj4+Pj4gRml4ZXM6IDcxZTYxN2E2YjhmNiAoInVzZSBpc19pb21tdV9lbmFibGVkKCkgd2hl
cmUgYXBwcm9wcmlhdGUuLi4iKQ0KPj4+Pj4gUmVwb3J0ZWQtYnk6IENoZXllbm5lIFdpbGxzIDxj
aGV5ZW5uZS53aWxsc0BnbWFpbC5jb20+DQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+DQo+Pj4+Pg0KPj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvaW9tbXUuYw0KPj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9t
bXUuYw0KPj4+Pj4gQEAgLTU1OCw3ICs1NTgsNyBAQCBpbnQgaW9tbXVfZG9fZG9tY3RsKA0KPj4+
Pj4gwqAgew0KPj4+Pj4gwqDCoMKgwqDCoCBpbnQgcmV0ID0gLUVOT0RFVjsNCj4+Pj4+IMKgIC3C
oMKgwqAgaWYgKCAhaXNfaW9tbXVfZW5hYmxlZChkKSApDQo+Pj4+PiArwqDCoMKgIGlmICggIShk
ID8gaXNfaW9tbXVfZW5hYmxlZChkKSA6IGlvbW11X2VuYWJsZWQpICkNCj4+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gLUVPUE5PVFNVUFA7DQo+Pj4+IEhhdmluZyBzcGVudCB0aGUgYmV0
dGVyIHBhcnQgb2YgYSBkYXkgZGVidWdnaW5nIHRoaXMgbWVzcywgdGhpcyBwYXRjaCBpcw0KPj4+
PiBwbGFpbiBicm9rZW4uDQo+Pj4+DQo+Pj4+IEl0IGRlcGVuZHMgb24gSnVlcmdlbidzICJ4ZW4v
aW9tbXU6IGNsZWFudXAgaW9tbXUgcmVsYXRlZCBkb21jdGwNCj4+Pj4gaGFuZGxpbmciIHBhdGNo
LCBiZWNhdXNlIG90aGVyd2lzZSBpdCBlcnJvbmVvdXNseSBmYWlscyBub24tSU9NTVUNCj4+Pj4g
c3Vib3BzLg0KPj4+IFdoaWNoIGlzIG5vdCBhIHJlYWwgcHJvYmxlbSwgYXMgaXQgaXMgYmVpbmcg
Y2FsbGVkIGFmdGVyIGFsbCBvdGhlcg0KPj4+IHN1Ym9wcyBkaWRuJ3QgbWF0Y2guDQo+PiBJdCBp
cyBhIHJlYWwgcHJvYmxlbSBldmVuIG5vdywgYmVjYXVzZSBpdCBpcyBib2d1cyBmb3IgdGhlIGhv
c3Qgb3INCj4+IGRvbWFpbidzIElPTU1VIHN0YXR1cyB0byBoYXZlIGFueSBhbHRlcmF0aW9uIHRv
IHRoZQ0KPj4gWEVOX0RPTUNUTF9nZGJzeF9ndWVzdG1lbWlvIHBhdGguwqAgVGhlIHJvb3QgY2F1
c2Ugb2YgdGhpcyBidWcgaXMgdGhlDQo+PiBleGlzdGluZyBYRU5fRE9NQ1RMX2dkYnN4X2d1ZXN0
bWVtaW8gY2FzZSBiZWluZyBjb21waWxlZCBvdXQgaW4gdGhlDQo+PiAhR0RCU1ggY2FzZS4NCj4g
SSBmaW5kIHlvdXIgd29yZGluZyAoInBsYWluIGJyb2tlbiIgaW4gcGFydGljdWxhcikgaXJyaXRh
dGluZywgdG8gcHV0DQo+IGl0IG1pbGRseS4gVGhlIGNoYW5nZSBpbiBiZWhhdmlvciBpcyB0aGF0
IC1FT1BOT1RTVVBQIG1heSBub3cgYmUNCj4gcmV0dXJuZWQgZm9yIHRoZSBnZGJzeCBvcGVyYXRp
b24gaW5zdGVhZCBvZiAtRU5PU1lTLg0KDQpJdCdzIG5vdCBqdXN0IGdkYnN4IG9wZXJhdGlvbnMg
LSBpdCdzIGV2ZXJ5IGRvbWN0bCBzdWJvcCB3aG9zZSBjYXNlDQpzdGF0ZW1lbnQgaGFwcGVucyB0
byBnZXQgY29uZGl0aW9uYWxseSBjb21waWxlZCBvdXQ6DQoNClhFTl9ET01DVExfc2V0X2FjY2Vz
c19yZXF1aXJlZA0KWEVOX0RPTUNUTF9kZWJ1Z19vcA0KWEVOX0RPTUNUTF9tZW1fc2hhcmluZ19v
cA0KWEVOX0RPTUNUTF9hdWRpdF9wMm0NCg0KYW5kIGV2ZXJ5IGZ1dHVyZSBkb21jdGwuwqAgSSBk
aWRuJ3QgdHJ5aW5nIHJlYXNvbmluZyBhYm91dCB0aGUgZGlmZmVyaW5nDQpwb3B1bGF0aW9ucyBv
ZiBlYWNoIGFyY2hlcyBhcmNoX2RvX2RvbWN0bCgpLg0KDQo+ICBBbmQgdGhhdCdzIHdoZW4NCj4g
aXQgd291bGQgYmV0dGVyIGhhdmUgYmVlbiAtRU9QTk9UU1VQUCBpbiB0aGUgZmlyc3QgcGxhY2Uu
DQoNClRoaXMgaXJyZWxldmFudCB1bmxlc3MgeW91IGhhdmUgYSB0aW1lIG1hY2hpbmUsIG9yIHlv
dSBjYW4gcHJvdmUgdGhhdA0KdGhlIGNoYW5nZSBkb2Vzbid0IGJyZWFrIHRoaW5ncy4NCg0KRm9y
IHRoZSByZWNvcmQsIEkgZGlkbid0IGtub3cgYWJvdXQgSnVlcmdlbidzIGRpc2NvdmVyeSBvZiAy
IEVOT1NZUyB2cw0KRU9QTk9UU1VQUCBicmVha2FnZXMgaW4geGVuLmdpdCBhbG9uZSB3aGVuIHdy
aXRpbmcgdGhlIGVtYWlsLsKgIFRoZSBtYXNzLA0KYW5kIHNwdXJpb3VzLCBjaGFuZ2UgdG8gYWxt
b3N0IDJeMzIgc3Vib3BzIHdhcyBlbm91Z2ggdG8gZ2l2ZSBwYXVzZSBmb3INCnRob3VnaHQuDQoN
Cj4+IEl0IHdvdWxkIGJlIGEgbW9yZSBvYnZpb3VzIHByb2JsZW0gaWYgdGhlcmUgd2VyZSBjYWxs
cyBjaGFpbmVkIGFmdGVyDQo+PiBpb21tdV9kb19kb21jdGwoKSBpbiB0aGUgYXJjaF9kb21jdGwo
KSBkZWZhdWx0OiBibG9ja3MsIGJlY2F1c2UgdGhlbiBpdA0KPj4gd291bGRuJ3Qgb25seSBiZSBj
b21waWxlZC1vdXQgZnVuY3Rpb25hbGl0eSB3aGljaCBoaXQgdGhpcyBjaGVjay4NCj4gQnV0IHRo
YXQncyBub3QgdGhlIGNhc2UuDQoNClRoZXJlIGlzIHRpbWVib21iIHdoaWNoIGp1c3QgZXhwbG9k
ZWQgb24gYSB1c2VyLCBhbmQgeW91J3ZlIHByb3ZpZGVkIGENCnBhdGNoIGNsYWltaW5nIHRvIGRl
ZnVzZSBpdCwgd2hlbiBhbGwgeW91IGhhdmUgZG9uZSBpcyBzd2FwIG91dCBvbmUNCnRyaWdnZXIg
Zm9yIGFub3RoZXIuDQoNClNwZWNpZmljYWxseSwgeW91J3ZlIHJlcGxhY2VkIGEgbGF0ZW50IGJ1
ZyAobm90aGluZyBhY3R1YWxseSBjYWxscw0KdGVzdF9hc3NpZ25fZGV2aWNlIHdpdGggRE9NSURf
SU5WQUxJRCkgd2l0aCBhIHJlYWwgZXJyb3IgbWV0YXN0YWJpbGl0eQ0KZm9yIGxvZ2ljIHRoYXQg
cmVhbGx5IGRvZXMgY2FyZSBhYm91dCBFTk9TWVMgdnMgRU9QTk9UU1VQUC4NCg0KWWVzIC0gd2Ug
c2hvdWxkIGRlY2lkZSB3aGV0aGVyIGl0IG91Z2h0IGJlIGxlZ2FsIHRvIGNhbGwNCnRlc3RfYXNz
aWduX2RldmljZSB3aXRoIERPTUlEX0lOVkFMSUQgb3Igbm90LCBhbmQgdGhlbiB3cml0ZSB0aGUN
CnJlYXNvbmluZyBkb3duIGluIHRoZSBzYW1lIHBhdGNoIHdoaWNoIGFkanVzdHMgZG9fZG9tY3Rs
KCkgYW5kL29yDQppb21tdV9kb19kb21jdGwoKSB0byBoYXZlIGNvbnNpc3RlbnQgYmVoYXZpb3Vy
Lg0KDQpCdXQgdW50aWwgaW9tbXVfZG9fZG9tY3RsKCkgaXMgZmlsdGVyZWQgdG8gbm90IG9wZXJh
dGUgb24gdW5yZWxhdGVkDQpzdWJvcHMsIG1ha2luZyB0aGlzIGNoYW5nZSBicmVha3MgbW9yZSB0
aGluZ3MgdGhhbiBpdCBmaXhlcy4NCg0KfkFuZHJldw0K

