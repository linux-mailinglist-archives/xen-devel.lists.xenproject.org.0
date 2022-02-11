Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1874B23F5
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 12:09:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270359.464624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nITnb-0007Gu-EJ; Fri, 11 Feb 2022 11:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270359.464624; Fri, 11 Feb 2022 11:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nITnb-0007DS-A9; Fri, 11 Feb 2022 11:09:11 +0000
Received: by outflank-mailman (input) for mailman id 270359;
 Fri, 11 Feb 2022 11:09:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jrYj=S2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nITna-0007DM-DU
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 11:09:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08e87df1-8b2b-11ec-8eb8-a37418f5ba1a;
 Fri, 11 Feb 2022 12:09:09 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-av687yQ9OHmWzqIhyCzKOg-1; Fri, 11 Feb 2022 12:09:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM9PR04MB8290.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Fri, 11 Feb
 2022 11:09:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Fri, 11 Feb 2022
 11:09:06 +0000
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
X-Inumbo-ID: 08e87df1-8b2b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644577749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vle0Ii9zLD/mplP4nqUmRUtRDq+Ksr5YXBw/LJA402c=;
	b=g3J8i4RCcLUrQti+O9pSmucRjsnRk/XqJbILZLMsZJW9JI8XXZ53533OwaZmAz7iyDe9Iy
	esu1p7Tv/7BViDI+ZW2H6ff64R/Zb4y6OA017M3aWfP3Gq64mQmxuFbbnWsLXQ4XDpkQBg
	U35Z5F2Y/fHyNk3X3LqoFWI5ra0JYIk=
X-MC-Unique: av687yQ9OHmWzqIhyCzKOg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k0881IkRPU9aYIcVnH6EiY50VIb/f4rW/QWoRZmMzp1uOELhYHbVKVQptdED9nv7RQnwA5UqnYqSGyNrUZ2kQ8P/3WRs1Gy1+XHkphGhkXkViPLgcG2QdSHBXvinIUAjRnLe/G1zqFdwa3sylA1IV7UbWERQ1ICLXekladAWux9+zeUCqotGG7fjPn/7EiCsaffasXgizr5AbE287sFaYN3HHX0VH/+hpejSLAg4Cz1amq4HVVPZiI9oSo6eaQ6t/8qIaTsdIOoYUTKjQb4TlR66Sis4M6+ovSe6PEaUaum5GWz+PUX9IZwmBqIx37C6nhwl760TRhf5gsHN4BU+0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vle0Ii9zLD/mplP4nqUmRUtRDq+Ksr5YXBw/LJA402c=;
 b=MhxObvdoQHngComXdIr7k385Xz0UZkllJD/OR3qIfGst5JmNxdc66OblwQmmogIS9MGauPPlvCVUYMqVNrY/ePKqlleFmGPnkikyJNKS2tWsT1UgQV93swX4xR0RkAy9dB+uL+uSJK3u4i4j/43MezoiZpp8fwkOONSS27Fo/pPKPs7hyaQ3TwMNQ04LIXinqWxgzIBq76oOVwy6NARMtrnV+hhHITuf74E1rou4nH4RKOAnUEs+dpKpSUOF8Ibng9iA2ZRxLbGER4+yxKxGCKQ3zVE9BjsMo7opaVcIP8fcfnrXLnf/iAczJYIFQpapo79zdOmnOH/SgUr1iwcc7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0d06eaa2-a9b4-5791-e26e-31db0a954827@suse.com>
Date: Fri, 11 Feb 2022 12:09:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: fix VPBLENDMW with mask and memory operand
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0001.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7449490-e15e-4804-73e9-08d9ed4eebb2
X-MS-TrafficTypeDiagnostic: AM9PR04MB8290:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB8290A22492205F5C10F532D5B3309@AM9PR04MB8290.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lLCvqgyE0umFVQmHFiN8XKSEiW0610DN7+Id8ndDXL2M3l3rOmWj6vKZP+nksQ4lSuSJNvah9/PUppvLR87XS0AGu6LCNE5/nq1mMwhwh7rb3FyFiLslRTcMIyhaiewt48oDPN70tGR/Q/Zx4W4jM4DVTZL+tx7SOLGSwEUZMNseZACpIy047gHoCFWNm626UFs2hCwjGHUU0T3rErSGkqQKXQAVEVb5evV+uMxzYzF8Aca1Prb5wssJBTs0UNAdVCJodUxj+E4SDWsykO14eg9ahmrqFX9GQf+9SIVKiwJrOXKJgIz+tILLuuNwxL96YhU7T8yHL+iVrlBTh86eDX0EYhksY+7Nlsc8fIdCg+gVVpNz+T+pSRMaqnfwP++hp8by9Ivz5aP3/EK6S4qnp3Gbq3GSptNWbrQuCNA4jSMl6IHZHBpSYe/r5dNw/DZImHNJEXkAVDXyhKWAXDcd+I8daWVfjSnpfYMRYgl9THzRfaHtsQFZeHeJaze+dBMc+PeUi/DSYHGoz5jtbAxm3LTvTlc9ImPlnB9GqQCIUaQIIXTx7WC1T7YOXMHZ8DG3O1FEBx4l0R1/hju9rHdTgcGsZq9tgl1vIjwDeUajDxLSHLPnnKTZmYBznfLKXdfRzRg0nR1gNbBEw8jWoTTKwKtEx5eRLraN4ROGrcXuW2XaDphfkpFI05yvIyUaHrNBCoWef2OSsXkkUt9lC9SeWBheoTxQQpYf0gBm9laKCI5ETgD1jgxeD4mBUqKZV2pY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(36756003)(508600001)(31686004)(4326008)(6666004)(66556008)(6506007)(31696002)(8676002)(66476007)(6486002)(6512007)(66946007)(26005)(2616005)(186003)(86362001)(54906003)(38100700002)(5660300002)(8936002)(6916009)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGJkcG9GaU5IdzhOWHlPRnFuMzN4Y2tsTHBTQytmcHVVbm5hdXBib3YydmNE?=
 =?utf-8?B?akRjWkczMmxJdnpZQjB0dS9uV1Z0OVRVTzduOVg3azhiZWw1WXJJdExUdDVQ?=
 =?utf-8?B?bDljZnY5MHIzUTdwd0ducEhLR3NjbjAya09sSk9LR3I0TElWSmhxeXQ1WnpU?=
 =?utf-8?B?WUpnMDNsc015YUhkN1VhODZYb296SDZQVDVQcFUxY2dSMTZIc3R1MmdGYTNM?=
 =?utf-8?B?WnRBMXRtdmtYRHhxM21Oc0V5Vk9POXhNdUNDZGN3cElRWTBRd1dOTnlYU0NN?=
 =?utf-8?B?Y3l4ZS9qSXcxazNDajcrOHFHVzVMSDlNb1JZNkhPSE5wMmR4ZUJFejRWc3VR?=
 =?utf-8?B?TlYxbmR6T1RLN21XandZVWhVcUdwR1prYlhwSk5uZXpNeE5tMmZkYkpiOHhh?=
 =?utf-8?B?NjFaZVFtZXlnQnM3c25mOEFvV1ZkazZNRWVoRDBCbHFmMkNvaEtUZkdTRGdo?=
 =?utf-8?B?eHlrc0RKWi9pWUMzaXhFekoxNndud3ZTV1h0Sitzd092eHh4N2N0bVhjVzFr?=
 =?utf-8?B?bXVtczVCdUZ5WHZYckhOSERLajM1eUtTdXFINlZ0Zjg2NnJ6ZGxsQVlHL2pU?=
 =?utf-8?B?M0NXYklLd2tJVmlnNVdKNyt5cHhmWCthRHdCeC96bFp5YmZsWnlWTjhRa2tH?=
 =?utf-8?B?SmpZeFg2Rko4WE15YTFuNDJMZEI5V1ZxWWdYenpRR2VxRi96ekpCdkUydGRE?=
 =?utf-8?B?c3ZSK0ZYdVpsNlZhczM5Ri9JT0dncnZhdC9pNlMyYmwzSXBpL2NyUVBhTlR0?=
 =?utf-8?B?cVZWamZjcldTdjJXTVBGUGN2Z28zT1plenhSMnIzZHVDLy9UVnBmeFl5QVpJ?=
 =?utf-8?B?d2cwdWxncklBb0tCUXVuaUwwZmgxRy9ZcXJxR2YveFJ0MkcrR01SbElkYWRT?=
 =?utf-8?B?YllZSGdRSjNVRCtKazZMb1RsTjJieDRHZDU1aWIzSVkreXpRS0ZraTB5Mk52?=
 =?utf-8?B?aVZrNFJPbFpWb1o1NzRCMXA2cVAzVmNObTcyOHJYb2Qvd2NadFJ0bVFNQUJY?=
 =?utf-8?B?UWlseWsyUy9HOUFya2dscldwcStoMFZSN1pLR0EzbXlSUVlNYllzRkd2aWdU?=
 =?utf-8?B?dXRSWCtmYmMxbngybzNsTWdWMU5LWXpJKyt1UzhXN0p3ZnNMQU03YS93Z2Yw?=
 =?utf-8?B?TkhQU0xDUGVrU0t1cmFLc0xsa2RZNGRvclMrN2FYRWdJWXA3bUNhNDNlSi9L?=
 =?utf-8?B?VnkybGt3Q0NzMU84OFFCTjBsdmtQTXZFbm8wdXdnTjh6TkpMVWN6UzM4cDFB?=
 =?utf-8?B?Wm44VWVKY2hMa1lWTklpZ1ZxR1JQcHdqSDZDWUs3bHNCc2ozc1JRNmNQT3oy?=
 =?utf-8?B?Y3h1YnEzb1IySm9tT2JMcERCM1NUeWp3OEpielVxUUUwRXd1Ym84cEtweWU5?=
 =?utf-8?B?Z0lVWS9IYzNGLy9UWmtva1hBaWE3TVZRVThLdW9zaFpGcy9EWGM5UGg5Y3Vq?=
 =?utf-8?B?VTFnNkw2dDdUc0QrWG13L2wxNHR4bmRMVFJOa1RkSFRqanFmRHhEUzF0WnU3?=
 =?utf-8?B?MFFDREhMdEZFaE1aUFVYRTVEZEk1Y3hDZWIveU1ZM21hc1J3ZTJHcUFnTG1y?=
 =?utf-8?B?M2UzYlQvYmJ2d2hLU1BxL0w0RU5EaUhZT0ppNUZ0bkV5NDBTQ0lWaktwTEhw?=
 =?utf-8?B?UEJTcmdnZmVMaDVLV0l1VTBXc0w2V1JPbFNzVWZEc0ZoRTRya1g1TlVzRXBn?=
 =?utf-8?B?RHJNZ1FUK3Bzb0dpc1IvZmFOYkFEZjFacUJyVzM3VjIvdWlJR1ZxUjg4M0U5?=
 =?utf-8?B?cmgxQXVLZlNBckpwV1E0MWRaOU4yM2tCelJnYWxQM3BzOUozZHVhQ3VhUHc1?=
 =?utf-8?B?UFhTb3J6dFNlZ3lEZUplVzAzWDE1YVZyN0xQdUdobjJuV0Y4MnllRUxwS01o?=
 =?utf-8?B?bmRXSW5FUXlhZnY3UjJ4eGNqUlFnQklpMDQzQm5aL0twWjlNQmI4VFJqaWtF?=
 =?utf-8?B?bHVzM1BMSEdHNjUwMHFrcTZQd3pURnhJSCt4cUt3N3UwL3JlbCtYNmJkUnZn?=
 =?utf-8?B?K0EySXhvUzRwNEI3NUE1enVpU1c1clF0M0tWRVgyZ0ZpeXQ1V2xOVktoOWVh?=
 =?utf-8?B?cE9wU3ZpS3RHdTNtRVdVQm5iU2ZrNnBEenBicU1rUmhlV1FkazdjRDFqbGpI?=
 =?utf-8?B?K1lPZlNudTV4aGMzcmxFL01FalEvS3YvaDZJbFZGNG9lY2crNEljNktDR3Zk?=
 =?utf-8?Q?oN0/v9ZElpnJ7ObXPJxHss8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7449490-e15e-4804-73e9-08d9ed4eebb2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 11:09:06.8146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEtRcKw3pXU9XezuIUKQRGrg8g4Oz9z3brlejLcUL+0/pz0TPvpWhJGAjl5uq6/MVmD3qdl/l/iUtaJz1zathA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8290

Element size for this opcode depends on EVEX.W, not the low opcode bit.
Make use of AVX512BW being a prereq to AVX512_BITALG and move the case
label there, adding an AVX512BW feature check.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7401,7 +7401,6 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x0b): /* vpmulhrsw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x1c): /* vpabsb [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x1d): /* vpabsw [xyz]mm/mem,[xyz]mm{k} */
-    case X86EMUL_OPC_EVEX_66(0x0f38, 0x66): /* vpblendm{b,w} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         host_and_vcpu_must_have(avx512bw);
         generate_exception_if(evex.brs, EXC_UD);
         elem_bytes = 1 << (b & 1);
@@ -9558,6 +9557,9 @@ x86_emulate(
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x54): /* vpopcnt{b,w} [xyz]mm/mem,[xyz]mm{k} */
         host_and_vcpu_must_have(avx512_bitalg);
+        /* fall through */
+    case X86EMUL_OPC_EVEX_66(0x0f38, 0x66): /* vpblendm{b,w} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+        host_and_vcpu_must_have(avx512bw);
         generate_exception_if(evex.brs, EXC_UD);
         elem_bytes = 1 << evex.w;
         goto avx512f_no_sae;


