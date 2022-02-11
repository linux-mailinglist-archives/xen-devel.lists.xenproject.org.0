Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BCF4B2489
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 12:38:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270407.464688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIUFy-00057H-E4; Fri, 11 Feb 2022 11:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270407.464688; Fri, 11 Feb 2022 11:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIUFy-00055Q-B4; Fri, 11 Feb 2022 11:38:30 +0000
Received: by outflank-mailman (input) for mailman id 270407;
 Fri, 11 Feb 2022 11:38:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S5m1=S2=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nIUFw-0004wu-Gt
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 11:38:28 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f9e73b6-8b2f-11ec-8f75-fffcc8bd4f1a;
 Fri, 11 Feb 2022 12:38:27 +0100 (CET)
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
X-Inumbo-ID: 1f9e73b6-8b2f-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644579507;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=YXk0ZG4Ek5wO5Lr4idXm6TDMoNzVbj19xURCRj5Jqcs=;
  b=M3y04fny+kpAQAwpG9MxMzH8RJgrISyCwKd43NxQe7+AJrXuC5/ENLv5
   aptF0rUB5djqCw4K1eu9UkBPNdDeivzPBLqcGiMOA8MtogiU878NksgMm
   uERr/mvfbm+CofT2tJVsyzCuH6MUxxK1uA2FzLW18Ue4DL++kmAm/OAHm
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: L1x06YI5N3QXqOIRSaoEZcLOhhjNaumJ3ZF4nS61+IagDxTPf2zsRH/4wT6Cz9PqvUqbxALupq
 EKaJ71KWi4NpcGoKO5IPWahLCPejCpRMuozhx3lUT5PfgiFPmrdFpeK1XhqC+a4aH53sLnd7lC
 v8Usw/cW8a5HIKowX0O2rKzzZNDBWr+BO3YsvlkmKCelz2lZ/oSXK0rl0qtPARra5A0XZpua5E
 Vr2lT3vKz5+FCSvyM+0nRhDX2qwkjwRPKj9lIEW9lKllaJWCR9xP3RsEWOCKjiTr0ONyaU8oog
 XoyHxrxa5U6YLBhAyL2BI5L6
X-SBRS: 5.1
X-MesageID: 63913632
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:QCj+Oqv7G0w6wzS1zAqRspka2+fnVI9ZMUV32f8akzHdYApBsoF/q
 tZmKWzSaa6MMTb2eo90PY21oB8AvcTdn9MxHldrrCxhFXxH+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy2IHhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplj8aqVwgyIfz3wsNDVyRiPHpHLIdl0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AP
 JtAMmQ0NnwsZTVGAE0YM7wjk9yWg2DEVGBFhFi6q/U4tj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKgEXMpmTxCSI9lqoh/TThmXrVYQKDrq6+/V2xlqJyQQ7ChcbSF+6qvmRkVOlVpRUL
 El8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO9dg8h+C0bWF2Fy+WGw5dBEaUc0Ml+ZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WoQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtACzARVodt/xory9U
 J4swZn2AAcmV8/lqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk1bpteJGC2O
 hKK4Wu9AaO/2lPwPMebhKrrVawXIVXIT4y5Bpg4kPISCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGJrdBNfQpXcRDWx/ne8qRqSwJKGSI/cEkJAP7N27IxPYtjmqVejODT+
 X+hHERfzTLCabfvc21ms1hvN+HiW4hRt3U+MXB+NFqkwSF7M42u8L0eZ908erx+rL5vyvt9T
 v8kfcScA6sQFmSbqmpFNZSt/pZ/cBmLhB6VO3b3ajYIYJM9FRfC/cXpf1Wz+XBWXDa3r8Y3v
 5apyhjfHcgYXw1nAcuPMKCvwlq9sGIzguV3W0eUcNBfdF+1qNphKjDrj+9xKMYJcE2Ryjyf3
 geQIBEZueiS/NNlrIiX3fiJ9t77HfF/E0xWG3jgwYy3bSSKrHC+xYJgUfqTeWyPXm3D56j/N
 /5eyOvxMaNbkQ8S4ZZ8Cbti0Yk3+8Dr++1B1g1hEXjGMwarB7dnLiXU1MVDrPQQlLpQuA/wU
 UOT4NhKf76OPZq9QlIWIQMkaMWF1O0VxWaOvahkfh2i6X8l5qeDXGVTIwKI2X5UI7ZCOY84x
 fss5ZwN4Aulhxt2atuLg0i4LYhXwqDsh0n/iqwnPQ==
IronPort-HdrOrdr: A9a23:qydnEKFR9XuIgqGOpLqFTJHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536fatskdtZJkh8erwXZVp2RvnhNBICPoqTMuftW7dySqVxeBZnMTfKljbdREWmdQtrJ
 uIH5IOa+EYSGIK9/oSgzPIU+rIouP3iJxA7N22pxwGLGFXguNbnnxE426gYxdLrWJ9dP4E/e
 +nl6x6Tk2bCBMqh6qAdxs4dtmGg+eOuIPtYBYACRJiwhKJlymU5LnzFAXd9gsCUhtUqI1Ssl
 Ttokjc3OGOovu7whjT2yv49JJNgubszdNFGYilltUVEDPxkQylDb4RGYFq/QpF5d1H2mxa1+
 UkkC1QefibLEmhJ11dlCGdnzUIFgxes0MKh2Xo2kcL6vaJOw7SQ/Ax+76xNCGptnbI9esMoJ
 6ilQiixutqJAKFkyLn69fSURZ20kKyvHo5iOYWy2dSSI0EddZq3MYiFW5uYd899RjBmcsa+S
 hVfbXhzecTdUnfY2HSv2FpztDpVnMvHg2eSkxHvsCOyTBZkH1w0kNdnaUk7zs93YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONERcesEGTCTR/FLWrXK1X6E6MMPW7LtvfMkfgIzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnLx5FP+gClehT1Yd0s8LAp23FUgMyPeFPbC1z1dLl1qbrSnxw2OLyvZ8
 qO
X-IronPort-AV: E=Sophos;i="5.88,360,1635220800"; 
   d="scan'208";a="63913632"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4n2Tym/KfmPYOjZOVt46zuCigRxS777BQw5zKq4ISO1QnPCPfBMeS0oTUrjPUldGEuPNTEfPGyrX531FCYiaYOUS7iLM2riqddaHd1rFS/ZElI2cQRi7JMTefZylin5MSymz8ng4mPPjcG88p3ZuqY+HmjXScgglbE3A6piZSkEpO8dVywUmo9s7u0Is1NgomIQluqdso137huRIJM/O9npgwuugGHGcr64EwqTq/3NrRW1M45838Lnom/15/idJUa8Q2Y9hhObefNNOPx/rPbYVERCaqzGoAvO+HGxQLTc8EaORT7bGybrVE0a+Mp+6wA+x1+JzNo5AfSo9iqqzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXk0ZG4Ek5wO5Lr4idXm6TDMoNzVbj19xURCRj5Jqcs=;
 b=AcCRf1OYzoUUDQoedLxbIv+OtammMQaNjeJ7jCnJ4HFjR/5o1kqzsQOi/vt7MIpNqNxZ9hJTKbECQmDIoxTM6Q/QX+pw5vHGOC4vjlvMBP0hg4fXbFpcV0QXjhC7gX9lnYNbVsyz9xAz8B/nDNw2NW5omAyJ44ytOkZJ9g4vEIkKdd7wK+2ZTKnblnhdh3GG8pieq6UengijHZrhjwtZww0TDH+zKcr6KbYLzMiegE2Bo0JyM7fOrfClcHik0ezkSXBDvvv8xTN22R/XHnuTvjdadjQLnm+lNuH1GBTnFG2btvRjntXzRXxHPjoLMdPafgHMN5y9mUjVEIlOoNhM6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXk0ZG4Ek5wO5Lr4idXm6TDMoNzVbj19xURCRj5Jqcs=;
 b=YUPgN9/zH78QZlGesoRnt0q0eX82ZLijgTjY1bFLMHr0tgpARRSKEKjJieDis/aSx5acnHpcTLDM+5OqBXMUwIV4Ct7DU+bYerxdisNx1lxTfp7k0+8s7oP1Ef04I6aSmfeHx1pYgTcVPZ5pQhde7A7zZHGIhv7lButtdDdI8yg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] x86emul: fix SIMD test overriding of VBROADCASTS{S,D}
Thread-Topic: [PATCH] x86emul: fix SIMD test overriding of VBROADCASTS{S,D}
Thread-Index: AQHYHzgi7QaKSip3EUKHXqmfR27DHKyOOU2A
Date: Fri, 11 Feb 2022 11:38:21 +0000
Message-ID: <fb157cd2-4a46-af5d-3780-16e4eaa0e3ef@citrix.com>
References: <0519c820-f1ee-1b37-f1be-90bd1daf37ed@suse.com>
In-Reply-To: <0519c820-f1ee-1b37-f1be-90bd1daf37ed@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08c10de9-00e2-4873-9599-08d9ed5301af
x-ms-traffictypediagnostic: DS7PR03MB5637:EE_
x-microsoft-antispam-prvs: <DS7PR03MB5637D572E94E01A8F89BEAFFBA309@DS7PR03MB5637.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NxAKVyqUl+r2weRRVlP1RqMCb2h2df6cs597odg944KY7kv9NOhaSR/HkaNMB25sPLG1B/QISOm6eg0b0qhvCyYUYRvyJMJwptbX46/n2VJWzILDKCYDRYzb6HcYIXFFpAsxLaS97bZD8TYb3k5jLksoXNHJHOkGMX8kYdTb239QVEL5tMft7doomfxgVj4W/Ku8Qk7z+c1aNOG3DltMehXp+uJK5nysmxXfNs5qA5HMwCmTcad8eWj5UrNkF74ycP3lZzzySkRNX468A+F7Fn+kzGGYBKMeVjeXvmo5DF0nYBjjnsQrKavyy2rWrGu+043AdbEgtNO7j+uKdoNRS47B2Gd78iTKQqmfGizJnZt0GxDToqLf2B0l1JlU6DW7kEqrAOM+yhQL4DDsBYFdGCG+/0NtJSfId+GOhaD7EgQav+0c4aU8sa+KzTt4/HgJnr2SmnvN9HJMSilw07VqbTrs+OWKruZVfyANeKzwbf/W67jJw8fIWVe0xxEpsaViN22L05gUo0+pNtqwAsxubdx6l+7YJAp0jdhPVF7Y/yREB2+2Kf5+9VKKK6ZV7vFHcSU5lSjhn1sVSUvgG611V9SnmWfhBiVthR7UMzRnOGUA9bMAAuD/k5lq3XaIkgNDK7Rsta3oa/Mzht7Qlys+qmDupGHhXYRI5WFB8Uh8V6vuTFyM//uJCw5UJxO4XIvBqkjQscjKPDf7BkYfY58ak8RlNBeGtH76cg1MPNIP16KrcaVHfaQMXSkMiV7UheIovW3jNph3rNXWmfDZutr/0g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(110136005)(38100700002)(54906003)(8676002)(508600001)(186003)(5660300002)(2906002)(66446008)(8936002)(53546011)(107886003)(316002)(26005)(2616005)(36756003)(91956017)(4326008)(66476007)(66946007)(76116006)(64756008)(66556008)(71200400001)(31696002)(86362001)(6506007)(82960400001)(6512007)(558084003)(6486002)(31686004)(38070700005)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVpOa2t4WmVGdVozZ2NqRFNQdGx6cjhDcFpCWklDU0piZEJ4Q09yNW1XVGJa?=
 =?utf-8?B?cnRLNi9TTTZRdWlLdnZCSTBEZ0ZpeXNUaTRtTTNNeitzSkdYaWtPM3FaQ1Bw?=
 =?utf-8?B?Sm00Nmd1Y0Y3ejd6blJxV1VTVVNSSU5hVXVrSVpwb0pxYStJa1grYVVSREl6?=
 =?utf-8?B?OVpzR2RvNkIwRlE2ajJka0JyUXZ1cmZWcFVCYit0eFV3b2tzRDVJdFJmMHhv?=
 =?utf-8?B?TkdXUmw4eEMxRTRiY0NNVW9DTENFQldQMkRSNWZ0Z1V2UWg4bHU0aXNsVndE?=
 =?utf-8?B?Vmt5S280eG5vV1Z3T0cvY1ErVmt1Mis5R2tmalJVUUxiOFRVaGx4b1ljcHlx?=
 =?utf-8?B?cWo5cVAzL04zUDc1ZlI0eG5TU1Bxa1l0SWRKZFZBdTgwS1plZ3dKUnphU01z?=
 =?utf-8?B?SVJ4Y1NzSVU0QzVqL2RkSURMbFdLV2Z4Q0FIdG1ndktxNHFwUzM1SnJYQXc3?=
 =?utf-8?B?dmc5RmhmVFNCamp1bEIveDBNelEyVXFneWtoWXEyV0REWGc2Y1dxR3lpc2Nj?=
 =?utf-8?B?Z1VWZW9oWGxUaXRTSGIwWlFpRjhmaXJJZldFblNNb2FKOFpNbWJZVzZEbWd2?=
 =?utf-8?B?UGoyWUZXSitMaFA1TGdvak9PcHIwcTRDci9QTGV6Q1BHTWJEeHUvTUR2VkEv?=
 =?utf-8?B?Y1JUaEpnNDk1V1MwdDY1KzJpc3ZaSEFMaDhXMWxIWmxwUFN3U0tCNE84Vml2?=
 =?utf-8?B?bkJxcHA3OGNydlY4bGY3a3dNQjBxeXFBbUxyMEh4OXVVN21PRUpCTnZqYUZj?=
 =?utf-8?B?MGJFTkVQbFBTWjVzekFtWmZQY0RnV1dBQ0pKcllINEJXaHhkMVVYOTFpZ1F2?=
 =?utf-8?B?Q2x6aDNxY3BsSWNodkRZZG1MVmNwK2tyeUN1UmVMdHArZlY3cE5QWTRQMTkr?=
 =?utf-8?B?TVBQS0pReEx0N21xNXhBa2k5QWZ6TXNVZUl5cWJoODJPaGt1dm5vMDhNVmdM?=
 =?utf-8?B?bkdibTZyZ2pWbThVZVl1WXR4YTRvd3B6dEtCcTZCdTQyeGFpL1AzMHl4U2Z1?=
 =?utf-8?B?Rm9aYjNoZ0IwQnVzVDZ5VTgxRUlEK0hJaGFBQlZJeThWM0pobXc4NHZ0d0k4?=
 =?utf-8?B?Y3NpQVVrYUZyaDJndHNxR0xObzdVRnptRllwSHhTOTljd2Q4TWdMaDZlYjRx?=
 =?utf-8?B?SmVaK2ExMUdyMFpISTRBKy9KZDNINEtGQk10VklVL2VvbzkyZU82WDFXZXh4?=
 =?utf-8?B?bFM0Vy9HRVI1TTFINzhIQVZsMkEvWXZ0ZnVuUFN5c21DMW9ndkY2UkpZeThW?=
 =?utf-8?B?ZFlqMWx6aFZzbTJUZ0FWb0paUEZLYm5pdHhrYTJnMURnWDdDUkdMMVpTbGhC?=
 =?utf-8?B?K3A0aGlXTTZpZ1hYL2lZUCttNGJ6VUJjNFEyZXZKVE5VTWRnZzZxVFNubFpG?=
 =?utf-8?B?THQ4bTJDU0xNYVdVT1Mxb3lvb2dIa1ljazM3ZVFicTRwN3laSk9kbFZQYkh6?=
 =?utf-8?B?SytJVDBMUGdkaTZVeUpEeXBHNW1ISXRzenRZQWoza2svVks4cExJUUp4eTVS?=
 =?utf-8?B?aHY2VmN0MU9JYzlUWVZiNHRGNjY2N2p6YXhwYy9sT1pIUU5VT2lteU5jalBT?=
 =?utf-8?B?THg1SnNmYUJ0b0pEbWRPVUxjeExHOENQOHM0SW9wUUlpWW1FT3VZc1NQQ2Jh?=
 =?utf-8?B?RnhoSllEK2RodDBSQnQrdVVkcXUzL21hUStKUWI2eTJqZWt3bjhtQ2ZmblpH?=
 =?utf-8?B?OGFDamJ6UUJIVkRtMkVJSDE2aHdiVHJrdzV6blRUVFhwOVNCbTQ5ZmZoaWNx?=
 =?utf-8?B?aUlCS01GRFhHUlVUZzB4bFpJRXh0RGJYaEtqbVVXWHpFdkxia21tMmh5SHRG?=
 =?utf-8?B?UGpNSXJHNm9POS8rNlpTMW11Q2xZUHVtLzRxS2VoT205S0RSdlNQdzRocG5k?=
 =?utf-8?B?RUl2ZVNvVkZFeCticjJaUVVGTEQ3Umo2aEhUZlNWRHJEZk9raHdrRmpyRWJI?=
 =?utf-8?B?aHBBTXp4Tm5ZZUdEbVp0d280UmFMcGhlcm1XNlVZWU96US9ISUNpWHpmamxR?=
 =?utf-8?B?VjZUSUlQbGV4bDNnaHc1d1pON1lQV1dweElWZitjblY0OS9WVUk2Tk94VjJN?=
 =?utf-8?B?YnlrYjhvdjQ2UzB6SXExaUs1TnZCd1lqak9yQWIvcmRQYTAyZEM1WWwwbmpP?=
 =?utf-8?B?azhNeXB6RytqNnEzaXpUbVloTWxRTm13RlkzbENVR0dodWNTSVFFdC82anpK?=
 =?utf-8?B?akY1VTBNSTJaQ1NEckNyM1NLaWVZVjdrMlBOdFBPNjBsbTZKMCtRS0kzUS9k?=
 =?utf-8?B?RXNncm02VVFTVHgyc0hoWnViSzJBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <61F9C0C6A8787348B299B7A40A221A9C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c10de9-00e2-4873-9599-08d9ed5301af
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 11:38:21.4738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RtSOmTUoJAFMuMuxFy5kLkUJmewYPLvcKz5zhLpi5DSGJ76qr91uqGRCsIllAM2A8A1ASYpO7A+VwymHnlHL2p0nCUu9K4dAK4poZHrzvrY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5637
X-OriginatorOrg: citrix.com

T24gMTEvMDIvMjAyMiAxMToxMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IERlc3BpdGUgdGhlaXIg
c3VmZml4ZXMgdGhlc2UgYXJlbid0IHNjYWxhciBpbnN0cnVjdGlvbnMsIGFuZCBoZW5jZSB0aGUN
Cj4gMTI4LSBhbmQgMjU2LWJpdCBFVkVYIGZvcm1zIG1heSBub3QgYmUgdXNlZCB3aXRob3V0IEFW
WDUxMlZMLiBHY2MxMSBlbmRzDQo+IHVwIGdlbmVyYXRpbmcgc3VjaCBpbnN0YW5jZXMgZm9yIHNp
bWQtc2cuYy4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPg0KDQpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4NCg==

