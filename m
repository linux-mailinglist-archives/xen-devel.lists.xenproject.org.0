Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E27E5442C62
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 12:19:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220076.381181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhrp4-0005uX-DZ; Tue, 02 Nov 2021 11:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220076.381181; Tue, 02 Nov 2021 11:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhrp4-0005rq-A1; Tue, 02 Nov 2021 11:19:22 +0000
Received: by outflank-mailman (input) for mailman id 220076;
 Tue, 02 Nov 2021 11:19:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxJb=PV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mhrp2-0005rk-Rj
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 11:19:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3cedfd0e-7583-4c13-a0d7-714158fdccf3;
 Tue, 02 Nov 2021 11:19:19 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2052.outbound.protection.outlook.com [104.47.4.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-NKNaIyOGOlCeUGYNRYTviw-1; Tue, 02 Nov 2021 12:19:17 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3391.eurprd04.prod.outlook.com (2603:10a6:803:3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 11:19:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 11:19:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR01CA0051.eurprd01.prod.exchangelabs.com (2603:10a6:20b:e0::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17 via Frontend
 Transport; Tue, 2 Nov 2021 11:19:14 +0000
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
X-Inumbo-ID: 3cedfd0e-7583-4c13-a0d7-714158fdccf3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635851958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NZPk2ntut6FniNv0dLYv6O9ukZHqPvJoIcx3QZNAfjI=;
	b=cf8m2GdMZl3gn4QMAOfIQlNXn3COTnPanJZTSqBOW1FoAAH1KLgxNpruxUnftwudHSK3J1
	ATflUxHUltZmQWCRONKMktCbL8wTzw1JD/vkEyfaQLfcg0BGiIH2NXYNVUG2oHVQY/lHW9
	mHtzZ8G3uic6mieptsJVs1pF3lmOARs=
X-MC-Unique: NKNaIyOGOlCeUGYNRYTviw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhYF4LlqA0BZzEkC3donEphmtQsa92pIiP+jhqLEB3bjAOLCPsXoJ3/lS5Y31TbyXNKIqdQagS7RYfApepDApSf8UVAUcMnyxs+TRQYaj+bpja113NB/y1lZ+mDId2/HV1/THh+P7dqNm8iwRl/08ucR0R8RJPBCWGwkVPmPQ8/ZJyk+vk0G6G2OAcF2CgSSEPAY6e2hEfeQiTpcnXi0dN7Ic6aGCzM83UMbCUT7tYRZKWkUNUH7B4iJc9fhAsj6T3vNfirUOqqCMZ0MrKZaV/kr2mCPhBFK1b9wRTErIWMUx5+WKNKlX1f664AeRQhB5y3hCPeBDarGvSUb2X+KnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wIDlbItKtfut8ntP/9O/LHcTw/BL35ttBixEbpYSAQE=;
 b=cXxNLIPdybwkVlpu+OCtmSUosiZHR+zn6WHayk+UeI+K8STvFHf/HIhMyT2dEiwbU1mEpIgMFtybQltiqMNNOCXpyALA2AWmnaAWraFiICrVXT8pyXfuPGJG2PJDL1CO8LZ5x1Pw1i+IcOQc1m/tbYfqmkwMDerzSYjsL3bjSzCVoweRZJ+mwyND3/ZVY2UOvoD9yewRamP2oGH8STXsVZ2zakK/yKpgfhH0bRNiwc38yKm4lXgLGS1uqTaBxAPwBpWvetQz0U/atchx0atE0UT0c7IcDGKUuL1vZrbm/aAx0DdJMuAmLB16j/f9v+fbihhPAfzBpThf82HGuxwDtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f1b49f6d-1c2a-97ff-59b3-f0b606857ed3@suse.com>
Date: Tue, 2 Nov 2021 12:19:13 +0100
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YXfeB1LWy6Hm81LA@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR01CA0051.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30131cd7-7075-47e9-013b-08d99df29b01
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3391:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3391E527B4680B16DA2D6B8FB38B9@VI1PR0402MB3391.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BpWZRAb95HrrHk935Gz/F1Baaouek+5lNzpwK09csGrk/teG+TYtvenzUKkt/uK69Sq/i9cWy20RN1tItNDtpc3FD3bQUPlb8ytw9zYEUGrLdIIaHbxBsFy+MCDTWAH4hkrARVErKa9//5TgwZjF57n4X0Wj3z4Mp9sWXMt1Wvrw589LNA+l4TreAJp15ucdaeiW4yZNnuTmBzmELhl2fye1XMD7vz3aXOuKUBYkDiyL5LXW06VJJV68Bkyibk0QjuR8B0tvgxWb4bC7p/6mcC8BpS5IA8HJHQXGx3/LKMWvHvP7k/AlgXvEDvwtzr3y1SkAomCok983xh04s7MS7x3JPjybu/5we1pVSN7lDqsSlmsRfIbNFSdIux3qWpLUKzZOxLK/+EaG0gIwTUFpRUD1fHxAZ9VbQaScSUPJDLUfaykBvjDnxWDlEcPbuWKiTk5czmbSHZcmNey4WOcJEcaOFf+nrJ8AWMpnO44o1YEsHl/SKHuJfO/R/iM2lxOHlbVN7BFlijp3AepvpaQZigntEdiM/kaCCVFPgeWpiGCRI4ZgE0Hl1kfiyDTkF56pk0JQxEgy2GSBqSZbGi7vYNshwBm49wOB7BtrTVJ4xUe/f+sJw/ywc7rHbhqXoaEgxZgT7V8Qj/UGRqnPSeYB/TlfbI4W7GoQZMmqIVTyRIWBRTCDSayrEhuZtIrarwuPE3huBXWshSVM0Ebcy/wcqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(36756003)(86362001)(54906003)(316002)(6916009)(16576012)(38100700002)(956004)(2616005)(66946007)(66556008)(66476007)(4326008)(26005)(5660300002)(53546011)(186003)(508600001)(8676002)(6486002)(8936002)(31686004)(7416002)(2906002)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ck8eWQdfxVnEeeJvuXvvuIxTF3yxDFKBolt5h5AiADXIpUasMnctGNNIzsN8?=
 =?us-ascii?Q?EnaE/u9PpA7ZH8LW8Cyl/qu0OphS21Pv1mlC4/JH6iTzRFKH4645r87+1YWq?=
 =?us-ascii?Q?K/Avlx33wEPQXasAV1A6mvq2KmH5z0ZjYaAHmDHyAzIkxyd/3fySY40N0Sl9?=
 =?us-ascii?Q?p8qgcslvUfd3xOkyRCEMaRw6KOO6CcT8o2hiRTGjXnWmr6U+qlAlpdveTrjl?=
 =?us-ascii?Q?HyT3QItABMOd6Q7nTLbjlf6Mbjd4r0PwOsG1sMIX5Xh90Sj2javo/2r0GflI?=
 =?us-ascii?Q?Vw7yTnUWe35cuz8NXLSUpoCoX1ZcP3xqPMb4FQT82Odkhkn37XJEi/yl4Tnb?=
 =?us-ascii?Q?JQWqPr8iNXHHsA1jsGWLoaqgDSkZRA64jXkfwmxgYz+KhAh1o7lj5ZmNRjiO?=
 =?us-ascii?Q?eSRXJotRuZAbO2kQtgTHpvq5wvHMnktRTcrO7UeAQnHICCT/xAcqliwMo+xR?=
 =?us-ascii?Q?uRULLk+Rx7erHDsmCnc8Gbw7ecJCWQQIB6qNUyeWVSdYeMHcYUhNnPgdziyK?=
 =?us-ascii?Q?ZrucTJXZ72JnRPoAmPhAzjtJ9n9z7txmCpcqv70RI6G885LtD/nY9tNUE8Yo?=
 =?us-ascii?Q?hNCY/wszLd8C0D1KB3XC8oMFuCdaiScCOm5q/aUVh1yF+9o+lmF4vvHDS0Za?=
 =?us-ascii?Q?HKE+/nbJg83nWAMYugii/5it9OWkvPRmPdKkWqeoxRKuGOQ/cPJldYmM5mni?=
 =?us-ascii?Q?5y/Xjwc03ANVqZ7JcbxTJCf/VBePI8XAhMYdvArEnyHah37+Ch5QhHqpKyqw?=
 =?us-ascii?Q?I+VZrRHlxRBXsNw0foz6yPQjU2QdFGv/ADHxF/w+9DJtG7bmU0NQg0xCPfvG?=
 =?us-ascii?Q?DlpgeDiyN7tl92KIcjve4bjAN2mOY/Nnl3DQm44snpt7JFskJLo0LKrqGGXg?=
 =?us-ascii?Q?w1LGuNNqVEK7VG/uBJ8RMQczHD47ESsilGL7jkao+jpYCQjvIIQYRIK1eosY?=
 =?us-ascii?Q?S/Zcpq7UszHUxi8VyO4PXYVrbPgTwPfuO1HFlFKynsK5oT/zAKg8530XMysa?=
 =?us-ascii?Q?/BUuexffPT+WVTd//w1VSovDVezamZzC0me6AfYsaQC3LX2P0pieu0t3Bzim?=
 =?us-ascii?Q?idz76lZ8/WjPKju67BB+Jn/sEmwecTrzGGcSqnvsT4SZFXcozLsANGvzJxju?=
 =?us-ascii?Q?bHyP9gPraK8tenhB0xYLLoj00m+J3da+dL6jY55vxuip4NIqiL40byfEvwB4?=
 =?us-ascii?Q?/f+8zo4ReTKS0wVqxm+p/SJlihec/tOfBkJuzFlSU8JV5cbrHmP8WlpNVHJk?=
 =?us-ascii?Q?CYsE0t1LReKsaEvWgv2aX1NTYw9Joe9A4YMigf5RVj/cGDHGkJ+Na1n03evG?=
 =?us-ascii?Q?QtYcBI3479E2VIQmaj0EaHVQg4C5+gwN9gr2E7M6aMvd46zMUdROAXGYL0NS?=
 =?us-ascii?Q?Qg+pMPDg2GjPAKiq7GazQDBfiOCQlcEMQq6wllsHkpMgw32tn08KKLISiRG0?=
 =?us-ascii?Q?/c2Et/4DwPiduwWN/tvqTBIoi3tuPH6NC/e701y1PP/hnARrLNhan4y69AXe?=
 =?us-ascii?Q?hZXN/fe5fh1HyUl5o8HrRw0Ov2RrXblM5ikUOzULzpGN4jHEcNRGn4VyHu4X?=
 =?us-ascii?Q?9/2mrN9nCOs3Bzq2k/WFxZVytKA5ZNWXjbzBRwD5lDrZ38lLZY5v/WjDawVQ?=
 =?us-ascii?Q?TiY5ZtR8EYkFfP1kaaWr5f0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30131cd7-7075-47e9-013b-08d99df29b01
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 11:19:15.8676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4CAPSwfahMQ1HcGnCKBqEFN9wpGID5BNc2BwaJfAmRW4O7Nc1h0ZpgSrWTcyT9izxmfKuFGFooGYrUlnf34PTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3391

On 26.10.2021 12:52, Roger Pau Monn=C3=A9 wrote:
> On Thu, Sep 30, 2021 at 10:52:20AM +0300, Oleksandr Andrushchenko wrote:
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -451,6 +451,32 @@ static void cmd_write(const struct pci_dev *pdev, u=
nsigned int reg,
>>          pci_conf_write16(pdev->sbdf, reg, cmd);
>>  }
>> =20
>> +static void guest_cmd_write(const struct pci_dev *pdev, unsigned int re=
g,
>> +                            uint32_t cmd, void *data)
>> +{
>> +    /* TODO: Add proper emulation for all bits of the command register.=
 */
>> +
>> +    if ( (cmd & PCI_COMMAND_INTX_DISABLE) =3D=3D 0 )
>> +    {
>> +        /*
>> +         * Guest wants to enable INTx. It can't be enabled if:
>> +         *  - host has INTx disabled
>> +         *  - MSI/MSI-X enabled
>> +         */
>> +        if ( pdev->vpci->msi->enabled )
>> +            cmd |=3D PCI_COMMAND_INTX_DISABLE;
>> +        else
>> +        {
>> +            uint16_t current_cmd =3D pci_conf_read16(pdev->sbdf, reg);
>> +
>> +            if ( current_cmd & PCI_COMMAND_INTX_DISABLE )
>> +                cmd |=3D PCI_COMMAND_INTX_DISABLE;
>> +        }
>=20
> This last part should be Arm specific. On other architectures we
> likely want the guest to modify INTx disable in order to select the
> interrupt delivery mode for the device.

We cannot allow a guest to clear the bit when it has MSI / MSI-X
enabled - only one of the three is supposed to be active at a time.
(IOW similarly we cannot allow a guest to enable MSI / MSI-X when
the bit is clear.)

Jan


