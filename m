Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCC34318CF
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 14:18:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212152.369918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcRaN-0006Ib-OQ; Mon, 18 Oct 2021 12:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212152.369918; Mon, 18 Oct 2021 12:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcRaN-0006Go-K0; Mon, 18 Oct 2021 12:17:47 +0000
Received: by outflank-mailman (input) for mailman id 212152;
 Mon, 18 Oct 2021 12:17:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcRaL-0006Gf-UJ
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 12:17:45 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 65984281-300d-11ec-82d4-12813bfff9fa;
 Mon, 18 Oct 2021 12:17:44 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-C-elG_FlNEuUGQoXBYeFCw-1; Mon, 18 Oct 2021 14:17:43 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2334.eurprd04.prod.outlook.com (2603:10a6:800:29::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Mon, 18 Oct
 2021 12:17:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 12:17:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0027.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Mon, 18 Oct 2021 12:17:40 +0000
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
X-Inumbo-ID: 65984281-300d-11ec-82d4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634559464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qOlOn8y8Hnh5tiSkvthaJovJrDUEWNmjXDip3JXghRc=;
	b=lk43rpzWqKHJ1Vy3NjTrdn/DhkXWG738ZqBdCcgDyDXo5SpbHOXvd5N3uovcJCbjijbgN2
	TbtEGZc81SX27A3/lI74b61Up06yCZy9nrGGiI9LnP9026yEUFbyet9i+YP/9GI+VfQXuc
	NHlTSjBq131cIWVJp+j36Y+GxST+IH4=
X-MC-Unique: C-elG_FlNEuUGQoXBYeFCw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXBEszAAWvwZmRCCgnA8el7pT2LxEsjh7//VQuJ4tt1uLtXpNmOzsm8LtbyyGNGbSz5IXoVeBwsTSZn4HrP3sUS5JTXowkjVNp71kPW0v82kGdB6V0pc76yN1A/wvXJTr1BVmBE9PLdWWyIhoouy+ocDbyirY6CAR/+/F1sd084Laf3wVTa+3T62YB0+bBBYNwcNx3c14Eb6nSol6HH+MV1RvIgQRVrmoTTt7u1L7kFe9C/CQ9+LpBxoz46rdTWA9s6dC/y9Ndgew3GC1b/bPm1zPkrkneNeYaIXonpRbfk0pwFzws4CH0z3y/H68EBDYAN43JCnDEv7PZEn1EXrrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7c2nccOL8fMTNlBwSTXOXbyx6anX6RclFw2fsvpwbec=;
 b=ISNaZAhpqrPec/siITJnFemLAQ7cLXTq6xBOUVR6gGFCx/FLMWsZyIJmFuHjshOb9wJ3bBs6CBNKWynWB5Jg/ag9SIIDmvLAaEu3W/Rr4uuQw+Te4HQTHJbJGAahkJONqhDQUWhPGjvMtg5lC/0pbr4CVmz3q6VwzzzNARnlY5rdX76+aQJkFGXzKlcWXAQUXmU3kTvCMg3RahZ634JtmT9Eznxs8fmF8L2nfhW+wGX4T+aKOixao/n/oQGyRX3d2IjMY5MruxMaHmzE3aS2YH6RZPSRqgO+DnISAMF6Gomg1PMVa93sJIfgfrBAYfqI55QWA3RNMTshOk+Cxps3Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2] x86emul: de-duplicate scatters to the same linear
 address
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <cf935e11-27c8-969f-9fb2-a5c0e85ccff1@suse.com>
 <YW1YW8HJr6ttyd84@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a35c7be1-db42-9f7e-fc36-6b6abfd9e9a4@suse.com>
Date: Mon, 18 Oct 2021 14:17:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YW1YW8HJr6ttyd84@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0027.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::40) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 633aa74c-abd5-4e83-5ee8-08d992314815
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2334:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23341B859D8432D344C6BE8FB3BC9@VI1PR0401MB2334.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UNutfOCxXZ9f7pG5qokZQdaBzog16bJ+oAodWmL0jRVdW90MQl831upIh6tJjFY4DrILKKGlgfJ72STOHXqbjiBrUWK0SHZd1tUyIs6UYiRejJOPfuOZzcwVKjHWeZag3KuWaDPBCmNp0RvzJvy2n2XWC+n9zdkLvpp7PwpVra91XJM/6exm6Rt85Mb3JtcP7OZM38bf5n07Leorxu6URKRuln6vs0cNQoPHo5pngl1zEHZ+T6CxnaoFxuPc3BAw3YgaLqFarA3PFSe3qBOGmLIBUHVi09QBSd+XjS3GLwoUkkzVPJ+vTKnM40b/xzKKuT0ptuqHktFRHLenni+tttrIYUmjuKBgL71LYXTAi/cuZsp5XvA/bRZ0zRluyZbfWUTS+FuT0b4sfESFXc0ISWMhkLYV1CidS8itQb47WTD8qRZX11h1ziGGKKBWyOXIYNnaHbLoYJT5aaz/xfZ0O+KN7kZrwvDyyoHsu0u0gfnY0uk0bndJp9ufVXmeILt/2bUxCgh2NnK10qHkDjyGsCCB4ejR1HrIZVj4wuMSxRNM5Ew6+ZA+LTUs7D0DaKqDhN4HIFmjcy32fyaNUtTr8brnXCmGz+VT9lsOeCP+FveI48B3WB9uMCMLMWlnSKtAg99P4Ey7K5BojlUC7XRfMbEZj5rJ5PILpEvPXAF7SpPX7K3wqd5PZ2EZCwRWl5USaOt+gVbqGCTPdl7V0wzDj0qXustdEzBVrfH7VOuzuX1ztOL3RnnTWKQ2UlEhdsqB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(31686004)(956004)(31696002)(6486002)(66476007)(86362001)(316002)(4326008)(16576012)(8936002)(8676002)(2906002)(54906003)(83380400001)(6916009)(38100700002)(5660300002)(508600001)(186003)(66946007)(36756003)(53546011)(26005)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hK4V6mky53vcmjOMyBrr2D/MlewBuqQJABZGnle2NGdy/+IrRxTCyuQqTvtq?=
 =?us-ascii?Q?JGsspS4yMnfY+LCxHpB803bf+/OdAKBo8v3vXYvgw4CLAW5cMngM3t3qXaRG?=
 =?us-ascii?Q?wKoS5JC9CdcIDz2N0mib56zIZCnfu0pShA/0+X9h/XWOGsdiVsnSsz/W3qBA?=
 =?us-ascii?Q?6IxxLXjZEEu8V6ABezb7uYx+rWDpTFHVWTzFx1I19+qX3zcsTBhexwtXCvQq?=
 =?us-ascii?Q?BLDmpN9NcpY/Zx73AvLOLhqtOql3oe5/L2GOPUBQaEI32jKznR8eyYUs5Ki5?=
 =?us-ascii?Q?mhtqSt6kvzhcLdJBE0n6Q4BYClXWlvLfDI8cmGU+Ro2dET1cSYzLCBc/hTsM?=
 =?us-ascii?Q?Snq1nrRT21XpEQIt9OVElWI2xPZ5YTwrOlwRxYFumkEOTQ26p9LtGsvExCg5?=
 =?us-ascii?Q?jZzW9dB4vRFmxW5Gnt+3Ul3r+Uv1JynGeKhkZHc+M0riPV2Fdehj9fkaZAr4?=
 =?us-ascii?Q?RaE3YmK/YfTwadzaXTUloFG71L+dMpoO0OkoHx3Bhu3mRLCG/0jn+/1ELrLf?=
 =?us-ascii?Q?MKUKJM8PV/1SoXR5+g9gefZVDtf4sp5c5g6M6MBjm+BS1K0XNG+hysbppd/l?=
 =?us-ascii?Q?BQ45lrrOQSaT8yjvldcC6tqq0EIWb/INV0aFgoHLjomFmpio+T11ju3hHySh?=
 =?us-ascii?Q?xAsqU1KHfR0Oz9/eETsWMJTINaqCQf+5tf6gwlPJtcoUUjSbSRnw1G+0Ac6M?=
 =?us-ascii?Q?dIS5beTlTDGojh6e4B89WYwnAtHMhEQM0Z+pdnCrgGW+82QiQ4xq4kGMJZd0?=
 =?us-ascii?Q?grr3z0DfDw+FH7eR9hlfbkR+mSJJBNschRiJPU5Rhv9B9TP0ov4npj89XOui?=
 =?us-ascii?Q?sIxfDnq8TIlE9UWfg1nx7lW/2mnxmrANV1VJTF6WZ0wf6ilRXJsUqBERXFGQ?=
 =?us-ascii?Q?EYNGaMq8hO414VqkbnW/MRxmj2QcVMiRZXKLg6vBF8VhG0tKd00PrLa+8YpZ?=
 =?us-ascii?Q?Pau0a2pdJm6h71b6nld+xHR4QDh84titpTPvVJcrRbKvPNfdI7+C1nMUAPLC?=
 =?us-ascii?Q?uGDFO5jro8n1c6T9lG033i5+kGf2p2ngjE3cqP4HQPs0hniKuiXOw1Sij3da?=
 =?us-ascii?Q?3UcEsSsCZNiqkBmAqS3GDVcnjkWPTVyeXTBbogcdJuHLITJjWOpuwr95g0BC?=
 =?us-ascii?Q?wxHiVJf/GMw+Yi+S1cTWGvalY9PVvD7xoPkSyQZPdrju1qq3Cf98LmQdlXh7?=
 =?us-ascii?Q?JexzFgAfp9unLfp+/ZqvWOWcLdOm0MmUt/T72nq1pP/R/V3/cy6KRa1PohtJ?=
 =?us-ascii?Q?rU2P2+SL1jiXZA0hNArJQPEMgS3wKqX2xxtSVCLAEW3SjcTon7y9nDXcDtyC?=
 =?us-ascii?Q?spBbpB1NuwEZEAnTdaZGM8xc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 633aa74c-abd5-4e83-5ee8-08d992314815
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 12:17:41.1118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ar5DUdzsrlmLRgBx0mi0u92LKYPYtOatkR9d4P+5s1YJnpsohwRUMFrzhBY8y2fb5pq3slk+50y2TSjD3EApsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2334

On 18.10.2021 13:19, Roger Pau Monn=C3=A9 wrote:
> On Thu, May 20, 2021 at 03:34:28PM +0200, Jan Beulich wrote:
>> The SDM specifically allows for earlier writes to fully overlapping
>> ranges to be dropped. If a guest did so, hvmemul_phys_mmio_access()
>> would crash it if varying data was written to the same address. Detect
>> overlaps early, as doing so in hvmemul_{linear,phys}_mmio_access() would
>> be quite a bit more difficult. To maintain proper faulting behavior,
>> instead of dropping earlier write instances of fully overlapping slots
>> altogether, write the data of the final of these slots multiple times.
>=20
> Is it possible for a later (non duplicated slot) to cause a fault
> ending the instruction without reaching that final slot that contains
> the written data?

Yes, but that's not a problem: Only faults are required to be ordered,
and when a fault occurs guarantees are made only towards lower indices
(read: all lower index writes would have completed, while nothing can
be said about higher indices). All non-faulting writes can go out in
any order (unless there are [partial] overlaps, but afaict that case
still gets dealt with within spec by the proposed new logic).

Jan


