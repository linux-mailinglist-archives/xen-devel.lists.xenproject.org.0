Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E02149CFC9
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 17:34:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261031.451532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nClEx-0007aS-Lq; Wed, 26 Jan 2022 16:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261031.451532; Wed, 26 Jan 2022 16:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nClEx-0007YD-I2; Wed, 26 Jan 2022 16:33:47 +0000
Received: by outflank-mailman (input) for mailman id 261031;
 Wed, 26 Jan 2022 16:33:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nClEw-0007Y5-A8
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 16:33:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba9959d5-7ec5-11ec-8eb8-a37418f5ba1a;
 Wed, 26 Jan 2022 17:33:45 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-iKrvBA3lNpygXWTjUr1hrw-1; Wed, 26 Jan 2022 17:33:43 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS4PR04MB9243.eurprd04.prod.outlook.com (2603:10a6:20b:4e2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 16:33:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 16:33:42 +0000
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
X-Inumbo-ID: ba9959d5-7ec5-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643214824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pkt7X+vVR2ncP7GWcqKAjQtAV9rV5o+GQb71TO8x9vw=;
	b=Q3gZLtqYCEAD786RwHe9bRW4crA+VJG93NDt6i5vWpbJwUB6BF4RzXAZVfl8PyBF6BmeLN
	tyH4uWXMFbQQjULcqeN/6XjsUjGZRfKzxxwqS90w2hjssXOfsiKDvlKvhT1LH8yGXe7miz
	wm7hBNzgI6t/zO4y6Rru1OPhvZjgT94=
X-MC-Unique: iKrvBA3lNpygXWTjUr1hrw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDBaAWtzG4QkwJ8Yad/lsF/A2wwmzm5BkgqGvoCB5vEVYCTvgh1r6A0pv85h2iROvUL+FVnSSqKFjOWKb3jXiZdgrGsuHCKiUPd1yRy4l9mmroXn2xjdQdn+/sU8RV4WpXDjobk//evr/ZTGpUXPBeULeozliwAqxPgVtFw0kyB0EjgSlOY6jqUgVFBJ/xFQqDkk+U+a5O1cEcPvzNSfY5bsdaVIWtcBPRAWESp87zcTJ233sh0/sat5LEAQA2jUe7ehEO79mVh8BGeub+IJpsiowJQ4m+AMx4WlL+zVoqOT3GJNMKXKHKJ2ElsDCpua3b8/hW8rC5atvO2uY78yCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pkt7X+vVR2ncP7GWcqKAjQtAV9rV5o+GQb71TO8x9vw=;
 b=WPQShcIKediHjcdnuDH1LZ7lPg176NlOfjQqzY/Co5KIr2e3huwMwfEwcQ91+PjtqHjzAUP+CCgm21DHKAm0wNNukewG3O33rPDx8AY2e6dX1/zVD9xdL41PpzT6tUuomQKbLlRU0+bETmepexcqdNrMsDWf67p0NBPRtyFOiBnWNjE04uS3n1k8t+uiFUPCuZalddzw8sCxvuE/CyNsNWAasPr4IJQ6hKPEcm71A8PmN6NCY53Y9c95vNI5ASvTxOfUA3l0dkNN8JeGMR0g/HdnvMynbk7YFu/gElKh233hn7cBrAgiZdyDgJUcW22nCOPRgEIDPj5DPqJPUxVIlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <614f206b-a28c-de71-7883-453327f2afb0@suse.com>
Date: Wed, 26 Jan 2022 17:33:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/8] x86/msr: Fix migration compatibility issue with
 MSR_SPEC_CTRL
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220126084452.28975-1-andrew.cooper3@citrix.com>
 <20220126084452.28975-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220126084452.28975-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0376.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ecd8fec-2f2e-47b6-e24e-08d9e0e99d45
X-MS-TrafficTypeDiagnostic: AS4PR04MB9243:EE_
X-Microsoft-Antispam-PRVS:
	<AS4PR04MB9243D99AAA441D9D5C5083DDB3209@AS4PR04MB9243.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TA6yOPYxpE/ZavHKsaF9Mz/u9OmBiLGZzy/oXv6UIBdFXBgLjcuUYpXf/YJgxXre/mnTSnUJBdCoPBv/MCtu28fbl/C0Xi7CNcxQlk5AN7Qyuq+s5xg0YOafCIu2dbLc2l0DN8Mvz/dPZVT2K+U9mTVOZNGUZ4IfeGBVwiivSsrPjqTkx4mCfuLocmxu0j8XAkre/fb4q95cWAmBlMQ4VCJyEDBDPD4RjcUvXjXgpYrdjQUPvYUQZmkiBx/sLiuZ8QGxCCJtQUYVTeivQQ4x/OWQ/QHpYpxEzPRnUvYOjOQSKQpYqD9u+J0HTFFMgWDRjmiyX9n2WLooscxUCOYAxuBUtTRzB6DYjYLXy/PtKlLO3DvdgxVGmyEHrtTJYcSYIgValRVu1ie59hV9uxFUExS5X0aKdYiI+z+qMc55W1WlB6AesfgUtzy/myeyNmiWbHjrhe8Dczn3tgYlSXPyfnalvJXR4yePhwLsYL1Cg+zf8xo3BuxQr85XaiYBqWrFe+T3kPwbX3kVXjJvwvuodoVrBbw5WTYOR8BKATvpmDkyACEI4zBX3zYyowRjNWsouZRqGU08KR/C32d149pfwMILELu3teg7trQqry9ON6G+PI0LIUBQpDIyHIfwSw2/1NF+OA0tZyuKHonZDDf8n5nA47ElczWESMi6b3xaLtLROC5mEH4fUx+q28ZRu21mqLgDGj7w9JXQr1nEyNXpzEiiXbLWxLr/gWfXT3VWoKzgILt5C8e+QJRHU2KwX9s1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(66946007)(66556008)(66476007)(83380400001)(4326008)(8676002)(6506007)(53546011)(2906002)(31686004)(2616005)(36756003)(38100700002)(508600001)(54906003)(26005)(4744005)(6486002)(186003)(6512007)(316002)(31696002)(5660300002)(86362001)(6916009)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c080OTlNMkFIK2R1TGM4VXJTd1pUc3MvdEJEY0NxTFdUNkx1R0hQcC9kRVZH?=
 =?utf-8?B?YXUxK1orU1hQZHc2cDF1TDNhSmJKWTZQVFZvL1BOSkNuemZnVzBxSUgzRjFz?=
 =?utf-8?B?d250enZXS2N6aFE4Y3pWVklCTnFGMFVDcjJlWXFTY1ZHTS9uT1BGSEQvaGo4?=
 =?utf-8?B?bVRaNGJJT2Y3S1htK21DTkFxN2tJNTl4MTA1ZG1DWFVDWTRNQWF6R2xjZ09h?=
 =?utf-8?B?ZGdCQzFjQm1VL3g2QWdtUit0WWR0bkREOUd2YkptdTdYR2xSMW94Y28wRThp?=
 =?utf-8?B?TjllUVloYTZHMHF5ei9JSWo3c2FabEZWY1Z0amJiWEdZaGxRd0JZSHpGTFBz?=
 =?utf-8?B?RFNZK3VsNnpxYk5iZVlkaGR6TEgyR0hZTVBwTHJEanl3RUR0MlVRQXQvM1ZP?=
 =?utf-8?B?R3dUdWwrT3RVMUpwT2pTUXFpKzN2TWhqd29iYVpGOFRJVm1CNUIralJ6WmQ1?=
 =?utf-8?B?ei9saldPZnpPWnhWQ1VVRzRpNFp6Y01YRkt4YUJwcnp5NVVyQ3l3WVhMY0VZ?=
 =?utf-8?B?ZC90ZlZBczVCS3lZblBhZXZoOHdjZUNxU2U3TE1QZktlK0wzU3BWUlRLeTZx?=
 =?utf-8?B?QUJpZG9KRm5DVC8wOXFjSXJYekZSb0tmd01EVFgraW4xOTUwODRzUGt3MTNw?=
 =?utf-8?B?NlNsRFJSMmp4cmhocDlDbUErY0xrSUF0SC9PTzBZU014YjY1NHYxOHR0VXZV?=
 =?utf-8?B?YjNQVjg2OXdNUllqREd3VjdkZG9RaWFpeVZ3bUtDTlFBZzlxd3JqL3JENDB4?=
 =?utf-8?B?UWQ0c0h2ZUtKd2FWNDIvTWFlQkFZZDA2VDVPSURHYjNLd2lMTmJQUi9oQkhD?=
 =?utf-8?B?ek9Ibzd5TnNzdzZlYWc5WHlmNHpqTXc1T0o3cFNISTJaWFVrb1oyekNRWTg4?=
 =?utf-8?B?MjQ0TzlZRHJoWXVnaitjbGpVaTN6OEVxUnB0VXR0RFFyUGJMVTRCVU42akQz?=
 =?utf-8?B?QmdDdFRiZFl2b2hCM1gxTzloTFp6NlVkRktnN0dZN2U2SkV3M05CSUpOZjVP?=
 =?utf-8?B?cHRmajRkZGhNTUwzZ1FnSE1vY3dVd2ErZ0s3TmtoRjl5ZXBUZTVOeDIrRFk4?=
 =?utf-8?B?ZWt4Um5jU3RRTk1EYmNwUElQQ1NNVEFKZWlkRCt3WHliN3Z1SnVlRGxpa0Jh?=
 =?utf-8?B?d0VOdkkya2ZhZ3ZZVEFJNlRnYkdxQnBQOW5QMGRwcmZrSXJyRTJlVFhwMzZx?=
 =?utf-8?B?U21VcWNzV2VJbm84N3YzV08wOUhKVnRXOUxyeWF4YUduQWcxN1hXREFhSWRh?=
 =?utf-8?B?YzJDTzBqenMyUFRUVnFkVkpURWZkN2hCME9zdmpjZ1U4VEh1Szk5cWxzVDBO?=
 =?utf-8?B?SlRXY1hGNVh1bGhSMGo4ZVNjK3hCMXd3YjZhWWxJeWV3QzZEZHlCVzJIYTVI?=
 =?utf-8?B?VnJNOVlQUjdDZE9JSkd2M2ZPYWFGSDRvd29zazhlVzNYNmlHYWlYaDVqVEp2?=
 =?utf-8?B?d2pNSStWNVVZK0U3Y21tNUlFeUM1TFM2SWJPVlNrQndtSVBQSFozQ2hrSm52?=
 =?utf-8?B?K1p0TUFGZEsrKzlzTThKVVRDR1JGaFdTeWo3eTRxa0ZFc3hpdmdxYkJuRjNp?=
 =?utf-8?B?bTd1RDBVY3dFdy9hUmIxaUlZRDJNbHl4SEZsNFZjWVFsT0tQWVJhQ0wvUEUv?=
 =?utf-8?B?Nk9zaUF4cEZuVmsrWkFBVml6dHZTQTNIL3BuVUcyWUNKWFJFZGVla2NGN0hr?=
 =?utf-8?B?bk55SDV2U3RMSEZXM3hvWXFFUkRFaWlueTFUbWZqaVRnQ2VacldFbzB4Uk85?=
 =?utf-8?B?Nk92U1ZqdUNwUkdUQldEV3U1K3VXSVBZWHJHdnBJaFcyNmZhdmQxcDlzQ0Zy?=
 =?utf-8?B?K2xVTi83cy9XQTNFb2N1Q2VKT3hlOUJOeFdMellEZzAxMjdBZjFjWDh6NVlo?=
 =?utf-8?B?bk5BWWFBK3Q2VVcvNmhNUndEZE1YK0w3OFQ4S1d0U203UUpibk5qUGJHRlZk?=
 =?utf-8?B?OTBWOWRLYjJmVHkyeWFrZllrS01senRXODUxQnNsWElLQkxUSEdmUTNqeWxS?=
 =?utf-8?B?K0twM3pLNStkRWMvdVlmMFBROWlNMStvVTJmRTlLaUhua1ZxbWFsMTdmUjNu?=
 =?utf-8?B?UmJTRDB2dmV6b0NveVNXM3NGdW9QOTNuVU55WE1CSC93MmxSRHpvRFhFdTd4?=
 =?utf-8?B?alE2YXRxbDFkVDdEOEV0MmVQU01hS2QzaE1KcWlnblRHSi9YdjY5QStaWWRa?=
 =?utf-8?Q?hys0IsQuUdAOblOqnXNwxoY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ecd8fec-2f2e-47b6-e24e-08d9e0e99d45
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 16:33:42.1959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ToBsuDtmIu627zUewoBZIp4cKZJfXnwIuOIzd8M+BEszhP8g07kA/qI7ZPEu6ESVGkMOBOAgI+G3bvCJ3fYVZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9243

On 26.01.2022 09:44, Andrew Cooper wrote:
> This bug existed in early in 2018 between MSR_SPEC_CTRL arriving in microcode,
> and SSBD arriving a few months later.  It went unnoticed presumably because
> everyone was busy rebooting everything.
> 
> The same bug will reappear when adding PSFD support.
> 
> Clamp the guest MSR_SPEC_CTRL value to that permitted by CPUID on migrate.
> The guest is already playing with reserved bits at this point, and clamping
> the value will prevent a migration to a less capable host from failing.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


