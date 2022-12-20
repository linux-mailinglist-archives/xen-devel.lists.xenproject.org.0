Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F23651EDA
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 11:32:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466947.725925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ZuR-0000XN-IN; Tue, 20 Dec 2022 10:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466947.725925; Tue, 20 Dec 2022 10:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ZuR-0000U7-FF; Tue, 20 Dec 2022 10:31:43 +0000
Received: by outflank-mailman (input) for mailman id 466947;
 Tue, 20 Dec 2022 10:31:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+pxk=4S=citrix.com=prvs=3460f7db1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p7ZuP-0000Tx-DA
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 10:31:41 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a6af84d-8051-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 11:31:39 +0100 (CET)
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Dec 2022 05:31:34 -0500
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by MW4PR03MB6508.namprd03.prod.outlook.com (2603:10b6:303:127::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 20 Dec
 2022 10:31:31 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::5c96:fc3a:9d36:4a2e]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::5c96:fc3a:9d36:4a2e%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 10:31:31 +0000
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
X-Inumbo-ID: 7a6af84d-8051-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671532299;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=tfXPPr0o990M5PXY/eSQK6WrCqDBXjKrwv7/2THhOSM=;
  b=OFd9I9GjFn+3U8IPxFCl9jWLogc13eKmoFJQVpX9UdYn1wW3E8Ob0iXI
   WUr6R0FY3/RCstlCarfONYx8i9LFMPNLkc8aXhx3FwEHz0gKkUxqitM8i
   bSsUu7/PuHh6jgZ4ULIJ6Ie4wdvOW1/er0+H8NqEQ3U6lL8Vpssze81rB
   o=;
X-IronPort-RemoteIP: 104.47.57.170
X-IronPort-MID: 89272232
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:QEiN3aPn9qJoCqnvrR1glsFynXyQoLVcMsEvi/4bfWQNrUog0z1Sm
 2RJUWrSPPbZN2Sjetp2bYrjp0IBvZWEyt5kGQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpC5ARmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0s1qE3kT1
 N5CERAUcUGojbq/3eq2ROY506zPLOGzVG8ekldJ6GiASNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PVxujeLpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8efzHmkAthJTtVU8NZ4rlO63Ek6TycbfnKRh/vjt2Cud8J2f
 hl8Fi0G6PJaGFaQZtPgRQ+xpHmIuQEVc9VVGuw+rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqf/LqJqTK5OQAOMHQPIyQDSGMt+9D+pKkjgxSJScxseJNZlfXwEDD0h
 jyP8i43guxKidZRjvrju1fanziru57FCBYv4RnaVX6k6QU/Y5O5Y4uv6h7Q6vMowJulc2Rtd
 UMsw6C2hN3ix7nX/MBRaI3hxI2U2ss=
IronPort-HdrOrdr: A9a23:FlrbKqo1tD4fATOSfxcX1l0aV5tyLNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ku90KnpewK+yXbsibNhcYtKLzOWwldAS7sSorcKogeQVhEWk9Qw6U
 4OSdkYNDSdNzlHZIPBkXGF+rUbsZe6GcKT9IHjJh5WJGkEBZ2IrT0JczpzeXcGJjWucKBJcK
 Z0kfA3wgZIF052Uu2LQl0+G8TTrdzCk5zrJTQcAQQ81QWIhTS0rJbnDhmxxH4lInNy6IZn1V
 KAvx3y562lvf3+4ATbzXXv45Nfn8ak4sdfBfaLltMeJlzX+0WVjcVaKv+/VQIO0aWSAWUR4Z
 7xStAbToJOAkbqDySISN3WqlDdOXgVmiffIBSj8AbeSITCNU4H4ox69MNkm1LimjQdVJsX6t
 M140uJ85VQFh/OhyL7+pzBUAxrjFO9pT44nfcUlGE3a/pXVFb/l/1swKp5KuZ3IMvB0vFvLM
 B+SMXHoPpGe1KTaH7U+mFp3dy3R3w2WhOLWFILtMCZ2yVf2CkR9TpT+OUP2nMbsJ4tQZhN4O
 rJdqxuibFVV8cTKaZwHv0IT8e7AnHEBRjMLGWRK1L6E7xvAQOHl7fnpLEuoO26cp0By5U/3J
 zHTVNDrGY3P1njDMWftac7hSwlgF/NKQgF5vsulKSR4IeMNYYDGRfzOGwGgo+nv+gVBNHdVr
 K6JI9WasWTWFfTJQ==
X-IronPort-AV: E=Sophos;i="5.96,259,1665460800"; 
   d="scan'208";a="89272232"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D5ucISsf4jk+BuizOZ9y0gvS7FSVWBUQv1uevlJY+ZBmbd7khmIKTTF2cc1vcc+C+JIPTo38f++TXQ+WjfzeGtWsjxM7KUV2ad1tqPPcVlKTAe1nB7ZmUfmj9o4KBQnvdTpT25XxCIUrybUkWCA0Ufqh81oMHn+ultoH+eYQ8FOeTzsn3EZD+yWfZ4uwKnp9SGKWgbMihLPXQV9H+ByZS/QUGJW7GTINg/QxmRjF7NIggaYXFZTZQNB5ue2+Tv1xyaAEDAZ40JO++BNW2t1/QDuB6SpY6zyBB4tl8YttuURzoFu0LaLRvXeZzoSzjMYVdC1/Vnrg+NzmLX3t4suYww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfXPPr0o990M5PXY/eSQK6WrCqDBXjKrwv7/2THhOSM=;
 b=cy3BARtOwFeZEmazu/FbOeUt8A7RKacy29vA4gz/0CfWDXkhSkPg5c9iAurnQpsvP2FcvKh7/woizYsDcxFG7h1k9uAge22YfXZZ5rA8t7IMZFjttEbsxhnYOt8HEPtXyPFQK/h3Xt9BivUGWVF0sEMEwCoC9TIFIBLlbLccQzL4p580ZuylgDU68l8SbLgTdDFiHQ91LU4wEqefhjuIishPY1o3SX5D+K40HfAaB//f7qN0v9CllpiB1IGbJ/fVxyPWdXxwxwlZEpGPRo+t+kovpnqZtAmicvzHbhHsP0atgtSSJSKkAlNmtu52HkTvYEkChxnI87mMKC6udmhrtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tfXPPr0o990M5PXY/eSQK6WrCqDBXjKrwv7/2THhOSM=;
 b=shCnSoZheVarlNFI8RMIA7GXPbSVTgf3RJPFUdjNH/LmRfszkHY0PTY8sCRXAzDXRJg/9mvT+2PYcVUcU07krqpPajfwaEsZOkhd3em0xw0DPOSRV6wDfoRUdmHUBXvAT2dPhjcGNawRRjexbger9/mRRc2wfqOM5VXcaTwMuRI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, Roger Pau
 Monne <roger.pau@citrix.com>
Subject: Re: [RFC 2/7] x86/iommu: amd_iommu_perdev_intremap is AMD-Vi specific
Thread-Topic: [RFC 2/7] x86/iommu: amd_iommu_perdev_intremap is AMD-Vi
 specific
Thread-Index: AQHZE3QWS6NAJx0E4UyJylqsah2q1K52lYuA
Date: Tue, 20 Dec 2022 10:31:31 +0000
Message-ID: <8cc983ec-e28d-bd56-994e-39def18a511f@citrix.com>
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
 <20221219063456.2017996-3-burzalodowa@gmail.com>
In-Reply-To: <20221219063456.2017996-3-burzalodowa@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR03MB3618:EE_|MW4PR03MB6508:EE_
x-ms-office365-filtering-correlation-id: 075e0160-cd27-46fc-cfd1-08dae2755c83
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 xEknKG4hBSzW6L5hf7d9pYlwdVndnz2eGGV/R9hWezBwKN53Qcf7ZF4hLx07oJIDRD7peVlFLwzdQo8JYyzAsQwGNmGrB4sl8D/J3MQL7YElAMxIqry/h8hP9CBe1nIFkbPn658zmH1HaGn8Qt6fCgCwo4r97kkIVtyqe/jICk0aRNE8ATCCIOV1yXGbh8r3raQfhRBwC9Yr2W0V9IizfBaO+5WyoJZujGi1ZykziBXgpi+X0GcRhuPheGXH8vwBYtLo4OvrFb8WqyTccM5BFsZEum/fk1OdCHaOEeI+HsWoxvaIGLnQn0jdqJqAlN4lg/5PBcjYMngParI625mSXPtoynUPQ5Mth9xuKA2IzsCXCpPt/XlQ+kRW/rQnKZ1nZiMwqude4gGmTUx8nPnTqU38Wm3WC/qkw5PBbN1NVLArmiPa/ERkg7YgjkgXh7lYHYMCpd9UDVYmVOBa2pmA6wpQBiaXacPoMsmr/g6Co4Xpk5jK6DGVnEBfkpbqskSlyXqYbyJDkpnIV0cZsvVCLZC9kWWetfqfZt+ezzTLmZlxlu7AAIDDHhHrh7g98BowAj5Qize3hslsTp2AY5wiGlfaIgpkX8KfT1LmDTuU195RVCJ4bv+Cop8JSC5mklSvxRaTmQ/avuSPDGhWbU6O7hjSm31QZP75DAMH0yD6FJRF8V4cEXH1xEeo6RKbfuJPLwzPEo+qTaRA1/xMcS1SXUMIqWc1EY69HNGWH4wmtnLbFMr/6zSZjfx9QaoNggqHTZRGRksl7l1ptd1F/jRl2g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199015)(316002)(4326008)(76116006)(6486002)(2616005)(66946007)(26005)(91956017)(38070700005)(66446008)(8936002)(66556008)(66476007)(54906003)(110136005)(38100700002)(6506007)(122000001)(6512007)(82960400001)(478600001)(86362001)(36756003)(107886003)(31696002)(53546011)(186003)(64756008)(71200400001)(8676002)(4744005)(2906002)(41300700001)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d1B2UzdsK3V3NDBNV1JpLzNzaUJnYjh4OUo3ckJGRk93NEtld1J5OHp2a3d5?=
 =?utf-8?B?aENkejR0YzQrQ3BqSUhrTDJjYXJDNDVQTklhQW5XMGd4bDZNaEkrYjJtQVYz?=
 =?utf-8?B?K1FxR1hPT1YyK3ZDMktLbmM2a2c4YWJHYTBzMlhtNytza1dXR1ZvcU43QTNU?=
 =?utf-8?B?OU9leGZwY2VBTWF6TzBZUDNYNTMzOGhHd3VZVUlhOW80eEhsRkxzdC80Sm9n?=
 =?utf-8?B?QmlFSkhwSHlnSzZ6RDFkZE1LRVhseFpPcG5BYXdWRzNBdXFJU3VqeDlzZm1v?=
 =?utf-8?B?QTY2UTRrdU50bmpOanh4eWRrcW5oMzlXeU80K09LMmN3SUNTY0RmdDVmdXNi?=
 =?utf-8?B?VDVmbWRnd2w5ZFdaaUM1ZEVRejBMNVVKa3NLd24veVhmMHZaS0h4cVNTdkRh?=
 =?utf-8?B?OXBFaDNzR3RXZmR1YWd3YnRQV09uenRneGFCTTRpUlJVb2FJWG1yNlFIbmc3?=
 =?utf-8?B?RzcyYnRoazVFSXcwcXZtQURMYm1PUHhqVWZrUXpHL2FVbFEvTVJUSHRudk9Z?=
 =?utf-8?B?eWF3T0o5RUFNMEQvYjhzYUZ3R3Nsa0xsMEJUNFoxbmxVdFJqT25HMzZ3OThp?=
 =?utf-8?B?R2d3bldvWWRrMzRTSVRMd0s2dTY0ckN0d3VYV0Z3ZjRFSFE3aFJKclVOa3ls?=
 =?utf-8?B?VS9ISWhKUmJqcityNExVQ0dJNWhocTlHVmM5eEZ6SE8ySitOZkpPN3htSGlZ?=
 =?utf-8?B?UUg0WFJjblhJTkw3QWx1OFRwdENpMUZSMHN6dmI1cTdIeHJXMUFxd3A1N1dx?=
 =?utf-8?B?SVRYMXYxT1hWVTZoOUJPMWJKbTlUZmhJcThPMnVnWjd1akFlQTU2Wm81Y0JL?=
 =?utf-8?B?MDFma3BqMWFGR0FXV3VMTlRLMUQ4czJicUtJNkVVSGl2VXZCUXc3RXV2U0tj?=
 =?utf-8?B?YmpUNGZuYkZYUzIrcTNCcDRvY3JNdk1YRm1FQUJhaUVsVndNZFg4ZVRVcllQ?=
 =?utf-8?B?OEZRa3ZiTVNmOFJuTFNiVCttekhmTGtrV21zaHFSWlhZUlFrRHlacTRBS2dQ?=
 =?utf-8?B?ZUhGUTdsWllTc0Vwbm9OOGV3L2ZHbjdFS2lQd2x1MG5ZYUczWHZVQVRvOWo1?=
 =?utf-8?B?QkJuSXhLdVI1T0UyUU8yV2VmYmdOSnpUc3hrY1BXVjBoZmF4VVZkS1puUGhB?=
 =?utf-8?B?RnpTek9BdHRKa3ZVTGpwWVQrd3lhQVpnTzFoRmpuTVhScGQ3QkJlK3dLdjhV?=
 =?utf-8?B?SDdaUG1mY2pNQmxhbmVCSlppTDAzSmN5VXBVenpCTHFwcG1GbUZHSHU2cXd2?=
 =?utf-8?B?S2lUQlp1bGVXNG5tbnlsNDJVTnpWWlJkRDEzRFVSNGUxZ3F1RmovYnUwL1k4?=
 =?utf-8?B?SWtDUUJRQlg5OEQ1eWJ0SjJBSnFhK0ZkQVlZbjdVQlJjRkN6bkowd0FTcWdM?=
 =?utf-8?B?M3c3UUlkUVljeGhvUnY5eVdHSmtUa1RYWjNZT0JTVkZab0JhdmlOVzZrUktV?=
 =?utf-8?B?aUFPV0pYa0loRm5BNllBWHcxTW5wc0lZZnFSb1g5NkpoRGlQaTFTeTZaK1Jn?=
 =?utf-8?B?KzRHeExETjR3QjZnZGk1bnNlVWcybnpkZUQ0dVpMQkYvMDZHeEthTGRBTUY1?=
 =?utf-8?B?M3JXV0g0bXJOM0JTY28vczNES1RoNm90eFg5eXc2NExYTFk2b0cyUjNjSS9R?=
 =?utf-8?B?WFJYZkpPbnZGTHA3S0JxWnhUTUg3Q1U2NlkrWEhnZ0g2ei9WK0JRWFhTL2NE?=
 =?utf-8?B?ZnlyeFh4UXBROEhvbUlENXdpY011YStyWGdubDF0cmgyODZvTm5xZHlNdDIw?=
 =?utf-8?B?V1h4OW40QW9GcHZjSU5XMjF1VDFiY3phTWp5eGZHQXc1RGQ0R1NTV3BSdklk?=
 =?utf-8?B?WVZzR1dkN3FHb2VLOFhkQ3YvTmZSK2lTTnhzZVBVcWdhSlE1UWM5M0ROdHZO?=
 =?utf-8?B?WlBKZW1WTEZDejVRbVdMVEZDRnpaTHI4dE5hRTFyQkNhelNiK2dvYk9DRE1T?=
 =?utf-8?B?eFlzWUJ5c2pzaCtSWGxmbmF4TVhqc1ZXMHNpOGVOMjNqby9lSDJ0c29nc3V4?=
 =?utf-8?B?Mkg1Sy9JVW9yTGIvZVhYQ3JFM2xDRkdaZXRnRmVTcTAzN2Y5TVhOeHFyZERD?=
 =?utf-8?B?d3BVcjl1RDJVOTUxaHJ6c2d1cFVxV1JnNXEzM0JCQVpjZkk1RkQ1UVRvWkNs?=
 =?utf-8?Q?KT72b+C9NcUB59x3BLwbOZIDi?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <44114CEDB01C04409BA4324AE8580F2C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 075e0160-cd27-46fc-cfd1-08dae2755c83
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2022 10:31:31.7383
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: II6CP1E7WZwpTjrPzX9+Y3tdCWiGZa1TmZtaWLmF8QHJyC3/GoRKwJ3cXzj3SRzWyA1Hm/RZ+Y9Ii6LPGvKgQwb2dR7uAZsTYBf2/LXGzbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6508

T24gMTkvMTIvMjAyMiA2OjM0IGFtLCBYZW5pYSBSYWdpYWRha291IHdyb3RlOg0KPiBkaWZmIC0t
Z2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL2lvbW11LmMNCj4gaW5kZXggNWUyYTcyMGQyOS4uMWEwMmZkYzQ1MyAxMDA2NDQNCj4g
LS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYw0KPiArKysgYi94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9pb21tdS5jDQo+IEBAIC01OCw3ICs1OCw2IEBAIGJvb2wgX19yZWFkX21v
c3RseSBpb21tdV9oYXBfcHRfc2hhcmUgPSB0cnVlOw0KPiAgI2VuZGlmDQo+ICANCj4gIGJvb2xf
dCBfX3JlYWRfbW9zdGx5IGlvbW11X2RlYnVnOw0KPiAtYm9vbF90IF9fcmVhZF9tb3N0bHkgYW1k
X2lvbW11X3BlcmRldl9pbnRyZW1hcCA9IDE7DQo+ICANCj4gIERFRklORV9QRVJfQ1BVKGJvb2xf
dCwgaW9tbXVfZG9udF9mbHVzaF9pb3RsYik7DQo+ICANCj4gQEAgLTExNSw4ICsxMTQsMTAgQEAg
c3RhdGljIGludCBfX2luaXQgY2ZfY2hlY2sgcGFyc2VfaW9tbXVfcGFyYW0oY29uc3QgY2hhciAq
cykNCj4gICAgICAgICAgICAgIGlmICggdmFsICkNCj4gICAgICAgICAgICAgICAgICBpb21tdV92
ZXJib3NlID0gMTsNCj4gICAgICAgICAgfQ0KPiArI2lmZGVmIENPTkZJR19BTURfSU9NTVUNCj4g
ICAgICAgICAgZWxzZSBpZiAoICh2YWwgPSBwYXJzZV9ib29sZWFuKCJhbWQtaW9tbXUtcGVyZGV2
LWludHJlbWFwIiwgcywgc3MpKSA+PSAwICkNCj4gICAgICAgICAgICAgIGFtZF9pb21tdV9wZXJk
ZXZfaW50cmVtYXAgPSB2YWw7DQo+ICsjZW5kaWYNCg0KU2VlIHBhcnNlX2NldCgpIGFuZCB0aGUg
dXNlIG9mIG5vX2NvbmZpZ19wYXJhbSgpIHNvIHVzZXJzIGdldCBhIGJpdCBvZiBhDQpoaW50IGFz
IHRvIHdoeSB0aGUgb3B0aW9uIHRoZXkgc3BlY2lmaWVkIGlzIGdldHRpbmcgaWdub3JlZC4NCg0K
fkFuZHJldw0K

