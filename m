Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A326D4CBAFF
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 11:06:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282920.481788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiM3-0003lr-3i; Thu, 03 Mar 2022 10:06:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282920.481788; Thu, 03 Mar 2022 10:06:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiM2-0003hR-VU; Thu, 03 Mar 2022 10:06:38 +0000
Received: by outflank-mailman (input) for mailman id 282920;
 Thu, 03 Mar 2022 10:06:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPiM1-0002Fn-02
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 10:06:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c358b94-9ad9-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 11:06:36 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-8DiBiTeRNsOnBDitWgBfww-1; Thu, 03 Mar 2022 11:06:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBAPR04MB7256.eurprd04.prod.outlook.com (2603:10a6:10:1a3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 10:06:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 10:06:33 +0000
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
X-Inumbo-ID: 9c358b94-9ad9-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646301996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rp6zR0202WWrjoyuiwHgeOxRqJmRNX0SFCkPJp8UDMs=;
	b=BrGodMW3v/UOmA/pptgwpGHOr68hqPVxIDbSQakWDDPbCeUZF8fIfb6e2dDufz9KYUmOGZ
	84KgZ+aOaQBdBDDqY6sYAQw/70f8n6+tGBiEKTT9nvAEb5xvm8wlbsTYa9qsKqJl2uGCfO
	WSzeulrofHNuYANAOTZabUKELfB5Isk=
X-MC-Unique: 8DiBiTeRNsOnBDitWgBfww-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bcbsGsINUwnjpexYhsB6kfOFZPzKjy/psg6sGui8MTOkVx/7Gggvc4/M3EJgjt+QbiiqVHUp7GGnTxJLVkEbw4+ilZDoG0mzn4ioj30T1HuePOixBBtkfgkGsQ+CekAar90cFKoLxe0pwlgg6loza1vMb9LFTKuSzlhDH3ljubjEfFuLR4sf46CSF/UU49kIfFyd40j+Jzl80/u69ktcrGYnPfsuMWmLj/XSx4qdlr4d02/YtkaleK6MsnN7nMgrRBh+KKM/SYDIm0a/0RnOQv8wWTaTbrgY4sxA2Lgcnj3qVEH5KsuKthMT0QEEC4CVIdvmF2Qi4lTh+/S2qSt/Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rp6zR0202WWrjoyuiwHgeOxRqJmRNX0SFCkPJp8UDMs=;
 b=UQkA7AkkHXvHbJd9bl9ftagDzlQ6qVK7IjRoUS16KzuCuSTtXhEHpvJmDim8zMjUK/Mfr6oFtpd2dIS/dm+T/6vcgQI1Mx+088/HlMolFZgb5rSol6AaN3pfvdB00tuT6fpHiFs9hx1nEDTyDJxZvM4VFK60NTP1h6aURFfjYXMjYTTacHKEwoU4dnhGsHbhBl8bP3QvM7XQXkHLqmO8hkyfUAWKby32nj89BgkFNegdJVStjcFoEnz3rx0sjaCTTJii7JEVry5BgTWGG75uSz/tM4+GsN5ALqRLkNmHMDarOP32dgX9aT24MsJBrqExKsMagoMzlwJCtIN15Ch0lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <72cb83c2-ba5c-2ac0-a5eb-dc04f6b938b3@suse.com>
Date: Thu, 3 Mar 2022 11:06:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v3 5/7] xz: validate the value before assigning it to an enum
 variable
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <c0d6eedc-6ea2-5445-117c-0ba623692d0f@suse.com>
In-Reply-To: <c0d6eedc-6ea2-5445-117c-0ba623692d0f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0048.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85888903-d64a-4979-dac7-08d9fcfd7ece
X-MS-TrafficTypeDiagnostic: DBAPR04MB7256:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR04MB72561D57267DF4F2F538726CB3049@DBAPR04MB7256.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5Xhpd0da39dg0s48+yAks48BDbJ8npeIiwEm2xeemgDeLQ9JmNtSBlrQzQTZai69Nf4giEklMjYRda+PtGkodbCtD7xql/zjRaOP9PXgLWpb2ttoE9wNEojhOjPomD2LRB8sAzkEwAnW2iT+onUC62NN2JNb2Wk3P76FaPqCvylRnmVFYbbcp+XSQWEBq7J1xN0txi8J+rviYfUhRGI1bqX1dszzjDOIDrUJh3k0crbQzpu/J1mH0TeI1Xtn6c/nvlqBhuiQhFnKjKJ5cxdbhlvphbvbG8Z7+nle78EkYqe6Q9u20YDeXTZyWuG9WRSPE+jJYXflnZmTOn30x7pBsr4+lcDO1jQ/1p3CfTXl2s/GxFgtArxJ0gOZah/MI8hli28vHgPXbRIHZg+ucbEXpSRn/vKeOANFt2tO4sBY8vK7hwil52SI3+DJsn/vux4YR54mY5MjMUvgq/NfHmC1wmi+dkSCvTpwZGBqXWARc4o11IcwSa3kZwQaK0nhDIp9dP/r1TGuyTD7kAgSuCzvjPJ/nxY6Q6IjkhwNzzVzDnWeXNKWb1Qs+Jg4COqW7PvEJI+Iat/zUM95lZawB/LfE//3L+Nyw4AYtN/pg31al97BlgQF3HNpHQPN3/bX+jsXsMnPYxaT4+EERmqNXIqH/+IhhH1fZ04tO7C0AZNl9XmKWg764U/7odYLLiPe3Q1l2QzwGOIn/cM9KrG7714ghcZgDHbeA6tQiOTTLCt+ETNJ+EX3e7SmDg3AilQPT4pidpfynbzp9HdIF8hnYOuA3d9KpJLnHpU/JtvFUa0qKf4GoVsPHJlu+SkxKNeL7ypS0zw89EyWqIPpeU6bXA2Nfw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(5660300002)(15650500001)(26005)(8936002)(508600001)(54906003)(6512007)(6916009)(38100700002)(6506007)(966005)(6486002)(86362001)(83380400001)(2616005)(66556008)(31696002)(4326008)(66476007)(8676002)(316002)(31686004)(2906002)(36756003)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWRjbmhPeTdpS1pOeDYvRFF1SHg5M0tuTkIvR1l6RkEzMTNnOFpzS0QxTGNT?=
 =?utf-8?B?Z3lpd29iSmZrR1IyMTVQTHhpOThYTEY5UElJelQzdGpEQU9IUjBPOWFlMnJR?=
 =?utf-8?B?THdlS1NDWTFJemR3RERtYUEwbS8yaU1zMGdwQXdwVnU2dGJMMTFYU2dJTXBM?=
 =?utf-8?B?am93STM1OVAzNmFIRzU4czY4ZnplRVVQb0JsUmJGZWZ4WmRlNmd6SjhKNTQ0?=
 =?utf-8?B?cTFMMkNJRWdRSUlOYXVnRVdha0xQNEhyWnJHOFowUHVDMU1JZWVQaEdoZGlp?=
 =?utf-8?B?V2ZRL1lZU3RWMjFaSm55Y1pmL014VXdlWkNkWE1OWlZEa3J4L0dzZXhrQ2FL?=
 =?utf-8?B?M1NiWnZXelY1MFkzQllxSHNTNERucHRpVko2bERjdW90TnlNU2ZrYWRPeUF0?=
 =?utf-8?B?ZHE3dzVzdE1IZkxUdmNqV2xWRWJZU1l3RE5NVUZTU0R2WEY5bEFHTHF0NHlQ?=
 =?utf-8?B?b3UvRnp2TnM2NGc1QzdMMHpOYmNSL2p6RlRaNVJSOWltR1U4Yk1jbURvdkxR?=
 =?utf-8?B?a1AweXB4d2lLOEYwUVE1RTZKRGh5QXEybzZtQUs2aE1XVW1GSkRaa0xHT292?=
 =?utf-8?B?YUhscnpwWmpNeDErWUxLMGZzN2doVnRoblpPZ1czcmFnZFlZRmpvS0liR2dS?=
 =?utf-8?B?V09PV0lqZE1xN3dMZngvMkpvR2M2WGZmeXZVSENsb3c0TDlsMGVDTG9mZDl1?=
 =?utf-8?B?UDM2dlhrU0UzZExUaURieXBaQWRrMjJyUklySGJ4N09EQnNWU2NaNlNyMDFF?=
 =?utf-8?B?UVE0SXlhVnBCenlzNVJHcDNLT0U2b0Zhd0ZscDhqeHpIdTlkUnlZcjlkb0ls?=
 =?utf-8?B?TUNuWkRKTk9VMk1GMlpqR1dxRXozU1l2Um1NbnU3VWFqdVFvNkdyMFRkdUtE?=
 =?utf-8?B?UmoxTTAvUEh4anR0eFA4Zm5IVW90Q05WajF1OUc5OUdtakNUbndTL1I2WENx?=
 =?utf-8?B?MmZXc0RKYlJBMVZZLytvMnNjZGFEb1I3TnN2NlV3eU1obklXS0tCMVQzVjRU?=
 =?utf-8?B?N014RUgxNUV5RjF3dm1JaVV4ZE9mYlhlWXEvLy9MNHdwa0NrUm1ORmN0RjBv?=
 =?utf-8?B?V1FIMnFZR1ZQT2VrN3NOUDVwc25LbnJQRlVaVzlSWUo3cGhJdFRtd2dycnRH?=
 =?utf-8?B?N2VpYWZKVUxBV0FtT25Md092enpFYlc1bXgzZUtrVElOZXVFTEJsbUpTeFhP?=
 =?utf-8?B?ZS9DRS9VYTQzdmtIVWo4bCtKd3g3US9mSnlHbXpoa0lUZUpWSUZPcEUvUGRU?=
 =?utf-8?B?bzZEZExWNWVCbjV0Y1I0ODRmSHdIa29EaDUxUHlKUUNWWmNqdm9PSWY1ZlBq?=
 =?utf-8?B?VDNwYWtpYjFvYUUyZ29ZUmFUNmthZCt6UjE4ZEhJTnVTUGNCcTdKS0F5Z3RK?=
 =?utf-8?B?ZEdmRzhoR0hnank3Y2p6bmFBdlZNS3VTZDZQLzI5NWkvWE1Xby9zVjNqZWlk?=
 =?utf-8?B?bXJUWlhtRStQN2dyelRWTDNqUVIvZzNkNVJPQ0pYYWY1SXgxVGkvaU1vc09T?=
 =?utf-8?B?ajJDK21wekxJNzkwZDRTQm1OS094bHJrMURUSUR0YUZCS1lPeE1BNHJWbUlq?=
 =?utf-8?B?bEtZcGtCbFVMVkFobmd5K0x5VW9IVTlxRldaLy9BYW1zQWhTbld6dXdybzE1?=
 =?utf-8?B?UE9paFEvQklCN3h4b2o0V2ZPN0hzcDQzSUx5OW5rK2NNWVRjRXNFSDRjL05U?=
 =?utf-8?B?clgxSlVEQnI5bEFOclc0UTVLcTFZWllSNm5RbEFES28vMnhyNGtNNWJJRDcw?=
 =?utf-8?B?Q0JoU1paTzJONmtjSm53aE5nZ0paWm9QQ0VHTnF2YzkzRFF1Rzl1ZDkwNGlL?=
 =?utf-8?B?SWZ4eDNIY0RCbE40U2dqY0l4UzgzNWJISXJNUzl1TWhzUHJtTklZTkFpSEUy?=
 =?utf-8?B?Smc4U0R4eURDdjROQ1BDQUpZM3NaSGpzQ1NwRWJpN3R5bE10RU5idjdCVEJQ?=
 =?utf-8?B?T3N6UEh2Qk9FSmxDbkRVWEpwVEpMeEh4c29rdUZ5RGtTNmF0aXlmUE5sUlk5?=
 =?utf-8?B?TEYxYnZ3ZjZZNmpHMzdTZ3hFZVFZUndxRzFXOUttWnI2ZmhuMXFvNTl0SUJl?=
 =?utf-8?B?WlRvUjBsWGR0aE1EN1hjRndwNGdMMzZ6cENab0VsT2tSL3NEQUV4c0xCS1l6?=
 =?utf-8?B?ejdzbmNyaUZHTDVnUDRlV3dmSXRWY2VzeG5DNVR4RVF5MDNKM251RW5zRlpY?=
 =?utf-8?Q?PcojXPz5ARD92/xhWmRdy2Y=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85888903-d64a-4979-dac7-08d9fcfd7ece
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 10:06:33.5453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5s8C20y/V//BlaHDKEWpdM7EpW+IaiD20CrndJpEMeB9ADET1WVStfB9TTOoL/NhhqwXBl+mD8ZKCkb2Tvytlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7256

From: Lasse Collin <lasse.collin@tukaani.org>

This might matter, for example, if the underlying type of enum xz_check
was a signed char. In such a case the validation wouldn't have caught an
unsupported header. I don't know if this problem can occur in the kernel
on any arch but it's still good to fix it because some people might copy
the XZ code to their own projects from Linux instead of the upstream
XZ Embedded repository.

This change may increase the code size by a few bytes. An alternative
would have been to use an unsigned int instead of enum xz_check but
using an enumeration looks cleaner.

Link: https://lore.kernel.org/r/20211010213145.17462-3-xiang@kernel.org
Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
[Linux commit: 4f8d7abaa413c34da9d751289849dbfb7c977d05]
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
v2: Retain one more S-o-b.

--- a/xen/common/xz/dec_stream.c
+++ b/xen/common/xz/dec_stream.c
@@ -402,12 +402,12 @@ static enum xz_ret __init dec_stream_hea
 	 * we will accept other check types too, but then the check won't
 	 * be verified and a warning (XZ_UNSUPPORTED_CHECK) will be given.
 	 */
+	if (s->temp.buf[HEADER_MAGIC_SIZE + 1] > XZ_CHECK_MAX)
+		return XZ_OPTIONS_ERROR;
+
 	s->check_type = s->temp.buf[HEADER_MAGIC_SIZE + 1];
 
 #ifdef XZ_DEC_ANY_CHECK
-	if (s->check_type > XZ_CHECK_MAX)
-		return XZ_OPTIONS_ERROR;
-
 	if (s->check_type > XZ_CHECK_CRC32)
 		return XZ_UNSUPPORTED_CHECK;
 #else


