Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D352695263
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 21:55:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494826.764986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRfq4-0004Ys-OO; Mon, 13 Feb 2023 20:54:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494826.764986; Mon, 13 Feb 2023 20:54:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRfq4-0004WR-LJ; Mon, 13 Feb 2023 20:54:16 +0000
Received: by outflank-mailman (input) for mailman id 494826;
 Mon, 13 Feb 2023 20:54:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DskX=6J=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1pRfq2-0004WJ-Kn
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 20:54:14 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9164514e-abe0-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 21:54:13 +0100 (CET)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DI5dLd020240; Mon, 13 Feb 2023 20:54:10 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np1xb3vu4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 20:54:09 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31DKKw27027254; Mon, 13 Feb 2023 20:54:06 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3np1f54q4t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 20:54:06 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by DS7PR10MB5264.namprd10.prod.outlook.com (2603:10b6:5:3a7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.10; Mon, 13 Feb
 2023 20:54:04 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::6800:e85a:3f21:6606]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::6800:e85a:3f21:6606%2]) with mapi id 15.20.6111.010; Mon, 13 Feb 2023
 20:54:04 +0000
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
X-Inumbo-ID: 9164514e-abe0-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=BqJz0I24jDVfN1J6TZQ1XSSUoF7YPuhKIBXQeXASTpM=;
 b=wZ88ITcNRUImrHXFxKKG6BoFddW51A5MQZOHt1do+6Umby7y6/g3I5gD7PLdpKnLReeB
 xAWr1UjhCOVFSDbUsmZ6aqXZ42qKtafjkYVD27RX6yLcfMi+/u1eo74VqJYIdzwhjjB4
 zwtdo3CNqEccIUvTZFiBdlqQp3HJFXN9UnHiMGmrNn3q8MQpT75cJ78sOaYfnCQeLCph
 qXb3dAMzqDMophqwFAPTPE9aepJ7zE1vDdjYFSHkGlEi6nJXvjbRcxdj8bm2NNR8av0F
 WllV3NpEl8lbBDlbfWwyG2d3aUJavulMw6ND/lwIheiHZrvbPbJueGhIJZ2MPONV4ZVM hg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtJM6udrtkMc1UWOytx6wNyeNEsQs2P3saI3821UOHUwfxyTBkM2dzp8M1ka/OxUbxv2Quwtbqi8vSn1nG11MnfUJnWI2hAn/FmIj4M5+Qj1HvRJNWtiu76+YxyZCfn1z4LLydIsPk0uGaQbdPVuZiW1bQEuGUqiWyeDLjWoj0QytfKMMiAteCV4DplKf1xkjYZyDJPmdjPBVARtlCyGXK9/inW49SAJSxFNspzG3Dk5zfrDK5pCynxBIBdhFq8anC2JBAuaoWkTR0GfgJkQPABTdVtcNdOi44EGG3v1JjDSm6LULU61ePPpgObLw1LZl487AvL6NkCW5oqrr7Ezbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqJz0I24jDVfN1J6TZQ1XSSUoF7YPuhKIBXQeXASTpM=;
 b=T4wBLMEhHojYswABesDZ9OJv340brlsKefFJbVCSlDtRMrzi2bEI2kdemT/3HyVtWGhJ3WCatMQVqlU194gBIo36Mq4veX8j8Lr3kghxMg2e/Gwbm0iCBc5boUeIeKpBki42eFdwyiiyT0EHW8n9Ux0y1CnKaJutHMgU7GLLP7QZgQddnHW9H9gFK38jz2vOM8ZewNEk3fleki9Anzja1Rod5AKE2QbBCGvdmU4bun0waJxvqjX/XPTmhEfl0CBjNKsZYKwb/aDoxZq8b5qBevYb+sw90Q4zuHWzEa9ueATD+gDyQ7IAagii3frRltQYsjpJbOWuJuJNFldZFbC2yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqJz0I24jDVfN1J6TZQ1XSSUoF7YPuhKIBXQeXASTpM=;
 b=a64PBhaXRIg7tL1pOSPyuB6k7mDNb6KjpD9BCDE6uz+BEd9YZY/otCMEF8z+R5tvqIV2/bpvluvej9g4PNJmVrr/4QDRzqd9YbtQ+azs8O9+p323v9pepY5c17j9Jtkc1L+eti38Tq24Eg+Et/w3FLa011RuP+4jmFn7Mf2yPaE=
Message-ID: <5892e7d6-bd08-0f2f-4dcb-fa5b9123a2eb@oracle.com>
Date: Mon, 13 Feb 2023 15:53:58 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC 01/10] x86: introduce AMD-V and Intel VT-x Kconfig options
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
        Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
        Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20230213145751.1047236-1-burzalodowa@gmail.com>
 <20230213145751.1047236-2-burzalodowa@gmail.com>
 <e29e375f-3d30-0eb1-7e28-b93f2d831b43@suse.com>
 <5c3eb593-b63f-303f-dcd8-f5c319152635@gmail.com>
 <3cdfde6f-5af6-4044-f786-259c70e0ba69@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <3cdfde6f-5af6-4044-f786-259c70e0ba69@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0035.namprd04.prod.outlook.com
 (2603:10b6:a03:40::48) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5009:EE_|DS7PR10MB5264:EE_
X-MS-Office365-Filtering-Correlation-Id: 16247173-458a-4de2-c493-08db0e0470d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mqTq7RvA/0YOM5odJ3SDU62koW+0Mop8VeH6H3J9wm5Q4DiFxbFeT6D+rmJVTbIO735Hzopi2cO3pwR0SOrdV3NJ1SZa1R7/YVZrVC0wzL3IVVTrhcGt+AMEMsFjI+Zmu/HKMz59hvBwub4jhJvCNo1jRAtQSP0iJQoTgD5//URTov85l+JHEdrUq2EWY+q6PvSDaE+vgeWU+3PxGAt9agNtiRUmfOM1FHi0ll5iyqsJzcDNcNtypdm2L/Ax1w/Z71aacJIkUJULphLMvw9jBezqYnDbj/PV4iafzK+3A3JO/a8sAjGzdjq8YK7PIbPX41JLHAZwUE6TrBYI1hWtjANjsfHkbiAeGFTizFOPIl4xFC0yulZmY7SIq3UKa7LFQIy/hZiMXZjrR+yBkdtHAJAsY6bsfJ0J3rORWdJy2egDVr40RD2DtPddIbcYf0XAW9UEW5cgvqv8B1WLBemrzPHAB8EHfHOOoEW7x8NnqA1Pet327/wh76lujOcpMKXl7nwfUXTpArbyjsQY4keBC7rwTPwlTavm5aK7XvLrFgZ3a2VXgql12bkds9AX982FfKMFmc0RZB5x95EIvawpC6Xc6wtRYl2/kO/7flhANZO0LqcoAEXK4K28tYcJk2Ov2CBsfT6n+ShZPok2i5v/02rtz1MT1pyX00npSto8CZ5qQ+jH0Pery3VHwlpr37CBuoHjHtD/tlSYHlCFuVdOk+LJttj2JZSTi1xPPLLsSZQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199018)(478600001)(53546011)(8676002)(8936002)(44832011)(2906002)(66946007)(66556008)(66476007)(38100700002)(4326008)(4744005)(31686004)(54906003)(6486002)(316002)(41300700001)(26005)(110136005)(86362001)(6512007)(5660300002)(186003)(31696002)(6506007)(6666004)(36756003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cnl3VUFSbWJmd1RCOWNIQ2Q4aGtKT0ZHaGw0SnczajVEQTBlaUZ1Y0ViVlhY?=
 =?utf-8?B?YW1WNnlLSUQ0dDRLVkszY1p5UHY5M1huRE85NjJIRk9UQnpMZHRRUHcrYzhk?=
 =?utf-8?B?Z2hJNWZBa2FEVzRRQm0vN2p2YzUwSjVUWk01Y3hlRHRWUXJLNndUd1h5ZzU0?=
 =?utf-8?B?M2hGbGVzMUY0cGF5cDQ2Vy9peGpoeFhqZGtOOW4rT3A1SVF4ODJrKzc5WWV5?=
 =?utf-8?B?a1hON3Z5bEl6Uk5TeXBnVlBZbDIyMjFaNkxrVzdXcWlsTmtZcG5kZTk0eDE4?=
 =?utf-8?B?a0t4M3pJVVFmZmw5ajNIV3lqb3NmZDRmSGUrZDQ5WW1sTmNnbmxPM0gvMC9h?=
 =?utf-8?B?UndXRGxwd2VyeWxYUWg0elo0WENZeUVGeHowL2xNY29DNUlEQ0MrQWx1Q2JM?=
 =?utf-8?B?WUMzd3M1OGpJc2NrWG10dzJqU1hFaVg5SUxZSFFrc2Y4TG5zS1VpaG42Uk91?=
 =?utf-8?B?KzdMdUZTWStHa0QzZ0lvVDFKSWViWnFSeTg4T1RFeE9ybnNuQjVKRnF6alRK?=
 =?utf-8?B?TlhEY1JkSWU0T1JmYzlwMTlnRStGUkUyekxORXowbVZTaGVMNVdtOEV4bk5I?=
 =?utf-8?B?cFh6ZW9sUllMSFl5WmUzYlBENGJOTnpHWkNBQ0lQdlRMU0d4aUwyM2ZkR0Js?=
 =?utf-8?B?R2o4RUxoMDF0VkpwL2g1R2pETkFzTGdJUXBvOTJUdGUyRXhQeHFtN1hIaU9m?=
 =?utf-8?B?TmsvUTNsT096Sk9OeWNMY0J4VGtjZlFRUnhnelROVEMyZHN0V2dSaVJVMUJL?=
 =?utf-8?B?V25CRFpVZEhUM1cyMkkyQmc0blZIeldrd0Y4VVZ4VzBHUkRwWHVhZGk1dy9k?=
 =?utf-8?B?SlNtQVgxTzAzNGJUZmdhUnRtOXBpQjk4cXBid2U0SFcyR0t2N3djR3NGaUdM?=
 =?utf-8?B?ZHNkdWc5NkpvU0xJbXpYUk1iMEEwT3lhbUtBSGovcFUwNU5mR01oZk1wRDBC?=
 =?utf-8?B?ZHlveVNmd0ZuTDUxY0p6RHRYSG5EWlByYWxwQWw2NkJzdENtTGQ3ak01d2FP?=
 =?utf-8?B?YVBnR2hTeWU5UWQzMk5VZ3lYT1N6dFFQRG9KY1BsZ2dCR0c3aG1nZEZWb0NG?=
 =?utf-8?B?KzlrdEFvczRDOFY2dUxPZVF2OEhPTW5mbDdSUGdRZXBuck5iN240Vy9YaTJx?=
 =?utf-8?B?UlRIeFhOcWM3UWxaNTlicmVTdllkQWpCTG5HdkZ4Tkt0WjYyNVlCRkZ0MkNa?=
 =?utf-8?B?M0Q5RHBDWGF4L3Q2YVhxeHdUOEpTTnFxRnZ1TE9NSExMcGZsWUtUV0gxbGd3?=
 =?utf-8?B?TEcwVVlpaEZUYjRvbnJ2aWhCRmpvSVhaZFhRV3F6ZGdPNU9ZUTE2NFk1WEhT?=
 =?utf-8?B?cmsrZEVPOGJvUVRSd1BTakppS2VDU3pvSndtZzhMWkdOc1pKSnBHYThuRmpn?=
 =?utf-8?B?REdlTTFqc3FTeDBsS25VOUl0OWMwNXowNHhCdll1TFVQRGV1eDFLZXFHSkZJ?=
 =?utf-8?B?QWhIRS9IUmd0YkprSC9Gdk9qa1VCSzRBR1c0Y0h1aXova1hJeUVUeUNYQ2FG?=
 =?utf-8?B?Q3JZT1BGUks5SnVrYXNxUWZRNFdFVm1ibXNDa2p0Mmo0MzNPWXhxV0o0QTMx?=
 =?utf-8?B?UUZlbE9TdnJtVnQvR0MyVXlPS1VSOGVBTDFvL3VKaEJ5REdBcmRFbmhGcXJH?=
 =?utf-8?B?L0Iwb3E4SVp2TnRjeTM0SmxpaGFzdzdXNUxJcTdkY2JXV09iOFpRckY1ZitQ?=
 =?utf-8?B?TFBLQVFzdXJ6NWtHaU1iWjcrRFdRd1BtV3puTW1sMnRDZjNYVkoyQk1PSXNF?=
 =?utf-8?B?UCttYnhzR0lqSVhMNTVwR3dQR243QU9nQmxybHFGQ1EzbEJad2RKcHBNUlRV?=
 =?utf-8?B?S1Zuak9ZaEJYRFJlQ1dobWJ0YWF2eTFnTDVrOXRmR0dUbE5BTjdXNzV0M1BZ?=
 =?utf-8?B?RjQ1c3FjTzFqSStWQnVqUjFCSkZEMlJYb2NZbGREaXRtK2VTcXcxVzR5SG9I?=
 =?utf-8?B?MkUxWWtjYjNBZXdoK3FWelM0bGVYOEtCMERwanNpY1d4ZThpdmV2WitQcEV1?=
 =?utf-8?B?N1cxZlRLcUdhb3I3Yndvb01JZlBFN1VmWVBDcEVUcjVNMU5CZmE4TEFEa1hD?=
 =?utf-8?B?N1JtRWNnODkrUE1kOWVIZGFmU2FtZnBzM01Ua3R6MTFGdzdXSDhjdnZvcGti?=
 =?utf-8?B?RW96QThyZnRCN0c3NVVNcXlKY1RJQ2tDVFlUWm5lQnMzM1hsZ201RlBCSGpp?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	VjPWmij6fmChPfTUE5mPBIBxp4jAuozbhmQFa43mGyY5FroaOzSJz1R+TQ/x6s+a3A/NIRFG+snOEwYn4uI7u4dt18WfkyB+q/b7n5VxdiU0txoRkSNCKeaysgTPRTww0biAOYT7p4BpE4QLxTFNmUH3z1i37S9WdzStE/KAp7EY7pkipCs5TeFFo1Z3RNXm61OTt9UnixAzUTHO+X67gNNKOxEBAstTj94SgNOSH05a0/mVwYkH+VICD7SpB1w+ZeQFQUo1EkTqKCVtVEnG6Etjiq5sfrDPrH3mm7UtlgWM7BGUKuwSNm2890ccIXN947ZEpUy23tCKvZGzL7dZA9/XzXfbh/1Gv71HbTPMbfZ0K6AUMGaVTLWzDnEkTBYfjRKco10G1KmZC52gUrBGJbBwXRF8DSn4JY+QRvVZB6XzjWoSNlxeE5as9K+wPYY/rAFIvvCGW6ZnAYgHFMZOCZ1E/zB1zK68JV0X4RrVjaVXamtfSbjWtnYVAVOWJiA8YTnmtVNjl5VT1vvO50U8A2Ygq8SGScBHlL5viao34a9KGfsO1N80sNtODbf4B260QyQiK8BnaYdf/WwX8JyXMpzEMb6iFWu5+pOPbVFe4odiIwNKYPBp2q6g8sMkmRkvGRKKlBFbzIDbSHf5AoUa8eIpIdM8QzOGDUnDQbhNMsR8tA0UYiOrA1iK0cfnGkiXN4dBXzBAb8i6sm0nOhOKy+eKvz7ABYO1X02IJfaq9tjpOyz9NA0qoYoOjBceIXMwgE9h0MW2bdvzp7XryeA0PIAfQg+2CraMZqHOt+/+G6/X55DYG2QM74x+9zBlc9HpHMwz6Yfr59Th9EruExnt+rXqD+gOgvRzdiCqc3K5wu2WJ2To4CN5Wmgj7CG7NQFP
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16247173-458a-4de2-c493-08db0e0470d2
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 20:54:04.3418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9zNe74EqOITqLsWYCc9LPz6t0lsieSlhqsBGjdbBECx4AgRFbdOOBNgUA72EJPieAXXfXg7q6TU+5WwVpycOfgJhD360DQrqI1FAeO78lWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5264
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_12,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302130184
X-Proofpoint-ORIG-GUID: AkmpXOEDbPFmZRmQbuNmG5i_K4UKwz0Y
X-Proofpoint-GUID: AkmpXOEDbPFmZRmQbuNmG5i_K4UKwz0Y


On 2/13/23 11:41 AM, Jan Beulich wrote:
> On 13.02.2023 17:30, Xenia Ragiadakou wrote:
>> On 2/13/23 17:11, Jan Beulich wrote:
>>> On 13.02.2023 15:57, Xenia Ragiadakou wrote:
>>>> --- a/xen/arch/x86/cpu/Makefile
>>>> +++ b/xen/arch/x86/cpu/Makefile
>>>> @@ -10,4 +10,6 @@ obj-y += intel.o
>>>>    obj-y += intel_cacheinfo.o
>>>>    obj-y += mwait-idle.o
>>>>    obj-y += shanghai.o
>>>> -obj-y += vpmu.o vpmu_amd.o vpmu_intel.o
>>>> +obj-y += vpmu.o
>>>> +obj-$(CONFIG_AMD_SVM) += vpmu_amd.o
>>>> +obj-$(CONFIG_INTEL_VMX) += vpmu_intel.o
>>> This code was moved from hvm/ to cpu/ for the specific reason of also
>>> being used by PV guests. (Sadly the comments at the top weren't
>>> corrected at that time.)
>> Hmm, the init functions are prefixed with svm/vmx.
>> Does vpmu depend on svm/vmx support?
> There are interactions, but I don't think there's a dependency. You
> may want to ask Boris (whom I have now added to Cc).


MSR intercept bits need to be manipulated, which is SVM/VMX-specific.


-boris


