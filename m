Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C72349CC8
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 00:17:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101562.194378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPZEA-0007k8-Gp; Thu, 25 Mar 2021 23:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101562.194378; Thu, 25 Mar 2021 23:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPZEA-0007jj-DU; Thu, 25 Mar 2021 23:17:22 +0000
Received: by outflank-mailman (input) for mailman id 101562;
 Thu, 25 Mar 2021 23:17:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dmdg=IX=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lPZE9-0007je-CW
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 23:17:21 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0980db8f-52fc-4139-ae98-c5dc2e07fb1b;
 Thu, 25 Mar 2021 23:17:19 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12PNFEo5135131;
 Thu, 25 Mar 2021 23:17:17 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 37h13rref6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Mar 2021 23:17:17 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12PNGIVr029107;
 Thu, 25 Mar 2021 23:17:16 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by userp3020.oracle.com with ESMTP id 37h14gdwyj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Mar 2021 23:17:16 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BY5PR10MB4242.namprd10.prod.outlook.com (2603:10b6:a03:20d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 25 Mar
 2021 23:17:14 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3977.025; Thu, 25 Mar 2021
 23:17:14 +0000
Received: from [10.74.101.239] (138.3.201.47) by
 MN2PR01CA0038.prod.exchangelabs.com (2603:10b6:208:23f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Thu, 25 Mar 2021 23:17:13 +0000
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
X-Inumbo-ID: 0980db8f-52fc-4139-ae98-c5dc2e07fb1b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=j9wkUCORkX/lz7apVR880/LJ25oSKh6Y81+b7CDAxUo=;
 b=ijKMJLUy3siQasSfENAyPszm8XxXqM/xiG5oDY8gqobjROvIdNDqy8NxDtlRKmhPyJnO
 v8ONo+X1CZXKR7vfksqbcCiL61vpwVmaxZA5SBdpi4ayLpAw1ZicMDOc+saSXqPbq9gl
 MAgL1b0BtKeJyXSeSdATtTkbgZrSuyWfmvZvYqRkrG0SXPs48pa+T5/9qbKPaR9lCeqr
 fqo3GywXJDKPZThocFUNJDcO7N9P3QgvOtl+s5SpJc2DbWiba8wDXBffPtPMeY42JD1M
 t0l+iwKTsxOX4S0spEnbgPzgXQUWJc1peQ0ADmDBaLX8gdpItWsZio7QMk/8tT1zzUCo Aw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnjiaohNTQAy3Oax0K991AdNAEvI2Qy0s0YLG0dyCyvcm6b0y22/+hc0ehqEVzckVKo7thft9TyI34j7naxjeZ2wwSZp37qRkkoiFikAQYcDBOqZv8Qj4z2LoT86imwR7wApACnlMCk6wrUv/lMSehKSv2y7Rrdgg6rK3Nrgi5Onl6FuDL8CCRxdhHIoyRZuB1H7rxNs+ypCGTwPygSNCheBm3uUDDhqCv4sZWR1afOWcM7T7baOrOfgdThCD+XqPBBcPIOYJXsEleeH7CNNjWw0MtBI4WA3jEOYpZIE0+ypCcsmSaQsnZEIgytTwthaSCpBhUlX7WoGO53npgrfrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9wkUCORkX/lz7apVR880/LJ25oSKh6Y81+b7CDAxUo=;
 b=oUtBX/2MN3gSJrbkL82dsNlM0wqWV2hjeAzBYj2wzuI//PgR2plG2tiisD0HMz4qRYbEzIi2rvY5SoXIZlSTTMSLRF6N3n9Oq58r8UKiruZN+hG+wKF7NuWC3gaKbfDiyBjPHhUkQ3kS11R0SeMMLfsD2NdAQ4FIhU20cpfojwi878Ysnh5ezUw7O/SCzKWDpAcIlRxQWQnp0mDswvSGuFTm9HY4oYlTmmCu4o3gGUWufA9yo49d9Vi3BdOQU58zKfeZf17gK7NK5hC5u/TMlZOdMLf2snfrgTkkWjvujj9/KcoQ06TF4f11REzIp1XQX7hq+kmo7aw6pRM9KkBtzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9wkUCORkX/lz7apVR880/LJ25oSKh6Y81+b7CDAxUo=;
 b=wOrJvFMQy4L5VkrqGQkdTdPvdCECuTNQdJ4vXu2LHSkwXvCzj9C1uWmfimScxHePSI8dFL3x9ZO0vnjqFTYKyiVxS9Zyq8lAow3aYgDkFX71+WOp7OY6SakgXjs+baMKZSCzEYMCVifAP/26RFNAU3aQLtlFiWWmCaMMp36rM74=
Subject: Re: [PATCH RESEND] x86/vpt: Replace per-guest pt_migrate lock with
 per pt lock
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com,
        andrew.cooper3@citrix.com, wl@xen.org, stephen.s.brennan@oracle.com
References: <1616619905-640-1-git-send-email-boris.ostrovsky@oracle.com>
 <1616619905-640-2-git-send-email-boris.ostrovsky@oracle.com>
 <YFyiyzyJ8HreykuC@Air-de-Roger>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <8b72a5c6-e105-ae8e-f0c8-12330f95fe11@oracle.com>
Date: Thu, 25 Mar 2021 19:17:10 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
In-Reply-To: <YFyiyzyJ8HreykuC@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [138.3.201.47]
X-ClientProxiedBy: MN2PR01CA0038.prod.exchangelabs.com (2603:10b6:208:23f::7)
 To BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ded7e07-3524-4d6b-130c-08d8efe42032
X-MS-TrafficTypeDiagnostic: BY5PR10MB4242:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB4242E151FE2481E1B871748A8A629@BY5PR10MB4242.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cFC7fSBISRdTpE777I/ChNYMWA3BSYnMKRy6vpPwQLGVPffDkkyvDr1gPcswf1BA0zhNSdKmy2ZxlrmfrDK0lzvL3h8QoVZDQ0mYxEk9NnOFMMWIVZTf5oQN6r2Igsfgw0CwfaYqAGoIMEtFJsVbq3SZa4hxY+MLoXUZGieouDUESCB5it2OvCSy9Egbspa6TxY5t9qxjzYQoLNTZSh3UW6atuAM7W5nlOU6qsgYXu9ehRAndnA89Q7MT0s0LPyR16zMiCKnksw/O18BUgEkoRLPhzG/hyAUxnT1E1fmZWot51Q4f1cYhgPIbjhVqiL9hAHTBoonyTeLTzPf/xaJu8xfRV9s6TmlqMEuR75A/VWNzPJSQTPeHR7ld+JLcpvW8X8a8XifKtuBDef5hlQt/AqtgmdvLY4/AadLau2TsNM8rkgpD0qTejVPo498fRg7zAKQG0ZWFbGaqdhepzD/nbrfRjo18k+3UCol6uvdWNHTc84RkFQ05qrvKFq+RVhPXpvTXBlLQm5DKVpjDjp+AVVkd+huaFWlY5/Csw+QTuMGTnXCorYm2Wh6HeEprQ8/RMZCEplgRa9l9rd7hs9GqICZBelTt2eUcu4O7fnwcdqeVek+ODIA++Su+VQuoESj50NZLgLGZ97TIzHQpJExZN3Ms46N/hggorKg/OIo4es6tYxvZq05H6ZAHEyGkQZ/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(136003)(366004)(396003)(376002)(66946007)(36756003)(86362001)(38100700001)(31696002)(66556008)(6486002)(8936002)(4326008)(26005)(66476007)(31686004)(478600001)(44832011)(5660300002)(186003)(316002)(6916009)(2616005)(2906002)(956004)(16576012)(53546011)(8676002)(107886003)(83380400001)(16526019)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?aHk2cXRaM2wyNCtYWXZuZUZOWDN3blhtRFowNDJEVHVRSm9sOEYxdENJbk9T?=
 =?utf-8?B?RU4zYThRQkx6ZERQWHRRRGJrTSt6QUdDWjFSUnlMZW10RkNTbVFCa2w0aGJi?=
 =?utf-8?B?dGl0SnViQXFhL1IyMkFLc2lLMmpTUWdPdmlGV25sOXp1U0VCTHBkUmNmeU1x?=
 =?utf-8?B?S05NeTBvZlNuZnJFRVJVV2VJYnpGR0NkNkJiQ240WndxZ3dWeXhPTUY5K2k5?=
 =?utf-8?B?c0dNeGJzRXY4dFhZTlJVczUyNy9Delh1WEFMT2pZS09OaUxtYUg5eThmRkJy?=
 =?utf-8?B?T2xKMGNyc2tJbk5qM1RsM1V5cjhYMXgxaVZwNkpqaW1KaGFyTzNvckF6eU5t?=
 =?utf-8?B?L3g3SzlaL0RvYTQ1K3lMeW02VzJ2RDd3R2YrZlNDa1RIWW1abFpLWEkrT2Jl?=
 =?utf-8?B?RFFXREtxUXBxRnJ4ODFNeEhDU0lJd0JVbmNZM2tFNkk5SEN6cVo3b0lYdFgw?=
 =?utf-8?B?ODdQVEZSQnprS3AzNHhXL1R3dS9zZ1pNYWE0ZGgrRmU0eXVJd0JHMWtLeHFh?=
 =?utf-8?B?cWRQQ0hiUStqblJtOU1zSk5BZjJMV2VSMTlLUDFiM085TmVBZTBRanVmN2JU?=
 =?utf-8?B?UEg0Z0o3WDF4OVBaYW5Wb0JET3ppWVVidjJBQUVYSnNKRFF5bmZ0T3BUK0Nr?=
 =?utf-8?B?eGxrMW9vVWRVTFplbzM0cm15SzFMa2Z6YUMwVHpyNDJwQzFtZHR1Q3Mybmc0?=
 =?utf-8?B?V0ZmSXIrT1BuT0FZK3pSU3hqZ1JEeE9aTllNUzdDSmppdkNNZ2UyTUNWZysr?=
 =?utf-8?B?N0JXNTZHODhpUDcwZm5Va0E2UjI5YTRUNnNLRmpYU1lvS0dEYXVjeHJUNGVn?=
 =?utf-8?B?U1UydTNoTHBmRVlxbnlhcCtTZXlvd0FhcHJwdzU1WWY2eHJ1a2pkQmNLNjMz?=
 =?utf-8?B?RmNhMExhb3dETlRLL3Rab05iZ0lUZC82RGp1eWsvdTVlcm9sVWtHMWxvVkNj?=
 =?utf-8?B?dXlrWFB6RDB4MysrUXFnZkVzcnVnYm40S0M1RkJpKzZNNElWa1RSdmo1ZnFP?=
 =?utf-8?B?dDJvRmNsSEhidUtGZTMwcHFGN3czYzVkZjd3MmFGTXk1ZHlSQjE4NzhSb250?=
 =?utf-8?B?OEtyM1NIN2N6VjNNdjBvdGhzV0duMWhJakNSeXc5RTcvTVhTbFJ6ZjRiUUxJ?=
 =?utf-8?B?ajVZYk1YdnRTMmtLMUo0VXdXVk0vdUhwYi9VT2hvRUhadndjSlZVZjhPV2hR?=
 =?utf-8?B?cWl4RWhhK1BPeWt2VGVkSHN2VjUwSGF3RENTOEl1VTMwT05kRHJFT051SEY5?=
 =?utf-8?B?OGoxdlFHOXJWMmVwZzRHS1paQnhpeTRZQWczSkFLM3JrUjFaTUx0MWVnN3lu?=
 =?utf-8?B?N2l4NG1xUG5XYklIaEYrZU1WdG1YQ1daeFpBd09xM3I5Y25rTGw1YlE2dlpM?=
 =?utf-8?B?amVqZlFlWGlXTHA2UXFjWEU1VEVGOTludmtmRlkya3lidWovZmtmUFR0d0xi?=
 =?utf-8?B?MzZEK1lmQ3FwUk5mNHNZdXBKM1ptYXk2aDRtL2lvV2tTeWQ4N3FFdHFqazls?=
 =?utf-8?B?T3Zab3dlSUIyeEJmdWp6bGxHb3pGQm1vNjAzQTdTMUp4aGpVazNrN3NsNWJi?=
 =?utf-8?B?a3RtK0VrU0tUODdTSmtPV1pGTWFjZzhsUWJ1YVRDYmMzU1p2V0ptSUtpVmRr?=
 =?utf-8?B?OVF6YUg1VHkwaUhoNmkwaHBFVi9kZ2JJVDJqeU1SeXpQRXYwdUdLdWRMVDIw?=
 =?utf-8?B?dzVqMHh4ZVAyTDFKdDYvZ1VDU0lzUWJoYnpBOGxGQk42d3lyRUhlbUZYV0JE?=
 =?utf-8?Q?nyYVAoiXrbYtDyCbAnEzXc/7csi1cjS4EDyY/3V?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ded7e07-3524-4d6b-130c-08d8efe42032
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 23:17:14.5948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/xAFS76KwzIW+t1E53BKsFk3uHsWlrsNSZA4nFiU07QjBapEiRvTGq3K0JWEsfmERM4bvd+6pIGcDd+lv/H6cB9Yb8tsOCMXtis7AEvuXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4242
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9934 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103250172
X-Proofpoint-ORIG-GUID: T5jEK2I7wM-PXse9TnqSpRlt0LQ2Eo4A
X-Proofpoint-GUID: T5jEK2I7wM-PXse9TnqSpRlt0LQ2Eo4A
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9934 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103250172


On 3/25/21 10:48 AM, Roger Pau Monné wrote:
> On Wed, Mar 24, 2021 at 05:05:05PM -0400, Boris Ostrovsky wrote:
>> Commit 8e76aef72820 ("x86/vpt: fix race when migrating timers between
>> vCPUs") addressed XSA-336 by introducing a per-domain rwlock that was
>> intended to protect periodic timer during VCPU migration. Since such
>> migration is an infrequent event no performance impact was expected.
>>
>> Unfortunately this turned out not to be the case: on a fairly large
>> guest (92 VCPUs) we've observed as much as 40% TPCC performance regression
>> with some guest kernels. Further investigation pointed to pt_migrate
>> read lock taken in pt_update_irq() as the largest contributor to this
>> regression. With large number of VCPUs and large number of VMEXITs
>> (from where pt_update_irq() is always called) the update of an atomic in
>> read_lock() is thought to be the main cause.
> Right, seems like a very plausible analysis.
>
> Since I suspect most (if not all?) 


pt_restore_timer() (called from the scheduler) also contributes a couple of percent. But yes.


> of the performance regression is
> from the read_lock in pt_update_irq I think we can remove that without
> doing such a big change to the current locking logic, and instead
> merging part of the logic that you detail in the cover letter without
> moving to a per-timer lock.
>
>> Stephen Brennan examined the locking pattern and suggested using a
>> per-timer lock instead. This lock will need to be held whenever there is
>> a chance that pt->vcpu field may change (thus avoiding XSA-336
>> condition).
>>
>> Suggested-by: Stephen Brennan <stephen.s.brennan@oracle.com>
>> Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> So while I think this is indeed a working solution, I'm not convinced
> we require a per-timer lock, I think we can find some middle ground
> using both a per-domain rwlock and the more fine grained per-vcpu
> lock.
>
> Basically for type 1 accesses (pt_vcpu_{un}lock) I think we can safely
> drop the read_{un}lock call,


Yes, if that's the case then current rwlock should be fine.


>  and remove the performance bottleneck
> while slightly adjusting the functions that modify the per-vcpu timer
> lists to take the per-vcpu locks when doing so.
>
> I've tried to convey that in the comments below, while also pointing
> out some suitable places where comments can be added based on the text
> from your cover letter.
>
> Overall this should result in a smaller patch that will be both easier
> to review and argue in terms of inclusion into 4.15.


Sure. Thanks for the review/suggestions.


-boris


