Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEC25FF37F
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 20:17:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.423064.669473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojPEY-0000Mu-Ia; Fri, 14 Oct 2022 18:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 423064.669473; Fri, 14 Oct 2022 18:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojPEY-0000KG-ES; Fri, 14 Oct 2022 18:16:34 +0000
Received: by outflank-mailman (input) for mailman id 423064;
 Fri, 14 Oct 2022 18:16:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JttC=2P=citrix.com=prvs=279f68966=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ojPEX-0000KA-QS
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 18:16:33 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 538b1fe8-4bec-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 20:16:32 +0200 (CEST)
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 14:16:29 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW5PR03MB6880.namprd03.prod.outlook.com (2603:10b6:303:1ca::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 18:16:27 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5723.026; Fri, 14 Oct 2022
 18:16:27 +0000
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
X-Inumbo-ID: 538b1fe8-4bec-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665771391;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=uIONNLrXBpAeoEaP+No6PhZbzwu4shbsAq2JsBllwwU=;
  b=EasAoRZasWBKwdoaRRMTmxZ4JhGzvN2JQyfikS5ie1qM97s73kqHy/sV
   /eB9XYBqN080B8yodkfLGV3ScN0MNVVOQq+m4MekvIihbCem0qm2DHxoV
   w8KqCwDoW92UJEdxfxUuFS/xTbN8zLYeUqTdojsQFoUWEb92+WzDjF7iR
   w=;
X-IronPort-RemoteIP: 104.47.66.48
X-IronPort-MID: 83187959
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:h+3oSqxTasGdesSa/Yd6t+fpxyrEfRIJ4+MujC+fZmUNrF6WrkVSy
 jdMD2GOafnZMzb8e9B0Odm+pE4P7ZHQy4cwGQU4/yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHPykYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtspvlDs15K6o4WtB4gRiDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwwvp8DGZI0
 fsiOiEETwmRpt6fmoOkRbw57igjBJGD0II3nFhFlGucKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTL++xrswA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE1rSWzXyqBdN6+LuQ59JW3nORlk8qFxwvZVHlvaiet1zgYocKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZjxLZcEitcQ2bSc3z
 VLPlNTsbRRtrbmURHS15rqS6zSoNkA9NnQebCUJSQ8E5djLo4wpiB/LCNF5H8adkdndCTz2h
 TeQo0AWhboJitUQ/76m5l2BiDWpzqUlVSYw7wTTG2e6tAVwYdf/Y5TysQSLq/FdMIyeU1+N+
 mAenNST5/wPCpfLkzGRROIKH/ei4PPt3CDgvGOD1qIJr1yFk0NPt6gKiN2iDC+F6vo5RAI=
IronPort-HdrOrdr: A9a23:RP9Gi6NybBfppcBcT2L155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKQyXcH2/hqAV7EZnirhILIFvAp0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrzVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKUiSw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8yvT9aw+cyTpAVr4RHoFqjwpF5N1HL2xa1+
 Ukli1QffibLUmhOF1d7yGdgjUImwxelkMKgWXo/UcL5/aJCg7SQvAx+76wOHHimjUdlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4KcuZlFkIPwjgYVq3Poi1VIQFI1FEDPx6YghHu
 UrBMbA5OxOeVffa3zCpGFgzNGlQ3x2R369MwM/k93Q1yITkGFyzkMeysBalnAc9IglQ50B4+
 jfKKxnmLxHU8dTZ6NgA+UKR9exFwX2MFrxGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhN15c2kI
 SpaiItiYfzQTOaNSSj5uw5zvmWehTNYd3E8LAv27Fp/rvhWbHsLSqPDFgzjsrImYRsPvHm
X-IronPort-AV: E=Sophos;i="5.95,185,1661832000"; 
   d="scan'208";a="83187959"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SlUKrPbsk+YijX+B+1ohxyctAmTR1TNlqc2YmWKw06JOeQnT7z6NNBYci4DPFOBQbE9cPS+G+jjliLBCNjCRR36SdCUmvie92qBULQVinaC/wdIIfN05czqbtfAHgm4aB2j1h8C49+uB/INFEh2tgH8qviFvL6gGSmsjGNggSsfbAGZgn8Yaii9/jOd3I+fherbN9JdJqp7+nh3J2X6GXybQU98AUyDaLFqRN9ijCbTtsIE1I3TKgodA4MAWkbDsqDaEEZ+EapRKR33IYQ3w4RMmKgOPqRykLz1DUPk2cxGOof5htxel+IRtdlkjaS6tKZRvqU0PoKAj0m6CZk5plw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIONNLrXBpAeoEaP+No6PhZbzwu4shbsAq2JsBllwwU=;
 b=Uo4CQLyV/VUE+qEdKkuVi05ZDOq45B1NT7EcHJgFymZAKn+kh62Oc0+a5gEoYcofblA0qHWNTjpBsVeDaA3Ea/wrELltpdTakgHR4XPURebmBU9Wn7rE3qYZW13k7wEVmdM2Y+cQbvNmUwaHTimE2pvexLJlcV6DjEPiHH4I0hqH/HDWpPmrFU3QUZ9oUFUPFqmpHq6i1b9xFvqT2B4AGQZ2ILhxzLz7EOVMWKkkcpE3uW8jUzvb++VNMJjpgZb/J7WHdiyZ9kI8xBa3jQ/0pTZZEsCLD1gmr7nGrm+09aCHMr1Z5QzKat7v2Q4Zl9hVUlkjPUNZSR7bq4QlyYhaIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIONNLrXBpAeoEaP+No6PhZbzwu4shbsAq2JsBllwwU=;
 b=Fdsg97PStZBoSIcTwI64COOklV5enSAx5vSMpbv+F8UH98f65QRPCxoP1MJn87EYjdwTHzTQNM4U+f2yF/1gBq10WnHuwVhcPdIWmp9wWX0VoUQ+gHYhOjx5D6TuvAN5RzAnp93W6b5lW3RsO2q0TszG5vD9/tzP2x26PlOZLm4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH for-4.17 v5 10/17] libs: Fix auto-generation of
 version-script for unstable libs
Thread-Topic: [XEN PATCH for-4.17 v5 10/17] libs: Fix auto-generation of
 version-script for unstable libs
Thread-Index: AQHY3wSN2AAamVElMkOHboggsVYl7a4ONB2A
Date: Fri, 14 Oct 2022 18:16:27 +0000
Message-ID: <05589025-a3cd-8a8c-491e-089fd6d89c6c@citrix.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
 <20221013130513.52440-11-anthony.perard@citrix.com>
In-Reply-To: <20221013130513.52440-11-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MW5PR03MB6880:EE_
x-ms-office365-filtering-correlation-id: 8c484567-6a76-4ec2-5df5-08daae1035e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 r52INNKYPwduIzdtpaTaz5JXYlmGxEkpt4JuwzObHqyW4HYDP6nrTCguTMQlsDnAzn/C7v3y/M/pVmV4IzYD9x3SVmohrqyikJlxwo3vSt2Hxn9qbmxho/2NsUk1tYdtqbULD1ypobL4DIR6LTax8FXbDjm/Ifa+k1wuJDe4H1bKSlLuo9t9BtqHz4aGYRFrxi62D8AUsYGgvOEFLS9d+epDk9WBD7MMXo+R3t/q5i9g3/E63Hs+CT+KUn/TyXQMlvqy6B5Dtlo6FMo+DTL58y6BNUomokixCrQ64NKIfQ81ER3T67DmPuiMskSbfSLk5O/tRcs0J2ILDiOSwF8BrGKRF2cXmCpKm/+2r7JbUxZDiF0201RrCDrbKy3tezIL4EDi2ag0jlOPib2ZkDOe1t+pneWJZ1TpqIJknz/SKN084h8+BqiFQ8OxOv/tm5xLIM5DR7rFiLNmpqlJ/XgR57pEqaj/fyPuw/cq0yxr50dkRpvbj03XdLqInSxmwJcpZIeb+7ZVLzLGtApd7Y3CjebeIjjpWuOlZIDLPLQ7jkxWfvJqz8TUyQYfYTb8sBNgMAgV6+064ef/dp0JxCRMgimYZro8nuGcjPf6DIWmWVbBV9r3aYb8RtonsKDTIXY6vRiG4yh6zWpWesrBWkRrdUbIJsGUChWIwdBsZcOJ8K9Vo+6Qt2pz1f4WyjbXBQiOsnnzWBplrLEHALMzZjG1HrKswNncnP8JnTYcvev7O1RnYFiINfanQrXZ0U1t0fv+dlpUs6VV7HmhhJbPUvZ9SFvigPggsNUqUvh1DM0QZqbfeLky125ZS8PgDG1eaaQr+XDxEAw8qb7ZIuFCzl+sbg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199015)(316002)(110136005)(478600001)(66899015)(54906003)(71200400001)(6486002)(76116006)(8676002)(64756008)(31686004)(91956017)(66946007)(66446008)(66556008)(4326008)(66476007)(83380400001)(8936002)(26005)(41300700001)(186003)(5660300002)(6506007)(2906002)(2616005)(38100700002)(6512007)(36756003)(38070700005)(82960400001)(31696002)(53546011)(122000001)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b3BqbjMvWHBUUG1BLzIyMnZDc2VMamd4QkhGMFZyYkkyU21EMkxsQXAvUkVZ?=
 =?utf-8?B?b3dmVnJZaGk1aGlwU1h2OTljZGloYjN0T2h2QmUvR1BMNmJWQ0pPcTZYMnNj?=
 =?utf-8?B?aVFZVUdwMmZZSlliMUtPOVhaZWFoZkFDZFFkL3JUdmNGcEh4WmhlSXg4bzgx?=
 =?utf-8?B?MW1CTWtJTWp5Z3plTE80UlZtRmpsQ0tZNHFnbmNmQWZ3L1N0VHljdUNycG5r?=
 =?utf-8?B?WVU3Ykh6Wi9nb1lnLzUrM213eUNpRVJNTlZFSVlvZjZheEpjSEtzUWQyZzNu?=
 =?utf-8?B?WDhmUXczbGNNRHpENW94OHVZUzRSR3lsY2IxNUFmUVFPalRROEpFWk9IVUtO?=
 =?utf-8?B?eWR6Z0NLMitjUDZDRGd5Wk1Yd0xnWitSOFhkSFJrdUhieWtxWS9MdkFVWWVR?=
 =?utf-8?B?SmtBeVhScnhSMVg3dTdJL0VaYzFkMTl4V21Nc3VhWlo1K05hTllwNml2ak1u?=
 =?utf-8?B?TWdOZW9aWnd2T1QyS0xOOWhUZmNTWEtzdTNxOWx2TnpKK1phRWlnZElmUkEr?=
 =?utf-8?B?QVROU0RBUVRqcThsV2RuZU9MeWVUSHNpQkZEMGFpZVVOSnpJVmE4Ujh5S2s3?=
 =?utf-8?B?UC9DUnhSclBWRGVWb2NjODBzWDRLUXp2RVJLK3NaNXR4WWxLTE5MMWhNVUVz?=
 =?utf-8?B?cktxWlp3QjVHTGR0SWxMaWF5NEl0bFB4M0R2Q2JtTTMyWGZHNCtGNzJnZnZZ?=
 =?utf-8?B?Z1duaEZENEJaSEgxU3NvaXUzUEdCSW9xSFJvREFMcmRRVWNwOTJ2eFUvY2Jr?=
 =?utf-8?B?dTJLdWgzLzMwYTBhSlNVc2NtVSs1bW9Md05JNEhZVlhpSHlEM0U3V2U5WmdT?=
 =?utf-8?B?Y0dvOUdRb2Vob3JXa3F1S0JibkE5RmtpUTkrdW5Ta1k5bmQzNEpGZmxMOGQz?=
 =?utf-8?B?clVIU2g5VmswMmlPNVpneU55alJWRVR3KzdVNmNvcDNiOTVMeXhwMVlGdXZw?=
 =?utf-8?B?b1lVSk1wVlhiR2xVSFU4RmxRNkdwMnczdGJMeVFTNW11eVlkbGZ6RHp2MGgx?=
 =?utf-8?B?SGlEVHBTYlkyTHVwL240eW5kMUpVallFVmxHbWxOcXFtdmdQZ1dYanVodVFN?=
 =?utf-8?B?VGIxaGJSOFZDWERaWERTc0NBL3U4c2piZjRaSVdyT1ArVGQ2OGFFekRqZlFi?=
 =?utf-8?B?bDgxNHZvUVo3Tzk2VU5QaVRpcHc4dHJQUnRBV2hIalgxc202L2xFVjBHcEhC?=
 =?utf-8?B?eXh2OUVEZGlvczMzM2xqandjWWR0dGV4dXpYOUNvZHcvbzZBMXAxMEhvMnRR?=
 =?utf-8?B?ZTgzVEdGRUlJU2txR042SjZ0TllLTmthNC9TZWRWMUx0bEk1dVRYZDYrZ0Nz?=
 =?utf-8?B?L3doNTVMNCs1OVRKUHdpZW42RFpraDNpaEhuejhBWjhLTVFvdmJHTUZnc0Fj?=
 =?utf-8?B?d2xQZDd3cHIyK3dUUnVSSTVSUDBwVmZ0eXJiN2VoU3ZqWmZCUHcwRkUyQjdV?=
 =?utf-8?B?YWVFV1NBT05QQmcwZnBtSTk0V2pLWDRpaEZCQWN3c2QxeXQ3bFJRL3Q5SzFX?=
 =?utf-8?B?VXNkNXJVanJwZW5waERka0hXUCs4OWhOY1NGNXIzVjZsRHBZb3RpZm5MdXA0?=
 =?utf-8?B?K2JaMmVzd0VicjB2ZS81MEJ5N3RoZ2l2RHhyc3dHaE5kSkh0cGdramdPS1Nz?=
 =?utf-8?B?SDFxNEkyR1o3SVlpRE4rcHVHZUNtdDBYeSt0T3hsaFVOL0F3cERzaU1qWDZM?=
 =?utf-8?B?ck9LSm9Ib2NnMUxhc2IwTjZxRVJ2RGdiUzVrTWh4cnlrQjJDNHVnVG9Mak9Q?=
 =?utf-8?B?dCs0b1EwKzlMajVjY21zcXl5TVpwSS9HbkYxc05KQW9MOTJYUHBnSGhlRndW?=
 =?utf-8?B?NXBWSVJ3STAvb0FCT2s2aktFWjBZZStMYWZCOGNRVzZyWWlpaERlZTV2ay9O?=
 =?utf-8?B?VXM1RS9Icmk0UlBkU2M3WkoxcjB5TkpqYmJOUXdwWXJGMXRERVlLYWN6NEpC?=
 =?utf-8?B?VnVSeFhQTHl5Q2FWWkIxc2ZySXR0NkRJVll4NjNQa1lSakdOS1NIQ3RmaTRO?=
 =?utf-8?B?NE52aW03T2JlalpDQVFlNFY5MFhPNTM1eHphVkhvUmNiVnJjUE85TnRNTWwr?=
 =?utf-8?B?OE5keS9qUDd3MlJQeU8vTDJkY05qUmcyU1pkS3JFL3hIR3YxMGFja2hrSzFl?=
 =?utf-8?Q?Gg9HKTHIqsFMgwDuVMzfWVqi+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5036850BC80DC47A3FC5F5F6B238A90@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c484567-6a76-4ec2-5df5-08daae1035e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2022 18:16:27.2655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ptd+m2Oa9I4ztZOCWifHje5rdLf8TOk/EuJ2OzOxALWSwb9ncEWLkbb9GIwFuWcU41BlL5XeINg3ae+VuluQpoPhu1gaA8paQV3XvQSQ37w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6880

T24gMTMvMTAvMjAyMiAxNDowNSwgQW50aG9ueSBQZXJhcmQgd3JvdGU6DQo+IFdoZW4gdGhlcmUg
aXNuJ3QgYSB2ZXJzaW9uLXNjcmlwdCBmb3IgYSBzaGFyZWQgbGlicmFyeSAobGlrZSBmb3INCj4g
dW5zdGFibGUgbGlicyksIHdlIGNyZWF0ZSBvbmUgYmFzZWQgb24gdGhlIGN1cnJlbnQgWGVuIHZl
cnNpb24uIEJ1dA0KPiB0aGF0IHZlcnNpb24tc2NyaXB0IGJlY2FtZSBvdXQtb2YtZGF0ZSBhcyBz
b29uIGFzIFhlbidzIHZlcnNpb24NCj4gY2hhbmdlcyBhbmQgbWFrZSBhcyBubyB3YXkgdG8gcmVn
ZW5lcmF0ZSB0aGUgdmVyc2lvbi1zY3JpcHQgb24NCj4gcmVidWlsZC4NCj4NCj4gSW4gb3JkZXIg
dG8gYWxsb3cgcmVnZW5lcmF0aW5nIHRoZSBzY3JpcHQsIHdlJ2xsIGhhdmUgYSBkaWZmZXJlbnQN
Cj4gZmlsZW5hbWUuIEluIG9yZGVyIHRvIGNoZWNrIGlmIHRoZSBjb250ZW50IGlzIHVwLXRvLWRh
dGUsIHdlJ2xsIGFsd2F5cw0KPiBnZW5lcmF0ZWQgaXQgYW5kIGNvbXBhcmUuDQo+DQo+IEJ1dCB3
ZSBhbHNvIG5lZWQgdG8ga25vdyBpZiB0aGVyZSdzIGFscmVhZHkgYW4gZXhpc3RpbmcgdmVyc2lv
biBzY3JpcHQNCj4gb3IgaWYgd2UgbmVlZCB0byBnZW5lcmF0ZSBvbmUsIGZvciB0aGF0IHdlIGlu
dHJvZHVjZSAkKHZlcnNpb24tc2NyaXB0KQ0KPiB0byBiZSB1c2VkIHRvIHBvaW50IHRvIHRoZSBw
YXRoIG9mIHRoZSBleGlzdGluZyBzY3JpcHQuIChHdWVzc2luZyBpZiBhDQo+IHZlcnNpb24gc2Ny
aXB0IGV4aXN0IGZvciBhIHN0YWJsZSBsaWJyYXJ5IHdpdGggZm9yIGV4YW1wbGUgJCh3aWxkY2Fy
ZCkNCj4gd29uJ3Qgd29yayBhcyBhIGZpbGUgd2lsbCBleGlzdCB3aGVuIGJ1aWxkaW5nIHRoZSBs
aWJyYXJ5IHdpdGhvdXQgdGhpcw0KPiBwYXRjaC4pDQo+DQo+IFdlIGRvbid0IG5lZWQgdGhlIHZl
cnNpb24tc2NyaXB0IHVubGVzcyB3ZSBhcmUgbWFraW5nIHRoZSBzaGFyZWQNCj4gbGlicmFyeSBz
byBpdCBpcyByZW1vdmVkIGZyb20gdGhlICJhbGwiIHRhcmdldC4NCj4NCj4gU2lnbmVkLW9mZi1i
eTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+DQo+IC0tLQ0KPg0K
PiBBbHRlcm5hdGl2ZWx5LCB3ZSBjb3VsZCByZW1vdmUgdGhlIG5lZWQgZm9yIHRvIGdlbmVyYXRl
IGENCj4gdmVyc2lvbi1zY3JpcHQsIGJ1dCB0aGF0IHdvdWxkIG1lYW4gdGhlIGV4cG9ydGVkIHN5
bWJvbHMgd29uJ3QgaGF2ZSBhDQo+IHZlcnNpb24gYW55bW9yZSAobGlrZSBiZWZvcmUsIGEgZmV3
IHZlcnNpb25zIG9mIFhlbiBhZ28pLiBPciwgd2UgY291bGQNCj4gdXNlIC0tZGVmYXVsdC1zeW12
ZXIsIGJ1dCB0aGUgc3ltYm9sZWQgd291bGQgYmUgdmVyc2lvbm5lZCB3aXRoIHRoZQ0KPiBzb25h
bWUgKGUuZy4gImxpYnhlbmN0cmwuc28uNC4xNi4wIikgaW5zdGVhZCBvZiAiVkVSU180LjE2LjAi
Lg0KDQpJdCB0dXJucyBvdXQgdGhhdCB0aGUgdXNlIG9mIFZFUlNfKiBldmVyeXdoZXJlIGlzIGJ1
Z2d5LsKgIFdlIHNob3VsZCBoYXZlDQpoYWQgJ1hFTiRGT08nIGluIHRoZSBzb25hbWUgZm9yIGxp
YnJhcmllcy7CoCBCdXQgaXQncyB0b28gbGF0ZSBmb3IgdGhlDQpzdGFibGUgb25lcy4NCg0KQXMg
ZmFyIGFzIHRoZSB1bnN0YWJsZSBsaWJyYXJpZXMgZ28sIGl0IHJlYWxseSBkb2Vzbid0IG1hdHRl
ci7CoCBUaGUgb25seQ0KdGhpbmcgd2UgY2FyZSBhYm91dCAocmlnaHRseSBvciB3cm9uZ2x5KSBp
cyB0aGF0IHlvdSBjYW4ndCBtaXN0YWtlIHRoZQ0KbGlicmFyaWVzIGZyb20gZGlmZmVyZW50IHZl
cnNpb25zIG9mIFhlbi4NCg0KLS1kZWZhdWx0LXN5bXZlciBzb3VuZHMgbGlrZSBpdCB3b3VsZCBi
ZSBpZGVhbCwgYW5kIGF2b2lkIHdyaXRpbmcgb3V0DQp0ZW1wb3JhcnkgdmVyc2lvbiBzY3JpcHRz
Lg0KDQp+QW5kcmV3DQo=

