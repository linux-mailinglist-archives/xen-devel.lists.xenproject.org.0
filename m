Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1C742EEF6
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 12:38:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210256.367036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbKbY-0007Oe-JV; Fri, 15 Oct 2021 10:38:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210256.367036; Fri, 15 Oct 2021 10:38:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbKbY-0007MP-Fw; Fri, 15 Oct 2021 10:38:24 +0000
Received: by outflank-mailman (input) for mailman id 210256;
 Fri, 15 Oct 2021 10:38:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGCa=PD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mbKbX-0007MJ-Qv
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 10:38:23 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f823604a-943a-4258-a03a-e4e8fe6474d3;
 Fri, 15 Oct 2021 10:38:22 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-MSBeK08gPT-m0eZJPNvMeA-1; Fri, 15 Oct 2021 12:38:20 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3533.eurprd04.prod.outlook.com (2603:10a6:803:b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Fri, 15 Oct
 2021 10:38:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 10:38:19 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P193CA0084.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Fri, 15 Oct 2021 10:38:18 +0000
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
X-Inumbo-ID: f823604a-943a-4258-a03a-e4e8fe6474d3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634294301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0PRJW0H3ozAjWjSzUkYTXT/qhFFpxaaixVpFzRrqPR4=;
	b=c42Hno6AdHG/JYulzLHpnkUZ9Tg0Ji3Wfx6/bwwEfHKh9aHWt9LFxcrN+2/MKPc/OyZN4T
	I4ZkEwdNxpC4qFWOaLUuCpP8hPA6vdMiHqy35/tojQe2pbuJHQhF7Q3yWRl58n4AXDl2aU
	piHd/FQRv++LnnjGIAubtZqOb7tPP0g=
X-MC-Unique: MSBeK08gPT-m0eZJPNvMeA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6mcQAUHBT3fsGFxypMXIp6WIHDT5BmoZWSckuucGslvKfZk1bn9o+OYX+SenmCK0mSvdo9fbVo5PeutpLbOJ60gv7eBEPABr57psRvCSiH5wKI3Utxcc6WMMf0GXSw9H/k5E83Ocd+I11fK+epwLth/0pjm8ez04ff9/jHW8ehhIQEdas2lvZGoUxDg2eBMEXavm9+6rZIiYXDKATtUvE1Jevol7bZd1w7wt8f80StEtUWuld3LFEqs78sw9ZKg4t6T7Pvy0Kfm0X2AYjo+hXLfWhOAMS31v9QWpGkNGLWprIbUFjiGAl25LhRqVTtnQBiHu/bfp+WNx1u1PVnyOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0PRJW0H3ozAjWjSzUkYTXT/qhFFpxaaixVpFzRrqPR4=;
 b=OQ958Qn/QZjlAltJuUxwmmF/PK718RGYwXJaFEBjZeJja+iMrsRiin8HqFAnCjlW5r/G8rcx+HeCpi4vyDJMyRRjqvjDCbGs3UE94HBjJJvjDokkCJkCej/obMAeJHUx40hZHDntnMrFkZ7wGoH1ZtarcPjDhX8AR/MgwsPN6pjzRZo1Z2xn1O4Nxmb+nIQT3Pq9ZUUvlQMRHKtSyUONqXToYxAfzGqxfhnsaJkserCSlSZGeHdwMBv0Lbr3LqCIjuoHhMiKW3eYFK6PZeLwiEJU75QgECZohPqkAjigwzRhBa2VmsBcE3bdg3o8ZYZDNrGyQhWoHGiH7Dkou8B2cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "iwj@xenproject.org" <iwj@xenproject.org>, Rahul Singh
 <Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <396b08e2598cf0338e0c7f4ad3cd5cb66db89224.1634221830.git.bertrand.marquis@arm.com>
 <f41f59f7-69ed-e2fe-dc17-434b456cf693@suse.com>
 <57A39480-34DF-4BF5-9B0E-802D30F94BBD@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <31419c19-2783-593a-04a9-9b0e1ae101e1@suse.com>
Date: Fri, 15 Oct 2021 12:38:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <57A39480-34DF-4BF5-9B0E-802D30F94BBD@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0084.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43a9e7b6-224e-43d8-31f1-08d98fc7e73e
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3533:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB353379B448B68EF8D99894C9B3B99@VI1PR0402MB3533.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	25yYNqdpjcpbIQLI/jq9Zo0D0qirpw+ZeJ8Cy8VV61eN3fO7flq2q772dj8iKM6TR/ujARqAbodzzrqMOSQPGzd2M4I9AiYwgCIOkRmqb3opnK3EdneTvod0GONoy1fXU+9Wyx/v839418Kc43C3NDei8STh3/nGgYbWsCJ2W124Vf+okaCbowThvu7pzWUqAhLN7E1E0baTdyAayUF86NRq4Xg8x3UUylNS6YVS/nft14WDKLRjpkjFOAM7eEXJfFwTmhzxhxdSJQU8MzH30vdbNyFI2kcXqJw/N1tbfcALg57fIGvhqTBH8cKsFtZ5JZgsCH/0UgigyEGWIAcN0Ou6UGWbuxegpaqWNt1iIJnXXoDWJ2g7zv/tUIEjOa33NMaiAhlL1oN4KB2X1dTXb/KA0l4U3h8/wn9bpJzqdgLyqorXHx+ETnzZmV+Qy5OjuJE5a6XJBu5MM9zfM8sK911iGdxWWauiCwQC/h4KTTRPDZkswaFxGtWZ9/GjbU+N8Cm+gwsg9Byr9mnVDmVNIgdRY+YooKphDN8qiSZ1vPojDunMcFXisqPY+6xAzbrF9nym3oOtdZ+pD0aEIeirzgpRLVa/tw+NawVQAxXbWgb3m6h22uWwol+yXXIWff0u17ZEgUGmlt5+uAZYRUw/vuGzUioljKxMy7DfzxLWE8+yQP8ni0ioJCswNSzLCAyC5eB3J2SIX8RlwSEA4dO3KvkvVPbGUwCZyLhyrpX87QI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(7416002)(4326008)(66476007)(31686004)(66556008)(8676002)(83380400001)(6916009)(5660300002)(8936002)(6486002)(66946007)(86362001)(38100700002)(31696002)(2616005)(36756003)(2906002)(186003)(53546011)(54906003)(956004)(26005)(16576012)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkVoSlR6UkNvU3k1MmZsMTVmc2Z1SWZPaWtBSE9jOExZbCtuempzRUE4bFFv?=
 =?utf-8?B?S2RoY0NNRDF1RzhGRDdsUmRjUWhrQVk3OHNWZ3dHbitqZkV0YStMVHp4RmYz?=
 =?utf-8?B?T0JKc3lhQjBKYTNCcS9wQVh5SThwVmdHUFZYS3V1M2FUUm9OR2JiVDZJT1Nr?=
 =?utf-8?B?dXRYTm0vOTlnNjJQeEw5T0ZTQ0JybzF3Ty9wbk5uUHNYQmVvZEh6VTVUbTlH?=
 =?utf-8?B?elJkUyt1NElHZ08zMkdMVjh4M05GbjkxcE9ad2NzQ2ZNUlg0RExlNXB6Tncr?=
 =?utf-8?B?VHU0c0Z0d3p4TlE1a0M4czEydFlhbnV0eWp6eHFoRzNzTzltU3VhRDkwSC9R?=
 =?utf-8?B?cUp3UmdsV2ZLM2dKTE14eTEyanJYb0RhNEZ6TzVXSDBZbG4yVGlsNEdRUWxv?=
 =?utf-8?B?Y0RZaTdIMkFPaXdJL2w4RUh5ZTEyRDdlVi8rNGphOGRDcWRHNVc1VjVad3lI?=
 =?utf-8?B?ZzRjOGFlUW1CblNJd1FoemF3YnR2My9MbHZiMytwekZwK3dkUE1XbE42SWk5?=
 =?utf-8?B?ejh3bU9BNkRBa0xzcklpL1Z1UFdPUHZSYjhFSE1iN2pZQkpkWkNuNExuaGFD?=
 =?utf-8?B?b29tbG5sZ08rSEFnTmI1cjJuazhNSjFYT0FkclZDMjhrMlhoMUdiYm5xUFVq?=
 =?utf-8?B?T1o2SENVeVBLMUozS2NYeG81OXRBaTlYSDR1UDA3WGdtc1htZkYvdFlVODZa?=
 =?utf-8?B?OE1KQWlRd3hBQlVRRWJ2akhlQ0ViQjlDMkUrOGt3RHdwZmVCbnRsTGdKOWpj?=
 =?utf-8?B?ODNVcTVGVUpPTHdzbjhPcElqTGlFSk1ROWd4VEUzT0VNWktUT3VoMStNYk9H?=
 =?utf-8?B?VHRKRGJzSVhxajZyMzBhM2hqTkhMamhZZlRmcjhSUHduZjhXM2phNS9BdE03?=
 =?utf-8?B?dVRqZ3pNcU9VWFhSTkhIak5kcHcwNU13SHZZT0RWcHI0TGVUVmRZYWFsMGpm?=
 =?utf-8?B?bHM5N0NkOXF0SWY0T2N0dlJoNjJJQUJDSEljVmx6aytZNzNvdHBPKzFsOW93?=
 =?utf-8?B?eGE2VDhybjJXYitnRjBQeE1GRkNMQnFEcnBmNFFEWlAydytxUVNFajRRaVZm?=
 =?utf-8?B?dTNjOG5seDZoSkcxekNjelN2T2Vsckt4bW5JYVNxM0lLVG9xcXRkZnZ4YzVF?=
 =?utf-8?B?bGJlWWdVMi80dWlmT0tMOEUyNkMvcHNCMW1TSWgySEZyQ1NmSm5XN2lBcm9z?=
 =?utf-8?B?dDJhZE1PRkpCYnFaTjVudTR4LzZtLzZKQ2pOOGxibWpQSEU2K3NRTTdVSUVV?=
 =?utf-8?B?ZXJVUjlxVmV1U0hFVXZRYURCbUg4Wi9HeUMwVjRWUitlUUZwejlSSDFpUGdB?=
 =?utf-8?B?a2x6RkdwTzRJcEdlTDUzOENOdzJzNHR3Zi9mUXcxR1QxRlhMOEhMV2MyMTJP?=
 =?utf-8?B?VXpockw4NjlrU1JNZjM5MUllUkNJeTZOMmJzUHNWN3dHSGVLR2xTd2orTXd2?=
 =?utf-8?B?ZHlsZVBrU012aFNkbmxNNlBsaklUZ0pXTzNnNkFvZ05tTzNlbUhsYVN1aDhH?=
 =?utf-8?B?cndYZGliRUFvVW9la2RlTm1YZ3FwVnkvdFFrMDlGODg4SHZpejA4dEY0UjVD?=
 =?utf-8?B?dnE1OEJRTThxRFFUVHhiV3l6bEJRaUtNSjh1c1pBL0poeTRjVklMUU9ZRWZy?=
 =?utf-8?B?aytWMHp2L1RyNUEzUnBLVHF2cEhkY0MyWDV4WGlFVXNqME80djliOElKS2JI?=
 =?utf-8?B?UW8yYXJ4RzFSdDRQOXhxYzJrdWtlMmcvdCtlaTNUTzFVU2dPVVJEaDRlMndB?=
 =?utf-8?Q?Z5zvlaapOTF6HwKtTjetoV6XYAGLdwVKl7lWPyS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a9e7b6-224e-43d8-31f1-08d98fc7e73e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 10:38:19.1352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZxcUa0ni6Sp9UrKKoIv2SYr/9rhLOmYF1x4B58oW/JydTzHW10d0bgeTcaEvPw3hbUg3UOp9xbOcNtZkEPBMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3533

On 15.10.2021 12:09, Bertrand Marquis wrote:
>> On 15 Oct 2021, at 09:00, Jan Beulich <jbeulich@suse.com> wrote:
>> On 14.10.2021 16:49, Bertrand Marquis wrote:
>>> @@ -752,6 +752,19 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>
>>>     check_pdev(pdev);
>>>
>>> +#ifdef CONFIG_ARM
>>> +    /*
>>> +     * On ARM PCI devices discovery will be done by Dom0. Add vpci handler when
>>> +     * Dom0 inform XEN to add the PCI devices in XEN.
>>> +     */
>>> +    ret = vpci_add_handlers(pdev);
>>> +    if ( ret )
>>> +    {
>>> +        printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
>>> +        goto out;
>>> +    }
>>> +#endif
>>> +
>>>     ret = 0;
>>>     if ( !pdev->domain )
>>
>> Elsewhere I did point out that you need to be careful wrt pdev->domain
>> being NULL. As the code in context clearly documents, you're now
>> adding handlers before that field was set. In comments to a prior
>> version I did already suggest to consider placing the new code inside
>> the if() in question (albeit at the time this was mainly to make clear
>> that error cleanup may not fiddle with things not put in place by the
>> iommu_enable_device() alternative path). This would have the further
>> benefit of making is crystal clear that here only handlers for Dom0
>> would get put in place (and hence their installing for DomU-s would
>> need to be looked for elsewhere).
> 
> I asked Oleksandr for confirmation here but on arm there will be 2 other use cases:
> - PCI own by a DomD so device enumeration done from there
> - dom0less with devices detection done inside Xen

Question is whether at this time you mean to handle all these cases.
Installing handlers when device detection happens in Xen might need
to be done differently, for example - e.g. more along the lines of
what x86 PVH Dom0 has done.

Anything you don't mean to handle (and is safe to be left out, i.e.
without breaking existing cases) will want spelling out in the
description.

>>> @@ -784,6 +797,9 @@ out:
>>>                    &PCI_SBDF(seg, bus, slot, func));
>>>         }
>>>     }
>>> +    else if ( pdev )
>>> +        pci_cleanup_msi(pdev);
>>
>> Have you thoroughly checked that this call is benign on x86? There's
>> no wording to that effect in the description afaics, and I can't
>> easily convince myself that it would be correct when the
>> iommu_enable_device() path was taken. (I'm also not going to
>> exclude that it should have been there even prior to your work,
>> albeit then adding this would want to be a separate bugfix patch.)
> 
> This was not in the original serie and requested by Stefano. I must admit
> I am not completely sure on the details here so I am really ok to remove this
> but this would go against what was requested on the previous versions (4 and 5).

I understand this, but a request to add something still requires that
it be checked that the addition can't have bad effects in other cases.
A compromise here (which I wouldn't like very much) might be to add
another #ifdef CONFIG_ARM, solely to leave the existing x86 case
undisturbed. Yet then, with the called function doing nothing on Arm,
not adding the code here might as well be an option (which it looked
like Stefano would be amenable to). A TODO item would then perhaps
best be left here in a comment.

>>> --- a/xen/include/xen/pci.h
>>> +++ b/xen/include/xen/pci.h
>>> @@ -40,6 +40,9 @@
>>> #define PCI_SBDF3(s,b,df) \
>>>     ((pci_sbdf_t){ .sbdf = (((s) & 0xffff) << 16) | PCI_BDF2(b, df) })
>>>
>>> +#define ECAM_BDF(addr)         ( ((addr) & 0x0ffff000) >> 12)
>>> +#define ECAM_REG_OFFSET(addr)  ((addr) & 0x00000fff)
>>
>> The latter is fine to be put here (i.e. FTAOD I'm fine with it
>> staying here). For the former I even question its original placement
>> in asm-x86/pci.h: It's not generally correct as per the PCI spec, as
>> the bus portion of the address can be anywhere from 1 to 8 bits. And
>> in fact there is a reason why this macro was/is used in only a
>> single place, but not e.g. in x86'es handling of physical MCFG. It
>> is merely an implementation choice in vPCI that the entire segment 0
>> has a linear address range covering all 256 buses. Hence I think
>> this wants to move to xen/vpci.h and then perhaps also be named
>> VPCI_ECAM_BDF().
> 
> On previous version it was request to renamed this to ECAM and agreed
> to put is here. Now you want me to rename it to VPCI and move it again.
> I would like to have a confirmation that this is ok and the final move
> if possible.

A final confirmation is, unfortunately, only as final as it can be at
the very moment it is given. It was the MCFG vs ECAM naming discussion
which made me pull out again the section in the spec, reminding me of
aspects I didn't previously take into consideration. I'm sorry for
this, but it's an iterative process on all sides.

So, FTAOD, as a maintainer of this headed I will continue to object to
a non-spec-compliant construct to be put into here. It'll be Roger,
being the vPCI maintainer, to confirm that putting it in xen/vpci.h is
fine.

> Also if I have to do this I will do the same for REG_OFFSET of course.

As said - that one, being in line with the PCI spec, is fine to remain
as and where you have it.

Jan


