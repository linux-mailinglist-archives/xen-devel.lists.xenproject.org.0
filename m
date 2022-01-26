Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB6F49CB45
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 14:47:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260914.451179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCidx-0000oT-6T; Wed, 26 Jan 2022 13:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260914.451179; Wed, 26 Jan 2022 13:47:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCidx-0000mV-15; Wed, 26 Jan 2022 13:47:25 +0000
Received: by outflank-mailman (input) for mailman id 260914;
 Wed, 26 Jan 2022 13:47:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DU/T=SK=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nCidv-0000mJ-C8
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 13:47:23 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b9f8274-7eae-11ec-8eb8-a37418f5ba1a;
 Wed, 26 Jan 2022 14:47:22 +0100 (CET)
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
X-Inumbo-ID: 7b9f8274-7eae-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643204842;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GW3JUCGlCrKLi4LxHgdYKIzVB9h0wVzBwF+2ddF5u30=;
  b=aigu0x14PywxRvrvHtYCqBWLBbEY9NuxjW5g8zinOEGGn4AdC5m9ydX7
   LUMJmo8rXT4+NioafuMpgXthjMTzoxcHn+j+A+QiWBfeFyjPH6VFGaDqp
   2uikeUcUJTLNNwLi6y/silEstnp5w+vB93Ie9YD+LWZqYyNKmTrm7q+cc
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: wVb+Sbdw22swfv33BIkJaRqPHEJDzias5u2ZS4z522m6WcqFqxS4PVIafJBCJ9hcYxEsrfZ0J8
 gdp7afgxoeQmGx5vmUh59p13y6pdxPBsNKBRptqEukrawjTD4qEFtxAm1giWIxPsK5qsSqjF2Q
 disYmPXDGY91abXrPFOedYS1K/ydfAiHw50lurNRv+VWiBnhAnwaJKH8NPiEusm+u5YDe7wmxC
 LPEEHnzkpQ9K8PZxXKPLYfQEzXMhKUl8waWBtyuwYF4PvP5baUnaod4Ay9Wxam3yQ0xhYheSwg
 Zy3C8a6THFCS761SIcMUGWuv
X-SBRS: 5.2
X-MesageID: 63206005
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:BxJklq/EpJ/u2GgUCIKUDrUDbXmTJUtcMsCJ2f8bNWPcYEJGY0x3z
 GtMXGyOPqyNYmumf9ogOo3j8B8GuMTTzoBlQFFrrC48E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dj3NYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhWz
 c0UirmhTzs5FYbDm+pBDEBzDBlxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4VR66AP
 5JEAdZpRDHFbAxmFwcuM7UdgeSYuCbcQyACq13A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru3U70HxUbP9y30iee/zSngeqntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0fN9IStIf+Qex2oH/7AWXWjddZSF5Z4lz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPPt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb5NuRECnCBtJ6sybp1qHHb7
 RDofODFtIgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0lfRw0bJpYJG+2C
 KM2he+3zMUCVJdNRfQvC79d9uxwlfSwfTgbfq28giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmD2PLbimkUXP+efONRa9FOZeWHPTP79R0U9xiFiPm
 zqpH5HUm0w3vSyXSnS/zLP/2nhTfSFkXsin8pIOHgNBSyI/cFwc5zbq6epJU6RunrhPl/eO+
 Xe4W0RCz0H4i2GBIgKPAk2Popu2NXqmhX5kbyEqI3iy3H0vPdSm4KsFLsNldrg77u1zi/VzS
 qBdKcmHB/1OTBXB+igcMsah/NAzKkzziFLcJTehbRg+Y4VkG17D9Oj7c1a97yIJFCe265cz+
 uXyygPBTJMfbA1+F8KKOum3xla8sCFFyuJ/VkfFOPdJf0Do/NQ4IiD9lKZvccoNNQ/C1n2R0
 APPWUUUouzEookU9tjVhP/b89f1QrUmRkcDRjvV97e7MyXe71GP+44YXbbaZy3ZWUP15L6mO
 bdfwcbjPaBVh11NqYd9TepmlPps+9v1qrZG5Q14B3GXPU+zA7ZtL3Taj8lCsqpBmu1QtQesA
 x/d/9BbPfOCOd//EU5XLw0gN7zR2fYRkzjUzPI0PESlu3MnoOvZCR1fb0uWlShQDLppK4d0k
 +4utfkf5xG7lhd3YM2NiTpZ9jjUI3ENO0n9Wkr23GM/ZtIX92x/
IronPort-HdrOrdr: A9a23:lhRF1KuwV6ohOgaVyZafNdYs7skC0oMji2hC6mlwRA09TyXGra
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
X-IronPort-AV: E=Sophos;i="5.88,318,1635220800"; 
   d="scan'208";a="63206005"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DPnIivwqsWIOJG3Vl6MUhgedDyzGevaiNtKn8s2b6PedzuO3arQcFAucbi7b4WwgR1SYfcLMnfSyGi2VCb7A7jltEGqTDRtNFzkrL90OjdongkzSFv+ZF5Z4v6tJtetc1V8xxBkrbRaYNOEqCnMHoMJxjiAQWO9wXakE+nlHCz/5MrhHrfG/dIo2Zogq/hGBjoul/o/dCOYq53US7VYqKSFiRs9xE9HjhkCGLIV5alhqxGjLcUqiCGqzQlxpUbN+mxi2AyJrmWjCBZ2rLIdap/4cT9+qc6rfcRs1LQl3tHhqzVBQWx8ObDeoe1Kb8i/TVV0dq5E4zsA/1FvELstRMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GW3JUCGlCrKLi4LxHgdYKIzVB9h0wVzBwF+2ddF5u30=;
 b=lXi1hn6Mun3uWMBI9CZLWdfU8MwGq/qQMw+avr+tEeQN7jY9Aqjh6p1aWz96F5qKM7SnL1AayDaT0e5CIJamJqiWkdh14eOCDaFgncc4goqO/58F8q2aUEBNeqhbLyTJHbLcSd5SJsN5MucfKTpQ4/4Jr56GwIOvulA6j0hgtes98zknffOZg2oT2P5wRJADDja2ZlhhPe2+XORue0pO1lDR1EG2pQsfP8K4yhB+XhCqcpiJQwTcFxvkyOzeb4tjWOLml/wyaLrJq4X48+ky1ccmeEXuyXAqa8PbTrvCeJSuMgF+AK8imQOr47P0V9U0gLdyQqUXK5zDq0MrftIFTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GW3JUCGlCrKLi4LxHgdYKIzVB9h0wVzBwF+2ddF5u30=;
 b=oz3bYsmaGyXX5FyAZ+DxLLmaad3dntuFwr3dHKb7fbwQjN9Rj1mtGbs9PypvkHHzfsvBUAaA/DbVApbqJIrwKgIxn7I8/PweQHJO519HUg+0jVeEl3M1/Wq/9l3ZxwxTmugYLPJ9QWjwjki1JAB4RfBhP5dAu2VoA2b1n5gMXEw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/8] x86/boot: Collect AMD speculative features earlier
 during boot
Thread-Topic: [PATCH 2/8] x86/boot: Collect AMD speculative features earlier
 during boot
Thread-Index: AQHYEpEIIirjIKT/SEuiwA9Vczaqaqx1P8uAgAAO04CAAAK1AA==
Date: Wed, 26 Jan 2022 13:47:16 +0000
Message-ID: <5de84014-b1a7-7ddd-70e1-9aadf0387ee1@citrix.com>
References: <20220126084452.28975-1-andrew.cooper3@citrix.com>
 <20220126084452.28975-3-andrew.cooper3@citrix.com>
 <YfFCLxnGDeuk/va0@Air-de-Roger>
 <0d457a94-64bc-bbd4-e7ce-59c3b1c1d2f4@citrix.com>
In-Reply-To: <0d457a94-64bc-bbd4-e7ce-59c3b1c1d2f4@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97f8ab88-b5fd-4e16-a34d-08d9e0d25d85
x-ms-traffictypediagnostic: DM5PR03MB3388:EE_
x-microsoft-antispam-prvs: <DM5PR03MB3388720EA69A3F0EE69740D7BA209@DM5PR03MB3388.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J3a8IWE4EaUnE84faQAV2lEkahouyn6AWZLVjlyGVr/8af/x/F6AoirFwivgoA0gZJ+qeRNGWVjFqaCe50V2TEUt2FcuFpGupUO8xFjRbQSXOF/wgWJ+4o/jdEJzACCPoONvXl1hxUIPn24DkaB684YXHVhiHr1TNtzcN3pQpC1AEmJuc4hupCn606iOE/6odDEX5VYchCw2ULj863kWxyGRe1qLyzfwa98zLjBxyuqTFnd+/rKuaWncJrP3/c0QoWZAHsKNEkwEjiqPybFV0BoDqwVJXy/yN4VkZI2j2flelqj/5pOIGJjv4zKZs3g84qvX6cZx3xcteXmXoVjkR8MMsEBKhglHiTZNmDP8CcgA9UMLQlMdRMI99AlNRv9RSfcyXBkmQBT2c1WiBkMXgej9QNWYCoyRMmqa1WYWQ3RQqY0I9NGiYbGmXFqiRLN/VL4fG6LeUs2H0CN4WHQfj2j7L5xkBBzN5kg3Vcv4x2lV7NKOX59ew5/EhPps1BX4c6645P/bZV5mZCkeUSTlmEDq3qrO6M0ZcjvSLc9HPJnX5Q82w/JD7vBCBHPgvazN8PTtDSHiDpBnueJReDm2ZW6I9hLaEfmG4eL9zKfbBP+2PVDaYsICegGY5e2qcekvz0kaTujkfayg/JaHNgNT0hAQStlF8celZPJDcbjMfUpx96XNLn56XsZ/A58zw4RMlbaCNCYnb0NAQasM5l4e3HuWQndsUcHPSW8gQrvPn6c46OkvgKAKXLiAYnkUofS/j5/j/HMxq3MrpcsSwpCl0g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31686004)(4326008)(6486002)(2906002)(31696002)(66946007)(5660300002)(186003)(508600001)(91956017)(86362001)(53546011)(6506007)(82960400001)(6512007)(66446008)(83380400001)(316002)(71200400001)(6862004)(6636002)(38100700002)(38070700005)(26005)(8676002)(2616005)(64756008)(54906003)(36756003)(122000001)(66476007)(66556008)(8936002)(76116006)(37006003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sy9wOGpmdTlobDFnVXFYU3BtQ2VtRnp3bEtyNUR2RG05N3o5TDdtUzlxbi90?=
 =?utf-8?B?TUY5NXF2WTNtU2JNc1FkK29QUVZPTlMrZlRicUhDdzJ0UThodWo2UW5qSXZW?=
 =?utf-8?B?cEE1NS8wSVhkSmdSUHErRy9TU3dDT294WG1WNHZXZ0xvYnJZQmhmTHdHTWlm?=
 =?utf-8?B?VTlaRnQvQndmYmdQSGQ0eWpvZE8yTGRUanhxdG1tdUxuQzJFdEJjMHR3WTlI?=
 =?utf-8?B?TTBKWnRQZ2RBVW1jZkJzVDF5aStPamVSUjBzRytRZEFManI3dUh3OGJ3Qncy?=
 =?utf-8?B?UnZZVUs5RTEyTEp4ZDN5OVI5d1BiU1llWUcrUjMyNjIzTXQwQjhzaE5WY29s?=
 =?utf-8?B?SWh6S1NhbDRVdk1VQTNvRE5ObjRwZWJKNWJMWDBFUERwQlYzL2MxNDRnSllQ?=
 =?utf-8?B?NTYrNFZMVTNOdURiUjEvQ3VyUGFaWjRuUHU5VUp6WGxpT3pTY2RkdURGdjIx?=
 =?utf-8?B?M1g5b2xSVXFKQWthcDA0WEhlaXdWZG5QRGpxSnkrRVFnWHlYNlFBY21abDZo?=
 =?utf-8?B?OHcrei9aNnJCYmpLZ2ZFY0Z1eE1mUHFuVWo2ZjcyZWZMVU9zZHJrQVozdjRS?=
 =?utf-8?B?V3hVVzRoSUQzekJnU2NJRHVOalBCSGRhM1l0ZE1VeEpOQVdsSEROUmRpUUZv?=
 =?utf-8?B?b0t1a2ljdng1UCtoUmNkeGZFSmpuWjFiSnZwcDU0SnN5M1F5clR0dGtJYVMv?=
 =?utf-8?B?QmY1dDBKa1EySnV2Y0o5SitUUkRWNEhKdFdER1IzaG5tNVJ2bjYrYWJTd2lo?=
 =?utf-8?B?NVpLMFlLK0JtRVZiNDVHa0xPZ0tobzlxdVB3UlZHaDBjbDloM1lDVUkyL3ZD?=
 =?utf-8?B?VlE3cDl6QThXOU9hakwvcWp2Vm5LUE10bDVBTmloY1JoSXNucFFERVFaZmFq?=
 =?utf-8?B?dFFVV3NFRGRQUlgvSzUyNWY0UVhLTzRKbmdNMTg1bHNMVldiSWRPTWthTC9S?=
 =?utf-8?B?NXF6UVdUZlh3Z21TVFVtZno2Zk15djQrdzk3STNJNnVHQmpDcWJ2akZPRVJQ?=
 =?utf-8?B?aWtybXhLRXpBU2RlV0ZBd3ZsSGpQWW9Yc3VHQjE4NXdxL1d5UVlkNXA2U08r?=
 =?utf-8?B?VE5NWUoyT29jSFBJWk1raVVCaml4bTEvRC95cDZZV2JwRzRHVXhYNC9uVU5N?=
 =?utf-8?B?RFlONzJUNFVxT21jaVIraUplTWo0NUt1T3BUT3NEbWg1ZGFBeHVNUkI5QWFK?=
 =?utf-8?B?aUJ1eDZBRXh3SzBJSFlRTDZHVlRjdHN6alY0dEZmMm5BWk1JV1M1K2RnVzRX?=
 =?utf-8?B?VGpvcUNJU1ZaWUIycHdwdWZKTzRxdlB6ejgzYnVNMTlOcnBnNGF4QkJsaHJK?=
 =?utf-8?B?dG5kL1pDOUpLZlBDa0RHSUxRblJVRENvLzRaU3pMMEdtZzB6d01rTWtsdnQy?=
 =?utf-8?B?SGhQWWwxdDN2OGN0dXBmWjAvU0k0Sk53UklIeityd2Vmb3NBaG1DK2l6ckx6?=
 =?utf-8?B?aFl4MndERW1ldVMza3luWDdpaEZ2Kzc5VVExeDdSa3IzOHFnVlBqN1oyMUdO?=
 =?utf-8?B?R1JyU21DdzE1WU44MXVrNkw4TGJBT0FMTHlzVEcyWVNDTU5tQk9rRVJpdlM4?=
 =?utf-8?B?b256Nm1idHFaWTF6RkZHQmxSaWR6a2MrcDdtU2UxcU1BTys0RENmVkUrRnhC?=
 =?utf-8?B?M2M4R0VGMm02U25jZmtzVFVaYU5NN1V0eDRwYk5OQTRqTmdmUitwYTQ4TUZi?=
 =?utf-8?B?S3lsd0pJNW9QTFlNTUtSTGRLZnJEQ3dQS04wNkoxc1FWRjg3MHpFTStFUHpQ?=
 =?utf-8?B?Nk1QZWk3OHpEc1pZTTVoTU5SMHRYTjNhLzllZ0Y0M2p0MjZhcGd0THdScGVU?=
 =?utf-8?B?TXoxL3FoZkxIZXRuajNtQzJlZmVtYXZTVm83VnBYVHhNVnRRMkdGNWZQUzYv?=
 =?utf-8?B?S2dqSXNsSlZ2QVFUVjU0K0NJR0ROSlpIRHlQK0pXUWszVXE5ajZUem1GaWVa?=
 =?utf-8?B?TnFwVnJRbkFSd2V5amNsSENMMGM5b1VDc0o4MkFjSDgzSllyOFYzZ2Y3SXFt?=
 =?utf-8?B?bGdpdTlsVGlScnpwa29UMGIxdlJsZDJEdDcxVnhGTTg3ODBBUUc5UmZxTVBv?=
 =?utf-8?B?WXhaZFVDaklzejltYXhJK2ZzVGV4QlJGZGh4UW42blZ3Rk9Vc0pWUjN6cENK?=
 =?utf-8?B?UmdBVytsYm1kK0hUTElsZnhWV1pGOEVnbUcwUDJyb1o2K1ptL0VsYkFMbXl6?=
 =?utf-8?B?aCtoVkhCNEF0RlpjVXVNcVgvUGlOeFgzMHgwb3g4MElQaVEzaklmUzR3eERB?=
 =?utf-8?B?V1FXU0llNlo3UTJEYkd3bzhGWHNRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9054E9E96B1FE1469B30C3357176F02D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f8ab88-b5fd-4e16-a34d-08d9e0d25d85
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2022 13:47:16.5491
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GCSmLkZ6hR7Bb0lz/wMFpTSi5EVYIrdeuza8VSsnI0V+t4ik9kp/ElyK/f4Eq4yai/m6cTg66srDpi4QsrdC92iP4B+vdeVkkFIhkwftAyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3388
X-OriginatorOrg: citrix.com

T24gMjYvMDEvMjAyMiAxMzozNywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjYvMDEvMjAy
MiAxMjo0NCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+IE9uIFdlZCwgSmFuIDI2LCAyMDIy
IGF0IDA4OjQ0OjQ2QU0gKzAwMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+Pj4gQWxsIEFNRCBJ
QlJTLXJlbGF0ZWQgZmVhdHVyZXMgYXJlIGluIENQVUlELjB4ODAwMDAwMDguZWJ4LiAgQ29sbGVj
dCB0aGVtIGluDQo+Pj4gZWFybHlfY3B1X2luaXQoKSBzbyBpbml0X3NwZWN1bGF0aXZlX21pdGln
YXRpb25zKCkgY2FuIHVzZSB0aGVtLg0KPj4+DQo+Pj4gUmV3b3JrIHRoZSBleGlzdGluZyBsb2dp
YyBzdHJ1Y3R1cmUgdG8gZmlsbCBpbiBjLT5leHRlbmRlZF9jcHVpZF9sZXZlbCBhbmQNCj4+PiBz
ZXBhcmF0ZSBvdXQgdGhlIGFtYmlndW91cyB1c2Ugb2YgZWJ4IGluIGFuIG90aGVyd2lzZSAweDgw
MDAwMDA4LXNwZWNpZmljDQo+Pj4gbG9naWMgYmxvY2suDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPj4gUmV2aWV3ZWQt
Ynk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPj4NCj4+IEl0IHdv
dWxkIGJlIGdvb2QgdG8gdXBkYXRlIHRoZSBjb21tZW50IGFoZWFkIG9mIGVhcmx5X2NwdV9pbml0
IHRvDQo+PiBtZW50aW9uIGl0IG5vdyBhbHNvIGdhdGhlciBzcGVjdWxhdGlvbi1yZWxhdGVkIGZp
ZWxkcyBmcm9tIENQVUlEIGluDQo+PiBvcmRlciB0byBkbyBlYXJseSBzZXR1cCBvZiBtaXRpZ2F0
aW9ucy4NCj4+DQo+PiBJIHRoaW5rIHlvdSBjb3VsZCBhbHNvIHVzZSBib290X2NwdV9kYXRhIGlu
IHNwZWNfY3RybC5jIHByaW50X2RldGFpbHMNCj4+IGluc3RlYWQgb2YgZmV0Y2hpbmcgYWdhaW4g
dGhlIGNwdWlkIGxlYWZzPw0KPiBIbW0gLSBJIG1heSBoYXZlIGEgbWlzdGFrZSBoZXJlLg0KPg0K
PiBCb290IHRpbWUgQ1BVSUQgaGFuZGxpbmcgaXMgZ2lhbnQgbWVzcywgYW5kIEkgaGF2ZW4ndCBo
YWQgdGltZSB0byBmaW5pc2gNCj4gbXkgd29yayB0byBtYWtlIEJTUCBtaWNyb2NvZGUgbG9hZGlu
ZyBkZXBlbmRlbnQgb24geG1hbGxvYygpLCBhbGxvd2luZw0KDQpTb3JyeS7CoCBJIG1lYW4gImlu
ZGVwZW5kZW50IiBoZXJlLg0KDQp+QW5kcmV3DQoNCj4gaXQgdG8gbW92ZSBmYXIgZWFybGllciwg
YW5kIHJlbW92aW5nIHRoZSBlYXJseS9sYXRlIENQVUlEIHNwbGl0Lg0KPg0KPiBIb3dldmVyLCBp
bml0X3NwZWN1bGF0aXZlX21pdGlnYXRpb25zKCkgaXMgY2FsbGVkIGFmdGVyIGxhdGUgQ1BVSUQN
Cj4gc2V0dXAsIHNvIGU4YiBzaG91bGQgYmUgc3VpdGFibHkgY29sbGVjdGVkLsKgIExldCBtZSB0
cnkgdG8gZmlndXJlIG91dA0KPiB3aGF0J3MgZ29pbmcgb24uDQo+DQo+IEZvciBwcmludF9kZXRh
aWxzKCksIEkgaGF2ZSBhIGZlZWxpbmcgdGhhdCBtYXkgaGF2ZSBiZWVuIGFuIGFydGVmYWN0IG9m
DQo+IGFuIGVhcmx5IHZlcnNpb24gb2YgdGhlIGxvZ2ljLCBhbmQgbGlrZWx5IGNhbiBiZSBjbGVh
bmVkIHVwLg0KPg0KPiB+QW5kcmV3DQoNCg==

