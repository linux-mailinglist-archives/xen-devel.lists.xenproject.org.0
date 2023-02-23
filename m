Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C49356A08C2
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 13:42:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500339.771671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVAvP-0001tD-Cz; Thu, 23 Feb 2023 12:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500339.771671; Thu, 23 Feb 2023 12:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVAvP-0001qr-8z; Thu, 23 Feb 2023 12:42:15 +0000
Received: by outflank-mailman (input) for mailman id 500339;
 Thu, 23 Feb 2023 12:42:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pVAvO-0001ql-Jg
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 12:42:14 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e89e5b4-b377-11ed-a82a-c9ca1d2f71af;
 Thu, 23 Feb 2023 13:42:12 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8499.eurprd04.prod.outlook.com (2603:10a6:20b:342::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 12:42:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 12:42:10 +0000
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
X-Inumbo-ID: 7e89e5b4-b377-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQCrQT/pHvh8FLZk5ahdsUNZghLiBj8aQtjlfQfvSTMHrgv5JM8QB62U0pkezcq/VtvvaT192jsvsxsGg+bv+2/dn83LWQXnoOSGBUv9ih6kk+qDUE/jTM/4RofhjmfWnJ8N9KQs+x+Pr2EWczOJUYZNK73F6fH84kjIhJ2d+bXmFUPmbd4tQmPtPMNOX6RHwgeFJUjMgBmA0rYe8ZD9zcNiVQpT2n+PBJfqZjYQW85S1f2Yu0IMPJ5LdOpSjjaEatfL6cu3BTeXp34ccR5MIpp8ZHTYBb5N0MCgR5u5SN+lhRHrLZXikhaq/YtLmtpsfeYzgN2/MwcsA86UHAJUpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYVFI3t+M2V0/OwrNOmpl5Ih2XRZGWtym6dDGH/uG8A=;
 b=Zo9NtZkPGQfH6pcNOP1OXIhqP51tHUT4U1M8sXPDp15jQreYsUVtUbIam3LR7uhSqtywvpa5OxJkaCNZHI/IV8u0ypssAK3u/YhzBPDoTMzY51JcIo6xWVur3HHRqd348mPf49L7Dc2kjc/B5q391VmuxChKuCmHkXmPrE4W12Jwgo/ecyojTGZtkAQNQ976Hg1eT4pwe4tvhliVgMHxP3UMaqnKHy8IZjmbgn6uMmCGxkOVRzEAv0+q7z2IR9z9ELn7PecyVrD34miVOgd7pCek5zRzqQZtI0092JX1fQLOeAleLJEYFDHXon41UBqUSNWKPedpnJciylgVE6Mjkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYVFI3t+M2V0/OwrNOmpl5Ih2XRZGWtym6dDGH/uG8A=;
 b=P7KnKY7Mm8zzmePXujaJjB3DkPd0C6oj+8wdcjaYDgPYU+89kRFeVjOFy3TyXZ554XsIIZQUxLdjeQsOJw4IePY3Bb1pJehzBNNL9M6pJ8Vkez/Jt/n5d9XGOpbLSN9hodXgmqAya5KRgl0TDjpLDu86PTCrkLd9WVaOzXZckOOuG0Vbiait89TBJZS5VoNNksC7EwyFV9yHvjjPvB26K9NsNbr0jj0q5v6Zip3xwOau9O1lMy6Xmb0Fl0ROVjHmI0EAcBsxR9MP93C4QSWjParcMM+ZZVfwQVNRjHAErCvTFdZSpkTGSttFOwCSmjP+yjvIx4NqKEIg+HmMcgwJ5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <496b1fd7-4540-66c6-be89-51f20a6666ab@suse.com>
Date: Thu, 23 Feb 2023 13:42:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v2 1/2] xen/memory : Add a stats_table resource type
Content-Language: en-US
To: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
Cc: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1665138677.git.matias.vara@vates.fr>
 <af6032c9f5863b7e6fb183a0a197407ec92bb067.1665138677.git.matias.vara@vates.fr>
 <b59b6466-8d06-f7af-beb9-3c38c638a455@suse.com>
 <3aa736d3-b833-0c6c-2a41-71cc4b953aae@suse.com>
 <20230217085006.GA2281468@horizon>
 <7e79d20d-0922-565a-e46d-e3366c0bcfb4@suse.com>
 <20230217092948.GA2282871@horizon>
 <9864e936-5c77-a790-e36c-766d5359cd83@suse.com>
 <20230223121647.GA3260113@horizon>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230223121647.GA3260113@horizon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8499:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bef6405-9039-4d2d-4e49-08db159b616d
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	445D2AKh/a9C9saQ6EvE3DJWPi3QlI4w1rdtc2bs2tsxFVc/ht0uJoqPi2RWQg+3T8e7gD4gquAM71/XYs1dzZz0u42UqTT7yvQLpemfJUbhAsmtMNCpZfG/luuTYO0Bax/Rd2wPgc0+i2FXQklBC47MbNN1fM4kntj6JeD9vWBCyHgF/AcWecAm6Fd0Ja+iLna7EcdZr+J8gwj0MP+AJ0iNB2WURl+EsoawSwCofeXjsPY2LRL6Dqzd8iIDhP2MRc5rG94afiDexiKW6klFIV76RgVgIAatW7a5ur/Oea1M6GiwYKFJgA6XP5QjzUPZ+X3vuiEArpgLJIuxORHuFqAvKMGum4Rj/ajMgYG2p7SToj+grX4I6WPx8613MtodcleLgw2yyGMghL182/BFaYEWQGNQIyvp+bmTK0Dd6ia5OegvFV0V6Y5g/CpJFFnc5sYIQeepsmnsYL1Wuo/8ssDdgRozUQN1h+mMlo4Ji0PHWjdLp/L8fThviiAmaN7YuM012Q7HfibT8iZDRe6GvrhYfjEkbtZ7AhoYblX1xn7RGEYLXoPRiJGS6W7PC4WAjbiivUbGUcGIf0AOYWu97Qt70sFOrAE+ciGtPJGk2fN0f2gAVbd5miCXPXZ4ucIR5ck1FmvAjXICPx7fYmbwYH3n303QUtGyEKQRcLazdNFi67N6LmXsjZbpHrSXUNATiiwzAquMUMsTP2G1TPoFByMsblhPpqraSkfUfLXqI6A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199018)(86362001)(31696002)(2906002)(38100700002)(31686004)(478600001)(6486002)(53546011)(186003)(6512007)(26005)(36756003)(66946007)(66556008)(66476007)(83380400001)(54906003)(4326008)(41300700001)(6916009)(2616005)(6506007)(316002)(8676002)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFR5aXNYNzhiRVlsTmZLeGJTaGdpUEtqNUNkVHZ5bEdzUnhBTFJnM1hwUXBB?=
 =?utf-8?B?TXhYcjZVMmkybVpqcnlWR0ZheVZiMEU3b0dGS3BNWmJtOEtiT1RqTEpzVHRn?=
 =?utf-8?B?ZVUwVzcxRk5CM3J1czdUQW5rT0l1N3NzKytEbkxvYU9RQ3B3ZlhORjhkZWhH?=
 =?utf-8?B?U2FUSnNGSExJRzg2engzS0pmMjh4WFh0MTBoWGNydWszRHhpWFk4TE1CellB?=
 =?utf-8?B?cElSUUxQV1hoZEhuNUtwS1RudU9uYWRyQkNzemFQOTVjVnd4MlQ2MDlsN2s4?=
 =?utf-8?B?K05IMHhySEtXUGZmYW50RzZGT2lLUVViNTJVY1I0OHNtV0l0MDdOTGs5ZHFp?=
 =?utf-8?B?L2J4bGZsVUV3RjZGb0dqSlc1MzVwOGFVb0ljM0JiUXZ0amM5STZlR3dYbm1M?=
 =?utf-8?B?WnFNWnRjQ1RxOWh3Z2docGhHWmE4Z0xxbndoRit6SHJ6M0JHelpUQUpHbDFN?=
 =?utf-8?B?ZGJpTkYxU2xrcUdUbUhUc1o4SW9UMS9sN0NXdUthQlFxVW9nazZBMnh0S3U0?=
 =?utf-8?B?OXJHdWpta05UcjRuZDVGeE8rRkpwSUNxdHgxNkZsTnpPd1BYSnh0OWlvL3Jm?=
 =?utf-8?B?d1Q4UDh1YTFWcmRMTW1iN0lIYU1GVktUN0FQVXBtaTBwTU9mcFpxK0VFcGtm?=
 =?utf-8?B?ZmU4VUZrWFBobWJtSTB6RTJmU28zNjNrbXhmZkRUNVdVSjRBak5jYlBOYWlh?=
 =?utf-8?B?OHI4TjNQeU1UZmV5OUhQcmRiaUhOT21ld1JnTzhKMnJNSkFUc3BFcWJONEZs?=
 =?utf-8?B?N0JKeHM0amF5Y1d3VytYWFJiZktPcEN6SGUzSm50QzVZTURZQWhvc1BHdm1t?=
 =?utf-8?B?ejZGWGtZRk5tL1R0Q1czeHZzYW8ySDZRVHhiT1ZIUy83dU5Qdk1WTkdLQjlS?=
 =?utf-8?B?TjdxK01NSS9wR2pBejhYS3lyaHVXNjNZNWZTbzlxalMzNmdtRFhOYkFaQmpw?=
 =?utf-8?B?VElFMTI2M3liTzVveXhEeGxxaTE4WEpCT0lzeldaMGY2bWY3N1hQNXpLSmkv?=
 =?utf-8?B?SkI0bkI5REhSYTRzc3kwbmZDVDV5cGdOdXJlSzVwazE3V1FkdzlIeWI5K2Q5?=
 =?utf-8?B?NWRVSmpGcmhqSjQ4VWUyeHZNZjlFS0xuek1MQXNPd2NFTmU1amZpS0Z2em5N?=
 =?utf-8?B?Mzh1dGFEWHJXeEJKeDc1QXpKK2hmdUV4TGgrMmtiSUExNERnRURsZWIyTVZ4?=
 =?utf-8?B?VGRZT201ZFhDVDZMaVpML1NNWVhGUmFyYjJjZktzSjRwRkFYVWh5Uk5UMnpY?=
 =?utf-8?B?cS9xYVFXaDRna2I3YmVpK0lFbFcvTEsyN0xsaTQxMUNqVEtKNlA1bDRxd1Rr?=
 =?utf-8?B?eW1EZS9NbFNxcEFMNEpaSWpzUExjY0xNYkVEN0VJZDRTT2VSWDFoNHlaNkhj?=
 =?utf-8?B?OTBPZEJ4Zng0VXFGWHBmQ1puM1BKZVNlZTRFY3B2QWVQTFVBbkJNVHIyK3B0?=
 =?utf-8?B?TUhkLzlpOXk5bXZVdjZTWGdVMjZGRm5RT0NpWE05STByL3FaNFJZSUZGaFdt?=
 =?utf-8?B?K1hMWXZOYWdoUEZJUzlKMTg2TWpoaEt1NWhBcVhYcEV4SGhEL0NCOFprUGhp?=
 =?utf-8?B?bHQza3NmRW9ORUxnRFRKVk5BT0JXem16SXhBTTI1d1F4NWlqc1JBZU8vWE55?=
 =?utf-8?B?L0NRV2Rzc21saFJwOHRSajdxdSswOWduV1B2WUZ4NWlqbXRWbjA5MkZvTkJB?=
 =?utf-8?B?RzQvN0VLeHNSWVVmcHJ6UHJWTy9NU2Uvck1vKys0eXgrWTllNmRqUEljSWhv?=
 =?utf-8?B?OFVLcFdrK1N0UFlYUFhnSUhXM3pxU2FjejYxTWVsdVJpWVMwdlZRelR4Q2xx?=
 =?utf-8?B?akxDSFlKa2tpZUZiZnpuWmJ1SVZvOTZnOUJKUjUvdEhnVGJ3UVQyeTBqcHY5?=
 =?utf-8?B?c09qcFpjRG9BY3FjczFIQjZrT1pkbS9hTjZ6bnNjN0ZsOU5ZYTlhbUdFcE9y?=
 =?utf-8?B?KzZ4ZmhWZ2UzdVJJWFJQaDIrcitqNkVjemU4REVwOXZJaFN6dmJuWDZwTnUv?=
 =?utf-8?B?d0MxaVpPbW42TzdDWnNSUWVHOW9ENjVtTUFyQTFDYmt3ZnhiV2wzZ2xFM0Rj?=
 =?utf-8?B?bTc1TkNvVHBVbGdmSG5yUFpsV1pSd3FNRGxlY0RwaXZ2aWx5M0tYTVVQQnBY?=
 =?utf-8?Q?EG8ij2ks9b5GlBYvAjvvKI4e5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bef6405-9039-4d2d-4e49-08db159b616d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 12:42:10.3130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t99uZ6FahZ1qYkh6nTYVmltVZMQy+xUM88SVPMiXYvt+AenzheXcqViyQb9kq968VCbVRMfhu4klCawQWshhFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8499

On 23.02.2023 13:16, Matias Ezequiel Vara Larsen wrote:
> On Fri, Feb 17, 2023 at 03:10:53PM +0100, Jan Beulich wrote:
>> On 17.02.2023 10:29, Matias Ezequiel Vara Larsen wrote:
>>> On Fri, Feb 17, 2023 at 09:57:43AM +0100, Jan Beulich wrote:
>>>> On 17.02.2023 09:50, Matias Ezequiel Vara Larsen wrote:
>>>>> On Wed, Dec 14, 2022 at 08:56:57AM +0100, Jan Beulich wrote:
>>>>>> On 14.12.2022 08:29, Jan Beulich wrote:
>>>>>>> On 07.10.2022 14:39, Matias Ezequiel Vara Larsen wrote:
>>>>>>>> +static int stats_vcpu_alloc_mfn(struct domain *d)
>>>>>>>> +{
>>>>>>>> +    struct page_info *pg;
>>>>>>>> +
>>>>>>>> +    pg = alloc_domheap_page(d, MEMF_no_refcount);
>>>>>>>
>>>>>>> The ioreq and vmtrace resources are also allocated this way, but they're
>>>>>>> HVM-specific. The one here being supposed to be VM-type independent, I'm
>>>>>>> afraid such pages will be accessible by an "owning" PV domain (it'll
>>>>>>> need to guess the MFN, but that's no excuse).
>>>>>>
>>>>>> Which might be tolerable if it then can't write to the page. That would
>>>>>> require "locking" the page r/o (from guest pov), which ought to be
>>>>>> possible by leveraging a variant of what share_xen_page_with_guest()
>>>>>> does: It marks pages PGT_none with a single type ref. This would mean
>>>>>> ...
>>>>>>
>>>>>>>> +    if ( !pg )
>>>>>>>> +        return -ENOMEM;
>>>>>>>> +
>>>>>>>> +    if ( !get_page_and_type(pg, d, PGT_writable_page) ) {
>>>>>>
>>>>>> ... using PGT_none here. Afaict this _should_ work, but we have no
>>>>>> precedent of doing so in the tree, and I may be overlooking something
>>>>>> which prevents that from working.
>>>>>>
>>>>>
>>>>> I do not fully understand this. I checked share_xen_page_with_guest() and I
>>>>> think you're talking about doing something like this for each allocated page to
>>>>> set them ro from a pv guest pov:
>>>>>
>>>>> pg->u.inuse.type_info = PGT_none;
>>>>> pg->u.inuse.type_info |= PGT_validated | 1;
>>>>> page_set_owner(page, d); // not sure if this is needed
>>>>>
>>>>> Then, I should use PGT_none instead of PGT_writable_page in
>>>>> get_page_and_type(). Am I right?
>>>>
>>>> No, if at all possible you should avoid open-coding anything. As said,
>>>> simply passing PGT_none to get_page_and_type() ought to work (again, as
>>>> said, unless I'm overlooking something). share_xen_page_with_guest()
>>>> can do what it does because the page isn't owned yet. For a page with
>>>> owner you may not fiddle with type_info in such an open-coded manner.
>>>>
>>>
>>> Thanks. I got the following bug when passing PGT_none:
>>>
>>> (XEN) Bad type in validate_page 0 t=0000000000000001 c=8040000000000002
>>> (XEN) Xen BUG at mm.c:2643
>>
>> The caller of the function needs to avoid the call not only for writable
>> and shared pages, but also for this new case of PGT_none.
> 
> Thanks. If I understand correctly, _get_page_type() needs to avoid to call
> validate_page() when type = PGT_none.

Yes.

> For the writable and shared pages, this
> is avoided by setting nx |= PGT_validated. Am I right?

Well, no, I wouldn't describe it like that. The two (soon three) types not
requiring validation simply set the flag without calling validate_page().

Jan

