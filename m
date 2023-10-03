Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 570D37B6406
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 10:27:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612153.951993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnajx-0001R9-Hu; Tue, 03 Oct 2023 08:26:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612153.951993; Tue, 03 Oct 2023 08:26:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnajx-0001ON-Ea; Tue, 03 Oct 2023 08:26:49 +0000
Received: by outflank-mailman (input) for mailman id 612153;
 Tue, 03 Oct 2023 08:26:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/VM=FR=citrix.com=prvs=63394bc6a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qnaju-0001N6-MS
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 08:26:47 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95186ffe-61c6-11ee-98d2-6d05b1d4d9a1;
 Tue, 03 Oct 2023 10:26:44 +0200 (CEST)
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Oct 2023 04:26:37 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by SN4PR03MB6783.namprd03.prod.outlook.com (2603:10b6:806:216::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Tue, 3 Oct
 2023 08:26:34 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f%4]) with mapi id 15.20.6813.035; Tue, 3 Oct 2023
 08:26:34 +0000
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
X-Inumbo-ID: 95186ffe-61c6-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696321604;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=7aVMZh3PbYLvdJHVasYoDgNmDBlRMTNgar8j4z/JXTY=;
  b=M1wNSasgJ6aEdnSKg/mWFxThQoIM5BL0XWckVJlj0r6p56Hb+B0xVuWE
   6bNXJKbA2YCW/HNIQZyx2BAJ2WUuFcG1piSaMITLbP71WXD99bYmkzzVL
   dteF2DJ0eNulFa0DUm0doT0zqXB7vbXUrCFkvUP4wqmGPnMyo4VmJ0K03
   g=;
X-CSE-ConnectionGUID: cbLU7tF1S0GpBJLpBDm2ig==
X-CSE-MsgGUID: Q6SebWtSQ0+xOA61PevlPg==
X-IronPort-RemoteIP: 104.47.70.106
X-IronPort-MID: 127220768
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:4ReRKq/ABrOrRK9tazkKDrUDFn+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 WpLWm+Cb/iNMGX0fowjad+3o0kH7MODyt5jHgVq/yE8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks01BjOkGlA5AdnPagQ5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklF/
 9gldywjNyvbqPqc4pajYMVp3MUseZyD0IM34hmMzBn/JNN/GdXpZfqP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTeLilUpjtABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraVwnmhAN1MRNVU8NZT3maezFMPMyROFkuciKfgskOgX+pQf
 hl8Fi0G6PJaGFaQZtT9Uhj7sHOClhtBQ5xbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHq6aJQHiQ8rOVqzKaOiUPK2IGIygeQmMt4cTnoYw1pgLCSJBkCqHdptf4Ay3qy
 jaG6i03nawOjNUj3r++u1vAhlqEmJ/NSQIk4xTNaUis5Ah5eY2NapSh7B7Q6vMoBIGdQ1qat
 X4Igf+C/fsOBpGAki+KaOgVFbTv7PGAWAAwmnZqFpglsj6rpHiqeNkI5CkkfR83dMEZZTXuf
 Unf/xtL44NeN2eraqkxZJ+tD8Mtzu7rEtGNuu3oU+eiq6NZLGevlByCr2bLt4wxuCDASZ0CB
 Ko=
IronPort-HdrOrdr: A9a23:I0bPWasnCFw0xYBQGkn2Ec957skCHIAji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YaT0EcMqyNMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPHxXgspbnmNE42igYy9LrF4sP+tCKH
 PQ3LsxmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzI39QWUijusybjiVzyVxA0XXT9jyaortT
 GtqX2z2oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuQFNzn2jQ6sRYJ5H5mPpio8ru2D4Esj1P
 PMvxAjFcJu7G65RBD8nTLdny3blBo+4X7rzlGVxVPlvMzCXTo/T+5Mn5hQfBf141cp+IgU6t
 MD40up875sST/QliX04NbFEzlsi0qPuHIn1coelWZWX4cyYKJY6aYf4ERWOpEdGz+S0vFQLM
 BeSOXnoNpGe1KTaH7U+kFp3dyXR3w2WiyLR0AT0/bloQR+rTRc9Q811cYflnAP+NYWUJ9f/d
 nJNaxuifVnUtIWRbgVPpZPfeKHTkj2BT7cOmObJlrqUIsdPWjWlpLx6LIpoMm3ZZ0zyocokp
 ipaiIViYcLQTOuNSSy5uwKzviUK1/NHggFi/suqqSRg4eMCoYCaka4ORITe8jJmYRtPiSUYY
 f3BHtsOY6TEYLfI/c34+TAYegtFZA/arxhhj9pYSP7nuv7bqvXi8f8TNH/YJLQLBdMYBKOPp
 JEZkm4GPl9
X-Talos-CUID: 9a23:yMeHlGBCrLlSh7n6EyJt0HNLBu58SSXy1F3yB1eSJWMzSbLAHA==
X-Talos-MUID: 9a23:eyKSkAZ+/OX0S+BTjmHXiTtdKPxRu+e+L2lTyK0Lpc28Onkl
X-IronPort-AV: E=Sophos;i="6.03,196,1694750400"; 
   d="scan'208";a="127220768"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PfFl7JXDILhKzSQixv0rZgxIk3xeVmMB7OsFPyfWuPnlLoEGZBEr5mtkqyjAJBJDmPOrmjpUx5G5Fd4uL3CIsTvxN/zTa3DGcqLmg/GVadEMf+n9vUq8F3L2GIQ0xiJCgny+0ykUJ9PiQKKwfIAft5yrQgSz8EOTT9e1vL7mGrlYeGhzLaJU3lFGFYitthOT6FsnYNAnwngYCKWBBKjQQDdex2doWn5eAxhO4ptzHPsTrk+oe7dQ9ZEE5S79mt2AO5tP5dwaVbEHROoxLjSaWHjVoKGK/w4pI5h3xEyrjjY1LQNKYm9pNt96jf/MlHEr6rGK+sajuFs6qVq5IzHNgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4SEbSUeX0wxdf1TuoUu0dy7VlBty+SBa7e7DTPIhds=;
 b=c3ZlkX0P6zosEn7uc2wei5hgqJ5dta7DwXG+Er45nx/CY747PjZsDNZDjJu+rWhc0Zh0Y6FFLCRGe+PLNzLbrg3xQFnE8AlmOJlQC74335mcFYkfCnVv2tUhBtG2qsX8b3bsIvbTXTczhToMqnFUodyiTNc7Y/dnWixkt0jt4pZcqbwSVX4osQDF3huhhpVXo4SSag5Z05lDc64gVd5FsfFMbcTQMwvSO3Sd+S0CvWYx/e+zIDYVR6B1yAKJ8J8sq22xzJ1jZDfelTU8lyODswMYBk7qpS3MjcimhDy/hbIhgXMtNcyajnS0R79KePg/qvf7dGIc6jNcLNEM1Opfjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4SEbSUeX0wxdf1TuoUu0dy7VlBty+SBa7e7DTPIhds=;
 b=vFZK3m8MkF1mKWqBCWpdhUbdUhoUB3JrP5T8zhJlnAF4HVMRqCOxGMwKqagpIop1pf/VGSufXOM6kePRACytf5oxUcNHvExK6jYBsMKN4TX5727IT/Q7pWLuI4JAPjrIRA3J/Y5egpC+3WJOz3/AYNxZxvBG7aq3lHfwBS60pEM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 3 Oct 2023 10:26:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: Issue with shared information page on Xen/ARM 4.17
Message-ID: <ZRvQNKyYpLDVTs0i@MacBookPdeRoger>
References: <ZRY7Ls3p6M6pakMq@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZRY7Ls3p6M6pakMq@mattapan.m5p.com>
X-ClientProxiedBy: LO4P302CA0010.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::18) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|SN4PR03MB6783:EE_
X-MS-Office365-Filtering-Correlation-Id: 3093d4b0-a579-406e-f64c-08dbc3ea745f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O89z5S3CT+ke/P4+caMjF9ZXhXTbhHvOiK73pwHDuhUr1CHN5DQe5mW2x3sQwGWsGHHPpz5/s1j7pM1ghX8Vo6VIMqrqcRJhQfT9IayO7YlcD21JZYRW/3LBovN++rlk3e6D2j4PniAQBkydLO1ZolXGvotTGRJZR1YjMCh0avTvI1mUrnQtCSiLKoqwoMR19/jAfhGC0oSUABfGfEfwdLtfZFY5UbAJnWK3JqWkyzNmmngwz1sFbzx8KQYNRrKjiHjTHtpBETieT1JJ4p9nyikbB9B425kPJii7b+w8+DBQsVArMN5HYaF87Xdl2vWYOk+Wle7BIo5o+3S8HKoKUuEIQhhbkK7u/SO9l3DX3HUNBcSaZ0TZbIZWtrDZUTfOXpidwf6RSbZ9d3p6uPGuWIthQq5M9vT7k35THLqeIkdF5ThRhU4/R9HIndWD1/L5qkRl7o59cacSFs7e6QUKPEjaGAN4hBvR/Nmeu2XyD2oJjHK5srfWIwNuCEi6I91x2zkbuFM2ZXVLIFMIxWk17dy8mGj1zluhZ54ToGQ94A/Z0+JQRNxA87Oje6IQoQk3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(346002)(136003)(396003)(39860400002)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(2906002)(66899024)(86362001)(6512007)(9686003)(26005)(6666004)(478600001)(6506007)(6486002)(85182001)(83380400001)(82960400001)(38100700002)(33716001)(316002)(66556008)(8936002)(66946007)(66476007)(5660300002)(54906003)(41300700001)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2cxR0VGTUE1UWVYb1ZhRFJ6N1dtTldmVEhJbHRHQXJPMk1oTXNsb0pUc2dF?=
 =?utf-8?B?Z2p3ck9jaXRmOWNzYnlBTjNXQjRPaThienl1S2RjOVp0WTVFZ0VYWjd4cWhm?=
 =?utf-8?B?cnVrVDMwdUxPbTllampOcnpaZFZ3WHU1UXJnNFhXRjlaTS94VlJ1ZmZYUloz?=
 =?utf-8?B?UVU5dTNZT2g5MXQ2MmtyQm9ibU4yVm5DcmZwNk1KRlZ0eWw0Rzcrci9CWVZ6?=
 =?utf-8?B?L1J0Uk1ZVUo3TEt3NWRhTGFDc0N4eTFIajI1R3U5ZHlGUjZRd2hWLzFOeUtE?=
 =?utf-8?B?UHJsL0ZlWmNqMTJZWnE0UWZRNnRONFAvTGpUOW1DeUpjS25tWWNZZmNud0g1?=
 =?utf-8?B?OThmR1J3RVdwZFFEcUgveXpCbE5DUUQvaU9IdkNzRXJCV3czeTZuVDlRaU1Z?=
 =?utf-8?B?dUJ5clMxTHZpS3RIdzUvRHhza3UzUDAvdGJ0aTg5UHFOdnlicGk0L3BwV1ZD?=
 =?utf-8?B?ZWFpQUtJOXRiNGVwL2RJQTJ4YnZrZDA3YWZzR2ExRk43NFlPbG4wL3FLZkVT?=
 =?utf-8?B?bXpCR2ZTSVVxQTVnTDduaUpYUTNyQlBOT29NTEx2Qmh4Q0hNbC83RjY3YllO?=
 =?utf-8?B?TFlmMUxKVmZhOVhFeEJrTTdNa0ZjUjFXVXFXOUR0ZlU2eFQ2ZnBJTFNJN0g4?=
 =?utf-8?B?MFZ4MFZBUHk0UGJxbzJmVDhQVXY2WkVFbUNpYkVUOE1HUGx1UkpPZmN3OHU0?=
 =?utf-8?B?RnN2UStyaDVPUVUvcWJqZmpjS05raTZiVGM4OEtmM3pkcHcvcmVVbnNFOUI3?=
 =?utf-8?B?V0xBUFJMdmNRdjZTTW1GY0RiL09pMkJlbVFNU2RMZkZOclFsVXYrdm4zWGFy?=
 =?utf-8?B?aWYrR2VOKzg3dEdvSHByejVmY01PcTU4M3FwMmduRlBkeDhwNmV2VXFuTWQr?=
 =?utf-8?B?Y1NuQTJXUzFEMzhxcXlvck9RTW5IcTE4blRkSjM4V1REeTZ5OG5zaVhhZ3pj?=
 =?utf-8?B?dWxEdThnWG55WXJhYWMrRXBleHE0d25lYTVSZzRGS0lLdlFJK0QrTmVQOERH?=
 =?utf-8?B?T2ZOazkwVnNpZjc1UzhPaUVMbUl5VE8xQXdtd2Jad1FCSzJwd1QxSEdDVUhx?=
 =?utf-8?B?ZDVwWC83Ym9xVGpmdWI1OTdSY2ZkeFlJNStteVF5QkNubFlGekVlclB0cGhN?=
 =?utf-8?B?eGNhNENtcVV4UzhpQmtWSExmRnE4NkRKV3FKWUp0R0xQcGxYSnF1YUdPLzhC?=
 =?utf-8?B?bG9pYnVlbzNDTmVSWUxjRUNsaWhrM0ZjMTBXOGQ4eC8wNVpsdmQwT3RwZGVj?=
 =?utf-8?B?dFdSTE96RXF3Y2VNRjNudHY2ajA0TDFLb3hQQUxFdVlPVkdJY0xocnlTTlFY?=
 =?utf-8?B?ek5tWWVpaHdHSWNYL1JISkI2b00yQTFmdTJJSTNKMUcxVGE2V1pEblYyVkx3?=
 =?utf-8?B?NUJiS2RYcXdmVmdZVDAzRDg3WlNObCs1enRyZTBlNlFPREhpdUVrbzBKZXpX?=
 =?utf-8?B?dnpYd3g3Yk16QytBb2FEZUFrdzNPMDRDalhBTklvWmJXSkMrSzNkcHpUUVVS?=
 =?utf-8?B?Q3N0YkgvaEJldThZUHJOL3ppZC9xU1B0a1k2Y3IyekdVK0h6SXZsdmw5RlFF?=
 =?utf-8?B?NTRTVHhjalpsTENFSUhhRmxwSHZVVHVxamRpUmFIZ1VDTm55SnMvR2FiS3Yx?=
 =?utf-8?B?RTJ2Ymd5QWIrbDRXdE5KbHNRdU44SEkwd2Rpb0FOcjN3MmRVSVR6MDVBQmVW?=
 =?utf-8?B?TG9xRTJ3UGlOZTRVejVCRnRlaS8xbk9YYUNmSUFNSjB1Y2R5MnpuVnFQN2xQ?=
 =?utf-8?B?UjV3bUUvb0ZuaWsvQ1BHOGN5R3lRcHlJMkFPOXJ0bTllSGZvRmMyV1ZCQ1I0?=
 =?utf-8?B?S216M3ZlYTJzc2w1TlA3QjNkWW9iTXpkK0J1VEFZUnhNMWEyQnBOdk80VWJW?=
 =?utf-8?B?VmF0ZXpFeldrYk1KRkdwWDIvd3MweUs0UmRnc2NZOHFQcENTSG9NeVJOdWRL?=
 =?utf-8?B?YnRUT2pqVDJCWnBnNytGQ29sVUNPRHA2TnZGRzZxM0xKaEM4Z1NZeXJPa0Jp?=
 =?utf-8?B?OEdSWm1xd0FhWkJac2FIT2s3YVJXZDJ6eEJ2OG1yaTByejRDUzcrai8rUEsx?=
 =?utf-8?B?WE1hZWRRVmJqL0ZLa3BpMDNtRnJPbVNNdVd3bzZobTZhVWJmc3doK1VrYy9O?=
 =?utf-8?B?TmRxZlk2VHByOHp3Z1hyYlF0UTc4NEhaSDBKbjh2SVgyVnd2M2RTZlpYWlhh?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zpJi0uHKQOV55pOHshHHRO2Px2x81YIl9PUwe3tzrh8a7okbmZPtfrN+GWQrA77tr3TyCeo2b1aljqBQzoHVS7vDM00ex6veerQwwhEQ8C6SXX58jZR3xHAWlVnLJYE2sYN6esZOFjRPNJXW0f/Sp2r06ndfiw8XSs4qsd4HQdM8CHobuVxlcm9FPf1BbMgeObU08J/TE96HjZZ0RpaIbcQLsO2fmruV1y5emE9V+jdqO1WQYIUTTbqQVuSl28j2sXOFKj4FaRznColT2WqM4gcyi+FeyhYjlDC8h6jDsnulaVyM33RcWh8KBayD850jPrOPCoF5PLiRU++pt4qgjW42bNj6ynReFGvuiJ7ny+iQFRFvCfz+PeDhQtO6P4dXRdaZU0xBdeO1FE0xjbmCiqHsXL+EU66VIehBM8ZBz+hwSuI8uytM3RRlxotpNS3yuRKTZvf962D8MYREHj1jrWtBzcRQB+eVuWlc8bv60Q8zlwStfI3ITNWMtGE3gd3Vv4D916ZtdnXjBnPgZE9J69JfaME6HrUMLpqBzu/zLWKUV2xMZvbDl+QljmvzUtpW1ALsmBjUrPphtAZMrbBL/Hs0p9FMIam0GLMWMBg8sb/SwYKYX6isEUVeVXmYDlPU1of2KHKJLcOBE1VDa5A1hnnbaJLIdRVLHdQiFSVn0Y3iebBf5Y4+iIZV2ayFgfB9MupBYBvH11eAVAxul9lS3LGY1fzsrbwByQk2isfDaIO+tH9zz1shrEVEpiP8nJTc6XKrPB1WA3qBFBD1aQEGbN+oWChXWV2dv2BGoPBt1KoFX3tnU5938lQXY7l+2KaCh2UcwpWbP3sN9OrwTCRRz/hwTBMxa0WxqQS7hX5GKzaZ7Pa9g+lZFyzE/jmMQWLq0DGAt06APLRZly+3IIt7Fw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3093d4b0-a579-406e-f64c-08dbc3ea745f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 08:26:34.6738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BO7Ak5KLeyvIGMbBfIYAS25d0MMCxM2VGuZVNNnZCtGRd1wR17E2P4hq7mdArl++9vQLjEdnJsT+OMSx63mBXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6783

On Thu, Sep 28, 2023 at 07:49:18PM -0700, Elliott Mitchell wrote:
> I'm trying to get FreeBSD/ARM operational on Xen/ARM.  Current issue is
> the changes with the handling of the shared information page appear to
> have broken things for me.
> 
> With a pre-4.17 build of Xen/ARM things worked fine.  Yet with a build
> of the 4.17 release, mapping the shared information page doesn't work.

This is due to 71320946d5edf AFAICT.

> I'm using Tianocore as the first stage loader.  This continues to work
> fine.  The build is using tag "edk2-stable202211", commit fff6d81270.
> While Tianocore does map the shared information page, my reading of their
> source is that it properly unmaps the page and therefore shouldn't cause
> trouble.
> 
> Notes on the actual call is gpfn was 0x0000000000040072.  This is outside
> the recommended address range, but my understanding is this is supposed
> to be okay.
> 
> The return code is -16, which is EBUSY.
> 
> Ideas?

I think the issue is that you are mapping the shared info page over a
guest RAM page, and in order to do that you would fist need to create
a hole and then map the shared info page.  IOW: the issue is not with
edk2 not having unmapped the page, but with FreeBSD trying to map the
shared_info over a RAM page instead of a hole in the p2m.  x86
behavior is different here, and does allow mapping the shared_info
page over a RAM gfn (by first removing the backing RAM page on the
gfn).

Ideally we would like to use an unpopulated gfn, but doing so is not
trivial right now, as the point where the shared_info page is mapped
we don't yet have an easy way to account for unpopulated regions.

My suggestion would be to do something like:

diff --git a/sys/x86/xen/hvm.c b/sys/x86/xen/hvm.c
index 4122daeaf600..7251bc69ae15 100644
--- a/sys/x86/xen/hvm.c
+++ b/sys/x86/xen/hvm.c
@@ -194,18 +194,20 @@ xen_hvm_init_shared_info_page(void)
 {
 	struct xen_add_to_physmap xatp;
 
-	if (xen_pv_domain()) {
-		/*
-		 * Already setup in the PV case, shared_info is passed inside
-		 * of the start_info struct at start of day.
-		 */
-		return;
-	}
-
 	if (HYPERVISOR_shared_info == NULL) {
+		struct xen_remove_from_physmap rm = {
+			.domid = DOMID_SELF,
+		};
+		int rc;
+
 		HYPERVISOR_shared_info = malloc(PAGE_SIZE, M_XENHVM, M_NOWAIT);
 		if (HYPERVISOR_shared_info == NULL)
 			panic("Unable to allocate Xen shared info page");
+
+		rm.gpfn = vtophys(HYPERVISOR_shared_info) >> PAGE_SHIFT;
+		rc = HYPERVISOR_memory_op(XENMEM_remove_from_physmap, &rm);
+		if (rc != 0)
+			printf("Failed to remove shared_info GFN: %d\n", rc);
 	}
 
 	xatp.domid = DOMID_SELF;

But in the long term we should see about initializing the shared_info
page as part of xenpv_attach().

Regards, Roger.

