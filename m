Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ADC412F97
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 09:38:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191468.341506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSaLi-0002QN-PF; Tue, 21 Sep 2021 07:37:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191468.341506; Tue, 21 Sep 2021 07:37:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSaLi-0002Nm-M2; Tue, 21 Sep 2021 07:37:54 +0000
Received: by outflank-mailman (input) for mailman id 191468;
 Tue, 21 Sep 2021 07:37:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSaLh-0002Ng-WC
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 07:37:54 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd8aa52a-0c25-417e-aa9e-01b4b2839de1;
 Tue, 21 Sep 2021 07:37:52 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-5-gZLf6xi6O0ykX9ka3Q8vag-1; Tue, 21 Sep 2021 09:37:50 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3535.eurprd04.prod.outlook.com (2603:10a6:803:11::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Tue, 21 Sep
 2021 07:37:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 07:37:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0100.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Tue, 21 Sep 2021 07:37:48 +0000
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
X-Inumbo-ID: cd8aa52a-0c25-417e-aa9e-01b4b2839de1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632209871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+IcWAWRhFcm67BoYEBI3qzzc3i4lN/iLCloOocYgg0g=;
	b=ScJxcLkTuKLk2jIw0TjgGy3nNVMvWFFWz3znnbamojfByLRLVbz9Y6Oyh8Psq8cl9UtE0H
	rhaRGjh76Pg6Ihc27QhUrBUPYbuV8jgT8ncKH1vr5dZ/yHAUjgZdS+L9sILxuj9or7YAdt
	MVK4rvHCKpf02Nr33Tw7rNNmrWPIGiY=
X-MC-Unique: gZLf6xi6O0ykX9ka3Q8vag-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUaZ18zzKd0/6F5awnj7yVgNaZzZgHBaQU/Kxi21TFAQ8eBK4aVTXoZgPDUUjqYmT503+NpPaMv28u7O2+guPaUHK44cZ+DCd/4WIHWjTBGtv4ghn25VZQ2jf2258WIUcI9aTE2jt8punWOKPs3s69AxRzq30qsYOciohZJJqIXEe3TiUxm6oM1U6HsbdX3XTK0q4KSbTm0Ma2Euu+GyRHZx1NONI0P+4DCHqtibuAnUELW68IrNJQUzcklpfRBxVWn6PfeG1R/0Sanoym5CpZYZ7Ospm7FfQB7sN5KrsnhsY1/7qwa6Af6Met9+24lM8txy4s5I7ChRsq13XOUpMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=9hu3iAJHykloOuWfFZ32ZXNlq3ONAqlbMTDZMI5vySc=;
 b=MdBa8vD47WIZrlLJYsRhm7QwB8EL52xs0+N+xR50AE7Os9L6371vyoeWETV2paEnOToe1XZz7WInuuhGhrHiWXZR8SHpF4X/4QT6N8i+kMEmy4fzA0BwRbfkfxKeWMF+BdEYKJUcjFe0B3TnmLTgCRlEqJDJa2C2ovow3isY6an+ss6OC0VduPmW+3taTlLSlf7Hv1IOU/UL+49gvJgxjg7mJhns3uhsebFs78eoTDWRlS2UyuNoIGNtrhmsEO5JwC3tJTw7FUOY/u36/3MpcVpbPu9AzM4282Vas0dYgICiGh39IjXfO4whzI4lj1tt1iBHdys8FB8HaTJZ4ZuhJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v7 1/8] AMD/IOMMU: check / convert IVMD ranges for being /
 to be reserved
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
 <133d60ab-0de6-4831-7387-0ba9cf6efb5b@suse.com>
 <88994b1b-a8b3-1207-5ac9-dac50c383a98@citrix.com>
 <e3fd804f-07a5-8388-9c2a-19aec82a164e@suse.com>
Message-ID: <a85d800d-d06d-534f-3e25-bfe724d72037@suse.com>
Date: Tue, 21 Sep 2021 09:37:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <e3fd804f-07a5-8388-9c2a-19aec82a164e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0100.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88d4a113-9da2-421b-47a1-08d97cd2b5d4
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3535:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB35352FBFCF6A94D2E98E986EB3A19@VI1PR0402MB3535.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dV79Sv9dpzkA87/viXISu9eNpILoEVwExX2DSq37VRYCJDve0OggWFY5+q1nsPiHl+q5R6HmLL7AAAK8ERydFhrYshS/Y72Eox8EQscq2VTq1s/YmUR4OtmGmh+nya0GR5xeqybt1Q01mBT3QL5d5AMy4E8pqMgqrR4nGW0KC3av9f/W/G2uPJcaDX1IN+5tsDoZIKRx10+3d4HcPN5soFy41BozkM0GKO2w9oirbXujfP8SOS7RNgP/SA60EGUDa6wogIx6N7gxjRLipPGYbLlGWY4EyOXI0DcNeIXss05B2ikhZ9oUm8wy7xxdrFZTpJ9tc5Hi/ZBwyV75i7qhf7KelI8LeoKlyZZ5MCY78LJ99s6zW7mZkTZZ5cCQNSwRIBrbHj1s6PlJZQ3n79mY+qyD91Tah1tD4e+aAUqxtg+7GLEZSoICBlWS+AVq5l19NczNyJq8enrFWwxj7Xw7L17wiOTNrgWqpsNvgdMZ84H6mgWccQ6majC6lAy4DLr1RGKUsr2YfChYKb4HGcklMCXPgb7diu+Moh7UFPsJzE8Z7Na0j9xUYlfu57wW86xR4o+ZJv8mtb5X31wk2hPkCqRJ/FH7K5UGSane/d4ScjZW7QipwVg5EgWEPmQXD3VUf4QrKzrNWlZrQHUrVW0wblOk5Y6CycpMBOKNQDWBGKW54nc1JR4fIPyGYUM2rLCZLHHbo03FKQ3rGOXb19cYko7l0wUi22+vGJTW0gObRYw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(8676002)(66556008)(2906002)(38100700002)(83380400001)(66476007)(86362001)(54906003)(31696002)(26005)(53546011)(316002)(31686004)(66946007)(508600001)(6916009)(8936002)(16576012)(6486002)(5660300002)(36756003)(186003)(2616005)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8VQlboMf1ce3uZ9ADvMcMAgk4iJdrE0vbBE3aePlkCLIquHVA9VZ9BCxYO6a?=
 =?us-ascii?Q?JX9AkJJwqbzkZ+IfoHSZuti1rccyIcv2/H4FRa1IjnVxezW+BVM3Zvky6kH+?=
 =?us-ascii?Q?lfKq1IbT9aUE1tLiW5a3v1VDYYVHe8dKMl/pr0c4sbekwl2bjHP7EMqcCceN?=
 =?us-ascii?Q?fqP4SC4r6AOj1T57nqj5gODNZ6tskpIw9qw9nR+pMW6oKUGIhoRgsINvkQcb?=
 =?us-ascii?Q?QwNT6jNdFIKKvTyeObwBYgLMhhOMR/9FYGedE7AIb7Si/rrRtM2vjYJSELhe?=
 =?us-ascii?Q?VfELnEOZBhrV6FSbSqNdWo4ByLi04V2pZ4KXf57d57e0E35B24on9p65KRoS?=
 =?us-ascii?Q?mSvM1JTgICx0h3pJd2lVyt9AMvO64BmqQv78DWoDOb1flBefgwDoFDPY4D7c?=
 =?us-ascii?Q?2X1ntQWXNoxjgymJ0f3jgcojRSQYpTWG71bk6dqSZU3K188JkHvWnllahEfM?=
 =?us-ascii?Q?AMzUflWXRF5sDnrh3zQJU1idHTuZIIY6VLS5RZT+2154wXS8+xUF3HiKBrri?=
 =?us-ascii?Q?Zb/w1LnhZYhz8XfVH4F+BR15G2elbtuOxQP4xBhDQEf5hUnnrozpumwRZb7m?=
 =?us-ascii?Q?lXsnu30PEekb8c23CuN2s/FsVplkgltSD5I73E6crciYaOzS29lVramOI0nm?=
 =?us-ascii?Q?3D40vBNA9fdtPtuu7W21zaStB7X49BijTZXS5ZgVgzdG4A0xHrvdGOW2KDBp?=
 =?us-ascii?Q?KPiKmmHwLLK5kugADANWCUTix71eCUNPwfqFqqU8atxRDo+hjpuhOCj+osUc?=
 =?us-ascii?Q?nInVvdrmTs7G3Gyot6/He31/Ow+Q4fYYCARB16adacIzVKzEYKewUbtjHv+6?=
 =?us-ascii?Q?OJ1FJdf0xgPBcme1tePw0ByfFLnO9aROsYnkKj5ah4cB7yTJRcXWk9s74RKU?=
 =?us-ascii?Q?I7VrjtbcKtXIJ3CtqkVNWkAXOlhlB8Gh8yRqH4Ga8YVhI1FNpRH85Ve6SCr5?=
 =?us-ascii?Q?PqqYuxI9m87x7r9zCO2UxnXB8Ord70r+FfZozH139atukS4iDQOFv+h8xJMQ?=
 =?us-ascii?Q?izw6T4CK810bbeR9eI0ijsI52YtgKR5iUO808c8gwlhN+KreZt+cXAoA2MmN?=
 =?us-ascii?Q?FV8GpD7sdJToMzMHDN6WYIjnmD1aHlpJJfu8w+GyxQyzbi6dlfu4Koo0DsxW?=
 =?us-ascii?Q?c8jrIy3l8mVxBYFD/EJe4GoF2xXc2JpD62Duq3UvI6Kj83YAfnq65AiW9yH+?=
 =?us-ascii?Q?GsLQ2J4bJw2my2woEY8px50rGi2nZNyHEZL29iYQKUK98ACC3OrbZRmG/B3P?=
 =?us-ascii?Q?gopEeKoeXpHAMdvV06taZaHj19UYxDRDcvC4o/MtzI0eGSqvAzpNkzzCN1S9?=
 =?us-ascii?Q?du2omvh/GWY3WFuS15w/RdP1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d4a113-9da2-421b-47a1-08d97cd2b5d4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 07:37:48.6159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uGpnElRXbEjQnfc/d9QRuy9AOJtAPG+8aNjVQDAevwmDzXhto/XzzX49BKxFXsMz6XW9oahrsF0bldPd/DtlFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3535

On 26.08.2021 14:31, Jan Beulich wrote:
> On 26.08.2021 14:10, Andrew Cooper wrote:
>> On 26/08/2021 08:23, Jan Beulich wrote:
>>> While the specification doesn't say so, just like for VT-d's RMRRs no
>>> good can come from these ranges being e.g. conventional RAM or entirely
>>> unmarked and hence usable for placing e.g. PCI device BARs. Check
>>> whether they are, and put in some limited effort to convert to reserved=
.
>>> (More advanced logic can be added if actual problems are found with thi=
s
>>> simplistic variant.)
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> Reviewed-by: Paul Durrant <paul@xen.org>
>>> ---
>>> v7: Re-base.
>>> v5: New.
>>>
>>> --- a/xen/drivers/passthrough/amd/iommu_acpi.c
>>> +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
>>> @@ -384,6 +384,38 @@ static int __init parse_ivmd_block(const
>>>      AMD_IOMMU_DEBUG("IVMD Block: type %#x phys %#lx len %#lx\n",
>>>                      ivmd_block->header.type, start_addr, mem_length);
>>> =20
>>> +    if ( !e820_all_mapped(base, limit + PAGE_SIZE, E820_RESERVED) )
>>> +    {
>>> +        paddr_t addr;
>>> +
>>> +        AMD_IOMMU_DEBUG("IVMD: [%lx,%lx) is not (entirely) in reserved=
 memory\n",
>>> +                        base, limit + PAGE_SIZE);
>>> +
>>> +        for ( addr =3D base; addr <=3D limit; addr +=3D PAGE_SIZE )
>>> +        {
>>> +            unsigned int type =3D page_get_ram_type(maddr_to_mfn(addr)=
);
>>> +
>>> +            if ( type =3D=3D RAM_TYPE_UNKNOWN )
>>> +            {
>>> +                if ( e820_add_range(&e820, addr, addr + PAGE_SIZE,
>>> +                                    E820_RESERVED) )
>>> +                    continue;
>>> +                AMD_IOMMU_DEBUG("IVMD Error: Page at %lx couldn't be r=
eserved\n",
>>> +                                addr);
>>> +                return -EIO;
>>> +            }
>>> +
>>> +            /* Types which won't be handed out are considered good eno=
ugh. */
>>> +            if ( !(type & (RAM_TYPE_RESERVED | RAM_TYPE_ACPI |
>>> +                           RAM_TYPE_UNUSABLE)) )
>>> +                continue;
>>> +
>>> +            AMD_IOMMU_DEBUG("IVMD Error: Page at %lx can't be converte=
d\n",
>>> +                            addr);
>>
>> I think these print messages need to more than just debug.=C2=A0 The fir=
st
>> one is a warning, whereas the final two are hard errors liable to impact
>> the correct running of the system.
>=20
> Well, people would observe IOMMUs not getting put in use. I was following
> existing style in this regard on the assumption that in such an event
> people would (be told to) enable "iommu=3Ddebug". Hence ...
>=20
>> Especially as you're putting them in to try and spot problem cases, they
>> should be visible by default for when we inevitably get bug reports to
>> xen-devel saying "something changed with passthrough in Xen 4.16".
>=20
> ... I can convert to ordinary printk(), provided you're convinced the
> described model isn't reasonable and introducing a logging inconsistency
> is worth it.

Since I haven't heard back on any of the replies I gave to your comments,
I'm going to assume they were sufficient to address your concerns. I'm
therefore planning to put in the part of the series which has R-b perhaps
tomorrow (with the tiny adjustment(s) that I've made following your
comments, which iirc were just spelling issues). If you disagree, please
reply there.

As to the particular concern of yours towards visibility of error-like
log messages: There's e.g. a significant amount of pre-existing
'AMD_IOMMU_DEBUG("IVHD Error: ...", ...)'. Instead of introducing
inconsistencies here, I think I'll add a patch on top introducing
AMD_IOMMU_ERROR(), AMD_IOMMU_WARN(), and AMD_IOMMU_VERBOSE(), converting
present AMD_IOMMU_DEBUG() as I see fit (and then up for discussion).

Jan


