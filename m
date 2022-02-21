Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E3A4BDA3F
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 15:32:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276304.472433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM9jN-0008Ux-GC; Mon, 21 Feb 2022 14:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276304.472433; Mon, 21 Feb 2022 14:32:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM9jN-0008T0-Ct; Mon, 21 Feb 2022 14:32:01 +0000
Received: by outflank-mailman (input) for mailman id 276304;
 Mon, 21 Feb 2022 14:32:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nM9jM-0008Su-AD
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 14:32:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06f3c7c9-9323-11ec-8539-5f4723681683;
 Mon, 21 Feb 2022 15:31:59 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-uTQrAVnWNkifpebc_PwDZA-1; Mon, 21 Feb 2022 15:31:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB4905.eurprd04.prod.outlook.com (2603:10a6:10:1b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.27; Mon, 21 Feb
 2022 14:31:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 14:31:56 +0000
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
X-Inumbo-ID: 06f3c7c9-9323-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645453919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JPbR5anL9d5zoDh+33JiFb/Q5vt7Fou5lwbqeLbfqUQ=;
	b=Prl4raZ/kx6MV8onGoptkItTcoOm/kKEYBEIVgphLcfmxOpMQ/b1tF55NdueSAOVkCIkei
	lmvzAmDrFYioBlLup+V1mkWBq+fPum2za+JSiUFb70Bg/DPNmBav+EgQA8gGERiTU31ovp
	ekmtrEi19hWFvvrow8Exn8a3qrm+ES0=
X-MC-Unique: uTQrAVnWNkifpebc_PwDZA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ERg1qAZWy3h8VSiEI/GFMGrDwHe1qpGZNNd4DJeZXZ7wqgbFRLhCLzi3y/BM4A95f8+E65xGfgO9ngkMjQCYC0JTTlLkpTlqQWi5JKepw13oNDS4hxjHtcPMApxJ80OBBivLCOBtnxgZA93hNwO6r3qrjKIV2+uqT3miYPGolP8fVdF7YL1APx6SdVwtcAZ0JqNpoR6nsUTSTKTphKcyVYAtPJ1FdBzuktK7YX7tG1/BTUtyaAloncilO64OLXCLGhVU9WeZqFteXxWrM/q/zFNraSJSKLGvbgpTgPNwhBNGPZ/BwLZbf0YRkkHSbF2Jt+cLdBb5PKAn+sPHqjJ3dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPbR5anL9d5zoDh+33JiFb/Q5vt7Fou5lwbqeLbfqUQ=;
 b=GvUWL0y4l9JF0uRnl+pBEIdxAoeasNP9lnq7zXLeM3KiPcHOdx4dXaxHYOFMK4IE9fWnCmFxRkRZK9GkZOASownhWTArMOVoiURIV4YkhR3i2N6tR+46QTmNBiv4VWdBjxQBJeIhssMtlzceirQeWM58nnAmhDyKVi3hGjrVqMQ67x0FQgSLl5a8NcHOGpFmwDVZafh6ZkRZhnpLnWgrOwt5URYjCYo49yyrh55jWyz3aHPgus5uN48HSt1oxqKuUVfy6zzPbbpCAL+jgwDgw44fihtgRTD+xNvJz7wb+yl7a2hR/UovJgOiuQxqO6Li6cIkMxpE25x5Ppf82SRQkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <28f2b406-f36e-e115-d6ff-cdcdf22f68ec@suse.com>
Date: Mon, 21 Feb 2022 15:31:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] xen/include/public: add macro for invalid grant reference
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220221124221.10245-1-jgross@suse.com>
 <5bf7424a-c295-7aa5-4bf8-13136065a06b@suse.com>
 <7798d54a-0aa8-5c13-c8fe-50e3dca54b12@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7798d54a-0aa8-5c13-c8fe-50e3dca54b12@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0031.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b47296d-7e40-4382-57c3-08d9f546e93b
X-MS-TrafficTypeDiagnostic: DB7PR04MB4905:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB4905BD64F924D9214DA39022B33A9@DB7PR04MB4905.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a/g6FNtoGoi6xt89+XgnqralAB7YffSjbBgFlRM/OuNX3tp/SY8XhhF21Tzgr06fVlFPjO9k3E3jEu0jvbVyenJ0sGJNWn/eorg2PCUqFUi/562KIGyGJRNRQhHhPkc8h4//OoKRRkP9WxGH6UZtxHFX4hBOEhlbTsFHM8cyN9yHUKNwCM63vteHRjDOrLyovSRNg71Qm82l01TDH4td+sew84JC/34OJZ8Dmmz/fYyh4TicelIRJ7mf2Anf+k60lac9GRJ4zFuvAsXWJXf8t2xDYpI4zWRaLlVYu5qCGxv71wQck5tjd8/Qc7DH1JZRlIZlxfgJCTiBjosRykL4cg0mTJnqmraVdcDTNV3Mfs6O/iPvWfBmio9RGtTS8oLFLsGsmfk9BRyIBeuLw66+BFWwXSbdzT/j9YzoEYRTvHrIGCl0PFhMfV8VDYXbiX0SjAI7M85uwRzGXPrKXVlK5sTKn9YJ5lcPCLlOtvbrTF1DGI0ck3Nq0ICy/VEhqSYCNfUO8xUlKok5FVGq0qG2G92vyvJanCOsQp3aVkt4IFvxb74hTvUciezOwu/PbQfk+xvMaxRSDayTb/JhHbod1hsypk5E0ew6JHsdY81qdzYt+1f3pditH1Y8/E7iNOcGfY2hlzDzKsjwI6STjsaSiqPYWeS2ktv90ua3oWrGDT7WOKqv4q640cOh4pkIxXztw9xf9NvrVzOPmvdibGXXKOmS1VbzZ0XVjaVI9yG59Kmp9kqDxPKbIh2XXCVDSUc8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(508600001)(6506007)(6486002)(6512007)(53546011)(31686004)(2616005)(2906002)(38100700002)(4326008)(5660300002)(186003)(6636002)(8676002)(54906003)(37006003)(8936002)(26005)(316002)(31696002)(86362001)(83380400001)(66476007)(66946007)(66556008)(6862004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0hiTnZFT0ZkUnlpRURuKzN5TWFJZTRyVjcxaDFMMnVFTTE5U0lLdlhkTXFo?=
 =?utf-8?B?Qi9FSVVDQlFxdGpMa2R1U1VPd0lxS3J0Q1J1VlYzc3lCdU5HdDNkdHE5ZFBY?=
 =?utf-8?B?cTFVRUtEbWtaMFZoM3YzMG4rY3Y2UUhOejNwNTZHdDFVUFdrYTN2WUdpZUht?=
 =?utf-8?B?dFFFZTFZUzhsWElmSlNaTlA3MG9jdEtPVDV1VWVydUdNWkVZMHc5V1M2ZTQw?=
 =?utf-8?B?WEJ5WG43ZlRTL1k4T3RJcHFkQURYa0tHdFJOZTRncklLTmpHa25wYjJsNnFO?=
 =?utf-8?B?QWt5Z29PWjcxdlhJMm9sNWRLSUpsR3l0ZHVOQmpNc0YxRkRjMUd3S3VCN1Jv?=
 =?utf-8?B?bVBhY2hUUkVNbjVOVW5lTDh5ZFNoVW1xM1ZCUS9CTnZuRTAzUzdkSW40blZC?=
 =?utf-8?B?bjk1bXNRZyswVE9DUXIzUk5jbVNmYmJQbk5DS2Q5VFRCbEFieXYvemt4Mk8v?=
 =?utf-8?B?M1lyRXdvSzNlS08xc1gxZVdaYlBpNm9KSExhVUp3bnhLQjBlMXR2YWZMNEVO?=
 =?utf-8?B?MnY1TGhoaXZTSVRnQzFsVkJXUzc1czREbHlMU2hwcUtIdlpVUWpxLzd3M1d1?=
 =?utf-8?B?TnB1R2lESHFoYnZLOVZNb1NDekh2YnY4MWg3b2tuMlNiOWp5RlNDNGMyQ1FO?=
 =?utf-8?B?ejVuWEhXL0N0ZzVmd2JkZGZhd3d4QjdZYTA4clY0Qmk5QUxNelNuSkFNYi9S?=
 =?utf-8?B?OWc0RWx2a1BMTzlONkFEV3crY3lGUWUzcUhabTVFVkdaczZVMDE3WmpPaEU1?=
 =?utf-8?B?dHJ1b1h6a3JjQytZTlUxMGM1ek82V0xxQ2VOMmZPaCtpMTFzUXJCL3ZWQ1c2?=
 =?utf-8?B?OGNoNDRJYjUwL1NJOU1rQ3FuZFdvMmhwUkZSSnFsTGtSdUJkc3ZYZVQ5dkdP?=
 =?utf-8?B?U05wdWgyQ1pRQXVyc2NidXpWNndMNWdUWDljUFVPRXNjQW95OXlyVjVrbnBZ?=
 =?utf-8?B?MWVyMDJnQUl4Z0F2RE5Yd3kraHNQUXM2dkJEbXlSYjBSKzhpVUtWMWVQdm5a?=
 =?utf-8?B?aFloMmRIMkl0VUtnZXVObU1vSWE0K3BNWjBVWk5EaXhOOEpTL0d5UkhSKzNQ?=
 =?utf-8?B?c016SUIyVEJFSjVwT0FWK2ttbjRIU3Q4SEJlZjI3OFVNMVZ1eUR4VDFMYm9J?=
 =?utf-8?B?cy81L1hrRnJ6eXFpbTJhT0FxUkhyaU9uRFV2VE1YYmwxLzIrd0NLTEhIdU5B?=
 =?utf-8?B?WHZhTFFoVUZydm5nSGJHZUEvcmVoTGhrWnBKbE4rTG1sa2FsSFo4cUQ2VTRy?=
 =?utf-8?B?dm51MHVydWo1TW5vZS9PL2F6Y0xlS1Q2MzBlTmVmSnBYNzNvaE12VWJzQ3B4?=
 =?utf-8?B?bUJhUVJJWEZram5XYXhQYjdnYlNOSW9DcElkQi9td0JoTXRaVTg1NXY5bGlM?=
 =?utf-8?B?V1ZzWmNiQVJBckovWHQzUmNEK0hCZlZJV3ZZUGxzbmx4ajBvTmw4bXBTY0Rm?=
 =?utf-8?B?QlpwK0cvTFZHVVBPTkd5ZkpFbWgzUm9MUE5ZK2ZObW8yK2VzU1llMWQyK3dG?=
 =?utf-8?B?Mjd2c1RPZ2QvendpQXRrMW1UYWpuZ1N2c3kwb3hxOVpPUnhKVTlIUEg1U2Zv?=
 =?utf-8?B?ckpmN1Rremp0UGhNTGk2NG5iRHBJM2RuOTRXSUUxWDErbWdsUUdxSEt2ek4w?=
 =?utf-8?B?QTN1dXFBTFVucm53citXRnRLRm1tWEN6MzJNQUsvbzJMWFptc0xZM09HOTF4?=
 =?utf-8?B?d2FaOS8wRmRHUVJPUFdVemtBVXgvZXNDK1Z6eExReUhEZHpQWURIbC9sYlR4?=
 =?utf-8?B?NHNqdXNqdDNBdkUxaHE2cDZnK3M2RURod2tGMEJ1aFhwMmtFR1lCYUdZRG8y?=
 =?utf-8?B?ZG5FVjJVN1FNT0NPOXAyaVAzWVJLaHNzSm1KMW1BYTB0MUdlZGduOVAybzFr?=
 =?utf-8?B?MVJKM1cvZUFsQ0tJWW5KQ0tKQmFTWVoxTER1Zk5FYzQ5SEtHRTdXWXBRY1M3?=
 =?utf-8?B?VUdDK0lrSXVZY0tpdDhzQ3ptT2lOWkRLK0hKWmdScTRZdm54c242Z2hKSnpp?=
 =?utf-8?B?Q0xSbi9tUHhXM2NUUXphZlFHeDdnTjRyeHAzMVlYVEJKS0p6TzhhKzFTM0Nm?=
 =?utf-8?B?bW9kc2tWaEFwSUR1L1JkN2ZkRm11NitCTFNtWmNwcGZYNHhIWW1mNVZwWkFw?=
 =?utf-8?B?Vy92TWhXdnoxNTFES1k3T1BocGdqNXMzTC9ScW9IRXY0dkpCMGVvRnF4WG5y?=
 =?utf-8?Q?jLCzeREEqQS4YhNWn9Bu3hY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b47296d-7e40-4382-57c3-08d9f546e93b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 14:31:56.0538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kOfpmZd4C9EhExPcd4LPAWoUhnij9poSb6LqFBZjyBYm8hen2IOMuJF4xSaTykGw+jieRBNNbXihsZQjRMAgiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4905

On 21.02.2022 15:27, Juergen Gross wrote:
> On 21.02.22 15:18, Jan Beulich wrote:
>> On 21.02.2022 13:42, Juergen Gross wrote:
>>> Providing a macro for an invalid grant reference would be beneficial
>>> for users, especially as some are using the wrong value "0" for that
>>> purpose.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
>> Over the years I've been considering to add such to the public
>> interface, perhaps even more than once. But I'm afraid it's not that
>> easy. In principle 0xffffffff (which btw isn't necessarily ~0u) could
> 
> I can change that to use 0xffffffff explicitly.
> 
>> be a valid ref. It is really internal agreement by users of the
>> interface to set for themselves that they're not ever going to make
>> a valid grant behind that reference.
> 
> As the grant reference is an index into the grant table this would
> limit the size of the grant table to "only" UINT_MAX - 1. I don't
> think this will be ever a concern (other than an academical one).

That wasn't my point. Limiting the table to one less entry is not a
big deal indeed. But we have no reason to mandate which gref(s) to
consider invalid. A guest could consider gref 0 the invalid one.
The hypervisor doesn't care. Imo this simply is an aspect which is
not in need of pinning down in the ABI. Yet if it was pinned down
like you do, then the hypervisor would need to make sure it refuses
to act on this mandated invalid gref.

Jan


