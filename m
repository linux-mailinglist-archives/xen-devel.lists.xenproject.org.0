Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E0252A5CE
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 17:14:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331048.554496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqytV-0000if-5j; Tue, 17 May 2022 15:13:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331048.554496; Tue, 17 May 2022 15:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqytV-0000g4-2C; Tue, 17 May 2022 15:13:53 +0000
Received: by outflank-mailman (input) for mailman id 331048;
 Tue, 17 May 2022 15:13:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nqytU-0000fy-BQ
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 15:13:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4ac4720-d5f3-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 17:13:50 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-jINpRsnqMF2RmHCjKjHhmw-2; Tue, 17 May 2022 17:13:47 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7548.eurprd04.prod.outlook.com (2603:10a6:10:20c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 15:13:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 15:13:46 +0000
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
X-Inumbo-ID: f4ac4720-d5f3-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652800430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3SRD3vVzy5DO0x/6e29KtE9hHSxC9escK5bpjTqaaL4=;
	b=R3E+WYNzCfdaBqEJDvQs2ss1KQ4HYF147IX4pufF5y8PjMSf4VoWn3JooubFJyDZ8KW/KD
	HnkQtamn8EOTqobccbn8NjQWwOyM6XPXpPIgx2re9SMOfGessDWLBhqOGDeMI96OESIah5
	2FnJlpVe4WdrBwRF8GaA7DEEKgP40JY=
X-MC-Unique: jINpRsnqMF2RmHCjKjHhmw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VebXLeGJNDDajadR3QjmJib3Daa+ay3U1PwMj+mttzKrqf44Gd7gh+UevvbEXClbasrdYsyCeyOYC5G2mHjaL0tKRpWb2NLct1k/hVDzcj44sfE1jKr+n/q0EMNecYyeGTx4bFIwejGZI6vD9dq+vSWAquAi0jeSAI1T6Xhq2DylLZp0LqRsUrVyT9q+I21iSE2UPdcWzEqqPr4gD5SvQ/nultgWvCKLEb6YMb7/axg8WPMQOvu5LcFsZOFz6kct08FbPBV1J8zZ4dBIMo5heWR4OsALlMCxOLbvN3BF/ntIyPq4lFh0rAbwI9lQ1LFRrtDz8Aja+hJwzCyAd5D8fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/LPmWU8cNPJ02nq5CuvfOIZKx5d6armEq33dNkYfaM=;
 b=isIZyR139l1aPVe7XnAuW8CF5AAi7H9FqVP5xr4jxVUmnAkhVyP7TJ1x8ZfT7TUvib+JadT4KeLPcP3BQdzVvqco1IQU/FX9NbdZwExoBxzj/UIFhRaOv53yUcZy1mUpgyWWH++07UYCHLwehfG3Yj7BxtNzsoLZwNbPED5tYLLFzwg+SfRUyX/J8FMM2l2aGLMxC8Nlz83Hgr+xD7Cmtd8Sg70FwXF3hSJzOPFCMNhOE5M8kbcGZnTZ1FOjGEyoGi7mLZZ7M8oKIUqgc44AKeWqJvSOQ0fN7nDuMw4I3G5HZT2uzV9Sea9mpfKxTxuQPWaD4L7JsNo/tTkeRosLPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9ad924ae-1a40-6ac4-55ec-a468dadf5dcf@suse.com>
Date: Tue, 17 May 2022 17:13:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 1/2] ns16550: use poll mode if INTERRUPT_LINE is 0xff
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220511143059.1826794-1-marmarek@invisiblethingslab.com>
 <c8f95032-1417-adfe-3170-62b39ec0f6ca@suse.com>
 <YoO1wt6Wq1+XOXsK@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YoO1wt6Wq1+XOXsK@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0022.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec1d2062-029a-4c3c-8e6a-08da3817d694
X-MS-TrafficTypeDiagnostic: DBBPR04MB7548:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB754856227106154A4FF9E70FB3CE9@DBBPR04MB7548.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HzDIM7P9wyOMW1bW6plkQjn11W/w6plUdxOoMofjWh7KmHW2tfTeYnXx1ScvJBaTelKXRKuYL7Oh2C3AdDi3N6GpMudL7sR0nWkLQVtDIy6IrlWYpecplz0mbqCj9pZ5zJXYiGgcajgW/lZtSjBxR5/HeIuxf+doTP3MVyGQp7unaMNwLW8ZNnEDZCdvcE+/l0SVmqlh7/rbYgHCUqV4/0iz/frjdEsEs4/jF0UThBzDWg2iQGUN1UJJ/RMaL5Q2jEGoOLQVK3lfOm62XFd4/zKLfDJv8KOiinH+ODDVynVvcjYAC02oO5egofDX/pWFII1obn/6NXnUE7AgXcU+MdwOjY2KLs79P5z8xQ9IKiy4ZWz4LdEZ2uKxqthy5Nc3n8uKTOTjbWtQEPyBP8av2e+MG9AZ6iANoo3j7pDg1Llsfx9De+tL2GGUJukpIqx02X3J0Ak/I9blzrZLRWyCyoa/IQlXV9aZKcf3ICZesX8RHZ5jJ10MeFsPYDKXNWT/j1WzKzQR2Czk6LQg8hH4N0fuPLv27NpvzcA67z5qOVDDdXLNkcWlckvah7QIcJRHWzpvcNbILSFuIW/HjaTTIBNpmKPoYQoiGClyKlS0l25KspW7laayyWo3oofvu4K9D4zDNEpcccYSaJ0OY7L9rvTGSA4f3jh5o+7ZvZeMXUdeDNGOqBiCy3xur/fAqqTNs6iGD73QBNY6BQnMHYvTRL0wT5ElqE34pYiqc7FQQ2o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(8936002)(26005)(2616005)(8676002)(86362001)(5660300002)(54906003)(38100700002)(316002)(31696002)(66476007)(4326008)(508600001)(53546011)(6916009)(2906002)(36756003)(6486002)(6506007)(31686004)(66556008)(83380400001)(66946007)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0T57d/BupXTzU1dMH+bWO9Ii9lCEGAtkFd2FvcQVG2ZD/j3VGEjbUE6ZTio1?=
 =?us-ascii?Q?/4/yieGNu06wdfl21mpZRLT7PhmGx7zLeKZ3GnrFGKSEW46KDQlUYkH/Eei2?=
 =?us-ascii?Q?wYdbS34AYgWhgQMhKjSTM0byAOGaKdMo/jTlPTzS9fIcT3BNmbmkCQ7ceoGq?=
 =?us-ascii?Q?tJXFx+ND6AXIS0t+JHLkJbVRAuqhuPnGLj3CFNzCJwvuyipUG5PgumClGpyk?=
 =?us-ascii?Q?OQ8qtveSy13sUC73qJ5KUCFsAbwYauD57aTG5ypTqBo3ymgIh77UlAlEa/iJ?=
 =?us-ascii?Q?p2VTwmnnyk/VgjtouEChbw5EfHsiyP2ynGtnDyhZG0eOBdBkCx1zn2W+tX0P?=
 =?us-ascii?Q?oFLSf/dWbnftMOWo4HTya3X8C+04uVymJOa/4kPpe6WYDVszbxsLxA3kfarm?=
 =?us-ascii?Q?b91AVtx7z/mPfxnL/HBZWaWTzT38IQs3pZuQXUuYQzOpMQqyZPolR0nvPdqQ?=
 =?us-ascii?Q?98oU7amvjgmkV4f/XrOY2m4U9wWyoQT5d0XeMbj2nnSlX9W/L4qiYky9VOUt?=
 =?us-ascii?Q?e6yq2nNErqyyL9CkM5bOwuXa9MIMMzepJ0b0OiciF7Q9cF16D53bxo8DH04d?=
 =?us-ascii?Q?plXA3e2C9qYNc7ijIKamjJNcsIzziSIImvPIx4PNSVHhVLzEb3Sg03mrKZfw?=
 =?us-ascii?Q?CKNLZTkU2jz+VlYRq9iA2FbkWPC0DtjSl3A/fol76g6mm+X9wIm/YkItFnjN?=
 =?us-ascii?Q?BgpPziCdxetANOPNCJbfV3WWxUqhJ46N0YlKuyRIPlhQ56GwvL1IGWia4xwp?=
 =?us-ascii?Q?31JSG24UVgW0BmX8q50Lt85bhQ9iEwCTLAcdXQRCkRfcFENvG1LlLA9YyiY3?=
 =?us-ascii?Q?Ai8cAZsmJy1hEowA7vmmyDKgJvZ+G8zHdr+5CRwrV5oEvDPTXoJjq05REOqX?=
 =?us-ascii?Q?+VLH+pVn2MuQNyH/As7EE+B+ILouyxoFHCyic4zngiEoOC0wIVDFzwLFzLXP?=
 =?us-ascii?Q?BnezuvhrY5QbUNX2HRmPNFAknt5iBaXAv3h5YX7gFAIXcucAya7Uv99AA7jx?=
 =?us-ascii?Q?GQMnlgBOTDiIHEkNJVh/M8w6ObdIqbgf7NonjU1DtOaKx/6Pn9SBuJTTJxNq?=
 =?us-ascii?Q?QqZix/Aob0Dko8Mnu9Gsm/yo9AfC+n42f0d7wPWBXuYn7uza8+JymhUFf+1J?=
 =?us-ascii?Q?IUeCP+AVEL/xfKU91/TKHpODaUm/knrdzqCeAGCapyCiwgw5XYoqf/SNOb4t?=
 =?us-ascii?Q?Xl7dw6D5yA3ufdPOuksDPfdZeWzxAEv/5DaIW4HqEmR594nIyYTTkjWRiTIb?=
 =?us-ascii?Q?uU9k2ZPuUCC1i5BV+fpuo/8kx5Ab20Nl918+sF14WV88O6LOxr4+EdkI+xqU?=
 =?us-ascii?Q?3AprUgeuFLHrWIbgCFNjNiyo5a1GMUDNFANpzjeZo5M4GGd1SLWuY+SnM92n?=
 =?us-ascii?Q?6lk65CaQzaOlxFFpp5AyC1zHgrOP2V3Qwj8tVSEC5cpa4KEnXYpufxT7INO8?=
 =?us-ascii?Q?AMyrwDngbDmbHIDa16nQG6T0zwAYO+qYHB3tLhspNHT/OcDBk4rONMVMAPv9?=
 =?us-ascii?Q?t1kNufaWj17hh9jC3DpdEW1FpNdMkRj24d4T9wJyGe5NONR0gI4G4xb2yTcg?=
 =?us-ascii?Q?ROTKj/ocY2Q8AtuXnSmXFnUJj8eSJASB6DHmsFqMatomPX4hntJ0XMmEPgAz?=
 =?us-ascii?Q?Yb9HoBt2p4wCuTRBNgrDRNoG8wVCwi9fEtwa4GLUVTVYPaXb5PICqnuhvput?=
 =?us-ascii?Q?JSA4uxIHdPSucR3ogvMKqzOwIK0xfVoVNda/lyS7kZYmpCjjgPQlaE0jDcjS?=
 =?us-ascii?Q?KidVZs/66Q=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec1d2062-029a-4c3c-8e6a-08da3817d694
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 15:13:46.3215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ijJ0eVHYUb8QQ88LprZHkC53LajXyZt3QieCQuqT6pTFZJ96WC9zVJksDQIlsx3XAscTS9IWs2GNM+7D57Impg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7548

On 17.05.2022 16:48, Roger Pau Monn=C3=A9 wrote:
> On Tue, May 17, 2022 at 04:41:31PM +0200, Jan Beulich wrote:
>> On 11.05.2022 16:30, Marek Marczykowski-G=C3=B3recki wrote:
>>> --- a/xen/drivers/char/ns16550.c
>>> +++ b/xen/drivers/char/ns16550.c
>>> @@ -1238,6 +1238,13 @@ pci_uart_config(struct ns16550 *uart, bool_t ski=
p_amt, unsigned int idx)
>>>                              pci_conf_read8(PCI_SBDF(0, b, d, f),
>>>                                             PCI_INTERRUPT_LINE) : 0;
>>> =20
>>> +                if ( uart->irq =3D=3D 0xff )
>>> +                    uart->irq =3D 0;
>>> +                if ( !uart->irq )
>>> +                    printk(XENLOG_INFO
>>> +                           "ns16550: %pp no legacy IRQ, using poll mod=
e\n",
>>> +                           &PCI_SBDF(0, b, d, f));
>>> +
>>>                  return 0;
>>>              }
>>>          }
>>
>> While this code is inside a CONFIG_HAS_PCI conditional, I still
>> think - as was previously suggested - that the 1st if() should be
>> inside a CONFIG_X86 conditional, to not leave a trap for other
>> architectures to fall into.
>=20
> The CONFIG_HAS_PCI region is itself inside of a (bigger) CONFIG_X86
> region already.

But that's likely to change sooner or later, I expect. I'd rather see
the surrounding region be shrunk in scope. Already when that
CONFIG_X86 was introduced I had reservations, as I don't think all of
the enclosed code really is x86-specific.

Jan


