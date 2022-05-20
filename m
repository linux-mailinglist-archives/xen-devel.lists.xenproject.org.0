Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF0552E919
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 11:43:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333601.557449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrz9m-0007QH-US; Fri, 20 May 2022 09:42:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333601.557449; Fri, 20 May 2022 09:42:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrz9m-0007NX-R5; Fri, 20 May 2022 09:42:50 +0000
Received: by outflank-mailman (input) for mailman id 333601;
 Fri, 20 May 2022 09:42:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mtD0=V4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrz9l-0007NN-I3
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 09:42:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3579bc2d-d821-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 11:42:48 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-mF-8T5uzNNO3isLH8Kncow-1; Fri, 20 May 2022 11:42:44 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4060.eurprd04.prod.outlook.com (2603:10a6:5:23::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Fri, 20 May
 2022 09:42:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 09:42:40 +0000
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
X-Inumbo-ID: 3579bc2d-d821-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653039768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IclR5YN6S+Fq/Ycgrs5PBrPPAqm9Yru3iC86IYfJ/Rc=;
	b=Xsvomgh1/JbZHofWCEk4ikDElI4PpEYCtWO9oZCUq1KQkoLEb4W8bb+/KlvdTvDkEEiRcy
	2KEfIFwrJNdsTujsf8PbW5rgg5pMOuv5jtcNaylnuT22qvcd2nr/kQ2IRqRGI0ZPrIHfIH
	5/Z/8B96PvFf4QgtjbntmlsbyrETFJw=
X-MC-Unique: mF-8T5uzNNO3isLH8Kncow-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFarrIhzmZJdXeL9zLJitTowLcbZEEktAEIpSY0OEgCQXWFwNwUgtpUmuUgR1/aev1pTzHSQAOB1maWzl25jluX/4F1NSH0PjKg98M9oaUeyZdbHI1qSyAF6FuXToPEyH3JKBudVcHvDcZlEGXAjMuapeJ2LVwlJoW1epBuQpX2qO7bYzfSWrr3oSutZ5+vZJXQHECqk7+GrGHndm7T8rrwwwJ3NGvbRN3rny+WxRAqL+nbCJWT9xSYOMXsSzgJFBg4W/YjV38WkG5rI3C+mPTmdUwvURRnTMK+RojmTKcQ+8jAFad4n8O0i2imCzAX35+RDqleZ6g/o87IgW1BaBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8dL1yg921o09JUI+MuCYTqS449xFU0BUBLNKzmZlYM=;
 b=agm0nJ9EOAy5BPZyt5NE9MatirT32mToZmwWrlqQ6YG6UTfK9W4MFbbDBVP3vkVtteOgEWLpGyG/zFbhl5umq9HBr3Yeya0Ix5rl2MMdGAVsoGhMGP64G7uQ5GxGaCaZoOAoaXFrqubITR86tfg7S9NugU6rvwF9uKSZ1fJhW46nzeHzemss2qELGIlBRefZ2YtYFeGZMEmKhRB2pi5ouEjQb4qzbTeT5zDSPV2xBtee37Rv2xX3viLDPXcm60PW6YhzHvLzS8MLniG4JapzWUrK6frXBNdimZ27wI6s6VF/dJWA+GEBdRyq7q4+7/naF4uYf2s//F5lalmo9fswsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <663a03ad-9df1-173e-19b1-4f4af1aa9b37@suse.com>
Date: Fri, 20 May 2022 11:42:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v6 2/2] ns16550: Add more device IDs for Intel LPSS UART
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220520085343.1835866-1-marmarek@invisiblethingslab.com>
 <20220520085343.1835866-2-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220520085343.1835866-2-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0570.eurprd06.prod.outlook.com
 (2603:10a6:20b:485::25) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e672b815-484e-4f56-e774-08da3a451491
X-MS-TrafficTypeDiagnostic: DB7PR04MB4060:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB40606D047776CECD42F4D3F5B3D39@DB7PR04MB4060.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AB/u2xr1vilgoqEXkEqDGoXN22kLNYvTYNkknpgnuevQPka77O4Sgv4pNghl1ot2//M28ML3X8ROWzHesijwEsf9weFDa1WsRSi5UqjTcyqlp1IwFhlYndCszTmbidlhTBDREDcO1143njZwttelhoYRhXZNEBy2udk9WKIl3NAEtI0jzkDXZiGhL2/MIOi7lt1fxWp8yp6FidJ8x7rpTvyPK1CHNkS/i7cBp5rnuk4NoerR1lkuuCUEkmXWjl5Bbxo9yaFf835LKbkRYHi5E/SKK7ByA1b73w2Oba+uzzI+NkP9HNniwqVM2B+vN0INETi0395AGLl7eJtmN4ne1jf04U5hmn7yNwdOcxKaTAe2m68qLgNL19VwWdqBgUqeOtjXE5N5qY9RH/ZMrjj1ssOQ15tQ1jVj7djF6dh2PTmM2EP9w4jd9cBlGCumjEBVYTyKr5kd83WggrwnB4Qp30K8cbvwWbaRx+BqXypPpBta19qPP8+NAr+k9dFh0+20kWzMufl33Io5O+gtProHXPvm2Cjt+JnyoBVyPi2kxQ1j2TZSJAOwBTf8/z4PugvAUQG5EdU+1NpPaRxdVAT6NwTmWpJGtZSxEqgGUmdkjyY//VJpFVIEJpuvHBkPbpnTfgcnkvcVQTgX5rXSzhqNrJiOV5hwFFnMmrhev3Zu+8nPGrcLKnE7pscvrgFdHCNaW9DfsOCrmRjMQe037C/zleZLHcP+nuE6NcAWbFnKriuxfnvO0/6X5Gpvx4Ugtvus
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(6666004)(31686004)(8936002)(508600001)(36756003)(38100700002)(6486002)(26005)(86362001)(4744005)(66476007)(66556008)(2616005)(5660300002)(2906002)(6512007)(6506007)(53546011)(66946007)(316002)(54906003)(66574015)(186003)(6916009)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?umSAXY06V3mBLsFaakHWjvH72/gSsXWr8h/wGhxImkTK1PNqXQPKysXKnCOY?=
 =?us-ascii?Q?0zYT1heSkOG06ihl1x+VjomHuZ0oOEACr7XDLJ2J0r6rH1OjbJaleqLJYUHV?=
 =?us-ascii?Q?AuNx1Xy+neO6SrA9RY6ozeKLvtYAdm5KjVG9pP/2ilg5cnRMYo4iSWwWSf+B?=
 =?us-ascii?Q?hKBhUs/IU6Td7Qll4RLkUQ6SSygAguTVCFb+OE+lAqxwG2MX27JxxcK/X1Ox?=
 =?us-ascii?Q?cyStUgYNUAqb9Tme+xv2NmTEZ+hy1EC5B4wpEtrKD+2sjqW/YZHx/afqaYva?=
 =?us-ascii?Q?S8Fqk7N+vR7PX8zIdFnHka77j8vEetiuZXYJqyD37ygmwM5n+wDCxbuFweTU?=
 =?us-ascii?Q?v1jZEh8PJM3sYRIPg6ODoFFUvczTbjUJyP8AxnAbPShKqp46wT3TQJQBWmNW?=
 =?us-ascii?Q?UC3VGvVcmyHCtGxag116iwlIGzm7g9jfLQlqpNXvwZyAyKDbrzJCX6+c2C3p?=
 =?us-ascii?Q?14W1Yms22EhIEvOFqECLpC1hm7+nvbTqVFkSU7tK47tUjtbjuB3Nr4vxHT+0?=
 =?us-ascii?Q?Gn1hd2tEjHn012nikk8fCYrPJoLWF2CkKRBaDZupFadF81S2b2Ge2oretTHq?=
 =?us-ascii?Q?ngXIHHfhWlScMjiungX5nzDEyCOGx6dUuFe8nxzSTHcjAQBByks4Z2RtS/Zz?=
 =?us-ascii?Q?Dl7/GtLZed6O24DAImCfFl7++Lfvq359XehOQv3FaK9/KDg06hCcfm1l6adD?=
 =?us-ascii?Q?m3TiLMPizMFXI3nnYQUs8AX/6DqwKYBL+h5H0BmetmBnNTS71btQg2ZVOrf9?=
 =?us-ascii?Q?ZiRqsIu2z9ba8D47PKSR94PiFD6A5tIqsPzqQ9Ml3JmUHpXC8Q6Man1re6Fq?=
 =?us-ascii?Q?+3raRecij7gjibeKzh0WZ23pTgwg0rKbopj11BMGS1abNTUmeJ3Bq2rKnA17?=
 =?us-ascii?Q?yvLv0d97QgVp29jYwbNxHgY5bJ92Sp/jcWQSP94d8WQcePgJdiHTYQ1GcCko?=
 =?us-ascii?Q?Aq9qFqNF0CePUbDWv2oPNo9DTaSHCikoH0y+uagzd4iCPYVBuV9pUQpyCLXX?=
 =?us-ascii?Q?wSJsBGHQwfLAzi5uzmRU6k1zbDqWpjZDb6WdMOJcLkObn+P8EQA/1yNaJQXw?=
 =?us-ascii?Q?HqISNCDrzzBlJAE0XRGEFA+WC/Niwov+MUFnYFicA9cz+m5JdaAb/tEDYLgA?=
 =?us-ascii?Q?4QWU9UQVOWgFxwWaBf2a6zz5XKuSDcBioyWBn3jaWE7XorFDgw8Qnh/lxPsj?=
 =?us-ascii?Q?3Qn50oTRjEn9ILgIZyodr3dC0wWbmAZET61nR+rBiEEtL6/FPjmpsexAVpCr?=
 =?us-ascii?Q?KVqN3Jn475N5FYr4lAw3gLoSlJISRDCy5HwFSneg8CUfpekFZerCoHPf3AGL?=
 =?us-ascii?Q?xyiRU2A69UhvHdxGpDHP8U1Tq85FWyBYj0QLOYgAHX6X7oQocv+Qd+rp0/oG?=
 =?us-ascii?Q?V4etqHBioedENl/3LU5Y3zWrkUM1Vn4EVJCEFOW71kTgM4pTXIQpxhQZl8EN?=
 =?us-ascii?Q?BvqrC/rdHjEdMMOVasvd+dkYl6uNOkCdHuFd1NME+ilwOZTGnW3JVNUnlsRf?=
 =?us-ascii?Q?7PcOvrVja2OtSxZHrIDB1X8h7HcyKamVbeKM3rMpHWzkwvxbC1eeRNEIM8bl?=
 =?us-ascii?Q?LrsCafLuP3tQd1wGJkjeQX2Tc9+WGsby3LAor0TLUPUPu2NFqMlj2BGec0OA?=
 =?us-ascii?Q?Nd3ddccV2QbYWnIgwJMp7PTpzgOQuZX3H43WXpLpqhkLELuRWKPYs1hL6TjM?=
 =?us-ascii?Q?mRWAZ04J/6bS+/z18vkTO4ny3QrUN4Wb6rdcMtZYTi/fwRhv/gcBuw91XB+8?=
 =?us-ascii?Q?OKChe0Ox3w=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e672b815-484e-4f56-e774-08da3a451491
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 09:42:39.9388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E9BowbO7IU6zqs++7FLhEm+RkC4hT6hETR4SBtdEbKFTA+eiufQhkxhWVTaM9vD2RRPeqGiw7nXOSOtih4k2qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4060

On 20.05.2022 10:53, Marek Marczykowski-G=C3=B3recki wrote:
> This is purely based on the spec:
> - Intel 500 Series PCH: 635218-006
> - Intel 600 Series PCH: 691222-001, 648364-003
>=20
> This is tested only on TGL-LP added initially, but according to the
> spec, they should behave the same.
>=20
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Oops? Commit 1f0b1f5cce9d.

Jan


