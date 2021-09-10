Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B6E406719
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 08:12:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184066.332597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOZly-0008FH-Pe; Fri, 10 Sep 2021 06:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184066.332597; Fri, 10 Sep 2021 06:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOZly-0008CE-Lb; Fri, 10 Sep 2021 06:12:26 +0000
Received: by outflank-mailman (input) for mailman id 184066;
 Fri, 10 Sep 2021 06:12:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FfYJ=OA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOZlw-0008C3-Gm
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 06:12:24 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04723aa6-d4be-4eb9-82ee-0b1da2f406e9;
 Fri, 10 Sep 2021 06:12:23 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-pZt-J5z_MeK8YH6e6R-K3g-1; Fri, 10 Sep 2021 08:12:21 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Fri, 10 Sep
 2021 06:12:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 06:12:19 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM9P250CA0011.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.16 via Frontend Transport; Fri, 10 Sep 2021 06:12:19 +0000
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
X-Inumbo-ID: 04723aa6-d4be-4eb9-82ee-0b1da2f406e9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631254342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mSYVLDhbTGIq2aNJOYktFKxjwoOudL5Ur6cAUfGtOXA=;
	b=BANUZWP68SNE4BaWKShWKDAJYMPeCEptgjlUnpjskhc+NEsaTgeeshOJ18Iyc+E+haXHZ/
	wrHBBC+gQh/9L7SPFBIHzP5DYmbkWVBieZ3Nc96bz6ZJYQ2cOl2uji/9vEnwsBK0gffInK
	3gtNCQnxLaeZsbnA+IBhSP6cb3byozc=
X-MC-Unique: pZt-J5z_MeK8YH6e6R-K3g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KK1XLAthrU903TuE2Yiy4hpLWWLjnzSicitxVpKo2hlL9c+q2Ke2GoZsKwyrSlyMqf5gMVjpiflsisNm6EHr/4DEB9mt7YE0dUQXO01Let3sQaOm9wJWIF96Ej5mdl6tSIC0wzlg83fpyXNPDVlRjJgZa2gQWk34OamHW+5iri196qxOSbWJ9er5cnvQjBZKiBv3/fVOXWQAtXUwhhWxmFc7ci7RhKcSFm1G2BHvU2qt4hCxTniGAP/WWH033YGpupbme15+r7fxCKR+DPK4dS8rGnUtSqc7JzlgEA+9Velq/7phf8MGSL6iVPG/FdSwmgSP/UHrB3g/dMA5HzGyXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=mSYVLDhbTGIq2aNJOYktFKxjwoOudL5Ur6cAUfGtOXA=;
 b=aEm3qJBNlBNXUAHFFu+hhoHVyXA1DRCCOE1tUQZQ4PpJsEc8KBsQDdnVoWy/B+hlCN9cTtp3AB7Ajye/rCHzRuAeucwddt3CVyR85JjTGPM2PNdPDpoOp7ayD3aV4zN/bOIyd6emOKuyaGWeuhTS6H8ZNLhOihJXvT+q8Jzmq092gSNs6xKYksAemY4/q4WPmw3pyUf9Wb3D/0yVSTbtns4MvhRod2wN6QoEEm85zXvFLrMbkIrE/qj3zZbCuklpvoEMuOYV5TQCZkNLkUM6OajghH6mKUzSp112603Jhk2mgfNXWkjm6I8QJYdX/YOA/EAb15+xiUhXannHu2kTLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v5 03/10] xsm: remove remnants of xsm_memtype hook
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20210910021236.15082-1-dpsmith@apertussolutions.com>
 <20210910021236.15082-4-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b69b98ca-afcc-3943-d305-706913b8c16a@suse.com>
Date: Fri, 10 Sep 2021 08:12:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210910021236.15082-4-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P250CA0011.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa2dfcb3-4db4-4e17-0770-08d97421f244
X-MS-TrafficTypeDiagnostic: VI1PR04MB7038:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70384648001324A022817DC3B3D69@VI1PR04MB7038.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lbUODLHmWdjPa9XCml0bhaBuKPqxXtP5XDyySuALifegv70iM7wbrfVfOcQAmxbHeg0OuyNsqeDq7xukvnYfWcZbVWxXkNBZ2rteu9glUDJgRQTFU6j420eexxBy1WgdpJakOXOUwKT1tWVZZIy9LzNMdgAN4Ja8RnLpT1Vfm+GvXVnnO2Q83kRVtfDBvn4A6kuvpquMeRGg6FUN7AgMXx2ZJCu9FBbNzqIIZCuBqm/3b0OaoKb0fldhrP8UOfRCSK5TjhSDSHx2kZ39WRgjfXbVwOeBCGKpgICG2+5fcAAl67MhqojrtHZQTHyJdyAnPeoSlkCpKUXgRFM2kOR6u+fmEhJUwy06YLNT9ct0XofScqbxyWLbw8rzbgRl2MNaIZ2jD18CWjJq93VWKutnlJVYS6VqCEzDcEEV1VHCabJk/Bk7Os5NF6bln2r2yEIBg1RBz0u7qCi+L6uvdDYUIStQo5tG3KrZkzqcXWN6k+zsGbOXycLFwUMgrrr/NjAgJuegJaErcFfynF4ILfLpJ+OXU1eLimZBH40ux8JrNQJsAaw4XZHIk5tY1nPiwxI+Eizx/j0db8Yrp4wsvSKvAoGr76pUdKznYvV41ZCV6leTTRXuQI9MKDbdwErp4izkTTQrjP0ZimPzj/ihiB3T8NFl3WvDbii17NKXJgZGEUtJQQBo65zOxRICIZG/1EsNkxXa53/Qw22uqIVYeDoyswP75Hna8/v5/sEmLkr9OQ3sQ4H61/8hyOctodUsgbGM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(39850400004)(136003)(346002)(376002)(6486002)(8676002)(186003)(2616005)(38100700002)(66476007)(66556008)(26005)(31686004)(8936002)(2906002)(53546011)(16576012)(31696002)(5660300002)(956004)(86362001)(316002)(478600001)(66946007)(4326008)(6916009)(36756003)(558084003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STRDbklDcGhZTlpMWkQvK202bGdZckhhQ2JVOThTSkszK3pXaUlYVkhpaytL?=
 =?utf-8?B?LzlvYnNTaFBCVVhpR0MvZ05YYnRndjRFZ3hJR0dtTE5JRkxLRTNIZHNwL3B0?=
 =?utf-8?B?cHluQ3o3MWpsQWNjSWN5bTlweHhCMVhBRHFZZ3VidUkvbm9rOW9VaUgxaFF5?=
 =?utf-8?B?b1NwakgxeW5JOHkrY1RSTkJSZzhtQ3BLSDBLeDAzMEtoVkNONE0wU1p2VVEw?=
 =?utf-8?B?MkxRK0tBYWhqZ3B5UTlOeVVPUkZjZk1Gcnh3Z1BFdGdGbUVUV0RDU0VHMXd1?=
 =?utf-8?B?QXYxZ1FhUFY3OVhSelhZTU1remZCNS94NmRQakF2Tm9HRVY4UzhnTkNiY2FW?=
 =?utf-8?B?cEJIbWdqdkhHMmhjUWs5a0lGZXBTUHNoR1U3blBTVVJhRkw1bXNTMzAxb3Jl?=
 =?utf-8?B?ZHgvck1GZDE4c3NKQ3hNeE9OUGMzc1RidEMwQ3RPcmM3Z1J0ZU1LVGxYQnBF?=
 =?utf-8?B?Q3l6bnhmM2IvWk1JeTZuaWJleXpWNVNhUjgzYnVCV3krQ3psbnhHOUNETm5n?=
 =?utf-8?B?TWpod2Y3eFExV0Y5a1d3UTgxeldUWVdUL3A2TGxnU3hBWFZjbGE4cnpweEpE?=
 =?utf-8?B?U2V0dVVKQjdMM2d0ZlF4NFNqNjR0aVZUOVVvck1VRUNMSnh1MHU3a3dMb0tt?=
 =?utf-8?B?NFhKMEhzZjZLSlFvdnlCY2lEMlltQkRwRnFVTm5hcVp4UWMydDlkRlhpVWRL?=
 =?utf-8?B?T3B1MDBmTGVtR1YxMTdxMzVjQ2RCRjMxMnBjV05SV2hpMzdqNzNScmlZTjlG?=
 =?utf-8?B?b0FqSEhJWnFrWDRZZnE5ZXF4WDhrbTFyYUdjdng4TVVnaUxoQnJKN25yeWpR?=
 =?utf-8?B?TDJsVEtJdlljcU5Yb2dnL2FqY244TTFzcjVTd25JSTBSVktTSU9Bcit1a0p4?=
 =?utf-8?B?aldLWmZCdnN3L242WFovYVhSeXMwV29TMVNGVFYyUEQzK0pBeUgwZU5PTHJm?=
 =?utf-8?B?bWpzZldqa2M4Sm9SaElJZFZYdjdDWUtrcDZJL1NqWVkzTzdldTVic2NRRm1X?=
 =?utf-8?B?c01oTlAzWE83dytoZUN5WTBKa0l0ejFPUlFyVUlPMXlmL1pQWmdxU3oyTVE0?=
 =?utf-8?B?YWFUbjRMckFpQjY3a21DRXk1NEJGcEprQmM3ZWdsMGV3Z0VjcUZrRE5qK3Ay?=
 =?utf-8?B?S3VMdzlwZFRwLzlxdDhtendEZ0JwNkE0bWZQZmVPVXN4OFNaR3VIRFFpTzNt?=
 =?utf-8?B?a3ZqaFNFclhsYVExMGM5MHVlYTJpOUdabE1FQ2FvQjhPd3Rnc1pDQUhGUEdj?=
 =?utf-8?B?VlVweGk3WmZNUHdNdGx3YzA2RFpjRGR5ZkdqeVc5TzhPQ1lJcTIzcGhKT1Ny?=
 =?utf-8?B?SlJvelhjOHRTOUhnMVZpMmpRS3gvMnkvYmRzQTl6YnVaeU9tMEpMeHZCV1lY?=
 =?utf-8?B?VXJMZi9oNXJVMVBLOWd6TEZYL1M2Rm9GWFg4VWhhNnJmclRWNVpYUEY3TGVk?=
 =?utf-8?B?cS9VYVp2ekhjNGh5T1pxemw3VG5vWHlNYlpOS3RIZXNENC9zV3ZQaHNPdjQ2?=
 =?utf-8?B?ZFhxeVlIT3hvUER2eW9Gc0ZqQnRMN3dobyt1b0R1bCtpVDIyYXNXOW05ZzQz?=
 =?utf-8?B?SXNtWUJheUsyT3dONmIwbS8ybm5hQjFHUkttRHB6MktRelFqYzh4YmVnZjFC?=
 =?utf-8?B?bk1zQ0RGVTkzemEwc3RDS1dEeWYwNFBIb1h0bmo1TVIzaThhTE1ZT1lBZi9U?=
 =?utf-8?B?MTFSdnd2TmpORTM2MElOZ21xc01ibW5Sa2g1WWtxWTV0dXZ5b1ppYjl2MHNr?=
 =?utf-8?Q?xAuHJU/lFs/64isONRZKYV+HI8PNDSjXe+33zuT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2dfcb3-4db4-4e17-0770-08d97421f244
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 06:12:19.8482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3mYwecBvnRpqj4wA0q4ZWlclAGmvOCQ26hxBTZmg46BZ3xOv+g4srbHYFKg2IHq2qgJi6VJIyVQQxU8M4Qkggw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

On 10.09.2021 04:12, Daniel P. Smith wrote:
> In c/s fcb8baddf00e the xsm_memtype hook was removed but some remnants were
> left behind. This commit cleans up those remnants.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


