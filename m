Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 727B2415CDA
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 13:33:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193784.345204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMyK-0007Jh-4X; Thu, 23 Sep 2021 11:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193784.345204; Thu, 23 Sep 2021 11:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMyK-0007HX-1H; Thu, 23 Sep 2021 11:33:00 +0000
Received: by outflank-mailman (input) for mailman id 193784;
 Thu, 23 Sep 2021 11:32:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Uzs+=ON=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTMyI-0007HR-EW
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 11:32:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff77b1a2-1c61-11ec-ba2c-12813bfff9fa;
 Thu, 23 Sep 2021 11:32:57 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-OcbfMxcDOCu4iU__uNF44w-1;
 Thu, 23 Sep 2021 13:32:55 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 11:32:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Thu, 23 Sep 2021
 11:32:54 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0003.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 11:32:53 +0000
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
X-Inumbo-ID: ff77b1a2-1c61-11ec-ba2c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632396776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AytB519fHA2wBvZ3fOtCAP08HTYaYRC2kLRN7MjH3+A=;
	b=DaxWt3pWx6WUCldFiUqgH8GF0q/Wmfg4wyxXGlffIMiLypHno52SCCeLRQvugcUmLvTs6q
	Yl2JO/vlehRzXyBes47z/ZZ93dMkBjMXZCbGcDmRXuxBbsc4lGHQ7zvm/1a4BvTAJugEPl
	er4AZDJxTCZ4r9KGF+AQStNiuinnvv8=
X-MC-Unique: OcbfMxcDOCu4iU__uNF44w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpLVaqCG4dreKkV7Mz/QXY/QQg7snz60Vnf1f8C918LxYzEKaSMRa2aftHMt2k4D/ImwYOWSqZfdyu8DFhc+9kDejy4nUgI3GRaCCZbeYi1qWdFyi4vl7gWfQsgh/YNIAOA/ZUynMBlL0UfYQ5eoD5dIvxzBFyuq16JZuq8A3JqlRLeHEjlBJIQ3WAZGE5gZRqPSJ6/QsfupjOgoG0es4ZP8HEppMwyWH01WIjVk2lFoRULpSwTUEeSFW6d7vuIWa18G2fL6mOe1s4tBokb5Qko5ARXXOBKBFX4IpPR9MhX/DRupiZXVjLFuYUfKKfEJRRmE4TbyQzWvlpTQf8B28w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=NZMJ/ub7TgqiJT95OkT/1W1Q9Vvk3YKKElOuUf526wc=;
 b=CJUxWndU/+VSpELHWC2S93wdr/vk4V207KRLOLPLAXhY10BfKEwU/HEwROIaB/h9NXTDoVmFkJZ9b8CrbyhLoSChAg4bU6YBAKq8PPZvnneLUfzy/LERAVWtXz9OhIMJJ6ag1CtyReQ2OlqRx9a5tgVOEskQkHw5cLzdM0HMVj4uzFdcAyAxCzAwW5Kmqlx6JUes+LbazeUU3bA7R8DwEVeUayIokw7yb7eNtxk+ke9glyz4xPHFTaUrX5+50HekGiNS4jdTISngWnsrxiPXIQo0ba4ULd55xXQHGEZ/TqWZLxI70ym/VmnrqM7Cc3Itgj0IgFkyYJAN0547rinuzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v3 9/9] x86/P2M: relax permissions of PVH Dom0's MMIO
 entries
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <a141e1a5-0185-4923-a91e-68c06a4f78cf@suse.com>
 <YUxgsF47nrTn8WrS@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ec456bf7-df78-59f2-6c14-5bda165125c8@suse.com>
Date: Thu, 23 Sep 2021 13:32:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YUxgsF47nrTn8WrS@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P191CA0003.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c222b15f-0a0e-41f9-7cff-08d97e85e229
X-MS-TrafficTypeDiagnostic: VE1PR04MB7360:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB73601CCCA2A6508DF3AE7362B3A39@VE1PR04MB7360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gyhnHZFeBBwVSbJa6h0ZRy9xz1ie1C9Xwqk2F5j4OqYIPOZC+ddxnLQmQrb9/K3R9Okqlsjs2ncD0Mo0+RHNiklCO6J95YRoBzM+aPawd2dwST8+/BuY2xCiUpZiF2ZnhVSBELXO94CfRFQxutJCju+VA8F7TUpQgPkpat+jk4D85jLB13Z+pkcLZ2LVU+Y7yql0MHpx4yWRiq504KY3FvPUS/YSA4JwlJvX4S0AVkZ0ahQQ5FrSA8pZ5CYqFznuD+mdVWeG+GO8W1h7RYNWW/YWs2K3UD0b2FfJeFGgSatu4SzKGBo8pjhaDVQqsInP/w3sVWbQg1OJNWZVOW/aOa5RblbBuJlFaA84+CE6zpuux3zjKVvtV9h9oXIx+GzOj8mH2sgdJG/itQziKakiYxZ1E5soeI9IuoshgTGVSn74GN+qTAK9UOciVn3xb6CitVPD92oUINfTQ/6UQfpf7DtO5NyuIsa98sNpnyBKuEzf8+9csMy6XuTWWY7I1RmLExAHoyQFfnbDGoF5gh8Gl5WyQNDJOVjp/KlMuXlaPhoyh7RSlqIZ+VQcuv/RsU7605fHAwYTSX4h20NbeTjrrpvDbJ/t78vloT4kFjywElSUzoibUcmdzjDAKy9T8gvTtcHRP8lC+snCGfOh51yxqnmSXtg9BXa5uBBSwP47FElbTQstjDJdP8e7lurFRVxPDwv07EDXlYHn0rmh54qxWhXViIt1rI6xPLKGhvG9qtg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(2616005)(31696002)(53546011)(38100700002)(8936002)(6486002)(8676002)(83380400001)(5660300002)(31686004)(956004)(86362001)(2906002)(6916009)(316002)(36756003)(16576012)(54906003)(66556008)(66946007)(186003)(26005)(4326008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NkgluNKPTIMV5ZRUf2sHMyr/Ct+q/Ag3ah4k8Rcwk5P4uPBFdDms3ScZIF7L?=
 =?us-ascii?Q?PLcwX07HZViSOUTjQhlXsu6Zjw8WuBf9RSc4smnhJkWo7jV8BUoyurLCo61p?=
 =?us-ascii?Q?HQY5C8jHUYfLlZpWEbf16qeCi4Ead0TX+5X2DI3v1xPZD6sXmy4pAUY3qS2u?=
 =?us-ascii?Q?MR88mJV92Pz89xt069c7SmPhKtqtDINajI57eRAc/RdufcaVUoxcksvh7zqY?=
 =?us-ascii?Q?fytKandzRwAyzDD21iz2oOS292PhbTRPkwF6w4BEdRgZFzsqGd8GW8HXBy7h?=
 =?us-ascii?Q?Qv2nq6HQkd0vaRj3uRZh8GsYiVCFLUK/CvuROPumYAHofHad+FTc8Bf1j9DA?=
 =?us-ascii?Q?Cq4SRsNpDXdAyl51r4xoGLvL9EBHZSKtsuKxQTSbGFJ5yvWVBBe22rkirtx+?=
 =?us-ascii?Q?uKw31jFt1zDnWVnuJV3IygjJE9VBMRFA8HQvcYMxEK5eU3RghrGbmqwz+EX4?=
 =?us-ascii?Q?vTohfzPEcm2A/UXK7TqXOXI7ynF8db6AhBpFP+yi5Z8QTL4tCguJHRhLk2Cb?=
 =?us-ascii?Q?6uZBWwTxs+Y2qIMIbpKk3Lm9Wsza/FWxsCz32n64nIpeKhKpdVim1uvg42Ru?=
 =?us-ascii?Q?hPjMaNyPqMfVWtmP8+7H4zwpgxJIgkudffVn9307XUzIIij47D5mYrO2uZgn?=
 =?us-ascii?Q?gYin55/R2jmewXXFQ2G4jlrdSDJVCAk9VkMGgoeF2LU9AU7fUpAXE/sf6lQz?=
 =?us-ascii?Q?YOIjpkh89lR9eJ4UABaiipKf4LqCAs8TqJAhu/wogrwa1CopTUuEddobiHTt?=
 =?us-ascii?Q?lDqYFrO9LDvan523qBneWbaAI6zMLY4+PA1pL8dhF/U7UoCW19JbOv0mTTlD?=
 =?us-ascii?Q?3FEKvp6mRNZc10rFaA3/lUfvAfxu0tkv4+21vSM/mvoUTf5HX4ekZ679s3Tm?=
 =?us-ascii?Q?T8V7cONvlIq/B2VMirNxkHVe//AVJ2apE3xpiJ4NGOeEVo7jPF5depKmIpvK?=
 =?us-ascii?Q?isjSxBZ735obqu6zcEW4ds6Ft/+ueiD45ptwk/0lV5tZ6H0v5ZrdJ0IewF6V?=
 =?us-ascii?Q?IzQqEv6VA7/qA3EOL768vfa5QJP/DFYku7l/gXtEIZAOSjz850FWURe3ty/j?=
 =?us-ascii?Q?RzxsJAkznsiSulrbb8hKo9wZQwcn2/5LhlIggJ7eQwl6VfwTGKTcGBRCX6Sf?=
 =?us-ascii?Q?gC7YxaVeJj1K/R2w8jKLrKwD9dolYsIuVDa0IK8boir4p7pu/4MJh+OywErK?=
 =?us-ascii?Q?ikcQetDCZmiiS9bXScyON76Kj9lzN8FDbllTYXJah/4hLIBSZiu5B+MFdkf/?=
 =?us-ascii?Q?SZlWnCjXSaoBxv4oLtTZ/PU2DaxeGYUoP7Oyx1J6bfbanB6qFjLnGL8uqojp?=
 =?us-ascii?Q?6NwsYwt3jGd1XAjjzmN6KMZ8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c222b15f-0a0e-41f9-7cff-08d97e85e229
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 11:32:54.0495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xIYuACyj8zAzzcfIh6xdE07selxxOJMiSN5F6AhGTpFPnAxXBmG70nFawgio9ndjzoWjAyYJcUIEY9RBqiL3bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

On 23.09.2021 13:10, Roger Pau Monn=C3=A9 wrote:
> On Tue, Sep 21, 2021 at 09:21:11AM +0200, Jan Beulich wrote:
>> To become independent of the sequence of mapping operations, permit
>> "access" to accumulate for Dom0, noting that there's not going to be an
>> introspection agent for it which this might interfere with. While e.g.
>> ideally only ROM regions would get mapped with X set, getting there is
>> quite a bit of work. Plus the use of p2m_access_* here is abusive in the
>> first place.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v3: Move last in series, for being controversial.
>> v2: Split off from original patch. Accumulate all of R, W, and X.
>>
>> --- a/xen/arch/x86/mm/p2m.c
>> +++ b/xen/arch/x86/mm/p2m.c
>> @@ -1319,6 +1319,18 @@ static int set_typed_p2m_entry(struct do
>>              return -EPERM;
>>          }
>> =20
>> +        /*
>> +         * Gross bodge, to go away again rather sooner than later:
>> +         *
>> +         * For MMIO allow access permissions to accumulate, but only fo=
r Dom0.
>> +         * Since set_identity_p2m_entry() and set_mmio_p2m_entry() diff=
er in
>> +         * the way they specify "access", this will allow the ultimate =
result
>> +         * to be independent of the sequence of operations.
>=20
> Wouldn't it be better to 'fix' those operations so that they can work
> together?

Yes, but then we should do this properly by removing all abuse of
p2m_access_t.

> It's my understanding that set_identity_p2m_entry is the one that has
> strong requirements regarding the access permissions, as on AMD ACPI
> tables can specify how should regions be mapped.
>=20
> A possible solution might be to make set_mmio_p2m_entry more tolerant
> to how present mappings are handled. For once that function doesn't
> let callers specify access permissions, so I would consider that if a
> mapping is present on the gfn and it already points to the requested
> mfn no error should be returned to the caller. At the end the 'default
> access' for that gfn -> mfn relation is the one established by
> set_identity_p2m_entry and shouldn't be subject to the p2m default
> access.

I think further reducing access is in theory supposed to be possible.
For Dom0 all of this (including the potential of default access not
being RWX) a questionable thing though, as pointed out in earlier
discussions. After all there's no introspection (or alike) agent
supposed to be controlling Dom0.

Jan


