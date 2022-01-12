Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 428F348BF2E
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 08:43:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256308.439749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7YHZ-0000aE-F1; Wed, 12 Jan 2022 07:42:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256308.439749; Wed, 12 Jan 2022 07:42:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7YHZ-0000Y4-AH; Wed, 12 Jan 2022 07:42:57 +0000
Received: by outflank-mailman (input) for mailman id 256308;
 Wed, 12 Jan 2022 07:42:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=no1k=R4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n7YHX-0008NM-Lv
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 07:42:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 407e31d9-737b-11ec-9ce5-af14b9085ebd;
 Wed, 12 Jan 2022 08:42:54 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2056.outbound.protection.outlook.com [104.47.6.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-IXo6cMubNAGRPk5U6DWr5w-1; Wed, 12 Jan 2022 08:42:52 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5326.eurprd04.prod.outlook.com (2603:10a6:803:57::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Wed, 12 Jan
 2022 07:42:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 07:42:51 +0000
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
X-Inumbo-ID: 407e31d9-737b-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641973374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DQavk4R5pwGLOD/MHCNfGFNFfFEZUuoJgPtN59NkesY=;
	b=k9xLPG0LBkPqsKlPGmH4+Lz8laZcdgN+nrRcTz3WOsnv6EWq46PLx0DxSNCecb1BRNEYD8
	MD34GToeMguHI3tUGArPEoIxleQURdffsXi0o6yyJlEnCjx5ShspQbCCynOMAYXKwO8RCP
	BZPw7PbJOHgL5FVJqzNq090ZpDwytj8=
X-MC-Unique: IXo6cMubNAGRPk5U6DWr5w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6AW7NV0ry5DU1+WiTidq+RdFvL5xgat/4WLl1iHQ7YwuukTw033mIT49A0ii/1mFJg146+wGeXDakXN+JqunHvqnYcoVEmb97vDd0+eXts/yyEaqzKj+xqOsQk457f4A0o3T90wGCWMiDjSSqa83qGX0YYobBMIBb3Tfr3cUm/QDx3d91G+Ktu6Zg4+NOPTTwKWV94gxrH3gb9qQR4dNtB3rq6B2JM/vItec8EPhVUsccJhtsM/OhvMd15YQtfJo38UjlRvRKlVmWH6AUG2PwEIjHbJx7T3cuayHv8gwhWx+MDDr4KjqMWH8jjbUNgVwZvkGb7GxvWzYQHQrk2Dfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQavk4R5pwGLOD/MHCNfGFNFfFEZUuoJgPtN59NkesY=;
 b=YTzm4OWEwYTE1AcRHgTTX2zczCs2sB3t4Ed5IHh7xESXLGX5Kq7k6+XTD5rKx6BYao0Tk4fpSNCBoC0IgQoQzJSGU4XJFDD3WdjTpsWeEULvPAb5pavt7xLNwV3cNrGmZzbi5ffAEGgA0qn03jy0XUsmMBvNKzVfaemLw5JU2I0pG7jt48u49dBbEXQG3sCdoRU5QyzrR/ops9pUCewS0JXnKJSVLjoO7FzpKP39Xy8O4uNmzpQDCrwQTJJFPcOAjtYrvUtvzKbfoD7n60Ae3fJFQQodnVr9PU3aLJdRPJk0+tN7QplYDm7s7i6ACXkD/N19i/3du60iKyn2UQ6s8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7f79400c-6498-331f-8f5a-787eca0fb76e@suse.com>
Date: Wed, 12 Jan 2022 08:42:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [XEN PATCH 2/7] xen: introduce _evtchn_alloc_unbound
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Luca Miccio <lucmiccio@gmail.com>, julien@xen.org,
 Bertrand.Marquis@arm.com, Stefano Stabellini
 <stefano.stabellini@xilinx.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop>
 <20220108004912.3820176-2-sstabellini@kernel.org>
 <93887812-b9c1-af41-85ef-208cc114a1fc@suse.com>
 <alpine.DEB.2.22.394.2201111432120.19362@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2201111432120.19362@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR01CA0050.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3eba85b1-7158-43ea-0685-08d9d59f2323
X-MS-TrafficTypeDiagnostic: VI1PR04MB5326:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB532630C317410ED95BCD0CE6B3529@VI1PR04MB5326.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8c/FO5hpdYhYbQRltkR6HOvIqCnnUU1SSbtu/YYYd/DjqR/tSrpyt+Ccf/qC83NgfWg08qLxXuTTXm76p/EeCIQlz3o/PicRXSbZ+2fjGDtOAYBmuykf+gg9JUM3VBY2Qv5gw8BG0/nNnd5s4VpJ5zs9ougIXA/EBRhcZeUegbCuEG/NsES8QoGZzmpCDOj/Xb+x0vrS9oj7ltzZkPqBuwSrNT+ZZOFupmfVvLAoT4/GDTsKqddf54th4xtdjwqiKKZ0ETy9d5VsQSPGnVXIWp2frgpa/nDSvRCO/pHJYgd1Yahj4BVrv7Ic4+C64gRd9wb300osDznskJOEM6YjYeSnhL+Fyxfh7FAdzyv5IqsFlKEGdBHjEyE2O89xbihkdKq5TSq37WMy+AF7l/819iJYTWJ2GkUxMo3dFYrdJySjzpKoSxaGEOl4kq5LDYKmpfNEtFYgEcExQryQB7Snvk8Kz0sHmdxfNaaDEvBZ/87mDJLojsu8fVykOs8SUAU+lGJ5DWsmj53WZvSmGAE5pW5YH3JE3bEnrrMq+3bId4FYB+Ysp468Er0C8knYEgso4iuqiYN1gOUHOxGOH7SyBm7HSDVkk2krPprzIqMk+qVKzP/AZ/KgvfaMiZ20c+v67QlH2ALh0lcTqDXeh70SO44GgmOapFFfFpc8CPTnXQeMBgVVDnBO7Py/iSXK8RByW1qcVSR75vg5ywIw2ORVpU1y7tatLuAw7/haMD/kS2saaUTqOfK4G+mWYM2QeEgT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(6506007)(38100700002)(31686004)(26005)(6486002)(53546011)(5660300002)(54906003)(36756003)(8936002)(66556008)(2906002)(66946007)(508600001)(8676002)(6916009)(83380400001)(316002)(7416002)(2616005)(4326008)(31696002)(86362001)(66476007)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWVUTmgxV29SSlIwcWZBUGNVWEVTY3IvN3JaZk4xQTFLbHluVm1PUXA0VHFl?=
 =?utf-8?B?d0NGemlUZzE0MC9CaFR5RTVKa09IZE44U2NpV0x1dDhDMjFqSGY0S1cvOWNa?=
 =?utf-8?B?SWpBN1VtZUtvVzJsYkY0YlByS2podTJwTmNaYTRkenpwNTRPTis3NmhIaVRz?=
 =?utf-8?B?MFp4aTAwN3llaVVQbUtodFhsdHV1NVlrenFHU3p0bVBIRHd2L3lQWDB6bnc1?=
 =?utf-8?B?M2xrako1SWk1Q3htc0o1MHloY3V5TDRXNjgybHZ2TGhOU1E0L05zU1VlcVlv?=
 =?utf-8?B?UVE2Ny9FbXdQV2tZQkRtLzYvMWtXa1FycUQ0VzA5OS96Z0VUbUlmdml1NDJJ?=
 =?utf-8?B?c1lNckFKbXFaMmpUSkJsd1VEQ0pDd01xZFZYbDZUN3NSMnRITzByTnUyUEJI?=
 =?utf-8?B?MTczcWRLcXRwOFV2dWdxb1UyZGd0Yis1MW44S2pYeWFXd1IzN1RLN0dtMXZW?=
 =?utf-8?B?TFc0RU1pcWx1UkFqL2lxb0FrcTE5OXlTY0V0OHpodTUwTmNCaDdsdTVROGRO?=
 =?utf-8?B?YWhCaGtFcWpONTFaWGQ3dlNZY2lYLzNEOEdPeXN3MmM3bzYva08vZFNKRCs3?=
 =?utf-8?B?aDNrVHRVd1AzMXBHcHYvNUF3dG8xQkIzeGRoeVhZVmp0UzFiMHIrdmtjUC9u?=
 =?utf-8?B?MzRiN0pzZFBubXQrUEZoNFhacjd3NUNxMXNkM2RzL0pDTWRuQTY2eEhBWnpv?=
 =?utf-8?B?b3Y1WVM0d2dQVHlTQWRqVitkVjdIcmZ5cTdLTXVNbUtRK0VCbHhETmc3S2xv?=
 =?utf-8?B?dVFQOEdEM3drTWtTUDFIR3A4L0QvblBqazlTRVd6ZEVXQjVhdHlZYnlmb0pG?=
 =?utf-8?B?c29Rc0xNcjhYMnowT1ZtUVA5aVFaSWhuMmxMQVhmWEdqZWlzRklMY3NsUTl0?=
 =?utf-8?B?S1M0b3huN2RiMUptM0I3OFlPOUY0Nm1LOXQzcVVBcGw2SmRKKzhzcy95aTds?=
 =?utf-8?B?QXl5UkEwb0RLTVBQSmMyTGpuNVdpY0xLaUhhM1VDb0FpbVM0cFo0K0ZKS3No?=
 =?utf-8?B?R212VlBFeU1hMjAwNGRLVkVRVy9CVHRUWm5aZkxJakxsNktNQ2l2YVMvODBj?=
 =?utf-8?B?SlJTU2NmQXNvQ2ppbmJyT2dhN3htN0w2YWx6cWhuZmpEWU5yTDRaS2RVTGZB?=
 =?utf-8?B?SmJYTGtqemR3VS9WTmtLSjR2RGo0ZVNWdGZZaGZYRUkycXRLb3B1ZTFibGlm?=
 =?utf-8?B?SGloTURHaGZJcVltVlU4U2FkbGdGbHZndnFSM0RYRWQ2YUxTSHJOWFdRWENS?=
 =?utf-8?B?S1I3eFZ6WncxTU1IMVRVL1FHbmdqWUN2dCsvYWxQbVlxa3NvYy81UXZIMFQz?=
 =?utf-8?B?dGo0ODFZT09LcDBjMkdlTTFsekhmYUZVWE9hTHNPUWduTVNwYnczWGIxVkZq?=
 =?utf-8?B?bitiREJZemo2QUhCYjNRb3JTL2FQYlJqdjFudVdPamM3MXBHdVRScHRXM3RM?=
 =?utf-8?B?cHFOOFRGNVpsR2NEQ2toVk8vM2UrZnQyTS9NSmphempYWkEwbGpQQWtaZUtr?=
 =?utf-8?B?UEhtcVhFeWZCdzdQemFjeit6eXAwVUZoL2FFbVROa0xyTC9LdC9zb2VnZExM?=
 =?utf-8?B?UU9XQkR2V1ViSmVPdUx2djJ3NUhSOEEwbVowR3UyRHBjTkpiZDFOOFVJSGRx?=
 =?utf-8?B?TlVXMDJoQ1k2UzZyZUd5L09sY09BVGw5T3huNUEyYUJZUEs5ZVBRemZCcWRU?=
 =?utf-8?B?eWpPRFlzSUJucFN6T1RRZVFBYVVQd05iamM3QkR4bHZDL09Id29RWDNVRU55?=
 =?utf-8?B?c1FWaFBHcVptd2VVdDBFb1hRT1pGVlNxK0tKUHZoZFZ0Q3NSWER3bkFVTU9O?=
 =?utf-8?B?K0MzTnpLTjRHK1YyUitVellxNG5GMFB1VUMvREg4YXN1cUZ6QW1YVTVpSEhs?=
 =?utf-8?B?Y21JelZWUEVaT1JJTnJTR1FlUjM4OGVXT3dSSlVSdGttaU1Jb2t6VVJHSVZ4?=
 =?utf-8?B?SjhIREtDK3laSHJtVnJITHRrZ0FWVHh6MWpSUHBzY1RCNmF3YnNIOTkrQ0U0?=
 =?utf-8?B?L2MrOWEwQ1owUmJPTUNlVC9OV0s0cUhuK2FlZTd3STk5TFQwUThITk04YzMz?=
 =?utf-8?B?UFNpMXRXbnFkVURabi9vZ1BWdk9MZGhmYlIxNHF3TnFRVktSL1JKWkI5WXlH?=
 =?utf-8?B?b01zZ2g3NWthL3JXVW92cWYraVVFaktPUFppWUZBSEZxTThRNWFBVTZzb0U3?=
 =?utf-8?Q?NoID19/7lmRKxTbCmTjf8U4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eba85b1-7158-43ea-0685-08d9d59f2323
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 07:42:51.7039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QedObJsoo6li43/LiSK+hk5v/kbDxUEvQb5oHiaxeqqczNtADcBm3Cmpg1Y9szjhGEBdf3ppgJXj0KRdNarOyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5326

On 11.01.2022 23:49, Stefano Stabellini wrote:
> On Mon, 10 Jan 2022, Jan Beulich wrote:
>> On 08.01.2022 01:49, Stefano Stabellini wrote:
>>> @@ -284,11 +285,32 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
>>>      xsm_evtchn_close_post(chn);
>>>  }
>>>  
>>> -static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
>>> +struct evtchn *_evtchn_alloc_unbound(struct domain *d, domid_t remote_dom)
>>
>> Function names want to be the other way around, to be in line with
>> naming rules of the C spec: The static function may be underscore-
>> prefixed, while the non-static one may not.
> 
> OK
> 
> 
>>>  {
>>>      struct evtchn *chn;
>>> +    int port;
>>> +
>>> +    if ( (port = get_free_port(d)) < 0 )
>>> +        return ERR_PTR(port);
>>> +    chn = evtchn_from_port(d, port);
>>> +
>>> +    evtchn_write_lock(chn);
>>> +
>>> +    chn->state = ECS_UNBOUND;
>>> +    if ( (chn->u.unbound.remote_domid = remote_dom) == DOMID_SELF )
>>> +        chn->u.unbound.remote_domid = current->domain->domain_id;
>>
>> I think the resolving of DOMID_SELF should remain in the caller, as I'm
>> pretty sure your planned new user(s) can't sensibly pass that value.
> 
> Yep, no problem
> 
> 
>>> +    evtchn_port_init(d, chn);
>>> +
>>> +    evtchn_write_unlock(chn);
>>> +
>>> +    return chn;
>>> +}
>>> +
>>> +static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
>>> +{
>>> +    struct evtchn *chn = NULL;
>>
>> I don't think the initializer is needed.
> 
> OK
> 
> 
>>> @@ -297,27 +319,22 @@ static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
>>>  
>>>      spin_lock(&d->event_lock);
>>>  
>>> -    if ( (port = get_free_port(d)) < 0 )
>>> -        ERROR_EXIT_DOM(port, d);
>>> -    chn = evtchn_from_port(d, port);
>>> +    chn = _evtchn_alloc_unbound(d, alloc->remote_dom);
>>> +    if ( IS_ERR(chn) )
>>> +    {
>>> +        rc = PTR_ERR(chn);
>>> +        ERROR_EXIT_DOM(rc, d);
>>> +    }
>>>  
>>>      rc = xsm_evtchn_unbound(XSM_TARGET, d, chn, alloc->remote_dom);
>>>      if ( rc )
>>>          goto out;
>>>  
>>> -    evtchn_write_lock(chn);
>>> -
>>> -    chn->state = ECS_UNBOUND;
>>
>> This cannot be pulled ahead of the XSM check (or in general anything
>> potentially resulting in an error), as check_free_port() relies on
>> ->state remaining ECS_FREE until it is known that the calling function
>> can't fail anymore.
> 
> OK, I didn't realize. Unfortunately it means we have to move setting
> chn->state = ECS_UNBOUND to the caller.
> 
> 
>>> -    if ( (chn->u.unbound.remote_domid = alloc->remote_dom) == DOMID_SELF )
>>> -        chn->u.unbound.remote_domid = current->domain->domain_id;
>>> -    evtchn_port_init(d, chn);
>>> -
>>> -    evtchn_write_unlock(chn);
>>> -
>>> -    alloc->port = port;
>>> +    alloc->port = chn->port;
>>>  
>>>   out:
>>> -    check_free_port(d, port);
>>> +    if ( chn != NULL )
>>> +        check_free_port(d, chn->port);
>>
>> Without the initializer above it'll then be more obvious that the
>> condition here needs to be !IS_ERR(chn).
>>
>> Also (nit) please prefer the shorter "if ( chn )".
>>
>> Overall I wonder in how far it would be possible to instead re-use PV
>> shim's "backdoor" into port allocation: evtchn_allocate_port() was
>> specifically made available for it, iirc.
> 
> I don't see an obvious way to do it. These are the 4 things we need to
> do:
> 
> 1) call get_free_port/evtchn_allocate_port
> 2) set state = ECS_UNBOUND
> 3) set remote_domid
> 4) call evtchn_port_init
> 
> It doesn't look like we could enhance evtchn_allocate_port to do 2) and
> 3). And probably even 4) couldn't be added to evtchn_allocate_port.
> 
> So basically it is like calling get_free_port() and do 2,3,4 ourselves
> from the caller in xen/arch/arm/domain_build.c. But that might be a good
> idea actually. Maybe we should leave evtchn_alloc_unbound unmodified and
> instead open-code what we need to do in xen/arch/arm/domain_build.c.

Right, that's what I was trying to hint at as an alternative.

Jan

> This is how it would look like as a new function in
> xen/arch/arm/domain_build.c:
> 
> static int alloc_xenstore_evtchn(struct domain *d)
> {
>     struct evtchn *chn;
>     int port;
> 
>     if ( (port = get_free_port(d)) < 0 )
>         return ERR_PTR(port);
>     chn = evtchn_from_port(d, port);
> 
>     chn->state = ECS_UNBOUND;
>     chn->u.unbound.remote_domid = hardware_domain->domain_id;
>     evtchn_port_init(d, chn);
> 
>     return chn->port;
> }
> 
> What do you think? It might not be worth introducing
> evtchn_alloc_unbound / _evtchn_alloc_unbound for this?
> 
> I am happy to follow what you think is best.
> 
> Cheers,
> 
> Stefano
> 


