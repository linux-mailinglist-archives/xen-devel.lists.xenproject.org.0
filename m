Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4F04F5817
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 10:48:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299730.510866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc1L7-0008EB-EP; Wed, 06 Apr 2022 08:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299730.510866; Wed, 06 Apr 2022 08:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc1L7-0008Bp-B2; Wed, 06 Apr 2022 08:48:33 +0000
Received: by outflank-mailman (input) for mailman id 299730;
 Wed, 06 Apr 2022 08:48:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nc1L6-0008Bj-Qa
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 08:48:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5587f8d4-b586-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 10:48:31 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-cNl-F7O-OSGkop4H5o5EhQ-1; Wed, 06 Apr 2022 10:48:28 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB4237.eurprd04.prod.outlook.com (2603:10a6:803:3e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 08:48:25 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 08:48:25 +0000
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
X-Inumbo-ID: 5587f8d4-b586-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649234911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RVgAYc4pdH+DMQfBDziawv+0uiaE43o3Nnqr8kHEcz4=;
	b=k6GMmrB7CEtW3K3cAj3lGWntl/3Brs+5mO0Wm8f4jQWFkZL0XDZkhjdye9MZljcJBxRa/x
	qlffj2w7Pw6SJ+I3Y5VR42oNeGicVOci5J7SR07XR2jGwrlpe9n0NadNm7I3msQaI1gld4
	YvlnGb/SqzwUY9WR2L1cW1zBDQ9uhew=
X-MC-Unique: cNl-F7O-OSGkop4H5o5EhQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b46uv4LxBU6YsmgCsUcEoTw5hDnBAx0ywopOmJ31BiR00BM5E/ru827D5C0soZ3aHmYGROiIt4qmLD6DPifTY17PdIKv3V3ora39fARihnyOHrTQZC86Z1xC5WFVtv2WR5PEZYfi1VCLYH1fkNvGZPkT2KTIlyokY9o+rgtAHKxitFl9ZbByuaNGkv/6/eeArpkftZ2//bnUcwEMZ4aSEyzqAjJY6bVR/zwJzm7V3ujA7sIHVbyJ50POD83e1P3hftA8IpTmOOAlez4jZFx8lZ/OWUIC/i4ST6BT3HxAhfUV7rKsvf0kDERytQoMAmVeq/XYygUHyC6vF+q7QgBpQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bx4c/RgVuBr61y1OKVYyGwfuME8UXQZZHvxdJge+Vxc=;
 b=dJPgzwac3tWGrH0+Rbg8UBPQbSk8kR1z4h0R1XR2zNS2+WasQXr5ptdE7cJ6OdAUb+P/k1+qQGe6+HvkTXT+tf315MOPIRQZ3Boz3AxQP7zxTtXGquX8yt8AtAwKON6z1eCD6I4AeOleaVoXAncsFmbnzmSBAT/eIeZJVEpoQClBRpmxEI5EUZyIhSq8Oc8I+BxWzZ8yStlSqZIZ9j3/cYOxnqerkDaTQm0DI7GDJeDFD1v537KLM7jqilATi/er6zEm/K0FkbWZUZ8mPwfetuLT6G1v1o0s8S8E7f6mtJutoIAgI12F+HMUT0RjfZNLcoKfI/4HniNFdlo4841nag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dd4fce17-2625-603b-25d5-3a586a682210@suse.com>
Date: Wed, 6 Apr 2022 10:48:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] xsm: add ability to elevate a domain to privileged
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Jason Andryuk <jandryuk@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Scott Davis <scott.davis@starlab.io>, Daniel De Graaf
 <dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20220330230549.26074-1-dpsmith@apertussolutions.com>
 <20220330230549.26074-2-dpsmith@apertussolutions.com>
 <CAKf6xpuA4hQmPdBtmog1UFcSQQkXL2=+e5bmqeocesgNxqD27w@mail.gmail.com>
 <1eaf4555-5221-6cef-6c01-6aea3797e521@apertussolutions.com>
 <CAKf6xpv0LrmAa2A=dXXK2DSRh0j8ac9VM4aLBhTRK0MtnML0Aw@mail.gmail.com>
 <a4759948-d45c-df06-3130-f95aba05b555@suse.com>
 <Yk1Ta9ujHBuj+svN@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yk1Ta9ujHBuj+svN@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P192CA0046.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::23) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfa555ec-a665-4264-5b7a-08da17aa36be
X-MS-TrafficTypeDiagnostic: VI1PR04MB4237:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB423756494F8AD3434F2725D4B3E79@VI1PR04MB4237.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	esb9k3fDK9ChmDfYmI+7/p44n1cmztXSZ4Be5vHvwKcWqY6rc+guaeKrnUIaT1ESxXkZiUYEMS8HPpKsINexnKJL7UY2cqxbKxutXaZaDF7JW/CMr7Y29VhiwpZykCdOhNGKNY4qeY05y9+loM04okUSqdQSBl2FEuSFVJSh48TLwp2Sukv5Dk6pDbsTW0hfpgf9o/EWy1jYkmNrjvaf87lZVZhc7YpA+gu0UOh6pYMHid2fTkuOoMZOUi5xf/PChdLfGVzIpdpF7W16cKA8LWk7PaLBJSnt1p714TKjnVxmHdhjHaHPpmxGrsodoxZsk8eASfJ1FuWMzsh8ql3vIS0LMSWpYSQGj6xANVPfkXKM+nx9ONWTlTNdyk8d9xjell7cf2mbk8ZKqDtTQIivn3PRDjJUbiS16MEsqSiUw6ZOnLcEPQ2GBLL1/xhJ9HAghQXGyBVrZKz1oYx8mUupC4nbmzkRyGTDcbP90zRUoLoYyak8rYmwXmH+Dn5bn676LKu1gYKDCiEGzeDAtRkv0LJIMEp0cg6mjJNlsel/qlxNiDDOUj5NP5xJfn/3lG2myO5bnpDRof4n6jjdsneZDEmZyW2yyHshf1mX+SZxuOcpdTdeA04tNOZCfjhcDux3YH/LwsTyws/+nQFbtqZJBdOakCeytpB01+K5pi22fnyw3K2bCB2FnIUEoNTa2wzOtCuyySuWdOu3tHF3W/AzKv1wbis6x849FGTsyS2enejvPssY5IJZfWJrM5qy/L/e
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(86362001)(8676002)(66556008)(8936002)(6512007)(66476007)(66946007)(6506007)(53546011)(4326008)(38100700002)(31696002)(83380400001)(36756003)(6486002)(316002)(6916009)(54906003)(508600001)(31686004)(186003)(2616005)(26005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hiMDMjJ4Ft/K3yA7VBrvbflw/JEq+gE/7SMMkZfdJiIFZWdnafm/9fdS/KWU?=
 =?us-ascii?Q?kYoGT4/FIWRpZ0yLhE5UOIoUmgX+6rOU4exezZhHw0K3Q3NrqcBDBvOiEVh8?=
 =?us-ascii?Q?t1D+YYtaLUZdPNHZXJjaT8604Wj/456gdxiKf+WJJc+8YhyLWMlK+FcxbL3H?=
 =?us-ascii?Q?JlMFkZzd3A0h7DpzEHYhkCrreqmTOW/gpWo94aG6bcTvXZkjxiGNhApAYkeM?=
 =?us-ascii?Q?DvO6mKD8YnINHagugz2MEmy6o+lLxNx7ulrY2+X73VV/dk3ukF/+sF5gVMDQ?=
 =?us-ascii?Q?eQTt41GAjiRKgyhX8xOZyansh4aWtleWuKiKky5HLR87Oe7dsYYANj/8w+1e?=
 =?us-ascii?Q?6v/dCjs7pIHE62Edj0FEuKdZZYN1t3XpkLDQ9C6NwYGnqF29DcCEPYf31oPJ?=
 =?us-ascii?Q?XoY0zL/+C0KGoQKFXX8x0t37z2znJQr952vbjhOFNn2r8EueglwkW2Q5j0Uc?=
 =?us-ascii?Q?ydwfmiXzayvB+rv0KyvFmeKDsvD+RUQLZKCPvA1J5dDJMdYGdg0Q0pMk3pEk?=
 =?us-ascii?Q?V3Yz4UcTsQUw5s1doOB0fwzVa40RpT1k6uxNLTo6fUtFaHJNpWPSnRWmkGPs?=
 =?us-ascii?Q?JZaC8ZtIvwfBVPCCjs618Gt9XQPORsXtHZ8xX9pBP+nJHoc5H6JjIAmH93c/?=
 =?us-ascii?Q?MMxKjnpoUwEIl28euv/y2eDrgXSk8VoItMN558XS1k+eY2OIFb2JtvnLunbg?=
 =?us-ascii?Q?hOiKONH1aY12vOPKEgu78LPuXu/Ltic/X9SZe6kgG9C9fUYlrtmYqfl6VKcV?=
 =?us-ascii?Q?Y/PPqQfWNL4wUDFyA9ZwxsaS0jsFk+sjGnF3mUvbWKG4XuANShYQuRXld7wx?=
 =?us-ascii?Q?h3c1sU/gdZe8lFA9L9fa1vKSUFz0mQ368HDG8nmP2FsitbjI66lb22QVh9Lg?=
 =?us-ascii?Q?APLdWt+YpYfZAeV/xxCinSVDscI8ZpvXTfKZmgkx0AbibIwL88bpb05VTLXm?=
 =?us-ascii?Q?hYSRUITjvN4AoMY+YGihJhOGqj7MAT/JZSYgzyqqYsKTkhNjWuEh5eL2jrSi?=
 =?us-ascii?Q?sJR0VP8vh6U3TcgN0956IkHFOvJDzdl4139M0YEQT+PaIN2WsdqkLJMtL0je?=
 =?us-ascii?Q?3xE6yyeqqcMXxYwcPyrBhOK1Fp1yhzUZmxJjB9Dmau3awW4FBu2cvFvjuTxt?=
 =?us-ascii?Q?v/Nk86r/AbY0n7qC9zQQ8QuX5UvPUT9jx3Z5tCwaanxP4X51yu1S3ZuB2+5R?=
 =?us-ascii?Q?efPAf/nQPFv0F+wd1yt9HoSj9z0aZ8Bit1Bi/NEhB4E8P0xpjHAeTfnU20Pk?=
 =?us-ascii?Q?Y7XPyzNjgz+atZS7lJShsvfJ6rFa6F5Dy8lrmh05tEM68XjB+nZG1XVYzKVS?=
 =?us-ascii?Q?1O8MuKJp93u8c5k58KpyYHiwUPvnFy+Y2D0nANyzBGBfQCADo0/3eAhrlxH4?=
 =?us-ascii?Q?1KTiHeu/yDVjHz1rfwCcLsGPx709VrKhiViNsJDQk984+1W0g9mEDqE6knz2?=
 =?us-ascii?Q?SOfoaB6JdZmOQiK2M2rsmV48WrVAhQgmPL63osfkgnWmvf9K78Cc0d/FbRkn?=
 =?us-ascii?Q?ZL+Emym0e6aQVAafnWk4uRZbUzy7KsbIYanjNlJn8x6W6uZQBrDNP4Pkbj/i?=
 =?us-ascii?Q?JhgQXS6MI/TV5tRGap1BH84Eu7zIFmYeFOPxbfeJVbGHKVvsVpWpiLUaqtYM?=
 =?us-ascii?Q?iZAn/fUBJ5oqOUuP+fgXXaSTFU9vO4bRWNJqMUl6wCqT4Pe0w502HLCweq5o?=
 =?us-ascii?Q?udP3Kf4IwEgjIXiJsQWDgSNsBWi2ttBkKwGzMUzlrjYaDRWK3xY9xeYVdRqC?=
 =?us-ascii?Q?OFQ2AGIJEQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa555ec-a665-4264-5b7a-08da17aa36be
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 08:48:25.8232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: asP7MgncAMIt+EjC7ItmYfZ+VxIz2Qzmi17Cpxbzag4F+rX/ihFIAJo2a6pUAnbrrVwl/JOm/6uy0aDbdehJ8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4237

On 06.04.2022 10:46, Roger Pau Monn=C3=A9 wrote:
> On Wed, Apr 06, 2022 at 09:06:59AM +0200, Jan Beulich wrote:
>> On 05.04.2022 19:17, Jason Andryuk wrote:
>>> On Mon, Apr 4, 2022 at 11:34 AM Daniel P. Smith <dpsmith@apertussolutio=
ns.com> wrote:
>>>> On 3/31/22 09:16, Jason Andryuk wrote:
>>>>> For the default policy, you could start by creating the system domain=
s
>>>>> as privileged and just have a single hook to drop privs.  Then you
>>>>> don't have to worry about the "elevate" hook existing.  The patch 2
>>>>> asserts could instead become the location of xsm_drop_privs calls to
>>>>> have a clear demarcation point.  That expands the window with
>>>>> privileges though.  It's a little simpler, but maybe you don't want
>>>>> that.  However, it seems like you can only depriv once for the Flask
>>>>> case since you want it to be one-way.
>>>>
>>>> This does simplify the solution and since today we cannot differentiat=
e
>>>> between hypervisor setup and hypervisor initiated domain construction
>>>> contexts, it does not run counter to what I have proposed. As for flas=
k,
>>>> again I do not believe codifying a domain transition bound to a new XS=
M
>>>> op is the appropriate approach.
>>>
>>> This hard coded domain transition does feel a little weird.  But it
>>> seems like a natural consequence of trying to use Flask to
>>> deprivilege.  I guess the transition could be behind a
>>> dom0less/hyperlaunch Kconfig option.  I just don't see a way around it
>>> in some fashion with Flask enforcing.
>>>
>>> Another idea: Flask could start in permissive and only transition to
>>> enforcing at the deprivilege point.  Kinda gross, but it works without
>>> needing a transition.
>>
>> I don't think that would be right. Logically such behavior ought to be
>> mirrored to SILO, and I'll take that for the example for being the
>> simpler model: Suppose an admin wants to disallow communication
>> between DomU-s created by Xen. Such would want enforcing when creating
>> those DomU-s, despite the creator (Xen) being all powerful. If the
>> device tree information said something different (e.g. directing for
>> an event channel to be established between two such DomU-s), this
>> should be flagged as an error, not be silently permitted.
>=20
> I could also see this argument the other way around: what if an admin
> wants to disallow domUs freely communicating between them, but would
> still like some controlled domU communication to be possible by
> setting up those channels at domain creation?

Well, imo that would require a proper (Flask) policy then, not SILO mode.

Jan


