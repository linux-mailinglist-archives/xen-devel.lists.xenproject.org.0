Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82890414A89
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 15:28:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192734.343332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT2H3-0008UH-BA; Wed, 22 Sep 2021 13:26:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192734.343332; Wed, 22 Sep 2021 13:26:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT2H3-0008R5-7Z; Wed, 22 Sep 2021 13:26:57 +0000
Received: by outflank-mailman (input) for mailman id 192734;
 Wed, 22 Sep 2021 13:26:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mT2H2-0008Qz-04
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 13:26:56 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c04280fc-1ba8-11ec-b980-12813bfff9fa;
 Wed, 22 Sep 2021 13:26:54 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-5Bbz8J84PbadPrR_Ncu_lw-1; Wed, 22 Sep 2021 15:26:52 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5470.eurprd04.prod.outlook.com (2603:10a6:803:d6::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Wed, 22 Sep
 2021 13:26:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 13:26:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3PR09CA0003.eurprd09.prod.outlook.com (2603:10a6:102:b7::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 13:26:49 +0000
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
X-Inumbo-ID: c04280fc-1ba8-11ec-b980-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632317213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FNsIFDNt/dpD1F3IS8KbBBhMWnQiexgrzg+BE6l5F6Q=;
	b=AqJASzoqZrAEn6g8wjOtPgxIGeQduBPiM+QJitu8Yt2JtZMfXLoKAStdAWL/fY4dYtxVsh
	eOO24O7m/pxlGexBenm8Vas+xiQQU8h2vOqrxMYEEqClhnzWilJW5L+F9cgJ/PVq7o2i8M
	O/CyTyzDprxS7o5q6nZYptp5taxIklw=
X-MC-Unique: 5Bbz8J84PbadPrR_Ncu_lw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PRs5LoeUcFgae5JqpPH7QLmRX8Dh3KkDiAJ/yc1VogPzfFovEpSLT6XBup1X8fwfp5x4BYLwE1BVznCcoEWt0X/jmaD5LQH5pu5Y993GcGF6kGgCkzGuPOgbJoUitCyuUzxvmDYHefR+Vdxs65b+W4C2Shqry9mu8DWnhiLNV42zbHuYvJxJXtx0ZmpiFh+8Y1Qh0okwACR7F0ixtsZ4Lu9EPK8HwPpMxgJLoRKWUeYt2Kwmb2I+QugCdj1AthYBcnroE/1OZOrUoLm259vsQUoJecL6TU08/OvMZmDXUGCVDxgJO7mwce4JEAmwXbQ6uFUPuwTh12Idh09vTQLI/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=FNsIFDNt/dpD1F3IS8KbBBhMWnQiexgrzg+BE6l5F6Q=;
 b=f7kY+Sg4Dg+w70ecf8x2dRNdslUdFG8YEn8LnxI6He8UTj26jv9ECUX3Bp+6mSuXyHFcEYVtJVdtfwArMn9geFojU52aUBChWzh25Dj4IoDXVpsrxRjRrWdLnHrfNaadzI2rgU1sCcXkf+NxoV16vxRVxDElWkt1DLO9EFewe0yVz8r5SfCZFRWvY6Bmr4hMxDaOpIsZlE6fg/YlbvORnNM/EtGcIEC2aoAM4oGsmmiX7gc5xAZvPKtHgnkM9d3sK7U7u2HralUWOqP98D3KWvNxsdw/0s1mlKmn7IkANB10rkneuskw0Bfo1Mhe+DwS9NqhrSzUkn8xiznuFPLWDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: apertussolutions.com; dkim=none (message not signed)
 header.d=none;apertussolutions.com; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [xen-unstable test] 164996: regressions - FAIL
To: Ian Jackson <iwj@xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, dpsmith@apertussolutions.com
References: <osstest-164996-mainreport@xen.org>
 <d049ba60-db81-aaa4-1769-54c6964cfd06@suse.com>
 <24904.44119.940679.241639@mariner.uk.xensource.com>
 <alpine.DEB.2.21.2109211631330.17979@sstabellini-ThinkPad-T480s>
 <19906cf8-365b-63c9-5c59-aef8dae41505@suse.com>
 <24907.4491.895219.37845@mariner.uk.xensource.com>
 <952a9c35-39bb-d229-0bb9-a1f4e893b61a@suse.com>
 <24907.8642.479155.35952@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <54b1b5be-9f43-9513-d274-105d28bd5a58@suse.com>
Date: Wed, 22 Sep 2021 15:26:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <24907.8642.479155.35952@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3PR09CA0003.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd1673a2-2128-4bf5-986a-08d97dcca24c
X-MS-TrafficTypeDiagnostic: VI1PR04MB5470:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5470842ABAD5196D658691ABB3A29@VI1PR04MB5470.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aG0Tyj33lbr3LKol/aQNjJwdE58rZxtmd0hbV+J8AcuY14zNV8cTEyFUMJejFAZALpPLK2iL5Z6qv8Y5/SR6rsz4OYxzCgTJsmwcgTWUZWkme3g0L1Mn1P306Vn4ybc6AWXIV9rm/eyblfPJ0ROql2kqHWowu8IC+odFnY+Haki3SFAFSltlRNg0YZ19Teu9hBoNF18664/t2JAkDjHfUgaWXArCjAMJJ+6WJyw/eUNrB9rG69huKqJlmNdRRfVCTi3wxXi8pXXKv7/qWPMLfPOzuWp9Cu7TAUwwi7l9/lxg/wPHEcLGF6w909q3Im7GwbxwlQzGwCZkeXMeen/AvHIbs0C1fijwaold58DJ4muXQrC1BeeJOV1ZNss0rHxTi9aRV5E/OFC6ucnl5AiVcfURT4KxLvbm933+SamPaTcorFkLQAnF6QlbrC0WrAv7E3KljbGCTpRCbeln6jP72r84FCiuK6vf0B7PtFireC6BbnMVcsB1is8BJLffaN6I4ZJ4ylfo1HqxNwR/WIF5zPOz99d/9bFsfD1gEYkrSoDrbwoCukrQ3c7U3dij3/qr4WM18NsldrqLh72oi3ZUHM96gtxtUBnYWgfY9oYihecvMPQ5VGz3xubUphghKETMDpjNh2w+gW9ApIHQSCv/QF9USBSA3RBGSFILs7dd8P9AULJ+soi6f0aZp9q5O/rT8n6JjSOG4VEvy2vEDBOzVtPda7RBghsRx9AF8P8AqTM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(8676002)(8936002)(38100700002)(186003)(2906002)(2616005)(6486002)(508600001)(53546011)(31686004)(66476007)(36756003)(66946007)(956004)(316002)(83380400001)(31696002)(6916009)(66556008)(16576012)(5660300002)(4326008)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WCt0ZmdvUFFSK01ERGlrdGpuOU10aXkzOGhoT2pzUjVxWVVMVG4xOFVIZFlz?=
 =?utf-8?B?Vlo5YkJCcStURXk3YThHNVJId3VFU3A0KzhxWXdlTzA2cUExL053K0pKcFY2?=
 =?utf-8?B?dEczMS9FUDYrT2o2Y1g1UWZQL2JvRm81ZEduREpXZDNNU1VOZnhwSTFUVVVq?=
 =?utf-8?B?V3pIYUN1bVpPZ1N3ODhiS1dTUFN1VUg2WmZza0t4bmFULytWK3gzdnhLc2J2?=
 =?utf-8?B?MEdpVGo0WVgzOGhnZkNFWFJ5YmtKZ2ZwZTBqSTdncCttNlk1cUx6R3NVUGlD?=
 =?utf-8?B?T0ZZYzNGaFZ4ZG9GZnV1MlNQSlV5aGo1OGFyL21ReEdoZUluNWZNZWlwRjZo?=
 =?utf-8?B?R2Z4ZXlPTWl6cXFFMllMTS92WjRkVjdXaGx1NGs3NXJiSGIzWUhKOVlxQ1BI?=
 =?utf-8?B?TDVSTkswbHdKcUtYTjdFNUNUV3dmVUw0bncrWDdrZm8wOUY5RnpzSi9FSnhm?=
 =?utf-8?B?UkYvdURuYzJYMWdTbkZldDdWRUJnOTNVeExkRi9CSTFyQUQrNkdiSVNsUVhs?=
 =?utf-8?B?d1VzamlsRUo1QkRaSS9UbGFvTGxVbmtka2didEtBZG10V2YwQk9BZXhnUVBZ?=
 =?utf-8?B?NEQwSmFQTXVOSXhRN3RDS3lJZ1NCWWtab2hJWEtRZ3QyejdhZ2RWb0xpTXBl?=
 =?utf-8?B?U2x3a3MzR3JzUHFhYzNvNDN4d2VCR082K0FKcUlna2FtUFR3VGNBTmRXMmQ5?=
 =?utf-8?B?ZVQxbXF1Y3J5OWkwOHVlQ3FabnVZOUFQRDIrd2MrTEhiK2pISHpSbmJyelFI?=
 =?utf-8?B?L0pmbk1Mdm95WXZUdzU2S045UlcxMVVoVmM3RWJHaXJoaktBUy9CN29KM3ho?=
 =?utf-8?B?YlBMVjc3a2VrQXZvZzJlRXhzcGk5RG0vQ00xalZTT05OckxXR0g2NE5UQlFw?=
 =?utf-8?B?UjZ1NTMyb2VtS05VaW5DcUtFU1Y3bGRlUDdEUzgxYSsxOTRIQlBmRUt3U3A4?=
 =?utf-8?B?M3B2d1VXSWk4T0krenpxajZTQWxucElvcU0yT2lOSkpTYkYzK0k1TVVZU053?=
 =?utf-8?B?aGtMVWFJanFLWlhxYTJndm5LUERVU0VTYjZuQXhHenJtdVpMRE50bFhTdU9J?=
 =?utf-8?B?ZVgxMG54cmc4Ujh3enpMOGZNbWI3MFRjaFFsclEyUG9FbHo1TmpkWVZHcGY4?=
 =?utf-8?B?SFB5VFovMVcxWTA3THFBNStCaVk1M2xuZDNJR0hndDgrWXhZWXZwaUZteXBr?=
 =?utf-8?B?RFdLTkdIdHkyUWVpcjVDdjhpTnpDUWMwblhFTVdTZkh2RXErdHVrMHFocEUw?=
 =?utf-8?B?MXpvOURhR0RDUDhaS1lxRXB0L1ZlR3dqeHUzSHMwRE93ai9uYlBTcmxyZTlu?=
 =?utf-8?B?cktKSkNmNkMrRmp1dGtCSWRLNkduaHR5L2JBM25yQVI4WHZLcWdTRFlQWWhH?=
 =?utf-8?B?OTU0aVorLzd0dnp0OWFUajVqVFZ3dVZ5YmJsN3hLQkRZazlXYXlxRmZPOEhH?=
 =?utf-8?B?OHVTRlhoZ3FUeWxiYXVFOEVWOUkwR1JockZvK1dYS1ZiaVA4R2dFc2V3L3JW?=
 =?utf-8?B?V2lVNW53dlF2MXRGek1TQWErQlRDV0t4Z0tTbTd5clRJVFZOUjNKWE03SnNs?=
 =?utf-8?B?cisycmlMYjl2NW1sODIvWTZjN0hwcGpsM0NXTUhlMlZsOCtSbzgxdG5qRHlw?=
 =?utf-8?B?cHQ1YUZCVExVUjhXYVhiNXU1SXNadjdBelJITDRRYnhEMkVwcUJmek1wajdF?=
 =?utf-8?B?UlZhWGgxTlFEdDhKdmk5aDZZeGRGdC9HTUs1OFpHY1lWQzhiYzNCNjBWRWpu?=
 =?utf-8?Q?vZyiPW0dWcn38ZTSgtszYeNlPWtF6t4QDECC4Jy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd1673a2-2128-4bf5-986a-08d97dcca24c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 13:26:50.2303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vPl9J8uC9zgAoN3bh4uJ4uKvi38ri6eycpd15P2P5E8U4bfYUSeVw3PIEFvevOuCzK5OM739OVUGcTkANFUW3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5470

On 22.09.2021 14:29, Ian Jackson wrote:
> I'm not sure, though, that I fully understand the design principles
> behind non-order-0 allocations, and memory sizing, and so on.  Your
> earlier mail suggeted there may not be a design principle, and that
> anything relying on non-order-0 atomic allocations is only working by
> luck (or an embarassing excess of ram).

That's what I think, yes. During boot and in certain other specific
places it may be okay to use such allocations, as long as failure
leads to something non-destructive. A process (or VM) not getting
created successfully _might_ be okay; a process or VM failing when
it already runs is not okay. Just to give an example. The situation
here falls in the latter category, at least from osstest's pov. IOW
assuming that what gets tested is a goal in terms of functionality,
VM creation failing when there is enough memory (just not in the
right "shape") is not okay here. Or else the test was wrongly put
in place.

Therefore a goal I've been trying to follow in the hypervisor is to
eliminate higher order allocations wherever possible. And I think
the kernel wants to follow suit here.

Jan


