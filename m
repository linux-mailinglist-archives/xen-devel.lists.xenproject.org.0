Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 554583B5B7E
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 11:41:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147764.272696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxnlD-00037r-7v; Mon, 28 Jun 2021 09:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147764.272696; Mon, 28 Jun 2021 09:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxnlD-000362-3V; Mon, 28 Jun 2021 09:40:59 +0000
Received: by outflank-mailman (input) for mailman id 147764;
 Mon, 28 Jun 2021 09:40:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lxnlC-00035w-9k
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 09:40:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fac805ec-c058-4e89-bdc2-479db3c155d2;
 Mon, 28 Jun 2021 09:40:56 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2051.outbound.protection.outlook.com [104.47.5.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-ZDfQ4tZQNwysG1TZrOYQqA-1; Mon, 28 Jun 2021 11:40:54 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6863.eurprd04.prod.outlook.com (2603:10a6:803:12f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Mon, 28 Jun
 2021 09:40:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 09:40:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0031.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 09:40:50 +0000
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
X-Inumbo-ID: fac805ec-c058-4e89-bdc2-479db3c155d2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624873255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KOpzN7lwjzR31ucJIMTrFbm6iJk94HYFxhKO5ptxMYA=;
	b=fk3UTh3VrOih8bcyI2aigyjn2lxFkjTU3c/1xXoEkB66BXMk6WKpgeN3jmW9oavaC9sqW7
	4Nvg1vf7544Q5yPzISwDMqTNMFZZv2ILnLh3cGq0cTmGQNj8EDyB/DR2xsoE9E9kihIN4S
	p2CAWKhMrkyJG9CCFjHE5A+GK/Ywx4w=
X-MC-Unique: ZDfQ4tZQNwysG1TZrOYQqA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ra1eg+ieDKHJglhZw0KQM3NL3UPervBgJNG7r7mXCWErErItx+T/VhVD/JtKQrX7ak/CyFrBi0DWfv+wToq3zAE6Q0t7+JM8NIonW3J6UzFez704EKfSeTTNEfRmqItqLb/HPOpyxnLnJcBR3synYG85lK6pUu5hmm76/C7BsO3o8h+/3zmCysiqMpwE55FKROMOHHRraBuXGHc0tEDzcOMbql5kbg7aySRroBmv61vgNDQcr3KamD5Eb5XsI+7QJ9n3bFlmUVAV6v6rGvQmIv2kwedHH8Df6SE93GlRcEDQ6nUahlZ/UCSZko/pi2ODx1bEQqdwAbtonl43NZ5gvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PH4PcK33IPTOiyOnqCHTe+FHa2/T4R6WA5+rcTftmmQ=;
 b=ehm4mzdG2vsEt5M129O1YfgNHuqDLcoBHoyrEeGu81ImByQIivWyYMzXkeuE61xsxMJRliJC7H2CMNTufLdRL3dVHJDioU+ChBP3NRQiVGbeQv4ZtwVWKf/XhmJzFJDhiZ3GPZXDYCjUX3z+Cl1wa5L5VmD3dhyTDzVEqEEsmFO0S3RlA82piBUERPzK9+/Z6NrzA4rfhYyijBrU1Zhv440adNvA3D645pNnr56Z1xG2tnUGuCHBiZ1+Jr1Hl+NsbqJq91p85m5/YOT5HCixSUBpMoe40iel9ZNvDPuLcUfrvaI46499WHZ07sdU2voktBg+MGHA6/Fx1dGe2jNvqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 01/12] libxc: split xc_logdirty_control() from
 xc_shadow_control()
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
 <e928490c-d13c-8041-0ff7-e8b69ee73d6e@suse.com>
 <034399e0-d79f-71b1-286c-823a97da7e73@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <629db19c-9408-53c4-b247-3f567ffda4ff@suse.com>
Date: Mon, 28 Jun 2021 11:40:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <034399e0-d79f-71b1-286c-823a97da7e73@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P189CA0031.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dae1524-a001-48d4-1452-08d93a18d152
X-MS-TrafficTypeDiagnostic: VI1PR04MB6863:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6863B4A267236A005C482088B3039@VI1PR04MB6863.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SOEtj4TBnRO8nzi7wFijH8eXbSeuVa+rSf8e2Uq128aFs9ZdcGfHzuczoey+dDgJCZWDsSoRhjxa2YTH4vLnA5UZppjnpkZty/PbFaWb+8Zr+qtOtr6iQ9Uz3M00GfzEYVy2mKxhi3Fa1BumrFO2scVVDW51CQSqj+JAVlCVfWww64Gd5CdZLDYIKlJ8U4PfbEk2WGlLSyv5zAAx8Oa78illW57zHQn2RPd+mqlTInsXTt+d2/4AZ3PlCghbsgXXsQP7xccT5dEE7SR9AoeExxojk1TNofhT3rs2vOTsGXlWceexLr5Jg5QLmJRkTK94yHq25yckUjIJKgzkq0SIJpRL2ZbFOJe3q9vfSFs6b3/QUNUeqy/j0p/96S5mbFTF6CK550rHPkDm8yZuSFbvwr1dpO7FzzWLOkOHy3eSd6vYhd6IZ+mosm8I/haf8bt33rTFeu3eLwniBUg66VzINFh/HypA0W+nt+p0PhZncHA6hNBjsBEPAbZANRRr/bDqlrmsN8fY5Yi/WvwENywpxgIyk1fDUXB52nHdaccgkjdCKux0/tizK4yF6Fg3kiZ/q8B6yV1UXBGDJejPhlWdARkr6ZcsMBNTity/FUzc16LT4WAMgEPxQ/j65MuICXTFI0/C11EqRp93ZjP1lP3O/DZJkcRIx34500FmW2aAw1tNiIijCBbC17rxM4lH8fxhGzHyyb3RsNrC6rYJB0ATbqLPnzqJ4ElRn4qHLwp7P58=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(366004)(346002)(136003)(39860400002)(2906002)(31696002)(86362001)(66476007)(66946007)(316002)(66556008)(5660300002)(478600001)(38100700002)(8936002)(186003)(16526019)(54906003)(956004)(6916009)(31686004)(2616005)(83380400001)(6486002)(53546011)(16576012)(8676002)(4326008)(26005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vicTeGTAW1O7a/DmXuPGQATnXjOZdAMZbAdvYy5UPBg5DS11BHbLWhnJoj4M?=
 =?us-ascii?Q?fQ3j1Tk4MMb45wouoB7qhjCfkzK8J6/7BSyqK5Bjs13iSfvSINgfp7yhPluw?=
 =?us-ascii?Q?6rfGAPAPIHsEh/9xiM76G4CCzKv+eUC3E6R9AzTsV3baKD3wEtPmt4EYZR4T?=
 =?us-ascii?Q?HAnHky9CPaoVo7JYjwl2oe+VDEH3SLgrgFUUYOhYn6eHGIsIdPtYCV1xKgvf?=
 =?us-ascii?Q?CO0m2L1Zpzf12YOz4GWfQwIu35gUjYMgo5d767tn+PRwcvgM483Ji0ClMUXt?=
 =?us-ascii?Q?uVsnHOXUUaqqUhS5OZiSzYYtoboO7WkM/nOkS/nvZwqU1CihfxY05cZ/G++S?=
 =?us-ascii?Q?V8fRQOloU7bXlxTRECOcGtBILDunVExw5Xw5+hFw/bs3jZQFZlS+xdHx8Vv+?=
 =?us-ascii?Q?H9O+hTdSDYq6/TrzZECyp4Out7rwI+TI0e4qzCbZIyYMo1eTLacXbkzxiPVZ?=
 =?us-ascii?Q?1MNkiZ3HiB3R6DahGs4svtpmgjyHyVQNd2rWbUSVwj/hxF44OKj8u1UMu10N?=
 =?us-ascii?Q?KqkouzI065HGEkhohHRypbz/01EcxYcXgPdtMp5Vq8/kA/FGjfUHxKv7Tn6q?=
 =?us-ascii?Q?jrDiVKGz22YRkW5XjL3N8pv0s/5EIvXMNl37GWq3u+XpS9d27v08xNMcyB3i?=
 =?us-ascii?Q?6gYqcgn+6WQh6JThSho2RF/QGOk9qJrcqPjUqZqvJbKEjYwCdZu/LGpNUyIV?=
 =?us-ascii?Q?ISRJN9xLAXU+Et04Zh23dVsrVjnO3YaTn+CmgfeKOd8UX6KQa06pbUTA7sr9?=
 =?us-ascii?Q?nGKg0QvHKn596/gkQdHp/gUlBFzuJfOXRDZGnXmMLvQawhlY/DF19iXRjele?=
 =?us-ascii?Q?eC6DDMSfws0CVugyQulOfGuXu+9dAGrGqzQLT0DmnGBEBnbuaJNLTIag5L/z?=
 =?us-ascii?Q?MluFHX2klvbp/AN2ST0fjFgRRqfzvIXsXObch3CPslpauatq0eTGkwUw16lG?=
 =?us-ascii?Q?7yCxA0j2xS+7Qgp+7ntGATlg8vs0bj20hK5xYV/66rjuEhDmlJP9813JvqjY?=
 =?us-ascii?Q?hpeKdi147pVjAJPqr29Z6jYYQO7MO6q4b3AyxS65gCDQ6ILEGfervzq/9c0f?=
 =?us-ascii?Q?WgHrMl9c3ged5pqYgHnFar0kanMd0d+rmdUWNhYbZ0aJSHu2FgrIcuIUJnAn?=
 =?us-ascii?Q?TMow/J44Qu5JqyuEo27JFoO2mNLw9X+96m+hymn4D9gILkF+f2kNpuclM7YP?=
 =?us-ascii?Q?C0URauaqetNE2VgRpqBqhLWVKXwmVjOD9TUPWA/K6lqwA5PlCdx9O7wDprWV?=
 =?us-ascii?Q?LKuH9igSKn7oxJYS7RF3ZlTGAX9/YjTbKc5iklP8vAM/4Q725MFuCurFbwHs?=
 =?us-ascii?Q?SzjgBK59Uq1JPlT4eMUC4K3+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dae1524-a001-48d4-1452-08d93a18d152
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 09:40:51.5918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bneql5ikSDcdyqMEmsnZcRTmTwm3HWmdtXmwM2m6TiW+LfgxPJADSkj7D+vbkL5lKR4xcOkLEtXMb9RtPbOu+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6863

On 25.06.2021 17:49, Andrew Cooper wrote:
> On 25/06/2021 14:17, Jan Beulich wrote:
>> For log-dirty operations a 64-bit field is being truncated to become an
>> "int" return value. Seeing the large number of arguments the present
>> function takes, reduce its set of parameters to that needed for all
>> operations not involving the log-dirty bitmap, while introducing a new
>> wrapper for the log-dirty bitmap operations. This new function in turn
>> doesn't need an "mb" parameter, but has a 64-bit return type. (Using the
>> return value in favor of a pointer-type parameter is left as is, to
>> disturb callers as little as possible.)
>>
>> While altering xc_shadow_control() anyway, also adjust the types of the
>> last two of the remaining parameters.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I wonder whether we shouldn't take the opportunity and also rename
>> xc_shadow_control() to, say, xc_paging_control(), matching the layer
>> above the HAP/shadow distinction in the hypervisor.
>=20
> I do remember this being an especially obnoxious interface to use.=C2=A0 =
Any
> improvement would go a long way, but I think we also need to rename some
> domctls too.

Perhaps, but not here and now. Yet still - do you have an opinion
towards renaming xc_shadow_control() at this occasion? I will admit
that I don't consider xc_paging_control() a great name, but at
least it would gte terminology in line with the hypervisor's.

>> --- a/tools/include/xenctrl.h
>> +++ b/tools/include/xenctrl.h
>> @@ -885,11 +885,15 @@ typedef struct xen_domctl_shadow_op_stat
>>  int xc_shadow_control(xc_interface *xch,
>>                        uint32_t domid,
>>                        unsigned int sop,
>> -                      xc_hypercall_buffer_t *dirty_bitmap,
>> -                      unsigned long pages,
>> -                      unsigned long *mb,
>> -                      uint32_t mode,
>> -                      xc_shadow_op_stats_t *stats);
>> +                      unsigned int *mb,
>> +                      unsigned int mode);
>> +long long xc_logdirty_control(xc_interface *xch,
>=20
> uint64_t to match the hypercall?=C2=A0 All users of libxc are stdint.h aw=
are.

First of all - if anything, then int64_t. And I first wanted to use
that type, indeed. But then I went and checked: There are no present
uses of int64_t at all here; throughout tools/include/ there's exactly
one: A function parameter in libxl.h. Otoh there is precedent of a
function returning "long long". Hence I went with that.

>> --- a/tools/libs/ctrl/xc_domain.c
>> +++ b/tools/libs/ctrl/xc_domain.c
>> @@ -650,25 +650,48 @@ int xc_watchdog(xc_interface *xch,
>>  int xc_shadow_control(xc_interface *xch,
>>                        uint32_t domid,
>>                        unsigned int sop,
>> -                      xc_hypercall_buffer_t *dirty_bitmap,
>> -                      unsigned long pages,
>> -                      unsigned long *mb,
>> -                      uint32_t mode,
>> -                      xc_shadow_op_stats_t *stats)
>> +                      unsigned int *mb,
>> +                      unsigned int mode)
>>  {
>>      int rc;
>>      DECLARE_DOMCTL;
>> -    DECLARE_HYPERCALL_BUFFER_ARGUMENT(dirty_bitmap);
>> =20
>>      memset(&domctl, 0, sizeof(domctl));
>> =20
>>      domctl.cmd =3D XEN_DOMCTL_shadow_op;
>>      domctl.domain =3D domid;
>>      domctl.u.shadow_op.op     =3D sop;
>> -    domctl.u.shadow_op.pages  =3D pages;
>>      domctl.u.shadow_op.mb     =3D mb ? *mb : 0;
>>      domctl.u.shadow_op.mode   =3D mode;
>> -    if (dirty_bitmap !=3D NULL)
>> +
>> +    rc =3D do_domctl(xch, &domctl);
>> +
>> +    if ( mb )
>> +        *mb =3D domctl.u.shadow_op.mb;
>> +
>> +    return rc;
>> +}
>> +
>> +long long xc_logdirty_control(xc_interface *xch,
>> +                              uint32_t domid,
>> +                              unsigned int sop,
>> +                              xc_hypercall_buffer_t *dirty_bitmap,
>> +                              unsigned long pages,
>> +                              unsigned int mode,
>> +                              xc_shadow_op_stats_t *stats)
>> +{
>> +    int rc;
>> +    DECLARE_DOMCTL;
>> +    DECLARE_HYPERCALL_BUFFER_ARGUMENT(dirty_bitmap);
>> +
>> +    memset(&domctl, 0, sizeof(domctl));
>> +
>> +    domctl.cmd =3D XEN_DOMCTL_shadow_op;
>> +    domctl.domain =3D domid;
>> +    domctl.u.shadow_op.op    =3D sop;
>> +    domctl.u.shadow_op.pages =3D pages;
>> +    domctl.u.shadow_op.mode  =3D mode;
>=20
> Please use:
>=20
> struct xen_domctl domctl =3D {
> =C2=A0=C2=A0=C2=A0 .cmd =3D XEN_DOMCTL_shadow_op,
> =C2=A0=C2=A0=C2=A0 ...
> };
>=20
> I've been slowly taking out users of DECLARE_DOMCTL, because beyond
> being pure code obfuscation, valgrind (rightly) complains that the
> hypercall operates on uninitialised memory.

Well, yes, if that's the intended new style, then I can surely do it
that way. Would get the two function out of sync though, unless I
also made the (unrelated) change in the original place as well.

(For the record, I don't think valgrind rightly complains: As with
pointer arguments passed to functions, at the call site it is unknown
whether the pointed to object it input, output, or both. Analysis
tools can at best make guesses there.)

>> --- a/tools/libs/light/libxl_x86.c
>> +++ b/tools/libs/light/libxl_x86.c
>> @@ -529,10 +529,10 @@ int libxl__arch_domain_create(libxl__gc
>>          xc_domain_set_time_offset(ctx->xch, domid, rtc_timeoffset);
>> =20
>>      if (d_config->b_info.type !=3D LIBXL_DOMAIN_TYPE_PV) {
>> -        unsigned long shadow =3D DIV_ROUNDUP(d_config->b_info.shadow_me=
mkb,
>> -                                           1024);
>> +        unsigned int shadow =3D DIV_ROUNDUP(d_config->b_info.shadow_mem=
kb,
>> +                                          1024);
>>          xc_shadow_control(ctx->xch, domid, XEN_DOMCTL_SHADOW_OP_SET_ALL=
OCATION,
>> -                          NULL, 0, &shadow, 0, NULL);
>> +                          &shadow, 0);
>=20
> I know this isn't introduced by your patch, but this cannot possibly be
> correct without error handling.=C2=A0 There is a good chance of this call
> running Xen out of memory.
>=20
> Any chance of a fix split out into a separate patch?

Sure - too mechanical editing on my part; I clearly could have
spotted this myself. At the risk of stating the obvious though: This
change will come with a risk of regressions, in case a request was
almost successful and the guest then gets away with the slightly
smaller allocation.

>> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
>> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
>> @@ -997,13 +997,13 @@ CAMLprim value stub_shadow_allocation_ge
>>  {
>>  	CAMLparam2(xch, domid);
>>  	CAMLlocal1(mb);
>> -	unsigned long c_mb;
>> +	unsigned int c_mb;
>>  	int ret;
>> =20
>>  	caml_enter_blocking_section();
>>  	ret =3D xc_shadow_control(_H(xch), _D(domid),
>>  				XEN_DOMCTL_SHADOW_OP_GET_ALLOCATION,
>> -				NULL, 0, &c_mb, 0, NULL);
>> +				&c_mb, 0);
>>  	caml_leave_blocking_section();
>>  	if (ret !=3D 0)
>>  		failwith_xc(_H(xch));
>=20
> Not a bug introduced in this patch, but this is broken.=C2=A0 There is a =
kb
> vs mb units mismatch, and I don't see any shifts by 10 anywhere in the
> Ocaml stubs.

May I please get away with leaving this to the maintainers? I already
don't feel overly comfortable touching Ocaml code...

>> @@ -1016,14 +1016,14 @@ CAMLprim value stub_shadow_allocation_se
>>  					  value mb)
>>  {
>>  	CAMLparam3(xch, domid, mb);
>> -	unsigned long c_mb;
>> +	unsigned int c_mb;
>>  	int ret;
>> =20
>>  	c_mb =3D Int_val(mb);
>=20
> This has a 31 bit truncation issue on 32bit builds.=C2=A0 I'm not sure ho=
w
> much we care.
>=20
>>  	caml_enter_blocking_section();
>>  	ret =3D xc_shadow_control(_H(xch), _D(domid),
>>  				XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
>> -				NULL, 0, &c_mb, 0, NULL);
>> +				&c_mb, 0);
>>  	caml_leave_blocking_section();
>>  	if (ret !=3D 0)
>>  		failwith_xc(_H(xch));
>> --- a/tools/python/xen/lowlevel/xc/xc.c
>> +++ b/tools/python/xen/lowlevel/xc/xc.c
>> @@ -1192,8 +1192,7 @@ static PyObject *pyxc_shadow_control(PyO
>>                                        &dom, &op) )
>>          return NULL;
>>     =20
>> -    if ( xc_shadow_control(xc->xc_handle, dom, op, NULL, 0, NULL, 0, NU=
LL)=20
>> -         < 0 )
>> +    if ( xc_shadow_control(xc->xc_handle, dom, op, NULL, 0) < 0 )
>>          return pyxc_error_to_exception(xc->xc_handle);
>>     =20
>>      Py_INCREF(zero);
>> @@ -1208,7 +1207,7 @@ static PyObject *pyxc_shadow_mem_control
>>      int op;
>>      uint32_t dom;
>>      int mbarg =3D -1;
>> -    unsigned long mb;
>> +    unsigned int mb;
>> =20
>>      static char *kwd_list[] =3D { "dom", "mb", NULL };
>> =20
>> @@ -1223,7 +1222,7 @@ static PyObject *pyxc_shadow_mem_control
>>          mb =3D mbarg;
>>          op =3D XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION;
>>      }
>> -    if ( xc_shadow_control(xc->xc_handle, dom, op, NULL, 0, &mb, 0, NUL=
L) < 0 )
>> +    if ( xc_shadow_control(xc->xc_handle, dom, op, &mb, 0) < 0 )
>>          return pyxc_error_to_exception(xc->xc_handle);
>=20
> Here too.=C2=A0 There are int truncations on the input and output, and li=
ke
> the Ocaml stubs, an apparent kb vs mb confusion.
>=20
> I'm not sure whether switching to PyLong is sensible.=C2=A0 Its probably =
ok
> from a compatibility perspective.

Same here then, as I don't think I'm making anything worse with
these purely mechanical changes.

Jan


