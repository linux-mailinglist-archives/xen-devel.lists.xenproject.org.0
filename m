Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C324FB7C5
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 11:37:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302782.516551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndqUK-0008Tm-4y; Mon, 11 Apr 2022 09:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302782.516551; Mon, 11 Apr 2022 09:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndqUK-0008Ql-1x; Mon, 11 Apr 2022 09:37:36 +0000
Received: by outflank-mailman (input) for mailman id 302782;
 Mon, 11 Apr 2022 09:37:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ndqUI-0007jK-Jw
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 09:37:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe4d3d03-b97a-11ec-8fbc-03012f2f19d4;
 Mon, 11 Apr 2022 11:37:24 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-9BhgKYcINt2V84FTkllM0Q-1; Mon, 11 Apr 2022 11:37:31 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR0401MB2457.eurprd04.prod.outlook.com (2603:10a6:3:7e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 09:37:29 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 09:37:29 +0000
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
X-Inumbo-ID: fe4d3d03-b97a-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649669853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QrdD3qAeqW/aeTb5B3y1/J7DaT6w+fqGApWyQhpbnKk=;
	b=Nsv4TpZZr04QG1PdRx/z7EXlQMT263BHa6QTRvBR4muAEtoKPyRxjdQBNiz0Yb3pF4LBWA
	XbpfWnFF6n45yl4cACpQ+D1+UdgpVJ7l4jY+KuES3OclT1NoYD4sCN9Gj0a9yM4UdrpL9Z
	CaXDTecY+qsbAsXER+PEXaFQF0UlRsU=
X-MC-Unique: 9BhgKYcINt2V84FTkllM0Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QgTBgvpR63PNgKhgJ0nQKAd5MNxT7StX6ijlbl1NRG+6QIkeYLqhFfra5FH08k7x2bmvf0PGXfVCKXkz3pjoHkIb+zWY7ateUxnjA+ymQpVPHpbF9qufg4QckXstczQszcY8kqxfzpeLxHvVg+kGOipUkOLWlRRaEqkDYE1cBKSvkSehBBTiSn+TKIItllYUK0qcg2iQ2GR8zsrB87JQ9kq1EV5yq+MboqiuPJJEQn9NnEKCadIHpC9Z1dHErM0ejiTvSFXkjyk1qBSiD7lI/+RZTTZUc9xEYju5n5LDozp01AbCStk3ufDWMoQ+BVWJHtUwJoJt57NnLPFLxCzL/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrdD3qAeqW/aeTb5B3y1/J7DaT6w+fqGApWyQhpbnKk=;
 b=VlYb5LIF8UwdTDCtiRgc1LPc2FbVRjVOylJ5KlfpT5RkDQ/SzFGPNZFArsexdwX+jas2xFwEWU+WAgW6U21geCeJyGojYMsBOftKG2pyE/MS7MEFSveVXj+kQJNZVbADyIQoMwrHTM3PJcBUAfrxOo45sKysxft9XiiQi311vFt5fT6gsBIsbJ8vspi9GQTz55yX1le7mO1oJ98uWbZjuyXW4CCsCIFKRk+8x7PuVQ63p0VLBhPx4WxdUqyrA8ffkVp1SAoL6HQ/tVti8mSalFf+9g0t9p6exe6eFx0+PAza1r78KBu2gRv0+i0rqbSNT76DTgeRaGXVPuFocoqWoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0f7136ae-0b52-431d-f789-4b7d5bbecb25@suse.com>
Date: Mon, 11 Apr 2022 11:37:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: [PATCH 4/8] VT-d: refuse to use IOMMU with reserved CAP.ND value
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
In-Reply-To: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0071.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::48) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7abd9412-85f7-45ca-ae8b-08da1b9ee57f
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2457:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB2457F5F6E91E8535589E73FEB3EA9@HE1PR0401MB2457.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SCt/YgoSKOkcgOM8H8+RLNmkPEZwpkNbY+RwjDd3CCqlkAEPRxR1MbznBlArG7Ck0khu19MmfxLYogLhUzLXuwaCA9GHFYwqFAVbZB5it5wIna1shzUUHAIsjNHw2a3dFRkd0wWKwdhtqCfuy8EEW3ynvheAVpeAf49eVEPCqzHHHgl+WhoeizHnqsPT0llSzXFeV75Cum4HsaePI/iy8r5bnHE3/10qFd4MhJ5SPCsxVdFcz6acvxhfJcCLJE7RrqMUImAo+PehD4ym1Q13HuTQNtnL+BzTmu/ZhCsT8Bzuhy+eR/vfpVDlvDPhX22jhgKLe8tZDwPOgUkNGbaN4VyiETnp1sZk0ZRr1QY9k89OG4FZPwAgl8Un6N++CYyCV+pob7NkMfiZWKyV6eCYn/9jiG++uLKh7YZJBALjbbfqJs3CMmdNbIMi/DMcYf/NzZtpov/zui0Xj3F79LIn8ammU3O3iXqMrhFFHA5okmZWYvxZgTml7Vg3vK9ZYB5GWcBIBwwS6jGgsmg9Pytu4kig0yEROdtDpFZqLSQVZnctAIyMs7VzYNC1bBlRCLiHOB4GqtUlUG+He6PgqXN6FmglKOTfJwNtfF1vm/G303fIea1pusvf+k3d2UU+rD54frGCAFe/II2zTX+iTpH5PKhqkTqrZ0PXMPPdsWOiTA8VitX19yyfAOyT/ZhSt1PmP97xLzVIG3VoMuPdcoKeu874RQMlGDOcA/o+2eFegHlUPy2kX8VnDFWQSyJy0HZz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(66946007)(8676002)(31696002)(5660300002)(6916009)(66476007)(66556008)(4326008)(8936002)(316002)(86362001)(6512007)(6506007)(186003)(6486002)(38100700002)(2616005)(26005)(54906003)(508600001)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cG1jZkowN2JiQWdrdElkMm9KUVUwQzNMK3k2azFUaUJTNFdSTENJNHRZQnI2?=
 =?utf-8?B?VTBpeXlPRmprU0gyQmUyYStaTTlRL1UxOHJPa1puSjFZMFNReGs4YkdzUVR4?=
 =?utf-8?B?Q2twL0JpOGZkZzVVNWdFVCsrZDR6TFhUN0R3KzBYa3h4aDl0a3VBNkNBaHJ5?=
 =?utf-8?B?MUhMeTQraFNhUVVqYStCV29nVXFYMmFQVDRnaUs4VmFKeVMzRHgzd2oyVXp3?=
 =?utf-8?B?d2FNcVZWVGJ2L3lWUEQ2ME9jdFNOVXJnZVR5VFdUTXlZV0VZQ2lEcGQ2TzNQ?=
 =?utf-8?B?S1RCeXFUUXJBeHNQMGozdUF0UHpmaU9odkwrTnk4SlZzZ0hsdU9rU2tVSHky?=
 =?utf-8?B?RlBqNjlzM2tKb3Q4NGFyazl3NnNOUTNSKzV4N1YyU3dzSHNZTHlZNWJqWVp5?=
 =?utf-8?B?RlZ0QkpvRXVxOVQvYUhHY2p5SitHT3NSZFZ4S3ZRRlZnQ2NFSkx2ZHBiUUVl?=
 =?utf-8?B?QmhnMlpPSmVXUUdMcFpSOUJWWi9yN0wrVTZTTkZJVWw2QmJUT2JHOFlzRzh1?=
 =?utf-8?B?SC9SUkxiRnNiaDNBcGl1aVAwb1E3OWd3dTlwQ0lhWER2VzlQc2k2NWo5MExM?=
 =?utf-8?B?M2lsTlhySmVJOVl3eHpFK3RnZHdvK0FGeUdsMEgyQnlTK1I5YTBhTVdRekN3?=
 =?utf-8?B?V1RnaHp3RWVrVGN0KzhBaW1qMldZMjJ6UXYxUk93ZW4xd3NFa0xhUUFyQWRQ?=
 =?utf-8?B?dXI0OWtRZVU5MnR0dDBzMTVJTWlTTVJLdUNMQWl6d0FMNUY3b0FQL09jZXpn?=
 =?utf-8?B?NFdSYWhjcU1GOGZDcVVxb2FvUjd3YjB0Rk5vTytlR3pqa1M0a2h6SEtXUGpj?=
 =?utf-8?B?UGEzMHB5cE1LY0RtbzkwcEhvV3djaDg2bWx3UVhqQmtMN0pRM2cyMjEwbnBV?=
 =?utf-8?B?Z3NnNVlqMkVXM1psRzRmVGR1MTlOc1Y1VkVYbnRYN1JWVlhreXZQd0lFSmFW?=
 =?utf-8?B?RlBzTWtJNXpRenp6RmpSdnBiL3Z1dHp5WmlpTkVlZ3BybS9Ub2tBOE8rMkFP?=
 =?utf-8?B?UkNqcU1FbGl3Q1NrSStkQXMvcUVwSjNPY3FEY3VQek4zZWFkc2pFZ1g4K2Z0?=
 =?utf-8?B?U0tQdUxHU2d2V0lOVTc3MUFNRFVNNC9SUW1wOVpWVTFBWnlyOE1DRWxNeExv?=
 =?utf-8?B?V3VqaU5RTVBLemFQV2NLZk1LcjRwZ3h5T3dZRUtTQlV2RWowRXlTUVNKZ1VK?=
 =?utf-8?B?RFlDaWRqVGxidWxHakNKbVFYVUU3d05ZNUtlTDlNZEtkNU1sNEFycVBrTjdS?=
 =?utf-8?B?WElPaWlWQWRKT3Bpd0ZuNThVMW9TSTl0cHZzUEFRbjRBMCtWVVZmbzBhZldt?=
 =?utf-8?B?Y3p0ZXkwM3dqL1NjWU80a05Tcy9jS2tTVlVMTE40SXVVU2lpdU5McFFEcDA0?=
 =?utf-8?B?Y2oyVldlUFQrN3FwcmtTMkNTTmFyVmpXS2hya2R1WjdiY0Jsb2JTTWJBZmRK?=
 =?utf-8?B?SUpYRWQvaW5IRUl6N0NoSjhDQnJKdk1zY25CdHNlejNERUk5Q1kzMzFBR2R6?=
 =?utf-8?B?Q1pUM0xjQ2tlRElPYlpLdi9pUitMWUZVWko5WWwzOGFzV1VqR0ZJQURMZ3Zs?=
 =?utf-8?B?V0QvaUdJQXdIc0ZkUlFLbFdiK2FXQ3pyajBMVnRoMThSbnpWTVZ3VFlCeElJ?=
 =?utf-8?B?dkp3QlhwdmV5VXJkbXZJaCtOY1dqeEc4eG54T3EyWnNSUHViY2dIcEhzKzly?=
 =?utf-8?B?WE9FQ3gzdS9KVEQxM3NUMGs4QUFYSkRQZUowQzh6V09WY2dwR1JJNk0rZmVv?=
 =?utf-8?B?Z3FyT1BuTVdDR3JMNVZlQzNLSmphL3M3Z2kxUGFIczdQWm9xSFZIYklyOStQ?=
 =?utf-8?B?ei95VWJnaUVBSVZlQ2dnMFJFRCtKRjFMVVdLZnNNc2pCdk83VWpVTGJLU3l2?=
 =?utf-8?B?bExyMXo4a3pLd0tjS0IyRk9XZE1TQlpXd1JUQm9KNnI5bU9JclRpemRkSGFX?=
 =?utf-8?B?cU1oTHdxd05DZUNhUkhNek1LcHFuOFVNQ0xMeDFxOXd0VHJ5Q3cwZ2NLZk9M?=
 =?utf-8?B?VThFN3ErYW1kWCtzZmZWbzlJODh1aXIvenF1ZmY1RkVpQXZTZ0NqSmJxdncw?=
 =?utf-8?B?NzhlZ01Ucm9mc1RRcVJwa1JxTk1nRk1CL0dvOU15TGlpMzBQTWx1VDcwZS9k?=
 =?utf-8?B?L2Ztdk14THNLZTRhTGNHeEJmKzc0ZFYzYjJUdUJUalpRUTdqbkxDODF5Uy9J?=
 =?utf-8?B?VHRWdHF5dVpVcVVmSExZL2pTWEo1TkhKRzNianF3U3NudG5nUnhEV3JuWkxx?=
 =?utf-8?B?Q3ZOemFhTVJUbFlYNVV3RWR0RU9odFhRNkJSSk5hRUJlSi85TkVJclRYMk5k?=
 =?utf-8?B?Q3o1cHY4SnJYandxa2Y4dm05Ly9FUWRGTi90cWVLWFJvVmRPVkowZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7abd9412-85f7-45ca-ae8b-08da1b9ee57f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 09:37:29.6416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hr5IiKLGI3vwuvaSQiQlW+2mYDtoj7/YEruIeyH94txpuARHuldh2CqNVP+HBwsxN1f1BV0TqoMqXWtW+l+j1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2457

The field taking the value 7 (resulting in 18-bit DIDs when using the
calculation in cap_ndoms(), when the DID fields are only 16 bits wide)
is reserved. Instead of misbehaving in case we would encounter such an
IOMMU, refuse to use it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1267,8 +1267,11 @@ int __init iommu_alloc(struct acpi_drhd_
 
     quirk_iommu_caps(iommu);
 
+    nr_dom = cap_ndoms(iommu->cap);
+
     if ( cap_fault_reg_offset(iommu->cap) +
          cap_num_fault_regs(iommu->cap) * PRIMARY_FAULT_REG_LEN > PAGE_SIZE ||
+         ((nr_dom - 1) >> 16) /* I.e. cap.nd > 6 */ ||
          (has_register_based_invalidation(iommu) &&
           ecap_iotlb_offset(iommu->ecap) >= PAGE_SIZE) )
     {
@@ -1294,8 +1297,6 @@ int __init iommu_alloc(struct acpi_drhd_
     if ( !ecap_coherent(iommu->ecap) )
         iommu_non_coherent = true;
 
-    nr_dom = cap_ndoms(iommu->cap);
-
     if ( nr_dom <= DOMID_MASK * 2 + cap_caching_mode(iommu->cap) )
     {
         /* Allocate domain id (bit) maps. */


