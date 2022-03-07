Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4FE4D0184
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 15:37:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286124.485496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRETl-0004mb-Js; Mon, 07 Mar 2022 14:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286124.485496; Mon, 07 Mar 2022 14:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRETl-0004jo-G6; Mon, 07 Mar 2022 14:36:53 +0000
Received: by outflank-mailman (input) for mailman id 286124;
 Mon, 07 Mar 2022 14:36:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XxC1=TS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRETj-0004ji-TO
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 14:36:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 064f586a-9e24-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 15:36:50 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-dt0hgImqOImTkuUGk6Eajg-1; Mon, 07 Mar 2022 15:36:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8208.eurprd04.prod.outlook.com (2603:10a6:102:1c7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 14:36:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 14:36:46 +0000
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
X-Inumbo-ID: 064f586a-9e24-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646663810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p/Kd3A8WuUJvl6lX2fsfihRjh6zV+ujL+zrUBOzOqYk=;
	b=Q9cAws99iLAzXvGL6FNq8dnGOLv6tprrhXlRQsYAocm4NObILRm2PGpFidlGf0A4AVg4f6
	5vqhj/Fi4gzeDpIp4Xk05sbubc39vNj1oj/9zUJGXfDaxc/wlJZTmUtNhKpymoydAcQuB1
	eJzSp3ywL0tsG7VwqTYjj7+dpgMUNVo=
X-MC-Unique: dt0hgImqOImTkuUGk6Eajg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjiSeSbbXsse3GkanCKNGGZgv5id+V/28fkjTa27KJkaomGQusfSyjL0KRgA2h8Lj9F34PyEqpqiUZkmbRWfWrBNI6wxFGj1C8LQQsRLyEkjmvjiwZc5Tqlg3ocFc/vn6jsKifgaM9OOtI/pIMngRmM4zSwY14nu6EhLtdO1tZNt2OEC2vVcA4/Czd9soYx0vJUSMDXkbB7c+MjItE8Il72JqX40tvaqwoUtmdqKS4Ff/86tD0PeK6IX8hglHz5Pg/IKBHmtKpSMUU6YOLASs/3bWS9KpfgJiahxNo4NGYdCZL4oojbSgd9ijPGqNAcXcKtkfuP9pPWQgI3rJ8Ukjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yF89vvKdeF4DK/uA5UcNsMIWRFEbZXQida894KnwPHM=;
 b=njlc/opaeONAbXp1KV9bIsgDCilB0Xa43f+IWl99kZt6BHFi4y6DvKSsAMsYWHfcFhq0ITAHZOG+NLKt70Suz9YmzL0q+17NN7pMJCz5V9KRkPX+0eBPAlRe/tw1sSy2HPBRiPxvObmbQ3mZO2JtihzPT/wuEvt9fzOnHeZ0pMDgPFYI2MuEvysHwNL82x6i7nOdo8wRAE2GN6V01UjeWlBuOsLAQMMLa5JbwZY0rQ4bUCo3/1hzoCP/eF2k8CLcIEfo5BB0jzOOKIwAiLe9XA/1b9c92Y2fAX5VAJf6NbgZC+82RC4IloSFEH2stBoCliR43YlBLUVUdZE2sqeh+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e5c4c591-8ef4-f8d7-aa2a-b196a5a9749c@suse.com>
Date: Mon, 7 Mar 2022 15:36:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: Network driver domain broken
Content-Language: en-US
To: Andrea Stevanato <andrea.stevanato@santannapisa.it>
CC: Jason Andryuk <jandryuk@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <DB7PR03MB50027EE92E11BFFF71AADC4598049@DB7PR03MB5002.eurprd03.prod.outlook.com>
 <92827eec-b6e9-9c95-8f9e-fcf063d45090@santannapisa.it>
 <YiDt7fX92n6Luc2l@Air-de-Roger>
 <CAKf6xpsnmQG7-LXn5+Uz4mncWsN0EZ8wpagY8f8OydvZNb6g5A@mail.gmail.com>
 <YiH9cee6NIKA6MWg@Air-de-Roger>
 <53a4fe6b-efc8-bfa1-8475-0aa58774051a@santannapisa.it>
 <YiIFyRUNXpUfzwRB@Air-de-Roger>
 <0ce52d38-f542-9336-a100-1cbfc559f218@santannapisa.it>
 <YiXq5HIrvZsy7QKU@Air-de-Roger>
 <b388ed5b-177e-2e9d-6450-6df16d9250c4@santannapisa.it>
 <YiXwhUnZL8bcJvH2@Air-de-Roger>
 <93fb9755-d40a-3cfe-1f6e-335b57d5a213@santannapisa.it>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <93fb9755-d40a-3cfe-1f6e-335b57d5a213@santannapisa.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9P194CA0024.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2734b54-6e01-4cf2-fa85-08da0047e851
X-MS-TrafficTypeDiagnostic: PAXPR04MB8208:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB8208FCCA77F170E73B4947EBB3089@PAXPR04MB8208.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	78myqpLZvYleqSa3y9jmSO7evn2LsBIt02IJ6CKlC9khL2RO/PC+GJznV7BH86b4zhHA+jWo7MVhwVcW8xOU86B8lnzMIGEQAef9lPHGgZ+GiN6M3U6ci0TBYGxf2yI3v8GBtg28Vn/qhfM/wm5nxP5mFZFtc7MDlbjMhYY+A16juUwDqRx/0KplGTXkfs0SxwajZsHFPy6qWxh8gHq5ttVzKrfbM/gQZbdJP9rEmiPdvK1hsv5qPGIFGhedmiqfAIs63eTG0U8mT/3YkjMnFEs+AmxcEVWyQ19IgKpetbeOlaOjxa8T8xItI+t34DjnIwIOg8Lor/DAhNByQY7HCYVfjbfVT938p6xzvaONHgdP9ImGHnVXay5/7DD273jt29n4ZUxiG5kMJza4URTDDMhOCoZty/E3wc/3KV6ns5DyKyFK03oARO702/Sjbb+b2G6QivsPFaBvdfoafxMWI3yLvGIgm7CwVVZZmeQXvFiw3p4AZRT+VQruGPokMLVT8teHusc5xqI5h7tctrQm8kq9egk+VjZuHo+K5/5PVo6Bg/H82CAYE51a/bGaJZhcyUfKcIyoJBBnXPlogBBbyVrLQX8MFnqh3Vi2DTau+TzDIWsnCWi9aS8UwH/kYn/37KM7Nus6VRkRz4Ny2ygwEy0o7nUUXzcLc/QwQF+AZKgMiutFeb5DGE+jxUzLijg4IaX2r4JThFT7iyBYHEKgYq9yKjkuBxLH/79nD2uRsfE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(86362001)(31696002)(83380400001)(186003)(26005)(66556008)(4326008)(8676002)(66476007)(66946007)(2616005)(316002)(36756003)(2906002)(8936002)(3480700007)(5660300002)(6506007)(53546011)(6512007)(31686004)(508600001)(6916009)(54906003)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GnpLAxQ7pxoxLl1KkODK6OcVJ9jCZqpp3BltkYKE1AAcbzR+y1gTXr13b55J?=
 =?us-ascii?Q?+5/qHcHcfxSF+GQ4TgQ+PFy1ifSDrMvK/AshkDyTGzWMOjJPNdVlAiZ3rRgW?=
 =?us-ascii?Q?cYCftXzXiGs1F8JxLtClGkN8H+BrnOoAMqc1KfsoEplqsocvQlYiG8K+0W27?=
 =?us-ascii?Q?mqSEje+u4IdWfWeu4xloLkseLLeMyfeyaeT5WRYy6s8yZLRpRpzJSZXgbusC?=
 =?us-ascii?Q?stC4zQsJyCclJMXxfcs9EIkM1mlPoGBLkzvK5NX2W4+xzSLFUrpKC4RrOma3?=
 =?us-ascii?Q?GIjkXn35kup4Ey7JX0+NSY+G2oqj/+01r9+zHL5SQdkRl/VU4/zwvne9v8/H?=
 =?us-ascii?Q?olJQkwFiEFXNWcu9yY/mrCX6LPXiyueLov3BGtmMIOtwEGN47xR9i2eIynld?=
 =?us-ascii?Q?xz4B9LLxU5yjZP+rv3foghjbtyQ5uCRmTEIZ2lG694g25664zMltlWhBmQae?=
 =?us-ascii?Q?V4dnlANySCByVHz3CSGp5k8/2O6ipsmbcRk9Yue7qCTKTSYteOxBoZAS65rj?=
 =?us-ascii?Q?aQI1qhr7VvXyLR1tZLI8zBUa6d/aCSMOitZdEdiTI+awW1L0g8+rZnLKbN4/?=
 =?us-ascii?Q?tL+pBKcHf0D3W+r5myjNMQCxsDBBjyd3m4dEG9G3tJOZgt20FHqvFRbVAb/u?=
 =?us-ascii?Q?Vj5gc7Gzsn1H/kCKpVLJvSKkfXbNEXF9qFQlXiEBvxE70tV3b+EUAyZHc86b?=
 =?us-ascii?Q?/DKSIPfiHt9SWiKOIqZqq0Qh56yIlDv/SthdTydHtKMuFBXE6AtLtctslJcj?=
 =?us-ascii?Q?VQ9ewHwg6TBWWSf1WPN7d9KfWVtp+IAKsRzyaEiV/yh/Wb0cDjtMIh26BXdl?=
 =?us-ascii?Q?65Y5+dfc+2CILeKwG97QOnZVZi5VttocJ2tDQtOpu5svFDadsWFnNA6lUFI8?=
 =?us-ascii?Q?ODPQ6EbdpNegHNd56JTd6oMqNB7Kqote1rdk4ZfW5eKb4Ng7DLqgdyTc0nqz?=
 =?us-ascii?Q?i4seiOMqjV5AdxFLKnoA1vSrJ/bpcxRzdGdsFMUzhIoU6aLz6rla6kVCFlHQ?=
 =?us-ascii?Q?OOJikcao9x4WrwvF+GL/tXgWczdaFEK0vP79emBtiyS3z/DrtfxvYsIcf4jT?=
 =?us-ascii?Q?sQrzyoODShCxuD2ntTUbfP9eW5q6vTMQoFVpNAC9b+aBjWwE3IkUHDBKI7Ck?=
 =?us-ascii?Q?BzKTeJNEgrCTaE/xjUDvd9vELc5fvZvfmdh5wPO3iEQgpC2X+k++bGMdkSzP?=
 =?us-ascii?Q?7/PFFHZFjhnukm1vG6MaiPfi1NnipIYnl2ipMDrPkUx2DDJf8C6YlH1ugfgx?=
 =?us-ascii?Q?+YnYApqK9GBINpGiRVwZWKZeq3CuxXOcHS1T0JDNbnhw4vewJOorDwCQjucn?=
 =?us-ascii?Q?8+xPmtIu3FLA5kGi+6Ifzm96T3QXk0jzhypztLe3hAw1fYwq5qsLGsRS0YkS?=
 =?us-ascii?Q?F4wxqKJCIPmJfkIv7DWl7pE7uUprrjF6ESRst5PZ3vfn7ZTrMMPjR5YeKazc?=
 =?us-ascii?Q?QcCcydEKt1OALObxzM2z8wLC5hUeSfy4R5MqNx7p8cUr1xS5dzu4Toozgl6j?=
 =?us-ascii?Q?l7lhStnMv35BgaRSaNvbrgS1yFjsFEI63n8MoS/KjNe1tNvjbMgu+J6taHGa?=
 =?us-ascii?Q?ucB8yGhPtPOlsDsSE0hAo7z1+glc4kxoqIzOlqsLZi9IO1fKfvmIuYnkXyki?=
 =?us-ascii?Q?BdQ/pZicJvKhE9OulzHuGys=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2734b54-6e01-4cf2-fa85-08da0047e851
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 14:36:46.8273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rFcIqh3c7v36D2T5AgGIxKTOPqbNYCcpWkFB3s29q3RnX1fhT+oEOnvXUyx7ZwZb9HkB/KGQU43h8CdWd164jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8208

On 07.03.2022 15:20, Andrea Stevanato wrote:
> On 3/7/2022 12:46 PM, Roger Pau Monn=C3=A9 wrote:
>> On Mon, Mar 07, 2022 at 12:39:22PM +0100, Andrea Stevanato wrote:
>>> /local/domain/2 =3D ""   (n0,r2)
>>> /local/domain/2/vm =3D "/vm/f6dca20a-54bb-43af-9a62-67c55cb75708"   (n0=
,r2)
>>> /local/domain/2/name =3D "guest1"   (n0,r2)
>>> /local/domain/2/cpu =3D ""   (n0,r2)
>>> /local/domain/2/cpu/0 =3D ""   (n0,r2)
>>> /local/domain/2/cpu/0/availability =3D "online"   (n0,r2)
>>> /local/domain/2/cpu/1 =3D ""   (n0,r2)
>>> /local/domain/2/cpu/1/availability =3D "online"   (n0,r2)
>>> /local/domain/2/memory =3D ""   (n0,r2)
>>> /local/domain/2/memory/static-max =3D "1048576"   (n0,r2)
>>> /local/domain/2/memory/target =3D "1048577"   (n0,r2)
>>> /local/domain/2/memory/videoram =3D "-1"   (n0,r2)
>>> /local/domain/2/device =3D ""   (n0,r2)
>>> /local/domain/2/device/suspend =3D ""   (n0,r2)
>>> /local/domain/2/device/suspend/event-channel =3D ""   (n2)
>>> /local/domain/2/device/vif =3D ""   (n0,r2)
>>> /local/domain/2/device/vif/0 =3D ""   (n2,r1)
>>> /local/domain/2/device/vif/0/backend =3D "/local/domain/1/backend/vif/2=
/0"
>>> (n2,r1)
>>> /local/domain/2/device/vif/0/backend-id =3D "1"   (n2,r1)
>>> /local/domain/2/device/vif/0/state =3D "6"   (n2,r1)
>>> /local/domain/2/device/vif/0/handle =3D "0"   (n2,r1)
>>> /local/domain/2/device/vif/0/mac =3D "00:16:3e:07:df:91"   (n2,r1)
>>> /local/domain/2/device/vif/0/xdp-headroom =3D "0"   (n2,r1)
>>> /local/domain/2/control =3D ""   (n0,r2)
>>> /local/domain/2/control/shutdown =3D ""   (n2)
>>> /local/domain/2/control/feature-poweroff =3D "1"   (n2)
>>> /local/domain/2/control/feature-reboot =3D "1"   (n2)
>>> /local/domain/2/control/feature-suspend =3D ""   (n2)
>>> /local/domain/2/control/sysrq =3D ""   (n2)
>>> /local/domain/2/control/platform-feature-multiprocessor-suspend =3D "1"
>>> (n0,r2)
>>> /local/domain/2/control/platform-feature-xs_reset_watches =3D "1"   (n0=
,r2)
>>> /local/domain/2/data =3D ""   (n2)
>>> /local/domain/2/drivers =3D ""   (n2)
>>> /local/domain/2/feature =3D ""   (n2)
>>> /local/domain/2/attr =3D ""   (n2)
>>> /local/domain/2/error =3D ""   (n2)
>>> /local/domain/2/error/device =3D ""   (n2)
>>> /local/domain/2/error/device/vif =3D ""   (n2)
>>> /local/domain/2/error/device/vif/0 =3D ""   (n2)
>>> /local/domain/2/error/device/vif/0/error =3D "1 allocating event channe=
l"
>>> (n2)
>>
>> That's the real error. Your guest netfront fails to allocate the event
>> channel. Do you get any messages in the guest dmesg after trying to
>> attach the network interface?
>=20
> Just these two lines:
>=20
> [  389.453390] vif vif-0: 1 allocating event channel
> [  389.804135] vif vif-0: 1 allocating event channel

Well, these are the error messages, from xenbus_alloc_evtchn().
What's a little odd is that the error code is positive, but that's
how -EPERM is logged. Is there perhaps a strange or broken XSM
policy in use? I ask because evtchn_alloc_unbound() itself
wouldn't return -EPERM afaics.

Jan


