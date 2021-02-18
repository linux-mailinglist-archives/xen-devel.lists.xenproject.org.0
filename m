Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BB231EAE2
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 15:24:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86657.162822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCkCv-0008WJ-0r; Thu, 18 Feb 2021 14:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86657.162822; Thu, 18 Feb 2021 14:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCkCu-0008Vu-TY; Thu, 18 Feb 2021 14:23:04 +0000
Received: by outflank-mailman (input) for mailman id 86657;
 Thu, 18 Feb 2021 14:23:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5S6F=HU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lCkCt-0008Vp-UR
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 14:23:04 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0feda2f3-a4b1-4026-8034-8425074e4bf6;
 Thu, 18 Feb 2021 14:23:02 +0000 (UTC)
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
X-Inumbo-ID: 0feda2f3-a4b1-4026-8034-8425074e4bf6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613658182;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+j0B3tTIqYe23JUhyzIlAO1rYhkU6ufEHOyZT/ZzWXg=;
  b=MoztygSU/W12US200XA++hK/hB93SPGh8omjyK7RXvJS4EHdywBCON+n
   r5PXeVstGysGiRvg/bSQyD1aOQ0n8drDqeFlfiyB0zsS+3g+yZT/XHp0w
   EwNZJNZC3tdgP0zn+4TthaFBddhd9bfjHhXP2K3cQk4Qs39P1ppByyqF+
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: oAQDl4fKCScSRfgYOmya+DHqRM0Xh4jDni0L6Md7I9GAwYKSz9gyFsX0+mQRpQHZPoYFlrnGZa
 XBrfVC73KThkpA9ndqDCPQfNLKZLzia+8ue9ngkpof0t39/ivTre8RZKUJvpnhU4WxSBSWr798
 tK63G3B040fSBU17gmfzFnGGksBEr4JdsBH71N9YgtiJMegDqE6G1PvF/tLWTrVM2pV3bYNDk0
 zHeRYYSZPQACMQlvHn5yURQWlmv5uRRCYIEaUGa7g3COs43mGFb4O2qisBtVReWormD7ncg/bp
 dsY=
X-SBRS: 5.2
X-MesageID: 37539209
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,187,1610427600"; 
   d="scan'208";a="37539209"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENhQGFML8nTZt0X7KD0LMERyNwfXz1aTfw5QB0s6aZunq4o+8RzUwFMjntuLh+Zl43R0UqM3xByULQPpq+NHXr/Z2vF5zquCaYSNAWnsALoiEnzi2U7Tgfo9eGtFcs1xgd1GmnDGkE2stflseI7Mvx3Ci6xpxUi2h1ZoyU3017peo15PLzEQ3BFgAWF/z96b9KnTpfKuYw4NoBjbx+lfz2K+wladantjk2n/uwEzeGP9UZ9Q79vsUcC4aPq8S4WFvXOGnv6N26lVnYp7nTH1B6it52zJPIr49ElxcEmIUPyzdwgysNAlruUobumOkmgOFL3wDmAySloCirN8FtshDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+j0B3tTIqYe23JUhyzIlAO1rYhkU6ufEHOyZT/ZzWXg=;
 b=At1P1c2iShszeFkOpN9tSgleqvEMmJhoFwSPfs0fBY8Idic88SxBjXyb2OtMwbozBk/+IA+3wMUfKeG/4yY5xPkYfoDZCNrmJoNhaXojflIstNNaA+akQF8c26WMNaWIvNStU59fWUO0+e2it9V9Epn6VrTa9yQGNCPAfh512yh1U2iWsZkUQxfpq06EvM5zNQ8crDbvha1YMRNKveCpDzxtPva12QFeefDbXab/petz+XJIoXU3qvCgHJdMY2D0jwxen7lh2VuOiuWIeMu2xCGYT7TSVGds+ZNeE1IWZnNO9c6bmp9x91bcTuth2Q1N5Hn2dYI+Mk0X3vXHn2ygCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+j0B3tTIqYe23JUhyzIlAO1rYhkU6ufEHOyZT/ZzWXg=;
 b=jI5tt/sfP7/nHfjFBK6tUWsCL2pu7kxsAzGlxWGkD7tT8bmlofCOdOBr6aTdh3xY3lcPdBuSvmnyohquDqJCoeATrVeEGWqdEzAkuMn0os/arBhk42uMFEoL74gjsKljQYrw9P5eB8lF5FiIRrVihyzT+IN8jpFT7PPxKvwvpaI=
Subject: Re: [PATCH 3/3] gnttab: GTF_sub_page is a v2-only flag
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <156559d5-853a-5bb9-942b-f623627e0907@suse.com>
 <2bf46266-785d-0de3-5f61-48c3fd191a5c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e00d9bed-20e4-b5a5-91e8-02f7a6689f86@citrix.com>
Date: Thu, 18 Feb 2021 14:22:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <2bf46266-785d-0de3-5f61-48c3fd191a5c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0409.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f01e0a88-b96f-459b-4911-08d8d418b04c
X-MS-TrafficTypeDiagnostic: BYAPR03MB4550:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4550975F5AE2A202EC448FFBBA859@BYAPR03MB4550.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t827W26ZAS/2g1JiCKKTN8gEyvyc4xunUGDPNpeU/qjqoBdeLPEWZ+gyxn44uQLhGOmw4tuZ6P2TV+8MEDmwG0tdCXMdziny5ZcKzT8jwfwgsaUupOkaSed/7bmRyMbDRHmzb6T78RL3SqRbTcdrCoFh2EYLVc6Rx8OFyC8Xdqd1ZAwTGIwnedqTVk3oyfeCXdI10d5Y7PQyK97PL9YiNkOlC/+X1a7S4c60a6eQRWD230zeEV4bxp2LxTIQ7o7peYXdY5H/NY+8pY++QbO+YV6m63pxVpFghTwhRzqsJiNJxGPRXFsY6iKCj01YF68mOlAzSMYr5fOHcwjTO/tsqvdgvZ96vrwSF7D3EAlqr++A+bT9MIF8Y+PwPkQc5w2t5vmBlF99IPwSlfWJWQhEAngmS++DyrRIq9pYLS7nhzNFOxw2v8D50n7khnHQdfF53KJNbFT8tlDcflFjqb0OXTqw0SEIFBHgq2EhUoU4tkUExRP4JG2jak2QquN5MjjTRcL7O3p0JcdrGI2RjfqkmAXDcv1Ccpg9mpeCfafyuNVjiJvsw4eF+6J6zuRhm4v29zchgOXsunUpEcS1HVFbDP6f4CYckEV07yKyL4RoZSI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(54906003)(4744005)(2906002)(66556008)(5660300002)(36756003)(8676002)(956004)(2616005)(478600001)(66946007)(31696002)(186003)(4326008)(110136005)(83380400001)(26005)(8936002)(16526019)(86362001)(6486002)(316002)(66476007)(16576012)(6666004)(31686004)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SjVuSTFhcUN6K1hkR3JOQThpdExJQ3MxWXZCZXdtNSsybUt6KzYyeXVSQlBL?=
 =?utf-8?B?d3pQSDdBb2FCWTZqTzhpSUxWTVlsUEVEU0hveG9yRkdkdnllK3pCak5RcktV?=
 =?utf-8?B?aEg3VWNtdXZZZloyc1Y2cTVBNldOUURSdEdiUlFyQnJYNkVZcW5uZnZiL1ZD?=
 =?utf-8?B?cjloaWduRTF6UnhoYUt6cTk0bmx0T213ZGRWUUcySGJ2T2JOTzhCSXA1QVQx?=
 =?utf-8?B?UlFBdkwycVhvT1M4RFp5d2RiRDNoSXFOQVJRdFlXMDNKYmY1SHVTS2tyd3oy?=
 =?utf-8?B?SDBpRHlMSVJROTVmczY2c3BlNGVFNEc4WjRhZEk0M25FdVpOVFRPbEhTQ2VI?=
 =?utf-8?B?NVNmZ0QyV3ZmL0RLY3BhNkN1QjR6MmVEWVZiaDFwTnZ4ZXVCdkJTRkg2cEp5?=
 =?utf-8?B?U2RkVUZOY0tjM2tSZTNpQXB5WFFQOEdSMmZyUCtQL1V6NUNhTzgvRHMzQ05Z?=
 =?utf-8?B?Z2NkL1pyREVvdnV0RHJCN3ZjNFd4WTVCeUsyK3hEd21kTXJpSUlkOE02bWdH?=
 =?utf-8?B?bC91dFBYcHVoWXg5SFRwaXo0YnVRM1NXTVFucmE5dkplTmtSS1NrU1ZwZXVm?=
 =?utf-8?B?UVZlOUI2eFg1Z2ZNZHJLcnZBVlBrK05RUlVzaDlkcU9nbU1ZSE0zWE5UUi9K?=
 =?utf-8?B?RytIanhmRUR0aEJQSGc3K1VMZElLUzdodkREOVd4NFgxZitVa2ZoSExSWjQw?=
 =?utf-8?B?Y2NoMlV5ank0M1VLNldNRUp4T3R0YnYwR1gvQ0xjYjZaaFlQOTdpSFZ0TnJV?=
 =?utf-8?B?VjNmc0kzeHRXb2JEK21UOFBDaEorZzZqaXdNUkdwSndOTzF3L1BLWjB5K0Iv?=
 =?utf-8?B?T2ZVMDlZeFJPU2dsMUloa2QwOWhVTC9QN2ZiWWpyTUJZS2RyaU8rWldoalFZ?=
 =?utf-8?B?b2RHQzVkbWRuVUFwNG5FZ2FGYUxSUFlSVkNXa0lBZWx0YkV1MDBDN0lPTGFT?=
 =?utf-8?B?RFZKYXpSY2ZtUFA0R2s5VjY0d2RxTlkzbGE1ZTFQdUFjanNGd2NRNGl0TnlS?=
 =?utf-8?B?a2lYTG5RWndXMENaRGt3UWpRMitNUzYxQllXZjRwVnBadFNrSEpRTFU4Wm1M?=
 =?utf-8?B?UDV6VFpLR1lCd3QzR2dOcjVBeFpDdDVGMm5tb0lLWENQQWVLNEQyQkRidE05?=
 =?utf-8?B?amdvM3RHei8rNXZwbjJ1bkdLOVQvS29GUXh4dFRyMndRZmtUVFU3MzhXd3Zz?=
 =?utf-8?B?aGRzN2lyVENoT2Q3anRKRWoxMHA0N0lWRVliVGVYeTRUQUk4M29HWEZjU1NJ?=
 =?utf-8?B?NnpwMjBLV2VFSGI0MWlFT2UrcDZjNC94M0piVnd3Q0ZIaE96M2VwNDdSUnFl?=
 =?utf-8?B?RTA3aHpoNGtjNFkwZWtYNlVhWDNaVWlSNUkyMHAydmRVOU5YM3U1eFh1V0lG?=
 =?utf-8?B?TCtCRUovVXo4T2diYkVKTVJRWjdGOFN2ZVd3TzI1V0xLL2orREpDOEx1OXlR?=
 =?utf-8?B?MzRac2lRN3ZiNHp4c3NQaWJTYmVTRStXMTk1d3NKRVlRN3pWdVdmVm5ZY240?=
 =?utf-8?B?NktvckVwZytPSkNLYnlyTDRLZUlUVFVvYmNnYjFOZVdRRGVlZ3NzK2FNb3BY?=
 =?utf-8?B?Ti90OVo4OTN1cEZLNDUxU0hjczhudGtnS0xiMUt2VkRVVVlDTW52NE93ODU0?=
 =?utf-8?B?dE5JelZJTUdDNUFET0k5Yk9RVW85dHptQnFodmF2QUhlQjd2TFdKa0ZOVEll?=
 =?utf-8?B?cStEa0NwcGRtcGFGeDdhYVBNWGszUUt3QVBGUTVjRlVMdUpoaHp4Q1pkVDN6?=
 =?utf-8?Q?nhZVIQOIl1JGdtWHRESBu/SeDUUrpmIYBCEyd35?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f01e0a88-b96f-459b-4911-08d8d418b04c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 14:22:57.6337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P9jQarwPaKwQ3DXygpFf8VXO6vDLplMPyTLhp5IlsUnL/5pCIHGtvYxUAeBTXU6yFuiyxz43nRhZAeLP+oskQIhdu482fd7sg/YZU9CMl38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4550
X-OriginatorOrg: citrix.com

On 17/02/2021 10:46, Jan Beulich wrote:
> Prior to its introduction, v1 entries weren't checked for this flag, and
> the flag also has been meaningless for v1 entries. Therefore it also
> shouldn't be checked. (The only consistent alternative would be to also
> check for all currently undefined flags to be clear.)

We recently had a similar discussion for the stable libs.

Whatever we do, an unexpected corner case needs to break.  Checking for
all undefined flags up front is far cleaner - absolutely nothing good
can come for a guest which set GTF_sub_page with v1, and is expecting it
to work, and this way, we do all breaking in one go, rather than
breaking $N times in the future as new flags get added.

~Andrew

