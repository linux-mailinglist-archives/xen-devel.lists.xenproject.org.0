Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1424A464A
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 12:55:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263059.455620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEVGi-0001ci-6R; Mon, 31 Jan 2022 11:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263059.455620; Mon, 31 Jan 2022 11:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEVGi-0001at-37; Mon, 31 Jan 2022 11:54:48 +0000
Received: by outflank-mailman (input) for mailman id 263059;
 Mon, 31 Jan 2022 11:54:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9KqZ=SP=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nEVGh-0001al-22
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 11:54:47 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94a5a4fa-828c-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 12:54:45 +0100 (CET)
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
X-Inumbo-ID: 94a5a4fa-828c-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643630085;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=I13JbV30Q84jMnuIxDGe1ht+ULzN4fbgLPo++bczqm0=;
  b=b8a1gQOs3QINN8ocYKbcurWWAjJmpgG5F727R30x0Z4NW4ufQjSGPOjO
   r8yHIhkK7HEXRQc9W36hysNI2CfzV2mNibKxRKqSHzj3P/uYxnVUDGFca
   s2wTII5t68IXJIyP+ygmKR5WaabZjPTMmGmqDlWp29zg3TtJp1UuNo9Vf
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HHa1XY96LjsbtBTF3MS/i6T6p8+TvpuuL4LwvV4Dwz5NOalkgkvZlMOemU+IrPMkIKQIPd2r1F
 o9CHUPTAuuqN0oH81vouNVn0k7F9B67NFPJqzbJ2aYH3rYLfz47TdN1oszAJAvBOG6xnROJowK
 X529GbkmS4IjuSFX2aDazZISkMjDWqVkwvHJDYQ3liDNHKY2M5oXjkCTbFNBJEN1XxTex79lwJ
 FAewkPzpO2uEUkqMbz4DS695bZjr+9EHmMPI1oLMuvmllUXC70iRl5JpZAmVBXxWrvGEGN89A9
 thW+Vd4qRys79m54i9Z71B23
X-SBRS: 5.2
X-MesageID: 63111121
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qOCGHK5AhrkxUIXFsiFFhQxRtNXAchMFZxGqfqrLsTDasY5as4F+v
 mcdXGHUMvvfM2T8fth0YYq39RxQ6JDczoNqSVRs/3o3Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZg2dcw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z0
 ORi9r2fR1sTPpbBtL4wDR1gDhFXFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQRq+HP
 pNDMFKDajyDPVpdYRAzFK5lwr7rnyGjLjYbmAOK8P9fD2/7k1UqjemF3MDuUsyHQ4BZk1iVo
 krC/n/lGVcKOdqH0z2H/3mwwOjVkkvTR4Y6BLC+sPlwjzW7xGYeFRkXXluTuuSihwi1XNc3F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc8JhPK4bxw/R8Krv7irDKzYAdiNxQfVz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbo1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNOtbABbvzt68owGOlor+p5
 iJsdy+2t7hmMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8ifxo5bZ5UJ261M
 Sc/XD+9ArcJZhNGiocsO+qM5zkCl/C8RbwJqNiJBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6NGfjTkkr2uZLDNC/9YepUazOmM7FmhJ5oVS2Iq
 b6zwePQlUUGOAA/CwGKmbMuwacidCZjXc6u950IJ4Zu4GNOQQkcNhMY+pt4E6RNlKVJjObYu
 Ha7X05T0l3kgnPbbw6NbxhehHnHBP6TdFo3Yn4hO0iGwX8mbdr95asTbcJvL7Im6PZi3bh/S
 PxcI5eMBfFGSzLm/TUBbMai8Nw+JUrz3Q/ebTC4ZDUffoJ7Q1Cb8NHTYQaypjIFCTC6tJVir
 uT4hB/bW5cKWy9rEN3SNKC011q0sHVEwLByUkLEL8N9YkLp9IQ2eSX9guVue5MHKAnZxyvc3
 AGTWE9Kqe7Iqo4z0d/ImaHb8Nv5T7ogRhJXRjCJ46y3OC/W+nuY7bVBCOvYLyrAUG7U+bm5Y
 bkHxf/LL/Bazk1BtJBxEug3wPtmtcfvvbJT0i9tAG7PMwawErplL3SLgZtPu6lKyuMLsAe6Q
 BvSqNxTOLHPM8L5Cl8BYgEia73bh/0TnzDT69UzIVn7u3ArrObWDx0KMknekjFZIZt0LJghk
 LUot8Mh4gCijgYnb4SdhSdO+mXQdnENXs3LbH3B7FMHXubz9mx/XA==
IronPort-HdrOrdr: A9a23:TRtgcas0FgOBTClV3jFrHCRD7skC0oMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJh5o6H8BEGBKUmskKKceeEqTPmftXrdyReVxeZZnMrfKlzbamLDH4tmu5
 uIHJIOceEYYWIK7voSpTPIaerIo+P3sJxA592ut0uFJDsCA8oLjmdE40SgYzZLrWF9dMAE/f
 Gnl656Tk+bCBIqh7OAdx44tob41r/2vaOjRSRDKw8s6QGIgz/twqX9CQKk0hAXVC4K6as+8E
 De+jaJpZmLgrWe8FvxxmXT55NZlJ/K0d1YHvGBjcATN3HFlhuoXoJ8QLeP1QpF4t1HqWxa1e
 UkkS1QePib2EmhOF1dZiGdgjUI5Qxer0MKD2Xo2UcL7/aJHw7SQPAx+r6xOiGplXbI+usMjZ
 6jlljpx6a+R3n77VXAzsmNWBdwmkWup30+1eYVknxESIMbLKRctIoF4SpuYd099Q/Bmcga+d
 NVfYrhDTdtACenRmGcunMqzM2nX3w1EBvDSk8eutaN2zwTmHxi1UMXyMEWg39FrfsGOtV5zv
 WBNr4tmKBFT8cQY644DOAdQdGvAmiIRR7XKmqdLVnuCalCMXPQrJz85qkz+YiRCdE15Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIW2m5VSSF8LAW23G4gMyLeFPGC1zwdLkeqbrWnxxEOLypZx
 +aAuMiP8Pe
X-IronPort-AV: E=Sophos;i="5.88,330,1635220800"; 
   d="scan'208";a="63111121"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jq5Hq3tP4ldEyU9Eah7CpfIqM+A3ws69doc23dIDfgs0Jg3xaRjHuYMnAnE06u2jxJ0HP+bpX6ZBzplLkhWXsw1EuMgfTF95Zt/ROFDqduKQ6H6EbFoSI2Ea+P6hoIW1kt2SBpTAVPF1jEq1ivGAEGJ1XhQGHCdUoY3Hody/3ZC99M7kRl9tar9jESz9qk/pkE2sIH95IuqvMBMFepEnHuj3K6NvFQIn8GEAJ7AyrT46RzRFLlK9y5fAAQJt4OXMIQ4kpfPh7yj4QKa4V2xfsr46HEXJiShUOzX86T3udzOKzR1YsUfs2OTvwwZRKXo9sL+eKWIlEVMx30fCQexaKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I13JbV30Q84jMnuIxDGe1ht+ULzN4fbgLPo++bczqm0=;
 b=lgPwCcc8D6S3WKM3dzDVlJeRxQeBkyLgkKdVzniNCJPOsjLNEYb6AiQQJIJEB1OdJqStpvsn8b0VJXb6qrZ9Y9XlQ7AT4FXlKs0xBnCGTrNx3siVVbCREJ8lF3YS2ARavshjX/Fa3kJfObJDrTWi02NRYlpMHZd42nzwFrW72rtvf0AFvqNxpFQvHnZyt/RpluQeLrXjABu7zDc14Nn46UijS3DyHiihF84mHG+ktux48MSkvU9JjvYSRuB8Lwyl54EgykpVI/38061KEqCSCtJ936uLgmeic3sjUYdiVzwYhpBJFWK17AurQ/KfwDeRqMSqo4Is2F3uZeb58vbjaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I13JbV30Q84jMnuIxDGe1ht+ULzN4fbgLPo++bczqm0=;
 b=evBUDksGE0QLxVmvLL6NAxhGYjnlP1iryM+RGVMmHleJ/5fVteO5GKbyPEhq7R7QQjknv3KpzRrbtgNyJw+xz3o/Zr9A5I1k3EsqJGHzeooSImVe0QSi3c56YH7KoP+DITr5SC2+VaZH89BJ2e+2+aFuqr7IY+04y8gZHKEzkns=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 9/9] x86/cpuid: Enable MSR_SPEC_CTRL in SVM guests by
 default
Thread-Topic: [PATCH v2 9/9] x86/cpuid: Enable MSR_SPEC_CTRL in SVM guests by
 default
Thread-Index: AQHYFEshh+hEQ9Y7KkWo9sPMXmoMQax89PsAgAAVFYA=
Date: Mon, 31 Jan 2022 11:54:40 +0000
Message-ID: <8f251211-d107-05c6-e8b0-8c9a6fbdee32@citrix.com>
References: <20220128132927.14997-1-andrew.cooper3@citrix.com>
 <20220128132927.14997-10-andrew.cooper3@citrix.com>
 <8a1bfec2-a904-c561-aa6d-0ecafd2cf43c@suse.com>
In-Reply-To: <8a1bfec2-a904-c561-aa6d-0ecafd2cf43c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5bd2d2a7-47e3-42a9-0a3b-08d9e4b07695
x-ms-traffictypediagnostic: BN6PR03MB2612:EE_
x-microsoft-antispam-prvs: <BN6PR03MB2612084A169480883DC91F6EBA259@BN6PR03MB2612.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K0V09MQ8MNYf8m/pp0iFWFDtH08GNBtoD2bGq9/RhcwAHHfWWWm207GFeNABcx1HsiFUuvCaaHrKdm9Lui4D5dHUbiecNiNUqSeWLtc+FXUPkYAMxJ1f5Q13ipmLubBVBmz+cWpR8hUXVUgQlfiBH/NWTnFxKYEsXNJDm3Giu0RFSLr7qBVM2UY9kgVgaXHpu+S3h2/0N5g02y5dmHl+5bY1iGIQBCVAuyP3+ftYxkIuwVLVmfr3Abjr/Ci7iL5aAYAJa0K2TUQN4ZhDDn/uWG9B1F7pEo/oYmcGPbfWPiFuI+/FKYe4lBx6miG1AYUX/wHPNcaa73eGkAmyHS4wjG7kaC0zFWxmCwJwUnuSLLyMGsu9aVErxjZokrUqOX3F7tY2z3DSM8n5J1C/OrTGbcXJ57avhD2WIZw4HALeP/9aBDwZ074vzXs4PbQXz7ljP4w6ijg5k0YsaUiqV3HgEweEd6jEiLrmFdulAJxP4if0slgFgAUrmUcnpp7izKzO7hrof/28f16K3O/x/AafocUxm5KXXldp5Y56h6wqaMIfQ4Qp/3jH/j9vt8/qTdmLrpSj2JcQnIqjfTOWHgsadvv9d2qOjG+hOsOKZkcJpJEQaadSWIYVHkvjoHyX6Rk8Z3w+yKI88h8OGEcvvB1RV9yGxMshu4RzMMQJDe/f2QMWCzI+L8BCsptfgB8eWVsiRnwkCBJLtoG5nd4BzDvBxYOu9FchaYMntRqCtt5kxiK0C/YMXtd6P4eYkCpWPMgvQpA4wusX13vpCr28MGmqPg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(82960400001)(38100700002)(122000001)(4326008)(508600001)(6486002)(5660300002)(2906002)(8936002)(66476007)(66556008)(66446008)(71200400001)(76116006)(54906003)(316002)(186003)(2616005)(66946007)(91956017)(8676002)(83380400001)(26005)(6512007)(53546011)(6506007)(38070700005)(31686004)(31696002)(86362001)(36756003)(6916009)(64756008)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OHdWM2JrSGlFUDBTMHpRVzN0Ym1CRW1oUVdFeTk5b3BwN0lobkFjWEdzTE45?=
 =?utf-8?B?V0VoTHc0elRma3ZUTXJzRSt2RUgzekQ3ZkZuRUlXYWd3bDlsWFk3WTBqR1ZW?=
 =?utf-8?B?OVZnSi8wWUdPMW4xQnV6OERjS05tcjVFSFBicFBqTlNVd0N6RUVML0dJaVNz?=
 =?utf-8?B?RlpwTW4rWGptRFI4bHM3ZzRjbkRBdERkbDgwajBmWENMVnQzN3ExZ3FTbjdo?=
 =?utf-8?B?M2E3YXFtN0ZFV0w1MWcrcWozbUxHVGpzRUFVdmMyb3Zuc2J2QmJpWDJzQVRO?=
 =?utf-8?B?Tk96M05kL3RBRTE2REFMc090dzVhSElGSUVXcFdiRDdxS2E2UENsVTZ1VUNk?=
 =?utf-8?B?ZTFHR2c4bmREcFVncWFuaFNkU2Z0TzZrWGw0Z0p3eXpGNitJTmVEZGtUdmRX?=
 =?utf-8?B?dE9OWnFmZk1TekErK1l6T2QxVzVtTDZLUlRSMU5pQVNUMG15VzNFZHZCdS8v?=
 =?utf-8?B?bVd6NElYb20wV3E0VWZLUk9hbkJCd08rZWRKUWVnQ0J1eFlPMDMySDU0Y1h0?=
 =?utf-8?B?UnVJYmJCSlJZZXVDTlFGRTVBOEpHRFZRYzZUdGIrSUdBOWZJb3VSMXFzcVdV?=
 =?utf-8?B?SW94a3lsYnNMQ21sUk55L2hqYjlUYjVBUGc0a2cwdmc4Qk92eFZNOGtBWS8r?=
 =?utf-8?B?MWVXV0p5WjA2TXBBcHBnNUcxMk02Q2hXTUZoRjNVUW4yTGxGdDdQbDFjTE5t?=
 =?utf-8?B?UlFUcDlheU5rTFEyTXUrNlUvdDRINGJPc3VmTjhYTTJocTlZTFpWcFlHMTFv?=
 =?utf-8?B?cHlCNmdKOHBSeko3UnB4SFYzU09RNy9MQjI4aWZUeUpocUgvRkVKVEpJcEI4?=
 =?utf-8?B?YmNnMmFOVzBkTlJKKy9JZUJtaVdNQ0NvdmRxQlQzaEhUVzJ5Nkk4V08yOWlk?=
 =?utf-8?B?Z0FWTWRlc3hqSUJhTFJTcDNSa2VWWTFmK01WN0VXV1piT3hoL3M1aHB3U2dw?=
 =?utf-8?B?VFVOKzZLaUMvYTIvLzNQLzh5enI2T1hESkZhWW5YUmlpZVpleHVObzdCNHNn?=
 =?utf-8?B?bTAzV3FmN2xkRHVDY0t2NmQya1p5WWZoNng0UkFablZCUktVMFBjS0pvYTRy?=
 =?utf-8?B?NGpscms0YVVPNHpBVk90eFZEQUZZQ0g4bWNBb2RsQm1BVGgvYUNCQ204SjJs?=
 =?utf-8?B?cldheWNvaDhESkFaM1d6UnFKM2ZaRG9MSnBhUCtYSTJJTUUwaGdqbUY1bit1?=
 =?utf-8?B?b1JZcHZ3VXJWK2lDellMd1F0a0hjZnhiaWcxUmt1RGg3dXRNQm5DVEpzVXpp?=
 =?utf-8?B?aWl1VGpWNzBpRWowZ2UrZmlTZ2o3RS9uYndXN20xMzhEd292QmxHU2F0TGlK?=
 =?utf-8?B?eXIwenVxR3EydVVGQnArNHdJb0FyYml0Q1E1SE9WeE04L2dQcFU4Z3pVNDVo?=
 =?utf-8?B?Qno4OG84M1MyazNPbm5YZTF2VnNLRURZSjlhUkRnWXlXYzdpK2s5Vjg4dTFv?=
 =?utf-8?B?MlV0YlpIMXdsK3pxS3FSRDdLVkxPa0d0a00xOU9SbHcyMmZaVU52d09JN2dQ?=
 =?utf-8?B?VndScFRTMGl1VmFnUnAwZDd1cTdrWGlzMHFEWDI0RmJvL2h0L21OY2krYTlJ?=
 =?utf-8?B?ei9RUG5FcytjdWVtZmRqMGZOQ3gyYzY5MnNZaWxzNDVoK1pFUXlhSWhWTWNC?=
 =?utf-8?B?TmFJVTlSVnVYTGwybnUxaVFBMktKM1pCdGx5RDNJRy9RY0hodmVDcE9jYzN4?=
 =?utf-8?B?dkRXM3RST09SeGhjK1hkZkV0NVhDME5LaHVYVGF4emtldGltNmhOZ2pUUGQr?=
 =?utf-8?B?SDJ1WXlQNlBxWk0rUisvVHpscUZYZXJPSlhLNEw5Q0h4VG5Zc0xoODNkeUph?=
 =?utf-8?B?dEhRQjBUNTQ1UzhsUUNXZUFhL2dQNG9XaStlaktZM1RRZXNVeHc4K2Nxemdy?=
 =?utf-8?B?SmJCREIyaUdPSWRuekhjV1JTZndaaHk4V0NYUXFZcFE0M2pNdGRjWHl0Rzln?=
 =?utf-8?B?clZqSERNdEI4Nm5iNDU1a0dpRnEvc3dzT2pFWVpKbU55U1o5VXYzbnpMZXph?=
 =?utf-8?B?RXVkR3dQRHA5c3dLaVdzbDQza0xwZGdUZkxFVzdWTVVRUHFUU2NjQ081eERF?=
 =?utf-8?B?aDhQTGo2eHVQOFNlL0svVXEzRWEyVE80VHYvdW5VZUNYbm9ub0tWMnFJRkww?=
 =?utf-8?B?U29IZU4rUHV3SE5QUmpmUkl2dEh4aVRPa1FoSGNQa2NZYkFXTHBtWGxlY00w?=
 =?utf-8?B?UXd2N2MvTVYyV3lESmdZRXdicURVZWloNkRTZlRSMjB2S1R5MS9YNGNFU28v?=
 =?utf-8?B?SHFEN2F0QmpqdjR4NWIyVFVoZnlnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <46FDF062E9A5364294254741C5767380@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bd2d2a7-47e3-42a9-0a3b-08d9e4b07695
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 11:54:40.3866
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: heHJEyjRKGBzZTug3RofOVkDLnFHbMFq8wt2ZG5kp3oYF8+W7cbpcxHkjTjaJ+HQd1/ijxGiuEuLe2Vp9UTesvONVcauPdilf+eHSP8BwLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2612
X-OriginatorOrg: citrix.com

T24gMzEvMDEvMjAyMiAxMDozOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI4LjAxLjIwMjIg
MTQ6MjksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBXaXRoIGFsbCBvdGhlciBwaWVjZXMgaW4g
cGxhY2UsIE1TUl9TUEVDX0NUUkwgaXMgZnVsbHkgd29ya2luZyBmb3IgSFZNIGd1ZXN0cy4NCj4+
DQo+PiBVcGRhdGUgdGhlIENQVUlEIGRlcml2YXRpb24gbG9naWMgKGJvdGggUFYgYW5kIEhWTSB0
byBhdm9pZCBsb3Npbmcgc3VidGxlDQo+PiBjaGFuZ2VzKSwgZHJvcCB0aGUgTVNSIGludGVyY2Vw
dCwgYW5kIGV4cGxpY2l0bHkgZW5hYmxlIHRoZSBDUFVJRCBiaXRzIGZvciBIVk0NCj4+IGd1ZXN0
cy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPg0KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pg0KDQpUaGFua3MuDQoNCj4NCj4gT25lcmVtYXJrOg0KPg0KPj4gLS0tIGEveGVuL2FyY2gveDg2
L2h2bS9zdm0vc3ZtLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jDQo+PiBA
QCAtNjA2LDYgKzYwNiwxMCBAQCBzdGF0aWMgdm9pZCBzdm1fY3B1aWRfcG9saWN5X2NoYW5nZWQo
c3RydWN0IHZjcHUgKnYpDQo+PiAgDQo+PiAgICAgIHZtY2Jfc2V0X2V4Y2VwdGlvbl9pbnRlcmNl
cHRzKHZtY2IsIGJpdG1hcCk7DQo+PiAgDQo+PiArICAgIC8qIEdpdmUgYWNjZXNzIHRvIE1TUl9T
UEVDX0NUUkwgaWYgdGhlIGd1ZXN0IGhhcyBiZWVuIHRvbGQgYWJvdXQgaXQuICovDQo+PiArICAg
IHN2bV9pbnRlcmNlcHRfbXNyKHYsIE1TUl9TUEVDX0NUUkwsDQo+PiArICAgICAgICAgICAgICAg
ICAgICAgIGNwLT5leHRkLmlicnMgPyBNU1JfSU5URVJDRVBUX05PTkUgOiBNU1JfSU5URVJDRVBU
X1JXKTsNCj4gVGVjaG5pY2FsbHkgSSBzdXBwb3NlIHRoZSBpbnRlcmNlcHQgd291bGQgYWxzbyBi
ZSB1bm5lZWRlZCBpZiB0aGUgTVNSDQo+IGRvZXNuJ3QgZXhpc3QgYXQgYWxsLCBhcyB0aGVuIHRo
ZSBDUFUgd291bGQgcmFpc2UgI0dQKDApIGZvciBhbnkgZ3Vlc3QNCj4gYXR0ZW1wdCB0byBhY2Nl
c3MgaXQuDQoNClllcywgYnV0IHRoYXQgaXMgdmVyeSBkYW5nZXJvdXMuwqAgVGhlcmUgYXJlIGtu
b3duIGV4YW1wbGVzIG9mIHJlYWwgbW9kZWwNCnNwZWNpZmljIHJlZ2lzdGVycyBpbiB0aGUgcGxh
Y2Ugd2hlcmUgYXJjaGl0ZWN0dXJhbCBvbmVzIGFsc28gZXhpc3QuwqANClRoZSBIYXN3ZWxsIHVh
cmNoIGhhcyB0d28gbm9uLWZhdWx0aW5nIE1TUnMgaW4gdGhlIHgyQVBJQyByYW5nZS4NCg0KQSBn
dWVzdCBwb2tpbmcgTVNSX1NQRUNfQ1RSTCB3aGVuIGl0IGlzbid0IGVudW1lcmF0ZWQgaXMgbm90
IGEgcGF0aA0Kd2hpY2ggbmVlZHMgb3B0aW1pc2luZywgYW5kIHRha2luZyBhIHZtZXhpdCBpcyBt
b3JlIHJvYnVzdCBhZ2FpbnN0DQptb2RlbC1zcGVjaWZpYyBiZWhhdmlvdXIuDQoNCn5BbmRyZXcN
Cg0KDQo=

