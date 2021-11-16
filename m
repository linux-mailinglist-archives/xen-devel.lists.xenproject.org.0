Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AE44534BC
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 15:56:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226339.391096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmzsP-0006Y9-Hr; Tue, 16 Nov 2021 14:56:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226339.391096; Tue, 16 Nov 2021 14:56:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmzsP-0006Uj-EQ; Tue, 16 Nov 2021 14:56:01 +0000
Received: by outflank-mailman (input) for mailman id 226339;
 Tue, 16 Nov 2021 14:56:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmzsO-0006UN-3d
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 14:56:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4eeca50e-46ed-11ec-9787-a32c541c8605;
 Tue, 16 Nov 2021 15:55:59 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-n0m8UhPdPKysGxIz-Tb7Yw-1; Tue, 16 Nov 2021 15:55:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3117.eurprd04.prod.outlook.com (2603:10a6:802:6::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Tue, 16 Nov
 2021 14:55:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 14:55:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0701CA0072.eurprd07.prod.outlook.com (2603:10a6:203:2::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.15 via Frontend
 Transport; Tue, 16 Nov 2021 14:55:53 +0000
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
X-Inumbo-ID: 4eeca50e-46ed-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637074558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aPiSSaE6JmblMcftistrINGmNpA2/8MuKKgoo3uP3w0=;
	b=HiSS89pl2wFZ9SWlq0NdqMXbAI72bzEEcQh3jJKum5C6vMPo0WVekpmNGuRZl1atABDVta
	h6oosKstEe5KbLL6jHLW2hh/qLdSa7nKjS5hUP+ornkXVOpWdA48T9ZmTe++V/tSPluL2i
	8GdgQkCUcuZQd6xy09GP4w3h9Ql41Ek=
X-MC-Unique: n0m8UhPdPKysGxIz-Tb7Yw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jmLwTlh/3XMT4zYDZhBOu4vPZ/bQ7l87ZllQhF/HAME47bBr+DxEc6cGFsX5QBgYOv8FISQeEXz16OTpJYhX8RrxWOk9fd1Z8qLRZ+C2/SIsV91Nv0yYuOkfFRbv+4/HmwMcqBHyQ3a5/LxPapvNAO/kjbly14w30InNYahiZ4lC1TuakhQB+8V4OS+PlVNCLUq66k43eDEm5NjJTpY1qN5wwbBU2U7SEpgYh5ugaWgqR1GxTdlMPUK8rEjdIx8ZxA9mWk8TyodHpqG45iWjfK+5yWPHlG7+XkOY522PCPIKXOtsf070bzFlxu4mCUsnFUbfy4L/AdA0eU7KLWDWZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ByBp5MZeD59CjWf5VwLe51Y0tIsapc3swcZVUvIiHI=;
 b=d4Sk0/c7YbpJyFtDYSTSGQYPosrHHZmTysl/Gau4OFge4dN+wiVx9fPWc6Ow+UF3cOmqcsQhQIO7pgIoq40tCuszL8Q4Yb6mRJfUY3aEel5FfdVO6nIZFolxx6uh5oU/li/LwIWq/JTKzQK5f0pDcp34wn1mmVjZwBeXJr9bk7N7qimDayq/DPRwV1mEgwmDABef9FwZi05IGvy5jjtIVrdGYxz6+lHC9EJddBO9n7h0On7Sw93Sh1Xry/pWcwcPb7Lq4Ay0nJ6xY5t7eXSsKu7L4HvCfArNSfpG8RBjKW9IkKMQIojybJpmRA+sA9GQkobVwcoyi+S3JSGH8eScxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f80f3207-363d-51b7-4ae0-e4b8aeb2544b@suse.com>
Date: Tue, 16 Nov 2021 15:55:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] xen/privcmd: make option visible in Kconfig
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
CC: linux@weissschuh.net, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20211116143323.18866-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211116143323.18866-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0701CA0072.eurprd07.prod.outlook.com
 (2603:10a6:203:2::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 161156a7-bf84-42dc-d0af-08d9a911301d
X-MS-TrafficTypeDiagnostic: VI1PR04MB3117:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB31175B10B52CFD316D2707DBB3999@VI1PR04MB3117.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	giFg30kwEZZfOtLnrZWIL2abEQq7Ix+fhYRxOCUeHZEDyOnyLA2T2pVsVtzg4iId1R1acvdMat4JpdTKXjOP+UfLQpUqIZMc7BkxP8xjw8EnZkZjfg9cZQTpFutfgVr4sfAsEQZuYWEkJUnhO4C0RRJr2tCBfkztt3mcmazrcdzjPcImgPbsg3xk2qeEPctLuPSj3g9rmyXbglidV5hK9gYxCA2W3Y9BbWDs4FJrw+C6CWckSVk4UdM4RddpRO9liy/Z3Q7Bv33nG0KBsHQLHR+K16Dn13elZN5E+iYd7Tr3oYBoCFG8IrdZUcOEF9SsHpX5AlrFmn6LfhvEh9C3hjQeDpertW7UFxnjjsnQmVqeJfXrgPeP17fS/oB9q/+h1hP7H5fqh3PjptGfb7eRWAyVdlhyMC3T+HOmiu+2xhQ/H0U4PYOgpUy8B+0i6HwMF0eVxjYE62Dnn/0HCIPCfy9ZLxhX/JuNHk/JaMrU8vQLp3Wu3Rg1kmmIkB5WEncydzuCtO7ahXPRDADEkQ6Xg5Wi9QMYMRhnn4RoHlfgjzMRpzCZJqkJ8F5Ki2kd8CDwsrO2a9Z+g+txC/EYmYeJil0U3W6QTgyBBHkpO/8gwYdsXLMzjY56XrWdBWTbMNtMOzqi+X4xgzZLmqE8ZnCbLs/AnXAQQMesI1QfES5YgPPVfLi3p0MDKiOy15sYYhF3YXIqW6ma3l7N0XLwnjt76D3elpiu6nEjTNjOlIEfKdc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6666004)(66556008)(53546011)(5660300002)(16576012)(2616005)(66946007)(2906002)(54906003)(66476007)(36756003)(86362001)(26005)(316002)(6486002)(66574015)(31686004)(508600001)(83380400001)(956004)(6636002)(8676002)(4326008)(37006003)(31696002)(186003)(38100700002)(6862004)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aUic87nJrHWHGCLLQbOQWXJ3JM9dmq5SS34htK4YqxXX/xi48Gs6/4+G+3CE?=
 =?us-ascii?Q?kUXyQMsB9KTuwqehnDOlGy46oP/DvzO4n1PgK/ymnvo9OzlBnIPBNovROU5I?=
 =?us-ascii?Q?ZiT7k549MNKOKHQi1k9i+vpwHChmhalqsJVHhFylGCQNygq/wodFHCAgZd+L?=
 =?us-ascii?Q?lishlpjV7bNXrp/GEVcOXNPsrB1omENnkN8XTTMzJnrCVYLCbSKHRQ343SiM?=
 =?us-ascii?Q?8cf1MRribiuK5Sla7uBMBioNmgDuXczIfdd358o93/mxrVMvtY7YI/jkU43Y?=
 =?us-ascii?Q?RjUFIHicK4D3v6DwV/O/97KJa2YrDlQzEVR5FVInHV0KKbmWdRn0a25na2fN?=
 =?us-ascii?Q?3mLAFeTW16Qdcm9/NMSAIBLjPF4ACZHNpZn7alIA4V+UdMfXK5phEUYh+z3i?=
 =?us-ascii?Q?fYNt5gVY6svuylJFv1F60ASwAZHePszAtpc1PMaS6XPLYqJvcm43OqRXaKUV?=
 =?us-ascii?Q?g5dxc2+rBeF/MwT+UhC2cNmW61q+N3fUXUgy5vANmnVjIvPAZ1IT0OygUdOV?=
 =?us-ascii?Q?pBmPEpKxJv7iRAkVObrTxcvBNfma12qArd1wHn284GVBuERh44kKqFV8pZbg?=
 =?us-ascii?Q?cHoom4RPA47x7aFJAvyP5cQIM9/4yFauwe5hknZ0yDpTKejgPEpNkJQIlLYX?=
 =?us-ascii?Q?xUmaR8+s52o6xRtieAVCVrEN/Dv4SrjLDtZY2Ong8iwQba8AflQ1s/4yjO4V?=
 =?us-ascii?Q?Z6QOhhH9iytC5Qfz+uoHp1TCzuBagNUY2h3HDR5cimVI5csL75VFyHphMYtU?=
 =?us-ascii?Q?grXb7HusUpK9sA49XP9kA6kvOep5aPgo+WxR/P2Uo4Wsjlk+aEOG4eOB7fy/?=
 =?us-ascii?Q?Fwu5hD2KtU94xc7CW8zOBc2tfZnMciYsk8y+fP3Y+X9To+OSuNJv9fIdcsV7?=
 =?us-ascii?Q?dT9eBNeZaHNgyoxOjHsjS7yl85NmAuDsk+gKKuEfzw8wjXUTtVZVURTPI18g?=
 =?us-ascii?Q?2kDTpj2eUluiVf9V0hW7c7h5nVxyQRmX8IewM9iz6eFBrLf30yuhHx1XFa1Y?=
 =?us-ascii?Q?Td2+Hm5JT0dIfMAC/T1pBMsx6x8Uzt7EgeTafjBu1CRjRQc7+kZAR3I6MWp/?=
 =?us-ascii?Q?JEx+P+McJO/Xo911vgz0iT5ykHCj3QTNq9+vPmZri1q8/fXt2E2qi2oQ4zCX?=
 =?us-ascii?Q?Zxy5OCx0na8hICqHp4ZtspCeGUPmdwQZiV+8FWhxP75NTyHfS3Udg81XcLLv?=
 =?us-ascii?Q?0ubA1VS6y+blRsnrcoFQiTi5U/YObPHgQcjYDxNKi7XyqIGQFTo3iDKEOxPw?=
 =?us-ascii?Q?pX5PhQYCTB+RmoS7JqrQJ7+D1EaD9hPhEFlEqO2jZhlp2j1Qy8O7RzfdRRPT?=
 =?us-ascii?Q?nb7uGTcPlL4l4vx1rNTWGFqRdE20NmrcppkoFrxCdZINNizmKHIuQMuzF9x2?=
 =?us-ascii?Q?Zmk1vW4R4RX/Q77CQHuyY4apQSNogdFBZQpAvVbkIyBx77/9sSEu/OIf4J/2?=
 =?us-ascii?Q?bH6dDDOp0sUN8UQ9BctoKUn1uVpwznX0xbxy1IZvGiztszstiEdOldKZoBhV?=
 =?us-ascii?Q?b5xfseJNDIkCAYV4P6dg4WmaD47pnbXgHU94/tCd7IRqo+G2FbV2ZVDxVYWx?=
 =?us-ascii?Q?xPvIta1+jJMVFwBYywBT+wTn2DUXDzlsl69dseEQHJePHKAIhHTCxInE3hjO?=
 =?us-ascii?Q?nMsKECYZsZT8w/yH1U1JZY8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 161156a7-bf84-42dc-d0af-08d9a911301d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 14:55:53.7343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BG/aUZ1+Um3YFUmljdLnsi2KZmnemH8biKt4tqI67Hmnor23bx0pqNP4RgPgHyOAAvX+6YKEQNW1R+ccETKziA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3117

On 16.11.2021 15:33, Juergen Gross wrote:
> This configuration option provides a misc device as an API to userspace.
> Make this API usable without having to select the module as a transitive
> dependency.
>=20
> This also fixes an issue where localyesconfig would select
> CONFIG_XEN_PRIVCMD=3Dm because it was not visible and defaulted to
> building as module.
>=20
> Based-on-patch-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -259,9 +259,14 @@ config XEN_SCSI_BACKEND
>  	  if guests need generic access to SCSI devices.
> =20
>  config XEN_PRIVCMD
> -	tristate
> +	tristate "Xen hypercall passthrough driver"
>  	depends on XEN
>  	default m
> +	help
> +	  The hypercall passthrough driver allows user land programs to perform

Maybe worth adding "privileged" here? Albeit of course that's different
from the use of the word ...

> +	  Xen hypercalls. This driver is normally required for systems running
> +	  as Dom0 to perform privileged operations, but in some disaggregated

... here, so there'd be a small risk of confusion.

Jan

> +	  Xen setups this driver might be needed for other domains, too.
> =20
>  config XEN_ACPI_PROCESSOR
>  	tristate "Xen ACPI processor"
>=20


