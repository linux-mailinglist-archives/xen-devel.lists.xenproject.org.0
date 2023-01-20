Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCF467547F
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 13:31:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481723.746799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIqX6-00055S-1o; Fri, 20 Jan 2023 12:30:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481723.746799; Fri, 20 Jan 2023 12:30:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIqX5-00052g-V3; Fri, 20 Jan 2023 12:30:11 +0000
Received: by outflank-mailman (input) for mailman id 481723;
 Fri, 20 Jan 2023 12:30:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vlkl=5R=citrix.com=prvs=3778cfab1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pIqX4-00052V-BC
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 12:30:10 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b24e7b4-98be-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 13:30:07 +0100 (CET)
Received: from mail-mw2nam04lp2176.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jan 2023 07:30:04 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO3PR03MB6728.namprd03.prod.outlook.com (2603:10b6:303:170::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 12:30:01 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.024; Fri, 20 Jan 2023
 12:30:00 +0000
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
X-Inumbo-ID: 2b24e7b4-98be-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674217807;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=RlNzqUkWLwuj4hAg9mEXT2f13j2mRSF9Xhc9eGvIHHM=;
  b=YCy17rie4DvBmxRbalvftpvJ1Q4YZuJ9NQglud8jCF9N8wziTvOzRtVF
   Ab/MsqXoZXKTjJsid26VrRTrTO37Mmpm3BFMa38yYtkEQMrCG7sMu6TmS
   CzQ25jUz6tFgdnZoTkfultaUzixOVuq+0fztqaf/v84Rfo1UhEPThJmhs
   Y=;
X-IronPort-RemoteIP: 104.47.73.176
X-IronPort-MID: 93924490
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:VYHKtaojkuRNmbYHg3EnYv2Tn1deBmIrZBIvgKrLsJaIsI4StFCzt
 garIBnVMv/eazake40kYNy3phxSsJ7QzNQ1SgRlqCs0E35B9ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weHzSFNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAG0BRR3TluGo+r3has5uuYMoLub6MrpK7xmMzRmBZRonabbqZv2WoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3j+OraYWLEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXpra8w3AHCngT/DjUzXmK/hf+0i3WMZMhGc
 UUUoRop8YgLoRnDot7VGkfQTGS/lhwTQd1LCMUh9RqAjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+LqRuiNC5TKnUNDQcIRBUIy8Puq4YyilTIVNkLLUKuptj8GDW1x
 i/QqiE73+kXlZRSiPv9+k3biTWxoJSPVhQy+gjcQmOi6EV+eZKhYIurr1Pc6J6sMbqkc7VIh
 1Bc8+D20QzEJc3lePClKAnVIIyU2g==
IronPort-HdrOrdr: A9a23:KhTQaqi7YCZ7uUeWTDsOJ88+HHBQXt0ji2hC6mlwRA09TyX+ra
 2TdZUguSMc7Qx6ZJhNo6HiBECrewK7yXcN2/h3AV7AZmjbUQmTQr2KhLGKqwEIfReOktK1vp
 0QFpSWZueeMbErt63HDUCDYrQdKZ28kJyVuQ==
X-IronPort-AV: E=Sophos;i="5.97,232,1669093200"; 
   d="scan'208";a="93924490"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=em+0yLlbBF2NM8a5U5AtaiZ5owkFk7S8S9IncGlwUTKmlBf0HQ9yj+t+W3BL7DwTS31bDqGSJTCI9PXychhvPlnhQoZX+iFK7F9fXaerzTgjpUBb9yKi63WKFZBxHjEhG00vNtUWDi4ujgw/52KpULje4YZ/7GEekezETTfhgA73Nzt5KhQ1nYXvFyLjgold28vbqPSs1krMfnDyk9xoAh0jc9NA6IhCHeYOpR4RSGwFFYDOjaJy3hMnX2rH1dxNlnP745OJ24LjfJ9x+KVTrIFksr1ENqTx8dPmVt/m3nQGTXMmReNnsqq4bhxSyS1CUJHIMaVVBuBF14qjOBqFkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlNzqUkWLwuj4hAg9mEXT2f13j2mRSF9Xhc9eGvIHHM=;
 b=JGAlV2jmJ35N28PoMj/3M/Z6PzLqMzUAyAuAOKfGlS5SVkKpNFyzlhFahHfeQ9DGcwk6KPiDyWC32U2WbMubqdjCSAPpa0aTUFz5F470t2CcbMznK0tKy6nP9fYL1IGZ0T4cxRW2k3BzEsbDboGOW9Lm0r85nH6RqyhRoxMG4S/23UIQkaVimB3xkMRsPqi+wqEGeURTCnFQM1K+perj+TGTZoxaeYRjRWTIMlNPkdNEyjVT2N8gvg1XDr2fk5EInSEChDLv5smvXkTdfQYL6iDklRAQBUdqt7BsO8lwmoSaK8+GmJ1mQ8SJmJ7JUOhbAb0lkhTwUDKv51HXCQvOng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlNzqUkWLwuj4hAg9mEXT2f13j2mRSF9Xhc9eGvIHHM=;
 b=Vgx2DeP/wHVxHR/9N4zL1Vgiw4nlQT8wTnQQTO/YwM62PMzx4Wox72SMkchXKipYceq74oECR5JVX9gslJIyPzlQlObDpgSL0rfItcLKolhiPB8J0rO2kp8ZbFJjNKkuzUoL/zJg976zyEvsy5hCi2SUgzYyYW+MR71ZUic5XCg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Edwin Torok <edvin.torok@citrix.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: Re: [PATCH 0/6] tools: Switch to non-truncating XENVER_* ops
Thread-Topic: [PATCH 0/6] tools: Switch to non-truncating XENVER_* ops
Thread-Index: AQHZKnshvDT8KCQSwEaQz5St3JRq4a6lR1+AgAH5fgA=
Date: Fri, 20 Jan 2023 12:30:00 +0000
Message-ID: <72a3af11-ea53-b388-0e7c-d41d7e0ed263@citrix.com>
References: <20230117135336.11662-1-andrew.cooper3@citrix.com>
 <3c0fb20e-b6bb-83f6-3460-53de14e18663@suse.com>
In-Reply-To: <3c0fb20e-b6bb-83f6-3460-53de14e18663@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CO3PR03MB6728:EE_
x-ms-office365-filtering-correlation-id: 910c89f4-db46-446f-ffae-08dafae20ca6
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 I03AIWv/bJbgI0Bu6KUaUXQjk6LhAhtISXbkoE8DKE/XaMiTZCYagF2H7JlocDPoyd/6XsTiS2zkniQxaVmbggEU2BSNScSZgZC00SWmSclgf+UU6tGto9dg6Bbz+iMZey9MfFb5DOxQpM83Z1Hc5VIwN8lf/sXa6qX3RqA6R2Gjz4X3YQDHmikp8LJkLyNMO52A27IKth5eHP6+caj5Ws7IObs4BFctvuCy+/cK7fLyBfpvbHDOZsJrERl0NkxWSi1RTSPOpzB8fx4xyfSfV9F7ji5p2TLRS9Hv4EDsBIl5bi93dI7eWSLt1+BsTssbfvb62BR8Ns1n3H3P+ctMOi/dNAR/uPeybw53wgpx+9rYjiIPwLVN/N69I/QjzftXNYgBVxe33GRTwB4mzzWtaPdKt9Cj1hUKtso8kowmUT6my8twR6QS+KM8Va62G0YIChPqptggwhlAhSSXRHnpoZONyGwsKYUfEBzaeT9wGZICZvj1+9t4e+PAesWqzLdehVd1t2KWomYqIafHanNfA+UElHKxEYFJmReQ1lkSM/gwK8zV6teP48KSI55Hy2wBXrDvNGsv4zzdC2C1CrTeGslwOf6JR5DezLH+4Szo4qGHJKs205ffOhRg56E/lmNPaQqIyQvJuZPPXzoeff/DnAErrkBvZxeyiNYVBtqbUl0DcFyEudCW7SjkCAxTEZrOm3QlDy/ujiogjXMnh+nRkijDZrEZ1WHK8Wd2iljMXM6oJUNLtLzakp/ZVYmHfhRXejgbiyfbg2Msc+WSu/MPIQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199015)(5660300002)(8936002)(31686004)(4326008)(66556008)(66476007)(66446008)(64756008)(8676002)(66946007)(91956017)(76116006)(71200400001)(31696002)(38100700002)(107886003)(122000001)(53546011)(6506007)(6512007)(26005)(2906002)(186003)(110136005)(54906003)(6486002)(478600001)(36756003)(2616005)(316002)(83380400001)(41300700001)(82960400001)(38070700005)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dFhpeDJpRzQrR1hsdC9mVmM0Y2l0Qmx5OHFOeFA4Q1hyOUg0Z0NjT05FSERM?=
 =?utf-8?B?YkY4SHFZUHQwVzEra1p3U3d4enZJN0JrV2tzOEM2Yk8rOEEwTVJBazhEMGxE?=
 =?utf-8?B?QVE1MHVLZWxnNHp1Q0tKbGZHdGxreWJialg0M1JYRk04ei9keG9tMFhzZ0dp?=
 =?utf-8?B?RmtsRDRlLzBPR2Z3VkI3ZnkrcWZXVmx1cmJZci90RjBPazBtMWVQc3Fzc1hj?=
 =?utf-8?B?czVKZDhLWmlId3lZUUpPelhCbE8rVm9ibjN2bitkaGdwRTdBL0pKRG81MWJB?=
 =?utf-8?B?bzVYTHdmeUgxSlNlZzFucjBVWVI5TkYrR2RWd1M2UEpTcE93Y2ZUMEkydjht?=
 =?utf-8?B?alNtSERyUHNOWkRQWERWWWtvOWt2dmd2ZDByU01ycm1WVHphcEloUmZxcHlF?=
 =?utf-8?B?Wm90dE9IYkNWZEtOd1pENk1aR1dXblFUNGMxVkVRRXNLcENDVERvdnpPTk1V?=
 =?utf-8?B?ak53QmVmU1dYSENoeWo1UExsazlyWmxTU0RaUFdsSk5zTVpDdlI3RHR0S2ZD?=
 =?utf-8?B?ZEdSZ1dzVWZDNEhOQTJYU3JQc2NaNmp1dEtXMXdkSVdSYVJya3NRQ2swMlpP?=
 =?utf-8?B?eUNuUUIxSFlPNEJ5K3BiL3hHTUN0VTFhMStxU2lQeFZEcVJDTGgxNngyM1gy?=
 =?utf-8?B?V0lGYXZSTkc3dzIzZTBQZjYyc0RmUWxIUzZPQkUrMHhmL21sL3ltVERaRi83?=
 =?utf-8?B?bGJpU011OEhmSjdIbURCRXJXNVZoM1NCZkRZUGpxalFyV0lJQlRXUXMwNUZ1?=
 =?utf-8?B?NUVSTE5yL1VLOFN4NThSV2RRRHVqdmRJYmxRdGtsZVRhTzI1U1Z3UVUxK2xQ?=
 =?utf-8?B?TG5EQkVXSXNGdmE2R0g2N3dMbXU3T1dmWHdDZFdJM2lJKzJ5bnE5RkxEajRI?=
 =?utf-8?B?TzFPVDlhVFJzSWt1K3g0UXlSU0hZd2dLTjVQQldrM1dZd3JBMFRIcG11aUpJ?=
 =?utf-8?B?Zk50M3hVZDUzWFZpMDVKVHFTMGhiVExGc1dwcDZwNUEwM1paOTFQYlh2U2NM?=
 =?utf-8?B?Wk9MVXlQay82S1JUaU1KN1Q0RisxdVM1TDJ0VTVqQXZLZ1FzVUo1S1JCZ1pQ?=
 =?utf-8?B?UmVIVXZ1WEt1a1V0VjIxMWE5dEJxN2tIVXZBSkp6MG5lWG0wdEhYSUVJZXdn?=
 =?utf-8?B?TXZSandVY3g4eWRQUUNZTUJkWjhMNGhMbEIvMHlaMEREQ3U4SDhmMGM3aEdB?=
 =?utf-8?B?NFAwSzNobm9nSCt3TTlHTVBWczNkbDNwTVhpRzdZdDkyQWFUTWF0K1UvSXor?=
 =?utf-8?B?YUozelFHM3l2TjBMSEdYbGdPVmV1R2FOeTN5ZWEyU3Y2Nm5ja3lwcVA4NThW?=
 =?utf-8?B?S2I5ZEpmV3RQYmNEWklNYWttNzRRanBBWFE4b3hLZ1RPR1p1cVFUYVBvUVNJ?=
 =?utf-8?B?TFJuRzVoSEoremQwbW1HOWxORGphQUNoQmg5UlRlWEN3V0EyUWVIN0RnK3V2?=
 =?utf-8?B?bTliQ3BtOXVxQkFEaTRVTWJGTXBoK1pHeGNpcWxWM0lHL0orYU1peWp1R3FB?=
 =?utf-8?B?a0NCVUR3Z2Z1Tk1rM3U0UTFpOUVla0xoUjJKbS9MQWVXcXh4ZGFNakhncThq?=
 =?utf-8?B?MEJ5bGtocXhVZGVlRG43QklFZXVVckhQY0lhMGFOTWJBQ0lHOXJwNlREUy9n?=
 =?utf-8?B?bE56UEVUVG9nVjVXTXVKYTFHRU1FTDN3YjV0U25Dbks4VDIvOHVyLzJ1M3FB?=
 =?utf-8?B?VlhYa0p3SGg5M1hVTkJENVkyWk1vNHNycVpmbmZNRDEvK3BKaUd5SXc0cDFm?=
 =?utf-8?B?dmRmLzNzNXVBR2hpTVNlbE12RFNpcGlvNW45TTBWT0lNS1k2cU5XVjFSS3Nh?=
 =?utf-8?B?TURPbHMzcmRWUzhtUXJZZHAyM3l4aEZKUlErQzloZmx4STRoU3FVYjYwcGR1?=
 =?utf-8?B?cXRaRTkvU0l3cXpiSCtEUUpkNS9UaWFCZVF0OVRmejY5N0c0Tm9nNVJoN0JQ?=
 =?utf-8?B?Mkt0VFFudnRRanY4T2ZnVlA0V2VuY1RJUHJQZnVENndqdm0yZWQraHNpdUFu?=
 =?utf-8?B?cnNQUVlFTFBZcFlpUzEvTExsNHB6NUxrbFJPUURjZE1MYm9CMWx3YkZsUkp0?=
 =?utf-8?B?S0w2Y1EwKzN3aXFzU253L3IvTndXS1FRN0EyeHFPZlBCN3FRTmJ4RUUrY3VI?=
 =?utf-8?Q?tPIfjMwBiVn3yjA40ILA3Ib0p?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2B66D68EC234F48A9E5DB84B5B3128C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aThb+sYAcfyNAN2z5271s1mKI6EXt472gAppptcvBLyZnGSzGF7z+rvVTz1i+AB53qRDU815pwY1fp9DLd4EyUP3Lz641lJXF9k1pZ4cIDmujK5GeeEUHQwsrEiTwBDkTqb5GZ7PMGX+DX/CXkoxKHzqjgzHIZWM8zMSHRRvghxLgjrIXDlPNpOXAPN0mmt8URt/aAkeyPH1HqcVUCLZSxSX3iea6SCPqSXgqgpHyX94V6sm+vcjxUQYWi1QcfJa8CyiKBdWtQijjs3lpDPb/xmlPrOGryXcGD32AYXi90ZSVVsN77VK2eln1szrbDzVSHChvT6sGdacqETAEpzzR1YtW1gmIEH18BJXOdjtL2W8qXKlRqbhbhrAwPXPS1UPd2oHOlnAkSTE1HoGlBBQ8LY0FhokE+QBiDvnIKtJNJebUtTfzszIO4yMPPDnKWVKz8l0AvpOXAEEuZZuK0W8BsI/JXhQm69IdyA2fZoUDMuoYQhV6Q3KKVtJSSt7m2sN0eX6NxyEH4ZH5cdpeR7IegNa970qfy36dMyvTXmhebOW5iJuDY9YZWsrnChVWgJv6An1CB2sizcs0ieiTED99LdIkgcyBBj4xT4edNS0ejcp+HJDsrsZ2jN5NrxS3BJohEXKNiG4q40L9rJXraPSIqzCDP8Mw0Lqc7pok/RnkQ6h8BxRbT+P1LDUbYJ1KC7F4Xa5H6JenAub9CYV9ukoUzMSjrOrhpeHXvJCn0fZ57oiAs5xtu3En4KFegYpiri4AV4Qv1txIF1Q11T01UVlefDatXSn8xjNz2F6VA7VVODjnJXROisE/kYH7TaFbZOVeCJViJfNhHZYx3v2sAqVPvonjeAGn0yw6+QsfUUGLEY=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 910c89f4-db46-446f-ffae-08dafae20ca6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 12:30:00.8014
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ruonm3J0C4uZMi4LXRVbI5pERg5cOmp9AgiMtxOjSvGiNUDz5jVc+qEuCUmU90i34DCTpldtmiidEiNN1VOpdB4Em2cLXzOFkRDlF6H4o8c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6728

T24gMTkvMDEvMjAyMyA2OjIwIGFtLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPiBPbiAxNy4wMS4y
MyAxNDo1MywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IFRoaXMgaXMgdGhlIHRvb2xzIHNpZGUg
b2YgdGhlIFhlbiBzZXJpZXMgcG9zdGVkIHByZXZpb3VzbHkuDQo+Pg0KPj4gV2l0aCB0aGlzLCBh
IFhlbiBidWlsdCB3aXRoIGxvbmcgc3RyaW5ncyBjYW4gYmUgcmV0cmlldmVkOg0KPj4NCj4+IMKg
wqAgIyB4bCBpbmZvDQo+PiDCoMKgIC4uLg0KPj4gwqDCoCB4ZW5fdmVyc2lvbsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgOiA0LjE4LXVuc3RhYmxlK1JFQUxMWSBMT05HIEVYVFJBVkVSU0lPTg0KPj4g
wqDCoCB4ZW5fY2hhbmdlc2V0wqDCoMKgwqDCoMKgwqDCoMKgIDogVHVlIEphbiAzIDE5OjI3OjE3
IDIwMjMNCj4+IGdpdDo1MmQyZGE2YzA1NDQrUkVBTExZIFNVUEVSIERVUEVSIEVYVFJBIE1FR0Eg
TE9ORyBDSEFOR0VTRVQNCj4+IMKgwqAgLi4uDQo+Pg0KPj4NCj4+IEFuZHJldyBDb29wZXIgKDYp
Og0KPj4gwqDCoCB0b29scy9saWJ4YzogTW92ZSB4Y192ZXJzaW9uKCkgb3V0IG9mIHhjX3ByaXZh
dGUuYyBpbnRvIGl0cyBvd24gZmlsZQ0KPj4gwqDCoCB0b29sczogSW50cm9kdWNlIGEgbm9uLXRy
dW5jYXRpbmcgeGNfeGVudmVyX2V4dHJhdmVyc2lvbigpDQo+PiDCoMKgIHRvb2xzOiBJbnRyb2R1
Y2UgYSBub24tdHJ1bmNhdGluZyB4Y194ZW52ZXJfY2FwYWJpbGl0aWVzKCkNCj4+IMKgwqAgdG9v
bHM6IEludHJvZHVjZSBhIG5vbi10cnVuY2F0aW5nIHhjX3hlbnZlcl9jaGFuZ2VzZXQoKQ0KPj4g
wqDCoCB0b29sczogSW50cm9kdWNlIGEgbm9uLXRydW5jYXRpbmcgeGNfeGVudmVyX2NtZGxpbmUo
KQ0KPj4gwqDCoCB0b29sczogSW50cm9kdWNlIGEgeGNfeGVudmVyX2J1aWxkaWQoKSB3cmFwcGVy
DQo+Pg0KPj4gwqAgdG9vbHMvaW5jbHVkZS94ZW5jdHJsLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDEwICsrDQo+PiDCoCB0b29scy9saWJzL2N0cmwvTWFrZWZpbGUuY29tbW9uwqDCoMKg
wqAgfMKgwqAgMSArDQo+PiDCoCB0b29scy9saWJzL2N0cmwveGNfcHJpdmF0ZS5jwqDCoMKgwqDC
oMKgwqAgfMKgIDY2IC0tLS0tLS0tLS0tLQ0KPj4gwqAgdG9vbHMvbGlicy9jdHJsL3hjX3ByaXZh
dGUuaMKgwqDCoMKgwqDCoMKgIHzCoMKgIDcgLS0NCj4+IMKgIHRvb2xzL2xpYnMvY3RybC94Y192
ZXJzaW9uLmPCoMKgwqDCoMKgwqDCoCB8IDIwNg0KPj4gKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+PiDCoCB0b29scy9saWJzL2xpZ2h0L2xpYnhsLmPCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoCA2MSArLS0tLS0tLS0tLQ0KPj4gwqAgdG9vbHMvb2NhbWwvbGlicy94Yy94
ZW5jdHJsX3N0dWJzLmMgfMKgIDQ1ICsrKysrLS0tDQo+PiDCoCA3IGZpbGVzIGNoYW5nZWQsIDI1
MCBpbnNlcnRpb25zKCspLCAxNDYgZGVsZXRpb25zKC0pDQo+PiDCoCBjcmVhdGUgbW9kZSAxMDA2
NDQgdG9vbHMvbGlicy9jdHJsL3hjX3ZlcnNpb24uYw0KPj4NCj4NCj4gSG1tLCBJJ20gbm90IGNv
bXBsZXRlbHkgb3Bwb3NlZCB0byB0aGlzLCBidXQgZG8gd2UgcmVhbGx5IG5lZWQgYWxsIHRoYXQN
Cj4gYWRkaXRpb25hbCBjb2RlPw0KPg0KPiBBcGFydCBmcm9tIHRoZSBidWlsZC1pZCBhbGwgdGhl
IGluZm9ybWF0aW9uIGlzIGVhc2lseSBhdmFpbGFibGUgdmlhIGh5cGZzLg0KDQpjYXBhYmlsaXRp
bGVzIGF0IHRoZSB2ZXJ5IGxlYXN0IGlzbid0IHRoZXJlLsKgIE5vdCB0aGF0IEknbSBwYXJ0aWN1
bGFybHkNCmNvbXBsYWluaW5nIC0gaXRzIG5vdCBhbiBpbnRlcmZhY2Ugd2Ugd2FudCB0byBlbmNv
dXJhZ2UuDQoNCj4gQW5kIHRoZSBidWlsZC1pZCBjYW4gYmUgZWFzaWx5IGFkZGVkIHRvIGh5cGZz
Lg0KDQpIeXBmcyBpcyBvcHRpb25hbCwgYW5kIHlvdSB3aWxsIGZpbmQgZmlybSByZXNpc3RhbmNl
IHRvIG1ha2luZyBpdA0KbWFuZGF0b3J5IGZvciB0aGlzLg0KDQpBbHNvLCBoYXZpbmcgbG9va2Vk
IGF0IGhvdyBoeXBmc19zdHJpbmdfc2V0X3JlZmVyZW5jZSgpIHdvcmtzLCBpdCdzIG5vdA0KY29y
cmVjdCB3aXRoIGxpdmVwYXRjaGluZyAobm90aGluZyB1cGRhdGVzIHNpemUpLsKgIEkgc3VzcGVj
dCB0aGlzIG9ubHkNCmltcGFjdHMgdGhlIGxpdmVwYXRjaGluZyAidW5pdCIgdGVzdHMgd2hpY2gg
bm90aGluZyBydW5zIChoZW5jZSB3aHkNCmxpdmVwYXRjaGluZyBpcyAqc3RpbGwqIGJyb2tlbiBv
biA0LjE1IGFuZCBsYXRlcikuDQoNCn5BbmRyZXcNCg==

