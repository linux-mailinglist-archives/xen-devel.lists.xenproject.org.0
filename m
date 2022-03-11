Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C324C4D5D12
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 09:12:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288834.489898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSaOA-0007R0-SY; Fri, 11 Mar 2022 08:12:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288834.489898; Fri, 11 Mar 2022 08:12:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSaOA-0007OK-Nk; Fri, 11 Mar 2022 08:12:42 +0000
Received: by outflank-mailman (input) for mailman id 288834;
 Fri, 11 Mar 2022 08:12:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RXIo=TW=citrix.com=prvs=0626a3ed1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nSaO9-0007OE-KI
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 08:12:41 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02b8664a-a113-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 09:12:38 +0100 (CET)
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
X-Inumbo-ID: 02b8664a-a113-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646986359;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=HeqqydfsS+PmwFlAbqrMgGh5Ib6STse+DUpnMAuX4OQ=;
  b=c9LaL5KlSFcDJQz3MlcidA6iqO58ojfH2ABu5E7fuQzOJb9h5QSuP7vJ
   Nzuf/dwaWYKJqzvsteQYdeVgwd9MM2ZNCCCh+2dzfHJ0nGThAI03+9iac
   HMEyE69vYLU+XoUr8HTn8B2EOlt6DkjvpVz66nP5uU7Rh01Bl2pQE3gHP
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65998669
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:eUCbaKAXMLtAMRVW/x3jw5YqxClBgxIJ4kV8jS/XYbTApD0ngjYDy
 GBOXG+Ha6yMM2D9Lt9/OY/l8kID78DczN9jQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vg29Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhw1
 fsXnraZcTw7O6/SvL4ieQAbSSxhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGgWZh1p4QTJ4yY
 eI3ewo0Uy/tfiZseX06JJs6s8uTmSLWJmgwRFW9+vNsvjm7IBZK+LTqPdDYfvSDQMxHmUDeq
 m+u13T0BFQWOcKSzRKB82mwnanfkCXjQoUQGbaksPlwjzW7xGYeFRkXXluTuuSihwi1XNc3A
 08T/DAnoe4t9UioZt7nVha8rTiPuRt0ZjZLO7RkskfXkPOSulvHQDhfJtJcVDA4nM4ra2YB/
 HaxpMHsByJL6oK/UDHH+6jB+FteJhMpBWMFYCYFSy4M7N/ivJw/g3rzczpzLEKmpoarQG+tm
 lhmuAB73uxO1pBTi81X6Hia22rEm3TfcuIiCuw7tEqB5xgxWoOqbpfABbPzvacZd9bxorVsU
 RE5dymiAAImUcDleM+lGrxl8FSVCxCtaWy0bblHRcVJythV0yT/Fb28GRknTKuTDu4KeCXyf
 GjYsh5L6ZlYMROCNPErPdPqVJt6lfC5S7wJs8w4iPIXM/CdkyfdoUlTibO4hTixwCDAb4ljU
 XtkTSpcJSlDUvk2pNZHb+wczaUq1kgDKZD7HvjGI+Cc+ePGPha9EO5dWHPXN7xRxP7U8W39r
 ocEX+PXmko3bQELSnSOmWLlBQtRdiZT6FGfg5E/S9Nv1SI9QTB/UaCNme19E2Gn9owM/tr1E
 riGchYw4HL0hGHdKBXMbXZmabj1Wo14o259NispVWtEEVB6CWpzxM/zr6cKQIQ=
IronPort-HdrOrdr: A9a23:S/nAuaohS/uz4NafxIP1ZksaV5vHL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QDpSWa+eAc2SS7/yKmTVQeuxIqLLskNHKuQ6d9QYUcegDUdAe0+4TMHf8LqQZfngjOXJvf6
 Dsmvav6gDQMEg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/iosKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF6N2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCulqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0BjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXd
 WGNPusqsq+TGnqLkww5gJUsZyRtzUIb127q3E5y4OoO2M8pgE786MarPZv60vouqhNCaWs3N
 60QpiApIs+P/P+UpgNd9vpYfHHfVAlEii8Rl57HzzcZdM60jT22tvK3Ik=
X-IronPort-AV: E=Sophos;i="5.90,173,1643691600"; 
   d="scan'208";a="65998669"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iFaPO0e8UAUmOC8VrA4+2l1gpDEoBybsMpi1WPm2eWRH34TOdmT1xBdDQmTtONNsEKsX8h+/3a372cO4exqGEnVZbU//tafbeqS1SPCWDd1o2XvDSH1Nh/OV6B1u+85hN3STtSbJnk/ls0YLN+IMtUD56UNr5dGdg7yqkoQsLYpgSziWHl0cMsIC1mWX34tlFqKS2ZEdzH3/gHIhoYqz4qThEQR8bVj2caeQnueO9DOU1O1fu8Tqj7sjqvZTv6XyddROXYwP88QzkSICAO0PNNpoTAqBbxNMllp5Fqm+Y/hBLfvx1sKgW5yoZJ5qFtCDlb/PsShhn5pwWfAEZOsn6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hqj1Ct1vF/IdmNBlplv5XpzFFposBQj93hAh9uGH5E0=;
 b=enFpNX9J+YhiTcjxCjiHZ+r8OYjo8zOUS5pPq4vk7JSiHLmU4Q/8iznj4IwZID3BzUSD+ql0t+wObnbN0uLMtNL3xMp3mWSRaD21Z7vXX6i0EcraXi5pZ1kNP41hFQ0QsSnFF+3EUje6XNZF0CrSFMftuzC2wLkk8Mox2eLnmY7BkZr2DDex8B5KscKnuz6KXt+K7r2VoFnPvV6+2+culbqIcfLNYs5O9CG/wzDHQ8D3gCkPRUQ0gJThD/fOpzZTgiIKUepySQ+hI0Y/1xBEvBW52b0sTcSG/ALYl2s0jIXdqhWARDBo6Ytnwx5eiXWltBw59WApKG0dod1xynkQqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hqj1Ct1vF/IdmNBlplv5XpzFFposBQj93hAh9uGH5E0=;
 b=qHRTdNFfqTpEzDx928ueNZzHaTJOjhY6XdwSXSD69MmvSZ38AiWa9F7pjNbFdSEWrfq2tYI3KqOIRpg3aMSimNNHp3wfAs7B2sOLl85/hC+ovzj4T7cBUXGlbE48ano9czFZVqWo/9OBNuqxoGxq35mWtavpCJQX2IyTQq4yEDY=
Date: Fri, 11 Mar 2022 09:12:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, <doebel@amazon.de>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/3] livepatch: correctly handle altinstruction sections
Message-ID: <YisEZ2gYrVIAozYU@Air-de-Roger>
References: <20220310150834.98815-1-roger.pau@citrix.com>
 <20220310150834.98815-4-roger.pau@citrix.com>
 <2e2781eb-2c62-1c93-ef8e-75054a213fb8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2e2781eb-2c62-1c93-ef8e-75054a213fb8@suse.com>
X-ClientProxiedBy: MR1P264CA0140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::6) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 044567c5-6937-4a05-6e32-08da0336e1a0
X-MS-TrafficTypeDiagnostic: BY5PR03MB5252:EE_
X-Microsoft-Antispam-PRVS: <BY5PR03MB525222640DEEE5755AF1213A8F0C9@BY5PR03MB5252.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KfkH3Vh8MjOlUg9VFe8sOeHOd8ZBjCt6UaQqpx91kl6aXYooTvgiwQYzznQaWroADK1cfEBLQfioBTIjaCx5uXm2tuvokDD4m7FkTTrHTBAu/BSq145Uah/xTv2vCH+yKRMUYSZCfxXIaI/r/KG2YgCQYUd/isDc7ed8b5sXOPzeHpBcOnAw20OC6MFXn9baTQH4nM4mEWBqFYlboeLSpZdlN9BMzUc7rPVBjvtv3Gs6NHbm9lNZFunfRVLONVpFTXWN5f46YhvhKWjtdFW5OTwApsat4FRxlrvYjP/RrGOXzhlo5cIajQE6TpYtMAOi87QaPoIe1JB3aXPLEOikxuCpuoeZlEdgFpySM2Tj2ExSy9ZqyRvQiT+YIstrf5qy5MWQY1vKYj36j3xvZT6xzZ/GtGugNFBiJgGsJQfBfNy+gPUiPBrSZcQfuHAxW3GryvBrfubmgy9gm7sebnEeJjER7uAxjgAoOLnaQzNsVba3rwZ4AiZS0PcCVFlO9cTOWjTedTVt1OC5M2poQGPm5/YRxewjB0RAIGlMFZC35KnVEHjpCZVGnLvMMSsuyn2J64x1gt8RGrZ9i01pVWU/97tEAn3/PGtfPI/aXThBaJo+rF1H0nXVS1elWf8/IPDPUjTUdIsZsbvHHLImX+K2YQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(186003)(26005)(85182001)(54906003)(86362001)(33716001)(5660300002)(38100700002)(8936002)(83380400001)(6512007)(66556008)(66476007)(2906002)(82960400001)(6916009)(8676002)(316002)(6506007)(53546011)(6666004)(9686003)(66946007)(508600001)(4326008)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mm91MHdFNWhUaS9Qb0t6d2J1emVMOEIvYnpLditqSWZ6aWkwZm5CcFE2YXRH?=
 =?utf-8?B?eEtCandMckUwQ3g3OW9jM2hmVFdTTjNIOGRUOThQTktDMFF0aE9ZakFzcjhS?=
 =?utf-8?B?VVZZVEJFZHVOdUpLYjJGUEFHcE1XandPWG1LMFd5OGJ1TjI0d0JMZEpxMnFl?=
 =?utf-8?B?SVBTKzB1SWJEZlBzN0lZbWFsNUhJbnd1Q2JOanlFZTl1VkVLTnVBSFRtM25t?=
 =?utf-8?B?UUdtdVF4OUR5NXBHNkNhUmtLNlR6VFU3cDhtb041cklwcWdKWU5xL0NpUTZm?=
 =?utf-8?B?S1NGZGJ0b1puSzdXNHJmVzZiUWs0SkdXZHZCampPSk1FYXZkbDdtNUdzbmxm?=
 =?utf-8?B?dW9XanRvbEw2SFJMVmkxS25GQ0I4MEpZS0tKU3pLb3gvdXU0bUYwek5WVjQ2?=
 =?utf-8?B?QnRmZjl4eVh1RVdHWWtuUW1oeGNBWGY2WFlyYUp4MVBTUzNWL0NUYmg5YTRV?=
 =?utf-8?B?SzdNVW9mUzFzVlgwdEY4YkhEV1FDVlFQRS9FNkJmSjdKdkMwS0JTZDdGeGhI?=
 =?utf-8?B?QjV2VzBHNS9ScGYvSkpZTWNwU3BIU2JPTUZwbmZpVll0em5hUDNtWGZacE1M?=
 =?utf-8?B?M1lFYVQxdUtRSnpNNjNBdXl2dDc2WG1Zc0xVMFMrQ2J1ak1rSE1Oa2tUenZm?=
 =?utf-8?B?VURlOUtmK21kQUd0dStTd3FPd3BBUVRNNXh4ZytqQlArOWxnM1pzYlhsSjND?=
 =?utf-8?B?cmJuamxFUlZIOG5OellBaVlIclZkWHhabmJDcm9LKzlZTTM5UFhtM2F0bHJ4?=
 =?utf-8?B?Sld5RytReksvNWdtd1lQclpYRll5R2VVaVVDMlF6UE9ta3JEWUdmQmRlTWpK?=
 =?utf-8?B?RURjd1BkcSsycVJyODJMbGVBWHpXWWN2bGs4aGhwOVFPQU5qaVU1MXhGaVl4?=
 =?utf-8?B?eW1RWU0zbmZEamVOekZnV0dqSS9NMzFtQXBXaU9KNzNheVhicXEwZHVTMkdi?=
 =?utf-8?B?YU5TR2FYMjJLeTNrOWZOOWMxSmN6NG43UXhnQkRZdGFzTlJIUThpdHA0UHBl?=
 =?utf-8?B?ekptM3I2akNNRmN6MGkvb2JYaW9qTG9oNVIvUHhBRVVvMTgvSGc1TkFxOHdB?=
 =?utf-8?B?UWg2aHh1eC8zWkNYWnFFSWlyTjV2dzdFTEhuSDhBVG9ad0NBZHk1aG14alQ5?=
 =?utf-8?B?bHFRQlh1eURTYVhGTUVRSjBPWUxqQzduNGIweFl4bC9SSEs1K3lnbkszRWVT?=
 =?utf-8?B?ZDZzRHhZbTRzenBQZ2V1UkcrdnRCbGZtZXFXK0p2NFhheXRvdzExS0Q0TDRS?=
 =?utf-8?B?cHgxZ1pUc09DU29mNElqQ3Ixa3dRdXhBaUhndVNJWENoMWlvcEFETy9HeWls?=
 =?utf-8?B?ZFpVQkRRcXRjdWdhOWJqR2pyWnkvc0tYc2VZLytqdlpFRC9FaTlVZ3pla2Na?=
 =?utf-8?B?TFNxU3FtU0Q4SWFBOW1NR2w0WVF4VVlOWmlnK2pSR1pFMUpQaTh5RTNSZjRM?=
 =?utf-8?B?dHoyV200enFLa0w4QWQ4eWxIVEpycS9lWnMyTlJOME01aUtTTVZrKzg0TWcy?=
 =?utf-8?B?ZzVIYjZxTVBSWXN2Ukw1dWZsV1pxZjcrL0h1eVZhbENOTlo0KzJpcjFpZ2hw?=
 =?utf-8?B?c1Z0Q3JVNzlXQWQyZEFhcEVSeGl4R3ZDc0Zuckd1MG1WUjROU00xRkFFZkoy?=
 =?utf-8?B?TDltL3Fnak9KeFBLR01ZQmNsckRpSFBQelg2cmxPZHBEU0lVWlBLcHNtcFNu?=
 =?utf-8?B?ZWFJZFB3SERSZHlvQ0VubGZ2TlhKVWgraHVZM1A0S1VwLzhNSURZa0pIdnZ1?=
 =?utf-8?B?N0QzWDVSbGNwd0Vvb2UrOVFGYWdBSHBWRlBOTzRmYjlLZGJRMFVTQTJObjBo?=
 =?utf-8?B?ZDJnejRRUk0vNWNzYWg5cU1QUkJrcWVvWUc0ZFpCS0RoL2ZKMkpCTlFFa0I1?=
 =?utf-8?B?cmNqenhmcmo3UEg3U1VTTU80YlNtU1plMXV6ZnhGMklEbTBFamsrem9ObzY2?=
 =?utf-8?B?SUdaOHN4ajNScUorMnFmbFZZN0hCekNpck55aUxBNzVleUY1a2NROWlWcUNv?=
 =?utf-8?B?aVRZcFdqTXdnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 044567c5-6937-4a05-6e32-08da0336e1a0
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 08:12:27.7207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJNmSC7LNv2db85SQq9WfiwzefkardX/GiFE14r0MPcof8EIcBGdxkNd0VB8GLba73KFuzwCHoA93uD3RIoqEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5252
X-OriginatorOrg: citrix.com

On Fri, Mar 11, 2022 at 08:35:18AM +0100, Jan Beulich wrote:
> On 10.03.2022 16:08, Roger Pau Monne wrote:
> > --- a/common.c
> > +++ b/common.c
> > @@ -249,19 +249,22 @@ int is_text_section(struct section *sec)
> >  		(sec->sh.sh_flags & SHF_EXECINSTR));
> >  }
> >  
> > +#define SEC_MATCH(n) !strncmp(sec->name, n, strlen(n) - 1)
> >  int is_rodata_section(struct section *sec)
> >  {
> >  	return sec->sh.sh_type == SHT_PROGBITS &&
> >  	       !(sec->sh.sh_flags & (SHF_EXECINSTR | SHF_WRITE)) &&
> > -	       !strncmp(sec->name, ".rodata", 7);
> > +	       (SEC_MATCH(".rodata") || SEC_MATCH(".data.ro_after_init"));
> >  }
> >  
> >  int is_init_section(struct section *sec)
> >  {
> >  	return sec->sh.sh_type == SHT_PROGBITS &&
> >  	       (sec->sh.sh_flags & SHF_ALLOC) &&
> > -	       !strncmp(sec->name, ".init", 5);
> > +	       (SEC_MATCH(".init") || SEC_MATCH(".text.startup") ||
> > +	        SEC_MATCH(".altinstr") || SEC_MATCH(".ctors"));
> 
> Having dealt with this recently - what about .init_array? Modern gcc
> prefers that over .ctors. Of course the question is whether either
> really needs dealing with here - these sections, to my knowledge,
> appear only with gcov support enabled. Not sure that's a case where
> livepatching is actually expected to be used.

.init_array will match the .init comparison, and thus is already
handled.

Regarding .ctors, it's certainly an .init section, so it doesn't hurt
to get added here in any case? (regardless of us only knowing it being
used for code coverage so far)

Thanks, Roger.

