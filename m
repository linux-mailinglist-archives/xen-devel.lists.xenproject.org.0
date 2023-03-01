Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E04306A6E1C
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 15:15:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504075.776587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXNF9-0003IX-T6; Wed, 01 Mar 2023 14:15:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504075.776587; Wed, 01 Mar 2023 14:15:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXNF9-0003FS-QI; Wed, 01 Mar 2023 14:15:43 +0000
Received: by outflank-mailman (input) for mailman id 504075;
 Wed, 01 Mar 2023 14:15:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Y5i=6Z=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pXNF8-0003FK-Ih
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 14:15:42 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20617.outbound.protection.outlook.com
 [2a01:111:f400:fe16::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ca4a06a-b83b-11ed-96a6-2f268f93b82a;
 Wed, 01 Mar 2023 15:15:42 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8382.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Wed, 1 Mar
 2023 14:15:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Wed, 1 Mar 2023
 14:15:40 +0000
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
X-Inumbo-ID: 8ca4a06a-b83b-11ed-96a6-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bWCiyNmQ9iS6K07kyD3IwUjZxxuAhYUUtk8ofF1N1T/qfZBzLGVCdy8qWiKaAV6+QgxDZYh+cElOXI36MwvwnFN3VbNpzygeqOJKSx8574MgTTyU3NELaEaQNl05LIOAHrtNcHvcTuOU6AESvgOyGK5/dOU6pFYcMfU5heakuBupehPm1Iz8o5zwYxogyjTp/EXZfWO94TdGpqEezywIKx8C/WpQ/EkfOzX8kP9wBVDiENo+JPwijOrArvojdwSqtmZtdLydUhNmhMan7Ojhc2XdWsmpHa0h8grpv9F+A+Vg3kmpCqvIq3xXknjkBFLL/7hCqO4SRhGwG5x7VlbDOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=728/hgui0RaEJae0P1LzRmUwVm9vJUkWwKZhGA9zlK8=;
 b=Tfkn3BG7i2zCXHShr3mKkvET5aWIBRpQ2kV735TrD0SbY+FZRNNG5h4BGdaHLUF04PEVSJIeZzGuzFmVi4VqQVn+samnz96IhMYkapBiGFaRGrl371GCLNKxI2zGnvJWeOY6EhHMSGKrucP07tcTLNzhzAVYHNXX9QSZ/6u8dqsCSDLQRXRwO2LiS3pypqOE4D4RfjXoiYkS+1fOZgaeo66cuoeKd7+zgnkW4i4Kax4CxroIKryZfLyR32Y3b9Hbd+Un5dades30nUz9wCfqaw3xDSm0y1mvozbv6D54ItwdPpkAgNDgoiZtf1JdHqeNRRTowEkWZ+lKSiLou3Mqlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=728/hgui0RaEJae0P1LzRmUwVm9vJUkWwKZhGA9zlK8=;
 b=QRU6Dt3ezac23RkNbdC7HUyPj1SAkpfP3lHdbWhoATwVfs1bsWZM/FHBXCTDzBE5q31Ply0Au4Qiw8SWX6lDALF8z7+HND/bssjDJyp15bdwrhZmyiJunJ1HPkeeNh/JKkGcuv2j1z0yPfFdr6YB4uAXxIQNs2b/YG6X78KfRLZEKKIbinDllxEDYD66bd6sXDzAU5vIugHIkwpiN7iZ68WPWtA+iZZx9baBhE2tkpd9+vizREKzrjT7enNa8BYWuzx7LaCDW3S/o2ieGBwLCxfY5j0QuUSYexnJ1mmziBtKgHUnXdSv1TzrY1DjjBmEtESMGwQ4DYUnXj9Te07Q6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <21838915-d33d-7c86-85b5-6d6aa00a2eb0@suse.com>
Date: Wed, 1 Mar 2023 15:15:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH v2 3/4] x86/pv-shim: don't even allow enabling GRANT_TABLE
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <da5f5bac-6d5d-092d-d872-f1120dcd2661@suse.com>
In-Reply-To: <da5f5bac-6d5d-092d-d872-f1120dcd2661@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8382:EE_
X-MS-Office365-Filtering-Correlation-Id: f38ebb1e-4d46-4e79-3f39-08db1a5f6fad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8PNnoF7arbV9SckwllkXyozUmUa/pJxPodY0/8HBzxBzBj38j1FBXYQ421NJQbJIl3oU7mOw8nthqugWAMzgJcIKlRkRkYORCJ//kHGAouILAOGVwdF5vG/HYoDGy6OHwZzyo+ARyJ2vvY1KqmdMxotvDhn93gqwf+lavFdi2Qr9HUSOTOGECRRqRDU7itwFfjpTObOk53BtzzrlYTwyzD8flN/0ufSZQm0AtTa1rlXYIAYgpEetMilTT2PSlYSefzaeSWOkV2JrVoTyvVPv0U7fPtkncR9qGnzExHEGfZFkjaBso/iKpgBKohz0PBs8gU0vJBGOhGrC6KsrfAMWFimlo7R/KHn3tLl5uIijCYda/Qx8STh+VtuE4ElHO5FMAfpJz5HU7IlPVmQM8zKaMiZORsV2W1juFOOsV5KBa7CS2vb1LrGDkLrwlQovsS6WAlbqQsGddtXGAczLBt5dr3ihIN+kZGuinZeNw8Gp0g6vAslFhjhZ5FaPZQyynQJFkHtTvOdlvT7RyU+1YTpRKofEtC+MB2BQQoC5MC3Vdg+1GlL6S2MU9eQ6tHpWx3rsW6DOkhC+SMFKjL5ovyC+1YUrf10VRGQZwjBKqxrEjMEnF20kmPw/MH0wPH5o0Rx5UaVtKkajR/aDaNYgxt4G8tgvGI0JLdn6oJe5TXtJEIZrQbBRY1FOr56MyEc7t0RfQKZSU5P9+mSQUxDQfP6KrsJ59QXain4yIM2vsEWd0Mw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199018)(31686004)(36756003)(478600001)(316002)(54906003)(66476007)(4326008)(38100700002)(6916009)(8676002)(6506007)(2616005)(6512007)(186003)(26005)(6486002)(5660300002)(31696002)(66946007)(66556008)(4744005)(41300700001)(8936002)(2906002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVVub1oxYjhvbUYySHFyd2ZtRUNEaHNCVW1qaVhXLzMwWnJPaXhRd2w3a3BB?=
 =?utf-8?B?aTlpOXdSTi85clQxSkpQcXU1RHpCb1Jpa2x6SGYweHB5TkphRWl1dldvQU9k?=
 =?utf-8?B?ZUs5dGJoN0RramRVQUlBR29tZFV6TEk0TVB4NGxOd0w4VTZrUHljeXVLNWI5?=
 =?utf-8?B?L3Z2UWdLVUdRVlpTbXVaVU80aE45U1RZbkZtbDh5RTQxcVg1RkNzdFFQZ0hY?=
 =?utf-8?B?Szc4RG5nUmRLTGhjdGhvaFVUejF3WkxGcjEwMzAxMVVnWXNXMlZRUk1UTzZo?=
 =?utf-8?B?a3A3M29rZUljS3hPbFEyN0o1TGpoRVB1azQ0VkZFdU5qSGRpOEdaaGc3SU9I?=
 =?utf-8?B?YUc2b1ZkVzdjV1BPUE5VcEluOW1BeWRjeVk0cW9uY0dXOXA2TUpGSWJ1bDls?=
 =?utf-8?B?MVZLM1VGQ2crdjRRUFZoelhNUlAyTm1FUVFjeDhPZTE4QlY2L1hTa3RIVzJZ?=
 =?utf-8?B?Qm93VmZVTVJ1NFpCTlJHbjduR1ROVjc3WERlUVlqS3FzNy8zMC9WNWUrN3Y3?=
 =?utf-8?B?bmxlQ1NxaFo3NjBFeTQ4VFNoK09lYmFBL2hoV0xpTjlIRXJhRUt4Nnl2eWZa?=
 =?utf-8?B?aTMxQTUvTU10NDR0MjFELzcydnpkNTJOeEwxelZJVVpLMmFBbUExS3d6YWx5?=
 =?utf-8?B?MUN6aGc4ZHEwUWNuQ3NyZk8zRkl2T2FVeDc5aytJWDQ3eU1DUWZ1UWJVa0ND?=
 =?utf-8?B?T2sxU1BITFRWZjJWN25vVlo2QVJWd1h5UDAxcW90Y2dqQjh2T2hWcWJkaTZU?=
 =?utf-8?B?ZE5lNlgrWDVSdi8wU3hjWERuOFBHUVMrNStHUW9Fakt3UG9iMEFZdHJmdDFC?=
 =?utf-8?B?eDNvVXdYMFFTcnowQ3IvaENZMm9QdzFKSjFMMTFJbWNOaTFFSjdLeDJwL0tm?=
 =?utf-8?B?U3RqMU4wQVdwb3o0VEhaNnVQaXREMXU0TlpoWTRsdlZFM2FBdmwwSXdiYS85?=
 =?utf-8?B?QjRiVW96OXI5Ym9yWVhiT1hDWWxFTVl1clVTaWRvQXRJcVZJQ3VtSUNNL05H?=
 =?utf-8?B?QmZXdWVuanFTN2tjbEdvS09Nd1lOcUJHdmttbWJFTGRZQkpYYnpsL3plZ1FG?=
 =?utf-8?B?TUxSbzZDV0srbUc4TlZITlhwUWlLK2MwY2pNNDEwRDE4UzJXeVZjUURaTDBG?=
 =?utf-8?B?cFVNWVIwTElwRUJIeDRpZGhkV3MzZWY4OHdSdms0V2U2YndYOHZWTHBtaUdk?=
 =?utf-8?B?blZEaEJQUzcrZGxleUJrRWZoMmFjTFhSeWdMVElSL2cwVGx3UTlLb1NxRVpO?=
 =?utf-8?B?a3pzWEkwU1Mwb0dGNisrbm5sWW9BSTZzZGNCUDFUVExVZ3g0MGdHQ3lnTkVR?=
 =?utf-8?B?Y0tYUklOMm5HcFEwNU54dDZXRk1jK0tWU3o2bUhXNWFKV2MvVmI5YkxsVGtW?=
 =?utf-8?B?UkNadFFEcG9VWldvbTgxYlBBMU5yUWkycmdLWVRDN3ZHeVcvVnkvU2ZQa3VC?=
 =?utf-8?B?R01SclQ2MHY0U3JrV3VqbStmUEtsUzFFcUVmclZoS2txQ2FqSjFncHNkQ0FI?=
 =?utf-8?B?Vm5kQitPMGpIWlJ4UWl1L1BqUnBIdHY2dXBEVVV4WVpWK1BpeDAzUHpZdlVx?=
 =?utf-8?B?amNON1hnZG9zL3VWb3o4MlhreTlkQUJxZi9Ib2hIVjM1QmQyaERiWHdRbEo5?=
 =?utf-8?B?cDBScWdVS0pTRHBmTEhxZVZWVllET21sNkJPUURrQU1RbUM1Uk1ZSGVzeHg2?=
 =?utf-8?B?bEZFdmRGTDIyWS9TaFJnR1F0R00yMDhWdFZFOVhJRVBaTTdRa01xMlVNNFFR?=
 =?utf-8?B?czg0U0tEK3UvcDE1emxkTXJ0TFNVeGR4aStWdjgrVmlXTjRpZzlPRWJUTm82?=
 =?utf-8?B?QVZQOHZwL2JNaXdVWWErRnZscEw4a2VlVlNLRVMyaGozWnA3K2VlcmVORzVH?=
 =?utf-8?B?RlR3TUdJU3NPdFE3ODBUdWE3dEFIcmh0MWlWZkZvemliQ0VCajBmY2sybkRu?=
 =?utf-8?B?cTdveXhXdGR0czFnM3dGOXJyZUptbEtwZ2dvQ09yVjVJVTdDalhmbVZmTlha?=
 =?utf-8?B?NlhFVXNyRlUxblZ3T2NUdW5VSWtpdDlDUU5EOFN1VGx2a2xtcFB4d2pnbUVj?=
 =?utf-8?B?bHc3T2RFaGVxUS96T3dVZ1FDRlEvTWJuNStUalg0WnZoQUtrMUtZRm5waXJB?=
 =?utf-8?Q?1Ut5jGA6wR8cq9ib8nsmX+vHV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f38ebb1e-4d46-4e79-3f39-08db1a5f6fad
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 14:15:40.2147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P/t91f65QMQNWaLKh4y/EGYqUsA+uF7xHI1Dd39bB79uaQIueWUFw+zleXtDnzYgktDjF7B1R2vJ0viQXJ0DlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8382

Grant table code is unused in shim mode, so there's no point in
building it in the first place for shim-exclusive mode.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Use UNCONSTRAINED.

--- a/xen/arch/x86/configs/pvshim_defconfig
+++ b/xen/arch/x86/configs/pvshim_defconfig
@@ -9,7 +9,6 @@ CONFIG_EXPERT=y
 # Disable features not used by the PV shim
 # CONFIG_XEN_SHSTK is not set
 # CONFIG_XEN_IBT is not set
-# CONFIG_GRANT_TABLE is not set
 # CONFIG_HYPFS is not set
 # CONFIG_BIGMEM is not set
 # CONFIG_KEXEC is not set
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -15,6 +15,7 @@ config CORE_PARKING
 config GRANT_TABLE
 	bool "Grant table support" if EXPERT
 	default y
+	depends on UNCONSTRAINED
 	---help---
 	  Grant table provides a generic mechanism to memory sharing
 	  between domains. This shared memory interface underpins the


