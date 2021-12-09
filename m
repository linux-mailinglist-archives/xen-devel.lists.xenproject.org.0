Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D366546E379
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 08:46:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242754.419830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvE7o-0004Hw-JH; Thu, 09 Dec 2021 07:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242754.419830; Thu, 09 Dec 2021 07:45:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvE7o-0004G9-FB; Thu, 09 Dec 2021 07:45:56 +0000
Received: by outflank-mailman (input) for mailman id 242754;
 Thu, 09 Dec 2021 07:45:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Con=Q2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvE7m-0004G1-Jp
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 07:45:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0936fc01-58c4-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 08:45:53 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-qUiTNO2BOV6QCWTftWwzsA-2; Thu, 09 Dec 2021 08:45:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5167.eurprd04.prod.outlook.com (2603:10a6:803:5b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 07:45:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 07:45:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR10CA0011.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 07:45:47 +0000
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
X-Inumbo-ID: 0936fc01-58c4-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639035953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1oHTvZmps+H1bsjd5GhQPFpG7SLzKm0FF6vDkEGobnQ=;
	b=OvFlQUA1M4iDvT/uqgavf/FMdUunbOH5U91G7oigzjL4D5iOPFhKtsQYxi/JJ/t+nwbLzY
	5nu/L4DMXxyRRC5hIKqsL5O8buDJrVEG87RtZjoGlV6XC95ctc2PKxNJK+wFKp4BB2k/4d
	2WtKM1t3Wc3/GXzhs+M4gqvv/4wZ7Nw=
X-MC-Unique: qUiTNO2BOV6QCWTftWwzsA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bFGx0jciAe20Rll0E1+Td+k2tpuab4TOeN/K2Rerwb8j0s5NS3zVi0S1j649qykSgXq0J9N/iwbBtfoQ62HoEvZGkT1/ULiPd52IbDN8tmo8KCCxHBOCzmcX421DVoXB8PIn6oUDKz+yx94K0mgapcR/zBtkD1uOQg8o5VvKMbe4wICNpnWKQtMai8ny2oE8h9x2GHd3z6Vso1imN7VKo2qSzuxDgd7rDpnrNDTszhBeDCYjw5Kh5nLZBAOKgGAgda4vW7vt2kbF1fyLUoP+i9jA0V5b1H9MsNFcAz79RaOIdk4q637yomFXEjkylkVlZB0ELHGzbF97iNfR9reQUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1oHTvZmps+H1bsjd5GhQPFpG7SLzKm0FF6vDkEGobnQ=;
 b=Mq/MF0HRgkkxNuAk9eCi2j6yiuOKVb9TVdjuDPP8cJiqWI8zikQ55Sh2oW2nBF3GDcwNpl5uNQgIGW0UvAUZXZhr3eUkE80hMrS0Ez8lmImBqKVdIla3IQiUBppdwQ6xJ3Ep8b8sxUIgZqZGOyy7A1xft03Vzu8HgP2nT54rSwOMp06++Qfe05qeBTXrPau7fnRKfGjOk+FNMcTiDOfqRe/5MoRDjF1y+tw0n99waMh9xRxTKT/NHas6KAoven3hG9HcGgfuczjo9ytXP7gEasy2o6W3BI8gHdJCwhcR1c5bd0Ei54oHDQ7a/MtMkJr+D4TiABMQxM9baaHdtD5YTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <20197632-d8fb-a5a5-2a29-9af261adc8e9@suse.com>
Date: Thu, 9 Dec 2021 08:45:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] MAINTAINERS: widen Anthony's area
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Anthony Perard <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e47c7976-dae0-4d45-e0c0-f845e5522f1f@suse.com>
In-Reply-To: <e47c7976-dae0-4d45-e0c0-f845e5522f1f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0011.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f06cb3ac-04de-4df1-596b-08d9bae7e9ff
X-MS-TrafficTypeDiagnostic: VI1PR04MB5167:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB516764B09BC8EE49FD6E6B3FB3709@VI1PR04MB5167.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/ObBGjo0TfSRPAFl002tw2qE0gCEQzqutWeGVQar69QTt5Fu3EuzJFGbnCEnPdm78LqqT+bHScxGNbcq0tXtCCcNV10LHUYS/76aQg1avkYMrDs49AR/wntf1kY2DRDN5SLC3I09b+9v+S6zJWgoa/BepxLrTfSGNYKfUFmQqMWPKHBOzyZsVPEYOoITo8oWj7xynzpii9u4MIBvUPTp8xbzBQemnUZPr/57F/MZ41666pf3Yr+uPYDhy6BPrJ2diw5096VHn9WDgCXr5cfcRP+12OidRA2nAkMRclauPQ9iLHlnyltzsNvOzmLS54CPLEVDy737BVCigoqF/uyC+JgGrk3UmzQhkCcz+RQjI2lJYovpSk/zoK1Am31YNFdVPvFBC23emZ6apb3ZM4G+vfWYYBJARpgYL1bTKCvaI4cd4nFoFdzQfFSB0bKUhvywBF+KTDwkY8DVZadJxm5qXEwD2mGyLH2BcERCZdM7l6HV+L+89JcptE8fGcLrmJKmZNhsxvR3hMJeCvKxPJYErKOrOk6sEDCifQO9Tocxz7Ng+7gPJbV/C42+CVMX0WEwFkmR8EjHAc58mNgHXgEOde4lgIcl6nDYKIl8ksQCqSSW4fqJ7fNqGkNssUgoNc6y0fUtn+DD+IWInJ5bwXpLcDjf4whhYxfgWNzlOPJSVdXbAMbV2sLvTiu33McQQ0+PKWzTJlQVLkKO4s5ahV7GW1dZR2DbkJVG6v76Rjy2802+31Mq8VHWnjV9e1Fe2RLk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(36756003)(6916009)(8676002)(53546011)(6486002)(508600001)(2906002)(83380400001)(66556008)(26005)(186003)(66946007)(4326008)(66476007)(54906003)(8936002)(2616005)(316002)(5660300002)(38100700002)(956004)(31696002)(31686004)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHVyUHpUNlBvQ0tvNjVMY1pVVlBuRldSQXVFbS9VR3FEZWE1cXhiai9aNy9X?=
 =?utf-8?B?ZHhZbGJBdnVacGpCTzloWmJTZDB0MUVkYTlXWlBMdVFJempzUUNMRzYrVG1O?=
 =?utf-8?B?MmZveTN0VGtRam1lM0tPOU01eHVuVFZRWGM5L3gvY3FDWndyUTYyRDVjbXo5?=
 =?utf-8?B?aUJpY05saHBmWGZPeEJnU0g1UnM0MWEzY0VQTHk4Y2xuV05JRkNiTi8wR082?=
 =?utf-8?B?UWk0cmZaRXNlWVlqT3ltOGxKbXJ1TE44K1RrK2x2cHNsSytBSGRxZ3JmZW13?=
 =?utf-8?B?MWJzLytONEpDS1pnQ20zNUVsV2pBeXo1Y0VRM3AwRm5JenpSUzJDQUFMQ21I?=
 =?utf-8?B?cUZsR0t6WDlFRjNacEFaY2dpY3A3R0J6c1hGbGpjZlloQUY3d0IydHB1MmRq?=
 =?utf-8?B?SDZYSjZsQlFSWlNmeEg0bmtzaUhvQ3g2SG14SldXcWtzc0xvN1BHRlhEdHFZ?=
 =?utf-8?B?bjdXcmJpZ04vQ2RDSmtFZHRIbkE1cDBMZVVRVU1RejVmSkZORzJQaEVFV2d4?=
 =?utf-8?B?bTU1KzdnVHRYclNBTTdKN2JlN250MGptUXdiRm9QZHpvY2wrSGlRL1l2UzRz?=
 =?utf-8?B?Mm1ZbDQ2MmJOc0dyeUZ3L2RmT3dTYUR2Sms5S3RNTWFhOEFodTZERGZueUtw?=
 =?utf-8?B?UHlMRndreFRscFk4eEpXUUE2M1U3b0pzK2FmU2k3Y0dqVlErQ1FvL0NSa3l5?=
 =?utf-8?B?R0Qrc1B1d1ArZmpUcklxNHhsMjZYVXdrMVc0WUJKZUdKNGlUSVJiWk5mc3RL?=
 =?utf-8?B?cW54T2lWZE9WeWZRdHpCUGR6N2ZKc1JMSmVSSWdsSmNzTWRDRVoxaVkva3Ur?=
 =?utf-8?B?QS9CL2kreE5yNHBKT1pxNUVtZFFsb1lxbCtQYWZiMWZVT2RVL1lORTRwa0Ja?=
 =?utf-8?B?VitncG84YmJ6cm1menRtamRJK1ZjUkhXMU5FaVZYS1h3V09KeDZGdE9SU05C?=
 =?utf-8?B?N0JoSGJ1bFAycWVjdWNtbEViczJwTHVJdXY3UEd0Smc2UjBkekk1amVGQlRS?=
 =?utf-8?B?ZTFWelBiNzNielJZWHhGQWE5Tks3Vzd1Zzg5OGRZeWl0Q1Arby9FV1ZOQmh5?=
 =?utf-8?B?djZ6L2t0ckhKcDZCQ0UyS1lydzBEYUkyVEpLTjJmcjY4Q3J6VUZ1NFFMN0hP?=
 =?utf-8?B?T1U3c09pdjV5M25aUHNXY21IbVp3dXBpSEdMNHhTZ2NZUmJIN3hGMUVUdmdL?=
 =?utf-8?B?NmpOc0hKQ2o2Tjg4QlVjRGRxT0I0b2ovcmhPdHBhMEY1SDhodDluaklRdjRs?=
 =?utf-8?B?b1JKQ2kvUkRmWXNWY0VuMEQ3V0xzQnIyb1lpWkFOM3Erd1QyODlnL2dBZTh1?=
 =?utf-8?B?aWVVbEFiRFBzWWFxemRTd24wQzNHbFBTWUpoZUtSWjUzQTAwdW1JRXhDYVJS?=
 =?utf-8?B?NVR6VlI3YkdvMkJQTHNOdjQ2OEpKNzNiSXlpZjN6emFqWWFWTFhaai82VVRt?=
 =?utf-8?B?am9pcGpnV1B1ajdmRy9YL1pRYUdoZm9BcmNrTC93Yno2S3BOOHp3TEdyZGNI?=
 =?utf-8?B?TzFTVnJtRVYyeXI5K1dOTzE3cFNuNFRqd2JDdXJlMTVRM2NQcnJySXkrWlQ4?=
 =?utf-8?B?SytWa2NLRTEwamx1RXBsUy9CeVRLZE8zM21PbEN5SjAwbVRMNlBFVVIzSTZa?=
 =?utf-8?B?MTMrQTg0VE1FQjlJYzhUMmR1aUk1SzhXV0FTUmNXRmpWUUFodkhWd1lxeGpW?=
 =?utf-8?B?WTR4MjBLVXk3NVFzcitxOGszUDNoQjJhZEV3MGVHQnJIM1VTRGlHYklLdGo0?=
 =?utf-8?B?aVJ1VWlyVzBZSkhHZVV0OHljbk5HYVdib0dKRnk2TU9mRHBmWU1MMXBiVEMr?=
 =?utf-8?B?NnBlbEJKdmttSzBqcGVLV3JWQVhhOXlwUE4xT3ljUGQvYXhiK3owNm5WbHNV?=
 =?utf-8?B?cndtQW5GLzg5NGtqWWI4cmUrREtZSGlObnBlTlFxMGNqZUxsMXgyQjJzZTFt?=
 =?utf-8?B?QndmbGhxczBseHVJVjhpV0JJL3hNakVVTHowcFdsYXJHREkwU0NSVVdXNDlo?=
 =?utf-8?B?MWRxYXNnaHllZVd6ajdGYytMV283N3RtYkZDeitEYkdQYy9GQmV6WmVtSkIz?=
 =?utf-8?B?N2xkOS83K01jclFrRTRBVVk1aUFyVmY3aVlaa1AyWDJRRFhIbEpEWEVhMmlh?=
 =?utf-8?B?TWFZZnF6OVN2UllDakF0WTFDRW5YaWRpaSs0MWh0MWU2bkIxR3RKajVmL2Mx?=
 =?utf-8?Q?uGj+SaXhfFrbO9Avlxt70So=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f06cb3ac-04de-4df1-596b-08d9bae7e9ff
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 07:45:47.7272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a7dKh01u6WNeHwJgC9Mq2CXGQRq3/ZI6jtDwwiXz+G7SbY25o1bZ4vUCttVxinykBCNoH8PtzZ4IhbgoOQpwOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5167

Anthony,

On 08.12.2021 08:07, Jan Beulich wrote:
> As was briefly discussed on the December Community Call, I'd like to
> propose to widen Anthony's maintainership to all of tools/. This then
> means that the special LIBXENLIGHT entry can go away.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I'm sorry - I realize I failed to Cc you on the submission. Yet to
have an indication of your acceptance, it would be good to have an
ack from you alongside those from Ian and Stefano.

Jan

> ---
> Note that we're still looking for a 2nd maintainer there, considering
> that Wei's time is rather limited.
> 
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -375,9 +375,11 @@
>  
>  LIBS
>  M:	Wei Liu <wl@xen.org>
> +M:	Anthony PERARD <anthony.perard@citrix.com>
>  R:	Juergen Gross <jgross@suse.com>
>  S:	Supported
>  F:	tools/include/libxenvchan.h
> +F:	tools/include/libxl*.h
>  F:	tools/include/xencall.h
>  F:	tools/include/xenctrl*.h
>  F:	tools/include/xendevicemodel.h
> @@ -393,15 +395,6 @@
>  F:	tools/include/xentoollog.h
>  F:	tools/libs/
>  
> -LIBXENLIGHT
> -M:	Wei Liu <wl@xen.org>
> -M:	Anthony PERARD <anthony.perard@citrix.com>
> -S:	Supported
> -F:	tools/include/libxl*.h
> -F:	tools/libs/light/
> -F:	tools/libs/util/
> -F:	tools/xl/
> -
>  LIVEPATCH
>  M:	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
>  M:	Ross Lagerwall <ross.lagerwall@citrix.com>
> @@ -514,6 +507,7 @@
>  
>  TOOLSTACK
>  M:	Wei Liu <wl@xen.org>
> +M:	Anthony PERARD <anthony.perard@citrix.com>
>  S:	Supported
>  F:	autogen.sh
>  F:	config/*.in
> 
> 


