Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A523EA491
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 14:23:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166295.303658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mE9jL-00049n-HU; Thu, 12 Aug 2021 12:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166295.303658; Thu, 12 Aug 2021 12:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mE9jL-00047S-EO; Thu, 12 Aug 2021 12:22:39 +0000
Received: by outflank-mailman (input) for mailman id 166295;
 Thu, 12 Aug 2021 12:22:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QHFb=ND=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mE9jK-00047M-7z
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 12:22:38 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35f6945e-986e-4462-a172-47adadfb8b5c;
 Thu, 12 Aug 2021 12:22:37 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-3NOWCOmaOmGIkhmqnvmFFA-1; Thu, 12 Aug 2021 14:22:34 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5328.eurprd04.prod.outlook.com (2603:10a6:803:59::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Thu, 12 Aug
 2021 12:22:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.017; Thu, 12 Aug 2021
 12:22:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0139.eurprd02.prod.outlook.com (2603:10a6:20b:28d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.13 via Frontend Transport; Thu, 12 Aug 2021 12:22:31 +0000
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
X-Inumbo-ID: 35f6945e-986e-4462-a172-47adadfb8b5c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628770955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zO3HYKwDpapNdXciIMOATOXVAvLlsB7Ob1p036QeBLY=;
	b=C8iTWbgoF42TrBou9xNcUDPEeFqwtx4glNCIfWV9MYvoS8qIUKm9wp8T2QgRLNX4BaHdvW
	1xxz9onHiyIuT9CpkrclvROqoTHmNXrveBL4mrFP2uoeqJefhTiVHt9uVgnpsOZ6y7Bj1j
	Vw4vqawSFqTS3YRo1vDuWYme2sxsZYE=
X-MC-Unique: 3NOWCOmaOmGIkhmqnvmFFA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LixRwQuXdwPKbnR79oHfitpLqyhT8VFam4cnynmA+KEklZPTS/hS4OjfObvX/nGba9OT89gR/zIxv0qGaSatMh84/y2OJbbfSj/k/BAtVOqITI+MHics1ucaIrm/zsTeWdVHlGkh9jvEd5W5bhx62sio9ZcujXD3CVv9i55mnKuT09kER9wosslKay7Ykfs2aS0s8GCj0soDOkMErnYTxFOrIZogUYb8MDBA+ZNdsG/XgfOnShZLFeyHa2xa5AtQl1n2ESg1vwkenPprFArp+GtkMFc2s6I46A/5Q6NOj1NL6TzOQKGYaa+gj8wXNST7Il+yrTNQy7dukkrSS2uYMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jc5UOJNVYigHrspVHTFQjALjNXWNmEuCuqHYBt8M8Ik=;
 b=Sul0AixpDfmrv5uiCbULLIkuRCduVj7Ykl/EPjQWzS0EnfYKQoxCALW6zEo9y6euWsunaCANw2J0D6nckwhgLKNMLdKfNCyfvWRCGXp491Tb9mA9fpzMl0HINVRCuRwGsBgvotk1K5Jn361u+qXS+BzZaInZkKtaHNiLR+/AApYTNnRxKZKMIwAydZGwSitxYoBAZ7tRM+jqzKbqUip3Q5Q6ZSyfHEU+1mqkncbJ5zgbdziGYIC868dEf/dJ7i7tuvbpPcB/c3vMM6FYhe25bWqQmtj9ZIV18Ld84UqpLKD7AB+vFUaZ8mbXW+hSbHbOiXnyg4A7Ro72Vr063HMo3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] x86/pv: Provide more helpful error when CONFIG_PV32 is
 absent
To: Jane Malalane <jane.malalane@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
References: <20210812114857.20971-1-jane.malalane@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <251d2de3-5bad-9765-0b30-b8f0c7a9c689@suse.com>
Date: Thu, 12 Aug 2021 14:22:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210812114857.20971-1-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR02CA0139.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1a0f5c6-0ebe-48fd-1059-08d95d8bdbd4
X-MS-TrafficTypeDiagnostic: VI1PR04MB5328:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5328D4415F11D378041AD668B3F99@VI1PR04MB5328.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iPdA1StTYKhC/pu+DGKH8nvIDwoFhlxesUEECqIhtfH1nxPP9CAHxuRggsi6aHzrG5vliLtOVeU0JoWeZU17r0GurIG7HzcQ+qX+1mfiKSY/eOojW8k8FPjLqbmS4dZZ8QJlgZY3eiem/shBuMjC/4mvUvDBn2MPH8JYw89+YhqfAholGx/+HTgb5w8QanoH/qpXSi9bkWyhMSLLkDGmJg8VJ63V3aIug2uZnHZeNYFwkihlj1lnB5g/toc0Mykh9pME/exzG58VdsYaeoYaupCWD2ZfRdPYrDL7a8Apcuvl8BXM8qnCQbtIJBEhkvwGNOEGWJdwCiYQwUCLUW1Obu5uoCb17OVNNX3YMTP4PfccplN05M4wLgyjWXTJW7TZLJ56+PDJFtWQ9HNVKy3zHzzFs/cLEDHaPjtLaCsAm9ySd64iE8RH1gEDW9Yf643EHPILbNiKZgaLJZYjAzujX8YZovDjcusPZNvHN9s5x6DL2Pn2PzBEZdL4CYVhfQ931OZePKbzUWrJSnxgVT63K85+efZFpvacOOzd4ArCv8cXkdS0/mcm6DEw74TtfDqBUsMKGpZPyr1IvhxZq5lne8UqRhKCZhm09FcNrMxo9V6PEpXLuc7YjgCTdfjK4u9F3rqih47/+ukycYi9bQqZuDXVE9I3ixQ1cOQf5ai612tvhNsU2a4bbPWCxirKCVR8P+YTQySbejuwgOmpEBgO/+oyXvAb4lXczsHn1RDy0vI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(136003)(39860400002)(376002)(366004)(4326008)(186003)(26005)(5660300002)(8676002)(66946007)(66556008)(956004)(2616005)(6916009)(316002)(8936002)(53546011)(16576012)(2906002)(83380400001)(31686004)(66476007)(6486002)(478600001)(36756003)(86362001)(54906003)(31696002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qN3xFXnGy0j3E2uSPKYyAfS4CSjE2vXoy/EEE9OKySqzAALjEp1zfGoCccf/?=
 =?us-ascii?Q?S5q4VildMKDUaTYsy4l3hFpV0r2yOtDSofvFeVZh0fohRjKlH3w8ULfQSMHf?=
 =?us-ascii?Q?Aa/A8m/zT9Gaz90XmPb8LTji+Kpeo7qFO3dvhmGL3Os14mPyFKS6QHiYtLB8?=
 =?us-ascii?Q?/O5yNY5/lmprs8FRwm31t4wefkAwGbKD6aPOCnNHg2N0wuaS7oOgyWBuS+TO?=
 =?us-ascii?Q?YWaohtVpLsScJZoWqe3U7FFFA2oWFQhAO1fWPVb4WUULsQw5BEI/Chm4MEZ7?=
 =?us-ascii?Q?wirrNDTh3Fv5Y/Lx56TkPTX4iwnNWH11DLtHHkF8U5wL5Jk0ROp2HaXfWLG7?=
 =?us-ascii?Q?WjDv/zRpNT9dqHuqYTb/lKnxNrv0BxWfd8PvLQVwcMDkri/0m7X0aN37+zgq?=
 =?us-ascii?Q?H4DvylzVzGhWIOy/DDhwSZTGg9eUQzbIZx64Cmp3lNUJKpBP3apCxrRzI57J?=
 =?us-ascii?Q?cOGWOPB19QBpunFp6PfC1wh+VxDBQl3rb5PgNqUT1VZzzr/31MJNyeG31cxO?=
 =?us-ascii?Q?t5QgTvS0ctZGYAy1I+7dwe2m85oD66zjs6IAi7thSCk/b7vH01W+tsxki2cE?=
 =?us-ascii?Q?bt5ZS5epBtFlFHiw+PTOAIcxj+CvMhPTW6ba1gZbCjylH8Lq6TblLWsk/HMs?=
 =?us-ascii?Q?Ui0ieiFUAJLw22N38kMWChf7eLEUQnWkD/ENtYy5IWXK/v07jxbeF8KmjJIL?=
 =?us-ascii?Q?67Q4+5pFcE9S3W1gGjpM73vBxorp7WcMLJUbUy75I4f+WQP2DeE1+Wissvcy?=
 =?us-ascii?Q?fCsLJqW60v0W19ysKtTUY5+uZDpV7qP118gZg4s2z5StaQFAm5pcqmcP5jEb?=
 =?us-ascii?Q?lTAhFKlXKTelBca8gnzRLmDsFlB1eTxI5U0sHw2W79O5ktTl7DohWr9AY9vq?=
 =?us-ascii?Q?rblMPRrkn/R7xtKxJBEgmndQd6IyQt9+TFuiJVjJ+CZ85yMV2cbqnfDPFZNW?=
 =?us-ascii?Q?JheNVHogd9fVlzg7218XtIK6Vh/zbp2gweqSAOGPiO+KslDUjB2pxHmein5q?=
 =?us-ascii?Q?V22bnEzkRJ6tv1O++k3CcL5L7NEHtTKVcG/gKbSeFLMQCUyGpqsyHBdvgzrO?=
 =?us-ascii?Q?PQI6ue8zpgVu7G6r+xqXg7DuWwylRIv5bIROUuwaU7bnwu7EkxU7N5S8qtLN?=
 =?us-ascii?Q?BTjc1O0m3P0KKBbBHQCWCo9G+cEfq3rnig9bNtxjt/HLP4bttgLI1oao5slE?=
 =?us-ascii?Q?ddAisfdVzobYP6j3a6bwtD/lNZS3x3aIagAWLEnQEl9RutF0p2X7LKVmz98M?=
 =?us-ascii?Q?V2e+ZUOZeE+khd5Bkhkxq/ZlxvKvZvrerhJDAd5dYyJ8Kp5DketyJ7TqBx5+?=
 =?us-ascii?Q?SG96klNJ4tIJ3PEQdJbR/2ef?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a0f5c6-0ebe-48fd-1059-08d95d8bdbd4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 12:22:32.0250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2J25cgwW7U2JJu7M0Zz84Ux6/drz0gkqynbl4yNTW+Qcmw8SVR8BzywYQcPJnwWIx98uxWbh6y98E2yyX46+dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5328

On 12.08.2021 13:48, Jane Malalane wrote:
> Currently, when booting a 32bit dom0 kernel, the message isn't very
> helpful:
>=20
>   (XEN)  Xen  kernel: 64-bit, lsb
>   (XEN)  Dom0 kernel: 32-bit, PAE, lsb, paddr 0x100000 -> 0x112000
>   (XEN) Mismatch between Xen and DOM0 kernel
>   (XEN)
>   (XEN) ****************************************
>   (XEN) Panic on CPU 0:
>   (XEN) Could not construct domain 0
>   (XEN) ****************************************
>=20
> With this adjustment, it now looks like this:
>=20
>   (XEN)  Xen  kernel: 64-bit, lsb
>   (XEN) Found 32-bit PV kernel, but CONFIG_PV32 missing
>   (XEN)
>   (XEN) ****************************************
>   (XEN) Panic on CPU 0:
>   (XEN) Could not construct domain 0
>   (XEN) ****************************************
>=20
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: "Roger Pau Monn=C3=A9" <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>  xen/arch/x86/pv/dom0_build.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index af47615b22..80e6c6e35b 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -362,9 +362,9 @@ int __init dom0_construct_pv(struct domain *d,
>      compatible =3D false;
>      machine =3D elf_uval(&elf, elf.ehdr, e_machine);
> =20
> -#ifdef CONFIG_PV32
>      if ( elf_32bit(&elf) )
>      {
> +#ifdef CONFIG_PV32
>          if ( parms.pae =3D=3D XEN_PAE_BIMODAL )
>              parms.pae =3D XEN_PAE_EXTCR3;
>          if ( parms.pae && machine =3D=3D EM_386 )
> @@ -377,8 +377,12 @@ int __init dom0_construct_pv(struct domain *d,
> =20
>              compatible =3D true;
>          }
> -    }
> +#else
> +        printk("Found 32-bit PV kernel, but CONFIG_PV32 missing\n");
> +        rc =3D -ENODEV;
> +        goto out;

I don't see the "goto" as warranted here, not the least because the
code fragment right above the "#else" you add also uses plain "return".
With just "return -ENODEV;" (or maybe better "return -EOPNOTSUPP;")
Reviewed-by: Jan Beulich <jbeulich@suse.com>

In fact I think most "goto out;" are unwarranted in this function.
The only two places that want elf_check_broken() to be invoked are
after elf_xen_parse() and after elf_load_binary(). You'd be welcome
to add a 2nd patch to clean this up.

Jan


