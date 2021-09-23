Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1CC415DF6
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:15:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193915.345512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNdV-0003uL-5W; Thu, 23 Sep 2021 12:15:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193915.345512; Thu, 23 Sep 2021 12:15:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNdV-0003sX-1j; Thu, 23 Sep 2021 12:15:33 +0000
Received: by outflank-mailman (input) for mailman id 193915;
 Thu, 23 Sep 2021 12:15:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Uzs+=ON=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTNdT-0003sR-Bq
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:15:31 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e7a39f0-6b60-4174-b36c-92995c46e266;
 Thu, 23 Sep 2021 12:15:29 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-vjnw-j-GPOyLHCbusI4Caw-1; Thu, 23 Sep 2021 14:15:27 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7037.eurprd04.prod.outlook.com (2603:10a6:800:125::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 12:15:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Thu, 23 Sep 2021
 12:15:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0050.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.8 via Frontend Transport; Thu, 23 Sep 2021 12:15:25 +0000
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
X-Inumbo-ID: 2e7a39f0-6b60-4174-b36c-92995c46e266
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632399328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WdI8tDnzWG98SmRC9bSEqoNO4HHkzvd5C8Nm5429JL4=;
	b=EeUdDlcAvYJXMflCQfJEmL1lutT4VOI6JrSdhJZo7v9MlIJHjffUFKp36TnYNtz2KPQMtr
	1P9CkgVW9jAaAwKC/1T82R6k1zVWJUEGWdn/RdsPeirQiTNEIeE7h+ZNVlrqz+cYHN/8z4
	BOZG5qgv5y9/pQ3Njoycu5b/tvIDpCk=
X-MC-Unique: vjnw-j-GPOyLHCbusI4Caw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iACBpTn7+EAyj9VpDsNsuhmci9zCGAycBl8yGq30EBcFEzDkZxlEqqOvlsszL1pB+c0r88MCDAOOeqlAqkX2bNDNn2Hd3HITgWL0v5+BKokMhZUj3T+0KFzEh6V1PwzZgHzhRlSGrm0p+F+jiUNc7IHcUJmaL79PsdrEFpdrtTDJgl96TpblqGTAm35Dg1XBvHFR+4HHtuEE3Fiu1pgB4mySAF+WscMfZNRAfya4dthQGz0LL7GA6Lf6z3AnYBK+CFGfIDwAoAQuz91xDhD+q+1/RBiDM3q9AeyRadJ7+cm/t8XUwRQwjvNkUQhgJa+Tbvq7DJbPWxE5dvFq+osrAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ExwpCERfHVHuyBQ4YOWGVqCv6sGKRn/7ZIEZKUo9moE=;
 b=Wtoabq85ED9akWW9+8pgCXbs2+eKXoTp2mOMCJWX3vpxN6RM6Fok5NtjciEfAyChAL3rN3mMeafycCuAhL09l3liCVjcU0ETeISFdV0QWYav5Xk4g/WdZBNsNlkfpLJNjT0DoZqjxtdAq8s1nXsjez/ncFHlsK8gPRUgczUz5SV5fyemVaQlqw6nhzr7KTGS0jPBTnibm+H9ma6pFuAuAWVMlfbzjxH13vwWwj4oj+KQUQp5dRi5CkPlsK7jC27IoXCxF8Ipv3v96ucxHeXAZ5INL+Rcx8ptPPwyyacZbFj3+j0zPpTph1Lzt0WS/V2VpkgdSXx7ffvm1wsvfnqedg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v3 9/9] x86/P2M: relax permissions of PVH Dom0's MMIO
 entries
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <a141e1a5-0185-4923-a91e-68c06a4f78cf@suse.com>
 <YUxgsF47nrTn8WrS@MacBook-Air-de-Roger.local>
 <ec456bf7-df78-59f2-6c14-5bda165125c8@suse.com>
 <YUxrE/kx8wmftVIX@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <33abd731-7c2e-8c9b-963a-fd446a21e87a@suse.com>
Date: Thu, 23 Sep 2021 14:15:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YUxrE/kx8wmftVIX@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a065442c-3f92-4133-deb2-08d97e8bd359
X-MS-TrafficTypeDiagnostic: VI1PR04MB7037:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7037D952FF2487A3E8BB3FD0B3A39@VI1PR04MB7037.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f6BPVM1vKtOu5NAeMEUmO3ffRI1IW9lheKoMITdmlbUsQgfMjdK/eKgfylVs0ko1U+yiya7TbkmcFbf+0oMETchtP0LTSuqCNuhNOiZHy+EaXayh7wBiBOgIkJ2cKW7fgJgIGSs2U06OGZI1QpGO43mILrCKcFfkXoOAgy5RUxZuQO4an9uoS6cIhd7/poJDXBmHTQsueIcuup2/YA0gK7tOooSbQ8mHpyBAKcylzVZzTtjhdLvP7z8HVR+FDrQSJM4QuK9r922ZFi+kA/bdi/inVNX0UpTZviqHxQn45tslHBvHtJK0HDgQRZqBmFBIFXZleY6fHLQ26jMrQ2SVwgKYen994EKVSQtbrwKgzZTfLeafNAXaCLIX4jOxy0QNUNZh7yX8oQI2stRByw4bjg9Lhk5PRpe0Llo+4qiXGZWFK/GcBg2TCTFjUo96TMDTwhICQRVOgF/t03Dppj0hl+cy1qcUFDAd4lGukux5ch6CuHGkUEqSojo8kOhJQtlBWfodKtFG+7UCRq29lzSYeiM71QqWPdXcOXmheyrA1SHZU2X46s41X2bbUm/XvqYdWd9iFRAaOHD8lhSM1Cvnn/Urr3NupiFpy0CVs7HsmGFX6h31HmzDAOTOwaT10d9Izyg7pPVVMawR/vHQcragrmvkXAHyEHWM3skK1zCwLI+eb1FFoqrmjqYaFo3YM7GJXhCHbYPDCO6vjIY+MaU0V5N4fyywUze1GfYmdD/Z43A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(2906002)(508600001)(38100700002)(53546011)(5660300002)(31696002)(66476007)(16576012)(316002)(186003)(66946007)(54906003)(83380400001)(31686004)(8676002)(86362001)(66556008)(6486002)(36756003)(956004)(26005)(2616005)(6916009)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5ubs4BUwoINKf1Hk35Hp6G0LqHetnykMacCGrLZxXZKJ55WKcQiYDU/op7ZZ?=
 =?us-ascii?Q?qzw4Gu6UdbgynQicha4rh3FkQF0+xXQh22btUKDlfFpeYl+g8DM6QwEQ3oXK?=
 =?us-ascii?Q?mnlrMI1R2313SrW4Mj2rYJrPrIGp/249wHG2780A6NqxGtxXQbb46mjPmlqO?=
 =?us-ascii?Q?W0lhxLNKHvGMWYJxxRUcxJvlUZ3mvuNo9+Jdge5prqm12Z/vG8/iPoE05d4v?=
 =?us-ascii?Q?0NHiNm2q1AV5pyvUSKokiucEC30aRJe6ZX7oQ5NIkx8ht7i4aiXxcIBMmQnN?=
 =?us-ascii?Q?RUr6GPUeqz93o77iC/DgS1th0FllhK2c2cEWWTwJq0rPmmYfNUJd0uNqKPQL?=
 =?us-ascii?Q?GFz8F3BLVojqWsv63qKjJevESRPtqN7FkfOZDhSwEafpDp9SPnsbfdWiLzPP?=
 =?us-ascii?Q?NcDiF9tCPjRfaW7CZ22NEFpiUOhCpoUh8KMuMX7SCzf/FfA4/AehINrp08os?=
 =?us-ascii?Q?BUjJbRVtmb0Q/E7CLXsdQO7PUKPO9RAEDLGYRHcCNAQKaimHaKVRoQ27HUDE?=
 =?us-ascii?Q?0mmcPr+nFC2LtjC8WShz1QzvBMcU/XEGpN1QUXDtE13S87+fzkNlFkE4kbOg?=
 =?us-ascii?Q?ZUi/ufwaJVtu8vcBOsYNt9ggyyxqUz3Tmc4IqQkrFTmNWOdd6d9Ri8Cwf4ax?=
 =?us-ascii?Q?lzskHrDU+nUKBiI7s2mho0hZNy2JzwaU+5YO9O4NsAhPN6UEStr2U+y6PCO/?=
 =?us-ascii?Q?4XDVkkDahhZSN7RnU416S/7Hp4B23m5zMb+1TN7SwyK+/6/e/R5Rq62wjzAP?=
 =?us-ascii?Q?MUjTHQH8XsmpUMpil9dCzxNrQBp3JK9FyE2odi4lrjCBR55U4V4F1gSWxQ7X?=
 =?us-ascii?Q?U6ZocWDpk/htee7vk3XtyE5pUGJtv9ktNflS6e2auW9HkaEp35HyU2ejQ2zI?=
 =?us-ascii?Q?w54o/FylEMQVAMa/I/nGDr1FalrM9W7jv3+l6EkZbOSK1usjrMrdkJFJ08E7?=
 =?us-ascii?Q?m2fq9r59Y0v3APIC3itTTaGRlueBVFG1BnXvmghzR4Fu2hW4nO1uPsWKnCRN?=
 =?us-ascii?Q?eXfxJh7ulDt1tExCNW2CP5ugnkZd3Y3eiqOEv5Dmc2r7ApLyiqx+lwSF4dMK?=
 =?us-ascii?Q?EMOJJCM2FAKwwrTSU3IDTNfAHMzJz6YrZcgd+msBHL+zCnSiH7CXv9AWbtWs?=
 =?us-ascii?Q?IdKc40isZgkUhfIwKwxhn1bEgFy1uAP42cZWvjIBfgrJOPN4CBqqqdf6P+Lm?=
 =?us-ascii?Q?ECjIutAOux+DxpvgK2Inu3lIkac2DrgHhhgcyFoW0RZwovlYhOzCoTiUHoCa?=
 =?us-ascii?Q?lf1ELRDyhXy8TCKSvhSeJqNzj/Nn4hBFiEFtKsnCqBo9RSbR3jqNVA9XusSE?=
 =?us-ascii?Q?G2xF/oLDO1BHLO5jNrU4nHNL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a065442c-3f92-4133-deb2-08d97e8bd359
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:15:26.2121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMMI8c8QJvlkaARM8hbTXZyV07u6exhONw/Lz2fZuKMN+BUoUfpFt8oTwsLJ73cDRaQsIfmIIdmp+6mTu6dNuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7037

On 23.09.2021 13:54, Roger Pau Monn=C3=A9 wrote:
> On Thu, Sep 23, 2021 at 01:32:52PM +0200, Jan Beulich wrote:
>> On 23.09.2021 13:10, Roger Pau Monn=C3=A9 wrote:
>>> On Tue, Sep 21, 2021 at 09:21:11AM +0200, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/mm/p2m.c
>>>> +++ b/xen/arch/x86/mm/p2m.c
>>>> @@ -1319,6 +1319,18 @@ static int set_typed_p2m_entry(struct do
>>>>              return -EPERM;
>>>>          }
>>>> =20
>>>> +        /*
>>>> +         * Gross bodge, to go away again rather sooner than later:
>>>> +         *
>>>> +         * For MMIO allow access permissions to accumulate, but only =
for Dom0.
>>>> +         * Since set_identity_p2m_entry() and set_mmio_p2m_entry() di=
ffer in
>>>> +         * the way they specify "access", this will allow the ultimat=
e result
>>>> +         * to be independent of the sequence of operations.
>>>
>>> Wouldn't it be better to 'fix' those operations so that they can work
>>> together?
>>
>> Yes, but then we should do this properly by removing all abuse of
>> p2m_access_t.
>=20
> I'm not sure I follow what that abuse is.

As was clarified, p2m_access_t should be solely used by e.g.
introspection agents, who are then the entity responsible for
resolving the resulting faults. Any other uses (to e.g. merely
restrict permissions for other reasons) are really abuses. That
is, if e.g. a r/o direct-MMIO mapping is needed, this should not
be expressed as (p2m_mmio_direct, p2m_access_r) tuple, but would
require a distinct p2m_mmio_direct_ro type.

>>> It's my understanding that set_identity_p2m_entry is the one that has
>>> strong requirements regarding the access permissions, as on AMD ACPI
>>> tables can specify how should regions be mapped.
>>>
>>> A possible solution might be to make set_mmio_p2m_entry more tolerant
>>> to how present mappings are handled. For once that function doesn't
>>> let callers specify access permissions, so I would consider that if a
>>> mapping is present on the gfn and it already points to the requested
>>> mfn no error should be returned to the caller. At the end the 'default
>>> access' for that gfn -> mfn relation is the one established by
>>> set_identity_p2m_entry and shouldn't be subject to the p2m default
>>> access.
>>
>> I think further reducing access is in theory supposed to be possible.
>=20
> Couldn't an access reduction introduce issues, kind of similar to what
> would happen if the regions are unmapped? (and that XSA-378 addressed)
>=20
> I think whatever permissions set_identity_p2m_entry sets should be
> mandatory ones, and no changes should be allowed. That would maybe
> require introducing a new p2m type (p2m_mmio_mandatory) in order to
> differentiate firmware mandatory MMIO mappings from the rest.

Hmm, indeed. No deviation in either direction should be permitted.

Jan


