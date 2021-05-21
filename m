Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B97CB38C7A9
	for <lists+xen-devel@lfdr.de>; Fri, 21 May 2021 15:18:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131279.245454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lk52V-0006uH-VE; Fri, 21 May 2021 13:18:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131279.245454; Fri, 21 May 2021 13:18:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lk52V-0006sJ-RD; Fri, 21 May 2021 13:18:07 +0000
Received: by outflank-mailman (input) for mailman id 131279;
 Fri, 21 May 2021 13:18:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IAnY=KQ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lk52U-0006rf-9d
 for xen-devel@lists.xenproject.org; Fri, 21 May 2021 13:18:06 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db770803-1591-44d4-b2de-85a5676ef5f9;
 Fri, 21 May 2021 13:18:05 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14LCxAQs101282;
 Fri, 21 May 2021 13:18:04 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 38j5qrfnku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 13:18:04 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14LD1eZp145917;
 Fri, 21 May 2021 13:18:04 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by userp3020.oracle.com with ESMTP id 38n492rge0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 13:18:03 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB4397.namprd10.prod.outlook.com (2603:10b6:208:1d4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Fri, 21 May
 2021 13:18:01 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::78a3:67d:a8ca:93cf]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::78a3:67d:a8ca:93cf%7]) with mapi id 15.20.4150.023; Fri, 21 May 2021
 13:18:01 +0000
Received: from [10.74.102.99] (160.34.88.99) by
 SA0PR13CA0017.namprd13.prod.outlook.com (2603:10b6:806:130::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.11 via Frontend
 Transport; Fri, 21 May 2021 13:18:01 +0000
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
X-Inumbo-ID: db770803-1591-44d4-b2de-85a5676ef5f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=Y6OC6xhyoeNTCpVsAz3Ulm367dNvqrBA+Vw+GWRiLuI=;
 b=vhb6i9GVMP3ZniqBV50rnqh2sYc9rgZGASO4ZvWZJ1VCTyXCuP1pfgU2jkpiY+7ExH+1
 57zz1M+RDtStFuS0Oh4k49cc/8N4no3jxOnTogA4xQcui7VJV/YLJdQypfyEhsFmdkKq
 Nrh2CBBs9ehSipwjTf8mgWtFwXKgzLDP2V+kr3crTBcHklK/bIUJYsAU3z17z9JCkda7
 pHWIJ19ML1qvOwHONTVT6A88SE3GhyrWiqtHZA/gdZ6gIZDNdm0cL+6/DNXxrKXNpDbJ
 2ScUvsxw4ZHlrddQ/phx4oohJAz0IRbuwZ4TSQz6NwTCFHuS/MUs594C02AP6B2LBOZW dg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SoUKal8rRCk+yceFhlQ2WhsZeFVGQk/y1Uj+w8YHyFxw6KEHyn3K25bWpT2dS22gZ2yqc+moqR8RZrcJ3Tq2ipPtk2PeKNDr/TlWqIspCSr9crNMTHlMHLlCPrefQ0LqP0uRMceqV1t07bzPM3dOaCeQuXzIOLVITB52zeBpCMr1iDLGfKU1o+LKi78ssGOi7zCFlbXfiHDvlyEAYoikf2nC5Y9YzGikZ9YgYk4VNxlg791ZyzMfbuVdztxztpeHLOaJbsd8PxYXUQibOjCpIERdr3EAXMQ3lXXbRR0ayT33r0m9R0ZcVl5SSzq5Sm45z79eT3xCcxX3tQMnaaPpJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6OC6xhyoeNTCpVsAz3Ulm367dNvqrBA+Vw+GWRiLuI=;
 b=ki0M/eYJ593AGwtQHWpYv8zt4sOtovK8GCO30SlQfdbHnDha5nfnM2Cp1vWA+1Gf8PaQZNL1QNgInq1lh0hCQtkGUk2UdkYHe4iUMA24rLCQmjQFpizfRE1oMnfiIYHYJEOnUNDop9pd+94rI4LATaDDTmnJDLWRffPZ+BzRt0r6ntWq7t1DSootpurbSQYJvIYFlKH71BJzP5SaWq5o0NBfi/awA9JDKet2KI1NbZ1+NbNC9wwZxwwHXmzWkxbpSHk8PLpKDJyiDePDNjlGRJF2Me7ofV1nsg8ZbEvgIa4dZtnEYr5nj0cNKsC1YQJl9plbYx6vUQz2EXPbOwBgcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6OC6xhyoeNTCpVsAz3Ulm367dNvqrBA+Vw+GWRiLuI=;
 b=ldRk/rn3swyhaNel0naYINVpcrFmukcF7KOLWklKZKhK61IH9guOaqPPyGl4rdjFrpxE0Ift7sXra9BuSv1ZYA1hqqmUYXUBNI8ET6JcdBCLDeE/XZ3cpfTmjYIdtWLVqBOVzmbow82Vxv+yltDuEc9ocfygq/ZViaODvgDCXRU=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH] x86/Xen: swap NX determination and GDT setup on BSP
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Juergen Gross <jgross@suse.com>
References: <12a866b0-9e89-59f7-ebeb-a2a6cec0987a@suse.com>
 <65bbc317-893e-da41-97e0-c8f2e1feb3e2@suse.com>
 <f594a439-ec1d-34fa-3ccf-b162441fa0af@suse.com>
 <3953076f-c2fa-2e2a-4b07-fb610046a27d@suse.com>
 <89c46d1a-9474-0f17-3fda-4809a14adb45@suse.com>
 <2d019c04-415b-293b-052b-26b1ea3be189@suse.com>
 <0103d46f-4feb-e49d-f738-a2bf3d38c216@oracle.com>
 <c2733c58-4514-6df0-3f0b-0f8b65132017@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <9a65639a-1407-02b6-737e-141dd427de3a@oracle.com>
Date: Fri, 21 May 2021 09:17:58 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
In-Reply-To: <c2733c58-4514-6df0-3f0b-0f8b65132017@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [160.34.88.99]
X-ClientProxiedBy: SA0PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:806:130::22) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f65d078-588c-40c1-b529-08d91c5adc25
X-MS-TrafficTypeDiagnostic: MN2PR10MB4397:
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB4397BF5C5730775E710613B68A299@MN2PR10MB4397.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:274;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ys6VujfkoMfGfuKJnRlYEGtdqsAUKQCgoTlIinzk74z+ebxpq71nZS2ir7GHRpMhMnR/uuSkYq3q5Lxlqq5RyKxzwEKTeB2hpzpT6/0kENwWNWWBwUjvn+//EJOIiJvI/3FQUTIQTQYm6lNCRY4ftsvM1MRyM4xAyCVkyd/FcP/jZhV9st2mW22sUKS3WpQ1KO6vqqg+VJ5GSZJR03Z1afpRkAB+sJM6RfRp6MOi0SNzV7fGtM3hAHSnUXs42+CSv2uPUreQSZQYKkP6xdHu5iQAMsqa7+14WW334Z+TsV5+0di5INa/NfG4zB1YYS96kJHJy59QZ0duEvVAduzL4JWC9QVjw90NUT7v2RAg08OdRIP2ZC8c1lE4oz0cNtfZMwM9QXnIuLvFhzf9ceoT+WxkdZyjNM4YbOH6/4D9eHuhwx0Mqd3F35ORv6Uyivsqu/AdPiRLamWtQcNdYVqsh7ZWqhRUb8hiOSMgsGUQmnC8exnlN/jIJyTlmle+IGEMoICqi3ATO05TbRRfOLUdET7T5NZ7i6xnQgm+4jmjUNQfy6QzJVfv1js4yJEv4F4Zht0xWHtOGRTsWfMIIjfaC4NE2Da/eeqN8bUUdS3zZZHIfbX4vwCMWPh+Xe9wPuZUmKqGNEtYnNkswbfiTHOVR9hmEiRX4Ex1SUTeCw+4OllvsBhu7qUCL3Moaj5cjfQN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(376002)(396003)(39860400002)(346002)(8936002)(83380400001)(6486002)(16576012)(478600001)(26005)(54906003)(956004)(316002)(2616005)(44832011)(6666004)(5660300002)(558084003)(2906002)(36756003)(16526019)(66946007)(66556008)(66476007)(38100700002)(186003)(8676002)(4326008)(53546011)(31686004)(31696002)(86362001)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?d2VhR2U1ODUxcEJuUnlkTjBENHdJc2JOaDZtZ0YvK3F2clZ0U1ZqS05kOTUz?=
 =?utf-8?B?ZmtuZ2xoclJHMXB5bHNjU2NoTVcxY0RmYjljbkNKdG5FWnRyMUY5aldHcjBQ?=
 =?utf-8?B?VHN3Mk1BY0dDWC8yVkR4dEZDZlFtQmkyL2hWak9aMjdsRUduZ2ZrOGdvNTla?=
 =?utf-8?B?YnpKZzIrU0Z6TGpiZ0U0ZHZwZkZpRSs1N0Jkb1hMV2hUczdLZlozQmloekZS?=
 =?utf-8?B?b0VrVThKc1ZFTFd6YWh4aVpxUjJ5cGxZdHJlenBseU9HRHdvVmdZOUpMNUJB?=
 =?utf-8?B?K2lSUmx4Mi81eCtUREh2Z3lGY0N3RFR0Q1l4dytDSWJrQU9aa2hIcGJEa0NI?=
 =?utf-8?B?N0htOW8zazl5ckpMZllxSmU3eHRjRFUwMXdIS0ROUXRCeEJQT0ZVcjFlMzJi?=
 =?utf-8?B?NjhjWTZsMDFTQlVERHk3N0ZmQUtEcS81SHhxM2d6QVVXeGo0aDhQQWkzMEN0?=
 =?utf-8?B?QkNGcHRWbnNMWDZwc1BnQkF3U2loY0Z6SFRYWUFKbzZLcTdmTzRFaEFoSnlk?=
 =?utf-8?B?SU1YbzAxTEJNTkF2ZVJLZzRoRzR3eHhKU1NZajZ5YmlOY2J4NGlyTlR6N0lI?=
 =?utf-8?B?NkJ5YlFqbFN1endwTUQ0ZVRPdFRwVkZGeExFdFBYZ3Q4SCtBUitkM2x3Tkdy?=
 =?utf-8?B?NHh6c0cxTzl6djlIZGFSdUNyRGh4bWIyWUFHaFFvR0xkUmFyN2R3bWZsTVBo?=
 =?utf-8?B?NUJ2YkljL2RhSUczcjRyUUhpK3lkeXZKUnllTkFZN1BvS2IwK1hMTmdvUWt0?=
 =?utf-8?B?OTdzdXVUcTdVTnBqZE9SZVo0Lzc3V3FsQXdxRmI0QzU4cURGUGtreG10Y3Nk?=
 =?utf-8?B?MVg3eVVWS0l2SDk1bzVOQnczMW1hcmNDdnlzRndsRzdVWlpxQ3Nud2JJOTM2?=
 =?utf-8?B?WUl5OVNUU1RrUlFlYWJrcDRGU0V3RnN4K2dvQU03NlBqcDFnZE1zcUdkRjdm?=
 =?utf-8?B?MThEU2UzcURvUms1SXl2YkxEekdtTFBmNkZRSVBKQ2VCa25iTjdoQXBJRGlL?=
 =?utf-8?B?b2JjdUdSMUN5ZUEvbzJYYzhMc01tSXZ4R21DRmJEL1NjR09HNzFTaERnRXBK?=
 =?utf-8?B?TmJ3MjhUTlhGb1RjZVdhZXB5b2g4bG9zNlBObFhhbmpLTWIwODVGTTVoOTN6?=
 =?utf-8?B?L3B2dkxMS3I2WHJOWUhDbGJkRWU2RkNwdC9OYktvRU1mQityZHFLbGV3cGt6?=
 =?utf-8?B?YU5ZTjlKSHBRT0NHbU9TME0yWmIxYVNhK0hGSThnSXRJc25OcFZlSUlGSnE3?=
 =?utf-8?B?b2wyNkJDcERhRlpxT1hMcHUybVloRTd0MWt6VzFpSHdjWitNcXJQTmY0aVFT?=
 =?utf-8?B?emROZDZwRGg1R3diaFZIbGJkcTBndnZycTJ1Z2JUMENla3dBeUxRekgrMElv?=
 =?utf-8?B?dG13SVFYSk1JSTNiQlE1ZTR4TmFQTDhLeERwSitVU1hBbGlyQURlMkFzNndz?=
 =?utf-8?B?ZEJ5WlIwa3dPQVNid2draWdFeTVKNmYxVkVES2hqVk1RUGx2WVRNOElCOTJQ?=
 =?utf-8?B?dUVlcXZudVBwSm1OTG02emxsSk8xY210ajV0dm9ybHdaWEFFMmQ3RHhIZmRQ?=
 =?utf-8?B?UHJvb1l5U2tJaGljQ1A3alVkc3dZSVc2Z1BTZ0N1UjJjRHhLMlh1UmJBNGxl?=
 =?utf-8?B?bUxHVk41SmxaNlVMbkxTS291UG5qeEZYend6dzUzSWplUUdTNTY0VU5rNkNH?=
 =?utf-8?B?eERKc0tia2x6dVFTZ1Y4Y1ZXWisyeU5CSDZVZ043VXpyTGovSjd1UWN3RXZ0?=
 =?utf-8?Q?CDFXyXs63gN+kxhtbbKz9Vnu3Pdh4+SKlpALxXe?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f65d078-588c-40c1-b529-08d91c5adc25
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 13:18:01.6963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2W8ydE1nNOHuM968WAa9bbx7onStnt6WEEuX8DuWsYDzumsNdiSeDgsUELMQDeupbsiOT4wAgfa/vKKqqk7wIwgd7SLK3jL17hBHlmSoSLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4397
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9990 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105210077
X-Proofpoint-GUID: -EKwBMJFOzi0QohzCyDr6C06h5CoYSdQ
X-Proofpoint-ORIG-GUID: -EKwBMJFOzi0QohzCyDr6C06h5CoYSdQ
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9990 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 impostorscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210077


On 5/21/21 9:15 AM, Jan Beulich wrote:
> On 21.05.2021 15:12, Boris Ostrovsky wrote:
>>
>> Did something changed recently that this became a problem? That commit has been there for 3 years.
> He happened to try on a system where NX was turned off in the BIOS.


Yes, I missed that part.


-boris



