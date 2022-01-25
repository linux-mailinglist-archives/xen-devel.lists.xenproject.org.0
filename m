Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E5F49B728
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 16:04:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260454.449950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCNND-0004MV-25; Tue, 25 Jan 2022 15:04:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260454.449950; Tue, 25 Jan 2022 15:04:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCNNC-0004Kf-V4; Tue, 25 Jan 2022 15:04:42 +0000
Received: by outflank-mailman (input) for mailman id 260454;
 Tue, 25 Jan 2022 15:04:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCNNB-0004KZ-FU
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 15:04:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ecec620-7df0-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 16:04:40 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-MLu5SyE6Ob2GRG_eDzjzEQ-1; Tue, 25 Jan 2022 16:04:39 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by DB9PR04MB8377.eurprd04.prod.outlook.com (2603:10a6:10:25c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Tue, 25 Jan
 2022 15:04:37 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607%4]) with mapi id 15.20.4909.019; Tue, 25 Jan 2022
 15:04:37 +0000
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
X-Inumbo-ID: 1ecec620-7df0-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643123080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NdqjO/CXI/utlIN/iHvMIu+ruyBHT+TUMH9zRVqBGFg=;
	b=dD3kutu2CbUEKFn74o/VBsajbBPeVduel8tcSJ9kmHGec0s0TtqK2o8maC4IK+tdwNevxV
	C3zIyxvwPUgOEH3zm6s2daxcMaVmGkn1yTQOXIMRL6Wozgjuqo29R5KmxLF274bwC2zwx8
	CO+j3DHq69nJ4P9pGuKGja/5dYRBoYo=
X-MC-Unique: MLu5SyE6Ob2GRG_eDzjzEQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LoWbn3IfnS+NjFdUOdKnZ2fEGA+5hbNj8WxzuSWLMM7Fa0axHpmkkpGUb0i1PQDnlQyUYpYzAbbmWtpasYXyUt6Mr5qWQt67iCQzHV+2XTbCmvJyILezJj5kjLd8RojZKb9AbOax529nW+QJQoY4Ak5/Ud2ewZDABUJoKSn6BTcS1HTreP4P76U+AZQjoqHP5DCi9NdbcsFKUaeZyTla7IYRIlORhyCicZhTjZ8LjKfewBMb0OZD5xIla85uq8qb3kLGnFJMc8D9MBQ3rDHMD06/KmsWxBTqtsffe3LKVm2GSySWrq9zXoekqGX3L7DZluB/8oSJrQJ/Xl1FPJtDgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNtqXJwOJdkIZGOtN7xRp7d0DmgT8YBuQ+out6f5hy8=;
 b=Xj5uiVp057RgF91G6e+TfYEjYY+NkWubPXnmoXnxgdlBlSztbPF5i4+EWduXrferghjmrdLBr4J4F6F+LliTBFfXdPRstajsZ5iQZvLlC7rf79RgspsdkuoJHJDpKDNKiOY8bg5KZwBaxnrvo21gxWT5ugXBlDoMZ9degiX3W2aiSIzO4J8S+3LQ+xG7dC73cpM+OKRXsGPouhxLbaycKOxg7MnSjg/wm3RIHyMtA4FHRqJoLM/7h3fZWYXDEGlt6OL9GhssDz1QwZbL7/ZLlxKIegIR8kcFs1B7MnzWPb9CbegegUZn1h321TvrNGjHbDr7fZug6sev0QqAw+m4MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1903aa17-9820-cadf-1aaa-27e1ed616b69@suse.com>
Date: Tue, 25 Jan 2022 16:04:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 03/11] libx86: introduce helper to fetch msr entry
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20220125144935.44394-1-roger.pau@citrix.com>
 <20220125144935.44394-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220125144935.44394-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P191CA0085.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::26) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 049fd3b4-0580-42bd-eb29-08d9e0140161
X-MS-TrafficTypeDiagnostic: DB9PR04MB8377:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB8377866F887D6F36083EFFC1B35F9@DB9PR04MB8377.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AoH1CSQp3/DfsrJj3QEKcc8sRoNLMe9zjTOiYkgcVLkscHICriSq3Vzou2uZd6zRGxt5g2y/W6YYi0jrTK51AYd6SuyOD8xjXGphf+mUm+oIvsl9uRdU/7dKkcWC/+W2p5edSnoHgffMMzxGp30diaav4Xwdd61iCTNYQalLpS7/rWPHXChWOKNonZH23x+02ViBHdfGD3Txo69/iAoUtDBZSqXJfeng+VwsMdlADj2t+9TX0BhzEcMobD+Tr3JXt1uK6pwky7opWFg6QbmbPk/rtLxbOLLHFPattnKRZHQwFk/rgCc2GJeNtNBO9siSBMv7n0LxOH8UXwyfGXkxLtIer9YVJAI67wDAnRfrA0Kd/H0/0C3DUQCFpzzYPBZDNfQMdQVdn+6muUhDCp5fnF++r/yYGVZMRj57r9K03qkUFJOjugfcU8SJJ+vGzkWXwNOlP8TIALSiqUPAzGeypvOzIOq7MdyBLL+qMn6TFj6rSbbNdR2nrVR00JrHm2zFAQSlBDD90ohyNJ+pjTC4S2RHSWIabcDQIJNeok4PnFxIBxeHPIZqtuPNLpLrbggj+JW9vQeD+p1oAhDn+tYFcu8EVByMpuXqWrazUp+kPhpudWYz9L53evKI4e+yHA3Dc9Sjkzj3DtMAMqI7yS8HglM55hqO4Athf7zkh5Cl2ov3hjMHHh1f7SVjlXveS2Lsg/lNrLk/BbD1TTKErDoz6J924yw9lr5yQxBch1Jb4UtjWASO/6eQ2A1/1ENnE75h
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4744005)(2906002)(6512007)(53546011)(31686004)(86362001)(31696002)(66476007)(8676002)(186003)(6506007)(66946007)(83380400001)(316002)(66556008)(8936002)(5660300002)(54906003)(2616005)(4326008)(38100700002)(26005)(6486002)(508600001)(6916009)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uGgOoLmiD6Px+oxqDSBmsipeETMbxK/dYekBpxbKNXfP7yz8NP2vpM7g6oay?=
 =?us-ascii?Q?6OUofGoVNN7z7w+McDWQJcLyMiXrThBrj/kd9oypUja4ww8+SqCVE8JJ6d7d?=
 =?us-ascii?Q?volBPDUtym8zMwkKc9sLHzF981GUoa9uTK+QrR5pBlx13HbZQCMmpLUA75qG?=
 =?us-ascii?Q?SsXjBV9EVjfDqBp9kOdVas8tCAnRN1N9AoZYQx6O+Pdxna5b46h1dpdwrXLG?=
 =?us-ascii?Q?DaoEnP+jkyOxaQeMlQqVx7AsoKCBXnrRpLnYgIMZM3wlgGmf5xiIef1rqoXc?=
 =?us-ascii?Q?qofMVGiFgFJugB8IL3RuO+yipsaDd1h3F/+NRQXafWoSbrqQpmCik8FNC5Eh?=
 =?us-ascii?Q?A5zL1tCHJJzcYJ2Z8X14uEunP3QRAf7HFbETSjBkq/R9Wyt69YrPZoeG7+oj?=
 =?us-ascii?Q?5bC8EOwdBZ8WmUKbeeaL/kTdAUjgmTk3FGVBiNpZYFHIcW0yk4+qFWbQDSQf?=
 =?us-ascii?Q?XxzamCwWao8gJVNcQs+IuTGseMCF8isd4bhX+IwxsvyesxESfto+9u6gaD5N?=
 =?us-ascii?Q?bPuXUM+bkIHFpCFaEFiNCkYtE3ZK/trFugxCOn88YVa2xuGyjtZgJSdVLlP0?=
 =?us-ascii?Q?rXi5H5VOve9GHaWMsyaeEY4Pt0dbkRqAp2WwMesKF4VYvb8QvN+y42V0308q?=
 =?us-ascii?Q?xcn2EXFYB3Njn9G4SCNzdQWc3SDIGijSkR+wDpLP94q16hlSd0cIQvegBUe6?=
 =?us-ascii?Q?umhivpUIItlRMbq+claKCzx9vidfQkWRO5Sztscb7FJkQTpWO7GJjN5SCmGB?=
 =?us-ascii?Q?zLwftmZQCIc3VSpBfnQOAvEMqwxG3Zfan0IlyhAcQxxn8asDa5cSVVeT4ajs?=
 =?us-ascii?Q?4w12fx8ccdyUTVaCVs2CpVhEW7bSQ/WI1EXehZtQ7Z5og1oxgcVznAEBEYZP?=
 =?us-ascii?Q?zcoa3nKVsYfg2BNcffqLBWymFqsd6XIdjAdAmGUJag9KZIw13CodGCQcdVkM?=
 =?us-ascii?Q?vJt+A82TAlrYn5UDTuJmEm8lgVsjGgvQwjIt1m61VuXxNSlNz6sAyYrNeN8t?=
 =?us-ascii?Q?yg27/suDCl6lQGQDZLItO85bUSd25dHHKSbjK977tyt8WFiMTM+BJI1Yd1VI?=
 =?us-ascii?Q?BqDzb4YXnuwJNtvQ2ZEU/9YKIc7FvOC/kbDyRiWnl5KmF7K/6iil3RdX0xwk?=
 =?us-ascii?Q?7N2MemWu7aDyHBJkGvBuQAFjKGA0K1RBgSvYoWvpuIzufaiFGooAw2vz+27+?=
 =?us-ascii?Q?XndamUQPmFVRPUS5NcBn0FMAHyHgc8b5IOfplNTosZnv1WpaWkhwxuTklmpm?=
 =?us-ascii?Q?NKZjjg/YNQ+zpMhOq6/FCUGdi8saRelqXVbOIQ1J2Kx+/eU1bcQ66G31Wo2h?=
 =?us-ascii?Q?1TLBwb3sRxCLcl+qvI7JMbU+s3jd3QFLVddyc66UI3O8hHu5j4I7Z6KN16bc?=
 =?us-ascii?Q?/XMc0cJ+gNJu2XtpUH8eumn6VGbH/NCE2wltESrWzw1xM9cOL0urlPvQCdgx?=
 =?us-ascii?Q?KhRvCsKeGm6KFX0l2gtE1aOcN9tg5LazldqMKNOCJsyYZ+Qw1yJwsemF8u5W?=
 =?us-ascii?Q?W6io8Ya0q25e+Xvv/osmaV1QyxKdpjweDSV85VDzRYK1ALZOEfAocITo+mm6?=
 =?us-ascii?Q?GclTc5dO+7Gr/iImVHeIvmyGXa8T4xLmg2a+Pc2U6t0P1hvIjrmymi40xSmq?=
 =?us-ascii?Q?HOJkpSjDa9NB2tOxyxn4Zig=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 049fd3b4-0580-42bd-eb29-08d9e0140161
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 15:04:37.7579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +jhm0Nw+tBybNqTargwqfhwMd9Xf0O38rxTKlM46LBKH71U43SlhpDRoGnj7AL/hwxgVSsPkQLoXIkIgxG0aNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8377

On 25.01.2022 15:49, Roger Pau Monne wrote:
> Use such helper in order to replace the code in
> x86_msr_copy_from_buffer. Note the introduced helper should not be
> directly called and instead x86_msr_get_entry should be used that will
> properly deal with const and non-const inputs.
>=20
> Note this requires making the raw fields uint64_t so that it can
> accommodate the maximum size of MSRs values, and in turn removing the
> truncation tests.
>=20
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


