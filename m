Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BBF4293CF
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 17:50:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206251.361777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZxYy-0004sG-0h; Mon, 11 Oct 2021 15:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206251.361777; Mon, 11 Oct 2021 15:50:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZxYx-0004pT-TO; Mon, 11 Oct 2021 15:50:03 +0000
Received: by outflank-mailman (input) for mailman id 206251;
 Mon, 11 Oct 2021 15:50:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZxYw-0004eL-TD
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 15:50:02 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c7b68f8-b54e-444d-82d5-c664632bbe2e;
 Mon, 11 Oct 2021 15:50:02 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2052.outbound.protection.outlook.com [104.47.6.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-9XvOW-zMOgSrrKI0mpECww-1; Mon, 11 Oct 2021 17:50:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21; Mon, 11 Oct
 2021 15:49:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 15:49:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0268.eurprd06.prod.outlook.com (2603:10a6:20b:45f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 15:49:58 +0000
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
X-Inumbo-ID: 7c7b68f8-b54e-444d-82d5-c664632bbe2e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633967401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A9/oEyYBCSGDGWRIM/aTw/o9H8erJ5NYHygtSAoLsik=;
	b=O0QSQYm6pAXN3JsYGOcrdnbTZKl34CDPMEfl32NQgzCD/5HYF8OYNOMgWOdsIgSK5IHfHa
	Uy0pjHN4TKVc16Z/sXh4JeqhZQRSM4xlehsprlTIcNakbfGvvmbwU7tCy4tRfX2SBfkdeo
	ZV2Zw5jmABk1aiunTHe7/mBXd5IBOCw=
X-MC-Unique: 9XvOW-zMOgSrrKI0mpECww-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VRaOFybsDkmw+ELSzf9fZqu1VQtAkWfoxV5V6rP88XhMdv6kDEURzlZNPXSUg6F0ysT3qUVSgsBEr73INa3aa8mWG9ixQqdKE2x5Uz6mgnN0Xmkc4vN+miKkB4ikj22tVvLA3TtLHouFDY2crPIQHBYheg9BegaiV4oZZtxGebALHVFQh50rRTO1xf+oJmj7Fj1m5Vc/gt0XHddZECCuaQyewLqTjUhrkkv/IG8FDAcY6+PM4cPaaL1zLLgNUtJo5UlcF6X3jMrTyhLbM3bJob8IfY2u1kkqqNFbv3K375rM3IC8U5qogRhsMM4OG3Pbl3RV5jQIFS1UjvgrLp6sMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9/oEyYBCSGDGWRIM/aTw/o9H8erJ5NYHygtSAoLsik=;
 b=eBQPqXrWEYW57fMqdx16pA6SSsqmAsMt5xXBnmUkXFDgsdsNSAnE2utsB3MU6fYhinDRs2x1mNqdL2BW6XMPTfJ5HwFyTnd3UKn5d33CmVn/HQEOewjMHGOflp+w9CSEeoCFjXf3nkQ5zOBx3ghdz36ztBq3A0vSqOXDbKCtImEFlWXsCTclFEo8UtYidc+ocjsag8uvka0h1ru6JZOeU7KbDsP2BTubsYX/2Qk62fjtAHZIjy0xizjL25opvFDK0PL+uJTD3JIVQ7LfvDLQaYs3zYhKHDgX7IR8gbL5rCcIOsHHwkEyDX/9115oAcj9nV+L/PW+o2kcZwy9HaRt6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 34/51] build: start building the tools with the
 main makefiles
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-35-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <31b68411-3b98-5714-9990-e19ae45fc485@suse.com>
Date: Mon, 11 Oct 2021 17:49:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-35-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0268.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5193c708-d52f-47ab-4ab7-08d98ccec7be
X-MS-TrafficTypeDiagnostic: VE1PR04MB7360:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7360C28A0289F9CF6E33C20EB3B59@VE1PR04MB7360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:439;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tWJHj1oSpN9kk6qFxu1T8wJ8prEmGmrsPYd8iGhO3RZhm9GhvocHfgEoH03r/+hcFL6VGnwP2cqoIfay9c8i2E5xgytHVUtLuQG3Qqm4DQErbnPqkrOgSmXTuxALlsZL1y8GZU5rc0rPPD38tm8VNm7JC0RiHVAVFUiMb962IDVKeWPj5NhHFqznSXxoMGMHpaUIkKdIA+52IqSqfGdyoXq/lyoxFOtd65bOwfXTSLXEcC+Js/KXzJoQPtiEHcTffnzLappbwlJTZzHmkSGYQd8xpO2ae8jXikvPiPYJNIdTmc6wik5gxQJd1uNw4dIbiGvVnPgZ4bY9bEg0qWU2clgC5ba59FDgXzpcoisGXiDx/jrhmorBtTQzyzrdLA/RS7xCiynONupE25hiK37dUdZNEciWjMiyeHCkdpNtaYgvyi8yt+aF2CT9uBTtYQFFNoKIhUDaerzA7wha3gceD95z4Sbe0KSPqHfyHCetjOOoY7UajYZx37yIAxyUBbZCeKPJON+KvTEdBNld/vQiASEM3qrdm1YxvCQgJx7t4KOYqxwSPtaOupEeqwtxoWGl32UOp8xjz2o/LFdvSSSwQ0hJU+/ivRKJeMYDaseV7bLRt+Orlu0HkXWlLUcsnHTadXKuZjVhSklBkqrekplL6UTiHzhuMmJomut9ZLfhXKjHlyzY6iBHcocGvNvINwoTtm/npxSjce/FNigXyoIJ9IKAl0msmx3XPPcByWA2e+jdDPG+0dyAmeCaFDzExDS7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(316002)(8676002)(36756003)(31696002)(54906003)(38100700002)(31686004)(508600001)(86362001)(6916009)(5660300002)(4326008)(2906002)(956004)(26005)(6486002)(558084003)(66476007)(2616005)(66556008)(8936002)(66946007)(186003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEgvRVlOODRkdzFMQ0twQ1I1RXhUYnpNYTFzTHZSaTRIVGNFdTZienJKUEZz?=
 =?utf-8?B?MVRaVXJJUjVYTnNjQXZPemxNcXB2azVCQkorMkxwQTZYSDI2NTIvWjEzeEI3?=
 =?utf-8?B?T3QrRHhkWDlZUklIYXZiQlVSeEpLR2JtQmtqTWhxdi9JR0NNaFJUaHNNOUQv?=
 =?utf-8?B?U2hkb2gyVDBzYWFncEMvQ2FEeDcwZGFPdlc3N1p1bmtxT1RnQi9FVlU3Z3pu?=
 =?utf-8?B?bFFsTjdwUWdmY0hnMG5UaDJCMU8vT3p4V2cxSmUvd3B2QjVBR3c1c0MreWxX?=
 =?utf-8?B?YjVzMmxpdC9rRnJrdVJMMWFNOXo4aG9NYmN3YmhlMENqWHlSL3VQR0VBZGZO?=
 =?utf-8?B?a3FhUXJHcVpzT1ZvWXlKV0dCbjN5RndNdGRNM3Q4VElWdHZMNzdNeC9TVE4w?=
 =?utf-8?B?WFdtWVlYMmZmNnM3eGZKeTlXWkVVMURjN2NsMk84UUlVLzlGMTJmUDNua2s2?=
 =?utf-8?B?YUo2dUlGT0VPR2RjMXFhOC9KOTVNM0tEaTJyTXhsS0FhMDNJUisvSEJjUzhJ?=
 =?utf-8?B?TGozYzNHem15K3cyU3VVbVFvd214UXJlSFdLWXZ6WS96WjZDRlJrRGRtdWIy?=
 =?utf-8?B?d3FVQlRDU2xwQktaYzNCRzBRL2lBNDRNTmRWQWoxMXVmZU9FME1SWWh3MkZ1?=
 =?utf-8?B?TjYrL3p1VFg3cTFMMmxIZitXemNlazhMSjVoS0RkZE84dHRnT1BmamdOSThy?=
 =?utf-8?B?d3l2TEVmSDFmaTl3N0VXa29EalN1NDV4Nzk3TWlpYUpjNlYvMHZEUm84d2kv?=
 =?utf-8?B?RklTdjlpVVRTU3Bpc2kxNWhBbEJ3Y2x0NGM3dFl2c09ud3liSG1kQnhTMitp?=
 =?utf-8?B?Q2kvYTZPZFhQSFhkZzRrTVYvc1QyTzcvU1VydXg5bWdWRk5zbnhOcDYra2g4?=
 =?utf-8?B?bHJ3SXoxWHBYRUtrbzNSK3dTZXAyM3NETWdHclZvVzZFS0pVMGNqdWtoV0dV?=
 =?utf-8?B?K0xrQkk1OWZVbzJoTHFrMXBqNEQrVU5QZWhWWEwrMDVveG5YVSsvc3Q3bkZR?=
 =?utf-8?B?OVloVnl5R1U5SWVKQXJZeWd1dHo0VHorZTlEKyszeUJOVjhaQWFkWmM2Uk02?=
 =?utf-8?B?dzJqNzlGa0luYkRjUWh3M1p5RWZLaFl2dnFqQ1gyOVhDRmduZ3JPVGRmUmkv?=
 =?utf-8?B?cWpqcElUa2lROWJtVDRkaEtWdVVDTytuZ2RWYnJlVjRBK0VCRmVCVStYeXBC?=
 =?utf-8?B?OS9RcGhnaXJlUkk4cnc2bkZjdUtvVTVQOEcxMk5kYnN5L09RcGNVQmdra0dD?=
 =?utf-8?B?cDRpdGhtSXF1L1dFMUZ1c3BKd1o4UWxvNTJEbWl5Uk1vdnVpYTdQbUNEUTNK?=
 =?utf-8?B?eXN4ZEJhR29URnZUaDFvUEtjTDJXL2ZwR1FZZDBrdnNRWHdvUnVkZCtUOEhV?=
 =?utf-8?B?ZTRWZHV4Rmt2TjVzVXdZZEw1WDNwMlVHTkpQaVBSSXQzbW1salBLT2dSZmFJ?=
 =?utf-8?B?bUtGNW1YQTBad0syQWk5ZlZYUE9VMGVqZy9RUWcwcEdmdkpMc1A3emFwR0Zo?=
 =?utf-8?B?dVd6SlFKU0N6bnluWVJabHhGSTYwTWl6aExMQlRrR0VlMXhOK3pSZ0FvTFNL?=
 =?utf-8?B?VzFSTytCWTFPVU1ZRGQrbE1lY2RGS1g1NThmaG5NVFlHRWMrZHNyNEE4Q3VN?=
 =?utf-8?B?YmxWVmtrRmIzWVBPeXZDZHJvUjhzOU1WN3hNdXVWQ3ZYQ3RoWC9UVDVoUzdQ?=
 =?utf-8?B?QjRBaElnWUZzTTlzNkdlOG5vWDcrZDZacEIrYi9xZGExTXpReHRSd0NOcE1H?=
 =?utf-8?Q?mRo0SriZicC1gFbx4Zhqo76HJXL6X1gAEieW8K6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5193c708-d52f-47ab-4ab7-08d98ccec7be
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 15:49:59.2614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: POD2qdzcrNbLxrgiZzw2WYud3GF8YdeLc0ApkECjctOyKGB3AXc4wcb/TUiaQ19ZjjG0WJClaUjiACqxdTJgEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

On 24.08.2021 12:50, Anthony PERARD wrote:
> This will make out-of-tree build easier.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


