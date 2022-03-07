Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C256F4D03BC
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 17:11:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286250.485694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRFxT-0000lE-SU; Mon, 07 Mar 2022 16:11:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286250.485694; Mon, 07 Mar 2022 16:11:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRFxT-0000ia-PN; Mon, 07 Mar 2022 16:11:39 +0000
Received: by outflank-mailman (input) for mailman id 286250;
 Mon, 07 Mar 2022 16:11:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XxC1=TS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRFxS-0000iU-18
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 16:11:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 435838f2-9e31-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 17:11:36 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2053.outbound.protection.outlook.com [104.47.5.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-Bf_3ADzRNzW9ANKpuSFMzA-1; Mon, 07 Mar 2022 17:11:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5860.eurprd04.prod.outlook.com (2603:10a6:208:133::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.18; Mon, 7 Mar
 2022 16:11:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 16:11:33 +0000
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
X-Inumbo-ID: 435838f2-9e31-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646669496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1PIdWhR3asbm6W96+nsN5itjJ+WwEFi+pK6pK7eIE8E=;
	b=jA7lpQ4Ndy5K8U5Pk5V41bcrXBmWm2lo4mC9kr9+sYCXxo/TlpPAg9/GiJQTFXrKPKp/sM
	STJq6GXVTBCDaaemkl+niJIjtLRtPXNrmEOICcgMqz2cQoTXKQazerCxsszFwzV+jee9yd
	te/rgya0FkeDK6HE0bTawSk1rfeLQDA=
X-MC-Unique: Bf_3ADzRNzW9ANKpuSFMzA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhJRqMqJu4UdcPssRCQU4H/+1mtX8zjWM0G3ISSlBF0+rQ+GdTzFKY80EFd9B3JpRyO+ehmyTLUJhGFU6uRyVYH1Z1VwUzY0ltj6d8pCQPQG4fMHgAltHrXzNNbLKIPKJLSyup5hHCfjVnZNqTfIG7RUDNBSfqqWOJQ9yPEuHuzcjoFSCM2u6tY9UQgbEnJwyYNlhlQM/f2dNAIp6FAInWVjR9zHIN24jpxNHfPW1aoZDSXAEaNTI+qznJBCiOSwQqW/gYJCkawleH8Jou77oXAYPjKWfYpK6OzB4a4m0WfZo+/blDRbc0M0yZltDc5mVG4I90MDtQSXWC1Tkl5zUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dzk5JVDvy4W4k7HgRn24d7pkM2C+eKKhEv7oOeWeO8A=;
 b=BeyiFYdqEM6IhlhJfgN59BXdjR7yDVbb1UulOMGw48Vjmp+ebTvtv6XnnB4bNZkkjsevS7Ybb0DrNpFH+CIhiOmw8/vS7ZxsBdaQymtwufDuFUbnSXvD6VIySvF9lRXCWtJnFbQQuBOPa3LQq3tfcF+Y1iGDlv9FHCdKd5WEmORsk4KZIbjOg7K/6CoZK0Xg0ssetyu/gLHO39ciIho2qCFVoLp0ldA+7UR8Tjy++aYXPdjr1JovuxDL7BmbOt9zJYnXXd/Y1Ok/6zrENgKbS8fF20osT96ksgRsKtkY+CSa7pjt1PrKgvW3IE+SxoAs1MJauox5OZwZ4t2HLsyWpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <62bc3030-496a-5d33-9278-614350df94d1@suse.com>
Date: Mon, 7 Mar 2022 17:11:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3] vpci/msix: fix PBA accesses
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Alex Olson <this.is.a0lson@gmail.com>, xen-devel@lists.xenproject.org
References: <20220307125347.71814-1-roger.pau@citrix.com>
 <1480fa5d-bcee-e945-6b2f-9db7931c63af@suse.com>
 <YiYtoxcpi/KalGqg@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YiYtoxcpi/KalGqg@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0602CA0010.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c7e0d53-44e4-445f-d91f-08da0055258b
X-MS-TrafficTypeDiagnostic: AM0PR04MB5860:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5860394E59FF64F193750D50B3089@AM0PR04MB5860.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hDlKXT2iWRu0LrS/wpjr3VWtq9TQySm10P7LFsCsunrj2zwEWDI3k8CzMMaV9tLbP63e8bFOoGtkYBjuKHQHCMR8jLW8QCKuzPcmmDBuotdeFd7+2a3WCh61nkS+ChF1ZmMESSSBzZSyPWBO/8jotiCL0ag+lGNAbP71ihmTb67hZrmtWuChKwzpUrURrOuEAzPqcVj/jDmZxN7Ea/5kDdc+M5sRbq1xfJ5GSbxjDrKwWQbB/k0INrY1bsSrfnzkW4xbHAMP9+/G3TwmcwNtbCVQmmnoK9AEdyTTaNkPALRjh/m4OsDpW3ZzewyDRONr65a3XHEtnJwFPZ8qgJgvQQhE+8fufPMldskKZCIkT+W11CFlfDWffn9g5Oncpj5Ov247XfjmTrkstvBPEgXWlTBPmSMUwcPDXHXcQdpYBqspG79SKeppMvzBR7O3bOW/yjvjO9JMweC/nt8KTinDOI7LQjlijfSVqSrcnpS7FeN9cvxmOzL4a2i7ENQdrtMWsqPDo9aSaHzVOKCgkLOTUGwLItpWHnPRZBB6A/UceTGv+fyxRH9ja9cbO/EgHH4b9sQrV0tXotL3vct4Yl2ZdGQOJDOLjnaHWUrqrTkYqh6NlUGQuUrxk5CU8u+vYGsto76ApkioPLJiWiUUpCSElsxlLvtdqC/txftxrKIzk254RUXAJLC4SPcNZGTSpd++Ji1ylY/I6QwmZnxVho6vWkS+/pighiv8WtYqffmp+1o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(8936002)(2906002)(4326008)(36756003)(8676002)(66946007)(66476007)(66556008)(5660300002)(6916009)(83380400001)(31696002)(31686004)(316002)(6486002)(53546011)(6512007)(6506007)(508600001)(38100700002)(26005)(186003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pv5B5Lom7RfrR5KlPcc7aRRsyYAJNpAUVc6zJ4pfGyV+Gf2YP/nvncRVEnv8?=
 =?us-ascii?Q?2FkXjyPQh3eIvj3p+ThDMayzySUY9qIjLw7YtnWrpN+X6W0tIR7IUNUqD1aR?=
 =?us-ascii?Q?XOR7v9bonmC4adpPH2ZBz1r8b5419G19bCG0V0qyaIGG7PpwyahTVxVly8Vh?=
 =?us-ascii?Q?e/EG8gguf2iywhIyMP4XOrGf4MIImH8aXYeFMyOipuO6D1TZJKQVUHFRh2TG?=
 =?us-ascii?Q?/Ll9rCgRpRkY4tzHwD07YtOsW1eo/OqB5AAHcuEStYfXCpRqU5aKFBSdrYfh?=
 =?us-ascii?Q?7h7Srcd1cO4C+7kmYKfbppG+coDujrpnW0ILjAFvzj8yN7K4LpLYIyisbtd4?=
 =?us-ascii?Q?gy4RaB9XVuO0OKXCBuhXwDxn6LstDEqzXo/cGEHudDay2XFw5+r5V0n2/Wfz?=
 =?us-ascii?Q?SsnRrq5hgphRKdriwlAG4wEuDzR7MpMSuPxtDvWG1f/Ph+HNEjV6cLhT0Kbt?=
 =?us-ascii?Q?JzmMwM3qaWePykAckErsbvF1oyrO3+4lOAWPUfkKlKut1zijN3Me71naf/EV?=
 =?us-ascii?Q?pbVUYnyRn3B+Lo6jXCM77sRW+mQb/F2whmwh1pRZX6FVQMmAGMCNikEC3bqY?=
 =?us-ascii?Q?S17KW+qenQcPu6bvkRnwv4H6Rt8fCFsdaizIeb8HMdWXiM2CCNWAffNJ7psW?=
 =?us-ascii?Q?4/dXAPWvtdT5TeoDdR0/v0I1ApvFdm6u+H2dDHqjJ9q074rG1QYqepDSj7Y/?=
 =?us-ascii?Q?pmzA3nipm3GCN2D1GGKa3IXbOCrPtn6jGVUZTwYa6XwriOF9ELQkX8T5WH2B?=
 =?us-ascii?Q?UZUiAHnpNLezOcrz18hK+VM7Obm27DI/aNEUqMDPCyNHZ8x/zbXZJf58wqy5?=
 =?us-ascii?Q?R2UQJPDTxUbRlPXqd2+ANn+ixcmSMdQx+AT78oRz2DQyWgAyrI9152GxGkxx?=
 =?us-ascii?Q?tDAfRDHA/9zVD9hsOED/bkIOm/SbDseoKurtZOsUor64W3cu6mr1aEfuC8U9?=
 =?us-ascii?Q?ultU3ic6rrZCIffd9Ire/WhNkWlElVOhfY5weXMVy8qGqXxaDELx2GKPkeBF?=
 =?us-ascii?Q?1BiCxzGekKgyXok0fl+mtuB9mmwCwjtX0cM3y1AUOvjDwBd0REPhLx4464aY?=
 =?us-ascii?Q?i85vz79WVYyRpPi29MUvcv/OTLo/ueIHF8A8EToN1RaPnFhgNbwOTWiqQ3fL?=
 =?us-ascii?Q?H3aV7M7bzWfw8KZ/1xq7cGzkgRqUBLtra3jfj/VX2t6le8bT2Qrt3osNTmNf?=
 =?us-ascii?Q?aPGDNHBJhWa5+7Dz9CsDvUdxSX3U0YsR/yFJHH7VanyiNLWVcBvCGxNmsLg8?=
 =?us-ascii?Q?Vow51OfMRTXZ72AN8u1KeO8s5vjQHnKpbRBlARbnhY8p5jqOkqTB1DCVFx+g?=
 =?us-ascii?Q?yHN7wAb1P1N4P4NX2sTVbH5gMDCwNAWGAAtiLP9UKuNXhQhUb0gWkzXOTlFp?=
 =?us-ascii?Q?nWCO3RDpYFsbRkE+YL6rCRIUWqrMcA9DMEzWEXe8CsMDjPz7zMMDxD0p9SWG?=
 =?us-ascii?Q?/SWknKcx8tC98MAWz+SSED7ttv6XME2lmA0mN5F/t7LAF2UWPl51wxMKzL52?=
 =?us-ascii?Q?JL2NwPA+A8aqKWV4x5JDYF+L9PYHWrgOBn5l5VfDNQy3XGcXWfECvAa0IITS?=
 =?us-ascii?Q?cIju9GLVCGlBev+zu4XVHXYBmMRriFQY1UHqfJ8BmWRLO1Qe3/NQf8EpNzw9?=
 =?us-ascii?Q?wMyhJlIoC3hzmf5elxYHBfA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c7e0d53-44e4-445f-d91f-08da0055258b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 16:11:33.0988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TOUbilnWjhgAb342K+NcXtl49z1+XjOYW1L3JksuhJX9PWKGfkdR6i/+0sxzI45I1HjhDvla8xIU4yaheOhOlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5860

On 07.03.2022 17:06, Roger Pau Monn=C3=A9 wrote:
> On Mon, Mar 07, 2022 at 03:12:32PM +0100, Jan Beulich wrote:
>> On 07.03.2022 13:53, Roger Pau Monne wrote:
>>> --- a/xen/drivers/vpci/msix.c
>>> +++ b/xen/drivers/vpci/msix.c
>>> @@ -182,6 +182,33 @@ static struct vpci_msix_entry *get_entry(struct vp=
ci_msix *msix,
>>>      return &msix->entries[(addr - start) / PCI_MSIX_ENTRY_SIZE];
>>>  }
>>> =20
>>> +static void __iomem *get_pba(struct vpci *vpci)
>>> +{
>>> +    struct vpci_msix *msix =3D vpci->msix;
>>> +    void __iomem *pba;
>>> +
>>> +    /*
>>> +     * PBA will only be unmapped when the device is deassigned, so acc=
ess it
>>> +     * without holding the vpci lock.
>>> +     */
>>> +    if ( likely(msix->pba) )
>>> +        return msix->pba;
>>> +
>>> +    pba =3D ioremap(vmsix_table_addr(vpci, VPCI_MSIX_PBA),
>>> +                  vmsix_table_size(vpci, VPCI_MSIX_PBA));
>>> +    if ( !pba )
>>> +        return msix->pba;
>>
>> For this particular purpose may want to consider using ACCESS_ONCE() for
>> all accesses to this field.
>=20
> Hm, I think I've asked before, but we do assume that ACCESS_ONCE will
> generate a single instruction, or else we would have to use
> read_atomic.

Yeah, that looks to be the assumption. It has become my understanding
that ACCESS_ONCE() is generally favored over {read,write}_atomic().
Personally I prefer the latter when the goal is to have single insns.

Jan


