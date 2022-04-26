Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 464DD50FA7D
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 12:32:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313730.531439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIU3-0003AU-Vp; Tue, 26 Apr 2022 10:31:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313730.531439; Tue, 26 Apr 2022 10:31:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIU3-00038C-RT; Tue, 26 Apr 2022 10:31:51 +0000
Received: by outflank-mailman (input) for mailman id 313730;
 Tue, 26 Apr 2022 10:31:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njIO9-000707-0X
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 10:25:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a561eab-c54b-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 12:25:43 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-HQjnU6s_OFq7ccEn-YbM4Q-1; Tue, 26 Apr 2022 12:25:42 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB8PR04MB6684.eurprd04.prod.outlook.com (2603:10a6:10:105::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 10:25:40 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 10:25:40 +0000
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
X-Inumbo-ID: 3a561eab-c54b-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650968743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CpxLoT33b7I8wFn5AiNrMktbKi2AOwgyFO+mknPIv+0=;
	b=in0QdvpfjAkL0dTrSi569dZeLp4B19d1FRf9p5RqfhQK8U0kCAMXsZqX0+CMYnKDaSCioy
	3Pdxf/1LFEuhryYqsZ4rXPRR+NYRRsR3dyhorG39RU7dB2bHVe1VceRyBpEKNDWUlmv6WU
	V340bkcQ+hzpYpMFzuAZmNfPtB2ydvQ=
X-MC-Unique: HQjnU6s_OFq7ccEn-YbM4Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LtP4j6gnTwbLIrXrAUFHzFY822/n16j2FmyoX5UNlM9sh+TkJ0Hjj3Z0ZZ5mIawZA+oLBo18yR0vHoxAfAABum0mt4iwXGmA7J7+N6AiKhpEPwX314Hav1On8g+o0AjKH99+LEQy67fy6KdxTGU9W3/T/os1XV27jRMzVB6ORIFDg5ysZePKiGm7IfOOGSyT8jm5xXYpWVxzWgzfFAx3A1IsWPTsNvnwIxcv5fALt16oNh/hpvkH+zDZKcjPndiiutKtULyIfnKxk9AlGlNWMDxQhInJccg/G7QwZiNumYM/dN3Z2Ix22/M7uCotkt0Pq/s777Pdc2BdeQUPEJ5P2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CpxLoT33b7I8wFn5AiNrMktbKi2AOwgyFO+mknPIv+0=;
 b=f8yN7f5T7cQsghg7paHTWO415OgEoBw1tngrbq4+4nYs0L2wEWoPWRIGq6GiIlBC/fEV1yPg2is3lZTYZKigP2sJ2t7t5kYYLU+YUz5oLFP9liWD7WcPRK8GE9xl/ZomUcf9QPimk6lkCeI2yemqKBtXhY+2EnWYNNhD31HQpizkCFjIBBwnxlNN5vg4lpwBCzFPc8klPd3Zi/nauRVzce+C6ZNI+Vba6CrogqQim3g11a+n8E4XYmhcRVqpINfqfGDpiwpAhS13H717MDm9TB7UIAYfpwWB1nNGyE8ZyO0AIjHlNWwOc0yAIidPLqs2IkZZBuKOkhF5pOwDSwEX6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b35501dd-0462-4961-3574-42b84b637933@suse.com>
Date: Tue, 26 Apr 2022 12:25:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v3 6/8] x86/paging: supply more useful log-dirty page count
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <a0f019c5-4089-e19c-6041-044d6e93d80b@suse.com>
In-Reply-To: <a0f019c5-4089-e19c-6041-044d6e93d80b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0194.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::19) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1274e413-09fd-4269-26be-08da276f1cb8
X-MS-TrafficTypeDiagnostic: DB8PR04MB6684:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB66847273B1935B2E18497926B3FB9@DB8PR04MB6684.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6I7TDLLE8bi3LR8WMxc0OUSQNqGz11nIgK2sj2X1fl+yOjLocVc1uvv/07YzagZqVEU9Z6dfAViH1Lgj1daGdrVYub3SPlw5SsLiX6Yvzzo3PKWlVMmrFEgwWPacQ/Dl82pjliTnoewkYpd2t7Aq3+I0deyH3t/Yr6SiIML3oK/FPTEmx2QCaLebgdG8pEERUkEx/DNnET+SpkLDx5DcfmU7MKO/q1bNuGi2DyFhrWozgcdSj3MkaKro2pYCO8p9MpdiN6ZfGy4PwVyCFeRqeo5O9z9VEQ3yyMjiVDR8hOWMRi2yBWYFrkZF4k8aSt72KkDlvjlm4xbS/c3sAybvTScLZO9NfbuEzgOoALBOYb4ccFaSm2LVXP7ifnX2ulvBEPOZBDnVAhgJ4V0CP8cdQRNQ/ztci29JwckV1GyMf2TPDlNCR5dpYrERO+gjc79xWSC4OtsuQnVB40nuv3X65JcnX5gTAGJig81oM47TWI7KyUdG+6zm+7VeEVpb5WIwlFXwaJiWLHPd4vF4yo+aVPKZTNuWoMdnmcmHYQ3OvDgvCr6cNMRvVQm8P0yd4v62XVOomHLcRNUuAgfuRpnUWcdmVxERi6lxpX7r8GDD5lUet+QcX06CyCc5Aq7OqloB3rBfCNeNPApJbEZuADSQaz/AtSlIh6lzPfy3fTkIpYyrwoOrquohyXReyqHUCDytFSMdFfF1IRotefWE7M9+QfmE6WmjibZ9Klat/fWsZ8hjrAzQjg17f7dR+bgpZ39Tm+zC5Ui+uuQDVgZI5OEMfA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(38100700002)(83380400001)(508600001)(86362001)(8936002)(36756003)(6506007)(5660300002)(31686004)(30864003)(2906002)(2616005)(6916009)(26005)(66476007)(4326008)(54906003)(31696002)(8676002)(66556008)(6512007)(66946007)(316002)(6486002)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWthTHBGZmlYSlQvSEgzd1JLSlRlSXd3bUhER3ErUEJwQXZ6WUtCWjdOUjEv?=
 =?utf-8?B?VUJZMzJWMnBEdGZ3aVBqQUd1eFZTTXlOR01hWGdiRVA0N0YyV2F3UUVlaUJJ?=
 =?utf-8?B?MzZXcEIxTjdIWXN5RkxIVWliWEk4K1Q2UEFEQ1NFWjRLNjdQNkV4eGRDRERS?=
 =?utf-8?B?RzBTUGJubjRxblFJLzBWY0F2OTJCeWQxRURJeUJJS0JzMUx6SlI4S3dBbmlT?=
 =?utf-8?B?b1oveWx6V0p2YzlFaUZXS1V0UGhuMENGQ0lRMWNrTU9BUTgvM0p3OWFHWHJ6?=
 =?utf-8?B?WWdOV3VpcS9vYTFiK1lPcG5JVW5YNk1vVldaTit0TnhsL2xXOGNOaFVhc1du?=
 =?utf-8?B?djJab01rc2dTQUFrNFp3SWxmaTZkc2pTVW1ya0ZMSUhLRm40eC90MzdMWFBH?=
 =?utf-8?B?bllsOSsrK1pwYnZydThCL2JMcDNNZnlkQzJlTkJES1FvdGdUTEZLMUZFMjV4?=
 =?utf-8?B?anR4WC9XSjNpd0hCRWZDRWZsUk9CeUNuVGVWRjZKSjB2MWJhVFgzZEt0V0dK?=
 =?utf-8?B?NnVESWg1eTFNeG5nUXJyUmwrNS9YV1VpT2lORXJqU2tJM2VtYUwzQVgwemJq?=
 =?utf-8?B?TTFsWW5JRGptc3Q1YVl6TzJmaHJ6WExGYkJIc3NFdEM4YmMyYmp5a3YvRkJ2?=
 =?utf-8?B?VDFwTG5pTHlicmdQYkJxNTI2NC95SUd3MlNWZENUaFk2bmxObmZlOVRsZ0Vu?=
 =?utf-8?B?RVlmeWRJWWpaaElCQ0Y4TXFtdWVZOWRnTFhWT2NTd0V4bkp0WVNxazBOem84?=
 =?utf-8?B?U05tZENzWTJuZFJBOGcrRERlQTZqWldDczMxUjRBRUtVcEJucitSTjkxTzlM?=
 =?utf-8?B?UCtyQUFLeDhwM3NMTjRUbCtWSFhrNVZUMUxxaWlxdFg0aCtMWkZxWTlJSVpE?=
 =?utf-8?B?QUFBMjRWaVUvZWQyQ2l3SUdJdzJUMURMUnNVM25SUjBoa3k4bEdVUU5qazUy?=
 =?utf-8?B?UWtkYm43UXMxVlcwb0RMdm1wTWFaT2xKNDJlVW93TE4wby82TlRnY0lESVls?=
 =?utf-8?B?djNzb0pPZURMemZyQXZOMGxRSVJPTHFQT2ViYUgrbmpBWEZ6Lzgva2s1OWM4?=
 =?utf-8?B?bC85V2NJMlQ2clVkMGV3eXdYQjZacVZRN25jQ1gyR2dZREpNMEtQVXdCS0pm?=
 =?utf-8?B?R3FGWUpvOE55K1J5Z2k0LzNYc2pJR01uVVoyQTBXZ0V4ZXRCMmk3eklPQkVY?=
 =?utf-8?B?eVVhWjN5bjJSMStXTXRmbGhCeXNRRVFCQkhtbTZCQnlDbzlVV3BEUFkzU2JW?=
 =?utf-8?B?MVRZUkxTbmd3aG51eWxIYkJmcmVqZ0tPOGpValRheEdkZUdMcVJGNk9VRzF6?=
 =?utf-8?B?eDBlQ3J5SGgwa05Jc1ZYQ1FRbk83SFc5K2d5Z0poYVFlazNJdVFWS2QrWmlG?=
 =?utf-8?B?N0JnYzZwVnZTbHBjQUx6YUI1VEJlOVRiQVhWeE5CQU9naWZxKzJoMUpSa2R5?=
 =?utf-8?B?eUUvUWkwY25mZkJJUnlyb0pMWVhLNXNyWE53cGkwS3JVNmVQZnF0T3Z0NEkv?=
 =?utf-8?B?NGh5cXJaQzhyRm4wNW5SNml3ZXFGNEZlUFhHN3VnaERkWnFLZ0lwbXJkR2N2?=
 =?utf-8?B?bXhxalVOcXR6dHdjTmRXSmZPYlpSVWVudVdNc21FUmVYWEtqTFFkYnd4c3NW?=
 =?utf-8?B?YjFteDBXRk1NZWNnNG9waVhPL0tqamEyVG1OcnVFekF6cDhjOGxNaEl3QUdJ?=
 =?utf-8?B?dm1SeStZRFFqWUxxTkZJV1c1ZGhDNU5sd1hJNFRvZnBGNnkyR3JJbklJMEx6?=
 =?utf-8?B?anhUVGVvTFlpdE9FRllBYmhIc3U0bTM1U1puWHA3MDVLSnB2Q1ZqSkZHbWpx?=
 =?utf-8?B?M2hiWUUwUk9Id1FNSkx0SkY1c0lzTXNKeE9nOHZRLzBTWFRRSkVZbWZLTHlk?=
 =?utf-8?B?SitGbXAxZGRCcUZyd3JvU1hIQ05ob2NXcFN4OVFSRVFsQ3liWlNvYXhESEQ2?=
 =?utf-8?B?c0UwdCtQT0NySTlPY0hhaW1oVTNNN1NxK291a28vNERLd3NQcVZQOHI2VEZn?=
 =?utf-8?B?Uk94eXhFSkp4dnFXS1E0WVA0UnVaTU5rQS9rbC9oUFlNWk5TNEVoMVZNcVlS?=
 =?utf-8?B?R0hLc0J6TFRTZnB5YVYxWmlRQWR2THptZGZFaWlSdXlZdGlpSlc4UHpiUjYr?=
 =?utf-8?B?ZUxOcE85Z2xmVGJtVzJrRTVUZHY3NThneDhtL0xlZUNTeTZXc25Cd2hXZml3?=
 =?utf-8?B?Y1JOdDc5SlJMZ1dWR21TaklZSEFaaENHMkdTTU1ySkZRbnU4VXpuWGxEMEpV?=
 =?utf-8?B?YWlQbUQvb0JJd1F0bUg3RnVPSm1CbTBMWDVQbmxNRjRJTno5UVFZVHFOU0kx?=
 =?utf-8?B?aktodDJmRURVRGczQVQ3Z3YzOFBRTjJpQ3cxd1ZhTWRsR0Nnd1NBQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1274e413-09fd-4269-26be-08da276f1cb8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 10:25:40.4123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xU8hTMCl6VDCL/d/e9cW+VeqQMawNROhzFW+Siu/0mCTdY5mwM1bjwfn90Zf+m355EpZr1inhpMt9a6O17vUiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6684

In paging_log_dirty_op(), always update the count of pages field:
- if more pages were specified than the guest has ever accessed (HVM) or
  marked part of the p2m (PV), there's no point for the caller to
  inspect bits beyond the one for that last page,
- if the guest's p2m size has grown in the meantime, the caller would
  have no indication that it may not have caught all dirty bits.

Also exit the loop once having passed the last valid GFN. To balance
overhead and savings, do this before inspecting a new L2 table.

Adjust libxenguest accordingly, albeit these changes are necessary only
for guests which actually alter their P2M size while under migration.
They do, however, additionally open up the option of the hypervisor
eventually zapping large ranges of trailing zeros from the bitmap when
providing it back to the tools.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course this still is far from ideal: At the very least a perhaps
large tail of zeros could very well also result in a reduced page
count.
---
v3: Replace mfn_valid() by !mfn_eq(, INVALID_MFN) (and rebase
    accordingly).

--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -237,7 +237,16 @@ struct xc_sr_context
             /* Further debugging information in the stream. */
             bool debug;
 
+            /*
+             * Counts of bits (each representing a guest page), expressing
+             * respectively
+             * - obtained P2M size,
+             * - allocated bitmap size,
+             * - range actually filled with valid data.
+             */
             unsigned long p2m_size;
+            unsigned long p2m_alloc_size;
+            unsigned long p2m_used_size;
 
             struct precopy_stats stats;
 
@@ -245,6 +254,7 @@ struct xc_sr_context
             unsigned int nr_batch_pfns;
             unsigned long *deferred_pages;
             unsigned long nr_deferred_pages;
+            unsigned long used_deferred_pages;
             xc_hypercall_buffer_t dirty_bitmap_hbuf;
         } save;
 
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -424,7 +424,8 @@ static int send_checkpoint_dirty_pfn_lis
     xc_interface *xch = ctx->xch;
     int rc = -1;
     unsigned int count, written;
-    unsigned long i;
+    unsigned long i, p2m_size;
+    long long ret;
     uint64_t *pfns = NULL;
     struct iovec *iov = NULL;
     struct xc_sr_record rec = {
@@ -433,22 +434,29 @@ static int send_checkpoint_dirty_pfn_lis
     DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                     &ctx->restore.dirty_bitmap_hbuf);
 
-    if ( xc_logdirty_control(
-             xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_CLEAN,
-             HYPERCALL_BUFFER(dirty_bitmap), ctx->restore.p2m_size,
-             0, NULL) != ctx->restore.p2m_size )
+    ret = xc_logdirty_control(
+              xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_CLEAN,
+              HYPERCALL_BUFFER(dirty_bitmap), ctx->restore.p2m_size,
+              0, NULL);
+    if ( ret < 0 )
     {
         PERROR("Failed to retrieve logdirty bitmap");
         goto err;
     }
+    if ( ret > ctx->restore.p2m_size )
+    {
+        ERROR("Guest has grown its p2m too much");
+        goto err;
+    }
+    p2m_size = ret;
 
-    for ( i = 0, count = 0; i < ctx->restore.p2m_size; i++ )
+    for ( i = 0, count = 0; i < p2m_size; i++ )
     {
         if ( test_bit(i, dirty_bitmap) && !++count )
             break;
     }
 
-    if ( i < ctx->restore.p2m_size )
+    if ( i < p2m_size )
     {
         ERROR("Too many dirty pfns");
         goto err;
@@ -469,7 +477,7 @@ static int send_checkpoint_dirty_pfn_lis
         goto err;
     }
 
-    for ( i = 0, written = 0; i < ctx->restore.p2m_size; ++i )
+    for ( i = 0, written = 0; i < p2m_size; ++i )
     {
         if ( !test_bit(i, dirty_bitmap) )
             continue;
@@ -713,8 +721,10 @@ static int setup(struct xc_sr_context *c
 
     if ( ctx->stream_type == XC_STREAM_COLO )
     {
+        unsigned long pages = NRPAGES(bitmap_size(ctx->restore.p2m_size));
+
         dirty_bitmap = xc_hypercall_buffer_alloc_pages(
-            xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->restore.p2m_size)));
+            xch, dirty_bitmap, pages);
 
         if ( !dirty_bitmap )
         {
@@ -722,6 +732,8 @@ static int setup(struct xc_sr_context *c
             rc = -1;
             goto err;
         }
+
+        ctx->restore.p2m_size = pages << (PAGE_SHIFT + 3);
     }
 
     rc = ctx->restore.ops.setup(ctx);
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -74,6 +74,16 @@ static int write_checkpoint_record(struc
     return write_record(ctx, &checkpoint);
 }
 
+static void update_deferred_pages(struct xc_sr_context *ctx, xen_pfn_t pfn)
+{
+    if ( !ctx->save.deferred_pages )
+        return;
+    set_bit(pfn, ctx->save.deferred_pages);
+    ++ctx->save.nr_deferred_pages;
+    if ( pfn >= ctx->save.used_deferred_pages )
+        ctx->save.used_deferred_pages = pfn + 1;
+}
+
 /*
  * Writes a batch of memory as a PAGE_DATA record into the stream.  The batch
  * is constructed in ctx->save.batch_pfns.
@@ -130,11 +140,8 @@ static int write_batch(struct xc_sr_cont
                                                       ctx->save.batch_pfns[i]);
 
         /* Likely a ballooned page. */
-        if ( mfns[i] == INVALID_MFN && ctx->save.deferred_pages )
-        {
-            set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_pages);
-            ++ctx->save.nr_deferred_pages;
-        }
+        if ( mfns[i] == INVALID_MFN )
+            update_deferred_pages(ctx, ctx->save.batch_pfns[i]);
     }
 
     rc = xc_get_pfn_type_batch(xch, ctx->domid, nr_pfns, types);
@@ -192,12 +199,7 @@ static int write_batch(struct xc_sr_cont
             {
                 if ( rc == -1 && errno == EAGAIN )
                 {
-                    if ( ctx->save.deferred_pages )
-                    {
-                        set_bit(ctx->save.batch_pfns[i],
-                                ctx->save.deferred_pages);
-                        ++ctx->save.nr_deferred_pages;
-                    }
+                    update_deferred_pages(ctx, ctx->save.batch_pfns[i]);
                     types[i] = XEN_DOMCTL_PFINFO_XTAB;
                     --nr_pages;
                 }
@@ -365,7 +367,7 @@ static int suspend_domain(struct xc_sr_c
  * Send a subset of pages in the guests p2m, according to the dirty bitmap.
  * Used for each subsequent iteration of the live migration loop.
  *
- * Bitmap is bounded by p2m_size.
+ * Bitmap is bounded by p2m_alloc_size, but populated only up to p2m_used_size.
  */
 static int send_dirty_pages(struct xc_sr_context *ctx,
                             unsigned long entries, bool all_dirty)
@@ -377,7 +379,10 @@ static int send_dirty_pages(struct xc_sr
     DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                     &ctx->save.dirty_bitmap_hbuf);
 
-    for ( p = 0, written = 0; p < ctx->save.p2m_size; ++p )
+    if ( all_dirty )
+        ctx->save.p2m_used_size = ctx->save.p2m_size;
+
+    for ( p = 0, written = 0; p < ctx->save.p2m_used_size; ++p )
     {
         if ( !all_dirty && !test_bit(p, dirty_bitmap) )
             continue;
@@ -522,6 +527,8 @@ static int send_memory_live(struct xc_sr
 
     for ( ; ; )
     {
+        long long ret;
+
         policy_decision = precopy_policy(*policy_stats, data);
         x++;
 
@@ -548,15 +555,23 @@ static int send_memory_live(struct xc_sr
         if ( policy_decision != XGS_POLICY_CONTINUE_PRECOPY )
             break;
 
-        if ( xc_logdirty_control(
-                 xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_CLEAN,
-                 &ctx->save.dirty_bitmap_hbuf, ctx->save.p2m_size,
-                 0, &stats) != ctx->save.p2m_size )
+        ret = xc_logdirty_control(
+                  xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_CLEAN,
+                  &ctx->save.dirty_bitmap_hbuf, ctx->save.p2m_alloc_size,
+                  0, &stats);
+        if ( ret < 0 )
         {
             PERROR("Failed to retrieve logdirty bitmap");
             rc = -1;
             goto out;
         }
+        if ( ret > ctx->save.p2m_alloc_size )
+        {
+            ERROR("Guest has grown its p2m too much");
+            rc = -1;
+            goto out;
+        }
+        ctx->save.p2m_used_size = ret;
 
         policy_stats->dirty_count = stats.dirty_count;
 
@@ -610,7 +625,7 @@ static int colo_merge_secondary_dirty_bi
     for ( i = 0; i < count; i++ )
     {
         pfn = pfns[i];
-        if ( pfn >= ctx->save.p2m_size )
+        if ( pfn >= ctx->save.p2m_alloc_size )
         {
             PERROR("Invalid pfn 0x%" PRIx64, pfn);
             rc = -1;
@@ -638,6 +653,7 @@ static int suspend_and_send_dirty(struct
     xc_shadow_op_stats_t stats;
     char *progress_str = NULL;
     int rc;
+    long long ret;
     DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                     &ctx->save.dirty_bitmap_hbuf);
 
@@ -645,16 +661,22 @@ static int suspend_and_send_dirty(struct
     if ( rc )
         goto out;
 
-    if ( xc_logdirty_control(
-             xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_CLEAN,
-             HYPERCALL_BUFFER(dirty_bitmap), ctx->save.p2m_size,
-             XEN_DOMCTL_SHADOW_LOGDIRTY_FINAL, &stats) !=
-         ctx->save.p2m_size )
+    ret = xc_logdirty_control(
+              xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_CLEAN,
+              HYPERCALL_BUFFER(dirty_bitmap), ctx->save.p2m_alloc_size,
+              XEN_DOMCTL_SHADOW_LOGDIRTY_FINAL, &stats);
+    if ( ret < 0 )
     {
         PERROR("Failed to retrieve logdirty bitmap");
         rc = -1;
         goto out;
     }
+    if ( ret > ctx->save.p2m_alloc_size )
+    {
+        ERROR("Guest has grown its p2m too much");
+        rc = -1;
+        goto out;
+    }
 
     if ( ctx->save.live )
     {
@@ -666,7 +688,8 @@ static int suspend_and_send_dirty(struct
         xc_set_progress_prefix(xch, "Checkpointed save");
 
     if ( ctx->save.deferred_pages )
-        bitmap_or(dirty_bitmap, ctx->save.deferred_pages, ctx->save.p2m_size);
+        bitmap_or(dirty_bitmap, ctx->save.deferred_pages, ctx->save.p2m_alloc_size);
+    ctx->save.p2m_used_size = MAX(ret, ctx->save.used_deferred_pages);
 
     if ( !ctx->save.live && ctx->stream_type == XC_STREAM_COLO )
     {
@@ -684,8 +707,9 @@ static int suspend_and_send_dirty(struct
         goto out;
 
     if ( ctx->save.deferred_pages )
-        bitmap_clear(ctx->save.deferred_pages, ctx->save.p2m_size);
+        bitmap_clear(ctx->save.deferred_pages, ctx->save.p2m_alloc_size);
     ctx->save.nr_deferred_pages = 0;
+    ctx->save.used_deferred_pages = 0;
 
  out:
     xc_set_progress_prefix(xch, NULL);
@@ -698,6 +722,7 @@ static int verify_frames(struct xc_sr_co
     xc_interface *xch = ctx->xch;
     xc_shadow_op_stats_t stats;
     int rc;
+    long long ret;
     struct xc_sr_record rec = { .type = REC_TYPE_VERIFY };
 
     DPRINTF("Enabling verify mode");
@@ -711,15 +736,18 @@ static int verify_frames(struct xc_sr_co
     if ( rc )
         goto out;
 
-    if ( xc_logdirty_control(
-             xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_PEEK,
-             &ctx->save.dirty_bitmap_hbuf, ctx->save.p2m_size,
-             0, &stats) != ctx->save.p2m_size )
+    ret = xc_logdirty_control(
+              xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_PEEK,
+              &ctx->save.dirty_bitmap_hbuf, ctx->save.p2m_alloc_size,
+              0, &stats);
+    if ( ret < 0 )
     {
         PERROR("Failed to retrieve logdirty bitmap");
         rc = -1;
         goto out;
     }
+    if ( ret > ctx->save.p2m_alloc_size )
+        IPRINTF("Guest has grown its p2m too much");
 
     DPRINTF("  Further stats: faults %u, dirty %u",
             stats.fault_count, stats.dirty_count);
@@ -800,13 +828,14 @@ static int setup(struct xc_sr_context *c
 
     if ( ctx->save.live || ctx->stream_type != XC_STREAM_PLAIN )
     {
+        unsigned long pages = NRPAGES(bitmap_size(ctx->save.p2m_size));
         DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                         &ctx->save.dirty_bitmap_hbuf);
 
         dirty_bitmap =
-            xc_hypercall_buffer_alloc_pages(
-                xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size)));
-        ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
+            xc_hypercall_buffer_alloc_pages(xch, dirty_bitmap, pages);
+        ctx->save.p2m_alloc_size = pages << (PAGE_SHIFT + 3);
+        ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_alloc_size);
 
         if ( !dirty_bitmap || !ctx->save.deferred_pages )
             goto enomem;
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -400,6 +400,20 @@ bool paging_mfn_is_dirty(const struct do
 }
 #endif
 
+/*
+ * This is used to provide a rough (upper) estimate to the caller of how many
+ * more pages we might have data for.
+ */
+static unsigned int last_valid_entry(const mfn_t *tbl, unsigned int idx) {
+    unsigned int last = LOGDIRTY_NODE_ENTRIES;
+
+    for ( ; idx < LOGDIRTY_NODE_ENTRIES; ++idx )
+        if ( !mfn_eq(tbl[idx], INVALID_MFN) )
+            last = idx;
+
+    return last;
+}
+
 /* Read a domain's log-dirty bitmap and stats.  If the operation is a CLEAN,
  * clear the bitmap and stats as well. */
 static int paging_log_dirty_op(struct domain *d,
@@ -407,10 +421,10 @@ static int paging_log_dirty_op(struct do
                                bool_t resuming)
 {
     int rv = 0, clean = 0, peek = 1;
-    unsigned long pages = 0;
+    unsigned long pages = 0, extra = 0;
     mfn_t *l4 = NULL, *l3 = NULL, *l2 = NULL;
     unsigned long *l1 = NULL;
-    int i4, i3, i2;
+    unsigned int i4, i3, i2;
 
     if ( !resuming )
     {
@@ -482,6 +496,15 @@ static int paging_log_dirty_op(struct do
               map_domain_page(l4[i4]) : NULL);
         for ( ; (pages < sc->pages) && (i3 < LOGDIRTY_NODE_ENTRIES); i3++ )
         {
+            unsigned long max_gfn = domain_get_maximum_gpfn(d);
+
+            if ( (i4 * LOGDIRTY_NODE_ENTRIES + i3) *
+                 LOGDIRTY_NODE_ENTRIES * PAGE_SIZE * 8 > max_gfn )
+            {
+                i4 = LOGDIRTY_NODE_ENTRIES;
+                break;
+            }
+
             l2 = ((l3 && !mfn_eq(l3[i3], INVALID_MFN)) ?
                   map_domain_page(l3[i3]) : NULL);
             for ( i2 = 0;
@@ -505,18 +528,36 @@ static int paging_log_dirty_op(struct do
                         goto out;
                     }
                 }
+
                 pages += bytes << 3;
+
                 if ( l1 )
                 {
+                    if ( unlikely(pages >= sc->pages) )
+                        extra = (PAGE_SIZE - bytes) << 3;
+
                     if ( clean )
                         clear_page(l1);
                     unmap_domain_page(l1);
                 }
             }
+
             if ( l2 )
+            {
+                if ( unlikely(pages >= sc->pages) )
+                {
+                    i2 = last_valid_entry(l2, i2);
+                    if ( i2 < LOGDIRTY_NODE_ENTRIES )
+                        extra = ((i4 * LOGDIRTY_NODE_ENTRIES + i3) *
+                                 LOGDIRTY_NODE_ENTRIES + i2 + 1) *
+                                PAGE_SIZE * 8;
+                }
+
                 unmap_domain_page(l2);
+            }
 
-            if ( i3 < LOGDIRTY_NODE_ENTRIES - 1 && hypercall_preempt_check() )
+            if ( pages < sc->pages && i3 < LOGDIRTY_NODE_ENTRIES - 1 &&
+                 hypercall_preempt_check() )
             {
                 d->arch.paging.preempt.log_dirty.i4 = i4;
                 d->arch.paging.preempt.log_dirty.i3 = i3 + 1;
@@ -524,10 +565,21 @@ static int paging_log_dirty_op(struct do
                 break;
             }
         }
+
         if ( l3 )
+        {
+            if ( !rv && unlikely(pages >= sc->pages) )
+            {
+                i3 = last_valid_entry(l3, i3);
+                if ( i3 < LOGDIRTY_NODE_ENTRIES )
+                    extra = (i4 * LOGDIRTY_NODE_ENTRIES + i3 + 1) *
+                            LOGDIRTY_NODE_ENTRIES * PAGE_SIZE * 8;
+            }
+
             unmap_domain_page(l3);
+        }
 
-        if ( !rv && i4 < LOGDIRTY_NODE_ENTRIES - 1 &&
+        if ( !rv && pages < sc->pages && i4 < LOGDIRTY_NODE_ENTRIES - 1 &&
              hypercall_preempt_check() )
         {
             d->arch.paging.preempt.log_dirty.i4 = i4 + 1;
@@ -537,8 +589,19 @@ static int paging_log_dirty_op(struct do
         if ( rv )
             break;
     }
+
     if ( l4 )
+    {
+        if ( !rv && unlikely(pages >= sc->pages) )
+        {
+            i4 = last_valid_entry(l4, i4);
+            if ( i4 < LOGDIRTY_NODE_ENTRIES )
+                extra = (i4 + 1) * LOGDIRTY_NODE_ENTRIES *
+                        LOGDIRTY_NODE_ENTRIES * PAGE_SIZE * 8;
+        }
+
         unmap_domain_page(l4);
+    }
 
     if ( !rv )
     {
@@ -565,8 +628,8 @@ static int paging_log_dirty_op(struct do
         return rv;
     }
 
-    if ( pages < sc->pages )
-        sc->pages = pages;
+    sc->pages = min(pages + extra, domain_get_maximum_gpfn(d) + 1);
+
     if ( clean )
     {
         /* We need to further call clean_dirty_bitmap() functions of specific
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -272,7 +272,8 @@ struct xen_domctl_shadow_op {
 
     /* OP_PEEK / OP_CLEAN */
     XEN_GUEST_HANDLE_64(uint8) dirty_bitmap;
-    uint64_aligned_t pages; /* Size of buffer. Updated with actual size. */
+    uint64_aligned_t pages; /* Size of buffer. Updated with actual (or
+                               potentially needed) size. */
     struct xen_domctl_shadow_op_stats stats;
 };
 


