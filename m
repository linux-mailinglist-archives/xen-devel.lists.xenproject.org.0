Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C31710C62
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 14:50:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539581.840611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2APx-0004vx-Oy; Thu, 25 May 2023 12:50:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539581.840611; Thu, 25 May 2023 12:50:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2APx-0004tb-M5; Thu, 25 May 2023 12:50:09 +0000
Received: by outflank-mailman (input) for mailman id 539581;
 Thu, 25 May 2023 12:50:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q2APw-00043X-AN
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 12:50:08 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aca77a17-fafa-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 14:50:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7307.eurprd04.prod.outlook.com (2603:10a6:102:84::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 12:50:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 12:50:04 +0000
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
X-Inumbo-ID: aca77a17-fafa-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtITCzKaIiJJFak2vVHIbwQybhzvpGF/X/kFgP0YdvzBbho+mkt1GwTHiiCJXOQ/jFXbdy4wsZMed5KcBMsmqolov7BDwLB8DBoqC1HGo4ZyBUXM11nmH/Kfki6cOPMwAN4cT2gdFnmADBMmpz9nWncj6P1+avcx4ObFmr/w+B7NpW+yG4F0B0+nlI9XM1zXelfgKPYlVBJ1xikCGDzwyJMby6GPm94Kc1ESL+Zv/5ZXjI59iEI8rIW1Bqgx5p20CpYN87kckaZMq20a46kTgvakC25QNRClgNjNYsVGI7By4ZvdmQ9Gf85cdpcZcwmMNX2SvpOk6TvtH8+oyvdZlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUrh6mM0e6631BB3xw5QIAo8gpsPFec7oLGrtfQnYfU=;
 b=HZz1wPDze80WQNEGORDFAm5NP7D1V4ALg1nSyP7eVEgnyokR+ibPqXWFJRFvU41n0pLk79kFv8SNSIQ7UhGlAeIIYahOSz3OS+u3Wdlyuh4IH22FyPm9KKmkBaSCw11z1lc13cN2KruBuQAP9SP3nwyDva0LoNSievg1kMN3LCYcStLbvfi5UDmK73DRp87pGpqbASD2UkdsBvTfwOsaQ7PAlhbNAK0yr4OBHRK84WJz/+wyWbT6eT++HKfIM6K0u2QWbPzWlheGsSCvV1DAO3lOD51v1zRjjg//uT5VE9QotgFHSXbhlFsoFZeBZea98dwIdKGoFUSEY0MebhZCsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUrh6mM0e6631BB3xw5QIAo8gpsPFec7oLGrtfQnYfU=;
 b=NTUGlHVObS53LytWR2KsP+AIxDhSLRrNKTOpyTNIRMvLbE9+G77CalXhAcU5DEbyXn4+a18vpQZPWFUbUvlybFiJ+UZ8leYoY0xObpX4S+Kvg+pB+DJvOxUV9B2Mnwx6iCbvsgY+1q95KeiYnvzDlfanHU5s5NtAQE3jz6b7LopjLuMpvhNIvDhrA2leg5PKWTu3JYOWU9Sl+YBADiJlS4ywwCUmWd6dWouOit/WEjk2rFj9qhS0ZfRKg+pOBFqAy7KuycDLuIFnenhwjq1Zt11QxZoKY/Gvgx0CzD4riDGOJNUeD8tTAk96zcF1mIiQ6TMXtzu7kXb+9WTuLY+m0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <45f240fb-6f07-f132-1071-f6783f8121af@suse.com>
Date: Thu, 25 May 2023 14:50:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH 13/15] build: fix compile.h compiler version command
 line
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Luca Fancellu <Luca.Fancellu@arm.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-14-anthony.perard@citrix.com>
 <35D40E55-2D93-431A-8B16-FCFEBBDA25B1@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <35D40E55-2D93-431A-8B16-FCFEBBDA25B1@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7307:EE_
X-MS-Office365-Filtering-Correlation-Id: c30c2009-d87e-4121-6d27-08db5d1e8fc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dvB/K+0B9WNxQxCR2r6e8uzdtk2uskIc0A9BNU+0lqfvGOnmYY/3M/gs6DuMmPWkqbylzHQrquQ4qaTyGKpFO5sZfqhJ591hos0Cfv4YaUDBkNh7zQQcCHnAZ6RpM9Awng7RJHLe+DK67kRMifODsf70FIcTFaYsEXnmQKfdNyheU33gPAwnq0XY4cqScLR4Hhq6lVpzEvtupX6ZCjwprB5llQqXZy7UIEbyKq+tsd9uC9a7qC9FiOnLwlDnvXqwAX+m6ycjrEUmb5OwNf4KTM1jxAnAj9EO76JB7VK/aGwHMn4kUkkSkNS8YTmTu0nNVSiJRPiLOuI1bqT0G/oWOX3t33xjmrhIkuoLWhMwzvmuQaEYvG9LndoNhVDOebj5DtgMHGk0Vi98K6yNrPSlSNzOCyTLO7HQWeSDtTWgSR1zBd/6GF4mPLeWAd7isGrKvAphJuG4amKIyeaBUzGfW0dbXz3ab5GNC+zdFI0iFZGkOIqVdUs+4OuySgbhv/z15Yq+c+jRQUeRJ4sxe4antzFNs9yYKXLwwqMmImJLvX2UaPn+S/Q4l431RcDa2HNoW4hKW9T9EEmUbNVTuUDpzjd318WEJ0a9d+KoROynxSojBlkBVUrul4ZC3HGiMVnwM4B11qKu+S1HL2PbW0MU3w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(396003)(136003)(376002)(39860400002)(451199021)(6486002)(41300700001)(26005)(6506007)(6512007)(8676002)(8936002)(36756003)(38100700002)(5660300002)(2616005)(83380400001)(31696002)(2906002)(53546011)(186003)(86362001)(6916009)(66476007)(4326008)(66946007)(66556008)(31686004)(54906003)(478600001)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzI0aENuRkxjRVlwUGErODArcndoR2htR2V0V09mbjVCUGF0Q3FDWDh4Y2Vm?=
 =?utf-8?B?c2FHQUV1WThBdjJobGwyT1dQaUR1UldYa3ZvZ1YxaHJuS0F6Q25iclpYZURn?=
 =?utf-8?B?QWQ2YzM3NFFGRHdYM29sYVAwN2VocDg5bGJVZDRJNWR2cXNCOGRkQUUrUE9Y?=
 =?utf-8?B?L1ZRVHRNT0dyU3VaVXFDNitOM3ExNU1UMWhYZGVUTmVjZ0pxeXg0a2Q4VXUw?=
 =?utf-8?B?UC80alA1LzRPdmpObGZ2YWZiMWRuUFVGMUhmVlV6eWdlZk03MERvNVl5VlRB?=
 =?utf-8?B?L01vVnFuazlFakZOR3VQWFZzVllEUExSRGNzaDhaTW90aXA1alU3T0VkVXlI?=
 =?utf-8?B?eGNpSTVLUmcwWDdjR2haZlhEcm9wdE1ZV3pJUUlWNXZJQmpWZFZDSUZSQWJr?=
 =?utf-8?B?UWFQdlRhVWNTeDJZbVdBZHFzeE5Sa0hUT0JCU0pDNGYvbFB5WE9QemUwT3pK?=
 =?utf-8?B?Um1uNDd6L0RYR3lYTGZxek1TUHZScTNtUlcvYmtMOHkvYWM3WXhzdnlXYldR?=
 =?utf-8?B?M2JQNTJzMmFUaktvMlFuazExZHBIZ3B5Z0YyQW45UjNXdkhvcjZKV0xXNTND?=
 =?utf-8?B?b2FwTk1zMjVjdTVuN0MwRlFLZlpNTXcyYk40eWlOdlN1SjEvRTBNc0NwU0tu?=
 =?utf-8?B?NFphRUEwVnNHUDg5QWtEcHhmU1JKd1NmSmI2MUdOSkxDc3ZDZjI2VTM2QVhH?=
 =?utf-8?B?ek5wZGpVRmJGazR0VC9oVFRacStJa3FJYWlNZkhJMWdZKzJUV0psT2pPK0tG?=
 =?utf-8?B?ZGVBZ1dTSlk5VGI0K0F5UldVUUgzb1N5WVZYK1lmNGlURFZJNm44L2c1a3kw?=
 =?utf-8?B?eTlJMGFJdkhzS0k1NmF2ZEUzcElkRkJoenVGMDlYekdWRXRiQ2lTOG9rcllw?=
 =?utf-8?B?aTYrQWVQOHhxb1dRM1puMkNTUFlIZ0dxRlNGK1J3a0o1c1FGZUdMVDZ3VXpG?=
 =?utf-8?B?WjFhSXgrMHVaQWdoN2ZpZGVZUTNkWDVhblRPTVA1NXVURFJaLzU2ankveTNF?=
 =?utf-8?B?QXpMclo3SjFnMGw3c0Fnb3cxRjFhOHU1UzRvbzdpck1jeDRWN1JnOXVOR3Rx?=
 =?utf-8?B?UXUzUkFjQ1ppM0JWOFNlTGJKMUhuL3dpQm1mOVN6N2RtYnpQT1NLWFdBTlJJ?=
 =?utf-8?B?dFJ2cm5IaTB5MkpPM01HTDBMUnVxdDFLZ3BmRmV5bWpGcmZiZkU5SEt1WnU4?=
 =?utf-8?B?U2grT3Q4WXlSeVBabTdlaEtYRm02amZ3bnd6WU5FdVEwaHcwK2RJa2w5Z3Z4?=
 =?utf-8?B?RHl1bEpCeDcyV2FBWVcydE5vcmVvVDNzM3VxbTRXVnB4c3F5K3M5ajlJV212?=
 =?utf-8?B?cS9tSTZ3RytZWUtBNUZ4OGR1ZHJZazZNRmhhd0l4MG4yWnJrY0RNYzRyaVBY?=
 =?utf-8?B?b1QzbjRCM1JYeU5YUmp6YU1Xb2Z6TDNSaTJPOUZOb0M5WjJqSDhzWHpaVWh0?=
 =?utf-8?B?K0JsZlZUcnlYYzk1Z2E1a203Q3hEd0xlWGxaOGFRYldhdkFJOTVDcituUzV4?=
 =?utf-8?B?d3lwSGlvYkZnY3BuTXo2VXdXU3U3RFd1eDNnc0d4NUoxWERycUlKckdLN3Fa?=
 =?utf-8?B?ek1SaXZ6bFFOMGphY0ZOOThiUjFZd2hhcjl4dGV1S0s1M1NJWXpSYjFYQ3Q1?=
 =?utf-8?B?VU93WHFHNmFQUVp0cTFrQlFWT3lPWGN4UlFyemFSVnZzVHBMZWMxNWcyVnlm?=
 =?utf-8?B?YmdhOHMrbG5NZWVVbEhCcDk2TWpKNWtXaGZIUlVlWk9ZL1RyZCtpcUw1N2Mz?=
 =?utf-8?B?U3BFeGdHeFVER1Q0eGhTWUM3VktsaDdZWWpBeFZWM1BmU3Vobngxa0I1d1NZ?=
 =?utf-8?B?TVFlMUs5cWprRUVhb0gvRWNvYm1RQWV5RHZvcnpRMStpNGpRQkowMS9EcktX?=
 =?utf-8?B?Z2s2OTdlU2JkMUlnK2VYY3JQYWh3RXk4eEh1Ym9QKzZ5MGx1bDlvcjVORDRm?=
 =?utf-8?B?dWdkMjV3LzRRcUNvU0tNQ1k2Slc3cEpwN2ZLbUxFdWNDTW9MV0p0NVUxczZu?=
 =?utf-8?B?ZEc3SEkwdWRDTmF2QmtnWE5lYUZrbDFFVlVFd0E2N0FSaVg5dGtEOExSZUcx?=
 =?utf-8?B?SWRMdXJLdHZ0NWpjRmJzOFRiMzExWVNVYUJyQlFZNFFnekViUmtDYjlDN1BC?=
 =?utf-8?Q?G1vAZP4BmXg2vNR9Je3qgqCMZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c30c2009-d87e-4121-6d27-08db5d1e8fc7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 12:50:04.7125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V/ESDcVXzQatiP0XuuWn/JkmdOz+smac9B/z1B8IAf2p07mjb+3UsrMS3dywwVb9jX5WrOLU5FWbYfQK7ExGAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7307

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

Acked-by: Jan Beulich <jbeulich@suse.com>
preferably with the $(CFLAGS) dropped, which again I'd be happy to do
while committing.

Jan

