Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B57D3C209A
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 10:15:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153453.283514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1lf2-0005m7-EB; Fri, 09 Jul 2021 08:15:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153453.283514; Fri, 09 Jul 2021 08:15:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1lf2-0005jb-Ab; Fri, 09 Jul 2021 08:15:00 +0000
Received: by outflank-mailman (input) for mailman id 153453;
 Fri, 09 Jul 2021 08:14:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1OC2=MB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1m1lf0-0005jV-U1
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 08:14:59 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf7a9480-e08d-11eb-85d8-12813bfff9fa;
 Fri, 09 Jul 2021 08:14:57 +0000 (UTC)
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
X-Inumbo-ID: bf7a9480-e08d-11eb-85d8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625818497;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=wNCHcaY8PpQa06AnzSJ35wlGVWYVRcExyqVoNOh81Ek=;
  b=Wa/Q8g3s8NbV3KwHaGfS127EwLZZHcPS/4NIWtlv8bfeIjbbQuPbxMKR
   dikeCS7VhxMyftWAk55FvqO2HM1qfbwkandGJo2XfbQ3NybfB0z9eO6Ru
   HgOtYddyu0CK4LTyFDedsiikhgJUMazCC/YZz9bJ4yld64XB8irxswUrk
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xS/GOEzTtq6b1R/p/oo7VFVtoWP4RUIXIeWY7FxJJMjrReLEoSwKcvf96106FGt0fpy89+5T2Z
 L2zhpF0nj3goGDTt34s+i5toxWD/9Ge5kPf1cCtTxIHggOOQ7z3t6coMXZ62NUmI6NBq5QMzts
 pKfQHhRS0SEgxRvexnQAyh+9428xUpO9BuhCtqhc6S51ymzQGMeeIWK0wkhpv1hfspT0Lgcje0
 d8/QKAO0ad4FyO1JORczTutCBCdpCwQQ9832FigzH9sHfsbzwXpuUQcxtGIl1Rkkn1+U8IAHFA
 zcU=
X-SBRS: 5.1
X-MesageID: 48291211
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:2Xwd9q7Qu73YqfLp7wPXwXqBI+orL9Y04lQ7vn2ZFiYlEPBwxv
 re/8jziyWVtN9IYgBQpTiBUJPwOE80hqQFkbX5XI3SHzUO11HYUb2KgbGSpAEIXheOiNK1tp
 0QMZSWaueAcWSS5PySiGTVfLhAsbz3lJxAx92usEuFJTsaN52IhD0JcjpzZ3cGPjWucqBJb6
 Z0iPA3wQZJDx4sBPiTNz0kWPXnodvTzPvdCiIuNloC0k2jnDmo4Ln1H1yzxREFSQ5Cxr8k7C
 zsjxH5zr/LiYD/9jbsk0voq7hGktrozdVOQOaWjNIOFznqggG0IKx8Rry5uiwvqu3H0idvrD
 CMmWZmAy1A0QKJQoiHm2q05+Am6kd015bW8y7fvZIkm72ieNt1MbsduWsTSGqr16NphqAP7E
 sM5RPHi3MfN2K1oMzwiuK4Ii1Chw66p2EvnvUUiGEaWYwCaKVJpYha509NFowcdRiKprzPPd
 MeQP003swmPm9yrkqp9VVH0ZipRDA+Dx2GSk8Ntoic1CVXhmlwyw8dyNYElnkN+ZohQ90cjt
 60cphAhfVLVIsbfKh9DOAOTY++DXHMWwvFNCaXLU78HK8KNnrRo9r84akz5uutZJsUpaFC2a
 gpkGko+FLaXnieQfFm8Kc7hCwlcV/NFwgFkPsukKSRkoeMDYbWDQ==
X-IronPort-AV: E=Sophos;i="5.84,226,1620705600"; 
   d="scan'208";a="48291211"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jjAIWBQytW+Y68tsT/vG6Fgi4dRoZfihmANUhJnHn210Sm0l5tUJdejS3w5FeQMdrbzf2ig/tJRzxU1in6VbbbWQBk/50lpv6UvOvjN3pn1D1av/PX/DbBurCym9/CIMd3PjxABWyjVEWrM+jN0YEEE7+0JH11uwBFbHMHYG9QLOT1MYy9j0d2ohr+JIW+uqktIfuD8QpwgDQZ4wCiYpuW4oadUtnhcKoOqkR7KI19q1fRz2BYLJokEWXVdLWJdL/fwG2bDlSeJVYgS0STrIby8HDXNYBiq9h99bNei/3xsYXl4a56L2Y/L++U4kJKb59ippKg44fxSBVVf3YAyLsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFem6uGJ2E9xEXuVT0KjbIet7gkhYvqMRPD+x1DZX/s=;
 b=n1QgdWCvhR8SXUS0P0OTk+LdIH2uY2NGbA0SUSis+d8PYw5/WNcPLgypg6qb7OOfjj5ApbwdvPL0QOWmRdZ9d6uKtE4o+AQtl0uU/E6W0xowsr6Qd6QoHfQU0w57K6L+8Q8QyUDjU1QuoG9wHk8WQmHKxOhWy6wlhZjiNEUDQocA0/I0rxn+4VdzRWoy0MeBE8aMeMLyYubljU3obQqSy/ZEKBFtWk7FtahFPC9hyztUIeS7oZyRJh73WrRFWhHqphXSELllDU4QrEZom55THY54xGJ0TsQm65gWG7OzZh7+fZyM5sbmOBx43R6XTLkv2KNXRZlqma7RNqyd0Md75A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFem6uGJ2E9xEXuVT0KjbIet7gkhYvqMRPD+x1DZX/s=;
 b=XomXI5H5k4A3RB56JK38qqizVAFe2kx7jDwABVeEX7W/9JWlN3xbZQkmxZd2pETk97vvXeBGRThhj7F3UgyZvZLk2FXx1F+DngC7DiWZTAqX3lJHgzTntM3dlmsSDBwJ+TzIS9iarEE5NuYTbn5i/hZ3sxuCINpxLGL2A/4mvAU=
Date: Fri, 9 Jul 2021 10:14:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH] cirrus-ci: Fix FreeBSD build following QEMU update
Message-ID: <YOgFceT/gHZsYvGp@Air-de-Roger>
References: <20210708130232.3159-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210708130232.3159-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MR2P264CA0006.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 069001a0-4ceb-4b76-9a25-08d942b19def
X-MS-TrafficTypeDiagnostic: DM6PR03MB3835:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB38358A73F69C102F29A795A78F189@DM6PR03MB3835.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w2MOTdMyy4Leu4PaxK1LH/P5JJ+Nk9pJqQn2+LVhWgAf0DY/KT/PoaOuFXcTmgcJFR7TqAND16OLcAK6slULANjvg2MoS8psUtDYqbq0xIcDYcUsuyO/N/qBw33Dy52uleZlH8phkQUOHtCwpDXuet5AZC7JSJwHiOAwczQvSur/5ZIH0ysmVfR9pVS8rd2jrCT5BKS8L1w+bkHzI9Ls3oYsYXh4iaSwEe56IjMnj8Ut1r1R4ncNMOUfYTcTA8WCaC2fUe59sOBdh9F7t4IsQrpuF/TV8MFdmHaI0GZxLO7UMte18N8pyTWsYoPZEM/u2tZhW/z8E8R8YcaQ+MoYzH40w6wnAoiaIi6fl+RsqJZeB6dDiZeiTpS2OMseOCoMCawlzVYFAco5HItKwAtFcXllKJvOtAGySJ2THT4P3U8dvvl5PqeqSSA2ww/vjPLkcKIUDm6WW1HXZ6hGmC3MXvdO3Pj3A6z6QzEtDsvcEV2ImV3dAPf8GiFGA/PvwCZhwkOVbu38mC2tFkQxQRoQ2bnqfz0r+2qp1UnjhyLJ0k6/iaDt3YmUNiqO8QsQcUm0kVjVQBDyE6h4QPVFnnahepOcTTnum8pcQrRDSvIuRnIRr4BTJWp/Iaoq6fSWpM4jmOyXa802G/rE5LHm73Gr5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(366004)(376002)(396003)(346002)(39850400004)(6486002)(66946007)(8676002)(38100700002)(6636002)(186003)(66476007)(478600001)(6496006)(6666004)(66556008)(9686003)(54906003)(33716001)(85182001)(4326008)(558084003)(26005)(86362001)(316002)(956004)(8936002)(6862004)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUlDbUFxSE05cXpFQTNvKzBIYTF6TUs0YTNTbUFVVlBDWFU3SGNzRkV3dkpm?=
 =?utf-8?B?RjNWM3B4Z2tpWVJEUXU5ZFZNcis4b0F3cjBqUWwzbXQwSUtHMWtydnI2Y3pF?=
 =?utf-8?B?dFZFN3RoWU5FcWM5TnRKWURHaWQrNHlKUnVtMnlCT2VNSTgzQVBIbmJmYnBD?=
 =?utf-8?B?TURXSFo5U0hOZWprUW1yUUV0UVFJVGdvOUJnUnU3eDd6OERNMDZlcE10QjRl?=
 =?utf-8?B?dVcvZGdXeFZCVm1nTmpIK2JsTkE3Q1o4Uk5RWm5Pd0NHMVZZS2NFK3N6QnVs?=
 =?utf-8?B?WFJJRW94N3BYNzRDNUdXMDVFYm5LNjJUMFFYT2UxZmwwS2s2WFNiTXZEVyt4?=
 =?utf-8?B?bzhDRGJjL0NqajFrV3VrOCtjMnVtVmRZdGZkMVpiMDFjRmFGNHhyV0tyVWlG?=
 =?utf-8?B?Tmo1WDE1ZjZhQVQ1enI3anc2T0hMKzNucm04cW1mOVpMaStsYkdCdXpENlBS?=
 =?utf-8?B?empPMGhobkxOWmRiRmorbWVvSUZLRDYzMC96RFJQVllTbXJUTFIxZzNIMFp1?=
 =?utf-8?B?VjRBTDIrSHFYZDlta1BhSnJIOUJIRkZFZG9VTjdHbTJsZVJqUlZWQ1ZZeWo4?=
 =?utf-8?B?R0tFWjBpbG5EbWUzUmlWMlNGRktkODVkSndFWEZIRERVWk5ER1MvdENNOStW?=
 =?utf-8?B?TTNKY0JLdG40RkpMdTlJcG1IeVVUTDVtSHRFQU1vNVhudGszMTdGWGJCYmJn?=
 =?utf-8?B?b1FCQ2pMMnJpMkRnaEduYUxURXBQT1M5U2tqQ1ZIL3hGQXBCdW9xRVJjTFRV?=
 =?utf-8?B?SzBwUFpoMUlEbVUyVE5iZjVMNktPdVJGdzNVYzFCRU5Da2JRSUdhMSsvZnJ2?=
 =?utf-8?B?TkxNZVArWTJBU2h2azA4azlTeTh2dlEwVExldHpzUCtZVzV0OEk1UGlmcFFT?=
 =?utf-8?B?Q2hqanJ0S1lHVXZGNy9KZlhyOEdIdEdxc21wYkJENDdJK2lRQk1jMDNsZ0Ru?=
 =?utf-8?B?UzJWbmtyam9IRWJYdDFLWTVTZzE2T0duUzdPL21CR0R2OFltbkpHRUxJbk9p?=
 =?utf-8?B?VW5DZTB0ODM0eVJYaVEwTkcxeVlPTXNmUW10K0xoZVN5VjFOM1IySklIc09Q?=
 =?utf-8?B?cTVzTksyZS8xcW5xL2gySUZ5N0Exdkw3Z3p5emgwY2VTNzk3OHFUTG5kdWdn?=
 =?utf-8?B?UzhoSG5SR0lkbExDSFNHU2JQUGFyNDdlbUgrZitPejVQcndqbmFDOVp5dzB3?=
 =?utf-8?B?aUJIb1ZaNi8rV3pid3lXOGR2S1hmM2Flb29wTlpVTzZkUlRtZGZnaVVhalhu?=
 =?utf-8?B?c0k2SHF2aEErRjBpRFVuR3lsV1p1RERDUnhRMk03TlZHYzh6SVgwYmk3NGwr?=
 =?utf-8?B?dTFFV1RuVFRiby9wVS82LzAwb2E3eTBtL3Z0dFdOcTBnTyt6RjdablhqTDdp?=
 =?utf-8?B?NWZha1hmcHFrb1VKVFNjd0x2Nm9yMFJqNUpOY1lxMnJDcldmVEhYdW5XbzZX?=
 =?utf-8?B?Z01ab29KVFVRcnhTNnNDcDMyZ3FpVTI1VVhXODVxamtleS9hQW1obVVQY2NM?=
 =?utf-8?B?UkVNVkNSaXZCQ1hwaXFvT083OHk4U1V3MVBTK0ozWlkvYWZqU0xyNTlabC9a?=
 =?utf-8?B?UFdrUEo5QXFNOW16YjdETjF6SzlqYlhKOVZOeFBWOXl1Vy9mSGtEUmt2dlJl?=
 =?utf-8?B?VDVzcDZhRU90am9pZS82cEpPQ3Z2VkplSmFNUUpyTXVoZEhPMHJkOXlVMmFR?=
 =?utf-8?B?TXRSdVN4OFJjaDFhZ2VvUjdVNUJTdTNibllzL3JkV05DVWZzZmlwNnRQakgv?=
 =?utf-8?Q?UQmR7Cbb6Sb+5EzFaUQIDOMvghjO/KV/aOaK/oq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 069001a0-4ceb-4b76-9a25-08d942b19def
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 08:14:47.7051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/8EwWPkoUv1fGPgStjH29vWdAdqboS786beXj7DrwAs1MAsEDjfpV+gzDm3KMTAPWlPtMXjbZhPmMMDq0D3BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3835
X-OriginatorOrg: citrix.com

On Thu, Jul 08, 2021 at 02:02:32PM +0100, Andrew Cooper wrote:
> QEMU requires ninja and bash to build now.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks!

