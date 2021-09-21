Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC0241315D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 12:12:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191632.341722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mScl4-0005AM-1M; Tue, 21 Sep 2021 10:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191632.341722; Tue, 21 Sep 2021 10:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mScl3-00057R-U5; Tue, 21 Sep 2021 10:12:13 +0000
Received: by outflank-mailman (input) for mailman id 191632;
 Tue, 21 Sep 2021 10:12:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mScl2-00057L-C2
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 10:12:12 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0f3ddb2-772b-4c25-a6c6-295969fbe774;
 Tue, 21 Sep 2021 10:12:11 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-F5YSqCGxO4qaff2PcV_6WQ-1; Tue, 21 Sep 2021 12:12:09 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6672.eurprd04.prod.outlook.com (2603:10a6:803:127::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 21 Sep
 2021 10:12:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 10:12:07 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR04CA0087.eurprd04.prod.outlook.com (2603:10a6:208:be::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Tue, 21 Sep 2021 10:12:07 +0000
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
X-Inumbo-ID: a0f3ddb2-772b-4c25-a6c6-295969fbe774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632219130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=egNgv28QnKne2cGoa+8aA2c2WhtsIi7/yf9Crdily68=;
	b=NRJklLgFbD57jJqboxXKXkj9q72ThgnDK+codHxZEhtMTrrbjG21jIQg/r2L0ebWjzcpcP
	/yAr6n3oVm6MIy1vmXT3Hnh5GcBlJT6+c59xWrwi5yr+140MxMSMW34l9tOd8DQ0rRG7uJ
	NRHi1PT5WJ01bRetZ0/HG5UzTUmHI/0=
X-MC-Unique: F5YSqCGxO4qaff2PcV_6WQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrdM/TiPbB/PyQkrpF9hDDzHgJ1RmVGMm2x25t34AtHBN8eEqZFdNEns/YxRVSe9YMs8EafngSeD0Ekk48r9+3rjva2uu1xVYsveY/iArnKIptMMI+IcDASXlaj83cXhxeIRAy67ffJb2g9rYmtW2HlsKbktDW3hgx/6HktMD97Tk0l7R+zzVLYKn6BNhZCyGBrzQTxakvdQMfuVA+B9/BINBaNEyW93oOntRXPW31tMOsJIcLORGzx9LtTN4ForBDuRzCL8xf35ujyJgcwgrw0shkJBvIfOpVsrT0ef61iBIwhj0N1oZ4lJaGcFej521e6Vow55oipzhPO3cLUp6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=6+EB9aYIW2YQDYMOKVNo1MDsa3unHdTbAmMooPXfIzc=;
 b=h/oeeAeN8oiXz2wfgF+O0UypXXGuk27CDVhZVebWwONAqlZAxkanQuyGJKKn+u5NbESzl/wRb+LyxNs4cH6SvN3iOpYjd2T05OyOfh0TDzLHT4lPBDsejQsulVpfW3P2GWtMwZbj96O3rn+h/uyHfR50q1lHzFNV92PYNU1w+htgIWp+4Bfz9EFhnGdeB/69L44BEU70UVkookeMLtHY8uwKlPFAxYMqRJBcNvGlJymigIrE9W7mUC/rOFjVRD4djk2CamzNF7Eh5cXrX9S3ofl4SOjGvbPEquKXyH1TNplnm6iqOlFddoNC6nPkG/aQYiNYw2583g6ZVy7u+pdTCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 1/2] gnttab: remove guest_physmap_remove_page() call from
 gnttab_map_frame()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <4f54456b-e8da-f67f-b6a0-b5ce2cf12cae@suse.com>
 <8b73ff7c-4dd6-ff2e-14b9-088fdce0beb9@suse.com>
 <YUhgdMyTbfL8Hyke@MacBook-Air-de-Roger.local>
 <5c1fd288-2972-d264-d6b0-3c7bc6d67be0@suse.com>
 <YUmYpzhJrBZkSYyd@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ae0fb20c-b7c9-2467-0951-b84b2f647382@suse.com>
Date: Tue, 21 Sep 2021 12:12:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YUmYpzhJrBZkSYyd@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR04CA0087.eurprd04.prod.outlook.com
 (2603:10a6:208:be::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: beb1f084-202c-46a3-b0c5-08d97ce84499
X-MS-TrafficTypeDiagnostic: VE1PR04MB6672:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB66726BBF9C7A7A62B030D46DB3A19@VE1PR04MB6672.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z0pkep8Fly63WcTcexenh6XebL38Sft4kgKqkCYaYQsHfFQrHrwmWZhDsteYTQTylcryNYozb/91tZfi1EH55WbRov+JF7VUz6zhPKAk3jziPp6IaOtEW7EhSemllfmgCSr3NEn/q+vJLgBUa7BXALLAl8Dn7lwyBPS9giICbpFs5r+wVlfqLvF0oIRxVEliS/atYGTaGMP4zh8kIgpWuqHtbhaDiFM97FhK6E9Rj+hzMuxHdLP61f9G0e1FL61sgU332o6xEnYmntE4kAKwHQSTJ4IYDkQHcle9+6zMdmMNcEHhxic/GqmzQl35BKjNfI4s3NztvE6GHB+qe4WpVunD9P5vVNdtR17diohcEpL5tfmwhmh/tfucofb9xTyEgpE1ENKHIeVW8oq9+hG04xHkuN+kQ2dgQhKtbesAWcwOXpy6uIr1rWeZjDwJvUw+DH4jTu4lUa5/XDAduLFIgf0rtTuFZvMeGUWVPYlyWoiFiwCWF3XLbjniFTwZeWp9G2wxWsbekCVU5dKaYrfsllZqF3WXCG23D4iQxP5nWVMRzoFW4H0M89w6Ss6ku9Nqw3gpIW+E7hfIj+pWZi6Uvqt5uKRZu7wLlyE6GwAZ4JJH+ScyJhEu6Dj9K7QCODDUY0zKFt9pOfq1iHuv9uztAkyjW7YluSmJfatRM8owVGNXiqUiHIrYycFWxCJ146Z/fQZvwddR3la8+tEfeIH5sLk1VSLwmZ9ipflhoF0Mo9TS7QbYWSYE8beCGYAwiQcb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(16576012)(31686004)(316002)(54906003)(38100700002)(6486002)(83380400001)(2906002)(26005)(8936002)(186003)(36756003)(53546011)(4326008)(2616005)(31696002)(956004)(66946007)(86362001)(66476007)(66556008)(508600001)(8676002)(5660300002)(76704002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3M+ZqCprnT7icWea1tzC2MCiKgvbVKtu8wWYFA/gxO4lECx6kEa0fYBX3Hah?=
 =?us-ascii?Q?CPCQsdyUOVOP8+mAPsadh76AYjU4+lR15iuIPeRdBrECaULbZn9vSiom9HWs?=
 =?us-ascii?Q?lyKGpq37HdaMZh4ocwkK6cgz0WcBGgihSu0IpZAKoGJ/IXJV5Y0yBdRoaH4k?=
 =?us-ascii?Q?0dx9LLI6PorDf3+F4JoBZTK9WB36pA9OyDETqaJsGqTb/xN73OWFx5QX/aNx?=
 =?us-ascii?Q?UfjsAyjxfKchN4artgSSosHzaIpuS0hhizmbbU1igpdFaWZLd6RKOluS8MOE?=
 =?us-ascii?Q?jkM0dsgDej/+EG/hDOZ5A9oxSWaYOzdoWqNdKuRnTymGD+g26Ru7+kw0cqpR?=
 =?us-ascii?Q?wseU4JgtltoEL3IFm2x5j1NlRUWvEX6rUI4u24zdC3K6MN3xodWu47UwaTA5?=
 =?us-ascii?Q?wM7wAZea5ICIG3ImU79jd2Sn8Ds34PPOVkLwTkWhMuq5dBTHryamtC9qjsKg?=
 =?us-ascii?Q?AnUw6fZoMjy3Sctg8X1h4iDaTeVo2srIrKvg0LkYWp1JLQmta+21m9Ln2gw2?=
 =?us-ascii?Q?9d3u8Tl1ib769PqbQ1qjiDk1zeft5FPFCZIjMuJpXUthUH2nURvDIEeSKc0e?=
 =?us-ascii?Q?+RYNvBziibjjcLpdFzfKThSMyL0H7K/k1I3QqkteAQJ7SRhXurioAubzHJAy?=
 =?us-ascii?Q?85UDyoUoJ+qk4WE5JsIdW5ey8U/cQcBgCMbDXdjA2V0sXYclTy+YoceNUJ9a?=
 =?us-ascii?Q?XiBpk91/DQ9LxjfFbngNgstiM4wYB1slK1aYKgucEj5TQpKomkBnoSCNZoby?=
 =?us-ascii?Q?cwq5vBX1gWrMPVo+sf+RbKDa/K2M72hSzl9efvx+/oD5gmOGqBG1svC1uzLW?=
 =?us-ascii?Q?O/QQj+jrUhZbaOz5InSyuooLOJc5ahuNCQ3PvnJ79fYj8NlBoyCq95+UYXyY?=
 =?us-ascii?Q?szGMyJmzWtkUMdWz/5F29VWUeOaUIkbN4VyVNUx+sPXAxQ/gihTpDTimiWzt?=
 =?us-ascii?Q?yr0y9UMJ9r3qzSteULeUMs2caK4iQY7iAU+cj6aZIttVOwIsSqwH4W4aOR4q?=
 =?us-ascii?Q?IBm5Vtm8bDUZsG2wv5wuTNB7D0EggrYBkvaKryWqHEt/QreXTCrUMAGjtMAM?=
 =?us-ascii?Q?NnyxGbLEi3m3o02uHu6fVDmbMrIlUqueo2WlssL8wJZ0imf5x9Nl+DZXiDyF?=
 =?us-ascii?Q?ADvd1IoHhdu4X0aICpWKWU41DBw7QaaspK2XOxn2jqpG8K+J2U52f7kdAmJG?=
 =?us-ascii?Q?AUYinc8vjIg7XaeOYgH5AamzUqbo9XYONl4Z/wbrv2e/QBMLCmPshqThGzui?=
 =?us-ascii?Q?x0+A8/TlcgGWMVMCYzBMmCbX7bvYbrxaZZbh9fEhur59nIUo5FiYI5je+QwH?=
 =?us-ascii?Q?L4e5l1AXWdF/RLDWrWPdn9u9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beb1f084-202c-46a3-b0c5-08d97ce84499
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 10:12:07.5935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: noqSlIsyOyXxXVL/Nmhp+u+j/afLyLOCZ37mdiWVB/UoYCLDFIvHAhXOfyDqzeXZjfrlq3jajs869AIJDLGkxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6672

On 21.09.2021 10:32, Roger Pau Monn=C3=A9 wrote:
> On Mon, Sep 20, 2021 at 05:27:17PM +0200, Jan Beulich wrote:
>> On 20.09.2021 12:20, Roger Pau Monn=C3=A9 wrote:
>>> On Mon, Sep 13, 2021 at 08:41:47AM +0200, Jan Beulich wrote:
>>>> --- a/xen/include/asm-arm/grant_table.h
>>>> +++ b/xen/include/asm-arm/grant_table.h
>>>> +        if ( gfn_eq(ogfn, INVALID_GFN) || gfn_eq(ogfn, gfn) ||       =
    \
>>>
>>> I'm slightly confused by this checks, don't you need to check for
>>> gfn_eq(gfn, INVALID_GFN) (not ogfn) in order to call
>>> guest_physmap_remove_page?
>>
>> Why? It's ogfn which gets passed to the function. And it indeed is the
>> prior GFN's mapping that we want to remove here.
>>
>>> Or assuming that ogfn is not invalid can be used to imply a removal?
>>
>> That implication can be (and on x86 is) used for the incoming argument,
>> i.e. "gfn". I don't think "ogfn" can serve this purpose.
>=20
> I guess I'm confused due to the ogfn checks done on the Arm side that
> are not performed on x86. So on Arm you always need to explicitly
> unhook the previous GFN before attempting to setup a new mapping,
> while on x86 you only need to do this when it's a removal in order to
> clear the entry?

The difference isn't with guest_physmap_add_entry() (both x86 and
Arm only insert a new mapping there), but with
xenmem_add_to_physmap_one(): Arm's variant doesn't care about prior
mappings. And gnttab_map_frame() gets called only from there. This
is effectively what the first paragraph of the description is about.

> So you are effectively only removing the call to
> guest_physmap_remove_page in gnttab_map_frame for x86, because Arm
> will still perform it in gnttab_set_frame_gfn.

Yes.

> This seems like a limitation of Arm's guest_physmap_add_entry.

As per above I'm viewing this as a limitation of Arm's
xenmem_add_to_physmap_one().

Jan


