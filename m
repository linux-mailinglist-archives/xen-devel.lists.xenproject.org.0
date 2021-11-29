Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A3D461B0E
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 16:35:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234632.407174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrigW-0003wB-Lk; Mon, 29 Nov 2021 15:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234632.407174; Mon, 29 Nov 2021 15:35:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrigW-0003uN-IV; Mon, 29 Nov 2021 15:35:16 +0000
Received: by outflank-mailman (input) for mailman id 234632;
 Mon, 29 Nov 2021 15:35:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMap=QQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mrigU-0003uH-Tc
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 15:35:15 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f061ba5f-5129-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 16:35:12 +0100 (CET)
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
X-Inumbo-ID: f061ba5f-5129-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638200112;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=JW7VStkWsAZV7zN7/Yo6KgLsmtlbANBHhUoCzstZPw0=;
  b=gF/kPd3it8nX3Hig3O5kNcAW5oBtOwAltkpGLQdszo0VCXkeaoPby7dD
   Zua4Xt2Z2JcfN1pGzLAlmsbQz3J2v2NpFX79Pz8skmb/tSV0SlZejYLpO
   OZsfLosj0ZEXAhVPp2qocSrN5kC4HDa92kB+kmY7ovxyiyWMNQWdbTiTX
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qHF0YV8jF/lJWbO1W9ewwl3cBp78TyFoI3s6AOyGCbruYhKkqR9oy6zvsWl3glEJRipqZunJsS
 r4jJZsiC2pizdm6ydvadIafzBijpFNvbBJhpYhxd1luF+7T8Wtmx2a/KQjP00JwnP5M+UbrT1w
 WAibnsm5RTVXmbHbOfqL8XK3vaOGqHubETQqLowZMUdd8xm0+SsjEb1UDCqo6w6rSoFHwGsxZb
 gzjgEnnQvygOqAJ4ESQ4/E7ejIt0huXLKQxPMPTowRP/SOGtKEgto7l7x/PyakAQlKBtaBFuIr
 KrF8cCF3rXH8JLUZAB7wvmvz
X-SBRS: 5.1
X-MesageID: 58835436
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:uRo+vatkESM3VTXjFq0QxIxATOfnVKpZMUV32f8akzHdYApBsoF/q
 tZmKTyFMq3eZWP0eotxPY6w9EoAvMCDyYJiSVRv+C08RiIQ+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx24nhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npli4SsdQopBu7wyccnYiNVSy5VLZ1r5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY25AeRquCP
 JRxhTxHNh7iREdiKA4rEYsdneb4r16kK35+kQfAzUYwyzeKl1EguFT3C/LXdcaNXt59hVuDq
 yTN+GGRKhMQOcGbyDGF2mmxneKJliT+MKoNEJWo+/gsh0ecrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdxynolaUsxgEQd1SHuYmrgaXxcLpDx2xXzZeCGQbMZp/6ZFwFWdCO
 kK1c83BOyRzjLCVcTGhp5SunAm/YSc+PV8venpRJeca2OXLrIY2hxPJa99sFq+pk9H4cQ3NL
 yC2QDsW3OtK05NSv0mv1RWe2m/3+MCVJuIgzlyPBjrN0+9vWGKyi2VEA3D/5O0IEouWR0LpU
 JMsy5nHt7Bm4X1geUWwrAQx8FOBuq7t3N702wcH83wdG9OFoSDLQGyoyGsiTHqFy+5dEdMTX
 GfduBlK+LhYN2awYKl8buqZUppxnfG6SYu/DamEMrKih6SdkifdpkmCgmbKgQjQfLUEy/lja
 f93j+7xZZrlNUiX5GXvHLpMuVPa7is/2XnSVfjGI+ePitKjiIquYe5dajOmN7lhhIvd+Vm92
 4sPZqOilkQEOMWjM3a/zGLmBQ1TRZTNLcut8JI/my/qClcOJVzN/NeNm+58INI8wPwO/goKl
 1nkMnJlJJPErSSvAS2Ba2x5aaOpWpB6rHkhOjcrM0ru0H8mCbtDJo9EH3fuVbV4puFl09BuS
 PwJJ5eJDvhVE2yV8DUBd5jt6odlcU3z1w6JOiOkZhk5foJhGFOVqoO1IFO3+XlcFDezuOs/v
 6akilHRT60cSlkwF83Rcv+ukQ+85CBPhOJoUkLUCdBPY0GwopNyIin8g6ZvccEBIBnO3BWA0
 AOSDUtKrOXBudZtotLImbqFv8GiFO4nRhhWGGzS7LCXMyjG/zX8nd8cAbjQJT2EDTH64qSvY
 +lR3srQCvxfkQYYqZd4HpZq0bk6u4nlqYhFw1k2B37MdVmqVO9teyHUwclVu6RR7bZFog/qC
 FmX89xXNLjVasPoFFkdeFgsYuiZjKxGnzDT6bI+IVng5T8x972CCB0AMx6JgS1bDb10LIJ6n
 rtx5J9Is1Sy2kgwL9KLriFI7GDdfHUPXpIuuoweHIK22BEgzUtPYMCEByL7iH1Vhw6g7qX+z
 ueouZf/
IronPort-HdrOrdr: A9a23:3OukwaholloUD1faT/4aFuE4/nBQXzp13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmskqKdhrNhQItKPTOWwldASbsC0WKM+UyYJ8STzJ856U
 4CSdkBNDSTNykDsS+S2mDReLxMsbr3ktHYuQ639QYTcegAUdAH0+4WMHf+LqUgLzM2eabRWa
 DsrfZvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLokys2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4REYGqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUATwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+aZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUx4S0LpXUN
 WGMfusp8q/KTihHjLkVyhUsZCRt00Ib1a7qhNogL3R79BU9EoJuHfwivZv2kvoz6hNOKWs0d
 60RpiApIs+PvP+UpgNdtvpOfHHcVAlYSi8eV56cm6XXJ3uBRr22uvKCfMOlaaXRKA=
X-IronPort-AV: E=Sophos;i="5.87,273,1631592000"; 
   d="scan'208";a="58835436"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STCVnaxOqb8vQHREv14jZn6KxLFRjqQNEhCa3/S4zBbLULucoXh9eedpUVtjDp38yGnPNkcc924q512xXfR3q6OfLsVhgKv1+mfrwF0HIqcuGpT+g8+MXs5IkITCDas6xaZ1kQFiCPAZCRy4oCvRFjxdotf9dAQNh0bF2lgVm9F/QxtDJ3e3wH485i9iNZdd8iHlaZUp9C8REoEeE8nTzJRRVHQZxVoB7EQArscXAE/uYqVq7bIMW4bG8COa0NNHoaekSaZzHIMBHCbGAswfa0eJgJeJYpuaQ57HOT9t85hG181n6vXE6H9KpcDGUtxdBkY1Lu28PFJOiUhgEAa4Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMwa/hlzZAME7SQ0GcDB5HStU4UmiwLvkHIs62+a9zo=;
 b=GXsZtmowNOcrl0sBaFEGJcVfUFBRDaZJqdhS6z28Oh922/mh+ug9x80wvBEJDEUZObG0d4cOXQSUsSLCQaf30ROO936y76Yx9odjKguZ8zuN5pf+ALO76QNrVhunWKrl3CdmdlosG7oKGzE0/oNtfw5vTglNOL0KE8H3lFzJUiemeqhnKtApRxXL0BzSZLuUE3KuhsXXR0SIG7yPTng8t46dlzQVylKKKgL6VniELgZ3cm1ivh/+8B5e3sXfMw8vIaj4XYlr3w2w9p6T5Xh7cobjxNMeHDYZ0ucrNyPbnmzbHmGFm0Gg6efCsw1pJuarW9zkVCG8Zk7Ox1V24Z1YPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMwa/hlzZAME7SQ0GcDB5HStU4UmiwLvkHIs62+a9zo=;
 b=E+AbSIvEvJTWkxnOFQLJMmuvk+AFBggyuCd+TMPsZRqzwHZytHEJYJPNftHX6x6gIKzwvSaGqwUCqtUAE8yFLcftpVU/Lj5tIj4CHNC2zY1Fl0Ui/1wHXi+m9bDFZdWKFPwiBHzJ4hTannOW3MJ49Xt0h98ep+jSJRUQDAXgBWs=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@citrix.com>
Subject: [PATCH v5 00/12] libs/guest: new CPUID/MSR interface
Date: Mon, 29 Nov 2021 16:33:43 +0100
Message-ID: <20211129153355.60338-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0092.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b82d07fa-2b20-405d-6249-08d9b34dd207
X-MS-TrafficTypeDiagnostic: DM6PR03MB4764:
X-Microsoft-Antispam-PRVS: <DM6PR03MB47643EEE14212CCE112EDA668F669@DM6PR03MB4764.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4kcl1B6XCmLdEynTbYI0Z8zjYPr3vU2PQj6c02KEQHKiTHMuAzwVtfta9jDltY8pKnJqd9mNPJK4/wjnEIPgTNF7ucwMpeO10RKEXoCCcqX3tGpkIXeFKJwb/Cki5pa8XBPnNy2FcYO8nP3+jS8f7u1//LAJ5k5k62ukkxwqwL5EmhsqHtVL0Ugk7cVrsDOp8xV4sB1BsyFYkxS1Vzu4GbP79pnuJRSMwHUB26Oy0uqmIZ9lAmi8MnF8qus9kKooEnD4bzYXfAVv3bAfuwoPETpRgiCE0MYWD85m7yiDcgDKknf6IaZWQWhhVDeK95Gv+K2JtEspKuS89I8BHouuiUoZrgkRmIiyYiI1nd8to5PCmQO2cvKv1sldFow6NJHZjgm3zSiWoGRD+meMMG/BKr2RLS7eR/YkGGWih4bmpH21gJ3ySjbQpsHZrbiwNqNwC6jxUPRLcm1CgcTLBEFyERmPR2Sv1Rsfnp4dgHw9M7+tBIZBTnxMJvstweHPwxBd1uIRpFvaEflSQTO3WGoOhJeUh0AlCRU+15BwraU2dNRIf3v+toZlYcwEY4B0vXJZdgvgJ6bV6zSEgH0c61GYOAfyD/0JR+HbKhqe7v/7jHRSFKn86T9GXDP7CBeyQGpz1q4N0xhS8CBy8v7/bImaYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(4326008)(2906002)(1076003)(66476007)(6486002)(82960400001)(38100700002)(186003)(83380400001)(956004)(2616005)(316002)(6496006)(6916009)(26005)(54906003)(6666004)(107886003)(36756003)(66946007)(86362001)(508600001)(8676002)(8936002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUF5eTdSQ1hQODJrV2RPNzVhMTdwR3Q4R2RyVlNaNXAxTDhhRC8rOThyRzhF?=
 =?utf-8?B?aFlzMUpoS28zaWthT3F4RVdVZHFFL0wycnkvN2dDalowVlFSVGR1dlJmM3py?=
 =?utf-8?B?eFg5ZXBOeWZpaGhMNVc0SzEzd29pOGpHMU82QXpKNkFUZVdsVDZ5aXRmeHNZ?=
 =?utf-8?B?bWtHNWtCVEtXNzVRblJaeWZrQ21YdVRPTHFCUE9XTU44OFpUWmFvbW5Yc3V4?=
 =?utf-8?B?UW44enZvNmxCYWFEWjFCTFlDT3RXNnppUFhKczR1bEJBYjVxd0ZlRHJYS1lW?=
 =?utf-8?B?UTA1RE9reE05WHFwTE9rZXJwREc4b3NoQ2N4a2EyTkV5SDlqS1RYdFJLWlAw?=
 =?utf-8?B?OGJscTJUQjVQMUhhTnN5QVRsNU9mQndIeVRBdWpiaGtDU3AyeFJ6aHZOVVo3?=
 =?utf-8?B?YjBtTXVkR0M5NndNOElQZlpVTnRsa0d4eEdnNHRvZFR6b0xLZUhtT2ptK3ph?=
 =?utf-8?B?NThCcndqWFlGOW52c1RUWGRzeGpHUkdrUEpIZzNnK05FQzlzYWg4Z2NtVG56?=
 =?utf-8?B?YlR2d3pQUzIzZlFWZy85RlVTeFRyd0cveUJZazkyZ0NydUpMS3VmbmZrTGFB?=
 =?utf-8?B?Q3JEMVJCY2dVdjRwS2M3eS9LbDJUMVFiZkJ2dkYrd2J4S25yb3JmMmh1MWN6?=
 =?utf-8?B?dkFWSW8yR3RhR0toNVhZaVZxSHUvS2hBQVg3dzQrKzdxODEyUlZaUVhVSzBh?=
 =?utf-8?B?QWgxaGFXcS9RS09SZk0yS1BLVDBTSkhnK1d1cExteCsydnVCbERTcC9LRFM2?=
 =?utf-8?B?d2s0eS9hbkI0OFQwSjdVaGhzUTN5bmppMFBMWmhrNTFLbkdIL2Q3K2JhWVEv?=
 =?utf-8?B?UUhXTEJxcXJFZ21zK1FrbWZKdkN1ajlLTnpycjZXTTlPVVJhb3BNUUNIT0hw?=
 =?utf-8?B?TG0waFBPZmlpYTE1dVFJak10bVpYdCtpMDAyc0lNSWY4alhTVE1GUDJpN2F3?=
 =?utf-8?B?MGorbHI4YjZxNlY4ay9LVFNwYXJOVWtKMWhWYnNLcHhLYlBoMmZxQkphL0th?=
 =?utf-8?B?cGtxeDVITjVlOFpKdFBzeFhBRUpZYTdHZjZZdVBSTEI5Q2ViOFMwK0FPdkg3?=
 =?utf-8?B?RENJYnhkTGJ4eURXS29IWVZpUjJUTEcwSEpSc0U3WmVUaTdqTmplM0MraHJB?=
 =?utf-8?B?bkVodThmMkUrcGpBektRSFIyYmlhTkpPckloVElHckM3WTZMMU9OcXYxSzNi?=
 =?utf-8?B?N1htL0duWHR5SmVpTEpVUFhOMldEYk9yT3pRYnlkNWlwUzl6OWpwVDNCUll1?=
 =?utf-8?B?YzFqaExUUXFTc21ZV3BEUmFBZktPNDh3YzlQTVUvdEVFTW1KdmVzK3hQQlNT?=
 =?utf-8?B?WW5QTE9PcFhZSjZZNnI4NTRPb2cyWkc2MWgwdXY0bWdGUUpRVk5NWGxuNjdk?=
 =?utf-8?B?VjFhWnBDYyswc2l0QWxzS2JxbzBVYUtnTlp0YnYvdmF6VDVrcmZrSWorQndv?=
 =?utf-8?B?YUVYc0N4dnpzSjVyV2tDV0F3NTZIRmlsNHVpMWdLd2JHWTBaN2E2Zm9SK25S?=
 =?utf-8?B?YVZPQzRVS0E5UVlmOEJRNkNNM0VsdkYrQWoyYUdlWUJ5MlZtQjlYU1Vhc0ZK?=
 =?utf-8?B?VzBuK284b0pZQ2NVbnlHTmhNRFArNUMvc2MyY2JVVkIvcVBHbjRkZ2Zxa2hI?=
 =?utf-8?B?WTJFS0tMMmNLZi9uTzZSa1FWUG9NTDdneW5YZDhUejZEOWZTa1RzSXN2aXh2?=
 =?utf-8?B?T1BzT04zQ1dVMVJmOFZVVzcvaFYzOGhRMkgrekZQWmQ4SkQvYi9TS2MvR2s0?=
 =?utf-8?B?U05IS3NGYjJvYUp2bjRkSVZHa0N4UlhlWDhMalZOd3VqVnBmS01IbGdCTzM0?=
 =?utf-8?B?S00waGxiWVNJT25NRHBoa1E1WmgwY1EycjlWc0w4V3RIMVFJcHBQRVF0Z2RI?=
 =?utf-8?B?bzFWc2oycmlDaGdQbWQzUHR5aDZtclVMNHBHcnAxeW5HdTdJWkkzUll6cnBD?=
 =?utf-8?B?K0JiZWFOTWhKRUVXa2dVTW9nckE2R1FhREtHbUZvRUdtNlRMTDYwUU9yTnNk?=
 =?utf-8?B?SFdYV0FWVUhsaWRnWUNuVmU3dlNLK0IvUU9wVXpZVCtSU0p3akZudTJFTXdI?=
 =?utf-8?B?ZW05T25EcXRWSTU3cWFMbTVFaXJzTjJnTGduVzZFZ2dWQVhqN2gvcnRvVFhi?=
 =?utf-8?B?MkMwUGtVenI0YmpEMEJYcHNpWndxU1gxb1YwTWRrRmZzUm1adXlkUTF1YzJt?=
 =?utf-8?Q?u4r/8yd5D6hr9jGJYSFJooI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b82d07fa-2b20-405d-6249-08d9b34dd207
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 15:35:06.8323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5qas1iEmimejTT8KA7sXhnCVJLSG7Zh0enH0Q9gcoyK5P1C0m8QjYw4XtYeJzdk2gjgn11MGhMvhe4o3AYbJmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4764
X-OriginatorOrg: citrix.com

Hello,

The following series introduces a new CPUID/MSR interface for the
xenguest library. Such interface handles both CPUID and MSRs using the
same opaque object, and provides some helpers for the user to peek or
modify such data without exposing the backing type. This is useful for
future development as CPUID and MSRs are closely related, so it makes
handling those much easier if they are inside the same object (ie: a
change to a CPUID bit might expose or hide an MSR).

In this patch series libxl and other in tree users have been switched to
use the new interface, so it shouldn't result in any functional change
from a user point of view.

Note there are still some missing pieces likely. The way to modify CPUID
data is not ideal, as it requires fetching a leaf and modifying it
directly. We might want some kind of interface in order to set specific
CPUID features more easily, but that's to be discussed, and would be
done as a follow up series.

The addition of a helper to generate compatible policies given two
inputs has been removed from this iteration, sine Andrew Cooper has
posted a patch to set the foundation for that, and further work should
be done against that baseline.

Thanks, Roger.

Jan Beulich (1):
  x86/CPUID: shrink max_{,sub}leaf fields according to actual leaf
    contents

Roger Pau Monne (11):
  libs/guest: move cpu policy related prototypes to xenguest.h
  libx86: introduce helper to fetch cpuid leaf
  libs/guest: allow fetching a specific CPUID leaf from a cpu policy
  libx86: introduce helper to fetch msr entry
  libs/guest: allow fetching a specific MSR entry from a cpu policy
  libs/guest: make a cpu policy compatible with older Xen versions
  libs/guest: introduce helper set cpu topology in cpu policy
  libs/guest: rework xc_cpuid_xend_policy
  libs/guest: apply a featureset into a cpu policy
  libs/{light,guest}: implement xc_cpuid_apply_policy in libxl
  libs/guest: (re)move xc_cpu_policy_apply_cpuid

 tools/include/libxl.h                    |   6 +-
 tools/include/xenctrl.h                  |  99 ----
 tools/include/xenguest.h                 |  77 +++
 tools/libs/ctrl/xc_bitops.h              |   6 +-
 tools/libs/guest/xg_cpuid_x86.c          | 647 ++++++++---------------
 tools/libs/guest/xg_private.h            |   1 +
 tools/libs/light/libxl_cpuid.c           | 233 +++++++-
 tools/libs/light/libxl_internal.h        |  26 +
 tools/misc/xen-cpuid.c                   |   1 +
 tools/tests/cpu-policy/test-cpu-policy.c | 224 +++++++-
 xen/arch/x86/cpuid.c                     |  55 +-
 xen/include/xen/lib/x86/cpuid.h          |  26 +
 xen/include/xen/lib/x86/msr.h            |  20 +-
 xen/lib/x86/cpuid.c                      |  91 ++++
 xen/lib/x86/msr.c                        |  41 +-
 15 files changed, 948 insertions(+), 605 deletions(-)

-- 
2.33.0


