Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB276BD644
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 17:49:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510739.789025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcqmn-0005Rl-Gv; Thu, 16 Mar 2023 16:49:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510739.789025; Thu, 16 Mar 2023 16:49:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcqmn-0005Oz-Dq; Thu, 16 Mar 2023 16:49:05 +0000
Received: by outflank-mailman (input) for mailman id 510739;
 Thu, 16 Mar 2023 16:49:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQdT=7I=citrix.com=prvs=4326333c9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pcqmm-0005Ot-40
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 16:49:04 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71fee1ae-c41a-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 17:48:59 +0100 (CET)
Received: from mail-sn1nam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Mar 2023 12:48:56 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA1PR03MB6466.namprd03.prod.outlook.com (2603:10b6:806:1c1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Thu, 16 Mar
 2023 16:48:52 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 16:48:52 +0000
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
X-Inumbo-ID: 71fee1ae-c41a-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678985339;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=qJ7eY7cq5n0dkIO1LmpSbeGh6jPrPirV1FAtrXJQ8OU=;
  b=exJxCRQ20LSf7wiggQupDxkf4T3MQjB2VtdD2R9CFjP7OgXorehJjR3D
   XdZcDalOaKR+mWecMUHQsD6eh8mDvIaOWqgtfYk8HD4+ziEWP4u8hFB2s
   l13GVA/uU62DrTo2VjT+gVyzaxRErcmPbeAv/qa6xQtGUtbHgo6HTPRoQ
   w=;
X-IronPort-RemoteIP: 104.47.57.45
X-IronPort-MID: 101152830
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RXu4vKwre3I7McZkZVt6t+fUxyrEfRIJ4+MujC+fZmUNrF6WrkUFx
 mYfD26EO66KZzbwKIt/a4i19B8Hu5fVxtBgSFRqqSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlPK4T4zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KThW3
 +08Ag8UVTes2O7ry6O+QOtnxe12eaEHPKtH0p1h5RfwKK58BKvlGuDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjeVkFEZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13raWwHmrA9p6+LuQzMNrjwTQnHUpUUcZZAW4/KGDkEnmVIcKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRtrbmURHS15rqS6zSoNkA9NnQebCUJSQ8E5djLo4wpiB/LCNF5H8adkdndCTz2h
 TeQo0AWubIXisIa0rShynrOiTmsu5vhQxY840PcWWfN0+9iTIusZojt8l6C6/9FdNydVgPZ4
 CVCnNWC5ucTC53LjDaKXOgGALCu4bCCLSHYhllsWZIm8lxB5kKeQGyZ2xkmTG8BDyrOUWSBj
 JP70e+J2KJuAQ==
IronPort-HdrOrdr: A9a23:cVv2DaCatJuP7HPlHelg55DYdb4zR+YMi2TDtnoBMiC9F/bzqy
 nApoV46faZskd1ZJhYo6H8BEDiewKlyXcW2/h2AV7KZmCP0wuVxedZnO/fKlXbehEWndQtrJ
 uIHZIOb+EYOmIK9/oSIzPVLz/j+rS6GWyT6ts2n00dLj2Cs5sQnzuR0DzrbHGemTM2eabRyK
 Dsl/auyFKbCAsqhw2AaEU4Yw==
X-IronPort-AV: E=Sophos;i="5.98,265,1673931600"; 
   d="scan'208";a="101152830"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxsfyPFp1l+9rLcDRXjxd0+6IvuATBqaCc0EQ4OAF2eHlCXfFkO1yCFQ3/ZA0iwKWYSyNy9CTBD9V38F8Y9JtTHZChnD1ISZb2WskPm4YG0fLL4C1k75ViNsOhHwkPoNPSBCRyJYam0qJoZ/2Qmcok5zJqqlod8Oid+J9O1lZmHV0MGVySs7E7sMMMnevOJwt1dmyJCuBMC7PYtoQUZK8AU3YUT/r0Qw0kJr5SJNGwObz26xMLWlAL6qxGUjNXPNi5ILypX7vkKjWRRKcgHvANKPSt2/VZdEUKfm7Z8Wj8veSx+Scvcxa9Mn+N7/AfDUQ/P+0fIWsGfqDhAoDbBSNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YumcMgAKEThHn4zM1e4lKexF4p7jX4+RpZNEnLvP8Ng=;
 b=cwIX1nxWIquEnYXIkwmnsaD0X5gQMYxGmGVmLukaNKcvS884CGnMaDhkXfxuEGJL4mnWf3CfnNP9bbZyg2wqQMRltTuMlZB5+tnUFFEMrCn7dPoA2B31KN1lvhpOlh7BurQfMd5d2iSJBGPpfpeWR5mLCy7HSKnaHbTcEDcGm/dMQW8QfzopYat7G8wmPHS8i4pNNXRHw60zxrHn946J/1aEyrbMD7oML1mKEe8fotablSoUnYyeF3gAuSLWy9NuKFV2omqyfSNQnA48iCxL/yhDGp2TQotEgUcb3oTKF7j0hb19Zb4LXjFYrc3M2Uw4CKheH+jQNuitcFlkXC90FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YumcMgAKEThHn4zM1e4lKexF4p7jX4+RpZNEnLvP8Ng=;
 b=QWfckIXoYOkSVu3kpPDrSfp1bmXo/JHOX9InYfD8AATlq1cm3E/1HRiTonkmD64Zip/FtSY/Hqtk3rnQdr+//1pqvZKrKl6LfpSr9BGGkcfB62X/XSTPbE/2ESc7dUwuMMNrQ7TFi9LdoRthRsux1wU/QKGtzmQ5XywZ8SrkBdI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Mar 2023 17:48:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 1/6] xen: add reference counter support
Message-ID: <ZBNIbhW3Eu07aj8I@Air-de-Roger>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-2-volodymyr_babchuk@epam.com>
 <ZBNBhS2I4XWkwXr0@Air-de-Roger>
 <dc31ee54-b6ce-3251-ab0d-487d9a9bfd35@suse.com>
 <ZBNGO7/NY0VQQM/f@Air-de-Roger>
 <8331a0c4-07fa-0340-20bf-77a5c8661aa1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8331a0c4-07fa-0340-20bf-77a5c8661aa1@suse.com>
X-ClientProxiedBy: LNXP123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::21) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA1PR03MB6466:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a438457-e57e-4b0f-03c8-08db263e5295
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L0GFms7iUSTC6TTliEiu+oX3RJc5d/Kb0TTIULfM0yee2dQi3/++zx8YCNUewKDUjbZd3MopCORqDSkFhj0S55wQhxmpNB3sJ17RrWLpA4TsbEs/XmqNjHioajRtw50sD6PgA3Xfe7MdRnPukxDdWz/dp34M8BzvnpW9AUl1Q+rmo8e0AOZaprf9oQ1Fy0r29w/q/rs0CLzlCS1WYPXxqSR+9+DEcODi3XJJJiYoOjm9oeoCOJkFm1RYnyWlYaASVoSURo3/RWBqZmnvqDewaWYatEPe36sWe8ovt7gnuHECdRjjJfmasaWxBCSeLqVrbO8OWFOxBY8ylbRrq+tIX8wfpmIAdjifCLUvCjdvtQOQRiCHK+shWqS1p/H1v9ZZ/CdDCebwyTwTclCuDocWru2m1goMseJSuUqlP2fU65dSWfBbYKGPo1+Yei2uZ5CTyQsPobhW3GTzbLDlNrgySudhY6qSyzhhQHZ/AvCK+/LZzTFfmL4W/VGxESKVG76R/ymhAdGxQjmozVCUGKwE1h/m4Jy/CKa34UyYL+WRhytyYnTMVtLZeddy91wW9DabexPZgdgZFu5HjTCD1bl29cl2RqvjbqnxK0srghxnOG7A1fxtHUUz8hnCZJ+eIAHpXsvmz8TuIZr6//Gkvt+EUg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(7916004)(366004)(346002)(136003)(39860400002)(396003)(376002)(451199018)(9686003)(83380400001)(8936002)(54906003)(85182001)(26005)(6666004)(6512007)(6506007)(53546011)(82960400001)(33716001)(478600001)(66946007)(38100700002)(2906002)(316002)(4326008)(66556008)(6486002)(8676002)(5660300002)(41300700001)(186003)(66476007)(6916009)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXFyUlFrMkdJS1lTNVFleWdzWWhOTXhpYmtoN29BMTdIT1ozdEx3RUJIQTVW?=
 =?utf-8?B?bEJyUnRhYkxHcXVBdWRmQlI4U3ZqU29SR2hwbWJlQVdzS0VIWXpaWlFaZEpv?=
 =?utf-8?B?U2xaTGJsc1lETFYwVFprdXdpTUdMdEhQdHR1RytieUY3SW1YWlQzY2poV05O?=
 =?utf-8?B?RExVUnkrSVBwQkVZS1JqSDFaeEdnY2hPWWJ3K2hrb042K1lYMjN1S202U0lI?=
 =?utf-8?B?bmdkWmtSWVFZYzBUZGNHN2ZTaGpDK2pGZDFsYXR3MHV0OXZERVZDeUo5UXRv?=
 =?utf-8?B?NDRwbHJmVGllTTNaYnNGVmpVWXcvUkdHOGlKdUN0ZkpDbWNqVVMzRXNXc2lQ?=
 =?utf-8?B?V2RnUEF3OWdYOXpzSDlXbUxlL1RUeGMzdTd1TG1UR2tJYlJEdlV3MDV0Ynlq?=
 =?utf-8?B?RTRHMDl0N3NZVTNTU3BYOC81NzRBdk1NdnoySitnd1hTNWVTSXRROGpxQUVN?=
 =?utf-8?B?Q09JKzRsYXlESnFaem4zL3RwRjBjcEo1aUpzTkNHK1hreDdoM2dDbE1BUHZt?=
 =?utf-8?B?aVcxaExyak5vSzdtMGs0SW1OSjk2N0xhaVlvelFsNDMyTU53TlJmblQ3V29J?=
 =?utf-8?B?VXVpajJMNm9YZWJWT2k4MFhvcU1tTWJvelA5M2VnQmErNG9wampBdjR4Q2F1?=
 =?utf-8?B?ZGhOZzhGa1lPTytwK29HdHl3RlpzNlVnbXcyeERWb1p2SUR4dVJGbE5acXRQ?=
 =?utf-8?B?WWZQNXJhcU44UStNTERSWS93R3JFNVl0ZkhvQk1VeVZxUzdJY3dsa2krRVF5?=
 =?utf-8?B?NXNWMFQ5bmRXcnlKbitzcFNjaEVjY0NCa2ZPZWxjWkQ2WGNYZU1pdUo2VlQw?=
 =?utf-8?B?ZkE2MGdJSmRGNkxUTXU1MTdzZGFkcVUxQXRJYlp4T1FpS1B5REYvSzAxSWdO?=
 =?utf-8?B?MWhjU1UrdUYyRGVrajV0ZTJtRHNSSzZGbnY3U0JyN0MzWmlZVnM1K2NhSnBu?=
 =?utf-8?B?VXZnZWRuNXJDcWdLaG9GL0ZkRk5hSG5RY0Rja2VPYmxIUGY2SWF6Vm5Tb0Zp?=
 =?utf-8?B?WTJld1pCMjZ5RXg1T1Z4emhVdm5GOStkenJhQ1ZFRitkTTNlbTlFNSs2bng0?=
 =?utf-8?B?aVlLNHpmWEs2MVR5eHUxb1g5VDM3SEdGK2szbmhOTytEYjdNRDRiQnBKeDdl?=
 =?utf-8?B?SnJFcjBJZnFJbjV3LzdMNkl3WjV5QWlaSEVMTkEwL1J6dS8rbS9WdGFNWXVo?=
 =?utf-8?B?cFBkL2daaHB6TWFaejg5S2lWa1RhY1IrQlNYRGFzaFBjeGFuYXI4VzZta0JL?=
 =?utf-8?B?U0E4VFhLcUVBbjRrelpVM0FCZ1BVQXZOZEpnV3prM09CeTZJZGJ1NUdMV20v?=
 =?utf-8?B?cWpmN0NYSU9KOEJVSzlPOWV4OHkzMktZa3ZEZjM3Z3hvSVdTTGU3Tm1tUkRp?=
 =?utf-8?B?ZGJvNXliT25xaW04K1F0YlZQU1BIZjFKM05tVlBGY3NFMXJCRnRSQmRpd3lz?=
 =?utf-8?B?SWsveFFqVC8rYXR0R1VBZHdxeXRFZlIzWi9EMDl1cG9MTzViR1BBU3h5Z21V?=
 =?utf-8?B?aW81Rm9zRDlxcExXcjljT3JsQ3dwWmFLSFpiTnJTMGNyd3F4cTBxbmhWb1Ev?=
 =?utf-8?B?d0V3eWJCdHZUZnMvekRpRW10YlN2djBSMjdJRXZGQ0haWkk3dGV6SzFBYjA0?=
 =?utf-8?B?eWlCNFNhN1E4djhiQkNKNmRrQ0diQ0gxdEZNWXRsRVFjMTFxQmNXdWxabmpm?=
 =?utf-8?B?UFB4bVJWK0c0SUtlVE96YVI2NldUVCtrUS9iaDcxbkc3djd3ZzBGQ1Z4NGRq?=
 =?utf-8?B?dTR6OTVXSmVpejYyQk1LV3phaGtTOWxTank4YnFaWDhja3ErUHVTcU54TG05?=
 =?utf-8?B?RDRNNzBZY25uM3Z6cksyajVpU25ERzlCcXJGMjc0RjRMTjJJQ1VUWGpnMmFH?=
 =?utf-8?B?VCtzbDBGUWtmdE1ZNUp5TEx1aGtLMVYrQjdGWkVHK0I2UDBKZjV0dE1Cc3FR?=
 =?utf-8?B?dWxSMWxaRW0xcWhIZWl3YURPWS90bjBXUXJ0MTg3cTE5anhHT1E2MktHM2xP?=
 =?utf-8?B?ZGtCNFVCZG83QmtlcE5GWnlxMHd3T1dYczYyMkF2bFV3U2x4S1ROMmFYTUFF?=
 =?utf-8?B?MkNEKzNwYWxVU3Z5ZWVxbkpiNU4vWGJGMVFrQzdISlZyVTBac1hiM0lrRzZU?=
 =?utf-8?B?WGdDTHAwNzZCOEc1emNwYnZxVkFGU0ZNQ3Uva2R4Uy94b0FONkV3VW5TL251?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BaRRM4Y473cJ1wOXvGUOO2zVZuCMUy58XIsOM6CDFzkLCRhYwL7GUmBBtaqw7/RjL53I4gd2smxIe9DFUI25475xE+zk+5OeUz0RKieqEnV37lKJzfG8R2Xo1qcMzfZoiJhVmWR95GDfjQWLFDJm+ugichBCq/SFg9P9qaupl8sfZ4cutDNv0WxPPSnAXq86InrmWHSxTki6Sfc7jTB70geV6V523aw3LiK/RcAb3WBd/tWRrORKPZNhzvU2PPQt1Mx/T/5TV81HnKdes3vl9Ri4waX1BqPPgdDaVewFv7+uwrNLW5wM8q33ZqutLqgJQx5EF+f2eHL4wo/G5MZ8/xRovQhi3p5CWQnwz59Opq9rEL4MZKRMij0K2S94tRNFhviO33xxmWBVmqAom6zuZBZH8XxIId30RoY7xeDrJmUkwMx0IQbXZln2XActRPOLZ7ojEeHjK2j9ne4YrHnu9Wq2qNB9tmC5evFPT2i4tYQWOTQJzOIymdMCHSyDaD6jJFDdMryFUReIgdc41baz7RYWdkhFiAxPujbi94t55HksS2RI8TriJX5RepxjTvQBs3DCOShOi1VgeClrJyTK0M/q9SNNhmvQJUOAfPsgHjA1OVFjh0xZoFjlDh4ZcCbs2TntMno1vmdrggZlyJiK6VzSUnzJ7xmj/EUPBD9CSNX3pw9M2B/61COM0i1Kp6NNdmONwBQbQeFTddjnNPIvsbng/E5CoLrDsGTJeNUfDEf25iod6e4fdVb3CpIsz3EE4vKzckenkbGgU3hTFqdh/UF/LbCUWjXfGYP7bLqB/OIasGwHxsnxiX6Qev55NlQrRqwHGMVnDXlN4tAOKV/7JWbo25SO/NzfCIAt5qhKfrP7KK1zstb5sanLDhIErWg4
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a438457-e57e-4b0f-03c8-08db263e5295
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 16:48:52.1038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Abdpi/V0a1ArGe4UcTjEH0J/subyhbp5aqoTNM/XgSVrqvByzo/8ePcE8CREVj2TFFuNbWUKvKIS0pla6hA0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6466

On Thu, Mar 16, 2023 at 05:43:18PM +0100, Jan Beulich wrote:
> On 16.03.2023 17:39, Roger Pau Monné wrote:
> > On Thu, Mar 16, 2023 at 05:32:38PM +0100, Jan Beulich wrote:
> >> On 16.03.2023 17:19, Roger Pau Monné wrote:
> >>> On Tue, Mar 14, 2023 at 08:56:29PM +0000, Volodymyr Babchuk wrote:
> >>>> +static inline void refcnt_get(refcnt_t *refcnt)
> >>>> +{
> >>>> +    int old = atomic_add_unless(&refcnt->refcnt, 1, 0);
> >>>
> >>> Occurred to me while looking at the next patch:
> >>>
> >>> Don't you also need to print a warning (and saturate the counter
> >>> maybe?) if old == 0, as that would imply the caller is attempting
> >>> to take a reference of an object that should be destroyed? IOW: it
> >>> would point to some kind of memory leak.
> >>
> >> Hmm, I notice the function presently returns void. I think what to do
> >> when the counter is zero needs leaving to the caller. See e.g.
> >> get_page() which will simply indicate failure to the caller in case
> >> the refcnt is zero. (There overflow handling also is left to the
> >> caller ... All that matters is whether a ref can be acquired.)
> > 
> > Hm, likely.  I guess pages never go away even when it's refcount
> > reaches 0.
> > 
> > For the pdev case attempting to take a refcount on an object that has
> > 0 refcounts implies that the caller is using leaked memory, as the
> > point an object reaches 0 it supposed to be destroyed.
> 
> Hmm, my thinking was that a device would remain at refcnt 0 until it is
> actually removed, i.e. refcnt == 0 being a prereq for pci_remove_device()
> to be willing to do anything at all. But maybe that's not a viable model.

Right, I think the intention was for pci_remove_device() to drop the
refcount to 0 and do the removal, so the refcount should be 1 when
calling pci_remove_device().  But none of this is written down, so
it's mostly my assumptions from looking at the code.

I have some comments about the model in patch 2, I think we need to
clarify the intended usage on the commit log about pdev and refcounts.

Thanks, Roger.

