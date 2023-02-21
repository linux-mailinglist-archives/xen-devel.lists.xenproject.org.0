Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A33A69E6A6
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 19:00:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499134.770167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUWvu-00072v-4h; Tue, 21 Feb 2023 18:00:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499134.770167; Tue, 21 Feb 2023 18:00:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUWvu-0006zN-1g; Tue, 21 Feb 2023 18:00:06 +0000
Received: by outflank-mailman (input) for mailman id 499134;
 Tue, 21 Feb 2023 18:00:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aMCI=6R=citrix.com=prvs=409bf5b25=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pUWvs-0006d2-RH
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 18:00:05 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c4b153f-b211-11ed-93b6-47a8fe42b414;
 Tue, 21 Feb 2023 19:00:00 +0100 (CET)
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Feb 2023 12:59:19 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5459.namprd03.prod.outlook.com (2603:10b6:208:296::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 17:59:16 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6111.020; Tue, 21 Feb 2023
 17:59:16 +0000
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
X-Inumbo-ID: 8c4b153f-b211-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677002400;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jm+/EiayX+QXIKjrZJgSObO+ob28AtNgjOn2G9xcG88=;
  b=W6F35rxpOrA0wVXAMQMV0uwbVSb7g449vlQ2DKmxRHWoG02o3Rn5Xotv
   t7Q5xQBqk3/+l/CYY71anbcu+BBnAY9LhHFQtl8g8qlK349NzaCfXedbe
   nk45vodBMn0bZkGoxDazaLvMFbNYHWfNEOvYOMmKKHRbqGIbPcaIjlJpB
   8=;
X-IronPort-RemoteIP: 104.47.55.174
X-IronPort-MID: 97856259
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:fqyYyKvQdiVTPVooxRVk5zTFE+fnVGdfMUV32f8akzHdYApBsoF/q
 tZmKWuEb6nbNmamf4x/bI6ypBkCvMWGzNdgHFRr+C41EnhH+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj51v0gnRkPaoQ5AWEziFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwOS8NUi2Ko+yK+OiRFu4zlMsqHODABdZK0p1g5Wmx4fcOZ7nmGv+Pz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60b4a9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOznpqM02gDCroAVIAQ1VnSUjsuCsF7gA9dDO
 3UZ3iUAtbdnoSRHSfG4BXVUukWsrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQh3
 0WFmN7BDjV1vLqYD3ma89+8tiiuMCIYKWsDYy4sTgYf5dTn5oYpgXryos1LFae0ipj/H2H2y
 jXT9iwm3exM0YgMyrmx+k3Bj3S0vJ/VQwUp5wLRGGW48gd+Y43jbIutgbTG0ct9wE+iZgHpl
 BA5dwK2sbFm4U2l/MBVfNgwIQ==
IronPort-HdrOrdr: A9a23:4JLnCaptOJEVLPeEGLaS7xcaV5vLL9V00zEX/kB9WHVpm5Sj5q
 STdYcgpFHJYVcqKTAdcL+7Scu9qB/nmqKdgrNhTotKPjOW3VdARbsKheCOrwEIcBeeygcp79
 YCT0EIMr3N5DZB4/oTTWKDeeoI8Z2iyuSFlO3ex3BiQUVBcKd79Tp0DQ6dDwlfWBRGLYBRLu
 vo2uN34x6bPVgHZMWyAXcIG8LZocfQqZ7gaRkaQzY69Qi1iy+y4rKSKWnt4v5eaUI5/V4Ryx
 mNr+XL3NTqjxh98G6W64bn1eUhpDIm8KoIOCXDsLlZFtymsHfOWG0oYczlgNizy9vfp2rDRL
 L30lsd1oJImgHsV3Dwrh331wb61jEyr3fk1F+DmHPm5df0XTQgFqN69PxkmzbimjYdVetHod
 129nPcs4ASAQLLnSz76dSNXxZ2llCsqX5nleIIlXRQXYYXdbcU9OUkjTNoOYZFGDi/5JEsEe
 FoAs2Z7PFKcUmCZ3ScumV02tSjUnk6Ax/DSEkfvc6e1SRQgRlCvjol7d1amm1F+IM2SpFC6e
 iBOqN0lKtWRstTdq55DPdpe7rLNoUMe2O3DIu/GyWdKEhcAQO1l3fe2sRM2N2X
X-IronPort-AV: E=Sophos;i="5.97,315,1669093200"; 
   d="scan'208";a="97856259"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GN2P9TZolxuzpzqk6Xi184MI3QeJjS/a5IogRJyYe4Ep9Gdjg4mIbGbtYN3mbC2XFEFuRgUvEFDxWJ4ZItyGa8X757O7VARToLQAjrgef6GzMSj9hyRDX7E2jHETK/alFWO0MONOohOR5DqDkMqzkRFKXm8LLfAi5nyxT7ajx7clVuYuwZXPJEXYY8se2FcMLHqKYNGEUg/tvwTRyBQtV53z4qTB4G3RUsHe8GcNAL34XCWr71UjOFOeR9kA9jYf9N7J+O6V8+xs2YcDZYgGiyUA5NxAhzZPPsS+zvZ4Yu+ykv3ziT7Sfcu+l98xK/+DtZ2O8jTlMj8hWjXbviHjmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W4B32Yjqam8iFFIgpR+nelJ2DgQphaHmmqzDDs2HVGY=;
 b=XQn3nGElxgXgLGdN2/fdB1avXQPetGmzUmT9lNWVCbmV+cxAcclfyXFhzgmc3nUZU5K7sdZXp0kCQOn5RC7+ox8UMBlk9E3Ab56nd3tHBA/8Ot/IKTOoHxonI2rHWzLh8dpvL4ySFECioaGo834nf6uf3ii11hxDJQvTK6K37sgycvRkcO0btWjsUL3/GDKOjQ5TRgpOL2sIKQHwZOBaRE6utrZaIqVoRiwDDZLnVIfxC7gUYODy0AMTvxEIcFx8iHHzoWI54XcGj364eKRYTsGnNCPIBVcsrtEkxbSIg+Sx3yTMXCaziSKdn8+p3O70gY3TITD9g2EQ1BD9izefcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W4B32Yjqam8iFFIgpR+nelJ2DgQphaHmmqzDDs2HVGY=;
 b=OEMqICPQPoPPoaPcfFYrScQnZx7EgtwVD3TroPDhfoXEmczgpVZgtuv7GG0qmJhLec1u/WqdAmgd4uJimj53fp3n0pUwlcp8oEAFyagx5Zr2Eh687SW/21Fs3cUiIBJTpwbpUEi49ivRnhENZ7Z/o7cFuShKpKGa92+KASEooiE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <04e6ccb1-919f-671e-6d70-15a74e01bbb4@citrix.com>
Date: Tue, 21 Feb 2023 17:59:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v2 6/7] automation: Remove testing on Debian Jessie
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230221165542.7642-1-anthony.perard@citrix.com>
 <20230221165542.7642-7-anthony.perard@citrix.com>
In-Reply-To: <20230221165542.7642-7-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0026.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BLAPR03MB5459:EE_
X-MS-Office365-Filtering-Correlation-Id: f0bcc83d-0224-4d66-d444-08db1435592e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	apoZTt9G/Mjvi5uEIr+ix0p4mWGx4jyAmAsYJxPOK9/oVj0+UOLQCDkbak3p13xK0cv+Zq0gsLhZoRo7pwfp/Fu4ICBHFZ9S2sspJc9X/Bec1qdFDGr83DoZb3SCAcbmBmf5WZCLxdSu1h8NHYv8UkcXR+FeXIPiFEt0mDZJ8TSUsTP5MD9ouERsbQaPJ5nznOGKiLBURh0fNLskeT0fvRbBsk4tsLwIeC/tXAGziOX8btGbXO3dR+WfZD9KLm7Tv4bsHnmi7bFJAk8dFbtoEDZ5fbS8IzuKLpP38QUf0/PjdFtR1fF3sQmDGXkHvvNxeQfSPtJPEsfcqjh+MV2W5gF1xUbr4cOfOIdqT7zVX/+vXn8aTLsEU7M9DLVI1fDKd8Uy9YJeHvXlJWnSsmt8oVmcKInqAll7Nuf9AFDUbhit3dyvxVs+Wa//AXr0jvgs/WoCYs764lGdQzsyHxFXxwP6P7kqQDbiSLXwDpd+PjNPf+exwksmffTTlwR0RCQgC6P9RajYOcXXABmVMGSCaGw/ontkLdkCk2FUb5njvQ3kQGDh1//Y80rdApZ1ERLoJSuUVkaurlZBZoeVYV6XFqb+UoWsS0z0FAdYZOjEKaPFoMAgE2uE9fr4gewXMe2fnPkukVNMUOq15/c6YDdWeoI9MAPj3QP7bCIg7sEBDIotqYTENOwg2AiA2U52Uvg3qachcObSSMLgZSpPKCJRGsfw2Q7MjWULhAH8sbZ9ZhM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(451199018)(36756003)(54906003)(83380400001)(316002)(6666004)(6486002)(2616005)(6506007)(53546011)(41300700001)(26005)(6512007)(186003)(8936002)(2906002)(86362001)(5660300002)(4326008)(31696002)(478600001)(82960400001)(66556008)(66476007)(38100700002)(66946007)(8676002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWhJWE9pZTJFb0lpSjU1aGRtbERBeHh2S3RacDlFRDZyamRicjhyMzdLVXdy?=
 =?utf-8?B?NE5sRHdra0ppRjQrL3VnWXFFeDJBT1pRakxoUVFyQUt4d1MreW51OXhOemZv?=
 =?utf-8?B?a0lCM1IwQmhVMmpaSTBaY3hrK05CcXVQeC8rZlN5WEpvSUhnRlRHcFVJY1Rv?=
 =?utf-8?B?YXl0Si84RjRRODNlT0xyc0wrZDZqK1E4TS9oNFRtWVVrMXBITHdJVlN1bExY?=
 =?utf-8?B?OExQblBkWGpCa3dDY1FLWGkzOWZ2dHJBUEtESzV3bVZoaDl1d1Uvc0dOMzJa?=
 =?utf-8?B?Q0d3TktsM3o4TUx4WGZWUDBERDJTWWRTOGRyOHhYUGhJNzNscEpNNXMycmM4?=
 =?utf-8?B?Tmo3OWwwM2N5bGJtTVdQOW84WkxzOXF2eXNSUld1Ni96UWJwcGpwZU5RUkhT?=
 =?utf-8?B?Qjc2UHBBT2NSWXhhQ2czNDFrVURCTHpNbkloR2dBWllISXpQVlRhU3QxZEZF?=
 =?utf-8?B?OWQ3R2U5L1prUG9UNUZUS0Jka2VCZ0lPK1FWVCtjaG5WSEY4VzlLaENJTkph?=
 =?utf-8?B?LzdIYkJQWkxGancweVozWVdpeXF2Zld4NFE1cjJ5cXBsSjlzdXp2dU9Ka2lT?=
 =?utf-8?B?QVhLY2Y3TVU5bGpRZ1hzbm12YTM1MVFkQm5lR0RMWWgzWEtJMnZSaWJpb1By?=
 =?utf-8?B?WXh3Z201dXlGRkdOUXcrWUJMVVNjeXE2cnpIOUVzZXNPTnIxb1h1aWxmcVph?=
 =?utf-8?B?NVZVV2hRWm0xSXdMK1hQMVY4Y3hLQVhDTUh1eWZMOFZKaCtwaGpHdWcxemZW?=
 =?utf-8?B?dFAxbFZ4MHZsRk5nVm0vcWRhdVplUTJFbHJUcFhTcVl6d1FKOUcxTUJFbUdX?=
 =?utf-8?B?a2tURkRwMUlJdjBmWkdUL1NnWTlTeCtQeThCeDJIdjlzTHpPemhzZnRnUXVU?=
 =?utf-8?B?LzM4ejh5UzBLNndHVlJmY0owNGlaeUg0TXB2K1lSeVdmSXd1ZDlvdjZoY0Fu?=
 =?utf-8?B?R0sxMXNKOTZncG54TENUUnJwOVFJRVVzbXZVRGlqaGZnbWZSWGxyZ2FBSXk4?=
 =?utf-8?B?T0ltRmVXdXVRbk9TZ3VlNE9PWEwvdVlEVVg3bGM5anR4TkZkUk4wRno4ejdW?=
 =?utf-8?B?VWovejl2SGliNVNhdC9GbVVSZFZlVDVoMmJHeVkrVXNFVG10NjloNFR0VElT?=
 =?utf-8?B?OHNpeENLeFFISnRIWmd1Lzkzakk3Q3B4K1diUHJtU1lEYWtYUUd3enJ2T1RM?=
 =?utf-8?B?L2hDRXNVTFRoMW1qbzR0cTZCd1ZmRVZLZVBnNCtVRzNzczFIWW5Pd1pIMXhE?=
 =?utf-8?B?Tzdyb3Y1b285RVUrVFZCcmd4Ti9HSW8vZFJmQVVzcDFGRklBYlQwNlBiSzdn?=
 =?utf-8?B?KzhPSEJybmRVZUNoR2s1eElWRXgvUlp0eWE3d2puZC9uRW1QWHErdiswb3hr?=
 =?utf-8?B?YU01Sy9wZkJWOW95L09KR1Rsa0NrQ01CR0daS09TUkhtc2JpNDJLY2xlVDE0?=
 =?utf-8?B?Y2RhNURmUVhYbGluMFkyb1VmazZ2cW1FRUFnbHNlRm5PdE4xMXBjSTlSYklB?=
 =?utf-8?B?UkpHRHdlbTRKWjVOVm1GUTM2eS9ZaU9LN2MyNzdpaHd0OWlERm54TUxGQVMy?=
 =?utf-8?B?VVBlK254MmI3ZG1rVy91SC9zanNSMXA3cVYxbjgwYUsxZmI2dlVLMUpOUHFq?=
 =?utf-8?B?ZGtSMmNZMSt0RXRMRlVIZUh0YlE5ZUY3bzRuSVlLTFdGUHc2K0NmMUN6NWJv?=
 =?utf-8?B?eEhSLzJBZDRqUi9BZDhCOW9CMTQ0YkhEQ3E1U1FpOXFNY3lkNUtiV0ZMandt?=
 =?utf-8?B?UllGWUlYTEQ4OW5OUjlqNFhUMnUzb3QzYjQvTVVucElWYlUxM1IzUnRYaTRV?=
 =?utf-8?B?RW12RVNlNWJQTGVaeEF4R0pSdzA0Kzl4TUIxaC9BSFU0VlRVMFVXMVBOcGJX?=
 =?utf-8?B?ekdaYVQwUnhCMURld1hrRVREVTd1b3NpUjVQRWk3ays1NEFsWWplWjBiOHdL?=
 =?utf-8?B?elp6SW1pVEc3SFpQUTNnM2s0MHRuYjJMQVBzSlY0bGJiWm1uS0E4RDlGU1ht?=
 =?utf-8?B?RVI2K1RQbTI2VkJsRWwrWms4RVpBVUxXZDJwdkVhcnlsa2s4SjRsbnBhclEw?=
 =?utf-8?B?dnNsb2V6S2JtVURNSk1VSXdUT1R4VDNhVHM2aWFValRzY2k2NE1reEFDY3lY?=
 =?utf-8?B?enA1emt3c1ZMU0E5ZmxhVzBESjFkZTJlOXVVZUpvUG5vcEQ5SDBKVzUzMFdK?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HLVwyRWT0ZuB0eZx26RGszlwkAWqJFZgwxrryUWsTivM1mqqigzi/VQXrEyLr00MGa7O8cJeiOJbhLv6fhvdaVPIAQj0fQ0FGKZjFX0fJbgAQsiQD5FPBJj8KenIB29AcTIo6TozXxzXtGejMy9iBd2iR+KLDT1BTRkYdSFGxG3DqUEJD5TA1J7DYLs9UMFb85xwEEZWThVHdK+Aj3LITlZLAq7RU4zlv3rTtuPvDQMCFyjA+Vw2JF1N6U+FMLQf/KABP94UWQkqtIGiqAh1Eb5ObPamTUNuMIiyUP8o3AaKkGPVDhtWQPNzHd2I/IFFw1KJrNUvqVNGKMhmIF1/dWjVEuTPF8qtSHhkKg3BwDJ5fqWr9kIwORHKD6eATRfOole4KjrlEtLM9RCCKjWak+I83TdDCHZuQOy+POMtAfpQ0438A6jHwQPWVtqnL1QI0A4Xix9Vj+Qa1vJtRQWIUvfYu98bkHC8JgwnMOExc54ZUTxhDPjSbjIvfjVKuozr2W+1+InzmlqL79f4T5Cno+87Zdo/1agoSLnS50JqDRt8nbIYm2yFNeceUyEAiPECLGIr1RTR6ObSFs5alxCYU3XYo2eg3GClt179/xLTd8kQ7WNSzOyXlCtaOzfvRz26OTl7kGKfuoE89Ss6koewKPpLXoX035mw8EKhGfto+1FPdLgrpL4uyf8lX3v4Qkb71ttQGcgOqbFEvUZ9KcJN5RrXD2joeZxW+G9zEEs8bpRNrfzb4DkAVUAKUO/K7S4xbk/mfVQKR/ygro5M853O3LWP7nOjz9HDrdVDCSmkglGoHJ60VIhDm8gICvxMMIxkavbye7MNOsuUL42mjS2x8A==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0bcc83d-0224-4d66-d444-08db1435592e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 17:59:16.7776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLHf7bHFZajblULWKfJOmymVC0SyhM8e/Z8KqDdvkkka0e5qw7yq3+Uy7PWMQIOVFt/yw3YoUOm5RP5KboIRYUkB9QZQb+dV8I6iY7/P9Lg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5459

On 21/02/2023 4:55 pm, Anthony PERARD wrote:
> Jessie as rearch EOL in 2020.
>
> Even if we update the containers, we would still not be able to reach
> HTTPS webside with Let's Encrypt certificates and thus would need more
> change to the container.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

How is this interact with the other patches in the series?

I presume we do want to take patch 4 and rebuild the containers, for the
older branches.  And that's fine.

And IMO we should be dropping jessie testing, so this is almost fine for
staging.

Except, jessie-32 is the only x86-32 build test we've got, so I think we
want to replace it with a newer container before dropping the jessie*.

> ---
> Notes:
>     HTTPS would fail unless we commit "automation: Remove expired root
>     certificates used to be used by let's encrypt", that is. Patch still in
>     the series, and fix Jessie.

If we're dropping the jessie containers, do we really need that change
too?  Because we really shouldn't be playing around with URLs on older
branches.

~Andrew

