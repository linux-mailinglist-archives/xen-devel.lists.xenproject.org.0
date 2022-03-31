Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFF44ED751
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 11:51:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296865.505487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZrSQ-0000hK-3D; Thu, 31 Mar 2022 09:51:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296865.505487; Thu, 31 Mar 2022 09:51:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZrSP-0000dp-VC; Thu, 31 Mar 2022 09:51:09 +0000
Received: by outflank-mailman (input) for mailman id 296865;
 Thu, 31 Mar 2022 09:51:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZrSP-0007le-3q
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 09:51:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16caed53-b0d8-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 11:51:08 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-msc2Wdd7Oge5_8QbrcETMg-1; Thu, 31 Mar 2022 11:51:05 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB3264.eurprd04.prod.outlook.com (2603:10a6:802:11::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.16; Thu, 31 Mar
 2022 09:51:04 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 09:51:04 +0000
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
X-Inumbo-ID: 16caed53-b0d8-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648720268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KNU533Nas71KGaxkrjt8Y4qhfH0SyWRPA/lY3YgjMd0=;
	b=KF6ZgxS+cdxy+UEJJ31sOomnvaqF12AcerVo364qI9ehwhuDq3CvdvfM9UYWK74Qc9Gd6g
	R5bxIcDl7hjm7+XTu2c2dk6GO5PLDpV+Lywow3WoQd7CBPTEp6IUiZDnPDHfFrEME0SD5O
	iyxTPraBbHSICrT86FI1kaEBTxX3hNA=
X-MC-Unique: msc2Wdd7Oge5_8QbrcETMg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iS4xA51Q/g66xdp9hQ9OYXU5ngFKeEzexBsTmf43SiSXGzW7SnmdmqKPz4ZwbY+ikTN64YWHw2B7jm2XkDSK+msXd9Ks9emlMD7BA3avfw7wG4CQdem8QQNcWGaSK9/eaborh0pevWUHUcyTUQ7rVRxmsEBTxipSSzw1Oy/+xg8YWoeEUubBgYMOP4fTmmkwsGuzfttKQPq8irV+8nZtVFRy+kHRAp1RfZ6uv8FzNEh4neWtaFB2YTMzVPSsTZgs80TxuMFUkCGUFseqN0DQTw0ELi9NYHQAI7iBcWhYcAOaXRVLNB3RbenQfH72p4gFMHFPVg+4W1V+W27RsEYucg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNU533Nas71KGaxkrjt8Y4qhfH0SyWRPA/lY3YgjMd0=;
 b=dgPc21xsJR4LFSzLJz7DVn/d+Ft+NR0sB8piw2DqABRaMB39ZSVw/ReQy5vCKoE/o0VTMAd5ZwSarQEccJaHbjs43X5PvClzKZ/grF9bIVuqqevEm4QDJacGwb5WODQJLM40FCxjsqae7tlyopPChJ/V+9fqkZ+Mrg4XsPmVHyTyrY3lLPnRUH7H2xdvKsN+kiEiX7ISdOvBUJ4KLc05NF+AJrNxX+LSGEH6+lYNWdSvhi3v2/Ym3zVcVcKyeNu8mBnRq0NTNT8/5Qvnf39uC3jaP8eEVFy+f9Iq5cmPnEfeFxCiXVUMJ5nAmGzslD90vrcyRh6TL6vG1KPLdDgJKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <294639f0-d959-59b4-b3db-78451d5acd9c@suse.com>
Date: Thu, 31 Mar 2022 11:51:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: [PATCH v4 8/8] x86/boot: fold two MOVs into an ADD
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
In-Reply-To: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0033.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::46) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 582759d4-d117-4731-fac8-08da12fbf87b
X-MS-TrafficTypeDiagnostic: VI1PR04MB3264:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB32642A785C3FB09B4DC89C7FB3E19@VI1PR04MB3264.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UJjy2bW6y2cqgSk4boAj0awY/3NID1albUqJeBsbTs+6dYICUi/vHJFjlhNr90SguuxPCE0XF/wQpCbVIM3KhOmhjUOrN8CWJNrSiPFf839Sr4mvHedytSdHZ0/2oCi2O0OIVbhi/5OoEE5L1WbBAioneJt9EpQtSm8zipeIAcgQPJnN+ZN5KD/pXw1/jlBQtAbWkJpNjgIQyo83d3MsydnY1uG1aUZ424A8ur1DmwwB4a0OkX+7F3knRTvXiLd5isWjZfM6vlwQjpO2xuZ4M97cz9IjzJUVu0wruYj1BFQH1IzhCaCGhFpwOt+ap6zNK+3zz1ub/WC/WUZPhg3IFCndio78ySXjtI9lxA7LZuQGu9XcdDqXlYNGO9ZB2UREFO1KdpGNtzfRA3WXOpDaMnurzclNyz8LB4egJsVmUv+udr7WB6ouJM5CEnAUKBTDXgQG3TWi+qoxnqDY+tF4sg4bQAeVBzBinG3N/r5F74ofQE5oPYeW2s/SlASc3kpg9pEJynPoZpXstnLgWLefj5xv+EcomR3S4eKYEvg6KAoyyHFUJW5JaQH7VcNQjkipPzRMp2WuKoVb0sxOIdfXnzqzwG4SM1ZM75A11e7hGiMIVT/1UgZPiM+yJa8wmtrffr0DAKlZtZ8oMm5I37FKQCIXjhbzydoeC/H8Apt4XSD5gw4NMYsr1XY3nHWKLOfPa5YBjc0VgyGSY6vTqALYiyLgsVnz7ATIrWN1U6y55Ow=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(54906003)(6506007)(2906002)(86362001)(4326008)(8676002)(66476007)(66556008)(66946007)(508600001)(6512007)(6916009)(31686004)(36756003)(316002)(6486002)(2616005)(38100700002)(186003)(26005)(4744005)(8936002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGpqMzZ6eHQ4d0pUd2NVa04zcFhTaCtEbHFub0FRYTJGUjI5TUZGMVhDKzA0?=
 =?utf-8?B?WlJhV0tVRFRwSzdUS2hBK1hZeFV6ZzhqYzZOYmx5V0xzZzZ6N1hqa1hEOHcv?=
 =?utf-8?B?aXFpN1VxSkM0N2xXWGEwTnZJWExRUm91NXlXb0tNNDY5UUpsYXY0UWlwWnRY?=
 =?utf-8?B?MTI1WjNybmNIVy9TMURwV2ErdTdUc2dpNS9IMWFxdVFwQWw5RlBsVndKOEZj?=
 =?utf-8?B?WnlVQy9YQjZOUHJXT1prdEg4akI4eVl1VkM5UlY3Z2VmSExZbHlyTXNpRjRY?=
 =?utf-8?B?bUlQOGs4RHFNbHY5cWRmV2s0V0lhY1ZVTHd2dnNxSzhCcGt6OGZnc2FIajBz?=
 =?utf-8?B?V3VNa0RhMituUC9IRWdJc1JJSGNkTnRSVDlYTFk3YlZMRENPbW1tVHBSazBM?=
 =?utf-8?B?ZWs1RDAzWWU5YUpHd3BkSHc2Z2VUVFl1b0RZUmFETE1CZHVWdlBUY3lRZ0pl?=
 =?utf-8?B?YXA0UEEzS2ZHK3U4QS9ScW5XeVM2bW1iQmtHNnJNMitNWGFUYlc5dTM5cHJH?=
 =?utf-8?B?L3dpbWR4dlNML1Y2NVZtYThwV2FLdHVlSE45L0dvYlo0Mkt5OFExeHBVdHlZ?=
 =?utf-8?B?dC9Wa3F5R2lKTDFEbmxLNzBURG5kN2hCaWRWSTZzV0dEY2pLQUdlRFVtdDYz?=
 =?utf-8?B?VitLdXZxSkl3akF2VEFOQzY4ZzNiNEJJWGIxS3pRMUVKUE5QKzZvdUxKR056?=
 =?utf-8?B?ai9MNGd5akt0OUVJOElUL2hqR2Z3aGJkb3N6Rit1cndmYUR1TW9VYm03VkZL?=
 =?utf-8?B?eTlScWw5cnRoTXI0cHpKb2RuM2pSeDRMVFdTUG1FSWlkSWRtMklsREsrczF5?=
 =?utf-8?B?T3BmV0NtbVU0QmJsVVdWSUxzaGN5NTY3MHMxeENxaVZ0MlRjaS9tNEV2cUcw?=
 =?utf-8?B?cnVhNFJvdGlVNStySHNndnYzYVFpcVoxR3lHMWpvM2tWWk0zTFk3T0RRTjlj?=
 =?utf-8?B?a0w1cG5TL21RQWxjVTU3RHdqb1ZHYkhNZG8vUTdhYmJwWUc4bHV5WnlRS2Mv?=
 =?utf-8?B?bHF3VU1FRUVZNHFVTDd4bWZKWEZLSE9GR0JQbFNvNjBSSlR1L2YzYzZtbTVF?=
 =?utf-8?B?RWxXTThtdGFHQ3B2TjA4NS8wZnFKRVVvNC9DQ0pGMldIOEpkVUNRd0p0VVBU?=
 =?utf-8?B?TU5hK014ODVuUHJjVnFiVnpCUHN2ZjZGM1lTOFlRbzIvUEltMWJsdTE2SVpU?=
 =?utf-8?B?THV2cHovNldBUlJRTHFPYk5JdXkxUCtyazdFblVqT2VWbDBPd0l4VnRLaHdj?=
 =?utf-8?B?cjhadmlOQXRCVTFIelJjdkJ6VWZxKzdBeXM4d2Y1U0JrYm5ZaW13N1lRdUZo?=
 =?utf-8?B?bjdzUWhzajRMYndYdnhvK3ZQWnphaU5iaG41Q2hwTVVyS09MVUhjSmMvWUlj?=
 =?utf-8?B?SnVoWEN0TjV6RGZLZXFST01aRmRyODBua1owbkdCMU5LY2FUK2VoakFRNC9q?=
 =?utf-8?B?TUVaOXJwcDhwV0U4TmtGYktIMEFZOFU2eGJJazA0S1FPTWlzNDNqbFBzSWcr?=
 =?utf-8?B?eXdGQmMvNW9hV0NHTzgraFE2bGhkRmZuNTZtdWMvQzQ3amZHZ0FpdkoxNzFi?=
 =?utf-8?B?aVBEV1BlaGhhVDRiVHFHeXhPV21zcVJGMXlqdE9wNUx4RjJQSnBqVU0vRDgv?=
 =?utf-8?B?SUo0U2VCT2dYdzUyaHMxb3RscTFrT0xJWmppZXgrcUJBUkh2Z3BReFlmZmFt?=
 =?utf-8?B?ZSswU3dmQ3Y0Zkgva0FmT1hpY3FQTS9LSlV0ZHdSRzZyV3RKVzlmL3FUUEw2?=
 =?utf-8?B?bFF0c2RzQktqUk5xRDZuU0hzaFBxbzRXL0c4Q0pvWGhjY0l4ejVoSkpIdzFn?=
 =?utf-8?B?Z3YzREFhbWRvN1B4dXZETlNyM3hKMnlkbkMwMHM5S1NwR0RwMVQrTVl4TVBZ?=
 =?utf-8?B?cldzYmVja0hXQ2NTSUYyTDFEZmV0c1p1c25obEtDM1B2NzlzOGc3dTY2MjRZ?=
 =?utf-8?B?T3VoT2JockMrQmUzUS9Kc0pTR2NqZW9HZGg2UTRzbWRMZFhqU1lMT1FPQ29B?=
 =?utf-8?B?Z1g5V2NwNStnYTkwVjl5Wk05UG1naTdYUTY1OFVycGcyQ0gxaFNyZnJNK0J3?=
 =?utf-8?B?YVFic2ROVVFLb2s1SHdHMVJacm5iQ1FNM3hBMFcydGtuMHZlUUVzTTNtcVBI?=
 =?utf-8?B?bUxGVUc5NUtBdVlpOU5HZDkxckE3QUJTNTBuUGM2REdiNHZ4bHhIU1hOVVRT?=
 =?utf-8?B?R1ZrSlJVWXRTYW81bFlsVlgyV2I2ZnpvQndQbzdnMHNGODJMS3ppTlEydWJx?=
 =?utf-8?B?ZlBZbURib1JLNVVOTTU2Z1F1QTlsTld3eDh4V0crcEh2WUovbnUrMFlRVWdp?=
 =?utf-8?B?d3RXNzZUOTdtSUlFZTY5bUUzcFdWT1NVcVVjS0ZianZvVmI4SWxXZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 582759d4-d117-4731-fac8-08da12fbf87b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 09:51:04.2874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LhdWRiJg/t8CgflyBBmlQYCIyLWamVcIYDP2ND/1obgX6MzbsbU7PrCakvrhfst8Ht2efA/D12YPxgGIiV+DxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3264

There's no point going through %ax; the addition can be done directly in
%di.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/boot/mem.S
+++ b/xen/arch/x86/boot/mem.S
@@ -24,9 +24,7 @@ get_memory_map:
         cmpw    $E820_BIOS_MAX, bootsym(bios_e820nr) # up to this many entries
         jae     .Ldone
 
-        movw    %di,%ax
-        addw    $20,%ax
-        movw    %ax,%di
+        addw    $20,%di
         testl   %ebx,%ebx                       # check to see if
         jnz     1b                              # %ebx is set to EOF
 


