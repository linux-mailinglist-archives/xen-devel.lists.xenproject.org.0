Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BAF69727C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 01:08:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495653.766038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS5LI-0005A2-MS; Wed, 15 Feb 2023 00:08:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495653.766038; Wed, 15 Feb 2023 00:08:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS5LI-00057F-Jj; Wed, 15 Feb 2023 00:08:12 +0000
Received: by outflank-mailman (input) for mailman id 495653;
 Wed, 15 Feb 2023 00:08:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aW5I=6L=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1pS5LG-000577-Ec
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 00:08:10 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1d3911a-acc4-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 01:08:06 +0100 (CET)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31EL3xuv016238; Wed, 15 Feb 2023 00:08:02 GMT
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np1t3evsb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Feb 2023 00:08:02 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31ELnUYH015156; Wed, 15 Feb 2023 00:08:01 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3np1f6b9rp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Feb 2023 00:08:01 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by DM6PR10MB4315.namprd10.prod.outlook.com (2603:10b6:5:219::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.10; Wed, 15 Feb
 2023 00:07:53 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::6800:e85a:3f21:6606]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::6800:e85a:3f21:6606%2]) with mapi id 15.20.6111.010; Wed, 15 Feb 2023
 00:07:53 +0000
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
X-Inumbo-ID: d1d3911a-acc4-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=YCYmNgxwj/GhlCG7BbHd6Wb7Rzaxaov6suppziMNPA0=;
 b=cu79GiArb0zW1Pzt86semmnRUYIcrLv6PhtcoYW+ijcetlrlH0bSg14mSUkBzqP5yRej
 ESt6JUIYdlD148EPKiwY2FIoFxisOB+ASpGUZvZpFTmRIAiw/fm86WhADKUu+3JAZ39d
 i8HI5yXsY1gVM4+JMLhxaE9ZZbQvHajDQKKDriLcAyIev/5NVlAa5cHKsFE2rMBWLudC
 jW00KA9+vIiUKqfLmj6VgW0l7xoCL06y21qWfe+K6TrZ3jQlTqF6xrcQtkoguFEW6Zpe
 HBVHHqVpuzPI0p++7/Mt9lqIMFsdIBhEiIKQvaxQylf58PWVhk5ju58SYfj7DkSEma2y bQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n++t09cH+hVPi8Lwr6qfRJeFFX4eYbArc43e1IPt2kBZLdLgqPVavQODwARJY9t7JBJmDT3rdxmNAUA5NDqWp2Ls2DQbQYDAHaum6DnuZqMOcBqV/0g2gPEz5MLSnIn+RHRdAbn2MjSmSqerkD35w3Cu4F9tgskdiOox2vhTUtqe7gy0usG1K7LegrEqKJpLPVhHzifQ4dcr0+Zu+1jy0Q3IU9OPCqkgkPJy8PMK8QB9UR/z/MUky4H2JvWGIzsSXNUB0obHAAqT6NsqgLNje7oUR8pjbF8fwadkHXzJBSnjafQCSggRcNLzht7EwYBrVSNQIIdm9Ferw4CNWEXznQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCYmNgxwj/GhlCG7BbHd6Wb7Rzaxaov6suppziMNPA0=;
 b=d3tkSW0A2p5+5/2lQa7RjfjKmiuH+CwUuqVSlnMEYuPhAv8g1mFvW3cHrtqMP/18RMg0kDmdGYHnZ2SgDNoEyQlTB+Pe4xppgfHKILYvO3VvJrwWPpWyE7bgvtGdfxCBmZH4bLJOjcPb6Fv173sgGcEB7JUGtCCUl8bIGhp/EkmWtQkUVu4L+EglO6z0bCNYgTx0k18BlFiZVLEzaMa4s0QpHcdxMiVkpRanQeANIRK2Wm8DKJ7D9muCGWYgqxzfgk2JL2ZjQeAwQ36uaxy+8ajgmy3HiJsyPDmRYV1c/0SyPhGzQ/cOhBBXCbBK2wy6n5IEDhYfQeC2i3OK1JmUew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCYmNgxwj/GhlCG7BbHd6Wb7Rzaxaov6suppziMNPA0=;
 b=GTxIh39YeIzJKJh6faeHXRKJyUTumT+lK15CHhDKAac92EHnWUNjLjwmQ+jbncOm+ZFnGDsdB6vdRqpemquEfJsowsV2/4jSrJ85Wy+kdeKq3GctvVbb5rmlwR5vFVwx0WGpLHupy2ZeK82Vkg37jDxK5qw6C6GHpGiwAxROvww=
Message-ID: <4e66865b-11ce-cbd1-d115-13e3743eed7b@oracle.com>
Date: Tue, 14 Feb 2023 19:07:51 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH] x86/Xen: make use of IBPB controlling VM assist
Content-Language: en-US
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: Jan Beulich <jbeulich@suse.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <51ae9cad-3644-02cb-9cc7-28229987487d@suse.com>
 <c4d2641f-7a99-fd8a-53c5-faa277c572a2@oracle.com>
In-Reply-To: <c4d2641f-7a99-fd8a-53c5-faa277c572a2@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR08CA0026.namprd08.prod.outlook.com
 (2603:10b6:5:80::39) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5009:EE_|DM6PR10MB4315:EE_
X-MS-Office365-Filtering-Correlation-Id: ba3b74b3-af42-4a0b-426c-08db0ee8aefd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9UZVvqXIRMrdEh/XSGe4O5buzZF1H1DslrLrlLwYhVtbtKu7n/TC+T3mJOf0oTsViO0lubLOTyZ1ysOabvdmKLSmMaNAsObMaGkMUCY7eUuUarqZMropHIxzlC98bjgT3tRDEK10D0ZFjfeU9P+0nK80t8pFhEVopIlwgrtmc4AMqh7sThpp+vwOFOcaYBGMiJH/5HPFC1pdzEKcwvwQw46yB5z5kfnEluEy0+o88P5Q4aasvQ7ZsAkj0f7ENaTjB0cAhLiB8osQp30237bIMoxiSwoigZNS5/4c3luqCkAjAztxuXhZZkXfna4ruhBUzHQRp6a8MCybjcRB9ktVA5q7hv/wphxe9K+b7nW+JI71HkLwwOqn0a/UtWxwfPqJUe/91o2K8vYlg9qtNbFW9QI1jwSbqPa/gHRP3VuF/ZQ4BD1T8cK/XaVbAciWTDSWeAaKOe+RVyxwHj58wLS/4TyF3z42HMSZakyx0DBneOCHAfNFS0KCAReOY5bAKVSxgcrn0uFfMOcFEy/s2BkzwqGdcFNZwz87xFLr9SYlYhazCbYeWe8JLRHJodjoDXhMhXyjtD0Ph/5JBtLuDjKZDZrQjWPuJRHbkKN8KWDCdxbqGIszw0h2thT1P4q37sipIkNg785sUjc+BX1IZRQC0ZqWfxNrN1Q3pAxM2BYDuzW4U8Fd8uUoghLmM+LQDtCAdIaeTKir1Q0TG+hX3/bzNT1FjXfakFC5HzTs+wBVJIE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199018)(2906002)(8676002)(4326008)(66946007)(66476007)(66556008)(186003)(110136005)(31696002)(86362001)(6506007)(26005)(316002)(54906003)(6512007)(41300700001)(31686004)(4744005)(44832011)(5660300002)(6486002)(478600001)(53546011)(8936002)(38100700002)(2616005)(36756003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bzQ4a0NZaEJ2NHBsaGZ2Y2hIVjQzWnpreEhBcUtBQU1tcTA2N2dESHFpVWpr?=
 =?utf-8?B?dHlWSzBaN3ZhOUNEb0pzc3AwaW1KS0hMVFJFVDM5YlBZd2NwZWxpU292cGhJ?=
 =?utf-8?B?Mi9wWGJYajNybThYVmZPSkI3MnFWcXBJMUtPMlZPcHp4RlhyOVdPT01zcFhH?=
 =?utf-8?B?clp5SnFTcjU2RTg0MUZla25qWVU0dGlJZlh1QXBERENiVVI4UjlRZ1dMWVBK?=
 =?utf-8?B?MEM3OGMvRkxUK2s1cDVXQWE2SzlyY2xRZjNLanRqcmtHcTA3M09IMS9HS0pZ?=
 =?utf-8?B?bGxkVk9LRUc2OHArelZaR1JJTjZ1b1l2NWxEdy9XdnU5aElhUUdhUW1RL21L?=
 =?utf-8?B?VkpDa2NzQkYwdWp5by9vTmV6Mk0vWGNHejJPenZudWlFUHdoSzcwckgzcWMz?=
 =?utf-8?B?VTVSMkNUK1gvRU1jUjlDMjgxTWhZMFU5M2Y0b2tRek1TYzR2S0swcWVYelhk?=
 =?utf-8?B?NzZYNmFWZHBreVo2RXN3WFVvcXV2bTlQSDF2aEZiSEtKbDRONHZuYW9XRGtW?=
 =?utf-8?B?WFB1am5MQWs1RXIxcmkzcU9Xd0ZEZFhNVklTeXU3ZHMrbitaREJ2bU1NNk5r?=
 =?utf-8?B?SmhhRHFsTVFVeEpRUXpsSkpTRVYrYUtTUUNOMkJ1dkVCYUxhdldyenRZYXNv?=
 =?utf-8?B?ZkltVW5pblpnWmdYY2xaR0lHZUdMM2dOVWh3R0ZMOUpDUEQ2RGVwakJsR0Vm?=
 =?utf-8?B?MmdTNHFTOGRick9nME9MRnkvMmI4MVFPOHBlMXk5MkQvNHNSKzNNY2dlNlFn?=
 =?utf-8?B?YngrYzhSbVRWV01CbGxKMGZRU3BrN1p4aWxrL3VsTlluWTFqbmRKSmIyWEpv?=
 =?utf-8?B?bTZGblVCRjgvZUJmaGkwNEFWUFZiU1NJWlFhTTdBb3ZJRHZFWklIdnNsaDEx?=
 =?utf-8?B?RHAyZTk5VVZzcjU0dFJSRzNOWUUwRjBYUTRkUGc3TGU3TzNJaWt5WHdCbmJn?=
 =?utf-8?B?Z3hsNldvR3FZbllBTEJhTzlOelloVE5FMDRTeU8zS1JOd2ZoZ2cyUTk3QmZz?=
 =?utf-8?B?MWk3VmlBTjY3d042UExndmI2bHc2OW9aNXJaSXIvbjVZTVZjZmZab0Z6WUFP?=
 =?utf-8?B?VlFRUGNtSklicVlvcmIrWWVzZE9BbUVrV2V2TkpQOXRKN3NkV3JGNVl2TllP?=
 =?utf-8?B?elpyUXBUMXFXU3J1cGZIUWdQTEpPY1RvTWFTdkhoOEYra1Z1SExRTjkxeEQ0?=
 =?utf-8?B?V1F0R1J2SDVCbkVRYXh2VzJnSmFwTUpDdXgyQ0NIWTZjdXhqRHRGRFFkVmly?=
 =?utf-8?B?NFpyQVo1Y2JzZVJ0dnFGL1NHRmEvcWVvMUpnK0FsMFgySkRWZ1R5cE9FSG01?=
 =?utf-8?B?aTRQa0owYko2RFQvbUxaZWczZmdKalF2VFpRZGw0SVlGS0xjTG16M0dwYlFJ?=
 =?utf-8?B?R09tZG50VnpXV1lvdTh1TW9yVzJCVkUyc1I5VmorN2ZXbmNEWFBTWWRsSzZn?=
 =?utf-8?B?blVwMFNzeWl1ZEFBb0VCQjFFazNQNXVXQytQNFgwQ1R5YTJBdm1uVFk0b2tO?=
 =?utf-8?B?TnNBVkpLYTBXUUZGWmJCMGdnZURxMExtNXpzTFFMSW43Yk1ha2Z1Vm9VcFdI?=
 =?utf-8?B?WE9JWi9tNEswL21qNVBpRzR1THdqQmhQN0Zlc3Nndld1NUx6SjdFbFMyeUl3?=
 =?utf-8?B?YmV6cUd4OXBobmQzZzhtQjVEQ2tSRDFjQ2Mxci9pMzBlT2Mrd1k4N1p0Q2Mv?=
 =?utf-8?B?eFlrRWJES0R3NWVCMjBHZW5lWm5PeXNkOGprVTR0WVM5OFlDdmpXV2JONHZE?=
 =?utf-8?B?WEZKZkVOdkhTeGZ5eVhnbDVZM2hXUUFSOU52V1k1L2dKVGY4cGY1Y1d2c2gy?=
 =?utf-8?B?d1NabkY0dnRnaWtVOC84TkxQN0NWWUZ1UmRyaUh6bTJjSmZ3d2tSbmdFTjVt?=
 =?utf-8?B?eEZqdVR1UXNVcWxialQwMXA0dXAxa05tQUJQeCtEUEdPM2Nac0VTd3FybUFM?=
 =?utf-8?B?SEoyb1lTRUpxTnRuVFNWQXdTWVFGM1MxVzBrR2ZyWXVQMVNhVlFrclhLT0FX?=
 =?utf-8?B?MFhFTzBTQXR5NXphY0N6WG8rRk4ydXd2MXRNLzBKUDd5OHlGczdnN1BlKzQy?=
 =?utf-8?B?RGdBSFgyTWNMYVQ0YlpsYmFSR1FDaVlMcGRqTTZ4cTdnWHNOLzFHOW9kc1Fl?=
 =?utf-8?B?cS9oa1VJQkg3RUMyZk5WZE1nVDhxK09GV2NkYzF3cGwwakN6UDZlT3NTTzdl?=
 =?utf-8?B?MXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	kCZWLVQc67XuHNuOSoHwJWNeVD4FrxAS9QNpPndbhqdTP2EJ8PrpFYMEjOpo/CPK+UpBwBCbRWOskoi49ryQHkaFxhQmih3IW/EBQleDuP7hOSfK2Mq4TeZiDMJzW3cck66RHz8lzXABp2Z6ChErxDEI3aFEpUwcZF3wJMisMjW5NoNwR+3TDAgeyXkVHIVISXrsMt2+GSqVoPtPWLUURoKg2XbbOmUjBkCe+rTRZJZuC1t1UNolQgweQoVIH2yGGHg706SWqQFAHYMszy8maPgf2MVaedZHpNst2pnCdEKaJBBhFR4u7GY7Dj1E5jS9rPM1nzO/4vi7j+lIFrQXceWTsjnJ71VXuIPAZrRe/D1AVwgLcvYb/oGRHoEBMqR8+/AzIKWLePkdZAzA2Vv4ir7MuArmbNQ67nwVI576iVMtzFwYb4bduwurN49i6PelNdSlEzBzvCUMKDlFcBKmtOqqibY4SQPJP40/hwCjIiiHHBeeFFiZa235h46kU4UjP/6TmFlcydfRRJEWDKZEYS0NATGXl7m0phictKLaEUYpW5YTUgorOV9SNiiiS4f8zApAjRbMP6LJhzhLpRPlnvwVYgoh2iC00IBStZTnLjzBGFu1ZQD1u99R2GvFiLcWW85qxgxT/iCzxhiXnOKrLwf43Fi0ONrnsPP37jSZE1WgPQNXazLXSRo6OLU2n3DfRB9oldRAoX7ODx0MlAa/f259gtbbQh9Jr4bbPKtF3d+EB9y3VxEojMzRJT0o2sUQHe1u+VATRh0zbJUy4bEUEoyWLVV2TxUqetWKR6dSJMYyJ/svtiAde6neW5i2LuoEX6lsq2NwHlIK7CaA0ZsOrQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba3b74b3-af42-4a0b-426c-08db0ee8aefd
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 00:07:53.5185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n2AlFJGxBvvajawOPnTNYoGg8OVXuJ8XL1pnwvBQbd6odFSAySE50Tdebk/Twxi0AhuBgExcgFwMafvKYnwLzo4ix+SVixtVzPSw/BI9mC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4315
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_16,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 malwarescore=0
 mlxlogscore=806 bulkscore=0 mlxscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302140208
X-Proofpoint-GUID: 2u2xahborChpUbtx01cORFIncsLD_PgC
X-Proofpoint-ORIG-GUID: 2u2xahborChpUbtx01cORFIncsLD_PgC


On 2/14/23 6:53 PM, Boris Ostrovsky wrote:
>
> On 2/14/23 11:13 AM, Jan Beulich wrote:
>
>> --- a/arch/x86/kernel/cpu/bugs.c
>> +++ b/arch/x86/kernel/cpu/bugs.c
>> @@ -18,6 +18,8 @@
>>   #include <linux/pgtable.h>
>>   #include <linux/bpf.h>
>>   +#include <xen/xen.h>
>> +
>>   #include <asm/spec-ctrl.h>
>>   #include <asm/cmdline.h>
>>   #include <asm/bugs.h>
>> @@ -32,6 +34,7 @@
>>   #include <asm/intel-family.h>
>>   #include <asm/e820/api.h>
>>   #include <asm/hypervisor.h>
>> +#include <asm/xen/hypervisor.h>
>>   #include <asm/tlbflush.h>
>>     #include "cpu.h"
>> @@ -934,7 +937,8 @@ do_cmd_auto:
>>           break;
>>         case RETBLEED_MITIGATION_IBPB:
>> -        setup_force_cpu_cap(X86_FEATURE_ENTRY_IBPB);
>> +        if (!xen_pv_domain() || xen_vm_assist_ibpb(true))
>
>
> Is this going to compile without CONFIG_XEN?
>
>
> I also think these two conditions should be wrapped into something to limit exposure of non-Xen code to Xen-specific primitives.
>

Oh, and this needs x86 maintainers.


-boris


