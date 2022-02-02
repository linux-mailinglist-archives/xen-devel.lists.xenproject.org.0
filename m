Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 629A84A7328
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 15:32:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264255.457288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFGfY-0005q7-QJ; Wed, 02 Feb 2022 14:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264255.457288; Wed, 02 Feb 2022 14:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFGfY-0005nb-Mi; Wed, 02 Feb 2022 14:31:36 +0000
Received: by outflank-mailman (input) for mailman id 264255;
 Wed, 02 Feb 2022 14:31:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6WyI=SR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFGfX-0005nV-3d
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 14:31:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1e95166-8434-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 15:31:33 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-sLycvX0FOeyQGLAszdIdzA-1; Wed, 02 Feb 2022 15:31:32 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB4953.eurprd04.prod.outlook.com (2603:10a6:10:13::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 14:31:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 14:31:30 +0000
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
X-Inumbo-ID: d1e95166-8434-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643812293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dla6MFIwFsSOaafl0EwGcx9ODvGl+MP2ItxZYXhsbUQ=;
	b=OfALM8p6gW4iFaptApZf+yh+3IQAuYKPAtizLIyH63U4MGFv9tdIMBngclGN5vG2UVL8j8
	P9CxhFEUS7zHgBREsGpPfk+ofdYB4bRPlkaHL4CibxC5NxjpsvYh+ReIz28/DtZytdNM8B
	ugMMoQaPNynu3eAGUH2ndoqqlwl+P+I=
X-MC-Unique: sLycvX0FOeyQGLAszdIdzA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fv8rGW/FLy/r9KUhPGMZLw0tET0xYSw9t2TKX3kxeEGfOsJdx9nHhIJVCxrNrJYxJsVtMou6DX5jokx1hTDFE6+tThWQ7sU6oKXNWvmluMUaxxyV76WCjyhWRc6fcov40RAS7AYyDKRxAfOJNl3xTlFAO/PTm9ViCjIp870MS5LKLQv89p/A9ZprCcaWQ+XycIFGT6dnQzFrh70+wOpMrj3Oxtkd+1ITjiZb7u+EDbccYdxNkHQdrLvUgG8fUhO3fZNrpGEYqZ48V7SJKrxhDsXHvDplAu6TSvR+DvJkm1NJMn3z5zRzuJOR0kx6ZFiubnQ88Ns/yvr2YKnOkOTp/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ti1bMBx7a2i/zNYmFa1dzLTaNNOtGLdK5K0f87OaDxk=;
 b=Gi1lDzah3132ZeLXxeCJDFigiOfpZbMFtfPLvKiZuSc1Y+uKrZ4uu9unflY3QKOeEqPbI7Irhy0M4UZGuozLIAcLY04LOgAz6P7HuW+KmrMTWXvwJW0aZdntqDfbZto+CD302vV6WKhL/8qMKZe8e/swxcTGKKVHN4VBwJYbGhVHqUmvd8tr8mL6zo+oTt6LaBRBHpPbwNNZEYsefxyLLvrpgtYEbDp6CBcF278h2bwzkCyKbsAY05RtyJiXiFOGD2fosvTURBfJX+7T6Wfl0hWnNjUx3QtbtG24wDUXEfujFk/hYHHRytnwFy90wmRwuxYMgS+6jbuYVDWbobtfJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f93d4d54-a2ac-67c0-8a04-d8321b0828e5@suse.com>
Date: Wed, 2 Feb 2022 15:31:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 09/14] vpci/header: emulate PCI_COMMAND register for
 guests
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
 <20211125110251.2877218-10-andr2000@gmail.com>
 <YeAD9PH9o65o+M+w@Air-de-Roger>
 <6a31eb29-81b6-7553-897f-2e5e54bab9b8@epam.com>
 <d527740a-4d90-4155-13dc-5888e8acfa72@suse.com>
 <b9661d86-f084-9ad1-59d5-538113000393@epam.com>
 <ab68568c-461e-bef5-4218-07db8e837bcc@suse.com>
 <37313b25-ccbe-fbfd-8306-7a96ce83c818@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <37313b25-ccbe-fbfd-8306-7a96ce83c818@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0010.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4658e11a-d2ee-41e7-5495-08d9e658b406
X-MS-TrafficTypeDiagnostic: DB7PR04MB4953:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB4953C0844B29953D3EEE064AB3279@DB7PR04MB4953.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/09zYTIpWUKqMXISZy7bizSAFRXS7Jw4D2XUYC2/S94JK7EW3QwxsqatAI7h3j+zc8vtoFnnpHaJH5yo/0SnuDru0dxOr0t9MkjgqrSyCsKPaMgzjboy2nXUqMTjn07/N9itAJ8vx/6ILLNgGKrDT6UtOj2L6cXzQJROxHQ5PGVwApBwYwOnm6tBtzNlJq3S75puQGrgsTODXxQpfp7RV7vlcG6GOumguBmx3pu8D/KUY9jpubejr50SEPyEmR07btIorOvsW2akh3Jh2nyqz58LSF5VD9oqmNea1YqEMouB4S+J4uwHnOWHzTfDokGbcaoWy08k6BOc7VkMxKJmelTHah2FZBXTnyuTFZAT1A965n0YT0jrT0imFOZPB+jSJrQcLxR9WLnZpdT/jDThQfuFUCyote3c/GNcnCdBywhNpwgDNEC0ntRKu5tFqdfsYeg8/FGBe+SVpTAxFopbGyTf3VNLWA7iXtEb9MbKreisCCSH3eC63rJqupRNJafsrfCKHPOA41R/j1rGfC2Z2oThKmJ/4HmeddpBG7gEu8lStJtlgrUdQDtMkbLbFokhEsciaShl5oDg0Le2Ldtv20rBY28FA7rJblwYvlv2/8UBHQabPu1lmEi2q8i6hgiV6X++Y8cL6qT60AaAUhh+tZm+sgdcd7H//1zY19JREYzQilkYpHbl8HRb5a8oVtFzD5VL8cL2rTPsSWcQ+CDeNSKD8I2e7FqqyztEQ719xOE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(54906003)(31696002)(6916009)(4326008)(508600001)(86362001)(6666004)(6486002)(53546011)(6512007)(6506007)(38100700002)(8936002)(2616005)(66946007)(66556008)(66476007)(316002)(83380400001)(36756003)(26005)(186003)(31686004)(7416002)(5660300002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IWT/vqv/F+s60K4TvB1EIBD/09mSRLb4ekdpwH0GuB4jmx7VsF2IqN7oqrMF?=
 =?us-ascii?Q?/EoUm13VhoGuAXs5MnPrwZUa143iT78rGT1jl9SWKj8dQb2K42LR5H0zb0CT?=
 =?us-ascii?Q?BDFuEtjlQxmXetEk4Euns0U8sAsi8B5ykKSyEvRqrzoc70ZvQisLlKD762Je?=
 =?us-ascii?Q?2YJ+twj4AJdOARkXrZRrvo0asIc9DqMc5B4sUWC6rMV8/egt1eVgBshf7ae4?=
 =?us-ascii?Q?8AGATEhoFu8ZBkloZMSA73HYufG3V5CTOiWvShbhLFxXAuFTHAJgzKtWgpHu?=
 =?us-ascii?Q?uJYhEvd3govwkxIcP61WMmTOqO2ZGujXQZ97AqYwUnaJycM+urEtEqEZIDau?=
 =?us-ascii?Q?S4TDT551hlBJhJSpTkoABRh98okHdxXMhqITDmyBrvs1WMYyuaeCh3QvrDCl?=
 =?us-ascii?Q?iP9bS3q8doyDwyL0m19NTKWTZxS0qkaRkJjEyhAOX7+Wd5YlQSvAajo6V/jp?=
 =?us-ascii?Q?wdJrHb6dhDj53y6bFz49h6XE5IUepKByLVft89jJGFynKfnSjJI2ZyIK8Xbm?=
 =?us-ascii?Q?VS/0UYcPolEOM7MJItl1wIKfS4IoQ3YWFL3sTGRbz/Qg7whIZVBDfhq97IcN?=
 =?us-ascii?Q?1FZp8NBmMd0pVg9U5DMZtFDhPlPxjH+FzECYcC1JHam4yx1ayT4NU0huN1Fm?=
 =?us-ascii?Q?5Dz+/U6wvm70qJ+4Tkg4rPHiVw7gPJcpw9lHHemEGwyL6q2zgnUlt9wvv1MC?=
 =?us-ascii?Q?Dj6Hwq1+rWCJt3Gn5RlKhbfF4vM78RGxkqHxqLeivQiOvbZp1/yb4n8zWFya?=
 =?us-ascii?Q?Lre1A9VZ3JRpSiCpH/8kSV5ztK/anIRqnm3BAJao5jNU5BCK4G2OHKNaX7Ng?=
 =?us-ascii?Q?x6t+O6ILPp/JyQoODfbhOw17oofWkB757YpSXFNWGHiOGcLHayZJRFcTwa6l?=
 =?us-ascii?Q?SQ0trgBnehTVlUjRlNHOhRW010l4w0IGzh3K1KetF31q94mFD0Gz3Da+ERkn?=
 =?us-ascii?Q?3hq5WrZ5aGr2hQjm7fgHv2KE/WSpyyeBO3fACu4HkTXJO/0LEtE29ArQHmmK?=
 =?us-ascii?Q?wRQioEwZXlHL8Rumsv9TpQN4ulwxPxIYEDfsHsjMBtyGWSJmLQAchIEaZHY7?=
 =?us-ascii?Q?dkUkEiTl86w+fA10PFsdsD/Yh6jRLKkySJiB43WjY2t/fM593dyLFsn2M39Z?=
 =?us-ascii?Q?nm4ZOb3oFWFDTCsDDRGIMqxxPoEtZy1kmHqWnFa3Ycy6tXhhKzT7Akp6xe0p?=
 =?us-ascii?Q?M8/RHYh3gQC61GMSTOM5u/0j33DZZOCkuMmTZ0ttkcTJ4/VYKUSADpiEXreY?=
 =?us-ascii?Q?4PqSBv1ILWlpWFfCE/D0M/lU9UuwEfFxYt39jddcGVghE4Or7sI951QsJUkV?=
 =?us-ascii?Q?cDLIiidsuEnGoMXVnr43J3ym2tu5a3ytSUUYkTUeZuexIUGJi2cS6c2ssYa5?=
 =?us-ascii?Q?+gQ24kRQPv8Nue+Oz+MlP9J34bU9IqHpVhTa4D0IQDF6RRu9DUjcJuFJN+vz?=
 =?us-ascii?Q?mMdK4Ytp+MpLS/yytIWnvkIstjZ+qccZ2aQmNHD7unsmY5W/SifdxWrW9ZfV?=
 =?us-ascii?Q?DDShYFEYad10n/jJkJgsqHNfyFCWkssT/bYff8bmDZoPo8/MJqKm75H9wNPg?=
 =?us-ascii?Q?qgnbF1CpgbyfwNRsd1M1WyE5T/MYbmtzI1Lu+uHv7oHXwEtALR3qVtc87NlP?=
 =?us-ascii?Q?Ml2qxNXRI5bnnizarxkffgw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4658e11a-d2ee-41e7-5495-08d9e658b406
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 14:31:30.2553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JQ9l79qFPScDACMKogynEaNl7Pxgbuw1dqm4I9vriibEirzyFFUGPJYWCdKW+YFoNKjKgsNI4ONL6CldiQPgvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4953

On 02.02.2022 15:26, Oleksandr Andrushchenko wrote:
>=20
>=20
> On 02.02.22 16:18, Jan Beulich wrote:
>> On 02.02.2022 14:47, Oleksandr Andrushchenko wrote:
>>>> On 02.02.2022 13:49, Oleksandr Andrushchenko wrote:
>>>>> On 13.01.22 12:50, Roger Pau Monn=C3=A9 wrote:
>>>>>> On Thu, Nov 25, 2021 at 01:02:46PM +0200, Oleksandr Andrushchenko wr=
ote:
>>>>>>> --- a/xen/drivers/vpci/header.c
>>>>>>> +++ b/xen/drivers/vpci/header.c
>>>>>>> @@ -491,6 +491,22 @@ static void cmd_write(const struct pci_dev *pd=
ev, unsigned int reg,
>>>>>>>             pci_conf_write16(pdev->sbdf, reg, cmd);
>>>>>>>     }
>>>>>>>    =20
>>>>>>> +static void guest_cmd_write(const struct pci_dev *pdev, unsigned i=
nt reg,
>>>>>>> +                            uint32_t cmd, void *data)
>>>>>>> +{
>>>>>>> +    /* TODO: Add proper emulation for all bits of the command regi=
ster. */
>>>>>>> +
>>>>>>> +#ifdef CONFIG_HAS_PCI_MSI
>>>>>>> +    if ( pdev->vpci->msi->enabled )
>>>>>> You need to check for MSI-X also, pdev->vpci->msix->enabled.
>>>>> Indeed, thank you
>>>>>>> +    {
>>>>>>> +        /* Guest wants to enable INTx. It can't be enabled if MSI/=
MSI-X enabled. */
>>>>>>> +        cmd |=3D PCI_COMMAND_INTX_DISABLE;
>>>>>> You will also need to make sure PCI_COMMAND_INTX_DISABLE is set in t=
he
>>>>>> command register when attempting to enable MSI or MSIX capabilities.
>>>>> Isn't it enough that we just check above if MSI/MSI-X enabled then ma=
ke
>>>>> sure INTX disabled? I am not following you here on what else needs to
>>>>> be done.
>>>> No, you need to deal with the potentially bad combination on both
>>>> paths - command register writes (here) and MSI/MSI-X control register
>>>> writes (which is what Roger points you at). I would like to suggest
>>>> to consider simply forcing INTX_DISABLE on behind the guest's back
>>>> for those other two paths.
>>> Do you suggest that we need to have some code which will
>>> write PCI_COMMAND while we write MSI/MSI-X control register
>>> for that kind of consistency? E.g. control register handler will
>>> need to write to PCI_COMMAND and go through emulation for
>>> guests?
>> Either check or write, yes. Since you're setting the bit here behind
>> the guest's back, setting it on the other paths as well would only
>> look consistent to me.
> I can't find any access to PCI_COMMAND register from vMSI/vMSI-X
> code, so what's the concern?

Again: Only one of INTX, MSI, or MSI-X may be enabled at a time.
This needs to be checked whenever any one of the three is about
to change state. Since failing config space writes isn't really
an option (there's no error code to hand back and raising an
exception is nothing real hardware would do), adjusting state to
be sane behind the back of the guest looks to be the least bad
option.

> This seems to be the only place in vPCI which touches PCI_COMMAND registe=
r.

How is this relevant?

Jan


