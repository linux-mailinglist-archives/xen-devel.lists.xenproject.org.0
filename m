Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F08E464C82
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 12:21:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235924.409231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNfj-0003Qi-DU; Wed, 01 Dec 2021 11:21:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235924.409231; Wed, 01 Dec 2021 11:21:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNfj-0003Nj-9l; Wed, 01 Dec 2021 11:21:11 +0000
Received: by outflank-mailman (input) for mailman id 235924;
 Wed, 01 Dec 2021 11:21:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msNfh-0002lJ-79
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 11:21:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5d0028a-5298-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 12:21:05 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-uTpvIZzHMGSgBT8luWXX7g-1; Wed, 01 Dec 2021 12:21:03 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3936.eurprd04.prod.outlook.com (2603:10a6:803:23::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 11:21:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 11:21:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR02CA0023.eurprd02.prod.outlook.com (2603:10a6:20b:100::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Wed, 1 Dec 2021 11:21:02 +0000
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
X-Inumbo-ID: c5d0028a-5298-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638357664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2biUIJpAqJ0eyN1ne/XaQldxN2vM6fcaq9kRJNDcVj8=;
	b=kmRqSOmosVJCu0w3PILVULsYzkUymgNDjkVHiXQx74/jAB6VZUzvxsCITb3kPqZyEL7iM5
	VMeGBU6/orXqwnBzcDDZfJHxliLtJIYJFn5G3TWyhBTiiLLonwckX1jQIWTHSOTm6R7iKc
	OJ1uqs95yvfOHO4oJCq1QiGXHfrv/II=
X-MC-Unique: uTpvIZzHMGSgBT8luWXX7g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZgPRG/PTYx512xwVOnUvSJSr1jOQV9oFPtG0qyF3LcDp6+rhSEXmHSRSCxuELW+JBZIKu2NNJLbzKXDB31tklRpFErxJYbKrc5yqBP9smDQ5T8F+zIZskN7QPTDVhej35dYhDzpRVNJKVEbpyJjUnSg1TBe+mfKmqFiMt3TWiH1bMRmNe9UxHhKuaHJ74bkU+RI3qE6Jh/ZChpOr8zrh4hdDYnNUAAZHoPIVnzhljqg4aCGKuHDwR1tKBIDD76NYRRx7zxEhWLwCpPPxiVzrFw7PAxUHiAsQi0h8V42f2ZytpF/fIwjcy/LOzUCpSJe1EaP8WTz6SrWGlrh7q9xMCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2biUIJpAqJ0eyN1ne/XaQldxN2vM6fcaq9kRJNDcVj8=;
 b=S/fM81DCcv4tL6hY2UdVbXqxB4sWhiX/kn6fwUCypjJWF93Zix5iL05DECDZUXKTBYjUYqZu+pWZ6LXvvrUbBMc9HBy/3JzNy005EJN6Siv4GBvT/wjoEWNZDYqCRdPfyisO/Rp3tS3/Rk/DzaqbB/DNnqHrKyEeXJiyJRcrBbZY3x/KO0PNJlV6D9b0N1a3+dEu/3VPSDkvLEAi/5mHgXEQ1/mRhdL+3ezUVVEWfbXP1+VN+WzKuOVLB5pN0nnHS/rq7wRdjhc7JHPO8UGYIxTPCRZ7NeY/NJ9yLnh+1g+SugqQTAjHurDM4P7H60nguAadbHrOGCiObqz35pJooA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <33b3a7a2-3b1e-d24d-5359-c5fd3294d847@suse.com>
Date: Wed, 1 Dec 2021 12:21:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH v2 2/2] x86/mm: tidy XENMEM_{get,set}_pod_target handling
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <8bb92e3f-38b4-16a1-0a45-5f393081f230@suse.com>
In-Reply-To: <8bb92e3f-38b4-16a1-0a45-5f393081f230@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR02CA0023.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac7186f9-94fa-498e-6175-08d9b4bca8d9
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3936:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB393675EBF88A2C1BA492D53CB3689@VI1PR0402MB3936.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:419;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+ayEi9LNnXfpkJFBOvfQSPsk7YXTgl+Ykfj3OI7aIG1RmYlTuiC96imhYoV/6/DnMc3rsifJmeTMDB0iDs/I4sdkBasE8nncUUMhVJr4EWTInBJniGXvzulxTgzRRwVsscx6TDfyPbB+y3PLTvMY0bi6Do9E5pSin0EVnTW1xnkYryfg2N9L27Cgx/MAfi4zA6qlHzPu3oXklGWOZNiJak//SgQelZthvwj31lNrFn/GPsxC05MW0GzXyeiZIyrirUlUT/GG01JSpkBaxI5AV85F8FfRlumSo5WisW0LguW3FucLk+90R0Ey9NtUN2GaD0/UhJKcHFLz9PwAxzi2sFxsXeebVf7jteD9itvl8HbxA+zuloPsWotQbQ/xQNmyTydXozn12yQmCBpdakWPQmMGKbmD6VDaeB05VtKk73JgSA08PdnGs3R7ZTNwIhTIOAkFA5roeYIs7wb+3MJ/SmgHO2cd7aHB3MUkN5GCpFY3RMdOoAy8U3rM9wXzeELIXV6dax+gEEtvY+cCSSrz2g3JbYTjowEflDcI/CiQmWbCBbL9NKygJNjlSUs/vP0eorh+sz6QnK59PNHYX2n+/u1h1qxMWH3R3NovU+wzfFR7LYMhG6p4876ugPGs33nD5nkgEfVytJEbXavJSBw1oQkUluHWGa7F7i6X7G0P58b+BU/FZXoT1ifYt+5qT0GG/+bQ7HBcz5zUkbBdF7lYwYTY7JD3PeQMQ5ahsh8cuuw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(2616005)(36756003)(6486002)(4326008)(86362001)(5660300002)(6916009)(508600001)(16576012)(54906003)(66556008)(66476007)(31696002)(83380400001)(26005)(66946007)(31686004)(2906002)(956004)(186003)(38100700002)(8676002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bSszRENIVlVzMlBKMVFXM0oxM1BnK1Vsc2Y3WFdoVVg0NExhVStXdW1lQ3FH?=
 =?utf-8?B?ZDl0eEhCY1VIbk56RGVZbzVRYjVKczJ5M1ppdnNveURFdGthYlhCbXJHYjQ4?=
 =?utf-8?B?MFpVWkxRdEo0UXRBWjhUOWNHeTlwZGpBNGxWNUM0eTlmbXZqTGlvWXFVL25a?=
 =?utf-8?B?RXJrYUJZUktOT1ZYL1dUblEwZzBRZ3c5bllEb01OejQ2OVdTdzhwVkpqaUlp?=
 =?utf-8?B?TW55T1JKejBzSkszOVZjZXlKQ1NoQlc4cll1QWJFa1g4ZU1Ncm1WdGlFUXZR?=
 =?utf-8?B?QjVPSGxFNURUWjQvdG5uQlpuTzJHdWZOVlV6MGJtZDljSTE0bXJkY1N5TnRn?=
 =?utf-8?B?NXhaMm5TM1hWQXZ1T25jNUJqZE1VTkpJbi82T3YrS0NYN09aZGpUN3l5T2NE?=
 =?utf-8?B?azkzb2ZNeTVnSFc4cDd4SEJOelBISGdxVUN5cjd3dVk3ZHlMTEhoQjM0V1NU?=
 =?utf-8?B?eTlsUlhkaU9zMHd5Vkt3MSswbXZDSzZQWHVSN09BbnNRODJYU0M3RlV1cGV5?=
 =?utf-8?B?QmNyU3BvbDh2Ti9LU2V1OHd4S3dKM0owV0JwQWNFWkYrZVI2Yi9aM0VDY2w4?=
 =?utf-8?B?ZE9TVTNCMmVIODFYSk9IdmhIN2VibHU4SFJFNmVkSTQvd2FtOVBoKzE4VERu?=
 =?utf-8?B?d3d2RjFCREFMNjdOMlVaWVZZeFhwcVZMVW91USs0NWsxRlZsdFlFYUsydDFX?=
 =?utf-8?B?c2Y2OXhLT1pnTGZYOU9GYkRSRmFxNU9BWVoweFNuV3k1cU9RR0FiNDMvMFc5?=
 =?utf-8?B?bVBBbExsNS9PU1pLS01DUnB5VWdIS0NGQ1ZOVFROOWtQc1JHL2ZOdTBKYW95?=
 =?utf-8?B?K3NSOU95dVNLYjJpWnpKMGkvd3JPeXg4U1RmZGdCVUIyMk0wdlhYVCtyTDU3?=
 =?utf-8?B?QVk4czQxZ3llSW5jUXNvdS9GTGx3M0lZbVFlTjV5QThTc2xsQW9teE1KWGsr?=
 =?utf-8?B?TXUyT0pHWGxxd0pERTNHK3ovc0FTbzNxeGtlSFd0UkNhOUliWWh5SWVPSlFK?=
 =?utf-8?B?MFZWZndjNXlWa0tkdjY2N2NtVCsrd3BrN0VBa0V3RUpRb25Bdm1tR1VWOGxF?=
 =?utf-8?B?TUlPN2lzbUU0a2MxK09VdkhvMlBBbE9uWjVDTzdQMG1ZTnYrQ0RibjVGK3RT?=
 =?utf-8?B?aUJ0blBEN1ZWQ1dXYUMrNE5QdVgwUzRaaGxXZGU3UDVGWHA4NHg1Ni9sSUNs?=
 =?utf-8?B?K2Ftd3lyeG1HVXd6dUhzemVSbWJJVzZZeWJsVCs5bUx5Smo1akFLZ1JFdmhF?=
 =?utf-8?B?azdBaWpXdHFWV01PMEdoWksycXI3azFvTUlPNmFmSUVGMUJYZnZORXQ1R1do?=
 =?utf-8?B?bjl2V2FPWkluSDh3QVVyS0RFS0RmclVvNThvQkxQYk9YQ0RyU1VsVXhHVkkw?=
 =?utf-8?B?WUdiYjJ4V0swckNXS2l2M2poU0hHZ2FrUEp3ZkdWUmpLOXRNT0FhNFY2NmE2?=
 =?utf-8?B?WTNIOWVwMlpvM2M4R2MwZFV4dGRzSEx0cWtyTE9FOUU1SXRSZEdNT1FGUE9n?=
 =?utf-8?B?dFpUeWlQSUp2VTdmdjlwdURkMGNtTTJWNldvTzhaRm5SRUpnUndHVlZNQkZV?=
 =?utf-8?B?SG9wRzAzZzEzc3ppN24xNTZ3ZHFFdDRTVTZpS0RWZjJXeUFkM2tWRHR6bmo1?=
 =?utf-8?B?VjZibFFDSkpRYXNxdVEvYk1lWWRSOHhORGViZC9OWGRVcUpJNEVlakVsM0Zu?=
 =?utf-8?B?cy9Qb0QvSytFODZ6bGY2ZlgyaEZhZHAzNTBUZXZmWHArdXhWNndCZCtTMmZO?=
 =?utf-8?B?a2g4R1dLa2dqTi9BOWloeEZFdjZNRjVDRkJyTS9va3pPUTV1OVV2bkladFhr?=
 =?utf-8?B?bTZwRGlzYTliVmNTTnVDenZFU2xCQWIyblpTdUdBbElLN0tKeWZsNHdKVWRT?=
 =?utf-8?B?dWMzVzFlaFJQS0Rxa3B4cU1qazZJWjI0TzRSVFJFaGlpUEZYcVBwWU1YU3dO?=
 =?utf-8?B?a3FvTEVGaXpobHF0VFdCRW1EY0g4UHh2RFMyQnlnQmZIV2pML1VVRFh3aWdL?=
 =?utf-8?B?alZxRWhyd0srcmV5KzNOOFFvZURFTjVWNHAxWEF6akdKV0FLbWZ2ZW9BSUlZ?=
 =?utf-8?B?aS8zR3FLQzJXSmwzUHhKcTVDaU5SRzFvMWhkSHBIcURmVVNLb0N6YitqVjdO?=
 =?utf-8?B?ZXd5TGU4Y3k0VmxZaUpEODhRcW1OdHhmT1ZZODdIZHVVY2JwVFoxanBSV25Q?=
 =?utf-8?Q?hde0dpq1aurWDpLF4vrc/E8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac7186f9-94fa-498e-6175-08d9b4bca8d9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 11:21:03.0285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OgavDlWeah3ipLxGls/UuPGkx1OXN95D01P6AT4ltpJXxIw+hG9NA3CsDEvlkRqnLPygcHM2JrbyoN4f2vfYcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3936

Do away with the "pod_target_out_unlock" label. In particular by folding
if()-s, the logic can be expressed with less code (and no goto-s) this
way.

Limit scope of "p2m", constifying it at the same time.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-base over new earlier patch.

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4788,23 +4788,17 @@ long arch_memory_op(unsigned long cmd, X
         if ( !is_hvm_domain(d) )
             rc = -EINVAL;
         else if ( cmd == XENMEM_set_pod_target )
-            rc = xsm_set_pod_target(XSM_PRIV, d);
-        else
-            rc = xsm_get_pod_target(XSM_PRIV, d);
-
-        if ( rc != 0 )
-            goto pod_target_out_unlock;
-
-        if ( cmd == XENMEM_set_pod_target )
         {
-            if ( target.target_pages > d->max_pages )
-            {
+            rc = xsm_set_pod_target(XSM_PRIV, d);
+            if ( rc )
+                ASSERT(rc < 0);
+            else if ( target.target_pages > d->max_pages )
                 rc = -EINVAL;
-                goto pod_target_out_unlock;
-            }
-
-            rc = p2m_pod_set_mem_target(d, target.target_pages);
+            else
+                rc = p2m_pod_set_mem_target(d, target.target_pages);
         }
+        else
+            rc = xsm_get_pod_target(XSM_PRIV, d);
 
         if ( rc == -ERESTART )
         {
@@ -4816,13 +4810,9 @@ long arch_memory_op(unsigned long cmd, X
             p2m_pod_get_mem_target(d, &target);
 
             if ( __copy_to_guest(arg, &target, 1) )
-            {
-                rc= -EFAULT;
-                goto pod_target_out_unlock;
-            }
+                rc = -EFAULT;
         }
 
-    pod_target_out_unlock:
         rcu_unlock_domain(d);
         return rc;
     }


