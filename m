Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD19E4D042E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 17:30:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286302.485783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRGFN-0007b1-HP; Mon, 07 Mar 2022 16:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286302.485783; Mon, 07 Mar 2022 16:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRGFN-0007XS-DS; Mon, 07 Mar 2022 16:30:09 +0000
Received: by outflank-mailman (input) for mailman id 286302;
 Mon, 07 Mar 2022 16:30:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XxC1=TS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRGFM-0007XH-Gd
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 16:30:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d997b39a-9e33-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 17:30:07 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-WxIHGhb9P560wV7W31XGMA-1; Mon, 07 Mar 2022 17:30:06 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS1PR04MB9240.eurprd04.prod.outlook.com (2603:10a6:20b:4c4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 16:30:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 16:30:04 +0000
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
X-Inumbo-ID: d997b39a-9e33-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646670607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2S4qfrW56WHwDMTIkb7iuCepsddjLG6m7m0sVNU9C9o=;
	b=iGjzRGskB4EIgyB6tAiYqgG0tvLmE+HXz2D0WI46dOcdxvasCKDE1jQfr9+Fc9Eonz6THX
	WcCN4sKAMT5PrZt5WwOSjSfHTIdcAcPeygBlvs3iZEOJc5OxG0vSr1FW9GzzJTHvjxfHc2
	mAVrr8PUXJPDY0HgYkKc6sWF3eA0ZIM=
X-MC-Unique: WxIHGhb9P560wV7W31XGMA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVZYwJXO7MxWK4LnLr9DwkeNsoKY6eXfWZcrOn0W/qwL5TZR9XFZXZKxoDfUIThh+4X/F7JSTAWoz5x7e4ngeATk6kvnQGdLI6kh4aqrMnqFScTveHzePfHMVWXKZxDUYpXH00x8cSyOtd5J9/5S+IiAuHSyztQ1YyeMNGw0K4NDzf7XYjo2Jp/R0v88m9TNvcyJc1msDVJvOw1RZTOsibbNqyQFgalUPUedefdDo3Mf9S2/MGc1bILMaeYOVxJ/GghniRDww8JHBYlDdHuCm5y4+6PbVBKT26KC/vOyv15pWhumVDCqdim5YqR0VLZGN/ARDQLIjVSWZqME7Ija3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KxpdRytzyNHAeQ7ItxC9M3K6kjc2GUgtr+Q9qHAma0=;
 b=P2zHP2D81rUpOx97Lmolp0ChrWsD7WCnftKuAG1OxgzoOO5W/NFnCTkqM9oE0W8KbZpsYfzvcJCKJrYZPrwHRluN7a5lm6JxxfcTFG3TM4VeyjNq1aaqgAsSdAnBtlNJRM2ZlOu/ggQ5Kh3uY1XavGU5FNvQ0vc6E8ixyTABt7LIi57Itjv5P8RqS4alSQ6aB8LTD1jMdPbQLA/P71HG5Dsxn/D6I9Kec9Crbj5MDYCqyTBPwzknjtU8jR606l+WIDkl6o+T+HV+ZcUWS4M1FTKnF1Z6H4tq75fGohaQE1uEPu3Bw6f/zQ2UGuWmCt4T+1sFmc0D1u5rRnVxR4SzLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fdc16024-c997-ad1f-c5b2-9ee48f44392f@suse.com>
Date: Mon, 7 Mar 2022 17:30:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] x86: avoid SORT_BY_INIT_PRIORITY with old GNU ld
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <8b982bab-9b16-61e7-620f-5a5b2be39588@suse.com>
 <YiYfVmW3iQ4wA5k/@Air-de-Roger>
 <ca144758-da48-00a1-1e76-872c3455c335@suse.com>
 <YiYqLtozm4/2Ibu0@Air-de-Roger>
 <2f0b8b0a-7f0a-13b7-4839-94f30aaecfeb@suse.com>
 <YiYxnd67jUBUlWHs@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YiYxnd67jUBUlWHs@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR04CA0030.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::40) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f70c60f5-d9fe-4fb6-14ea-08da0057bbd3
X-MS-TrafficTypeDiagnostic: AS1PR04MB9240:EE_
X-Microsoft-Antispam-PRVS:
	<AS1PR04MB92400AD04FED1145D6DE2936B3089@AS1PR04MB9240.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1EbacWUdNar8XJ9CSF4SusevAHrSPFUJaImwzZ1bCeslvLsdbgRa7DuA2Cp+LfikejpBPKuJYzdztuinxHcUvZra5YEDAhmlxSlk9H9U0SxSJpqnz//jKMVhmFxhKrbO/OAxP78i/UKCyl5e+84fqPN7oaz8JBnqoBI796nXWldQSTfctz2s8FbJI/Ob3di2JdOZQyBVR6pDQr9HVleddMPyVvsU9b9v82blL2yCzPYjmVWG39iPjsqj1/+PpSNBM90EqaejxiSbY9TcpgP0Txnbfj3JffUI6sUQg2l0HOoWs6ACpu86korH0HSCjC3wvrWM/g/8iHICRyrdPxpwX0XEZwWRAN9XUb4dpT2uZibU1cZRzPvOw4bNr1kjYfEfhxfLVdBakpJ+qQqAZfzz/S2Pz4Cx+zP9Yo2NWKULsguj5RT+TPunOSYp2QjafHuevrhvm195t36uXPTwkKTe6TgWGA2L8WmeTUF48brOa5WfHm/lxhN3+DfueGE8KDUefeG6oTsIyA7KT1XJu32RDjZbf3jzKlTdGWizFZ8zpY0Bynzhn/rScsEB7tDO+923GlogsKSdbN925xW5Z9np/kDCOB2Zbc1NnDEDTQBQfXmdMkq+AuFMpS9r67XZMcOm1GNIPMJ1u97l4gm0cgatz/sgHKsyaAKCch+iFm//mZzb5V0qDf8Vbu+DB6nHX0PWV6dvGKjpaDFfDTefPDDZSC9t64QXYZYx6e2bJqM+011cpXp+YRdGP2XXtT9HtqKo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(26005)(8936002)(53546011)(66946007)(66556008)(8676002)(66476007)(54906003)(6916009)(186003)(5660300002)(36756003)(31686004)(31696002)(6486002)(86362001)(2616005)(2906002)(6506007)(6512007)(508600001)(558084003)(316002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J8dufGPkD+TL/K+ITzSrOAiNYIyupR/z+GpbReTLGZmzVV4TqfBLVU0Tb7fx?=
 =?us-ascii?Q?C9mdp7yDX60juMht5LGvNieXwqolejPxJg0Hrd/nBf2ed01539fHmKSlHRfJ?=
 =?us-ascii?Q?juoWL8W46yxF+tHP/ttiTKDwAD5n4CNuZpFq02Un0SqkVXEsspThvVJkDH/F?=
 =?us-ascii?Q?FhqSqSyBlUWrHiK5zEVejBbLfG6t/f0pJKlAHnPO4YHqNM+70H33orC+/+8W?=
 =?us-ascii?Q?giaGZIXC/gdRvaTDv3uj/um2jwlxcWFeaZn3eyQZ5GjUGQtOS248FjJi4sTU?=
 =?us-ascii?Q?sR8Pkq9L+HFT0VWGvVFDCEDEhQHjpCBi1JbTidCvOw3RJDtjPpZb8EOFaWhY?=
 =?us-ascii?Q?wRgYpe4XyqBUY5nOoQufjI0y4dQIBWuT84n7n8cUdrNvckxiL2zJlcOptL0j?=
 =?us-ascii?Q?MEVhOYXxxoJdMRVP9SuLtmtcBOGUtQPIB7umisOO7ZBw5qE11jQqdkyyj0AV?=
 =?us-ascii?Q?y1vT/7bNyA7xpXgEEh/1M7Bngbib4KmN05OpFbMCEMdbgTxcd0mxEmo3MgON?=
 =?us-ascii?Q?k2eG7wRrcfrkytgSCMJ6Y8xi1iCLicLc71kTlTzUYo3T7hOZ0ijxWCYthQAk?=
 =?us-ascii?Q?5AexzhSMHf1+/e+aDZWCAIE2noIBf+ombs4m5lLGDImvl6FxVZZ4fAxQyxXb?=
 =?us-ascii?Q?ILfq53AYM1vxZdWdWD5NAJ2z1RDBczBzKVBlvAREpdb0t4kWAzeH2MtNXXTD?=
 =?us-ascii?Q?kCH3bOlxcLiDBEFhMynkND9tFnsTky52i+YlrFaPrbkHI1I9aFf95zwhsOR4?=
 =?us-ascii?Q?Ggs/4HrdUHlmO1UaI5YmWxLxrtae142PooSDWzxPJ0xVZPIA7BZenprKiFbx?=
 =?us-ascii?Q?X2lRdSdgd6itPSM+9UqR+ji8f4Ig1thM854XD17QekA4bKFnKTgS18cPEIBD?=
 =?us-ascii?Q?X+s3Or/gMCN38aW/oeBgvaQZaNoQJlEsMo5o4XJtn3mKDs4ztP4cbFd7Rg4s?=
 =?us-ascii?Q?FHjKDyI99GNiGDkiVBwaVOONcEcSOPtLcp3cs9t6dohwIRq7JaF4j4j1EbMJ?=
 =?us-ascii?Q?XUXmyAeDPWWYtnTmbK6tjfsLUi7tilsDLelPE9NRJhO4bg4/PZByfWFioM4I?=
 =?us-ascii?Q?JK1dwJYAouWLBEkrk2mMpvM33VI1gbsNzTTdRhL2fNFlpQyjE3s4lrLHeS5c?=
 =?us-ascii?Q?533z55y5NWwdKxu3hF0blw2T3auNmTJgDzGZUJkIKbXjCP98Osf/iSPSh4pI?=
 =?us-ascii?Q?hHdwvjv/uPrHFILAEQyZlJNJRb03qg4w7aH5VGijqqeCRYxVzNPXHd9X1du3?=
 =?us-ascii?Q?iDooc7Y4WB96yPijqVXII+Z6E6DfXH7DtjkaROMwCcjwmnsedTi6CLEGbaid?=
 =?us-ascii?Q?HiBk/vlr9E4jIt7s5EZ2qzm9QZJdFyyBGo85IhuGoi2dglXxBp1FJ3P60+CJ?=
 =?us-ascii?Q?o575MDVxFH7oohiX8aqUwZfavYEiTQ6cZ6AVAxlXB94+Q5x5Z/Z39qMepKs0?=
 =?us-ascii?Q?dlBLyYMoTsId4RW77TqAgVYSmnrpRCZ4gbhDeO786AiOwC5CfTjq9c0hCzsZ?=
 =?us-ascii?Q?vkQqJ9Ol25U2Lsv7h032vMyrELPYJ+MgoYaCuGw1eC/9/DSmCcNbPcgebPdz?=
 =?us-ascii?Q?5URTWXHQ+zzYoUDHE/OYdBWxauzoJygExjwi0h/d1t7q//rHhvcA+3c34jKY?=
 =?us-ascii?Q?gQdF+ha+hqw1FhYJ3eMy3fE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f70c60f5-d9fe-4fb6-14ea-08da0057bbd3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 16:30:04.1548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S0FsEsvA8BGjD4m8W2BIm607PG6jHAwh/bkxoWOjz3YB6g7mPrsHcRq9d76b67wE390Gl9HLn3YIrr8Pa/RssA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9240

On 07.03.2022 17:23, Roger Pau Monn=C3=A9 wrote:
> I assume bumping binutils minimum version to 2.22 is not a viable
> option?

It's an option, but is also part of the bigger area of determining
what the baseline tool chain requirements should be established from.

Jan


