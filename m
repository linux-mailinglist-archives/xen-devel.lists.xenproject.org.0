Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D769C444D1B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 02:50:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221196.382785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miRrw-000203-RJ; Thu, 04 Nov 2021 01:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221196.382785; Thu, 04 Nov 2021 01:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miRrw-0001xm-M9; Thu, 04 Nov 2021 01:48:44 +0000
Received: by outflank-mailman (input) for mailman id 221196;
 Thu, 04 Nov 2021 01:48:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xlTz=PX=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1miRrv-0001xg-95
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 01:48:43 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 541a263d-3d11-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 02:48:38 +0100 (CET)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A40aX2c001806; 
 Thu, 4 Nov 2021 01:48:36 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c3n8p5nap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 Nov 2021 01:48:35 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A41eL4E056728;
 Thu, 4 Nov 2021 01:48:34 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2171.outbound.protection.outlook.com [104.47.73.171])
 by userp3020.oracle.com with ESMTP id 3c1khwhwcs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 Nov 2021 01:48:34 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB4061.namprd10.prod.outlook.com (2603:10b6:208:182::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Thu, 4 Nov
 2021 01:48:32 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329%5]) with mapi id 15.20.4669.011; Thu, 4 Nov 2021
 01:48:32 +0000
Received: from [10.74.107.153] (138.3.200.25) by
 BY5PR04CA0006.namprd04.prod.outlook.com (2603:10b6:a03:1d0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17 via Frontend
 Transport; Thu, 4 Nov 2021 01:48:31 +0000
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
X-Inumbo-ID: 541a263d-3d11-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=NQdb3wpLkT+ZOd6PhVs5iJNG5n4zFSvhqoGFFDHbzKo=;
 b=YivDU0iN72437ci+gxyfn4sDqHEPGzgVvVLUMJdBgn9mek1YvrpcgWxUjxea5MHYCO6Q
 /EbGEsErf3opvth1qk0rHYZ0ffjdwvLhCanuAGwBEnJqurCEEzcRI7OaBa3Xkv/03uS9
 QVNfp1rdgKls1WteNNanWt5DqmCU2fEy+vo7WK4lRdVI7lkoD7JYEeZvHIQp41/qg7wF
 SrnBhnKsYOXHX1LavcgtnyBpbSK2mZ7m4n3IhBExnUEX+QZgjTqwVJjPCYbSVy1jUO+j
 hR3UiWjTBnr0ORLxxV66hhgoGKcxABGNEVCmgnj3SHKb/S+/mKo7sKsWMywD0RKVqZ4U 1g== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wl6MFbu4HgjJG+BMJMtkVSjnXXRLyW2aaIfWBcjPokGUsjDyUNgeOEIWodBJERXiajjnP5DNk47nrOWCdqYde7/Gu1K5L4lL08qnbPDUCDYPmeGxtRTwdjkFk6l/Dfw2Wpm9tA9aNN+Kr/i1Xw1PSKFiKVhzy41WkjiVPFuzzKGDsy3dGBvsNzdV+Ju27cBYGQRpf2N63aUQvVee3pTSYLCQlL8n3Gd3Drl1fJdeEXYsIS3i+ZR9nANZlJ6KF8jh7rK/iDg8d7b2/AY0GMKnSJ/JV8rJLRzG/t1pyZSKePWQsNRci5ThHBMwfDP46Vo3dfebmzRjRd9ujJ9qiahPKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQdb3wpLkT+ZOd6PhVs5iJNG5n4zFSvhqoGFFDHbzKo=;
 b=lKQjhQy4UvVllFA5m1EdEJebIRXp1R1AoCK3/wzKfOEyb6tZYHLJfsCV6blRprTkIj7v8DAKEKdtJQ9JfVR67MxK+iFPYlnl6q0dRJ7iCeo52Pu4abU6KreZw8yu+XUT4Thzi11A4upJhPrhyRBiZrT3kxthMAEYjqJxjZ4raNgQ4Zt3dj7j7WO9QLccf0OAbD+Psv2t1W+YHZ5O/iU7V3px7LC+cuVsFjLT7bDYx3yqlJencDAig3sw9WohJrB5lm2DYV2XCgtiEg6RdzVJ+52m0aZvi5G4xcQxPlMroJ4kefAS//t6WnrmX4vIrpdNGBCAXZWuhGbYy0XkWjI8ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQdb3wpLkT+ZOd6PhVs5iJNG5n4zFSvhqoGFFDHbzKo=;
 b=xlFkK6VrsG/hFQ07YXpXoveQHYrDVm4NvScHwptR7Bq09WDKbp96eoa3Ee4Br/1gvmAh9vXatLwO/ZjrX3vekFxncTSdIFWTBGeBd2AfHaZMf4Rw5DH/2ai5jOH77cUX341FOJTW12vrUnRsBUM0ELAbq8MIbm8QHxFQKMFaTLI=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=oracle.com;
Message-ID: <ad39f8e8-b377-dfef-b977-1afe4e6d2efb@oracle.com>
Date: Wed, 3 Nov 2021 21:48:27 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH v2] xen/balloon: rename alloc/free_xenballooned_pages
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>
References: <20211102092234.17852-1-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20211102092234.17852-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::16) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28a35a24-133f-4f62-0058-08d99f353515
X-MS-TrafficTypeDiagnostic: MN2PR10MB4061:
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB40610CEDB88B65C8187E9EA98A8D9@MN2PR10MB4061.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nY7lVVcwSQagOAxyLdxmZyp/v1hrbK+Q3bCWhbAKA3BhuMVAwhP92SSfa+hO4eQND+kl9zZqOLYax/X73VwzdaRS3u/5Gfq/bERZQRvzjykj2O0/A9wY4QX2jBzooAwik7UtkuTIxPWdb3m2M51lFe59ikKKgNgQVHjZsJEcM5qndmCydpR56vekbipxb3JuHv1MMSxRp21Pag2eSEpf1sKh0XRUcpqshpyH0QNOJKIk9yVkDDhKezFDSsLfXDhFz1ky4v8tK2Mf/UWCTDXaTD/nwj7Fnd9tCDrLRJCBBz0UdklF201jE9clDfXngLkBEanNwqfaanrpwUBcfumkz/nPT2l20klR1nux6rmT+18xPTjg4ZkhanVFuSwmdO0umRSQ/zpA+KG+e8GZyKyqqHDLUgwhZlMNLBLOJZ+Ht2Y+xF9B1IJARP5HZOKA8dbvEC7rKih8qM3POq1hT5uG6mijG+LwamyIbJeiwbnMJ30P64MnD9hOSQT9i3S4AhBVAnck4bgzrkMKgDEpLXbovK2Ja20+IXXCgNmTt4BT9kjIK2/9OiPBxqLbeQWvgia8pV9D/0got57upj4qD35z8r/nQsGXtxIBS9l+FRDyy3KUD9I3NS2s5D7NsGvdZLVKrkuYLM8W8vg+A58LGxx351khrT7hZF5CBIOvzLIfnDCxNoYRsvsN/TwLH8oZsgkEQSnT6S1ehoomscfQbYhUlllgGVshnezzB8nCg06RkDel94HzF70lDEIjm/R6I+8b
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6666004)(6486002)(66946007)(316002)(38100700002)(8676002)(5660300002)(86362001)(53546011)(16576012)(186003)(508600001)(4744005)(2906002)(2616005)(31696002)(956004)(26005)(66476007)(31686004)(66556008)(44832011)(4326008)(8936002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cnNwNkVOUmZGNjhkWmZGd0hEaVYxMHhFNnIxdjZhbUJEdFlwN1VvTHdLSENL?=
 =?utf-8?B?Yld4NnJDS2o5Rnk0YXlEdDl0WXdXME1HaDU4VzhBK1Frek80dEZHem9kLzNV?=
 =?utf-8?B?bEZvT3FFSXhIdmcxUDFjQUtVWHA3anBOVDJFUStPaHQzQVJrTlU5MitaS28z?=
 =?utf-8?B?bHlaYmkwWDZsSjM0eUFXSUFSRmpKbndqMnRyQ0JCR1NXaEIvRTJwVTFwSTBW?=
 =?utf-8?B?Qm5Mcm5QSDcvc2ZFakkyQ2R2eTVacFBKbFMxM0crWHNBVi9ZWEZUT2N6Y0Qz?=
 =?utf-8?B?UTZOUTBPYjNsUUVTa05xSzI4dHgva1hHOVYvOUNFa1QzQmovdGlzc2FzdXN4?=
 =?utf-8?B?UlBwajVUZmRuaGxvMnpaS0ttSmwxT0xmNEpLODlRQ05MN050M3JRZTBkZGJO?=
 =?utf-8?B?U1RxaGdXWkt2V2xSS0syaW0vMWRJQ1FJb1JRNTQrUkhuRzd5d3R0b3dnQXRz?=
 =?utf-8?B?bDdXZW5WK21JL3VYOHBGVVlqTm42bkFoUWpxOWZtRmlSTFg2c2hYb0g4WjZZ?=
 =?utf-8?B?NC9yZ281bDk3SXVzV1FsWVl2eXVtamdvMjBheXl2aWdkZWFjRml5NFp5V1cv?=
 =?utf-8?B?SWJQT0UrYjFBMUNURUpMbnlEcThEUlJLRm5HMUU4U1M0MFJaUzltMkV6STha?=
 =?utf-8?B?dmM1Y1didmdpUVR5MXMyQnZKV0FXSFFvVmx1QXhLcjBmTkJtTURmTEc4ejR1?=
 =?utf-8?B?K1RNY294MW5oZmRDNDJITzYzOWFoS3Fob0F2MkVkTTVrNUJmSXZKaTN2UnIz?=
 =?utf-8?B?eUVKY25uN3pieURKeC9HaE5uUXpvdVVCSk9lQkhTUEQ2K0xvbmtSMDVnWENL?=
 =?utf-8?B?UUxoWEVmaVFhclVGOTJXWDlNOXg5OVIxSC94Mmh6TDNHZ2t6eFhqSnF6Szhu?=
 =?utf-8?B?OFExRS9ZV0RiT2ZlY0Y5V2NoY0UxNkplU0ZiWkJqanJkM0V6RDRFZ2ZLTmtZ?=
 =?utf-8?B?d01jVDlvVExoKzlhTk1kdS9tR0ZyTFhiczBwTTB4WDFKaEZpTG5hcCtvTnhv?=
 =?utf-8?B?YlpiTGpoeko2R2dUUmJQZnBlYi9XOEJsT2tHNm8zdVp3T2x2SThvL2pPbEFo?=
 =?utf-8?B?NnB1ZDhiRWNkbWxhUGdRQWhoVlBZL05ZQ3ozZ0d0bHl6T1FKeVB6dHFTU0Vu?=
 =?utf-8?B?NzhYNEtrMXM0R2VDTTJoREdZTmhDazl3TmtZMTZMWWRVK1ltODNxQVUvcjZL?=
 =?utf-8?B?K3dkVmYyTHMzYnA4NXNvdXhiQTQ2SFA5WWYxc3pqSnRONmtJbjk2cGNSYWp2?=
 =?utf-8?B?UzI0WTlSYWVPSHRXc1ordXpUT0dYQU5BVGFrNnVzSjZIK0VEV01ENVY5T3hW?=
 =?utf-8?B?aDk1UGgzVStnWEZuZ1ViaEczR1g1UGd2NGdlUDhLRzQySkM2RW1DNFJTZHVN?=
 =?utf-8?B?bGlacFFNWjRvQVVQN3BxQ29JTWQybkZoQ0syRys3VVR6WjUwSzlPbSs1NGxO?=
 =?utf-8?B?QTRnOXBQNExIL2RrMXRWSmVGeFBjOUFKRmhNUk5LcndURkp1UXZjNld3d2Ry?=
 =?utf-8?B?T1RzVGxWK2Q5YUFaeEtFbDkyUzM0VWxtUGIwVjlKZElnZTZKbFF3R3k0eklB?=
 =?utf-8?B?bkYrS2ovRDFCeVZobG9LWGJUVW81T3RZS2xPWGFHeHRmS2NONHo5MlFyQllL?=
 =?utf-8?B?NktlbXMvUVNxQjV3M2pra3JQSlN2aGwweFNMZDRQSHVHMmlEOW9CYkJWK1BZ?=
 =?utf-8?B?ZDRqQitEVHFNNHRZR21iSTMyNFRrVEhLeisvSGJxVHprUzVCdDEwY0p3VzRi?=
 =?utf-8?B?NnNhWW1SOWo2WVNObk9rYnk5akp0aS9CcnFicjJjMFh2ZDVIUHlubnptWlFD?=
 =?utf-8?B?RElxWWxBQ1I2R3pPSzN5VUJ5Z3pEcVNCeUg3OERZRHNaZFE1TUx5R294MUNP?=
 =?utf-8?B?dkQ3UWI4a1dLSkVPaUs2aytPRE9uYzZEZDM3QXRFa1R3bVR1bUJkUDJ0Nkw4?=
 =?utf-8?B?cXArMUlLcUFIL2R1SHpIajlIMW5QM0VMbVBrMUpDSmdGRzMrLzFNbmJBVVVI?=
 =?utf-8?B?bEIvQmE3VjFTam0wSTNvOVpCNEFYMTYxV1NhT2R5d2t5R01GME9ROWRQS0wr?=
 =?utf-8?B?TTNzcXpmbWRjUXRNU1llR2ljeVVxVWwvV01LUm9ETXh0MFJLL3I3TmE0dkJS?=
 =?utf-8?B?c3BJandSMlJZcnQxcnAzVEE5N0JuKzJrYVQ3ekg4QlFxRWJtQ0tNWlRKdDhP?=
 =?utf-8?B?aGMxeEhFWC9DMG56aERwb2N4cWlDdGR0WWRKbUJ5TE0rUTloNy9RazI2RGRy?=
 =?utf-8?Q?5xXHwVGGmbL2+OFk/wOWza7ftyWhAn+2bV/eNViFz4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a35a24-133f-4f62-0058-08d99f353515
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 01:48:32.4776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWqA+ola3/7Q+Xd9AiE+6xiQ/Yiay2cgn3kmiR2TIWnsuLLBJ+bRZLlVakvQNoKtipN7sDkRA3+txi9JWzcZPR+jKsrJt61F0nnSGPJfCsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4061
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10157 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111040006
X-Proofpoint-ORIG-GUID: 9RDw6VqlBx2VvRa3rthxBVCrolH9atBA
X-Proofpoint-GUID: 9RDw6VqlBx2VvRa3rthxBVCrolH9atBA


On 11/2/21 5:22 AM, Juergen Gross wrote:
> alloc_xenballooned_pages() and free_xenballooned_pages() are used as
> direct replacements of xen_alloc_unpopulated_pages() and
> xen_free_unpopulated_pages() in case CONFIG_XEN_UNPOPULATED_ALLOC isn't
> defined.
>
> Guard both functions with !CONFIG_XEN_UNPOPULATED_ALLOC and rename them
> to the xen_*() variants they are replacing. This allows to remove some
> ifdeffery from the xen.h header file. Adapt the prototype of the
> functions to match.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


