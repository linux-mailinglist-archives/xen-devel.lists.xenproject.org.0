Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7634084F6
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 08:52:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185453.334116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPfos-0003V0-3g; Mon, 13 Sep 2021 06:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185453.334116; Mon, 13 Sep 2021 06:51:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPfos-0003TA-0F; Mon, 13 Sep 2021 06:51:58 +0000
Received: by outflank-mailman (input) for mailman id 185453;
 Mon, 13 Sep 2021 06:51:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mPfoq-0003T4-Nf
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 06:51:56 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64abff88-4f6c-42fb-b1ee-57cc7e05ede0;
 Mon, 13 Sep 2021 06:51:55 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2054.outbound.protection.outlook.com [104.47.1.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-ya_eWygEOBq1YmCrR1e6mQ-1; Mon, 13 Sep 2021 08:51:53 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3935.eurprd04.prod.outlook.com (2603:10a6:803:1f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Mon, 13 Sep
 2021 06:51:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 06:51:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0007.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.15 via Frontend Transport; Mon, 13 Sep 2021 06:51:52 +0000
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
X-Inumbo-ID: 64abff88-4f6c-42fb-b1ee-57cc7e05ede0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631515914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nx1X7nsgt9I6wHT41R9KWBdn2/EzJAwvqED5gqQadZc=;
	b=ULXedUjfExE0IHZIxCyji9T74dMHv2B7SwVqdmqHzsgCGVnqRUUpUR3eto05SZkhKayau7
	NtNBKLwh4P49wVKcRGiykw2pfMRUZ6UUxk+sTG76lVP3HANJQjTe1z99/r9YOfMCPzmaoN
	+BM8xbboWNmbquL7hFBmN6DhK4UrNCI=
X-MC-Unique: ya_eWygEOBq1YmCrR1e6mQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9KrF2Guv/MPVykmCSmq9LMLuic+47TqIu/OgxVe3lB8UoNaFTwfIUi+Xh3GLP6iNn6o7wG06qf+5/qBbOgVSOwelb3IxidL6VMW6MYXko6Muh+t4U3ZQ0U1h6vjEX6CYdEddMHPAzlTbJOb1TLjThJX7HBu6v8WhuAGInN200fi37OFpbDVpqpEMCbs14p9sxr5G40quC6EnYnvZQTZBsbflmCDtDyhj9G7oiTzk6hK9xdj78LGS5NowV/QpaMRJPftBU0uYx18+CEypk/Fxm81tLojSJUDs6O0I8iaKUJ86BbNWTxOfn5Co0bqV+Kxytf1B3aQpTPjV2QmgpxBmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=nx1X7nsgt9I6wHT41R9KWBdn2/EzJAwvqED5gqQadZc=;
 b=B/8kj1YL5oQ+mz7s13tplbF+YA9HN4lCYEAt/w/MbmlQz13FnpZSw2C8yKXo44wVDA6VSUDvrxlyRD6ZSAi9NLJ84lUulmxzHgv7C6KoCx0SsGA8ZY7b0Uqld4Z2K2ycOgn9UuGHE5gR7ADh+4a36bYQvdoo4SruLi/n0t2F5bY5h6AlR8FNqMhxMx3HCwkfbTKhUHpNT5Cy9J6sZaZ8kzBSaJE+kZ/pO05udLQF6rR3M86akgc4RCouldZZ/WWvc0Z9uiInFZ2M+XEqI371x0euzenIxRTAzbw6ZcKJGdEYXWMxNPGt38abtDEKNBYO7ROwrj0hez8DbFqqEY0p/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v6 05/10] xsm: apply coding style
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20210910201305.32526-1-dpsmith@apertussolutions.com>
 <20210910201305.32526-6-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a5279128-c088-a1ab-b634-e20ff7dcdfd6@suse.com>
Date: Mon, 13 Sep 2021 08:51:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210910201305.32526-6-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0007.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 511c15b5-26f9-4ebd-b4bd-08d97682f7fc
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3935:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3935218B4276B699B29F7B30B3D99@VI1PR0402MB3935.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zTOFObemz0prJ05U0g1SeY59R6z1j4DW4vwW1G0mYGn6UO9SXFs8gB8GsUUaSVs0Fj1VLUQg6F9cE6wzlbxWaUmvte5+BtYmUqUqt/WmK3mUKhUb8aBBdBUJYkiTY+x+vm7Hl+HnkQIbslZIJpMxJgYkTO/f6EJygI316B1gqkpBWtQSWzoiOGJ7MVXuK5sc1m2nHHm4x6R/VNKBqtyGkDcduxNKB1lmko824ZwY6x8d1rw1UUFbFTAGNCQkRz7g6SjTbRypaIE5rKCmmUAhpn2mD94lO8M+4zQKzmtlDc0vFVCZCIeIzme7NJxBoXcdYpPApQ7qiwKUTHsxXU0SI36gotV0UPY28p8JAnN6LmkncsUZQJMO+88qZEPBqQZGwAlBgv8f65HGrZ4CwWDf3sdSN0RpUdJAElhMW0hDau/Yb+MuKGYyIZ8vrcSEHJ3n6nl2/BZ6o3MvPZf/xDtMlzDgO+zXUwVQPYMg6EjMD3whkiwA49w98IqqldRyIrEgA55CxOVOCU2AV9UPH4PX9FDmdLSyhpeUXn6I0vYWOAmnM53p5Q6lgUsca772l6wRI/wkT7O283JjiP2Oyzq3qZN1WpxjM0KYLDzzXrjMJFkr/BG6VUwW5swLhdr5JdcL2YZtTlBtuRy5m/cdTxMNJpzu7bJLi9/W+Y7ZINHD/iQly1hxnyhSdqsx4fkHKJ+3lycDborTs+ynHmlbv5uu7a7lCQwIcXr0S1H/w5eKlNo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(366004)(396003)(346002)(376002)(8936002)(53546011)(4744005)(6486002)(478600001)(86362001)(8676002)(26005)(2906002)(186003)(36756003)(31696002)(316002)(31686004)(4326008)(66556008)(16576012)(83380400001)(956004)(38100700002)(66476007)(6916009)(5660300002)(66946007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzRWeGNLS01sSTJRdEZ4YkFBNlNqQ3Fqc0duWG1uc2xUc0tWQzU2U2VTNlNi?=
 =?utf-8?B?Q0hhMXEwV3prNHVDSjFnYW1RcCs2eWtKT2txdmR4eDdFSkpBeU5zcE1ObmQ2?=
 =?utf-8?B?M3EzYncwZ1l5MjJZMFdBT2pjWFdiMkMrdEJRRmN0VmxWeFdoemRUa01NM09s?=
 =?utf-8?B?a3IrUktnQngyeGxJOXo0S2RNVlA5clVSZGpqc2ppNlphVzdTd1lJOGk5Ukl4?=
 =?utf-8?B?eDdwN2lMMW4vTW42Ly9pUERVVHQ1UDNoR1RtSjFqN0dvcjk2M253aDVaZzkx?=
 =?utf-8?B?cTRtbWZyOUhQazliUXF3STdvRjZmZUhlNXE2MFRlNC9oaTlRODBYbnVqbEE1?=
 =?utf-8?B?b2IxZW1sblJyWXErSmZnZUtsci9VNFBDcmxVRGFpMHJoZ3hNdFF6aEs5MVFE?=
 =?utf-8?B?UzVBdkYrdWtRZVFaSDJsbnVURWd0SUIzVi9McEw3Z01GVXdzMDUvR21IMmFB?=
 =?utf-8?B?ZFZFZ1d1VmJQcVBZRmYwVnkzK3hSWElsb1hwaXZZTTg5NXNIM012NmQ3eFZ0?=
 =?utf-8?B?eXg3Ykh0UWdZOVk5dC9aR2VpN2dIVjQyR0trVmZYNkw2eE1HWGEyUmtPQzQv?=
 =?utf-8?B?bmNXV3RkVlhQcFdFTGpKRXhxaEpydmpUajZXUnFLZDJyT01jSUozZkJYUTgz?=
 =?utf-8?B?Q3VtU2NWNXExdGYxRm5KeitYTU5lV3BnbjhOQWhCVWU2SHVGb2lydDNLRUUz?=
 =?utf-8?B?WG5UczYwcGdaSnp0aEx6MGxvL0c5QzRkKy9naDBoWStvNzlJOTNzVml3MzFp?=
 =?utf-8?B?RS9UWmRObEJ1QTIvS216V3hjYytJR1NHa05laEtwYnByWDNEbVlNNXh1T1lr?=
 =?utf-8?B?aW44NUp5UlZ5OWVsUjdzbkJteklGWlJ4RTFRR2dIWHcrTFRkSmVyZHZmMVFD?=
 =?utf-8?B?K29oc21UeVhyNXZzMllrc21vZHYvVnpEWUpod2s2UFpBS1BzcTE5Zmc4VHhG?=
 =?utf-8?B?RmR4aXoramVPc3ZoMHgyZHdla2lFeEJqRHl6aWRwNUhOT2R6Tk1ZTXpFd3lG?=
 =?utf-8?B?Q1R2aDZaVGdVZFN6bTF1c2VCOG55NFNjbEszT0xIZUUySXRpQlpycytvR1Bj?=
 =?utf-8?B?d0MwdENmTnU5aU5QaGkvMDNNTlJKQ2pZV3J1QnFDZFVIUmdyZzZ1RllUOWlI?=
 =?utf-8?B?RytmejFFbS9xWE1PMUtzZW9XZi9JdlJ4ZDI4UDM1MGhQWlBKVWt1RzViWm0z?=
 =?utf-8?B?Q2ExaGR2YnBhOG5WbTVNa3NxSlFhZjRQVW5pVzVsWStBa0w3UGhSNFAvTit3?=
 =?utf-8?B?UG1kb2xyWjFQa3pOTEJyZEdDenowQWFmY2VmNWI5LzZ2L09xdVpHMm9FTjZa?=
 =?utf-8?B?TjNES2xrUkVmRUlreFZxazN3VGQzbTlXT2UrWUhoZklsZzdzSnhmSHJUdmVt?=
 =?utf-8?B?ZzQxN3pJb0lxMmFiSm1iK2dvWHlwQnZma0s2L2J0TzVsMDEwbmE0OVFhcUxu?=
 =?utf-8?B?bmVjOW1Tajl6OERBVDVXRWt0M1YyQWd1SkJ3NDd3VFRPc3o0NDF4YWdQRFpD?=
 =?utf-8?B?cTh0V0NvcWhScUdRVFc4Ry9VaWh4akJOYm9KeklSWHppTlVlMEdJWmVGTTlF?=
 =?utf-8?B?aXJhMGJmV1dBTjJscTlEYjJucnJOcU1FeERxTWNBVHR3QkZpUzRPSHd2dDNt?=
 =?utf-8?B?Q1FIeHE3TzZyanpVN1o1dG94a1pXbnE4V2xNZ1laMm9HZ2J6R3I5dys2L1gz?=
 =?utf-8?B?ZzFSemRwM2cyZEl1VUFFU0Q0VnBYeTd3dyt6VS96Vk9xWllxMjlJRjVDaE9K?=
 =?utf-8?Q?mNce9IaedtPtuGB0zVK4GYQu9fQ6SCvGOzUrlwQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 511c15b5-26f9-4ebd-b4bd-08d97682f7fc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 06:51:52.9324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7dBWdf/tT4MLkWd0KnBR4jY1NqTyljp0nGdGqX82pog5W7q58tA+V3NJ4l345ZGZf5Xoh3y0xn/ZOCzVck2fsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3935

On 10.09.2021 22:13, Daniel P. Smith wrote:
> Instead of intermixing coding style changes with code changes as they
> are come upon in this patch set, moving all coding style changes
> into a single commit. The focus of coding style changes here are,
> 
>  - move trailing comments to line above
>  - ensuring line length does not exceed 80 chars
>  - ensuring proper indentation for 80 char wrapping
>  - covert u32 type statements to  uint32_t
>  - remove space between closing and opening parens
>  - drop extern on function declarations
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


