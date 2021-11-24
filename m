Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F88F45B5AB
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 08:39:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230119.397841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpmrr-0002TJ-Pa; Wed, 24 Nov 2021 07:38:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230119.397841; Wed, 24 Nov 2021 07:38:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpmrr-0002RX-MQ; Wed, 24 Nov 2021 07:38:59 +0000
Received: by outflank-mailman (input) for mailman id 230119;
 Wed, 24 Nov 2021 07:38:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mG44=QL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mpmrq-0002RR-HS
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 07:38:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94a46302-4cf9-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 08:38:56 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2053.outbound.protection.outlook.com [104.47.6.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-cv4PGdCIPTCFbLLCCLRP6w-1; Wed, 24 Nov 2021 08:38:55 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2448.eurprd04.prod.outlook.com (2603:10a6:800:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 07:38:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 07:38:54 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0081.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.20 via Frontend Transport; Wed, 24 Nov 2021 07:38:53 +0000
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
X-Inumbo-ID: 94a46302-4cf9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637739536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yyToAZuHKoSK8clEkRbqHeXOBcEdIhjOgeG277rSuSo=;
	b=JAP1n2TLJ21DciAIrR+Y5ISEZ8Nshv6+SKDg3Qp2jyVWInEs4h5/nc6Q/T9i0FMxiS7wkq
	CeGmzehvK+2WIhwk2trE0mPEos1TjsoqYCNUCR4vCjn9ixJb34FiLCeRgmHtHHSGP6UCs3
	2y2tTHgRGXXzjn8eRTELZS92dn1NUsQ=
X-MC-Unique: cv4PGdCIPTCFbLLCCLRP6w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJAuQzuD2SAlMtGnOJnt+tK+plBjd/+gLqv+vblRrD0A5bmOrEGNs/oEK1nR5V/BJvf9M8tKsprCTmVk44mwlmaMJU+Ejs1TkQrmxpb8wvp6mUlc6aMBZl5PBy8XInBdVgJdlf6ZBCzTFbjwZ6hLvGlr4HszDiF2z8XcJV38KI9TkKzzgP1kbEPKAEuHbSVzVbJYECoFlRLDB5OUCQwWYR6hAgmINlrTxJbYA76BkGoHBWXsuIB52AEKUsyg21pEJa6CRNoPMCoNmtpgvm2qFrIdiJ3QZ4fPPbBAQTT6Mk6TVlNp8yWRJ9kC8hrwwgROgyC3a/8p+9jRFtk/eamQuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e27qbQP9IoApuB5rpyhx3qjOfVYoDI7MkssJ6e93mg4=;
 b=mEvHpcfnQx3cFSLbuHPa2yYokUTaf6ETlz4Bptt29y95NgACSO3cT+L9W6wrc64Rw29Wy6DIn9KU3CCghoJyUvfLqR/MIybnZcfoNlu4awINVsKT7xHgXyQyDrBAglGcfbtZZLzABc5rGN1d4ssBuAt7Ef4oJB+RFgYnY7bFJRTCHl2+9Ylr9DZXW1WB9VRoEjrjQM0rPpbGV5QVFYr3rAUSmP20pUcx9CabGto/lO/bd8YDqX+/wV9lh9Q7buOeePoq38kMvayikj91iWn66a+8NoOeUkJMevSeNWY0wNk3cnzUhl9yCcCb5O2cd5sEjuf5K1xPs6paGG4MR87Ogg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b3e1b1d6-9dc0-9692-d08d-64553f723666@suse.com>
Date: Wed, 24 Nov 2021 08:38:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [xen-4.15-testing test] 166311: regressions - FAIL
Content-Language: en-US
To: osstest service owner <osstest-admin@xenproject.org>
References: <osstest-166311-mainreport@xen.org>
CC: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <osstest-166311-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0081.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e13a908-2949-4143-df35-08d9af1d7745
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2448:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB24484CE0749F111B302FA096B3619@VI1PR0401MB2448.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N0cP95hEmdb16tQ5gvKfoy9nuYnqxc4s7Frndo53A76d+qn/VKuephnR7RTEJNnefcWSTRij2YnK+jaCFsV9xDhtVSe6iE58pKADs+ICkNrcOHEzZpOJLpOiQPFYFQeJ7d7GVOlHtyutWdrmR39vksI9+nmpiMXQFKxSkhWXuJpx3O9IeK8tcgstrzH/+aSkTCBfOOqfCTj4u/mkdReSNKfRROhe8Ir5C1gEPrvAJk5GJYz2W7GJaGRDBLrkx3zzbLw0Mo5as7lU/eSsNq673tbHYwemc2LSo+IWkiVZKJZlRZdcjItAW8daf1LoAFgw4i4xxhjmF0h9o8/qXlysFmldxWSjEvPaC8os3E5BJhMgo+1tpOoPs9XkeTBAo4+JMLS9eB7CgSl3h0L8uBRPwU75aQVhwFO9uAUFnZoyLVvUZ5sVYUhfJsJSun/XZXjtTUtDmIP1s+RuonciHwPDlJTPf5uwq1hZPh4zAV35D/JZPrhcKTDLClssOZ1wBSkUxg7ONAWZOhKMaeH2HoU65lHIktwYuqQP+V7HmlKfja4mP7dZKr+Q02WkubiG+z3KGreOUpSA1+HIk0Z4R9P6OiiV5EEVprrJH0/ZWS7Ob0BQ9kTtcqBkWrKQK3pI57MvYqJ2cDvjyuWhkR09u5BdPCvoE/zsBMzPCsIiqfq+aqbWavqWkIEbu2n85yCqhRM9vEFAurVpN51Dqk3qHyzX0fAB49VBrJEu9nOAZzquEDp7LjKSms+P2UPYjzi/eR5iGn6Vz5GHcgNXpXPizoeuXAxX6iygYK62aEWMrXXot+RE1g0qXRKOiOtWh2+AHihT2MlOZ4ktyAjPzwIICttk3pw/r3MwRrbEI0CSG4aOY4E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(4001150100001)(31696002)(2906002)(83380400001)(966005)(508600001)(26005)(31686004)(66476007)(8936002)(66556008)(5660300002)(6916009)(8676002)(4326008)(6486002)(30864003)(956004)(316002)(16576012)(66946007)(86362001)(53546011)(36756003)(2616005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z9GI/i9x1sHd11mK30GkvW92AgzjXNLM135nfoOoIEOm/K449jFfbsinR3II?=
 =?us-ascii?Q?ja3qjZx/nOAih+9SZpQXV8O6rK0iwr+jE1+mMaA09Q1yFyFpUfwZeG7JVYu6?=
 =?us-ascii?Q?uNr0Ong5A0HTUPxO9ojmU6DB2YbR/p9qSmZyAyCe2/PwO96rrRo6d8rxQiIE?=
 =?us-ascii?Q?cUxo+sdsUycc+ZU6Lx+hNzxkZjtMikDwtN5p/hk9r/S23TgxRfEMJ5QMXFEw?=
 =?us-ascii?Q?+pIE/BeOkxhifuCvN1ijzGL6RYHaGep9BfaIcIzOf6Bfp3GP9soJcn1EA/vG?=
 =?us-ascii?Q?upZXLsJrLPatZjYM0Z5InYhpV8r0xSz4Y4m/+M4NxU6kKXcTwW1AWLlCPj1O?=
 =?us-ascii?Q?4Ls3qrkJZ2Og+gyauyE/8IOodLkysqQ/bCr6hlF2/VEQf1ibrZoV+1XtW0G8?=
 =?us-ascii?Q?SEoOfSyXNS1pxMM/mn5OTBWvdvalU6OPjhQ58Js5Xd/KGkTuuFL9kgKy4Wcl?=
 =?us-ascii?Q?i3BTJ13EBgUwvHzRk11iDbX3k62NN/yJW5zxlxKLFu3zMDFkm2ZDKj939HJb?=
 =?us-ascii?Q?y2SFEEGSFd9K6vRQFtSTE/DjBo9s5nSrkOP0ftvw6J9CLm5AP5d2wKOmgLJZ?=
 =?us-ascii?Q?IwxoIaLg838b08wx8bWO+dC/zNI47qWYWpUAeM111ukqBsPiJRd63q/UKlvA?=
 =?us-ascii?Q?YjXAmhdc0fOa/8AGinJe1RgZ2PsLO0++BOOHc1SieAu0lZyM2Uq8C0SBodfA?=
 =?us-ascii?Q?B+ME1n+M8Dppv1Ry4vaG/8PezMpJI5W8uX+SBw62wdZkIm1Ow/fjTckg1h44?=
 =?us-ascii?Q?9iN9q4ykkP+nNoYy6KOOb0gayhCh99qvZUPFnZ5y8v6oOR3qtYiPQYzgM+jI?=
 =?us-ascii?Q?UK7VDzJCjinvaTk+D+0G6ElHhL+dZML3/AsVGtYuPWNtxDZeORX3nnZtaQ66?=
 =?us-ascii?Q?G30y3GvgCZLnhJqdVbQM2Q2eRHi+P8NdHVLaSFdj3Vo3XQ75QrctG1l2/9Ce?=
 =?us-ascii?Q?4RO72l3wrQX5j+bIGTLnfenuZQLs+IOGf0n3uO71KhWoK2GWbL0Hjfa8C2uQ?=
 =?us-ascii?Q?llnLUcIc54al9p0pwW4yd1GVTeGHe7VaHS112/DUSwsfkKP/UuJbPRGF1l+t?=
 =?us-ascii?Q?tVC1As2K8xEaHCN6YzORftIhR5LP4a8LeUdQqCoKE/RZd69nYcITOj69X+ZH?=
 =?us-ascii?Q?h+IOcSx2yQmw5YTZMpoBI1S8lNvAUv50w1cI/ixDrg4WBfW7NpbCDPERua3S?=
 =?us-ascii?Q?vrpT3Ia4D1uwVpuF/rn1ZihfpbsMHPcY4OlP/A8V7BfSHkdMho8zJX7luYjD?=
 =?us-ascii?Q?if3FTi+v1f1vxDdgkMATicjXpn0T+DYmCH7loasKOrXBIvk8j163Ab0oPTkL?=
 =?us-ascii?Q?2LC59xLsk1AVthWcs3jvTRW2QkD9vpa82gfTpKC64dqldGiwIMLExmNKcRyT?=
 =?us-ascii?Q?Mp8WTu4iHv76bnHGXWN2D3hfzzJ5p1PJrIopoxcgvNdoj7MSFvup7jOFmZcy?=
 =?us-ascii?Q?iBifoIH/KJ5+Bn6e8PT+K4b5uhWFhIYwTBFab2M0fZqGgUrF6F8u9sI+nYFT?=
 =?us-ascii?Q?eQ8TVbalRadQC+EWQg55ccfk+GP92M5rRd/N804XWoYL2AaQxSiRUlkaqQ0w?=
 =?us-ascii?Q?PXEMqvbkgHqXNhkxZGnzDQ4lLzlcYGKWpC672fjNabiNtLiu/Twtj890B8nt?=
 =?us-ascii?Q?jpwWwpC3GZI9SojG1HdWrRM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e13a908-2949-4143-df35-08d9af1d7745
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 07:38:54.1015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cz65i08Ic9akGXH8L9aQZIcBmoyP1JlpHgCfm07rrlLliKe24h5eiU5cTnP3E6+mYA5Wyw7ED9pEupBWv+IU9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2448

On 24.11.2021 03:00, osstest service owner wrote:
> flight 166311 xen-4.15-testing real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/166311/
>=20
> Regressions :-(
>=20
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-amd64-xl-qemuu-debianhvm-amd64 12 debian-hvm-install fail REG=
R. vs. 166198

At the example of this, I find:

Err:1 http://ftp.debian.org/debian buster/main amd64 genisoimage amd64 9:1.=
1.11-3+b2
  Could not connect to cache:3143 (172.16.148.6). - connect (113: No route =
to host)
Err:2 http://ftp.debian.org/debian buster/main amd64 rsync amd64 3.1.3-6
  Unable to connect to cache:3143:
E: Failed to fetch http://ftp.debian.org/debian/pool/main/c/cdrkit/genisoim=
age_1.1.11-3+b2_amd64.deb  Could not connect to cache:3143 (172.16.148.6). =
- connect (113: No route to host)
E: Failed to fetch http://ftp.debian.org/debian/pool/main/r/rsync/rsync_3.1=
.3-6_amd64.deb  Unable to connect to cache:3143:
E: Unable to fetch some archives, maybe run apt-get update or try with --fi=
x-missing?

Network issue (hopefully just a transient one)?

Jan

>  test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 12 debian-hvm-install fa=
il REGR. vs. 166198
>  test-amd64-i386-xl           12 debian-install           fail REGR. vs. =
166198
>  test-amd64-amd64-xl-credit2  12 debian-install           fail REGR. vs. =
166198
>  test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs=
. 166198
>  test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 12 debian-hvm-install f=
ail REGR. vs. 166198
>  test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail R=
EGR. vs. 166198
>  test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 12 debian-hvm-insta=
ll fail REGR. vs. 166198
>  test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 14 guest-start/debi=
anhvm.repeat fail REGR. vs. 166198
>  test-amd64-i386-xl-qemut-debianhvm-amd64 12 debian-hvm-install fail REGR=
. vs. 166198
>  test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail =
REGR. vs. 166198
>  test-amd64-i386-xl-qemuu-ovmf-amd64 12 debian-hvm-install           runn=
ing
>  test-amd64-i386-xl-qemuu-ovmf-amd64  4 syslog-server                runn=
ing
>=20
> Tests which did not succeed, but are not blocking:
>  test-amd64-amd64-xl-rtds     20 guest-localmigrate/x10       fail  like =
166198
>  test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like =
166198
>  test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like =
166198
>  test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like =
166198
>  test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like =
166198
>  test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like =
166198
>  test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like =
166198
>  test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like =
166198
>  test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like =
166198
>  test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like =
166198
>  test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like =
166198
>  test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like =
166198
>  test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like =
166198
>  test-amd64-amd64-libvirt     15 migrate-support-check        fail   neve=
r pass
>  test-amd64-i386-libvirt      15 migrate-support-check        fail   neve=
r pass
>  test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   neve=
r pass
>  test-arm64-arm64-xl          15 migrate-support-check        fail   neve=
r pass
>  test-arm64-arm64-xl          16 saverestore-support-check    fail   neve=
r pass
>  test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   neve=
r pass
>  test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   neve=
r pass
>  test-amd64-i386-xl-pvshim    14 guest-start                  fail   neve=
r pass
>  test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   neve=
r pass
>  test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-che=
ck fail never pass
>  test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   neve=
r pass
>  test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   neve=
r pass
>  test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   neve=
r pass
>  test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   neve=
r pass
>  test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   neve=
r pass
>  test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   neve=
r pass
>  test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   neve=
r pass
>  test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   neve=
r pass
>  test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   neve=
r pass
>  test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   neve=
r pass
>  test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   neve=
r pass
>  test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   neve=
r pass
>  test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   neve=
r pass
>  test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-ch=
eck fail never pass
>  test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  neve=
r pass
>  test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  neve=
r pass
>  test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   neve=
r pass
>  test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   neve=
r pass
>  test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   neve=
r pass
>  test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   neve=
r pass
>  test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   neve=
r pass
>  test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   neve=
r pass
>  test-armhf-armhf-xl          15 migrate-support-check        fail   neve=
r pass
>  test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   neve=
r pass
>  test-armhf-armhf-xl          16 saverestore-support-check    fail   neve=
r pass
>  test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   neve=
r pass
>  test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   neve=
r pass
>  test-armhf-armhf-libvirt     15 migrate-support-check        fail   neve=
r pass
>  test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   neve=
r pass
>  test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   neve=
r pass
>  test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail neve=
r pass
>  test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail neve=
r pass
>  test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   neve=
r pass
>  test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   neve=
r pass
>  test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   neve=
r pass
>  test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail neve=
r pass
>=20
> version targeted for testing:
>  xen                  544e547a63175ac6ef7cc29c4f5bda88da024f69
> baseline version:
>  xen                  963ab606b1228788eac54c1c7ff70d04bb325733
>=20
> Last test of basis   166198  2021-11-19 19:38:51 Z    4 days
> Testing same since   166311  2021-11-23 12:38:47 Z    0 days    1 attempt=
s
>=20
> ------------------------------------------------------------
> People who touched revisions under test:
>   Jan Beulich <jbeulich@suse.com>
>   Julien Grall <jgrall@amazon.com>
>=20
> jobs:
>  build-amd64-xsm                                              pass   =20
>  build-arm64-xsm                                              pass   =20
>  build-i386-xsm                                               pass   =20
>  build-amd64-xtf                                              pass   =20
>  build-amd64                                                  pass   =20
>  build-arm64                                                  pass   =20
>  build-armhf                                                  pass   =20
>  build-i386                                                   pass   =20
>  build-amd64-libvirt                                          pass   =20
>  build-arm64-libvirt                                          pass   =20
>  build-armhf-libvirt                                          pass   =20
>  build-i386-libvirt                                           pass   =20
>  build-amd64-prev                                             pass   =20
>  build-i386-prev                                              pass   =20
>  build-amd64-pvops                                            pass   =20
>  build-arm64-pvops                                            pass   =20
>  build-armhf-pvops                                            pass   =20
>  build-i386-pvops                                             pass   =20
>  test-xtf-amd64-amd64-1                                       pass   =20
>  test-xtf-amd64-amd64-2                                       pass   =20
>  test-xtf-amd64-amd64-3                                       pass   =20
>  test-xtf-amd64-amd64-4                                       pass   =20
>  test-xtf-amd64-amd64-5                                       pass   =20
>  test-amd64-amd64-xl                                          pass   =20
>  test-amd64-coresched-amd64-xl                                pass   =20
>  test-arm64-arm64-xl                                          pass   =20
>  test-armhf-armhf-xl                                          pass   =20
>  test-amd64-i386-xl                                           fail   =20
>  test-amd64-coresched-i386-xl                                 pass   =20
>  test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass   =20
>  test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass   =20
>  test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass   =20
>  test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         fail   =20
>  test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass   =20
>  test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass   =20
>  test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail   =20
>  test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  fail   =20
>  test-amd64-amd64-libvirt-xsm                                 pass   =20
>  test-arm64-arm64-libvirt-xsm                                 pass   =20
>  test-amd64-i386-libvirt-xsm                                  pass   =20
>  test-amd64-amd64-xl-xsm                                      pass   =20
>  test-arm64-arm64-xl-xsm                                      pass   =20
>  test-amd64-i386-xl-xsm                                       pass   =20
>  test-amd64-amd64-qemuu-nested-amd                            fail   =20
>  test-amd64-amd64-xl-pvhv2-amd                                pass   =20
>  test-amd64-i386-qemut-rhel6hvm-amd                           pass   =20
>  test-amd64-i386-qemuu-rhel6hvm-amd                           pass   =20
>  test-amd64-amd64-dom0pvh-xl-amd                              pass   =20
>  test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass   =20
>  test-amd64-i386-xl-qemut-debianhvm-amd64                     fail   =20
>  test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail   =20
>  test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass   =20
>  test-amd64-i386-freebsd10-amd64                              pass   =20
>  test-amd64-amd64-qemuu-freebsd11-amd64                       pass   =20
>  test-amd64-amd64-qemuu-freebsd12-amd64                       pass   =20
>  test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail   =20
>  test-amd64-i386-xl-qemuu-ovmf-amd64                          fail   =20
>  test-amd64-amd64-xl-qemut-win7-amd64                         fail   =20
>  test-amd64-i386-xl-qemut-win7-amd64                          fail   =20
>  test-amd64-amd64-xl-qemuu-win7-amd64                         fail   =20
>  test-amd64-i386-xl-qemuu-win7-amd64                          fail   =20
>  test-amd64-amd64-xl-qemut-ws16-amd64                         fail   =20
>  test-amd64-i386-xl-qemut-ws16-amd64                          fail   =20
>  test-amd64-amd64-xl-qemuu-ws16-amd64                         fail   =20
>  test-amd64-i386-xl-qemuu-ws16-amd64                          fail   =20
>  test-armhf-armhf-xl-arndale                                  pass   =20
>  test-amd64-amd64-xl-credit1                                  pass   =20
>  test-arm64-arm64-xl-credit1                                  pass   =20
>  test-armhf-armhf-xl-credit1                                  pass   =20
>  test-amd64-amd64-xl-credit2                                  fail   =20
>  test-arm64-arm64-xl-credit2                                  pass   =20
>  test-armhf-armhf-xl-credit2                                  pass   =20
>  test-armhf-armhf-xl-cubietruck                               pass   =20
>  test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass   =20
>  test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail   =20
>  test-amd64-i386-freebsd10-i386                               pass   =20
>  test-amd64-amd64-qemuu-nested-intel                          pass   =20
>  test-amd64-amd64-xl-pvhv2-intel                              pass   =20
>  test-amd64-i386-qemut-rhel6hvm-intel                         pass   =20
>  test-amd64-i386-qemuu-rhel6hvm-intel                         pass   =20
>  test-amd64-amd64-dom0pvh-xl-intel                            pass   =20
>  test-amd64-amd64-libvirt                                     pass   =20
>  test-armhf-armhf-libvirt                                     pass   =20
>  test-amd64-i386-libvirt                                      pass   =20
>  test-amd64-amd64-livepatch                                   pass   =20
>  test-amd64-i386-livepatch                                    pass   =20
>  test-amd64-amd64-migrupgrade                                 pass   =20
>  test-amd64-i386-migrupgrade                                  pass   =20
>  test-amd64-amd64-xl-multivcpu                                pass   =20
>  test-armhf-armhf-xl-multivcpu                                pass   =20
>  test-amd64-amd64-pair                                        pass   =20
>  test-amd64-i386-pair                                         pass   =20
>  test-amd64-amd64-libvirt-pair                                pass   =20
>  test-amd64-i386-libvirt-pair                                 pass   =20
>  test-amd64-amd64-xl-pvshim                                   pass   =20
>  test-amd64-i386-xl-pvshim                                    fail   =20
>  test-amd64-amd64-pygrub                                      pass   =20
>  test-armhf-armhf-libvirt-qcow2                               pass   =20
>  test-amd64-amd64-xl-qcow2                                    pass   =20
>  test-arm64-arm64-libvirt-raw                                 pass   =20
>  test-armhf-armhf-libvirt-raw                                 pass   =20
>  test-amd64-i386-libvirt-raw                                  pass   =20
>  test-amd64-amd64-xl-rtds                                     fail   =20
>  test-armhf-armhf-xl-rtds                                     pass   =20
>  test-arm64-arm64-xl-seattle                                  pass   =20
>  test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail   =20
>  test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              fail   =20
>  test-amd64-amd64-xl-shadow                                   pass   =20
>  test-amd64-i386-xl-shadow                                    pass   =20
>  test-arm64-arm64-xl-thunderx                                 pass   =20
>  test-amd64-amd64-libvirt-vhd                                 pass   =20
>  test-arm64-arm64-xl-vhd                                      pass   =20
>  test-armhf-armhf-xl-vhd                                      pass   =20
>  test-amd64-i386-xl-vhd                                       pass   =20
>=20
>=20
> ------------------------------------------------------------
> sg-report-flight on osstest.test-lab.xenproject.org
> logs: /home/logs/logs
> images: /home/logs/images
>=20
> Logs, config files, etc. are available at
>     http://logs.test-lab.xenproject.org/osstest/logs
>=20
> Explanation of these reports, and of osstest in general, is at
>     http://xenbits.xen.org/gitweb/?p=3Dosstest.git;a=3Dblob;f=3DREADME.em=
ail;hb=3Dmaster
>     http://xenbits.xen.org/gitweb/?p=3Dosstest.git;a=3Dblob;f=3DREADME;hb=
=3Dmaster
>=20
> Test harness code can be found at
>     http://xenbits.xen.org/gitweb?p=3Dosstest.git;a=3Dsummary
>=20
>=20
> Not pushing.
>=20
> ------------------------------------------------------------
> commit 544e547a63175ac6ef7cc29c4f5bda88da024f69
> Author: Jan Beulich <jbeulich@suse.com>
> Date:   Tue Nov 23 13:26:29 2021 +0100
>=20
>     x86/P2M: deal with partial success of p2m_set_entry()
>    =20
>     M2P and PoD stats need to remain in sync with P2M; if an update succe=
eds
>     only partially, respective adjustments need to be made. If updates ge=
t
>     made before the call, they may also need undoing upon complete failur=
e
>     (i.e. including the single-page case).
>    =20
>     Log-dirty state would better also be kept in sync.
>    =20
>     Note that the change to set_typed_p2m_entry() may not be strictly
>     necessary (due to the order restriction enforced near the top of the
>     function), but is being kept here to be on the safe side.
>    =20
>     This is CVE-2021-28705 and CVE-2021-28709 / XSA-389.
>    =20
>     Signed-off-by: Jan Beulich <jbeulich@suse.com>
>     Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>     master commit: 74a11c43fd7e074b1f77631b446dd2115eacb9e8
>     master date: 2021-11-22 12:27:30 +0000
>=20
> commit 4429ca0b29f481a2abfcc81990c5ac1f96276cb2
> Author: Jan Beulich <jbeulich@suse.com>
> Date:   Tue Nov 23 13:26:22 2021 +0100
>=20
>     x86/PoD: handle intermediate page orders in p2m_pod_cache_add()
>    =20
>     p2m_pod_decrease_reservation() may pass pages to the function which
>     aren't 4k, 2M, or 1G. Handle all intermediate orders as well, to avoi=
d
>     hitting the BUG() at the switch() statement's "default" case.
>    =20
>     This is CVE-2021-28708 / part of XSA-388.
>    =20
>     Fixes: 3c352011c0d3 ("x86/PoD: shorten certain operations on higher o=
rder ranges")
>     Signed-off-by: Jan Beulich <jbeulich@suse.com>
>     Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>     master commit: 8ec13f68e0b026863d23e7f44f252d06478bc809
>     master date: 2021-11-22 12:27:30 +0000
>=20
> commit 1da54becd5de7e55b2b66665bedc2f30964dbd33
> Author: Jan Beulich <jbeulich@suse.com>
> Date:   Tue Nov 23 13:26:12 2021 +0100
>=20
>     x86/PoD: deal with misaligned GFNs
>    =20
>     Users of XENMEM_decrease_reservation and XENMEM_populate_physmap aren=
't
>     required to pass in order-aligned GFN values. (While I consider this
>     bogus, I don't think we can fix this there, as that might break exist=
ing
>     code, e.g Linux'es swiotlb, which - while affecting PV only - until
>     recently had been enforcing only page alignment on the original
>     allocation.) Only non-PoD code paths (guest_physmap_{add,remove}_page=
(),
>     p2m_set_entry()) look to be dealing with this properly (in part by be=
ing
>     implemented inefficiently, handling every 4k page separately).
>    =20
>     Introduce wrappers taking care of splitting the incoming request into
>     aligned chunks, without putting much effort in trying to determine th=
e
>     largest possible chunk at every iteration.
>    =20
>     Also "handle" p2m_set_entry() failure for non-order-0 requests by
>     crashing the domain in one more place. Alongside putting a log messag=
e
>     there, also add one to the other similar path.
>    =20
>     Note regarding locking: This is left in the actual worker functions o=
n
>     the assumption that callers aren't guaranteed atomicity wrt acting on
>     multiple pages at a time. For mis-aligned GFNs gfn_lock() wouldn't ha=
ve
>     locked the correct GFN range anyway, if it didn't simply resolve to
>     p2m_lock(), and for well-behaved callers there continues to be only a
>     single iteration, i.e. behavior is unchanged for them. (FTAOD pulling
>     out just pod_lock() into p2m_pod_decrease_reservation() would result =
in
>     a lock order violation.)
>    =20
>     This is CVE-2021-28704 and CVE-2021-28707 / part of XSA-388.
>    =20
>     Fixes: 3c352011c0d3 ("x86/PoD: shorten certain operations on higher o=
rder ranges")
>     Signed-off-by: Jan Beulich <jbeulich@suse.com>
>     Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>     master commit: 182c737b9ba540ebceb1433f3940fbed6eac4ea9
>     master date: 2021-11-22 12:27:30 +0000
>=20
> commit d02631a21530918501f7e11320667dde7829cbb5
> Author: Julien Grall <jgrall@amazon.com>
> Date:   Tue Nov 23 13:25:50 2021 +0100
>=20
>     xen/page_alloc: Harden assign_pages()
>    =20
>     domain_tot_pages() and d->max_pages are 32-bit values. While the orde=
r
>     should always be quite small, it would still be possible to overflow
>     if domain_tot_pages() is near to (2^32 - 1).
>    =20
>     As this code may be called by a guest via XENMEM_increase_reservation
>     and XENMEM_populate_physmap, we want to make sure the guest is not go=
ing
>     to be able to allocate more than it is allowed.
>    =20
>     Rework the allocation check to avoid any possible overflow. While the
>     check domain_tot_pages() < d->max_pages should technically not be
>     necessary, it is probably best to have it to catch any possible
>     inconsistencies in the future.
>    =20
>     This is CVE-2021-28706 / part of XSA-385.
>    =20
>     Signed-off-by: Julien Grall <jgrall@amazon.com>
>     Signed-off-by: Jan Beulich <jbeulich@suse.com>
>     Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>     master commit: 143501861d48e1bfef495849fd68584baac05849
>     master date: 2021-11-22 11:11:05 +0000
> (qemu changes not included)
>=20


