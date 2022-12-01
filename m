Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A4863EFE9
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 12:52:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450622.707986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0i6X-0003z5-AV; Thu, 01 Dec 2022 11:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450622.707986; Thu, 01 Dec 2022 11:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0i6X-0003wJ-78; Thu, 01 Dec 2022 11:51:49 +0000
Received: by outflank-mailman (input) for mailman id 450622;
 Thu, 01 Dec 2022 11:51:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmm5=37=citrix.com=prvs=327587bd7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p0i6W-0003wD-4o
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 11:51:48 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 875f4a5b-716e-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 12:51:46 +0100 (CET)
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Dec 2022 06:51:39 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB4931.namprd03.prod.outlook.com (2603:10b6:408:d8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 11:51:37 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 11:51:37 +0000
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
X-Inumbo-ID: 875f4a5b-716e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669895506;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=nca0bVxWP3Spox33UDy3b/h0Hwof3uzXV0BRdBJardg=;
  b=DRX1tJY5JAeEJz3s6ejp29hLV4Q5Vypag5bML6hkZ+nOs562UBYC6IIE
   gprVDEzjErsfEQuj/2tatBWhrsO8CJX2BcIIOF6um/pnOcu9RmH4zSuba
   SiVc2kaft/haCWXno3PBP6sw9SSuEW02UIzEmJ+BnEjs+Q53FgyvSh0C9
   0=;
X-IronPort-RemoteIP: 104.47.57.171
X-IronPort-MID: 85597418
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ZFhlLqNgdSyXG4vvrR2FlsFynXyQoLVcMsEvi/4bfWQNrUol3zMEm
 2caCmjVbP+NZjPyeNhxOtjnpBxV78ODmt9kSwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpC5gVmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0ud7AThv9
 r9fEzc2Zyyzt/vmmIqHVNA506zPLOGzVG8ekldJ6GiASNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PVxujeKpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8efwH6qB95LRNVU8NYpq0+Y+UkvMicbekSSqumwjVWZYeNQf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpZNU4uecsSDct1
 1vPmMnmbRRwtJWFRHTb8a2bxQ5eIgAQJG4GICMBEw0M5oC6pJlp102WCNF+DKSyk9v5Xynqx
 CyHpzQ/gLNVitMX06K8/hbMhDfESoX1czPZLz7/BgqNhj6Vrqb8D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:aXqSl6nNFR9IwVRU50hUgsT7KG/pDfNpimdD5ihNYBxZY6Wkfq
 GV7YEmPHrP41gssR4b+exoR5PwPU80maQV3WBzB8bQYOCZghrLEGgK1+KLqQEIcBeOldK1u5
 0QFpSXA7XLfCdHZa6R2mWF+71L+ra6GG/Dv4rj5kYodCUvT5xJqz5+DAPzKDwFeOGFb6BJaq
 Z1IqB81kqdkbF8VLXLOpB/ZZmmm/T70Kj+ZAIABVoO8RDmt0LQ1JfKVyKA2wsYUXdl3bcm/A
 H+4nHEz5Tmiei/1hjfk0ja65g+oqqH9vJzQPaUj9QTKHHLlAGlf+1aKtu/lQFwmvir9FEp1O
 Ptjn4bTrxOwkKURHixvRzunzPtyykj8FjrzVPwuwqZneXJAAgiDtZHh8ZnfgDC60wm1esMqp
 524w==
X-IronPort-AV: E=Sophos;i="5.96,209,1665460800"; 
   d="scan'208";a="85597418"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yczz/JXV0EEp0XvKBAjlkrx9CvcQSfxDvrvZPxG1Laq63iP5ETEzFKlfO+536TMTjUZJcnRTJUDFpDIBZFyf4tz6BSXL2Dm8KWUUvTj0ELripBNs/3XmG/XOcerfHgxsEEaUazOheAXymvmUUDbhxH25bvEusYE2WsLgIQ5hXL2XYgmHNkr23D9mAo8kLAr5j1BuFDgE0aWLl7euNzkUlP+TjD/TUn7t+KdU1FypUuPwEsH7JfEKu2N0Ku4l7mRkzC+90ya8OM0JDp1NaK8tEf4+DSm0XUtyheBZ1MCVH1v1slkTsKAPsWKneiGm0vpt8dpiOOvX8LPMbOvF0TkX4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nca0bVxWP3Spox33UDy3b/h0Hwof3uzXV0BRdBJardg=;
 b=B32EIntMqk0VL2fnARRlYrmZFYxgKPo2lxQmhPeAC/hCJ+yBg17zC+ooSTvrzzRltGwf9vjLKV4frbDLb6vJk8A7O5ua9VCAfV1JrCnojxDqchkiB1cUhIfMuInjsT2hHT4dBEsaLA4ikp/Bvn432JtxFES+BJWkOhLo3q7TxmEHE1m1dsHjdKEIYHmncbVNjW+jwwqVpV39Vwcf67a99+w8hfAMvrcsrvz0C4kQLO9Est09oSIGaj11ZLseANQDbaGirW3I5FlAI9gNR+PtChtTc0cedrb85ifLV6Z8VPAUOoqgdknEu+Odfu7rTLGwIuTniPSJNf44LgAO9q8ytw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nca0bVxWP3Spox33UDy3b/h0Hwof3uzXV0BRdBJardg=;
 b=Vge8kv7OsNZfaAknVU7geyKZKRjZPK3GSG8MP8eGqhDUp12sQQ++J626qHmWkHdASp0CAZvtVjPxs61svJ+ePzeVyZ3+ldudKoJ+51nQIZO651WN+mbpuUhVrDJXHt/VSsmYmMCW+FarT6qgRwh05JWIbveUc1Usavax+SlDfDc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH v1 3/5] tools/ocaml/libs/xc: add hvm_param_get binding
Thread-Topic: [PATCH v1 3/5] tools/ocaml/libs/xc: add hvm_param_get binding
Thread-Index: AQHZBOHoUstN/BwU2U6dPEOVBKoOc65Y7MSA
Date: Thu, 1 Dec 2022 11:51:37 +0000
Message-ID: <4ba26b93-a7b0-ee6d-f71f-6e0d78314697@citrix.com>
References: <cover.1669829264.git.edvin.torok@citrix.com>
 <63240681327af995df64b773945406b097a31d4b.1669829264.git.edvin.torok@citrix.com>
In-Reply-To:
 <63240681327af995df64b773945406b097a31d4b.1669829264.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BN8PR03MB4931:EE_
x-ms-office365-filtering-correlation-id: 42dc0c46-85c8-43b2-7a12-08dad3926725
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Dbp+ddymqczSwOnZtQtkp7Yr9LtRFH2l3GCtarlglT1vj7mM0QtDSelgVdlKV4xaKlZ/8GOBwvWDGzaEn71T8uEgXLMXvl6s+zjrfriMyi42J41VoTLbt9fttfUN09bKFZcYTzEBLm158gQI5xTApeMh90Pkm1Mx8hqEBFISDvAKnrEnYY2Q2hWtRX5JsF4l6M2WVcquHh800jkx0w74nyg6pVz1W2w9dyi4brE8MfeU8FyLNl4BdsWzDsoNRyUdHFH6XcFbruU6KupaLf06urHl+KCD22TY5PtnqkI0K1GuSWID5rfSXa7hmM4A1xA7EixcoBmzWVlii+gPUZmwYra1x6Xw2bZcPicGuWcVCI8LxX8HnIjuUh1LC16v0BIHRqBPncRhFah1gVNxg3CUYlBE1s+VMH+iZ9rQTkH+rGuidxI78sFzBr4h6aX3qIO1pkAMgfrYtfAH3t5xPfz07ByClrIe1pgeGwEGPpg3s8JyDNBXPt0CzR148TaDhyu7zugfxMgDNnKjBajwiJCGCygvmZCPIYlq4wgTLA9nrznMbrs1v1zsUlBq2+GeS3+KN+A3Z1eXeXBKqOK14UgxcsK9ENwFW1W0lfe4RCsNYIlUJmpg3rNhTfNjVoheeJv1SUIm7GywICYaE2X977j8Ve/FgY5Fwq1z5Qy5wxFvga7doPGPI57Hm81/OfAkFXRW7vuC9yLYNZYI50pK6Ne88VWoNCHzzAKi197Na6lSSiPfnj1IJPSJpEC5jR4LAPLfPL+1iA1zKMVafScrNZ7DeQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(376002)(136003)(346002)(396003)(451199015)(107886003)(6486002)(31696002)(83380400001)(6506007)(86362001)(478600001)(53546011)(31686004)(71200400001)(6512007)(316002)(41300700001)(2616005)(82960400001)(110136005)(5660300002)(54906003)(8936002)(66556008)(64756008)(38070700005)(186003)(91956017)(2906002)(26005)(38100700002)(66946007)(4326008)(66476007)(8676002)(36756003)(76116006)(66446008)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q3RQUXMyUGVBREhZOGk0eEJqbWxGWVdTeXNvS0hyN1ZyZDRYQTMyRmJNT3l0?=
 =?utf-8?B?UHVoTWJpRGFva2tOVkhPakZVRk8vSDdQTW9YT1p6K2M5TlFhT3VtL2YzcDF2?=
 =?utf-8?B?UjFSckpMb2p0aFhSVURSSmxORnJ4bCtJWG1naFZuQlg4eENjVHc4V3p1NUlV?=
 =?utf-8?B?RFRoNks5OUxOajNTWXMxQTNJdXEyeDlkYSsrSVRGRVV5S2o2Qlhma3hMZE04?=
 =?utf-8?B?d25IczNPM29kalZtM3N4bEZUNWxhTHBZM1Q2YTBEenRwd0t3MXZNT1RIL0V4?=
 =?utf-8?B?QUZ0a1E0Uy96aTlWWHd1UUQxS3BQTkxFUXBhemFKTWNxK2NrcHg4d04yaGpW?=
 =?utf-8?B?YStmZHF5YVMwenhyM3QvWWx5REZBUnB6VDZjWkszRHQ4MkZKbW1IYXFnU1Z6?=
 =?utf-8?B?QVNEZTVPZVZnVE1mOURLM1h2UHdQaUpvUG9Yb0xOWEQvVmNjUTlrN0dpclNF?=
 =?utf-8?B?YmowUnBydFVaa0YwWm94a0wzQWtkUEtZYVFjb1ppTkxtWFVjYUhTL0dpU1BD?=
 =?utf-8?B?SWFVTEFFdXA1dTVCY3JCWG5SZUFoV2JWR1hlVmk3MnEvT1JRQlMyWno0Y1dm?=
 =?utf-8?B?SUdVMWdITnZMRDY4dFQwaGNRZXRHa0RLSTRyK044NTBUOTZHOFdCSWJLUDNQ?=
 =?utf-8?B?ekcvN1JOMFpqTTRtNUpCUzdaOERKNXZWV2N4eDdWdjRONzNFbUhmckZpSjEx?=
 =?utf-8?B?Wkw2ZmRnUkljN09wQXpPcTlkbFNVVjBkL0dncTdDQVVTdXBqcEhrbDFBTUNq?=
 =?utf-8?B?UE82WGxwRzdLVThqc0lUUG5VZDJtVmNRVXNMWGZ4K0Z5UEtBUFRhL3JRdVVJ?=
 =?utf-8?B?bkJWUXBVbngrMjIzazhSeXdmVmtDK0F6NjhYTDExUjgweWVzVjBCSXVXeTRx?=
 =?utf-8?B?MFFLTjlMOHJTdkNNZjFHc0FpNXNlaTJLTlBhekxnU3JPZVp3SHNYNTdVNXJa?=
 =?utf-8?B?dE5TaUY2VTN2c29xT2J2S2d5STNMYUhORGdJSXZrNFBpckxvQzBjSXYrbVFx?=
 =?utf-8?B?U0dPMVZGWHkyVUx1RTBMYXJNMGtaYWdGckJOUlhRNG1UK1A2SkdkOXAyYUVB?=
 =?utf-8?B?QmtTa2NWWTJCZUNrWkFzcTRzbDF4TGpnR1hRWWRNS2dRRlU3UXdzUzhtaytU?=
 =?utf-8?B?eHJ2NGFHYVlnajVaTHlPTklKYjVQdjM5M2NyM2R2RE80MzN5Q3AxZWwyS2gv?=
 =?utf-8?B?ZmhTOXZ1SnVzZXE4c0wrem9nK1UyaUd0NFN5Sld0MnFlVjRuUXhjRnBzdTNt?=
 =?utf-8?B?V1h1bWZ5clNBTUlGZXp1MkZ6N243QVNaTW5hc0xjK21KMTRhazFrZVNHR05C?=
 =?utf-8?B?Q29XMTQ2NThhWnlPT3NhNFV1OHRtN0tGM1AwYWk5RzV0Q3g4MnNsSWRodFFr?=
 =?utf-8?B?UG5MVlUxOFFCeXhDYXRraU5aSnN3VWVXVVo5OWxVeXpIbGhEZzNlUE94MFNp?=
 =?utf-8?B?eldQeHJjb1NBQ25nOGM5Q2lYSkFpT1ZrdWI3UitmdGZFSXZYSU43RlpBWFVQ?=
 =?utf-8?B?Q2hRSm1wTE8wU1ZtUWpYa0thSjFlNWIzRHBtT20yTityWjc1ekZqZXdXcXhP?=
 =?utf-8?B?ZU13K0d3cHpUZjZ2RW0wbUZEaENOT3dWVWNxQ0xKQ2FCajE4b0pTVVVhZDhE?=
 =?utf-8?B?OER0Z2ErRU1kY0lMVk9qeTlqcWJhbHM1dDlUWlNrK01OSjNsdXpoQld5SlIv?=
 =?utf-8?B?dDdtdUpLUlU4d2xjaFVDdVlETktRK0ZOakpRaWMxZmEzSC9KaTVNNjR5QmYy?=
 =?utf-8?B?VjByOGVSalVjcTlpczRtaE5PdzNncFd5NlR1Y1kzSTNQMklPOS85K1IrdklZ?=
 =?utf-8?B?KzAzVVUrWkQwMlJaR0NPSklDcXBVajVKYUErSlBaNDhwb1N2ME9xVnlxaG0z?=
 =?utf-8?B?NTV2bmdtaU4rNDRhWmNScUVnRDNTR2YzZVphbEx0eXh4Q0xQVVQ1QUpoR3Zk?=
 =?utf-8?B?RXlkaFZ5NUlkb2JUdEhaWjRIQVJYNVJiWjRMV1UvanVRZ2M0cGVUMnlPNXpy?=
 =?utf-8?B?ekJISFlYdTAxdVBtSEV5aGJrWDNpcTNnUmVoNmYxSWxzVGdRaU1LRHpxeSt2?=
 =?utf-8?B?VjUwMXRlK0NlcjBrNFZoS2w4REFybWgzOGZmaGU2Qk05YVowRFZiRk1UZVc0?=
 =?utf-8?Q?kbQESK5nAssEU6BgUl57aOlqe?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4FA9C95760F0364EAE89230F3B34E819@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wToDpFpOKSuDWTaGbLuRwc8oGn+FqunxkWKqBLISBg9q7Cq0jrY8AhKtP+6JFa2hbwOQEDPEcZM7S8FwyWkS2u7bCT3M2eXLvIZ14uA5Ty0p6VclcnHZGJKVa4szQeFbb1Ydfq7ZloHFS/l2rN7xEVxXC8pgBVoepP61UnMmCH1M3LRYERE8aDfrzpxEu3H3zwu9MimN1pbm+XHvYogZhOArxI4uIYKpBJU3LFeKB7VCEhbWBhzksRHxZiPoOq3JQ9QnelqNbx3vZJsr0LFpJvNtposRjt4/R8CQr+EQeiNaBunuhv3NIHmucr1HYP9I725PSD/EvGfOCdq/i7dPSnATownQR/cte+dYINsMShyQU653ZXbUtIRHQYxxOmyjDNKeInggoSC7MhW2poMDNC5Hm9Ku0dIxeEuHDmP04Uts/zIzMUl9Ih5HZY2TALJD35fqH8q2k8LGBk54o5zfpsY1HwoIJd3Rol8uUdDGlgHBYvVgWWuhrtTfrM0uYd/2RcOS/xKx9EEFaGNw7FQDV0xKjGgKSVlEX1+lrDMq4l2DTsuGZX7aN9c4EOTXPdIBL1daOBWOaMhc2DdAo5ZqWzbeAQ1AF7W4rRjW/d/b4kHXy7i2M7ycgKGdN6jwRmH6+lnflNMmSSEEMaKZ9/HyqYRW9o+lQd5NlYzHMf+mO12mr8w5T3K9KjSzUeMlh+XHkxzpLWgQy6+I+KC2cZwgRIfhQIaf87brQWbUhBdlaD2ifkGX5W+3c8eHACc6y4CgzZ4pyDZviwir+6vIF1gjXWG3JCpT914qMrP7EADOQJTdIFHZV7+MEL/2dSO2kJXxoIgcx/3OTZi9AUgLJkeuQA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42dc0c46-85c8-43b2-7a12-08dad3926725
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 11:51:37.5229
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a8HxyEWtGTbC5rmD+QHm17tL9t7A7y2uvvLzOyoV3jt9Dc2lL9oLu9HPOftOyH46Nvs/ykdVJ5F6YAG/xGrSGc/+c6uqqY7t415SbLbjz8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4931

T24gMzAvMTEvMjAyMiAxNzozMiwgRWR3aW4gVMO2csO2ayB3cm90ZToNCj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbGkgYi90b29scy9vY2FtbC9saWJzL3hjL3hl
bmN0cmwubWxpDQo+IGluZGV4IDYwZTc5MDJlNjYuLmY2YzdlNWI1NTMgMTAwNjQ0DQo+IC0tLSBh
L3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbGkNCj4gKysrIGIvdG9vbHMvb2NhbWwvbGli
cy94Yy94ZW5jdHJsLm1saQ0KPiBAQCAtMjM2LDYgKzIzNiw1MSBAQCBleHRlcm5hbCBtYXBfZm9y
ZWlnbl9yYW5nZSA6DQo+ICAgIGhhbmRsZSAtPiBkb21pZCAtPiBpbnQgLT4gbmF0aXZlaW50IC0+
IFhlbm1tYXAubW1hcF9pbnRlcmZhY2UNCj4gICAgPSAic3R1Yl9tYXBfZm9yZWlnbl9yYW5nZSIN
Cj4gIA0KPiArKCogbmVlZHMgdG8gYmUgc29ydGVkIGFjY29yZGluZyB0byBpdHMgbnVtZXJpYyB2
YWx1ZSwgd2F0Y2ggb3V0IGZvciBnYXBzISAqKQ0KPiArdHlwZSBodm1fcGFyYW0gPQ0KPiArICB8
IEhWTV9QQVJBTV9DQUxMQkFDS19JUlENCj4gKyAgfCBIVk1fUEFSQU1fU1RPUkVfUEZODQo+ICsg
IHwgSFZNX1BBUkFNX1NUT1JFX0VWVENITg0KPiArICB8IEhWTV9QQVJBTV9VTkRFRklORURfMw0K
DQpDYW4gd2UgcGVyaGFwcyB1c2UNCg0KfCBfSFZNX1BBUkFNX1VOREVGXzMNCg0Kd2l0aCBhIGxl
YWRpbmcgdW5kZXJzY29yZSB0byBoaWdobGlnaHQgdGhhdCBpdHMganVzdCBhIHBsYWNlaG9sZGVy
IGZvciBhDQpob2xlID8NCg0KPiArICB8IEhWTV9QQVJBTV9QQUVfRU5BQkxFRA0KPiArICB8IEhW
TV9QQVJBTV9JT1JFUV9QRk4NCj4gKyAgfCBIVk1fUEFSQU1fQlVGSU9SRVFfUEZODQo+ICsgIHwg
SFZNX1BBUkFNX1VOREVGSU5FRF83DQo+ICsgIHwgSFZNX1BBUkFNX1VOREVGSU5FRF84DQo+ICsg
IHwgSFZNX1BBUkFNX1ZJUklESUFODQo+ICsgIHwgSFZNX1BBUkFNX1RJTUVSX01PREUwDQoNCkZy
b20gVElNRVJfTU9ERSBvbndhcmRzLCB5b3UgYXBwZWFyIHRvIGhhdmUgYSB0cmFpbGluZyBkaWdp
dCBvbiBlYWNoDQpjb25zdGFudCBuYW1lLsKgIEl0IGFwcGVhcnMgdG8gYmUgdGhlIGZpbmFsIGRp
Z2l0IG9mIHRoZSBwYXJhbXMgbnVtZXJpYw0KdmFsdWUuDQoNCj4gKyAgfCBIVk1fUEFSQU1fSFBF
VF9FTkFCTEVEMQ0KPiArICB8IEhWTV9QQVJBTV9JREVOVF9QVDINCj4gKyAgfCBIVk1fUEFSQU1f
VU5ERUZJTkVEXzEzDQo+ICsgIHwgSFZNX1BBUkFNX0FDUElfU19TVEFURTQNCj4gKyAgfCBIVk1f
UEFSQU1fVk04Nl9UU1M1DQo+ICsgIHwgSFZNX1BBUkFNX1ZQVF9BTElHTjYNCj4gKyAgfCBIVk1f
UEFSQU1fQ09OU09MRV9QRk43DQo+ICsgIHwgSFZNX1BBUkFNX0NPTlNPTEVfRVZUQ0hOOA0KPiAr
ICB8IEhWTV9QQVJBTV9BQ1BJX0lPUE9SVFNfTE9DQVRJT045DQo+ICsgIHwgSFZNX1BBUkFNX01F
TU9SWV9FVkVOVF9DUjAwDQo+ICsgIHwgSFZNX1BBUkFNX01FTU9SWV9FVkVOVF9DUjMxDQo+ICsg
IHwgSFZNX1BBUkFNX01FTU9SWV9FVkVOVF9DUjQyDQo+ICsgIHwgSFZNX1BBUkFNX01FTU9SWV9F
VkVOVF9JTlQzMw0KPiArICB8IEhWTV9QQVJBTV9ORVNURURIVk00DQo+ICsgIHwgSFZNX1BBUkFN
X01FTU9SWV9FVkVOVF9TSU5HTEVfU1RFUDUNCj4gKyAgfCBIVk1fUEFSQU1fVU5ERUZJTkVEXzI2
DQo+ICsgIHwgSFZNX1BBUkFNX1BBR0lOR19SSU5HX1BGTjcNCj4gKyAgfCBIVk1fUEFSQU1fTU9O
SVRPUl9SSU5HX1BGTjgNCj4gKyAgfCBIVk1fUEFSQU1fU0hBUklOR19SSU5HX1BGTjkNCj4gKyAg
fCBIVk1fUEFSQU1fTUVNT1JZX0VWRU5UX01TUjANCj4gKyAgfCBIVk1fUEFSQU1fVFJJUExFX0ZB
VUxUX1JFQVNPTjENCj4gKyAgfCBIVk1fUEFSQU1fSU9SRVFfU0VSVkVSX1BGTjINCj4gKyAgfCBI
Vk1fUEFSQU1fTlJfSU9SRVFfU0VSVkVSX1BBR0VTMw0KPiArICB8IEhWTV9QQVJBTV9WTV9HRU5F
UkFUSU9OX0lEX0FERFI0DQo+ICsgIHwgSFZNX1BBUkFNX0FMVFAyTTUNCj4gKyAgfCBIVk1fUEFS
QU1fWDg3X0ZJUF9XSURUSDYNCj4gKyAgfCBIVk1fUEFSQU1fVk04Nl9UU1NfU0laRUQ3DQo+ICsg
IHwgSFZNX1BBUkFNX01DQV9DQVA4DQoNClNpbWlsYXJseSB3aXRoIEVWRU5UU1RBVF8qLCB3ZSBv
dWdodCB0byBlbmdhZ2UgdGhlIGJ1aWxkIHRpbWUgQUJJIGNoZWNrLg0KDQpCdXQgdGhlcmUgaXNu
J3QgYSBzdWl0YWJsZSBlbmQgZGVsaW1pdGVyLCBhbmQgdGhlc2UgYXJlIG9ubHkgZXZlciBhbg0K
aW5wdXQgaW50byBhIGJpbmRpbmcgKG5ldmVyIGEgcmV0dXJuKSwgc28gaXQncyBub3QgdGhlIGVu
ZCBvZiB0aGUgd29ybGQNCmlmIG5ldyBjb25zdGFudHMgZ2V0IG1pc3NlZC7CoCAoTm90IHRoYXQg
bmV3IGNvbnN0YW50cyBhcmUgbGlrZWx5LsKgDQpIVk1fUEFSQU1zIGFyZSBhIGdyb3NzIGJvZGdl
IHdoaWNoIEknbSB0cnlpbmcgdG8gcGhhc2Ugb3V0LikNCg0KPiArDQo+ICtleHRlcm5hbCBodm1f
cGFyYW1fZ2V0OiBoYW5kbGUgLT4gZG9taWQgLT4gaHZtX3BhcmFtIC0+IGludDY0DQo+ICsgID0g
InN0dWJfeGNfaHZtX3BhcmFtX2dldCINCg0KSU1PIHdlIHNob3VsZCBiaW5kIHNldCBhdCB0aGUg
c2FtZSB0aW1lLsKgIEl0J3MgdHJpdmlhbCB0byBkbywgYW5kIGZhcg0KZWFzaWVyIHRvIGRvIG5v
dyB0aGFuIGF0IHNvbWUgcG9pbnQgaW4gdGhlIGZ1dHVyZSB3aGVuIHdlIGZpcnN0IG5lZWQgaXQu
DQoNCj4gKw0KPiAgZXh0ZXJuYWwgZG9tYWluX2Fzc2lnbl9kZXZpY2U6IGhhbmRsZSAtPiBkb21p
ZCAtPiAoaW50ICogaW50ICogaW50ICogaW50KSAtPiB1bml0DQo+ICAgID0gInN0dWJfeGNfZG9t
YWluX2Fzc2lnbl9kZXZpY2UiDQo+ICBleHRlcm5hbCBkb21haW5fZGVhc3NpZ25fZGV2aWNlOiBo
YW5kbGUgLT4gZG9taWQgLT4gKGludCAqIGludCAqIGludCAqIGludCkgLT4gdW5pdA0KPiBkaWZm
IC0tZ2l0IGEvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMgYi90b29scy9vY2Ft
bC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYw0KPiBpbmRleCA2N2YzNjQ4MzkxLi5iMmRmOTNkNGY4
IDEwMDY0NA0KPiAtLS0gYS90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYw0KPiAr
KysgYi90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYw0KPiBAQCAtMTE3Niw2ICsx
MTc2LDIyIEBAIENBTUxwcmltIHZhbHVlIHN0dWJfeGNfZG9tYWluX2lycV9wZXJtaXNzaW9uKHZh
bHVlIHhjaCwgdmFsdWUgZG9taWQsDQo+ICAgICAgQ0FNTHJldHVybihWYWxfdW5pdCk7DQo+ICB9
DQo+ICANCj4gK0NBTUxwcmltIHZhbHVlIHN0dWJfeGNfaHZtX3BhcmFtX2dldCh2YWx1ZSB4Y2gs
IHZhbHVlIGRvbWlkLCB2YWx1ZSBwYXJhbSkNCj4gK3sNCj4gKyAgICBDQU1McGFyYW0zKHhjaCwg
ZG9taWQsIHBhcmFtKTsNCj4gKyAgICB1aW50NjRfdCByZXN1bHQ7DQoNCnJlc3VsdCBpcyBjb21t
b25seSBhIHZhbHVlIGluIHRoZXNlIGJpbmRpbmdzLsKgICd2YWwnIHdvdWxkIGJlIHRoZSBtb3Jl
DQpjb21tb24gbmFtZSB0byB1c2UgaGVyZS4NCg0KfkFuZHJldw0K

