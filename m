Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9524B4D4F68
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 17:35:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288489.489193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSLkK-0004ol-4m; Thu, 10 Mar 2022 16:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288489.489193; Thu, 10 Mar 2022 16:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSLkK-0004m9-0K; Thu, 10 Mar 2022 16:34:36 +0000
Received: by outflank-mailman (input) for mailman id 288489;
 Thu, 10 Mar 2022 16:34:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7C/d=TV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nSLkJ-0004m3-7a
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 16:34:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efed7436-a08f-11ec-853a-5f4723681683;
 Thu, 10 Mar 2022 17:34:21 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-hY3GBA27MIecKPM1DJUsCw-1; Thu, 10 Mar 2022 17:34:32 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6319.eurprd04.prod.outlook.com (2603:10a6:803:f5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 10 Mar
 2022 16:34:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 16:34:29 +0000
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
X-Inumbo-ID: efed7436-a08f-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646930073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJS/MJgF93x1eaWkMLEGh3suELLXAYcL0QnFP+NUPIM=;
	b=QNOmhUgKgvh9leSl5PfWQdolrrFckepDBSAbOH7tNoF55DClAUsKWBvlAm5svNGzx9s+wQ
	NasQa/zx0I6o/HDDUgKqgMZMWVV/uW2HLNceMr58vvl+oPXHo0bXOQ3o6gXMdRfFwNYfQM
	qVC+J+uwdd+iqaJysWdZ6/+N4Uzxp+E=
X-MC-Unique: hY3GBA27MIecKPM1DJUsCw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QBVFqcYzk/lIQ6j6vS0s7R770Ln8xhXuPYxIZLVSCNI3XqgWmkcpWGAJtn5+AZcWF+iPRDcrIath/2bNuq3iAm7f8b9qZ2M6mFHNpEdGKFOFp7h1/yWezR8EdOHl+nPvt9QLkUR+XNZ2C+A+NDIBD4A78AqZx6ZH/pGGjTiXfjXVfSC5JU3uGxqKURA7ig/sMgcF+yfD99apcN3Y9TvnaiFpci6Z+mbHWME2VVyKHKAcFlZFVZ1qxR+WfRDnOhrm5sGpVHxpACXI3tDfzLqJOEs2q68PhQRtpbiQ3uw0evLMhaT+17RnFG3nFLb2CE7+JUnLFxuLT4/spuA4lBwwVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGrJ19k4gI1zUU4RQDX9I3LcT3HH+0PXU+ufIXMY058=;
 b=WtGvqFSYsCO1O8bAKV5wYmmfNbfHioFC3TtTGn+0DzYpkjpzG7LzmqSwqHefOYnN6hHEFFTSdjouteGOlaWZiy0u5j9ctoikA626ezRRrC1Bo24YXPQ1k/Lc+slRKDbE+cwzBvZYvPnGO7pYgtuoceT6EaupBL4DCa8HHwLl9Og868P8ehWrvhhNiqgLZCWrslKeOE8yC2xDtjjhVKwwDVnqE35LpfRSoxhrtP8HC3mVPVOsUSDT3d6yVSOj5r0T2/RCfxvJnpNyiWjnuIPX1ufG6vFhgWisvKwcU/cUqv1I2NbPmHAOWGSagdxzV/I1R1neIMrp8XgjtDU5O83kUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <25f3ec22-1dcd-776c-4b74-0be128c6f818@suse.com>
Date: Thu, 10 Mar 2022 17:34:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/2] ns16550: reject IRQ above nr_irqs
Content-Language: en-US
To: Julien Grall <julien@xen.org>
CC: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20220310143403.50944-1-marmarek@invisiblethingslab.com>
 <7acb2915-5a9d-c1f1-4b7b-2bc6c2055ea3@suse.com>
 <YioddbNor6w/U9ed@Air-de-Roger>
 <53361d65-2bd8-c07b-938c-91b95f2d68ad@suse.com>
 <Yiojgxgd4amSjHog@Air-de-Roger>
 <3055b4a5-2d55-9cf1-1069-8c57208bf0af@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3055b4a5-2d55-9cf1-1069-8c57208bf0af@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0057.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a074b022-9cac-458c-16e9-08da02b3d899
X-MS-TrafficTypeDiagnostic: VI1PR04MB6319:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6319405EBA3063326086349BB30B9@VI1PR04MB6319.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vmSD5LWRhHIy5qm1xrOhTXvN3yCGJ5iKhmRtREVeyNT6e+UhXJjYs22KMNPb/9HaYVfLEbIyKVmuH/NcimLz6DT+naqnVqssKU9XWUnsXY2AnlW4WpFfMS9Bgcxl5k12X9bz1hGMcq6jYMyfz87GjwQWpHxtIV0q7IV8CabbR3xkAxgFDawCSAk2J5A4xX5ltshnKlVmLZSHaCYtIBdm+U53jQcN9uvlC6ldVwn8cLg4hH0JOjCN3O3GXDVnpuoEN7kcCrXGuUxWNZCp9ZtwsLgE0rSyx7pR9itlFqj8duu9pAATlDMWl0456tY/sKTCF57SE3l+ALNOQT8HH8aIb9OXQIKtkJUwyOJK6IZZeBFlqxP0e2c+KDHbrOXjaziDnN1HtTRgI/iEOceD9vva3GUsDYn1v6x3nr9Anvg0dmZK4X9BC5nvGKiemBemTbmPHOXEmWhBuD1WfC8YHS2qakd9LfMVcx6SJ4kprKCJifRgIQv9MogusIrE/GuZcV3l9+aP2XE6iMBRlpUzD8ApU0ZXZx85/U20liraMgQqGeL/IOKhCvb5fKTiG4dN0U37u9EqNBZ0VhTn8r+17DU6bkMHUSGeRr0fC6JxNg6K2JEWxz9XZxh+lcDIR5t0hNdLElwYL2N5pd391Drfa2IHo5SRPMdPV++8Im52UAWRVo+CaS6VAWggZhYcwfA2vusOOxM7xeL4STf47GeODAskhddO7NU8rcGM967OTv6x/xSWWcKTCKONpB12rrn7YDEm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(6506007)(53546011)(26005)(2906002)(66946007)(66476007)(66556008)(8676002)(4326008)(6486002)(508600001)(38100700002)(316002)(36756003)(31696002)(54906003)(6916009)(86362001)(31686004)(186003)(2616005)(83380400001)(5660300002)(6666004)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z9GSeCQuDup1cr/nWhh1eNJadK5W9D1IHfI+Ndo1Jc6vIg/E8z5A+N1rhykE?=
 =?us-ascii?Q?t3E/dwujlaOVRTOEXkqhGdqjxT4r6ljDVgKp68j4U+HvuVpRAD13pQDInaF5?=
 =?us-ascii?Q?NmA8XDASiz2Fxsn+ydQiPhlIqkFZsgAtzr7tt9Z3xmPmEOdu99aM5MQi6q7P?=
 =?us-ascii?Q?BYND9TRLZZqnPW7x4R7TeIL4U70mPofXrAB6fOQG7qm5bT+KYXY08Euyd24B?=
 =?us-ascii?Q?GcQS4hIRpMBpPSviMHVrHB11zNlvG4DTX+qKwei/C8WccGUjEoABb6DnCKM8?=
 =?us-ascii?Q?8S+MLHaXzud0DEZGvCLDx939G716nrkwFps/WLN7eiH21P3LQs2yqfWwppAr?=
 =?us-ascii?Q?9ys3KYAse6HhkKQqry6VUi7yGcoB8PNEYoUWWGfk3HhY1kfU3zODXJjZXdoR?=
 =?us-ascii?Q?hMmo7L/LxpnwscF2Nx927isc39r6SG+r7eBEVK8yzPhIXLWS9qEI6Lqp+RSF?=
 =?us-ascii?Q?/X751LQyhZ/aFQHMjaUXf+Rsw8aQqmAu+OdkwJjY6r6oyNJKf5F4JqUpQleM?=
 =?us-ascii?Q?JHLhUbzWBZw0yfNq7J6dBmMDwSGaOvYFcEL6Mw0oBXBUL0f8jSXcOFsLPn+H?=
 =?us-ascii?Q?AYEu4gQG9NN8pJ12ZDlkgLoUwVTf6SN0ADJlXF4bYf//IROHsE1IsXpvf4IB?=
 =?us-ascii?Q?obQvS+j8Px+ccAVedr7tb/2uNOo5zF0gSc0mUOHlx9oElqJOYMpeLcrfbciu?=
 =?us-ascii?Q?eD9uMiX75YM56EcwOhy1maeD28z4MoV89v5P+9etD/s9EyFubailgK7ba4JT?=
 =?us-ascii?Q?yz/IiWXF9fs1OgdaUXAOPFpB/xDY7nFV2FzXYa/XUWAtZClK6NVsDOLPW9jG?=
 =?us-ascii?Q?68Cre99WwwWM4vp6dj/6BbWvfrXjniUl1SdBXhmbFW356NF4pV2D22rSwbCV?=
 =?us-ascii?Q?F+/NnIEvN//0qU6NCGF8PwF2w8hXSqlwq4cbcZ3t3WKJK/EZW+pJS43zshiS?=
 =?us-ascii?Q?BKznNCxg3WITiY2Vl8KuYVkiU6MdCNTlDY4iIf3KQ1Cw2h5Z/feLs5RX8MuT?=
 =?us-ascii?Q?/Hc8gmvnOgV7mPcKtIt4jE5ZNwdWYg+VPiHcEHOEkhQ5Nsd2A4ecuQPnWll9?=
 =?us-ascii?Q?y+Qb3VBFHes09pgyQ+B7+Ic1vaU+spHExTcY1ObYIzfNmGz5sBFuTXn9/wzD?=
 =?us-ascii?Q?KzGmFzcgpCOm+c5QDZBRPrat4RkkTW4xSii7Dw2URGWyfz3vFVLE3bLflsy2?=
 =?us-ascii?Q?6wYNBp8vMp/85adR5K39QkCQL4LDdHqjpbUtavw8ofPPfD7QP6kUMU2EVnk+?=
 =?us-ascii?Q?vy2Xt6LzbYwxTwG53eNBZTQdWx6Ze5cznUZJtgKwrvfHHkHmkf/b6V2iDti9?=
 =?us-ascii?Q?hVXUexbIZK+nR2se6nHUQFLhoeGqDwBsZuHZMgHT9HCeK3HDoJU0HwbL8YuT?=
 =?us-ascii?Q?20+GFFI6hDKVoS2o6mO8BY+ybHTOETvVldAfHtmrXgch6ZC0l2of4U3k8w0y?=
 =?us-ascii?Q?ReI5hcZpnZSZtciNriXUew7tZCuYMQvF26NcsbMJjGsYN9q8MEpDbQuTEEnj?=
 =?us-ascii?Q?wZ9ZutTzOjfQwYgy17rbIxCOh08hcJLZwOHXbeE1Ds0dAqc63J0FKDVgjjeH?=
 =?us-ascii?Q?C7kkOTcpIYz10d/liJkcMHK5jx36O0IHWV8zQV/wWMA6PYlPaIUG4Qg8UXQG?=
 =?us-ascii?Q?hCharZjvSK0TgAMHfRDDllE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a074b022-9cac-458c-16e9-08da02b3d899
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 16:34:28.8440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCodNq53bLCR7fjxv0w3CyXKWRUM8Qt5gmfFsKwouB9mgXahpyKjAk6nvB8KUaApdQnvhsRCOwAn8oIkP2xvVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6319

On 10.03.2022 17:21, Julien Grall wrote:
> On 10/03/2022 16:12, Roger Pau Monn=C3=A9 wrote:
>> On Thu, Mar 10, 2022 at 05:08:07PM +0100, Jan Beulich wrote:
>>> On 10.03.2022 16:47, Roger Pau Monn=C3=A9 wrote:
>>>> On Thu, Mar 10, 2022 at 04:23:00PM +0100, Jan Beulich wrote:
>>>>> On 10.03.2022 15:34, Marek Marczykowski-G=C3=B3recki wrote:
>>>>>> --- a/xen/drivers/char/ns16550.c
>>>>>> +++ b/xen/drivers/char/ns16550.c
>>>>>> @@ -1221,6 +1221,9 @@ pci_uart_config(struct ns16550 *uart, bool_t s=
kip_amt, unsigned int idx)
>>>>>>                               pci_conf_read8(PCI_SBDF(0, b, d, f),
>>>>>>                                              PCI_INTERRUPT_LINE) : 0=
;
>>>>>>  =20
>>>>>> +                if (uart->irq >=3D nr_irqs)
>>>>>> +                    uart->irq =3D 0;
>>>>>
>>>>> Don't you mean nr_irqs_gsi here? Also (nit) please add the missing bl=
anks
>>>>> immediately inside the parentheses.
>>>>
>>>> If we use nr_irqs_gsi we will need to make the check x86 only AFAICT.
>>>
>>> Down the road (when Arm wants to select HAS_PCI) - yes. Not necessarily
>>> right away. After all Arm wants to have an equivalent check here then,
>>> not merely checking against nr_irqs instead. So putting a conditional
>>> here right away would hide the need for putting in place an Arm-specifi=
c
>>> alternative.
>>
>> Oh, I always forget Arm doesn't have CONFIG_HAS_PCI enabled just yet.
> The PCI code in ns16550.c is gated by CONFIG_HAS_PCI and CONFIG_X86. I=20
> am not sure we will ever see a support for PCI UART card in Xen on Arm.
>=20
> However, if it evers happens then neither nr_irqs or nr_irqs_gsi would=20
> help here because from the interrupt controller PoV 0xff may be a valid=20
> (GICv2 supports up to 1024 interrupts).
>=20
> Is there any reason we can't explicitely check 0xff?

FF isn't called out by the spec as having a special meaning. Unlike I
think Andrew did say somewhere, FF does not indicate "none". That's
instead indicated by PIN returning zero. That's my reading of the spec,
at least.

Jan


