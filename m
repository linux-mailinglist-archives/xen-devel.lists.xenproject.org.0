Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA3954AD04
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 11:14:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348680.574885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o12br-0006I1-7G; Tue, 14 Jun 2022 09:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348680.574885; Tue, 14 Jun 2022 09:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o12br-0006EZ-3g; Tue, 14 Jun 2022 09:13:15 +0000
Received: by outflank-mailman (input) for mailman id 348680;
 Tue, 14 Jun 2022 09:13:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lWYu=WV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o12bq-0006ES-0l
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 09:13:14 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35de25b6-ebc2-11ec-8901-93a377f238d6;
 Tue, 14 Jun 2022 11:13:10 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8945.eurprd04.prod.outlook.com (2603:10a6:20b:42c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.22; Tue, 14 Jun
 2022 09:13:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Tue, 14 Jun 2022
 09:13:08 +0000
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
X-Inumbo-ID: 35de25b6-ebc2-11ec-8901-93a377f238d6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKPJtp9m2u/GrwXECYQbRvTxcJh5a/yd3/VDoz3sjBNlHKDwhrbME7zJwNQyqdNe+LZS8LcHcb1wK92eTR5LAv1nDYQxZ9wZIfrMG/UJi9ODWt7KEEAAyus5zJGWbfKCNOkwqxYy8GNTpxQbkEXhz/vaUc5kIh2pJF7MyFi+YT3cJBXNhcPzaLg0DlKb62OJ+EkcZG5wn+tHMYeyEY95UFnAKg2FGspjq13v8E0s9Mk/2qXnlNzZd4Tnl5ykEw06pQYBb3A58rrX2afQkFjxwj63a4Kox+ahBsHbxk666gRr2QOy7y3VnDVuVdPH4A+jIN6FBca258VNQ7mqTUYGlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RncGR/Hqn7SBvBFY1V9vTjTOQTwupfQNhG79ifnuEYM=;
 b=mN5idc2tNmhckacyyrVjtsgb7BndiJn6dr5byb7WSEJ5Q8Fw1m5F21Jlijw14eDigD8bEzKQIqA8ViwP+53zixYw8W5FgfZVrz88Oz+F41DgaULliFhyaPeQOeygi0PXQmB8/dCFMkup0+Jhzf87WzafGpf6H02hyZUfjxk6ZIDefOv1pQyngkvc2p1Wrc+KpNtyitpAgLg9BI4YUWqVWCmaXoS84WCbH1nF6fysSzM3SnkgmpIl7VK3CSdQ5ry4egQzJGOY1Wf62sCo0+yg2xyhw/nib9puwq40uVmirxS0khAMseCTE+BeDesjB7nhXeuNqHCxxnSs6IvlvrGa9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RncGR/Hqn7SBvBFY1V9vTjTOQTwupfQNhG79ifnuEYM=;
 b=OPGOJ1iTQM1Qtzv2CbVvK9kj0mrAurCeAkPxzJWcX1I68iiZ+D8CIhD9UfJaHIFabh2eRMHeM9BFMSko2ztwOHuyOo58eFg9NUeSxDFFjCJ04XVgvzv2q334XQAnz9Fsh0q3+KUWbiTS0f0TqlXVb9idH69RaGKO2hDDiojDScDriTTLYPPh20eEnDyAoOHYS0dLGwY21hsPKx/66KiuQzSl8Hya+3xAgwqbAdSGyERERnO3YtjZfOkNeZaWDLD4oUZKJmj76eaLKiy+E4TXwSvvkfR9B9grDd0wZpHYyclXGtUFjZmr5UC75EKeI5p5pGjSxq8I9C/9tUjYIXUnwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <72c94980-cbcd-d3b3-7aad-c9db58d9c4a2@suse.com>
Date: Tue, 14 Jun 2022 11:13:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] xen/console: do not drop serial output from the hardware
 domain
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220610150651.29933-1-roger.pau@citrix.com>
 <3a462021-1802-4764-3547-6d0a02cd092f@suse.com>
 <YqbziQGizoNX7YFr@Air-de-Roger>
 <3d0d74d8-55a9-cdb6-0c5e-616ddd47bbc0@suse.com>
 <Yqb9gKUMokLAots7@Air-de-Roger>
 <afa0a9e3-fd35-be38-427e-3389f4c3ca26@suse.com>
 <YqcuTUJUgXcO3iYE@Air-de-Roger>
 <f0f87e99-282b-6df7-7e57-3a6c73029519@suse.com>
 <YqgwNu3QSpPcZjnU@Air-de-Roger>
 <69d85d88-4ec1-987c-151f-0d433021fe34@suse.com>
 <YqhHtetipYTG8tuc@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YqhHtetipYTG8tuc@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edf5095c-871d-4e08-ec1f-08da4de61910
X-MS-TrafficTypeDiagnostic: AS8PR04MB8945:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB894578F280FB95C9586A36ADB3AA9@AS8PR04MB8945.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	44xWMbSoTmgNkqtR3YGDZj/WC3j435hKCHczfWI2M9wCd+XcqawOjmkh0RNdua8Wb1a3IbHk4V9TVrVwQbyNlyFPqWy4oHWX367Dmhh2FUGWNkJ1M5s5LvNt+jGYAng1x1h6QEvxwQCzKL+Pw/X35hOwIk3XanuZMFWhAgvzX9WXj9U3Guyn+Cva+RYaokEyzTDdIvxWrqIpMJ0cvvpAtBjEBrAgbKboJ/Ng1dOcB75uv7p9KKNyDzQpJWna3nTBsk4YFaGNt0vCyWPmf9CP2XD3iAu6Vb6PgHChhOcyMpuH0JJM+XBYxvSqRUaG0AKPHuT9KCTtnx/kaRdaKDuAuYUgiiMlxPRzRT5f3Hh1EqPib4j26xOBkbhh6zshPrzQRBZZx0VwqK9ZgBlZpnL/ip33Lw6J1OQz5FZXxumg8Ckei2wMNSz0OGZav4vAREnFFQSMZGaB1Wwg0C623NgIKTxJR+Pj9VtJJMfNzruVYJoCMTh3qlydqnNTJfq/zf5N/81B70w8W/s6MdDoteBhLQptljW+KZxEB0bX3Qh0aA5uF9qPvpkKCvL7EnolsbZSPKS1vayPHQFGSTR6D5Wiz0ja/v+qfOSSVhrpy9YM4eZpUNUqdqQnbabR92Dv25GWUwA1fiAvio8snHcKbsdIXFHQIRQ4kCRjgghzzflLkdPHLVxzi4MUIDq2bjQxXFnjBQJi+IuUAunkGW745QXXevB7vbdh5Q86hiIbcMSKh/w0n0kg86Hd8d+m498gkEiD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(26005)(2616005)(53546011)(31686004)(54906003)(2906002)(5660300002)(6506007)(6916009)(36756003)(83380400001)(38100700002)(6512007)(31696002)(316002)(66946007)(66556008)(8936002)(86362001)(186003)(8676002)(508600001)(4326008)(66476007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTVONHhNNVFkSnBFUG1JdDRZdldoV3hJaEFMdVBkdkwvSzc5eEdibHBkb3h2?=
 =?utf-8?B?V1JqV2EwbWo3Nmx4RzcvZGNIbHpXeHBZRXBrblBHUE80b2Rqckc5ZUNQRXpS?=
 =?utf-8?B?Um8xSC9mNWdoQnZYMjBybjhnTVJhcHJ4VnJ6Q1d1Tys1QkxoaHdrTXZVMVlu?=
 =?utf-8?B?TTM5NFFjTmRidVMrMno0TG5naEpMR3hFTW8xd21icGs5S1pDRVMyVWJ4cWwz?=
 =?utf-8?B?ckhLS015ZUdzZTdpSy96NDJzTjZ3bDRNdCtNK0pjbEdzQzZObTBEd3ZpRmtr?=
 =?utf-8?B?M0M0eFQxMCtYUEphblEzSDNBZVZtWDhjdlUzYnI4MTRVTlFjeEVIZVl6b2RY?=
 =?utf-8?B?VlRYZGdXQk9JdHJ6NG80WE9xd1FuaXdObTN2WnFpT0JpaDJFZVhwZ3d0ODdR?=
 =?utf-8?B?aXN6cWd1NUdNQmw2a0lpQ1l4M2E2YlR2SGVRY1liZWEzTzZYN1N1ZmZXNHQ3?=
 =?utf-8?B?ZjhUMFNZZXNBdDZ0TXQ4UFRFcGNEOGplZHAydXNXN0NVWUNmZEJIZ3EveHBB?=
 =?utf-8?B?aHpsZ1FZOVVhUXFzOGh1Uy9BVjZYWTI4OHo4dFpTcVBHRjVpalZIVFNOdysv?=
 =?utf-8?B?MHNuVkphTm5RRTkwMVVGb0h1MWF3VUh1ODhWSXBzWkczaWN3dERzK1R4VGtt?=
 =?utf-8?B?cU42S1dNUlNyd3VrWHVYeWYzUjd5NndjV1ZvcmFlbDZEKzlXNEJqQ3hkT09X?=
 =?utf-8?B?ZGdmY0lCRFhHOUZLNkNKbU41dkQ5QnlNK0tpTmRiMDNXczd2cFpqQzdQaVF5?=
 =?utf-8?B?OTU0NWlRbDZvYzVQeEd5clREUmF4eFBHTUJqNGZLWmhiUFVoYitPaFk2VE1l?=
 =?utf-8?B?SXQwVm1zZlZmWExERk9rQk5mcWZlME1HVVVEbVhHNzFQdHJXZklDSVJXa0NV?=
 =?utf-8?B?OGN6VktvMlhVTGVycW8xdWdWRFcrVlhTUkJpZ1R5aVVTWWRNcFRNQktYL0c1?=
 =?utf-8?B?VE12am81Qk4xYmUwK1BWVTRVS2FPZ2E4QlFwUnhxWUVUSDJxb1ZrRjdQSksv?=
 =?utf-8?B?NnJYenF3Y0NNclcrS0Fkc2UxdExZZkYvb3piOGd2VnlKV1hMbG9DbzVPaFpu?=
 =?utf-8?B?V3JMaVhOVnlDanNqWUFycW9vdlN4aVV1QnlYdk8zdStJSnZ5R1VncFdjQTBu?=
 =?utf-8?B?QWdXRzlqbUJ0bVNBTmQ5bGtxN2JtakZGNC8wdzRMTnA2OTU5WmFXYVdBcE1H?=
 =?utf-8?B?MnNNZlFUZWdzQW5IZU12Qm9zanBxZWI0V1NyRi9TRDJzZUlwWGo1ZEU1YUox?=
 =?utf-8?B?SmZQSncxaGJNRTNEdkRVNDFYaHZRdkpVeWswNm1NVjZtc1FzOVJ6YVRQVVRr?=
 =?utf-8?B?MnVnM202QkpvQnUrZzZBWWhBMDY2MWVFZ0c3bUpuQjRicXhqaVlVcDBOeVBL?=
 =?utf-8?B?Rkk3bU4xMW1kbHc4ekowVzRqakdmOUE1RUJkYmZEVEhmYUtVVm9jbVVGd2FZ?=
 =?utf-8?B?MExUOWpBa1Bnb0xZWEladkhNVXp3bEhONTFaN2owT1NURkV3cUMyWm1Pdzhz?=
 =?utf-8?B?VUxpbFhuSzA1UzJWWTJnTHRxZHZkdVFqRkw0b01HNHBtMDQ0bG9qeThNYlZR?=
 =?utf-8?B?NHBzcHVMeEg2bkMvSHNCdkR4M0NHOGtZbUl3eDMzR20wdlJwMWlSa2JPRFg5?=
 =?utf-8?B?ck9PQ0xwOFJnRHJJMVVFemppOXFKMWxoK2FKMTQ3MmF3R0lPN2NIOWszQlVq?=
 =?utf-8?B?ZHAycUoxSmZKdlVmeEFaSmR6Zmx3blR6eExzSzROdjNjZVh5djJ3bFpmQ2F6?=
 =?utf-8?B?KytIVCtSQXlISHNsMENES2pubmVBM1RnZFc5SXFPWDFCS1MxTm5Qa09ZZXpC?=
 =?utf-8?B?Z2lKUkMvTDFMdU9SNTViTWJRSkRHeW9WY01MR1BPZGE2bklCbzBURzdDelEr?=
 =?utf-8?B?YUozRTBacXlYVDJybjFEY0lKV0tFRnozVFhpdEJxK05nSXZhd3Vac3RZbnl6?=
 =?utf-8?B?NzRxNVRNUGkzU1N1NUd1SksrWGhrUEJ6YjdPWUVvVUVReExlcHFJcWhGYXZn?=
 =?utf-8?B?WHZhM0Z0KzJDam9SckJXMjNSK244aENod2I1QkRQM2lQZ0lzRkEyYWlNODRp?=
 =?utf-8?B?OVIrMnc3bC9nZEZCS3ZZWXo2dDMzcEJNV1RXdjFCdno2bDBCMlMwVXN6OXg4?=
 =?utf-8?B?VU5GemppSGRic0hnV3V5dzVMNnZlMm9pQU16WGJCRHZtWXhDMldocit4Nzdn?=
 =?utf-8?B?ZDFHTzlUbXoxOXk2T1VBdjhaZWU0cWxvMzJzelBJd2dyeVlkTjF2MkRVdWpT?=
 =?utf-8?B?TlMwY0lTc1BZMCtSNkxQVXVmbXZXam1kVTAyc3EwYkI4cDlXdE1vOVhTaXZE?=
 =?utf-8?B?aU92b0ZCd1F0NjFwVEhRRjMwY2E4b0VCanVVWGRWUmx4dWpXNVVTdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edf5095c-871d-4e08-ec1f-08da4de61910
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 09:13:08.5796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DB0FbTrr2zhed0qFZJM7GETzB+AYVu/eEYBHHHO3YqPOYfSREvOXMwoH/3uk3bR/u7scVqxf6OT+LB0lDaG1SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8945

On 14.06.2022 10:32, Roger Pau Monné wrote:
> On Tue, Jun 14, 2022 at 10:10:03AM +0200, Jan Beulich wrote:
>> On 14.06.2022 08:52, Roger Pau Monné wrote:
>>> On Mon, Jun 13, 2022 at 03:56:54PM +0200, Jan Beulich wrote:
>>>> On 13.06.2022 14:32, Roger Pau Monné wrote:
>>>>> On Mon, Jun 13, 2022 at 11:18:49AM +0200, Jan Beulich wrote:
>>>>>> On 13.06.2022 11:04, Roger Pau Monné wrote:
>>>>>>> On Mon, Jun 13, 2022 at 10:29:43AM +0200, Jan Beulich wrote:
>>>>>>>> On 13.06.2022 10:21, Roger Pau Monné wrote:
>>>>>>>>> On Mon, Jun 13, 2022 at 09:30:06AM +0200, Jan Beulich wrote:
>>>>>>>>>> On 10.06.2022 17:06, Roger Pau Monne wrote:
>>>>>>>>>>> Prevent dropping console output from the hardware domain, since it's
>>>>>>>>>>> likely important to have all the output if the boot fails without
>>>>>>>>>>> having to resort to sync_console (which also affects the output from
>>>>>>>>>>> other guests).
>>>>>>>>>>>
>>>>>>>>>>> Do so by pairing the console_serial_puts() with
>>>>>>>>>>> serial_{start,end}_log_everything(), so that no output is dropped.
>>>>>>>>>>
>>>>>>>>>> While I can see the goal, why would Dom0 output be (effectively) more
>>>>>>>>>> important than Xen's own one (which isn't "forced")? And with this
>>>>>>>>>> aiming at boot output only, wouldn't you want to stop the overriding
>>>>>>>>>> once boot has completed (of which, if I'm not mistaken, we don't
>>>>>>>>>> really have any signal coming from Dom0)? And even during boot I'm
>>>>>>>>>> not convinced we'd want to let through everything, but perhaps just
>>>>>>>>>> Dom0's kernel messages?
>>>>>>>>>
>>>>>>>>> I normally use sync_console on all the boxes I'm doing dev work, so
>>>>>>>>> this request is something that come up internally.
>>>>>>>>>
>>>>>>>>> Didn't realize Xen output wasn't forced, since we already have rate
>>>>>>>>> limiting based on log levels I was assuming that non-ratelimited
>>>>>>>>> messages wouldn't be dropped.  But yes, I agree that Xen (non-guest
>>>>>>>>> triggered) output shouldn't be rate limited either.
>>>>>>>>
>>>>>>>> Which would raise the question of why we have log levels for non-guest
>>>>>>>> messages.
>>>>>>>
>>>>>>> Hm, maybe I'm confused, but I don't see a direct relation between log
>>>>>>> levels and rate limiting.  If I set log level to WARNING I would
>>>>>>> expect to not loose _any_ non-guest log messages with level WARNING or
>>>>>>> above.  It's still useful to have log levels for non-guest messages,
>>>>>>> since user might want to filter out DEBUG non-guest messages for
>>>>>>> example.
>>>>>>
>>>>>> It was me who was confused, because of the two log-everything variants
>>>>>> we have (console and serial). You're right that your change is unrelated
>>>>>> to log levels. However, when there are e.g. many warnings or when an
>>>>>> admin has lowered the log level, what you (would) do is effectively
>>>>>> force sync_console mode transiently (for a subset of messages, but
>>>>>> that's secondary, especially because the "forced" output would still
>>>>>> be waiting for earlier output to make it out).
>>>>>
>>>>> Right, it would have to wait for any previous output on the buffer to
>>>>> go out first.  In any case we can guarantee that no more output will
>>>>> be added to the buffer while Xen waits for it to be flushed.
>>>>>
>>>>> So for the hardware domain it might make sense to wait for the TX
>>>>> buffers to be half empty (the current tx_quench logic) by preempting
>>>>> the hypercall.  That however could cause issues if guests manage to
>>>>> keep filling the buffer while the hardware domain is being preempted.
>>>>>
>>>>> Alternatively we could always reserve half of the buffer for the
>>>>> hardware domain, and allow it to be preempted while waiting for space
>>>>> (since it's guaranteed non hardware domains won't be able to steal the
>>>>> allocation from the hardware domain).
>>>>
>>>> Getting complicated it seems. I have to admit that I wonder whether we
>>>> wouldn't be better off leaving the current logic as is.
>>>
>>> Another possible solution (more like a band aid) is to increase the
>>> buffer size from 4 pages to 8 or 16.  That would likely allow to cope
>>> fine with the high throughput of boot messages.
>>
>> You mean the buffer whose size is controlled by serial_tx_buffer?
> 
> Yes.
> 
>> On
>> large systems one may want to simply make use of the command line
>> option then; I don't think the built-in default needs changing. Or
>> if so, then perhaps not statically at build time, but taking into
>> account system properties (like CPU count).
> 
> So how about we use:
> 
> min(16384, ROUNDUP(1024 * num_possible_cpus(), 4096))

That would _reduce_ size on small systems, wouldn't it? Originally
you were after increasing the default size. But if you had meant
max(), then I'd fear on very large systems this may grow a little
too large.

> Maybe we should also take CPU frequency into account, but that seems
> too complex for the purpose.

Why would frequency matter? Other aspects I could see mattering is
node count and maybe memory size.

Jan

