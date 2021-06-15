Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FC73A7A54
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jun 2021 11:18:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141969.262093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lt5Ca-0007pf-GI; Tue, 15 Jun 2021 09:17:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141969.262093; Tue, 15 Jun 2021 09:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lt5Ca-0007mA-D9; Tue, 15 Jun 2021 09:17:44 +0000
Received: by outflank-mailman (input) for mailman id 141969;
 Tue, 15 Jun 2021 09:17:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x6ws=LJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lt5CY-0007m4-Sv
 for xen-devel@lists.xen.org; Tue, 15 Jun 2021 09:17:43 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9a2d625-5f09-4c43-acc7-6d11ba91f11c;
 Tue, 15 Jun 2021 09:17:36 +0000 (UTC)
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
X-Inumbo-ID: e9a2d625-5f09-4c43-acc7-6d11ba91f11c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623748656;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NEnHa7jmdmp4NFEfYuMvvbgTOi2Y6Xy3EX5TrC+4hP0=;
  b=GKAOpt6t4JEUzKS4FIOP9r2meQ9cteAxorsIpW0YTnVIBT0gz9xj7M6O
   AEzyodZ75ruXOvbhogSX9DJoKg8tJheuDpfKjuIKy9wCqRZHb8A1yLb8k
   /xpg7o0xe8KV12cdvSkzvapHCgjovwYnjhwTyj0I43yJZTJlu5tl37pPt
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: XuxVKP2yk99lEiSTrqD+SxgwtAZRekbHDOASHwPLCJHs05lqJ0U1m5zn+F/IVaT2im39WJLufJ
 BeYWtO2lHVoSLSILsEF0TeIZBnd9/XV+MmRs2f2DAWLxfC7j8dKRH+incvXtufY7rzjnVXv9Ih
 KVQwMeY0ljp1+fSgMNNqrPPqd7Pt1nl6/AhIzqggeWgwpaAkXwMnrTvTCLpbvEz7ktnCQ/VgEZ
 sILk9fbC0Ezypl76as4G2fo3omj6RNJlqnPTK4OkhTb7Z3q1KiW9Y9mpSZv7ys/6RuFX/qOR6h
 fEc=
X-SBRS: 5.1
X-MesageID: 46510792
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:a5R8/ajEltdZLIrX27eFcFokg3BQXiAji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPE3I/OrrBEDuexzhHPJOj7X5Xo3SOTUO2lHYT72KhLGKq1Hd8kXFndK1vp
 0QEZSWZueQMbB75/yKnTVREbwbsaW6GHbDv5ag859vJzsaFZ2J921Ce2Gm+tUdfng8OXI+fq
 DsgPZvln6bVlk8SN+0PXUBV/irnaywqHq3CSR2fiLO8WO1/EuV1II=
X-IronPort-AV: E=Sophos;i="5.83,275,1616472000"; 
   d="scan'208";a="46510792"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ho0dQ1CXXj1chiM1/FFJwKNch/N9PTPKY8iKIg4UIsllgMJVUdgLAJtzrItaxvbKBdr7nQL+7KKOBQG8ZA/RYDtBXCxu/Z6YIx5/MRCQT99XtYtpn5d9Hy/IWFRDyh3Mzf72EY9qZkvPAMKLAr88BH0hSGXTX14xvVw+y09AQfaiypoWC5SOK0UM8l9n23iOj9bAd2h3TLDT1NhdOT8YYqu0lCNox9J4CbsXdHd4bJoOMAgQSoIZJWUNvLyN+Msf2gRfauerqElCpCOZRfaReUbeKJ8Sohegp1fXh/kc1Gh/Ihtv2isayYD4bEKYM06oDQ6kh4p0sC+gkmTbOnKNXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjZN2yR43dGRx39ih2tx5i2/Ql+3p+wJnVZbqSFLIdY=;
 b=iirwa3Xl4IG8icN411VSQqiH6CT22oyMzmIl5Xq5yeFxwr4SsKUtFG3Xc9EBVod0lafWo+FYUuPKOTmT8UU3Q9cp23Gpbyz84V8Ha5BOPJAzpMXMA4FVc6FX4dOM7sAhJXqBUGr8v37TxYPSFFPAkoz+uJlaBfkIPhzG/Cl9rpDvWrzIJqyCUx4Zo3Ppo9NsxkSASNqrTUbliS45hOmVCHdkmC8HkEIi/SKLrc7p3BequhaikeEka5+nlizvioDBHVDVMmoJPWYAYmOYoPxwHpRGe3lu0wX6TPp8zqJ7KX2NHSTqkEXRcc+T/HH8q9lEmdZxyDZ+PtP9rlz5BpH6/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjZN2yR43dGRx39ih2tx5i2/Ql+3p+wJnVZbqSFLIdY=;
 b=kt/lv+zY5S7BJBByeOeX0QvPjzmfXjD7Q+0WQKudsCvOqNO/gVCe5fRJXtyZR4frwcqpu+cgsonHaIzsVgBInHaqDi0xmZbqYzif7RWCbMDxGuKEYmwkLQGTz69GDePkDJhxNvlNbDU/7kFOoWHpOCnm1nuOD28aUSCXssC8t2M=
Subject: Re: BUG in 1f3d87c75129 ("x86/vpt: do not take pt_migrate rwlock in
 some cases")
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Igor Druzhinin <igor.druzhinin@citrix.com>, <xen-devel@lists.xen.org>,
	<boris.ostrovsky@oracle.com>, <stephen.s.brennan@oracle.com>
References: <0efd0099-49bb-e20c-fe8d-fb97c9de2b63@citrix.com>
 <74378af9-5d04-f95e-3957-918cf5c81ded@suse.com>
 <YMdZKuKOnFKpQ3sg@Air-de-Roger>
 <3e9f4ea8-2fca-bf66-6345-0b73b960cba7@suse.com>
 <YMhg6OclYQ9AS+wD@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3aaed845-b273-0688-4cac-3d440e3d58d3@citrix.com>
Date: Tue, 15 Jun 2021 10:17:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YMhg6OclYQ9AS+wD@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0228.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::24) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bddc1ab4-f72e-4a7c-ca9b-08d92fde675f
X-MS-TrafficTypeDiagnostic: BY5PR03MB4999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB4999E1FF60E1BF64307E1F55BA309@BY5PR03MB4999.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UHlvYXU9hRWkKN7E5yt+FMq9hunOQbXNbz5PcFZEr2L+5OKeHeIjxHHAroyuTAVYFT01RpthgCZQ1dl1YSExXYGWD/ZkEujgK3aGtkgUlczjNTdyYxGqKXpHv03ATAGkqo+rzqGQ70XuUi/Z+vqMw04A/jES1oWN3Tl5o78ZdjxX2zV+RN4Y1YY8qixVuLp05tZFwbReCBKOm/4fQ0dgUTOVNew3FjSHf5jqYEeE18QKURbldXoctvPrwL3TJspaRkqxYdz4AYaeOEEnKVppqWkysFwwfah5eMTNTRgbpDmlqi5vAlDLzBKOnGCVNloNA5h4yu2qEsAy9cYYqgbVX1IwhAV4aGuFk3aDUNGOBKVBpY4vR3SsvNvRNbmAKZaHeoQOmnxrH2XkKZhjw+Qw3C03hU9yFtLgLVQbrYfMDtZnQgohtBfWhVwaxTQSlTNEjbdhtWWW5c0Tl+jtPmB+T53gjuKi4cbjxfijoM2TalQV6ukoo8RQqft0hcNXnCaOQQZbZgfkC68qlR5fU5My7Bb7Fw0g88/eygaUp8Maau+1na12F7AaEq9Gpe73ZkWu4z3CybGJQGWF6CGc7r33Kw24YuLh9nq93XtVV7r6covDiB2dRH3Jg3OdHxpdhbkI0kQN27AO8eZoX7WSm9Tv2vYLHBKu6EaaVZiW+LFu7EOMryFUGn+O/oUXldphXT4f
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(366004)(396003)(376002)(136003)(83380400001)(5660300002)(38100700002)(2906002)(66476007)(66946007)(66556008)(16576012)(316002)(26005)(86362001)(31686004)(478600001)(8936002)(6486002)(8676002)(110136005)(53546011)(16526019)(6666004)(4326008)(956004)(186003)(31696002)(2616005)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlJkdFVOVXBLVC8rY2tMMXA3VHlxcUUzZVc5R0FyLzRGblA4RVduYjhtdElW?=
 =?utf-8?B?dzVucml1dkxtMVJyazg4MjIrdkNUSUc5dlZjNUR2QnVZMDBKVXozZVcrMWdO?=
 =?utf-8?B?aURwTDNHSEpqUjhyZDU0eVRJbmJWMDdkV3RkNWxrTEk3aCt2eUhhN0VFRDNL?=
 =?utf-8?B?cVhSOXIwaEJyLzlIbTVhUERzSDAvcVlXZElRMGlJUHh2d0FSSENMVHYvWGFh?=
 =?utf-8?B?bEVaYUpsdGRLeWZzbVY1bVlvMXY3TEpYK0lpdUZjQnJZREgxKzhLajdiQ0pj?=
 =?utf-8?B?UkQxYTFOZmxrQjhjS2lJSGxkbFZNNzRLVWczYUxzbU5MQmxRRVU4WkdtRUNi?=
 =?utf-8?B?WlJMdUZuUkphOUFIRzY5bDVHVlNiOUdYL1FrU2xlN1dJZjlZMG5wMHduWFp5?=
 =?utf-8?B?bWlpa2VsVFpSakdiaWpSOHJhSW5kaW5RVVNHOEczc1lyMWRhYW8yQWlkTk5a?=
 =?utf-8?B?d2RNc1pUZUlxNzZLZE1CTFRqNGxtTHBzcVJhSDdiNllRVEhRanF5QXRXTW1p?=
 =?utf-8?B?b0IxMTFqZmg3MDcrOUNabXRaMU9OeWN0dFhaSi8xL0FUcFJDTVE3c25EQXdZ?=
 =?utf-8?B?b2RvaVFaRERPeXk1T2ZPeExwMUsvcVBvWkxrYzBNOHoyZmkzQW02Q0lacFQ0?=
 =?utf-8?B?ZHV0YWpadzdDQXE5dE1jOVdHZ0hHOWRjRUkxNGxTNXVhbTZsaXZLTmliNWto?=
 =?utf-8?B?U1I3anEydmh1VVBCcnRGT2xVb0JRQktCUmkrQVZzL0s3TnZERWgrSm9XcXZk?=
 =?utf-8?B?ZU8vc25rV2ZLTmltK0dlYy9iUENQRzAvNXUyRkFaQUpna1JxQVdSRkVtYWlo?=
 =?utf-8?B?NUdHRFhhM3BTOGhUK0k0U3VVMDlydEdjQjF6SWU1cjZxVDNkNEo4SVA3OEd3?=
 =?utf-8?B?Q1paejFvMk5PZFlmTGpXeVVhd3VEZ1pHcmdPVGR4THB6d1hrcWptdnQvTmNW?=
 =?utf-8?B?SlNGVkZ5OXNNbjZnU1VwRHZLaXplaW1EbG1DUUtWL3VrSG5FVm45cjVRS2or?=
 =?utf-8?B?N1pYNXRSQjFVTDJHZmxwMUwzUXh6dzJSQktwVEhIbGliU0YvVHk2M3ZubE9J?=
 =?utf-8?B?Sk9jeUZYaFFFcy8wRzZnMzAzR2VUbmtCYmtMTEpDWkpWcklBeDNjNStUSWVw?=
 =?utf-8?B?UUdOREszWTN6M0J1OEt5Zys2YWlneWxjQmdtWWVvck9OSmtEbFdkOUx1SXZu?=
 =?utf-8?B?cjhiajZicEJzTFlzUWpNN1duME1xTVFyaXdLWXlVaXZOc0tVc3ZlblFTZ0lx?=
 =?utf-8?B?aG9DSS9udWhIV3VKejM3NW9nVHRpOUNpdDAzR0VBa0grYTdlRVRVZDlwTEFa?=
 =?utf-8?B?RTVFZWxzOW1mREhEdU5ERWpTY1hsMWo4ZDZFTkk4RnE4ekFQRUE1UHQ5bXZV?=
 =?utf-8?B?REFTWDJqVk5KaDVBTXZ4UWtMMUtXcE1oVlBsWVNEbzRzUXhyV3IxN0h3WjZJ?=
 =?utf-8?B?SlFka0pvMFZnZFc3WEE2ZEdGaTBhbEJXeFJSMStHbGUyVVlCV1gzN01OQlk3?=
 =?utf-8?B?WE1jZkRlRkN0Q3c3VVdPWmVROTRkb0EvRnZ2K1VJS3dZc25ObU9NYThFR3RS?=
 =?utf-8?B?N1N2cmpaSUxjNzNETEpqU1A4ODNWOUx2NDlMMldudFdMSlJGNnBjcnYveE5T?=
 =?utf-8?B?L1lvUlRDMkpCLzArRmxyYlZDVFdNbXFsdWdRc1ViSnlsTFpCemkvSEl0NytB?=
 =?utf-8?B?b0lZdGQ2aDFhMEJSeHZud2lFK0NSSzRvQmpsaWRNYk1QTU5GcWNaNThHRjcy?=
 =?utf-8?Q?nXQcLfYwIll14I1bjHF6MsN7aWLEAyCLnhloABN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bddc1ab4-f72e-4a7c-ca9b-08d92fde675f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 09:17:31.5250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aysi2Bpr7TpRaLtXJS89E+ygQmpzN3iAttsvaHIwDrZNLQtojYQPuoN6Rt06FKh+N2czAG//3zYe6d/pQjDGqWcKnAsSDhfwRYT7RDwEIvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4999
X-OriginatorOrg: citrix.com

On 15/06/2021 09:12, Roger Pau Monné wrote:
> On Mon, Jun 14, 2021 at 06:01:17PM +0200, Jan Beulich wrote:
>> On 14.06.2021 15:27, Roger Pau Monné wrote:
>>> On Mon, Jun 14, 2021 at 01:53:09PM +0200, Jan Beulich wrote:
>>>> On 14.06.2021 13:15, Igor Druzhinin wrote:
>>>>> Hi, Boris, Stephen, Roger,
>>>>>
>>>>> We have stress tested recent changes on staging-4.13 which includes a
>>>>> backport of the subject. Since the backport is identical to the
>>>>> master branch and all of the pre-reqs are in place - we have no reason
>>>>> to believe the issue is not the same on master.
>>>>>
>>>>> Here is what we got by running heavy stress testing including multiple
>>>>> repeated VM lifecycle operations with storage and network load:
>>>>>
>>>>>
>>>>> Assertion 'timer->status >= TIMER_STATUS_inactive' failed at timer.c:287
>>>>> ----[ Xen-4.13.3-10.7-d  x86_64  debug=y   Not tainted ]----
>>>>> CPU:    17
>>>>> RIP:    e008:[<ffff82d080246b65>] common/timer.c#active_timer+0xc/0x1b
>>>>> RFLAGS: 0000000000010046   CONTEXT: hypervisor (d675v0)
>>>>> rax: 0000000000000000   rbx: ffff83137a8ed300   rcx: 0000000000000000
>>>>> rdx: ffff83303fff7fff   rsi: ffff83303fff2549   rdi: ffff83137a8ed300
>>>>> rbp: ffff83303fff7cf8   rsp: ffff83303fff7cf8   r8:  0000000000000001
>>>>> r9:  0000000000000000   r10: 0000000000000011   r11: 0000168b0cc08083
>>>>> r12: 0000000000000000   r13: ffff82d0805cf300   r14: ffff82d0805cf300
>>>>> r15: 0000000000000292   cr0: 0000000080050033   cr4: 00000000000426e0
>>>>> cr3: 00000013c1a32000   cr2: 0000000000000000
>>>>> fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
>>>>> ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
>>>>> Xen code around <ffff82d080246b65> (common/timer.c#active_timer+0xc/0x1b):
>>>>>   0f b6 47 2a 84 c0 75 02 <0f> 0b 3c 04 76 02 0f 0b 3c 02 0f 97 c0 5d c3 55
>>>>> Xen stack trace from rsp=ffff83303fff7cf8:
>>>>>     ffff83303fff7d48 ffff82d0802479f1 0000168b0192b846 ffff83137a8ed328
>>>>>     000000001d0776eb ffff83137a8ed2c0 ffff83133ee47568 ffff83133ee47000
>>>>>     ffff83133ee47560 ffff832b1a0cd000 ffff83303fff7d78 ffff82d08031e74e
>>>>>     ffff83102d898000 ffff83133ee47000 ffff83102db8d000 0000000000000011
>>>>>     ffff83303fff7dc8 ffff82d08027df19 0000000000000000 ffff83133ee47060
>>>>>     ffff82d0805d0088 ffff83102d898000 ffff83133ee47000 0000000000000011
>>>>>     0000000000000001 0000000000000011 ffff83303fff7e08 ffff82d0802414e0
>>>>>     ffff83303fff7df8 0000168b0192b846 ffff83102d8a4660 0000168b0192b846
>>>>>     ffff83102d8a4720 0000000000000011 ffff83303fff7ea8 ffff82d080241d6c
>>>>>     ffff83133ee47000 ffff831244137a50 ffff83303fff7e48 ffff82d08031b5b8
>>>>>     ffff83133ee47000 ffff832b1a0cd000 ffff83303fff7e68 ffff82d080312b65
>>>>>     ffff83133ee47000 0000000000000000 ffff83303fff7ee8 ffff83102d8a4678
>>>>>     ffff83303fff7ee8 ffff82d0805d6380 ffff82d0805d5b00 ffffffffffffffff
>>>>>     ffff83303fff7fff 0000000000000000 ffff83303fff7ed8 ffff82d0802431f5
>>>>>     ffff83133ee47000 0000000000000000 0000000000000000 0000000000000000
>>>>>     ffff83303fff7ee8 ffff82d08024324a 00007ccfc00080e7 ffff82d08033930b
>>>>>     ffffffffb0ebd5a0 000000000000000d 0000000000000062 0000000000000097
>>>>>     000000000000001e 000000000000001f ffffffffb0ebd5ad 0000000000000000
>>>>>     0000000000000005 000000000003d91d 0000000000000000 0000000000000000
>>>>>     00000000000003d5 000000000000001e 0000000000000000 0000beef0000beef
>>>>> Xen call trace:
>>>>>     [<ffff82d080246b65>] R common/timer.c#active_timer+0xc/0x1b
>>>>>     [<ffff82d0802479f1>] F stop_timer+0xf5/0x188
>>>>>     [<ffff82d08031e74e>] F pt_save_timer+0x45/0x8a
>>>>>     [<ffff82d08027df19>] F context_switch+0xf9/0xee0
>>>>>     [<ffff82d0802414e0>] F common/schedule.c#sched_context_switch+0x146/0x151
>>>>>     [<ffff82d080241d6c>] F common/schedule.c#schedule+0x28a/0x299
>>>>>     [<ffff82d0802431f5>] F common/softirq.c#__do_softirq+0x85/0x90
>>>>>     [<ffff82d08024324a>] F do_softirq+0x13/0x15
>>>>>     [<ffff82d08033930b>] F vmx_asm_do_vmentry+0x2b/0x30
>>>>>
>>>>> ****************************************
>>>>> Panic on CPU 17:
>>>>> Assertion 'timer->status >= TIMER_STATUS_inactive' failed at timer.c:287
>>>>> ****************************************
>>>> Since this suggests a timer was found on the list without ever having been
>>>> initialized, I've spotted a case where this indeed could now happen. Could
>>>> you give the patch below a try?
>>>>
>>>> Jan
>>>>
>>>> x86/vpt: fully init timers before putting onto list
>>>>
>>>> With pt_vcpu_lock() no longer acquiring the pt_migrate lock, parties
>>>> iterating the list and acting on the timers of the list entries will no
>>>> longer be kept from entering their loops by create_periodic_time()'s
>>>> holding of that lock. Therefore at least init_timer() needs calling
>>>> ahead of list insertion, but keep this and set_timer() together.
>>>>
>>>> Fixes: 8113b02f0bf8 ("x86/vpt: do not take pt_migrate rwlock in some cases")
>>>> Reported-by: Igor Druzhinin <igor.druzhinin@citrix.com>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> Thanks for looking into this so quickly, and sorry for not realizing
>>> myself when relaxing the locking. Adding the timer to the list without
>>> it being fully initialized was a latent issue even if protected by the
>>> lock initially.
>>>
>>> Provided testing shows the issue is fixed:
>> I guess the change here is needed anyway, even if testing finds there's
>> still something amiss?
> Indeed, just wondered whether there might be other instances using a
> similar pattern, but I'm not able to spot any.
>
> It might even be better to fix other issues (if any) on a different
> commit.

To be honest, this change is clearly good, and necessary.  I'd be
tempted to commit it now, as is, irrespective of whether there are
further bugs in this area.

~Andrew

