Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3774457BDD3
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 20:32:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372132.603954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEETr-0000Ni-TH; Wed, 20 Jul 2022 18:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372132.603954; Wed, 20 Jul 2022 18:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEETr-0000Kx-Q1; Wed, 20 Jul 2022 18:31:31 +0000
Received: by outflank-mailman (input) for mailman id 372132;
 Wed, 20 Jul 2022 18:31:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LxtT=XZ=durham.ac.uk=m.a.young@srs-se1.protection.inumbo.net>)
 id 1oEETq-0000Kr-9b
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 18:31:30 +0000
Received: from GBR01-LO2-obe.outbound.protection.outlook.com
 (mail-lo2gbr01on2104.outbound.protection.outlook.com [40.107.10.104])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2aae1e92-085a-11ed-bd2d-47488cf2e6aa;
 Wed, 20 Jul 2022 20:31:28 +0200 (CEST)
Received: from LO4P265MB3790.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1d1::5)
 by LO2P265MB4230.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1d7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Wed, 20 Jul
 2022 18:31:26 +0000
Received: from LO4P265MB3790.GBRP265.PROD.OUTLOOK.COM
 ([fe80::790c:999c:1a40:26f7]) by LO4P265MB3790.GBRP265.PROD.OUTLOOK.COM
 ([fe80::790c:999c:1a40:26f7%6]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 18:31:26 +0000
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
X-Inumbo-ID: 2aae1e92-085a-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpAQMN6Tf2HZL2asT3r37z2FwobxMWrmsb+OZ8fVlLrhxuq5hMkZbFZHaMJjMvT+hNS/A5Be6qynYb/U3WVyll59M5vSwYuAXkjJYA6aQVwpI9i4VHUXTFifORGGn8F3tO6rDKzlnTCK8orDEHT5qcjqwTAEEEnf38xswZDow9zWSxqVULpcWdg2rWVDseKKMEwujgMTcN4C7O+QCszPOUP3yRKOye2jy+R5pPMf5N/N16UahjTEUmBTDfxs0gbWKW6mFyOiXPzeO4vSGXgs5rfqIrN7NS6SkVJPJOplrzWav6VBnALOZKTc6veJOrg79H0Xneu6o0UgpwsWx5mSXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXziTKEQNyfuo+3a5A8UlFLtBUbdAxQXAyeo/n97MoE=;
 b=hiYc/GdaE9EL6VhzO3L1ItB/+S3q03yCwyIDL9YWrehQBeSpzv2XaDKpLRClTXcxFr/aBIywoNlXJff6C5Z6qqKlOCHvyIJ3Cjmzag7M31j5nhAGh6AWZJ7L3QU04hTqLT1h3MRRCSA5ovVbJ81F02rAiAod2SSGKzzFUflQZFe4pGOFKL6WFssNihqLHtXQpbDk+usIQHrnQInnRyg5JCTPpneC+t69Nvt0ByKe0xjDFG4Ce5mmglssmHpQHTmtXcT02E9kp4yENaoYEecywgYbkiBTepnv5gyDWLsCuY8EUzJaXn1OVAT7DdYXnSIY2ffx0u25XtIv1JvfPYeKGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=durham.ac.uk; dmarc=pass action=none header.from=durham.ac.uk;
 dkim=pass header.d=durham.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=durhamuniversity.onmicrosoft.com;
 s=selector2-durhamuniversity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXziTKEQNyfuo+3a5A8UlFLtBUbdAxQXAyeo/n97MoE=;
 b=ctA5ByEFewkxV3bpGEcewMl7a2BZr5b99l9bkG8w9I74xJrlghacjowzAIACLG3EFP4z0QEbIXqzgzq2w20eH0Z6+aavGf74GPNJIhz3nfjkNr2vPqDVNMgjhGXRKScUiRQaLgF4g+P7+RoFOjEafRUzrIzNMdOvD7ow167YEzU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=durham.ac.uk;
Date: Wed, 20 Jul 2022 19:31:25 +0100 (BST)
From: Michael Young <m.a.young@durham.ac.uk>
To: Jan Beulich <jbeulich@suse.com>
cc: ChrisD <chris@dalessio.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Panic on CPU 0: FATAL TRAP: vec 7, #NM[0000]
In-Reply-To: <1b6bed07-a500-4683-3b0a-0c82dde1c1cd@suse.com>
Message-ID: <54bb75ff-9f28-8d4a-3faf-53978cf3f5c@austen5.home>
References: <202207200448.26K4muXc067471@mail116c40.carrierzone.com> <1b6bed07-a500-4683-3b0a-0c82dde1c1cd@suse.com>
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-ClientProxiedBy: LO2P265CA0206.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::26) To LO4P265MB3790.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:1d1::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56d1e207-9641-4dc8-06d0-08da6a7e0e2a
X-MS-TrafficTypeDiagnostic: LO2P265MB4230:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AaPXZ1dyc4TgWalAaUIEx4mvA7xrGE/IelutoY+l48+vY39K6mVHlERiNGRb6GXensaKjGhXLbi8NITQ0B3gCn75DdA4ziWw/4tdeS6SKjGcwl+yw+RUFfh29p/6CdH6R4+RdKykdLJew34V81G3pBkNvk0Ngu4KYli2SkW29lIWEPV12wixkf7e1M4mubo8E32uUwpmS2Xxl8BIj9WjURRvJ/d/ksvDtkiERsbR+yVC3RW2cbUw6/yo5hcQL3XcFVPRyYcmwVwDa9ItsPLmjnS2yOlcIi7rdVOkP/vRzLjCDZy7ZoyGENT/dELJsDMt51RXysPuzza3IUbxpez+ZEYZvLeZ8v1YVrMKMg5yC+XDO34zfd2FdN5F5XTyYDkTe+6nJOsydhT8tN/92LFrfqDlKuSt92O5TTZ7w6v4rAbrUpXOPtIbv3P9WYupgemBS02g/mNqwod6k+kpP1aPohnXhdmU8QPzfEMxFWnP4GiEVqAH9XXFSh8lGUbjhvDWobAnwB2AcXO3Y6wkDNMqiZQgXAiGmDN9NbSV301fnRMo5AvxduK69tzhQjlOciFbGU1iVX5/zzzVnJSRo7FisrU68R1MnQsRJ+j7EcdDyaN1i/DelF8Am+wvklEZYCTCbMtkiRUQ4Hc6H8QQr/Gcy+Di5yVsIIkd6UNHF5gCo15EEHrjAT23Ug0iKZUXe63THo1/w6E9VPt48IMiSoIhXHBbm7Sih0Uf78H2HVmk55oMeMr+IXyN/sjBtH1Kkyf6i2SLlrMsmApfEaSjf5xMmMxElf0tWe7IgGdNjEadyIucWWYOvAM4KOY36oTlSd6aXWzl7jxqFihgDsFjwYoDqA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO4P265MB3790.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(5660300002)(2906002)(8676002)(4744005)(6512007)(966005)(4326008)(186003)(41300700001)(478600001)(8936002)(66946007)(6506007)(6486002)(66476007)(86362001)(53546011)(9686003)(66556008)(786003)(41320700001)(316002)(36756003)(6916009)(54906003)(38100700002)(58440200007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gqPXV2JTu6vQDFZUUBhL7PXFg0n3a0/72wbNgWJIRB/2JYPGHMIpkAeZQtg6?=
 =?us-ascii?Q?rblSvZVNh5k3H3/ew4GgxgHyLh4sZW/rZr7iqE5Kw40PY+7YZ5XAKLmolS5W?=
 =?us-ascii?Q?Tiq8e/BCzachhUJuT7FZKjxYpMzS1f6/8Ms0yv135/PFEnTPvyOkQH+xncZM?=
 =?us-ascii?Q?O2l5xiM2NCXIksFaFT7y5U9KEgJ/UeouXQkLL1yTBfk9lK2Qap0k/yzdpPq7?=
 =?us-ascii?Q?4bfcaq1/ru6oH1kVAiGZpSIabyqWyAiBI/cnKLSLGxg2cuB/rsksjCWk0Dnc?=
 =?us-ascii?Q?ObA7SvC2gGqHA19MUUJg9OaAwQI/+iYSFandgQ5yurGIPC7NEMiCktmCdNd3?=
 =?us-ascii?Q?bMqHkwGBrxCGedYoGkWwKUEUeUROnOBWjkV5IzJ+3szU7zZtNQnVCl4BZCjN?=
 =?us-ascii?Q?t//y1dSZ4M/69IWTxCvnPce25azIXXkMmNPwVtF7/ezvnaQhLnj0tyVGSxFE?=
 =?us-ascii?Q?yKA5SctE67zR7xKepXTMimpbvKgoKX0BM9vAiS6m7bcQFOwMrkSjlzWubqL3?=
 =?us-ascii?Q?H610Bun5kagzDSxSLs0YV06V8QyDP6QRbsGU7x7vpZB5HSU6zrz+FMOtFfSK?=
 =?us-ascii?Q?rPf83X01tDARHRybQdJVtTINUlrhV22G+meeOtg6BDHo+QirWzkX7JRx0p7I?=
 =?us-ascii?Q?NWS5K6mM9h1CLyKPUnIRyMYSRpMpZPbQq2i1ZkGBci+TVEtTwO/kdDA3WmTa?=
 =?us-ascii?Q?G4wwO/eI8FzKLv4+SW8cQMkJA/S6+A8q+20OZefXL+KhJPVcNsMMuReu2SyK?=
 =?us-ascii?Q?Ju53mKrk4MfhTmT5MIAC2KQvQPm3+JA7oHJxcSYcRGqObdHvybpJhmR6lT7w?=
 =?us-ascii?Q?VOkahaaPPF1chOCK1UAeuj0w3yguYs7dd9iGTRgHncMaDy6d22ydJRxT1oL/?=
 =?us-ascii?Q?11xrW6++uX0uycsw1ZPCLgMBAyjwvwvEDiT8AMG+oGmNZyMiyysknpw1Tic6?=
 =?us-ascii?Q?DLjJpJ82KxdB677M7ulRDgnAxooGvJKtKjdk3UnuctBa5bVU0cvYt9jeFwdE?=
 =?us-ascii?Q?TpCtHNYyi/3xRcs6vffz23CI1flIjT/fy8shC3vwDfNg5HzqmBZdhiWtq3/H?=
 =?us-ascii?Q?FPW+Ztgv1RLE7qFvNamWb13a6uwyX3M+JrxZ8vXHoXJn6AVfDU2CNeK322MX?=
 =?us-ascii?Q?Jf4sR1d2LAz6Of9WJhH0UApUghya6zJxVX/XLi5ocTXg2mdTJWVc0wi5TL91?=
 =?us-ascii?Q?XaVFzxNg+ZIBLSNlgzTRUHe0BXC5jqH167L/5BFXIpdj0rogBARhk7wLuq3D?=
 =?us-ascii?Q?M+PnetZmyYb+cydqcm1EkS6EeJxIdttp69nzTRKNww4OVWmMGz+q4Zryri4C?=
 =?us-ascii?Q?a30i0sJRPnwModh2B5YRFnXQ84GfBSYefsk9avHMTM1YE6QMKntz22LF7Om7?=
 =?us-ascii?Q?cadmuoHJvCtoRHQOCN2YciKs5eu9vXQAZ9JW6GmIcPge+iQeeksCy5cEkO/Y?=
 =?us-ascii?Q?LjEOkfTIK/lY9ubOy4Va9BI3/7ie/ci1HnQ8hkoUnxZCsycF/1oXvH6usFaj?=
 =?us-ascii?Q?LNWAZsefaeu2mIPTBZ2MqNH/Vdqtsz5TDOXj5sH0rhSkuMCJ6IKgU6A8sb/X?=
 =?us-ascii?Q?3v5IcJ/BXXcCDZb/UHXJB/yDiZLbtljeKEauUM4of26nfqYD+Ax8qNq7gm7o?=
 =?us-ascii?Q?DJfBci8emfqg0L8cMJBVmnXFV4mGr9kwW8XNOEinqm71?=
X-OriginatorOrg: durham.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d1e207-9641-4dc8-06d0-08da6a7e0e2a
X-MS-Exchange-CrossTenant-AuthSource: LO4P265MB3790.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 18:31:26.3498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7250d88b-4b68-4529-be44-d59a2d8a6f94
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VA1DVvRw16NAvbvZRGXc9vr6079BOt/QAug19zdr7orxP4Wi3Nb3Lx9sMkWwQBzGvWwYUUP7yMXu+glDB91iGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB4230

On Wed, 20 Jul 2022, Jan Beulich wrote:

> On 20.07.2022 06:48, ChrisD wrote:
>> So, you think it's a problem with fc36?
>
> Just to also state it here - it turns out we need to tell the compiler
> to avoid MMX insns. A patch for this was already sent and ack-ed.

I have done a temporary build of xen for F36 at

http://koji.fedoraproject.org/koji/taskinfo?taskID=89746549

which has the proposed patch applied if anyone wants to test it.

 	Michael Young

