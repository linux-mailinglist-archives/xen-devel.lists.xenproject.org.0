Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A16B463244
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 12:23:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235053.407854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms1Dy-0007nU-TB; Tue, 30 Nov 2021 11:23:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235053.407854; Tue, 30 Nov 2021 11:23:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms1Dy-0007l2-Q3; Tue, 30 Nov 2021 11:23:02 +0000
Received: by outflank-mailman (input) for mailman id 235053;
 Tue, 30 Nov 2021 11:23:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AOGb=QR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ms1Dx-0007W5-80
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 11:23:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e00bb318-51cf-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 12:23:00 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-HP1STkXnO7eZFhoIifglKw-1; Tue, 30 Nov 2021 12:22:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6304.eurprd04.prod.outlook.com (2603:10a6:803:fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Tue, 30 Nov
 2021 11:22:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 11:22:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR03CA0017.eurprd03.prod.outlook.com (2603:10a6:20b:130::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend
 Transport; Tue, 30 Nov 2021 11:22:56 +0000
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
X-Inumbo-ID: e00bb318-51cf-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638271380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nA4BbexpTTBdOe796sx8Twpc/yEs4wQOlUd4N1nrctk=;
	b=LBsmhOBPzztlrUGmMpY67rK3fbLRXza1jiRwsCb1STRhormgF/6a1bS4tSu1cmXxCAOYzB
	yC9DTvgyyZe7nUINW/K3QMygAIFEdtkEqlfGpv/F/P+1kKhyfKl8FeVBo1QT8NCVHJp5rL
	y/B2ohqvKsU3q79N5rdzRM3F+IxMDj4=
X-MC-Unique: HP1STkXnO7eZFhoIifglKw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TidktcUigJ2LC8GIdi9hqw6Eg/lbPNG93/0hi9DVkovZwxHV81n9BiNjsAYdOv5kA3DuBYzHkS1lsDuTgpnZ4sQPR0UFcDr+k/CEFNM3k5CcVlfaj2LijjIF6FjmQVB7HCx3ypjwwv9rlYTYkMtGFjgHb1GeeUd/2HUUIbq6eSgR3yo/No9uJHGxx8hDwQzW0mAJd0HxL+dq6QDaQzxe6JmzDPGXBg0r+5LOC2O2lzRcVxG9PTvTHlSvQRP/JSKPaJV2Q3iTCSWp7IWdlWZ/13ag+0/G2fxvRu6liBi8bSAoqw94uNBaGF0DQ0KSjcDog27PiK6+mEVE+mF851JcpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+ADUfzGeFfQzAVMf3ka8n9nmIIHqPhFm2mvC7CeZCI=;
 b=Mj0GHMj9qpzTVx2Q6DKF2SBUsJHgd4HuAVik0nbhqkvzhOXVROnNqCNdfXSiMvV9ih4mrNTIRTBiGCktbG9ASxkNYNnRBqR08A2OiPuHbCU987bam0u1UUFZqREFu/6zBXXuc0ZFvsMW7jcddRsx9H2ZDFj08i/Baa2KRatRb7zwFRa4vK7gwZovIhY+bDu8XXTJOi342uHE1fpqUYd35erPuddomfJSqaaihlADBMC+bLhocKNuS5+Mk8+gFFzQiHKtHFCXKupRvTor4NB7CyGXEtdGQ2bm4FyJyjWJEdRWZIgmcHZH2icRksMZoSJD8W9lHZfx6NYx6Qxg+GS7CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0b38fd69-c484-fdd4-9816-5d2a00b0a7b8@suse.com>
Date: Tue, 30 Nov 2021 12:22:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/8] x86/boot: Drop incorrect mapping at l2_xenmap[0]
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211130100445.31156-1-andrew.cooper3@citrix.com>
 <20211130100445.31156-2-andrew.cooper3@citrix.com>
 <5b4dcbae-4100-ad3c-cbc4-51f2b2bbedaa@suse.com>
 <625fdf21-8024-7a79-5c64-b8ed959c54aa@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <625fdf21-8024-7a79-5c64-b8ed959c54aa@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR03CA0017.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea07186d-6093-427c-394b-08d9b3f3c242
X-MS-TrafficTypeDiagnostic: VI1PR04MB6304:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB63042AF82A46AC348AB0C244B3679@VI1PR04MB6304.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vUSqY+XNAv3wxzg7pXrqtL0kfWeGrWEKYXmshlQCUM6iiTQOQBKLi4eJRdJFx3+3iPV6B3R8n7NPxIuf5p4KVnYAC7p00kipGL5K/NNor0c/yLxDYe5CA+Z2CjoFlZFjx73+STn3eiTV9eFl51UKF31zVzck+rfKL73LMGAHIv/Cc/8fY6NoVoOqlJYgfoLtY0UX2HWV2O3WD1o7GgUgkgYvpJghXRv3VIUcGd354P/RsZ54nm3queA3CPR/Ozmr5+694RijyF9NkKKxG3A4f6Gzq2DUmGDpHIWlHlTJhNDuHZ1xqkxQlrbmrpKgEgRUH911VzATJFaj5+eC0wowT6zN3sG3HEitMLx/IphDV7883MRTU4G/oLs4WvBx06LjWMi5rPpxsJ5oq/+pq82a/PmZmTx+V9kK+1qtnJzQhcMcFZHzVRKxfeeTdoPFs6qftHp3vpCyGPrsPeOhlGq38NOxGoK7SbhZdSsfNlhw/W0/EReIDYUmvaCpWldfVd9ezewrOOyvNXSVzaDympC6tKCqHzPV/cM3c1W8HhwPILEqSGkQMkamg6lFWvY/9AHXkknV9l6OvS11wIVeNUMYY1A9c//vDVm1T92c0jgbB8yKrTBP3Ts6E9ZY2xw6jMBLl20E3OB+5szQyFzuM4v/gPasKLnVx6dhI99aGUJvayXVwW+5cRTSOjz88uw290DyQ9eXjW8Y707fHnumWjFgEhoqQq0iJYLi6zf4GfVG4yryuy6HHZhpleqpizWDHMdG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(26005)(31696002)(38100700002)(36756003)(186003)(6486002)(66476007)(508600001)(2906002)(8936002)(8676002)(86362001)(110136005)(54906003)(53546011)(2616005)(956004)(5660300002)(316002)(31686004)(66556008)(66946007)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z4rJDDI9w/9MHd1eY+3pDj96oaGJByo+94I8fIu6NNU//cUSAyiVSc3uvLFs?=
 =?us-ascii?Q?XP2gF3E6EKV4JYvBNqxeOE1UpB/yXKnkZZg+t/bxO5qoEcicu7CztxN6o80F?=
 =?us-ascii?Q?RZza1ypc4RPhBKkAR+zfoL0tQhKQcgjEGJwSEyHs/R8eDDASknYg3u9mRHjh?=
 =?us-ascii?Q?Hct3M0XQGvkdUq2JEh0ykAhDyJ62S672xHcUc4IaABHt8fQrPM1s87eVBMLM?=
 =?us-ascii?Q?VSa3zgHe2mPdps7stOy1+oeiDpLmYV947DY8ckvKAb5zYbiaVvjNF0mJM5xo?=
 =?us-ascii?Q?WTjUm9DQMXb9JCWaxGivtVd2u6O2s1r2SgUMseGvfa+ic/RInXdb9oqRGdNc?=
 =?us-ascii?Q?q0E8T4PpxOb2+jw7Jfavb11/4UXatM9xe5gaEoa8fE10OTFrPfyhX4CqEdu4?=
 =?us-ascii?Q?bcN5fUtGwhvaVotHX+PTMxrAqf/oULMDJXoFda5xsdfxjt3GURjoU+qhw6NK?=
 =?us-ascii?Q?Za6FFp20oI33VB4obxOj1WwwAFC4I0cyNMUuAta5wDxH0oCH+qAu8CBUi3vj?=
 =?us-ascii?Q?+Grg0SJBnRMM8weXKIe1RXfY9lIJll6ROEoftQ/RkNTA65VjG9RU5lahegNX?=
 =?us-ascii?Q?n+fSyWKJ9Z/Odf+VpxkIPxQLJ99n1zghr9jPdnEmtUBlBKfnR3bw2cIi5dLG?=
 =?us-ascii?Q?j2LLNRZbApoi6jqIfGEsmwAZozQevjI912BAoC54lDF3AtyTyAiZ+gim0VWa?=
 =?us-ascii?Q?QieXI2xZZN9rGE/8eBMrmifokLNSnEGnAElD0/NxnL78C+d/M+qjhza7z4iN?=
 =?us-ascii?Q?62+Hvroh4+0Jw1g8KJptcedF+mTiQ18zKvyKAoB/f1yS58R949SDAGmkiEkg?=
 =?us-ascii?Q?Gj7JiMSxNk3oQK2Y5LUKmJJpniXgLw6xRhVdMee5Ga1292OJ3fSDcrbU3OXh?=
 =?us-ascii?Q?OO5WhNGNGyFAgw92nFHMcG6OOeCZKeNZf97jJzZz94dBsFJE2TdUwh4M8nJX?=
 =?us-ascii?Q?nYheABEFDdVsR0QHigXBKPHyyLtdBpuak+U6gdaYtVkdTxxLwxtq9g9Ovby8?=
 =?us-ascii?Q?Q542Qw7PQ0ss10Uujf2KaFX6ew0iW5lqO6+f3wem3Mbv5cE1Wch9bDlQeUIO?=
 =?us-ascii?Q?qTME4ws69YA1k9NZf4naSYM48EctPel3Di+sxPiHwQO1WnJl//mGH0igiZZg?=
 =?us-ascii?Q?k6V2RBqfw5+WzNYAvW0f5Mhj+f6ZY0OaAfjFsBE/tWamGWNfx6p5Dl5GEDba?=
 =?us-ascii?Q?kdrxtxU7Z3oxoEurRvmit9Y/VXirvVkx52Z3K2GlysT10IL/rKCYkcUBFHs6?=
 =?us-ascii?Q?bajEusIeAtdqH2oPevkg2a69wyFvsIOyDXCkn73lG1BKik+l4CJOZ3B23HLj?=
 =?us-ascii?Q?nRV5wHlSdTJ0gpLer5cegNyLOrrBpMmsYqvJY00/ZQLHicJPlkWdb7Acrfhc?=
 =?us-ascii?Q?Mmdx/40A3IVJE+q9cRLS3uEluPu4VSUnM4bZkolVYcpRl/0QCPyS2di22+H9?=
 =?us-ascii?Q?FoRnHXXQ2iukux18nxgdP6NRVpeBnAdEeJnBGYz3PL53UcKpZliq4GCqzoDq?=
 =?us-ascii?Q?8yTfahqU5mWRF5xDLTPB0+70z8KLhxBv1SIJLaY0ix6JYvvUmZo1kMyMTmdD?=
 =?us-ascii?Q?3+WqkFWUqgNMNC2ZN6q1bXw/SOSwGMA/xK7OtKEZzGYOK8DzsEfprjVy4ZH5?=
 =?us-ascii?Q?o2XWyYimZe8GSbjCJ6BufYY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea07186d-6093-427c-394b-08d9b3f3c242
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 11:22:56.9149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6kjvSW0r3No/nsmi4A4pnllZhH3xySUu3wjrFsjs1tc710fHVTwLj8h1V+JcdCEo5EdJDHFki1swftH4gEcg4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6304

On 30.11.2021 12:14, Andrew Cooper wrote:
> On 30/11/2021 10:33, Jan Beulich wrote:
>> On 30.11.2021 11:04, Andrew Cooper wrote:
>>> It has been 4 years since the default load address changed from 1M to 2=
M, and
>>> _stext ceased residing in l2_xenmap[0].  We should not be inserting an =
unused
>>> mapping.
>>>
>>> To ensure we don't create mappings accidentally, loop from 0 and obey
>>> _PAGE_PRESENT on all entries.
>>>
>>> Fixes: 7ed93f3a0dff ("x86: change default load address from 1 MiB to 2 =
MiB")
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> I guess this may be worth backporting despite not having any immediate
>> adverse effect.
>=20
> I'd say so, yes.=C2=A0 I too can't see an adverse effect right now, but I=
'm
> definitely wary of stray executable mappings lying around.
>=20
>=20
> In principle, it would be nice to reclaim the 2M of space (which only
> exists for the MB1 path IIRC), but then we're getting into a position
> where xen_phys_start isn't really that any more.

Well, xen_phys_base might be slightly more accurate, but apart from that
I do think that we reclaim that space (as much as we did reclaim the 1Mb
before the change of the default load address):

    if ( efi_boot_mem_unused(&eb_start, &eb_end) )
    {
        reserve_e820_ram(&boot_e820, __pa(_stext), __pa(eb_start));
        reserve_e820_ram(&boot_e820, __pa(eb_end), __pa(__2M_rwdata_end));
    }
    else
        reserve_e820_ram(&boot_e820, __pa(_stext), __pa(__2M_rwdata_end));

Jan


