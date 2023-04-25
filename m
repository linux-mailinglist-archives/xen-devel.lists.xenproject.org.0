Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE256EDD9B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 10:05:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525832.817321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prDg3-0008HZ-KX; Tue, 25 Apr 2023 08:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525832.817321; Tue, 25 Apr 2023 08:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prDg3-0008FW-H7; Tue, 25 Apr 2023 08:05:31 +0000
Received: by outflank-mailman (input) for mailman id 525832;
 Tue, 25 Apr 2023 08:05:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1prDg3-0008FQ-01
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 08:05:31 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f183195a-e33f-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 10:05:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7958.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Tue, 25 Apr
 2023 08:05:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 08:05:27 +0000
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
X-Inumbo-ID: f183195a-e33f-11ed-b223-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJFmSlHR82JWahAdxwLlwxuXcS0pec7pEY0TMb+mGeePvU8KZnlYDEgPrfd0pH5/xO8fPnApuKqse/T1BOef+k+q2NQAAIQVsCCkDlpriHHSyKU185hqPm3NBGj6PIRQaGWytki43AC6OEfk4iI5EW1OjznqzkKR6+sgekuYgxAInIKsbWZ+9HGfrw9BLn6nc5y4K0j+8NXNTKmAUWv/aA92woaWPkUz+nvHq6XmSRkW+tLeVsdEoj57L4864XtjtCX2+zpqC3rKdiYUYyNWwQKn0wKFVWFeTBHAg6rCk+KPQ7CaHUsVvCcvcbeNC5pvrvT15qHpvl3WTWYVTbslBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7JQzoJuQeZ8Mtii+QMOp562cagWTYXdbaqZmDwPa/4=;
 b=icGXMOy9uRvDBiXlUFyw9dlHcYTTx8uUm8+MxtlBQRr/4x1tete2PUgwYcXJe8QAoe/4eJTBYn+PepZU1nyPHghYVw7qUtlCsidsyo542ONlikKUeyaX2IpaRNKhPKWIrdJ8yM0zFz4coVFfU3Tw0lVqZCF/UVnxIn+LiKN6w7OldloHs42VbXBXmyVC3Ye3nFyeDA0T+YmAOnwyGiAZddgSRPoh3FoYxwi4hCI3FW3X69x2Ri3+zhuNDFYiwtZXbsUg/HSEqlc80ffQHQ33Gkpbtl0lGlEq/Sh0hNHY8ERQxHieRSlZrFnJMovWGdddV9j6kIhc6sCCwkHsHTXL/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7JQzoJuQeZ8Mtii+QMOp562cagWTYXdbaqZmDwPa/4=;
 b=1ytRi7N7E7RajOJHh9/HyNekR7O1EBMzyncuINJjDAZlyfBhk9NyeNvjXeLwQFlZWQZ2mkWMpeXFN2gGhC/Au+cQwTsrrDXWQg44wY5s2yB2RgrgmWx+FwsCPSG+Zg/AZYGFahy3PvIaThwh+fjWJB4thZbrKCZPELmJwsdDFVQqnlRKA3QjtoDa6zE99u6pVh7/I2ciZsAB+KAScyNS/EwZWq7cbiSAzkL0qp377n4WM8ljzfqto1GgS3IK/kfrTzwYUxkFYflYlj+/69lc/qAK5n4sniEa4ZGjNokDtNJ/zbShrdaMk3BFQXiMVN1Y3Jipmrlp5x77Ne8w/kAuOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e93bd35b-42fb-3979-7e08-0d7f779e9ed1@suse.com>
Date: Tue, 25 Apr 2023 10:05:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] ns16550: enable memory decoding on MMIO-based PCI console
 card
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230424233930.129621-1-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230424233930.129621-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7958:EE_
X-MS-Office365-Filtering-Correlation-Id: ef92072c-d319-4917-0d51-08db4563d47b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8rLMtXIsc8KlEwAM1h9BYj+kaNJ5iGK39c1MkC4RP6J9Ave671TBe2vAnPdMkduLvBVu2ENIm0N2UlmDp+Hid0dSHrEo/W2OB524mZlaYm/CSsEAQKeYzN1o8EkY+nBQHMYhMGUCVNd9Mx1KDpfUxzgh0triVxIhK6iUF2lfM1TFs/zGZPAB6suN0qzsfc2YAJScNH1Eqny6uBHZZKSMwzCaQ6ioLVRW5PfujCZ3oy2SuondSgciHiBGE8z3O5lTqia2yQ2YelbvTCD+mn06yknx2gMid2Hcpu20j40atlkWtT58PyIUFjlhPtfF6Ki60MtuNv/GxRmBCeGkzO6HnmIt7/x+QZT8KRdNU+j/tE89r2m2dWoP0vb2fqWzryfUYNxpd+5LOBOn0aoAJ7XSIOxTt+Xt+5iWMPpEi8g22gI66yyyw6DjJk3umtSCKBVEFjB3M6MEMAViTL9ie+23/sBADgUUF4+TMx1T9uRx3eG749wDn4ac/qjalVJyWGCXfV9tsPNWxCPtV55lPbMs8A+hqUOIlJLeR5GTqA6mLrd1j3u644O9OU63CVwoYzw/irdHDRTOaSWluxhniban9LU5HoB7P5xQFXVI/42zz8iTvBhkY2yvPPSDGRtZPRW6D51whJmibMM6ywEI4HekKQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(396003)(136003)(346002)(39860400002)(451199021)(66899021)(54906003)(478600001)(5660300002)(8936002)(38100700002)(8676002)(36756003)(2906002)(86362001)(31696002)(66556008)(66946007)(66476007)(4326008)(6916009)(316002)(41300700001)(186003)(2616005)(31686004)(53546011)(6512007)(6506007)(26005)(6486002)(66574015)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0dpS3lYaWFsZEVsQXFmUFBZNGZsV0FQOTRmaFl4S2ZESHpSWnZuS1F0bFh4?=
 =?utf-8?B?d2FjYlNQMy9RejJJVDFnT2hXSmZ6ZC9zVDk1aTROSXhEcGJpdDNQd242cVRr?=
 =?utf-8?B?eWZNeWV5NnIyS0swYVZnRkh0Q0tQS3NCeFJnVWorT1dUUnlvOHdBRlNPWEV3?=
 =?utf-8?B?Wk1WWjhjZWFGakNJVHJBS1o4RStRbjJjVzAvYnI5Yk9qZXM5Z2FvTmlDcVQv?=
 =?utf-8?B?SU45MEMwcnJ5a1lCYmdtWWg4OVhmcWpkUVFxaFhMcUFDL01mV3B4ZEFSUVZp?=
 =?utf-8?B?NjdEcmVrQ0YyWEczNnVaK3RaODdUeGw5dVN3cHZpZ0dpWGd4ZFdkYmE5ZDky?=
 =?utf-8?B?aWg3MXI1L1kvSXpqOUhaU3BHbGtNeHI2SFk3S3Z1cDF4Rm9MNzVkMnYyYnhB?=
 =?utf-8?B?UWQ0anhyOWpWYTVXT0lUTmJoMDVBNE9MVXJaalo0Y09FNTBJQjQydk5kaG9L?=
 =?utf-8?B?MGVyV0J0OEUrcFVGZ3JPcnhXSFNkQ3liMjZ1eGZhalYrbFp3VlRObUkrNmdm?=
 =?utf-8?B?MnlXMEsyN3k3dm11WXEzVnRPeXpJZThNWWJqdW5JQTRKVHhSNHMxMEY0TWdN?=
 =?utf-8?B?VFdHNlE3NnFaNm50eTA4N09hRlpWenVFQ3FKZlVMR0JwdDZZSXhWdXFidW14?=
 =?utf-8?B?YnpucDI5VUJhZ3FDWkx2NGFPYmc5NEx5dmFwV3pPUmRhbS9VblNhV2V2Wlo1?=
 =?utf-8?B?Z0Z0K0hyZFZJb1BhVmJJaktuOWswaHZxcVpVNXpoY3ZhbzBGVEJnY2FzRVA2?=
 =?utf-8?B?UDF5N1NFVlZGdzdGcmRxT2dEdnEwYm5Hc3JSWUxxdU1PSHd5K1AwbXVoR01x?=
 =?utf-8?B?QlFkNjBwb0VVNDJoUmJ5bzhXRloxRGNWWnJ0MVF2TDRINExzVmRSNXFDRnZl?=
 =?utf-8?B?bXc5YkZoc1RGaHhVN2JZSlFLc1lMYnpTU3NUMzBzUW1JMVdXV08yQUl4cGtp?=
 =?utf-8?B?RW5adkdzMGg5b0ZvbFIwOEN1ZzVuVUZYOVpCTTFyU3QrR25kYW8xVGNrM0hH?=
 =?utf-8?B?bi94ZjVWV1RoWWF4R3Z6NlJ3em16K3NKMkpaU0ZXeGRZajJucWtzK2ZmYnZO?=
 =?utf-8?B?WmQ4REdMMmhNNktRWHoyRHlLSTBBRlZKamcxMHJ1OVF4SkpyK053a0NPcUJ4?=
 =?utf-8?B?dTlhZXJKZm9WRUhZNEU2VjRwQUNVSFpVRDduY1JPamJ5dkphNEZrT1ZMSGxh?=
 =?utf-8?B?djJxb2xJWEplUnRGeFhRUjlqTHNUdkVWTyt1R0VzVjFiOHNBOE5DejJkejFz?=
 =?utf-8?B?dnY5MXBydGZiSDROZkQ1SmxiWG1oZWRTcUNPdlhnTEJCRGg5UnlmajdRaVl2?=
 =?utf-8?B?NzY4Y09tMklXbjh4ZTFMSnFpUGcxeG5iRnRZd3JZaXU2TFpqaDZDQTJ6Yngr?=
 =?utf-8?B?RERuNnBaQ3ZGS2ZaYUNsUmpQTXNJRjg4WEhxYnR1TFRjS21KU282VVhublJv?=
 =?utf-8?B?M0RXZWNuTEswanlsWStKamE4Qms4YjgzejBJaHVyVmVkOHZxemVXYWQxSkQ1?=
 =?utf-8?B?TEJwU055RUVoMEludXFXRG1pSXFpWU8xcTd4cXFyM3IyOE5URCtDK3JXY2dQ?=
 =?utf-8?B?M0FBNjVWTGN3ek1CQ09Kd292OTZsejRDMG9yU0ttZ1NpUFFha1lEYzBuQTlJ?=
 =?utf-8?B?SXJmNkpkTGM5eE80c1Zka0xyRXBFVnU0RE42Z3YvWk9yMElKc1dNOEU0UFQr?=
 =?utf-8?B?REdSZGNmZ1ZPNy9uVWNEaGpKNVNuaklmQ1FqVFBIMUEwcTVSN1VkMDc0VUFa?=
 =?utf-8?B?eUthSCs3c0JwdXpTSzJxVW1xMlBwZnJkSEZpb3ZCKy9DN0JJODRuQmJ2cjVD?=
 =?utf-8?B?QWxpdzNRczJqNUpzbDc5ajhCMWlNTWZXNVM3c2tRYWlCTzJTVHpkMFk3RDZ4?=
 =?utf-8?B?SkZ0cmFwS0h1aXR1dFhteDREQzd4SWxBQnpPYjNkcDFOUDZGLzlCZjRSNjMw?=
 =?utf-8?B?YzgvaXVYYk1zektwdlZlMnljQjdEM3NOTXY4SkUvcG9MYm1CUlZGOThOUmhG?=
 =?utf-8?B?ckpubEtBbXJSWTdDQXFMcjRKMHltcWVISlppNklOZ3MwZU1temllTHlEbXlm?=
 =?utf-8?B?TU9oRjhMTHhKRUlnc3ZIcWZ3WTRRMVpEN2twN2k0TzZaeDg3WHFVWWlXWkZK?=
 =?utf-8?Q?4KyZe+rPHR6BJ51aVx+5wlwC8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef92072c-d319-4917-0d51-08db4563d47b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 08:05:27.3597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zZ2Byq7DcmTLnkXCJBAnYB63zpeNsfeepGcVRmFRt5romYZGRD0ns0vW+nIbfTfFgsiRqw73LPW9J10JmM4osg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7958

On 25.04.2023 01:39, Marek Marczykowski-Górecki wrote:
> pci_serial_early_init() enables PCI_COMMAND_IO for IO-based UART
> devices, do similar with PCI_COMMAND_MEMORY for MMIO-based UART devices.

While I agree that something like this is needed (and in fact I have been
wondering more than once why this wasn't there), what you say above isn't
really correct imo: You do not really make things similar to port-based
handling. For one you don't respect uart->pb_bdf_enable. And then you also
don't write the BAR. When you use the BDF form of com<N>=, I don't see how
else the BAR could be written to the value that you (necessarily) have to
also specify on the command line. As said on Matrix, using the "pci"
sub-option together with the BDF one isn't intended (and would probably
better be rejected), according to all I can tell. Which in turn means that
for the "pci" sub-option alone to also have the effect of - if necessary -
enabling I/O or memory decoding, a further adjustment would be needed
(because merely keying this to uart->ps_bdf_enable then isn't enough). I
guess like e.g. ns16550_init_postirq() you'd want to also check uart->bar.

That said, I'm not meaning to mandate you to particularly deal with the
bridge part of the setup, not the least because I consider bogus what we
have. But you should at least mention in the description what you leave
untouched (and hence dissimilar to port-based handling).

As to rejecting invalid combinations of sub-options: See e.g. the dev_set
variable in parse_namevalue_pairs(). That's a wee attempt to go in the
intended direction.

Jan

> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -272,9 +272,17 @@ static int cf_check ns16550_getc(struct serial_port *port, char *pc)
>  static void pci_serial_early_init(struct ns16550 *uart)
>  {
>  #ifdef NS16550_PCI
> -    if ( !uart->ps_bdf_enable || uart->io_base >= 0x10000 )
> +    if ( !uart->ps_bdf_enable )
>          return;
>  
> +    if ( uart->io_base >= 0x10000 )
> +    {
> +        pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
> +                                  uart->ps_bdf[2]),
> +                         PCI_COMMAND, PCI_COMMAND_MEMORY);
> +        return;
> +    }
> +
>      if ( uart->pb_bdf_enable )
>          pci_conf_write16(PCI_SBDF(0, uart->pb_bdf[0], uart->pb_bdf[1],
>                                    uart->pb_bdf[2]),


