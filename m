Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DED33219E3
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 15:13:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88094.165497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEBy0-000091-GP; Mon, 22 Feb 2021 14:13:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88094.165497; Mon, 22 Feb 2021 14:13:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEBy0-00008b-D8; Mon, 22 Feb 2021 14:13:40 +0000
Received: by outflank-mailman (input) for mailman id 88094;
 Mon, 22 Feb 2021 14:13:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w45/=HY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lEBxz-00008V-NH
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 14:13:39 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7adf0c51-5224-4d5a-93f2-72f8fea52bc3;
 Mon, 22 Feb 2021 14:13:38 +0000 (UTC)
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
X-Inumbo-ID: 7adf0c51-5224-4d5a-93f2-72f8fea52bc3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614003218;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=BDDrQ2qM6+vGCjkv3tgDQZXRKOhGXSpXwrQthCeuY20=;
  b=WcKFO+a3d5bTUIIKB1b5Jbr8nq3/nv+VObVDEdh9u9KBu97V6iw61yQR
   evriniGAbfGqqAixlVFxWVaTl/yG6JIOpnO4cpT8XEpBHdsF7/Q23foVZ
   YoqhGypOdh1eg5O8uk1IFr6OKcb4JwPWtXSELhZR+HXGC82Yam8bQ3nAr
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qNgK37lxZkDuE3C/o8EEhgu4C1QMTIa420ZqWh2bwlOSgzTLp65rmPl9gQnkC1Oylrdn0iJ/It
 k0BE3birGgyOTaatnZtougZ8tt4DBANXLAh1eIpJqTXmKSApPZOWEGAEoUR3oEysaD95CrNdTc
 nN0a3umeLRpB11fTkX43oWf4atv9Wqh1yOBToi8iRdJuWihzR8CQXh4gZKHhDbMWlz4OqptdgF
 V6742VOsItjPqC/Qx4qiJNEb07vzH+e8qOTj+ewzj0+w2t/mU3GhnOGg4RUrmo6YYllUT766Cl
 oco=
X-SBRS: 5.2
X-MesageID: 37735681
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,197,1610427600"; 
   d="scan'208";a="37735681"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=imfBha3A90v/uCd5fLejUu4bOjjO1k7qP25yq8eI8G79/uXWcVHWNugcp2EabA3m7vH49fGd+yz1w0nK5XY3IkRdHWn2pQaOxvRET+3eaao7h+I7043NA5EIOdjSNNMPykXN3aeVUQzIA4PRC8SLZWcj1+yfSF1RNwAXi7cBqoWJKBx6M1DIt8+g3VctCbQAhbzs3xljlH7BCFSthLdg+xuhiaG+CIK+Emw74JUYQBxsB9zB+Bs5dbA8Gpn/8ePKN9CDk1ToyYBx2NMup6v6YCqBt+VsIizMjQegg3731EqLqWeQqAeiAcXI9PxQDFjyDFbUDJ3D/0lPh0hLI0hpkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXNSbAxKetyjknVoleTu+e4FO8g8d0PVDRXqx/8BaAI=;
 b=BzYylmt57NTSMH8orP1y5aapEfgEowO7pfcgfsRvB3ZvVKww+tdW1ZpCAnbPmzHTCVTK61+o4YNPsYGZ23VTg1qTtaC64NxjkTu5WIGfGypOR6rT+FRHDZzILPJlN9g9nfDC5L2cVZraBRQTOcpyWGCQ601QRX2ebIDi/dMpBVCvtvUZtIwzDAacOAw2ibk7POCSiZ8FXKGZuNZQ14NpP3jpvVsm51tYE6rLZDcrfKmsny0KBXvz13X6bVSCWWz1cR2N5TLVr01ZjuF9AOIA+QwC0VMeTRDnTDRoyEgD2omhmV77rhF2oiy1Su1SiuXMZa8fcIlRyPSWQz047+1cJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXNSbAxKetyjknVoleTu+e4FO8g8d0PVDRXqx/8BaAI=;
 b=GbnV61EBOg3TRCP3drZGTSfSLrqtHBgKWv/tvUMm8TUqeTSq12rfqIcW3LMl6HHS4Vuno0xRiTS00m+rkTStv/DzHMHDmQTWVf+OU95JBDfHcTO8iyMBpd5cZCVuU2iLSmN8O+B4JRunmAwTFOsznrNZ7BOHTnMx0lBkZe1Cdvg=
Date: Mon, 22 Feb 2021 15:13:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH][4.15] x86: mirror compat argument translation area for
 32-bit PV
Message-ID: <YDO8CM0prPjoo/X1@Air-de-Roger>
References: <bdedf018-b6c4-d0da-fb4b-8cf2d048c3b1@suse.com>
 <YDOW+ftkNsG2RH3C@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YDOW+ftkNsG2RH3C@Air-de-Roger>
X-ClientProxiedBy: MR2P264CA0141.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fff865ed-d647-4e11-08c4-08d8d73c0a1c
X-MS-TrafficTypeDiagnostic: DM6PR03MB3674:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB36747AB073AF3E28126977C38F819@DM6PR03MB3674.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y16tFAtrDdPoRcTJ8EUmFzzhhbHRbdBmXqNwpoj3GYGUTK2RgiCutBFEjlubdnYrXcuQvm3EZ2KdJLTlTDfSTQsTCOYwmso1lUBTfjpLzYpR9JtnOwBGgipIrfzjJRQsX2VipFWe35KOjd7LZkuigmSYAWVR8zEX9leFgQ+YxXJgV/KEdWb6CW0b9Qs5jTXwrxHp65smWT2HG9OjqbVC35cViTRvSGMQ0vacXrFg9gXM6mTYvsRbj6RHiZIdETGFg08EP7i1ubHjwC9SxS5ixanrkdJrJtGeg0eVwhavLMyZXbB2DK1MEtuK+cnda0Nz92AgGnkmX69+QFvFbhPv0pPWoAMQat8uKHMlXw+sPMZ1UAxA/KGhKb5TqpoYJL1LBo62WsXdXlSVD4jo4kbxzWG8fgaBj40nhoMh93cQjq1k2JSIOFwQNDIYEbgXAOKQPwTzJt+GoGEidylYhbmI8eAvRuxCKKeYONcg284dNAJBvQQt89ffcv1LDryzQmfmT/zaGwbWKjpMqi+p2B6hEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(396003)(39860400002)(136003)(346002)(366004)(8676002)(4326008)(6486002)(83380400001)(26005)(86362001)(8936002)(316002)(85182001)(54906003)(6666004)(956004)(66946007)(9686003)(6200100001)(478600001)(66556008)(5660300002)(6862004)(33716001)(186003)(2906002)(66476007)(6496006)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d1RlRlBsa2RLd0x2bEJFbmp1T3dVbmpQM0ZxcnI2eVFrZXhUOHBpRUNCU2N4?=
 =?utf-8?B?cjk5bTM3MUdlRnA4bU04ellkaWI4cmhhWVhtRDhsc0RwRE5xSUZCZnJ4RE5s?=
 =?utf-8?B?bUhCR3E2M0hCeXBwZ1RvTnFsSlczakE4MkN6WHQ4Qk1RbDFYbVZJWDJ1eUlw?=
 =?utf-8?B?RDZMVXJ4dHlFRmlHY01JTExaVDcwTUdyaFlSd2hYSUQ3dGdUNzU4UzJhRTN6?=
 =?utf-8?B?Vm51NEZJazZMbmFQTHlJMjBEMDBNNjkrZmVDekJDRDVvL3NZQUN2MXMrVzRp?=
 =?utf-8?B?MC9rcEVsbmNsMU54OHkwLzNFeUxVeHlMZUpNMHRLNVJrejk3RHpZanBxclpK?=
 =?utf-8?B?elcrdkpHTGlEakg3U205Q2I4SGh3K1p1dVJTeUlBV0VxK2NqMHVYWXR0TDBE?=
 =?utf-8?B?TVdkWGFnbWNBbGVlYnZiWmJpZGFsaWZNNGplVGNkU0Nhd1BZaGFRUDRZV3Qw?=
 =?utf-8?B?WCs0aWJuMXRsM3JFRCtxdTlDMnAvL01ZMlZXa1B1aXkwN2FaenROb0tpRHJO?=
 =?utf-8?B?YVF6OVdMTUJIdzdaUFRObGQreGxPbGUxYld4TC9raXVuYUl6aXZiQkIvaU0z?=
 =?utf-8?B?WmRyZlUrV1dNcTR6Vk9RNlNlU05FMzNRZW5FZHBlUDM2djNrN2pRSTlRRG1a?=
 =?utf-8?B?di9XNEJlZzVKZ2hzb3hUcWttTGFkREtUN1JrTWUrZmZYYzZaRWk4STVQc2lD?=
 =?utf-8?B?QXcvK0pYZk4xM1ZmMWJxQlMxN2VId1ZPakxFRmtudU5yVUNLc0JJWjBETFlx?=
 =?utf-8?B?c3RoTzd2eFJkYnRvNm9scW5CSUxkWWZlc2I3cjY2cUp2S1hiK3c0R1RQREE4?=
 =?utf-8?B?TEJDRGFrZm5TK0JtbDBKclYzYUpZRVZ1TDQyRXNXMWZ3ajZobms4M3FpVkRq?=
 =?utf-8?B?L1VuY3NyVWpvWUJOM3RGcWxHVHlWZkl1ZnVNT1VJdlFnV3FsS2lEamgxY2Rl?=
 =?utf-8?B?OFV2NEw3ZzlZYmtJd3JTNXdPdXk4Y3EzT1lSWm1uM1NsVHhUa0VLTTY4Vzly?=
 =?utf-8?B?a1dZZ2RHbTNZRklRblN5M01STkM5ZUV2cnQzdzhSZHFUWDZzUzdhWHdveE1S?=
 =?utf-8?B?VGU2L2xPWGw1a2ljMWl0elhCVFRncStNNHBTY2xRNXpvSDJDaHh5ODJsaFc4?=
 =?utf-8?B?K2ZDbjBuMUdVNzFzcW9TaFB6U2tWL0J3OEhCNGlXRGszL3pFSUJrdlpsczhK?=
 =?utf-8?B?Rkh0NnNXT0xjYzRRVE5yV2ZjT0NBZm5hYmNNeDFVR1dTamRFZTR5NkM3ZTNV?=
 =?utf-8?B?dUwrRXZPRW1kRGJ4MnJrMlJBeTFNV3NuTlpEYWxTUk5YWmZMbmRKT3lkTEpZ?=
 =?utf-8?B?L2lHbE5VbE4vUW9YbEQvczcyVC9LV0t0YkR0aUU2VTFvTk85UFhWbVhFaVVn?=
 =?utf-8?B?ZE1HVVlLd3pSbG5NN3h4Vm9RVkdLQS9paXRQOTlXTDBIN0pTanlvUm80bE5n?=
 =?utf-8?B?dDQvQWZKQWNGdWF0Y25FN3ZCSmVuaFBmL3Q5S0tEQ0V1dWwvOHFTcFNqNGlX?=
 =?utf-8?B?eGdEMU1UKzBpb3Zsc2VsQW5iaVlJa0NoYXd3cmcyS1ZMdGVqeXRzVHYyd0lG?=
 =?utf-8?B?bXgzU2g3SThwZ1RJRFdEQXBNbUVBTlhIcmx5YWw3aU40WlFhOUgrWWV3S2Ez?=
 =?utf-8?B?cWZNeXhDcVRJK2pkKzk2TWJSejkyTGxOVE5aeGVqUmIxeWFWY3JpdVJhVXVX?=
 =?utf-8?B?MDhJSStENFkydHdLRGVlR1FKM0pKOGFqeUpsMGFmY29pbDdka2ljQ01jeUdj?=
 =?utf-8?Q?ZIj+Z54LB5CBAbobb312OCWxm1M/6cr0g06o56Y?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fff865ed-d647-4e11-08c4-08d8d73c0a1c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 14:13:34.3541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xupR/ArkH1PgQZPjFxRdCNFOn0ybhBNuRFHakNxa/9oYPXxOyOuBKmA7kAFLZXl120t0pPCivlnR1pGIqQqw3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3674
X-OriginatorOrg: citrix.com

On Mon, Feb 22, 2021 at 12:35:21PM +0100, Roger Pau Monné wrote:
> On Mon, Feb 22, 2021 at 11:27:07AM +0100, Jan Beulich wrote:
> > Now that we guard the entire Xen VA space against speculative abuse
> > through hypervisor accesses to guest memory, the argument translation
> > area's VA also needs to live outside this range, at least for 32-bit PV
> > guests. To avoid extra is_hvm_*() conditionals, use the alternative VA
> > uniformly.
> 
> Since you are double mapping the per-domain virtual area, won't it
> make more sense to map it just once outside of the Xen virtual space
> area? (so it's always using PML4_ADDR(511))

Right, that's not possible for PV 64bit domains because it's guest
owned linear address space in that case.

It seems like paravirt_ctxt_switch_to will modify the root_pgt to set
the PERDOMAIN_VIRT_START entry, does the same need to be done for
PERDOMAIN2_VIRT_START?

I would also consider giving the slot a more meaningful name, as
PERDOMAIN2_VIRT_START makes it seem like a new per-domain scratch
space, when it's just a different mapping of the existing physical
memory.

Maybe PERDOMAIN_MIRROR_VIRT_START? Or PERDOMAIN_XLAT_VIRT_START?

Thanks, Roger.

