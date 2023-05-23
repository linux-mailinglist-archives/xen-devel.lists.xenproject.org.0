Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CF770DCC1
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 14:40:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538472.838418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1RJV-0000Cl-Qx; Tue, 23 May 2023 12:40:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538472.838418; Tue, 23 May 2023 12:40:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1RJV-0000AJ-NP; Tue, 23 May 2023 12:40:29 +0000
Received: by outflank-mailman (input) for mailman id 538472;
 Tue, 23 May 2023 12:40:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1RJU-0000AB-FF
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 12:40:28 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7d00::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fea88322-f966-11ed-b22d-6b7b168915f2;
 Tue, 23 May 2023 14:40:27 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB8000.eurprd04.prod.outlook.com (2603:10a6:102:c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Tue, 23 May
 2023 12:40:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Tue, 23 May 2023
 12:40:26 +0000
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
X-Inumbo-ID: fea88322-f966-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MA/3fyi8oq1oklIc+q0HV5EfComqIi4RHuPcvvi6yQWizHum6WyIa5dheJcUBXvlc9JArrKfRWWJbaEn0P6tY5aGEFR82nHPGftHvruJSIs0MYcuZC6lmNgCbB2tPnTwz4Q1JrHZQhLQhT2YElukPupZaIxBaWGRfi67TETp3lyBGjkeg5YcFDoZVkUtTMApM/9G1KwCSJLp6PyGuZYh2f5DAiRczpOnYqsDseWn2+mrc3LoJQ6l3xkuKhwb7GeLdH015NOBkOhdMtqHH0cxd7cC52ZT/7dgGtpnwlvYrELcW8V7FapQ2Bt2V0DJCJKL5Vd+IAX9JUm7cf0wzXMj5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gk7mG3uOeJFcBHhF6CDm1xUDcBtt2eAWWhJ9Omrg5/8=;
 b=S1WBi/NHSquw3ZEjwRRLn3Uebxg6CZQ22tbCfzxV1eRpXVu/8LbF5j6Sz+RHoVSImkcGFVul9od7JEbD95Oxh8ARxJegr0qdCmSgyLRgqjcEPXhCyYOvJNQd+3tptUEjVaVKxn25PhJhSWiFtwLuxPpNBb997xUZ+IqWEykP75GHglvRqZlECBbUD13JSocT0zE1H6Y2kn3uh5uu1cvGWJhw4f3/tADAQM882KmuFVlckxbHmbQ1KxwV5qo1Q72hVAQq6ZEzgXXWXEnYi+LP2th/OJUkwnRR2BrvY/EC+P6xu0ksxWVWrLyx68FoRJV1WeWt/frwZYBLAocH37UC+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gk7mG3uOeJFcBHhF6CDm1xUDcBtt2eAWWhJ9Omrg5/8=;
 b=3z4fFgVAKxTuf9PQ1EWGo64exoWtNNDpkqOA5Hp3yCeDgb7BOdPe1C53sg4dWSY50CGVvE63nxW463hsvpIvKcdn73DOC+yT/LOsCb3jSLtiogqvmtQaF/KUxY+szXpZEQGIaVRaGgmS6YTgnfPMG6pg0Z/UNtfh9gL+APF6B/nL+c1PpoHyh3agif7MnWSYAXBbMgFQ5MfdBV3Wsa4btQtw5/sIXHzqdnF0xdhDCKiyuGO+8ONE48z6rLJ3lZoq/nrksS5y+b8FVtNwp/woLkOlMIcLiXYFOOglw603ofDeuitDi9O4eA4O2OHt6bZarOBBwTFuFk8uXnFLotAMtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <87e7f1ac-11a0-834b-2905-e91a800ec7b1@suse.com>
Date: Tue, 23 May 2023 14:40:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v7 07/12] xen: enable Dom0 to use SVE feature
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-8-luca.fancellu@arm.com>
 <48722696-ea22-1af9-2a0a-aa78972d118a@suse.com>
 <6DEA0CC3-C3EF-4509-A869-807CE4B21401@arm.com>
 <767b11a1-4d43-9057-1fcc-6516fea64fb3@suse.com>
 <45285215-4528-435A-B203-B770D60FABAA@arm.com>
 <4d86d3b6-3ce5-8d25-abb9-4c27b592647f@suse.com>
 <E8FD576D-917C-486B-B537-2455C9686A2E@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <E8FD576D-917C-486B-B537-2455C9686A2E@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB8000:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f491457-9829-4156-c8be-08db5b8ae208
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mZfAsDZJ0200UzgRu6h6eWoAT+5/1XxG24EoRC3qBR//FsqWzcpgfmIEyQo2Ewc/92SWxVux4K2UuhqlL4obzAdLiTsMQZgSv4T3KH3ZZk2Bsnz86tQcu3bIFek34UPT0dd1zgXD/0l+4m9f7K6wehhFqVpxDQ0QPlm4jhMgi19WQjqlti00wvV367WL1KZxj8KZ4Ptj0+AXx4mnJR1VDW5X1D6lfzn9F0NMFfPfZMpyW07Uptmq2QZ11zLA5OXXIQ2h/gxfybRMTHJD5OQaTvkOFzMnDvZYLupEwIddDstkkCwoQlKttLJbTzOWPErafW59ZasfvfOMpjXwUb7QCqFtOQlR3+7YDKR+sGMoBihWWdDoeVYQ+p+sp68DqQpvWLsbKZm5kYtWp/pKmqfOB6mJW6bSXq4qm58neGCpWuU7vAQfQbEWGheMO970YWafFWUkQykwMjdTksB/U4V4aaRWuUUtzddri9ZXPhdLRceS6eHK1QbrrMGShJaBf8eg57ivX8wUORqJWJgw0rh/+7aQy3E2CpxfwtBGqF+pqeHMolrqX2KyUUug2zHf+OkiVYCeqBTPZE/K5RyBDPtiuOfRPKp0rjuqP8xgyKExONsGYsu73Zr+6nJDWCR+4XCU1kl8vX4dOLKDrQd4ubc7vA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(346002)(136003)(376002)(366004)(451199021)(7416002)(8676002)(8936002)(5660300002)(186003)(26005)(6512007)(6506007)(41300700001)(53546011)(83380400001)(31686004)(38100700002)(54906003)(66946007)(478600001)(86362001)(31696002)(66556008)(66476007)(316002)(4326008)(6916009)(2616005)(6666004)(36756003)(2906002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUNBamVDTSsyNVh0clc0RU12MlNhdlJIanNtNUhOU0JtclRkSWxMcW1VVWls?=
 =?utf-8?B?emV6RVRRbVVkWnhGei9DZytsYkVTQ2hxcXdjejhCSktNWktqYk9Wd0d3eEZq?=
 =?utf-8?B?d3h6RUcvdnlxaTJMcm9kUS9wR1V0VHUrbFBhVm52NDROVk5JQ3Fkd0RlQlVB?=
 =?utf-8?B?YnpyRXdLMXZNc0huQndwMGVBVm0xdVpnRWpIc0xTalB6aEIrT1RoN0RqanAz?=
 =?utf-8?B?RURVQjJaRGhYaU1VeU1nRitPTUVlUVJsWkloL3kyTEVLQVJRTU96bjI2WWY0?=
 =?utf-8?B?TEJJNm1tQ3hOQ2xaa1p1eXgxemdQNWtlT0cwMUczblN5blppaytoQ1FXSjNQ?=
 =?utf-8?B?dmtwWDdyUHRHZEJoVGJ4SjdpUmZZTXhFQ1lGMjRYMXo5dmsrNTFxSFNMc1Zs?=
 =?utf-8?B?Q0Q1N1RWSVBpdWlHRUNreHV2WWJrRHZDNVF3cVY5RDhDZXZHK3ptZ0tYRVBk?=
 =?utf-8?B?ZFFuZmI4eVBheFpYaERIdGJWK2lIUktaWk1POHVqcXdiWnJhNzJrOFdQT0oz?=
 =?utf-8?B?aTZXM2FkcFBoNHZLRVFGcENZa0gxVzRBYkZIT09VTlI1S05TNkN1YjE1cnNO?=
 =?utf-8?B?QnNqdHFnQXJyQTRKUFl3cTZtYUFpeWZzdlpGZ2NTMVNqb3YyeW1tc2JBTVd5?=
 =?utf-8?B?N0JDRE5OVjkySWJKMDBEdXdzMFZJOVVzYnk5RlJhNk5rdWV2WkJsNzkzTHpH?=
 =?utf-8?B?bjZETVA2VzFQaDJydEtYQ01jRzM4VWJrSVpZcWFWN0hyK29nWFBDcFdDa0Zi?=
 =?utf-8?B?WjBramNpdlI4N2YwamFYRHNQRGdheGExWWtTcCsvcVhGMGR1dFFkZGNtUDRF?=
 =?utf-8?B?ZE9FZU9MbW1aejdUYmkrcmhoYXZLa1pLamlwRWxCZWlLV3hZRjhCK2paS0x4?=
 =?utf-8?B?c0llS3pyUURvYnY2VURFblpnUHJvSmtnSlY1TVBYMUFyQVNINUZLMHcxTERz?=
 =?utf-8?B?eFRqNzEvVzlrVEg1d3RvUm4vMzNPTHFKcnZZVVcrdE9wQy9wYlM1Zitic1Iw?=
 =?utf-8?B?R0lGQTdKY3B5UmlaQ1o4L25ub1FXNHBST1lTQlhyZXlkN25ZSWZFa0kvTW14?=
 =?utf-8?B?Y2JNTVJudVhGTkVoSEdhSDZYWUU3d3hpYUVveGZDb05xMU0zU0tSNUpHU1Va?=
 =?utf-8?B?clBNVVp6ZkRMZTdnUlZoOHMwU3BGVVJNTElUb3Y5b25ycjFYSWh6Tzh2WUhR?=
 =?utf-8?B?VExQdTlqbEZhWEwxZ2lOMU10VUpVNTdjYnBLZG01aGpybFdyNm5MbTArQVlq?=
 =?utf-8?B?VFg4VHBqT3ovdHY1cmFrKzc3Um1YWkZZSStOWVhISGw5UitvZGZYUzVhN1I3?=
 =?utf-8?B?cjEyMEJUNUpOU0NFbHFRM2NXQ01DQnJ3R29BdzhaL2M4cHEzOHo5WUJHbkha?=
 =?utf-8?B?ZjV0WmJUY2ErMkc3ZE9SZ2xyQlB1TjN4eE85blphM0l1Y01DRkFUTXlGNTV3?=
 =?utf-8?B?bHNySkdzeTBFQi9jZWhxRlZTQ1FuRlFLSHBEQWV5amdMUmZ4TnNTRzE0SFM4?=
 =?utf-8?B?Q2ZydEFGWmdKeXljREZJTWk1blVJY25YTDh5bElKQnoxYkJkeTRtYWhOZ2dq?=
 =?utf-8?B?YlZjZ0R4c1lLcWo2N0hqYnp6bHJsdFlXT29DUEZlRG9FR0Vha1I5NmU2SDR3?=
 =?utf-8?B?Qk54bDdmdW5Kc3pzWU55M3RidzFHVVlzQUNYMExwdG84YmxhK1E1Um55NWZY?=
 =?utf-8?B?TnMzbFFCK040TzZ6dFFBMDAxV1RyNytTN3hIdGk0NngzREFZUDBkcVVKTGxZ?=
 =?utf-8?B?Y1FSb3NDenpxaHNNWmt6M0duVGN2djU3M1VMelV6STkzMHVNVGU3TlJ6MTM4?=
 =?utf-8?B?K0w4ZXh2RUlDQUMyWnF6dGtPcDhxMHN6YjVxdEtDaThNSjlSRC8xVnpycjQx?=
 =?utf-8?B?aUxmUmFIRVUyUFZURVJ6cGNyT2tYWWFjbDJEY3lsaUtIVXhlWkdkeFU2dTNG?=
 =?utf-8?B?LzkyMnFSM2FaUXFoL2tvWTdWUWFZRlVWelVURC9paEJqa045WTNZTlgrT3JZ?=
 =?utf-8?B?T0h5djFIV1gyOE5uVzNQNnJGbU5ZL2M2YnhnUS90amtDai9xZ2tNa2puVmUw?=
 =?utf-8?B?Wkx2VExCRFBVUTRFbmt3U2pEbDB6bzRENkJBMHV6aWhMaTlUUFMzQmRqeDFw?=
 =?utf-8?Q?P8jqwM57M1G4ODfr+q0XLbtlc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f491457-9829-4156-c8be-08db5b8ae208
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 12:40:26.0839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RjY5Qw5+5c0x50/1TxE3cQrZscAKNGbYEmS5quwjoAAi4QHhc8iirTd0Ay02Omckj0UNqCd50V2ZL7nH9a3LYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8000

On 23.05.2023 13:57, Luca Fancellu wrote:
>> On 23 May 2023, at 12:53, Jan Beulich <jbeulich@suse.com> wrote:
>> On 23.05.2023 13:50, Luca Fancellu wrote:
>>>> On 23 May 2023, at 11:31, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 23.05.2023 12:21, Luca Fancellu wrote:
>>>>>> On 23 May 2023, at 11:02, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 23.05.2023 09:43, Luca Fancellu wrote:
>>>>>>> @@ -838,6 +838,22 @@ Controls for how dom0 is constructed on x86 systems.
>>>>>>>
>>>>>>>   If using this option is necessary to fix an issue, please report a bug.
>>>>>>>
>>>>>>> +Enables features on dom0 on Arm systems.
>>>>>>> +
>>>>>>> +*   The `sve` integer parameter enables Arm SVE usage for Dom0 domain and sets
>>>>>>> +    the maximum SVE vector length, the option is applicable only to AArch64
>>>>>>> +    guests.
>>>>>>
>>>>>> Why "guests"? Does the option affect more than Dom0?
>>>>>
>>>>> I used “guests” because in my mind I was referring to all the aarch64 OS that can be used
>>>>> as control domain, I can change it if it sounds bad.
>>>>
>>>> If you means OSes then better also say OSes. But maybe this doesn't need
>>>> specifically expressing, by saying e.g. "..., the option is applicable
>>>> only on AArch64"? Or can a Dom0 be 32-bit on Arm64 Xen?
>>>
>>> I think there is no limitation so Dom0 can be 32 bit or 64. Maybe I can say
>>> “... AArch64 kernel guests.”?
>>
>> I'd recommend to avoid the term "guest" when you talk about Dom0 alone.
>> Commonly "guest" means ordinary domains only, i.e. in particular excluding
>> Dom0. What's wrong with "AArch64 Dom0 kernels"?
> 
> Ok works for me, I will use “AArch64 Dom0 kernels", I thought “guests” were a generic category
> and then we have “privileged	guests”, for example Dom0 or driver domain, and “unprivileged guests”
> like DomUs.

Well, yes - "commonly" doesn't mean "always".

>>>>>>> +    A value equal to 0 disables the feature, this is the default value.
>>>>>>> +    Values below 0 means the feature uses the maximum SVE vector length
>>>>>>> +    supported by hardware, if SVE is supported.
>>>>>>> +    Values above 0 explicitly set the maximum SVE vector length for Dom0,
>>>>>>> +    allowed values are from 128 to maximum 2048, being multiple of 128.
>>>>>>> +    Please note that when the user explicitly specifies the value, if that value
>>>>>>> +    is above the hardware supported maximum SVE vector length, the domain
>>>>>>> +    creation will fail and the system will stop, the same will occur if the
>>>>>>> +    option is provided with a non zero value, but the platform doesn't support
>>>>>>> +    SVE.
>>>>>>
>>>>>> Assuming this also covers the -1 case, I wonder if that isn't a little too
>>>>>> strict. "Maximum supported" imo can very well be 0.
>>>>>
>>>>> Maximum supported, when platforms uses SVE, can be at minimum 128 by arm specs.
>>>>
>>>> When there is SVE - sure. But when there's no SVE, 0 is kind of the implied
>>>> length. And I'd view a command line option value of -1 quite okay in that
>>>> case: They've asked for the maximum supported, so they'll get 0. No reason
>>>> to crash the system during boot.
>>>
>>> Ok I see what you mean, for example when Kconfig SVE is enabled, but the platform doesn’t
>>> have SVE feature, requesting sve=-1 will keep the value to 0, and no system will be stopped.
>>>
>>> Maybe I can say: 
>>>
>>> “... the same will occur if the option is provided with a positive non zero value,
>>> but the platform doesn't support SVE."
>>
>> Right, provided that matches the implementation.
> 
> Ok I will do the changes, can I retain your R-by? I suppose it covers also documentation right?

I guess whether doc is covered is fuzzy. Since the doc part is Arm-
specific, I'd probably consider it not covered with the "!arm" that
I appended. But whichever way you look at it, you can keep the tag
in place.

Jan

