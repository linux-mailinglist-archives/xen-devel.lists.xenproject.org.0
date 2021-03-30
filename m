Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F29934EA4E
	for <lists+xen-devel@lfdr.de>; Tue, 30 Mar 2021 16:23:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103548.197513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRFG2-0005KE-O9; Tue, 30 Mar 2021 14:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103548.197513; Tue, 30 Mar 2021 14:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRFG2-0005Jp-Ka; Tue, 30 Mar 2021 14:22:14 +0000
Received: by outflank-mailman (input) for mailman id 103548;
 Tue, 30 Mar 2021 14:22:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xmxL=I4=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lRFG0-0005Jk-Mv
 for xen-devel@lists.xenproject.org; Tue, 30 Mar 2021 14:22:12 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c2613fa1-64e4-4c20-ba47-67d24bcd6576;
 Tue, 30 Mar 2021 14:22:11 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12UEJ6jG136038;
 Tue, 30 Mar 2021 14:22:09 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 37hv4r7e3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Mar 2021 14:22:09 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12UEKo4v114781;
 Tue, 30 Mar 2021 14:22:08 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 by aserp3020.oracle.com with ESMTP id 37jekym2wd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Mar 2021 14:22:08 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BYAPR10MB3365.namprd10.prod.outlook.com (2603:10b6:a03:15a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Tue, 30 Mar
 2021 14:22:06 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 14:22:06 +0000
Received: from [10.74.96.157] (138.3.201.29) by
 SA0PR11CA0183.namprd11.prod.outlook.com (2603:10b6:806:1bc::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Tue, 30 Mar 2021 14:22:05 +0000
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
X-Inumbo-ID: c2613fa1-64e4-4c20-ba47-67d24bcd6576
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=hnP7IGQbW/1jxTwXpPFxZmKyHXY7XTWQhBlCiFkNxEg=;
 b=GKZ0sGdHnmA80OOGcMacXXcBS56StwQF0praPj+m0YFPMDJCGznbM4ZZ2qAAX3Grmj0o
 0OiB0rVMn+3j4c6HvYYMIXBZLcl7dOPrmhu8gLnnD519yasBuoZb7aBHvSfNOrSJ2fet
 foq7ZtpI/P5U1gQvu6PmFlLrtvjwgkSOYBIgkdppNKPTIxSSu2mosKDvxLST4mlUqOcJ
 P4wGzc+/9+5170OmQYJfequUaSHt96ZioW1Tbs+Cr23ozkTg8W8iT62rlwTTV2tnt1xz
 6eWLx8tL8SXaB5ZoxlKs+nyheeZ/mrro6Edp956/AM+Bq8s+fbkAns3io0tG29BIE5eP Ug== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdE4GKtw9Cv360rKb4Z8mm7ATo/lhxjmx8O5kVYM53SIl5wOKeahgJ+66ax/DsjBRD85QcYVGtGRfqXLU1MFqfeHYz5fQQCd0S9fCBCQuHIAg6BRj5jdEKXFJq10mGwyMT/Zuwu+Rjp4eaieUKTMWxr7faIXvOr/Ix9q0i5VHa6fNfK688193EXlhiQpkVobr93mgmPnYeo4xqMTxabcWm+fxAWwMe2dfDbb+amksQ5eDiTGTcgWO2ocxiICxGX75nJfcFQL3JnCTwOv91hjtrMLZHeqQNJTjPLZuhRwg4Z0pF/mRsjKvM8FEh4fCSR6Z4zjIY/MsAT3sk0sOQAsXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnP7IGQbW/1jxTwXpPFxZmKyHXY7XTWQhBlCiFkNxEg=;
 b=BRbgerVCX0WL93it/97Rp5JLBIKhUuTLnXBi0nrPShdZGNH82Kq66XXBZTxISKloaoKc4yaoV2qcoaVfMSO0nFOzK0ELKlBE5FZMS71+7mNIsPSagZDD8pLztyX2y7gVKKoNkWpecwN6hZziG+YTf49RYSvUPhOMGMDRloGujh4jC+LScH7fbFiM3bQW7W8+nwaOAncrz5OhV+DgsW+09P329a8raU6p0z9gXUA9JlowXDYzTD7xYGKyA3W5Mph26PI1/QfdCpu0xd0QOlGi9C5urzd7rO/4pVtb8CCw9k/m+RRQat/BlH5AEVSSmM7WyjlJf4bkQN3c4w168RaPYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnP7IGQbW/1jxTwXpPFxZmKyHXY7XTWQhBlCiFkNxEg=;
 b=JGwk1X0aYuBBtvcOxk2MzqNcQnLmPamH+IN5Tes3zVGcddrEvCxxteSOKd0/7vcsCE2M7N9UWblku9d9vvvyCaRbzNXVjpbzBJbzKZXJKIYk/diJocZP6/vN6/29URBTD86thFlUXEFSqd0Qskc9AF2t5fss8JpmgRXYHLnynLw=
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH v3 2/2] x86/vpt: Simplify locking argument to
 write_{un}lock
To: Jan Beulich <jbeulich@suse.com>,
        =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, wl@xen.org,
        stephen.s.brennan@oracle.com, iwj@xenproject.org
References: <1617052502-14181-1-git-send-email-boris.ostrovsky@oracle.com>
 <1617052502-14181-3-git-send-email-boris.ostrovsky@oracle.com>
 <YGLU78AZmN2SAIbV@Air-de-Roger>
 <7a2e901c-b14c-8969-3b9a-41874dd2a7c4@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <2604ea82-c41a-7927-a43d-452170f17a1e@oracle.com>
Date: Tue, 30 Mar 2021 10:22:01 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
In-Reply-To: <7a2e901c-b14c-8969-3b9a-41874dd2a7c4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [138.3.201.29]
X-ClientProxiedBy: SA0PR11CA0183.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::8) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af343cdc-3e38-4742-779f-08d8f3873253
X-MS-TrafficTypeDiagnostic: BYAPR10MB3365:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB3365E73C8CDBD59A8A07DE018A7D9@BYAPR10MB3365.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tdLEfWjHcb13ei8dpOZZ3XZ6kVQYf3wuVkcaumUTgAY38V+GMALKRU1puhmGsQPDyl88hlSdI7H+Gu3k/6QTgeAxDiOr7NxJwkWbvz0t4oXgMR/6ln6yS2Ol3QH7SzjHnG1VisYyWIdM+hq0/fowlTfU/cPO2dpJSTWMF+1XCCJcnXv1XcOmnYs/JE7FS2oRjGQz/7IFqD2yn6mELjt5ch6Onb4Oe18m2DSTAmX4Mm9LeB8ij5oqKN4FwTqe4ADmLQpWihlH7RVtH5vWyEzf7fjEcUPLdXZlDyFrvybr7YmVmSGaAWr1sOK34yoIinOnyMUQeUe3bX7FFVrHJKnQEJgVKJJzLnJAVg4LfWweB3DakLkSfnlptohgDRZGuXRmrwFgeSeEFg2bTfcb/AJtGOOAcqV32jZWh5Tj2kWj8Ss710yLedTgylNeN84aaEMh6Urf6e0z7eHmGCcdkg3KHOH0Yz/5PHe/l2phm+B24VwQF83D733N0b3TVnOu2GwNHedbpCHVNPPQRcP52XyBhm8HllQBl8T5oPTVm0uBoE4EqOhLuo8O7hPSJNiCuZLeGyJUej15fOO7QG9enut2yjEmrQsBy997tmyBMX9mVx0cU8oPMw533ptbPanfGVHVBYS0fR5JCpbVZi3Xy9g1O48/TNxo7ogSbY4OhTHJAd9TfEfoQXXAHCnWDFadZApqWUE8JYPQhaSNtYMHlMyBlV9EkdARU4Mg0ERluxNSQTw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(346002)(39850400004)(366004)(376002)(36756003)(53546011)(8936002)(5660300002)(66946007)(110136005)(956004)(2616005)(66556008)(86362001)(38100700001)(186003)(31686004)(83380400001)(478600001)(6486002)(16526019)(66476007)(316002)(16576012)(6666004)(4326008)(26005)(2906002)(8676002)(44832011)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?TkxGdTVldlpscHlHUlNlRDhZa2M0SVRyclJCNnkyc0NQZW5Ub2RkQVVoWFNV?=
 =?utf-8?B?QmVQQ1NkZysyd0dmaW5kZUowOXJVeGt3cTJuaEpIcmJvRHN6cGhLSktCaE1p?=
 =?utf-8?B?V2FuNHlnU0crRDhuU2F0YmVldzNpZFZrQi9ldEp1cFB2dTJSSUx2OTdiK0pO?=
 =?utf-8?B?K1lITm1FZ1FIUklybm10MVNpQWIwM1VaT3ZqOGRSbzRCbnNXUmxPYmcvRkpB?=
 =?utf-8?B?RXhlcHNwVWE2b1lRQitmTWxPbTJVQnRHZUhpSVpyL2JRZEozY1kvdHcwYnJE?=
 =?utf-8?B?bWtIZ2wrOUZhVFRHaER4eVQ2cjZ1ckhQbUt3RjA2ME80eFZKVEJNeFJCRnNh?=
 =?utf-8?B?WklyZ3hlZUU0VHBueFNubGJtUjgwN1BnUVcyYldqejZhaVJtQkxBOWQwSjd1?=
 =?utf-8?B?NUMrYWM2SlVMODZLTndWcHQvTHVKZTB1RXl0dEg1MGxxdkhmY1krdG8yMnpt?=
 =?utf-8?B?d2h0Nm5VVDI0ZXFvb1FJVUN6WmpVQVFQdTBJSE5JNVV2RC80YmhFSzdrM2li?=
 =?utf-8?B?Q2N0SytMNHZ2UXR6ZHlWcU92OW9PVVgzOU1YRTVtME10OHA3OUs3Zy9mVGp3?=
 =?utf-8?B?cmZvQlVHaS9zY0pXZEFiRlM4djBDUWFzNUM5NkNVRDIzM2VjMCtnVDlKT2xj?=
 =?utf-8?B?R3pqa2p1L1JqMnJLbmVkSDlwK1pXdVFzYTdQaTZJb01Bc0xCR25PZlhNdjBq?=
 =?utf-8?B?T1BlWDk0TmNpajU1RDNvcUdCZU9ONXgzbGZ2OEg1czBqTXBXbnlNUVZEbEto?=
 =?utf-8?B?bmdIZW1oSnZUSm5sREQvSlc0YkRJbHhIWE5Eb29CdUFiWTZmRmxjVVVEYTJM?=
 =?utf-8?B?Z3JWUUdJTHVYQTNXSXNmTnRVajJybE1jbDd0amsyS09hUExucWQwcDZMb2NF?=
 =?utf-8?B?STRTczdDMUNObURmUGVnYWtUNEI0ODR6RG1EUTBONlZZcXdlWlRYVkxpY3RR?=
 =?utf-8?B?YVZHc1ozbEhpRmpnSUNTL0RoQnBRRGlVWjYvWHFmNHVTN3BoQ0ZrVXAvdHBk?=
 =?utf-8?B?a2JHenRoN1BESXZpQTU1L2JiVGFBcjlDd1NuTW1vU3U3N0dQME1lMnlxR00x?=
 =?utf-8?B?T3psL0JWakQvYkpEK3pFNXhxOXFCOS8yYUdQcEM1NVpGMnNmS1FOdFFMTHhv?=
 =?utf-8?B?QkFKTWVQY1Y0U0NKZUhkR1ZHM050N051ajIyR3pZUVkzY2lkei9PS2VXb2lR?=
 =?utf-8?B?ZDJhSUFod3NGRFNRWU83M2hna2docERwR2FCeXgvTnBoVUp4L1NiMlloVHBo?=
 =?utf-8?B?Q25aVlhYa0xQWTQ1QnRjM3dwdzdpdzM2V0R0NGloaGFDVkx3bnp4LzVNYUFt?=
 =?utf-8?B?VW90WkpCNW5NalRNTFFHWmxkUUtXSjlHZldML0F5Vk8wYUMreVB0YXBUNjVt?=
 =?utf-8?B?bmJIbzZnSE01LzVDUHFxOEoreFozNk1kclI3b29RMS9lM2dXdEppTUNhNGo4?=
 =?utf-8?B?U1Z0bCtxbWRNTHZjTHlucE9OUVNpR1pOaFdZbjFkaG1FdERHRlRxTG1JK3c5?=
 =?utf-8?B?QWlDOHBPaDR1QkRnaENwOWd1K0ZqZ2EwNEI3bTNNTVMvSSt3dUM0OHoxejdn?=
 =?utf-8?B?dVNRQ2Y1UEVtb2dxdkQybWRkb2xTUi95RGpidEpTVFdxOHZ3aVdSWk1hRGd1?=
 =?utf-8?B?MjNyTWhkaHVzc3RwOHdKU2U0S29HcUFKTnBpL1psU2lremkrYXA4L0t6QVpC?=
 =?utf-8?B?WXpqMytwenNlYmdkNXZaQUUwNzh5NFFGL1lpay9qT21TMU1QQnBXb093YkhQ?=
 =?utf-8?Q?qZizQrePJjHnIohfSOfEdHJhmlRTk6+lQx4yfAh?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af343cdc-3e38-4742-779f-08d8f3873253
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 14:22:06.4829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FRvMYHGE3peZRDm7CK8i7kAbhnoHZMZIb3ISeRLVJ4qUjuz9kmzqzYIQIFohdZAfsds3XevzbmjRGErtNs8VJ936jCMjiHkEiR3iWMdJAKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3365
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9939 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103300105
X-Proofpoint-ORIG-GUID: dYf6NIq4Ymavq3-idlZJpTLteICTFA6t
X-Proofpoint-GUID: dYf6NIq4Ymavq3-idlZJpTLteICTFA6t
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9939 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 phishscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103300105


On 3/30/21 8:49 AM, Jan Beulich wrote:
> On 30.03.2021 09:36, Roger Pau Monné wrote:
>> On Mon, Mar 29, 2021 at 05:15:02PM -0400, Boris Ostrovsky wrote:
>>> Make both create_periodic_time() and pt_adjust_vcpu() call
>>> write_{un}lock with similar arguments.
> This makes it sound like you adjust both functions, but really
> you bring the latter in line with the former. Would you mind me
> adjusting the wording along these lines while (and when)
> committing?


Yes, please.


>
>> Might be worth adding that this is not a functional change?
>>
>>> Requested-by: Jan Beulich <jbeulich@suse.com>
>>> Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>> Either way:
>>
>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>>> ---
>>> New patch.
>>>
>>> I ended up doing what Jan asked --- create_periodic_time() is also using different
>>> start pointers in lock() and unlock().
>> Hm, I'm not sure I'm following, create_periodic_time uses 'v' in both
>> write_{un}lock calls, which doesn't change across the function.
> I guess Boris merely meant to express that there's already precedent?


Yes, that's what I wanted to say. But clearly not what I actually said.


-boris


