Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 734C846A0CA
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 17:10:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239326.414812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muGYr-0000Mu-Oc; Mon, 06 Dec 2021 16:09:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239326.414812; Mon, 06 Dec 2021 16:09:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muGYr-0000L3-Ko; Mon, 06 Dec 2021 16:09:53 +0000
Received: by outflank-mailman (input) for mailman id 239326;
 Mon, 06 Dec 2021 16:09:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muGYq-0000Kx-6R
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 16:09:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0dd389e-56ae-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 17:09:50 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-rt8v_X88P3aRRumxyH_ncQ-1; Mon, 06 Dec 2021 17:09:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4382.eurprd04.prod.outlook.com (2603:10a6:803:73::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 16:09:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 16:09:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0205.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Mon, 6 Dec 2021 16:09:45 +0000
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
X-Inumbo-ID: f0dd389e-56ae-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638806990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gwHfPBo0d9s7C8a5NxcBva7KOBPhUBVBC5hZqQePnWw=;
	b=UhYnAaT+q2xeP10/ElDsPoUI/sCPTeHJYQMqbIHnVMZ4qzHf6393kwpUH6QJffJszAY67Z
	o/4KPguijiae65ItoR7oqSqvolqfkcbcUcIleNHVIYrm/0klPt3OSOvBK+p/rIznjv11m5
	w0wC6oPrR3GIT3ocErF+/PDYHWyxw00=
X-MC-Unique: rt8v_X88P3aRRumxyH_ncQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bzD7jXEKwiy63JldO5/gySVXtRt5PyAflI3FeUarfG3LrrpSqz3zn1tsKOktgifJjay7Nyq8hp2wnxshOn0COPvhOPG8kox1JR47SFqwPCMUPsj5/knLn3wuzIgmtddJqKoPG15POAqcZC/9htEnOgVq1zCpwE8+XEDPDa9RQooxH975arVs9T9N10JaCgTY8Ba1Wy90WMnJqPQZ4KhzBdSviUbuECJ0wEzTNvWVZ5J5pomzNKzmemqY2EFvWnlsbDXnZo3JbXBe89SxDgJnf6nDqZy6T+R4IgKHOcv2QzQ6pY6ha5aFwp/5u2l6C7tA9+0jUtz4ydlEdh2i0BPMVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwHfPBo0d9s7C8a5NxcBva7KOBPhUBVBC5hZqQePnWw=;
 b=aG6eRdUeCMf19CYui0RhZQCqM6JMyQeUy5VYLlF3gQqVmsEwCk+3c/m9PJqw7AIl5WDU2ZvCh88B7+TlXqA32O3t5mBF5m252CNoDTrXxsx8DNcGOIt4XGt9jXQnG736oJJGK96vDu4IjABHJVxuRqqMlllrvp4VtTgOk86y+C7g/0gyF/nM0vlaEuI5dl3xC64iSrLvh0Qik6PQwCl55iYVajCgRUqtWvkJaHsqD9jmcC+SsG5DMd1qrPuvSsVqKEN4X2OaDIm9lhNUxDrl1H9oSgU9ixgfdqTO4MRnTdl7WIGDzwplV2PcpJZODx1gzO0j7L3fJsu29PcqfOJarA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <205f13b4-6f2e-7937-7fc9-f1ce7082ae3f@suse.com>
Date: Mon, 6 Dec 2021 17:09:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v5 07/12] libs/guest: introduce helper set cpu topology in
 cpu policy
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20211129153355.60338-1-roger.pau@citrix.com>
 <20211129153355.60338-8-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211129153355.60338-8-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0205.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3008af30-0e6a-4e84-d29e-08d9b8d2d208
X-MS-TrafficTypeDiagnostic: VI1PR04MB4382:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4382F4C6AEA4EC8047048205B36D9@VI1PR04MB4382.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gOvPwJvmKh/sTLyVQNtDU/azKZ95gZ8DUrPQcIMd6jGlcWOh9jZJo5V+1PXcuE0P1TI45RiYgwDNC63z5lxFPHvBOu4++yETgqlXtw6cmw/OOe/WVz7y0rPwCJQsqp5P/AI26IjYyUOAQ44dgyxlDzqoHGaSDqlsJQxFl5NrUfyoNGFEB6fqLt8Xrojp3IZMIzbb1qpE2c2KJlV++B65dWrhUYU8HnvMBuzPiBHrlo7Lii2AqcslumLVqKo+l1ZIu6r61JriPf21zG9ohca4sFFPPrwu0u8HPXDfnNFtWKHIPqvgEC3bZUBxtIbQaFwhJW2opqH9n0q5MPaL7qydnDglV50G/MblmDNQoJ920lkOg2lIAQ12S7A4y0rYB0pGZnIflnE+XIONdcY1tt3DKxDlf1Tqi+K1yhpMcpb26qTbhuN/mgozI/AutpefQzZem7TejHm0FvH7bvvEWCvpVik+PawcBiwcnJBU/OV2kGTALWY3L+24EqgVst9vG1QdVWpM3Kyr81X3Kxx7zo6PctN90bWe0qOhyeX0w4AIcTbdnt+xw5akL1U/F75LCsEdNaA2YhsuNINo51wt4zw+7d3vg/ilqtoxtHF1fyw+mnpy1ku8/tASeQYmfvJyAmNmTsixWGzouFI4v/DhtOPndt+DJmNhh9xbMt35lsWFsL/YpMP51WT2EANuzXhKCHvghdySUcBm6SilqZYZoRfAVlwBN3YYnGEGFcts50kSLE0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(38100700002)(956004)(86362001)(5660300002)(54906003)(6666004)(31686004)(6916009)(16576012)(2616005)(316002)(31696002)(4326008)(66556008)(6486002)(36756003)(508600001)(53546011)(83380400001)(66476007)(2906002)(26005)(8676002)(186003)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0dxWHhzQm4zbStVUTNsZS8xa1ZpT1loZkV2VE1kcmdIWkttWVF5UHp3bmNu?=
 =?utf-8?B?MnJrM0cvOWljRnlxWVBZbjhjbkFZTGNseGVkMXZIa0lPMElJdmc2SGRYSlpH?=
 =?utf-8?B?dUlCcFpNMXFGbEdhYS8ySjNxMDBlWWwwUE91L3RCbUtxblNFOGtiVSswRVU0?=
 =?utf-8?B?WmxMZ3dJZEptY1dwZDBqQVBFcithQm5NY0tkNThvM3JGMjRiU1lCOUk0Zit5?=
 =?utf-8?B?OU85V25rR3BhQVVtK0ROMHcrMlArNmZzMCthb3N3Z08xaEYzekFNcUpGdnB1?=
 =?utf-8?B?anN6dW9yNnNJcGRVMDVKL200a0gwRUx1anpWREoyMU9LeWtmblpJVHFyQWRI?=
 =?utf-8?B?RnkreXJFWXZKWG5QalNFYnBZb29OOGY5cWQ2Yy9qRmRWMW45TGZ2ZDlwVmM3?=
 =?utf-8?B?bXBua0wxYTduVzY0ZFV1VUdvRUh2cFZjOXZnZE1oVkNhMVJFaUlMa2dWVUM5?=
 =?utf-8?B?YlMzbFdMMkk0aWtFNTc2SmIxNVlLV0taWEFXRmVQY3QxMjJwaEJoeEkvK2dR?=
 =?utf-8?B?ZStkWWs2djRmcHFNQnJMM0V4U0pPd1NHZFFlaEJaYzNVMzg1aXh5Z1RYNHZx?=
 =?utf-8?B?ZGV1d0syalFWNVAvT003N1JyQWNIemFTMFVCQ01uTnhwNGlsd1lnYjVTQjNr?=
 =?utf-8?B?Rjk1cjNvQVFOME9xSHU3aUdYSmpOU2dwZ2VibE1QWUpJRHNQdkhnRXlrK2pw?=
 =?utf-8?B?UFRtbE9zTmF5L2tHdlpXTmYxY2sxQU1zZ3JuWXRBNzNGRVFrWndSSU9tc0lQ?=
 =?utf-8?B?dlQrcWRxcjdDWmo1QS8wZG12SStYN1NYZFNTVFJEbWEzWm92NXlhTXdxTmlr?=
 =?utf-8?B?NEQxWU90cEpzQm5FeXlEQ29ydnpCVlJiLzJ5NlBhZy9VZW9TVVFTMHJYcG5K?=
 =?utf-8?B?U1JEQTE3WjlFbHhMT2ljYno4eWpPNGNReHpUd0N3bXNQaW82WlJEaXNRZE1E?=
 =?utf-8?B?SElUVG5nY0VTUHlsRlhidXhqSWQwV0pickMzS04xRTdmUUVZZXEyUDFzR3B4?=
 =?utf-8?B?cWFKWDNtT3cxcUdHTHhVSFFrOUluUkoySjlNRmxkc0lNMVVGcXRZZlpZSHY5?=
 =?utf-8?B?alZTVnE1aVhubElQb2k0NSsrcXo2dEJtb1pHcVJwRnJaL3Y3ZXNENFJFamZa?=
 =?utf-8?B?REM3K3ROWVhtNytnR05pUWh0MW5JQ2Y5NkE3S282S0pUYVo4WHo5RjE5ekYx?=
 =?utf-8?B?M2p1OHdEUGRvaTh0Vjd1M1prZDRyeCszWlpUZVorY0JTR3VQbTh2S2dITDhW?=
 =?utf-8?B?L0NCcThucW5YN1FYQ3JSanlPSnZLNk9qcnpEalJZcys4RFppNVQ0KzRxZU9j?=
 =?utf-8?B?cEhQVDAybjQ2MU9RL3lQZm9wU1BER3F3WmFReElnVGNYWHVqUk14eXIvN3dR?=
 =?utf-8?B?YmFlYlRDY2pQYklObFA3NzRRa25sdm9FNDZoYkhNdXZXUjJxb2E2MHg5U1JT?=
 =?utf-8?B?QjdLUlFqMklUaytnQ2VFeVgwWFE4WHM1a2wzMTB4NXpxNHd5K3V6NTNqY1I0?=
 =?utf-8?B?ZlVzSFB2V2dRRTVSdXRLL0NtR2d0ZEJXM1BFd2hXTFJ3aE1qbnBXYkFnb3hC?=
 =?utf-8?B?Q2FHNWFJM0w0YlJxTmVpMVI1aDBMSDNDNTUzSks3TWhoQUwxdHJhejZpMmky?=
 =?utf-8?B?bUphOEF4eEppUzU2emtNZEhEM01WRkVpSDVpZnFlaHBoUGpRK3J5TVllK3BZ?=
 =?utf-8?B?NG0rNUFZeWY4RVlUaTROQTJzV0RrVTBsdnZDYlh4SFpIbEMxTnV4Z0ZyWTBk?=
 =?utf-8?B?VEJjamRlUnV4MnBRQTZyWlorT2tWeHMrNi83dFgrYW9ZMVp3VEJ4aHhPdy9C?=
 =?utf-8?B?eTQ5K0hXZy91Q3IxMFpjUFN6UkMza1hSRnBSc2xvUmd2NXRsQ2FyckxjYnlp?=
 =?utf-8?B?ZnNwWjNjM1lHRXdjQ1FOajBBTUhWOXdRWlpJZkk5b1F3enZUL1hSQ2J0eGtn?=
 =?utf-8?B?eVFaMDlCTWtpYlJKaStXaEFHZGhyYkNUcmN3K3IyaVJrY1ZnV2FVeERWR25t?=
 =?utf-8?B?RTVubktxVzBUTUJIdnV5QnA2bFk0TFAzK1AzcXI0a1FCdG5tMEE4WWU1NDR1?=
 =?utf-8?B?R3AxdGQ0THZBSFhiTmgwOVB5b3lNS29hSWVmRVFaMk10VW1xRVA3YnRHS2o5?=
 =?utf-8?B?SGFhR0FReFpWZXhSMXZwSkVBb3ZSV3BmZVQ5OTRJOFFCU2I5T01mbWI0Z29K?=
 =?utf-8?Q?6rEbrqMGqv/wPgKsRlMplVM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3008af30-0e6a-4e84-d29e-08d9b8d2d208
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 16:09:45.8191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZLiSeYeEU8T0SviRPFruod5UVLygCf9BNj6E10niS4HW+2QCqB0SdopI3h8eqoC6nPlBMy/P/V5TQKnKeZKiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4382

On 29.11.2021 16:33, Roger Pau Monne wrote:
> @@ -458,22 +456,6 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>           (p = calloc(1, sizeof(*p))) == NULL )
>          goto out;
>  
> -    /* Get the host policy. */
> -    rc = xc_get_cpu_featureset(xch, XEN_SYSCTL_cpu_featureset_host,
> -                               &len, host_featureset);

You go from retrieving the host featureset to ...

> @@ -944,3 +865,98 @@ int xc_cpu_policy_make_compat_4_12(xc_interface *xch, xc_cpu_policy_t *policy,
>      xc_cpu_policy_destroy(host);
>      return rc;
>  }
> +
> +int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t *policy,
> +                                  bool hvm)
> +{
> +    if ( !hvm )
> +    {
> +        xc_cpu_policy_t *host;
> +        int rc;
> +
> +        host = xc_cpu_policy_init();
> +        if ( !host )
> +        {
> +            errno = ENOMEM;
> +            return -1;
> +        }
> +
> +        rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);

... retrieving the host policy, which afaict is a larger blob of data.
Is there a particular reason for doing so?

> +        if ( rc )
> +        {
> +            ERROR("Failed to get host policy");
> +            xc_cpu_policy_destroy(host);
> +            return rc;
> +        }
> +
> +
> +        /*
> +         * On hardware without CPUID Faulting, PV guests see real topology.
> +         * As a consequence, they also need to see the host htt/cmp fields.
> +         */
> +        policy->cpuid.basic.htt = host->cpuid.basic.htt;
> +        policy->cpuid.extd.cmp_legacy = host->cpuid.extd.cmp_legacy;
> +    }
> +    else
> +    {
> +        unsigned int i;
> +
> +        /*
> +         * Topology for HVM guests is entirely controlled by Xen.  For now, we
> +         * hardcode APIC_ID = vcpu_id * 2 to give the illusion of no SMT.
> +         */
> +        policy->cpuid.basic.htt = true;
> +        policy->cpuid.extd.cmp_legacy = false;
> +
> +        /*
> +         * Leaf 1 EBX[23:16] is Maximum Logical Processors Per Package.
> +         * Update to reflect vLAPIC_ID = vCPU_ID * 2, but make sure to avoid
> +         * overflow.
> +         */
> +        if ( !policy->cpuid.basic.lppp )
> +            policy->cpuid.basic.lppp = 2;
> +        else if ( !(policy->cpuid.basic.lppp & 0x80) )
> +            policy->cpuid.basic.lppp *= 2;
> +
> +        switch ( policy->cpuid.x86_vendor )
> +        {
> +        case X86_VENDOR_INTEL:
> +            for ( i = 0; (policy->cpuid.cache.subleaf[i].type &&
> +                          i < ARRAY_SIZE(policy->cpuid.cache.raw)); ++i )
> +            {
> +                policy->cpuid.cache.subleaf[i].cores_per_package =
> +                  (policy->cpuid.cache.subleaf[i].cores_per_package << 1) | 1;
> +                policy->cpuid.cache.subleaf[i].threads_per_cache = 0;
> +            }
> +            break;
> +
> +        case X86_VENDOR_AMD:
> +        case X86_VENDOR_HYGON:
> +            /*
> +             * Leaf 0x80000008 ECX[15:12] is ApicIdCoreSize.
> +             * Leaf 0x80000008 ECX[7:0] is NumberOfCores (minus one).
> +             * Update to reflect vLAPIC_ID = vCPU_ID * 2.  But avoid
> +             * - overflow,
> +             * - going out of sync with leaf 1 EBX[23:16],
> +             * - incrementing ApicIdCoreSize when it's zero (which changes the
> +             *   meaning of bits 7:0).
> +             *
> +             * UPDATE: I addition to avoiding overflow, some

Nit: Would you mind switching "I" to "In" at this occasion?

Jan


