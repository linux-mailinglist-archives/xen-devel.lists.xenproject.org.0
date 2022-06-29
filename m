Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B19560C79
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 00:47:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358093.587091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6gRi-0005Rg-2Q; Wed, 29 Jun 2022 22:46:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358093.587091; Wed, 29 Jun 2022 22:46:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6gRh-0005OE-Uq; Wed, 29 Jun 2022 22:46:05 +0000
Received: by outflank-mailman (input) for mailman id 358093;
 Wed, 29 Jun 2022 22:46:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BAEK=XE=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1o6gRe-0005O8-J3
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 22:46:03 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e9e42d4-f7fd-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 00:46:00 +0200 (CEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25TM4BT5024089;
 Wed, 29 Jun 2022 22:45:44 GMT
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gws52jm58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jun 2022 22:45:44 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25TMfWTR004641; Wed, 29 Jun 2022 22:45:43 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gwrt37kjg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jun 2022 22:45:43 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BN6PR10MB1347.namprd10.prod.outlook.com (2603:10b6:404:41::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 29 Jun
 2022 22:45:40 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::e48c:bcc0:fff3:eac6]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::e48c:bcc0:fff3:eac6%9]) with mapi id 15.20.5373.023; Wed, 29 Jun 2022
 22:45:40 +0000
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
X-Inumbo-ID: 3e9e42d4-f7fd-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=FTiecvSj+tUzFAuHeAb2GCtWdBW97SIGtEyKoxIX3n4=;
 b=JclqjCYW9UwyfFe0CXrj2YoTuajAw/KYhpijRrdk0TqrFMEHbPKlGbOYhZXnkpRG9b9y
 gOSDtn4eo7sHoYPcZIusewb03pA97RTyYd0C101xTB1zj1J1kDK6PS3g7hAuWmqiGmeO
 9yfuitUAIPj9xVOI6twx7ynWqBYbhpSMYasZH58V+AUVwd0x0uLbu+BCR2CfyagCJ07t
 BbfQucPUt1ZOc7Z3/wSoVkS/8R+1/cP4FS0DBVs+8dD1UmNL+YI+5o7glkY0oYwmILUo
 BzsnxExV6hfLoT5lBKEJ4ItcIzTctkbrwWp9lBH+qZERxv/Vrb8Q6C1ay+w0hVivW/PF rg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJWJZdFP71BykFxUOOo1B6MwMXhktLxH7ZfBGf2CicHvpn83G89EKXLTRJTPuA+YkjBWsRRqWb9hN8ls5ThagZFAM20KtXLjMWQg06m0lq6bFPNkdLwaoce6z1ENp/AJao3KmF6G+eYH5a7HEMZItUd58khWQYAYBM8QuGxhMQZMx8Qq53KplgcZ1crFwpS+SVte+U2cqe4LnyTUDyvEWPnqBWl4OytbgPEYleiDCfpxLtmYqpJL3/Q7dFf86BSfsP6Pkj7v9n2c7WuJclbBpaQAhCanpaxvmyXFDQr9vi2jmI3ZDr8SmQ8lohtImSKHZvj+l4WipbNpIc8p5JHU6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTiecvSj+tUzFAuHeAb2GCtWdBW97SIGtEyKoxIX3n4=;
 b=fJkXDWnqF4/x0w0gI+UOUipuZHtbgNMWvIPR8dX5aiJI1fqSn7gzgNOrYgLGoBTPB/ZNvzu04VDq+eljnQ7XgqaTmaLNcy54CJHE0BdJ5qc+Cm68GVQmeqRjuoUm/2ZpzUik4QQryrSTUoEVK1N02Qztw0mMnlDei/mIx4BjF7HLF5qBoMlyVbstd+ATxcygyRpQdUy3ByIJSTTsQOTECUucyG43VrC0O7paMQD/nm0ZlepYS5iYj9OyiXzVUSz84D0RThJTmPczY9TpJLuC1RraAaHpCk290GPM2gC3bJxSPVxpB+9IWBoDY7lUSgjVkpzBZIkekZdiVXfnmRJ3bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTiecvSj+tUzFAuHeAb2GCtWdBW97SIGtEyKoxIX3n4=;
 b=xcHFPOTXIsINOM1eoL8WIwVTXiojBBPKGMS2qWP4Haimvhy8l3eDK3BXx4zZzyX4r237Jot2GoXTrbYjn153QFTrQqtcktvoDzRRBJaSd+byfzCVd0E9AGh85Gs5zQdpZh2uZutEWXlXqoCvi1Wnx9BmcLpdfqzD6cVW3PVmsyM=
Message-ID: <873138b7-f70b-2010-217d-7d32042c801e@oracle.com>
Date: Wed, 29 Jun 2022 18:45:37 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: Reg. Tee init fail...
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: "SK, SivaSangeetha (Siva Sangeetha)" <SivaSangeetha.SK@amd.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, jgross@suse.com
References: <DM4PR12MB5200C7C38770E07B5946424A80B49@DM4PR12MB5200.namprd12.prod.outlook.com>
 <7689497b-1977-b30a-5835-587fa266c721@xen.org>
 <alpine.DEB.2.22.394.2206291251240.4389@ubuntu-linux-20-04-desktop>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <alpine.DEB.2.22.394.2206291251240.4389@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:5:40::37) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2cf9358-f540-45b5-80d9-08da5a2117b3
X-MS-TrafficTypeDiagnostic: BN6PR10MB1347:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nKrDDBnnbrhhI0Js374PotaZyGT9DrXpvXX5xdxk2Gbp9YCZkH/jjFtkXpusS/zp4l/CfCIGkKmMzG5r52iEbP6c7gbmJstzoHgdu38p17BvDdlNMnTdc2JEPeVGx7hh7aoLgK4vLldx0cuUJOYGmdxp37sE3wiJBGXQ2xf1oj9RQ/kPggwtKKz7LUGUg+EBnCXRoDrNk/BAzf+VU/Ga7D/fYuAWC0GWOQ093m1W2PVRbjKeGy6nfIgM9LyvBV5r9Scj5hWN9QLMRt+/bi9PcXwRiipt1KT/ij+zQMpt1AcUNcKP3Z/pkeIZ4AM/zXYTZLnS1g6zpurxnfu41IeRiW4v+VW82SO5VUibBESYrUYd/kd+5lAWNQ6356DgFK0IcJFDXUXNdVbS8mzkpN5MDEf9f3lh1BPYj9BqbDa6GQIpnqd3gJDgXIeoBG4h8vjMyEutuFVAnd5KwuzdJV6fdjWuc+KU7OyXRUG8dIL3l8XRIHYSl4nxeCvWU2eHSJPV51dIcdxJtVKHVmNH0bxzrY9ffzApHJb948Rf87DiRB3qvPxzrlrHKI0uc/2wRiuYp4auuhJ9++OuUUNIjTetnW+EYyIXJr1CKq1GXaH46vXAcypkgZBCvNRlHLNCCi/9Jwh2YvObOKBrzr9TC8bmsEDq7dnf/H5Wb9zG4q9lutJ63u/pDxmFn+OdSa/lboUz3JqkEyySzFPPm+dqK/4VI+ynqWJwpWDzHDSTZLbZnBuhs8YwSN/BG/S7LTB2FxyV1oAugxw9ioos6vljb4zknxyUdd9OoAgY2ZkDUuGTUmhvtSVjfSrJxgzdtRBAGt8o7EaJ+PsZJ00L9j6Qy1QljQuf+uYBZn9SkabaH6ZWaKI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(39860400002)(376002)(136003)(346002)(54906003)(6506007)(53546011)(5660300002)(6512007)(186003)(26005)(966005)(110136005)(6486002)(44832011)(41300700001)(2616005)(316002)(6666004)(66476007)(4326008)(8676002)(66556008)(31686004)(8936002)(2906002)(66946007)(83380400001)(478600001)(38100700002)(36756003)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VWVCOHQ5Zk9hc0JETExEdUVZUGZ0VEJJUFN0QU1Zajh3THRLWXhNcEpTelZ2?=
 =?utf-8?B?eEg1S01ydmJyY05GeGRmSmk1bWpYZlE5WDAydGhjem80Sm1yaFNpWis2NzFm?=
 =?utf-8?B?SHZEYVZocTRsKzBEOXRLQVVlZERpY01TSWcwR0RCYjhvZDdVYnJ4TXJyd2Rj?=
 =?utf-8?B?YTZ1NzZUOTF5N1Y0cXhlVWViZFVuM3gzdVNnVWpyK2V4RFdWNXA1NERuQWpv?=
 =?utf-8?B?Zm50T3BHUTh6aUpRMUFCQmpsWlFiNWhCS2xFOEVMdmI5T2NTVUgyMTFVeGU5?=
 =?utf-8?B?Ty93R1VjUnRGZTlldEZ4a3pOZjJsNVdRTGJhb3g2ekZ1dUVjUUViZjlIejhl?=
 =?utf-8?B?aW5PNzEzWFlnMHdKRHlab3preXQrUHI5S0pqQ0VlZVd0SzBGaGp0TjIrYVly?=
 =?utf-8?B?OFoyS0g5bElqL25OT3N0UnJkcXRwMldEYjUzVEhhVXJnRlcraE90TU1sVlBn?=
 =?utf-8?B?dFJkMlQreElFTkJTS3NxdTV6SHJtOVh4RWhRdUNxdEVOSExYUkFTQWt2cWhJ?=
 =?utf-8?B?KzYvK1VxYklxZzhDTUdzVlIvOVhZc1Z0dWwyQ3dacUhVMDNnaWRzajF5M2Ry?=
 =?utf-8?B?akhwTlpZVlQ2YnZYeUpMVnIrSThKRlp6bUxHdENmWGR4QzFLWDJhKytpTEFN?=
 =?utf-8?B?a1hrVlVkZjVHdUxTK3QzdTRScnE0dm8vVFVWSXAxcUpVTnlETG5BUGtxYkdQ?=
 =?utf-8?B?cmlKNWJNSUhtY29pMnJxd2MvcndrTmloK05qL3BRc3hZZnhUeGYxbzhyOW9B?=
 =?utf-8?B?TGUvMG02Y3VFaVRnNGk4NW1TVVI4d00zK0ZvZ1Zpa01PQTEyVEdHNUVIbm9s?=
 =?utf-8?B?aWRjM1M0SE50WEpqMlBGQ2lCQU1EWVZkakRRTjNIMVRLRlJsZURtcng4NWRy?=
 =?utf-8?B?VTR0a1loS2pLY1IxSDFFd2NwZDZCc0MrMnowMnA1Z3VBVnFqNFFsNUFxb291?=
 =?utf-8?B?L24zWVhXYXlNUW4xZitoMU9UTEVsbkd4YStkTWY1NnVTRTk4TU9RQ0xHMnpV?=
 =?utf-8?B?MXN1OVllRnVVYzNLc2k2WUg3L0R0Qk0zUWE5TjFXeUhEZGFkMXVUNVZ1MTZx?=
 =?utf-8?B?aVJyQm5CNkY3dndaQTY4alRlTk9mQ2FScG1NeXRrM2pHOHFrSWNQVVdoTDBh?=
 =?utf-8?B?VmdlNm5RZjk0LzFSY2J1dnY5ZXo0NG1VSlB5OVJOVlQwOHFGc3BNamRGVDZU?=
 =?utf-8?B?ajZUWlhCbUQ5aExwaGYycktadjZBYkgyOTFWQlpEMXRjZ3daQzczQThUK3cx?=
 =?utf-8?B?d0kzNUlSY1hPdGxaQnZZdmhNczBCVnd0R1Y1enR3Nk1sTmVzbm1ZR1VJdDI1?=
 =?utf-8?B?czY3akdCaEM5UGVBMXRBRFRia3JOdlp2S1RtVUc0LzRnRVpydm4yYW9Zc1dw?=
 =?utf-8?B?QldpWVBPaVQxV0lQN29YZURXZVFIQ3BWNUpPcFloQm1OSWUyOFlxUzVGRDZT?=
 =?utf-8?B?TmN2aXIwYVY3eWNNdnltS2phWEw5ZGtUVGw1SjRxRXpqV1BvQWN3TnFQSGF1?=
 =?utf-8?B?UlhDMVArc3ZmUE13dHIvdFJId3EwSE8vZ0pXNDlraFB3NFU3S2JZZm5FbVNu?=
 =?utf-8?B?UW5nVENUQy9kNXdDOFdxRXFJcTl4SGNDQXBIN3pYRjFpSXVMUGtRSjY1bWEw?=
 =?utf-8?B?SzBlWHFtWnRWV3BDRXdUb2l0aHdCQkg3KzlZRkhmMll5dkdIRnA4Q28vRFBB?=
 =?utf-8?B?Zzl2N2h4dDNPOHJGbWxnenJuZEx4TDZYbzlOMjREQmNuTUU0OEFGcTdwNHJn?=
 =?utf-8?B?T0luaThCQ05oVmNOVnR6a1diWDZ4R1BvLy9NL1dpUC9Na1JyRW1DK3pBU0lR?=
 =?utf-8?B?ZGZMMHMrM0ZJZGM2UkpYM1B2bGIxS3VscUtJSXkwR3UycWMrcG42dWlJeDVq?=
 =?utf-8?B?SmoxVUkvOEhCWHpBYWt1NVR1a2tMbmo5dTF4WjIrUlI3UmlkSzE1Y3FjWDdU?=
 =?utf-8?B?TXFTbGx3enpUZ3R1dVMzVVdwL1kzaUd3aUI2S0p1NFo3Ymh3QXIvUjd6dzZ4?=
 =?utf-8?B?b2R5VnZqWDdMdit4TzlFQVU3Y0J1dklYZmJwQ1JxSWpZaHNoVlZTYXdIY1VJ?=
 =?utf-8?B?c0pZbkNiYmZJNTFFeVYyaTU1YTIvLzUwU3ZiNS9zdXY4UG1uVldab3JJbzE2?=
 =?utf-8?B?blJTRG5nMHZKWFVJeFJVRHlRRTNxWmQ2ejJQVTBvNG5GeWpXT2RFcGhxM2E3?=
 =?utf-8?B?Y0E9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2cf9358-f540-45b5-80d9-08da5a2117b3
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 22:45:40.6594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iQw5nJknr4xRIS9+4MZH2YGihiObUWPL+B3bmQfJC4lr1LUWXGU8PL2YzwC6/IHY3tw1xmjH1X7BwHIJpHP5SimxJsLH5XONsRmVtDfY9cQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1347
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-29_22:2022-06-28,2022-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206290078
X-Proofpoint-ORIG-GUID: f8tuUtkJT46HmCqR44Pc5axgAGEPOdjD
X-Proofpoint-GUID: f8tuUtkJT46HmCqR44Pc5axgAGEPOdjD


On 6/29/22 4:03 PM, Stefano Stabellini wrote:
> Adding Juergen and Boris because this is a Linux/x86 issue.
>
>
> As you can see from this Linux driver:
> https://elixir.bootlin.com/linux/latest/source/drivers/crypto/ccp/tee-dev.c#L132
>
> Linux as dom0 on x86 is trying to communicate with firmware (TEE). Linux
> is calling __pa to pass a physical address to firmware. However, __pa
> returns a "fake" address not an mfn. I imagine that a quick workaround
> would be to call "virt_to_machine" instead of "__pa" in tee-dev.c.


It's probably worth a try but it seems we may need to OR the result with C-bit (i.e. sme_me_mask). Or (for testing purposes) run with TSME on, I think C-bit is not set then.


-boris


> Normally, if this was a device, the "right fix" would be to use
> swiotlb-xen:xen_swiotlb_map_page to get back a real physical address.
>
> However, xen_swiotlb_map_page is meant to be used as part of the dma_ops
> API and takes a struct device *dev as input parameter. Maybe
> xen_swiotlb_map_page can be used for tee-dev as well?
>
>
> Basically tee-dev would need to call dma_map_page before passing
> addresses to firmware, and dma_unmap_page when it is done. E.g.:
>
>
>    cmd_buffer = dma_map_page(dev, virt_to_page(cmd),
>                              cmd & ~PAGE_MASK,
>                              ring_size,
>                              DMA_TO_DEVICE);
>
>
> Juergen, Boris,
> what do you think?
>
>
>
> On Fri, 24 Jun 2022, Julien Grall wrote:
>> Hi,
>>
>> (moving the discussion to xen-devel as I think it is more appropriate)
>>
>> On 24/06/2022 10:53, SK, SivaSangeetha (Siva Sangeetha) wrote:
>>> [AMD Official Use Only - General]
>> Not clear what this means.
>>
>>> Hi Xen team,
>>>
>>> In TEE driver, We allocate a ring buffer, get its physical address from
>>> __pa() macro, pass the physical address to secure processor for mapping it
>>> and using in secure processor side.
>>>
>>> Source:
>>> https://elixir.bootlin.com/linux/latest/source/drivers/crypto/ccp/tee-dev.c#L132
>>>
>>> This works good natively in Dom0 on the target.
>>> When we boot the same Dom0 kernel, with Xen hypervisor enabled, ring init
>>> fails.
>> Do you have any error message or error code?
>>
>>>
>>> We suspect that the address passed to secure processor, is not same when xen
>>> is enabled, and when xen is enabled, some level of address translation might
>>> be required to get exact physical address.
>> If you are using Xen upstream, Dom0 will be mapped with IPA == PA. So there
>> should be no need for translation.
>>
>> Can you provide more details on your setup (version of Xen, Linux...)?
>>
>> Cheers,
>>
>> -- 
>> Julien Grall
>>

