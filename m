Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0912F42C1D4
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 15:56:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208518.364668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maejr-00025V-VX; Wed, 13 Oct 2021 13:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208518.364668; Wed, 13 Oct 2021 13:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maejr-00023i-SQ; Wed, 13 Oct 2021 13:56:11 +0000
Received: by outflank-mailman (input) for mailman id 208518;
 Wed, 13 Oct 2021 13:56:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1maejq-00023c-28
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 13:56:10 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4b39c73-850e-465b-a57a-820f93968d1e;
 Wed, 13 Oct 2021 13:56:08 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2054.outbound.protection.outlook.com [104.47.1.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-a5gHvHENMTWfTT_a33Db5Q-1; Wed, 13 Oct 2021 15:56:06 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Wed, 13 Oct
 2021 13:56:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Wed, 13 Oct 2021
 13:56:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0090.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.14 via Frontend Transport; Wed, 13 Oct 2021 13:56:02 +0000
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
X-Inumbo-ID: c4b39c73-850e-465b-a57a-820f93968d1e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634133367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yoXwDMfAOlFdy+y2EbMVV9zGinpkXLN3E04ealKOO20=;
	b=Alw2oIldSVe2XJkc/lHUxLeZhHCR0C/bfkQ6BHO/fv9btRY06rLRh9kY2ROQlPsdRb5eu+
	vhzMyyqxOlONWXngSkXMEJ+4cmqAhyxQx5PJcZ+fyFfl7LonpyDYRaVBjUSo7JgupjgkvR
	KOL42UnNwjXgmicrvWssNrxXHuUmyR4=
X-MC-Unique: a5gHvHENMTWfTT_a33Db5Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0j/36qbgZe2OiwSj7T3bMX6UdTh/UeJ9nUPWld1svkww+7bD5/9yju8MAyF8KIo4OQtzH7ahrwk0NBc3/ZnL36LFeQnQQF73u2S/K7/FbYwY4rOFpEmrU5PiQlafagBi7BuZ2GMaa8DtxGH0jAsVtZBhVFE+l4xi0LgrrNphxIp4ehSE5hVK9ehuefhxVglwP/kH6cr5DIPfqJAK3dj1sPyY2/1hRIOwrxKhfozdg6p6mEMmVYWU/+9+zWcna0ILKKrb6dNvdNWI/UUkXMCteiseGZvmEOy1Lv9e/Mo12Uo2WVGWjTQW1XUR7dhIXYLH0QVFP5G13VF57P4xbl8iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yoXwDMfAOlFdy+y2EbMVV9zGinpkXLN3E04ealKOO20=;
 b=gI6IiRbeDeGjV0BiKpHoBuo1UZzpLY6C0s2DEW3uzGwmJQqRFBgsRvX1lfqc9/pXyQYFYNLQJ/t3z6+MlMHQwo8l4PA1cYmlxN2pkSOSCxxYt4R9QfYq7P0k63OemR66m4o2IFT46Q87J58lvesieP3AefHhx4XjO3MqlLiH+Oy5LSaLuemJsaa+VCwQYQX4YV8evqu7g91zEMD2WwimiW1gnK/HdFNe6ijjLLXgblVO2BuuxQXwk0vP26Erlm2sSSmskMBxEyp3kDvYGiUMX007jA5iEb3u/BrnTjjlOY9YtOyO7Wn1KBP4QYyg1aYvzacfXQtfALGgO9ovmdlypQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH V6 1/2] xen/arm: Introduce gpaddr_bits field to struct
 xen_domctl_getdomaininfo
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <9e6e1378-7ee3-b692-b57d-29b597160661@gmail.com>
 <1634073720-27901-1-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f9b8b55b-cfe4-2bfa-44db-e898800def72@suse.com>
Date: Wed, 13 Oct 2021 15:56:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <1634073720-27901-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0090.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee9f86a7-1080-41a7-be0a-08d98e5131e2
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7039884AFCD13085A67C13C7B3B79@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q2QgqOgLarFodQ7nKiG8Km/GLePtlfPa2+aa6xuiM6GBwD86rwOcAFGVOPf+7sLyYM6QCg18CNAgpTTBE2Eg/uFRgdCqRVT7N4hO9dPndD7EOhq+PMOD5YclcX1ruEOgvd7WkTUXRw2Eg/cXH2UmffLYjZh8ufVKctg8OtTUqUVCb/3/12VuRu9X+ZhkyEoEQ1hajnkbf7b0ZURAepMCcIRCKlPrvRFob5ew+fvsJQQh7CY9AsPLFI2/DF32/HVg85xPFa2Mk3rjKxmXk3mbHViVO4gPZGMhT+inHNRp/zTJFJdU5BBZ8y4OmLKwRoCWGeYM8zemQ784AVaP6WgnZ0mpOKjfF6YgJcZTYFfqaDCdUgxh40iBpQSny+yV7Ft2XTXqZpDVCyUvy7TujxFO1TrqMW8O9S5JgeIJcWMi8vg20hUJw2mJNTOprGDsgZjgxzmmUVWK1W5C49SGUrcZwETwy9ZTDWlBZDhTnAg2eDU1w7Cj4uDuMhKHAWubtUdH2eY3M4hvlwnP7twmvMy0pUqOKqiRYJWvrw07sJM33/UmgwbpZdtOdTU0in8Wa1yUEtzXQjGEj9FSUxQLZEVd0QMGqTp+4a1z4VF1jPjq3EtBkm2/CleKI5MNJ9bFbf85tT8zpQp/RWhbdXdrdm5xLjknvhYb9kkIeqznWk0UcL2u+eyakjfh8pOx+lZNhgbkoMmle0bCMnRMmsEHijlWFA5lIQkhnBXEJsupYEE8u6Mhmrl4NBiMxI6dek0KJZaK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(7416002)(8676002)(38100700002)(2906002)(956004)(6916009)(66476007)(508600001)(186003)(5660300002)(16576012)(54906003)(26005)(31686004)(316002)(6486002)(31696002)(36756003)(86362001)(83380400001)(4744005)(4326008)(66946007)(8936002)(53546011)(66556008)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFo1dWJCU0JpN3djc0VwRWh3SEdRTVJ3c0I4MHdNbHJJSW5IaFlFOU1uaDZJ?=
 =?utf-8?B?ME0vd0RKWHpnM2FyK2xiNDBka1VvQ1YrekRLN3NLWmZIZUZrTWp0aEttY2Z3?=
 =?utf-8?B?L0poYmJQTitlWklRZFdodDJhdENuNlBGNTRvYUlFVFhBTUsvSFZsWGFkRVRS?=
 =?utf-8?B?dUtXQndudTNqWnVYcFE0aG8yM216bm5tVDBMUVdqcU1seHprdmo2ZmpVSTZJ?=
 =?utf-8?B?ako2N3FDRFFjMWpxSTF2U3g4YUZOa1JvcG9XMisrbGNkazZVZUduZEZvYzhC?=
 =?utf-8?B?SXpaeklXRzN5Y09YZ2ZEQ0FQazVHbGk2WEZiSlJsbXdqOVZVWmRPZWxsRlJs?=
 =?utf-8?B?UGtQcFNJZlJDY1FqOHJDTmtsU1RIbUNjcnhmK1dtYXU2NlZJZU9JNDhtMHJT?=
 =?utf-8?B?WkhIcXR0YnhHdzBHVW82V2ZaKzVkVzVJWDkvbTNRcGQzSk5OK3ZSaUdqVk4v?=
 =?utf-8?B?dWl6RTRWR2RpNDVocmtvSHUyWDVRZW9JbWNpalE5SGs4L3lZYTJHQ09OamFh?=
 =?utf-8?B?WVdRMWw0WXBQOW5zSW82VHJNY250cXhQQW5WOW90QlpUaHptMURrV244Ym5u?=
 =?utf-8?B?VlpMalpDTE0rSFRvaC9JV21OQmZtZXBBYWdVMlI2anFoNFJaWnZabm55aXJs?=
 =?utf-8?B?MzBNT0NQcXRINGhORjhJZW1ZdC9sc3QyWC9JS0RnbFBoUmpwaWpKbmxDcU1Y?=
 =?utf-8?B?S3VaS2MwUEg3cHhJZ0t6TUN4Z3FDMXU5UzdzYlpUWFJWMU9RZWVVQVZEZEVG?=
 =?utf-8?B?UzQwMjNkWlk3NjZiZVFMcHlOTjhrN0xlbWNOQ1YzMXVubVYwY3NjL3F5Y3hh?=
 =?utf-8?B?M25BMjZYaGREaFhVcEZaVjNXeVRJazcvenN1djlPMXMxd1R0VENMaTU1dk5m?=
 =?utf-8?B?M3ZLR3JTYXMvRUQ2VDlpd1BVNFVKTVh6bU52QWJtOEV6UDNtai8vMW81ZmRa?=
 =?utf-8?B?Zm5BME02QUZ5aEMyL2tHbEFTWnNGdUtWQm1FbDJ0R0tkSlRjRlZCaWtBbzZC?=
 =?utf-8?B?WTZ0UXBodzVUZVhHWlFxV2VDTEU0MHB4V29KME1iQ2V6WU1RWndLaSsvN1gv?=
 =?utf-8?B?UWpkZWJNcTNnSnQ1Q2liRjZsTVNUbnZMNVBDR3h4SlBwREdFYXJseHBKdGQ2?=
 =?utf-8?B?VXlMT3lUbWJxUE10bWRRaTJTYTNkZDRjMncrOWZpcm9wNGthNHJ4OTV2anVN?=
 =?utf-8?B?SGtSa2JLY0Z4QmdSSVhSc2ZBdFVHeTVYY0tvSU9Bb1dIR2dteTNWVkhQdito?=
 =?utf-8?B?T0tmZ3ZhZnZrVHpzZVdsU0RubXZpbUo0dVhHWnFzMXZFTkJjY2RudnFhbjlj?=
 =?utf-8?B?ZXVycGRFYjUzVzh6dWxKclRENGVFY0VXKzlZRWY0djVjbGxITi9nU1lrcDkx?=
 =?utf-8?B?anB5TXhlOE01SkJhUFVqVmROa1dmcWRHamFZZ1Y5bjFzN00ybktLSjhON0Qx?=
 =?utf-8?B?RTFqRGZobmZjaGx0akxGd1FQb1BzZzNaOXpOZnBnbVNaemxvY2tZSWI4YW5a?=
 =?utf-8?B?eWxSQStqMkhnZm5HMTNXcFBteFRSSFdvVmh3dkJVczV1bEwyQzJIQzJmM3NY?=
 =?utf-8?B?emxma2dudHduTHFuWEhNc1FJR0ZMeFhUNG4xYmE4ZTEvNHNCUHljL2R5WWNt?=
 =?utf-8?B?OXpDVXlnOStwS2l2YmQ0WWhmZ3JJd0pMdkxHbTUvSTF4OUVUdWZjaVl0OUFw?=
 =?utf-8?B?VWE4Qkd1NmF0aVdVWXhVd2IvRzZaZStRUHVTaDMwN2pjSHhHV3A0UXRMbVpx?=
 =?utf-8?Q?x7kZuTQrzrxicYe+KFurrWfIEtk/HhS1p7PhQ7S?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee9f86a7-1080-41a7-be0a-08d98e5131e2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 13:56:03.1253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c7k+fhw7TONY6Xga2n2NiY5wpapJ8jK40BxE0k33a3uhge3X+Do17yygt19FiUWPlc0gBM3siop+VKpMUvdHWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039

On 12.10.2021 23:22, Oleksandr Tyshchenko wrote:
> @@ -95,7 +95,7 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
>  
>      info->cpu_time = cpu_time;
>  
> -    info->flags = (info->nr_online_vcpus ? flags : 0) |
> +    info->flags |= (info->nr_online_vcpus ? flags : 0) |
>          ((d->is_dying == DOMDYING_dead) ? XEN_DOMINF_dying     : 0) |
>          (d->is_shut_down                ? XEN_DOMINF_shutdown  : 0) |
>          (d->controller_pause_count > 0  ? XEN_DOMINF_paused    : 0) |

I don't think this is a useful change - you move from a simple write
to a read-modify-write operation. With this dropped again, hypervisor
parts:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

While this has meanwhile moved quite far from the original proposal,
I still wonder in how far Andrew may have remaining concerns. Did
you check with him, perhaps on irc? But of course catching his
attention may be difficult, so no (further) feedback by him should
probably not keep this from getting committed (if no other open
issues remain).

Jan


