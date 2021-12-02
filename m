Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77967465EBC
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 08:31:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236342.409979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msgYJ-0005zX-S0; Thu, 02 Dec 2021 07:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236342.409979; Thu, 02 Dec 2021 07:30:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msgYJ-0005xb-Ng; Thu, 02 Dec 2021 07:30:47 +0000
Received: by outflank-mailman (input) for mailman id 236342;
 Thu, 02 Dec 2021 07:30:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msgYI-0005xV-08
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 07:30:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c212a2e3-5341-11ec-976b-d102b41d0961;
 Thu, 02 Dec 2021 08:30:45 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2055.outbound.protection.outlook.com [104.47.8.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-Lr4XQ64lMVuIZUKIOfwxnw-1; Thu, 02 Dec 2021 08:30:42 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7040.eurprd04.prod.outlook.com (2603:10a6:800:121::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Thu, 2 Dec
 2021 07:30:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 07:30:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0088.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.14 via Frontend Transport; Thu, 2 Dec 2021 07:30:40 +0000
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
X-Inumbo-ID: c212a2e3-5341-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638430243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dSIifU+P2EvTWsn/xzDMk5vCsMNBEysWPaExFM22GEQ=;
	b=hTcPgWRDIF7zkHDWW7jhUH6PW7wu+PTVr+PcGCPfoJ3gg+ZZML00859+INltsAQg2aYFDi
	Lqkt+X6fiSMzTCuxeYK6xt4ySM+9lHca1ODRC9/08JuGa84lN8u5Jrr6cN0XI+pduvqsaT
	+chKIh1oRNi07wvOFRF/3KG7SuYE6RQ=
X-MC-Unique: Lr4XQ64lMVuIZUKIOfwxnw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ii60zwkFTm71zxzguSwahRvjo8lKuMRPv9gkrVaGX88AridwDv2QGPPrR18vayZKClru5svRNURwMC7afaXZ3lcx0i26YbdCyJ8ZRAASZeOcen2Z0B4+x8PjbQX10F9pBApzR7CjWsy3w+G22j6AXDNZVc7yMrsoNWyU1NPxRQgqWoBzMTogPkTSsBc2b8GWeoAYrMf3LvebAJILetZ+oHQeplqRJaOZ+KHoDoCgPz5jErLH7lJx74oc8ApXRmGMYj92DZccc1D+xMzQo2OIhqXhXfZiaf20R96Jg7zPI25mC6NmngmBR5J2d+gSr5zjWEJHybeHwqSY+KiXmAvjwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oAqlqgzhEnJGOcrJ57AoOl+1KamxRZmtYbGPvq45KW4=;
 b=C+dEzY7FoD/0fBi1tG/3up41WK/2aX31MAoHZJ79xsdoGNgA3xi54CE5n89ZuyVc70EJbE1MJv5PbJKAU7SHRV8Zc1u2hHozGDYh243FeQkm1AaDqtNkoyYnOeA0z/GNMH7rXCYcaxAfRLQuORjLgvoABJLpULW7BOSugr0t8wlC7W3X3G3Oyey/LUmnu9TD65/i/Spy40TLDxLH6ajruMDjDMSEGw8w89Fw71+GLySzj8SDMEJxJxn4448PmoTw/WLT9j2TWxWCPs4QxKb/KtHpaJFP53X/o5wsgvM4UXuNLQRJYV4svnyK2QULIXhfV6WlufG76XKq/g1VOmPyeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <daebe6a9-7126-0f09-2c68-c13dbdd02f92@suse.com>
Date: Thu, 2 Dec 2021 08:30:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 4/4] libxc: correct bounce direction in
 xc_get_device_group()
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Ian Jackson <ian.jackson@citrix.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>
References: <5d72c629-fabf-3d40-aa19-d177826fdde5@suse.com>
 <b53c7853-b53a-37a0-d3bb-81093b19f305@suse.com>
 <ae971612-71e2-2005-88cf-22006b7fc9b9@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ae971612-71e2-2005-88cf-22006b7fc9b9@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0088.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de8906d4-4908-4b6e-704c-08d9b565a500
X-MS-TrafficTypeDiagnostic: VI1PR04MB7040:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70403CB682C53D4AF549EA6BB3699@VI1PR04MB7040.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:84;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gg0S7Tz2pAMGsyBxuShAdCkxNYvKCgCEVtfbE4Zw7dhiC7ubwbrO0dSZxqZ9MEKHBSLsT7mY016MYpRiN9a/MvqM8yFY4lBiQV3jrTX6sp4xJMwo4UU4j7Md84TqqEl949PID4dsNqhxIO+13VAqVWoiHXIEWn9a4aZFSYDMSzeYQwxVwkeZB7eMPS12zSQJw/CbWep9YZLubCQK4rwDXaO2Mohjb0D172uUvOimiHPX9sbP2lVpeIe2VAnRVPno3ZVq80Sa0JUlM8GpPVyimjBkeDtvFoYRsTmyalb0c1BNxeLAo4KRC94Nprz7d02OzNdu+ewQYIcwk/PWF4SYKtwqXLGft7kKbFo5xgtWeI92sJgCgH/h2dUUs+nZqAI5HIUKPpswvg5jMkGf51YHtDW9Rbj49TFg3uibPVs4RUyt3mqwD9lNqwLIwwBE+sM/NVL795W2aQByMKP2iZ8llLFD1njFzT1O+n31W2EDP8erdTyiSp2uNLPr5/IMp5w0dliHqaRqSlaa9NKBnb3XpnBYLz7+ZU94pQNAbqs9f348C4kjvR0Yz/uEhNFvUQSupMiXxl4Nc4fJnlVxF3ET7NMBMOqTI7xAni2d4ZmJpK8OiHapEwW4ZlvrzTbpJRx0UsjbKZj9amNdgEiXSYz9z8jqzEkOeeavdH1fY9D7mFM8+jmbboNBnmEPQLCL3knCJ1Xmh5IIZ4AlgqoDq+10CtNl+lZoqDCFCGedSix+sRFKpx0uNZGa+2qn0xCZy44U
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(26005)(110136005)(54906003)(16576012)(66476007)(66946007)(107886003)(4326008)(316002)(53546011)(66556008)(86362001)(31686004)(508600001)(83380400001)(2906002)(956004)(5660300002)(2616005)(186003)(8676002)(38100700002)(36756003)(6486002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VAhdJDMxA5iHzEsb0KhnBO15rH24eLI9UIntlBbuOI19AMXClFgocYWl9Xv0?=
 =?us-ascii?Q?Zs9Xl/+t7FK16Hxnky6xa0Oe/ATDB3+TZz1QnXkNbeAjZuUqqVv92SVRTs3M?=
 =?us-ascii?Q?a4d02N6mT/IOdwFiMNHkAO7AM/N8J1nxRir/IIwZya4bSwlhz/JibKiCaMEl?=
 =?us-ascii?Q?ClFKTrZX4JMdCQCJsYP2f86nNTAdK9yEDRSYdJRsE46SOVRe0vdsfvV/Xcda?=
 =?us-ascii?Q?B5CPV0sky7DfxfQmm15S4KlxFr7e9QWcCujYh7edm72hop0UWtkb2Fl1qEYy?=
 =?us-ascii?Q?sKbuxDJFneK1x3PFiR5ksEKyLw7BU7nmDh+rPuu0z7fnbCg2GpshFDkhMW+U?=
 =?us-ascii?Q?0wbi8LoaJtHpXlkGb2qz1+vT3vWJ5ri7rsdG0Jo7Z1zP3cc1lWm95rrj11RF?=
 =?us-ascii?Q?LT6lKyYIlaY3rRJgIhej32DbM1GlHQENH4fthGNFCntA+NdCvlrpDSnHsP53?=
 =?us-ascii?Q?FAOGcWcTrMrEgeTLcZrP7IF+A2XLJLX5bQr+soHF1sppnynzSI4Bzur7YCU8?=
 =?us-ascii?Q?gzUJUm7tDBC6OycbK5TacwAFbhvnIHm14CFiF0VdZiRyTKpedzoCV3I080LA?=
 =?us-ascii?Q?DzSsdZxE8MP4NQDT1aiWOvFuGKlQs4VVSA0A4JTMMaaQIzeE9HnsJzv2wY8Y?=
 =?us-ascii?Q?Y8G7Za/hvMRIBvlqWDxDv3mDrx3XnAHl7B1Hlmud8KNyjJ2ieJyyC/varxYB?=
 =?us-ascii?Q?ytuJx2nUfjIgvRqgvuifZ6yzfRk0M8W24j6S3V5owlneQHi8nRLksm+l+SO6?=
 =?us-ascii?Q?7TnIqs1Wfa2zY2yGIkhjA+DNdClc071CYHMVGqskMltJfiDgqw1+NK5EAtHc?=
 =?us-ascii?Q?U7flDJsCMOih2ZaxP4E/9KCeBSAcag4wblz85Ky3ySPkU6Qbf7FrxnnB7Mx4?=
 =?us-ascii?Q?2e8czL39a5qM/NkHr4S5BvgceMyLCrc4wi0OFVkGZpKK5wWfZvltF6h2fItj?=
 =?us-ascii?Q?jL9S5xLSpKrXNSY4FXjYByb/+WwNZRMaAa0Dh1+3o57e0fG1Upkg8btEfGbD?=
 =?us-ascii?Q?NZV9RLIY+l39pKYrmKm3YajVct3FxNw35K/3Qq+FdfLvEMi+QWhvVHfgXlyc?=
 =?us-ascii?Q?9MoBCXYxrRKXHUOnhtQNJwrM45X0YGwRdNbbw4awpyf77nqCJvqHulr2xl9B?=
 =?us-ascii?Q?fICE6DVYeYxTGSU/uVwjOQOILFyV2bMaHgXiL8BROkw0VG96rEtQykst0d+U?=
 =?us-ascii?Q?QB34P11akHVJ7ffIk+TshU9PqaYURht8y4SSRZfgO7zmYFFsIodQSovyqEWu?=
 =?us-ascii?Q?TmrhQ5d4ucFFX9RINw94l8KxPz3e23WZaM3T8uX5tj94EE5eYggBPpn2Gbt9?=
 =?us-ascii?Q?siKE6dRO3Crn0AMdR/WCjkoyUDuIsC61YTzfb8ClyyLypa7bAdqomcpvug5G?=
 =?us-ascii?Q?liZnyg4he0cUIheEDiZ10LotpDMzQvCLuRyFjMpxJ4YqKe8Gq9GjT/siwclr?=
 =?us-ascii?Q?aco9MRy1rVEvtxovML8mbpZaj2YXESLdWyMDRu64/W0JeJsiZ7kBll0ed8dg?=
 =?us-ascii?Q?qDTkZWFyjy3VNQvf05pTIx0BuSh6jMfrmcmW88b7qqT1q0VQad1BGPLYVx8a?=
 =?us-ascii?Q?7jf+usR5U4wR28NNhCrcTqpY7dDXQ9mnVZBQl0NFaox9EZMELh42lfSzVyJn?=
 =?us-ascii?Q?dtZkrkzbeXx7GCsb7levnUQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de8906d4-4908-4b6e-704c-08d9b565a500
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 07:30:41.5588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ndQrlRXXHgrjq2NXqV/nE+Ar401dSnf2udZzoQcd49mkupUO7Kukl2HHoGs7KwcWn+0bBetvaVnBm8yag+Phqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7040

On 01.12.2021 16:11, Andrew Cooper wrote:
> On 01/12/2021 09:42, Jan Beulich wrote:
>> The array of IDs is an output.
>>
>> Fixes: 79647c5bc9c6 ("libxc: convert domctl interfaces over to hypercall=
 buffers")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Clearly the function, including its Python wrapper, cannot have been
>> used by anything for many years. I wonder whether that isn't good enough
>> a reason to sanitize the layout of the array elements: Right now they
>> have BDF in bits 8...23, when conventionally this would be bits 0...15.
>=20
> There is a lot of WTF with this hypercall.=C2=A0 It's obviously an attemp=
t to
> do the thing that Linux calls IOMMU groups now, except that the correct
> way to do this would be for the group ID to be the unit of
> assignment/deassignment.=C2=A0 (We need to do this anyway for other reaso=
ns.)
>=20
> The last user was deleted with Xend (2013), which suggests that it was
> broken for 3 years due to the incorrect bounce direction (2010).
>=20
> Furthermore, it will arbitrarily fail if targetting domains without an
> IOMMU configured, but everything else seems to be invariant of the
> passed domain.=C2=A0 This should clearly be sysctl, not a domctl.
>=20
>=20
> I suggest ripping all of this infrastructure out.=C2=A0 It's clearly unus=
ed
> (and broken in Xen too - see patch 1),

I've not seen you point out any breakage in reply to patch 1, unless you
mean VT-d's returning of -1 (which you didn't point out as broken, but
which I can see would lead to misbehavior).

> and not something which should be used in this form in the future.

I didn't think the concept here was wrong. What's missing is the tool
stack actually making use of this plus a way to do assignment in groups.
Iirc the latter was something Paul had started work on before leaving
Citrix? (That's leaving aside the bug you mention plus potential further
ones.)

Paul, Ian, Wei - what are your thoughts towards Andrew's proposal?

Jan


