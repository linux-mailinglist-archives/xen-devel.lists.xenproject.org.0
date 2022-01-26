Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 039BE49CF43
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 17:10:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261001.451448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCkrz-0001IW-5g; Wed, 26 Jan 2022 16:10:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261001.451448; Wed, 26 Jan 2022 16:10:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCkrz-0001F0-0o; Wed, 26 Jan 2022 16:10:03 +0000
Received: by outflank-mailman (input) for mailman id 261001;
 Wed, 26 Jan 2022 16:10:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCkrx-00012x-Pk
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 16:10:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69c4cd73-7ec2-11ec-8eb8-a37418f5ba1a;
 Wed, 26 Jan 2022 17:10:00 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2058.outbound.protection.outlook.com [104.47.4.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-RrSvbPC6PhOqJMU2SxvuJw-1; Wed, 26 Jan 2022 17:09:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4661.eurprd04.prod.outlook.com (2603:10a6:20b:18::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 16:09:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 16:09:57 +0000
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
X-Inumbo-ID: 69c4cd73-7ec2-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643213400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cXolN/SxCM3oIZ3juuu2jb480Reg2M5TA+W5vPslNuM=;
	b=WYMc5xQXKthBCmulI8SUnGGyhn2EhPRH2Y0J5kZDTTLn70PxWtk3fm45aGuhUxGkWy3TCo
	e16NCXhuruGBBlIjKeXpNqi/YU3S+OoCQmYKtaBzbr3bxAFQbrHhg5QZ7UL/Te5xAqIfWG
	gqEhmAZbxpRW+fQhhgupvBbdIhY6PCo=
X-MC-Unique: RrSvbPC6PhOqJMU2SxvuJw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XifWNigV2Z9FyzNOU6PxTUSEBEMlro11PJRcaqK6Zksz/L4n6mrOi1nxGPP2//q0kuqTE1amzVnGUE/Xw3iLmcHNlDmDsj24DhEo+gHOyZD+sXGyZEIuTmbkHV6u+A8i9DLAim6JN9fTgX+mnb6hr5u+g10923SozJWpnjWJPHTnezW789NxuavNGYlxsyt+ZjBlnSvmhD/l1pMFQcBX2BinSahuPYF2FfKNmrATfx0kjjIj8+RFK/xktJVU3L4GIpWPuGJILVwxiw4qmbXwfAafx6l1ZzM+gPOOtZdHW/HeNN1RMjXbwCvoRJzIv6826mjFCaKUZ884a4IQvbbcMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0X2Fs5FIItK1brESSdlpvADRiP4VXsgO3Ryq0xoLQ7s=;
 b=HIU9bdHrvZqWvIbHvMm6+wt7ViPbzgK9PTUw3ortIW3azcAVzpHJ6ZssnBAnrXY8RFVjxYoiUP9KV+wv72To3EPJz0IxWQf37QGbsXMljzwlAlgemeLroHKroXokf1/TL7Zs0gCUGquFCd/XhgPcHzJnONqe0EvECVERAsO52MP/yHwQSnZMTOd3O4N+o5k8OKpL0gi1NChCyrGkKTaaIZnqn4Ed/9lNK7IxUlkqQuvYu9m+a3sKMnOQCfpzxGA2NLroV8KqbVawCwtb0hJdEc939yV89zTFPaCczXugWs2Wc3ZHFSLKeRnH3DY5Acsn2PjwlY1OmxFXdgtqwAtsTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <00d0be87-b5b2-b713-661b-eb07e5a5a53b@suse.com>
Date: Wed, 26 Jan 2022 17:09:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RFC] xen/pci: detect when BARs overlap RAM
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20220126122648.52275-1-roger.pau@citrix.com>
 <8537763d-2601-4092-f70f-1abbdd0a211f@suse.com>
 <YfFshcEanUtXUlK3@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YfFshcEanUtXUlK3@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0138.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c10c05a-9eec-41a6-a495-08d9e0e64c27
X-MS-TrafficTypeDiagnostic: AM6PR04MB4661:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4661B67312403DC066C2A6CEB3209@AM6PR04MB4661.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/OP0XSq72fHtPqcAwY4TftcFHCUb1va3yw50GUjdw4gWLabUyN5Z3MrWmWvJc7PYXD8IiE5vLGwQbrjWN9ZwzF/QAsVb5VyFU7dveGKf1EhTcfj2uNExXUjqPqxII/gbufmZlxSJGhxSjW4xULPLO5ZkaesWkPIWexvcBWw7nEAf6t6gWjUdOs6LK+Z7+bGbBhR3DUYt2RZMP52cUdkloKRJaf2O2KTYKDhOLIE78X1rn9OrecqVitvaVYU03M10lmaR+TtIV1sWwMwJ+quV6pMENI3IzCwyt5RF0fr5Z+PSjZgrg5Y/inJWGHvkN9z+rhRwlsvmVP/OfLCG/KcZSIN3cDfOnPrjTLCOcfV1qsiGmLq1TcBlrgFk2ZBRAjv2W8sk0PchFa+mIZNZ5/dCjrxLS8zl7JfeY4dqoX1PqlPiHRCwfqy2OKBBzQ86To/NhsoLw+vBlJHQs29IVySb9wWQY2FtffS1qCd8KAL9IxQZr4LH24o0keDSpPovFmztjWIWNECKtgNdRREXNR7i79sX+EePREoFWKVoQX1JUzFRMhGw7FLiOpBYaT1vt1rpzGctaeui+IYJuT3iiCfHMEK+DZ1ntUoHYXJJ1uqocsEYLIIQkjFPYMZWZf8SMaa+gHp6Ws638MUsZwglUk3U6W8oiKpiMD7/foAeuO7fU7SAYi+6i7JCiMNUtBje8cmnx8OVAabx6udMkJVrPVSTIMNvldrW+qihj4FONUdeC70fZ4umfDCmXidl4hodBWb/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(66556008)(4326008)(66476007)(8936002)(31696002)(31686004)(7416002)(86362001)(5660300002)(54906003)(508600001)(6486002)(6916009)(316002)(38100700002)(2906002)(26005)(8676002)(2616005)(36756003)(186003)(83380400001)(6512007)(6506007)(53546011)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bx5TkPPwmwFOzwlHOhKpGo9F+0dnNeX6yRDGxCJLtPlje+/C29zQMDGZeeXP?=
 =?us-ascii?Q?A0sDHw1+EbsUQAjEl/1IdDps9sQ238en4y/oeKS4QDPz3TAbnPoC0UOOZ2q/?=
 =?us-ascii?Q?IBq2T42yKNJ27/9UFq9MBt3B9A11XEgQsZDxjFXsL3zTuplj3OzCCtO5NvUT?=
 =?us-ascii?Q?hZuaPzi/vfUx6Xq5G85gXmtjSw/yWEa9sZ22W9yWK99x55uYrHTQHseLu7ab?=
 =?us-ascii?Q?yltc1Spxq/VOoq9WhgUP+qNbZBkttsBGvV2kL6TPnbgPCyQlLMofrsVIMaNE?=
 =?us-ascii?Q?cXmatmM51CDKEpfQpxyAcKJd6Utmhk5gePRvck3LNLUKoQ9hGObjNWDw1CsB?=
 =?us-ascii?Q?S3duzUjFcW0dbD45oaHwBwPNkKTnGY/E88NsMtvmmiDzjID2R1oQNCrAHw5M?=
 =?us-ascii?Q?WZUTM+nV61E0MUDhgDSqPBp6cih5iDd8PDjJUShbMW2M2u4Nq7UiuYtFGbYa?=
 =?us-ascii?Q?DSW3iQOCujbCUdrJ2gWG/45vbrMZpcDyXyxW9c7lp0i8z0AhwmDN2frU+s6j?=
 =?us-ascii?Q?vdziJQDVFXriEgcek5HwuP2ZIKOfrnbX8vOkumyH6FyJ/h0weeHVZSG4c6B9?=
 =?us-ascii?Q?pnUhaB3Uerp+ixHoACU0DXUKOj9cO3ZgycOPwgwTQu3MGQS3fiG7PEFiQZ7w?=
 =?us-ascii?Q?ywTmqtJFRt/AsTNtNyOS4m8bzYJGVx7ULTFxvpIuhalXAXZvdFvJ60rnHvjx?=
 =?us-ascii?Q?vxrt6O7rE7xNhBO/E53WMj/HfB441+jYhT5OipMvH/zYpgEYxlXJWyNzEr4d?=
 =?us-ascii?Q?iaZe7N4u5oblCbBBfzNoBi2MYyBMa7sEmMvH+zIeSsK+tqVRGjqOc4mdeE6y?=
 =?us-ascii?Q?YSptDLQFGUVONev/curkX9qoNrrD9soRVeKL4LFRoYT3wXY5iFxxTi4tZq7J?=
 =?us-ascii?Q?x1Bk1De9vEzbjQKuEu7tizPXGk5y8dgm74IxZGq4QxPX1HRbcY436ZSH4uxR?=
 =?us-ascii?Q?5F2ZTWLl+eATX2U5FOOb83IBVtndKOVqm2YiuuLs6EkZSdm3gtvd8mx2SV4H?=
 =?us-ascii?Q?Kbn1nFMTel6Z0wqqO1pnbYbEmaXGUrV5/ULicSUWFD/kMJxeA6XTHcnZp85Z?=
 =?us-ascii?Q?llFuRjBlztzFJi1hzE8kY+ZXgyLGIYb/M8B2UbNq8rpsIgqnVIztrVz4A740?=
 =?us-ascii?Q?vBVoSbOCaODh+q1k03O4u6pRnjtyYrXDpLDaoWTooBxVMvJ5LwTObDZLHz9C?=
 =?us-ascii?Q?ckDlIpe3KIlYTLv2T9dY3F22F8UmHjI/miaxxF5R6mo5NdFTP0U+fRfkwlf9?=
 =?us-ascii?Q?BWwOh8YbeB0v8M9JczPoOY1w2IIFoKEaXGgiX8ltt9OggsbPKbYxPNjH6xHp?=
 =?us-ascii?Q?7oXHWTVLEhy/M9G5jdRJxmLxlddmrZbHbm33szbOYfNhY5nf/HVl0muuVlir?=
 =?us-ascii?Q?fWZMYHm5+zPAHrmbSSESfwFXIVvLPSHrGyD3j7hStdL0zfFRZtzZ+RIDWFzr?=
 =?us-ascii?Q?xzidYuEcwuPX13voXdSfvXruNa85nRXrIGx9TTJgBpEsPowjbp07szPVZ33i?=
 =?us-ascii?Q?wgtmoOO9Ikob1gZEBU9UIgWn/eir/BtCgaeUN2h93hRVS1f1SnSc92THEuNP?=
 =?us-ascii?Q?mPCA9Wj2O+zI4HjJhwjUR7ZIa5U0UpCnE0vrdnDb8tYubiHOVfE+nXjBmoWi?=
 =?us-ascii?Q?47Cj8sermCbcXIUcxfFXF2U=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c10c05a-9eec-41a6-a495-08d9e0e64c27
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 16:09:57.7058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Nxga3YvRICmiHjHl1JXfKJhCw4bAVzS0t7nC2Vsj/EsjXT/GUNKzaCc4MnnqVY2YfCXN33gt6/5qgu3o5iUDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4661

On 26.01.2022 16:45, Roger Pau Monn=C3=A9 wrote:
> On Wed, Jan 26, 2022 at 03:08:28PM +0100, Jan Beulich wrote:
>> On 26.01.2022 13:26, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -479,6 +479,26 @@ unsigned int page_get_ram_type(mfn_t mfn)
>>>      return type ?: RAM_TYPE_UNKNOWN;
>>>  }
>>> =20
>>> +bool is_iomem_range(uint64_t start, uint64_t size)
>>
>> Might be nice to have this sit next it is_iomem_page(). And wouldn't
>> at least "start" better be paddr_t?
>=20
> (paddr_t, size_t) would be better, but AFAICT size_t can be an
> unsigned long and on Arm32 that won't be suitable for holding a 64bit
> BAR size.

Indeed. We'd need a resource_size_t or alike.

>>> +{
>>> +    unsigned int i;
>>> +
>>> +    for ( i =3D 0; i < e820.nr_map; i++ )
>>> +    {
>>> +        struct e820entry *entry =3D &e820.map[i];
>>
>> const?
>>
>>> +        if ( entry->type !=3D E820_RAM && entry->type !=3D E820_ACPI &=
&
>>> +             entry->type !=3D E820_NVS )
>>> +            continue;
>>
>> I think UNUSABLE also needs checking for here. Even further, it might
>> be best to reject any range overlapping an E820 entry, since colliding
>> with a RESERVED one could mean an overlap with e.g. MMCFG space.
>=20
> Hm, I've though about adding UNUSABLE and RESERVED (and should have
> added a note about this), but that might be too restrictive.

Why (other than because of firmware bugs)?

>>> +        if ( size && !is_iomem_range(addr, size) )
>>> +        {
>>> +            /*
>>> +             * Return without enabling memory decoding if BAR overlaps=
 with
>>> +             * RAM region.
>>> +             */
>>> +            printk(XENLOG_WARNING
>>> +                   "%pp: disabled: BAR%u [%" PRIx64 ", %" PRIx64
>>> +                   ") overlaps with RAM\n",
>>
>> Mentioning "RAM" in comment and log message is potentially misleading
>> when considering what other types get also checked (irrespective of my
>> earlier comment). (Ftaod I don't mind the title using "RAM".)
>=20
> Would the message below be better?
>=20
> "%pp disabled: BAR%u [%" PRIx64 ", %" PRIx64 ") overlap detected\n"

This or maybe

"%pp disabled: BAR%u [%" PRIx64 ", %" PRIx64 ") overlaps with memory map\n"

in particular if, on x86, we'd be checking for any E820 entry type.

>>> @@ -399,8 +465,8 @@ static struct pci_dev *alloc_pdev(struct pci_seg *p=
seg, u8 bus, u8 devfn)
>>>              break;
>>>      }
>>> =20
>>> -    check_pdev(pdev);
>>>      apply_quirks(pdev);
>>> +    check_pdev(pdev);
>>
>> I can't find the description say anything about this re-ordering. What's
>> the deal here?
>=20
> Should have mentioned: this is required so that ignore_bars is set
> prior to calling check_pdev.

Ah, I see. Makes sense, but indeed wants mentioning.

Jan


