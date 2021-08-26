Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7263F878A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 14:31:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173002.315675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJEXi-0001Yv-0g; Thu, 26 Aug 2021 12:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173002.315675; Thu, 26 Aug 2021 12:31:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJEXh-0001Wt-SJ; Thu, 26 Aug 2021 12:31:37 +0000
Received: by outflank-mailman (input) for mailman id 173002;
 Thu, 26 Aug 2021 12:31:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJEXg-0001Wl-3n
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 12:31:36 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5c10234-78b0-408e-88b0-3dc2ec548958;
 Thu, 26 Aug 2021 12:31:35 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2057.outbound.protection.outlook.com [104.47.5.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-JvpbqwgBPWSVyJN_fnxmng-1; Thu, 26 Aug 2021 14:31:32 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6174.eurprd04.prod.outlook.com (2603:10a6:803:fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Thu, 26 Aug
 2021 12:31:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 12:31:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0278.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Thu, 26 Aug 2021 12:31:30 +0000
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
X-Inumbo-ID: c5c10234-78b0-408e-88b0-3dc2ec548958
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629981094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TbhJW8BqYFc6p3c5XQ6jf2jPI8gASllJqgAgarxGC3s=;
	b=Kz89T63O+yQ2HlvCo6XjyrokOoG4HSO8lDPCs7JjpHW2FTwrEoSIvw/Wr2bcjkb/tvkmCp
	Tcel2ISOAC9kwjjQwslzERQqoxsghztptT0t6OU3IFKdkigWhQw2iWxYMf93ETJfYan50Q
	K4ScxCgEITqetgrLxyjDnltUBsJ6tFY=
X-MC-Unique: JvpbqwgBPWSVyJN_fnxmng-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0j7YBaQozd0nkyh5DNIbzA6aUL1jQcrS/L2ON2wHXF78OYXxxYsm05vzMkBJbTvNnK45h0Nq/buWEeCAdvJIuHWwnBGkQOczQGGYyeB8WKs5omJg/LY6IxfEc73XUgvQzJRbRbJN4D6231+y32wpuyonTF2fFO7OKBUcRvtnwv3QIiONVdcB5LlR+QQv8/8LAUlUkMSRwpxJ4JVLZFQsHTNSXjB/RQQtWwrcluRBsJfdLQJpPXyu++zWLGu44T5EJv8ONepoSeZOpnWbFPdl7hcrY2/he1wZ56g05MRm6+XYmO+1okujkgehWfgRIcmx8DgBuT71q2Rm1s2UVZ2ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AuXEDa2CkHy4uOPC7f4nQ7UbOd9kfMmjP2WmCuCF9mM=;
 b=BjO5QJGOyHNZ9dpxtVqsXo+dnldaRL+HiwwFZmWLERm2AgIN4m61m8kL0pDKdkKoFrOxZ4xrrNXcOQJiMGNceQgBH0hanafogvVudzSgNGk12APb9uklf9nCDICRY14JnEl8jL4aUZakenYbsl72riIHv+PQ1lGpRugH2WEcORWrgKhzjdn24/HV+N2gdWoUfBd8VbN5E51XWzy2Vsbp/tRaDXsnsp+KHziELe6j7xhwT4yKhtHyv0Wj+INVyDoEAnAWEZuoVOipHxwE9sMOME01VKG8myt70uwLwFpYY2v44sU06vWRhQyXWBa1TIOXw7CQardpc1IiaZ5oITpfNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v7 1/8] AMD/IOMMU: check / convert IVMD ranges for being /
 to be reserved
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>
References: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
 <133d60ab-0de6-4831-7387-0ba9cf6efb5b@suse.com>
 <88994b1b-a8b3-1207-5ac9-dac50c383a98@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e3fd804f-07a5-8388-9c2a-19aec82a164e@suse.com>
Date: Thu, 26 Aug 2021 14:31:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <88994b1b-a8b3-1207-5ac9-dac50c383a98@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0278.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb560103-2652-4c83-f4e1-08d9688d6ece
X-MS-TrafficTypeDiagnostic: VI1PR04MB6174:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6174EBB05FF651E2319BF540B3C79@VI1PR04MB6174.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wWgFGeFGqrN1uQWF9VZGh5KK7CzJdNMr2Sw8mCqSjQ4fwwyGn9XRVDh9/5YkxX8YfxEbDMxvvXXVRdReRsClOrOZGfaWbGjvYFnDtaUDV+53Y7fi0uERPFeMb7NT11IAz2OBW91KbnH8izSfG/Hxk3g7yMH4K9dn7hIgicnOe5K2eWt/z0pduYQOrzKzLPbTdPK3cXjdhgGzN/ZKqWGB6sPRuwntrVvfbC8REasyq82uw0dVO70nc9Rj43XcGWOWOoY71ENa46xvL2NuOH6FSm3vhW7UpZjy8GQ9DwwcHX/XEDo1Ty4nu9ZoPodAZMdsAcG3llqko2HySwwwJJ901fBgtSgEhmA/N9LT9i/w38wby+k35SBI8FvYj0+RpPkkY+niSkhJWr+7gmiVBHBFlVyJOmkQV8e9rT6CQYrY7ykonL18qFTdhKfJ2pwwG0CGbMu4cErWM0s1q75He4MRjQfykvO6CdS3VkFR8f4SUYDHqu0Ze4PmImHaJe4cT5hsQeUvJR6xP953eOtoIwSIq5Grqjfl8X//7YXjIa1avNNB/jYnVxS9fZAKEd8MamGGG8PiCFyc/GecMkNoqZyNs3AkZO+/schonzgHaR+9iWNQGNazPHQHM/NBUqxyza5EBhosVNchpeQkRSXrT3PPDMdsSUnelZJEawDF6fWDP/cPsAVTN5P4u0AKKyip1P12RoXat1CQME2Za/Klq5T7xirSWm2EtdY/ISgKN6HXBHI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(366004)(396003)(376002)(39860400002)(66476007)(66556008)(66946007)(53546011)(186003)(26005)(83380400001)(86362001)(316002)(2906002)(110136005)(31696002)(4326008)(6486002)(36756003)(8676002)(31686004)(956004)(2616005)(478600001)(8936002)(38100700002)(16576012)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y3T/2zlsJDMocpBbaJuATftyqDMDtDxG6NUTmClWBCpbFD7llDG7RA32HoY3?=
 =?us-ascii?Q?YJXi/dmfwnwTp0BCrGa6xESKEo9EcfLUq9zc2E1Etg40mrsBwsFOE12gC/TS?=
 =?us-ascii?Q?95NxZUD6LMAY1WxIq9IxY+5/pxHBgv07NDtEJFxnH0mebLBdNCDXYBqiYMqo?=
 =?us-ascii?Q?C1y2lme3fxZYIAFMvb2yH2SW/k7PDOk3/2auy59A3QURgf5h+Y1CX0vG1/HM?=
 =?us-ascii?Q?7A23jGVMV5EROZ+26MwzHDHNaNqCbFLbnvhvK06GGb55auwq5AhAi15EKa8p?=
 =?us-ascii?Q?alHezyZGE1YrIsbJ7/8FtRycPYBsDCSE2aIsMav1qd59n4PMoONRWBQfcSPB?=
 =?us-ascii?Q?N/FDPcLFnHHGCTD7f1NyUWG9zgQNslkgAMQH3dih9oCC4kjhwQsLVDQ/AYfs?=
 =?us-ascii?Q?X1YF6Rt3eQsc3V0rH5XOVlHMwa+OPAzvhYO/yGd3ujOB4mUhJJwAlRFpTDoh?=
 =?us-ascii?Q?9Z96IgHa+2wFtm5v66WtsjFJVa28glzK1XCwpABkP8gU4+Y9CNEZSZlrdu4V?=
 =?us-ascii?Q?J1RfVKkIQPB/1u7bz3dU+9ta2nwjE+TX1NS1qJ94UarhDzVsr5zF2kkvV2cU?=
 =?us-ascii?Q?oLOyGe28b6kZS+4en2/fRHApVC/T/nvnxQlRhAWMs1xioruXNn2QgLeq9mI4?=
 =?us-ascii?Q?VXGYEbPFT+gw2/RROgZerwoOPybbkDqvoDf2k2yMz1zJiIubiuReAJQRT1i0?=
 =?us-ascii?Q?sm4v6dZPgTKhNpMkvaXoLMUzYJUVpM43EvpCdum9TlBnw0hEUtF1qSWmnqEo?=
 =?us-ascii?Q?j+PsmkLncDrT7/fId+gr/HeNHj0cQr9XB3kz52A9EkX8//i6o8/lA1lgYjn7?=
 =?us-ascii?Q?sBVOyuYEQIAB+hROSjCQiGbvJIiPKSBuuMCIwTo4YA8JW0tVot29uGAQaZxK?=
 =?us-ascii?Q?GMM0cdqBjph4lpQgZuKFwLzbGdCmkcXJuCLrPE3AiReyBkeN98TjqNK8a9YO?=
 =?us-ascii?Q?QGBowpI1AcChPxmrbm8wfWfxv4Yh28WrmKd4MEAUosB3zZWuRPwjHTGhEuWl?=
 =?us-ascii?Q?hXKrvG6bRz9kMs5JJ2YUM7DivkPBvD1ZdzSFJccOj+0VbSA4DGLe/Glc0bxv?=
 =?us-ascii?Q?riHA8AlQf7sKp0NhDqrsUO7czJZYB32JwIKhdJV27FMTxCU2n57wABuwd82S?=
 =?us-ascii?Q?srvHDwlw/yOwQ8VhwQmyO4PSNMIR0j1SgoYzjuj2QWosbrtCezAaQ/ijmVGH?=
 =?us-ascii?Q?RD7xfSu1mWQDTw2Buz5wcQQAjFSM2sz+yDJ0pQ4Tf6vSW8V3Q15sxDiSGUXF?=
 =?us-ascii?Q?e6eqn9Udjl2lKUeJc3S5vMCJBrRlH8B4/UifuCz3qA016xANxA4s7tYev88B?=
 =?us-ascii?Q?/TGBkaDk4db7Rrfvh+kTTU6O?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb560103-2652-4c83-f4e1-08d9688d6ece
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 12:31:30.9569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLHCa9nWdGWKX+w/25Vxl3JWibx8bEtpolH2LC4qQ55CA8DkbV6WVaGt9oJnCE0HW2RiZNyDlP2mc3g7EmlPEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6174

On 26.08.2021 14:10, Andrew Cooper wrote:
> On 26/08/2021 08:23, Jan Beulich wrote:
>> While the specification doesn't say so, just like for VT-d's RMRRs no
>> good can come from these ranges being e.g. conventional RAM or entirely
>> unmarked and hence usable for placing e.g. PCI device BARs. Check
>> whether they are, and put in some limited effort to convert to reserved.
>> (More advanced logic can be added if actual problems are found with this
>> simplistic variant.)
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Paul Durrant <paul@xen.org>
>> ---
>> v7: Re-base.
>> v5: New.
>>
>> --- a/xen/drivers/passthrough/amd/iommu_acpi.c
>> +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
>> @@ -384,6 +384,38 @@ static int __init parse_ivmd_block(const
>>      AMD_IOMMU_DEBUG("IVMD Block: type %#x phys %#lx len %#lx\n",
>>                      ivmd_block->header.type, start_addr, mem_length);
>> =20
>> +    if ( !e820_all_mapped(base, limit + PAGE_SIZE, E820_RESERVED) )
>> +    {
>> +        paddr_t addr;
>> +
>> +        AMD_IOMMU_DEBUG("IVMD: [%lx,%lx) is not (entirely) in reserved =
memory\n",
>> +                        base, limit + PAGE_SIZE);
>> +
>> +        for ( addr =3D base; addr <=3D limit; addr +=3D PAGE_SIZE )
>> +        {
>> +            unsigned int type =3D page_get_ram_type(maddr_to_mfn(addr))=
;
>> +
>> +            if ( type =3D=3D RAM_TYPE_UNKNOWN )
>> +            {
>> +                if ( e820_add_range(&e820, addr, addr + PAGE_SIZE,
>> +                                    E820_RESERVED) )
>> +                    continue;
>> +                AMD_IOMMU_DEBUG("IVMD Error: Page at %lx couldn't be re=
served\n",
>> +                                addr);
>> +                return -EIO;
>> +            }
>> +
>> +            /* Types which won't be handed out are considered good enou=
gh. */
>> +            if ( !(type & (RAM_TYPE_RESERVED | RAM_TYPE_ACPI |
>> +                           RAM_TYPE_UNUSABLE)) )
>> +                continue;
>> +
>> +            AMD_IOMMU_DEBUG("IVMD Error: Page at %lx can't be converted=
\n",
>> +                            addr);
>=20
> I think these print messages need to more than just debug.=C2=A0 The firs=
t
> one is a warning, whereas the final two are hard errors liable to impact
> the correct running of the system.

Well, people would observe IOMMUs not getting put in use. I was following
existing style in this regard on the assumption that in such an event
people would (be told to) enable "iommu=3Ddebug". Hence ...

> Especially as you're putting them in to try and spot problem cases, they
> should be visible by default for when we inevitably get bug reports to
> xen-devel saying "something changed with passthrough in Xen 4.16".

... I can convert to ordinary printk(), provided you're convinced the
described model isn't reasonable and introducing a logging inconsistency
is worth it.

Jan


