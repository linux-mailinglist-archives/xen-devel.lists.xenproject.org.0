Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B99D2329844
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 10:37:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92211.173949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH1Sl-0004Pz-5u; Tue, 02 Mar 2021 09:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92211.173949; Tue, 02 Mar 2021 09:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH1Sl-0004Pa-2j; Tue, 02 Mar 2021 09:37:07 +0000
Received: by outflank-mailman (input) for mailman id 92211;
 Tue, 02 Mar 2021 09:37:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IOGE=IA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lH1Sj-0004PV-JB
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 09:37:05 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d8e1e58-a09a-4751-9679-11060f904f9d;
 Tue, 02 Mar 2021 09:37:04 +0000 (UTC)
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
X-Inumbo-ID: 5d8e1e58-a09a-4751-9679-11060f904f9d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614677824;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=1TEZgdVIkdgu/VjQrgyHcEq99hsw4HlSh0UTR2w7MuM=;
  b=iI8fseYiJFpojSNgYMCOEXSOm+SCE0jEEv54BBvl/xRjjir1FzWFiMgg
   0mgfq5nvHhIP2w4/qPCGmziDNBsg6geJC+TUkOnBB9jA8zsPBiIm9MkVr
   Jvqz5CWE63R7FpLwY0yoHhLSBwbiaBtHN3LlHe5auGhKdTJjULBA1Kg7u
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: q2ufSHc/nWBWG47euwiO9lmFT1VQrur8rjxjN2kYldhLYenyEofHzXxI5anXtrl9b41lZ3xb8K
 nT1VAYX6kk9kRf3q9iwj+UToMv9c5cu8Ce6A5KED5ymzSIOum6mxHm4SOSj2VuI6nikrc/w5+I
 XteKk+icJ9XFA51L3c8wNdcZC2wCNn3QDbc1uz96C49VqffJkIO1y32Bek/IbMVu8pVQXTCx//
 EhqjpQiA+Qh2GNC3y0FKs8+WNb161C1dvNCTtmaa+zui5iKrHCA95H3SFCUXJvFZ81+ljJqtrc
 7lc=
X-SBRS: 5.2
X-MesageID: 38309385
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,216,1610427600"; 
   d="scan'208";a="38309385"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRr5p7AUIGUsSHeSkuVVfiFHpnrfcp6b/NuH4IpYKhyjEkIYdRmzPV5aselm9KM/tvXaCB9pNQP0Z2sdHztnS1uxnTj6YzgYYli8bK+zHtsD6wGkRq67pefIA/TWzWWzNZIdK4IVtRTA6VhJ2kxh/kCnf5XHJxFL3oUVIX+YoTBkwWeCKJb7CXaWMt0YkBeuVgozkNmbEZOvD44RGkXiPvCUnnwwvlcWsMzrMVvFbhPalCp/SzL/ooiHMF5G8djT03HfM2coQK4YY/hHz1t6mT2d11X/Ap9KvPa8zpfldH1DIrWSwY8Z6S0DT9J/eab3Cg29nv3qFRki1YpKjtwiUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1V4qtXOqAZV214T8ZG4+w9fSzWEz4yMli4sz2t59/E=;
 b=LC4FDXw4iFdF7HMk+pho5uGWB/Zwahz3a+yV29v9tUegmlG8tAP6amz6yxfjydZ5SEVHvt2NqTzBXV3VI9X1R16UKsoOJrGObXHxrj5G0IAH2haQhIJbJqjCFP0zPRY15itAXTlSEk8X/F1aIvmjuI92czgPmC/swOwe9Y6Dinixwh4y7h8fRLiH/pADfoTc3qE1HSkLzBZ/kNTeUupvOqBMtgOQBbD/llPR7tO7R3XjxZt/e0gCZgK4p9lhApWFKW6utTsff22wtlG0JlV306EM+c9lRhhgr2YezcPO9KNXA7FRKdw5fJV+RYX+R9rNmGJTYZ5zhqH7K6PlA1SzwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1V4qtXOqAZV214T8ZG4+w9fSzWEz4yMli4sz2t59/E=;
 b=IMuL9sX4A7alj0EnQxFe9TsicsPheEBw78eM5iTbqR5VOeBotyzj/BHSjPCqAP/pLK9K51PAU1170n6C55ZwusqmKQMnCmssIUKXxJOF3ZrhZ/2tjeqeifFm6KnelD5QNHGgY211PF2JyQaqhatAZTBdQNk08A9cd7QplAsrsjg=
Date: Tue, 2 Mar 2021 10:36:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson
	<iwj@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.15] automation/alpine: add g++ to the list of build
 depends
Message-ID: <YD4HM9+IEZKIq/SQ@Air-de-Roger>
References: <20210301095806.68518-1-roger.pau@citrix.com>
 <a1d8e537-af33-3ef8-412a-6422fb4cf4ea@citrix.com>
 <27ec9db0-69bc-df9a-8511-109f57972046@citrix.com>
 <YD3z9LNpzbOfqmpu@Air-de-Roger>
 <b3912fde-165c-b404-bf1c-46189d0ce766@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b3912fde-165c-b404-bf1c-46189d0ce766@suse.com>
X-ClientProxiedBy: AM5PR0201CA0012.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fb12b84-104d-4ea1-fb53-08d8dd5ebaa4
X-MS-TrafficTypeDiagnostic: DM6PR03MB3484:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3484AAA099FD6C4883C4DB818F999@DM6PR03MB3484.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dAE5AtJAVnsDlcdyyTPZxiUPRQc01SC6n2rO8Uah22OmTwBSA/It8f5UCSsRHELloWn/vxcVMfOAD04pco2IqnjpRspvxb/ExJIgIRalrqZdVH9E9OHPaXdF2dpfmsIV/xWcWKm6L++RB5nEm4DUwUX6id4g/izDpA0aHMfXSmgM+BUcdP9IZss2oBADF8WlUi3gE1LYRO9uIuQINRzajevNUNntUD6E0PKHQlJe1ZKMPk2OPvh8dpJBzuttU7tCAa1kuDwCweB6PR/l4hUv3Kp9WpuSX917LwmQ0L943mWiMeRXi1lp9MrgYHmRv4F9hDnFqDITlllQJScytMO8zTO6927fMQ6evbqIQMTTHD39PMrQIC7Is8+MuWVVE9bbx7L2U84Q+2zQTD9fKqbaXq4ctCn4oSS1AKoYBoNHRbJ+0YL1O80WKYoCVQG+EFj1oaPArd7eQyIcY/FcoUZz+0H+Kvjnwo980ozlc9SY0PGsrDsVEpqFxHnyhfaEWqrvdSL+Ww8gaKQnsnpj8mbiaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(6666004)(33716001)(316002)(6496006)(66946007)(86362001)(66556008)(53546011)(956004)(5660300002)(54906003)(26005)(8936002)(8676002)(83380400001)(66476007)(478600001)(85182001)(2906002)(107886003)(4326008)(186003)(16526019)(6486002)(6916009)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZW1PbWtDN0FHaFlDR1I5VnZZVThJMXFadysxVXFCQjFoU09xdGNJcjRmcGVV?=
 =?utf-8?B?Vm1TRnltb2RMK1J5eWFaUk1lb3VWTEd0cmZ1UWYzRWhwdHB3NnI4bnNmSkJs?=
 =?utf-8?B?L3k0N3g4cEtoVWNZWjl4K2tiVDdiQ0R4UGgzaGNicllxZGRJeGp1azROYkRK?=
 =?utf-8?B?TDVPQkNnMWRnWFNDYWFRUlEva1RkTktjU004TzQwblJFTnVoSWNld1VTTENh?=
 =?utf-8?B?MkVUTFNlR2hGZ0RlSnpHWHphMWs2WDN2akRINE4vK2JjaG9leGY3R0QyZ0FE?=
 =?utf-8?B?RU9MMnFnSEUyd2s0TGNtcmFIYm1BVEhNMnNTOUdWWDZvMU5lWWZzN1pUNlFB?=
 =?utf-8?B?YVplU0UzRkRtMUs1VTh5VWVaekhsVXB2bGdrTXo5WHhEU1J6NjNpd0pFZGty?=
 =?utf-8?B?b3VSZHVjei90V0YzbnRaS0tBMXNOMWFCbHdPQzRkd0FGUFFRQzZabFVkeWNC?=
 =?utf-8?B?Z0s0eEF6MjZLOUlBNE8rYUVXTUROSlQ1SnRjS2dtN2tOQS9YTmx5aHJMQllV?=
 =?utf-8?B?VEJ2cFVTWWNqMUVOUEdIcVhGYmFtVEJJWlR6Z0FjWWMwZzlKc2lyU0Y3ejFU?=
 =?utf-8?B?VGwrZWljRHI3eXJoZ0NSYjBLQSs1Nkg3enJRcXNEcG9NOU1hSW04YkV3VW45?=
 =?utf-8?B?YWtCOEl6RFdEN2ZaMGRjYkc4eDQrajlWV1RxMy9mN2l0aGh1OHBOUnRMN3cw?=
 =?utf-8?B?T2NIcDZLZEVKemRLOFEyU2RtU1lxbjh0SkhySldwK0YwSkVpSmVUeTFEeUtY?=
 =?utf-8?B?M1FsL3dGenAxbTZ4WXRJQk0xL0Q2MUhPb0FMWUkxVjllalRrQ0JRTTd6emRW?=
 =?utf-8?B?Sm43VkFZVTAvMWlDc1ZvS3lYNHdxTjk0ZDBCeENMZXJvb0lBU1ZOOWg3RkJP?=
 =?utf-8?B?VndoandmWEpFRUhJRlBvN1RVRnFTeDY1ZDB4VGdZNTlkWFdFazBxVjJWT3RH?=
 =?utf-8?B?TlNWa0ROM3B6SitiUW5wMnZTemN6TUpKNVVzWm42elBPbjRaY3lYTXJkRkxp?=
 =?utf-8?B?K0FRNGJmb3JzQlRHSjBYeEpPNkU2VENod2NsQWJkaGNveHR3RUVISzhsLzhT?=
 =?utf-8?B?TXMzU01pTGR1SjNkV1ZORmtqbjExaTdVNkl2WGtMdnZpVTE4S0R1aHp5VU9l?=
 =?utf-8?B?b0Z0Q2pnTklhQy9Gb0xxRWVMV2psZHV2anZxbktBOUl5ZDhrcGJNVVBiUDBV?=
 =?utf-8?B?c0x2K0N5STk3bUpWd05xb1JjV1JPVHp5SmJEV2hja0daMFJGRUF2dWdJcVdx?=
 =?utf-8?B?ZVBqblpYVXpDVFFPZVp1WlQxSy9VZTBud0thU1BlUzhEUDhhMEw4aUNPcWhF?=
 =?utf-8?B?ODI0OEcreTJ1bVRIY2U5aVkvV1NCZzVnTnZZdTNmVzFGQmpCNWYvQzlYQmtw?=
 =?utf-8?B?M2E2a3NTTEVGN2YwSzIxMG9LbGVxQ2NqdVI5VTY5ZFdvZEhXVVNncm9nZnlB?=
 =?utf-8?B?cGsyNTFBcEZHZWd1OEx6b3FLL0VoY0Z5TTdrdFBjMnBoQnBSVjM0NWhTUGhE?=
 =?utf-8?B?YUJaaktzOE9QbmJ3bkFBNStSTXRWbWVkWW1Yd0F5ZmNLTU9DbWM2NmtXMHJw?=
 =?utf-8?B?d09Vd3FDbGdMVnFtR1hHQ2FEd1RyLzdZQWxoMmVVWU5KZTBtSklXWUxiUHlR?=
 =?utf-8?B?RVE1dGw0UGx3eDU3QThOekxxL0lLOElTSDJTMTdmL1YrMUNTL09DZmhDZjBL?=
 =?utf-8?B?ZTc2YlZVNTl6MmRTT1hKVW9Fa2lPbWIveHRHVUR5bmI2cUpad2UzNkhhQk1j?=
 =?utf-8?B?SE5rc3NodE9Ld3BFbndSZDJwcmxLU3luUUNkdjR3SWJVNHhudG0zQUljaUE3?=
 =?utf-8?B?cTJWU3pLWHNRSFRNNFNQZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb12b84-104d-4ea1-fb53-08d8dd5ebaa4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 09:37:00.2238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZxIE8c3lWG1hGrQWzkhO+FNXzqJJ5DlGSAnU6o02afu8KDrnxcIGM4bFwq5peQoLSeZtBlbiXULEU5q9LsBwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3484
X-OriginatorOrg: citrix.com

On Tue, Mar 02, 2021 at 09:53:41AM +0100, Jan Beulich wrote:
> On 02.03.2021 09:14, Roger Pau Monné wrote:
> > On Mon, Mar 01, 2021 at 06:01:36PM +0000, Andrew Cooper wrote:
> >> On 01/03/2021 17:59, Andrew Cooper wrote:
> >>> On 01/03/2021 09:58, Roger Pau Monne wrote:
> >>>> clang++ relies on the C++ headers installed by g++, or else a clang
> >>>> build will hit the following error:
> >>>>
> >>>> <built-in>:3:10: fatal error: 'cstring' file not found
> >>>> #include "cstring"
> >>>>          ^~~~~~~~~
> >>>> 1 error generated.
> >>>> make[10]: *** [Makefile:120: headers++.chk] Error 1
> >>>>
> >>>> Reported-by: Stefano Stabellini <sstabellini@kernel.org>
> >>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>> ---
> >>>> Cc: Ian Jackson <iwj@xenproject.org>
> >>>> No real risk here from a release PoV, it's just pulling a package
> >>>> required for the Alpine clang build. Worse that cold happen is that
> >>>> the Alpine clang build broke, but it's already broken.
> >>> Shouldn't this be fixed upstream in Alpine?  Its clearly a packaging bug.
> >>
> >> Or (thinking about it), we've got a build system bug using g++ when it
> >> should be using clang++.
> > 
> > No, the check is using clang++, the issue is that clang++ doesn't
> > install the standard c++ headers, and thus trying to use them (cstring
> > in this case) fails. Installing the g++ package solves the issue
> > because it installs the headers.
> 
> I have to admit that I consider this odd. The g++ package should
> neither provide nor depend on the headers. It may recommend their
> installation. On my distro (SLES) the headers come from the
> libstdc++-devel package, as I would have expected. There
> additionally is a dependency of libclang5 (no -devel suffix!) on
> libstdc++-devel (I suppose this is an indication that things
> aren't quite right here either; I haven't checked an up-to-date
> version of the distro yet, though).

Yes, that was indeed my first attempt as I've tried to install
libstdc++, but there's no -devel counterpart for the package, and it
only installs the libraries but not the headers.

Then if I list the contents of the g++ package, I do see:

...
usr/include/c++/10.2.1/cstring
...

And clang++'s include path is:

#include <...> search starts here:
 /usr/bin/../lib/gcc/x86_64-alpine-linux-musl/10.2.1/../../../../include/c++/10.2.1
 /usr/bin/../lib/gcc/x86_64-alpine-linux-musl/10.2.1/../../../../include/c++/10.2.1/x86_64-alpine-linux-musl
 /usr/bin/../lib/gcc/x86_64-alpine-linux-musl/10.2.1/../../../../include/c++/10.2.1/backward
 /usr/include
 /usr/lib/clang/10.0.1/include

So it does seem clang depends on the gcc c++ headers, I assume this is
done in order to avoid having a duplicate set of c++ headers for clang
and gcc? I really have no idea, but I do think clang package should
depend on g++.

Thanks, Roger.

