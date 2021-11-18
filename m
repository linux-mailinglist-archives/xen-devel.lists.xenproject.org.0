Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB48455863
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 10:56:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227283.393066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mne9L-00049G-IP; Thu, 18 Nov 2021 09:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227283.393066; Thu, 18 Nov 2021 09:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mne9L-000471-EF; Thu, 18 Nov 2021 09:56:11 +0000
Received: by outflank-mailman (input) for mailman id 227283;
 Thu, 18 Nov 2021 09:56:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mne9K-00046v-3j
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 09:56:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0b56ce9-4855-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 10:56:08 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-8-XDNig28YMGWNxSS94660ew-1; Thu, 18 Nov 2021 10:56:07 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5904.eurprd04.prod.outlook.com (2603:10a6:803:e6::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Thu, 18 Nov
 2021 09:56:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 09:56:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P250CA0028.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 09:56:04 +0000
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
X-Inumbo-ID: c0b56ce9-4855-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637229368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t76qZVa18ssaCE3fEw7q8ZCroRiWjv9laCR6W4EkqEE=;
	b=DYcVVCImtOhcYI8OWTsE8ViH+WSKFZRMAyXCjXjJeX2KNYQOPC4mfhuAcm97AAEpq1bYb1
	fY7s3WY06bfeNr58yO5yCtv/RqZSLum25b7RxaNeGULzeZVexKMmcRb+3epJ8YUT2Lq0wR
	rJ95K9foa+/swsCJ/8LttRQQqLUQXzM=
X-MC-Unique: XDNig28YMGWNxSS94660ew-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPCVUByVLXy2ebdU1zmxeGHoOtyPO7hH+CU+6EWGl1cKA+resPEhHWhIbUxRtTT4Q2iQi0k0SoHLrz1Ce9aUDRKFuun2xrRqo8Azi1k6xrJBLJO8f75dzGkos+9w/wnNNR7DyDFjJMdCh3fpGuEmMKIT/LnjzLxa44wohX/ZVAbtg8maLrJH9rz3ka6m2c/mlwOKAaINlNSQJl74SfDYx7n7eeIvTlZ0Ro5aLTJ3xOU4p1gICmDevze8xSOCRrcTjEnd9QfGeORos+0lyuvoV1BrGKb/oAAaXs0c/qPQltU/6hlnZxfEiq8gI/Ss/e2Lid5uyANRA+frd4TU//ox5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t76qZVa18ssaCE3fEw7q8ZCroRiWjv9laCR6W4EkqEE=;
 b=DcgRh4fF0dK/fMLi8P8SVWPJcx2/yGxgE5Kj7MyJc18zgGFpuwLlSoRhw8aEPmvSlAjD0z5bhByYhrJ7SrTO6nJUoPydaYINgOtzZvGHQ8kk0KSzoSF9I+O5LxQK8hYH9QvEMDsRFylOCuy7WMkO8RLK+j943NxhUyAgvACKk3KlALYREcuAD3cGfpCppTUz/8/yxlQjQmh5QJ9I2u3ZxeIQpGIIfObNAdv6WZNydK2Y+67XqeDI7EPyuwoVIu71EacvYxFsw1ud6R6KvsxnYdBv8ppZsb8tNe/fSoLw3EJY0RpR8GC1rM5E6YWNCS1hC+NRHcuGuDs6ZgRjt+FGww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <81ec6518-1929-293a-6a6a-74844b119580@suse.com>
Date: Thu, 18 Nov 2021 10:56:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] xen/smp: Support NULL IPI function pointers
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20211117164852.16394-1-andrew.cooper3@citrix.com>
 <bdfc59ab-87cb-26bf-78f6-bc521e7bdd5b@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bdfc59ab-87cb-26bf-78f6-bc521e7bdd5b@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P250CA0028.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d18a707-21d5-49c3-a921-08d9aa79a2fe
X-MS-TrafficTypeDiagnostic: VI1PR04MB5904:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5904297ECB14F72507715C1EB39B9@VI1PR04MB5904.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3gQfRqIontPEzXqBCsO9rOqkiALbaxb4yXSIqxGkNPOzkD6IekTNUYV8kJEmPT3o6KILIDGlxFMzOiCj+XLvyswBppAplPhFVohwL4N/iqXCtV1iE+VFIHBaDL3fdBcagmj+jdq4aKwK2pUJuQAHWvVL7MJbJzGrf99h8MfLJP6XcizH/nLf0+2OPBDO0ee5N/CmnjcecmXiJ6hPh65L4mJlAk//PnVyX4ommqySFU9fnOwEN+xwlE6JrmOqUV9bMHpirSRXVUyyA9hTP8fqChL0i0yICbZzWFR6dl47zZpU8w0YXqQYekLcCiG2OCx9fg2+WSCAkB4HgozOLSfLaOzI6YrQ+2VG4gV9uxUlTNIRCwhaZ41frfwe7UqiuM0Pe+qG5ICy+bmlEDSkZZpIBaZ1Nre3ka+d+W9ezYufAaRD+CywjXfFDB/ISyLzgFyY/SQIbYtGLwu41AQ7+CaYEseYc4nmzPgtHeORQt0Ys2s33HSCveI9pGJVvo6zcDS3e7IOWbcJZdbo0H0AhgVbpgLOErslXnN3gdQmyE/J48d+PkNkGtSo97CATNTjLdYKsXVvoRzqfZkAA7PnrcPAZMgwex3J8OXrxtaMNgATYEN5myHs1bBpPRqL9GyJUJxZz23fMIURrzIzjsmZEpKaauKHdPMr79n8AvZDC3tM3cUgYRvcoj9pffiEzArYNvhttgMV4sHhIPNMGGELEOFSC8owAKLWwsftI5KgjqRcrNKfEIjdUOLTQmx3DyJqpp8V
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(26005)(8936002)(186003)(53546011)(31686004)(66946007)(66476007)(66556008)(86362001)(31696002)(8676002)(38100700002)(956004)(508600001)(5660300002)(4326008)(6916009)(2616005)(54906003)(16576012)(6486002)(36756003)(4744005)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGxKU2V1QkZqcDZhUG1YaTlkcXdnenY2QWxPQWVTM3pJUTMyU1pnbzl6N2Nr?=
 =?utf-8?B?cmVBQkVSZGg3Wm5oTE44cVJzV2hyVEYrTTdTTGFYQXBRR3grZCtMTFVlR0t1?=
 =?utf-8?B?MHN5bzJ6dCtCYnBua3o3S3JrZ0xrRHR3QzF6NjZtRDFCU2RyVmZTeVFjWXd4?=
 =?utf-8?B?cmNDL015Y212b2NJSFVyejdPS3JXMEdlVXM2c0VOdVFJTUcrK1VzdDRVWk9G?=
 =?utf-8?B?bGt0UCtZbHkrSzIrN001K0RqcG5BOEJOTHhxNzU0citxNnlJUUpJTUNTSU9r?=
 =?utf-8?B?NWVQZHQyTlZJRUtVb2FmQndKaTFwTVBaT1BqSXN1QzJvQlJTK2FtSDU4ME1P?=
 =?utf-8?B?ZEtDMjErbFFyeVVEMEovZHZqODJyd2hvMU1XUkxSWDRoeFYvcXQvUStRQzFN?=
 =?utf-8?B?cWxJTWtCdDI1b2NQZFV4clU2UjRSald2NlQxUGpJakJFZTZ1YlIySU1pd3V6?=
 =?utf-8?B?Q2lETXRyc2ZJTkw1dEJGQTdmNENpcDhQSDZoRmZXQUx6T09CTlVWNlYvRjcr?=
 =?utf-8?B?MWRUQ2RlTFY2dHRMVzVkMjVYK0M0UDlUaUU4UXZYVjNyNUowRElUejA0Mnhq?=
 =?utf-8?B?TXFxSjRYSklwM21DYUtEQ2NiMkpKV0FrU2I3SDUzbG1VckJINnZFVVV1cHln?=
 =?utf-8?B?OTVocFN4Vkt0Q2xlajd0MnlFRVFVbjRKYTRSZE44akJUeEY1aVVlWHpORHNi?=
 =?utf-8?B?cVlaTktkR3pVZkxSVmZXN1FQanBqajVUNUlpQU8yaEt1NW50SCt4MmRFN0px?=
 =?utf-8?B?aW42RGYzdzdraHplTTV0bmc1TWtoU1pqNHJDL1IwWG1xTkhDNlhVWXBaRS9m?=
 =?utf-8?B?ZjZiQmNGTHV3VVJHczRIbnBRWTlVWmZodGozWlJTdTg0UzdiK1huK3A0MzR1?=
 =?utf-8?B?K05td2dMSDBSRHNkcllucUJnczkyRzcyQ3pwbTNncGdGTDFId2l6Nlk5cHQ2?=
 =?utf-8?B?WTNrTUVENS9lV2ZOT04weUNjTDdKOGFReHJaSmNNWUJYS2kwY2w2dlNDRGxL?=
 =?utf-8?B?bExkTnZOSlhRaGRIVllpREpzUjFaeFNGazVReHZ1aVVFQTA5NGVveDNTczBy?=
 =?utf-8?B?dkFta0FwTUgzSHF2dTd1bGxiQnVYMkIyeFhFOFNDOHE0UTRWNWdsOGZPNFVI?=
 =?utf-8?B?anhpMUtLV3ZmTGNmZzk4eVk2NnNXWkZvb29OOEE3MUZ1Z1c4Uld3RnFnQVdD?=
 =?utf-8?B?Tlh0a2hadElRLzlTT01IWTVOUlRHZ3RTZmlZR1laVUU1ZWd4clc5RU9xbnM1?=
 =?utf-8?B?U3pBdVlpN3dmUGJQbGRNRld4RVEwbFRlbTA1azdvRE9vekRPY0ZRcmQvMjV3?=
 =?utf-8?B?a3hzcC9xdHlwaXd0ZzdYUlJPYWtxSUJoemRFQWdQWVg5Y3lRSmwvYWJMdDZ0?=
 =?utf-8?B?aFJscGFnU1BpV2JqaVBqcXJaNUM2d05XM3JOT01NUVgzam1tRTl0UjVjQUtt?=
 =?utf-8?B?Y1g0NnpEYWs3VmxKNExUbTVIa2ZCRjFPdVdwR2FnSjZkRTdZZzJIUXNOQ2Ro?=
 =?utf-8?B?VlBtYWVxcjIrSmkyTDJvdDVOam5RVmJIdlNraitibE56MmZ6UEZsUUQxSjh5?=
 =?utf-8?B?UTVnTTFmckNqamd6QVNZR0wxM0xpZGhlcVpGVmYzYVF2alRnL2xGTk1jeGx3?=
 =?utf-8?B?dmhPdzErNWl6d0ZVekxUdXVtS1BZMzUwS0JUTWk3MnhKbDhpNHh5VXlGTllm?=
 =?utf-8?B?Znh3Y00zUitaTTBsNWJsQldPeis0VllOMk9oSFVNclNJdW9jZFBuNTI5R3Yy?=
 =?utf-8?B?VGtGY2lTYmZreDhpL2drOTNrazFTUU1sRG1ibS9CR09GU0NVSGhIYk1GV2lu?=
 =?utf-8?B?aWxsaSsrc1BpWElrL2t5OFJQNlNPNURaMVRVN3BXdnllaXVCczAwZDc5Y0dK?=
 =?utf-8?B?RzJGUEx0YUMxV1RzQWtTSUtpcUpkSzFOamo1RW9vOEJEUzFhd1lONXEvVmtI?=
 =?utf-8?B?aVA1MnJMSU94dktjUXdrR2YwVWJsWjYxOUtkVkhUU2tlMm4zck5iU1EvR05F?=
 =?utf-8?B?em8rUC8zTUdjQUd5ZldLSTdOYzZWcjlWYWZmSTFEYmlmK3hXekNlSE9RWWFZ?=
 =?utf-8?B?YTN6L01qK1ZyUjl2d3Y1ZFNIb3BqdWk2VE8zTmtJazZQWjFISisvMjE1UDI4?=
 =?utf-8?B?SkVkS2VCcnhkaWdwc3EvdGpxcFd5U2krTG5URFNRQ2VySFFlUUhtNzE1enlN?=
 =?utf-8?Q?Zh9kz8v/5rqrvLHV1/3RW0M=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d18a707-21d5-49c3-a921-08d9aa79a2fe
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 09:56:05.3378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NPs/GIrGilu4x5LBIcL4xCAGfBkHub6SICYem/yLhyPdXrN2lAg0iaTLTtFjfdp/BMlf1S8UrKxa3BbENH9mug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5904

On 18.11.2021 07:51, Wei Chen wrote:
> On 2021/11/18 0:48, Andrew Cooper wrote:
>> --- a/xen/common/smp.c
>> +++ b/xen/common/smp.c
>> @@ -87,10 +87,14 @@ void smp_call_function_interrupt(void)
>>   
>>       irq_enter();
>>   
>> +    if ( unlikely(!func) )
>> +        goto no_func;
>> +
>>       if ( call_data.wait )
>>       {
>>           (*func)(info);
>>           smp_mb();
>> +    no_func:
>>           cpumask_clear_cpu(cpu, &call_data.selected);
>>       }
>>       else
> 
> Why only apply to call_data.wait non-zero case?
> Is it because func will not be NULL when call_data.wait is zero?

No. call_data.wait is irrelevant when no function is to be called.
If you look at the "else" branch, all that would be needed there
is again just the cpumask_clear_cpu() invocation. Hence easiest to
wire it like Andrew did (leaving aside my personal dislike of goto).

Jan


