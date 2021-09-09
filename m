Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FC2405A5D
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 17:45:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183343.331459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOMF8-0001Oy-6a; Thu, 09 Sep 2021 15:45:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183343.331459; Thu, 09 Sep 2021 15:45:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOMF8-0001N4-3N; Thu, 09 Sep 2021 15:45:38 +0000
Received: by outflank-mailman (input) for mailman id 183343;
 Thu, 09 Sep 2021 15:45:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZYDC=N7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOMF6-0001My-J9
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 15:45:36 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fdfed71c-6df8-43ab-9f65-e3057c4c4177;
 Thu, 09 Sep 2021 15:45:35 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-C1NDGUdgOMKX5VLV9O9Ugw-1; Thu, 09 Sep 2021 17:45:33 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 15:45:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Thu, 9 Sep 2021
 15:45:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR07CA0030.eurprd07.prod.outlook.com (2603:10a6:205:1::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.9 via Frontend Transport; Thu, 9 Sep 2021 15:45:31 +0000
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
X-Inumbo-ID: fdfed71c-6df8-43ab-9f65-e3057c4c4177
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631202334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Obk2aI5gcsFFFM6Z23Rp7Yx/We9v/EARn0Z5pydQ+N8=;
	b=g2QiTi82FB2yGbjhV56WqlHpNg4yB3picEsLvSVxSkITrRAUAXA1pakc7htFYFRZR8OHwW
	U7GEkOPxZbKure/Lw+COqjfJHPTCbmecfwXgZQrWHsGKNornXy39pDJRU5L/Mh9yDHlB7X
	/WxrarrbhLiK5wlemd2WSoe/8cY5v+8=
X-MC-Unique: C1NDGUdgOMKX5VLV9O9Ugw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ypja0fzlQ58crFjt2SzThOPS3RtPdBsOS2fZEPRlz8W5O6roSTuq8UGLka3v1oPxWT3BIq8rPYsK8GO6GArEV6FgGoGuxyspJTTBIVtZlpO+CE1vTfSwbUFzWeXPqLFLchIFZRozA+iilBqGyO8qlRcWlS7SCKDNaDcnglOSfNnkz3LBZOe6ShSxZgY+u00k6FR0pw3ojcomFIvH5GsnSRFjP34Jdais+vgtpChtexeA7AHAn7wS1ZRUSQQzgd0nWtEAQE4Pes7CWCsb97HYSuaWO7GZV6vX/UDd6/pycYrhfCNVerkC6uvRbd0sz94fu9zq0T0stpun7H2Y4TsywA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Obk2aI5gcsFFFM6Z23Rp7Yx/We9v/EARn0Z5pydQ+N8=;
 b=QWeO1xo9LqwTA1QUK52+BRPjAJjdPlmSkd0xG+2ZW2BbGxCKA/WW9uCwJdzSuJTVRaH/cyrii0Jjcwnup4yPg9rJRklJVTQ40aSeFyNbl2B4zwJwfpWRj7M5gS/f3MQmEMm1N3isTHd2QN9jRPjhSj3SBppfRFdEQqA9+IdyuheNP3vZfLzF5x83Rrd4c+JjT2DGY/On3KxDZG2nvDzHWWgF51ir3PPFva8Sgh3Rwk36DRF801RJq4Ep99O6SqS+zqZwZ79LZewZw5SKCbAo1qoqS/wwUGNcU2wo5Lp/UAQ2s66VcdgOtnz+/mpybTtHxcvrW9Egb9idTPP/qq0SJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v4 09/11] silo: remove circular xsm hook call
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
 <20210903190629.11917-10-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8d7824e1-3c7d-c0c5-f3ad-0644d4c49e07@suse.com>
Date: Thu, 9 Sep 2021 17:45:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210903190629.11917-10-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR07CA0030.eurprd07.prod.outlook.com
 (2603:10a6:205:1::43) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5fef1f4-1ad4-4a47-f4ac-08d973a8db37
X-MS-TrafficTypeDiagnostic: VE1PR04MB7360:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB736039CC41ABD42977013403B3D59@VE1PR04MB7360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pb3qceEy9KFLhoQsIriEuKkInIo49l2KBQwJGcYrjCJm3YEVYvdaWVhOKhcTk1JMjK2gP2j0EUT+hrj+N3qKuN0KWwYc1rHBxaUIBk8OKS1VFmYzlyQdzdE3ugXp9rcDm7pCibM6PQZaf1+Ll70icSJc1rTnJDe9nCgkPKmsRWaX2Luuh7s8n95Fd5mRH8wLez9abXYjn3Mb88oJ3x3hKX45pvS13+bB0vkx20k4TuuFq/2nGj1ag9bAjuYE4Q11hzEpI8aSn1TgxpbmoEDi8F9VViPeV7ebdFqPMIkgzCV/liex7NBH9QlbGwKh5GtERe48HI8YV2k+lhT79LvN4eapreGA4U+HmvG8hNA9idNdp9qN6CDW9J7MxPoOEU7faydMdwzw/WG/kgekLUmv9+u0fBvILIwSWbH/VowzQvDASk8kYhXfPSQVAlvdm+9crBi3aYZmwW9IFP9Uud6G4Wp9sICIvTDV3QUDC6Ln0p0t5sDLf1pH0GufyotQwUzKPZ2KGUaXCyPHTqjDtzzHX8qJ5C0mc0aOJvLXIleCALNrCFRDpMzhZX/IAgj6eqgLBTYooowC6XM0WJXuHGLdCkLbKm/JE88SSAdBsD4PhmPodRX01vB/odCJ3+KamLFJ3pcs9CX/tREAHuAYEPBoarsplj160T9wCa5lOTGyHbS4b0DYXv9lBc9wf8olgihYiyFkrYZpQ0ADVGMrCpLc7CSq5dRbw3znX/UTnGyuBfsin0obJJVMPFtmVeoEvHEu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(136003)(396003)(366004)(346002)(8936002)(53546011)(6916009)(316002)(956004)(16576012)(31696002)(5660300002)(2906002)(6486002)(31686004)(66946007)(66556008)(2616005)(36756003)(4326008)(26005)(186003)(8676002)(86362001)(478600001)(66476007)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWtSMmx5R1o3TmlKckxVbXZSMkIxVFBYc092dTNrQ2tsZWxkZkFrKzdRZXEx?=
 =?utf-8?B?YnQvazQ5VGYzMGMwWlo0S2hMMzNoU0NleU5vRS9hZGx4akplVEtPbEo2YUg5?=
 =?utf-8?B?MGJTTG9UejZTcndxaDF0R1l0Slk0WXVZYTZsdDEvc00xbEp6ekliWlN2VTdv?=
 =?utf-8?B?aXJxQUpLRVRPVHZWNkJ0MEdEM0UzMjV3T1RuQ25DMld6Tm4xSk03S2dlbDNi?=
 =?utf-8?B?S0RNa2pjb2xNL1BIbUpKeWxDYm8vdU15R1psaTZhMm5uY2xtQ3kzYlN0ODRk?=
 =?utf-8?B?YjZURFFmTk9BV0o4OGM4cy9PdzN0alBtWitlNHpzM3pIbFdzQzIwRi9XUG4z?=
 =?utf-8?B?VWtseENqV1FwV3UwY3ZlLzI2MUVLQ0FPWTR4NzZJWkEybnlldXNvV2tEOHc4?=
 =?utf-8?B?QWJOWHpJZWJjWm9VZC9qcDd6MWlKMmsyT2xBWHo2M3cxazBwTWRRYzJsalNv?=
 =?utf-8?B?YXVDZ1I3TVQwcnQrc2Qvc0lpOE5CelZMRkhnT2NkZUlSZkh1OE5yWkhOWUo2?=
 =?utf-8?B?UHhVMkFoY1Fvb1lsRlBiZUZJalpzcVlKM0p5NWNvaHV4VFgxc1NuVWhIZytH?=
 =?utf-8?B?STU4TndQQVJoUS9xQWV0UFphQktQaTlhcU13OWpTMCtDZ2pXWUdjZTA2TmpZ?=
 =?utf-8?B?R1Mvb2lnZ0JzTStuSGVrdnVQUmh1YjFzdHZDWG1KT0V4S1dnS3pIeElkRkZM?=
 =?utf-8?B?RzZYbEFVbmtwSm1vY1NkRzJkRmticS8yTW1OVmJld1NGRllwOWZaRVpBdHlC?=
 =?utf-8?B?aDVPMUVVbmpkbnJQcjhCdHB0NWtDZm9qVHJJWDBDWW83cUdWcUJYVXE4RVdm?=
 =?utf-8?B?bE5rc2EzYXJKYnJabUhGN2hTQlVabUhLcHUyVDNSNGVXN3B4Y1pIeUxNL2xr?=
 =?utf-8?B?eGFtU0FoV0RSWlIvVUVKWUhoQ0x1ckk2bE9rb2dkaVZINS9DMVg2OGc0OFJz?=
 =?utf-8?B?b29YZGZSS1NSM3FBYzRYUXNXd011bkwwWndlY3JKMktlTjdPMnBVMlVyNk1E?=
 =?utf-8?B?aFF6NzlsOFdJNjBNZnFmU3FUbndMd2l3aWFvOTd6NHZxOHhFa2RDUzMwbjZz?=
 =?utf-8?B?bm05UVlCM3kxcW4xSTNoOSs2L0lqUUYvMlkwMkhJSXR3S3FKakVrTFRlOGNi?=
 =?utf-8?B?enRJalJENXpWQWF1ejlZc1Y4bVhMU1RjYzBXNDNQMFdxZE80QkU4YkZSRTlL?=
 =?utf-8?B?ZytrbEYxZ1VXdFBDYzViQks2bGFmc3l5djQ4NEtPOVl1N1J1bnBZKzlDano0?=
 =?utf-8?B?dUZsRjc3ZzZLVFNVVzhFVWFlVHQ5TnRMWjNGbzNtdXFOY3JDQk13MDVxSkJZ?=
 =?utf-8?B?dTBpNkNVanNYcDFMNERGdGdsWFZKTGNlVzZTUmV3cGp4dnkxSVl2ZUdiVW5x?=
 =?utf-8?B?U2NNUWFScWFFc1lkTGs0NHo3WlpSaVdWQTRtbUhsbE16V0NDM3YyTVhEWEds?=
 =?utf-8?B?NGFET0FHMEppZm8rRnVqQ0g4T3JWMFRtNmI3cHNGcVJjYml1YURhZE1LZjhj?=
 =?utf-8?B?R3kwdE9GeDVDKzd5cWtydUhObUhEeGVNQzRoWEVuSUtEaVRicXhKUWZKQ3cy?=
 =?utf-8?B?c1VPQmU2R1hHZWp4RGRJZVpMajluTnU2YWNVYUdKc3ZRZ1dyZHN3RGdzbFNV?=
 =?utf-8?B?clVOaW9YdkRKR09udzVQcjFRYW1acVZ2L0I3dnRnVW5BUGNUZUVrMWQ2Vjd5?=
 =?utf-8?B?bExGK1R3T1RCR2UwL05JWVQ1bVM0ckF6Umg1Wm1vTmNZNCt3cmhYUGt3MFhl?=
 =?utf-8?Q?CCa818cG2SNHbvBh93hZMo5R/LryAbcAUaNTJUE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5fef1f4-1ad4-4a47-f4ac-08d973a8db37
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 15:45:32.0612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uq0xTgeSFVo8YgjYB1ruwNvxM3NlUHF4y3i1s2/IYEC6k3po74o85cMVg+aXE5Dr2+B0ckcoFZLjsXekDI0DdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

On 03.09.2021 21:06, Daniel P. Smith wrote:
> SILO implements a few XSM hooks to extended the decision logic beyond
> what is defined in the dummy/default policy. For each of the hooks, it
> falls back to the dummy/default policy. The fall back is done a slight
> round-about way. This commit makes the direct call to the default policy's
> logic, xsm_default_action().

Again it's not clear to me what you're finding wrong here. The way it's
done is not as direct as it could be, but going through the extra layer
allows the functions to document things at the same time. You lose not
only that documentation, but also ...

> @@ -43,7 +44,7 @@ static int silo_evtchn_unbound(struct domain *d1, struct evtchn *chn,
>      else
>      {
>          if ( silo_mode_dom_check(d1, d2) )
> -            rc = xsm_evtchn_unbound(d1, chn, id2);
> +            rc = xsm_default_action(XSM_TARGET, current->domain, d1);

... will need to sync changes to the dummy xsm_evtchn_unbound(), no
matter how unlikely such may be, back to here. This would be quite
easy to forget.

But maybe I'm overlooking something where how things are really gets in
the way of something you mean to do in the remaining two patches (or
later)?

>  static int silo_grant_copy(struct domain *d1, struct domain *d2)
>  {
>      if ( silo_mode_dom_check(d1, d2) )
> -        return xsm_grant_copy(d1, d2);
> +        return xsm_default_action(XSM_HOOK, d1, d2);
>      return -EPERM;
>  }
>  
> @@ -86,14 +87,14 @@ static int silo_argo_register_single_source(const struct domain *d1,
>                                              const struct domain *d2)
>  {
>      if ( silo_mode_dom_check(d1, d2) )
> -        return xsm_argo_register_single_source(d1, d2);
> +        return 0;
>      return -EPERM;
>  }
>  
>  static int silo_argo_send(const struct domain *d1, const struct domain *d2)
>  {
>      if ( silo_mode_dom_check(d1, d2) )
> -        return xsm_argo_send(d1, d2);
> +        return 0;
>      return -EPERM;
>  }

This would then also avoid introducing the anomaly observed by Andrew here.
And in fact the Argo dummy functions may be a good example where a change
might happen down the road - them being all empty doesn't seem quite right
to me.

Jan


