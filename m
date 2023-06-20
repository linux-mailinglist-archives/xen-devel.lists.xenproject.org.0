Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B8D736C34
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 14:46:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551811.861533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBakW-0006c1-Ki; Tue, 20 Jun 2023 12:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551811.861533; Tue, 20 Jun 2023 12:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBakW-0006aF-HY; Tue, 20 Jun 2023 12:46:20 +0000
Received: by outflank-mailman (input) for mailman id 551811;
 Tue, 20 Jun 2023 12:46:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lS3L=CI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBakU-0006a8-Vg
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 12:46:18 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062a.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72637693-0f68-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 14:46:16 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DUZPR04MB9872.eurprd04.prod.outlook.com (2603:10a6:10:4dc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 12:46:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 12:46:12 +0000
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
X-Inumbo-ID: 72637693-0f68-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ib0b2Kwp5sayfrNfruMGJLArQ/Tmq5VZ8EHHCZNA3e3fvsMpnxtpyo/ktcpJjQAOaiZbEBFjY/BqVc6gxe9QYQ8UJk/6Z3kJ7MnRpWKPdoVQY2zaoqoCpE0/dlSvY/pOQOdHGkUcf8ogDbfNcHe3i7qzhYKTNcO0pl9jSogt6g5Qy8SsM+jytemhmyR+2DlUtMyPrdlW6VbHZC22s521eTk26DgPZfmQhdUiHLGePJcsWYfGKsTGGrfU0JD4nESEVm4tRW3gfHuQowy1FRtvRuDbqHHrUCISAf9DLupL/p06mfX1ZM8vF9VJflgcsp5othWOIA6oMC25K1Y+zGWz4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqmh/7YPKK68FZXi12iicxfg59/KTeJ3bogbYiaxroM=;
 b=HgqdjdUs+rhg63CLSguRb5GlmyqOyG6tS49lznGbyA25mTi1LCdVMKXvuNVhLtXNjq7Y9DDBzhfdC2SKkggmO2FIhJA5zEfHq84pGbYhyvoSrZlFB9/TeiqNcC28iq5sL0Q7ccA4lxdtUal3LgHzimH1YEOhv6k+qCKSfZhoYglcxM56KAcRujW6D1/fQtH/c3d5dp5F+UTSbrncw5aBcapiTeLbWP3HvvMUk5SAoQwYLrzrwM2ivNQP5ZqlrLg0AVNzt3xuQlC7bSRo3bKGY+s57go6xLMeXtS8WjGx9X8blDqOTRkeonKlL4bwonumakJqNuRFrgkMEAVeBCPMuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqmh/7YPKK68FZXi12iicxfg59/KTeJ3bogbYiaxroM=;
 b=UQZh+2OK4uZYbR0lWTv6Aaewgo5wamC7xf2ExYKxbzanGeO4QpPutDU4Cy7Q96r9oVWAzf8aH33pey76sdmlgpctg7tyuki5p7jQkFKPVwHb0GMwJB7b9kgTUpPUVUwy5K66OO/M0JzPruQ5KFJEVM6QKbqiWmr8v2Y3iJ5msi0Vc4KUhD0p6PZmi2g5LusX1HSGDcip4Fdchp7LrgKlf128sdeZtCmXyyVDTqyNWjbscoLQPC3oifZqVwDa9S+tBK4I7C+M3x1MyO7ZAbuPLEsHjtLjmJ/UYQSBNOgYe58lhXRlKj+l10hffhkv+0/ci3cvRaWL8VKf6xbdRGiMyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6d6708de-7afb-963c-65ae-3656fc755ad6@suse.com>
Date: Tue, 20 Jun 2023 14:46:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH 06/13] xen/efi: fixed violations of MISRA C:2012 Rule
 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
 <019b934cb1e96affd7429c1632fbfe3faacc663e.1687250177.git.gianluca.luparini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <019b934cb1e96affd7429c1632fbfe3faacc663e.1687250177.git.gianluca.luparini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DUZPR04MB9872:EE_
X-MS-Office365-Filtering-Correlation-Id: 24b494f6-474f-4c0e-cdb3-08db718c5437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bZWM2QD5T2/TLQmurFoyM0JWgTEuj71qaCCZb9U4unaYrlR7juAQsVwIPLdl1qvuLO8nXzWiRnauMWe8GMZ9UMnriZ3rcJhpfWdXGU5Oat1IiIxKmN5cy/Kw2YElaN9AjhodJfOFrC2lTpiUHVWGtNsh2o7twm4doXTBz83US4pVFAeAh9Nna8Sco3mv0PVvV+ITLCQkrlACM32P3vI0x7DCJkmenad1boikX3jEl0dM4JtJRjguzlxCT17BvXhUIJNqjaOpYoCV+wjJ0ltOi3/cBdxGTxNe3ITjUtsg1DY1mKmnjMkrp7jCyRqrlZGXF5G9YXvvK0QbLDKaI0IAAThBJz1kH2tUcbjUtgEevJIM1LB5rBFh/L0FcPIJR1IZuFT4mhBMe6yuezemQkIuNGiIHnJhARp23szIDPSkHHWmAzIyOLCRsQPzgQRInqlWeVu/CcSVN+hTjWGDiTOHU/UQy5/RGTwtHw7NTdW5wzPXCM3lLFwDiu7emuchWsCxFpmFF4S7d2EqbVNhhKBFwL48b9d4Ie620vkempspTs2LKDiNASRUVUOmwg85jPIs+wzCTIVPrwo0puFBDGbl02I7EoRPmetDbtYUsPBdsHXmnO8YN4LJW8zxJ67RTickyQ3W1XGxhTLYj0G/4nGgSA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199021)(86362001)(31696002)(36756003)(38100700002)(478600001)(6486002)(54906003)(8676002)(8936002)(5660300002)(7416002)(4326008)(6916009)(66556008)(66946007)(66476007)(316002)(2906002)(41300700001)(31686004)(2616005)(6512007)(186003)(26005)(6506007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnJIb0pQRlMveXJGZHd4c3NTNnhqMkFzTXBiRWU5R1NQemtYNEdiYzFPWnF5?=
 =?utf-8?B?L0huK21rZVRQK29LbHVva3ptUCszVDd2ZWt3V1dRVmZYMmRleEdCOFFLNTJ3?=
 =?utf-8?B?K2V5UDdpQUQxbFMxQTgrdmZLWlEwMnoyNElSVk1qTGpHcVZKMjBPU21xZnRX?=
 =?utf-8?B?UlR5bHZyN0Urem0yVVNFSTNpaGN5UHpaNmNnOWhlQ2Q2WGpqSTFybnhRbFpK?=
 =?utf-8?B?M3krdm55VGkwV2VNckxSc045QzRtN1pBcWZqVjlCeXZKdVZMVEhJaU5DYWda?=
 =?utf-8?B?WUhyM3NoelN5K0JaSThta3lmL1dEbGR2a2ZaSk5yV2NjbWNhNHdLVGlJNWhw?=
 =?utf-8?B?UjdEMFpGVWZxc1RyUFBlSi93V0xZVlQwTXNrd2RPTUY2SFhFYUVYOTZzc3kw?=
 =?utf-8?B?dzZaNVQ4akdvNUMzOExtYkdrUzlvZmtWQWUzbmxXWFpFbE1uQVcvSUtzSFND?=
 =?utf-8?B?QVhkeVZ5QmNQR3g1T2hjYjI5Tkk0VjVzSWV3dVVzWldhN0xQQmZpUFBDR1FZ?=
 =?utf-8?B?MkxVenNCRGJ0L0Fsbm04ZDhLeTdINFRuWlpsbWpsQ3d3bVF6OVlUb3lNM3lR?=
 =?utf-8?B?K2wxTEF6RENINC9SUVVUalpVYU1qYkJKbjdYUU4xQk9id3U2ZVNUZmFrbm5a?=
 =?utf-8?B?NzlyMTRSd0ZVMzhuWCtreSs0OWVJVDdPa0txL1BhcUhxN2wwSUFuYnE1TTdP?=
 =?utf-8?B?TlJKUDhjVnlNam93ZWJWMkJCYTFLYUFuT3FZYXJ6SGFvdXRFL0tQQUkyTGN4?=
 =?utf-8?B?OGRnc0Z0bHhldktzSXlBUlhrMndGNS9OK2xrdFNNbTZPU2xpWXpUNEtlUk93?=
 =?utf-8?B?OEpzTnNhMlpTOU5kS21oZUU5TGl6RzhITFRiM0tnbHh6d0d2OWhPWkdxNXJY?=
 =?utf-8?B?V3lSbnZ0WUd1SjRFTGF4T3BFWHJXaHhuenhiK2ZtSzl0Rlo4WnJvWGYwY3Bt?=
 =?utf-8?B?dVB3L2dTbGlqR2hZQWRqN0ZWenNyRmltSWpNellMN3BodzJnN0owNDEyRm9D?=
 =?utf-8?B?MklXa1ljaEFFWktENlVOMlZMRW1uR0YvZVJvRjByTHVJTzJmdTlqc3Y5NmRz?=
 =?utf-8?B?aUxJdjdOU1MwV3NJQ2k2WHpUNkJtWHczaG9rcGZqSDdRSnh2WTJ6Ylk4b0VS?=
 =?utf-8?B?ZXRkWmtsR2xRcTQ2dGJRUk13TnlGOE5IejVDL0N0Z2Vob2JvVUVWbXpERlVJ?=
 =?utf-8?B?TzNmNWFRT2E4VDR1em1lQW5RYzB5enFIYk0yaUJQaUhZS050T1VUcll0cHVx?=
 =?utf-8?B?VTREZk55MkNocU8vQ1RWNmJxcVB1UU9LckhzVzlYdDNXbFBUN2hpNFN3TXdD?=
 =?utf-8?B?bVUrMURGQk56aGQvRFBQZGF6cnhoT2h0VTgzUThacUl4S1ZpYUxxZ1dJRGtq?=
 =?utf-8?B?b3VOV2JZREdNVmxnbi9GM0FLTkh4dldLRDhhamxiOFlNNk14WVI2ZnV4enFG?=
 =?utf-8?B?c2p2NTZXd0FNZjRQRGQ5eERpTXF6N3lFOXl6Tjl5ZWF2dmtjRHB2QWxtR1Rj?=
 =?utf-8?B?NXl4U0grQlRvRnRPUmxhcjRHUVo1R0dra0pxVXpGbTBTVzJ2b0ZzVnBaWHYr?=
 =?utf-8?B?Qk9xakw0Q1gyejFOMytJTFEzTFR1eVI1VW94MHBRWnFxdlpXTFhGTlM5bS9Z?=
 =?utf-8?B?MGpwWEI0N2xiNGhkSzA2OGtOU3BDRmg4eE8rVCtkeHZlSnVaOFQxT0ZvRXpE?=
 =?utf-8?B?Q3EzalN0Z2s1QUI4WG53R2xaZTRKbDBzR2dvZW5SVFMyeHNVQTFVOWtraW5l?=
 =?utf-8?B?b05aZGFON0VyT1N5NDh4dXQwQmJvckMyMTFHY1ZuU29tcnVvYXppRkRlc0lu?=
 =?utf-8?B?WUkwTFMvQ2FFNE5jc1MrV2dDc0FTNjYwcmFET2FFa0FhdzVDZlpVSmNlMmtw?=
 =?utf-8?B?RmozRlEwYkZjWkRUMTJSZmUra0JKT2FqaHpMR250K3pXRnB0YzhnMWY1K3d5?=
 =?utf-8?B?bm8rWUtaeGdudlEwZjdCOVc1L1JkRUk1OWVHbGNmdEszOStzQTdGY0phTU53?=
 =?utf-8?B?UzRmWUNKWSswMkVxcUZKNE9WaksxSUtQOWxrckJMbnBSVGxra1o4ZFJ4aytt?=
 =?utf-8?B?ZHFmM0JuQXAxd2IwaGhnNjBBTXhkbWJhb1ZrNzJMdXl2K0hoQnhiMVVpckoy?=
 =?utf-8?Q?dn5gNdSh5BcArk4yBGJAjcAzI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b494f6-474f-4c0e-cdb3-08db718c5437
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 12:46:12.8061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r7lV46T22HaAu5p8NYC6Y/Irz6pLCX2RHNABGLkoKWXIq+6+0TfMETKYwn5f0iSTS8ZB7VU/XiebDW+XhfsgkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9872

On 20.06.2023 12:34, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline states:
> "A "u" or "U" suffix shall be applied to all integer constants that are represented in an unsigned type".
> 
> I propose to use "U" as a suffix to explicitly state when an integer constant is represented in an unsigned type.
> For homogeneity, I also added the "U" suffix in some cases that the tool didn't report as violations.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> ---
>  xen/arch/x86/include/asm/x86_64/efibind.h | 10 +++++-----

This file as well as ...

>  xen/common/efi/boot.c                     |  8 ++++----
>  xen/common/efi/runtime.c                  |  2 +-
>  xen/include/efi/efiapi.h                  | 10 +++++-----
>  xen/include/efi/efidef.h                  |  2 +-
>  xen/include/efi/efiprot.h                 | 22 +++++++++++-----------

... the last three here are imported from the gnu-efi package. I'm wary
of touching them, and thus getting them more out of sync with their
original than strictly necessary. To allow the other changes to go in
no matter what, I'd like to suggest splitting the patch.

Jan

