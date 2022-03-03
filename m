Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 498694CC32E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 17:48:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283562.482627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPocO-0003Vz-Fm; Thu, 03 Mar 2022 16:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283562.482627; Thu, 03 Mar 2022 16:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPocO-0003Sm-CM; Thu, 03 Mar 2022 16:47:56 +0000
Received: by outflank-mailman (input) for mailman id 283562;
 Thu, 03 Mar 2022 16:47:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPocM-0003Sg-I3
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 16:47:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab1ed16d-9b11-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 17:47:53 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2054.outbound.protection.outlook.com [104.47.8.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-oAuDd0A4NJiJnBLhHtnCog-1; Thu, 03 Mar 2022 17:47:51 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR0402MB3554.eurprd04.prod.outlook.com (2603:10a6:208:1e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 16:47:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 16:47:50 +0000
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
X-Inumbo-ID: ab1ed16d-9b11-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646326072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1txL8oqdo3qklpwPLNQCZjr0HvUSAQAWmmZ2cmrh+mY=;
	b=N7bkmFFJPVYMOC2BT28sD9lCL2sn9MIKxLsxFf4YDqiYYaducJAR6M1Bw2xiT3WmzQ8+i9
	XrrHzjuU/mDquDNQg17Jg9Rc06HPdT7Prou6dHAudj0ungFwoRpfGxtazCXNrVuw6L8InF
	gQRq1yhhj+Ot8d4aNlBmzFF+Cv1+gxU=
X-MC-Unique: oAuDd0A4NJiJnBLhHtnCog-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNhaOyJYtTehCdrVHWHs1YyMVVoSUQpvdkFImboL7VxqgQxDatboNJoJEPhWcGsXSJwyyxBvb9QhsMYkH1m/xKhdCg2xah2WlY7Ukf1UtAsQMyKlUQKOvs7C288X7RM7mvIzpKWTIln6HGR3F3+YBsAoYGCI6UcQ/aH0E8J2kSPkUE3N6Uq5xaaFU4uWtJWBQiO5PyxzXfqpG02xtSb35/UuGgXaujPHWz2sHXjZO+/XS9RwkRFz/HtQLJUvVE37JvssSA2kNvBYoDgR7Xyja/V8FK5yz3wESFjQjWWteZfPR5XSGRhHsAfMPA93O6pjf4Y6c8rCCMNDp2jGkX6T3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1txL8oqdo3qklpwPLNQCZjr0HvUSAQAWmmZ2cmrh+mY=;
 b=lbaRJxofXdB92ixVMRPgsduLSm7G2ejqspiqk/bHj6VAw3T/4inbRJODGdN62ToF2dKEuk98JAiKgTasZQ5GvBhGrhFxcG0stxHGAH3g1n3I/IE4w5aYM/9ZM2q/f8Cxu8ySplRD/ZYHzJ7L1TL29TZDaszuNU217mXBP510IpAY3Ta05C3gnc0mDBLHwpaMWblwm/gtU/D/rAt2wxb2QiNTE/0SpvufmPsgE8UBBw4XlXQ5057RJPNLl9WXjRtTHEvnoxLCRLugxUXpCkF0xd6k2ZkzEnRerYKrsq7tLoglVzagcHTB5n4ErONb6WHiLnfxcTWcDuVUp54RRgYPLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c416bfc2-218a-e641-5fd7-505ea4f7a322@suse.com>
Date: Thu, 3 Mar 2022 17:47:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 3/3] hvm/pirq: allow control domains usage of
 PHYSDEVOP_{un,}map_pirq
Content-Language: en-US
To: Alex Olson <this.is.a0lson@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20220303103057.49181-1-roger.pau@citrix.com>
 <20220303103057.49181-4-roger.pau@citrix.com>
 <9a02db6a23b269fe774ad4a0bc4c662e5e4df37c.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9a02db6a23b269fe774ad4a0bc4c662e5e4df37c.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0207.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29bb0aae-ced9-4989-4b67-08d9fd358dae
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3554:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB35545C462599531F483579D1B3049@AM0PR0402MB3554.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2+YbFd3flGCCdhGDORNxtbSk4JLLtB7uRasNGE6VAyx+RsOKXg4TrW5gybU4mrRFBnsABeum40xtd+3ZdgP0DWshcLsOFXpqo6nTEITsLaIJm3BjIhn/C09tNZIo838tEhvWkoJfndIeGphM3lMFWiRIEHMFrKJpuuO4eRcYBWfiuHEOnru8m51868royprWJ8+2wtv9NTD8cZHG83cQcZOnaNF9mPgjiwtYOFqZ2M6/VT7fAsUgu6O759xysOI5b2YQ6yk+zmeIbfAoWhrAmtYqgbimRvsDpYkudmwnULPJ+DjThPU9MvbbuPJ3IgHf4GV5r+/vItaxbfqJSh79uim38j6Ll0s+c521YFmPsaYXhi+Bei7q3Nx3CaceoHn2y6RT+YmI0L+PM8G+ryj225tYAMBcly57nqM3NGpgz1CWexB9/bH4G/VFUGnME1aeUo16N3MNwKLddD2ORaO/nt+H12Wi2KRQVjcK2LGGmdaWxinURtPgiCsvIonxX49+/+2/7xno2xg+ZnLx5fVKDzXXvQ3AZcUaDAUMLnC0tT5fI8gUC8VQE96gIuS6WYeDx9j77UopXStQUt6pjp7V8AAm4rpUr/A6AgBS58QKu5P7yQY3ywR65tdbJ+bXPq5cjQoB916k++1vpHYaMGJH82+/d9XfZwSd+ZtFDbKQLfXwb5in7+UAqfS7ik5xoPr4WGv1Jmto8V0CIYKPbpdGQFqoX4FxGbXL/q2e6o4RfyA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(31696002)(8936002)(5660300002)(2906002)(38100700002)(316002)(4744005)(26005)(186003)(2616005)(54906003)(6916009)(508600001)(6506007)(6512007)(53546011)(6486002)(36756003)(66476007)(66556008)(66946007)(4326008)(8676002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHc2S3gxWEZPMThrTGhaWUhhcmowamRWTUdXRmk2YmZPc3lxd0YwMk81SWN5?=
 =?utf-8?B?T0tUNWtiQXFFa2dCRlNHanF0UndQTGdJdmdzWUxCTWhTR2hlN09LaEkxem1m?=
 =?utf-8?B?YXpwcDYyNTZrdnlRUW9wUG1QVWZucmZYd0xyMG1IWllKem96TFdWa1Q0K3NN?=
 =?utf-8?B?NzVJbFpCcmFxcWdUSi9rRGpCdVdDaENTbWhiUFNFTmx2Wk9mWWpmalA4S3pt?=
 =?utf-8?B?a3ZoUm1VK24xeXN6eVF1TldORmZITUxxeDJJenhoUkhkRFZkWnYzMFpDZHZ4?=
 =?utf-8?B?UUtiZHMyQTJhNmxuT1JyL29mdHBxdlZHUitEeVdJM0lsM1h2MXo2a2I3VHV0?=
 =?utf-8?B?YmVTRVJENDE4ZW9oNmp5aFUrNE5POUdhSlhMWFlDNUJBUWhhd2dPV0NMbFR0?=
 =?utf-8?B?dHNxODJjdVNqNVNXL21TQTVnWnBXdUIya0w1dTROSjVpdmsrWE9ERCtxNFpC?=
 =?utf-8?B?aGo2am9qKzJKaGFWSC9uSTE0YTEyeitKbVJRY0IzVTdwZnVLdzZ3cTlpKzB1?=
 =?utf-8?B?MXlDcGwwZmdsTmdLaVVKaS82L2lkMkQ3aE5pT085dmdsd25wQXY4b1BPbCsz?=
 =?utf-8?B?c3Rob0ZYZ3hBVDVqbHNiQjFoc0VOemJ2UG92aTZ4eU9qZ0RNUWJWSDJMUUFB?=
 =?utf-8?B?Nkt0VFAvdWRrN21KSk5XaU8rRFlaT090bE90M3NyTEtFbXV5dHZKbkJlVTBI?=
 =?utf-8?B?bFlIaXphRUZsOWwyVDZRVmFEb0RBTDAxM0hJbGo4N0lXb25sZ1NJWi9KVzdp?=
 =?utf-8?B?Qmg4REpWNG1hNDhFbmRTTHZka2V6S0JNd1ZzbVRaV01EYzdkWGdld0RrTXow?=
 =?utf-8?B?M0NITHE5ZE5TR29nVVAwYjZYTzRGNk00cXJ3VG1HV0duQWR3dkpYeUtsckFu?=
 =?utf-8?B?NmhBUmpGbzMrRkY0b0poSEZpTk9KcTdQWTY3enMxTXVhaGZVUU14WE9XcGlK?=
 =?utf-8?B?RE1Veld5bVkwRlFQQ0doNUQ3MkMwTG1NZnhzbGxnRGFFUDJwME5xdzlRdG5X?=
 =?utf-8?B?dnV6bFRqaG44ZUhpcnZrZGcwQUZSNjNzMWt1RnVWZmtPc2ljRWthOEQyTGZu?=
 =?utf-8?B?allzOHh4MGMwTlRuQmU4aEZ5ZEIrVkhyZkdMMGNydW55eFZBTHhFVkRSSk1h?=
 =?utf-8?B?SldSODRIamp6bmFmKzlYdThDR0JpYmVtQTBGenJ4V0k4RHphakRUQS8weDBv?=
 =?utf-8?B?NEh0VTUvRElCREJzbWVMTGxWTGFZRzBETFZ3czRIN3ByaTBZU2VwVmFGcURT?=
 =?utf-8?B?WDNBR0VGSUFVaFl4eENQaEVGditnbkhsWm9tWkVFSXEvUTZNcTFUNk5zRmpD?=
 =?utf-8?B?a09NbGhhRTd0QUxNRzZCUHptdjJ5STFiMU1KblcxbjBJci9KWE51VjcyUUNo?=
 =?utf-8?B?RUY5MzR6NFluc0dud1RLVHZYMWg2N09wLzFTZzAyenNmdnB1TkVNWDNiY3VS?=
 =?utf-8?B?bWc2cjZLbDBheEtBSUtXbGhHZXIzaGhTeG14cHlIcVliR1VzWDRRc2FmbVRs?=
 =?utf-8?B?aC9NcUF5N2JhWlFxSEhjZ2pVYlRqaiswNllJTDErZjZvVGdMdTY2RzBtRkhS?=
 =?utf-8?B?K2lYUkZ6ZUJvU0MxQ2ZzNDFUZ1RzdURCOTBjVlBwYmZ2eFA1RzNHVHhvTlpV?=
 =?utf-8?B?cmxBT2NEa3pIYmhlaENua3Jrdk9wRnBYRnQxS0dsVlBhQUhocnU2aDFrL1Jm?=
 =?utf-8?B?RHVMbm1lWGJRUVJ0YUF1akVKWEN6Wi83YVRRSU9FcG5qcVlIbUxmOEo0VGlB?=
 =?utf-8?B?cFJXSmhzdGxHYmRqbjR3ZW9BdUE2bk81ZWlHSWxwaEJWb3d3cHdwWE1YdUo5?=
 =?utf-8?B?RFlFUlJKVmNSQUxtZzhocld6MHU5TzNmbkIzdGM2eXA3dEpTR2FNcHpFU09j?=
 =?utf-8?B?NkdYclhDbWtKNjBVdDNQL2N6a29nUUJNL2FQa2QxZUdNU1FCb3JIeWc1bklQ?=
 =?utf-8?B?MnZnTXF0THVONTQyZ3IvclljTTcvc0NtYVh6bE1yelBoQzAyMjg0TWE2TzVo?=
 =?utf-8?B?c1BBVWVVYlAwZElSUEtCM1BNTEw3MlM1Vi9QVnpXVWYwK2ltRy9aR3hjU2ts?=
 =?utf-8?B?TDJvSitNaFE0UG5iS1hmemRwY2xMc0hrSG1RNnZYSjNjWUdDelhhMGt6eDM4?=
 =?utf-8?B?MTYwTk0yTkFFeDNjTzNsKzBCMTMxc0kzbHB6UWZiL3hsYklNekUyYlVnZS9o?=
 =?utf-8?Q?lJHnGiQpdtopDftJoMhdSVo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29bb0aae-ced9-4989-4b67-08d9fd358dae
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 16:47:50.3302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mlymvs5mwGyGV1u/HfaAw3bQyGZgOrobbenxL2jnS+Y9SGvur/XiW1kdVQDYjTlouzSbvhz0Ya+BFxrDGIItBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3554

On 03.03.2022 17:45, Alex Olson wrote:
> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -84,6 +84,17 @@ static long hvm_physdev_op(int cmd,
> XEN_GUEST_HANDLE_PARAM(void) arg)
>  
>      switch ( cmd )
>      {
> +
> +    case PHYSDEVOP_manage_pci_add:
> +    case PHYSDEVOP_manage_pci_remove:
> +    case PHYSDEVOP_pci_device_add:
> +    case PHYSDEVOP_pci_device_remove:
> +    case PHYSDEVOP_manage_pci_add_ext:
> +    case PHYSDEVOP_prepare_msix:
> +    case PHYSDEVOP_release_msix:
> +        if ( is_control_domain(currd) )
> +            break;

These are all operations which I think are purposefully permitted to
be invoked by the hardware domain only. That's where all the devices
live when they're not passed through to guests.

Jan


