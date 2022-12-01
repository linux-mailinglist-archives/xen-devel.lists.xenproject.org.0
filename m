Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF7463EF8C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 12:34:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450579.707919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0hpV-0006TV-JV; Thu, 01 Dec 2022 11:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450579.707919; Thu, 01 Dec 2022 11:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0hpV-0006RO-GF; Thu, 01 Dec 2022 11:34:13 +0000
Received: by outflank-mailman (input) for mailman id 450579;
 Thu, 01 Dec 2022 11:34:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmm5=37=citrix.com=prvs=327587bd7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p0hpT-0006RI-So
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 11:34:12 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30b3605b-716b-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 12:27:53 +0100 (CET)
Received: from mail-dm6nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Dec 2022 06:34:06 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB6975.namprd03.prod.outlook.com (2603:10b6:8:42::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 11:34:04 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 11:34:04 +0000
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
X-Inumbo-ID: 30b3605b-716b-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669894449;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=IsJUD48X9AXv83wMcV0YFo5ac0Ej2uXNkeHQNFJxams=;
  b=VflhZmunBvRWRBJd3hGirGiJQNuZ3FBICR+/qrXzknZoj3PLXuZCn3rD
   F238Sqysc6TeMC0heMexqHAlTrljmj2CaPc0oITXKwnikJ/eWrri6iag5
   h5rgdc0qavI356CF2BQ/avQd8W5rO4RaewfZB+RSr+von8BUt9ZyFzKPd
   g=;
X-IronPort-RemoteIP: 104.47.58.105
X-IronPort-MID: 86034841
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:I+m/HKowf8TO+GF8vsLZ9yijqPJeBmI4ZBIvgKrLsJaIsI4StFCzt
 garIBmDOKmKYDamedggaNu2oUoC7cfXmtcxHFZkrygxQXsbpZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaEzyBNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAA81YgiZurOH+pSYUsterNwJEpe2f4xK7xmMzRmBZRonabbqZvySoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYKIEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXoqKYx3A3PnwT/DjU9TmSKv9qAm3WkSoNbA
 l03oRQEtZILoRnDot7VGkfQTGS/lg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQC2
 laXkvvzCDdosbnTTmiSnp+LqRuiNC5TKnUNDRLoViMA6tjn5Y020BTGS487FLbv14WoXzbt3
 zqNsS4ywa0JitIG3Lm6+laBhC+wop/OTUg+4QC/sn+Z0z6VrbWNP+SAgWU3J94ZRGpFZjFtZ
 EQ5pvU=
IronPort-HdrOrdr: A9a23:AApn96GcNewHTJ29pLqE1seALOsnbusQ8zAXPiFKKCC9F/by/f
 xG885rtiMc5Ax9ZJhYo6HnBEDiex3hHPxOjbX5VI3KNDUP0gOTXfhfBODZrAEIdRefygZQvZ
 0QEZSXBbXLfD9HZcyT2njcLz4uqOP3lJyVuQ==
X-IronPort-AV: E=Sophos;i="5.96,209,1665460800"; 
   d="scan'208";a="86034841"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUkm1ft61yWq0AhmhlVJIS58CISMS95Oz4S2OrKTTJAmGYmG0AtxgB/10dLTY0Ly5AXkFcqGWe6x+gi1YT9exRlQy5WfOkMwkbiVLdI1iwmbAW0iZeCMBktZU7hgTtQdiauk9ZZ1O5Vj+YuOYDc0Deh7bGomMiXn14pe2HlpDuXiegcmNt64roezpDGQJQAnmwt+i92sYxnWD273fzJm0kdIQCVnyUrkyvj0+gmVXTHVDVUsX3ynJa0EKS/a7efPSLdH+jzhCS3B+dnAdqkn9wXyqDVPVSuOrIivktmEgd1au+J0RfMNB3QIkb8gDyTrP52uhaSXGppqfGqA+FjQww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IsJUD48X9AXv83wMcV0YFo5ac0Ej2uXNkeHQNFJxams=;
 b=NpywdOZfCz1EvamQQ+9dWW5slyBJPNYdnqiL5Ew++d6kZ7hVYuc+f5HSlkJQjlIewmKsXSOPO6+CdfkEnSF8tlK93p1BSY5taoGgOeMUSXG+pbU0IVY8QP7bXaQMUVvUNYDE0Qk2UBQlOyjTzrlgESlpN6mxFFfgh2ISagcafONMMkiLtfvukWf4oB3Xv+5TMvBjEf0Xl7vs3Dieriq/S6ajRmJzM945lgenC2TwKAn7of5m1RDa1K+JmixAwv4D7y108sIbDJRC7+3WwTO+q35MXu5SZiqwmRqm272op5v9KQNXHSMBLBGxXIWBF3F+Bs9shU+IFrTw8xVagwmRYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsJUD48X9AXv83wMcV0YFo5ac0Ej2uXNkeHQNFJxams=;
 b=ka7mvjwIqKRfvvNNiMy9AfYn7xvjIeqkvpTD6bEXLzaEMembvwKpDymwbPCJjIrZiirAGadbQbHSGftfku9PGDzEIYBkC/0aXhEoMZ8TVTECubmJrEWCB8M/8yRllGKCYvsr3BtXNZUmEeDK7ZoIVSSEjTP57I6UrCGZlW/ZrWw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH v1 2/5] tools/ocaml/libs/xc: add binding to
 xc_evtchn_status
Thread-Topic: [PATCH v1 2/5] tools/ocaml/libs/xc: add binding to
 xc_evtchn_status
Thread-Index: AQHZBOHxNXiRQvtogESX/t4C8rGLVK5Y590A
Date: Thu, 1 Dec 2022 11:34:04 +0000
Message-ID: <71ff1c99-4006-dd28-e01a-4c2946798f78@citrix.com>
References: <cover.1669829264.git.edvin.torok@citrix.com>
 <4daa8daa6398774e5cb0a90c30648c970faed6af.1669829264.git.edvin.torok@citrix.com>
In-Reply-To:
 <4daa8daa6398774e5cb0a90c30648c970faed6af.1669829264.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DM4PR03MB6975:EE_
x-ms-office365-filtering-correlation-id: 6b702444-2a0e-4b3a-9403-08dad38ff38e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 zvcmbL/uskLqKwu0YxIsfXcX8z5dG61IAuoYtrmqL0Xcb+pvoynb7iLlzwqrOe5nFQBriKtngAVxNntmBvx99F7dkOPaFdqbzBFxkJ331dmcWw6w2UEK9yEfrnDt1n7ibDYrusLvztnvl4rxBwXXFFl8SdEiq0u/NE6DWzsRmz2+pCg1Jf2NnTvSFP2MSsJbq//FX2z0geGWDA8UoYzbSJ2Oh9CMYRjeXihh/98r7ewmWsrWVGKwpw3gFpdyWEfj0vxYA1WHF39IX5CGD0wS31Et/Wk2A46jrlw1UMVkibTMYvwB560SJWvDci45DQUyQC5L7AAQ2c6srLrHFgOad4PeWPOO120KbInRlHa0TNN0Y0oqnZfQLfdjjypXif3Rladn/jzTAp40fPoiTf6Mpn+KDdZFU0KjdEGqgrD5CGrFepJxg31sdsqtOO26BsUp/UMnw65iaWrQD1OSXHv6Ok5Nbqkby5UiaECd2X6fXlCac3MjMy925QiVnwLZm3CKljmnlU0sY113xkWvL8UJfDBJBIN39RDVWnvUPTOvJBwkw+fMx8dfvRcCH+dsNpnzZvEOHaqeFlRPmS8cELyuMx/hwbQ1QjOAX/elBPZb2mSDWQ/fMAwt3ZXHDjSopBTrGOVOcYwZRxHM+kPFTdBRcJ8F2hffqw4LKjfKoCQN49O3rXtY1Ozm5qHyT9dtoR+SW8DihL/+yyqhzsyWPSf54kQCpmV6yoNYoP8c50CdVNKQ9vQlSYCxT+LpKGVm4Hz7BEueGzf2vDtpmWWzYBw0CQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199015)(5660300002)(64756008)(66476007)(66446008)(8676002)(4326008)(31686004)(41300700001)(66556008)(8936002)(6486002)(71200400001)(110136005)(36756003)(54906003)(76116006)(91956017)(478600001)(316002)(2906002)(31696002)(6512007)(2616005)(6506007)(38070700005)(186003)(86362001)(66946007)(53546011)(83380400001)(26005)(66574015)(82960400001)(107886003)(38100700002)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Wm50UjM4S1AwdHRLMTd2bDJ1VXRobFVtL1d3Z1V5aDAzcDdBd2RVL2VPYVk0?=
 =?utf-8?B?dUJaalNucXMxako5TUp2bXc0VFJwTExlZDU2cEVhb1RucUJncDMzS0ZaSlZz?=
 =?utf-8?B?ZXZmaE43YjErd1B6MVBCTW9mVjlFNDhpVmlSWTN4bXZHK3VCL1YxVnE3c3BJ?=
 =?utf-8?B?OTRuSWo2S0lYN0x0bmx3b09wMGFhOUpvOW1aVHJ6TVplNHdsM09PY2dxa3g0?=
 =?utf-8?B?djE5a1NPcFBQUGF3QkE0VFR3aUhrUHdEVWpXR0drQm1vaXJIRjZraC9KWFJ6?=
 =?utf-8?B?MlJZNFhVeEQrd08wQjkzY1RCVXdsWHQ0V2tRUyszVkx6clg3azdCYnVKenM1?=
 =?utf-8?B?VlpFdTRMK0R3THBGK3BIL2U0SENUd0F0SkNNSkh4ZS84dGdCWXVHekhBdml3?=
 =?utf-8?B?dmliTS96aW1TVFpxZnFNdk1RZDRCaWhCS0RReWVyMDNQSy9UOHJhVkdpS0hM?=
 =?utf-8?B?VmdPOEVIaEFTTEpDNGtKVmZJWFJjUFFJY3NET2l3OStHNkU5YTFYMFlWaFNV?=
 =?utf-8?B?TkZVcXN1RWlCdDZydkhoemZmd3Y5SmNFZHAvVlh4TGlwWFord0I3UHFiNjBC?=
 =?utf-8?B?V2REYmJwSkVmd2gvMVlSWWxyTFZ6N3VlYjNNNEkySW00ZEZ2ZlFuYnhyUW1i?=
 =?utf-8?B?Vm1TUW4vUGlWVG5ab2EvVzdOdXRPR1kvTG5KRzBHZXRERzJFOEZld1JRbitQ?=
 =?utf-8?B?dlFhM0g2VGNscWNjNmlQV0d1Q2h0TWlXZ3dpSzFxME9iME1xSi9VbHpJK0tP?=
 =?utf-8?B?SUYxSzZDaGdnaHo2ZmFKQVJWVUREWWx4M2JnRkxZYnVmN0tXZVVjRVhTMWhP?=
 =?utf-8?B?WVBYdld6THNFeDZ6UE83RnViN1hSWXpmK0lGQXdtd0szbk1PM0t6M1NraVVH?=
 =?utf-8?B?VThEbWRNT0pvQnFIN2hPbzcwSmlkOHhEb0RBUUwrNGZmR1RRTzRxb0RITloz?=
 =?utf-8?B?YUJwMmZuYmFicHRBK3FNT25CSVZHRFpuVEJVUXo1S1hEYU9RWm13SnBRNytK?=
 =?utf-8?B?KzhPYWVXcllZdnVRWmlCc3JyOTJQeDV4MTdvZXBVQmxCR1VUYUwrVUJyRm5O?=
 =?utf-8?B?V3F2WmFiVjlDTkpKaGRiSHZnMnBpWFdQNk4yQ1VXYU5DV2tNbXF6NEU2bE0x?=
 =?utf-8?B?dDJmdTZ4amp0VWdwNkJHQlR4MmxZYzBOYzZuWVZWeWthSHFiYzRoMXRuSnZM?=
 =?utf-8?B?Q2VmTmlUOHhjTGRUa3pIT3YvalpNbGZaTzNpTGJDQzJKQ21QRGVjNVM3YTZ0?=
 =?utf-8?B?NkpjQVJmUnhBcnArT2pTV3hTWDl5VVNIUzJLUGdUZTV6NHcrVm5PcWoyNnox?=
 =?utf-8?B?Wkp0eWI1OFRIZU9lSlBxOHlmdTRvMDlSeUJudE5keVNOSytFdG5hcGxaS20z?=
 =?utf-8?B?L0JqL28zNmViMzhmNW9uTys4UGU1dE12L3l4cWNUR0pKWHEwYmZhM3hMem1p?=
 =?utf-8?B?dHB6U0xSL0FZb1FRNDhBYnZDK3ArVVozZkZxWGQzT3oxSnFUcUhUaE9QN0lx?=
 =?utf-8?B?T2h1cGVXNHJSU1JpRlpQcUdYZGd1UTc5b3M2cmlCSjB2eit0NFdZYUh1bk9Z?=
 =?utf-8?B?ek9MRkRCQmpNbTRsenB5U0U1WXRDcjJKMFQ2NTI1S1ZraEFOMWozWEJvYU8y?=
 =?utf-8?B?UE94OWdnSXRRT1lDdjFsSkF0NGxZK3Vpd2ZtcG9mekdBRlIzZWJXVnpQTi9q?=
 =?utf-8?B?ZEhCbVdMUjg3ZFJjQkd4NWEzbEp6dE1IeURWbzlQOG12ZE5CUFYrQTRybDFP?=
 =?utf-8?B?RnJjNmxyZU9hVTlSTWQ5RFdSRlo2bDVVNlZxRzhDSTR0ZHpjeVVlZUtZNzVz?=
 =?utf-8?B?bFpxS2pPSThUSFg4YjlISFZjazVpL3dtdFBMaVl1NWhGSC93SnovQ0Q0TU5R?=
 =?utf-8?B?SzBuY05lUEJXOTBNQkhCenBDMG4yWUJ0VUphcGxZOHZTemN1cXJ4TVBqLzVZ?=
 =?utf-8?B?NVBLREFyeklWdjdJcVVWQUJJbm5BSmRGdHBNSnIrLzk5V25MbVNXQXp5d3dJ?=
 =?utf-8?B?WW95VDF1aTFkSlBiREpRbnFCVVJna0s2b0l1aXVCbm9EVk9KaGNKMEhwTUlh?=
 =?utf-8?B?QWpDN0w2WkZ2cE9KQjVZdmdXaFZxdllnT0puRlUzbHZ3Tm1aMEJFeXNUY1dF?=
 =?utf-8?Q?Xwaco96AVZiD9HdZGy3bTgF4R?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <26A47FDFF601CA45855403392CF76057@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AvQumaHIXMDMSdResh2UPRmZSdmLz48dvgRep0jpiwFxc35iJ1HOM2hAH+A1WyvlKsMwE78HETY+FUJ3nDVV7Opi6wnhoiLFsyQKXHMSydHO/1kuY6Nz7ji1ZwMcVNFCOYVjTKeMTgNh2dumSUvukLzWrnaTsYHw+hLF2iforYwABln6Qf14pOlHKwq+5+gLyTwHzUNmcB7VM918xG76tn5W+p/A/tjpnOYw3NTIXO6p2PplFTwJNdnhcujtdDAbEy0Nr6x2E4dP3CQ10BGvvCDfuTimnciTEB7f1gJSsPpMLInZv4Zn0LymE0HyZt68qLj/AxFM57vYklTatSzd+u+342Dxd+6OkxXJDgKlitwKJf2ZVKQLLVpnUqga/h17Te/htJdmTfqlYiqY/879JCZxGat3esDcluqbw/Q9pEeJUPyg/qwiIJ1cosgIaS3apZe3em9n/EZ6nJWNvMMuXnu5I97+QmdsDFmGNVtGkGWQ2/kguSJw05oofjcOoqtyMzIgvoec0rO4bi7MCpOwQpC9DCIERXESuDk0qBHQc4lMe0zjwbcqHRigERMtafOY0LDzueeEl4+Kc7hsOElHRyreqK3emo7Y1s3vYlEtENqUA1gQKxOv35OojCTdgIDHjAD4gJS9kY9rWENxK0WksqMqmLXgAM96mXHWj039naxQrsDHdrSbpDxVwgcAG1TCyGDWiiyJEOPc9IKY1nFiRZGJWuDFfjX40ORfX+WiqweYbOjdet5I+cwtP7MvKheQYaAaTLNiqv0LLDPNb2Yv196X07Ee/jqhtwSl5dvZ4H8CKd4NW/mkjRuBcOPf6PlJ8mAUVI5OK1NgTWrpVFhkfQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b702444-2a0e-4b3a-9403-08dad38ff38e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 11:34:04.5869
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yt6vRj/ogm6gg16EI/J75lKiXeRA14Qi+jqdYxi7Vpk1NywKR/4+QJpSPAabt8gLXaskapAmnVUmM9OLtNSkoLEKBHSQRX+KfUs/A6GizgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6975

T24gMzAvMTEvMjAyMiAxNzozMiwgRWR3aW4gVMO2csO2ayB3cm90ZToNCj4gVGhlcmUgaXMgbm8g
QVBJIG9yIGlvY3RsIHRvIHF1ZXJ5IGV2ZW50IGNoYW5uZWwgc3RhdHVzLCBpdCBpcyBvbmx5DQo+
IHByZXNlbnQgaW4geGVuY3RybC5oDQoNClllYWgsIHRoaXMgaXMgdmVyeSB1bmZvcnR1bmF0ZSwg
YmVjYXVzZSBpdCByZWFsbHkgd2FudGVkIHRvIGJlIHBhcnQgb2YNCnRoZSB4ZW5ldnRjaG4gc3Rh
YmxlIEFQSS9BQkkuDQoNCj4gVGhlIEMgdW5pb24gaXMgbWFwcGVkIHRvIGFuIE9DYW1sIHZhcmlh
bnQgZXhwb3NpbmcganVzdCB0aGUgdmFsdWUgZnJvbSB0aGUNCj4gY29ycmVjdCB1bmlvbiB0YWcu
DQo+DQo+IFF1ZXJ5aW5nIGV2ZW50IGNoYW5uZWwgc3RhdHVzIGlzIHVzZWZ1bCB3aGVuIGFuYWx5
emluZyBXaW5kb3dzIFZNcyB0aGF0DQo+IG1heSBoYXZlIHJlc2V0IGFuZCBjaGFuZ2VkIHRoZSB4
ZW5zdG9yZSBldmVudCBjaGFubmVsIHBvcnQgbnVtYmVyIGZyb20NCj4gd2hhdCBpdCBpbml0aWFs
bHkgZ290IGJvb3RlZCB3aXRoLg0KDQpUaGlzIHBhcmFncmFwaCBpcyB3aHkgd2UgbmVlZCBpdCBu
b3csIGJ1dCBpdCdzIG5vdCByZWFsbHkgcmVsZXZhbnQgZm9yDQp0aGUgdXBzdHJlYW0gY29tbWl0
LsKgIEknZCBkcm9wIHRoaXMgc2VudGVuY2UsIGFuZCBzaW1wbHkgaG93IHRoZSBsb3dlcg0Kb25l
IG5vdGluZyB0aGUgc2ltaWxhcml0eSB0byBsc2V2dGNobi4NCg0KPiBUaGUgaW5mb3JtYXRpb24g
cHJvdmlkZWQgaGVyZSBpcyBzaW1pbGFyIHRvICdsc3RldnRjaG4nLCBidXQgcmF0aGVyIHRoYW4N
Cg0KImxzZXZ0Y2huIi4NCg0KPiBwYXJzaW5nIGl0cyBvdXRwdXQgaXQgcXVlcmllcyB0aGUgdW5k
ZXJseWluZyBBUEkgZGlyZWN0bHkuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEVkd2luIFTDtnLDtmsg
PGVkdmluLnRvcm9rQGNpdHJpeC5jb20+DQo+IC0tLQ0KPiAgdG9vbHMvb2NhbWwvbGlicy94Yy94
ZW5jdHJsLm1sICAgICAgfCAxNCArKysrKysrDQo+ICB0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0
cmwubWxpICAgICB8IDE1ICsrKysrKysNCj4gIHRvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9z
dHVicy5jIHwgNjUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIDMgZmlsZXMgY2hh
bmdlZCwgOTQgaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwvbGli
cy94Yy94ZW5jdHJsLm1sIGIvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1sDQo+IGluZGV4
IDJlZDc0NTRiMTYuLmMyMWUzOTFmOTggMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL29jYW1sL2xpYnMv
eGMveGVuY3RybC5tbA0KPiArKysgYi90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWwNCj4g
QEAgLTI2Nyw2ICsyNjcsMjAgQEAgZXh0ZXJuYWwgZXZ0Y2huX2FsbG9jX3VuYm91bmQ6IGhhbmRs
ZSAtPiBkb21pZCAtPiBkb21pZCAtPiBpbnQNCj4gICAgPSAic3R1Yl94Y19ldnRjaG5fYWxsb2Nf
dW5ib3VuZCINCj4gIGV4dGVybmFsIGV2dGNobl9yZXNldDogaGFuZGxlIC0+IGRvbWlkIC0+IHVu
aXQgPSAic3R1Yl94Y19ldnRjaG5fcmVzZXQiDQo+ICANCj4gK3R5cGUgZXZ0Y2huX2ludGVyZG9t
YWluID0geyBkb206IGRvbWlkOyBwb3J0OiBpbnR9DQoNClN0cmljdGx5IHNwZWFraW5nLCBwb3J0
IG5lZWRzIHRvIGJlIGludDMyLg0KDQpBQkktd2lzZSwgaXQgY2FuIGJlIGNvbmZpZ3VyZWQgYXMg
bGFyZ2UgYXMgMl4zMi0yIGR1cmluZyBkb21haW4gY3JlYXRpb24uDQoNCkhvd2V2ZXIsIEZJRk8g
Y3VycmVudGx5IHRvcHMgb3V0IGF0IDJeMTcgYW5kIGhhcyBhIHRoZW9yZXRpY2FsIG1heGltdW0N
CmF0IDJeMjgsIHNvIHBlcmhhcHMgaW50IG91Z2h0IHRvIGVub3VnaCBmb3Igbm93Lg0KDQo+ICsN
Cj4gK3R5cGUgZXZ0Y2huX3N0YXQgPQ0KPiArICB8IEVWVENITlNUQVRfdW5ib3VuZCBvZiBkb21p
ZA0KPiArICB8IEVWVENITlNUQVRfaW50ZXJkb21haW4gb2YgZXZ0Y2huX2ludGVyZG9tYWluDQo+
ICsgIHwgRVZUQ0hOU1RBVF9waXJxIG9mIGludA0KPiArICB8IEVWVENITlNUQVRfdmlycSBvZiBp
bnQNCg0KU2ltaWxhciBjb21tZW50LsKgIEEgdmNwdSBpZCBzaG91bGQgaW4gcHJpbmNpcGxlIGJl
IGludDMyDQoNCj4gKyAgfCBFVlRDSE5TVEFUX2lwaQ0KDQpOb3JtYWxseSB3aGVuIGhhdmluZyBh
biBlbnVtZXJhdGlvbiBsaWtlIHRoaXMsIHdlIHdhbnQgdG8gaG9vayB1cCB0aGUNCmJ1aWxkLXRp
bWUgQUJJIGNoZWNrLg0KDQpCdXQgaW4gdGhpcyBjYXNlLCBpdCdzIHByb2R1Y2VkIGJ5IHRoZSBi
aW5kaW5ncyAobm90IGNvbnN1bWVkIGJ5IHRoZW0pLA0KYW5kIHRoZXJlJ3MgYW4gZXhjZXB0aW9u
IHJhaXNlZCBpbiB0aGUgZGVmYXVsdCBjYXNlLCBzbyBJIGRvbid0IHRoaW5rIHdlDQpuZWVkIHRo
ZSBidWlsZC10aW1lIEFCSSBjaGVjayBmb3IgYW55IGtpbmQgb2Ygc2FmZXR5IChhbmQgdGhlcmVm
b3JlDQpzaG91bGRuJ3QgZ28gdG8gdGhlIHJlYXNvbmFibHktaW52YXNpdmUgZWZmb3J0IG9mIGFk
ZGluZyB0aGUgY2hlY2spLg0KDQo+IGRpZmYgLS1naXQgYS90b29scy9vY2FtbC9saWJzL3hjL3hl
bmN0cmxfc3R1YnMuYyBiL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jDQo+IGlu
ZGV4IGQzMDU4NWYyMWMuLjY3ZjM2NDgzOTEgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL29jYW1sL2xp
YnMveGMveGVuY3RybF9zdHVicy5jDQo+ICsrKyBiL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3Ry
bF9zdHVicy5jDQo+IEBAIC02NDEsNiArNjQxLDcxIEBAIENBTUxwcmltIHZhbHVlIHN0dWJfeGNf
ZXZ0Y2huX3Jlc2V0KHZhbHVlIHhjaCwgdmFsdWUgZG9taWQpDQo+ICAgICAgQ0FNTHJldHVybihW
YWxfdW5pdCk7DQo+ICB9DQo+ICANCj4gK0NBTUxwcmltIHZhbHVlIHN0dWJfeGNfZXZ0Y2huX3N0
YXR1cyh2YWx1ZSB4Y2gsIHZhbHVlIGRvbWlkLCB2YWx1ZSBwb3J0KQ0KPiArew0KPiArICAgIENB
TUxwYXJhbTMoeGNoLCBkb21pZCwgcG9ydCk7DQo+ICsgICAgQ0FNTGxvY2FsNChyZXN1bHQsIHJl
c3VsdF9zdGF0dXMsIHN0YXQsIGludGVyZG9tYWluKTsNCj4gKyAgICB4Y19ldnRjaG5fc3RhdHVz
X3Qgc3RhdHVzOw0KPiArICAgIGludCByYzsNCj4gKw0KPiArICAgIG1lbXNldCgmc3RhdHVzLCAw
LCBzaXplb2Yoc3RhdHVzKSk7DQo+ICsgICAgc3RhdHVzLmRvbSA9IF9EKGRvbWlkKTsNCj4gKyAg
ICBzdGF0dXMucG9ydCA9IEludF92YWwocG9ydCk7DQoNCnhjX2V2dGNobl9zdGF0dXNfdCBzdGF0
dXMgPSB7DQrCoMKgwqAgLmRvbSA9IF9EKGRvbWlkKSwNCsKgwqDCoCAucG9ydCA9IEludF92YWwo
cG9ydCksDQp9Ow0KDQppcyB0aGUgbWFyZ2luYWxseSBwcmVmZXJyZWQgd2F5IG9mIGRvaW5nIHRo
aXMuwqAgSXQgcmVtb3ZlcyBwb3RlbnRpYWwNCmlzc3VlcyB3aXRoIHR5cG8taW5nIHRoZSBtZW1z
ZXQoKS4NCg0KPiArDQo+ICsgICAgY2FtbF9lbnRlcl9ibG9ja2luZ19zZWN0aW9uKCk7DQo+ICsg
ICAgcmMgPSB4Y19ldnRjaG5fc3RhdHVzKF9IKHhjaCksICZzdGF0dXMpOw0KPiArICAgIGNhbWxf
bGVhdmVfYmxvY2tpbmdfc2VjdGlvbigpOw0KPiArDQo+ICsgICAgaWYgKCByYyA8IDAgKQ0KPiAr
ICAgICAgICBmYWlsd2l0aF94YyhfSCh4Y2gpKTsNCj4gKw0KPiArICAgIGlmICggc3RhdHVzLnN0
YXR1cyA9PSBFVlRDSE5TVEFUX2Nsb3NlZCApDQo+ICsgICAgICAgIHJlc3VsdCA9IFZhbF9ub25l
Ow0KPiArICAgIGVsc2UNCj4gKyAgICB7DQoNClRoaXMgaXMgYWN0dWFsbHkgb25lIGV4YW1wbGUg
d2hlcmUgdXNpbmcgYSBzZWNvbmQgQ0FNTHJldHVybiB3b3VsZA0Kc2ltcGx5IHRoaW5ncyBzdWJz
dGFudGlhbGx5Lg0KDQpzd2l0Y2ggKCBzdGF0dXMuc3RhdHVzICkNCnsNCmNhc2UgRVZUQ0hOU1RB
VF9jbG9zZWQ6DQrCoMKgwqAgQ0FNTHJldHVybihWYWxfbm9uZSk7DQoNCmNhc2UgRVZUQ0hOU1RB
VF91bmJvdW5kOg0KwqDCoMKgIC4uLg0KDQpXb3VsZCByZW1vdmUgdGhlIG5lZWQgZm9yIHRoZSBv
dXRlciBpZi9lbHNlLg0KDQoNCj4gKyAgICAgICAgc3dpdGNoICggc3RhdHVzLnN0YXR1cyApDQo+
ICsgICAgICAgIHsNCj4gKyAgICAgICAgY2FzZSBFVlRDSE5TVEFUX3VuYm91bmQ6DQo+ICsgICAg
ICAgICAgICBzdGF0ID0gY2FtbF9hbGxvYygxLCAwKTsgLyogMXN0IG5vbi1jb25zdGFudCBjb25z
dHJ1Y3RvciAqLw0KPiArICAgICAgICAgICAgU3RvcmVfZmllbGQoc3RhdCwgMCwgVmFsX2ludChz
dGF0dXMudS51bmJvdW5kLmRvbSkpOw0KPiArICAgICAgICAgICAgYnJlYWs7DQo+ICsNCj4gKyAg
ICAgICAgY2FzZSBFVlRDSE5TVEFUX2ludGVyZG9tYWluOg0KPiArICAgICAgICAgICAgaW50ZXJk
b21haW4gPSBjYW1sX2FsbG9jX3R1cGxlKDIpOw0KPiArICAgICAgICAgICAgU3RvcmVfZmllbGQo
aW50ZXJkb21haW4sIDAsIFZhbF9pbnQoc3RhdHVzLnUuaW50ZXJkb21haW4uZG9tKSk7DQo+ICsg
ICAgICAgICAgICBTdG9yZV9maWVsZChpbnRlcmRvbWFpbiwgMSwgVmFsX2ludChzdGF0dXMudS5p
bnRlcmRvbWFpbi5wb3J0KSk7DQo+ICsgICAgICAgICAgICBzdGF0ID0gY2FtbF9hbGxvYygxLCAx
KTsgLyogIDJuZCBub24tY29uc3RhbnQgY29uc3RydWN0b3IgKi8NCj4gKyAgICAgICAgICAgIFN0
b3JlX2ZpZWxkKHN0YXQsIDAsIGludGVyZG9tYWluKTsNCj4gKyAgICAgICAgICAgIGJyZWFrOw0K
PiArICAgICAgICBjYXNlIEVWVENITlNUQVRfcGlycToNCj4gKyAgICAgICAgICAgIHN0YXQgPSBj
YW1sX2FsbG9jKDEsIDIpOyAvKiAzcmQgbm9uLWNvbnN0YW50IGNvbnN0cnVjdG9yICovDQo+ICsg
ICAgICAgICAgICBTdG9yZV9maWVsZChzdGF0LCAwLCBWYWxfaW50KHN0YXR1cy51LnBpcnEpKTsN
Cj4gKyAgICAgICAgICAgIGJyZWFrOw0KPiArDQo+ICsgICAgICAgIGNhc2UgRVZUQ0hOU1RBVF92
aXJxOg0KPiArICAgICAgICAgICAgc3RhdCA9IGNhbWxfYWxsb2MoMSwgMyk7IC8qIDR0aCBub24t
Y29uc3RhbnQgY29uc3RydWN0b3IgKi8NCj4gKyAgICAgICAgICAgIFN0b3JlX2ZpZWxkKHN0YXQs
IDAsIFZhbF9pbnQoc3RhdHVzLnUudmlycSkpOw0KPiArICAgICAgICAgICAgYnJlYWs7DQo+ICsN
Cj4gKyAgICAgICAgY2FzZSBFVlRDSE5TVEFUX2lwaToNCj4gKyAgICAgICAgICAgIHN0YXQgPSBW
YWxfaW50KDApOyAvKiAxc3QgY29uc3RhbnQgY29uc3RydWN0b3IgKi8NCj4gKyAgICAgICAgICAg
IGJyZWFrOw0KPiArDQo+ICsgICAgICAgIGRlZmF1bHQ6DQo+ICsgICAgICAgICAgICBjYW1sX2Zh
aWx3aXRoKCJVbmtvd24gZXZ0Y2huIHN0YXR1cyIpOw0KPiArICAgICAgICB9DQoNCldlJ2Qgbm9y
bWFsbHkgaGF2ZSBhIGJsYW5rIGxpbmUgaGVyZS4NCg0KPiArICAgICAgICByZXN1bHRfc3RhdHVz
ID0gY2FtbF9hbGxvY190dXBsZSgyKTsNCj4gKyAgICAgICAgU3RvcmVfZmllbGQocmVzdWx0X3N0
YXR1cywgMCwgVmFsX2ludChzdGF0dXMudmNwdSkpOw0KPiArICAgICAgICBTdG9yZV9maWVsZChy
ZXN1bHRfc3RhdHVzLCAxLCBzdGF0KTsNCj4gKw0KPiArICAgICAgICAvKiBUYWdfc29tZSBhbmQg
Y2FtbF9hbGxvY19zb21lIGFyZSBtaXNzaW5nIGluIG9sZGVyIHZlcnNpb25zIG9mIE9DYW1sDQo+
ICsgICAgICAgICAqLw0KDQpDYW4gd2UgZG8gdGhlIHVzdWFsDQoNCiNpZm5kZWYgVGFnX3NvbWUN
CiMgZGVmaW5lIFRhZ19zb21lIC4uLg0KI2VuZGlmDQoNCmF0IHRoZSB0b3AsIGFuZCB1c2UgaXQg
dW5jb25kaXRpb25hbGx5IGhlcmU/DQoNCmNhbWxfYWxsb2Nfc29tZSgpIGlzIHBlcmhhcHMgbGVz
cyBpbnRlcmVzdGluZyBhcyBpdCBvbmx5IGFwcGVhcmVkIGluDQpPY2FtbCA0LjEyIEFGQUlDVCwg
YnV0IHdlIGNvdWxkIGFsc28gaGF2ZSBzb21lIGlmZGVmYXJ5IGZvciB0aGF0IGF0IHRoZQ0KdG9w
IG9mIHRoZSBmaWxlLg0KDQpJIGRvbid0IGtub3cgd2hldGhlciB3ZSBoYXZlIG9wZW5jb2RlZCBv
cHRpb25zIGVsc2V3aGVyZSBpbiB0aGUNCmJpbmRpbmdzLCBidXQgaXQgY2VydGFpbmx5IHdvdWxk
IGJlIHJlZHVjZSB0aGUgYW1vdW50IG9wZW5jb2RpbmcgdGhhdA0KZXhpc3RzIGZvciBzdGFuZGFy
ZCBwYXR0ZXJucy4NCg0KfkFuZHJldw0K

