Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 615CD48C646
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 15:43:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256668.440610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7epY-0004DN-K3; Wed, 12 Jan 2022 14:42:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256668.440610; Wed, 12 Jan 2022 14:42:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7epY-0004Al-Fm; Wed, 12 Jan 2022 14:42:28 +0000
Received: by outflank-mailman (input) for mailman id 256668;
 Wed, 12 Jan 2022 14:42:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=no1k=R4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n7epW-0004AP-Tx
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 14:42:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da3b89e6-73b5-11ec-9c70-5536b2d1e4e1;
 Wed, 12 Jan 2022 15:42:23 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2055.outbound.protection.outlook.com [104.47.9.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-H8-aPQ7cN-e_rUjHAT0iXw-1; Wed, 12 Jan 2022 15:42:21 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3535.eurprd04.prod.outlook.com (2603:10a6:803:11::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Wed, 12 Jan
 2022 14:42:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 14:42:19 +0000
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
X-Inumbo-ID: da3b89e6-73b5-11ec-9c70-5536b2d1e4e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641998542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hcDraGuilPP/6ZtPFI76HcQCZPyrFSvAmBeQ+5/lUwM=;
	b=QGuGboTwOfQYu/hnDrYuZx4aFp2RFedTd7YIxunhSF83lR42MsgKuDK2E0RKuMqXiz6L3Q
	ytuhKDiWI4D5Ez131Ylu7SKE9DTHAgU8ZWvAyePjAtENEf6evYPs/KmZsLCBhE0zQOBoM0
	FJcg6x9F+jIbZVrHICd+OJHMSwWj0KE=
X-MC-Unique: H8-aPQ7cN-e_rUjHAT0iXw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gOuu/h2T6leo0G6vVtaMuiUHLcEGCk+Oc3/RHBsaNtA3pdirbkpcSlIw1BSYxuGd+OyXm/W/AvAuxqjf34xZbfM/vV41XGGraDYJwrz53AFO0mWdbGhCVFnEazF5dKIQtP3KFK5V2fcErRMW/YkdQASwOP8fHnrkC+U97XzmBHzlVri/JcpVwyNPZTn6gJ/iW+4CGzCetGZGcw5HdYNmBEUgty9wYOVXpnATmslKJ5hoBvP+1Bt/JPx4QHuPzo1Bfk1a/+J2gwNnzs7qoEWoIh2grxsyosK4Ib9wBse1RxHMutcCC/Xn96a5lmfWQBI4wn5zA8mIGH58bUqvAWSL+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3c7mr+1IjDTFZ2qeQkxXhtgqsz25YkWDAfDW3Iw1FzM=;
 b=PSVhrEyP2Gr74Y9LAoh+ZFhl2IWh6DYqLdSUdQwOnJZ4ffym0CG5Kd5X4lX5lf08t0zqXcoIP+IYMQKIYb9YB/WfRvLUkxs8rX6e7bpBkcXzBviL5YtR5QbELQSVsW8mrRa4Au73tCicTD3YsVAIVQs6cZzWNqfUEPuFXjMtJiw8k4FtYQEWwCe6s+r2XoXwM4cIuDHK1+Grs+aVbONjjOK1zeh9Jog/V8upnIKHrsS6xFP3JbT+5gGvH9N7dpXTZdaDXISziVdIgHWnQJGKFVupWqUr88Cp+qJxbdXupZMm9cC7RTlpQHdIyOMDrtKXBUrqk5AlYDrG9hc5pSfeog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d738229b-11ed-db77-f313-5f1618ed95a1@suse.com>
Date: Wed, 12 Jan 2022 15:42:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v5 03/14] vpci: move lock outside of struct vpci
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
CC: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com,
 Artem_Mygaiev@epam.com, andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 paul@xen.org, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-4-andr2000@gmail.com> <Yd2ffPULbmNpSmaD@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yd2ffPULbmNpSmaD@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: adc0f04f-3cbb-4e65-bf06-08d9d5d9bbf1
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3535:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3535CBD69D29779AB4B31630B3529@VI1PR0402MB3535.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sQ6iUurMWzeBqi60HdxVE9ANQpDmDAZL8hLGlT1qfvXwcDI1WSX+rtiUFQhFwKi10ElozXs3gUZdtB4+47XWm/KMqr6kh0/1Nu9w+CyQZ8eYjnkvfoex9Y39z6wuCItkxp+e2eporsA5/GqF8cL90qNZKhSClCFmUvBLuEO9fCZyAa92QZ/7iRzVTUdWuBqAydMgiy9+vO2VoI2cTCbgduMxAc4r0s1deAxA7i4nJMeItqCBSuTCWGrVHJtM0xJyhsetmzQiuTe7zOplYvs/cDOFQhfi3ljX8vzvBooQV2Yceq0lSyQuXJPCxi2fZSe0FWEm+2EFgfXarfALzPD3GQPwJ0cpKzc9GKO0WpOCG72YkqxDu48Cf45a34dqMIYM7xcGUvbJg3cyGiB5GWZx/v+5fLfmHCq8aQ6+F41kpSlsK/79pNcBmZu+WFZHGFYc0CDLEwIh28D3tS/KgZ3u0Y3Nqmxf8Csn/BwBBWn0pWAO8RbeSNmN0e+TyNOWmtTxwoL0LDLkAUJ65DN46DQ8ZG8+R6VmDU5jfYE1fX1miNuKqLYErpwVkCrzapNBlCFXlwTkYteyNsF6h86p713wYKw+yFWS3jziom2KMHMr4y8OG+i1brDWVXHxClWF19d3jhXnxIDDLA49rE+Bck1iflmgJVZGJdWFHbPjrpN6rXBDeGWGD+Iwqn+gaUHbteECn2FRkRHAIgkSDCvpPa8BFsb6ZeAJjTP+rS4+sRd7980=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(66476007)(110136005)(66556008)(66946007)(38100700002)(6506007)(4326008)(2906002)(8936002)(31686004)(53546011)(31696002)(8676002)(186003)(6512007)(6486002)(7416002)(26005)(54906003)(316002)(83380400001)(86362001)(6666004)(36756003)(508600001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S+SvK53fN3uhST4pnD/YbZZheR387V4NsqYkqxwQio/fUfYXLlaUvU7ii71K?=
 =?us-ascii?Q?+qQ+xzRas1TAM0wdVmq7lRNpBh7gYpCYEpALDkmf41oW13CDw5v6MKLrjrTV?=
 =?us-ascii?Q?iHOOVbN6GDKVl8/QSrtS3YCwizRw1T5UYURihKEckW4BEjTsNxZYsyqawXlF?=
 =?us-ascii?Q?JFS8NU+dMVrO9J7w1cK3sQUp0DaK8DqJxmBCELGt/1Q9Cmwdrt1D6WGuEoUZ?=
 =?us-ascii?Q?dZ8VYe0nGJJDf4kV/hWwkWWBytTSPBGAbOrB0R69qlxfv9QRJOaT4pRUFQfa?=
 =?us-ascii?Q?DBh5kd1oxfFrL5h5cXG+twrC6nIpeWem8dUBXKK66I0UTs7jUDb5Y5cQ4ZRl?=
 =?us-ascii?Q?IpnlZRO00vVb106ZVIfjDPEVQJxERmSz3h/4YlM6BtfYcezyWNNucXfGbxZA?=
 =?us-ascii?Q?5+1X7kfn3x/nSxBznsJPSpMWWkrvQ/qo1EAcHxwkaT1Kg9nVfjHrV2oLzxS9?=
 =?us-ascii?Q?2rUZPthRJW2CD5yRmDHWETBURKCZzclyAW1D/JXeSVi30NYoKmfKbBysx68A?=
 =?us-ascii?Q?nqn+lUWqvmdX0edb7H9mkaO4pPT3F5X+pzYtdVhioSy/GGoYTn0kl6zi69/u?=
 =?us-ascii?Q?XIeiuLVObzw0Snk6eV3WvGgZVQ7aeuk0j/QmMmON1RV0tf/8W7KUfceIk7Lw?=
 =?us-ascii?Q?yhQMFhA9yyRlDb37XSLZiE0hLDMkRD61oQylrtT8baVpwMuZ5uJ8bfJcfspj?=
 =?us-ascii?Q?IDJTLE71Zjlun7jgo/zEIXA/HNnD8vjTjtR9a+XDRE87XNl6rnYgK50ITbRr?=
 =?us-ascii?Q?dcr+943hFMdovhirnc5I4iUIV7mrd/uOTVLFMtQ4r5OUmtJLTPA7t/08I0lX?=
 =?us-ascii?Q?ZNkw1hH0Ys/OM3ZN3T/hj3XRPjTXj5kXTl2WeBQHovOnZQbNxSax9wS/CyTM?=
 =?us-ascii?Q?2yhANMeUJF7e2NGqhkdeFXkk/HQBZpof/YxhK71hXdeK3c2kJHl93K9gzrwx?=
 =?us-ascii?Q?1wSyjXQMIVE6IFdaHm4l7fQovfNwtiJQI+XHwKK8ZdPL45QQ6Y7o78xNMawF?=
 =?us-ascii?Q?wdWlwq7+/+V+uHhawvyJ16KbwpeAyqcI8lGcA2C0xA43vapsZRMRLx1TyY8q?=
 =?us-ascii?Q?0tiEgIHLjYGgBVAbJ4sA5dxrSDY7sxT6sAxPRSUbHWADM4rQ55dOIOqIHnyU?=
 =?us-ascii?Q?oDPynb9CbXI0H3pm0woP9vdqZVRMnsnM+Ed5tc4DwaCmUKQeah2l69Y5zTv7?=
 =?us-ascii?Q?rlLUBCS2r8XkSxahZiwUWO42SdOCf255fkh25X7fXq4ekhHBGEW9MePHyfQf?=
 =?us-ascii?Q?2T0x0ATIIzjTurglBsh4TUZEqZlE8uQk+7o+ISeVCtmLHy5bqCe7Io91gk6+?=
 =?us-ascii?Q?5/EhM792HqiqwS/gWEdsHPVeb75lpN7QZ69/nwCyyiC7RpKsbb5y0c8wXkhj?=
 =?us-ascii?Q?Uli2aH7hPNGgz+j+9BC3e6od4qhB414qMIe2jWTr5z2vx5BW3HLdgwnXVzct?=
 =?us-ascii?Q?b9Cj+3vY+vYHjY4rBeDMwgIeN/0AUffCSoK0748zDvqFTa9bqBr/okqw3GxC?=
 =?us-ascii?Q?ylQf3IYO1LcvJebSnLIzpst+nL0Lkkug62mEM2f6y4vCJZaQtj2oW/fpavcZ?=
 =?us-ascii?Q?sDw8IxlS0v+cLVeAbA55nhONY4STZD1MPXKuEww07B4LdPnjT3RjSbe/paoQ?=
 =?us-ascii?Q?D0xPh5k4IiIwcEwu2Q17L+o=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adc0f04f-3cbb-4e65-bf06-08d9d5d9bbf1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 14:42:18.9356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RRyLf0xV6Nk/Uah6wFkYNyiZx/1DJSrSTWBlh6b7LqTqkIe1NxqjBG+bMc2N6zqRJE3qqFqQy6hScnjxC0K4Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3535

On 11.01.2022 16:17, Roger Pau Monn=C3=A9 wrote:
> On Thu, Nov 25, 2021 at 01:02:40PM +0200, Oleksandr Andrushchenko wrote:
>> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
>> index 657697fe3406..ceaac4516ff8 100644
>> --- a/xen/drivers/vpci/vpci.c
>> +++ b/xen/drivers/vpci/vpci.c
>> @@ -35,12 +35,10 @@ extern vpci_register_init_t *const __start_vpci_arra=
y[];
>>  extern vpci_register_init_t *const __end_vpci_array[];
>>  #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
>> =20
>> -void vpci_remove_device(struct pci_dev *pdev)
>> +static void vpci_remove_device_handlers_locked(struct pci_dev *pdev)
>>  {
>> -    if ( !has_vpci(pdev->domain) )
>> -        return;
>> +    ASSERT(spin_is_locked(&pdev->vpci_lock));
>> =20
>> -    spin_lock(&pdev->vpci->lock);
>>      while ( !list_empty(&pdev->vpci->handlers) )
>>      {
>>          struct vpci_register *r =3D list_first_entry(&pdev->vpci->handl=
ers,
>> @@ -50,15 +48,33 @@ void vpci_remove_device(struct pci_dev *pdev)
>>          list_del(&r->node);
>>          xfree(r);
>>      }
>> -    spin_unlock(&pdev->vpci->lock);
>> +}
>> +
>> +void vpci_remove_device_locked(struct pci_dev *pdev)
>=20
> I think this could be static instead, as it's only used by
> vpci_remove_device and vpci_add_handlers which are local to the
> file.

Does the splitting out of vpci_remove_device_handlers_locked() belong in
this patch in the first place? There's no second caller being added, so
this looks to be an orthogonal adjustment.

Jan


