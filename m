Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF924D022A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 15:56:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286152.485540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nREmd-0000mG-93; Mon, 07 Mar 2022 14:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286152.485540; Mon, 07 Mar 2022 14:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nREmd-0000kL-5a; Mon, 07 Mar 2022 14:56:23 +0000
Received: by outflank-mailman (input) for mailman id 286152;
 Mon, 07 Mar 2022 14:56:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XxC1=TS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nREmb-0000k9-Ov
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 14:56:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf7a9c82-9e26-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 15:56:20 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2053.outbound.protection.outlook.com [104.47.2.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-XnI188UaPaKtNH6ekIB2Tg-1; Mon, 07 Mar 2022 15:56:18 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PA4PR04MB9341.eurprd04.prod.outlook.com (2603:10a6:102:2a5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13; Mon, 7 Mar
 2022 14:56:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 14:56:17 +0000
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
X-Inumbo-ID: bf7a9c82-9e26-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646664979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PDvWKmTEwKqDdwtgPgGZSNrqkN6n7MIeCMs/Nq79X5A=;
	b=lHpp+7ukEqiO35+dfct9AVGBTdTz9PbKbFY2TrmgmhODpY5VOoNqov00bohJjw7KyW77F5
	AclGtj/F2i04MlsQtX5ZQBjW2n6mOOceXuDUzDF6tGRulnzpPE3FhSSXRH/rvIYzh+xgxP
	LdadTyhCprFt8+Ps9+/+H9UodAf7cPE=
X-MC-Unique: XnI188UaPaKtNH6ekIB2Tg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ktIiQ7bFyiY17R2DwYlDj4MnzBAyhbB3ahsoABw5vQmGpM9aIWem4TV4/CjhsXCHIL2wxM7AJ0BnvzUf3OzKO4OBB0JDUYa7kzypq+Q7K9Z1kL4znKhRVEbME0uYw4O159thAbW9CAkfve/aa0YpQUyC5B1lxbeq4k7W9E6bMAD12hAnv0KrUiRM9AHaaTJL0Qz3Kgbl9BWDNPeo8OQQOJVIXbxU+9jRJlO2UJBOazxpFIWZy/Fmkan+i1DEfeBzUdY5WJ1aspJehfVG/b8VE1wNCsNb6VOvmd0lmAroPUwD6nlK8q6lZU7buH3A4wyvXcVW6qj9gZkZ15tR2vhiMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5EprFH6AOMnBpAUKL+oQnEqbk2OM4lyjYovChzHIeYg=;
 b=GnlEBvlGzOIO4AWHgqDrRi8MLgkEMI/mmAe7meomcN0P2RGhHmn5OIbdu3LNk/zI8u9w4EpWm/Y0e0l721qAXJLabFYS5nQ5NlderEtuMYveS2slHpZmqKRb3j1EwBXsYTHBL5sDGfcLdN+sr+i91OMfJb3iqyf1Wk8oDSH4nKTzTuAEMh9JWtEWnJJ4T3VHqfuG5nhaPJXusxcDNjGhWKgXWih6sleaUpZ2eLfRevrrrJvVJLbhZ89R49HtzKdCRYbT0TdjO9FiCF0pXzOLMlM6dtczdrE30TuYwm9e/nDt+YXoLa3XSmgza5Q7612qCBt9mLCbH75AkgpIhMqaOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9bdcff21-064c-b671-d8d2-7b7e20e486c7@suse.com>
Date: Mon, 7 Mar 2022 15:56:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: Network driver domain broken
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrea Stevanato <andrea.stevanato@santannapisa.it>
CC: Jason Andryuk <jandryuk@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <YiDt7fX92n6Luc2l@Air-de-Roger>
 <CAKf6xpsnmQG7-LXn5+Uz4mncWsN0EZ8wpagY8f8OydvZNb6g5A@mail.gmail.com>
 <YiH9cee6NIKA6MWg@Air-de-Roger>
 <53a4fe6b-efc8-bfa1-8475-0aa58774051a@santannapisa.it>
 <YiIFyRUNXpUfzwRB@Air-de-Roger>
 <0ce52d38-f542-9336-a100-1cbfc559f218@santannapisa.it>
 <YiXq5HIrvZsy7QKU@Air-de-Roger>
 <b388ed5b-177e-2e9d-6450-6df16d9250c4@santannapisa.it>
 <YiXwhUnZL8bcJvH2@Air-de-Roger>
 <93fb9755-d40a-3cfe-1f6e-335b57d5a213@santannapisa.it>
 <YiYcPgVTpA8//ojA@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YiYcPgVTpA8//ojA@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P251CA0016.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bbd3462-2458-4afd-77df-08da004aa21b
X-MS-TrafficTypeDiagnostic: PA4PR04MB9341:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB93414983F8F6D7F19292C98EB3089@PA4PR04MB9341.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zYqhCFxO311bNxhSR99Yp4GnM5knPDPORq1RF9irvpYONPNs7fkrKhJvMq4WJPqGJCmXCUjMIa4Zbt3FfXtnpGH41wnFGPObMebJ941XQL/5CsZkT8xOBVFMA36GtIPvh6R5iMb7MEsqm58+RWLt6n2u9PYKAF9MH7XochXeIPKgqFNFQYqUKX4WdU6nBhWcApLOzJn+tYbSOaDbESgmrCNzgSHO1N4iaq4AZKArWf+p5Q9tPW0lMfaq3STbaWmbbOhCfPYZ++2UWH9zjkaUxGLKTGsRuMHSJjCJSczGzalofYMF32VQkMAytAwkKMCqGCd2KEIl7WXLv7ZSHOjQ8a5IJqIY64Hj9ZL0KdXyvBgyzkYuyyj+YwlIJvDRnQY3xtxZQCUaXQL/Fu0SD5CCd1g3TnD6FGrRIisQYUR9M3K3krQ4V5sYOM+sghOSGp465DpLSyhJ9o5faRXiL0iwUh7327kkzpXp86iVkcaqGUWdr0PLhn2EPmqUcc6gkzIanZP6BiLohdoM1iNKxtAmIgiDLMqUWT7qj0TGAlWvKP6JRxZcSF+Jt2LHFkN8shYCW56CUDKKs6vFEGB/IPreJ0KoyQpNmgdXeYGAOzOUBJzqikgvQG7jOvExl2AtCtZecQQs4+c6BmYR7v4Mfh+4smNcX8phpx6+t0ZrfHQ82ZtIstR8OezAS4AVRXyXHkfxxC54sfNniRp2b6uNXG5PDVllYnz3lL6kOO74oQq373CDdQqTPbEIigCgVCVnaqKR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(8936002)(83380400001)(36756003)(38100700002)(53546011)(66556008)(66946007)(66476007)(6506007)(4326008)(26005)(3480700007)(2906002)(2616005)(54906003)(5660300002)(31696002)(8676002)(6486002)(110136005)(508600001)(6512007)(86362001)(31686004)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VUmxXFKgRVieVg72gfb5EdI7mYCtEkyHw3s0Xa6RANBf5KsTyVXQJe+AFTGQ?=
 =?us-ascii?Q?jI97XL9C2RZrlzzFMEDuNqO9xRRj3Mlv2z+itQj0jtx852FMu6iOdDG9E/S6?=
 =?us-ascii?Q?iyKc+zeOALPGV/9enTrmp05TrSuF26WqVdES9fIJicN+uT+GLN6C2J0XKzrp?=
 =?us-ascii?Q?UHPtXrZidnkn0nYKyebuLg6pDQI6mInZuz3gg1DOiRtADxi1dHntDwiCiPcy?=
 =?us-ascii?Q?XwElgJOSZyIgoRPCXXJKf/YqInUYSHEgOYttoRMfpOwTmqetVybE7WJYT4Tt?=
 =?us-ascii?Q?pHm1dTCardqrhMI3o4X5BHnNmc3dpCozq5bQ1SKMilmB4lxE+u9ezr4UIJ7x?=
 =?us-ascii?Q?OmSGqYo+9GxHNivS8WEfZDnJoil+wD9k5y0MwFpoCJkb22D1IsxTJmmnMysL?=
 =?us-ascii?Q?iUxmZnDZFT1TZFtnSaiqdEWNVx6/xD3C03k6OQv9H70bmiUztpiVrcSWAeHM?=
 =?us-ascii?Q?ju5sXcXafF7D9It4zfQUeGRRiP70W076X8dndF/eVNCoRHdWHr7ksrlY9iqs?=
 =?us-ascii?Q?2gNXANXa2ZRB+YuxlEqueHL2SkZoFe4SehPQzUR8ty8wFrje8U2PjVOCVmk7?=
 =?us-ascii?Q?el6vSdpYrGO0JKH5ZuRaCFiElW7p93v34qr55hW/Zv4okpGGxZo2y+6J+PQD?=
 =?us-ascii?Q?TbLyFexC7NHi8MWlz3yt3t5Cda7cfHKtzLPpQJtjltLvXgm6+ERbM3hOgE7R?=
 =?us-ascii?Q?+81zOpP2plqvCBMCDEiLeK15sl4Z8bRzTmxAZaY/lBkpFuag0An+CyVzhC/7?=
 =?us-ascii?Q?2uYLyzPLc5zVFMf1r9kzH7KcXe77g+Uvrl+XW27CznOdGSJ2sGTIS0vDT4VY?=
 =?us-ascii?Q?s1a98ysuGbJ5keAxnCNT7ig5HchxV2WeiyeC8jCIpGdowaxgerwpvq+tWVK/?=
 =?us-ascii?Q?herVvspB0dA86C+UV7rybZYvFK4oj2FtVEIcvHbEFTEuVsZDjHsc3+SqhaLA?=
 =?us-ascii?Q?4sZhA4nSAA+rsHKjmnAbXtxgoozE0cqvs4Is1WB7VSPmmpMqr+xeMmwx5dWE?=
 =?us-ascii?Q?Q6BnFXlC9I5bQlrVNv75LwxSeY75wFvK7FM0lPLsfSiCvHKyIgyygDWM7Xaa?=
 =?us-ascii?Q?oL0ynQBrIrx+CQMWymEppoTEA4ZcjLo/d/3f6dFwd2X5uunI0ems0TszKPHK?=
 =?us-ascii?Q?ouSWNcIvwZZgekv9ToFxjj+DPyZwoyNDO1p8huUH5cDMl/bgjs5SNefxAxf3?=
 =?us-ascii?Q?oxUQ5eI9rJklUVTxNNUwJAOVfWFZNla5WNKiEe3KXqSHBuNi49h5ABHMWrXW?=
 =?us-ascii?Q?0RcBIM0yh1vW6K81NBCNxxNb85hXT3mPtruZgvY0B6rtAqbSX4qyWv0mP3uJ?=
 =?us-ascii?Q?jfzsrZFl9YXruTVi0kH2znQ88BKpj4Y8BuEGOMLoEd49Z7vWOjoWlytdw1QM?=
 =?us-ascii?Q?SM7zuoeahMmY1/jAA+ncxJ+6wRKhRTlZdYDi/yhFq290lhInwVgLGi3YcfRQ?=
 =?us-ascii?Q?vkfpSlPL3kYDX8RziquBwsCav67gGyOr08qs8FH4Yc4w03mVJ+o17eCHzLkO?=
 =?us-ascii?Q?uMATRYI03CzVhVNdM2yg7/WE/WbL8bPsBVOnBSvQ28/P6Aidry0QQHH+ZuyS?=
 =?us-ascii?Q?uE6+cKFBo450oeQZuP1kGVE7LUDlnWHgLpw+xbH/5Pblqzr42xJRyLpqEoSa?=
 =?us-ascii?Q?1CD4dvkhzIpAG2SAwN2nrLY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bbd3462-2458-4afd-77df-08da004aa21b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 14:56:17.5197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7V823IEMBQciuM0qT2HMeHYE+QtSqzPUUOy35bQ7v0p2TCrDbPWhHFkdmFTeR/INtuD5LFLFAg2PV+RXufQJHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9341

On 07.03.2022 15:52, Roger Pau Monn=C3=A9 wrote:
> On Mon, Mar 07, 2022 at 03:20:22PM +0100, Andrea Stevanato wrote:
>> On 3/7/2022 12:46 PM, Roger Pau Monn=C3=A9 wrote:
>>> On Mon, Mar 07, 2022 at 12:39:22PM +0100, Andrea Stevanato wrote:
>>>> /local/domain/2 =3D ""   (n0,r2)
>>>> /local/domain/2/vm =3D "/vm/f6dca20a-54bb-43af-9a62-67c55cb75708"   (n=
0,r2)
>>>> /local/domain/2/name =3D "guest1"   (n0,r2)
>>>> /local/domain/2/cpu =3D ""   (n0,r2)
>>>> /local/domain/2/cpu/0 =3D ""   (n0,r2)
>>>> /local/domain/2/cpu/0/availability =3D "online"   (n0,r2)
>>>> /local/domain/2/cpu/1 =3D ""   (n0,r2)
>>>> /local/domain/2/cpu/1/availability =3D "online"   (n0,r2)
>>>> /local/domain/2/memory =3D ""   (n0,r2)
>>>> /local/domain/2/memory/static-max =3D "1048576"   (n0,r2)
>>>> /local/domain/2/memory/target =3D "1048577"   (n0,r2)
>>>> /local/domain/2/memory/videoram =3D "-1"   (n0,r2)
>>>> /local/domain/2/device =3D ""   (n0,r2)
>>>> /local/domain/2/device/suspend =3D ""   (n0,r2)
>>>> /local/domain/2/device/suspend/event-channel =3D ""   (n2)
>>>> /local/domain/2/device/vif =3D ""   (n0,r2)
>>>> /local/domain/2/device/vif/0 =3D ""   (n2,r1)
>>>> /local/domain/2/device/vif/0/backend =3D "/local/domain/1/backend/vif/=
2/0"
>>>> (n2,r1)
>>>> /local/domain/2/device/vif/0/backend-id =3D "1"   (n2,r1)
>>>> /local/domain/2/device/vif/0/state =3D "6"   (n2,r1)
>>>> /local/domain/2/device/vif/0/handle =3D "0"   (n2,r1)
>>>> /local/domain/2/device/vif/0/mac =3D "00:16:3e:07:df:91"   (n2,r1)
>>>> /local/domain/2/device/vif/0/xdp-headroom =3D "0"   (n2,r1)
>>>> /local/domain/2/control =3D ""   (n0,r2)
>>>> /local/domain/2/control/shutdown =3D ""   (n2)
>>>> /local/domain/2/control/feature-poweroff =3D "1"   (n2)
>>>> /local/domain/2/control/feature-reboot =3D "1"   (n2)
>>>> /local/domain/2/control/feature-suspend =3D ""   (n2)
>>>> /local/domain/2/control/sysrq =3D ""   (n2)
>>>> /local/domain/2/control/platform-feature-multiprocessor-suspend =3D "1=
"
>>>> (n0,r2)
>>>> /local/domain/2/control/platform-feature-xs_reset_watches =3D "1"   (n=
0,r2)
>>>> /local/domain/2/data =3D ""   (n2)
>>>> /local/domain/2/drivers =3D ""   (n2)
>>>> /local/domain/2/feature =3D ""   (n2)
>>>> /local/domain/2/attr =3D ""   (n2)
>>>> /local/domain/2/error =3D ""   (n2)
>>>> /local/domain/2/error/device =3D ""   (n2)
>>>> /local/domain/2/error/device/vif =3D ""   (n2)
>>>> /local/domain/2/error/device/vif/0 =3D ""   (n2)
>>>> /local/domain/2/error/device/vif/0/error =3D "1 allocating event chann=
el"
>>>> (n2)
>>>
>>> That's the real error. Your guest netfront fails to allocate the event
>>> channel. Do you get any messages in the guest dmesg after trying to
>>> attach the network interface?
>>
>> Just these two lines:
>>
>> [  389.453390] vif vif-0: 1 allocating event channel
>> [  389.804135] vif vif-0: 1 allocating event channel
>=20
> Are you perhaps using some kind flask/xsm policy different from the
> defaults?

Or SILO mode.

Jan


