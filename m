Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B68E2398F4A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 17:53:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136178.252613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loTAW-0005vI-AU; Wed, 02 Jun 2021 15:52:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136178.252613; Wed, 02 Jun 2021 15:52:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loTAW-0005t8-7I; Wed, 02 Jun 2021 15:52:32 +0000
Received: by outflank-mailman (input) for mailman id 136178;
 Wed, 02 Jun 2021 15:52:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bHXv=K4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1loTAU-0005t2-H0
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 15:52:30 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df92dbd5-2a62-4361-88b6-ca44d9f47eed;
 Wed, 02 Jun 2021 15:52:29 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-khlrCXLfPYSrjX5TxgAJUA-1; Wed, 02 Jun 2021 17:52:27 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5167.eurprd04.prod.outlook.com (2603:10a6:803:5b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Wed, 2 Jun
 2021 15:52:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 15:52:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0044.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.20 via Frontend Transport; Wed, 2 Jun 2021 15:52:24 +0000
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
X-Inumbo-ID: df92dbd5-2a62-4361-88b6-ca44d9f47eed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1622649148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XAo43sTZN+czhhlSbiUM8uJcXERUVp7hKL+uOVdVHxI=;
	b=W2V5ifBo32o+2huR8+4aFQWh3UFl9IJcz4nMjtNkKk5rOmadOWc5B9rbiy2KCgDhKqBmM+
	UCruAgpM4AuW/e0mLJ6cSa7p2e3K2s/3qGk3XTch/2QPtUdABP5iKnfum4mehsImyrl0bw
	lnnj9xojuX7fIzKrUCrjrpSBWeq51fI=
X-MC-Unique: khlrCXLfPYSrjX5TxgAJUA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLu3KgsHamD94iDYemvEmGDmmLJ7BidLt2clbrOxgUFhu71adpjdKT18Uc/7CRnbPdsESi4BFaQXr0xzHfOyrlq6jrOQciOMnDmXSj9Fw/K0BEqBPGJQMkYpPv1VUgae1OVaVXEZ7om7frhI48MTRydpaVCAxyZSdgVihhmTD6oh0rjpRMuShM8yLDgWCFwWztnmQzsefdMXYouMnHMZD+ucipBl+QVthtYSUv56txWCxTNawQ/5gujPQ55jC2OrIOrilY44kyF5HPO1v7ZCGUp6ss/d12Gm6pKDqrFa4e3zZyLCPCnXVxtrRyA4fw9TU+dOMfDhALmVMr2/A4CZIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XAo43sTZN+czhhlSbiUM8uJcXERUVp7hKL+uOVdVHxI=;
 b=a1AmHsnqK1oYY8G9+6VZ4lByMJ/XpbQbHzEBkXpwU3m980GbtFK7vHXXERoa4cwTnHLRtmGeSZnhTur7GybGXxOn64y2PxHfwVM4kpuV+2BL4k/0Sdo3NPRQ+Vudi/iHng582uMAOQiBaUJ/EN0aC2KAoeASHG6xbG6ef0QRWvibTCI9RGbKO9eA+QETA2bPDFY0/P8uJxuXspoYd1JZetOKgvsUGMDJO9PPK0B6aBqszFxDT17I09RA3cfIesi3QuPkhZ1GPz3xprjq+JlC5106D5vjRlicdnEWzAFT90iR/lWXcd4kk6SLfe02IGWMLTs7Gvi+N/e02qjQhk/hVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v5 1/2] xen/char: Default HAS_NS16550 to y only for X86
 and ARM
To: Connor Davis <connojdavis@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1622645816.git.connojdavis@gmail.com>
 <2c24cadace47e51e9e3fce6614e0f5e83db6c3af.1622645816.git.connojdavis@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <161181af-3e92-d5db-9775-048a512499de@suse.com>
Date: Wed, 2 Jun 2021 17:52:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <2c24cadace47e51e9e3fce6614e0f5e83db6c3af.1622645816.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P193CA0044.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63af4686-3f80-4134-6e8e-08d925de6a5c
X-MS-TrafficTypeDiagnostic: VI1PR04MB5167:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5167B8E4D66F85C65F17DF97B33D9@VI1PR04MB5167.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+fqVF1+1di72Z7unYHG+h0UXRRyhL3zQOWjfuvY94XCFpvMdC9PgnAWQmgjjuk7Tci/ezX5Eo7LBmVEuMgzb6dSWK+oqgNGa1RiSpUrorjsgSDJszEDNhHkuhhFjdKaTQ3jHtbjH9GOVKzmojRWR9zJALnBcI10Pr5QBrFtjPgReLrOY9ul9NUjMCc28FV8fuAxCuiBcQSey+ZXVlYf0rKf6FOo3SG5Nj0FFtfnNT7Y1JapZemahb9YzEqouzukYZzz/JCLqUWiKjg+iM9mrJM3h+qwFdHIzH2ALAD8nvMoYtn3pZnE00tasTdMRcEENltze82n8fYQGQs0xJZBcI4mY1yKzxweLNLchx6XrSe5P7j6J8DXedor+MiLnMWQ2sWV2ivkxUiwhGdrUYlzRorsTYHsoaUxBMwcLEOYwxcvH7ojTk5zrNq2f4+a7u7496hWQzokzvPs6fs58E+A5MD3KNsod2qV4F2gPBcXzmm/8SbTBJBQLj395AU8E9XxeXCPa2jY9d4RHf77xjExvAxAWYbnpsVQG99yz84+TZZu5Vy5nCkf1cR0ubwhtfvFXts5B/xiF4vWmGskxzMrYrQI7avqMARwGYEaVnPQQZCv9rFxOOgRYGSgYzqwJovvflYAbaywagvGHgat8SfXBKyIFodZDwRoqHUeUKn4diit8O4cqDpylj8N+0j1pNRBz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(346002)(366004)(376002)(136003)(7416002)(26005)(6916009)(86362001)(36756003)(16526019)(316002)(53546011)(38100700002)(2906002)(4744005)(8676002)(8936002)(66946007)(66556008)(66476007)(5660300002)(4326008)(956004)(54906003)(31696002)(16576012)(478600001)(2616005)(31686004)(6486002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?dytRMEtvd21rUWtqdjhCYjZVclJ3bmt5djFFRUl6cmNKbzN0eWdtRldDdzRw?=
 =?utf-8?B?T1gvUkNWUXZDVjJSV0FRclI5dmlwcS9QWEJna2hlUUtmL29ubTdaU21jYmtR?=
 =?utf-8?B?MFozSHZRU1ROdjZ3Z3JIOEt4N3RoU1lXRXpVWDBpc3cxSWJTVWlIdVpxSmN6?=
 =?utf-8?B?eFNmLzhkZlBZVGxEZVNvazFXZk8ybU5pdm9TTlhGdEErL25wQ1p3OHd0RHJO?=
 =?utf-8?B?VUNXMEZTWktDbkUvSGUxZEhvanVqMm5oNE40cFlrWmU0elpTQThnNDNjZ1lS?=
 =?utf-8?B?cGFTUC9rUUJFRVV6VGNGYkQ4YVFTVEM3ZFNpU3k0dml3Z1J6V29HUXM1Rlo4?=
 =?utf-8?B?dVB4REFaOS82ZUJBQjFIbE9JWSs3N2V0a0l2OVRjNUtOc1prQkVWUCtGdWM1?=
 =?utf-8?B?d0NzclFxamtBUjlMNWoxTE9yK0s4SU5yamszanBJMFNKampjLzl4YnlUZnUr?=
 =?utf-8?B?cVNpNzA3ckxxSktadGR6cE56NGlUTVVOTE9TSVhuWHd3UjdhaGVudXlzRVBG?=
 =?utf-8?B?NjdiVzBxUU02WktoY2ZCZzdDV1ZkbG1CVmI4YVlQYTBVUmFGeUg1NU5qV3Zs?=
 =?utf-8?B?OWo4SVNPU3ZaQjk5KzkwNGR6SnZFd1c5VXpXZUdmWUdtWWdPK2NBeUxUaDJ3?=
 =?utf-8?B?R1MzZlN6Qi9tUnZKbWhDNDhyeG9LMWRzcFljVklobGhTQS80SG5zdWI2djVQ?=
 =?utf-8?B?SFlJQW9KVGJEMVBIQnk5MDE4Tkd4aUFKRGY1TFBPdnRZRzBiUkpIbFRlOVo3?=
 =?utf-8?B?QTBPOWFDalJlcWlORzVlL3ZlQjAwcmJwUFlPd3R2bVlKRS83NDNzNmN3WHBl?=
 =?utf-8?B?QXl2bWorSjVkSTFHNjlaNkFuQTF3TUlHWWhVQWpORTFvK2lYUmV1T3psSGNR?=
 =?utf-8?B?Tkt3YlF2cW5nN044MysyNzhrbkk3ZXREcnFJZSt0bFRsSGpxZlNUNmZPVCto?=
 =?utf-8?B?RWNuL0thS0daWmdWUzVaZXFtVHd6QktVbFk1bUpqS09BZmk5MVd5RXNaR1Y2?=
 =?utf-8?B?Wks5akV6NGdQNW5QQVYvcnhzZEpBeHRyTkYyOUpzVFdrNHBHY3dmSXJtSXNj?=
 =?utf-8?B?akpRdU9yNTJWczhIQjNQYTJZbjZhNzhZcFhESlJJWE9FcmhKNTh5aktSVEtv?=
 =?utf-8?B?WGxReVNmK1VrNlhhdGtBcGFKMWlJWEZvV29ZQ3AwdTY5azd0ZGFOT3ZpT3JE?=
 =?utf-8?B?OXdZUjg3dmJsTDU1M01RMXUzRCtaZnJDUHFJSW0zdTZpOExwUzBndTZYazVQ?=
 =?utf-8?B?WUNZOHFIeU11THZzWVhKRDc0OFlrMUhvZmd6YkVrNjlUdlhFNk96d29IbXdD?=
 =?utf-8?B?YStpVEprUXJ6TmtUUHRjV3FHZHY0YVFSRTJNdWxYaEhCNjZ0ZWtKOGFnY1E0?=
 =?utf-8?B?UC9ZVnd0MzAyaWJRdUpMK1pMRDhjOGRwekdwSjdLVEtTRkRudEVkejVVWk5X?=
 =?utf-8?B?UjZJUDNaTEhWclIyWmxwdkkzNW9DUnV6dC9hTC8xUVZQcVpnaGd1a08rbzlk?=
 =?utf-8?B?VEZ1R1dmNldoWWZVT3lYWWo3T0w2eWxudDgrUy9KZnIvYmdJOEtLYjBxTm8r?=
 =?utf-8?B?UHBYRGhwWVpEKzZtYW45OGJEZ1hxTTNYTzY4ZVNUM3VBRlhUaVB3Vk9UbXJu?=
 =?utf-8?B?TzUzbVFsSER1dmV1Q2FiR1Mxb2M4Nk9BQjVSb2RhbVdhKzZFaHp2Z2FHV3pB?=
 =?utf-8?B?d08vQVIrQUZ5WGd5SlFZS3pPMDM3WVZSbllZa2ZnYXpXSTROK1UwYzVCQ2tp?=
 =?utf-8?Q?H9loDxSvtVBdJ8Q86Kt50Kgzc4Jgy7AcRhuTrsP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63af4686-3f80-4134-6e8e-08d925de6a5c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 15:52:24.8544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QYnxwInMLe2rNq7gKgiT5qfYgnEqkEDm/AatDMFue6quGr3SJN60meZtKzAgfZW1f9lnCIQV1ZMWreA79JCk0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5167

On 02.06.2021 17:08, Connor Davis wrote:
> Defaulting to yes only for X86 and ARM reduces the requirements
> for a minimal build when porting new architectures.
> 
> Signed-off-by: Connor Davis <connojdavis@gmail.com>

Please can you accumulate tags you've already got into re-submissions,
so the status of patches is clear and committers will know what is
ready to go in without having to hunt down anything? In the case here
you've lost my A-b.

Jan


