Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3246F4908A0
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 13:24:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258156.444263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9R3O-00035s-Bt; Mon, 17 Jan 2022 12:24:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258156.444263; Mon, 17 Jan 2022 12:24:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9R3O-00033n-8g; Mon, 17 Jan 2022 12:24:06 +0000
Received: by outflank-mailman (input) for mailman id 258156;
 Mon, 17 Jan 2022 12:24:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZUQe=SB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9R3M-00033h-PZ
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 12:24:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b5f365a-7790-11ec-a115-11989b9578b4;
 Mon, 17 Jan 2022 13:24:03 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-9hE3o65ZNLyCjK6-mBSbDA-1; Mon, 17 Jan 2022 13:24:02 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB3975.eurprd04.prod.outlook.com (2603:10a6:209:40::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Mon, 17 Jan
 2022 12:23:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 12:23:59 +0000
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
X-Inumbo-ID: 5b5f365a-7790-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642422243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jNkvD2+GRaqZz9PTe/yp2vbKsCiHiJ53Qm9FoyYrtnE=;
	b=Y5ueyo5qSv47remcar7HgfMqQjnTsOP6QCSTf4K4HRZ016O/XC4P4W4P9CmerBUZxn5Gph
	V2UIhaI8paXdvcJYBwMtNKVi+cVsuqi65UTTB12kqmLPEpqjJ1pvznq48I51QILP053+xv
	/eZLauR0gEv62ABgzw0IMtDJp+dMRzo=
X-MC-Unique: 9hE3o65ZNLyCjK6-mBSbDA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0Rsji25YB6+ThZZViUubnQmgxauz1K5hRkoRCt5U27V1jOytSgkk5uIHFotCe96Y0G2Sq++oS39XACV9Qgdcj+C0x0Cckht+5gyVlqXHeUPEGhLwVETK+/gwNQDoj08LD/zfrhlTKmu8gtqjgnHDonfrnr94SyR1uSffOjKuLWDKAXxmY9ko6Tw/QH20xuc7s9m87szNLbX7byXLCAxC+Clbour9eN9UsnocjIsCV9FSdFTa393oqwTPg7THKgv3JwslgHb5z1Lk2Q2Oxmhwhx3fIQ7Ibt1eIyi9+tvO9LSB1F8ynU2ChGWyJZkl4NI20V2f3yB1xyq2EE2KFYc1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNkvD2+GRaqZz9PTe/yp2vbKsCiHiJ53Qm9FoyYrtnE=;
 b=O9pm5JuxKVp03QJFUsPeMkPaJ5acxHtyVpJG+85K4RR1YDWhoKEQy8VsoGVYLJfWm2ltuL6ERD5aA4YXtvRJ87WogXmtJSRPRwae9dQ1Uw7bHT1/hEIb4C6Faro71fbP5ziUrJaIBATUiDTrjn+gzHVNkhWHHhKjnc1dKeu0ebz3Z1/xmo+/ut6if+5wU+97+CA2cuqJ0FF6vztnqReSQa8DT3k2H0l2D5ZhEOSc+wzFQjUJR7SSIzhX9kc6dJTDuv5dlsCrqg3p4gstIuBAX/3XNQgh8cUjWz+tsl2mXJpgaywLTQILYZBq4lVUIayPfMQuKGz0wlJBY9+igjXWMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <12f7359e-6331-011a-9d98-af63d0b2b644@suse.com>
Date: Mon, 17 Jan 2022 13:23:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [XEN PATCH] tools/firmware/hvmloader/smbios.c: Add new SMBIOS
 tables (7,8,9,26,27,28)
Content-Language: en-US
To: Anton Belousov <blsvntn@outlook.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <AS8P193MB171873609ED0D3F997083C2DA3549@AS8P193MB1718.EURP193.PROD.OUTLOOK.COM>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8P193MB171873609ED0D3F997083C2DA3549@AS8P193MB1718.EURP193.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0056.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4f5782f-e0e4-46fe-5dd4-08d9d9b43d30
X-MS-TrafficTypeDiagnostic: AM6PR04MB3975:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB3975F68E121B663B2D0937ADB3579@AM6PR04MB3975.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qD8xbg5/2vRy/ndg9KVyQaDKulB14bWgC7s+EKiKtL5K3SJxx8Dp9tmgtcmXsYmuBYb9s5C+1oSEQjE/J1bRtFtQrdSNHNulhB/36SRUYhYLdrHev7HvqwMsKCdTqWrGR9wPDBpFisDIDkrhJvrjPRoSGn+wkzeCnmGt52U3aztGil+D3DWAd2vxT24XV2eqbYd9fb6BYPSB3iGcGPit9JD9dIwIqvJSqyGkNGfe8gIYNdsZHDYeMpGowsXzDQ/bRpBgUOYI6JchC7IXG/3iTxC8QOTN/GRuZV47/LZeM/iIuMwC9dgHXk/FIr3v5M1GMA5Q7Xw9qdSYGX9Cd28UEVNtYYaFS6rgBuLapnRAWbUsoJdGe21EkXG6YNcYuKzfHuLKHofNU1EbFbRxLwSX1DMpaoVD8Faj8j/r9x5oh0fcDFNyL/VaEeonwkkPWa2T2ubub48+RqRzTqbwCzgQrRpYyG2AnZYuIImnorDB9XjvNEbAb5aKWOtmlA/wyWYaWorW4CioGUDUcybbEJbwPK0fke9DjV254+GkNQYrNxSYN14Gq2JXLg4K+X5SxjSks80w/BhK3aQ5QQACw5em4K+UsroNxrIqeyzPlW6OY8BUNYNcLD+adIikAJ26q2255KTtkuU70buUiUqSkRPVaSJ7hBzNOwxIs8ixrLYMXd89RlLeTPj47B7bOqJNrPrHwV1BsU9fJka4a4f7UPhkk2fIETxdHP/ieVQJvr/y0JU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(26005)(6512007)(8676002)(2906002)(508600001)(53546011)(6506007)(186003)(45080400002)(66556008)(66946007)(8936002)(66476007)(5660300002)(54906003)(86362001)(36756003)(4326008)(83380400001)(66574015)(31696002)(316002)(6916009)(31686004)(38100700002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dk9EaUswOU1KTzNlaS9veWFYUWdndWRBMkd1bFdxNzZtWGpDalE1WUdKMWhF?=
 =?utf-8?B?dGxOL0h2Q3ZDUHlLK1YvbXVMNnUzT0hsU2hBcCtBQWFDUkZYZHBZU0Ywb1gx?=
 =?utf-8?B?SUtzZmZRY0xuZmVxVUkrMkFzRVdnVzBBemNpaTgxMDYrOWZpRVBHVk1DZHJC?=
 =?utf-8?B?M3Q1NUNhRGZ1VE1aQUNzM1d6QnA2QUh1T3ZMRFpHRUgzVzNUZDFrSDRDYTc3?=
 =?utf-8?B?am5KR0oyQUw0N24wY0EvQ3lOa0ZCeFdSWFc4bTVYYXNaQjBXUThVdVlyMmVQ?=
 =?utf-8?B?eEw4dys4b0p2SEFvWTZhL1ZZVDhXSHdqS2pCZTdPS1R1UlZpVU1DMy9xQkJW?=
 =?utf-8?B?MVVVQmdBZFVvb2c5SjRkcm9haHRSSUhTWlkrNkQ3dTFrZDZLWWh5WlFiV3U4?=
 =?utf-8?B?R2hEVGkxOGt3WEpCZ2FQNGJERGkyRW55Q0wzWTd5TDJLRGR2VE9sV1hKTUJz?=
 =?utf-8?B?VENxUDkzOGF0Tm9GcVRUbzZJSUZockdWakJiTkNKRk9MVkhPRUdKWGd0U0pW?=
 =?utf-8?B?Ui8zSTEyUFVEanpGRUMzMk1ZRWc0RnA0cW9nYjBoZ3FuamZveWFQZ05nMGxX?=
 =?utf-8?B?RFdlTXRDTmNFR1hMcWhNZU41N1hNenBNM21BR1p0VDc3bU5iWWRXOGYwLzBK?=
 =?utf-8?B?eXQydDJicmZ0Z0tPZ25vQnRJQy9XeW41NmdOamEvNXlHZVFUQXR2OWxkLzZS?=
 =?utf-8?B?NEVpbHJzYzZqdEFGdkdtTXdnK2dPQmFuc1g0NmlXMkZ3MHVQbzNxT1M0ZXFW?=
 =?utf-8?B?QUZPcU5nbmgvQnBhSVVVd2tROWxuNFllZE0rcXNudW93L0hDdkV0WkVDVTVI?=
 =?utf-8?B?cUVDVlRWU3Nta1o2WVdzMFZvR2t6YzdkVVFYNGdVQ1FWUTBTendGbXloeE0x?=
 =?utf-8?B?dWYrT3U0YnYyME0rMFFJRjdSdExSUWdkTjRldm5vdDNMS1NiUDZ0Q05NRGdh?=
 =?utf-8?B?Vm1uRU9Ma0t6UTM0NWpKMXFidldOcUl5eG14SGhBUW9BaDMyaldXL3V3UWlF?=
 =?utf-8?B?SEg0dlpJcU5YSXpCVTY4TUJjOE9YMGtzNGtMRk9CK0dUN2paRlpaK1d4S0ph?=
 =?utf-8?B?VEhtUGZwUGVqNW1tTHp0ZGl1THRLc3FCTXRzUVB1Z0RxK3IvbW5uVHEwS1ZM?=
 =?utf-8?B?UzBrOGg0a3NGSVVoMmNGNVltd3hqaEpWL1QzYktvVEF3SktTNkdrOVBxdWlM?=
 =?utf-8?B?NUxCQkVmcm0vSlBtWWtZRWozTkQxTjc3UzIya3NFazIycXdLTHF3OEdLbm9B?=
 =?utf-8?B?YzBKbXNQUEtUeEYwcHNJem5uK3FXVVhHVlpsdlczUGNPUWZPNkE4ZjBrVVgw?=
 =?utf-8?B?L3VQV3FSZG0ydzBNZERuYW1UQVBTQlQ4a244bi9HYXNRT3czQTZyaUtEZ0dR?=
 =?utf-8?B?TTlqcnR6ajdxM0NnelJ0M0pBK0ZyVnN6RURncW9VOTNEVjlWSjA5TjFYU1BM?=
 =?utf-8?B?aFN0ck93R0kwRlErbktwdE9IVlRoUGpIblJlWFhyNGtiaGR5eE1ac01wTytr?=
 =?utf-8?B?Zy9OUEFHNzZIYml0MDVjbDhaVzZKbk1qQ1lPcC9peVNyWDRGRmp0MnlubVVo?=
 =?utf-8?B?bWs5TWU5aVE4djhzdnh5eHJBaCs3RE5iazQ3NUVpOEpUdWQ2dTJPaVJVWlhN?=
 =?utf-8?B?bnRSZC9wVWlITFhBODJZN3pXejcwaWIvbENNYkFOZnkwSTljMnRhNmE0UG9Q?=
 =?utf-8?B?c05aczBwNjFObjUwa0VPTzlndjBGdXRPcVA5VkRzMG5XRnhTRDhFV0FaZ2lZ?=
 =?utf-8?B?dW01QXlmUG5mZ2dZd2NwM25NaVVId09iWTFiKzBnWFd1NkRNNXh1QzBWQ3B2?=
 =?utf-8?B?R1Jjelp5cjh1M3dvTHVYUzlwMWpKRzJvb2M5WHg3YnFNV0RlWDlJM1U3ai96?=
 =?utf-8?B?RzhVM1Frb1RXNGljT2VLZFpsZjBxUDFMeE43N21rZ1l5TWN5amtZMjRLbnZH?=
 =?utf-8?B?aUpZdUxZMTI1cGNSVy9aUC9nQ2xnbmo3NU5VT29zeVFPdjAzMUNNeENrdDNE?=
 =?utf-8?B?a0xDRUVGSUFGYTFlcHBNWGUxMFFmZm1saUErTnBQOFcvWXliZDhLZzU0Wnpp?=
 =?utf-8?B?WHE3VnoxY0l2RDF6eGxyMTFqcUhiODBrQU9vWkI5cFRDM3Y4aVQvVHBQS1ZX?=
 =?utf-8?B?L3piaWpKelZLZTMraXh4b1l2YlR0QTl5YmdSSkVnVFl0U3Q3VWNsZ1JEaHpM?=
 =?utf-8?Q?/sqJZQTVve5JSGqamOal7HY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4f5782f-e0e4-46fe-5dd4-08d9d9b43d30
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 12:23:59.4485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FpOFND0FbKVo1ApFeFIM9Q2SCCc5H81OfpFy7VAk8TQLPUFJLQTPg1j1H7aMupJ7MK8ZoCsEH439VUZdhGqvYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB3975

On 14.01.2022 09:52, Anton Belousov wrote:
> SMBIOS tables like 7,8,9,26,27,28 are neccessary to prevent sandbox detection by malware
> using WMI-queries.

This is a statement without any proof. It may seem obvious to you, but
could you please make us properly see the value of your addition as
well as allow justification towards the completeness of your changes
(i.e. that there aren't further types specifying of which may also
help)?

Furthermore, with the original intention of the machinery having been
to pass through host SMBIOS structures, you will also want to say a
word on the (intended) source of the data here. If it's again the host
table, then you will want to also discuss the security of doing so.

> New tables can be mapped to memory from binary file specified in
> "smbios_firmware" parameter of domain configuration. If particular table is absent
> in binary file, then it will not be mapped to memory. This method works for Windows
> domains as tables 7,8,9,26,27,28 are not critical for OS boot and runtime. Also if "smbios_firmware"
> parameter is not provided, these tables will be skipped in write_smbios_tables function.
> 
> Signed-off-by: Anton Belousov <blsvntn@outlook.com>
> ---
>  tools/firmware/hvmloader/smbios.c       | 146 ++++++++++++++++++++++++
>  tools/firmware/hvmloader/smbios_types.h |  77 +++++++++++++
>  2 files changed, 223 insertions(+)

Somewhere here please have a brief description of what has changed
between versions. Also please properly tag you patch with a version
(this one looks to be v2).

> @@ -700,6 +724,66 @@ smbios_type_4_init(
>      return start+1;
>  }
>  
> +/* Type 7 -- Cache Information */
> +static void *
> +smbios_type_7_init(void *start)
> +{
> +    struct smbios_type_7 *p = (struct smbios_type_7 *)start;

Please avoid introducing casts when none are necessary.

> +    void *pts;
> +    uint32_t length;
> +
> +    pts = get_smbios_pt_struct(7, &length);
> +    if ( (pts != NULL)&&(length > 0) )

In reply to v1 I did ask you to avoid copying existing style violations.
In the example here there are missing blanks on either side of &&.

I further wonder whether indeed any non-zero length is fine. IOW it may
be worthwhile to first harden the pre-existing cases a little before
further cloning them. Actually, seeing that the smbios_type_<N>_init()
functions are all largely identical, it may be worthwhile to introduce
a single function doing what is needed for all overridable types.

Jan


