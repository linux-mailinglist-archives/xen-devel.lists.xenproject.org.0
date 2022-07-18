Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5968577DFF
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 10:53:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369391.600785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDMV4-0000kQ-NH; Mon, 18 Jul 2022 08:53:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369391.600785; Mon, 18 Jul 2022 08:53:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDMV4-0000i1-JJ; Mon, 18 Jul 2022 08:53:10 +0000
Received: by outflank-mailman (input) for mailman id 369391;
 Mon, 18 Jul 2022 08:53:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pu44=XX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDMV3-0000hv-CB
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 08:53:09 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20065.outbound.protection.outlook.com [40.107.2.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0aed69c1-0677-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 10:53:07 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM6PR04MB4744.eurprd04.prod.outlook.com (2603:10a6:20b:5::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 08:53:05 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 08:53:05 +0000
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
X-Inumbo-ID: 0aed69c1-0677-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLONbPqdlWFHOSxLA7AynVTqXld0PKK/j/EWWsBiFmn7GUVXFYlYL0y8vdjo88fnqoBQDSRDU3IYBqtwEOUbu7/E7w/X6cJ7QDN7ZgBFK11otA7I5MVOJgTGXvi+fZpR/JUK7+i7jLYCgVglrfOQlGAs4OqB3yPJDZ4XDmypiUIR6R11tvwhsVBMuPumeJpV7St3YSJRc7u57/EOkvYxDJ0hgu+LoVxqYWmK3dDSIo6lUkTWsctc2XMuEl3lFbOQE/4rnGdmvuSlBe8AuExC3+91c3Na/gAIg41ouroc9v4pBfjSAxk2Jc4ZudsUNZCij6r3U3MsLeCVoaOXzlfaww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0y4NpEPVsh+0hDEh+toso5RpkSjt5rwTlUb0rw6Z14I=;
 b=FohFFHDNxV3qnNQ1Zs39R86Yito7KQ6fiebiI1mBEITL125ypzvv2VoI6Rkq6DGtMICVkndMpLTiOMMO5CcSXCe7DQLwp/taJe3Tc+hhveSVa1FRRkLFd07O7Y67Ce4QGouZc8AzScXvNtX+/ub8kUJnHkhNhM9jnSDkjlvOmq+YB6wEoN/QmVBkGmr/VnhXefshl400A41l88nnLE+20yYhnHtdV0HsuM9yAi1Las2JrOlaQMvBQrBasKRQBRSnFi0+bngxZwW6EP6pHCCHKccXJCXK0gjLbyaYfAITuL6wgyXAADsuj+Wkkk/hf8o0ypdqdunyUh5igUhraYMFnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0y4NpEPVsh+0hDEh+toso5RpkSjt5rwTlUb0rw6Z14I=;
 b=d6f0usFZSIx7L0bgb4lkvvEzthVWD1Xi+9TDu0E1AsIh+yqCoiVjn6Q/MZlNwC8aCKYoXNZEX7CbxCmO+nYWL3gEff3TZ9QlIC9alcgZeGRLJtjjCfRTyytvewDpjqp7FCA9g/lYunIMdeBM3Fw4mTkoC4LJ2gaGnqDOiEzkfnOTb82/dTRUWzwlVr4BD8fTYvrDbMBm3J2H2exTiaXf9LS+d1ejbLIRCJXaKljSttNiGmZp5sVk7qax/LO6l8tht90JVHdABBUHzg3dduKIPQWz2fzmocI/olEZJXB+d01w8bV//ri6gDlUdZ4xrDmrdR3IzbdfQkHBiLt7lr00jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1ab92b5d-a908-8027-fb64-51e95d08c727@suse.com>
Date: Mon, 18 Jul 2022 10:53:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 2/2] xen/gnttab: Store frame GFN in struct page_info on
 Arm
Content-Language: en-US
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20220716145658.4175730-1-olekstysh@gmail.com>
 <20220716145658.4175730-2-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220716145658.4175730-2-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::21) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d046c35-de49-4168-dff6-08da689aedb5
X-MS-TrafficTypeDiagnostic: AM6PR04MB4744:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	94/kvKrJNBgeJap2hlfSna3gM8WNPwiQxJTsGc2fKpmagtG0KQSogUtFfs47+CNNTWrExF5Wcyp2CvXok3i1bxqIOqklg1X0EmH4tB3h6HR1jbmAWlRjBG/mY7SbIUoF9Fd2SH4ppthsD/LcZ91lXyksYR7vFTLl7cEoj/K03x9PUeKWYJzucllY6BKX8PKAXmIp+0GTORmVRvQsOoUUZda3QYkNO90jJQHY4YVGQde+Dj+CMbUmqj0EiPVeUKFyPjKuDq9TnUpQ6TKiaS5x/BN2UmzaJO14mPxM2UKIkTS51k4LRccsQ2E2hKMmyTyANCq6tvMS0ici/qTJRTo0R2IGZ/w2UnrfRBYy40qAQ88a4mhAgDiiSXJ6OChR1ywEltdSi3KuducpEIKwK5SxTGkmfIIfyvwMC+rLyFFoH58LXXD2D04xYOSnn6DsqeT9ruyYOkMIbaQz/KAGH9r3KnKmIAFQnjqs3YzMFxVIdyuyT1JAtX3z7Y7kPFOBEZOqT023WvLtqhUKvZzReoBRCNuPSsq1rLNs+2diXNGxpfDr4ByVFwtPRFxAtyk4jtVmplQshQfS1gc12oFbgQ6aL+LYTtpHhk+YG3Y9hDlMXIt97Vfe0sF1wzeY2WHnQze+Qi7v8EoDcPB7lum6KXz7oacQ5B2kPcoDn+gYTttP2edqMqRDi2QaFXoSpUGdMGOMbwbarMBF1kwTrPadOpfzAlrd6Mu+6auYQ1J+oSdxUCzQoj3Z6zfZxU/HPz5e+ec3XI6jKansVJDW7+1g9tSKxBDax/AVfOL6mlhY38wUApsmlpVBZi3clm0SZpfLn56S8l2MoKAmBjNGdk6Iz94ffe9yliDXI/Dp/DEImZ1SOAs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(366004)(346002)(396003)(376002)(31696002)(86362001)(41300700001)(53546011)(478600001)(6506007)(6512007)(26005)(36756003)(31686004)(83380400001)(186003)(316002)(54906003)(6916009)(2616005)(6486002)(8676002)(4326008)(2906002)(8936002)(7416002)(5660300002)(66476007)(66556008)(66946007)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUFrbWFNZkpvcW1kZzRsTFBIMjByQUVwS0RNMUVWYjdsUTV2ZFBpM2JicGhi?=
 =?utf-8?B?cE1zampDTDlnNnhBWFU1WUlqUFVBZG5uVlIvazlwaFdURWc2dmhkaVZ4dStP?=
 =?utf-8?B?NW81dTdqSGUzZXY0TnJQKzhuR0prdXFKZUt6OEpUTmpwOHMyWmQ1SWR4LzJX?=
 =?utf-8?B?czA4bVNwT2RKYWZrNGwvRFJVaVhQV1QrNktVdDVPcHJVL0h0WDRmU2RNZzRw?=
 =?utf-8?B?ZUcyR1FkYUNXck9Cbzh5cXR3aGx2cTVQTXRvME5lanpsNy92ZWhiaGtxRjgr?=
 =?utf-8?B?NkJXUnNLV1EzcS82V1NJT2x6TmUvb1FMR2xwTFlIM3lOMUVIL2l0K1JmZ0xV?=
 =?utf-8?B?MGMzV3I0bHpZWW5tMGRIMUVIelBrVGhaZDBmTG5iV2R1Y0pSQlcxdzJqMUlU?=
 =?utf-8?B?bHJlcDNiY3dvN2Zyd0hMK0k5MFBSNm9EWVNyUmlkKytucGhjbVJ1NjVhdldF?=
 =?utf-8?B?Z1dGanBoTjJnRjQvVDlGdHRWcm5hbzJwRkdHUzd0dlE1aTJxeTdxekFZcWQ3?=
 =?utf-8?B?WUllS1NJOHdHajFVK2V4VmVpOFNxUEhCdWk1c3Z6ZkFrVkFOT1BHMHJTYzU5?=
 =?utf-8?B?c1N3U3UyUnRlRFgwb2wvZnpHQ3oybzJSR0VJWHRETnFITzVRL2dEQTZoUFZH?=
 =?utf-8?B?eXB3c3p1RnVkYWthVEdzRHlkOTgwVzVxUy95NTlpdVZ3U0k2dVhZN212Nnpi?=
 =?utf-8?B?TnJ5NnFrMkh3Y3RlVjZEbmRpZW41Lys2NGFrK1UzZlZLUEo3azBQU1Mzdkpy?=
 =?utf-8?B?cjJzKzg0N2oyWW0zTkpNN1V2RmlWMDBVUXZXRytzQ3BzNzZBbjBtMzlBbFVV?=
 =?utf-8?B?ZWgzdEFQUGEzTlprUW5MdVpRejhuN1RlRmVRTnd2bUZBYzM1Q2swdGM2NHAw?=
 =?utf-8?B?V3FuWlcvd1dhWmlJR0dMVVVwN3pWWnRlVVZpSEh4UUw0YUtlRDA0L3lqeW5h?=
 =?utf-8?B?NEVSUWgyUlRENjVadEpmWFE2UEt3dkhpREFDczNTUkJCRWdPV3h1RGxlZEhW?=
 =?utf-8?B?QVROVk5jV2kwdHZ6cmhVMWFVNjdhQkZtOXhWdXB1WnFHSEp6cGJFOTZxMHB1?=
 =?utf-8?B?QmN2N0RIT1ZhQi9jWktoc1lXbVFQelQxTmpJYTVONVBpTnZydXZvdktkZGN1?=
 =?utf-8?B?ZzYvUHN0NzNRbzB3VnlIdFVtNDVLdEplQjlMS2t5SGFhaFUxWUI0L3Q1ZzU2?=
 =?utf-8?B?bUR2YVFBSTUzR0kzT1NTMVpES2VPNTN0WmRPWVpCaEpMWEw2RzRHZUYrbnE1?=
 =?utf-8?B?bVZ2OWRTUWh1cHdBOExsdXpQQ0ZneUlIZ0loYUVnc2FvZEZ6ZTZKTW5SNnBN?=
 =?utf-8?B?RkJ6QmNmVXU4SEFTVXBjU1JWV243VUo4d2NwUS9PSXB5RGRmbjJJR05CSFJF?=
 =?utf-8?B?a05QUmxPdTA2R2lKN1NCVVdYb0lPWjJoODRiUEVRZEFBK0xSL2dSRTRuSFAx?=
 =?utf-8?B?eTRES05adHg2VEtmeEhFZ3VVMUJoTmxJenh6SGVjSE5TSTQxSUk5SkF0SWpj?=
 =?utf-8?B?S2ZyN2tsUlJuWTIzVGhGNnI3Qk5XelBQU3NMYUVwVG9rbU5PZjdpdXJaV0la?=
 =?utf-8?B?bHM4K1o4RnFJYWdiQ3FTOENQK29td1JJTkMxMW9FdFR4MGQwU09MNnVQakFJ?=
 =?utf-8?B?bW9RTkV5U2hPQ3N2bHQrbjZiZTRsWVpkNy9aUDNDWnpvRnhCYWJsUnhUSTVI?=
 =?utf-8?B?am1qdDNZd1F6a3BhNDM5U3E1SGNXTjVNMGJEVXh1U0hBd05zMU4zdTFBYzZF?=
 =?utf-8?B?QXo3K1dJNGdld21qMGpmanlqbWxuU2RlT3d0NGQ3VndndmorZ25jeGFEazJu?=
 =?utf-8?B?SktHNDVlOFZpUk4zOWJqVERkdVJ4elRmckNaUWtKOUJwTUtFTlpDcGJzemgy?=
 =?utf-8?B?Zkw1UmlBNmtIOGV4SzFYSU4xbENFY2hnekhJSkxiOGFSQVU3VnZzOVBpdm4z?=
 =?utf-8?B?K21oSW5XRDlIMXZIOHUreVhISExMRXdad0hqN0tHWkN4emdqcC96emJoSjdZ?=
 =?utf-8?B?QTBhcExvbHErYzVBWmcvdjhTY04xdURnMExyVW5Hd1ZCUVJuZHQvcER4R1BK?=
 =?utf-8?B?aGhCMVFzZXZjVGZJTnFKbEd5Nk5hemxCbEtTMGNXYTUwV2xWL2p2U3VFZFJ1?=
 =?utf-8?Q?98w1Y5ulj1YTt/HKnI+fXo5n1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d046c35-de49-4168-dff6-08da689aedb5
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 08:53:05.0593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q22gXpkbT17Y3wXaHUkcMQ02OXb+Vh8NgomvomzqZyPlkxx8gIQDfHNj63E6XNKAb8t4qVY8CzV5QJitivs2eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4744

On 16.07.2022 16:56, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Rework Arm implementation to store grant table frame GFN
> in struct page_info directly instead of keeping it in
> standalone status/shared arrays. This patch is based on
> the assumption that a grant table page is a xenheap page.
> 
> To cover 64-bit/40-bit IPA on Arm64/Arm32 we need the space
> to hold 52-bit/28-bit + extra bit value respectively. In order
> to not grow the size of struct page_info borrow the required
> amount of bits from type_info's count portion which current
> context won't suffer (currently only 1 bit is used on Arm).
> Please note, to minimize code changes and avoid introducing
> an extra #ifdef-s to the header, we keep the same amount of
> bits on both subarches, although the count portion on Arm64
> could be wider, so we waste some bits here.
> 
> Introduce corresponding PGT_* constructs and access macro
> page_get(set)_xenheap_gfn. Please note, all accesses to
> the GFN portion of type_info field should always be protected
> by the P2M lock. In case when it is not feasible to satisfy
> that requirement (risk of deadlock, lock inversion, etc)
> it is important to make sure that all non-protected updates
> to this field are atomic.
> As several non-protected read accesses still exist within
> current code (most calls to page_get_xenheap_gfn() are not
> protected by the P2M lock) the subsequent patch will introduce
> hardening code for p2m_remove_mapping() to be called with P2M
> lock held in order to check any difference between what is
> already mapped and what is requested to be ummapped.
> 
> Update existing gnttab macros to deal with GFN value according
> to new location. Also update the use of count portion of type_info
> field on Arm in share_xen_page_with_guest().
> 
> While at it, extend this simplified M2P-like approach for any
> xenheap pages which are proccessed in xenmem_add_to_physmap_one()
> except foreign ones. Update the code to set GFN portion after
> establishing new mapping for the xenheap page in said function
> and to clean GFN portion when putting a reference on that page
> in p2m_put_l3_page().
> 
> And for everything to work correctly introduce arch-specific
> initialization pattern PGT_TYPE_INFO_INITIALIZER to be applied
> to type_info field during initialization at alloc_heap_pages()
> and acquire_staticmem_pages(). The pattern's purpose on Arm
> is to clear the GFN portion before use, on x86 it is just
> a stub.
> 
> This patch is intended to fix the potential issue on Arm
> which might happen when remapping grant-table frame.
> A guest (or the toolstack) will unmap the grant-table frame
> using XENMEM_remove_physmap. This is a generic hypercall,
> so on x86, we are relying on the fact the M2P entry will
> be cleared on removal. For architecture without the M2P,
> the GFN would still be present in the grant frame/status
> array. So on the next call to map the page, we will end up to
> request the P2M to remove whatever mapping was the given GFN.
> This could well be another mapping.
> 
> Please note, this patch also changes the behavior how the shared_info
> page (which is xenheap RAM page) is mapped in xenmem_add_to_physmap_one().
> Now, we only allow to map the shared_info at once. The subsequent
> attempts to map it will result in -EBUSY. Doing that we mandate
> the caller to first unmap the page before mapping it again. This is
> to prevent Xen creating an unwanted hole in the P2M. For instance,
> this could happen if the firmware stole a RAM address for mapping
> the shared_info page into but forgot to unmap it afterwards.
> 
> Besides that, this patch simplifies arch code on Arm by
> removing arrays and corresponding management code and
> as the result gnttab_init_arch/gnttab_destroy_arch helpers
> and struct grant_table_arch become useless and can be
> dropped globally.
> 
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


