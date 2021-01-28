Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A9F30746A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 12:08:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76906.138995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l559x-00089v-GC; Thu, 28 Jan 2021 11:08:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76906.138995; Thu, 28 Jan 2021 11:08:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l559x-00089V-Cr; Thu, 28 Jan 2021 11:08:21 +0000
Received: by outflank-mailman (input) for mailman id 76906;
 Thu, 28 Jan 2021 11:08:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0GBf=G7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l559v-00089Q-W1
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 11:08:20 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e9e3456-0666-4900-b8b8-aa98672a31a5;
 Thu, 28 Jan 2021 11:08:19 +0000 (UTC)
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
X-Inumbo-ID: 6e9e3456-0666-4900-b8b8-aa98672a31a5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611832099;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YG1dyJcp0YxGJqhiFf1ZBmpf5b76RqbD8JACW5ihups=;
  b=ERlCHzvhKLdqvXbaRpde2FJ8okqZ7n/jlnp1AkF77KlSIoyg5bxfBAFl
   7a5XVivj6nJ4E6wN5OLMj68DPD86P8EG2TRgv5yr13bT2H9bLxqar5TeQ
   KR5NNfaQiEX9/oi5pfb8ccDw69FNDAeyBdEWVci2jrHt4wXoXAsOPUami
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4xEUHXBOvlsjCvG9Z47BQgzASQC7ryGsDWyjoOl9h4JLAuz2rDv6RTDTCduqhhObBiVotTKC5k
 yhCz6Y/q9iL2+mj42DFakkahXm7x7ZolbOINAzYT60OIiEYs3XUaz3ha1GpnLNlwlewzx9v24e
 Xxp9BakuP0lrDCsfQIVgX45xGN8kS0Txljy1ngy5eTat6FuZaJVeC+lvxpSDSBfFZUVmjQiXwD
 a6Xsl4FkbfmdFcILvKrhxK9SbjyAl75gBOw3qAIFZVFYzEGOrRw4jU5g/tbzntLJBO7Fy/3I4Q
 908=
X-SBRS: 5.2
X-MesageID: 37366043
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,382,1602561600"; 
   d="scan'208";a="37366043"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTLZVBHBsboHVbMCyl9RYfk96t2oglt8KpS06LAO+7G+VEBbWS2ATtYimkj7rFpD5SvxozMrZsnXIXq46fl4wE4dEGgHqSZ7VrKlDwQx03su8jft8i52tQIPJ5/temJrWoBWNTDUgf8y1Eg5BvzxihvScBVt4NydyO/26EToB5QPdgM6lkOrwCQLjsPv23qD+WZpfJIwax1mNTwvVD2rFohGTT/xGiElC+OcABhbfXlntBmEaFOI1m4bKxZLeS5AXxfhIXZ1Tp3xIDbLP6gh2I60qKyaAKpwfshjbtkuR5zVcaTmWi/Nggm4pKtoz4Z8uxWSzcG8AVIjIgqwHetJrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PkgjC5Lggw+0gXxldoq+6WzT3YSD1HXef58em5pItLg=;
 b=a2M+W+a2BRo2exm7Qo19M8sAlZ9lYMmqGXCijChUFgUU361gwtCXfP9pf4tpWJvXPVVc7kKreHRry4J4qigOReT+W0fwuust0mL48ve2CgC4pHSp0z3NPHUkOUG1iLc6hPI+LupU3L/4BDGYJnEfZIRk4ZqOtPso/CUMEjI5f6m2gB/jif+eFUPcjDVqcSVUE1ymt4VCnrMwrfp2rmohvvP9VHTls4zKyNfSPg2FavQQ4EmHrfxioOPCThJWDtazGkf9Awrt1AUDUYeWHlm7+rlFp1vcK3GhE2UyA0g2nCWQX1kvgVQL1WRxXYEgYxQMIFKoJQKtd6+hRgWNegwI+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PkgjC5Lggw+0gXxldoq+6WzT3YSD1HXef58em5pItLg=;
 b=dgX2urOPA5ThjxnsjlI62y4J+QFGClHaiuma7JB0L3FewdGWZ81oFdYDR0s3apqfCBhVL9sbzWYFZLOkdoxaelsQexohblZA49SVh4iqsn/q9vT9uymmNXDPCHG882kEXQ2l7KiUSrbCS3OACs/rKydXajSV80FHP4Sc3pbTR/M=
Subject: Re: [PATCH v2] libs/store: make build without PTHREAD_STACK_MIN
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Manuel Bouyer
	<bouyer@netbsd.org>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>
References: <20210126224800.1246-1-bouyer@netbsd.org>
 <20210126224800.1246-13-bouyer@netbsd.org> <YBKYkXSMSAGnUXZh@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5006fc16-6806-28db-197c-330e131ccb8c@citrix.com>
Date: Thu, 28 Jan 2021 11:08:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <YBKYkXSMSAGnUXZh@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0492.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::11) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a1603b9-178c-4451-9034-08d8c37d021f
X-MS-TrafficTypeDiagnostic: BYAPR03MB3414:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3414F2DF0F74B6401FB4EDE6BABA9@BYAPR03MB3414.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8s3bTh9WpCyt6ZPfavj7rx9lu3lqd5lYOulUdaR4VN7W6PnJR31YpqL0PQ3g2gqSG+SCsGP3Eb9vSy3+M3mxb9E6irsVsBQYhAjS+UCJI2qBbUIXgfyi2Dn/prItO7+Gx6QOMqVkTMEpcCM72bnXVMjlZ8QkOX7FsU98IwihJkXcBirnx8Q7kCA2NJ0+k+kJBv7XVBOTxycg4EK1rUXNnkleMRsK7fMPDG9KaPEngdcUvmB8DVYg0+XXOo3aK1nC//HxWqh7XQZ+Ygnukg6oiJkK3KS0+fg+mnGmF2TX3k6p+v/FecbZdL0IlnFlG4UGaiNypnvHq2uHz1kp66FjmYCacrEYq0gikS06Tx22f4TUz5nIiYavMVG4VLZOnLeM3i7wc3vqI19TEJOEEhRMXAHpdg4vNciQ89RNGdePKgmrS8uniuZuAL8gpnHXfmn6h0U7ePZf/Zp5v435ef1n01Hdqdp8sD/plZTqY7l9UF06riVO7W2h+F62N5TXVBluZkpcIJxjqyyvybvbOZfIWpE25EBHLa64cQ5GCWAJbn4RiGpSkk9sW3gtytGL84FTy34bQOBosJEgFMos1RjMlkEH/5ymcmHkg47MgG9KyWI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(5660300002)(86362001)(36756003)(186003)(54906003)(8936002)(316002)(8676002)(478600001)(26005)(2906002)(31686004)(4326008)(6486002)(16576012)(53546011)(16526019)(2616005)(66556008)(110136005)(66476007)(956004)(6666004)(66946007)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aUg1TW9pWkdLTnlPdWdnQm84WmFmbS9JUEd4NTVkK1hMSG1qLzk5UjVOajBD?=
 =?utf-8?B?YXZvNzUzelZlcE9LdytkTFd2b0dlWlg5bTZtQVlhNXRlUkM4dnB3U2hlSHhW?=
 =?utf-8?B?akVkeWlWSlFXNllDREdCUkx0eWZkK1dKZ2YzOUpZTWZhVnJ0Y0NxZjJ3OWRX?=
 =?utf-8?B?UkZManp4NkZvNWhtVkIzeVFieUp0b3V1alhBVkI1U2RORldSRUFaNEpMZUl1?=
 =?utf-8?B?NEV6WGpocHU3dWR2eEE5SjF5U1cxVlJ1a2tuZUVYV1NDZTlwY2JPckl1c0NR?=
 =?utf-8?B?WC9vZHgvclMwcWVXSm5GQjl1aHIvSERXeE5aWlNhUmpaYnhPbGxDaDI1TU8z?=
 =?utf-8?B?U3FJMHN1b2ozeVlIMjFWekxtYklmalpYdnA3c1lhWUsyT3k2aWFuQ2xnM3dU?=
 =?utf-8?B?RHZvOEdGUzRmTm1tODhMUUFJemNUdjU5MmlaZVJRMkYxVklKK1A2dTFiTWdR?=
 =?utf-8?B?ejVBZUV5QnQxRk14TUp4bmtncXZFYndWaXRxL0ZtazNpS0RUalgzdVBERDc2?=
 =?utf-8?B?K1g3bWdBa2xvVjBnRlBmYmhycUFSY2trcU84NUk0R041TWlqTjN2L21Bcjha?=
 =?utf-8?B?NDQvb2thYzA0VHcxbzRoQnFPay93ZTlTV1VYL1dKNi82dmtXUEZEckwrUVQv?=
 =?utf-8?B?OTdUU1hleERJZHhtbWRCRlhTZjZrLzh5VkFlcWFmOFo3aUc4Myt0KzBDZmoy?=
 =?utf-8?B?TXhiZ1VPWFVmZWRERWtzSk12S1I3bGl3SEhDajFtd2tuTlpwNlhNb1JKNHRZ?=
 =?utf-8?B?ckpPY1BTWHA4enFDV2ZoajhrTlNHSFR0Qmw5UE5KYWNnWW5pL3dqb2MyOHFj?=
 =?utf-8?B?dXdkemd1cG5pRG41ZlFvNUxheUYzWXpUUzF0dWkrbXQ4UFhCWmtFTCtYSTdJ?=
 =?utf-8?B?UFZvZ0VLb2dyclprZzcrelV0bHJQNzZsRlFSelludEwzcW9hT2xTZzluTTZP?=
 =?utf-8?B?Y1NVMFJQUUlwaXZCRjdGZ2tBVlY2TEdaSkZUWFNvVjJnN1hqMUhLV2RjdzdU?=
 =?utf-8?B?V0dMZ3laVURuV0dBTEVEendpejZvVlNPZnRKOWxZNWhKZSt1bVM2b3pSYmdG?=
 =?utf-8?B?VjhTSEdMUG5haEtkcTNvQmRJNFF2bVBreTBOcC9tN3Q3OTZZUUNYQm45SlBI?=
 =?utf-8?B?T294RkZEUnc0WVIxeDNQYVR6MStwZDJDaDZNUVMzSFFEMFRYTzVCS0d6dUkx?=
 =?utf-8?B?aDE1NUJldktjQjBqTWxzQndUUFNQZU9SUUQ2bWR2dGxBbG1qL0dqZUZscjdN?=
 =?utf-8?B?dXdSV2Y2RVA2UnFHOUo5eGp0djhTM1dnVVZDNnlZMnBHaUJvUFo3V0JmYXg1?=
 =?utf-8?B?Rm1GREdwYW9JL2lWOFdraFpPVm5SSHhJbDJvQVZuNjNCTTU3ZFFwVlBobHg4?=
 =?utf-8?B?ZkJkcTFvNDIxdm1OaWl4S0RTRDVaMkZRVkxIYURicjVyWTRycVVtQ3NLSWY5?=
 =?utf-8?B?YTJOayt5OEh3THhOT2tvakNkQU1hMUFJNTBHaE5nPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1603b9-178c-4451-9034-08d8c37d021f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 11:08:14.8705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ypaVWoDWO2qNWxhQLfZt3wZLoDKDv1RK9um4yBe2senqbVAUL0GuY+RbWiF1f6BCLq5iz5hNR/hPuGR3f0r4Z12BgdSy5o6ftRccQhku/rg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3414
X-OriginatorOrg: citrix.com

On 28/01/2021 10:57, Roger Pau Monné wrote:
> On Tue, Jan 26, 2021 at 11:47:59PM +0100, Manuel Bouyer wrote:
>> On NetBSD, PTHREAD_STACK_MIN is not available.
>> If PTHREAD_STACK_MIN is not defined, define it to 0 so that we fallback to
>> DEFAULT_THREAD_STACKSIZE
>>
> I would add:
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
>> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>
>> ---
>>  tools/libs/store/xs.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
>> index 4ac73ec317..b6ecbd787e 100644
>> --- a/tools/libs/store/xs.c
>> +++ b/tools/libs/store/xs.c
>> @@ -811,6 +811,11 @@ bool xs_watch(struct xs_handle *h, const char *path, const char *token)
>>  
>>  #ifdef USE_PTHREAD
>>  #define DEFAULT_THREAD_STACKSIZE (16 * 1024)
>> +/* NetBSD doesn't have PTHREAD_STACK_MIN. */
>> +#ifndef PTHREAD_STACK_MIN
>> +# define PTHREAD_STACK_MIN 0
>> +#endif
>> +
>>  #define READ_THREAD_STACKSIZE 					\
>>  	((DEFAULT_THREAD_STACKSIZE < PTHREAD_STACK_MIN) ? 	\
>>  	PTHREAD_STACK_MIN : DEFAULT_THREAD_STACKSIZE)
> There was also a suggestion to use MAX(PTHREAD_STACK_MIN,
> DEFAULT_THREAD_STACKSIZE). Is maybe MAX not defied here?

TBH, I was planning to submit an incremental cleanup doing this
separately.  It would be cleaner than putting cleanup into the "fix
NetBSD" patch.

~Andrew

