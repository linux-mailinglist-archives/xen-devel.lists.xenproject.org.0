Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2510752A78C
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 18:01:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331212.554694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzdY-0007yQ-C8; Tue, 17 May 2022 16:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331212.554694; Tue, 17 May 2022 16:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzdY-0007vG-7i; Tue, 17 May 2022 16:01:28 +0000
Received: by outflank-mailman (input) for mailman id 331212;
 Tue, 17 May 2022 16:01:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nqzdW-0007tL-CV
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 16:01:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a7e5821-d5fa-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 18:01:25 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-W4kNW47LPYKs4VP0Es4TBw-1; Tue, 17 May 2022 18:01:22 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6143.eurprd04.prod.outlook.com (2603:10a6:803:fc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 16:01:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 16:01:21 +0000
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
X-Inumbo-ID: 9a7e5821-d5fa-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652803285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d5v3G3+BraA82fxzDjxTDmF9Gk+PZLfgeFYLnG4c6WE=;
	b=jX7abhvrsDsKYAoKxPB1qbWih+zRySorqcPXSK+w3ysKWlpU7LZOOnM7DgoEHOTImt/s7z
	mBMFKOdTy84v2o/YsHINiMaKKpDZDldWxNArRF7Vel1y9cMcHgLesO4QkNAJqKuVHmiEye
	hyowsbgF7DoANBPVCDpytOmKUgK9rjs=
X-MC-Unique: W4kNW47LPYKs4VP0Es4TBw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GB70hOWRanEIeNYo0ESI1xQVxyzPMqCLZhSghlckgaKnt5uFmxM6MRIpvAUPMJ1kybWtS03CMwAsNiltyjI8irYx/c1UhCMvkUlHbER1/0ageHBwJfncabXLawz5fau1PVsPgeQTC93e/ZjQRhzoJz8QwmnZ459IjrrVhxBWozBApCIgpCOPV2POtInMUsZ/WXd0YyJe863hQ5i3nIcu055rIKRP655HMrdqZchNDTA5rWvMF/bbjdALTqmSEErA/YEfc+nbtwwtu2i6InpdmBLmJx0xNagn0tef84PwuO1PXPIpXKakyCvX+QhGfkDDipBaJgwVmfZxhrFMzKbVuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5v3G3+BraA82fxzDjxTDmF9Gk+PZLfgeFYLnG4c6WE=;
 b=YY2lMyyQf+dEq7lNdDZMxSzBHmwX/rO2sslFIU2O5u5oLBJNkGcaaFFDgfMHMRNNsobs+G0d6R703ExmDevvjNHdjhqTOnOxc0x7Ok68Y8rVZWxmFqZFxYO8TWoNjCU80BLGxRbwv8w9fLZRIe3lRLyYOnYBcJ8euh2NwDJSpH18s31EpDO+8bT97Bj3d5gels0Fk6RmuO872XHebbKDXy164fhQlr7K7c41fAnIcDDVw2NlCqyGTbQ6+dZT2rCA2x417c4vP5UttG4zvXdU/gu+5QTw2R69pCQ7+MYyZQ9bcEmdL3TZowWS8c7JL9S0F1qM7t/fSUtUsf2g2FJC2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e587d965-819c-993f-f5fc-0d863d372507@suse.com>
Date: Tue, 17 May 2022 18:01:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 2/8] xen/arm: allocate static shared memory to the
 default owner dom_io
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220517090529.3140417-1-Penny.Zheng@arm.com>
 <20220517090529.3140417-3-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220517090529.3140417-3-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0566.eurprd06.prod.outlook.com
 (2603:10a6:20b:485::27) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: debae675-64a5-4d34-0949-08da381e7c5a
X-MS-TrafficTypeDiagnostic: VI1PR04MB6143:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6143370F91444CC311EA6F24B3CE9@VI1PR04MB6143.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+N4KJaQW/h5sY4CMYhmy8ncSzSxvEdNFLQWW7e0VZj6htA5k7Wvjqk/7Pv3JkRsbKk6UOWSrqQbWDYc1HKw9wWXylx9mFXEAxKuwAbI85Bwwj/ShZN3SO3JcBw0LvWSv9UUkQ9fBu0fq4WyZMBEtROXDxaZwSdDRe0JD4m/9kwC4YhZ1AsoH+39J0HwJ1POIKjAr9Uk8ILmSZiMFpfkusjbQNr+GPV328lfqNs6B9LA8LYTFpyFxm9/nG7V7JvZ0YryvWEo3jIosDsi+SEH8GoHveZjpvHaKW/o4vYIU9FbINDMfsrLqVrxAWl3D7169AyYQu4dS82Ihi3wHE0fcQod6cf15OE1VzYMW6hbCwotuAUAk804qgqKQgHadm6c2v/wlCbuSNTZtfAtvVPaDEXYePGivhA57HdlPyozHzemPL4zs5JPfKTwys+5UM7gmSSssxmC3Lzw1Y1vqLjqbe5NwR+B09fcyqEGtkXEm6za54tcQqg1TYevnzLcXCcWPGhJ5/u9JWQ8FiFyH9pA6a9GcQfJ6thjYx+AMOeHxvGBxwH2ux4jaqKuLxMQluTLD1QmE9esZQEZchvf7Z7I7r/I8DiUUYJqSXd025YUhQNu9hvggmyO3b+MFMTQOVxUJGdPQKFC4mjAvHiJZ5DERYMY5Rk3hOxR1luuhw0uP+TunxgGwDlEIwDlRbojcxe8pLoH/L4KKXYM3F6jABEeUOMIm4gKm+umGuBTlgv1/GbLyIpis1rluxRJ7jO3WMQxr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(5660300002)(8936002)(2906002)(4326008)(8676002)(186003)(2616005)(66946007)(66556008)(53546011)(36756003)(26005)(6512007)(86362001)(31696002)(6506007)(7416002)(38100700002)(508600001)(31686004)(66476007)(6486002)(6916009)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEVkajZFbUQyY1JnM0hXWnRkczlNSEJjQjBaVzJ5clVjYm5DTndiVVF5dzV1?=
 =?utf-8?B?MXZkMG1BWkt5TVhjdExRNEdJdzJxYXk1ZlJQZkJDbExnMmtJZjhXQksyTUVv?=
 =?utf-8?B?ZWIycmdZTXN5KzJtTnNLdjhmRGV1Z2pUd3l5b29KL3dyeUJuZjdYemx4RE5D?=
 =?utf-8?B?M0x3aHpad1FsL2sySGlwbElIWkZzSjdWbGU2NjVUQSs5YWZCM2FuZytuTUhn?=
 =?utf-8?B?ZkkvNVZuUkliN0c3dXF4OUlBQUhGc3kveDJwMkJlckhIMURKaHNKbVRPbGxI?=
 =?utf-8?B?dUwyd3pGcUFiTmNxOURNZXlleUJLV21ZazdTM09vTklYVE5tMDhLYis1V1Az?=
 =?utf-8?B?NHBKMkViNndLbG9XYVNReE40OWFvcVVEVE1IbHkrOGNjY2dqd0ZwN1RYMmlS?=
 =?utf-8?B?Uklsa3B2dncwQmhMTkVFUlBSN2FsSlFPUEpJWHJJM3R5Mm9TMTVkMUZURzhF?=
 =?utf-8?B?QVFOVHE5Z1dGazJkd25IQnF5NTFpK2RMNHd1MkNwcjFBM2ZDQlllQU9vemU5?=
 =?utf-8?B?ZlZqRnkxNlkrTlV0bTBvc21uZ3N1UDZWRElvWFQ0ZjcrQ2F6VUFCRE01TW9O?=
 =?utf-8?B?dGswQzU2THdZZ2RUOWhjZ3RrMHBQY0ZYVlRTT3dYUk9FNG0xaVBBY3YxUEFF?=
 =?utf-8?B?TDl1WmJ6Qm1tWk90Qm1ZTFNWSFJkc0V1UTVPdWE4V2lMR2h0SnFjODNpV0lq?=
 =?utf-8?B?YWlTRHlrVXJTV01MalNoa3pkOVNiUllqaHFnQU1BcTB1RDFFcHcra1VoMDgx?=
 =?utf-8?B?UUhNbTM3T2d1c3hkVlNrZWxsUGFpamJkNEg1RW5hUXIzMGw5R21HbmVGbWRN?=
 =?utf-8?B?RGpnZG9LWEhCbWVqNEljTVIvSzhvTnBjT0dOZStvU0RQa3A3bE9rUFhBbHBU?=
 =?utf-8?B?L3l0VHJDQWZkQkkxT050ZTVxMEl0MWpSckR6elN4UFdvV0VmekNaUVFCcXRh?=
 =?utf-8?B?MERSOEsvd09RVEYwekRTYXF3cEJRbW4zcjRTNG5NTVo2VzVZK3dlcWs5U0lG?=
 =?utf-8?B?cGYvNjR3OUFtOGwwUXVlOW9VQk0vZDEyeEFBOHR1VUhmNGJ1SVduK2RObXJj?=
 =?utf-8?B?ZllGNTd6OUxxbGpVdzVKZ010dGJQdk42ZEJQMHhVQ1pGMkRTYkxPclA1OVQz?=
 =?utf-8?B?UmhwaStORXV6Y211cDgyaVFqS3FoRjZDekI1c1N6Vk9zU2o1SW1FWlBiak1q?=
 =?utf-8?B?TlZMSTdRUFVZN3luVThibnF1M2VPOW1MV3RqVGlSZGpRbWpHRzU4R080aUxv?=
 =?utf-8?B?RHVHVTF6U2xIbk1HTXlFTlZaZE8yWFRIZFllTjc2b25rQ2pIQXk5NWJjcGUw?=
 =?utf-8?B?cHk3WVU0MjVvc2NQWlJuaFZPWGkvcjNxb1VGQXhCaThDSEgzZjJkQU5NSWl2?=
 =?utf-8?B?cmh3ZkJyNGNQMlBPeWFlTmtLTGNOQzhtVktPU0xRbGM5K29QR1huN1lsUk1F?=
 =?utf-8?B?YkluVVdENzFGM3hmcW1Pd3QxOExDNUVYYThTREQ2eFJNL0FrTysxcmhYYkwr?=
 =?utf-8?B?UDRleng0U2lZZ2cwSGFMS1JueG4xVlp2aTRmQWtML2tsbWJPR3hpcmlLM1FV?=
 =?utf-8?B?TjVnYUYyM0hPZm0zY2xYQXNBMmVaM3hsU3lKSG52R05XOGJZMktRNEpndlNy?=
 =?utf-8?B?WjhnL255aGd5dnNPN3ZkY2JZUkwzZU1wUFN0bnRlcDJvZ0RuTXpwbVRlYmM5?=
 =?utf-8?B?NGxJVkpBODE0Z1NVWlVVRW5sTi9LSGpWRjFBdXVWNU5Mb2pDVVE0QjJ1QkdP?=
 =?utf-8?B?UWRnVndncVphSmxmMWNkTWN4UFZiZlFqOTh0dGdCcjFFa0JKTE9EeWxtZEh1?=
 =?utf-8?B?M0tFZDNudDJLc0tpbVRUQllRNDRPcmoyV2RyUG43MEhOb0tqaHJmVGFiZGR2?=
 =?utf-8?B?Uzg4cUhUMkJYZkM0VldPdmtSbzB4UDBOOE9mY24wMlVtTkExK2FUVTAyblJu?=
 =?utf-8?B?Rlc3dVNNdm1waXpOcmR5b0g1VEpzSFRvZUJQN1FTNjFMUU82MWxXSndTNlJi?=
 =?utf-8?B?NXlvM2ZRNWJkaVNnZjU5TGlkQVZ1bk8yclFsVGE2ZTZ5STZXNXlwczJsbDFS?=
 =?utf-8?B?T1h6dGVUZTdXWHhaWm5McFBBODZHdXdyQjBvOG03UEJUODBEb3ZZbzU1T3JD?=
 =?utf-8?B?d29vdmRTWFZtV1poQmdoUjB1M0dzUmxNV0p6YSt6UHlJZUxicmxSakprRXU2?=
 =?utf-8?B?VnJoKzlmdjFMWWNZN2FnUmNWM2Uxem4zbEVhYVlPZUtJYUVMc0l2M01TL04z?=
 =?utf-8?B?eWJ2UUVaRmtMem44ZWZVWWFhZktLbHRydVVGb3lISXRrQ2RFdmZaV3FrUHpH?=
 =?utf-8?B?bExMbys4UFI5TURXTlJnblh6UWl1clI5dHpyclRRQmFnVzBFaytCUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: debae675-64a5-4d34-0949-08da381e7c5a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 16:01:21.4358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s1yUEZ4bW9Nf8EcIBk11UAyLZ+d5BveFDN3Dw9CmKPLm1emQhGVeQegAjoITLVuLh0wqM2vUX5X26oMyOTby+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6143

On 17.05.2022 11:05, Penny Zheng wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -780,6 +780,11 @@ void __init setup_system_domains(void)
>       * This domain owns I/O pages that are within the range of the page_info
>       * array. Mappings occur at the priv of the caller.
>       * Quarantined PCI devices will be associated with this domain.
> +     *
> +     * DOMID_IO could also be used for mapping memory when no explicit
> +     * domain is specified.
> +     * For instance, DOMID_IO is the owner of memory pre-shared among
> +     * multiple domains at boot time, when no explicit owner is specified.
>       */
>      dom_io = domain_create(DOMID_IO, NULL, 0);
>      if ( IS_ERR(dom_io) )

I'm sorry: The comment change is definitely better now than it was, but it
is still written in a way requiring further knowledge to understand what
it talks about. Without further context, "when no explicit domain is
specified" only raises questions. I would have tried to make a suggestion,
but I can't really figure what it is that you want to get across here.

Jan


