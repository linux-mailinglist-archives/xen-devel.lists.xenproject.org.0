Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A445A4A8163
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 10:22:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264549.457669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFYJY-0003lk-RO; Thu, 03 Feb 2022 09:22:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264549.457669; Thu, 03 Feb 2022 09:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFYJY-0003iK-Nm; Thu, 03 Feb 2022 09:22:04 +0000
Received: by outflank-mailman (input) for mailman id 264549;
 Thu, 03 Feb 2022 09:22:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTfZ=SS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFYJW-0003iE-MU
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 09:22:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bde9eb0a-84d2-11ec-8f75-fffcc8bd4f1a;
 Thu, 03 Feb 2022 10:22:00 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2059.outbound.protection.outlook.com [104.47.9.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-fH1YoKenOyS5f6QS9X-8SQ-1; Thu, 03 Feb 2022 10:21:59 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB9105.eurprd04.prod.outlook.com (2603:10a6:102:225::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 09:21:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 09:21:57 +0000
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
X-Inumbo-ID: bde9eb0a-84d2-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643880120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RNEnHKdAcwJyjLFMBZa1qMp9ftVYkRele6HWYd3ZhEI=;
	b=m6hz9hCEI7x5P3bwpFJNrSsgksj+YXBPKnJhGNXkv5/FyCqD7nyX/P7PKt2ekUwtvfVc0U
	/LR7bCE/VcKWzPv296iiqVk+CnZ8Hg5SW+QIamsW23y19MW0g4Lm8YxQDkYE4cwu4uiBbC
	S6qqvNnkprjPtDCO4kADxeSQuLUVnPI=
X-MC-Unique: fH1YoKenOyS5f6QS9X-8SQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNdlCed5w5Vt6cvtP/3lWewuD6pwZCuKISJ2CFfq6+6KEUnqjS2M+vTo6JKvhjwA63OIGO22bpr0q45g0mJrmMGYWC1wF4rIBJ9fgJL9gcjnUl9blIaPTPzDXfivzeXcMzefj3nXICNWB1zGizk4SRhd01+7LlpuIHfmamnemrKAoM2w2uft+43SUx+DZeMmHS5DbjXCe8uLF0hx5E0IjMDhkqB4zOGSBr8Qh3MUEEcEx3k9IWpyqZuMvIN6G2LiSVcvVaIBCpf8HoSf/ny8QeYmb/iUpmXO2bjrIEyTRcG5sZZEKbP9xX1Uc694DWhF6WSx4+fc+ebl6ZmuDd1bew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybZ7fVeG4BCzRYN4EowpOl+XVaC7V3n0qFG0YeMTT00=;
 b=HrZW8/u5TgSgqMQjOBf9ElGQlSWrX/v1b7b+U1kirOToMM2R6foOkkYg8lv4LZqBrLgtxl4U8K6MyXUVYzeor7vGt4ASKdFWDnlwpFHUZMJZuDUK19UO5SsQRfZvXteA/DkS/HivjqsBWCar9cVyQdUreNVq973CPIlpU3Ke1qbxbyVea6CEvKBy6+31l/gkR81UF5PSvWqmUsuuxQGPSVb8sitdo9mX7gFzSnpqQlwBiOD1SCgiaeCfwcw1VdbRsh3Va7OdnNmuqNbq+ZL4JQxkE9ioaYh7dXACZ4eIm8KZAlPcmk71ycG6E1dp47m2gpfwjpa6rBKotJ+FG2BlSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7c315902-e618-bba6-054d-86b0aa685370@suse.com>
Date: Thu, 3 Feb 2022 10:21:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/2] IOMMU/x86: disallow device assignment to PoD
 guests
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>
References: <6fe7b036-2bdb-b391-4e6c-1b5d7e05a119@suse.com>
 <b0a77526-17f2-a5ab-6f7f-1b3caeb4a59b@suse.com>
 <YfqtlZMAKd/HXsgf@Air-de-Roger>
 <2cd051c8-dac0-998c-cced-401c504ad439@suse.com>
 <Yfuahx0ntHJ2BQ6x@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yfuahx0ntHJ2BQ6x@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1a13b6d-f03b-4533-35c2-08d9e6f6a02d
X-MS-TrafficTypeDiagnostic: PAXPR04MB9105:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB910518DB1F8DB74AD768B90AB3289@PAXPR04MB9105.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hf2HORtJzShYi7hJe3GPkNigJwF3EmRsbzFB867YmSAJhMplh8m7GQ8k+IKgJV4wcIhfq89NuokQp7zdhJUzetOP6qQQIKtJiVTMGhtpIvFhoBDLCUqvZVZB6DcJp0osVt9lrFxDtSPUJgWtcPgu71LSI9LOtUwVC9WWx0NpX/HA9/14Waxy5ArLiN4862n6ZUeCgvjecT/WJpvZtrTvA184zw/h9k/O6IgvveMQBcA1c2cdvDcFM4sW5Klt4ZsL3qd56Aer/5ytgRbU1ASv8zmTP4dYE0XEKDZA0FAVgs7USW52RR5OAdU3vxwRxyUu+jb0RflvWyhWu3KYEktOW2u+eFV2VIQveBhb8+eec+pt+Kp2Dp0nyrYbdZKJLztH0lQoravWdBeRlGXAMVt9VutO0/LT+0NMCWUTom1ipnS6tXW4JxOMfjpk0er5+Zrmw4iIRxztsFU1e5T3f8NWB0VHWz19l6Kz4lYle9aW9aa/bVcOg6JVZl59dN1zcVr0DEu0OCblM6Fjj4YXKkVGrGv7e9MhSTddODOMhl1rhZFcYGDQjrxS3riOGIMuDrmn0lmjnFG/n53ZBBv5UICHuIGcAhCf+WLjfLHx+fNYlvcSsSJbVRlfGHJBWeSZyLHUcei/hgkCQ9KRnp3q0+7sHYagFqtPOpRHEm4SCMyqUmBGMrnZuARN9ZYILmK1OnN1X7CF7QdYgZSVqj5SMPxSRqfBFpnRfdebs8DAr9X7iMg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(316002)(6916009)(31696002)(86362001)(5660300002)(8676002)(8936002)(83380400001)(66476007)(66556008)(2906002)(4326008)(53546011)(31686004)(66946007)(6506007)(6512007)(6666004)(26005)(186003)(2616005)(36756003)(6486002)(508600001)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4l7E5riPL04JJhu+YvVy7B3BEma4yZ5gRV9X2At9emhINzKk6DsUPYdJy2Y9?=
 =?us-ascii?Q?DUiPNuBaO+yB3lGpFZkPygNL+bGa7xhNGu8dzh+5xcaCdvOUdthYTVBiVomA?=
 =?us-ascii?Q?v6AMx2vtanHmwv6t9d6eiNes2x846skGMxnxcWIDcqda/I1FN26x3HzWXjej?=
 =?us-ascii?Q?ykSsMfPT4jDyyTr4BH8BVt/CEHkfVgaFV8OphCEL28fbZgPGYTe0vvAiyPRT?=
 =?us-ascii?Q?ZG+1zR4hlvt+WWrSXI/xi+Ld7++c97P69KthXiXRRcx4BebZapAtJ430yKbn?=
 =?us-ascii?Q?E07oMvKgazgS1VTdYhhgYqN+/vxAXMWklgetOZzr7Y1dBE+BgbaREp8IPIEL?=
 =?us-ascii?Q?R5tCbQqZoM9FDUtjcVpAI5VNj1Yo05WladZ1OK8HvzTj6l64IoWe78BsdXB3?=
 =?us-ascii?Q?vyXpUQp88JZqOotkbEX4In2EcWyxvcmrY7PqVNqjzlfMRMQfqXs8XIrxFJ4g?=
 =?us-ascii?Q?MKrEQNm2wxvXaORLVU0h6wduAOOAzeaFABrEueyiKqtVwRNvYHF3abtT6I51?=
 =?us-ascii?Q?yFFyC58P5RXctf5i/AHhcVGYDIee5jJsytE2Ae17+QH9Oq5CiMKK1aPWHGCw?=
 =?us-ascii?Q?Up9YiTVKlGO/O6jcGXG7rNgA9V7QbLeEUZpBR8eVSyIyZV6wCmk5QFHeehAH?=
 =?us-ascii?Q?YtgVZgC0qHHQA2ZmGPjhoQdkn1G1Disw84pDBY2Py5lfUj7hEBkI9GJ3ukRA?=
 =?us-ascii?Q?qYhSWKIdKcTsl5D9lrdE7iWLN5QsXFuJo6iB+4NMD/YIxi3xW4GlqSw5d1Ga?=
 =?us-ascii?Q?h256pqIgUDeYG6cYTfeJUXP6qalVBLnqCs2UUszK9ot/l8r0VE6sgY3u8+Du?=
 =?us-ascii?Q?DZ4ts+mrW4WdqsBeSIk6U3UizB2MOIhWesO6QQpo3LC2WYEjn+IO3JTUQLpo?=
 =?us-ascii?Q?lVv0YdOChXc/1hiQP/8vP8n8wnKpXqUI+pO9XScxZA3eDHKb5RAK2RP6HGq5?=
 =?us-ascii?Q?zsy0tfVVvdYadU7V+qfBPqO8uC7tJmGZ3N+p8qIghwqFgXKkjkR0uGkSYkOy?=
 =?us-ascii?Q?Eb7EIadNGTs+Ze1VhBvkPS+Y2Bx0dXstYiJmwEJlNr4OFtFs/HUTVE7N1DqO?=
 =?us-ascii?Q?wIguI0Ls73a+e2Epz9tbubCN43Y7+6f2jTpeH8duSRWL8/duwb9B70PFqsH2?=
 =?us-ascii?Q?7kaYZPmUubiazMtp6NqrrHWtwvtSVjORsAobKqmmbgzNFh2fsTHrevbTJPwY?=
 =?us-ascii?Q?KbpV5zkHngsQW0bbf4ymgaUZmQRM0oIZLdA3CU+aBBn5f9HXibdzJwG4VPVp?=
 =?us-ascii?Q?gog/PKkDtYNqD/2wqizvlTGBktGubKfWccpS0g5rZw5Chw6kPEIL41rJhiTL?=
 =?us-ascii?Q?2VYNS3JqU0N+pmnWEIhlQzX1ujuhnClh0zuAUmDizg49tdv62wv6vSiJmEAB?=
 =?us-ascii?Q?fGrRkPydBpbdb/YRAHz0TMfRL6Sn5M9tj9hXNlBzAenyRC/5xEsxHNhbEDEB?=
 =?us-ascii?Q?1g1lPU986a6TR066nXlT8KvGDOFieqi7249e9QxZkR9f6ZY4JHsfgPa7oe4Z?=
 =?us-ascii?Q?V4UTa+7VDA3ocxCb++jvu7t3ovcj78wQeNdUQD7dsOTtJEDG+khD4KXweUAK?=
 =?us-ascii?Q?PSjMKD5TGfoEB3Qr9XmzOpc1Wl4TiaEgH7DXLsw9sMIXy7ojZRIfhMH/A9xC?=
 =?us-ascii?Q?HPNlTpuVWAeFJ3zvNQLMt0g=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a13b6d-f03b-4533-35c2-08d9e6f6a02d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 09:21:57.4390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OaaGkSQAzZLI9/R8DmgmMZ9zrJ6xt7HJ6BZV3PVj9Jq5f/9LozNw8CAT74H0N7SuTGWFiXXbwGlDAc5zbqVI8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9105

On 03.02.2022 10:04, Roger Pau Monn=C3=A9 wrote:
> On Thu, Feb 03, 2022 at 09:31:03AM +0100, Jan Beulich wrote:
>> On 02.02.2022 17:13, Roger Pau Monn=C3=A9 wrote:
>>> On Tue, Jan 04, 2022 at 10:41:32AM +0100, Jan Beulich wrote:
>>>> @@ -359,7 +360,10 @@ p2m_pod_set_mem_target(struct domain *d,
>>>> =20
>>>>      ASSERT( pod_target >=3D p2m->pod.count );
>>>> =20
>>>> -    ret =3D p2m_pod_set_cache_target(p2m, pod_target, 1/*preemptible*=
/);
>>>> +    if ( has_arch_pdevs(d) || cache_flush_permitted(d) )
>>>
>>> Is it possible to have cache flush allowed without any PCI device
>>> assigned? AFAICT the iomem/ioport_caps would only get setup when there
>>> are device passed through?
>>
>> One can assign MMIO or ports to a guest the raw way. That's not
>> secure, but functionally explicitly permitted.
>>
>>> TBH I would be fine if we just say that PoD cannot be used in
>>> conjunction with an IOMMU, and just check for is_iommu_enable(d) here.
>>>
>>> I understand it's technically possible for PoD to be used together
>>> with a domain that will later get a device passed through once PoD is
>>> no longer in use, but I doubt there's much value in supporting that
>>> use case, and I fear we might be introducing corner cases that could
>>> create issues in the future. Overall I think it would be safer to just
>>> disable PoD in conjunction with an IOMMU.
>>
>> I consider it wrong to put in place such a restriction, but I could
>> perhaps accept you and Andrew thinking this way if this was the only
>> aspect playing into here. However, this would then want an equivalent
>> tools side check, and while hunting down where to make the change as
>> done here, I wasn't able to figure out where that alternative
>> adjustment would need doing. Hence I would possibly(!) buy into this
>> only if someone else took care of doing so properly in the tool stack
>> (including the emission of a sensible error message).
>=20
> What about the (completely untested) chunk below:
>=20
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_cre=
ate.c
> index d7a40d7550..e585ef4c5c 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -1160,17 +1160,16 @@ int libxl__domain_config_setdefault(libxl__gc *gc=
,
>      pod_enabled =3D (d_config->c_info.type !=3D LIBXL_DOMAIN_TYPE_PV) &&
>          (d_config->b_info.target_memkb < d_config->b_info.max_memkb);
> =20
> -    /* We cannot have PoD and PCI device assignment at the same time
> +    /* We cannot have PoD and an active IOMMU at the same time
>       * for HVM guest. It was reported that IOMMU cannot work with PoD
>       * enabled because it needs to populated entire page table for
> -     * guest. To stay on the safe side, we disable PCI device
> -     * assignment when PoD is enabled.
> +     * guest.
>       */
>      if (d_config->c_info.type !=3D LIBXL_DOMAIN_TYPE_PV &&
> -        d_config->num_pcidevs && pod_enabled) {
> +        d_config->c_info.passthrough !=3D LIBXL_PASSTHROUGH_DISABLED &&
> +        pod_enabled) {
>          ret =3D ERROR_INVAL;
> -        LOGD(ERROR, domid,
> -             "PCI device assignment for HVM guest failed due to PoD enab=
led");
> +        LOGD(ERROR, domid, "IOMMU cannot be enabled together with PoD");
>          goto error_out;
>      }

Perhaps. Seeing this I actually recall coming across this check during
my investigation. Not changing it along the lines of what you do was
then really more because of me not being convinced of the extra
restriction; I clearly misremembered when writing the earlier reply.
If we were to do what you suggest, I'd like to ask that the comment be
changed differently, though: "We cannot ..." then isn't really true
anymore. We choose not to permit this mode; "cannot" only applies to
actual device assignment (and of course only as long as there aren't
restartable IOMMU faults).

>> Finally this still leaves out the "raw MMIO / ports" case mentioned
>> above.
>=20
> But the raw MMIO 'mode' doesn't care much about PoD, because if
> there's no PCI device assigned there's no IOMMU setup, and thus such
> raw MMIO regions (could?) belong to a device that's not constrained by
> the guest p2m anyway?

Hmm, yes, true.

>>>> --- a/xen/common/vm_event.c
>>>> +++ b/xen/common/vm_event.c
>>>> @@ -639,7 +639,7 @@ int vm_event_domctl(struct domain *d, st
>>>> =20
>>>>              rc =3D -EXDEV;
>>>>              /* Disallow paging in a PoD guest */
>>>> -            if ( p2m_pod_entry_count(p2m_get_hostp2m(d)) )
>>>> +            if ( p2m_pod_active(d) )
>>>
>>> Isn't it fine to just check for entry_count like you suggest in the
>>> change to libxl?
>>
>> I didn't think it would be, but I'm not entirely sure: If paging was
>> enabled before a guest actually starts, it wouldn't have any entries
>> but still be a PoD guest if it has a non-empty cache. The VM event
>> folks may be able to clarify this either way. But ...
>>
>>> This is what p2m_pod_entry_count actually does (rather than entry_count=
 |=C2=A0count).
>>
>> ... you really mean "did" here, as I'm removing p2m_pod_entry_count()
>> in this patch. Of course locking could be added to it instead (or
>> p2m_pod_get_mem_target() be used in its place), but I'd prefer if we
>> could go with just the check which precisely matches what the comment
>> says (IOW otherwise I'd need to additionally know what exactly the
>> comment is to say).
>=20
> Could you briefly mention this in the commit message? Ie: VM event
> code is also adjusted to make sure PoD is not in use and cannot be
> used during the guest lifetime?

I've added

"Nor was the use of that function in line with the immediately preceding
 comment: A PoD guest isn't just one with a non-zero entry count, but
 also one with a non-empty cache (e.g. prior to actually launching the
 guest)."

to the already existing paragraph about the removal of that function.

Jan


