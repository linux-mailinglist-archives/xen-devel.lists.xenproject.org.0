Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FDD416BA6
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 08:39:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194950.347358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTeql-000371-Ha; Fri, 24 Sep 2021 06:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194950.347358; Fri, 24 Sep 2021 06:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTeql-00034b-E8; Fri, 24 Sep 2021 06:38:23 +0000
Received: by outflank-mailman (input) for mailman id 194950;
 Fri, 24 Sep 2021 06:38:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTeqk-00034U-AK
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 06:38:22 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58a4c971-d3e1-4211-9ad1-a9b492028043;
 Fri, 24 Sep 2021 06:38:21 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-LMzXYZvKM1WhegGBGOgIAw-1; Fri, 24 Sep 2021 08:38:18 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2334.eurprd04.prod.outlook.com (2603:10a6:800:29::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 06:38:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 06:38:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P192CA0025.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 06:38:17 +0000
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
X-Inumbo-ID: 58a4c971-d3e1-4211-9ad1-a9b492028043
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632465500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yeXPBeXfD92VrJgIPKVAT3xAa1YNY34ei/eCe2HJlTM=;
	b=Qd+Qfl8B84s1JT7QcG7HSBlpF08DATImJ5L7n2QkheDfzY6fdmV5y9t7BrY9H9L6ixPxjh
	YGSVxxoz18Vh61bv5euR+uPbnrooKd2MGU94yAnpSo0DmPdCkgCPuggg5QSTfQFkyJokNU
	TDISJrmh3aQt2SviHXCa6xmFiotuyPw=
X-MC-Unique: LMzXYZvKM1WhegGBGOgIAw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzoYykAEq0N2VnSwePffQr3pnaWiSh3sjqS599GtkTk1npASbuCAJC2UhjDNoAk3R543MCrrQjwowd/eJYjVW7payCb8vRv3FjZDCCER+9v2+vsmy4hoUkG4uAtIs6VQbh+s1Yhz99lsHtI3dgQeQkenAok1h9PCX3EAvJWZVSFzolkj+We2/Off9NVZwaa8MPnZIEPbtUlyP4R2n8QkWbFXA1DXktnLfKSx/7E4zuXRJqIDG9AIl78wcd7VUCRVPPqRfBh3HsL7h1q68aUpSyPDpDOL0slWJnGEtVixzP6+yOqkEQS6Krf5qJWP9Rs51FvjOeNWlYSDyd1aTQs26w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=yeXPBeXfD92VrJgIPKVAT3xAa1YNY34ei/eCe2HJlTM=;
 b=MqwUjqBvY9W8Cmmo5KspKVcAVXy8H9XLAaQT9hU2D2NrS7sE0J96UeRXgeMm0h13dO35x6HiwA9UO8n/hp1AlTrC85Pvj7LgtwIpOiNpvnU5ESXHMWWw6CBtS/gfVQqJBMebrc+eUnyyovJbz63AbZKUdvruKv47TWsYnb+emAVeMwQY3SRBd8mhGnTXxc6l/DJfQdq4qlQFSK0jHMNYr0nwkybbqgfOOTLsz1yucMTUWC+dxsPETw4UfssKEhFvikYqWxaOEp7fHuljZJsmH79YytKC1DNmKX/bo3UkUyWwx7GDSDfjKt544qvH89t/uRSZff+LWFTE2PcErp2Kgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] pci: fix handling of PCI bridges with subordinate bus
 number 0xff
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: paul@xen.org, xen-devel@lists.xenproject.org
References: <1632445619-9211-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <80a1c6d3-8b02-8052-e69c-73d8afbd1e43@suse.com>
Date: Fri, 24 Sep 2021 08:38:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <1632445619-9211-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P192CA0025.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e85ae663-3b88-410b-2f3d-08d97f25e49f
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2334:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2334A45B40F0D3E2B3EE401DB3A49@VI1PR0401MB2334.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LTO2X3N46BdV6cLGNEMLGWjuaH6CgpPdyPnzWwzQpKiPdHrMcgvcGQElIh3tDistQqpbRScdNlarsZMkCaniJH6qYvPIuUioJ9dhEq8Ke9Oz6MTHmcifheHpdXanrcjmc1VyQemwV3nmHuMNRcnoYTXgkjG1/1e9QKOU/u+e3ipDyDN3NtYhASsOE/tqPO/Jucyk/57l/zL5seRFFPb6GhcSwLnznyzJ2Q1QetHgnm+S1oLLrkGf0Xo1cVHsQsz6EHsctkkpcd5NwEXmHDGhUFX5nQlGyWGLGeIopP9TAk6NkrMV4WUzG5acmIrD23Rnuci7GrYsR7vBMg4/FvUxvD0baWMDjRLXr0hDGSFM109M1rbpn/IV3tASXnsfkvfONrbjg1zyZ0UYEatI3VbFA20PJrb45e/Q51qfkfRNVUojNnn0OyjgZrRem7d9/B/p9/2qONE2KzDkFRbnAvVtvzC9NEruRdRwvxWbsm7dfTSlpOzLLzkH3HoaxgV4DhAyiyceI1xFga/RFeC7F7cfy4Bseg+hLSgYO8af2FqRwN9yquKJIRUjFKd6JVEdqoRD/cZXS15VRDyzfjrFma4ZLlS5JO0MJNW2eUua0XFNdd6MWg8MCTkuDIHMRimxqkoPyeImnLkbjQACDjr3g9JDrYsLGc6yHF/WV+zwlwG7Uu4AnxeAKX0upH+j3WzQRn5p6GIVvQ53U33iSsisKUsmuBjxmH5w+F+PZyP+2IbHfcE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(4326008)(66476007)(8936002)(31686004)(2906002)(4744005)(38100700002)(66556008)(8676002)(6486002)(316002)(16576012)(66946007)(53546011)(86362001)(186003)(26005)(36756003)(956004)(2616005)(6916009)(508600001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXlFcnFDczNYZDBKM2dROUVzdEZLSk56cTNvUGFCWWZZczVDMktvS3h2VEdT?=
 =?utf-8?B?U1pzTDhxalBDQ0g4ay95QVNvS2FyeVQzZ0h5V2NPNEIyeSs0aUZiSzJzalNk?=
 =?utf-8?B?REdWTFkxSzNjejVlTlM3cXFxdmFkcSswUFNKb0N5US9GUEFQUy9lRDJoeVdW?=
 =?utf-8?B?K3dudEY2WkFUNHZNVCtqUy9sTjhYMWtSYXVVd3htTmU5dXJmM25scUNKWW5i?=
 =?utf-8?B?MTJQU21tdjFudEJxV0FGTldmOEJ5SWFIR2RqSDJXUnZlTG5qaU9YOFF6Vkgr?=
 =?utf-8?B?bTcwamJUWVQvUkU0aFdxbHpDMzBsYU5DSGZFWi9DdjJVWms1TWV1SUQvQlcw?=
 =?utf-8?B?ZVh3Q242S2JXOTEyY2RRZUZ2WlUvRXlqdElpbkpjRkRvZnQrNVhlVjhPWFRB?=
 =?utf-8?B?dmlocVVoLzVwM1NNem9IUVRzeWkzS1FxUEpYTWRJcFFuT3NiTFBoS2wzejZG?=
 =?utf-8?B?OTFoeWtFU2hFV295SXU5OUxSMDVkNzlTdVV4WVh1WnlOdHloM0k1RU9RaHlr?=
 =?utf-8?B?dHQvenJXRlNEL09BM0pjQWRoVGFiM2pUNm1FZm9VWUJ2L1llVmRhRHVxMVVi?=
 =?utf-8?B?NWNIdzdSR3BzUkY1QnNSdy9JTUZuQU9mTzNJZW9LbkNnNFdreXA0Z21CYkpT?=
 =?utf-8?B?R3lsaHQ3Q2YzTk1sS0VNUTE0NVlSME9tYnVvK0xYQjZXS0dwUmhpdzB2bmNH?=
 =?utf-8?B?ZUFmVjE1Nk85Sk82L2FsbzRxMStaZnl4anBSb1hhZHNVNERvdWpNZkhYSXBl?=
 =?utf-8?B?OXJlaGI0Y0xGSXdMazVNMkRRWHpHblZxSUNZUTB2WkhQRllaUm5Ea0phUUhz?=
 =?utf-8?B?b3JEWTBXcUE0UndCc0xSREVVaHY4WjdaTUJ3dHd0TVRxMlVmM040TWxxZWgw?=
 =?utf-8?B?TFU1TEV6eVRCMzhTTHpRdGtnZEJhT0xNTUxDRDhndkZHdzF5TnFqbTJKSVhp?=
 =?utf-8?B?ZDgySlM1clBUOU1Fb2hrYlVYVUJCdzNobXZKZjA2bW9oNHRjeFBRdlZ1N3lH?=
 =?utf-8?B?Vnp5VlMxWjJSSkcxcVZnQ3h3Qll3ekNwc1NEdXJPM2tkL2tlYnRhelVaU3k4?=
 =?utf-8?B?dFlsUXR6WkdXemhpTGh1NmNqSTRPM2FtTUM4a1dhMjJUbnNEbUNGOHJqVUxn?=
 =?utf-8?B?UjhnTUJuLzd1TzZxTFZjMVdURjdvYU9aSTlnclJzS3pOeGxLcUdJTkJnQjdZ?=
 =?utf-8?B?NDQxeEF1bmx3bXlMa1ZJbFJCSTdhblNMaER1RVQ4OWJORVFXckN2Tm1QY2Rm?=
 =?utf-8?B?KzI0ZDUxMml0djhhZG9JaW50MXRKK2c2TkNYWmU1ZkdsS1pwZmcyWWJGRXdy?=
 =?utf-8?B?amk1WjQvaXU1OGxrZzFmcTB4ZWZBTlBGNjg3T3dlOWYrVkJ3MlU4R2FwZmZM?=
 =?utf-8?B?am5ybitRSmVCaXRDZnpaSWFNWStRbU9tMks5OWVseTVsS3hZamNpVWJLSGR4?=
 =?utf-8?B?aWN3ZytZYWZpR2tsMW92QUVQS1p3Nm4wQXhIT2RRUi9yeWJMN0EyZ2EwRWxY?=
 =?utf-8?B?TDg0UFMxVDJCWHNIaFhsK1g4WHFrQjJaTDVYd1FNNkcrOGYrcXNTQ00vckth?=
 =?utf-8?B?dXVpNWoxMjFyNC9ENE5JTkFTSit5a3FQVHdWZ1Z1a25hM3U4aVJiYVZobjRX?=
 =?utf-8?B?TTdxb1dXR09GZk5mOGN3ZW1KbVJlQ25sQmJUT0V3ZVQ2bGtnc0RiUnI3NHoy?=
 =?utf-8?B?WWdCaWd6OVU0d3NNeU5NM0c2STBVL3k5d1h2ZjQ5dTRSK3RXZDhLS2xyNjNp?=
 =?utf-8?Q?3pAuhM54UOIm02XIMZXU/gKaUS53g3mfzHRaQmL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e85ae663-3b88-410b-2f3d-08d97f25e49f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 06:38:17.7120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t702Ru4cKXF7EjZQWB6lFZAnRKa5iH7ehzefuhzMnATUuzSogmz92rlBNW0RfchzOT5/QBl3W/9NbqUQIdCCqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2334

On 24.09.2021 03:06, Igor Druzhinin wrote:
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -364,7 +364,7 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>      switch ( pdev->type = pdev_type(pseg->nr, bus, devfn) )
>      {
>          u16 cap;
> -        u8 sec_bus, sub_bus;
> +        u16 sec_bus, sub_bus;
>  
>          case DEV_TYPE_PCIe2PCI_BRIDGE:
>          case DEV_TYPE_LEGACY_PCI_BRIDGE:

First of all you want to also address the same issue in free_pdev()
then. Further, since we're switching away from u16, uint16_t would
be the legitimate replacement. Plus, since cap is then of the same
type, fold all three variable declarations into a single line.
Finally, as per ./CODING_STYLE, fixed width types should be used
only where strictly needed. I can't see a reason for any of these
to be other than "unsigned int".

Jan


