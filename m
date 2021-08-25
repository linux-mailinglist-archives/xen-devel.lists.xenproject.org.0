Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4753F7954
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 17:45:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172510.314787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIv4l-00046r-6e; Wed, 25 Aug 2021 15:44:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172510.314787; Wed, 25 Aug 2021 15:44:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIv4l-000448-3X; Wed, 25 Aug 2021 15:44:27 +0000
Received: by outflank-mailman (input) for mailman id 172510;
 Wed, 25 Aug 2021 15:44:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5IQt=NQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIv4j-000442-H7
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 15:44:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51e4c4d8-05bb-11ec-a971-12813bfff9fa;
 Wed, 25 Aug 2021 15:44:24 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-YQhR5-5aOdaB_aTdpUgZoQ-1; Wed, 25 Aug 2021 17:44:21 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6175.eurprd04.prod.outlook.com (2603:10a6:803:fb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 25 Aug
 2021 15:44:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 15:44:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0501CA0046.eurprd05.prod.outlook.com (2603:10a6:200:68::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 15:44:19 +0000
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
X-Inumbo-ID: 51e4c4d8-05bb-11ec-a971-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629906263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=THhpKqPmKaaatPXjE//iDhSYKTHZjgw+fjAN+cCN9vU=;
	b=E+1fmak2Z9KLrwdx1SFDU4s5LWlL3Ud2stov8yi6g7VPnugL8rwh6LI+oW0GZPW0e5tQ4E
	XVpMdhKxZbo5F7qHcpbz3+ulYbclzrTLCFruiR5gya9EEn4sxlqYR+gbYFJYyif6xkMfLf
	+MKrxwT4oKlPO/KH24VOmVi1Z7KWx70=
X-MC-Unique: YQhR5-5aOdaB_aTdpUgZoQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZbVgaP2gMyes2X4AkbgkQ+ppoCBEJb5P93pT44aCx7bI91XH7Me639BBqAxSd3r9FLrnNAG8aNez3gcmLbs/sXv0hTwhsCGgRw03XVL6bKNJvjxt38RBIISdBiipTCiCWi1A0dPO3h8GVFkdaV4dhVLUmcMQiGM3OVSWCf+x7fRjXMwQRxYTacHwi4SiogwTaix8SCymw78SaXyujO9D+O7r1QvpA3w/smIZ8sa6llPAJa7ZHuFeP9Aa9/pXBR7YHXVvQh9q8FYWRpuc+oKKZ+stvFHd8hPhvCEBn4SvtLSR0/HOcOBVcz1c5WqzSoZOrSrnXtVWGmXy9/UW4Qty3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THhpKqPmKaaatPXjE//iDhSYKTHZjgw+fjAN+cCN9vU=;
 b=ioOwcV7eY3ruEvk0AEe49cG2ez4XuT35Zg73GhM3SxWZYr22mdBmp0vwNBQEMiDaYSp7W33cu5epLNtZYaW05TxZM7nskpy3IGM1r43KATQJrqmCyyTmkCjRoZ8LCWkV9xhhPGmEV/+q4TSSh3wPAHyJC2gNxTaWFwl57GgrNrJTFgT5zXDyX2YVPVpUGZmRSLeAliS1qP6TzXpUQYhE/tUNrMHWF75899Od9eWhvedbEZNDAbeBqPG0UPBLuf56vNrfbXtM2ov2Wzqpk6vkYHgRPbyWjs4yu0krlHUY0x7x6D9W1zB1jsV37wPYT7WRoHPnaqqiy3VUb4vWoQaGVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 6/7] xsm: drop generic event channel labeling exclusion
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210805140644.357-1-dpsmith@apertussolutions.com>
 <20210805140644.357-7-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dc2fbefb-93fb-4574-ef7b-23a9c9a248fe@suse.com>
Date: Wed, 25 Aug 2021 17:44:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210805140644.357-7-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0501CA0046.eurprd05.prod.outlook.com
 (2603:10a6:200:68::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab51e4a6-9917-42c4-6fb4-08d967df3454
X-MS-TrafficTypeDiagnostic: VI1PR04MB6175:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB61756A0D61D83138520EF6EDB3C69@VI1PR04MB6175.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nQBsC1s9sd5/svxbkKgjZ9eYx/rmSmoMYlERsJE8qJrLFb5Yj5ZiP+FhSGi7CuK355ipsETeBIvZxp+qrQnxBcOtECIG+qyDb58lKqQgP7nRzMkccsMu2X/LxBP7pNh3eV/AW2MOIIOGoTi3sy5NmoUZX3+2YxMplNZTwqhdG++jxi+QJWz6v3lleFyT+TjQnPHYj4OnKCQOZnexIr3ukZ8Y07G6ZJgV8XWu/RCbsX49jZ37zbiGIxkJLdq2Vq0+v48EAZvABmM008sdCB4mcwCqkBkJxJ7dzkbEPXn4vtr5s6n9OmZQHHHBMatXKWbtnlIeBfiP6FKTVdXpRqqAAKLS4ofn0ZZo99wPwpOV0huF+oeHwXFwSqJfeRPgg8NJS1UWHVkniC6YL8aXd4e8JTjcU2pPJ7Wzc/ltfJUYNUnNLRMH8Zkt2Gx0DGBV9lESP3YDlf7faUt40QlqwooLCkoRKo7qudc6svdzYDu8IKqJ8y8oCrHgBmVmsUu4JYFJR9J+ZeSXg6SM5jaX0HG+jF5i+Dzccwc2H8z9p4NMwC42T+IL3JS+3iFuG/ZotcOBr5QpVzZUXLMeuvN6T6zTO0HMPo/tix71T9t0j+qJplwlJ3Vq0WGRkHhdYQiSU8vim4o5c/QyOYUctKELa3hju72WAnAqhuXo0WladxecRaCtznmEj4q1i2Tm6mRKSPKBI/6FSPfCdeD4asjGxe2gZCwLigtQk609c34Of1t+8LlFBADPEPTur5l/U90dkuzs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(508600001)(5660300002)(83380400001)(4326008)(36756003)(8936002)(66556008)(6486002)(26005)(956004)(2906002)(66946007)(16576012)(86362001)(6916009)(186003)(316002)(54906003)(2616005)(53546011)(38100700002)(8676002)(31696002)(31686004)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkV1c2J1NFNMVkk3NGx1QzlOanRYSVNOeEhPeUtqaXFEcE45c3VvZlc0NTBL?=
 =?utf-8?B?dDcyaGdiNlZqWVYzQ0Fkc053VDFxWmVyZGpnUG1QRG5sK3lLTjBVQlh4R1N6?=
 =?utf-8?B?QTA3cGY2V0Jtak85Y2dwNFFFNm1xdlk1b0ZmVjg3WUE2LzJBTFdyc0RTamVu?=
 =?utf-8?B?UXVzZkhKVkFWMGRxd1dpOGlaaDFNeVQrVTRmbWtHSW1LamFvL0hVbWE5OUhp?=
 =?utf-8?B?VWk2K0JubWRNR0IzcFFxSUZBUnhBd0s0QmR3bzBmdldzdHZybmE0NGNaRnNY?=
 =?utf-8?B?Yi8rVGdFNXhQaFpaQWU2M0xIZ0Ntc2U4bDAyeGNPd0IzRXJrZkdkRVhzRVlq?=
 =?utf-8?B?VGV1dTlUU09xbEkzMmc3bW1XN2hzVGZVcUtCM2dIdlJLb1NLYTR3N09vbDlM?=
 =?utf-8?B?S2J1SlkzUDRZNElDKzlNL1pVUlZVTWcwWW1vWUFYNlBsWUorYWhDMXFYcEJt?=
 =?utf-8?B?OTVSeHdkeVBPQjJMVHdFQkpKTmhiaEh0YUo0cWt3cUd6WTkvdlhrWmIvV1Q1?=
 =?utf-8?B?eWhvcjJoZUtWRXYrQUJtbDdyNHZNemFBUUJKUGZMNVV5TitrT3NXQWxTeUE3?=
 =?utf-8?B?QmJDenRycHcrUmo3NlIvU3AzaW5mdWNlSkxhd1VQTmlkbkxSdW5ZaHlFbks3?=
 =?utf-8?B?b2hEM0JFMURYYys5elMyVXZ0UHNsMmdyc1huMXBLbWh4MUNmRHE3NVUyd3NR?=
 =?utf-8?B?cXA5STI2ZFpmUjZSam9TQlZnaklZN01YQ1V6OVBvN0F0T3dYTXhuVzROdFhJ?=
 =?utf-8?B?ck9iQnpXeGpkdlVKeTcrZHJ0Qm0xTXRTS1VnbnJBNHVoWEdhT05tcEtzWUlU?=
 =?utf-8?B?NHZxZ3NtaDFUSnd5dzI1Z2N5QjZjYTFZMnc4VENOTlJ6bzdCR0JLUGVEd0lJ?=
 =?utf-8?B?NjhTNVVsVkhCcjEyQUQ2R3JxVCs2QTc1dWJla0x4aGZKQmorVGx1ZE8zTER1?=
 =?utf-8?B?KzYvTjA1ci9OMWhNaUM1dDZBT29KeGN1ZW9oKzFmYzRsODA3Q2Z6WUI4L05F?=
 =?utf-8?B?T3VFd0dndVo4ZmtZemVTaFNJYXBLREEzbWF4S0RjM3VmMjM1UFE0TWlIMzVp?=
 =?utf-8?B?OUpnR3ZIcTNrbEdnc2huMlRqNlVNcEErMWdNQlNoRklPVkFZSDRnVklBQjg1?=
 =?utf-8?B?eXRWVmlOa216N1ZEbTZYcnJJcFE5TWdjRkw1REZ3aEVGVDBUYXUvN3QzT0ow?=
 =?utf-8?B?alA0WVNVWW5EM3AwQWtzeHB0eU5DdWxjaEE5QnpJYXJTZHAwM0lRT1hVYkcx?=
 =?utf-8?B?ZjVwWFpYcDVQNVVLL3FiOFVVQzNWR3oxZEFjMVEzYnpiTzhzVnY3bytid0Zs?=
 =?utf-8?B?azY4SURweXd0VGpIRS8yRFdqaUx6eStocFB5UXB2TWIxQ3lBRHM3QjlraFdU?=
 =?utf-8?B?YTlOR00zL0g0a0FvMHVPOVFzNVVoWHhXdS80Mmp2U05nYVRERmVyc3FvVk5G?=
 =?utf-8?B?b0k3SkdHMno2QzVYbVQ1TnhmS2piZDhRRTR0RE50K1lTREZkdGtIUklqbEFN?=
 =?utf-8?B?RUE3UDVwMmYrMU9VbUY3cFNBYUl3N25QMHZ5bFFVcVNPV3VxU3VBU2cvczU4?=
 =?utf-8?B?QzBRWDVJOG1rYnVqaEd0RC9UZnJJQlF1WC91OW9jUkFOWXh5ckp6dDRqT0VO?=
 =?utf-8?B?RzZDVUp6c1MzZ1dpK2tiU3hIMjMxMFFhMzlXNWo3VGZCSmRSdk9qMWpNVFJH?=
 =?utf-8?B?U0M5WGxiR2xyaW1LSnBuUlFQcTdrekNHN20zM0I3N3A0OFI1Mm1abnhreVkx?=
 =?utf-8?Q?VugLNLxnsxZ+sPenhtxpbrdSX1ShLdyPVuSyarx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab51e4a6-9917-42c4-6fb4-08d967df3454
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 15:44:20.3932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Uefdjeg9+NMAFrdVvfpwzn7l0Fshab2SkorN7lEEmKlQKDnkyfi/jwgEp8sxY+ouwn6sohb32DpQcM9fsnBUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6175

On 05.08.2021 16:06, Daniel P. Smith wrote:
> The internal define flag is not used by any XSM module, removing the #ifdef
> leaving the generic event channel labeling as always present.

With this description ...

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -120,15 +120,12 @@ struct evtchn
>      unsigned short notify_vcpu_id; /* VCPU for local delivery notification */
>      uint32_t fifo_lastq;           /* Data for identifying last queue. */
>  
> -#ifdef CONFIG_XSM
>      union {
> -#ifdef XSM_NEED_GENERIC_EVTCHN_SSID
>          /*
>           * If an XSM module needs more space for its event channel context,
>           * this pointer stores the necessary data for the security server.
>           */
>          void *generic;
> -#endif
>  #ifdef CONFIG_XSM_FLASK
>          /*
>           * Inlining the contents of the structure for FLASK avoids unneeded
> @@ -138,7 +135,6 @@ struct evtchn
>          uint32_t flask_sid;
>  #endif
>      } ssid;
> -#endif
>  } __attribute__((aligned(64)));

... I can see the inner #ifdef go away, but not the outer one. While
the (imo bogus) attribute means you don't alter the size of the
struct, I'm afraid that's not obvious at all without counting bits
and bytes, and hence this may also want saying explicitly in the
description.

Jan


