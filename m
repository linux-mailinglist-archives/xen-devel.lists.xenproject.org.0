Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E61391F36
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 20:35:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132681.247404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llyN8-0005Qs-R8; Wed, 26 May 2021 18:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132681.247404; Wed, 26 May 2021 18:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llyN8-0005OH-MU; Wed, 26 May 2021 18:35:14 +0000
Received: by outflank-mailman (input) for mailman id 132681;
 Wed, 26 May 2021 18:35:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhT1=KV=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1llyN6-0005OB-L5
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 18:35:12 +0000
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7494e9a-6c50-4942-bb81-f630442d4a24;
 Wed, 26 May 2021 18:35:11 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14QIDVud009775;
 Wed, 26 May 2021 18:35:01 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 38ptkpa0ef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 May 2021 18:35:01 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14QIV2jo133988;
 Wed, 26 May 2021 18:35:00 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2042.outbound.protection.outlook.com [104.47.51.42])
 by aserp3020.oracle.com with ESMTP id 38rehdvqut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 May 2021 18:35:00 +0000
Received: from CH0PR10MB5020.namprd10.prod.outlook.com (2603:10b6:610:c0::22)
 by CH0PR10MB5147.namprd10.prod.outlook.com (2603:10b6:610:c2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Wed, 26 May
 2021 18:34:58 +0000
Received: from CH0PR10MB5020.namprd10.prod.outlook.com
 ([fe80::6cb6:faf9:b596:3b9a]) by CH0PR10MB5020.namprd10.prod.outlook.com
 ([fe80::6cb6:faf9:b596:3b9a%7]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 18:34:58 +0000
Received: from [10.74.102.235] (138.3.201.43) by
 BL0PR03CA0010.namprd03.prod.outlook.com (2603:10b6:208:2d::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Wed, 26 May 2021 18:34:57 +0000
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
X-Inumbo-ID: c7494e9a-6c50-4942-bb81-f630442d4a24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=QairHb/9rF4TAODfQZwal4qGpowzag+oYTLrPS0g8Bs=;
 b=nxjRzMMu0c3In5BnWCkBzGymodhjtFuHWlMI5N+H5Zyio62Ilbgfhy1JDpvnOstAHJ6Z
 ho7kz2dWIyQT5vThf+aV5BbjiZEIEpUxE+2E9DmSs5XCRwYlUEAi1FQRLuysuv6BlrcM
 3dXTxN6wGUE4ZOIE7P/JJpH4h5nX5DhP3qnmRObe9OB7WZQnaF3YZiLQnB8CmweazjHv
 FpvSJGJcR0eQdB3G3KucSTBKNgYbCN24fE4VLxw0AOjGMYNjO+GRoEg2nj1HEpQIBTta
 M7Z0er9Bq+skPTEfMT5NHF8NLZG457SxjHBmARIvEihYEQ1GiodSQgPOUufhrOu4IOHq fw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FsLKvJXlwFrzRMkeVo0dTyGwDKf/Ta4iX+GJa4Hs7nKNAjs9ZG6z4qnuFYJWDpA5T+pq212aC1mbKt26DtqnncVta2GeHGo0eJnAn0eNiu1dlO2w7Q//zAwbM6m+FCUPQTi4eaDKGIQsXkh79VvUAkbiTkBF5XIRZOOLAuNheSxs8a8IbyX3IdDkk0tOOXvXPO7b1qTZQOElmD2qoUyLLOoHOzIhsPCSkmyqf1WHGFgDO09TKHeeqEqqfsbrsxgdt/tRm8OYBPadZrw3MmSYou2OeEl8dkD0+A9Vhx4Gw+O0zr15uPXX0Ll0oLqb+EJKUivKGR3txsfPtVbqIox/Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QairHb/9rF4TAODfQZwal4qGpowzag+oYTLrPS0g8Bs=;
 b=k3kRkVErn/1rWwBb5WuNRsFP4SS7WzI8IebuO9IO+5XUpbOOnsl8U18Iqi+E6qr2Fic4UpPul49cjPqLIIUHrkvYyp2ajI2szwAzgqw4anE/4WNYfHlb0sWsNhoOx+whR/X7N2NsPT6/PLTkB2WjdiTRdK4Hk6VARs+CWP9m23KPAk/60xJJILhJp77fUpexqYR/Cq1axm106r0f6Hns6QMpA+BfBWqTRddBy8cIHU46QJiktauRyoxj95A5+laJ1TTgmLpG8r/CpNJtUg7Z1XLzV0nxwQAWER3aIcHnlcppvJjFW+BP8Vj1ROF9nEVU14m61Kl4zzOHNU7nHa/YSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QairHb/9rF4TAODfQZwal4qGpowzag+oYTLrPS0g8Bs=;
 b=D7wn4BbmTWonBLAnQWjc3fIGl5ZWEqVv9XehKGHLlC6ilNTY8hTS6e112s3J94x78d0ATQviFflP7riAifK8vphG/hZHLAvVae+7ywz21QmfB0MD3g3sDVmqF+oOZ+QueX1/p6qiySJkihuNKhXCPrVuxHfP0EobSECZdxktB10=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH -next] xen: Use DEVICE_ATTR_*() macro
To: YueHaibing <yuehaibing@huawei.com>, jgross@suse.com,
        sstabellini@kernel.org
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20210526141019.13752-1-yuehaibing@huawei.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <4ad216c5-516d-48c6-5653-2f28e4e85b5c@oracle.com>
Date: Wed, 26 May 2021 14:34:55 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
In-Reply-To: <20210526141019.13752-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.201.43]
X-ClientProxiedBy: BL0PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:208:2d::23) To CH0PR10MB5020.namprd10.prod.outlook.com
 (2603:10b6:610:c0::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a175909-7710-419e-81c9-08d92074f738
X-MS-TrafficTypeDiagnostic: CH0PR10MB5147:
X-Microsoft-Antispam-PRVS: 
	<CH0PR10MB5147D8568281268A822A99EF8A249@CH0PR10MB5147.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iHoluXVsI78OyZSlQIvP8KG8+n+e4bW/FD1gkKF6i36Vj+KmsAQ9yOLwkoWDe4DYJDKEpNf2J5VHNszZyFjsV6J0a3sBVxipgBvZNUl/Wn8Kl7GqaR+i2u8+a/xGm8PZg6pfxDueWJsbHmGSPHOskrvSkBFgVuVjDRElH9FsFXYoMOjPmNL/JBXu6Dr9oLkfpGhIsplUAjo6+9tpgj+PV+9ekoPBaCk9WYRaLr+UL33zf/GtBrEcOddxPOAdsIMEPRVzGUvLgnsdpOMrXDF6J77biXoh2sPaxqxVgS8pOpjrZVmqTIXIB4Gubi+Xv+iaYkGWKzfCcuxDfdnbSLFRjrXoe/u62pdO5+6eYpJMSDOi8eMY4g0puAD7BCxEZx2Q3+mYldiXoJPQc/9TEv21DGwOaMmnWlyVQb06G841ZsKcw5TpU1uGbkRhzRoPsy8J7meloAEGHOw3Vbh9mvunQ44+7uvUCbA/w95eSDkuVZ3RVeLdwDe2GyCAGCZm+zBlYxFkvoXU4q1nViAJ3u5JPgVclVZi7Ud54Y5qB/7DKSGhPlydDSEVjcONbwC1m/dqvGu8dlC59HLiCbfTXOkS8pgS0/+hSlDvXkFLfy6YQwwTEcq+810ylGtwHytjxLfhscJwHNMqhWNuXriOok7dh9S13wPDBjUCIbBUkguroifHtxNq4ueRNG2p5H4qF+gH
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5020.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(376002)(39860400002)(136003)(346002)(478600001)(6486002)(38100700002)(8936002)(31686004)(4326008)(956004)(16576012)(186003)(2616005)(5660300002)(44832011)(31696002)(16526019)(316002)(86362001)(8676002)(2906002)(66476007)(66556008)(558084003)(66946007)(26005)(53546011)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Ui92NlVEV1Y4MGVKVzRieEM0d3A3SVA2Tk5lbkRDR05KalhDK2MyK3RjWmxX?=
 =?utf-8?B?Z0lZZGhDam5CUndESHlxL3JBRGVXVDVIN253cE01VU5zeVFrWTg5YVp5cUNV?=
 =?utf-8?B?dGV4YnV6TkRCa21DNFFycWhEU1Jxb0cxQ09kTnJ3dngwdlRTbElvclQ2d1NW?=
 =?utf-8?B?czI4VlViMG53WGhtcmtHeTZ1aWJkc0ZscDg3ZDlnNnVPOHRNN2ZIbVlSTUcw?=
 =?utf-8?B?S1gzaXEwSG5jQ2E3ejA3djNiU2tWa2ZCbS9LU3llT2tCUFh3Zml6R1BFRFo0?=
 =?utf-8?B?Qm1yd3RwajRCMUNqM3lGd3hxY2ZJeHJVdnpZR3NBNlRTT2g3ZDFsMjExbjFX?=
 =?utf-8?B?NWdhZUlCR1RiVTlVWml1aEtNMmJVRUEvRTJQMmEzelBVYXZiRzBUdUlkZnA0?=
 =?utf-8?B?WFdhVW9XQ1Q5L0UzYXBCQnpGMUg5TnJtNE52REhmaHM0SG9sWTIvTVhMREps?=
 =?utf-8?B?TVdEMjlycVBRdWo4WURpcGpwVEFKeTJBbTA0QkFVbWtkVnpJTGxmcTJXeG5q?=
 =?utf-8?B?RDcwSDZOby96WVd5UEFLUEs0Y1J2OFJEZk1XVVRjNjUxeGVnUWNiNElsMkVj?=
 =?utf-8?B?RVZiL0dERzRTMDJ0Y2hHRWJTN0F0M3doNGNmZ3hpeVNSSDluWHJSTjJxWXBR?=
 =?utf-8?B?RjRIOENzbHk2QVI3UVdaUUljYTJpREdLN215V3gwR0pZM0ZzRmcrb20yYTNM?=
 =?utf-8?B?ZStoM2NZYjhDTXR1RDl1eWJhL2t2ekNCWXBhOGdBcXl4ZklaY1BOK2VObm4y?=
 =?utf-8?B?TXM1UUpSTytjcEF3RlhPWTNGN2pRNlVlZkJOSFFzU1JILzRiNlNQd3d4WTF2?=
 =?utf-8?B?bDBSNFUxY0hRcmRSOHZ3YjR2bzU3YlNOLzg0N2kvcDZYMXQ3L2pyNWVlamNi?=
 =?utf-8?B?MGdrM2taTHBjUnB4T0lYaG5Db2JRMGI0QjhyR3RFcm9NVXBZYzBINzZiSW00?=
 =?utf-8?B?Q0N0K0tlT0kwWndhZGZyc2VpaHluRnE1WDVzSk92WnNBOVRmMExqZUVlTDBy?=
 =?utf-8?B?eGJQdWRRRkw3eUZvaTdCUWVwZHBnS1NLTjJQYUF6aFp5N0REWXlLSHNPc0lr?=
 =?utf-8?B?MlNVRHpVVGJYWHpIUG8zSTNsRCttNnBXQnZYdEsvQW9veituRTFxdXc1N1JJ?=
 =?utf-8?B?K0FyQjRjb2R0OFJSeGN0WllCOVBiVW5XYkh1V3Y4VzVkY1FLandVN1B5VkVZ?=
 =?utf-8?B?Ullmd1Q3SStGaHlSZndwQmVLek5SWGlsb2VWRDRleG11b2FaYis2aFlUQk5Y?=
 =?utf-8?B?ZkFaZUh4akpqZngyd0VKN1hPR2NPcVp3ZnJGRC9kRE53SHpXWTFDdHNTVjVF?=
 =?utf-8?B?Q004NG1SZ3pBdGtUMExxekhmQWVqdmNjL2RaZHl3UFlxRXZ0eTJsdW1rcTZU?=
 =?utf-8?B?bVd4Y1RITTlCSE9vUzNhMzllaHNWeG5pL0JaTFRkblh6SHFHQzFESmpTVU1p?=
 =?utf-8?B?UWdka2xsa2N5N2ZFcDlxU2ljalM1WTZGV2xzdWI2b2M3bFJvbVkvd2hLd1Ex?=
 =?utf-8?B?eCs3QkpSc3RGZjVaMkRSOTI0S0NUT1YwTUtqTmhvMWZHcUxSaDJLeXB0eTZr?=
 =?utf-8?B?dUdPSlE5UUd3LzlNNmFyb3JNbERkSTVNbVE5c3JLTzNlZmkwMTAvOGo0MDd6?=
 =?utf-8?B?NWVCRlF6WU1ubldzMUJNd05Fb0daaVkyK0JWZWNpamV3WUNJV1dsWEZKcG96?=
 =?utf-8?B?TXJycEZyTlIyUVJEMGF1cWNxb0lXOVk1eE00QXQyQUhiRjhVUm9xdlZYdC8w?=
 =?utf-8?Q?/DCvGB3bL0m+dyl92iGLBou2nxMjqk1f1kdCVVm?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a175909-7710-419e-81c9-08d92074f738
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5020.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 18:34:58.6871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fmRKSM5HQZMLOT5hYV29V73PgDF14snxtO3lnL3T2K1vYzeM3DOq6Si4WnD2CiZ8V+rVd7TH8Bc6Ut4r4Si7ZstkN6N0iaP20Ecy982MM2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5147
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9996 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105260125
X-Proofpoint-GUID: PXTojEHe3qxMV25vs4whMcfkxlq6gtfC
X-Proofpoint-ORIG-GUID: PXTojEHe3qxMV25vs4whMcfkxlq6gtfC
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9996 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105260124


On 5/26/21 10:10 AM, YueHaibing wrote:
> Use DEVICE_ATTR_*() helper instead of plain DEVICE_ATTR(),
> which makes the code a bit shorter and easier to read.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>




