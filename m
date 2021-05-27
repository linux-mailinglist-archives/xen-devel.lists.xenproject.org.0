Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19072392C44
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 13:02:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132995.247997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmDlP-00053C-11; Thu, 27 May 2021 11:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132995.247997; Thu, 27 May 2021 11:01:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmDlO-000513-Tx; Thu, 27 May 2021 11:01:18 +0000
Received: by outflank-mailman (input) for mailman id 132995;
 Thu, 27 May 2021 11:01:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ln4B=KW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lmDlN-00050x-Ti
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 11:01:18 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c17bf8b3-342b-4a0c-a253-dc22831ef760;
 Thu, 27 May 2021 11:01:17 +0000 (UTC)
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
X-Inumbo-ID: c17bf8b3-342b-4a0c-a253-dc22831ef760
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1622113276;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=RqNFXvxyFdbL17SPtPEiEkNYQeKvfyRwO4Xv1F2F2m8=;
  b=iXjgPPXg7Os9kYEJO8duVuKUw0thqVHP5sY8TnfyMwmF/LEpQjLiDsZf
   kvOdOmUyupz9DrytUYr2vRtGaIIpP/JNc1+L0g9l20P5eyeQrBMtmR/V9
   0iwMIltPa9KnMVamJY8FKkiM/4CAhSrshfVhmcdb+aVQqtPEbqRofSczb
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: tazONBhR5eMUobFwgRRgP4qfpiTY6E2N2WO0J+pW4QNCE0UJDVwVQ2kx1zou/WwABmBD0pS4pl
 l91eA9oGZcYB3hzs/npLmehCfkrKxbVfXWynevo/SwRH+9D6vH0E/zVCbMxQw7sGMQ+IjmJhsw
 SU6XAH+syOoKkOZGRD0rXZGAKjHcU8GBOD+oZwQUz5WvN2t8Zz0v2cFiszDfbUntL73rFyQ9eD
 5S6dS3CXf03O6RcMgpLM8CiBYMVxtwB0gQeJbvf/AMi8FQzmdLFuGiri3610ju0QtbcBIsQTjV
 nzE=
X-SBRS: 5.1
X-MesageID: 46306345
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:qxN1Pq64iOA8urb+CgPXwDLXdLJyesId70hD6qkQc3FomwKj9/
 xG/c5rsSMc7Qx6ZJhOo7+90cW7L080lqQFhLX5X43SPzUO0VHARO1fBOPZqAEIcBeOlNK1u5
 0AT0B/YueAcGSTj6zBkXWF+wBL+qj5zEiq792usUuEVWtRGsZdB58SMHfhLqVxLjM2Y6YRJd
 6nyedsgSGvQngTZtTTPAh+YwCSz+e77a4PeHQ9dmYa1DU=
X-IronPort-AV: E=Sophos;i="5.82,334,1613451600"; 
   d="scan'208";a="46306345"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KvlutgYzS68JsIgLEEarRyjEyNYbBTbGrEir6rQ2u+uSlFx9sIk0hwPNCPhmwHYQmJ7Rs+ewapuMey7uCDgFbrZprzsRzvO7Wj/kkn3BvcY9EzpSFL61SavdrVm3VlYpBrmcDDBmhieeohTHMcL+c2pMuXKbcM3dmT55Zdkns1OkKBttm+eFWkmLnvpwvjQ1/YiOtLBC9U5wD4UCwR5aHDsuuAeircbPFgVV9HSSIohLJjLeayh0JT/fP1yglIYV1q3ln3L+p/b/gjZVoPZjlS4AuyIa2XoelH2ZKddKsKvr6r1h26WPCDjxKdk99wpNmdZoHe5/bcZxJweQ+k1oMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZWohDrMGQcVduKlbqEw/e22lgLvj4pTiJyrD26Vs48=;
 b=K38a5NcNvI/V+mvqWcObfSvfUTv2b1kTRJuQLUwmKoBlHUcLSFO3l4uLr2SFnIABw65Mi1nhWt7p587FFfG9V0ks7pEvqx//1e0nyFOqKffU+WvAumIPKBH+FDbknREoCwBYBNNh5ZbHrZ6bgaYixqwOKcdkgwmTjJ3rRDxvQsS0erecQpjWcQD6fQdQnKA4heqW3Ziwk30jWiyeAtJD3IxAlO86gpe32WSeLZV1Acuj9Oo1G56f3bowDMGmWLpodoeFw70vHwAVupmFyDcQBek+B8z/eJPQiQMFsPlCciASfiDAE2fgsJLc1fRRhes7djXOfutn1uVENLM/OGGWWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZWohDrMGQcVduKlbqEw/e22lgLvj4pTiJyrD26Vs48=;
 b=a8+TvhynfTLt4oY+w09UjBmfmipWQVqxO+zTnqZN3YpZjAMDmD3nPQvMhes+mynmulSpvZR9QiagvJQJkrTzxZ2cH7Nmwzyi/HvwkPfJtukHJCovhBZBZ8yzgRVjskPJGAzdYLQK0q7WyYu6EOqC6lZj1JBvvAl+qWR1ke1Uj2w=
Date: Thu, 27 May 2021 13:01:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v5 2/6] evtchn: convert domain event lock to an r/w one
Message-ID: <YK978wmwAZqQDEQZ@Air-de-Roger>
References: <306e62e8-9070-2db9-c959-858465c50c1d@suse.com>
 <5f5fc6a7-6e27-8275-0f05-11ba5454156a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5f5fc6a7-6e27-8275-0f05-11ba5454156a@suse.com>
X-ClientProxiedBy: MR1P264CA0080.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ba94242-4725-4eb1-9c8a-08d920febe08
X-MS-TrafficTypeDiagnostic: DM6PR03MB4476:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB44763A2F8C7C7BF629E775938F239@DM6PR03MB4476.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YSIz1m9yQlC9KK5u8bxcG0VkLFPYozDJl7nbABLx4U5igxMm3/JI/229R/lRdx98M8mRa+U9JzCPaYPJKRM45inu7t1t5BgAuUhf2jEFoj39xeumDIPujsM5UwNKoy2ryITxgt+ezHlyy37EGOKme2o4c7lXOoR0Tv/SHRVHpQxF7olp+w0NerTaJBItNrdUOrVB5xEJ3pM78EacaH08AReyNtyWlpJOEX2SRdGxspypfG3bmE4hA34uj1BUVkgK95VVPJ4WlmlS1c2H8A5WrV9OTEtUDexg/B/ByD6Xe5ASn0qpuzPNlcPvW52Cf/8snIQvNisSSJrTnCX8IjQQGmGhGQtq/Z5YCJvS/xMHducqfln3Rv/SiLDJxeVDqQfjbWkWI4b4IPMYxOUzMY3sBIC7HlkACt0pHGuWb5bc+s+q//n249VZM1U9b80MoRIMuU05FjZq9HdNCSa6yERO6JmpDC5Nzo9KixAPODhuM1jSzWkuLMTIM9BV891akMxGYb4+CNPox2x8U/TIg4Z3mjigIAGqboEBLg3bW6fNMXxFrDaaX/GKmdFb4A4Fg4UKiWhzSgTjvX7YU3RYBra8OGtXjcmaPVEMfmpCpoi42oY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(366004)(396003)(376002)(39850400004)(136003)(86362001)(66946007)(26005)(66556008)(83380400001)(16526019)(6916009)(4326008)(2906002)(66476007)(6486002)(478600001)(186003)(9686003)(6496006)(85182001)(8936002)(33716001)(316002)(956004)(8676002)(6666004)(54906003)(5660300002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WTNDbUk2KytiS1ZkSUM1RnBMd1ZhRGxBYkdvVU42VS9rUFlNTVZuQ2d6MEF6?=
 =?utf-8?B?M1NkMEgvS0lHYVUxRUwwU0l6TjF6Y1NNclR0dGFQSmZZSGs5ZWc1RENEdjNV?=
 =?utf-8?B?eEs2ZWE2UTVLSmd4a1ZpSU5zMmtZNFB2OHhuSjJ0d2tMMUlLQit4dG9DZ2FJ?=
 =?utf-8?B?NVZJY1ZrVWxVelltbWJwNFQ0QkIwRlJTNVBJdVFRQWhxaThjUWY5WndBVkk3?=
 =?utf-8?B?clJ1ZjAxWUh5cFljaFRDeS9BS0JoTFgzWnEvQlczdVA4THVtbkluWlJlZmdL?=
 =?utf-8?B?cHNENnZZZTNPdXk3cHNhT1NlckNRbDJiVHdVYVNLNkhHaVNWUDl1Qkl5Yyt2?=
 =?utf-8?B?anBaZkNBWUs0OFQyQVJWL3hzWUdUV3lmWmw2bWsrc3BwYVhJbWEwWUtWUXFR?=
 =?utf-8?B?a3AyYStkZU5rWXIxMVc4NGFJeXlDeTFkMVlnMlBJU3RhOTRpNVE5SUpBNUwy?=
 =?utf-8?B?ckdFeU9sMU9rZytPdXhrRmJwQlZONjIwcjJpREVpQ2daRndNRDBLOXErMjRB?=
 =?utf-8?B?K3VWSTZnMEZhN3ZRMm9GOUxNamxFTUxzNlkxQytDazUxcTMxTncyTUxJOVIy?=
 =?utf-8?B?M0tEOE5rNmlwN2x6Rm0vNkN1QUVXMUZNbURBaHdaN0NoeWtTUG0ydFptWjZV?=
 =?utf-8?B?a1Yyckp0U2wrQ1N3aTZ2SDJXcnJyYnN1Z1drMDNQcUUyVzVJUWJpdkZNa1VV?=
 =?utf-8?B?WVdad0xJVEU3OXhnNXlMeFVKd3BFekZsM1MvMVhFOW1DamdXNzdTTnZ4OGpN?=
 =?utf-8?B?TG5weThWZUM5MTNtcHRERzh6bm5OQkJMTWRqcVB4VG4zbGJSTWdvSGVBRXIx?=
 =?utf-8?B?eGlHbjY5bENkdk1OZHZXblJjQS8reS9kYlZUbEd0YjRUeEIxeStkTDR5RVNE?=
 =?utf-8?B?c0pVSlNxemh2TkltZDRsRmNyTk9pZDhQUWN4M1pyRTZGL0VUSnN5dXYwSGFz?=
 =?utf-8?B?aFZEM091bmR3ektFTTJVKzN0M1VWMCt3Ty8zVHdGYjJDK01UcjBiZzdlNkQ3?=
 =?utf-8?B?NHFMQzdya1dOcmllTDlTME5KSzZ5SUdsRXltRUQydWFVVlp3S3k3KzN2SkdP?=
 =?utf-8?B?LzlYbHFxVTJNdEZGcG9ZTXIrdVFYbGFobWdOR3JBOU5zcWZmNUFvTERvMzlV?=
 =?utf-8?B?dzhVUUt3U3l4cmpBL2VIWXAvUmVzTGJzdW8yTDR1SGp2WDFYd0dIdkFDanZC?=
 =?utf-8?B?R01RRWxLMkEwN0lRbjBrTlhBNHU3SjhBeU9JS1VST2w4WGJSSVVxMHhCNlN2?=
 =?utf-8?B?L2hka3dXOUJpSXZGd2tpT21rckVUK3kvV3daRmd4NzJuS0JEZzZQUmNHbVhQ?=
 =?utf-8?B?RDhSOVM2eGt2bE9KUmdCRmxSQnpzZUtSTFdWVkFpZ0ZpWk9WdnBYZTZPWFNH?=
 =?utf-8?B?TGdVT0xSbE1icllROVc5M1hrQm5RRmdsd1pORTE5K2JncHdXNVR0bVJlZG5Y?=
 =?utf-8?B?dm1aaVEzWU1YYkhyU055SDIvRHo1MWs3emVsY212L1A1RE11cEhWS0FkRncx?=
 =?utf-8?B?QUhQWEN0bFl3K2ZibFlrUCt2Yk5XVHh1M3oxbFBEcjlhZ3BWR2tvTUFYSWkv?=
 =?utf-8?B?YUIvWWh3UDA5NkQveHA5UVl4OFRZaFJEaTVGZmxrNXU5NW1RcHBieWdVU0pz?=
 =?utf-8?B?U3M0bjhTdktXalFpTmgxbjVmNlBtaVR1ZjVucFNmVmNNcVp6MUNUU0NHZm9q?=
 =?utf-8?B?ajZzVTRTcVhISVBNaTV3WHJtQ1RoZVo3bHFxcy8rdGtTekEwNVowdEVZVGhn?=
 =?utf-8?Q?pbV5eRhuiA83hPqrAe/HLBZ2TE8pFleiGHMOgR2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba94242-4725-4eb1-9c8a-08d920febe08
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 11:01:13.3813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lwmcoYBlwxvs19kJ/yF8f2VgyJOhs5+TT4dfd1EN5Raf22fCeVr/OOffYXAn1u50g8WVHOyS8S5+SuNviKCIYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4476
X-OriginatorOrg: citrix.com

On Wed, Jan 27, 2021 at 09:16:07AM +0100, Jan Beulich wrote:
> Especially for the use in evtchn_move_pirqs() (called when moving a vCPU
> across pCPU-s) and the ones in EOI handling in PCI pass-through code,
> serializing perhaps an entire domain isn't helpful when no state (which
> isn't e.g. further protected by the per-channel lock) changes.

I'm unsure this move is good from a performance PoV, as the operations
switched to use the lock in read mode is a very small subset, and then
the remaining operations get a performance penalty when compared to
using a plain spin lock.

> Unfortunately this implies dropping of lock profiling for this lock,
> until r/w locks may get enabled for such functionality.
> 
> While ->notify_vcpu_id is now meant to be consistently updated with the
> per-channel lock held, an extension applies to ECS_PIRQ: The field is
> also guaranteed to not change with the per-domain event lock held for
> writing. Therefore the link_pirq_port() call from evtchn_bind_pirq()
> could in principle be moved out of the per-channel locked regions, but
> this further code churn didn't seem worth it.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> @@ -1510,9 +1509,10 @@ int evtchn_destroy(struct domain *d)
>  {
>      unsigned int i;
>  
> -    /* After this barrier no new event-channel allocations can occur. */
> +    /* After this kind-of-barrier no new event-channel allocations can occur. */
>      BUG_ON(!d->is_dying);
> -    spin_barrier(&d->event_lock);
> +    read_lock(&d->event_lock);
> +    read_unlock(&d->event_lock);

Don't you want to use write mode here to assure there are no read
users that have taken the lock before is_dying has been set, and thus
could make wrong assumptions?

As I understand the point of the barrier here is to ensure there are
no lockers carrier over from before is_dying has been set.

Thanks, Roger.

