Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0624AD42A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 09:58:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267725.461470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMJy-0003fP-HW; Tue, 08 Feb 2022 08:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267725.461470; Tue, 08 Feb 2022 08:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMJy-0003dV-D4; Tue, 08 Feb 2022 08:57:58 +0000
Received: by outflank-mailman (input) for mailman id 267725;
 Tue, 08 Feb 2022 08:57:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHMJw-0003dP-6d
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 08:57:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 344b9ab2-88bd-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 09:57:55 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-3_QhDEF2M8-yvaRLQSaHxg-1; Tue, 08 Feb 2022 09:57:52 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB7910.eurprd04.prod.outlook.com (2603:10a6:20b:288::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 08:57:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Tue, 8 Feb 2022
 08:57:49 +0000
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
X-Inumbo-ID: 344b9ab2-88bd-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644310674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=57KXD0Mw/Olurv+X1wKI+uUEAzaWfdQio3M/j+pHrU4=;
	b=F+s4oQ9+MUDog8wa5yxCMvjjfTtNP1m4f9aQSJZMsXWW9dBci5T9uNcXo0+jTlStrkDfua
	d8UVq+vCE1d3QAYsfHTwaFHdoLjvpvEMkxOINNEHBBfdddHHLrT0oT2Rpe+r2OEjLS9oQv
	6ZDEyvcZv+p0TPcHkykjZRYtygh9/ww=
X-MC-Unique: 3_QhDEF2M8-yvaRLQSaHxg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edp6yAZKeXhGos7Ffh0y2w3rfh132E93j17H5317ad1gM1u8T2MAT/BUjkKE365j02tQaGWFY8tRDKLFl4Hz8MrtrK3oyS5H1I8OU+La60f8fdRQpyAdCG8ojnG2b0RGlBA5SltM7XN0jIcFVqz9okphM3g+Vbp+Cu4VqfcYKKMpeMzRyrlQmcqZqPiWgp2nMDZw6dWLlqVDH9bZ8N9CwhybX36U0l41bc5krpnEIRV4FwFWH+S1SkCHSCwm17+5NfSK+Rtp8jI2w3Tq2xCvk49qwv4E7vgp4SwlarTjN47OqNvLocyiTVKtAioLaJfTl+nJuSqOZayGz0VNGMhpxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6dl6oDcwP6vNPLsSPRdvGWsCVk6qpkkuzkbgkHQM24=;
 b=H/DE5BMdOnzdw9H0L99C26dN9flvC58GB+xwE5SoPwbYNulIQrCyK57JBp0Ka8Da6p9UFAOqwPwzojS01USb5B4LfcL3w4ZhXYkgAJCXTudczmoDRc9+aQiSxapcCPRLbXeWutBVB/QFJqLMBMtA/mcNqtt/AqLR9GOT7nVNcmv9OtkK1/z2HSyoScVOxmQSJ83nQdB9fubT8PGvD52VKoGYs517Lq4Z8mmItw1CWY38fz1MsBQLareR5hSknxuAnLPDFwMW3LLpA4CZgxi72NUl8DFQbmaekue2GwJG0OviQ6RDeFg13oexDtPiMjf9X4fXDgy4C3PbSynq0XWkaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <72abc2b2-7141-0460-2b5a-e27cfa8457f1@suse.com>
Date: Tue, 8 Feb 2022 09:57:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <7e3562b5-fc67-f213-e872-f211450d9e2e@epam.com>
 <a8fc599c-f620-c4d1-2077-c57068f46a7f@suse.com>
 <deef8468-d607-e49e-f456-6a8013329ca1@epam.com>
 <Yf0k6aoKK5G3iad1@Air-de-Roger>
 <3ad10a99-c706-b95f-1419-2c0c7cf37d58@epam.com>
 <Yf0+3C9nF8+tewLw@Air-de-Roger>
 <c5fea3bb-834b-eeb7-d7a1-1ee609037a9f@epam.com>
 <YgEUwTxhnWVMGMJK@Air-de-Roger>
 <9ce90193-74a0-5642-d22b-6b8c3340c3cf@epam.com>
 <1f65ae7a-898d-2c27-0ada-d71d778b0627@suse.com>
 <YgEsRuckQJIQlkzf@Air-de-Roger>
 <a2a42c1d-d379-00cd-5d55-f443cdb02e97@epam.com>
 <e8fc7872-c7d0-f389-c507-335b809ffcbc@epam.com>
 <21c8125a-2f79-1a4a-494c-db9e4be2a1a6@suse.com>
 <4276fe72-558b-7d95-6430-d4330989dbe8@epam.com>
 <ad985f4a-10f0-4a2d-df02-cde915fea3f1@suse.com>
 <f7669670-8eeb-9966-5ba3-e8f9c03ce3d3@epam.com>
 <73e08285-6bb1-5842-899f-bd6502406e49@suse.com>
 <be3f4222-6580-4c89-a202-c003b6feb9b4@epam.com>
 <e91965c5-0802-adf8-0c17-522f86ebf231@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e91965c5-0802-adf8-0c17-522f86ebf231@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P189CA0003.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51be837c-ff2e-4687-665c-08d9eae11557
X-MS-TrafficTypeDiagnostic: AS8PR04MB7910:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB7910878E794C652A4900B5F7B32D9@AS8PR04MB7910.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TWFES3cz3EtO31PSBCGL7HzWXfNedOv00TA4wUGGMmzSux1wcsCZOJawJy6GkZCEt9aaezSe0IGfC4NBU5wwlkTwjS4Nnc6IitZ9Gt9EEXnApVsOWs+XDwkj9YbdXxiwtzsx9NxN3vyGqLT+SL2fUBMATGucYmsoyqkys5OVBS0vXe+6A7RarqP56DQw1w6t6CwMOGhn3q3wGhX0d2ppXYWp8p7n5eGmGJcQNmovr+gU7LEy6VrB653vkw2FPuVQtXWrlSP5ki1Vgl7osEkOvW+B1jFizNg8ZXotU/fQfexCRBTICpZ5DrpEpvyypCqggW1w+pZncfWDruD+vucd9hBPAq5AQplqZzhcLCYrdaNaPJoRxJY53nnUB9YngPdrM2K10iJoMPSbReFu5KU6g2En3zJnvCrE0Z3CZa1p5vgqt+KW+z/UA30j5fQNcJHibd5OCs5qa/qvHvL31fjJzsnHptsuydrjG9uJEZ2DqeVrcnEd+Fjfr6J4gmBXAjXybTF7FJUGqwzoV//Sjd1pJHYY45B31BhbzDJSw3Kw2uPRTRuVyWZA2cbWqmj8q82voKhYnGWE0oivx2KD4NsOZXpulToErbFCOnXDa28AjDmEz5AkGjd9WKCEKLdqi7/y5uaTYtPErEfM2iyHt5nMU6nuBdNAGYdhPtdjccWP7KnIVwFrvat8KIxIyGB8kaSKvzM7aSGDNdBBiyVQcNbg06VXyGfMITqvegfwzER5yXc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(53546011)(6506007)(6512007)(31696002)(31686004)(38100700002)(2906002)(86362001)(508600001)(54906003)(83380400001)(316002)(26005)(6916009)(186003)(36756003)(4744005)(8936002)(5660300002)(66946007)(8676002)(66556008)(66476007)(6486002)(7416002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NeBCdIjl3Q5mYTxGQepgZTWPsdRtw/ofU/GdcvnnPbYJfgtrqIlW8bBxl52t?=
 =?us-ascii?Q?OLpXzo5fBPdfQXXgNsAHiY5xYFz2VWEbWGuRBZRgdipwdcIvg3QjimLmhY4o?=
 =?us-ascii?Q?Nm0K2Ha0OC76946sOz82Eu3Kdst0bL/wA72Sd//rI/i2nNbGXnhnqkb4jS8H?=
 =?us-ascii?Q?IMDqV3CNRDiAeMFhuLJjjFj/L9d1fwzbTOWwd9yK6YVGIfREy1eFhWzCIShr?=
 =?us-ascii?Q?nVv7hex+id6tWp9w8MBP2BcnlYs93+362kO73J1s4xkv4nAkVQq6gluTz824?=
 =?us-ascii?Q?F3H3GXPfe9JD2KW3n5jdxgFc4ZDTmFloJg9ZkqkijAeHNZe9XOdghCvf3wkO?=
 =?us-ascii?Q?4Ny4Avo3vkTvdBd6IEUS8/BhWPAhLHibt7dbKmBzhEq6NKr+n4hq5wNm+dcg?=
 =?us-ascii?Q?I9H2aM5uF9lsbaKgy3tq2to58KZEdhbHS7DxL0Oz6TF976sI/QzTl8S9cL9y?=
 =?us-ascii?Q?MYLQPFLUq603elDv/DJzoyfvDhi4DWBJDAmlcUUhjoOAg3nV3yiM621InMk0?=
 =?us-ascii?Q?mSKIRrirPNJYhXAq5PeSu4Yu+cmVcMG6NCiSFJd6V1ssBME9W8FBgvlNKhSq?=
 =?us-ascii?Q?wTqyzQwJtpvgS7TXHQ8sfsLENBUZvUXxxTlrHkIJxobPcevsFPPEHjsfStT7?=
 =?us-ascii?Q?s7bWElcxDfB6WiodEdKN75Xv/Lman9MiDGiACQFwHWFUDovlZjwhS4/yOJXB?=
 =?us-ascii?Q?2XMysLi8DUOV7vZ1ehVydBBhourCaRvxu0RM4FfzGYsTbuPGmA/DBwWMr+VY?=
 =?us-ascii?Q?yOCUto8I/FGsOVGc73ES2qnQniSF4uNJq1Q/gHgZr5lzNYq81n+hjvTehZ0U?=
 =?us-ascii?Q?auXZBUBzvx29NqTahpd6ODy3/f0/xkE31c4KwaHPd2GPcljTQpT+PFj09ZK5?=
 =?us-ascii?Q?1jNWFhgXaHQ3jROBDtBAyb5m6ZumsMIbmw90/5QHXZL5quap55wFhAesGhB+?=
 =?us-ascii?Q?f9yZ3fnnCqlIISETec2sPGbTQG5B4d7IdnjE8VWsjKtVsqyuAz4+IedqXGFl?=
 =?us-ascii?Q?HOVSwn8FxSvuZmAzDNu7ltQlhYHeHqoWBuZhttfUq8kggWrlVl7c5g6hC3I+?=
 =?us-ascii?Q?NgtVvNEXzKCDgzySg8pNRNrDS6ynDNvNtfp00/OB4ATx+7TkGG0Tzyc3CzJA?=
 =?us-ascii?Q?IKqkDz6HfKCDnlfOseXtklzriovcfV/Scb0qLQm+qGdk7QqhVY76yWaWE8f6?=
 =?us-ascii?Q?YPdKrAURggaguf0ku7CWe67Ti7Vu7P+Nu7vS3igJ+7+u+hujr7xitFxUOCrO?=
 =?us-ascii?Q?ZqYAvMe5R3D2q0GsOABBQxGTmg4ZWt9EAXM7BOSytlB0jzFLtUTYsA/qPJ6G?=
 =?us-ascii?Q?vEbRVqUSqRrRD0DoYUMSpY13a7g3hnNP6ab8KcsqLlI4fNhUpSlhurcuxpgJ?=
 =?us-ascii?Q?lBjycX08YvDXoLD55TcSx5cEejQLT691zJf01NXNqYa+wE4j4ZViDbkjwzA7?=
 =?us-ascii?Q?+amWgyfonIy7mQ4sEosGUeB14bfWVrj4hm0TJSbzjyzX+DGUm7WWS6kVFjqr?=
 =?us-ascii?Q?e65urQQSneY4A57HoaAF8HpMhFNZs2e+K/CiMAaOBo5Sj5gDOe6dlpIwYadF?=
 =?us-ascii?Q?UhVBKYIn7jEnlDfFKn9IdDOjdqDgSG3Ix6ImKrhcpGJguBxH7aOETqGjDM6X?=
 =?us-ascii?Q?L3zskBeFeOuiZuHIIxOdYX4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51be837c-ff2e-4687-665c-08d9eae11557
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 08:57:49.7476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DvQGoQS+qMb4lfWwFW7RV4zRwpZXTjGQK3d50Oc6mzh34s61pJWdWRV43vnv7yJ/ii9IUfKIb5QHm8wHWId5Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7910

On 08.02.2022 08:35, Oleksandr Andrushchenko wrote:
> 1.1. Semi read lock upgrade in modify bars
> --------------------------------------------------------------
> In this case both vpci_read and vpci_write take a read lock and when it c=
omes
> to modify_bars:
>=20
> 1. read_unlock(d->vpci_lock)
> 2. write_lock(d->vpci_lock)
> 3. Check that pdev->vpci is still available and is the same object:
> if (pdev->vpci && (pdev->vpci =3D=3D old_vpci) )
> {
>  =C2=A0=C2=A0=C2=A0 /* vpci structure is valid and can be used. */
> }
> else
> {
>  =C2=A0=C2=A0=C2=A0 /* vpci has gone, return an error. */
> }
>=20
> Pros:
> - no per-device vpci lock is needed?
> - solves overlap code ABBA in modify_bars
> - readers and writers are NOT serialized
> - NO need to carefully select read paths, so they are guaranteed not to l=
ead
>  =C2=A0 to lock upgrade use-cases
>=20
> Cons:
> - ???

The "pdev->vpci =3D=3D old_vpci" is fragile: The struct may have got re-
allocated, and it just so happened that the two pointers are identical.

Same then for the subsequent variant 2.

Jan


