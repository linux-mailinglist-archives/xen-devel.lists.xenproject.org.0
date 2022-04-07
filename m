Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C934F7BC4
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 11:35:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300576.512776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncOY6-0001TK-B0; Thu, 07 Apr 2022 09:35:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300576.512776; Thu, 07 Apr 2022 09:35:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncOY6-0001Qt-7u; Thu, 07 Apr 2022 09:35:30 +0000
Received: by outflank-mailman (input) for mailman id 300576;
 Thu, 07 Apr 2022 09:35:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ncOY4-0001Qn-Qy
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 09:35:28 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ef0e694-b656-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 11:35:27 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-xv1h-gyNNN-zTdEjA486MQ-1; Thu, 07 Apr 2022 11:35:24 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM8PR04MB7955.eurprd04.prod.outlook.com (2603:10a6:20b:249::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 09:35:22 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 09:35:22 +0000
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
X-Inumbo-ID: 0ef0e694-b656-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649324127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MAUXw3cP89AymUKIjB7co3uqbixDNYuXAJVcJsJ6lMA=;
	b=SF2Rennc8aDfunzU1Tuo4nD8uveMfpzH8cq6M+78s/qKFBxRD4ME/UkNrd2QuYxghhMsvT
	RxFxm9PJY7iYh0fBxAVeuCxiEuqoUgR1AF6OzIprEiStukstiuymgSHQvSQQVa7cfz78IM
	KwX0rXjtfdQ4CS3nWzVaI3KjapNr/Kg=
X-MC-Unique: xv1h-gyNNN-zTdEjA486MQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYHxayyrfQ4L/YfUeCfszPjL12Ay4+LAhmDuE6CkJLtBOP8q55ew6nB7UUulQoBbUVYUK6D9WSiZUfHMZzRfnNtXKwvT0owe509spYU1b4SDkYqb/yjvcOsE9Ggs/Dj6PlDu7ZMeu33/SHEfCCgpBjynFhZF2Z3k6wynrkruyRVnLuFZ6pNRgS9vEIlwkKgvYavJP7K+KHqaEkhUd/DK5LUr8QqvmAIQiGvKK8G4QzkKvIkh26ObBs2WxA92fKfuJcDIcCyGryRyXcmT10L7UywHf1Rg91xsC1IQk2dF4+/jm7fCEEM0NQgzN16atM2xX+ccjxk4MH88zwt0OL5dsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqmnFV86czVWPs5sMKoEdYF2ER9xYGyCET3b2wi+2UQ=;
 b=PSGY/5Pvw49IHefmBswIhSDUW09fHdqqxGoYBByNR8/0EVVf4CwY8LtucXudb6So7X/rU8CzdGoTdPOYTiwH1CKIlJHcDhfqlgeGeem+iXNEiHy15cz9rYkFxJif5kurl3TLHEUpCtUmi2ip8ggLon7lSG28rM+Idklt5xIuDyNLX8MhvFBeOS0rof7ss4ktXZv/JBYQTYqhGgO30YdZe1EN0D8ADsbYPgmPSkuw9SGcRrfEK+2WH9gyOIvHO4UHJV/w827+COSnlrQ9ReyVu9ALiTMMKPuJOII4hbtzxsEs1ESlQ6ULnsSIZ7Fln+MzlL6wz3eo1zx0d8iayKKFLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <edfe5d74-9ff2-1fe5-7078-f72ee6ed4f5e@suse.com>
Date: Thu, 7 Apr 2022 11:35:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] platform/cpufreq: add public defines for
 CPUFREQ_SHARED_TYPE_
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220407081828.38747-1-roger.pau@citrix.com>
 <1d05e311-d466-b729-ebd6-178554f67872@suse.com>
 <Yk6tW0Q9ROWABn4l@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yk6tW0Q9ROWABn4l@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0021.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::26) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 472ec749-2877-49d2-2b92-08da1879f00e
X-MS-TrafficTypeDiagnostic: AM8PR04MB7955:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB7955DBFA5FA2AFBA00E16D9BB3E69@AM8PR04MB7955.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AN31ucGeM/MBLn4wqoqJpkpq+7WwZbY2CL4q5dhN3wJCaktGrs2pjnfASCjCx7dl5+5T3mVwdB40q7Lwhxjilx1MXILN3AS+YeYMrdKlNiS6zoc04hWlcrvgKIzuJUppWPN0B8DHFCP7kCNDjFAGGte0mkl4kLNClwbMbAlCELQJUMvzpmrg9p27Wcpvv12+/ZkM+gsoXFQzS7+/nXSUUQJw+NNI4s74pDdIa8hodKmW9Jz82GhP+GSYK+pqlgl06t4E+P5GYiSk/Lbbp7CT1wthgnsTdpMIfm7MrQeRgg/ltHEV4gd4JPaU2LsTttUViX7g8lug7qUlQNRV6jUyvmLOoK+AmTPdnLhEdrK2wBOuUQ0JvMKkz5D2J/t0tHZYRSl1qrEPzRr9MrKkPKh5KjegcQEF/AevqqfHldRIvk2GQIIQ4zJ7buQMX/qBpArniaPMa7q2NgKijMNXgoh8k5W1llBJw6sLx1vi64hkdfY5fatCJscPj7DiTSz/XCv+KulYKnqB1fHYtPYTVldGoMkHydyqKsSpL8ScDHc5Md0D5E9pFIsvTdeHG0fCb2SqxYgXBoltN/dS6hmDPmO0OYHADodI0KWn49kYNGLa0gYdTjqEHK5cAF8XziFtIhHMxEgTx9Cw0TGEDQGFlH3g0tEjdRrjZMmvGKof2xjotj4Jd2bV3dCdTTYbqdeg7qMWvmysIfB//+wIMbH+Mks2XsHETFCsErtxvHjllfvlblTDn4nkTM1ToC9JW/Gl4Sv8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(53546011)(2616005)(2906002)(36756003)(5660300002)(8936002)(31686004)(8676002)(31696002)(66476007)(66556008)(86362001)(38100700002)(66946007)(4326008)(26005)(83380400001)(186003)(316002)(508600001)(6916009)(6486002)(54906003)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fGP25Q7K5MijU16IvEmiuLQgfnJZUVscYggdqVnbo+eu7nG3Nsx0sZRvwTRh?=
 =?us-ascii?Q?pTTEdbjEaEjd2Ni+bZb96ec5HvDIrSLZFMCGoDODUKdXF0aNVz0PlesDX2HP?=
 =?us-ascii?Q?KZx/I35+bBfx8F+qc3Odw5+2X1TZGdobFGKnu8qhSh6Ywp5zXle1ars5Bv4A?=
 =?us-ascii?Q?2ak36YpE5mE+VTTUMpeul3FwRfzi9jRKtRW5uZ5VYZ5CQY7GLiG7M6Gtcj2s?=
 =?us-ascii?Q?U1GBV5lXWcDd5tmwe+jwzk0p7tfv8leqrJs+vg+nxjqcDqt7lsLrVz+Rplqp?=
 =?us-ascii?Q?DE7C0A37MpteltvTPZP70YNODEFZluUOgYmqBY/4anwY4NX/FZaz7AclgIO9?=
 =?us-ascii?Q?u3/fkCD7ov590Yj8vxOHcm+9q6qX7rpWaZqK6g+WUj1je8zI9uph6AKjO7J/?=
 =?us-ascii?Q?R2Wrf49tDDLQgnj+axYF7CcCtaHjLSHRqz2iGqjqHiDJE1eU/pBYhmLwmd1e?=
 =?us-ascii?Q?vBaYbWCJ4aRQchVAuOWF5G2rnVZ7oqvaNcuko4eQYDeEZdyUbB0CXOJrnXS/?=
 =?us-ascii?Q?k++eWVG4LpUJMD5Ob6WH2Xw9CQtWn+vBoVIZdkWGCo3d4jl2pUvekDtlp+vV?=
 =?us-ascii?Q?b0UZwb3Icj8ai8IY95zXbdnNztbvIJ7VvJe5MrpkkT6hc1TlU1yqUleirwSo?=
 =?us-ascii?Q?m+MN4CMCuvhVy9+Z5THMx2BzeVesOel4+sbuggTpxZeQa4s4NgEgnSoG0+DS?=
 =?us-ascii?Q?62Znt7vA4CZAjDOWkl0C4CmiquHh8OG3raVIEu9Pe++IrWrYEv4odLDWgY8c?=
 =?us-ascii?Q?apSq8m8G/3OB5ngl40TQoFtRPpm//ErYaMMMcqCQcZBbIOwUlMc27W6D5UBX?=
 =?us-ascii?Q?xN9Tgm69dIYLbtgqyCwo5vjqoIPFs8cixwG0sT79vPI4W2tg5n5KHItdLWed?=
 =?us-ascii?Q?FfaR+AnpQ/To642LQ4Ay2Jy0roxsxiU4ae9kcl13Jps7kvz8x5LfI7mpxPPm?=
 =?us-ascii?Q?FC9o+2esYNdphrg2JmWkeQ96aFAWzje6SuszGhCbdBgYQK3Cd7Y0UyEKzJie?=
 =?us-ascii?Q?e8W8IqFwnpwTqCAi+AyzD64qSnjfYfToiUWISg+PSBB6ZEorIYUEf/mwfEZY?=
 =?us-ascii?Q?6Npk2K69qyqmAI3o7JqyYUlmX7WDeZ7qHL3zRrI/1Kthl7kL4tADH6XtWM35?=
 =?us-ascii?Q?W46qS6/Ibs0XHTWLmwgleBAk10I+PgbWbfIn0fEES+LSlB31Avqtey7ZGVYV?=
 =?us-ascii?Q?/i3Mc+/y+Q1Qdxu7bjAn0G/kXTHWveQ7Xu1iDaqrFQ2zVqVmNhQelYmY0GVP?=
 =?us-ascii?Q?wfuG9cYXfJtDUYdx6rWHt2N9FdRfqaRR1r9vHcda73FyNCBORMLP/o9Hw69Q?=
 =?us-ascii?Q?e+F75uj6Ak27rr5SGRyyU4dopc7k/ZfKcBf5IsHrrnMJtssTSnhONgXmTfIQ?=
 =?us-ascii?Q?auFHwBJ9hVIZ6WYSeuoGLVKD1RamFFcgr9cqgTpHUVBkfu05sYxJPxIN5NqD?=
 =?us-ascii?Q?IiDFQQAPfGvwhR8H7THw8Lr70qMinIsjp/87KVh9D5+EPqQ83g2XzePn0vSn?=
 =?us-ascii?Q?WBi7XSi3WRlShOmv2KpoAXoB3nrjFkmIS5QuPGHvWd+s7adnJwM0YBI/63Fb?=
 =?us-ascii?Q?Lqesr3hM7RYe8HITSfIJqUC9EIEYQyjAccEWsf+f7rHE30ylg5mSlkzUrldE?=
 =?us-ascii?Q?CrxILoxy+dAbdXnxSeVf77SFj/ZiR8tzgTbQbKws+1+rf2hOmFcgc73BszZO?=
 =?us-ascii?Q?oBSjJjSRJvzGgdzLGc7qgfCZqC5JnR5nvEbPREoINJQXuQQWQkWcBmwI80Jd?=
 =?us-ascii?Q?7EwGCcGxDA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 472ec749-2877-49d2-2b92-08da1879f00e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 09:35:22.5791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MuXjALpKVH7u0VYUXpiDJnL7rTqeRTHiaOv1vjwNlUTSskSDsd/r5fauS2OyyzkNtAqawsjtbPlM6wpwBNdLTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7955

On 07.04.2022 11:22, Roger Pau Monn=C3=A9 wrote:
> On Thu, Apr 07, 2022 at 10:48:50AM +0200, Jan Beulich wrote:
>> On 07.04.2022 10:18, Roger Pau Monne wrote:
>>> The values set in the shared_type field of xen_processor_performance
>>> have so far relied on Xen and Linux having the same
>>> CPUFREQ_SHARED_TYPE_ defines, as those have never been part of the
>>> public interface.
>>>
>>> Formalize by adding the defines for the allowed values in the public
>>> header, while renaming them to use the XEN_CPUPERF_SHARED_TYPE_ prefix
>>> for clarity.
>>>
>>> Set the Xen internal defines for CPUFREQ_SHARED_TYPE_ using the newly
>>> introduced XEN_CPUPERF_SHARED_TYPE_ public defines in order to avoid
>>> unnecessary code churn.  While there also drop
>>> CPUFREQ_SHARED_TYPE_NONE as it's unused.
>>>
>>> Fixes: 2fa7bee0a0 ('Get ACPI Px from dom0 and choose Px controller')
>>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> with one remark:
>>
>>> --- a/xen/include/acpi/cpufreq/cpufreq.h
>>> +++ b/xen/include/acpi/cpufreq/cpufreq.h
>>> @@ -78,10 +78,9 @@ DECLARE_PER_CPU(struct cpufreq_policy *, cpufreq_cpu=
_policy);
>>>  extern int __cpufreq_set_policy(struct cpufreq_policy *data,
>>>                                  struct cpufreq_policy *policy);
>>> =20
>>> -#define CPUFREQ_SHARED_TYPE_NONE (0) /* None */
>>
>> I realize this is unused, but do we really want/need to drop this?
>> I think it is used implicitly right now by assuming the value would
>> be zero; this could do with making explicit, in which case we'd
>> need the #define.
>=20
> I don't think Xen uses it explicitly, all checks of shared_type are
> always against a specific CPUFREQ_SHARED_TYPE_{HW,ALL,ANY}.

Well, I said "implicitly"; if there was an explicit reference, you'd
have run into a build failure. But I did check now - all comparisons of
->shared_type are against explicit CPUFREQ_SHARED_TYPE_*. So I guess
dropping the value is fine.

Jan


