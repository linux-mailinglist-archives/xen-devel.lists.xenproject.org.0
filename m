Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD22509C6E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 11:39:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309973.526523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhTHh-0005Kc-EK; Thu, 21 Apr 2022 09:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309973.526523; Thu, 21 Apr 2022 09:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhTHh-0005Ig-Ah; Thu, 21 Apr 2022 09:39:33 +0000
Received: by outflank-mailman (input) for mailman id 309973;
 Thu, 21 Apr 2022 09:39:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhTHf-0005Ia-KF
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 09:39:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f17f2af4-c156-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 11:39:30 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2052.outbound.protection.outlook.com [104.47.5.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-ysm3tfn-Opu5I8pZRFt2nw-1; Thu, 21 Apr 2022 11:39:29 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR0401MB2573.eurprd04.prod.outlook.com (2603:10a6:800:4f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 09:39:27 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 09:39:27 +0000
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
X-Inumbo-ID: f17f2af4-c156-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650533970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y4Qkx2U3uVXXFRRtspSsIMXdrA4QjjRbrU8X/5Qe4CM=;
	b=WJGLSdSS64KJCDoam/Lw809Wj8TAthqSZd7T/FF2LTt4NLnrUIku6HU/JyCbpM5DOdJnjh
	PZU2njInwojrOtxZ7tBYAqRa/LyFJ4QQAWSjd5AwfEcDgYPqwJDEKHGgiIm8MQkXCyOIRZ
	wyoOnO1NcphDdARktcrt3E4EbuaUWWg=
X-MC-Unique: ysm3tfn-Opu5I8pZRFt2nw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DoaLt7p+a2kkxjs/eTfcrJO2T+M+RqkR+ssLdx9ODK2YlzzKx+hAI8Nl+xtR6xr/V7QiSeIOYjvr6v/XD+TBSJDi9tbvjR7z45+uCPZofU1hA8y0IJNOixUK8nGSHDirASzPi4mZ8y1rWPiG6jjLKvWtM/3WiCAdhXhq6nWVTFjYBLQiHdSH/AzmLjfiVxo+3dtr+fjQckYfbEIchkc8i00CDOJdCVFAF0hu99NUL/W79+fJmSXYTo4BKjBv5txTmfFh6hJkPEWNClsa80RIsS0C72iN5ISd6mql6QucWmOy6+miZuYiynIlLyOcHXvEso9yWjcouM53TE3wu6buNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFaAOGw15ZhpdmoNFHik/UtDGCLFuF8sa/fki2a9rP4=;
 b=EbfbgyAEeCyKZF7Taqeeaat/MPhA/rnsp8SdbgR4YX+4RTdqOKe1QIzEmbq5hLPSo7O2LF65St8voA6x8VWK1PghMlL+drUd+XW2/q2GUPrE5HuCLRyECMYZt6dHYejc7jSsH4/F+YFmOOn4w/vqyMc0VtUe1vWAQhns/gqsVgjb73ngG1x0p9YEwhjrKHzvqeqmRKJichgBzcjhSBvFYLSU162gDNb86WLQq4XstuVKug/b/nbXaiSUSmALASgQZMKKq815xHCNzsW5uGB8wb68M4mX+3hNFSkmMyNi5f7h6kVzyy4LmqbWXUIeGDQLJIEc7cVUraGwl4HE2XUf2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c5d18996-3ea6-8316-35cd-6490d4278183@suse.com>
Date: Thu, 21 Apr 2022 11:39:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 2/3] amd/msr: allow passthrough of VIRT_SPEC_CTRL for
 HVM guests
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220331092717.9023-1-roger.pau@citrix.com>
 <20220331092717.9023-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220331092717.9023-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9P194CA0010.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::10) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b4c990f-8358-426e-5ec7-08da237ad364
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2573:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB25732448A3CA23CB1C0CD3DFB3F49@VI1PR0401MB2573.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5deNjyjcRkVUhzcdmre4CGoRndME5yEBg5IEBeyEu0jat568cImyVIyLxZVah+HMtme5PIG6KfBplhvL4uxAuCTL8nxEuLV0hcXt6PgIvXjK03egiR7u68vzfOHFPziUyxaZG0mW5g/w796OhuHUV+Hb50YhOKUSedq3Em8+/6glLIpujx8VG7+OeIe6YwfJCkYKB/UEFASDlXF3Q+yauMEcHy8hhrX/3c46e9L5cc3LvwC/QwUOxNbbKBJWOjiM1w+ungyQNqzcX3ebCGzN+pNrMZsJa7tZsBqNI1vwlpRNCn4hXTsbcGDMHDVvPSi4YUe0aO2yBJ1COmxM2OIi5el/zrWmd0OEa2hybCUEXeAO8krT1k8EnN3NLb1cMZHIy4qoRonwewfh3iVd4lMwKele9dVdhqqvd7U/lICxUXryHrqqZqp34nypA7KUTLlrUDqGhk/SnRx51cSCuwz06m+VVxW4qw0sTQxcdPNuLjN36AExXMokIGhCfi63S7Dr9PPVs2oGOpKbzaxca1UE8aXfxiX8iPqcDe6lbBVn8wglYEGLsMKdUAilf9JmuX1yJcUNTAv/DXjaaExY6HfQZ1rl7nFdxWOkSJZRGWQ8wMXc1p2kR3bubxcKjWSa4FlC/7aqr2/GhpjssywZwolHyLRQQUXSXki8Yb2ELvNbPgrNrdFMySf9IjDvYbcNJ5fhER/zV6M3tbAXPrFR9rGSaucegSPMEq99PPIlZV+xn7F6AZ3Vo0lfHJbyGTvfd0oR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(2906002)(5660300002)(54906003)(86362001)(8936002)(83380400001)(316002)(6916009)(4744005)(31696002)(6506007)(66946007)(31686004)(36756003)(6512007)(2616005)(508600001)(53546011)(26005)(8676002)(6486002)(186003)(4326008)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KiqbUXKy7Aveneubetdb2taHJj+n3w19IvP6qk6MHwsqCxKTsi0GP9RNvceB?=
 =?us-ascii?Q?7I5Bk0fgxs4TZ13hc8MANov4b948SMwSiN9zI4v7uNYCG0aLyqfI87OuOX45?=
 =?us-ascii?Q?+cbeZNhwcrXbTMCEY+/HHo7z9/yS20AqE38d0lXlBMvoz+3hbxpPrO1goUIV?=
 =?us-ascii?Q?qMPNCAIAz/BLiYyNfXjmZChtbuYCs8qn8fWa4MAYEx8K4aQoMsPh8cVn7FKH?=
 =?us-ascii?Q?RU9Dv0pIMp9veSggFrrWG81BEw2TRuNabhztacoiYpMM/tRcgzKVWN+GNoEa?=
 =?us-ascii?Q?NX2oxnhtwesBYOTRoHoaUO1TejnZKBcqYWcC1dFiX4ehwythYl2cWq/9xCSB?=
 =?us-ascii?Q?gWoSHzvZ3syLjMD3vm2LyTStyc7YXfACK0+H4Yyu+pAU1q0U16vr6p6qdrgE?=
 =?us-ascii?Q?hGfa1CnIK/X0BkUwNOdF81WgWs5dcxEJzhzVPK7dxagIyT9inwQf+DArKTIB?=
 =?us-ascii?Q?XroEWaVcMCYyZ5X1H95VdiMvYyJKYLi2WZbajeU5drad7hrxpIQ+rIb9KOp8?=
 =?us-ascii?Q?sHIfl/v5lQKBsiCiCiMQFZDso2Sd26F8Wh+cZ2wWTRddWhNB1pwTTAGxdlus?=
 =?us-ascii?Q?yZB2aCWlBR2ytQtY48zyZZU0Lrj6r3HAFE+7K9YxoT7Xi1IRRs6DYTxGNfCX?=
 =?us-ascii?Q?+WJVjGv7RJHkIuZVF4rNx1llpIoRNkyuvA0g7iAZJ2DJGJcg3qiiMiq1BJm9?=
 =?us-ascii?Q?evbtJMuU7VuFER7CXv+ZfkegdkA0JooNpQEzD0LOgR27ct9JzC618L7rM4Ph?=
 =?us-ascii?Q?MTU8JuQr7Qi3uHz2OBqnx1obEIx1iTDQUJ0PBiGnuA9EXvkhh6ga0N2UNMrs?=
 =?us-ascii?Q?meev3yzbYrxXyDfj8AosEbdZJjGVJ4eIZSJTJpcGWtb3u38RNtXb/lC1e8fR?=
 =?us-ascii?Q?T1J5Zo8St2Ru+V1L2SR+8Kyl9gBzchQ83xmJGNV8IFQUP5lYJWy49UdwwDcd?=
 =?us-ascii?Q?Bqo+22AhSAftWjzMNsG3gyfIyTuN1UkyN8DNmScDNyU0sSitbXyEJ0OZLuKf?=
 =?us-ascii?Q?xQSdOBsSeG921o6TfHTFUwbuXSeuU0T7SEJaQH7Fbdwb6fqX0hhy0dvWLV1t?=
 =?us-ascii?Q?PgS14GcrgcUlpYC7yo0ibSuppsSgPk+MmVt0WNKwzhhHH721cOSMBHAZqJtF?=
 =?us-ascii?Q?5DbJEtNpXLJUrFQULaA43nEmv4Xc+l1S6LBKpMofbnXmWoqN4AJSrErhLvsP?=
 =?us-ascii?Q?xPxDGoQ+h2N5QqiLMRbqCoe5g2bqty21NqgE9b+IxS7/hjgANJ+7NUXlPSt9?=
 =?us-ascii?Q?foT1hXdRUcj72Mx79zmKzG5wRipkFo7j8fv870Qq1vnK9wuVWWTCShdIrOk3?=
 =?us-ascii?Q?ywJsVp5HYPfdbUlQuQUGcSqp1iHxUSY+NLyU7jk9pY5p/cSQrG39PMKp3lcE?=
 =?us-ascii?Q?P1ifpBXB5KLmx4kC9QhpWI7UrwmPYle6uiDXv6KOZuAY1jtV5FEUr58BWAt6?=
 =?us-ascii?Q?Tqp4l83qxt6oNJKnthA6vHWTxDPuIDOzXplbG9qWSGUW4dKPuwjIseOQGt3b?=
 =?us-ascii?Q?b7kaPOR+5Z72G3+YV34l/bqQRDJBgaT2YDQOsth1TTxwCO5uwTibuJpE5R//?=
 =?us-ascii?Q?SuvRcfB9Q9XVmXeQkofDGh0yf+2EUVuNBIdjxa1RULnxtVine+Mo7ds31zpY?=
 =?us-ascii?Q?yJyiFbk7vkIooWQcEdkLWyhqIFTylRGqKZiWgqhlznmmZADO1kXKHatuXTrg?=
 =?us-ascii?Q?ElnlnYAvYK+lpIGDr0z5pW8qbD8BSR9WFYYLZJSdSCkZhz7IIIH8Kl/Y5E3t?=
 =?us-ascii?Q?Tj1hXLzcAQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b4c990f-8358-426e-5ec7-08da237ad364
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 09:39:27.0430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMke8k8cjF8txNcNCZEm85GzYnNiXLO0H5kH3vPCurTr79ys5VC1hJFyOxr14r+XUqm+VrL/o1m3UhRIi/2azQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2573

On 31.03.2022 11:27, Roger Pau Monne wrote:
> Allow HVM guests untrapped access to MSR_VIRT_SPEC_CTRL if the
> hardware has support for it. This requires adding logic in the
> vm{entry,exit} paths for SVM in order to context switch between the
> hypervisor value and the guest one. The added handlers for context
> switch will also be used for the legacy SSBD support.
>=20
> Introduce a new synthetic feature leaf (X86_FEATURE_VIRT_SC_MSR_HVM)
> to signal whether VIRT_SPEC_CTRL needs to be handled on guest
> vm{entry,exit}.
>=20
> This patch changes the annotation 's' to 'S' because it introduces
> support to expose VIRT_SSBD to guests by default when the host
> (virtual) hardware also supports it.
>=20
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


