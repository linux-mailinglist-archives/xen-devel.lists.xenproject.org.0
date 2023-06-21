Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFAB738B04
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 18:25:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552963.863240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC0eF-0003od-3j; Wed, 21 Jun 2023 16:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552963.863240; Wed, 21 Jun 2023 16:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC0eF-0003m8-0w; Wed, 21 Jun 2023 16:25:35 +0000
Received: by outflank-mailman (input) for mailman id 552963;
 Wed, 21 Jun 2023 16:25:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1i8T=CJ=citrix.com=prvs=529409482=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qC0eD-0003m0-Be
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 16:25:33 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c025f19-1050-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 18:25:30 +0200 (CEST)
Received: from mail-mw2nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jun 2023 12:25:27 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 16:25:23 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 16:25:23 +0000
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
X-Inumbo-ID: 3c025f19-1050-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687364730;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9NF5D+5wX33ZQF/akW7IFpMHDHy6xNY5wOGcSmL1Nko=;
  b=dsi8A/YYJxCOEFAEUrGqdjzS9nQsIUsqtkUe/3vI8iRW5IdysH/bsfhg
   vURAy25ByZvcBHolgckNJ3bz2jfZPxSB6rinPGen0xoN4yWzKIBBAGMYu
   fc9mjYeWgodk0VzNXQw4f/ky1jmut0YQb0nciflNjCu/hb8tkhnLJd3uw
   g=;
X-IronPort-RemoteIP: 104.47.55.106
X-IronPort-MID: 113533472
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:fLNjdK88gFXdHIW7XryIDrUDYX+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 2pNDDiOb/rfYzT1fd5+Pdy28E0HsMPVzNZhQQBl+C88E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks31BjOkGlA5AdmO6oS5AO2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklM1
 bsXJ2hdLSuKuOedyrCWUvlSn8kseZyD0IM34hmMzBn/JNN/GdXmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUpjtABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdtJSebjqqEw6LGV7kwiDEAKRVCZnaKgoG6jWIpiE
 UUP9DV7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3Oc0TDomz
 E6UnPvmADVutPueTnf13rWeoC62OCMVBXQffiJCRgwAi/HhvYUygxTnXttlVqmvgbXdAirsy
 jqHqCw/gbQ7jsMR0ai/u1fdjFqEuZzhXgMzoALNUQqYAhhRYYekY8mt9gLd5PMZdIKBFADZ4
 j4DhtSU6/0IAdeVjiuRTe4RHbavofGYLDnbhl0pFJ4kn9iwx0OekUlryGkWDC9U3gwsI1cFv
 Ge7Vdtt2aJu
IronPort-HdrOrdr: A9a23:9mAnqq8aQybDFNn1y89uk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-Talos-CUID: 9a23:YmYccmGVEcmnPaylqmJl1AkbFZh1MUbU83L7KU2VEXZXUbCaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3A6zWMRw0V1UYgnvEhuwQv3BYQJjUjw5WqVVwdmrc?=
 =?us-ascii?q?64NCuFTFzYwqnhS+5Xdpy?=
X-IronPort-AV: E=Sophos;i="6.00,261,1681185600"; 
   d="scan'208";a="113533472"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DINuZqpWb03PAcT1bIovAJqk9Ji8bewqB3N6CYyXEZC8gSgBBE+cs4yoISEPRh0LzdqCR4Mc1irfSaWHMBBd7dayxsFlwUFy8S2H65RkC92fyNq7w9MVI8C4Ils0I953ul9l95+GRdQx5497PDtAGCnOlGYYJxpwxsYnti673538/UtYcOKGrTqHqqN/LroLhNhrhfeAigCMFltGy5XURZL1TBkn4+xEOVWMTxMVwGMP8Q2GyxZayy23UmlvOTHWiGMd1EpMTDW3bd1xVCPMov6QGv4Q5cRGvdGwnqVjk3gk4fIi8FXpycLioZVefvEEsUqm6n+h/43FWPSZmk3R8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oinz2MmQLLGY2TKud7kQ6TRCvvfk435fyeKQJQt7zKU=;
 b=WS7/KwPNpBUiIn07zgknQJmYzofQHkj/jmEyYQckO1WaGjVq10BtW6/xFfSoflylDqUqcxE64FElifTpwIHlycZxqFnUK0Zha8eWyDe/gtgsYvwZr6/OFuDzFAxtg/V2INRZvSho/DUqmUze4tx/dHBmERHVZDzI+YlN6jD9fFWO238H8Rxi9uyFL4Nd7oGBKL0JOORQqNLpKfDQDJXebOqvbP5mYvqAiZFb3v6XN3BSFadx9OTYtYAUvyb0q2f1PSTQHQbwEpGcfQLitWtTVNGiHTZUxqc5wN4zO5LRsnJdw6wyaMpLeE8zhp/Xdlifa4q001PSBu8sS0MVhehvcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oinz2MmQLLGY2TKud7kQ6TRCvvfk435fyeKQJQt7zKU=;
 b=Uv+Ek602ck04OWuVo7iPa57kiMJ6WW42hLuYLv6+xkEhl0aSV/NC2cWxNSjtW8yOrT1/6EW76LOiplmRgcahk0E+uIjk/XBZMP2kzeFHBZiIgARggg/6Y1KjTxwEb38on+nModVGtBxSKebV7Q561wNuHPyTncckWTRu4HGFLiw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f7d9e5a9-993a-89dd-3026-3b59f9b52bb5@citrix.com>
Date: Wed, 21 Jun 2023 17:25:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH 1/3] build: define ARCH and SRCARCH later
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20230621161959.1061178-1-anthony.perard@citrix.com>
 <20230621161959.1061178-2-anthony.perard@citrix.com>
In-Reply-To: <20230621161959.1061178-2-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0374.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW4PR03MB6428:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e338209-952e-4dd4-18bd-08db72741cee
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tiTWQAJyKMSfUkVcs/QKlS28pGcX1O6XTSLzu51T1GbbGhDexyFMqg60QMjxE4d+tt/DXKWh+3LE2h0T7VqdpJ6Xwxwr9UoBZMIatEo68y/wdc+LWfsPTxiYeJXh0mlpkzPZ7Sj+YPOdWXWQcAuomQc+2klwVk3wMs6SJWuLRi/k5RrqXJVwrYkkIC9R+kzq5OVMJ+uQrlOOz/rYTO31KmTILT4MqrXxHdR1+F04Rrna4j82PN5iKvtJuzWYYeDUFDVb7x8nPSbII6j2y34OEmqiVsswZEhoqbO9iufEl7V3M9CmN9pzhlaT3UzsM8hJqaJvEiJtiFqMvc2C96yDY0JwYzslbjisyK7pedtpnQc0r8utY4LsbvXN5uTubiO71Cz6oKCQ1qwub0AyCVfC9DIyabsW9S3+ghbcElsb8PZ8Cw/HzEtJLWnYiA5aBmCJkhbnBG1NYItqS+slW623eCsuLx67t9cZsqbJMIngStogl6pHDsh/OSccKYGCOhX7OV11OcorPVdY9R191nlKU4LECfhdONWIHJfqKHgrK46FhTV6hUxHO+dAJhQ1pcIMc3HxrX0iNMCEyFNjRlJPQZJ+KXKf7WPVeeIpX/lD5tO4jBxBcmNEUuAP/n82I71zdhx0YDew4IvJ7vlT9Bg4Gw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(451199021)(6512007)(31686004)(53546011)(36756003)(5660300002)(31696002)(66476007)(8676002)(41300700001)(82960400001)(66556008)(38100700002)(86362001)(4326008)(8936002)(66946007)(316002)(6506007)(6486002)(26005)(186003)(2906002)(54906003)(2616005)(478600001)(83380400001)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVgzbHZDUHpqblFERGZVNEI1NnZCNzFUWHNTZjgrT2pnSlhFRU82dWJaaUdG?=
 =?utf-8?B?dWZLbytJeFhHZVVSNmhYMk4yU3RZQ0NneDd5ZkpsRCtHZmx2QlZGa2lOeWtC?=
 =?utf-8?B?Y1F5aGk4WlRXK2owRDl5NGNkZmRNZVpFNmNXZFlkYU5XRlB5OGV3aXFUMGJh?=
 =?utf-8?B?MlU1d2VYUk1JWFMyOFZkb2V6YTlid2Fob3VCYmhoT2ZCNVFYTS9vQWxMaWxu?=
 =?utf-8?B?UURrYmJENWwvL2VCYXMvV0p5RFBkNDFzV1VHS1N5N1dsNUFpWEFmbnd4aDBv?=
 =?utf-8?B?cm9wa0tOK09MOExkcWdYb3hQQjlwSEJpM0Q5YTdOVzJ3TE1jRiswM0VTSDhP?=
 =?utf-8?B?LzUyUVlGK1ZqNDlsT29nNGVlUWJwUjFEYzltMmFsN2x5Zjdhc2J2NFNnMUdT?=
 =?utf-8?B?d3JZdFYxOGo0QnhTWlNUSmVJczdCU3F5TEdId3dNZlZkNDU0dSsrbzlNVDBK?=
 =?utf-8?B?N253ZjJ5eHZmZCsySTc5cFdiamtjSmQ2QVhaZ1NQMTRTdDlSeUlzNkxhMjdO?=
 =?utf-8?B?dy93VzlkSWNsYTVOdHllTk5SQmV0N2FJdkZmQ00zM01LSVAxallzY2t3K0V3?=
 =?utf-8?B?UC9VN1BoOWNmTnlER0hrODRINDlXQzRGN1J0RkRYSGppNDM1bkp4ZUNvTGpI?=
 =?utf-8?B?QjdZUGw2ZWh2dXFKdGtIbmZ5SzBEWjY3T05Id1ZQTERnSUVWTm1DdzR3bGxL?=
 =?utf-8?B?dWx5cmRZVEh5a1NDd042Tzg4bU9jeEJUY0hYZWpLcmJST01TTVBzemdUZjFB?=
 =?utf-8?B?eXFENlBINFlFeTVVdDlwYWt3Zmh1Z1RIcy9YU24wZlNpUVhWY05GRVNKSlJz?=
 =?utf-8?B?VjZBRlhPSnlNSVN1amtIbXF1blg1cGRNeVk5QityZE81QXVPU2ZuZWhkaUsz?=
 =?utf-8?B?K3N1TjlrZXBJeUpUVm56ZG1PWEhIcWQxT2RFWGo1OEY1TUt0dzNva3NNMFhs?=
 =?utf-8?B?UXJFbDlnTzJwNENnbEt5RkFkRis0Q1oyMzFnYzVwTGpvT3JIR3dIL2d2dDRz?=
 =?utf-8?B?SGN0QU9hYjEvc3Z2V2VKaUFoS21CcVk3WjRGK0I4T3lDK2hMMzFYa2xsRisr?=
 =?utf-8?B?dkZPWW53U1R0cmZOU29BeVVERHRIZ1N5dFgzVXJ6bWZHUmVZdW1XZnFDMnJE?=
 =?utf-8?B?cXo5RCtzcFpyVE5DdVAwSFFvOUZhRGF6L0E4NTZNeG1lV3JqdDBZOWduRUVa?=
 =?utf-8?B?cCtjM3BTYkN5OVNPdmJQN3FjNFRIUFdHalZyNERiOEdoazg5b2NmK3dqZTdl?=
 =?utf-8?B?NVY3aGNDZGp3VEdCYVlZUFRnSVhrRElWcWJ5OXdtVWtaMDNrbmkxT2pLMUxV?=
 =?utf-8?B?TnMya3NXU3hUZnNkWk1iTUJmMy9VZitvbGF4NjFpMDdvdXZsOStUQ3JqS3Nq?=
 =?utf-8?B?ZGpqS3ZMUThyVWVHd3VTeHYwbGlrWkFpeDNEUlVBOHJZbS9OQzNVRURXclJ4?=
 =?utf-8?B?UEVTSVRLK0luRERDaklBVmxpUXBuT1R3VlZlTkFJQktFSk1UQ1FTTXVZaDc1?=
 =?utf-8?B?bVl5MWxsVTJFdndtdTVmRFZ2RGpIMU5tRzk5Tmg1QTdXNUN3OWQ2VHRoT09h?=
 =?utf-8?B?WDgvR1dPeXdqbVFKbkNVSmU1N0RwbmcwTkorMy9UK0QveWlDUEMyYkl6eS9L?=
 =?utf-8?B?SExhUy9CNW1wYzdPWjBxRUE3SlBRQk1HRVpXNzZhKzNnVWRMeTFqL0tFZVhJ?=
 =?utf-8?B?MlhKWi8zSlk0UURFY3JZYWFBRXVTVmlnVUhuMWxhY0ZCZ3ZMbjNEY1NyTlg3?=
 =?utf-8?B?c0w5SElreElPZUZZZ0pPbzRjWjVBQTdnQ3dSeFA3ODVvYlM3ZG9ERURsejNo?=
 =?utf-8?B?N3JCT3M4eG1TaGVkdGZ3WmlXRkdJc0xUUW1JZTNBc001NTZUdkxyTFN1aEMx?=
 =?utf-8?B?OERXaFNKWjJjNXQ5UmFiam9PMkxIc1JRQVhHOFRUT05CV1V4eEZYU1NkcFJI?=
 =?utf-8?B?WHJzd2Q4VVhYakd5Q3VSUUM3OXFvMzRhM2FSTFU1K2dxUlByVFdzQnl4QXRB?=
 =?utf-8?B?U0xpT2FJeG1tNVhRcW9iQks4TFE2aXNLbVdLQkYySTRTbHBQaHY0RmxjMnVx?=
 =?utf-8?B?eVBKTGpEVmEyaUE2L0tmNTBQcmlzSXlydjlPY3dWakxFMk9YSjZGWE0rWGRp?=
 =?utf-8?B?Y1hUOWRVSlhuTEZuRnNnYk9HVUNWRnBJZ3BDNlFYWllzdlBBYXVDV0tDQzlZ?=
 =?utf-8?B?ZUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5J5XAm2Iw75/pqR1Npvnj9mjZuPtbRKsZMbzUKYgxxd72qtk8e1Szr83d1sNUwKU75624aaoYzKzrKiuCExlLojVgfYVr6Xl7L74RbOeCstS1Uth/DbcTQAyWjby5wAs1tz3axgrm1rO48S1McSzU1zCSKFGWgtdeVGH1Uv/N1n9moMUcii/OAK2gNAReaQ3y6QJ5ZDT5kn3Yo5AIXCEC9sTbEuATufzkZVWm50+DBB5sFVWI8kgBq9gG0IzImjaeAP27jyYB/2sL6+zWqG5tLjWx/AY4SiZstHor7fkd2N23+toM+/ntZq9Mv5mc07xybdz+7juHg9oF1Xw9B3A9lhT/4uDF6gsKdy3OvQCoOWdBZ+rbxXQMoRrQkSF20cn3FOsGsTzx4ETjfI63CJCGo4zUECzS6Wk67uGP9PtPSYd1q/Gkzw7UNRJ9Rl9+grwK6pWN3xup0HyEitSx+mGsZxnOi5Dkrd+9ORKsc/yxLP2aP5h0exv8Di1XK3IJyXIkMPFEDh7XQe3XicjzVyHNzmFGH4m4S2nqZvnUGHPmGOcsXQff6kMe3we2+3uSqa/nZtWGPQSHJ8SGIR0eXV4UDXTPTY8vattYg4mv7C2Bxj7iRfJ7aMcuyy0mGe4JqJSvTVx/uRhQ1j3lPKFVmQ0Zu39Tp85tLuxVXcmdVLDztNL/bv4ZJKivxpJMb+zNyrVvadSQpmIU6Sc+uu0R/BMbQamqOPt8HT6p0pw1IeqpLh4ZLOJz+5FEEu4FIqy6M1F1sqstqoxYwzvRVorJYBM5CLePpw2VPjieBzEIlvGGdBYV1Tv8pqK2NA72tMtI3uWwsKzC4U1MP4ZfNMcezuOM4BRNkiimaHwWrDOjuY6eZWfGBrl1at9hXlPozjXo7xU
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e338209-952e-4dd4-18bd-08db72741cee
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 16:25:23.2595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CkQhNg5j/IhvDm5/TyREAr4zTMkxw+g9YJZbe6SnELWzyrd5MZeXMdI+c8FmlAnO8soL4Ma44pkyaB55cCNRFxZMCkMWYaRFqEgxR2T8TDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6428

On 21/06/2023 5:19 pm, Anthony PERARD wrote:
> Defining ARCH and SRCARCH later in xen/Makefile allows to switch to
> immediate evaluation variable type.
>
> ARCH and SRCARCH depends on value defined in Config.mk and aren't used
> TARGET_SUBARCH or TARGET_ARCH, and not before it's needed in a
> sub-make or a rule.
>
> This will help reduce the number of times the shell rune is been
> run.
>
> With GNU make 4.4, the number of execution of the command present in
> these $(shell ) increased greatly. This is probably because as of make
> 4.4, exported variable are also added to the environment of $(shell )
> construct.
>
> Also, `make -d` shows a lot of these:
>     Makefile:39: not recursively expanding SRCARCH to export to shell function
>     Makefile:38: not recursively expanding ARCH to export to shell function
>
> Reported-by: Jason Andryuk <jandryuk@gmail.com>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  xen/Makefile | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/xen/Makefile b/xen/Makefile
> index e89fc461fc4b..9631e45cfb9b 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -35,12 +35,6 @@ MAKEFLAGS += -rR
>  
>  EFI_MOUNTPOINT ?= $(BOOT_DIR)/efi
>  
> -ARCH=$(XEN_TARGET_ARCH)
> -SRCARCH=$(shell echo $(ARCH) | \
> -          sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
> -              -e s'/riscv.*/riscv/g')
> -export ARCH SRCARCH
> -
>  # Allow someone to change their config file
>  export KCONFIG_CONFIG ?= .config
>  
> @@ -241,6 +235,13 @@ include scripts/Kbuild.include
>  include $(XEN_ROOT)/Config.mk
>  
>  # Set ARCH/SUBARCH appropriately.
> +
> +ARCH := $(XEN_TARGET_ARCH)
> +SRCARCH := $(shell echo $(ARCH) | \
> +          sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
> +              -e s'/riscv.*/riscv/g')
> +export ARCH SRCARCH
> +
>  export TARGET_SUBARCH  := $(XEN_TARGET_ARCH)
>  export TARGET_ARCH     := $(shell echo $(XEN_TARGET_ARCH) | \
>                              sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \

The change looks plausible to fix this issue, but could we take the
opportunity to dedup the sed expression into a $(call src-arch ...) or so ?

Except, given that ARCH := $(XEN_TARGET_ARCH) now, doesn't that mean
SRCARCH is always TARGET_ARCH ?

Can't we simplify this to just be plain aliases?

~Andrew

