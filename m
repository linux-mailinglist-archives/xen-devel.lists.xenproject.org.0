Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 321D74A9799
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 11:20:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265345.458693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFvhL-0002XM-JR; Fri, 04 Feb 2022 10:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265345.458693; Fri, 04 Feb 2022 10:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFvhL-0002VX-F5; Fri, 04 Feb 2022 10:20:11 +0000
Received: by outflank-mailman (input) for mailman id 265345;
 Fri, 04 Feb 2022 10:20:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gJ0=ST=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFvhK-0002VR-GM
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 10:20:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 077ad7fd-85a4-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 11:20:09 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-QS-joJExM3K01g8TZxL9yw-1; Fri, 04 Feb 2022 11:20:07 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4726.eurprd04.prod.outlook.com (2603:10a6:20b:2::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 10:20:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 10:20:05 +0000
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
X-Inumbo-ID: 077ad7fd-85a4-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643970008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LyeK/RrCqmZMok1OHGy7O2IcgQoItYdzXUZHa2Q8kgI=;
	b=nzvvdgWNfhrq313AmOxV4YI4LBXh4+Uc60OwiHKz3ft8ECSfcTRdC3aqXm5mkqODBQN6Ik
	YNW7e91ue7ax84VeORJ31AwgNDGfW5ePd5UMXU3VVFZ55HppZXVcjeqkMtlcfHm9pmMVP0
	l9WkxUd+iV2nh049BS3YDm5VcinON60=
X-MC-Unique: QS-joJExM3K01g8TZxL9yw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTvb10pyIksaDz4KFoiDIyxgXBrRpSaRE7tTR5trLrCETWIghxcMWan3mNiZWrv1wFQfYiADNtELHGmkq7KsCrr1+wxt2/hkknCfnRz8BBK3VfY2iA6GxzmrP2WisvSQMv2JedmK9dwUlJXYRgrmxsqSkJLYAEwa1dJXnUWkFLKP8lKWJC8u0s4jFsHJgwk7Z6CMQrMNT2i2pUDGWeFZOL8pmq/dm+2NltCOkcOIlPa+5ocvXgKabo3LukcHgPJStjKy4K3gvf6LQ6n5hjBs3Y/J7suy0eq94qlmp9qfDL/xyqYtJATS/BPAsYOK0eS0CMF8BiwgQpPqTaTrSBmCeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7E++ERymDvabIr1oUezzU5LtSIFs2mCG00JeBUwT2v0=;
 b=Os+I7O7gVpnqfUBfFfrm0CvpbneSNZ2pSeMOoiIzY+UhFLJ8oFtg8bVcYu/Fc52VYoi9sXWYIgChLC/GSb0alw9ePlh7RB7Xp6nz9VNvbJzLNKhb6YiK+Dg72rA3PDhFQfrssHp9Uq3nQW5S9xbLg//AhZZUJ9TYnJksnOvy5+b6eDpDDZWPZR61FruZ9diiZBeTFQkTQYUgthx3Vz3VywQ21rs3rQIYUCgHHHEWzgzkjfj9N0ms8lXZ1rq0gPkprulhnO2dXzkd8bCxfVBC4EyRzPhJVWzMthjnd/Oc4ScXfses/hCvoNtUBME+MMrSaFNgBIyHvXFj/6RvN2xFGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7055da7d-42ed-5343-5065-38f338143e16@suse.com>
Date: Fri, 4 Feb 2022 11:20:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] x86/vmsi: add support for extended destination ID in
 address field
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220120152319.7448-1-roger.pau@citrix.com>
 <20220120152319.7448-3-roger.pau@citrix.com>
 <2e96bf2e-a31e-da9b-2f08-adfa0928e5b9@suse.com>
 <YfzwepCoIvJ3cI0v@Air-de-Roger>
 <d4ff7ca4-e728-5f5a-e569-ae42fdf17157@suse.com>
 <Yfz3zLFpA3DWt27m@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yfz3zLFpA3DWt27m@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0101CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::40) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d573ae0-4b15-4cb0-c1c6-08d9e7c7e9ae
X-MS-TrafficTypeDiagnostic: AM6PR04MB4726:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4726CE0713AC70215238881CB3299@AM6PR04MB4726.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vrNTIUQ0FOVNN7nJANeTJ6hNI84kZZ+0NkrzGht5utdmsBvoQBKhUajD/klq8v+0n9BcJVCBSdku4Wl7UjYAa6qhUgRMyWHqSKILOywjT//3/NHaTp+2c5ZhxJ1zU0H0Cw1V4/f+gSY2DXY5LE8uy2hCwaPzXn/l9D1OB/QWfY8UAEMglvpf2eqRrg0Dk9Cr5A1+I2tL18t5zpGz9kKJ87uK0EHDzsbRvTAuYhLASudClK+OHiiesZOk/IpxW3WhKNY2PM7XgD9UpzsTF6BbByWhyM/jwyXLxthywTzdYXK4wFUvbBk3foXjthoE8nLM7GIXcJokXMz8ekhuwwXk2g2jTumxP3PxwcrA4nKARP6j/MmG3cUNQMQ+mnNNSm1pbP6nt5VNb636c+OHOsKToZgECcsViM35545aI5f7DtfXRt3FIdRe1zuWDTX2FbI6tjKBs5Do0d1ocKGO//clqnu8G+8h1OD7Dxz4bJPLGg8fiLScx/LnHcyhFkWj+LyB0Iv9zYDuBEK8lo6gJMg9FwWYS39uDWHeVAGJv9/dAu0vmdy18/xlaq0Z8mUcgC12uT1IE445VIu5U3E+CHvuLeYA78OaYLKlIRiy5ayvehRG4uCU2RPc0n1cdB/xfjGHLhtkVCi3Q9c1N/CAq4h5vymRNqBX2P4WwCKPO0YXXDvBuyUK+YMmByRSukQLHNdW24gJQ1dVLEVM0H1948WeutFObe5orcWbhPvX1KDy8Y4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(2906002)(316002)(36756003)(83380400001)(38100700002)(66556008)(6916009)(6486002)(26005)(5660300002)(8936002)(4326008)(6512007)(6506007)(66946007)(186003)(53546011)(66476007)(508600001)(31696002)(2616005)(54906003)(8676002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ulebB1+LTX/320jh2XulKqMk+Q/PxTTJuangXs22rUZgC+rM4MRxaCfMmDQA?=
 =?us-ascii?Q?mGTP+2HJmjQKaKrNkCkKxRxdzxrhMeXQdaQewaZ5RZKT7SId+EJ9dP0WeLLe?=
 =?us-ascii?Q?821KxSnlI6e7e2oXf+LSvvfM2WSMdnlyj74BWVrLyHt+75uK4+K5jeMx1zAO?=
 =?us-ascii?Q?Dfi3oqryGRXFQ4f6mnR2Bo+7OtqPqZfdsVUcLaJSu/XpImULSghP+1IScbik?=
 =?us-ascii?Q?VrExwZV5OThbi3I+KzYjQAgPLqxOQzVHXCAMSoK5ilbKslQQVz7wjTSpZ8cz?=
 =?us-ascii?Q?UFklDtFob2eMxjdlg/Bo/Je4NvANKEZBcLVy1KgsBTiqRJt1F4Xcev2z79Dq?=
 =?us-ascii?Q?ro2zB6A3kKDdhsIniUgCSuK/bI7A/ru1SMOh883ux3pSC13JrdVIxvsIvyFb?=
 =?us-ascii?Q?i3nVrHTqCWgkuAKXBN0KeuIzQW/7yO/75QGodHSd3bheXlprfl6HCCi0sRLx?=
 =?us-ascii?Q?0lvbXNS+5ismbQmiPWcz8FrVYTYsojFUQLEiTfn7HhUXunLSjsrv2ZKNHFsh?=
 =?us-ascii?Q?RIr1zaJBAOvufkaMHo3l+gWA6eUMgqlfuxuK0j5uFd2XxeMY3kjwKkEb8F56?=
 =?us-ascii?Q?CdFUuJk+Z9roH4qh4kOD2zuxJ1quk3hCPMmy8KwRXiqWSpfd+d2F/hpZeqJE?=
 =?us-ascii?Q?i7tv0m4bxeR0Tr1bHJrhSJT77ZhMEmKHnY+LqS5Le0iwXBjks9H3yi2tdZ0s?=
 =?us-ascii?Q?yV12tkzvk8CKAHc8QstxcjaLqb3LA4l2Mubmci9mxhiIimey6YqLDqLvkfez?=
 =?us-ascii?Q?xj9X6jujjXa60HRe9HmM6ktEsTD2V86uImLXSFs5k7vSqlVtRGaTsBYEeM++?=
 =?us-ascii?Q?AcdHGoqlpldNdEUkTxM4CtKYTF/VDfrUJOu2qu45JtfEFlzXxPWJ59DLjaZp?=
 =?us-ascii?Q?TJHyOcfH6y+aO4WL8QVzrz+v0eEMt0wVcE5A9tnZHC6Ig9QJC6I1ZP5YTFfG?=
 =?us-ascii?Q?JEMgiGzRdddKQDrNJbTl7OeCJd5TKW7YJsD4iNHQ90lnmcz0PAo9X1X9SsS7?=
 =?us-ascii?Q?vVqSXEz9OwRNPGu9dc7r4rwb46osjb4zlQcSU7biPC171PyQ2tQ8QYf6D9SO?=
 =?us-ascii?Q?cuO/gX8jMwBm1y296Vhtnk7JOjfBpNgxe89smUhDsXqA8dG2nrjispARJuJ6?=
 =?us-ascii?Q?DOTD5T3YzkI28pbumFKlZOCsPm7VUUW6dvdLc6CijJZC35Ep71XWNNZWVnBu?=
 =?us-ascii?Q?hCs0k6YMABOzCZOXimOXxL3JfIxXnR1NzrzenYO0ojxPSsRV2nLYY6+UtlQ0?=
 =?us-ascii?Q?AahV/S7fPKiOVeVvQ581dXdusnpQ85CYsu4PmqVXDOHNBEwHfKN39Wj/Fgmr?=
 =?us-ascii?Q?M5xR16WbzMtLpFuXJ3ZDpuw+P6RY/dPtYI+Rgxd/4hlD7fJAUaYvlUTgsD4L?=
 =?us-ascii?Q?v6P0VrFkxjCo9/6cjAqugzJLpUMy3GR/uKVN5myOUShjWB9I/47JIMHTG1fW?=
 =?us-ascii?Q?U+elnqqoBBE1OolUehnSBBxBkH66TVQukr8xwSapqKsist0rYPG1EayIFrNK?=
 =?us-ascii?Q?d4QURfFUw8FHQs6Vc0VIN34CvYHXTTGiNd0ipMVdaxY2e7QWbkRRAq3FI0rm?=
 =?us-ascii?Q?AX7ub1w/wDA42LD5hD5F3d7rFW3p2lESusfYPwz0sz5nplwnGb14zNe0sokJ?=
 =?us-ascii?Q?6mQNDY+xQVyZCfEbVKdyPnI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d573ae0-4b15-4cb0-c1c6-08d9e7c7e9ae
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 10:20:05.5938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lF0FjB3y2ngT0s+8cHhQiZLSP6gKNG+/2mL9RTkPVz9qNtlpFYene7qKfPG5IHulidVDWG7ttg3R9yRCL9RWDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4726

On 04.02.2022 10:54, Roger Pau Monn=C3=A9 wrote:
> On Fri, Feb 04, 2022 at 10:30:54AM +0100, Jan Beulich wrote:
>> On 04.02.2022 10:23, Roger Pau Monn=C3=A9 wrote:
>>> On Mon, Jan 24, 2022 at 02:47:58PM +0100, Jan Beulich wrote:
>>>> On 20.01.2022 16:23, Roger Pau Monne wrote:
>>>>> --- a/xen/arch/x86/include/asm/msi.h
>>>>> +++ b/xen/arch/x86/include/asm/msi.h
>>>>> @@ -54,6 +54,7 @@
>>>>>  #define MSI_ADDR_DEST_ID_SHIFT		12
>>>>>  #define	 MSI_ADDR_DEST_ID_MASK		0x00ff000
>>>>>  #define  MSI_ADDR_DEST_ID(dest)		(((dest) << MSI_ADDR_DEST_ID_SHIFT)=
 & MSI_ADDR_DEST_ID_MASK)
>>>>> +#define	 MSI_ADDR_EXT_DEST_ID_MASK	0x0000fe0
>>>>
>>>> Especially the immediately preceding macro now becomes kind of stale.
>>>
>>> Hm, I'm not so sure about that. We could expand the macro to place the
>>> high bits in dest at bits 11:4 of the resulting address. However that
>>> macro (MSI_ADDR_DEST_ID) is only used by Xen to compose its own
>>> messages, so until we add support for the hypervisor itself to use the
>>> extended destination ID mode there's not much point in modifying the
>>> macro IMO.
>>
>> Well, this is all unhelpful considering the different form of extended
>> ID in Intel's doc. At least by way of a comment things need clarifying
>> and potential pitfalls need pointing out imo.
>=20
> Sure, will add some comments there.
>=20
>>>>> --- a/xen/include/public/domctl.h
>>>>> +++ b/xen/include/public/domctl.h
>>>>> @@ -588,6 +588,7 @@ struct xen_domctl_bind_pt_irq {
>>>>>  #define XEN_DOMCTL_VMSI_X86_DELIV_MASK   0x007000
>>>>>  #define XEN_DOMCTL_VMSI_X86_TRIG_MASK    0x008000
>>>>>  #define XEN_DOMCTL_VMSI_X86_UNMASKED     0x010000
>>>>> +#define XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK 0xfe0000
>>>>
>>>> I'm not convinced it is a good idea to limit the overall destination
>>>> ID width to 15 bits here - at the interface level we could as well
>>>> permit more bits right away; the implementation would reject too high
>>>> a value, of course. Not only with this I further wonder whether the
>>>> field shouldn't be unsplit while extending it. You won't get away
>>>> without bumping XEN_DOMCTL_INTERFACE_VERSION anyway (unless it was
>>>> bumped already for 4.17) since afaics the unused bits of this field
>>>> previously weren't checked for being zero. We could easily have 8
>>>> bits vector, 16 bits flags, and 32 bits destination ID in the struct.
>>>> And there would then still be 8 unused bits (which from now on we
>>>> ought to check for being zero).
>>>
>>> So I've made gflags a 64bit field, used the high 32bits for the
>>> destination ID, and the low ones for flags. I've left gvec as a
>>> separate field in the struct, as I don't want to require a
>>> modification to QEMU, just a rebuild against the updated headers will
>>> be enough.
>>
>> Hmm, wait - if qemu uses this without going through a suitable
>> abstraction in at least libxc, then we cannot _ever_ change this
>> interface: If a rebuild was required, old qemu binaries would
>> stop working with newer Xen. If such a dependency indeed exists,
>> we'll need a prominent warning comment in the public header.
>=20
> Hm, it's bad. The xc_domain_update_msi_irq interface uses a gflags
> parameter that's the gflags parameter of xen_domctl_bind_pt_irq. Which
> is even worse because it's not using the mask definitions from
> domctl.h, but rather a copy of them named XEN_PT_GFLAGS_* that are
> hardcoded in xen_pt_msi.c in QEMU code.
>=20
> So we can likely expand the layout of gflags, but moving fields is not
> an option. I think my original proposal of adding a
> XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK mask is the less bad option until
> we add a new stable interface for device passthrough for QEMU.

Given the observations - yeah, not much of a choice left.

Jan


