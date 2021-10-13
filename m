Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C42C642C52D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 17:49:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208691.364918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1magUX-0000Jb-WA; Wed, 13 Oct 2021 15:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208691.364918; Wed, 13 Oct 2021 15:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1magUX-0000GB-Rs; Wed, 13 Oct 2021 15:48:29 +0000
Received: by outflank-mailman (input) for mailman id 208691;
 Wed, 13 Oct 2021 15:48:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1magUW-0000G5-IK
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 15:48:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0116058d-2c3d-11ec-8183-12813bfff9fa;
 Wed, 13 Oct 2021 15:48:27 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2052.outbound.protection.outlook.com [104.47.9.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-cXRigUsKOTuE2UQm4gsH6Q-1; Wed, 13 Oct 2021 17:48:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5327.eurprd04.prod.outlook.com (2603:10a6:803:5c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Wed, 13 Oct
 2021 15:48:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Wed, 13 Oct 2021
 15:48:24 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0099.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.14 via Frontend Transport; Wed, 13 Oct 2021 15:48:23 +0000
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
X-Inumbo-ID: 0116058d-2c3d-11ec-8183-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634140106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tDu+Xsy6PHEycPNm1o5bLYDgOz/PTFwtVGm4wTu1riY=;
	b=bszy191jY/bU+qjtdGIo4Yax1aU31aEtN6uS7cdXVQoVzhWhxeUcE9Vm/qhAohjFgn5Apc
	QJt4dm39JTWVr6H5tyPvBnc3nCQoJ8jCLfzwQ+zKai+iLvR/4w0D+tdeQe2morAXHRM3pM
	IBdag7BpbucxZX5O++96OIeu7k8I9AQ=
X-MC-Unique: cXRigUsKOTuE2UQm4gsH6Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxOlNCnDISd0g1n4N6nMvESiHdceBMvBRM9F5TP5cOa9l8dMbJKxdo63TY9tve9iTVhIWCGjImYcZU9ZcakwraWIA3RCAz3DXBTjj2LFJ61trOQfAi+05C6uvzHQOcR3AsT8xvmaaRVEqzRA2SNxhqqCMkdBq7l49TH6F2RPxreaZU6eI8hJ+YRp41u42JJyWBhmjzc9KtrytnqT7BxiE9GsB/1XTDFRGkJ0TVOIp++MA7/bYJpbeU5aw4suhNaD1gIEvurUH5hAlVuPCfCEF5tCZbt3MJNXgWtT3n12KqTqmbzSiDWksppgRJ83ZMXvkApNafhuOsxkAYzSJE+Njw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDu+Xsy6PHEycPNm1o5bLYDgOz/PTFwtVGm4wTu1riY=;
 b=grjuJ5r83ITNGrSZHqJV0dAUhtTrLs9WVXUpoPcyZYcregl3Z9j94+XInQ6s/iJxF7hdTore5IHHaQu1jbHdOj6ePSjJb9eSEK2FACHkpmircf/n8rzLHnyFZ7y/ZVsVO5cPbaVJHO8ULdL/jmlzp4n2HXzkfUnatAKYAT7lYxlOJnevS2urqXD6a3Hr/HnU05uKSazM9l9spWpTJRmGZ6PmcwOTRjWhtZAXcESP+ngrnwlW/szbwN3jReVR+BUUIBYb6qTuXpdB2Nvupy+h0wrVdlJztby74mjLcW2nuANb4J6wwNMHGEX0IaRO4vvlTdgkNVEXNcquuis7lGCCGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 51/51] build: add %.E targets
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-52-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <377d9a27-e09e-38f2-9009-64c0b9e6ace2@suse.com>
Date: Wed, 13 Oct 2021 17:48:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-52-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0099.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::40) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ae0c7fa-ccbe-4dbb-3974-08d98e60e3d7
X-MS-TrafficTypeDiagnostic: VI1PR04MB5327:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB53276F0C159CC3018A4934FAB3B79@VI1PR04MB5327.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:416;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sK42hc69Z1nk6NdIzIVb51g9M3zjDoH56t+mJn+4oUpx9tVyIT5oB3yDsUPKYpj3Lc2LtRrN3+ti5juolqjhhKyHBzWsy7lpX1D2p3HSXU+Xf0IW8f7F5xw74nHSctyDuzQvbO+qSOTXeb7CljzIiaoW22wrZRZc1lOauYlDdASwzpHbjsAWgw/kjPJRPp18Bvr17fTkPbwJO4K7F7wrFcxh/4zsQGbQ1oY3ccNo0qAHum7Groc4K5Vci6cztc2jO/h7pwssXxcHFeoCPj3T5uMuav5eNItqmCm1Gb7uDwcQqmXG3KeByUc7eAoH2eGV/1XSeEE9AzJzp2w6dY01Xekj6fZYYumt/vZGHXz8il26BMl+UqqYTwu6rN65U5ixwMKkNtAJomB5grEGpPlSBRZlT/VEpsE6YpsOE5mj+Wi3wWm3i0dnVnbdRioNEgeTYTy2lKbi6LP2QlNWaGdWlVs1igbIOl2iYW8JnECzJqxFxJSXoZDW8hpPBioZJ/QnmKAfpXjIQSN+e5/0BbNsyQuLUmTri1FVVvi2ef71kmyFCFbckjiM+nLUe7jiYQwLeoLWq7Zf4+AUR0PHvfmJYnJ2peskoODUwPQ4P/F+tb0M4PtBvzeit2AcP9XfifYIWWsY8UUb2DAUq1MveQKADup783RyyuG26+/4NTBPtMXbJbgkxUGk2OgZktMpVceHh+Z7967cShRtKRVP6BH5toKnTEw8HCqUMZnBXK/eKlOCm27JQUPaFczZ6bSdsuGz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4744005)(4326008)(186003)(38100700002)(26005)(31686004)(956004)(8936002)(316002)(6916009)(2616005)(16576012)(53546011)(36756003)(31696002)(6486002)(86362001)(8676002)(54906003)(66946007)(5660300002)(66476007)(66556008)(508600001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWJtRVRtUlRkVHB6WlNmcVovUUZ5YU9CL1JYcUJNZXI1dkdObXFVK0VRNGxZ?=
 =?utf-8?B?LzNyOFBoY0tiUnlMQTNaalI5THlMWG1xVzloYXNCSFBuZjZJSXJJRkJKc3dE?=
 =?utf-8?B?TlVwanZuc0dvRHgvSlpPcDh2TStqb0JEVjFwMUhjMFFRc3VuMWtPSXlOSU9r?=
 =?utf-8?B?ZFhNaENQSDE4M3NycHdZbUZTZXZUTmF0TmtWbVdWdHdtaENIOU1qNHZhcVFN?=
 =?utf-8?B?V3h4bWNRZkRLNjc3M0lNQTRVaGxVcmlUc2NNVHJjUHNFWHZrR2l4cE5CcDhJ?=
 =?utf-8?B?dURwYWVPeEVCSUZCWWZycS8rRG05SEZBRktEUFRCYytpL0l1dlB5VTMyc25D?=
 =?utf-8?B?RmV4UGN0SXZwRW9sbXJvMyszQitIY01LeCtTcy9jcWtPWXZPaVo5Q0gvQ2tS?=
 =?utf-8?B?UEw4M3lEMnliaWRocXhtVkNVcmxMRkhXcU1iNCtIT21FQ1BrZ1ZxbWlMbW5S?=
 =?utf-8?B?S2cxZFFrWk5tQVpvYlp1cHJZc0ZtUGhGaVk1VGRrRmh2d24rNjBzSFpkVk96?=
 =?utf-8?B?L2srTzRqSDFzVnEvQmV5UXlIN1RBemNKZzJic2lnSW5KdDJ3blB3WHMrUXdD?=
 =?utf-8?B?U2JQSS9IcVM5UkdTL21nL3JoV0ZVOC9OZmJCelRYVFk0T0Mva2N4UjZFWkJy?=
 =?utf-8?B?eElLWCtGYk5QS1JESjMreXlqUTdrZ3ZaNUhoZEpndytMRFVjYXFPcW1oNDZ2?=
 =?utf-8?B?U0xDTXgySnVUNWx1L1B6YTJTNm00QmhqeDlnbDJxdC9uZHN6dnJCUTlWZmty?=
 =?utf-8?B?bGtqUDI4UmhaV1ZXVm44VE1DWWVuNFBHazlvMFlQYUtJMEdpV3VlQklCc1pL?=
 =?utf-8?B?YXQ4dk14VkJrckVGL0NkUHAyRExudjdvVC8wV1oydFd3dWxBOVkwY2dncjAv?=
 =?utf-8?B?MThLTS9WTk1NOWxnNWtRdFF6L2RmVUpyaXhaWWxxbVRqclZCV0szWm84MlZZ?=
 =?utf-8?B?RjMrcVk5MDFDVHB5aWt3TGRlOHJSTlo5T2p5ZzY0dkxUeTU5NUZqRmh3c0tG?=
 =?utf-8?B?cWp2Yk9tWU41SWhHbGlLYUZCNDVmYzZ0WjMvdFBTNTg2dTA2SDFjcWlCbTBB?=
 =?utf-8?B?WDJ3ZFV3b09HQTl2VVlDUVFnSFA2NmdsTE1PM21HdkRGd0JzeWV2WThkdW0z?=
 =?utf-8?B?ZS8yTU5MeDhUalNhd1VueE1UcDlEaE5pQ0hSWWNBRUxEM1o2d2ZtK3AzaXlr?=
 =?utf-8?B?TldLMTFBaVNvMTFUMktRdGc2UER1Qm9KZlV1a1dxTkxWUkpDTWxvMHcybXY3?=
 =?utf-8?B?akJGbjFhb3dQZGM3Z2MxcjhtNms4a3VVV1lNYTlJYlcwS2h4Q0xoMTlCTUNP?=
 =?utf-8?B?RlkzMWhheFVQeGV3dllrdUtQZHdVZjZzYk40UjNOK1JIZHV2Wk5hWC9kZnZN?=
 =?utf-8?B?bXMwMk1yWitRblAyb2JieEZ6ckNyWHpqRmlNaVo2TnNqaCs5WWRralE3eTdQ?=
 =?utf-8?B?dnI2WWhmelVvVmdvcjRxVG5Hdm8veHZGb0tTTGtFMEtTcC9xTnBKNk8rOGZr?=
 =?utf-8?B?bkRxVUtOV0F5cVVjT2hrR2QrMnNHbVVSSEpaTVE0aWpkVjBvYUdQaUtxYVVN?=
 =?utf-8?B?TmNDZC9KUERzeVpsUlVRZnh4cTZ3T1RDK1NJcUdaQVNGck9FTkpFaWFoYy9K?=
 =?utf-8?B?b0h3L3M1MEVpUzBmQzlLWHY5UldvS3FOWkF3dE4zSEN0bFR2NmVKc2ZVdnE5?=
 =?utf-8?B?K1dGSE5XMWhmQU1kZVhWWVNvVTZnU0RwV2FYWkdLazhOenJVMTc5SG5ZNnJR?=
 =?utf-8?Q?+vVNV4351WUUFp9sfmTjLE9X8WtkC7aBy/c8UAd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae0c7fa-ccbe-4dbb-3974-08d98e60e3d7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 15:48:24.1002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQhhL388Jcvn00bWbx1eH8lEkVbfXcHsc0Tnj8L2sw+bXHl6PBtb1bqPhw8hVxpjLQ9hRSHq1XsmQ4+rgSiCsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5327

On 24.08.2021 12:50, Anthony PERARD wrote:
> I guess it's easier to remember that %.E does "$(CC) -E" or "$(CPP)".

I've never seen any *.E. I'm puzzled (and hence have reservations, but
then again don't care enough to object).

> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -289,6 +289,11 @@ $(obj)/%.s: $(src)/%.c FORCE
>  $(obj)/%.s: $(src)/%.S FORCE
>  	$(call if_changed_dep,cpp_s_S)
>  
> +$(obj)/%.E: $(src)/%.c FORCE
> +	$(call if_changed_dep,cpp_i_c)
> +$(obj)/%.E: $(src)/%.S FORCE
> +	$(call if_changed_dep,cpp_s_S)

It's kind of sad in this case that you can't fold these with the %.i
rules.

Besides the changes you make, don't you also need to adjust some
"clean" rule?

Jan


