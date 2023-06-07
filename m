Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D38947262BD
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 16:25:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544828.850867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6u5n-0006sW-7d; Wed, 07 Jun 2023 14:24:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544828.850867; Wed, 07 Jun 2023 14:24:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6u5n-0006q7-4m; Wed, 07 Jun 2023 14:24:55 +0000
Received: by outflank-mailman (input) for mailman id 544828;
 Wed, 07 Jun 2023 14:24:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnVY=B3=citrix.com=prvs=5155b7726=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q6u5m-0006q0-7K
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 14:24:54 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09a9307f-053f-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 16:24:50 +0200 (CEST)
Received: from mail-bn1nam02lp2046.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jun 2023 10:24:33 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CO1PR03MB5729.namprd03.prod.outlook.com (2603:10b6:303:96::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 14:24:26 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6455.028; Wed, 7 Jun 2023
 14:24:26 +0000
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
X-Inumbo-ID: 09a9307f-053f-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686147892;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=3f7Or1ioTFNeqh0OVt28PV9eovUo/IqkGBXo4Kbv5BQ=;
  b=PfNaS2Y1A3SUMRmcOn2jnm7cDckRCE91SZvGi0uoIPbIlZnhDp7yW8k3
   mQrhBzt90gjErlpj6xjQ+RL1IREOdTmyr1v8U8S0yzLQb4MQrJSFXvhiV
   ImrKrrlFQROHDwQnRw0OR5oMbv8iG6vkgp6N0dTdYFC9rZHdh5n1lZo0t
   8=;
X-IronPort-RemoteIP: 104.47.51.46
X-IronPort-MID: 111809537
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6yD20av2U0fo/G+uGBHSs1jN6efnVHBfMUV32f8akzHdYApBsoF/q
 tZmKW+DOf+DY2SjLdp/PNuy9E0O7cDWz4BkSwJrrSo0ESMQ+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Fv0gnRkPaoQ5AGGyCFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwch8Qc0Clqb2PmOziEvt23s4bEcasI9ZK0p1g5Wmx4fcOZ7nmG/+Pz/kBmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osif6xbrI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqiAdJKReDjqZaGhnWC6mItAUBOcGCb/+C4g1GZXel9O
 hQtr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLL5y6JC25CSSROAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9EIMZTSoNTA9A6d+6pog21kjLVow7TPDzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQGEhRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:3nTdta/MWE8TNXcPY+Zuk+DqI+orL9Y04lQ7vn2ZKCY7TiX8ra
 uTdZsgpHrJYVoqOU3I4OrwW5VoIkmzyXcK2/hyAV7KZmCP0gbFEGgF1/qH/9SKIU3DH4BmpN
 5dWpk7JNrsDUVryebWiTPIa+rIGeP3l5xAU92uqUtQcQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AhZoTm2hLEihtjzG6b9ImxiN8xDJuKFLA0Sf2DRC?=
 =?us-ascii?q?BUTgwEK+PEVWoxawjjJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3Aqc2aIw/PGKyYpRI60zs3aL6Qf9ZE7ZqnVRgoqrV?=
 =?us-ascii?q?YosiNKgt2ABWM1A3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,224,1681185600"; 
   d="scan'208";a="111809537"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RR6z1+p8Ce4x5bvEUfTajh/8+DTzWMA9qwbThNFDfiJe0WynFnN1e4e05ZhITrVxhJU2ufcNS29JJ64uA2+oZcZsZC2CjrRiuMRwJwKH/3qH2ZhyDxWhn0dSBmA2tYeDd9PlKSXMnZABiXOzGy6M9k+SBfK4bNSFN6TwsHVbZ8ZFXNwd2O7nxRiD4T0ENir4YeGm3rrTeWbRtjiTA7YAT6sOLVACqwhVnap/gVKtXZZIcIk20FlnQw4zUyxK7h1OMaOaK2VDoLbk2rSNDGn3wco19DTkmfCRXYol+EHjCdn+jJWyh55mU2P5c94nX14Tj8OPM+xUsXvaOncAFxRbTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZsqxCh9gvftqPvjISefLsroxBhpp/2yePn/eDeXSnm0=;
 b=F2MlJ0mQ82d6R1bL750pkAWtVFUk6gi0xW/hxogcgqw+I1plqLS0kG2jHXW32NhPWEec8UsuVuUzogO1P7N8LW4bJLFK131kKifGaqjO57XLx4ET+uqqxTvfrncwW3m7Tt04DyHGSRs5Nupouwi/n5nve9VAAeKMVfYF2EUNCoV6xvI931BdHHRB8pfg7HVRCVY2kH4CXy25qgfqXi5L+zFOL7TksyNO4nvy7rtQI3Hm8Q1NeJ0A9AuBOYtV1wgJjm4+Qmr4xuf6KSBkAcpcC5Jp+IAjWYL8hzEDqM15s9+oo5qQ/Ve2VG8TuBdkSzFJRS3TG0p9/IMqI/vF86VRBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZsqxCh9gvftqPvjISefLsroxBhpp/2yePn/eDeXSnm0=;
 b=t09ramoK1/WjmZTgGqHQ8DtnjiB7gzfpSn3RTOVbeUuc5uRSJmB5Gfz8OppMQQRaiMT0j94Arj/AZeV6KoUHCd53FWACnbm20BJkHC/WkrzK0DCEhoESksa1ifwNbRCiqEsOx9Twa5VA/oDUL/+B/lR+lgH9+WX5NObYJADkwW8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 7 Jun 2023 16:24:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/hvm: print valid CR4 bits in case of error
Message-ID: <ZICTE9o0gdlq+ew0@Air-de-Roger>
References: <20230607134638.53070-1-roger.pau@citrix.com>
 <3da62adc-b307-6505-f333-a7b211869a15@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3da62adc-b307-6505-f333-a7b211869a15@suse.com>
X-ClientProxiedBy: LO2P265CA0144.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::36) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CO1PR03MB5729:EE_
X-MS-Office365-Filtering-Correlation-Id: dcb103ac-ec0f-41d5-92a8-08db6762e57c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iop+xfSLTj0cfns+etzhVRmrbJIjnM9Uj2YevGuODkNwWYoCVfQhggZKdkUnkMxpEY0Q5smQpJDiEEcP0zRwk8SCwTgG7U/0MyqqrqdI0hz20tjv5yWcuftcTVkVN5/Aqg7r15eVjLKD04YbA17YS4nNGqlUrNcrGmSI7iWUYnx7ph4pz6UTFe7fArK94TKLV6u1ilkC/uTwN1l1Qwr82M59W1y/OR9y9MrQfH0R1UfqR6FrKP3tB2Cp/+6E23g/fQ5cbqodag4k6mt/LZyd4UotwEsD4tKtFkg1YR+ST6lkClqCwLOMnfnhtZVQDq2UFU3bTkkBMbvCGjEJlyFWFZeETAtFerckcKnJO5RqMwMe1i8c2jGmpKgJHXd+9zD4RehcxxqBNlPbdAh9jDaFiRg8MsPm9jH6MsElO34Y9Udthz1+0U+OKe6nAm5odv/6j7rDH5OCpU/501xQzut3Kew/5L9fsvXEs7BKmpPHqhmz0XifAnxGlkIgLcNrijzWxq1oUUB5CJunJ7OGcJKZP+3n7SLdrkLL5U2Rel4NABqqrhQ6vKkpk8hzTP9e3f8PtkLb35a+vbp5oOy4xR2urcTjkLBjBVc9/3KAf/dIopA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(451199021)(478600001)(38100700002)(85182001)(82960400001)(66946007)(4326008)(6916009)(66476007)(54906003)(86362001)(8676002)(8936002)(5660300002)(2906002)(316002)(41300700001)(83380400001)(66556008)(6506007)(26005)(6512007)(53546011)(9686003)(33716001)(186003)(6486002)(6666004)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGxhd2MwdHFOMkpTVWh3WCtYdytVNUpMWXZJRktnN3BjVTBwaHkwVEdzaDgr?=
 =?utf-8?B?a25qUGJLWGFRaWdKbTVDL1BiVVdjbUNLUDh5Nkg2UVNneWNmVENoWjRWYzR2?=
 =?utf-8?B?Rkh1ODNrQVE0SlpNN2FieGV3WW8vVktXdXRocGdEWGhGZ05KSkxPaGNlckdF?=
 =?utf-8?B?cFZYSkRkM1luL1FHVGFrY1lZMEQydkFZc0JxQTJDY0Ezc2drM3J5cWg1ZlRt?=
 =?utf-8?B?UWl3dGt5TG1hMDZvVWxHYWdIenpvTkRjTHk5MlBBYmV0WGZyem1KTHhUTTFh?=
 =?utf-8?B?UEUyNGlFc2hQWFNtMG84cXVERjBuWHl4cm16M2NFSHgzLzh4MzBDOVRwc2ZT?=
 =?utf-8?B?K0NoSkE4elp6azFtRWorM0VwYURyOWk3eThNZ1Z5OVh1VG40cW9NbDFGQjlL?=
 =?utf-8?B?R1NTcGsyUktuRXNIWWt0WjBvYVE5ZU01aU5HbmQwNW1jQ3NuTmVHSVlOZmdK?=
 =?utf-8?B?dFpWcUtGMU1SSkJNRmtwOGpsdjl3QmovUFpKSm5GcUNEVit5Sit0Rks1ZElz?=
 =?utf-8?B?SjZ4a1RzdHFvbDF5d2wzMER2akUyaTFsUCt0RnV1NmtLQlRVaG1pSCtnK2wv?=
 =?utf-8?B?cHBDcXdYVnhiSjIwNER2M2tPSENPQW12cUN6MjFXK3JtbUpGTEY5ZHMxTjdB?=
 =?utf-8?B?ZkcwSFAwMzBhZEIrNmd1Y1JzWHpWM25uRnFZbmQwNDh1VTEySHVlM1BScGw4?=
 =?utf-8?B?RWZKTllkYkM1b2x5a21VTmZZc1p5L1Bvd1hISzVqZDZqOWpoNTRZalo1bVho?=
 =?utf-8?B?clg2cW5ONU1DblNva3R6TmxWdnlOK25MWjBOMGQ0Y0pTaENQY3lpME02eVE5?=
 =?utf-8?B?d0xrZEM2RElrcEFRZXF4VTBPajlseTdpb0pHeTdSRFVQSU8zRDlpTUkzMEQ1?=
 =?utf-8?B?Y3lvU1ErbVVkcGNjc1d6aVl3MkRHb1lhU2xCU2NPVjBQOE90VlJDL0RXc2NX?=
 =?utf-8?B?Qjl3MC9XWE9XWjFsZzV5Y2hLUG9zVVFrNE1XOE1MV3l2ekROcG1SeUwwYjFL?=
 =?utf-8?B?aG11YVIrc05RMlhGMDl1ZTFmOWV4dFRqazVVcW9DSExVZEtqaDdJalNuK1Uz?=
 =?utf-8?B?VWRqQU5mbGY3azNJVWNjZS9XZjByN2IxdlVaeEtRSXdCcGNUckpsbjg5Y0RJ?=
 =?utf-8?B?eGxMdTd3dVlYRnR2eEpCMFVTUXhXTlFyaU1jTW1sNG01SXdWcDV0bEFqc3p5?=
 =?utf-8?B?cmxBVTEvTm5LSWw2VlNjdi9iWVh4SExDRHBqeWV1dkszeHhNMUVXSFJyQXg2?=
 =?utf-8?B?ZjdoeXBaNC9RbGlkN3JRSms1UUd3eTVlYTdMVnNsNmhkMGJzbDRndUlGaDdv?=
 =?utf-8?B?Nmh6R3ZHQzdudDVNVlBSdzBoaktTcGNMN0xUN0hEWm1FNkJpR3lTNkFuL0pn?=
 =?utf-8?B?TU12Sy83OGxOeGpDWFpsN3V1b1lwbDFKNlRLMFJ2dVBSeC9hdXNYWWFFWXNj?=
 =?utf-8?B?OTRNRXpMcGhRWTIzT2FEL3phTGViUENsWUFUYTZkbXJVQlhBRlQzaHZ5RW1u?=
 =?utf-8?B?bGNtdEZVSmFwV0pkV2E0U09TbDdCbVowN1Y3WGx0U3FaVDlnall0WFJkOWkw?=
 =?utf-8?B?aXBoSm1EcnYvS1VEWjdWM1ZKM1FERkE1VTNRRjlCdmlDbTRnRzRadXdvV2to?=
 =?utf-8?B?RDZET0x6YmlQdHRDOCtwYURCWDIwSzRZdHVwN0Y4Q0ZPRVNzdFAwa2xRSVA3?=
 =?utf-8?B?Yndmd1hNaTdNWjBUa2V2TnVmNjJ2VXpmRjZEUVZUS3JRYWFNOE8razE1aFI1?=
 =?utf-8?B?NWF4QmZ4L0NHYWMxZFpkVWdzVnMrcm1MSHY1Tm5VN3dZaFNOeWZZMldvYSsw?=
 =?utf-8?B?aTRjQm1ZbXJXWFBQOVhJVis0SG5oaVJ2MU9UR2Jka3hrNkVKbW5KMlFSUlBo?=
 =?utf-8?B?blBzTUc1VzA0ZmhpN1JJNFR0YVhxdVh1TnYrVWZwa0ozNVkvSStxWDE1U1A1?=
 =?utf-8?B?M2hFTzIzTkZ4ai9DS01sQ0N6eXdGcGV5bEZKNTFoYzV2dnVEVGVEUW1pUXpQ?=
 =?utf-8?B?VE5aK2FDYmpTNUdiVEdWMVl3WUx6Vk9xMlRVWmRIbXhtbnpab1pZNGJsb2M0?=
 =?utf-8?B?RGhJODFUSngvSGtHaTZwcEhzU0dGNE15UURrdm9ncGVXRWZzb3h5Q0M5MTNE?=
 =?utf-8?B?SUhFTVRFQXNoQlZYRXlOZ3VsMkd1NU05ZVZaRGV1KzRpbHJYck91S2lMS1ha?=
 =?utf-8?B?dlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YDlzWSqeaBKuIM5AiPEvcPklgeF1+g7WTbmux9nJQSmQ/6hT2x3a57klihpnLvwWY0Pj0YLrXdjrzLERhnVyxERLnxStO2HOL3Z3MrKqlgS++E+NsjHjIOJINyzX3NrBcGXhDFFoKuSYA1NaejKeEUlEc9p1dMwF2eZAXtG8NHExoNoTaYNVwAnLQQUeYxqKgiSRFc1/Qat8ClGDj3o0b9lMuC3tYRiZDNA/EHM/rfnhBzky7cgOL64ZueZx4jEvbCLPb5gFJ3OCLr+rmRXJkI+v9hV6/dTSAcI9OKmuDJkgGbHGrMSXoGc60yOVh2d3ceUGgbB6wZG57cYRPYWvFR4QceE1mvffmrn0VtxtJoBJ+cQXDh+HDWXvJDMgTHq1c7J7vc8HH3+avCCoitSmGOoEd2yY74wwzaZB1qcoCkQBcyib7tYHUrR3ZPSvedIcL7E3RDvf+PUnc3P2v2Yn8jE2L5Rja1qiotVbZA6n5aFEy28awa4bhNMyKgimBf5hqyNjoA1l7IwcSI81fZKoHZqPcafk/b2JUcmyjIUboBDESq4zUFf5bz9rqbww7/n43Ed0XNJ6rcssgoxuYuxm76dsNSEoWHhYy917GlBlq7WO/mzeoxe0INrKqeB1wTKKlZSwWPpB3jF5xDuMEgRuWY3KvQaW7E6ipML1uKDX1pT/LIoNortXHBpKGvRh5oonSBaFaK4J6/yCqtzkAGkSxzTMMFYt4WqLQX2zYvjlkxhqYlDCZV3HcLoorRKf9eAF8XvNWTew6kORX1x7NlsYJ05gv2ApnnunTfBhq50sSoRHFMPjZv48Cn5d1iL0+/YV
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb103ac-ec0f-41d5-92a8-08db6762e57c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 14:24:26.0445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ftzr0Gvh6dB93jj+5kifFocIijffIioSB1k0lUJzAOSG5c0Sb5+h1sNlIk3FxNmtLmNmypaxJ+HjKMxTo3o0EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5729

On Wed, Jun 07, 2023 at 04:00:14PM +0200, Jan Beulich wrote:
> On 07.06.2023 15:46, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/hvm/domain.c
> > +++ b/xen/arch/x86/hvm/domain.c
> > @@ -266,8 +266,8 @@ int arch_set_info_hvm_guest(struct vcpu *v, const vcpu_hvm_context_t *ctx)
> >  
> >      if ( v->arch.hvm.guest_cr[4] & ~hvm_cr4_guest_valid_bits(d) )
> >      {
> > -        gprintk(XENLOG_ERR, "Bad CR4 value: %#016lx\n",
> > -                v->arch.hvm.guest_cr[4]);
> > +        gprintk(XENLOG_ERR, "Bad CR4 value: %#016lx (valid: %016lx)\n",
> > +                v->arch.hvm.guest_cr[4], hvm_cr4_guest_valid_bits(d));
> >          return -EINVAL;
> >      }
> >  
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -1018,8 +1018,8 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
> >  
> >      if ( ctxt.cr4 & ~hvm_cr4_guest_valid_bits(d) )
> >      {
> > -        printk(XENLOG_G_ERR "HVM%d restore: bad CR4 %#" PRIx64 "\n",
> > -               d->domain_id, ctxt.cr4);
> > +        printk(XENLOG_G_ERR "HVM%d restore: bad CR4 %#016lx (valid: %016lx)\n",
> 
> I'm not convinced printing a lot of leading zeros is really useful here.
> However, if you switch to that model, then all uses of the # modifier
> need to go away (in the earlier instance it would be nice if you also
> fixed the pre-existing issue then).

Hm, I've got those messed up.  What would you be your preference then?
(%#lx?)  I would be happy with that also.

Thanks, Roger.

