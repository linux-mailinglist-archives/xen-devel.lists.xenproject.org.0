Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D951446027
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 08:35:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222181.384262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mitkl-0003RS-NB; Fri, 05 Nov 2021 07:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222181.384262; Fri, 05 Nov 2021 07:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mitkl-0003Oe-K6; Fri, 05 Nov 2021 07:35:11 +0000
Received: by outflank-mailman (input) for mailman id 222181;
 Fri, 05 Nov 2021 07:35:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mr/O=PY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mitkk-0003Ng-1j
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 07:35:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e70817db-3e0a-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 08:35:09 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-38--fVoVTKQOwSCpn4HLu2KkA-1; Fri, 05 Nov 2021 08:35:07 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 5 Nov
 2021 07:35:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Fri, 5 Nov 2021
 07:35:06 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P192CA0068.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Fri, 5 Nov 2021 07:35:06 +0000
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
X-Inumbo-ID: e70817db-3e0a-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636097708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Yt3jlLhJfrajvYxYdkR16ODd5gOaEl+vqdRBKWaiDU=;
	b=if3D/DvacE/9pWxa/7L9DAyMfWtSZ9Z6fF7XtTuCAiLp7CA/tdJQ0PP7fRzb+WpOmC40Mb
	O869HcmIwgxQcyFiRNVO0WTzd6QR5p+1h6UzFNwG/uAPRZy1la/Ls0LRKymwlq7+2m6wjP
	G7/H/iDmXBC9Sl14E27DGpwlHaSv9wY=
X-MC-Unique: -fVoVTKQOwSCpn4HLu2KkA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIiIWPUwXAx2qyDeTt3eTwun1jwZyZ1EqA81Rz300EJW3gtdQWqLfWgcuwvoRYNh9k2+OuOiGPjz7edYst2hqEF4foA+uOS3+9CwWGug5CoO+OQGePIGM98/h1UmWfrpgkXUu6LqW6y7vow+vUGKr3cfFFmM46to86WYEQ5jdcxmHTQ2YP+BJX5gbi7YVGD8vaFeBZFTjbms4+jdnDdTc6v4KkizjYqFbCIRYukSNr4gqQnhQkxNmpS0I3BvaorE8AXYzyB29SQZU6xCvZ5jcfu9qNveyu37LGJu2KZu61Oq//zsGmbeYvWzVWnTZ9eBDpLNLJQ7yeMz76O+1IeZ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/GzU/QGWQHeMxRn5F2BXlpmwnLwWlVaERfJKAxfqYk=;
 b=WDtCnVHfwNnuTf7arEMrrbyY2AAPdnpIN9n2+onroXhS12wcLYRRknRgpg0nbDAsh7oUogIxFn4E4QYRSJJk0c0SGEH0//YzAPyVsSEwDRIYB3cIIux8VOBvZCfwjd+b++FJB+ebB/nfV6thndGuCtcC7zgNjPvc9l/HfVNdG65zSb3u6KQ+zsrwOFvso0Yzy0DxIWGWsBhFgT5AvkAX/xrzFV4ISOYVf/3/0HE3o6zIdTy7A2osMfMJl7WxXTuNm9oiu96O/lXC7Uj/eB9sP1/a1NU2ozFvGdh9MHTuIEVePTglqtaUAuqohYh/2OKPm+05DglE2qs/4VymJh3mVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e4b2e1be-0e41-0e6e-5ea8-3c12b4593724@suse.com>
Date: Fri, 5 Nov 2021 08:35:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-4.16 v2] xen/efi: Fix Grub2 boot on arm64
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Luca Fancellu <luca.fancellu@arm.com>
References: <20211104141206.25153-1-luca.fancellu@arm.com>
 <81685961-501e-7a41-6f6f-bc4491645264@suse.com>
 <alpine.DEB.2.22.394.2111041351490.284830@ubuntu-linux-20-04-desktop>
 <97C884F7-0577-4996-AB79-0A07A8D48FD8@arm.com>
 <alpine.DEB.2.22.394.2111041431070.284830@ubuntu-linux-20-04-desktop>
 <9E52FA33-422B-4B1C-A6AF-601CDF565700@arm.com>
 <alpine.DEB.2.22.394.2111041449180.284830@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2111041449180.284830@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P192CA0068.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 401773f1-dcf7-4b1b-7483-08d9a02ec9da
X-MS-TrafficTypeDiagnostic: VI1PR04MB7038:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70380B5EDC83E219AA075ADFB38E9@VI1PR04MB7038.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dr/54y9p95mt6957k0xUT5j6HFafDL2cWWTTO+/hGASsRMcnjSdx/xKCcBep+y5XSyvqCinJ5s4HkzjwWLbGGddfG0I8RZZ8Yf20pmTmmPakb+o9Xgah0k47ZJIFrIKLJlComZsQ3yNXSwuXPq6FQk/tuUyRt7DYjrFwPk9A7ZI3qeLGTAUINUUbYL6c0Xv2S+MxuClKd94LFWJYMgXrgX90IJWLj0orJI6jB320Ei8W2c4rOrYGW9Ga0Y3jfqkN9opsLvN/iOQnkdI67tfJpP6ehPMev9+hthetVBH2fxOr2sSatZkqvN0J9RQAdYOatovvxHpRJi+QRP2lxcDjdd+CB6dn9+sht93XMJmJHD0qrn5Dxp3BiI/Yg9/JQpzDjp1u3C+ItVVDyLLQdROPxRHwjWHaMbGXDvEXaXgtitdqJtg3P/MstWjMXWWwBCjcEAQXCkfKpw4j86cVH8IFJRMpasYNNfkEPhIQQxc04d3/MElMuATWrYmQ49GmfnXAniPIyj3Yx6HlTcIwGNzZQy2QnkiAcUz053gX+1SJ/wdAzXcf5AfOLVtBl8y5pHsQvGJeccemVobX9HmfFJiUxCBywzZZBaCxbsWO22MToRRoPdwec0SLC8sdV1uDDzd3dc8Eekwr30YpTgM5As7toVQtIH1lIr8myZlAIkbKBk9YzWPsZg2e16+XQcyq5iFHXgLlUhcJmOw7Wl13l6XRtbNUZbF8MN0t3Qoq7erjizTZLkGB4YEVCKBFkRSazL3Z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(83380400001)(66556008)(86362001)(31696002)(31686004)(66476007)(316002)(16576012)(2906002)(66946007)(4326008)(2616005)(38100700002)(5660300002)(8676002)(186003)(6486002)(54906003)(26005)(508600001)(36756003)(8936002)(53546011)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?abFBlyAKPCcfCBKbX4gJDyj48f3Phh1xmY1taJMITxxNrIYG42b5H0HHazF1?=
 =?us-ascii?Q?KROppGBX6djZaQzVRR/LaNvvr5jaVGX9pWly5+pws71aY0AjReG4kND4r0q4?=
 =?us-ascii?Q?Hd1Bqgihtx4Cqz5C/sVeOZLTOiEN0Ow0vkn38PuZ2N8dZVMweNSuB8VJS+lf?=
 =?us-ascii?Q?0dMm1gU5WbgLW34n/he0JezDyNlYk3H6m16B1JYxNB98+q7dK5AWAU92Ft9+?=
 =?us-ascii?Q?jd1IgSUn6BGIx9Ec6n/qsjH3YxjeEvHI/7y5YiMXCZ+2p6fT23QJBDvLtN0n?=
 =?us-ascii?Q?omyTUDUl/syyYOJHwUUvDnRz5Dkjz1oX8Rbcvo9pWINbO0Cxg4WyCf2zV3Hv?=
 =?us-ascii?Q?E4JAe4sLX1Zy7hCfLnIRBSsjB5/SXvo9mr5LTRJ+0PlyazsAWzbBwaqna11i?=
 =?us-ascii?Q?//0/sot4lXqZlbeEOXiE7rM2rU71jUQc13U7gixbB9n34BzoiyyCoD3CUD0h?=
 =?us-ascii?Q?uuJdsO8yQoe/NsoFPNarXvFlpts5Jk+gPWtheh+0PyFyDVj1QGXuvzUK9510?=
 =?us-ascii?Q?VI7JVqnnVGnP/xloatVdfqwAAJtkxGIBwkLCa12LAtiuyAspUilGPxX5hYux?=
 =?us-ascii?Q?cG/gGKhkzqNtt6stiJwSOor7r6T8C+ekEcQNDjnuTAlJgXILyyLc1r1k1cS6?=
 =?us-ascii?Q?zrD8ZBqTpqDX/KmLFDNlI4ZL38Xk/DoG/tod67lmEJhSqCbIZWfE+wPXwNDS?=
 =?us-ascii?Q?JZTnUopx+hDtBeA/i+Lx1hZD1jq99U/JvkZnIKPPxe7R+t/8/g7jLt6GPJU0?=
 =?us-ascii?Q?8tUotRKtOFTYbmuki4rIpeUTB2UyrvXJ8j41H42GWKVxn6/aLUIGEkna6B08?=
 =?us-ascii?Q?pKr8u9u8SJV1wk8sgjtW0MWESsQrGA2fiw+/jkpp01Gk86zp4gKDJ2Z/WqhA?=
 =?us-ascii?Q?hnDsEg1H+kI95MlaeKyPsFbHDELK+zxakAz96WyCNv0LtTkSaZgyYNt5TTv9?=
 =?us-ascii?Q?dtOHo1dMbZ9fRB8bB/t5YBy6UiwrIt7i6pZn/nLEUfuviU3/p6qkCkcjMS6R?=
 =?us-ascii?Q?jHNsosmzim4E5zzCq/7Hx9FDc36xxVc1mmbIsvONHSD3f8WHyDJlmA4fEfNn?=
 =?us-ascii?Q?Sf/xQnv7ieD2I+rJ76SfEFki4w3sgjG3xAooiHt7/c6kRVen4f24Rak6EdxM?=
 =?us-ascii?Q?qeGRJGS+eww5hfDZz3cm7dmoR7qowXWln8dXRXl2SiE+FS6Zt1aQZ3XlcR2A?=
 =?us-ascii?Q?b4jICyEg0wdhcLV4yec6rEtKq/gopZSb4kARcoepsfv7AwiBVejo+9B5K/bF?=
 =?us-ascii?Q?smt9l2A7loftrCzEeHGez9QbY1s6reHS84rinOGap3IBty3+Fd+ty4iJlP1z?=
 =?us-ascii?Q?vaaetxPhv1dMrMcz6eYrgbz4ATfvg4LfP28dNSS0x6hXgvHkGl0HfoApoY4V?=
 =?us-ascii?Q?rrCaV4Zb2CFAu2Mnv+gI5yRReb75GQAvd+PK38Hyt9RotF0VbnJrTuqeEKi/?=
 =?us-ascii?Q?UCM+JNRUMuOC7YL47oKf7UBkAoZvlFix7I4EfIhV1AszD2j67QcksxG1OEPd?=
 =?us-ascii?Q?PrD60v6T6JKBZL6pCWndXyXtmfn40alAAmfpcxcZ31y5aeMMe1K6GGg7XTNm?=
 =?us-ascii?Q?+1QFZircoq6t5s1k8MQfIcb1XUx7wr1H/E08+wG8kVCge6voNlvIDBzkUv/d?=
 =?us-ascii?Q?VsNFr/eDNLeZ2w6p+uZSDoQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 401773f1-dcf7-4b1b-7483-08d9a02ec9da
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 07:35:06.6372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTD4TYYoksaywaN9P1KSXpr8ibGJPkQWFEXCAhUnB7e2tkJH6jQ7P2JZYGlocscTGJkPNTMJelrtfMQaAO6xDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

On 04.11.2021 22:50, Stefano Stabellini wrote:
> On Thu, 4 Nov 2021, Luca Fancellu wrote:
>>> On 4 Nov 2021, at 21:35, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>>> On Thu, 4 Nov 2021, Luca Fancellu wrote:
>>>>> On 4 Nov 2021, at 20:56, Stefano Stabellini <sstabellini@kernel.org> =
wrote:
>>>>> @@ -851,10 +853,14 @@ static int __init handle_dom0less_domain_node(E=
FI_FILE_HANDLE dir_handle,
>>>>> * dom0 and domU guests to be loaded.
>>>>> * Returns the number of multiboot modules found or a negative number =
for error.
>>>>> */
>>>>> -static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
>>>>> +static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
>>>>> {
>>>>>    int chosen, node, addr_len, size_len;
>>>>>    unsigned int i =3D 0, modules_found =3D 0;
>>>>> +    EFI_FILE_HANDLE dir_handle;
>>>>> +    CHAR16 *file_name;
>>>>> +
>>>>> +    dir_handle =3D get_parent_handle(loaded_image, &file_name);
>>>>
>>>> We can=E2=80=99t use get_parent_handle here because we will end up wit=
h the same problem,
>>>> we would need to use the filesystem if and only if we need to use it,=
=20
>>>
>>> Understood, but it would work the same way as this version of the patch=
:
>>> if we end up calling read_file with dir_handle =3D=3D NULL, then read_f=
ile
>>> would do:
>>>
>>>  blexit(L"Error: No access to the filesystem");
>>>
>>> If we don't end up calling read_file, then everything works even if
>>> dir_handle =3D=3D NULL. Right?
>>
>> Oh yes sorry my bad Stefano! Having this version of the patch, it will w=
ork.
>>
>> My understanding was instead that the Jan suggestion is to revert the pl=
ace
>> of call of get_parent_handle (like in your code diff), but also to remov=
e the
>> changes to get_parent_handle and read_file.
>> I guess Jan will specify his preference, but if he meant the last one, t=
hen
>> the only way I see...
>=20
> I think we should keep the changes to get_parent_handle and read_file,
> otherwise it will make it awkward, and those changes are good in their
> own right anyway.

As a maintainer of this code I'm afraid I have to say that I disagree.
These changes were actually part of the reason why I went and looked
how things could (and imo ought to be) done differently.

Jan


