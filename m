Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 117BF65BEC5
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jan 2023 12:16:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470570.730112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCfGP-0002rt-35; Tue, 03 Jan 2023 11:15:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470570.730112; Tue, 03 Jan 2023 11:15:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCfGP-0002pB-0J; Tue, 03 Jan 2023 11:15:25 +0000
Received: by outflank-mailman (input) for mailman id 470570;
 Tue, 03 Jan 2023 11:15:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oadl=5A=citrix.com=prvs=36087fe06=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pCfGM-0002p5-Um
 for xen-devel@lists.xenproject.org; Tue, 03 Jan 2023 11:15:23 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7d0c786-8b57-11ed-91b6-6bf2151ebd3b;
 Tue, 03 Jan 2023 12:15:20 +0100 (CET)
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Jan 2023 06:15:11 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5414.namprd03.prod.outlook.com (2603:10b6:5:2c2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 11:15:09 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 11:15:08 +0000
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
X-Inumbo-ID: e7d0c786-8b57-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672744520;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=FrCbF7/5KWC5RgyFF95YNecZCcdp2COhwvPWjoJVcOc=;
  b=UYCTDV0VbuCflIR+Q25xYJxm+po8LYn/wn0im9lhfEx+Gj7pLHoOaRrw
   Cwvg6sPwgtQU1ce9n+CWM/BwQg3Ti8ZoL1iJsCqUzJSh/OxEEnIK2DDbN
   hePdY35M3YmBFMYTZFijD9f3w3tVZ+T9vJD7m8tRVkmez9vYlW1U1L5Or
   g=;
X-IronPort-RemoteIP: 104.47.70.105
X-IronPort-MID: 90987143
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:dTr0S6oejxSDGtOOD4NTgkSn1dteBmLUZBIvgKrLsJaIsI4StFCzt
 garIBnXafncNGbxLYgjaYni8UsPv5eGn95jSAZoryljQ3xG8ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5weHzyJNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADEgQS6Iht+O+ajhSrJ8nZ0sCtDsFZxK7xmMzRmBZRonabbqZvySoPV+g3I3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3j+CraYKIEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXprq863wTPnQT/DjU1UUOVp+e5uHLlRt9CM
 BJOvXITr+8toRnDot7VGkfQTGS/lhsVQd9ZCeA5wACL1KvP4gydC3QETzhOc9gvvok9QjlC/
 k+EmZblCCJitJWRSGmB7fGEoDWqIy8XIGQeIygeQmMtwfPuvYUyhRLnVct4Hei+ididMS706
 yCHqm45nbp7sCIQ/6Cy/FSCiTTzoJHMF1Yx/l+OBj/j6R5lbom4YYDu8ULc8ftLMIeeSB+Go
 WQAnM+dqusJCPlhiRCwfQnEJ5nxj97tDdEWqQQxd3X931xBI0KeQL0=
IronPort-HdrOrdr: A9a23:ZEysqa0Gh6JflL5ymjZougqjBZxxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHQYc2/hcAV7QZnidhILOFvAs0WKC+UysJ8SazIJgPM
 hbAs9D4bHLbGSSyPyKmDVQcOxQjuVvkprY49s2pk0FJW4FV0gj1XYBNu/xKDwVeOAyP+tcKH
 Pq3Lsjm9PPQxQqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LoSK05KX8Gx242A5bdz9U278t/U
 XMjgS8v8yYwrGG4y6Z81WWw4VdmdPnxNcGLMuQivINIjGpphe0aJ9nU7iiuilwhO208l4lnP
 TFvh9lFcVu7HH6eH2zvHLWqkjd+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vflnuZ
 g7nV6xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeUrlMtoYSlXklVavoXRiKrLzPIt
 MeSv0018wmKG9yqEqp5lWH9ebcGUjb2C32GXTq9PbliQS+10oJsnfwjPZv4kvosqhNCKWsrt
 60TJiB3tt1P7ArRLM4C+EbTcStDGvRBRrKLWKJOFziULoKInTXtvfMkf0IDU6RCe41JbYJ6e
 L8uWljxCcPUlOrDdfL0IxA8xjLTmn4VTPxyttG75w8vrHnXrLkPSCKVVhryqKb0r8iK9yeX+
 z2NINdAvflI2erEYFV3xfmU50XLXUFSsUattsyRlrLqMPWLY/hsPDdbZ/oVfHQOCdhXnm6Dm
 oIXTD1KskF5ke3WmXgiByUQH/pclyXx+MGLEEbxZlm9GEgDPw+juFOsyXJ2iiiE0wzjoUmOE
 1jPbjgjqS34WGr4Geg1RQdBiZg
X-IronPort-AV: E=Sophos;i="5.96,296,1665460800"; 
   d="scan'208";a="90987143"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNJCg+pI6zQ6RY3Pzy8amqUlpSfA7yPPEy4AxpcEA4yofADJ1IgJSKi1/hjwAIPtG7wdZ8SIznTU0EPDWuGzefEzvXWAF+Lr3hCpph/RFKW97AnFuaK2EOcCK06Cbq5k2pftQPPiFASg1wD9ZhuaesAzS4mI0bgmE+YYHXqUh0JyXwK+gCVRLaRm+5d2bn0Y2Alzyc7E7vleVGhZjFkPH+VJINLiK43QF5+aNki/h2kjSF5Y5RhhuRNDGZbYFpMaQv0r9/bAwzdUqm7QPjTM2mO479SKGy7nE4GsSkw5NWqkStU7caNqo5G7Q3V7nGwowd6NqqLRh/Sml7+iR57YHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrCbF7/5KWC5RgyFF95YNecZCcdp2COhwvPWjoJVcOc=;
 b=nfgh/ohiv+BW+d1x9wR2tU4tF6NyCM8rQ3I2B5LQJ8wOSG8jfG178knpnst6DdvEK5iC1qb+QyaCmBPyoAXVyun295nB7dyDjqb3ZCggVHxxHBsJ2tNjk+HSGBMqwq9qZBIYBgowEtS9Eg0zGM/c0OwlYbrWVqjLU/hxnaSFFbNY3DR9iAsfwm9N/s3VyrhmhUB9etiY7rPpWzjPLlaGrOJj80vXSjeJSFC0qt9l9ry0MxGD8Pw7xD1AwGXMSrkY0i95ozn6fc7xa9JlQ8+qBUdzu9Y4oDTbr9mWBIYBL4nDFciNnXfhQa8Onzzzr8pAy+lMfbriD+THM1G7VELrPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrCbF7/5KWC5RgyFF95YNecZCcdp2COhwvPWjoJVcOc=;
 b=hbe3TypLI1htgupX+s+FKOuAv4Ri4lb8zRakf/CfDofdm9IoJOTs0IiWvf8KJoBkukqIz4t83VGIOhXujk6itL3wMsBppj7MJEkGXfXnKEQuQ11t8M18BlIL2NQet8rgu9nhsW9zSqXPP4UZCwWDanyrc/hGrhSNNBJD6UTTKN4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 1/2] x86/cpuid: Infrastructure for leaves 7:1{ecx,edx}
Thread-Topic: [PATCH 1/2] x86/cpuid: Infrastructure for leaves 7:1{ecx,edx}
Thread-Index: AQHZHK8RB6bbm4Xa9UKGRMzZOin/e66Jqk4AgALlmgA=
Date: Tue, 3 Jan 2023 11:15:08 +0000
Message-ID: <9557496f-e232-ef50-39bb-7eb509bc72e8@citrix.com>
References: <20221231003007.26916-1-andrew.cooper3@citrix.com>
 <20221231003007.26916-2-andrew.cooper3@citrix.com>
 <Y7GgJJ5wyds83Uwn@mail-itl>
In-Reply-To: <Y7GgJJ5wyds83Uwn@mail-itl>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DS7PR03MB5414:EE_
x-ms-office365-filtering-correlation-id: d94ef126-11fa-4f73-605e-08daed7bc60d
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ZFL/7HY6Wkjr7lQC1xQool8D8xW8czTNapUDf7qZ5SffDCwFa9wlCPtmUkbEJbFz6f8WywflqB3T0fPCYwF0KCqNd5vI05MTqrcqTJkhBr7A7b+rYT1mtUs0KuAvwEDD76zbK7k+AYFwz2HuRkNkbU39QaaJSfddMfjPI90i3wdxO+TtaBwUlqKqPJN7oyTUF2noAKyJHQKkLJhuAC/OATUd92Hcp7J3R3+diow91RMnuU7olTOsIkAhp2K24ctUdZKwkYyyWmSz4ylQPrOs4W6kkqcD3NhvW5YPRiJf1fA6asdCYAx1JNbeiFQSVRsvgjs9Rg9ix3/mjKlB4QjI+wDuj2Xi2CmQ+nwIEFGHoH93cSeGoDh0WIiCBIlvfXxHXmx90NevQAbPUjv6Jag/lCrUAZVf8kaDDj4t8tEseahnrZll+328JtBcbLI+XC335jNCL6UnmoO1IedK7u144oDhUgji+oQdJaXDlxUFoen5xcDJFROWZyE57D6S0cVSADy0J9TWwKAGlalW1jXfAHUudXM2l7uMt2dQ3mVTeAA/Mwq/X34Y7lZuy8SPrD3DP2c9JT+jI5OOoqZzbc9CqPuzh0/kXnNIZAKbGsxsD7Zu81sgd12ysifpxBWOmCJoKNA8kj5HFSfT/xum2rm1Avbm0aJ54dGsTK7lLxQ+IdOa//B2K23a77Syj4VpvMyDjkoVpQGXVLi+VTvpbHkTrOLCIarH25Q6Cq7JCxaZ2tjOJT3+njo4zUhNrT/fHC+HX/xo3XmewxkQIyzfWmfCYjjDnQti9KItd2qVCfwcycU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(451199015)(38070700005)(53546011)(76116006)(31686004)(64756008)(66446008)(66556008)(66476007)(66946007)(6506007)(4326008)(41300700001)(91956017)(8676002)(316002)(6916009)(2906002)(86362001)(26005)(54906003)(186003)(31696002)(478600001)(6486002)(6512007)(82960400001)(122000001)(38100700002)(4744005)(8936002)(5660300002)(2616005)(71200400001)(36756003)(22166006)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K2Z3TG9NT2pXK2NkOXo1ZUY3OThQSDV2YXhWbkNINldGQmlLa3cwRHR0dmJH?=
 =?utf-8?B?cm5sWGI1SXZlVUJ4Nlk1cEJVMFhmajZnUDcyaDF3NUFSREhKazBWRk0wQ3pW?=
 =?utf-8?B?eDRNWFkyYkRQOGM2SVRpTitPQmF0TmhweVNidUVsbXpPaytCZ1ZBMmwxSmZX?=
 =?utf-8?B?dVRWcXFDY0JDOUEvcUNsVk1yR20vc0lNSG9VYmtJVHpGZWtvQklsWUlhQTdD?=
 =?utf-8?B?bVZBY0U1TlNVOEdvVlpLUlNBVEE5N1J3Y1MxaENkMHpML2trbU53YkFFUCsx?=
 =?utf-8?B?WGpkTGlBVWQyZzVPcE9nUENDU2xONVNXZ2ZMR0t6WXJ0dk1aZTd3TndFSTh4?=
 =?utf-8?B?eDZXVGxaaDBaTmhZcjAxVlhNZEZPRnl4QmhjUzBBTjRpOHVkb09iVnZFbno2?=
 =?utf-8?B?bHZnaUZ1NEtKTGlWNWZGcVRRQTczZytreitLMzRsNUVWN2toajB0Zlp4QmZX?=
 =?utf-8?B?TXZGYUtpOGpqTXRnSWFad0hYVEI5aEF6WDZZTTZEeFBzWjNOODQrSGFhRzlX?=
 =?utf-8?B?ZWZTSk5pdGM2cTlOeTMwNXhYK1hzRy9uNlk5dTJIbExKQy9lNEVQYTB0ck1n?=
 =?utf-8?B?NGdocGpPUWp1b2JwQkFCemJ5b3VLbk1Hd2ZQOTloa0ZHdnRKSnRMK24raEQr?=
 =?utf-8?B?UmU0YUpnNGpsRG90Z1NGYXFuNXJxNkpBVGVVTG00UmFzVEFJUW1zOUUxVmZJ?=
 =?utf-8?B?V3B1WnJPREhlYTdpS2hZaHVIWVJESU5zbUV5MnF5UWd6Y0tlRGg0aC95TytI?=
 =?utf-8?B?UjN2d0M2Y0RDY3Q1bkFiamNabmdWQU9YK3lQWnR6UDRqV0tIVVljYktlaWpL?=
 =?utf-8?B?TDZacEZ5RFMyVE1vbWdmVTVJVmpPeWFhQmludXMvYXhsMkR4V3JKTTNrcUd5?=
 =?utf-8?B?WmMvM2JIeSs0dm9zMkZkdUZscjJyN3JLT2Nxb2FnTmxZRGt1bldzS2RQeWZz?=
 =?utf-8?B?bTRxVzFtTDd1WXB0SWpXY09xOG56WVhSOTNUbXZSSmFoSUlTd1hJcG5NeEFU?=
 =?utf-8?B?V01ONHQ4RFc1ODBpME9GZ2dSOVNyWUp1UHJ6RkJlNmJvZXlXUitlYXB0WHRm?=
 =?utf-8?B?cG43OGd4cUtyMXlvY1UxTlc2Skh6YzJ6Vk9mUU0xcW4xM3JaL29PSCs3bkhh?=
 =?utf-8?B?SlFMN2Z4bGZVZnR2aHZBTjZIVDV3b2owd2ZZekZBS093WFAwMFVEcGhBWW40?=
 =?utf-8?B?Rjl0VWQyMzgwOENOaitPdzR6b21LakcwemNHdXE0bHd2R2d4amhmUG9qcW04?=
 =?utf-8?B?Y091cnlnR0NORGJFK1RPeWljVGtyRDVUOEpZK0owNlNXSS91bmoxVzRIeWk0?=
 =?utf-8?B?ejhBN1oyNStFSGk4aDdobG5nUWR5Wld6MGMxaGFDZTdPckpJTEJDQWxHVDFK?=
 =?utf-8?B?NTVWN1B2amFZUXRqRGVqVFZ6RmxlYjg3cXN0VHZudXNqWE5NMFRjZ2tzSlFW?=
 =?utf-8?B?RUpkZDhwZUhrczFnMzFndVZraERqV1VOcEUwRVZCUjR0cHBlbFNnQWRtNWZh?=
 =?utf-8?B?YVdvYmNQbWhJTVAyWGRRUVNwRUdZaEF3QjRuekFqeGJ1RlVOckhuMFFOTnBD?=
 =?utf-8?B?OWk0eDBleGlnMHFMWXRpemZLelRzUDl4T3lkYWlwa2lBS1NmWGJqeGFua29T?=
 =?utf-8?B?cVpuK2lwaDZna2xkdDB5YXFNNjFpbjlsWDZuMTh1cE1RVThxWFEzeDZHQ3p0?=
 =?utf-8?B?Q0I0UkNveU1wWXpOSk1TczVPRElUZDJEYzJsN3RtNVMvQldUYjNpTHBrajhH?=
 =?utf-8?B?RnlERHVUSGhGRmtpVU9XZW1oZnVRckdhY1ZydThaRHR6L3YwY1lqYXBDRnB0?=
 =?utf-8?B?am5yNDFIUDE0cUg3UzdTdjZ0K3l5TmQxc1E2aXF6d0x2OTBGZXRHWnkxOUNl?=
 =?utf-8?B?N2tZY2s1eklQVHVYeDdEZ01GbFNvdjlMbTdua21Zbk1xWWh1YWg5Z2dDOU5w?=
 =?utf-8?B?YkNoZ1ByTThPMFZraW1Benp3dTNsYVdBM2VxRDdINm5GSll4MjhFZXRGSFE0?=
 =?utf-8?B?Z2hFVENhUzkvcFBQUmVDbFJhN0tMNUJHL0M2QmFnak85TFUrT05oYkVJdFhL?=
 =?utf-8?B?ZjdoUDEwYzVIcmhJMjVyK3Q5Nkc5QVo0YjJlRi9vS2RtK1dOejFaU0NXRnhY?=
 =?utf-8?Q?oHBmR3GPL0gB39R/j8fzchHat?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C863B0A7E5CE7C478D68A76BC6768725@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ztuzM6H6ZXFYqSjqCwzLfem3cA5R4M9VtB7fnul0YXSplBIWSKKtayOvs0WO95+UGERRPpstyO5cAvOF0DazNUxQxvNXYh09NhCIsXKjlzgtjNpv9APhxhiDbRnD29AKodIq/V0nvchcneVhmKG1fH6BrxXISvEIpUi+xMiAQX3t5VijnNxLlDqyWkZq7UjhOYqQLJPzSH+5OzmvoWObY2m+qFkGG1UZ9T/Dp4BHm8UDeZqhBILLerJOIbtyGYteh0yocuVeWw8H8wrPPH3sojrcTPvtsKiSIqbSCbmW6ZLbc/VjcN01VTPqgmp2QvELt5Ey1p/N5Mf5vLqFiTZOr57cePp1u7vLMKce7Dli8zoeFbDzC/s0920nxoVg+I3CrLkkdscgMl2ljJWxOkUhapuTa7+9vNEiepATcwnXUj+HeUyMWk1717TDbdofGzNu814wg3otRDkEsvaVOQfxAfoZSz3GgEqBxqpx6AAbrf/B1L3537qgGw/UUs9lq5G9UvoeiXjuoRaEY+8fbxqewo5Yr5yZnTLduCeOjexczWtE7WvpkWewCNllnHEZ4fEOsAsH5zlj1gIHqWoMEOtPFunnsgwcFDvN39lLrcJvk2KgCCHqVf4bQsAodckSJLNHtxsIvKkcZGjftqWet2B+ZqxaW3BUxPU1DQwaa7Zy00HxxqNTppze8B3d3G0rzTOSKFZJS9DcFuoR6NsQoGP5I8ZadRZq96P1oB5n9nVpmH2Iyoc/VSiP6E9xM0DjlFuGMVFpT6UKAMoPfr42r54RpsJUP7sD/25eFbOhM9aaU1Z4uxV1uLPCfSKOcP1r03AumS0mQ/79ThNby0N2MZmXe9W68phzNlRvx6MYJ9Bbaw/4MDVT0cL3VCRqf5L5m0GV
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d94ef126-11fa-4f73-605e-08daed7bc60d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2023 11:15:08.5403
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i84OxRmiDwmiLcUYzkGigotJ7RoL9i42Lx4qOn6gJC6CfazQhMgXnKZkhh3HqQiEw4X5+fV3qsm+dG8Mq5Ixwn1T3ODAnqPxII6Ac8ijwU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5414

T24gMDEvMDEvMjAyMyAzOjAwIHBtLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6
DQo+IE9uIFNhdCwgRGVjIDMxLCAyMDIyIGF0IDEyOjMwOjA2QU0gKzAwMDAsIEFuZHJldyBDb29w
ZXIgd3JvdGU6DQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbWlzYy94ZW4tY3B1aWQuYyBiL3Rvb2xz
L21pc2MveGVuLWNwdWlkLmMNCj4+IGluZGV4IGQ1ODMzZTljZTg3OS4uMDA5MWExMWE2N2JjIDEw
MDY0NA0KPj4gLS0tIGEvdG9vbHMvbWlzYy94ZW4tY3B1aWQuYw0KPj4gKysrIGIvdG9vbHMvbWlz
Yy94ZW4tY3B1aWQuYw0KPj4gQEAgLTIyOSw2ICsyMzcsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IHsNCj4+ICAgICAgeyAiMHg4MDAwMDAyMS5lYXgiLCAgImUyMWEiLCBzdHJfZTIxYSB9LA0KPj4g
ICAgICB7ICIweDAwMDAwMDA3OjEuZWJ4IiwgIjdiMSIsIHN0cl83YjEgfSwNCj4+ICAgICAgeyAi
MHgwMDAwMDAwNzoyLmVkeCIsICI3ZDIiLCBzdHJfN2QyIH0sDQo+PiArICAgIHsgIjB4MDAwMDAw
MDc6MS5lY3giLCAiN2IxIiwgc3RyXzdjMSB9LA0KPj4gKyAgICB7ICIweDAwMDAwMDA3OjEuZWR4
IiwgIjdiMSIsIHN0cl83ZDEgfSwNCj4gIjdjMSIgYW5kICI3ZDEiID8NCg0KRml4ZWQsIHRoYW5r
cy4NCg0KfkFuZHJldw0K

