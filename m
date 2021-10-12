Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F6942A928
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 18:15:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207518.363386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maKQx-0003Cc-2e; Tue, 12 Oct 2021 16:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207518.363386; Tue, 12 Oct 2021 16:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maKQw-00039j-Ut; Tue, 12 Oct 2021 16:15:18 +0000
Received: by outflank-mailman (input) for mailman id 207518;
 Tue, 12 Oct 2021 16:15:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kpIn=PA=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1maKQv-00039d-Ti
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 16:15:17 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21660f23-775b-422f-ab77-f889ebd5cd07;
 Tue, 12 Oct 2021 16:15:16 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19CFiuxN020990; 
 Tue, 12 Oct 2021 16:15:14 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bmq2vrk7m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 16:15:12 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19CGB8Fi078495;
 Tue, 12 Oct 2021 16:15:10 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2046.outbound.protection.outlook.com [104.47.73.46])
 by userp3020.oracle.com with ESMTP id 3bkyvae1m4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 16:15:10 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 16:15:07 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::2848:63dc:b87:8021]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::2848:63dc:b87:8021%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 16:15:07 +0000
Received: from [IPv6:2606:b400:400:7446:8000::222] (2606:b400:8301:1010::16aa)
 by SN4PR0501CA0130.namprd05.prod.outlook.com (2603:10b6:803:42::47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.5 via Frontend
 Transport; Tue, 12 Oct 2021 16:15:05 +0000
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
X-Inumbo-ID: 21660f23-775b-422f-ab77-f889ebd5cd07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=KRmP6MHFP6gso1JruxBlXhR8OhZX1XZEgiFtRP6a3ps=;
 b=apvc2lsl6M4AHzbe3CnHpnGK2JJglnDvKHnO67tRM4CHM0oVl5x+XAJpbHXMd2zkLGri
 hEUwjIOcMDGjmWHfR5QNf69C6O7EsmFw9rVRWDrq27r3/cPKj11ZgYPXjk6xd4Ejs6y+
 xvNAH9RoyPkv2+6tdSxPsp2GvNS//lOJz/JpaWNYNUzEYsoBVt5KfAycL6foVI4TothB
 fS9z4ddKDARQsR0jWxEyARux7j23vEJMkMjTPgLHVmPC/Ao80kNeqqEFG4Y6WHfr/XZn
 X9RYFm1lAjA/Myhv8kBAJuTVmWJ1solxaxEBjDAiBXpidXF6zeQUOSWqc7bHLm1K45FJ nQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mB0NkFpTbufLWKDaqEHweE4YfpwGzy9CbegfuFswOVkO4q9U2u4dbEiVzTtmCxC2Vu7ymUE4Y7BOM+zLpzkAemYuLa3auVI15orqNTFU5Y4i6WAiBU8drxJPU+lLEmt2B3xFa80yf4XEoLHk69qpb0j6Lcc7E9G2OmY1pX53dythr2rsXc5R+ej00Fyt5enQCbnDkhhB7mk8IfJo0lxu/tP5vX4kQb8kV4m6iaBUUzejJaghLTKzNF+XnVxiUYGDup85JkuQUt7YV0/a/8MDRdaMHzvGHwSl2stbkdk2llwODmYZ6uLTc7fAe/5X5tOewvzB75skk5Op0lvNkOb4OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRmP6MHFP6gso1JruxBlXhR8OhZX1XZEgiFtRP6a3ps=;
 b=Sbq6esfJtlH271zy5k6wQeTBVn/v6yD3qYUW1Ljb3wKXmLvCDcojC6kZZhlc54gOlMZD9D9xPcsnrd83ghT4bw9XWiTx2bNP5UbDF22HYXVotUbamQXMIykkO4x7f/ZBmcl6eRY9nuUG+V50vur6b9jfeIcmi6f61MJstcz9FcLWe29kcBgBXpgqjGVCuscpSxNH39PiYE7YzgRH1u4rV9BwXkbXhQ7oTs5EAbSxxmL5+HY71srIDtso1Rsuvp7vNV9LO1GIpEuYX1t1HJxLAeIJLC4M1w0trEZelp7vNgHcwOcV9BKEWUCrl9Di/tJaKOD5/xjnvLZAMVxPOiyM+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRmP6MHFP6gso1JruxBlXhR8OhZX1XZEgiFtRP6a3ps=;
 b=S9q1ay794T8dds88mvsbm5P38UA9TUnZhJ2/ncwmK0biHC/R3Djby3vrr5LinFeEE3C2LnnVgEQroROAjn1YX7ixEGfoWspfhfBJa5XFC3OoARZNShpLPvtG8vYP4q+JqVHc9LvCpBqkUuDKnnwFSSF0CCsTxY8P6vN9qf5gyBk=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
Subject: Re: [PATCH xen 2/2] xen: update system time immediately when
 VCPUOP_register_vcpu_info
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, andrew.cooper3@citrix.com,
        george.dunlap@citrix.com, iwj@xenproject.org, julien@xen.org,
        wl@xen.org, joe.jin@oracle.com, xen-devel@lists.xenproject.org
References: <20211012072428.2569-1-dongli.zhang@oracle.com>
 <20211012072428.2569-3-dongli.zhang@oracle.com>
 <317163fa-f736-ccfe-40d4-b918ce2834f9@suse.com>
 <3e16648f-088d-5f62-03d7-ca744e913cbb@oracle.com>
 <8b31045b-dbb0-3ca1-074e-a12107b09159@suse.com>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <b9599319-0bbf-94b9-2a0a-405cd9a225a6@oracle.com>
Date: Tue, 12 Oct 2021 09:15:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <8b31045b-dbb0-3ca1-074e-a12107b09159@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0501CA0130.namprd05.prod.outlook.com
 (2603:10b6:803:42::47) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2de28965-bf03-4e28-a491-08d98d9b74de
X-MS-TrafficTypeDiagnostic: BY5PR10MB4196:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB4196EC0528692505640D9FE1F0B69@BY5PR10MB4196.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/JsiSTPzrTopROsHyX5RMwVfEFxbcD02FzHAllNWlNO0JXPp+VohpaEWj5SiqgJndytLwh7PFTlYfHjxAavyBgxr7wLjR1Dw7oELoiCCox4R9vGcTKkD950qHJqeOpB+9spF8I6JsdJ7AlA0HiF1UeTAUd+ApITvlxHSoi/qm8wdwJ8OboNv4EIbQ8sZ9agSFKRkP/1pGo2taBI31GecOSxb6WyXFnoSBtXaBsB4q/NnE0ixGZZW4b76ykmgd1Weu32i4AJISxQjHe6D3A4YibCwcB54Zcr+553IVY81kuSpVnKJt+yrwaglurWgB7+O6uePjlUMC2X+SyiiEYrBLeoniITU6Pvg0kLGAWA8Zi4AxjmiRx8VBPSXhdLmiT3MmI6fXYcmkYmGJXQzOQJKYZ40vaewEiDd5phwwTFyh1kYryM/fIW0f/ldR40xxr3ZxhIIUnAV1tzlNZepxEpnU3QnPYDWsUstBtXcM5X6aHiusVTysah4mVw9Jbtow0u03Uc/T/xsW9Lx+77I4RhTepJsBXmwBwMKl9uZSYUHr4RXEMrn6zF8ZeTNftYbiFDdgk1tGqNYSyvbk5HpYngqLGIzJCzOLPOgIJ6VxOdLar+UXGYnB2Dq3o/YgJXsdpsmu9PhOdHXAhokps6s0ZZM69ateSgnqaMwQz/WsDLjBVfs2jELio5GtndWzqiunQ7OHi/kV9LlrSTqTZc6dKdebLygy1jTGB6QvBJRpN6usY7PLDPyOcFC0rjqNo5BC9MXkQLmXva/xqIPtSDEZfOlmQ8QzsHo+Tydo13JXV8iIEY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2663.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(15650500001)(2906002)(86362001)(31696002)(316002)(6916009)(31686004)(38100700002)(2616005)(36756003)(8676002)(6486002)(8936002)(66946007)(66476007)(44832011)(4326008)(53546011)(186003)(508600001)(83380400001)(66556008)(14773001)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MjZ6ZFcwU2J2VmpEUWZQN0pVVUdrN1h2d2l2NkU4aitEQys1QkRJSUN5eE1J?=
 =?utf-8?B?WDRkU01yZ1I0MUFieFBDZ0E5eHBOckx5VHY1L1l1UjBlcERsVmhFOVpvM2po?=
 =?utf-8?B?U3BIQ3FLazlPRHFFYklrQ3BkVFZHRWFZV2M0bEJWMFJ3aE9DekZJbWVjUEd1?=
 =?utf-8?B?Z3Z6WThuNDY3YlAzOVlTcUNybWhWSkNVeFNZN3lyVXlKb29HaEVoRmluYkty?=
 =?utf-8?B?UU1xeFZYLzB5dXFWRzhScE4vbDRLY1MxR2dPTmhPZUQxWjNSWGdaTHFKSjlQ?=
 =?utf-8?B?Q0QzbW5WM05qN3UxUGpSUVhXQm04SnRtb0pPWG56WmV0NHBRSFFMQjFrMXA3?=
 =?utf-8?B?ODlIMlV1bVpvVjNxa3RoVG8xbXVISE0xb2pzclRnNVpkMUo3ZUtXeEkzeGJw?=
 =?utf-8?B?NmxsQS9uekhoaGRuY3hDb1haOUNUYklzcVppeVNVd2ZwYUNTTkI5a3dZY29v?=
 =?utf-8?B?Ym0zM25kbGRMZWtsdUIvV24xMjNrOHZBYWxOQjRESGN3b0wvTjAzOW1NM2Nl?=
 =?utf-8?B?QXRqQ200L05UNWVVTldaRnBTMTVCNnhyS2lhN280SVhQS0hxZzEyR3RBVG5E?=
 =?utf-8?B?QUFxK0RWbldrYVBRUytnL1lidG5jQm1RK25FWmk2VEkvZS9yQkR5djA3b1Vn?=
 =?utf-8?B?Wm9WVi9URGNObDdwV3gwOGNEOE1hajk0STNKN2ltTkx6b0VEY0tFV2pRaUZa?=
 =?utf-8?B?c1BiRitMNVJvUWI3TkdQMTFWcVptZHVzVzZjNzFsNisxY08yWXZLekFVRXRW?=
 =?utf-8?B?TnJjb2R6THAzNzRvTnBBVldaR0g0VnFKRXB6bCtVNjhLWkw5ajJjdkl5dDdl?=
 =?utf-8?B?eWFqZnR1bThtVXVVSEF4bkpWWTYyZHFqQ3lWSExXUkN1elBxM3BXN0NMTE1p?=
 =?utf-8?B?Q0FGakR0R05mVjRBbDM2QllRY2JtMWx3ZXA2eHREd2FYSXRpbDdRSXNpOWFS?=
 =?utf-8?B?eGVDSlh2QXZqNms3ZE5aVW85ZzNXaTJxN1E4SlA2TzN5eGxHcGRhNnBhc0E2?=
 =?utf-8?B?NkpkZmpaSG12cE41dThvQVp4YkxGVnc3b2FWK241c2VxRTZHTE9DUVl1Qkl6?=
 =?utf-8?B?Wm1mNDBXYjhOazk4S1R4RTQvMTc4OTNDVnMvYjJVUkxyOEpQT1IxZHd3MFB6?=
 =?utf-8?B?UFF6SHNvWkp0U2o2Nmlra240UVdSRWVIMFJndW5EMUZkOTRQMThMOSsybEk4?=
 =?utf-8?B?ZHh3YVNmREtyTDV5Tlpwdk5CK2FZb3ZPOGtJdVNOMzVuVXROWFJsSkdNajBj?=
 =?utf-8?B?YnlyRHo1Mmt6RmxnTS8rQnFkL25RZytYbktJYUY0WWprbHpjYzVoYUwyMDAx?=
 =?utf-8?B?Ty9lc2hPb0FwYStuV2h6bHpqeEt0Wk9xbGtZTCttWXozMWxsbG4wNFZKckQz?=
 =?utf-8?B?UnNQV2tjVmFKUUovd2hQdnV3VUVFamgrdGxJOERBejlYWXpDeGZPbTBwcW1K?=
 =?utf-8?B?VDBSaXVBUXRVYVE4MWI4MkxLWEtJVFphcDNDaEpLRGlOSmpXL0dHR296ZE9H?=
 =?utf-8?B?U3IwcmpkTnMrRHJtaHoxblRWZzNHRHN4QnkrMHUwd1UrUHEvYUF1Zk81WFB0?=
 =?utf-8?B?dGF5RkhYUVNFTEM4NGJmWkRTK2pGYUpoRWlndXpNMU9Tb0MxRGNBVDBPRmd5?=
 =?utf-8?B?MFhBYUhpTWxnaHhwNDgzZ2l6YUJzc25oK3BRaFR3TjRYSlo5ZG5aQUF0ZDd2?=
 =?utf-8?B?ckJvTHAzUVBDRlc2UU9GZXZ6d1V3OTdFbytxM2lSb3FWUzJncVIwS1dVMHla?=
 =?utf-8?B?eGlDRnVYdjA2c2o0dGNrak05d0lCbzdZNjRwSXpRSkVHbXlOMGVFdlRjNE94?=
 =?utf-8?Q?gRqHq+b2507AD7SvQyGQn0qBRrygYdnIagSxo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de28965-bf03-4e28-a491-08d98d9b74de
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 16:15:07.1970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KrIqCdyqkEO3ap2jDedOGnzusSkUYiqNpmvTSnRs/C/ai3jJUYWlE1g5xAv17iacbGWys+EkG041ODoNAaLMSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4196
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10135 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110120091
X-Proofpoint-GUID: tF3h6Cx5nOsjYy0yHXcG_IR1yG7nQMZ2
X-Proofpoint-ORIG-GUID: tF3h6Cx5nOsjYy0yHXcG_IR1yG7nQMZ2

Hi Jan,

On 10/12/21 8:49 AM, Jan Beulich wrote:
> On 12.10.2021 17:43, Dongli Zhang wrote:
>> Hi Jan,
>>
>> On 10/12/21 1:40 AM, Jan Beulich wrote:
>>> On 12.10.2021 09:24, Dongli Zhang wrote:
>>>> The guest may access the pv vcpu_time_info immediately after
>>>> VCPUOP_register_vcpu_info. This is to borrow the idea of
>>>> VCPUOP_register_vcpu_time_memory_area, where the
>>>> force_update_vcpu_system_time() is called immediately when the new memory
>>>> area is registered.
>>>>
>>>> Otherwise, we may observe clock drift at the VM side if the VM accesses
>>>> the clocksource immediately after VCPUOP_register_vcpu_info().
>>>>
>>>> Cc: Joe Jin <joe.jin@oracle.com>
>>>> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
>>>
>>> While I agree with the change in principle, ...
>>>
>>>> --- a/xen/common/domain.c
>>>> +++ b/xen/common/domain.c
>>>> @@ -1695,6 +1695,8 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>>          rc = map_vcpu_info(v, info.mfn, info.offset);
>>>>          domain_unlock(d);
>>>>  
>>>> +        force_update_vcpu_system_time(v);
>>>
>>> ... I'm afraid you're breaking the Arm build here. Arm will first need
>>> to gain this function.
>>>
>>
>> Since I am not familiar with the Xen ARM, would you please let me your
>> suggestion if I just leave ARM as TODO to the ARM developers to verify
>> and implement force_update_vcpu_system_time()?
> 
> I'd much prefer to avoid this. I don't think the function can be that
> difficult to introduce. And I'm sure the Arm maintainers will apply
> extra care during review if you point out that you weren't able to
> actually test this.
> 

I do not see pvclock used by arm/arm64 in linux kernel for xen.

In addition, the implementation at xen hypervisor side is empty.

348 /* VCPU PV clock. */
349 void update_vcpu_system_time(struct vcpu *v)
350 {
351     /* XXX update shared_info->wc_* */
352 }

I will add a wrapper for it.

The bad thing is I see riscv is supported by xen and we may need to add the
function for riscv as well.

Thank you very much!

Dongli Zhang

