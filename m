Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1A03FDD46
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 15:49:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176429.321052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLQbo-0002Gq-9U; Wed, 01 Sep 2021 13:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176429.321052; Wed, 01 Sep 2021 13:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLQbo-0002Dw-5X; Wed, 01 Sep 2021 13:48:56 +0000
Received: by outflank-mailman (input) for mailman id 176429;
 Wed, 01 Sep 2021 13:48:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2BIO=NX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mLQbm-0002Dq-Kg
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 13:48:54 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 580d6a66-0b2b-11ec-ade8-12813bfff9fa;
 Wed, 01 Sep 2021 13:48:53 +0000 (UTC)
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
X-Inumbo-ID: 580d6a66-0b2b-11ec-ade8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630504133;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Qh3XfuC09YdLPSqmBa5G4bMkC4fwUMe2iEY/h46nkQ8=;
  b=CW6sGQCzJwCCS7ZbuDN4Oq+OHUTRId554N65EV7BwcoG1hQ1tgvDywrP
   +sLwsQj9/dOpZh8mlR2xT1Yuw525jRW/3mvrtG0sVDdXK78WxsDvR9sJ/
   9Yy1yiqv8PvKJzn9dm2cwNvYdshgt/OK9TM4df6updgEbupt6pRLIsTUZ
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jPi5RsrDq8vGxVA0R5jGxt5cenwvNBfmBZGDQMKiE1AFYKURsTUmSTbwQra4o5dyL59hBeY8ZK
 4idzOWHFaBF7g8iREyL1Yjhi9Pq/4Et2hc3Ae04KWUWZc+jd14hUvsxjO1y9Ai0mtOvwf7MtyG
 +d/olGD96J2WM3+a3UCASXQz4xcTZ6Wb9XCs5f2emQn5Vozut7L8Cu1k643/A8easgzRZnWRNb
 ElncjzE7/9IpFudkEtNW9GkpgvOffpKe6SHHq+gtpTOkQPmiLt7tJUwmRnK6XSyJ+ht6Q3pJB0
 mMQOBniVUtDseSIDuJ68S+49
X-SBRS: 5.1
X-MesageID: 51396146
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:+WB0G6P5PJ+DH8BcT1L155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/+xoHJPwPE80kqQFnbX5XI3SJjUO3VHIEGgM1/qG/9SNIVybygcZ79
 YeT0EcMqyBMbEZt7eD3ODQKb9Jq7PrgcPY55as854ud3AQV0gJ1XYJNu/xKDwOeOApP+tfKH
 LKjfA32QZINE5nIviTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Sv1
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfp2oCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8DDeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NpOTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeTP003MwmNG9yUkqp+lWGmLeXLzMO91a9Mwk/U/WuonprdCsT9Tpf+CQd9k1wvK7VBaM0vt
 gtn8xT5cZzp/QtHNdA7dE6MIKK41z2MGDx2V2pUCDa/YE8SjjwQs3MkfgIDN/DQu1/8HJ1ou
 WYbG9l
X-IronPort-AV: E=Sophos;i="5.84,369,1620705600"; 
   d="scan'208";a="51396146"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hni2p7i6o8Fc8nMMgBLTmo2PuGG3ZzI2f1YKH8ioqFl5Y0hawo8p/+r3zXsx25d7brFFws0ha+mm6IjE7Z3vaADbFh2tg+sl6ZEIb4Z5ggWsJSvdUZjj6tYR/FCczpC233kYkuXL8coYz3rKgqc+fuZPu4VYF8ycxodSUaDeaZRo3P0oRZmx/jgWilBJssKI4uwmKVWzpmDtbUdK79ra1BJIdzi6mtr34rlQNGUG+CmlDyUCmELKndXSFxqQdmw26aofilFlHCweTiHaB+wQZNBgc9Aa6u1e1JXtfpB9ljK5s8w1wS4FtWwAdeNA5j9VFhAZffFrjCaYi9/3Iw6R7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uko84/08g7wVwgcKSsgJA9ORW/fkmuAIxaRx9UBpIw=;
 b=Uj8PqFGqRk7J8OifrZ9KfBd0j+3oqnQS7sgKSgUA4CMt3t2NQrlaQm5Eybjnl/ht1J42QWZkvMrOGlYLX7cH9F7Y61gwl4jVdSlUNHalGrZZXJ2yrPWul5Yt9RxVz+tZtoQKNIWo7lzroLgKU1iIU43mUdRcfGdpneF7CLVCnhHLULDzRgWWjxdjyBuJJeivpKxagzI7sxXMTEtdK4WayYg+grgbTgl+pOofu4mKHkvrMrnUpYtYPctpv+E8rRWk0t4GASMQ0NubXf8SskkNy8swP0VHbg7YZn9VSbfnBU895VUBlwKpUNF6WQ2vxiK+WwJe8llMNyTgXSwMzb69yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uko84/08g7wVwgcKSsgJA9ORW/fkmuAIxaRx9UBpIw=;
 b=e6xzsuQNFBn1dawlLa4DZOmsiO70TtY6lujay/4cOzQoR+dffOafwYTNYRnD7oHK3T6suTR/WeSj3lWYkY0VDvj+nauJROAKUATldr9aKdxiFcViJYKGJh4U7GRYUzEKHJRr6uHYP74Sr1jOIWiRIj+NW2TsWnONJb6NR7CQAzU=
Date: Wed, 1 Sep 2021 15:48:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/4] x86/P2M: relax guarding of MMIO entries
Message-ID: <YS+EqCZUAsT/WTBX@Air-de-Roger>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
 <93ecc397-1293-69b1-e70d-3c5f9317229a@suse.com>
 <ad1e33b5-d729-2680-7f9f-aa875c2d9cfa@citrix.com>
 <f684e203-9967-8653-d59f-ad11f5070aef@suse.com>
 <7f56c625-eee6-31c4-2d6f-bd7334867d83@citrix.com>
 <5d69d4c0-7a04-c3da-f971-616363c6d63d@suse.com>
 <YS8+72EY4FrvSSIx@Air-de-Roger>
 <ca3a9559-b95a-3b32-781d-2a2abfa50dae@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca3a9559-b95a-3b32-781d-2a2abfa50dae@suse.com>
X-ClientProxiedBy: PR1PR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::48) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc2a53e1-0d91-4a32-74f5-08d96d4f2e4d
X-MS-TrafficTypeDiagnostic: DM6PR03MB4763:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4763BDD5F958E101FE584B268FCD9@DM6PR03MB4763.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n+IbpYeOeTMzhjFzLAJz9/6ouWC2LTS4xhC/baz3NqHVWeIvvcX2Q9rnSZE5J5h6+GKUzSC5c2mWz2LMewH+2kAXB+g1Wm6W08An21ZdTCGMFgf2cdhFmj6+Dv0b3M4hZVFdWpjFrWr2Vp5CqXUbigpXVrbNoEj1SxQJDFD/SBnqQmkIy+xNmWCX2uJEpf4sKR6gQqTsHpibXAgxpdrQCY+/KjCd68XHlkU9GZC82sFkdhh/Xogu6xyNVhRaAitsyrdobEDmTLkM5Pwf4Il9Qsbyb+JN14aPg8Xo9qRsP9+mhUsmSrUMVE2y2RoXrWN8HbOYK4n8ogpfcLaJoWTA2czG8nKMCk7PvbFCOKOO0C1bAMciy+uORDYDh+7r8pe8gjvFcPi1sYObgZ0AzZ9pZ8aLSa/0hYioK98undPO0MeW9BWIm/1tSy+y7oUB09RNW3b4OgLyBVzCM0OeIzfAz4PnBoiq38RcDN2hA54p1Pp9vU4Eb520yRQyOD6zH+59k89ubMF96TdZG7yACLwPJrWjOHzsvza1qsE2RyIhmiAdDhuA3EWrnAyhGJxo1pI5M+ydq3EHGN9dMYk3oJUagfe9KqvX5Lh6WLd1zFtNSdTxlyGIW3biuLkaAwWqMheBA9y1OTYqfTwJk6vIPzDkaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(38100700002)(86362001)(4326008)(53546011)(9686003)(66556008)(33716001)(956004)(5660300002)(66946007)(83380400001)(6496006)(6666004)(66476007)(8676002)(6486002)(26005)(186003)(2906002)(478600001)(316002)(8936002)(54906003)(85182001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mi83anFXVytGeXNndU5RSFFzRXpSa3FGMDJxL0ZiQWUvQThQekhacW4yV21W?=
 =?utf-8?B?d2dtVzlkTmtlNmVQVEptZzVtNjZ2bTJzNHU5TVkrSE1BTEJ5cXRkOGZxTnpa?=
 =?utf-8?B?bU1tOXRNb25wMHNrbTB3Z1VWMUc5aVUydXhoNGNoTnYrRXA4SmpjWkUwVFpE?=
 =?utf-8?B?Y1BEWTNSY0JrdDhxelRRQUMvRnRsVnNvSkV3T01zMjFYMnV1WkQ0c2k5aHRR?=
 =?utf-8?B?ZDJSVkRnTlZLejhSdlA3NDBkRlUzTzMweG1KcEVXL1RoeFNmdkR4emdTUVZx?=
 =?utf-8?B?dE5WVG4yMFZsNllZTHA5SGZHcm9CK0RTL3lvVkl0cHNkNXFyK1ZpeXdneHAz?=
 =?utf-8?B?b2FCOGhBQ0VTL1BscG9xdk5kdklrUjdmaEpyZ3A1b05LUWF3bUZxUG9zRFNn?=
 =?utf-8?B?cXIyUmc4RWtRckVYRys0MlhBeTdjVzhuV1FmYUNMa0hHSVVPU0d6Wm5XbEpF?=
 =?utf-8?B?SHdJanBrSFFBbFN5UFNYd2FBQ2FGWXV3amNlVVhma1ovcWdReHZ3WmoxTTBK?=
 =?utf-8?B?UWJsc21UTk5RaUhFa3R5SGdTMXA5RmpPcjBwVmJEQ2F4M1czaVV3MGR2RlBn?=
 =?utf-8?B?QmYvYWJ3UHQ1Yk5Gd2IvUi9EVitWUlhTalBhdjZ5clFoWGlKQmMwUlpCU3dI?=
 =?utf-8?B?Z3hYYnR5TVMzZmVHQUNEMXYvTjhVdGVoWE9NNVhwUlRoRUROTWNZRzNkcU5C?=
 =?utf-8?B?TG5Kc0g1OXkvOXRNay95UittclN0TUIrZTY0a2grelRwMVdrSExjQjdncnBH?=
 =?utf-8?B?SEhoZzdjbWwzTHhjSkYzcVU2bFh6WnJ5ZU1WQ2c4Y212L3d1Q25NVXE1RmpD?=
 =?utf-8?B?dlBudUVsRHpzMUZVWGVuTUVOREJzZWlBeURteDluMmJsSDl2WHBFaVJMcmVT?=
 =?utf-8?B?R2RneHlyNW5hdHpWMmREZlBSRDB2dEJTa2JwZk1JeUZBZ3cvVHFxdEZ1ZC9Q?=
 =?utf-8?B?b01uZDI2UzZWcmRkYytvSDNwLzhBd2o0S21xL2FBZExjNHlqWTRzV1YzTHhV?=
 =?utf-8?B?c3IwS2VvSnpTNjJXY2o1RUxpdTViM1l3R0ZBdGFTdmx3dlJGcWVVNlpDWFo5?=
 =?utf-8?B?aFlSeWFkT1Q2VTdldW55MUdhYUVPUjFmRVBxZE5sMXpNcWI3YWJBOU5lZkFP?=
 =?utf-8?B?T20wcjd5WWVEc1hIV01FRjN3bUJTeXF1NVdKc1FsL0dOQ05YejBNZWVBZWQv?=
 =?utf-8?B?eVE0ZG5jWnZKTjA3VTUyQlhIeEFnbGlWUlZ6c09PK0w3c0xDVTlsTnhlTVZh?=
 =?utf-8?B?dUlSeU4weXZmQ0dCOWRCQ1NrY2xQUzc3OWZXUWM2TUsvOVZUQ3ZubDNGUWNy?=
 =?utf-8?B?ckowU216YWc5N01vOGN6Lzh0ZkpyUzczMWpWQTNSUVFyNzQwMS8zaDhNNnBU?=
 =?utf-8?B?b2RKWHVyS1Q5dFRpd2hHdTQrL2h1dUUvNHZEYVBsT0N5c1Q5bzdWZ0N4Titw?=
 =?utf-8?B?WDVreGE2TjBRU201OWlHMUlpRjkxN3hhY2ljdE9BSFZoOXBlMjdWenpSSHFa?=
 =?utf-8?B?UGorK1VCeEFxYjZNUzB1QXo2VGhlci9qRjh4WjYwakxhY3lZQTg1c1RQYVF1?=
 =?utf-8?B?elZ5TExHVnh1SHV2bG15VG1sMWVzNFhMZ25uOENaU1EzZHpGamxIbFVIWGJz?=
 =?utf-8?B?YjNrYkpHc216b1Z4dUZlSG9ERnl6QmRwVlpWTlR5cTZ6T3NpWjN6NHNOTTFh?=
 =?utf-8?B?elN1d3BKTm1JSVpzYk9aZGNsbmlGdWorcFc4WDJHbm1VU1o2emV6MlBRM3hq?=
 =?utf-8?Q?CUtUxC3BQK2i+ycnuqxYZl9ibNylvKXqZ1ZmuUA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc2a53e1-0d91-4a32-74f5-08d96d4f2e4d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 13:48:29.7442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tb2SOovK+89YBZvcjbFbxzluKwpHXZ/FYuQG6mY86cqbfyk5J3cwO+xYib4uw1KPjSwiGTg9BlrIY+jdob5K6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4763
X-OriginatorOrg: citrix.com

On Wed, Sep 01, 2021 at 11:53:03AM +0200, Jan Beulich wrote:
> On 01.09.2021 10:50, Roger Pau Monné wrote:
> > On Tue, Aug 31, 2021 at 05:38:49PM +0200, Jan Beulich wrote:
> >> On 31.08.2021 17:25, Andrew Cooper wrote:
> >>> On 31/08/2021 14:26, Jan Beulich wrote:
> >>>> On 31.08.2021 15:16, Andrew Cooper wrote:
> >>>>> On 30/08/2021 14:02, Jan Beulich wrote:
> >>>>>> Further permit "access" to differ in the "executable" attribute. While
> >>>>>> ideally only ROM regions would get mapped with X set, getting there is
> >>>>>> quite a bit of work. Therefore, as a temporary measure, permit X to
> >>>>>> vary. For Dom0 the more permissive of the types will be used, while for
> >>>>>> DomU it'll be the more restrictive one.
> >>>>> Split behaviour between dom0 and domU based on types alone cannot
> >>>>> possibly be correct.
> >>>> True, but what do you do.
> >>>>
> >>>>> DomU's need to execute ROMs too, and this looks like will malfunction if
> >>>>> a ROM ends up in the region that HVMLoader relocated RAM from.
> >>>>>
> >>>>> As this is a temporary bodge emergency bugfix, don't try to be clever -
> >>>>> just take the latest access.
> >>>> And how do we know that that's what is going to work?
> >>>
> >>> Because it's the pre-existing behaviour.
> >>
> >> Valid point. But for the DomU case there simply has not been any
> >> pre-existing behavior. Hence my desire to be restrictive initially
> >> there.
> >>
> >>>>  We should
> >>>> strictly accumulate for Dom0. And what we do for DomU is moot for
> >>>> the moment, until PCI passthrough becomes a thing for PVH. Hence
> >>>> I've opted to be restrictive there - I'd rather see things break
> >>>> (and getting adjusted) when this future work actually gets carried
> >>>> out, than leave things permissive for no-one to notice that it's
> >>>> too permissive, leading to an XSA.
> >>>
> >>> Restricting execute permissions is something unique to virt.  It doesn't
> >>> exist in a non-virtualised system, as I and D side reads are
> >>> indistinguishable outside of the core.
> >>>
> >>> Furthermore, it is inexpressible on some systems/configurations.
> >>>
> >>> Introspection is the only technology which should be restricting execute
> >>> permissions in the p2m, and only when it takes responsibility for
> >>> dealing with the fallout.
> >>
> >> IOW are you saying that the calls to set_identity_p2m_entry()
> >> (pre-dating XSA-378) were wrong to use p2m_access_rw? Because that's
> >> what's getting the way here.
> > 
> > I did wonder this before, because I saw some messages on a couple of
> > systems about mappings override, and I'm not sure why we need to use
> > p2m_access_rw. My first thought was to suggest to switch to use the
> > default access type for the domain, like set_mmio_p2m_entry does.
> > 
> > I have to admit I'm not sure I see the point of preventing execution,
> > but it's possible I'm missing something.
> 
> Well, what good can come from allowing execution from, say, the
> IO-APIC or LAPIC pages? Or other MMIO-mapped register space?

map_mmio_regions does already map BARs with execute permissions, so
it's just some MMIO regions that get mapped without execution
permissions, which makes all this confusing.

> Insn
> fetches might even trip bad hardware behavior in such a case by
> being the wrong granularity.

Normal reads could also trigger such bad hardware behavior, so I'm not
sure preventing execution provides Xen any more safety.

> It's imo really only ROM space which
> ought to have execution permitted.
> 
> The issue isn't just with execution, though, and as a result I may
> need to change the logic here to also include at least W. As of
> one of the XSA-378 changes we may now pass just p2m_access_r to
> iommu_identity_mapping(), if the ACPI tables on an AMD system were
> saying so. (We may also pass p2m_access_w, but I sincerely hope no
> firmware would specify write but no read access.)
> 
> Similarly in "IOMMU/x86: restrict IO-APIC mappings for PV Dom0" I
> now pass p2m_access_r to set_identity_p2m_entry().

Not really I think, as PVH dom0 is the only user of the
set_identity_p2m_entry call in arch_iommu_hwdom_init, and we should
never identity map the IO-APIC range in that case because a set of
emulated IO-APIC replacements are provided and those require ranges to
be unmapped so that accesses can be trapped.

> 
> I suppose an underlying issue is the mixed purpose of using
> p2m_access_*, which possibly has been against the intentions in the
> first place. We cannot, for example, express r/o access to an MMIO
> page without using p2m_access_r (or p2m_access_rx), as there's no
> suitable p2m type to express this via type alone. We may need to
> split p2m_mmio_direct into multiple types (up to 7), I guess, if
> we wanted to remove this (ab)use of p2m_access_*.

My main complaint is mostly with the fact that some MMIO ranges are
mapped without execute permissions when mapped by
set_identity_p2m_entry vs map_mmio_regions that will map them with the
default permissions and that has execution set.

If the mappings from arch_iommu_hwdom_init for example would use the
default permissions that could solve quite a lot of the issues there
AFAIC.

Roger.

