Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C47BE474660
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 16:24:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246857.425741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx9fH-00028c-KF; Tue, 14 Dec 2021 15:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246857.425741; Tue, 14 Dec 2021 15:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx9fH-00025v-Fp; Tue, 14 Dec 2021 15:24:27 +0000
Received: by outflank-mailman (input) for mailman id 246857;
 Tue, 14 Dec 2021 15:24:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pVj/=Q7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mx9fG-0001sI-Mn
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 15:24:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e72cee7b-5cf1-11ec-85d3-df6b77346a89;
 Tue, 14 Dec 2021 16:24:17 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-Tv_BzGrHPyGH_wIxvVA-dA-1; Tue, 14 Dec 2021 16:24:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6302.eurprd04.prod.outlook.com (2603:10a6:803:102::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.18; Tue, 14 Dec
 2021 15:24:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 15:24:22 +0000
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
X-Inumbo-ID: e72cee7b-5cf1-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639495464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UtZxlfH8PKpS2a6kHCZoRLzPD8KLVCoENPmqGmdfmjw=;
	b=AkM5owehHrl1Ns3P9kKcg8cmCbO95VHpY5B31BCc/PAPK01LewUMpfUC40NBU///4kHSHF
	LLcJBQeWbz6FctkBU+vASdQh5UIXPB4NBm6uzdQSeOmKbAl9rJ3M+5knNaLcysC2xYBs1r
	HS/Tx8CjkEkPJ5UbCQDee9AaOTkmpVM=
X-MC-Unique: Tv_BzGrHPyGH_wIxvVA-dA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=atse2+mdvbLOEpvr47T5MGbdlK45H1j+klyO9FlKzsDRj/7BG6nSQB1OXYhRmIdtJ9D7MX3PITN2403Ut56dsaHG4tS0AlpUiLvZdL8Sb2GbiA+ib0GTbnJmTckP7VNIgHNl0+wAGhZmFEARMVgqhmafi2uX3UMU+za7LcLcrZoeUQNAzsekbixTqY84fKmu9FTnLpTSZjLrclprlQR7c+pmkI4fEN51WLbQ5d3z/G+wpEpdnSq61nIjHa2fy1j5szF8rbSFg41ZD4DDpz3ptBdVo/JJ2Z5Xl0zNUGgZuvw41saJLNkfap21SPWfg5I56msVJKlq800se8WW1UPMtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5j6m3dLNLPywJrdFr4gfP8MYpoFpIDzg+zstgRxf52A=;
 b=XW2x8KbHQl6gasW+bB8gxt7+FVfkGqjtcOqo9ab2plmeE+i6tPVdzX3eNaJzHFYsny7XWh7B4WwNzEuURD3DcENYISWgBvyuOCTzi5jKSn3Zo/Wa5Vy8tGn9TXXKnEzvGMzK52R6CE0+ONjLkHu8n4Y/pXhqN3WLvKfbprUUFBq3s2bGYqbPkKKh8Vn3p3kiRKEPSwp7IrJYJOenS6su8qBjeUjxaibs2iTmIlCIIzx0jxGirXc6b/sfs+Wlj060q++Rq5S9i8c1o3gG4zlIduDsfRlu2+sa4ShKtu2fi4aCs8xYhkehfDnnV7ucN8SWyg+7tCh20/JHTHYmGLOAMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <294a013d-f6f2-a345-3dfc-988ead108d49@suse.com>
Date: Tue, 14 Dec 2021 16:24:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 15/18] IOMMU/x86: prefill newly allocate page tables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <2656844d-47cc-70c3-d7ce-7d83967d576e@suse.com>
 <YbizA1adGRRIlcTv@Air-de-Roger>
 <d05185f5-7ef3-4a76-60d1-0db38041baae@suse.com>
 <Ybi1n5uyLop/4wh5@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Ybi1n5uyLop/4wh5@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f25957f4-404e-4e15-bf45-08d9bf15cdd8
X-MS-TrafficTypeDiagnostic: VI1PR04MB6302:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB630221ADB1D2C58B8577928BB3759@VI1PR04MB6302.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mi/wlS2BXLS+hW+ccSmp5zF5BGISFjbj1K13dZU+z3QjVKfiY0A4K2QPV068xLf7zt4rljbX2AMwpUPMuadixUsiokErLGx1KiqJT4nNtJgBLX74sRaUSB/IragLGRYZOG5DI+4OCP8dcdhna7IohFXprXxVJIU7qyOFPVVM2TFDgBzE6Vh6OkmFyZ5/qS4JBeObGPvqPh18q1zmWYU17FAMkNrsH5TUvo/xWCHG7pYnJ/Bldmv7SWN4HuL4/OMhnG9Ofl8klXNDBqG0S5xegDSV5Sod+lfM5zYlOU6ME270JkvCR2mhfD4cRPLRSkVkkNYGmX+OPxR9kd1uB7NKUM8D7izOEn52ZTBbZ3Za1V1ADe8eev7E0shYtkOpBkjjD86G1fJe29UDFyeM8L5/OM+ANu7XaDNWUTn6w6gADgnz1tjktLLU+mZfB8MUMRvgclKZTm/tPmLLyZ/j8LRd8ivjABGcYSu2OxxsnO0weqTmyMJu6hC8j46Rvryuv1l2hhCDhjON0gqcQf3YAEPkVHtNo0AS745B/ImO9uIHDKckkOMwY9rbUlmXAu4eUMU2u/NIHothtWoH1G9OG1RFZNRj5zCQG6gNk87W+9hC26Za0umPu8RS6egm6kLg2DwaMumrXKu2EM8qnSgukFH5iB2ttcmsgm/UPrmVN3113O/TAE4+OJHio+JRA+T+PucXY4vnLSUrXMiuUpUs61OfAgjwUN6kv6uEfLxiODAsDzPu0CyYtaJa2yJm9XbsvLkg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(36756003)(26005)(31696002)(53546011)(6916009)(2616005)(4326008)(508600001)(186003)(54906003)(86362001)(2906002)(8676002)(31686004)(8936002)(38100700002)(6512007)(5660300002)(316002)(66946007)(6486002)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rxv4HQB/aCMn7Kb5MTfozAclsxZ99gEcEuYyL5/5yoU1yCUuuNccfIcYqRlK?=
 =?us-ascii?Q?j1TUJXg/trp8/NT7/UFL205glE+JDWVotICPtQMfjL0nBRZtUjTmYT/ZxoY+?=
 =?us-ascii?Q?20YXzFKader93qne6efGB3akmCihPZjZew6soJQyknumqrKgDA7Ym0bhoN/d?=
 =?us-ascii?Q?hZe+bZFRUNolMD2sPpTdfmrAD8JhTUHEpNuLKt8mNdn4vRPO/mKhxmeeDaTz?=
 =?us-ascii?Q?l65l7rJgFwAIC7zfLRen5xnDh08zJnHqQ/a1unqnT+Aoa3F67AHt9McnIv/6?=
 =?us-ascii?Q?D+Nm0Xacgiy/omr2GBL8iTVrPpmUrjywxpfLGQTkz0zXVO99GlBAuH4qwoZ2?=
 =?us-ascii?Q?xXuTTLyBV38uignAowTzvB+OhabiqX48Qh1nQxmg8DyD8gQfGytdPp+1O9oY?=
 =?us-ascii?Q?RpF65oTqOnZKK+oi7vMB8/RjNJxjL3hdUHNQofNd6khfqeE2NtLHsna9HgNz?=
 =?us-ascii?Q?un3J+kMhc+PulQO0fzEThb3qoMQPa32uQYS3XqsXpjgH3UQ3Hb2aOQiyWo/d?=
 =?us-ascii?Q?LAkkRz34WC0Lvycv4GA5wckMQbhLvtwPEFSw2t+9Teiph3wlWIrL1TOC4kJR?=
 =?us-ascii?Q?Q2RS+MK5xUqm3NY2FR5ztj/8B6reULhIWGpX3EY6X1Bzw31m5fsSXnLt8foN?=
 =?us-ascii?Q?ESIr9phRMtM5VkmHGfBx2VdXT0IeDBSvuF10XLrH6HSps7fWtnAsz/PxkVQU?=
 =?us-ascii?Q?vDBRS6X+Qaocl3JE5pVqZWapTtlAC4jkGI4ewX70cl7CWDi0Z2zAbzN/T519?=
 =?us-ascii?Q?wYOzyNW85jCuTC2ghMD0MqnykyUYkV6phtgmZNmKwFMle50lQZZXOmhbDUpN?=
 =?us-ascii?Q?eImGMFpDpr5mfuPx8BccZQqWqx+r3gkLmm/+vNDqv73JGOH4ErPgYU+fasaH?=
 =?us-ascii?Q?VYOTxvkBfM4SWZlOxz2jX9FdJoscaM4UeHqrdwlNyGq9LttGPHKhJoJs9sJE?=
 =?us-ascii?Q?oLTkKApFzI9pN1ZhJw7deMS/zR0ZPSyqC2k895ium/jm+Tj/syduK01Q/XgN?=
 =?us-ascii?Q?/4vlA/3k/L4iyEakk81T32IZNXRG1qvN4T3YCaU2QLhMq07lsywmqnXGQB/u?=
 =?us-ascii?Q?lgG2EIPaBb4omGRCWWPgsfqwNbZq8mFuXhZoynkNSkfy8R4CgtItEJC11A2O?=
 =?us-ascii?Q?X9ADLs/fCvgeFIAnR6fhwgQwKGu0AiZpimlDr3Gq30lB5Y1LH+hap1WvmNhW?=
 =?us-ascii?Q?EVilVa61fSr4tfohw7tMggKeEuvcAcWiwwcaOIyPq4sl+cWqYkylFipoD1VY?=
 =?us-ascii?Q?KeRdgTDPavpNzZ/yqKaAfqhxBd+rTt/pHcJ7f91z/IX3FcBL1thfRtIf5/WL?=
 =?us-ascii?Q?HCZ+8/J17imKTOMa3G7Jvix7Bfor4JIVsA5oe3U/WZ6X6UP97dcxzfs73mbR?=
 =?us-ascii?Q?QWyKv50+U7noDshw/lpAd5NDB7FhCf0nnh4otsBZQSpWAPA5LP/1ny9Egi70?=
 =?us-ascii?Q?jQXDFxSdzEbVem+ANKGfXKK4NzmK+9LVEZG8e/MkpKveLwG9aMPGbSScaNv/?=
 =?us-ascii?Q?6X07xT9UFmHH/CWQhJk7TZYJF5CxVjRuI9V+EQQbfMqmwc7oevLHo2u4aEcf?=
 =?us-ascii?Q?9ZnwEZP2DTKStZSwS5c3u4rhZV8jtsCtepoocj2qZCwcmHs2iau/wBLFgIZn?=
 =?us-ascii?Q?WpWf7zWwOi9UG5KGF/LNC0k=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f25957f4-404e-4e15-bf45-08d9bf15cdd8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 15:24:21.9247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zM4a6zFn8jVI86CdGRyCmdk5sn7zwu3eXa1Od6QSIhh33wLoTv/MSlcHDvx+7oLkC7+hy906Yx8suKkq+gLkwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6302

On 14.12.2021 16:17, Roger Pau Monn=C3=A9 wrote:
> On Tue, Dec 14, 2021 at 04:10:28PM +0100, Jan Beulich wrote:
>> On 14.12.2021 16:06, Roger Pau Monn=C3=A9 wrote:
>>> Forgot to comment.
>>>
>>> On Fri, Sep 24, 2021 at 11:54:58AM +0200, Jan Beulich wrote:
>>>> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
>>>> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
>>>> @@ -238,7 +238,7 @@ int amd_iommu_alloc_root(struct domain *
>>>> =20
>>>>      if ( unlikely(!hd->arch.amd.root_table) )
>>>>      {
>>>> -        hd->arch.amd.root_table =3D iommu_alloc_pgtable(d);
>>>> +        hd->arch.amd.root_table =3D iommu_alloc_pgtable(d, 0);
>>>
>>> So root tables don't get markers setup...
>>>
>>>
>>>>          if ( !hd->arch.amd.root_table )
>>>>              return -ENOMEM;
>>>>      }
>>>> --- a/xen/drivers/passthrough/vtd/iommu.c
>>>> +++ b/xen/drivers/passthrough/vtd/iommu.c
>>>> @@ -297,7 +297,7 @@ static uint64_t addr_to_dma_page_maddr(s
>>>>              goto out;
>>>> =20
>>>>          pte_maddr =3D level;
>>>> -        if ( !(pg =3D iommu_alloc_pgtable(domain)) )
>>>> +        if ( !(pg =3D iommu_alloc_pgtable(domain, 0)) )
>>>
>>> ...likewise here.
>>
>> Yes. Plus quarantine domain's page tables also don't. Neither root
>> tables nor quarantine domain's are ever eligible for re-coalescing,
>> so there's no point having markers there.
>=20
> Quarantine won't be coalesced anyway as the same mfn is repeated over
> all the entries, so it will never be a suitable candidate for
> coalescing?

Correct.

Jan


