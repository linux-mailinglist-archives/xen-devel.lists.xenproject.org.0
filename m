Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C51031FB4D
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 15:50:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86905.163461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD771-000548-Ko; Fri, 19 Feb 2021 14:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86905.163461; Fri, 19 Feb 2021 14:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD771-00053j-Gk; Fri, 19 Feb 2021 14:50:31 +0000
Received: by outflank-mailman (input) for mailman id 86905;
 Fri, 19 Feb 2021 14:50:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rPBP=HV=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lD770-00053e-Dr
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 14:50:30 +0000
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ebc54774-0da2-42e9-906a-4759bba68947;
 Fri, 19 Feb 2021 14:50:28 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11JEoMqa047171;
 Fri, 19 Feb 2021 14:50:26 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 36p7dnsn68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Feb 2021 14:50:26 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11JEoMxJ125464;
 Fri, 19 Feb 2021 14:50:25 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by aserp3020.oracle.com with ESMTP id 36prp2ykae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Feb 2021 14:50:25 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by SJ0PR10MB4717.namprd10.prod.outlook.com (2603:10b6:a03:2ac::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Fri, 19 Feb
 2021 14:50:18 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3868.029; Fri, 19 Feb 2021
 14:50:17 +0000
Received: from [10.74.102.113] (138.3.200.49) by
 SA9PR03CA0024.namprd03.prod.outlook.com (2603:10b6:806:20::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.28 via Frontend Transport; Fri, 19 Feb 2021 14:50:15 +0000
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
X-Inumbo-ID: ebc54774-0da2-42e9-906a-4759bba68947
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=kUskgIqVNaYeclYwmhNYIZ2o+1wQAjk9lE4jRdS2drI=;
 b=0CkEfwLMxbJuTQWT8qEwP8DDHGuBl/2N5Xi+RisBR7qnWD1uJsN5MEqnaOzwIlOxcF67
 bn/q6LFW/MQdDgk1VK3hsO2BuKkIRxzrkIVXGrm5MCwyerBvPQhIpVT10J/wI5gkKNan
 5aDJjC3tljQRodoO5l2xnCsQsREHSPKHz7tn5hkjWwGB/wYa3Jv6o9wONV+ErkCHnDLW
 R0/sOY5Ar47TQuLm6UCrqaHB2HA4YBqlNh30lT2EusdNurgCgPwX5R8K5hG5T2tgBBfb
 i7IEHwEsAZSAwRPkpEwkFsY0hG/xaIEltfYDJmXYyrSpfD7Tg+7NTJ0U23jtxTutGiqJ zg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nyUMEkpVaK6x2Ym2Bd8x/O8zODtYq7BlPrMXRWu1QBvKjxcWuR0B4nK1orNF85rvz8Z3i0nL2VUI6tSJr9d6Cdg/ToAMBguOrQbL5TBqQb8QzTZxhlGMHVUQpDFLNz34GshpzNvy3re7yWRncZYpRvkLseVb4NMBy0tReV5B7OyvdyxZ5+p5HFv5kJD7vVVxck13klzTb5fwzFp3C/9E+ZrO7l/AI6fKoqTHZ/qBg4StgDtXXLYyDqnDSk2fSi4lFs94o103s+ojC3c4IrIpn47PAgsWmggYbqKIJ1v/4XD9/Dzc4rWNvDtdRdhBm1799r34nlGuEtM5N0fGpKHvbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUskgIqVNaYeclYwmhNYIZ2o+1wQAjk9lE4jRdS2drI=;
 b=CuvOnTmh9JUoBG14A8Bi2XhhwcRV0TShc5AlY5QvggrEAz/+ejSIZA8/I9zIaZzcEhI8P6qNRiReSTUiN8E1U8tvKipfxmp2Vl9F8B6ptmvOEbJpCLo3ABXTOnOZcBlgTp93x/K9chTZp3xsUCV4ff40DXG+GMx2fXUhxmg0SB+/Rujkd0GKganEhcR7cZKpOlGaOGFv7GtZNlJJUB1YqC29CkmxsHGIlcr9uIcMggzBl6w31YoZPYrRR6tUkmg6BW3FBYzgZG4d0iO3HlGjofP5Qb3jpICVgCA1MJXP8lS9EXXZHSnw6Qa5fgEFK1iubnJjh8e2isttWDF0fawvVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUskgIqVNaYeclYwmhNYIZ2o+1wQAjk9lE4jRdS2drI=;
 b=iI7bySvn6HyR81f+WcWPsUupjYXILeSkeOGdmmn8LILQPdB5WzTE7becuJHTedC/c3ujRi0HDIorhFEcI9lzWrIaeURf++Qq4MlLIbomXLkPRBVmD1UhsftzSM1lvCOPi//gDmgZxJKLLm2hrhTnPW4Li3VPR/WhHloZWRSMwwE=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH v2 1/4] xl: Add support for ignore_msrs option
To: Jan Beulich <jbeulich@suse.com>,
        =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, iwj@xenproject.org, wl@xen.org,
        anthony.perard@citrix.com, andrew.cooper3@citrix.com,
        jun.nakajima@intel.com, kevin.tian@intel.com
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-2-git-send-email-boris.ostrovsky@oracle.com>
 <YC5EitRCZB+VCeCC@Air-de-Roger>
 <a78a4b94-47cc-64c0-1b1f-8429665822b2@suse.com>
 <YC6NPcym62a0Nu0M@Air-de-Roger>
 <8ffd4f51-5fc6-349b-146f-e52c35c59b4d@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <5b286dfd-278b-8675-cd88-3ee2706c06e1@oracle.com>
Date: Fri, 19 Feb 2021 09:50:12 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
In-Reply-To: <8ffd4f51-5fc6-349b-146f-e52c35c59b4d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [138.3.200.49]
X-ClientProxiedBy: SA9PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:806:20::29) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1de6ba4-7170-4a8d-9914-08d8d4e5ac56
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4717:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR10MB471793DAF52E233B69B20F968A849@SJ0PR10MB4717.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A1yZ6Me+10rbT0asUAlkvUeq/6Yz7RI1i4O6qghSiItFPWsaaTSAYRq41SXgFGFDq61HyzkQ86oGzluIF7Vm7UD+hir72Mffhg4eHhUim6joaMyP/+1n+3nerVkBZLIxhg9F/gasrs9vAW++juZvSKHOnVXRgwSi7i8cbd/5HxH1kJj2aOlkC82UcSPJQyGKAFYRNZW2D6XKaTZSJszfATIlEwnhBPmcxB0NqjC6nbh8JY80NGoYK+as7luYxjcPnYs2nkrmMOgFUcP/od5xwmLkPFP4Qf0OlujvgauW1JXm5wHIy7MWulmlReG35g4KId44mOPUpFzM2DdVMCawQj7LkyYsY3Tt9twsXKnbdf6/ASONDCIWht13HsMAZI2QbMJrNrzdRB9M2eCZXxpNz/c5FQxsd7VXU9HLxWPG1jPjj6epNdkU9l2pBaxq7P9lpuFKTgfXokstuqiUyDQ5P5xCk3FPYamHRxJUUYapu9X81TnFSgJ+PonJSsFDHuwGtEYdIBuRWWwTAfxjCEYVmYj23PVAivwibJIMQQFMM2rfjpIxYBOE9MZeeyLzAdPi6jra9Les7RCdQZXhds9J9HM58RtvQ7qETgGQFw4NXAk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(366004)(346002)(39860400002)(376002)(316002)(4326008)(8936002)(956004)(2616005)(16526019)(66946007)(66476007)(83380400001)(66556008)(6666004)(31686004)(26005)(86362001)(5660300002)(8676002)(186003)(31696002)(478600001)(110136005)(36756003)(6486002)(2906002)(44832011)(16576012)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?cjd3N1pZQm14OHF6VEM1MTc0OVFDaDVFODdtZUVvaTZOR0pqMEpTMUVRcjUx?=
 =?utf-8?B?c1FSZTgwVFI3MmwwSUUwaW40a0VOb0NCdHEwSGZwaklld3RCZTdXL3VLdjFZ?=
 =?utf-8?B?bXZYZDFtQ1NOZWl2aXlnMGs2MmcwaHBwMWp0akF6Y050SDd3QTBibm5raHY1?=
 =?utf-8?B?NTY3Si9pdThxWE9zUHd3WjhOb0tLTm9CejE1UmV3dzF1bmxyMU8zMEpvVWhn?=
 =?utf-8?B?aC9nNzJTYkN1cCtSNEV0RG5aR0E0N3hTY29UNFJqUlkwTDh1MVJzd3N6Y1pq?=
 =?utf-8?B?ZmhnSkdMeEFXNXNNb0FCT1Bwbi81UEJ5aUw1cUphVVhndlNOV1JCWjhLVDg3?=
 =?utf-8?B?YmxKWEoxd3p6aTE4LzVWNUFXQmovRks5OTA4Vkk1SzhEdmViYmRyL2l2cWhL?=
 =?utf-8?B?RzZnS0svRXZHc1ovQ0lGdFZtR3ZueTRxZGIzYXdCRVVtZ2VrYjNwdzlBWXpz?=
 =?utf-8?B?WDVTNTlSQ3FXcnRmYUVzUWNYS0w4SlJRbWh4Vlo3ejJVNzNMV01FV0hxRlZu?=
 =?utf-8?B?Y3pkdXFpTG9hUEorMFJMWTA3NXFiZ3U3c2l0TnlqZTRQNnYwdTlxbmYvdG16?=
 =?utf-8?B?TTAxSUV3dldnNmdQekprY2tmRWhxMlZ1KzdIT2VMeWVyVWs2ZXR4UFZtY0pm?=
 =?utf-8?B?bU9rcnNROXBIZEs1Y25TczhPRng3QnVxNnFyMU1wNmwwcHBQZ0VFa3lUcHF2?=
 =?utf-8?B?V0w0ZGkxNytjUlVKZUZhdEtiUkZ0OVpuR2NCREVVUENGdkVGL3RoWFVrOStL?=
 =?utf-8?B?SERvRGF3SFhZVG5IUVFwdTRjVTRtY3haektUY0ZxaHlzU09EWHZPOWhLcURG?=
 =?utf-8?B?a29uNVJrK3BCSGZiYldCbEI5QUtyb3F2QXgzZFZ3NW4vQWNWc0pjbmErVUFn?=
 =?utf-8?B?L3pPNFJ2Q1FwYVVOWkhNaGprZ0ppa01ESjYwdWJmR1lCOCtGbE5TRWdsVS9l?=
 =?utf-8?B?bTI3dEhySkNOdWQzRFBYc2V6UjRIenBqYllodWlHK2pYWGo0YlZXclFEOUZZ?=
 =?utf-8?B?WlBma3dscFQ2OGJHbzV3YXcvU0dBOFZKT0tDYjdKcGVGMlJXaEdXelBHZXdS?=
 =?utf-8?B?V3VsZm5Qc1VCZEY0aHF2ZmFPK3FtQUtZajh5Mm90ekVFN29xbGVJVjVHbkZU?=
 =?utf-8?B?OWVzdGw2TjFDcUtOa0NZcEY3L2ZlOUVMSVg1azlaajZaNGVCVmIzMzFqWWtM?=
 =?utf-8?B?SW1QWjEzUDJxUmViSU5hUi96MHdITkgwR3Rmd0p5UjBLLzlscFNISXpZbWVa?=
 =?utf-8?B?WDRVMy8yZmFNK3ovMXRHRGV3S3RCQzM3b1hFLzhVUXpRZlVvclg3aFFBOGVK?=
 =?utf-8?B?d3A3RkZYNXQwN2NZakplNFRQNlJkbjdkUXVZNkhtZnB3Wkl5VGJSTHBORWVO?=
 =?utf-8?B?bEVZWEs5NGJXR3hPNmVFYXRFNEw5Z0ZwTzAyU1c0dXhoVFZEWGpVWDhPQTBr?=
 =?utf-8?B?T2Zhd0NEN01EUFNmZEd0WmRUS3lmNm5PMlBZblRWZmpjUHlwZGpocllMNWZQ?=
 =?utf-8?B?aUxRaWg3MXV2c2U4SXY2VVcyVkkrcGg4R0pWdDNsc3ozNzVYUXlvckhnTTJa?=
 =?utf-8?B?dExyTFZMZ1d0YkdxOXNKWjNEazlUUGpNbTQ3WWhIZS9FMXN0WVNQcjlxT1Er?=
 =?utf-8?B?NjdFK0ZhZENBWGMyaDFla2NiVXc3dXRwbmpDRDNDa09vcXBKNWYwME1vMjZ2?=
 =?utf-8?B?N3lxUDdXU2p3OWdiWlJiWlVDb243YzR4blJ3d20yaGhoNXNCdUhBblJHN2ZK?=
 =?utf-8?Q?iGCph9983YHiK6pieJ/WqrY1p7rHJ4iibSKs4mE?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1de6ba4-7170-4a8d-9914-08d8d4e5ac56
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2021 14:50:17.8569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xAURUbRBreJ1IyqM2W6rAjaQ+8KhMYKns4CLFGrH9lV4HMgMARCXoxt+OVuRCohcbVBSa30OpUQALIDAKrmLr/lVmrKTCTvmDz1UXzoQaII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4717
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9899 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102190120
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9899 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102190120


On 2/18/21 10:57 AM, Jan Beulich wrote:
> On 18.02.2021 16:52, Roger Pau Monné wrote:
>> On Thu, Feb 18, 2021 at 12:54:13PM +0100, Jan Beulich wrote:
>>> On 18.02.2021 11:42, Roger Pau Monné wrote:
>>>> Not that you need to implement the full thing now, but maybe we could
>>>> have something like:
>>>>
>>>> "
>>>> =item B<ignore_msrs=[ "MSR_RANGE, "MSR_RANGE", ..]>
>>>>
>>>> Specify a list of MSR ranges that will be ignored by the hypervisor:
>>>> reads will return zeros and writes will be discarded without raising a
>>>> #GP.
>>>>
>>>> Each MSR_RANGE is given in hexadecimal format and may be a range, e.g.
>>>> c00102f0-c00102f1 (inclusive), or a single MSR, e.g. c00102f1.
>>>> "
>>>>
>>>> Then you can print the messages in the hypervisor using a guest log
>>>> level and modify it on demand in order to get more verbose output?
>>> "Modify on demand"? Irrespective of what you mean with this, ...
>>>
>>>> I don't think selecting whether the messages are printed or not from
>>>> xl is that helpful as the same could be achieved using guest_loglvl.
>>> ... controlling this via guest_loglvl would affect various other
>>> log messages' visibility.
>> Right, but do we really need this level of per-guest log control,
>> implemented in this way exclusively for MSRs?


In a multi-tenant environment we may need to figure out why a particular guest is failing to boot, without affecting behavior of other guests.


If we had per-guest log level in general then what you are suggesting would be the right thing to do IMO. Maybe that's what we should add?


-boris


>>
>> We don't have a way for other parts of the code to have such
>> fine-grained control about what messages should be printed, and I
>> don't think MSR should be an exception. I assume this would be used to
>> detect which MSRs a guest is trying to access, and I would be fine
>> just using guest_loglvl to that end, the more that it can be modified
>> at run time now.
> I can certainly see your point. The problem is that for guests
> heavily accessing such MSRs, all other messages may disappear
> due to rate limiting. That's not going to be helpful.




