Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFDA4C2CBB
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 14:11:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278251.475428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNDtM-00040v-SP; Thu, 24 Feb 2022 13:10:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278251.475428; Thu, 24 Feb 2022 13:10:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNDtM-0003yP-P6; Thu, 24 Feb 2022 13:10:44 +0000
Received: by outflank-mailman (input) for mailman id 278251;
 Thu, 24 Feb 2022 13:10:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNDtK-0003yH-M2
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 13:10:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2abafd45-9573-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 14:10:41 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-ARcgID_DMXiUqg0GfxOb1w-1; Thu, 24 Feb 2022 14:10:40 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DU2PR04MB8855.eurprd04.prod.outlook.com (2603:10a6:10:2e2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 24 Feb
 2022 13:10:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 13:10:37 +0000
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
X-Inumbo-ID: 2abafd45-9573-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645708241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=65Jw6tko6YOMlN6w48nY0CrnwYys20i28VYVtCOCsxM=;
	b=VbjO24jvqiNJKYKviG8xxAf5XD6CCH8+nGnn6tDFRpbHgEhAREu7N3EdJeSGFsZJfIKo3h
	Wv2wNuF0H3HVBhPDfL0ki4QAGJkb/51HMWWTSxJZ7eRFwgfJNIZBO/Hoa3VzqSVFfU3iwp
	wSMteHVSop1jADa1EjKPsY87aTqDPxk=
X-MC-Unique: ARcgID_DMXiUqg0GfxOb1w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUG7PJGfEhmxMzJtcye30Vr6sreVoWvKI7TezXZcow4HVj5xvgCluywbfzWwIqJWwoOi5Qa/o8lM4nglKLf+eeNG2E1CfktJv/yiEhP56a73Rneu/jIWlsxs3vJK3Evqg9WCMfZaMblB+umSOsoHyVSxt+jgzcR5Y74X4mennZd0pgrym6Ufw5a1yEvNk178kgTeE4CMTJXk6RNnPlPPV/sY90QRsCRRTB3N+GEYknmVJEGM4lMGkOwyLz/4t0no8HWsEAhJCmzL1u54Kn0pWbH0TtgX5GgieG3bzKWepZBvXeQkgOmvnp/w2w4IyaUws8V6901MLXEOI+x6wcwVZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65Jw6tko6YOMlN6w48nY0CrnwYys20i28VYVtCOCsxM=;
 b=W7eVeoNK/sG7yZdNvHaj/L2i0U5m8llOHcL4Cy+mmKTS3dtEMFdCBpvOpL+NrRqem7KATqLESSjPLnZa0HX3W4ifmcrvZKYX3gYAB2NMMjhCkWEc7vCqw5FqttnqIYJOpb9lfE+vDmFqIZFl8epLZB4WZLq+Esbw6pSLVhDbd7P4ACuvC4CAatXIAVcUhfO/o9DjjvIjIC4ACT74WLV5Ag0VWmW6Mx90ERc5EuqI0+Kc9FZoo/uF2Xxjpshle5N89GPrdpLOLPHnZ5hJTRxoqF5gFvRcpV9hGy7Mf5TXq+/c1Vu3/U/ptjkF+pHgJJxK9nY2FPYEKMbzT4cXEO6q5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <30592690-ee08-1886-b6ba-b3309659d29c@suse.com>
Date: Thu, 24 Feb 2022 14:10:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Ping: [PATCH v4] x86/altp2m: p2m_altp2m_propagate_change() should
 honor present page order
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b3564fe0-e375-b386-df0d-a5c2b54d1299@suse.com>
In-Reply-To: <b3564fe0-e375-b386-df0d-a5c2b54d1299@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0057.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec01ebe8-78a5-46ca-299c-08d9f7970c88
X-MS-TrafficTypeDiagnostic: DU2PR04MB8855:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB8855C759621F4AA77C91B760B33D9@DU2PR04MB8855.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2MOVFNq9ao/1/JFBybJ/PrJ93ioz6H/jK7K2zijsok1zI1ZPZ/6G2octs/uIel6gv+k4DbozPKmSPExiNppS1zy5VD471pQkQvpspPOS+P/Y/c71/qvtYeqFYIcRPpz1BBApC9wwaL2SPhyeHyMplwnz1VlRyO52CP7ngVzbC/1XW31DWPtz1gQVY537VIvfpn3XSOVXCq3eStaesFiyFi5i9sufB3r4XZZk5FZNd2KBVRsx6JH+Dd/maab2qvLqp0R7Ex0Ok3pTTfA7awosCSD8mku9Hc7My+qMDMoPjEOY89TUehKdlUhoXfjF7I2GHtPcf5YsC4KKalhX6Oo1S1X1cwIt1lw3qIaDzuaEMVoIDC0YoGvXfCLzBraQUR8juC3aWH2ds3ozI12+Wv3NrQX/amA2hGKEojTficmEOG4M95lbLYr79UjmGP0kSFYXSBOLfuTbNCwYe3Gn4b9QxnpZzo4aNGNsGUaNdFpLeJJcdCGJtATpjV8v6RcbKRYIYNp8wkt5q5DgsP7052sKOYSAykjs9KOoracqOEcZKVbQoqC2zgMf5MORycakax2DlSC4zRWKcpLZInMafc1ubIa8bmF6OUq73/dAR2VNFY1x2GiO0wk8VXlSWnZHjRz3VoF7zXrqcEyIFPwzpXrzezRujOeq7Evp8IaoBVW32+SZaX89TAe36/UT06mwAec9iWtO4mK8x0vn0VL4OWv2olIq//qr82FirRghqTFWtGBfsxuXjgO+NeDt/8/qjHni
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(66946007)(66476007)(316002)(6486002)(36756003)(4326008)(8676002)(110136005)(53546011)(31686004)(83380400001)(54906003)(186003)(508600001)(38100700002)(8936002)(5660300002)(26005)(2616005)(31696002)(2906002)(6506007)(6512007)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVJZcnhKM0t3U1pNZDJzYWcwNHN2WGRlVG5pRUU4ZmwxOXZMcXp3OEZzZ0U0?=
 =?utf-8?B?RnBkQlYyczlvb3JqbmdBc2pMdHpyeGRpTE9ocEtyMFNCQVBkNysvTzMwK2lQ?=
 =?utf-8?B?MjhkM3hKR3h0WlRVck0wc0NWa3N1YVhOSDYwd09GdVUweHFZMnJ0dmlnbnB5?=
 =?utf-8?B?UHU2Qmc5QXpNemdhc0VjUnVjQlU4TDkzSkpjaDhuRVRtUXYrZHNRejkyUENJ?=
 =?utf-8?B?M2VXMkR4MVQvYVpsN3VRWVMwdnRsT2lzSDIxZ3dMcHh5WnY0blJKT2JxclNM?=
 =?utf-8?B?RzU1d3h3YmZBVHhvZEVQVzBpU2JnZUkwWnBSWTM1ajlONVppTWlrMzZDZ0J3?=
 =?utf-8?B?OWZwQU5tQWNDOEk4cnpaYzF4YWVhbU9FWmd3V3NwY3IyVldZcmNBMVdCa1pi?=
 =?utf-8?B?SnZSbnNXUC9PYmJJbkl6RU5iL0tUUDhqYXE5S05RQ21KSzZ4Y2ZqUEJNWWZu?=
 =?utf-8?B?SlBFeEU5d09wR0FFN3JyU1ZQUE1TalBEL2hsdGpUQXl1OFJkWnpZTWJSRkc0?=
 =?utf-8?B?d0l0Sy9BclVhSVJrMWhxSWdMY1EwcElyOXNORnA5ei9mcE9YcDF0SjJNUDVr?=
 =?utf-8?B?ZHNNMmNEUVhGejYzMzdBd0hXM0pGakVncGlZQjVLMXdkR0UwMkd4bmxnQ0hn?=
 =?utf-8?B?SFlaQXhVTmppb3pIL1VRSS9zVHJtRytURTBaak03L2pjbFhaejdTWlZIbUdT?=
 =?utf-8?B?TVkzblJrRUVZSWZ2NVZrVG9UUG1jV3IvUU9wMjc4WFQrZmZ2eXdYVnRhUUZM?=
 =?utf-8?B?N3BaVDlENmdnOGF5eGVxZ2hXUEI2SlUvbUNhUWtPczErTlkwcjUwTWNtMGlX?=
 =?utf-8?B?MS9sKzJlaHFHcVBjbDhHWUhNMHJyZ0p1T0N6eEd3K3NxaVFnUVVhK0RPNk5H?=
 =?utf-8?B?S0s5UDZBcW9seXhHalU2cnJpTzF4blZQMzh1SkNtT3ViQ1ozd2RBOWhBZ0hy?=
 =?utf-8?B?c0ZRbkJpWE5MMGM2UWMzVUgxdDFWVVdJK0tWaXkyUzdDRStCNis4UHltQzdm?=
 =?utf-8?B?VTdidlNLRDNHaWVCRDRqbEt3R0tNWWQ1NlNVa1NRcnI4QnpNc0NmaVBDRWdI?=
 =?utf-8?B?bUNRZW1IVmRHMVpaYmErNk5XeHpKeXEyL0crcTFjZ0FqbVlIWDljTWE2dWIv?=
 =?utf-8?B?cy8ycFVkRjFHNnY4UXhiR0FGVjMwYUpKaHA4L1dGZ09wL25CRVJxYVh3U25O?=
 =?utf-8?B?MXpSNVc2TWk4OW9qZk5lK3pmbXBqdWhRS3IwOVJoQm9LOTJOS2xTZHRXSXFU?=
 =?utf-8?B?MlU0QnhpeDN6MklZVnVHbWY1Q2ZUT0ZMaXhxVG9VZWlvZW5WUEgzSEtvNTZ1?=
 =?utf-8?B?dFhPR0FmSTluN2Y4MTdUNjNQdmdJanhHSFdCYjJIRW1MNWc0Znl1U2lhalFF?=
 =?utf-8?B?Wmp2RTF6ZENLOU54V3I5Z243TWt5dWdsUlJFOStrTWhQSVB4cXpXMDM4QldI?=
 =?utf-8?B?TWhXdlBCVG5MTVVpc3prL1FUbjF6aXpqMWR0VWQ5M0dyZU50aER0cm8xZnho?=
 =?utf-8?B?ZnlCM0ZRZTlXN3NqaytQTHhvMDRPQ1pTczdUdVR3MkRTbmtsK3hta0F3Wm9G?=
 =?utf-8?B?QUt5aFpxODV6dVBESVQyTWtBUnUyV1RQRkt6UmhDM3VubHlrK3ZNdUZ0Z0xH?=
 =?utf-8?B?bzhjU2YycVZRQW9RSytZL1d2WlR6VFFmZ3JZMDByOElMQWFnVUgySVllbTM2?=
 =?utf-8?B?NXp5QXJQTlpGS1BGOGJrVWp2TVJVblNUZC9Od0tCMGhETUxtTktrT3BVZkpE?=
 =?utf-8?B?MHorRk5FU2ZybTcyMk1iRjUxdy83ZXUyZWZ5T3hvTnI0Z28xR2UzSHJBMnY3?=
 =?utf-8?B?Wm9kTkU1WndCTGtEejJPQ0FJcUVUVGRZZDY3eFNRSGFoZjFjVm0vYXZtcHRL?=
 =?utf-8?B?OU9BNGNkK045NUpQdWdrV0RmeGRxVmw4NWcrZ28wSUh6K1hCZi9GSjZYbFlQ?=
 =?utf-8?B?d2tzQUlTUGpMTnJHczBXUEhKRytzWUZ3RmdUL0tMVmR0bDBMUFJtV2pzbWJG?=
 =?utf-8?B?aGFWTFprNllZNFhSZE55b3U1L1pzV1JXOHZsTHRzUTdOUnpYZXZBdzAzNGpm?=
 =?utf-8?B?YkxwWHJqVlpTYnlncVRvVENNT0pINEExWGN3WWdHWjhJaUxhSmMvZlp3VHhw?=
 =?utf-8?B?NUpUdXROVzZ0eXZlalV2NVR1dDJpLzQ4REtZNVAzVVkreGlIWWJXb0FRRUt4?=
 =?utf-8?Q?mGDUF3eXgcSwlx0mMXiJk+k=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec01ebe8-78a5-46ca-299c-08d9f7970c88
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 13:10:37.4039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hRtt//WpLMbHFWAnyEKyI8z6SrvvBocJ6PXUOBgK91WMZrFfb0vNJ+YDObJ8fVdd5vj4fVwb38ZgRgo0SOtuvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8855

On 03.02.2022 14:57, Jan Beulich wrote:
> For higher order mappings the comparison against p2m->min_remapped_gfn
> needs to take the upper bound of the covered GFN range into account, not
> just the base GFN. Otherwise, i.e. when dropping a mapping overlapping
> the remapped range but the base GFN outside of that range, an altp2m may
> wrongly not get reset.
> 
> Note that there's no need to call get_gfn_type_access() ahead of the
> check against the remapped range boundaries: None of its outputs are
> needed earlier, and p2m_reset_altp2m() doesn't require the lock to be
> held. In fact this avoids a latent lock order violation: With per-GFN
> locking p2m_reset_altp2m() not only doesn't require the GFN lock to be
> held, but holding such a lock would actually not be allowed, as the
> function acquires a P2M lock.
> 
> Local variables are moved into the more narrow scope (one is deleted
> altogether) to help see their actual life ranges.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Note that this addresses only half of the problem: get_gfn_type_access()
> would also need invoking for all of the involved GFNs, not just the 1st
> one.
> ---
> v4: Restore mistakenly dropped mfn_eq(mfn, INVALID_MFN).

I think this was the only open item I needed to deal with. Any chance
I could get an ack or R-b here, please?

Thanks, Jan

> v3: Don't pass the minimum of both orders to p2m_set_entry() (as was the
>     case in the original code). Restore get_gfn_type_access() return
>     value checking.
> 
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -2534,9 +2534,6 @@ int p2m_altp2m_propagate_change(struct d
>                                  p2m_type_t p2mt, p2m_access_t p2ma)
>  {
>      struct p2m_domain *p2m;
> -    p2m_access_t a;
> -    p2m_type_t t;
> -    mfn_t m;
>      unsigned int i;
>      unsigned int reset_count = 0;
>      unsigned int last_reset_idx = ~0;
> @@ -2549,15 +2546,17 @@ int p2m_altp2m_propagate_change(struct d
>  
>      for ( i = 0; i < MAX_ALTP2M; i++ )
>      {
> +        p2m_type_t t;
> +        p2m_access_t a;
> +
>          if ( d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
>              continue;
>  
>          p2m = d->arch.altp2m_p2m[i];
> -        m = get_gfn_type_access(p2m, gfn_x(gfn), &t, &a, 0, NULL);
>  
>          /* Check for a dropped page that may impact this altp2m */
>          if ( mfn_eq(mfn, INVALID_MFN) &&
> -             gfn_x(gfn) >= p2m->min_remapped_gfn &&
> +             gfn_x(gfn) + (1UL << page_order) > p2m->min_remapped_gfn &&
>               gfn_x(gfn) <= p2m->max_remapped_gfn )
>          {
>              if ( !reset_count++ )
> @@ -2568,8 +2566,6 @@ int p2m_altp2m_propagate_change(struct d
>              else
>              {
>                  /* At least 2 altp2m's impacted, so reset everything */
> -                __put_gfn(p2m, gfn_x(gfn));
> -
>                  for ( i = 0; i < MAX_ALTP2M; i++ )
>                  {
>                      if ( i == last_reset_idx ||
> @@ -2583,16 +2579,19 @@ int p2m_altp2m_propagate_change(struct d
>                  break;
>              }
>          }
> -        else if ( !mfn_eq(m, INVALID_MFN) )
> +        else if ( !mfn_eq(get_gfn_type_access(p2m, gfn_x(gfn), &t, &a, 0,
> +                                              NULL), INVALID_MFN) )
>          {
>              int rc = p2m_set_entry(p2m, gfn, mfn, page_order, p2mt, p2ma);
>  
>              /* Best effort: Don't bail on error. */
>              if ( !ret )
>                  ret = rc;
> -        }
>  
> -        __put_gfn(p2m, gfn_x(gfn));
> +            __put_gfn(p2m, gfn_x(gfn));
> +        }
> +        else
> +            __put_gfn(p2m, gfn_x(gfn));
>      }
>  
>      altp2m_list_unlock(d);
> 
> 


