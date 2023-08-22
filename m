Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D367844BF
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 16:54:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588541.920064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYSlP-0007q6-Dg; Tue, 22 Aug 2023 14:53:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588541.920064; Tue, 22 Aug 2023 14:53:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYSlP-0007ng-9t; Tue, 22 Aug 2023 14:53:47 +0000
Received: by outflank-mailman (input) for mailman id 588541;
 Tue, 22 Aug 2023 14:53:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u85s=EH=citrix.com=prvs=59133c41f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qYSlN-0007na-Jz
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 14:53:45 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aef8b34b-40fb-11ee-8782-cb3800f73035;
 Tue, 22 Aug 2023 16:53:43 +0200 (CEST)
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Aug 2023 10:53:39 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5181.namprd03.prod.outlook.com (2603:10b6:208:1e5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 14:53:36 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 14:53:36 +0000
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
X-Inumbo-ID: aef8b34b-40fb-11ee-8782-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692716022;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2EbZ4rJ9gZYNKWuXpq4J5/iZjOjNY0gk4nmVUhP8ugk=;
  b=PQ+MCdVQcxa7atkMccBPAExlSOTDrtRTComT0Y5qk6NVjVGIXFq0Str/
   /qoHJTFjXt8fPyamGZ3Oa2btrGp2VqTMG44p7I28KJVa7VRyd37oycqKk
   /1aQisxsAu9zy0ADGC9LVtXAS3xU8QbLhZPCbYmeo5Gi32U1X3eV4m2zw
   4=;
X-IronPort-RemoteIP: 104.47.66.42
X-IronPort-MID: 120144765
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:i0+BsqjOg/cgEsg25FYQGGfpX161QhEKZh0ujC45NGQN5FlHY01je
 htvXz+BaK6CY2D8c4x0PYm290hV65SGyYBiGwBvrn1mFyMb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT7AWEzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQldAEnPzGcqNuY0Z2/S+5en/R8I5jSadZ3VnFIlVk1DN4AaLWaGeDv2oUd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilIvluS3WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTuXhqqI13gD7Kmo7ITAxBEfquOOAgGWmaswcC
 FMw6AcihP1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+LqRuiNC5TKnUNDRLoViMA6tjn5YQs1BTGS485FLbv1oGvXzbt3
 zqNsS4ywa0JitIG3Lm6+laBhC+wop/OTUg+4QC/sn+Z0z6VrbWNP+SAgWU3J94ZRGpFZjFtZ
 EQ5pvU=
IronPort-HdrOrdr: A9a23:9scwBa+r6ewtqSmXY3Buk+DWI+orL9Y04lQ7vn2ZKCY4TiX8ra
 uTdZsguiMc5Ax+ZJhDo7C90di7IE80nKQdieN9AV7IZniEhILHFvAG0aLShxHmBi3i5qp8+M
 5bAsxD4QTLfDpHsfo=
X-Talos-CUID: 9a23:1ifegW9Gm4aPBjNnknaVv3NIK+p0U2Ly9VnBDEu5DlRweOKaGGbFrQ==
X-Talos-MUID: 9a23:0FcZqAQhWD9yc16LRXTFqRYzKJZx+Z2kI1g8j9YlpO2WGCBZbmI=
X-IronPort-AV: E=Sophos;i="6.01,193,1684814400"; 
   d="scan'208";a="120144765"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HyBBoN/C/KJMJ827tjDfGbZZHTXzHZ9djqw5H1rhiEQsxQbjKkSzSMVbe4QI+p10qFRG4PhZczR08mpmgBuWMLutoGqQolaXdT96ej9ApMxa2DWswom/yS0UnOb/R6BRipjrWI8W8HMXVZS3D/2TXRdGXppJSenCGaW5WTnOVkVM+1Zb2VsDFOjeEFXcYuwbOcx8Z/svethQRlde/OQo+EY6rIuMw2QS5WuQkSL6HIvgj6eUv8F8Jh+4phEjhXxd+rNtv9F2b2g4ngtnHtTU9LxFoMHGZo8jQ0hARlGTgWKJk7wNsRkl0j3MMvjQT1XyzQtVbhtDBXT+GqUTtBNGlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIO/0woE3ROzSflQqHF58TwkUs1PXZSon8/dyJQgys0=;
 b=bjBODkMEc0Yvp3zV4+RevKwjippP8hMEmPrIFiQg/GHpMOqBAT7KPd2nxmnE5fFzjlMGeYUjBpVLESPZD7g4uU6n/4OMJTjhZlidj6vuW5zYA/lSWjv1l7+qPOrsg+Yyf/hXNS/BUfpyBY5b+sDEYN9I52xjjfvZWF5mX5JD5/4tBj+QUnZnAsQChcqTfCo+wNxiqvvZCBi2RELjgkeo4xGbnxcdQSn8L+XaMa1grubRJXA225VXIL8WWL6aHJFDfj84xEKsjMGJvlF2HuiFZ2zlV68Z0jpSXYCDp3GzblhTf4k552MOsrITFGosrEPWROUvatta2WEvsuK8NwE2Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIO/0woE3ROzSflQqHF58TwkUs1PXZSon8/dyJQgys0=;
 b=mcDouKa9a6p+JQztK8G0BfAdAJjIKiTZZJsEIP99xKbDJSHRSC2y+9nWrpEpl35/EWaCt7IUZONwQA+6WnvhTSPwF6FnMBAN8+LdbwC8g325MUhlYR+nGjSPkX/KN13MSmGSKWNuZbGn+aRT61UM9uaZSqyRtAK995aIEnnh+OY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <599d0304-c249-b4f7-3d11-7b40339c6bcd@citrix.com>
Date: Tue, 22 Aug 2023 15:53:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/AMD: extend Zenbleed check to models "good" ucode
 isn't known for
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <ec9ee16b-71d8-9142-a314-0e782b481bef@suse.com>
In-Reply-To: <ec9ee16b-71d8-9142-a314-0e782b481bef@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0036.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB5181:EE_
X-MS-Office365-Filtering-Correlation-Id: e7113d56-3493-45ab-125a-08dba31f8fe7
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	44aktH/nyz4YXd5ABhPeK4BwsJmoEVBQG8LOo2BPTAetfdYy7S0Fto9/R3DufhWz7c2XXHNsplXRQDziOihx1b/owycPsU5zuTtsDKnwFwipdPu3eYViouc632pU5vr2EbZHQ81CHiCqvat0IEB3s8xJ5KnKZZyaW0RutFS0muSW4ffPOUxErWOLxKsIKesgrokz0xxzV6oRelVgpzsujvyDps6jrvABbSilcPTzrKwvh3NwVowNPpWZnhGJPGGc5TZl8t6OTaVEIB5vNM6qC65Zqdn3WvneA6rguUWf9JYheU11FBfQBmpkeeqacIGoKtnfwUu9+h41qF87iAYY8wdexL4vaZb3+SOF7IczGDUfZ95BqaPPEdPZweocnbz/Vh/7MTwc40XvuxEvY3m2heS6ddzhtEGLClAYUzAA/gAbsdceU4RptUZjPYwsA87+thIobqRMZ4wap2c9aWSmfx1SaxOhJDKTE6v4QgbCiEIVd/Ygh+3YmVFbtDY67e+MhJhyxFwxnJ2PC2gVT0I00M9U51f9eOCHrXXykEbskWzbwLMiIX3MpmvDqd9PrmK3nPFUmxlMEVjx2XzDCjkLI6raC+mjbUcFhvBuk4CuWYh16B/7flElO0z4ELP72SHaXwt+k3yos2GuqQ+/CzN15g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199024)(1800799009)(186009)(2906002)(6506007)(38100700002)(53546011)(6486002)(5660300002)(26005)(31696002)(86362001)(31686004)(8676002)(8936002)(2616005)(82960400001)(107886003)(4326008)(6512007)(316002)(66476007)(54906003)(66556008)(66946007)(110136005)(478600001)(6666004)(36756003)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3J3dFNDa3FRVzg2ZVhnWnhOQzVMUm5POTBoRXhiVnAvQTV1TDlYcGJBREtF?=
 =?utf-8?B?Wk5YdnMxaHdRYWVtOStqSXhYZ1BjVURaVXZnaWRmSFVYd05JaVZ6bGxmL3gx?=
 =?utf-8?B?bkhRc3NyeU1pSXBsd1hiY3N4K3dvTjlxSXU5UTZNaFl4R0dMY0Z6cUVseVRU?=
 =?utf-8?B?WFRiSXp1RWJGRFVIZnM5dVRvdUdIdHNjVUt1WjJFZGtsVXdCVUNtWTZkZlBT?=
 =?utf-8?B?YTA1UkdTa3JiWXl5NGljMHNnQ2U2WlRvVjlFU2lScVZjQ1VUaUEwdjZ2djRs?=
 =?utf-8?B?TnBkaDA3KzVMQzd1cG42bG1Cdm82YW1rV1p6L0ZQWU8zQy9NcUZ3a2ZxZFVs?=
 =?utf-8?B?Vm5LZFlUdXY4NmVEdU51YTArbWIzU0p1VEE3c0plTEpJZ3VBeDVqMS9PbWMr?=
 =?utf-8?B?eG9ja2c0ZCtxbXdGb0FqTjhaL2twQUVTaVRmR2lGMEYyclJEdFJocXQrNlpy?=
 =?utf-8?B?eDFLMzExS3Q4S0E3SmVrQTN1RmtGUGdoTTNDc3Vna2JvZC9FV2tYL2xvcDZp?=
 =?utf-8?B?M09oYWMrWisvT0EvbmlTUjhOSnZHTXF5Qkd3NVJUbjc0b3ZkaFpSWmFWaVQ1?=
 =?utf-8?B?RTlOOStFbWMxZDFzN3IwQ0hWWnR0aGx5VTJlTXBoUzRRMXR4dW9heFhXd1I4?=
 =?utf-8?B?b2RtdUVXYnY0cHhEb2NUUTBsaWRQcU5DZ2xNSTV3N0VrSWtIZEx5b1o2WkVU?=
 =?utf-8?B?MWJKM2cyUk0xTlJ5SVFWVkNBa3R6U0xPaUh6S1FLWkQwZXE3NlRGR1dGaExs?=
 =?utf-8?B?cnhqQzB6ZHhQMWFmY0pEZ280c05oNnpFanRMQWc5cTcvM01Wbm9TUG9jczJM?=
 =?utf-8?B?dEk4bDNFNGMrY3hqVFJRVnpBRkt3VUNNNHhyNm9xblZUSXpFei9pUGxOaSti?=
 =?utf-8?B?VGUxVGxIWXpTNzQyTHdxSjk2alFTWmtQV3lrY0lIZU0wOUxFRitUdnRHTDZD?=
 =?utf-8?B?dzEwR0szNVhHb05HVFpicGRoVWRqMWoxUVJ4ODNBSGkvK3diWWw5Rjd1VVR1?=
 =?utf-8?B?YnNsM0YwSkk5UDE1SlZoWWZYVHh0Ujc4cVA1b3R3bVZZd2Z2WWYrb0I0OUpo?=
 =?utf-8?B?cC9qQksxNnFWRmlEU0RiK0FuZ1lCdkJwakdoKzZscXhIUVAycGdkUFREUXRH?=
 =?utf-8?B?d0N1MXFJblM3TEZ6Y2RPZVRRbVAxTy9sZFI5d1BnOUovb0tXaWh5cVBvTUpM?=
 =?utf-8?B?TU1ObHoxWmhwUElTWDU5YUNxbjhkWGs3ekdNQnpLbnhRYkh0bWs1bnN6ZVFR?=
 =?utf-8?B?SVJ6VzJJTTBMTVFKaVBybVFrUEhxRkpDd0tNQ21QMmlDd3NMUmMvUzVOclFo?=
 =?utf-8?B?RDVzeWVVa0FncG5URXprY0YwdlZZdGRoQUtSdGNNV1lua0VIcXcxbGJNZy83?=
 =?utf-8?B?b1hlVVV0b2lVcml6NGVyclBEOGw0eU1EaEEwUmFDRDUwS2J0aUdNSTNIeUQ4?=
 =?utf-8?B?VjJWRThOZ21LUmFvOExLNUR0Q3hCeDlaQVlMcTdUaHNiN0w1SHZiL0dBd2tk?=
 =?utf-8?B?b2hwL1daMS9TSkhLT1JIUDhDUTd2dXFOSGdRUjlnYmNCbDhFbkZEczFCQXVY?=
 =?utf-8?B?NDZ6TWQ1UldVRUVzSWdOUXJCaXZtWVpRS041OUxUdmZ5NXdYb1ZWOTZjYlk1?=
 =?utf-8?B?RlRYWnl2aHF5N1NKd0pyZC8xMXZSSTRYZzhiREUzdUJ1aThZd2NlSmE2TW9r?=
 =?utf-8?B?M2x2WW5FbnBycVNoc3R5ZUluS3c5d24xVnpZbVVBWS8yZ3piUS9ySkxQMXJR?=
 =?utf-8?B?SXRHbHNERGNlOU5DWDFuT0xHOE9nVTZnaHlvRTI4QngvWlkrLzl5MVpWbUxF?=
 =?utf-8?B?UnJRTldjOW04L0Q2N0poN25OcDE4ZHFsOUdXYk83NHI1Vis5U2JlQ0dEU0RV?=
 =?utf-8?B?NFluclNCblZxeTdBN1NlYitRZzJtb0RvaXhVbVNieVh2ODJDU1RYNGNSd0xj?=
 =?utf-8?B?QVgyR3FoVUk1MWpobEs2NUFBVkdTc2lGN25hNGZvSlIvUXB3ZXZ4NXJFZWpP?=
 =?utf-8?B?NDlneUdEelNPQTQ5WVlmNjExbngzQm1ZempBOXR4bW5ZemxaSWN3bWtJZm9j?=
 =?utf-8?B?d2Jodi9tTHVTOXJDUy9VODh4V1p0T3ZLLzFuWjhtR1V0ejVOTGxKb3g3a2FG?=
 =?utf-8?B?Uy9Bdy9rekw1RmVlYjhEVHJlUzROenZMV21jQTF2STFPNmZ4MThHUys0TS9K?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AsXHZntOFOeid/mOUJGBWl6uZ/9O9tj28irK8sJLaVplkNG0bYxqrIQHFHc6AQIEVuI+iVTt36P0DU0PZLDu/AffP7hSZmX9TejaXwYJ7ThE495ym7IDq8j+dRnqRLu9TXJaXUndtxbeUP4HdyEOaxq5JQUpyYXbEdsuPCctruKNYAwt+q6IP7VmnagfYJNXp2n71k4VLd1eMVrYt6I2EZdkcbN9V2mOqngqZpLjtF2ffVVO9YZq08NEZjtEu2kUHelHKBH1nlxrfSoxXW3A2w/QjxX0guBKr3D1/0iAc3EXmjNesiXXRh6XhWUwW/gT51wFrgQBhooBFOLmpXJRBU47UQ7YgW4j4XrXwvabQAG266ejg0TXL1Vq/me+0Q0EKZhf9AzbjuYz6pnpDsiif8A7C9NyKHn1BPOKb4miq2aHOp6iBJf919CwoewRiwGU2faKqv9ruDSY62B4YAM27uJYAyG+cUMSO8oIBf11zjRI2Jk+n5wNJzljAivu1hdlJKtJATKWe3B5l9BTNPuhSeEIDflYJ5eObApoFuoe+o69IwsMT9hx2pFLwn2bjhDJYMxKHw28F8oU+hiOHyr5P09LJ20/xxEs6tF2TUj6lpgx10f+eIPpBfedTztgrcRlBvaoWoiOozZR89vE5TTydfD64ThAMfymxpuvKrOe/G0HgnuAIpJnHnxlyQv3uuYBhwA8EJRQz47366QQkzG5Nfc8/eHaXIozG0hDRbojmf0dhAjcdeCF9gq1vD5GZ3Yo4zP9QfDT/+2+H4fH5/n1QQk/mw5XYiBFpMkIF5bvthVP0HplEUYdMS2p+6jjnTeE
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7113d56-3493-45ab-125a-08dba31f8fe7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 14:53:35.9537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WDe0buRfgw++4DMPXZQNnwbYOjzdFx9Pkwogc42YfHipD1KqDo6GK3EhTH5gvVdFqN8UjYrvTw3J5i7jlGLjdktiKSvfZ9KuuR6QfoGSPWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5181

On 22/08/2023 3:22 pm, Jan Beulich wrote:
> Reportedly the AMD Custom APU 0405 found on SteamDeck, models 0x90 and
> 0x91, (quoting the respective Linux commit) is similarly affected. Put
> another instance of our Zen1 vs Zen2 distinction checks in
> amd_check_zenbleed(), forcing use of the chickenbit irrespective of
> ucode version (building upon real hardware never surfacing a version of
> 0xffffffff).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -936,10 +936,14 @@ void amd_check_zenbleed(void)
>  	case 0xa0 ... 0xaf: good_rev = 0x08a00008; break;
>  	default:
>  		/*
> -		 * With the Fam17h check above, parts getting here are Zen1.
> -		 * They're not affected.
> +		 * With the Fam17h check above, most parts getting here are
> +		 * Zen1.  They're not affected.  Assume Zen2 ones making it
> +		 * here are affected regardless of microcode version.

It's not really "assume Zen2 are vulnerable".  All Zen2 *are*
vulnerable, but we keep on finding new CPUs that AMD did for special
circumstances and haven't documented in their model lists.

Furthermore, there needs to be another sentence:

"Because we still don't have an correct authoritative list of Zen1 vs
Zen2 by model number, use STIBP as a heuristic to distinguish."

Or something like this.  It is important to state that STIBP is our
model-heuristic here.

With some kind of note explaining what's going on, Reviewed-by: Andrew
Cooper <andrew.cooper3@citrix.com>

>  		 */
> -		return;
> +		if (!boot_cpu_has(X86_FEATURE_AMD_STIBP))
> +			return;
> +		good_rev = ~0u;

While I hate to review like this, someone is going to come along and
swap this u for U for MISRA reasons.  Probably best to adjust it now.

~Andrew

> +		break;
>  	}
>  
>  	rdmsrl(MSR_AMD64_DE_CFG, val);


