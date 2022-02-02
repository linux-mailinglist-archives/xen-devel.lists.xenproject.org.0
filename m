Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E924A7198
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 14:32:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264192.457200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFFkK-00048e-4i; Wed, 02 Feb 2022 13:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264192.457200; Wed, 02 Feb 2022 13:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFFkK-00045n-1V; Wed, 02 Feb 2022 13:32:28 +0000
Received: by outflank-mailman (input) for mailman id 264192;
 Wed, 02 Feb 2022 13:32:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6WyI=SR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFFkI-00045h-Ut
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 13:32:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d9c193b-842c-11ec-8f75-fffcc8bd4f1a;
 Wed, 02 Feb 2022 14:32:23 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2058.outbound.protection.outlook.com [104.47.4.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-CBMyLV-vMNaNiXAOwk0sjg-1; Wed, 02 Feb 2022 14:32:24 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5648.eurprd04.prod.outlook.com (2603:10a6:803:e5::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 13:32:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 13:32:21 +0000
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
X-Inumbo-ID: 8d9c193b-842c-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643808745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6dZFPXHzyV1w5nw7aX4Rx3VsQwiM3dzoSMzPJww+Z3U=;
	b=nFALlBoD7cUWJ45CFpCl/GZhS8uzu+vxWtgbL2h9H5nkmIFxIHIR75bLP5ON9y720vdOB0
	nwHzQBu5VyQFTLzDSlZPnru3TkQojkqjZsRFIggyLJp+pKvemzveAdH4gLLQaAUf8pYPD9
	fxB5iFS1JJaSHSprjgi1RP+zPf2M8xk=
X-MC-Unique: CBMyLV-vMNaNiXAOwk0sjg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CYpXwL4i077OTTN48dOEvD65TjE3mmgJQXdC+ioniYAAJJTJ72zi8M92qhp/YPawFTgUJCCMP9vfNN4N3rZQrvzUHRAcokdhdwsR+BFjhSwM+N2ndnj/YbQklpLF/65vRSXi+HK2eSWRe2ExIkbPL87wMKvYbsVl14SF81xhqCL/SnvQCIL/jBnwirnMPgw2IuVKdW1l8mFLLhNr7+2qgATaU72b99DHrIfgvGoUeFCfmkF9lS/nBE5h1QTSJWBWjpCaXSpQ+w8+pOPP7Qm49v60KrU/IRsZKTucxV12IU4N8i+d6/VqZd+AiPuJyCtTCo2u4JBZnTwg1AHS0/Rgug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZVvidwyhH4G2wqsKLBS1yy9f/2iV7LGiUjXMLEWH/4=;
 b=Klg8xVpJSEAZsN85JEK+oIkEqmpKgbnqiw6c5obiVakOnuLNEmm/q6XMLiuXpBxOcEe5vdTSQ/uQ/S6udCtiQf1tu0c9KwS3j6I3IGPXodM79Is33KWkm8Q7eDJ5H+fELkbtewsC6OZaJ7dP8hjxHtjaVUZ6aMxTDJswtTnFsML7cg+5CBh2j6rjRGp+neTi9f52nG29utJ01qk9+hOLom+MqivGsyy+nz/rJQQsLRzGG708aEufWAjrj7c5AY2iBf0IH4ZeEAKjV53lxw3XsSxOy5ripKoMBnyL1CSMNWuS/wb7X2kJ5NHYh4CAKVBYlw4Oz4efJT3saAz3rV4yqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d527740a-4d90-4155-13dc-5888e8acfa72@suse.com>
Date: Wed, 2 Feb 2022 14:32:18 +0100
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6a31eb29-81b6-7553-897f-2e5e54bab9b8@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR05CA0011.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1140030d-51ce-4a1e-3090-08d9e650709c
X-MS-TrafficTypeDiagnostic: VI1PR04MB5648:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB56489A7D05A80A0D189F7992B3279@VI1PR04MB5648.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pd4jn5qAnc74KMbTstGDlblJ8+fD32QwO8mwXHLUrqxyhiQbHBYBHkhFHOhpzYmOcMvbvOrrIxGw5J5PhNtk0x/T+33o2rAQcMKN54P19tjGg/KXksBOaBCf1lbZnceIU9W9Nou4f641NE/fqqRZd0ogxDIA+UaeibfwCcbd1steqywKq+icy/vMJ27nHAOU5lLJRBgFc+YqXfASv8VE76Vei4J0oLJVQ8GLnyLL5faLCPexokFFt/FSLJ2UI3NzayCKD9GVrrehx5cQ7wgtcQ/oWTHk6u5xUcLXbVQ9DwLqdrSOFoROSyech7CUD31YiwkAaG+Qm/4//YUx918/ozODkg0eu4F3bnKwIECMHg15OqOBVp1M0NnRXGJxINf4EoWfSo/jUSWlWcDU2VojokHWDGr9SjsbPHfgRHtvR8UpNEgCCRhwlUfQRZKRI1GgK+7fn8Tp42hRD/NhbTVbTpjqrIxsNBWNb+7nhU17hxI4RJGzFzcgAs0+GoDQqPtuaD/vXqglW0O4a8l/Yae5nbvlJHEMNDvNHMNwiNSsGIJrkilZiouIxKg/uS0hP63a5D5fYNZY7z3QlgwJ7pQ9l1PyBjusnEFcDgfsS48KsJusuXGvpGbxc1zmXnUfR0UniSEK70AekdLwjqT+3/U5TwnPNhTJicuNlCSTLV+aeL7Pizc1jI47lPvq7U+XBeNI7Lv6uUDciB5C/jaiVzfkD9oERXOiqLBYi2se9z2E6fkNTbZDYD8ypYqbqmQDNoWi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(38100700002)(54906003)(8936002)(8676002)(66946007)(66556008)(7416002)(66476007)(6506007)(53546011)(508600001)(6512007)(6666004)(6486002)(6916009)(316002)(31696002)(86362001)(26005)(186003)(2616005)(4326008)(31686004)(36756003)(5660300002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6lRAhK3e64In4RlddyMS8v/A/dA5PeMolBX/Ao+fnC5Snlu34W0RGyuS0OSH?=
 =?us-ascii?Q?uORuTP/b51rY5KBDAC1USIY4PjMa4IEFl464MZ1MN02XmWSiZUxgqaAIWMvT?=
 =?us-ascii?Q?bvBzvHrgCeDKhsQFbs3O6QJnqHWg/BAkoeuhvrRpuqZPA9L9uS0yaLVc3l7t?=
 =?us-ascii?Q?73aOfXtps2y1p6JOR4M3RrqdYqx4lrKFMgDOw4gDtxNe9rOzx3UADREE0ZEk?=
 =?us-ascii?Q?IRvB+xtbisXmqZD4/dyMVsAZESK3jvV3VWwleYA1woruNPtymVxlRPhWpx1S?=
 =?us-ascii?Q?PdITuZXDDmDJPgQeLScS7kGs3m2yRu6ROh8ES7tOWfRObBTS5JXMZsTlUVeq?=
 =?us-ascii?Q?Ois6G7Pn17FGDFnqtOG7sQeSVnEhH8N00XxAqKZy/edaYRuj98UtaZ0qG/nv?=
 =?us-ascii?Q?/0mA4IA68uWS6ToGdeSZcXPVCIH4sn2a3FUs7eNlGbp9hLB4Jz6bkAYUp5ZV?=
 =?us-ascii?Q?yr5ohMCp3Ynw7a5i3Oz8val6rPkK1p/Fuypa/QitTryVZBEDPvrDiMFmMvRY?=
 =?us-ascii?Q?YCkjIC2gpjC4IHnSErXA4Q78qq1z2rUOQ/+SzMvIUKfefvWBvas8O9++8Jit?=
 =?us-ascii?Q?WBu7sexJohi0t6N4yGhYas64XdhHrrhc9R/1AWuuFZ8VJx/EXzgWK+V4IA1j?=
 =?us-ascii?Q?Qfn9SvXi4AyTngdETDPviOG4nfM05/dds+ENJAdhQwBDn6K2wpH4JiPuH8Da?=
 =?us-ascii?Q?ZOJQjKV3EUZEWKJSVrQCMjWOSLhBXVQZA7s1AMT8JKXurw+pESieNeQTyl3q?=
 =?us-ascii?Q?UgmYExVMZ1DT3tPewy0Qultvmtu6LbCyj8XoHlNEeuUYcBLcYa+q7o41E3tw?=
 =?us-ascii?Q?VQm2h15PPunyzblozIICugiaSre+H9DQ47Q1NksYTEj4OPptO6y9Wh1EhivK?=
 =?us-ascii?Q?YkEjGa1x6K4HSEhgYIUzzoLXml3ccsgfnzdeEgt2rrbZ/nim2aZBtAg5+fs7?=
 =?us-ascii?Q?3B69Qryktr4casFN9ErEdVPeVPVy6AEJYPUnd4HxV2RxgdvpEmUnP4Rj+viv?=
 =?us-ascii?Q?rSRTbLKilveJH0qjlXJPT2N9mNk3TyfZfZ8PYxg2mD2J1k4iOwvASaDxPaH4?=
 =?us-ascii?Q?jHagaZ4kDDMQiE6NYNzH8UvdW0Dsyq1kC81aXorUTLJ61z+7kDia+7ZJSHVx?=
 =?us-ascii?Q?2XZCVXlnw8gOwXzJk40OT/wIrGA/PaNg34XU3FHLhi2MOPxFIOiAcNYzbrvk?=
 =?us-ascii?Q?xLOrCZFCDEI8Jdf0gxZbIZwryt9gEr23Fi5HqiJQRNdxjYVISVwBJ+PXvSPA?=
 =?us-ascii?Q?42fry1S32MIBkrVsdAIFpscsNQEU4pPhRqovNj71laIetKRklM/mUqoU3Efb?=
 =?us-ascii?Q?JMABGVpRaGmQOpN9jYKdhbxpG2oiw0qAxcZAjhRwEYfhuV/L4i/W/MyuIJ7+?=
 =?us-ascii?Q?hBU66STtG29ycomWxkTEsJVrZ2TRpzDTTlfYSkibnGN7e1VOjaeGmbVJGND0?=
 =?us-ascii?Q?aI48odRuOofR+Pc/xhrUtPr4apCEGtx9loCNdtUBduNz+ReCoGlO6C/P5TCP?=
 =?us-ascii?Q?A2ahmPv9uG+OZQJDQ+xQ0zT8Cp17E2eaxkr+cT9JL1MnxjHMClK/n2bxavoL?=
 =?us-ascii?Q?zxJric5E2GaY1tdCrxZcqxSTPdvv34F2EquQbcSjMATtGW0PoacjuqWbqE1n?=
 =?us-ascii?Q?zcsXwruacoGqOoQqPHfa8to=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1140030d-51ce-4a1e-3090-08d9e650709c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 13:32:21.2567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w8nPJLF8tmGpmc/yX1PVd7VP50ntV9BGFz1loFcBO30M5UfXaAm6b102hx+j8O4F+fU9dysqwuWmc6vgRVvicA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5648

On 02.02.2022 13:49, Oleksandr Andrushchenko wrote:
> On 13.01.22 12:50, Roger Pau Monn=C3=A9 wrote:
>> On Thu, Nov 25, 2021 at 01:02:46PM +0200, Oleksandr Andrushchenko wrote:
>>> --- a/xen/drivers/vpci/header.c
>>> +++ b/xen/drivers/vpci/header.c
>>> @@ -491,6 +491,22 @@ static void cmd_write(const struct pci_dev *pdev, =
unsigned int reg,
>>>           pci_conf_write16(pdev->sbdf, reg, cmd);
>>>   }
>>>  =20
>>> +static void guest_cmd_write(const struct pci_dev *pdev, unsigned int r=
eg,
>>> +                            uint32_t cmd, void *data)
>>> +{
>>> +    /* TODO: Add proper emulation for all bits of the command register=
. */
>>> +
>>> +#ifdef CONFIG_HAS_PCI_MSI
>>> +    if ( pdev->vpci->msi->enabled )
>> You need to check for MSI-X also, pdev->vpci->msix->enabled.
> Indeed, thank you
>>
>>> +    {
>>> +        /* Guest wants to enable INTx. It can't be enabled if MSI/MSI-=
X enabled. */
>>> +        cmd |=3D PCI_COMMAND_INTX_DISABLE;
>> You will also need to make sure PCI_COMMAND_INTX_DISABLE is set in the
>> command register when attempting to enable MSI or MSIX capabilities.
> Isn't it enough that we just check above if MSI/MSI-X enabled then make
> sure INTX disabled? I am not following you here on what else needs to
> be done.

No, you need to deal with the potentially bad combination on both
paths - command register writes (here) and MSI/MSI-X control register
writes (which is what Roger points you at). I would like to suggest
to consider simply forcing INTX_DISABLE on behind the guest's back
for those other two paths.

Jan


