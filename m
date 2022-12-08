Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A0D647139
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 14:59:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457187.715061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3HQr-0000PZ-Re; Thu, 08 Dec 2022 13:59:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457187.715061; Thu, 08 Dec 2022 13:59:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3HQr-0000N4-Om; Thu, 08 Dec 2022 13:59:25 +0000
Received: by outflank-mailman (input) for mailman id 457187;
 Thu, 08 Dec 2022 13:59:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uovv=4G=citrix.com=prvs=334de2702=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p3HQq-00007q-E5
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 13:59:24 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83e7397e-7700-11ed-8fd2-01056ac49cbb;
 Thu, 08 Dec 2022 14:59:22 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Dec 2022 08:59:20 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6520.namprd03.prod.outlook.com (2603:10b6:a03:394::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 13:59:17 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.016; Thu, 8 Dec 2022
 13:59:17 +0000
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
X-Inumbo-ID: 83e7397e-7700-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670507962;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=CqPpt48csCpkHE/0Q2dvcGUsRsYXhmd0pKhy3mMX4m0=;
  b=S+0TnJjMEuV06i03vCzlsgJhUvj21AQG4/zmeAa0KvKiqHKtnk//t6kN
   uQaiQxaZAXPZzgHFH87w6ctwOl4eSB0VTDt9k/RxobTkYUuBkeeV6dxwY
   /IslnsMNa9C2X+JUoRNiQYk1V1rcNiLsruD5lXovIbayEuSO4flPo4WCj
   U=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 87670697
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:GhxShaiqVeOcY6iLvGYB5lHRX161QhEKZh0ujC45NGQN5FlHY01je
 htvWGyOPviLMTbxf9B3a9i3ph5Q7JHXmNI2GQNu+SFhFywb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5geOzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQjKT4AQxyIlt6a76+HEeYwh9gqJ/LSadZ3VnFIlVk1DN4AaLWaGuDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEhluGzYbI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6ROLmqaY00QL7Kmo7Ak0ReFfq4tSFqGXneP9iG
 gsT1BF1sv1nnKCsZpynN/Gim1aUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebT4g2
 0KNntjpLSdyq7DTQnWYnp+LqRuiNC5TKnUNDRLoViMA6tjn5Ys13hTGS486FLbv14OkXzbt3
 zqNsS4ywa0JitIG3Lm6+laBhC+wop/OTUg+4QC/sn+Z0z6VrbWNP+SAgWU3J94ZRGpFZjFtZ
 EQ5pvU=
IronPort-HdrOrdr: A9a23:k+7C/aGLREuu4jfRpLqELMeALOsnbusQ8zAXPiBKJCC9E/bo8v
 xG+c5w6faaslkssR0b9+xoW5PwI080l6QU3WB5B97LMDUO0FHCEGgI1/qA/9SPIUzDHu4279
 YbT0B9YueAcGSTW6zBkXWF+9VL+qj5zEix792uq0uE1WtRGtldBwESMHf9LmRGADNoKLAeD5
 Sm6s9Ot1ObCA8qhpTSPAhiYwDbzee77a7bXQ==
X-IronPort-AV: E=Sophos;i="5.96,227,1665460800"; 
   d="scan'208";a="87670697"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KaDJE68bZI1ilhmOPje9ujHwC8Zz/SoEVgUNJ9lJv+c2/NcM4jSS5zs6896xgGzdbNuzeOeKoEeQFj2Ac7eoBwFK3Vbr+SvU9jBmTLenzcBO83jh3vvnbBPFzK7ihwRi9O1MQFHIZF0jSM52YE0wbUgzlQFWMD2MvRuVyC/iPCAr50T3U9PdHokaliCeLspKd2ygxTL7HYCxl6svRp0Z9TbqOueYcrv+oojwbx5PtEsitZPlEGkPVMuqUYLu0QzhG4JpgRACj+k2IgbVSTM20smT8G13YuiIpgsU6CORaADjwO9Zu5q1TiatHlrl/ESEjd8UsoWPi9O2td8aJkyPpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqPpt48csCpkHE/0Q2dvcGUsRsYXhmd0pKhy3mMX4m0=;
 b=ft1ZuN3/97JRNyywdM61hzq54MSDrOHZFkcnPYriMcpQX3x3b99DvcaIjKt3AR85auqdi21RYlaViVigoZ7p7Uk/m82Db3K7RkauLlVHNa+l+kMu/i9uLFbFBKHITF+G6nQk3EHgEY+7F1nQ+HZibVHo3lCNK8zOW0DK/i4QxoxCT1YAZpmfDIpa/5CkNEhyvBeHRTA5pHHKL5SpFZ8ZUFR/EjvLeQUxrls6ZhlxL4NIvlrGxdiODM/bWiUZXx16QEyyndqLKxTK+nl+dl17Ze5YbtlJ/5kXYivZOwGUjsplnJ+rRL5x8zNjGyy0jqFpXTiqUpHEjsRZq/YhV0zIPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqPpt48csCpkHE/0Q2dvcGUsRsYXhmd0pKhy3mMX4m0=;
 b=dT9rlkQdul0VFf87WGj+DAxwyRDMHCFOWzVTFvXVqE9J7z6SiDs+0d7vpdL76fO0KE1QNTdrRKh7ziB3gLbU2wNDHeoE3wdNJ8O6oIGDYMXgkqxzdCmcIqbtyk+/L2F7ngREs3SoHF8rqgQ91pFPiXiBJ19lWivfUTRnBMKORb0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Sergey Dyasli <sergey.dyasli@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] x86/ucode: allow cpu_request_microcode() to skip
 memory allocation
Thread-Topic: [PATCH 1/2] x86/ucode: allow cpu_request_microcode() to skip
 memory allocation
Thread-Index: AQHZCwjAky6i1T4UZEeH7yXOYJiUd65kBHMA
Date: Thu, 8 Dec 2022 13:59:16 +0000
Message-ID: <c6676171-8cab-dfbc-4b18-d9c724588398@citrix.com>
References: <20221208132639.29942-1-sergey.dyasli@citrix.com>
In-Reply-To: <20221208132639.29942-1-sergey.dyasli@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6520:EE_
x-ms-office365-filtering-correlation-id: 0573cb7f-3b6b-42fb-8d39-08dad9246567
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ckARAOdf+mXDxjzdgv2V6kyMN4VuddEmywWE01zcI5mnEyIR1F32gI2JupUwhvs2bY4XF+UUICuG0aGg+qEyMiFIWPeSc34+wRNKWEnfpTxoNvfz+H45BQqZxV2ZHHYJx0/nOXZpHA1/wbG7iiD+t6bj2IeDW3IH0lfFzbno5+hvSWjTPLHAtwzUX5uvgVTB0poLfzVTiZtQuJ3A+J5g1bE1RQpRiHx3QLyw8zduudW5X5KtSxzdQkae8Ioq73oVaNIDnMXa+Rxbxd/FaJGRR0IX8+uRyIS5lwfqjuWp4t1sh/QHRvfe54S6nKWpKNVwB3B7bo4meVBO8yFe5ylpjW/CV5Rsu1bFj1R5a+YQ1XUicMXtsGnxfwXb5L2VAlu/ESiPuDqVygSUf8KZ7PtSpeX0Fiqr+yskckYJIJ+Giw7IFVNNY38jNcJiSjTu9S3YUeLKgbPGYO4KRd/ozkK3iKL1JSDUJ/hRWo2HoAGIkjXzsSHp43DLD8CRKXPSS6n8xuF/sWvhHDauiOggebkcM0syc+coU3utPidYrUHBjs1ZAU+Nliz6dd5P1KiJm35W1jYfJk0xEusHUM5XMuj1Bf67QU/sjBdJxQCTcduPEzp5XKNf5x6qJt/1Jb5mHNCyqa+Mc6JQBSDFFR6t9KttEKqiRwSkW0tWy2TR/T0zdJneiQk7Gn6b/+X666cZ17b3ZS+qLylaBe5W/gpU8c3phBPa7J2z/wkPLFkKA5YIpNqREF/4Lf2cNg/t+hJBt6E2NWstwJ1nv5YthNY2yP3Heg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(451199015)(54906003)(36756003)(2906002)(31696002)(86362001)(8936002)(5660300002)(4326008)(38070700005)(38100700002)(71200400001)(83380400001)(122000001)(478600001)(2616005)(66446008)(66946007)(6486002)(66556008)(110136005)(82960400001)(31686004)(316002)(76116006)(91956017)(8676002)(53546011)(41300700001)(6512007)(186003)(64756008)(6506007)(26005)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TldRYjRIam02RjV1Y0Q4QjNXYUZhYUR4c0dsVmRlV05JbFFyUDVGNFRSQkVG?=
 =?utf-8?B?TjZ6NUlvNmQ0SldKY2c5TjNweHFTazZDb0dFZ3hvOTFHUmhDSjVqRHlLRk9s?=
 =?utf-8?B?NEkvRm9tTmgwYVFQeCtDK29CZGhlcHB3d2tDR0RLaFIzWjcxNE0xK0E4V1ZD?=
 =?utf-8?B?NEFKTERJcU5jcEpxMEJmV0NSeFBoRS8rWXEzQi84emEwZ0MwMjNveUdZbzlS?=
 =?utf-8?B?TlZKWVRPellmOFlhQklESys5amZ0Zm5PazRnRnRob3RZWkUxYlp6Qjcra3hi?=
 =?utf-8?B?VmgrUHk2T1U5V0g4WjFvYU5vNjhxWnpQbWdJTVo4Ym00SUVTR25peG1COVZ4?=
 =?utf-8?B?alp6OVdQSU1YMGUxaU9neVY3WUhRdmp0eXRjTEJ4dWlzdzhjYk1JRm4zU1JE?=
 =?utf-8?B?RDhuVVNJSkVvUGdJd3VacHBhNWIzSGFTbXRjVFJ3dmRiZ29sd0F4ck5QZ3U1?=
 =?utf-8?B?TnpFdEdkWkZQNEtZNm96YitNNFQreDJzM1BQRnJzaGRTeG12b1pmd3MvSGxz?=
 =?utf-8?B?d2wydklGeEpLck5hZHgzSVdMa0FHaWcwcEdLeWdLS2U1TlVVNVJMdXNHVzdF?=
 =?utf-8?B?SXZhZU9ONm5pMWZQNDBSQkVDWURCUmV2TlhoU040MXo3MG1hcE1UeHVtMlRY?=
 =?utf-8?B?d3liMlJHN2p5Y1VPcktGcGsvNVdvYzhacUk2MEFjNmh5aFJmSDl6Vk9iY3Rv?=
 =?utf-8?B?Smo2bmM0VzNLUXZnQk9nb2pYRFBDd2QrUE1PQWtVeHhsNTJFUUZOT0FMU2Zi?=
 =?utf-8?B?T0lsTHZCTUF0bGtoSnJDQytPOCtPTmlNR1grYy9IZUt6MEIyWHdxcUhRM3lk?=
 =?utf-8?B?bXprMVZzNVBQUXVBSVRFNVlKeG9PdElRQk0xNGtSaXdTNDZBaGdNM1hoMkZw?=
 =?utf-8?B?Q1FwWlg3UnpETHlpMEg0eHo3YjNaYTlmRjNHNW5aT09aU3ZkNWpvRjZZL3pK?=
 =?utf-8?B?WHlxZzA3WW5CZEFJK2F5MUlyTXhidnBJeHkrTHMycDl1aWVoMzRncVJGZmdt?=
 =?utf-8?B?M3h1MTlkOGNzeW9hQVN0bndTUGFYMzNjVFNjaHJrQS9iczBzS1psT1lrRWll?=
 =?utf-8?B?Umh6RC9JYzlOT2QwNzZOaFlxZFpCbksvRlFBWGNFdWFNT2VNdlNnaWtzMEJl?=
 =?utf-8?B?NUJPa2p0YWt0NCtFaWVMM0hJUUt2VnYzckRaOUFWN3hBa1ZoeVJpL2s4QzA3?=
 =?utf-8?B?YkZGekh2cENPajRWNEErcVRpWWdmL0JUZm5ZM29lUXFJOVVXNmw0ZHlQOTVE?=
 =?utf-8?B?VCtzd2pDdFBMUEdyMHp6YUdnNTlEZHNoK05MaUxrc0dwclNBdVJVdjJLQms2?=
 =?utf-8?B?cVJsVmVDYU5vYmVWcmlha0Q4cU5kUGZoQ09VajFVNXhVS0VDeFAwWGxiei9V?=
 =?utf-8?B?bDJTaVRwQzhxTWpjY045aDRMeEdaTmRRN3IrRG5sMCtXYjNuOGU3RWZIOUtu?=
 =?utf-8?B?UklZdHhQMjdzSG1JL1NpY3FpbTlLTmw3QmxwYXJkQ1JiaDBoa0lzQ1F0d1FP?=
 =?utf-8?B?cWREZTdqTFpDemxSRmZlMmpaY0RwQ28xRmZrNHQrOHp6MEJTYi9qb2F2L1Qy?=
 =?utf-8?B?TzRaTGRUeHI5elRPZHVubS9hMWt6dXkzRVNuckNYYklET1hDYlA5emFqTHJK?=
 =?utf-8?B?MmNlUkxhY09meU9HbFp5N1BleFZvYU1xWHl4Z0JicE5qeVE4K1ZDSWkyMUxZ?=
 =?utf-8?B?ZC93WHI1d0VOSnlqQ0czTGQ1bDFkUnJKaWZISU81N2VsRk1yYmU2YWZXZkFO?=
 =?utf-8?B?QmdkUTNObS93c21tMmZ2aDFkZ2NhYlZtY216eWJIQ2pKTHVaTVhrRW5CcWtS?=
 =?utf-8?B?TjB2NWVXb1hjT3hKWTRWa2NqUVpLRFBlaGx1WHRkdGFMUFZadnc0ZUZ1Nnps?=
 =?utf-8?B?ZGRTR0IwT0pWUE9JWm54M25mZU12N1VLQnlVYU5ncGtPMTF5VjB3NnUzcitL?=
 =?utf-8?B?alJROG5VK3JRNnkvS2VFUUovcUl0clFzUXdhNlFHUWZJTTRSNWt4Y3VjTnp1?=
 =?utf-8?B?OVpEZk9ObXdiNVhGaEFVVXJwTTJuOEt4dEtQWWN0QWR5cWltOWRJNmE1K1ZN?=
 =?utf-8?B?YTBodVM4YjBCcmo3LzlGS0l0ZHRzak04dCtNbmJobHlzbVg1WDRUeXN6b2du?=
 =?utf-8?Q?9tXoAgmUWL5oDqPB4UyuJyJ48?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <59227C9AEE79DF4D8626F1E0F8900EE9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0573cb7f-3b6b-42fb-8d39-08dad9246567
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2022 13:59:16.9525
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xFArXO+EbsU/cWr/IpUtlyktVOtm6OrHdEin1JUrn8wWiVo8vRdqcJuUrTTUjbMCxkRZ32nVHTXq3E+4TYjMW5864VG5wNhbWeVaZYe+PCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6520

T24gMDgvMTIvMjAyMiAxMzoyNiwgU2VyZ2V5IER5YXNsaSB3cm90ZToNCj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlL2NvcmUuYyBiL3hlbi9hcmNoL3g4Ni9jcHUvbWlj
cm9jb2RlL2NvcmUuYw0KPiBpbmRleCA0NTJhN2NhNzczLi45MjRhMmJkN2I1IDEwMDY0NA0KPiAt
LS0gYS94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9jb3JlLmMNCj4gKysrIGIveGVuL2FyY2gv
eDg2L2NwdS9taWNyb2NvZGUvY29yZS5jDQo+IEBAIC05OSw3ICs5OSw3IEBAIHN0YXRpYyBib29s
IHVjb2RlX2luX25taSA9IHRydWU7DQo+ICBib29sIF9fcmVhZF9tb3N0bHkgb3B0X3Vjb2RlX2Fs
bG93X3NhbWU7DQo+ICANCj4gIC8qIFByb3RlY3RlZCBieSBtaWNyb2NvZGVfbXV0ZXggKi8NCj4g
LXN0YXRpYyBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICptaWNyb2NvZGVfY2FjaGU7DQo+ICtzdGF0
aWMgY29uc3Qgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqbWljcm9jb2RlX2NhY2hlOw0KPiAgDQo+
ICB2b2lkIF9faW5pdCBtaWNyb2NvZGVfc2V0X21vZHVsZSh1bnNpZ25lZCBpbnQgaWR4KQ0KPiAg
ew0KPiBAQCAtMjQwLDIwICsyNDAsMjAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVf
cGF0Y2ggKm5taV9wYXRjaCA9IFpFUk9fQkxPQ0tfUFRSOw0KPiAgICogcGF0Y2ggaXMgZm91bmQg
YW5kIGFuIGVycm9yIG9jY3VycyBkdXJpbmcgdGhlIHBhcnNpbmcgcHJvY2Vzcy4gT3RoZXJ3aXNl
DQo+ICAgKiByZXR1cm4gTlVMTC4NCj4gICAqLw0KPiAtc3RhdGljIHN0cnVjdCBtaWNyb2NvZGVf
cGF0Y2ggKnBhcnNlX2Jsb2IoY29uc3QgY2hhciAqYnVmLCBzaXplX3QgbGVuKQ0KPiArc3RhdGlj
IGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKnBhcnNlX2Jsb2IoY29uc3QgY2hhciAqYnVm
LCBzaXplX3QgbGVuKQ0KPiAgew0KPiAgICAgIGFsdGVybmF0aXZlX3ZjYWxsKHVjb2RlX29wcy5j
b2xsZWN0X2NwdV9pbmZvKTsNCj4gIA0KPiAtICAgIHJldHVybiBhbHRlcm5hdGl2ZV9jYWxsKHVj
b2RlX29wcy5jcHVfcmVxdWVzdF9taWNyb2NvZGUsIGJ1ZiwgbGVuKTsNCj4gKyAgICByZXR1cm4g
YWx0ZXJuYXRpdmVfY2FsbCh1Y29kZV9vcHMuY3B1X3JlcXVlc3RfbWljcm9jb2RlLCBidWYsIGxl
biwgdHJ1ZSk7DQo+ICB9DQo+ICANCj4gLXN0YXRpYyB2b2lkIG1pY3JvY29kZV9mcmVlX3BhdGNo
KHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKnBhdGNoKQ0KPiArc3RhdGljIHZvaWQgbWljcm9jb2Rl
X2ZyZWVfcGF0Y2goY29uc3Qgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqcGF0Y2gpDQo+ICB7DQo+
IC0gICAgeGZyZWUocGF0Y2gpOw0KPiArICAgIHhmcmVlKCh2b2lkICopcGF0Y2gpOw0KDQpUaGlz
IGh1bmsgZGVtb25zdHJhdGVzIHdoeSB0aGUgaG9vayB3YW50cyB0byByZXR1cm4gYSBub24tY29u
c3QNCnBvaW50ZXIuwqAgS2VlcGluZyBpdCBub24tY29uc3Qgd2lsbCBzaHJpbmsgdGhpcyBwYXRj
aCBxdWl0ZSBhIGJpdC4NCg0KR2l2ZW4gdGhhdCBtYWtlX2NvcHk9ZmFsc2UgaXMgYSBzcGVjaWFs
IGNhc2UgZm9yIHRoZSBCU1AsIGl0IGNhbiBjb3BlDQp3aXRoIGtub3dpbmcgdGhhdCBpdCBzaG91
bGRuJ3QgbXV0YXRlIHRoZSBwb2ludGVyIGl0IGdldHMgZ2l2ZW4gYmFjay4NCg0KDQpJIGRvIGhh
dmUgYSBwbGFuIGZvciB0aGUgZnV0dXJlIHRvIHJlZHVjZSB0aGUgY29tcGxleGl0eSBoZXJlLCBi
dXQgaXQNCmRlcGVuZHMgb24gZ2V0dGluZyBhIGZldyBtb3JlIGRldGFpbHMgb3V0IG9mIEFNRCBm
aXJzdC7CoCAoQWxsIG9mIHRoaXMNCm1lc3MgaXMgYmVjYXVzZSB0aGVpciB1Y29kZSBkb2Vzbid0
IGhhdmUgYW4gZW1iZWRkZWQgbGVuZ3RoIGZpZWxkLikNCg0KSW4gdGhlIHNob3J0IHRlcm0sIGhh
bmRpbmcgdGhlIEJTUCBhIG5vbi1jb25zdCBwb2ludGVyIHRvIGEgY29uc3QgYnVmZmVyDQpmb3Ig
ZWFybHkgbG9hZGluZyBpcyBnb2luZyB0byBiZSBhIGxlc3NlciBldmlsIHRoYW4gaW4gdGhlIGNv
bW1vbiBjYXNlDQpnaXZpbmcgdGhlIGNhbGxlciBhIGNvbnN0IHBvaW50ZXIgdGhhdCB0aGV5J3Jl
IGV4cGVjdGVkIHRvIGNhbGwgeGZyZWUoKSBvbi4NCg0KSWYgdGhpcyBpcyB0aGUgb25seSBpc3N1
ZSwgdGhlbiBJJ20gaGFwcHkgdG8gYWRqdXN0IG9uIGNvbW1pdC4NCg0KfkFuZHJldw0K

