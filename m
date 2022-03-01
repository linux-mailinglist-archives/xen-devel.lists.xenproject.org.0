Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FAE4C8C6E
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 14:18:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281429.479758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP2Oj-0007xS-Cw; Tue, 01 Mar 2022 13:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281429.479758; Tue, 01 Mar 2022 13:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP2Oj-0007us-9V; Tue, 01 Mar 2022 13:18:37 +0000
Received: by outflank-mailman (input) for mailman id 281429;
 Tue, 01 Mar 2022 13:18:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YI9j=TM=citrix.com=prvs=0520bb690=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nP2Oi-0007ug-3L
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 13:18:36 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17fd7b0c-9962-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 14:18:34 +0100 (CET)
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
X-Inumbo-ID: 17fd7b0c-9962-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646140714;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=FNUCsQ/3JDb57Sl6fkwHLvMucRLmH2WJUthE75WdN54=;
  b=NjSg2bJcdA+wf6GJ6NJ3/qffOM489q0ADowz3wmCyHw6J5J7wvyOp9bk
   ePbdZztdncx0R/rV1riThrL/AAxTY+gqvS3k8xhZl/kmm5NAll+lUb2en
   CwRbKl7DQOaCO/nSLS9s/s4jEDLwZn11wxSX9XlTTqAfvGaVHLsgXQU9j
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65216691
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:quNuG63V3Ug/w92StfbD5c5xkn2cJEfYwER7XKvMYLTBsI5bp2MHm
 jMWXG/Saa2OZ2L0LYx3PNm38h8EvMOHyd5rTgFkpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tUw2IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1ilru9SgRxN5aSwukMfgVSAQdlZ51JreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNaiDP
 ZNHN2s2BPjGSwYMOHsxC5QZp9zyrGjgUiVyqULM+ZNitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzREhwccdCS1zeB2natnfPU2zP2XpoIE7+1/eIsh0ecrkQRAhALUVqwodGil1WzHdlYL
 iQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4PM4d5QKOkqPvvVyUF0UYRCxnc4YWu5pjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnFdE1ZcizX3iMRq10+UEI4/eEKgpoCtQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhaT1sTA3Dt4ade51q2VtW
 lBew6ByC8hUUPmweNSlGrllIV1Qz6/t3MfgqVBuBYI90D+m5mSue4tdiBknehs3aplfJ2OwO
 RaC0e+02HO1FCHxBUOQS9jsY/nGMIC6TYi1PhwqRoAmjmdNmP+vo3g1OB/4M5HFm0kwi6AvU
 ap3gu73ZUv2/Z9PlWLsL89EiOdD7nlnmQv7GMCqpzz6gOH2TCPEFt843K6mM7lRAFWs+16Or
 b6y9qKiln1ibQEJSnKPoN5LcAtTdiBT6FKfg5U/S9Nv6zFOQQkJI/TQ3akga8pimaFUnf3P5
 XazRglTz1+XuJENAV/ihqxLAF83YatCkA==
IronPort-HdrOrdr: A9a23:OQJ0jamiaf2AxCJeJBWsCqRTQPTpDfOMimdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcIi7SdW9qXO1z+8Q3WGIVY3SEjUOy1HYU72KirGSggEIeheOudK1sJ
 0AT0EQMqyJMbEXt7eZ3OD8Kadc/DDlytHpuQ699QYXcegCUcgJhG0Vanf5LqQ1fng9OXNQLu
 vH2iMtnUvGRZ1jVLXDOpBzZZmkmzSkruOCXTc2QzocrCWehzKh77D3VzKC2A0Fbj9JybA+tU
 DYjg3Q/MyYwrKG4y6Z81WWw4VdmdPnxNcGLteLkNIpJjLljRvtTJh9WoeFoCs+rIiUmRQXeZ
 j30lId1vZImjTsl1KO0F3QMs7boW8TAkrZuBulaL3Y0JTErXwBepF8bMliA2XkAgIbzaBBOe
 Rwrj+kXtNsfGD9dG6W3am5azh60kWzunYsiugVkjhWVpYfcqZYqcgF8FpSC4poJlOx1GkLKp
 gnMCjn3occTbpaVQGvgkB/hNi3GngjFBaPRUYP/sSTzjhNhXh8i08V3tYWkHsM/I80D8As3Z
 WJDo140LVVCsMGZ6N0A+kMBcOxF2zWWBrJdGafO07uGq0LM2/E75T3/LI27ue3f4Fg9up+pL
 3RFFdD8WIicUPnDsODmJVN7xDWWW24GS/gz8lPjqIJ84EUhICbRxFrZGpe5vdI+c9vcPEzc8
 zDTK5rPw==
X-IronPort-AV: E=Sophos;i="5.90,146,1643691600"; 
   d="scan'208";a="65216691"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7oilectNqtwr/dToN49LEL3WxFctig1P3v8x0BEXw6i5zAM65ynwBwWLwpiNBwCRiNoOZUpo7i3J9Pu+aanLT8QzAmFUB+TKscGi6xOFVC5GY6EzGf2kwHAQbKk2LLEFO1TbzPY7Qr+CF7EnayXVQwKDEFD4OnDlitZSuOsL28whh2+AVurANR367pCj/XymYuz/vwZrl7JqUXqybmFlrYslcN/vXCxsI7NU+Csw9zV36G9yAG9+uEmL2gfmWr89Q7Clq5pWKe75ARBje2zBvClz3frVBmoTOmkv3eFa29bjBKQ++9bO8DG6hLXFuucXddHvktsDOx6qnxytNudtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNUCsQ/3JDb57Sl6fkwHLvMucRLmH2WJUthE75WdN54=;
 b=WR1gMQx4NxDqrnz91k3mWBjdytfYzkR9ALHi5hTqEnyNMpV0ZyQ2UJF7kI4s+j+hhWczqeW4tAjUlAGWaCuSUsNADtPZcAWd/vQRxRmpUJ2o0OzBnhmlqJ14Y3a5uGITsL5d7crWPSGfXdZDaBHynyRYmBENbXG60Gtue0e/3Y4sRA2rSUdHmNvUsnuUFcweRUwuVLjOm12CjeWhR5as7nR8u9g/Bqg4nikJ9zQChEL2YsJ+Zr6wDCd5DIjeEkBhOgWVHLL0jgLeozx6BIG0IPecmCLKXMf4mUE+qOz7oXu6Pba3e/aUlUJ21kbkBHIYztXVuRsViqwOVPG6LA0wQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNUCsQ/3JDb57Sl6fkwHLvMucRLmH2WJUthE75WdN54=;
 b=lY7FANjnqIjPAymBxjLxRZus9ZlNu/2R8WjsQD1+kj9/DdGWyYMpod+MbfgBgli2HzHW+KkmlcIiXVoBrW5+JLNdgrP13vtQkTO/E90phxErYiirdWROLBK0moFTdb+gYvGrK+gn70+51huVFd/5AvERepNSwNrW5E1hH0Hiy3g=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH 2/2] x86/time: add CF-clobber annotations
Thread-Topic: [PATCH 2/2] x86/time: add CF-clobber annotations
Thread-Index: AQHYLVxwam4XOlcoM0qksn/nZK0dPqyqgvIA
Date: Tue, 1 Mar 2022 13:18:26 +0000
Message-ID: <20185a89-0a2b-6bbd-5484-31b6582ed200@citrix.com>
References: <77675e7f-2a7e-f517-4aba-e20774c8bfe5@suse.com>
 <61bbf544-74ac-b698-425a-d1db80acab43@suse.com>
In-Reply-To: <61bbf544-74ac-b698-425a-d1db80acab43@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e114ef2a-9688-4d25-577f-08d9fb85f893
x-ms-traffictypediagnostic: DM6PR03MB4841:EE_
x-microsoft-antispam-prvs: <DM6PR03MB4841E8A4C614A3E02FD5E2FEBA029@DM6PR03MB4841.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O16tGBj26aYukF16a4X15DJ70uUxuw0+0V3VdJJ40XMMdhCbKg8th4ruo2VNn/RfIB8SX8RQgKmNKXEikOftqgE/ACCcjyh9/jPOduHmje4YPbxxrmJ82mLMCRZgSiJqyoRTQufSkYuSTSeGJBZPiHCXOxjXVDddSmAZ2So8T/sqY/0oKzJ6Z/2jEPVjC6t7EwTrztJ2XKtDjXIBe395ZTdobb4FqiRKEk3Ot22T8ydos590QwGGRo8a42xEuC6KZdRBP/NrUMuC4bA+HpPSE46xTYLorVP7e4G2UkFRBqTqNu0n3PP+p/Q7U86Y2EeoVTt5DBfN4Mk5l0jTCA6Hl+TFH5pgivpbLttVOCk0VTwh/xZ0OmLjdwpov8dCOME8Z2TZ/I3RLJetIktL+AYT4OCtRMgeP/hFz5+kn5wZs8ssG1MlEtu5+9h4JAS1gW4wAbpzxCPUsp1ixRpKLNW/9uGDrJ5U9Bujx+2nDyo1QTHL3zCdSH15RrFNnT0PwqPrZ2F2rBLhzn9H7xp0qjuOimfnHHqgxX9MV6HC/odcZlATt9mkjsnwf0xNrJ3d+iFgMwy46f8tI49LxckpYGE+g/wdpsMjFc+P7JXKpZhy97W5siSrJjb3+JTjTSxtooMh4oeYwidO00tFCfg5F3g+unTsP/iDKiW8aLcD/XjpjzdtwDizCKUDMZ6c1VhoG80GUAHN5UQ5jahJ9+FoZDR2AQkk/jnfo9IMECUbqgIXxu/9inegQjgGr4hV6tZpzjV/E7hUeJCrer22PvoPEKP10Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(82960400001)(6486002)(2616005)(8936002)(53546011)(31686004)(83380400001)(508600001)(122000001)(71200400001)(110136005)(54906003)(6506007)(86362001)(6512007)(107886003)(316002)(5660300002)(31696002)(38070700005)(38100700002)(4744005)(186003)(26005)(66556008)(8676002)(64756008)(66476007)(66446008)(66946007)(91956017)(2906002)(76116006)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGNBaVQzWXN3L3A2VG1lRWpvV1Z0NElJS3N2b2dmUEJicFZYRmZjWlRnVVc4?=
 =?utf-8?B?N2c3WitGbEVNZlJ3WExES3lKdkxKMm5weXhTZ3RXL2U1bXBKRmVQQ3Z3cEh4?=
 =?utf-8?B?Y0tBMExhUUZacnhBSm9PWVZodWVRMFJWL2RHL2FsM1FTWXhQa2t0YmRNRy9M?=
 =?utf-8?B?VXp3d3hQL0R1cThGUzYvZE11RWc3emtYM0QwNXpxWis1NWhPTitHSHdCZnRm?=
 =?utf-8?B?VnpYbkNmQ0YyM1diN3VSaFBvYVgwUHp6M2I3WUJCWit3RlU2T2FhcWJ4YVlp?=
 =?utf-8?B?dWJEaTF0TXEyNE42RTAxWmhLbks3SG51ZnQxclFPbXZGUjArV0tocnpVaXBK?=
 =?utf-8?B?b0cxMHl0TWJ6L2FOem9NU1dnVVB5N1cweVJRYmQ3eTN6anJCak42dmZkMHRN?=
 =?utf-8?B?bk1YTlpuYVNQWWNJYWo2Vk4wMUxSU3RUL0RqY2UycFJyR2NSSXMvd2l4VE0x?=
 =?utf-8?B?MnlwTVFKakNjWEJneGVicFlOZnIrazhJV0RIUlEwdzlEN1VKTFVhY3ZtUERH?=
 =?utf-8?B?NDlPM1F1d1FjSGFFODRValF4eWdqZmEvUXhQdlI4OTllY1Qyemxmdi9PRTVo?=
 =?utf-8?B?VkdEak5vNnJEMDF6aCtudWpuYk9GakFSQ0l1aGVUSjNLY3M1aTh2aHNzSnR5?=
 =?utf-8?B?UWVsdnIwZzVraWNMSUJUQUdZbXRrUHZTWWE0bHlaNUQyS2F2SDg4bFltc2xh?=
 =?utf-8?B?bDVDRTVmeWttUXc4WVdoRk43MHMvNmlkQlZVMzZ1S0xYbkx3cWFCay9FODRl?=
 =?utf-8?B?MXM1MFBHZ1pLMWpaNjh4UDI1MFgzZnVqRTd4UTgwOW43b045emFlWkNXZDdN?=
 =?utf-8?B?akk5S0ZEdGhNb2JRTmQ5cXZmdXV5d3A4aFR5YStHOHFiWGk0ZkZMWFVsUUR3?=
 =?utf-8?B?V2FkY0FHNnZhZjZqazNsNHp2bHpsV3FmV0R1cFI5ekEveDk3Z3JKUmNFSTJG?=
 =?utf-8?B?cFRvcGxNT2dMUTU1bUVxTGNaZUQzRGFMTEhKRW1WK3ZOY0I2UlplQjVjcDN4?=
 =?utf-8?B?Z093NGgvTFgxNmJ5V0NsalBaeUJWNGN0SUlsL2t5TWY2VFVSNTFTQlUwMUJK?=
 =?utf-8?B?RXJOajhjWWVYajF5QmZjZHNFNFZRWm5STHF1NjdXSVpsdnlIdmpPdmFGbVNW?=
 =?utf-8?B?YUIyRHR5azNHWVpmV09vU2t6dGJXWFhqTFc1NDBsTVRLQnVVOFZqZGlRMHBa?=
 =?utf-8?B?MWhqbnViR3JFeTdiQldERjJUZUZma2V1eGxLNUh2Q1IxOGl0QkpDblFqb1d2?=
 =?utf-8?B?TW52OVVPcHU0cVM0UHhsV1QwV1JQbGN0alBidmtyOTcyTVZyOWYvWmNOTkpl?=
 =?utf-8?B?UEtsR1d4VUM1S0lpVzlsNitLYzVPc0l2ak93Q2owRGphS2FMaXoxbTBrbDl5?=
 =?utf-8?B?WUhtS0ZXT0xkZmF3dGdpSW4xazFxRFI3Y2xIbCthMkZEZ28wQWc0Y3lZTXFq?=
 =?utf-8?B?Z2c1NlkzSEI0VFVHODBYTTl4N3I2M3lINjNWeGpXZWorSEFTNkd2QTE2M3hF?=
 =?utf-8?B?Zk9BYUR1TXd0NE9uQy94VG0rNjhvUGd2YzB0Uk9WSzZYRUZTNjM0Z29QM0Ni?=
 =?utf-8?B?TjI4RTg3ZzJhM0RrZDZYK1dia0prNktmQXNIZEpyQzBPWmFLZzVDSEZKTTFj?=
 =?utf-8?B?TEFiSHl4Ym0zUmFjS0NaSkVaV1Azc3RlcC9nVUZmQTROb0JGc2R3UCtpSXlU?=
 =?utf-8?B?UjN0cGdpbWhBUVVRa0tYU3Rucm9Pc21LWnlIV1k3YXY5UXR1SVh5aThvaWtN?=
 =?utf-8?B?R1YxcmdpR1phNG9hclAyem1SU0JPVzJLdWRkMVlqVk9JT1JySWRWeUZ3VGY3?=
 =?utf-8?B?dHdiOEkwYWpocDNpeWFFVU5PQUQ1M0oxdFpURUJnTWM2c09xMW5TOTRkMVBU?=
 =?utf-8?B?bjYxdy9RSmIrY3Q5L3VlQmVYalBPc0NxQUNMckMzTFZFcjNoRUg5MUUwUDRS?=
 =?utf-8?B?dVJKMDdsSzBkUmJzY3NaRnN6U0NyQUIxWmwzSzRDbklwNUcvSU9jc2VJTWc4?=
 =?utf-8?B?R2ZLK2pERGpiNlRjUWRGMXNiVTZBZllrMm80VHlnaWhRQTJucGNrWld3Rzlw?=
 =?utf-8?B?S0gzVzFjYlhtallMcm5DYkpwNC9jNHhiTW50TDBScnp2RVVFcVhDcGR5MnhC?=
 =?utf-8?B?Qm1oTEEydFc3MzI1bSt0Qyt0ZnRvdWJTY0sxK2Y2RHBaeThGYW96a2ltdk1B?=
 =?utf-8?B?eHZNSHdWZ3BIRnhMOFlybm9yRm5DejRBdmlQTnJwR3gvY21CaHMza1BiNHN0?=
 =?utf-8?B?UDZjOWgrc0lRYi9NSzhWZXdGTSt3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F720E199895F34CAA51EECC4B024B0D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e114ef2a-9688-4d25-577f-08d9fb85f893
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 13:18:26.8638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JcfK3DAHQWmU+TlubSce8lIZOjVzU1iyEWQVeIK0MlQLLG4coE0zwOv0sgaFB3+JAyciyOjFdTQXCOyOmdW5ahxi3Yy7gLWPL3o4eVP/izI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4841
X-OriginatorOrg: citrix.com

T24gMDEvMDMvMjAyMiAxMTowNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFdpdGggYmVkOWFlNTRk
ZjQ0ICgieDg2L3RpbWU6IHN3aXRjaCBwbGF0Zm9ybSB0aW1lciBob29rcyB0byBhbHRjYWxsIikN
Cj4gaW4gcGxhY2Ugd2UgY2FuIGZ1cnRoZXIgYXJyYW5nZSBmb3IgRU5EQlIgcmVtb3ZhbCBmcm9t
IHRoZSBmdW5jdGlvbnMgbm8NCj4gbG9uZ2VyIHN1YmplY3QgdG8gaW5kaXJlY3QgY2FsbHMuIE5v
dGUgdGhhdCBwbHRfdHNjIGlzIGxlZnQgdW50b3VjaGVkLA0KPiBmb3Igbm90IGhvbGRpbmcgYW55
IHBvaW50ZXIgZWxpZ2libGUgZm9yIEVOREJSIHJlbW92YWwuDQoNCkknZCBiZSB0ZW1wdGVkIHRv
IGluY2x1ZGUgaXQsIGZvciBjb25zaXN0ZW5jeSBzYWtlIGFsb25lLg0KDQpJdCBpcyBsZXNzIGxp
a2VseSB0byBnbyB3cm9uZyBpbiB0aGUgZnV0dXJlIGlmIGFub3RoZXIgaG9vayBpcyBpbnRyb2R1
Y2VkLg0KDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4N
Cg0KV2l0aCB0aGUgY29tbWl0IG1lc3NhZ2UsIEknbSBub3Qgbm90IGNlcnRhaW4gaWYgdGhpcyBp
cyBsaW5rZWQgdG8gdGhlDQpwcmV2aW91cyBwYXRjaC4NCg0KT3ZlcmFsbCBpdCBsb29rcyBmaW5l
LCBidXQgSSdkIGxpa2UgdG8gZ2V0IGNsYXJpdHkgb24gdGhpcyBwb2ludC4NCg0KPiAtLS0NCj4g
SSBkaWQgY29uc2lkZXIgY29udmVydGluZyBtb3N0IG9mIHRoZSBwbHRfKiB0byBjb25zdCAocGx0
X2hwZXQgYW5kDQo+IHBsdF9wbXRpbWVyIGNhbm5vdCBiZSBjb252ZXJ0ZWQpLCBidXQgdGhpcyB3
b3VsZCBlbnRhaWwgcXVpdGUgYSBmZXcNCj4gZnVydGhlciBjaGFuZ2VzLg0KDQpJdCdzIGFsbCBp
bml0ZGF0YS7CoCBjb25zdCBpcyBub3QgdGVycmlibHkgaW50ZXJlc3RpbmcsIGVzcGVjaWFsbHkg
aWYgaXQNCmlzIGludmFzaXZlIGFuZCBpbmNvbXBsZXRlIHRvIGRvLg0KDQp+QW5kcmV3DQo=

