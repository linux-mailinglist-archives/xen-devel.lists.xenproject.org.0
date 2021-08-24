Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BF43F5D24
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:33:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171247.312510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUfc-0006II-Vc; Tue, 24 Aug 2021 11:32:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171247.312510; Tue, 24 Aug 2021 11:32:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUfc-0006FL-SD; Tue, 24 Aug 2021 11:32:44 +0000
Received: by outflank-mailman (input) for mailman id 171247;
 Tue, 24 Aug 2021 11:32:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QsuA=NP=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mIUfb-0006FD-6O
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 11:32:43 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe639b14-04ce-11ec-a8c8-12813bfff9fa;
 Tue, 24 Aug 2021 11:32:42 +0000 (UTC)
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
X-Inumbo-ID: fe639b14-04ce-11ec-a8c8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629804762;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cqj61IAy6MZ17K6/1ZqxTDC5GkKaLjnkao9Mp6K3Auo=;
  b=UVznGPXN2J5rKwnboE7ZZQTBqRau6zHa2kIfPnQNICwb90cOhT92qxCa
   ufPsZqEnuf06vWRN6PKSJIb0YbrpzdIs8MxQnSZDW/QAHBhBK5xHMZoOv
   ZB48ol171DrQSVtbuYEm1nuyBxA8qDdjyt1vqbSRMN+zo5DAyWJJWApqR
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: wp78ZzSYFOuM9vN0jSmD6r18jW5ikuBg80+2BOnU3dHst/ZDRvwWnWFR2Vi+tGibYdvIfyBooC
 APh+PdLfCuXxFyWjbs6a6J1FTwqmLpPkLz33Z328bSj3yrcL1yIT6IvJtaKcrw9UOjbhGTjwgr
 cggobqRFVgoGtpBtbqjtWVZ33noPtctbYYpByvsU24XxI6bCSioGmxQghEVS51QJGPmkbaDw+4
 Q36RkhOy4i/TK0RF8X10XKRouOqfr0xCbN097pd2YQE7wMxiC84r6XVmAOuYMZ0PuZ836niiyz
 qNHP/4yjZz8vvzwoJk4RE6Ai
X-SBRS: 5.1
X-MesageID: 50774808
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:XilJZKPTpgV2pMBcT0T155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/exoS5PwPk80kqQFnbX5XI3SITUO3VHHEGgM1/qb/9SNIVyZygcZ79
 YbT0EcMqyBMbEZt7eC3ODQKb9Jq7PmgcPY99s2jU0dKj2CA5sQnjuRYTzrcHGeKjM2YKbRWK
 Dsnfau8FGbCAoqh4mAdzc4t6+pnay8qLvWJTo9QzI34giHij2lrJb8Dhijxx8bFxdC260r/2
 TpmxHwovzLiYD69jbsk0voq7hGktrozdVOQOSKl8guMz3pziKlfp5oVbGutC085Muv9FEput
 /RpApIBbUz11rhOkWO5Tf90Qjp1zgjr1fk1F+jmHPm5ff0QTorYvAxyL5xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqvlDcmwtmrccjy1hkFacOYr5YqoISuGlPFo0bIS784Ic7VM
 FzEcDn4upMe1/yVQGagoBW+q3qYp0PJGbBfqBb0fbligS+3UoJjHfw/fZv2kvpr/kGOsF5D4
 2uCNUaqFlMJvVmJ56VSt1xGvdepwT2MFvx2VmpUCDa/Zc8SjnwQq7MkcAIDd6RCes1JbsJ6d
 j8uQBjxCEPk3yHM7zH4HQMyGGWfFmA
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="50774808"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ge5l5VtOpO0p3cg90H5LZ7paQOLsipBv9fCDBPzMwZ6ruo2urhOdvRcfxIzqavAjAHCG6xmKJATcqTR4ZGcwxUG0X+fNufwNWkP7zIqv6a1lu/azQjduQmRtNM9B64P5Y+k+qtwt7GE6ikoTe0tfgNHeCVSvzo6DehrgDe7aLP6REAKYwHZTGmZ8oG1yBgFEjXOQxdrgs04abBKDiNNoMOHkYryJBgR5r/aauAit62Lrtl29LsMN606PDjuF8vSPiQRc8i8fR7uDzm4G8e/6jh8fgUtnQCQnEQy0Akgpc4wBIJn0EEKTecWQk3TmmveUlbAzV1zF4zHMNTyK5RSVCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqj61IAy6MZ17K6/1ZqxTDC5GkKaLjnkao9Mp6K3Auo=;
 b=U+LcMvOjtCVLats/rPR0HuKYmdOtKy9/LzN9jJ4HyyM5rEu0NbPn7HSprGAvxdnK+ASuN38vPsbXe1Xj7PHM1tqmV0kgDEDv2bgnXgy7mWGgV2AVuZ9i9By6rN7Z4QmZwX7xkJeZu7yyTLcNiQrHxA6B+0d/Q+nlc12sh4TcjFBWeE4SpfahGe4rKOb11d2NTJphuEgpIgvIvNfA3ioWPzfOlarGJyGB3XE+PIMvt66nFYPxNkch5SQQOBM63D0zFvurffXTmSRJupcFFCtzHa560dET87KP1lWNIGl3WLVLUTnsTXWUaDoNXvPVX0egOFnCiM2KsoAEb+qBp1USfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqj61IAy6MZ17K6/1ZqxTDC5GkKaLjnkao9Mp6K3Auo=;
 b=Gn39XDf2g/aXuIkoK/k0088lZr4/qsItw78S5CIedBmim4Yd002Ren5oVgRR0+QanW0PX55cRvTkkPhW1WqIW8QecYnIpx93mSh2we0dFOjHSLZaPgXk4rRY3rOXPPrH7EkKjF1jRXj5PevVNbzsO7/FG/NLV58zym/qoCGsj7U=
Subject: Re: [PATCH v3 4/6] x86/gdbsx: expand dbg_rw_mem() inline
To: Bobby Eshleman <bobby.eshleman@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich
	<jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, Jun
 Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, George
 Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <cover.1629315873.git.bobby.eshleman@gmail.com>
 <7833b4a327212ff0fc816d17f91fa09291d6afc2.1629315873.git.bobby.eshleman@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f79cf6f7-0203-2d0e-99f7-effe2fe39880@citrix.com>
Date: Tue, 24 Aug 2021 12:32:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <7833b4a327212ff0fc816d17f91fa09291d6afc2.1629315873.git.bobby.eshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0409.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f383ac89-d8c1-4678-12d4-08d966f2e078
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6272:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB627250F75069600A0ACDD82EBAC59@SJ0PR03MB6272.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MTEaykyjelGIgEOpnkCnPRn8qYzpTcFpp9/NlfAUIFnJRb7c1YYEfwsWnUeUN3iqFVA8FDPrcak/dtCR4v+2yplUhzmnBlw1iqtVhELkesQF1kkFWce5eMWENJoAP83/5Adj5cRSUusyV8P/hgQMWGGunZ8tP+dQkh7UazOpPnUwKh0+GHr7qX4j4xnPsMFcI5Db778EqaCE0Lq7Z+/hUR7T9n6lULh2qV0AjOupz+zX0D0DMsGHxNopv5uaZZeyKnB4mMlwe7Jhcp89fi2ARoTJI7nF55JH57mZw54sRiMYDCHY7aSNMILt3kCbKvwgOUjdeRQnwkvY0V0jORtQqyfG98vbMp19L+kI6QQKwO1hHR6hekjM0KiqF0XgbCvofaGg7ybIBnO4osbzVwvqirujyMqtOL67nRL0Bg+pJMCuEM/oyr5/15zbk+whPFfawg4qUfpdf+e1Mv6I9fnDrHpqMX4p/jRmsHNeDzP29nu662e6drvsWqxy5XEDFAvZuQBtj0d74K9zeGl29d9uApD15CfMJKcJdo6ktrnGe3uCoMZwt1JDzIiR6z3C2+NWRjjE20W+saxoHBzlbf3nfqBUfBRoUWubKcN3W0G6jjuN7/PFouCf4kJaNHekSmzWfMXrZG00VF8voqw/uwBwkhI85h1AQXMVpWLaAXAgjbf1eDZ4qU6IdMI4zBgpYo30r6j2AOmArWjkCHC9Hk7v09cY2nZCrq+jaWx7l5i1ICc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(31686004)(316002)(66556008)(66946007)(478600001)(5660300002)(66476007)(6666004)(4326008)(6486002)(54906003)(2906002)(956004)(2616005)(8936002)(186003)(53546011)(38100700002)(86362001)(558084003)(7416002)(31696002)(55236004)(8676002)(26005)(36756003)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dm9GMWlCaVM0TlNZZmFRbU1PNUFhNk9sS0tGZDBtTDc3ZUQ5a3AzSXp5dk13?=
 =?utf-8?B?RDJZMjAyY0Q5YVFCQWcwanNvVjZLREVXS1F4RzdKdnN3SkF3ZWlNd2pjQXRN?=
 =?utf-8?B?QTVZeWhuRVoxcTNKQXhGdi9WUktwQnhhTmNHSGtEamEzZkVOQWRTT0lieVFr?=
 =?utf-8?B?R0YrdGNNcHBLRTJUcHlOcCswa2RpaUJua0QxR1FtNk9ER2hZUkVYM1ZvdGtS?=
 =?utf-8?B?SkpUckNvT2xXUmVXeStHMHZhZnpDZzNDbXI4ZUE5RzdRcFdHSnNkUUxqMnp4?=
 =?utf-8?B?QktMaktuZVpuWWpCaVlrT0RndjRiLzlSSk42eGFOeTEvWUNXaWxGUUl4aHFZ?=
 =?utf-8?B?aWp6dTQyRy9nQzU0RlE3MTF4aWh3NDBXd3ZQbFpmdUlXbHlOcmlkZHhNaVpT?=
 =?utf-8?B?UXN2elNwaE43VHFCYXh5dXAxU2Zva0xmSThUcjU0d1FNTDVJY2R1YUtrYUhE?=
 =?utf-8?B?RjUwZDdWWS9YTXpJY1lmNEtIQzdtdmJKUDAwZ0dkcmZvRUlXZklubG9GaG40?=
 =?utf-8?B?Y2JLT2xYS1ZXU2VTMlV3VnB1WTRnQUt6NkZRNk5QZTlPVzJTeDc1Umh4VHpM?=
 =?utf-8?B?TVRLL3JkNW5vcDVDc1lFTUdwN3FhSVhNUlU0RFB2UWdpTi91Z21Na1ZndHNM?=
 =?utf-8?B?Vk9MNVFLNFU4ZEcrZ0FCbGp5NkdxL1phK01ULzRaYkZhNjlTOXd4UzFhZjdM?=
 =?utf-8?B?RmVNczdrQmVaaDVYQzFlUVA1QVg0SFZzdVNyMmsybnIvejE5SDdjUkJWRUF4?=
 =?utf-8?B?Sldrb1JrZ1RBd1cxV2ZnNWtqdDFwZEFuQlZ0RWV0YmdEdUI1Zlo0WC8xWjdw?=
 =?utf-8?B?OGhCOFI0aENweGJzcTZMVlRReFkzajhDUmErZmw1WTN2SmI5cWlKRUlYb0ky?=
 =?utf-8?B?V1dpK21SVlZETlozSmpwbTAzckNoVUpPRjVrMnIyL04xU3p5NXNYcjMyZTBL?=
 =?utf-8?B?TzRXSEFyY2FyWDdEU1R3ZmRpQ3BhdzNrOVhDbVZsczYxTHJNUExKZW0yeTFG?=
 =?utf-8?B?c010TE9ETmdCbmhZTVNNR2pUeElYZThsUi90WElZcFloRERQMmRRaXFHMDZa?=
 =?utf-8?B?cFBhTXM3Qm5WdGhyanc1VXJuQ1poOW1yVnpCSldFVC8wZkFlbnVWbS9HcmVz?=
 =?utf-8?B?bnlxZFlTNUx5ZEQwc3ZUUCtqSGNBR1Nwek15eTlCN0xmM0RhUTQ1RUJLZnBT?=
 =?utf-8?B?MHJZa25pdTRKSkQ5RmxiSGF4czZGTjBreWFLeVRaVDFXaUpha1VscWJVR2Jo?=
 =?utf-8?B?MWo2TUpNWm9jSzd2MGV3c0tqREk2QUdxdzM4V2k4ZEt5OEJHbEhLSnBCT0hu?=
 =?utf-8?B?OUl5UUp0Y1ZTbjdPT0N0RzgrZjBIeWptbXNINFRFT2dIUXNvUnoxTHl4Qkh1?=
 =?utf-8?B?bjVmVjlUbHQvMEZWa2o3TThmUXRQdEpFR1lhYlRsdFZqYS9qcmU1QWFKay9R?=
 =?utf-8?B?SkFPVWF2TVZ0ZzkwczZMaCt2bnpsZFJBRlhzWWpuMzNWbFJoM0ZpZ0l2RitN?=
 =?utf-8?B?SFBMM0F0TThqUE92V3JBQk5DbWx1cGNZOE1jck9rdDBvNGVCOUhXT25ncXZa?=
 =?utf-8?B?RnFvQUpiRUVaNGF6Sk1kQ0k0MWlMOHk3dDJxNkZmSmdrV0tzdW1NVTJCTXd1?=
 =?utf-8?B?SWhFWXhlRkFDRjhtRUFSMk9kWnlYSlFtNGdEcTV5MEhEci9mdm1GamhEZDk0?=
 =?utf-8?B?eG1tcUJMN0QyVE9pQUdJR29nRmZPYVVhUnBydkh6L3VTbEtZL1FZbWFuOXIy?=
 =?utf-8?Q?+c4+S/AiCkOZGPBhN6JVXEWKnA0/kXvPKzI58Hi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f383ac89-d8c1-4678-12d4-08d966f2e078
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 11:32:38.5379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TmB/dbhvU9aTxDrKZTqWnDB+ZD/MGel41Ua737+m52MtCg5GGC65dQ1vkYwfyF+hYBGKO4IadRHnXHAJl7+LYWRLz7wAeVd9B+4qjo7DKiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6272
X-OriginatorOrg: citrix.com

On 18/08/2021 21:29, Bobby Eshleman wrote:
> Because dbg_rw_mem() has only a single call site, this commit
> expands it inline.

Missing a SoB.

Otherwise, looks ok.

