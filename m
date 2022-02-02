Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C19CB4A72D9
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 15:18:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264233.457254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFGSo-0002P2-1O; Wed, 02 Feb 2022 14:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264233.457254; Wed, 02 Feb 2022 14:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFGSn-0002MP-Ui; Wed, 02 Feb 2022 14:18:25 +0000
Received: by outflank-mailman (input) for mailman id 264233;
 Wed, 02 Feb 2022 14:18:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6WyI=SR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFGSm-0002MJ-BX
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 14:18:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f955531b-8432-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 15:18:23 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-znqRr157O0y87EEKSpY9SQ-1; Wed, 02 Feb 2022 15:18:19 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4280.eurprd04.prod.outlook.com (2603:10a6:209:42::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 14:18:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 14:18:17 +0000
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
X-Inumbo-ID: f955531b-8432-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643811500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bq3Ul5blrR1MuEd2qetGcSMKyjnhTuROl6skuAmKufs=;
	b=DC4Xa7aoMJuFyHJlI7pZi0MLsuDsn0qcbafkTfvbJzkTu2v/CGC5kxRsHXYaA2f+89yeYY
	UMRJ0D/hgBSN9aR+JpojYSpvXXqfiIJh2+BGzlDOw5rz+4gqhO3TlgZ/T+QeQsP52kFhAF
	cQQ8hodC2FhrOlrmkblUJj1f2Gn16LY=
X-MC-Unique: znqRr157O0y87EEKSpY9SQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ece+AvnxhSCp05wVxtXGEvRbraoA4R88z48dRArY/BNaJYk6jU6YgZRvs2/F50m0aFDEKUBX45QAfL5MZ4KkVvRXqX6bL5vV1+H2HlTA1GlWI+g+ttj4dHXGPJ9uy2WbXjIty0GgTQA/Jz8vj8SadkwimyEUg2W/w/YDfRSFcl1ED7PZl1rQYFt8pTpvaHbEh45jbijZnku8kPMZ62M3A4q94ERkRvHyN2x7GrC9d38EKKgSFrwMfJG5AYm2oXnKN5PEN25WSgTq6/fNnUO/VTL7HWIrYw76q89+Hp9LhS0UPzxgJTPvqzQjIZc6FR62RGMn0j8xGMk9kxyFIXnLYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWENDfE9O1EWll9ieWo90xtr6HRhe66hQlUL2GIvXrs=;
 b=bmaWZw/y+hCuVOL1JtZnNCJPzy5ZS/RcnIANMcKxgfn5EHi2OLKlmfDhg6xTpwcj5RfTG9v21jv2rGH+iPV9w/ip5HFUnjYP3UvVbTW6tqcHd6pRwQepTDUdc1ATUmKedo+Xw2HyskEdUA12xgWYNx3xXwbC7BQXxY0qkM2oyCPaXS9GZDIwwrwmt45d++n3fVt8i4Hbg1WfvVntbrstYKsaKFUDyX9bNcdMSF1sCgkn02LXaVTkUbS6B/cp1/y29CtUhuS88LHumBnOJypLb4poA9kQWdDjrEK/OSZIb8t3h3Wd8dsx0aLEeycDChLC6KxSUOqK7uX3xVTjnDGqyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ab68568c-461e-bef5-4218-07db8e837bcc@suse.com>
Date: Wed, 2 Feb 2022 15:18:14 +0100
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b9661d86-f084-9ad1-59d5-538113000393@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0081.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c99d8298-602f-4ebe-010c-08d9e656db72
X-MS-TrafficTypeDiagnostic: AM6PR04MB4280:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4280311DB6CE8C84E90906B5B3279@AM6PR04MB4280.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uDAw3nJFTsjDX7bdAhhXROPtGY8bsnpXPxgihcWINgPfZny/EUFiXCgIhGZyXXtanpjfx/2+ko2OAnEMj0yzkIgr85AgK2eab55SOi21A/xFWo+kc9oT4mjUvqe9MFYlod+2MH2dW3HEKiMpDjL3xoUFtj8vRFsk0jb4Pg9IW0dE7f+OgbSL021k7qdPm1e+T5SazOutWG7swD6fWFOEU5y3twwmIqouch3eTLhw11vGVg4F0r/qqsoRTwDMkG9RPJvIN+VHA9ORTD2T6dL6GN0SDkMl1Ztf1GhRLyOwsJIrmpblolF5//k7Y/ZjjY4NGme1m4PFe75kWA6g6o9+txVmKUMqfaHbPvn1zGRE02c4Evviur+M0/UpImVUFHd2WqcS4fBCrUCzFLdSVa9sNtsZ6RrJJ4KbTuM+KjlRnsEznmvfXRiBERyLXeW1m6ET4dpPQsbeDBrVSLl/MuHOl1eWYvaEqxd9lZPAbZGoeBgacSiyK73UaUsCpmn2WG69Y4l0ky84cEDZ4UIZUpXhnrEucReJ0VD7PvH7madPi9j8BIqBjq3a1OlA2G1MmTybipkn8iK4Q2dnO75A+HmLKUxZ9v5nO3jLmrQqNCsYaSztZYwGsEbHm1gYVd/8i+9sBfzu+Hs142KA/ibQZq+BOZ44GGlsgmJfC1FIDUWXjUaLJ7pGReYkh0iN5ltamiDHZRHQZ2qOPSRPaNIgjs9GBVqgO4HhNGkwiG2MmgjrXCE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(186003)(31696002)(53546011)(6916009)(2616005)(26005)(86362001)(6486002)(54906003)(316002)(8676002)(6506007)(4326008)(6512007)(6666004)(66946007)(8936002)(508600001)(66476007)(66556008)(2906002)(7416002)(36756003)(31686004)(83380400001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FWUKtgCuCoxvLihKIWuCduyS19lgwBsCxv9xg7PfQ4NRDyED1NuIWl1vQ+My?=
 =?us-ascii?Q?rw9VjbZ9bgM0vBVKAq2kpyNbK9FlUqh88lsTNoHX2B5t1eJjSNmzBeDmh3CP?=
 =?us-ascii?Q?f70Xzhxpxk+wE7z+gq8aX46VFHw+DrwLp4v3hMKiyBzUqKGsKpmWHMIjVNX8?=
 =?us-ascii?Q?34t+cJAuzwWT8H60/Mv8cWuFECuvXM/YS8lhfguqzkLeENoIgtaLv5oAYwP2?=
 =?us-ascii?Q?X7IFs926xTFQUnLzVTyWr/cB8OGNGvZsEpxn8Me8i149uB+zDi7+/1uHeKWu?=
 =?us-ascii?Q?Ca3OiApQZh4SOX52JJ1F6NZgkJbYw1vGPPm7PLEPB3BVOhn8Zaw5XZCmo/IR?=
 =?us-ascii?Q?/KtMQ8rU8ENizZlGqAgML7o8IzgC2Fp3L2gtpJjFdKRAs/IiWQ3Yewats/ES?=
 =?us-ascii?Q?I1gDUqI9VHczHG1FFMoqygcY9EPqIPojdISUF602HMAcywcOWy0x+FKKY5QE?=
 =?us-ascii?Q?ExefNo/EnuDE3hYcLzxbSA1bKcIkIgFyZM6xI3cvzXnzx38lTHHYkcWz2gXz?=
 =?us-ascii?Q?0bf3djjz4igX9XYSHXJZn+icqSiFreyl5gMUwLNs0WRiyNQkI5PxTT8nuCb2?=
 =?us-ascii?Q?GyEL/dVTuofO84KmNysH8mQs8YEKbRSs2itxFNry/gfPADhGV7dUeF9WEQCh?=
 =?us-ascii?Q?qmWAbSxMfsN7ebvPgddQoy9gzW75o0Vqo5O3kkQlhRsjAwe7W1S4ZPc0DdL9?=
 =?us-ascii?Q?7rhsdEhklOHS8vcgMTUy+E7eZBEgBZFG5tKcsKG87HtlZ1GwEZJVAa6DB2EI?=
 =?us-ascii?Q?1beOBUdpTHrruP6aNw7pFn6pIkwn7rbt1ipMtwUPl3gCGHNOo3LoO0Ja+wn0?=
 =?us-ascii?Q?zGkqk8l7kaw36s0Qp7HbUyHLpJ21bEnOhun1cuP5Rn2W857gElJUKJVZwqcq?=
 =?us-ascii?Q?Fc6DIVnOL68lR/5Jhb6z6p6Ai64dJn16xwvJVgUlZFwCPhE+boYWZSRc2UoM?=
 =?us-ascii?Q?HqVXW7UWUEyFvz9Es8vNrxUcZ/grtO2PWFt/XYJupgn2y+Iwug3xY6VOq0LH?=
 =?us-ascii?Q?nFybTrm+mHIOzozmYxFIOqtien9qmf4auDgZyysc82N4ReZHUS+gVxiyxJkv?=
 =?us-ascii?Q?GOj3OTODf12J7it9ZhNhMLS95AX0cNSYkRK8OJYlUMHigrEn/xhwCugvuYK8?=
 =?us-ascii?Q?Vj3Vqp66gFc7KhtEXFi8ttVV8pr6xJYg77pFCGjuYOlC0CjiZ1ny2H6Mf1AG?=
 =?us-ascii?Q?hGgaGm+KTUjXsAx9lzzYWe6mPok5/+heSBMAeiqm4ykqMEuk+CmYV9hhcp38?=
 =?us-ascii?Q?4xPStDahPbzbFPRziVvx4iCE7VqMSlqTVxWc3r05X/2gCrDCGo2mij9zljv5?=
 =?us-ascii?Q?j3oyaCfdjIV7ZiMCYJ8zwrWwjh3Fd1mTF6dcC2x7JBCwkyBJWQRTYdi5ybfy?=
 =?us-ascii?Q?s0qZnSgFccMWxsL4UHnnCle+qu7eITDti6wP6h3tHjUk8OI01A5CIjev+ioU?=
 =?us-ascii?Q?xlwsGufJuo1RYkeJwv8P6u3OOJJx90+xSsq9YMvDiINUP9bmdEDdaHc/2FRV?=
 =?us-ascii?Q?jdV4bzI7XOIY2jJMbce9OuaCZRQchouvfNTPXLduYhRgMy6Hudayeda333fq?=
 =?us-ascii?Q?3heCP5juVImeYXSaDy0BgyH9z+ue7Wb6kyLilAaD+VxffcuyndZaYHI6SNTg?=
 =?us-ascii?Q?mE8ShdL7b1nGCIHQPrGqV30=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c99d8298-602f-4ebe-010c-08d9e656db72
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 14:18:17.4612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Noyjxh9q9pOb8IOYacsGMVK2lnEcyYPg/rj/PHwPnH+ZZSGiYlSNoM72rwCXyJGrnVLFjrba/J25rwewsAg+bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4280

On 02.02.2022 14:47, Oleksandr Andrushchenko wrote:
>> On 02.02.2022 13:49, Oleksandr Andrushchenko wrote:
>>> On 13.01.22 12:50, Roger Pau Monn=C3=A9 wrote:
>>>> On Thu, Nov 25, 2021 at 01:02:46PM +0200, Oleksandr Andrushchenko wrot=
e:
>>>>> --- a/xen/drivers/vpci/header.c
>>>>> +++ b/xen/drivers/vpci/header.c
>>>>> @@ -491,6 +491,22 @@ static void cmd_write(const struct pci_dev *pdev=
, unsigned int reg,
>>>>>            pci_conf_write16(pdev->sbdf, reg, cmd);
>>>>>    }
>>>>>   =20
>>>>> +static void guest_cmd_write(const struct pci_dev *pdev, unsigned int=
 reg,
>>>>> +                            uint32_t cmd, void *data)
>>>>> +{
>>>>> +    /* TODO: Add proper emulation for all bits of the command regist=
er. */
>>>>> +
>>>>> +#ifdef CONFIG_HAS_PCI_MSI
>>>>> +    if ( pdev->vpci->msi->enabled )
>>>> You need to check for MSI-X also, pdev->vpci->msix->enabled.
>>> Indeed, thank you
>>>>> +    {
>>>>> +        /* Guest wants to enable INTx. It can't be enabled if MSI/MS=
I-X enabled. */
>>>>> +        cmd |=3D PCI_COMMAND_INTX_DISABLE;
>>>> You will also need to make sure PCI_COMMAND_INTX_DISABLE is set in the
>>>> command register when attempting to enable MSI or MSIX capabilities.
>>> Isn't it enough that we just check above if MSI/MSI-X enabled then make
>>> sure INTX disabled? I am not following you here on what else needs to
>>> be done.
>> No, you need to deal with the potentially bad combination on both
>> paths - command register writes (here) and MSI/MSI-X control register
>> writes (which is what Roger points you at). I would like to suggest
>> to consider simply forcing INTX_DISABLE on behind the guest's back
>> for those other two paths.
> Do you suggest that we need to have some code which will
> write PCI_COMMAND while we write MSI/MSI-X control register
> for that kind of consistency? E.g. control register handler will
> need to write to PCI_COMMAND and go through emulation for
> guests?

Either check or write, yes. Since you're setting the bit here behind
the guest's back, setting it on the other paths as well would only
look consistent to me.

> If so, why didn't we have that before?

Because we assume Dom0 to be behaving itself.

Jan


