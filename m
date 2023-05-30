Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E50715B3D
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 12:15:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541055.843373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3wNd-00009R-Aj; Tue, 30 May 2023 10:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541055.843373; Tue, 30 May 2023 10:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3wNd-00007O-6M; Tue, 30 May 2023 10:15:05 +0000
Received: by outflank-mailman (input) for mailman id 541055;
 Tue, 30 May 2023 10:15:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q3wNc-00007I-9D
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 10:15:04 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe16::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6b74719-fed2-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 12:15:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9205.eurprd04.prod.outlook.com (2603:10a6:20b:44c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 10:14:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 10:14:58 +0000
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
X-Inumbo-ID: d6b74719-fed2-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KyTuVu0rt16kQEHnRPl7nOkAOD/MAMjh2S/q/qpp5tZvac8c45JKIdsSx3s4WujO5FkCzMNAbI8yKYR5cWIY8Hq44Tcx5HTNbQgFEvXfrHbtQmzc7fPke1GIbqB3Fhkc1K7ILOB1bpsuBPGpCA55tDABYUAIya24di3Xule9hCqn1zbnMJdn8j67cWzirhQ6bJtaBpu8yss6fQyoSB6H71IWU2h5TQeXzPaMyD8zSTVwgzkxWyUkb4qdE3bNhq/vkCSw0oMH/Kc2fKF6ewli8U9rp5RMECoQQoebKSBX1AwCDm9L7frlbSTQaunD9k086DJzqh1RliQhIIYcbgJ6pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRsg96p14A5KH/hpQROyQkDHRPC8rXmb/qsvqJP9Rnk=;
 b=jU8aHXBKy7SEqLtHVorcwxia0APUH0IEJwPR5RJbGQ+KsADhgBksx1W6siYHwixmlamyCEZpIhYiydZNE8ilo80jWCEeXRyXUHY++fx3sxUUkZkqQ7BUNhox1zIDU6QQv9i5ujycJW0VUqmedi8cE6BOQoYmzqaVUfEPkfk06/qwrfcUCboNWFOeHigt+BQrKCH74F1b5QfXDp686HJYvoLTuNkA80x4QlPaE4SsssG24zkxi8QYUkGbID1MbJY20pt+RmzhSFaz4PVrh5SckrUH0EOMPgS4olQbXXLZnMbEdAGkbI/JeDcwpvUqhUQC8QXLlHiuxZrs/VO/5aPVVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRsg96p14A5KH/hpQROyQkDHRPC8rXmb/qsvqJP9Rnk=;
 b=TpMfr73OzxPKQTG+UuvJktcF/OkVCeF1bGMVWwJ172gHbkbbWTAztMdeYQeeQoJaoGtvWbv5Ob4QS6eaDRVU6FqOlhkXvxvEDog+B24hz/i595jP+HiSQ/gqWegvoeHbpMVPHxKDkwBGBdGghtOPC+KjAF/N+cZbDoKLALbUuFMRy3TBhUF2lNGkj80yqueBayU7yJlXww09r9pHLGWVzNKyl1F391yu0wd0Vs5e29l7da3H4bCAWqAN2RR1HCLQgvHeUaMEQV9SIeLA+Q863EDy+ssdtq+guBBDmm2WW/EMFNUUY2Br3qNFu8sM50vA72YAej7MhzolDkSrVroLbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <62d42514-25d3-57f1-f061-0bde197a995b@suse.com>
Date: Tue, 30 May 2023 12:14:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH 13/15] build: fix compile.h compiler version command
 line
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-14-anthony.perard@citrix.com>
 <35D40E55-2D93-431A-8B16-FCFEBBDA25B1@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <35D40E55-2D93-431A-8B16-FCFEBBDA25B1@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9205:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eb2888d-ed5e-46ee-f64a-08db60f6b895
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N5Wzma4n9vfekURcoZbolJ9UB/QfdNi9FgmbE8Q+IIgxGXb7ONPgWo0UPozZAJNlSuAsO6+d6Sji3d8rQFwhHetP8CvbyTSktCWdItp8h8tFOd5ZOwxC0DvbRCYoJaRVoeQIyo8Krsn7S32TQHGPeG0pNAXDLKvyR44kFn+8BP0uov6yx+vpNPqxPYS6qHJ2srhcsUFhoHMnhO7Robc1YqWNw6PVj7P9woih9KzVpRGQ9VnwTPEqtLn4XnN5qSARBZjz7ViZThDBAd9kIP7i1xTHDuD2tkciktmWFdXc7zRoaLXiGZnGk+1E/b0Dl1kH7uwUTB7cnlTWrueG+9MQ0qGo42voujfhgYPAMi7gfgqOiJ7Zgm4hrqOk5fN5hMYRLveV2SDPDtz4jHE1+qILqrKoDhxnHla1r0G7HEB5NFF4X7mLq1wbXvMiFcz+4vGfGh4CT6IDsnP4C8t5L+1Sl670AS+LpNS+BO2HPYw9zdRwx9K5VPZ47p64Pe8pT6IPleXQHDyskQeSCQxDoPYVNJD8v/pug+nLnUiaR6dTHDj7A6eHCHKb0PtrCQN3UmuT0LUSu/p0+pjGeGJNM+WqL5i5phc4JEXvV0h1Rt+BnSeXMAFt1LiNrjUXMRmROG6BC/t4sewLlFhydc8ktk7XaA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(136003)(39860400002)(396003)(346002)(451199021)(6506007)(186003)(6512007)(53546011)(2906002)(2616005)(36756003)(83380400001)(316002)(6916009)(4326008)(66476007)(66946007)(66556008)(41300700001)(6486002)(478600001)(54906003)(38100700002)(31686004)(31696002)(26005)(8676002)(5660300002)(8936002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEQvbU51QUx6VEtCaGVOMWNpb0lyVmt0cG96c0Y1Z2ZjQWN1SUdiNXlTMkhF?=
 =?utf-8?B?OEV6dDg1QXBzYUZ2Y2gyQmpVT2greURyanhVOTZmenRqWkI1bVpQbEU4eVRU?=
 =?utf-8?B?WWloenJKMWlmQVVURXBFYmowSjZsYTVrOE9oeXNvb1Q2V3RHVzRYYk8ycTJr?=
 =?utf-8?B?THQ3MTdiNWFNa3NaUFhEdjBEWUNSNHZndlEyQ1RVd2UvWHFlU09Rc2dvOU5B?=
 =?utf-8?B?VGVDdjVLd3ErK0FHY2M5ejYyNWJ3TzhUZkdYOVhLeGczNVZSZ0RwZzhwWHZu?=
 =?utf-8?B?Qno5Z1B5YXVBUXE4V3hEODRsbUN6MXRRUEd6ekpnTVdYL2NpSm9EajZaenNX?=
 =?utf-8?B?QzRGZS9FRDIySmp5dld6RjRWTUdpQ201VUFRVVFxRElIM21JQldUbGRITGNp?=
 =?utf-8?B?ZC9DSUNrNHZsWEx3VklCYkxpakw5NmpkL0xSY2dIS3lXd2NRTkZBRDNMTWhl?=
 =?utf-8?B?TFE2TW54TENyTktvQ3lhVDc5M2Q2eDdyUHBISHRqUFFjYVhtelNram5qOElh?=
 =?utf-8?B?WllSZWJtcHZJTlpaUGU2bFUxZ0Vzd2wraHdObUgvTmp4dFdNQ2lDU0w4b2ty?=
 =?utf-8?B?aE9JZXgzdGs2bWRmajZ2eE5Uc0lsSWI0Q1JkekkxcmZFOHNZK0FCbHc2TnBi?=
 =?utf-8?B?NXVHRUNIZmx0Vngxa2FDbjhOZ3BOWWJjUXRYWStKRGhKcFZ5Z1dxWnZSSmlY?=
 =?utf-8?B?aHo2OFVjSGgrdEZCTTg5VUliYVRMdzdqdHdlSXN4SmE3QlVQQXhXWXVRdkRV?=
 =?utf-8?B?WW5yVVhCY0dQSk1qVlhuYS9udlFxUDhWU3FWWGpWNThwL2MxRExsYTcxWW9p?=
 =?utf-8?B?ZnhDRllSTzR6bnlmMklTa3pWV3R1YTllTTFMVzlaa2phdm5vdlNMWlVSYjlT?=
 =?utf-8?B?WUo2V3JuYTNBRURDUlJScnAxWTNkQ0llYURVTTVyRmN4UDVHb3grRGlWbjh1?=
 =?utf-8?B?dGdYN1F3cmdoaFZsb01CWlY0b1hWdEwrbVlscTgxbFdXWm5HVGRCS3hOK1p2?=
 =?utf-8?B?UVNOWW5zLzNyOXRxS3VtRFYvWE1JRnNvb3dseEc2cnRsclkzMkJCSzF4aHdX?=
 =?utf-8?B?Z2NWUnpWaS9vSUpwcUhTYlZkamM2MW9UUndJOTBxVENYK2hQVmRiUTVjTW8z?=
 =?utf-8?B?K0ZBelYrUmt1R2RsNlBWelRFNTBJUWEybTg2Ym90dE1PK0YvTTZ5b1BybWZR?=
 =?utf-8?B?Zmx6N1ppNEExQ3RFL0V4QXdYWHdteFVuL1Y4ZGY2ejJkV2tiM1IvOGZNM2h6?=
 =?utf-8?B?L3N5VDczOEFZenBwMXcwR0hEMUFyQnVjazhrZDdqUmVkZnBNTkxKU2MvbkVK?=
 =?utf-8?B?Qm5vYm9WcWY0YWJyQktMZENwZ3FMWDVmVWFpVlhOMGE0OUJ6OGlXellsOW1q?=
 =?utf-8?B?Ky9sdFN5em9OcEp2NVk2Mm5DZm5FSFZmZE52TktodTAxZ05ocTBvclNPK0tW?=
 =?utf-8?B?dkl1UVpuNlRVSjY0LzUwZzE3d1Z3Mm4ydUQrOUxKSk9YaVl1Y3QxSnNtNWg4?=
 =?utf-8?B?eFBhK2FZeThzZHAxaHlCeHNHaHROUTVlcDJLSHBLRjZVU05vdUd4YnJ3bk96?=
 =?utf-8?B?YXRoVVplWTNyNkIyVmtvaW5OL3ZqWkVCVm1UR3FKemt0V09OZ2R6cjNHcXdH?=
 =?utf-8?B?eTJCbzE2SmFJUkV2cXk5L2Nyb0Jtc05SRHFnY3BlMWx1VmdHdG13NjI1TGFa?=
 =?utf-8?B?NnJ6dWpwT2xaYUpJZkJyNTVydk56MHZweTV1UHFPQkRkeit6OGtVd2hsTFAw?=
 =?utf-8?B?Q2lyTFBJMEZHUjEzQ0tveDdjQ1BhNlNsd0RHQXNuRmpLWnlVQ2ZZbkdKV21S?=
 =?utf-8?B?aFR1RTBPVWpsdVN3NlZFUkF5bXh2Y21SMzBrSGE2Yk5EYlg3TTdNZkpDNDBS?=
 =?utf-8?B?d0J5bXkzNm9rRnNHKzZ3c3BvNHk0WVhYcUs4MFlndmRQNU1nM3ZuRHJ2QVVo?=
 =?utf-8?B?cmVrcjI3ekYydVhJcFd0dk5IVmd5a1hNY21mQytUd25EMVUrSjVJL2Nvc2pI?=
 =?utf-8?B?c1lUTHF6NCtwVG1LVllLTHdJclowY3FWSGVQMFdYQ0ZtWVpFVUZmSmxLSlJm?=
 =?utf-8?B?cTVzR21GT2xFRHVaam5mb2JQN1U1ZGN0WmgzV1dpM2lLd1c5MFFWRUN6ME13?=
 =?utf-8?Q?WFUUSN5Po4PxsgEhwQR9nom3/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb2888d-ed5e-46ee-f64a-08db60f6b895
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 10:14:58.0102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 01Ex+1FUXswdZARukih4OkARaWWnlSFsnQlPCJyJoAFeRG+pPUIobyijSbRvmI6uqMb6X+EUDBUVfTcrqKlP2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9205

On 24.05.2023 11:43, Luca Fancellu wrote:
> 
> 
>> On 23 May 2023, at 17:38, Anthony PERARD <anthony.perard@citrix.com> wrote:
>>
>> CFLAGS is just from Config.mk, instead use the flags used to build
>> Xen.
>>
>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>> ---
>>
>> Notes:
>>    I don't know if CFLAGS is even useful there, just --version without the
>>    flags might produce the same result.
>>
>> xen/build.mk | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/build.mk b/xen/build.mk
>> index e2a78aa806..d468bb6e26 100644
>> --- a/xen/build.mk
>> +++ b/xen/build.mk
>> @@ -23,7 +23,7 @@ define cmd_compile.h
>>    -e 's/@@whoami@@/$(XEN_WHOAMI)/g' \
>>    -e 's/@@domain@@/$(XEN_DOMAIN)/g' \
>>    -e 's/@@hostname@@/$(XEN_BUILD_HOST)/g' \
>> -    -e 's!@@compiler@@!$(shell $(CC) $(CFLAGS) --version 2>&1 | head -1)!g' \
>> +    -e 's!@@compiler@@!$(shell $(CC) $(XEN_CFLAGS) --version 2>&1 | head -1)!g' \
>>    -e 's/@@version@@/$(XEN_VERSION)/g' \
>>    -e 's/@@subversion@@/$(XEN_SUBVERSION)/g' \
>>    -e 's/@@extraversion@@/$(XEN_EXTRAVERSION)/g' \
>> -- 
>> Anthony PERARD
>>
>>
> 
> Yes I think Andrew is right, so I guess $(XEN_CFLAGS) can be dropped?
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Tested-by: Luca Fancellu <luca.fancellu@arm.com>
> 
> I’ve tested this patch with and without the $(XEN_CFLAGS), so if you drop it you can
> retain my r-by if you want.

I'm sorry, I didn't look back here to spot this extra sentence before
committing the edited patch, which as a result I've now put in without
your tags.

Jan

