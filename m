Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF4D453C42
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 23:35:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226582.391576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn71a-0005DZ-O2; Tue, 16 Nov 2021 22:33:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226582.391576; Tue, 16 Nov 2021 22:33:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn71a-0005AR-Ke; Tue, 16 Nov 2021 22:33:58 +0000
Received: by outflank-mailman (input) for mailman id 226582;
 Tue, 16 Nov 2021 22:33:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iecc=QD=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1mn71Z-0005AL-4K
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 22:33:57 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4700087f-472d-11ec-a9d2-d9f7a1cc8784;
 Tue, 16 Nov 2021 23:33:54 +0100 (CET)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AGLl6k8032014; 
 Tue, 16 Nov 2021 22:33:52 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cbhv859w2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Nov 2021 22:33:51 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AGMCDNN020304;
 Tue, 16 Nov 2021 22:33:50 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by userp3030.oracle.com with ESMTP id 3ca2fwwd0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Nov 2021 22:33:49 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BLAPR10MB5297.namprd10.prod.outlook.com (2603:10b6:208:326::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 22:33:48 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::8d84:1f40:881:7b12]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::8d84:1f40:881:7b12%4]) with mapi id 15.20.4713.019; Tue, 16 Nov 2021
 22:33:48 +0000
Received: from [10.74.108.16] (138.3.200.16) by
 BYAPR03CA0015.namprd03.prod.outlook.com (2603:10b6:a02:a8::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Tue, 16 Nov 2021 22:33:46 +0000
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
X-Inumbo-ID: 4700087f-472d-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=8NbJ0EHl9hAkWILQHHMbUsq3DDQ6kVQFE3xM9BWEFiE=;
 b=FhAqZRxTYEg5eLskjcLPfT5fEuF2JKPcn7ffsht8bC5bCdk9Ho9P9RamunVo4F6xC5/m
 o2xihYlK05/o0edUPZTOTpZZQhFFtZcK03Jv7tvz3P3zoyIQi+jcLBEgz1bMK8+xKbwi
 /2QC3qNUdjFBa0MiOIvWGVbwBgSnVIj7CWr4JLmfvgAV62E2wNH3c4Au8/itTgBdPiTc
 3alWJfTAX4AQmM/O5BMviLrmmySGSKTjFgIcUM8NgG7ANa1HLzwfPKtIB9p2A0A+1jxo
 zKOFa+pRlZR6OlbaalMUddB726BxeO6XZ+anLx8BMfDAYRCrNtnSWT6KNtPBJ6JnjHGQ fw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFhFx2+td5nlwENlCdbALSe/3Xrg+gP5pKI3QJuAhyuzMLWf2Aqwnri0y72z20qoTYMdxw9mMCaaWaoHcfxs/9OfHZNnfYw2jGa1U3UjaQx3s6SvGnG4k7O0afypZqO4GtuHAUMcZStt/V6Jvv98xCYryf8/OOL2vKumhhjojr++ampX0uG+y9q4k/dGuxEvu9K0hSX00/BLq+q6NTmV8BSbRGoUTt7fq0keTfF0VdQzwQ2EC8RNKGIN8PM7/o49/b9Un2PFQtz5q+Rly7cCyPTUSZWgJD7B7audQifY7fNbJziMiVemMG8egJrx7TRLrwmDWY4va/7eST2IuKtX7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NbJ0EHl9hAkWILQHHMbUsq3DDQ6kVQFE3xM9BWEFiE=;
 b=S0DT89PNnZCTT0UKYFl3RcEmtTnbLJLJmEPSpywDksXze+eH3JTwgl5jVpLDyDQHF4c99P8ofpRh1AQVoA6fyq3JT2sUOfMfJKTyBmZQ2rCJjdmLcDVnNkYEpsNAK8c2RlcATO5d0MzV+4WfepHXqLHEe3QETXSwgNQoOZzicwjOPMgZcDOZs4C5B2G398iuU6uiJsgV1oZWB6p6Zk4lvrBMiXkhgZpBc81/5ftVJjaNTdZkJq45Nn3+VwEyB0dYnmQPzgEHZUUcubYFOTZHpxq+EFCTmXzc4Xf8JrBtFFMtgvLaw+AmD3MxkZGD9LyWF1Eg2QpKUTw8SEVoq2AHgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NbJ0EHl9hAkWILQHHMbUsq3DDQ6kVQFE3xM9BWEFiE=;
 b=NBF5Q5GXVtBYsimp4KXEfYTquiXXA8xZ118JMSB84a0gMoLo01+1RdkqDRSaZm0sGMI7d6Ve75IlpLOaIVlLWc6lhOg+irzJI8tRV+ZJpBmLq4Bqm9eyhuZJMJzuRMDQuzYpAFxLUdyaM1zpT3rXKQE8d5eVSdbcUGBdnWbVu8Q=
Message-ID: <f6957992-3431-c576-a8d4-daf4e60832cb@oracle.com>
Date: Tue, 16 Nov 2021 17:33:43 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH] xen/privcmd: make option visible in Kconfig
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: linux@weissschuh.net, Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20211116143323.18866-1-jgross@suse.com>
 <f80f3207-363d-51b7-4ae0-e4b8aeb2544b@suse.com>
 <b155f66d-8259-ba87-62c4-ce8a0f7ed82f@suse.com>
 <c6de136f-a1b9-2643-3858-9cd3d76e6f57@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <c6de136f-a1b9-2643-3858-9cd3d76e6f57@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::28) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10a5ce96-f0b6-4bfe-d39c-08d9a9512825
X-MS-TrafficTypeDiagnostic: BLAPR10MB5297:
X-Microsoft-Antispam-PRVS: 
	<BLAPR10MB5297D6F00421594C0C9DB1338A999@BLAPR10MB5297.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hVE37oVohM2Dvu2fWqzgF1oxJNw5a+p0R3m8HwbcNzTSx2U4XUVlDW+oOumqtqZZSCNwdvxgzNLJFTa4t80w4HeNX8MnBx1iNL9vyknun5iDCbFWXgeDSFUdQdkhAF9zcg+JAMVGDCvyfk5r2352LmAXlbPl+Ymh2cN4HYS7LLnthf/wmqDFyVxNQrnmpt/zfCSU6s/8OpTv8kZwcoyU3J7OFU4eUMbtfrGiOj6NG8VNOpj6dyxcX2qmXBgrCVnroZoy63utFu577X67vdpuwu1fgjsRpuMXqyw5FX/wSK1fkh2F/tx5751zdDP9QLis1IRztQXhre6b6f46u5rAymE4J1bjGXBPAAQEZDrrzytU4leNPC1i+odkpebZTAuzntr+QOVluIiFA2/3IouKCzfnVlSJRCGUhTU8iDWIBgK8BS2bhQ2r2U5kWD/6vIV9QfZjTODTRUe5pG81FCcdj30DTwZcJrjQc9FuCqvFju1+RjZczV0I/p5hy7mytNSWLVEWgPWDKDtb3RRhK4tvf+PHCicY/uvpl5I73Viu4mbMV/WXDSAPqYWrelYx4shhWew3MIUPvTJ3+iwyglzHD4TlH3zHI5HrTldFYiH1QtMj2mBv4AeaGMPa61tbVICSZUZ+DrVb/SQdkvjEz1qLZROUjUIlZsM6j2XptzuJ2bL8Am8LGZoZRuZjgGGIJ5w1dvt4+KpEko0qoWYWQGfx12rnqQsRkju2s1NN/f558YDiwry0i5b/fYQJE8PVFlFU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(53546011)(66556008)(956004)(4326008)(4744005)(508600001)(16576012)(26005)(31696002)(38100700002)(86362001)(6486002)(31686004)(66476007)(2616005)(8676002)(110136005)(66946007)(44832011)(6666004)(8936002)(2906002)(186003)(5660300002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U1pneUxINXNBNXg1U2NvZDQra2N5eGhFaU43RUgxWHBVWUN3bGZpbUY2cDdy?=
 =?utf-8?B?Ly9JYjFHZmhPTkJCd0tBYW5meWV4TlllOFdTaWd0eWNubEpzdGZwOThWRWRl?=
 =?utf-8?B?MytJem9ITlo2a20wQjRXaGtUajc0aGZ3alhjSEhqcGlQMDV3NVlZRWp0UEhZ?=
 =?utf-8?B?T0dFRitxbTg5ejlYcGovaUtBOExwWnIraW1LeWhNQS9Sc2hEbURCSjRiOElO?=
 =?utf-8?B?MVg4RXUvMUNzVW9vQnNaa1RWSXBJRlZPWGFiS1VhdDNla1ZHOVFQUHJDbUVv?=
 =?utf-8?B?UFk3QnA1SGxiRnlwQVcwSDVFN1pCeUJpN1RaMDN4Ky92dkJzdTljVnhVU0pH?=
 =?utf-8?B?NDF2c2xnZlBZQ28rNjdCcnNEOXlka1d5REhNcTVCZnpCTXA5QmNKamZ1dE1q?=
 =?utf-8?B?YXlMWER1U2VlV0tvU2VZYkxIZlNyd1ZieUJ2VXZEZDAra0tUM0w5WGNnNVo1?=
 =?utf-8?B?VVNjanhuTUJ1dEY5SW1UTER3WlhqK1FjTklrMjIyL0FYQ21KRGVFZVJ2eHNn?=
 =?utf-8?B?TWNOTVRVMlhKOE9YemJtVVFVL2huY1ppYmxycnBBNlF0NVAwR3BhWXBSaTRO?=
 =?utf-8?B?NTJnU2VsdjhVMFd3S0QwVEU3RzZZQzZnd3hkR2MvUWd2L2hxN042U2VobWRw?=
 =?utf-8?B?bXhZNHdNWTQwVXlKQkQxWDFERW5nbjZKdmU1Zm1TWG9POUkvbjlqMmpvNU1Z?=
 =?utf-8?B?L05IMkFiQjBITkZUVU83TU4yQzdrSnJ5d2Q2cklrMVh4cW40SUtOSjBCbUll?=
 =?utf-8?B?amJaZHN5bUl0SkJ4NmY5Q0xEcTgxSS83ZS9UOG1QUllUYVZlTk4vVnZZQWZp?=
 =?utf-8?B?YVBpVDB0bUp1MjNCcnExOUVFQ2ZLNUwxb3FGNk83RU5lU0lBZGUrT2YzL2s1?=
 =?utf-8?B?bjBJQUVEQk9ueDVNRG1xSFdXdDZwVWdEZ25FQ3hRM1BVSW1peXcvejRERk5l?=
 =?utf-8?B?RnZnWW1vaUwyMnJCL29nU0JJMUpkc0tZK0FCemgyTVFKUVlrdEFmc3F0aWNJ?=
 =?utf-8?B?K0YwNGRLL2N6dVhLaktxT1QyQ05COVBWYk1iOHk5aHVYaEZYZjk2RHV5TlJw?=
 =?utf-8?B?bjFrNFUzc2hxSHRNSmhLbElabTYzbVRhNG04QXpmaXlBMXo5WEdNRjJYNUhQ?=
 =?utf-8?B?N3Jwd3ZCUndWZ0g0cU5yMzNWU0VVbi8rTDJMczRZOGYvZlp5YVdZcVdTYUhv?=
 =?utf-8?B?cHAwdjhpenR0aHN6Z0V6ZHorNTZjcndwY3ZDanNtOFhiVk15YWFxY1Q1alVK?=
 =?utf-8?B?WWt1MW1SdVZTL01ObjIzcVVUbThxUTNWMjVzdSt1SjlsdndvSERXT2dkY0RK?=
 =?utf-8?B?VkZMSFhQTTMrMnVLZmYrSnl1NXhpQSt2U1Iyalh2S2kvTVN0R28ram5ZOFZr?=
 =?utf-8?B?aTVYcEVrWEhTamdhSHRyVXpycm9zbkNMYVZiRUROK2YzNHh6SUFYRmF3bnZK?=
 =?utf-8?B?OTQ3akFXaDlDVUhlSjhqZ0NTQTFqRG1HL0EvTXhjMHlEQWo3SVlDdlY4b01Q?=
 =?utf-8?B?NVMzenlJZUEreVZGNU1zMVNRcGZ3TVZLTkF0RWNISG9UbzhOQ2oxTjRLQlRI?=
 =?utf-8?B?NWtSRE9lWkdVcittZDBOMWR6dHF3STJyVGV4V2haVmlGSVhEUnpGdlV5cXdl?=
 =?utf-8?B?RUVrY2hMTHBuQnVuYm52K1UvOTVPaWQxUkNvbGtlM0p1OVZkbGV0dHEyUENU?=
 =?utf-8?B?UEJhbStmZGk5MTliZFA0MFNHdGc2SWFvcGVKQUcyQ0NkdzJDcUFzakV4RCtL?=
 =?utf-8?B?OENSKzVCYm93NDBzbjVFNWsvWmIrRFUzbjJMT042WEZGZXpJeVJsZ054eFFZ?=
 =?utf-8?B?cGN4K1lhN1pMa251QTR2Ty90VHFmVm83aWFFbUtaL1R1bnRBYXlXd09wVGln?=
 =?utf-8?B?akZlNFJqSDRrSE9IUEtrelM4ZWpUZ01kUmNiaFo4N2lWVUE2QWlBYWhGaGpm?=
 =?utf-8?B?QllUd1ZlUkEzQzNjQmM4S0QweVBaODFOLy9QNjVJY2tUTXg5eWVEem5xdXhS?=
 =?utf-8?B?aktLY0FwN3ZocDBWbGNJN2Vxam5HZjdrdU5QeXh3dDNWNmhXWFdHSGFpM2xa?=
 =?utf-8?B?L25scnRNaWZVNHhSZHdNTHlNQVFlWGNjZjc5SmNqQ3paSDNzZmR3ZlBjenRm?=
 =?utf-8?B?aVNRK0ROT2ZUMHhyNmR4NlN5TVFXaHBoWlN4a3MzbVJxME9uY1hGYkRjYTJw?=
 =?utf-8?B?ZUJjNVJFazJCb01JbTZWM0tmcDNzK3k1dE5XVFBNR21BR1ZnUHdoeHpoTmNt?=
 =?utf-8?B?ejJOYnVnMkcxb2NTckUyOGpJSUJBPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a5ce96-f0b6-4bfe-d39c-08d9a9512825
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 22:33:48.3685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ng27wb837jOm8w7k6iDXoSXd8QhCNgrmMB7QgdgrsFDZs9trLHs2oSwCr2DrdBL7xP0C9qo4K0IPEIcAxZJhn/XzmGvRC6UziOevl2LD5YU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5297
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10170 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=869 malwarescore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111160099
X-Proofpoint-GUID: gX-tW3FJZm18mmYlvzDVAKc6aBeY2EHA
X-Proofpoint-ORIG-GUID: gX-tW3FJZm18mmYlvzDVAKc6aBeY2EHA


On 11/16/21 11:05 AM, Jan Beulich wrote:
> On 16.11.2021 16:01, Juergen Gross wrote:
>> On 16.11.21 15:55, Jan Beulich wrote:
>>> On 16.11.2021 15:33, Juergen Gross wrote:
>>>
>>>>    
>>>>    config XEN_PRIVCMD
>>>> -	tristate
>>>> +	tristate "Xen hypercall passthrough driver"
>>>>    	depends on XEN
>>>>    	default m
>>>> +	help
>>>> +	  The hypercall passthrough driver allows user land programs to perform
>>> Maybe worth adding "privileged" here? Albeit of course that's different
>>> from the use of the word ...
>> I guess you mean "... allows privileged user programs ..." (another
>> variant might be "The privileged hypercall passthrough ...")?
> The former, yes.


I can apply with this change, no need to resend.


-boris


