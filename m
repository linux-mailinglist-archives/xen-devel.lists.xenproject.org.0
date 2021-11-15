Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA994501E1
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 10:58:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225721.389827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmYkI-0001ey-Fk; Mon, 15 Nov 2021 09:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225721.389827; Mon, 15 Nov 2021 09:57:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmYkI-0001bV-B5; Mon, 15 Nov 2021 09:57:50 +0000
Received: by outflank-mailman (input) for mailman id 225721;
 Mon, 15 Nov 2021 09:57:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmYkH-0001bP-ND
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 09:57:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d0ff8aa-45fa-11ec-9787-a32c541c8605;
 Mon, 15 Nov 2021 10:57:48 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-7-Bfv0olvgNXGiyTwqrfW7TQ-1; Mon, 15 Nov 2021 10:57:47 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB6337.eurprd04.prod.outlook.com (2603:10a6:208:170::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Mon, 15 Nov
 2021 09:57:46 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670%7]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 09:57:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR04CA0015.eurprd04.prod.outlook.com (2603:10a6:20b:92::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.25 via Frontend Transport; Mon, 15 Nov 2021 09:57:46 +0000
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
X-Inumbo-ID: 7d0ff8aa-45fa-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636970268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bdR5JVDXfYFw1Jkxd4yujs7nOjGCUFmjmKVbMM5vNn0=;
	b=JPdtGngqWjC1lBkWbB6f2/v0DfcZFllocXp/rmAexgBTvmfgllbokCFzJpLz9GopZb80bG
	mgZDRCRR6tT09Vp3lRoq3yp6lryPJhVdd17zIPpI783cSTFmXMVwzGHA5QcxRBjD/QGxh1
	tb5yx3ZESUV86mPphd70VJsdkDgjsQw=
X-MC-Unique: Bfv0olvgNXGiyTwqrfW7TQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSb/PdbVmMq4uTH8scl9ip9S2q1kl9QTj4NcU1z7Udu2dhqdldmu0YPTDaoPKXS8Hrf1lTcqnBu7FoDq5q98ObQdYW44X65kJKA/4qThWvXnkOk7QNtw0k//N+oMVV1pnH/CZJ9I8/TqVfGRCVfi2XjBE+uYYPHiDAZvxdgVZCYlrYibE3CTug39vM7lX74NipqNU6SwAGdXWJYQovO0MVc/BEG23WAhDQibGUyovn3cfEcJbp4Lso2xjE17HVVTfAvJ67VW43kdkj0cz0+PuYgdMhwQfgx/5RtaC8rr9Z60SSuLYTct4i9EnWE3fI4HGfyJE+VIgOmPIrn/kUKZtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdR5JVDXfYFw1Jkxd4yujs7nOjGCUFmjmKVbMM5vNn0=;
 b=NbUFlbpDnUsAfHspD61O6zp3pQpMifFnDGLJxz+yWKMsjZKV8UQdYEy+RnaZPxlKCP9ZVfbQ0iSHMy0Xu6a24sndvAhFfu2/k2fJa1nuNl7fCLouu6NQT+UcYHzp/uP/BkBYruL5jd/I28ZEaqLLioLbhYXu8bn3tVMG1G1WE53GlCsdxY0NbZzwLCojmemplMJicxHUlkEFZyLF6DP33eNUy5sy+UAQBDbVb6yIIFI0DaRJTUu6/aXZS9/3OBY73INKUyh/s+zR2ksY9jmwUpfp+67zOnhodw8wdGQoSqfVXSvXpLuPQwN+x+mkZd3TxXIP0YO2XB2tMqw48MC0xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <25bad8ca-d5ad-5100-9a00-9e7add0f6113@suse.com>
Date: Mon, 15 Nov 2021 10:57:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [4.16?] Re: [PATCH v2] public/gnttab: relax v2 recommendation
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Ian Jackson <iwj@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Luca Fancellu <luca.fancellu@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8e6e23c7-4416-405f-8bd1-bc5b23ea587e@suse.com>
In-Reply-To: <8e6e23c7-4416-405f-8bd1-bc5b23ea587e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0015.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::28) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d18681d-742f-4632-22bd-08d9a81e600a
X-MS-TrafficTypeDiagnostic: AM0PR04MB6337:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB633775AEC5A6C0D9AFFDC1B7B3989@AM0PR04MB6337.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vysnq8lMw5tLPzsWHlvSq2U45ygBgnls4dJZgS3WnsnfukiBuLdQ+I6DYwqkGC4IAEHCPSOs/2fUT78cD4ONFBoFlq346q1wzip1UvjWsbFd5ITn1aJpq/01b5LVbBnV11gQh0PEInJzALydngmrLwI6hnmeMhuRefzvaeO8Fo2ER6QE7z9P6ouMQka1p+JwcWSfCPHDtN9fHkyL7H3A5ZSK3k4AVVcaTgreiW41371egYs6DLOKRfnivCKUGRxQD2AAGrIr5Fz6oAvl7D7A1sfqwvv0juKH4o6q9Awfx1MvBX/W8vkyFC+491IX282NWRFRv73LxcNp58S4BCCjdGC7rnBZ0d530zrVihPfhaeftx3JYLzDXtdDb7PW8xOsSIGjn8qYA5IR/JmA64qDdaP/NCYCIxCpbJ4coaTYr5xLK3pyUQvTYU0Hc7SCW5vox+0J6ZQkI039ZUG0xFSsq6BWd8ebakaASkG+DKZY1479feBXWlOuC5HF9QFv/relVx1UJ7jgpzQIK2tMn7oXkQvR6nz0P/Ejv2zr3wc92cOGeAd5mvcqgJmvP9JoWUKFIHPpkASATg/qF1Cn4IcAl5NuBNwvW7Xjsz67sV36chtHtcoRKbEy49IxhS4kcBuEYZnEV04KWDmV6nvq3Rr+7Uby+uE9HOGKPp4yBSbOezIkPsXswhVPSpqXWohcx/1Ayox97StcCAAMOjueL8B4357kltp2A4vu+5k7b1R/Zd+r0U02Jyg7gsDHtUKhtQb8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(956004)(5660300002)(2906002)(6486002)(31686004)(2616005)(26005)(186003)(36756003)(83380400001)(8676002)(4326008)(16576012)(38100700002)(54906003)(316002)(6916009)(86362001)(8936002)(66476007)(66946007)(66556008)(31696002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1hvU2kxd3JTQVdEb0JucXRVVnBibStXWGF2WmVBUWxRWmNGVEFrcUpRSjZw?=
 =?utf-8?B?QjYwakZRcW1YWWR0bFNmM25SODRPMGl6NnFpYUdSMGVLbmhxRjI2cWVvTDUz?=
 =?utf-8?B?bzhONUFtVTRWS0lrUnpyMXMvN1pDU1JoYnV1Z2Qzd0lrSjlHOVY2L1lIQXVt?=
 =?utf-8?B?REVZcnV1WHEyaER0bDFRWVdpMUxKR0VybTdsZHQ1TjA4UmV4QXplZVpXYy9o?=
 =?utf-8?B?K2hRVGpoWnFkbHNqcmc5ZWlzajlBYTNLb3EraEx6MWFQODhKSVJsVXB6enBI?=
 =?utf-8?B?YjdMR0ZkWXBYaStiU2VDTnJvMDM5UGwrZFNMNGFOUVF2VXJyR0VVcGVCN2N6?=
 =?utf-8?B?Q1J5ejdleVdqN0FlYXFQcTBSWHlzelBhc1o2MXdNdkNIYWRJUVZ4TXNacXlO?=
 =?utf-8?B?aEllUTM3aXA0cDBVS1hCaHlSUzBaREpVSkkrcmxtOU1DaWFnb2lFUXF1eVBu?=
 =?utf-8?B?bStxUytRd3lXQ2dRT2pjR3lwOHUzVFdhUmgyT3A1MWViWmlIbVpldDhReXcv?=
 =?utf-8?B?blZLUmEvVUlJWWowbld6MlF3Q2hDS28yVEdoZkJlM0xIb1lnZnRlckZBdGhJ?=
 =?utf-8?B?NkEyQ3NxdXRDUHhmRHp5STRrc2dpWDNOZXU5c3B5RCsvWGlka0Q2OFFzU1dQ?=
 =?utf-8?B?WmdGbVoxWWZxeXdxbjNNVHRTcUtSMjBvYS9pR09ieEI5RmU4N0ZxSU9mcCtv?=
 =?utf-8?B?RncyLzk2d1Q2anpDc3Z0MUY5UFl1aFhkdlE1NTlOQnBlNlBTWEtaVFlndUF4?=
 =?utf-8?B?M08rOTdHdnN4d2lnRXlEWVY1UHZCeWtpeVc3cXljbjduOGU0UDQzNFpxbEFG?=
 =?utf-8?B?U0NUVHB6eU9OclIrWVdrNHFHZ25FdjlEZmxraWZPQVJISFZLamVFYWM1S2Yw?=
 =?utf-8?B?TjJlWXYzMWN2YUdqWVJZbzJNV3VjMVphSEl1a1hjNzVjSWJLay96YjVvekZs?=
 =?utf-8?B?akMyazY1Y0lpVVorNzEvMzFxQWdEVzQ0NFpGOVBRbGZ0THVoem5MWE9mQ0tB?=
 =?utf-8?B?TWgraXZiNHJLd1ZwUkZoazBUUU8xRDhTMTJXRHozcUhTSzNDZUlHdEZRMlV4?=
 =?utf-8?B?a1pmQkFVVTQ0R1ZvbG9NQXdtMnVnWGhvc3l2UDZNUHNUY0NGS3grOGJkV3lT?=
 =?utf-8?B?bFB2WVd6Q1BZVmR4SUU0SjlCVTg1WkRrNzFJMVZxQ2diU3dGTThxTmlWTFVt?=
 =?utf-8?B?WlpFM2VtWmVZWmUvZmZZU1o2UUhXdUwvRnUvclNoZEUrUTlPNzNLMXo1VW8x?=
 =?utf-8?B?NXdZTXR6eTRlSFlqclNKOFo0ajgzdGZROXZJbFFiNnF3alIrb2sxZDJ6YXZY?=
 =?utf-8?B?bU5UaXVwcnFRZUJURm9sTXhlb3VONXlkTVBEN0ZCcjBSdkRqajNrbDdRQzdr?=
 =?utf-8?B?V1BPZmI3MGdmbzNEd3d0NGtlSHowRXZaemdXeXJscFhldVRTM3BQcVJoSFZP?=
 =?utf-8?B?RWtDYk1XanJiNTV4Y3pzcGVpM1JOU01RN2NWMGdEVlFHK0g0dEJydnRPQ1Zj?=
 =?utf-8?B?bjNiRkhTS2xGN1BaU0ZrcFFPRlRhU1A5MmhUZ0NRb1lXN3FNZUV2M1EvUWg1?=
 =?utf-8?B?akZPaDdyYUZqYXoyMUt5MFFrWjdWaVlsL01LcThRSE9PbmRCa0JHeUYyZzNp?=
 =?utf-8?B?YVo0SWN6TFE1andTTUhIeTVFemFLNjlnS2liTitrVjZwdFhJNGgzVkpwOWVr?=
 =?utf-8?B?WEY2dXJKRjFXYnJiME9uRE5TbE9HZU9RUy9oellaaC9SQ2xMcEFXeXcwMk1X?=
 =?utf-8?B?aENzRnYydlhRRWJvYXBxYzhjU1gxejYrWVZxT1c5b0NYSU00QWtIcUdrTXZH?=
 =?utf-8?B?S0MxNC8xRHcwN1VIMTFXSG82eHZQKzVlazJLTXBzV0tiNUJadGl5dzA5dzBV?=
 =?utf-8?B?YmdyZ2U4bHJOblRneHhZQkYvYzZ1aUxoU2F3M3FBMk5lSUMyNytZVzU4R01r?=
 =?utf-8?B?SlFHT3F1Y3VYM0grc1VieWFqYmVyUW1zVkVCWWFxb3lDTjV0OWp2MTc0NDhX?=
 =?utf-8?B?alpHZkkzc0x6cWpWampRT0VwVmNVdXJFRVdvZ1hUV3BaNEZMMHRPQlQ3eGVR?=
 =?utf-8?B?RU1JSTNObWtVM0hDaTdzOHlFT3NNMERZT2V3OHR6MW1zQVZoOWF0MEk1RXBa?=
 =?utf-8?B?aU9nSEgrVTZrYXFDSjdZaDBYUG90UzMrWll6dUpLamlqV3oxVS80M3ZMT1VC?=
 =?utf-8?Q?nWJxhio7h/2JFloaM6rC1Eg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d18681d-742f-4632-22bd-08d9a81e600a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 09:57:46.4177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ivob72cuGYUtXg8L/avBbkezJ9GfHxia0/IYCq7EHsDMp7n6Xb3TD8DOKkLAW0BHdXOL8HOJE9WHdKAybWk5NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6337

On 15.11.2021 10:55, Jan Beulich wrote:
> With there being a way to disable v2 support, telling new guests to use
> v2 exclusively is not a good suggestion.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v2: s/be able to fall back/default/.
> 
> --- a/xen/include/public/grant_table.h
> +++ b/xen/include/public/grant_table.h
> @@ -121,8 +121,9 @@ typedef uint32_t grant_ref_t;
>   */
>  
>  /*
> - * Version 1 of the grant table entry structure is maintained purely
> - * for backwards compatibility.  New guests should use version 2.
> + * Version 1 of the grant table entry structure is maintained largely for
> + * backwards compatibility.  New guests are recommended to support using
> + * version 2 to overcome version 1 limitations, but to default to version 1.
>   */
>  #if __XEN_INTERFACE_VERSION__ < 0x0003020a
>  #define grant_entry_v1 grant_entry

This being a comment only change (and hence close to zero risk) I wonder
whether this wouldn't still be appropriate for 4.16. I'm sorry for not
having remembered earlier to submit v2 of this.

Jan


