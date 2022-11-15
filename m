Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D6D629B3F
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 14:56:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443964.698723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouwOz-0004kP-3f; Tue, 15 Nov 2022 13:55:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443964.698723; Tue, 15 Nov 2022 13:55:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouwOz-0004hi-0M; Tue, 15 Nov 2022 13:55:01 +0000
Received: by outflank-mailman (input) for mailman id 443964;
 Tue, 15 Nov 2022 13:54:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTa/=3P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ouwOx-0004hc-5O
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 13:54:59 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062b.outbound.protection.outlook.com
 [2a01:111:f400:fe13::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1682ac7d-64ed-11ed-8fd2-01056ac49cbb;
 Tue, 15 Nov 2022 14:54:56 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8892.eurprd04.prod.outlook.com (2603:10a6:20b:40b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Tue, 15 Nov
 2022 13:54:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 13:54:54 +0000
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
X-Inumbo-ID: 1682ac7d-64ed-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Za0UdlBAnpBQH3LEmDEeRo+OpbwAdp+bA6vRszx3U+Kp6oBeDGWfF2N4/ER7xBqREi++9sd4O1STFrGhe/3lu3inuTlqHeITutgNg+BaUap74edmEu3aY+qFVYIsSIUFRlE1S9FzPRbsreBFgooTzWtyOEt0TnguZvB7ue7M0wFoNXrdbPxarfhjnD+9sNLzVxaHl8xixsDXX213al+rzP5Z7fLlQhyxEIY+BrdBuWYieMFwNCAZkXHIgZPa+uoS0JPqUHJ3poSTXUDrAFyjaqWC3dD46MblGdbBicAl90FRU68LGT3sU/R16MJc9Zm0AiKKoyeZFpkflh3vlfPWGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPeNs0adUYM5IX3QijtNNjDpvZ4xtF52CHiCnGvQ0+s=;
 b=Ql1s68bhLo5V3u+PAw9+4oYeRmt+pmrhuq4qXdLUaneWO8nd7PLlBr6zFwnJWjJV3HV+doG6O16M1leTJcqMIXx0iD6vY7ckzFUwhEuQIMTC4Z7hztegTfs13RnO8MUowK2Y/Pocm4LfEYIszGtjnIvTENODk19V7A8NA6nRanmkLDJuzRuxQQ/dS4HJDHk716RGAfeHPy2jgoH9aeMSL6dfyGefHsTEHPE1KLrjKH8KsmQv1fCdKgyxKPEa/pY7HicVxDCyVybOTCh7AFXEVSXfQeXqtAfFrPk5XJsD5u5ajOW3jHP/B5qcXquJHujOsN7I7JANXDF92tENU9fr2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPeNs0adUYM5IX3QijtNNjDpvZ4xtF52CHiCnGvQ0+s=;
 b=qxyqZ7n4SEaFzPRGtnv/KAd4SN3y3vZyQsp8aRV7rKfYs8d6RvXAy3oP020O9l6y4SkMRPX/I0acZIl0aWJnihmMN+upEFaoXd56JZT3r20WsLyEaSShkr/YNKThEgyd/FdwuREMnGFViWXuX7NHrSs26uD74qWqBprxheyNMANoPb35ici/0DMps1NX4x0w8CNtVZjGSCBRME5qmySVLo4OdUh0QVTJgtMv1scTRJh6f9xmcV/B4zVXyRgfhp0VCohiQOPh0DPdac6q121XsCmd/BVWdkB9MMp3wJJUv92biVjfFHMrYSiTDq2ThUqweaV4roU2wlG+onG4i2stfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9f0cbeb9-a3c7-930a-64b8-db5d75abe9da@suse.com>
Date: Tue, 15 Nov 2022 14:54:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] x86/msi: passthrough all MSI-X vector ctrl writes to
 device model
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20221114192100.1539267-1-marmarek@invisiblethingslab.com>
 <b6d5b122-2821-35dd-418d-c9ae42184d22@suse.com> <Y3N53MIP8D0k/JXq@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y3N53MIP8D0k/JXq@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c10bb10-5eec-4d3a-4761-08dac710f95c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CDl1z6v62tonGu6rrb7vvUZF+HwawRQW7KT9xGlO0BI9cp5zIKD64Ol25/XhePgTbwpgxB3/Uu9agAwtFuZkFweDDzad8G4O0t2nH6uxldKx0gnYb0gPglkFuY7OZHFuBTNF2QAz28BioELjsD3VE52hpefv+Y+KQkpILHD6g4kKbowUbFVOacigeyQ1WGczBPVyNJ7sCj2RYVsWH4NX/WX21mplgKZMjVThyBONmcYJzQJ5LErZv3IWu0r+UtR8hh3ri7LQS3L19HQppVvu26RdUIAkxgQS/KvydLvM/VAWzEbRqm6U4nCtkI2B0n3v8/n11GeAxCfFGNTgB5CslpQ3dDnGiQO2OR6AE2uLAhNvgeM5/vtMVlSgGaUJTeFjt8hp2ria0mXV1EZ9fNGY7Ncq0ITK9oy5y/6RSMmSLlHV1nVrlCUmOpjoYGxah/UWmz/HSg782Ll3fz2O/r9cMrC58hmzrRQsFHQZcpKBFpLIHRTE260abuW3GgZQ2wE/yx76gfQqvRMxp3aPpwIAHpyFSG+agBmoousHk18ZlOxhq3PKwIoafb5INIlIk+px4RkG/vMJnxdQIrQNOywDyUrON40EhSkvcArha+K1G0ttrCyhm5OHlqSnQJhka/wHUZwJrECtzubhdUJtGsPwl0YdO+oZAdGS2NEVuqbqtMFqkr4urEe/ab238RUqb9JaoiPMcdejd89ChZCnl7f11Ip831SjhUagl8FUXIq202tct0aUbw6XDg/uBZUWVeb2QGvfqfdqYmhzs5MZBsUCifLxdw6DH/E42KIvubXhP8U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199015)(31686004)(6506007)(53546011)(6666004)(26005)(6512007)(478600001)(36756003)(186003)(38100700002)(2906002)(54906003)(41300700001)(6486002)(31696002)(6916009)(86362001)(316002)(4326008)(8676002)(5660300002)(66556008)(66476007)(66946007)(2616005)(83380400001)(8936002)(66574015)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHRuVTd0TWkzK096d3hlbTNuZzQyd296cXpsNUVVWVR1RkNnU1E2bngzUGhv?=
 =?utf-8?B?VHV0Y1pxMWtWZzZ5V3h0WkZvZVhJZjNvVFhzZzFBYWgvemhpZk4wSTZSUkx2?=
 =?utf-8?B?aER2bGdTbmZTdjJINWE1TTlZM1RKQTNQc3YyaHhCU052a1dTdVNLUUNXN2lJ?=
 =?utf-8?B?UEdpNENVaTZVTDVXUnVIbGVqU3loaE9HVVVYcW1BZzdTWFV1aW1QTGoyOFJj?=
 =?utf-8?B?ckZBVHhldVNqK1lHMC9HL3VBY0JtSktTQjRydWxIaFdDRks2L29qci9PdDFh?=
 =?utf-8?B?LzNKUkRadExhNkxUdzJtVTlVM00ycEVhZmNWN3RZamR5Z0UrN05HUzltaHhY?=
 =?utf-8?B?Tkl2UjUrMGFDZmNiSlYvZHo5MDRqc0JGYzZHVStwRDJWdktXY2l4empYOWg1?=
 =?utf-8?B?bGpRNUZnaGZkQ2Zkd0RpeE5LMTZZaFl1dDBqKys3VGlBQnNpckFEWnVhWmNw?=
 =?utf-8?B?WWpyWnd1ZisreUx4QU9PRGg5VCtBdUovUjZpeVN6MzdUVWdRdjZHV0N3a1J5?=
 =?utf-8?B?V1dVak9TQzJQVk9wYkdnekpOZ1J4M1Z6QUVacW02UkF4aE1jdGc1Qk8wUmxo?=
 =?utf-8?B?L2ZQYnVWcTNNaVhpNS9jRTh4WEgwUVZRbjRPeVpreUIydk9lMUowMHZzYTRY?=
 =?utf-8?B?NWx5RkNHQTlsQkpLNllFZklQeTBoUFNMQldpSGNZdVI0SWMvZW5mYm1WL29F?=
 =?utf-8?B?SEF5UGtOVml2a3plU0VUWk43dTMrdlpoZkZsUzVxRE9LNHhQRVBWeEVzZ09K?=
 =?utf-8?B?YXFudmpmaG9hcXRHNW1VVnBlcTZYWlVGbXRudG10OHJkakl6aGd4S2pIMWFY?=
 =?utf-8?B?a08vTkNXZm5SRUwyc1lrelJDRTQrMTd4V1duMmt0S2QyZXYvT3MvdnMxT09O?=
 =?utf-8?B?TmxMNndyeTljaGFrQjdINkkyOGR6YUdockJWMld4akpGbkpaWFc5ZGFDbnBr?=
 =?utf-8?B?QVI0UWE5TzhrMmc3aVZZanovTUN6dlpNbXZDWWplV2RJZFRyeWdOK0FBdldJ?=
 =?utf-8?B?bnNPb3Q0alVRbFVjeWFueFBLR0hKTzNCcldYa0V1cVJDdThWZEVjRTE4aFVs?=
 =?utf-8?B?YVg1YnBuL1EvQnBoaFpiNDRzeW1lWDVjTzVGeFhKTU1FMk9Zc0RvZU5jSFNp?=
 =?utf-8?B?Qi9vK20zRnY4Y0RMRTVQS3F2Rnh5NFlxdFYzeVBEY01BS1E5MHl1bk1KVTVO?=
 =?utf-8?B?OEw0ZE9OZCtyRjU3STc1V1I2eXBVd0NEVUJZdWNtRmhRa2FnOHplNjdDWEdZ?=
 =?utf-8?B?MmFrei93MG5FNU9sQ2U5NVFUeVgvYWNqYVFmOWtYY0ZzR2lPc1NVTUxwazMv?=
 =?utf-8?B?RDdvRUF3bk5KYTlNMVpRTlZWN0FXUUtETWZ3UUxHZE9YUXNzNHhXVTAzTkZY?=
 =?utf-8?B?amxOSFpZS1BkTmlkUDRzUEk3L1JzUFRYWGx1ZUZYTUtYWkRDVWlUWWx6SXI2?=
 =?utf-8?B?VEFYOGJzYnBBOEF6SnI2d1BrUDNocmZqclZ6S1hNUkszanNqM29kTVNCVjdM?=
 =?utf-8?B?OVVVTjhkL0JzUVhqblVoVksxRGxzV0VUVUhMMVVhVFN5WmNWWVlNSGg2MHpJ?=
 =?utf-8?B?aFlWVTFVTHk1T2xjTThTRXBaZ2JYTytNQ2VWN0M0SDNpdGJ5RVN3L3d4eURi?=
 =?utf-8?B?bFlDL3M5YTBvL0dOekJ6RmNOUzdKejlTSlg4RDJWSHB5WVZPUnBRY1gvYTVY?=
 =?utf-8?B?eFo1WnBYL3hvUTZRbE5PZ1RxT2diTXBmMXcxVkZyK2p3ejVZVDExVGxNZ05Q?=
 =?utf-8?B?OWpyVmoyRUhqVmI1S2plUjV2WHdQU0lDT0plak5PeDhVeUcrd1hGaVp6WXVk?=
 =?utf-8?B?VVNCbnBjRm1YVmpacXdPenlOazNFOUxqUmZSUDluMW1wR2RZSWdIZUYzS1h2?=
 =?utf-8?B?NWVnc2wrU3c4K1J6K21SeW1sb2thZ0dIVUFEV0ZYM044bVFZbTVFTGovMEhC?=
 =?utf-8?B?eGRoNWxYSHRuTTh5RTNOTENSZ1RsVytFYjFxWVRneGtWbnNyQUhXNHZoQnZJ?=
 =?utf-8?B?MEM3ajdRYTRuQ1RQb1Rwcm5NVGllOUpZa01xVjZ3ME5KK0FmRHMzNUdvdXBj?=
 =?utf-8?B?ZVc2N0pkbVlFMm1pMUFqRFJaU1pnMmpDVExUKzdWa2NVNHczT3RKaUlrWkJN?=
 =?utf-8?Q?4R+aFVO7RCCvHilVhNEYab7sE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c10bb10-5eec-4d3a-4761-08dac710f95c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 13:54:54.4887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2231GIBIc9iRTtrenHi97XpetulnmpsOygCV7+TA8k4Ew3Xk9cKsyZp0RzbT5NFMLDMAboAAYVywsktTy/PRDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8892

On 15.11.2022 12:37, Marek Marczykowski-Górecki wrote:
> On Tue, Nov 15, 2022 at 10:36:32AM +0100, Jan Beulich wrote:
>> On 14.11.2022 20:20, Marek Marczykowski-Górecki wrote:
>>> Give all necessary information to QEMU by passing all ctrl writes,
>>> including masking a vector.
>>
>> Can we perhaps still avoid sending dword writes which don't change
>> the mask bit?
> 
> Is it worth it? I don't think such writes are common (which I confirm
> observing debug log - every single write to maskbit Linux did was
> changing the value). The old value isn't readily available here.

For one a 2nd aspect would be Windows behavior. As you've seen in
the hypervisor code somebody back at the time even thought
accelerating reads was useful. I'm going from that rather than
knowing for sure that such an optimization would help anywhere.

>>> --- a/xen/arch/x86/hvm/vmsi.c
>>> +++ b/xen/arch/x86/hvm/vmsi.c
>>> @@ -271,7 +271,8 @@ out:
>>>  }
>>>  
>>>  static int msixtbl_write(struct vcpu *v, unsigned long address,
>>> -                         unsigned int len, unsigned long val)
>>> +                         unsigned int len, unsigned long val,
>>> +                         bool completion)
>>>  {
>>
>> I'd like to propose an alternative approach without an extra parameter:
>> Have msix_write_completion() pass 0 for "len" and move the initial
>> check
>>
>>     if ( (len != 4 && len != 8) || (address & (len - 1)) )
>>         return r;
>>
>> into _msixtbl_write(). Then ...
>>
>>> @@ -343,7 +344,7 @@ static int msixtbl_write(struct vcpu *v, unsigned long address,
>>>  
>>>  unlock:
>>>      spin_unlock_irqrestore(&desc->lock, flags);
>>> -    if ( len == 4 )
>>> +    if ( len == 4 && completion )
>>>          r = X86EMUL_OKAY;
>>
>> ... this could simply be "if ( !len )", seeing that even with your
>> approach it could simply be "if ( completion )".
> 
> I find such usage of magic len=0 confusing. It would change the meaning
> of "len" from "write length" to "write length, unless it's 0 - then
> write length is 4 and it's called from msix_write_completion.
> Is there any real value from avoiding extra parameter?

Perhaps a matter of taste, but to me redundant parameters are odd
at times as well - often I end up wondering in such cases why an
extra parameter was introduced when things could easily be done
with what was there. In the specific case here there's also the
further aspect of you moving the function across the boundary of
all arguments fitting in registers available for parameter passing
(which of course only matters if the compiler decides to not
inline the function at all call sites).

Jan

