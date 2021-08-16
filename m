Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EE73ECF75
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 09:34:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167199.305178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFX8D-0001ET-Qc; Mon, 16 Aug 2021 07:34:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167199.305178; Mon, 16 Aug 2021 07:34:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFX8D-0001BM-Ml; Mon, 16 Aug 2021 07:34:01 +0000
Received: by outflank-mailman (input) for mailman id 167199;
 Mon, 16 Aug 2021 07:34:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tuO=NH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mFX8C-0001BG-Cu
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 07:34:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5128d6a0-fe64-11eb-a446-12813bfff9fa;
 Mon, 16 Aug 2021 07:33:58 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-o2D_vRRsPGmG8glei9UT2w-2; Mon, 16 Aug 2021 09:33:56 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2336.eurprd04.prod.outlook.com (2603:10a6:800:27::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Mon, 16 Aug
 2021 07:33:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 07:33:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR01CA0168.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Mon, 16 Aug 2021 07:33:51 +0000
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
X-Inumbo-ID: 5128d6a0-fe64-11eb-a446-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629099237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hRsf1eJwiMmHTAqVEBhOweeGc6Jif7zqzzKVDHl+gvs=;
	b=mZY+X1NI7OLLGBcoKENKMSoOl8svXTmaf3KC0vI0fZ3a+xYhHOdFrkDefHNYBGdNtEk4bU
	Flf+LmN57fl11+ZHJFlJCEeWe02jvMDYShAUFVSy296DO+UxzL+x8OVQQTOQUqe+XXJy+/
	NSswXH2Y1o4ioqmAd1VJ918dqwHpAS8=
X-MC-Unique: o2D_vRRsPGmG8glei9UT2w-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZthXemOsl13j0q/+y1tfrzr0sxk0RQRmE4kvLQSuuJmLbjl5m/X+vVYFzB3R2Z0TayxR0IHNb6GyzdfEkGEHolM2m8zp+m8TEl68law6Vde0pCLMMhLRh8zLF8DRJcGyeDcsdkUhxDrORnIBD3+RcMuQvsF2QaTsqL8gzS/cRRkmuuHj0LhUcQ2qtxSnb4k615SNCF1rp2+0vdLSQuZHredK1WUeWRCaq2VZDSnK6pdNUcNVdxqzPrSy498ALdEyMG9dDyq6sNR0doZEorNE6d03SESK93AQn/TrmuUSjrXIQRO3kL/HG9fF/SQL6Mx1oMt7gXu+UT/jXO20F8pT/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRsf1eJwiMmHTAqVEBhOweeGc6Jif7zqzzKVDHl+gvs=;
 b=ivBO3dA6jKi2RuuOYulbMjUMY5tMtDSTZU3qAA806iaOVUh+IZF8mG93/LsUD3hfHTbSD8BWnnOMuC4aqxAwWeSn4KY/qtE/qPdGK/UzTnAHWfUqb06jXv6d+Ub8BClmimzI5LVxbgjIfhnNQtBIgkLEMLfQ6VBWWWH7GSc6Uik0VVcQRXDQ0xmly4n4lBbe3mu9dXPnH177En2mJ72QsOaYIx+uknr2LyMVu0Durh7q8W9dPfQR6m/CROEEnrnE1BhbOzSEFNjZE89oYXg8K4e5RrEbOsUIwEdark8PvAUy6QJuY8/KznYKpBf7abXOIH3qmriAgcz2wbEoq+Lv+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [RFC PATCH] xen: Introduce arch specific field to
 XEN_SYSCTL_physinfo
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <1628897304-20793-1-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <908e2d59-41f0-3bad-6030-b2889d9c5cc2@suse.com>
Date: Mon, 16 Aug 2021 09:33:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <1628897304-20793-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0168.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbe3b8f4-5e04-4491-fb8e-08d96088325a
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2336:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB233691F4FABC82E959EE4D1EB3FD9@VI1PR0401MB2336.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1oxdFssjpO4mMzlGhqYKs1NbbRBvWBHq0OPed8Y7XEv2JY7kP5kgfhhERM7l/A6LoJdyfqbqtTyEVv1P3e8VPG/IFYktf9NSGQj2Lh4ksH5sXa2z6BdXwXJCdm3IBN58HZxSuKg7ud4SH31GD7P8LclJOxagOYZdzF38OIVFBkicaUhHx2no7o1Tg6eT5SxWJgL4Pf7DHakrpirU5aBocAIsQWiDpe6zzvh+v8dDpxMeMdAdzKg9KTPnP7Is98feJFLjgkds5xgxqDNxQcArCUQXFt7K9De5UhaNVGmqQG7MlAU5Dwk1X6dL+g1XjwF2TYRkLbhTxKYRw3dLgrPmNIhbqS39g1xvXYsJzdJPLjoX6O948owtTL0DXqJop/JwNAbMU4BDC3fatZfzLJsb2Geu3jzgTwBGEHEiX4zOjk9ZXE3/IcJy6qe24aReR+67EloY5Iiu/wdpwZ+qJI1daKqIJRYYXL7ulhqwqd9qn3JIqg9iJDIs96uM2dI+YXp9Xsz3bbfZ2q+qAAGJi62itN6vJBAXPyers/MXBll+NvQ2hNEMV1tEdac8YqyitHK+vrydJ49OhQY2q8iCPSo6QWtLwd9bB4ZKO+cMuJzd+R2lq9V1oVmfhQZ+nqKLqSbB/SD+ZynZ5WNyqEkD6K8iKlybKX4ZRk0mw/Dz2ZPBudXiPzfYYMBObPO/33ZBURT7YRuSrihimq0fX5JFVZaSjQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(136003)(39850400004)(346002)(376002)(31686004)(186003)(6916009)(16576012)(7416002)(54906003)(26005)(2616005)(2906002)(5660300002)(83380400001)(316002)(4326008)(956004)(8676002)(36756003)(6486002)(66476007)(66556008)(66946007)(53546011)(31696002)(8936002)(86362001)(478600001)(38100700002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K256QUF1UU9udmM1MkpER2d1MjBqK2hzZEVRYUVjSGdRUWU5a3UzYmYzQUE1?=
 =?utf-8?B?Sk5meGhURUQzTU95UnlmdWxSUW14bzdHNnNoMkhwYWk2bnRnTGlDNGhmOWFs?=
 =?utf-8?B?dFVTczdycXRmVXlJck5HUy9ML1JUUkk3cERmTlZvUmFkQm1kckk4TDYyRVZu?=
 =?utf-8?B?cjJzOVlvMVVKUlMvUitGb3JvajZ5SGNDc0JpcitBZWV3NmVYeUVxeEJzeENp?=
 =?utf-8?B?QXpTTWJSVCttZmloZUtvVUlvNUdnS3JJSUNJUS9tSU5Ycm9WTzFJaWRiZWRI?=
 =?utf-8?B?azFlSExONnJtVXAvSWVyZk5hcVhOR09HUW1ub2JCQVJvNXpzQ09TZEpwZXB1?=
 =?utf-8?B?ZGdUQUk0aUpKN0szN3JnVVJUZ2RPM0FFVDRuV0tLT0NxdG5SeERUdmpjMW9u?=
 =?utf-8?B?ZDRlWW9HdE1DQm45bjhLeDJ6RUhLekxneWRHcExMNVFReW12TFRzYVVhcE51?=
 =?utf-8?B?UVoveUl0VExlNStZZjFsNytjMjdUZmVrNlFqL3hraEZiQ1I4MTY2S1EwMVVh?=
 =?utf-8?B?TGNjSEQ4THhOQlphdjhnZEFpenF3Z2sySGRUUzF6MWs4OE93S29SMjU3SEdN?=
 =?utf-8?B?a3NYVTA0ZWZicUlaMVVZakl3M3VsZkZ6c3BwMlNWSTBXSUNQcVZqbW5FdDBV?=
 =?utf-8?B?R3FpU0psbmhZTnNvMlBqV21QTUxqcXIzWWNMVjV5cHEvcy91U051aFdCQkQy?=
 =?utf-8?B?QjBXb3haOXV3Q2pZaDFncTBLZFM2NW05cEV3ZTBmcGxnaDdQR0lQZS9lMnVs?=
 =?utf-8?B?Y1I3UGE4ZmQ1QURkYzJib1lDazBETE5RVWdoUVZKTnhBR2o5N2RCYVJwejQ3?=
 =?utf-8?B?WWhsMXRic2RwNW9KbHN5c2VRSVZwSkEyZkZTZkNzRlBPQUdpTURoenJKVmFO?=
 =?utf-8?B?WUJzeFliWUM2cjhUUFFWaXJEbkRuZHF2cVF5UVJXZndFWENTV3hLNm12Wita?=
 =?utf-8?B?REtpV3VQT1lPemo2ZEdqVnl5VzlkRzNmOGtTbjR1bUFKdTFOOEw5eEl6aFY4?=
 =?utf-8?B?SWFzYWJtNyt0eFJGbmhvdDU4TUNTNGFkU09aZ1QwN0kyaXBJZlp5UnpqU3VD?=
 =?utf-8?B?MENra2VSR1dhZWpDWlE2OHo5bmd1ZU9Yelo2UEIwbndRUDNHaUtNSjNVSENj?=
 =?utf-8?B?b3hoM3lqTG1zSDZ2UzR6NkF1aHp2ZzBwMnRjanQ4VHJRNi9uREZNd1ZMNnNa?=
 =?utf-8?B?ZnRib0h3MnpxOC90VFFtQ0JGT0xzN292ZFNXMW5PSDFDeDNNTWtoRFJiMFc3?=
 =?utf-8?B?RWtqRjZXZEJ4V0tIRVVZdWlEOUhNdUpFOEMrTEFMRXVGRDNKdWtBUWdsdjNz?=
 =?utf-8?B?N2lxUmFNNGhEcnRkR3I5eitBOXo3T3VpLzdrTnQxYnI0K1NrNDY3anFkQjBi?=
 =?utf-8?B?Rkg4SjJ5cVlQaWxmV1IrM1AyU0JYZlQyMUExRW5hcVA4QVJzaXRjYTlKSnhn?=
 =?utf-8?B?Y3U2dEFnTHc2YkoxZXh3STZpa3dpNVp1VTJKQjVkcG5Ha3BCbjJxU2t5OVN0?=
 =?utf-8?B?SnNZZ2FCdXVNR2lPVXZDbXRQZWtLYU0vOXQyRlU1eGNHdElrNTR1alV1eklW?=
 =?utf-8?B?UlN5OXlZclcyN0x5VnRtQkNqRFpmWEVxMlBLQkZoeWY0VXBoSGNXZ0RJVUtU?=
 =?utf-8?B?VXgyRHVRVFFMejNTVW1rRE8xNWpaWGR1alg3TjlMNkpPMFpBQzBvVHBMWkhz?=
 =?utf-8?B?b2U4NzVscjkxRUFjeG9Gcy9GcjhBZ1FMM29vaTZxbkRZNDJUQUhBSG1DcEVT?=
 =?utf-8?Q?IafFRw7XtCk1RBdLngbYt5wht/YFNP5dY9nRaPC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbe3b8f4-5e04-4491-fb8e-08d96088325a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 07:33:52.6957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sykiDi2cao+R/8RblrAa+zjlNdT0VCk+QoMCfK7+2iSDsW2PmWGn94ZGFFuOcizEeRHEF3jaUbo3yA9wvS30HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2336

On 14.08.2021 01:28, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> We need to pass info about maximum supported address space size
> to the toolstack on Arm in order to properly calculate the base
> and size of the safe range for the guest. Use p2m_ipa_bits variable
> which purpose is to hold the bit size of IPAs in P2M tables.

What is "the safe range"?

> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -332,6 +332,11 @@ struct xen_arch_domainconfig {
>       */
>      uint32_t clock_frequency;
>  };
> +
> +struct arch_physinfo {
> +    /* Holds the bit size of IPAs in p2m tables. */
> +    uint32_t p2m_ipa_bits;
> +};
>  #endif /* __XEN__ || __XEN_TOOLS__ */
>  
>  struct arch_vcpu_info {
> --- a/xen/include/public/arch-x86/xen.h
> +++ b/xen/include/public/arch-x86/xen.h
> @@ -346,6 +346,8 @@ typedef struct xen_msr_entry {
>  } xen_msr_entry_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_msr_entry_t);
>  
> +struct arch_physinfo {
> +};
>  #endif /* !__ASSEMBLY__ */

While the term "p2m_ipa_bits" surely isn't arch-agnostic, I wonder
whether the expressed information is (the x86 equivalent being
hap_paddr_bits, at a guess), and hence whether this really ought
to live in an arch-specific sub-struct. If indeed so, please name
the struct in a name space clean way, i.e. add xen_ as prefix.

Also please retain a blank line before the #endif. I wonder whether
on Arm you wouldn't want to add one at this occasion.

Jan


