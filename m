Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A7F65DDC3
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 21:39:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471476.731333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDAXs-0001ii-1v; Wed, 04 Jan 2023 20:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471476.731333; Wed, 04 Jan 2023 20:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDAXr-0001fu-VG; Wed, 04 Jan 2023 20:39:31 +0000
Received: by outflank-mailman (input) for mailman id 471476;
 Wed, 04 Jan 2023 20:39:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tpAs=5B=citrix.com=prvs=3612a7559=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDAXq-0001fk-Ec
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 20:39:30 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e192caec-8c6f-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 21:39:28 +0100 (CET)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jan 2023 15:39:17 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5536.namprd03.prod.outlook.com (2603:10b6:a03:28a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 20:39:15 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 20:39:15 +0000
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
X-Inumbo-ID: e192caec-8c6f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672864768;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=sc0XT9Feq1UxpfZT/2AWJeldbgWn4KYN/O8SA/SfGkY=;
  b=PVZX2Jjkq66m/fMYx+Urm98UWfhkdtQnAYxtrC/w5udQkG7/y4Xl7ULt
   OUdRd8ZIJOIh+S/XakR7J9SXjFNMQcZxfd3PAFTRppCbCeL2xPFztuhk3
   Yf0JWyFr2SBXJ0skEO1LykpXGOy3cwz8Bqj3wziYcXqTKTIwoL4TW5SDf
   o=;
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 90692786
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:OgHOX6CnV+2UARVW/9Piw5YqxClBgxIJ4kV8jS/XYbTApDwr1T1Ry
 mFOXj2HO66PZmf0LdFybIrkp0xV7JSDz95hQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6p4GpA4gRjDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwvdcvH1oQ2
 tgiKCEraQ6hjO+Wmu6SVbw57igjBJGD0II3nFhFlGucKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTL++xrvwA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE17eRzHmkCNx6+LuQ+dlvunjD42MqBwAZD0CHv7qdr2icVIcKQ
 6AT0m90xUQoz2SsStT+RBy55n2ZpBkXW9lXO+I/4QCJjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+fpCm+PiU9JmYYaSgJCwAC5rHLqYUylQ7GT8wlHrS8iNb0Ahnvz
 zvMpy87750IltIC3ai/+VHBghqvq4LPQwpz4R/YNkqq7wp/YJOubqSy6Ebc9vdGJ8CSSVzpg
 ZQfs82X7eRLCI7XkiWIGb8JBOvxu6rDNyDAi1lyGZVn7y6q53OoYYFX5nd5OVttNcEHPzTuZ
 Sc/pD9s2XOaB1PyBYcfXm57I51CIXTIfTg9as3pUw==
IronPort-HdrOrdr: A9a23:hkTIm6F8dFtNkd+bpLqE0ceALOsnbusQ8zAXPiFKOGVom6mj/f
 xG885rsCMc5AxhOk3I3OrwW5VoIkm8yXcW2/h0AV7KZmCP01dAbrsD0WKI+UyGJ8SRzJ866U
 6iScRD4R/LYGSSQfyU3OBwKbgd/OU=
X-IronPort-AV: E=Sophos;i="5.96,301,1665460800"; 
   d="scan'208";a="90692786"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXAkCERYUBIMESk0mZoQI89fMv4J202QTv2dALiKL51QYA+hn6/nwCtRTktJRgpO1Ajg5A9DQdo+p+YGMA13oZ3o2prr11HrnG0UcKXrugfzb1Py605F+tm67cAYTwYMkvhHqrnuR9TXFwLcXuL/kvIc/EzRCKK4dIxEKcq1gSiwJu9zfRo2Uhtb+hnzX/ew7Autsf4OyzHjOgCWWRKvk9CCZbxI2A2/WEQoWBoQukxhp+idLSvepv+KKKTQCBCWAZumIpDsaUAeASkEnof4BBIjA6kkDrqGxG/sq+s5unVQMvCJTERGkCeIkC3e4ljZyGpZLxnHJSqUhQdS+B9YNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sc0XT9Feq1UxpfZT/2AWJeldbgWn4KYN/O8SA/SfGkY=;
 b=l6mLlIJOhx2JdRVYYtPymbdOxqvNUwBq3jnh3yCBMmhrMM2BI/GXlz6RUDxmF1TCq8RggrBL1myzsjaAsCGMvkhGX0aTtlzbJPzaw97VhaqjsQjNihpvhUuwVnQyrIe+9riXiprvuzBfLHIA+PKulRsiPxUbJBESNurLjSXtQM5VM9Ws3bZluQPmPW0+RD6Ri3Oa3cRBPUTIQVqtQBXZLHdHDv8pJbEd/xRihDBkFQZOx28Hexk8LadX9uPdXTwJTSlNIew5KsoOTS0BMSn+b+RCmbDkpgjw0WLZP6N4zUgp5+/3b3x5etqDqdPeCb3uO/HluwZuS86TuIWL/FtSpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sc0XT9Feq1UxpfZT/2AWJeldbgWn4KYN/O8SA/SfGkY=;
 b=ZilPj/lFOkgGHdcich8NksKQJDe4V+tc4xoELLeAdJieyGTWnb3Mm4SLU6DHT2qUS8D2WEiRkyW6X+ri8ldiFVfRmHXFV5a5X9fiSNAP8wg5cgUTxqNBkcLuML6PXd7s+QeTXQ5RI9/fMFrGujQzlxwR4BHh5GAkWfo/DbaDD3k=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Alistair Francis
	<alistair.francis@wdc.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>
Subject: Re: [XEN PATCH v2 2/2] automation: add RISC-V 64 cross-build tests
 for Xen
Thread-Topic: [XEN PATCH v2 2/2] automation: add RISC-V 64 cross-build tests
 for Xen
Thread-Index: AQHZHE7hYcTjVcm+Z06GDSck55kIla6OwJqA
Date: Wed, 4 Jan 2023 20:39:15 +0000
Message-ID: <f05a72a7-9991-ed31-8174-596d5b3f8145@citrix.com>
References: <cover.1672401599.git.oleksii.kurochko@gmail.com>
 <855e05a0459d44282679f08c8f67e38d35635eb6.1672401599.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <855e05a0459d44282679f08c8f67e38d35635eb6.1672401599.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5536:EE_
x-ms-office365-filtering-correlation-id: 7ebd50ec-df32-4e86-c65a-08daee93becc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 B0k6utREynH7vg5J5NtwF9ZkjCfrzG/ENqmMjCwkU24eU1hZZY+UFmksPR+w2TDvdGhvm7mBGWlDEqarD5nZ4jNeZ4etMwSXLc8GU/K53iMJvcHLbEjpm90+LzGB2NfH55bwjcEwVVGr4/zmhZyf8JMw0mdErLaaMxE8vW8mHM85AQXMN1lp2joU5Q93USv2qr9BBeEOZqPQqYFed5A75o5jqGuBynvzijkZ2DMzQq8o4GyxGrT2Eui2k1kkAoS8M6HdD3BSe0AfyMiBfUESG+laYarlltDEu/oeY/akn824h5l0FtN22KtNgEghyMiRhkf93JiLDsfbX2/YPcSmoWDj9jqKHTz1HtVfLKMks8YwcNIRqNROaQzXo/upAIhlorCDykqV9BVJOuZQ8uqPyfURNV06/6Pi7Dq+1Hl2yBjf+bieErQ0RMN6D0/F93AW4tzyeM9nfI7PppXvLs8We6cgvaTHXNnDSlQozxypI9tFi3AsqSUu6xh1OdIW0al8Vj8pnujm2Gfn8+KIAlzJFJU+nJRgQdUbd1eTkKBHLrpZF/v1eLFa0E5w1gBVAHqbY4hrKCcN4SnXbtjYtD/7fqPhN0Ap3WHwNtdpJuUFE5u8CsjHBXe9nRDxWPgo3JByAkOXNYZkQAfC8muidg8vtjutzmrfNflqznDpDJ/R7D6DGsDvZPSfltTT+Sw8+RY70wf07/zA19Pl+yQIvbAcHU3GnhbD+yxYhpOs2EYQJIwztB2knYX5pepNURp46yFlW5qEitx3YPEq47z4AicTIQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199015)(2616005)(82960400001)(6512007)(186003)(26005)(38070700005)(38100700002)(31696002)(86362001)(36756003)(122000001)(2906002)(110136005)(76116006)(5660300002)(66556008)(91956017)(66446008)(8936002)(66476007)(64756008)(66946007)(8676002)(4326008)(316002)(31686004)(54906003)(53546011)(41300700001)(6506007)(478600001)(6486002)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K3Y0TlFTM0p6clhTSTRhc1ltVVJrMHFpczFQRVVIdWdtTEI1TG1vS2x3emZE?=
 =?utf-8?B?bmpReUxJc1Yyd3U5UUNaSnh6dE5rTjI0b1VmTTh4U0hoNlIwdEdVN1M3NWEx?=
 =?utf-8?B?R3ErcjNoaEZTRGpCVnpaK043Ny8yS1dQSENzN0ltZ25WS1JyYzVpTDVmd3kv?=
 =?utf-8?B?RTc5N00wb1BvRUUzdUpjbk5nUDhqL0VmQlZ3TGluOCtzdTBCMVhCYzk1REIv?=
 =?utf-8?B?dHAxMHUvVXVNYldoY2ttMlRTQ3N0Wm5NK0lZYjZSNk5aSzExSDRrK0JYTFZF?=
 =?utf-8?B?aVdLYlJUelN5YTdybkUzQlhUSmM5Q0JsNFJjVHJoUUFKYjRtTlo0RlNEd1pT?=
 =?utf-8?B?cUIvZXZCOHhvNllIaS9PRlNzR2hnSFV1aGsydUVyeE5Nb09kMUVITHVHSGhj?=
 =?utf-8?B?Y0R0RGI0OGhqcHdpOERvUmZWTHBzSWtvbW9lMkxVQTJmNDJUUjBWc2ljNWFO?=
 =?utf-8?B?MkJjOE9uTDRhM3lHL3UvUEdiOFcxbGRndWRmalg5WXpab0lYdUYwVHJsanBZ?=
 =?utf-8?B?Q0NzMmxvUGFEREdvcVNQaC82UHpHRVpTS0Z4N0RYTXVKL1BFOW1TWDRpcGM5?=
 =?utf-8?B?TXBlaFdxa2JCMUVrTjdJbFVlTS8weWgyY3YxYjBNZ25XekFxZzdmZjRjVkZx?=
 =?utf-8?B?cmE4dm9lOVdtbHh1RkRIcFM5QWZrUlk5K3MycFdDUjgvNjJSQWE0d0x1U1Bi?=
 =?utf-8?B?U2RTZkJaMVp6WExFQ1lycHR6dmNucTFHamNkdFhSLzZPWklDQ1NnZHozZkds?=
 =?utf-8?B?ZnVmUTJHY2NjelQ5WXY0LzEwT0htT29aandjYVYzOS9hWGdINUlsTjdiWjNQ?=
 =?utf-8?B?elp5SUN0bWQ4M2xLUUZteTl1dDBsV0NPT0xPam1KamFlaWtKVzd4Q0o1SUNq?=
 =?utf-8?B?c0ZEa3RRYmlZME9hS1hCdzFnWjdyRDFHVkVvUHRwNGFYUWwyZEV0VktTTTV5?=
 =?utf-8?B?OUxENEFRZ1hwSVJFK3Q5bG9RV1JhVkpXZ3BvSFB1QWlXYk9scThPWnVzeFVZ?=
 =?utf-8?B?VkNPZkkrNzk2cEpTWDNHdGc5czdnY05WTC9XSVErbVEzRm1RMXZFalY1RFdj?=
 =?utf-8?B?Y1JuZFFCbjJRTEVxaVhPZzBaeGFLZnp0bTErYU1Hay9ja2VDMFJIRXJPMTZB?=
 =?utf-8?B?OERTVGlWZVlVcjU3aGY3WlJrZmRISEhvcUR0MVk0Q2p3U05SbU04eEtxRmpP?=
 =?utf-8?B?Vjk3alJwaFBoMTNja3FsM1NIeE5TUm93WFdGMlRwTGVFUjI3V04wcHI4REdU?=
 =?utf-8?B?OGNXczRaR1hRSDNFNUo3MHFwUjk3STBxWlRHWUo5WXBvbjEzNjJLR0pqV1hq?=
 =?utf-8?B?ek5ha0UvVHk0dEtqRmhDRmh6YVQ5WStYTlptNDdEVXl2S205R1E3VFdweHVa?=
 =?utf-8?B?Y0JyVEZWejBpdlF4cE1oVUxVcS9ma3g0cmNFM0hoakVoQUhUdXZaYXlmTzVT?=
 =?utf-8?B?S2pMTXB4S1lVSEIvczdKRGNJd2NEcXBKelRGUnZPZ1NxOHMwVGFZRGtTSXdv?=
 =?utf-8?B?cjZ2SGpROENqMzB6WW9hRmdvcGJnMXVHZ2FsTWsyS1ovRGFPMnIxSVZ1OVA2?=
 =?utf-8?B?N2xpR1JjYTV0UTZyR2JaNUk3U253UUd6eFJSSlNYNm1sRFNic25VdjdQckE5?=
 =?utf-8?B?c2FWSlE5a2d4dXVVNFhuMUs3NlRqTHBzcVpJT3ZRUFYxTkx5NWVqMWZCM1JJ?=
 =?utf-8?B?NWV5NGZSVFZTMlNwaHZTR3JRbGwxT0VpM3M0WlRlNmNVc1U5MU5mcHEzYU5z?=
 =?utf-8?B?aEthUlJncVptTVE0eWRhSmNDY1oyb3FHMkVrdG5ITFNUVGVlbUdpS29URkh0?=
 =?utf-8?B?Q3N0U0NieTdub1RCTmMvM1M0d2ZXalA0OHN5WFFQbUhrTUJwb3BpRGhpSlVI?=
 =?utf-8?B?UVZGL3ZJZU5DWEMxTk5lKzQzUEN0eVZWMWx0VTFhaGlXNmFRamExYS91aFlN?=
 =?utf-8?B?a3lVUyt4cDJVRjRjS0RJTFRncThKclRaR2lDRU5VRE5zN1FXS3g1S1p6ZmJP?=
 =?utf-8?B?MW15SHBPRXZTQmZkdC9kMVovUjF0cUVYK1NtcTVmWVlpUWtnbWNIcGF4UmhQ?=
 =?utf-8?B?ZkJKUjBPWDBzc0VPeFNVREFPUHdrdm54QnVrT3d4WlVCNXA5RDFieDM1Ymt1?=
 =?utf-8?B?ckVTd09nYUZDb0pNZmQzR0pldUR2VkFQOGJxNGI0eVpWVEthY0pSdlhHYmRw?=
 =?utf-8?B?YlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8398A85E667F5440BD462359DE261F31@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nT6PAZHd2nYbfTWi2xKEgMW08Z3ryxLXRnoaaXafRecHNaJSp/m+MJB+qSnFmlQMxrpuRcbmEGFoyxiYz5VLvKVEupS4JlbOi3inF9S0UOgYzlmDXP28vRaKqz+Q55zyjXu6g/Jeq5DopthB30hI8ADZa5f1YXIY84JaxWBH93cb2P2fP0H57VWqjl3iyvamu/Q71p2z+4v9YZ5JJewp6do335MFNlamRolsZEm+2Osv2Qd6aChKd07UZuWUG0+6+gZ6AccwaslIZFxQ1UKhWFoTQyBiTDh+7Zv0mjKXtbjneoXV6iPWPn8vSr1d7w4gLKILEpq045RrqxL9ypSbskP+TH0Ska5cPSNf597xRyUh4FxnT+nwDo3uQIGlRxdiAU+0tCn2+o17lmdzIrN8G3SM0qkbhVs0IKX+jLh68ywJQo6e3n43sBRRhHwplTlebmf+CHc5ZS0zW/q087edpjoSzp8vQCyxASysBrS+087i0ujBTJlsE1kZilx4gpBNqT5FxZj87yT9eqPlls4H1vDYfbD9gdFs2JR/tRj6Z5ZcGvnZJlkOZ+5j4Wmkdr6Y5p8idyiP3UmaTNM6gjx7tAKBT5l6m+eKAFWIZD0Kkux2mFt9P5F/eLREewGujlnDudNw5K/UO9fiPc/OddeCAlGEQzXLdgA93CG3Ati6dieh/JJoUiXDjbPmo39lPcpx4EoQh4RnNaaXqpt3oQKV3lyQryPx925XczddbqsCtjb6OKIftyhb/2IzNOMvIzSnm12eBm0Q0i5IoegG7r/PMzXOGSa2SJLXzIA6thGXEgB96EdpjyorPfacx/iInmy55qC+y5m0m6UOpQqAqihjXzn9Sl/rgdpkD34n8js4teL1+4cNU6sH9EtRrovAAShtfqHC883dIIpHQlBDPWLHeeyrda0deMRd69MlewoTLK4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ebd50ec-df32-4e86-c65a-08daee93becc
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2023 20:39:15.4884
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: le90nfdN960ELi0TTiLjll5Moe2rvjD+GHCDJHXS4vZFhuNiH2WQ+mFphsk++eE0bBxRGfYOxwNjiUXXZl7WIuj64UjOeJohyyz7iyRVwKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5536

T24gMzAvMTIvMjAyMiAxOjAxIHBtLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOg0KPiBkaWZmIC0t
Z2l0IGEvYXV0b21hdGlvbi9naXRsYWItY2kvYnVpbGQueWFtbCBiL2F1dG9tYXRpb24vZ2l0bGFi
LWNpL2J1aWxkLnlhbWwNCj4gaW5kZXggZTZhOTM1N2RlMy4uMTFlYjFjNmI4MiAxMDA2NDQNCj4g
LS0tIGEvYXV0b21hdGlvbi9naXRsYWItY2kvYnVpbGQueWFtbA0KPiArKysgYi9hdXRvbWF0aW9u
L2dpdGxhYi1jaS9idWlsZC55YW1sDQo+IEBAIC02MTcsNiArNjQ0LDIxIEBAIGFscGluZS0zLjEy
LWdjYy1kZWJ1Zy1hcm02NC1ib290LWNwdXBvb2xzOg0KPiAgICAgIEVYVFJBX1hFTl9DT05GSUc6
IHwNCj4gICAgICAgIENPTkZJR19CT09UX1RJTUVfQ1BVUE9PTFM9eQ0KPiAgDQo+ICsjIFJJU0Mt
ViA2NCBjcm9zcy1idWlsZA0KPiArcmlzY3Y2NC1jcm9zcy1nY2M6DQo+ICsgIGV4dGVuZHM6IC5n
Y2MtcmlzY3Y2NC1jcm9zcy1idWlsZA0KPiArICB2YXJpYWJsZXM6DQo+ICsgICAgQ09OVEFJTkVS
OiBhcmNobGludXg6cmlzY3Y2NA0KPiArICAgIEtCVUlMRF9ERUZDT05GSUc6IHRpbnk2NF9kZWZj
b25maWcNCj4gKyAgICBIWVBFUlZJU09SX09OTFk6IHkNCj4gKw0KPiArcmlzY3Y2NC1jcm9zcy1n
Y2MtZGVidWc6DQo+ICsgIGV4dGVuZHM6IC5nY2MtcmlzY3Y2NC1jcm9zcy1idWlsZC1kZWJ1Zw0K
PiArICB2YXJpYWJsZXM6DQo+ICsgICAgQ09OVEFJTkVSOiBhcmNobGludXg6cmlzY3Y2NA0KPiAr
ICAgIEtCVUlMRF9ERUZDT05GSUc6IHRpbnk2NF9kZWZjb25maWcNCj4gKyAgICBIWVBFUlZJU09S
X09OTFk6IHkNCj4gKw0KDQpKdWRnaW5nIGJ5IHRoZSBLY29uZmlnIHdoaWNoIGdldHMgd3JpdHRl
biBvdXQsIEkgc3VnZ2VzdCBpbnNlcnRpbmcgdGhlDQp0d28gUkFORENPTkZJRyBqb2JzIHJpZ2h0
IG5vdy4NCg0KPiAgIyMgVGVzdCBhcnRpZmFjdHMgY29tbW9uDQo+ICANCj4gIC50ZXN0LWpvYnMt
YXJ0aWZhY3QtY29tbW9uOg0KPiBAQCAtNjkyLDMgKzczNCw2IEBAIGtlcm5lbC01LjEwLjc0LWV4
cG9ydDoNCj4gICAgICAgIC0gYmluYXJpZXMvYnpJbWFnZQ0KPiAgICB0YWdzOg0KPiAgICAgIC0g
eDg2XzY0DQo+ICsNCj4gKyMgIyBSSVNDLVYgNjQgdGVzdCBhcnRpZmljYXRzDQo+ICsjICMgVE9E
TzogYWRkIFJJU0MtViA2NCB0ZXN0IGFydGl0aWZhY3RzDQoNCkRyb3AgdGhpcyBodW5rLsKgIEFs
bCB5b3UncmUgZ29pbmcgdG8gYmUgZG9pbmcgaXMgZGVsZXRpbmcgaXQgaW4gdGhlIG5leHQNCnNl
cmllcy4uLg0KDQp+QW5kcmV3DQo=

