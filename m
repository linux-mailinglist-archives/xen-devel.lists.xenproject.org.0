Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C68051C3A1
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 17:14:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322217.543456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmdBP-0004CC-6u; Thu, 05 May 2022 15:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322217.543456; Thu, 05 May 2022 15:14:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmdBP-00049N-3o; Thu, 05 May 2022 15:14:23 +0000
Received: by outflank-mailman (input) for mailman id 322217;
 Thu, 05 May 2022 15:14:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmdBN-00049H-IP
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 15:14:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09b0bbed-cc86-11ec-a406-831a346695d4;
 Thu, 05 May 2022 17:14:20 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-B2w_uR-zP-eTxxD86-lyjA-1; Thu, 05 May 2022 17:14:17 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR0402MB2795.eurprd04.prod.outlook.com (2603:10a6:3:e1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Thu, 5 May
 2022 15:14:16 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 5 May 2022
 15:14:15 +0000
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
X-Inumbo-ID: 09b0bbed-cc86-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651763660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SeERoKnaiYcKSURIQICZjzOA+gWrdX8LlKpDIJiCnZo=;
	b=EWrCqSZn8gZl3chrXCXaeyC5FStq3F00hD8/BsEMSNLz1RY5NMETgEntJ1920bcplugbVX
	2pmvslTqjnAIAzwe/pcSTd4DMMSuysbd4CVLQk354K7CNcR12He3KcEZj0NOE2ThTNPC37
	Zk/CTYV92suH6IgbxhtwvIOHQY4y8Mk=
X-MC-Unique: B2w_uR-zP-eTxxD86-lyjA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZens9wMSTeX97vI10dYOW+kpC87RsdU+XbIIfim5iDpSRIo+XZx7u9n2u3wgeSfmFFyw+E43D2RoVZY0PGY/CxyZ1CARl/E2jZzSwBxrppzpnpTm6F9jWUcgaOwaTUcqUOX7eg1H1MnJFz37WUz51vBrgD06H6xUDKGvFcn1ZrWbkwocqI/iE4RlXkfXJC99oapO4psDFyktZDFDexeBMDDoDd7UecmTYVyQXIpUXjpx6yDGmjYvM7MrT9L7Z/Dshx+gWdQD3ZSeOb8E4A3x838nj6EPUzQj/9KoFrbCyMH+fHRF6SXyMWwdGOkkD6LagvrF8ucRUE/+IDRvBmoRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSGEanOad54z07HdaMXq6dBA1EWAZRvjIDUCclOgPuY=;
 b=CjDxxDQ3HvROXLq85WvFouB4nrXT4YDvjzb3BgRi5eaa1tURLjaviotEs4+oucI/aFUaAKtNqMLF5reIWp/aLfuJcOtJwX5rBywqya1cEtMC6/8ARTtqOg4M/Xd+TidUhZcX20u2P1HXlp2h2OSAD0wz+eCizBV8PsoZYaisrJvYnmnAfJq5hHE4yHvoV6w491SLmO09+GzAe0qxkmDKHCC8i01GLisxUsIdVvs6I1tc7O7Fsd2EE65PnHspB66OA3yKqNhG4fYO7yDrGcOmonPngN1SsVsZZuuycVn3PDzm513oisnkHgoN7L37F8Fjl8ivS+sCnf1PhwdlxZGZ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7361709a-0c2a-f98b-2741-fc4c0a12bb50@suse.com>
Date: Thu, 5 May 2022 17:14:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] PCI: don't allow "pci-phantom=" to mark real devices as
 phantom functions
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <02804746-c5e3-aada-7096-fbb9d04ca952@suse.com>
 <YnPmmjPQcPf4ZmO8@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YnPmmjPQcPf4ZmO8@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0410.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::28) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3fdd81b-44cf-413b-ba3a-08da2ea9eb36
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2795:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB2795478E6E091860E227ECDFB3C29@HE1PR0402MB2795.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hyt2eT4nFWJ+S9Csfmh6ZGB/+l/nP9DpWDt5LN8oqiDjJ3jcFvJTY5YOau93CGocwMWKyOBlCzX8YETrrQlpPtyBXJ+4WdsPiwTRIDeRZt8UP3sQg+waoNh9Q5C07HjE/wq+Ea0RGDNKnSx079lpGZt2HZgsWGhQg6eht1phT8QTUrHeAIIhp0/8l8Fne2OLY+NwmtTC6aeUgT61LolItFSzc+0E/b/Q/I0oge7nRo8z3TYCIZXPKCz59+WSMiephDhuLfRU96PCxPDNCB7LklvyGEjVA9WYhaaNE+64ec6N/o6MqOuwsXLAbG6LZEmdaUT0yY3t5HVKQu2xHkhLMsZEryO5R8B9ruMwNwe8m56rA6lIPYRMLFs0Y72r0MmaRlBMeHsiyypXqI1yQknr64nbpB7almL7fg5uqXM6AxFKXciA7wwGjB9sjT1pOU3o9zJ2pp7ZurG7nTDoF/H1H9Sa62/wcjYN5XwAS7X2RlD214S/QY8sQ85ir1jF7CPFdwf9yAe8+uQ1R9omkDPnhVi8tK6JlgM0OOOnQ/x6GxOnq4L5SVUg7OyDrJQB0b0KX6pTeREqNav0ZQhlM/8TosT2eJmtNO9bPfdsmbtlqfyaP92KMwMwjdUmq0eYkRflCsQZnGb9fMGN4lyKK12li2QSYtNS1jYDiE6lZM4s2V7Nc7W8olNS82qqKvj3msJrriTrq3uQ+gA7zZ3fr7TuuOLJapZiX4UxGpmH5djzFvk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(2616005)(508600001)(316002)(6916009)(38100700002)(54906003)(36756003)(4326008)(8936002)(66476007)(66556008)(31686004)(8676002)(66946007)(86362001)(83380400001)(5660300002)(6512007)(6506007)(53546011)(26005)(186003)(31696002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+xOGMPpQTo8vx1MpuwiMmym9EF5JM9yzAHaqp3momW6jluWngNj6Y6PvCGw2?=
 =?us-ascii?Q?qSlAg8t43Qksia5T+UsmI3hDo+OBljNYOOxx+iYb1pLTx6cJ74MEM3CubJ45?=
 =?us-ascii?Q?dwhlcdCWVEKSiRGBg6IaK261OTwC8ApG/PPrW23ISaapNwQgv4oPe5oz5155?=
 =?us-ascii?Q?oaWd99ogfq7JD/EylFtCTPEwoyOwF92chnY0ZyeiVvbQTQ9dMI1rkCcgU5GE?=
 =?us-ascii?Q?KznkYG7O2jkewNuQEq3nm/DFEhy4wfXwxQcLQ7ngDZS9CBjjJ246oY1BWBuX?=
 =?us-ascii?Q?3xlTdAiPqP4oCTllOgCi0s4rQpw9rssXGGdaTA6OvQAtyrQkPLtE5tBZH5+2?=
 =?us-ascii?Q?GLjA9mMduqteGCkvbF8iDeZgBgEYDniQ8KAk859IwV57bp5LblNW8YTGbiL/?=
 =?us-ascii?Q?zMQvPFffra8KZpeSvoy2BxuLRLs6ETQ1D3Sg4K6PpjwR3lbgwZslegzNFfBE?=
 =?us-ascii?Q?9dJV9T7qRT0/edb4ZzKZVjtGq7Zb4rKxbg+11EtzsSK4KEKTTRd6ffSga/n1?=
 =?us-ascii?Q?OX0sz9FNPTadtLrlzFnruES4Nr0ry/vUcwbKJBBLNji8y/5S2rsQEHQ0Xgku?=
 =?us-ascii?Q?qEVqMuXZHz9ppJz/70mq12hDly4olZCTZsXG9QUfrFYPHF+FKGGiDlkyaSbd?=
 =?us-ascii?Q?LCqU85oFIrogwTbjrKpUEvYW/WO6m8/eA43MjY014UVmlwpowVCo0NbP+lUu?=
 =?us-ascii?Q?6JJfB/qo+jOTFC8XqkZcwDHNpI31PNFJmexB6XnVbsW4avkfxW1F2p5pgHEv?=
 =?us-ascii?Q?HvPpaK4dOUfvzEJmIfveR1UUCf5KgFep3GlhZeJAdv90ge7C5nd3qozekSGg?=
 =?us-ascii?Q?v6mkRMXO1Ep4CYHbCf8aUsE/Ziw3QvMPUgSCoUPtXsCTCaLr/tHKa+uWUi+I?=
 =?us-ascii?Q?171Syyms5Y8aIUQja4GEr8A+qEBaunll+3lPev/kdwxfTBYxL5X1bPCuhVZE?=
 =?us-ascii?Q?QW+OfyUBHaVY+YA2MeDZB9Cqo0Ic2m88tHmuFCCRWUEE3ge1VZ/WW508j8/R?=
 =?us-ascii?Q?oaRjnglnOGTspTGrk+RbNllkmixxdO99gRDWNHJWRdaoqU7hxlPhRyD8qDMA?=
 =?us-ascii?Q?wrBK4Swb+ll1m4TkcTEK8t/QPsHX2LsvdkfYM5Ty8Od+oDIZZ0vXKJfe88uU?=
 =?us-ascii?Q?nj4mJ+ZEcnRQf/aEiYK3KsSVNHE2SX9gbGlEdUYsYp3CTUNWmmx/3n20mp4d?=
 =?us-ascii?Q?n3uqLCPaafR6bBvegqmWcJs6u73J8XnsLEhrYBg6VyHFiZ8C7EWG5Zaiex6V?=
 =?us-ascii?Q?opyUmZhi46/WKWH1TjdPH/pax/hJ4/wWqUu7eHZj/3M8notqff0E6Lg4lYRF?=
 =?us-ascii?Q?QfQyWcsO81qBiYf9bI9KdySJBIBbN9FUWtSkg5EotQX87FBStkAFwmlSNFgJ?=
 =?us-ascii?Q?DKVOuvP4rAV0p9FAzoLPyBORfTswTACGpQGcKjxH5ViyTFxIi1KELvh2+wsg?=
 =?us-ascii?Q?K9lg0EwMkuTNq+Nk5vazmM+42V8XsSoVNdLlOBzRyr55TOAWa4JQ3oXRQyuz?=
 =?us-ascii?Q?PM5hKeuHor0McD/E5+gpIPweJUIwtzlpenTAYXqUgSH5GDPQBeXDVkluGTru?=
 =?us-ascii?Q?Ds2iSL9EK6CrttbQF6njuFyv4MZ3tIK94gC3bz3lL53T9vUJPnoNHgbz+Ma5?=
 =?us-ascii?Q?4e/Sm26hEg1BjhEB3s3glu7t1ucCEDB5Xb4HzSohYooFSAiPQNI7DW/dC3FV?=
 =?us-ascii?Q?+IEsknbtLfS6QYFyrGz0wIQAdPoP3EM75bzj/VHQ3pwgGqnNNYIMWUjjoUww?=
 =?us-ascii?Q?5/7RNGIYNQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3fdd81b-44cf-413b-ba3a-08da2ea9eb36
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 15:14:15.8335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n59fMxrF1EhEvVOTaZQoIEcE+Yzldynitl0Zk5uHyPNOflPjx15fLlyl1ZDIKNYe9Q3gI4Kmge1tUadB+9imJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2795

On 05.05.2022 17:00, Roger Pau Monn=C3=A9 wrote:
> On Fri, Apr 29, 2022 at 03:05:32PM +0200, Jan Beulich wrote:
>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachment=
s unless you have verified the sender and know the content is safe.
>>
>> IOMMU code mapping / unmapping devices and interrupts will misbehave if
>> a wrong command line option declared a function "phantom" when there's a
>> real device at that position. Warn about this and adjust the specified
>> stride (in the worst case ignoring the option altogether).
>>
>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

> FWIW, I would be fine with just discarding the stride option if one of
> the phantom devices happen to report vendor/device IDs on the config
> space.

Well, I thought I'd try a best-effort adjustment rather than simply
ignoring an option.

>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -451,7 +451,24 @@ static struct pci_dev *alloc_pdev(struct
>>                           phantom_devs[i].slot =3D=3D PCI_SLOT(devfn) &&
>>                           phantom_devs[i].stride > PCI_FUNC(devfn) )
>>                      {
>> -                        pdev->phantom_stride =3D phantom_devs[i].stride=
;
>> +                        pci_sbdf_t sbdf =3D pdev->sbdf;
>> +                        unsigned int stride =3D phantom_devs[i].stride;
>> +
>> +                        while ( (sbdf.fn +=3D stride) > PCI_FUNC(devfn)=
 )
>> +                        {
>> +                            if ( pci_conf_read16(sbdf, PCI_VENDOR_ID) =
=3D=3D 0xffff &&
>> +                                 pci_conf_read16(sbdf, PCI_DEVICE_ID) =
=3D=3D 0xffff )
>> +                                continue;
>> +                            stride <<=3D 1;
>> +                            printk(XENLOG_WARNING
>> +                                   "%pp looks to be a real device; bump=
ing %04x:%02x:%02x stride to %u\n",
>> +                                   &sbdf, phantom_devs[i].seg,
>> +                                   phantom_devs[i].bus, phantom_devs[i]=
.slot,
>=20
> Can't you use pdev->sbdf here?

No - sbdf was altered from pdev->sbdf (and is also shorter to use),
and for the 2nd item I'm intentionally omitting the function part
(to match the command line option).

Jan


