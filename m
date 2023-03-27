Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A01B6CA1CC
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 12:56:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515161.797767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgkW4-0006xK-MN; Mon, 27 Mar 2023 10:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515161.797767; Mon, 27 Mar 2023 10:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgkW4-0006vd-JU; Mon, 27 Mar 2023 10:55:56 +0000
Received: by outflank-mailman (input) for mailman id 515161;
 Mon, 27 Mar 2023 10:55:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kO+W=7T=citrix.com=prvs=443697bea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pgkW3-0006vV-6e
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 10:55:55 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efcf4256-cc8d-11ed-b464-930f4c7d94ae;
 Mon, 27 Mar 2023 12:55:52 +0200 (CEST)
Received: from mail-dm3nam02lp2042.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Mar 2023 06:55:49 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ2PR03MB7112.namprd03.prod.outlook.com (2603:10b6:a03:4f7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 27 Mar
 2023 10:55:47 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%5]) with mapi id 15.20.6222.030; Mon, 27 Mar 2023
 10:55:47 +0000
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
X-Inumbo-ID: efcf4256-cc8d-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679914552;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qtcOmsZSbzUx/yxNvzMjA5n2O+ElOAmElaLLWC0VbRY=;
  b=Tu7S8ZxcIK9DqQD9XAsvX7WciyKEjUJsgTARFghL2ZqluM+ms9gtQlxO
   kIg349wLObd/8x9cZUracLI3qGonnNE3SmzpbSP4Z1LfcILNaL5MftQiO
   u6VqhnrMT0LdMfWvl2nC9uODkuz/T1hXuMkyRKck2N5CI7ZA5dkttCvBt
   Q=;
X-IronPort-RemoteIP: 104.47.56.42
X-IronPort-MID: 102858464
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:OxAuaqAsNZySzRVW/+Piw5YqxClBgxIJ4kV8jS/XYbTApDIl1DFVz
 WsXWWnQaKuCMzGjc9kibdnj8xwA7ZbRmoVgQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GhC4QRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw0eImIn9f7
 NAhJjkGaS+Cutvqzbjkc7w57igjBJGD0II3nFhFlWucIdN9BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI++xruQA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE37eVzX6rBNxOfFG+3v00vUGq2V1OMgBIcwOnhP7lqkKFZc0Kf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHq6aJQHiQ8rOVqzKaOiUPK2IGIygeQmMt/N3LsIw1yBXVQb5LErOxj9DzMSH9x
 XaNtidWulkIpcsC1qH+8VWchTup/sLNVlRtul+RWX+55ARkYoLjf5av9VXQ8fdHKsCeU0WFu
 38H3cOZ6YjiEK2wqcBEe81VdJnB2hpPGGS0bYJHd3X5ywmQxg==
IronPort-HdrOrdr: A9a23:Br563apsHZmM5NUIjU6WQmAaV5oleYIsimQD101hICG9E/b1qy
 nKpp8mPHDP5wr5NEtPpTnjAsm9qALnlKKdiLN5Vd3OYOCMghrKEGgN1/qG/xTQXwH46+5Bxe
 NBXsFFebnN5IFB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.98,294,1673931600"; 
   d="scan'208";a="102858464"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kT8F3dl76WIqZ++DXXM1klSvFHa0ntjhvORyDEcoz6zkNwipK4WzcOOslVgzgnf1Cu5jlX5EQ4A8Ixl9fWgO/rwPVOe+3zjggGzgrLcPZtly4Pbdr7wZ4BJ6U8zxstYPwbMyjd+L4xPvyXmHlGaX0mQZP/gAzH/KLocO7/5vwJbwGA9Zne4waVkNjUJfJqJuhf9Y/ixqI72TkSaDVpy83pRV6mUntB8J9hKH6Mf2jxH8cDrvjntGjCpB6RN2JZ5uFngE6aq9NT39kvA96e+CuC573s0SlGj0OHb3kKaPoNJoWLL12sAqqcN1PwSDZSmog6ohVhoR+o1nb9e6vj6ljw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtcOmsZSbzUx/yxNvzMjA5n2O+ElOAmElaLLWC0VbRY=;
 b=IfvLRPNAfz/ddOg0tzL/ExuVfAmO9zaSloSOKweEbD55AmVnzhw/36j21Bn5Xb+kZalsA13Su8a9qWRYkZ1z1s1+pLMmj2QkrYjBp1SzcRJRvQzYAUCjXeqtgK8PHQhDkuTxoCzmz6w5WcnGPfNoDA6IpRvN7/5OmpbY580xwS4NdXflQBbeahGNA47kKpjwHT8VO3wZfud8DdOkK3hGUW8fXb6dOicsHuZxb8BpQF2YMfYPlUXk6Z0Zr8mz40/qps9D+2LBAj5YAnEiCIVZhTofhyZW7SvLF1LpOx48e/CuNq05Q5BPCuO0PDPxtndVnsXUYCVyOVHRZWmGQBId9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtcOmsZSbzUx/yxNvzMjA5n2O+ElOAmElaLLWC0VbRY=;
 b=cBJvnB20zCMdsNQHUq0iiLrOSMdfS1/fafSZuE6hdmBmGh9fjb3q+//fVbxgpunt1s8kw+lwa9Yt8rPEixQCaNsTxbTfKVzk2feiYgJMiHpATJ4k0X7FSPZTccsepGbDDX+vIWBjRFuOsEmNgadwqzxRH6Us8wvvV3EKiVhBa+A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c220e84b-bae5-7a53-2cdd-df5839603c01@citrix.com>
Date: Mon, 27 Mar 2023 11:55:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: preparations for 4.16.4 and 4.17.1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
References: <7bc583e8-6ca4-2197-2d3f-c4325c024407@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <7bc583e8-6ca4-2197-2d3f-c4325c024407@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0411.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ2PR03MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: e08f4881-0daa-4ff3-1df2-08db2eb1d1dc
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BM3qCTKVY/6zwNIGSc6WbXOjy1VZ31ClSOBrh+FI8OieNVylOe+v/ryibBlgk9r+jeaaoFytGBd3wNoXmghBwp6dntvGzY1MXjx4XUTKUGs+h2guoBeiM9vZGB1j2Zlt1fAkSc111s8rlok8h8YDS2nw33sTFXgCjzpqN/cq0GU0PWkqungRoa38NcHTmE4pVbnqY1WZKMxTajWqUEfJ/XjsU9wAsyL6Y+ZQh0OwWVEiT4WqdwREfWpsgxBwYq55yEyKbsdWLSFLrFMiaRJUSG+c87ymcI+QB9AWbHSrZDQMYlmTbG/RpVbygyl3jOb33Es4g/uoFA6589qBBZbxI/u+uNFzSB+LXZCthfwDais5q0aKc5oUdOn2OG0fU/62Wo/9oKQ5FB1wXsD1JqZaDECckpYhJz/ruJP9+OoZOJRrYo/3Zw3m8xVZOgh3zVTJt26CJS4HHo/GFbqfZYCIBR38ZXVnU1POAepFJcCckvzXkRc0kFZZ7aASXTAK91xg/k6x17A5wKdycfOZeuA12At3FOARN4+/2hWczKrNWWTGJ7XlmayXVGzYAe9NQHTIZcpIVzIirdjGcN0qQXG2sAyNyMjN3fsyABZcEwVP1/lXcqYTJOgiENIBJTcdpQHBsj1JqwD526+bOIivt2YebA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(451199021)(66556008)(54906003)(66476007)(31686004)(5660300002)(66946007)(4326008)(38100700002)(53546011)(2906002)(8676002)(82960400001)(41300700001)(4744005)(2616005)(6666004)(6512007)(186003)(478600001)(6486002)(31696002)(26005)(36756003)(6506007)(110136005)(86362001)(8936002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VCsrYmxObU5pMExDWkRwZEdaYkRaRC8zRitlcnBSd2lHRTFUSGJ1WWFZLzZD?=
 =?utf-8?B?SWZzQ0NtMGY4bTE5L2JEYzRObVpCVlJNRnRycmtSaWQ4TVpubkUrd1lUazVv?=
 =?utf-8?B?OE9iSUduRkN3RGpDVjl2bjJwbDkvZDR2RTFheXIxUVZXNVkyWTRGUDFKOFRN?=
 =?utf-8?B?MWwzdTNORXh1MzdzbmdZRjRsS2FLMzBEYmFlcDhSSmlrVmVINWk1VFAyTUtF?=
 =?utf-8?B?NUxvTzVKQ0ZONE9FYitLK2k1cUhwQjdyS3ZLRkFubHZ4dkMyR2hpeFRLR1Ja?=
 =?utf-8?B?N1NyZzlDblhXUXE5ZVBKQS9YY0tLNWpLcDVveWtQMkJiVXpnNVB3bGVYT042?=
 =?utf-8?B?bFZRdUUzcE1oWDMyTC8ra0RTeVFMU2Rlb1JlOU9sZ1ZSVDNvQzVHbHpjVmo5?=
 =?utf-8?B?bTJZcTRXUGppZDh1UmlOWkZ1KzNYeEZ0VFUrcXpuVFBKRWh0U2lmRHlhRmdi?=
 =?utf-8?B?RlNubUZtWk9MdlFCWTRwUFFvREJKM3l4c0FjeStBcXhpZlcvVGhPdU9WREor?=
 =?utf-8?B?T0FhUWpIK3U1My81MTB4V2R0cU1ISGhwQTFzYncvRW1PV0UycWYwVVNLYVpt?=
 =?utf-8?B?OWhha1d5WUlqZmVWZ3VGMHh3TzNLVlZsYlBzNUFHZkVvUi84aXJkRGdJci9X?=
 =?utf-8?B?WDdIY0hKYndpRWNGOUxpcU9ZVXNkUUVwY29DcVd2aEtZa0toTkhISDFoSFdr?=
 =?utf-8?B?aCs3WUR6YlJOWS9kcWlzYUZvLytab2kzeXlDYlFwNUh5TmhBQTVsRzlVR3Bz?=
 =?utf-8?B?MlhyQVFza2RRb0FyZ3NLYUpXOEZoNGxVYWREajM1VUhmL2RjbFVNaG9vWFhB?=
 =?utf-8?B?L1JUYzEwU3Awa25nbGxCVGJSYnBleFQyRStFVmdoMEsvejQwaGxoMGlJNEJt?=
 =?utf-8?B?ZnNrMldHcERHVVF2U3RXS0sxRjg5L1dMeVhCMjhQNnBYdnNtQUxndnZ5SE1i?=
 =?utf-8?B?MWpWR2U3VGhBeDF2a1VUMjBya1NLOWI4V0NPaTM3U241UkY4VGRoNWxQV1lF?=
 =?utf-8?B?YzhWMys4Y2ozUDdTNmFaYTNxYU4zQmgyZGtiRHNtSDI4TkpCRTFIRmNzLzc4?=
 =?utf-8?B?QlNhK1BsWU9zcXVnZ0srcFZ5WHZsc3FzaHBLSDVxUUtUaDhTSzFnT2RrTGYr?=
 =?utf-8?B?blBkQlc1dkwwZnJRWkJLLzlMZnY2bTU3VmhIR2pvYm0vcWNNOFR1YS8zdXd3?=
 =?utf-8?B?azFGaDltclVXZlFjNnNONDQ5MlQwYVZaTElHc2tBNXhDbmh5ZFZ2ZVVPbWtF?=
 =?utf-8?B?em93UXNEOEtITDlyYlhnZlRsOWNQa3cvMS9KN0FVUlpzNEY3SExGdDlsZWc4?=
 =?utf-8?B?VHNVdS9XbTBFZ2Z4R2thQ2hlWUJqQ09Wb1dhbmN4Z1NaOWdwRjQ0WUwvaEhz?=
 =?utf-8?B?Z3JXa1hjQzk5bm95WlRvK0wrRTlpUmQzU01TVXd1SE1na1BEaG0zelQyUWRa?=
 =?utf-8?B?MDI5TnlldVZ4L3VKZFpadUVZY2VwbE56SGUrQnUxNjF6S25XczVUVnZraFJW?=
 =?utf-8?B?S2VFZjMyRS84NG9FSVF6UDF2czNUWWdETXE3N1RNcjJCRHBONXZha3c0aWVK?=
 =?utf-8?B?ZytYV09BSmkzbUI4ZkRTdHZGSWRnTFdSUDEyZDdqYW0yWERaSjNBeHpuaGNs?=
 =?utf-8?B?Tm1wZWJyNTVKL01FSE8yNWFPazFqSVphcUxaRHV5NDBCR1k1V2xWWlJTZVZJ?=
 =?utf-8?B?NFVJUy9nclBtcS9VMGRVSFFXOVJyTDVTVXZFOGVtNktQbEtQYUE4RTZ1elFH?=
 =?utf-8?B?Zmc4UERGZkxvSWx5bmRxU0l6a2RPVzJMelNua1FYc3RCdXE3UG1jN3l5WVFE?=
 =?utf-8?B?OWZSdmNHQW1RbXQrd2RDZTlHQXNCMUpqNnBjbUsxUHkvZzgyYVdzZWx2dEUr?=
 =?utf-8?B?aC8yUDZvLzVDMThuR1VDcHR5eHhwZklmaTZTd1Z2QkQxWkxNRGdyTU9xek9x?=
 =?utf-8?B?dmIyWEowWTJKUU5Pa1hsQ2ZYRVAySnRYUFd5bUF3aEFTMEZaRGFqK1RRaU9u?=
 =?utf-8?B?NFdWM0JTcTBQcjM1MG9IZWtxSjNqaHJ0d0N6d2NST3d2eFdxb2Y1SnZZc0JY?=
 =?utf-8?B?RGdtL2UweXcwL1lucDNKWXMyN0NIVFZPd2VPQ3l5c2hzdXlzcHhyL2kwR05P?=
 =?utf-8?B?TGlpN3V2UlN3OXZyZEd5MFRWTHJpV25SWjhMeERqUGhwRlYwSmh4bGJZQlJL?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	U4FELb5iTOJmsAM++zL/d9D08K3uceZiRU/s5S1cCVjJvXIhhhOQ4COFY51NMR49AxzMit3D5ObacgfILSufBfKBzGZkSRbUERS/0qfbky+ITfGhGovBteJc4LBOtsAIZNfHdm3JIVu/imlebSP7wPxcZI/eiEAixcQ0OBlb7MvltozYVyXOv3XqcISBcmq8Rdy66/ipOPl00JKG5poFa4BJQhLhGzS+E557oQWUXe3XTnFCQOxuiK6QFq8NNRDf9IgmvoOLphLx5LRGQAu9/JeioT6qYplv2BtK82QpRLS4N8ejLjYtRPwjxBoSIctW6NOWuZba06R9hNGrgkMFvDMKAmug9DW/a/Hexy8hc15hfoPD/rvyLSqqryP00H/ni7ud2VA+EFn5YjKQ0fj8fo/EpSO3SycJfIMTrGabUZhlILoaIeC4STAqIWZGPhNDxuSpsbWpSl67Tf/LFcpZUyPdtJRTo+ms+S9fsLJeR9XuboFwohhicr0oZHPZSPoNvHppyM1gqUN7gD97bPbSKeOEc5DyL1OO1I5Pc3Zfcpm+YsZGobu/9xALYQKsM63Srqrwcv6xAdH2kM8KR+b7qNMVHrrcyOrfW5VotM84+GSm/4SAgp2gn24eKRr7BbAvO9TjNfzTgN7dLWHpDJ2/sFttvghg4l40FWit1mlYUYhGmGfznlD9kexAf6DeDZFr/WLVChJTgMPmrHCbd0NT1XDjp+y6IjCDS3Ej6CqlPXZRBOWSmJwKqecoYnAMqXEA59k3rOMshAvBncp/wdJ73HMhzhE1vMrJ9/E3ELksZgkVpHiE652/E4RnuxgzSmu4ordHGbsSai9ps6UFTwvcdhHVFTiCvCcciZAvXp+binY=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e08f4881-0daa-4ff3-1df2-08db2eb1d1dc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 10:55:47.1543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pfK4iZ8ByUZysGPYpj5g8hEaG6aCbjOd3LM+pC80qjmEsMfpS/thlReKN21yRB70pSeDz7al17fE6HpliVxtETWOSU0kEqBzu9IP6lxvfqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7112

On 21/03/2023 2:30 pm, Jan Beulich wrote:
> All,
>
> the former release is due in a couple of weeks time, the latter a week
> or two later. Note that with us following the 4 month cadence pretty
> strictly this time, 4.16.4 isn't expected to be the last ordinary stable
> release from the 4.16 branch, yet (unless, of course, we end up slipping
> significantly).
>
> Please point out backports you find missing from the respective staging
> branch, but which you consider relevant. I have one change queued on top
> of what I've pushed to the branches earlier today, simply because it
> hasn't passed the push gate on master yet:
>
> 0d2686f6b66b AMD/IOMMU: without XT, x2APIC needs to be forced into physical mode

All subsequent to this email, but for completeness:

6d14cb105b x86/shadow: Fix build with no PG_log_dirty (all trees, as
this was a bug in XSA-427)

bc3c133841 x86/nospec: Fix evaluate_nospec() code generation under Clang

~Andrew

