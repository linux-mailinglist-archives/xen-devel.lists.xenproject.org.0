Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E79755D4E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 09:46:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564264.881696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIvc-0004VY-AA; Mon, 17 Jul 2023 07:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564264.881696; Mon, 17 Jul 2023 07:45:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIvc-0004Ti-7R; Mon, 17 Jul 2023 07:45:56 +0000
Received: by outflank-mailman (input) for mailman id 564264;
 Mon, 17 Jul 2023 07:45:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hD51=DD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLIvb-0004Tc-7z
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 07:45:55 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4f2a650-2475-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 09:45:53 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8243.eurprd04.prod.outlook.com (2603:10a6:20b:3b4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 07:45:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 07:45:50 +0000
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
X-Inumbo-ID: f4f2a650-2475-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CvuTfUk4DKdOh+h7IvxkUpJpB97lTpcthINeqqkzdmM+F/1jW7E4T0GTkOuJvtx8doKnaADKGJkHzlGtHn+81ar6PMD6Y02LTgMGkUGeJLoC+2Zx36H1W6YR9XmokVdJL//S9r8TD8o/U+WEBLVc9j+Ge0WINaH7H6LxOeOtzKh/tF+KOyls3HgaKmiXp8PYDz8xD37LKOxuGmzprMb4tnxSinTXXPNHf64AOg205DckUF0IaQNtq6nwWSL3u+hO3I+6mJbVYiqOVbQJQZdqhV29dCD7VxCcfYRL2EIfutBiu15weIoe9obtFwlM0nEi/+ItexPbT7kGHyFkYpL7kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6cuk3ajhPS/LryROGG+80i8dt4y3BDErmbpTVoHnbwM=;
 b=WiI0XJZ6oOB99KA1NZ68YYpfbO3kbdPgozxmHS7eL9no1G/tfuXp8St7oNW1ipHvFL4SAZtaZv9AIiDvWKXlk+nrCAksd36TxKbmt9xbtD1KJccN9vrFJPIEG331GuiX8S6VHyiEBnmp0uNM0c4Ojlz0ifv/jhktksMDYR1twZyZ8juWagpwuY3Z/RYzn2t51iQhyVl2qQF86yq1jFvPOQY+LIr/0w+Ezsk4eGtAN5b+QC/HiMfW3mz/yKGd5gADFrcwtKxr9kiMs73MUNy49UkuxsA8tVAZYccOc5XXf5QYf1JoB8IrVpDtFpJMO6sINLR5M0o9TGMZXbvOucy7tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6cuk3ajhPS/LryROGG+80i8dt4y3BDErmbpTVoHnbwM=;
 b=IM31/6CSAdmnVflSgpZogYLkiSiT+htJCtPLN5CKE/HGfJx45I13/NSjAUOkQn1jN5OkjmMQ0x69Cl3Lwud9yhxrlyrblJo1ht8I91ORhBiWKm++4/YZf7DukCytFPkN50/dRHnxFyJg/yscXO3VpIF48sEgdX2JlBFm1Ou5vGKj6qZpTI7ZzhLIqIDWEK4dr5+ff3+0F/c44n3sHoaIweFYHiu1tHaBJf1Ktu8S+clm2OplLXRwe08Y2ukQp49LfgeQGrrQzI2uomgIdcrGaa3cyRrgttxpDXFH7KktkCnYRnxQ7NhaWwPaPRCvSy7QaP4xMQrXhJYRs+Ni5/01Rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8a4c6ca5-db63-8677-043a-5919af157b21@suse.com>
Date: Mon, 17 Jul 2023 09:45:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v10 24/24] docs: add Arm FF-A mediator
Content-Language: en-US
To: Jens Wiklander <jens.wiklander@linaro.org>,
 Henry Wang <Henry.Wang@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand.Marquis@arm.com, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Marc Bonnici <marc.bonnici@arm.com>, Achin Gupta <achin.gupta@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
 <20230717072107.753304-25-jens.wiklander@linaro.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230717072107.753304-25-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8243:EE_
X-MS-Office365-Filtering-Correlation-Id: 90816d4a-70a4-4bb2-0d0d-08db8699d74c
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FkQm/GZixDLylf4Yxt3vPdJ7bnJQoGd315jcb2DqRNR40YTYvL7eGKmqm2v0iqJ0ai1WfsPU/MXtPQ397tA+bQC9iBHE/Xqw7gvNUpp8m5MNXK8hZMdU0pNB9dM0+fqQqfu5DYY5wF5o9GzkFjzEUf1wCRHylyhkMymb5ejTvxlmnkN1B6dNFoO7GXwGZNiwVL2ORMmoayuXySEkFJJccXlTR85pEoA9X0/uLAwnBg9YMc9NF8KcfOmD1ry07yPtWcTK/nRBgCXJygZ/2HS6cDxXYskxcqg/5+KtOAknXXY2MHtF0JxdKjAPqw0/KWKX4nWupgSN2a7lNocUeJiyJTu4uC9o43EVE/U2WIFyQqzQHcxMjBZmODXsUaga4hO8Le0spo6G3Xpj/+KIbCsUY67wbV3KXQ9rsZbE4YklQKw6HXCfRw8yJQmJbLaMBoL4NRahzSoB7HBED6lHw8p6qLnK67vc3istxQ7QpApaDtXzbuxPKAHyo1CqTIyCkGMNp0OUi4L1l3/uUd/C66lgYTWMa6GoYv0L/Mg9lIoYnfCCpAKiE9GyhkAx77l4ghnjSOJzAoHmM75yDHOdb14lMeo+Nd7+ua2l/pTf+DlsnBxayi8mypovOYZyRKbBx/oK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(376002)(396003)(136003)(39860400002)(451199021)(6486002)(478600001)(110136005)(54906003)(186003)(6506007)(53546011)(26005)(966005)(6512007)(2906002)(4744005)(316002)(41300700001)(66946007)(66556008)(66476007)(4326008)(5660300002)(7416002)(8936002)(8676002)(38100700002)(86362001)(31696002)(36756003)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3NtVjVKWWIwVlBzWWVEcTRsZ2pnZkRyRWVJdVIya29DNEFJVnpHTytiYlp6?=
 =?utf-8?B?TjR4bGZQSCtwT2VFM3F4OTl5U3h2UndOZFdVNjJrVnptd1prMEpFK0J2RFBB?=
 =?utf-8?B?Mm0zSUhCNkZza3c2NERQREc3RmpsTHVuK2tCSnY0cHZSZ0pjYm8xaDQ2UTNH?=
 =?utf-8?B?MzN2Y2NtbFdlK1c3aXAyNkxnbXMyeHkvc3dtVXFRaFFtSWJtRjN3REY2a0dm?=
 =?utf-8?B?L1FjamhwM3o1Z0VBWjFodnRzTFhqQTYrYVpNU21hUkFSSEdKci9oSnlEVGpk?=
 =?utf-8?B?cUYzSW5VK3NPZHNYeGYwL3kwMlNncy9zYlQ3YWZJQW01TlE3NzJGVDM0Z2Ra?=
 =?utf-8?B?VTBjakVzMjhpM2VCaTEyNGNONW9xbjg1NkoySFNVaWErS0ZXSWNpbXBFYVpJ?=
 =?utf-8?B?Z3JJVXZCWSt4T1FGaVFHQ09EWCtFWm9aMkVXOTVXSThXZHc5RUV0SWJEcnhV?=
 =?utf-8?B?QVhxbHNOOFJna2xnZmk0WTF2a2t0NmVHV0FveXBkRE0weTdxUzRwSlk1TU9a?=
 =?utf-8?B?WCtCYWcyb0hvNDNpMGgrb29KeW9vZWhVeUhRQjdTbFFNWkJDUnFZWi8vOU1j?=
 =?utf-8?B?RFBpckY4a2pISjNpZWdyQW40Wk9ZVUFTdklNWWV3WXZ4alNidVJqTVpHTldm?=
 =?utf-8?B?a0hmTzhjbW1ZWFpVTjhPZnV2ODREdXF1ay93OTZzQzJKbDIvTU9IVTVSaHYy?=
 =?utf-8?B?QS9jZm1LWUpkWGNINUdlNndxTHphV1hHbnEwc3FyMFJKN1k1TXVDanljbmFz?=
 =?utf-8?B?R1hlNFFYUGdGb3U1dFcyN3RrQ2FHRVRqQlE0eWYvYXFNUlpzK1lHc203azJT?=
 =?utf-8?B?cjB4WTJwcTN0aUcwTDVUcGF1ZUg3TE5WT2ZvR0hEUk1DL3VzTyt3TkMyb2hJ?=
 =?utf-8?B?aXFwWTVCWEYvamlvVlpiZVBHb0pSWXpyS1YxQWZxcjgzcmlDMTFGS2VMclFS?=
 =?utf-8?B?NG4yVTJBWmJoRnZjVWRGaVQrSkRLTENIQlVlMGpoRSt2OHpDSFkyYjdYRWY4?=
 =?utf-8?B?b2xhcmc3emtzUTlTczBsZk03ZmdXem5WQkpkdHdaSUZqSFlEclNydmlVUER0?=
 =?utf-8?B?UWI5R0FCdk9ZOHJ0WjgwelJNcWc1cHJDRlYzOThUMmRTdGRZdmJyTGVocXVD?=
 =?utf-8?B?ditPN3JENXcrekpBRytFZnpmK053bUY2MnJjNXJwbTNXWlJNQ3FqelQ5S0Vl?=
 =?utf-8?B?aDRiV3ZCd3BzMktPQnlxazFwUnVnY2t1WXFabzgzZWdWYnpyNUNlN1RFYlQr?=
 =?utf-8?B?MnFxSXM2RXhQQnNDYjh5eHNmL3lzampva0hZcDdQWUhncXFtM1p6RGRzT0Zj?=
 =?utf-8?B?WTZBRlBHTW5ISGtBek9DSTYxME1iaWluNENzNGxJTWZ0TkczZVd3dEJkdXZw?=
 =?utf-8?B?eTJwL3Qra1JxVHp5cVBGZEl3L2EzbFVWYTh5eHlrMnVxcys3dUh1cEhSM3JE?=
 =?utf-8?B?bnhIaUFjMVBSc0J2dHlnV3VKRUxxYTlERkRvWmdGdlRSL1VwUzBNMWcya0cv?=
 =?utf-8?B?Tk4zK2JHMjFMMWZOSWl0bkxhM0FQbzB2cmtkQUVCTjFoZFRkdHVvSnUrckIr?=
 =?utf-8?B?ZDllQ2p6TjhESHFqU29HSzI1UThvTmx1ZjRUWXExaHFLV01GWkZKa2FPU3Iz?=
 =?utf-8?B?OGYrK2gyVWo5RUI2ZU5Pa1JRS0hWMEZHdDl3TTM4T2pNc1ZlblhaRkZnM01P?=
 =?utf-8?B?TjlkZnVFeHlvQVVyNHAzUDlNVzIwMXlvTWtZVXhsN29LVlU2SGo1YzRjc21l?=
 =?utf-8?B?QTFvTDJBRVBjREwwMjg5Q3RKUU1VOXlWWlNwaXpXTndBMVdjOHdLRWZOdFlq?=
 =?utf-8?B?UTNGNURuV1ZxR3ZjTWwyS0hGbkxHMEx6dVpwV1BHTXltVy9NRENsSnRvNTV5?=
 =?utf-8?B?NnlzUE1ZcGxGbzNsKzRQSUxDeTdwbXQvN3V5Z3VnWms2c0R4dWx0M3kyVFBF?=
 =?utf-8?B?TlNDd0NZazNQY1ZndEJsanRBZ1pVcXpKemJZdXMwQi9MMStVeC9nL29yaTl4?=
 =?utf-8?B?a1Z6TmNJZWNUZEsxR1FMMm1xTGxLWitDbU1tWkl5eS9iODVERVdWbVBXSmRI?=
 =?utf-8?B?dk5KWERLYlR5Q1NhQWc5OFpxamNoS002cmdMMW9YYkJlUlRKamQ4Y3RUR1Ez?=
 =?utf-8?Q?5g68pstJmZ7kXWLHGdrrIMNlb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90816d4a-70a4-4bb2-0d0d-08db8699d74c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 07:45:50.5366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w3vaeJeU0r4OyzdwkEHM4sNyYYv9qwl8F7g7kDgS3q6RzZY+w9sTzZRJ56BekNe8W5YpqGLxWUWifMpc0sCskg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8243

On 17.07.2023 09:21, Jens Wiklander wrote:
> Describes a FF-A version 1.1 [1] mediator to communicate with a Secure
> Partition in secure world.
> 
> [1] https://developer.arm.com/documentation/den0077/latest
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> ---
>  SUPPORT.md               |  9 +++++++++
>  docs/man/xl.cfg.5.pod.in | 15 +++++++++++++++
>  2 files changed, 24 insertions(+)

Wouldn't this better also get a CHANGELOG.md entry?

Jan

