Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AD44C4037
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 09:38:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278830.476227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNW7A-0004PG-QA; Fri, 25 Feb 2022 08:38:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278830.476227; Fri, 25 Feb 2022 08:38:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNW7A-0004N0-N0; Fri, 25 Feb 2022 08:38:12 +0000
Received: by outflank-mailman (input) for mailman id 278830;
 Fri, 25 Feb 2022 08:38:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNW79-0004Mq-7E
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 08:38:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42b5cba7-9616-11ec-8eb8-a37418f5ba1a;
 Fri, 25 Feb 2022 09:38:09 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-BZlVEax-MNK9UtqbI8IkKw-1; Fri, 25 Feb 2022 09:38:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB4202.eurprd04.prod.outlook.com (2603:10a6:5:25::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Fri, 25 Feb
 2022 08:38:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 08:38:06 +0000
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
X-Inumbo-ID: 42b5cba7-9616-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645778289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rKVDFPLFqEZvyu4womEk2iWR1POD6f2mdPiDd8hAyk8=;
	b=G7kIGxNzn16EeM1SixsfQXdy3R9fLAx+weoE6kheW+AWNsTZ+FW9liVmHVdVVW3gCN9r/W
	AP14Zi9vAw5XsmeJtPDxiXTK1bP5U34ESTKN3MWFrE9sYagEyf8vdFqk4BwIO+mxnDpnYb
	h9ttINPFDhiAx21sD8WxlpPjnCsFhGA=
X-MC-Unique: BZlVEax-MNK9UtqbI8IkKw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IDbI2rTXuwk+/k2kMnqek0+rF3HBz7z+W+V8C++sZlUasoyR6FadAnRBZScC78pj5mPwTzgqYukeLldkLZtHh49t7uupFCnQM+pMVFSuBhe1s6bKsvfHLPa5yDMqSv/Z5xv6++18vRB1JOP+sORwpn3sNbYpDpV+R3n8CuRz15DgJPqvUwU9w9QVJb0hcES0HpIIEA+AF0dXcBsISrw1hbvoyi7+8cv9lYyEr2XVCbWiTyi5Icj96IQtJvmOpaTX3yXWRf0S5G2gDCQQS8mvcz2hit2haDFX6B9xvQmOSHu3kERYGnShj6qb25k+msHY5fmCRiyxsJ2RPZ6r3R8DvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdk83KMn+1VFA3mDD5VKw0kBIVuWYUxHw0+Umf7uJoE=;
 b=cUhiKb3SmlXqeFggxUmzjkZQHAb8g6eMC8wbWH6gOziZUlOevccrCnfySAmIbM0WzuX9+N/ow2Iu/8cBEbAx8MGDl/ukzvCkFWy1aL9UT6VCnYHushEx+AjottebOmoKM3jRPc/aY1er1ytTfgWjhpsKnNK6Y85HM7zePN+Sz4gvqQNNYp5m3mLxvRYo1BDwspCimMQhX9LSgB13EAIrlFHoUfT/vvvI1MSO+tRgcOQ8G2o1AX8uKaYdFxNfhPful2AtbJjwrBE0siuFV0scd0DDoZKNVDrhD5jtGIEPNYmwx2LvccZunMrIDUfQvkhaVHbjfVCBMEk+8z+gLFBbEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9b1f517f-eb4d-ddc7-b957-4f0354ee2b9d@suse.com>
Date: Fri, 25 Feb 2022 09:38:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: x86/CET: Fix S3 resume with shadow stacks active
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Thiner Logoer <logoerthiner1@163.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220224194853.17774-1-andrew.cooper3@citrix.com>
 <20220224194853.17774-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220224194853.17774-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0047.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 203f972e-d323-4e2f-5073-08d9f83a24b7
X-MS-TrafficTypeDiagnostic: DB7PR04MB4202:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB42028F0ED046670300D5FF8AB33E9@DB7PR04MB4202.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	24TPUQftipONlSGkM5/QOKAcf8bBCu6ItLjMQpHOuIMi6DjvllYRZbONEfHZy2ZvaajRjNNDkrmqUNkr7qcdEvYvPp1vP016tmaQbLCE6UOXg8T9DhZhua+/raxZD55AdL9qc0OEezyVEeht+c/cTc7UCwE4BP2SJjII9zprk3Fmoj8kdaqJkWJJScyFgA6Pcxd4Xw9mNNDyTM3eS4rZ1Zmom2CrUjqjDshHpZkj/iOEkeM5yYnsmG2oK48H5lQZM38iz3yb2YALSyZQc0fU/gJFwbQQtewpNeNP/1qsulqhoLRKhznmNkZMtkNiqCzRVDWZ4PtdAS7KqNu2yHV0vV3ukZ/5nYX5VaMw423rv7ovm/HPYu1hxV8D/zBHfcCIYrVJUGfH7TZzQzaO6UP6+WoD7KVON3E04/6cMRAiNkKJEFFpIUBXld/xWFzjA14Zd2/nIhwMeS/Vwu19mWkEjFerrYP99LrTiSDhMzJvRvFIENw1lGOyxGLwByiZ4dhdZi2mxNjd8hELXUKf5qwm1ARpTYOi2ktDHDqEv7O+eVds8FfSQsh1aVcVzlKAJNzzYlc1bCWHlEtaF6YqVtDfXORqenQunglZCIlqAlrktHnOFwgNkH7UwJm0HBs7Nq4euLnu+buxXWJdo3K/n8JHCxev5eJ19xA/06BApeKzYUbUivg9HMT736ZyObbOoknjLya1TNSzM4hwQxnEpelb69rQqjCTuRfsEuhoaiUAJlLjeeeciCQam9SLb/BM2qHj/O25UAXkyrA/Cl6CdhYPwXATFqpm8yDGf+VsZ7ylAcE6FJxqjt3RYK6zyTlDcr3Ci1m6cb5jv+uYPMn7mJYOEg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(6506007)(53546011)(66574015)(31696002)(2616005)(86362001)(186003)(26005)(83380400001)(38100700002)(8936002)(5660300002)(4326008)(8676002)(66946007)(31686004)(66476007)(66556008)(2906002)(36756003)(6916009)(508600001)(54906003)(6486002)(966005)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cszg9U1CDAenV7BMsrK0qxHneLnjRq/WktfZ3ppvjdaQHarFVtYmZ7UcjWjG?=
 =?us-ascii?Q?yDOoo41kz7cql/6Oy232Lo0UM68yDGiM2dRio/GvFUfl43oG04iWXtqdnQPp?=
 =?us-ascii?Q?Jca5gSD1SIy4kusqJ3hGg+YeMasGAlP727z1/iZ621tnot5HOuG6RFFLDabp?=
 =?us-ascii?Q?UrPXGP30iZFwfgSrv9Jy/Y7/45VqbSRerURjtLyyz7yA9QZzO0fBru2yN73o?=
 =?us-ascii?Q?rpAHdzXunygpKvr9UxCQLvwb23S0b4Yg1QNpJy/VZFzhjXx7UKW/HGGfJpDW?=
 =?us-ascii?Q?HP42Th/lih2Kfj0aMT4FRsIQeyyVX4dQgEYnjibYb+L8y/2Di+dJoXr2Y01b?=
 =?us-ascii?Q?mCmdb6jFyKhmTYCYg4bdK/yXHpMokQ8qhKWtM/0/Vxu76TyiFhVnP1lkWgGf?=
 =?us-ascii?Q?1L0EKot/pQ0115rT8VPpCZDoYvm3hNQmSMwa7tTsAkYwHNVpl6HiLRpbcW9s?=
 =?us-ascii?Q?v6wXuszKqbiqu82wPe59BZQtFNrcqJWymu3TddTyXjS9OzwY4+9x68T58bEP?=
 =?us-ascii?Q?TQAg7e/qBK5UiFJ+B9OOVDOV4rlJoghSFSmxPX+WuhTz00n7fVeACFQq+Yr6?=
 =?us-ascii?Q?qG1Crj3IbPKxi/UL+D/DRgGIRGveIKRwO/Gs0e6L7NwpFIjhsfaCcB95inkS?=
 =?us-ascii?Q?+Xl8H3MK/7fU4ytAXPlkXlN7pr3WVF4YEvFEbGs4Bd4UedwAemqJwi7uj0Ir?=
 =?us-ascii?Q?Xn9DLEyHkZ/xKl2yGUV04iS8zAps7aWCH1pmX43/jxJFrjS41LwycfqHYg4l?=
 =?us-ascii?Q?51B74QO6cKLIjLfE4k94MauFbqSyPeDjNCOga2PYssRY8VAniqMZ4D/vDk+Z?=
 =?us-ascii?Q?qOpV0z5/3Nm7fRtuXw1M/wSqrghLgF7Z9RNA+AJPbRrC+SqwCKySh9jVdhHw?=
 =?us-ascii?Q?Fk5YIwKSs9MAYaR9s1r8Y43OpXOog/JG388FTclvMqMrk5stALjXBUpXODs4?=
 =?us-ascii?Q?hxLJRm4uKilTK9zBrMjPlW10a3Kbrj4NBckfOcuGTkFX9qsP8UdrZFSEdast?=
 =?us-ascii?Q?CGxJeFj7hBQyEPlB2jj3c56KJJHuo9y60e6xDIzdEQ/ARi5ixtL+RIT4tmC9?=
 =?us-ascii?Q?vBrPQTYQ/fYYYr/X+sdDxNsWrQwLMqfrk9iXh7SiNC/YHgiyIO1vOtzu9HX/?=
 =?us-ascii?Q?Pn5VZe1i0+DsmPHXkx9q2NkvegDvJf26Bse91el8hzjliQqgkLM83Vr3wSSy?=
 =?us-ascii?Q?U20/N3G+IVH6qRBVumgFPEA+06ZwaV+Uqk7WfsPqQbHZ4gR8FAD+pNK+Ifn+?=
 =?us-ascii?Q?tYoGxgh5eCyXkVnqOEuIxrfO3Q1iyCue+eehnk+rTUqdkjE2O6ObZ6aBGQYA?=
 =?us-ascii?Q?/jWauvqAuSp6Gc9NAZTB7N7JLy6fysv+Rjw+8/nZQc2amkWBt3uS9vetBTBT?=
 =?us-ascii?Q?kayhgncSfJ0DSyv8ZPbjdklaF7cG0aD1U+CTxt2Hu8BzB17sxeX2st3/dvw4?=
 =?us-ascii?Q?vxfvZt/T7WBb7uGQ7qsDDHLi743tk0bNLEnf4zRDoYxZo9iYVv6UB8XzSDRl?=
 =?us-ascii?Q?EarVGR07Q1Zo9sSb20/b+zrrPQzHAVymLdHBKHPAU0EV+0Ack4TsedssiMYX?=
 =?us-ascii?Q?x0c6EfDp9gbG4+4/iRLtUUXU/L1CT6B//+j/lA3KZ2q/BkxADIASpm3/FzBZ?=
 =?us-ascii?Q?EAoH75qoSjv1Z58Zyk3sF5g=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 203f972e-d323-4e2f-5073-08d9f83a24b7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 08:38:05.9452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2vHSH3v7GwrOoeqW5Q8Zg4vytG4VATbrzFMpywpGBWzWbHBepSQWaj43EDE763HJ7luU866FzdmWGBEy3itJMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4202

On 24.02.2022 20:48, Andrew Cooper wrote:
> The original shadow stack support has an error on S3 resume with very biz=
zare
> fallout.  The BSP comes back up, but APs fail with:
>=20
>   (XEN) Enabling non-boot CPUs ...
>   (XEN) Stuck ??
>   (XEN) Error bringing CPU1 up: -5
>=20
> and then later (on at least two Intel TigerLake platforms), the next HVM =
vCPU
> to be scheduled on the BSP dies with:
>=20
>   (XEN) d1v0 Unexpected vmexit: reason 3
>   (XEN) domain_crash called from vmx.c:4304
>   (XEN) Domain 1 (vcpu#0) crashed on cpu#0:
>=20
> The VMExit reason is EXIT_REASON_INIT, which has nothing to do with the
> scheduled vCPU, and will be addressed in a subsequent patch.  It is a
> consequence of the APs triple faulting.
>=20
> The reason the APs triple fault is because we don't tear down the stacks =
on
> suspend.  The idle/play_dead loop is killed in the middle of running, mea=
ning
> that the supervisor token is left busy.
>=20
> On resume, SETSSBSY finds the token already busy, suffers #CP and triple
> faults because the IDT isn't configured this early.
>=20
> Rework the AP bringup path to (re)create the supervisor token.  This ensu=
res
> the primary stack is non-busy before use.
>=20
> Fixes: b60ab42db2f0 ("x86/shstk: Activate Supervisor Shadow Stacks")
> Link: https://github.com/QubesOS/qubes-issues/issues/7283
> Reported-by: Thiner Logoer <logoerthiner1@163.com>
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Tested-by: Thiner Logoer <logoerthiner1@163.com>
> Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> Slightly RFC.  This does fix the crash encountered, but it occurs to me t=
hat
> there's a race condition when S3 platform powerdown is incident with an
> NMI/#MC, where more than just the primary shadow stack can end up busy on
> resume.
>=20
> A larger fix would be to change how we allocate tokens, and always have e=
ach
> CPU set up its own tokens.  I didn't do this originally in the hopes of h=
aving
> WRSSQ generally disabled, but that plan failed when encountering reality.=
..

While I think this wants fixing one way or another, I also think this
shouldn't block the immediate fix here (which addresses an unconditional
crash rather than a pretty unlikely one).

Jan


