Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A05F14C8D9D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 15:24:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281537.479912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3QT-0006ps-Rl; Tue, 01 Mar 2022 14:24:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281537.479912; Tue, 01 Mar 2022 14:24:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3QT-0006ms-OY; Tue, 01 Mar 2022 14:24:29 +0000
Received: by outflank-mailman (input) for mailman id 281537;
 Tue, 01 Mar 2022 14:24:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YI9j=TM=citrix.com=prvs=0520bb690=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nP3QS-0006mi-AY
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 14:24:28 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bc9197c-996b-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 15:24:26 +0100 (CET)
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
X-Inumbo-ID: 4bc9197c-996b-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646144666;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=xaici8cdAXimItpFNgulJa2mXejsU3sDY7hjdE8UlLQ=;
  b=QD4ZepsellU1xXKNCjnaDhoS5ZJipAalYPFYPnmv1p5thKy1OTnCPZuB
   lpsOfxq6LRNRvRaJ3fKPqMDSt5JZg9IhR/6OwFyHIMXVqTEGG6YMMvqMt
   KZiSbeoemyZgi1Gw/8J3RobF0blhv2lVTNssl5D7o4N2l/G9wHTd+nejQ
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65629341
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tQ7ICa6zI79f/CF9pXTGTwxRtCXHchMFZxGqfqrLsTDasY5as4F+v
 mEfDWrQbK2DMTHwKdt1Ot/n9E5V7ZLTnNZhQAY9rS5mHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YPhWlvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSZSAoAObfhg90vVjgfMyNiAohl/bjYdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKs2vH16wC6fJvEhWZ3ZGI3B5MNC3Sd2jcdLdRrbT
 5REN2A+N0iZC/FJEgYYVqwskr33umTUYSdJuXSTj6YOsneGmWSd15CyaYGIK7RmX/59jkue4
 27L4Wn9KhUbL8CEjyqI9Gq2ge3Clj+9X5gdfJWn8tZ6jVvVwXYcYDUUX1ampfiyimalRslSb
 UcT/0ITQbMarRLxCIOnBlvh/SDC7kV0t8ds//MSwQCA463Ozh2gNG0lCR5DdOMDl8oxWml/v
 rOWpO/BCTtqubyTbHuS8LaIsD+/URQowX8+iTwsFlVcvYS6yG0npleWF4s4Tvbp5jHgMWyom
 1i3QD4Ca6L/ZCLh/4Gy5hj5jj2lvfAlpSZlt1yMDgpJAu6UDbNJhrBEC3CGtZ6sz67DFzFtW
 UTofeDEtIji6rnXyUSwrB0lRu3B2hp8GGS0baRTN5cg7S+x3HWoYJpd5jpzTG8wbJpaIWCyP
 hOK4FoAjHO2AJdMRfUsC25WI553pZUM6Py/DqyEBjawSsIZmPC7ENFGOhfLgjGFfLkEmqAjI
 5aLGftA/l5BYZmLOAGeHr9HuZdyn3hW7TqKGfjTkkT2uZLDNSX9YepUbzOzghURsfrsTPP9q
 I0EaaNnCnx3DYXDX8Ug2dVLfABScCNiXsieRg4+XrfrHzeK0VoJUpf56bggZ5Zkj+JSkOLJ9
 Wu6QUhW1Bz0gnivFOlAQioLhG/HNXqnkU8GAA==
IronPort-HdrOrdr: A9a23:2Qev1aijkG6JbpFT8WotB/UDB3BQXvMji2hC6mlwRA09TyXPrb
 HXoB19726RtN9xYgBEpTjjUJPrfZq4z/NICOYqUYtKMDOIhILKFvAB0WKB+V3d8nbFh5dgPM
 5bGsAUNDSXNzZHZK3BkWqF+rgboeVuX8qT9JzjJ9sGd3AMV0nAhT0JbDqmLg==
X-IronPort-AV: E=Sophos;i="5.90,146,1643691600"; 
   d="scan'208";a="65629341"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PgqthP5GVfvcYFFXb0iWzUAT3RDKoD8Z2XNYajkVkXMpXffcZ2p0pcWNCjQGzFGCiyf24ceIYDOV/U3aaHo7ZVSq0rWml/7MecIew7H4ENz1mEDnUzKlmudlBs2DUVqg220/N4AsWmAUHKUaZp/JS8eiX6cgQIkgp4NcUgA8MGjhKGAa5tORZGZYApfYUm/ofZ6Wnl2fvWMAl7voAk3TIYeEZuzSBXTPRT6TX5xadT0aU/Xbbq3quROdaN8fzIMgIttE6yTclJTwpHsOEjzdtfq0xHFrQ9MKwGwTDBEughjc/ze74fFUW6pYJwktdMzF5pD+Kq75rfBGSEnmdT/wSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaici8cdAXimItpFNgulJa2mXejsU3sDY7hjdE8UlLQ=;
 b=J4wbyKpoWThswLti/VQ/16UiPZPs8PZaKg1vT5ao1kp3uAwIDtX7QwJiDaAPEZF/kj8eOdP67HVWhuDi5yIgI05b/XiIeM4RRiHCu1J9XqQJmbTZy0cFV144YsYAmRFqCNL1WAyQoB2K4V3dGbajB5kjrSpgln7AN/oOwhsF87yGhTaB7lhZznfrSM2Vjo/JhvfgEWEs9Wm63BagbX56FFfblfwRGWNErG7+Cqt5r32GnQKX6WJab78rvW9ZdJvqNNBdCY2BaVArUzGvbLvyc54u22dt7N+hlrz7OvIEUvw72exSRODiB3bBFyMG4ToR58eBGZbvZDBMQ3G3r1vIkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xaici8cdAXimItpFNgulJa2mXejsU3sDY7hjdE8UlLQ=;
 b=HpzvPHOqNa4A3FPl6cxAcRSrdpocNJ3WctH8COgLszBn3n8LVTbgr3Z287cZNyXbI7Xc83EuO7U1/lehknpvmAsYwBX65MSjeZZ6SlpXNgW9W7w33lkB5JYVHBN75as86CJu78Wjiz8x2B4YHDL2NIdemJ+CMJw4cgKFF/XctLU=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] x86/time: add CF-clobber annotations
Thread-Topic: [PATCH 2/2] x86/time: add CF-clobber annotations
Thread-Index: AQHYLVxwam4XOlcoM0qksn/nZK0dPqyqgvIAgAAQwwCAAAGngA==
Date: Tue, 1 Mar 2022 14:24:21 +0000
Message-ID: <ae77b805-b513-7aa7-ece0-c3c7dbf662c1@citrix.com>
References: <77675e7f-2a7e-f517-4aba-e20774c8bfe5@suse.com>
 <61bbf544-74ac-b698-425a-d1db80acab43@suse.com>
 <20185a89-0a2b-6bbd-5484-31b6582ed200@citrix.com>
 <40ce913e-4388-2d2f-45e3-e725a927da92@suse.com>
In-Reply-To: <40ce913e-4388-2d2f-45e3-e725a927da92@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80dcb7a7-b2a5-4b90-27f0-08d9fb8f2da0
x-ms-traffictypediagnostic: BN7PR03MB3745:EE_
x-microsoft-antispam-prvs: <BN7PR03MB37456EC85B1C9EF75E6DA0D2BA029@BN7PR03MB3745.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NYncMaXCEl+RmN+2SRkR9dcduHWyQG85jXMIjAXJp7xw49hvCm2wmFrzzA0w4LFWqfHlbCUdDQlqe22ZvESgoiglbG61rCiEEZCTv2GlL5Kdk0U9mFc8wZDf98iBd17QIo1tfZpHtFrYmUAS5e0adfVhdskOF0WWxNaQ0rpFwEGyWaoPhad0gnMqbbKyO6eC8wqthOaRawZ6/5cI+kxJFgEPPR2O6pGG9fweUjhaGj5V+y+zrpPjiBP2nD8xmS9FkYi1cX6POAlMO9fwdYLhNx50QbjLdHDwV14dcNkKhbBmPlXGWB5hHN4CM8+e8KH+3aGjUnDaIsqHSLFYPlbuhVDue1Cx6ky/Wz9N39RNnhV9q1JfFH+PE0/n6jJAdo4uab/NgBUaCTX8abjTXSu++HW2PLWd8eeM5L12M1Khz72TKN6LZyWNqhMoo/9L15fco1nOSvEgzQRlnCg3Rojh9tGPWacbzujpKFTTu8NQ96i3yKduORHpaK3DoTao9K9r6+YJtKf6G7j8TVKA9wZzfZTVrumqdaMeh/j1kPHOQ77R1r8NiGRzGT3C3pnBxbPIVrkElg2YZR6M3q773qtgXqFjNlQoSyfSZxfRiPX97tZ3X8RAhmjuNkgapyyjxW6oYKmzF7pBnQF97ydx8a0ew/aGwu/ebFilZhrtOSAwroDSkGhkhpmOQlW5olO/OzOBa314hfTD3bvguZPcYoRHAP4x95J/Roz73OT1lr09aLEvfx48wCFiYHxoMLB8Q5IvfVOWIDwp9cHF+3UgBfll4g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(6486002)(508600001)(8676002)(5660300002)(36756003)(53546011)(6506007)(54906003)(6916009)(316002)(82960400001)(91956017)(122000001)(8936002)(64756008)(66446008)(66476007)(4326008)(76116006)(66556008)(38100700002)(66946007)(6512007)(186003)(38070700005)(31686004)(86362001)(31696002)(2906002)(2616005)(83380400001)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dWtaMklocGxqZFdZN05JZlczNHNib05COXRqNFQ3d3hXOFZ5WWh6NjBHMWkz?=
 =?utf-8?B?alVFU2tZaVZBdTFBUFMzR3plOTBNN1dYS1dQY0pSVVcycEVkQkovUjlad05T?=
 =?utf-8?B?dDMyQy9UNmJVK1NWb1orVDhqY1hDK0tMQ0REVDg5eDBIbUZiQURYYmowa1Fh?=
 =?utf-8?B?b0ZSQS95VmZ2eUVOM3IvbGFUN2dCc1JpTjREVXhrdmZTeW9MWXRkSGtPY1pM?=
 =?utf-8?B?R2M3OFlJZVdhKzB1S0QzQ3hXdm03clh3bkNGVSt6Z3Z3NDdJOFhBdDllOGo2?=
 =?utf-8?B?cTVXK21PcjlmbTlaVjcwOXNGTHBqenlsUWRYc1ZINFVnL1dFTUpMbGJJTXFX?=
 =?utf-8?B?dXZVOEViWnNNNHFUQlZFNW1VMnQ3MENUSEFKYmU5bG5jVnlzMkRLTVliVzEy?=
 =?utf-8?B?V3N3cmZrQ0grZlNISVpkZXdKK3k4b0hwaUcwRE9tUTRFbjJ5T2prb0xYeGRm?=
 =?utf-8?B?NTR2TXYrMVZCZ09HYUYzMDJjTng0VXBpMWM5Vks0cGxqdGhod2JDTmJ5NFAy?=
 =?utf-8?B?UFRyd2lsMGRhN2JtaDdQd1JNazNwUy9WMnpZNGV6aHVKSjd4WmpOc3lKQVBm?=
 =?utf-8?B?c3VRQUxTNzB5d0p2SmlJbXNwZHd3T3NPelhENEVLeVk0MlViRU1lUDV6OERH?=
 =?utf-8?B?T1BNNDg3N1orSldTbUFFUFZZa2NhOWhLcFFKdlNrU1ZBYmJKR1VjeVZ0S3J6?=
 =?utf-8?B?Zlg5bTkvVDBPdnIxS04rZjUvWFdxdElkT3VEM0RRZk5mY2xadXdVZ21jTU1Q?=
 =?utf-8?B?WS9pZzB0eThCTjIzMzFMTGpzbE9kSHRjUFR5VnBHNGxpM1hwZ3hUK3BrU0FF?=
 =?utf-8?B?WWRJeHhFZW51SVJRekFQa3cvSU50cW55MVF5Zm90UVhhL0h1VEkyWnN2aEJY?=
 =?utf-8?B?cXZQRjFya21nNTA0bnd0NEtmYXBtdEF2QXZQUWw4Y25DdVpNbWZpbW5ZTDZk?=
 =?utf-8?B?SmpoR3lBMlFuV0xlaW9mREtGNkQ1YTBzNDYyeng4alYzM0ZZcEt0VUNMRVhz?=
 =?utf-8?B?SDAvMVQrem40QUJ0QmkwaVA3dkJ5V1V3aTk3Ti9WRTRvRG9Ca1NmUFJLMTNH?=
 =?utf-8?B?bXNhUzRKWU5vbFRzU0VENkM2KzVUN1dnQlRnUUV4ZHRVTUxTWE1SSDhDejZt?=
 =?utf-8?B?SDFDT2hQQjVqYlZ0Mm5IOUhDMzN2SjFaRkxKYngwcXJHbnNNM1JpZExQMnZK?=
 =?utf-8?B?am5LS1BjY3BGKzRjaGszVlRSQm1lOFk5RkhIaU1nUjZZbG9XdmNjSkhjM0lw?=
 =?utf-8?B?ekdVUnVIdXZxYjZJSUR1WWJqWVBYS295aTg4Z09Hdjd0bk5UNVVvTUgzYU9P?=
 =?utf-8?B?TW1RQ2ViMGw1emNsWmlqTHdxdEJHRXMyWXl4MG50VVhLR0xVdmowcGpDSSti?=
 =?utf-8?B?MXltWXdIQXE4T2JVUW9OYlJQQ3M2ZHFEcTJTY1RkN3luakYydmxpWHF4ZTl3?=
 =?utf-8?B?cExER3cyS3B2cUFzNjludFFWeGNCRzN5MjZaMGpwdWVCcm5ycFZOb29FM0xI?=
 =?utf-8?B?ekhpSDNwQ1J4Tnk2NHFtcUZPT1BZTmRnRHVKRGJ5Ymt0cXNraHNTUEZ2d1JL?=
 =?utf-8?B?aEhlRGswR0VheHJlTGExMTYwSGJiaDZpMXZuemtLdkUzdS9IMzgvYkcrdkxX?=
 =?utf-8?B?R1RWamh6WVovdWVZdDVaT3BiRkNueTMwamFmK0x3RFNoY01mSTlONG1Lb3RY?=
 =?utf-8?B?SnZkR3VyNVovbVdRV2hRQTZZMmF5RjFzaDZRSk1IcjJyc2gwWEZINDh6WG1X?=
 =?utf-8?B?ajBDSS82dXo4dEkxcTBBdjFjR1NsUkFacTBDRjRPS0lTMmxGYkFrdnJvUWNO?=
 =?utf-8?B?V2xSS3lHc01pK3Y5bnBLSzE5TVorWEJCMi9HSEsrK2d2cTNBbE00NFBqaVg3?=
 =?utf-8?B?bVJpSDZTaFZ0cisxQTNhODRKUjNJYzkvNmxYZVFhS21CR3ZEaTRzZDdwOXBU?=
 =?utf-8?B?ckJCUkFXYXlQZ2N2N3hZdlhYbkZ4alp5TWJMbjAvWjVWNDJWVkovUzZDSzcy?=
 =?utf-8?B?WWFCeHlkQ05mQi9zNkEwS0V2TmJHTTJMdEhGejJnZU8raFkrVEJVbUw1Vk8r?=
 =?utf-8?B?TC9tSjJLLzNRM3phd1pLZjZ6ODEzQWFFekNWUlE4UDdvRWUzT3k0cy9vaWZG?=
 =?utf-8?B?MmJoRE9MQWptQ0twQ0d5YkJSNlBScGd0YUxNS2dzZ3pHWHdMeGNUTkJZamlK?=
 =?utf-8?B?V1JCWG5zNm9qQkJGaTBldlIwYUdSZjl6ZUNkcEYzcTE3L1lIMk1OMFgwRmJs?=
 =?utf-8?B?bnBpd0l6MHd3ZVNVNUJ4UXZIanJ3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F163A10779CFCE40A0434A5B2CF8BEA1@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80dcb7a7-b2a5-4b90-27f0-08d9fb8f2da0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 14:24:21.3220
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JzGguSLShiN9jBOvWi2w8vitgSPvh0LMb6yzaUJRTsdnOHtdSkez2Q3H9ZkCrXimxlEOF7eT8Ymz1SNDdLllAttk38HY729P90l+A+HTUX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3745
X-OriginatorOrg: citrix.com

T24gMDEvMDMvMjAyMiAxNDoxOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDAxLjAzLjIwMjIg
MTQ6MTgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAwMS8wMy8yMDIyIDExOjA2LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBXaXRoIGJlZDlhZTU0ZGY0NCAoIng4Ni90aW1lOiBzd2l0Y2gg
cGxhdGZvcm0gdGltZXIgaG9va3MgdG8gYWx0Y2FsbCIpDQo+Pj4gaW4gcGxhY2Ugd2UgY2FuIGZ1
cnRoZXIgYXJyYW5nZSBmb3IgRU5EQlIgcmVtb3ZhbCBmcm9tIHRoZSBmdW5jdGlvbnMgbm8NCj4+
PiBsb25nZXIgc3ViamVjdCB0byBpbmRpcmVjdCBjYWxscy4gTm90ZSB0aGF0IHBsdF90c2MgaXMg
bGVmdCB1bnRvdWNoZWQsDQo+Pj4gZm9yIG5vdCBob2xkaW5nIGFueSBwb2ludGVyIGVsaWdpYmxl
IGZvciBFTkRCUiByZW1vdmFsLg0KPj4gSSdkIGJlIHRlbXB0ZWQgdG8gaW5jbHVkZSBpdCwgZm9y
IGNvbnNpc3RlbmN5IHNha2UgYWxvbmUuDQo+Pg0KPj4gSXQgaXMgbGVzcyBsaWtlbHkgdG8gZ28g
d3JvbmcgaW4gdGhlIGZ1dHVyZSBpZiBhbm90aGVyIGhvb2sgaXMgaW50cm9kdWNlZC4NCj4gQ2Fu
IGRvLCBzdXJlLg0KPg0KPj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4NCj4+IFdpdGggdGhlIGNvbW1pdCBtZXNzYWdlLCBJJ20gbm90IG5vdCBjZXJ0YWlu
IGlmIHRoaXMgaXMgbGlua2VkIHRvIHRoZQ0KPj4gcHJldmlvdXMgcGF0Y2guDQo+Pg0KPj4gT3Zl
cmFsbCBpdCBsb29rcyBmaW5lLCBidXQgSSdkIGxpa2UgdG8gZ2V0IGNsYXJpdHkgb24gdGhpcyBw
b2ludC4NCj4gQ29udmVydGluZyByZWFkX3RzYygpIHdhcyBkaXNjdXNzZWQgKHdpdGggUm9nZXIp
IGVhcmxpZXIgb24sIHNvIEknZA0KPiB2aWV3IHRoaXMgYXMgYSBzZXBhcmF0ZSBjaGFuZ2UuIEFz
IHNhaWQgaW4gcmVwbHkgdG8geW91ciBjb21tZW50cyBvbg0KPiB0aGUgMXN0IHBhdGNoLCBob3cg
ZXhhY3RseSByZWFkX3RzYygpIGxvb2tzIGxpa2UgaXMgb3J0aG9nb25hbCB0bw0KPiB0aGUgY2hh
bmdlcyBoZXJlIGF0IGxlYXN0IGFzIGxvbmcgYXMgaXQgZG9lc24ndCBsaXZlIGluIC50ZXh0Lg0K
DQpPay7CoCBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4NCg==

