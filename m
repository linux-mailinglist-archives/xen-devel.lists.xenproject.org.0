Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5AD4C407B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 09:50:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278884.476305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNWIl-0001w5-Jk; Fri, 25 Feb 2022 08:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278884.476305; Fri, 25 Feb 2022 08:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNWIl-0001tI-Fb; Fri, 25 Feb 2022 08:50:11 +0000
Received: by outflank-mailman (input) for mailman id 278884;
 Fri, 25 Feb 2022 08:50:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNWIj-0001t3-VR
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 08:50:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee6f4987-9617-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 09:50:07 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2056.outbound.protection.outlook.com [104.47.6.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-lrbjZ2vsPMmROilO78iEQw-1; Fri, 25 Feb 2022 09:50:07 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5970.eurprd04.prod.outlook.com (2603:10a6:208:11e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Fri, 25 Feb
 2022 08:50:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 08:50:05 +0000
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
X-Inumbo-ID: ee6f4987-9617-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645779008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=87vJMMFCo73OKXazDCc7e0KRnRbAiz+e8E9jO/WlJxM=;
	b=ce97KJEf0Y8F22lMZ7g3YhEyWPfq9LOmYSNjTeflcGWb0VB0X75wDsWeJ08Ar3CWdUUu5n
	/oVE6rQc+mTaz4t5Aaio+pFICgG+TdePXcoyZ3VMsZbUcXgbBIom9mcwyFn6uhQd4AsO7P
	KvetsCQesasK3e/H3Iay74h+z5nQ7oE=
X-MC-Unique: lrbjZ2vsPMmROilO78iEQw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WE+LCd3+9P+eWXKoMKBSglQblRap+3I4Lme/BLI6OvtBqOLoBxCGXmPP1a9TSA+ycRbwqyT7Yo0qBLhTJE2gHNcRbvFR5OpTQtjT8YlMEw5DQNUnz+SRnxb3AmhvVEe8FhbSv+B264ZHowQIqqa7mr+Tpb7zC7Dzia2fnZGuZp9e/KohzVhWG70AGrg8rUUNtpOHG+pUWKT13ChfZiHRHBYEwLjZKYMHpRHnGMk8rk+Cay+CRUVgChDRGXJkmXTlGlwycMYsC7btHfszILtlFL0HTGkju+W9hFUa3HjmK6gerLpE8fiSV/YrPrzQ7FXzHY4VDLF1SIUp3fJUrcr3ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=364jzE8FU/zdW/4zgsvrrBay0I6lxHePDd7eK5ROF9g=;
 b=ZrVWzNbWO5feOK65K6r7JoABBmJAAXV5tEouIO2ITJdsAE/4W35QMzCdE/iRmdTY2C2Wl4xvtSddbcoB5kVjvVwlo3ui62/DTCdYA15rdjuLvVm5hij7pnHduzqfLzigVVayrjZ74UYGRGdIbt0dFxO6c6o62Fyr2jOwN5Z/tbRhzmSaIJ+d0ZsBGdr2ou5bYVbwbCdOKE390MngosQ1ZqQONQUN7EFc6SG47b72C6KGNFFlatVabVJtGHZRPjuWj80S0sdRZMoDzb3QPkZbsV127cKEHs5RT5sEVnyCrCYtsWOr5q0qLmAB3O71bP7LtUQD7C4YzNFCjyX7ildwMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <37c1934c-1d73-a9cd-64ba-8e004e4ca916@suse.com>
Date: Fri, 25 Feb 2022 09:50:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] pci/ats: do not allow broken devices to be assigned to
 guests
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org
References: <20220224163701.89404-1-roger.pau@citrix.com>
 <87b47562-7689-de37-f2ee-df05ef01c923@suse.com>
 <YhiWU+7Q9/Fbsig+@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YhiWU+7Q9/Fbsig+@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P189CA0003.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f739941-c08c-48a4-211c-08d9f83bd1a8
X-MS-TrafficTypeDiagnostic: AM0PR04MB5970:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB59706FB01879BB87F728809AB33E9@AM0PR04MB5970.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0jzaolrWWi9ayROrEGCwB8rMf0tZri0Gpem6ZeMsx+bfFoyL3Yn0dcPXxK7XDlPg1wD4IWDk7RxiP5xMR3zJ4iqDI3434vo0i+yu3mVoINy43j9sQQelxDO6csFy2XBAVtUK3N/3XKsLVT2ZUtjz8XKka8+8DdAxGm7vhqCq2exuNmI5hmJGw8ehnNMe4itmZlEgdytcLI8tHgrjHp9bspx6w2hA1tUvpUmfg203Zfem0FAac1l7MgOmnRjjGuxhuWX4R9gf8NoecRJ21HLQZnIF2jMg6GOPLqLr+kvqQot4vvyH+MEHOHb6EN6ye4Xv77/5SEOG9lkoY0XpiGKUZszGXvClhgiwowY68S3ykcS/TDqTnAD5R0yVjwryXE1FLbEidE7K+AgfxpkibjaX7zOX8NL21+61zOO/Yyb3DLR/cjVbjS4LHx0CgVD3TL2BpP5vIxPDKz9yCxx9NpLmN+kl2Pd/ba9k5y7g7TBcD8D/d5k6SEncetqYtg5BWd6bEQnObbyB5oZzGxrlNl4MHXVxX/oKRHKGykgr4i3cA6xbw8YAXvlOD/XP4vBGNBJ2Gtc/i4IBOiaGD/Vw+/zgcesC3xOll71KTFENRZizj5v8SfL55Z8Bkgonp/70Isag2XzJOrb2O50szhoRTu3QLBdVDeLrZxWyRMxfH88N3PM+Pgwj6tiw+gVsccQ1iRIDDibfXkRHPDltaw6f0sAhUVUWxJ+cxMNSVoeGELzKKeg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(36756003)(6486002)(2616005)(83380400001)(53546011)(38100700002)(186003)(8936002)(7416002)(31686004)(508600001)(26005)(2906002)(31696002)(86362001)(8676002)(4326008)(66556008)(66476007)(6506007)(66946007)(316002)(54906003)(6512007)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f0g4P2t/KBoMmDDITpFizVxCdoxoOugbpQCpgBC0YPg4ZKJqAijUEmu9Lgfw?=
 =?us-ascii?Q?YOf8B5VUmnLhaclKXxeMSnEV3qrLYtmjlrwEOOjeTB1Zyu/cbxRtK7WaPaF8?=
 =?us-ascii?Q?jylymezrIhgVm00Az6Ccl02yJdnsQ5D2FshR5ZdYkejxCxq+RjHkTqXlgVL0?=
 =?us-ascii?Q?Ot5BVf/nEBvAuulEuNyCTqAxQum3ujLNSyrwS4vV/4dxp0kMBL8Skb+Uf1QG?=
 =?us-ascii?Q?CGSPGJ9RQUHbvCQz82mNtVogdSVo5lj7tlIMbVXXKCqUaDV6VE25mXYUhdjm?=
 =?us-ascii?Q?cuRG0g/KzI4z7NdjT20q3vL7VBa9FEq5QfMITyG4dBWhpMhgCODKwzHq6Z78?=
 =?us-ascii?Q?vnPVX8Z8uUF9Uy/dXNgHyduQJOX2JD7tQmnZUjRB4YReNTF6R7vaKWxwT3bg?=
 =?us-ascii?Q?a34rBGmFqu9oF8y/ueKgMTizidV4e0CIakjJxkj25S8PujH+gFfJz9p3fzce?=
 =?us-ascii?Q?fzyfqFm8igyiRZ7zFiTEvfjbz2rpMUUwqe8r0JJyTwWelQLtohhyIpXNan3A?=
 =?us-ascii?Q?lLTv79IMUk547SkTSe92IJh/gQZ6xIs+XVX7YfIVpJGWYLSkfZqMeepOhAg7?=
 =?us-ascii?Q?WfVW9VT0lPdEP10aVCPPkns9UlipWdkJsMpI2L/X4kvjuGSEbA/vRlwuPGiQ?=
 =?us-ascii?Q?MM0jhUMTFSxh+9ABGfPoYIiC8YtcF7v0kaYQEJtxe4hkeABfG6WSKKP8Uwbt?=
 =?us-ascii?Q?JI4XyOz36e0cnPnqQl4GyBvv6ku41TbhlhEgi7qjU3xRcfvMjuxeKActGREN?=
 =?us-ascii?Q?w7Nc50T6n8P/H9+uNjLDrSjpBQYfXw4L14uzExs7KRQPbnOmwkfXgeGb0c86?=
 =?us-ascii?Q?vAsOZPSVrHimlReepAyGHM70uSvUFjy4d4N+xADMetiDgQfmxJKJ3duVty/k?=
 =?us-ascii?Q?ZM5ZxEwCbP4xhl3FDY+zSaz0Bc36k90brmUuG/FIfE8cMhrAfUfgq85IrOQ9?=
 =?us-ascii?Q?e18Z+Va4CbXDql7ZNPxAJuaWFuUCyoKpMOZxCCnrtn/7GYte30OCQ0DhkMek?=
 =?us-ascii?Q?VzSEcOqK+BPGbdLo/9JF870yZ8q4ZXnQFgKM8i4u/mEZX+K/XVRIsEwipUkr?=
 =?us-ascii?Q?rpGS/Smrx8fIPiNIPzx3HAfQ+rG/Zpu2ACgEXBN2gmHRm37XJ6bD2AdmedWn?=
 =?us-ascii?Q?gV4px+f0l384ziZDcfQunCJVGa88VlsNy9l6F1nFDs/3FjYfYf66wPqkuW37?=
 =?us-ascii?Q?wQ4AVTwQW+Kq+F5q+mZ0hlf3OGFoZl7VjH7x8mrv77ggYcfRG+7nUr2f9hWX?=
 =?us-ascii?Q?h+uLnTkKYMdN2iMQJtXPAAYz1beIOtQlFK40jhW0bvYx6QDLUTnJcSKC1EM3?=
 =?us-ascii?Q?h80ZonBTG/Hr5ebN/e12acUi4tK30332Cx7tSXvytptkVVPJBBDjCLq/SF02?=
 =?us-ascii?Q?uFo2EML676Uk02siAilkkQF/VXbxK/w4fxKG+tCjtjur7yQZ0zrcTo6A3NRE?=
 =?us-ascii?Q?1QEMxK6gBSlnJIcSn1oFotkKU1lOj3otJXR8u+sD5yzcuu9zFZuuIkVaxYtl?=
 =?us-ascii?Q?ij+lYO9X7v39sQnjBO3ofKYMMa+/am6sV3CclwbHwDUFS5Km2hklKHjOgP+8?=
 =?us-ascii?Q?QXx5nQ2QmtVVphkNtDAlEaXnpl5dn5Oh6S944jBqTCAG9pearopnIE6lmkCu?=
 =?us-ascii?Q?uEi2L+tkjaL64ZFVguv9L8c=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f739941-c08c-48a4-211c-08d9f83bd1a8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 08:50:05.5570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+93EAO+fMnzHnIfs8pviD1KsYeYQB9czOrOUPGA2JxRmCngiXS4auL0xDCCYsq3jAPDOUceXti/HO/inUrniw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5970

On 25.02.2022 09:41, Roger Pau Monn=C3=A9 wrote:
> On Thu, Feb 24, 2022 at 05:43:13PM +0100, Jan Beulich wrote:
>> On 24.02.2022 17:37, Roger Pau Monne wrote:
>>> Introduce a new field to mark devices as broken: having it set
>>> prevents the device from being assigned to guests. Use the field in
>>> order to mark ATS devices that have failed a flush as broken, thus
>>> preventing them to be assigned to any guest.
>>>
>>> This allows the device IOMMU context entry to be cleaned up properly,
>>> as calling _pci_hide_device will just change the ownership of the
>>> device, but the IOMMU context entry of the device would be left as-is.
>>> It would also leak a Domain ID, as removing the device from it's
>>> previous owner will allow releasing the DID used by the device without
>>> having cleaned up the context entry.
>>
>> This DID aspect is VT-d specific, isn't it? I'd be inclined to ask to
>> make this explicit (which could be done while committing if no other
>> need for a v3 arises).
>=20
> Indeed. AMD doesn't use iommu_dev_iotlb_flush_timeout so the function
> is VT-d specific.

But perhaps wrongly so. Which is why I'd prefer to ...

> What about using:
>=20
> "Introduce a new field to mark devices as broken: having it set
> prevents the device from being assigned to guests. Use the field in
> order to mark ATS devices that have failed a flush when using VT-d as
> broken, thus preventing them to be assigned to any guest.

... omit VT-d here (i.e. leave this paragraph as you had it before),
but ...

> This allows the device IOMMU context entry to be cleaned up properly,
> as calling _pci_hide_device will just change the ownership of the
> device, but the IOMMU context entry of the device would be left as-is.
> It would also leak a VT-d Domain ID if using one, as removing the
> device from it's previous owner will allow releasing the IOMMU DID
> used by the device without having cleaned up the context entry."

... use this as replacement.

Jan


