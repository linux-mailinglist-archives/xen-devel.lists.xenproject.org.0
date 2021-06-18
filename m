Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6D13ACD48
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 16:15:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144698.266294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luFGq-00034s-UQ; Fri, 18 Jun 2021 14:14:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144698.266294; Fri, 18 Jun 2021 14:14:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luFGq-00032N-RB; Fri, 18 Jun 2021 14:14:56 +0000
Received: by outflank-mailman (input) for mailman id 144698;
 Fri, 18 Jun 2021 14:14:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lC6W=LM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1luFGp-00032H-3f
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 14:14:55 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5b58a0b-cd29-485b-8792-1659568ff868;
 Fri, 18 Jun 2021 14:14:54 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-IUL3VfimNmyT-TZaOpmkIQ-1; Fri, 18 Jun 2021 16:14:51 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7151.eurprd04.prod.outlook.com (2603:10a6:800:129::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Fri, 18 Jun
 2021 14:14:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 14:14:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0039.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Fri, 18 Jun 2021 14:14:46 +0000
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
X-Inumbo-ID: c5b58a0b-cd29-485b-8792-1659568ff868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624025693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FCT0rcMlrQlC78D+AYNG+gd8eKcIo81ibv67FimMn3A=;
	b=COzW6i/bU3H7WI88Z5aWmTbRb0rtsxlTga4eLSJOsr23gSL5v6DQqvS11FA499IplZu5b7
	dWr3i4sZGDw8b9hq9R4fjBU9AWJv0UIffAT2TCBOyOb13etOOEG0uDi6HbE37QLl3FFSCB
	X+SeQv3PfTo3rAn0vARViwV9nD2cOSg=
X-MC-Unique: IUL3VfimNmyT-TZaOpmkIQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlS5u0VoCVkT6ytFjKvxzL6GncinTGvl2rgkja6c4EHEkJJ4aG1AyAZHMLdFw6U+H9APYbLsoPlEoqK4OM4hSYU/fUWSgw/mROyMJvsIyM3CH+aszCs2QcFvIGWYUx21pK1YaGO789Q7rBixum6jAoW5WVXbD2wQe3bnNaVYyeCX10E5aP1smBDFCyEc5JkwtJxuIrzFViRRwTFGRwjgFJdddP9iuv5l9qiB4tVwf4mrdjpTJqyP4sn9zIYO1GQG3nGtSyZAH0XRT40LRzol1Rh6rjj0uGwAaPVgsmEvRmAhAvWG44MhiQlANG9X/E5EP7Cuq2k8yq5xYiYir3eNew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCT0rcMlrQlC78D+AYNG+gd8eKcIo81ibv67FimMn3A=;
 b=dIOryjelEevoB/lvHmU1ptcqrgJUqPSVJB9EVT1GNbIt9WI3QdBMEDRYSGvXA+1ivLpLb6fJaDtE0mZvnRn7JGpFrdyPStY8ISjrSaiXhoBVsCJJAvjgTgfA1bjgrVHbD8pgQKGYpFfDJSxqPcj2oXvtihs8ej2L9Zlf2SX+rI8g+VoLZ6Et+YaZi6Fmul4wL38rwDqXmhp5OzP8MMzwlSIO2E7wEKlk3WjwejF0OWcpua6gtmrI7/5tHMVbRWegs2ZlUS/4HS/xCAyyIUJBN7mj1T9rCj4K5S8kFgCzq0Z9Q1xSWn9OzsSCrpCIOyV+GkcX6AD3Eog0rcbjPxyg2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [RFC PATCH 04/10] xsm: convert rewrite privilege check function
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: sstabellini@kernel.org, julien@xen.org, Volodymyr_Babchuk@epam.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org,
 wl@xen.org, roger.pau@citrix.com, tamas@tklengyel.com, tim@xen.org,
 jgross@suse.com, aisaila@bitdefender.com, ppircalabu@bitdefender.com,
 dfaggioli@suse.com, paul@xen.org, kevin.tian@intel.com,
 dgdegra@tycho.nsa.gov, adam.schwalm@starlab.io, scott.davis@starlab.io,
 xen-devel@lists.xenproject.org
References: <20210514205437.13661-1-dpsmith@apertussolutions.com>
 <20210514205437.13661-5-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bd1f80e9-5d1c-beb5-f255-4351a5f64955@suse.com>
Date: Fri, 18 Jun 2021 16:14:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210514205437.13661-5-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR2P264CA0039.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a07bf44-c21b-4a21-a94c-08d932636dd2
X-MS-TrafficTypeDiagnostic: VI1PR04MB7151:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71512F6B94F180FAA47E98FDB30D9@VI1PR04MB7151.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E/rlfmqViW5ab1LO37Xwjcr4aLG0YVU2rf2hfeRkJDBzc5zOBV38IBX3EW+SBpS9Bg76FZd5M4iZu7Q+p/O/Kg7i1UPuRjIahGpvmz1jnKRNqAg1sVEJ3rzjYKTpZjHMc9rKdN4Ws8FSsLtNNagaa1LqGCDKQmzNw9g1rlNKOg0DLTlEPUSSEZFTdr1SjTpMD5XRH8lX6g0QizSF9fTwfK1F9msQLtXs2HzqHxdYb2cjBJXQGFAhsVljvQEaTTMLDKXb4ansrFOFqc/oDHr5TtVIHoUIrP+OnkL9c/kmVEsAJYZ+80y21a/WpdAm6FrA3KZkCXtJNeTYz4a63Bv4OJ8QOuVoquftnQne87yAMI4wD0/2rBdQ8g5LIvjTEpN58EtMxBHuS/9dhoyM5oS9SX/q+9d+JhWImIqGGuCAO7OmKQ2u4EoZd39JvErVF4yje4rarH2I3ai33ixqEWdQgAUAfedJ56MCKKcPxNPoVUhuPKP0igry21TGiB7eCguDPMldoCYZ9iNazpPEBpvlGJOOv5Z86Fmr3HnAa2Rtv/92iRMCoBOGoZ42dub4AEwZm9sb1PneXCGlokNpSpsbK/2kKNtvAusbYk0gTZ4DjvlWjAQKjeo1WeuleeuLGTWD1tGrrbDPqC9m5BGWaAT42iTWWedBY5904ZtRVnIjiYE34es0Rm8kinXFVj5qtztb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39850400004)(376002)(396003)(346002)(366004)(31696002)(6486002)(186003)(36756003)(66476007)(16526019)(66946007)(316002)(478600001)(31686004)(86362001)(26005)(16576012)(38100700002)(5660300002)(6916009)(956004)(7416002)(2616005)(2906002)(83380400001)(66556008)(8936002)(53546011)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODhpSEhHSUI0UTF1UExML1Riay9mR1BldzRycGJCODR4MFoxWEpaMTQwSVFD?=
 =?utf-8?B?d2R6aVNFamp3ZjBRQnpSWjN3ZEYyanNCQTByVHk3RWFNTmE1cDdRSjNuS1Np?=
 =?utf-8?B?cWpQck9PcUJKQmxYUWV4WTlGdjJYaUt1aXlwZEwrOU9Iam9sL2hpdWlwNVVO?=
 =?utf-8?B?b1hMcVFySzZ4djB5WkxHUHR1U01TVUZUZGU3LzFwRG81cHgrNmdRRTFNNW9D?=
 =?utf-8?B?eCtXZStxRDltcHB3UjYycW9LS0RhcHprR3BNTnhHeS9HZng0bjgrL0krVTM3?=
 =?utf-8?B?aFZIeW8ydy9aZXlXQ3ZJZk5NdER5THNmMEdEWnVGR1VCUkdpYU43VVVFRmtY?=
 =?utf-8?B?V05KRUhOS1JKaldHWmlKNkI0VjVoOWF5TTJqRi9PbTljWlF3cXQ3cGFqREhB?=
 =?utf-8?B?ZUcyZnVGOXVlWU9IdThDdjlodWJqcnhRbkJudm9hUG0zUEcvMEhKaE4zc05w?=
 =?utf-8?B?ZkhabUIwU21VZ1JpZHdpVGxtZ3VTYlJJQmpnQVNwOVdrdkRRQzZPQWQzWXo3?=
 =?utf-8?B?VHp6TzFEd29KTWZrbFBMbFhWeGFYZGhQUmRJdlV5MnVLY0VBSGxEUEtRVWs0?=
 =?utf-8?B?YVNBa1JldUpqelFEUUF0S2c4ZTJ2V21kL1ZXdXZNcG5CcUlYMGVPM3NNUnVK?=
 =?utf-8?B?b1dQZ1JnQ2FIcEpGOCtHTmdZVEQweC9tdENRc1Fuc0c0VVozUWdVWS8za0tE?=
 =?utf-8?B?elFlbi9GbDVzYzF0QWJnNHZMbWtia1BzM3JJalR3dmN6ZUtUSWdGVUYvS3ZK?=
 =?utf-8?B?M1VHOEp4by9qUFMzTE1qSjYvOThJUEU2NVpMa3lHblRIUjVSdUJLek9FWUxm?=
 =?utf-8?B?bndqaWR3Sm1lOTJRT2NmbHZqMEt2N1RqdHVTRXhoNEdmbDQweEpSR1BWVXNL?=
 =?utf-8?B?VWlJSTZSVGpTeVBaZGNvZ0FRaFA4VUJmWVZxKzFTQnh6N05KL2grL3JCSGZr?=
 =?utf-8?B?MThscFNpdTVTdFZsUXdoOFJ5ZTgxU0poZmR0MFY0djY3VWZ0Q25ZK3d1SFpL?=
 =?utf-8?B?UVM1aDRiTVQ2NDJ3VG5zQjZCSmVYdnB4ZnZON3UydmozaWxkb0NQZXdDTTR0?=
 =?utf-8?B?cU1VcGR1R1UrU3NkYjFyS0F5b1N4U1VoYXQ1aGlFRk94LzdLTkFRM1VQSmpt?=
 =?utf-8?B?RzFpcnRHR2UwRjhMTGlwYmZ2c3oxVmdIUXF2MC9CWnBRcmN1YnlUUnZCVm83?=
 =?utf-8?B?RjY0QWpjZVVucGFHb2tFVnpJdnFDUVR0VWkrS2x1Mm1SRzBIdzh0dGJtU3M0?=
 =?utf-8?B?d0RIa2VYblFXRCtpbEpBYXBhSGx5MFp2YzFVZHc3MHI5NnFTZE1Ickd3RXNQ?=
 =?utf-8?B?bUc4dUZiV0VJT3hwM0dHZnRDbnFGT0o3ZGVQVWp3S01rSlRhMC9jblgxdzcy?=
 =?utf-8?B?N0FHRzFIWXFueVJXTmRGZHd3ZnFwVkROQ2R2MndHNWlLNUNPWHJNREg4bTNk?=
 =?utf-8?B?U3lyeW82ZFZycXRUSlNxMUNFV3dBL0paMUhJT0ZIaXlIRTBVQytOeTJVNVNn?=
 =?utf-8?B?bmZWOEZaMksrWGUyUm45L1ptV2lkZDJZdWNKM0Nkd3dOQ3AwSUEyMXJzMlNq?=
 =?utf-8?B?czhFTHFRcVZBSDRqUUxkS0lidldGbWtvQmpjZUl5UnNqdXZpZGxUcm9NTXlq?=
 =?utf-8?B?TDRGYTRZOStiaUMrVEVzWGw1TkZGMjZQOVlSbUtVNk5lSTBJYm1DSlNNYjY5?=
 =?utf-8?B?TnMxYUs0N0tyMFhBT2plMkh3WXU5UEdqLzVoVGJqeUY5ZTkzdUZrN0s0TUdW?=
 =?utf-8?Q?WgS/v5jo2Wc+P6wuTdV4ukWoZwbTCarhqsad8+C?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a07bf44-c21b-4a21-a94c-08d932636dd2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 14:14:47.7578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iw4dtkqyKbJ5nIu9CbQiixd23ljlQc3zK/4yA/9AzehleEcrprj8mgnVlON03BzDn3ABNApfAwsQyBWSdYoSIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7151

On 14.05.2021 22:54, Daniel P. Smith wrote:

In the title, did you mean just one of "convert" or "rewrite", or
did you omit some punctuation?

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -475,6 +475,12 @@ struct domain
>  #define XSM_XENSTORE  (1U<<31) /* Xenstore: domain that can do privileged operations on xenstore */
>  #define CLASSIC_DOM0_PRIVS (XSM_PLAT_CTRL | XSM_DOM_BUILD | XSM_DOM_SUPER | \
>  		XSM_DEV_EMUL | XSM_HW_CTRL | XSM_HW_SUPER | XSM_XENSTORE)
> +/* Any access for which XSM_DEV_EMUL is the restriction, XSM_DOM_SUPER is an override */
> +#define DEV_EMU_PRIVS (XSM_DOM_SUPER | XSM_DEV_EMUL)
> +/* Anytime there is an XSM_TARGET check, XSM_SELF also applies, and XSM_DOM_SUPER is an override */
> +#define TARGET_PRIVS (XSM_TARGET | XSM_SELF | XSM_DOM_SUPER)
> +/* Anytime there is an XSM_XENSTORE check, XSM_DOM_SUPER is an override */
> +#define XENSTORE_PRIVS (XSM_XENSTORE | XSM_DOM_SUPER)

I think all of these want to *start* with a common prefix, e.g.
XSM_PRIVS_*. But of course especially these "override" remarks in
the comments again show that for now it is unclear what the
individual bits really mean, and hence whether these combinations
all make sense.

> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -65,37 +65,48 @@ void __xsm_action_mismatch_detected(void);
>  #define XSM_INLINE always_inline
>  #define XSM_DEFAULT_ARG xsm_default_t action,
>  #define XSM_DEFAULT_VOID xsm_default_t action
> -#define XSM_ASSERT_ACTION(def) LINKER_BUG_ON(def != action)
> +#define XSM_ASSERT_ACTION(def) LINKER_BUG_ON((def) != action)
>  
>  #endif /* CONFIG_XSM */
>  
>  static always_inline int xsm_default_action(
>      xsm_default_t action, struct domain *src, struct domain *target)
>  {
> -    switch ( action ) {
> -    case XSM_HOOK:
> +    /* TODO: these three if's could be squashed into one, decreasing
> +     *       the readability/logical reason-ability but may decrease the
> +     *       number of spectre gadgets
> +     */

Seeing this remark, I'm particularly puzzled by you dropping all
evaluate_nospec().

> +    if ( action & XSM_NONE )
>          return 0;
> -    case XSM_TARGET:
> -        if ( evaluate_nospec(src == target) )
> -        {
> -            return 0;
> -    case XSM_XS_PRIV:
> -            if ( evaluate_nospec(is_xenstore_domain(src)) )
> -                return 0;
> -        }
> -        /* fall through */
> -    case XSM_DM_PRIV:
> -        if ( target && evaluate_nospec(src->target == target) )
> -            return 0;
> -        /* fall through */
> -    case XSM_PRIV:
> -        if ( is_control_domain(src) )
> -            return 0;
> -        return -EPERM;
> -    default:
> -        LINKER_BUG_ON(1);
> -        return -EPERM;
> -    }
> +
> +    if ( (action & XSM_SELF) && ((!target) || (src == target)) )
> +        return 0;
> +
> +    if ( (action & XSM_TARGET) && ((target) && (src->target == target)) )
> +        return 0;

This is an inline function - no need to parenthesize individual
identifiers (also again below). Similarly no need to parenthesize
!target.

> +    /* XSM_DEV_EMUL is the only domain role with a condition, i.e. the
> +     * role only applies to a domain's target.
> +     */
> +    if ( (action & XSM_DEV_EMUL) && (src->xsm_roles & XSM_DEV_EMUL)
> +        && (target) && (src->target == target) )
> +        return 0;
> +
> +    /* Mask out SELF, TARGET, and DEV_EMUL as they have been handled */
> +    action &= ~(XSM_SELF & XSM_TARGET & XSM_DEV_EMUL);
> +
> +    /* Checks if the domain has one of the remaining roles set on it:
> +     *      XSM_PLAT_CTRL
> +     *      XSM_DOM_BUILD
> +     *      XSM_DOM_SUPER
> +     *      XSM_HW_CTRL
> +     *      XSM_HW_SUPER
> +     *      XSM_XENSTORE
> +     */
> +    if (src->xsm_roles & action)

There are style issues here again. I'm not going to mention such any
further. As to the comment, I'm seeing the risk of it ending up stale
the moment yet another role gets added. IOW I'm not convinced you
should enumerate the remaining ones here.

Jan


