Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F855F558B
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 15:34:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416225.660872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og4Xg-00057F-Sc; Wed, 05 Oct 2022 13:34:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416225.660872; Wed, 05 Oct 2022 13:34:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og4Xg-00055O-PK; Wed, 05 Oct 2022 13:34:32 +0000
Received: by outflank-mailman (input) for mailman id 416225;
 Wed, 05 Oct 2022 13:34:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8iqu=2G=citrix.com=prvs=270658c04=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1og4Xe-00055I-VL
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 13:34:31 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f0809ba-44b2-11ed-964a-05401a9f4f97;
 Wed, 05 Oct 2022 15:34:29 +0200 (CEST)
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Oct 2022 09:34:08 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5007.namprd03.prod.outlook.com (2603:10b6:208:1b1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Wed, 5 Oct
 2022 13:34:06 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::988c:c9e4:ce0d:b37c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::988c:c9e4:ce0d:b37c%4]) with mapi id 15.20.5676.023; Wed, 5 Oct 2022
 13:34:06 +0000
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
X-Inumbo-ID: 6f0809ba-44b2-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664976869;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=se3in2uAW3D9ETT34Y+RU+Il35p9iH0up3DLcLAmODo=;
  b=DJTFoJVOq1ZUOggm+40Y5O5qKmzNM7tyWXW2cW6R5aIGh1Rfm1PcBlXQ
   EfCZpHQCoE+UFe1LUkB0jnJIXcpODE9DmY8BU5meD9f1RLhA/NEahmNve
   VZt+/cLoWZnUZTG/iBaWHylBr13qr/J1b4kV/sz6721qf+EOFASQSR8tQ
   w=;
X-IronPort-RemoteIP: 104.47.55.176
X-IronPort-MID: 82014983
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:WdaCtq/OVYRTryJ4AgekDrUDcH+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 mobDzzSaP2CM2HyKt0jPIqx/EMFvZ/Qm94wGlc5rXs8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOC6UIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv/rRC9H5qyo4mpA5gFmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0stHMHt89
 fBFEWgMZyndub71+ZfrdsA506zPLOGzVG8ekldJ6GiDSNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujeNpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8efx3uiBNNCT9VU8NZn2AKU6UwoLCc4ckP84sSGrBOZUc12f
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpSvYrqcs3TjwCz
 UKSkpXiAjkHmKKRYWKQ8PGTtzzaEQgYK3UTIxANSwQt6sPm5oo0i3rnS995Faevg97dGDfuw
 iuLpiwzm7USi8EQ06yxu1vAhlqEqpXMTyY04BvWRWOv6g5lZI+jaJes4FKd5vFFRLt1VXGEt
 XkA3sKYvOYHCMjXkDTXGbpTWra0+/yCLTvQx0Z1GIUs/Cis/Hjlep1M5DZ5JwFiNcNslSLVX
 XI/cDh5vPd7VEZGp4cnC25tI6zGFZTdKOk=
IronPort-HdrOrdr: A9a23:nf/O0Kxil5Kp9KhNR178KrPxBOgkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMQs1MSZLXPbUQyTXc1fBOrZsnfd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadu/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2jnC6l87nzFjmfx1M7XylUybkv3G
 DZm0ihj5/T8s2T+1v57Sv+/p5WkNzuxp9qA9GNsNEcLnHBmxulf4NoXpyFpXQQrPu04Fgnvd
 HQq1MLPth16VnWYmapyCGdlTXI4XIL0TvP2FWYiXzsrYjSXzQhEfdMgopfb1/w91cglMsU6t
 MJ40up875sST/QliX04NbFEztwkFCvnHYkmekPy1RCTIolbqNLp4B3xjIWLH5AJlO+1GkUKp
 goMCju3ocRTbpcVQGBgoBb+q3pYp30JGbffqFNgL3P79EcpgEF86JR/r1iop5HzuN8d3AM3Z
 W7Dkwj/os+MfM+fOZzAvwMTtCwDXGISRXQMHiKKVCiD60fPWnRwqSHqYndydvaD6Dg9qFC7q
 jpQRddryo/akjuAcqB0NlC9Q3MWny0WXDoxttF75Z0t7XgTP6zWBfzA2wGgo+lubESE8fbU/
 G8NNZfBOLiN3LnHcJM0xflU5dfJHECWIkeu8o9WViJvsXXQ7ea/tDzYbLWPv7gADwkUmTwDj
 8KWyXyPtxJ6gSxVnrxkHHqKgfQk4zEjOdN+YThjpsuIdI2R/xxWyAu+CSEz9DOLyFeuaore0
 Y7KK/7k8qA1BuLwVo=
X-IronPort-AV: E=Sophos;i="5.95,159,1661832000"; 
   d="scan'208";a="82014983"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L82OP4XbzQSDtQp/iN0wxiT2iF+O+NK9IFgsa15qVVeiVZR4jlYx8CmFIBWST4imp+CNRs32MipG/r266ZJo1vrJ/TxgDdIfnzh2O8f6CMMyp46PfxAsyAgZ2pKfTbG/PecVirKteCr+uKTMjc33dBgcP5QLGbXh8eetpq+5++m4TFDb1oykyraApXm5yJzPl0mV50F4P1AlubHKVJJbGevP7Q57mBoH20ZhpNGQ5HngneOnEqcTSW6h9CHxcfI2LvpwQwfvpFPvjsZX3FVWeqWimFL++7g3sWmokIxitHfaWni/633GLlyprDnk63Qr7Vkbz5GvBcksdfxldu9rvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=se3in2uAW3D9ETT34Y+RU+Il35p9iH0up3DLcLAmODo=;
 b=IEo2DbUP5nJuBNplI6Hbo4aN+252BE8PJB4Xd+upJ+PexupJHbA0JUe3P4EiF1lcL4nqEh8+NU8Bgwce+QJMfi/cUOETAwZT56mLIAtaGOaM+Mw5Y76Ty4dpehANcU/O30bhsLYZwWpov8cKgy3uGXJQEGnzyEYe0C4g07XKR9x3XQl2eid8pSmemIrcd7+NGUGbYYbXwpf6OKFdFHrIbMUL/UhY/43u68DvuHFf39YZrM78mFSk8RE9YqnmbvScl9Y37m+wS4f3ia2j+4GhWm2Je7fu2fegjsh617y5Mobi3x2uVMRleWj6A138xZzVMoNvALBfENgmv3j1KZ+J3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=se3in2uAW3D9ETT34Y+RU+Il35p9iH0up3DLcLAmODo=;
 b=Ycqp9ZUH7QEY9onw/FDxTYStN8dZegNcYZWnHLfyNjBIpxnynu6YY0UI3zLyfOn7XyhkuQ93eCnrcDHcY0Q0Fz1d8+F+W1ngP7LDmR5+kft/ZjExIBbPFLaFSRJG2pnS4fFYcxDw2i/vkIXrmepORl2T8zzn3uIeDmy92IAaGRo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Demi Marie Obenour
	<demi@invisiblethingslab.com>
Subject: Re: [PATCH 1/2] x86/cpuid: Infrastructure to support pseudo feature
 identifiers
Thread-Topic: [PATCH 1/2] x86/cpuid: Infrastructure to support pseudo feature
 identifiers
Thread-Index: AQHY2AuYxJImxml8GUGenwgOwsThN63/kTAAgAA9AAA=
Date: Wed, 5 Oct 2022 13:34:06 +0000
Message-ID: <0ff7672e-46b8-d74c-ec66-75a1bec8b557@citrix.com>
References: <20221004160810.25364-1-andrew.cooper3@citrix.com>
 <20221004160810.25364-2-andrew.cooper3@citrix.com>
 <Yz1Uoma3S4Wgmr4F@Air-de-Roger>
In-Reply-To: <Yz1Uoma3S4Wgmr4F@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MN2PR03MB5007:EE_
x-ms-office365-filtering-correlation-id: 665de7fd-4e2d-4d62-8bfd-08daa6d646a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 2pXNMaNTKNHFaROx73MIP/56Etv4SC/tAMU/cocNlcFO66IwfBsfRBTIVA76falxA+zj22XzufXeHCkO4s0uHQTvMnhDk39gLvZ+JfZxAyxZnET9yvIyVy811jLX/OBBTNMoQAkqEIgpI+SbQuGU1x92/LarxSwTeAx8P/i3ygEUDubeN+Qlzx8NKcHRvOUzf25DBq8f3tFdQI5pwNIqXUIJ21gCh2I4SE8WypttugULuJ/b+xrFG05QYNiFiNSjPxVyZ4+ie36Mto4MOaaWdD16yIIFdwV5DA/HTqi/Q5dIGNAJ74FFwKyQVvRfWcvx+48PcNeuSZHniOUIrpy/Lzguy9e3dibCZuwWwMrPhgIjLOACCu0M1AEAJqv98txhiNa5ESEaKP/Q3ZiHkOu3MgGsH6LW9tsClGk6Mo9b/dZNo9kDi6VeKATkWIkjnYw6KsGqd51o+chiFmdJwWfQAh/UqnTXzmgyWNUweHZP4KwD3/JrQbZQCKAmUHbDYNW0ewE6/m9nF5WNgj4953gmu3ANye1U+VjKPwWUjcvXOYBHWgpe+jq29lEfQ1wpa9GNZvsay+BobqAnL4A67zcpCvANhhCMHeR6Mywao44+DdEjKUGEFYFdhIFn0N5V7OU249gztne3b+8Z/b+5BZIxN2Q8OtmOK2jqtjjUI+fCjdzygKAd50csSq2JYm5TonH4Smp/sgcGfJBAMse6QSSHSKhe7H/cyXE67HL5+NWGub9qToBYH3obDQdi/bAU2Y2GDaPDKUe0v+TudpnqQKgLBnJHs5EM6w91e+phjINMjz9fBzD4aHI5t22RL9MMv++J3G9G6k0qPS+SFxJIAINZJQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(451199015)(2906002)(186003)(38070700005)(122000001)(82960400001)(38100700002)(66946007)(76116006)(91956017)(66476007)(66556008)(66446008)(4326008)(8676002)(64756008)(316002)(6636002)(54906003)(37006003)(4744005)(41300700001)(8936002)(5660300002)(6862004)(53546011)(6506007)(6512007)(26005)(71200400001)(6486002)(478600001)(2616005)(31686004)(31696002)(36756003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OXpHOWYzbkgrWTlSOGRHQW0vRVh4TEtaWHpoZG5IMzdqUU05cmpjSnA3TGE0?=
 =?utf-8?B?OXUrQThqMkhsQW45SjcwZFU2RkV6eDZSTXBrWWZ2UWczSzZDdjhXZnlmaXhn?=
 =?utf-8?B?Q2hDTzRYdEVTMElYV0l6SThSVTYzNzVOSEZNbE5oLzZFR2RvVWlZc3VNSDA3?=
 =?utf-8?B?aXozMFJka3hiYVBybWRvL1E1Q3hUTUUrdHQ4RjAwcGFsdmpGdVVWRVFTeVBr?=
 =?utf-8?B?RWcvWGtoZXlDeUdTZk5vQVA0RGNCczJDV3QxeTRrbGxCUU4ybFRWdWNJek9O?=
 =?utf-8?B?Yk5QbVEyQ3B2WFl3eGlQUmVZWjZ5bHdDTDAwTys2dnFTcWg1ODM2SUl6eTRG?=
 =?utf-8?B?emFaY1JCaUZLWHEwWTlFQzh1SVkrY3lIOGFRakJwUG52cVpXK2ZlYzZkRjNy?=
 =?utf-8?B?aDZJY0V4bUN6TDVVbWFCK3BxUFJVdmhQa3VvR0hDVlBsSTlWcG85b0dZSkFX?=
 =?utf-8?B?VmpRSWVTcXN4NzNCVDJuZjBPUk05OHJyaG1XK1pNTk9LNStMaERqK3pXc1Jl?=
 =?utf-8?B?WngxTXo5VG1aMHd2N25walhsWG5QTDJGdHpVamswS1lIMkcyRWlCbEJVQ0k3?=
 =?utf-8?B?N2NzWUhxSkhXam9YYjVueVdLS1ZSWnBibTB4R1pzbnIyZmN1R0plaThJejJz?=
 =?utf-8?B?Vy96V1kzOUNwRzIrU2FOVWlRZjk4bWxCUmN1UzdhVFNZUW1zVWRlc01yZ1NS?=
 =?utf-8?B?eTY1b0hYRVRuaiswNmR5TlJRQUdGNDJFY0JvZ3F2aHZHQll5ZzZqNU42UGcx?=
 =?utf-8?B?bWFBbVpOMVBDYjYyb3ZQWTN6eklmQ0RCTVdMWnVhb25RVUI3RGt0UUREOCtC?=
 =?utf-8?B?LzVzclZFZUw2Q2lYdCtTd1FCai9ndEFvSy9wQ3ZZeVp2TzZ3QXBYd1cwejg4?=
 =?utf-8?B?VkorMmFHeWg2c2sxSGFJclVmU1RQTFNIMzVWNE0yK0J3KytKWklkS0lmcGJB?=
 =?utf-8?B?dUd6MmJqS0dGZlJuR0tKaFExVG1YK1A2YWVQbXVaNTZNUnZjZW9VL05TZHB0?=
 =?utf-8?B?T3M5djlZRnJuUDN2UTdqOThlODlaSHdBTkNobWs4QzNocWZiaDRCTEdMcU9q?=
 =?utf-8?B?T3c2c0FLTWJTdTVuRkRhUHB1dzZDYVd6cG1sMS81S0xMVnRuNDNqU1lKLzZO?=
 =?utf-8?B?MU9GQll3K2tFRUZSL0x5T1NQbkZHMjBmTlFmSDBGZUZKSHBkU2tHYk4vMzFF?=
 =?utf-8?B?NlV3enE1QjFUT0hFaC9HVFNZZGVhOVIxTDI2MHhydDdVUWpHdlE5cG0vdjBN?=
 =?utf-8?B?Q3pGdjdoaGJRMnUrTGFyaEtCTk5TL05CYjZMOXRINXIvTW9uQTUrV1RBOFFZ?=
 =?utf-8?B?YXpxc3VHT0lXODJ0cVJnSFhHTVVnZTg1YmtJelRvNWVlcW9uWCs4T0xiRlZs?=
 =?utf-8?B?amk0RGlhMHdyOXAzeGVZOFo0NGpqUUhhQ2k2b09CS2xBQmFlRnNXb1RCWHBh?=
 =?utf-8?B?LzFWTnhWWTNUY3hTemtVWjR2UG9LZDNLWVVyYVR1eUxPbjk3Z3pueVdVcUIv?=
 =?utf-8?B?TllFV2NkSU1EN1d0eWRQNjVVeTNxWWh4b1hidUowNGtTUVdXSkROQTFZQ2E3?=
 =?utf-8?B?SmZnZEdEL1dXYTNBMnFpaFpXbEM5aU1HRUZmbEszU0EzTW9qcDNnR0V6Y2hT?=
 =?utf-8?B?MUF2Y1ErTU4vQ3ZvTWtxSDF1Z0YzTklpM0NqVGUwU1hhdGtNQzY4alhIc29I?=
 =?utf-8?B?eHhlaVE4MGRiWVZlU2hsWXdpaTFUOTJST3BOZEk0R1RMYmxJNE5WYkd1eHRq?=
 =?utf-8?B?ZHlGZzVUU1dVVFNCSmMvekprWStUNm5EK21ZNkNhNUFwMy82NFFyUm9EREl1?=
 =?utf-8?B?VFVRck5XaFBOdDNKRTEwNzliTUhsREJBK3U2TS9DRmtQa2VkdkttRWsvcm1F?=
 =?utf-8?B?Sk5jemNES09GMGpnK3ZscmxvUVNCMU1WdEtuc2lNeVlodVpEc3lqdG56NVV6?=
 =?utf-8?B?MFh5dEtKVVF4ZktvVTloMlZxb3BFZ2xOdXFpelptajg5aVV3NFd6MVJGcHp2?=
 =?utf-8?B?dDJ1NGxMMXZLRGZ6NkxqcXV0SzBQOURwTmVHcTlQY2J0Z2Z5WGVrZi9LeEFj?=
 =?utf-8?B?eHNMNk9EYldtSnpBV25HZ3hDTDhXM0pmSGpRaDBFejN6UThrYUh2VUFvZi9s?=
 =?utf-8?B?cGtBOGdQR3V0S1M0YlE0WC9vd3pBL1lCalljalBZbDhFWnMwekdTRFJBNHh4?=
 =?utf-8?B?OXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C064B73FC80DC488D47EE8CDE6D3EE6@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?WG96OHRxd0g0WDduWDd0TTF6MXZLYWE1MThBMVJDeGlXUzA4VWZDSE90cUt1?=
 =?utf-8?B?TjduNk5QN1g2Y2NZUkhGeWYwM2JlMlVxa3UxVXdLdDZod05YUkk1aEM2SmxE?=
 =?utf-8?B?bER4eXpORjFyRHFSdW0ydHY2dUw3RWVtRnlyWlU2bmdIY2dFMndCR28vMlQr?=
 =?utf-8?B?cDJ1ZXhZTVZONVZJb3Fzb2Q1aG85Ym85VDQ1bEhOMCtqWmM4Mm5DNkxFZEVy?=
 =?utf-8?B?RHlQVk5HWDBnOWh4YlJmb05NNksvUUVTTlB6cUF6ejc0SzlYdXdRQ2xEUytI?=
 =?utf-8?B?QUYrM0xqczkvVlZ0emJvdkZYNDNCa0xkd0FJdk9YZmJWT1NhTlhOT1pBOVc0?=
 =?utf-8?B?SWVMN3Z5c2VJZHdhMm9yMlAvK0VaMFNaT3hSbldSQUVrbUltbmZ1dlNMRVRs?=
 =?utf-8?B?c1dTam5WOGh2VGZ0NjdMYS9SR3VYZU8wN1RTY0RBQjNWdmFjZFUrQ2NwcEVu?=
 =?utf-8?B?QTA4NFVCY1NLQ25pMk9jREVkZHI5MDVJSkxOMm9PaCtVRHdLc1lOVVd5MGo5?=
 =?utf-8?B?aFZOMFI5MnFpZWd2S2JGdlZNUHQ0M29rMzhwaVNRSDJLOUl4RU9LVU56SUh6?=
 =?utf-8?B?OHNUSXQ2L1BrSUNvRUdFbWgrcGZ3NkQ2OTRwYXJLYVp2enh6a0JiUXBxaHdp?=
 =?utf-8?B?T0FvT09qZUVSZ040cExnRlNGeHp2aURRaytzdkh3U3phc2lNRUtMOFE4dnFa?=
 =?utf-8?B?NTBoN1NFVS9GRWdPMENiaHFyR0FrMENrWjdnUkh6aUliVVdxU1lnY3BtT2pK?=
 =?utf-8?B?Q2RZclJCaER2cUhBbkRmSWZYbVJxZXg2Y0phN2JIQzBTMjFZS1R0UDhmUW93?=
 =?utf-8?B?VTNsU3VoMFdkSmNTNUk5Y0ZFSC9zbnc5UkIvcW9paVNIVnEzeGZGczdFVjhX?=
 =?utf-8?B?Q0NaS1pBZUo5SDQ3SG85T0hSeGxtajhnck5qSkpOUzFSY2pmcmEwNDZTWEdC?=
 =?utf-8?B?MThuR0t6MUVJQTNKdHRJTmVNOU9XNHJiUDVnRUpzS2wwVHpGeHpCWS9HM3Bn?=
 =?utf-8?B?SWRrcEROWVRpSWpMeDUvYm81YVdaZ0lOdW54NENoSWI4SDVsQUFCdmhoY1VZ?=
 =?utf-8?B?WUI4OW44M0hmbWJmRFJRVGhZemxmNFROdk9lWDhrc1gvYWFmQU9uejZ4YVhi?=
 =?utf-8?B?bmFieWVveXdIc0lOYWRKd1FJbUxnUFZ5aFRtUTBPQ0l5dkhjSm8xRVpwUG1a?=
 =?utf-8?B?anFuNFJURU5pNWdpYXNOVi9zVXp6MFkxYzhHNE1mM3VQZTRwRlFBOUg2SjIy?=
 =?utf-8?B?TzFqVDV5cnlMd1k1dC9DMEZZU3ZBUnFrZzdzWlpITitpSzR3dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 665de7fd-4e2d-4d62-8bfd-08daa6d646a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2022 13:34:06.4697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c0mxucM/6Is+83fhCPY3OJZ1viDGMHDVCwqAj+ldj6vB7Jm7Jod62eW7J7DSXqQzHDAGXIY8KRL1iJHUZiS8I9rO7vxsHECZbgNZNTH2eoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5007

T24gMDUvMTAvMjAyMiAxMDo1NSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gVHVlLCBP
Y3QgMDQsIDIwMjIgYXQgMDU6MDg6MDlQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+
IEEgZnV0dXJlIGNoYW5nZSB3aWxsIHdhbnQgYSBjcHVpZC1saWtlIGlkZW50aWZpZXIgd2hpY2gg
ZG9lc24ndCBoYXZlIGEgbWFwcGluZw0KPj4gdG8gYSBmZWF0dXJlIGJpdC4NCj4gV2h5IHdlIHBy
ZWZlciB0aGlzIGxvZ2ljIG92ZXIganVzdCBnaXZpbmcgc3VjaCBwc2V1ZG8gZmVhdHVyZXMgYQ0K
PiBzeW50aGV0aWMgYml0IG9yIGFraW4/DQoNClN5bnRoZXRpYyBiaXRzIGFyZSAoaW50ZW50aW9u
YWxseSkgbm90IGF2YWlsYWJsZSB0byBjbWRsaW5lIHBhcnNpbmcuwqAgV2UNCm5lZWQgc29tZXRo
aW5nIHRoYXQgaXMgYXZhaWxhYmxlIGZvciBwYXJzaW5nLg0KDQo+IENvdWxkIHdlIGhhdmUgYSBi
aXQgbW9yZSBvZiBhIGRlc2NyaXB0aW9uIGFib3V0IHdoYXQgd291bGQgYmUNCj4gY29uc2lkZXJl
ZCBhIHBzZXVkbyBmZWF0dXJlPw0KDQpJIGRvbid0IHJlYWxseSBoYXZlIGFueXRoaW5nIGZ1cnRo
ZXIgdG8gYWRkIGJleW9uZCB0aGUgY29tbWVudCBpbg0KZ2VuLWNwdWlkLnB5DQoNCkl0J3MgYSBt
aXNjIGNvbGxlY3Rpb24gb2YgdGhpbmdzIHJlcXVpcmluZyBzcGVjaWFsIGhhbmRsaW5nLg0KDQp+
QW5kcmV3DQo=

