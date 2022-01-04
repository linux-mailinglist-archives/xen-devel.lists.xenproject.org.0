Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E23B483F44
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 10:39:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253091.434112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4gI0-00009z-Oy; Tue, 04 Jan 2022 09:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253091.434112; Tue, 04 Jan 2022 09:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4gI0-000083-Li; Tue, 04 Jan 2022 09:39:32 +0000
Received: by outflank-mailman (input) for mailman id 253091;
 Tue, 04 Jan 2022 09:39:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+k5u=RU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n4gHz-00007x-8u
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 09:39:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36f813f7-6d42-11ec-9ce5-af14b9085ebd;
 Tue, 04 Jan 2022 10:39:30 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2059.outbound.protection.outlook.com [104.47.6.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-bUchcg2_M42YC5go7lVvTQ-1; Tue, 04 Jan 2022 10:39:29 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3390.eurprd04.prod.outlook.com (2603:10a6:803:9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.16; Tue, 4 Jan
 2022 09:39:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 09:39:26 +0000
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
X-Inumbo-ID: 36f813f7-6d42-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641289169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=35n8/KGZRboqH0+ctDvw2AuDGPL5TMNpoJaEjhXc4dc=;
	b=i/GtBIUXH4orlZlFjDn1eUv3mgm9b7eEX4Pm46g2Ohue8nZrIUvwwobDz5NDoGvTA90etj
	5QHQcY86WwZxd4Hnz4DYsA0ym6iSkEA0JH8I84mJ9O2Sxns8XQdzXROJQwpt2i9ArBkzz/
	aTTta01Put1f4KRMU26geSOYxBXTbN0=
X-MC-Unique: bUchcg2_M42YC5go7lVvTQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=be9I7tqXgjxhTe9Xx6kl1tKMsIrRZUg0wc41OckKt7MuXrtYBV9cYOCeHwFz+GQ3QyTZXiIitpOHK6gl59A4hqIUUN8ifJjYPHA7npHHuqS0kleJeNf7COfxD/5UiT5O+70gTUBakV6uAoOzTkb44pBBTDEZVcFP/0jV0ooaSr8032Lhnk8jE3s0GUq8bKyvVnvvu/weZxColOPw7Xx5FFPI8MVl68mICWJgNDDVWq7YCkrSHVE4/3ajzciJnS0ocrDM95FvBp6SZPMdLcrzy75hHNZHZkBiLfstRkUAPpeaErAFG0mQsohtR1TLOrrgJYZ5WvroX5PymDlpZPS4kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35n8/KGZRboqH0+ctDvw2AuDGPL5TMNpoJaEjhXc4dc=;
 b=OMDUGxMWgKNaHMRNnyN7PrLmWzs6Y6BG2UVvRgSF7ftcWnol9c668hobcAjKKhFGcNwJqt67jhRu2RsQV4W4CNx7Q1ax6i+kpJGbbcIEKOvBJmlKinZeeVIcrXBe/n0WoOtMQ/Suw6JjOFOadVtThBq+XgqUPtnaYJucc0DhNVZz4TM3RO5aYw1A9Lsdfe15c7hXRCpqAOC2faoWHOTyQTLnfkrhXLCeevCO3n3pqqworM86s5kCC4P3kdEpTDdy6MpdWGMjx70GcVH0ZKgvr1a7vZu89cQNYuAlx9bhGfuSE7T6oIfI3wByDYFDoTbypa4I+vnOfsBzZaNuqN62kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6fe7b036-2bdb-b391-4e6c-1b5d7e05a119@suse.com>
Date: Tue, 4 Jan 2022 10:39:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/2] x86/mm: get/set PoD target related adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd891243-6b02-4815-8e8b-08d9cf661938
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3390:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB339027D45860D7FAF3475538B34A9@VI1PR0402MB3390.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j4F4smhNLmRDC1xM1YB5Tkut189lW9qR/JIYd7mTLrtpMNOq+hysiFNp9RTVttPLY+fFM/XT1jiCgeWdCAOko5MlNT/5z0zaUyORoy9DMX/5g4BZGwh/NxWy6zNhe6W2a8IXDbvfopiicwgeyrT6kHh+00Dha0dRL0QCyVDf3j8uui/q+c6CtlgVtQz6UOu+lF2IM6jJBvluDEZdwiU5WwxFLzhjO6+VSAs8ME/MRXdMyPe4EvvgppvPHEe5Sr/IvDh83hkX9t+wi+NUmur0PeQR0SEuUcvyzjrmYaR9jBG4xuorOz1bowQjyHvS6mUtQn9s6NIOy4mFWY2bVyJb7PY3Ghqs89PoTuYtRD9HVgz0IUB7bNUHoFQHxNmfcjIw1zyV7zpk/Rzr36x1CZCC6wCR0EckenMZveIU0kalO66WJr96ENdSbtkUEV2a8khhL3NMbTuD9BqCGleQA2rgSfYfsKWOoR3QKjmrgFoIX2M8OWosNzExHg1lYBYLvlqvifldaLWFqxRwQbJkzQGEuZ3tVl4oSDE53dhJTq3chlMk2X0oQuMR1h6/DcMOSoo+d0ZKE00iIqVvhHs02IfeZuFFHQPEbsdGQTHtfkskhpLFmkIQMqCXejinAnA4YnYtcSwFdMyzMZcWFER772XgUhxH+/b6zPvwyOjLPeGQTc1Hc6bdD3FHXLFVOqy+lHCutb3YuLOvHi8Kg0uZy3XF9tz/a2f6q+A6t3oBoLGeq3s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(36756003)(6666004)(31696002)(86362001)(66556008)(54906003)(38100700002)(8676002)(31686004)(26005)(6486002)(6916009)(66946007)(6512007)(4326008)(2906002)(316002)(508600001)(66476007)(6506007)(5660300002)(8936002)(558084003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M29JUTBpWmdMRjQ5Zi9ObHV3NE85YlhCSFVuQyszUSt1WFZMcmJYbXpuTEhE?=
 =?utf-8?B?RHBDSFp3bEpBY0pORzByK3UxdnU4d1VaYWg4SnhVeE1XNnlKekNxSnVzVVVx?=
 =?utf-8?B?S3hRR0Q2VkFzUVlIWWoxUlhRY2h4bTh0S0YwWENEbUk0VGduUFR0amhxT0l4?=
 =?utf-8?B?YUZCeWdjZFdPWXIrQmNZWXFWRW1EcUZpOFlFNkJRbVJYcGwycnlweWVOZVVs?=
 =?utf-8?B?eGRYWmRHYnJLR1d3UlhBTmlUOUVVS08wZ205R05zMldoME5pUE5oVmp6WXRF?=
 =?utf-8?B?TTJxMTAxc2U4UlU2ZDNXSDBibksvak5PdVZjZVBtcmhucytDKzVQbmRJTFVO?=
 =?utf-8?B?NGFPak14RS95b0ovNmxvRVdFRWFrRVppZTRuRzVseVNKWWtWM2JpVkVINmdL?=
 =?utf-8?B?b1VJdGlVZWhYajF6K2RsUnVSM0NDT082WFFWRnB2T1NKTDBodmNKTUdnNUlr?=
 =?utf-8?B?SkRsa012VUViWjFiL3VMZnlrUG8yb2VuUCtSRGVIQmdzNmdxWTBOL3hnamlH?=
 =?utf-8?B?Lys2TmRPTFk1U1lXSXYyWDg2ZE8rVjBYZzljb1JyV3VhL2FTdWQwWnY1clVP?=
 =?utf-8?B?cVlxc1lORG84YmpQTmhocm5iT3lVbm5tS0UzRVBVT3gyOFhlVW9kdm0xNnJy?=
 =?utf-8?B?ZEthUmcvLzU1RDBDQm4xSGx1cE1ra0psa2FVTVdoODNMcWdLM2FDSjl1SXdh?=
 =?utf-8?B?YXRBYjEvMG1lKzQxRUtkN2V5eTB0NmEzbVd0aXhTRFBzUXdISEhjeWRsVTJX?=
 =?utf-8?B?YWdFV3dhVnNNc09aOXJkNm9kbWNpNFBqVW5WRFZuSkgvOXRZalV0NHlESVFR?=
 =?utf-8?B?V0kyRGdtK3J2azQ5azNtNkpLQjJYOUpUZEMveVNPU3hQMHQ1bGRNVkNtTmJX?=
 =?utf-8?B?RDluMm1XbHJPZ3NEN3lhTGZIb3ZwTmtZZllKQVpyZ1JNaHZiTU1YaVdxWXhF?=
 =?utf-8?B?bG84aUlLclVTVUhCb2s2ZjduN3VvTjgzNTJjS2Zad1k0clRmTEh1aXg4K1lo?=
 =?utf-8?B?UU1vSklobVVkL2paSHdGZTZ3elNSaUptZVhTNVphc1V3WkFxUSt3NUpldEJX?=
 =?utf-8?B?Y1htc1A0MkNIMFBBZ2pzRVFLaEg5aXE3YWJ1Zm1UQnZvaVhoK1NpMlFQMnRn?=
 =?utf-8?B?WDZZdG5uU3Qrbm1CUnY0bGlOdHJOc25LZld6SFM3b3hOVzZXbEJxV1ZDdUNm?=
 =?utf-8?B?QW5aaWppK3lpUWtzaC9tYldYWFFBQ2VkZGs5VDhSQjdXaHVNSW9hak9zWjZo?=
 =?utf-8?B?WTVNY3pVTy8zYjZtVDUyMFZOUUQ0TjJIQkN3VTViN2dFRFVHRFlRUVNHcVhF?=
 =?utf-8?B?YmxreE1oeDB1Zlk0ZUd2Y0JSZFpJZy9UakpUQlhDNklVeXF6L3RvcEZ0WnRo?=
 =?utf-8?B?a0hJbHBQam9YTkEzY1ZRR3ZoSlVnWUxPM0tlMFU1QVI1MXJLdUFXNTdXMzk4?=
 =?utf-8?B?cENXWU9ERFJMbnZjKzNBWmx2ditBRVpjNy9SeWlZUmo5Yyt0SGpBYS9pdnQr?=
 =?utf-8?B?a1RZdmJkL0hrbFkvcUp1djJINXdEVHhsczYzNytJSEJjUWpNYllMVlRxQVd6?=
 =?utf-8?B?a1VLVjB1VGJGWlZUN2VxNjdXejJmUlpyUzlmajkwNGl3Sm1YUzg3UU1TUnpW?=
 =?utf-8?B?MDJEU3dmMzg5UVBJbDltL3RLQkZpZWNLZ2hnY3ByMGc0RTdlQmkvNzUvaVpF?=
 =?utf-8?B?aHVVcGxsQlJxbWg4QzRHSkZncFZLTzliOVNwUzdWRGwyL2lscUJHcUkvb0VL?=
 =?utf-8?B?UEcxbGxuSlY1dGFCeFEwT2JKUkxkOVUyamlIUXVZRmdWVGxrTXR3cVk4MGh3?=
 =?utf-8?B?WlhGNzNlRDJQcUlNb3o1RjRWV3ZnR094eTk3U1BiZUF2LzZZSURkd3Y1R3VV?=
 =?utf-8?B?blN5WC81OUt3Um5aQ0VCZXIyMkRsZlp4VmRmMUV2SmZOU3NoOEFCVmQ2N0da?=
 =?utf-8?B?a0pBc3VPcEllVHJ1WFNWL1VQcXRmeVNvdGVGQlpHUU00SUZwQlN6czVoZVRy?=
 =?utf-8?B?Tk1FaElEeGorc1JqVjF4dkJGWmJDcHYrSkV3dGwxVW9yTWp0bnI4b2wyRnlo?=
 =?utf-8?B?TFZJd2VSMUdxcnV1L1ZNZ0l5VXlSeEZQZ3Z1Q2xCNFNTNFR0c1c3bmJ3bjF6?=
 =?utf-8?B?MlF5OHBBc0xWeVRCYVNtU29YbEszalRYNFh4OW5ybDkwUkRNdExOZDJSWEFY?=
 =?utf-8?Q?5iwz73BL+ku3BnN5oARbPts=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd891243-6b02-4815-8e8b-08d9cf661938
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 09:39:26.7695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lksuDgDvhJbIcnTnCXqTIqbpZCnkOZhDTTLdwbTUuK8fTKXuaBD6x97m5dAc28YYPUt+mBZ1tipUUCH+ZU0Q5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3390

1: IOMMU/x86: disallow device assignment to PoD guests
2: x86/mm: tidy XENMEM_{get,set}_pod_target handling

Jan


