Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3F157A818
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 22:13:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371152.602991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDtbC-0007Ls-J8; Tue, 19 Jul 2022 20:13:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371152.602991; Tue, 19 Jul 2022 20:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDtbC-0007Is-Ft; Tue, 19 Jul 2022 20:13:42 +0000
Received: by outflank-mailman (input) for mailman id 371152;
 Tue, 19 Jul 2022 20:13:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+LuP=XY=citrix.com=prvs=1929f1d84=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oDtbB-0007Im-EM
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 20:13:41 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46077709-079f-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 22:13:39 +0200 (CEST)
Received: from mail-mw2nam12lp2046.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jul 2022 16:13:29 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Tue, 19 Jul
 2022 20:13:26 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 20:13:26 +0000
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
X-Inumbo-ID: 46077709-079f-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658261619;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=3RUlfYEfNwp809KR8X2QzXUGlVPuOa8+6cg0oGoco3U=;
  b=gv2bju3Tvda9fEBZ04PVuK6gepJzniDHCPF3dvEq3Y8NnL60Wu922zyG
   eYqLwuVrWLLhjrVxaVCCxK9JozzErLlGC7PMSxRBGQg8YLH10p2NXH8lS
   Y5n0Z8Yr8J4s/PeI7Ha5XyH/+Bcl4pFA16a7pHYGnpQGczygb+NzJauvS
   A=;
X-IronPort-RemoteIP: 104.47.66.46
X-IronPort-MID: 75465074
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ZQZFBKPe6Pa+H0TvrR27lsFynXyQoLVcMsEvi/4bfWQNrUomhWcOz
 DMcXGrVO/uOZGrxfdoib42+8R9SsJTczoc3TQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyFULOZ82QsaDhMtPvS8EgHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPw868tJgISAbQxpM13BH9O7
 NA1azcSO0Xra+KemNpXS8FKr+F6dozOA9lavXttizbEEfwhXJbPBb3Q4sNV1ysxgcYIGuvCY
 80eanxkaxGojx9nYw9LTs5h2rn2wCWhG9FbgAv9Sa4fym7f1gFulpPqN8LYYIeiTsRJhEeI4
 GnB+gwVBzlFaYDBlGLarhpAgMfNjyL8R7sKJoGkrN5zx3uLmFISAREvAA7TTf6RzxTWt8hkA
 04e9zcqrKMy3Fe2VdS7VBq9yFaUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebSMu/
 k+EmZXuHzMHjVGOYXeU97PRqCzoPyEQdDUGfXVcEVVD5MT/qoYuiB6JVsxkDKO+ktzyH3f33
 iyOqy89wb4UiKbnypmGwLwOuBr0zrChc+L/zly/sr6Nhu+hWLOYWg==
IronPort-HdrOrdr: A9a23:r6/UGK8ikX2p5WNgJk1uk+F7db1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZtFnaQFrLX5To3SJjUO31HYYL2KjLGSiQEIfheTygcz79
 YGT0ETMrzN5B1B/L7HCWqDYpkdKbu8gcaVbI7lph8DIz2CKZsQljuRYTzrcHGeMTM2YabRY6
 Dsg/avyQDBRV0nKuCAQlUVVenKoNPG0Lj8ZwQdOhIh4A6SyRu19b/TCXGjr1YjegIK5Y1n3X
 nOkgT/6Knmmeq80AXg22ja6IkTsMf9y+FEGNeHhqEuW3XRY0eTFcdcso+5zXUISdKUmRIXeR
 730lAd1vFImjHsl6eO0F3QMkfboW8TAjTZuCKlaDPY0LDErXQBeoR8bMtiA2XkAwBLhqAC7I
 tbm22erJZZFhXGgWD04MXJTQhjkg6urWMlivN7tQ0XbWIyUs4nkWUkxjIiLL4QWCbhrIw3Gu
 hnC8/RoP5QbFOBdnjc+m1i2salUHg/FgqPBhFqgL3f7xFG2HRii0cIzs0WmXkNsJo7Vplf/u
 zBdqBljqtHQMMaZb90QO0BXcy0AGrQRg+kChPbHX33UKUcf37doZ/+57s4oOmsZZwT1ZM33I
 /MVVtJ3FRCD34Gyff+qaGj3iq9MFlVBw6du/22z6IJyYHUVf7sLTCJTkwono+pv+gfa/erKc
 qOBA==
X-IronPort-AV: E=Sophos;i="5.92,285,1650945600"; 
   d="scan'208";a="75465074"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGpqxLh2RGUrXDqv+KFeluhVxHnVm/wZ8j3tjf+nyBlBJtptunOujxmDvvPqPwye7ZV882GAhbxK4DB1eV+qMdHDMnobLFXcQdOFXInyd3nFF3FxyMCuuhB52QPt5iwm10Njy+hU9qOSlEuMkFvj7Qzu/dqJaFRosGw7Fr0aH6YPeRb8ChLkVGDAW8LKfQBP263keUDoaq1/l1/yYG+9vhOu5ZUX/mT2DP41AvImD3PTsckTk8xngp+Lhm7K28ir4oFx95cxk+wcTaYwig6SGO8JiPiYVwxIUnQJhz2DF6N/vtGciEUTnLKmVdEK0lRopNo0g53mJa/mmKE5QQQY9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3RUlfYEfNwp809KR8X2QzXUGlVPuOa8+6cg0oGoco3U=;
 b=K5K6HE8eyCx6+tY06+ff2pnqMnkhnKeH8TvI1mKN6jMc+aaMLdhMAs8qF8gqoaCqK99OVrhSHjA9JFlVGbUD0ZAFlSoANiUwbr1VFqTQ0qalB5Hx/FxgQRovM1pVuxRV09nkrv9/SErQc/vsvN2u9DfCkxJ7O9bCYA676TXvA9kQ68YfWwxPHFwVEJLFYpzGCcBNks/shYnUoSHZmcZuhkN5lI1aoQP2e4dlwZtakUuLnFXfD2O2q/iyxdijnKL1W0lTqlWo2AXK3DaJMrR+XEyjGmJDzvIwuJ8vdMv/JmdBzP1LTVIRKdEMlGjn7sdNFuyH8YsRlkgJ5t0FoEUD+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RUlfYEfNwp809KR8X2QzXUGlVPuOa8+6cg0oGoco3U=;
 b=arH8uX0IPMmOxVtO1f/XAsOJjJL9xY3ui+Y4R8InmL/k3JRIiviXHa3agV78iG+f2q406f7cO8nb5I5nMLJgfzZx346omb9LnQqNIXAP3ueHEyJZYdjn6//SOYSbfPsMhrPRAfQvXpcSRB49J2Y3GeBCMDOuFB55DsVDc0ViM8A=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] x86emul: add memory operand low bits checks for
 ENQCMD{,S}
Thread-Topic: [PATCH] x86emul: add memory operand low bits checks for
 ENQCMD{,S}
Thread-Index: AQHYm27yQ3w+gdOvIE6doYW7iaLBhq2GISKA
Date: Tue, 19 Jul 2022 20:13:25 +0000
Message-ID: <58c0aaa2-035b-46a9-8faf-a7221b0a6ddf@citrix.com>
References: <f8623a3f-ed4f-3a11-7c01-a3b60cc54236@suse.com>
In-Reply-To: <f8623a3f-ed4f-3a11-7c01-a3b60cc54236@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78b591dd-8faf-4198-b5e5-08da69c32367
x-ms-traffictypediagnostic: PH0PR03MB5669:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 aoX1TGzJS2JU2KrHeDzutx85RSbQTUEf2qwqDjT0gkKhHOiHP0ijt8pA6qvLGtLbawoZ/xiXWfsdmm9MqWE9HjRtWkjqrcNszqg+QVoRgI0kxspCp7BvvABCFPBfMA9QWGe8P6bb0W+wC9XBghG2gkWWEmozcsCykPFpwya3J8YJrOidqijXz8Tlc9GJZfOa7VH6EwiDciVb5kZaHTwGRkGJZt8CnXy7gEmCaGUpmFOn9jIF5/ZuZEwF9kFZOiljIhYdVezwZfJHOgXlTx8yEv527V/Gf33jPD6QEIEXKEgn5WGc7dvfEmDN6Rvy84kcb1dLM8e8aKa2x+pqfkDAAk+0wGQtYvcyL9xO/U174M0SKdgKszGNk9rXFE3DPbVQfMzc8TAxuvmY7Te1eIcnGmW9vosRH1u9JqIc+gKehMLjvzZTMk3iM++DQ5FfOXMehCogeG7XpF8lhHXWwvJjlVtiKovLJ95ioOONGTeUahBqwKOOe8NliGXo89Trysq1Z7JbzA+YECg195OQjEhHKmU2/sorTR+zm5l80cMcdO+DyY0ECOVJVFqDyo+3JTFKPiS75HcKy3lnnl1E0qQmH17dXZuxdNh26qSmmv0swJSMJnzSitLSwvA3Bjl//utPXSESpa4p9shOO5mS2UajVbE0cCyXuP84UMu/chdhSs3GKXd6wSgKegj5FQ+YkjzzyzCD6QXjMfGZaICXW/tLe1W5ZZL1PeviM7yo7jb0wxS0D28NsnVf1bG8yvkhZMapNUD502ruRRsXNqubfregi0eCGisjP+p7Ptc0gmbZPyNWDWkC1O9FGZZ8y7au+hVMW4bNk+vQiCg1YuKBAh/y2fgAx2cf8u0HRi9G5H/2nIQgiOcuLltbopJZ0KICzbJZ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(8676002)(186003)(38070700005)(82960400001)(6506007)(122000001)(6512007)(41300700001)(38100700002)(6486002)(36756003)(54906003)(86362001)(316002)(71200400001)(2616005)(53546011)(2906002)(26005)(4744005)(478600001)(107886003)(64756008)(66446008)(31696002)(66556008)(66946007)(8936002)(91956017)(76116006)(66476007)(4326008)(5660300002)(31686004)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OXVYMlZNS1pQckd2UHNKa1c5by9vSndHd1g1RGpYTkUyYjlqWmVvUEJTRzFw?=
 =?utf-8?B?eEZZSm5rdUErS2QreUd4ME5CaTZLbzFjYXo1MzZQeVYrUG1EZFVDVVNyZkdx?=
 =?utf-8?B?QTJaV2hyaERzSTFicHpvWWpBdGswRGNCTitwZ2lBLyt3SUNxdG5jV1FrcTZ4?=
 =?utf-8?B?TkJVTVAyQXZ4QlBYUTFIc2ZFUGZ1WWEzdWhZSG05b0l0Wi9DUDc5KytZMXJU?=
 =?utf-8?B?R01CTlJ1SjhTM09oR2p6Vk8wMWhqV3poZmtXVkFSU1NPWU5hUXV1YmM4ZTVq?=
 =?utf-8?B?SkhoOHZKS0d0dzg3NlBDUFZVd2NNdGlIRit4dUFrdW5GR0ZZNmEzWjB1TkIw?=
 =?utf-8?B?dGtGSG5YaUFKdHlyWW1vOFlXaGxZdjJMNi9DSFBsL3Z6QVlZYmpXc2JsZkNS?=
 =?utf-8?B?WDBTQ3VQK1ZMTDRCRUpDOUVIRnRYTVpzVVIveFZSb0U5UWVDV2NMTEFaam9u?=
 =?utf-8?B?WmVaaldoUmFzNUZCcWVkaktyWnlhQmo1SE93OUZYUjNvazR6OFZQT290NGZU?=
 =?utf-8?B?UUFKOEhyZVR1TGpoS2lmSkNHaTM2bDhqRGl2SVZYMm9LdGlZMnlyNFV0ZkRU?=
 =?utf-8?B?WHJBb2FleURWZzdZZXNDeHdUdXRrMUpYUHl2REZjUmw2cXZqWGlXVmcrNjdz?=
 =?utf-8?B?dThPYzFnanBnVHVLRjdmejF3WUlhSUFTVXFSWGw3d1FuR2J6SW83bmN3SWI2?=
 =?utf-8?B?d0FUdE5mQjBTSDYrMngxYmU4d0gxQnlPYUw2UEttVDBHTHd4MjFteDlGTnVz?=
 =?utf-8?B?Zk1KUytlQVc2eXF3L3FBM2NvV3FEUVBlVk9PY1hxbFk5RE1ISDFiUFpybXVy?=
 =?utf-8?B?NUxqR1phK3BMWE1MYkJxamQzcHdIdzhpaWRucng2UHdRN1FmaDFMeU4yN3J3?=
 =?utf-8?B?cmZZbUM3bFVrOHFXUWszckZQOUR5V3N0MXJ0VXhKWlhNZW8wS2pWQmJ2UVVE?=
 =?utf-8?B?dCtMWDExZW5hVGZhUWRKVUlhWkJBQU1VWGM1cC96cUVCdjczTUYyM29RYTNq?=
 =?utf-8?B?Rk02QzJKK0RhQ1ZUbW55TjZ4aEdjOURFTG1YQjhMcUEwcHRzcmc2VU4zcXYz?=
 =?utf-8?B?S2FsSGZIVjlNNzdpQWxVRmxRVnpaQ2pCMWhqRm9lNGplcFA2RElXTlc5ZjRW?=
 =?utf-8?B?b2NQUWVtZENOZ0ZSNEt4T3UwZkp3VVZLcDJWL0ltd2J3ZVRuMW90dWllanBS?=
 =?utf-8?B?c3VpK3VzS1puK2tEM2N2Y1hUN2dZN2dZUUxHZENaT1Zjc2dVR25pLzhCcDV4?=
 =?utf-8?B?RnJkMHJaOFZsWGxsdzA2ZnNHWE5oWVc1alhCN2ZiWDJrWkJHeU1FQldraytn?=
 =?utf-8?B?ck5iWGY1TW5RUUlleHB6MXVyQUphc0hxSzloQ0lLZkN0MmJQalRzenhTZkhM?=
 =?utf-8?B?Z3R0QXN0c1pkQXJMZGlaVDJRNHRaNFBGbEJxQ3E3eGpCU011cUN6YnJtTkFk?=
 =?utf-8?B?c1NqN3pkZytmOTJSNDVIZnpNcXdDR2lFaG8wVmJTZGMwcm9NeEpNaGFmUWpl?=
 =?utf-8?B?ZEVLRHQzMENUQk1IaGtrQkJ5cXJKM2V0a0psVitNMzVPcURGSXZNcEJLMGFP?=
 =?utf-8?B?RUtEbE1TVGtVcldqNkNRelVZS1MzL21KUENucHpwNmxuWU53T3FuMWpRUUwy?=
 =?utf-8?B?Z1cxZlZyTzY3dnAwOHlrZG01dUJIYVdIWHBsYndMbGxYbkUyWVlGc3ZDVk1p?=
 =?utf-8?B?c2lzQWJWT3kzRHNDQ2Y2RnJCRitYZy9PeFRpdXZnU2RsbG11YUZ5YWQvMCtY?=
 =?utf-8?B?cnM3V2FFZno1ZXRJUlIzMkxZQUR4MmFjVUJQdmxxd2FZY1V1cnBodFJvZ2t4?=
 =?utf-8?B?bmlXQU0rVUdpVjBjVGFkSWo2L3FmRVc2V2NXdzJ2TDRhRFYxTmxBU2dYdExG?=
 =?utf-8?B?Q3NVV0dWMXdEdjBvZ1hqTGorVEt3VE5WeW40aVg3bVpHYTdiZ25nK2l5cjRW?=
 =?utf-8?B?UUJIRDFXdlFsRTVKbjJidDM4MFlDWStxTnE5bDB2M3FGYjlPUW8xZ2NDci9o?=
 =?utf-8?B?aTVwbUNLdS85SytJNWlxUGl1T2RsWS9jbHZNMzl4ZXB6UEZqREdkNGdwZDU4?=
 =?utf-8?B?VkpQbEVLamwzbHhBVGF5aGZsakVKbEtlU1pNejZCY1pXOUVXQzdndlgrTGlx?=
 =?utf-8?B?bml6K3YwTDZhRS8wZWcwdnVwY0FxNzFYbzJhb0pyYk94TjFHVno2V3o5Q1JS?=
 =?utf-8?B?eFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CBBCB41CBF96934CAB23C6EDA0C0A7FD@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b591dd-8faf-4198-b5e5-08da69c32367
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2022 20:13:25.9416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f7CN0huk8DN8Fvpb71bsLijQ4If5Q54U7SifNWZ/wK486kUFvcCN47Xqd6nMjZMx3adWgbcwC9ItxmYx2fbMky/rM3UPOd20Gd/sVVNof2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5669

T24gMTkvMDcvMjAyMiAxMzo1NiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEFscmVhZHkgSVNFIHJl
diAwNDQgYWRkZWQgdGV4dCB0byB0aGlzIGVmZmVjdDsgcmV2IDA0NSBmdXJ0aGVyIGRyb3BwZWQN
Cj4gbGVmdG92ZXIgZWFybGllciB0ZXh0IGluZGljYXRpbmcgdGhlIGNvbnRyYXJ5Og0KPiAtIEVO
UUNNRCByZXF1aXJlcyB0aGUgbG93IDMyIGJpdHMgb2YgdGhlIG1lbW9yeSBvcGVyYW5kIHRvIGJl
IGNsZWFyLA0KPiAtIEVORENNRFMgcmVxdWlyZXMgYml0cyAyMC4uLjMwIG9mIHRoZSBtZW1vcnkg
b3BlcmFuZCB0byBiZSBjbGVhci4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPg0KPiAtLS0NCj4gSSdtIGEgbGl0dGxlIHJlbHVjdGFudCB0byBhZGQg
YSBGaXhlczogdGFnIGhlcmUsIGJlY2F1c2UgYXQgdGhlIHRpbWUNCj4gdGhlIGNvZGUgd2FzIHdy
aXR0ZW4gdGhlIGJlaGF2aW9yIHdhcyBtYXRjaGluZyB3aGF0IHdhcyBkb2N1bWVudGVkLg0KDQpJ
dCBuZWVkcyBhIHRhZywgYmVjYXVzZSB0aGlzIGlzIGZpeGluZyBhIHByb2JsZW0gaW4gYSBwcmV2
aW91cyBwYXRjaCwNCmFuZCBpbiBwcmluY2lwbGUgd2FudHMgYmFja3BvcnRpbmcgdG8gNC4xNC4N
Cg0KSXQgZG9lc24ndCBtYXR0ZXIgdGhlIGNhdXNlIG9mIHRoZSBlcnJvciwgYW5kICJJbnRlbCBj
aGFuZ2VkIHRoZWlyDQpkb2N1bWVudGF0aW9uIiBpcyBwcmV0dHkgZ29vZCBhcyBmYXIgYXMgZXhj
dXNlcyBnby4NCg0KQXMgZmFyIGFzIHRoZSBjaGFuZ2UgZ29lcywgdGhhdCBkb2VzIHNlZW0gdG8g
bWF0Y2ggdGhlIGxhdGVzdCBkb2NzLg0KDQpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4NCg==

