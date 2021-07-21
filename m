Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B0C3D1703
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 21:24:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159556.293440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6Hop-00083C-QL; Wed, 21 Jul 2021 19:23:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159556.293440; Wed, 21 Jul 2021 19:23:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6Hop-00080R-MJ; Wed, 21 Jul 2021 19:23:47 +0000
Received: by outflank-mailman (input) for mailman id 159556;
 Wed, 21 Jul 2021 19:23:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VdoL=MN=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1m6Hoo-00080L-9L
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 19:23:46 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a35a6dc-ea59-11eb-8d37-12813bfff9fa;
 Wed, 21 Jul 2021 19:23:44 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16LJBCsu021044; Wed, 21 Jul 2021 19:23:42 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39xc6bsw38-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 19:23:41 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16LJAQdJ020323;
 Wed, 21 Jul 2021 19:23:41 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
 by userp3020.oracle.com with ESMTP id 39v8yy288d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 19:23:40 +0000
Received: from CH0PR10MB5020.namprd10.prod.outlook.com (2603:10b6:610:c0::22)
 by CH0PR10MB4827.namprd10.prod.outlook.com (2603:10b6:610:df::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.32; Wed, 21 Jul
 2021 19:23:38 +0000
Received: from CH0PR10MB5020.namprd10.prod.outlook.com
 ([fe80::85d:29fe:4f5e:eae1]) by CH0PR10MB5020.namprd10.prod.outlook.com
 ([fe80::85d:29fe:4f5e:eae1%5]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 19:23:38 +0000
Received: from [10.74.101.202] (160.34.89.202) by
 BN9PR03CA0225.namprd03.prod.outlook.com (2603:10b6:408:f8::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 19:23:37 +0000
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
X-Inumbo-ID: 2a35a6dc-ea59-11eb-8d37-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=dbE5AaXFjKwxOEq/ghfe4pTyn0yB32cJoCoFloJHJqQ=;
 b=sbWRPoqUodluPbvVkBkIsY/eyAurYyHzYQSrZyZNmtBCm50VmQC5qlkBqI9/+bFpNpBM
 xLHeGNp+VrRPgr/qwMBBwpKEvTePKGo8ofiDrRpNXgIxH58Ide786kk+WYdGxR0ghl2a
 4PCPTbKYnWQkXv340zGJT0BEVvzvCS4tuRCKC0c7XAh78RbqyMhm64qMtLlucu2R0+pr
 J42jOubHFkbmuTgB4px/B5SvwjQZR47l4E08aXeYh3QQQBlfZKWHfaMUwweGECvQSE5j
 kn8kG0URTmr/DA1fZ6CxJJUkDtSRqRh0zNt68dTFwbzxoivw2KRw8inQsR2gnZAmyu3L oQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=dbE5AaXFjKwxOEq/ghfe4pTyn0yB32cJoCoFloJHJqQ=;
 b=Tpajh79DhNGdeK/UdaF/vJzFeRPMyRUwlQcLF81Vj9jySxULSRu93IMUTaYDLVCz+oOF
 T4GZ7D4cNbU3UuQqkgZM7KZnZ4Ar4Iv2S1rYzYj38L7obFIE0ntSXJWaUjzOmtnfi/Jf
 V8VHG4VZ6ZdltpGN355+0MRP4VkFdonl5jEbnM1vbFc2IcVbOQ+P1YbHY1akwW22fAlb
 Kb404kaBAtHfjut4tHMtjN395naFwYYR00tA87T+nWOdnfy4/JMjvA/3FDVnnF9ALOaJ
 QyxkmFQV5fJ2tJRYvKKKj/5cF2G3t7YtjbGt3B3I42lu7e4a+CbBM69JZO71erag3/m9 VA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jOSuXHgDeWmcwI8XyU1Z5T56tQgpr8QI5ruIlMcmFyNZFL4l37pFN2ngVAUskFNQ73RPknhyn234OxmspEfZnJkj6kU5AAtOLVn9xhUisq7AvNZeAPeJm6nW/Uyyd29xi1i1ze7hkHD7mbIDZvNSv5ljaF+fvKoH1xb9ZDGogPPwFF8Dqc26XdstEslH/Dw9vkGB1UJa/KJffPv1M/y0mPhdV/KcE0v4sVoJINojNO8E18NYEQfqixJBDd7my72ug55pCI4vhRUo0qtRCjJ37Otj5JqpuS9FyILje+nWU0VV72HjibUDvkEdBSSwaLd6GIxrKqfuj5oborICLs690Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbE5AaXFjKwxOEq/ghfe4pTyn0yB32cJoCoFloJHJqQ=;
 b=QVtUW1VY5XESHnbYcjMiBRiuHsJD7koBtL2TH10xKvayTKrVAdrisy0jUq1+J3kDXuyjX4nEoh9GiECwoRfpdcMbfMlGcwLBgDcvSJarTTxSgPEGMpwoLUExVega9EcYCsJdQBUlu97rrXypLnkDD11PJ8TXUhmcPLTKYOn6+h4UuVfVLins6cBvPI3jIscN8JmSU1zhM4BMHkgC9Ctff+O7yk8wVV94yUEjzGchprOcuX0p8zB0diP2AAD4B26UP7bIexV2rqH4EYJRePy3TNZ3AyWQEXDwr6yLRTbAxSUtdUuMkIoPx+wA9cFVf+ukdztmGvKnWPMTGs05Uj1rAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbE5AaXFjKwxOEq/ghfe4pTyn0yB32cJoCoFloJHJqQ=;
 b=Q8/xcdU5EPtqm+0e3CDgmi+KlFXu6MWbj6ud1TheUDjAVkt79gS0g599PXUlpHNE+iDLDwMSUZzfZK4qsit/r+fKaubQ4oP7ZBYYLonTP28LpTdLuqWrgohhmVYUijB0O9pPfn+0vVrHJYqdae0a0CKDrmxBjEjieIDUgxsYIJk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH] xen/events: remove redundant initialization of variable
 irq
To: Juergen Gross <jgross@suse.com>, Colin King <colin.king@canonical.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210721114010.108648-1-colin.king@canonical.com>
 <b8efb888-6307-ef26-a4ae-666a965b79d2@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <90f59449-469f-218c-d4b3-51f99eaac70f@oracle.com>
Date: Wed, 21 Jul 2021 15:23:34 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
In-Reply-To: <b8efb888-6307-ef26-a4ae-666a965b79d2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: BN9PR03CA0225.namprd03.prod.outlook.com
 (2603:10b6:408:f8::20) To CH0PR10MB5020.namprd10.prod.outlook.com
 (2603:10b6:610:c0::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9849c31-1d49-4df0-9a89-08d94c7d0aa1
X-MS-TrafficTypeDiagnostic: CH0PR10MB4827:
X-Microsoft-Antispam-PRVS: 
	<CH0PR10MB48273F4FE083B24E64246BF98AE39@CH0PR10MB4827.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QWbTyZFLgNFl3xH8P93oiz+k9YIXkgxFR85cghyBNFw7XjJtjucN+h0F1333llHcXkdblZ2QIArd6GRW5kYOljmFZ2L67rGJmmEEO0q8txEbDiDGCKVK8gsYfkTo8pfB0PeJ5ZTd80X1SYOAtYXz6d43+eNWzpfe2Ea6KJKDRzS/0N/hew0GlucYexZqVjvE7mkpvYkx3DaMPg4sbRIguszmfytv+Rwmw2tC5UTEAZOJfFZfgRv9O6VcwH3lr4BBo88zdSvxLFa0Yyv6TMq8JCOoNUVxzn6U7puMTVxTaPi9CVjBqHOY1oJms7BiwUwWF/nsmv/T7odnVIZBhbwIo9xZm7bf/JnW4fOAQbOHYMKpCbk3P9JXA8idWY0XPpNXDSh23jkcVwRBlVsYYyy1p25wiJeXXibuCZspfj7YOeh4V6B/+A28AiHOFcH1j6xtHaI1QFqr9Tql7yz1GEN49nEqjU0ZQtz1gH3Vh7de+8BCNeTT0Yy6mr2WcSnN2MYbzk9BZzkmPWLiQSYZPefUvqkIL3heQLUvnA49fRzNSYTGZdDGG0fQIZ0whmeUjIKssDsIpo6lP/VhQkZRHoMl7TM7FbEdAFIxNJe8/RBQ6KbbXU5D34Jms2mo7XSb1U1rM+oS3cNIDkmUa3qt6hh0J9XOMI+ZOxO8b+RzXbKsj5Hst24AOcNIEkcZJ8CzP6uFy719XdEUqYRliUlK1/3jgnXWDE2S7XX782kNNsb/OGs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5020.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(376002)(39860400002)(366004)(136003)(110136005)(31686004)(66556008)(8936002)(6486002)(66476007)(4744005)(83380400001)(8676002)(53546011)(956004)(86362001)(186003)(66946007)(38100700002)(478600001)(6666004)(31696002)(4326008)(2616005)(16576012)(36756003)(44832011)(5660300002)(316002)(26005)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bFlQQXVQeENsZHVSS2grZ2FCTnRvMW9TV095eit3dGk3SmhzVlFoem9pZHVJ?=
 =?utf-8?B?ZlRJSnJYY0ZacW9DdzV1TFIxNUdXQkFhdWxyYTNoZkcvQ1RWdFFXaXZOTmFI?=
 =?utf-8?B?blZFa1dwZVkrdjRCajhDYUFQazFLM3NPWUs3amt5NHpiWTAyeGZOOHVTM2RM?=
 =?utf-8?B?bjMwREhSRnpZMUFNcHNIR0dBNytKTGNtT0pGS2pNQlJQQ2ZpYXFWSDlXeVBs?=
 =?utf-8?B?REFzbDc5bkpFUlRJTU9FR0R6eHJJRmtQSnowelVKc25idGZPU1kxbXJNTERR?=
 =?utf-8?B?ZW53T1ZtME5IR2JTaHdLdUtuZTA3eEpJZ3J5VVRxTmdWNVlJUTJaQkxoQTNp?=
 =?utf-8?B?ZGpWOFpoOEUrdkNwdStEZFc4MjhZTzUvQnpqMHFDdTh5eWZWYksxNWpVdG9h?=
 =?utf-8?B?a3oyQjZtTkJxZFZpOC9BMTVVa3ZON3F2Z3Z3akwvQjdtQi9BM0ZVWS9XSDZj?=
 =?utf-8?B?YXF2VVdnMkNYYTkyL2Z5bDhaNUhGTzZPbTBZR3lGTjkyWXlxUzVYTkVneXdO?=
 =?utf-8?B?V0lHMXNBTzFOSm9RcTR4QjVObDByVkU2b1FBc2wrbFFTLzBPOW43Slp4NlhN?=
 =?utf-8?B?ZGZ1enRFeXFQdG8vTlF3ajJ1cUl6ZUNodHNBSlNLM240bEExWEliVUlEdktT?=
 =?utf-8?B?OFpOZkZKdVNUaXp1d3MzNnYySkZ6RVp6WndPemtCTk9acUVCZUVlM2FqNW85?=
 =?utf-8?B?b0dzS1NEOElHb05hUDNJSTlpRmZyOXZTSTg2MStyUkRjSHlpWDN2YWtiNWpn?=
 =?utf-8?B?cWJSSlZjSkpHS0NQbWRDZjhKcGxWanJxTmdtWXpZV1k2UEZHQ0ZIR0VVL0do?=
 =?utf-8?B?aWc4NDVCbS9wSE01ajYvZmVRSmZSQW5pbWp0UmNQRUtXM0x4UkJZNVpSa1hB?=
 =?utf-8?B?RUVhZmpwYlZrNFUxQ0FiYzNJTmtNSHRzMlhTZXdvTWNJa1RHQzBQVGtLNFJx?=
 =?utf-8?B?T282dW9yNHJBUWtvcFF0NmVnMGlvMFlLMU9JYzRKQlR4K0w3SkhxSzI4b0Ew?=
 =?utf-8?B?ZTRTNkNUS1Q5VlNSYW5sVFp5dks4SEJtV1Bwb0VBY0VFYXVCZ04wZHVQT3pL?=
 =?utf-8?B?alVsOHczbkQ0ZjVZZzdlMEcyZlRESlhSYTg5cDQvYVVtdlM4M3BONEV5SWRn?=
 =?utf-8?B?ZUR5REZqZG1jaDROaG5uS2pEOTZXb2ppUGRhVjBzVWF4QXdxWkUwUTJWd1A5?=
 =?utf-8?B?TWRZRzlpcHFkL3pIS1pqSC9tY0c1SENPWnpaNUR3OHlzTzRFZDNFSGNWdXkz?=
 =?utf-8?B?bWVLbldseGdkc0ZDOFhqK00wK2t5cnhmcjk4M05hdThMYWcxM2pKc2NybkYr?=
 =?utf-8?B?ZW1VMWRSN3lZcG9hUFFNeENWejd3WmI2SnJ2VTBUTzRBdmJ1Qmo5WDRmcmRS?=
 =?utf-8?B?MmVqMjAwUTlRamNGNnVRRGdNWXZId3hZWmd1UDVvZkhjZklQVDI0czZ0eG9E?=
 =?utf-8?B?N1M4aVg1bmE0UzhPaDgyL2R2eFJIVFVIa3MxVlZSTjd0dFo1V044Q1JiYjNp?=
 =?utf-8?B?TncxamszOWhtSFg4WVArUzF3bXhOMW5oZFFvc0kxWE52bmRiOEF4SndleEdt?=
 =?utf-8?B?NnNHQXM1bGh4M3RXSXNFTHhleFVoN1FuaFpoUUs4RlVvTUtFTlNYZ0JadVd4?=
 =?utf-8?B?dy80bWJTWitSNHVMZGw3N2JsOFdIY1F5cVZBSEllMmlQVjluUExCZzlkK0dG?=
 =?utf-8?B?aWhlWTZZTURMREo4REdFNk5jdXNGUWtIM3dQVTNjdDFNRmlhYkF0SXNYMnJM?=
 =?utf-8?Q?nPQLKyi5kcpBS3wj4ScBcu5sXm1kwmp6uLdz4vk?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9849c31-1d49-4df0-9a89-08d94c7d0aa1
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5020.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 19:23:38.5340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1zydmprdui0y09CX6xopn83RCNFYa+lYlxzTGVzHmPanRPcxvxvHZJZfKYhtEuIJCTK8Y6Yyt3rCwsWQg6UEAwjyURPWwiIOk1TE9ZE+9Jk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4827
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10052 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107210114
X-Proofpoint-GUID: RURw4P2naOchWUDgnS8PJbgbDwwFyJhB
X-Proofpoint-ORIG-GUID: RURw4P2naOchWUDgnS8PJbgbDwwFyJhB


On 7/21/21 11:36 AM, Juergen Gross wrote:
> On 21.07.21 13:40, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The variable irq is being initialized with a value that is never
>> read, it is being updated later on. The assignment is redundant and
>> can be removed.
>>
>> Addresses-Coverity: ("Unused value")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>
> Reviewed-by: Juergen Gross <jgross@suse.com>



Applied to for-linus-5.14


-boris


