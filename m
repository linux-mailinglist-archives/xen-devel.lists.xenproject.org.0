Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF88E4894BF
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 10:10:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255245.437360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6qgY-0005MX-N6; Mon, 10 Jan 2022 09:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255245.437360; Mon, 10 Jan 2022 09:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6qgY-0005K6-Jh; Mon, 10 Jan 2022 09:09:50 +0000
Received: by outflank-mailman (input) for mailman id 255245;
 Mon, 10 Jan 2022 09:09:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6qgW-0005K0-RN
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 09:09:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0eee73c4-71f5-11ec-9ce5-af14b9085ebd;
 Mon, 10 Jan 2022 10:09:47 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-nCNvJ7NGP_S16_VHR2JQ7Q-2; Mon, 10 Jan 2022 10:09:46 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4384.eurprd04.prod.outlook.com (2603:10a6:803:6f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 09:09:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 09:09:43 +0000
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
X-Inumbo-ID: 0eee73c4-71f5-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641805787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rZM+z2n28HazBA8+1o/v25/WfixGopx/O7PGY9uY2+U=;
	b=dPohYc+o1a616Sg02DKRyAT+L/NQpd+wpAFpuFNz/yf5CMX6Gt2iNSs0X5RYUYY7ufLm87
	VhlMQMVm6SS4KF7VfGx7uuJm/wuWywc5MYqrirGpRpBj3mqXycj/81eQqJKbCxljo8DOsF
	BznABLMzJFkAvfGAK7TZxGKERlJwxzY=
X-MC-Unique: nCNvJ7NGP_S16_VHR2JQ7Q-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NdGtzeCOA2xhJDWF98pteO+cs4o+hIkBbRje007t8YSB7lmFI8ZE7bOTv0uf0ETUQjLHsWa0oKUh6QHD2MqucOe89cGef1KhvtDACqviFBohdS9ipS6GsvjWy53/R3aPkt+XxQBd+Hh1ud9A4mWsa9EvvtXMriwE4I1GMuuf3xXeHHEXOU7AKiCpyjAJekfgenISxLTXHK6+xkNCLblCjBtW2IC+kj4SZy50AumnJOiES9MFPAEv9uxDbFqnL45pJb87eiPnfkbDR+OCwhN5uZB+dRkNpNp9gjSK+ruRkYS9OTZzZfXQPowJsgs2afItsvN9iKpl4x8TLCvllIRSDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZM+z2n28HazBA8+1o/v25/WfixGopx/O7PGY9uY2+U=;
 b=GHNBCy6bngIhWFdKRsc1uMSUa1WpHFITnrhFlmpaQdnnuD8qaivjR2xDeioGCtjzArYUIw/Ho30Yu1VeY+FVJZRYSV471OC+vpdF+ty2oEaSQR0Ub9Zfxi6ZGMwAPnzkvmtQZaJXHy2H3hVcYHxDBEJlGMTzI809N7TbknqkBggEZ9cWVNpkzrSywKfQA387L2MYXDXlpWy4v/pC/G5Nm0a3JzDxWqCGSD1pdFz8U30thsLU5y2cVGuvO1eIYbXypZvlOt10EUz2ExkC9S7E7icPdhZaJ4cN3ZikOMsahgWyXzppdnddc+P8/L1N6pmUW+BJKzqjXSIBi4Gt4W0oog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e6176548-2d32-05c5-1132-6a658c9e313a@suse.com>
Date: Mon, 10 Jan 2022 10:09:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v3] libxl/PCI: Fix PV hotplug & stubdom coldplug
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Paul Durrant <paul@xen.org>
References: <20220109180436.4112-1-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220109180436.4112-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0045.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 304963a3-feec-49ec-361d-08d9d418f0fc
X-MS-TrafficTypeDiagnostic: VI1PR04MB4384:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4384E5AFC8D7F4F2025A1736B3509@VI1PR04MB4384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IHRDdKh4ONSEFo6d8Q8fXI/D0s6DirMUWA9t4Bpira2ZmDSnIJhYda8IG4eOgBPj5GTN5a3T5D1JqHP35bXmuL8sfu8qv32Avl0wyeionFPCCmMaB46Di/KVNjsUmcxCyfi1aCF7D083itp8BcwGQJVwn0MxzpJGdSytN6QgwvKMxitr/Por4JG9XHnddBN/TWNEkhnujcckzULU+mQh0ZwwKa+FtNp+aLdL4b9LKvgbaQrGB3UhHGLARVLT9u1ZJAu+bRVU+O2RM2iJ7H2ODN9SJ0c5fnhgMETHRUIlRNBPDmlCOG+XiWxRKsPmViBbYK99hWSob5wl84uqVidY1w0NCfWrVyAOFM1sOqRt0r7uUPTytAqr5KnJxlJ/kKrSMcHNr6GDihGgzaTwNEnj8TZUONnKQFxVqeq1MQlQMseevVeILDsBLWtW7yEpZQ32G9IVI+KlffO8f04HZuJaNU/T/j21ERRLHLnKCHg0wJNDpjfRmkOQBu+hVrEaRU3wSKjC5BL1HLhZRr0OpZDir6sxPObmTn3MnT/e05hMqaVzn+LUE5u6bXJgYr8J4V10dNamakYeDfpb600jNT/c2UdM5kvX6FdFnuV3GBFJGWjmsUTHdBFGxPADFm59XpHmEFsiPhY2CDvQtUClCepK07uGtQL3zShY6uy0nxvFmzCqVSmCzfNqMiB+BRIhZkutecWq5/ytdj6Kd/LNP+9HA7XLYn2/m5SGgcmGBak+T5fy9fE0/EdthrDe3qEANzDPP1pAlkEaWfvg4770ow112Vsuhug22BS/ab3O6Vk7+w0YS/mYtt0bLvirRqa+Iz6o
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(4326008)(2616005)(966005)(31696002)(8676002)(6486002)(66556008)(66476007)(86362001)(53546011)(316002)(508600001)(5660300002)(6506007)(26005)(8936002)(6512007)(6916009)(54906003)(2906002)(66946007)(31686004)(38100700002)(36756003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkRmTzdRRzBvL1dINDhkbFRVMTlSWEp2S3Y5MXBMUlBQUTNQc3g5K2xPNDdU?=
 =?utf-8?B?L24wTkxnWUttVEZYbkpwN1NIZ2lLNkYyK29mbGZ2NlBKNGQ1Y1RhYlI0aWo0?=
 =?utf-8?B?NzdTV1FreklYRWhGaDNkbEhCRVRpWmRzcVJzU3RZdlFseFNmTHBwSE85cEpP?=
 =?utf-8?B?NmxxSVBNaUcvSDRQQzFsVDJXSDFQWHYwWVNmekk4U1Zha1lBbnVlR3RQTTQ3?=
 =?utf-8?B?bk1BTW1vOTJpbGNjdEIvcXhEajR6WTQ3REZ5UGxXTDFRKzZzOExJSFcrcWZm?=
 =?utf-8?B?ekVKUjhlbDNjUFZHZ2Q3UW1rbm1FSVpkTFlTWXNHMFl6UXkvQTZFV2t3WGU1?=
 =?utf-8?B?ei9aRGdPWWprL2daYlYyZzkxNW9sQlgxaHBIQSt3ditKVFA4R3NHdVRaZ3ZN?=
 =?utf-8?B?cm5lN2svZ1FGcHh3ZGdFVmNJRDgxeUJPV0VvMVRaa0VOYmwyc2dmZWVYdEtn?=
 =?utf-8?B?bFJyc0xMUDlKeFJMWUIyT1RYWHovTnZpYXFlcmhPMlVINEQ0d3RWQjYyY0Nl?=
 =?utf-8?B?SGc4M3BDQSthbUNEVmtDdFNNUDArYVVMZnE4NFdMSWNqaUt3SWI0MWQxNGdo?=
 =?utf-8?B?ZFlzcHpvc2VZYURWeVFKQ292TlhzWllVQUlmRHQxbGhHTWV6UEMwMzZjUlE0?=
 =?utf-8?B?ekllUnppS1MzZHBzdjlheHNMdG1uUk9SbUQ5NnMxdmR3QzRscWZYNzZtS201?=
 =?utf-8?B?NG04WnRmNVd4VWJtdVA3NlNObnlEaFhZZlk1N2tkVUt4OXBONG55TXhtNlVu?=
 =?utf-8?B?alN3T284Ynd1aGEzaCt5VE90TUNkR1ZJaDFBNXZleGNsVUhlUEkraEhOWW5D?=
 =?utf-8?B?dm5SQmd6cXRxRWdpcXN4TG5sVGs3UUwxWXFkUkdKeGxyUUdPUWdFbldCTW16?=
 =?utf-8?B?RW9IR0dyMVpJVnVtck1LS1dlejVubk5WYmRWd0VIWTFEdUNlS3IzY1Jrd3RT?=
 =?utf-8?B?bjVoU0VVd1NhZWFHTDh1c3hjV2hhcUZHbHMvYVBSRE40VkpSb1BNeU1DWUVX?=
 =?utf-8?B?V0dBcmZrQVlmWmlKNGtIV1R1dmdud1BDUHZYejMrVkJEeVE5SnBVbVlwbUVR?=
 =?utf-8?B?YjlIelRaSUJKY0lPa3Z1MXE5MzUvVHpEUG1tOE9tenJNVzZhejFpc2xFeHlr?=
 =?utf-8?B?ajI2T1hRMzg1a0F3TWdvMGFNK2xZY3UyRkVhQjJxUHZwUUlpMlJLK3daancw?=
 =?utf-8?B?Vy8yazc4RFY2aVVyQXRDV3ExNHRISFd2UzlTQ2Y1RnpDdHgvSXAyTUNaSEJJ?=
 =?utf-8?B?RDJNYWtYMGdkZEdCWGxOL1NZNjlBNGRGNHdsUFcvSjNwTi9WTjc0OEFXNitJ?=
 =?utf-8?B?RkljWjFkTmkzOG92N2FRNWNTS2R6QkFEMkdTVUVUWU42UGFJbnhzbk5LRkNW?=
 =?utf-8?B?QXd2RWZlbjI2RUkxRWhLVnFlMjB3QXd2cThNd0gxajRUWTdRUHk2d1NaWlVD?=
 =?utf-8?B?SFBQbDhRNmcxZExZMWhKdlZCM2M4ZVBkd2JHWEhxWVArMVBHMlJOcURTK01u?=
 =?utf-8?B?V1NOQS9ZTWJqbnFESjdRM1BkMWF4MjNxUERNaGV2b1RDcFVWaVd4aFBRWTZS?=
 =?utf-8?B?SXV1aGE2d2ptYUxPb3RtZmE4M1hZTTMwMmwrb3lEV0kyQURNclAyWjV0bEN0?=
 =?utf-8?B?Q0dXSk1ydHZWSFA4d1JIZmROSi9sOFBnUisvMzNtVmNKTm5kN1dlTUNZRGlj?=
 =?utf-8?B?SGllWVZNQ3hCcVNxSzB6TEZOaFNEaFBheVg1TEF4SFdUcVJIMjhRTk1vRVNx?=
 =?utf-8?B?eFRNeVNuWU1CYk5Mc2lKa2dlRmdpOGdvUmlrNkJVK1RGN2JOVU9jaWJ1SGoz?=
 =?utf-8?B?cEJGS0lObXY3RjUwY3BNTGdPRFdUcVYyS0xTQ0xOTldWRzJVOXcxZGVCcDF1?=
 =?utf-8?B?eGJXSmVhNnZ0bk8yd0lCSEZzVWgvS3lhckN0YXJNV09OYzNidS9BQ01wekxT?=
 =?utf-8?B?elZPWW1rK3pCNlpUQUx1UklHZTlKejZGUHh1OEdYaEVUSHpnMWE1MkMyeGhQ?=
 =?utf-8?B?M25nbDlSSGl4elJzN0VrSTkxc3JmZStiQmJza0tHVmhTczhzMWZWdDJRUW9y?=
 =?utf-8?B?VWZyYmp2QXlPa3pEQnBMTjA3V1BEUzNOMjJQMVdnMGE2TGxvT0JqelYvYU0y?=
 =?utf-8?B?aURUeU1yUVJMeDJncEV5Rm43NWRRN2wvVlRQMzhPeW9ySXJlaCttTXNMdVRM?=
 =?utf-8?Q?/FucyqxWv6Xo4FKP7pMcKHA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 304963a3-feec-49ec-361d-08d9d418f0fc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 09:09:43.8029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D1wN9XNwgH0pzuSIC6W2fruwl5Ws3+N5zIX7wEo1pjkqNuQ6ghIjUBdJIC8FmM34wCq0f+/D2yRqrcieeAPm/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4384

(also Cc-ing Paul)

On 09.01.2022 19:04, Jason Andryuk wrote:
> commit 0fdb48ffe7a1 "libxl: Make sure devices added by pci-attach are
> reflected in the config" broken PCI hotplug (xl pci-attach) for PV
> domains when it moved libxl__create_pci_backend() later in the function.
> 
> This also broke HVM + stubdom PCI passthrough coldplug.  For that, the
> PCI devices are hotplugged to a running PV stubdom, and then the QEMU
> QMP device_add commands are made to QEMU inside the stubdom.
> 
> Are running PV domain calls libxl__wait_for_backend().

I could only make sense of this when replacing "Are" by "A", but then
I'm not sure that's what you've meant.

>  With the current
> placement of libxl__create_pci_backend(), the path does not exist and
> the call immediately fails:
> libxl: error: libxl_device.c:1388:libxl__wait_for_backend: Backend /local/domain/0/backend/pci/43/0 does not exist
> libxl: error: libxl_pci.c:1764:device_pci_add_done: Domain 42:libxl__device_pci_add failed for PCI device 0:2:0.0 (rc -3)
> libxl: error: libxl_create.c:1857:domcreate_attach_devices: Domain 42:unable to add pci devices
> 
> The wait is only relevant when the backend is already present.  num_devs
> is already used to determine if the backend needs to be created.  Re-use
> num_devs to determine if the backend wait is necessary.  The wait is
> necessary to avoid racing with another PCI attachment reconfiguring the
> front/back or changing to some other state like closing. If we are
> creating the backend, then we don't have to worry about the state since
> it is being created.

While I follow all of this, what I'm missing here is some form of proof
why the wait is _not_ needed for a newly created backend. Isn't it
necessary for the backend to reach Connected also when putting in place
the first device, in order for the guest to be able to actually use the
device? Is it perhaps assumed that the frontend driver would wait for
the backend reaching Connected (emphasizing the difference to HVM,
where no frontend driver exists)? Whatever the answer, it may be
worthwhile to also add that (in suitably abbreviated form) to the newly
added code comment.

> Fixes: 0fdb48ffe7a1 ("libxl: Make sure devices added by pci-attach are
> reflected in the config")
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> Alternative to Jan's patch:
> https://lore.kernel.org/xen-devel/5114ae87-bc0e-3d58-e16e-6d9d2fee0801@suse.com/

This answers the question raised in reply to Anthony's comment on my
patch.

> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -157,8 +157,10 @@ static int libxl__device_pci_add_xenstore(libxl__gc *gc,
>      if (domtype == LIBXL_DOMAIN_TYPE_INVALID)
>          return ERROR_FAIL;
>  
> -    if (!starting && domtype == LIBXL_DOMAIN_TYPE_PV) {
> -        if (libxl__wait_for_backend(gc, be_path, GCSPRINTF("%d", XenbusStateConnected)) < 0)
> +    /* wait is only needed if the backend already exists (num_devs != NULL) */
> +    if (num_devs && !starting && domtype == LIBXL_DOMAIN_TYPE_PV) {
> +        if (libxl__wait_for_backend(gc, be_path,
> +                                    GCSPRINTF("%d", XenbusStateConnected)) < 0)
>              return ERROR_FAIL;
>      }
>  

In how far is the !starting part of the condition then still needed? I
have to admit that I've been wondering about the applicability of this
condition anyway, and your patch description actually seems to further
support my suspicion about this not being quite right (which is
connected to the fact that devices get added one by one instead of all
in one go, which would avoid the need for the backend to reconfigure
at all during domain creation).

Two nits:

With tools/libs/light/CODING_STYLE not saying anything about comment
style, imo ./CODING_STYLE applies, which demands comments to start with
a capital letter.

Plus, while I'm not sure what the conventions in libxl are, touching this
code would seem like a great opportunity to me to fold the two if()-s.

Jan


