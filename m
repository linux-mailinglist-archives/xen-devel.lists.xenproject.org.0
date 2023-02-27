Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE1A6A416F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 13:07:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502449.774254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWcHn-0001ek-1Z; Mon, 27 Feb 2023 12:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502449.774254; Mon, 27 Feb 2023 12:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWcHm-0001cb-Ux; Mon, 27 Feb 2023 12:07:18 +0000
Received: by outflank-mailman (input) for mailman id 502449;
 Mon, 27 Feb 2023 12:07:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mutd=6X=citrix.com=prvs=4152eaadc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pWcHl-0001cV-Oz
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 12:07:18 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45840c19-b697-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 13:07:15 +0100 (CET)
Received: from mail-dm6nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Feb 2023 07:07:06 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB4966.namprd03.prod.outlook.com (2603:10b6:a03:1eb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 12:07:03 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 12:07:02 +0000
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
X-Inumbo-ID: 45840c19-b697-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677499635;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=S/P61n0rVmytk8bPQrEsRCkW6IAaRnRdSI2H7puELhI=;
  b=EDz0WvsuirdbrwLHP4l7OWwEDFMJ9Q/JY6q7KvXReFxyn4pGAOfYYn2d
   47iI4F1vm3jeklKMnSPXMhdIDV9chghBCXLB0TtTUHUgp0aFnkFRC7NE1
   8v1GFERja3JuAy1Ly7nglUkxfOKHX4BWnci6fcQSvuwsx/QsJmTBzUeTL
   k=;
X-IronPort-RemoteIP: 104.47.58.107
X-IronPort-MID: 98054114
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:i/eQDq+fspG6LMs4dXy1DrUDaX+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 mpJCG+AMvaMa2qgfd4iaN+y9UkGvpDcmIRrHVM9rX08E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmP6oU5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklSr
 ac9IR0IVimKiri0+recUtNmlv0aeZyD0IM34hmMzBn/JNN/GdXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWDilUpj9ABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCdJKSeHhr6ICbFu7mlU0JRgYFkOAqNqdhVySAfQYN
 k0q9X97xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L8/AKxFmUCCDlbZ7QOttIwAzoj1
 VaLntbgLT1prLCRD3ma89+8rj6sOC5TMW4LYwcFSxcI55/op4RbphjSVMRqFKm5icL8MT71y
 jGO6iM5gt07ncMNkqm2413DqzatvYTSCB444B3NWWCo5R8/Y5SqD7FE8nDe5PdEaYqcEF+Iu
 SFcn9DEtbhRS5aQiCaKXeMBWqmz4OqIOyHdhlgpGIQ98zOq+DioeoU4DCxCGXqF+/0sIVfBC
 HI/cysIjHOPFBNGtZNKXr8=
IronPort-HdrOrdr: A9a23:QpM/jqjCWBcOT/ilq8ga/GwECnBQXxl23DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3IwerwRZVoMkmsiaKdgLNhd4tKOTON2VdAQ7sSlLcKrweQeREWs9Qtr5
 uIEJIOReEYb2IK9foSiTPQe71MoKjlzEnrv5ak854Hd3APV0gU1XYeNu/tKDwQeOApP+tdKL
 Osou584xawc3Ueacq2QlEDQuj4vtXO0L72fBIcABYjyQ+WyRel8qTzHRS01goXF2on+8ZszU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjvdTGcCWjcARCzP0ziKlfp5oVbGutC085Muv9FEput
 /RpApIBbU+11rhOkWO5Tf90Qjp1zgjr1X4z0WDvHflqcvlABonFston+tiA1rkwntlmOs5/L
 NA3mqfuZYSJwjHhj7B69/BUAwvvlaooEAljfUYgxVkIMsjgf5q3M8iFXFuYdI99RHBmcQa+S
 5VfYbhDcNtABGnhrbizy9SKZKXLy0O91y9Mzc/U4SuokZrdTZCvgUl7f1ap2wH8p0lTZlC+q
 DrDoRE/Ys+FPM+XOZFH+EGTtKwCmvRBTT2EEzXD2jGOcg8SinwQ7ie2sRp2AmnFaZ4vacaid
 DPVkhVunU1fF+rAcqS3IdT+hSIW2mlWy/xo/surqSRl4eMM4YDCxfzPmwGgo+lubESE8fbU/
 G8NNZfBOLiN3LnHcJM0xflU5dfJHECWIlN0+xLEG6ms4bOMMnnp+bbePHcKP7kFislQHr2Bj
 8GUCLoLMtN40i3UjvzgQTXWXnqZkvjlKgAWJTy7qwW0swAJ4dMug8ahRCw4dyKMyRLtugscE
 53MNrc49eGTKmNjBP1BklSS2hg5xxukcXdultx1Hw3GlKxdrofodeYYGwX3HycPxN0Us/aeT
 Qv/2hKxQ==
X-IronPort-AV: E=Sophos;i="5.97,331,1669093200"; 
   d="scan'208";a="98054114"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8U43ObtPwQWrVA+SadAFJh/AoXoPE3vebIeHCA/euoVbPQgSbv+SQwIniATuLoXHwJdfnlO0VOBFT0aUODVLrGlMb721vbR1NWci1a5ryDztqks7BxdORg8FjpUErrfi35yXig4B0Yu+aWBPYRubB/9/APK8n7NJ9ox10u1SbaufauAyzO/huB7TkKniKrl2WIVG0kGiq6oqpFXzFU3SVKAEawS22M/F8hgU/xgbMryKGlU3jVxQtdgsp4VpVLCDSFWWf4Ju0U1R5qxXyvUmdI8PMEC6wI75V9MJ8PZWlTzwexr4bTCniD+0M5O32yndZmT9ZK5PgSRXf8n6XGx3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/P61n0rVmytk8bPQrEsRCkW6IAaRnRdSI2H7puELhI=;
 b=D324dFMBubcEDVU2p4P0lcElXa0LJpvaHYQJVrNzIJx1IrXhg9Trrwx+lgi5ntx84Jk5TWcI6r9gphyGbC/P2KEsN4u+/ciRV16F6MF2tABuPaxPKu7xl9Ba6mne7MjNVraviim4nEiDYgsjeqTxuFaeNUw29McUGUw3xMtOGBb37d/3g0bYbnv7qGzSXFpygR3dyXjLTMR5PzmpK6O+32+4GKKg3C6MAP8mYWxQ4u09lmnLE5vtgk4Nzw01VAAcgbDZ1eAP899+cVbDBCRwXf52GuX4JNcgXr5DKfygaTcQxgOUttIoRDwf7LemIMZY02S1kaeYNvm9HKJ87NMbxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/P61n0rVmytk8bPQrEsRCkW6IAaRnRdSI2H7puELhI=;
 b=uuzIUTcSDLQWGt6ChMTTq/v4ONxXRqQ65IweoXkJOC765IgF0qeQGUdo3mxm2QSN9nhRVw2O3zbECyD0v2ff6Ducv21jFJ5j1vOru01u7Nng01/YMN/NJ06o5JUnzRpuM8dJR5/FjpPOIrwoR9DnC6wCuP+XJOS4m6jPocuKiOw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <18b9b99e-1d93-73d8-f9b8-873f44287c5c@citrix.com>
Date: Mon, 27 Feb 2023 12:06:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 00/14] x86/hvm: {svm,vmx} {c,h} cleanup
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xenia Ragiadakou <burzalodowa@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
 <e51c2ed6-4dc2-bf77-5d89-7023b3201fd0@citrix.com>
 <8745c599-bf9f-1eec-739f-3d42920dc546@gmail.com>
 <989903f7-4ea0-a1d8-923f-efb84c70ba21@citrix.com>
 <aa326f9a-94ca-75b9-6d4a-ab6fdf992c29@suse.com>
 <2fec6c39-f73c-719b-7bc9-02e1ec3f195b@citrix.com>
 <5e623eaa-ce32-e3ac-2089-68bf8125b5db@suse.com>
In-Reply-To: <5e623eaa-ce32-e3ac-2089-68bf8125b5db@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0026.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB4966:EE_
X-MS-Office365-Filtering-Correlation-Id: 67fb5561-cbef-425b-c64e-08db18bb22b4
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p6kOMV+KjwfnZXcnbtkTZUTnSNSev2DrWQWZBzTXdZ1SzLqo4gul/hLaQFYo791bNTAYSw0Y88dM6/mcpL0BjA/R29YL9du/AtPmB3n8+O+869rXJT1L+ige6orynC4uK0Npe5u7ToBxWLpRXCJV0xz90TUhd/NyEVKGhTjQmI7hzBQ49n4vAmOQI6Gx2SRrp0U8Kiv7SclmjXrS633LvZKU+UEdCTu65NC9tJVRf+8mYFiW49dg0jICnKs9s5maLoC5CSydNVugfrUx0Mm7WQyJSCJDnaSRIj+0w4lZIbvg+nLLRVE//pxiLcWGEs2ZuFZGXzHl//5HCfMbh3II1GDlUZqHvbATEhlt9jbM/o6EC1OyJRc1NRei1Of2UA9lypiAZVmikQYxRjeAn+IYTjVcg6TvZ4iSRdulrJdECfmg4cnGaIcfTIrmGdSOqHgq4Uguy9y12SZp0ga3DuFNTztKNA6rbb7MmE1d2MZ1naGdymjKlZUlTPkil+fO2UCz9g46tA545yu6C3zZzZ/KmKkRjWmvS+2a5jOq8MsKGd9/dYAmZF6E6WNN0ID1kc17wFGYTO/scMBCpRJREXkNgaYirRRunL4NKzPZxDtZ7DxjjKrPfkfI5R6YrKdZm6/iicwGowxyTGUrXJqHTFxBsU6iB27Y49tCZfgaxDtbohO8mPQLksRpaE2etPvypTaTgvUesd3nLMLExwWtkYc5Kr3ALOwR3jL0ZIDFGpGJnB0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(346002)(366004)(376002)(39860400002)(451199018)(66946007)(2616005)(6486002)(86362001)(316002)(66476007)(66556008)(31696002)(36756003)(6666004)(478600001)(54906003)(41300700001)(6506007)(53546011)(8676002)(6512007)(26005)(6916009)(186003)(4326008)(2906002)(82960400001)(31686004)(38100700002)(8936002)(66899018)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmtxREd1TW9zd09VNGJDMWM3VlVzWkErdTFyZkZKdFhFakx6U0YwV1VmUk91?=
 =?utf-8?B?NjZCMzVjdWhSSi8vcmdNZTFQaEVZblR0ZjZEVktLRTVtamhFUk9SWUNDZGtI?=
 =?utf-8?B?VCs5WE4zZVFJRzMzcUY4YzVCbzlJZUQySDh6M2s0elBvV1lyS3NRbHBObVNJ?=
 =?utf-8?B?UTF0MUx2dHd2ZXY5anVoVXZKeVArUkMwdytLRk9FMHd1b1dDb3ZuampDRm5r?=
 =?utf-8?B?aExFS2w4WEorS1JyTm9LZ2I0WFZDa2NLNVI0WEVXd016ZEpLdmxVT3UzS1hY?=
 =?utf-8?B?YWt0WXJvN2Uzb2o5S2MvYk82ZW1WcUZCemY1L1hXbWJHaml6UVdYeU1ZVmxO?=
 =?utf-8?B?TDc5QVh0RUVvbzcrUWxGNGNIUC9VUU1ZbGtic0ZFVVdUdUVzUHo4Q2J5Sm04?=
 =?utf-8?B?aCtwbnNuMnQrT04zRzdJUGVRZXZoZS9vbk94Vk9YRlpVTHFiSzc4Zk0yc1dT?=
 =?utf-8?B?eTBnbmQ1TmZaaXZDa3M2Y0V4VEhPaVNhRVMwY1owZTF2TXBxUDM5K1RqNnNa?=
 =?utf-8?B?U0FUMlg1L1RZVk1ZVDlMK3prMWt3NUpTeWVKNzJma2w3OHlodHRKN3V2Vm9G?=
 =?utf-8?B?Ui85dVpta0p5N2lWOEhFUmtJeDdwUDBmTjlJY2JPZ3VDMW54b1Nsd1VtaUR4?=
 =?utf-8?B?Q053TjU3NGNLR1dDczdvRDJMVTRReGFuTzB3NElZaXRJekxpbklzQU5zMFQz?=
 =?utf-8?B?MUJadEJUK2h0T0ltR25Tb0hCMGxrVHJZclo5RWFhS25ialJwYmdRRWsxaDFS?=
 =?utf-8?B?aXR5Z1pLcWZyYm4xMllWZE5XYzZQTVlzNm1yMWZXMFZtRTh5SkZrYUtZQXlF?=
 =?utf-8?B?SUlvcnQ2R1hUOWNTTzE2TmZ5UDVaWWpmcHQ1RHJXQTVkUW5aWFVUZFlLUEZJ?=
 =?utf-8?B?OW9EZzdTZWFtNzlNWlZ4ekc1RlprbG1aSGZQSHRXd0RJaVRVZnczOHlPZVVs?=
 =?utf-8?B?Tkpjb1A0QVJsNDRwa0s0TVJUeWdqZWJzQ2R4aVNUNXVGY2tnaEtsSVIrNnU5?=
 =?utf-8?B?cHhVUDYvSDZTbHlTcDBQRkNRUFlRK09BL1lyTXR4cTVvUDArRUZvQURsSnVi?=
 =?utf-8?B?R3Y4M1Y0MTFNNFVsa3lJdE1zdWs4ZXNwWExrZm1zMk5TeEFFUmFiRFpsVmJI?=
 =?utf-8?B?eUt1dHFlOTZmVlVOS1dvaWgxVnNYaGQyWWhsT0tHdkRObGVnRlJSVzEyaldk?=
 =?utf-8?B?bTBrb2UwRG9YOUpoN29QUXJVRGZzbFg0N09zV3BJR1AzSWwrb0llZmdrcjFy?=
 =?utf-8?B?NDZncVlXaTcxaDJ0Q25HUFFUcUZaSUtQVzVxbHFXb1doYTkzNzFHbHg2bllr?=
 =?utf-8?B?QkpqMHc4M3hYajdHckdqejEzendXTUpHWk93MVJVb1ZWQW04dHdvVWF5TkFj?=
 =?utf-8?B?Wk56VDlwa3BQYXM5WmNEUFUwcDBWd0lRZjZ1dWxhL0xwU2g5L3dZQmZFT3Z6?=
 =?utf-8?B?RnF4Vy8raXZXSWl6cksrUnFFMkUzdFNDc0ozTlJ4T0h6R1QvM21kSmE2bTNP?=
 =?utf-8?B?ZWxqN3YrL09uM3U2c1pERTFkWmM0T1MxOFIrUFIra0p1YmFzV3NVOTN5cUlr?=
 =?utf-8?B?YlFDMk1MWEpQVmpPT2R4aWR0eUZ3MUFONHdKUEFFTkpkR0p4YjBMZWpUVFZz?=
 =?utf-8?B?N1dJWFBteU04VmdBMkhmS3BjR05DNzV1aDVacGxWUWRkQnZxZlBSVEtPMjBF?=
 =?utf-8?B?YTFvNjFacmF0MXFPbFZCbHNRZHBJdThHZXlJVGZCdndSV3BCVzhCOVBGblNG?=
 =?utf-8?B?THIrSEVUdGxzVmpjN0NkcWljZWgzbmw0ZHpiazNSR3V1cVdBM0Q4L0pCWGtr?=
 =?utf-8?B?NHhHQ1l5SEZDTnVvZVFiSWplTTJjKzRJeXh2dVFHTzZxbTdBZERhYTRrUng1?=
 =?utf-8?B?Nmpkd0ZhaFdGM2hEOWNyb2VZaDdFd2prV2wwL09ETmFOZUpPOVRybDRZK2ky?=
 =?utf-8?B?aXJnZ1BMNHQrdEtIOEo1cnZjVXlwQURMdTRYZjhNV3pFWGZ1KzZYeTFjOTNp?=
 =?utf-8?B?U01qbXlNc2hid0luamFGVEdwN1kyaEl6V0NObUlvL1VYdUZ0azhWOFhLT3RM?=
 =?utf-8?B?WmlsQmlqT09RZ0dyZFNVWnNFUUVWc2krRjl4dGhuT2JINHBvUEllaC9TY2hS?=
 =?utf-8?B?ZWhRR2p4cUdQU0NqRjI1d3FlV2t4eXg1Tk9GZDZtRlh4Y3ZPcTg5Vmh3WWtl?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IxE6xtHXHB/aMVFIsrq3Z4PMSzec1tG2+cyKS1sXNhPCaOltjV6J85NK1JrL8wBrh4jAeMoWcsGzYyhiEi71cJCxpmlwGC4XqIdWCN7UJheU0lAjysMt+EbhceS55QA1MDOBINbr8sBcUSRm2X76vZdXYf5Q7z3VUd/i/GUZ8YAXIbfMBNmfBI5vurlXzoeD9mvWxgYj5TDWU+BxrEXgcIVe8OXKSg/Tod6FjfRspnN0/ehb88uMBLTB0n1zfcDa5JiQMmpF6UMFae+YWaNuUCG/T3uU0CBU2MzdVMOq2OhpBChXKFDP0xAGeVJSuaDPQpr47vbmmqFYfR0wYihjMx9uGGrqJA7t9mQfFZ8gHSVFq8Zs6B33u5ilmzsbW7s9PSYpJ0iH3jLW3RaxTECnvuwaW0ow8Ps7297HeoGGiPggUDBC9G8vbUnBH//aDIl+meziWiJTx3E0DLwL4xb3ATDag6BL1D+Fvkbs+wzt4PGoS5pN2VO0BM6joS6v2uxkydS7II5SknE+OskOqHTaKQ9rBz9ZkJDYXgGCFC4+YS4TAQ62oRkhyOt05DvFJmLy+Y9aY1YPNbe8NJAQuMAOr2wT0tbHPGEwMjpPsYYKOm3GJ4qvStWh2EL4iZsa6VXmsWf4QnOrsPUTRxCWjf++JgI8fWZuvKDYmRI/duUxEZpk49zGDeMy85A34GYFt5fKYZaX9tUBLvLhSBcZB3ZKNa77/kkXwuEBJ872yAth2OLWP223QZHtn+WF+JSXmdu2ku7voiDl0W7VyLfwsRbKMzgqtn59UtphGL/hXbnXVVR3LG3g3G0ZPPTc1U9lk/IpymU0OVXHCEXQziiyVfXo1G+Th7ooNRKx1KNZq07rKm8SPbfhVC1ZYO4/kAem4/cZ
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67fb5561-cbef-425b-c64e-08db18bb22b4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 12:07:02.7027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +YAPCVsulrYQ2DehuksCNxdcOTN7QLn7pSyd2BJlATAI9zHLz7u3XOQq2pRaNC6kyCr1FeUe7xF1EqvqAqKV229coO5cCFGsc73oEUC4QOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4966

On 27/02/2023 11:33 am, Jan Beulich wrote:
> On 27.02.2023 12:15, Andrew Cooper wrote:
>> On 27/02/2023 10:46 am, Jan Beulich wrote:
>>> On 24.02.2023 22:33, Andrew Cooper wrote:
>>>> But I think we want to change tact slightly at this point, so I'm not
>>>> going to do any further tweaking on commit.
>>>>
>>>> Next, I think we want to rename asm/hvm/svm/svm.h to asm/hvm/svm.h,
>>>> updating the non-SVM include paths as we go.  Probably best to
>>>> chain-include the other svm/hvm/svm/*.h headers temporarily, so we've
>>>> only got one tree-wide cleanup of the external include paths.
>>>>
>>>> Quick tangent - I will be making all of that cpu_has_svm_*
>>>> infrastructure disappear by moving it into the normal CPUID handling,
>>>> but I've not had sufficient time to finish that yet.
>>>>
>>>> Next, hvm/svm/nestedsvm.h can merge straight into hvm/svm.h, and
>>>> disappear (after my decoupling patch has gone in).
>>> Why would you want to fold hvm/svm/nestedsvm.h into hvm/svm/svm.h?
>>> The latter doesn't use anything from the former, does it?
>> It's about what else uses them.
>>
>> hvm_vcpu needs both svm_vcpu and nestedsvm, so both headers are always
>> included in tandem.
> Well, yes, that's how things are today. But can you explain to me why
> hvm_vcpu has to know nestedsvm's layout?

Because it's part of the same single memory allocation.

> If the field was a pointer,
> a forward decl of that struct would suffice, and any entity in the
> rest of Xen not caring about struct nestedsvm would no longer see it
> (and hence also no longer be re-built if a change is made there).

Yes, you could hide it as a pointer.  The cost of doing so is an
unnecessary extra memory allocation, and extra pointer handling on
create/destroy, not to mention extra pointer chasing in memory during use.

>> nestedsvm is literally just one struct now, and no subsystem ought to
>> have multiple headers when one will do.
> When one will do, yes. Removing build dependencies is a good reason
> to have separate headers, though.

Its not the only only option, and an #ifdef CONFIG_NESTED_VIRT inside
the struct would be an equally acceptable way of doing this which
wouldn't involve making an extra memory allocation.


Everything you've posed here is way out of scope for Xenia's series. 
You are welcome to try and make the changes in the future if you want,
but you're going to have a uphill battle trying to justify it as a
sensible move.

~Andrew

