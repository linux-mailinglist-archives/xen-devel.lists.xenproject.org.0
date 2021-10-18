Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6286431236
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 10:36:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211840.369516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcO7a-0006Nx-St; Mon, 18 Oct 2021 08:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211840.369516; Mon, 18 Oct 2021 08:35:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcO7a-0006M6-OI; Mon, 18 Oct 2021 08:35:50 +0000
Received: by outflank-mailman (input) for mailman id 211840;
 Mon, 18 Oct 2021 08:35:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcO7Y-0006Lu-Bg
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 08:35:48 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92e5773e-a72f-4d2e-a218-f7624e85d601;
 Mon, 18 Oct 2021 08:35:47 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-YW907A7YPUy5Qt-4rGwteA-1; Mon, 18 Oct 2021 10:35:45 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6301.eurprd04.prod.outlook.com (2603:10a6:803:f1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Mon, 18 Oct
 2021 08:35:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 08:35:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR04CA0020.eurprd04.prod.outlook.com (2603:10a6:20b:92::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.18 via Frontend Transport; Mon, 18 Oct 2021 08:35:43 +0000
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
X-Inumbo-ID: 92e5773e-a72f-4d2e-a218-f7624e85d601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634546146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Be5Vu1m46e4fiokuLaLORTjHSI9COvms1i1iq+Sft8=;
	b=ku/kZ/16XXEMcr+/GIZwH+A/LT1EzXYZw42KQjhIlNepKKSPWlPScH1frItC9MMcDG1zKi
	VP54wi66iOorfpX48ShORXP+PohNHLuG93p4aML/g6wdu2rBHUwIZNHz9s6u0Yr3pnF2W8
	4KGuDgmbBVpNqzn9j5OTbr404E0tRIQ=
X-MC-Unique: YW907A7YPUy5Qt-4rGwteA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cr3VWQ5KRbMsC1gJMySXBuzURZO2g3wyd+oar8XqQ2AzPdl3SWHRbwFgpPtFiEu3AhbVbJiWUob8dfvdPFkqKucDaz7i6ezTczTv+h7JoIU/R9g9w9Z/PLOLZ/gpn6Njtryg4DLQq3X76ijJnPTKEvQ7RR6/BK3YWL5RIY7w8JJUouB3OEoJmiwKVugCYlU4s/ss/MQbIuvtRFd0jd04LQ7UHhYh2Qb/V70t1+HWwQ85QffRSh7Lcf+ONCHiLYNGxGCmdqaFDrnwejGukBOA0S/zhPtag5kGQ7+WC1gcUjpVaQ7zPpsCjFWGnaywJ5e/NL0JIcdWkc7gC7toyu9dJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Be5Vu1m46e4fiokuLaLORTjHSI9COvms1i1iq+Sft8=;
 b=JIIJNCOOMiLFXVzcJMm5aZzHnRiz+sZYu2mvDDqAImh5VgyCZ/QTtO/2TQhfSGmDQw5Nke2bKTyobPS0JJrJrk4fPhUggJWS0TViOdd6nRtQ3Z63KUhj3AYOe6GhQRsfpEaOu84vj4FTMyC+wjMYRNMkE1j7ixn+iby7eXM6VpI+tJLqOTM9CIru+nXgB44pr+6ec7T2y1+o5fhXsYC5VxU39oPKJFDATvmRRHXvgbinm4TX1WEL4yuIP48QgeZ2SgP4WkX1Tbp8NcNqLsfHdMz30i7lCkA5JHwUSKTzxMXEgdCDSLv6rE8j8OZ8V6V6j8RDn9eXQaaghV46Uhw6CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: Xen 4.16 development update
To: Ian Jackson <iwj@xenproject.org>
Cc: committers@xenproject.org, xen-devel@lists.xenproject.org
References: <24913.54299.590779.955301@mariner.uk.xensource.com>
 <24925.34307.187952.463474@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e644a1d4-a7a2-0554-f639-e19ba3102294@suse.com>
Date: Mon, 18 Oct 2021 10:35:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <24925.34307.187952.463474@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0020.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1b705f9-26d4-465b-00ca-08d992124634
X-MS-TrafficTypeDiagnostic: VI1PR04MB6301:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB63011ABE96425A9F2CC1E48FB3BC9@VI1PR04MB6301.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/YQ1QAV1W0rOFiZINyfZJs8TJeax409xkD7Q2UAjtKo6HZRuDSfthCTmUB+xUYsKjSGt/1WRm/0Zc9rGDmDqgayPzdEJTob75Xle/7of+kOjb3EjTd7haiB0Aa8/vcO24CuKzzqxeAZz58tEwqSio5OorIWBBmKm//fOHKX20N1xcM+BY3yo5C9qJnmoQj7RPNRfYuEPaMvo7x0qZzd1fVZK8TXX03Ih59d0kugYjozTyzGaTINgXXwBX/9qNCBb869446AfN/Z3KMjMEeCkBlDVjVCu/F75/Vy8K1Fwmx/+eRxiscUYVdtciZ5XQh0757WH4Mklwc11cV6xoziyLReuAkknA8bKph8A66tTiii14GKOmnm0PTjd/8JCx8p4I32jgcHzU+w6m2cXneSBtobxcNfqEfVfeYHTc1BeV7zoRPSdonLGZD5W5IRjy7PIr7KYJ6uW8lKR18FWqEeilsk9ZH0AokR6gOPkE89Syd416RrSCZatVtflfZp/EzIXw9KzAHSWUMx1Vd7AjjFCvbN2yyoLtfVwfUnRXPLHA+sxRl14a6wfG76FVDXu2LiXMUQuK8iIZH9JyOXS0NEDFVnom96BJu827T6FDDOCUj0qY6yMxgFJljrcQP1PDUeun78snjBE0cwecAWyJBGk3LtNXA0nUZ5K5TcYr9R8JNndiCaI394y390cb/Oino5OkCZ/TUEphjkJSOEAua6ENHG3RkmOW305BmlhLaoQOKQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(6486002)(8936002)(316002)(2616005)(83380400001)(36756003)(16576012)(6916009)(4326008)(5660300002)(31696002)(86362001)(38100700002)(7116003)(956004)(31686004)(8676002)(66946007)(66556008)(186003)(66476007)(26005)(53546011)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cy8vdUljTDF1NnllVWN1VGJkUWVtdk5tRkxROWc4bVY0ZVBzcDM2ek9SZ0NE?=
 =?utf-8?B?UGZOU3pjdUFGb254LzAxd2cyRUEvZXlhRnJlTVlsZ3NvSlV0MDZOVzk2V3hH?=
 =?utf-8?B?N2UwaTY0MEZzYjlqcnpkMitma1hkMXJnSTlFWnMwMS9jU1NkT0Jkd1NuTG5M?=
 =?utf-8?B?S0NJcnRxbE1EaEFNcEdpQ1BIOUkyblFQK2VjZ1hERUJxK2tRdk5iTC9OL0VG?=
 =?utf-8?B?QlVaUklSL0d1Y0t2Wkg2QzRuUE1hWjVER05jbks3VTNqcUpTY2E3cHZTZ3lB?=
 =?utf-8?B?YjRxWFpjaDJ3TjA1TmEwRW1UbThhRGxEcTRBTFlrVDFUZ0IrbXdGcHBVb0h4?=
 =?utf-8?B?K096TXQ2bUFpNDVGSVZnSnpoNmZVQjgyZFZrRUwyTTlNcmIyVTBLeXQxd2pT?=
 =?utf-8?B?UlNxVjdwMStna3AvbVkyeCtGVmZCczQxeDBSSitlSTRVOG51V2RhaGdCUXhj?=
 =?utf-8?B?R2tQVWUweUpobWh2VlVQUzVlazlQNXI2cW8rMkJTQUZ3VmtBcFl0QzhwbFVY?=
 =?utf-8?B?QlB5ZUVTRFJYUmo5cnRXMUdsdlEvc1dwcmRxOUlxcXJ2QUFmUHVvcFRHcEFG?=
 =?utf-8?B?QmJFeU9jM1BTVHlROXlibzVubGNua2R0MEVncFQ5MWV5OFAzZTJMVjJMQzNk?=
 =?utf-8?B?MENkYW02Q2tYWHg3S1lrdm1ycC9sS21UOHY2MEFXUWluSXQ1UkNLVk1IQVNn?=
 =?utf-8?B?NFJuOU5SV0JCaDBpK2o5Vlc5V1lwNFZQZ0RpMUF6NXBvbEcyZVp6ajVLMUFr?=
 =?utf-8?B?VkY5NThZaDM5Ym1Va0JaVzBVZHludzdnakJXOWFsamtmL1lIS082SGI1TnZq?=
 =?utf-8?B?elJuVy8yd0s2UExvNWl0TVhmTWEvR2IzdjA3RzQ1SDdDYlpvSE5qWk9wYlBB?=
 =?utf-8?B?S01YUlhYSHRpbm5hL3kwNHJTRzRpNURQZEFXcjdFQkV5djVTaEtZQmdNcGNs?=
 =?utf-8?B?OEJmV3FKYnJGcW51Ym1VRE9oMEl3T2x5bGJ2K1RGS2VMb2ZtVEZWdEtlWE1V?=
 =?utf-8?B?VlJGaGNRRGtIZXc2WFFMOGJxSHZmQ2RTZFdxcGhnVE1DUElEUjFkNGdmbllz?=
 =?utf-8?B?b3hsZ0xVc1JSVEdsNnZBNUl5d0dtVVdjd1k1OHZ3aCsvUEIraEI5YTJKaGc2?=
 =?utf-8?B?amZ4dlk2WXh6M3lOVlhTaHhwS1FvMW1md1VZNWdrajBnWkpUTnc3WUlEOHVu?=
 =?utf-8?B?QmtVWG1aTnRoUGhrcXlqdEtDODJpYTd5WXdaUFAwdVFjaGFqcHJKYkxVaU8v?=
 =?utf-8?B?b0pOQzRXSGxpKzhhT0pHN2hpaWNFWVBteVljODByTnp2RHVyNXZhNzd4T05H?=
 =?utf-8?B?TjF4UlpRRTJSRTdmRVVESzNMVnl6V3QxdSs4N2kxODlRT0ZLdzk5SVg1SS9Q?=
 =?utf-8?B?blNvWFdnM2JCUzc1TXFwcHJaNDVHM3Z5RlhySmk1bWw5SzgvWXpBNTlDYzJv?=
 =?utf-8?B?QnYrNFF2ZVA3aFhmTm5iZWxoUlAwQ3Z5L2VjQm9iRExLY1JoQkJTRGJQWGRS?=
 =?utf-8?B?Vm1XMjh2Wkt2OUlEVlZHRmR5UjNOeXhjOENXTHJEWXdVdmZEYWFGc3cxbU5m?=
 =?utf-8?B?Y1FpcUN3VGZseVJLSE5GS01QSmpCOGdtWkxRUi93ZWxFOC9jM3ZDRDJVWWJL?=
 =?utf-8?B?aUVIWFVMb2ZlVmc1alZTTGtHbDNldGRraVU0U1hDd0d3N0JSMXJ6WnJtL0tS?=
 =?utf-8?B?MFo4TmVXRjZqRzRmMHpJT25KWFBkS3hjY2NqMHhHbzI2aERIenMzcmVmQTJn?=
 =?utf-8?Q?EeUR9L7kcWbZAJqK3hbMiV7mCjPpCck+7eyKOWE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b705f9-26d4-465b-00ca-08d992124634
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 08:35:43.5195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1l5Dt/yPdRiPPYJzB4KTcGOz6ZziTPLTGhkxDpHxldPMh/8aeknhZpJ6i8s12DbPN7O2ei4+mqWWhfQMVMMdzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6301

On 06.10.2021 13:18, Ian Jackson wrote:
> I wrote:
>> Planned release schedule for Xen 4.16 (recap):
>>
>>   Friday 24th September   PASSED        Last posting date
>>
>>     Patches adding new features should be posted to the mailing list
>>     by this cate, although perhaps not in their final version.
>>     (3 weeks)
>>
>>   Friday 15th October                   Feature freeze
>>  
>>     Patches adding new features should be committed by this date.
>>     Straightforward bugfixes may continue to be accepted by
>>     maintainers.
> 
> As previously noted, we have had a lack of review bandwidth which
> means this release will be light on content.  We discussed but
> rejected the possibility of extending the release (beyond Christmas,
> to some time in January/February).
> 
> Under the circumstances, and considering some external constraints, I
> am considering trying to *compress* the release schedule by
> approximately one week.  The feature freeze data would remain the same
> - we need to give people as much time to get things reviewed and into
> tree as we can, but I think we can probably cut a week off the freeze.
> 
> That would look roughly like this:
> 
>>   Friday 15th October                   Feature freeze
> 
>       (2 weeks)

Now that we're here, I of course have given up on any of the pending
non-bugfix patches to make 4.16. But I very much hope 4.16 won't go
out with known bugs having fixes available. Therefore I've pinged (in
some cases again):

x86/CPUID: don't shrink hypervisor leaves
x86emul: de-duplicate scatters to the same linear address
x86/AMD: make HT range dynamic for Fam17 and up
x86/PV: address odd UB in I/O emulation
x86/xstate: reset cached register values on resume
x86/altp2m: don't consider "active" when enabling failed
x86/PV: '0' debug key stack dumping adjustments [at least the first 2]
x86/paging: restrict physical address width reported to guests
x86/PoD: defer nested P2M flushes

In principle "x86: more or less log-dirty related improvements" also
contains a number of bug fixes, but the way this series is stuck
made me not include it in the pings.

I've tried to remember to Cc you on these pings, but I may not have
succeeded in doing so.

Jan

>     Friday 29th October **tentatve**      Code freeze
> 
>       Bugfixes only, all changes to be approved by the Release Manager,
>       on the basis of a (progressively stricter[*]) risk assessment.
>       (2 weeks)
> 
>     Friday 12th November **tentative**    Hard code freeze [*]
> 
>       Bugfixes for serious bugs (including regressions), and low-risk
>       fixes only.
>       (0.5 weeks)
> 
>     Tuesday 16th November **tentative**   Branch off staging-4.16
> 
>       xen-unstable open again - with caveats to avoid release disruption.
>       (1.5 weeks)
> 
>     Friday 26th November **tentative**    Final commits (docs/prep only)
>     Week of 29th November **tentative**   Release
>       (probably Tuesday or Wednesday)
> 
> Ian.
> 


