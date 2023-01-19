Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D266740C0
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 19:20:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481254.746017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIZVm-0004MN-Vh; Thu, 19 Jan 2023 18:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481254.746017; Thu, 19 Jan 2023 18:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIZVm-0004Kg-SC; Thu, 19 Jan 2023 18:19:42 +0000
Received: by outflank-mailman (input) for mailman id 481254;
 Thu, 19 Jan 2023 18:19:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YmS1=5Q=citrix.com=prvs=376161a5e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pIZVl-0004Ka-Fr
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 18:19:41 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4a74c3a-9825-11ed-b8d1-410ff93cb8f0;
 Thu, 19 Jan 2023 19:19:38 +0100 (CET)
Received: from mail-bn1nam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 13:19:30 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5229.namprd03.prod.outlook.com (2603:10b6:208:1e9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 18:19:26 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 18:19:26 +0000
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
X-Inumbo-ID: d4a74c3a-9825-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674152378;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=fQiIbHhHYgHKroBtPkv1gPMXRwxgEH8iH06KA3iq9zg=;
  b=PrlPPBcINunNBVGUMOSUo8OneLYo7Kik4mRT8gkurNLrot2zWe8KRg0P
   werkj6xlVuV1r+gt6vhYmS31ByW2Vhlu0yih33ymAbUvCnttv/8047Bgn
   3d1GQ7Mcn7ZUsMldhN8sijXXEBLV0T18A20mY7yjGwV/HQGiE7PP0RB/j
   U=;
X-IronPort-RemoteIP: 104.47.51.44
X-IronPort-MID: 92847838
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:BG8T6qACDeXt+BVW/x/iw5YqxClBgxIJ4kV8jS/XYbTApD4mgjECy
 TYeCDvSb6rca2ugfY1xOdmy8UwCv5/VydBkQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GpB7wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw5MxxLk5yp
 fIhDzVObgmlu8Xoxu3nVbw57igjBJGD0II3nFhFlWucJ9B/BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI/OxrvwA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE17WfwXyrA9J6+LuQ9adD2H2hhTAvMUNLCwe/kfyfrWGYcocKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRwtJWFRHTb8a2bxRuuOC09PWIEIygeQmM4D8LLpYgyilfFSI9lGavt1NntQ2msn
 3aNsTQ0gKgVgYgTzaKn8FvbgjWq4J/UUgoy4QaRVWWghu9kWLOYi0WTwQCzxZ59wEyxFDFtY
 FBsdxCi0d0z
IronPort-HdrOrdr: A9a23:o3f6M6HQg1HG2J9gpLqE18eALOsnbusQ8zAXPo5KOGVom62j5r
 iTdZEgvyMc5wxhPU3I9erwWpVoBEmslqKdgrNxAV7BZniDhILAFugLhrcKgQeBJ8SUzJ876U
 4PSdkZNDQyNzRHZATBjTVQ3+xO/DBPys6Vuds=
X-IronPort-AV: E=Sophos;i="5.97,229,1669093200"; 
   d="scan'208";a="92847838"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WEYbimqIXA2zceufJCtM0u5YMvFUCCHgyYbGdjv+LfTdRwv0Fo7v+XI7pTgL8LGvrFvGu5SbcB/qYy6hBtUjF6/uksWhVXBIBJLdknCVSRK+K3GTpMLqoDGIXpq+ocYdjsHoPn/LNmxlj1GSdDWb+O8a5Kqib2URbGYlVfxO1Wq2N42lleETGxB21ggdZhzfW8M6TGCI76lWKyrwNi8qufjrUJdiA3A5NiEiZxrMHgSWS/gdrU8zbAUH4kpUEM9lqws9FsOfC8kgrx9ZY/A8zjoXvRps898kylkAuqSXWD7LT1srqw9r6+eHYncjCPou0Qgj3SckDf2VYmX6zyRQLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQiIbHhHYgHKroBtPkv1gPMXRwxgEH8iH06KA3iq9zg=;
 b=jCk7+LwoufbJaj2bpehfX5X9ZdYvmX7lDuOYOOFnrGwfasZFyvk+hti7x4SI1JA/DrgoYS459vFGdf/9vN1A05L51sggPigMX7kt/2QK/wCEs8BEwOfg+401kTL3i0mkmyVWOcFPubfGgGEQYD4/acYL+BxLBhD31iZq9/gvKX77ybjau4TMTPocMNsfyIDYMCgtLGePI2lpw0EjsxadTQ+GSjdB8uZhAoOcLTtbKssf2gQ2BOBCBmzXfcIPuAda8oFA4C2OsQDaHr1kKKVRyAsFQv4iO4JtuymNqeGqY/X1th4sT0xqudc+rZ2bmIoBhfrBomd67+POee4maZDFsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQiIbHhHYgHKroBtPkv1gPMXRwxgEH8iH06KA3iq9zg=;
 b=P6g7QxOUCfn2DamuHxijiCTz2NUDkr/D6Msc5oak8HbgWcG9nD5L9WB1ItWvLFCUQAyyQK8Cqt2TXwogfYE1iTJx7OZX1m9I53Paqq5ywkhe14VpHk+BmRVHF9uimVG2fOTTPucir+IsQDbOd90hWnwGUvkLpaC2e+M2FISvZmw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH 1/2] x86/shadow: fix PAE check for top-level table
 unshadowing
Thread-Topic: [PATCH 1/2] x86/shadow: fix PAE check for top-level table
 unshadowing
Thread-Index: AQHZLAik+GLprcTCdkai++VQyfbToq6mDQ2A
Date: Thu, 19 Jan 2023 18:19:26 +0000
Message-ID: <266eb5cf-b2ad-051b-0474-96bf6e2ca7e0@citrix.com>
References: <9e79449a-fd12-f497-695b-79a50cc913c7@suse.com>
 <bf03f851-2fb4-3de1-7d72-b0ac15b2d488@suse.com>
In-Reply-To: <bf03f851-2fb4-3de1-7d72-b0ac15b2d488@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MN2PR03MB5229:EE_
x-ms-office365-filtering-correlation-id: 91efdf0d-3893-4419-8a2a-08dafa49b2a8
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 1IkuczzbLSuaDtTHJL+y7YJ4xL1EqGXIQ2Zvu1cD7b+dRi5qsiLseQhetzp6gs21sxglIfL1YG/F2jVPKdh7z1Lf5CI4LaWBklxgiRJeoLSEV2i/Kczetl4/QFCxPXOnRKhjSuBZX8XXogOYNsz3YLRahg9YWpKZWsaYxM9HAClYIX6+6EDUuXrqtxADruNA0FWSkYH9rDQKR6U14HZWA0/Ah1M+OrsuBVLcqdZ42NJfqx/HeYFSeM2K5l0BJT2mrXPUe/6f+vJpbtp2kJAZS42XnoOCA/ax5fCikP705AyN4FpK9atYwE8cpMFH0IR8NM0cUISlqc1m5M276mub4Zkh4wEFYMz6NZsdaVTgKU2x5TRRl2qguTITduz11mgNxAP1mygbc1WMjS7CLAcI2PaaSr9HQcaDTuPzB/6UxFjB5OHhnkjOGDvOoVzN4VUIV2mqn9LA5L2Rkucrv0CrJVhedDDpgeB+uxgZUT9DL6cmiA1SoTqBoBMUnMGLtQGL1Pah+u30+9cfBp80pSz0RhuaK8HBDok8EeENYfUjKAQywyj8pmUHSk8MY/JV+xLducAX5wZmPH08zPyS3aGOAF7xQqZh07QRTGJMOX1/vvFea+lUmeAYI948sI34JN1RK2B+rAaY0ZKOq+iqw5AYb9FTA1tsV9Hm+eXIkiVZPR0TWmY8WEfJ/yNoT9TDsxMgJBC+OORU9VIF4df4BTY5+skSBv90Xk32ewSTmYWjJf4qTSHe2UgYowj8sqmhsKQPyAHDO/ci0YvqEgLNqvG3tw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(396003)(376002)(366004)(451199015)(31686004)(36756003)(107886003)(54906003)(6506007)(186003)(110136005)(53546011)(316002)(31696002)(2906002)(6512007)(64756008)(66446008)(66556008)(66946007)(82960400001)(66476007)(2616005)(41300700001)(38100700002)(122000001)(38070700005)(26005)(6486002)(71200400001)(478600001)(8936002)(91956017)(8676002)(4326008)(76116006)(5660300002)(4744005)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VkE5RU1tRnNUVXd0ekZFbXI1bFd6R3hVWWF6dmQ0Nm15L2dBeEdoUjFXc3ht?=
 =?utf-8?B?elFYOTN5aFF2aHRWT2J6VkltQU9UNFNPdE1pWk9yU1BKMDdKV1RSb2xYZHgx?=
 =?utf-8?B?UmxMNXJLbnA5VFE3NDlLQUV6SXNyTU9vdHJGaGxNME01cGlxVzZYdFI3VVZP?=
 =?utf-8?B?akJmWHZtc1FnMzB4VDdSS3NBRnp1a3lUS3g2RXBIVzhDVnI1NmNJanRlUDdx?=
 =?utf-8?B?T1htd3ljM2RQbGQ4NFdYUCsyRFZUNWs4TXhIY0lhVVAzRU5XTCs0eXA1NGQ3?=
 =?utf-8?B?RFFnWE5YTytLS1NaRlE3TlRrMTVnaEtVWVZBdmZqM3QzOXZzSEdaaFlCaTg3?=
 =?utf-8?B?RVVYa0IrUFNaYUJQOHpIRDYzY2RpUzJLOU04dWQyTm1iN1RaR0R5RWpZeHZU?=
 =?utf-8?B?RC9QZUVNN1Ewd0ZBWXFEQVFwaXVlZjRxTTVtMGJHK29aZm96Q284WSs2MS84?=
 =?utf-8?B?UThkRFBBdjZEcHFSNE8wajlBNmpYVEwyckllZmRGTGFQWU4zUWorZEE0eVZB?=
 =?utf-8?B?bUI5NjNGbklOM3VPSDRHZ1FFYW52blFkUmZPTEh4SFIwRkhQY2U4VHpZc1NZ?=
 =?utf-8?B?MW1HTWRBUnRIUkNrZlJRTGRIOFkwTkoySC9XKzRkekNSUTd5UmVaeStQSE1U?=
 =?utf-8?B?VHVsZXdzajBNRi9PQXhuMEpxeDZmUGVqcSsrK0dBKzFvV0NSbTltVG9ScWNH?=
 =?utf-8?B?VklhSlpjbHBHVFVlTWt2dFJlbENPaCs5YUtnOFlNNXN2NFJTZnpSUHgySklC?=
 =?utf-8?B?emJsdVhrYndkeGZQSXFQRStVa3NjNjcvMVpuVVl0bmc3anVPeTB5L3lkdVJv?=
 =?utf-8?B?TFRzb1dnNFlKTnNkMEZhbWQ1WHNscnpJKzVBQ0FrYWRVQ0kzWlh0aDlCVFdG?=
 =?utf-8?B?UXByd3dKa1VPY0NOZ1FBbGJJYTRZK3E0Yk1aTTdYa1lieEc5ck55QjNKRnlj?=
 =?utf-8?B?alBMbGJEREJSN3RTNTFZakdUWkQ2ZWxjQUdXLzBoR0ZOakRYbzdhTVdRT2xw?=
 =?utf-8?B?bEdZZkFaaWVvNW9CZEdrZFB6ekJkVUY0MGViM0tYeTBDYW1kVVJxbmRUMXdO?=
 =?utf-8?B?WGR5UEZQMnVoRzVvRitFZkpEcDIxdGtDMHlwSE9EUUFlSEl0cnB2R0E0bHBJ?=
 =?utf-8?B?VnZIUWFCMzdVSDcvSEVVcUhqMCszcWF2ZWRLWU02eDBKTnRxeXhsQzBvY09R?=
 =?utf-8?B?bkxpaWJONUMwWU9HVlFndFpDZERaNi9BNzFVdVlMKzFPVkY4anMyRC9TODZN?=
 =?utf-8?B?djJLWkpaNFZxWmdWSmZKRXBFKzNtSVZZRGNhaTAwU0pSek44OTdEREt1OXlI?=
 =?utf-8?B?V0lWZVkySUhhcExmZldTbTY4cERDYWx6MVNvRGhBL2RRd09pL21xQlhqMDNz?=
 =?utf-8?B?cDF6R2lVTE10SUkyaVJZcnR0YzJJOWpQOFpBZitBWW5TWFMyalAwVkZocFFU?=
 =?utf-8?B?NXFyNEdJNnRkRURUUzVoQXpJRmpsVkRsRm5Mb0FjaHBZUkZHY0lwWFlyVGxF?=
 =?utf-8?B?R2ppOTVrNnQzNnByVmFyanZ2VFdLa05QQ2FnTnl1emVTc0xpdjFkenFReGk3?=
 =?utf-8?B?QmxWOGtoZXQwOXEyNUlxNWpGZFJXdy9kMUF0Q2FmZ0cwSlhxL3FYN08vYVMy?=
 =?utf-8?B?MFNkaVhkOWo3VStaVjRiMUVSK2Y3MWNJL1NzNjNmcncvVlFXaUVoVEplTXZ0?=
 =?utf-8?B?aDdQaUhpZDVVdXdkTHUwY2VzMGwzNWRxWmpraDd5bkVEUjQzbFNHWlh4eU1K?=
 =?utf-8?B?NmNybmJUYUFWRzNpQmxJY3hRQnh6NnJFdFh3UUxwMGhKekZrcDRBSXJKV2Qr?=
 =?utf-8?B?aUNVN2NhMzM3bVVWZHI5SEduR2VGNitjbXJWclNzaW11MlpIdzU0VXEyc0JK?=
 =?utf-8?B?UHdVZENvTGFmMTRSM2pDcEZqa3FuemF6Rks1RGZKZUk4OU16V1dhMzRlREd0?=
 =?utf-8?B?REtMQ3NSS3gwcW51TCtSN1FHUXVZOTRLWGVuSURkRzVCZ09rRGUyU1dFbDBC?=
 =?utf-8?B?SlltdWdKRmdtdHZaWjRJUFdHKzVHTEhCTmdHMlJXd2VIQUJsbW5PQUdjZmlV?=
 =?utf-8?B?OU9ZK1hYQlM1QzZWYjhiTDFGTGpGQmpUUitHY2dBRUhCZHc4NVhLV1JkcXov?=
 =?utf-8?Q?jd2IjF6h2E1cBCDueJdyOPxum?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB4DCB557B7FA342A232FEE6D8072C00@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ki0u/m6cf1mdMLgSoWHilynR33ohF45XzRL2EICBfYVBEsTOrlKZfooWt2TLYTI59Bl1JN6PG8/77I0r5H4UZRgLBbKum97OwrHlhntiuyvFhqwa7BxbI0uh7Whl0pUo3ukHQicxYWz6cEwFtzv+kT0K1kOARpo78WQ/stkEM7Moo7XbxBH1iyTQvhNB5MXETA4yodl4AC3Wq6CaiDux5tm+AEpINhGyGI3F7AAqcd78p9RDCiVUTtNZQ4bU8EzTOLZVEoDPm4WDukVl348T2m+FG3tN1m4lj9rNy2X06jZCHcsIZcBO1aFwtug5tZ5gd2lhAzQubJHBMY+7cTf/W4R17QvRkV+ol6fRVOcb5r3Lx7CYi/hP25QmtJg99DkOG4JdM8Vi7/yCWu0HyxHFtB9CC8fGtvDm7vKIOkXFPno+Nsta1aJT84a+nfK+6tZyczbb32tkniLHtrEE5Ry1EpPYi7kGJlmTnQ4CJJ9pOBfnPbj6zxxNx8xDFbGvXRGEy3IW1wJ49JX+WGmoUzMKT2tzhxMq2fq6uU/41VoIsYOt3X8BYsCrFZPtRauCY4wh8DwN8a1ecPR7j0mKwqbI+hLkR86MDzqpY84H4RUje3CJRhTNcLbECSynuaq9pfUU1xxkTYsdUbZfXNcSNy5wmW1T6SlrI2gXN67j3qhBQq1CFI5J6CdGdaEdqeUAcNUMlB4LqOC+GO5BPdVmybnIwjffvbTeC5hvMXTTvngiBxwNv1h0C0gd83rnVfVnutQK12G2VD2b1TkUVEa+keFT5G3g23YLBaqwKPibia6D2miW4zkQtFAp3D0Ixkq7BoRP
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91efdf0d-3893-4419-8a2a-08dafa49b2a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 18:19:26.2824
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 51CsrXzCFRyolBHOh1UDuaa6INRxKRr4yNkbomfrCttKJfbjFLV8BzWaGla9FXbNb8GtcLZpe8e6lFg98s/Tk0L8DQylDd0qLGsM6Fsvdo8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5229

T24gMTkvMDEvMjAyMyAxOjE5IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gQ2xlYXJseSB3aXRo
aW4gdGhlIGZvcl9lYWNoX3ZjcHUoKSB0aGUgdkNQVSBvZiB0aGlzIGxvb3AgaXMgbWVhbnQsIG5v
dA0KPiB0aGUgKGxvb3AgaW52YXJpYW50KSBvbmUgdGhlIGZhdWx0IG9jY3VycmVkIG9uLg0KPg0K
PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNCldvdyB0
aGF0J3MgYmVlbiBicm9rZW4gZm9yIHRoZSBlbnRpcmUgbGlmZXRpbWUgb2YgdGhlIHBhZ2V0YWJs
ZV9keWluZyBvcA0KMCAzZDVlNmEzZmYzOCBmcm9tIDIwMTAsIGJ1dCBpdCBzdGlsbCBkZXNlcnZl
cyBhIGZpeGVzIHRhZy4NCg0KUHJlZmVyYWJseSB3aXRoIHRoYXQsIFJldmlld2VkLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KDQo+IC0tLQ0KPiBRdWl0bGUg
bGlrZWx5IHRoaXMgbWlzdGFrZSB3b3VsZCBoYXZlIGJlZW4gYXZvaWRlZCBpZiB0aGUgZnVuY3Rp
b24gc2NvcGUNCj4gdmFyaWFibGUgd2FzIG5hbWVkICJjdXJyIiwgbGVhdmluZyAidiIgYXZhaWxh
YmxlIGZvciBwdXJwb3NlcyBsaWtldGhlDQo+IG9uZSBoZXJlLiBEb2luZyB0aGUgcmVuYW1lIG5v
dyB3b3VsZCwgaG93ZXZlciwgYmUgcXVpdGUgYSBiaXQgb2YgY29kZQ0KPiBjaHVybi4NCg0KUGVy
aGFwcywgYnV0IHRoYXQgcGF0dGVybiB3YXMgZmFyIGxlc3MgcHJldmFsZW50IGJhY2sgdGhlbiwg
YW5kIHRoZSByZWFsDQpjYXVzZSBvZiB0aGlzIGJ1ZyBpcyBzaF9wYWdlX2ZhdWx0KCkgYmVpbmcg
ZmFyIHRvbyBiaWcgYW5kIHNwcmF3bGluZy4NCg0KfkFuZHJldw0K

