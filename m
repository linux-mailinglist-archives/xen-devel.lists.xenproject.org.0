Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9E768BD95
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 14:15:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490429.759115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP1L3-0005YS-4a; Mon, 06 Feb 2023 13:15:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490429.759115; Mon, 06 Feb 2023 13:15:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP1L3-0005WT-1L; Mon, 06 Feb 2023 13:15:17 +0000
Received: by outflank-mailman (input) for mailman id 490429;
 Mon, 06 Feb 2023 13:15:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N+3J=6C=citrix.com=prvs=394ad1b64=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pP1L2-0005WN-0B
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 13:15:16 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4972d7b0-a620-11ed-933c-83870f6b2ba8;
 Mon, 06 Feb 2023 14:15:14 +0100 (CET)
Received: from mail-bn8nam04lp2044.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 08:15:04 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6149.namprd03.prod.outlook.com (2603:10b6:208:30b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 13:14:56 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 13:14:56 +0000
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
X-Inumbo-ID: 4972d7b0-a620-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675689314;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9vH0XCdRKZ0INIhUvxn6tuEtgAIYHPSpPQap+Ktx/gc=;
  b=OLDSr+60hu11fVDQXNbAsYPBDmWe4GLBpdowllxmRuiLlXzV1G3GHGuN
   ew7zFqG0qSeSBM0KiHlr53egAfaHUsq1+gk/btWm1TL1c7X4mTs2cE1DW
   +k4wH2sYnnPErCnFI95tqpl0OgDl2v5ooji5RNZhulIA53GObwfJOSMgI
   M=;
X-IronPort-RemoteIP: 104.47.74.44
X-IronPort-MID: 95835787
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:nOW/hKlCXBnSwLWVI2CVS8zo5gyjJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdCG6DaK6PZTD1KoxyOYy+/E9U7JWDyd9gHlM9rCpjHyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgR5AGGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 ccKcQldYw6ZvsWnnJW5ae402sUHKfC+aevzulk4pd3YJdAPZMifBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVk1A3jOSF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNNPROblqa416LGV7mY+B00dChy9nfuGukucHPxEL
 VUz5iV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq16bO8vT60fy8PIgc/iTQsSAIE55zpptE1hxeXEtJ7Svbp0pvyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLzsaoowFqxJrVZg
 EU5pg==
IronPort-HdrOrdr: A9a23:tAXS/KnHvgijUiHRtKkfbQarhvDpDfNpimdD5ihNYBxZY6Wkfq
 GV7YEmPHrP41gssR4b+exoR5PwPU80maQV3WBzB8bQYOCZghrLEGgK1+KLqQEIcBeOldK1u5
 0QFpSXA7XLfCdHZa6R2mWF+71L+ra6GG/Dv4rj5kYodCUvT5xJqz5+DAPzKDwFeOGFb6BJaq
 Z1IqB81kqdkbF8VLXLOpB/ZZmmm/T70Kj+ZAIABVoO8RDmt0LQ1JfKVyKA2wsYUXdl3bcm/A
 H+4nHEz5Tmiei/1hjfk0ja65g+oqqH9vJzQPaUj9QTKHHLlAGlf+1aKtu/lQFwmvir9FEp1O
 Ptjn4bTrxOwkKURHixvRzunzPtyykj8FjrzVPwuwqZneXJAAgiDtZHh8ZnfgDC60wm1esMqp
 524w==
X-IronPort-AV: E=Sophos;i="5.97,276,1669093200"; 
   d="scan'208";a="95835787"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZk/V49lrdWZGommYyn9ElIcH5bDgpspOOpuXsxlaR8Qq9DHDCn3W3ApEDov3/tGqC27VWqAYYaE2j5H9I/8MyrU/MvvBoZvKUqMM+zOCA9UY54Ky3Fsnv622uhTdnw3mleAuNBWV8qCgqLUiSF+2WmI79uDjXR6aImzynKY08ur0LbXj2733U5muuKv6faQ2SMjMGUsFRLDNRd1n8wnx6uhg1SDGfChdOnGW880b5QqkIKc3AjGSFvoiA/HFv49dtO06qA1vS7U8hAa09CLa2m+F1gK8eXJxVbIFVOoCAfLtsoI8eWTtcRfYlVy/jyIv+iiXhy6OKZvUG3O2KCTjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vH0XCdRKZ0INIhUvxn6tuEtgAIYHPSpPQap+Ktx/gc=;
 b=BDelcwAOCeT+PiSx0PP3Sq6vRQe4klAlC3sJyhOu8FwWpQ7sC2ze32w0JCf1muglWvzgXqCekEkAlBjfWuPZYQDc7m9xqITtQC/GwwfOe/aCQv8mSLOJV92RbUHH4VQo1OeczD+dbvNswZ0xcANtUmFb2DtRuIxkA64ecXb7YKVef4KB46CJD8FFBPXdRCIc66YJ4ZDLIr7svUl0KqIogh0z2Dk+j98D6L77tR4byMSemoVoNLUHJu7WmoS3wDWv0sUfGFxluqKbhFjtnECBbFCl2faYp7/b1GYW3dLEUun1K5xc3DU6l4LQhTvSHpy/8nLR/ueX6VXe1DSl74vcLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vH0XCdRKZ0INIhUvxn6tuEtgAIYHPSpPQap+Ktx/gc=;
 b=rVjRSbe7hf3gSpQAJN3BITCL17Osa7ACWPqJ7id0LtgUKupCpoUAjiwebN8zrxBIGOdrzoYaBvboRYBeIpcS5ugR8pgz1h+pOw//NlCU3sYqGx5ErvXJ0yBBauFiClQlqT7ITTlORWurYrstm7e0RHnleUXxNe0JJVakdcgFHyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c08bb07d-0ac9-041d-15e9-e2fa4c3b75bc@citrix.com>
Date: Mon, 6 Feb 2023 13:14:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] x86/time: use public interface TSC mode definitions
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <74fb4738-b5bd-ddbe-e376-eeabc84a28be@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <74fb4738-b5bd-ddbe-e376-eeabc84a28be@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0247.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BL1PR03MB6149:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f3e9aff-fb57-4a6e-a7a5-08db0844245d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5XRXT8SsF/mNKSqTXUkYlQuOtBq24faCSmTwzk8PdfGUUjscxAb2sU8KwTj+cTp2dsq1KGG21Rvz8ftv+4DbnfBFydUDbK9DCyyiAzZyB7UkIcBgzg6Hse6WxnreubBw//Z7lSYQOintWNVRbbJerRKBb6JbXLGd3FxmArWE0ZY2ScR07pazU7OJzHinrtdiH+5M1XXbBkWNNo25PkUrsYnoAac9q8U2KdU4hQIpf3lk8lwUV4buxnC+ygPfrYc6+CzB1pF4icq2bHzuNzo9buGZtApJ/wya62s/WiHYVo6JjNYH5IaI/6F+lSk2BDCI1rjkqLpNVvsSOPQgAvbdVjOz2j/FsBropx5PnDyCJXx8FvS2Q07oH+s54mlqQirvRDOP634E4oFOBY/dIndRsaR5L8HQ+xYzKSp+YNtAg4cafu+r2XzfDFKhUlt41yambYGC2W9mAAiV3nHZK3aERrC0Z+wB8BM8mfV9ke3BC6lhTmWtXXSddrbmyThwakgNO06JC3GWJMfHVwABejrvPBHAD5IawNMAKeHq2f0f0aukNr8fLRi8m00kH7vlPmIhbdDFSZ5/m6fsHgkhSLCHxO6X17DyHpH5MkncnrUXs8twdtY2v5H8W0PauAbxzSjA0fz6s53CYLsgFVL/BAbGW5vUM1Hgy1xr+bAXYhq2A9QnxYtp+LG9iMRsxzP6AUeR4JXGqK0qYsOy4B1/cguQvlDSdddxBf+6ZY/PYM0kL1k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(376002)(136003)(39860400002)(366004)(451199018)(66946007)(82960400001)(38100700002)(8936002)(66556008)(41300700001)(66476007)(4326008)(8676002)(2906002)(6506007)(53546011)(186003)(6512007)(26005)(6666004)(2616005)(107886003)(316002)(110136005)(54906003)(478600001)(6486002)(558084003)(36756003)(86362001)(5660300002)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUR5ek9iaUp2WEx0RnNrNFBGbi9sUlZoTCtXcFpMMjgvcDRKQ0RGUGNQeEhW?=
 =?utf-8?B?cGlPNkp2Qjl1YVB5VXIyMDA3eldGUzE5cCtjM2dPWkd2MGRjSHBzcUEwTTdG?=
 =?utf-8?B?TFBYNmNxbnBmbWhwVHc0NnJvcUlPMGo2ZE50R2hRVGRmcmlqRE1Bam00Rk9u?=
 =?utf-8?B?M21GNGtUTC80S0lpR2luN2l6SHdzTXo4MWp1ZHJVVHlJekk3TThzenhnMmtw?=
 =?utf-8?B?OS9oRTZXbHFxWUQwMTFKbkkydFRoaVl2eGhZaExid0lrdS9DcEd5QVdRc3FQ?=
 =?utf-8?B?YnZqbmpOMGFCQXdNaXB6dkZhUnJieG5DOXIzbnVwUkNWUFZpdnBxb3k5alhW?=
 =?utf-8?B?RFpLcWhwaUlYL0lzaHRuZEM4eWNFZUJJb1ZsVFJkd3VINjlaV3NSWi9ZTm56?=
 =?utf-8?B?WnNkSC85Z3ltN3Z6T3Vkb2VyU2ZMalhHcW9CUy9qYm0ydGl4aldOc04yWFV0?=
 =?utf-8?B?b1ZJOW14YmxGNHZZOVRaVzhvOEJjQmx0QzZTMjlDWWM0aDBjUEhGKzNhQUJS?=
 =?utf-8?B?VlFHTVNRQXp3TW9ZVmhvdCtaaGwzazg5Y2ViVVhQQ1B4VWxlSUs2T050OXJm?=
 =?utf-8?B?enpaNkdUYmlLV3kwbGtlWVE0M1ZDMkM0dWhnRGM5U25BOU9KaEIyazBKQVBN?=
 =?utf-8?B?bHVMSWo0UkNhTGlBbDc0ZmpJZzhjUWhFT1dNVm0xRUM1Q1FSeTNqZC9WRWt2?=
 =?utf-8?B?Qks0bTdOOXhHRk9GSW1VU1djamJRd3BZUUxTZjFxNVNzcXJYemYyZ0lCRnVu?=
 =?utf-8?B?Y05hWFNzRVB2V3I1K3BOQitQcUdXNjFCMDlrV0hWNlE0ZXZMMXlKZzVia0dW?=
 =?utf-8?B?ZlVLVVMrT0p2dWxYd1NJVTRsY2t0dUFOTzFPOHQzL1pnckFUV29WRk5aQlpU?=
 =?utf-8?B?b0dwT216RFNZd2s2aS9Gb1ZEUi9hTXF0UGlRZTRIMnpYYWNxWm9KckptOHpS?=
 =?utf-8?B?SkJSelRHeHVmQU5FT3Z1M2VvR2gxaW1pY0ZMRDlNbW5wS0pLMHFlZjJQMTV5?=
 =?utf-8?B?SEwxL2wwcnNDbGlrV1ptOXZGaDBsK09FUURsc0RadURhUlIyMkNhaFNnMDBj?=
 =?utf-8?B?UjhmR3J1UlBlVCt3cERYSlZBazdZS0xrYlV5N2lmNEpveHNwZGl2bmJjSlk3?=
 =?utf-8?B?azc2L1BrRzg2ZElGWkZPOE0rK2h6VkNFeEtxQTdjYlpLUzZXSUMyalE2cUhq?=
 =?utf-8?B?cFRBKzZ6bW5vMnJqaVp1T0sveWdMeVRTcTRuRjFxUXR0bURCeFY4cThpbVNZ?=
 =?utf-8?B?SWRwM3dSbU9MV1JEUFdnR0oxNldMY21QSUJUSXl4TjNFOWdGVHU3WTFCNlNr?=
 =?utf-8?B?bnhNSk1SeHhLaTBRMTRiVXNrRkl3Y2ZzN0cvR3VZbDl5dVBzVDNjVDNiOHVL?=
 =?utf-8?B?QnZqTkJocHlUUzJYTVIrNkwxVXNIMC9lbmZubmRiRVFHeXgvaGNRM0hBb0wz?=
 =?utf-8?B?SWZFZkpqOUREck5yMFBqZzBwYWVDNEJ1VVBwTDlaaVV5aWs1QkpKRzAzNmZY?=
 =?utf-8?B?TWNyQ1hFRkJOVC9jcUZFQ3hSUnRrNjB4cjNVd0c3bUJIWjBGd3NnL3dGQ1U1?=
 =?utf-8?B?Qk1OMmxlRVJtRC8vMlgzbEtJYjRPVmxSSkRmVGVDaitJZjRWMDVTcDJvNFpV?=
 =?utf-8?B?SVF0TVNkN25GdUkxSnQ2c25pTEd2ZVZCN0ZXSm8yTjVCbGxSbVBCVnlleURh?=
 =?utf-8?B?dDZQQ1FIenlJK211VHN5bVNQTlF3YzlYYzVuVlhTMUtHR2dEZXlPc2hxb2xN?=
 =?utf-8?B?ekpKU3oyMUpmVkI3WkdOOEh5UEV3MU5xamt1QTZrMVVFL2hMUkFlM21pQUdy?=
 =?utf-8?B?dEtkNlorTm4wOGpFQmU1bzF3NjRvTmh0KzFoN1FVQUkrOGd4U0hNTmhLZjA0?=
 =?utf-8?B?Tmo5RnZXN0pjNjlrWHJPbDl0K0J0S2FCa1BQaG9uUGlWT0NUL1phRGlpMnNQ?=
 =?utf-8?B?VVBPa3NNNk5KbWZpc0xYQlBVcUR0MVl4NjlHTjJDODNoK3ZONWtpUzljR1oy?=
 =?utf-8?B?YzlybFdSK0t0ZDFKUy9OZkwyVENCaUJkTTNXVEVhWmY5WkJrVVFsaHJMSHMx?=
 =?utf-8?B?cGIrdmhGYk8xMzQzZGQxUVQxZzRSV2ZPWTJrMEI0ZkpON3E5SFJ3TnV1WmFK?=
 =?utf-8?B?WFlHUCtGSnFGRTV3UWl0aW1NaWRkdmVDOWszbUExRGpHMDA1dlJVVGhGWVNt?=
 =?utf-8?B?N2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xnszanliiVFX6Q00qBGEfx0SI/RWPuUs4+Bk3Rsy9Vjfu1HVJhm7efp0BR0scs/GWbQgGZtTJCAKpxG99V63bFUlnMz+WIye36p6UcarDEt3/JnHOYwzuODNtfpTxCBPuyTglo2OjMPbgNOixFu18TxOWDRDf3sgyVZgEjzC4mCAbSJwq6ttkrd8f4wJE/MUnlXaWvxEgx8uU10/+Lk9onsfXF5mXCl0ppN+xB8tthIF/21oEX5Y4IMQul0ADx+oioEmKl7s8wo92R+xVp4tp2qmGICIv5YssL5kxRwEyne2VB5E33x6zkva949wQuOS8yidU7flkS+V95u7xkpq6vjwAyYZOIG5L2EvYt70raQM5TdSUQ0UYdhvA7Gms3w7BfEJsX/90PcF7WSeuTn+1NzHfz0QiVV8D6KX3TqHSozN+3glAdePmPlk9JO5Hd31Xe4YQu3ep35WjwzXYhj2pME3M1Slaqx+Iqdlgw3K4eNQhaYqT9oDc+b0Lo0zTeNsNA9UxnOZJI/pWiVr9UirMBaRZ+kc7EUbcGhcN4i/GuydsYsN0kcweIGHd2HWU7lHVNv6CtSVhEnxJDMmfF940iLmB/1ni5Q2kMfhS5wG8R7tyw4Wl9uLGknYMgsaaKyLpsztwj0Dh4PNPA2CrTHsTVal7AXVXsqLS3g+IRVlSq6jlUYdB+QrA5o3gThEhwVqd3J2tQCOnwbGvVhqZ00RYtjZEdXDn//Ovy3MjgPzmDAa8wRp6p2GuyM2t0cXfE3m21N/l7yJkW5jK7Z7cSCs+c3+4hPcCVAn18Aju5cVDMk170vfEbdmS8b6J5MIWfAU
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f3e9aff-fb57-4a6e-a7a5-08db0844245d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 13:14:56.7097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 83988VLjIwEOf822CW4rh743tQhWg2t31nF/r9HPMcuKAvKIeMB0Zm/mm8dDhAdaxV8zz3bmwpz4szxgBbJpc8T4gjI6tSnfLwoIrpax1V0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6149

On 06/02/2023 12:31 pm, Jan Beulich wrote:
> Now that they're properly represented in the public interface, let's do
> away with our private #define-s.
>
> No functional change intended.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

