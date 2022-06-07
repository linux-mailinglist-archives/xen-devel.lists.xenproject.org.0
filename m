Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE0453F7B9
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 09:58:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343007.568139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyU6Y-0005Fy-7w; Tue, 07 Jun 2022 07:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343007.568139; Tue, 07 Jun 2022 07:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyU6Y-0005DL-3g; Tue, 07 Jun 2022 07:58:22 +0000
Received: by outflank-mailman (input) for mailman id 343007;
 Tue, 07 Jun 2022 07:58:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nyU6W-0005DE-Ev
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 07:58:20 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9830e31b-e637-11ec-bd2c-47488cf2e6aa;
 Tue, 07 Jun 2022 09:58:19 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-4IfsE_cyMCOvfs8rHzQazg-1; Tue, 07 Jun 2022 09:58:15 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8008.eurprd04.prod.outlook.com (2603:10a6:20b:2a7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Tue, 7 Jun
 2022 07:58:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 07:58:13 +0000
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
X-Inumbo-ID: 9830e31b-e637-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654588699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hP7yVvo9zlakhizZ+biJ02m01sYJKs/TzFLtYZT6wO0=;
	b=UHPxMDgozc7ZJAJ2bokCzBzRWKoRQ3rG+l66dmB4TEqB3lGty1/AZiwzTWXxBGRQKfRKff
	aMjbBr58ZHOssYijKVx8E+kTc3yu7gPaISAepPjmI22vt/Mb6yxvgKx1ICJMm09ZlSNXLX
	Q+golWLKJ0tJHH2xbNwi/zUzsvf6W5E=
X-MC-Unique: 4IfsE_cyMCOvfs8rHzQazg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Efj7rFc6WExoH0YcStL7WLDd6E56KopzDTv+8ntv+GGM3BuJKHr7HQTPuygTP41O+pTskS3+Xs+jsAj5XnPxg0L879a/GBMN0Qj2rq96nhCGKkSWhrNjdR6wJpgypMNJ/PtsQRhKyDsx+D6e1cdrJua6kPs9LvUjk4pPGWePFy3KshJSy53/QRrm/9Ft0IxFICrM07mBOC/XbUkBf8V5fkoQRI9dwngOqs+sIVvBrpyyxGRSf9f2YTMDEe9UVGz5dHzjj5oOZOqQqTX5YWoA44jgz9BVYim2RtwnVGrU1NGXnZstFoNLQQSc1QsRhT6WKnz3A/SWmKv4sXd8HDWzLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hP7yVvo9zlakhizZ+biJ02m01sYJKs/TzFLtYZT6wO0=;
 b=T4SX2H2rbi+9odP3pmFGiup7/7DWoJDG4eje1ZMZ/as+NxQ4ywci94+IsKExBAlc5fp51Dp5VRW6ki1L5gDqFokrYqBKweowb3VLgcuKuytxepg01ZCc2BN99AEWExcU0Z8ac0QoSqneDlmvnmJaJXz5RkDX6iYxzC+2qsN0zFWggJ0+JqAfQCdiubtj0eHqJ65cgJwErrH44TXMfiZF571GhRtzJ70hs7U2WNzyb3YTPWtrCHt9m8Obgidjixg8ggiFbJZkukyTuyCg0Q0NgJqySzSEAfH/Zffq/jjC7hHDB3Ye0kdC0M794THCNo+dHByGXdhuMdZuceOoxp4lFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hP7yVvo9zlakhizZ+biJ02m01sYJKs/TzFLtYZT6wO0=;
 b=DkMtSeKGsBNKB/i1TLLLt/mws34MfaEHbbnt1in+VWmRUWnrNOS+M8J2KPBO9ZtQ4/UOGn0qIwxmfMLe1WgkBQIt1R+9+tEstJIWRxg3pW2szdTdmQjviD9hHpEkCvGAGgFzdzrAsd4R4bbx8wVqEO7rotsIawSw/mE+qKopqVZS2s4UnEdVRZ4F0k+LY2yfNu+cMIeIWTPaWVCBkEbWREById8/vMMlWrq/C8+HKCMzZDhjrbgEfKJn10Ezm8YXJoghLrt3Sg/QVvc6U6hguhrWAVkB1hQxXhFRDrA34LGpoE96uei5dG5ld0d3vAirZEDWTx/ZXyUheHa+8/PP0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c0dd7fcf-28b5-d206-701c-8c3e62597eb6@suse.com>
Date: Tue, 7 Jun 2022 09:58:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 9/9] xen: retrieve reserved pages on populate_physmap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220607073031.722174-1-Penny.Zheng@arm.com>
 <20220607073031.722174-10-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220607073031.722174-10-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0101.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::42) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7b2f42d-9f58-49ae-7544-08da485b78bf
X-MS-TrafficTypeDiagnostic: AS8PR04MB8008:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB8008ED9F12485C8A7B0D2E29B3A59@AS8PR04MB8008.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T6PQ+3jwjDgA8moLz5CJE4q0DXHE96ESgx3ZL+U+TCb5x19ailyFtiT1UBvYuqRzO5brb+mAg678N0HX3inhgOskixoRM4z7Pb834v5tVQzzN/rTZ1Z2A8OEmX/qkAyWJUWC5jQ2aLiI5yFxhV2a4UoBKxqv6+LWsxc6bdwIhKlpxeQwfQ6pq8hda2eTPZ9jfqH/rsef+rTdrznKl+ISLiFAZcIEjbR7UFUdyA3DCG63FEM+xby9pZ7XglEqGBaWWZpil4BHY6eti5BpxWRau014ZKw1I1qzUd56+3cMDRr3lhwdHvySf0r8uCa2qeFqfeTUajV7uB2ffDbEqxT3uKFGuooiuGDULfHwoTRXyZ90XWbTLyDJ652MVfln+8fq5QNEnwdMAAb1iMg06r6Dk9jVXlaHi8ahWK0jKpEPAGwicAEY1NU1Dwc+KFx+xCBhLdkcOWesEyzWP/b4aaLKAvH7QWnXcWMunV6or7O4zCvbLYl10PMBPMHFo0uzk7IYyYCBvafjDvMvQt5J+FB/okhEbHrVuZptDvgy4m2TQgJM3FGnakE1g4+0weZ2Z1sU6jw5tA6ZQ/YgIUQt1JjYjBt71K7+WZj4zrHNlYn/BfNYsgSV0GoFngK7Zk9C8hdTNq/SZN4167C655ZuNCXitoSLFuBp+DLndG36ltLVHSJ8KKx+X3OASj1q2P7gRu2LF0Ie00ikEB1jNZEsnWxdDFbZ8C+aX8ioDLGNMLA+jB4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(4326008)(38100700002)(66556008)(66946007)(31686004)(36756003)(66476007)(54906003)(8676002)(5660300002)(508600001)(2906002)(4744005)(26005)(186003)(2616005)(6486002)(8936002)(316002)(53546011)(6506007)(83380400001)(6512007)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFpvalZWUktpUUVHR2kvdElCcVdqZ2M1MUZLMGw0M1JsMkFBdjhGMmNyZ0hJ?=
 =?utf-8?B?Z1VUNlFXYTdLbzNrYWZDaW92clhYQ2NlbnVhYVBjQ2ZsMldXelV3S2VYSlky?=
 =?utf-8?B?WjRHaFlFK0R3VEZyQkxGMzE2N1FwVEpmSXAzRDFyNVBOQVhiVHZ3dHlWSGdq?=
 =?utf-8?B?QTV0Mi9XVHQ5Z2lQb0JsTFV5OTdYUTA2Zm5JRXBlUEJEUjhTMzJFZmNsRjhr?=
 =?utf-8?B?TjJJalJDZ1AxWTlPVWN5Z1JLekFKL3FQNmZlWm9SLzQ0WXdMYnh0dG1weldS?=
 =?utf-8?B?UEdkdThERWU0bVYrWG5kRnAxbWwvVkgzbVpwcDJndzZrblFXeFhTRjFkSmpQ?=
 =?utf-8?B?RW1wSXlWeitPWWdTQUNVTko2bzlFZFUzd3pXcWxzMlVQbGp6S3kweEhUMzBX?=
 =?utf-8?B?L3o3KzBtWXd2OE5IMUpVOHBjcHVzQUJtaEY4R2dadzU4MS9CYzhGWGw3aWxC?=
 =?utf-8?B?U1dhRSsxaUZrSXBtWW54djdBeEI5bVUrZHdzTk4vL0hBWW9hMi9KeVh6ZW9o?=
 =?utf-8?B?YXQ2Ykk5RkdNZ3IyRFFpUUMvcWc3dFRoYnFwenY2ak9ieExWMDVoRHFjb1cr?=
 =?utf-8?B?RWVraW5WWk1NQitwa0RWRU05dWF5c2lJL3dtaWNmV1RwaXM2YXpFeE8yY2lF?=
 =?utf-8?B?cThZdUd6MjlIM241TkFEa2VpZUVzeHVNSlBpczhGaEpEYkJMZU51U2JTcWZ2?=
 =?utf-8?B?TWRmdzZIOTVwdWNRWEJSZ050cXRBZmdmOE84RHo4ODMvMHRYdTFLSVhEbVFG?=
 =?utf-8?B?U3pYclhkS1lKUHh6MjFRRnc5R0pzbGdvUHBBSEl2SU5PaVJuYUJHYkxsRTZF?=
 =?utf-8?B?MFpXdUFkM2dGSW1zZGYrZFdYZTN3ZG5SMDdqZ1kxeGZYV0RWVXNxeWxMdUlC?=
 =?utf-8?B?bXJzaHhMWCt3NnczTktBT0lJOE5HaXVvQVc5eXBqREx4SjFaaHVZd2NvbzRY?=
 =?utf-8?B?NjdBQmM3Y0ZFM29IamdkblZ2Tit6eWdScE5FaDFVYkRGM3hoQ0lWYTRkWVUy?=
 =?utf-8?B?M0x4dDAxYnUzSFRoL0h0bUQ0Vmg4L3lsaGVLS2lIamUrUnhNVXNoSThiUW1W?=
 =?utf-8?B?ekpMQ1pJbWdtUEpqQmlacmpXanB1RnU1MWlNQlkwdCtKcURGdldoSlh2SWZI?=
 =?utf-8?B?MFh0TVZabWgvc2dwdXBzcGY5dDJmdTM0bkxDditPbjhVOU1zOGE0RVgySWMx?=
 =?utf-8?B?WHQwVUg3dmloUy94VG0wQ0p0RmR5MUd6MlhmWm5mTHlHZGpQTUpwOFhmZVhq?=
 =?utf-8?B?Tm5LNHp3VHlKQVJkenpwamh1b2k0NDJkK0FYdzN1UWpNK1RiMW1kRGI1RWRv?=
 =?utf-8?B?U1dmRk14V29rUmQ0WnlteFlheUFBNHk1cm9Ca3VqditBS1BEVytwOFBIS3Zv?=
 =?utf-8?B?d1lEU0txM3NrTkJ1U0FCdVlxS2xVQ0ZqOEt4b09pSzlaYU5xUWEyMkRXVDB1?=
 =?utf-8?B?NGRZZ1JSaER3SGtxcGxkbFdjdFhMUGIvRkRyMEJzbjZUUUUrakJSaHBMYUZK?=
 =?utf-8?B?OTdrNjVweHVWTHhTd3F2aE0rQjNRRTVkRXVKK0RCOXVmc01ybHdDbXdkc2hH?=
 =?utf-8?B?bmJPZEliMmVPdUNMTEs4cXlRYVc0REYzNXhqVTlNejM1bzRQNVNWdlFJOWZs?=
 =?utf-8?B?MDEzUlIrdlFhOWtpZDd4U2VUVmpaOHRVajF2akNneWZibGFVL1JlSGFlbEdQ?=
 =?utf-8?B?RmR2YXZJZHBtbE1McVVDc1Jtbk53VGdyZGozeExTdGw5K0c4bVRKcEtVdER6?=
 =?utf-8?B?Z2RxN2REQnIrOTM0ZndNZ0JiSVJjWjgvT3g4VHR3N1FDdk15ZUpsZ1k4UFNk?=
 =?utf-8?B?NzdKQjY5dVdNK0lKMklQT0lVQVVkYWp5bHZzcTFxK3F3RXp1Nk1ySk8vR3lP?=
 =?utf-8?B?SGpKRys5K2hQMWNLd3I0RWw1dTlRa3RYS0lvUlk0M05mT0xRbmk0YjFaWnRM?=
 =?utf-8?B?Nkw1ZkNNYmVxWlJNWEdsSUNnT3lwaHNZcGVDZDZHeFhWYjRKU3VjZGhXTVhW?=
 =?utf-8?B?U25yL09MNDNuVGcvQW9hOGJxdnhHNnZrVEZhRXNUWnFNZnNOamlVRmRUakND?=
 =?utf-8?B?R09VM2ZmVnIwVldYYnNZWjlCNHhReVpMR2dLQ09mSk90eWlRNEkxUkhYQkZT?=
 =?utf-8?B?VE1OWTVCWlhhekdlWUdDSXB5bXJTa3h0RE5lQmlnZnlKNE52dnVtQ0ZlVEpY?=
 =?utf-8?B?eGNnMmY5QXJ5TmU1dmFCUDN5MnZKV0JIcnZFd2NwNCtDYkd3YTFjSFUyR2xw?=
 =?utf-8?B?T2tlTzFYbElhUFhrK1g1dzFRbmhrWWEzSGV2Qkh0RnFwTnVZMnRKUjdUMDhG?=
 =?utf-8?B?SnF4NHdlRUhNb2RLWDczVnRJRTRsN0dLNHcyWlNQaTlYd2Y4RUhjZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b2f42d-9f58-49ae-7544-08da485b78bf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 07:58:13.2633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3mPk0sZIszKxVC+eGs/c4lRlkCtSIBxmJYK3+pSFWmvHte4/rSJs4Kkaowv5EJhEHGDqoiJG5x4WS3oajzUWjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8008

On 07.06.2022 09:30, Penny Zheng wrote:
> +/*
> + * Acquire a page from reserved page list(resv_page_list), when populating
> + * memory for static domain on runtime.
> + */
> +mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags)
> +{
> +    struct page_info *page;
> +
> +    spin_lock(&d->page_alloc_lock);
> +    /* Acquire a page from reserved page list(resv_page_list). */
> +    page = page_list_remove_head(&d->resv_page_list);
> +    spin_unlock(&d->page_alloc_lock);

With page removal done under lock, ...

> +    if ( unlikely(!page) )
> +        return INVALID_MFN;
> +
> +    if ( !prepare_staticmem_pages(page, 1, memflags) )
> +        goto fail;
> +
> +    if ( assign_domstatic_pages(d, page, 1, memflags) )
> +        goto fail;
> +
> +    return page_to_mfn(page);
> +
> + fail:
> +    page_list_add_tail(page, &d->resv_page_list);
> +    return INVALID_MFN;

... doesn't re-adding the page to the list also need to be done
with the lock held?

Jan


