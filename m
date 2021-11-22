Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FB94590AA
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 15:58:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228957.396238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpAlQ-0003if-6G; Mon, 22 Nov 2021 14:57:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228957.396238; Mon, 22 Nov 2021 14:57:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpAlQ-0003gT-2p; Mon, 22 Nov 2021 14:57:48 +0000
Received: by outflank-mailman (input) for mailman id 228957;
 Mon, 22 Nov 2021 14:57:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mpAlO-0003gN-1O
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 14:57:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c90e11a-4ba4-11ec-a9d2-d9f7a1cc8784;
 Mon, 22 Nov 2021 15:57:44 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2059.outbound.protection.outlook.com [104.47.5.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-1-cX0-9oLyM_-S5Gjb7KEQfw-1; Mon, 22 Nov 2021 15:57:43 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4608.eurprd04.prod.outlook.com (2603:10a6:803:72::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Mon, 22 Nov
 2021 14:57:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 14:57:41 +0000
Received: from [IPV6:2003:ca:b712:7ba9:201a:362a:8f72:2ea6]
 (2003:ca:b712:7ba9:201a:362a:8f72:2ea6) by
 AS8PR04CA0100.eurprd04.prod.outlook.com (2603:10a6:20b:31e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24 via Frontend
 Transport; Mon, 22 Nov 2021 14:57:40 +0000
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
X-Inumbo-ID: 8c90e11a-4ba4-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637593064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mCuMnINf+hFNw9JlMORnIFWQGDlQBd68NSfo7RVj6fo=;
	b=mv40IKTLCYDLTHMlxu5Sr04c9lx2/RrS2P9VrUXv3/vcb9gPE0BRss6dgnGQE2qy7uET8t
	w6MswM8w2Y1ecMziSehifg4YbnmwygZn+I77Dyc7B1GT60pCp6+TAHJFX1Fe0bPl7bjOAu
	79hNju4UBIJuhU1GaudsuVAwtsRnZlM=
X-MC-Unique: cX0-9oLyM_-S5Gjb7KEQfw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NgtK0g+FSsUhe1SU2MvMA49daRRdytlI7680ihMrENCS4ysISWA6WQ00mJkNDvnYug23pRbY9oW/GHAPGdrrocxagAT8nC7y1ygd/dxdxxwFZCj1PMCReXiSzku7GKQW2Tzm6tXw+ZQBKY1y0jKwnUNL5Nc+stCrjswgILyRT1VTcvtr+7W7d4d6ToQ4n5TLMRO+dfuAh3Gsy3HN4L2JCepgoL8CyjVjAfCVelWnUmczHYRIRpcZcIUzepyWTOn0D0OFT7ZKKc5yQ32saMaRRHsV6tV6bxTafgIsH2s6oE1fQQvJ/nYTDkXhIPRElx5pdrSZrWUR4l2lsxF3afd5BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmSqdYAikkKtngjChwEUZFUQ6S80RBVi06F/K+kD5mU=;
 b=bAtrtmYqr97ePD4V8yQkTmDtjHqdwSF8kJmNl6iSUDZ6FXSccaY9IUvXC6F1QKRpobhW2E9dA/uIXIWkijiJ3oKK5Ha8FMY+TQFmwBoxLSPXfimvyYcdMoS7d9y+7ACFcoHIMYjslBXoHi2/yRgIpPlpC7YgvbTtpNZdCe3qj+1ctfxi1wmAvAdvSxPfVh1eSu5foBdx70+CusNhVNwdfd4ItRsrZ3nsPRUCQVn7300sD61QJBF0PJvK4ZDdp8lWa4uRLnmdswoBRww3RS4TOjpK4cDN+L+B6GDouPKF9Q84r6h6UOR8CnOYB+uaFCKTvpDhBMWnuMEUnljFaB+4iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f16c70be-f5f6-5f80-54f1-7ba69adc114e@suse.com>
Date: Mon, 22 Nov 2021 15:57:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "julien@xen.org" <julien@xen.org>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <b45c172d-ab51-a02a-8e29-3b31b6319f4d@suse.com>
 <17c7485a-2c44-63ec-553c-5caa9b8eb70c@epam.com>
 <YZZdU1oCaMt1HxTj@Air-de-Roger>
 <b7cb9ce7-fee9-f16d-572c-c39b3ff75d62@epam.com>
 <bf8f1c03-d872-094b-4a3c-3b15706babdf@suse.com>
 <816d3519-f007-80e2-e07f-ff285640926b@epam.com>
 <ecd83d8f-f290-295c-e073-583aa70a8c1e@suse.com>
 <2db325e9-0349-1cc3-1c4a-fefa048f181b@epam.com>
 <ac0cc710-05b9-bdae-c31c-d159b4de0105@suse.com>
 <00e78d11-8e7b-84d2-5aa0-0a7f82f13af6@epam.com>
 <7dd919b8-0e3d-30dc-302a-9964f9d94ad2@suse.com>
 <fec02ac4-1ecf-18e1-7ed6-3b1094d60890@epam.com>
 <126a2864-e7e3-b887-43ff-55b1e59151b4@suse.com>
 <5baf1199-e12d-cc41-4520-e32ed29a0436@epam.com>
 <fbc8a807-ea73-760f-8c75-df0930a5139e@suse.com>
 <4e74d5e1-f54e-3888-ada2-a38545571744@epam.com>
 <6be4e6c0-5b54-606e-1278-e97e143e23af@epam.com>
 <2363af0e-6435-485e-8906-16a6fca7885c@suse.com>
 <d8d6cbcb-478a-a5a7-4e93-036b0f75c6d0@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d8d6cbcb-478a-a5a7-4e93-036b0f75c6d0@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0100.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 615ffdc5-ecaa-487c-d5fc-08d9adc86e7c
X-MS-TrafficTypeDiagnostic: VI1PR04MB4608:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB46089D11451F3513B53A18D0B39F9@VI1PR04MB4608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VLBe/gvKW1KEka9ymW7UGeQV8eKNzVBrNOBV5AH2EZG+2v9eqfb4vJQz6DIJKXzjiEuDZVAA/hpU36tMWArTCzKpbLbW+el+XJhtxEXCZ1fr8oBUA+vt9R78LHGwDckTVmO+9EEl9ImNPFZid1oejlzndCQxKNWmE4b9p3yMOlrjVy7TBVsW/KIzKPCIoNoUqms1vyQkS8INCBYpFVfegRxqFS2eQqSYBHS28P/TIImC+24rCjzNhkNCT/ATdFjn3qREog/yH5jrkBhlncZKATQ0uX3RhDLYZQUKhRQzsHPsOTDAe1mPlZ1SavMj084TxTLFwztkiiZD7sc6+hSpbVyMgtYSE6stTy5pOuJfTNsO8J2kJkHsX763zy/ihK5RioTtvQL2bttFG9meVEhlvdrX9KX4/od4whvFI3BuRyLNfb+1H9xTR015EqxpVewoSxyJtsyAVox0giNM06HN+xDIMIE+ub3LtzcrcMbGPfpGaDJKTox3MiFKUOhsUUNdTBXvjheTrbQH8TybBV1PtmYN8kftO9TH37IdkrZ0jacyhwZEL3YneeG6yXpot31vOvugOW9q6iGwfQKKymH3Z3ysIW2xCKwmST/+Ullmi0+Jft7xZEwR6p6F2c8p9fRrHR6O5nxnMHvJ072+KunJsiR5IeEsTbA9GQNdujge3Q5U0I34dO1Y4SHgB25Y9ytH9/lUvDPMtCENn936HT3u6oWchgzcIvT0+/NfNaF/cqs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(8936002)(2616005)(86362001)(54906003)(83380400001)(5660300002)(4326008)(38100700002)(8676002)(186003)(7416002)(508600001)(6916009)(31696002)(66946007)(53546011)(66556008)(36756003)(316002)(66476007)(31686004)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EKkW8ZpdfmrrSJ8Mj9fCfeQEJvU/fXCXE0Yml0ehlu4Bz2ai7lxjN4sRpoZM?=
 =?us-ascii?Q?H5BYc26jXB0dMbbpgrMuxWthX9qaxCJp2cCTTD8KNPwp1q0Lj1u8uHP8oNhA?=
 =?us-ascii?Q?dwElBcUqsXemzoqTuu4006wuWVANcDAjnJefktYoMSquiB23JqIGKziqAQu/?=
 =?us-ascii?Q?qhgNd5NIF6PL9lABwd1tfX+yXvyC3gcilyekixv6p4XgZIPO7l7ve7mbWgtu?=
 =?us-ascii?Q?XMZ2YYQAFuqv1hh7oUQSDHblbX2dFkO2QaeIKxfXsE5IdeEwTtvaSGrps/SR?=
 =?us-ascii?Q?p40pnEvwsFoSh39jOEl0bdX6OZr41xoL5MLav5/svArj189UtPy5d0sgaAqD?=
 =?us-ascii?Q?iHfWEJJscjnGfV7vngc1Q2NFzv4ELTYXE5lGNON+ICDAMhl0Lf+jKAnU/esN?=
 =?us-ascii?Q?jdpCwkGxYcj3QPQfuZdYEskTryh0/zx92+9Eu9FtKaU0hhi+Oq3JG1TrketE?=
 =?us-ascii?Q?3cHAZcl8XWL2egdObOzkHram5aolJtnhVx/q3iyn0gQJhf9M+dNNumd8Z2OO?=
 =?us-ascii?Q?OOX88+YxSsJOjiMv/I2SVo5zgfXYLUwvEqRmwnud9bJz8QzJqMPKH8gRwMlm?=
 =?us-ascii?Q?OzqRjc6xo64TJ9r+zKJkxqcvbgyhtL55Ll5462LqC62rahDhks6W6Mkc2/T2?=
 =?us-ascii?Q?m+wBjvYKyl/+sqmeK0OShoKP9ijH5Uuu1GOXKhqtgB82HgdGFn7DvG6+nxpU?=
 =?us-ascii?Q?Yfar41Qt1L7fDJ3/84iaBVc/XnLTb7rhmF+gF8pF7wce2LA4pECuZNkrFlSw?=
 =?us-ascii?Q?xFaMF1EyGzJyYOybWidO8HUvcZGo00z4oZxu0F4WclzCXZNW5AsP514OGYQi?=
 =?us-ascii?Q?Kxwqc9axHdhh9S0ii4RJEGTJMOPKoFHfKqvPp0GUTejfxDHIZ6/jPOXfAbI2?=
 =?us-ascii?Q?J99rXiGevcOlhALG4SBi8QkRa/HeIS7Qq4nPG0vFj+AArqxJ4DJrSXRVnWRj?=
 =?us-ascii?Q?oSK//1hXxAZOpqE3ZnL5bXmIsr6L3l7ugf+rtaBJT33FHE2nGh6XC2wemNex?=
 =?us-ascii?Q?3pTDRveJGQiZSau13dPkrXLtjHudoFE7lmZYMVmATJc9V5g9Dt2fy0UqJRw6?=
 =?us-ascii?Q?YtI7kkaVAYXzKxrznQuNgPdXmSy1t1XI2hEcTkDUeCZ/IC1rqyTTR847UR4d?=
 =?us-ascii?Q?tXfY/2mzjI9l0DiaVfU7vwo7JfPZt4BNKQ/2NBTLvCoz0T+pit8an5qAes87?=
 =?us-ascii?Q?QXCbpUkZ1xxyYx2ynPh1xpEIiL0sZEBzl8ZeokJdTkYk1JSWx3mArcY5BbmP?=
 =?us-ascii?Q?UlQ/Z3sKoCv4bJoRvMm7QDJn2UgXWZfMaUoTSyz0VJK68kweha3Em28n7H51?=
 =?us-ascii?Q?JkczQLjY/Hw2N1yFs1BTty28rNem7OfZZs5r1HwwLSZjAfSL1qVaZLyBtxha?=
 =?us-ascii?Q?Hua+oVQ/vuWyWAt+8fdQrv7E7VrOebOqKDfgzrOR8xGozTUkZbdJCKO1V4wf?=
 =?us-ascii?Q?kVIwHb8itg9Imp1jYVNuRwntwDaYc0RQm1mQRQBhlWX0gJlP05Hu4lYFbfjQ?=
 =?us-ascii?Q?WrQ5NluVfERKIk6gc19RSUzUzMvkjWxwi6eUD4/GGzhzvgd73Zt/ZjQqs00E?=
 =?us-ascii?Q?95+iz1LRpXtKND5YuMptL0aHr2f0mw1yQwLM591AA97Kw0EOLWVUe56pcfJ8?=
 =?us-ascii?Q?b1G1LANTZ4qvRyELjuukJ/JEZyR31f/UpzLJq3mpdfXOnz7+vbfV5JaYMgdf?=
 =?us-ascii?Q?BlP5qwgFJ8/3V77KSzGV0kBadG0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 615ffdc5-ecaa-487c-d5fc-08d9adc86e7c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 14:57:40.9934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Qh3y6HEHhO12fQ5mu4opD8RYDK+ZFqdeZlXVCht+78v2uj8VBQcsOrl/nXAadBYWtSA1e/lJyYFOl3LSRHrCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4608

On 22.11.2021 15:45, Oleksandr Andrushchenko wrote:
>=20
>=20
> On 22.11.21 16:37, Jan Beulich wrote:
>> On 22.11.2021 15:21, Oleksandr Andrushchenko wrote:
>>> On 19.11.21 15:34, Oleksandr Andrushchenko wrote:
>>>> On 19.11.21 15:25, Jan Beulich wrote:
>>>>> On 19.11.2021 14:16, Oleksandr Andrushchenko wrote:
>>>>>> On 19.11.21 15:00, Jan Beulich wrote:
>>>>>>> On 19.11.2021 13:34, Oleksandr Andrushchenko wrote:
>>>>>>>> Possible locking and other work needed:
>>>>>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>>>>
>>>>>>>> 1. pcidevs_{lock|unlock} is too heavy and is per-host
>>>>>>>> 2. pdev->vpci->lock cannot be used as vpci is freed by vpci_remove=
_device
>>>>>>>> 3. We may want a dedicated per-domain rw lock to be implemented:
>>>>>>>>
>>>>>>>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>>>>>>>> index 28146ee404e6..ebf071893b21 100644
>>>>>>>> --- a/xen/include/xen/sched.h
>>>>>>>> +++ b/xen/include/xen/sched.h
>>>>>>>> @@ -444,6 +444,7 @@ struct domain
>>>>>>>>
>>>>>>>>      =C2=A0#ifdef CONFIG_HAS_PCI
>>>>>>>>      =C2=A0=C2=A0=C2=A0=C2=A0 struct list_head pdev_list;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 rwlock_t vpci_rwlock;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 bool vpci_terminating; <- atomic?
>>>>>>>>      =C2=A0#endif
>>>>>>>> then vpci_remove_device is a writer (cold path) and vpci_process_p=
ending and
>>>>>>>> vpci_mmio_{read|write} are readers (hot path).
>>>>>>> Right - you need such a lock for other purposes anyway, as per the
>>>>>>> discussion with Julien.
>>>>>> What about bool vpci_terminating? Do you see it as an atomic type or=
 just bool?
>>>>> Having seen only ...
>>>>>
>>>>>>>> do_physdev_op(PHYSDEVOP_pci_device_remove) will need hypercall_cre=
ate_continuation
>>>>>>>> to be implemented, so when re-start removal if need be:
>>>>>>>>
>>>>>>>> vpci_remove_device()
>>>>>>>> {
>>>>>>>>      =C2=A0 d->vpci_terminating =3D true;
>>>>> ... this use so far, I can't tell yet. But at a first glance a boolea=
n
>>>>> looks to be what you need.
>>>>>
>>>>>>>>      =C2=A0 remove vPCI register handlers <- this will cut off PCI=
_COMMAND emulation among others
>>>>>>>>      =C2=A0 if ( !write_trylock(d->vpci_rwlock) )
>>>>>>>>      =C2=A0=C2=A0=C2=A0 return -ERESTART;
>>>>>>>>      =C2=A0 xfree(pdev->vpci);
>>>>>>>>      =C2=A0 pdev->vpci =3D NULL;
>>>>>>>> }
>>>>>>>>
>>>>>>>> Then this d->vpci_rwlock becomes a dedicated vpci per-domain lock =
for
>>>>>>>> other operations which may require it, e.g. virtual bus topology c=
an
>>>>>>>> use it when assigning vSBDF etc.
>>>>>>>>
>>>>>>>> 4. vpci_remove_device needs to be removed from vpci_process_pendin=
g
>>>>>>>> and do nothing for Dom0 and crash DomU otherwise:
>>>>>>> Why is this? I'm not outright opposed, but I don't immediately see =
why
>>>>>>> trying to remove the problematic device wouldn't be a reasonable co=
urse
>>>>>>> of action anymore. vpci_remove_device() may need to become more car=
eful
>>>>>>> as to not crashing,
>>>>>> vpci_remove_device does not crash, vpci_process_pending does
>>>>>>>      though.
>>>>>> Assume we are in an error state in vpci_process_pending *on one of t=
he vCPUs*
>>>>>> and we call vpci_remove_device. vpci_remove_device tries to acquire =
the
>>>>>> lock and it can't just because there are some other vpci code is run=
ning on other vCPU.
>>>>>> Then what do we do here? We are in SoftIRQ context now and we can't =
spin
>>>>>> trying to acquire d->vpci_rwlock forever. Neither we can blindly fre=
e vpci
>>>>>> structure because it is seen by all vCPUs and may crash them.
>>>>>>
>>>>>> If vpci_remove_device is in hypercall context it just returns -EREST=
ART and
>>>>>> hypercall continuation helps here. But not in SoftIRQ context.
>>>>> Maybe then you want to invoke this cleanup from RCU context (whether
>>>>> vpci_remove_device() itself or a suitable clone there of is TBD)? (I
>>>>> will admit though that I didn't check whether that would satisfy all
>>>>> constraints.)
>>>>>
>>>>> Then again it also hasn't become clear to me why you use write_tryloc=
k()
>>>>> there. The lock contention you describe doesn't, on the surface, look
>>>>> any different from situations elsewhere.
>>>> I use write_trylock in vpci_remove_device because if we can't
>>>> acquire the lock then we defer device removal. This would work
>>>> well if called from a hypercall which will employ hypercall continuati=
on.
>>>> But SoftIRQ getting -ERESTART is something that we can't probably
>>>> handle by restarting as hypercall can, thus I only see that vpci_proce=
ss_pending
>>>> will need to spin and wait until vpci_remove_device succeeds.
>>> Does anybody have any better solution for preventing SoftIRQ from
>>> spinning on vpci_remove_device and -ERESTART?
>> Well, at this point I can suggest only a marginal improvement: Instead o=
f
>> spinning inside the softirq handler, you want to re-raise the softirq an=
d
>> exit the handler. That way at least higher "priority" softirqs won't be
>> starved.
>>
>> Beyond that - maybe the guest (or just a vcpu of it) needs pausing in su=
ch
>> an event, with the work deferred to a tasklet?
>>
>> Yet I don't think my earlier question regarding the use of write_trylock=
()
>> was really answered. What you said in reply doesn't explain (to me at
>> least) why write_lock() is not an option.
> I was thinking that we do not want to freeze in case we are calling vpci_=
remove_device
> from SoftIRQ context, thus we try to lock and if we can't we return -ERES=
TART
> indicating that the removal needs to be deferred. If we use write_lock, t=
hen
> SoftIRQ -> write_lock will spin there waiting for readers to release the =
lock.
>=20
> write_lock actually makes things a lot easier, but I just don't know if i=
t
> is ok to use it. If so, then vpci_remove_device becomes synchronous and
> there is no need in hypercall continuation and other heavy machinery for
> re-scheduling SoftIRQ...

I'm inclined to ask: If it wasn't okay to use here, then where would it be
okay to use? Of course I realize there are cases when long spinning times
can be a problem. But I expect there aren't going to be excessively long
lock holding regions for this lock, and I also would expect average
contention to not be overly bad. But in the end you know better the code
that you're writing (and which may lead to issues with the lock usage) than
I do ...

Jan


