Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 957ED700095
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 08:32:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533693.830550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxMKZ-00089A-BK; Fri, 12 May 2023 06:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533693.830550; Fri, 12 May 2023 06:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxMKZ-00086q-8J; Fri, 12 May 2023 06:32:43 +0000
Received: by outflank-mailman (input) for mailman id 533693;
 Fri, 12 May 2023 06:32:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mY6V=BB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pxMKX-00086k-A7
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 06:32:41 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20628.outbound.protection.outlook.com
 [2a01:111:f400:fe13::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb05cced-f08e-11ed-b229-6b7b168915f2;
 Fri, 12 May 2023 08:32:40 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8779.eurprd04.prod.outlook.com (2603:10a6:20b:40a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.23; Fri, 12 May
 2023 06:32:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Fri, 12 May 2023
 06:32:38 +0000
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
X-Inumbo-ID: cb05cced-f08e-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqWeObCdq6+GO1FgZZtpFUVQ8wIJYKg/Xad6WCDXOHSASCHqw55eZ+SuViCLkrzDpSJ5IduWp+XdqCV6uqnqIZOpRR8nNW+ahW1gU8QFGO9NxUvMwiqhoHeUzmnstmU43yl2C1DW4B/OWvQxkZxEgfoTBBr1pohbuNQxVM5iXRCusq0MnCPnzo8QeSujQvAKWkFWbDp0Mq8gwTCXIWjJRuamWa4msNytRRS6y+Mw2bFyMSBLOS6YTqKLiWLQpIhBgPEF8cVMxAijqBtOBig5qj9tMJSoDj4MjGQ9ViKEZybgSo1JGijoXuvqRv3WgDOwHxxRQAcBD3PrSZ3jTn0pvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NyVFXXXN3OXQL9AkphEh7GbeLx+vqwx+D6JtFWEvfMw=;
 b=kBPXrhpLu3tFhsb6X6ciB7rv13NIYhZH3W1qlhYdrs2JjZVxSiSLFN6lgL1jCcIpq8F2tXL0H4ahS7nxVrm0MVZkVOGdLEejD6H8BpPABD7Dnymt5A2L+exaEHlSZo5ZPePVHyQ9KTESof/qL11d6lJJoEvmCW3yV8vXGX46ZfMsgmam7eANw97FTvW4hnHpxED1eeoErkXFfrScO1sQ9s7cCkHgo3x/3IF1O9MQk6dYl+OlVJkULWeVhn3UpJapB36uSuhbTTv29pfFH5Kw3XszrimuYblTpi7Cyf8CJqcJzcvxKIxde/smIUYkvBWi+4DDqverD9zNuRU7wTuLbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NyVFXXXN3OXQL9AkphEh7GbeLx+vqwx+D6JtFWEvfMw=;
 b=IkatPgbp8HG+6T4WqRaw4e5irpjEy3C4T5TUjokk1HzhvX6ZNBEMMRTNDCPWU30Cq+RrHrQtrm05j4qYLOOOpixYnYZznW+VU/xr5HOGnE+ClzU+X16uPleZoB6sHr3zhlz8GMGlRaupSm3dktXHneDAP7ogbuipYMNcQQjgMRY4ZnWC3TnwhiH/0cyKzCKUuHPRJsqUT0L+yq8uAEQ21Y6qe41tQ7EUpccArL3SrS0RxYlZN+o/JAs12bS/0sdTDo1339obXY2HEnPjjzuJDSObiB+ydleCF42NYbFUtAyLArZ/u6cAbghd7gWe8+BMTI7W6txRWeMc7mGgE+AZtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <759d186d-95a4-86cc-1713-468a4f6ca4a7@suse.com>
Date: Fri, 12 May 2023 08:32:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 07/14 RESEND] cpufreq: Export HWP parameters to
 userspace
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20230501193034.88575-1-jandryuk@gmail.com>
 <20230501193034.88575-8-jandryuk@gmail.com>
 <7db38688-1233-bc16-03f3-7afdc3394054@suse.com>
 <9cf71407-6209-296a-489a-9732b1928246@suse.com>
 <CAKf6xptOf7eSzstzjfbbSU0tMBpNjtPEwt2uNzj=2TucrgFRiA@mail.gmail.com>
 <80ccf9c7-5d22-b368-dac6-01fe6cec7add@suse.com>
 <CAKf6xptLpj_L_G3Qk+KA-yaTcaMHLJLL9soFP9HD6Ro+8Lk7CA@mail.gmail.com>
 <559c7f4f-113e-8e58-d4d0-3c0c36f27960@suse.com>
 <CAKf6xpvXsiac7WqEuj_e9GnuNMMEi-DZ-P0i1Hr79s2unGQZGQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xpvXsiac7WqEuj_e9GnuNMMEi-DZ-P0i1Hr79s2unGQZGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0189.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8779:EE_
X-MS-Office365-Filtering-Correlation-Id: f5fd901f-e83c-4dd4-a831-08db52b2ae59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z6ZTfGpFESWtPvKm0re/Vvih4X74SGHCh9Ef0sFt4RBE/z20nReoNjFGQyv+Gq+4aJjJv8AiSWkfJnlFOS+9HE5SRYLmtp4Ph8GVOk/Ls3amypD+/m9pRcp67r3Jzu/eGX5uo2i4UyoIjGpREE+4jMwIhrj9uymyeLwhSLFqbQVO2w01uRuT+jyyki0mNEORdRhxSyJoFnLlarq7Qw6HDexxDfQk/WkHjrUykQmZtQMzmpHAQPEeVdyEO0q8hfGbOCPWqKnhrT/0LqHC6raALem6rsuA8VxUexLzjPkiXfhPJXmWAGh5DZWIi1lP5C13so4Mb8CHf+yGo7mYZREtNjyq1Zn0giXENuLha+QVgSmM361cs0fk9bCNTRY+knYJ+zr2g54WKb+HCdk2sv6cMvNVjZaNDX+MOlWk5wwtkk5mau9IHxXugUYz9b4XbmUYNtFO78hno2yMYvqsm5mXxAgy6eP7CPIbnq3II79lEy7wAyUzX6NSM+nHnv49DXLRSXUh8C/Cmv6O3BcE8l4ARy/Q5CQdti+JpIfvYZ3su98BZEzM7rxoWg0bbkVdOv2UG9x1TUZG45rre3JrLhYKAQYpPJgpJHoAgXsa+FnHfSfL/KxVqG7dJdueEDcgB+PC4NHaClGSZR/tzQ+NJF3VcQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199021)(31686004)(83380400001)(4326008)(66946007)(66556008)(6916009)(66476007)(478600001)(966005)(316002)(54906003)(86362001)(6486002)(31696002)(36756003)(26005)(186003)(2616005)(6506007)(53546011)(6512007)(8676002)(8936002)(5660300002)(41300700001)(2906002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFpobFdxbFZXWHF3Q0t0Q3dMTUUrTXVjY0FyZUJWNGp6c3RGWE4xcjNwZ0tQ?=
 =?utf-8?B?OHFXZ2xFV3p0U0ozWU5aMy9MRzNTa3lZZm9YUDYzRGJRVGF3SFhwb0tiTUpt?=
 =?utf-8?B?VkV1dnNXMXIzelB1OG4rdGdlbytnbnVPQk5rdS85a2xTN09RVEdkcEdNUUor?=
 =?utf-8?B?Q0lnT1lrT3lxdWtwRkhlcTRld1Q1cEhtZTFoaU1LZ3UrYnRnenhzS1hqaGlu?=
 =?utf-8?B?NkdCYnI0WWhib3lMNitmRnk1TE9GOUN6dkNiTGpQMmZiRDc3SlZTTzFoZzdx?=
 =?utf-8?B?YmgyTWRpSXRwTVpMa0ZzbFlqZjh5dzh1SWJCN2FYZFlvOFdJeHpjWDl6dlc5?=
 =?utf-8?B?cUVmeGgvOFdhcTdRZ2FMY0tDUkZsd1U5WkZQeFBGV3dESFBKYU5jTUdqaG10?=
 =?utf-8?B?MTdGUHU2UFdFajNLK2QvdXZ1VlUwcDFUVXNKMWtiQnJSWnFMZGdybmQ4T2Vt?=
 =?utf-8?B?NURMMW82cmk3bU1wanBNK0RKQzE1Q2pubjBwd2IyM1BQSVFabjNOSVY3SXZz?=
 =?utf-8?B?dHQ3SWF1dGlPQ1NsdVpCeWNoNllzNWJjSHBGTFM3dU1RT2FrcWljM3BialZt?=
 =?utf-8?B?V3BZelMzcXMyeU00eVoyMjhmRnVVQWZrYlBHd3MyQ0ZFdFRQR3FPSWVMaE94?=
 =?utf-8?B?eDZFUGtaR2Vudm1wUXlVcVpCcEgxMzlWaFdoYi9jNTZNbkhVVllzYjZMV0ZL?=
 =?utf-8?B?ZTdET0pyaW1tbFZxMjRVYVVidkY0Uk9tZG9tTDRVc2UzbmxMZWRJeGNPNlRx?=
 =?utf-8?B?VFVESVcwYVBndW9iN3RCVTdpRjRmL0Y3bFJiL2ZaVE93ZExlVDROK09PbElU?=
 =?utf-8?B?WW5odVRCdjNCNDJuZWJTaVgrZjUwbU1WL3h1eVFKZDdhS21lcGYwaUJDOElS?=
 =?utf-8?B?ZXZVZzZaaG9xL0xiYzZUUWJxdmZmTThvV2JpZ290N1V0dUYvalVmK1U0S3lM?=
 =?utf-8?B?dVlMdUlqNWljeDZma2lYcmZpMG1janNvVHZzSEp6TTVibStYdnZDbmY2a01Y?=
 =?utf-8?B?TFFwTGtGRVloUldzZVZ3cHNnd3oxbUFER0RiY05iRk9XYm1qYk1Ia3QxTGxF?=
 =?utf-8?B?THVXS3gvd2VRSVJVRE0wSG9HQ2Flb1FYd3dnMWsrTDA5M29Ra2ZNM2NaZTFR?=
 =?utf-8?B?aGY0YlJDNjR3ZlI0RERnRUNiMnQxNjAxSWlGQTIyRWRqcUlpdTlxWmJXcnQ5?=
 =?utf-8?B?S0o4dndkRWRSRXRrOHNMRzNlbit1c3FEdXFaYTBrbHZJcWI3SUdJQzhtSXZ3?=
 =?utf-8?B?bFlySStWZ0s5L1NrTFdFQUh0TFdhV1ZNZXRzZ25VUUdtcHp5MldrS1RDaFZU?=
 =?utf-8?B?S21hR0M3U2dFNVJrSko3MkVTZktZVmpiRVdzU1U0OXBLdGtnL1BPNGtZeFJR?=
 =?utf-8?B?Uks2K2JWUERMRi9YeU9oSk5vajJYNmdINzRXbmk2eHFsS1M2MFFXWHAwcmRo?=
 =?utf-8?B?VWkzcTkrQVI5WVo3ME14NjdEMHV2bzR6SnlELzRwYzhyYXVtUW14KytjZXRU?=
 =?utf-8?B?cXhEZlhGSzVtWldyNlNGM1pKcXBSNkZYUGxMb1B3amtNZzgyZStWNWNVdzlS?=
 =?utf-8?B?V0pHTWE2L1A2QkhyRVJtNkowQlNDaFVaLzY2VTZzMEtnaXlKTDBYSXlaVnlO?=
 =?utf-8?B?NzdScnVPemJVQ0ozZUZybWM3LzEzd3FhaWNYRXNQcDF6WFQ3Vng1WUhDa00x?=
 =?utf-8?B?aTRuL0J2ZzA4S1gvTWErZ2IvQS8zcWkvR0dqdEV3WEt5ZVY5dTBEYVRTTmZn?=
 =?utf-8?B?OG1jYjZlS1lHdE1KV3JvVXN1OE9jUnBkZmZEdjNWeWY1bXNOelV5Zy9RSjdT?=
 =?utf-8?B?Rm1mb2ZzL0VVV0JqWmp0ZmprQUlJSTNuM3hxT1hXNHB4ZEVGY0NJT0paSnBq?=
 =?utf-8?B?Umd3Ri9tWm05bjQ0Y2tuVGZCMEdIVitaVWJDblJ3TmllNVIxbjUzZ2J5b1hZ?=
 =?utf-8?B?SFoxa3hzS3REdnF3T1hWOGRyTS9CMHo0ck0vT1dLRVE4d28zNXdLTkJCVVZV?=
 =?utf-8?B?M1JGSTM0amJpYThoMnZPM3diR2FpS0l3amdXMWRXZlRLMmVnWlowVzVjTTJ0?=
 =?utf-8?B?NHUwRUdjMDM3Wnc5UlhlVGk0QUhwS3hCeUNaVXlQd25EUC9JZXRoRXl1N3hH?=
 =?utf-8?Q?zQTu5fiVcBXkQ3rQK2lEj+qjR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5fd901f-e83c-4dd4-a831-08db52b2ae59
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 06:32:38.7369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FVca6DHdb0zYUiObOWntlp7uejTCfRdkrR1mMXwFAewuojhyvOfO0TFlmyIlf0DxiJvpzOURc4kVoRUYbnEBXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8779

On 11.05.2023 22:22, Jason Andryuk wrote:
> On Thu, May 11, 2023 at 10:10 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 11.05.2023 15:49, Jason Andryuk wrote:
>>> On Thu, May 11, 2023 at 2:21 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 10.05.2023 19:49, Jason Andryuk wrote:
>>>>> On Mon, May 8, 2023 at 6:26 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>
>>>>>> On 01.05.2023 21:30, Jason Andryuk wrote:
>>>>>>> Extend xen_get_cpufreq_para to return hwp parameters.  These match the
>>>>>>> hardware rather closely.
>>>>>>>
>>>>>>> We need the features bitmask to indicated fields supported by the actual
>>>>>>> hardware.
>>>>>>>
>>>>>>> The use of uint8_t parameters matches the hardware size.  uint32_t
>>>>>>> entries grows the sysctl_t past the build assertion in setup.c.  The
>>>>>>> uint8_t ranges are supported across multiple generations, so hopefully
>>>>>>> they won't change.
>>>>>>
>>>>>> Still it feels a little odd for values to be this narrow. Aiui the
>>>>>> scaling_governor[] and scaling_{max,min}_freq fields aren't (really)
>>>>>> used by HWP. So you could widen the union in struct
>>>>>> xen_get_cpufreq_para (in a binary but not necessarily source compatible
>>>>>> manner), gaining you 6 more uint32_t slots. Possibly the somewhat oddly
>>>>>> placed scaling_cur_freq could be included as well ...
>>>>>
>>>>> The values are narrow, but they match the hardware.  It works for HWP,
>>>>> so there is no need to change at this time AFAICT.
>>>>>
>>>>> Do you want me to make this change?
>>>>
>>>> Well, much depends on what these 8-bit values actually express (I did
>>>> raise this question in one of the replies to your patches, as I wasn't
>>>> able to find anything in the SDM). That'll then hopefully allow to
>>>> make some educated prediction on on how likely it is that a future
>>>> variant of hwp would want to widen them.
>>>
>>> Sorry for not providing a reference earlier.  In the SDM,
>>> HARDWARE-CONTROLLED PERFORMANCE STATES (HWP) section, there is this
>>> second paragraph:
>>> """
>>> In contrast, HWP is an implementation of the ACPI-defined
>>> Collaborative Processor Performance Control (CPPC), which specifies
>>> that the platform enumerates a continuous, abstract unit-less,
>>> performance value scale that is not tied to a specific performance
>>> state / frequency by definition. While the enumerated scale is roughly
>>> linear in terms of a delivered integer workload performance result,
>>> the OS is required to characterize the performance value range to
>>> comprehend the delivered performance for an applied workload.
>>> """
>>>
>>> The numbers are "continuous, abstract unit-less, performance value."
>>> So there isn't much to go on there, but generally, smaller numbers
>>> mean slower and bigger numbers mean faster.
>>>
>>> Cross referencing the ACPI spec here:
>>> https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control.html#collaborative-processor-performance-control
>>>
>>> Scrolling down you can find the register entries such as
>>>
>>> Highest Performance
>>> Register or DWORD Attribute:  Read
>>> Size:                         8-32 bits
>>>
>>> AMD has its own pstate implementation that is similar to HWP.  Looking
>>> at the Linux support, the AMD hardware also use 8 bit values for the
>>> comparable fields:
>>> https://elixir.bootlin.com/linux/latest/source/arch/x86/include/asm/msr-index.h#L612
>>>
>>> So Intel and AMD are 8bit for now at least.  Something could do 32bits
>>> according to the ACPI spec.
>>>
>>> 8 bits of granularity for slow to fast seems like plenty to me.  I'm
>>> not sure what one would gain from 16 or 32 bits, but I'm not designing
>>> the hardware.  From the earlier xenpm output, "highest" was 49, so
>>> still a decent amount of room in an 8 bit range.
>>
>> Hmm, thanks for the pointers. I'm still somewhat undecided. I guess I'm
>> okay with you keeping things as you have them. If and when needed we can
>> still rework the structure - it is possible to change it as it's (for
>> the time being at least) still an unstable interface.
> 
> With an anonymous union and anonymous struct, struct
> xen_get_cpufreq_para can be re-arranged and compile without any
> changes to other cpufreq code.  struct xen_hwp_para becomes 10
> uint32_t's.  The old scaling is 3 * uint32_t + 16 bytes
> CPUFREQ_NAME_LEN + 4 * uint32_t for xen_ondemand = 11 uint32_t.  So
> int32_t turbo_enabled doesn't move and it's binary compatible.
> 
> Anonymous unions and structs aren't allowed in the public header
> though, right?

Correct.

>  So that would need to change, though it doesn't seem
> too bad.  There isn't too much churn.
> 
> I have no plans to tackle AMD pstate.  But having glanced at it this
> morning, maybe these hwp sysctls should be renamed cppc?  AMD pstate
> and HWP are both implementations of CPPC, so that could be more future
> proof?  But, again, I only glanced at the AMD stuff, so there may be
> other changes needed.

I consider this naming change plan plausible. If further adjustments
end up necessary for AMD, that'll be no worse (but maybe better) than
if we have to go from HWP to a more general name altogether.

Jan

