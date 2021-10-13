Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A786542B6F7
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 08:19:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207902.363856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maXbO-0002Us-Uo; Wed, 13 Oct 2021 06:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207902.363856; Wed, 13 Oct 2021 06:18:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maXbO-0002Se-RN; Wed, 13 Oct 2021 06:18:58 +0000
Received: by outflank-mailman (input) for mailman id 207902;
 Wed, 13 Oct 2021 06:18:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1maXbM-0002SY-R7
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 06:18:56 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 710cb944-2bed-11ec-8160-12813bfff9fa;
 Wed, 13 Oct 2021 06:18:55 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-e9S8OCbtPNaEJs7DEAiQAw-2; Wed, 13 Oct 2021 08:18:53 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6864.eurprd04.prod.outlook.com (2603:10a6:803:138::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Wed, 13 Oct
 2021 06:18:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Wed, 13 Oct 2021
 06:18:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0168.eurprd06.prod.outlook.com (2603:10a6:20b:45c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Wed, 13 Oct 2021 06:18:49 +0000
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
X-Inumbo-ID: 710cb944-2bed-11ec-8160-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634105934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WBG2AhPsSw/wGoQqBkcgFy1H6ahe2YGyvRRdFl47v9c=;
	b=HPpYZNA080aeGp9CcuS+mKAZw9hJqiQMBAWOOOIh+5Rrh8hzOd3Xret1gd3qs0ltAB5FwT
	3VEWLO2hgdszO6OWPSlUvv8xbyJ574l9zTkHl9HHhs72FqaW0ffq6SwT+Hlu+aibpFu1Ew
	Ut8xRGJdReqEFTWY+5i0cgvmBWp9Ljc=
X-MC-Unique: e9S8OCbtPNaEJs7DEAiQAw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AaQxwL8DvRLOH5SJ2P2roqGDq9z/+7LiurR5FYsUSOlMT71EaTtHdlbSiNDsPBZT3QELb18DUK0mA7RctaxY7wd+hcaxUUU4AzMPgDS8ukxIGDFWh8kcp+xMEKIQ4E0IitUmK+LSuF/MthY+C/dWKDov48lqXZIkuGzmB6rb3D+txN8YydHhx/DCHdAMA3o9vVv8UnCSDkN874LMe3GajLdFopX6trh/l7x5tA/ABkG4rqMecpmVrk4KBoT/RaS5u+CaytB/cjh8D90zK/8JZHQ6uJzPYB+RvgHDoYFM1kcMxfrjFghOP4RcvlX9zHM+mQaOivOMWw6ygWTN8mrSKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJWFV56z5wpXuhni8G3GdSTKbqhWbOcPLQPkdQeET80=;
 b=gNavrNTQKrxLLZB/nBTBXwvPj+4KK6z85he0e1iPSiMgxF+ZI7ZrxcnJtWQ5kuTldR8mNdjJ54i617KdXsAs4h87NFuJ7iVlP3d+qh8UIs1b+HNyGVBiSWO2hPjL3o7DM20qq/Az5rRDCotyIFUO4RoNumbaJZV/C2KKqi+FhjSHU2B/4/FeKTZOm50FIHXl+5OZcK7IkL3d7ygRIj1HVvvK4nkmZTjJjZewZN7A70RSIdtQTXVsPe4ixiQ3mZnSE/oOEvn0jM1uU34Gf05X+UlHxoLdg+/IvvUK/u8KTM7zjKgLeqM8zpi9buMbS5zZ+qXnDRP1bMSGlyJ2M0iXmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v5 07/11] xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org,
 bertrand.marquis@arm.com, Andre.Przywara@arm.com,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <20d5b9d6a0d01a7b90711d28cbefb5701a88b438.1633540842.git.rahul.singh@arm.com>
 <YWQDguvmf/O4rDIs@MacBook-Air-de-Roger.local>
 <alpine.DEB.2.21.2110121439100.9408@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <44eae5c0-28a0-590a-07c6-6b411b23ebc3@suse.com>
Date: Wed, 13 Oct 2021 08:18:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2110121439100.9408@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0168.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c696db9e-ea1d-4b6b-d640-08d98e11531b
X-MS-TrafficTypeDiagnostic: VI1PR04MB6864:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB68642E998AE8DAC4232FF3FBB3B79@VI1PR04MB6864.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cWjOufo8rMyAQw6ET15ETJ+zKVbEqPbXlB5YsB7qt8V+xisiL1UL9b6NEJUQutGj6jcFGIvYJsi00Z5UAaKHcRZ+8+2+FKGZjFrbFhFsVBo+yGvUtA2gmfTRavpmpBXe1u537ctN3Qrc8u9MWnZ41gWBt1AL7XDl8mqebvgIF06cjGIrmH0gLwh/JoMubAAf80Spd+xU59MCO73C835JctTRTJCp3pczvqyKcnlsWqY24XHGD0Dlr2eTCy7qkzdLqtZzugEOuicPqlA/GYnuRHpEcKkrOfUkEicbswAUr2pHwkM11n3J63HZBsElxhMmVcTmXZtRk7ixDqIXDNZfZpTKDjtqRZ9z6zxJ1F6Dyyn6p+ikEMZAsXgFRZUvY0R2SVw826ghJfVFLxrSWJkB2ZXprBZQqlrraGcYygYp64O14LB9pt/79TL/CVh7BcQl3dPGYfy54NM5+D+VJUxjKJsyEMhj6eCoayYMeLkfIiJZmMW1xVuvdU2LeFsoQ0ccIUTVph1JKETienv1tTY+CDeJJ8HrLt6BpdKd5/L7JYpl4//xHmbLUjPOWz+V1mJvLDAbgoqni441eBojsSA+YrhQdJf1ofTZx/x6iy6xZ4XOfB2p00hYc7cu3II7nqovwBLm9dGRxvq0ZP/U4xHVwYtYEpaSE7jdCYgfVhx1nN07fW7NXM9I08Cq+LX1fJPjkVYpGR1u1R/Km7lnDdiS8KaqUdYYwtOTcJKeHYHbp6s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(31696002)(53546011)(8676002)(316002)(7416002)(8936002)(38100700002)(956004)(2616005)(508600001)(5660300002)(4326008)(54906003)(31686004)(6916009)(26005)(2906002)(186003)(6486002)(86362001)(36756003)(66476007)(66556008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HQyZJ4q5fDDRe5WMIHKSbyE+o9CtYv5rvEPXbtFbiDeHZUUwvHuHJnyqOe47?=
 =?us-ascii?Q?b67t3Hl9IlZ4A0vmCfXf//DgB53De+7H3L/ecYdG0kl/HKWTxw+g/CgNqdC/?=
 =?us-ascii?Q?LjD6xK2WBRcZPraEveTVea5atQlv44mJAaMnMjkFyRMdGB6J2jqbYY4Z6xfB?=
 =?us-ascii?Q?MYm/DPSit7FnILjmKtG02dfqlJoCLlfnsH1DMBMKb2YiBh8IMJwgNJ2AfZx/?=
 =?us-ascii?Q?qI1fZ7+9udcwe9Tp43bZDnMqasCALzvFT4lqtEj3j6umuxWhqDTuaamqyG7G?=
 =?us-ascii?Q?aw/8Gg+wKCQDeoQhiKvSdFjJ+liatv5QaxKz1ivePuDdx6QqTLXBbd+EBu/d?=
 =?us-ascii?Q?lGGxUpZvtda1Y7qN1SDD+0PAZC5QjcpfpC0L6UPOddSJjPzQoveVsCsUbvlq?=
 =?us-ascii?Q?XTtHnk8RvMblmcDhmhoQESYGazvWM3OArqhJ8EEOiItmFEZU5nQbIqShUzZE?=
 =?us-ascii?Q?56xPDBM+YVWEtJ3xUlUwvqX2JO1KP8VplMj+EB1ACYpa8uTXPny6s1mvQsyb?=
 =?us-ascii?Q?p8jhfysj3+CY2HvkCywd9bv9bZjHpoIxBOqJiOWb3QhOBQIW+CsVwUQfQR2r?=
 =?us-ascii?Q?xEpqaEr6kYR4EkcCxzONTAMlDOceH3B7jXZG/ydXpuAfblkXwhWOlRmizlgd?=
 =?us-ascii?Q?ANnFynEyqjkQ2nhv4vReUzhCmE5BEEOvODjvTOvb7gbbynCUNKNAhJF8PDB5?=
 =?us-ascii?Q?zV+cx/S9lEWIcbMehjNp1thnB+9povft7uUPVcPDw3XMbzFkMaXbIeEaNdbs?=
 =?us-ascii?Q?GJoqvaGK/2ivE/OvVuxiBkZZc0BL5TdoPPbGLeMzqmCjJ8rua79W96kx52Ey?=
 =?us-ascii?Q?jbJNexjtfjyYWfO2vTSqbkUy+P/SJUregrtC1t3/9y4pUj4XlGhNjt/69vai?=
 =?us-ascii?Q?x1jZCqljfsK5ZidZbEdsHD8WWTlK0z7ct9PIFu/6x4J38AkASY3PUAoT8Liy?=
 =?us-ascii?Q?c7wEBAu4QVA6l5wVz73lYeDqh3rnDBm6XP7XIcQ/vDoO/a+CDECdlIiWTUlz?=
 =?us-ascii?Q?HlzlPe7lqs+9izk7SILAQYzZgsgPpIyJuD9jYtoWUD3a3JLvMDWtSsiwqgJj?=
 =?us-ascii?Q?H5d3WVXhAQixyS4CQAhLCl+VRc8hbzqmEsWeN7M5FF/XplmgEub8FuAiAF50?=
 =?us-ascii?Q?DNeVHkaGuDsSlvkulpKc9c6M3AMRzKJfobP8qRFVyZFLoUYIsqcYqRgPolCY?=
 =?us-ascii?Q?QVyfg7LGx1v8UzuvpXa2FyrcnxhlV7O3eZ2EYBn7hQCTed+Fu5lP1Bfjw+NP?=
 =?us-ascii?Q?iGHcoP8+hYvsm6Mdukgk6BS1CKEr/VF19rtpCsib6MKyALNwvKmr+uuO5LKM?=
 =?us-ascii?Q?T1sc3+FvvcwzlVRlF4tiITTg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c696db9e-ea1d-4b6b-d640-08d98e11531b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 06:18:51.1086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IbbECVFzrh9iwqFksvZ3khKrtfBKonPYF+UXOMCkERL581HcMZrdFxjSU8tbL49AEMUReJFFNT6OSbnCUSV3ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6864

On 12.10.2021 23:48, Stefano Stabellini wrote:
> On Mon, 11 Oct 2021, Roger Pau Monn=C3=A9 wrote:
>> On Wed, Oct 06, 2021 at 06:40:33PM +0100, Rahul Singh wrote:
>>> Introduce XEN_DOMCTL_CDF_vpci flag to enable VPCI support in XEN.
>>> Reject the use of this new flag for x86 as VPCI is not supported for
>>> DOMU guests for x86.
>>
>> I don't like this approach, XEN_DOMCTL_CDF_vpci should be set for x86
>> PVH dom0, like we do for any other CDF flags when Xen builds dom0.
>>
>> Things like PVH vs PV get translated into CDF flags by create_dom0,
>> and processed normally by the sanitise_domain_config logic, vPCI
>> should be handled that way.
>>
>> Do you think you could see about fixing this?
>=20
> Andrew suggested to use XEN_SYSCTL_PHYSCAP_vpci to check whether we can
> set XEN_DOMCTL_CDF_vpci in libxl and it looks like we have consensus on
> this approach. [1][2]
>=20
> So it makes sense that XEN_DOMCTL_CDF_vpci is only set when
> XEN_SYSCTL_PHYSCAP_vpci is also set, i.e. XEN_SYSCTL_PHYSCAP_vpci =3D=3D
> XEN_DOMCTL_CDF_vpci.
>=20
> From [2], XEN_SYSCTL_PHYSCAP_vpci is not going to be set on x86, so then
> XEN_DOMCTL_CDF_vpci should also be left unset?
>=20
> If you think XEN_DOMCTL_CDF_vpci should be set for x86 PVH Dom0, then
> XEN_SYSCTL_PHYSCAP_vpci should also be set for x86 PVH Dom0.

Except that XEN_SYSCTL_PHYSCAP_vpci is not a domain specific attribute,
but a host-wide one.

Jan


