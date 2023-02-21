Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E2E69E655
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 18:51:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499124.770156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUWmx-0005CW-46; Tue, 21 Feb 2023 17:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499124.770156; Tue, 21 Feb 2023 17:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUWmx-00059Z-13; Tue, 21 Feb 2023 17:50:51 +0000
Received: by outflank-mailman (input) for mailman id 499124;
 Tue, 21 Feb 2023 17:50:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aMCI=6R=citrix.com=prvs=409bf5b25=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pUWmv-00056H-F3
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 17:50:49 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 449981eb-b210-11ed-a089-e9535cc0f9c3;
 Tue, 21 Feb 2023 18:50:48 +0100 (CET)
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Feb 2023 12:50:44 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6468.namprd03.prod.outlook.com (2603:10b6:806:1c3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Tue, 21 Feb
 2023 17:50:41 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6111.020; Tue, 21 Feb 2023
 17:50:41 +0000
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
X-Inumbo-ID: 449981eb-b210-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677001848;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zdYggp8u82TKz3KEBuAEBqRY/yrwexK7KR4ocMV1INQ=;
  b=Aa2mPQlhb44H6fGZTWsxS7hnfqYqpJ40HaUyswBgqbG7yoP+USm+wFKM
   HYWl/aFkYz0uFtnZnFYwdP1u1NtZorV2Y5AuS5OaVQnaMDmXtI0B0yg+x
   jlrdEs1hEFpSBOZO85bNHm8DhjaoJQtWH+vODGx7EQDuVBthK5WDPwR0/
   A=;
X-IronPort-RemoteIP: 104.47.56.177
X-IronPort-MID: 98349198
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8CEKxKqEp99hEhIuzYunUyC+EdteBmIuZBIvgKrLsJaIsI4StFCzt
 garIBmHOvbfNDP2eNx3Oo+19kIH6sTSzNJhQFZo+Ck0EXsQ8JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weEzSBNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAAwUST+ChcGQ+ZSmRO9lq/8zF+rGDbpK7xmMzRmBZRonabbqZvyToPR/hXI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jearaYWKEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXppqU20QTClgT/DjUrEniLn/aJu3eSdNQGM
 E1I1hAB/fcboRnDot7VGkfQTGS/lg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQC3
 VaTk9TkLTdmqrGSRDSW8bL8hSipJSEfIGsGZCkFZQgI+d/upMc0lB2nczp4OKu8j9mwEjapx
 TmP9XE6n+9K0pFN0Lin91fahT7qvoLOUgM++gTQWCSi8x99Y4mmIYev7DA38Mp9EWpQdXHZ1
 FBspiRUxLlm4U2l/MBVfNgwIQ==
IronPort-HdrOrdr: A9a23:KVaN4qr8PgrOOiIzUqzbyfwaV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-IronPort-AV: E=Sophos;i="5.97,315,1669093200"; 
   d="scan'208";a="98349198"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COgnfi1zKMPr4e2m+n4HJ3gQpYDBUgZNT6+XYqYDY7Nj60FTekjbEPvJHpNejdbhO/m9W3WaNCUBCujjCjr0rUbMws964vtpckP9cqXj882tA1sVivMk5iYiTgOeD9agGqMmw5pMc/cAUw/9p9SN2ZvPWG3lHHgOzTJVKfU9jockMdsPRFFb2XUTXcpxORlGLWifGCk0DfQY9BOgl2lPT5PzuenbmPsI0srFixMqRnxPWgEGj3IWODiY0jmHfOU8wOnYRQ5lid519bGiWIrHRdi90R2nu1u4UmJpicPnu7LUzxY5N97BoHhUIxQTlvYXcfr/5NOpGWr5dKlTpsEI7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdYggp8u82TKz3KEBuAEBqRY/yrwexK7KR4ocMV1INQ=;
 b=fbdck5GThD9AAetVWU55BQXZ1BG8zw8D+T0YS2cj3nyNPFksn3EvIgw/H3kv6narqjWVU+bkCFZQED3ISuCp1ZW8bkmfyy5qokr8pp2Q7msj7EudY0GJOr+kqNiLHfQtDkudRbmHiggGRbLCK0EY1iTZtKmUT6FNMgq1NQ7sOEopNFu+N36GAgdpjVdn0udgt425PK611ayFwcyePqlUr1BL+psL1yUmfCMbW1jCwdE1ZKUyo59E9SFadEYVKaLzabkzJALQEKPakhOtBGozrpTFTiNF5HimCdOUM+WraOLgCGAmQtUwL5l7biHwQtDarUA5n7LB78EOXosIYu0vqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdYggp8u82TKz3KEBuAEBqRY/yrwexK7KR4ocMV1INQ=;
 b=vh+acLp7TG4n721NwzhYvXV19k8Cr9WmslydMHVLL4l5i0iuWQcpiah7J0V+1j7fv5ePFZErGwwgdj9xRF6/+SC/EAAS/XD8z65JkxMsYiGa8qYvxXQbsWxpxvbNnpC5gH7F5GKava8VtxXwOBWZ9lvQ0/XgdtzCZx4KBvr3YMc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e61bd313-7843-df1d-d660-c50aaeb95e14@citrix.com>
Date: Tue, 21 Feb 2023 17:50:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v2 2/7] automation: Ensure that all packages are
 up-to-dates in CentOS 7 container
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230221165542.7642-1-anthony.perard@citrix.com>
 <20230221165542.7642-3-anthony.perard@citrix.com>
In-Reply-To: <20230221165542.7642-3-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0130.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA1PR03MB6468:EE_
X-MS-Office365-Filtering-Correlation-Id: ecf5bf0b-bd69-4deb-5055-08db143425cb
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uJ9ApcR00790HiVNSSrJAU0U8HMfBitFh556hD7ql1V/td/Kw0JomkvmZK2OaBWmCRMnxHv07CvhDwEM/QaqpvKu84eB/xmcl1ohC7JEPgxy0nNwxCSkfPBmURPGttl2ZEf45GFS3p+MRtXu9ffO1/NWJ1lubnBPoHJnOIsfzzFIPLaAEGhd2ugUElijlcqJsCH+h3mEd88TKJFW1gMUANs7p0Km+BzqTormTTBbPDxBkF6duwgYUe4dQqi/VYcHhli8GO495o7b7jsOalJNSt4cWStkvN2z4eyKbSbEfioaq0Ex+SBHMjRFxwoRsD5HBFE0WpnAXFlPCQ9Ph3TZ8xo4LJszYWQKEsxQJbFzku5TK9nSqEpwjoW65QO0jM7NF9FQDLyXxETKzWKAlddPHgbVLnGyhSxyiYdHk4iq5dwkB1ZnU1L5JMcQ6A3XOMKXbLT0A8wsyX5SmHX5yYNFd9qmfSngFnhbN4OvjYGB1zsQnYdno4UlOazWzt0kyBdK32kkn3Yp8pXQjKMvysOTKdC0XsldztL5hbHT/OlTadpIMbS/ZoqxSSBEN/UtRRpE1iPKR3NvV/GWBWPP2V7axXZ6XtPqaOK0ttSSms/13NEQRq9QKulwzfDVGLswSrNSQ/aD5TD3T3yIxoc4v3MOkmvLcnDRR9oSASsrnBxUXoVb3lK9oK74YKV31lTLVrkYY6+XrqwT6TAwoh81Y1U5SK9Y5F0rMxy37+7zWxjaRcQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(451199018)(8936002)(41300700001)(38100700002)(31696002)(54906003)(53546011)(6486002)(83380400001)(66556008)(8676002)(4326008)(316002)(82960400001)(478600001)(2616005)(6506007)(26005)(36756003)(66476007)(186003)(6512007)(86362001)(66946007)(966005)(6666004)(2906002)(31686004)(4744005)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXVoYWl1ZmFIOExvdXB3L0QvNEpqWVMvemc3eUtUMUhzZ0VGelBOV3JqVi8z?=
 =?utf-8?B?andOY0xYSStEekM0VDcxN0dtTGpOZkh6RXBJbXVLV0J6TFdOL1MrREdoY2lL?=
 =?utf-8?B?ZHJzR1ZLa2RsZWVScXVqMUZnSmN6Z0M0M3dUbmtwUU5yMDJyK0JFM3dEMjVV?=
 =?utf-8?B?TzZHOGRneGMvdjdGT2JwQUo3a1gySkFFelM3aC93UVY5Ry8vZEowamNYblBG?=
 =?utf-8?B?elZBblhrUUZhRXRYZ01GVnVpdnVZbXBtR0Zoc3dyZHl0U2M4d1JjbVRBUFRN?=
 =?utf-8?B?ZE5NekVKMnB3WFREMGNRWlYvK2FENDdvSHNGMEp0VlA4c0hBVWp6ZVJ5STZr?=
 =?utf-8?B?YXQ0Ym5PUmZOREdRemh0RkplRE5LU0xCOG1ja1NDa1lDS0QxTE11d2p4OUp6?=
 =?utf-8?B?L0RKVmFWTmk3d0pqSUdZVXV5VURMQm1Fdi9sS3VacnoxMEhSZVZVL3pyQkho?=
 =?utf-8?B?L3JhZ3pmckk1Mzl0cm9yUU1JZHYwcTRSTmc3cFM3SjBPeGE3UlRvSENoREdK?=
 =?utf-8?B?bWlZR0FTNjliWmg1QTJISUZmNGV1emdscHI0TTZXSWQ4V083ZjdwOTJyQkg1?=
 =?utf-8?B?L2NMV0JVM1RwL0FKdXpFRmxxRlo5V3FVb29Yd21GYTh6S0V4SFpwSnpjUFkv?=
 =?utf-8?B?RjlvVlpBVlNCME5LcUhyZW5vOExxanlWb1NrT0x1aVBrUFFzWUtQTWNndWlz?=
 =?utf-8?B?dEoxYU8ySlJvdEVRbXRZUVgyVmRncVpSeThIa2NCcmdHd1pQWVZxY0JsWVJI?=
 =?utf-8?B?WHg3b2NSMkFuWlhqWERCOXp3RFJoVk5BQlRNckNqZFRBdnZYWjIzeTNTd29N?=
 =?utf-8?B?dHBTWmd6Q2E2SExnc3QxSlpVdnpKY2tqbCt3QTR0VEU5MFJvSkVWVlZpRS9z?=
 =?utf-8?B?Zmp0Mm05d2JYa3U1UGpKYUwyVElxMXdHV2xOamFJTS9aS0N1bUJ2VERlWHgv?=
 =?utf-8?B?ajVsYk9YZCs1Tkp5Y1AyL1IyYmE3OGx0M1NBOWxwM09xSm5kaTg3aGhuS2dw?=
 =?utf-8?B?VjFhY2F0U0JpY2dybUVnaENybzY4d0Nad09nV3RQalg2VDBqbTQ2MGtLc3JL?=
 =?utf-8?B?ZmVrYjFWQkhwOVJ1Z1ZmeTl2aDFKUk93b2YxeE1hUXF1V0lmdnUzSHVzQjN2?=
 =?utf-8?B?ZkhCZ3ZkOHN0NjI0SEtPc0tBMmVMZ2lLd0NBOTQrdWh1dzhNcnF3NjZRTmVK?=
 =?utf-8?B?aXpTT0hidXo5c0RBZ0ZKVUpoQkhaUEFvckxRejZMZktzdmJDMHZiT0M2V0Rt?=
 =?utf-8?B?clBWaU5PQzBaS3ZYM3B6ZFJVL2czZ0FPWlNFS3FETzlzVHNpU0VJeEFvbTh6?=
 =?utf-8?B?NHpWbzcvM1lLc3FLT1M3YWxHTEZ0SlFLeCtzZkF4OS9VN05tTTJHdkJUREJn?=
 =?utf-8?B?K0F1SkszWjNXS0hEamF2L002c200L1JRYTV1d0tqUFZ4TjJ4UkQ2RlRHS2xl?=
 =?utf-8?B?MHVyWUloekV2OElUbWZkaldxenJua01sTWQ3Y1JaZHhaK0ZuT2ZERGE0T1pu?=
 =?utf-8?B?YlBBamF0T0ZYb0pBM1haeUdLaVplQnpDbWg5QjJKSkdydnNRbFdId0RWc3BT?=
 =?utf-8?B?dUlzRVFzQ3l5VzJ5TFZuYUtRRXM2aGE3T1BtSXZQSHd1aVd3QmdJVEd2MUVp?=
 =?utf-8?B?dVlLSzF1M2x4c1hxcVZPMjhrUWdFQ3pRTFlWaUUwL1g4SnRodHBveGM0RzQz?=
 =?utf-8?B?b1hlKzVpY3ZKaHhvWXpNR0xLbjIzNjZReks2NTlkemk1eFpKbzN1ODVXNGxk?=
 =?utf-8?B?d2pYVDJJRnhGSTBHZWZEa1VidkRYeXl0aXFWZ1l0RzRla0RrK1ZIanNWUHBh?=
 =?utf-8?B?UHdpZktqYmtKWExUOVJiTFV4N1NzVnc0RXF5aEcwNGFNNE5HRGlaaTJ2MjJP?=
 =?utf-8?B?Y0x0ZHVXK3pJczY4OHpmSXBXalowK1ZnRDl0aFBnUUlnRWw5bVNZVjd1ZmYy?=
 =?utf-8?B?b2wzczFwZFNiVU9iV2pBV0lsT3hJM2doZnA1WnhlTVRLU1B2czdzcXgyRi9M?=
 =?utf-8?B?dkxrSFl2TjJscGVNcXVGM1dZSnk2aExYYkxaSWFPYnRTSFJ6aUtNRklDM3RM?=
 =?utf-8?B?ZUIyc0oyUWJ2RityUDFZUlpoU2FQMXBScjh6Q3UzdVFjRmRMQXVGTDQyQ1Y5?=
 =?utf-8?B?enBobXVRMkMrTG5aeldic3hMOXFwYXJFUUFuQUxFMzB0aDRPQTBTUjRSQ1dF?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QWGfwQPdGWtvTjYYw/ZcpAMYdOTcxOzwz/CW4zaQra47xI15wGfLeYTK1ZU7pMgvntt6nwQC3Szut09/K3YwRS5YjO9UFZIAemPq/OVFMo/ZPHTMjkCUJsngHYkoUWIbp6VFceLatAJhsW3HFiqGiDLnew5aOyf14DdgXWtNW0R+XlUWzwAP+4IuM5GcaatBpOba8bDESYUJKT967oFWtuYpK9RhRH9Oju9x4sCQHpOgpjNWasael5CZsMrnFKI8jVf5nfNIhr66eBMFjLwkad0R/YlZL0CI7fPT3VfExF/akiEsoJ1Z5IUgew9Se1lkN52gqvMUiCzYfYSrsaJU2kod9kMca3PpTXw17qsw3eXNm6hRRKtcEWATRUkR/hiI0dfh8Yvgicd/vCfeOGwtasu9/76dVAtMbyQd8MDQKS2CS8HYrspf1Kw0QnwRr5l/ExS7Z6IrhEJNoxILlx/wYI9U1byoKDWSOyKG5+9w8IFmW3A2QSdA7tmef+HSZTwbhTOyaQJcbC1Kub2XIMVKfuyLZq3PBmRH6qFtUggobUFy3wTmmVdkWmTP39y66zG7D1/KD88VMQhewYwzu1Qz9sy3QyrQQy8V9/tvE+u5DbwFzsh/Na/ZDyYqKcRe68UQo9QSmlq5fviYlfYyiPG3YeCd0k2iNVBu51rx894qOeWGPREdnTVIEwunz6fIR7txjNMTkKcYRAqUtB+NMjrcj2dG/hZ1/okKZv4a+SvUzJC3R+ey7a2HKnv9EiObVQO9vk2uWsafyBmOgscBTJRyIvY3ExBwh2dhfbLARUQtYWKHmjQucbSR8iBbNQmBz9VNweMJC7jXZ+G90k/F4USElQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf5bf0b-bd69-4deb-5055-08db143425cb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 17:50:41.0961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTAPSRqonC+CMNBysElIFHSBfuqixnvJtfjdF2zcuGNYcRsevOEG8RSEOGUTP4+jTJXQ2nwz4NVBFu5hS7klYbmI9O54nAdZN5H20jRgPBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6468

On 21/02/2023 4:55 pm, Anthony PERARD wrote:
> This was prompt by the fact that `wget https://xenbits.xenproject.org`
> fails with expired certificates, which turned out to be an expired
> root certificates. Updating all packages fix the issue.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

