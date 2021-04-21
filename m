Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6016B366E90
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:55:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114778.218786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEFr-0007cf-Ph; Wed, 21 Apr 2021 14:55:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114778.218786; Wed, 21 Apr 2021 14:55:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEFr-0007c6-LX; Wed, 21 Apr 2021 14:55:03 +0000
Received: by outflank-mailman (input) for mailman id 114778;
 Wed, 21 Apr 2021 14:55:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wOap=JS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZEFq-0007bh-Al
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:55:02 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c908195-cbc6-4b0f-a98d-b787c4c32f29;
 Wed, 21 Apr 2021 14:55:01 +0000 (UTC)
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
X-Inumbo-ID: 7c908195-cbc6-4b0f-a98d-b787c4c32f29
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619016901;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=PY0GKFSjA9L+cGYqkIwoHd9UfQ8qO8YNBplCT8dXXPo=;
  b=NAmvMt92bQd03qP9wwRKOTLVHrpkiQM1FY8bksf39Kj+fp+jqCNGHhmE
   JgPs4vEWcxkdOiRyLGbKR/oNKOqsjdF5k7qVQRsBpcDEBRLs6E/rAKr+C
   O0kvsoe8PHafAO2M4Wtm6405OlixDGbFXn1SwKEfsXHnmLOYvHvMfgLM8
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: AeydEXoJBAGZh21zVyxU3Rv0moHr7IFHkbJkG4YTwCWClrGQ3STc0qszw9P8Cqx3D2lq/FZfl0
 9aeIzTyBkjokFbMS7maBKBgXL4cM52ptUAmBWYISKM2fFNJ46B2rizCG1okUXBjpwYQt0KNeBR
 s6k9IPwfAlT/3sb6C67swbUmYVadzOmcJOvqTzixxe7kVPx3g4dHcfGGJNAQihtl9Zh78a2uWK
 DBQT/unmIN0TNJGqWG3/DNmsc80RhgeBfJlJpf5B3dhXsm26m++dSrrg0YLYqvG30FWPzimiHY
 iTg=
X-SBRS: 5.2
X-MesageID: 42474688
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:KxmjDqwaPW9wqxOttfu6KrPx9uskLtp033Aq2lEZdDV8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPsfVr385lp7Y4NeYqzRQWOghrMEKhOz6vHhwfhFSr36/JH2c
 5bGZRWJdXsATFB4vrSzxK/F78bruWv1ICNqaPgw2x2TQdsApsQjTtRLgqACEV5SE1nKPMCdK
 a03cZMqzq+dXl/VK3SakUtZOTfu8bN0KvvfB9uPXUawTOThjCl4qOSKWn64j4iVVp0oIsKwC
 z+vCHSoo6itPy6zRG07R6o071m3OHP5/EGKMiFis0+IijhhACydO1aKsC/lQFwms6DwhIHl8
 TNvgcBMq1Img/sV1DwmzTB8U3B1ysj8HDrw1PwuwqdneXJAAgUJuAEoKAxSGq812MQ+OtS/Y
 gO4kei871QNh/ElDSV3amxazha0nCajFBnrfQelBVkIOwjQY4Ul6Mz1mVPHqwNGSrrgbpXa9
 VGPYXn6PFafUjyVQG+gkBfhNilXnEEFhybWEQ1usuMzzhMnHxipnFovfAiog==
X-IronPort-AV: E=Sophos;i="5.82,240,1613451600"; 
   d="scan'208";a="42474688"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9LbDr3xrTno+3qwT6gq0CXU/6KHNK5xItB2lzVXwdvCnxAa6f7aMAw1LxSTrcabiTI9QxPaXUHKa7fRYtragcdzKk8bcl4xrhicdnVQMqZo/T+r+rtYXCuvpYDsXIOOpI/qGtbOn08c4AWw/Gbg3qb9rijf6wIFoK0Fe1HF9SMu8QGMntgqMqQbUguztpCwXF8/X7JZ2/JizgmeEmAl1zWbMopItqBCTZCEDYzq5pFYFDU5xZEz2FArmghI1X6T7EAq8c7sxOnP2afGx50pGKS0oCmwavu+ka/g2AfO0zAJOdRFte4N4gXfWpgR6W79l6KZHjpFrGxFN2GujxBUuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IG9p7eBBdYHGuNy1Kf6MRr5odbmVq1Fs2UrrHinblHQ=;
 b=OgfRJUqnUj2OE27FB3K/ZfROBxzBtx8xnB7fGVnYg4rTKb+cjg0s+GRsr9LstsVT1UYVpiYeJ3IvdW0A8PdQFNkA5AeZtNn/r9blaCQu4uJhzyWrguKMXKy5S13h3U/gpLxNqKJCX+6XWhMsMRXGnft7pB1EiUAIRSRl+MNUvkzj2CalWMrN2cjI52HU+7IgvaEKPWC6VhxzlfCriRlLlBKz4VAc9YBgekUkuYlEPcFAURyWsPDElxO8y00y6sV5tcBhDGQlpWXAhCfhCWg3Ud9E9zgpkeqzLCzycHo8qaQ8mkEGXRaPpXWzr4RmiExRCue98VxLBKqcynMsVPQrPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IG9p7eBBdYHGuNy1Kf6MRr5odbmVq1Fs2UrrHinblHQ=;
 b=FOf04HA3trObw5Tlofp3O13QCJBK1NahXg5vOMqcbkVp/Yo8cO3zSeaGM9eEC6pfJsLjo065o71pZTr6JFs6v8Qj13JeypdfjXLVxQhE+1GZc4oE6f9X4WatH67IXg4xGf7m1Qqw+HH4qhTP9TKQ1kKwapvwUrA9Lc/6vKpnsfA=
Date: Wed, 21 Apr 2021 16:54:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 4/8] x86/EFI: redo .reloc section bounds determination
Message-ID: <YIA8unYer+LDXifJ@Air-de-Roger>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
 <b886eb2c-cabc-f195-4996-aae1fc3c61d9@suse.com>
 <YH/0dzlPxwWF1PA2@Air-de-Roger>
 <dfcc9535-e9c0-97f1-4970-9a78af039c28@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dfcc9535-e9c0-97f1-4970-9a78af039c28@suse.com>
X-ClientProxiedBy: MR1P264CA0027.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48d15982-0c33-403d-d92d-08d904d56dbd
X-MS-TrafficTypeDiagnostic: DM4PR03MB5965:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB5965EFE2816DCAEADA66D26A8F479@DM4PR03MB5965.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /XlPQFW0T+w7BOyd1sB0GfT9eJX+t7osGAzjxIyb+F/jG7BACO3pcutVv80JQ37wMIDI+VPrRWhR+rFlrDtRNjjiKW99U+PxwPMj+VtWPQM4x8DrW9wPKTGssW8PqfsXFgm/nByCcQ3WUgfy9vwQAOdbTOxBZaqNjCnNt1Aa0BbCUtXgb7sDlhCUVoeX/XiNgG29Dk1+2rltjkdEqsU8uz6TD3UarL6vXjNnARVllzEMHGXTjV7sgOtKTH10v36S1z0vM51yDGN/31bzfg5Dn7N4EPtjwj6+s6vEu8dR/yLh7s0U6y1FH6FaIRBvZ1zioJTup11WTOt78tC746wSl1WBYsD70C6QUkkAXzivaEHp2luSZohns/T1uWxtozwGW3tXJi8cAgAAd1zbahd6JyHSGDT4HvYgaXoo8Qi/ISYPuJbptukpTGe6+iHO5B65RPaGWLlBvxXLDRVvFQnBO+FnnZELQH3DtTK64mk3reXAo9sjVN1Kx24goRlIE79Zvm5vsUnLjAYSy5UeHB7LJH6aGmNOfcViMS2JW1NT422uxhGbnwf5Xr9FiRwPHQWH6LF3k63HvCW1zw/ATAczIH13ETwwmYTb7P7LrotK7NUzTiz56Vzxy4m7vZsx9qgT6rDup2eBvquZVCLJzqZkKvad529zKfkY19clLEdJmbIlO6Eu63B5okC0BExI21Mx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(186003)(26005)(85182001)(9686003)(6916009)(316002)(16526019)(2906002)(8676002)(8936002)(38100700002)(33716001)(66556008)(66946007)(66476007)(83380400001)(86362001)(6496006)(4326008)(54906003)(6666004)(956004)(6486002)(53546011)(5660300002)(478600001)(142923001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aHB4a28wWkxmczY5UUtXeEpFRDhVK25ZY1h6a0wwOGNURGJwUTQ5U082NVgw?=
 =?utf-8?B?QTRxV3UyWllzbXVRM3IxZ2VhZXlpRkE4emlVS1lEWWVkSmJZZ2lCWTZnOHM4?=
 =?utf-8?B?QVp2R0pnaGtlalN5c1BuaHdreUJRaFZhc1JManJ6YmRORmJOVW9teU5YRWlE?=
 =?utf-8?B?M09vQ0RqL3N6MTRFWU9FUUUwVzVFVUtnYVZuRlRGdVVPSVdRbUFwZktCaUk1?=
 =?utf-8?B?Q3M5aHhvc1h2eFZhU3N5QXB4a3lRU1VaeVJtT0dSQXphNVdUSVhqSkJRYTBi?=
 =?utf-8?B?dnM1QWFVWm5oTHhwdVFmOURVNnM2U0VqR2RJZGptU0wxeE44NFIwZDhkaGI2?=
 =?utf-8?B?STFEdStYaHFFNnNIc1dNUC9GZ1NEN1hadUVPa1hxRWlrM1UySGFjMnNlMXk2?=
 =?utf-8?B?TDhTcGUwdTlLYkZPakFMc1grL2p2aUEvVk5kcjI1cTJ6Z0l4RG53Z1BUMVBW?=
 =?utf-8?B?SEFrTVJyMERMZGdBZ1RVSVUvRGRYVFBQTmVncmxUcDRUYk8zN2FZcXdLbWN2?=
 =?utf-8?B?TjdwVFZmZkk3S0dkQkJCU1Rsb1BRUDRuTzE3b0NBK1FKREE1QTMzcjBRUjRM?=
 =?utf-8?B?NmhlRjdPb1dTR0lGSnlyc1g3bGRQb2xXbDlia2pRYzNTZzNoZ2FDZU9kbGpa?=
 =?utf-8?B?UzNrNFpWdTJKNHZKUkptOEJFUlBlK0lqc2NPalZ3WUhHL0NZd1p6aWFJaU9U?=
 =?utf-8?B?bkJPcWdoUENLSkZvODAvaldBL2hTMmlxUGlBOVF5YXNWa1ptTFdVQVU1Skl1?=
 =?utf-8?B?Z2hQcnlVMDBxRE5iTnBtTTRvSjNVQVI3M0JjUEZtUllzSGtOVHhwYUlTRzV3?=
 =?utf-8?B?SzVaZUxHUkkxRW4yUnpETVNYZ2FnQjhNRGJ2aW40b2pDRSs0bjQ5WlRtcGcw?=
 =?utf-8?B?QnBpT2pmRFFvTnFldFF3TXNkU2s2RTR6MXNnTW1TNHJlUnlzQWRtcUZtMXVC?=
 =?utf-8?B?dXdEMHE4RnkwUWx2WVhJUXZiOFkxUG1RcG5mNjZXdWpkKzN5QkxJaTRBVGxt?=
 =?utf-8?B?L01iU3Q4TmJ5a1NiNEo5bFFJRmZod2lEeXJPQWNPTFcwTzVRYTR5dFRxbE5S?=
 =?utf-8?B?cWttUWUvUWZOeHNWRFIrWHJRQzkwdEJnUWpyVlUyY2xMMVNRcXhVK0dSV2FW?=
 =?utf-8?B?MVFJSW5zaTFkTVFiVGNTUEg4Nm5BdHZyTlpIMzRmRDJDQ1NZMFJieEFpZGZY?=
 =?utf-8?B?a1RvUkc1dldveE1KbjFhR2tuWmxZZmZXZjZ0MEhmOGF3S3RHajZSWFdZUEw0?=
 =?utf-8?B?R0NKNUwwdFpsYnFsZkR3RWNXWlJFVGZpQUdNL092UHpGampuZHA4cFVYUHdZ?=
 =?utf-8?B?cFI1YkZXM2Y0a1lFRnZOWlhEUjNac3lqcGd5dFRUOGUycWs0dk42eDUveXBP?=
 =?utf-8?B?UXloWVd2TWFNQmJrUnoyM2xkYTJ0YlVZUGVIcEhscGVoNEs2b29BMDR4MXY0?=
 =?utf-8?B?VDhkdW9BMjhrTCtkY01ma2piYW1ra0JXTkw4clg5WlluRWcyZ2NNT2tVREhQ?=
 =?utf-8?B?UlBSYnZZMGMzQ2crdmRwejhHcnY3STFkMDhlb1JDVzBMcXdhZXIxZlhuR1o0?=
 =?utf-8?B?b2U1OERKMnNjNTJkSXRyZ05GbGtvZ1ArQ1I3SUU2ZWY4TmRwQWMxYk9MYlEv?=
 =?utf-8?B?RGpod1JadEo3NVAxOHRJWUptdlJ5VEN4bW9VSG1Td1VoQTFLbXpBaFkyRDJJ?=
 =?utf-8?B?eUdGTFA5YmFRR1ZIZHhreHlLek9kekowQmc2clRMWUhvRkExajhnUXByeUFu?=
 =?utf-8?Q?xEldkcbNHOxM2hGuk9HgW8KmXOC/BPruUEgiVen?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48d15982-0c33-403d-d92d-08d904d56dbd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 14:54:56.6335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lGCpcjThqnVy8H9HSMdllDj89TPYKO2fsSAw/fgiK19aHfy87BQQVy/+cQjHmCXqNBZ4HGnDWpbBjq1cFkoJHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5965
X-OriginatorOrg: citrix.com

On Wed, Apr 21, 2021 at 12:44:13PM +0200, Jan Beulich wrote:
> On 21.04.2021 11:46, Roger Pau Monné wrote:
> > On Thu, Apr 01, 2021 at 11:45:38AM +0200, Jan Beulich wrote:
> >> There's no need to link relocs-dummy.o into the ELF binary. The two
> >> symbols needed can as well be provided by the linker script. Then our
> >> mkreloc tool also doesn't need to put them in the generated assembler
> >> source.
> > 
> > Maybe I'm just dense today, but I think the message needs to be
> > expanded a bit to mention that while the __base_relocs_{start,end} are
> > not used when loaded as an EFI application, they are used by the EFI
> > code in Xen when booted using the multiboot2 protocol for example, as
> > they are used by efi_arch_relocate_image.
> > 
> > I think relocation is not needed when natively loaded as an EFI
> > application, as then the load address matches the one expected by
> > Xen?
> 
> It's quite the other way around: The EFI loader applies relocations
> to put the binary at its loaded _physical_ address (the image gets
> linked for the final virtual address). Hence we need to apply the
> same relocations a 2nd time (undoing what the EFI loader did)
> before we can branch from the physical (identity mapped) address
> range where xen.efi was loaded to the intended virtual address
> range where we mean to run Xen from.
> 
> For the ELF binary the symbols are needed solely to make ld happy.
> 
> > I also wonder, at some point there where plans for providing a single
> > binary that would work as multiboot{1,2} and also be capable of being
> > loaded as an EFI application (ie: have a PE/COFF header also I assume
> > together with the ELF one), won't the changes here make it more
> > difficult to reach that goal or require reverting later on, as I feel
> > they are adding more differences between the PE binary and the ELF
> > one.
> 
> There were such plans, yes, but from the last round of that series
> I seem to recall that there was at least one issue breaking this
> idea. So no, at this point I'm not intending to take precautions to
> make that work easier (or not further complicate it). This said, I
> don't think the change here complicates anything there.
> 
> > The code LGTM, but I think at least I would like the commit message to
> > be expanded.
> 
> Well, once I know what exactly you're missing there, I can certainly
> try to expand it.

OK, I think I now have a clearer view, the commit message is likely
fine as it already mentions the ELF binary only needs the dummy
__base_relocs_{start,end}, hence it's the EFI binary the one that
requires the relocation symbols.

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

