Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E5532213C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 22:20:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88395.166214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEIbt-0003rM-Oy; Mon, 22 Feb 2021 21:19:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88395.166214; Mon, 22 Feb 2021 21:19:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEIbt-0003qx-Li; Mon, 22 Feb 2021 21:19:17 +0000
Received: by outflank-mailman (input) for mailman id 88395;
 Mon, 22 Feb 2021 21:19:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tmM1=HY=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lEIbs-0003qr-K2
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 21:19:16 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e53f988b-14fa-4098-9c60-255ff6ed8701;
 Mon, 22 Feb 2021 21:19:15 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11MLAftA195557;
 Mon, 22 Feb 2021 21:19:11 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 36ttcm5669-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Feb 2021 21:19:10 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11MLARWv016618;
 Mon, 22 Feb 2021 21:19:10 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by userp3030.oracle.com with ESMTP id 36ucbwmfvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Feb 2021 21:19:09 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BYAPR10MB2678.namprd10.prod.outlook.com (2603:10b6:a02:a9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.30; Mon, 22 Feb
 2021 21:19:08 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3868.031; Mon, 22 Feb 2021
 21:19:08 +0000
Received: from [10.74.102.77] (138.3.200.13) by
 SJ0PR05CA0092.namprd05.prod.outlook.com (2603:10b6:a03:334::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.8 via Frontend Transport; Mon, 22 Feb 2021 21:19:06 +0000
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
X-Inumbo-ID: e53f988b-14fa-4098-9c60-255ff6ed8701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=FnSLpPpx6znBKYOeSTHZG3qtMo96LSccbYN8BJYyelU=;
 b=gLJMf9Jhk5UsG/bgP172QLJfDZjVM/PYP+ScNsGaNAJLzeX99SYKNO3sgS665+4Q0iw8
 N5rGkTFCs/+KGv772knK3kc5F0nZyQ8qvM9oWQ7d0LOQdTSk/owc+gml7dpTKb2oME8M
 v/42NNlsylG9dqhushyvuP6zJ/Iram1wyQfGKqKpXQiUh4YHkU+U30q6kcnmd5Uioen4
 UEnTg5Zc/ZeGaAI73wpwfK8fdHoiKYmynjvpLv5hqb+OzyBBl/giA0xiUG+jb/lnmyug
 3fiGcx3BdFAvA9XRCetR18iKo5uF3RgY8gommg2TU9t42N7PxONRogTiIag56M0QyvDv 4w== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=daxE374AKZ1UOri811Iq/KVgE7kKlLl24HunBtx9pfUrQbqu3Dc/7/2KvDI4n0DzgDaT3q5qnO0UFgHRK1bhWzF0qOGIUy7DeVPRO2VIIRPbjKPSO+G+3KeLONsjVlBjfuQp8/kFs2pbltg4N5fI80x7NQnyPfDHBaTsvfkf50n7PX9iQq2NWqQTxgzXdFwRJz+l0nUgG3e67ppjs3a5dPJSkJ7k1HE+hZvbMBTwkNwUDv/d8cBCg7OXMjgEz2p/HuI6Jvhf7SxINZpH9jRBOExj4EBxjtrcrpj/JSToRVmy0iNnNMFOw0ZgCYhdtgIXy1UHIj8NZJGIO8on149HmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FnSLpPpx6znBKYOeSTHZG3qtMo96LSccbYN8BJYyelU=;
 b=TkycPZ7uJfGIEZHBR6edQyKDpqQZy3jDcPsQJOogxXFPjQvQeWK1jZ0inuJA9Q1r1g/uxkg49XIBVgDQOlaIcIXw/XA76s/fBj5MqYYsEHgcELN7B3nLNifQshnUDQSLErnsLe9UVzyl3pkC/L3zYf56bf+b9ll6ibuSPbVHWmZ8SgibD219JuEv5guv/+WQHuq1ZQ4uzdtehNxLXEJktt4iL4Yv954QXJixBExAqa5EFhpzgVjcX8YZGnVD9NKQQRoytZorlmA7NnDkWeuxUelCz5JAlYY0YdPxBaMtHiMG3PyhUKeckcS/lKZGvMuSKC6zIbp//0fU2XDKKE38rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FnSLpPpx6znBKYOeSTHZG3qtMo96LSccbYN8BJYyelU=;
 b=tAIQA7Izq/1xyuI096wJKjxyLYhr09mswN2ndwC/nJU7EV2VNDqVkg+0NSyOi7HqClg3q3BHK6hO/zIQ2+BIoHBDrCMABdgvi1frYtAUbfoyiskUe3r+MU+d+M2m336CKGckEqzktXcDv/8P8pKcGiivLUgXJd2DD3oem7H7LBg=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH v2 2/4] x86: Introduce MSR_UNHANDLED
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, iwj@xenproject.org, wl@xen.org,
        anthony.perard@citrix.com, jbeulich@suse.com,
        andrew.cooper3@citrix.com, jun.nakajima@intel.com,
        kevin.tian@intel.com
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-3-git-send-email-boris.ostrovsky@oracle.com>
 <YC5GrgqwsR/eBwpy@Air-de-Roger>
 <4e585daa-f255-fbff-d1cf-38ef49f146f5@oracle.com>
 <YDOQvU1h8zpOv5PH@Air-de-Roger>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <ce2ef7a3-0583-ffff-182a-0ab078f45b82@oracle.com>
Date: Mon, 22 Feb 2021 16:19:04 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
In-Reply-To: <YDOQvU1h8zpOv5PH@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [138.3.200.13]
X-ClientProxiedBy: SJ0PR05CA0092.namprd05.prod.outlook.com
 (2603:10b6:a03:334::7) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87a97751-b4ea-4af1-eff5-08d8d7777d51
X-MS-TrafficTypeDiagnostic: BYAPR10MB2678:
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB2678AFC7F07AA6C03CCB88FB8A819@BYAPR10MB2678.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rasqxYmP6RhVylYeqq8HIpPLzMCozS5pLLJ235ngRJLYncZY6Cjvz+7ZkXtYeQHSjHSjASynA1du7xH0fOrXaOeLsEMz4d9IowfCoSRbLx3K3RHAPgA+Sbuy7FiIi1yK/3JZslAEnK9FHpP5mkIB7BGbf+jaJtvLy2y2PGQ0nF+O413g0y8lSqhiM78aM7nYyjiZsFFI1pJj6PpqUXgBjWCkrBctpbfZs18Ky5OfPngY4d0uPhEwQYMZGMIQeU3J+2TGNu+sULMXhnSGYNSloZ8jQSOeIHGdrPD84VFsCBrQAMkI/CozVaQScKVt7QP5cQvlW599Ija8e/RZfTHYLpMKGAk3uXMlNKx5CBKOdHrKqru4Pk/JS6fZ0+sFHTkUqMdIo5ekOUwYcO+/xxePvxB0Xae1tkXuPr5qXrqItEuksolnjLhmZmF1n60bVzn7r1MMkkReIVfZJkEqSLkqxGiwBFXaMkjKgNhEhm94Qi+VPy2qXqGQWwmvKF2hapr38DblvH7iwrc7nM0/IfpNYmi1ARHozyQU6XI4/OzyR2iMGCK/SXImDsbdvjgkK/YX1leMhiUUaqHkWFm/zDBXzcfvm34F6bi4l+ilp/Pes7M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(376002)(39860400002)(346002)(366004)(478600001)(36756003)(6916009)(316002)(86362001)(956004)(53546011)(186003)(16526019)(5660300002)(8936002)(4326008)(31696002)(26005)(2616005)(83380400001)(44832011)(6486002)(16576012)(66946007)(31686004)(66556008)(66476007)(2906002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?NEIyalJValNLNXFLOFFzWjFkNlY5UFcxZS8wYmEza1FFekZMWVV6dzZPeWNH?=
 =?utf-8?B?eHFhMnlKbVd0Q1lNV0IrQ2VlUmhPZE03bUhnajhsazUrMmcveGdjV0ZaMm10?=
 =?utf-8?B?ZXdFalRIUE52alB0ZWZsTVRqY1BPeEdhK2FzWFlGMW1aM0FxOGJESkxBNmtv?=
 =?utf-8?B?NTVOdWdjTzgvZ1F4Q1NEUzM1R1lqM3pkendqOEtkbGxwQWs1cUZEU2pOb0ZB?=
 =?utf-8?B?SEZaZitVUFZPY2QwVCt1NVVKaXJwRWVHUUpNMmdidURacFg2SlVtL3J2Qldq?=
 =?utf-8?B?RzB0VWhoMnJNSmU0MGxMMlUrQ21TeENTeTFxS08wV21jckUvUkNEaFQ1b3Rn?=
 =?utf-8?B?MXJCMk05KzE3clIxV0Y3dDJITVYzdmUzMnVoMk8xM2hHSFFZTmRnM28zQ3Fn?=
 =?utf-8?B?UjZQV3VDOTA1YlZRK3pXK0I1RkFrb1JyMjk1VjRvR2tsUDJMT1hUMlJ5aEt4?=
 =?utf-8?B?a2xqUUkwMjkvOHhFNWNUejVDK25EQ0k0VHpzWExaa1c5aTRQYnM2RmJZU0FK?=
 =?utf-8?B?M3NnSFFLcVdDZ0lPb2tZL2RsRCtBNTRPdTlIZ214aCtZOW1nZjlGUzVwcU9u?=
 =?utf-8?B?YmhqbjE1Y1p2dVJWT2ROU2tuRElOTnkvUDQ3NUVwTlpscFBGL0xXNzBmeXBW?=
 =?utf-8?B?blZiUjYyNCsyV1RhM0dsTkl5d3gvNzIycjR4MTBad1NLcG5BT0hmSXhkaDBn?=
 =?utf-8?B?QlYwUDV6QzA5UlFMaGtWY3hjdk9PRVVSYk1aSWRGUDk4ckw4cHJkTW44cHlt?=
 =?utf-8?B?L1c2VS9SZjNFWGhlMHB1SlRSZ3pSd2hVb3U4em16MXdxeEE1UW9leTB1TnpP?=
 =?utf-8?B?VXdTL3U0TFh4Z25zd3F5OUxvenh1ai9veDN1Z24wQ3gwT3BhTjZHay9mR1Ey?=
 =?utf-8?B?clcrWmVIdXlwZ3gxNVovTklrajFIOVljVVZ2Q3lwU05GZDZHRXZzVEZCQmpV?=
 =?utf-8?B?MHM4OXRqMW83UGR3bzkxaDAzOC9CZENGN2ZKck5FaUhsbXllZmNMVHozbzlT?=
 =?utf-8?B?bmJEeE4zc1dRSlBuNGU5dXRlbkg5YUlCWGF0dHhRelJ5S2lTVW0vQkFMY3dP?=
 =?utf-8?B?K1JpWEpkc0RteXQ5b2JYYVBZVW5SNHkzRDZOWG4rek1oZkJiQ2t1R3ZVcFcv?=
 =?utf-8?B?SmdVZWlYcmZOMSs0ZURsVnBENG43dGo3a1JHcmlCeVV2cE9ja2EwOSthWjdo?=
 =?utf-8?B?V3czVGxyZFJmZVNTa3lybUFQWWxjeDZ6aUdGMi91ZHd4Z1JPV21mWktyUzk0?=
 =?utf-8?B?WXkzZ1BESTlvZVo0L0oybTFyZTNqZTRrRkNwMnVhdmdsRjkzSzhycCtiL0o3?=
 =?utf-8?B?SElQaTQ2NGJxS2dCdVBITjFIZ3FDMzNSTFY5VDgxK25lbTdHTkM1b1lEek9y?=
 =?utf-8?B?UnJJeGQrSEtBSVlFK0VwazRYMHVqODU0ZU1LR2RVVWQxNnlBRTNoY2lWbWJ5?=
 =?utf-8?B?aXBJQnFuRjQxTFhQTVlSUmhTOTg5ZXBETGpHZnhCbnFLamxUTDB6Nys4aS95?=
 =?utf-8?B?YmFZeERUbzN1M1UrOVR1aFMxajI4eXRJTVpRNng4Ui9Ocm1MZHNBbTlkTzlh?=
 =?utf-8?B?ZEl4Rk1KNFUvOU5JUEZFV0JVUHoySUN0WGJhM0dnVnVINEErODdDNVY2dnMw?=
 =?utf-8?B?dVR2SFd2OFJpV0JMWEpOVStYckpHdWl4SVpXYmhMOWZTK0ovTW4zbkVqMHNh?=
 =?utf-8?B?S1dBYUpVUHNOeHhIc0JLLzhZRHl0Y08yei9LTnNDQVZjZ3RQRW1WZHRZSmEw?=
 =?utf-8?Q?JEU6xURdEtNVw/w8BwyWm5nKN+pfSsvSBTUGofX?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a97751-b4ea-4af1-eff5-08d8d7777d51
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 21:19:07.8805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 157n12+H0JGzC0el3/8G8HZm/tJnyRo0zGZe2EYZJqGkWzppTFOTAyuteBBbNR+4kVBB/Qf75V98SdfD45xL79i8mx2l0CTo4fxf1yGAwnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2678
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9903 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102220186
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9903 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102220186


On 2/22/21 6:08 AM, Roger Pau Monné wrote:
> On Fri, Feb 19, 2021 at 09:56:32AM -0500, Boris Ostrovsky wrote:
>> On 2/18/21 5:51 AM, Roger Pau Monné wrote:
>>> On Wed, Jan 20, 2021 at 05:49:10PM -0500, Boris Ostrovsky wrote:
>>>> When toolstack updates MSR policy, this MSR offset (which is the last
>>>> index in the hypervisor MSR range) is used to indicate hypervisor
>>>> behavior when guest accesses an MSR which is not explicitly emulated.
>>> It's kind of weird to use an MSR to store this. I assume this is done
>>> for migration reasons?
>>
>> Not really. It just seemed to me that MSR policy is the logical place to do that. Because it *is* a policy of how to deal with such accesses, isn't it?
> I agree that using the msr_policy seems like the most suitable place
> to convey this information between the toolstack and Xen. I wonder if
> it would be fine to have fields in msr_policy that don't directly
> translate into an MSR value?


We have xen_msr_entry_t.flags that we can use when passing policy array back and forth. Then we can ignore xen_msr_entry_t.idx for that entry (although in earlier version of this series Jan preferred to use idx and leave flags alone).


>
> But having such a list of ignored MSRs in msr_policy makes the whole
> get/set logic a bit weird, as the user would have to provide a buffer
> in order to get the list of ignored MSRs.


If we go with ranges/lists of ignored MSRs then we will need to have ignore_msrs as a rangeset in msr_policy, not as (current) uint8. And xen_msr_entry_t will need to have a range as opposed to single index. Or maybe I don't understand what you are referring to as get/set logic.


But I would like to make sure we really want to support such ranges, I am a little concerned about over-engineering this (especially wrt migration, I think it will need marshalling/unmarshalling)


>>> Isn't is possible to convey this data in the xl migration stream
>>> instead of having to pack it with MSRs?
>>
>> I haven't looked at this but again --- the feature itself has nothing to do with migration. The fact that folding it into policy makes migration of this information "just work" is just a nice side benefit of this implementation.
> IMO it feels slightly weird that we have to use a MSR (MSR_UNHANDLED)
> to store this option, seems like wasting an MSR index when there's
> really no need for it to be stored in an MSR, as we don't expose it to
> guests.
>
> It would seem more natural for such option to live in arch_domain as a
> rangeset for example.
>
> Maybe introduce a new DOMCTL to set it?
>
> #define XEN_DOMCTL_msr_set_ignore ...
> struct xen_domctl_msr_set_ignore {
>     uint32_t index;
>     uint32_t size;
> };


That will work too but this is adding 2 new domctls (I think we will need a "get" too) whereas with policy we use existing interface.


-boris


