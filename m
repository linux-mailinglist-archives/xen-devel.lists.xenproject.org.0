Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E695F7E5E
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 21:58:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418255.663020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogtTn-0003tS-BI; Fri, 07 Oct 2022 19:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418255.663020; Fri, 07 Oct 2022 19:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogtTn-0003qi-8Q; Fri, 07 Oct 2022 19:57:55 +0000
Received: by outflank-mailman (input) for mailman id 418255;
 Fri, 07 Oct 2022 19:57:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PW8X=2I=citrix.com=prvs=2723e59b2=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ogtTl-0003qc-OU
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 19:57:53 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5286cb4e-467a-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 21:57:51 +0200 (CEST)
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Oct 2022 15:57:30 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6344.namprd03.prod.outlook.com (2603:10b6:a03:395::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Fri, 7 Oct
 2022 19:57:29 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5709.015; Fri, 7 Oct 2022
 19:57:28 +0000
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
X-Inumbo-ID: 5286cb4e-467a-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665172671;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=KV3BC7c7AkDoU8ohIWYMl6OirBPFWsYjUCGZ7KbiEQ4=;
  b=VBe1UJCb7CuqML7/Thu93epBQEg4K2bkx8XeVsPAzUi6rPdBRDc2iBWp
   AAdWT4G3YacggIiiQN1MI6sfx19N97xY5qD8TwKJOlmQQshqjxSsOB6s8
   BCgBVauLrrS/REWO9ApzJq5ScL2lSgjYgcOBBgmeqRD+TxfnKsarU+BOG
   I=;
X-IronPort-RemoteIP: 104.47.59.174
X-IronPort-MID: 82659519
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jhRuoK5AUEEu30Xpul9fWAxRtOLGchMFZxGqfqrLsTDasY5as4F+v
 jNMDWGAaPiJYTb3fd92aYyx9x4BsJ7dmIRjHFdopC00Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvymTras1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPewP9TlK6q4mlB5gRhPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c53DEV3y
 /MfEAorSQCluNPuye+kCdRF05FLwMnDZOvzu1lG5BSAV7MKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dmpTGMkGSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzXmlBdNPTezQGvhCmkCp72ANEEYqRXi9/dKZlHKMQeJ5A
 hlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWUVnC15rqStSm1OyUeMSkFfyBsZQkY59jupqkjgxSJScxseIaulcH8Ezz0x
 zGMrQA9iq8VgMpN0L+0lXjYhxq8q56PSRQ6jjg7RUqg5wJ9IYKgOYqh7AGB6e4addnFCF6co
 HIDhs6SqvgUCo2AnzCMR+NLG6y14/GCM3vXhlsH84QdyglBMkWLJeh4iAyS7m80WirYUVcFu
 HPuhD4=
IronPort-HdrOrdr: A9a23:jfeWPqilFi0gEna4hyUdeTOG0nBQX3l13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICRF4B8buYOCUghrTEGgE1/qv/9SAIVy1ygc578
 tdmsdFebrN5DRB7PoSpTPIa+rIo+P3v5xA592uqUuFJDsCA84P0+46MHfjLqQcfnglOXNNLu
 v52iMxnUvERZ14VKSGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3z8FOgk/gIsKwC
 zgqUjU96+ju/a0xlv3zGnI9albn9Pn159qGNGMsM4IMT/h4zzYJLiJGofy/wzdktvfrWrCo+
 O85yvI+P4DrE85S1vF4ycFHTOQlgrGpUWSkGNwykGT3PARDAhKd/apw7gpPCcxonBQwu2Vms
 hwrh2knosSAhXakCvn4d/UExlsi0qvuHIn1fUelnpFTOIlGfZsRKEkjTRo+a07bVTHwZFiFP
 MrANDX5f5Qf1/fZ3fFvnN3yNjpWngoBB+JTkULp8TQilFt7TtE5lpdwNZakmYL9Zo7RZUB7+
 PYMr5wnLULSsMNd6pyCOoIXMPyAG3QRhDHNn6UPD3cZek6EmOIr4Sy7KQ+5emsdpBNxJwumI
 7ZWFcdrmI2c1KGM7z74HSKyGG5fIyQZ0Wf9igF3ekJhlTVfsuaDQSTDFYzjsCnv/ITRsXGRv
 fbAuMlP8Pe
X-IronPort-AV: E=Sophos;i="5.95,167,1661832000"; 
   d="scan'208";a="82659519"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FxL2fFPDiRxbXkWj58LRuX2hxFRJxh5Nqbb5ye/7PjwrnywVeeb9nmepkJcopipPQd1SjSC4XamrmcQqBEEzkg8XBBGuJJGjY0lum7HMilofY8o9GhpVygSIXuOV1o+LIRlOUD+Sk13+01TAjhdjfxZsH0cd5uJjNwcWjVBs8rAAjrS72h21DgxxYfvD11I+4b947nyv07kej/+2TxDOlE9dU5AYHocso28k1u4VocbHftDcsyJqMkJocdYoMUPpdV6k89V6nsKhXOqfYKj7EWx/gB2EL4bpbp/CNZcX6gcSUlzgMUMfrIPCka186Lnhys0TxqD8OF3ybUtvltYhvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KV3BC7c7AkDoU8ohIWYMl6OirBPFWsYjUCGZ7KbiEQ4=;
 b=luEyM58TiOAYAAiQteTftwbQ9+OKZkyVrXVJJN8nJT394wGl0WR9e5i1dk/emFn9JjkoX7vTK36BG9M8jqalZ0zb9KPn9rRLA63uU1rMq5MsA4TZS+i2nHbO/Nmkos8iIf8ysfjidfSVbZbbf/PLDyxCV6vLr1PQUeqyVS7WrXL+hHzCYwFNG2rrHEVBT2otMBWKwCEE08rzTN5SJTYaMvLiQeeoIvyQB4VC7LEIWVvNITownHzZQxdmqJ+VKAr9iNXOdlyQ7ZAMTaOhsKw+RPgH08uc9Xmfr7WZQ0IJMbS0/qlu+dS7OVl+HwRUZqAaRwk916HQF0L2kRgDHhS/WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KV3BC7c7AkDoU8ohIWYMl6OirBPFWsYjUCGZ7KbiEQ4=;
 b=wqFFmFZt4I7IYcChHwtR8kqTxaTTXc3RJsdq2AtsBPxVmpyhUdUK/a9lPI6/9Hul1hAWuVypmh1HMgOs2X6dcwW+xtXVdLpSGSNhxJUDGMdT/H421UV0pFALC5UYf0/q/V6xZAW5As4ZeQEddFXHgF2L3hxJx/BYAJRsnCB86bY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 9/9] gnttab: don't silently truncate GFNs in compat
 setup-table handling
Thread-Topic: [PATCH 9/9] gnttab: don't silently truncate GFNs in compat
 setup-table handling
Thread-Index: AQHXmmNdHWNgMIrF1UaLY8uP4AWVM64F2UcA
Date: Fri, 7 Oct 2022 19:57:28 +0000
Message-ID: <c8b08c8b-0e2d-040e-32b7-0ca63c2908e6@citrix.com>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
 <c3f4d5ce-6ac8-1d1c-eed0-704354f8a5f7@suse.com>
In-Reply-To: <c3f4d5ce-6ac8-1d1c-eed0-704354f8a5f7@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6344:EE_
x-ms-office365-filtering-correlation-id: 5aa92053-3920-40e9-b1b5-08daa89e29ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 kIemQ+qN1xex4rkAjldk0C/mjMi2hIy2HfYfpvgIwS2SlibAyEHO1mKh/+nmNayDpbeahOWcozwtHYZ8jB77GaSuw8f3SeQmtpWM1dSKpIBosl1R3uE0boPI+JBoVAUo5Q++golUgYBF22r8cgiQ3jC0pPpMFS0bG6kRN8G+ddiuaP1+qMul02+Zta0YnCxeG+4IGXW3wnY8ikUpSlFdEGo5pVETReCu1DY9U/6YpSagCnTK853tO8Ltq78Yb7Nnl2CnZDo8vxr4h717KZj3ou+y7DORS0uQwGK2sSkeeJYaCgbJ7+o0wrAaFbOaQ+gsN0/YH4P9gLV5mXsMoMsYbjYcFumrDb9EMqSK40L+6qxArsEi0mBRzywmJPOTBgz02/HztMcxfG8Fnu5JaDbkI3l4j3A8e9lEXfnEPYlb08PCEUfEqRieoLaCS40vgaiVeHIp1+HafBYTkUC/IG00cdU6tauedLBwavCRhLPZZxm4K6sTkZcsumqrBdyddryMVYgk3wGnIGXczdItmlspjS/THUWN98Z5M3bCOCUR+0dAWSPbYrMqfgkHCn7+QqyRFmmXzUW0J2eH6JUpcuDN9tB6wb63paaOI7LGf5/liIRnaCLFS6CoKhs4Y1oUQ1+DgflWC2PjLyp1jv8Fbf+hH1WgYu++80jrb7p/FRr99yn9JZG7kxfO9IoalxQzZwj0jd467UK76dlTiNwzJXtvbFoU9MCUp8+VPWTQnojeJQQRik1nT4kh13z5kdX5B1aqnI9PcS0DJP37KI0/SsIH1XPfREpu9XX6JP1/cKnFo9RNu407v4SxZ6zbUm72kVwyyj6jXVyD6Cx22v2uLJhz5Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(451199015)(54906003)(83380400001)(82960400001)(38070700005)(2616005)(8936002)(38100700002)(122000001)(66476007)(4326008)(64756008)(66446008)(8676002)(2906002)(66946007)(76116006)(5660300002)(110136005)(478600001)(26005)(41300700001)(71200400001)(53546011)(66556008)(186003)(6486002)(6512007)(316002)(91956017)(6506007)(36756003)(31696002)(31686004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WEdBdG40MTJWV1A4dFNNT1pzR0Q3U0ZFMHFERXkyUlpVNHBFS2s3R0l2Yk45?=
 =?utf-8?B?aEFaNU1ld3BhQUF4LzRvTlovL29WRTV5c0NxSHFwaHRmb2VZOGlLMFg4Y0pT?=
 =?utf-8?B?dEJxejJXb2s3ZTZWMjVEQWhXL3l4Ry9OL25kOTRKYWVCUVdtZXhzRzJ0aEJa?=
 =?utf-8?B?ZXZHOUtBN1lSUm8vNTVZazRla1Uyb0hjRCtTS0FKYkM2czBKUzFXME9uZnJI?=
 =?utf-8?B?WUNqWnZDcXM2Z1B1N0dieWRXb0R2NmpkWGc2QkdaTmVuakJqUFVRUXNSZHVI?=
 =?utf-8?B?dlBEL0d4ajVGNGNYTmV1V2djN3NpQ2RkdXpMTmJQbE92WDkrTkkwd0wzQUpS?=
 =?utf-8?B?c2kyS3dnRW84MmJQU09mdWVOS3NyV0dEYmJiQ3hhTXlveFFZOElEMEFERGFa?=
 =?utf-8?B?TDczWTNEdnZOWUdMVXRzU0RqVDF2UlpYN2xpM1pmdXN2dGM2MWlRRnd1TGpF?=
 =?utf-8?B?Zk9YZFNHeTZkdzRnQ2Y1Z21NSnVwYkh2dVVjQkd4MUIvMGtHcWx5eFVUTGRH?=
 =?utf-8?B?emU4dk9xeFIyaHVDNFNHWGRudlBxYWJSQW5zRE96bkJSeitKYW9VM3VDOFVQ?=
 =?utf-8?B?MmxaT2VXVHhLMGJ3MU5wa0h4UnFxdkFWQ1YyRksvMnM4MDVYK2dIYUI5ek8y?=
 =?utf-8?B?RCtMb2xXUHlxOTZ3aVRTY0paM1BUbmZxYjlubVhXMGJONGp2QkxMM3NDbTlO?=
 =?utf-8?B?UjZEYmw4endXS2VycWdYcmFoM0VQWlE3NFpBSXV2SExVR2pZUlBiYjNORHdB?=
 =?utf-8?B?dFM1TEg0TjRXUXkxUlRJL0NBUzY5QWhxbXcxZUxUWGlvUFloWW1PdmlxRGpq?=
 =?utf-8?B?NWRSaWhVdm5HT1F4ZWRIbFo0U0hCcG1RY1VoclNxV1BNdHJOWUFsMXQyUUFG?=
 =?utf-8?B?SEhUclF1YWJtaElxRytmMTJvWDliNnhUcmp4MDBXU0huTVowM002eG8rUzVZ?=
 =?utf-8?B?SWRGS1RsTWQwOGRwdXFNVk5ueXZ3eFlxemx5aTYzUHliY1lVRWpHSXI3akZv?=
 =?utf-8?B?L0dlRTFWd2owNGM2QTFuQWVTcTdSOTFzekVKWEtPOHhNcHJZaW16YnRHQXZr?=
 =?utf-8?B?NFk2ZlhSUGIrUkhEOWFCZWdmRjlmdmpWVWpnRmsxRTJKNjFKL1FHTkMrYmM4?=
 =?utf-8?B?Ym1aNnJoMExxdDlKOHNFalhiSkVvUXhpVEpmcUdpa1dnWmtONHJiMkhhbXJ2?=
 =?utf-8?B?c2twSU8wVmFMOWFsNml0bStya3h1OWNSY25zK2laMitrazhXMlQ5bmZ1NWZ4?=
 =?utf-8?B?STFlTlMzSXVEaEJNWUJMV3NGNXdaV2RhRWRseXNhR25tYzBJTmd3d0VVRWZO?=
 =?utf-8?B?ZVBCZmtDMmdrUGNmdVBMMG1ibTV5N2QxWGlUQzlrUWowZHZrV1lVU0RTNDRx?=
 =?utf-8?B?VTE2Rys1NUx1RDNYUE55eFl1cHBiRFM1T3VaR1dPVlVVRXlDQXdtVFl2NlZF?=
 =?utf-8?B?MTUvOVpERi9HemQwWWRLYjZvbTRTMUViRCtBRlZjQjBnQUtxTHhoVVdWZ0Zi?=
 =?utf-8?B?Y01PZTA4Tkl0R212WTZibVdGeVFTTWcwZjFOKzVOSlVYUUZtbXhhTThsaUw0?=
 =?utf-8?B?RTBzY0dpNDVWTDFxWExBVDU3NkwvYnlRWHE5TWxNSkN2aHRpdjZtcFN6SzE4?=
 =?utf-8?B?VmtPVDE0TVA4RTNLS0pMbjVralVYUjAzWlFiR1hPNHY2azVKczZyZ2JiR010?=
 =?utf-8?B?N0JTcnc4QjBvMlNjVFFDaVlJaEc5UXJJZVFiUllMTTBua3hIczRTaVFlVGVB?=
 =?utf-8?B?OHo4ZERhdWhOTmQzaHdxMmpXL20rb2lLcy9lSy9OdWlLaDRESkZkZjB6NHhN?=
 =?utf-8?B?dXA5bzRUd29waXU1MlJlMnVJQjFuYlk0SXZPVWlmOExCUXJ1MFpha2gwcUh4?=
 =?utf-8?B?eFcvUHE1a3g1WkpnYTdRUmNpeGV3ZW8yOE5Mb2xuSlYvZHRUaGZMQ1JZOVB1?=
 =?utf-8?B?THhKVmJtb1I1SmVlUDB5eGdDcnZWNWNSYlpXb1lCOFpNUEhMRUdNVDRicVRV?=
 =?utf-8?B?QjVMTm84dHQ3STMxb0dKaHUvTHk2RjArdTA2NlpLRXprYTMrV2Roend5RHhL?=
 =?utf-8?B?Nnl0T2wzWTc1M3RPZXhHZVVid3lPVmxOUzk2aitRdnowVHl6eExlSlpEUVlu?=
 =?utf-8?Q?zqPxKmQqnkKsmjfgyZyCLiaxr?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB6701990F74D342BEB19D26865D8CE5@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa92053-3920-40e9-b1b5-08daa89e29ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 19:57:28.7579
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kVHBHEfY3dFYfxxtmDSRPDecfY0ATqAGtyngpEoDrvjlXH8O7K5azs7FRuoEChfSQLGYzNMyBIPgwDx8Qrr4KMa3jSHXPAZmedufhHLue+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6344

T24gMjYvMDgvMjAyMSAxMToxNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFJldHVybmluZyBiYWNr
IHRydW5jYXRlZCBmcmFtZSBudW1iZXJzIGlzIHVuaGVscGZ1bDogUXVpdGUgbGlrZWx5DQo+IHRo
ZXkncmUgbm90IG93bmVkIGJ5IHRoZSBkb21haW4gKGlmIGl0J3MgUFYpLCBvciB3ZSBtYXkgbWlz
Z3VpZGUgdGhlDQo+IGd1ZXN0IGludG8gd3JpdGluZyBncmFudCBlbnRyaWVzIGludG8gYSBwYWdl
IHRoYXQgaXQgYWN0dWFsbHkgdXNlcyBmb3INCj4gb3RoZXIgcHVycG9zZXMuDQo+IFNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gLS0tDQo+IFJGQzogQXJn
dWFibHkgaW4gdGhlIDMyLWJpdCBQViBjYXNlIGl0IG1heSBiZSBuZWNlc3NhcnkgdG8gaW5zdGVh
ZCBwdXQNCj4gICAgICBpbiBwbGFjZSBhbiBleHBsaWNpdCBhZGRyZXNzIHJlc3RyaWN0aW9uIHdo
ZW4gYWxsb2NhdGluZw0KPiAgICAgIC0+c2hhcmVkX3Jhd1tOXS4gVGhpcyBpcyBjdXJyZW50bHkg
aW1wbGljaXQgYnkgYWxsb2NfeGVuaGVhcF9wYWdlKCkNCj4gICAgICBvbmx5IHJldHVybmluZyBt
ZW1vcnkgY292ZXJlZCBieSB0aGUgZGlyZWN0LW1hcC4NCg0KWWV0IGFub3RoZXIgcmVhc29uIHdo
eSBoYXZpbmcgdGhlIGdyYW50IHRhYmxlIGJlIFhlbiBtZW1vcnksIHJhdGhlciB0aGFuDQpndWVz
dCBtZW1vcnksIHdhcyBhIHRlcnJpYmxlIGlkZWEuwqAgQ2hhbmdpbmcgdGhpcyBpcyBpbiBjb25z
aWRlcmF0aW9uDQpmb3IgdGhlIGVuY3J5cHRlZCB2bSB3b3JrLg0KDQpJdHMgZmluZSBmb3Igbm93
LCBidXQgaXMgZnJhZ2lsZSBhbmQgbGlhYmxlIHRvIGJyZWFrIGZvciBlLmcuIGFuDQp4bWFsbG9j
KCkgLT4gdm1hbGxvYygpIGNvbnZlcnNpb24sIG9yIHdoZW4gd2UgZ2V0IDUtbGV2ZWwgcGFnaW5n
IGFuZCB0aGUNCmRpcmVjdG1hcCBib3VuZGFyeSBtb3ZlcyBhYm92ZSAxNlQuDQoNCg0KDQo+IC0t
LSBhL3hlbi9jb21tb24vY29tcGF0L2dyYW50X3RhYmxlLmMNCj4gKysrIGIveGVuL2NvbW1vbi9j
b21wYXQvZ3JhbnRfdGFibGUuYw0KPiBAQCAtMTc1LDggKzE3NSwxNSBAQCBpbnQgY29tcGF0X2dy
YW50X3RhYmxlX29wKHVuc2lnbmVkIGludCBjDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBpIDwgKF9zXyktPm5yX2ZyYW1lczsgKytpICkgXA0KPiAgICAgICAgICAgICAgICAg
ICAgICB7IFwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdF9wZm5fdCBmcmFtZSA9
IChfc18pLT5mcmFtZV9saXN0LnBbaV07IFwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgIGlm
ICggX19jb3B5X3RvX2NvbXBhdF9vZmZzZXQoKF9kXyktPmZyYW1lX2xpc3QsIFwNCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaSwgJmZyYW1l
LCAxKSApIFwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIGlmICggZnJhbWUgIT0gKF9zXykt
PmZyYW1lX2xpc3QucFtpXSApIFwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIHsgXA0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmICggVkFMSURfTTJQKChfc18pLT5mcmFtZV9s
aXN0LnBbaV0pICkgXA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoX3NfKS0+
c3RhdHVzID0gR05UU1RfYWRkcmVzc190b29fYmlnOyBcDQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZWxzZSBcDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZyYW1l
IHw9IDB4ODAwMDAwMDBVO1wNCg0KU3BhY2UgYmVmb3JlIHRoZSBcLsKgIChUaGlzIGlzIG9uZSBy
ZWFzb24gd2h5IEkgaGF0ZSB0aGlzIHN0eWxlLsKgIFRoZQ0KYm9yZGVybGluZSBpbGxlZ2liaWxp
dHkgbWFrZXMgaXQgYWxtb3N0IGltcG9zc2libGUgdG8gc3BvdCBzdHlsZSBwcm9ibGVtcy4pDQoN
CldpdGggdGhlIGFkanVzdG1lbnQgZnJvbSB0aGUgcHJldmlvdXMgcGF0Y2gsIHlvdSdsbCBuZWVk
IGEgYnJlYWsgaW4gaGVyZS4NCg0KQnV0IGZvciAhdmFsaWQgY2FzZSwgc2hvdWxkbid0IHdlIHNh
dHVyYXRlIHRvIH4wdSA/wqAgSSByZWNhbGwgZnJvbSB0aGUNCm1pZ3JhdGlvbiB3b3JrIHRoYXQg
dmFyaW91cyBrZXJuZWxzIGRpc2FncmVlIG9uIHdoYXQgY29uc3RpdHV0ZXMgYW4NCmludmFsaWQg
TUZOLg0KDQpUaGVuIGFnYWluLCBJIGNhbid0IHNlZSB3aGF0IGxlZ2l0aW1hdGUgY2FzZSB3ZSdk
IGhhdmUgZm9yIGEgdHJ1bmNhdGlvbg0KYW5kIGFuIGludmFsaWQgTTJQIGVudHJ5IG5lZWRpbmcg
dHJhbnNsYXRpbmcuDQoNCn5BbmRyZXcNCg0KPiArICAgICAgICAgICAgICAgICAgICAgICAgfSBc
DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICBlbHNlIGlmICggX19jb3B5X3RvX2NvbXBhdF9v
ZmZzZXQoKF9kXyktPmZyYW1lX2xpc3QsIFwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpLCAmZnJhbWUsIDEpICkgXA0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIChfc18pLT5zdGF0dXMgPSBHTlRTVF9iYWRfdmlydF9h
ZGRyOyBcDQo+ICAgICAgICAgICAgICAgICAgICAgIH0gXA0KPiAgICAgICAgICAgICAgICAgIH0g
d2hpbGUgKDApDQo+DQo+DQoNCg==

