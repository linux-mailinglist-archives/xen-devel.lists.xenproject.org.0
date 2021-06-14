Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 560FE3A66E1
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 14:46:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141407.261205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lslyO-0005IL-TB; Mon, 14 Jun 2021 12:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141407.261205; Mon, 14 Jun 2021 12:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lslyO-0005FV-PA; Mon, 14 Jun 2021 12:45:48 +0000
Received: by outflank-mailman (input) for mailman id 141407;
 Mon, 14 Jun 2021 12:45:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lslyN-0005FO-Gk
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 12:45:47 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64cd0093-c097-4f8b-a76f-fd76d5d6db3d;
 Mon, 14 Jun 2021 12:45:46 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2053.outbound.protection.outlook.com [104.47.5.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-XsJxT8ZBOi6MbaQIMEotnQ-1; Mon, 14 Jun 2021 14:45:44 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3390.eurprd04.prod.outlook.com (2603:10a6:803:9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.23; Mon, 14 Jun
 2021 12:45:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 12:45:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0069.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Mon, 14 Jun 2021 12:45:41 +0000
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
X-Inumbo-ID: 64cd0093-c097-4f8b-a76f-fd76d5d6db3d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623674745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tNv3bKAdlk18Lf3VKXW+E+FXFOtvnHMTt67yV+SM2Qo=;
	b=JORsiz/TcdqELiZ3J814accrtVsLHB/zeAeO54hTT3k5lpbY5DQHwCL7vN6NjSr5iIEvU9
	ox6GoJXI6K0BAcUbMNWXWzuuWJvS5f4YwGk3l0m5BDIqqY409e8FHinw2oQf+5nGaxl8dV
	n+J21Omimz1pbM/e27/OUz6wKlH97xQ=
X-MC-Unique: XsJxT8ZBOi6MbaQIMEotnQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ngZF+J/4kdqQFAduV12XtUpQl1x3ong7PX4IoNVy/PXa4mDhm8fPSBNwDEpA6PgCY3MunJWUoEAYKVyFfNB47ZgZDSg5C8xAO0HoKPMqJ0jpl3VuH0FIu0nd5WZ6L7jWN2qSZP0ucMCJq0kiiZt1i+5sw+25uVme11BBwX0e6KALn7yLzL6xYO0Qc0FvzftADU4pppL6B1TDu2FDK6y+8iUFQq4tzv/pl6AYyaHIuU28MRAWHoD1j5vKWyTsQlDuJSKfBpILiri6EgmMOvDDkhxf31t18a//Pe1XIPE9ZA4zmnec+Q/QaXn1zxSB/24Nz/rNe+uMp949Fmmx2u1mtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNv3bKAdlk18Lf3VKXW+E+FXFOtvnHMTt67yV+SM2Qo=;
 b=UxJFN7p02v+s10AyJb/tv7N5Q70rFRtw+/+axPSeVqpq0ll0b8J6beHHBkaDu9hffsIjmVYyi3CcEgTqOB8SNHHtXkUlwV9KYnkz+NUuTie6iJOSuI/EYTb1i+JNV5DJtYyOtf5XMoO0OY/NLp1ncoxdwknUDZDsT3fzj55fbUgzGqG/I9N8g6rxG5rh8hK/NdRuWveFIUR/7g+MhUPUAwh8OvcEgKBkkRg/GbFS4S0AeJZQu9U3NeGrLWHHPy5Ef3Xpw+d84gi9lqroSgI9foQzVLFbwpgg4ouFccKnxXjN8Vs0LsV+l/X7JvDkvJHGcaPqNofIGEwhi7E+fzwAQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 1/5] x86/platform: Improve MSR permission handling for
 XENPF_resource_op
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Edwin Torok <edvin.torok@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210611163627.4878-1-andrew.cooper3@citrix.com>
 <20210611163627.4878-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3d2c7c2d-be0d-b65f-fce4-402ca4e95a64@suse.com>
Date: Mon, 14 Jun 2021 14:45:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210611163627.4878-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0069.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 090d2fb0-0de5-4eca-5491-08d92f3251b0
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3390:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB33908474269310DAEA798D54B3319@VI1PR0402MB3390.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zks7TxOREUcBshme9fFiLRnddLqHS33SgSvTXpo9Lo/0Qf0ChsjUg8Lvd8FO5mw4cgRGCzw+Ck2IZ85+/hdRU6f0+m3husRZLPh8MA8euucs9ShSU/wYlOoWBonU/fhy5m+b5JXEFnHkdequ/m/qVkWF92MINr9d0+aW657KcrXzT8SVuqD5+7uj0FxbP+TKomoE3Lrb70IdW6EbVZ1Xuhxb3VNV3pAQvqjSkTVseuuzPNriQyVUu/JcbELz2VUJ+JRvTycHKb3FCmGo1Y/xI2nRyWmb1p/JH0LJUnesL/AhXHM8rmp8Fdf31w7At7g/uAyX2yIKASCUdhP5COGalFw0Aq0eaZsFrz4BtJ063JzcRUFtFQZ9g0DM3xVmRCGn5yaW6IRex82yjFSx43IHfAYYHOf0eOtdGCZibK5J9Lwo0nn0NK4TtofKZbWlqFBMdWNNzhriK3i1elXju7RNW4M1uJ7dp17sKfWxImxCxxYeGRcFBPFFuqqG9BKNCqKoS5OgyjAyp0daRgbq/ZNbM9ijfnl3XN11Ameq7LWVf+1mXK+Njoaot3JKhW/mwlGy8ld9pOehhVaO5YHKmycopqmZF7BI9lq1wLy5Mi/Ybf3T7mCjx9ieRO1Su8MsLov6OCW4A2uIhS6zO7XwHQ+MN1TqciRVbD085G+E4smnhJh4p48EFHP4aBTAC5q50Ax0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(136003)(366004)(39860400002)(376002)(54906003)(38100700002)(8676002)(86362001)(2906002)(316002)(16576012)(6486002)(5660300002)(478600001)(2616005)(83380400001)(36756003)(16526019)(31686004)(66476007)(66556008)(6916009)(66946007)(8936002)(31696002)(4326008)(53546011)(4744005)(26005)(186003)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHcrekkzekNHVXlDeUd6a0s4SlhjRkQ2VVN0ZXIxMDBqS2JGc29vRHA0MHRH?=
 =?utf-8?B?QjZRT3paYlE5ZUg4KzVmaVNQMlhBamkrVkNIV01PRmNSbHRkalpEYTExYUVL?=
 =?utf-8?B?RGlkbGxubkVWOE1RU0sya0tMb0FoWFJsQWZuZ0xpK3FpTTlNWHRROFQ3N0x3?=
 =?utf-8?B?SjVhWVhFWW5PUHVLYVFEKzRWeVBnVDVsRjZvTVQzMzg2ZmdvaU1VYWlVT2Np?=
 =?utf-8?B?REtXY2tqWlV0Q0lNdjJld3hTTTJDUVk2amtLRi9XWVEzTnFGMldvWTdhNXVm?=
 =?utf-8?B?eDMxLzVWU0FjMEoyM1FiMmxJYU93dWNyL1k2U2RrR2gvdVI1MGs0Y00reU9I?=
 =?utf-8?B?N083YWdaK1dnTnZjbDhVSWp6eEUxTnNqQys0NTJLMEVHc1JoSEhTZlZUWjht?=
 =?utf-8?B?SGtDQWJqMUhJVTB0eFJNUFVKZ01vREJVOTMzTURGMnlDT3drWmNoSXpNK0Iy?=
 =?utf-8?B?RDRSV1Zob3dXTm1CSzNrRzBQbmdyRm8reHBTeTFGTnE5bHVubS90dkJQbEpp?=
 =?utf-8?B?WXhveXFYRExvdnZZTlJQOFhjQ2ZTRnRnNGltOFIrQ1hCQklWZ1lRaHc2TFY0?=
 =?utf-8?B?ZldkQzhPSUxabTlBeWlFdHVzVFZXdi9NSWRmMCs0TitjSVZMTVJzaS9aUU5x?=
 =?utf-8?B?c2UzVXI3b2s1eFFlLzVwWVdhbUh1WHZrbEZZNzBsWE9pRCtnenJYYnJ4ZG43?=
 =?utf-8?B?SFlVU3RjemlEN3krSzAzdmdMMy9RdEhFSm5NUXdYL2E0czNxQkFGNlByb3M5?=
 =?utf-8?B?Nmw5cjF2emd1enozTGljeVhOd3ExNGg4UTY1ZlZCWks3Q0x1a1JweGgzTWs3?=
 =?utf-8?B?S1pMUllJSUFsQ0I5NVFmb2tsMDJqK2cyZGQ5L3JDaDFwcDY2cnVpTmRnUURz?=
 =?utf-8?B?Ync0T01hNU53cmdSa3RGN2FJRnlHNVZ5L3RabVJDTXdONSt4dEdoYkpoc01O?=
 =?utf-8?B?Rk84eW5NS0xxcnd4WWxJNHNLVFhOcmFCcERjK2dXanJRVXpTMzRWUVVSbExK?=
 =?utf-8?B?UVFLbzlVRHNkeXZNa0F0Q0FVb0Rsc1pISkRFRTM1RThjRTh2d3AzZkF1bmpz?=
 =?utf-8?B?QXI0OE5ObkhYaGMvUUZmaEQ0bElOeFBNV0ttWVQvTk02cVl3by9CaWNBVFZh?=
 =?utf-8?B?SElKTVlHR3NDRFlMTjV0WW9zajBXMUoyVnppTEVCWjNWNVZBS0FHTVFyOUgw?=
 =?utf-8?B?M1g1NUtlclpiSFZvdFJsQ1B6ZVNpeHpwSjd3WXRZeUtIN3Jodkloa2NleUxx?=
 =?utf-8?B?LzVIYkFXTWorV2d6TlhoN3lKZkM1RHcvTyttVXZTWGcyTHFaWjZkd3oxeWJ0?=
 =?utf-8?B?MVltcmNZbGdXem1ORU5iMlQxQjhtWGlQVHQvZVJJNFZrQkZsdWthWk9QVWw3?=
 =?utf-8?B?cUZCUUd6Uk1WdnVaUFY3aUtiRCt5WHlJd29RdWZFenJFOWdsV3QwTEw3L0Zl?=
 =?utf-8?B?aW9SSVI4ZG9WZENEZ09EajU4andYTjEzQkdGYktDSWo2TUtMcW9EWEVKZmNX?=
 =?utf-8?B?NDhQVUFNTGFvbnlzcTBQTXl1Y0dsZU8zOUpOb2Q2WWpicGpMN1UzY0pKcC9P?=
 =?utf-8?B?RWszaDhJM1RUK0IrNWNPanRXVTNwYW1yOXlBc3FaUUkwZ013ZDhoUDZSeThZ?=
 =?utf-8?B?RTk2K0hYK2o4dXA5MGFIWlVPRTRVMjVyWkhFUXV6ZHZqZnVpOEdmcjhXSlRS?=
 =?utf-8?B?L3NXRHRMT2dRbERubzdiWkJpVmdkWE9VRlF5cVMzUEVsQ3VvSW5rSFMydzFO?=
 =?utf-8?Q?hGSqqlBTwIUmNcs1Bsux0xWZFxBJxdYCrS7Dcs6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 090d2fb0-0de5-4eca-5491-08d92f3251b0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 12:45:41.5885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZbkNE/UrXlVZzRn2MAvkFxK7w+6hM8KcyrDnXhqQ6X6Bixg7/Y03Y2eF0C6RQy8k7OxJcHyTE4D0vZpSqBWJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3390

On 11.06.2021 18:36, Andrew Cooper wrote:
> The logic to disallow writes to the TSC is out-of-place, and should be in
> check_resource_access() rather than in resource_access().
> 
> Split the existing allow_access_msr() into two - msr_{read,write}_allowed() -
> and move all permissions checks here.
> 
> Furthermore, guard access to MSR_IA32_CMT_{EVTSEL,CTR} to prohibit their use
> on hardware which is lacking the QoS Monitoring feature.  Introduce
> cpu_has_pqe to help with the logic.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


