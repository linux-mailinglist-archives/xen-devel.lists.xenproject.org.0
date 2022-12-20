Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4A465282A
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 22:01:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467403.726475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7jjP-0008Jy-Hm; Tue, 20 Dec 2022 21:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467403.726475; Tue, 20 Dec 2022 21:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7jjP-0008H4-EL; Tue, 20 Dec 2022 21:00:59 +0000
Received: by outflank-mailman (input) for mailman id 467403;
 Tue, 20 Dec 2022 21:00:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+pxk=4S=citrix.com=prvs=3460f7db1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p7jjO-0008Gy-EP
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 21:00:58 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 652019d1-80a9-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 22:00:56 +0100 (CET)
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Dec 2022 16:00:54 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5420.namprd03.prod.outlook.com (2603:10b6:806:b6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 21:00:50 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 21:00:50 +0000
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
X-Inumbo-ID: 652019d1-80a9-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671570057;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zogQVdm5zyvoQljLZ3NtoClglJM9hMHtl3Fq2jizJlo=;
  b=fI0SKe7r8fc+2p/q7rGcWAHMpFjZ4y/we2Xb/zJbYrdA7l3QSMKK+Efw
   gznuitEK2zS4ouwSU3nyY855crgDv2fDMm1sH96+vUgggVLZxxp8qBO67
   /DsOy3Y8GlApkgUdJoiILpoNz10ZulUMZdQy96FbVVvMot9EOmSBz3FPM
   c=;
X-IronPort-RemoteIP: 104.47.57.174
X-IronPort-MID: 89356939
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:wOYRQa7T9ibm6JOfxfXIWwxRtP3GchMFZxGqfqrLsTDasY5as4F+v
 mYYW27UOP6LNDT1fYtwbNjk/BhQ6JHUz9I1G1Rtr388Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKoR5AeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m6
 vxJcx4dTTS4m/+x0JmEG+VqucFgI5y+VG8fkikIITDxK98DGMmGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Ok0ooj+SF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNJDT+Dmp6U76LGV7kBPDT8IVBiRnem8r235Vt1yB
 2Av3jV7+MDe82TuFLERRSaQqmOerBcYXNZXDOQS5wSEy66S6AGcbkAGRDNcbN0ttOctWCcnk
 FSOmrvBHTVytJWFRHTb8a2bxRuiNC5QIWIcaCssSQoe/8KlsIw1lgjITNtoDOiylNKdJN3r6
 zWDrSx7i7BNi8cOjvy/5Qqe3G7qoYXVRAko4AmRRnii8g5yeI+iYcqv9ETf6vFDao2eSzFto
 UQ5piRX18hWZbnlqcBHaLxl8G2BjxpdDADhvA==
IronPort-HdrOrdr: A9a23:CPbP/a0fMfC1lP9KlIGOYwqjBLwkLtp133Aq2lEZdPU1SKClfq
 WV98jzuiWatN98Yh8dcLK7WJVoMEm8yXcd2+B4V9qftWLdyQiVxe9ZnO7f6gylNyri9vNMkY
 dMGpIObOEY1GIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.96,259,1665460800"; 
   d="scan'208";a="89356939"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dv7HWApSRn2/ILkb+6kWrj4SjDSl59r5aa7xorYIQ3xi+4rCuyWsFI8XjZ4mmZPJuAiOtwtbiO1EQ3+2o8XZ9t0y935RRKDv2lV+Jj0rVZf7WxvifUTN2ZtzD1UUrwlNZrG56bi5Oq+WLwZJD+fJBqbEcb5XKyd6iQ39xo13ulAgWZesGJO6DHXr/4UKswPvQmAwDtbBxBEKRvSKtduoClOiu7k8919EGeclwzCliYQQ7zA2TnqpwLBla4aKIK6FErcL9lOkXSdTWwUiUN4gO0tpykVgY0A+OxW1QI7AsfsTlnwBnKWGGReSrW0I9pb+X4Q0zMQZZEE5jncunwV2WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zogQVdm5zyvoQljLZ3NtoClglJM9hMHtl3Fq2jizJlo=;
 b=Z+da12TnVAKCiSP8/zjih2/u3kQGNmZB96WUBziviB1LsSLxvlwPevTuoa7TdjT5U4XS4JocUlBrE0ItRaFQqabvs66aP+OLxFRdWBAeMDFQ9vV68eoJR9lEyYh5H8q/woOG/gcHxpg2ThINaYS0kGTIu+2MvdG+64CfxrKQQ+w7jT0ERliTsQAIYAa+r9C3CB3ugTUQ0Xduxo6LwUFCnFRdx5ySfEJn26hs1jACuC5ikT+wiSiVfgVIficbUS9ar+Iczo5FnV5VHiNkZZlnNWng8ygYy0aYZOMrMufSth+5aXswNAIhsYGbbzy6MhIVZ6reob4Y/eUCnVlqeFp2CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zogQVdm5zyvoQljLZ3NtoClglJM9hMHtl3Fq2jizJlo=;
 b=H7vVpaK6F2HEtCKkEZz403mVHIvJMFN4YwvSUz1z5KJ2xT0Z/yAg6dvJaJQDoFw5l0vgjNJwJvvdfXTEmZUk7B99TF0NPcN1BQFgbfMrZJlD2CxvnEDIOqU6B9OChWzkOWM+DTYtNNk039cjmq6SSJXLxYGDPff7f2E6O03uJSE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>, Jan Beulich <jbeulich@suse.com>
CC: Paul Durrant <paul@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC 1/7] x86/iommu: make AMD-Vi and Intel VT-d support
 configurable
Thread-Topic: [RFC 1/7] x86/iommu: make AMD-Vi and Intel VT-d support
 configurable
Thread-Index: AQHZE3QiiN9xXpyr80S/AFQLoEXg6a53ApeAgABBxYCAAAEBgA==
Date: Tue, 20 Dec 2022 21:00:50 +0000
Message-ID: <e9dbbe9e-78ad-dd3e-039b-3f9aeca3ed36@citrix.com>
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
 <20221219063456.2017996-2-burzalodowa@gmail.com>
 <09997785-ddb0-c464-331c-618349f418f2@suse.com>
 <5d2e2534-5582-6064-d18a-5900a8cb3d59@gmail.com>
In-Reply-To: <5d2e2534-5582-6064-d18a-5900a8cb3d59@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SA0PR03MB5420:EE_
x-ms-office365-filtering-correlation-id: d3b86861-e78b-4eff-2e46-08dae2cd4654
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 iLOBChFEdHOf0LXbSsTy36bzJuCiFuTLLLOYmb4+vztGPJLma1Fu+NW79+X1/3owOf9hwKeEIdEsqOu37uNTELzzfUs5L+dv/+aagtmnqiDC69qMDSZcHd0tw53W54Tc6+HmhhmK50aClhBdTUVeeTCYR/jnz7GWkaOQPomvhSHuUJkrbshfvg8KaV5wpZ38r95SKQifhphHbC8RBsR/p2o2l8uNbp0GuEvdyBhwkSlxk870vOBEQsgH6TIJV3wK79olvMyG5bdrDkPrWAs7HXGneWS7BlNCWFbsFzFvvxJ5FfDlqMUbtqI2WcNHKxvn5M+IeWjNddphyZqXbXYrcFB9ooYAfldQkuDlClfIrWkq1Jh5GPmsXZTsaNyfO2wX4L7CDI0lOni+5o205j3mobM43RTwHZqX15UeMBDPcjRP3tdHqmCHfiTZk2dd8avvvqSKz4YfMqrfZ9rkNLIx32yLSO8ud33915LBHSWA6S61vtdToUeGGYDePSBMfjij2XTG9lOjiGneMOMlnbO5nJBhRNXhwknfLC5ttgXk1w3ouGyCN0qfD/+imODumInpTDioPV0HH1dB6JS5yEG2B1z/sMxUJEYo1ZnWUN96STVrHnLHdLF7rk/+qwhVasxYxdfO+x3WuIj4SR3Mg3UmTBwuX8S0m/FpVDWyIlyOB0/2diLSOZNawSB1VUAefZUITI/8hviEtyeV17Vd5Fw14VyagRR0qlTuAvq1iRO3NvEGl5sTQP7/45xYmQdB92YsiPv2h7H1qP0QiBa9LeHKpg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(451199015)(64756008)(66446008)(5660300002)(66476007)(66556008)(8676002)(4326008)(41300700001)(2906002)(54906003)(76116006)(66946007)(91956017)(31686004)(110136005)(6486002)(478600001)(71200400001)(6506007)(186003)(26005)(6512007)(53546011)(2616005)(83380400001)(38100700002)(82960400001)(8936002)(316002)(38070700005)(122000001)(31696002)(36756003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S3VqOEU3V05lRU5odlVrVUgyOEdBcU1yR0hkNFAyUU9Hd0VzV2lqUkM0ZDJ3?=
 =?utf-8?B?emhiVVdqRmtCTkQ0bnJON2k1OGNzQTJ6YjhHK1NRNFBaTVo4UlJVQmt5MlVR?=
 =?utf-8?B?QnNVdFJTTnR0LzRuS1BkdDZGR2JYSXp6MGU3TWJWNi9Tb3pxcDZjNFlrNURu?=
 =?utf-8?B?WWliZXBQSDU3TW5La3pNNlFTbEJXVzNZWjg3YjkrTkEwS0U3a1FZYUpDdDRD?=
 =?utf-8?B?d2ZrbDZCU0hyRHBVRzFLc3pGSHhUQStobVpMRUtSd0lHODNud1NyOTA2ZEFh?=
 =?utf-8?B?OXJCdmthM1V3YzUxRzJHV1VzaUtwSGNHejJMREVRQ3ZuSVhKKzA5cmpiNTBn?=
 =?utf-8?B?VC9QclZTcUMzSTdPaHdvd2hlRHVlOCt1SUNKL0lJT0JoTmRWUFhCWDhkMTlm?=
 =?utf-8?B?Z3JRYmFUdHZDKzlxWFV5aUVmS0s5UHVqbWNRVVNuM3pZWC9TNXNJMGEwRDk5?=
 =?utf-8?B?RGRhZVNJalMxSEkzODZiZDdrb3czcEhyZzFZY0U0WHVHNW5pOUZOKzJuamJk?=
 =?utf-8?B?ZHk4N2tQRDBJUmh1cjVGL2w5T3ZTT3RFcFJqcTRIMVdubXdObnJuQm4vUU44?=
 =?utf-8?B?anhvMEFnc3NlaElzblJHdndpSGNEdDltTSt5cU9kdysxc3lZRi9Da2w3b0U0?=
 =?utf-8?B?eUVzN2xEM21SdU9RWm9HUXc2ampXOVRVSW1mZ2V2b0Nza3BEMS9VZGdWV0NW?=
 =?utf-8?B?MGFyOG1KM25JdGlzR3JTQ3VPdk1uUE13R3lBdk4vQlpvRFNhcXMrNk90QThP?=
 =?utf-8?B?Yk55RVliUU90Um5yM1cweDZMbVE4SXVhTXd4WGZWTVlwR2laNmIwVGpVL3V5?=
 =?utf-8?B?cTVOdWFaT0ZGeW1IeTUzcWY5ZHd2alQ2cVBTTG03aFhqR09VUmdESU4vcjFR?=
 =?utf-8?B?dTllR041aXY3elZiekNaUzZNd1F1M0hmZVpZUldEcXVJOXRvbHJUUlhUcnpa?=
 =?utf-8?B?VmQ1bzNGOG1ZcUpiODg0WjNaNjZaaVlDWFNqQm5pdDRTYVl4UnczL3Y3Szha?=
 =?utf-8?B?WlBsWmJPNXRvdDZwa0xqdlNzMmRNM0FUcWxiaTAzOTYrSTJVSUtEZEZIQVRG?=
 =?utf-8?B?eUNjOGQzaW1HOWpQMXh3VE9uaXBVU0E1R1duUHdTZ1RmRXBBMDBuOWJCUjlB?=
 =?utf-8?B?bk0zL2wwSzdwNFltYWJnSE1seTJQaTBFQmRhVzErTzFyZFNIeTJPYWVHN1F2?=
 =?utf-8?B?eVJlZzdUTTBpZUl3UUxrRTZUK1ZpbDdESGRyWnNDaGxvRlRFQjBWeEJLOGFQ?=
 =?utf-8?B?SngvTUFvbGNZelJvaS8vTE9zWWhJTHpsTHUrSjdqTG9YanV2Zm5EZS9nelJm?=
 =?utf-8?B?UWRFU29kOEtJSCt1ZXVaYW1rZXk2bE5qekFLUkp2Q3V1NklaYkhacnRrbW1R?=
 =?utf-8?B?eFVVV0FhaWxFUzAzZDg3cHl3Um5VSkpZMDQrcGMvK2E0YUU2bEs5ZXFTeDBw?=
 =?utf-8?B?ZnZxNkJvSERHdUFzaHhtcWhHdHRJemZ4aHJtVEg3cGhkbm1iZ2VTTGNKQXZ2?=
 =?utf-8?B?NXRocDNGTXBNb0RaeEd3NmQxYy8vRHdDMi95NUVxdFdQR0ErZnhyUWQ2VllB?=
 =?utf-8?B?Mi92em4vZnAwSWM2V0FKeUhLc2paSzZvM3R4eGlBYitJYnlpWjZ5cDltVEpI?=
 =?utf-8?B?RS9TWHRxb1J6YzI3b1loenFWVHZKQUNVSE1Wb3lYTHhKOG5YbHJIVEFkVS9p?=
 =?utf-8?B?eEtvZFd6c2txVVJPL3JLN293M3JQR1Nub3NGSGhTOUlmY085Q2ZpSEZaZm9w?=
 =?utf-8?B?RjA1bDBYbFBRd0xwQ0diQkhMYW9oa0NseldIb2xRNENaRjAxNVBHUVpQYjRC?=
 =?utf-8?B?T0JsRThiRytvcUV2NGhkVTBkdldSWkFxNU5GdXJjbmZQdkhBSnBRR0JXbWVz?=
 =?utf-8?B?VmtnRG9rTFNaNmI5Zk9aTzhnKzlFYjVWTWw3b3lnZnV5TmRVSXkyWGZ3Znh6?=
 =?utf-8?B?ZkwwOWtzQk51cm0wSXFDbm5ud255ZEt5L1RQUjYyTzMxTFl3MW5WM3JnUVZH?=
 =?utf-8?B?L0ZYVFdMZXBxV3FUYmxVR0tVY21rM3FmYmdkRXVKeHlCOWc5bHJTbzN0WEJQ?=
 =?utf-8?B?c2xTVUxyN1I4T1BpQXhsUkxVZmZFWGllTnhqU2RsL2VmeWVzMDcxM0FHSEJk?=
 =?utf-8?Q?BT8idn4zXBcsVUBKURrj17zgC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7ED09F86102248449350804F039F374B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b86861-e78b-4eff-2e46-08dae2cd4654
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2022 21:00:50.2285
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1u6h/mpmZnieSU3LMdHn/bXIZYQtsIaO0UMMgq6VC/caup5ZzUIDY18RiCj+Sm4MqbFN8oD1x5fb02G2baF4peAectIVcbtluNQ7ZfQTwAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5420

T24gMjAvMTIvMjAyMiA4OjU3IHBtLCBYZW5pYSBSYWdpYWRha291IHdyb3RlOg0KPg0KPiBPbiAx
Mi8yMC8yMiAxOTowMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAxOS4xMi4yMDIyIDA3OjM0
LCBYZW5pYSBSYWdpYWRha291IHdyb3RlOg0KPj4+IEN1cnJlbnRseSwgZm9yIHg4NiBwbGF0Zm9y
bXMsIFhlbiBkb2VzIG5vdCBwcm92aWRlIHRvIHRoZSB1c2VycyBhbnkNCj4+PiBjb25maWd1cmF0
aW9uIGNvbnRyb2wgb3ZlciB0aGUgSU9NTVUgc3VwcG9ydCBhbmQgY2FuIG9ubHkgYmUgYnVpbHQg
d2l0aA0KPj4+IGJvdGggQU1EIGFuZCBJbnRlbCBJT01NVSBkcml2ZXJzIGVuYWJsZWQuDQo+Pj4g
SG93ZXZlciwgdGhlcmUgYXJlIHVzZSBjYXNlcywgZS5nIGluIHNhZmV0eS1jcml0aWNhbCBzeXN0
ZW1zLCB0aGF0DQo+Pj4gcmVxdWlyZQ0KPj4+IFhlbiB0byBiZSBhYmxlIHRvIGJlIGNvbmZpZ3Vy
ZWQgdG8gZXhjbHVkZSB1bnVzZWQgY29kZS4gQSBzbWFsbGVyDQo+Pj4gdGFpbG9yZWQNCj4+PiBj
b25maWd1cmF0aW9uIHdvdWxkIGhlbHAgWGVuIHRvIG1lZXQgZmFzdGVyIGNlcnRpZmljYXRpb24N
Cj4+PiByZXF1aXJlbWVudHMgZm9yDQo+Pj4gaW5kaXZpZHVhbCBwbGF0Zm9ybXMuDQo+Pj4NCj4+
PiBJbnRyb2R1Y2UgdHdvIG5ldyBLY29uZmlnIG9wdGlvbnMsIEFNRF9JT01NVSBhbmQgSU5URUxf
VlRELCB0byBhbGxvdw0KPj4+IGNvZGUNCj4+PiBzcGVjaWZpYyB0byBlYWNoIElPTU1VIHRlY2hu
b2xvZ3kgdG8gYmUgc2VwYXJhdGVkIGFuZCwgd2hlbiBub3QNCj4+PiByZXF1aXJlZCwNCj4+PiBz
dHJpcHBlZC4gQU1EX0lPTU1VIGVuYWJsZXMgSU9NTVUgc3VwcG9ydCBmb3IgcGxhdGZvcm1zIHRo
YXQNCj4+PiBpbXBsZW1lbnQgdGhlDQo+Pj4gQU1EIEkvTyBWaXJ0dWFsaXphdGlvbiBUZWNobm9s
b2d5LiBJTlRFTF9WVEQgZW5hYmxlcyBJT01NVSBzdXBwb3J0IGZvcg0KPj4+IHBsYXRmb3JtcyB0
aGF0IGltcGxlbWVudCB0aGUgSW50ZWwgVmlydHVhbGl6YXRpb24gVGVjaG5vbG9neSBmb3INCj4+
PiBEaXJlY3RlZCBJL08uDQo+Pj4NCj4+PiBTaW5jZSBubyBmdW5jdGlvbmFsIGNoYW5nZSBpcyBp
bnRlbmRlZCByZWdhcmRpbmcgdGhlIGRlZmF1bHQNCj4+PiBjb25maWd1cmF0aW9uDQo+Pj4gb2Yg
YW4geDg2IHN5c3RlbSwgYm90aCBvcHRpb25zIGRlcGVuZCBvbiB4ODYgYW5kIGRlZmF1bHQgdG8g
J3knLg0KPj4NCj4+IEJ1dCBkbyB0aGluZ3MgYWxzbyBidWlsZCBzdWNjZXNzZnVsbHkgd2hlbiBv
bmUgb3IgYm90aCBvcHRpb25zIGFyZQ0KPj4gZGlzYWJsZWQ/DQo+PiBJIGhhdmUgdG8gc2F5IHRo
YXQgSSB3b3VsZCBiZSBxdWl0ZSBzdXJwcmlzZWQgaWYgdGhhdCB3b3JrZWQgd2l0aG91dA0KPj4g
ZnVydGhlcg0KPj4gYWRqdXN0bWVudHMuIEluIHdoaWNoIGNhc2UgaW5pdGlhbGx5IHRoZXNlIG9w
dGlvbnMgd2FudCB0byBiZQ0KPj4gcHJvbXB0LWxlc3MsDQo+PiB3aXRoIHRoZSBwcm9tcHRzIG9u
bHkgYWRkZWQgb25jZSAnbicgYWxzbyB3b3Jrcy4NCj4NCj4gV2l0aG91dCBhcHBseWluZyB0aGUg
d2hvbGUgc2VyaWVzLCBkaXNhYmxpbmcgYW55IG9mIHRoZW0gb3IgYm90aCB3b24ndA0KPiB3b3Jr
LiBPay4NCg0KVG8gZG8gYSBtdWx0aS1zdGVwIGltcGxlbWVudGF0aW9uLCB5b3Ugc3RhcnQgd2l0
aA0KDQpjb25maWcgRk9PDQrCoMKgwqAgYm9vbCB5DQoNCnRoZW4gcmVhcnJhbmdlIHRoZW0gbWFp
biBjb2RlIHRvIHVzZSBDT05GSUdfRk9PIGFzIGFwcHJvcHJpYXRlLCB0aGVuDQpoYXZlIGEgZmlu
YWwgcGF0Y2ggdGhhdCBhZGRzIGEgS2NvbmZpZyBuYW1lLCBoZWxwIHRleHQsIGV0YyB3aGljaCBp
cw0Kd2hhdCBtYWtlcyB0aGUgY29uZmlnIG9wdGlvbiB1c2VyIHNlbGVjdGFibGUgYW5kIGFibGUg
dG8gYmUgdHVybmVkIG9mZi4NCg0KfkFuZHJldw0K

