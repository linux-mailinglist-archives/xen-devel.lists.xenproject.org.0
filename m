Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A25241D9A1
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 14:19:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199818.354101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVv1Z-00054x-UT; Thu, 30 Sep 2021 12:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199818.354101; Thu, 30 Sep 2021 12:18:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVv1Z-000530-RK; Thu, 30 Sep 2021 12:18:53 +0000
Received: by outflank-mailman (input) for mailman id 199818;
 Thu, 30 Sep 2021 12:18:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVv1X-00052a-WF
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 12:18:52 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e32195f9-903a-48e6-9000-7b281227afe0;
 Thu, 30 Sep 2021 12:18:50 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2058.outbound.protection.outlook.com [104.47.4.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-liUTvDdlOv-a8xFeYzXRmA-1; Thu, 30 Sep 2021 14:18:48 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6479.eurprd04.prod.outlook.com (2603:10a6:803:11c::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Thu, 30 Sep
 2021 12:18:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 12:18:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0086.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 12:18:47 +0000
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
X-Inumbo-ID: e32195f9-903a-48e6-9000-7b281227afe0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633004329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pFp9W7xkMIq9TQ4/Odb7qXzfO9m2/t23Esal7KykW2c=;
	b=KE0DKLHZoiPlgh8lz2oYwgwt5wdMYNb3Bh8I542iMcgUu6ZxChZ5ciJBmBETRarejm95bj
	6NG3RhtYz8mW0gS4wAJJ7gN/IYV/N9uc4sfcGlCFSF0SFfL86BNb3mQZD6n3fkQVQD0Q/f
	qoixc6p/0KKgWnFmRerxrAKxjkwORiY=
X-MC-Unique: liUTvDdlOv-a8xFeYzXRmA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CnWQDZXIyZAwX094LDOKe//dgZ79cM/1DWCNUHXz3xRvHz0Nimt5F+6hd38/7uVZpIRjyBI/Ilkf3c7gISrU37COKJPvRdAivsK/S7KcgMRjP0vP4AyQeptdey44vURUa7lXe1G5jQPNmHl7oisBu+7urJRehTtmgUYWWTm6q+7ZMVv2XHT3vPUly1fsG8Ma/0w3VlKxXyrMT2Cw+7FkO6OQ7Mx5vgh1IhndPTAj9UJOwWSvdRMMJPKgvk3yv0+v4DKYoYWaQ0KOopSUX12thU64FNhgqE1yvdxoMew7vfpZXd8h2NkHt7K2Ja2vNn/YkMdtOMWGjLWccBGRRjflVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=pFp9W7xkMIq9TQ4/Odb7qXzfO9m2/t23Esal7KykW2c=;
 b=nhoclBXVO2GNXKVr8A7s6Q3vjD0KoUIFA2WstyrXNlVZY+yvpPUDTixno7Prgs0zOY4MxGrF+juPakpC80QCoW2f0nfUHr+2+mmnmxZPtuCx1GNdzhOpsNBdKuoPFhblqI/BlaGximuBk8g+OB+OREZ1KQ4I7WMmf8iKaz86ndyknMVOLSgZaeeNk+sB//8Ktl0hh5oHoiaB5TAigIO1tbx8jtn4gYh1HwPZaBNfM3GEbrS8KBWZdfTEczo4InBONcBnYm09+HpTr7gq5pN8RiNnuOeQVNsXmzK7milAqtTvDutm+jVSxPt5scAZf/iIt0y6Pl4DrcYz+fDnhPiKyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 5/9] xen/x86: make "earlyprintk=xen" work for HVM/PVH DomU
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <9a26d4ff-80a1-e0c1-f528-31a8568d41f7@suse.com>
Message-ID: <3d212583-700e-8b2d-727a-845ef33ac265@suse.com>
Date: Thu, 30 Sep 2021 14:18:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <9a26d4ff-80a1-e0c1-f528-31a8568d41f7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0086.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f94770a-0387-4e6f-a28c-08d9840c7450
X-MS-TrafficTypeDiagnostic: VE1PR04MB6479:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6479F1AAA2E82534A51E6828B3AA9@VE1PR04MB6479.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lnl0PB5aWWgYLd8eDlWI1/6kXmPf3zO/JHvihmY1pyTPv7XBWBdHERXU2tYvVz05uxSbO36SGz7RlBgMyT0epVBMilxPvEc7Cpoq18fkHqcRTVb9Db9Ny8EVLbickedVCf9KhG/Aamv+wurfhUeQfiCf4mVPAam3UcJ6Wxkm84cZRLNudL1QG+MPSE+9rv6RqGtfNTBCZmVP5roOGWyGHcVytQQfmWZfNKCozU8N9+MnGJXjp4+pQF3ubHNvIXxe2bR/b3wVp2nfrmv6SkdlShpgM0pMeo83eahG5AAZbKF0JE66Zum+TXC8y9YsCdjFCvuSfA0L2zz8N0zYuWff72Qs7UPKfhILP0a/Ifs0fHUdYDVE6i9qNHRWsS3HGzvGb68DyYhk+2Z1UZztF6DUq1xrega8YE1xHt3fqy20B2HuYRJtZDg54fBhAK1N5fZGoKTIYXPXyXMYv7Xtfc1RbZYO2PEJPAz9Vr6hKM8fBxrJ9SgaB60fYK6S8ZwE4NgYEze4JKxxBxDpr1jXislKE/mjhbwFf+pVkuSVnbjovj9/ZMVn8jJBgWaVgOAMsKFF6b8jQpjtH3bUbcWMx2eCgN1jtaH5Mk5Och70uDMF1kOgncQE4VV8/ddSsfDyuvqO6iRO48iCgga8Xop4XQ796eKl2s9qey4g8QVXSzGZ11x3X0QhdkCdpBhr39v5+/XRElKmNDdegYcm3e7qI4ONpgQbvbviB6wp/1DFxTJfsPMOwkSLC8uIyYBKhtqTNRC2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(2906002)(4744005)(86362001)(26005)(16576012)(508600001)(316002)(956004)(186003)(6486002)(8936002)(31686004)(54906003)(4326008)(83380400001)(110136005)(38100700002)(2616005)(66946007)(31696002)(66476007)(66556008)(5660300002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkEwQllJVlN3bXNTRm5hWElnYS8wVE9KMFYwNXR1UmtpczdSS2VsUTFWYVA4?=
 =?utf-8?B?di9PSG44OWlrK0gvbDNteHBXV0ozWmtzcXh0L2NGYThTUWpLOG0rOUxCYUNO?=
 =?utf-8?B?SlNjRFZiRkVNVUJHdGgxd3dwWG1LQklCYlgwQlRwNDgyRVlwOUNvcTBGTFcr?=
 =?utf-8?B?UkFxMEpVL3lrZ2srdHdZZ3h5cnVOZ0dTaFIyUmFMSDI3TUltU0I1bGw1Tmdt?=
 =?utf-8?B?NW9FYzk4WENOMWVLeXBucWhNcUxoZHlmbW9kdWFZY1pPTk4wSEFiOUJ3Wito?=
 =?utf-8?B?Q0VQdmx6eFVKK2t4bTNFL3pYNUlMQlpLYndsMGNIUU9QRFdmNC9tUDUyZUVC?=
 =?utf-8?B?emRJaENKSUlKZFVXN3kxR1NGSGNicE1IeVFtbDBVUXR5QWdYVTBBc0w2Tm80?=
 =?utf-8?B?eXZUSjFXQWEvWkZGWG1qaFcrSnlWbDhIdnJTbXJzV0NlZjdENlNSVE5SMnVk?=
 =?utf-8?B?czBTWGtUYnZhUEdkODR0MFpnWExJRDJYNWQ1bzRDOWM5YnN6bXBGWkpZL3FH?=
 =?utf-8?B?NGVWU3NJZ2c1OTJDbW1FWmtzbDdTZ1JRMzhxeHVuR1lULytIR0MxS1BYUUkw?=
 =?utf-8?B?OUk3NzFEeFNHMEtHMUpJVFRoaHcyVkRVRCtkRFZibGgrYXA0YzJrbW52MzlD?=
 =?utf-8?B?L1RzbElvZG5JbzhNZzlCZnp2NnlYaVZmdk01VVhqMmVYS2dHclo1cmJ4YUl3?=
 =?utf-8?B?aDVXdG53MGdwYWljWkg1bmxxa0UwTWljdXpqcHErdHl0TWQrcWJnUitTdGoz?=
 =?utf-8?B?K3RIZHVtNnp0MUV6K0pMU0JqRGRtSStDV0h2VDlYSWxTeUxxRVRyZk1IYlNq?=
 =?utf-8?B?b0U2S3RncG05a0R0N1NINXJqTVQyU0x3T1B0eTh3MWh6ZGU3em9YVTZwZyts?=
 =?utf-8?B?eTdWWStnM0c5N1A2eGxUMHZkMjlmYWRwOEJMVVBLVW1JRGZ6TEwwdlFmdlNw?=
 =?utf-8?B?OWQ1QWNXM3BLOFdxNDNjakVGOGN5aEZiUVFaY1FiTVhBeDZSekJMZHZvZXdC?=
 =?utf-8?B?ZlYwbGhiam0ya09KR2lRWXIySTFFMXRRaDZ6SDR2RWtJWnIvck1Ja0x0Zzh3?=
 =?utf-8?B?eVVkdFBkcVBZTnZndEpueXJlbE9VTFJueWw2YWdza1Ayai9DeFdpUGp3cW9v?=
 =?utf-8?B?QUpRZHFnOFN5elNta2ZnZENZV1czN0hpVE9zdlR6Y2p0Kzg2dVVLSXU5eDM3?=
 =?utf-8?B?UGYxYTZQOTBZdnB0NnVqOXR0dGdmdllhRzFhalJZdkwyZUNrK2VhNHhlMm5t?=
 =?utf-8?B?V1ZxQlg1SGYvWlp4WFV5dU5aZ3crYlFZdXNoMXY1ODNqZ0dmQlZlWTdOVTE4?=
 =?utf-8?B?L3BRdGpzVEFUanZ3NHcvU2c5SDJXVmtBNkt2N1BERnRnbjk1UTV2T2RqdGFJ?=
 =?utf-8?B?aEFzc25RSmlsZWpnVmNSR01lc3U3OUtQTXlNd3BsZXVTS21FQlJMaXdvNDl0?=
 =?utf-8?B?TVNBaWNZT0hKeElUeFJGaUlzWk5iaURYR1Qxakp6M2I0NjBYaTdkRDZlSmlX?=
 =?utf-8?B?b0pEajRTUVNVeUZGZGQ1YjR2S1J1VFAwMDl5Mk1ZMGJuYzlpSk1tVEdwbUgx?=
 =?utf-8?B?QytEUzVSUXRrOENsRmZNZWZ0RUxVTDNaQkdsNHAwOW9kcHgvZ2ZkZG9RSWk4?=
 =?utf-8?B?U0RrMkFIUjR6aEpnNzlxUER0RWt6emtIQTIwRjFZd1JxRkpzTDdiRUNieG9V?=
 =?utf-8?B?SU1FNnJ3M053Sk1RYlFZM2dsZk8zcFZKK2hEdW1ITHFpN243b2tsU0xsems5?=
 =?utf-8?Q?QYd7NQVN1nvB6JOROPhUhkBEtkeiqfh6cWNiy9I?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f94770a-0387-4e6f-a28c-08d9840c7450
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 12:18:47.6540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6W8VjTPWAIihlQeipm4QJQSRzAg+RJs0zq+VDcl2WuNwOoB7QZeExYb/RG7PEfM1EDse2x3ynSLLhbqEdwznA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6479

xenboot_write_console() is dealing with these quite fine so I don't see
why xenboot_console_setup() would return -ENOENT in this case.

Adjust documentation accordingly.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Juergen Gross <jgross@suse.com>

--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1266,7 +1266,7 @@
 			The VGA and EFI output is eventually overwritten by
 			the real console.
 
-			The xen output can only be used by Xen PV guests.
+			The xen option can only be used in Xen domains.
 
 			The sclp output can only be used on s390.
 
--- a/drivers/tty/hvc/hvc_xen.c
+++ b/drivers/tty/hvc/hvc_xen.c
@@ -618,10 +618,8 @@ static int __init xenboot_console_setup(
 {
 	static struct xencons_info xenboot;
 
-	if (xen_initial_domain())
+	if (xen_initial_domain() || !xen_pv_domain())
 		return 0;
-	if (!xen_pv_domain())
-		return -ENODEV;
 
 	return xencons_info_pv_init(&xenboot, 0);
 }


