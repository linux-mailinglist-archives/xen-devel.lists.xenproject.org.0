Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B510959F8F9
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 14:03:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392489.630871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQp5j-0006Cr-1H; Wed, 24 Aug 2022 12:02:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392489.630871; Wed, 24 Aug 2022 12:02:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQp5i-0006AV-Tt; Wed, 24 Aug 2022 12:02:38 +0000
Received: by outflank-mailman (input) for mailman id 392489;
 Wed, 24 Aug 2022 12:02:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ebS+=Y4=citrix.com=prvs=22883313c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oQp5g-0006AP-LU
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 12:02:36 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a28ba1da-23a4-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 14:02:34 +0200 (CEST)
Received: from mail-bn1nam07lp2045.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Aug 2022 08:02:25 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB5122.namprd03.prod.outlook.com (2603:10b6:408:da::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 24 Aug
 2022 12:02:23 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5546.024; Wed, 24 Aug 2022
 12:02:23 +0000
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
X-Inumbo-ID: a28ba1da-23a4-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1661342554;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=j/g7Vsf/B17xYcTUDMcLj8uV9rv3tD9EyRScQdKjd8Y=;
  b=FP5G6hW98bg6ICuXFh9tqkNm4rCZliPuc0lSxQ1jZEDiS44mgDA4gkk+
   26QaAVTo4J3uI6ZgbeZCrmmNvuqLzh/WIjqS7ACAqywG2mw/JsOaPNPcj
   TKHJCq6P7bHy87/sXviNMeAXdHdbkkcW+X1SrUFngQZj0tW9JieR33Olt
   4=;
X-IronPort-RemoteIP: 104.47.51.45
X-IronPort-MID: 78013639
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0A7CPa6pu5zMXdpL+uU/5AxRtO3GchMFZxGqfqrLsTDasY5as4F+v
 mFOUDuObPveYzfzeNAjPI+x80gFscKBnII1GVY/pSFhHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yM6jclkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjimUc3l48sfrZ8ks/5qiq4Vv0g3RlDRx1lA6G/5UqJMp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VSKlLgFVHmZkl+AsBOtiNqtC0qupvXAdJHAathZ5dlqPgqo
 DlFncTYpQ7EpcQgksxFO/VTO3kW0aGrZNYriJVw2CCe5xSuTpfi/xlhJG9uJLMp5bhwOl5tz
 8EBEmtUMDashf3jldpXSsE07igiBO/CGdtF/1tGlHTeB/tgRo3fSaLX49MexC03ms1FAffZY
 YwedCZraxPDJRZIPz/7CrpnxLvu2ia5LmQe9A/9SakfugA/yCRY1rT3PcWTUduNXchPxW6Tp
 37c/nS/CRYfXDCa4WXVqiv32LSe9c/9cLsjMqXo6/Jyu1C0/WFCWQEfZwK2hPbs3yZSXPoac
 ST44BEGr6I/6UiqRdnVRACjrTiPuRt0c8VUO/037keK0KW8ywOQHG0NVDNCQN0gqs4tRDYu2
 0OJntXmHjhmuvueTnf13qubqSOaPSkTMHMYYikFXU0J7rHLsIw1yx7CUNtnOKq0lcHuXyH9x
 SiQqyozjKlVitQEv5hX5njCijOo45LPFwg8412IWnr/tl8kIom4e4av9F7Xq+5aK5qURUWAu
 35CnNWC6OcJDteGkynlrPgxIYxFLs2taFX06WOD1bF4n9hx0xZPpbxt3Qw=
IronPort-HdrOrdr: A9a23:Qcp8v6FrwgcR4gGwpLqFS5HXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNNICPoqTM2ftW7dySeVxeBZnMHfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj2Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnY4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlUFtyssHfqWG1SYczGgNkHmpDq1L/sqq
 iKn/4UBbUw15oWRBDynfKi4Xi47N9k0Q6e9bbRuwqenSW+fkN1NyMJv/MmTvOSgXBQw+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjxkC3fLFuH4O5l7Zvin99AdMFBmb3+YonGO
 5hAIXV4+tXa0qTazTcsnN0yNKhU3wvFlPeK3Jy8fC9wnxThjR03kEYzMsQkjMJ8488UYBN46
 DBPr5znL9DQ8cKZeZ2BfsHQ8GwFmvRKCi8eF66MBDiDuUKKnjNo5n47PE84/yrYoUByN8olJ
 HIQDpjxBoPkoLVeLizNbFwg2DwqT+GLEXQI+lllutEk6y5Qqb3OiueT11rm9e8opwkc7/mZ8
 o=
X-IronPort-AV: E=Sophos;i="5.93,260,1654574400"; 
   d="scan'208";a="78013639"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgytx6zfNl/8vj+50AWhlj24lwt7G38fI7VCcR1935Dp7WsLRs2moXIAbpCg9Ul92/DVZ1kqv/NFoV5VVP6gn2P/PN1hqmGrAaWbvXHuuIoxLVdBaAYxZh1J6M/zG0S6ps8h45teSC0eehMTYZyKDWohsYECFHom1s126mNNiqZb6aL4Xg9QKCwahUYcEE/VX77Hwt8wr4jtOiGt9BuVRwJPiBA3/24ygzBDm3qcFMkA1t8Hq38i1VcRWhyEY0SAz1WGDt0miezhfwQ04wrQh9Pa9QehUFNZNxHJZbwKTSM+wTQiNYcaYoWTtSsuMlQBnx+BogfVjbhGJ/1xK6SSuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/g7Vsf/B17xYcTUDMcLj8uV9rv3tD9EyRScQdKjd8Y=;
 b=nce+o7ivD7dhtdarSOp/ASfHABfDjIjeXBWn5iaUmw2OaaF18hhMk2yx72xHkReKjeKPIqMKaHmuEqfoYIetS6AJy3/p1KUPZ4oaUSCBhh4ndzo0Yx2mfQ6Vg2nsp3etFO3XAk2TcszeYrQR8Lkqdr2MHkM3jK1Tusvo/xYKZG+MDEIlgsuHEE0Qc7UBhX57zjWZdnSG9b1Fw3PL+RaAMdbOobuD0MTA+zMWa2OEBgZ2Uw8/ixsUre+eF6oWh/lRZ/xie9nwqOInUO5pfkOek4yCoddCrfGSxQm2aD0Bx/6F3nlhgviqG4F4oD98G4l8TTs7cK7yKxd3wRND7HJl3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/g7Vsf/B17xYcTUDMcLj8uV9rv3tD9EyRScQdKjd8Y=;
 b=IYPXryCM5axMnU/jxStkExdeys/3xp9cPRrY0gyeo8C6CBnRz7WEYxFI3PB4nGQgk/RIFJBuMDx+Ui3UBfkHEpNtE1k6LRUKYe/j6cYsTse87axJts8b45IPbrNWvyyng11yITvPNWH0+zc6S5yEnYQslU1SY2x9umvFSdYK0TE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Thomas Gleixner <tglx@linutronix.de>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/CPUID: surface suitable value in EBX of XSTATE
 subleaf 1
Thread-Topic: [PATCH] x86/CPUID: surface suitable value in EBX of XSTATE
 subleaf 1
Thread-Index: AQHYtrt8/1v0WOY/4kiCtfQ8qrAcS628L8cAgAAH3wCAABa0AIAAFEkAgAGSoQA=
Date: Wed, 24 Aug 2022 12:02:23 +0000
Message-ID: <0a4c3091-cb52-161a-e281-477889f202fe@citrix.com>
References: <a4ec41e6-16cd-4452-19c1-5d6d9e3bddf8@suse.com>
 <27f97ef0-148d-a0c3-ae13-0ed4d640a10c@citrix.com>
 <b3873ba1-f2f5-2f64-9bf6-d819f614019d@suse.com>
 <d5188b0d-43d9-44f1-2aae-e8ca0350a911@citrix.com>
 <e9de03a3-77cf-bc90-be48-ef6b1f133661@suse.com>
In-Reply-To: <e9de03a3-77cf-bc90-be48-ef6b1f133661@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e1381d8-168b-4456-7462-08da85c88121
x-ms-traffictypediagnostic: BN8PR03MB5122:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Hlnp3wp1p3yWjnpMdZEULe7yhkO7MPuEbAueE34HV1T8Wag9Cisj+DK5DKUdgUmL/3PC1R2t6cDr7F651poJ4SANH6hGF+ZwdEsRRUGgOXgxbQF9TYohHY8dFGPeTZXIzJeYAaZ10coZaQFDm3buG6G6LutnTZ+biQ7Jnt2N6P8f8l3U+NDyfQUGYrOp1Pjc+9/Ow8SMUf7XWM2VXvfXztfjWC1DFwfghTETbunkub42Xc6RzZfOXIDsfo0jPrldpJXLre6+xE8INIlpmZ1T7URJZBqr4WaAENX16XHEsTYBqRG5erulO0PhahW0+Pz3cRewqJVKKD57MXCnvVCmpaDWlhFe0WqiLzWyRQqB9luKGyHOGiIIbGlzDzns3nLnEgoi1GpoCyYYApYiPqdTapPuvsYF5kSw71ddxqZKRaRUzuzWld7zNczg54iljM+LsZY61lI3J42FZFi6Ci13g65w0Xnd4ioDjGNhzz3yYwk+HbMhp5cocGwMa3SJerVi4Z30eR4QAvec1vocX3+pKeK+G+yhh7VWn/gIOP8eayGI4PFC4rNNUKQE/6Jloji7UDvZlZn7vhsiLPPwnx6WrJS72xY/YJte3dNnH6YLxWEka9zk5tu0YveXRd3DVcYc0s8qksmZqnLOK+Mfzu1SXeEkig2u9a78zPEG9gpGuPu3dJ3gNI+O4wZajL61i9ME76hu++KJzWuCMfq3fWv2zPjdOMoWydWLNrvAFZT2cDBx6V6vuwTPvZRz9vp2V9rIWKexWWQOw9CdMx23B9eIXPXOK8rYkLUXwKv7rBamrx6a9U1GK7v6cGVMS7Ec/0n5H9weyoZhNjRamZvPhaafZA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(478600001)(6486002)(38070700005)(316002)(71200400001)(82960400001)(6916009)(54906003)(2616005)(186003)(83380400001)(122000001)(53546011)(6506007)(41300700001)(38100700002)(6512007)(26005)(31686004)(2906002)(36756003)(4326008)(86362001)(8936002)(31696002)(8676002)(5660300002)(66556008)(66946007)(66476007)(76116006)(64756008)(91956017)(66446008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cmFTYzFHL29xMy9LbVg2MVFJa1pqUjVrbTJaZEIyQ293K1hVSHRmdWhVTTht?=
 =?utf-8?B?NUVaTDZXSmh0elZDQ1o0RFFEWnRLQlU3emdINm5yYkkzbHFPOG1iYzZmbEF2?=
 =?utf-8?B?UnN2a0J3ZDJHU3dGQWdJeE1rMHZlSDkwdFZUZXN1dWNhWW1hSlExOE1XMW15?=
 =?utf-8?B?bEdkOHUwZmVsTGV2UkZBOTZ6S0ZaWXhBUXpSck9NTEsxbFBpb2haanlkdXJr?=
 =?utf-8?B?bHFzczNYUjNTV3lacEh4cjY1UXoyRlVQajVvUG5rV1hPMUswUWp4YndnYWwy?=
 =?utf-8?B?SE1OR1ltZks5NWZTRFhtTzF2TEZLOExHR2p4MWk1ZHl3NFhoMmtMUmxKUUZo?=
 =?utf-8?B?bXFXd25lYXkrQzRCOGpjT3ZKcE1QbzZNcm85UlY2MU0vN0M1WUxmNS9ZaEpZ?=
 =?utf-8?B?aE5OUkZiWldGaVlXMTRnOTRwcWFVSTltaFIwMFpWU0NBQ01DOStGOGszNmtW?=
 =?utf-8?B?WkZRcGFrcitGYy9rK3RHTjFqL3E1V3lDVEt1TUJCVDZzWk9BVTQzWE4vRjZp?=
 =?utf-8?B?MWRtNW9WRy9CbllKLys5Y0s1VFdvd1BBckJhU0FZNkd1RDd1Y2FoQmFXTGMw?=
 =?utf-8?B?ajVPRjFYMy9Bd2Q5NWxNSVBJcE5GMmowTkJPaVdxaHpaRVQ3MEJZYkJhbkh5?=
 =?utf-8?B?enRwa0w0TXhWWG5qMFVZblBCbkwxNHVYdlR2S05ycVBUWFFUREJuRU5SS2Vh?=
 =?utf-8?B?QWtFa0lsd1gxYlNGdW1rWWlDbS9MVnRjYmxlUzNLdThDdHJPTk1KRWtwMkZW?=
 =?utf-8?B?TmJ0YUJxVURvYTNiM2NxNVNibEduSE9rdnhWY2U3ZVpPNXYxcHVDS2pUaFcy?=
 =?utf-8?B?ak11Vm9RTGE3YVkrUmdWaThIaGZZZVFlN3dzWFl1SmlGSFF1VGhQbWFtenl5?=
 =?utf-8?B?L2hFTERRSXJKcFh1NDcwRys5VkdkdzN0eGRtMnptTkdJdCtvNzk3K3kvVC9Q?=
 =?utf-8?B?WFRZVG1ta1BTeStBNGFTRjJhVEF3endCY1V3dVgzMTlUWlg3RjhXVmYwcWo4?=
 =?utf-8?B?QkJ1MjNXdkQyYmVxQnVLZDR0aGJBQjlDOVdQYlhaUEVtK2F5a1A3Y0JBZkpl?=
 =?utf-8?B?b0doV1l2cDJLT0x1UVR0RFMzSU5rV3NwWTFOZlROb1pNckNxbEFCRmRKK2Ns?=
 =?utf-8?B?REExTHFoYi9CREJ3dzkzTXFzc3RiRG5VNEppOXZDQUVJT3cra081UHJoMXVK?=
 =?utf-8?B?VVFrTlJyaWxJK0lseDc5Ykplb0lXWE0rR2RuR21MOXE0V3lwUmcxUjIvY2FY?=
 =?utf-8?B?QnVBSEtkb2xKY1ZuTjB6d2prOG9uNjZpcGpmalNQUWdLVnc3a2NHZVZOKzJS?=
 =?utf-8?B?NEQzTWYrcjc4UURyOGc0S1NqcXVqaW5oV3FjWXNLNGZlQXFUdk5SQitMT2tn?=
 =?utf-8?B?eHpRL2xFTDBwSFFDNE4vbnNaUFpETC9MbVdCTHAvTWlhOXpCTmhQczBvNEpT?=
 =?utf-8?B?TmplR3dTekhtTGFNYjYwYTNmODBpd2g5ejRhVU44Y214N2NNYUR6SkVVZUwr?=
 =?utf-8?B?UjY2MVU5WGJkM3dsOGN0bVVWdDdNbDZNZkFTaGFoblVLZmt0MCtlOEVUckZS?=
 =?utf-8?B?UHRmSjVOMGhKTmw4Y0QyZVUyY2ZEdXA1UWZJSmVSVGJlWFRjQkpUZld6RGk4?=
 =?utf-8?B?Z3JEOTZSeVlmdVZ1Mm5RYTNmd0xUYWh0ei8xbVg2MTVicGtCYWxtcXAreE5z?=
 =?utf-8?B?MG5neWdDTFdKM2s0SS9tcHIyL0Rla1VWeHoxWmJ1MjBjQU15OEl4WGFRZmlx?=
 =?utf-8?B?aTNHZ1JWbUtBMFJLMG8xemVYVWxkbmd0R0NZay9tcnNSZGppaUw5b0lmeUpF?=
 =?utf-8?B?VzhoaGtZKzd0SEd6OHBoK3Y4TTlGNW5aTm1aYkJkeFVFVFU3TE8zZmxGdFJK?=
 =?utf-8?B?WHB5cE12ekN3V2pkaGdGMDFyZ3NjQmdneit0T3M2Mmh2VDM5dkFVeExJeS9w?=
 =?utf-8?B?dTR0ZjBlSWc2eUJIUjVYSTAxME8xUmphNmt0S3Eyc0xiOVV1YjRlc3l0OVRl?=
 =?utf-8?B?QUZkQzQ0cnN6dnpsSEFEL3IvMURCMlV1RHpUZSt1ZDhrQ3ZUb1JyMys3UDFZ?=
 =?utf-8?B?NUV1bmNxVEd4ZzlHMjJZdXlGc3NDK0RQaWx3RDlESHdNUjkvOU5Vbk1tWk4y?=
 =?utf-8?Q?1v41xThGajOyo3+7fVQ+IPwe1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EABB8E6D0CB4C54EB1EEA809F39C8EB2@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1381d8-168b-4456-7462-08da85c88121
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2022 12:02:23.2284
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7TELAbpSgEXUr/9hUjewJKHlb1MKO0eIKOY/b1NCCnY/+1ifjrIc5kPc8ZQLOXune1/pXaazaEhOrQl48gGaFynuWNvQXLeX6sE1Mmd0ZeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5122

T24gMjMvMDgvMjAyMiAxMzowMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIzLjA4LjIwMjIg
MTI6NDgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAyMy8wOC8yMDIyIDEwOjI3LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAyMy4wOC4yMDIyIDEwOjU5LCBBbmRyZXcgQ29vcGVyIHdy
b3RlOg0KPj4+PiBPbiAyMy8wOC8yMDIyIDA3OjQyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHVpZC5jDQo+Pj4+PiBAQCAtMTE0Miw3ICsxMTQyLDcgQEAg
dm9pZCBndWVzdF9jcHVpZChjb25zdCBzdHJ1Y3QgdmNwdSAqdiwgdQ0KPj4+Pj4gICAgICAgICAg
c3dpdGNoICggc3VibGVhZiApDQo+Pj4+PiAgICAgICAgICB7DQo+Pj4+PiAgICAgICAgICBjYXNl
IDE6DQo+Pj4+PiAtICAgICAgICAgICAgaWYgKCBwLT54c3RhdGUueHNhdmVzICkNCj4+Pj4+ICsg
ICAgICAgICAgICBpZiAoIHAtPnhzdGF0ZS54c2F2ZWMgfHwgcC0+eHN0YXRlLnhzYXZlcyApDQo+
Pj4+IElmIHdlJ3JlIGRvaW5nIHRoaXMsIHRoZW4gaXQgd2FudHMgdG8gYmUgeHNhdmVjIG9ubHks
IHdpdGggdGhlIGNvbW1lbnQNCj4+Pj4gYmVpbmcgZXh0ZW5kZWQgdG8gZXhwbGFpbiB3aHkuDQo+
Pj4gV2h5IHdvdWxkIHRoYXQgYmU/IEJvdGggaW5zbnMgdXNlIGNvbXBhY3RlZCBmb3JtYXQsIGFu
ZCBuZWl0aGVyIGlzDQo+Pj4gZGVwZW5kZW50IHVwb24gdGhlIG90aGVyIGluIHRlcm1zIG9mIGJl
aW5nIHN1cHBvcnRlZC4gSU9XIFhTQVZFUyBhbG9uZQ0KPj4+IGFuZCBYU0FWRUMgYWxvbmUgZW5h
YmxlZCBmb3IgYSBkb21haW4gc2hvdWxkIHN0aWxsIGxlYWQgdGhyb3VnaCB0aGlzDQo+Pj4gcGF0
aC4NCj4+IEhtbS7CoCBCZWNhdXNlIG15IGZpeGVzIHRvIGNvbXBhY3Rpb24gaGFuZGxpbmcgaGF2
ZW4ndCBiZWVuIGNvbW1pdHRlZA0KPj4geWV0LCBhbmQgaW4gcGFydGljdWxhciBvbmUgdGhlIG9u
ZSB3aGljaCBtYWtlcyBYU0FWRVMgc3RyaWN0bHkgZGVwZW5kIG9uDQo+PiBYU0FWRUMuDQo+Pg0K
Pj4gSW4gd2hpY2ggY2FzZSB0aGlzIGh1bmsgaXMgY29ycmVjdCBmb3IgWGVuIGFzIGl0IGN1cnJl
bnRseSBpcywgYW5kIHdpbGwNCj4+IGJlIG5lZWQgdG8gYmUgYWRqdXN0ZWQgd2hlbiBJIHJlYmFz
ZSB0aGUgY29tcGFjdGlvbiBzZXJpZXMuDQo+IE1heSBJIHRyYW5zbGF0ZSB0aGlzIHRvIGFuIEFj
ayB0aGVuPyBJaXJjIHRoZXJlIHdlcmUgbm8gb3RoZXIgY2hhbmdlDQo+IHJlcXVlc3RzLg0KDQpJ
IHdhcyBob3BpbmcgdGhhdCBNYXJlayB3b3VsZCBoYXZlIHRpbWUgdG8gdGVzdCBpdCB0b28sIHNl
ZWluZyBhcyBoZQ0KcmVwb3J0ZWQgdGhlIGJ1ZyBmaXJzdC7CoCBCdXQgc2VlaW5nIGFzIGhlJ3Mg
YnVzeS4uLg0KDQpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4gKHdpdGggdGhlIHR5cG8gaW4NCnRoZSBjb21taXQgbWVzc2FnZSBmaXhlZC4pDQoNCn5B
bmRyZXcNCg==

