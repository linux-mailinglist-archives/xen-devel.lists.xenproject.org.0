Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFDE3BC766
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 09:43:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150849.278871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0fjs-00028H-DM; Tue, 06 Jul 2021 07:43:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150849.278871; Tue, 06 Jul 2021 07:43:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0fjs-00026A-9Y; Tue, 06 Jul 2021 07:43:28 +0000
Received: by outflank-mailman (input) for mailman id 150849;
 Tue, 06 Jul 2021 07:43:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0fjq-00025z-Hx
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 07:43:26 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d75cada2-de2d-11eb-847a-12813bfff9fa;
 Tue, 06 Jul 2021 07:43:24 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-b3xt96PlO82bLnRhHV2OVQ-1; Tue, 06 Jul 2021 09:43:22 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2334.eurprd04.prod.outlook.com (2603:10a6:800:29::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.26; Tue, 6 Jul
 2021 07:43:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 07:43:19 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR05CA0103.eurprd05.prod.outlook.com (2603:10a6:207:1::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 07:43:18 +0000
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
X-Inumbo-ID: d75cada2-de2d-11eb-847a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625557403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bj8vvHE65GMNIEmLZRdXA6lv2kvcPy2u9dPs75gWieo=;
	b=KNXVj4aImoixn08Az62cqylxp+/2HQgZyquetJL83uwcr5dVD4vzAkjUY4t6m3vF7a7LZX
	1jk+XVKCxrrSRfp/uPTBNYFlK/QutAGNwwhlDunQCsJHz3CKPPQX58Bkt1L1jRu+Cvs1hF
	+MPKw4bY6c/PMy58XFsUImuKFSYmlBA=
X-MC-Unique: b3xt96PlO82bLnRhHV2OVQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7uoIwChsxbqups1A2zYHLezTKIkecfOxUIqLZPsENAdjPiJJcGHzrleM5GHj2dwhbuApHkVQbEMgfip/OZyLDa33HjBzE48iXwra5ICe9qxLdkzm4KWDUhErO1JpYjWdOxx73a38NZ6bugaNRp5iYaR+dRtTlul09ukE/VF8XmBp7gkrBANTxkOBANbNLvOlNYOY+PWpVoXX4hFieu5JGhtBL5sl8j00B4qhPt4wf+uIv8s2SwF2BoeaVBZobfcanToDvN+N9ZrMYu1hxOCyqEtcE0EcHNw61hHoStVbnNTIsPM8jmMFsbmhE5R6FvJB5gIXeHmhJYLpIAyK5emNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bj8vvHE65GMNIEmLZRdXA6lv2kvcPy2u9dPs75gWieo=;
 b=lceop/75raK0yjg8bAn63kow4cb/dN/BAEC0hrOvxZSwY7ZUHxLe8nqfFBqZvW/yYiQwbUOJhagsa3MhrE50wsk04HCDIaWhNzJU/jpfILlbp++UYnVFEVbgVJxcWb8dkiHV3m+AVxB1CJ3WEpexe5h4vV1GIwpQyNCzoPExnHXQ0cLoBO8jeA86DP9gUgvJC4ZHUrlPE0j6rQwER/WVit4Y8nkJglHT1cNNzq2/+b7BM2CrO/OD5mYyexYBC6i/RjYbeZZ/3gMvxCkf57zJhyyS5dloqdcNE04O+pDWeNlJjLaaB58J+RJOZoLkQHXqzy3chBywlbU9JyHFNKHj2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Ping: [PATCH v5] IOMMU: make DMA containment of quarantined devices
 optional
From: Jan Beulich <jbeulich@suse.com>
To: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e1f30ef7-6631-609d-6948-e9b1f3fa3b37@suse.com>
Message-ID: <54ef2e6e-b9d8-8fc8-897c-ca7c3fb8bc1d@suse.com>
Date: Tue, 6 Jul 2021 09:43:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <e1f30ef7-6631-609d-6948-e9b1f3fa3b37@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM3PR05CA0103.eurprd05.prod.outlook.com
 (2603:10a6:207:1::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc09bd48-6304-4c94-0227-08d94051b90b
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2334:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2334EA4323AD95553518CD61B31B9@VI1PR0401MB2334.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6vbycvGw7u/pbJgUpQj6kTllsfLWO6JWxREzhveiuEt0h7jsU4GzZLFSUqktzIk11ZVzEGVPatLRe9QeYUrzMGF2pL3Vcu/y3GvHccL6DjmpMgnqmGMLoDefD2TzOzv/EKClICnnwdCHtZ4QjWElnlvBlvJS6gGJ+0qPn3vLmyPQ8ub2BBG1dlNIL66+2xGv5nH43JqId7Jlh6A6kQpUbIbuUMHssxEa93+S0lgoIHYcgriXHb3GMCnGpnhIKxhYVQcDV+b2Wq4F9jPpPkZqo6dLdhgZy/2zbs6gzXIKgXcVnTW0JPG2tT3WE8KK2LKYu4deA8kV0K10li+1Nz53zL6fosNHIcI9IyFgau8NLeHy6SHuUIMd4ownLCUlsuTMqb/EEj7it6WMpfzCyoRfrZIXRnZCxDXeiTj/J7RXfAd0D50QC1llgXHRSffHXXAerozwoq0wzFLZbf/zzIX3cH9B+aC0uXjRQSM899oWYRmwKIJVV9eeYoW6P1feGTxD6aWygzrXjbytzRhPkHGNjU3tby+Iqqa7TacTyZ7c+WHEAT0C8Uri3B7RoKOxuZWDsicK34KTfQjAdajoGcuPBSQumcYX4wx/BLCqHWTwMHYUhUj+YUrma5AOuLwtuoqRQNj7rA57nXRuabQjjU2rtSQdlibxMUjK0Z5co0e6NKRnnDw1SsWWhV8xdcAH+SeziLA9b6EDz1Fj1UAB0YZnDGygNZMeVrKGPtUFs8g6wdc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(366004)(39850400004)(376002)(136003)(6486002)(26005)(2906002)(186003)(53546011)(4326008)(30864003)(16576012)(8936002)(86362001)(38100700002)(66946007)(8676002)(16526019)(83380400001)(31686004)(956004)(2616005)(478600001)(36756003)(316002)(66476007)(5660300002)(31696002)(66556008)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDNoeW0wU3Y3TjFIRGN5cnExUktoTVgyd3YrYVgreTNSYnRsYXlRbW5zcnY1?=
 =?utf-8?B?UjgwZFZDb0luZXZKM0pCdStOTzM5b29QbGgrdXlURW55QkJHVDg4OE9GWndP?=
 =?utf-8?B?VWNLOG5iWjZSNGxDYmk1OU1ZTml1Qnd3bmhFbDdHZWhoTUJsNDBZUVEydGxG?=
 =?utf-8?B?Q2xwcWRVaU9qMjhZYlFtQjhIOTcwVk5BVGoxKzRrQVhjSXpJQ2hPcEo4M2Uy?=
 =?utf-8?B?QXpzcEM3YWhUMFh3dnIxTWpKSE1pQUVQYmlXTno5eEU4MGI2dGNBZEtRNEFP?=
 =?utf-8?B?S1lDQy9laFcrYW1aVU5KNCswMUpjWjk0UHE1QmxJazR2NGhJaTNGb1FFWFRa?=
 =?utf-8?B?TFpBK2N2aHlkSHI5c093SlE1K0Z1dS8xVGJVaUpHUWQwR0lrOWtxckNFNUVq?=
 =?utf-8?B?eGtleHMvWHlxbkxtTTF3V3AyblRqQkdPNDI0QTBWQmdUMDJuQldvenIxeVBU?=
 =?utf-8?B?WFcvTFBITExsUFJrcDJzdmtXYmoyVjlxYVQvRXJTdUdvcjZJTTI5eW55Rm04?=
 =?utf-8?B?YzBJa3FST1B3UXhncW5BZkRjRStBOWwyL2RnelptZVlMTmgwMWRJNmkzK29T?=
 =?utf-8?B?MkZJTzNhQ1pqN3VXRlhyM3phTlUzbWxET2lpWTRaZlBCenV0RmVhNWYxbU1F?=
 =?utf-8?B?c21SWUkzYTZDUnI2alhjYVpnUDBWMTB3TStURnNvOTNWRXc0cVZxNDIvVjhk?=
 =?utf-8?B?VytOSUpwQ0RLQjk0VEdseWdkYnVVTzlrL3BoV2lCTEMrejYrakZwcExiK3Uz?=
 =?utf-8?B?U2NyWlBmbU1ESHV4UzNQVkxna2FhWGoyREJqaWZFSGg0dzJ2aHVwVWRCRjRN?=
 =?utf-8?B?NFdIV3BzWXhNSXF1K0UwazU0UmhGTm8xSlhaQzk1dDZnYzJwRkhnMFREQy82?=
 =?utf-8?B?eVRBK1hDeXVkeW82Q2ZqaVhRc0N5Sm9PN0VqdUFjdGVsTE9RVThWeElOVFVk?=
 =?utf-8?B?WExrZXJ1aE1yTVBNZ2t1YVdLeXF3bGV1dFNUVnR0NFlkbGxWRFhmMGZLRU51?=
 =?utf-8?B?VXVPaFlOY2Z3T2VEK2ZsNFZmVEEzQTYrdWp3emZvMTdPeldTNmtqSlY1eXNp?=
 =?utf-8?B?dm0xUWIrMVF6bEV6dUphYU9TYTliMzg4VlBBTVhjaUs0bjJDd0QvYnRldERF?=
 =?utf-8?B?UHlYZllvN2ZkSnVFWkJpTVkxT0VNQ0lSVUdYdjVQZ2l5NGxHQWZmS0dadHNB?=
 =?utf-8?B?TU9Mc3lTRks2YjAyc1BRbkpRNDh3SUNnblgvakNpeFVWSGlzRUg5dno4ZC9S?=
 =?utf-8?B?Tnl3dVNWTCt4U0lXek8zdjdXcGd6b2oyMmd1RDV1OTBEcmRlK1lLc1EydFNO?=
 =?utf-8?B?Q1RWY3VtK0VzMUM1YzlpYVpBK2ovZjljdzR5MkEwRGI2Tk9pQUo4US8yVDhu?=
 =?utf-8?B?VFdSZExzUWM4dWF6RUtJcUpGVy9SQysvdTdueHJaei96Y251ZWN3L24xYVRK?=
 =?utf-8?B?eXVzZy9ab2NOelYwR3FMdFk0UmJLRFJXZkdjVkcyaDR4OXpycFhFc2lld282?=
 =?utf-8?B?OXJlbTlHc1JpN0tidWRIbXFPRmNCRUpYOXNLejRNblM2L1BRQ2ZTK2h6M202?=
 =?utf-8?B?OTNzSFZFQVAwa1REYUNReGhCcmR5KzZ3V3F6Nk5jMmFtZmlHMWtpOEhtWVNo?=
 =?utf-8?B?SW9FR1hwUldUQzQzaTlTRWI2c09GaisxMFlzMTk2ZWZIMDlhcTFoN3VsM0sz?=
 =?utf-8?B?RjZRYzNCUFZwZXFFY1puUTNHdndMWTY0ZjNUZjVZdXRTMHJkRTdIRUVxYVpv?=
 =?utf-8?Q?sXsqPBZ5ogdIJpuabi60b5ih0f1b3Wuso1TaDXd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc09bd48-6304-4c94-0227-08d94051b90b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 07:43:19.2030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MHTpE0b6CajfjIB08uHLE/qG4wEGOdBCUCvin9z7DcHPMAUFFmw+I2hV8lfRW9lO+mDawOmukzKHnxY6BNK/kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2334

On 26.05.2021 10:19, Jan Beulich wrote:
> IOMMU: make DMA containment of quarantined devices optional
> 
> Containing still in flight DMA was introduced to work around certain
> devices / systems hanging hard upon hitting a "not-present" IOMMU fault.
> Passing through (such) devices (on such systems) is inherently insecure
> (as guests could easily arrange for IOMMU faults of any kind to occur).
> Defaulting to a mode where admins may not even become aware of issues
> with devices can be considered undesirable. Therefore convert this mode
> of operation to an optional one, not one enabled by default.
> 
> This involves resurrecting code commit ea38867831da ("x86 / iommu: set
> up a scratch page in the quarantine domain") did remove, in a slightly
> extended and abstracted fashion. Here, instead of reintroducing a pretty
> pointless use of "goto" in domain_context_unmap(), and instead of making
> the function (at least temporarily) inconsistent, take the opportunity
> and replace the other similarly pointless "goto" as well.
> 
> In order to key the re-instated bypasses off of there (not) being a root
> page table this further requires moving the allocate_domain_resources()
> invocation from reassign_device() to amd_iommu_setup_domain_device() (or
> else reassign_device() would allocate a root page table anyway); this is
> benign to the second caller of the latter function.
> 
> In VT-d's domain_context_unmap(), instead of adding yet another
> "goto out" when all that's wanted is a "return", eliminate the "out"
> label at the same time.
> 
> Take the opportunity and also limit the control to builds supporting
> PCI.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

May I please ask for feedback here? While I consider it too late to
get back fundamental objections (such should have been voiced
earlier), I'm still willing to accept such if they come with an
understandable reason and are backed by a majority, in which case
I'd (not very happily) drop the patch despite my concerns with the
original default chosen when the scratch-page variant of quarantining
was introduced. But I'm not going to give up on this merely because
of not getting any feedback at all; instead I'd then also have this
fall under "lazy consensus", if need be.

Jan

> ---
> v5: IOMMU_quarantine_fault -> IOMMU_quarantine_basic,
>     IOMMU_quarantine_write_fault -> IOMMU_quarantine_scratch_page.
>     Amend command line description to clarify tool stack based
>     quarantining mode when "iommu=no-quarantine". Fully
>     s/dummy/scratch/. Re-base.
> v4: "full" -> "scratch_page". Duplicate Kconfig help text into command
>     line doc. Re-base.
> v3: IOMMU_quarantine_basic -> IOMMU_quarantine_fault,
>     IOMMU_quarantine_full -> IOMMU_quarantine_write_fault. Kconfig
>     option (choice) to select default. Limit to HAS_PCI.
> v2: Don't use true/false. Introduce QUARANTINE_SKIP() (albeit I'm not
>     really convinced this is an improvement). Add comment.
> 
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1364,7 +1364,7 @@ detection of systems known to misbehave
>  > Default: `new` unless directed-EOI is supported
>  
>  ### iommu
> -    = List of [ <bool>, verbose, debug, force, required, quarantine,
> +    = List of [ <bool>, verbose, debug, force, required, quarantine[=scratch-page],
>                  sharept, intremap, intpost, crash-disable,
>                  snoop, qinval, igfx, amd-iommu-perdev-intremap,
>                  dom0-{passthrough,strict} ]
> @@ -1402,11 +1402,32 @@ boolean (e.g. `iommu=no`) can override t
>      will prevent Xen from booting if IOMMUs aren't discovered and enabled
>      successfully.
>  
> -*   The `quarantine` boolean can be used to control Xen's behavior when
> -    de-assigning devices from guests.  If enabled (the default), Xen always
> +*   The `quarantine` option can be used to control Xen's behavior when
> +    de-assigning devices from guests.
> +
> +    When a PCI device is assigned to an untrusted domain, it is possible
> +    for that domain to program the device to DMA to an arbitrary address.
> +    The IOMMU is used to protect the host from malicious DMA by making
> +    sure that the device addresses can only target memory assigned to the
> +    guest.  However, when the guest domain is torn down, assigning the
> +    device back to the hardware domain would allow any in-flight DMA to
> +    potentially target critical host data.  To avoid this, quarantining
> +    should be enabled.  Quarantining can be done in two ways: In its basic
> +    form, all in-flight DMA will simply be forced to encounter IOMMU
> +    faults.  Since there are systems where doing so can cause host lockup,
> +    an alternative form is available where writes to memory will be made
> +    fault, but reads will be directed to a scratch page.  The implication
> +    here is that such reads will go unnoticed, i.e. an admin may not
> +    become aware of the underlying problem.
> +
> +    Therefore, if this option is set to true (the default), Xen always
>      quarantines such devices; they must be explicitly assigned back to Dom0
> -    before they can be used there again.  If disabled, Xen will only
> -    quarantine devices the toolstack hass arranged for getting quarantined.
> +    before they can be used there again.  If set to "scratch-page", still
> +    active DMA reads will additionally be directed to a "scratch" page.  If
> +    set to false, Xen will only quarantine devices the toolstack has arranged
> +    for getting quarantined, and only in the "basic" form.
> +
> +    This option is only valid on builds supporting PCI.
>  
>  *   The `sharept` boolean controls whether the IOMMU pagetables are shared
>      with the CPU-side HAP pagetables, or allocated separately.  Sharing
> --- a/xen/drivers/passthrough/Kconfig
> +++ b/xen/drivers/passthrough/Kconfig
> @@ -39,3 +39,31 @@ endif
>  
>  config IOMMU_FORCE_PT_SHARE
>  	bool
> +
> +choice
> +	prompt "IOMMU device quarantining default behavior"
> +	depends on HAS_PCI
> +	default IOMMU_QUARANTINE_BASIC
> +	---help---
> +	  When a PCI device is assigned to an untrusted domain, it is possible
> +	  for that domain to program the device to DMA to an arbitrary address.
> +	  The IOMMU is used to protect the host from malicious DMA by making
> +	  sure that the device addresses can only target memory assigned to the
> +	  guest.  However, when the guest domain is torn down, assigning the
> +	  device back to the hardware domain would allow any in-flight DMA to
> +	  potentially target critical host data.  To avoid this, quarantining
> +	  should be enabled.  Quarantining can be done in two ways: In its basic
> +	  form, all in-flight DMA will simply be forced to encounter IOMMU
> +	  faults.  Since there are systems where doing so can cause host lockup,
> +	  an alternative form is available where writes to memory will be made
> +	  fault, but reads will be directed to a scratch page.  The implication
> +	  here is that such reads will go unnoticed, i.e. an admin may not
> +	  become aware of the underlying problem.
> +
> +	config IOMMU_QUARANTINE_NONE
> +		bool "none"
> +	config IOMMU_QUARANTINE_BASIC
> +		bool "basic"
> +	config IOMMU_QUARANTINE_SCRATCH_PAGE
> +		bool "scratch page"
> +endchoice
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -25,6 +25,9 @@
>  #include "iommu.h"
>  #include "../ats.h"
>  
> +/* dom_io is used as a sentinel for quarantined devices */
> +#define QUARANTINE_SKIP(d) ((d) == dom_io && !dom_iommu(d)->arch.amd.root_table)
> +
>  static bool_t __read_mostly init_done;
>  
>  static const struct iommu_init_ops _iommu_init_ops;
> @@ -81,19 +84,36 @@ int get_dma_requestor_id(uint16_t seg, u
>      return req_id;
>  }
>  
> -static void amd_iommu_setup_domain_device(
> +static int __must_check allocate_domain_resources(struct domain *d)
> +{
> +    struct domain_iommu *hd = dom_iommu(d);
> +    int rc;
> +
> +    spin_lock(&hd->arch.mapping_lock);
> +    rc = amd_iommu_alloc_root(d);
> +    spin_unlock(&hd->arch.mapping_lock);
> +
> +    return rc;
> +}
> +
> +static int __must_check amd_iommu_setup_domain_device(
>      struct domain *domain, struct amd_iommu *iommu,
>      uint8_t devfn, struct pci_dev *pdev)
>  {
>      struct amd_iommu_dte *table, *dte;
>      unsigned long flags;
> -    int req_id, valid = 1;
> +    int req_id, valid = 1, rc;
>      u8 bus = pdev->bus;
> -    const struct domain_iommu *hd = dom_iommu(domain);
> +    struct domain_iommu *hd = dom_iommu(domain);
>  
> -    BUG_ON( !hd->arch.amd.root_table ||
> -            !hd->arch.amd.paging_mode ||
> -            !iommu->dev_table.buffer );
> +    if ( QUARANTINE_SKIP(domain) )
> +        return 0;
> +
> +    BUG_ON(!hd->arch.amd.paging_mode || !iommu->dev_table.buffer);
> +
> +    rc = allocate_domain_resources(domain);
> +    if ( rc )
> +        return rc;
>  
>      if ( iommu_hwdom_passthrough && is_hardware_domain(domain) )
>          valid = 0;
> @@ -151,6 +171,8 @@ static void amd_iommu_setup_domain_devic
>  
>          amd_iommu_flush_iotlb(devfn, pdev, INV_IOMMU_ALL_PAGES_ADDRESS, 0);
>      }
> +
> +    return 0;
>  }
>  
>  int __init acpi_ivrs_init(void)
> @@ -222,18 +244,6 @@ int amd_iommu_alloc_root(struct domain *
>      return 0;
>  }
>  
> -static int __must_check allocate_domain_resources(struct domain *d)
> -{
> -    struct domain_iommu *hd = dom_iommu(d);
> -    int rc;
> -
> -    spin_lock(&hd->arch.mapping_lock);
> -    rc = amd_iommu_alloc_root(d);
> -    spin_unlock(&hd->arch.mapping_lock);
> -
> -    return rc;
> -}
> -
>  static int amd_iommu_domain_init(struct domain *d)
>  {
>      struct domain_iommu *hd = dom_iommu(d);
> @@ -283,6 +293,9 @@ static void amd_iommu_disable_domain_dev
>      int req_id;
>      u8 bus = pdev->bus;
>  
> +    if ( QUARANTINE_SKIP(domain) )
> +        return;
> +
>      BUG_ON ( iommu->dev_table.buffer == NULL );
>      req_id = get_dma_requestor_id(iommu->seg, PCI_BDF2(bus, devfn));
>      table = iommu->dev_table.buffer;
> @@ -349,11 +362,10 @@ static int reassign_device(struct domain
>          pdev->domain = target;
>      }
>  
> -    rc = allocate_domain_resources(target);
> +    rc = amd_iommu_setup_domain_device(target, iommu, devfn, pdev);
>      if ( rc )
>          return rc;
>  
> -    amd_iommu_setup_domain_device(target, iommu, devfn, pdev);
>      AMD_IOMMU_DEBUG("Re-assign %pp from dom%d to dom%d\n",
>                      &pdev->sbdf, source->domain_id, target->domain_id);
>  
> @@ -460,8 +472,7 @@ static int amd_iommu_add_device(u8 devfn
>          spin_unlock_irqrestore(&iommu->lock, flags);
>      }
>  
> -    amd_iommu_setup_domain_device(pdev->domain, iommu, devfn, pdev);
> -    return 0;
> +    return amd_iommu_setup_domain_device(pdev->domain, iommu, devfn, pdev);
>  }
>  
>  static int amd_iommu_remove_device(u8 devfn, struct pci_dev *pdev)
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -31,9 +31,24 @@ bool_t __initdata iommu_enable = 1;
>  bool_t __read_mostly iommu_enabled;
>  bool_t __read_mostly force_iommu;
>  bool_t __read_mostly iommu_verbose;
> -bool __read_mostly iommu_quarantine = true;
>  bool_t __read_mostly iommu_crash_disable;
>  
> +#define IOMMU_quarantine_none         0 /* aka false */
> +#define IOMMU_quarantine_basic        1 /* aka true */
> +#define IOMMU_quarantine_scratch_page 2
> +#ifdef CONFIG_HAS_PCI
> +uint8_t __read_mostly iommu_quarantine =
> +# if defined(CONFIG_IOMMU_QUARANTINE_NONE)
> +    IOMMU_quarantine_none;
> +# elif defined(CONFIG_IOMMU_QUARANTINE_BASIC)
> +    IOMMU_quarantine_basic;
> +# elif defined(CONFIG_IOMMU_QUARANTINE_SCRATCH_PAGE)
> +    IOMMU_quarantine_scratch_page;
> +# endif
> +#else
> +# define iommu_quarantine IOMMU_quarantine_none
> +#endif /* CONFIG_HAS_PCI */
> +
>  static bool __hwdom_initdata iommu_hwdom_none;
>  bool __hwdom_initdata iommu_hwdom_strict;
>  bool __read_mostly iommu_hwdom_passthrough;
> @@ -64,8 +79,12 @@ static int __init parse_iommu_param(cons
>          else if ( (val = parse_boolean("force", s, ss)) >= 0 ||
>                    (val = parse_boolean("required", s, ss)) >= 0 )
>              force_iommu = val;
> +#ifdef CONFIG_HAS_PCI
>          else if ( (val = parse_boolean("quarantine", s, ss)) >= 0 )
>              iommu_quarantine = val;
> +        else if ( ss == s + 15 && !strncmp(s, "quarantine=scratch-page", 23) )
> +            iommu_quarantine = IOMMU_quarantine_scratch_page;
> +#endif
>  #ifdef CONFIG_X86
>          else if ( (val = parse_boolean("igfx", s, ss)) >= 0 )
>              iommu_igfx = val;
> @@ -432,7 +451,7 @@ static int __init iommu_quarantine_init(
>      dom_io->options |= XEN_DOMCTL_CDF_iommu;
>  
>      rc = iommu_domain_init(dom_io, 0);
> -    if ( rc )
> +    if ( rc || iommu_quarantine < IOMMU_quarantine_scratch_page )
>          return rc;
>  
>      if ( !hd->platform_ops->quarantine_init )
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -42,6 +42,9 @@
>  #include "vtd.h"
>  #include "../ats.h"
>  
> +/* dom_io is used as a sentinel for quarantined devices */
> +#define QUARANTINE_SKIP(d) ((d) == dom_io && !dom_iommu(d)->arch.vtd.pgd_maddr)
> +
>  struct mapped_rmrr {
>      struct list_head list;
>      u64 base, end;
> @@ -1328,6 +1331,9 @@ int domain_context_mapping_one(
>      int rc, ret;
>      bool_t flush_dev_iotlb;
>  
> +    if ( QUARANTINE_SKIP(domain) )
> +        return 0;
> +
>      ASSERT(pcidevs_locked());
>      spin_lock(&iommu->lock);
>      maddr = bus_to_context_maddr(iommu, bus);
> @@ -1556,6 +1562,9 @@ int domain_context_unmap_one(
>      int iommu_domid, rc, ret;
>      bool_t flush_dev_iotlb;
>  
> +    if ( QUARANTINE_SKIP(domain) )
> +        return 0;
> +
>      ASSERT(pcidevs_locked());
>      spin_lock(&iommu->lock);
>  
> @@ -1617,7 +1626,7 @@ static int domain_context_unmap(struct d
>  {
>      struct acpi_drhd_unit *drhd;
>      struct vtd_iommu *iommu;
> -    int ret = 0;
> +    int ret;
>      u8 seg = pdev->seg, bus = pdev->bus, tmp_bus, tmp_devfn, secbus;
>      int found = 0;
>  
> @@ -1632,14 +1641,12 @@ static int domain_context_unmap(struct d
>          if ( iommu_debug )
>              printk(VTDPREFIX "%pd:Hostbridge: skip %pp unmap\n",
>                     domain, &PCI_SBDF3(seg, bus, devfn));
> -        if ( !is_hardware_domain(domain) )
> -            return -EPERM;
> -        goto out;
> +        return is_hardware_domain(domain) ? 0 : -EPERM;
>  
>      case DEV_TYPE_PCIe_BRIDGE:
>      case DEV_TYPE_PCIe2PCI_BRIDGE:
>      case DEV_TYPE_LEGACY_PCI_BRIDGE:
> -        goto out;
> +        return 0;
>  
>      case DEV_TYPE_PCIe_ENDPOINT:
>          if ( iommu_debug )
> @@ -1681,10 +1688,12 @@ static int domain_context_unmap(struct d
>      default:
>          dprintk(XENLOG_ERR VTDPREFIX, "%pd:unknown(%u): %pp\n",
>                  domain, pdev->type, &PCI_SBDF3(seg, bus, devfn));
> -        ret = -EINVAL;
> -        goto out;
> +        return -EINVAL;
>      }
>  
> +    if ( QUARANTINE_SKIP(domain) )
> +        return ret;
> +
>      /*
>       * if no other devices under the same iommu owned by this domain,
>       * clear iommu in iommu_bitmap and clear domain_id in domid_bitmp
> @@ -1719,7 +1728,6 @@ static int domain_context_unmap(struct d
>          iommu->domid_map[iommu_domid] = 0;
>      }
>  
> -out:
>      return ret;
>  }
>  
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -52,7 +52,9 @@ static inline bool_t dfn_eq(dfn_t x, dfn
>  }
>  
>  extern bool_t iommu_enable, iommu_enabled;
> -extern bool force_iommu, iommu_quarantine, iommu_verbose;
> +extern bool force_iommu, iommu_verbose;
> +/* Boolean except for the specific purposes of drivers/passthrough/iommu.c. */
> +extern uint8_t iommu_quarantine;
>  
>  #ifdef CONFIG_X86
>  extern enum __packed iommu_intremap {
> 


