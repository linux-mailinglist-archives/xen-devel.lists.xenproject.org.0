Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 648C6466098
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 10:42:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236421.410109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msibA-0000lD-L0; Thu, 02 Dec 2021 09:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236421.410109; Thu, 02 Dec 2021 09:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msibA-0000iO-GJ; Thu, 02 Dec 2021 09:41:52 +0000
Received: by outflank-mailman (input) for mailman id 236421;
 Thu, 02 Dec 2021 09:41:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msib8-0000iH-RH
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 09:41:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12440cee-5354-11ec-976b-d102b41d0961;
 Thu, 02 Dec 2021 10:41:49 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-2B1jmPrHP0-VaDE8M8acMA-1; Thu, 02 Dec 2021 10:41:48 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5166.eurprd04.prod.outlook.com (2603:10a6:803:53::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 09:41:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 09:41:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR04CA0034.eurprd04.prod.outlook.com (2603:10a6:206:1::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.17 via Frontend Transport; Thu, 2 Dec 2021 09:41:45 +0000
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
X-Inumbo-ID: 12440cee-5354-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638438109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F0GA+SE+/orjDIFzmL+tGdrHslcpuX3lZl1u8VjVjJQ=;
	b=LL4Rwaz010gLGuXmt23j0a36UbP0QoDwHAZJKB6yruDlTYqDoof6+2pCg2eB+R7oom/dOA
	CAnb4oYphjUWGLapmMWZ7JWCeLE6Vb9LQoaJXZo65mfw1rpnV6ajWj6d1O01t/KPVenZLG
	baTZr0Sl3d1ppWTHxg58GvonSDa18U4=
X-MC-Unique: 2B1jmPrHP0-VaDE8M8acMA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8wHwbO3Fs7+e9CDIEFMKNHfgX82dJC4T91TifT5ZuiOWfD/p334NWzMSy8NQJT/JDb4JgR8dg4WhAtIIyiLzOQ2sjYhH9xY3yGGaWowcIQCfSZT3UW/PHAuXykWxM8VL3JRE/MsFX7YxEawUSvMGkUmRjo7OL4Wc5MUrspfxGSiWQNtM/uKFwA6Yt1LWVdgfFVuMv+BIAunwaBYjx94gGm3O3QDB6wmQNzacndDyCB0meciMfiYkeYVoObR7cJXEpeHJDh+NGhhcY5qdHGfMEveMvwOuXuVvgUH3/+TLtPvMO2CwvgrtkejIeTPgOCqILwc3Jh40TILbrwxec0cDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2R3sudreNdJ1CRCEM4LtYEAY0UF7HPfrH7cE3Ck778k=;
 b=i0Vj3m288y2pA73fy9/pmYcOtq/zVB8/7kiXqwxqY9WKVJllSZ824QLmK/xf09swC8zU7Kpwp15/KLlf3JNs64lF64dFeLhXPzYOgoEmIVyrbAGWX8KKbUQJRsukWFsSvDWS1EnxSN+J2j/s49tOIknM9FCUoDIgYkTJ9RVGtmXz8VvndLPU8f15zVeKfx2aDxzIMqetpdenifXToNpyEi/nCX/4a6uJp4Jg1+LEv98rqxkgQZNAf5Cdi8+m37tTPxVjytcprU+bm3o2Guq5cfds1VDE119jZDy84bleSou0UTwPi8MKJsh7M1M7HgYXsI5S+s7Y55QlB/gAq5bD+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cffba3b0-7efb-ac58-725a-8465a5a7d84f@suse.com>
Date: Thu, 2 Dec 2021 10:41:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/4] x86/PoD: simplify / improve p2m_pod_cache_add()
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <21148e89-4750-3112-1096-36119be96c7e@suse.com>
 <2525b63f-f666-2430-2c22-b1b7b0d5d7f0@suse.com>
 <66d9ffb0-a3c8-c8a8-18e6-9fc649ca2eff@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <66d9ffb0-a3c8-c8a8-18e6-9fc649ca2eff@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR04CA0034.eurprd04.prod.outlook.com
 (2603:10a6:206:1::47) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49762aa7-3618-4512-8d8c-08d9b577f4b3
X-MS-TrafficTypeDiagnostic: VI1PR04MB5166:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5166BA0CEF871D3041398E1BB3699@VI1PR04MB5166.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	baAndcZ7sGUDcTXIUrzf+U+NdJCAE64XPuvNqg6hCe4eNShCVi6gX4ZpAfrKPRJ+HUgMhZCUJfhWXx7l3wcCwkNVdLWD+rFqHH8VzwiA3Y69ETMLR39e69kNcOKBe7IR+Vr5hmqvd/giXAA6Su1gBIFSW6HtTb+/ng93NVZSJNNK7yppW8+SOWF0piuLTlOQegH7LSbrp7CL3xKIycUqrdbJjtL6YtN66kUQFRQc6nEiLmm04YPpB31t0xhx7hp2wVArj+pMaDtQ8MjX36pfnYlvrI//E8hMCel1SrhjrQMFIg1AzctMyOoEjk73vR79tLR8uPXq0rlOwMe/LZaRVS/4T4DzmUG3XzJBr/qi1pjpqFanXPOjMs+wyNnOoX9kBroH0IsOoj5Tb2pzd60yeN8emdLGg5wXn333nnLylo4KA4Bii1bXJq4kzqzVji2RTF8eBWpaeRpfDltYhAYz3M8vgnUdXUIKeBHXTW1a9t9Pl98FjElg9Z1C3SCRmAFe+3g5B7BnB2RGBd3LsCdQVXxn5UNpU93s3m6rJYg4Cjlt90Fb2CnKebwIl+DmvgFj0nvo8uLexsynZ64IGAzSnVoo/co30pPC52wvSPB9vvOh13efM+ji8zcnPIcelGiWAqDmYpmN8P81oeLaZF9aIYEj2AQWVQsVNI37ug/HZepyoWjKlJaId8oFGgdXRGLNSdA/nEhXB1J0bJ+sksLs3OzBWAPkcUzsUfw3qWkuwnA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(26005)(16576012)(54906003)(316002)(86362001)(38100700002)(31696002)(31686004)(4326008)(2616005)(36756003)(956004)(508600001)(8676002)(66476007)(6916009)(6486002)(2906002)(53546011)(8936002)(66556008)(5660300002)(66946007)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8cwVZaeVQhJixyRJ9PIc+dKM3rPCfKcH90SQ7ujIUG76Yp78btAE6jts8R3Q?=
 =?us-ascii?Q?P85S6ndoyNWFGAYwcDkPSlpG02ut8VninC4r227wRTQ3FRJTvYn6dMvrirzV?=
 =?us-ascii?Q?pbvKfJ0sK4rmncuw8iDzyfXUyHR7RcyFQVbqwBMJF3Nnr8bXfA6HfaiOHjBQ?=
 =?us-ascii?Q?8KeGLYqbTBtrr1l3xF06eOQpgL7DkFkpxt1425WYZmADnp9EtwFbe9TUAZtE?=
 =?us-ascii?Q?gsErVpKZq3pcq6irvM9sH96um9mR7LUDtLtI2s9sLqiaBgArKMDGBXqpZMCR?=
 =?us-ascii?Q?oLckmkqHfltS0mp5iuhF8sF/T6ZaPeJd1Tw1biELcvm4g8lARF3XeDlTzFv7?=
 =?us-ascii?Q?2of8192WOj0Yu39WWXPNRp7sykK0yx3Z4zIMtObPBzQsYsNlSNE9MLFn2Hed?=
 =?us-ascii?Q?UifojVpZ1IVSjYX/eBW4H5IB2y27DJjzo20Hmdf0w6JeahsRWxZmJKEfV9ZD?=
 =?us-ascii?Q?vpwk7qUVS1TSvQY3w0p76jhVt4B41zY5bGn24F9/7tyFHI/Z/zSrr/BqSNV9?=
 =?us-ascii?Q?Czr3uQUfxGXqpmbhEgPRkuMtezN2kJmePRJR80B+kiwnKE6fz3adSTT12hcH?=
 =?us-ascii?Q?qiqemUMINQD2HIz4XFS/O1QwNgrGD4RqG3yiuWnM+YaiekAb2RuvpsZsukZa?=
 =?us-ascii?Q?AsVqa+FvYuS+uL5KXLHEgDMPeMksuYAbGIN1FGprx80cOqfibP6rsRf0H4Ww?=
 =?us-ascii?Q?OseaM+loqwqzbwU5Rv5ginarMMLGisNd1m9T5H0AolnCGrRCimcljyg2hTNz?=
 =?us-ascii?Q?Xw0Ccg0uSfufUJqgAwsasFQhiTQ+bare+xrYZ5n1j0Uhw4au+316mxbMY4X/?=
 =?us-ascii?Q?KpLBlVm+bR5uOgmZs94P50J3qUEKci6CQMFEN8kYiHQGVlrz36r5DCUdQcNB?=
 =?us-ascii?Q?RBAJkY32OBwHO1a5uv5hkL4yol50+vAzcptu8LMlPzsp5szp/0cAUb6FNvuo?=
 =?us-ascii?Q?2Y4BsREGo7OqFsjo+6t0O+ODwBJmm68sW3gtShTmWLsEw7tVA3T0Bn3hVxTx?=
 =?us-ascii?Q?K5UYeYKb9xMWBRcJkVSwXdxh0diR34d+H92cOXkR//I0Dq165Jpzzfydr7VG?=
 =?us-ascii?Q?8x1bWcZ7Sfk0xJfJXLqReq02P1+cdEqY+9g1hH8WCMJw6z7sXy/dM1WA3iCi?=
 =?us-ascii?Q?lDonNn/zBU3ZCT7fnLyAmCfWIGs9Z3w/HVuoXncJKhWxVW7S6BiESO2a0jbl?=
 =?us-ascii?Q?dAFd7Rxb/Fo6/Z8iKu9V2jmx7WxBRM9U6e1FkOhDHl62Xs08jP2ayiYYVJGk?=
 =?us-ascii?Q?M25lrXdT6yJCVanYe+BDQ5XTU3vVX2UMrbSKTW7RI9g9/TfqKqcd+CX4PBgA?=
 =?us-ascii?Q?InQpn9x4UiXTV7rw3TiALgykSLVJte0LZ3C7UTCqgBFyL7Zbbv3mQsMTK1u1?=
 =?us-ascii?Q?WE7/Y/nQzyuJ0qTylEXJ5uhuUN938f1pnnAelJQVz7H2xdK+cYjfx8WdsS2T?=
 =?us-ascii?Q?JahBdKBACi+hFuxx3xHfyQMi1J5CGYKxu4XZ4+1/rrq/VEKCzPaYMu5G2lIU?=
 =?us-ascii?Q?2+l1OEGmQlIdI6gkO13ZsC70vrPc9XL99PRiKN6bN1IT/mjBxtKfD7JG0ZeN?=
 =?us-ascii?Q?neqnb8m5D1AhtRLx8jxhcs2IT8pFdchScGaKGLZllfabbxd7ib2hYejYqRsr?=
 =?us-ascii?Q?MsD717S0sWrdyLyTreGoRIk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49762aa7-3618-4512-8d8c-08d9b577f4b3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 09:41:46.2018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+h0i8nJc88+Kc6F4xpJlfGgUT9r+NZAsSKQ00tXpJBdhvP/GgAbEvy8Az/ws3BIOLItDn8Up9dc9B2/H12sFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5166

On 01.12.2021 13:01, Andrew Cooper wrote:
> On 01/12/2021 10:53, Jan Beulich wrote:
>> --- a/xen/arch/x86/mm/p2m-pod.c
>> +++ b/xen/arch/x86/mm/p2m-pod.c
>> @@ -58,14 +58,10 @@ p2m_pod_cache_add(struct p2m_domain *p2m
>>                    unsigned int order)
>>  {
>>      unsigned long i;
>> -    struct page_info *p;
>>      struct domain *d =3D p2m->domain;
>> +    mfn_t mfn =3D page_to_mfn(page);
>> =20
>>  #ifndef NDEBUG
>> -    mfn_t mfn;
>> -
>> -    mfn =3D page_to_mfn(page);
>> -
>>      /* Check to make sure this is a contiguous region */
>>      if ( mfn_x(mfn) & ((1UL << order) - 1) )
>>      {
>> @@ -74,17 +70,14 @@ p2m_pod_cache_add(struct p2m_domain *p2m
>>          return -1;
>>      }
>> =20
>> -    for ( i =3D 0; i < 1UL << order ; i++)
>> +    for ( i =3D 0; i < (1UL << order); i++)
>>      {
>> -        struct domain * od;
>> +        const struct domain *od =3D page_get_owner(page + i);
>> =20
>> -        p =3D mfn_to_page(mfn_add(mfn, i));
>> -        od =3D page_get_owner(p);
>>          if ( od !=3D d )
>>          {
>> -            printk("%s: mfn %lx expected owner d%d, got owner d%d!\n",
>> -                   __func__, mfn_x(mfn), d->domain_id,
>> -                   od ? od->domain_id : -1);
>> +            printk("%s: mfn %lx owner: expected %pd, got %pd!\n",
>> +                   __func__, mfn_x(mfn) + i, d, od);
>=20
> Take the opportunity to drop the superfluous punctuation?

Fine with me; means just the exclamation mark though, unless you tell
me what else you would see sensibly dropped. I'd certainly prefer to
keep both colons (the latter of which I'm actually adding here).

> Looking through this code, no callers check for any errors, and the only
> failure paths are in a debug region.=C2=A0 The function really ought to
> become void, or at the very least, switch to -EINVAL to avoid aliasing
> -EPERM.

I'd be okay making this change (I may prefer to avoid EINVAL if I can
find a better match), but I wouldn't want to switch the function to
void - callers would better care about the return value.

> Furthermore, in all(?) cases that it fails, we'll leak the domain
> allocated page, which at the very best means the VM is going to hit
> memory limit problems.=C2=A0 i.e. nothing good can come.
>=20
> Both failures are internal memory handling errors in Xen, so the least
> invasive option is probably to switch to ASSERT() (for the alignment
> check), and ASSERT_UNREACHABLE() here.=C2=A0 That also addresses the issu=
e
> that these printk()'s aren't ratelimited, and used within several loops.

Doing this right here, otoh, feels like going too far with a single
change. That's not the least because I would question the value of
doing these checks in debug builds only or tying them to NDEBUG
rather than CONFIG_DEBUG. After all the alignment check could have
triggered prior to the XSA-388 fixes.

Jan


