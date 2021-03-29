Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7002E34D346
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 17:05:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103099.196722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQtRo-00077E-46; Mon, 29 Mar 2021 15:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103099.196722; Mon, 29 Mar 2021 15:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQtRo-00076j-0O; Mon, 29 Mar 2021 15:04:56 +0000
Received: by outflank-mailman (input) for mailman id 103099;
 Mon, 29 Mar 2021 15:04:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bmwh=I3=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lQtRm-00076e-0Z
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 15:04:54 +0000
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b0480eb2-98f9-40b0-8926-832e9d5b023d;
 Mon, 29 Mar 2021 15:04:52 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12TF0pBb075245;
 Mon, 29 Mar 2021 15:04:51 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 37hwbnbugs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Mar 2021 15:04:50 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12TEtOL6124581;
 Mon, 29 Mar 2021 15:04:50 GMT
Received: from nam04-bn3-obe.outbound.protection.outlook.com
 (mail-bn3nam04lp2053.outbound.protection.outlook.com [104.47.46.53])
 by userp3030.oracle.com with ESMTP id 37jemvu3pc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Mar 2021 15:04:50 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BYAPR10MB3128.namprd10.prod.outlook.com (2603:10b6:a03:14e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.33; Mon, 29 Mar
 2021 15:04:43 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 15:04:43 +0000
Received: from [10.74.96.207] (138.3.201.15) by
 BYAPR02CA0055.namprd02.prod.outlook.com (2603:10b6:a03:54::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Mon, 29 Mar 2021 15:04:41 +0000
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
X-Inumbo-ID: b0480eb2-98f9-40b0-8926-832e9d5b023d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=YcjmxpoYNxxuOCKR2CDKfVORzpyWwUflamuix4CeWVU=;
 b=NK17fJXq+5lfJLXglSwFSM0M6GE2yzKBQSnUvr0lWC/4S4GEon+ShbjNHrQGVPDidpqW
 xN3a4JqEe9enxwACaHFX3+8fDyjQI9Q8qy05kVJnwe2eeJWA3i6NsDbazKvUxK1gRkA1
 UkBiX9eUoACXgdyJb058cekUZri4REbpAUKJpzSNGTCOENiEsw14ch4a/Q5tVgfY4SOq
 Ko4wJJ0cx7uP1QM9JQx8BxVojNqbqE/WmnKXphaiJj/gAc4qmn9tp4axGe9XPyEF34LJ
 ByfjBBEFmhU0skCRuLNpVNLdYSrHsx5nw416fwybnQi/g/o5/Wh8C9asECMB3fpMZzpA xw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odsUTMPBaHNkkha8p0cBUpDJK2uDHxEwSjeeK+f2K9WoeNutvPuBaozaZ1QfhOKph3SL2AlXFR+E4H91ffFYVT4Sj8fM/4PAmmvyI63ZI7A5dkG9NP6YQrjbxHit41BcctxrTCF7zobATKNUA9TBWIf/7Cm6UaLry7+UvkBacsYQftkBLQGzRJ0605YpGR0O2+FDhlkzC3LsRF/HiOTXwH91RIiBbextyiytmez9tJMXoYT7068m7tGT3ZdHi5TbFvOTVtQ31ej97MPqwuDwp/t+5DSk15nj62PjTPOobRtUaX39dK1AZbOZcZudDgnjkY/fSh2uVPpT8E+BUJdRGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcjmxpoYNxxuOCKR2CDKfVORzpyWwUflamuix4CeWVU=;
 b=OykIHJAy/tbzN2mzwxeGnrp4ft4RfUiNwOdZVgtKaVBnDT/IGjwJ0peCdviHFw3s/nhkP8FpEMi+aaWve5JjLIHlRY19Om4iCMFBjWKe7iYundEvaTMxVktq+zhqdE3NT2qg/sMHz1jYTOVk4JvmJ4BwLwp4k22AbIdzHk4pt8SYBmhms1MnBM9B0HyWmhgLAbK7JQgp3xIFRsbp1qGkEg6bOb+6+iZyMCxpyWs5VdizflpOiCKBCdxxomXNLBVIn62TJfcDqk1EfyqAAyzyiyoCqJLCcUj3+JX10OdCwNujFvVScZJNR+aJeyXYW9wjvyYq0cy2aPKl0Crtdbn8qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcjmxpoYNxxuOCKR2CDKfVORzpyWwUflamuix4CeWVU=;
 b=sLlYvOaaH7b6AvB5XT6AOxiPywOG5JoAso3XhtmsLsqlU9XAOwlt2ud8EBtaHLCNziHjKPTKCFo3SUsOI3T48jnuBDWTtP2vh5RJjOv9GdwZIs0MXsDI4PcO8WRJQSn5L8B4nO/rSnk3cMYo78lWfoIi1yzAVfzK/ZWo/DCndNc=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
Subject: Re: [PATCH v2] x86/vpt: Do not take pt_migrate rwlock in some cases
To: Jan Beulich <jbeulich@suse.com>, roger.pau@citrix.com
Cc: andrew.cooper3@citrix.com, wl@xen.org, stephen.s.brennan@oracle.com,
        iwj@xenproject.org, xen-devel@lists.xenproject.org
References: <1616809866-30837-1-git-send-email-boris.ostrovsky@oracle.com>
 <82868938-bf57-25c2-38f6-1ec8e9c92362@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <bd430cc4-4c57-e479-14e0-0b62754147c1@oracle.com>
Date: Mon, 29 Mar 2021 11:04:37 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
In-Reply-To: <82868938-bf57-25c2-38f6-1ec8e9c92362@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.201.15]
X-ClientProxiedBy: BYAPR02CA0055.namprd02.prod.outlook.com
 (2603:10b6:a03:54::32) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fede070-a58b-4d7d-df7d-08d8f2c3fbc5
X-MS-TrafficTypeDiagnostic: BYAPR10MB3128:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB312868EA96138E664BF150528A7E9@BYAPR10MB3128.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Xw+0aWfu9WOxkwcZCAcPnh43qAGdQeEuJBGtDF/CR7wJA5tbPSwN3IYKVBygUyLUHqPZ6x+ZuKOyUutwBZ5JGOEnZVA2uCM5xDCbMXbP9DYs+85+bcs3y8ogGakWb4aKD6R7Ig4f5xNokzORD1qzvrRGZyNgmNSxlSdQdq12mIE1Gl9ZGHT4JZIwhtJu3mb85EWgMTUNvEMjTjbFnooJij9hQpcLYV9U6MgaS6M5gH75rJOgS9GBLnTIPzACAPy/rCACJGlcJtOcbM2MjRw2Qtv7l40eUp/D51caDC4McWOXPpNUFEqT9yeau/DynT/Xs7ZVAkfRUybGcEybQJ8KBFVmbT6xE3pbHFxHsLiNCe4S5u3b2I1OKAcP/KM1LDZBtcLvkn4QrUXjGGoTyiYDOfeHrO1mR5qqnHnwsUZ0fRs0uyDMUv7+tTdI1ftIap2ZYCrdEpRdtbwyTtIQ/x2sEYVVGAg25kceJOllH3a/MAZgo4l0aGrAFU8bl548M5XQsuOD9y8r+R81ueXd2Sw/Bl8wWE1AxRWdLo+T61P3/3eYk/l0ttq/XjDWj2pYk9SliggN5pyDujqisZW6VjiLcLHspxpFT9MGNjEVDu4SJ1Yt8Hn0T9qWHRjjUmqPBt4JORVtDrnOAQmCOp73Zeg58X6OtiBadQvzI2FoFH0HTa9qn58ThW8B2oV33GIu3GtIr+0bla7fQax8kh1boC2iQAORPzLmsedFovHvWyNmrwQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(136003)(376002)(346002)(366004)(16576012)(16526019)(83380400001)(5660300002)(316002)(8676002)(2906002)(8936002)(4326008)(2616005)(26005)(44832011)(31686004)(956004)(36756003)(6666004)(53546011)(186003)(31696002)(66476007)(66946007)(6486002)(478600001)(66556008)(38100700001)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?VFlxbkQzQThBMWhua3hDeHM0WHBjdXNrVkw4M0VDbHRCWG1RU0NxRDRzRnBU?=
 =?utf-8?B?MjdIeDBHdDBpeWw3OGtrc2ZCcEpHRHV1Qmd2Z0pyQVRaNGUyQXgrVW1nc2RI?=
 =?utf-8?B?cUtPaEtvNnJNU2RlK1AzYk5RNTFFR2s4dGY3SzAxWkkrYUdDb2ptb00wdGRv?=
 =?utf-8?B?YkVBTi85SHd3TWs4MTFlU1dHWGhWenF4RGNBcEk4Q3FLVlFENUVnZ1dQVjVE?=
 =?utf-8?B?VnhBdEtsbVpZWHRQamU0N2RXbjFMZkhEenkvVk1GYUUwSzl5UmNiaTh6S3Z5?=
 =?utf-8?B?M3dsSjRJQVU0WjN0T01ZMVBsZnlHRkprM01zdXVqQy83QTc3anc2WjZkVVhq?=
 =?utf-8?B?MmRmd2gvTmlqNzZ1VnR6UTdjeHpvQUZHeVl5R0YxaDhQTGhPRnd0TEpzRklo?=
 =?utf-8?B?SWpVcGh4dlNjSzhRZUkySE1HdExjYVNkTzlsaXhqS1JpKzhGWlAwUFAvaDFK?=
 =?utf-8?B?OTByZGd5VnVoNURiVTZHRzhFVHVhZkJJSkkwQ3VEOHpSM05XM2IvUnhGVnhk?=
 =?utf-8?B?Nnc0R294OEhOQVQyQWo4OWp5SDlodVhCd0p3dGZ0T1VPT29kaDFwYXN2UCs3?=
 =?utf-8?B?dStxMHp0bmRaTW81VXhJK2U2ckpXcUNrQXlpYk9JWlE0bGQvS1lMNGtTSHFT?=
 =?utf-8?B?bXRjdHhCWFNtQ01uWGhSVWFQclFpbGI4cEZETVBKV3FYNEVBY3F4R0k3bVlv?=
 =?utf-8?B?SUlYZmpvc0UzTHgrd3dqY3k4Q0hXa25zNUU5aDVUeVdVdnR4NUcyeXlhS05k?=
 =?utf-8?B?SndLWXFYQk5QcXUwdEtaMGFMK0R0eHNyeWxCNWxtSGZ1WDg3b2U3c3JEa1M4?=
 =?utf-8?B?VHZzSEtFNFVkTk9mQnJCdlEyV0NaOTRybmFPVkJUY3l3ZFZJZUlVYXJHN0dw?=
 =?utf-8?B?MFB3RzU3b1J5Z0VSbGk1MjlrZ0Zyc2NySTJ0eEJCNmxUWlBIa0xjMkxhOU0r?=
 =?utf-8?B?aTRvNjVweVNLS0h6VklEU1BqNEtCR3d0UnQyRStuMzRabCs1QzBZaHhZODBm?=
 =?utf-8?B?MitIYTNZVEpYSHp0QW5nUGVCYURSNGFuWXpSSDl6NU9qc0Q1NEU3QVl1ZkRN?=
 =?utf-8?B?OE8xZkg4T2RHOVZoUGZKWlFkbHNmcE4vMjFtTFlDcWI4cGV0TFZ5OEZZM25P?=
 =?utf-8?B?NUpSRnExT2Q0N3ArbG1yMEI5RjQvRHk1eERPeXVIK3Q4Znk5VjJZTWYyQ2k3?=
 =?utf-8?B?NXBiWnJQclpGZ0RIVnVoODE0aG5qU21qcGU0R3Faams5TGZPU1BvbWhSUWx0?=
 =?utf-8?B?SGJraExDNWdoY05WR3RmR24yM05hYXFSMURyb21KYktuY3pqdUtNaUVuOW5j?=
 =?utf-8?B?ZU9zL1NyV0Z5ZmY1VnFuVTYwZUc0QWtPcnZTVzJrOEFvVWwrWmV1V0Q0VlR3?=
 =?utf-8?B?blp4WDJtYXA0dC8xbVkvOW9QZDJXbVNTQUk1MDV0RlRmTjhDa3VtUzY1SFJL?=
 =?utf-8?B?dWdxZjhJM2xzRTV2ZnFoQWZ3ZUplS2p6aE1JZFF5UUY5T1VJbVo3RnNFTzh5?=
 =?utf-8?B?Q0FWSDRGemZrdWY2LzMvNW54VEZVWVd6NXR1Y1Ric3FhU2c0SjZxMUF2aWxq?=
 =?utf-8?B?UTVJYlJvMS80em1QU0FxN3YrdDgwVHVWREozelM1VFRjWGlSb3liSXgveWV4?=
 =?utf-8?B?T1UvMHMrZGx4UUxGRWwzajV5VkNQb05vbWk3bXU0My9JVmVHbytZNzd6K1hP?=
 =?utf-8?B?amt3L1FGMTU3L1AvblFseWtUek8yQm5uSEpNekJzYmNEL3BRdHZjV0N4aWNw?=
 =?utf-8?Q?VWIQNEehi7Z53UGrE80uCrHX1UXlProsg8xbbre?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fede070-a58b-4d7d-df7d-08d8f2c3fbc5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 15:04:43.1337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HrLLC8wxYVamVOyfvTyKjgx6VBkS0jBWJFbUZv88AqFdMcWr7k20GzoYqyHf2BtXx2cvQLa1DkCgy2EjW8qpebnzWeF8ANcB/xmBz/YhrE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3128
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9938 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 spamscore=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103290114
X-Proofpoint-GUID: vaOPPgaUptwYWqduW-DjzntWyzNmuYFD
X-Proofpoint-ORIG-GUID: vaOPPgaUptwYWqduW-DjzntWyzNmuYFD
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9938 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 clxscore=1015
 phishscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103290114


On 3/29/21 5:56 AM, Jan Beulich wrote:
> On 27.03.2021 02:51, Boris Ostrovsky wrote:
>
>> @@ -543,8 +554,10 @@ void create_periodic_time(
>>      pt->cb = cb;
>>      pt->priv = data;
>>  
>> +    pt_vcpu_lock(pt->vcpu);
>>      pt->on_list = 1;
>>      list_add(&pt->list, &v->arch.hvm.tm_list);
>> +    pt_vcpu_unlock(pt->vcpu);
> I think it would be better (not just code generation wise) to use v
> here.
>
>> @@ -580,13 +593,22 @@ static void pt_adjust_vcpu(struct periodic_time *pt, struct vcpu *v)
>>          return;
>>  
>>      write_lock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
>> +
>> +    pt_vcpu_lock(pt->vcpu);
>> +    if ( pt->on_list )
>> +        list_del(&pt->list);
>> +    pt_vcpu_unlock(pt->vcpu);
> While these two obviously can't use v, ...
>
>>      pt->vcpu = v;
>> +
>> +    pt_vcpu_lock(pt->vcpu);
>>      if ( pt->on_list )
>>      {
>> -        list_del(&pt->list);
>>          list_add(&pt->list, &v->arch.hvm.tm_list);
>>          migrate_timer(&pt->timer, v->processor);
>>      }
>> +    pt_vcpu_unlock(pt->vcpu);
> ... these two again could (and imo should), and ...
>
>>      write_unlock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
> ... really this and its counterpart better would do so, too (albeit
> perhaps in a separate patch).


Are you suggesting to replace pt->vcpu with v here? They are different at lock and unlock points (although they obviously point to the same domain).


>
> While I see that pt_adjust_global_vcpu_target() (the only caller of
> pt_adjust_vcpu()) already avoids calling here when the vcpu there
> doesn't really change, I also think that with all this extra locking
> the function now would better short-circuit the case of
> pt->vcpu == v upon entry (or more precisely once the write lock was
> acquired).


Sure. I'll add this (and address comment changes from you and Roger).


-boris




