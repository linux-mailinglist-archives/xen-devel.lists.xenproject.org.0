Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA1C41423C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 09:01:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192203.342534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSwFi-0001tq-Uv; Wed, 22 Sep 2021 07:01:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192203.342534; Wed, 22 Sep 2021 07:01:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSwFi-0001rp-RR; Wed, 22 Sep 2021 07:01:10 +0000
Received: by outflank-mailman (input) for mailman id 192203;
 Wed, 22 Sep 2021 07:01:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSwFh-0001rj-GM
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 07:01:09 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dba3f41a-1b72-11ec-b961-12813bfff9fa;
 Wed, 22 Sep 2021 07:01:07 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-9-ng0v2zTHMDekmwV2LKzbDg-1;
 Wed, 22 Sep 2021 09:01:04 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3392.eurprd04.prod.outlook.com (2603:10a6:803:7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Wed, 22 Sep
 2021 07:01:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 07:01:02 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0108.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 07:01:01 +0000
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
X-Inumbo-ID: dba3f41a-1b72-11ec-b961-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632294066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0hlgxtfWB65IzWfXsyfgGnIlLW0HEBD60ix0PD4dU/A=;
	b=jZaEkGiphDmD7CVSmDn+oOnyQ6RHdQZZi4F2O2TlNdKSdFrk0V+XL9Uy34Ic99WZKambQp
	V30JLb2ROkwn8JhUBnuAVjni8y5TvldcknKpVJJ1k0boPBElXc7+UVPtZw9ZN2iSVPwJQ8
	xvPVueY7eLnO86qBl7meMQHxiukGtKA=
X-MC-Unique: ng0v2zTHMDekmwV2LKzbDg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0jVUQ9xwgruqN+aEn0/jZ216/oxB9UMbThnkSFsrs+TNV0RAEDwX7qeUe51/4I7ZSgsR+mAuZ0s7IYKrKJcqJ+zXBUsDRfUQjsM3aqZkbm1/zxhuSzKI1MqOHo6gPWJXuFI5eqfvBg34dskVRJjyl/caktAMDflahys9OvrOzZPhNLfZVcwCecTfytprX+60llFuQZdtRKo1PpKxbKDX/IySUKPPU84uN3IZAkMFmVX+uiCmn95SeBoKi7Uw6/MTwC57gNKXLAzIDmPRZViLSqzstDEq9fYrTCY4jX0LgZwvizT3YJU4+8srxfgo3I/Yxjn7sVO1zne4a+k0eQlqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=6PhIu2Syyiorg/TJVOVOlcj2U13qurfGV+jCJIahXck=;
 b=NRMWjLP3/SEb0oqsTfgjRmE+f6uoC5eJ6heNB1UFzfGgJ6BkOIJF5XEaVYkkLP6ZoNSugkR/keRoXYnQC3XaKS7ANHR1uVxSYBJiP7ba1x8I0wcvER02TQrn07YhGi9+f0XFcjn2jedP6TCnbF9zvS2kTVbPlgdoXyQ+p4JgkEqaugR7MR++hUvCmEsfCZ4f/v3/trpZHFA8qFVh6L3nMooFf/SbMbzzcnphhDZA+PDzY85z/IaEYqrlFshE7zkNeqO2rex0naLdxSzwxqXt1UrILJsi6kTGX85cj02isu/BaxrJKu8cSWOCAXA+uPiuHOG7Bm2jqZBjryOlU+dijQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 01/12] xen/trace: Don't over-read trace objects
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
 <20210920172529.24932-2-andrew.cooper3@citrix.com>
 <731e3474-77bc-b11b-41ca-5dff57831264@suse.com>
 <171e6f01-63cc-e453-7268-1bf2ec6fe7cf@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <69770706-85f6-6509-b5c4-bda61dfdf994@suse.com>
Date: Wed, 22 Sep 2021 09:01:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <171e6f01-63cc-e453-7268-1bf2ec6fe7cf@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0108.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5792eb3f-31c7-4e1d-b17f-08d97d96bd1a
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3392:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3392495A7D7FE378C771261CB3A29@VI1PR0402MB3392.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E/X/CodWgAIh5fDpBohfyOzDR+bJ4JPtMa051QQufaT4P2W4RwTP4WmlZ1/nO7PPRNs+FQ/hN6P/ZF9o/Y7riE98VxJEJOu5sLCsoL5X/wBa0Lly+peXQ8NN02LYYVltWKc9AWHexbin8xZ+jevZDHusg8hCtrJSD8mlH6iFY7C9W4B3z7xxnguUdkDqvh0kEQUIuYIC0ShJNn8Ei94z7o9tGz2iiniRpMT+YMVFwivf7pRvuLcvjNxZy+OTNsx4Pz5yJ1zZvbH3tpqbbR4lZFy32KNonQXSEUgxvCkki8YRqdWLA0tWt93dD79Zu5SB+8lPSsD18xer3/uHRRWqsaMqz6l+9Gk+eqn2inkNt7o59WoW2jqB/dH8ySzdJVWduwOGWib783FeLCPaLFgkQdyOsth4xP8iBvTdOR++wVPmqE1kABvysXB5ASyIxcPxMcEiK645Xh4TgJL1QHVl7kSHT0YcChGSKcphMh4Y0wL8i4q+wc0ICX7zw1pRivAMAXjNAXBd7US0s1OxoHsvM+qsspmFLXJxM2PGPzVncRl/XBT9HGB1rXJcZATxcAFH4HrfAOTCRT3B+h78iegWm4mpCIB2czSQcnuwa432pq5oLAz3ZmoXlF8eDIZYtjIiq4uDCLo8Bc5b06V0/ZA88I3wgAWIGKAmKvsBMFkjuGazFBrr7avZkl/3pTlTm0OAlcsVmbW6vhVnaXjrjbXc3B/pB1hlV3eXrlcm2/2BXuE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(38100700002)(86362001)(31696002)(8676002)(4326008)(8936002)(53546011)(6486002)(66476007)(66556008)(66946007)(6916009)(186003)(316002)(54906003)(36756003)(5660300002)(508600001)(16576012)(31686004)(956004)(2616005)(26005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qgFbLaKF9vJJcGYHSWFS36SCpwDh9mcS1i5fIup9tx8GxaGX69eZK9yRy1Hk?=
 =?us-ascii?Q?amZquPfHv4/86H6OJR3N9Vue/QeG0PsqoqKDYQaXcdeAm9o4fFAdSWhhUAps?=
 =?us-ascii?Q?x4RAhRwFFgvsm10lzX4aySqdDg8PNww5r79TvLRoVDPwKptTOxWqc65eF479?=
 =?us-ascii?Q?qCLxMvxTWlMDwdVnhFRsN4JweAZ1x6VZ8ONt6K4OCAPW7QBUOlGPF5Olchro?=
 =?us-ascii?Q?Ak95jBRyF63KxYmwiQcjGfZQ1bhMX3pgwK88zj++HCulLJMZGM9rU10xN/xC?=
 =?us-ascii?Q?lQlVHz/o/LiRd8c8dzsD7iD+zwSRuJtvYs2Z2S/3+HCznoWKsGGEaaxntIXR?=
 =?us-ascii?Q?kZb0tq58dtqFhgh+iaxpo5U7AB6lIjtbo9ZNplbNNFnS8zCYaOjr2FRy7ZxO?=
 =?us-ascii?Q?ZVoAxfM9H8jklLm/yKYJGa44zaVaG7gkq1CNh8nNeio2jeOWczK99rjjWpMy?=
 =?us-ascii?Q?BEi86lNMNzVEbCfLYHv5FwTxj/G4n2iqBcDzDwuzxPzSH9+ictZe82ZLRDXe?=
 =?us-ascii?Q?w9R3Opr5BH6joGE3Kq4Szq9fBMRAaLTmTAK92Dsmlx+Sv0Q+ysOHnjisZYjw?=
 =?us-ascii?Q?x6r/CTsTDh2IvEETMPl21I6/vV88OsnGhRBE9nXlehppIG9qcrLtKG4llFom?=
 =?us-ascii?Q?M7TxF5l+QSNZR7bKyUmGlDToo8YORQUhfyfk1zD5qr1MIlqiUfpnFmUs1WOG?=
 =?us-ascii?Q?Qm8BiXmDCK9qNNET1KutRpR9UT46hYXWaEtdGjOLAu30EMgHpaNfa2dqN3sr?=
 =?us-ascii?Q?CfaReKbIt8FouJaBpm6Zko/IFpBKNOotTupz7h+r3SPm76OHc1Rf/ETF8gfg?=
 =?us-ascii?Q?GC7fpu/syWwFNZ9GYzicChO0wHkEHxehoEjizxGjDSpsLudHu1f0AjU/2jIe?=
 =?us-ascii?Q?WW1MdzPvyyD6RTf7KemG7PKwnBV964l7LGHLSOkTUw6GJKWM8PvOwgMe3NSr?=
 =?us-ascii?Q?eCgI2un7rMrIoMB2I5AI5vFhdxArSXSu42wEoCrzzVvj0ZiSA5M0L2aWtoMH?=
 =?us-ascii?Q?KwdFasnnJSzDn+ICK2b8FaDREMTqxB5y9REz0vZGJu8zyZP7U6ZuuOdMpqxF?=
 =?us-ascii?Q?INU57l0VU5rw17/dNt6xswXSTDpMPzgmcw8qwrg+bSIRCSC7lfW/k6IKCRoW?=
 =?us-ascii?Q?o7c9b3IKWQHNgVznboOH9ITg09GAlNInQzyZ46eyEwKBInm0QsdY3QsGpsId?=
 =?us-ascii?Q?amtl/0yMGtplW44yHT90TYcbKvYGaMmMNa//rzv2S7MAHIMYm+XpL1mYx0lb?=
 =?us-ascii?Q?ak3MgsT5fC0AnXGsAIyDP0A6wMUo5kZ9KItNrzazKurd/H3+j21vJkV+hTh6?=
 =?us-ascii?Q?jKNeBKACFUBiZjv5xjNOkEyD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5792eb3f-31c7-4e1d-b17f-08d97d96bd1a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 07:01:02.2434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3TwmoIKMX+PL+bJ0vgpaL0HtJt8uoVMeMdYEcBtXHgqSIN51q+irnsaF45veu21kQ2Gaq2DmD3QssmE0QoAONA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3392

On 21.09.2021 19:51, Andrew Cooper wrote:
> On 21/09/2021 07:53, Jan Beulich wrote:
>> On 20.09.2021 19:25, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/hvm/hvm.c
>>> +++ b/xen/arch/x86/hvm/hvm.c
>>> @@ -5063,8 +5063,9 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE=
_PARAM(void) arg)
>>>          if ( copy_from_guest(&tr, arg, 1 ) )
>>>              return -EFAULT;
>>> =20
>>> -        if ( tr.extra_bytes > sizeof(tr.extra)
>>> -             || (tr.event & ~((1u<<TRC_SUBCLS_SHIFT)-1)) )
>>> +        if ( tr.extra_bytes % sizeof(uint32_t) ||
>>> +             tr.extra_bytes > sizeof(tr.extra) ||
>>> +             tr.event >> TRC_SUBCLS_SHIFT )
>>>              return -EINVAL;
>> Despite this being a function that supposedly no-one is to really
>> use, you're breaking the interface here when really there would be a
>> way to be backwards compatible: Instead of failing, pad the data to
>> a 32-bit boundary. As the interface struct is large enough, this
>> would look to be as simple as a memset() plus aligning extra_bytes
>> upwards. Otherwise the deliberate breaking of potential existing
>> callers wants making explicit in the respective paragraph of the
>> description.
>=20
> It is discussed, along with a justification for why an ABI change is fine=
.

What you say is "This has no business being a hypercall in the first
place", yet to me that's not a justification to break an interface.
It is part of the ABI, so disallowing what was previously allowed
may break people's (questionable, yes) code.

> But I could do
>=20
> tr.extra_bytes =3D ROUNDUP(tr.extra_bytes, sizeof(uint32_t));
>=20
> if you'd really prefer.

I would, indeed, and as said ideally alongside clearing the excess
bytes in the buffer.

>> As an aside I think at the very least the case block wants enclosing
>> in "#ifdef CONFIG_TRACEBUFFER", such that builds without the support
>> would indicate so to callers (albeit that indication would then be
>> accompanied by a bogus log message in debug builds).
>=20
> That message really needs deleting.
>=20
> As a better alternative,
>=20
> if ( !IS_ENABLED(CONFIG_TRACEBUFFER) )
> =C2=A0=C2=A0=C2=A0 return -EOPNOTSUPP;
>=20
> The call to __trace_var() is safe in !CONFIG_TRACEBUFFER builds.

Fine with me (I'm inclined to say of course).

>> Seeing the adjacent HVMOP_get_time I also wonder who the intended
>> users of that one are.
>=20
> There is a very large amount of junk in hvm_op(), and to a first
> approximation, I would include HVMOP_get_time in that category.
>=20
> But c/s b91391491c58ac40a935e10cf0703b87d8733c38 explains why it is
> necessary.=C2=A0 This just goes to demonstrate how broken our time handli=
ng
> is.=C2=A0 I'll add this to the pile of things needing fixing in ABI-v2.

Urgh.

>>> --- a/xen/common/sched/rt.c
>>> +++ b/xen/common/sched/rt.c
>>> @@ -968,18 +968,20 @@ burn_budget(const struct scheduler *ops, struct r=
t_unit *svc, s_time_t now)
>>>      /* TRACE */
>>>      {
>>>          struct __packed {
>>> -            unsigned unit:16, dom:16;
>>> +            uint16_t unit, dom;
>>>              uint64_t cur_budget;
>>> -            int delta;
>>> -            unsigned priority_level;
>>> -            bool has_extratime;
>>> -        } d;
>>> -        d.dom =3D svc->unit->domain->domain_id;
>>> -        d.unit =3D svc->unit->unit_id;
>>> -        d.cur_budget =3D (uint64_t) svc->cur_budget;
>>> -        d.delta =3D delta;
>>> -        d.priority_level =3D svc->priority_level;
>>> -        d.has_extratime =3D svc->flags & RTDS_extratime;
>>> +            uint32_t delta;
>> The original field was plain int, and aiui for a valid reason. I
>> don't see why you couldn't use int32_t here.
>=20
> delta can't be negative, because there is a check earlier in the function=
.

Oh, yes, didn't spot that.

> What is a problem is the 63=3D>32 bit truncation, and uint32_t here is
> half as bad as int32_t.

Agreed. Whether the truncation is an issue in practice is questionable,
as I wouldn't expect budget to be consumed in multiple-second individual
steps. But I didn't check whether this scheduler might allow a vCPU to
run for this long all in one go.

Jan


