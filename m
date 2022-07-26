Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2013F581669
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 17:30:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375447.607838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGMVX-0004To-Kd; Tue, 26 Jul 2022 15:30:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375447.607838; Tue, 26 Jul 2022 15:30:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGMVX-0004Ni-Gy; Tue, 26 Jul 2022 15:30:03 +0000
Received: by outflank-mailman (input) for mailman id 375447;
 Tue, 26 Jul 2022 15:30:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xzkj=X7=citrix.com=prvs=199529adf=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1oGMVW-00049I-0n
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 15:30:02 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cefa6907-0cf7-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 17:30:00 +0200 (CEST)
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Jul 2022 11:29:57 -0400
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by PH0PR03MB5798.namprd03.prod.outlook.com (2603:10b6:510:35::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Tue, 26 Jul
 2022 15:29:56 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::b876:40ed:1507:6fea]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::b876:40ed:1507:6fea%2]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 15:29:56 +0000
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
X-Inumbo-ID: cefa6907-0cf7-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658849400;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=5hL7EQoyvMmCBQsG+KGVhCad1N/ciyZZhE8Vz9ykLWs=;
  b=AO5FO8PJsjM0uNICyFEj1smX9NfgtWFqhJxhMiMRu5BnqNl8BXijGYIN
   0NRzY6JmyFmzFWXWqTpX3le911z/viy2Ely3TVeHczih8Otuc1UgWEUaQ
   2LYrSajaQq3S5/LZBoAd6UhX52BPMWJY7lWytjH3eEpQGhNSuIywP+SiY
   8=;
X-IronPort-RemoteIP: 104.47.59.177
X-IronPort-MID: 79230016
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:BZd4F65efsqJ5mKc1P/KwgxRtCTGchMFZxGqfqrLsTDasY5as4F+v
 jEdWGnSO/jbNGLxLdonaoyy9RwA7J/XnNAwSlE9q3hjHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yM6jclkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjimUc3l48sfrZ8ksw5qmq4lv0g3RlDRx1lA6G/5UqJMp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VSKlLgFVHmZkl+AsBOtiNqtC0qupvXAdJHAathZ5dlqPgqo
 DlFncTYpQ7EpcQgksxFO/VTO3kW0aGrZNYriJVw2CCe5xSuTpfi/xlhJFsmZokb3uxyO0pP3
 8Y1AWEhVE2Ilu3jldpXSsE07igiBO/CGdpF/11Fk3TeB/tgRo3fSaLX49MexC03ms1FAffZY
 YwedCZraxPDJRZIPz/7CrpnxLvu2ia5Lmwe8Q3KzUY0yzG7IAhZ3bTzMdyTZtuQQsZ9lUeEv
 GPWuW/+B3n2MfTAmGDeqir12IcjmwvfBp0eDbKmrcRlnQa9ljAZChlLFl+09KzRZkmWHog3x
 1Yv0igkoLU29UerZsLgRBD+q3mB1jYDX/JAHut87xuCooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9dJ6G3rKdrDf3NS1LK2YHPHUAVVFcvIalp5wvhBXSSNolCLSyktD+BTD3x
 XaNsTQ6gLIQy8UM0s1X4Gz6vt5lnbCRJiZd2+kddjjNAt9RDGJ9W7GV1A==
IronPort-HdrOrdr: A9a23:4jq0CqODbvXjv8BcT2L155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKQyXcH2/hqAV7EZnirhILIFvAp0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrzVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKUiSw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8yvT9aw+cyTpAVr4RHoFqjwpF5N1HL2xa1+
 Ukli1QffibLUmhOF1d7yGdgjUImwxelkMKgWXo/UcL5/aJCg7SQvAx+75xY1/X7VEts8p717
 8O12WFt4BPBReFhyjl4cPUPisa33ZdMRIZ4JEuZlFkIPwjgYVq3Poi1VIQFI1FEDPx6YghHu
 UrBMbA5OxOeVffa3zCpGFgzNGlQ3x2R369MwM/k93Q1yITkGFyzkMeysBalnAc9IglQ50B4+
 jfKKxnmLxHU8dTZ6NgA+UKR9exFwX2MFrxGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhN15c2kI
 SpaiItiYfzQTOaNSSj5uw6zvmWehTNYd3E8LAs27Fp/rvhWbHsLSqPDFgzjsrImYRsPvHm
X-IronPort-AV: E=Sophos;i="5.93,193,1654574400"; 
   d="scan'208";a="79230016"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kL0EnB/O8qImq+wiT6CjD2oOn8Q9VEjs9Dgp4po6XMoB2gNm4YeN4mQDZebg0GgpZvO6riAaAl7EmnTb3H4QW1UQGhMj0mUnuOean4kO1AWoy1/x1O9e3VlXCfTFSevaUKyykofhfLLpSLlhM4K2q/pYZd3AxVUNkNUq37YIrUPd14NPQwLvcZ2loKGcBDGMENpwBimG+FqJJTQX3tczk6wGSyq87EMSz4qBq3v5O4TTG8GnS+wxkGMf6702/ZlD12cssWwdIl8wdt7lnU1os44Y+Zt4xgSGnsQf6dod4pq5tH84gBnrlRj32fFHKx8RSJqqztNvvIOzJxm96ArNcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hL7EQoyvMmCBQsG+KGVhCad1N/ciyZZhE8Vz9ykLWs=;
 b=a2Wv2yOh9FUnQFC/ivjqSFhzqQdVxv5CxKPIQN+EDTn752Mz17es4bwQJZfCxExG0yvbaV5GbQDDsUUqOeNP+Vvc0n1xLCay4s+cbTomNjdbbUH7Soz1dsRRQclGxqu+Oy+AaJEiOol0jrcSGqUSDislkkqJcgOkbKoMq/DtezpLoAXaD2c1tfgf/B+GbDbYLfheCn2WbilLLSvgDFKc7ztD11aujhe863tPYyj7r2xogXrFoffKGJvvpVV85nnNSJdG4+lOkM4rJd0S5q6ZKL/65U6eQYP3bxXpdhBa5JHkA+O3C31k4TKyXHqh0etTjcOHXmQakdWhFOzIQ2rx/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hL7EQoyvMmCBQsG+KGVhCad1N/ciyZZhE8Vz9ykLWs=;
 b=lRnvpT7EdEcUDO4nwtSFeW8UHkFvEzB1ZX24ZjX5DTymwFJA2Xu3izF2Rii94ICS6W0YVOBETaIAj7jsqYZ2ge9Ki+7i9Uq0TpvEme0DNx0f07amTQax6IKPg4EEnjeP4qdEdaG76JO1wOdvGjA/cBbpbPTFrU1nhOO6AaPY8LM=
From: Edwin Torok <edvin.torok@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/msr: fix X2APIC_LAST
Thread-Topic: [PATCH] x86/msr: fix X2APIC_LAST
Thread-Index: AQHYoP4qyGlTjJTj1UaX3N7imIGaP62QwNEAgAAGTYA=
Date: Tue, 26 Jul 2022 15:29:55 +0000
Message-ID: <41F06585-604C-479E-9B2A-BE61B2F93D0E@citrix.com>
References:
 <d4fb4631b82643751fcb3356b094be65e5bc9bcc.1658846616.git.edvin.torok@citrix.com>
 <e656bf59-890a-b2ee-3a37-603ef8c66154@suse.com>
In-Reply-To: <e656bf59-890a-b2ee-3a37-603ef8c66154@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 84a8ee33-e095-4b3b-76c5-08da6f1bb188
x-ms-traffictypediagnostic: PH0PR03MB5798:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 KuFhRaQYOVdSARNZ0MKLApzl1IhdeH+PE19qEPtMn5SIC9Oy8invhAv7pa4LsNv2wHML7JKqJrGRepVqunovtsM4RZcEmwQ4Zc2aVIILL4Fcg5tTnMY0D2FXMKQrm1dC9y8e7uqulEUriWdXiIUt4aggBVMWpgcbz//JaLdNwt6SFFs69e3YcHM4FjM2tC5TPkMGtlv5jMtFkLToUoz2ECEhVp1je6tFNhwjEP2pUybiWC8fNJT6ASZ7szCrc174HUcKspL4pVOYGofYV8Bks4UF46cKHT6KhkMCtLaW0MJ2RfkCsNLRaXPWjsdDya/6Ua1q3dLQPs4W9qEUrMkCKqbvw2SY9tfZlj7sYnAHgKuFO5jJRufiiaQJRHIFjjN1IwCXrbhfKKSk5dzAw71Oesccv02ySTQPx81HV5M+Jny20BcviMAZgU7BUmopyTWvfiaoEnMo0tSpUxgdt2vWTHH9bWyhGQ6PvukSFpjFi6He9T+OIeEnJ6LNU3/WcpKNX3qGoq/z/4cJwraEPYlatAxqqtL8i7JRcpzwIgwRVgVPvCg+rvoRbzoAGJ4GLINY7fXbXzMBW1rcHQYKKxeBxsqkBq13hJVPjE9OoKTG7RP3/MUpYleaCTGHuzdVFMuePIC9IBKP5yiGYCZxukeG3D5UWhMG2sOIkdjYRKsSTO32jr3T3hIF66QrHug+stMcvgdIx2aU+xGLOlxjOyG+fL8CFN537ZL1Mflfy8OeZ1SrWW/tlJIJVWod39yXnVG+S/s8k98jwSj5NdfbgkLVjSOgfNyIyO01vpQwhwub7azg8Bvd1o4J5lZ2UeV9ryOuvxXLkU60O5ScFzhjxG8ozw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(8936002)(38070700005)(478600001)(186003)(6486002)(6506007)(41300700001)(5660300002)(36756003)(316002)(66556008)(91956017)(66446008)(66946007)(82960400001)(6512007)(83380400001)(26005)(53546011)(2616005)(66476007)(2906002)(71200400001)(122000001)(76116006)(64756008)(8676002)(38100700002)(6916009)(54906003)(4326008)(33656002)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bmJhR3NJZm9Ua2cxUkZBRjVlTTFURlpLRVB3dkNjanNmVXZwT0hHUko3MXBR?=
 =?utf-8?B?ZFgzUGgydzMwZVVqSmFWSDlsMG9qTkx5UjFRdzFlcGlxWDhpUVNaYlluT0g2?=
 =?utf-8?B?N0xCN3NJa0NLa0xzdTNtSTZOQWpnRkh4cFcrQkVjSVA0STE3TTF3b3FUbHNK?=
 =?utf-8?B?KzlUSis5OHlQM0ZYWWk0Q2pQSE5ucjBPVG41bG1XZExNMDdXNXlaMkx6ZTl5?=
 =?utf-8?B?R29hR3hRU3p2UTB0amFKUy9pV1JLSjMwOEZQRXN5WlZvaTNueld1WmJkWk8v?=
 =?utf-8?B?QVhCSDh2bG9ZRHpxMTE5ZlV0VUJxczlsaDREYzVjaklwb01KcUtlT1JGVnIy?=
 =?utf-8?B?Q21Ea0t4amc4eUxLUWVjRW5XU3k0SXZFb25aVWRqamk2SDhibXgyeGZFR2VF?=
 =?utf-8?B?SkdjVzJtcVdIS0NZYlIxdXd1TGtYbDRPMjZtY1VMcGZ6V29uZVQvbmIzTlYw?=
 =?utf-8?B?Ykh6QitDSFlpdHJzWWxZam5jNFNScnR0T25nTi9DOEl2S2k3VkNhcXBQRWdM?=
 =?utf-8?B?b25YWVZueFYwVndpaXhLMjJBQVRObXFiMS81UUJsRmJFYmR5cnBHQjIwWElv?=
 =?utf-8?B?OGsycSszRTdCNUIxZk9rbnFUWGlFU0tmd21TcHhVZ1l1eXZxZzRFWVJiRVZD?=
 =?utf-8?B?R29KbzByeHEyRFRYbzdRNytNNkhpclVQQmQwL0FzTW96U3QxWFBtbm5SRGQy?=
 =?utf-8?B?K3Fmd3h2TWVJM3prVlhkcGZWWFgxN2YxeSs4U3ZWeWZtY2tWZ3JFWDdyZWdV?=
 =?utf-8?B?cVR1TEdqSlkyZWkyMXhKWkxtVTREcys2TWV1czBlOXJFbjR2aG5VUGV5R3d2?=
 =?utf-8?B?bFc1eFdKVkVXMU1YQnYzN25vTFB0TjBOeWhYYkcwbVphSENtWng4VStUMXdo?=
 =?utf-8?B?VnFTOWdseEF0T3BZWi96V1pXS2VseE1Xd0xsVWZWNDBiSHNjQW10QTgxa2JF?=
 =?utf-8?B?NFNObkt4SjZDU053VFEyQkZjVXpzcFdId0thM29WQW1jQmRJUjRQVDA0MHo4?=
 =?utf-8?B?K2dibEFCN1hrSnZaclk5cUtUckhDSEIrd0d4Y1VqR3IxZm9WSzErNjJMYXNy?=
 =?utf-8?B?NC9SK1RmbVB1ZmdnV05XNjFqOEwwbThxanRWbCtzSGlUd0c1d2V2STdJSUFl?=
 =?utf-8?B?SU5JRkk2MEMyM2NJVEErRTBlTHphTUc2NzB2b3BlQitsZHpuU2NRNkI3YXYw?=
 =?utf-8?B?ZTdQcnU5TWtQSzNScklIMExCYUtSMFlXYkl1N3p2VzBXVU9pRkR0WFVhRVFj?=
 =?utf-8?B?d2RQYVRlV010KytvdVZQTzVZSHR0bTRqdnNvaFhPakRTVzZQK3IzVTQ3aUR2?=
 =?utf-8?B?bU5ocUdLRWo3a2d0ZE1aYklYUTB4enp1NEgvcjJFUUg5N210T2phejVudkRw?=
 =?utf-8?B?dHhrV0JpNWk2Ym56cVhnY2NGZ1lrbzQ1d25MTkRjZlY0WC94T1BzcGZ6NzFr?=
 =?utf-8?B?amZUWnl5QzB1OVlDQndSSGtRTVBadXkwMWRyUnFVdncwa2tUdXJiSXdmWW1T?=
 =?utf-8?B?ZzgzSW45YjRtV1kycEdxR3JiTk1IWWlEWWZsZ0tDRjJTejhENjlENWxjRk5B?=
 =?utf-8?B?cURWZU1Ddk1tTjUzY1BQOW03M0hsVDNHZ0lIdXVPdzM1WHR3Z1MrOENnQ1pH?=
 =?utf-8?B?U2h0TW8zU2lTU0FQZUxOelhIWjF6aGdqdEM5WTQwU2NnYUxEWVZmb3NRZWNI?=
 =?utf-8?B?aHROakdZU2RTMml5ajdSS3hBNVVQMDFLNXhJL3p0RDZHYmdUWGFUSzNmcWNQ?=
 =?utf-8?B?eUUzazR0TnNuc0ZzM0RlS3MvOFNEbitaazl3OG9LSGJYdTFuZkZzRWRqWTVP?=
 =?utf-8?B?NlpZcmZsbWdOTXVIWUN6Z1A5d0Q5OXJXNGRzUCtLWnNxV3UvUWhCRGNMbUNW?=
 =?utf-8?B?SXdlWHV2T2xzbHMxWmZvVUsrR2lodm9UTGFvV2d2VjR5c2xiNnQwWUVIVExu?=
 =?utf-8?B?MjFyMlZyeUdKRXk4ZWdheS9OZytUcEV5bkdGQzlhUm5lanRLWmE0MkdKL0Fn?=
 =?utf-8?B?QStUVjBJeDdNazh6eEUweDh1TjNndWRiWFdNTDEvTXg3QnY0UXpDNzZ0cDRB?=
 =?utf-8?B?SFQvcXRobHZUUzdMOXpCNmM4a0swNWpPWFBxMElzRmhMYnVDcFE4L05sRUVP?=
 =?utf-8?B?WS9KeWdDNmxPbmo1SnZ2ekVTUGZSaE5hV3VlZGhrMHZmKzQrWXRmYkNrWkpy?=
 =?utf-8?B?b2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <45D3A85564503E47B4766586092D578F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a8ee33-e095-4b3b-76c5-08da6f1bb188
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 15:29:55.9344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tz6paJsASddWmcc0K0pGwRC7smMkFdwhARnYq2dAjAxMELVOXOeELkZCnpDkBDlKok5wsnOV9+zikmAen9NTcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5798

DQoNCj4gT24gMjYgSnVsIDIwMjIsIGF0IDE2OjA3LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjYuMDcuMjAyMiAxNjo0MywgRWR3aW4gVMO2csO2ayB3
cm90ZToNCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9tc3ItaW5kZXguaA0KPj4g
KysrIGIveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL21zci1pbmRleC5oDQo+PiBAQCAtMTQ4LDcg
KzE0OCw3IEBADQo+PiAjZGVmaW5lIE1TUl9JTlRFUlJVUFRfU1NQX1RBQkxFICAgICAgICAgICAg
IDB4MDAwMDA2YTgNCj4+IA0KPj4gI2RlZmluZSBNU1JfWDJBUElDX0ZJUlNUICAgICAgICAgICAg
ICAgICAgICAweDAwMDAwODAwDQo+PiAtI2RlZmluZSBNU1JfWDJBUElDX0xBU1QgICAgICAgICAg
ICAgICAgICAgICAweDAwMDAwYmZmDQo+PiArI2RlZmluZSBNU1JfWDJBUElDX0xBU1QgICAgICAg
ICAgICAgICAgICAgICAweDAwMDAwOGZmDQo+IA0KPiBNYXkgSSBhc2sgdGhhdCB0aGVuIHRoZSBu
b3cgb3Blbi1jb2RlZCB2YWx1ZXMgb2YgTVNSX1gyQVBJQ19MQVNUDQo+ICh0d28gaW5zdGFuY2Vz
IGluIHZteC5jIHVzaW5nIE1TUl9YMkFQSUNfRklSU1QgKyAweGZmKSBiZSByZXBsYWNlZA0KPiBh
dCB0aGUgc2FtZSB0aW1lPw0KDQoNCj4gT24gMjYgSnVsIDIwMjIsIGF0IDE2OjAzLCBBbmRyZXcg
Q29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIDI2LzA3
LzIwMjIgMTU6NDMsIEVkd2luIFTDtnLDtmsgd3JvdGU6DQo+PiBUaGUgbGF0ZXN0IEludGVsIG1h
bnVhbCBub3cgc2F5cyB0aGUgWDJBUElDIHJlc2VydmVkIHJhbmdlIGlzIG9ubHkNCj4+IDB4ODAw
IHRvIDB4OGZmIChOT1QgMHhiZmYpLiBUaGUgQU1EIG1hbnVhbCBkb2N1bWVudHMgMHg4MDAtMHg4
ZmYgdG9vLg0KPj4gDQo+PiBUaGVyZSBhcmUgbm9uLVgyQVBJQyBNU1JzIGluIHRoZSAweDkwMC0w
eGJmZiByYW5nZSBub3c6DQo+PiBlLmcuIDB4OTgxIGlzIElBMzJfVE1FX0NBUEFCSUxJVFksIGFu
IGFyY2hpdGVjdHVyYWwgTVNSLg0KPj4gDQo+PiBUaGUgbmV3IE1TUiBpbiB0aGlzIHJhbmdlIGFw
cGVhcnMgdG8gaGF2ZSBiZWVuIGludHJvZHVjZWQgaW4gSWNlbGFrZSwNCj4+IHNvIHRoaXMgY29t
bWl0IHNob3VsZCBiZSBiYWNrcG9ydGVkIHRvIFhlbiB2ZXJzaW9ucyBzdXBwb3J0aW5nIEljZWxh
a2UuDQo+PiANCj4+IEJhY2twb3J0OiA0LjEzKw0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBFZHdp
biBUw7Zyw7ZrIDxlZHZpbi50b3Jva0BjaXRyaXguY29tPg0KPiANCj4gSGF2aW5nIGRvbmUgc29t
ZSBhcmNoYWVvbG9neSwgdGhpcyBjaGFuZ2VkIGJldHdlZW4gU0RNIDY4IChOb3YgMjAxOCkgYW5k
DQo+IFNETSA2OSAoSmFuIDIwMTkpDQoNClRoYW5rcywgSSd2ZSBkb25lIGJvdGggb2YgdGhlc2Ug
dXBkYXRlcyBpbiB0aGUgdjIgSSd2ZSBzZW50IG91dC4NCg0KQmVzdCByZWdhcmRzLA0KLS1FZHdp
bg==

