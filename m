Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A4A690F34
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 18:28:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492834.762603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQAj3-0006il-Vd; Thu, 09 Feb 2023 17:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492834.762603; Thu, 09 Feb 2023 17:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQAj3-0006fn-Rx; Thu, 09 Feb 2023 17:28:49 +0000
Received: by outflank-mailman (input) for mailman id 492834;
 Thu, 09 Feb 2023 17:28:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3QCz=6F=citrix.com=prvs=397b6fb01=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pQAj1-00060C-GR
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 17:28:47 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33c2069e-a89f-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 18:28:45 +0100 (CET)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Feb 2023 12:28:42 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 17:28:40 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.017; Thu, 9 Feb 2023
 17:28:40 +0000
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
X-Inumbo-ID: 33c2069e-a89f-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675963725;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sXD9az4p+c3IoeHYNHwgBsFRy4V8+JXh4R/P6E1A7SQ=;
  b=N/U042Elv72CLxHqpshJOpyraoqLgPWHezICcF+mIaI24xZsL2uRXOIc
   Aq0YEhfrC43WApavrfQOLealksnki4N2C9c2WXMlgFmJwYi2EbWY00MoK
   AT5CSMza2/8xy8WWfwNmRPlz70loQOcZjarHn2Mvw7jfAzV3KNhg4JmAI
   U=;
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 96402252
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:cKJxQ6n0FOfOPE24KQgTb9To5gywJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZDGvSMvuLMGTzeo9/Otiy8k8GsZaGzddmSAs9/3gwEiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgR5A6GzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 a05IgsKRDzcvtrs4qOyEco2ne16dPC+aevzulk4pd3YJdAPZMmZBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkV03iea8WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapDSuHgrKQ32jV/wEQZJEVLFmmJvMO/k2PkZN5da
 EMF/xsX+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313qiQhSO/P24SN2BqTTMFSCMV7t+lp5s85i8jVf5mGa+xy9HwRzf5x
 mnQqDBk3utCy8kWy6+84FbLxSq2oYTERRI04QORWX+56gR+Z8iuYInABUXn0Mus5b2xFjGp1
 EXoUeDHhAzSJflhTBCwfdg=
IronPort-HdrOrdr: A9a23:ZtLFdaMCMSAXLsBcTh2jsMiBIKoaSvp037By7TEJdfU0SKalf8
 DHpoV56faGskdoZJhAo6H9BEDkexjhHPFOkO4s1NuZPTUO21HYU72Kj7GSpQEIcheWnoIzu5
 uMa5ISNDSZNykFsS+Q2njbLz9U+qjizEnev5a6854Cd2FXgupbnnxE406gYzdLrSd9dOcEKK
 Y=
X-IronPort-AV: E=Sophos;i="5.97,284,1669093200"; 
   d="scan'208";a="96402252"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iqjoqmv8rXVgaGnjBGjR+Ed9tsMlK1hS1uN7FK8w6sp0Q5eWKcZrKV6z8mEEJMj/jr9nYJ/+Fqa8broGWU6rlGAaJ3IqcJLxmMnK2umYmtaSCy9TtUl+OuLlAoyKHwfvas0DuPFGHTULMm1cj9sKjN+0ze23b6dZh1yw6Ib8ppYnWVYlCv5Wf8EEugVyIXVne40TY7RrsIKXCV8fuJ49+3L7gkEP2HuTkYtKgT414EsAGFcOKTPar0JLvzU06mW4PF8T5BZpZKUc7e4RSPfJrV31WrF74MxPFUMI/1ytB5mo1/tqoxkI+GEHZZ03KI5wXQgYrfNCnxOL5N4UXtBXgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXD9az4p+c3IoeHYNHwgBsFRy4V8+JXh4R/P6E1A7SQ=;
 b=oWruzryN7mCTCNg+yCPt0zS0B35G2fZtgceD3Jzr6g1QBCDjtOEtKpjCfIhYg9KZptreCwqD6CDkzZEK0aM7cujoHuaqhU8mMdtMXIHzp78IexOVbxSZUrZo/stjLJb5BU0ja9Ym3G3RZI7iBzsTRMqd2WBwkFt7O3G1h5NMZM34pf4GRCSFNSqEMVOfFukOakigRvNOZpHrXuEkhEFkmxzlqDY278ALk2bQBEzQ/rmCuW131cZM2o2oE5eNxmgklTPVLpw4FmkaeViZpSlWjVhWg/SqlKRReNOWOKPyQ+MY706GPUg595U2rpMX5NermZWfLzz2+DNfngmyQ0XjKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXD9az4p+c3IoeHYNHwgBsFRy4V8+JXh4R/P6E1A7SQ=;
 b=YxWg0VWwmfmntprXchEV9cwoshUjyoVtlqE1VhYnJ5OyA2naEgfgctHiayKtbAmJp/9Esa/EMQDe0YNKLnb9kZNoHuxwTkp5bX06VvP12zv3BG4vyb2EFlv3ofDerDYsfG83qiK7ICOZbGowM/my3P026BBOIXqdmuBr221pa7I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <45ff484e-0b1f-7fb2-6e61-0dce4306e1a5@citrix.com>
Date: Thu, 9 Feb 2023 17:28:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 1/4] x86/shadow: replace sh_reset_l3_up_pointers()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <c8858a19-e89a-c1de-3222-810bb43c3c88@suse.com>
 <55114c08-6407-db9c-a25c-06fa7bbfd4e8@suse.com>
In-Reply-To: <55114c08-6407-db9c-a25c-06fa7bbfd4e8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0108.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 90bb23f8-8c3c-4363-74d7-08db0ac315c1
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oXQUE9Bc5P71bgn4aNmu0AELBf/12KohLcaPySsWaI5h0Ublm5S1lUsS0rmKkbt8x5942BY7LeTyMDjyGV8YdREl/krspNyxbXQSszYT5xVlRnC/UXD+saBN3H3o+vPHImykgIDSedqanzUYkZxHIpQv5C31BDHKMa8xHmdqiubB/l0xF0QwiaiM06WBj/5IpGhtOUykpTzw2KaADMGNjg1plk6d9YqFitAmQKXGt/qOfWso4TbsQiMBVZql6TiTx/1gQZ2IPPUHx+sJuUr0ktLVDt0JbhI/fQ79aH7ijhG3XzqkpN7VGAjUI0SkZhEz1MK5/RBDJUUhP1J4vMzJzmdjR+/lv6CwLnwqd066xmtq7RxE517kV0fEQk/0IHovQ/0wEepDQ9rKOojfGwFNK8D8I60sLlui3woZaNcyIC0Si3ek1A4svOlJMYyIeksWjtM6JFezUvMQR6pezaTTQDzUe/xromnE7F20KXr+HmDrkW5Eh3mdSFuX43lgLncvNmMUR3EuAThm3g/izN1YKCg9hIi4zoUBMqvvnQV6W8QnAal6HmHOGONOiNs25Ky3GdsnIhDp0lvwv8+HLtlZA4b+2A5T7v4HYhHvDmmImlHCQXolAILCcTEl/01JaUR9EcasuqvdS7kFTLA5UMxWz8KXUQOjgHHnhk/dZdGPtC/xIXFCzNNzgF8PaCXZoH240t8UqlferN+8Z3THkTYnjmxu+EHYlC1gwMqXtNxnCjE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(451199018)(31686004)(2906002)(4744005)(36756003)(8936002)(5660300002)(41300700001)(83380400001)(2616005)(66946007)(66556008)(66476007)(4326008)(38100700002)(110136005)(6512007)(86362001)(186003)(54906003)(31696002)(6506007)(53546011)(26005)(6486002)(478600001)(8676002)(316002)(82960400001)(107886003)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFBGbHIyVGNKYXMyTzI2M092c0wvWnR6ajJITlhyQVNhNEs3cVVONjVQRTR4?=
 =?utf-8?B?VElsRzA1ejZMRXdyckpjQ2NFZ285Yjdhby9ScWNtakE0TkRFam04cjhpWDU4?=
 =?utf-8?B?b0ZScGtMVTZveVl4UjdrTzZ3dUFBZWV5ZDlTcTVXUkpycGpFYTZPbG8xaGJq?=
 =?utf-8?B?UjBub0Yxb3c1TEhzZk5BQm1ZYVovNVQzVlEyMFZ0Ylg3UUQ5Wlo0TXNyWGxo?=
 =?utf-8?B?bVhqOHVOYkp2K1NGUkpocUhUZmZ6QXFmSHNWRmpOcDRPZ0hma0ZMUFo5SHNM?=
 =?utf-8?B?ZDhRakJWTzArQnJFV1loNm81b3pvTUxoV3hEWDh4b0t4dXRsT25KY1BnemxU?=
 =?utf-8?B?NEd5cXVka0N2amV6eWZ1OFQvZmNWVHlabm5ZU1MyM1VnMXk2T05ZZkI2SzVh?=
 =?utf-8?B?eEQ3MGczQkp6d1RrRHR2WjFkUjhUODVEby9peXdzajFCY2F5R0pFNGcvQVha?=
 =?utf-8?B?aW1PZEZac3kyWVM4ZXVDdW5SVHp5alV6QVNLWkw3YTc0THZiUEkzVTEwQU1Q?=
 =?utf-8?B?dTJ5UC9kUXpBWnYyY2pTcFBsQ2toRkpqN3VUNXcvUEhvemhNa0QzdU41Zm1V?=
 =?utf-8?B?TzJDclI1bEZIem51U3orcWNIRUVqamczZXRXWFVRT0J2QjJFN0daSG0rSUxk?=
 =?utf-8?B?SFJrcndMV09PNk5MSXJPazcvV1kwLzJvQnpwWWZqMTVzOFRWeXhhRXRiRnpY?=
 =?utf-8?B?QUdVc0t3K2N6dVhXZkJaOSt0OU5FaVU4a0lDYVBzQUhPT2ttdlJ4MVBvWEE1?=
 =?utf-8?B?a2RSLzVoVCthcS9OSXNyUVdFMDRqYWt5S21nM3dtU0NxL1l5UFpCdjVKMTU2?=
 =?utf-8?B?aExnb1dqcVo0dHk5K0FKNnJ5azd6aXEwY3ZhVEg2RElSN0IzY2IwcDFYd0tC?=
 =?utf-8?B?ZkorSWU4N0lTbDRMK0RmNGd2QWZ6MzhaSzkyN056R0ZMUmg1YWk3Z2VmTkF4?=
 =?utf-8?B?QTA3RUFDeGFXVXp4bmxudG1jWEltbkE4alZnZzVJWHJtRXh1UDQ0VnBubmEx?=
 =?utf-8?B?Q2N0b3hEZVBNVjJnMno0WHFWZTFrT3c5RjM4YklyOFNzYTVvOFErTE9NeW15?=
 =?utf-8?B?QUxRanZML2F4dzRYYXEySGRHTWNkRmtuRWEzSzFrWnNCNTFYS2Z5TmNKS0FR?=
 =?utf-8?B?Q1hpUDBVY21UYk8wWTBRUFk1Q2FWOTRhN29uT2VzQW5STUxaZDY2QUdlQ1RE?=
 =?utf-8?B?UURVM2UxWWFXTU51bDBTZlA2TUNnaisvNnlvakprMzNRSi9scFZjem51NmZL?=
 =?utf-8?B?N0d2QklsUEx2SmFPazlaTDJnKy9yelJ6TmdXYVZDdENETlJ0U1pUUUsyYTRk?=
 =?utf-8?B?YXd0ZnF6Wk5GaFB4dkEzSkVsUGsxYjJPd1RMdmNUbWdISW5EejVEOGdTdDN4?=
 =?utf-8?B?WVFIZnhJYlNCZnNZVFp3aGIzQnJmQXBqa1hDOEVsT2dEVDZIV2RpbnRvUlZX?=
 =?utf-8?B?RGVrdDN2WUtneG13elNTeTZ1ZjRPUGZSNXNTcUNXMG9zdGhFNG41SjlRbGpw?=
 =?utf-8?B?Y1FrbWcyQndKT2s0enN2alQxalRuZzFhMHNVZktXeVRYamRiTnJla3oycHBI?=
 =?utf-8?B?TWcvOTVLZzA0OTJ3UEg1QURldVNsbnZkVzRrYm4vUmovWllseWYwSEdpSFRK?=
 =?utf-8?B?TW9hMllYNzBCQ2E3OFhNdDg4a1d4VXhYZHV0R1l3bG5JVlgvOWdwRVJuN2pV?=
 =?utf-8?B?UE5yL2s0K2N3UWJTZHFmeXJDQUwwaC9zcDJSVHA0LythTVRHclA4REpVQ1Fl?=
 =?utf-8?B?bGFTZnFOYTZPaklJQndaR1U4bVJsdktVUk04RTBEUExNTmR5eTRHY3pKNm5N?=
 =?utf-8?B?TnJBSVBmd3lndlllMEkrNkRTdVJCQ2pscDNPQ2w3Q2s3Q2lYcnhHQ3FFcVNZ?=
 =?utf-8?B?bndrV0dHM1BKdmFhcldCWUNGM1JJMjlITENscDFtcU1uclV2TSttbTdPdlo0?=
 =?utf-8?B?QlAvcWNNUXF0YWdtWWRkMWlwUlJDMHNtcnF4RHU0YXM3eWVNZ3p2L0QrYS9n?=
 =?utf-8?B?WVJmeCtvL2NqWXFVS1k5ZGovcTVXY2JycUp2UnNYdnN0bTFpS1oyZ0RCUE9F?=
 =?utf-8?B?bElqckc2cjh4TTJGMnlnSStTOWw1dzUyOWVOblNmaHArTmxxc0FMTjBqSVh2?=
 =?utf-8?B?eU9aSWd0K2RHMXVqU0NJTnUxNHdRM2NQZVFyM3BLOWVJeTcySVRBUlVNb1hy?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4btKyq04PPJu1SPG0vOt7uU0wsVGXyjNOnvuKXmlt6zLILodyh1F28P+//5/CF96XEDz5x0c1ZvQjcsUX+d7eanVtDs4j/NoUaYAWy8Khk4ChG0MlcE4FIC/o84lpz1L/sTy4NK1MCBFw2A0CmKrh22UTSw9RM/ZnC5zTti/x0RqoEqHwX1Z6sZII+qFYT0+1PkTiK0A/safXN4vPEUcZDnNKDYeZnEIWl1BD4nPiLKx4YqoQbLYEs5Lwzqw5Nxc73jqYJGUOI6IrrjLKXKDUb5czjYY1NmrbIffVC6d7ZzV+AX7OXoERe8fEGW7Z7pHFNuCXpf6fBz2/h7VNsnhuFojPdX/RdN7szJt15G7cglpHCcF53ubPP4XelLq7n+WzEwTfrmDRNCY4Knu9h8ZwT370tLA6EIdKGgOMrHlk7WDbwK23xLARhQlEhhdTokvSA9EgYppPO7JMhLtOIJLji3HfvB5SpulB7ZxXpAi2shoDfvCjUB9UeCu8AU42I5XYn2TsNzXMn0Q0LtePq8Lz34WockDE1kbq7Z6G4+/eDq/cFsW3+uLw7Zlt47IjigK3wtFkGC+zHM2joIZBJiESqbFPQlgryPXNgnATn3+aPq1k8LaclbneKM4BIuHuNS0HqJMSx3ex3+mFE3heEq2ygyBlklE6RVlBhVLaaHE0QGldxvNIWYYkdkSJojMs/oicxlo3tT1+t0D9YSeDOJPCzzcRtZ/DIZtFTj0bh+CVZ5OEnG7YDulGqQPSE8yAWheT+ULolDJqtEpxuUump7mFUAqMEp4cYqpHWmDMm+6bef34zf9pKuaFz2y8bk9raby
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90bb23f8-8c3c-4363-74d7-08db0ac315c1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 17:28:40.5457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W+fP2lS+QW4LC7y/gNaTYkI38TeDjkfilFBv9bNqBuQtcUw8+5k9wmmFvDt8LiI+XbJ/3R8PuC8XhBWjNMt1hatbbT1jzFuycnyJDWPIRms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5888

On 08/02/2023 2:37 pm, Jan Beulich wrote:
> Rather than doing a separate hash walk (and then even using the vCPU
> variant, which is to go away), do the up-pointer-clearing right in
> sh_unpin(), as an alternative to the (now further limited) enlisting on
> a "free floating" list fragment. This utilizes the fact that such list
> fragments are traversed only for multi-page shadows (in shadow_free()
> and sh_next_page()). Furthermore sh_terminate_list() is a safe guard
> only anyway, which isn't in use in the common case (it actually does
> something only for BIGMEM configurations).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

