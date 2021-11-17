Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E2C45458C
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 12:23:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226771.392003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnJ2A-0005rd-VP; Wed, 17 Nov 2021 11:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226771.392003; Wed, 17 Nov 2021 11:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnJ2A-0005p7-SJ; Wed, 17 Nov 2021 11:23:22 +0000
Received: by outflank-mailman (input) for mailman id 226771;
 Wed, 17 Nov 2021 11:23:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ayfn=QE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mnJ29-0005p1-2I
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 11:23:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c44fc579-4798-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 12:23:19 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-iKa-duLwMQ2QUZnzN8DXJQ-1; Wed, 17 Nov 2021 12:23:18 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4381.eurprd04.prod.outlook.com (2603:10a6:803:6d::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25; Wed, 17 Nov
 2021 11:23:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Wed, 17 Nov 2021
 11:23:16 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0101CA0003.eurprd01.prod.exchangelabs.com (2603:10a6:206:16::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Wed, 17 Nov 2021 11:23:15 +0000
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
X-Inumbo-ID: c44fc579-4798-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637148199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6LH8bjd2DOVyr7qTLgENFchGNs0/2XMC+Qhv4jBDCbA=;
	b=TYF+WkYYfFrD4yVa6hk3HZUxK46tbNvIAnlXm/SlDOQOQct3MqxqEVZiUrQhssg0JUmxov
	UErJJ57y1GRnY6+/n8+sKWbVl6hNVZ//X3788n4vCYs6jx7ZfhbHLUqqqXl4fe+WZn9lVz
	VW2fCUYQ9uL7HLHSfNH9Ny4IcPWkbGk=
X-MC-Unique: iKa-duLwMQ2QUZnzN8DXJQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XevNKNFbF/ArfF+3gn0+4e8XmxvHO6CIjk/Tcv8wMwojx7FZ8/yxvOEgo5D7Xi1UK7V0WyJyY/v8d3eA/JDzAxOBX+xAvrLeqPlCdhTPnYhammmweHQ2m0EoJrAqGY57v3AsxZy17RXg5rkFSIF0lySX3qC/Ac3+eaRUcfVcLJHeQwjhGcjPoOKdrbFG7e6prY3p+Et0cey9Ass+FcYiPAId7WvAZKw+HfP3FSqMpYVaS8EdxffRVqqlnodVkrJtIODBqRHOlKilQHF9/Vy0ikxOa+dVjBCtKeiV7Tr0Ct3jY8hE5dwDu6j10C0z1L6AsO+EpPAruMlCTcGu9eEoFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14hPiTk2gguYcKLApCOn5laYX8odgYsKi0JoiDkOStQ=;
 b=ZIIzikhL1SHIbeeHyYkIDTu4XbwxzYAv0ymfYf2zHx/gfMGNsBlvkTyVQJOM3fY18ArkZGD3kn61b8gKkLdXYX7gCauObaeIxjX8Wifj4pbGX1ulfLfGkEA1AWxAgx1JaZpGNOSIjabJS49KTXtYK7iPj8eZtD7J3gHiW6rm8bypfyo4wLdPdoT5EhdY2i+81mN7ySln3uCWaB2go1z7m7QAWxcZc+h+e07huhBXYE1+okRBA4VZ/ME9AL0KMTf7MAknGtyvfXp6lYEtH7KpTEvbEESyptd8Nnex+blnLCbguVL3d3kJbjR8jfdT6lUIskH1jW1QfqbIIoFmh9FsqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3d7d5069-591d-4535-c13a-5976e1172a68@suse.com>
Date: Wed, 17 Nov 2021 12:23:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: PCI pass-through vs PoD
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <b6d598cd-c244-2b7f-c731-fe839df3382e@suse.com>
 <b62a87ca-b68f-76fd-51c6-114e8b8e125b@suse.com>
 <YZTDkNRY5pMLFUR6@Air-de-Roger>
 <fe31a1b4-8c66-701d-f951-6426fa72252c@suse.com>
 <d2650a7e-f681-301c-6959-bc84a502255a@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d2650a7e-f681-301c-6959-bc84a502255a@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0101CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d79134eb-cfc6-4b7c-da10-08d9a9bca66c
X-MS-TrafficTypeDiagnostic: VI1PR04MB4381:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4381A142432912B982D79E80B39A9@VI1PR04MB4381.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1T/udkGfZzOx6+Epzm3SqXIM9jtshO4aQ6dCSN4bY1ar5e+lggOz2FyhISSnJ7Ux3ohyGzGjjbgzGbDnhj+67AZnFu9/liZ4o5TeSpp7sgbD/bwmMnOYLKjXgkx6wyPB4t63pc4IWSQhxeqD1rhmnMV+b9oL7xuqTj1D/E0I/TTBMCAzZj5kPynFN1+UcS7yfOBAeYc+BIqGCbcQDPLLktThIdFAPJSUUOsK2MBNc6lJPzdqmmSuUxmg8oSoJcwx9mfU6XtsOgsGD8r4Vc5K1WhTPB3YlwevYjnuamD3jCBWlPg9H6BuiBRioii0OCmUubfRuvRmt1d7XKVTGp09L7ulYbQVH+lSPn8YgCHDYfKVy0Dy3EG8ejtipR7opHi8LMos3RLTWnq3qChgf7k3pbN8j8zXWjcs8+rtdn3hV2QSfgUR0J1FNRPXvMz/gIYmsbIkL2aiQrfqIM6XAhfnqbuFpdwRi2df6PNTXVc1AMhI8qc6aFY5m/NQaKMyp0D827GNcBMEQWsDqMqYj0ImXrq2NNCN63RNgoBmy/qJoKS1NDIKjXq0yHBDeljmD5iOYaukEoQnOF6WaaFcNx5XheXnA4MX5bEO0i2RQ5qnWphcEX6HTL8sKo7Idk8rb0slcviP2JXZerR7Y/GRxI1SfPShmO3fGfmcxCn8clgGulHm9d7OOfnE8dUs4ZQOlETwzFWz6PahsOydohYrvnvQZQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(5660300002)(4326008)(66946007)(110136005)(2616005)(186003)(6486002)(8676002)(53546011)(3480700007)(26005)(31696002)(8936002)(316002)(66476007)(508600001)(36756003)(16576012)(31686004)(956004)(66556008)(38100700002)(86362001)(54906003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?diDpEUyvt3jZfnxQPkNBSRjCvpfWVIDPyzIlDn9IW9xNWDE/piTrQGNvKytA?=
 =?us-ascii?Q?LasrVGyks1nt8FQTq6URvDWNkTlDIHraoSnmObqTTHm28OQ59yXsqW4Riplp?=
 =?us-ascii?Q?2MPqy5uM3fNxL/bFhTUikKhjOUl7eArofXYR1yovKE1GHeRoNQst6UoVVo/K?=
 =?us-ascii?Q?PnXqgvd3eKjhxHV6x0dNkhZetUgVxDru0SoUbxduHUd6aHh7tvie8TvDryi+?=
 =?us-ascii?Q?NaMyeT9jSAu9WsXaEmNTQ5NsdcIapi2EW/8NS49kUmpla2EKMYSMp1fZNHYk?=
 =?us-ascii?Q?DX9LEmI3tb6pSGqo0N3hvLljVqK0nBsP7+0Cy8k/xplIbLDaXy6XH0JZrj/b?=
 =?us-ascii?Q?F8/glUPNkqZrpYIt48gaWaA1/8e2Tr96SLuiImCmaYsfeaeImV6HdBjVyckl?=
 =?us-ascii?Q?pRA1F/9udxw6kn2hVc8A5nzOduzI9DcA3qVnjU70e6Hk2U2ErTwWRZ5YuZVO?=
 =?us-ascii?Q?nujjhY9X0pU5V6ESNJGKVm6K7Zz+/xVyzf0buRUzA6Oj0CnFxpp6wHt8S2YD?=
 =?us-ascii?Q?eaBkShJiCcpOhQpEXeahyKFK3kmnWydgdtluTn1qLHWmz9Hjn/JudnF42CrY?=
 =?us-ascii?Q?b8LLvePq+odcK8dP1Ycn/Trzmo0Ky0hHf7m9OvOFKWDgOXFb0Q7Lg9UD74Pu?=
 =?us-ascii?Q?8S+wWNoRflU+qcxifkNBOMNMGRoQMoAza41VGVxgHSI9p8uGAod4aVqO1iFp?=
 =?us-ascii?Q?19lMoS5IK6obzGCntpWlDIIyVec4UxkAj0MYFCmzSW8dszeb3yf4usxGRZ88?=
 =?us-ascii?Q?6ojWSpdey0T2XaQsvyxeSf0xpcu2v8T0ppqnMfzoimIOsr+7Fpw4+Gq7g3tj?=
 =?us-ascii?Q?9FGfNYIX//K6sossnD6EF1559yYQJ8QCMiZ/dyTLnxZsgUG3DlwWCs9C/pKn?=
 =?us-ascii?Q?dbVD1Er4mYMPeitk5cF0VKFJjcFHgajjq9UKBiaEg536icQXWSu4wAqj9/JT?=
 =?us-ascii?Q?GnXMnhWCApFZW3OLSqEWLl4GRHys7CPcGxk4brLXBa6Ul62llO+Vxq2IvRiD?=
 =?us-ascii?Q?/c090GIUN9ZTt4dWXG4aeNvjSO29X/W/2lY6ZrndW7dCitXLZt+M1iYvP6IB?=
 =?us-ascii?Q?fwFBBw0Ot9+cQW1leIFUIabMDmGtOF49Xbq88xtb3Xsmv+wyrZlXiFyYhBRO?=
 =?us-ascii?Q?jaaYPfDXFN+snbl0J1Bw9zz4EUspktkSJHZEqP9yse+zT0U+ht1q4bih+ird?=
 =?us-ascii?Q?mdR57SI+Ou2R/kho5cB9ZWoYUz+9gpYVRH6PZgxq5rvwJ8l5KUYFlnVm/bqn?=
 =?us-ascii?Q?9k9bQEayQA8svz5c7SHUWadEoOp6kHuTACdxPm+xnclW6hQC++6RVCU2SGwK?=
 =?us-ascii?Q?X3xIyWgch5516j/XEXBNb8yzx+0sd6MdCX1fyQJrw8I7E7TeGABPgDP4YQND?=
 =?us-ascii?Q?C8Lm4ES5rDFpEQ9vH1ulAoQxdeqWT9LH0yFBpCDSMKnE5UV4npEQRGnsgvS4?=
 =?us-ascii?Q?xi3+KFLNpvTNqo6/gu5uOU/wKEcz1KIMV09KiY2gL0L9yNZjYBvTeVNaGdVq?=
 =?us-ascii?Q?UfOKruJf4Dv8j8BKSm/sVZu58hMms9qcgUY0MWq/Nsi5qrRIIFR8a6eXRrnT?=
 =?us-ascii?Q?U2C9tFK08T0VqiAz6XMUyd+ZlT/cUIEmRjZrSr5hDpdDw2aMmcyrmbENuvT1?=
 =?us-ascii?Q?2euMSu8AH7B0XZbAQCD6894=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d79134eb-cfc6-4b7c-da10-08d9a9bca66c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 11:23:16.1712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hIz049F40wbiwjLz3MOGpEIclgHZ6aAXIS7m9rRMy7QjccgG7b5RaBbI3JuQ3S5Xr/1FuV6lN0fd/bYEm0VsOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4381

On 17.11.2021 12:09, Andrew Cooper wrote:
> On 17/11/2021 10:13, Jan Beulich wrote:
>> On 17.11.2021 09:55, Roger Pau Monn=C3=A9 wrote:
>>> On Wed, Nov 17, 2021 at 09:39:17AM +0100, Jan Beulich wrote:
>>>> On 13.09.2021 11:02, Jan Beulich wrote:
>>>>> libxl__domain_config_setdefault() checks whether PoD is going to be
>>>>> enabled and fails domain creation if at the same time devices would g=
et
>>>>> assigned. Nevertheless setting up of IOMMU page tables is allowed.
>>> I'm unsure whether allowing enabling the IOMMU with PoD is the right
>>> thing to do, at least for our toolstack.
>> May I ask about the reasons of you being unsure?
>=20
> PoD and passthrough is a total nonsense.=C2=A0 You cannot have IOMMU mapp=
ings=20
> to bits of the guest physical address space which don't exist.
>=20
> It is now the case that IOMMU (or not) must be specified at domain=20
> creation time, which is ahead of creating PoD pages.=C2=A0 Certainly as f=
ar=20
> as Xen is concerned, the logic probably wants reversing to have=20
> add_to_physmap&friends reject PoD if an IOMMU was configured.
>=20
> A toolstack could, in principle, defer the decision to first device=20
> assignment.

Right, which is what I consider the preferred approach.

> However, this is terrible behaviour all around, because one way or=20
> another we've got to force-populate all PoD pages (which is potentially=20
> minutes worth of work to do),

Sure.

> and liable to suffer -ENOMEM,

Not if (as suggested) we first check that the PoD cache is large enough
to cover all PoD entries.

> or we have=20
> to reject a control operation with -EBUSY for a task which is dependent=20
> on the guest kernel actions in a known-buggy area.

Why reject anything?

> There is no point trying to make this work.=C2=A0 If a user wants a devic=
e,=20
> they don't get to have PoD.=C2=A0 Anything else is a waste of time and ef=
fort=20
> on our behalf for a usecase that doesn't exist in practice.

Not sure where you take the latter from. I suppose I'll submit the patch
as I have it now (once I have properly resolved dependencies on other
patches I have queued and/or pending), and if that's not deemed acceptable
plus if at the same time I don't really agree with proposed alternatives,
I'll leave fixing the bug to someone else. Of course the expectation then
is that such a bug fix come forward within a reasonable time frame ...

Jan


