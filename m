Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 482A148964E
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 11:26:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255274.437405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6rre-0008Pq-VH; Mon, 10 Jan 2022 10:25:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255274.437405; Mon, 10 Jan 2022 10:25:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6rre-0008NE-S6; Mon, 10 Jan 2022 10:25:22 +0000
Received: by outflank-mailman (input) for mailman id 255274;
 Mon, 10 Jan 2022 10:25:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6rrd-0008N8-57
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 10:25:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c694716-71ff-11ec-81c1-a30af7de8005;
 Mon, 10 Jan 2022 11:25:19 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-DWDhvNWCPSiwpVZ8q_w_qw-1; Mon, 10 Jan 2022 11:25:18 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5902.eurprd04.prod.outlook.com (2603:10a6:803:ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 10:25:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 10:25:16 +0000
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
X-Inumbo-ID: 9c694716-71ff-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641810319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dwYTt9qcNNqqBSANypvUW0ZJ33wnXzkJ+DTmv63V1KQ=;
	b=CeaJDs3nrhSsVr8ewVK58RzAnaex+2slmtktcDkyykxIOa0srP2wCbD5G6y9l8355aehLi
	t1Fe1M1OEy7+DFvJXh9B1/gyRahR9bjbNGiaXq605lAQ1mmAe6jZNf5M/VL9aOoWAzgshZ
	8FaeICH4CIutKNu9i6Mieak/20dvDkc=
X-MC-Unique: DWDhvNWCPSiwpVZ8q_w_qw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQxrnutYhJ1cVjLYB5T9IrCSfSxTu1pifLi0pd/rYjax8gnOsW3rR0f18dtAgqVBTdPGefCkIJA6PPP1+hMyh8YoOlX+3eUjse35scU3wvaOopRxBbrmyzs/9eboOQ0e4BwJDLiWcIxENgmKdLNF2nhOprY5gHY3Up/Knx/m7BmYU59iysIjuNrotabNmnzilmY3nYXDwPwT5gHoHyxYMFleqF5alp6dE7fcaCyRPIckHxb15IQzX7KsacCcG7NDkAyfptpMSV9mXx2JE8xMgd4sXU5VVB9IHaPvOFK6SIT8QgN25g4DlhqxOFl9iU1fvGmheaGUMqVFndcMhcoh0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwYTt9qcNNqqBSANypvUW0ZJ33wnXzkJ+DTmv63V1KQ=;
 b=YOSDWmauvoPCNOJSSJ+zCwSG2Z0G5lLqc2eTeLQwxStF6glJkvoinuTXSpgoBJzBEwJXqCsoiW74DfPWB5+lLRjpUJ5Vj/onL4Hh1ej0MmCIO1mwUnl2OajIOY1lgYjx2n236vWY7U/DfmuzwwCf8uO2tX1hYo1m9kdGRo3VygQ2cIwvWntWsGVsGAnFvJOwJQtcfDpHLcRsIbze5WDrEwSrzTfYhBFNot2ReuYAzDJWVohzKlVYf19k+ECvAtaxtlS9L2vBLSrqIYaBjhqN28r4oLs+2s1mt9uMbkss6Y7+9muzF+tmK8aLnCgGjSDto7C1HmCQEVm8VXmV0D9xWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <93887812-b9c1-af41-85ef-208cc114a1fc@suse.com>
Date: Mon, 10 Jan 2022 11:25:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [XEN PATCH 2/7] xen: introduce _evtchn_alloc_unbound
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Luca Miccio <lucmiccio@gmail.com>
Cc: julien@xen.org, Bertrand.Marquis@arm.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop>
 <20220108004912.3820176-2-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220108004912.3820176-2-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR02CA0024.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee5de5bb-222e-4880-74d1-08d9d4237ed9
X-MS-TrafficTypeDiagnostic: VI1PR04MB5902:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB590201D2A0C6058BE359E942B3509@VI1PR04MB5902.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2UsR8KaeBRqfyWUlns8R52M/jXgl3V8C6ePSToqUvxDgZ1hKM4phLcQ7vyOMamEPrMLfJ4VgLehfs5RZf/rYIhYuz1Rc0P3jPUtSXYxx02MrubCzpPWcfGU8i9pV7eOnEIh6m1zioKWih8QKJu7Y2h6/5tiiNjh+VYrTmGfOS1elypE7UWBtoGVNjuofRifrFesmFSvxDvToMT73iayn5zstU28hnVfegGe19pK0MUh93WPla3et3tK9NIKnn25Czwp+yXSQrPCOp3cfWT7osamAl5/AK7vnx1hSiaZ3pvuUrFwF19+qCCR5BgxeNgyuzlOAw3bvZ+Nr0ukA3G+/FxLxQs6rfAaQtAwWTi4WK/Gxdfc0suGFJrQbT+ScqAls27OtIqwn0tnHcY02ACc9hLAOuKzSj7vAY3lt9BsuSUOvXZwrUh8WZ18D3arUXOHn0349R37AiMnA9dtFhv7KXNZnHMM1CUQn+FFmKqpw6yGqk6V/2r64J/KQVfslgiTMasVG03RvThZThuQTk03EN6nM3IdBN+9iVRMr7i1KUxSN2wRyVkDPKm7Xagd++Ydjoe7THuXrKYB8E1d5LAd4XdjvCk6ezT2jevPOvtN72UcrzCsEAf38biSaU4yNBA2O7G9IVVhDLddWaXxDiyP3fGPs0JysCZOq1XlqbIOuNwvpJCka9IyOSBCRlsmyXk35+tNxuCf1q7M6lG5GYtVFAWFRq52CGv7TQTzm08Oay7k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(186003)(8936002)(508600001)(316002)(110136005)(6512007)(31686004)(2906002)(5660300002)(54906003)(26005)(8676002)(4326008)(6486002)(86362001)(38100700002)(53546011)(6506007)(66946007)(66556008)(31696002)(36756003)(7416002)(66476007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFQrZFYyQVFVOEg2dllWa2l6ZHFGTzRPRG4vS3IvUGN2bWk0Y2xsdGNXamlE?=
 =?utf-8?B?bDltakZndEdvYU4xc2RXOHdMb0JFa3hqSDZBOUpYQVMyRm9SdGhyM2FNa0Ro?=
 =?utf-8?B?Q1Z2NnVYOCtrRUhjV3VPRHVSSlNPVVZxaVpBYmxaNTNodFpyN01GMnk4REt5?=
 =?utf-8?B?T3FkanFoeU1ZUjNqK2FxUUhzc1UycEorZTJ2UERycVYvNGwyNnJwRG1uOHhJ?=
 =?utf-8?B?djRORlZQaW56K0t1dmVWN0J5dGV6d2x5c3FSaUx1aXFkK2VUem5QYkp6M21M?=
 =?utf-8?B?U0x2VkU4ZE9YbFpEVGtXUVRlbUE2NUUwMDdtUm1oTFkwSXJhdzdTMFNpVEUv?=
 =?utf-8?B?Q0RPUjEzNjFCTWpOTytmVTVKZ1RFQ2tGQ0hZYmlCTWhlTHlabCthMEdlRXRB?=
 =?utf-8?B?Sk5RaDhkUHdKVVlvelJSSExNd1VJWU16SUlVOEw1dTlDUDlEZ1RMdXhaMlRV?=
 =?utf-8?B?Y2JyQWlaaUxGR3k5R0NmNzNUdWxETXZZc0NTZHM1VVQzdDF4dFowV2N6M0x3?=
 =?utf-8?B?czBOOEVlYytqeUZDY1ZtZnFoR3VkcndhcHl3S2JTbFByOThKNTJkYkVacld0?=
 =?utf-8?B?SlNMU3F4Z01RSjJFbjZDNHQ2bnd2U1NwYmNvUVpTWVNFZzR3TmhRZjFRNnN0?=
 =?utf-8?B?L010eFJqaDdKQ2lUWC8rVU5pM1haQzVPaHUrT3VOREsra3lDOG1BbU1VbTZ5?=
 =?utf-8?B?Qk5OUFBTdnNqU0FCcmVsVFhtTnVYQ2lPdTVMYk9vYjlLWFF3dVhTRHpOaU15?=
 =?utf-8?B?bmNLTFMyRXZvMW0vUFNVdUt2K3pjMGljaFNWbW5YWUJqV21icTVUSXhCMFU5?=
 =?utf-8?B?ckdydUF5b1RXZmgvZWhiWWF2WTgyelR4UGJqMWFJemdlOGllZEVzVnZPU1NC?=
 =?utf-8?B?cWh4c284NVBsWU1rd2lsaWVVT2NQY0o5WVB2bVMvWUJxcEZCTVBiY1V5aXpa?=
 =?utf-8?B?THppVkJSYkJwZG9BZllTbEg1VnBhbjJoSERFbFVpV0NhdUJCSlEzZEEvejU3?=
 =?utf-8?B?QmVLNmpNeU9ReVMrQUJHcU5oT05WNFJrTXhhMkJNeGJXZXNQb3pEaldxYzlq?=
 =?utf-8?B?V3puMlB2UFEwVVBZUEZOUXFlTGxPYlJmS2lubW5FL004ZGZYY0s2RlY5cVRM?=
 =?utf-8?B?ckptNHVxaXI2cWV4akRIZHh2S05HZkhwdXRKTkRhWTkza0kxMjY4QVM4RW5W?=
 =?utf-8?B?dVRKNXBLRjVWeGJMT09nQld6L1RSUnVIWEVOTnJCTDE0WVRLb0JGM0tWcG5L?=
 =?utf-8?B?SnJBNGJDa2JCUFRJcUJVNUpJYUpGU0F1SzVoYTd4M0t5d3R4NDlEYy80WGlT?=
 =?utf-8?B?emM5QjVZOVM3UGpxT1hCVlRDYXN6akwzRzNpUUY3WTZabmJwMU5hc0Jocitw?=
 =?utf-8?B?eXZiejlzMGd5QnpIZlFWUHoyVFdGVTlRZnNXK1NqaVdySVFPZTJnMS8zQ0Nv?=
 =?utf-8?B?NVNtTFUwMWZtdWRnNGt5RUcxOFliVC9wU1YrelA4eXc3bEMxcnV6ZE9oUXBo?=
 =?utf-8?B?Q1F5Q0ZjN1pWVWkvUHZJcHFoUCtpN3Arakt2bG1ma0VtL2JhbllpVjZib2JT?=
 =?utf-8?B?cWVUYkRDaUV3eWRnVXZDMTZkRnFCdUxLc05TWDFXc0k5bm5QeUN1N2U0a0FL?=
 =?utf-8?B?bXIxUnl3VE9DbjY1OXNzd1cxYXpIN2svbVFuQkhNK1NQbk00VGt5dFpxTzQ0?=
 =?utf-8?B?TjBVVDFGRGs4cnc3K1A4OVdoYmFNc0djc3RFdUtRNDlKdlRPSDJpWUNTT1Br?=
 =?utf-8?B?TDV6STZlMC85WEZlOWtwR1VwVTlzeXpMVEx2cjdXaGJYVkdDVWluZ2FaL1Ar?=
 =?utf-8?B?YmNJN2xiYzNzYnZOQTVFMHpPWVNZSTlHdFV2WWNnQU51YWpLNDlaRk8xUkNC?=
 =?utf-8?B?aUhmMWNMSzIrOE9vOVhGSzFBWEhUZWU1cFAvclFQOFpTaGpGSFFGN0drQStE?=
 =?utf-8?B?dmxSZ0tsYXZqcWV3dGNFUXVFdmtKUlg4Rm9SS3BwcktxRUFLcFNaNlNFRlBs?=
 =?utf-8?B?aVp5V0lhN1dMQ1ZWRkVleVZoak1PQ1FyL1g3cHZhaXZIY3ZWVW02ZUxGZkxU?=
 =?utf-8?B?MDd4U3JyWE0xUk8zOTZjRVJPemEzekd5NzVXZkxyMkNjSTNxdHJnbVN1ZnVu?=
 =?utf-8?B?UTk5NER0dDRQbFFrbHlhR0xWeGZ2QlBDSkwxRmRvWWNDNWFBZFhaY3RSODg1?=
 =?utf-8?Q?Br3fRoTswqZerZVexVjPIzw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5de5bb-222e-4880-74d1-08d9d4237ed9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 10:25:16.7909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M/XNgAJ+umGdz7CrmluhleuC/Od2dTa7M4wvh+Dz9bGrJeZ4UZdMAJsFqW1+70jimqDZ5CQYNpxfdLEPQGgphA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5902

On 08.01.2022 01:49, Stefano Stabellini wrote:
> @@ -284,11 +285,32 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
>      xsm_evtchn_close_post(chn);
>  }
>  
> -static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
> +struct evtchn *_evtchn_alloc_unbound(struct domain *d, domid_t remote_dom)

Function names want to be the other way around, to be in line with
naming rules of the C spec: The static function may be underscore-
prefixed, while the non-static one may not.

>  {
>      struct evtchn *chn;
> +    int port;
> +
> +    if ( (port = get_free_port(d)) < 0 )
> +        return ERR_PTR(port);
> +    chn = evtchn_from_port(d, port);
> +
> +    evtchn_write_lock(chn);
> +
> +    chn->state = ECS_UNBOUND;
> +    if ( (chn->u.unbound.remote_domid = remote_dom) == DOMID_SELF )
> +        chn->u.unbound.remote_domid = current->domain->domain_id;

I think the resolving of DOMID_SELF should remain in the caller, as I'm
pretty sure your planned new user(s) can't sensibly pass that value.

> +    evtchn_port_init(d, chn);
> +
> +    evtchn_write_unlock(chn);
> +
> +    return chn;
> +}
> +
> +static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
> +{
> +    struct evtchn *chn = NULL;

I don't think the initializer is needed.

> @@ -297,27 +319,22 @@ static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
>  
>      spin_lock(&d->event_lock);
>  
> -    if ( (port = get_free_port(d)) < 0 )
> -        ERROR_EXIT_DOM(port, d);
> -    chn = evtchn_from_port(d, port);
> +    chn = _evtchn_alloc_unbound(d, alloc->remote_dom);
> +    if ( IS_ERR(chn) )
> +    {
> +        rc = PTR_ERR(chn);
> +        ERROR_EXIT_DOM(rc, d);
> +    }
>  
>      rc = xsm_evtchn_unbound(XSM_TARGET, d, chn, alloc->remote_dom);
>      if ( rc )
>          goto out;
>  
> -    evtchn_write_lock(chn);
> -
> -    chn->state = ECS_UNBOUND;

This cannot be pulled ahead of the XSM check (or in general anything
potentially resulting in an error), as check_free_port() relies on
->state remaining ECS_FREE until it is known that the calling function
can't fail anymore.

> -    if ( (chn->u.unbound.remote_domid = alloc->remote_dom) == DOMID_SELF )
> -        chn->u.unbound.remote_domid = current->domain->domain_id;
> -    evtchn_port_init(d, chn);
> -
> -    evtchn_write_unlock(chn);
> -
> -    alloc->port = port;
> +    alloc->port = chn->port;
>  
>   out:
> -    check_free_port(d, port);
> +    if ( chn != NULL )
> +        check_free_port(d, chn->port);

Without the initializer above it'll then be more obvious that the
condition here needs to be !IS_ERR(chn).

Also (nit) please prefer the shorter "if ( chn )".

Overall I wonder in how far it would be possible to instead re-use PV
shim's "backdoor" into port allocation: evtchn_allocate_port() was
specifically made available for it, iirc.

Jan


