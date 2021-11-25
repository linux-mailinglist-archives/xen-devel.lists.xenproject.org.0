Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3956345DDAE
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 16:40:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231589.400839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqGqz-00026V-AE; Thu, 25 Nov 2021 15:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231589.400839; Thu, 25 Nov 2021 15:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqGqz-00022Z-5t; Thu, 25 Nov 2021 15:40:05 +0000
Received: by outflank-mailman (input) for mailman id 231589;
 Thu, 25 Nov 2021 15:40:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=67yb=QM=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1mqGqx-0001o0-2w
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 15:40:03 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f323d87d-4e05-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 16:40:01 +0100 (CET)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1APFLBOW005318; 
 Thu, 25 Nov 2021 15:39:34 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3chk007tev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Nov 2021 15:39:34 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1APFb9XN145698;
 Thu, 25 Nov 2021 15:39:32 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2046.outbound.protection.outlook.com [104.47.73.46])
 by userp3030.oracle.com with ESMTP id 3cep53rhva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Nov 2021 15:39:32 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB3998.namprd10.prod.outlook.com (2603:10b6:208:182::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Thu, 25 Nov
 2021 15:39:30 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::8d84:1f40:881:7b12]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::8d84:1f40:881:7b12%4]) with mapi id 15.20.4713.025; Thu, 25 Nov 2021
 15:39:30 +0000
Received: from [10.74.106.108] (138.3.200.44) by
 SN7PR04CA0068.namprd04.prod.outlook.com (2603:10b6:806:121::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend
 Transport; Thu, 25 Nov 2021 15:39:28 +0000
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
X-Inumbo-ID: f323d87d-4e05-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=+CUNf/nkpXrQBdtD5NiqLWu7tVPu0twJbHsL369Q+2I=;
 b=MgUf87aKvGAkWZNJq9+J9jsWE5wkReOdkBJMMHDCJQjtmn5pWZ6zaL+2DxOsb2wTGsdE
 2cHOBCmhBsuP3wxP3IDXkclc8hc4quwxXlLcbkUBoi2RvGnfMpHgWj436znT2vGRA9NG
 yewRCSR2UYYiSHnvVy8gaAfuO/ZWtZLdLpj4BRS5z6EaKiTczE/oTPqeFOzykPFjbmqx
 /kFoXa+DWxtY116gx0kYlf8KuUmZDMtltbgLujoUddW4Uc54+TGDtUXZ2eNTQSxEwur1
 Ha905RdAS2vmIP3wwOoXLqfP1ch+LeebHMkIQzA0lGcXNaW9AU4uec7UpG6kzkKBDbSB cw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BkXc8FnjkSrKPJRRbHIAmSjC7fjFtwDj1FY0eDkAQ51CN5owZzHGYljLASFGWFYULFw79zP3eJubUJXjeZFnbG5r297sULMsqnktJCSFENN948rwn+J5pErKJxZ2iVo3FDjRAHC97bh0kFvkrYNABOWStj1DR2xBT3lVPMMLkpBD33mIgpntmYbk2wa8S7cDzPZkL5tILNCwjRUV32gMeY7PMyanSczNBOH7kHRKhPl2ukmrEnnCGMlmLrZVxsMHO1RcI2JPmECTrkhrOwul/Ftyqo3duaUTA2ISW4cSg7ox0uegEqxGh649A5HyqV5rq6ccjnZtmc0QHRk7xvO3vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+CUNf/nkpXrQBdtD5NiqLWu7tVPu0twJbHsL369Q+2I=;
 b=L71IQ8Aa3l50KaGJutTfOAd88dncyXsq0xGmA+luitEcQ33HeFBkjpi48Sc7mHTq1rNMQe427OVstc5LlijxgACPxzZOb4ekBDUXxVX+WbP3LqUqpLQNM8phaPOMLTe2oOwKMg5HMHLY6KuoN2m7GpEyf5Tc8piRKu1dnZZdwOhpPGvVVo+KCKHZK5jTUYLT7SAPceQOHylK3SSTwKGHWor3yVPGdoba/ZuypmxqqJog7JsMHtvyWCmHXLbPHJVjY0cPE/tmcIvctRWY8enEC8Mkc2cgoOJ3s3+9HMePyBlhLskFE6bbl5KlPFOsGhNWQyDxlwODdWyn+HevNNUWmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CUNf/nkpXrQBdtD5NiqLWu7tVPu0twJbHsL369Q+2I=;
 b=qTsydae3g2bwjj4SemNzSw/I3CkDVAVXonMDTpU+qaFMqdProbzQ66y/PwA0rFSPoK19jR1NDmAHpdeGtpeHHrP4GxEEdhSG1KLVbOsspNYXU+vNuBc8cfFH90k0vjNdbNm3KV9sruEMguS1R8ik2CMHb+BbNgt8izl0q8E1oHg=
Message-ID: <048d94de-4538-ddd0-dcee-dfdfcb0b8310@oracle.com>
Date: Thu, 25 Nov 2021 10:39:23 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH 0/2] xen: make debugreg accessors always_inline
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, Stefano Stabellini <sstabellini@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>
References: <20211125092056.24758-1-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20211125092056.24758-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0068.namprd04.prod.outlook.com
 (2603:10b6:806:121::13) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7be7bea4-bfc0-4d33-9ad6-08d9b029c581
X-MS-TrafficTypeDiagnostic: MN2PR10MB3998:
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB3998F595DED09CC6E747C6D18A629@MN2PR10MB3998.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:525;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sn6MGcYGaKOT1oQoAGmSPfOnBoKIfbasgAV5QwCmhdbFC6zcRLdidhurvQW/ahYyc8Tm5wpW51Wf1ArD1vQZsbQHIzsMrSMLxZ6gFAgzlPlTc22yPcIIwrGnrs7ogHKmLjLq5qLQ9pMDC/cYNe3qNFrGFgTv0R1w4mXjiP1okzyHaI1Bqd/2smiyS1b45xPEY+MbcrqNLLn2PcjmSAlUu/AbigmtGYYEVOHJXQYrXP3HCCDmbhqrqhQcDSJq0ro+h2rzWgXTDXoYecAI5xAaaoMOiMl0GiRBFMYbnedO1vqAlF30Zha+yzGWOrF6Cp0Nlnmsogd47VAQtYfLgNgdD2qw/LM0IHATmHY2x6IPqfF2uYTt+sWY/vM54IwtBgrce1g+dhYsUQTYv0z8AZ44NveA1UbR+reF192iVk9nyG+nzIOaj576FgifCmzKZ7zRY6hu+fyLeJq8P3RDtc8vLBELwlte6cNMLT8g0c/oOk2uGu8yYZoaDoot3z65LtL4vETWVNdh57UVnuUN+xYWa2lVwYlDjxsuRqEO1OOGEKiozh4dv64DOcatR/8W1fUrUjga5zDLd423YEeWtwwsWb/F53VD5ihFjPMTWSLQjqnbSAyj4nO3P4pGXh46wpQ+xCjlY0gWsIFfXBacQVnH4oK7HN9We1X5cL26tL8R5MzWQIIG6WFRY7fk4VgOJrc/8t18JODaQi00DLSr/TMsg2x46Wvvjgswi/zgEXyyCBZ7QTUF/nB9AA+PSW067Joe
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4744005)(54906003)(8936002)(31696002)(44832011)(2906002)(38100700002)(66476007)(66556008)(26005)(66946007)(6486002)(53546011)(6666004)(4326008)(2616005)(16576012)(31686004)(36756003)(5660300002)(83380400001)(86362001)(508600001)(316002)(7416002)(956004)(8676002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WStmOFJqV0JhS1lhd0l2U2RmekFCUXROME9vOThOamtoUU5zMTUxTmlsV1Z0?=
 =?utf-8?B?dkNXWDJDdG9PSlFLdloxVng0dzJSaVhIZkVGMFM3eERWbDVCVWtFMjdoTUhT?=
 =?utf-8?B?OXpyZGVrTmhQQXZGRXJsYTZNSjUwSlFuRFA2ZVl6cVRjREFrR2ZTenlRbE9H?=
 =?utf-8?B?T000eDNoUmR3L0RiemxVdmVJcUNxcm1NK0pHUFo0T0thbFJySk5zVGU5WUtq?=
 =?utf-8?B?TmJ0dkUzUlc4bFV6VDRESUZleGpFQ0g0ZGp6bkgwZjJJeSs2ei9XTXNSSWo0?=
 =?utf-8?B?Zy9rczhmajJpcCtNWVdKZC94THg4YU5GTHVXc3M5QS8rdG9sMGpoVDFHVDdn?=
 =?utf-8?B?ckJyVTc4ZzRESis2d3hOQytmMHdtTXNwZzVML0lUQzdRK1ZDYS9QMlA0QS8z?=
 =?utf-8?B?Q01sZCsrT1ZOdldKR3RKRWY0S1VpV0lWRjREM1hzdU1IMFJkOFhNQUlqaXRa?=
 =?utf-8?B?WVozdmp3VkJRbzIvUkREYlR4dDFwQzFIOWgzcUYzaUZMS2dlY2d5Qi9JekQw?=
 =?utf-8?B?L1NIdnFvcFNHN0dmZWJzRVpDZ0c2b0NoY0Q3NllRY21PR2NPWnIyeGhHczZs?=
 =?utf-8?B?NzJ1dDVXMVFZak8zemxOU3Z6REdNM2VIRFpmdThKZzFGRG5Yb0ZUMjJ2YXN2?=
 =?utf-8?B?R3VjOUFZL052Q1M4K2FCbjRIYXFHb3I1amJZbjZxZ2NlOXRwTk5qaFBkZGFL?=
 =?utf-8?B?YXpETVN4ZmJJVDZTdXpNakNxTGc5cmVhRHJtclpwQ1o4ZnQxc1MxWkowODZI?=
 =?utf-8?B?QW9XMWRXMzBFcjYvY0Vqa0pKU0ZoQzJaS0JGOGdDQWJOWmVHWHdFbE5pWFll?=
 =?utf-8?B?Ym9teGMrK3hhTk40UGgwRG1GTVN2d29JY2IrcElUS3c5K2o1OUFlSEJIbzl4?=
 =?utf-8?B?QStIMzRINml3MDhtT2QxL3V5T0QrYUszVGhHQ090SUtEZEE5T3p1VWgwd3l5?=
 =?utf-8?B?d0U3TS9YNmRnekMvRVp5eXFMeXYwaTM2WEFXekVhWG1BYXlPbkJScGFpWDNk?=
 =?utf-8?B?VE9BYmY3dDF4VHFKSEpqYnFPbEN2bEdTNkJWNElSSldidjY2MGp0THE4OHk4?=
 =?utf-8?B?Sm5TKzFCMXBIeTIxK3hxbXhMa0t1azZMZEJuYjZwS0d1YUwwTysrSXlPczNv?=
 =?utf-8?B?b3VMeE96N1lJajhYbmxVeW1ML3pWU1Q2eEJKNlJleGZtc2Z1d242MXpJTlcr?=
 =?utf-8?B?Q0VZOWxYaWJ4dXptVnBXeVN0RlBWNFQxakRlSmVpcFUvVlg2Uzg4QUF1Mm84?=
 =?utf-8?B?N2U2ektCd0R6ZzFFMytncHRwM2d3eEZnV2pDQlRDWVArMHppN1h5UUpPbXVH?=
 =?utf-8?B?b08rdXBaUUtLdDgzR0hjYXJ3dlFUS2gwMnZjSUszWUNGcEdUY0NOekZDa2hh?=
 =?utf-8?B?SjNPUDMreS91Y0p2bUIwZTNTZUtGRGN4Qng4NFVDTGdkZTF2RlB2bXRqU3VX?=
 =?utf-8?B?aTRvT2ZadUwyTEtBNlYzQUVPbGd4aEtkVkdTb2J0SkFJWmx0MUJWREJveWFt?=
 =?utf-8?B?bCt3WVN2TmlER2ZBMW8vQW0xNHdvU3ZQN1E5czJRQVA1VG9HM2F1TEt6MUdE?=
 =?utf-8?B?ZDNFUVpBKzd5Ym40ZUZkQUowYnJOUW0vRXdnSzAxREg5WGFMa3piZ0F3ZGxR?=
 =?utf-8?B?TUdoSHpYYmlzNTZsR3Eyc0pRWDRqZkt6dDNERENiWS9wUnNSazZqQkxnaE80?=
 =?utf-8?B?eEtCd1lVcXg5a2hEWjhtbmNzTEdDRm5LeXRQNFJDS1QwbE0wSm11NzhvMUZh?=
 =?utf-8?B?N1NiTmVQc0cvS3BseTVTQWFhT1N3cER1aXhIeTN1Njk4QklucWl1cTBYbGZ5?=
 =?utf-8?B?R1BuVTR4NS9DcW5nSGJqam9ENHR4UHVLWEdLakwyWnFZY3hHT3JrSDZQY2ts?=
 =?utf-8?B?ZDk2czk4Q2V5MmJvZCt5aDZvUWRKNWFEdWNqYUNvbzVuNk45U1NJZGhWVHpW?=
 =?utf-8?B?MUMvakJPRlVsWDhBL2VDVVoxem9rVzE5QlllamdhMHAzSUpBcUJLYVN3UmpO?=
 =?utf-8?B?aFRmZnpzYi9TNE95WTl3dWhjekZxWDVOaDZ2MjN4TkJVOGdlbjVueUhsUFhH?=
 =?utf-8?B?MjdXODVGNlo3RStwVGdVSFhuVm5yYW1KZTVpQ09pSWxpcGtsd0hISDFjamN5?=
 =?utf-8?B?RnZISm1LQ0FjU1J5eXliR3FaQ0FVa0dNWGxDN1hFM09HWGN6YlJkbVJ6aThv?=
 =?utf-8?B?bEtGNVMwQ1didGJaT3FqUVdpKytvTGJ5VnZiQWZ4WDhQeVE5TjBsU1c5ZnVR?=
 =?utf-8?B?cG50ZWR1dEhBNXVQZlRQSDNwK3hnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be7bea4-bfc0-4d33-9ad6-08d9b029c581
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 15:39:30.5449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kVXB5OLzWYhB5F/cIsqrQ8bmhDQNTawTE7w4ics30w4BBOH3u5/SOqQlbAfjQKFU6C9ol2tbrPH4shNOVuU54qD9di1m0vzLGqbgf44eh/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3998
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10179 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111250086
X-Proofpoint-ORIG-GUID: F3qNX7ec-cz3Mjczewwlo4lzaIXdgpG_
X-Proofpoint-GUID: F3qNX7ec-cz3Mjczewwlo4lzaIXdgpG_


On 11/25/21 4:20 AM, Juergen Gross wrote:
> Juergen Gross (2):
>    xen: make HYPERVISOR_get_debugreg() always_inline
>    xen: make HYPERVISOR_set_debugreg() always_inline
>
>   arch/x86/include/asm/xen/hypercall.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


