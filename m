Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB416BCFEE
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 13:53:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510575.788464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcn6k-0006Me-D5; Thu, 16 Mar 2023 12:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510575.788464; Thu, 16 Mar 2023 12:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcn6k-0006JO-9p; Thu, 16 Mar 2023 12:53:26 +0000
Received: by outflank-mailman (input) for mailman id 510575;
 Thu, 16 Mar 2023 12:53:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lZp/=7I=citrix.com=prvs=432965e83=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pcn6i-0006JI-CJ
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 12:53:24 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87bab536-c3f9-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 13:53:22 +0100 (CET)
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Mar 2023 08:53:18 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB6078.namprd03.prod.outlook.com (2603:10b6:5:391::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Thu, 16 Mar
 2023 12:53:16 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 12:53:15 +0000
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
X-Inumbo-ID: 87bab536-c3f9-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678971202;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UG57Mfp1LDDK5wBWBXcGC2CG+lZyhuSRTpipDutsdq8=;
  b=V71lG+xdT7oaqDDjag40f328sCGByVdmMtRm39yaqfA5fyZ8ux3itdqU
   /YmrYLXbrTM3KSCpR9Xzx/1iI9QpRobbcSMtJPICjkqirjo+LHJ441Ung
   atlVrtTvC9WjnIqCAwmaxDLdlO100JYg0Y4j6l39UFFxnGhsc7laySYx9
   o=;
X-IronPort-RemoteIP: 104.47.66.45
X-IronPort-MID: 103527321
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:OXtpYauEDYINrWB7T+UssWwas+fnVKZfMUV32f8akzHdYApBsoF/q
 tZmKWjXbvyMMTbxfN4gaI2/9klSsMWHx4JjSAA6pXs1Hnsa+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASHySFLZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwFg4VMgmEvNmNnpm/crBciPgKMuixI9ZK0p1g5Wmx4fcOZ7nmGv+PwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0ovjv6xbbI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeXjq6Q12wfKroAVICI/ZGWbo9K6sUP9V45+E
 nAY4nMrl6dnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLmoNSDJbecElnMAzTD0uk
 FSOmrvBJTFpqqzTdnub+Z+dtzb0Mi8QRUcYYjQOVwwC4N/Lr4Q6jxaJRdFmeIaqivXlFDe2x
 CqFxAA8iK8UltUjzLig8BbMhDfEjojESEs56xvaWkqh7xhlf8i1aoqw81/Z4P1caoGDQTG8U
 GMsnsGf6KULEsuLnSnUGuEVRun1urCCLSHWhkNpE9857TOx9nW/fIdWpjZjOENuNcVCcjjsC
 KPOhT5sCFZoFCPCRcdKj0iZUqzGEYCI+QzZa83p
IronPort-HdrOrdr: A9a23:ma3w+a1joRDtWeRGReqV4gqjBdVxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ/+xpOMG7IU80hqQFmLX5XI3SKjUO11HYSL2KgbGN/9SCIVy2ygc+79
 YGT0EWMrSZYTdHZK3BkWqF+qMbsby6GdeT9IXjJhlWLD1CWuVF1UNUGwybGkp5SE1vAoc4Lo
 OV4o5qtietYnMea+W8Hz0gU/LYr9PGuZr6aVpebiRXozWmvHeN0vrXAhKY1hARX3dmxqojy3
 HMl0jU97iuqPayzz7bziv2445NkNXs59NfDIini9QTKB/rlgG0Db4RE4GqjXQQmqWC+VwqmN
 7Dr1MLJMJo8U7ceWmzvF/ExxTg+CxG0Q6u9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOisYZNBx+oplWw2zGIbWAkqqOHmwtirQchtQ0ebWIqUs4ekWVQxjIXLH5KJlOD1GluKp
 gUMCib3ocdTbrSVQGigkB/hNOrRXg9BRGAXwwLvdGUySFfmDRjw1If39F3pAZ0yHsRceg22w
 3/CNUbqJheCssNKa5tDuYIRsW6TmTLXBLXKWqXZVDqDrsONX7Bo4P+pOxd3pDcRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOthTAWn+0UzjhwtxXo5J5prr/Trz2NjDrciFbr+Kw5/EERsHLUf
 e6P5xbR/flMGv1AI5MmxbzXpFDQENuIPH9euxLKm5mjvi7VbEC7NarDco7DICdbQoMSyf4Hm
 YJWiT1KYFJ8l2rSxbD8WbsZ08=
X-IronPort-AV: E=Sophos;i="5.98,265,1673931600"; 
   d="scan'208";a="103527321"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfnTCpcigGbeeDCmsLvmzjJejpdmVy5QbqwGYwgXFMuIPYLlEQQ1+ggfz/JPjEritcF5XXJkDpdncvelnZKM8ni5LbrKBSLabxOukFMJ/xZZz0LnqAKZYGiLYe8Q9kYBZn2k9kK9JSZckjTh4iLKvaTWtN3UnvqrHTsq7MXiJTIlRULNxy3J6cOLFCH7XWcNgNqsTGS4Ot3XulcRUxmtwgxz3ANVR7B7FsCoaFYd0AgZC3wqe7UG6b3F1efgZFXafGGKU/A9RyzykEFF6taQPQwRIQPQFeMDvGKfPz0mmqEM89RRoc7wCOWh+ul47r6ibhOA0cNcYyIxqsLxZG9NGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/jvKDojcsWkrZuuTJGA2rE5O2T+40xoTh5MhrJyJ40=;
 b=NEs9bgLwbhNudO5fICWrJk7x/60kfEux1uH884/F8BoZfkn/DSB7+szfn8it48QZcfAg5YlzJHWeTgQJoMFc6xwk7Imu3Sd83mG6ggjTnqy4Vp2w8cCI97xWLGvpyYua4Lvy1NQzE6fmr8eIX71AXybDbQ3idrEZVtxjITAZPuFqmQJlvm/y6lJG2tga/UIqnqjdBjr3sUDc1eR13CE+w6fMFQazEMzGJPq0kdJWrz424pyXmquxTEFs/Gg9YjSf5scnPbUQ8rJov46A73SA4ixfmXC6pTGVZS8ViLIazxXfzzJ+kUZDoeIYMmFrFWeSP4NEflH5gpmnHivZ0bzAag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/jvKDojcsWkrZuuTJGA2rE5O2T+40xoTh5MhrJyJ40=;
 b=rCu+okvL95IlMhgr4JExFyBAEXTWB8xwSW4lMYS2MUL/I9lFez31oP8NbS/fqMg7pGGgqrh0VMVVsSbDV5o5cKZWsgp/oQUc1h1bczAHbSFb6Zoa4/BbWg3sfXfoMvne6vc8QJSHBnae48G/pYL2kiGyPVaGVpubBv7bmVXbsmM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4240a4e9-4cc7-ac42-c0d5-48ea9b8dfb98@citrix.com>
Date: Thu, 16 Mar 2023 12:53:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 0/3] libxl smbios support
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jandryuk@gmail.com>,
 Henry Wang <Henry.Wang@arm.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20230306204024.124882-1-jandryuk@gmail.com>
 <d3da0ece-a65a-89f7-85ba-5de31472bdcc@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <d3da0ece-a65a-89f7-85ba-5de31472bdcc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0249.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM4PR03MB6078:EE_
X-MS-Office365-Filtering-Correlation-Id: 00384240-4648-444a-7a3e-08db261d68bf
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ydabQQPpBQfBuphpWp4973RcEoZRoEpCVvBuH2O8CnTgqFv4IpjhaBOBbFP/bNjZmMqtanbCG7xocHPmd0Wa11W7rDyvhLScOauxri1K0tbGA9IB+ST83vYvu2b1fhlCsH2E9cxbPIGubyxSK3AwFbWzL5bry3EqlAr9w8ds+HppbjxooDM1YVnkUI6g9S9tVlEF85G3K6Epz9Nz58QSpPSNnEokElf6nT6tVxp/Kf5MfjO2GofmlHG7HFFLEdELfTd+IUnkmxjUTrah/00jepiy2fbtRxGTCU9+xe9hsnzbLNjs0a3CNj/tHu8WJWoq/ltHH15sIaviz9+gAFY3SIuAINCNm2y0ajjztarILaUetVng6vzIriCq48W2e8ky1SEXaw+z8ZVm5doftpulfZ8YSP11+IW9kPWXgG4WEjamtQ6YLuBYNRQ3nVHXh/1yfoMFPs5lsX5xY0jNRiCcDNX8U0sw6yvDq1vpiu/g8FTmAFcF+wS62HkKCIfyIY8CXmxxifkLypNB2oiGJspRg8LXMXcu/ADw79KmdI+RjT4MK+3Q9k9u8UvzQL9U4wiy325Q6KrIFvHqaDY5HYW73bOg2k/xFiPz/nLsxeYwOj2BX8YOn4o6GDCK+FABbeqAlcN0g9VgONceXZC7cqONrYjelyLak+/5TnHvIS8rJF4DaYYOtLvyRmHEqUhbU5bBpxdZyhZCuHBwEptnhxQ16HrMfh6DF9/eVVOOTOT49/U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199018)(8936002)(54906003)(110136005)(478600001)(83380400001)(8676002)(4326008)(41300700001)(316002)(66946007)(66556008)(66476007)(38100700002)(6512007)(53546011)(6506007)(26005)(6666004)(36756003)(31696002)(86362001)(2616005)(186003)(31686004)(2906002)(5660300002)(6486002)(82960400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjlhQm5NczhCNkJWY0JubFlZdDUzRVZYaVd5d01CNlBUdGlTUm90VGhLcWhE?=
 =?utf-8?B?a3lUT1dUbHlzdmVXVkxtOU5SVk1EOHdpUVdJQWlDcjNIRnZ0M25ZRnFOQlZw?=
 =?utf-8?B?ZGQxQ0tneGcwUjIxYy9MTlRuSUNwU0MxUHl0akV3MFJvZWlKZThPbHRvQWQ2?=
 =?utf-8?B?cjN4bWVKMzJMMG5hWkNMR2l5d0Y3aWlzMTBUV0hxVFMwbFE4NW1seWl1MEpV?=
 =?utf-8?B?M1RsdzUzMlk0VFptOThKSzJnZUZkUjFXOWV6YzRpWXFQbHloZHFqb3pIanYz?=
 =?utf-8?B?bnhjbkFqL0NwaTF4ZS9mWGJJSk9oTmtaeGFsMkJxdUg3NThROElteWxRZFpk?=
 =?utf-8?B?UVlOc3lWSTlWblZpRlNENWtpZ0dXSjJaTkN0OENPMFh1N1FOTExMT1hpZEhl?=
 =?utf-8?B?ZDVJNjZldHNFUm93UUVjOHVlcU5uNVB6M3d6UlE5ODl5cEJadEMxNzJjYWFu?=
 =?utf-8?B?bHkyQ3dJNVVDS3FYUlJjZFArSWpMSHRnOUpObXdNUlBlL1JITm9waS9ndWlT?=
 =?utf-8?B?Ry9YZDlKbWJjSkNyRmpsNi83M1E2T3NOQ3FZU1JwYm1yb3Z1eDhpVFg2TUFO?=
 =?utf-8?B?NFVWTFEwbkdsWHB5NU1ua0hPaTlHTlhRenJXWVRHK2RwblRrSkUwK3VQN1J5?=
 =?utf-8?B?Q1hvQTYyaVFGMW0vbDZwQUdCZTIxSzl3eDFIcHZGOVVRdGJveHF1TDVrMkJY?=
 =?utf-8?B?MkdUU0ZPK1l1UG9QRzR1S1lGSlZmQWE0a3JuY2Q3Z1ZCV3VkbHpXOGdzUjd2?=
 =?utf-8?B?YlE3MXJuMGpwbUdWTUZLalhsYmkvZW5LQWIySU05ZThUdmtEQ29iTzczcklC?=
 =?utf-8?B?TWJlUXN0SWE4SVNEYXVzellyWllmdTNkZGR3MHRXTitmMmRqWVRQdklueHIv?=
 =?utf-8?B?a0ppQ3VITGFkVXNLN2dSR3Y1ZkZpMWlJNGgvRmZhRGhQUVd3cUh5L3ladlNN?=
 =?utf-8?B?aGo2QlJKbitXZGVWWGhzanhmRlZwVWVobXZYRU1uQVlaUjNtQkRjUUI5MStG?=
 =?utf-8?B?YklrQ0VYckZTc09takdjVkJzMFFIek9mdFRRUkpjblNRSDVSM05USG1ZekEw?=
 =?utf-8?B?SEJrUjhmL3JaT3JCNDR3ZGlmUVJMU3paN0IwOWVxc1pZUUZLeGRJdUJmalFT?=
 =?utf-8?B?akY4NVhHajdIam42MzEvdUoyREROMWVueUVZaFNaT1JQUlpmK0YrZUVsdGlz?=
 =?utf-8?B?Z3VRSjhqVGZzYXFBa085eElKODMvUWIyNFBTV2xRUHR3U2VESWJLNVhrVzRr?=
 =?utf-8?B?MFNMbTNmc010WklNcWEzVGd3c1k0T3VpblZuekRsS0k1azNuQWJBSDc3ZUVn?=
 =?utf-8?B?RDJQS0J2WkZwL0NJOGZPaDAwK0c0NHpDNkdRQTVIMmNrdlBKOVdoUEZVZ2VV?=
 =?utf-8?B?NEpwZllETXVhTUc3b1U4bGliWlJOaG9hQmJleEFFWnY3N0hLY0N5Y2dZSVp4?=
 =?utf-8?B?dUJDWEY3Yi9WdVZqYWk2YnBPR2NsalVvUGhJS3phTktvdGkwOFpzWEtPUDBY?=
 =?utf-8?B?MzVPa3V2Ymx2WjNVQ0NRTE9mSythUTI0d01IdXlBS01wUFNQY0hHYTVCeVVV?=
 =?utf-8?B?N0syV01nRlpFU1hxYyszNGlSalU3VU5GekFtb3ZQZURWenAxamRuZnQ5Slp3?=
 =?utf-8?B?OFNZNDJ0UVo2bEgwa0R5TVJodllOZVF3MGJlNHJIczU2eWhkRHFZR240QkZM?=
 =?utf-8?B?ellBdkJDRkh5eERQejVSMTVrYXFpSHJseXpuczh2bXNBWEVhYnl2K2dmbnF6?=
 =?utf-8?B?QnczbUZWMWtXTWNkUG9EQ2xsQ29tT2V6T1hiVHp3QjF2bnhhWjU0UlR2S0tt?=
 =?utf-8?B?cmFUUTFBRzF1WnN3SE5ndWI3a1pUTEVQWWhIUDRodWU3cDltUzhidXVodjhU?=
 =?utf-8?B?Z3lDcnBra3dSNjh2TjExWXcrMHZjQURIUmsvOGF3U1FzNFBxVlBvVzBvM09p?=
 =?utf-8?B?MGN5TExQR0J0bk1aanhYOGNHL1Y3UHYvbkxjSjVscTVtUURMNUNzQmRsckUv?=
 =?utf-8?B?YWlGKzM4dm5BYVJqamJiQS9JNFhGZjhJRDRPdVk1eUk5dVBjckZQS21oT3l6?=
 =?utf-8?B?bCtqSnUwNTBIUFRkQ3Yza2RoS3BNeFZXTzM2R2U5d1RlcVlVbkc5UTVMS0Vo?=
 =?utf-8?B?ZllOMEJQZnRVOG50RWM4THhNeGtTYlFDSlgyRWJmNkozdXdVWE1NUjNYeVZS?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8+t2RCm/LP0L8/pvyhBQGfd5m2DPdMet7Tn07AMQYu0QsPFJ0MaDtNFI7CAoVfmiCmOCwRpVlCoFXn+7Xdt8lkRB++ePEGd+GexWfziTLlzucyVJN5cUwj+Ar7ZvDgc8he4Fll7gQZP9FGhRuUJKnDuo0Dm8vp/Z6ZK52j0bsefthzl1qHUjYtOCwtyN7Py7Wykb65MHksKNjY/x//D2eq6gIPn/llF5YCLkXrCcBWpa9YHOqD/g5l/zrN/Tz96AocI9hJfygiF4CoEcDju/MW9nqOXPzBadG1HXXXHgc2yatgZj9ppu3XtO3osrNS2BzSUOexzgH9PNOVgBOe6FRCFVZkup9gmL1zE8yRe0uCi7DzZ9ypuhSKueJyvvsq3ZlpkMd0bf68hYCwlfrSNQYmlNIXXaIUJ8FMDyPM462zBqjGggG3n5vkoeiAIg1WOJi+Qmx/hsrwpc5n/vJZYlAEFo2aG7AxR0OukdVA2T2D7zoBTxr/3YpgasAqRcRqbrMkV5x+7uoR+G66phqA1LiB4RcCZ8xa4hImovoh88Yava2524jZk/Z0DY2EleFh2ycYTaRO67DsFi9K7Pt+roO5mABXS5HJ8wNRl0EpPA+brPjOKDEFtDOYc+iw0PnpclJnYLsJZMLBWbdk1LwjVUTQH6I8uZKguwsUvbyOU7Nzc0GbootABSYpUFgjGt5pavcfemZKv4Z4HhDagqza0+tUPc1URWldsPyuPItOTGKyRK2cynkJD/RBHt0NkHBV2GP2dEQbuX6eyR5soRMYptpkEz5p/ZGXGdh1EdRiXV6BgWe/Qa3Tbfej0bMHPtoY3RieEYhgKVLDOeLF8tTAvZ1ttgHe/6tlZRjz8U7GGaOCL/jhV2aTp2dyQq8QIqUh/L
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00384240-4648-444a-7a3e-08db261d68bf
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 12:53:15.7749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aKrLa7K+0Lffsh8M/owl/d2mK9mBhBZbpDn+1aP5iHppb0hXhq8UgsKBrzLDr3hCY6rT1dpCadwmEZs4/CC3fg0HhodkuNxOVFJMOFzswUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6078

On 16/03/2023 7:53 am, Jan Beulich wrote:
> On 06.03.2023 21:40, Jason Andryuk wrote:
>> hvm_xs_strings.h specifies xenstore entries which can be used to set or
>> override smbios strings.  hvmloader has support for reading them, but
>> xl/libxl support is not wired up.  This patches adds a new xl.cfg option
>> and libxl support to write the xenstore strings.
>>
>> The xl syntax looks like:
>> smbios=["bios_vendor=Xen Project","system_version=1.0"]
>>
>> The Go binding generation needed extending to support Arrays inside a
>> KeyedUnion, which is what the first patch does.  The generated go code
>> builds, but it is otherwise untested.
>>
>> There are also oem strings, oem-1..oem-99, that HVM loader supports.
>> xl parse multiple oem strings like smbios=["oem=A,oem=B"], libxl then
>> iterates over them and assigned to the oem-%d entries.  Both xl and
>> libxl check that the 99 string limit isn't exceeded.
>>
>> The rendered man page and html don't have a newline at the end of the
>> new section after patch 2.
>> """
>>            battery_device_name=STRING
>>        ms_vm_genid="OPTION"
>> """
>>
>> however the txt format is correct:
>> """
>>         battery_device_name=STRING
>>
>>     ms_vm_genid="OPTION"
>> """
>>
>> It goes away after patch 3 is applied since it adds text about the "oem"
>> option in between the two lines above.  I'm at a loss as to why this is
>> happening.
>>
>> v4 is a rebase and resend of v3.
>>
>> Jason Andryuk (3):
>>   golang/xenlight: Extend KeyedUnion to support Arrays
>>   xl/libxl: Add ability to specify SMBIOS strings
>>   xl/libxl: Add OEM string support to smbios
>>
>>  docs/man/xl.cfg.5.pod.in             | 49 +++++++++++++++++++
>>  tools/golang/xenlight/gengotypes.py  | 41 +++++++++-------
>>  tools/golang/xenlight/helpers.gen.go | 51 ++++++++++++++++++++
>>  tools/golang/xenlight/types.gen.go   | 28 +++++++++++
>>  tools/include/libxl.h                |  5 ++
>>  tools/libs/light/libxl_dom.c         | 33 +++++++++++++
>>  tools/libs/light/libxl_types.idl     | 27 +++++++++++
>>  tools/xl/xl_parse.c                  | 71 +++++++++++++++++++++++++++-
>>  8 files changed, 288 insertions(+), 17 deletions(-)
> Is this work something that's worth mentioning in CHANGELOG.md?

Yes.  Thanks for remembering - I'd forgotten.

~Andrew

