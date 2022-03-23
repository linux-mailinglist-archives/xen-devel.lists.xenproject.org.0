Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BED1F4E5DED
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 06:12:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294062.499991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXFlw-0003cb-HA; Thu, 24 Mar 2022 05:12:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294062.499991; Thu, 24 Mar 2022 05:12:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXFlw-0003Wg-Aw; Thu, 24 Mar 2022 05:12:32 +0000
Received: by outflank-mailman (input) for mailman id 294062;
 Wed, 23 Mar 2022 19:15:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cV1o=UC=oracle.com=mark.kanda@srs-se1.protection.inumbo.net>)
 id 1nX6Rr-0001qD-JS
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 19:15:12 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8dafdeef-aadd-11ec-8fbc-03012f2f19d4;
 Wed, 23 Mar 2022 20:15:09 +0100 (CET)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22NHlABA004029; 
 Wed, 23 Mar 2022 19:14:48 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew5y22htd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Mar 2022 19:14:47 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22NJCqh6022790;
 Wed, 23 Mar 2022 19:14:46 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by aserp3020.oracle.com with ESMTP id 3ew701pymq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Mar 2022 19:14:46 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by DM6PR10MB2844.namprd10.prod.outlook.com (2603:10b6:5:65::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Wed, 23 Mar
 2022 19:14:42 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::85a0:903e:852d:6c15]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::85a0:903e:852d:6c15%5]) with mapi id 15.20.5081.018; Wed, 23 Mar 2022
 19:14:42 +0000
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
X-Inumbo-ID: 8dafdeef-aadd-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=k4LsBQm/8CG/kqiiX0Cl/adEd8+Ge8cskvfAqhu+hwo=;
 b=DlUHesHrYu25e8DS4v6V9ocjZeEKP5b0o2Dm7uC6QW+Nh5yNYvanTgF+8wPEYjsGAMlz
 GKIRqjkQfpApgtm+qRuJTMjVZoJs8TbI7P/vHHV9G5GrggZH3rz0rVjcaSAWxwqfzUQU
 GkBAZdfOSlZgEk9iC5BHQfjK1iGmKWvTCLINe6iFJxQNdgtSSlp81k5OGDLZjUK+U0hr
 kUzS15/YqwSJMcE/NRrK5OddQCFiB5jbkIG5JFJkEk2qVJofuhfqnkNPIiq0cFF9hsa/
 2vmB/l0QpzK5XsprLMKuteF1glV91uvACZOYP/NME+WD4qCDKkawZanrDHcIHrLLZTR1 Ug== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NbMh5fSobTPiX1Qt3aYfVvL03iP2D2IhPNAbz44jg8QXJLwYw3idBTRBVET2A9s2chRRgIQoad6oaeQQQDcQhrsfQjUDEnqaQD+oz0HrqXLyTt/9zHpwLhNNaxX/H5Gh+8pNbBksi/A+pmUNh6dDkQvJaShfYbpcFtRu7TH3GcSVMrxNxuCcAp5qb3NBp/KpZotJKVoZOCNTrBYBK73avEC5Rx+7gLvEmwnvTMd8HPHPiWWW9U8Q2RQQ2f01LAfSC3Q/OSVwd/nk+Y16J7NjjP6X0diSZmWCR8hHg7KKcFkQ12HuqE6TseyppNFbCA65UPjbURx6v/bHwXzm+FmeHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4LsBQm/8CG/kqiiX0Cl/adEd8+Ge8cskvfAqhu+hwo=;
 b=h8oDV/muitEuwif571WZcmyBjVMKMHuu60wd1awUQ98NJal7cYSPOEYNIwHTVY/N4I5FUc8HE/Por0ONG8JELp3cXgDosAadSdvkH3gnBfhOj8P9FdSX49cj3DCJgFrUTRdgxaiNtTbnUG/22kbuurkiogMzD5HckiG3WxNW9tAtchHZFNJkpl3vwnCuw/kaVHt+fvjKGx1Eor1SZ0PcI8fV+tLMRL8KwaYwaWah4nez36XDcIwpcdcHMNzHXP+9UCxYL5gVMrRSPzsZvAdMhPiEs9HlgnnOGNoNV2KRQqJCg2TQYlcrL+xmmliA3jmZJ0RuqSQZuUXwA1qwtMzr3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4LsBQm/8CG/kqiiX0Cl/adEd8+Ge8cskvfAqhu+hwo=;
 b=PenXgNb22915caKQju5nKpH20Q1leYbVkTbGM5MVFDrpWC3cFsv3UgkQUcPP87i1VNhW+Ai+sbAukMPktBkdm8L3nCi1O/dX9gzbnAfdRC+Cb1Is/VlzgogsPyxYK9tworGUQZxBmyOjf7RPxAL2lwSgSNe9fA6zF3Pb5AQf4wQ=
Message-ID: <85ea473f-453e-4513-b4cf-4c8c7b7c2bde@oracle.com>
Date: Wed, 23 Mar 2022 14:14:36 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 01/13] cpu: Free cpu->cpu_ases in
 cpu_address_space_destroy()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>,
        qemu-devel@nongnu.org
Cc: Wenchao Wang <wenchao.wang@intel.com>,
        Laurent Vivier
 <lvivier@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Yanan Wang <wangyanan55@huawei.com>,
        Cameron Esfahani <dirty@apple.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Anthony Perard <anthony.perard@citrix.com>, haxm-team@intel.com,
        Paul Durrant <paul@xen.org>,
        Richard Henderson
 <richard.henderson@linaro.org>,
        xen-devel@lists.xenproject.org,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        Roman Bolshakov <r.bolshakov@yadro.com>,
        Reinoud Zandijk
 <reinoud@netbsd.org>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Kamil Rytarowski <kamil@netbsd.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
        Eduardo Habkost <eduardo@habkost.net>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Thomas Huth <thuth@redhat.com>, Colin Xu <colin.xu@intel.com>
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
 <20220323171751.78612-2-philippe.mathieu.daude@gmail.com>
 <06217ec6-bd2a-6fd1-b2ff-1704b073456f@gmail.com>
From: Mark Kanda <mark.kanda@oracle.com>
In-Reply-To: <06217ec6-bd2a-6fd1-b2ff-1704b073456f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN1PR12CA0062.namprd12.prod.outlook.com
 (2603:10b6:802:20::33) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c5d2c83-1471-441a-4a9a-08da0d01620c
X-MS-TrafficTypeDiagnostic: DM6PR10MB2844:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR10MB2844BB4AFF112D72DD51944FF9189@DM6PR10MB2844.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dIb5atGQxvDsFxJYNjn9pvB4JpkQDnN+qN7gXHdGN+9Dhcr58iFlo7GkN7yv5s3D7C2gBB+Lze3hnPNnegzov8VJVRY/Qp9yigOdl2szlgFarudW+Zgi+NQupVgxRJfEvSvrXw8Hqga/wqsULQapNmN5K10t1MptDFmh1Q5HoXdXEkSqFfmxH6D8ru8X1f/wN4wjRa0ok7c3FlfMqlGeTb4gf1RTLJ6ReWeiT0sEzz/xwo+GEUE2vqv9V+wunMnKHvsW80ZaLySmpQsNK7yB4L8V+jZTLN4DKUAtpv9sJTaJk0bfqiOqClS51yGVbrjlxEtwCmwoZIlYqrhjLb91BwDTLyQygxlfQozN1fBejOOEVup1mJ977wBIVf0jQzthBkdY/gm9p8YN8t+ObQ/Oiz5iQvWywymMik3ffnuogwKL85wLT6ZbvmsIIBrs31RTF+xxTSL1f9NbnzjICiKi0/P9AJrA3S+bVn83nP5ssYiR7dBy+RKOgJ+xdijX7TRg8Wbu7oLFwC0vAN8KfVs57uWNX3nADulfFQ3ykVPDFpQtRAKQtgMrZa08pLJurt15eFtF9siAoLgcKIqWxlnLttf/ZVbHP+QExJomb3DhRkn5yReceBWm2FrGY6RNkquoRU9krFLGTnQV3iYHl3Ki7lFjqJcMciV+bObVPrpABKrU2D9tuNp5cyCG8C4KIsPGHQS092LmHPD0RFG6h/5087V7W7+lacKP4HDHakJ93Xo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR10MB5841.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(2616005)(31696002)(5660300002)(6512007)(54906003)(508600001)(86362001)(2906002)(186003)(44832011)(6666004)(7416002)(8936002)(53546011)(6506007)(38100700002)(83380400001)(8676002)(6486002)(66946007)(316002)(31686004)(4326008)(36756003)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZngwZHBER0gyT1hld1V2SkErcU5DdEtpNVVvNUF6WDFhYzQ3OW1jL3NiNjBa?=
 =?utf-8?B?d3pxRWVNOFdtTTJ6M1ZWQk1YZGk2Yi9sblo4VFVPQmsyTG8vVnNJYWJqNWJ2?=
 =?utf-8?B?OWFITzFWZmZFQXd6eFprcklTWDdiK1ExWk1Db3VSYm5pdkZ6bmltZXh4VzFz?=
 =?utf-8?B?OTJtQTRLemNJMTVCdStYaFUrZ1BZWUJsd3B1WG81YVJ2V1pzTytncm1rQUlj?=
 =?utf-8?B?SUlhRVp2RzdRbk91RjdXQjR2ank3ZnNBdkNzNTA4dCtybFFqeUZsd1o3TE94?=
 =?utf-8?B?amhyU0o4dWJ0QnNITmVmMnRkY3JEREhIUEVZU0hxZW5SckZKbmVpU0dTVXhk?=
 =?utf-8?B?QnN1RFJUbmNPOUt4TlJvcUx0M1RMR3B2ZVp3VTVSTzRzRGo2cktWVDBDNGxj?=
 =?utf-8?B?SS9NMlBIVEtER055OXAzazVsNWEyYW1UN1hOcUw0NXJkZk5JcFUvTUUyTHFY?=
 =?utf-8?B?dXBHNkdhZ2tZdVc4SE8vTjllZGk0VFB1NHBrSXZrYVFKVUtKT2lxOERZVVVY?=
 =?utf-8?B?N01MV1plc0IzRnF1K0RQQ0JtWEE4cTZDOGwwRUxONGp6TnBhWklTTWVPWEUw?=
 =?utf-8?B?aXlUcWRPZ0QvZmpDMTJZYlVId1lzTDFyMFp3NjNha0FDZG1wanIvUGJMUDVw?=
 =?utf-8?B?M1ZPNFcweEd1ZFZNcUZJcWVraVZVY1VBVnB3cFBua2Y3cHFNZm1ZaFFPL1N6?=
 =?utf-8?B?UG5aRGtzVFZZR3EzMnhWdVhjOXlmUnVwOWZlQjUvdVN1OWg1VkJiOXpVemdW?=
 =?utf-8?B?endOU3ltZVZDOTlkRHNsK0RRYk9VWDFFYnJ1bTU5V1crMWxSR1djZzlpRTB4?=
 =?utf-8?B?Q2VmbVpCclFEK2xxTGtkQWhWS0RBZW5XVXI5Nm1VeXFGV0w3MUwwbm0yOGVM?=
 =?utf-8?B?Qy9EVWhjbFJPaXdFRWdKQTdtU21ycElPZzM2M251WHMwdGpIeG1ocG9yWmRR?=
 =?utf-8?B?U09GS2x6NHFPZktSZ2RSbVVyN0VHVWRuTm1VbE9tUUhkN2tZNEE1cCtDY2Yr?=
 =?utf-8?B?K3VweTRMd3doQ0p1aUhxZXpHdGNoNTFRNWFqR0luVXpnYXlhMGhLQ3dDNGli?=
 =?utf-8?B?djVuNFl4VkRyazc2M01ibFluR3JFakgrNnREL2pOTG5xL2QxVzhvVWtkTVlp?=
 =?utf-8?B?SFcwS0NvbUo3R3poRkVwOEt0YkNLdDk4RnpTSWg1N3RIeUNPNTRkOUNycDls?=
 =?utf-8?B?L1hmZVJ5L0kyT2ppUkdHSHlEU1psaTl1ODNlMzFJd3REOTQ2WlNIdHpUSWNr?=
 =?utf-8?B?dXFFV08rLzdSZFJrd0pDRHlhRWFLWHIyQTFsc3FNTVVERFJKRWF3T1JJSzV2?=
 =?utf-8?B?bmp4dmxkQkdPUDhpOHh6L2xTQ0Z3cWdxU0VCR05kNTV2dEdxbTBZV0VQdnRm?=
 =?utf-8?B?L0NrRUVQRFU4U2hWUlZ1KzJ0ZGI5ZThMUzd5ekljTkpGeUVpRkRGendqRS8x?=
 =?utf-8?B?bzBsdEFheWVrUVYvNDNqSGx2Z1dPcUdBSzZrVitpTU5xRXhzRXdzbTM2UGxD?=
 =?utf-8?B?djU0SW1sZHZpTk9mSzBDQ3grNGFnZExIZGc5ODJGTTc4MVFDQ1RPL1Bmemow?=
 =?utf-8?B?QUpJc0txd01ZWDJTQ0ZrbTVsaU1vckkwNHZpWTJ4cmNMWTRZUFhkZlFDa25y?=
 =?utf-8?B?Vy8xbFVtOXZqRkJSdmdyaTVRaitDZFZmSVFMRk1tZnZaREZzMVdFZnVGaGpQ?=
 =?utf-8?B?MnBIMVI2RzNYakhmSWVQNEhpQTI3OGJleFoyMVVHcnFqM3RiTUIxbS9TWUpy?=
 =?utf-8?B?akFtVDVrS2preFpZM0dVNUpTdVM4THZSenJ4UnZNdXRwdlBLdzdnTjFJVHJx?=
 =?utf-8?B?KzIwNlVyNnh6VnZzWlhnSVdxcFlnNi8yNTkxY2dwd1pVcCtldmlkanpRMXB2?=
 =?utf-8?B?Tnpra1NZNVBxc3dZM3FpYmtudFhlcW1Zd3kwNHhxcWIwL3lUQ2VsWnRJY09S?=
 =?utf-8?Q?DKi9cvRp9uSXJmTP2WBL9Bx0R0u1YfW+?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c5d2c83-1471-441a-4a9a-08da0d01620c
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 19:14:41.9634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DH6t5t+MdJR++yxRNJN5w5Rpbc9wXz1+qvdXddfvbwZRdMa4LTeGJKTiVH0TRgJ/wQk+IVei4bSdh1v6pmxeEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2844
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10295 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203230100
X-Proofpoint-GUID: t_UTRWQVraX34GUlamYHoybIFY8zhy0i
X-Proofpoint-ORIG-GUID: t_UTRWQVraX34GUlamYHoybIFY8zhy0i

On 3/23/2022 1:56 PM, Philippe Mathieu-Daudé wrote:
> On 23/3/22 18:17, Philippe Mathieu-Daudé wrote:
>> From: Mark Kanda <mark.kanda@oracle.com>
>>
>> Create cpu_address_space_destroy() to free a CPU's cpu_ases list.
>
> This seems incorrect...
>
>> vCPU hotunplug related leak reported by Valgrind:
>>
>> ==132362== 216 bytes in 1 blocks are definitely lost in loss record 7,119 of 
>> 8,549
>> ==132362==    at 0x4C3ADBB: calloc (vg_replace_malloc.c:1117)
>> ==132362==    by 0x69EE4CD: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.5600.4)
>> ==132362==    by 0x7E34AF: cpu_address_space_init (physmem.c:751)
>> ==132362==    by 0x45053E: qemu_init_vcpu (cpus.c:635)
>> ==132362==    by 0x76B4A7: x86_cpu_realizefn (cpu.c:6520)
>> ==132362==    by 0x9343ED: device_set_realized (qdev.c:531)
>> ==132362==    by 0x93E26F: property_set_bool (object.c:2273)
>> ==132362==    by 0x93C23E: object_property_set (object.c:1408)
>> ==132362==    by 0x9406DC: object_property_set_qobject (qom-qobject.c:28)
>> ==132362==    by 0x93C5A9: object_property_set_bool (object.c:1477)
>> ==132362==    by 0x933C81: qdev_realize (qdev.c:333)
>> ==132362==    by 0x455E9A: qdev_device_add_from_qdict (qdev-monitor.c:713)
>>
>> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
>> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Message-Id: <20220321141409.3112932-5-mark.kanda@oracle.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   cpu.c                     | 1 +
>>   include/exec/cpu-common.h | 7 +++++++
>>   softmmu/physmem.c         | 5 +++++
>>   3 files changed, 13 insertions(+)
>>
>> diff --git a/cpu.c b/cpu.c
>> index be1f8b074c..59352a1487 100644
>> --- a/cpu.c
>> +++ b/cpu.c
>> @@ -174,6 +174,7 @@ void cpu_exec_unrealizefn(CPUState *cpu)
>>           tcg_exec_unrealizefn(cpu);
>>       }
>>   +    cpu_address_space_destroy(cpu);
>>       cpu_list_remove(cpu);
>>   }
>>   diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
>> index 50a7d2912e..b17ad61ae4 100644
>> --- a/include/exec/cpu-common.h
>> +++ b/include/exec/cpu-common.h
>> @@ -111,6 +111,13 @@ size_t qemu_ram_pagesize_largest(void);
>>    */
>>   void cpu_address_space_init(CPUState *cpu, int asidx,
>>                               const char *prefix, MemoryRegion *mr);
>
> ... cpu_address_space_init() creates a single AS, ...
>
>> +/**
>> + * cpu_address_space_destroy:
>> + * @cpu: CPU for this address space
>> + *
>> + * Cleanup CPU's cpu_ases list.
>> + */
>> +void cpu_address_space_destroy(CPUState *cpu);
>>     void cpu_physical_memory_rw(hwaddr addr, void *buf,
>>                               hwaddr len, bool is_write);
>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>> index 43ae70fbe2..aec61ca07a 100644
>> --- a/softmmu/physmem.c
>> +++ b/softmmu/physmem.c
>> @@ -762,6 +762,11 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
>>       }
>>   }
>>   +void cpu_address_space_destroy(CPUState *cpu)
>> +{
>> +    g_free(cpu->cpu_ases);
>
> ... but here you destroy all the ASes.

I was thinking the whole ASes list should be freed because the CPU is going away...

Thanks/regards,
-Mark

