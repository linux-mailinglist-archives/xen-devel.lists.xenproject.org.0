Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A174A716D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 14:21:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264165.457166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFFZp-0001N7-DR; Wed, 02 Feb 2022 13:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264165.457166; Wed, 02 Feb 2022 13:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFFZp-0001Kc-AV; Wed, 02 Feb 2022 13:21:37 +0000
Received: by outflank-mailman (input) for mailman id 264165;
 Wed, 02 Feb 2022 13:21:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6WyI=SR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFFZn-00013U-AY
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 13:21:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0abaffbc-842b-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 14:21:34 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2052.outbound.protection.outlook.com [104.47.4.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-DjTnkOKNMgGyxK7OJb9y1Q-1; Wed, 02 Feb 2022 14:21:19 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR0402MB3368.eurprd04.prod.outlook.com (2603:10a6:209:a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 13:21:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 13:21:16 +0000
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
X-Inumbo-ID: 0abaffbc-842b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643808093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6zlLrFmQ+qOU0teSgTbZsYIGloJOdwYOn1YdOyUgAuI=;
	b=kS6n/RYa85pv9b0wwE1uWMLcEa0KOX4LNrwnPSkcGgFNcClPEc/1l7Mkd/VzZgUXg/eEt7
	czGlIbRP4+BX+3i4+iueKJQjSthQoqFJvC2JJOpzvDSrQbH7W7VZXK79BIB+ybtkcNHEjA
	zhvVZ1mACfCKd5LHe11seRqvwpV3JJ8=
X-MC-Unique: DjTnkOKNMgGyxK7OJb9y1Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6tE9MYgd/N1BvHK9dLh+/jESXyeAsfmg6/WsxXlXuT8OBqPEBNowYPGItOjZoLKmLmKEWJH6XjQPMduJ1fZA6saiIq+2nDx238innQliJ9vv3hCTZfBvRvNCsZtpEKQAOuapY/UC2e+ZXXh0NfOMZ98mL8e/5Y/kbGgcP21w8kklVQZScyHo1IJkGnDQzbHz7f692rlDBMcJ1xmR7crgSBL28vwO+qbw8zNTTJmwsUwDOWD4G1uEJl7xjTkCzvO0Nm9pciE9lKXvGECOKKMvXISAY54aqTLxiuny0NYJWBMh0C4Q7P2tB3ZlQrSJW8LPmj0YdwT44BCCVXv62jDLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvCMUBlsWjf8kbdnJF6lsZiPWn0BJc9zVPZpXdap5yk=;
 b=WxqqBDDNGIMzjMSz/Uje3dfcxvvCwe53aq/cyQX2mYMknz/wfbgrErNgjXFbmWmggCsC+ix33Yd6nv+kP6COq+l7eCdYzXJO5pHdrxaHHog12+o0tRWMPdK99W2DwNlPrHfi5suTWNVncP6d/uldAZ63F0dya6Ql5C79jKHnXw/yr/sQ18ZX23tNc8JNOwFEK8tSXXQsu+xzixUr3NhtxsR+/kFh1OBVUphLuqTDOCoAOi1ZoHb7ps+7WkROtSfNA7/NMWrHV6dTflLawW8ImIbInP9A0NBWJfxfN1w9MEUCOEKJK82LZ9WQhQGCpZtN1rTa/eBj9LJD9wV5idPDLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <44592911-0f78-d4ea-9c37-22dda98aed66@suse.com>
Date: Wed, 2 Feb 2022 14:21:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] xen/pci: detect when BARs are not suitably positioned
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220201124551.2392-1-roger.pau@citrix.com>
 <59685ca1-0587-a975-bf5b-56058b650c3a@suse.com>
 <Yfp1Unn9rIrwf78I@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yfp1Unn9rIrwf78I@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9354aa72-77b7-43d5-e8bb-08d9e64ee477
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3368:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR0402MB3368F3EA2C00D2F48BF76FB1B3279@AM6PR0402MB3368.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zMV9BgAfD0fYakdKwmN0lv5RymcWpwLBrfx1VJx2OtEiSbIUkaFd8PQuDp1IIDzd9YrQKMBXLH14MOn6uVdfKBqLbZZDaJJgRcgIPfu0AvuOuCr/jyFjaGOZikd4fKlz7Ug72QCeBOdgkWCsM2NFVuoCP23PLGptZLqKwsdossG4TeMDmrmBX+tF7uoXBxxxpyHOasbXXzVLTmCQC9LAzLQVYdCtgisvqFp6GaWYY6DRsLeUkMoGKX+p5u5YO8tCEC5+LZW3k3zquoUMv6VPCHT3Ghw1hlsa5TiImnsxJlJrd4CqNVAyAW3JJutcusN6ZoFNFVHRkBxDHeelk/hCxUCf9fVviPo54kVQ/XV84QhaQqIO92al6e7xga1zcjE7nB24Q8d4XPbzJG3CyMhfomEev5faGUr79WxTMcZFB14Nk9wev6wLVAKlTgx/aHC+OnNPkpPtYVBxlKkyBxBMuXgiSPDtNYRXxsUkDQQ+cdJ3s+dvJnsTuEF4Ws+jh41irp3CIs3DX1B8JDQk7FSkvIogLQBSWXCUKMxfMPI3OuAtIPsidyJudXHp7cS4yQIx52nRKveggmKg1Kpwfb+VZoi9waNSEguAVb7GiAZDt+vsCk3+A0ebPBbFD3isdowAIwANYIN/MnAcQQksxQ6/jUY6hp2EhBSvWGI4mmBuBO1CnM0xsGjpJP68wA9UW7MKGhp2Lb64/MvScvg/b4O7GlG2IVwQ3rf3if/lgBqv+WI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(38100700002)(54906003)(8936002)(8676002)(66556008)(4326008)(6916009)(66946007)(36756003)(66476007)(31696002)(5660300002)(86362001)(2616005)(2906002)(31686004)(6506007)(53546011)(6666004)(4744005)(6512007)(26005)(186003)(6486002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w8LCia/WaVDGboaX1r8XzS2vLi0SBsIFdzK500k9IQxLl4Am6pftoxNZlODW?=
 =?us-ascii?Q?3paM9/FagQuFHzg7VcF9MaYSwqPRRyd4aFH7q0FR4V1OfPMJtiFJGfJiApyQ?=
 =?us-ascii?Q?LZaWI5Ts5qbJ+p01tDTqHfvMLlTh5opScTIfyrtfwF/GEbnKXZ3jafvluAZR?=
 =?us-ascii?Q?lTlLkf/fkm5ZmQYoRwxICWgDsz8P4ykEPndx7zB23M49pgsSNjqV7zb3/EL+?=
 =?us-ascii?Q?RyGu+YyvstvTelIYgKvUpYHFufiW9EkF4ClIlygF/vd3ZeqtE6etACFrWbdN?=
 =?us-ascii?Q?p7P2b/UnuoqHIWUZwkI9mWiH2z8uJ/vmrWATisAEzXiVeGjX91ehdsHekCrB?=
 =?us-ascii?Q?uioN3QrnkJImMEs34ab7cmG/s/EMWZqcsJV97Llz3Zy9gDUfRjHfO6mLFPPS?=
 =?us-ascii?Q?gC3Nc/FWJJoU84jEEbzrh95rqpZ5N9L/tzAI1hqrZf2HLVDl0miFh/xTcEUT?=
 =?us-ascii?Q?8OOikeuLhTdrLQS5XTybCAEy3u5gqwrFyn5lU4NP+L3761KZ1k04DApoiyFc?=
 =?us-ascii?Q?wUQzy+Zuk7N5Vhq4BEcjgMfZvjvPTfUwIWqSNzIGXBisu5Peypxnb4WSlQrg?=
 =?us-ascii?Q?KmNkxUhQGZXAuWgj7E2BVubedAv5Jl3uXH7ua9GVszUaB34Qh6t5s6EwY43V?=
 =?us-ascii?Q?RAZPyuKyPyflyFsMNtduINLY5chXGOkdcP06kevw1Fv+ziR1UHewaisBTgwc?=
 =?us-ascii?Q?HzwsD2PMqcwV9mTVLMPHeoZ5QOBAOaWvf8x8YurFZ4sZUwCQuW4c7lnx5P0g?=
 =?us-ascii?Q?KCK534EA31R/dJW8TpaO/OM8jOrA+ze1RyWkAQZBWccQCwps9uox1am4kv2b?=
 =?us-ascii?Q?b0BPpScy2CDE2MKP+mF/3xDPgUGKlzj4zfQASHJloVt4GQNsTGcXjk1luRM+?=
 =?us-ascii?Q?4y5cEfse/Gn3LP1q3crB1jyOxd7MYCeSg/XH2JO95Ca3QBp+GgYlvJxtH8Cj?=
 =?us-ascii?Q?f87+baxU1xUrZ4swnI+jjZYA1ys/qspUUofi5c/HaM2boJqsZbWzvc+zOVjQ?=
 =?us-ascii?Q?HYD3uDw67lgrtPTE2mp6S6kC/dqDpyI27unUzqreyi8HNQBk/A6lPnkkivg6?=
 =?us-ascii?Q?kkTNddEqgIQl/MoPgHS+ZYyKOZybCUOO/sVd7ZwtEHF4F8/8ueCZhfSbvXeJ?=
 =?us-ascii?Q?J1CHC1HNBbnQ4CwwpYWNxH2js2brHTaoEt3FtRTB9Crs1mCEnFkdnfuNBfJe?=
 =?us-ascii?Q?+45wnq6bfmWAgaZoJ51t5072/Im+9NF+XOleUM7XZQscxygLUQJrWmSW+ltj?=
 =?us-ascii?Q?h/uzV91iEhMBtSBvPC8yqUgFF8B4l8+FAvNFuauhQpYk/pJV4k4qFdW5vcaa?=
 =?us-ascii?Q?o4na5py0dQrKJ2BaQhpZXS5M9W8eM4p5YMtrKdZhTSk3mXuI6bsJ/8DGtNlD?=
 =?us-ascii?Q?SCl+5NPBcjFrhSr8+VqB1XhMKlXRpWhMets8yaL44rrrq8ssagSo9prJly5G?=
 =?us-ascii?Q?qAulWwlGyzaTVMRUw1ifMhS0HxMItHQXhIEpKrivn6kynL3WrcIucKklvVyr?=
 =?us-ascii?Q?v0e8yhFdv2tC2f4KrYbAfQyVFFyJwGb5OPVjfcOGVUKa8u9LUhkaHuw+a8xx?=
 =?us-ascii?Q?WlLOcSGr98Lw22m5RHGZ7O/BP7ULRmKjFMfiKKLY0FoiJd6CxeLyQQjGocIO?=
 =?us-ascii?Q?Mg/xIePSMMofy1muYNSD2uQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9354aa72-77b7-43d5-e8bb-08d9e64ee477
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 13:21:16.6724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8HLBpt5DVKT/DL70OJxmQBQzBb+DkQkWwoIyMqdjCSRkWA50fDfMDBLjG8yiyPPMV6ENeW7ojE94btzqK/ys6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3368

On 02.02.2022 13:13, Roger Pau Monn=C3=A9 wrote:
> On Wed, Feb 02, 2022 at 10:42:22AM +0100, Jan Beulich wrote:
>> On 01.02.2022 13:45, Roger Pau Monne wrote:
>>> --- a/xen/include/xen/mm.h
>>> +++ b/xen/include/xen/mm.h
>>> @@ -554,6 +554,8 @@ int __must_check steal_page(struct domain *d, struc=
t page_info *page,
>>>  int page_is_ram_type(unsigned long mfn, unsigned long mem_type);
>>>  /* Returns the page type(s). */
>>>  unsigned int page_get_ram_type(mfn_t mfn);
>>> +/* Check if a range falls into a hole in the memory map. */
>>> +bool is_memory_hole(paddr_t start, uint64_t size);
>>
>> While resolving to the same type, these now also want to be
>> "unsigned long".
>=20
> Doh, yes, sorry. Will convert them to mfn_t if we agree on that.

As said in reply to Julien - I don't mind the change, but in this
particular case I also don't view it as strictly necessary / useful.

Jan


