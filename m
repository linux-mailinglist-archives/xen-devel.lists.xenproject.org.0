Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8462413659
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 17:41:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191776.341882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSht4-0003eO-7i; Tue, 21 Sep 2021 15:40:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191776.341882; Tue, 21 Sep 2021 15:40:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSht4-0003c4-4a; Tue, 21 Sep 2021 15:40:50 +0000
Received: by outflank-mailman (input) for mailman id 191776;
 Tue, 21 Sep 2021 15:40:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSht3-0003bx-6X
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 15:40:49 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 379b6b43-9bfd-4362-8cbb-48a850bf9658;
 Tue, 21 Sep 2021 15:40:48 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2054.outbound.protection.outlook.com [104.47.1.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-2qndNLIGOxWuJuQT17yapA-1; Tue, 21 Sep 2021 17:40:46 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3389.eurprd04.prod.outlook.com (2603:10a6:803:b::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Tue, 21 Sep
 2021 15:40:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 15:40:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR01CA0113.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Tue, 21 Sep 2021 15:40:45 +0000
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
X-Inumbo-ID: 379b6b43-9bfd-4362-8cbb-48a850bf9658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632238847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W3vLjVFg9A/hv8geZZYQE/sughQeoeEnIr/IVhSL91w=;
	b=QjLy0ngmZHnWvE9oUTnkKtiX+nsppeX7pRebZ9Xj12c/068grfsTFeiJcqlDnUo3cwvYo3
	gQUx8tu6wKedR5xegE42i735uqSralYvH7Doo/JMpzawxY/c+t2XUj7sSTUnooism0vgKa
	40LWPZUXSTb44K0y2YtSoXiel7UB3bw=
X-MC-Unique: 2qndNLIGOxWuJuQT17yapA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBq3GQTpPQAASdlPCBPPiljXM06EDZ+d2qKjgFZCQA04Q2ibYZzs9i4BxLq64x8REciqbSbPyWPupS7yiY17x7ny9zbA8ZXsc2c1JTaPJPLQGDCkvt6GCzkIFymDoj1Ra5XS5r4+NJDopjBV6eCuacUMyL+KrbV6u52xus2g9w2nwnqgcqFZ+PKW0nmfZG0uVuaHfcKK0T2cdn/471MgqH/5pUUsl0ac6eeXgWooOhRSS4Ddl9GSJPq7FloZ0VatXMoB7ZGf7AEE56zdZRzAi8j+CE+YDTby+4dSstewBVeEBYqx4CfVsWi3Hb+P5ulg9UxdS9U+unZzBB9Q1whXIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=XtJm3Q2B4CxVAL6aKgs4w3/Za+id/ONdsfb0a0NlobU=;
 b=K3clgdSdFHPTa/vC9uKdTssjQt2NBO5O9C3rSJzRUBYk8wpAxQz4ji0pnrpaWX9rbPlF0Ix+rtHJ5Q6+EhBzDLFA8sgMWq+/u1rFsCNtcolzcTspwS2r33qf/Kp5lkelTjoTa2yOlGEWbN0fBJYvRu10V645nAC8aWhGu+JQ7dkvlq6M3YHm9YDjrBMliSp1iBtJ79qoPGr3WviP2Ert+3cTDg0jcITEGHj3Rhy+AmbR+qJ78eh4hNaC9OrgLSpNF+jxktok5eAX7ZZ1MMAcJKPmVvqFGK5blfu/1wuaMbfg7kQZXEXFUosL4qDBqJiikydIc9r9aoY0fJ0lpYVZew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 04/12] x86/hvm: Reduce stack usage from HVMTRACE_ND()
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
 <20210920172529.24932-5-andrew.cooper3@citrix.com>
 <1ec8d289-5c34-412c-c683-189cd5506600@suse.com>
 <f85e82e9-b75f-5b49-b1a4-86fc90ebde84@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <61a56d55-6d2d-d5f7-9719-4ab2d0793fa9@suse.com>
Date: Tue, 21 Sep 2021 17:40:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <f85e82e9-b75f-5b49-b1a4-86fc90ebde84@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR01CA0113.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43a984ac-d4fb-4c97-8a77-08d97d162d58
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3389:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB33898E83463EDA910BA19C35B3A19@VI1PR0402MB3389.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AbVOnGh9zKOcvs2VFdfrcj+n18ujJ/bsPLDOPcqHfX47l+pCZFnwUrCmJyOSXWL2gI1EsUvjPxaxDbLx1mILWCj5hN3JsMfHTF7Vy2kehtNmK0G8j+HtPdp8uvPiIDEQwmq8RhrlVgA01dAjUj52WuXyl9h9ozD79yLMVLGVx+eR2HdOM0Giklk+AzhgH1YwVCsdxzRZd5Z8Aji1d9/ooF8xe9OfZ0gwhGn/5yy9bhRWseK8PewIXsxZFH9n25biOVl6rV4K6K5U/qaOzuGWA+UYEdAIR+ooICLfYEhYbsG8Pm4bnEf3wKMad5vnjj7XI2kPVZlZS9TfOilWCfmEjVA9CqGnUkcAjf19BDBGscMTpOSzscQ14D8UIDl1CErSFWXdUhuva4gOe50bRhAOVTFQRhRo2RE3TPKbihOuyxokD8CiDF0iP6aPPFhhFa5s8kX7gPQYUQM+207kLbO5B/XbrR7Vmxg6MuPRlffEBuG5ufPNdmR0ehE+K7BJuXd8jOTghyi4Z7D+Sov0EIl8KXOtZxZ5x1o6ADMrp7t1xGzC1/zI2bW80h8XX2PqlGmqIjGwz8+W/IpOokc+Q74WdBKVynWBzkyEFzbD3qYBWigtfsrA3FDaHvx83OUtwj/ep1Ene9T1tzV+SP8phq9VrIYBstEUVV/iXk0DefrkqEeK3Pjyt6R+7JA/w6C5FOoI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(16576012)(6916009)(956004)(36756003)(86362001)(2616005)(66946007)(66556008)(4326008)(508600001)(31686004)(6486002)(66476007)(5660300002)(316002)(83380400001)(38100700002)(2906002)(8936002)(186003)(26005)(53546011)(31696002)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PH30N7KxAXDJQcEHtQbURjomX9buEzvwPmt1KhKU4VYUui31u+oecdwehPJN?=
 =?us-ascii?Q?ymsg1ERbDBUZeIexlmARh8GA6+2+2l85pp53s/g7TJTThrvI+fGlhYfgMaRh?=
 =?us-ascii?Q?/upTz3uplVMI0fx+vTvFJ+P74isdQA5zQP3JeFTd4+6NxAQtEiAHsiDYe4sO?=
 =?us-ascii?Q?gPW3KnR2PGx0fQEFH4CNkLqYwDJy9pmhjCoL6YdIffWEPStuihXvk5luo/t/?=
 =?us-ascii?Q?CZ8/NxfTVhWk0JbaY+ZydHRuldnG2IHjlpuhw56NHQ+/1wX9z+TLIatPonfg?=
 =?us-ascii?Q?wNRGRbFDfGXIKeoQ/EHgzV6/IlXf5MX1JS5oVNyjfCEcTmPmS9wN15cadgLe?=
 =?us-ascii?Q?DEoKEnwhTuMO/GA+yEwa8mzO1Rnl3OtIJ7z0UUKED/cWQNIecMJbmE03Udz6?=
 =?us-ascii?Q?6DS2zPwZmFYjy3Tg0DsIq6LZQQZk3LViepOn+3fAfyB8Mr4mC4AStfdBXBWm?=
 =?us-ascii?Q?hZP6uRAskE4Wl+4XD75ial0Fn2aSI0f4MOr7IEvneDaKjDoO4co74Kx3avhU?=
 =?us-ascii?Q?cOpXGdQHnJ1rFpKEBToyifv4lg2xm89ImMo/FFH25Uy1gyRqkK0iegSAK6MM?=
 =?us-ascii?Q?yS4QtLFqPfAOHSrLvpYFMkXW3aQcsu0ud8xkvzjR28qAmB1270los6SqCTzl?=
 =?us-ascii?Q?sbVnCq3FfkyKvcHyRf694Ml3/ElTqT9JBmyGKTcZQKqI+xNxUsOADNsILY4f?=
 =?us-ascii?Q?pWCumgBt9/Gmi8NB0lH7BUi5icd/KrJ3enJZTb3izO5FudBZpQsD9H97ZJpm?=
 =?us-ascii?Q?TMzJUGchf90FLmz1eeOTpmGT+rxrmEeujS2KLCPTrH0W7dlZAVjQC3TnAYbu?=
 =?us-ascii?Q?M7ibSjWUMW2t1Op1WJxo71IDt8CrJ+rHwYlFCubJ5+FoAU0/QlMEEsvJm9Is?=
 =?us-ascii?Q?EPHQgMHDx1VrfP2wUMa/L43X0tfCV1+Xza0juEMDSf44yTLkQWYSLT+7OvyZ?=
 =?us-ascii?Q?kuK5Qm9rjkNCh9+xSNhLj2+vY/S8B5hGi/SBaWNFuDLDCvmgBmgab3CK7FAo?=
 =?us-ascii?Q?ROTYSsTq5/BlVlmpXRkN40F9Dh8jCh5JJUgQBwzthHaTRUYAJCfhkzGWwArt?=
 =?us-ascii?Q?S7UO2ivYZHGgD9ZqFDAUH4ptm53xDQ32wpZulxHOXVBxiUKo2BsCfaV7ovqM?=
 =?us-ascii?Q?EbsFgPI8bysyL4SQIB7Zxg1cFwTksFViabXA4ytAk0iHGOfvee6Sjd27knZP?=
 =?us-ascii?Q?yI7otT6w0jgMCEmPhU3xvRsW1UxAenpmMmcGSx6LMXQS8JF7A3BBB9weMhtW?=
 =?us-ascii?Q?AYXDjiER7LWPnAgU6MPPffPGn1FGZ+F9qBxdekf4o+6uTrre3W4BvQvX8pAv?=
 =?us-ascii?Q?Jas/axfNuo9aNdRqYeWKrcCs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a984ac-d4fb-4c97-8a77-08d97d162d58
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 15:40:45.4554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VvKhlwIwL/p6Ryi0EW5nlVefLTpXzdvmBNbMBhDO+/Vpus46E0FRrLQmnEWL65HRkL9tCtOrvmbS2QTJe7dQZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3389

On 21.09.2021 17:38, Andrew Cooper wrote:
> On 21/09/2021 12:00, Jan Beulich wrote:
>> On 20.09.2021 19:25, Andrew Cooper wrote:
>>> v2:
>>>  * Adjust callers of HVMTRACE_ND() too
>> What does this refer to? The sole difference to v1 that I can spot
>> is ...
>=20
> Oh - its me who was confused.
>=20
> I thought I had failed to include the changes in vmx.c/svm.c in v1.=C2=A0=
 In
> which case, no change to that in v2.

Good:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

>>>  * Drop _d[] for the 0 case.
>> ... the one corresponding to this line, i.e. ...
>>
>>> --- a/xen/include/asm-x86/hvm/trace.h
>>> +++ b/xen/include/asm-x86/hvm/trace.h
>>> @@ -67,38 +67,30 @@
>>>  #define TRACE_2_LONG_4D(_e, d1, d2, d3, d4, ...) \
>>>      TRACE_6D(_e, d1, d2, d3, d4)
>>> =20
>>> -#define HVMTRACE_ND(evt, modifier, cycles, count, d1, d2, d3, d4, d5, =
d6) \
>>> +#define HVMTRACE_ND(evt, modifier, cycles, ...)                       =
    \
>>>      do {                                                              =
    \
>>>          if ( unlikely(tb_init_done) && DO_TRC_HVM_ ## evt )           =
    \
>>>          {                                                             =
    \
>>> -            struct {                                                  =
    \
>>> -                u32 d[6];                                             =
    \
>>> -            } _d;                                                     =
    \
>>> -            _d.d[0]=3D(d1);                                           =
      \
>>> -            _d.d[1]=3D(d2);                                           =
      \
>>> -            _d.d[2]=3D(d3);                                           =
      \
>>> -            _d.d[3]=3D(d4);                                           =
      \
>>> -            _d.d[4]=3D(d5);                                           =
      \
>>> -            _d.d[5]=3D(d6);                                           =
      \
>>> +            uint32_t _d[] =3D { __VA_ARGS__ };                        =
      \
>>>              __trace_var(TRC_HVM_ ## evt | (modifier), cycles,         =
    \
>>> -                        sizeof(*_d.d) * count, &_d);                  =
    \
>>> +                        sizeof(_d), sizeof(_d) ? _d : NULL);          =
    \
>> ... the addition of a conditional operator here (which I assume was
>> something a particular compiler didn't like in v1).
>=20
> And was covered in the commit message:
>=20
>> The 0 case needs a little help.  All object in C must have a unique addr=
ess
>> and _d is passed by pointer.  Explicitly permit the optimiser to drop th=
e
>> array.

Right, I had associated text and change this way. It was really just
the revision log which was confusing.

Jan


