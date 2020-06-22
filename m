Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FE720387B
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 15:52:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnMrV-0001dR-Fd; Mon, 22 Jun 2020 13:51:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ahnO=AD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jnMrT-0001dM-1h
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 13:51:47 +0000
X-Inumbo-ID: 8268a1ca-b48f-11ea-b7bb-bc764e2007e4
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.42]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8268a1ca-b48f-11ea-b7bb-bc764e2007e4;
 Mon, 22 Jun 2020 13:51:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SA9YtEe5CQSzAGsGhrPjEbuj1CVjLI6hfAxpJrtWLKf9B6QGNPfmWVsaOJMV00i5WqM/zzfYKD3EQfuyLabGuvjZ52bnIWuHliOON6a/VhKAXCffNU+yeI2kduxKw9ZVbUgCyeZAfuXszulf6uh/9NQuVdZTQuGMxhoBwCTevZ1oGFyIw9FO5kPww3p2ETysF4bfoGfRcXlYBUumhxZJ23BtaBJ8aiQsojKnzERN5x9YK60CLfc02kJJFPIuey33qcWuZxipfQ/EwBzBRTsUTNJNplqJoMHEPmprvW7K/6gKaQ1FbP+M32z72zS20WsY3Yu3lfNefL+ZP/gaNLusbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hujfMTMP0tIzoS1jqk05YbwQnrnj3UD8mmZHlQTgdfs=;
 b=gdStSaHbbzExRbbhFyOeqOnFyoe99h3gXV8mdJHBUWcHQ1swTpMX3CQAx6XUwdRf0dYeAHvPSY2gveWdcyX0uGTFj6Co/EU0x0qWM/b3rAedGVfrPOffbBLsW77Ga7cZYdhiMhDxhkCirqU+3/PZ8hMIAddVqm75dXTY18fWpLbmOtofHEwDgIv+QH5fqeGWvIpm0X8+OTTTe7MYpHMhjP6pUvDr7HsTfrdgU+C+4xrKZvEpQUyBdL1KaXUFs9aj1s4j/MqFhDMUhkPKki2FwngSijMPlRrH2+o6CdQsTWo9gNcOuuUwS6qFqsyenBRTz9ZKCTEuAL7QDhDXDwHgtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hujfMTMP0tIzoS1jqk05YbwQnrnj3UD8mmZHlQTgdfs=;
 b=hyAB76lKO4lVxfsJsKKccGEBwpWRl1luMB8nPwowCEYqqVeQUbE6hOk7gnOxBbAT7fda16ke8ToKpFubv3M9A1iBW+lfrlah0ARAnUHtbOMUd/A7U96DBDEL4FO7CMo68FcrQHnJD4Yn4M366FLfrX5nHFxbqZeZJQklVrL33KrEGbyuWX5mgTjT00w/GBsPN8FySgZSKh2o3CAlVQSfXGxXvrue6Xzl4Ng2b/f4dkiXyX0cP3IoBURWdoTO7GLGKxiLI3g7Z+g3XZ52tO71l/dsycwS1FtAIWEHSuUlc9fDhs+IZTZsK7usnYUbzT6c1pT2wHB4+DJcXAWQd0j6ug==
Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5309.eurprd04.prod.outlook.com (2603:10a6:803:59::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Mon, 22 Jun
 2020 13:51:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600%6]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 13:51:43 +0000
Subject: Re: [PATCH for-4.14] x86/tlb: fix assisted flush usage
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200618160403.35199-1-roger.pau@citrix.com>
 <0b6c900f-e2a6-c9b1-0e57-68c6898150a9@suse.com>
 <20200622093123.GI735@Air-de-Roger>
 <5ad66ef4-9406-f35a-5683-ac4608242dd7@suse.com>
 <20200622132410.GJ735@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b3142168-09c8-67e8-d210-05f54761051c@suse.com>
Date: Mon, 22 Jun 2020 15:51:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200622132410.GJ735@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM4PR0302CA0022.eurprd03.prod.outlook.com
 (2603:10a6:205:2::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.60.99] (37.24.206.209) by
 AM4PR0302CA0022.eurprd03.prod.outlook.com (2603:10a6:205:2::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Mon, 22 Jun 2020 13:51:42 +0000
X-Originating-IP: [37.24.206.209]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b4e4b0e-d67c-4b82-e0c3-08d816b365a1
X-MS-TrafficTypeDiagnostic: VI1PR04MB5309:
X-Microsoft-Antispam-PRVS: <VI1PR04MB53099C7A4B09A512E7861ABFB3970@VI1PR04MB5309.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eXYmTcn+u6r08Zxv3Of1tsX7hwGzucsT4tmraRGBmEc2iouFzhVz1RY46IGzwUtRt5m9kTl3qZmO8SrnE2iJaoPIEZA4BLjmLC4jpJ9PC7zqXOmxfqCuZEIYaJqzjLgxtsWNW5hHz3NboVr/wI9Zqh87PZ0joDE+NMdHcnm2MsgtoI7l4G6LcCxs0f40kISLxCkfdr2ykb82bq1nNCkCNseZ2G4GKPjYf5/3WkjzoBnqbqDEhK1Gynda3KBmrccvZEfGhINFuRcXyEACWj0OjbX4+B4OPPPA38YeDPQA04bZD6auZlQ+EMMXo2rFa+JF7owxdQkBo8kFgH8b1u1HBMHRuEoF5KStRSXvoMp/FCzZoT9HB5hpcBtdto63wdMa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5600.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(346002)(396003)(136003)(39860400002)(366004)(86362001)(8936002)(8676002)(52116002)(5660300002)(2906002)(478600001)(31686004)(26005)(83380400001)(54906003)(186003)(16526019)(4326008)(16576012)(316002)(53546011)(6666004)(956004)(2616005)(31696002)(66476007)(36756003)(6486002)(66556008)(7416002)(6916009)(66946007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: JFifSoV/q413TAgo+MyxsEFpCaJpUsPm+AoIydB4O2P/ZPt63wX0IYFhwP9klIJRJPxqsALmgtnHluRWb0NmDijyWiAIxyd9zHbi/ZpUEwiRfNJ90sws1fJRQYjQltbcGl/6eqDmqu3+M8cp+8b4Gb0keksYrtfapH6CaO4RUzXuQisEet6bdNy2C6VUJ4LcG9VSzEOBzJ3wToXDPOExWAK9ir8Zauo+MMwHj5mwevGjFnSeywBV/ZuYZBzeMKRdC6Kyl4BhVuEn8Du+3FNrwBnMYjQ2CoDAoqrslC15XprkIenAKjgBABSsHUGUJDMq8RxFpelvELxTiWiuCnQTSvTbAEp2Q6On/2AuzTRlD/D+L8xygWTh7KfVoFI3XoeJ0FutGs0lP+ElVMh/TbggCiCt82ORohp1FQfDAfngr5etyfIHZZdVMDMsGpcj8P2yPzQlYMlewa0Br4JHINo7YgexNcfKChTeo4crcQXf1kU=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b4e4b0e-d67c-4b82-e0c3-08d816b365a1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 13:51:43.4409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jR41N3iH637bLV5CMnZ+PmGPgQOPW4VYiwFfXG+EpGaziT81jDw36F322IyDiua5ttK4UtLP54K0nxzh2d4U7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5309
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.06.2020 15:24, Roger Pau Monné wrote:
> On Mon, Jun 22, 2020 at 01:07:10PM +0200, Jan Beulich wrote:
>> On 22.06.2020 11:31, Roger Pau Monné wrote:
>>> On Fri, Jun 19, 2020 at 04:06:55PM +0200, Jan Beulich wrote:
>>>> On 18.06.2020 18:04, Roger Pau Monne wrote:
>>>>> Commit e9aca9470ed86 introduced a regression when avoiding sending
>>>>> IPIs for certain flush operations. Xen page fault handler
>>>>> (spurious_page_fault) relies on blocking interrupts in order to
>>>>> prevent handling TLB flush IPIs and thus preventing other CPUs from
>>>>> removing page tables pages. Switching to assisted flushing avoided such
>>>>> IPIs, and thus can result in pages belonging to the page tables being
>>>>> removed (and possibly re-used) while __page_fault_type is being
>>>>> executed.
>>>>>
>>>>> Force some of the TLB flushes to use IPIs, thus avoiding the assisted
>>>>> TLB flush. Those selected flushes are the page type change (when
>>>>> switching from a page table type to a different one, ie: a page that
>>>>> has been removed as a page table) and page allocation. This sadly has
>>>>> a negative performance impact on the pvshim, as less assisted flushes
>>>>> can be used.
>>>>>
>>>>> Introduce a new flag (FLUSH_FORCE_IPI) and helper to force a TLB flush
>>>>> using an IPI (flush_tlb_mask_sync). Note that the flag is only
>>>>> meaningfully defined when the hypervisor supports PV mode, as
>>>>> otherwise translated domains are in charge of their page tables and
>>>>> won't share page tables with Xen, thus not influencing the result of
>>>>> page walks performed by the spurious fault handler.
>>>>
>>>> Is this true for shadow mode? If a page shadowing a guest one was
>>>> given back quickly enough to the allocator and then re-used, I think
>>>> the same situation could in principle arise.
>>>
>>> Hm, I think it's not applicable to HVM shadow mode at least, because
>>> CR3 is switched as part of vmentry/vmexit, and the page tables are not
>>> shared between Xen and the guest, so there's no way for a HVM shadow
>>> guest to modify the page-tables while Xen is walking them in
>>> spurious_page_fault (note spurious_page_fault is only called when the
>>> fault happens in non-guest context).
>>
>> I'm afraid I disagree, because of shadow's use of "linear page tables".
> 
> You will have to bear with me, but I don't follow.
> 
> Could you provide some pointers at how/where the shadow (I assume
> guest controlled) "linear page tables" are used while in Xen
> context?

See config.h:

/* Slot 258: linear page table (guest table). */
#define LINEAR_PT_VIRT_START    (PML4_ADDR(258))
#define LINEAR_PT_VIRT_END      (LINEAR_PT_VIRT_START + PML4_ENTRY_BYTES)
/* Slot 259: linear page table (shadow table). */
#define SH_LINEAR_PT_VIRT_START (PML4_ADDR(259))
#define SH_LINEAR_PT_VIRT_END   (SH_LINEAR_PT_VIRT_START + PML4_ENTRY_BYTES)

These linear page tables exist in the Xen page tables at basically
all times as long as a shadow guest's vCPU is in context. They're
there to limit the overhead of accessing guest page tables and
their shadows from inside Xen.

Jan

