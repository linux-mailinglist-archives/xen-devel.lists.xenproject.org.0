Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F65490C68
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 17:22:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258202.444417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Ula-00081k-NP; Mon, 17 Jan 2022 16:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258202.444417; Mon, 17 Jan 2022 16:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Ula-0007zu-Ji; Mon, 17 Jan 2022 16:21:58 +0000
Received: by outflank-mailman (input) for mailman id 258202;
 Mon, 17 Jan 2022 16:21:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZUQe=SB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9UlZ-0007zo-B2
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 16:21:57 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96858118-77b1-11ec-a115-11989b9578b4;
 Mon, 17 Jan 2022 17:21:56 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-OKFmIB_BMYeNEmZ4IlyMow-1; Mon, 17 Jan 2022 17:21:54 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6127.eurprd04.prod.outlook.com (2603:10a6:803:fa::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Mon, 17 Jan
 2022 16:21:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 16:21:53 +0000
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
X-Inumbo-ID: 96858118-77b1-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642436515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bhIMUPvNMzJgnMwNtQ3ko7XekrpLYE2XNZmdfyEV5rA=;
	b=VGOBdez1YtbddAWiigybPCfCUhih4DI76iLNSp3GuHV0DWqPRs4/PSgoxWXZVqhQiDWvZo
	wA5D+fYPjITynLr5p0NqMOFTgYD7LLFawEgjF1WLxUrwjJGQpf1b0WVFuQJ69VCcLEmtCb
	caCEIg1YwoPK9jAGPL74W3WfCj4bBW0=
X-MC-Unique: OKFmIB_BMYeNEmZ4IlyMow-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=biXr5pHEY/pNNX4kSmelV+YFi+ggw1Rr8WGEJnDikYSw/g2aM/85Gq4Hdzcy3XP+HCbo3nuJw820EQUArQgPc0ugBAnNWwAdq6PnOUVBmxs/Rn+6lRPxkRbeo8Fi1P4/c2xJudd4lJUz+DIDErbrMAb0eqK75+XQxCFZh+oVG3sDrsRm4ePGI/3O9CWGLbvhET6DOMIIqJukLpzXXj2G1kexDUkfO8Su6YHsm/yDR0MiWFHzVv7mVFm5PxYdz1TBC+dsEBccYJ0fytpAjTNUBsnQf3qgsEXP8lYVrEA2cb17KxzU22st5yZ+SFPbAKR6Zpqf+XQx51sl0Pr3ABupRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Nx9XvAAsBuKMWe7wk0Gu6J6rItL5YmUsIVjL67O07g=;
 b=E0ELpAUse6fqrlQqmllRlH5tDenanzMLwehkT+4haYQR4d896J/5wePwCDXNtP/Q7oPnxDZxn6ej4PHqzdI9S6M3KRBi7ykLYAItGbHOKhai40nDL1HOrIOsx5vNXvUggiM+anPnNgAXHBagjDcjWxJq/ZPcgHEI7uwdItMOhELbDgtmGBZSIAYsqkXb9WaEUMe3Il42PBrp+qbJIfcLrR2c5JpWPPdoAZmaO6XQosu+8ZUobmZJFoH5dGXjCO+OxZKU8pHcPZ+gbuoABWxMQAaxZJ93mFadvRI4Bff1Ll7QUEaRgabkLVq9OCJTJuKzZSRG/nkgPyIa/3Cj975K7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <18b1921e-44f9-3e4d-eafc-47ff88009b13@suse.com>
Date: Mon, 17 Jan 2022 17:21:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 19/37] xen/x86: promote VIRTUAL_BUG_ON to ASSERT in
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
CC: Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, julien@xen.org
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-20-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20210923120236.3692135-20-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0117.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1373bf14-9435-437d-308d-08d9d9d578d1
X-MS-TrafficTypeDiagnostic: VI1PR04MB6127:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB61275B2B3EDD09E2DB9C3193B3579@VI1PR04MB6127.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UeMpYpDKLbb85C9VkXf+xeaeojBbIfzTWvkFyQSTzsnIGpQ+qcCANdK5d46NFjYJRXmv1j2pDRrIxmpZoypPaA9aBrsfVJqqNYcm6W42xYkdqNO84mt9wX5JcPvmAMONu4Z7RdMGMFbSPkFnbkjJC7mPlKLS9rU/u5ZD35WhYtR/tQoqg4qpns3N1qAgkZ5Db65P3jVOKGYWvwU0QK2LSDWJtbbxJLyrxE8j6it5OVswsX8GJrZ4Cl3NX6iLQBIFG1UIuvTKU8eZzP9itZZEkIbBKmS1IPFXUmaww5UeLfyn0pvWpy1mj7fBp28AFmc4YEqyiPa61YBBJQmNDH96jklmgvO+ajZMqhQZE5OACO/n9URPjyrzP7IsBbb9W36PE+Flp/ofO4mJVnxrpDiIIkJQLjsiBAYHV0RBEj4MXk7AF9Ybd52YEo6ApO87b/jFtOaM6NoVbLdo6ut2GQwI8rOMuvn8ovypZ6dVuvmBYzPWfmNeAClFDL8ZawyGWlObSKzL8dviuQQIZ+un2gb2B9UK4JfFnePcTjU5l9vfM3a1pgukDucFQAdvumOQ6p+39q3jKKWMj8nH1NT5KYcgtCR/31Ejyeb/G02tSV6q0FkAt2U6gk7oghZWgQGls92ye/sE4sfxwV/KmTaCvjt9bcbkjZz64l0UDZOgDx6/OPhJsZkCzldYu4w1l8iQITqhyzrjZRu8+0YnxETmM5GDNlbqxElINA2hV4laA+vmTFSKSMJ/htFkIkzmzeYnm8BH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(38100700002)(66556008)(66946007)(31696002)(86362001)(6916009)(2616005)(186003)(6486002)(4326008)(53546011)(36756003)(31686004)(2906002)(8936002)(26005)(508600001)(6512007)(5660300002)(66476007)(8676002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3nYdUF8Jdi256lPOPxsAofHhw5nbH5bhY9o+fMVETq5LvwAtDqNvcnDTpxYG?=
 =?us-ascii?Q?ADo2ctjgujrKJDMGe9Pl8KMpc/MnAruqLZBcBAVA9vShxjBwcu4C7qBuWaxg?=
 =?us-ascii?Q?wZZIMvxgWKHilQC7O0FR6K/dZNYKc0tqV4B3kkIvFWZxO7CiNrv9Uh4Iu95m?=
 =?us-ascii?Q?urpyQmstb6O31VP6SJr9zLA++LejSNLplYgxLS1XTlTcx8GG3xNZDyTCbF2v?=
 =?us-ascii?Q?bF5Sm7v5nwici5kxfclQxs+v2RRLqCJuEH2RCK49EL07cWmXPFlg23Fjdo6L?=
 =?us-ascii?Q?T7655TNBSOvBdjSlw6oJFMiCgfQ0EVQ6yyIJTPU2fo8tF6rd8KlS9THsNHoH?=
 =?us-ascii?Q?JJXBlBFyJKvDwTBXYEibWmU8Yd90Th3LvmDsGkn/RLO1n6ya61Nab1MWWhc3?=
 =?us-ascii?Q?aZfjl74hZfGwoovLm3gOXkLsH3rNctZLVheoirS8QguiJdhHFOKMP1JkvQHe?=
 =?us-ascii?Q?jwwd0hWj7wn/xltpnrBjKSmpl3ctMV4wdSfV6LG0Hse2mHvlZygx+z3dZdV7?=
 =?us-ascii?Q?t+gXo3mlQjBvbC4tj/FF7Gg05l24UKN86ofO/UstpCubGcE36h8hPGzvsdhv?=
 =?us-ascii?Q?3i0Xv08GtL8v7dHLqI7uf3D8CZmVSFuM4yHGAlR1rYxbx3dcocgmkCkeC7C1?=
 =?us-ascii?Q?V9zR61x54bPJwN+6HQKSgbhnLicOgY8vGPciSVLNZ8kM/+0eN/ECBZqBuA4Y?=
 =?us-ascii?Q?+9btIuhx+0/vZb4WJq57hAacytGcq0MtjzOKDjGBsGVcEisCuGMr1aTk82Hn?=
 =?us-ascii?Q?0RxNMcU9zklvKZqbmQUBnxl8dB4hkUe5n01mdfSaPIz3wRUmt7uOkt7KCeLd?=
 =?us-ascii?Q?BKaeSAr+BSuGF0d+O0UJm65I7jBiIkukOGrURhNKPPxPvKzODNbdVI5Gvaic?=
 =?us-ascii?Q?1+ubnF0d0W8XsBIHx+P/3hYky7M2sleQB8rCc3pJSVHMqHtQxFZQ+GEfdaHC?=
 =?us-ascii?Q?m6hT79Kzophy3uh18hVdNH0iuqGNcwIIDcvR/4hX4DDFmS4jGcem6b5DcXfx?=
 =?us-ascii?Q?xtQdXyE/nKT9FuJlCd4dESYZn21HiQVCU5Te5E3Hq1cy25d+OaUJEJAy3ALf?=
 =?us-ascii?Q?5cIrGhYumCdwEywqJqdjNu1F4pAd6ORB0Jyj2QdEO0VuLkKOSYTIyBTYdBmU?=
 =?us-ascii?Q?kQxqFdJ4mIKGGYse0CU6MxxxRFt6aLe5SNtVRE8zKAXK7oRzcySjaRAoe4tA?=
 =?us-ascii?Q?KkETej8s0u+E0Yjwq7JK5BsaOuWwH4y+mmQv7vKA723h4x452/vzFwmwp5Fr?=
 =?us-ascii?Q?XsfOEH5HUW4gL/LrZdM54BnB9UK6D5AozXGqMLC4ZnbZ29J1h+seOfZnRl89?=
 =?us-ascii?Q?3DOXwJnNotAKscbC0EqgeLUNtBRGtJXZq1L8rY5vGtS5C5hYqsCgU/XxPaev?=
 =?us-ascii?Q?AfsogST8oDrDSLF1mEM8DSz7ZJoecfJScalon+kEZQVPwRmreWkbAolTPwGs?=
 =?us-ascii?Q?1YtX4ueC7XRAXzPHfE1cnm4Fu19yMaWTZxOb2ab9bErjRpjq8xL/iOCwwC8Q?=
 =?us-ascii?Q?2SjFJmh9M55Nuxn9xcUm8YMuvxY51iF+NonVwiuA+3xZFlhJaBmVQIoKSJGs?=
 =?us-ascii?Q?YLX16z8Mnoq/NcdtR5dcNGztBzd84nGUc1ZxxeBqQhUH/K3rnGyTR6hZ8n64?=
 =?us-ascii?Q?DEKbvo3tHcivlEUOPUaDXSc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1373bf14-9435-437d-308d-08d9d9d578d1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 16:21:53.0041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dEJbR9Rxra/p/FPkhGslWRZEOnJLf53rhWKsiMjNRlhe5liehwAo+NHdctngZCvbpppcnk3xSUzrf6zxU2rKmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6127

On 23.09.2021 14:02, Wei Chen wrote:
> VIRTUAL_BUG_ON that is using in phys_to_nid is an empty macro. This
> results in two lines of error-checking code in phys_to_nid are not
> actually working. It also covers up two compilation errors:
> 1. error: =E2=80=98MAX_NUMNODES=E2=80=99 undeclared (first use in this fu=
nction).
>    This is because MAX_NUMNODES is defined in xen/numa.h.
>    But asm/numa.h is a dependent file of xen/numa.h, we can't
>    include xen/numa.h in asm/numa.h. This error has been fixed
>    after we move phys_to_nid to xen/numa.h.

This could easily be taken care of by move MAX_NUMNODES up ahead of
the asm/numa.h inclusion point. And then the change here would become
independent of the rest of the series (and could hence go in early).

> 2. error: wrong type argument to unary exclamation mark.
>    This is becuase, the error-checking code contains !node_data[nid].
>    But node_data is a data structure variable, it's not a pointer.
>=20
> So, in this patch, we use ASSERT in VIRTUAL_BUG_ON to enable the two
> lines of error-checking code.

May I suggest to drop VIRTUAL_BUG_ON() and instead use ASSERT()
directly?

Jan


