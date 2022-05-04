Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9EA51A22A
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 16:27:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320794.541717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmFxp-0006k1-Mf; Wed, 04 May 2022 14:26:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320794.541717; Wed, 04 May 2022 14:26:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmFxp-0006gw-J4; Wed, 04 May 2022 14:26:49 +0000
Received: by outflank-mailman (input) for mailman id 320794;
 Wed, 04 May 2022 14:26:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmFxo-0006gq-6q
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 14:26:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a76af8a-cbb6-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 16:26:47 +0200 (CEST)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-j_RvmjBmNsiXlJeFaJmq8w-1; Wed, 04 May 2022 16:26:43 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM5PR04MB3266.eurprd04.prod.outlook.com (2603:10a6:206:6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Wed, 4 May
 2022 14:26:42 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 4 May 2022
 14:26:42 +0000
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
X-Inumbo-ID: 3a76af8a-cbb6-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651674406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aPre0fSaTqJjCC6rXW3Fw0LU03vIteEXe/4QPwSjBLc=;
	b=i4m/3yrbIW22uLlnvHiLI3wIBXoWgRImWAYd+0t4+q8r+hqQRFWKRnk5nK83IoIuBHBt/+
	f6ddSaOKrVyRfI6kX6krNX7YX6tqr3nUH4nrq3L5gZX2H5bDg+E1dkZRV+UOkQBUZ0iIwa
	DRUXn5E5Y/bYkW6b3lYaddj4T+P3eM8=
X-MC-Unique: j_RvmjBmNsiXlJeFaJmq8w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZbg0pXAUS068iphzx36b5TTpKKwtNV0+DkblLinVGXsKWAtT5YulH4/JXJatpwkZc905MHDz2fzh4ECktN8ZaIoyTG1Eo0XjOi0sfgSO/gw9+wpz5fus4EzSGHewW9DQAHnVtmr738/h8RBPNvIfKf+GC5vGJ916E1Hbr7q+s+R2zZl7kfZk8NBVwFbWBmbqTnqZ24dTZMaVDBjuLI9nC1naA6iN1j+HJL4AGEhXnLggm+Dmw9zxXZK3IXn+bSHtgEF27fLTYgQm4qLMO/++1BmIyCB1xe486IRHkTb6W6VlbSBCd7N3vJ5ff7N1d7HRxYBDYi/nj1xi9sujqspWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MbIRklcKrf6YQ+z2qg+c4tmqOIeHHIcsZmFER4YXlcg=;
 b=FrMqztCwOiDLdcTQSNvZXKsI9QlpuUkai25KMyVY0Hlp/sgdGnvsjZn4+xRSHupJK6rL44oqErQEYMCjNXMnEN9yGNc8Q900aaSpXmIf6ryARkzMyWrVj/nBTrTB5wa6RUB06IF4ZMIgfppwe06atPFmxyXf/5yFPpwviEIwycg0TsP5QxqBCpFxox7QCJTPHoxAwpdmh8+CDSKBu004gHBVqe5wZpJS9IQpkzCJLTypSeJXlySKfoGLzoXEZtJ4lxvqr8MqCtOHnqm3sOc5WldJ/BZStlXhxObNNHvsaI163lHc4gx7nLPHPfsBY8u5LLJMZWiYxzR2oAloDaJkAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <56a5dfbf-fb6c-93b3-8c6f-2fcc5dfb8dee@suse.com>
Date: Wed, 4 May 2022 16:26:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 06/21] IOMMU/x86: perform PV Dom0 mappings in batches
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <f85a5557-3483-8135-ff47-a15474aaebb4@suse.com>
 <YnFBDsEdaMiMv+8O@Air-de-Roger>
 <73aabaf9-4509-53f9-8af4-354fd3d13fb3@suse.com>
 <YnJhYJSZ2IXxPEyz@Air-de-Roger>
 <7675bc21-e951-0d75-844c-94ddf47dd343@suse.com>
 <YnKF4fZklCyoKRr7@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YnKF4fZklCyoKRr7@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::20) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c4f6d8f-3081-4866-3228-08da2dda1bdf
X-MS-TrafficTypeDiagnostic: AM5PR04MB3266:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR04MB3266FF34760D6D908484EEB5B3C39@AM5PR04MB3266.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xf3qeviIsywR2QRi6kMxkUYzgnfjH3uY7t7wHA3a2l1WT6iImERykiIwGz0DHNhSUmXKHmFYQySs3tGKP/HuIUWgenrTqzjPCNdZYQgNySCA//jAZ2z+G8Eo5/N2fhhgpWjSYL+RXgdiRUgzu/vSixNeDZlWNJ6mtbxAremzQRRbxyIU+hN/2f9YAYyKuUjYhBTIcEKsURNGLxCdrpLpJoKfhBQAXQaJy52W51TGRKEuKtZpovGTotJboPNCOyoUVBDjfbaxOfm15Q6zLLZ+HiEVQH3o9+USaVZzSLanu8pJqVkggsIx0Mt6QyYZ5txxzIsMPN/sEcaRxmDZ4QJwgLmWLpghKMEarRy0WqjScimKxkazPG7M3QKTRJtdpmlrm//nrLmob32a4q2THuBECnA17iytesNLiPlimWta9m5bpp5bi/iEplHfNNoe1HftBqhH08YnzU+zoa4WmT9Frpfggql0Fne6JPx/qBizgb95Lnq07MhBBA4D/oE9wk3uqbYfbnryw6sA5oB+8tapd+LCspUCBk7GwcnJ+m4dKs56B16+rBRk2gJPXE03RLThwXO7cN+fcud2gg53kWLkkQrQCxvMXQTFCBnD70P6jLjfYN57I6x8X2gDgGcC/DonMgHuK/ZNozqeJKs67EKcoQn8bwwpRLA4VY5DMdTqjTq/8HuzhNW7ZMkffcLNqQygto/f5xGUcvGPwrF5QfAIsmQZ3kTf4sJPJETjrVhqAVY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(36756003)(6486002)(38100700002)(2906002)(31686004)(8936002)(6506007)(508600001)(86362001)(6916009)(6512007)(4326008)(2616005)(54906003)(26005)(186003)(5660300002)(31696002)(316002)(66946007)(8676002)(83380400001)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fYXNWn51G08FVzT7ed7Itvs/4kvk8s3QwyIlstJloW5HveOmcDdqIuA6awfQ?=
 =?us-ascii?Q?zHqrhpD0IODdX+Y9bd1b01oqoe8Nt6m3/K8vT+uvZkcdAGk4nbefoaxs7ils?=
 =?us-ascii?Q?+qPKGjfSrycLF/1WW3yKYuIJ26NH8W7S4HomFdGwITS3NWFSDTwuGFgZL5nX?=
 =?us-ascii?Q?gqmvMJ9hopmtVdzdSWyAkEvslY8hA3lohOd92ry/Ey/EVjSQ8n6HBg2j8SDf?=
 =?us-ascii?Q?443U7Mo/c7H09mzkkISq0f8UBkubixdajyTEeLfBF2sas2XlkKrTkeXWhTbc?=
 =?us-ascii?Q?dSbL1Clq0rwzPskf6GWq+vbUhaCnRNi5h2wZuptXDPHHaZrxCwsZ+vCYnxHQ?=
 =?us-ascii?Q?Lod8TyKaXM3yE8pdnHeryQyvibBiTy01Cmag/X0l9AGe3rXf8WK070oGd0Kw?=
 =?us-ascii?Q?UusxcamlUDhzWEZeoQuh2tX+VZikm9grPYxPqvvUruqy4mee8EGw3wVWyIkv?=
 =?us-ascii?Q?k57IDHfhVfFZEzg5eM9oMI+V8H9A71ZEATsoyTnrUXOa1dWLDfW47UWNxV1V?=
 =?us-ascii?Q?oKUsNuchK+Y/8vTGJfU1f9Gm+yBgwztwDNPmO0D8ahDEe1AQiy8+X9qe0v28?=
 =?us-ascii?Q?94nO5Afose8Oo4qVIIdTNGewg/5pVsBhAGF0t0yFLr3YJkEYSwkp/OgqOzDf?=
 =?us-ascii?Q?qpzUGyshCImNjkw7V5oz7dPM6arzFaY6r1TdeiS/avCxqtIH528h5FIMRIUS?=
 =?us-ascii?Q?zwePtaw5CamQp4HBnGgBXiv6kkVM8r2UiIXoXiMd2mLTSAcm7WaJoZFhLGhQ?=
 =?us-ascii?Q?jb2DbgNNkoGVj3l7FpLtytLDmKp9nMhOyTEi53pm0WO/wunTmC0tT+tr33DE?=
 =?us-ascii?Q?wvV2J0WF/K/DqDI7wyT+FbEhlg61SEvnhvhzCN7jek/f1COi8Oy2SheBt3xE?=
 =?us-ascii?Q?TV0eqzlozGJw94SjRNAXoV67t5WqeGXlOHNm+CtY5oAmpkPwiZqd/J2Z8gBD?=
 =?us-ascii?Q?09ca5nxYe4h3nzHCL7meZaODYHWeVihmeJtziw2pl/Q0rZaO7AQhN1NWZiCC?=
 =?us-ascii?Q?cEDnZcV0OKsFVqpVc2Fwl9goNqYouzS+q7ibg5jeFbN2wIyTDr+zeiUE07ov?=
 =?us-ascii?Q?skhITKevFZ00hNcRnJrVshqCznEDR+806wa/5FrMqcEa+VvIB+fcmo49zj7g?=
 =?us-ascii?Q?L4KB1Ya7o5XV+DwzGoBvyE6Nquow+TYJ7h9p9bw7RzVP58FctH+xL1C8VYOY?=
 =?us-ascii?Q?xjlwh7E/ileZKiCf7qISurz1Muyld58Qj2BEgdIDx2zIemqxHSkuR7hH8lDF?=
 =?us-ascii?Q?Ki6CNHRTTvcCSRjO27cZyFCoX6caMPNgIeqVdHLstEHPpruKoXINtcimCWHU?=
 =?us-ascii?Q?/A+VJ1BuPOkaZ1rcX3A+GWeE+HtSonzLqhGrqoZIIre/EiQMBDAtTtIaWPnf?=
 =?us-ascii?Q?yfw9OxaF+0b9CyzOQHWL7UzGYnmpzivrcAtF690D9ZX1w35XEHGm4LClOfyT?=
 =?us-ascii?Q?qgA5jSKPR4DiMyL1YEkxktIgmuKwrIQ0LXWSUCW3XVHRCESMpooeqfHK71zK?=
 =?us-ascii?Q?72l5I6uxTj00nnl1npEobmWSt036Z8eu5uHLoUDobIVllbm7K3QmO2itDJaW?=
 =?us-ascii?Q?wZVm18P97T15QAWiP0HDWGtFU0rN2bBElmuDPDgHMV1A7uTMC8ogOEyYdjwE?=
 =?us-ascii?Q?EccCL/oz9W+hEGIZkq6TPoaDUteJ4JgKhsGcgG9m2Lf7JWcrzdUlMeNTPSib?=
 =?us-ascii?Q?B4yO8Tt16KWr+xUj/9hKws384Ne5Cie6ha1d6D6n7m9lYJPIj/pT2DoXbDCB?=
 =?us-ascii?Q?PzwvfFJ9pw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c4f6d8f-3081-4866-3228-08da2dda1bdf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 14:26:42.1797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zrw/rqKVBSKFTM1ib5Agjedz2nFXgY98D6tyUjsGmIXWmLJTiUSGJamu0NwmYbUR/EW4mXw79MGRMcrV4gh+Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3266

On 04.05.2022 15:55, Roger Pau Monn=C3=A9 wrote:
> On Wed, May 04, 2022 at 02:27:14PM +0200, Jan Beulich wrote:
>> On 04.05.2022 13:20, Roger Pau Monn=C3=A9 wrote:
>>> On Wed, May 04, 2022 at 11:46:37AM +0200, Jan Beulich wrote:
>>>> On 03.05.2022 16:49, Roger Pau Monn=C3=A9 wrote:
>>>>> On Mon, Apr 25, 2022 at 10:34:59AM +0200, Jan Beulich wrote:
>>>>>> @@ -390,20 +390,41 @@ void __hwdom_init arch_iommu_hwdom_init(
>>>>>>          if ( !perms )
>>>>>>              rc =3D 0;
>>>>>>          else if ( paging_mode_translate(d) )
>>>>>> +        {
>>>>>>              rc =3D p2m_add_identity_entry(d, pfn,
>>>>>>                                          perms & IOMMUF_writable ? p=
2m_access_rw
>>>>>>                                                                  : p=
2m_access_r,
>>>>>>                                          0);
>>>>>> +            if ( rc )
>>>>>> +                printk(XENLOG_WARNING
>>>>>> +                       "%pd: identity mapping of %lx failed: %d\n",
>>>>>> +                       d, pfn, rc);
>>>>>> +        }
>>>>>> +        else if ( pfn !=3D start + count || perms !=3D start_perms =
)
>>>>>> +        {
>>>>>> +        commit:
>>>>>> +            rc =3D iommu_map(d, _dfn(start), _mfn(start), count, st=
art_perms,
>>>>>> +                           &flush_flags);
>>>>>> +            if ( rc )
>>>>>> +                printk(XENLOG_WARNING
>>>>>> +                       "%pd: IOMMU identity mapping of [%lx,%lx) fa=
iled: %d\n",
>>>>>> +                       d, pfn, pfn + count, rc);
>>>>>> +            SWAP(start, pfn);
>>>>>> +            start_perms =3D perms;
>>>>>> +            count =3D 1;
>>>>>> +        }
>>>>>>          else
>>>>>> -            rc =3D iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_O=
RDER_4K,
>>>>>> -                           perms, &flush_flags);
>>>>>> +        {
>>>>>> +            ++count;
>>>>>> +            rc =3D 0;
>>>>>
>>>>> Seeing as we want to process this in blocks now, I wonder whether it
>>>>> would make sense to take a different approach, and use a rangeset to
>>>>> track which regions need to be mapped.  What gets added would be base=
d
>>>>> on the host e820 plus the options
>>>>> iommu_hwdom_{strict,inclusive,reserved}.  We would then punch holes
>>>>> based on the logic in hwdom_iommu_map() and finally we could iterate
>>>>> over the regions afterwards using rangeset_consume_ranges().
>>>>>
>>>>> Not that you strictly need to do it here, just think the end result
>>>>> would be clearer.
>>>>
>>>> The end result might indeed be, but it would be more of a change right
>>>> here. Hence I'd prefer to leave that out of the series for now.
>>>
>>> OK.  I think it might be nice to add a comment in that regard, mostly
>>> because I tend to forget myself.
>>
>> Sure, I've added another post-commit-message remark.
>=20
> Sorry for being confused, but are those reflected in the final commit
> message, or in the code itself?

Neither - I didn't think we have any code comments anywhere which outline
future plans, including reasons why not doing so right away. When writing
that new remark I didn't even think it would belong in the commit message.

Jan


