Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CAD4A8426
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 13:55:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264716.457928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFbdi-0002R1-JW; Thu, 03 Feb 2022 12:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264716.457928; Thu, 03 Feb 2022 12:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFbdi-0002Ng-Fz; Thu, 03 Feb 2022 12:55:06 +0000
Received: by outflank-mailman (input) for mailman id 264716;
 Thu, 03 Feb 2022 12:55:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTfZ=SS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFbdg-0001mF-DK
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 12:55:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80e6d4b4-84f0-11ec-8eb8-a37418f5ba1a;
 Thu, 03 Feb 2022 13:55:03 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-XApct5dwPimfIYBbFmthRQ-1; Thu, 03 Feb 2022 13:55:01 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM7PR04MB7047.eurprd04.prod.outlook.com (2603:10a6:20b:11b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 12:54:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 12:54:59 +0000
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
X-Inumbo-ID: 80e6d4b4-84f0-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643892903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3GwTO6yhPVlHp/fqFnzYc7/0Mvu4gA14nx8f03cFGD4=;
	b=aLISX6mAHaBVReUhelUD0pJihgmXXT1PlFP9NK5k6+48bv9SNn7vukGnBDBUWjmZ+/xCS+
	tEOIGgwzjctDpSCMJ7h0E5nBgWhXXGwh4EyOcSSGp1EmAWWGoIw2mK5uyoZvSVgCYYoesU
	pUfIXHkkDyTK+fI2J0TvO+NaqcBZoX0=
X-MC-Unique: XApct5dwPimfIYBbFmthRQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MnYjliUxFYN87tYwxj4d5Ep9q24yegAuvojKnwRgc6+k10wxXeXlgwz8u4Rth6s3tetj8+BSuNcRFcYP0avfxBEVcDR6chQfbHwk7fQfsUF2IEN96V3rr0Oe11UJMCKDGWm57Pl/qSa+zJtw+bIXWngH4MJxf/gjD2auZVFIh+W8ZuQY0rkeZavbRvGp7FAInkc2GIA5KvxsvPlckgf3mCEQXdhcBgzFIk5FPlVtjSibTLC4uh3IPO4HWPmgkAhUlxZAVNJ97QDZEje0WDfmpXHPT5dQ6I16rHUFTC75Ie1sccxmo8BbqBBp276nTOwm/CoAIZSiApPY2LzuvmF4rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YboevU3sS+1yg/iJml4Svbv970lgeDaTwRe6bx8AyEY=;
 b=PkDnBBkY0ZrUffciVTpAs/nzCwANqomBAJjo08wC49B/Hhmd7ep7XFQtM+Za6SDpM6YPqxWPaVeSeFM8Q7wTJvLzFCNuhVG2KlogIWMB3F2gniAamwZbH8QU6+0uNRWkQiDeJyZhXhxn8wYEyEM0UQ0Q/OUs2oE6Xb8dE8oJ/Z6fa4toJ4nFtEKCZJOLwQ8KP6bc6LbyHnUqOXfTf0OGyPlOogS12xuXxVvS2YMDigQByLyHpKFNcuDgadL6H2Yhqm67fVUY75us9WYkVARvdmHrcehHoXy2sXpeauoC/xVawWCWRNiXL5P25PDUuasfF+2PcEMZPGlj0/nIYEmPig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9c1f376a-0df3-67eb-7fd1-bb75ae130e77@suse.com>
Date: Thu, 3 Feb 2022 13:54:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd8RJfpEalnfl+CC@Air-de-Roger>
 <d493b022-3c78-1721-e668-48f4553056a9@epam.com>
 <df98cdbd-36fe-0386-c068-2a1540f10188@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <df98cdbd-36fe-0386-c068-2a1540f10188@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0254.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 752f4cb9-f807-4baa-9635-08d9e7146305
X-MS-TrafficTypeDiagnostic: AM7PR04MB7047:EE_
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB7047DC68409D814BC16941F1B3289@AM7PR04MB7047.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BadbHsau4BfH6r38qEpagXylW+GcYZ/enNyy8KPw1M2ZK00mR+1bNPIOZZeAF/l6CLo6RpPChf/8oWHPYsA/Q8GYAoyMDYXqXFdzolH4Xm7QL1Y80o0hx5GXoVxSZXaGoA0xpl0cbKVjYB2gbAmTJzYnnm649VdpblvNtDsATpsk50rabGQxxRPwUAygaw2hFWJhSwP+QF8OmXGUjx3ETXzaZLS6QI2Lr+H+eJVaFcXymFf2ScnBfsfKuRBygeCLywTDwvbKnJZwk69OpANdii+Y3z259J2NCHZOwfGQYJNPSAuCAC/zWMPadEqiFxENxL9H++o8rQqWEr6SwajcxlhLZxpNOIzGWJgBL+xHSFbA6jmN0IwBneidUbfLNuNsmVhEmaCOUu0MDWwcHJ4NqyJGTU4putMIpUnXBG2AO2dUSzjrvNGQrI7Vv2f9+/66LQm8SvO96pItjrnlkz69+XmlZm7Mijmjrt+Xx/CpNqUiMsW3D404w5YcvXk58ZEdDhw301BaJFHSeT/PXF/Alm+fUiMAPUqtDOev8fiCPV1V0743Efdv0JPeOtb53qDdZGvSO+pIDUYkkeMmvLgOo5urbX/8aYJalukgt8z9+/Th7Lqls0IReOQ+Q3xKwh5nPhc7IfWn0h8OmHPzgFlab4AJYAvsqyyxws6wTeOPSwouvW7KLLDQYtlnJ91Mv90xdw9M2ky2xPtW3FOoaC4jJEDajrV9XCiJrohPXCbrQvU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6666004)(66946007)(66556008)(83380400001)(2906002)(66476007)(8936002)(2616005)(8676002)(4326008)(6512007)(6506007)(26005)(508600001)(7416002)(186003)(86362001)(36756003)(316002)(6916009)(31696002)(38100700002)(54906003)(5660300002)(53546011)(31686004)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1sBOgn0OjUSHx2xc/S/c3Jfeh7B4s74fsoGq2zWgEEDxowF/VAnrKpxt4S/a?=
 =?us-ascii?Q?L85DyczzEu7WUMd3z6ZmZFxCXPsKH6Qn+VDlJbwdQiuKp1InlJugzAOD6Elz?=
 =?us-ascii?Q?lAmmZ8w2yYBk9NNV9IRRkgF0rmHDyC63sbsR8Wop4LsV7XuPn8D2gRxKbFlH?=
 =?us-ascii?Q?yt5StjVQjtv4zyUwISaU5OfbVtxe589Oa+AHZ3TfzgZNYgioc1ORhZ1KT4C4?=
 =?us-ascii?Q?iQOZxZMKxD66MDiPm9R55XFWvA7j6X6k44Jl9c92WgHrmwtAlasMnhnAxfSY?=
 =?us-ascii?Q?WU7nXy5NHJqQgU7Xps3pVKulnhXCOK3OohjRaLLGrEHnVAC5sJguKhPhhWUk?=
 =?us-ascii?Q?hlEK1RNUd6axU4FJDxx23se/GLuUWkqr/v0Ghixlf+fF4OgJWA/U+qcRiSZa?=
 =?us-ascii?Q?BCUEM+gKnNTr/UPfJbrHwM4QFVY12o71dx8ZUrPdP9jib34qyHlomSbx4EoV?=
 =?us-ascii?Q?q6bII+8IZknqdQ4Vnt3fVf99XcowIS5YgAJQsL9hPPO6gP+n9a21NMI/rHx7?=
 =?us-ascii?Q?yLcynOUL+UJlmIki3mYGwMEdz0BX9ReWE5z19FTgywMjqjy6pZN04D5L2io+?=
 =?us-ascii?Q?bk3zoMZRf62zE0qbunFvlRmiMbOfzMUfyDpmL1VwEYaPy2ukNF61U60d8NKs?=
 =?us-ascii?Q?yGym1aDraexRYrr4oFyLEGda2IhTlW4ndHl95uuoJegGqjcrwsOLUw3xgKcH?=
 =?us-ascii?Q?ARwOpXnySem1SjbYQSpCCkU2QB31SvqDUTHuOenr14fMhe7Pip2qz7SSL7wV?=
 =?us-ascii?Q?hD8FPJHLorc0Kl/5UR0MjT8D6B++E/ZnSIJQtI7/Cu3VOk8AV6pWR7ueK05z?=
 =?us-ascii?Q?6BTDBe1jDhIq8yyqKlcpBLLg8+j45SY1nnGMmtRejGz+TaMxDJKN2B4JUi/9?=
 =?us-ascii?Q?a/IOkvXIJPOlaM2b6TyNv05AfhVdn2xER/XRJgIezvME12WZc16nL4Qg/FEY?=
 =?us-ascii?Q?JcgU4beROzTtBz0Wa3AuGKDHp1FN9mGZ5+TaU14AqQQZzQV1er6iYJDSul8A?=
 =?us-ascii?Q?+cPNDYF2/tVBgHzuoRzNIIuGJCrZ6SNU00/zu0gAJEJ4N/0pPwWOlv9BU5BV?=
 =?us-ascii?Q?6IZoT44tOPN22IhI/19NK6ibFfmWMDbchI/M3f26v0XiYtUdpwRjUeYXoBow?=
 =?us-ascii?Q?ep+KrdkH/ejyTndQj5Wq+9euq98KEpr1EipggwUzVTM4FjOHSlODokESsFWF?=
 =?us-ascii?Q?E4RyEZqrDH0BqfLdJhWNvaozzeZ+Vpyq6lUruowc6pK+JkMNktQLUszCUXJi?=
 =?us-ascii?Q?v2oxiE4VM1h01s24/4xyJHuDtkS809+cLhTn6Qj/AgpeClSbnwJeZNER7DUN?=
 =?us-ascii?Q?Y9z327WfiTIuaX5exJ9pJy+IesMmDh781VP3qpTxHYuJ35zTiEsW9fDBlxMX?=
 =?us-ascii?Q?/oIjWcm7jCnju6l0L3EMc37IiC0AwhddAcpTbSZwlr56M3JLyzdbqRKhhvf3?=
 =?us-ascii?Q?X84LSwxptuU1tPwm+UNB9Xh1BLsh7FLt3JRB10fp4JeHWld1iRc4nKurM+Kt?=
 =?us-ascii?Q?dbpDt4/6yjZGNrZzkmVRcukhF7KjFZhTbgnpwMQzqCNXah62V1g8+EQuB4YT?=
 =?us-ascii?Q?m1tXwUlbENGKw3iFLQsrFsoY9HJOKnaC5A0/UqbfnZdJhzeC2b0mF7iKerd4?=
 =?us-ascii?Q?3kG23pFoEAjftZ8tg4x+ueE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 752f4cb9-f807-4baa-9635-08d9e7146305
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 12:54:59.7714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wMxeGCYmdld29QDBzjH/8XiJ9GrDDz18+saBCYxystrNeIpzKhegRDG7+jL/1tYsX8bfHXfRohV8VrRLg8VF/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7047

On 03.02.2022 13:45, Oleksandr Andrushchenko wrote:
>>> Also memory decoding needs to be initially disabled when used by
>>> guests, in order to prevent the BAR being placed on top of a RAM
>>> region. The guest physmap will be different from the host one, so it's
>>> possible for BARs to end up placed on top of RAM regions initially
>>> until the firmware or OS places them at a suitable address.
>> Agree, memory decoding must be disabled
> Isn't it already achieved by the toolstack resetting the PCI device
> while assigning=C2=A0 it to a guest?

Iirc the tool stack would reset a device only after getting it back from
a DomU. When coming straight from Dom0 or DomIO, no reset would be
performed. Furthermore, (again iirc) there are cases where there's no
known (standard) way to reset a device. Assigning such to a guest when
it previously was owned by another one is risky (and hence needs an
admin knowing what they're doing), but may be acceptable in particular
when e.g. simply rebooting a guest.

IOW - I don't think you can rely on the bit being in a particular state.

Jan


