Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D259C3BC6E8
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 08:58:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150772.278735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0f1f-0005VO-Nu; Tue, 06 Jul 2021 06:57:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150772.278735; Tue, 06 Jul 2021 06:57:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0f1f-0005T1-Ko; Tue, 06 Jul 2021 06:57:47 +0000
Received: by outflank-mailman (input) for mailman id 150772;
 Tue, 06 Jul 2021 06:57:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0f1e-0005Sm-3z
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 06:57:46 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0196280-3e80-4dd7-8a53-fe66100d7bb7;
 Tue, 06 Jul 2021 06:57:45 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-pIA2RiI5MZq6LN_45l4pkg-1; Tue, 06 Jul 2021 08:57:43 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5165.eurprd04.prod.outlook.com (2603:10a6:803:54::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Tue, 6 Jul
 2021 06:57:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 06:57:42 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR04CA0013.eurprd04.prod.outlook.com (2603:10a6:208:122::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Tue, 6 Jul 2021 06:57:42 +0000
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
X-Inumbo-ID: e0196280-3e80-4dd7-8a53-fe66100d7bb7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625554664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YnD64+A6ch4p4E5B2CCGRxrSjFWqH1bLaeJb+TgfaSY=;
	b=I1YiFgqRWUjdjnVTwyWeHQQ9OdG01+nOfP6VBgHMlw4fmYN1hKLB0M12KolLGAAUlR4hPD
	tgydeEia9pLbR9CLtfVOrZHdE0uLZFFReshTGqwg+noDFvq9CKadC6YVFM938kBeXkehO/
	wcFJNiaTprTGOldTpyKbKTM822KnszM=
X-MC-Unique: pIA2RiI5MZq6LN_45l4pkg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDYTy/xKNLLNeTfq1eWSYYKN8QhB3oAyn9KYwmJL5nuyfGjmnPfGimVkztNCrHsHR6ZIQY1/vYAJpBd0uC/UcvKgEyAtrEDmNAcm18nxZ6sb5A/Aa9/SJ2rdgywLCkxG0tUzBuWGn2yS+z0I2Uu4nl14hmVAclvfE+6BFhKxFQFH/p5WVF1uY45VdY5+SPz+gf4hu9PpOhyOQXkDPk4SZaIQRmtgqyGaYIoe21KrYU07lLAv6at4nYufWwn2QDlq4SaB3I9V8un2HvWvZcMEo1HhGmOTVhNzx4gV6uF4BACINTJb9GxscNyDrn6ahsybN6UEFHbaKsQx80gTXiYgUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnD64+A6ch4p4E5B2CCGRxrSjFWqH1bLaeJb+TgfaSY=;
 b=VSnyH9Z5FwzH99exB50wMRYb1qlVoW6CZ4e5sjo0Ln3A469gXMnUlrAwS4L9nw94WwzzGi/RXwtGOJEiYCRDj4eWbKzkq+WfAzQQbFn7xj2cUcXltGivhVOn41ScZxCAhch9RDA1OUurKlb4Iw1g0nOByoeNF0FLrQMFk5WzPaS+YE51GJ/Npd87X5i/1Mhq+YkNqXX5apoLXhVwhL+6Wrnkf8Em4Y23wcI7ndHINDfrn3mB1ETSF8kbjkskCazjamt+kUBzrvSMJW4mVWeDNw8mxEKV7XjgPjKDibpbQK3h9cOGSUDsePvcm1PeNV3vwr3Y9OeaR5iX5+McpwShjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 8/9] xen/arm: check `xen,static-mem` property during
 domain construction
To: Penny Zheng <Penny.Zheng@arm.com>, Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-9-penny.zheng@arm.com>
 <f613372a-eac8-f79b-2941-b7cce3e1e0e7@xen.org>
 <VE1PR08MB52155D35A7B716DC7337311DF71B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <20e825e2-0266-3120-2d32-3fde50fe46a6@suse.com>
Date: Tue, 6 Jul 2021 08:57:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <VE1PR08MB52155D35A7B716DC7337311DF71B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR04CA0013.eurprd04.prod.outlook.com
 (2603:10a6:208:122::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c898b461-2c0f-4cfa-0b4b-08d9404b59e1
X-MS-TrafficTypeDiagnostic: VI1PR04MB5165:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5165643B5F4681F21738B208B31B9@VI1PR04MB5165.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gDzpvudh9MLeJix6mQ8mrdpvj1zft3E8u9WFXdERCx2t59rFj6XclDu6wb16NxX0/Rx4LZgnh2cM/0kNAM2f+3pzwZBbDk4TRmc489Bw+any8B8g+J5DXPl/atrqe6m59ujqI0aCrRzvs5wvIcdqdtsTY+3K38iE07ThQRlnVzkvYe/6MA9tDYBm3XOY3bCCDEGFt3h7NX8omw5zmNSlp2S025Vr6VifLi14V6rtltUJ9awSxGbtj42E2CQxDlVN6UiZ0Xg6KXGWip3LIjIBwgs3+pQRJcUB3A5ao0DtogzxBFZ79jH39bCEEMFytnGt40RaS/Z6qoTgwQViccTxRPyFAoF2IPVqQmd7IgoVTyou++VJ0UZQSK04IrMi12d1hq+qsMGf2AEJ1ykWn139sMKklhHAXWs134fxOau7YsAAp5J2Dtk/3StzLsnd7v7fPRgjdGwrKxay89n31d7QRDmygxOoadd7HrVBgVu13PnNviEtNiMMw0PT5/YzcoQDIpv3WbTSrW3X1GFPcnjHtXkdUJgYqdeBtIaGYP2suykvjUgGDgALCxSdlC5k5bZFeV28/MVK+CXaFcEO+huuB1R9O2sp7sx5E/Bni9GzGe3WgxBceyITlNuju0rNfGMkUdDedXpHC1te0j88J5xOoM8df9HBrF4dh0usMlypeE5Q3F9fuz0u3SgpYsGbGkAB8zZDgt1FoRl9uksUmkUcAYdJT8D9hwLcyWIgw6fPa6v3DWv7Ct/8HYeddS5a/3Itahi+O28Gyw+XOR7S6VXBhg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(396003)(346002)(376002)(136003)(366004)(478600001)(16526019)(6486002)(16576012)(186003)(8936002)(8676002)(53546011)(956004)(316002)(2616005)(66946007)(66556008)(26005)(31696002)(86362001)(5660300002)(558084003)(110136005)(4326008)(2906002)(54906003)(31686004)(36756003)(38100700002)(66476007)(81973001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkpvcEtUNUZXNEpMQ0dpSm9HNVdMMk5adkxJWkhtZ3VLajdmZnpwZkMwalZC?=
 =?utf-8?B?dTZxeXJFS2h1aDJqWDJ3SGQ1OGROeW15WkdPOGpWVlVwQ1JTaFJkSm9LV3VE?=
 =?utf-8?B?eXo3amJ5UVJzTWlNMXVJeHl4TVRIQ1Z0S0U2UVVSZjNwdHJSWndEWnU4Z0xp?=
 =?utf-8?B?RVVPb3J5dmI0UGtOc3lRdlRPK3JENkdBTDdmZUlxS29rS1pGZnpPSXpNUTdo?=
 =?utf-8?B?dmMvOXFqbEFKajloQVkxVkhXTU5mUElsaWJabnc3QkZSeE1BY2lrL2cvaU4x?=
 =?utf-8?B?MXFHb084UXAwOHJ3TTRpZU0wRGZ2T2FtcGZpckQyRlF5ejI1c1VmdzdCaVhp?=
 =?utf-8?B?aGRURlB5WHY1elFKNUxvSzR6ZmtoOEtuTE5jNkVTdzRwOVl6WHl6c1FlQ05a?=
 =?utf-8?B?c3ViQWc1UnpwYkM3aXJEbm5iWWJPeEpxT3U3OTFOcW5KN1JzUUFtc1NNdmpv?=
 =?utf-8?B?Rmhjbko4M1NnVmM3Uk05K250REJ0QXhJVFY3V1NGVnI4MlFrOVAzNll3MkxC?=
 =?utf-8?B?cXh3QnBnSXFocUsxV1ZNMy9UbjBZVzBzSjdLbTY4Rnc4bU1Nc2ZRN2JNSGJ2?=
 =?utf-8?B?OHNlcWVCZVltSU4yWXA4d01IbEZGYmpsUyt5M3lwVFZ0b09nZHQwY1ZPUk1n?=
 =?utf-8?B?RmNyVmdCdmZoalNuZ2UwcXFJUDVsNThSdm51NGJkRGpqai9OMGZSaGEvVm5S?=
 =?utf-8?B?dXRXOHoybnpTY3pldytqb3VOd0R6QnBHbHBOQW02cUJRZGxsZW0vWXpITVZj?=
 =?utf-8?B?SjQ0QktpTWFXTGQreFp3K2NnN1hJYWY5ckV4L2crdnJlSzJueUFNYm1FVE5x?=
 =?utf-8?B?TytrL1Q4WmhyeXlBYmpLM0hKVXBsUDRpZmdTYkRtWThCTm45c3FVVlZhamps?=
 =?utf-8?B?SWlCeUx1dkZOSFV1RVJiK0UrQXlDQkFWZlB4c3h2L2tMSGdJVDNNRmMxN1Js?=
 =?utf-8?B?bDlEYWdpSytodDAyN1dBQy9NR0YyZW1YUVZQczBqUDFzTlpIbUlPM2J6UXh2?=
 =?utf-8?B?MS9STUV5Y2hYQms1ZEN3NmgrWlNkWm1Ua05qWTVrMjJ3Wnh4M01EeWxjVEVl?=
 =?utf-8?B?L242akZTQjM0TFp5Z1kvbGVuUDVoRXpuWVB3L2ZMbkErVkpua2MxZ2ZWT1lP?=
 =?utf-8?B?WFVoUFlQenJsZGQxYmN1ZWFlNmZScVZNa1dVcGxERTdla0ErTnRlbDZFczhL?=
 =?utf-8?B?YUNQc2prZDA4K0xrUWFwTFVvOWtScXBNY2hPZ2pIKzVBanBLQkpOSVRMYUJO?=
 =?utf-8?B?S0pBUG85OU45ZjFrWlpoaEY3ZDBvOFRLNmMrVjhDTkRWaGt6UHc5Y1A3dFZ2?=
 =?utf-8?B?cWozaWFJU2FISjhFYWNFZGRqVWJnNUxwSVN0QUFhdEtzZU5NNGRaWTFVTVBy?=
 =?utf-8?B?cXFvRlJTVVVpWlg5SC90UFc2YnREb3lLQ1FXeG1UMlRkT0xkYWRNdVYrQnVw?=
 =?utf-8?B?UnltTk9VRGh3SmJ0dVRJYVNxeG9DNU9rbWtFMzROVFlxM2dCREUzNWVOUXpC?=
 =?utf-8?B?WGpvbDBSOGJCMzJYcWxpUWc2bW9Pc3JiL2tGVjVmcXp4ZWt4OWtRRnFQaXk1?=
 =?utf-8?B?L2hoWXZYRmNsVGlxQ090eFVtcFk3OUtYb2daZkYyenE2ekQweEZ4QVRud1FT?=
 =?utf-8?B?cVZOQkJZSHVrcWFoWFMweVNpaVVmWkNBK3RCTWhLdGh5MVh5VW1EbGphdVVt?=
 =?utf-8?B?cnJNdkt4NzViR3JNQVZKZm1kTUtzeExjNlFra3FSVlE0Q3plZFlLZ1VDdS9J?=
 =?utf-8?Q?cD2aTVv8JAJ6jx4p12Nx8xmk/YjKkeO5rMxIlem?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c898b461-2c0f-4cfa-0b4b-08d9404b59e1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 06:57:42.5350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/bL4lnwu/oy1a3QLUz/I7H335fDKWhjxWroDUAmVx2oL8VfW7NQnEKJlpjZg/h81D+2OmONvCunYP/EbpAaDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5165

On 06.07.2021 08:31, Penny Zheng wrote:
> Hi 

I'm sorry, but since this has been ongoing: Can the two of you please
properly separate between To: and Cc:. For quite some parts of this
overall thread I've been on the To: list for no reason at all, afaict.

Thanks, Jan


