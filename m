Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D7D50FA42
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 12:23:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313695.531384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njILx-0007b7-SI; Tue, 26 Apr 2022 10:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313695.531384; Tue, 26 Apr 2022 10:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njILx-0007Z9-OU; Tue, 26 Apr 2022 10:23:29 +0000
Received: by outflank-mailman (input) for mailman id 313695;
 Tue, 26 Apr 2022 10:23:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njILw-0006S6-F0
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 10:23:28 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e952a98c-c54a-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 12:23:27 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-ipV6PnBsNTyxy3yjjMQcPw-1; Tue, 26 Apr 2022 12:23:24 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 10:23:23 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 10:23:22 +0000
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
X-Inumbo-ID: e952a98c-c54a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650968607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Poou7+ywHc4+47fsnUn586v0ma66GxF2Bm5uaMw2apo=;
	b=TqtgYcwvRS73UvUcPWSnbV36c/aHhPnGFPgV0BifDy7twyWu4K2hdcfPQ3CyUWtFr5Qo7+
	5LJioFxhF5NC9IbiJG/1ey7CYIsCvmLlEEUzNTM31bAkNbQKz33a/DvhxEvHUoAJzgnsUS
	VvlYoNivBO5Rc65PFt4Nd7rVl2riz/E=
X-MC-Unique: ipV6PnBsNTyxy3yjjMQcPw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lqkb4fOqLW6z91GNCzD+oIYyhISDu9h7dgaadXi5FqpuISqLwzNqFwwqxVc3qRPNZ7t7qknWslMCnvHqxZVdwfWUJTowN/0BATaBFnUFDrUqUufgHLJdBH6RumldcDERrMPfnFbkOBXnzRGow9RyKv0OYDvoiMfE1vih/6JhSgX16WicLpFZAXGgSJUlAHfJHVwAUqhjXlhZs6eAhbirTuqf3HMapKBlO3V3JRyN7L52yTIJq1aRXeTkQOJhp5ES8Q9AaGr2lnXlt9KI9IBb9Bc2lqMzLhHmuIkY821WbQMpCIzvJA1fPuZhxoL3jTvWSDAlHCL0hA9R7nrUBZW4Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Poou7+ywHc4+47fsnUn586v0ma66GxF2Bm5uaMw2apo=;
 b=OafK9F/udmJjYocg0DJ1QQvIMYy+x4Y00+tCEMUII2OvuZKqLgqFZnqX7PyDyz4cEaO2Fs1XoWvK3n9zReJAlrSDzljO+jycBH1FB+ZkWvD8SB+G82KpnQHL7WnyoGRO0zNcMMVb3T1bfaNM610vY6r42+cSbUfF52qChtVKz5gc/ynBi7OrKUIqX8ivH8yqa3Ue+KEmbvVRmNtGd83/qt4aFn/riSNHkbAQhZrlhcjZU2WvVKS8Zame27hlS8yxSocBPrP6vfgzvzibPg9VkHWlsXKqSxzt96OFsab9Obc+uCabCj9uWk4nkdMZWNy4RfrrOM5+8nl/ETADR0F+Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <53a64a0c-6286-01e5-7eab-1de1543a9241@suse.com>
Date: Tue, 26 Apr 2022 12:23:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v3 3/8] libxenguest: guard against overflow from too large p2m
 when checkpointing
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <a0f019c5-4089-e19c-6041-044d6e93d80b@suse.com>
In-Reply-To: <a0f019c5-4089-e19c-6041-044d6e93d80b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0030.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::43) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8779b6c-4163-424f-eeae-08da276ecac7
X-MS-TrafficTypeDiagnostic: AM7PR04MB7157:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB715742A966EDE938FCDDA2EAB3FB9@AM7PR04MB7157.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2iDo67v2IT0AFej4WUcufwEnd1j90FvqjDMtwKPsfiN4WWbk11eEpVZI8DW4OrlnVmd0xP/4oyOhba0xc1iE1dIMJbvEigeRHmDE22LDS16lc+iZUUMujzUV1M5S654mLWWVq/790AVVKFwv9DxVUr+Cbu7l7961Im8wx1h83hkrVCGXxkYB+hZKZ1XRlMnF7oJm0NEk82p+CcRqFcer68GJWvH7bTHjYRAJBvL6MfTtfHxcX9nxEUAf7091q+zLKktsX/MYxFutsvc7ZmGiu+lA/Le0JaKKmK+aL6IBwOUAtXEruOeBRgdujplzmN21YUWtmzJSFqT8/KcDj+qK5/G9LYBuuj8VodxMNelYFERIF/Ri6qZlsmde7vLM2isUaZ+htdbNqEtiUhIoUVEdLhnlHDsvE9NpcU7E6WDquv3aQD2hZKfnS7N+DmnbtPG5QjkWK5Bw5bL57GMG/hRDv1oqK7nnU44u+7vQ6byeBbZZbu8xpaevgHmVJ3IP7wSQWW4yV3fiZrP9CGb4HLSItM2ugtwOcFInHbtpYK3/U84tLcLaT8A6yjhTdZPAjuwobPctvJQOqSCdoiADky9HPlJGclcCHb8WGThJ2rdNh820BrhyorZFIlXMr6xxjROreaBsblI++RmzU+uoNa4lYGl6DTZXHsooopInG6u0vuzFsUq0jXfCF8lAzcoqBv2DzWZ1BMIRxEObKyTCQPwaut/GrRybbc/GTluEDjQQpoVFor86JjXyzo6NUYU6WL/M
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(66946007)(508600001)(316002)(6916009)(8676002)(4326008)(31686004)(5660300002)(8936002)(38100700002)(6506007)(86362001)(31696002)(66476007)(66556008)(6486002)(6512007)(186003)(26005)(36756003)(83380400001)(2616005)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1BFcXA5ZFVJZ3pOaVZtdzd6VXdIQVUzeFhuUkJHdEttMGVkRGp2OE9kOHQw?=
 =?utf-8?B?N3FWN0RseWlDWUMrMW1ONjFZeE96TGx4MkJ0TklsZ0V1bWZPS2p6d2ZlQ3hK?=
 =?utf-8?B?cGtxVVl3M1NpRHFSV0FoME5DNW8wWEZhTDhYUU5YQjFBSTJVQ052QUhzdkVT?=
 =?utf-8?B?eVFJYmlNTHVDc3BNVDF2Z2Y1bDhpMXJ3SXJFOVdJSmxER0dkVmFoTmpiQ1FE?=
 =?utf-8?B?SGRUZXppQmUxSGRJbzBoMjRBeG9WRnRFdTVudkY0akxMRHF1NGxYMStlWjFR?=
 =?utf-8?B?dE1XeDQ2SEEyeHptcmlLUDhwMTlFZVIrZE1rV0VGYUx6WTRvMy9NRDBXNnp4?=
 =?utf-8?B?MnN5TnlLUjU3SEZDZE9NTzRpbVdSdjh0QXJaNm5EeGtObWVsb28wczlSbld4?=
 =?utf-8?B?NmZzMy9QdDNhV2MzTzAyZTgxOGpkaERDcVlDQWQ4a2crZ3k0R1AyVDZZYVpU?=
 =?utf-8?B?TkYrV1pYejJXUjlvVTdDU1JwL0l6Nk9IU2RTQmg2ZXFPNlJ4MGdNK2NUK2Rm?=
 =?utf-8?B?eVZlY3ZwSzUvOVdOa2prTnBoYTRKSC81WlpKd1NJblA2QTIzK3BJU0lMV0xP?=
 =?utf-8?B?TDQyWkQ4MmNVazE3WEhkSU1CcGFlVUl3L0tzOFJoV0dnMFhPbTQxcC9LK25W?=
 =?utf-8?B?cXJCTXpucmNkQzJZRTVqWlJaUDYydkVnenUvTVhuVWpRWU9FRzUzaStRb3Ju?=
 =?utf-8?B?ZlVFNGkxTXJSNlZrZkZnUG15OFZUei9ER2FJaVFWZDN5Y2JpRWFscWsweURE?=
 =?utf-8?B?c2d1KzFrbTdWV0ZNZWFlMXR2OUVTUTZGYURpblE3bkhLK0dLM0trQ0kyTGw2?=
 =?utf-8?B?OGVwTkdJRTBSWHJLK3hmSVV1am9xY2V2N045R3lSR2orNVU5d1pLaGN6U3ZS?=
 =?utf-8?B?LzFKczRyWDZmaWF2Nkc0WkVubmJXcExFNWhLVkM5MlBldkVGblhLRS9HbEVq?=
 =?utf-8?B?akhHVDQxVEJHeW1lRERxWCs4U2JMMk8vdEcvWDEwZ1FBNUJva0RqZDJaeE5m?=
 =?utf-8?B?NGRwUDZkQ0I2ZzFOWVRpVnlnVkVmdmVyUUJBSGpNbjJlWHR4REE1Yi84WFh6?=
 =?utf-8?B?SE1SVVk2N0xFZDN5Sm9ITFZNNVpibmZ3eW96UnhLTGpYUzFSWDhWb3JSOEpY?=
 =?utf-8?B?RUtUMEt5eXhGOXRzOExUOUZES0E3Uzl1aEdraGV5SVZaRGN2d3lZSmQ4UVNL?=
 =?utf-8?B?NWVpNlZZRGxxUHdmZnZYMVJ1V1F1Nlowb1VqNDFsOWNOcUVlSlE4a0hKUWl2?=
 =?utf-8?B?dXgxQ1A1d042U2ducUN3NUtEVnptbE9senVDZzczUlkzT05WN1RtQ1JCeU1N?=
 =?utf-8?B?MS93blgzNmNiT1VHZE15ZHczaDIrVDViOVcvM1A1VGFYRDJ2Mm1mSzFuMzd5?=
 =?utf-8?B?c3V5WDdGdXAyMmdON1VtdFBNSmhwUkhqaW1RaC9VenM5TlBmVHhpb0ZaSTN4?=
 =?utf-8?B?RTRaTGRpSGpscVRNWjVmbC90VXFPVWZUWXhiaUJYVUcvOXJTb1M5eGtDNFFW?=
 =?utf-8?B?c1EzMUorRFpEWGZmcmNGb1VmRWltbU5TeUdmNmp6L3E3UXpvNVN1YXRlL09W?=
 =?utf-8?B?MmVLQkJIMU0weE8zcWZiUWtVbWN6MjJZYnE0SGFiVmRwbXh3bWJkZk9OT25M?=
 =?utf-8?B?amt4UmJTZ3pDOFZqd0NvMUtVVHRLOGVnTVVISDNTdGlPb0ZMWFBkK1NNenZw?=
 =?utf-8?B?VVJMcXkvUnNZWXJzbUdJTkpFQWR0Wjk0bU1UdjJqbjhHaTFwWG5vZi9OSHho?=
 =?utf-8?B?eGdvTjg0QWFCQzl2eE9LZmxnSi9RV3dSY01RNVVUS2E2dFpzcVlNYytYU2RW?=
 =?utf-8?B?ZmhxZU9FQ1hzWi9OVVpQUkhzaWY2K1JtLzhJaDZ4Wk5VVTh1aVBSd01aTTJD?=
 =?utf-8?B?Wis2cW5Qc3FhUEVaa3BQc0pESVRYb3lpVHhnd1VxTlNtZXhTZEorS1M0RVFt?=
 =?utf-8?B?Yi9SVDRCSTEzWll0YjJidkNvaWdPL3JkVVRSMlplUFBQYTBoYzI2Rjd2M1RX?=
 =?utf-8?B?WWdIMWFjOWp5TmNDTXVzNGFGVjFqS2lkbmhPbjQwMVhRTG5IVU1ydmFUb1hB?=
 =?utf-8?B?K0dGTEU2dERTZXdudGJDTU1CS1FYQloyUEhiUlRtVFIzaXYxdlhTYWdrQkVD?=
 =?utf-8?B?dkw3TDB6Mm5sZmFvcHNtc0h4S2FwQnZ1U05mWGk2NW9mUDZuQmd6MWJ2Ujkv?=
 =?utf-8?B?VEpEaHBNZ2ZGZWh2S1hyQTJsM05YaHlQSDY4cUJyaGJ3MHpubExLdHBUNmxx?=
 =?utf-8?B?Uk5DeWN0akZJSFpucWxCbSt1MHlJejFRbmJRK01Fc2tVWmlPMVhjNkFxOEl2?=
 =?utf-8?B?dGZQb2crZG1yTis1QjlnZEZOOFB0bTRnRDVmanR4UjBPY25hbGUwQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8779b6c-4163-424f-eeae-08da276ecac7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 10:23:22.9270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YFzjwZRNhgVTL184s5Lrk72Zyjz+NI+Ea3fjUTe+UATCcnmHkyUQr9AKcTLuNdxUhjArOeLBjqvzv9XtS5E4Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7157

struct xc_sr_record's length field has just 32 bits. Fill it early and
check that the calculated value hasn't overflowed. Additionally check
for counter overflow early - there's no point even trying to allocate
any memory in such an event.

While there also limit an induction variable's type to unsigned long:
There's no gain from it being uint64_t.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course looping over test_bit() is pretty inefficient, but given that
I have no idea how to test this code I wanted to restrict changes to
what can sensibly be seen as no worse than before from just looking at
the changes.

--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -424,7 +424,8 @@ static int send_checkpoint_dirty_pfn_lis
     xc_interface *xch = ctx->xch;
     int rc = -1;
     unsigned int count, written;
-    uint64_t i, *pfns = NULL;
+    unsigned long i;
+    uint64_t *pfns = NULL;
     struct iovec *iov = NULL;
     xc_shadow_op_stats_t stats = { 0, ctx->restore.p2m_size };
     struct xc_sr_record rec = {
@@ -444,16 +445,28 @@ static int send_checkpoint_dirty_pfn_lis
 
     for ( i = 0, count = 0; i < ctx->restore.p2m_size; i++ )
     {
-        if ( test_bit(i, dirty_bitmap) )
-            count++;
+        if ( test_bit(i, dirty_bitmap) && !++count )
+            break;
     }
 
+    if ( i < ctx->restore.p2m_size )
+    {
+        ERROR("Too many dirty pfns");
+        goto err;
+    }
+
+    rec.length = count * sizeof(*pfns);
+    if ( rec.length / sizeof(*pfns) != count )
+    {
+        ERROR("Too many (%u) dirty pfns", count);
+        goto err;
+    }
 
-    pfns = malloc(count * sizeof(*pfns));
+    pfns = malloc(rec.length);
     if ( !pfns )
     {
-        ERROR("Unable to allocate %zu bytes of memory for dirty pfn list",
-              count * sizeof(*pfns));
+        ERROR("Unable to allocate %u bytes of memory for dirty pfn list",
+              rec.length);
         goto err;
     }
 
@@ -479,8 +492,6 @@ static int send_checkpoint_dirty_pfn_lis
         goto err;
     }
 
-    rec.length = count * sizeof(*pfns);
-
     iov[0].iov_base = &rec.type;
     iov[0].iov_len = sizeof(rec.type);
 
@@ -488,7 +499,7 @@ static int send_checkpoint_dirty_pfn_lis
     iov[1].iov_len = sizeof(rec.length);
 
     iov[2].iov_base = pfns;
-    iov[2].iov_len = count * sizeof(*pfns);
+    iov[2].iov_len = rec.length;
 
     if ( writev_exact(ctx->restore.send_back_fd, iov, 3) )
     {


