Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F35F9B11543
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 02:32:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056713.1424729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf6Lu-0006K9-PS; Fri, 25 Jul 2025 00:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056713.1424729; Fri, 25 Jul 2025 00:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf6Lu-0006H2-Ku; Fri, 25 Jul 2025 00:31:58 +0000
Received: by outflank-mailman (input) for mailman id 1056713;
 Fri, 25 Jul 2025 00:31:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uf6Lt-0006Gv-7m
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 00:31:57 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20628.outbound.protection.outlook.com
 [2a01:111:f403:2415::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c22cb764-68ee-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 02:31:53 +0200 (CEST)
Received: from LV3P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::14)
 by PH7PR12MB5733.namprd12.prod.outlook.com (2603:10b6:510:1e0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Fri, 25 Jul
 2025 00:31:49 +0000
Received: from BN3PEPF0000B06E.namprd21.prod.outlook.com
 (2603:10b6:408:234:cafe::1c) by LV3P220CA0014.outlook.office365.com
 (2603:10b6:408:234::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.31 via Frontend Transport; Fri,
 25 Jul 2025 00:31:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06E.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.1 via Frontend Transport; Fri, 25 Jul 2025 00:31:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 19:31:44 -0500
Received: from [172.18.231.84] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Jul 2025 19:31:35 -0500
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
X-Inumbo-ID: c22cb764-68ee-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDO0c7diJZDJqisNp1gD7HxXokrRnW/Vh8OHjAPLOKnGps7K+A+M/uRX3ixe0PxJMWYmbCTuDvtyNB/rEcqVr42OhYuxwKQkKAtjoCmJGqDJ570AaXKi7c+4IJgBfJVrjAWK91r3BucntcagxbXdWKdrKAzsYoSCygy+7siy3uYDw4f70Pm0xGxndC8b3WgD6dEp8h66K8Z2WPj4/W4FgnLstIJgw0ZMMEj0+HeZEXWzZ/ad5+ux7a554Xan/KrZxPo0oQpXdMZRClUu59CvfYTJhlgRTkdZChkiVz+lde7xKUnCfUi2mUkoAz6oGcpLvvRwBeI6G0QIllwmzpEr1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Phdy9LBbjgmEusBukCQ0Bu5G7VwHfIazr3cOoa1UbPA=;
 b=mMQud1AzlcQk4bpxCaPrlQSihVMCWmK2JuGvMvfJ5nBKDYjVCfkVV4Hts3vMNyq/vBzUj2GxKDAcIK2eWYtoL2LYQDRV50W5pB9AJIIjVQUcYxB+ibTgGeDDV68kvD5fGvN5eChSl7yxFcU+fQVBpnh3YLPFhwSRimKU2M4BNCvy8yaj5cokMUBnklfprXZ4gFWyc/fwhJKF+78U5ctr12H/U50+Rh7x1HRPLbwdcdrdcVjlCm8gxDVVrstGuh5uyqqv4X1uN+lnSc8/ojAvaN4nzaHCZhrIZgTHLdlY5GtkQGEvRe4RpMw1Oxc2rxfOn5N/iV3QO4gAaJQWGA/u6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Phdy9LBbjgmEusBukCQ0Bu5G7VwHfIazr3cOoa1UbPA=;
 b=VbF/8eVEVndaSWHuDQwa5QllhEIfWCh+kshifPmZYyXHVGYylA5gJfCDeRvffq39z8KeArSo24dDQFhdiigdtBVnu+LwErrbzPG3bFpxpw7WOPUnWwHSOhCaB/ThZNEUnrQ6YS7ACn6b+Uwb19jVhlez8Byct/Ygh5MVhNiP1ps=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ef0e3aed-453a-4930-a8ff-152748464c43@amd.com>
Date: Thu, 24 Jul 2025 18:48:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] tools/xenstored: add server feature support
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250722140628.28947-1-jgross@suse.com>
 <20250722140628.28947-5-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250722140628.28947-5-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06E:EE_|PH7PR12MB5733:EE_
X-MS-Office365-Filtering-Correlation-Id: 20a0892c-24cf-4bff-7a13-08ddcb12a4ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d1VrSGVTYVVYWk1WN0xGT2N5bDJuc001aXpncDIxMUZVMURWUVVoZkpYOTNF?=
 =?utf-8?B?ZmdaWFVsSUdaSFlGM3FscEJ0SnMwZWI3bTJQYzJZSGZ1b2grYTlrZENhYzRm?=
 =?utf-8?B?aFczWUhmdHVnY0lzQlpXU1RtTVhJNDFGSEpIMWdYMGJHRmdDRTh2Mi9EeWdX?=
 =?utf-8?B?UE9yYXlwQThlTEIvWnF6dGRxTFYrQ21jbG80dlVGb1ZyMFJiNkZpQzVKK0xu?=
 =?utf-8?B?WlIxR0c1VXFVWGZ5cUM1K1Fxa3VkcmFNYk5RQ3kzYm5ueFhXVlgxS0NQcjVK?=
 =?utf-8?B?d1JJSzN6dk5Wa2o0K3hjeWpDYUMvZzBCclNFMXRiYmUyR2J1QkdQdVF4ZUd3?=
 =?utf-8?B?OUpEeTNIQ1hjek56ZmJYcFdVa0tFOTM2cXU2Z2diMzM2MGZiRWZVQ3VyTFhW?=
 =?utf-8?B?Vzh6VkF5UGFDUDJYa0pvUUR0Z29Gd3g3SWRZRjhQS3R2SkhKdmxDRGt4SkJL?=
 =?utf-8?B?d1hyc2VQMjAxcFRUR0QrZnBOeHVlQnpJRytFYmd6MmdNSDg5QWFZNmFLSGQ3?=
 =?utf-8?B?Y3VXbWZ6bk9vcHhWTGp4UUtlUldVSmNkdzZXNXZRSU9hVFdYK0Y0UVhNbThw?=
 =?utf-8?B?SS9BQ2JCamNoK09yREFhVkQ2TlQ5YWl1dVhCbnowVXZXQ3pFT1Fvc3AvblBB?=
 =?utf-8?B?TVRRSFRiSWU2TTBRL2svKzlKUUphVFRoZnRWSlVnY1IyTEtYRGw2ZFVnKzlr?=
 =?utf-8?B?R3lqNHVGUnNMYlhxZGtsL3A2TDBNMS96S0J6d3RrTXpMOWlWYkJPWVFGU2NT?=
 =?utf-8?B?czVtSkNhUEJES2ozSVh0L2FCS2ViUmxzWkRWcHRWd0Y1bHFiQlhSb3ZvR1U4?=
 =?utf-8?B?QWhFWSs2YjZuSWhDL1dVd2piRDBUQmY0ODRDN25ieVhUSnNzNC9NVnp4TGgx?=
 =?utf-8?B?YW5yR3VnVm9LTE53cEc5djU3RU05b3N2akxMT0lTLzUyRDN1Y29pR2ZNQXRH?=
 =?utf-8?B?dC8vVkRleWtRMmxrR2M4ZFlDWTYzTk0xaHdMbHRMVjVkbGtsZEtrMHZBRG5p?=
 =?utf-8?B?dCt3aHRnTzcvK3Y0OVFWelhRb0tQNk10QTZDT3pxZGlqcWE5U0RWN2VSbFgx?=
 =?utf-8?B?OUpsUXhYNWFqNEJTOUp0M2xLaEEwMkF2c0xiaHZsZUxZN0t0aFN2QlZ3ZC9y?=
 =?utf-8?B?enBxL01NRWgyRXVFQjlDOXRDRW9TNnVZeThNdWxoNmczck5LTnZzR1V1UTJN?=
 =?utf-8?B?MXNCbENKOWVIWUsvMkErMkpOVnF2c01NMy9CMlp1T2trNWp4azh6M3h3QWZB?=
 =?utf-8?B?ZHFubm1hNEwvT01NWGZQeTRyNmZlaVlsT1ZlZ3hsTDhyUEhoVHFvamJUaGhT?=
 =?utf-8?B?aHpzUUxTNGt5UnpuNmxLV2RXb2ZEcU9CTWtuY3A0WE5kQlVYR3lQZ09uNDgx?=
 =?utf-8?B?T3gzdmxINGlTUXQxeDhnQlM2THZPVHlVTVVpRTRYMDlGSkFJSEZpR3pPMi9E?=
 =?utf-8?B?cy9keUJEY1NmbTR5UUJGYlZuSXMyOTgwRGZPN0NHSGhEYjNSRHJReFA1Mkd4?=
 =?utf-8?B?R1ZtQWtSaGJkdWVVWisyeWl1QjNMaHRkQmZMMEtLUVdoVURqaEhhZjcxQ1V0?=
 =?utf-8?B?NUZERFJKKzE4d2UvZk9RNTlPblF2ZHQzVTA4UFNTbWJPWUN6dEtnQVM2dGlp?=
 =?utf-8?B?ZXNWdFJuaFZvblZsdEdQUmt2cnFaL0RiUmgxZ3NINVNPM0dSdlZiTTBnYWtW?=
 =?utf-8?B?T0xrMFo1RWNWczRLQWpVRlp0SC9jRXptMGN3V1FCRlZ2T2ttM3BEbUs2N3Zq?=
 =?utf-8?B?UmJiNythMFRsU0I0SGdvSDZCbEtuZWJPck5HMDJSQXlvWWFyN0srWmJJVnlF?=
 =?utf-8?B?UW5VUGpNbVVoYThVVG52NkxmNm1JaFNkaXFlVFF3TlNZR2pxU0JIdjBpV1o4?=
 =?utf-8?B?bVgyN2hDZitTQ1FJdU5ZR2M5S3VjL3FkWC9xMENDSlJXL0VVeE1NaUN5MDJ2?=
 =?utf-8?B?VnlJVXU4MEhNbXF1R3JyUTZOMitzUHIxYkdXWTlCd3lxNGhtc2NRSmpvUDdH?=
 =?utf-8?B?c1NMdXpTMUVSYUpaVUFmOE5wRkVSWHkrd2Y2aXovSnJyWFB3N1ZXQ2s4UjRD?=
 =?utf-8?Q?zhpg89?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 00:31:48.8805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a0892c-24cf-4bff-7a13-08ddcb12a4ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5733



On 2025-07-22 10:06, Juergen Gross wrote:
> Add per domain server features, which are initialized by the supported
> features at domain introduction, or by live update from the migration
> stream. This requires to add the DOMAIN_DATA record to the migration
> stream, but for now it will only contain the feature word.
> 
> Advertise the Xenstore features to guests by setting the appropriate
> bits in the ring page.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   tools/xenstored/domain.c | 71 ++++++++++++++++++++++++++++++++++++----
>   tools/xenstored/domain.h |  3 ++
>   tools/xenstored/lu.c     | 14 ++++++--
>   tools/xenstored/lu.h     |  2 +-
>   4 files changed, 80 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
> index e1d5e8d614..f6d24bc13a 100644
> --- a/tools/xenstored/domain.c
> +++ b/tools/xenstored/domain.c
> @@ -32,6 +32,7 @@
>   #include "transaction.h"
>   #include "watch.h"
>   #include "control.h"
> +#include "lu.h"
>   
>   #include <xenevtchn.h>
>   #include <xenmanage.h>
> @@ -42,6 +43,8 @@
>   #include <mini-os/xenbus.h>
>   #endif
>   
> +#define XENSTORE_FEATURES	XENSTORE_SERVER_FEATURE_ERROR
> +
>   static xenmanage_handle *xm_handle;
>   xengnttab_handle **xgt_handle;
>   static evtchn_port_t virq_port;
> @@ -115,6 +118,9 @@ struct domain
>   	/* Event channel port */
>   	evtchn_port_t port;
>   
> +	/* Server features supported for this domain. */
> +	unsigned int features;
> +
>   	/* Domain path in store. */
>   	char *path;
>   
> @@ -799,6 +805,7 @@ static struct domain *alloc_domain(const void *context, unsigned int domid,
>   	domain->unique_id = unique_id;
>   	domain->generation = generation;
>   	domain->introduced = false;
> +	domain->features = XENSTORE_FEATURES;
>   
>   	if (hashtable_add(domhash, &domain->domid, domain)) {
>   		talloc_free(domain);
> @@ -992,7 +999,8 @@ void ignore_connection(struct connection *conn, unsigned int err)
>   {
>   	trace("CONN %p ignored, reason %u\n", conn, err);
>   
> -	if (conn->domain && conn->domain->interface)
> +	if (conn->domain && conn->domain->interface &&
> +	    (conn->domain->features & XENSTORE_SERVER_FEATURE_ERROR))
>   		conn->domain->interface->error = err;
>   
>   	conn->is_ignored = true;
> @@ -1078,11 +1086,14 @@ int do_introduce(const void *ctx, struct connection *conn,
>   
>   	domain_conn_reset(domain);
>   
> -	if (domain->interface != NULL &&
> -	    domain->interface->connection == XENSTORE_RECONNECT) {
> -		/* Notify the domain that xenstore is available */
> -		domain->interface->connection = XENSTORE_CONNECTED;
> -		xenevtchn_notify(xce_handle, domain->port);
> +	if (domain->interface != NULL) {
> +		domain->interface->server_features = domain->features;
> +
> +		if (domain->interface->connection == XENSTORE_RECONNECT) {
> +			/* Notify the domain that xenstore is available */
> +			domain->interface->connection = XENSTORE_CONNECTED;
> +			xenevtchn_notify(xce_handle, domain->port);
> +		}
>   	}
>   
>   	send_ack(conn, XS_INTRODUCE);
> @@ -1849,6 +1860,54 @@ void read_state_connection(const void *ctx, const void *state)
>   	}
>   }
>   
> +static int dump_state_domain(const void *k, void *v, void *arg)
> +{
> +	struct domain *domain = v;
> +	FILE *fp = arg;
> +	struct xs_state_domain sd;
> +	struct xs_state_record_header head;
> +
> +	head.type = XS_STATE_TYPE_DOMAIN;
> +	head.length = sizeof(sd);
> +	memset(&sd, 0, sizeof(sd));
> +	sd.domain_id = domain->domid;
> +
> +	if (lu_status->version > 1)

Is this why you expose lu_state below?  I can't find any other use.

Are you guaranteed lu_status != NULL?

> +		sd.features = domain->features;
> +
> +	if (fwrite(&head, sizeof(head), 1, fp) != 1)
> +		return 1;
> +	if (fwrite(&sd, sizeof(sd), 1, fp) != 1)
> +		return 1;
> +	if (dump_state_align(fp))
> +		return 1;
> +
> +	return 0;
> +}
> +
> +const char *dump_state_domains(FILE *fp)
> +{
> +	const char *ret = NULL;
> +
> +	if (hashtable_iterate(domhash, dump_state_domain, fp))
> +		ret = "Dump domain error";
> +
> +	return ret;
> +}
> +
> +void read_state_domain(const void *ctx, const void *state, unsigned int version)
> +{
> +	const struct xs_state_domain *sd = state;
> +	struct domain *domain;
> +
> +	domain = find_domain_struct(sd->domain_id);
> +	if (!domain)
> +		barf("referenced domain not found");
> +
> +	if (version > 1)
> +		domain->features = sd->features;
> +}
> +
>   struct domain_acc {
>   	unsigned int domid;
>   	int nodes;
> diff --git a/tools/xenstored/domain.h b/tools/xenstored/domain.h
> index 844ac11510..8bfaca8f90 100644
> --- a/tools/xenstored/domain.h
> +++ b/tools/xenstored/domain.h
> @@ -162,8 +162,11 @@ void wrl_apply_debit_direct(struct connection *conn);
>   void wrl_apply_debit_trans_commit(struct connection *conn);
>   
>   const char *dump_state_connections(FILE *fp);
> +const char *dump_state_domains(FILE *fp);
>   
>   void read_state_connection(const void *ctx, const void *state);
> +void read_state_domain(const void *ctx, const void *state,
> +		       unsigned int version);
>   
>   struct hashtable *domain_check_acc_init(void);
>   void domain_check_acc_add(const struct node *node, struct hashtable *domains);
> diff --git a/tools/xenstored/lu.c b/tools/xenstored/lu.c
> index 2c6adecb56..77e0d377c5 100644
> --- a/tools/xenstored/lu.c
> +++ b/tools/xenstored/lu.c
> @@ -21,6 +21,8 @@
>   #include "lu.h"
>   #include "watch.h"
>   
> +struct live_update *lu_status;

This is where you expose lu_status.

Thanks,
Jason

> +
>   #ifndef NO_LIVE_UPDATE
>   
>   struct lu_dump_state {
> @@ -30,8 +32,6 @@ struct lu_dump_state {
>   	char *filename;
>   };
>   
> -struct live_update *lu_status;
> -
>   static int lu_destroy(void *data)
>   {
>   	lu_status = NULL;

