Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD3F773A93
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 15:54:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579943.908158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTNA4-00069V-I2; Tue, 08 Aug 2023 13:54:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579943.908158; Tue, 08 Aug 2023 13:54:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTNA4-00066X-Et; Tue, 08 Aug 2023 13:54:12 +0000
Received: by outflank-mailman (input) for mailman id 579943;
 Tue, 08 Aug 2023 13:54:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTNA3-00066R-LL
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 13:54:11 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060b.outbound.protection.outlook.com
 [2a01:111:f400:fe16::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cbf85b5-35f3-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 15:54:10 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7967.eurprd04.prod.outlook.com (2603:10a6:102:b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 13:54:08 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 13:54:08 +0000
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
X-Inumbo-ID: 0cbf85b5-35f3-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BbD7bnqCOvGpWwjNZrUots+mmoxPVutc3fQxxsORVnH4PaFTnRVSRyAbGYotb6U6QJDepcekfDRQcY4V4kDzZYo5u0R85XQzzMSPu4ra0YjKX690EbIx7JHpnElmIOknNgprGakw4QAG/owshgZLBdDAFPDNMNGFoLnuuzb3j3rlWmStCo0fjqe1g7AE8q+y/VlTjUDGNCU9H1aydvZU3TDd8ccSPmDQu+YIYTzNemTpRsArS1/oqssBV6j7kKXAHX6bEaC2sfjJQpuw7mPQmvJn+77Pu3t4ua9onesvkNnAoG5QA8ffYDPQ1WafeE5M7RfmvSFo97vABUs3kkgSQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFsBgP0I2lsEjEXUSrhbALEWBDLafndh5axRrWRGhI8=;
 b=hpLZvAtN7cxkHj/+OW/HHif2XBVAfXNnIwYPkWWTG9Zf5Kj1pS+qvXez2Z1DAipr+Dh6BecK8XbitrWLL2CSSApKV3r1aiAg08SRdpO5tGDm+dRyZaYs5ssRQ4pXG0iqDsTNLraSvyA23HxK6WPL8GdKQUBrJOG28+C43XKwJbW7vM43zyONRcJE10ynAmWAMWpiHU85+tQAMTRnKmREYDndOpFQukyilttTRnQJZvkv+wvSbiei6cbKTYrKIIJFxcHihs4eGKQXt/8w0Oqgu2O9VHKXiFdKFexkJmvff7v3XZfrBWVSjCaH2hfcD2UWWGfR4ry54S6SZ0Gtl6z19A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFsBgP0I2lsEjEXUSrhbALEWBDLafndh5axRrWRGhI8=;
 b=uWJ0o1gY6tBt5ekPgj9CjhOJT/9IcHrrMhM97I7Zi5IQhMiLavrRyweDI+dG6mnDGMtSJDil4AR6Yu2iwPZiBlaYNU1JlE76G3aE8dDukjx+2qa8KrhKmJD2NOAfmF2LT3SeOfOaMtpG11xQtoqHRJYQW3AaR8FxbAsPW2ggXwhKg7crxe7HVAcN/0wzcz7mCqfu+Uy9tBT+xpi66Sx4qgsoFINOPR2ztoUL5pJt3hITkl0dQlDmY4E1NJ82PZhvrtHT5KhLtqCzaoEhWGavhqTk8X5riL7JqLJv55Rp++qV776JHnFhdvOqaTZ6WNm1m+Uk8IlRr26YhyIfl4vkBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3dd8adcf-dba0-f6f4-7519-dda14763a4b2@suse.com>
Date: Tue, 8 Aug 2023 15:54:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 3/3] tools/xl: reject bootloader=pygrub in case pygrub
 is disabled
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20230808132219.6422-1-jgross@suse.com>
 <20230808132219.6422-4-jgross@suse.com>
 <f8907fe4-be0a-7045-38e8-7dde8970ecb5@suse.com>
 <726d0de5-bf4c-1fff-78ea-a52a7c84b635@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <726d0de5-bf4c-1fff-78ea-a52a7c84b635@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: 569b7f63-8885-49aa-5558-08db9816efc1
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+F89fd51kOuquC0UxN//nmI97XcIeRuymw8RPGqLw5urFxgR6u8dBK2BMbwykKrptcTUs3vFl7KMpg97YqhTepR0WzdT2nSzNtKCjvA/I9DZtD3JWM39OvACBinLfLl4hKCvJ1nfQ6A4WsLngyKLdePT36Fs5v7qNb3vTyXXZSkzCYkGcNatQa+dE4McurwHe7G9u+Wd9qUV+4eEmPv1udNrBQWkuxnfYnq9K3QGZULKC9Zj76+SfHGU9u5hkpo3ipbkhSC/v7XLB1Wa2U9xNTK2gdI33es+6yq+j63aGNztRJNW9FVBOqk3vOchzeFibJVj6FVaAnuV/gFyUK6Xl1ulFxRoGv6tNlANjBw9nWusd3o07CCk2wCaLMbaOThYSn4/BtDuLxb5c+Eg45ponwIRxCSze9YBO5xgO5KtuHF+1LMRo7Pe8KZngciNPpDyzqNcoljuQdEOfbvwIbYRmW3FNloENJimjWhxYc6d2cA7nkiNfr44vp9VIvEtWl9J7kht8R6AQGJaye9kEBqYF78yr2Oqmq0BWUZrJTZLdvaHcRmlsYrM5vI0LH+3Ld2omkNPzpAmj7QJz4ajvlxN//dejf2NiayE84Xsv344ddsfl2uZOApZX9E663Qa+kzJUW9TnIcXnbhpLnBnHasF/g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(136003)(396003)(39860400002)(186006)(1800799003)(451199021)(41300700001)(26005)(2906002)(5660300002)(83380400001)(31686004)(6862004)(8936002)(8676002)(2616005)(478600001)(86362001)(316002)(6506007)(31696002)(53546011)(37006003)(54906003)(38100700002)(66556008)(6486002)(66476007)(66946007)(6512007)(6636002)(4326008)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2RjdGRhSURzbjhFTGR1V1lQR3Bad1JFYTBuR2ZxZXRpd05vWVkxNWJzejI5?=
 =?utf-8?B?TDFxYnZYVmdlZEFCZjExSWdZV01lQldldWFqZWZtMGp3NDd6K0d4QXZmVzF4?=
 =?utf-8?B?QWlXa1hoaTQwQjlnTWFvRWU1ME5ZeXlGaEh2anJGbzV2MmJkZkExTFZYaHV4?=
 =?utf-8?B?Njh5V2hmQXpoZ1JZUHlCUENBNkM3Q0dhSWJVazFSNzJQc3lwbGNGZUdTSUVZ?=
 =?utf-8?B?ZmYzMlQzNEZsN1lUbmJPUkd3c1NiWXJBUDBMSHhxZkg3TldyMVFURWpYQnp6?=
 =?utf-8?B?U1VXR2pxNXhUK1NmWFdKNVVGVW92a1Vab1RYS3JmcEN6TmJRZDJXcWpMM2k0?=
 =?utf-8?B?WUt3SG5BRitTMDg5VTBXS0tibkVTZCtKZ0E2MDVKNUdhMHJYbG51aG1CaFh5?=
 =?utf-8?B?cFFuRHV5aU16NGRzTHR6dDk3K1d2ZTZPRU9ERFl3VzJ6T0pvbUVFU0dnalQ2?=
 =?utf-8?B?ZmJEakVoZ25LWmhGTGxjemRIOGRTakZhVldLdzJEVEtrbzhkVkR0SDBtY29B?=
 =?utf-8?B?NFZ1NTBtajY5czJjZVloOEZyVWNqbTR2SUx1VHpPd2J5bUttdUpjSGlYcWFH?=
 =?utf-8?B?OFdXbHVSUTVXSmptUG9BcThSNUYxWUw4RFBqMStJbytmRHFBMG9oNmtJNWdL?=
 =?utf-8?B?cVl0SGdCQUFhWTBTTXpUamR2V1dlWG00bWk3YVhhVllSTXVxZWZ2SWxseGxy?=
 =?utf-8?B?ZTJZdmRoSnlHdXQrYjgweS95cDRycWNZNnN3SjFDMUFodDN5cTc5Wmt0dGE4?=
 =?utf-8?B?Zy9PR1N0TXI1UGlZb0NKcFRBYndXNFBFTlkzNEtkYUw5S3VONnh6ZitaUDJX?=
 =?utf-8?B?R3lGbVozNVI2dnRTb0l3WDVVekk0YkJmemhPSWEvVU1PeUszeWpWVDROYm13?=
 =?utf-8?B?anJ2Wkx6VDI5TjBXTDFyajZjQnpMdjZLcjZvREZ1d3A5MnJQdWxuTFIrTFYw?=
 =?utf-8?B?NmpRSml5clBoZ0lVSHJKZ0ZiREt0ekhSUDJibzNXSFBoeHpOQitMKytPUnc5?=
 =?utf-8?B?RFdxZ3lUTTYxaUlVcmY4czJXNWlUR3lycFprSkpzT2IzYnd0TE9CY1NrYjFU?=
 =?utf-8?B?eE5TNXMyTDBBdEZGcXFnZVZHaWFCVjlCYUpmbEd4VDdQUlpVZmFBdXV3OWI5?=
 =?utf-8?B?VC85OFFtcE11MGQ2b3BZQStuNVA4cUZjNlAxdmZsTGdMY0dzNWJZWlNzQ0xk?=
 =?utf-8?B?WUhpZkZoMk9VQzgrV3JRMDV1NGZlOU9OS3E1L0pXaFc3QTlOK2RWVmlFT3Mw?=
 =?utf-8?B?TElHS0dDQlV2Mmc1UEYwemVpM1piUERKYllVK09NK2E5bjVjZno3M0xzdW9m?=
 =?utf-8?B?TVZ3Mk16Ylk3VVo2R2xKVjJHb2hPQ3FIcHpIQmlRNi9kYXRZa0ErazVFMzlE?=
 =?utf-8?B?NGRhTHJKS0Q0N1k2SEJEMkVTWFBDS0prdlYwWjFqcVBia2hPMS9CSkxqczdN?=
 =?utf-8?B?TDNid1c5N3N3L29EUlFWRG9SdHBBK0xVZm96MysxZXpNQjhqV0QvVDNlTVJS?=
 =?utf-8?B?bEwxUGxhRWhqREErcmtyMVdJVVZVWUdac1JKWDEyc3E2QXlRVUoxVTdncncv?=
 =?utf-8?B?UmlIMnlwempkcmhsYStGK2NIdGZCVHlDWVFaZEwyOGV0aEl5SElnbFpidk9o?=
 =?utf-8?B?V0VWS1NuSWd1WHlOY1ZoMk1ISzBKdi80eVVhdTlpTXVRYmZid2RTQzg0Q0Fi?=
 =?utf-8?B?cmFyQUZlSlpXb0lnMEVvZFQ5QlVVZzZoMFBmSWZmQkYrNmFjZjErT3cvOTF5?=
 =?utf-8?B?dGpOdU5LN2N6MG1ZQzIvSW5CSWtrNGJYOXJ3b2RZSFJORERJdGY3TnJNSlE2?=
 =?utf-8?B?TjkrSEg3SlJYTGNVcFFrR1lPWFZwTlJuNDJPZXpTdUNwL3ZxWFVTaEQ1V2hF?=
 =?utf-8?B?QmJnVHFwTmhHTTNQSDBvM0xqUUlpN0ZJVWdFSVpxaTZFVHJRd3lSZHI3U2RT?=
 =?utf-8?B?aUZhQnJldU9WbCthKy82VTRPejhrRjhJdENrZ2l4ZEhTdisyeXB2ZUg3ZW1S?=
 =?utf-8?B?UUt5Y00xU0QzdWszR0dXMTNYeXNzZ2JiT1d1dVg2UTF3UC9UeW51aEhqSWI5?=
 =?utf-8?B?anBreVdyL2lZb1ZsQ0V6QTZmWkJjUm03UWQ4b2pmTkhjb016YUZYUGNJL2dk?=
 =?utf-8?Q?/DivR0zB5KL54VWu9w1iFja0B?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 569b7f63-8885-49aa-5558-08db9816efc1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 13:54:08.3339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lF9b9jILPNT0bFySWKMV33jS+mPf1SBjDNEYIn5nIcaYW8c0Q1hGueGcG+K8eibIO2G7IrrX+JsTNdvEg4nMJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7967

On 08.08.2023 15:36, Juergen Gross wrote:
> On 08.08.23 15:32, Jan Beulich wrote:
>> On 08.08.2023 15:22, Juergen Gross wrote:
>>> --- a/tools/xl/xl_parse.c
>>> +++ b/tools/xl/xl_parse.c
>>> @@ -1692,6 +1692,15 @@ void parse_config_data(const char *config_source,
>>>       xlu_cfg_get_defbool(config, "acpi", &b_info->acpi, 0);
>>>   
>>>       xlu_cfg_replace_string (config, "bootloader", &b_info->bootloader, 0);
>>> +#ifndef HAVE_PYGRUB
>>> +    if (b_info->bootloader &&
>>> +        (!strcmp(b_info->bootloader, "pygrub") ||
>>> +	 !strcmp(b_info->bootloader, "/usr/bin/pygrub"))) {
>>
>> And no other path combinations can occur? strstr() is perhaps too lax,
>> but what about finding the last slash (if any) and comparing the rest
>> of the string (the full string when there's no slash) against "pygrub"?
> 
> "pygrub" is the preferred variant, "/usr/bin/pygrub" seems to be the
> legacy variant, which will result in a warning to use "pygrub" only
> (in case pygrub is enabled, of course).
> 
> I don't think we should test for other non-standard paths.
> 
>>
>>> +        fprintf(stderr, "ERROR: this instance of Xen has been built without support of \"pygrub\".\n");
>>
>> The other question (I'm sorry for my ignorance here) is whether pygrub
>> could come from anywhere else.
> 
> It would be possible to use that in case it is e.g. installed in
> /usr/local/bin/pygrub (assuming the check above isn't modified).

Well, okay, I'll leave this to Anthony then.

Jan

