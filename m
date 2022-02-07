Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EF54AC520
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 17:16:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267226.460949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH6gB-00012i-OW; Mon, 07 Feb 2022 16:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267226.460949; Mon, 07 Feb 2022 16:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH6gB-00010C-Ks; Mon, 07 Feb 2022 16:15:51 +0000
Received: by outflank-mailman (input) for mailman id 267226;
 Mon, 07 Feb 2022 16:15:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nH6gA-000105-AV
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 16:15:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 364a4905-8831-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 17:15:49 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-wymMWLWgP5-pLSO631y9qA-1; Mon, 07 Feb 2022 17:15:47 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB4850.eurprd04.prod.outlook.com (2603:10a6:208:c7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 16:15:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 16:15:45 +0000
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
X-Inumbo-ID: 364a4905-8831-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644250548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e5mk183SW42wH3C3Nr2RfwR6aiDk3tIcNQYfMe3Il+c=;
	b=neO6LZw6YdLYtOJ+Jt596DglXcT6I2sSJ/R0NSGxj9c0PukMxzC15xnLbNMvs0hQnbOBN0
	RKt4U7rYffF/1c1UT9+nFar9dNvpdGm7IRJcuP+nWW7SPg5Cej3409yxLl4R3ONjI+YkhO
	w0pyqRxc8zgFXVbwxolJOn3+swSIAj0=
X-MC-Unique: wymMWLWgP5-pLSO631y9qA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J16YcKCdNiINNCdSL+LT7JAkk3OkFa+Ni1jdLlu6JemRgzwtBWG13GijqKynMJQvQkmHxlFWgOy2k6LcmGd1XJeIRx79TptL3s98Gb2z0jrM9cyX9MyI8akKdwM2SXhD/pmy97W2QlRyjtpRfEhbYb7VkFWcoRranwq4IozPzwvf8say1Kg/8jgALN22psXcbI/YEp3XrWU6XbF3R06a62ACJo7MNxb3oYIa1lqEHjzVamX3MuTBvZ1/IzIvn04cQ9nbjStoM3kxhS6nSEyoOrm37H/EgCoNALZeVbDv5a3oW8tKYLvLCEhVHmNu6YlZ4pmOuaXWBB5KLdLYpSfi1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nSVMMSC7IHwKzp7nhCdWYqKZz9yr8xZqfHy5Kf+TDng=;
 b=L3eocde0XPGiwjxFVVO+a7RJi/uA2IWgoOTRVUS5QpASjNGg4Ji2hoVtrhvmG4n36661I1aeVRWNVKaM/ZGpSFTmGhMCm2vhZsJjbXZoYknr8t5gIBFPOiHVlyat92E1wR7aFyafvx4cuvQaE/nf3kj+cK8je2rAoYcQFuD2pUKf3Ncy4zGl2IL5tfgsYEdVXsauIC/08mjmZS49G36kdNR37bJ54Yy43NoTZkEDeORIUVjhpbX0s167iixYDs7/n7ITloLFI9zG9w8LCSX7kkgwjRId0MK+7QNvGpLTgmASAXGBAB6FanF6iuAJVCRFsY3G/mk8UQEgEDdlQnLvAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ad985f4a-10f0-4a2d-df02-cde915fea3f1@suse.com>
Date: Mon, 7 Feb 2022 17:15:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <7e3562b5-fc67-f213-e872-f211450d9e2e@epam.com>
 <a8fc599c-f620-c4d1-2077-c57068f46a7f@suse.com>
 <deef8468-d607-e49e-f456-6a8013329ca1@epam.com>
 <Yf0k6aoKK5G3iad1@Air-de-Roger>
 <3ad10a99-c706-b95f-1419-2c0c7cf37d58@epam.com>
 <Yf0+3C9nF8+tewLw@Air-de-Roger>
 <c5fea3bb-834b-eeb7-d7a1-1ee609037a9f@epam.com>
 <YgEUwTxhnWVMGMJK@Air-de-Roger>
 <9ce90193-74a0-5642-d22b-6b8c3340c3cf@epam.com>
 <1f65ae7a-898d-2c27-0ada-d71d778b0627@suse.com>
 <YgEsRuckQJIQlkzf@Air-de-Roger>
 <a2a42c1d-d379-00cd-5d55-f443cdb02e97@epam.com>
 <e8fc7872-c7d0-f389-c507-335b809ffcbc@epam.com>
 <21c8125a-2f79-1a4a-494c-db9e4be2a1a6@suse.com>
 <4276fe72-558b-7d95-6430-d4330989dbe8@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4276fe72-558b-7d95-6430-d4330989dbe8@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR1001CA0067.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::44) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66ce40ce-d060-430e-0007-08d9ea551894
X-MS-TrafficTypeDiagnostic: AM0PR04MB4850:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB485056B739BABFB6811C8DB9B32C9@AM0PR04MB4850.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y8Maa/N8Xuq74zbgjnGAmgQWGO9IZdr0QeLNWaBlUdzRALOT8or0kCikjyIlhXT5woIC5PlEgLpQi/IaNfOCzVu1Lg76tY5lYZkfGglbvzdMPkHAQzqesNQ0Oh02FUOFVbO2QoxYb9dzfea73d5n4zvvf4tlmV2+UvQz7buDByiwtqe9ZoTrx2LgK4EdSnEUoIhqniZASJHLWuLuwjwA9iKmFtUrG8FIFa2pzFbTtR2sFNAGDLvwsNn/DCw5CBw6glrE/enBoMMcid7slBeFkJwKmsrOnNTsK1yshMGcJPxV4uSTuInMrUa8hkL+g4p8Seb/orkRLgh5lU8BIbu6v/rrCOQCUSgM6hn8e8JBvEn0BB8SmZ+lpf1GNMBuduTwt5MChdcIfCdkyaLAyzLHfoGWZV9UpuFxgQAkBEb+cNA3JUbp8oAy7jWma9KxS4StbpuSskaoub28dX1o3R5kfK9TX6rnC11+kav07nPMTgl7xcTUdZ+JGygAfS+YRkfrDHfPTeqF/9ZkFc7mfQgJPpCHGsHFhhbq3TBCegl7AVJVSO9+MzpbdX5ehhyZgoKoTtgXlEH/nKvOHbY4Uwjg5YV79TWxuHQR2oFUFy9RmkMMEfeucu3Vfz9LoBWny6Qyp8tk4ZcO+q9ENGwdQQ20DeWfLr/FYV2SX41cAEKG10l/4dsuZj6ta8SH7Zt1OiyGof5HGtyNaCblhdq3GYbyEimmjQDk20F5eGwnu+Snino=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(36756003)(83380400001)(6512007)(6506007)(53546011)(31686004)(8936002)(66946007)(26005)(2616005)(66476007)(186003)(66556008)(508600001)(54906003)(2906002)(38100700002)(316002)(6486002)(6916009)(31696002)(5660300002)(4744005)(7416002)(86362001)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+780CN9V3gSs+h7FvlRZu6GZD+tYdsqNvOKHf8b/f+MooY0AzT4RzBCRIDnv?=
 =?us-ascii?Q?8nVAbRyIKST46njNCeyB28M7GLSZ9cXD4YpUm8sXMkSUMLIOpXN/O27SRVim?=
 =?us-ascii?Q?M3bq1/legzomZ+9rYh8rxL7w4W//7EEub+FWsG/AbBK0yo2hoy/n3j4cyEcK?=
 =?us-ascii?Q?Tft4ktsaTBC2UKkOZLFFFvdcuJolGecxc8c7ce1vAbZ0jlTaXkeJg1B/Rz8D?=
 =?us-ascii?Q?Db8IfgbcI8/1Fn7kn3qMsMivaHY0rnSSMvGHlEj+bs7/hBQDlfjQwm+2xwXP?=
 =?us-ascii?Q?I57QkmQgnsaRwH4mYjdXJa4iTBgTD3Ce6R1BObIs2xLnt38jVEITBuJSmZ82?=
 =?us-ascii?Q?Jl7i0JNwCG8CG1zqX/p1eU4NHSYjZgLLg+V2TcaN1x29/6GoWj0XS6AgSD+g?=
 =?us-ascii?Q?QfyA5d3jQC+N9pK07U99z8GDCVAZYyCsnzAcv1Yx+SoxNyoFHBxRKb4LNbFe?=
 =?us-ascii?Q?UHabW+l9M/yu4P/8km9Ioaf4B6pK8loXz70xlBf2h8Kwvp30fk6TkY73vBTs?=
 =?us-ascii?Q?beDkQAUjD+ZtY+77/CAV8oxYS3plFC34OCukMfq+CALR5h1mOUX/25LOgsHA?=
 =?us-ascii?Q?rT+xmojU/z9ZqOzSDAov+/CMA3yDDaMhl9f4lee6QB7iumltKRXRujXVWk+c?=
 =?us-ascii?Q?tctoLmzXsGLCz/obmBfUrm4fhrsGdJDTou92unZgGBMmoToCm9C+M+eX/nJ8?=
 =?us-ascii?Q?fQcBdUHg58etIORvFOJFeHxZ2Jzm4oqWdcg0C2A2eThwjOvAq8Ip+r0XDczn?=
 =?us-ascii?Q?5A8LW8DF8ftoeeMU3YFOeURkpFUm5FtCWoodDR6gqwbDqN9Iw2hQ5W1JaO/t?=
 =?us-ascii?Q?a6kDephp+jJ3xsAYdXx9dwkQ3wcAnSpJ0+jMrEanJF+4p+jnUnFXYB6yaoea?=
 =?us-ascii?Q?xdVK2Iuk+SjR2jpJ/FUUbHoZoXGx0BtfEunKz72WRbWoJbf/LkyznMiXDAnP?=
 =?us-ascii?Q?ORTuI/c5zYDDHZW/Y+4q6VbSEtcKieszmR+d10rIdP4qAOp6SKGDY59GG6so?=
 =?us-ascii?Q?RCJ1z5KT9ifKJZJQz/sKAXmKDvqDg211WV1wKpdx4fLHqOPgZtC1LJZDRm7P?=
 =?us-ascii?Q?8BCARNm6SfEjj9X1Th2JT8ybyfYVKApU/b1K7hLmNpRF93nPFqaheJO/g5OP?=
 =?us-ascii?Q?EnWP0PXaE/bUAASl4YteqmpoX/BnrOkJeCdJJK73dNnjXv0iAsdxsUX5ch04?=
 =?us-ascii?Q?UIL8fjH669BLQjk3Z32e8lZfdHK9ttQ1HQWFKZQdkugXCjqaNFFrhkeDlrVg?=
 =?us-ascii?Q?xPx3uxgfSagBc1X4uIoYbolvcZKO3ixSSP/oOHMT1MIQV3o+XeAzZphqZ1js?=
 =?us-ascii?Q?Weeb0lqO31XFxDiZF9yDy37xMWV+r+R9nvP2pFFzDrvvERUCItIHQ5vLUWs0?=
 =?us-ascii?Q?DaLrpFj3VE0WrY7MsUoA0Wl5W7oPaG5N/C+nzpmQILa+VxmKahaYwR7/odOt?=
 =?us-ascii?Q?f3nrIpYv1D0DV+98CEikjbp2hMIrRmjDsXV3de9uKgXTfKEfuEJKYhA2H1sn?=
 =?us-ascii?Q?KJ/n5NAvIsdySnqDT1sX8gNVoumfolj547eR6e8tOnx2yIF/CLolW3/0XmT5?=
 =?us-ascii?Q?H2FkYA4EZ8vgd3pFmBUKnNtizFZyA5YzPhIYJQ1xJJxxw9YpZvMT8BqOQtlO?=
 =?us-ascii?Q?70a7FNzQ6lOjcufkOS5zyiA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ce40ce-d060-430e-0007-08d9ea551894
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 16:15:45.6514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GNH490iO4ftR8Fng+uCuw/vD4JD0I4vy1/yAPVyXQTqQhB/r4zz7XGPUUz7hRqOKOQjrPIklIZDf7GBlhvT6nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4850

On 07.02.2022 17:07, Oleksandr Andrushchenko wrote:
> On 07.02.22 17:26, Jan Beulich wrote:
>> 1b. Make vpci_write use write lock for writes to command register and BA=
Rs
>> only; keep using the read lock for all other writes.
> I am not quite sure how to do that. Do you mean something like:
> void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 uint32_t data)
> [snip]
>  =C2=A0=C2=A0=C2=A0 list_for_each_entry ( r, &pdev->vpci->handlers, node =
)
> {
> [snip]
>  =C2=A0=C2=A0=C2=A0 if ( r->needs_write_lock)
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 write_lock(d->vpci_lock)
>  =C2=A0=C2=A0=C2=A0 else
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 read_lock(d->vpci_lock)
> ....
>=20
> And provide rw as an argument to:
>=20
> int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpci_write_t *write_=
handler, unsigned int offset,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int size, v=
oid *data, --->>> bool write_path <<<-----)
>=20
> Is this what you mean?

This sounds overly complicated. You can derive locally in vpci_write(),
from just its "reg" and "size" parameters, whether the lock needs taking
in write mode.

Jan


