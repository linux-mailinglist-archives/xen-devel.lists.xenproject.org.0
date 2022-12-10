Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 359E26490C2
	for <lists+xen-devel@lfdr.de>; Sat, 10 Dec 2022 21:56:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458672.716495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p46sn-0000uv-FV; Sat, 10 Dec 2022 20:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458672.716495; Sat, 10 Dec 2022 20:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p46sn-0000sq-CJ; Sat, 10 Dec 2022 20:55:41 +0000
Received: by outflank-mailman (input) for mailman id 458672;
 Sat, 10 Dec 2022 20:55:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DNjY=4I=citrix.com=prvs=336922010=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p46sl-0000sk-R4
 for xen-devel@lists.xenproject.org; Sat, 10 Dec 2022 20:55:39 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe01941d-78cc-11ed-91b6-6bf2151ebd3b;
 Sat, 10 Dec 2022 21:55:36 +0100 (CET)
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Dec 2022 15:55:34 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB6174.namprd03.prod.outlook.com (2603:10b6:5:399::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Sat, 10 Dec
 2022 20:55:32 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.019; Sat, 10 Dec 2022
 20:55:32 +0000
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
X-Inumbo-ID: fe01941d-78cc-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670705737;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=TDXYeNHqHUbHC2LgQM+ZgEr8asxi3iY11N8c/YgZkD8=;
  b=atjAJ0WBLUQHkBjneK0jAFsZ6fUYMI0t6wo5Rs6Rh7qDCWAuweKWG0qs
   Z1hY76kWzBQ6ma2rBEQ/jCS+EmiXyJDhTkwEGcwcszQAB2WLrDI2cMgC9
   TIbdgeqmcE7T4xhDbi+R6yQgpaPWexVwFmyInUGcJTKQU360zF3pKS94K
   c=;
X-IronPort-RemoteIP: 104.47.57.168
X-IronPort-MID: 87243935
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:XBf24qucFdwCCTzeL0abkGbCsOfnVGZfMUV32f8akzHdYApBsoF/q
 tZmKT/SafmOZ2SnKIx/O43lpEME75/TyYQ3HFRsry5nQylD+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QWHzyFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwI3cqQx29t+iMzLe6CbNg1pkPI5TuM9ZK0p1g5Wmx4fcOZ7nmGvyPyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osj/60boq9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPO3nrKIx0QbOroAVIDtIbwWyjeeLs1K7d4pGK
 UgJ5xYx9YFnoSRHSfG4BXVUukWsuxcGXtNKHu4S6QeTy7HV6QKUGmgFSDFabNUs8sQxQFQCx
 lKP2t/kGzFrmLmUUm6GsKeZqyuoPioYJnNEYjULJSMa5/HzrYd1iQjAJuuPC4awh9zxXD31n
 TaDqXFng61J1JBbkaKm4VrAnjSg4IDTSRI47RnWWWTj6R5lYImiZMqj7l2zAet8Ebt1h2Kp5
 BAs8/VyJshXZX1RvERhmNkwIYw=
IronPort-HdrOrdr: A9a23:owyyJqNYB/Rnl8BcTtCjsMiBIKoaSvp037BL7S1MoHluGaalfq
 +V7ZcmPGDP+VQssR0b9+xoW5PtfZq/z/5ICOAqVN+ftWLd11dAQrsC0WLq+UyEJxHD
X-IronPort-AV: E=Sophos;i="5.96,235,1665460800"; 
   d="scan'208";a="87243935"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CiMNeWxZbF0g5L0ddu1KijcmKt4wcb+pR8M11sfeppaQQBgpkypGS27vWCiHhep9eGdApYnbZVMiynAezPf334jmRJ0Q/6MEWQUeAPhr55Y9O0c1ztIorRLtsGyPux7FvrxVm+w2KWU3Lph1w2W1laA3/T4LVCXnOqCktYH2EwmSMmXus3vSe+QfGiTVxN6w2YdZzIRMUN8JxIjxWEpW1HQyxjaNlvtb8yzGSImvMHL3fvnJ7o3cCRSxvoNvYFuvIuD3NzwbMcbTA51elxnoc4dS3gXmX/s4GCZcKagWYkFcybMkfwfa3SgvKYTCI8mCwjy3KUfHCKSfcOb4PVbmEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDXYeNHqHUbHC2LgQM+ZgEr8asxi3iY11N8c/YgZkD8=;
 b=CCQ7behzbqJvTP0HfxnPH/b8flDMQe8TxfAvvOz58AdRPP/9tYlkm3/mDylYqck8JPwSigKwEWwhKZgx1rI+Ng3kYhZyx2Ah8bRhmtMC0fTVicqjFIMZUdm94pM8hQdzCqemGfAJ7UOUEKTQ2NLWJgjbX11Qr2QE6f7VA9lXS6Dp56LzxdWwUNyr7pDR5LE1mN540DgVJf9b8o0bvkfCQocflAcZXcmMw2L//77RoKz0+qMy12qNSQJ1PVbuHEUwGqSBedQc/k5GZ00nb4ATefWFdpHvu20WETGUh9o1V5jVf2M2P4/FKUn/QXmRAkWMffL1EVBxVCUbzt0ROZTOtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDXYeNHqHUbHC2LgQM+ZgEr8asxi3iY11N8c/YgZkD8=;
 b=tByPonM+WCAxw1B4eUXEVyQLRZQCfq0oA0qAxAnEn1zB0KR/9/z3y4Oa57+9V88el/l5ZWCBFvYWR89lyEh6s9Hzlw0a+wtleTmnFX2KHihFPJK+krjsVzMOXWA8AAuiuF+0Y2rO5B3G52xPZmJcbPyoXxlzq24M3jWbyJRHt8U=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH] docs: do not install .deps files
Thread-Topic: [PATCH] docs: do not install .deps files
Thread-Index: AQHZDNgk/8XB6b4nJk6dtaPmWjQlsK5nmcqA
Date: Sat, 10 Dec 2022 20:55:32 +0000
Message-ID: <c7f04941-12c3-215b-2642-80b096ecd2d6@citrix.com>
References: <20221210204258.3153703-1-marmarek@invisiblethingslab.com>
In-Reply-To: <20221210204258.3153703-1-marmarek@invisiblethingslab.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DM4PR03MB6174:EE_
x-ms-office365-filtering-correlation-id: ae965a66-8481-49e6-e411-08dadaf0e095
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 M2q3Y8hA+GdAB5HijRr6ywNluAKzl72RMh+zU+CVoSH7+RWCKuRX56XROJy6tn7yC9JMPUEex6UNSO0SYG1pjUgCGa64+KV0FPN8H+loQYTN1/Ox8FFgS1+d0JLQXHlzqh+QbGD3h9V34WUrFVswcRm+ear9zrzBmLrKbyRB+h3S9mvt4su5LDdoRvHEG7uPT4NFDgKcmsU/Stw6b/3wvrKW9D8wNa5LCHXOZ9w6bdNcYO2m7JGGp7PZXOJCj7vSdsWXhQK4kDD17SBTwJgCl+KxbToWLZe73D5XSXUFIf5rDF4YQunI0NrqFRMuk1iMsFuq0LYzIcrsoDFbLEjQBoVOIcPIXSC2tDuj315r4TwspNwo/xWlqcTzO3kdvtt1KBiB4mq9XRF2Kx+BKZSluJR1UHlVrEiq5vTpgp3dzuTnTFHDp3ZkqDAqFIzQ1K37JNd1hopMLcrFzfKv3JNCnLKN+0Y7G/kl4f93DOwqcFDZYQUhb7ZbzBsSauPnfps5AJ60LnY7Poo1GJ6ql5bFgSDvjPyFc1b0mmpqwRcIlDxeO4LWjBReQ7jXhQStT32AKX5Ui7aSbYIxf0pE0Y5eCJzcHS6wAGdXtP+liNADCMX0JafUCTh7FQI6QeLQDDCZbcs6zBJK9ZvPOvUoyUa8yHjeJsbk3+bt/yrJJjJI0LXCmVT60+rlJgO0j0HH5hs+Z3vG8pwEN++QI7W1F+IKsCEXuZBu0g2qr6qfXkHvXET/rHqFPZmOkUgexs1enLfrGgVZmHprFPjJFxTOsd4gKEh42jU4cbzEu8+tcHoyvi0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199015)(38100700002)(122000001)(82960400001)(31696002)(86362001)(38070700005)(71200400001)(6486002)(478600001)(41300700001)(8936002)(107886003)(91956017)(66446008)(4326008)(76116006)(8676002)(66476007)(110136005)(66946007)(66556008)(316002)(54906003)(64756008)(66574015)(2906002)(186003)(6512007)(26005)(6506007)(83380400001)(53546011)(2616005)(5660300002)(31686004)(36756003)(558084003)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dkJHdGYxNktuZUpzWFJlTDRPZCtZajQrWlljY3lheU0yWkpENFBzZjRreU84?=
 =?utf-8?B?VVlUNjh4NTNZdVQ3KzlKVU10cm9WaDg5MG5jUTdHMnNtbTA2K1I3UnJpOVdn?=
 =?utf-8?B?bFQ0UUtXcFFhVDdMU3djYjlsYk16bDZ1K0JsZjRsRlN5QzkxRTBNY29TL01u?=
 =?utf-8?B?c042UlU0L1E4UUxuSklFVktMcFhUMnhneGRrMnpEWFZkbzRaRGlYd0hBekxT?=
 =?utf-8?B?OFBHRVk2Q1ZqVXZQOWIxTHhPVFhiOVEyWWhUQWJaaTIycWMxRk1PQ0xWY3VG?=
 =?utf-8?B?cHBndDU0b09ydVgrbmwzelZxc29EVmRYWm90ckRWRElmWDRDMHJ2cCtubnJp?=
 =?utf-8?B?SlJLUGxYUUhwMWNFTHVQZTZ4VmpnOVdtWDhxazgrSzRiNzdnVFFtdEZVVFFJ?=
 =?utf-8?B?ZDZTR0VKR1JwdHR3OWFrY2ozdlgzd1BDdVdPTDlSeExPY21oWDVRN2xqWkRN?=
 =?utf-8?B?VHRaM0w0RVRLRm8wcGE0SmpEU1JOcHVCRXEwZzJtZ0l0Y0F1MEFKckFzMmtH?=
 =?utf-8?B?YmhXbXE4TVdyMVVWZC9nTTdwTW1KUGVPaStKQ29KMjN0WFpyTXRMMlB0dE02?=
 =?utf-8?B?QVJvODVEL1A0cndQSlhaTGQwLzZIUjBxclBOSEtFWVVyclVaa1JLa3NOVVpZ?=
 =?utf-8?B?dVpjVFNDUDhvY09vUHRXMVJ2c09qMEFpSmpOZUQreXI4WmFqaUFjVldJeUEy?=
 =?utf-8?B?S3pXdnZLT2xVVW9YODNIRVRaZmE1OWg0MlVsUGRZRGtXcFhLWEFrSG9MVDEw?=
 =?utf-8?B?YTVyak8vZDdOSGQwc3pVTFBuaFFGZjVyZnZ2Q0ZiS295RFpTREI2UXliWW1L?=
 =?utf-8?B?TWRxNXh6N1dZUlYza3lzNW9EMXoxSlVrNnJJaDNJQ3BRa2tweVVEMkgrblBW?=
 =?utf-8?B?ellFOHlqKzRySTl0d09Ydm1GeVF6MDI1UGFjaFpjVEtRWHVESjJEWTExeDVV?=
 =?utf-8?B?UFNyV2Znd0JKNUVsc01jUnpJd0xzYUthalNUV1ZUZUZXRDcxYkxPd01obE12?=
 =?utf-8?B?RWlOMWxHNWtJNlYwYlQrN3doUVhBdmd3ZTZZMkliRTNGMU4xcm5mYlZOemdE?=
 =?utf-8?B?OGl0N2l5OGpSbVNNZ1ZIWU1veFJVMDJzSnV4TDBNZWllMWJsd2R2S2hwdTE5?=
 =?utf-8?B?ZEhaZU5HMjNlRWcvMHoyb2M5RjZybVQ5SXY4U2RucW1LNWlONEVWOU1ra2kv?=
 =?utf-8?B?YWZSQmxRRitDaVdQTHFGUHR4c0JZZEY3a0dMcytuTG4yc2VKRkg2Z2NXTHlw?=
 =?utf-8?B?U3psYkMxMGJGdUg5YUFnNzl3NVoyM2l3dGNjU0VtUEsvQ1pwUkJyNXA2RU5W?=
 =?utf-8?B?Mk55OHdrNDZmN3AzbmFZcFFxNUtVSWFUemN1QVhJbzUySmNUWG5XQXpreDdh?=
 =?utf-8?B?V0h3MFNCUHdSaHBrWjFwQzlUc0JvR3NoczRHZjFYcTl3aHFCeFpnRXBRT1ln?=
 =?utf-8?B?ZkxrTnd3Y3FwRmRUcnJadVB4TG5KVWhaSmNjM0tHcmNjdm1LYjZYWnptenBG?=
 =?utf-8?B?aTdRL3dpNEhyTU9USHJ6TDJ3NWhxRHVTZ25WbGJ5dUJKYlRYQkR5alhpdlpB?=
 =?utf-8?B?M2lGUHdabEoxdWRmSnQ1L1pkc3owZ0dqQjdPZ0pjdCtzcUFyZTgxRjdDNENh?=
 =?utf-8?B?TGVRSUFWVVZJR3ZPUUdleUdodFNHc2FydG5rVktPc0lZaUZ3Y04yNVJJeTBV?=
 =?utf-8?B?ZERtUE44V014eDltenpCSk8yaGllY3VobXBpcS81ZFJEQncvYXBnVy9RdVNu?=
 =?utf-8?B?N3NTUS9oL3dJdW45VzlZb0xFTmRYNHdzQndaZ05KUmp1bG5xTzJjK3hvWnV4?=
 =?utf-8?B?V2QzNnZaVmswUTE5WWw1Si9mTXVQaW5HTFg0bUkzbCtGNldRYjh0TDlINHV4?=
 =?utf-8?B?UkpRU1F2N09iQWZ1VzR6dHJldzhjZ2twRkg0b25xN2RWQmpuOEkrR004a0h6?=
 =?utf-8?B?Ymk4aHltZEhwYmdkNExucUlJaG5LcGFtNWt1dSt6VXdOTnZDbnpjdG9TUUE5?=
 =?utf-8?B?ME5YMXhRZWo0R1ZpMkcvUmRkMW9UNWpZQUoxNkRrT3JyWGxCVktuMEV4N0I5?=
 =?utf-8?B?SlFBejJCOXR1YzNGSkZMQjljZi92OUpudTVHT3dza3lOeTk5QnByVE1haHpx?=
 =?utf-8?Q?BjY2rcp3+FA77a2I3BDXuI5vH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E20674F6B344884FA470AC5F9621F37B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae965a66-8481-49e6-e411-08dadaf0e095
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2022 20:55:32.0647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gQ+YCqC2+ojtohm6xrYPDlXKFS+TwavFTKK4Wkif2gMJ7h5ZL6Zxdq32Ug8lHzujYkfWe8rEUDr0ZEju+SjN7vFugRCxDs2SUWXfJf2uesY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6174

T24gMTAvMTIvMjAyMiAyMDo0MiwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOg0K
PiBJdCBpc24ndCByZWFsbHkgcGFydCBvZiB0aGUgZG9jdW1lbnRhdGlvbi4gRnVydGhlcm1vcmUs
IGVudHJpZXMgdGhlcmUNCj4gYXJlIGluIG5vdCBkZXRlcm1pbmVkIG9yZGVyLCB3aGljaCBicmVh
a3MgYnVpbGQgcmVwcm9kdWNpYmlsaXR5Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJj
enlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+DQoNCkFj
a2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KDQo=

