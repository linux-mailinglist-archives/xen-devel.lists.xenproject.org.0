Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A4C52A516
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 16:42:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330985.554419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqyOG-000281-TW; Tue, 17 May 2022 14:41:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330985.554419; Tue, 17 May 2022 14:41:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqyOG-00025Z-QC; Tue, 17 May 2022 14:41:36 +0000
Received: by outflank-mailman (input) for mailman id 330985;
 Tue, 17 May 2022 14:41:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nqyOF-00025T-Ll
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 14:41:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72fc8adb-d5ef-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 16:41:34 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-o638PF8RM4Og78aA8V2a6g-1; Tue, 17 May 2022 16:41:30 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR0402MB3383.eurprd04.prod.outlook.com (2603:10a6:209:a::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 14:41:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 14:41:25 +0000
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
X-Inumbo-ID: 72fc8adb-d5ef-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652798494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yoaY0c3KiOG1bK7Bl+GvYErM0YQiZPMEGgXlFFUoapQ=;
	b=S/dMMUhml8I8+pJSynzrjPLC/DkAy3WXFZVIM+9UCPhc8KgVp3bmxHXjmFZhA7KoeizWsc
	WnTy2Be050IqjAx7IsDsVZWWQ4AdxxeIt2pMgTCY+up78tDXcfyDrfXj67h5m9J0Ss53HG
	gx9qVav/4pRFdniBQztazJASA53C8p0=
X-MC-Unique: o638PF8RM4Og78aA8V2a6g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kV7f+xqXeJ8Wp43TK5PmOkKHJyR/UE1VGQ/+wpzyZ2Yehftf8XdZ4mXDKelblWY7xdJmnc8C79XNkPhd+3r6Yo4CygYpYZbr6qUv2f5ddsA184sGxyGKNZ5cZDpUqwbxQdmQzE2l9RP+KKSwPjDjg4CGGC5wV6E3R3l1ZPiOa4Rb6dTzy8Bm3JsTIiYdyHnYWcQnCdllSeQpZKT8GMohO1RBiElysm7ItwqWL5vJDEVnAfMpOl42WcW1q0i1fWsA7oJHcwaPQIAjHLFPmhJiHffYBECyBZsAL5egKvetizcZ3A471PIGAQURepxkTwgOgbbNvE4UHrSuoVVIAMKHvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CjuqExjHmiiQyXdM22MReiWUF1qDVgY1XrCkTbHvGk8=;
 b=J3crcJBcAndy3iT+Ns4wdQ580f5GWUEfUuYdV8LX8OahqGlc7WqkzbYzHdoebwQwojuPdQ0cbXkDxJD1n66F6364G31yPnNVr7RxbDXfe3pxgjT79bK0v02RaBio7p4yjLAIEiMjd+qOqfYJPEL9Xekt+bsCJDvv+FcI0L9KkPFbhQ1vc+PxX3mcRkFJwiPY/NSNaln4qfRS7JFPXTnhUaBeDcL4F0vat379kYzMrNZBTic1eDbNWt0YijZ6FsMgGMUT2AoJ21KqzPFgY2Ev2SGuVhrcDv0a/le4ClpUH3AC2y1fAB9GMdfXlVx9m9z89hiZ8zdfJzpePp3p6cIbZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c8f95032-1417-adfe-3170-62b39ec0f6ca@suse.com>
Date: Tue, 17 May 2022 16:41:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 1/2] ns16550: use poll mode if INTERRUPT_LINE is 0xff
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220511143059.1826794-1-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220511143059.1826794-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0008.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2083843e-7e5a-47f8-f5a8-08da381351a4
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3383:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR0402MB3383274EDF5E9DDA6731712EB3CE9@AM6PR0402MB3383.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R0bEMtJxK7S4uSJGbGDZLuX9vbNPlzj+/w+xrG9RmJqQHjQ65jLASd+smKCdr4zfeQUA7bDyEEu+Qaa/6qZ6YohhjLR+j1JZw+9+CSK05q+pYuclwhpb/m5ETWiIypxv9P+xEXC1tX9wI29rFWyOh8AMzzlHYYf2IXwm3ZSRPL8coRX56DkXu7EA4AebuprZkQbZ2mXUise5/F964Jq3bCGiBD2JzDpBIrZSC1y7sgNGdXptC0um0yvFsKibDar8OwE6ELVD8PqmmFnPX2DAqa5HERLc1xlUWzNCxuGajsW6NTcw6/yYm53Rt2mAfdOW+QfPyKPoNztsqV4vX+nV655NxFpOG/yiYzz+CKhDlYFni+He4npIi0/A38EtfnaQ37Yn0OyAj7MEyTA1lGxw6S8kQFTkLNzWJKBVzBYP+axZhpf7wQviarOr+35au7bN6dV+zbXoQFNiigfyKpjPXCN9yXn1xkgvcO7ki7+hxGPG/GhvgwpJnoc8q7MuSUS9x4UNf+isu4JyScCCkLq6/VUQuhXULsGOiJ1tUHebq7Ckobr/iiZq2+tcSKObnOKRn6VltZLylOFY9RZ3dSFCf8WMj3B8Qp7c6pwE72GW531LBe1Eno7/mwmsivyp3b9uL5KTGVPaCKsz/cmXoXBosdw3up5mdIStJxo+SzkRGUDuyYKCCKIVCoCTKV4Bu58ZQsjzWaKNcTA+WdVmZVZ16WdPvop69gIxDfcchspCmorHjFDAzk1IGV2hvfaMNUiU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(26005)(2616005)(6916009)(4326008)(8676002)(31686004)(36756003)(54906003)(186003)(66946007)(316002)(5660300002)(2906002)(6666004)(6486002)(53546011)(86362001)(31696002)(6506007)(508600001)(8936002)(38100700002)(66476007)(66556008)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+jqF1CN80mlvf0YOuBg4F3pJvyG3GpwWQmnVBSFfljxrq6kCCKO8+LvcP4bu?=
 =?us-ascii?Q?R+MStvkgFlDLMTkOI8ZRPQ2UVG0kvxVDyxHf1cFn+hjwEc21AaQJvdqRu2M+?=
 =?us-ascii?Q?ZaQAbGbTTNqS+63fy0ciMvsPiZllpl6DNLW/z+c9k9V+OazK1rdSIJQH76e+?=
 =?us-ascii?Q?SdEOkE8nP+K/m0ZKReT1nbWXH6m0ZxZ62hPyFg1TeCyqk8Bk0M+DB+OJEG1b?=
 =?us-ascii?Q?CvBph4ISGECNDy+u8cFzeR+Gg5prGX0pwRlqeG5XWQ+uY/pK/pCAAWUaSVfw?=
 =?us-ascii?Q?CeKnK9V4DFdsmDODab49MKvfrbfZP2nQR/ml6O8Pvl9zt1iI91duvBPUFR7w?=
 =?us-ascii?Q?lvW5USFkV9nV/sj6V+D8lkcLY7YvN2rqgdvmvrln0dQ9FpzRmzi4IiIoJfEX?=
 =?us-ascii?Q?qgfaWvMxPkUJFnqTm8zzZ7k3oyaxrkUScnKWR+XbWmKzo+JWZU5xioDhd3je?=
 =?us-ascii?Q?rU6sJ3wajIGWsn24/zJ1ZV0U8El+WEfpNIZVR9+H+DqZSZZ12VlbqaKwPgX/?=
 =?us-ascii?Q?SLir8chz0hiqc/p6lQEVzMcDYiFBpBCZRTdkVzS+lc0Mb/YDnYahowGPS0wd?=
 =?us-ascii?Q?d8keYuJ+gtSbO+bqwZBvrlB1ztzHpZvEqOIJrlQdSsOqVhWESCrBpNtRDs8u?=
 =?us-ascii?Q?2PsTnCKs+gM/cPlPTMx+KDGQ5CT3mC8tzNI+whciJrLf9VaknDXRhHa0klF6?=
 =?us-ascii?Q?sxCD+GvNUUnsI1V1+/JRaE7EFZJJfxCjnBozpO9022Ekns4y+OJxLkH/Wzo+?=
 =?us-ascii?Q?IV8DzGFaQkXLfHNgXTnz9qaAyMDE6hI31jIUiJHO67QlDG4Vs+6kfCGWXxMQ?=
 =?us-ascii?Q?DOltQQ1ogD3IsLUsxDQ9XyLM0zoqIH7UZl/cGvAl+3vBizpPNnIG3dP++Azn?=
 =?us-ascii?Q?oQ/Jm6j70oJI89wQetUQ7eIjJHQH7g60jlJkXirxr6u2XZVHFSkRXE4O2cE/?=
 =?us-ascii?Q?U7XMaTN6/n6G5ZbpMuwuGoiLi8TqQOWh9XGKmzD+WJO5+fcViFDDtjp+rpLp?=
 =?us-ascii?Q?3QpstcxwNn8vqU0hn9PDbOMdqH9n3nDChAXD8VwKbPUcAl7qrf0dpLpOWedg?=
 =?us-ascii?Q?Ia+eT9pue+52XeYUy1DgKGRt7uuO/8EdCxJwFMvVDfT9gvBTnMLidk4axuWR?=
 =?us-ascii?Q?AXluEx4X0bSSou9kYdSPxZiKgGUGgyIM0xRc0l4ZV++2rl9BsUhcjlNMV3Zz?=
 =?us-ascii?Q?Zhktz3O8Ejw/1WkyiIsIMHxdZjUd7O7+IDHJUNrbhlETHqNBv0pN+0VaNin9?=
 =?us-ascii?Q?cp5YpRrv6x7lHa1zrYjmxgWTGZx/28Mw0MXHBUtCHULKSy/3H41jHDaHk2vI?=
 =?us-ascii?Q?vCEphchhMjTT+C2f+2O/D2o1UCdcWeSyVQXlqIkhUkPDfjhBSpbotR6oQldY?=
 =?us-ascii?Q?z8pjHPZtyNNPCnbUR1rza1qftDZVw6jV/XOAs1E2Ajzc9G+M4Gj7q+hkx2td?=
 =?us-ascii?Q?SzdKSulJFIvegRxY4WrW4atAOc2gbJb8YDzpDtj9NT1cbXJ+wjRxrgxDtUDi?=
 =?us-ascii?Q?nyQvKkGa/Hvqv/nNLT4sb2MlP9pZErPnCYeV15hHFpbr8exvC9jCKt71bq8r?=
 =?us-ascii?Q?IKc9jFD9Pu8kwflK/UbR8kBh+NIF4tI62QLZYg76t2oTrW4/HGN1VPotBC14?=
 =?us-ascii?Q?J6wcwshWRe8YjnktothYgx2paqSCU/LdL8G+pSTErnzF4+XThRSFt1zJvFMY?=
 =?us-ascii?Q?ml/G5uZW411Cmmy/7PEmDtZIUm99gd8+QJQ+OGwtohbrYqLnPgRVcxHQ6UTi?=
 =?us-ascii?Q?JlFY49ehXg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2083843e-7e5a-47f8-f5a8-08da381351a4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 14:41:25.3364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i8A4GJslIuX/bVMebaiKpd1kCvEwlIDLiMRJyLLxkDfe7+WcddcxCLnPaUdG8kXBZ7j/d9OpHgXOgqAtycP/mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3383

On 11.05.2022 16:30, Marek Marczykowski-G=C3=B3recki wrote:
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -1238,6 +1238,13 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_=
amt, unsigned int idx)
>                              pci_conf_read8(PCI_SBDF(0, b, d, f),
>                                             PCI_INTERRUPT_LINE) : 0;
> =20
> +                if ( uart->irq =3D=3D 0xff )
> +                    uart->irq =3D 0;
> +                if ( !uart->irq )
> +                    printk(XENLOG_INFO
> +                           "ns16550: %pp no legacy IRQ, using poll mode\=
n",
> +                           &PCI_SBDF(0, b, d, f));
> +
>                  return 0;
>              }
>          }

While this code is inside a CONFIG_HAS_PCI conditional, I still
think - as was previously suggested - that the 1st if() should be
inside a CONFIG_X86 conditional, to not leave a trap for other
architectures to fall into.

Jan


