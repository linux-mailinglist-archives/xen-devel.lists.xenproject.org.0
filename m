Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F110C442F82
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 14:55:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220242.381432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhuFn-0007Vv-HI; Tue, 02 Nov 2021 13:55:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220242.381432; Tue, 02 Nov 2021 13:55:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhuFn-0007TG-Dm; Tue, 02 Nov 2021 13:55:07 +0000
Received: by outflank-mailman (input) for mailman id 220242;
 Tue, 02 Nov 2021 13:55:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxJb=PV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mhuFl-0007SV-Cn
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 13:55:05 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ae82eb3-10ca-4537-b6bd-a8dbdde05f52;
 Tue, 02 Nov 2021 13:55:03 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-V1-twasoPpWE4qWKV4omEg-1; Tue, 02 Nov 2021 14:55:01 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5743.eurprd04.prod.outlook.com (2603:10a6:803:e0::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Tue, 2 Nov
 2021 13:55:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 13:55:00 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR0202CA0055.eurprd02.prod.outlook.com (2603:10a6:20b:3a::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Tue, 2 Nov 2021 13:54:59 +0000
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
X-Inumbo-ID: 1ae82eb3-10ca-4537-b6bd-a8dbdde05f52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635861302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fNAC5yeHnemRJ3XXQqQRErsukVrcq39kxrhWY27ZKXM=;
	b=REMTLqaMrrVCeyeA56FEpDnhZziVzstk4MpBBftrJaiDTgZiKzAG5ebyMyFGF+/HREGBe5
	sc9EgHAIRfugOHTS/ymyfDm9oOlmwj/3TieQVppRDgVTj2kwN4nq+SJL7wEdDG4G8rucUw
	+bgLKq5TUEwMamINOOTlcZvQAe2jfcw=
X-MC-Unique: V1-twasoPpWE4qWKV4omEg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SUQWbsLbDZoqWAmVwIY003yXBGQhjzidMp1JIaN3VVgT7mtwHvVtE+p1YEKyRjjxz0lNRIkufasWIUwz9QjnQMcGEZSI/kWbYX23/HfHI0u+MMxH0ZxL2JT67xwIDYBbTjg9Js2xbsxkV6CHKxZdBBZuMjkADX+Ru6terU3zfUwsJ5M1Cvpgt87xRCWkisZIsP22Tm20XrbGvuonOSzmFiX0Cf7Z6Mvx99IfnViIX7tzVo01nyo2b5tsuuv8xCqQqN+woAO4GWO3Qs2JyBz6+VorKESEVzdBKsjthtvh01CS5sMIYxoMG1DzUxX4R9yeSdFR1Ir8MWhxszP9M0dwhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDJJXcbOjoNhtlX3l+dZOaDpJsCSpTQRdsvnz7Znqks=;
 b=O1TBVpYfzDU4fq9IJ3yN+G0LBpAVgQTMfZRnV97w++JFX5/XW8Rfs3vbwPWF5v1XVRuh4XnOoeSyjEFEpRPUQThuOuOusFgVTSiU2R1TOxa67I4b9V2a0PQb3TOacXih7GkH2WxUlF5tPqBDUuxHYqsHE3GkeINODgJ3M+tODQdMq1jt9y6RhIcN67I6Ud6KQfFXS15miXpqHHPCILLFu8gjx7t8wZLvO7GkUsXgswJ8AqXlMPpsjmwQLJrJxgy99rDi4t+cNcxT2Qp5oCVF4zS/HIvwHn86cAIJJylncfQ+PPuxxKwiSqwaq1atoq0rxHr12Y+L0kcyiBlwl7KTGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1a19dd35-a649-b155-bdd6-099e08fa3de1@suse.com>
Date: Tue, 2 Nov 2021 14:54:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com,
 Artem_Mygaiev@epam.com, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Michal Orzel <michal.orzel@arm.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-9-andr2000@gmail.com>
 <YXfeB1LWy6Hm81LA@MacBook-Air-de-Roger.local>
 <f1b49f6d-1c2a-97ff-59b3-f0b606857ed3@suse.com>
 <YYEl8h+WtSZwNPn7@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YYEl8h+WtSZwNPn7@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR0202CA0055.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f946cf26-66ca-46b6-90ca-08d99e085c90
X-MS-TrafficTypeDiagnostic: VI1PR04MB5743:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB57433C88588A68E445558C3AB38B9@VI1PR04MB5743.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rHu2xhYVUP2NSGIlytbCTmRIGsWFYIcqFIrUrqwLwqYWcKgBb9/m64xgS/F20H2KumWxcwwItoEqTzfoQoLtyLOhEmsBSGPF5GNylmMl5ZAHT4x1CtBCl2/Ub4bfsjh++mmVcaPNkTGjmP9je7YOOTVcdMcnMjI9e65JF32/wFl0Bn7et74sG8LbB53Nw0FV9z3wyMhvz6mycC7lgrs6wxpf+z8o2gL18xhDlYUzaZ8HrpTroWX1/5SGh0wnTU6RtnbISizlWpM0oW+YW7m+5nf0UB6wFvhW0TCzZk3u8FQymuN1HUmQ+NJ8grCt4iHRbR0f+b/VNEZqfcKcK1/6gJf5xwstRuUW4HBpiRFLLug7o5IdaYBIbtC+X+BmaHqFdAFFxkK0WPcQOVSe29YLPK3HWrjmbWKTa8n0PN5ePycVgVxIrv4dk1NoHVs+z5VxKH4/L5cUAPnPWFCfFB/1x9d1VCql6TXCY9mpZC9a3/qeAHDtuV5uTtRmHkJ46zq5gLoo5p4q0F0x3A0180mkmmv3BLBp/Du/xMRxlJCGiJfdAL2r8i4Xmo7ulXI+MVmSiW4xvpIcop8qA648c+EWRSFKk6OwgA1KEIMEkCE+EhJPH6+dARgDnNP9BxGhWw7lf96jHX9W2AwEhnUKtVqip2ICAT+RYsojWm4HF8emxj5DdYAcyTgZhJM7EGpZeR/sn4mr8R7lRrMU/JUke/XGrMqKSSMH7CgfUY8YCcqopbY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(316002)(2906002)(8676002)(186003)(16576012)(6486002)(36756003)(38100700002)(31696002)(31686004)(53546011)(4326008)(7416002)(6916009)(8936002)(83380400001)(66946007)(2616005)(66476007)(66556008)(26005)(54906003)(86362001)(5660300002)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rFWZqAokG34b9wBRNULvdf4WFj6/QWQ0yBsawTkqSjk01oajvhkfntfOV7JX?=
 =?us-ascii?Q?fo/GhbCb2dMyYxGXRhYkIYNABQnCIEiqrX97wYgB0NflpS8Kj0ofplwqPZ56?=
 =?us-ascii?Q?OKSY928PoWN+avzlI8rfppWKfxe9A3KmS/5h02o2A5PCbNFi1P/LVWPjBKvx?=
 =?us-ascii?Q?Fgg9jh3rCb0wlK/e1AUul9uQ8UA+uMIkvJa+2E7TK4dh/9KqLAyPL134VxSb?=
 =?us-ascii?Q?/IpRuPqY0QKvcE7jej5OWx+sYJEA3elaSUrrpKLzH/S9rTMfQ673DlXxcsr8?=
 =?us-ascii?Q?Y6GKHTnVrZy7cTEINHa2FiOTtHFhlhl3nAoTLJMw9GHUScBS1uj2YWsLnDbF?=
 =?us-ascii?Q?kqm0/4hHwKnF/ZYIDZPxAWt/xLX43m7DHxnVLBRTpadqej0U6T7kUuT1hmft?=
 =?us-ascii?Q?DXZUbqOd8GUCT7tIK+kUsnpO5FTL4dPI4vKhMs1llIyQdFl/lty+faw3X6K0?=
 =?us-ascii?Q?4xZ5YOnYQzInlbcglOTLq5xvRhV2N/j6JCblb/OfCAAVTAeD6wqxoNCy6eav?=
 =?us-ascii?Q?b5iMEH2TIIZ9eKNQadtLT4D5ONjcUbsZ4SBpoe4892PN9tw3g6+pzyVrIkwt?=
 =?us-ascii?Q?r8Ob3jICf+g0RZ6Z+ZPE5z8SX9WpfjtEvAUjX5bCuof0o/0sZdUILjcR4/Vc?=
 =?us-ascii?Q?CtsHNKpesAiMpoIbt+ZG6+Cx/gZ6KG6Tc0B2yYc2rEwIGNH05d+gEui4zKHH?=
 =?us-ascii?Q?kpdkPTNQdC8tGeUHTDK3yCb41f1SPkdRcXoJuOozpQR5dSib/VXxcCOb9l4I?=
 =?us-ascii?Q?/N6wDOo3EWrJh8JVYmzvD/rPEtkEx9m6FZlgrnpRai/SjUTKwE9XPlT8I5BG?=
 =?us-ascii?Q?clHz9WDkuuG+saOGfcIjUBoa+X2OiWhJOzuNaNbKLQSPJHKvMF1V6N4CsJId?=
 =?us-ascii?Q?MAjrG2uFvjGUoiB31C55FKy/Uy202VdKDrvjHjTEPHp0/BtvfOwDxEfDzq64?=
 =?us-ascii?Q?XqHSxTBI6/NMzmW6qNkBMAUk3cVWDYe4lYy1H0d/1Et6mPS9I1V5N8k8xaUJ?=
 =?us-ascii?Q?hen2FXrX0kjp+9DcmEjiGYlOMGN0MPTfy0rAxfxiE7Gnx0pti2bue4gKWP4B?=
 =?us-ascii?Q?WIRnNiFlqH/b13N2IN2N1p02N7DGYJNydEAmKyUHIomJJ+OU4n5KQUele7a8?=
 =?us-ascii?Q?JJVtlDXMumpyJmw5PG7/Zmhm1jfWzBZbOB8CRPQAoEHpMbmW8IhOMHkFvBEs?=
 =?us-ascii?Q?g2GBV6o2los+iV6sI/Yg0fm/P8NxvLkbLaHgZatmnwfjgeFTsz6RQ0sae41j?=
 =?us-ascii?Q?hBtoUOoFqfm+6N+a//D25n++QKijN2d+21goIOBffwKiTiTTlRr6D/dFEmXk?=
 =?us-ascii?Q?+GvEz9D/P8lWcDRmK8lJrmGlxBY6xAPeOX3ZD3nZjP3vQ5cn7lhqcqZ3hsZV?=
 =?us-ascii?Q?MNDBUnNJwPUd+wum+UlG+VuQ4yIXwvYoxkzH0B2tL/8WPLHr75C4cJashwtG?=
 =?us-ascii?Q?pSFD5gzYThrKpr9TxP4nlqAhKQgu4VQsuHCwyAalxfn6jzbj5cET660YQBlQ?=
 =?us-ascii?Q?gwB7H5A7vrtKbCQcJvMY2cNX32BREpEXgaXX1d8XH46w6yVsAnvwPJOYXBFv?=
 =?us-ascii?Q?kKCOEs/NpYYJMc8Um8mZQUce4AkFvzoo9/E97yKjCJLi2+/cWNs+7SsTECwj?=
 =?us-ascii?Q?aPWCX3gfJR+UHJxB9ikQbiE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f946cf26-66ca-46b6-90ca-08d99e085c90
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 13:55:00.1389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O1gmZbjcbfNpGBdc3pSts51Jgp/f+N1n0jEOn3JZ76jCii6+OfUvwJGyNaOlWG3fWO3iHLp8KaFPIcy/tp0Bbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5743

On 02.11.2021 12:50, Roger Pau Monn=C3=A9 wrote:
> On Tue, Nov 02, 2021 at 12:19:13PM +0100, Jan Beulich wrote:
>> On 26.10.2021 12:52, Roger Pau Monn=C3=A9 wrote:
>>> On Thu, Sep 30, 2021 at 10:52:20AM +0300, Oleksandr Andrushchenko wrote=
:
>>>> --- a/xen/drivers/vpci/header.c
>>>> +++ b/xen/drivers/vpci/header.c
>>>> @@ -451,6 +451,32 @@ static void cmd_write(const struct pci_dev *pdev,=
 unsigned int reg,
>>>>          pci_conf_write16(pdev->sbdf, reg, cmd);
>>>>  }
>>>> =20
>>>> +static void guest_cmd_write(const struct pci_dev *pdev, unsigned int =
reg,
>>>> +                            uint32_t cmd, void *data)
>>>> +{
>>>> +    /* TODO: Add proper emulation for all bits of the command registe=
r. */
>>>> +
>>>> +    if ( (cmd & PCI_COMMAND_INTX_DISABLE) =3D=3D 0 )
>>>> +    {
>>>> +        /*
>>>> +         * Guest wants to enable INTx. It can't be enabled if:
>>>> +         *  - host has INTx disabled
>>>> +         *  - MSI/MSI-X enabled
>>>> +         */
>>>> +        if ( pdev->vpci->msi->enabled )
>>>> +            cmd |=3D PCI_COMMAND_INTX_DISABLE;
>>>> +        else
>>>> +        {
>>>> +            uint16_t current_cmd =3D pci_conf_read16(pdev->sbdf, reg)=
;
>>>> +
>>>> +            if ( current_cmd & PCI_COMMAND_INTX_DISABLE )
>>>> +                cmd |=3D PCI_COMMAND_INTX_DISABLE;
>>>> +        }
>>>
>>> This last part should be Arm specific. On other architectures we
>>> likely want the guest to modify INTx disable in order to select the
>>> interrupt delivery mode for the device.
>>
>> We cannot allow a guest to clear the bit when it has MSI / MSI-X
>> enabled - only one of the three is supposed to be active at a time.
>> (IOW similarly we cannot allow a guest to enable MSI / MSI-X when
>> the bit is clear.)
>=20
> Sure, but this code is making the bit sticky, by not allowing
> INTX_DISABLE to be cleared once set. We do not want that behavior on
> x86, as a guest can decide to use MSI or INTx. The else branch needs
> to be Arm only.

Isn't the "else" part questionable even on Arm?

Jan


