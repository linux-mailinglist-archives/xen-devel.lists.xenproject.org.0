Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8D842EE9B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 12:15:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210178.366945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbKEu-0000Pd-Ai; Fri, 15 Oct 2021 10:15:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210178.366945; Fri, 15 Oct 2021 10:15:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbKEu-0000Nh-6j; Fri, 15 Oct 2021 10:15:00 +0000
Received: by outflank-mailman (input) for mailman id 210178;
 Fri, 15 Oct 2021 10:14:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGCa=PD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mbKEs-0000Ms-OG
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 10:14:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf530068-2da0-11ec-822c-12813bfff9fa;
 Fri, 15 Oct 2021 10:14:57 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-2-9fnRqoRDMb-vckerAqAXZw-1; Fri, 15 Oct 2021 12:14:55 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2608.eurprd04.prod.outlook.com (2603:10a6:800:4f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Fri, 15 Oct
 2021 10:14:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 10:14:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0402CA0020.eurprd04.prod.outlook.com (2603:10a6:203:90::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Fri, 15 Oct 2021 10:14:52 +0000
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
X-Inumbo-ID: bf530068-2da0-11ec-822c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634292896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vU/UzPs96iEJe0gPDJyp3myE5nI9kPBtnBucX2HnWh4=;
	b=JJZa9BNL+1vbo4Nju9IMnqLc5sQzgByDggZu3kgU3/cfZwSmAsY3KbvUI8Jq7hyz7SMuiW
	V3EaptwSER7HQFL2wK40p1sYA1e1MtdSNYR2vlVTuNGnHqDTGC8NCk7kHdl3BHjP3JscPy
	h90mxeLcwt4r1Uf37CfgRTZTS4/lRf8=
X-MC-Unique: 9fnRqoRDMb-vckerAqAXZw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQcOgqxS7i430luD8UG1gSw3XvW+ke8Lq21MxFEcqsqyU+IDODkvKYAhx4EtxoCvAdkkhdJhghtvWbkUlC7AvV3U/Gt80CBm4Oad3k3R3IaTMh+OFFqmxUyHZjRTq9IgNaulOh4lRUMmSCUTGnA+5OSXkeLCAUa3zcn0xSFawulieEiDdBt80qwq1sPbyJg4ePHA0W+hK6Zr0UhNbPmQWawEQYDG2CH/fA5LYyL+CRPbrrqWfYXoIdnV4Asgpa7bjOTANWzkfuVeWB7zFAnj+csIKHZI4ACl8XI9WHvNz0E3pwB4S5uJg1iV9Im60FNM6NfhrfXZDcWunxbdfNsvIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGochgLon9VsdOmajJGgaWQk2WlIGXRMlKdcLCdPRYE=;
 b=Lr47QeOLC3D1UJ6ef6G9kUI/wMI6nrnae7iMOLStEwIqSvKvaRHBPRVil02gGSbm0QLWZff7OOZhPjTj7JPEBCxUtsPpPVl8syR/A+WEINLeheoEfodaW3gcrr3X5eFLSBnFtUPPbFXZChnS2rtK2Is7Y0nJ5hJOVMpkR/i3Y3cpLE9KRfKzWnfucpjQN+706EDVgB02sJ1hlk0KjUQ5wvVu2+q0JSSgdTT8i+CS9VyXzmwztxrgt3LolrmTuVnV1VgDb5Hx6Ki1Q300yzak/j4fiSIcsXI65XE/Aj2xkMmuVWucki8UfpYMP34sZevL8l7K5hWzhoVZ5H+T3J9u9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v6 1/3] xen/vpci: Move ecam access functions to common
 code
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
 "iwj@xenproject.org" <iwj@xenproject.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <ced6f870dbfabcfe8584555cc80f9a37a0655a0c.1634221830.git.bertrand.marquis@arm.com>
 <YWkxT1bVmBT7Av43@MacBook-Air-de-Roger.local>
 <EB6EE7F3-80BD-4717-87C7-C54FAB0FD832@arm.com>
 <YWlPohYpgxs3gRlc@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f115a820-e4ad-54a5-cbe6-9c5569745d7f@suse.com>
Date: Fri, 15 Oct 2021 12:14:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YWlPohYpgxs3gRlc@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0402CA0020.eurprd04.prod.outlook.com
 (2603:10a6:203:90::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01b8fa7d-9b93-4a9b-19a9-08d98fc4a170
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2608:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2608572F425F4FB2F61394A3B3B99@VI1PR0401MB2608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OhIc3Lfa8Q5TYv1E/yqe0kFgCGucmpTMMp0edxzbisfcjbdb8oe9PBzpmXfEgtkA/W7RnRVjKjWLSYekR5YWK7zXpJasgo92yrvtgwGnL0G0xfGdLdLGUXwdlXTYbFdbn4IUfN3xr1gdPNOlyyOP+b2gazWTQQv9Ue9KrH5x7c7QEaAXCT4b41D5qCuU6APSwrc1gMr6/G2xNCJu9tpm2GqNPLzlQvqdT9C6kKBuF3lPxJx0HcMrjTFjWvioBearBoEHAGNa/mK1+dRQ2dFKwMNqpVhq4rMV/Js+C0SJxpuX0T0jrTqeHOWcYYs5G8eFBxlKMeBkBoS4PnZ60vrX2V6X5b7e4CQ/fP83RTux6ISCBIwFA0daD0qj4DMjW1/2gySLl3kY5ITSE1j1gont4atac3oW6WTD//a/0ddqml0uqttudzQ+fpTaOTRkJefAyBVH+2H8Bw9Gc5E71Doi9omH6TttQv3jeECGw/5OGDbH3LhXY2GYYz1X9Qaey9Gmx1wsuCTXq3lUQD3r+Kth19adrOxRCRoS+ezana3OgHT+OnbaaN8QuvGN/f8yhGoQIVUeO3YEuKm02quLeH7HirpKGIf2f0BxlsnmZS1CM/mbCEkuyAnuHhEUIGVmvZROk9H4oIqJiSJhK5OaDR0y8RQkSOVo9zKzm40X9eB80X1l3hyxi4EyxpTmmzdbJG9N+DZOCcdzql8eiuBRZp7J3mx2qxHpetv+tW8EtreYC7g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(4326008)(16576012)(86362001)(54906003)(316002)(31696002)(38100700002)(53546011)(66556008)(66946007)(110136005)(36756003)(83380400001)(508600001)(956004)(26005)(6486002)(5660300002)(2906002)(8676002)(8936002)(31686004)(186003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GbR1t8rHETsTOz6rQp5VFbr49zic5GHvaIh2pET4p5nDW1NRKsg9Q7lzGzDV?=
 =?us-ascii?Q?FcAqqbR+ttPpdJRWVMQ/w867BrUhoFcblfY3aZyMSf6TzsQYpFIdIe5khmzh?=
 =?us-ascii?Q?unD1w5Ls9hm2DQd4pi7qRlHgTzXDPNSkDJkcpdgkb3ckefiUZqKh23M+wyoY?=
 =?us-ascii?Q?hE7B8QyFr0AFl1+5BNPcAJuCyN1iXKuJUnb2IxPrwmUNCxof40TCmQtS7dMt?=
 =?us-ascii?Q?4w2NB58jomZROwMX/S13/owgbygn0wGKkjWtQWwrX8vGhX5ZGVwHtHju8xtG?=
 =?us-ascii?Q?cue3g2OMzfX2II6i4UwpwL/YVU3dYwnJc+ywXGmuYP16sHcJOmt+dW8wjBvx?=
 =?us-ascii?Q?w5drFv+GgtccLXKJRCIWsI+d7J+Sfh4q0n9wni4Z6KRR38TiiCiW+7TbqCdp?=
 =?us-ascii?Q?Yp+2WzNnOt6Hl1dFq8OHa0rB8rgo/Jx5bQH+4OA1+4hYGu64+G1PgyRZ1iOX?=
 =?us-ascii?Q?oDcmWVfyCGAiNYIgt2t1xZvf8r81G4FrCPi1anO3ULJFj6Y1mvOgWlY+Qlh9?=
 =?us-ascii?Q?uQi5InlL2Z6Yf/dR2hKr572AhVVV14t1xilR1374cHnnYFBfcr7THnLHTCS4?=
 =?us-ascii?Q?ZIns7E2pmGVdckeSMVoo9gOmNYoZnXvvSMz/2PlG0/EwCvn8aqoRri6dLi7P?=
 =?us-ascii?Q?hKQaLpYynWtx1YTgPpQLiG6GAMB3BeSif8kEu4mu0r/f31vCeX8AgVZ7FLL0?=
 =?us-ascii?Q?ptA+/xxODYUBH6jzXUkfp5Wq5hWEzwMHHv3bKbivt6+BHe/xMwz2hofREmUU?=
 =?us-ascii?Q?FPZiGUGpBY6AZtysvnVZHZ0GvnOilkdQ9nbAFErMpPCCYzdOaMa2aySmQDHg?=
 =?us-ascii?Q?IiNKEJUzjmd8TTB2uHwwKDg1iZdEoepS9oTUO79OHB7Zfy0x240oPvQL/ve2?=
 =?us-ascii?Q?Ws/8afuVyWsFrRkDoHGDEQmnfUaJPmA2oxIVV5pzJy4A+2tzQ+Q3yfMh5Okd?=
 =?us-ascii?Q?D0z8/yF912hloGDvdPaqrSsYedwFwhscXtyx0KqllRttUrVnr8xbvfkCzunS?=
 =?us-ascii?Q?gaNbFyRYo2Nl7G0LNG3/41QBS/pHqbHKgY2RxScREkKLSBXBKe3z1YmQNGTq?=
 =?us-ascii?Q?V2p7JHDRPLDvWSsf3DxQcEuFXWDMwHCZAroPGCpxi+CIdfOCO/04wEWnw4xi?=
 =?us-ascii?Q?LI5Ho9ne38DnNOHbmVWFkcEXOIlK66w3DNc+GZxgi6wHgR5eSou2Y3gVBt1f?=
 =?us-ascii?Q?Mn5TgkazFfPfgZYMn+empUovytGv8TnKQh76kMxCT4A4jnkT3lkRYhQZV+Uf?=
 =?us-ascii?Q?1MMCzxnAo//ylsNPBwuaDSXRRopPODE3rsiYMzZ4esSJxjsC2Z/maze8nD6+?=
 =?us-ascii?Q?77zMNg1uHTc7fX7SSa/DIf4Q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01b8fa7d-9b93-4a9b-19a9-08d98fc4a170
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 10:14:53.5145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Wi8gPOa+8i2ZCJnxWUsui3rZFn+1GucdSCLVJcaicBZC2X3w7JtI6arW2/bMe0UFxmf+uucSU33iB33Wlleng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2608

On 15.10.2021 11:53, Roger Pau Monn=C3=A9 wrote:
> On Fri, Oct 15, 2021 at 07:53:38AM +0000, Bertrand Marquis wrote:
>>> On 15 Oct 2021, at 08:44, Roger Pau Monn=C3=A9 <roger.pau@citrix.com> w=
rote:
>>> On Thu, Oct 14, 2021 at 03:49:49PM +0100, Bertrand Marquis wrote:
>>>> @@ -434,25 +420,8 @@ static int vpci_mmcfg_read(struct vcpu *v, unsign=
ed long addr,
>>>>     reg =3D vpci_mmcfg_decode_addr(mmcfg, addr, &sbdf);
>>>>     read_unlock(&d->arch.hvm.mmcfg_lock);
>>>>
>>>> -    if ( !vpci_access_allowed(reg, len) ||
>>>> -         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
>>>> -        return X86EMUL_OKAY;
>>>> -
>>>> -    /*
>>>> -     * According to the PCIe 3.1A specification:
>>>> -     *  - Configuration Reads and Writes must usually be DWORD or sma=
ller
>>>> -     *    in size.
>>>> -     *  - Because Root Complex implementations are not required to su=
pport
>>>> -     *    accesses to a RCRB that cross DW boundaries [...] software
>>>> -     *    should take care not to cause the generation of such access=
es
>>>> -     *    when accessing a RCRB unless the Root Complex will support =
the
>>>> -     *    access.
>>>> -     *  Xen however supports 8byte accesses by splitting them into tw=
o
>>>> -     *  4byte accesses.
>>>> -     */
>>>> -    *data =3D vpci_read(sbdf, reg, min(4u, len));
>>>> -    if ( len =3D=3D 8 )
>>>> -        *data |=3D (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
>>>> +    /* Ignore return code */
>>>> +    vpci_ecam_mmio_read(sbdf, reg, len, data);
>>>
>>> I think it would be better for vpci_ecam_mmio_read to just return the
>>> read value, or ~0 in case of error, at least that interface would be
>>> simpler and suitable for x86.
>>
>> I am not quite sure on this as on absolute to read ~0 is possible so the
>> caller cannot distinguish between properly reading ~0 or an access allow=
ed error.
>=20
> How do you report an access allowed error on Arm for the PCI config
> space?
>=20
> At least on x86 I don't think we currently have a way to propagate
> such errors, neither a plan to do so that I'm aware.

I have to admit I can't even think of how such a plan could look like,
give x86'es history.

Jan


