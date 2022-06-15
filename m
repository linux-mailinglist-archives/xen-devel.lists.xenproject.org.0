Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB50354CB8D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 16:40:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350197.576464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1UCJ-00028A-OQ; Wed, 15 Jun 2022 14:40:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350197.576464; Wed, 15 Jun 2022 14:40:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1UCJ-00024y-LR; Wed, 15 Jun 2022 14:40:43 +0000
Received: by outflank-mailman (input) for mailman id 350197;
 Wed, 15 Jun 2022 14:40:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o1UCJ-00024S-2e
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 14:40:43 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 218793f5-ecb9-11ec-ab14-113154c10af9;
 Wed, 15 Jun 2022 16:40:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8494.eurprd04.prod.outlook.com (2603:10a6:10:2c6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.21; Wed, 15 Jun
 2022 14:40:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 14:40:37 +0000
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
X-Inumbo-ID: 218793f5-ecb9-11ec-ab14-113154c10af9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n23jeP8Ge5yuVWYyMlmHFSjYHcRSCTExbzp1LO0A9YBYxwxZ34xrHt6Cy5+uudJUgwuJiUluWg5/bWSxZNaAWF+kTzFH3dYLJQet9iTK1I1OpzdZMYcenolc0uMmGstasQwjZWI3Yh2zFQNgraCnDqMJFSjrec+cXZ9k0wYGLNbwn7vdCfDIhZH5f0nx0wfRiFVCpv+b1APdWMojsbp8iTFila+IIc+lN9smQuv02BzK+vNZLCTDzRk5zYkaUDPTcYLLz6Bv/wVe4z/zfzL9IXVaflIFzwGPxJJdyqxHX1my0DjBypMU8T8uEMSlyOj5aIVrd7CAccJYITwzoLJvjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rj3fmlDvxl/e0346b/nVu82P4DRX6tiS7rI/NcjekSE=;
 b=GYHrzmZQXeTw5+IRIUHbVqVNAWHSq3rPT95z5yyVqhpHpJChzbXFXnPE8orkdQSxZpKRIvv6jM7/0vPERBrHrNKmLPP54n3XuK54gxryQOzpYz6Cp9ePaPFJUVzlu+KE8pTF+172ArdBrN2fvIbvU43Zh7SmWexLaNc5MvRSCp+QXQibqiimHInwi5t798KBwVt9w/iCE0Q5ibnH4XV5lodzHgGkSbc/nyPQSxtrAQtqQaJTTrKv9h9PaTn9t2GCzLvzEvIsFQpLAB+AMPRSN6EJOCtz4S+URqkTdSlO5dX2rLkh82K8bmkOcROKtnvE/BIS+6GXPJFhBhXvHbatyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rj3fmlDvxl/e0346b/nVu82P4DRX6tiS7rI/NcjekSE=;
 b=3NuMxV8SQFSe4/nlp7pgJsAwn8To+0uNxjQkilxVa4zyw5XjrdoiKOTurs/3qTQMd/4Dd3Lz4GG1wYdfqqnN4C29rHXfeXb0NhESEfPHdnZSeFmaNazTi+Wdt1ODK9+znJBvTNmIJKbtc4W6yfDCs+LrxJ5a38c88kHmHTrC5CFsU5KFCHWKwuP9hmPE5IghBG4pbwOau2iBk1xYTleWOXloQdRqBTnGftmAVBCl+b+fmic58QsIht8xkf6Qc/ZvFB54R6clXWPTZE3e4WSaO4swUZMEqwZ/X34dgyIr+S/SRArE3SAzAE6SVCk/q+Y3QVtUIJJcyncD4mQ4vD1frw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8eb0dfcb-4df2-f447-9ac9-235881d496ce@suse.com>
Date: Wed, 15 Jun 2022 16:40:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 03/10] xue: add support for selecting specific xhci
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
 <b5466e495943210adc48c754df98862ae49ee489.1654612169.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b5466e495943210adc48c754df98862ae49ee489.1654612169.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0358.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b88c8b7-040f-4f05-d005-08da4edd031a
X-MS-TrafficTypeDiagnostic: DB9PR04MB8494:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB84941C3A1F6D247FBC8076A2B3AD9@DB9PR04MB8494.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DLgEmMjEOp7mbuZN53nLdvv+XKztPDYAxHm+s2+M2k889Ulhv2c+XCpewK34Kxa8h8B52lzvbHz5wrddmXvhUlXbBEYZ3U7kEHM/MK9MmkNLB0AHFLvjY6ot7QfKklWhQc/bpzluJlLhJFSl0Za1ypWWPh/pxebq0YO+SET4pZL00JIXQF+/JlPE6V1zprcQue116kguL01e+ysG4vHS1pa8TxqJ+4VyF0T60/xJlzJuq9+RqX2NqDcfBJOYqwE6AbKL0ABVlsQkd9eOPZ7xhEtZalrtMxUtjjDR/gPxF/d1mdCQ4VOrQJybaJ5ZSmUrUVpH5zwd6P0UELuytGta1lMI8n760w5rRpKXK5ptjnwbWUfFGPEOlzxLKfmBXGWjWGHO297CW23rUca63AggPWjx5quRO9/aLKPjE8FgkLYD2JTCu58/GyqobPcW7m/NwVU8hBca9pCi27X6ZqBBfLu30Ep0eVhyKbxh543R+aziKZcL8jAF2dnoERCESmPWXs1YWSmzpTBBGHoeNi/x9Chywe2lwlZKPeCniexir4hNeoBqmr9VHnLifTJpzlEH9b9vtwwXKxd2dIeITR2+ecsDLGWzE8ksAs3dJ7Bpx1h4wSW7ZpGDNT4NKF8E3t073sM46h2j/IqaUiRGS0tCGGbwzEbu97lbZI3LMiZkE5jdn3208W9yM+cOBU5k+w4jH9/XXHhiqOG8rNVVKyXgtx9omKvj+Ts+lGquoClNIP21TS+0KfoI+VfbfRKf3kgh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(31696002)(86362001)(26005)(6512007)(53546011)(38100700002)(186003)(2906002)(36756003)(66476007)(2616005)(6506007)(5660300002)(54906003)(6916009)(66556008)(4326008)(8936002)(8676002)(66946007)(6486002)(508600001)(31686004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjNlWmtTaHFUVk42TUs0dCt3QkRpbGNPKzNjUHBYZ3FML01ab1kxd0Y0N0lT?=
 =?utf-8?B?b29UTUMzRzBkclU3YTJCdzlpY01tK3E0Y3VpSzNtM3VIVjdLYzVoUllET3k0?=
 =?utf-8?B?dXBQd2t1UUdnc1haWlhjS05IVEJPRGVodnUzZlVVQW5abXA5d0hEYnZoMWJh?=
 =?utf-8?B?cFB0UnIzcWJ2R09FZ1BXZ2RSTkxtL00yQUttd1d0YiswVlg0bS82WWV6NXhv?=
 =?utf-8?B?VzdaWTB0WHoxUTRGbW1qc0lBWmZNalBxNTA3cDQyZGRxT01nMlVBUHdndEFa?=
 =?utf-8?B?eHVWdWp6Nm9qWGpicjR0LzNZVDhkSHhEeC9LdDVKTHlTV0J5NGhyb1M5Uk91?=
 =?utf-8?B?TEJZRGhBbmpQeGthekRBM2ZvZno4L3dKelV0d1Bid0Ewd0NzOHMzS0lMaEVa?=
 =?utf-8?B?SHd1TzdDV0tYaGk3SnVFeTdQdktGaWpGb0UwVFBJaXpkbERQcVl4Y2M4aUFv?=
 =?utf-8?B?RmJWWVhLV2hwdW9uVW9EaElMQ1dNUDlLMHZESWtENCtoNWk3aElSNVBFQTVQ?=
 =?utf-8?B?OXlSOFVnaUx3RSt5SVhJaDZWR2lFcW9yWCtzbldUeXloRzVQVVJ5KzJVcmFM?=
 =?utf-8?B?NENRMjRUdFVhWTZVUHdST3VkU1cwNGEvb3NhdURDa3FUU2JDS0FDWWJ5K0cz?=
 =?utf-8?B?c1U3alovYW9xRVhiTlNWZzIwd1RvWUc3K1ZTNktVWXprRkhyak5IOEZpeS9U?=
 =?utf-8?B?YVhiU0pJY0NVSENqQnJrS2dBdnR6ZE91cFBsUmQwMXdPaStkekpMN0dIS3BB?=
 =?utf-8?B?WmNka2lRU1Y1Qk9nN1FhdG94dkpqajZ0RWxTTFprT0l0Y1ZvYUFKRXgrelF2?=
 =?utf-8?B?MFlHbVpTQTVUVUpkd1BDS090YnhJYnltalBTTVVYTDc0MG82RjQzd0Z6WTVX?=
 =?utf-8?B?UGJYMzkrbDRLU2gvSU9aS2l0aEFxL2RBUVJURGN0YzNKWTRLcjNGTkRyckk1?=
 =?utf-8?B?UkNaYTY3Ym5Uem96a290Yk5CN2c4dkJGQVdUNzdSUXFjWC9BenFtQVJWV0gw?=
 =?utf-8?B?NjREZjRaNDZRVEV5akRVcmRTdXRFa21sZjZyUVZiUjZXRDdHMUd2Nk1yNEl6?=
 =?utf-8?B?VXBUYXhZTGsxMElKZXlZUUZJVGlNSWNEeTVaR2Y0MFh6VG11UndKQVNORlox?=
 =?utf-8?B?TlZaMnI0RlJmalNyRWRUVDlZVkVIUnNzV2dqRXlNTmRyMk1NYU9QbU5ic3Fm?=
 =?utf-8?B?K2tBa3dGVExZem1wWTZrbktOOEROUTZHNzVXTFVoeUdzRXdFbEo5b0cxUElP?=
 =?utf-8?B?VVViaG1RL1VLMERDcXBZYWZBRGhFeUJNSHFIYnJYelNoUk9YM2tOWFU4d3Jh?=
 =?utf-8?B?Q2o2R2lhTytlN0RGTzNUOU1rRVVXWUZmT3JRM3pwa1FxTW03WVcxODBFOWMv?=
 =?utf-8?B?SHdUVWI2M3Rhb3h4SnhlR2hMd25tQjJYaUgwbXFSYmNjeC90ZlRtU3VqemhL?=
 =?utf-8?B?ZkwwL1dmdVYrQ1N5a1d5ajFKVndveGJzQ2o2NWNyZTM3RmZvN1VnSDZmRVUw?=
 =?utf-8?B?S04rZGZUaWxCZ1B4d2FyTC9Od3VDak4wTUR5WWJYaUpVWkJYOXVlSjduT2NQ?=
 =?utf-8?B?bW9GTFNGTlBKSUVZTURXcnN5UHVqWXMyNTJrN09GRk9aMk4vNkN3allzV0J5?=
 =?utf-8?B?SGhkSEZKTEp1dGZibnRPUHh4TDBkMW9JQnpDZ3gxVjJ5d252MWNyeGlvRUlv?=
 =?utf-8?B?cEtxMG50QnV6YkU0MWhLTGUxcGc2dmZLMDJUUW9RZHhka1NmV0V5Y2ZMOGFJ?=
 =?utf-8?B?U3JrTlNQVWY3dmVmTGJsRUNjZ09wT2V3TUF1K2RIMlNqYWQ4TnQ1OXR3MlY3?=
 =?utf-8?B?azVGd3hjTUdjV01TeWl6anZFRURtQmg3QXFLNWtnNHNxWktta0dpTzlrTFMz?=
 =?utf-8?B?YWh6VUo1VlF2cCs5dHdOa3NUYm1ZVlZYV3J6ZDlNSm1xMWRMb2VmZ2NRa1J6?=
 =?utf-8?B?TGlZSGVqWnlWbkl2dG9qT3A3YVJ3YUdwckcyYlRIay9iYXBNWC9JK29iNXF2?=
 =?utf-8?B?RDFZZHJpbXpUQTFQRGdEbG5pTmVrMFFvTS9wYjdVVUpETEJ2MzRZSzlQNXVk?=
 =?utf-8?B?cGdZUzB1bVJaOTMrOE92S1p2cXdGWkJWR2FZUWJVanhSbnlOcmp0dTY5Q25J?=
 =?utf-8?B?OXNxUm9PWjBsbWd1djNsaThSSmlIQnZGUllQTldwNitpVzZyWCtyQmoyK0po?=
 =?utf-8?B?NlFmZUI5OVAwQUpOQ21QaUdDeXRkS0N3NVhrSkVlYmRMaWZycEhyUmxwMGlW?=
 =?utf-8?B?UGZvbFBDbjBwSDJ6VG1wdDBjblNMMU9oODYzQ3FWeEdUV3RQSVg4dzNaRUZI?=
 =?utf-8?B?anh4VFNYSUgwM1JrNjFlQ0dZQ3RIM2sxRmdDSTZJRG1HVkhVU3BUQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b88c8b7-040f-4f05-d005-08da4edd031a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 14:40:37.7549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QVJloHUQrVWVSUlM1AhBMYdCkXCWolhUin3SRCkjDpKHe/gZXkSo9jz2qD/nDHdZLcKj7boGnGs3rpR3V6Kgig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8494

On 07.06.2022 16:30, Marek Marczykowski-Górecki wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -721,10 +721,15 @@ Available alternatives, with their meaning, are:
>  
>  ### dbgp
>  > `= ehci[ <integer> | @pci<bus>:<slot>.<func> ]`
> +> `= xue[ <integer> | @pci<bus>:<slot>.<func> ]`
>  
>  Specify the USB controller to use, either by instance number (when going
>  over the PCI busses sequentially) or by PCI device (must be on segment 0).
>  
> +Use `ehci` for EHCI debug port, use `xue` for XHCI debug capability.

Ah, this answers one of my questions on patch 1. But I still think
the option should appear here in patch 1, with this patch extending
it (and its doc).

> --- a/xen/drivers/char/xue.c
> +++ b/xen/drivers/char/xue.c
> @@ -204,6 +204,7 @@ struct xue {
>      void *xhc_mmio;
>  
>      int open;
> +    int xhc_num; /* look for n-th xhc */

unsigned int?

> @@ -252,24 +253,34 @@ static int xue_init_xhc(struct xue *xue)
>      uint64_t bar1;
>      uint64_t devfn;
>  
> -    /*
> -     * Search PCI bus 0 for the xHC. All the host controllers supported so far
> -     * are part of the chipset and are on bus 0.
> -     */
> -    for ( devfn = 0; devfn < 256; devfn++ ) {
> -        uint32_t dev = (devfn & 0xF8) >> 3;
> -        uint32_t fun = devfn & 0x07;
> -        pci_sbdf_t sbdf = PCI_SBDF(0, dev, fun);
> -        uint32_t hdr = pci_conf_read8(sbdf, PCI_HEADER_TYPE);
> -
> -        if ( hdr == 0 || hdr == 0x80 )
> +    if ( xue->sbdf.sbdf == 0 )
> +    {
> +        /*
> +         * Search PCI bus 0 for the xHC. All the host controllers supported so far
> +         * are part of the chipset and are on bus 0.
> +         */
> +        for ( devfn = 0; devfn < 256; devfn++ )
>          {
> -            if ( (pci_conf_read32(sbdf, PCI_CLASS_REVISION) >> 8) == XUE_XHC_CLASSC )
> +            uint32_t dev = (devfn & 0xF8) >> 3;
> +            uint32_t fun = devfn & 0x07;
> +            pci_sbdf_t sbdf = PCI_SBDF(0, dev, fun);
> +            uint32_t hdr = pci_conf_read8(sbdf, PCI_HEADER_TYPE);
> +
> +            if ( hdr == 0 || hdr == 0x80 )
>              {
> -                xue->sbdf = sbdf;
> -                break;
> +                if ( (pci_conf_read32(sbdf, PCI_CLASS_REVISION) >> 8) == XUE_XHC_CLASSC )
> +                {
> +                    if ( xue->xhc_num-- )
> +                        continue;
> +                    xue->sbdf = sbdf;
> +                    break;
> +                }
>              }
>          }
> +    } else {

Nit:

    }
    else
    {

Jan

