Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AE66DA450
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 23:02:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518996.806113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkWjy-0006SF-Fa; Thu, 06 Apr 2023 21:01:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518996.806113; Thu, 06 Apr 2023 21:01:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkWjy-0006Pm-Br; Thu, 06 Apr 2023 21:01:54 +0000
Received: by outflank-mailman (input) for mailman id 518996;
 Thu, 06 Apr 2023 21:01:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3yY=75=citrix.com=prvs=453e3c94d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pkWjx-0006Pg-CZ
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 21:01:53 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f41457f-d4be-11ed-b464-930f4c7d94ae;
 Thu, 06 Apr 2023 23:01:50 +0200 (CEST)
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2023 17:01:44 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB6092.namprd03.prod.outlook.com (2603:10b6:408:11d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 6 Apr
 2023 21:01:42 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 21:01:42 +0000
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
X-Inumbo-ID: 3f41457f-d4be-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680814910;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gKurutHoy7sve8V5n2Kf1VRnA+63mQqgavH5Fq7Cw7k=;
  b=KobH7JOid6QEoj4NIcAvqvXEaPZzttZZjLsGlTc1KorORFEwAruajQ+v
   B9B4Jg1BGpSMEeh0GBA2TqdODtj7sQtK6EiBMPJoXOGs+HZFj7KOi3H93
   eCo+qGtMWErssYCRBgUWdPLZszVXHxlYHVwCEqhaV5Ji9Yyv8S/ipVWBT
   M=;
X-IronPort-RemoteIP: 104.47.55.173
X-IronPort-MID: 103415141
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:xvM0m6AVZfHyShVW/wTiw5YqxClBgxIJ4kV8jS/XYbTApGl00WNVx
 mMZCmuCaP+LYGH3fdpwb9yy9k1V6pTcxtY3QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4G9A4ARkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwy8IqD2wR6
 eEhORtUX02lg+6535z4Rbw57igjBJGD0II3nFhFlGucJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+OxuvDO7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraXxn+iBdtOTdVU8NY33EOpxnAyMCESFn+in6HnoWq8Q8BAf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmKKRYWKQ8PGTtzzaBMQOBWoLZCtBRw1V5dDm+ds3lkiWEY0lF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9XABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:unloGqxDLcKhz1Mi3/xoKrPwD71zdoMgy1knxilNoG9uA7Clfq
 GV7Y8mPHrP4gr5N0tQ/+xoVJPwIk80sKQFhbX5Xo3SJDUO2lHYVb2KhLGKq1aBJ8S9zJ856U
 4JSclD4bbLfD9HZLPBkXSF+rgbsbu6GWOT6ds2DU0BceinUc5dBn9Ce3ym+4RNKjV7OQ==
X-IronPort-AV: E=Sophos;i="5.98,323,1673931600"; 
   d="scan'208";a="103415141"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bre8/qXhJC0qbJtELOf99I+xO1BBwwdpOIsI6DCKplbBfpb/rmG6QuTs8hJJ7QcytJZ7fF/dQgy1jVZKwB10MCz/1iyGVbL6WKnuEzD+89FX5Sr+LSMRDC+OOkUGyk6WSdBD13tQg0JcXOa3TefxUDxTUSi45SG15nTbwfqrROEreAfl32gHXVQJHIk0HUVsGdqN24H56z6EoMhCwS9vkR1+svWmIfvZkI43Ijdnu2gkU6nrr2vPGykzY6fNBGVR3X/b9TziFn/z2plMIz/XREPrvcK7gUKfIIGzMJuI3DfAcY2Xuc3tA2tCSK9NTCVR1SzmLYEadmh/gHwQPLQqWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKurutHoy7sve8V5n2Kf1VRnA+63mQqgavH5Fq7Cw7k=;
 b=EYBtzpkANAR3PqpvJJhRwEqsjEyol7K+V2gAVfwgXcBFTj1FiWUdeyPsN2Gndd5dxvGFtklcwrh8KxnDW6xttFZKnHAp2UuP3X1IeN6cG6BK0WmO6GlyZa6z8Vr151bw0EESk5dlRGpR2JPCyD5DRLzKItn6msL7qnG+OIPmMAHnZd6LUWxzl2F7ml5Ad/Ams89XsZ9T5MKZdHwTJ+ZsxB6sGo0nfN2e5A+bq2xtdE5pN2bTNi0J9PuYwCzmPDshnR/n+2teSnwnEyIyExNtiVmGgborm+63z1giB96YiunfPdK+l/GATIBEnXXg35bbQgyCSMvgcWHIThE9GWG6fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKurutHoy7sve8V5n2Kf1VRnA+63mQqgavH5Fq7Cw7k=;
 b=Ma5iNDs2VraVm27liMEXNKZyY9n+/8EBAU61SrOnzsFr14WaUF68bbm60Y8rQ+1jahrIJMZ8msUh+bRnaZcXW/q+lhNd2XCwlQDnWDGyXGAkPIaqUaRll1XlfIk5veOjZrmtkvxvv6+fyeabjckNSa8z6HuhP0KT7kSP7U01M6A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1fa826b6-7d85-9f1b-037d-7d6f3d35461a@citrix.com>
Date: Thu, 6 Apr 2023 22:01:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 7/9] x86emul: support AVX-VNNI-INT8
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
 <e5c21de7-8802-9226-82f6-505c8f4d6ac8@suse.com>
In-Reply-To: <e5c21de7-8802-9226-82f6-505c8f4d6ac8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN9PR03MB6092:EE_
X-MS-Office365-Filtering-Correlation-Id: 27cd20b8-7707-4c6d-5132-08db36e21f53
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E4feq0gnkNZJrDfy/17kgUlqR2/zxnIrnmCU4A0AZN6D+OpH5WTmpKueUuc1iUwokKq16N2yMnjl5tOlKfsbWy3cIjm3s5JPQJFWTrj7YUVRtUdsx4onGC54c4GKndu+xavsojTgwFdpV7NGhBv8UKoI+Quxum1VWMqrsF+KswQCSQIV0dRQIkb+4GJPyU9BsPeUj9J61Y/qNxOF8hdQPHXO0MxdbcF990pHTWytyawVJ1CrNMYbd8sFWHg6Bn1XjYQcL+B1WMGVvSaSdw+phUd8sdgF5QkJ7v68PweQT0JLNf0lhKvTV+DgRO/bVOB36lVVcoVGUyRQ0bfdsvwZ4/DHCoV2c/Coik9qZdPkxN2i+7+DKdBy9cKv3SjjUuA9HEpui0IK9gVDAJs31BzCgnsN11f9cGd3DWEyXz9n7cVLq3lh9SNi9eVU5S1nVPNx63P8ZTD/+IvyMA6OnICZwjbQRc+4rUuKwqXOsr5JwEJkAdX16jPDH+fsSD/o+0WUqXGW4rNlty41hWiL08H9jgkANkEyCDX3K1q01uxGAttF5elCXcJ4TvGvGo70687f/U2RpjwMybLnwQswI7jsNi685yEawNe+rLSfZ21OSTg74sjXXyBnH+gZB31R3CRKvHg/OJ+0PsSKG6nGz0sRAg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199021)(31686004)(66946007)(6486002)(66556008)(66476007)(8676002)(4326008)(54906003)(478600001)(41300700001)(316002)(110136005)(36756003)(31696002)(86362001)(83380400001)(2616005)(107886003)(6512007)(6506007)(26005)(53546011)(6666004)(2906002)(5660300002)(8936002)(4744005)(82960400001)(38100700002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amcxeTdxSVBocTZ6c21PN21vYk5lVThqdW5hQjNnVm5aUElaUTkxSXI0aW1T?=
 =?utf-8?B?NGw1amZ2NEN5ekR3V0IyWDdnSmZqbGpLeWxYU0wrblZEQjhvcHdnbFFiNEVw?=
 =?utf-8?B?YVB6bHZ2UEI4YW1aUE1CZUFHZHRTV3pEQUJ0OVVXOU03b2FCbFNNY1NHNW15?=
 =?utf-8?B?MXRQME00clQvNUd4dTEzYUg0Rm55YTZyT1Y3OGV1M1VSOGJKNU1FRTBlc0M3?=
 =?utf-8?B?UmhPemJtcmVzOTVKaXFqQUpEQjlWNHVnaUxMYXc0blVKS3BSNFR1TUJEWDRT?=
 =?utf-8?B?ODZsZnloSTVzUzFuenlSYzlUd1BmUDYrMTZJZElPN1VWK1BLc29HSXRQSWg4?=
 =?utf-8?B?UFFIOVliaW5Cd1h6TU1GRmkrL1JVRkxVcHFhUk9uWFdmeVZKWU9rV2RxUlkz?=
 =?utf-8?B?akRzcXE5TjZHUksxY0dFZDRJazBBUjBseWpmcXhxd201ZkQvM3hDSHJaOEhy?=
 =?utf-8?B?MjRoVlJtUkdnOVZOTXE4Y2xmNk5tVmUwTVh6RGFsUDI0bHNxQUpBWUY2Y3Vh?=
 =?utf-8?B?TzU5QThZT0tFMDBITXUxRXpGeUYyamRRTDc0RExpUXlOQzJyakJhbTRMV2Y1?=
 =?utf-8?B?VjY5Y0VtdXluKzZqSlZBYU1hdWVDRmtYSWo4WGFhdkNMYlliaE1YczcwYW9O?=
 =?utf-8?B?Y3FCaytnYmpnRVFFNzR6U3c2ZVNWVytqdVFwSXlrT1grNVkzZjY4ZmU5S1Mw?=
 =?utf-8?B?VmxMc0R4RVp4SGQrdTZWTXhzRHEzOGtOWm4rKzlnWjh3THZISG42MkdGaWtS?=
 =?utf-8?B?azNWWEJQZzhYcEU5ZCs4NmMrd1A3S3l5V21xeFFjOUtCYWJFeEZaQ293Y21h?=
 =?utf-8?B?ZXZXYUVrRW5BUzdkTlNhbDZaT3BzV1Izb3lBdGF4L3dzZloyL1JlNDNsT0ZZ?=
 =?utf-8?B?MGpxUVNtaENWc2tWVThlVFZSWFgzRmZZcjlRb3NQaVR6UmtRbmZnUUJDZWdT?=
 =?utf-8?B?VXhSMzFnNXEyYmFjT0MrWGtxY0l6cjBnbUJkcG5vTVBUVm5ZTTE3OUUxclhD?=
 =?utf-8?B?ZHB1UVU2QnpmUEpmNWZKSkxHRXFWQU1uVi8yMm9YNUxnV0lqTmpvMFJtMEpD?=
 =?utf-8?B?Tk9EU1ZyOTRyZWpNL0x5UisxL0V1VFpWczRDdFROYm90R0xYV29MY04zeStq?=
 =?utf-8?B?WlZ4QjFOZDdJekZ3elFNR1hVZDhhKzRYRldBbFJDb3k2cWJyQ3JKQllwMVVK?=
 =?utf-8?B?RmMvN3RDM1dTNnlpbTVPRElDbkxYOHF4UGpkNWtPdjlsNW4xZEkwSTJPSS9R?=
 =?utf-8?B?QXhpWG1ESzhJWE5Ha2FscGpVWmJjeVcycmxONGpjTFEvbllwS3RSeTl1SDR1?=
 =?utf-8?B?ODFNR3l0OEpGT1JtYi9TZ1dHZUpjTCttZ2lSNGovUHVDRWVCaGRWeUZiYkVZ?=
 =?utf-8?B?dXNxZlpZSTFBQjVEUUU5Tm9Ycmw0M2x3U0JHSUtJSDR0WDlzT1o2T2hXRlpD?=
 =?utf-8?B?RDEwb0gzUnNoUlJtd2RkMWJSWkJiakZUMmxPTjVuSDgrRW9HbWQyYkovMWRq?=
 =?utf-8?B?QUVVMkM5SHc5MG96dXg0VW1TODBrN09lQ3djOSs5OTNoR0RZZ2prK3pqV3ZI?=
 =?utf-8?B?RCtCR01NVWQzYUlhNEcyMzBIT0RBRTdDOTE5TkRwU0VHQlpUU1Z4cm9wTkhV?=
 =?utf-8?B?Tml2RFZ0Q3N6blMrZk9RNVhxQi9lZDB5a2VUc0xML0llY1puNEcwNHNHNWlj?=
 =?utf-8?B?bjY3bDlYaHI1TW45eFpnWlN1ZHpkUktXcFFyamloTEVrQS9qZk5FSHpnSkV2?=
 =?utf-8?B?RTEvc0NtWkFrV3NTTnZXbFJXdmpoZGIvTVVmODBBVDdqQlNmRHBZZ0l0UzMr?=
 =?utf-8?B?aUhQTW1NcU1LSEJJZGlEd3Iwa2ptTWR5eURHMHpNaWZ4bUFsRUZ3VU1EekdI?=
 =?utf-8?B?cEZ1ajUrdzlESjgxV0dwSVdKYUJoaVBzd09nSDNDa0NLSCtjL3RDQ2cxSWRB?=
 =?utf-8?B?ODdhM0ZZNU16a1BjM05hS2doMnVmNzdYZzdtT2RaZzVwYkxvckFDc0F6OERt?=
 =?utf-8?B?Uk1VN0FTZHdMZ2FKVVJkTXFLZ28rRitlS3VZajNhUzFoN1VQNisyalVxV2tP?=
 =?utf-8?B?ODcweXFHWERiTFlZK3NzendLMjFJemY2WTNHN3ZlTXI1QU82YjNORkg1dTc2?=
 =?utf-8?B?blN2cm5jMjJsZEZ3S09jWW1ndXUyWkZuUTNoVUpkT3piZXg5bDdzRlpLTzMy?=
 =?utf-8?B?WVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HYIZfeqB36tCFoLop5sMPDAEiSegS0gNuQJ8WYrnS1/Gf73ASpaQLi+OiOexkfUmUn9GaszIJfjfcy6mMoH+5/+hgBrZytytk+BrPuRKaACP8BJ4BMIaXI3AoPFoq8CyDGhQ7wNFGj+Vdc3cC/KloZMi1NM9ZwrMUPZU5q0RgB0z0Vsys94zqAq1d0XMPxct3M3a+xXf3ZA9cdBoXMb6m2aZK0vYaJu8Sx/yzI0TP/PKtFGyQWNgfeNzIb7OoQrl505A9POjvnlAI3jdCkAhJSguOsZZzutpNlwVf14zhWQPGP90qz9umyoP98+kbRnjLiD+xeyrKLQ6T7GSGhIICwbWq98fWvWSMNiqUwCh3jV9f1UMJsDCyvuaq3Rn3IRunyfNynORyCTL8sot9DtTiuXyEQY5CEUsL1MUgjIld4nehb0N83sZBFxEVM/+NDtKbbKvhtHpxrLBsJhkLUTsUItsw/FnZVQvCk0ub2B3a72e12tDJrItujEjjXQpN9XQAh+Ca0IOUjOLrjumCV28vbJCESQEmygI8A3nAR+WXNym616un1v4peqe4SkuwKgWxfH18KasIXkz/qj3rqLp0Mr6B8TqCGdOhDd0RXq7phj7Syk7b9WE0BhIzYJS8x+m0kttNGgM6+CNzptEGUdGn79plvzHSqKr46oHPgOXKTdGMdHncZ9wbpFef4YYBIPz/f/OLUNrKNYX3FIzOBsKTBecWFMGYDQl/xuunaC45Ghhihx+8azCkBObcR/ugaHPCRRdORKC+7W/lSLkcMMBzHOy5ZHAWZpoaom/yXe/AacZFbR9tGMik9rjqxQFblhA
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27cd20b8-7707-4c6d-5132-08db36e21f53
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 21:01:42.2335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vaWyGbhYNq3gRyFdKcxAHbDT2ytys4wtGwr6uwEUBl7x6/8lzvtXYR57g6sAjEPinxys37wHm+1kWzKNsHO11AukG4OsS6q5MDaEcwDE7YU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6092

On 04/04/2023 3:54 pm, Jan Beulich wrote:
> These are close relatives of the AVX-VNNI ISA extension. Since the insns
> here and in particular their memory access patterns follow the usual
> scheme (and especially the byte variants of AVX-VNNI), I didn't think it
> was necessary to add a contrived test specifically for them.
>
> While making the addition also re-wire AVX-VNNI's handling to
> simd_0f_ymm: There's no reason to check the AVX feature alongside the
> one actually of interest (there are a few features where two checks are
> actually necessary, e.g. GFNI+AVX, but this isn't the case here).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

