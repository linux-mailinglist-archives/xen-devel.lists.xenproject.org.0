Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D688A5110BC
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 07:57:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314371.532406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njafX-0005Ed-Hb; Wed, 27 Apr 2022 05:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314371.532406; Wed, 27 Apr 2022 05:56:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njafX-0005BC-Dc; Wed, 27 Apr 2022 05:56:55 +0000
Received: by outflank-mailman (input) for mailman id 314371;
 Wed, 27 Apr 2022 05:56:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njafW-0005B1-9d
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 05:56:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5f7478a-c5ee-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 07:56:52 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-KNQ6w1caPxe_bYjBX7VWLw-1; Wed, 27 Apr 2022 07:56:51 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB4341.eurprd04.prod.outlook.com (2603:10a6:209:50::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Wed, 27 Apr
 2022 05:56:49 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 05:56:49 +0000
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
X-Inumbo-ID: d5f7478a-c5ee-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651039012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vsAd/H91RmiB2xGqRw7rgCXE2zQSxc0KH/3Ia5JCkmI=;
	b=YwDOe5JfJp4Z+l/VGhPt09A1fIjHhd/BkGV2Iq/yELIRTNkx/AVjIgCm4r5JvE3Qc9dCqZ
	ShFHsM6bvnRahv4LUzuMGj6QvmnQ2lcAEjTCv/czIvW4BUo/hHjVCexv4GQ3MCFM/1bNuJ
	gCLYLGrxaoBnO3aXEZbkgg+c0PfPiIY=
X-MC-Unique: KNQ6w1caPxe_bYjBX7VWLw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hN+6demHQXGVCtRByGAxn9EuXC4cu8beqrw3u2ek0BjpeTeWlU78dTgiDpMFHo64T84UqYPMxv0P8idb+vQaGtj6HUOaktMDUHo12IcxpVoVCl3e1fwciEn/FdbK/i38BPNJkihf3fduppSdyEtSi9VJcyQ5Fd/URmM01BUtejDbeW8Ty44eNrttP3Yz3AyLtZ+8pLKTRFmJ8mzUs0vyVfg8+bBez93gtkFV7FJ2bIw30a8YYwEtNUuoU6405B5mCz6lDYjxBTEBLXEZOfOOUmZMiI8b14jZZBmIAVT0nnc3argUWT+vyxT9fMdQ7eX7h0+1dE9LsEs+eWA72ZmUug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbKitOelmPXblbKTvzwSDY3ph0VV9YlpwIwvC8edFjc=;
 b=YUUMf6brsnIMHjWQbGofCQmbOazHZr7EnA64hRG4NiclWBa07YUStsQ6Z+fVbnRw8LjdaOGQAsflN/WGTsDYPnHuM8iQ23vqqNsvcjbcdt0DGHtsZVTrgApfjiPkX2zHidwANfZ+ogEnovuXFdK0d/zf+0SFKHoxrc+/5SIjQBQrsTZyZcztZpvdy5zQ1N9cqbrA9n6RV8nV1OnENmHvu1O2fHP9UbPjJcgtQ/+Z/rE3Nx+STbWMwa7nnOVwd2yxW/isUBgQNfrxpFgihOo89NJB14SOz9u6oYUCATcC3Y3FbEI6sgNKJ9AErWzwPNHABJvYYqQzGjXgJktkRtZqzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cb36bf58-4c24-7f2e-ba26-980359ad06eb@suse.com>
Date: Wed, 27 Apr 2022 07:56:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 05/10] xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON
 for phys_to_nid
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220418090735.3940393-1-wei.chen@arm.com>
 <20220418090735.3940393-6-wei.chen@arm.com>
 <6d666aa4-c0d3-b8ed-9fca-e9d2179564d3@suse.com>
 <7d7fc887-20a3-49c3-0754-3bca3442ccce@arm.com>
 <79e3fc8d-7064-e981-b90c-d0f7fa0aafae@suse.com>
 <PAXPR08MB74209F0F6F0B189FA10D04FA9EFA9@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB74209F0F6F0B189FA10D04FA9EFA9@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0098.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::13) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2019b174-b7e2-4484-24bb-08da2812b888
X-MS-TrafficTypeDiagnostic: AM6PR04MB4341:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4341DC1FF45C93828B56970FB3FA9@AM6PR04MB4341.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iEdIAYKFn7lqokt8xlpZVC5hy5WiaCjMBq0FJOW9n4C7u/16Iad9nAzrYZXSmxyIr9XdHFecuYwo1+U1eXnnUec1L87qUS9Pob9N0biKJJl+6bv+YisiLIdz7HrY2rW3kcaiJzfOMrgmexHVrw319ULTPFt3nzG+A5hwSyVigweKbZWt5dsBQeA2Io7+lMKejKVMDJwVUFGDKzYs299LxLacpO2TCw238dUR09BjH3LSF6F1Pv5qUxYY9/F/Nttvf4l1mpwCcqU324wiVeQ8rIKxiCPUBbr1DK1COp4Z7RXXY9HRsOBDTB3VKpX3UnLyVp6oAFZe1joTU4BS2yI6aB0fDX9AMzypKdMKZTCFFfubG9uq7JhMs2nIIHfUmk0wlBRnOhJYM6/p686ZeFHFzZRimQVV+JxFGf2oQmxM/6AsSaKM7V7TVXNi2K+/wUjEzW2yeN9+suB1V0wr+exqAG/cjxYzSKy1UPnPsVXbntBCs5qYh8+zDIxheu7cJle1ClhYy6lhQk+BM9nOrfzzm5pQSg3/r1eC89iWsZz7uSywtvOcvfo12vwcAlbOl55BnuAK2vpSqqPwxidsthNW/+HvfdBRwo6ppcxln4Q0uCeC3Bv/TmTxrSWQ8Ip39MHGwSbc8FOxqFoMmNQtpOMtMlAxJ/TEapiTmti60Z+DNksUiRtBq4dAuW5C3zRHwF964N/XmsFVU4XRleAGZJANEanZQlUUXANG+Dr/GaLxr+bEzri/4otJ9g9z+AhBLwfO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(31696002)(54906003)(66556008)(8676002)(6512007)(66946007)(26005)(66476007)(4326008)(2616005)(316002)(6486002)(6506007)(186003)(86362001)(53546011)(508600001)(38100700002)(83380400001)(2906002)(8936002)(5660300002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bvt2Ya+TM1gA6ZEOJAgn4SWeEUuvL4WltIgSV6xll8Q456DoCbN7m/Vv6Nl7?=
 =?us-ascii?Q?sLQ33CcencCO1bCZVNZj85B5A4PQDNQGTwe+yraK3MC8vLqv+/0QcE4b/noY?=
 =?us-ascii?Q?MwQ4JnKy9X7llD4tMhNM3IAmCMTynoNJdz2VSxDZhLSjH0VmMmKPdZXC9nsW?=
 =?us-ascii?Q?fuc+dpP0UO5PN40fZFIA/6wy6BBvm0ihAxZC2TGxqe+3CghpiFU22h6itmkz?=
 =?us-ascii?Q?/g6eKh6JAQfn+7LBLe96StOAxFskj/86F48+M6EGGkgh3F8A1NrYwaNJkgTb?=
 =?us-ascii?Q?wnMdQ8DCQ7CcaAidLixah+nKU5icODN8WtJVG1/REqlpdLrtvtrMdmhyg8jq?=
 =?us-ascii?Q?fyGNobQgn6F/8mrk0/lzwt2cDMCzSU/AKuM7lYtfHd7r5lyA6CjJXMgG09Xv?=
 =?us-ascii?Q?tk83hY0KfpDcADwWvifRfT8zODZSgBXV66Fb3T88u5csGfv1WUKToV4gyT6p?=
 =?us-ascii?Q?kNnUTFLSTRny6i9x/7KW8yJjfWk4DpkY3oba+4qHMck83l9wbmXNXqo1E7Jz?=
 =?us-ascii?Q?XVnhd8JxjyxgwJWUnj6YwN/kskg1+wJao73iMts3nTj49P+CxJuDBRpDY79B?=
 =?us-ascii?Q?gpnNYRRsMUxlsQu4K3sagTfZTkR/TDHB41cwkb2WJWDffd7J3iOEAQl3p+uc?=
 =?us-ascii?Q?HMkCO/ZF/kh6csNV/kmKwkV/saDMJbvINuMAea40kkciinWmlS51c/fNa3LY?=
 =?us-ascii?Q?5P3BFgOjVR7GQCuDCcV8j1CyCWruOCdxhXNNUdVPvd/XjBj0Sl3XU2L347Ni?=
 =?us-ascii?Q?cXkB9DxMyTcG4Nm9imfaCUA/Rp8XN9mbd3+QcBzojmFL7wWXlTtLpB73reUv?=
 =?us-ascii?Q?w3+LJ25UCJEGKrP4/UYH5gOmgf9K2OmmxCLC0kiUv9ecd1tN9U7w9B8bheft?=
 =?us-ascii?Q?UrpRwKs9PciBorXBoMgZn+YNE7WdkMxlS7V0tQKZfRhh/JfuH/zDkYqgX6x4?=
 =?us-ascii?Q?1rMI3qjJkY12fZ7/6wxVu9GDb8jl7BHzpNvZPkxOl+uIv1iP/UlZ51kRYHQO?=
 =?us-ascii?Q?D3fZHpnV9R7rg7AfKJkthtp3Vk6kJylcUsahQXmMfOCP+/VSoU9OcOOowozQ?=
 =?us-ascii?Q?QMz9Vg8WocWOgGItKC3G8nHzxBwBYPFKEiymPSoRXLz+LeOO96GvWkU38hSf?=
 =?us-ascii?Q?/Bx85CM31y+iPrD+pSFUuMMW0KDmTWBJcBU4LELjzp/Yd0oCLSja0tQdD3oD?=
 =?us-ascii?Q?2l3V4OXBrBEWfUrZfG2lk4Xu0tU1RcdfoPgUTxHN7ljzLESF/1C7J3/qyDhb?=
 =?us-ascii?Q?QZfdFBKp0bWB6kQQFTP0x3lJqKo7fUJZakxecHo7ZVUUw6uBnvvmbgHPQG07?=
 =?us-ascii?Q?qd6d2MePe/hnmP5r4ijvAEUQP+LGtiWIMD+NbasNqlBldybBW+4l7G+n3S/v?=
 =?us-ascii?Q?fIvDmoujmQyRYRnXp5TqpJl2r9MOjVmAASpHrIs2s8BxO9CW32rQ3rQeC1dI?=
 =?us-ascii?Q?fyFOwf9Gv8WW5vJZ0w/boV50SFLNth9dA+Z427mAAPPL9Ln8fiM9hybM4uru?=
 =?us-ascii?Q?7y4CkWXo9sx/A1YEQObHbdflZcTgPnbgjZ9kMpznjIO5l/pOUmu9sItPyTVJ?=
 =?us-ascii?Q?N3Km+qo4WHMGQMvjmhaXGhmcZHb+przgloryMzbR7FRsNiN2yoHzvamRkdoF?=
 =?us-ascii?Q?PAKXIFKPHXBglczBirdEUKPWpeP/9vqthPNYjsJqNzYKAQJV1gV1KDCXUovc?=
 =?us-ascii?Q?LtFJBfh1npK5+cKc0YN9/uNzwkv+aJm/jlFZ9wpWEtwidFU6sfMc5fAF2xxs?=
 =?us-ascii?Q?/d1RRmVAYg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2019b174-b7e2-4484-24bb-08da2812b888
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 05:56:49.7892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YjDIBh+hghjsoqRayF2qDcGxlJtFzhceceras3Ggzvotb4jfXwDHbQG8CBBnkvz+AlPPZ4wkjHpgt1RHBnbMIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4341

On 27.04.2022 05:52, Wei Chen wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022=E5=B9=B44=E6=9C=8826=E6=97=A5 22:42
>>
>> On 26.04.2022 12:59, Wei Chen wrote:
>>> On 2022/4/26 17:02, Jan Beulich wrote:
>>>> On 18.04.2022 11:07, Wei Chen wrote:
>>>>> 2. error: wrong type argument to unary exclamation mark.
>>>>>     This is because, the error-checking code contains !node_data[nid]=
.
>>>>>     But node_data is a data structure variable, it's not a pointer.
>>>>>
>>>>> So, in this patch, we use ASSERT instead of VIRTUAL_BUG_ON to
>>>>> enable the two lines of error-checking code. And fix the left
>>>>> compilation errors by replacing !node_data[nid] to
>>>>> !node_data[nid].node_spanned_pages.
>>>>>
>>>>> Because when node_spanned_pages is 0, this node has no memory,
>>>>> numa_scan_node will print warning message for such kind of nodes:
>>>>> "Firmware Bug or mis-configured hardware?".
>>>>
>>>> This warning is bogus - nodes can have only processors. Therefore I'd
>>>> like to ask that you don't use it for justification. And indeed you
>>>
>>> Yes, you're right, node can only has CPUs! I will remove it.
>>>
>>>> don't need to: phys_to_nid() is about translating an address. The
>>>> input address can't be valid if it maps to a node with no memory.
>>>>
>>>
>>> Can I understand your comment:
>>> Any input address is invalid, when node_spanned_pages is zero, because
>>> this node has no memory?
>>
>> It's getting close, but it's not exactly equivalent I think. A node
>> with 0 bytes of memory might (at least in theory) have an entry in
>> memnodemap[]. But finding a node ID for that address would still
>=20
> I have done a quick check in populate_memnodemap:
> 74          spdx =3D paddr_to_pdx(nodes[i].start);
> 75          epdx =3D paddr_to_pdx(nodes[i].end - 1) + 1;
> 76          if ( spdx >=3D epdx )
> 77              continue;
>=20
> It seems that if node has no memory, start =3D=3D end, then this function
> will not populate memnodemap entry for this node.
>=20
>> not mean that at least one byte of memory at that address is present
>> on the given node, because the node covers 0 bytes.
>>
>=20
> And back to this patch, can I just drop the unnecessary justification
> from the commit message?

Well, you'll want to have _some_ justification for that particular
aspect of the patch.

> And for the bogus warning message, can I update it to an INFO level
> message in part#2 series, and just keep:
> printk(KERN_INFO "SRAT: Node %u has no memory!\n", i);
> but remove "BIOS Bug or mis-configured hardware?\n", i); ?

This sounds at least plausible to do.

Jan


