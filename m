Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88546771B8E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 09:34:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577788.904814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSukv-00004t-OA; Mon, 07 Aug 2023 07:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577788.904814; Mon, 07 Aug 2023 07:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSukv-0008Un-KB; Mon, 07 Aug 2023 07:34:21 +0000
Received: by outflank-mailman (input) for mailman id 577788;
 Mon, 07 Aug 2023 07:34:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qSuku-0008Uh-8O
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 07:34:20 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d185a95e-34f4-11ee-b27d-6b7b168915f2;
 Mon, 07 Aug 2023 09:34:19 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9464.eurprd04.prod.outlook.com (2603:10a6:102:2ac::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Mon, 7 Aug
 2023 07:34:15 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 07:34:14 +0000
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
X-Inumbo-ID: d185a95e-34f4-11ee-b27d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VsQO651MKgjCBmtPXIjCAaxMiWuU02jD3AzXC6cPkSlMae2ZwukLWD2DJJ1NNYxaE8P3eAJuJ0cy5idGfMlw8VYZ8wmYSwJo7MdY3cd1BFJ3dpQSwyZsIouAZkRyyaLkOGhTFuMA9yg8UEyAYre1iE3s61zgD1TUijTGVYTihRdHuVTMjkwCLyPBNyap5ykDSmzxiEjXe6/457fsWMH8WSVZpp297lA/Q3+SaMjShlvOztZ1Pa2WPGfl1rWEGemgBRv+ranRqdEawByplxq9x+IzFylFbDWTFFlCsZarfGOceZJ8WJTJeq1ljG8cqzc8Y57BTDbu3RPRs2ntP2jnxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iP3s02LxCbJoWD/kuK4cxD5RNSIhOTrDuWuGo6t7H2U=;
 b=EMtwnX06x5uue+LWTbvzKrB8Uua4U6YKym/+u4eYGqBMjyCmQB4G4TCWRUcJy0voB/yFJvWwXV6Lisw0Usjo+mpTtM4PSSRlTKmtZcETJOuWptK0AI8pSvzYDExlt6txz9kR4h9Hk6kPTphTv5Md+C8wnSZfC2eL+l5loWUCDxzy6l9rR5OpH3O1zBXBF780MliZh7zwMt+f9LRj6fniH5xii94qosbASimXTcGwMiXMR4iBlD5uCMKMx2cedt3WO9piKWIj/Occu18GB/WKGANWAdEkwy7rd+p7wA48cOiDE/L9+Sggqg0o4IP7cKAxU67t36muO0SV9/KgPWeYHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iP3s02LxCbJoWD/kuK4cxD5RNSIhOTrDuWuGo6t7H2U=;
 b=06XHms1jbJRjbzr4fEBK4oNS08gINq4+jwvXM83VmFyYS4lyC5KR5E15pM1dyQYZruJ1ci0D9K2mEmi2v2NDhUBnYqo28GXum8OzqmbrxAb2fOPLlDsjXcha0FiblK0re1Jk9Y/NMUDOVaYIUqC4NID77+tHAGnUr+m9KqhUBfOzRLR5t1okp+HeHLDuxK4cuLIZ8VEIWN2UALUKRxL4cgpUncaZCK9temtj8ISxFf937iqNYx5yrBWfge3KNJcAfyYhjFD+dTMTr7zDr+wDy/qFndFIymEwNzx+naa19GoWgbiwU7+JCU+Ejy1k/tUNcZgWntFcZlRANdZwntalYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ce365fcb-2a9c-dd41-6abb-e7ecee53d7ff@suse.com>
Date: Mon, 7 Aug 2023 09:34:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: Address MISRA C:2012 Rule 8.4
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Michal Orzel <michal.orzel@amd.com>, xenia.ragiadakou@amd.com,
 Ayan Kumar Halder <ayankuma@amd.com>, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <786d24b044bfa503a73a36d2a01eae8c@bugseng.com>
 <alpine.DEB.2.22.394.2308031733380.2127516@ubuntu-linux-20-04-desktop>
 <00fb1a58849ec08534465df2f8ca2284@bugseng.com>
 <a44369bc5e64277cab6dedb636986dd3@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a44369bc5e64277cab6dedb636986dd3@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9464:EE_
X-MS-Office365-Filtering-Correlation-Id: d83fe74c-c106-49e7-7439-08db9718b33f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MwRNBYX7zSphKj/GdOtsQltzngMduFWDQCt9Q0yTlC7pKeGSiDE2I5V/Sx74snKyiR0bJiYAAI/nMO0dDsL/oaLVSDq3Qx2fdWTQk+6vtWaK8jnLgu6OxieR4F488gJWFpwHIljVk7E6nsiRrsHp0dNHbViTWuNBIYai73qKuD5sOw+4nohWDsNCd/aonNmsVyiG6UUhO9eHf8JsIpjEH6K5AYyl2r3LU3CCuI2ld05gaPNMU20mXisJ8kda0gKWz3+CzAqBLubD091q8vienIMaId2pIiW+0jw7Og3UnsE9NA7fN6WiIbDbEE4oXlGSBY9bH7lHRZubSKpBNfFHyKc2QTdMXySh3l3i1m67QenrlSoOQ/0dxNvtdX+mZfVsP4KxZglHiQmHTHFMrgcdVxUhDG/I9NnnM9souybd6GI4jY8a6/z6IyWXHSD8c5E1C6KM1mvSu69+LFnCHP2WbveUC5R5900M1KNcNYJbmtEZ5SDRU36XFGggQYIQ8zI2jFXU1ZdYc8NAPmYg1PbPk4w7p8wMIuTrmdZ2fwayWthEXWZov+7pCajSjgKZOgTOk+lIev5IxgILFwmEhCnJuBvggSZmVjEcrVqiO6NAjZoSM/lxOp7WCE7MLWdSELs7Y3k30qWQ9QDkumyBWlP1bA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(39860400002)(396003)(136003)(346002)(186006)(1800799003)(451199021)(7416002)(36756003)(66556008)(66946007)(6916009)(66476007)(4326008)(2906002)(478600001)(31686004)(8676002)(8936002)(31696002)(5660300002)(41300700001)(316002)(54906003)(86362001)(6486002)(38100700002)(6512007)(53546011)(6506007)(2616005)(26005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnVvMmhMZ0ZBS2lucTJOaC95NFNDeTdIS2JwRFNldEFNbzBkamQwZ2dmYjB6?=
 =?utf-8?B?ZnMwbEo5M09ZcFkrckNreUU1TVZHT2NjeDQyQVJsaFVrV2hkTk1RNy9URito?=
 =?utf-8?B?ZUZlVitWcTF5clROdUl0QW51OFRYTlc1TWFQQVFlZ1JrUWlQRjlKbzJHaXZy?=
 =?utf-8?B?Vm1oUzhCYk9nMWppMEZrbkY5cC9EZ251dEVWaXE3UWtVL2JyQzRObXUvV3p4?=
 =?utf-8?B?ejIrYzgreGtmOWtzRTR5NkZtRU84d3BXaFcxNUtERmJiZmZnRllJUFVtVGEr?=
 =?utf-8?B?NkxSRFlLem10TUExVVJGZ2ZYcU9XcWZ0dklGTzBEbTMrVE9NSVFYZ2dUOWV1?=
 =?utf-8?B?VGtiMEtDbUVxMERybkZ5TVBOemMvN3lpdXlYNzBkOTVPWldid1JlTFo5NDBz?=
 =?utf-8?B?MHVabUtSMnk1UHQ1dDZwVUVuOVJtQlZ2aTBGc21paTc0ODlvUEtrbUtMOVdB?=
 =?utf-8?B?YVR1bXdqMjlJOWVJa0xVZy9jdXgwMUdQaGg3OVZqa2tOZW1kUEJUcktQMGxh?=
 =?utf-8?B?TDVYK2ZXcStzOHR6Zm11amdWS2ZZWmdDemlGRjZ4Zlpad1VsWllDd3B4UXpi?=
 =?utf-8?B?OXNUS01ZYmIzT0pYdWRQSS9VcnRkOGxYbUdHTnhCWStuMEtCdHFSY2R5NmIr?=
 =?utf-8?B?ZXROY0lYYm9YV2ZNVzRUL0JDcGdOQ3drVU5uTC9hMHcwc2lwV3g1ZFlRWkZI?=
 =?utf-8?B?R3owRTlYNEJnd3ZTb3RsNUtTTTBiSmYrd1ZxeDc0SWUxbFNIcnA2Y3hyUXNU?=
 =?utf-8?B?L2Q3QnRsaGhCalNuc0Q3RWpjemJ0SlRER0JHVzdMck1FaGFxaDZBcHBjYzZN?=
 =?utf-8?B?L3VjR1FHTlUxY2FjSldheTkwRS9NZ3FYOEc2Z1ZKaVBCU1pXdVg2OFl3Z1Fu?=
 =?utf-8?B?NXA5dm1SZ1k3MEVJYUpuM2h5OEE2eUVvMGdOck9DKzJXYlpmcjhWemJZVjFF?=
 =?utf-8?B?KzJUS1RLaUVxQ2JBZ3dQbVh1VitYS2JKenk0OXV6WE42UVpxMnNLb0s4WmdX?=
 =?utf-8?B?aVNpa21hc2ZzN1ZpWFFOa2RCaCtzQXl4QXhpdDJCS1oveFBKZDlMSEhGZlJs?=
 =?utf-8?B?YjVTOXpVSUJzMjhROHhJMTg3dEtwcUZVUXYvcXFRSGVjZ0pTSzBqNTFDTUVo?=
 =?utf-8?B?U1g1M0k2c3Y0TnE0REJYTVZDVnYrcE5LdW9hbmdDbGw3bVpNcDQ4NHZIY3Zv?=
 =?utf-8?B?VzBmanNWWGVLT0tCU2YycldmNWU5V2thRFZNUVBjRWFnTWFiWXd4QUE4QXpi?=
 =?utf-8?B?ZVJZNzBoQlpyclRnQ3ljOXFkVTNaQTBSY0pzYUp1Yk91SnpGVWVDVU44QmVB?=
 =?utf-8?B?QmdKS21BRy9CUmxkZE5Pakx5S0tVNitQR0RXQ0VSUmcxN3F6L1Z4bi9mamI2?=
 =?utf-8?B?SzRodVV0a3JxNGVNZktRUHY5NlQyVSs0V28zSi9SbldTVXBTWEVHVWpPWjNs?=
 =?utf-8?B?MkxBUzNxWGxzQzBwZUgwSzNEbVo1OVhaOTRXM0RnMEVBWndKaEdiRmZBRkpy?=
 =?utf-8?B?QUI2anc2dk1MWVZ0RU1xNnpycUlPd08zTGFsbThPNDJLTXRGcmYrOVI2bEdx?=
 =?utf-8?B?ZjBKK3lnME1yL0kwSDhLc243Y29ITXVQUkhacWpZQzFlbWtWaXVmK0cyNXlK?=
 =?utf-8?B?R2FsbGhLNk9VMTdLUGJsdVRzTkhONXhBTUxKV1FweGo3WGxPT0pHMUlDbkZq?=
 =?utf-8?B?SFZzM0s2cTU0TkZZdVgrWE85VnN5MTV1UGx5dGYrV09RK2tZVFBNZ1ZqZVpr?=
 =?utf-8?B?elgvNGs4c00vVDUyZVdaSk5sVHpIK3hHcjFoTWtSZzBYYUdJY0g0VWQ1RzZI?=
 =?utf-8?B?VzRyZUdSRGVrUnlkTWluUnhaa0xrMzdDMmtvZjA3RTNhU0pORmxhSzhVODVP?=
 =?utf-8?B?OHNVWmQwcDBUdEQwYys0QWJ3K3MrTVdING1Ya1R6cTMyU3FwTjJJZHN0SWMr?=
 =?utf-8?B?RE1WNVpQdm40M0xVU3o3SXhISU44RHZqNDZxZVhaelZPMm1JMEdsa1dhNzZj?=
 =?utf-8?B?UE1pa080NGJIUUFKcmpBUGo3VUpMTHY2cDJRdGcyaXRwUXQrenUwbXhEYlV0?=
 =?utf-8?B?T2dwc2F4RzZJZ3ZmM3M2NEJDZkJQSVNIbWxoQmNSejNJY3dCT0FwT3hsd2RJ?=
 =?utf-8?Q?yIgtahkzpl8NYEXPd7XkZ08hH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d83fe74c-c106-49e7-7439-08db9718b33f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 07:34:14.6395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+iigotxt3yYTc7yVWp+PceQyJ3JM/nAcd8q1pvXaC6CX0bolq0FT5DGIkUuc1zdpZ2NUmDqfif7RwB1kXwXwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9464

On 04.08.2023 16:00, Nicola Vetrini wrote:
>>
>> Upon further examination, I identified the following patterns:
>>
>> 1. Functions defined in .c called only from asm code (e.g., the
>> already mentioned __start_xen)
>> 2. Functions/variables declared in a .h, defined in a .c that does not
>> include the .h with the declaration
>> (e.g., 'fill_console_start_info' is defined in 'xen/drivers/vga.c',
>> declared in 'xen/include/xen/console.h' which is not visible when
>> compiling the .c).
>> 3. Variables that are either extern or not, such as 'acpi_gbl_FADT' in
>> 'xen/include/acpi/acglobal.h', depending on
>>    DEFINE_ACPI_GLOBALS
>>
>> Below are the proposed resolution strategies:
>>
>> 1. I would advise to add the declaration in the relative .h, to
>> support automatic consistency checks with the
>>    implementation and a quick reference when touching the asm.
>> 2. To comply with the rule, the header with the declaration should be
>> included. Also note that there are some
>>    corner cases, such as 'get_sec', which is used in 'cper.h' without
>> including 'time.h' (which should gain a
>>    declaration for it).
>> 3. One possible resolution pattern is including 'acglobal.h' twice
>> (either directly or indirectly trough acpi.h, if
>>    the latter does not cause other issues) like so:
>>
>>    (assuming DEFINE_ACPI_GLOBALS is undefined here)
>>    #include "acglobal.h"
>>    #define DEFINE_ACPI_GLOBALS
>>    #include  "acglobal.h"
>>
>>   this way, the rule is followed properly, though it's not the
>> prettiest pattern and also clashes with the objectives
>>   of D4.10 ("Precautions shall be taken in order to prevent the
>> contents of a header file being included
>>   more than once"), but then a motivated exception is allowed there.
> 
> One further question is whether functions under 
> 'xen/common/coverage/gcov_base.c' should gain
> a declaration in 'gcov.h' or not, as they exist just for the purpose of 
> being referenced
> by autogenerated profiling code. I see no reason why they shouldn't, but 
> they can also be safely deviated,
> since they are not called by Xen code.

Imo it should be the compiler to provide a prototype for these (much
like it does for builtins), thus ensuring that an implementation
actually matches the compiler's expectations. Yet afaics it doesn't.

Jan

