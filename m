Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5379B696D1C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 19:40:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495545.765896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS0CJ-0000PB-PL; Tue, 14 Feb 2023 18:38:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495545.765896; Tue, 14 Feb 2023 18:38:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS0CJ-0000NB-L2; Tue, 14 Feb 2023 18:38:35 +0000
Received: by outflank-mailman (input) for mailman id 495545;
 Tue, 14 Feb 2023 18:38:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U1Wp=6K=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1pS0CI-0000N5-Eg
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 18:38:34 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6c48bd5-ac96-11ed-93b5-47a8fe42b414;
 Tue, 14 Feb 2023 19:38:31 +0100 (CET)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31EHwtgr013252; Tue, 14 Feb 2023 18:38:27 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np1ede6au-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Feb 2023 18:38:27 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31EIE3qw003694; Tue, 14 Feb 2023 18:38:27 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3np1f6fy47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Feb 2023 18:38:26 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by SA2PR10MB4779.namprd10.prod.outlook.com (2603:10b6:806:11f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.8; Tue, 14 Feb
 2023 18:38:24 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::6800:e85a:3f21:6606]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::6800:e85a:3f21:6606%2]) with mapi id 15.20.6111.010; Tue, 14 Feb 2023
 18:38:22 +0000
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
X-Inumbo-ID: c6c48bd5-ac96-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 from : subject : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=VxfMkuL4owkU/1PHBmBq6P1aEjB7Gmv1i2aLnNMdP8k=;
 b=hgYJwvdwiejRsvMeFr3I9sV+hKcYleyj6rciZKfkuLD2WBzq03hzSL6Ng4IpaDBsRDpV
 n4snJ8FzaMLx6t7Qng2eSmUoof7hCL6JvGey96VaU+/8ESZnWBloyjDNCbU4OTSCQ9Uf
 1e1yaVPgAxH5Ll05n5Xvfry2WeD80/VzgJHNkkAKT2tA2pgnchfN0sH+WAo242fo6iBc
 +0BivzT+8+LZCy71kjwzEUgEh2AXnIwNmiJ9N6M1uG0r67uKDVM5f1oOmxenRXzzJ7XW
 GVQMfzLzbU/UGj37S5fGQ87eWHU0oYSMsBRu1LB44qDCqDwISObn6qb0ZUmw59iH2Bt2 mQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NPxfdw/IQNrvvyffXPUrMS+qKmqrA0ZmxBQGzu5JOHX7nqYGfwkVPmoRmGWvjPZPiz5JQvib3YaEvrqOyMvVWigXLI43HfnJzOud71e72cgKhZYhZK3VfcxBVXH/KyiuYbXfktKxtT2R0QgawSxHN16469ag30eA49RcxtKY4JKCzWo7suy7HxERcMP86t0Vv54wtYrFt+YzEDBr6SuumsVcn5D2QtPIm6A/eoAkEiHCVZ35DyFxE1oisu1u3tHzAf/No/n8SfwGwGJ942PVRy1AZV1yHFDzmcWFlfrzM0I0ZKblMY4YPhV21KV1L5wZm09+eLg7wZHXLb8c1a/6KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxfMkuL4owkU/1PHBmBq6P1aEjB7Gmv1i2aLnNMdP8k=;
 b=E7pFJ42CBRkIO6PsagnsxQ4HTIt9tBjYCZ7BX01Ci0sJd/KRfEZZXwf3rMLlicyfGHcn8/BdmOU/AYO1xhBVOmt0BDJ5hbzinhzC5kiDw6C2sEXBWbH5JdO7Af0177b6HD06KaHhVkRkRUwmnZ4XWLf0Nv7+8mDbdWQAoqnX6epIvixN16x5j58aq1tGvH73qfOPknVwZCNRHSDr12cqWCCF8Hc2T/9/NrRh9WZbpmBe2pF5E5aQ5W4c73sFzGL6B/Txz5tGd/Fq9JAq1EiBL3hjlsGg8AxcZfZPwVWMns1O1QIF2QIHDvA3aobhUOHqJst96AKMoU/3i9VwD2xxQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxfMkuL4owkU/1PHBmBq6P1aEjB7Gmv1i2aLnNMdP8k=;
 b=OKKWwFULRj8NBvHhby9zDE3Ek6wp4YD6A4QwxLMBqAMzrtLmab6oWPGI6Y3ByG9NL4ew0rxHk7xmBzV3+MStdrBTTeHMOXqEhREZC8wWUNaV562kh1MZCF8CYJsKjd3FjdWeSVy0mFfRDuL9zkV+sUHp/+mAlmE2h74ez3auVgk=
Message-ID: <88b3c98c-4383-ffc7-6e1a-2f7f37f49555@oracle.com>
Date: Tue, 14 Feb 2023 13:38:20 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [RFC 01/10] x86: introduce AMD-V and Intel VT-x Kconfig options
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
        Xenia Ragiadakou <burzalodowa@gmail.com>, Wei Liu <wl@xen.org>,
        George Dunlap <george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>,
        xen-devel@lists.xenproject.org
References: <20230213145751.1047236-1-burzalodowa@gmail.com>
 <20230213145751.1047236-2-burzalodowa@gmail.com>
 <e29e375f-3d30-0eb1-7e28-b93f2d831b43@suse.com>
 <5c3eb593-b63f-303f-dcd8-f5c319152635@gmail.com>
 <3cdfde6f-5af6-4044-f786-259c70e0ba69@suse.com>
 <5892e7d6-bd08-0f2f-4dcb-fa5b9123a2eb@oracle.com>
 <342bb651-b0f8-8cbe-53ef-e4a292446224@suse.com>
Content-Language: en-US
In-Reply-To: <342bb651-b0f8-8cbe-53ef-e4a292446224@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:208:236::13) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5009:EE_|SA2PR10MB4779:EE_
X-MS-Office365-Filtering-Correlation-Id: 547f1424-86e8-46e1-0a83-08db0ebaa6a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Btbn5m+fCMWonTQvH0CFB4AlQ/ZJPS5dCL6QLbswxss9Tm21en1lRjtTn8WmMP4R15dx9A030N94hMcsKEoNeLCI3FgfaIlP5L/Azpkkwo3ZK7Ixv237Ch20UIEVjsPKTRlX4fxMYBC9h7XpP6d5c5MDcXH/AQsfvFiT9ZVfbEsdmEuRAPxO6xb3WbRRpMqtx6ZI9nXgExdjuEDczun73r8szXiIEYh8oBCjMQZHLpPc+9j/kBNwQn5nxnv6zi6bNx7AQO8cSB0wLB8wNo3xo0rUIkwwHyk910J2gbdwNY/CwvrmUPSDIKKPcMpTk9y4Fh/c7+PFLOmr4v0lxDSnWTydFpJXw6FnMngpBrIustXPdEvLvERE/eaVecl+fLvZF0ygpJ1Al0aFXmqxwtwYUh0bpyzMkJCvSQQStBWo3LTD3jMID8FqgTpk3WGROsyTsuySMyXjxIzL2abG4B5Y6lumsRSz1ocRKi6ghOtxD0kA+BqiJS7DAogqwemo6fdPFQi64aAL1d064VR4IGegq2x+YrSoUe0wiqRdeZf5alm4dLIelLTtsgeCn/8+4zn4LxDILGxQZgOPoEfpR0PnNh8hfvPv1uWvw+ENVp3EG+j6NKZHNr6owT9ocEoib79UrWBT+hm0DKuDwYiFIWD2FXSXBJCmWR5rk2TXbf8YQDomFNz6f/C0ZgxefHvK1khJajC0GIEVzk9obWjIsd5P4iI3yTIQijNtkBHn7Xi6vaI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(39860400002)(376002)(396003)(346002)(451199018)(31696002)(8676002)(4326008)(66556008)(83380400001)(66946007)(54906003)(6916009)(316002)(41300700001)(66476007)(6512007)(53546011)(26005)(31686004)(6506007)(186003)(44832011)(8936002)(36756003)(86362001)(5660300002)(478600001)(2906002)(38100700002)(2616005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V09Yd25BK0JFZWViNkRDYld3amk1dXZFc3FSV24wM2U2bGROdTdnSCtuMGdI?=
 =?utf-8?B?SHlkNVowOElyaEIyZDZMVUFqNjBPSkdUcHByYkxNNlYzR2ZjY296UnZvcDNN?=
 =?utf-8?B?QlFDcGxGb3hMSG1sYVo1aGthakRVRHhsSWt6VEUva3JQL2E0d1M1ZlFXR0lk?=
 =?utf-8?B?M040NXVmL1pjVEZ5QUNUNGRlZlhFajVMcUduYmQ0WldtMVZ6dm1saVVIS2xB?=
 =?utf-8?B?RGF6dlgzM3Jra1pmMHpCYjRUaWhXTTR3QTB2dzlFMG9IQ0tVTzYvcFI1WXVK?=
 =?utf-8?B?TFJ4cWpLNTYzLzZTTmhXU2srbW9CQkk4czRJQVBqVUUySUZQa21IT3VPOFQr?=
 =?utf-8?B?K0x0U0dkRmpsU1VEWHhLZmRjU3VYQ3Jvc3FsNXJ6SERaa1ZRUFd3RzQ3c29I?=
 =?utf-8?B?UTAvTE9TWGhkaTVyNzhLak0zcVl1RENIdHBndDkrVDZheEgrOTdQdnd1TmdY?=
 =?utf-8?B?dVF2NnNlS2lmRE5nejJHTWVCTFgyTllLeHRodE1qcmhka3MrQ1NNdnlSVTgv?=
 =?utf-8?B?eExidkJ4azN0bTQ3TWxvbzdNVjNBMlpJdDV6NUtxU3FLT051UkpHMWh2WDJD?=
 =?utf-8?B?Vm5aQTFxWTJYaEUwd1d5b3Z2M1pIZ09na0FpWndvNUxEWitDSU9XRjRqdzJI?=
 =?utf-8?B?MzRuUk1Ud2w5T21pNkxMdVJBV3Z1UzJwVkpCSm9tbTBZUnBXOXVsa0pBWmh3?=
 =?utf-8?B?V0swVkRLdlRIdWtIQzVvZlhNQ0Y4UHc5K3dEUmxFMDdYRXFTaCt1RHlLbEZP?=
 =?utf-8?B?ZkJFTzFZS3A4bGRYc1hZTWc0WkJLSjV1dVJWclQ2aGlwei8rZUlaZU1mbkk0?=
 =?utf-8?B?OUxLN2dUTVNtRFN6TENMa0g4SUJvd1ppY05COFZHS0dvK0wxNk1xclpuZEZ5?=
 =?utf-8?B?SXZkMEN2YVNmaWZuUWZPaXZuUjNHSGoyZGMwQTdSc1JGTVdpVkg5dlpxOXVw?=
 =?utf-8?B?WWRYbFpmMS9ESy80RnVGUWZUU1NwbnphUEZhNDhEaWJGNDdVL1J1NkxRbjZ1?=
 =?utf-8?B?ZHFxclNSbUx4dC91UzBVSFppV053a0N1L3FjMHJka0E2c1hOYUoyMXVJOEJN?=
 =?utf-8?B?dWRQYklkR244M0FmRzd4eWhmWjd6VUp6N2lBWGZyWS9oZUpwS3YyS0VWNjJj?=
 =?utf-8?B?RklmMjNjcnZBQUFzRndGTmViRFRBYzRqaVltQ3ZTZTFDZUQ3azVieDh5NVpK?=
 =?utf-8?B?a2ZGbG5Ub21VTjFIRlNTaDFRZ1hwWnJoV3ZIZUxjOVZyWml4bEM1TjRUVkpD?=
 =?utf-8?B?V0pRNFVUVENRWk1HUGVJMHFSWmpXcnVjMGNWNi9uOGp5SElzV2V0eWsvdWph?=
 =?utf-8?B?UVFIVFlldnRzRUZ3NjBQUi96YkV5MU5DalNxZHJFdnFKYzF5RnhudWNzZldh?=
 =?utf-8?B?NVRWNDA5bmZuUDFDUjNHVzMvVWhOS1d2UmZHaEY1QmhFMzcvcEwzS2I4R25w?=
 =?utf-8?B?QnB3ZXNOc3h1MHRVbStqZXdycklxV0V5L1VUekZ2SkdKSjNMVHMxblJMMzZT?=
 =?utf-8?B?bTJDUVJMZDJJYm5xaXpUclg5TVN5OUdIZTlJSTJQdXNtSGFFK0xrbmtaOXl4?=
 =?utf-8?B?dklsSHFSQkJsdXBCa0xpb3hGT01UckNiOTNNcmhLZk1OM0lpZUVieGhPYXB2?=
 =?utf-8?B?L3BZT2tMbUQvTG9UdHhmVVd5VEx1cktzZGNGODhvZ2JKTy9qZis1a2FxT0dl?=
 =?utf-8?B?TVQ1bUJuc01FQXJjcmMwYXVTejEvb3NVZ1lza1dkaTc3OGhLTFZhbzZ1R1dJ?=
 =?utf-8?B?M0M2Vjc1cmhIMkhJL3Y5VFJzOGZjandveTU2Z094RGZqSnhidms4ZVIwbDBk?=
 =?utf-8?B?bm45eDFLOFpWL1hXMFNBaytmRldYeUYrNE54RURGMzNReHVsK3A3UzQ0cVEr?=
 =?utf-8?B?Q29hUll0TTNWSThLL0UvbzBaWi92TDUvd09tWHRVVHUzc0E4VGtnQTF3RkQz?=
 =?utf-8?B?Zno4QVhCdHEwZ3ZUeHFUcG5LQ3RoSndVK3R2dUYxZXlxZ2tzVFMvcnI2aHVx?=
 =?utf-8?B?RGdROFgybVVBSWFCNEJpK0tLZmJ2V2wwdytkZ1daVE9ydVVKeWJ2N1pNKzl5?=
 =?utf-8?B?S0EzOUVtd3p6ejBvRHhIUFlmZXJCbjF4alRqWlNpckE0dVkraUlwVFdFM3Fs?=
 =?utf-8?B?OTVQcFByS1JMdFVySUs3aldEQ29TQkRrRDVBU2xZM0hOZ3Iyd2l6MExRWnZ0?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	hk/DXZWElPC70y8ejIX+Bo+TamrpRwd2NYnpp64a5jk+0Kr2465GpC0QJ14ZnLl9xmbD+QCQaf8EEoxPDqJft7joGVUY3PupFjPPX5L9pCEPp3p/7sEPIpONB9BExtmPeLfb/kYNSsI4plPsCZB9CP1amkgse+MJdTlObFv7H8emIQkznQYqRddFHne0U9rp5s33B/wKWRoyG7KkPZq65+qW2c8fkTFexLGj6w3P+j2J0KHUqiYpAyzqFCiHpD5GBxRk9EysOIPq16piHpYlXEBXjb3QWbV9NuXw+2UZw4Q/3TV16IoiuUdjyYRZ+4Dc3weQCkjZt65xlbqEWC/1JyM1RveSbJGy1WCmm0MM3tNI2ZtdncqhfWjW+oU6grjGD3QH5K5ZjH7PELf+Bft8JOn09J6YRL29yiaeXuXlHxfp+QJEdMn9HLvWce77bZaKS7wSzJz9lRzH9ASYZKPg3/j61ArAnKuM1ogo788NwmyqT4+2af0mqxtoTlD4Kdd1sPQcECGJqmLhdDXS1mLxWen4a3+OhtlN8C2xfOnFRDjrLlsCRtyXwm6gJTJIQi4dzGzbTkykIIUIs5TndOZEAO8gxT4DZiooQ8DHFLniankVlasVbS+dQObeapCoWs1HbbtKMCrENkAWGjNqb8mSjG7ydz1QurftXth8XxVPPZB/F6TfJzv0ZFBaxwnCDZCO44+F2+nEsD5rDfPbrN5/Q0Mt1LTjg5J1YUtOKKfD0VvtlFUPsP+TnudjPHZ1g2p3LBNau4qG5+AnSLM3M/IfZUGq1raCc1JEJL5DS+c2fzhmK1fP6tNGbN9nWdCWtdxsP3fRVp4RKXV54J/0eKy3taojC1Ik6ykrla0PdGCej4r+3gMX+LSNb9OdF2BhA61j
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 547f1424-86e8-46e1-0a83-08db0ebaa6a9
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 18:38:22.8358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OCH09zrVNkZH2iX6MHBJVe5d70rIafCEfAbupADvKfgpIxJX18lPRiArhJQJIn/P+4dUmeIsIFzPaXTimP+0MWZZbwWK7mevMIgbrjFFG+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4779
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_13,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302140161
X-Proofpoint-GUID: fIZQ5WFnycEKNkMsxOwNIZWrRreMfI6s
X-Proofpoint-ORIG-GUID: fIZQ5WFnycEKNkMsxOwNIZWrRreMfI6s


On 2/14/23 2:48 AM, Jan Beulich wrote:
> On 13.02.2023 21:53, Boris Ostrovsky wrote:
>> On 2/13/23 11:41 AM, Jan Beulich wrote:
>>> On 13.02.2023 17:30, Xenia Ragiadakou wrote:
>>>> On 2/13/23 17:11, Jan Beulich wrote:
>>>>> On 13.02.2023 15:57, Xenia Ragiadakou wrote:
>>>>>> --- a/xen/arch/x86/cpu/Makefile
>>>>>> +++ b/xen/arch/x86/cpu/Makefile
>>>>>> @@ -10,4 +10,6 @@ obj-y += intel.o
>>>>>>     obj-y += intel_cacheinfo.o
>>>>>>     obj-y += mwait-idle.o
>>>>>>     obj-y += shanghai.o
>>>>>> -obj-y += vpmu.o vpmu_amd.o vpmu_intel.o
>>>>>> +obj-y += vpmu.o
>>>>>> +obj-$(CONFIG_AMD_SVM) += vpmu_amd.o
>>>>>> +obj-$(CONFIG_INTEL_VMX) += vpmu_intel.o
>>>>> This code was moved from hvm/ to cpu/ for the specific reason of also
>>>>> being used by PV guests. (Sadly the comments at the top weren't
>>>>> corrected at that time.)
>>>> Hmm, the init functions are prefixed with svm/vmx.
>>>> Does vpmu depend on svm/vmx support?
>>> There are interactions, but I don't think there's a dependency. You
>>> may want to ask Boris (whom I have now added to Cc).
>> MSR intercept bits need to be manipulated, which is SVM/VMX-specific.
> But that's "interaction", not "dependency" aiui: The intercept bits aren't
> relevant for PV guests, are they?


Correct, they are not. All accesses to intercept bits are under is_hvm_vcpu().


So vpmu does not depend on presence of vmx/svm support. (And init routines shouldn't be prefixed with those)


-boris



