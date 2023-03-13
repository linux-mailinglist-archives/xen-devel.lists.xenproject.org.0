Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F310F6B765F
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 12:44:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509241.784639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbgao-00056N-Tr; Mon, 13 Mar 2023 11:43:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509241.784639; Mon, 13 Mar 2023 11:43:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbgao-00054H-Qq; Mon, 13 Mar 2023 11:43:54 +0000
Received: by outflank-mailman (input) for mailman id 509241;
 Mon, 13 Mar 2023 11:43:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=koCJ=7F=citrix.com=prvs=42903c55b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pbgan-00054B-Gc
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 11:43:53 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50cdec4b-c194-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 12:43:51 +0100 (CET)
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 07:43:42 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5652.namprd03.prod.outlook.com (2603:10b6:208:296::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 11:43:40 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 11:43:40 +0000
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
X-Inumbo-ID: 50cdec4b-c194-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678707831;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dauAYSF4WmKzQl27JFDuDk15XLDfaLXDZ6TKhNv577k=;
  b=CEDI2yHLRr0SZuNOHCOVu2+LYPkEV/x7oU9TGtocbyW4AIZAW8ncwoah
   vIyh4BiO6Piq/LIUWIQ0vuc9ps/7/TtJX9ccMLko0/F/f7v0kK1wQk2cG
   HZ0Q8pRO217hI9NLFLUAW9T8hN+AgM9FKrvB7SIgHSPiYgAWJxY9f2nRo
   g=;
X-IronPort-RemoteIP: 104.47.70.109
X-IronPort-MID: 100499907
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ELt4MKkay5LICaKTrrURaEbo5gy0J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbW2zXbqmJYWr1KYoibd7n/ENX6MKEyoMwG1Rr/H81RCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5QSGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eIzLBUhSjHeu+2z/LOwVMdF3ssAIvC+aevzulk4pd3YJdAPZMmbBo/suppf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVk1Q3ieC8WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTOXkp6872AL7Kmo7KR4TD0bipqaFlWXkccB2a
 F0l1QwPsv1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xGmEPTi9GbuspqckeWjEgk
 FOE9/v5CDoqvLCLRHa18raPsSj0KSUTNXUFZyIPUU0C+daLnW0ophfGT9ImGqjqiNTwQGn02
 2rT9Hl4gKgPh8kW0an95UrAnz+nupnOSEgy+xnTWWWmqAh+YeZJerCV1LQS1t4YRK7xc7VLl
 ClsdxS2hAzWMaywqQ==
IronPort-HdrOrdr: A9a23:f6wL5aE7hJ/Je3v1pLqE7MeALOsnbusQ8zAXPhZKOHhom62j9/
 xG885x6faZslwssRIb+OxoWpPufZqGz+8R3WB5B97LYOCBggaVxepZg7cKrQeNJ8VQnNQtsp
 uJ38JFeb7N5fkRt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.98,256,1673931600"; 
   d="scan'208";a="100499907"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eoiBf70+zLf++ror5ziHWbcmG4ZRYASuYgAF6RTa2ytbH5kKzulgL8f04jF42bXRHxEAqcpQiYj2zwmtuFYTe9HEyW9pJBBEhQoL1iiuf0KSC3Su3CKI+yVytA5MjLx6fL6B4JMJcCa7P8fcfI55U6JUhYd4wydFkD4ZiLzHRwyO7DBJf3RHAFu4isNdwbHb5KKrU7zyQj1QoQZ9JcLm0ScwkqOQNsreeYIgmDFKtF6vOCGNcXxXck3QQiZMD4+q9Pac0J2uOWhu/VYbZLvc2gjnwmKXVLtNKv1/GSMuN2PUorpzvtqyZ/beKlu/Ym6v+sJUEvqvZQx/vGdZl5OyTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UI8DyEVt9e18dqfx+Bar8rTPQ/40hRazabuFRjxd/a0=;
 b=VTy/STuRdH/OSpff9VBtqgQ/BOjvBRpHhHiofCFizrSMQ5bwD4CuEYKfXKMqjZzjOnMs3zHmwJCfDNVXipG19O0entVXdXtiWnVVKWazWz0NwXyW2dhfzK25dHmi8HApTsM4Sy6AVSqKCSyWZiIfAW/WfmYdBexvGeX8AFMmYly4cCZ9ChmrGveCEHR1URuIHg6i01EVcZSSwttmpqOl+56ImdxhT0LvSkvwIDiEejV3HKXz2Yjxxflz4c/UGdU56PFOOyInztjACbyzrpoaI/Pb3W8ViBSfSugqHPdY91JP6Xa1FWnxWZbE78t76UvralslFHgHJcBSTcqm2rTmdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UI8DyEVt9e18dqfx+Bar8rTPQ/40hRazabuFRjxd/a0=;
 b=dh2wE5bhIlU7O5WmhfJMd0WwHJCn62h8awVDgtgVB8FD7mxpzscSPm6NhUxHnYt5uTGooAabqXJ5GwPgXSvoXoWR3uxKqNllrdby5v+ko8P5i1SRjGw/JICFjbxbiNbElDMzjogJMQwgRpwC3Vy87fYMqx6OZoOWT12/8G0jobk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <467bc1f9-6e14-cca9-159c-b40eb8327028@citrix.com>
Date: Mon, 13 Mar 2023 11:43:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [help] Xen 4.14.5 on Devuan 4.0 Chimaera, regression from Xen
 4.0.1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Denis <tachyon_gun@web.de>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <trinity-8973751a-6742-4309-b02d-0b4c38f4206e-1678390468345@3c-app-webde-bap36>
 <84f66bc0-ae7c-febe-9a15-98453c48d051@citrix.com>
 <ce1a289e-6ed7-9b5c-42f5-069f16bd6984@suse.com>
 <trinity-429ff607-c131-4745-8c96-9d7f6f61234f-1678481409956@3c-app-webde-bs42>
 <31151e94-b8b3-15ab-3680-e1c6e2e97530@suse.com>
In-Reply-To: <31151e94-b8b3-15ab-3680-e1c6e2e97530@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0453.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BLAPR03MB5652:EE_
X-MS-Office365-Filtering-Correlation-Id: 702cbcfc-27e0-4099-f267-08db23b83099
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZB+Sl1YtOc3b6uACf6/OzQBkKmy1B/dnKS1Df+QeHukdCU9FW42HIisRC5DZt7K44AoXPvGmOJiNPnW7cAzV3fR8AraSJR/W5nP7d0ozipdiTra8IkSXU7q87TYo7ltchSHfRIocCMFGupyh8itMcRB1iHKxZvC2JEUi/ay303u6w/K3lvAZ2bnApxDRp2sL+mcU72Ohwlu8SmKd8h8tQxEdIfuVyD/m8BQoaKDKa1hl0GT3czg6g351Jsm6AtSJEIlia+Mw6Ufj+lGSkECBZ65ZJPCUVn16TWFaYTGyEJ3aJLF8izgztH5ajxXKMAX/GiGvrO435nCS+OVYWux/3maBX/AagvrtLT+EX/zOCeZbNLSizGdQ5CSqkPVtlT092iy3bUapl4T10j9Rf/gsa3Om4XrbkPyaY0ubZb75NeXPbS4CUS8gOWlgYHI7PIysueoSCUPhNOYiD+cXTDRY62psQ0FGt47Jzpb7j6wAvzorrvyaZ2DDuPjFrg7mfJ/8TjQ5cog0jrbUKdYkAl83ykt+y8R9DVvSDo6pGvkoaqsjS5IzdXnAKhfKUxbngxB/4gS6OJ2PBLGvvqryjtS8Pt7OskOGl5SggPYQkVZK5Mor6biFm36XrmHu+2Y2Zmo9R0hAlOAnoSEge4BPmz/YeIKWMicF6xxth7rl+RmYht0xfPLf4+yBDK2IdSZLxk+fukLPbLsXk7iF03wLAPv6H13fag31xgK9EBY7y/FCm+8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(451199018)(38100700002)(2906002)(82960400001)(31686004)(2616005)(478600001)(6666004)(6506007)(6512007)(110136005)(316002)(86362001)(31696002)(36756003)(41300700001)(66476007)(66946007)(4326008)(66556008)(8676002)(26005)(186003)(8936002)(6486002)(53546011)(5660300002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzdhYnh4cTd3a1R5SmczWkRmSEdJRzNRYkFWbEVXdG1TTi9iL2pNaFl6cVMr?=
 =?utf-8?B?cDJtWndiN0h6Q1kvak8wNDFaZzk1VEJGOTd6aDdUUDBSVVFFV2ZIc3lrSnJK?=
 =?utf-8?B?QUY2YllZY1h1SnlkeDZYcUJUb3ZyVVNTNzVzY01uR0YwYWZJMEdVaC9yeGhz?=
 =?utf-8?B?azQzZzR5QVMrUlBTZEE0bXdlRGM5V2JubitVYU1XTHZKbkZ2cTJjYkgyU2kv?=
 =?utf-8?B?TlNUUTRjVW1Ib1RMN1VIVWp5NGNDQTBpbXlDRUxicnl4QzNlM0cxSnJURWRY?=
 =?utf-8?B?WkcyZDRLTWV4dDMxUUVxMzJXbjBnRWQ5T1V0Vmg1NTBOeTB6N0JhMEJadS9r?=
 =?utf-8?B?UHFleDVtOFg1MWY3bDVHNzA1RXF1akxwRWhYL1pZajIvTjd0MHNvNzNjZDN2?=
 =?utf-8?B?enZRTTNBUkNXbWV1RkxBcGJwOTFJakNOd1VsV2lrTzFwSkp6L1NsZXFsNnBp?=
 =?utf-8?B?d3BuUVF2czRLUHRSOTIrWm5QaVBmNHZoLzg4dU4rNys4am1NQzhZUVQyOXVP?=
 =?utf-8?B?aTBaSnlhY1RkK3g5aFhobGdtTmtZdGwxTWIyT3puTmZiUmNHT2R0YjBYUEdt?=
 =?utf-8?B?RFZpWTBOMDF1V1ppZUhOYlIvV3p3NmQ5L2VhTnJpeVphbEJmZ1VuNitHSzVR?=
 =?utf-8?B?SFlnZkh4OXE1ajFXOHl2ZU9lREpQdkoyQzd1cFJTZ3NBWDVscjNZcEgwRDhr?=
 =?utf-8?B?REgrbFRKTU1ta1JMZWhhQ0JsMjVZeVpVVDRsVGpJelNlaFByV1hSSG5UZllU?=
 =?utf-8?B?WitGSVlaOWkyWXZ4cDd5OE1wWjJ3WTVhUHEybDFlc2ZCN2RzNzRVVVRxQlQy?=
 =?utf-8?B?ZkNjdHBPU01naUhibi9uY1ZrTnB3S2pNYkdsaVlvd0lPL2ZIWDhQSlVSZmxN?=
 =?utf-8?B?TW9IRWYyNWdrdURGQ2RCcDNCN3hjWUZ6ZWIxVzQ0OWx3azFmVDZTWUJmWVJR?=
 =?utf-8?B?b0V4YTRSRGdxZEFLUXFuV2ZYblNOM3VCd0p0bHMrdktselhwa0xoUmh2eFBO?=
 =?utf-8?B?MHJ1aGlqNWVtUXFxeFVyTGc0Ui8vc1M0R3JnWFRoeFBLZm1WZlRsZGhLd2do?=
 =?utf-8?B?OHRZR0wyZkFQd2s3K1BjV2xEZWdPM1pZNU16YUJZUTBqNG9SekdJd1VRSTVT?=
 =?utf-8?B?cXNJWERsLzc1RUVsMWlLVWwwZzdCT3hRSzF0djVwYlZjVUdTZ2dRTGl0VHhn?=
 =?utf-8?B?MEFMTXJSZ2hKTVUzZ3FuaDl2c1pCcmJhVEFZVkdCQkpnYlVpbk1jeVhJQ3BH?=
 =?utf-8?B?SFBTOWs1bTFxUUNjeE9jU0lxNlh4UFZ1WS83NkhKL0hYbU5zLzBSejVxeTRW?=
 =?utf-8?B?OGlnamErL0dMeEdBY2JPYkFkWnpKejVmcXluVHRyL0RGa1VWTUs0cjZ6M2Yw?=
 =?utf-8?B?RzY4eTZBTVA1OXNHbHdnZFV0REVJOHJ1V0p6b3grWEJjNWx5QzRKMytaNEJJ?=
 =?utf-8?B?VUNNRWg2cFZ3Q0lNK2pQUHluOGVWSXU3YnZOSjNMNFNYM2R2ZFVIQlJaUWZi?=
 =?utf-8?B?ZjEwMWowTzR3TjkraEhGblowTy9jYVBvUFlCdFhOaDZ2MHNrSjFSdHZrYW5J?=
 =?utf-8?B?UktnQTRVak5aazBUbW80cjI5L05mVkFreTBycE1qMHBQSWdjNnNiYUJpNk0v?=
 =?utf-8?B?OU0zSWRlSHZDbmZUR1lZZ0xTeTR4UzR0VW1JMG1uTjVtMnJqVGJzMzhZK1dq?=
 =?utf-8?B?V0I4ZjFCM2xuTHZlNzFsQ2ZKRFg3L08wSGs2ODZKZ0pwTlFyY0xPVWxxM2F6?=
 =?utf-8?B?MmNkVDEwQUdUY25SdjB2bCs2aStSTWRDY1ZUR2hVREtSYlJ2ZVBjSVYwM1hs?=
 =?utf-8?B?c1RxSFFLendMQ2JzZDAybVJtSGI1eU1ib25NdWt3ZUNzR0QweDk3cjFKcUJV?=
 =?utf-8?B?L0YyYllscU9oZmFOZ3VzMHB2ako0Y1NUczY5cnA3K2w3YkRsZ29RU1JTWk95?=
 =?utf-8?B?Q1RvdHpHMkdNZTBFZ0x3M3lRT2lKUEtORExIeW54dlRnTGFMR2MrUkZteERm?=
 =?utf-8?B?U3ltL3lMYmNodDIzVy9peVVoeDloMVQzdE02UTkwMm9rRUgxTkNXMTNwdVlT?=
 =?utf-8?B?Y08xUWxBcWJuc0RhY0F1QWRCZThwMnBmc3Q1SnIreGZzRVk4UnU4dVJOVmU0?=
 =?utf-8?B?U0hqN2dNTmtEcDVpdk1XOTIza0NQUWtidWZXN1ZNZFlFSlErMXAyYWVDWFAx?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PKKitxIZw2qQ7AYHWbVbL166Zm2CFDfqBUajfWRD10YcqRM17qe/Rbl/yW8Vd2kM6lWVQ5FssYuykxirEjnIvI8sZyO9/cRILORE9h9SdVCLnZz+Eo7vXyTGQq5TegqZ57m1Qy2U/dmbUTEwEg7PhY7OvxCU0I/B2QYFq5U1fTAXeMWwsbGOGP2i6b27eeXOXqvClm094ZA0TKbI66G/rztSjH79sLkCSuFFza+XuYvF3V15VXtjoRoIaABP99CBVN46bgCNU8pVSmj/KBZCGechCFa0gAb8zszHgHSFdBJeJaMXGDRBmBXGEH/k/RFUd0Fgxt70vKsmyFbBnvzRrBf1VqpWPDnjabynscOkf4Fv3K9Hou3exHEP8YEzQBcAN+BbyIDmSYzvXCLu/qZ7TdEP2rA891TkC4bCHkajVXVCv7IVGg/7/oc7b2cD24BzT3jHtCD5V9HxlhHEzmqnvPmr39NI4+gITZhzklZT4OKFrRu0egIZLTxw6UcJe9y6f6kf1CRnlTgut1az+mVkrkar0ePjqgZ0iwD+3x4LYL+1zkD4Y8d1Ydp/zh/lksCWrGcGgltPpZITDp30IA1yVPdWrDC2xkuEp+bFsMo73EWzpygsc7aVkeujt1WRxdK99zskBqzT99XFMgrfAVSG5q4T4GVXrKXHExLWz7tSJeB/s/FlUTcn/lZzTr7vawIB8STJPIiP+iSV8UWUpcxgaGiJNRXMua0eYzlVGxITx5olQmgXFaYGneJMBjPRnLz8w10uFiVGEhrUOYXwTNf8ZagNqP4mRWUMjzG/H0RWhyuJQx8CRfLlytXnsmBvcyE2
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 702cbcfc-27e0-4099-f267-08db23b83099
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 11:43:40.2063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e9NubNLXcEhf9hXnRSYel7zrrvj0Yg9HLT8EujMpiwq9KVwCSOBTHznZWDAqPZZOm6e0LJNWwzTVc8OC279ZLUL/UyP0J7DMt4TIa2pL5Pw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5652

On 13/03/2023 9:36 am, Jan Beulich wrote:
> On 10.03.2023 21:50, Denis wrote:
>> On 10.03.2023 09:51, Jan Beulich wrote:
>>> On 09.03.2023 21:37, Andrew Cooper wrote:
>>>> On 09/03/2023 7:34 pm, tachyon_gun@web.de wrote:
>>>>> A short snippet of what I see when invoking "xl dmesg":
>>>>>  
>>>>> (XEN) No southbridge IO-APIC found in IVRS table
>>>>> (XEN) AMD-Vi: Error initialization
>>>>> (XEN) I/O virtualisation disabled 
>>>>>  
>>>>> What I would like to see (taken from Xen 4.0.1 running on Debian
>>>>> Squeeze, in use since 2011):
>>>>>  
>>>>> (XEN) IOAPIC[0]: apic_id 8, version 33, address 0xfec00000, GSI 0-23
>>>>> (XEN) Enabling APIC mode:  Flat.  Using 1 I/O APICs
>>>>> (XEN) Using scheduler: SMP Credit Scheduler (credit)
>>>>> (XEN) Detected 2611.936 MHz processor.
>>>>> (XEN) Initing memory sharing.
>>>>> (XEN) HVM: ASIDs enabled.
>>>>> (XEN) HVM: SVM enabled
>>>>> (XEN) HVM: Hardware Assisted Paging detected.
>>>>> (XEN) AMD-Vi: IOMMU 0 Enabled.
>>>>> (XEN) I/O virtualisation enabled
>>>>>  
>>>>> My question would be if this is "normal" behaviour due to older hardware
>>>>> being used with newer versions of Xen (compared to the old 4.0.1) or if
>>>>> this is a bug.
>>>>> If the latter, has this been addressed already in newer version (4.14+)?
>>> No, the code there is still the same. The commit introducing the check
>>> (06bbcaf48d09 ["AMD IOMMU: fail if there is no southbridge IO-APIC"])
>>> specifically provided for a workaround: "iommu=no-intremap" on the Xen
>>> command line. Could you give this a try? (As per below this could be
>>> what we want to do "automatically" in such a situation, i.e. without
>>> the need for a command line option. But you then still would face a
>>> perceived regression of interrupt remapping being disabled on such a
>>> system.)
>>>
>>> The other possible workaround, "iommu=no-amd-iommu-perdev-intremap",
>>> is something I rather wouldn't want to recommend, but you may still
>>> want to give it a try.
>>  
>> Thanks for your reply.
>>
>> I added the lines you suggested and it seems that "AMD-Vi: IOMMU 0" and
>> "I/O virtualisation" is enabled again.
> Good - that'll have to do as a workaround for the time being.

Not really.  Booting this system with no-intremap is still a regression
vs Xen 4.0.1

Disabling interrupt remapping on PCIe devices because we can't figure
out interrupt handling around the PCI bridge is still bad behaviour.


What we need to figure out here is how interrupts from the PCI bridge
actually work.  The IVRS table does contain records covering the devices
on the Southbridge, including the PCI bridge and it's entire subordinate
range.

MSI/MSI-X interrupts from the PCI devices will work fine (they'll have a
proper source id), so the only question is about line interrupts.  They
ought to appear with the bridge's source id, and ought to be fine too.


I see no evidence to suggest that the IVRS/MADT are incorrect or
incomplete.  Xen's believe that there must be a southbridge IO-APIC
special device seems to be the false entity here.

~Andrew

