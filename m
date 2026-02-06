Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sP3lOQ8chmlNJwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:51:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5759F100911
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:51:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223660.1531117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voP30-0003oj-Md; Fri, 06 Feb 2026 16:51:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223660.1531117; Fri, 06 Feb 2026 16:51:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voP30-0003lk-JT; Fri, 06 Feb 2026 16:51:10 +0000
Received: by outflank-mailman (input) for mailman id 1223660;
 Fri, 06 Feb 2026 16:51:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8zO+=AK=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1voP2y-0003lb-Cr
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 16:51:08 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06d3514a-037c-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 17:51:06 +0100 (CET)
Received: from BL1PR13CA0374.namprd13.prod.outlook.com (2603:10b6:208:2c0::19)
 by IA0PR12MB7675.namprd12.prod.outlook.com (2603:10b6:208:433::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Fri, 6 Feb
 2026 16:50:58 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:208:2c0:cafe::61) by BL1PR13CA0374.outlook.office365.com
 (2603:10b6:208:2c0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 16:50:53 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 16:50:58 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 10:50:57 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 08:50:57 -0800
Received: from [172.21.218.86] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 6 Feb 2026 10:50:57 -0600
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
X-Inumbo-ID: 06d3514a-037c-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pEXmQJOZLbrdrgablsIQLDZ7E0yuFvX0bnxcyYjbl2w3iYKaXrK91kqmy9ZZ9F9t9zqaqeLsjXRd2FcCmWZSfG6MZ4wODKsB6Y6STNHO/43wZ0pqLA60dIJLVyShq1PjTABoaOs3ODoL/MUvERrMLlubZIM9PDgc+YfFdY5+KLoAk+/qI1k+fCRelrstN24Jm1ptOKyqnKzxa5x/kwC0mbY3V2f72mftuBAPjkz5zihM6ts/dUUWIkdc6YOMyZU1DORbDc5qlQyAXh0p0JkTSMZQDddLULRuoLgSnBlVvZEU/kXlls+NYnAb5IwBcBYOUEAze8oo8LOqTtRtIpDYDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvvMK4Jo0DtuAqT718GzL7NN1KijCPgjnisX+GZoXe4=;
 b=QPZD50emyBEO/vc+3AwQ1dWUy93E0jZdggGZbkGW0mGG79fa1k9xUTuGcsq6lZcMbVWNNhERbRBlv1bnNbWb81nX8QVytDRWP+dNLFQvjzwxvST9ra/5CUom9zyxGZjcs6/2h65vW31Zy4hXBQu4ulyzGkepm8df67Meg+Qglq4ZV/7Udepc3keEEIp4tkELeFs7kEgxZWDqxhB6hWaMOT9mj8MFkl42oNIi4/T4XPGBLtmrGj7aJmaadBGgy/U1rcAmO5S2+y3SDqh0D88cmH8kw2WKOKOI8VCk9SJm6x4hIxVAgnqLzI6VDEMGN0mvbutEgi8cQ/inzBerW9JjKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvvMK4Jo0DtuAqT718GzL7NN1KijCPgjnisX+GZoXe4=;
 b=WPy+I9daKjEaiATVzPLKWag5w9DIM3nwMOLS5sWOxSl5eS03YYmefGsg0UYJtblwSn0wAD52Z85UpVW57y7lrvk1GGTSIxwUI3snCWvIOhwXIqzWdf3i7ug0aqN4o0eVDNghzS4a2XY7Ie9ZtI2DcVkFuJWn/XocLM+V4Tl6L00=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <9aef904b-348b-45e9-be44-afaea6d3eb3a@amd.com>
Date: Fri, 6 Feb 2026 11:50:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpufreq: Add Kconfig option for CPU frequency scaling
To: Stefano Stabellini <stefano.stabellini@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>
References: <20260206013222.4081160-1-stefano.stabellini@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260206013222.4081160-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|IA0PR12MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: a85afc23-718b-43b6-8557-08de659fe6e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UzBEd3FNWXRzMGNIeCttMU9hYTBvbjY2ckpHWkM0S1d3bVYxNFB2aDZzWmli?=
 =?utf-8?B?aXBIRFZDcWNwREZQcTlhRHNjZUEwKzhvS3QwNUlsSWlWd2kzdmloSGc5V09L?=
 =?utf-8?B?bUczbzRjS1RycWIxRkJhMDNReDl4bXNXRE9HRmdsZXJQc2U5dFJNL0FOTit6?=
 =?utf-8?B?MjVyRWRyVld2MGYzaFFzSWFpazRDWlpGeFluL05GSzMvNHV1akxKdVo4UGhO?=
 =?utf-8?B?VjNOM0pUZ1BkWEVNU2RSU09ESEsvaUVGV2t3bWRQcVo2ajBQamxlWTlDcnkz?=
 =?utf-8?B?K01iKzVDOTlLcEtyM1pxWCtQSm45WHVxMVNySzcwc0kxSEpRVU9qL2lnYjZm?=
 =?utf-8?B?QWJVVGREdktCc0VqTFZseFVabFA3dmRHc1p4M0tRUlRibG5yeHFqak1yMDRo?=
 =?utf-8?B?bXNmeWlEOFdIdGM0QVpId0FUS2dtcHJBVzliZVpTYkszQUVkZ3BuZk1kZ2dx?=
 =?utf-8?B?Szhpd1pDbU5YQW55RldoV000YWFnZVh2TGRjaDJKT0VWQi9rcDRWR3hveW9R?=
 =?utf-8?B?LzdMVHhuOU81Um5xbStWTFI0TXRGUlo1OFpUYVZGb3huR3REMHlPRXBkVDlV?=
 =?utf-8?B?Mk9nZk16cHJXcWtaa08wenkxMzdxK0RiKzc5c3kxY0lORVdONU1MdEQ3NUpF?=
 =?utf-8?B?ajZJMEJWNDhxQjN3UldKbWwwNjB3Q1hUT3EwK09OdXZrT0xBSlZIa0pRME5h?=
 =?utf-8?B?bC96MVJBbFdDSjhkZ0NOTGE5ZVA0eFZ3VFc1MUFub2llRGZTNDdQeEZ2MERz?=
 =?utf-8?B?WFVEUmVPbG9mc3JMNjluamxIbEllbEV0M1M0UXhpNE96L09nVmJkY283bXk1?=
 =?utf-8?B?WVlQRVFiS3gvTWVNTitYbVJBMUNkR0pYanc4OHgwYVA4cndZMG9DR3h2MnRU?=
 =?utf-8?B?REJ5dGJIeU1laU9lWXpta1BDRkR3YVNMMHBKVFhMa0psSHNHWTZkeEkxWUsx?=
 =?utf-8?B?Q2ZWZHREUlA0Z0VaVWRWUEh1WldUTVdFaHY1TjVVZms4WXhMajZaa3F4Z05J?=
 =?utf-8?B?d21pYU1ydHoyMkp6TlUxdVROeXVFejBlbGNISU5TTm5PZlRNcUFUM0dXZEdv?=
 =?utf-8?B?dE5GMUNRVHo5VDlnT1JFUk1yNHB3ODJETUIxWG5XVERhUFdEV0tTUG16aVBa?=
 =?utf-8?B?bTNxb3RseTZFR2dGeXNjYTh0VWNNS3NMdWVQM3p4eE9WUWh0SkgxVm9ubGdx?=
 =?utf-8?B?c0w0ay9LV1F0K0FMMFJrQ3FoZXBtc0FKcVdxUEhKQURmdzkycXFSN3Z5ZHhE?=
 =?utf-8?B?K21xWS9vUXdMREdsazc1d0FhbDFabVJENGw0eVhOcnJOZUcyT2hjMXBIYzhz?=
 =?utf-8?B?bS9GczI1Z1lPVGV0SC9MN0twM0NkczJDUHgvU2JaaEFUVDNibnhWYVc2aXkw?=
 =?utf-8?B?ZXNQTzVBOFhFenJkNGNXeXdueGhHVnByRk9mZW5sb1E4cW45T3ZmQWNEUWJC?=
 =?utf-8?B?cHVBVzVQSGVGbGFnVXErMnBWenlnVmhVb05wcXVzS3JhVHdtMXgrcitmZm1t?=
 =?utf-8?B?QUZXaXFkNG5uS3NMOURQWXRPMURzYkFHRGtBdVp3c01nMG1LaGczdDRmbC9t?=
 =?utf-8?B?aU9COU43WXI2cnMycENrZmlkRENpd25pWk9uYzJjdm9vL0JoZUNmVEFJYjAw?=
 =?utf-8?B?ZWlNYVQ1aTlVK0V2U05ETXlYY1k0eWFWVVZFVUZEUmI0ckxReUhYNndkNkI1?=
 =?utf-8?B?VERGQ0NocjN2cE5LVXdyN0VlbWVQeUNlRXZVekhWYjI3UnBoTEM2MGxPbGNh?=
 =?utf-8?B?OVRMNGk2a05Qc21PbS9Ic0tMNVFkbEhhVG9FckhJUkRlNlhPZk5TVzZ3anJl?=
 =?utf-8?B?alpaaEhPNUlUbDEwRDZXWktsNjhYSk9YMkRpZVFQdEVkR0h1NUVQd29uc1ZJ?=
 =?utf-8?B?RmRtR2xMWUNhSk5KbWUweTA4M2d4bXI0WVdwdmh4aW1OUnRHcG4xYzFPQzhv?=
 =?utf-8?B?NndaSFJEajB5RHFxUVNuTzZNZ0NaME5vRzVFenhJblBsM2VCbmlqZHVoSWIx?=
 =?utf-8?B?RS9keDBVbGlCaXFTMDI3dlhJZzFaVkZjOTFIbmJDbHg1THo2T3Z6WDA3R1c3?=
 =?utf-8?B?R0h5NmRCalkvR1lFUGtkcDNXOEtqSGJNbUdaNndyWnNsMHEyM1dsajVwMlZG?=
 =?utf-8?B?a091VVp1TXBHN3FxenJLTnYyYWpHVlU1dkRzK2hLSHhEZWRXWHlxUHBOWHFx?=
 =?utf-8?B?QVBkNXZlbGw1M045MUpNM3hNeHFSSWhZS2xwYi9XMlVsamdSanF4a3JYRXc2?=
 =?utf-8?B?ODJJNHZIUytmS1d0VXBCc3EzcUFRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pf0sRNTSFjUA0GAQSx2vTiAlDJrHzN+t+X6miI+pAzQeW8EWEU3DmHfu/sGbSC9um6l/Qhog5F7ltRETevKqSznedCtlY3KJxlZdHA9fsq8lTRr9R+uySBeLl4ftlMde3O4A+PfUkCJXiCls+YkNwVkNWVWZDEnjLNiszPa2v089Y2uw7YAxRdppvLGTTIwTkUtxZQ50tjpzlK0LzvRCI+Pf8p5tBfPki8axH8PfGcmF4WjHYa2/CZUBTr953PadLD/7ds8ORPPkouoNtrBOmQRzKKmuo79EhUeEtonlMkk2rALlxeeMZkdCUyhE3VUfGHCoUCbRheKFQgr93O/v/24qxrag1PZSEMRb6ztf7irm4xQuRfoCl88LXzyEcrswj3MMb6VyofIrLLUoJrJrZaiSOQr0dGwzHZ4w1Oxt84AF/hKKaVwt90MQJ5n2WmZ7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 16:50:58.0772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a85afc23-718b-43b6-8557-08de659fe6e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7675
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stefano.stabellini@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 5759F100911
X-Rspamd-Action: no action

On 2026-02-05 20:32, Stefano Stabellini wrote:
> Add CONFIG_CPUFREQ to allow CPU frequency scaling support to be
> disabled at build time. When disabled, this removes cpufreq code
> from the build.
> 
> Add stubs where necessary.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

