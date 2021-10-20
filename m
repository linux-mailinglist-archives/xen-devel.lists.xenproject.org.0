Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B833434A8F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 13:52:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213874.372233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdA8g-0008Gh-0z; Wed, 20 Oct 2021 11:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213874.372233; Wed, 20 Oct 2021 11:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdA8f-0008EL-Rv; Wed, 20 Oct 2021 11:52:09 +0000
Received: by outflank-mailman (input) for mailman id 213874;
 Wed, 20 Oct 2021 11:52:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TQMG=PI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mdA8e-0008EF-Ai
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 11:52:08 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25f9f200-319c-11ec-8342-12813bfff9fa;
 Wed, 20 Oct 2021 11:52:07 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-9-6480qJJ3M-CVsW5LWVe9kA-2; Wed, 20 Oct 2021 13:52:05 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5165.eurprd04.prod.outlook.com (2603:10a6:803:54::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Wed, 20 Oct
 2021 11:52:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 11:52:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0025.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Wed, 20 Oct 2021 11:52:00 +0000
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
X-Inumbo-ID: 25f9f200-319c-11ec-8342-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634730726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lGPL/IRaH2ccLAhb1RGNNka/d44nqp8OCq1bQpX997s=;
	b=EuMMf4IU8Q8vyiPPCMvZ40Cs/og3715zRVIFqL3Kwgz08DYW9DD0cfP7A9+B/vFgSOETU8
	X1TiWefqjALlMERT5i44Et4iiJENQHoLF+3Ty7lWR/EfA3qsWbihFgdWEPAtahRHLVs4NM
	LD9qu7+L8DnCa0kbN2/c+FF+NxzyTR4=
X-MC-Unique: 6480qJJ3M-CVsW5LWVe9kA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=flBHUXrtuHJSzVTKVOoiziNl5Nj+w1aRWH1SX5TTuwMVg0C6pMBV10Hy9SHKT5wDMyUn6ytXOGYXj1XhQrMs4Nox/ezhKC6zh/Ta9i6MkCDDZydzMEfCjT+gQuxLldu3OarUfsiMTqUROtnJLh2zZsUMbAflVUDfJ4iOnuATlE6/NVE3alJ1bI7CcaHZRX1sT065dYkb7AytAvKZzQKeuhMymF/u9jY8XDcYDAgDVRzprlJZxocEbYrZ4xaYkJJPETH2O0EQq0HtJ2Sx/Iana9qeQZ4J1PpvOuASzadRthFlPql8weXA0I+3XYXmdoouldi12GBpT9BcQm5rMLTBjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIGyADdSfSN+NDJQ+OAxaOrxHI4Tg4Noe6rYwC/Nlys=;
 b=DehL5vgt7GoNi3G2Ie9ooeNhSjCADPXsvXlvucNO1MFocTDi7l49tpsWRvRnWy4EhMdJr3QyyMuu/jJCRD1w6XMJcXj2bNc5BufaVpJfzGgrXzCgIx0eari1QkRDwY0k4zyzFzlVr7/yeLVQ8aYIclvNGEZ7+Nu1Qv66H6cCZTsT/vHY9SCLxPC6OdX8wZ5GMtIOhbSY02xapPIu4nDiJ2xUG3jU3LNbfeCR5+63cXmvJiXICN7H/kQOFv9ERu9ezQAnuZFceYyF0L5otnP58qWfHgyvVlDV3z384eyAka51LAfK5WT71lPeNS+2DRb2dSNGO3o577V2BMYbrGcjVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 3/6] gnttab: allow per-domain control over transitive
 grants
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <20210922082123.54374-4-roger.pau@citrix.com>
 <1d741841-6aaf-1d33-e1c6-b98f77ce41fb@suse.com>
 <YW/r6Dk5a79myhzy@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dc514908-a1a9-7ce1-5490-16be3f8c74a2@suse.com>
Date: Wed, 20 Oct 2021 13:51:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YW/r6Dk5a79myhzy@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0025.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::38) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 169bee30-c24a-4bcb-b016-08d993c0070c
X-MS-TrafficTypeDiagnostic: VI1PR04MB5165:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5165E973A391F8515F583E8BB3BE9@VI1PR04MB5165.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Tumy2Hd74uszxjz+5dA6KIqt8qBEWC6M58Su1fPrejDZwYIXv6UGmbny3Q7xQhKBcIoHF6qdhAHjhF16Jg8OYcF5D+HbCaIoeJTdZGxj+KbtXfkARgPfSUwI4RnkjzXOmJTzlfquUngA5lOvWpBSlDkOPfeC1yACY0JzI1OklN9fddy2nrkBlT7Sn2DAvW2oXtgDVyQwEPT5T5dVpp3XOJIX2te3YyVyR+1TYrJR6z/3CVFHuEvE56bZjyEI4VDSGseGD+Hclj0PsEvCfIXxCZorFdYV37BdXqj7ytm6Z2EAyGtdh3x1C4ROl6oDmdv4xR9XOEkFtzYj2cgGtRABEwlY+2PUNm73jaFTzu7gf7fTCGZOyaaS9Z6mpeISrStfhGLfj3Dj4T52Fj1xDBbhYK8+8/glltNnp+ldI8Mgl4SKbmnXGtsDY1k1arzk5sU1adZHklW50PqX0L7+nCMYLlAKsGCtx742fCYYDn7QA7aYsjMOV1tx2Xitd/BTSC/RUVapsPJ3jd4A5bnKJjcFJimT0AvFi5WMcI9ZKTU0KQBpQjNJ+IO53K0NzSA7xNoXUf8/ScbKLjJNTbG882gWElpizc8ANc0pEwYTDEOOSt4engLrWJjGun+joyvS3PkncDPAsO9oBD5tF44pIYnti1lz0z6IrWBALjEyCyKOHgIYqn8KwpRZa/SZwycRivw+uIStUx2SOE//cA7nm83a95ZIXlZ2r/SDIVgAsC8RvUxGU/2oUUgHnom2HmrtUZ5x
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(38100700002)(5660300002)(83380400001)(66476007)(66946007)(54906003)(316002)(16576012)(66556008)(86362001)(4326008)(508600001)(6486002)(2616005)(956004)(26005)(8936002)(53546011)(8676002)(6916009)(186003)(31686004)(36756003)(31696002)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H8dKQzwxWQ/0ch0Az7lOKMYuJjcj4ja8EpxPdQtygIi3fJ/kO03tyaLii7Hi?=
 =?us-ascii?Q?ZDRyQHqZD3etcOCWmTy+6oYef2k668B1c5Ua9t9sciqJZUDEHs9bE0S06QK8?=
 =?us-ascii?Q?vP326WD21ZK5cXle+Im6tIi9OC6aGXh5yGXR5aYgUMZsnggdP3YTflvA7c19?=
 =?us-ascii?Q?fnsuudpqt8x/HThDc/6wFDLfi40RKv/pamgZ03PrcM5EhYV3o2PRfEmRD9h5?=
 =?us-ascii?Q?5FqG/xBhCplKNooiBbog/o18tB7BRabvobab8tNrGapndXtV+BQyHUSPcCEm?=
 =?us-ascii?Q?0w0IcyNKfAxTg+EZWxXZLrwDMnAD/+49d3Gmh9oCn13Z5/3fDCndZtrvvbmO?=
 =?us-ascii?Q?FOC9GpdqTJ25QlaWTPmecenVsIZpkEiXIOvUbZE73piOAKcEjfEpWRA0ufi/?=
 =?us-ascii?Q?Ml1mLQN7xYvheH41+2mdHPFGhkS42wS/ZR6OfnkHo7uY/BNkqepIEShh1YR0?=
 =?us-ascii?Q?EgJOofHf57nzX5Jk8iJuOWr3qxhZQkk/VTDypRVN/LVuJ6EsC6MCkPeSAZus?=
 =?us-ascii?Q?AHaoBTN/2NMCis5MpO5A/MkiZ4SnsZnaGpZ1FB1E5GU67OBBM8KxiXWLxYnS?=
 =?us-ascii?Q?LdRyuyTcMnWKFhuyzPoNftJgHzhrX6586j0/vfR+nUwo94hb5GC99Ba4J6oA?=
 =?us-ascii?Q?ggJwvtsdT0T2ZI5iDXwRviwVTfc76wk6i7OrNguE0E0NZhzmtmX2PNWLI1lh?=
 =?us-ascii?Q?LRFwLA7k+xEU9tREL4YVXVTda6jQGdIjsq2ZhoqLrXnifB0OuVowzd8NDOR8?=
 =?us-ascii?Q?bzJnlBdfjfAAdIlYrM5xi38KNSiBICC9rIAfE9bFs1ZIO8nITIzkYCpIqsHv?=
 =?us-ascii?Q?7pzQVKBiMbwwJWtciGM3TcVgTD3swn2sVMEadwfw+qSgNPOCWp+nY+5fEQEm?=
 =?us-ascii?Q?jxzkwv47Vy2nfsgtqSPCL2By31bYgK3CYVcQsDv0s2LTsPW4RPEm4fsBjczC?=
 =?us-ascii?Q?YOxq+dPQVzHhf6bcISYhufGV6L78p0Qwctz+tdoM4GXVOkumptVZzbSAgWpQ?=
 =?us-ascii?Q?R8PBms/nvs3c5cK/ta0z4xzJEACO3H3IqTTjn/URZjmVNK0oW5jWV8vj2PQL?=
 =?us-ascii?Q?a/9LrsM4E+EC4cLRyKBs+7gpDPD2a4bG7Gz8lqdoLgAYMW2zO0MOZL2MX+Qh?=
 =?us-ascii?Q?PKxG0cQUmjKqXpPvRLvy56uVXuOHqvhsbXsqIgVIwF/cFhRjvOo+43Qna9Sw?=
 =?us-ascii?Q?gX1fGsJs9LqRpSSS5SgWkEFipfD0VaY1Q/mwxdHb6jqiK7rk01voo1F535dr?=
 =?us-ascii?Q?x2CtkLXZ//mOyDE3Os4YARwFNFmJ6+fjwd2UPyYWW7R6wBLtznAaHsSaSrMb?=
 =?us-ascii?Q?sZl5DmIL+F7Rz0/8PnIWM3cg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 169bee30-c24a-4bcb-b016-08d993c0070c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 11:52:01.2041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5165

On 20.10.2021 12:14, Roger Pau Monn=C3=A9 wrote:
> On Fri, Oct 15, 2021 at 12:05:06PM +0200, Jan Beulich wrote:
>> On 22.09.2021 10:21, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -750,7 +750,8 @@ static struct domain *__init create_dom0(const modu=
le_t *image,
>>>          .max_evtchn_port =3D -1,
>>>          .max_grant_frames =3D -1,
>>>          .max_maptrack_frames =3D -1,
>>> -        .grant_opts =3D XEN_DOMCTL_GRANT_version_default,
>>> +        .grant_opts =3D XEN_DOMCTL_GRANT_version_default |
>>> +                      XEN_DOMCTL_GRANT_transitive,
>>>          .max_vcpus =3D dom0_max_vcpus(),
>>>          .arch =3D {
>>>              .misc_flags =3D opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED=
 : 0,
>>
>> While I can see that you make these adjustments for retaining backwards
>> compatibility, I wonder if we need to, at least for Dom0. Dom0 doesn't
>> normally grant anything anyway and hence would even less so use
>> transitive grants. Of course then there's need to be a command line
>> control to re-enable that, just in case.
>=20
> dom0=3Dgnttab-transitive, or should it be placed somewhere else?

That sounds like the place to have it at; at least that's where I would
have suggested to put it. One question of course is how it ought to
interact with v2 being unavailable.

>>> @@ -1965,6 +1969,8 @@ int grant_table_init(struct domain *d, int max_gr=
ant_frames,
>>>      gt->max_grant_frames =3D max_grant_frames;
>>>      gt->max_maptrack_frames =3D max_maptrack_frames;
>>>      gt->max_grant_version =3D max_grant_version;
>>> +    gt->allow_transitive =3D !!(options & XEN_DOMCTL_GRANT_transitive)=
 &&
>>> +                           opt_transitive_grants;
>>
>> No need for !! here afaics. Not even if there weren't the &&.
>>
>> As to combining with the global option: I think if an admin requested
>> them for a domain, this should overrule the command line option. Which
>> in turn suggests that the command line option could go away at this
>> point. Otherwise, if you AND both together and the guest is known to
>> not work without this functionality, domain creation would instead
>> better fail (or at the very least it should be logged by the tool
>> stack that the request wasn't satisfied, which would require a means
>> to retrieve the effective setting). IOW I would see the command line
>> turning this off to trump the per-guest enabling request.
>=20
> How should we go about deprecating it? It would be a bit antisocial
> IMO to just drop the option, since people using it would then be
> exposed to guests using transient grants if they didn't realize it
> should be set in xl.conf or xl.cfg now.

So perhaps for a transitional phase fail if the command line option
says no and the request for the guest says yes? Accompanied by a
log message warning that the command line control is going to go
away, so that people will know to adjust their guest configs?

Jan


