Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A243C6ABA
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 08:48:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155029.286320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3CCr-0000Mj-Aw; Tue, 13 Jul 2021 06:47:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155029.286320; Tue, 13 Jul 2021 06:47:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3CCr-0000Ku-7x; Tue, 13 Jul 2021 06:47:49 +0000
Received: by outflank-mailman (input) for mailman id 155029;
 Tue, 13 Jul 2021 06:47:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3CCp-0000Kn-9I
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 06:47:47 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a2878b2-e3a6-11eb-8726-12813bfff9fa;
 Tue, 13 Jul 2021 06:47:45 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-uy6E8l3HP2GyrkibL8zRfQ-1; Tue, 13 Jul 2021 08:47:42 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5471.eurprd04.prod.outlook.com (2603:10a6:803:d0::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.25; Tue, 13 Jul
 2021 06:47:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 06:47:40 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0501CA0066.eurprd05.prod.outlook.com (2603:10a6:200:68::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Tue, 13 Jul 2021 06:47:39 +0000
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
X-Inumbo-ID: 3a2878b2-e3a6-11eb-8726-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626158864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/8aF1fBFzzq9HM3x/0tgyw8+NTiqGYnkNgO6hpnH6mg=;
	b=TBuSzH2w4DaxAWfcwItzRg5g2HeHVXOhDYWkncmN9vmyNgbYeQKirFDVyggv2Iu3jR3Tdk
	3rRm9ebBJ7+VIZyeYIuHk65KTeh6hzRcVpnA7TCpdMibS/xIpF1iinvjwaQudyuUon1SdH
	zw63bIqQWFHhoZ1DWACi3dxHxRnfpzA=
X-MC-Unique: uy6E8l3HP2GyrkibL8zRfQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCLJCSyE5bEpxqg8iChOXDfA9g4NrZYHTT/cUFH+bgwR2YYQX/Sk7lk8vQ68wZGECFFh73nW2TOw5igcC1l02aZdiIM3hPz/JBUdnj8wnGGgc1/e2zY+/A2ETZBPpHw+0PT5OWa7wjMgaviH3q4CnfjeR25ilNUrMqJvHWOM1PAh4uBZM+xUu6GWCo7ASIxYY+zfR/ek5BOp+XvFHT21J4FRzD7BQwK4RRGjIUud9n23xF7FR8IU3wgtk8ZA/sl7Ye5iCIaZEO1xWzpMf0bdceH6elEA5+sP6vQn6OSp9rvZpT0/9w7FeqswL+ZNZdR94e+sDY+jHyf37Vcqt3Lsrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8aF1fBFzzq9HM3x/0tgyw8+NTiqGYnkNgO6hpnH6mg=;
 b=WIS8CYZK7bwU4DJFKMxhJWQCCDlvZayiMtZ41l/qlbIvlk2ilztQ+8IeAkiKwjSVTe0RqIkD//7JlKUqp9fUNEJRUxFGvxsPPYS7r+TVBoEigqwb67J1jtDQVql1szZKqh5w3upVMsl2wWKAtrBcEz7ZxKin9ecpAUO43bQ5g4MvXSK+sd0JDCqnIuAYDZp1OzpPVhvZFnB5BWgpEfYSKDbaKdOWgHKogTljf8oqBrDE0R8Ck0f0iSViWULQ75VlecJ39TTI2RgcN4Q5U5jGh6QAT1bDUFAJzYaZ0I+sy+hQmNsp9g1jLD6eQCvI1X3EGAO9Knuv5cR4s8fv+PAX4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v4 3/5] tools/libs/foreignmemory: Fix PAGE_SIZE
 redefinition error
To: Costin Lupu <costin.lupu@cs.pub.ro>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Cc: xen-devel@lists.xenproject.org
References: <cover.1623155575.git.costin.lupu@cs.pub.ro>
 <83beb95e3633b1aca7801fd8592406e2057f9bdc.1623155575.git.costin.lupu@cs.pub.ro>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bcc8d8c6-f9d2-6fdc-4533-398b7f261126@suse.com>
Date: Tue, 13 Jul 2021 08:47:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <83beb95e3633b1aca7801fd8592406e2057f9bdc.1623155575.git.costin.lupu@cs.pub.ro>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0501CA0066.eurprd05.prod.outlook.com
 (2603:10a6:200:68::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a804cef7-0803-4360-312e-08d945ca1bb2
X-MS-TrafficTypeDiagnostic: VI1PR04MB5471:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB54714FA10E538F6BD5D2FE32B3149@VI1PR04MB5471.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hrejV5Ac8wL2EQ5JY87WGOVj3CzOGFDevDFtqhE81bx4qVqX2JwMpdxydKma91bXHK4HiZ2lbqktxedVaNcfbO60b7eG87KI8MQmH8UH2W4rx+xFwj3GqNAqYPIaVbE4aRU3Qra9HksJtxFE9R5DbDzwQnyuw7KCWVlAZyEDWYBwOiucZZGCvlmjV2VGlqH9FhgVBrg0oVoBQe/Rl7MmYjhOQ6HPUoBvjmm4EOctlhuFrWZvN+NNh59XajRAhxDVV2HdRsVW0gteu59MDMLfHJEiybgYTG2x5aR7chekRvyOeNTWjKJhV1XrsuffFlhPea1CwslT3R8PZRE96d+xLdwhGGOuRaTn0miQrOnQnPGYFYqEsjgZA0hn7M2hLkz8HyZyn1nfiu/DKrcZGY1H5ynyNk6OjrvEWuk6qieUGqQRCgo/zrukP+4WJSCOZh2CdMrn1s4Jxl7CvwD+cw+TrOvtTo29UlpS6O7p2A6ii3Whd3IdlRN7RcY5ahS6NMDxHRCV4c8z8MBvGz+YdSZ0GHj//jt8yJPLv5fXJxRol2Whcs+sKY2hCE3DQIxBdOajIvhF89QcHFIp5ErQH7n5z20mlynu6rFRD1nQJE4ujPYwNYQ6CzGel+YvGkyoopYqOcIny1VDY8WPjpFK4MDCxydSypdaoqJ7mHKFBK4bVgoJMCV+/A73jzNPbz9QUwC/KltBvhTPr4SqAIBGRlXi8JcCdDaQNK7iPYf6XpCgF60=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(376002)(366004)(136003)(39860400002)(16576012)(8936002)(31686004)(2616005)(316002)(86362001)(38100700002)(5660300002)(31696002)(478600001)(26005)(53546011)(4326008)(6666004)(30864003)(36756003)(8676002)(186003)(66476007)(66556008)(2906002)(6486002)(110136005)(83380400001)(66946007)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUNycFpVdzF2anN0OURTMUVaTWVXVTdVS3JJL0tKc21pZncyMGlNajZrOXNT?=
 =?utf-8?B?UkNkSUpOWUlpOXdFc09SWjZhalA5UGtYNGQ0MExleE9zdHJ1MkxTRkRTNWJ0?=
 =?utf-8?B?akFhK1NoZDV5eFNjVlhnSE15SWNXWlU4ZmpOWkNlclJpcG01bUJBQ1BIMm93?=
 =?utf-8?B?bm5UcjVTblMvZWhUNnk0QXpFaCswNHJMMlFyTkttT0tpVG0wRmpVN0RMZzM3?=
 =?utf-8?B?TkJIeENGeWcyM1lOa1g4M3dTVXdrOVZwOXhZNDVBNVd3eWZ2VmdCRHk0VWY1?=
 =?utf-8?B?WnhxcjY1aWV1aHFwT2d2WnZnMlNwb09zRzFjcUtlNW1jbmNoZkxlMjFGbUdv?=
 =?utf-8?B?K1A1UGp0bnpONlVPTEFYYlh5d2IwRDl4NEZVaU1vakdvNnF2VGtHWHpMdlIz?=
 =?utf-8?B?RHUzMDg5ejNlQ3V3YURFODhMdkllTVB3U0NtWHBaTC9pVXhXQ0dIeVJkTkZk?=
 =?utf-8?B?cklCNkFCbEVIOFl5ajlzZ3NWSFd5REloangveHNaUllTOUpqN0t0TkJyS2tm?=
 =?utf-8?B?VkRXSHIxLzlmYWFuVC94ZWRRR2hNSnBkTWFmdVVJeVFJNzFBM2RHWTJvQ0lY?=
 =?utf-8?B?Z1VGbys1cjMzVnQzQ0UyOW5DUkZVcFZYUkNKUjV0b3A1ZlppVFpXdzZXRWUx?=
 =?utf-8?B?OUxiWm80bGhkQXEyVUhxTHNXMHpPd3ZxeU5Ed1gxYkN5N1VyUEwrOE1Wbk8r?=
 =?utf-8?B?SEp5Z1FiZDhsRlVJWkdBUVNQMFlqblAzaEcxNGtKeVJkbzBqNW8xeE9TRjNK?=
 =?utf-8?B?cHkvcjU1a1lXZU9FT3kvNEhDbWMwYVhRS1NJTjA2eEZpam9XbmZFWTFwUXdC?=
 =?utf-8?B?N1BCaDNlUUYxRnZZaytNL0hHOGxXUUUxQ2JXVGlFN3p2a3BRWlRnMTdWZm5Q?=
 =?utf-8?B?TXdMVkN5WVEvMktieFU5OXg4M2VBV0JnOHdtK1BDK3VDbzBDNloybWpyL0gy?=
 =?utf-8?B?ME92azZUZHh2RDJ3Q3BRSGJLemhMYnJEUkRHQ2xIZC9YanRaTkhjZ2dLUk5B?=
 =?utf-8?B?UWpNRC9tR2kwOVRXRWVpQ3V6NXZvVWlyWUt2NWlNRTlZTnZhWVpndTVocHJM?=
 =?utf-8?B?L2Jna1U4aTJ4VkRQVFZQQUdvUTZ1RENiaDREbWgzbTZWMGNTZWFZOEdQOXNL?=
 =?utf-8?B?bW44Ym9RZ01lUEt1eVhYd0QxaHN6VkFCSXRKeGNjRmJUMEVMQkNUWGlPM05S?=
 =?utf-8?B?QUxGdkN5TXFDbzk5SkllKzlNQkhMNFcvZ2RSNlJZU2lWYWhvMURKVjR2ejFY?=
 =?utf-8?B?NzMzU1R1aXE1RDZlVVZ4VjkvS3o4Z2IxaXdzbHZCM0Rrek1ZY3VhNEdLdHJk?=
 =?utf-8?B?OWFBY3kxMEY3ejg4TnUvV3dpTTJ6SUN0YklBNDBWdE1qbDlPNFRsYldmQmxI?=
 =?utf-8?B?cGU5MTNjSCtWNHVZSk94MSttbS83Vjh4QWNROXNNU1ptS0U4amh1cUJVMVFi?=
 =?utf-8?B?K1pXRkc2eVlqeWdDQmNMVThHaU5VUjVpSnJQNEVBSWNqUGk0WTQ2c2grK3dq?=
 =?utf-8?B?b0xnM01EZ0hJcithNm9COUY5MGtyZVplNjhYUjBDVUVpL0xEK0tRdlpXSDRG?=
 =?utf-8?B?SWpySkVsRUhHVjA0RkhaVnpKd1J5aUZwdjBBSzBrMjRHc1crTmdwbVVkV01o?=
 =?utf-8?B?eEJ4d3hLaEZHcTMra3lxUmxuNngzKzdRTDVyaXNDZmkyS0dPZUFMaDdRS2NB?=
 =?utf-8?B?eGhZWFRTVnRuTGZQVFF2YTN6bjJqSmxCcWExN2cxbFBwci9vSG1FUitQYXdJ?=
 =?utf-8?Q?G4OEpeaC4P7vAAFKLAf3J6h4n4vkZ8b+w02wz0H?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a804cef7-0803-4360-312e-08d945ca1bb2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 06:47:40.1788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9v618D4EYJnjhpcZkVijktLY7wMQW+V2UsGuG+Kcjf9B1dRlMMgSzoM7FcNI/LyCCNtmct1vtSszjmAIK0anQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5471

On 08.06.2021 14:35, Costin Lupu wrote:
> --- a/tools/libs/foreignmemory/private.h
> +++ b/tools/libs/foreignmemory/private.h
> @@ -1,6 +1,7 @@
>  #ifndef XENFOREIGNMEMORY_PRIVATE_H
>  #define XENFOREIGNMEMORY_PRIVATE_H
>  
> +#include <xenctrl.h>
>  #include <xentoollog.h>
>  
>  #include <xenforeignmemory.h>

At the risk of repeating what may have been discussed on irc already yesterday
(which I would not have seen), this is the cause for the present smoke test
failure:

In file included from /home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:39,
                 from /home/osstest/build.163627.build-amd64/xen/tools/include/xenctrl.h:36,
                 from private.h:4,
                 from minios.c:29:
/home/osstest/build.163627.build-amd64/xen/xen/include/public/memory.h:407:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
     XEN_GUEST_HANDLE_64(const_uint8) buffer;
     ^~~~~~~~~~~~~~~~~~~
In file included from /home/osstest/build.163627.build-amd64/xen/tools/include/xenctrl.h:36,
                 from private.h:4,
                 from minios.c:29:
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:101:34: error: field 'arch' has incomplete type
     struct xen_arch_domainconfig arch;
                                  ^~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:152:34: error: field 'arch_config' has incomplete type
     struct xen_arch_domainconfig arch_config;
                                  ^~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:182:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
     XEN_GUEST_HANDLE_64(xen_pfn_t) array;
     ^~~~~~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:263:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
     XEN_GUEST_HANDLE_64(uint8) dirty_bitmap;
     ^~~~~~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:280:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
     XEN_GUEST_HANDLE_64(vcpu_guest_context_t) ctxt; /* IN/OUT */
     ^~~~~~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:301:26: error: field 'nodemap' has incomplete type
     struct xenctl_bitmap nodemap;/* IN */
                          ^~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:337:26: error: field 'cpumap_hard' has incomplete type
     struct xenctl_bitmap cpumap_hard;
                          ^~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:338:26: error: field 'cpumap_soft' has incomplete type
     struct xenctl_bitmap cpumap_soft;
                          ^~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:418:13: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
             XEN_GUEST_HANDLE_64(xen_domctl_schedparam_vcpu_t) vcpus;
             ^~~~~~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:473:5: error: unknown type name 'int64_aligned_t'
     int64_aligned_t time_offset_seconds; /* applied to domain wallclock time */
     ^~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:480:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
     XEN_GUEST_HANDLE_64(uint8) buffer; /* IN/OUT: data, or call
     ^~~~~~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:533:13: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
             XEN_GUEST_HANDLE_64(char) path; /* path to the device tree node */
             ^~~~~~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:544:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
     XEN_GUEST_HANDLE_64(uint32)  sdev_array;   /* OUT */
     ^~~~~~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:685:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
     XEN_GUEST_HANDLE_64(xen_cpuid_leaf_t) cpuid_policy; /* IN/OUT */
     ^~~~~~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:735:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
     XEN_GUEST_HANDLE_64(uint8) buffer;  /* OUT: buffer to write record into */
     ^~~~~~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:909:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
     XEN_GUEST_HANDLE_64(uint64) buffer;
     ^~~~~~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:963:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
     XEN_GUEST_HANDLE_64(xen_domctl_vcpu_msr_t) msrs; /* IN/OUT */
     ^~~~~~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/domctl.h:984:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
     XEN_GUEST_HANDLE_64(uint) vdistance;
     ^~~~~~~~~~~~~~~~~~~
In file included from /home/osstest/build.163627.build-amd64/xen/tools/include/xenctrl.h:38,
                 from private.h:4,
                 from minios.c:29:
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:56:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
     XEN_GUEST_HANDLE_64(char) buffer;
     ^~~~~~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:73:26: error: field 'cpu_mask' has incomplete type
     struct xenctl_bitmap cpu_mask;
                          ^~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:155:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
     XEN_GUEST_HANDLE_64(xen_sysctl_perfc_desc_t) desc;
     ^~~~~~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:165:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
     XEN_GUEST_HANDLE_64(xen_domctl_getdomaininfo_t) buffer;
     ^~~~~~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:174:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
     XEN_GUEST_HANDLE_64(const_char) keys;
     ^~~~~~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:188:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
     XEN_GUEST_HANDLE_64(xen_sysctl_cpuinfo_t) info;
     ^~~~~~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:217:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
     XEN_GUEST_HANDLE_64(uint64) trans_pt;   /* Px transition table */
     ^~~~~~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:225:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
     XEN_GUEST_HANDLE_64(uint64) triggers;    /* Cx trigger counts */
     ^~~~~~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:317:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
     XEN_GUEST_HANDLE_64(uint32) affected_cpus;
     ^~~~~~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:474:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
     XEN_GUEST_HANDLE_64(xen_sysctl_lockprof_data_t) data;
     ^~~~~~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:504:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
     XEN_GUEST_HANDLE_64(xen_sysctl_cputopo_t) cputopo;
     ^~~~~~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:537:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
     XEN_GUEST_HANDLE_64(xen_sysctl_meminfo_t) meminfo;
     ^~~~~~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:563:26: error: field 'cpumap' has incomplete type
     struct xenctl_bitmap cpumap; /*     OUT: IF */
                          ^~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:665:13: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
             XEN_GUEST_HANDLE_64(xen_sysctl_arinc653_schedule_t) schedule;
             ^~~~~~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:707:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
     XEN_GUEST_HANDLE_64(char) buffer; /* OUT */
     ^~~~~~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:738:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
     XEN_GUEST_HANDLE_64(physdev_pci_device_t) devs;
     ^~~~~~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:814:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
     XEN_GUEST_HANDLE_64(uint32) features; /* OUT: */
     ^~~~~~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:887:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
     XEN_GUEST_HANDLE_64(char) name;         /* IN: pointer to name. */
     ^~~~~~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:912:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
     XEN_GUEST_HANDLE_64(uint8) payload;     /* IN, the ELF file. */
     ^~~~~~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:975:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
     XEN_GUEST_HANDLE_64(xen_livepatch_status_t) status;  /* OUT. Must have enough
     ^~~~~~~~~~~~~~~~~~~
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/sysctl.h:1059:5: error: expected specifier-qualifier-list before 'XEN_GUEST_HANDLE_64'
     XEN_GUEST_HANDLE_64(xen_cpuid_leaf_t) cpuid_policy; /* OUT */
     ^~~~~~~~~~~~~~~~~~~
In file included from /home/osstest/build.163627.build-amd64/xen/tools/include/xenctrl.h:55,
                 from private.h:4,
                 from minios.c:29:
/home/osstest/build.163627.build-amd64/xen/stubdom/include/xen/arch-x86/xen-mca.h:431:5: error: unknown type name 'xenctl_bitmap_t'
     xenctl_bitmap_t cpumap;
     ^~~~~~~~~~~~~~~
In file included from private.h:4,
                 from minios.c:29:
/home/osstest/build.163627.build-amd64/xen/tools/include/xenctrl.h:468:34: error: field 'arch_config' has incomplete type
     struct xen_arch_domainconfig arch_config;
                                  ^~~~~~~~~~~

Clearly xenctrl.h cannot be included freely right now; it expects other
header to have been included first. Question is whether that's what needs
fixing, or whether the new #include wants prefixing by whatever prereq
headers that are needed. Or whether, considering that libxenforeignmemory.so
doesn't depend on libxc.so, including xenctrl.h is inappropriate here in the
first place, meaning that the tool stack's PAGE_SIZE abstraction may want to
move to a separate header which is not tied to any particular library.

Jan


