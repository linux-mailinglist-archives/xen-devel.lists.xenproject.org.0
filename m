Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD42B408560
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 09:29:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185482.334163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPgOV-0000kq-0P; Mon, 13 Sep 2021 07:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185482.334163; Mon, 13 Sep 2021 07:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPgOU-0000ih-TK; Mon, 13 Sep 2021 07:28:46 +0000
Received: by outflank-mailman (input) for mailman id 185482;
 Mon, 13 Sep 2021 07:28:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mPgOT-0000ib-Lg
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 07:28:45 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96ddebae-61a9-480d-a630-699c6f515f38;
 Mon, 13 Sep 2021 07:28:44 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-EFU8yxbEMSi1f0NA_H9_Wg-1; Mon, 13 Sep 2021 09:28:42 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5599.eurprd04.prod.outlook.com (2603:10a6:803:de::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Mon, 13 Sep
 2021 07:28:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 07:28:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR01CA0102.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Mon, 13 Sep 2021 07:28:40 +0000
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
X-Inumbo-ID: 96ddebae-61a9-480d-a630-699c6f515f38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631518123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hwD0t7QtOjKdwm4YKCqr7HJsRnUZs/jS/v3G2iEWAa8=;
	b=UOSwvnFtCQpvKiQf+q4PRphDdsxizTls0/lrDLUpLqgKjadi/o+E0SQFXnBYwQt9CcoiZr
	/FsnNhNPZ8WnXq4bLhN2ENfqCucL7gQ2Zpp7zeC2A5BjifsyoiMfJTuMwp5poxU8j/u0F0
	MReNolaf+6GdH//QlfgTD4UMRJsHiNo=
X-MC-Unique: EFU8yxbEMSi1f0NA_H9_Wg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HetmQA6G6KQc0Ars8sFJcEgeKzVb+mUw4CCId6XhJzXN4XWw3LyXFEGzISJoIPM3yG7Fz8mPRmA5RAziqWKKtYWMK6z3czxj+5PNJ0bxax+3yDorLrhNETR9oh/ITNgolQuXxgemKrfabs7jeC99f4VJjwATHSHYY1KBXpcfmgYD0tqrXAGD+rwGioNnIgy3QgTU4ir87LDovPLVsG4d1wc3tBWSkR5FDyCOWzmZaU2DY/lHDyWRGCX1lRGIP/RC+AJZkc0PGKxPb7bU9k/QZUI3ERFOi/phZt5LBjTG7DOBc0TaHqovNxuV8dPLBhCveRMnPRY9gV/7M868B6Hr+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=hwD0t7QtOjKdwm4YKCqr7HJsRnUZs/jS/v3G2iEWAa8=;
 b=OtQ9DRXvc5RNt1cf3iwJUrakR6XcLKtgHOR5bDSDkmid+QylMRZ+CE/lhH0YR+uMAYQKUqo2fGYEfZKsVzyVxCVrpwFoka9X8iMWowSIPtU4rcG94R9+kNFMkyRukOwDxIjX2gwijmxsI5OzK3ihnxPHcAw0IzivkXHwySs6D0y46dwkNIryxeDuDNjSdF4zvZDYnEFbivDcdxB10X5JoI7vW4VTKg5oVyEhqXecqhdfUGItKXlbUDhHxvLnohCH9hAPl1oBJu0V/7i4IPr5AfNgrjl1G4fXDQi0HhJ52LSOzoRf4FBoWJNsUGyXku08AaMKW3oFV6IxsEhiWh4hjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 12/12] swiotlb-xen: this is PV-only on x86
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Christoph Hellwig <hch@infradead.org>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
 <004feaef-f3bb-e4bb-fb10-f205a9f69f28@suse.com>
 <YThiyxG0d2tmCtb+@infradead.org>
 <alpine.DEB.2.21.2109101636470.10523@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <543b446b-0143-ad32-99ed-d7a6f79381e8@suse.com>
Date: Mon, 13 Sep 2021 09:28:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2109101636470.10523@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0102.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::43) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a77e551-9d0a-4196-c346-08d976881c14
X-MS-TrafficTypeDiagnostic: VI1PR04MB5599:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB55994C37912100451071B49DB3D99@VI1PR04MB5599.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	06ci2HYkNPNKQake3kequ1jcFFCnILJfHXoHuBTf+qVOu6eE46Iaz4Szw9KZwOZM12VQbsAPAFKdwTNymu4pn7q8S9el7HdpMKwJjABSv3sku9iCALROdg1r6ryI4ocBDbqN2UhdIAUyEJfgow3DtisPvrVyFlNos7RpGscsqn+aPzzvfHSlZQwc8QRbmduQJoWKWXnd5DVEb5wnNXya8yLdHOUkxQSBMajhjZwe3/pshjDnN6WFv0zcvHbeaIRe1GXUM9BFAfA0w6b1/tNLi4Qe7AIZk29fZzOfPmvgAe5tagb99qg5UYs2/no7vWCLVTlvhcQUIvACPUkGRkAa0c7aWdzpXrEnr2+QgKHgxI1SewdN+tq23UPuaJ1WZv1ZdSUqlz5M4MWnuCTlBB2+bNDaKH7UMsYMbasgC3TipqmQDDJlMQ4R2RAJiPqGRHgXK6j5jguYcIdgNP2PWGSnIJ8FMZ8KJYXbPf4pbPeLqDPwIVGg8ZLzy4igIUR5zpT1LT03ZTbmN0YISaem+xZ0m/a/cK0LG90dyYgYCx4QJxUx3kMAQ7pzupi1sPsZwiJh6RfMwsJN4qE/yvNJgd0VD35f67M3vXZMzstag7YhL6/y0AjANDkXj8RJ+x+v37M8B0HAPsbGDnxJRc8Hrla6dcQR0OnRmXEeUdGLwmFbDrZBQWXlgDFY4DKylviIpVICVvfygdk48uYxEXxPwe5jnQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(346002)(376002)(366004)(396003)(66946007)(66476007)(66556008)(5660300002)(86362001)(38100700002)(2906002)(36756003)(31696002)(8676002)(4326008)(83380400001)(2616005)(53546011)(8936002)(16576012)(478600001)(6486002)(956004)(54906003)(31686004)(316002)(186003)(6916009)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVhDY1JTaVowYnBCM2I3QVMxTnRGZFhrbzByMFBPQUkrWFZ1U0d3bUhTR2VO?=
 =?utf-8?B?bU5XRWg5NHRDam1aWlkyek9uOGtQTUdLK2hhSnVIQWlTVkJOb09GM0dDZXRx?=
 =?utf-8?B?RkxEd3RZVTY2ME43UFpleGQyRzBBSUNhSEdZMkFIZzlqbFZUVDhvTUoxdWd1?=
 =?utf-8?B?SmRkTmdIR0xmS1dQQnlNazJSTU5aVFA5VzdNRUMrc2s2dXRzbGV5V2ZmWXZy?=
 =?utf-8?B?RmU5VHpHWmdvYW1PUVdQem0xSFNRTTdLQk1tT0tTemhpa29aYmZZbGNIbi9n?=
 =?utf-8?B?Y2xWOVVHeXUwTWFsMDA5eTUrSERzKzltQVJRNnJrT2J3TEFjQTlHcmNUQm1F?=
 =?utf-8?B?ZWtZc2lHR0U5b3F6WitNdWVTeVR2NFlOMFhhNFdGN2VRTlAzanlmZzNWZ3o4?=
 =?utf-8?B?RklnMk4weVU3VWhBY3BMck5KdkliNXFKVERBUjRXUW5ZZ3JpMkxlT2kzWnJz?=
 =?utf-8?B?U21wejNOenNYdFRGV0NJVkNYdjNyeGh0YmQ1VUtBQkxaK29sSVpQdlN5eDBk?=
 =?utf-8?B?M2JVbjlHb243SmdtVmY4OHVzM042T2tyZjRuOGNvemlrNXl2a3R1T3lUSDhE?=
 =?utf-8?B?L29SMmZSVHozQ3dyemlQNzlscm1tYlpLWGdMWEM2bnJtbWV1S2NpT1NGYUdK?=
 =?utf-8?B?Y0JRanloOG9DTTJYTys2OWFmeGtxWFBBeGFlRk1kL2h2SWJoOU1NU2MxZi8r?=
 =?utf-8?B?ejd0RGh2SUtaTjJoRnhST1dCWEJDdzMwanVjTGhlenh4S01QcnFKSzZDTk1C?=
 =?utf-8?B?ZERRZ2tITnpiWDFETG9qVFgrQ1dSTy9WYjJ2cWRJWGd3eksrclRmOVNYRlo0?=
 =?utf-8?B?aHluVzJOeHNQQ2h4cSs3YXAyL2xQUDBncGNueGZ0NnByZ1lNNkNySmR3aXpn?=
 =?utf-8?B?SnNTTThMS1pjSmNqK0Y4dmRMZUhSU2xQV1ZMSUg4WEtxQ2FscWZpV2J3Ykow?=
 =?utf-8?B?Mi82c0ZER2QzdmY0c0p0VlZVS1pqaGkwSDBpdHZtOVNWMTRUVHI4TVA0VkUx?=
 =?utf-8?B?eWVLcW43eDRDS2x6RUhEQjM5YVZHM2MvcTFnWDVJVXMwaXNraXlYYUUwekYx?=
 =?utf-8?B?T0VWeW1HWTJUTXJ2Q3ljTTV6RkJLNXlOaEVGK1daYTJodkZyeVY2QUtIYkV6?=
 =?utf-8?B?d0E5UkdLR3l5QVRHZnRpN1ZCM0JGaDQ3elJPTy9hNVo1MUxzT3UvU0Z5Ullq?=
 =?utf-8?B?a0NWU25sRHF1NGYxZkN4cldoUzdGTHFBeDR5YTFQZERIRVBldHNLcEdFWHlX?=
 =?utf-8?B?VE1uS3dJQUJjU1AxT0RxUjMwdFRVMHdZeXdMRnpKTktyQVJ2NXJZekJCMS9T?=
 =?utf-8?B?RTZwKyt2dm9MSEJLRkJxdHhtYjN1a0JnTEFaZFMxMkIySVBOZGJnYWJzdjMy?=
 =?utf-8?B?OUY5SERhR1RKVjIwelAvdFJyc1owN01yYUttNm85S2NlbGJ4blY0b0FEMFhZ?=
 =?utf-8?B?NnNzTFF2WkE3SUNHa1RWNFV1TC95N0pYOGdrOHVBTnVWWHZESkFhMFVjdjBQ?=
 =?utf-8?B?ajZxdWZCWTE0ekZtUDVUV2pTY1NEa2tGL09ja2QzK29OS0V6YWpqem0vWlVL?=
 =?utf-8?B?dWIrZU1VK2owZ0ZLSmVSMnhFRjhPNkV2NmVzU2dvU05xZEhTTHdUUzRQWW84?=
 =?utf-8?B?SDB0bnVBZUJoN3I2cHBLVHRCSmVFUnl2RnBjdy9JcEZmaUtYU0k4VXlGZ2dT?=
 =?utf-8?B?aitGUFFpci9sbGtSLzArNmVQZ3Q4eE8rVFRoVGxkZWJ0WUNMSzFDNXNTTnda?=
 =?utf-8?Q?g1NDQ/KngzTxu7Qd0+JQk6MpH2NCKMRhohC37RI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a77e551-9d0a-4196-c346-08d976881c14
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 07:28:40.9527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qNLKJHn3NU9hMMJ4NQW5/dX7cJzl339+gCX5Y3XuF/IUJSmWkfmGVXJwh9rkBsHQaEvVayZq2cv4uMOz+6Cosg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5599

On 11.09.2021 01:48, Stefano Stabellini wrote:
> On Wed, 8 Sep 2021, Christoph Hellwig wrote:
>> On Tue, Sep 07, 2021 at 02:13:21PM +0200, Jan Beulich wrote:
>>> The code is unreachable for HVM or PVH, and it also makes little sense
>>> in auto-translated environments. On Arm, with
>>> xen_{create,destroy}_contiguous_region() both being stubs, I have a hard
>>> time seeing what good the Xen specific variant does - the generic one
>>> ought to be fine for all purposes there. Still Arm code explicitly
>>> references symbols here, so the code will continue to be included there.
>>
>> Can the Xen/arm folks look into that?  Getting ARM out of using
>> swiotlb-xen would be a huge step forward cleaning up some DMA APIs.
> 
> On ARM swiotlb-xen is used for a different purpose compared to x86.
> 
> Many ARM SoCs still don't have an IOMMU covering all DMA-mastering
> devices (e.g. Raspberry Pi 4). As a consequence we map Dom0 1:1 (guest
> physical == physical address).
> 
> Now if it was just for Dom0, thanks to the 1:1 mapping, we wouldn't need
> swiotlb-xen. But when we start using PV drivers to share the network or
> disk between Dom0 and DomU we are going to get DomU pages mapped in
> Dom0, we call them "foreign pages".  They are not mapped 1:1. It can
> happen that one of these foreign pages are used for DMA operations
> (e.g. related to the NIC). swiotlb-xen is used to detect these
> situations and translate the guest physical address to physical address
> of foreign pages appropriately.

Hmm, you say "translate", which isn't my understanding of swiotlb's
purpose. As per my understanding swiotlb instead double buffers data
such that is becomes accessible, or suitably arranges underlying
machine addresses. The latter part is clearly a PV-only thing, unused
by Arm as can be seen by there not being any use of XENMEM_exchange.
So it must be the former part that you're talking about, but that's
also the purpose of the non-Xen swiotlb code. If only for my own
education and understanding, could you point me at the difference
between swiotlb-xen and generic swiotlb which addresses this specific
aspect of Arm behavior?

Jan


