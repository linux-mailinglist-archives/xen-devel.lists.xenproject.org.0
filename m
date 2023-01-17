Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F91E66E7A0
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 21:20:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479793.743856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHsQM-0000jm-LP; Tue, 17 Jan 2023 20:19:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479793.743856; Tue, 17 Jan 2023 20:19:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHsQM-0000hr-H2; Tue, 17 Jan 2023 20:19:14 +0000
Received: by outflank-mailman (input) for mailman id 479793;
 Tue, 17 Jan 2023 20:19:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kjsf=5O=citrix.com=prvs=374a1453b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pHsQL-0000hl-Bx
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 20:19:13 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 320ff34c-96a4-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 21:19:10 +0100 (CET)
Received: from mail-dm3nam02lp2046.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Jan 2023 15:19:06 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5103.namprd03.prod.outlook.com (2603:10b6:208:1aa::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 20:19:04 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 20:19:04 +0000
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
X-Inumbo-ID: 320ff34c-96a4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673986750;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=jFAI3Ux6qPtissa7plSCh2AfaIBdW9fgTpRfbLWjBIc=;
  b=bYXHSp7jLDCjNd+06+2zmhIT7USlb8KuIcrzarNsD2f/QbXK92HhiPJ+
   Fe+NqrCYg5C9NS7QMm7HKS1tnxOozd1TwKHs+Sk1rd6fkq5fIi0ybqylb
   ViaVY2MuQ0UuRFzbvQVdPtL/Yfk/FnqS1ERJIVVQ1RYPCiSBq5U6bHEPo
   s=;
X-IronPort-RemoteIP: 104.47.56.46
X-IronPort-MID: 93031451
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2u388KAujNF1fxVW/wriw5YqxClBgxIJ4kV8jS/XYbTApGtxhTYGz
 DcZW22OO/2MN2H9e4sna4Sw9UtQ68TVn4U3QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GpB4QRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw2bt9BGAQ+
 cwiDiEmRwHYreys/rGkY7w57igjBJGD0II3nFhFlWucIdN9BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI++xrvQA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE17SXxnqnBdt6+LuQ9ORD3mS0nkAvMSYfUVufn8irqUyDYocKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRwtJWFRHTb8a2bxQ5eIgAQJG4GICMBFg0M5oG5pJlp1k6RCNF+DKSyk9v5Xynqx
 CyHpzQ/gLNVitMX06K8/hbMhDfESoX1czPZLz7/BgqNhj6Vrqb8D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:4u49Mak1QsUApa6PQYaIFBbSx57pDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-IronPort-AV: E=Sophos;i="5.97,224,1669093200"; 
   d="scan'208";a="93031451"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOTfZzPwLZG5YoWQ2I/SrXPQMVAS2SPALjIs1+cl2im67eOCC8t2+JhDbz6l66LBJGBpUiBBfiLsY/FW2kx985pgrGXHSDyaNftL7r7g8BnCubf6dx19/M29Tj0vwzFAjCBTx95VjL3oHl6PECB3E/BSmS8yLs+vDPLwiiU9R/xzrnxMCoXFjE3RsbN66ZKwUjIZLTrMup6+4VgMYRxxwMPg/oe3IidOr2MHwAbgZZwnl0XHXFxRj0Y/1xkQMCqCJCNYhHbjs/wYbzvN+dgd7Xk4PaZmqxVqIcUQNE7BYXYgQXL40C0nogtEbKC+4vfT8SsvOPfGKFRqks2wdkmfcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jFAI3Ux6qPtissa7plSCh2AfaIBdW9fgTpRfbLWjBIc=;
 b=LN6Wm8Ykc9VcCoif1agvb1/vTQ+rQmkSj3kPIqvz4RYEnY8CQky8J8qEUzMMUO1OIerZMPqczvdsWkNqKjCT1Ql6pXsgTF6NassUvcpKhef5vFQSJe5Wins5KcwI+tGg6xEuZc2ck5ciS6e04uJkWlVKt10UbhutPpX44pABTTTgJ5RPYywwYbMr/bJQgDBhmpWlOaESPiGL524x6ANHbhEknGELgKXcMaqR2s6x12msJCDHhL48HFT8X4wcGvFS6Qi2XbgKOuOVndqsBaMlIOIDcJJFeKOQ3r0y1jVhQ73eQCAXiY1amkJf3bok1dAmg1ITIN+mz3cXHr3fi00UCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFAI3Ux6qPtissa7plSCh2AfaIBdW9fgTpRfbLWjBIc=;
 b=aNywLqWnlZU/jXECy1XVcYzM1YTxvxfS4EbNRMyxTH+OKRkE6uC4i2fhvxwSjDmctOXufddUH3L2x9MCcVb/Cbvo5mYxFQF4CBBcxQJHFU39bp46v1bXOUxLU5gUImofIY/RY4KJnA6EZdOHZ43KmDdyX9vsRrXy9TJwOGX+68Q=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau
 Monne <roger.pau@citrix.com>
Subject: Re: [PATCH 02/10] x86: split populating of struct vcpu_time_info into
 a separate function
Thread-Topic: [PATCH 02/10] x86: split populating of struct vcpu_time_info
 into a separate function
Thread-Index: AQHY4438eIfEX/gnK0SRRrhvSEeRJK6jmsaA
Date: Tue, 17 Jan 2023 20:19:04 +0000
Message-ID: <18016404-c3e3-8b99-569d-b6f786635a2c@citrix.com>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <3ff84ed1-8143-15c2-2b4a-3ae8ef23677c@suse.com>
In-Reply-To: <3ff84ed1-8143-15c2-2b4a-3ae8ef23677c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MN2PR03MB5103:EE_
x-ms-office365-filtering-correlation-id: faddef7b-17be-4e5e-2856-08daf8c8143e
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 erWLa0+TGvPnv+0AwERyshjPmC0oaiELH04AERBoiQajYyGWRqpxw7IaHx74q/NtggtfmuejA88uFn2i5mRYFkEmhAKL/YlDnUMiUWhEMK0V04ciKrEJgCrZewQge5jYnh8G6kDx5a/9NUkrmY6hiUUXVYFsDZvOF9zqBh8tAPOpl3awN6iWg3Lo/eZriMzD4pyyx8PBqib3iYydd1uMdW5VnCOwHRNsXRtfpYekc5L0dIebfErt1vT0566pPQyQ5fjKpJiOP9Fs66IWT+Jwnz/ebdtbYHlMCfkfExt8Ns1gP80CXs1Qyz1y+5vWeRdk4ybOFPOM4g3/nzWQ9etLPM3f4hhhsPu8fh95OL9WP+TbGR4DMOlBsb8y6eIhUzpNPBp+xRiZL4gKBZvXY3khn3J5aaZYOL3O2V9N6SSlxU7sfyOOyRxANlxJrh85DNg19Ox21rRQXzWGz/OOoZlv0Gp9QeFI2xUH5FzlypAYhpGLS4dbweYpl/zFvEuzWT77KkRzURLuHP378TSoyEgyByrEOEsE/H6bdzNv3CsW0ltoe4IPESifoSi0oCUoXZonB/MDMchS7zt/xTchun/5BTXZXl7C4NiKbT+4qMoLk0RY94ttrtZFzqbpliV85HybrZSn0/8fU+J3y5a7/+v33n5NfvfRlSSmef1uO5zWGDFwondWh1obibYtKYG+aDchiGEUpN+lBrD4A+RNUDmxdVEf0PSpatTXJFC9uEQk0PYUUsLG1+RIgE525A6LlV0l5/4CsjED1phNhSWCaG1n8g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(451199015)(31696002)(86362001)(36756003)(26005)(8676002)(6512007)(186003)(76116006)(4326008)(53546011)(91956017)(64756008)(66946007)(66446008)(66556008)(66476007)(41300700001)(2616005)(6506007)(107886003)(478600001)(110136005)(38100700002)(54906003)(316002)(71200400001)(38070700005)(2906002)(6486002)(122000001)(82960400001)(83380400001)(5660300002)(8936002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SFVpUFA5R0t4aGNCTUxreEJ2WDNUcytseThrNVZpeEp5NWd3VjlVSElBRStu?=
 =?utf-8?B?czZsSUFQbzE0MUsyanArL09tS29FNDJHQzFxSUJOYkFtTEFPMFJZQnRWMjZU?=
 =?utf-8?B?a3kxbTRBY05iTlJqc0xXeHR6OERNY1lIU2UzODJCYlhYcUxYdlB1SWUzU21a?=
 =?utf-8?B?SEJxckNNMjhNVU5MMGtUSXczZGhxK0ZIY0wyMktJNW5nSEoxNUlrQnVoeTVW?=
 =?utf-8?B?bWxBS2hsRW9tMUY4OFRSdEJaZ2s0MGJDWDJQMDJqQlFEUUUyV1VGZWtpYzJh?=
 =?utf-8?B?cTdJL090QlcwZGtNcG0rSVpaQU9tS0RNVU9VbXQvdEc3WkhkQUZWNUZ5ZEZZ?=
 =?utf-8?B?ekR0d2Jla285MDM1L2Z5YzY4eGY4L1crODVvYU5EUDhRbXRKdnp1VjZkTUpl?=
 =?utf-8?B?SEdpSkxSQnl4Uk44S1lNOFU0VC9KSzlmQ0RwaW5EL2pmWUpsZnFiNmlpUmN3?=
 =?utf-8?B?VzJUZmdLMzhBVWpXZGpxczZRS0dDTVZVVDVSUzlRazlkLzQrekJnKzZGME1t?=
 =?utf-8?B?QXpnaXpXdHRNSllRSXlXNFVKb1psZDN3eXUvSWdiNm90NFZReTQrbDNIbjZP?=
 =?utf-8?B?QTlsalpWbmt5QXJVeHRGYVMvc3Y4RlpnRFM2cDV4dE9hbDljMVlQc2tHQ3FF?=
 =?utf-8?B?Y3pvNHNOT04vNUVSbHBYSWQ1SkpmYmxpQ3dtdm1SS3ZsRC9SblJYYU9xUGpQ?=
 =?utf-8?B?ZDBKMlZpSXdxWDhld0VTc1NHazQxOHlmRFpzL1JOVDRRV3RudFZxMUlkbEls?=
 =?utf-8?B?RlF2QVJDZHYrdUZzVm1qMHpIT0NSaUxnLzEvYVYyYXk1c0JkL0FkakVyUUtz?=
 =?utf-8?B?QXVndk5ENEd5b1dZdlcwNmN5RGltb1U4SWdBSWVhd1owdUc0U0gvakJrVkRi?=
 =?utf-8?B?a2ZRMGp1dnhMaDRaU3pVQXN3Y3I2UVFiZTVVWXQ4S0ZidUF6WGpXbmFMVTF2?=
 =?utf-8?B?UDQ1TkF4TFJnSGFHcDljRzhOclBxYm1zMm56SlRKaFFOZUt0V0lDcktPL2N3?=
 =?utf-8?B?Qk94eU1jK3hqUUNZR2NwNk4venhCZnRwVUFWTHZlOG05UVByTXZSak4wTmMx?=
 =?utf-8?B?NkN3RFdYVUNkR21CSkM2ZWZFSlFJUVdjdkowSi8rUk5iWDIxY2tyVzdJTG9L?=
 =?utf-8?B?Mml2VHhnVFFQT3g2YTFDc3hqbXRuMy9TVzBKYXpNcEVQMGpGamNhbEltNGp1?=
 =?utf-8?B?b0xUVDZkT0R1UFZYRExLZEJsVEFOTUdSZUp5TkVqVTFYc1NlbnFpZTlPZ2tF?=
 =?utf-8?B?bDlVczZqR1JsbGhKVnpFSC9tbnRmUFdFek85SWJmaTlEWmhwRDV5dVpZb2t2?=
 =?utf-8?B?SHpyZ1pZcXJOWXlGSnFQYWZpbjBQY1JUNWFGQ3ZMWURJL1k4a1pWcTRjdG5Z?=
 =?utf-8?B?ZjFUZkp0d205QUFIeC9NQisyc01ROG9JNFNxU2IraWplWmUvMlBWd2FuZDBI?=
 =?utf-8?B?dFBrRTVyVmxrV0xVY1A1ZEMwRmlNM2lSMzV3Skc1K2dZUjRZc1IyUWtSNmtu?=
 =?utf-8?B?VXdjWC9mMVBvbEluNiswVkdxUUc0Q1IzQ0s0WjYxbXA0WGQ1Q3U3RHYxN0dE?=
 =?utf-8?B?YjBTUitLS1ZUVFRRWWhPNWd3enh6T0paT0Nla2p0NFoyT3lOYkNKekV1UlFm?=
 =?utf-8?B?UVNIWjE0ZmV6bmQ0anplNFV0QStvLzczV1d0MDVKZ09WcUI4WVp1M3gxTkFR?=
 =?utf-8?B?elhna0djamFCa1gybDh2OHJBNm1hV0ZXNXVCaWp4bzQ2ZE05ams0TXNuc2pO?=
 =?utf-8?B?UW9SbTdBR1V3Sjl1Skk0ek0yYW5ybVhmZEt4ZkZYWk5MWHl1ZUJIQXdvRVlq?=
 =?utf-8?B?QklMalVMWlRjZmpGMkVQQ1ROOXowd2xBSXQyWnR3dThEcUpYTm9tMDgyNjhX?=
 =?utf-8?B?QXpJSnh5QmFyVVRHZkdRcXF2N3RlRm1PNzl5N2Z0Ky91QWZIdVhJZmovTXVJ?=
 =?utf-8?B?S2szWkx5M3VTd25DLzNLdnY4NHhTUVdmMFVGKzR1dUEza2xtVTN6Rk5WNGdU?=
 =?utf-8?B?QTliNWY3bzRrYytFN0xxNVRDaUJZNHA3Z2dFNnM2aXN4aVJXWlZLWDVnSmpQ?=
 =?utf-8?B?MFBFTHVJR0tVWk5UdHVSV1YrdWt1d1ZzMnpyMUlqa3d0UzlKYmt1ZExMbWJI?=
 =?utf-8?Q?5xS51MhiHn1VmItueRf+NwlC/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <807745850B08CF49A546B7EED6ADC786@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	i6yJY02tejpM8AMz3hxVZjHrAB7RlaxHJkZO/HSgqAoW5Hq2DdpfjnBZrY4NCyzCHVN5fwJpnCA4i9hKF240Jk8lj0tiFUw6VbrUy7V44VicSXzvou6t4UnzBVj5hLakKGH1yMvWhNhzWTALhvZMvb6PHzpBySDNt7CYCcLhiGKvrCiaC0MvuDfMPHifIr0rbpVlw9lkai42cT/VJJUA49z+HsVZQ0yZB026hBo+76XKfdmdC9quNVqh2DofoxvcS1h5e0HfGRVwC2hokcY//o7riKj7MuqiZcG/rxYiinrozHTmqptGGCNJqefsB7zs3YdDKtb3TOMTjJihkYOeekxz2Nfz7oLXZ4qIUyPv7dIMzpf4UoFrhPd7hEUD+ttlQtnZsiV7jiOufIm+RLc/WBjByXw5sc/Q4IlMZut9V8p9ku0poxXUJfgYcqfPmDnP5rYAjwytlnOhk+cS1ncrBE4qz31APH1KkAY95h7AAnUU8GGbPZ3c7ebUTedBMHmmUo/6URbwIr6yexeBcsYvXRj89AFA1U2W5jWDLJD3FYA+oYN6prnyXgb/ahxFEMt/1ynfupLGU3eHAjnySpQqkUhnkUR0aLBQXTyE+1gstJmRz3MyW840ip+oN6EH1YkmpPpg7IbhyDfEm5BQKuEGQpNkR2RjPKgTlBRjf2r1sv6kMc9wj97Xc3Cl1DP5eR+fEB0K+Yb5QDp68tCb7CFFl5dEVO+BAiSXYOTsr9/bfVBXegk9DKzNZFY2IINWuLJ4j1hLCGibZCUBTvun2zRIlhe4f98e7rCkRa6ChaV+EMf3tQkA6fUd0WUZBR8imUXc
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faddef7b-17be-4e5e-2856-08daf8c8143e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 20:19:04.2799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VxfuonRpoHAl0hNxycSGwz4iTxbAPisAfNnPzGva9dR8xdn0+9lDNmXasWfHa9Lu0ByNTKdRT4mSDV0b2ZzeLFG2xtVSRWhV/8bcqinCwkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5103

T24gMTkvMTAvMjAyMiA4OjM5IGFtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gVGhpcyBpcyB0byBm
YWNpbGl0YXRlIHN1YnNlcXVlbnQgcmUtdXNlIG9mIHRoaXMgY29kZS4NCj4NCj4gV2hpbGUgZG9p
bmcgc28gYWRkIGNvbnN0IGluIGEgbnVtYmVyIG9mIHBsYWNlcywgZXh0ZW5kaW5nIHRvDQo+IGd0
aW1lX3RvX2d0c2MoKSBhbmQgdGhlbiBmb3Igc3ltbWV0cnkgYWxzbyBpdHMgaW52ZXJzZSBmdW5j
dGlvbi4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pg0KDQpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlckBjaXRyaXguY29tPg0K
DQo+IC0tLQ0KPiBJIHdhcyBvbiB0aGUgZWRnZSBvZiBhbHNvIGZvbGRpbmcgdGhlIHZhcmlvdXMg
aXNfaHZtX2RvbWFpbigpIGludG8gYQ0KPiBmdW5jdGlvbiBzY29wZSBib29sZWFuLCBidXQgdGhl
biB3YXNuJ3QgcmVhbGx5IGNlcnRhaW4gdGhhdCB0aGlzDQo+IHdvdWxkbid0IG9wZW4gdXAgdW5k
dWUgc3BlY3VsYXRpb24gb3Bwb3J0dW5pdGllcy4NCg0KSSBjYW4ndCBzZWUgYW55dGhpbmcgaW50
ZXJlc3RpbmcgdW5kZXIgaGVyZSBzcGVjdWxhdGlvbiB3aXNlLsKgDQpDb21tZW50YXJ5IGlubGlu
ZS4NCg0KPg0KPiAtLS0gYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vdGltZS5oDQo+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS90aW1lLmgNCj4gQEAgLTUyLDggKzUyLDggQEAgdWlu
dDY0X3QgY2ZfY2hlY2sgYWNwaV9wbV90aWNrX3RvX25zKHVpbg0KPiAgdWludDY0X3QgdHNjX3Rp
Y2tzMm5zKHVpbnQ2NF90IHRpY2tzKTsNCj4gIA0KPiAgdWludDY0X3QgcHZfc29mdF9yZHRzYyhj
b25zdCBzdHJ1Y3QgdmNwdSAqdiwgY29uc3Qgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpOw0K
PiAtdTY0IGd0aW1lX3RvX2d0c2Moc3RydWN0IGRvbWFpbiAqZCwgdTY0IHRpbWUpOw0KPiAtdTY0
IGd0c2NfdG9fZ3RpbWUoc3RydWN0IGRvbWFpbiAqZCwgdTY0IHRzYyk7DQo+ICt1aW50NjRfdCBn
dGltZV90b19ndHNjKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsIHVpbnQ2NF90IHRpbWUpOw0KPiAr
dWludDY0X3QgZ3RzY190b19ndGltZShjb25zdCBzdHJ1Y3QgZG9tYWluICpkLCB1aW50NjRfdCB0
c2MpOw0KPiAgDQo+ICBpbnQgdHNjX3NldF9pbmZvKHN0cnVjdCBkb21haW4gKmQsIHVpbnQzMl90
IHRzY19tb2RlLCB1aW50NjRfdCBlbGFwc2VkX25zZWMsDQo+ICAgICAgICAgICAgICAgICAgIHVp
bnQzMl90IGd0c2Nfa2h6LCB1aW50MzJfdCBpbmNhcm5hdGlvbik7DQo+IC0tLSBhL3hlbi9hcmNo
L3g4Ni90aW1lLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L3RpbWUuYw0KPiBAQCAtMTM3MywxOCAr
MTM3MywxNCBAQCB1aW50NjRfdCB0c2NfdGlja3MybnModWludDY0X3QgdGlja3MpDQo+ICAgICAg
cmV0dXJuIHNjYWxlX2RlbHRhKHRpY2tzLCAmdC0+dHNjX3NjYWxlKTsNCj4gIH0NCj4gIA0KPiAt
c3RhdGljIHZvaWQgX191cGRhdGVfdmNwdV9zeXN0ZW1fdGltZShzdHJ1Y3QgdmNwdSAqdiwgaW50
IGZvcmNlKQ0KPiArc3RhdGljIHZvaWQgY29sbGVjdF90aW1lX2luZm8oY29uc3Qgc3RydWN0IHZj
cHUgKnYsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdmNwdV90aW1l
X2luZm8gKnUpDQo+ICB7DQo+IC0gICAgY29uc3Qgc3RydWN0IGNwdV90aW1lICp0Ow0KPiAtICAg
IHN0cnVjdCB2Y3B1X3RpbWVfaW5mbyAqdSwgX3UgPSB7fTsNCj4gLSAgICBzdHJ1Y3QgZG9tYWlu
ICpkID0gdi0+ZG9tYWluOw0KPiArICAgIGNvbnN0IHN0cnVjdCBjcHVfdGltZSAqdCA9ICZ0aGlz
X2NwdShjcHVfdGltZSk7DQo+ICsgICAgY29uc3Qgc3RydWN0IGRvbWFpbiAqZCA9IHYtPmRvbWFp
bjsNCj4gICAgICBzX3RpbWVfdCB0c2Nfc3RhbXA7DQo+ICANCj4gLSAgICBpZiAoIHYtPnZjcHVf
aW5mbyA9PSBOVUxMICkNCj4gLSAgICAgICAgcmV0dXJuOw0KPiAtDQo+IC0gICAgdCA9ICZ0aGlz
X2NwdShjcHVfdGltZSk7DQo+IC0gICAgdSA9ICZ2Y3B1X2luZm8odiwgdGltZSk7DQo+ICsgICAg
bWVtc2V0KHUsIDAsIHNpemVvZigqdSkpOw0KPiAgDQo+ICAgICAgaWYgKCBkLT5hcmNoLnZ0c2Mg
KQ0KPiAgICAgIHsNCj4gQEAgLTEzOTIsNyArMTM4OCw3IEBAIHN0YXRpYyB2b2lkIF9fdXBkYXRl
X3ZjcHVfc3lzdGVtX3RpbWUoc3QNCj4gIA0KPiAgICAgICAgICBpZiAoIGlzX2h2bV9kb21haW4o
ZCkgKQ0KPiAgICAgICAgICB7DQo+IC0gICAgICAgICAgICBzdHJ1Y3QgcGxfdGltZSAqcGwgPSB2
LT5kb21haW4tPmFyY2guaHZtLnBsX3RpbWU7DQo+ICsgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qg
cGxfdGltZSAqcGwgPSBkLT5hcmNoLmh2bS5wbF90aW1lOw0KDQpBIFBWIGd1ZXN0IGNvdWxkIGlu
IGluIHByaW5jaXBsZSB1c2UuLi4NCg0KPiAgDQo+ICAgICAgICAgICAgICBzdGltZSArPSBwbC0+
c3RpbWVfb2Zmc2V0ICsgdi0+YXJjaC5odm0uc3RpbWVfb2Zmc2V0Ow0KDQouLi4gdGhpcyBwbC0+
c3RpbWVfb2Zmc2V0IGFzIHRoZSBzZWNvbmQgZGVmZXJlbmNlIG9mIGEgd2hhdGV2ZXIgaGFwcGVu
cw0KdG8gc2l0IHVuZGVyIGQtPmFyY2guaHZtLnBsX3RpbWUgaW4gdGhlIHB2IHVuaW9uLg0KDQpJ
biB0aGUgY3VycmVudCBidWlsZCBvZiBYZW4gSSBoYXZlIHRvIGhhbmQsIHRoYXQncw0KZC0+YXJj
aC5wdi5tYXBjYWNoZS57ZXBvY2gsdGxiZmx1c2hfdGltZXN0YW1wfSwgdGhlIGNvbWJpbmF0aW9u
IG9mIHdoaWNoDQpkb2Vzbid0IHNlZW0gbGlrZSBpdCBjYW4gYmUgc3RlZXJlZCBpbnRvIGJlaW5n
IGEgbGVnYWwgcG9pbnRlciBpbnRvIFhlbi4NCg0KPiAgICAgICAgICAgICAgaWYgKCBzdGltZSA+
PSAwICkNCj4gQEAgLTE0MDMsMjcgKzEzOTksMjcgQEAgc3RhdGljIHZvaWQgX191cGRhdGVfdmNw
dV9zeXN0ZW1fdGltZShzdA0KPiAgICAgICAgICBlbHNlDQo+ICAgICAgICAgICAgICB0c2Nfc3Rh
bXAgPSBndGltZV90b19ndHNjKGQsIHN0aW1lKTsNCj4gIA0KPiAtICAgICAgICBfdS50c2NfdG9f
c3lzdGVtX211bCA9IGQtPmFyY2gudnRzY190b19ucy5tdWxfZnJhYzsNCj4gLSAgICAgICAgX3Uu
dHNjX3NoaWZ0ICAgICAgICAgPSBkLT5hcmNoLnZ0c2NfdG9fbnMuc2hpZnQ7DQo+ICsgICAgICAg
IHUtPnRzY190b19zeXN0ZW1fbXVsID0gZC0+YXJjaC52dHNjX3RvX25zLm11bF9mcmFjOw0KPiAr
ICAgICAgICB1LT50c2Nfc2hpZnQgICAgICAgICA9IGQtPmFyY2gudnRzY190b19ucy5zaGlmdDsN
Cj4gICAgICB9DQo+ICAgICAgZWxzZQ0KPiAgICAgIHsNCj4gICAgICAgICAgaWYgKCBpc19odm1f
ZG9tYWluKGQpICYmIGh2bV90c2Nfc2NhbGluZ19zdXBwb3J0ZWQgKQ0KDQpPbiB0aGUgb3RoZXIg
aGFuZCwgdGhpcyBpcyBpc24ndCBzYWZlLsKgIFRoZXJlJ3Mgbm8gcHJvdGVjdGlvbiBvZiB0aGUg
JiYNCmNhbGN1bGF0aW9uLCBidXQuLi4NCg0KPiAgICAgICAgICB7DQo+ICAgICAgICAgICAgICB0
c2Nfc3RhbXAgICAgICAgICAgICA9IGh2bV9zY2FsZV90c2MoZCwgdC0+c3RhbXAubG9jYWxfdHNj
KTsNCg0KLi4uIHRoaXMgcGF0aCBpcyB0aGUgb25seSBwYXRoIHN1YmplY3QgdG8gc3BlY3VsYXRp
dmUgdHlwZSBjb25mdXNpb24sDQphbmQgYWxsIGl0IGRvZXMgaXMgcmVhZCBkLT5hcmNoLmh2bS50
c2Nfc2NhbGluZ19yYXRpbywgc28gaXMNCmFwcHJvcHJpYXRlbHkgcHJvdGVjdGVkIGluIHRoaXMg
aW5zdGFuY2UuDQoNCkFsc28sIGFsbCBhbiBhdHRhY2tlciBjb3VsZCBkbyBpcyBlbmNvZGUgdGhl
IHNjYWxpbmcgcmF0aW8gYWxvbmdzaWRlDQp0LT5zdGFtcC5sb2NhbF90c2MgKHVucHJlZGljdGFi
bGUpIGluIHRoZSBjYWxjdWxhdGlvbiBmb3IgdGhlIGR1cmF0aW9uDQpvZiB0aGUgc3BlY3VsYXRp
dmUgd2luZG93LCB3aXRoIG5vIHdheSBJIGNhbiBzZWUgdG8gZGVyZWZlcmVuY2UgdGhlIHJlc3Vs
dC4NCg0KDQo+IC0gICAgICAgICAgICBfdS50c2NfdG9fc3lzdGVtX211bCA9IGQtPmFyY2gudnRz
Y190b19ucy5tdWxfZnJhYzsNCj4gLSAgICAgICAgICAgIF91LnRzY19zaGlmdCAgICAgICAgID0g
ZC0+YXJjaC52dHNjX3RvX25zLnNoaWZ0Ow0KPiArICAgICAgICAgICAgdS0+dHNjX3RvX3N5c3Rl
bV9tdWwgPSBkLT5hcmNoLnZ0c2NfdG9fbnMubXVsX2ZyYWM7DQo+ICsgICAgICAgICAgICB1LT50
c2Nfc2hpZnQgICAgICAgICA9IGQtPmFyY2gudnRzY190b19ucy5zaGlmdDsNCj4gICAgICAgICAg
fQ0KPiAgICAgICAgICBlbHNlDQo+ICAgICAgICAgIHsNCj4gICAgICAgICAgICAgIHRzY19zdGFt
cCAgICAgICAgICAgID0gdC0+c3RhbXAubG9jYWxfdHNjOw0KPiAtICAgICAgICAgICAgX3UudHNj
X3RvX3N5c3RlbV9tdWwgPSB0LT50c2Nfc2NhbGUubXVsX2ZyYWM7DQo+IC0gICAgICAgICAgICBf
dS50c2Nfc2hpZnQgICAgICAgICA9IHQtPnRzY19zY2FsZS5zaGlmdDsNCj4gKyAgICAgICAgICAg
IHUtPnRzY190b19zeXN0ZW1fbXVsID0gdC0+dHNjX3NjYWxlLm11bF9mcmFjOw0KPiArICAgICAg
ICAgICAgdS0+dHNjX3NoaWZ0ICAgICAgICAgPSB0LT50c2Nfc2NhbGUuc2hpZnQ7DQo+ICAgICAg
ICAgIH0NCj4gICAgICB9DQo+ICANCj4gLSAgICBfdS50c2NfdGltZXN0YW1wID0gdHNjX3N0YW1w
Ow0KPiAtICAgIF91LnN5c3RlbV90aW1lICAgPSB0LT5zdGFtcC5sb2NhbF9zdGltZTsNCj4gKyAg
ICB1LT50c2NfdGltZXN0YW1wID0gdHNjX3N0YW1wOw0KPiArICAgIHUtPnN5c3RlbV90aW1lICAg
PSB0LT5zdGFtcC5sb2NhbF9zdGltZTsNCj4gIA0KPiAgICAgIC8qDQo+ICAgICAgICogSXQncyBl
eHBlY3RlZCB0aGF0IGRvbWFpbnMgY29wZSB3aXRoIHRoaXMgYml0IGNoYW5naW5nIG9uIGV2ZXJ5
DQo+IEBAIC0xNDMxLDEwICsxNDI3LDIxIEBAIHN0YXRpYyB2b2lkIF9fdXBkYXRlX3ZjcHVfc3lz
dGVtX3RpbWUoc3QNCj4gICAgICAgKiBvciBpZiBpdCBmdXJ0aGVyIHJlcXVpcmVzIG1vbm90b25p
Y2l0eSBjaGVja3Mgd2l0aCBvdGhlciB2Y3B1cy4NCj4gICAgICAgKi8NCj4gICAgICBpZiAoIGNs
b2Nrc291cmNlX2lzX3RzYygpICkNCj4gLSAgICAgICAgX3UuZmxhZ3MgfD0gWEVOX1BWQ0xPQ0tf
VFNDX1NUQUJMRV9CSVQ7DQo+ICsgICAgICAgIHUtPmZsYWdzIHw9IFhFTl9QVkNMT0NLX1RTQ19T
VEFCTEVfQklUOw0KPiAgDQo+ICAgICAgaWYgKCBpc19odm1fZG9tYWluKGQpICkNCj4gLSAgICAg
ICAgX3UudHNjX3RpbWVzdGFtcCArPSB2LT5hcmNoLmh2bS5jYWNoZV90c2Nfb2Zmc2V0Ow0KPiAr
ICAgICAgICB1LT50c2NfdGltZXN0YW1wICs9IHYtPmFyY2guaHZtLmNhY2hlX3RzY19vZmZzZXQ7
DQoNClRoaXMgcGF0aCBpcyBzdWJqZWN0IHRvIHR5cGUgY29uZnVzaW9uIG9uIHYtPmFyY2gue3B2
LGh2bX0sIHdpdGggYSBQVg0KZ3Vlc3QgYWJsZSB0byBlbmNvZGUgdGhlIHZhbHVlIG9mIHYtPmFy
Y2gucHYuY3RybHJlZ1s1XSBpbnRvIHRoZQ0KdGltZXN0YW1wLsKgIEJ1dCBhZ2Fpbiwgbm8gd2F5
IHRvIGRlcmVmZXJlbmNlIHRoZSByZXN1bHQuDQoNCg0KSSByZWFsbHkgZG9uJ3QgdGhpbmsgdGhl
cmUncyBlbm91Z2ggZmxleGliaWxpdHkgaGVyZSBmb3IgZXZlbiBhDQpwZXJmZWN0bHktdGltZWQg
YXR0YWNrZXIgdG8gYWJ1c2UuDQoNCn5BbmRyZXcNCg==

