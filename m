Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 806CA50B652
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 13:43:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310843.527800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhrgU-0004HW-5p; Fri, 22 Apr 2022 11:42:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310843.527800; Fri, 22 Apr 2022 11:42:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhrgU-0004ER-2D; Fri, 22 Apr 2022 11:42:46 +0000
Received: by outflank-mailman (input) for mailman id 310843;
 Fri, 22 Apr 2022 11:42:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+xj=VA=citrix.com=prvs=1042e1a12=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nhrgS-0004EL-FJ
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 11:42:44 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5099c97b-c231-11ec-a405-831a346695d4;
 Fri, 22 Apr 2022 13:42:42 +0200 (CEST)
Received: from mail-bn8nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Apr 2022 07:42:38 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB3818.namprd03.prod.outlook.com (2603:10b6:5:42::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Fri, 22 Apr
 2022 11:42:36 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.014; Fri, 22 Apr 2022
 11:42:36 +0000
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
X-Inumbo-ID: 5099c97b-c231-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650627762;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Y0PMjGop8+FVS5FTxtKmASPWLTlZSPYPyMYXZwy2wBw=;
  b=P/yFY+KRbqiZXRUfZTwzhjLgq2glh0ef6vmJ5TQRjGcrVYlqy7D3Z61m
   H9Q6XqgnGqnJyODChIs/nXwcaY7aKLqQmUho/zEiWMPpmO2WSua3eKLan
   YwkDwUbteYdreclXiOOKBzrCFnpYgktRqasSjJC9VNk6cokXhT4XFZf26
   A=;
X-IronPort-RemoteIP: 104.47.58.172
X-IronPort-MID: 69713643
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:MWF6Rqg2WiKr6+eVkyl5OrpoX161ZREKZh0ujC45NGQN5FlHY01je
 htvX2mHPv2PYDGhfNt+Yd/n/UsO65+GzN81SwRurypnQywb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhX1nX4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YV8kD4flhtonbzJ3SjFBbbZ43JqAcEHq5KR/z2WeG5ft69NHKRhveKc+qqNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuI8ehWhq7ixNNa+2i
 84xQDxjdhnfJTZIPU8aEskWl+a0nHjvNTZfrTp5oIJpsjeKl1Iti9ABNvLrfM3SQsVbl32h/
 CXX4X+hBQwwG8CAnG/tHnWEw7WncTnAcIAYGaC89/VqqEaO3WFVAxoTPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslh0RRdtWVfE74Qely6zI7gLfDW8BJgOtc/Qjvc4yADYsh
 lmAmoqwASQ16eLPD3WA6r2TsDW+fzAPKnMPbjMFSg1D5MT/pIY0jVTESdML/LOJs+AZ0ArYm
 1iixBXSTZ1K5SLX/81XJWz6vg8=
IronPort-HdrOrdr: A9a23:ycmwzqqTz3JmJYNHBRF0J6EaV5t0LNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ku90KnpewK+yXbsibNhcotKLzOWwldAS7sSo7cKogeQVxEWk9Qw6U
 4OSdkYNDSdNzlHZIPBkXGF+rUbsZi6GcKT9IHjJh5WJGkEBZ2IrT0JczpzeXcGJjWucKBJcK
 Z0kfA3wgZIF052Uu2LQl0+G8TTrdzCk5zrJTQcAQQ81QWIhTS0rJbnDhmxxH4lInBy6IZn1V
 KAvx3y562lvf3+4ATbzXXv45Nfn8ak4sdfBfaLltMeJlzX+0SVjcVaKvi/VQIO0aaSAWUR4Z
 /xStAbTp1OAkbqDyWISN3WqlHdOXgVmiTfIBSj8AbeSITCNU4H4ox69MJkm1LimjQdVJsX6t
 M140uJ85VQFh/OhyL7+pzBUAxrjFO9pT44nfcUlGE3a/pUVFb/l/1swKp5KuZIIMvB0vFuLA
 CuNrCo2N9GNVeBK3zJtGhmx9KhGnw1AxedW0AH/siYySJfknx1x1YRgJV3pAZMyLstD51fo+
 jUOKVhk79DCscQcKJmHe8EBc+6EHbETx7AOH+bZV7nCKYEMXTQrIOf2sR+2Mi6PJgTiJcikp
 XIV11V8WY0ZkL1EMWLmIZG9xjcKV/NKwgFCvsukKSRloeMNIYDaxfzOWzGu/HQ0Mk3E4ncR+
 u5Po5QDrvqMXbucLw5qzHDZw==
X-IronPort-AV: E=Sophos;i="5.90,281,1643691600"; 
   d="scan'208";a="69713643"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgL2qmYSMqsV5sSuM8WucIII8RvZOMzqlJwH5PdKxQcStG1nJTyOjY+bWmdF+lae4D1/cXjpha6nl3cooiYYM0aWPN63Ul6rXTeL6YBW0qO24dyw0Z5BjVJYAW4yvvgJSUhulp75UEXEnEBM3bj4W4Fhehy0fo8vydZ+jeKlxK5UVdAE8wp3oGWouBAjGrHfSgDUmkQGvoLzGa1khxJQQNrvEv55bISMZ3FOcRGljZJYuG59tQTa1jEukwFJwB+HgVx4GGeLcbVRZR7tK7fJUERwWwSaH2Mdi8Sl9AmuO/pJLMMe7ELVo22r+L+no99wLJmmVJ21FM1EXHbbi1s0vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0PMjGop8+FVS5FTxtKmASPWLTlZSPYPyMYXZwy2wBw=;
 b=SGEfwEVRb9tmgGT6HCgAwWfmnaP7ukPGwkqnJPjwHXrsXTlyqEs6teJaJ0uGwF9MoIXHGhXdQTlkjDdCCk9bZYZxtP0a1WR6UbcxyP8rrKW5eBc5u/0UOJ0x/qatT2j6GqusP19fHAIfg9MvXeojC5kCRqCUo0biQHyq27sOQw7TXftYdG1phj+0FvMr5lWj35bw5+eiOza5abMPgYoXMkFVEE/9yf3NPbrpNKvCUM7ZN0XxWn00FlXFa/L0eosX+zFnaD8RYL3xzwTE92nUnPeyxHTPbCrK1k9i4+qEbTyqwUQbVUsQwApJtdKaiPK22rnvD+ZPy2o7EfJxizs4+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0PMjGop8+FVS5FTxtKmASPWLTlZSPYPyMYXZwy2wBw=;
 b=jMuzvgSZqOq6seg8ebt2mymB/g/YJZd/VvkurR40AOAB80fO7b2v/F+OrYjHs7vrSqznyiA78/og7Kts1xiU6nxZtbUWnlnRxTCImgWaZOfKIM2HdGtFQ7O8pGLA6lxZgqMwiWGDGmQmDpTxYH7A11pQEVUrNdWjJ8FIPf9YStg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH] VT-d: fix !HVM build
Thread-Topic: [PATCH] VT-d: fix !HVM build
Thread-Index: AQHYVi+clO+iJmB//EeiyYBjieMG6Kz7z7+A
Date: Fri, 22 Apr 2022 11:42:36 +0000
Message-ID: <191336d6-b7e4-551c-61b9-4d36bffee135@citrix.com>
References: <431d4212-07b8-63d5-1a4d-7e8c7a9108ea@suse.com>
In-Reply-To: <431d4212-07b8-63d5-1a4d-7e8c7a9108ea@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 531877b6-47a6-4e3d-1dc8-08da24553271
x-ms-traffictypediagnostic: DM6PR03MB3818:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs:
 <DM6PR03MB3818332F9A748F30A177EF3EBAF79@DM6PR03MB3818.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 FUC4jj6Mn8Xi0U/1a4ViVNpb1z0N6MQwa7pVL1sBNvr1ztNSMkLAAo/R2n/1JupwUZfQWuXXVPHXYBFV3BxOcU/CyhS3MChj4f2wA77p6psaUrtDiYFIz/ES2x227JceLK7DwILUcslxbCUQxysHeozBj4kVmc38wTMAiV+ZKe+VU/dtbZBr1nKphhiRlEAjUj3kZUTTY2aYeeyZ+vED8DKP1E7Jkp9U9O601InAxb/RYtwuZchUrfHkB22tNcGK/HtOfc1vgOPbWZFnf2DONl2hT/Fneb4xGsdAw3afArZTbR5ldlAXAtpUUTZGnrsJxIwx9Ppz3IBNje2izd254VCEKUOqA17ZsYI+OSuqYOs/IXlbLEEuKEbLNwBIGsi+VoQESDzgYwIUNr9qgMXu1OgCYD+swliNM5JedeNc549HRslw8WiyIl1eyZr7DyJdcae0CEfUGmbtg/ynpXD5UGaSRyr1qq4E5qYZFuvIUkOQCOdBCemw/s2AZaIzi9l5l8T0H6JdbYLoeTXO2A6teCFgHz6f8lCG6G1owBKBxaGDX5pol3FvwHgjk90omstCaLKGaF/FOxUmDW9fou8oICcLfdQHMkyMmYj+9cgGejpbSM/AgU1f7em7fvSuS0yTu/IEsnp0pDq3vLWK+c7ANRmX561gzpZAGHw2pYFv4LwBqHoqJz8ZJJJPZMlWqNPlbZlof1vybRDHENWa0o+mxSDviVQrn3IrldzKgRR66eCzkTfxVQLu/cMX/V1sfOibcTJHsjYbQ2tfstqAd0baJA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(2906002)(71200400001)(91956017)(8676002)(2616005)(64756008)(5660300002)(82960400001)(83380400001)(316002)(26005)(508600001)(31696002)(6512007)(6506007)(76116006)(53546011)(186003)(110136005)(86362001)(66476007)(66946007)(38070700005)(66556008)(66446008)(4326008)(122000001)(38100700002)(6486002)(31686004)(4744005)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YmZ6Qko5QVI5ZU82RmQ1Y2cwR2xFUXk3QnR6MHN4OUU5VDUrSFd1OW9KV3ht?=
 =?utf-8?B?UUpDKzduRDhZeW9jcWk2b2xncEx4Y0haaU5LemRTdkhCZ095elRXU2JzWUJJ?=
 =?utf-8?B?ZkRmVDlNTFBNcTc2dWNvaERhb0YrNjQ5cXJ2V05hSGZKQkEwYnF1K3hsVURy?=
 =?utf-8?B?SlNOSnpEMm5oeFk2Nzl2TmNTODJ1ay9MQXpKQXI3UFdJUmtxUStRQkU2Mk1a?=
 =?utf-8?B?ZVpwSFRsQmFWRTM4cDJsa3dDV3YzTVZOS09qcWxVc09xcEtLM2NxV3JTMTVr?=
 =?utf-8?B?SExoTUthSHVTRjVlTkozVmVSaTBicEVQckRpM1ZteFZjdEpNS01pOEpJbkxR?=
 =?utf-8?B?eXVJUW5xSk56ckJpRG4rUk9hMmNjY1llQ2U5SlVJSW9pbjV5RFNxbjk3NDBN?=
 =?utf-8?B?ZFBZYjNXTSs2OW85cFdvTDdSa0FFRUh3bXhHNm1FTWJ4ZTY4WG94aGNsbjBZ?=
 =?utf-8?B?cUZTWW94YitiaWlqbEFCYU8wT1BLa2wzcVBBMFo4aHBsQ3RtZjJzUlBBaEhr?=
 =?utf-8?B?MEkydTFIRHkwY2ZjVlpQNWp1V053VHMvZVBMRGJDYXZLRzFsMElMS09LYk5m?=
 =?utf-8?B?b05jOUVWaVBRa3ZiQUd1SDFSb0FZSmVOM2F1U0Fmc096M1E5QVNNaUtDMnlP?=
 =?utf-8?B?cUxjcm9Jd09wTlcxZytnU1NyYnR2UVVzVGYvZDg1YzZ1QXVhSG1xdDhJZU5D?=
 =?utf-8?B?dXdmVXAzd3BITXlWNFZBL0pvOHczYlVXL0MrYTU3QkZzcFV1OVZZMVdaS0Fw?=
 =?utf-8?B?VUYyU2NTeHBkRU5jMFgwUVhsT2Y5cU91MzFyQ3VpbkZNdnd3QSt0WUxQeWlN?=
 =?utf-8?B?RkJHeFRQU01RT3VXY3pDUDk1QjNyR1NpU2ZGZ1NmTnk4aVFMRVRvdVlPTmtD?=
 =?utf-8?B?MklnRzUxTG8ycFdIb0tGQjRCaDFLc1o4d2VUbDJCSUN1akw3MXFmOGlGbGVj?=
 =?utf-8?B?M3gyVUtVaXAzYkl6VXo3Q2ZjL3NrUzR3eGtxUE1JUTMrTDBjb093SW1wY0M3?=
 =?utf-8?B?QTJRRFdPUnZVNDFuMlNwNkxCclQzdVY4bW4vcXhmYW1EbkZBMkg0VmxyNVBO?=
 =?utf-8?B?aUFUbmhYa21IWkpyc0czMU0xcTY4cnROdjJBa01MS2lsKzRDdkMyMk8xQy9I?=
 =?utf-8?B?YXZYZm5nYzJmaDlKM2RFK1pNTGUrOCtyQTBxY0RVOGVNc085b2ZsTVFOeEJR?=
 =?utf-8?B?SWFHejZKZTB6SnJxRDBmN3pzZ0dVemJodkhIcEx6ODVxZEVtaGVRcXNxNFdx?=
 =?utf-8?B?WkxHTEEyV3pWVWZ0ejdZdlVmWHVrRVRobkwxN2xwY04yb0Q4Z0doRUR0YmFK?=
 =?utf-8?B?NmFuN1pvaUltbTZTMk1NNG9ab2kvWXpmai9ublBwdjl6UVhLMkxWUkN1TnhD?=
 =?utf-8?B?bjdWQ2Yxc0loL3RHV0lSMUhUTzRHM2tseXBDNWVqR3AvS0FGMDczaGlQWCsw?=
 =?utf-8?B?eXFEWkJVbFFTelRZY1ZVSVpOcXp2bmJ5NE9qaDE1ZXlQdnRFOFErays1QVhU?=
 =?utf-8?B?YlpQME4rUUtiM0pZckVlVGNuNk8rOXYwM2ZyTzk5OGMxTzZXTFlPSThWb2RN?=
 =?utf-8?B?SzBHbmZvR1pzRWlEeGl1VFhzU3dDQVMwR0NoR2d2c1FEMjJXSnNOYVhKeEFQ?=
 =?utf-8?B?bngyQXVJeGs5MEdFNXB2QlJnQXJRNjc1SEM2Smg4aU5qUVF3TGg2SGlXZnNW?=
 =?utf-8?B?RU9tdDJPUUNnM1lXY29UZFNXN3FaVEtSeEY3YTF3d0J2dTNEbUFSTW1lMHdi?=
 =?utf-8?B?cnpYNzAveU0yUnQreDk2TkN0Q1NWMnlGMk82SWFONGlXbS9XOUJDeFdMOHhR?=
 =?utf-8?B?OXBvN05qSzcxUnNRK0lFRkJOZHBvL1NHWEFwdmxGd2x3UkVocUc5UW5xeUdE?=
 =?utf-8?B?ZG1nOWxpSTI3RHpndzVjeXY5azR1aERrTThvbmFXcXlOanZUWmE3b0h2dzZZ?=
 =?utf-8?B?cW85UWZ1eFk1OVk2allyaHJ0OUFPaFFSQ09TR1hPUXViM2F5UEdDejU3UHVE?=
 =?utf-8?B?Q1o5VlNtdllqZW9tWGhMblJlWldTcmJtaVpZYjRsZWdDZDE1a0hzLzhWdU9h?=
 =?utf-8?B?blRjaDZoL09mMWVyc1JNVDhkdjN4Mkk3VjNZVzJhY0l0QUd3SVpQQU5VT216?=
 =?utf-8?B?cVBKNU4zZ2RJWngyS3drdTNMcGFOeWhJd1FranNMQzlmZTliUlRFVE9aYzBC?=
 =?utf-8?B?ZzZHRm9QbFVlUkhKN0ZoaHJMUmNHREloZjl6WktLeE9FVTdYQnR4dXhNcjBt?=
 =?utf-8?B?cmxrbEg2M2xuR0pHR3o0R0wrQTFFWmhEQmVYN1RRRHZEczVTM3hCRjYzVjZF?=
 =?utf-8?B?Ym1hdTNzUGxxV1VtbDlpeHlBa3FYOFNkYUFpWjBYbVlqUEV0b3A3dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D451C0B9BF88B45B527D54C76F47E30@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 531877b6-47a6-4e3d-1dc8-08da24553271
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 11:42:36.3128
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HikqW1ap/mN5uwoCFpB6mDfVs8g2IkgjmPvapV8qHg3OvDCFi8DppQfaVSnB7QkZ0ARiU7CikE1qS6qVwWJQ89Fm3KH2lWjeWIfMCW+FnpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3818

T24gMjIvMDQvMjAyMiAxMDo1OCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEVQVCBpcyBvZiBubyBp
bnRlcmVzdCB3aGVuICFIVk0uIFdoaWxlIEknbSBvYnNlcnZpbmcgZ2NjMTEgdG8gZnVsbHkNCj4g
ZWxpbWluYXRlIHRoZSBmdW5jdGlvbiwgb2xkZXIgZ2NjJ3MgRENFIGxvb2tzIHRvIG5vdCBiZSBh
cyBnb29kLiBBaWQgdGhlDQo+IGNvbXBpbGVyIGluIGVsaW1pbmF0aW5nIHRoZSBhY2Nlc3NlcyBv
ZiBvcHRfaGFwX3sybWIsMWdifSwgd2hpY2gNCj4gb3RoZXJ3aXNlIGNhdXNlIHVuZGVmaW5lZCBz
eW1ib2wgZXJyb3JzIHdoZW4gbGlua2luZy4NCg0KSSd2ZSBqdXN0IHJlcHJvZHVjZWQgaXQgb24g
R0NDIDExLCB1c2luZyBDT05GSUdfVUJTQU4gYXMgd2VsbC4NCg0KPg0KPiBXaGlsZSB0aGVyZSBh
ZGp1c3QgdHlwZXMuDQo+DQo+IEZpeGVzOiBjNDc5NDE1NjEwZjAgKCJ4ODYvUDJNOiBwMm0uYyBp
cyBIVk0tb25seSIpDQo+IFJlcG9ydGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+DQoNClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPiwgcHJlZmVyYWJseSB3aXRoDQp0aGUgY29tbWl0IG1lc3NhZ2UgdHdlYWtlZC4NCg==

