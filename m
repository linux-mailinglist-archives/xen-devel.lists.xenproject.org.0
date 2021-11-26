Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3010345EA2F
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 10:18:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232437.402977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqXMh-0006rP-7X; Fri, 26 Nov 2021 09:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232437.402977; Fri, 26 Nov 2021 09:17:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqXMh-0006pQ-3w; Fri, 26 Nov 2021 09:17:55 +0000
Received: by outflank-mailman (input) for mailman id 232437;
 Fri, 26 Nov 2021 09:17:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F3w5=QN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mqXMg-0006pK-0A
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 09:17:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbcfb4d1-4e99-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 10:17:53 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2050.outbound.protection.outlook.com [104.47.10.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-1DckpG9jOmakSd2zz2WAsg-1; Fri, 26 Nov 2021 10:17:51 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3118.eurprd04.prod.outlook.com (2603:10a6:802:a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 26 Nov
 2021 09:17:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 09:17:49 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9P194CA0004.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.23 via Frontend Transport; Fri, 26 Nov 2021 09:17:48 +0000
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
X-Inumbo-ID: bbcfb4d1-4e99-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637918272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oszTwVhiClHAKkG15YPzfXdQ55zZWzzemeeMNVhAdPo=;
	b=f3cLbnia48tcm2cJM8wcdomm9c8GFgCI0Tg6/AjT7BOz27pH3W6AM5p4kGAzNqYcG6dQfc
	MwbE7YEqV544exP5HjRKiXxvmK8qOijKzfBcWbhEL6yUD7uULgnqT8EqiiFSzpWtxShQAX
	6MQ3e3MMA6UWaXsWIPuxzOqvOm2TxZQ=
X-MC-Unique: 1DckpG9jOmakSd2zz2WAsg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUP7FaDW2yC/ShUw/JpHiP+mhKpkw5ZWFNfmRAIVJYk6ffV4VhoO1QSWPhxFy/8esc/mkawg9UmPKVlO0whLiRQaMrI3/B9c30RAuGn8szv0h2mNffjvh9mGFWB3YeEZ92DT/8TxPd2WJXWmATGoG6DU5UQHDs9h+wSQqsINttn4Imuw+a853qSFbS3i6y3SjLgNOWtm0Askz6Hzlrq/ht6hNZ9/FThIF5inzMZ88c/y7xc3hD7M8OjMNIbAmFs/UTHwcYSbE7fIzqpj2WZbbqKylmzYLttad40AM1Buvfll5E3zssw4l1FgglTAPMTvMcatfy+USqWZBigce0E3fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oszTwVhiClHAKkG15YPzfXdQ55zZWzzemeeMNVhAdPo=;
 b=PS6Q6IgMTLfSAfCRO8SsapfS1cZfdmlYcQ1wvbwmUrvvBcV1hQTI8SyQVRV2kQRE4ypifDxqzIzyJwGs1Gjb6z2yEEPPE95dg0IOpIGs/BxwosimkSkDsungAN8lKl/7eZoDDeMh0u735Xpzy6iOwuPOo0dYXEDiAxKgJOzVSjmHtS06LzsIsL5ZZEgnXzqQdSt/k9Zr0pmXA7WB8SWEAsDaNZJaiI2xeqAnD7jB1uXd42NeOMIoC4q0K786bGrF0wkFdY81t8JXzz1hLgt/p6G0nj9TBd7+QZ9H1PI0+Ona/MIvKO2F4Jc+YhH+34ciL06XdMavVWj0binBpCt82w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4afcdfb2-cdab-a019-7541-598917bc4592@suse.com>
Date: Fri, 26 Nov 2021 10:17:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] public: add RING_NR_UNCONSUMED_*() macros to ring.h
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 Manuel Bouyer <bouyer@antioche.eu.org>,
 Simon Kuenzer <simon.kuenzer@neclab.eu>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20211126065547.22644-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211126065547.22644-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P194CA0004.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8e5e61b-5521-41ce-7584-08d9b0bd9dd7
X-MS-TrafficTypeDiagnostic: VI1PR04MB3118:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3118EE318F2BF8790D6F0C8CB3639@VI1PR04MB3118.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NTult9mCMhEp2kVOwgUOSOjb/1coIvnLObOTgqSl2GH6l1K9NDQNQwc1DXYXGKzh8gP8mFmsLrqp3iPZBjBS7pyieXTKUM7LN/lOG+4mDKrGrSpX9VE4cNuAzII5zSpX0feINT0HCGrIl/qWWeDnsSbLCBkOa7oK39/iGwEqgJ1Kua2TxNqH/XthVcU454EjNYUmq8BZ/lvq9wU/9HHznYRWT0PbauzAEgEBvqmiJbA9qUIMaXtcb2xzeIfoZjD/+842r3uN1XhsKDcUGCokzBm8GQxP8fJ4ZlzyOCwdB6hKccyQO7giyJSjqZqhSeMX6jpuFYbEJ5L5QFybonO7pXbAJOg68TwbbAmZQw0g7twbhAT45jY4rGkB4eYyLMd525RJFjFGcGxDF7waJ9GcnBJaZw+MRijZ/QFjDuACS86EjyCsUHrJcMaaPKnmKInK7O0ddXtzqVD1WfIH286n7eX8PrVuPEXsHvznCuh25QsrSJ9df3/1Bv9P+YQ5+euJ6DnSkfYxhJUstIfemGB4iQ/dCb57I9qGG3X/jBmtOAjmEJgmX+rrP8h+diahlDcryKq95k40JuVb4JyvApvakKOVkdaZ9Mdp9tPqI0KJusNLpe3pCLjczg1QVScjmSBh8SLwL8t/hw8LwvdAilGX6LyXo239AjeFqqZFrF9QmLjXp4q0YpX6BvJwuRGrdp9d/mmsBx6qmQsy/ltvOjAKkczN8OKtngaZCPIZZPm8Yzr28hb3QLM4yvI0mafjuayQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(6486002)(956004)(54906003)(316002)(4326008)(66946007)(53546011)(26005)(8676002)(2616005)(31696002)(36756003)(37006003)(16576012)(6636002)(31686004)(6862004)(66556008)(186003)(83380400001)(66476007)(38100700002)(5660300002)(4744005)(2906002)(8936002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGljaGdacTlCeFNDUXcvZ29iQk9GY3JydUM5RVVYTGtERWNWTVV5aU5GZ1JR?=
 =?utf-8?B?N0wwR3BYTHo4LzRzbVRyREJLSGNRNXp0Y3pGRlAvc1lUMUVoSCsrSmlYVzVX?=
 =?utf-8?B?VXlqTmhlZmdrTTNaUWtMUExUOUlmd0dILzNtdy9vTFdYZ3lYRjFHR1RJUTlW?=
 =?utf-8?B?MG4xSTE4SDN1Qi9DSXdjckkyMEFXUG9RaVlva3BQZHlZOE5OM015N1FSU2dO?=
 =?utf-8?B?RVBqeVdOeUxjQ3BBaUN2SFo3NUdxVE1kMDRtQnQzdHdGVWE2bFIycS9qSkJl?=
 =?utf-8?B?dGpQUlp3eTJad2tTRms3Wm9NdGJZMEVabTdTOXZFVEtWTm9TL1FmanpSQ0E4?=
 =?utf-8?B?dEpqTElNTHU0RHVsbkVuVGw0SEhwMEQvOXlaTVVsODZBaWJpVm1EYWlLWFRH?=
 =?utf-8?B?V1dDdXhCd1R2MzBqTlVTbG16cVROQjZxdEhML3hnQy9tcUFqUnYvQk9JRGFJ?=
 =?utf-8?B?VXNPVUc5elBwZnF6Yk56Y2UwWEkrUE5mSEQrL3ZEazhKOUszWHhUZjh5cmtr?=
 =?utf-8?B?K0VHWW1jazl4NkF1VnNHZkxRbTJBODJwSHdpdmYwT1JYVUIvd2FOdHNtL3RU?=
 =?utf-8?B?SU0zaUc3TkFzbi9TVERVYjJ2bWN6TmhabjVUdE8yUGdMZm4vVFNiejFkSGRh?=
 =?utf-8?B?dWY3OXRIZ0hSamxQMnR6UkdFSEZ4cDVnTE1rZjZzenZjTjNXU1dab0s0dThP?=
 =?utf-8?B?TkRoa2oyS2IrUldhOENHdVRXSFI0R1JMUzFNbUgzTEI1RUgzUVNNVStCdkFC?=
 =?utf-8?B?Sjd3ZHg1RDBLbmgrU0djMHBJZWpmT0lDa0p3MjlxRnBvbGZydGZZQVN2aDlx?=
 =?utf-8?B?aHB1TDkrQU5LM0U4ZEYvaE5QQ1U0U0lRTlZ4T2xCMk0zVTVVbEdVWWxJQ1Zh?=
 =?utf-8?B?bmR6Q3M5clVHTU5sc1hyczFYVjAwZ3FyZXVGeWJSaFppSytJb3huUmtvYkty?=
 =?utf-8?B?VVY1SlBnS280WEhvRVRxU0VoQnVsdDIyRWZqbDZLTDBNcWp5WlM0WktQV2JE?=
 =?utf-8?B?SnJoVTl5OG8rWk1HWFY0MFk4aTZKSFhEZGo0SGprRXUweXNRV0pIMEs2cFI0?=
 =?utf-8?B?bWFvckRMaGNZTDBWSUlTeEpEUC94TmlSVFI5QmI3WUNWaHFGeHZTamZPUTQ4?=
 =?utf-8?B?SURpUXRVbDBXQnR0QmtGVXlMZHFVd20vdHFKRkxlTkRuVXFCUm1KWXJobVds?=
 =?utf-8?B?VjFIZnNZTEdzMXE4WkZPMEVGZzlKMkZwQXVVRmxkYmZMZTdORXFieCt4aWpn?=
 =?utf-8?B?RjNtT0pLN2JhTnBCZDZQSEdOWDJRbTdVMHh2b2ZrZHRMVEJTdUVnL3RoYkVX?=
 =?utf-8?B?VHNvckx5enB4WFV4RHZnY1VjN1QyYWE3Y3ZtdWNYeUpGU05qeTAvYjlSRTlS?=
 =?utf-8?B?SjR5SHo1eTU0TzIvYS9vbGxwNlprVlprVnh4K092NU1DZ0JJMk1RdnRDQVJo?=
 =?utf-8?B?TlByeU5wamJEQVBqZ1VLdHl2VWNBbUJ5WEd4eHNpTnVJYWF1UkUvVmlBTTVw?=
 =?utf-8?B?ZUM3dWxlU0VNRFFld3ErSjh2WTZoL1g0R0lXd1YvemJza3hqbG0rdHI1K3M2?=
 =?utf-8?B?aVBGSGROT3BkVzZ1WGJrWUdlOU9iLzBhVGJ6WWtyZUw4b2hheWxRWTM5Tjdp?=
 =?utf-8?B?Myt2Ty8wVzBKWS9CNktkdFdhYTlESitKc20wa2Q2Sm9xSkVlVU9oZUJ6ekVJ?=
 =?utf-8?B?aDRrVGhJUHV6MmlBaW1uUjlmNTcvL1F6SEY5NGNtNWxmaWZ0T1NSbzlJcTdC?=
 =?utf-8?B?SU9xY3pjbW1LU2dYUmpkZkgrSlJsdVQ5MjQyM240RkZIMk1qNlJ4ZSt6UHZt?=
 =?utf-8?B?a09UYWR5UnV3b0NjN1hpdnZZVHR0bWtMdjdzSU5wclB4TUNQamI4MVJ3UHBw?=
 =?utf-8?B?MnRHTkI1K25kZ3RhYXJCeHZWSWFhT1NudXEvTy9XL3JUa09NenpxMERkSlZT?=
 =?utf-8?B?dWJCWk9ObVJ5WG9VeDRiUDVzSzZ0WW9VaExpSURjenlSL1NwelVPbVNlYXIz?=
 =?utf-8?B?NE1kc0dpOWNjTjY1VFNvOGNNSmorYTNDNGYyeWVEMkMxVGU2eWRvMlVHYmxh?=
 =?utf-8?B?NkdoOTNicitxSVRvUnJZaEh0UkgxT0xsRWszZW5ibzN5OS8wRlNCeHNkSmlV?=
 =?utf-8?B?T0I4dHJLZmd2ZjZuNlREZmVDZHgrSTRjeG1mSzhXdzlsK3hJdWVhNkxOSWxP?=
 =?utf-8?Q?LBoBBIWcpk2TkxvYDMqoQh8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e5e61b-5521-41ce-7584-08d9b0bd9dd7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 09:17:49.5095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cHmTYzDKTpOjJC6n1CcmhfbEa3Tzarsvfj1lgat6m90bqJDyqOX/iVnkeeCqVA7SaSt39ZtH2qK7z7wOHLeW4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3118

On 26.11.2021 07:55, Juergen Gross wrote:
> Today RING_HAS_UNCONSUMED_*() macros are returning the number of
> unconsumed requests or responses instead of a boolean as the name of
> the macros would imply.
> 
> As this "feature" is already being used, rename the macros to
> RING_NR_UNCONSUMED_*() and define the RING_HAS_UNCONSUMED_*() macros
> by using the new RING_NR_UNCONSUMED_*() macros. In order to avoid
> future misuse let RING_HAS_UNCONSUMED_*() really return a boolean.

I don't think we can go this far; consumers of our headers may choose
to do so, but anyone taking the headers verbatim would be at risk of
getting screwed if they had any instance of abuse in their trees. IOW
I think the original-name macros ought to be direct aliases of the
new-name ones, and only in Linux'es clone you could then go further.

Jan


