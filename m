Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDE936CAE9
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 20:10:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118842.225159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbS9e-0003Rs-Vl; Tue, 27 Apr 2021 18:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118842.225159; Tue, 27 Apr 2021 18:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbS9e-0003RT-SP; Tue, 27 Apr 2021 18:09:50 +0000
Received: by outflank-mailman (input) for mailman id 118842;
 Tue, 27 Apr 2021 18:09:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D0mD=JY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lbS9d-0003R8-Sk
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 18:09:49 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa5fdbeb-668e-453b-b05a-f57b2b8e9dd3;
 Tue, 27 Apr 2021 18:09:48 +0000 (UTC)
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
X-Inumbo-ID: aa5fdbeb-668e-453b-b05a-f57b2b8e9dd3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619546988;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=1AvFKeOrp4+O/HvBaERDw6y5ogw43qaHXbedk47mTvE=;
  b=eSPPhJxqEN1EAXWT+ENFzN5iFQxHTM4lS6qQV0Ww5X3fLlbbX8f/yqF8
   oifEMy+xDzxiYYWB5F6ZVqb3rSRhDZHtRVXODE373EHJ9NBeVwwAN3qkf
   B9p20nRbl4Q+jplgtrcIhommo56aai9vW06xoDW3Nj1Nekmfn35APaKVZ
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: C/I8yhMGUUf2e6ZOJl+Msqrhff7KIEWzWtcBrCWAzyNqh7zL1UdzHRPU318NC8D+pTAKvD/XAb
 9zi3WC+qUav3IHiGq2X7xgoNBIWjCBhMRlSMtZmh/m/8nx6jYDEF0S6HFED/a0hlngMoEEoE70
 mG4M+Hyx7LbmRodps5b2OvLVOOGlIzIcY0H4WjPIjmZhd6uuw9pES1Q4qHE98c0/o7eHTDKQoI
 zjo+Bg7tBPYdmRjIJOYVlQVmiNNktkGXtggO50VTwoKeQI1brGQvtLFGhCvr11FaxvaACqjf0G
 7VI=
X-SBRS: 5.1
X-MesageID: 42547804
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:O2ZqBa5eS4t5v+hxVwPXwXiEI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoexzh3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdxHW3tV2kZ
 1te60WMrDNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2BXQotLhj0JbTqzOEtwWQVAGN4VFI
 CE4NBGujqnfh0sH76GL1MCWPXOoMCOqYnvZgQICwVixA6Fiz6p77CSKWnk4j41VTRTzbA+tV
 XUigCR3NTZj9iX6D/5k1XS4ZNfhcf7xrJ4avCkp8AJJlzX+2SVTat7XbnqhkFRnMiO7xIQnM
 DIs1McOa1Img/sV0WUhTeo5AX6yjYp7BbZuC+lqF/uu9bwSj5/K+cpv/MhTjLj50AtvM5x3c
 twtgrz3fonbmKzoA3H69fFTB1snEavyEBS6dI7tHBDTZAYLIZYsI13xjIlLL47ACn45Io7ed
 Meav302fA+SyL/U1np+kNrwNCqQ00pGAaHTkUoqqWuokZrtUE84E0CyMMFmHAcsLo7Vplf/u
 zBdp9ljbdUU6YtHO5ALdZEZfHyJn3GQBrKPm7XCVP7FJsfM3aIj5Ls+r066MyjZZRg9up8pL
 3xFHdj8UIicUPnDsODmLdR9ArWfWm7VTPxjulD+plQoNTHNfrWGBzGbGprv9qrov0ZDMGece
 20IohqD/jqKnarMZpV3jf5R4JZJRAlIYwok+d+f2jLjtPAK4XsuOCeWu3UPqDRHTEtXX66LW
 AEWBT1OcVc/mGmUnL1m3HqKjHQU3262ag1PLnR/uAVxoRIHJZLqBIphVOw4dzOCTAqiN1yQG
 JOZJfc1o+rr2i/+mjFq09zPABGM0pT6LL8F1dDpQoANVLIYa8O0u/vPVx67T+iHFtSXsnWGA
 lQqxBc4qSsNaGdwigkFpaBPn+FiWAQ4FaHVY0VlKHGxcqNQOJ3Mr8WHIhKUSnbHR18nghn7E
 1ZbhUfe0PZHjTyzYO/jJIVA+nbX8JmgBiiJPNVrX63jzTemegfAl8gGxK+W8+ehggjAxBOgE
 dqzqMZiL2c3Qq0JXAHm+Q+Ol1UYGGxCLZLZT71I7l8q/TOQkVdXG2KjTuVh1UWdnDx/0sfvG
 DnMBaZYOrGGFZbp3Be3Jv76V8cTBTvQ2tALlRB9aFtH2XPvXh+ldWGYae+yEO9QFoPyON1Ck
 CPXRIiZidVg/yn3h+cnziPUUg8zpI1J+rHEfAIaLfIwE6gL4WOiIALF/JZ54xeKdjrq+MHON
 jvPTO9HXfdMacEygaVrnEqNG1Is3Eii+rvwwCgw26i3nIzaMCiVmhOdvU+GZW74GflTfrTj8
 k8otIxoOeqMmL+LvSB0rraajZfKhXV5U66JttY3ax8jOYXjv9UGZKebB7jkFdg9z86JN3vlE
 wfTL9giYqxcrNHTog3QWZh4lEtlN6zN0MlvQz9P/8mcTgW/grmFuLMx4CNlKEmDUKArjbhIF
 Wz8yVS+PHeQiuIvIRqfJ4YECBzaEIm7m5l8/7HX4rMCB+yf+UrxivxDlaNNJtcQrOCA7Mes1
 JT5MyJhfaec27d1BrLtTV2ZoJI/GDPe7L+PCu8XcpJ+ce9I1KCn++D59Oyli7+TX+DUHsj7L
 c1PHA4X4BkkTktjIo+zyi0ROjWmyse4iRjyAAisEXs1Iig6HrcBmdcP2Ti88xrYQU=
X-IronPort-AV: E=Sophos;i="5.82,255,1613451600"; 
   d="scan'208";a="42547804"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XjUZw2r3+XR5inio0OGo2Kw2wgCCw4VvDBfI41tMWcBIJ6S8tfkU4nPgciw/JjZFpS6W/JtbFxH6C5IOUxfYBDLBuwynfhjH6f0pXg5RjgPanaHjhT721etGxhtaGUMxt1a5tzVJ9K/3NbVgHCqAsc05tCHxjl1+b3Rx9rfG4o5Xp5mvN+J8fpVSUM236KaISeaF7kvxTm8DnGtL1OhEoDBFLF031zlqwXggbU/E8M72jIIgO1lgwxoy9JPQaOjZJ2qi29mR/94am8rAkn8cVheOeyBnlwQwLXs4gB1PBMaqnuyI4agzOxitvTPHrG4qbuTCVX4BzSa+L5/cwXNSag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8EtjslWbA3PPA9T1H+hic1zK3kJFLC2l/VM20RxDb94=;
 b=PWLfM8wVqCSHPEvoTlGyHAUggE91TiXKMGP5mcXqOwz8LhD8GKrK1hETvFvxueyKGHW9cYBSajsE91aRVipQK0Qza/+uczbJpT6PzDgQqEz8RXCBu6W47Dh1+ZLiMkKe2HweGMtZubkKf8rek/8zv5zxI4taLlOf7UVpmOj+Gim6J3VPWkF2MmNSQawpKV4Snct23FgqAqmZefAm31FofHofrv3R3Mwm/z7qH5Kx84etphM4GSV80mBNA7wIQ2g3czt3y5YtvJOpuh5apjp0if75ySpzdXWmhfUUXPpdajyoKov2BkTEMkYCK2RnAU5+DR5Q3fNAUp3S4OCQNCaFyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8EtjslWbA3PPA9T1H+hic1zK3kJFLC2l/VM20RxDb94=;
 b=n7916bY9vcu8ajBxYKxCNMDJH7VmZmhUsgcqJ8Tc+spyt1mcyNHtZb+yhFbxNGmyiFmBx7MmQ3flXMKlU3K2zTeEXOXa52sLloLAmhhYIc4A7MaKwq9f5ztMIc1FANvCVJ7sEeAkOGMqoLGUX5Cmoq0dFUpHVsOdFrncl7Lrdf4=
Date: Tue, 27 Apr 2021 20:09:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] x86/oprofile: remove compat accessors usage from
 backtrace
Message-ID: <YIhTYn668JwHgvqj@Air-de-Roger>
References: <20210427142113.31961-1-roger.pau@citrix.com>
 <3aa0fdb1-87c8-39db-98eb-26664a0569ab@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3aa0fdb1-87c8-39db-98eb-26664a0569ab@suse.com>
X-ClientProxiedBy: MR2P264CA0060.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0859e362-6d83-4792-69ce-08d909a7a293
X-MS-TrafficTypeDiagnostic: DM5PR03MB2489:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB24891A7B0E3DE6C85A29AC3A8F419@DM5PR03MB2489.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0xKCRlFUJwPqWdTzu2Z8UP3IMeV6SKOAYV+J9F9j0yhoD1Id6jGjvIgwFQfyX1+f51mr1TQyqrUxMRLgBk0M/S8ku6jQXh2oRW2n83CVWFJYWvTx4RkCVDZcItjg6NxfovcMbpKgB0Iba0Ffe347zND44LeCAHXvaOAojvyipl8gxFFd89XS4MqWSsVjEl2L7Su5w61buRn2FpwKmcAPFgnoSgP2HZpZ6GVlSL98PiOUe0Sg70UrhXkKWwzo9aPn10mj8FaExRnbPs6+0/98TForR4mhJNQPUEUkxLXiyo6wnnfOLJK1GuAuNhDpZv3Td2kmfaj2s3C9zNhG3rglchfCoYHaPruqcRrK69fJtX6+VGhGjZ18RLuBWaqsEauwDFbAZ470cwSJ6VbKSXVpDZGfSEkEm7FD2segsaCKxcSvd2HnSNAiPRRuiuaCGQ64IY3M5goly8lHL7PJMznQW648T+ePTLWgQ0hCvE8yNFHMvTMoUC/MOkSSqa398tsv4cwAIYURbsVecIi5RI1+tc7LC73/70jDL7BVRLRkQIPYP3aHtduAKMjkDAvOuwV5Nr90/HsjVkQv1sN1l1UE8gvPRhkOBatJm6nOG19eAgA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(376002)(136003)(346002)(366004)(396003)(9686003)(26005)(16526019)(54906003)(6666004)(6496006)(86362001)(186003)(4326008)(38100700002)(85182001)(6916009)(6486002)(83380400001)(956004)(33716001)(316002)(66476007)(8936002)(66556008)(8676002)(66946007)(478600001)(5660300002)(2906002)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dU5iRUZaZmp6TWNlTFFhZm8rRldPMkJCNmhTNkc4bld1TFRLb2pOVVh3dVVY?=
 =?utf-8?B?Wm1sNUlzb2xRa3lmZjNIa3hTSnR4WFBPL2taUk1yL0VWMzJwT2hmTWlLTzM5?=
 =?utf-8?B?VG0rZDE3ZWJRN0UvUjE4aUUyVzNnNzRCaDg1MHBJZDdqQ21lOEFHeUMxOGRr?=
 =?utf-8?B?WEVKd2FXUVZaT1dZRzdkZGgrT3FxNjk1L2I0QmhvWWM4VGxTVjJSemZqQnhm?=
 =?utf-8?B?RUxSSXZZSUd4NGMxMkQyWEVHcEpuVHNKaDlLTVZpTUovOTdRcHFwbUQ3b2d3?=
 =?utf-8?B?TlJxRDE5VlFBcWhaRlNUaFYvZEdBbm1DZHlwNytSYWk3c3BBSWVGMHRVdnN6?=
 =?utf-8?B?ZDFGRUxKUTVNdnZDekpZZ0ROMDJtQVlPemFxMVV5RVRzbmNraTVXRTFSTWEy?=
 =?utf-8?B?ci9tcjZPeWk5aXE1MzBaN1pPNjAyZGVWVmdSL29LM1lGZmpPS1UxOEFKQVVi?=
 =?utf-8?B?NXpKVG5ZSUdWODMyMCsxZ2tmeTAzVjJ3Yy9JZDNrcldBdmpBR2J6WmI3S2U4?=
 =?utf-8?B?UldnSWNnL0ZBWExqeGxrbjRwNXJHNTRPVzdvRTc3Uzhja0x4QmR0VTdENy9t?=
 =?utf-8?B?eFNudC9keHlGeVJEZzdSZnAzUFFIaE41cWwyQTJzRkUyMXVvYXNJKzJhcmZO?=
 =?utf-8?B?bEF1azJLVU93cm5jbWd2UTJjWjlTZnJsdVlyVVdNUkNDb0NER3FTQW1ITGdx?=
 =?utf-8?B?dXAzZ2JTSTJRQTh2ZDd5WHhndXZ4ajlsQWtBTnhCcFBmamJnbHBMU0dseElx?=
 =?utf-8?B?c2ZScjdQcDUwOEhHQVZyUXRzZ01rd3ZUdmVuYXhwazF6ZFpPbUVWWjJqSGtY?=
 =?utf-8?B?VmY5L0o4aHBsSW1MenNyMk5DYWZLa1JLTUNGVTVTcWdYZEJESXBUeFNmNURW?=
 =?utf-8?B?RnB1R3BUNlBsMS9RRGpVUCs1b25rbVhZWWZ1UDZiL290RktjNDNGOGNKK3NO?=
 =?utf-8?B?U1hnN05Ib0lrd3RVYVZZSU5XWmlGZHhZcWcxbTNFUStPVE1VU1pGMzFHNjV3?=
 =?utf-8?B?V0ZhT1pveXU4bklIOWd1elkwYnVsdWFrZVdRY0dDRk1ITUdWa0lPVElycFVS?=
 =?utf-8?B?QmZyN3BpR05ra2hYa0MxY05mUTM5MEN3cDNsT2k2VUJ4bkVFV0V3VWdMb1VG?=
 =?utf-8?B?cFJMcWM3QzBiNWtUREdDYStGaTNPYXVBeWhCZjZoaGxTZnA5Wm83QndwNGRW?=
 =?utf-8?B?MVRVd1RyTU5Ob1hRSzZlLzhmazdpT1l3aldhcDNHY3huYkQ0K1c3Zi9qQTB4?=
 =?utf-8?B?dzA5ZlFpditBUWw4aUR1bDBUT3JmZHBsVEFnbVEzTTlJaDdrQU1NSWFCVzZX?=
 =?utf-8?B?SjlTNlNzS3BVakttRGNVcVloczRZY2djRHRrZlA4MS9OYjdYKy9hUTRYVi9F?=
 =?utf-8?B?MkFhRkdETDNDekxQdWp6UjQ2bFNPT3BCd0M3VGpKYm41cCthS2FabDY5RzM3?=
 =?utf-8?B?R0V2QzA2Nm9UVEkxbUhqY2sxTTdBa0F2bGlHYVFqbDkrdG5PRUxyTjBLR1R2?=
 =?utf-8?B?SFRieG9yWDRCQ3h0RnJEZzFtNEVSZ2hvYlJXdWwvMDJRTzBDa2FSYzNHYUZB?=
 =?utf-8?B?SGVGbTZpazNCUW1mUXRDN001M2JYYU1nNlhEZGFSQncyOTlsNUZCMXloSFNS?=
 =?utf-8?B?NEZRWFc0T3F1U1I5R1djdUovSXNTS1NwdTduZDBmaDluM0tFUEgxWmhnOHdu?=
 =?utf-8?B?Z05uSVdHdlA3SVFhWERseFhkSEFsako0UFhSYTR5cy9iWDFSem84WWZsTE0y?=
 =?utf-8?Q?iI0sE4jEXGT8jOtzc8wXbHVYWzx3JOXg0io+4CY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0859e362-6d83-4792-69ce-08d909a7a293
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 18:09:44.3654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 78XrNRSGMpBpzs2c/y/nPTTt7TjLTH+iP3b03M+8YepGtUn4v6eBGbz7dvwquOePBxAKMOF5b7sENhjlhvNTTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2489
X-OriginatorOrg: citrix.com

On Tue, Apr 27, 2021 at 05:31:25PM +0200, Jan Beulich wrote:
> On 27.04.2021 16:21, Roger Pau Monne wrote:
> > Remove the unneeded usage of the compat layer to copy frame pointers
> > from guest address space. Instead just use raw_copy_from_guest.
> > 
> > While there change the accessibility check of one frame_head beyond to
> > be performed as part of the copy, like it's done in the Linux code.
> > Note it's unclear why this is needed.
> > 
> > Also drop the explicit truncation of the head pointer in the 32bit
> > case as all callers already pass a zero extended value. The first
> > value being rsp from the guest registers, and further calls will use
> > ebp from frame_head_32bit struct.
> > 
> > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v2:
> >  - Keep accessibility check for one frame_head beyond.
> >  - Fix coding style.
> 
> I'm indeed more comfortable with this variant, so
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Andrew - can you live with the 2-frame thingy staying around?
> 
> > @@ -51,52 +49,35 @@ static inline int is_32bit_vcpu(struct vcpu *vcpu)
> >      else
> >          return is_pv_32bit_vcpu(vcpu);
> >  }
> > -#endif
> >  
> >  static struct frame_head *
> >  dump_guest_backtrace(struct vcpu *vcpu, const struct frame_head *head,
> >                       int mode)
> >  {
> > -    frame_head_t bufhead;
> > +    /* Also check accessibility of one struct frame_head beyond. */
> > +    frame_head_t bufhead[2];
> >  
> > -#ifdef CONFIG_COMPAT
> >      if ( is_32bit_vcpu(vcpu) )
> >      {
> > -        DEFINE_COMPAT_HANDLE(frame_head32_t);
> > -        __compat_handle_const_frame_head32_t guest_head =
> > -            { .c = (unsigned long)head };
> > -        frame_head32_t bufhead32;
> > -
> > -        /* Also check accessibility of one struct frame_head beyond */
> > -        if (!compat_handle_okay(guest_head, 2))
> > -            return 0;
> > -        if (__copy_from_compat(&bufhead32, guest_head, 1))
> > -            return 0;
> > -        bufhead.ebp = (struct frame_head *)(unsigned long)bufhead32.ebp;
> > -        bufhead.ret = bufhead32.ret;
> > -    }
> > -    else
> > -#endif
> > -    {
> > -        XEN_GUEST_HANDLE_PARAM(const_frame_head_t) guest_head =
> > -            const_guest_handle_from_ptr(head, frame_head_t);
> > +        frame_head32_t bufhead32[2];
> >  
> > -        /* Also check accessibility of one struct frame_head beyond */
> > -        if (!guest_handle_okay(guest_head, 2))
> > -            return 0;
> > -        if (__copy_from_guest(&bufhead, guest_head, 1))
> > +        if ( raw_copy_from_guest(&bufhead32, head, sizeof(bufhead32)) )
> 
> As a minor remark, personally I'd prefer the & to be dropped here
> and ...
> 
> >              return 0;
> > +        bufhead[0].ebp = (struct frame_head *)(unsigned long)bufhead32[0].ebp;
> > +        bufhead[0].ret = bufhead32[0].ret;
> >      }
> > +    else if ( raw_copy_from_guest(&bufhead, head, sizeof(bufhead)) )
> 
> ... here (and doing so while committing would be easy), but I'm
> not going to insist.

Sure, the & is a leftover from when bufhead wasn't an array, or else I
wouldn't have added it.

Would you be OK to drop the '&' and adjust the message mentioning
Linux <= 5.11 on commit?

If not I don't mind sending an updated version.

Thanks, Roger.

