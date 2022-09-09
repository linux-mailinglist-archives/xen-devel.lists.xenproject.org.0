Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E96305B36FA
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 14:11:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404249.646636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWcqS-0006Zd-BZ; Fri, 09 Sep 2022 12:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404249.646636; Fri, 09 Sep 2022 12:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWcqS-0006Wl-7u; Fri, 09 Sep 2022 12:10:52 +0000
Received: by outflank-mailman (input) for mailman id 404249;
 Fri, 09 Sep 2022 12:10:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oWcqQ-0006W8-41
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 12:10:50 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2050.outbound.protection.outlook.com [40.107.104.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70c55f40-3038-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 14:10:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7274.eurprd04.prod.outlook.com (2603:10a6:102:91::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Fri, 9 Sep
 2022 12:10:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.019; Fri, 9 Sep 2022
 12:10:46 +0000
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
X-Inumbo-ID: 70c55f40-3038-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNxz4y3jHBPpVx+ALMuj73bpEemMK/aODnUuc14RdkY3U0QtAkwqDxceibyb9hxmrrALoAOJrokz21+wRxUxYDkeRzPQlen3JZxZm3yfPcYp2BUdAicq1rpPhFMBCuIQAGcY7m/mfo1XcMGozqUfYF43PWu4MR8YbfA1aS7FR14/hNwkDriw+nHl+PpKoKE0b/TypU0Qpcpm/2Il/+a/1PwVPn/dPgdsULNYUnzzycfZKfYPJg5/whJn81XWVvr3c2dIk/ARwSk1VnOeHncltOXGV4OTRf5xJY5E4z8rGCil9/weI5EPFxvi6u/C50vtgYZ2bPJKVSt13BICIkGiuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZ+pzLOSX6IqrMvfzGW5iPAa5yZL+aE8Ip8QkvxBh6I=;
 b=Y2NIK7gb3AHKSA47zExgyrUV8GfZ+nCmCWqsvulaUUTJPi/+X2cwBGcS6lSuSuJGcp+UuFwLcVuO2QxN7pdskV82DL1pfYLqITr7Tnv7POXMKteY1iqQc3tT+VepiUTHY1+jWGYsdvOo8JHLfDfNo7Q3mxQFRLKOe2Ia4WbkbYVu0AWkBPfbyrdPfW+I7/HPrT6Dq7LcfTVwaWM8OexvA8PCbNNkHaAN1IeT78VLXr1fZ6YZHN+idVubObH401l7HM1YOBeHHIPdQ51U+0kE5kC1jU1igwQRQgDgwXWOPcOqbqwK4FT01huH4zkBLriZyZcJEngHyFoJPzJIt0pibQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZ+pzLOSX6IqrMvfzGW5iPAa5yZL+aE8Ip8QkvxBh6I=;
 b=vEqPB5kadrtn34uS/QBCIGqpT6osBxhuZoo/blGxgS08ceZyc9LZzzih1E57751qsEhpMAJiKnU+DPmSytQ84BaXA9h5mNXGtlUlXzhcmhee3c0Nsa26/Ykx3XfDxULfMh6SkWaPrKm0igY6GLb6ziGd+T4EvVlVDuCNnO7W2XIFWEVVEk/WknljRiKUzKZwV8sIg+5oZvSy7GfKzW1LahSSfCEb8G44Ff3IBiX8CeEb9DdbLrk1aLIign7yVKXwz+xj3itUsBJE4aQG+b93nJ3JLL2Zsw5ISR0fAObz/QhEqWtjabO+NsQ8Q4jmXjg9xE7htusgLxODurafvczpTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f037e0c2-625f-dcad-a67a-6468392c14bd@suse.com>
Date: Fri, 9 Sep 2022 14:10:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] xsm/flask: adjust print messages to use %pd
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jandryuk@gmail.com, xen-devel@lists.xenproject.org
References: <20220909095012.4251-1-dpsmith@apertussolutions.com>
 <3da17c12-1cbe-165e-94f4-44face9a181f@suse.com>
 <e6568867-3296-58b2-8744-d1644e401528@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e6568867-3296-58b2-8744-d1644e401528@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR02CA0011.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::24) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7274:EE_
X-MS-Office365-Filtering-Correlation-Id: 6def7f3d-d83d-413d-0de4-08da925c53bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EPQPA6s2bR/zxT0tcGqwLKEzolKBa7smOKvwSZ2Rh8FJIJb7LYcb0QWCDE+AD0oNJksYibDnm56tRtTZA7XNJo3LXdNiUlI2a6e0OAvGOdJhgKkW9MBxPY8z3qpKhCvxge9t1U1nzIpi6PO84VzeOxCblE8xPJkMdRIfQpbR+uRALWRQmXifVte7YlZAHaCD47cvMPCSFpPQUqaf19ohXsesTLnT2y7Ke0cseMlTSaOJcr8HgRLL7/nFVqVV03Uqb7CA9CP1eVQekqQsB5sqighMxqznFjgcze3mBgxcVwZQmMtAa/BGeIl9YbarRAQ0vBO/g4X3yt2LPjZpZFg0YwobJi84Uj9IoUvT5TzfbEgHuuLovOMkswiO0w8xJo2CWqqMf8nD+IpH7Qtl4oQijgi+cdzO6kFPyQ5eggrHKUy9Cs3e26sAUUOk5r1OucpoE5HwN9Jle/tY3nkvmzOKKkg1zoNXrAKZgbSnXNorQ5V+eBlZgbtweDcNBzri83KVFkmOVzBLFsQ/wrG11qB9gpcTVKtwKvCOLtWSS/8MpPjczFnNK3oKNLe6SE7gX6lIglXNLKpdgXrWxn7Dzv/EbfPs/kpZU0bfBcXF/vPbb118dF2KT0kzbQTxxHWgMYyZvRwP6VyoB5YJ18QOqr16Jz2mtCg9q369rJgdPU6fOX91WB0IrrFoYqbmLf6r0hsqcwzaiZpIcLSmdPT9/bTYOWSvHDKwH7inHgkCKqNrCoaVVsLYY1TWX/dULq4PCwRe30k98FPqj7uhNs5vjC8A4QhsuDzhrXlTOS9d0KbXmlc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(396003)(39860400002)(376002)(366004)(53546011)(6506007)(38100700002)(8936002)(316002)(31686004)(2906002)(86362001)(6486002)(2616005)(8676002)(186003)(31696002)(66476007)(5660300002)(66556008)(4326008)(478600001)(6916009)(66946007)(26005)(15650500001)(6512007)(83380400001)(36756003)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkNxZlV4MHptUjI0YnhOQVNMREthdGRVMU53ZzF3emRsWE42U1JxZE5ET1Mz?=
 =?utf-8?B?aVIzM2phRDJWeVNWOUE3Z3VmUEZhTUZvTGtxZWZFekNRSmsrTnViUW1reHlm?=
 =?utf-8?B?ZnIrSlZlWG5jdWNmY1U4Z1ZtcGhzbHNKUFB0bXdtSmNYY0gyZUJQd2kyR1JD?=
 =?utf-8?B?UDlheG80dmJsVVU1TnBBSXduWm8wTXJUOHFhdnc1Qk53Nm5ncDhBWGFmTlNP?=
 =?utf-8?B?SmNtZlJpVUtuQXF1TUVtZnE4Z0F5TWRkK0dqS1FhVnhhUmV0a2lVNU1KUEFu?=
 =?utf-8?B?ZGNnNVJGcGY1S1J2TVQ0cE1SZFZuVmQrdCtYeGIyTVZmbTVuT2VpYWhZZVRp?=
 =?utf-8?B?bDQ5VVZqUTRCS2lFNDBBZk0vSzZRZ2g4eksyWW5VOEM5RFBRVEVwbDg2N0Vy?=
 =?utf-8?B?dDVJM1MyTjNsOXV1eXIzZU1XV1o5WXlEcE16SEgyZDFuUnU2WFFnVVhaWFNu?=
 =?utf-8?B?T1VqLzdlSzJVQ0VZSjVYeEp5RlZua1QyQVNveTlBbkttSERVNUtwMjlXbk1w?=
 =?utf-8?B?aWRyRWJONGNINW5PTkYzOFlHcUlYcjZxZ0NnUFM0V1ZGemtaMlJ4RTR4bkZR?=
 =?utf-8?B?UENQaFZ1L1E4bFJLV0xZeFhRSmc4emo4d0xSU21sQ1JuSkszTys5U1hZVm9q?=
 =?utf-8?B?S2lSNG5vMTBRMHpyVnFZTEkzVHU1NEQzOG83cTZqM3praXBtZitLem1yNDdy?=
 =?utf-8?B?M3dFdFIxREZ6ZE5tMDdxMS8xckI0MmFwVFNkelh3aTdFYUE4T1ZmSU5lZktQ?=
 =?utf-8?B?SlVCb2hLc3hPMFdGTFVNMGpuMGZJVEVqcENGOXVuVENyRU12L0VQQkNWZHRr?=
 =?utf-8?B?ZndKVW1BdjNwMmVYZFpkK2ptbStueURDZ1gzaVRDNHRYbjkvL1J5U2RxVHlV?=
 =?utf-8?B?Q3lUTmVEQm4ySVdUQStoTlFodFhkQi82cWRpWmRmbUlFYXI4cyt1anVwTkFE?=
 =?utf-8?B?dTJnY3ZZeEdndHpRZjN0QjdDaVhIUFgzV1RzdmJ4K0JMaVhQV0hqS0hkNmJr?=
 =?utf-8?B?UzdiRjV0dWJFKzFVSjE2WWcwaENha3lURTc0SjJnemJDM0lzeEtOUlh3cGMy?=
 =?utf-8?B?VWMvZUhIYzdmVENTci9zWldmaGhGNTk2Y2NrUDhMdDd2MUhUOXpscDlqQStn?=
 =?utf-8?B?UzRHQWJPblRISlJRdHRwK2dKSmVDdExob1JFR0J0VGh6RTkyY0tIL0NtdkpT?=
 =?utf-8?B?UGRQaXBPMmJITXJudG9vRVpzcStRNHFlcytsZ3lPSHhyejUyVEVIVTRiVnBP?=
 =?utf-8?B?dGR1L1QrQVhmRXlnQ1Uzdkhpa0NYNXhrZFQ5bC9WY0JaZTV0ZzdYWXdBVHIz?=
 =?utf-8?B?TjFvL2pES3FBa21BcmNiVEhBR0xWVFBRWW9wNk1abmw4NkYxT244NzB0eFF4?=
 =?utf-8?B?UTRKamVGd1Nnd21ha2xuZ1VpT2t4Q3NFdzllLzd2YkNiSllkaC9BV3BOQ25G?=
 =?utf-8?B?M3FrZGtHTzdqYkJUUTJZNTZmbHd1NWZmZWVtclFSaHgrNURFd0lDNzFBU2JO?=
 =?utf-8?B?SnQxVTBPb1BFenZkNUxBNnoxcTFISmpqZXBGcEU2SW9ja3JVNFNzNUppbm10?=
 =?utf-8?B?MkxtTEswUStROHFCMmRkYklQS1pFU21GbjNzUWFWLzBibXl6WGFFOUZET3VB?=
 =?utf-8?B?b0kzdm00R1doTlhVY0ZKWlkyekYzWUlrNU4wajM1cGxxZjJpVEFXL3lqREtV?=
 =?utf-8?B?aVE2aUJBSnQxb0cyN1dLektSdDVyRHJsQndQMERKV0d0Uk0xOUxFS3c1dEI3?=
 =?utf-8?B?aDdNMlZlWWhGSmVySVdlRitOQnlvZWQ4aklSU3Fud3I0ajNiUTVhZzh2aVU3?=
 =?utf-8?B?YXJ5Kyt5aTJ4OXg1dWFRblA3eWtENEIxdVR2aHJrd1VTOFNUR0p0c1NJMWJH?=
 =?utf-8?B?VVpTWDJrZHBtNzRCMWZiVE9LcXhRTWpMaW44OVF1WHBWUTUwSkxhUVU4OWha?=
 =?utf-8?B?Nzh1VG9TWXlaRzFJNWh3eWFxb3hNQ0lDUThpcTM2eTVuQWF4anVjVm9LYVp0?=
 =?utf-8?B?b2FYOEo1bVliTnFmZU9selJ6bDR1Rjh4bWdMNW0yZ241N3lRcXYvb1hRUnN4?=
 =?utf-8?B?WS83VzRWU0luTGRaSWczYjFWdzZyN2NZaFlncHJpKzFoay9BU3ZYTWY1OVdC?=
 =?utf-8?Q?tw62v/GkxmhSf62EDcKPMO5uX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6def7f3d-d83d-413d-0de4-08da925c53bd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 12:10:46.7454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8VugTPPi39rCNY2NIR7wuSnBM4qSeVBSOc3MwLcKMCOyB45z/ox4zWDwNhRFEz+qd0tu8LY7zkm/76jg5wPs2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7274

On 09.09.2022 13:34, Daniel P. Smith wrote:
> On 9/9/22 06:04, Jan Beulich wrote:
>> On 09.09.2022 11:50, Daniel P. Smith wrote:
>>> --- a/xen/xsm/flask/avc.c
>>> +++ b/xen/xsm/flask/avc.c
>>> @@ -566,14 +566,14 @@ void avc_audit(u32 ssid, u32 tsid, u16 tclass, u32 requested,
>>>       if ( a && (a->sdom || a->tdom) )
>>>       {
>>>           if ( a->sdom && a->tdom && a->sdom != a->tdom )
>>> -            avc_printk(&buf, "domid=%d target=%d ", a->sdom->domain_id, a->tdom->domain_id);
>>> +            avc_printk(&buf, "source=%pd target=%dp ", a->sdom, a->tdom);
>>>           else if ( a->sdom )
>>> -            avc_printk(&buf, "domid=%d ", a->sdom->domain_id);
>>> +            avc_printk(&buf, "source=%pd ", a->sdom);
>>>           else
>>> -            avc_printk(&buf, "target=%d ", a->tdom->domain_id);
>>> +            avc_printk(&buf, "target=%pd ", a->tdom);
>>
>> Apart from switching to %pd to also replace "domid" by "source". That's
>> fine in the first case (where both domain IDs are logged), but in the
>> second case it's a little questionable. Wouldn't it be better to be
>> able to distinguish the tdom == NULL case from the tdom == sdom one,
>> perhaps by using "source" in the former case but "domid" in the latter
>> one?
> 
> Apologies as I am not quite following your question. Let me provide my 
> reasoning and if it doesn't address your question, then please help me 
> understand your concern.
> 
> The function avc_printk() allows for the incremental build up of an AVC 
> message. In this section, it is attempting to include the applicable 
> source and target that was used to render the AVC. With the switch to 
> %pd, the first and second lines would become "domid=d{id}". I personally 
> find that a bit redundant. Adding to that, in the context of this 
> function there is "sdom" which is source domain, "cdom" which is current 
> domain, and tdom which is target domain. The print statements using cdom 
> or tdom already denoted them with "current=" and "target=" respectively. 
> Whereas, sdom was prefixed with "domid=" in the print statements. To me, 
> it makes more sense to change the prefixes of sdom with "source=" to 
> accurately reflect the context of that domid.

Well, yes, perhaps "domain" would be better than "domid" with the change
to %pd. But I still think the middle of the three printk()s would better
distinguish tdom == NULL from tdom == sdom:

        else if ( a->sdom )
            avc_printk(&buf, "%s=%pd ", a->tdom ? "domain" : "source", a->sdom);

Jan

