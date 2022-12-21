Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 293646536B8
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 19:59:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468044.727112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p84Im-0002rL-Qa; Wed, 21 Dec 2022 18:58:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468044.727112; Wed, 21 Dec 2022 18:58:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p84Im-0002pN-Nq; Wed, 21 Dec 2022 18:58:52 +0000
Received: by outflank-mailman (input) for mailman id 468044;
 Wed, 21 Dec 2022 18:58:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KbXi=4T=citrix.com=prvs=34759bb5a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p84Il-0002pH-5h
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 18:58:51 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 803b1ce4-8161-11ed-8fd4-01056ac49cbb;
 Wed, 21 Dec 2022 19:58:49 +0100 (CET)
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:58:47 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5294.namprd03.prod.outlook.com (2603:10b6:208:1e2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 18:58:45 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 18:58:44 +0000
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
X-Inumbo-ID: 803b1ce4-8161-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671649129;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=71lhyFlD3ex4wQWibtgmHp9S/eSNn4Q0TK3CZW69TGI=;
  b=DpZZZTLjFQ69KZmnstsu5CkHZ+iEHGncLL8IMZ6MqlvEg+KJpAtENXfq
   1+M83MrhywSETDNeAttgsLCp74Crv3wlFf7o2vVTi7QIXfb/qLBT78qsn
   R/3/rXnpysvmKIc01OBMmlBcNHvQfcLFDLneaxtdiIZYS3QGP+lGrbYYs
   g=;
X-IronPort-RemoteIP: 104.47.55.101
X-IronPort-MID: 89523050
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HttJa66cqtBiSW75cW22qgxRtAnGchMFZxGqfqrLsTDasY5as4F+v
 mJOUGrSbqmDZ2emf9h/YY+2/RxTsJ7cxt82TAtq+ykxHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKoR5QeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m+
 +w9Mys9KT65rsmpye6fVflmiP4fM5y+VG8fkikIITDxK98DGMiGZpqQoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooiOGF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNJDSefjrqMy6LGV7itOCTc5W2Wfm/WWqk6eZ4gDJ
 moIoxN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq16bO8vT60fy8PIgcqeS4BZRsI5Z/kuo5bs/7UZtNqEarwi8KvHzj1m
 miOtHJn3+xVitMX3aKm+1yBmyirupXCUg8y4EPQQ36h6QR6IoWiYuRE9GTm0BqJF67BJnHpg
 ZTOs5H2ADwmZX1VqBGwfQ==
IronPort-HdrOrdr: A9a23:GNWBO6PKd0Oj+sBcT5j255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKRyXcH2/hqAV7EZniohILIFvAu0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrjVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKUySw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8yfT9aw+cyDpAVr4RH4FqjwpF591HL2xa1u
 Ukli1QevibLUmhJ11d7yGdgzUImwxelkMKgWXo/UcL5/aJBQ7SQvAx+76wOHHimjUdlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4KYuZtNkIPkjgZJq3PoiFXluYd49NTO/7JpiHP
 hlDcna6voTeVSGb2rBtm0qxNC3RHw8EhqPX0BH46WuonJrtWE8y1FdyN0Un38G+p54Q55Y5/
 7cOqAtkL1VVMcZYa90Ge9ES8qqDW7GRw7KLQupUB/aPbBCP2iIp4/84b0z6u3vcJsUzIEqkJ
 CES19cvX5aQTOYNSRP5uw+zvngehTPYd228LAu23FQgMyNeJP7dSueVVspj8ys5/0CH8yzYY
 fHBK5r
X-IronPort-AV: E=Sophos;i="5.96,263,1665460800"; 
   d="scan'208";a="89523050"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFwN0zjY7qrZa2xP6N60Oapc9qNQ2EOqWRZkoFOE/jcmoKGQIqFv09DdP0dyEnCE+ppG79L9vcWh5XNxsp2zkeLBakNAamAOUUWswgexGankb2iJbDg1yx6wiqrKf2IAFKucer8SNVsuIGbTsFqtFh9i0wKElQ8/xmZ2RENocRFsdhjX9sUjr8+ea6zJdbrWfmEa4NfNdVAVSW7JZFsnLxAaRZCHX9XSOEOctmHxblMJZqA+2YpF4QbusOXeZBwPeaiJ44s97TU/u4T+/zUKTWP0LzENMbA308K2pZU6UNhdCxFbMm2lg+bkgdC+RxAfno5KHvkSFRt/QQ6X91Z0qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71lhyFlD3ex4wQWibtgmHp9S/eSNn4Q0TK3CZW69TGI=;
 b=CgQsvs3aPI0/4GRRZJiNk8rWLOnOaanQ9wP/zM9yT83Pr1qxJYdYXpemMpR0f9QRubpC2OO5IopptezlGLoEna1OKmuJbWmfg0PhrLsk7+6gyTaDIQeRSgC77HRKBU5HflYqdkZ7ijCUez5hb57QWjyGgUtRy68tSeaGnsbcrwgyyNCTvqQq8ZSSdvmY2bDQlaff8QFKizYshztQLtO3N1bkQmnkhMiNrjTdY8yEiA3RdQnwJg5ksBh+NZIFd07bOKtXjaAr0v4D1ahBiUH92p0TrzSe7v8CanrlEi6EPpiKCiCEtALOJ/kwacctNdMHR+qg0Ty0C5iGIeFElUEIdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71lhyFlD3ex4wQWibtgmHp9S/eSNn4Q0TK3CZW69TGI=;
 b=Q9o6ErGIjh8eTjLgG+fpMOOj459/edJlo9l6A+2+1B8CoYhpjMOyjhqkYKb1fuzWZx94jZqS6M9bGVYtJUGv+D7fdPRTVCz4bf5rW//j5OdjIR3x1vgce18ileHoYL9Qeh4KORFFo/9V1y3b6bGqOBkstQr9YyQAX7ZBWLTE6fk=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 6/8] x86/shadow: adjust and move sh_type_to_size[]
Thread-Topic: [PATCH 6/8] x86/shadow: adjust and move sh_type_to_size[]
Thread-Index: AQHZFT/+4m5db1YFGEKNP8aYHdqkgK54sf8A
Date: Wed, 21 Dec 2022 18:58:44 +0000
Message-ID: <04350e03-25f3-df4c-8b1a-486d531eeda7@citrix.com>
References: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
 <e142f7f8-1184-a65e-0f50-0b01ec7fad55@suse.com>
In-Reply-To: <e142f7f8-1184-a65e-0f50-0b01ec7fad55@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MN2PR03MB5294:EE_
x-ms-office365-filtering-correlation-id: 1686c34e-a736-4c9b-002a-08dae3856264
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 f2n6RrZXQMXB7WXvMu6CYiQdctQuDfzSMugbLxwWc5pu3ELaIttfaU1xqRFWYUx7fAsXbuNwQUR0LdjBmiXxTA2VfGhqYXvdGOMEyB4k7hcWqTwphpjz1TAcAGou4qWDAV29vekzJcl8Xt7whVZYE2r79rO3R8Q/YLzua6kzh7jbEqBa/sN/YgbZRShkhOBtM6jY1K9BsiwnIBZGVbWbsgBE1H/KznGq6eOlK7F42sNxms3GemkoA3ZaisMj17zni8iOcIDAT8VLe5vYxHXnSIjhOjQAi1juaH1+M/V/V2UTQCJO9bdhq7xj6glAbQQLqpbeqHogvZklVnd9aPXiUeMeUCWWccq47icsge2duREyDjRZDmQtKm9kMO8ZkXPK+ck0S9XotG8r/1HU4XV/r4ZXKRRgKsoCwwIC9BBzI0fki+gNUJTOX3FxQdVxYHIZVvVtU5wvMwYdXJBQWmZ1Rvq7UFJrvQkEJXH1aXSlFeYC5NImE5jLzSwgwSS+UQLTPxGzi14sKG8D34QvbBCkWDURbFpTZ1/Vx86bYlTo5V3nzaJdVq0GDE0IUdKGZUZo4EeGis+8E8nywSKcEc6NCy0eBT5a4Lf6k03hxXng8VrW5lTXIVYUlhqQZvMeZU40SbTMn6/jy1N5UhIu/qgPJU9sDxFrB6NvIs8zUmLUEBmt9MVbtZAz9zLM395FclwyRAZPpUDnjuTTmzgnFG5mzJEQ40tH1g7T383ikVQ2ubpys+BD2pKDqnVbl2ySy2EKIwGWTt4+ixvb3tXxfaAPIA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199015)(36756003)(4326008)(66946007)(76116006)(316002)(6486002)(66476007)(83380400001)(66446008)(8936002)(64756008)(5660300002)(2616005)(478600001)(66556008)(53546011)(71200400001)(6506007)(8676002)(54906003)(41300700001)(186003)(31696002)(86362001)(26005)(82960400001)(6512007)(38070700005)(110136005)(91956017)(122000001)(2906002)(31686004)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Wm5iVFNwOHBWN2RGdHVLMllJaytZdlk5Nkw5R0F5L2NaL1JucE52MmpKZ01L?=
 =?utf-8?B?NXdETHQrSTFia2MxWFFGK0tCNWxERlUvODREN01iN0YrRGdzOExYMGlieTIx?=
 =?utf-8?B?ejRZNU0vbFZSWjYwM0tPUG94MSsveDgzOHEzYXVaTThSODBIamJiYjRaN3dF?=
 =?utf-8?B?b2Z4T2JielA4Uk56MTkyL0dnbjY3OWlLOUVQaTc1V1VTRlJuU1BkN0FER2Ev?=
 =?utf-8?B?SmhRYUpCeW5TZzRYRUg3dW5qNzFsNkgxSE9NWk5mV2wybGVidTBsRXZqeVFj?=
 =?utf-8?B?cXpXcWZSTm84OHVrdDlqUWtoY0Rzd1dleFVoeFRyRmFKNmlSZjYvdkV1TEpB?=
 =?utf-8?B?bWUzeHcxbzQrdXRTUVAzL3o2QzR3dmg4RG4vTjFnRk5JZjNCNVA0L0VWUUZB?=
 =?utf-8?B?SmZBWmRBTkZOMUdRTjAwc3BVTG56dlZhZVpSR2hOdHB3T1lUTE1JaEw0V1BL?=
 =?utf-8?B?UXJ1WDl4VFFUSXZhMzRITlZqeExoNXVHaHlrUWtnRmVvSm05eUJZdDJ3SHF1?=
 =?utf-8?B?VG5Zd2JGL2l1RUJiOWRucThZb1YxR3IwNk9aQ1g3RStlUWdaTDZXVDRFUnZh?=
 =?utf-8?B?NXFhdUp0ZmprdFMyZVVQSGRiY2Z3MlpOdDFWNUdVMkVGZHRnU0h4S1ROQlNw?=
 =?utf-8?B?YTJoUVdGWElhc0Zzb3ZSbjYrVVY5R3MwTGQ2eHRXdFpLMzZWS3Zvc0VDMGF3?=
 =?utf-8?B?TjExYk1iRVZ2UnBBVG1jcUE2dTV2M0Z4eFQwK3plS2JCUm5BSWphcExlaDFx?=
 =?utf-8?B?TDBLcHRXb0dhUXdFRGxmbFdpMFdRait0U1J2UEQxS2w0aVZaaTBGaFQ0aHlv?=
 =?utf-8?B?ZkM0L2lUNTRvR0Z3OVJ0UGZibjM4WWhXWXZLc3JFWVEvRVhjdzlvUDZLbHFp?=
 =?utf-8?B?clQ2YlRkanQ1WHcwVlFhWUFuVGxGdTFjRUpaaEVuWTUyT0QyTFVsZnRUY0dv?=
 =?utf-8?B?QnE3Sm95Wms5ajF5ay81ZGxYemJpTm8wVk9VbGNGSVZTUTJWdE9zUjJLeS9T?=
 =?utf-8?B?NzVhdTBQNjU5RFdhOGpXL2ZBY3FpZmNLUDUrT2RQZXJacFJZVmppeVEvSU1s?=
 =?utf-8?B?Q0czYmdvSkg3bTB2a2hLa0dOY05RVTNLMHBCVVFtTVpNMW5DZXQ4UWN1RXUv?=
 =?utf-8?B?cjEwbGRIb2ZybldMS3FLR3B3QVRENXIveVZwdXVEd2h2Zkw2aE9VVHJBTVor?=
 =?utf-8?B?ZnlkakJLRXVGTkhFOWowNSttSjNUY0JpWWV1VTg0WWFTOW5aWWFQQk1uT0lF?=
 =?utf-8?B?TEs5RGozdkZvdzhyYlFzY1BUS0lURERzODVnM2JPMzNaTzA0UEorTGdQQitO?=
 =?utf-8?B?UnhZL05KTUNoblk1YlNCdldsME40YjM3UzV1bDhscWdyT1FjTS9TbjJzNFdR?=
 =?utf-8?B?UmdQdW56TFEyUmt0NE1seGp1VDVmbGhCU1daNmNaTk1lS2Z5QkR5R0ZlbW9O?=
 =?utf-8?B?Z052dGoyQy94NXBJSEs4YXd0RUZ3dEtPSUx3Ykkrb2ltYjZtSElYcVgrSE1Y?=
 =?utf-8?B?MTRjdGhJNmtKT0NCaCtranFXTmZYNDdDWHVCZVFCeVVRaWhnaFppTjRxd2Ns?=
 =?utf-8?B?VTU3ckg0bFZCNTRITUpxMnMwaWowUzZFQkY1eFpGR2piTTZ4eWVoeWhIamlP?=
 =?utf-8?B?MXRQcjRnUEY0M2oxZjd5cWlFUmxLc3VUejE1QkN6WDlMcE0vb290RW5kN3VI?=
 =?utf-8?B?OEYyOU93Ly90RkVCbWNhc3N5WEpTWHF3MTBLaEQ1RHFrbE90a1dPOHFyT0Fy?=
 =?utf-8?B?Z3ZYREw4V25ManFETEw5c3RwOXNiYjUxOTZMNTBtd0VZdk4wOEtocW5WeUNv?=
 =?utf-8?B?ZUd2S0ZLRmhLaGFkb1pjY1FMMXAzNk1SeDdnb25RdVBlT3Z6MU5GQ3hLTVNr?=
 =?utf-8?B?NGNnWS9TenRjSFF0NjNucnBlTElOaUQyUUdvRTlINWN5bTUwa2pLWjBicDBx?=
 =?utf-8?B?ZDhFc1Z5dERsbUdCSTVqaUFBakpzWVhjMHNXemRrTlVGaEl4WndRUDMyUXBh?=
 =?utf-8?B?d0orcEUrMmRxU3JmeWxrS0ZYWk9vaW9jclVMekNQQytHTnZjL1d2RXRHMmF6?=
 =?utf-8?B?NGFhNnA2bzNUTjVvYU1mZjJyN1NuRzROa1o2b2VLQnVueGpGeDVnbGt0TzZV?=
 =?utf-8?Q?qQjMcK4zkvcXfQs7Gr6UJD/rI?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <46CBC5963741434DBE78BE99EB4A3009@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1686c34e-a736-4c9b-002a-08dae3856264
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2022 18:58:44.6754
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UP5Up38qpw83STm5CLJlQhT0NnLEIaIiVDNXXcOC31yh/ps/YpxV7A0V13aqu8qu+M7cTvcmMWagqeKw0/7bQZ3aFPZR0Fx6MtdYYTilafQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5294

T24gMjEvMTIvMjAyMiAxOjI3IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gRHJvcCB0aGUgU0hf
dHlwZV9ub25lIGVudHJ5IC0gdGhlcmUgYXJlIG5vIGFsbG9jYXRpb24gYXR0ZW1wdHMgd2l0aA0K
PiB0aGlzIHR5cGUsIGFuZCB0aGVyZSBhbHNvIHNob3VsZG4ndCBiZSBhbnkuIEFkanVzdCB0aGUg
c2hhZG93X3NpemUoKQ0KPiBhbHRlcm5hdGl2ZSBwYXRoIHRvIG1hdGNoIHRoYXQgY2hhbmdlLiBB
bHNvIGdlbmVyYWxpemUgdHdvIHJlbGF0ZWQNCj4gYXNzZXJ0aW9ucy4NCj4NCj4gV2hpbGUgdGhl
cmUgbW92ZSB0aGUgZW50aXJlIHRhYmxlIGFuZCB0aGUgcmVzcGVjdGl2ZSBwYXJ0IG9mIHRoZSBj
b21tZW50DQo+IHRoZXJlIHRvIGh2bS5jLCByZXN1bHRpbmcgaW4gb25lIGxlc3MgI2lmZGVmLiBJ
biB0aGUgY291cnNlIG9mIHRoZQ0KPiBtb3ZlbWVudCBzd2l0Y2ggdG8gdXNpbmcgZGVzaWduYXRl
ZCBpbml0aWFsaXplcnMuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+LCBhbHRob3VnaCAuLi4NCg0KPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vc2hh
ZG93L2h2bS5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvaHZtLmMNCj4gQEAgLTMz
LDYgKzMzLDM3IEBADQo+ICANCj4gICNpbmNsdWRlICJwcml2YXRlLmgiDQo+ICANCj4gKy8qDQo+
ICsgKiBUaGlzIHRhYmxlIHNob3dzIHRoZSBhbGxvY2F0aW9uIGJlaGF2aW91ciBvZiB0aGUgZGlm
ZmVyZW50IG1vZGVzOg0KPiArICoNCj4gKyAqIFhlbiBwYWdpbmcgICAgICA2NGIgIDY0YiAgNjRi
DQo+ICsgKiBHdWVzdCBwYWdpbmcgICAgMzJiICBwYWUgIDY0Yg0KPiArICogUFYgb3IgSFZNICAg
ICAgIEhWTSAgSFZNICAgKg0KPiArICogU2hhZG93IHBhZ2luZyAgIHBhZSAgcGFlICA2NGINCj4g
KyAqDQo+ICsgKiBzbDEgc2l6ZSAgICAgICAgIDhrICAgNGsgICA0aw0KPiArICogc2wyIHNpemUg
ICAgICAgIDE2ayAgIDRrICAgNGsNCj4gKyAqIHNsMyBzaXplICAgICAgICAgLSAgICAtICAgIDRr
DQo+ICsgKiBzbDQgc2l6ZSAgICAgICAgIC0gICAgLSAgICA0aw0KPiArICovDQo+ICtjb25zdCB1
aW50OF90IHNoX3R5cGVfdG9fc2l6ZVtdID0gew0KPiArICAgIFtTSF90eXBlX2wxXzMyX3NoYWRv
d10gICA9IDIsDQo+ICsgICAgW1NIX3R5cGVfZmwxXzMyX3NoYWRvd10gID0gMiwNCj4gKyAgICBb
U0hfdHlwZV9sMl8zMl9zaGFkb3ddICAgPSA0LA0KPiArICAgIFtTSF90eXBlX2wxX3BhZV9zaGFk
b3ddICA9IDEsDQo+ICsgICAgW1NIX3R5cGVfZmwxX3BhZV9zaGFkb3ddID0gMSwNCj4gKyAgICBb
U0hfdHlwZV9sMl9wYWVfc2hhZG93XSAgPSAxLA0KPiArICAgIFtTSF90eXBlX2wxXzY0X3NoYWRv
d10gICA9IDEsDQo+ICsgICAgW1NIX3R5cGVfZmwxXzY0X3NoYWRvd10gID0gMSwNCj4gKyAgICBb
U0hfdHlwZV9sMl82NF9zaGFkb3ddICAgPSAxLA0KPiArICAgIFtTSF90eXBlX2wyaF82NF9zaGFk
b3ddICA9IDEsDQo+ICsgICAgW1NIX3R5cGVfbDNfNjRfc2hhZG93XSAgID0gMSwNCj4gKyAgICBb
U0hfdHlwZV9sNF82NF9zaGFkb3ddICAgPSAxLA0KPiArICAgIFtTSF90eXBlX3AybV90YWJsZV0g
ICAgICA9IDEsDQo+ICsgICAgW1NIX3R5cGVfbW9uaXRvcl90YWJsZV0gID0gMSwNCj4gKyAgICBb
U0hfdHlwZV9vb3Nfc25hcHNob3RdICAgPSAxLA0KDQouLi4gdGhpcyBmZWVscyBsaWtlIGl0J3Mg
d2FudGluZyB0byB0dXJuIGludG8gYSAoMSArIC4uLikgZXhwcmVzc2lvbi7CoCBJDQpjYW4ndCBz
ZWUgYW55dGhpbmcgdGhhdCBwcmV2ZW50cyB1cyBmcm9tIHJlb3JkZXJpbmcgdGhlIFNIX3R5cGUN
CmNvbnN0YW50cywgYnV0DQoNCjEgKyAoaWR4ID09IDEgLyogbDEgKi8gfHwgaWR4ID09IC8qIGZs
MSAqLykgKyAyICogKGlkeCA9PSAzIC8qIGwyICovKTsNCg0KZG9lc24ndCBvYnZpb3VzbHkgc2lt
cGxpZnkgZnVydGhlci4NCg0KfkFuZHJldw0K

