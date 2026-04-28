Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDRICUyV8GnnVAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 13:09:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA99483573
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 13:08:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295595.1572252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHgIr-0003JR-Tr; Tue, 28 Apr 2026 11:08:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295595.1572252; Tue, 28 Apr 2026 11:08:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHgIr-0003GQ-RB; Tue, 28 Apr 2026 11:08:33 +0000
Received: by outflank-mailman (input) for mailman id 1295595;
 Tue, 28 Apr 2026 11:08:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wHgIq-0003GK-2D
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 11:08:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHgIp-001aai-0j
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 13:08:31 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f0951c-bab6-0a2a0a5309dd-0a2a4503aea2-44
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 13:08:30 +0200
Received: from [52.101.61.8]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f0952d-672d-0a2a45030019-34653d086079-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 13:08:30 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV4PR03MB8211.namprd03.prod.outlook.com (2603:10b6:408:2dd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 11:08:27 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 11:08:27 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p1QzCckY61iSzLrKX9QyjWU7lt2yhkizItH508K8Z+D4o3QRylZvT/3HmlN7UhEYnBKrQkJyLuFfU5VDsLqMx2CB5YxZp5JdgaHdt+nbDJiOWl6Qe27DXHIqF6vfi9WTeIH7T6NaQVVEMJoQh3L2VE45/Z7pqIyaVAt0SbKvmg+VTkwkSSvZGl49VBWhTLzdxrvAPEuC9KL6S9iMOwKEpISXbR/OGwY5tvV9CMBXZt9Ya6MJEbdTW7ud8A1elvoQd+7GDWdMY8L8BvwEDoLEW3eolbJ+PSziarHaL7oK+Joeih5YTD+g/DD/w+CIXY5cUBdZQtAk58DZlNC7dHkZCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S6P44J+VlHwzIRCO4d6jWzHgfjBNEQOdeCir1Yluc0U=;
 b=gyhopVH/qOJbDrZC3nYCfeL7KghQ7o/rkNaujgVBTlvisiJ7EQAHx3aNaiqLvmR5CaqvTuT8qwq+/joEirVv1yjqRrJn2snpV7Yz2cmbWI9GOmudGX8bUKyIEUg1B5qtxos4zzPX+V8XErleori54YmJhzJgfF8dJXNs7lfXstZE5jULmjoC+HkNgReeTBhrJZcAEgKGjkJxFC6+/89UnbjQAtIa91AB5UcMIAn4I8BHeBwBmfDX2R3Fj4+9/JBI8603KtGmn8+TDjw8CLxeUMs8Alev7JnUYEJusIikJv5MVhfVsU1tOv3IgWFoBcGceldquqzyhu970m/dGSZTRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6P44J+VlHwzIRCO4d6jWzHgfjBNEQOdeCir1Yluc0U=;
 b=x97+vMpotvIP/mvaJzr1EaWyzElYeis+v/2nuahpu0455JTACqRJuAFPjuiUTN4ys2N1b/uayh3XAwdg2ggf2Wq7xQ7wEAgxvYSsVnw6kB6GZzVPWS9IvfPWy7C0gjg9M6au7w0ixlD9SvF8ghEFzNn36qVvicntI4QD7BtoRvo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 28 Apr 2026 13:08:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Alexey Gerasimenko <x1917x@gmail.com>
Subject: Re: [PATCH 05/17] hvmloader: add Q35 DSDT table loading
Message-ID: <afCVKAelR1ZyGB2U@macbook.local>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-6-thierry.escande@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313163455.790692-6-thierry.escande@vates.tech>
X-ClientProxiedBy: BN0PR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:408:ee::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV4PR03MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: 386fcafc-a559-4797-2eae-08dea5167918
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DSJ5DAOiJyvC2sSqWu1D2ELbX17crJF0py7xJKx4rVnEKJAXYdeSvorRZoNBbDHrnx1FMUsfUPn6YmYlpEZA6++RD2ZSlb2IgH6xScMJYXcJD+SpwrPREW3tGgVjI9iz8tz1FpVeVQnOGZSlsTR4a5//WMlNdKNASxg53RkjVa1WFL3i5ZDM6A1UZtLj0xCNh4pLrqIRMcVCjB145KkuMkK9l8rfMZk76bOnv/TVdEXc0KhiDBChWFR4O+Sf14CxhvzfRNO+f4kAdI7LcFn++ojn7wZ0Ju/qAZs9QZwKxZMzyLYxmBJ0r+2duKjWSYw4fHEertjeDJxRuHazl8+gjH1FUU5UrZHV7O1ANn85k2Hwtzdpmn5ofsev//NXxaGboY9VrzKZzLc1+w3di0fQH70kLxcOL+SFGfKXRwep0EusDI1qoACIkQzC7UcvGLlOOuevVncAVKgC6jWodeEAeUrQhD7bJw8hHkNIrEB0tcQYEY/CJKA/Cwh2qnT8ZufUnmEa81B8LtsQ3soHwtCGQGI6z5xLOQR6wcerrIXZNQqE3MjgQNFbNxrAg+PCo9AR8xDZHFhaAZHSPwz1JJ8IMNJzFzvoQGDd8sWYzpaMt0uvK/EzsELCmk9CVDo4fjFODHZo+qacc6Ut7h+PiF1W5j/xsUTQiEI3HBCtvioP4O3OJd/ihTjqenpeHuu9Petc63TcYxi14JCoUnr9cC3w2xiu5glPaQA/J0tk8S+6LgM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VC9KMmZ1UzlWMlRNSEQ2YUdrL1NTOFcvbk1SNm84M0h2MTdVS2gxdXA2Zi93?=
 =?utf-8?B?Zm11SUtIQnZPSlVtMU9ZT24rUjN2RXZiREh2bGVJSUJmVFFYV1JDcnNIVEtD?=
 =?utf-8?B?KzNOTGJzUWoxRS9KcHp3ZUljOHFnd245MEpHYlY2OFpqYXAwQUkrR1Q5Y21T?=
 =?utf-8?B?RFREeFdWeWtnOStxT0dUVjRIMXQxa01XRnFUTlRNOXk1TWhZYzlZUXlpaFk1?=
 =?utf-8?B?VzFBRVBOZXFOSmhjMmYvdGgyOVIyRUVhQkVVT1VFSEhBemdiNXU4SFQ1LzVC?=
 =?utf-8?B?eTZuSWk3TktpOGxUM21CTFRzTGlVKzQ1Tk14Wkh3WjdMTnRJR2JtZXFjdUx4?=
 =?utf-8?B?U2IrZVVFVkYvVURiZTJSNG15YnA4TnZGeFZPY1lnWHRzVXI4blZ5dEhSYTFW?=
 =?utf-8?B?ZGV1dHN5ZzZOUk9IcUNXTVpXVlNUWnNQNExmVXMzQzRoc2JBTHNiNDhTNVBI?=
 =?utf-8?B?aTk4eEJnZTVwYzlVZ1JQcHJLSmtLaEplNmtDV2hKMlFIQ0NCVk04Ujh5dGVp?=
 =?utf-8?B?UDFtRHhEL1E2SUYxSnhTejBwbmZ6WVpwdlFuMEVaUEVGSzBYVExnc2N0VytJ?=
 =?utf-8?B?UkZaeXEzQWRNUnpWeFU1RTZtaDBmRlBjRjV1Y2MzeDRRUFZvd0JqYlZJM0FS?=
 =?utf-8?B?MlZpMzlZZ242L1gyZzRwYUowRnRyeVpMWDRDZFpkYmZ5VDVCVnF5aklSeVJu?=
 =?utf-8?B?QSs5aWFJMER2THhrUDRNbm9saWpDSTh4VU1MTmlHYUFiS1RWK3JES0FtTURw?=
 =?utf-8?B?TGp3U0RVY0pKVzBKRWpOUHBmU1BqNnB2RUhZcVQrVGdLRjhNM0lJdm1sM2xa?=
 =?utf-8?B?SFl1amlYZHRVMkJKOUYxQXdzT2V2aHIyeC9DOVRnei94OXlnZzZtWENkSVRm?=
 =?utf-8?B?V1lPTWJ5emwwR3JDWUpoMEtndk8wbnBqNkc2ZEl1Vy8ranl2WTRWK0w0OVEz?=
 =?utf-8?B?Q2dTb1FGT2sxa0h6MTdqcTg1Mk9sWlhUOUhWS0EwQm14alFPNVk3UHFxeHZa?=
 =?utf-8?B?aE1kcVVtdFV4eDl1N1dDMTQ2L3BteXI5V3RtMkhJYmtZbkFjOG90RnYrVm1z?=
 =?utf-8?B?c1d3MU1zUkRPSTFKdkdKUjZTOGhUaVl2SGxLYmllVm9kdnR0UUxCYXNtYnNR?=
 =?utf-8?B?bCt4ekZHOUI2Y1lDd0pRUXVHKzdzSmUzM1M5QWxXb211cDYyY1UxK291Q2Z4?=
 =?utf-8?B?eGxBL1RKb0M1UkVQUCtmRkdnclNrYlFmMm1sNkQwdlliZzZzd28vNnNIVXNk?=
 =?utf-8?B?RVJmMHk3YzNYVzVqT3ZTTldwQ3NYNmxRL0dOL1dMNzBLanZ6L04zYk9WSE1p?=
 =?utf-8?B?dkVpa1U1Q3VWcGVCMElVUXNiQS9sU3BJYnE4cDBYOHJ0QWNxTVkwc25UNG4v?=
 =?utf-8?B?VU5xb0RySWRoUWt2OEtHdUlVREZNRkZQamxGbmdBL2lQYVdzcm9VcXBWeXpm?=
 =?utf-8?B?bm5Kb3Y3SVFxMk9PWTY1bzJRcVowZWRxZTUvS0xmWW9mZXBid3UrNEJyK1hB?=
 =?utf-8?B?QmxNcnk4VFdBdFhCT0l1c2NMcm93TDFGWmE1WHp6Y2pFTGRMbHNzeHgrelds?=
 =?utf-8?B?YjVxQkljbXlKRElqOCsvT2NiVXlzeCsweE9qTWw5Rmo0Ly9yTFBTSjIxMWRJ?=
 =?utf-8?B?NEZSdDlZVXU0dkM3YllISjVqSmxxZmErdlJTYjljVFZvUTJJaFdaWEpXS1lz?=
 =?utf-8?B?SlJGMnlOVlVxTDZxRmUwQ2kvM2lVeXlQbXdNaDl2dy9wd1pMNnhSMlZOTG9p?=
 =?utf-8?B?S2EzdGF0dnY4MmxGUlJlR3N1VnJvK0NyS1dMN3NuRHBYTURSZ2FiVzdUeVFW?=
 =?utf-8?B?bUxpbHZCejhLTlBWZ2dFRFN4ZCtWTHV2a2MwbFhYMElmdU8vVFZIR2ZiK1dS?=
 =?utf-8?B?MHU3WGZId3BHQXFsUFZpT0wzVXdsQkJjUWpFNHRhNHhJTG5YaHYxRWljc3hG?=
 =?utf-8?B?enVNMXlRK1JoRTlOb29BUi9LQ0xVSjlpY2cxL2taSEk1anBSSEliUm5vQ01E?=
 =?utf-8?B?aXdpT3ZvRG5sS0lDclo1djdVbk5sellvaWs2U1cwY0FkbU0vNUJjQkJjY20v?=
 =?utf-8?B?bTZ1b0NWZEhYZUdvSTRGU0VjRlp5dEtBbmthd1U2elB5a1JIUjVJcmFEY0Zm?=
 =?utf-8?B?MXlBQXJncFZBSStndHFpOWdCMjc2TVJINkRoZkJMOWhJU1RPTVlpSWM3Qy8r?=
 =?utf-8?B?Z1pkVW5pclVhamdGcUNET2FVbzNnVXFHUlpROVRkOU1VMFdTWlFtdlpEVUEr?=
 =?utf-8?B?ME12WWtnYytlMHRkS1M1UWx4VmhUN09zQXF6SWdVRDk0VjNOQ1JPR1BQQ01m?=
 =?utf-8?B?MTVOdVBYVFA2OE5rWUROYkQwamIxQmk5SDZVUTlEZnZkb0t5TlNYZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 386fcafc-a559-4797-2eae-08dea5167918
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 11:08:27.4128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gf1uXqXa0SUGYvLTV2D6RVxViDdIThqDAXpoR4RD7/fOfLaavvc9jw9qrY+HCKMsl+IPdzST9nPl4LG/pFIJCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR03MB8211
X-purgate-ID: tlsNG-33051d/1777374510-28577938-C162B3AB/0/0
X-purgate-type: clean
X-purgate-size: 3233
X-Rspamd-Queue-Id: 7CA99483573
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,suse.com,citrix.com,vates.tech,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,vates.tech:email,macbook.local:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

On Fri, Mar 13, 2026 at 04:35:02PM +0000, Thierry Escande wrote:
> This patch allows to select Q35 DSDT table in the function
> hvmloader_acpi_build_tables(). The machine_type global variable is used
> to select a proper table (i440/q35).
> 
> As we are bound to the qemu-xen device model for Q35, there is no need
> to initialize config->dsdt_15cpu/config->dsdt_15cpu_len fields.
> 
> Signed-off-by: Alexey Gerasimenko <x1917x@gmail.com>
> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
> ---
>  tools/firmware/hvmloader/util.c | 17 +++++++++++++++--
>  tools/firmware/hvmloader/util.h |  2 ++
>  2 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
> index f9116bea4d..45519ea583 100644
> --- a/tools/firmware/hvmloader/util.c
> +++ b/tools/firmware/hvmloader/util.c
> @@ -885,8 +885,21 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
>      s = xenstore_read("platform/device-model", "");
>      if ( !strncmp(s, "qemu_xen", 9) )

Tying Q35 to xenstore seems a bit sub-optimal, as Q35 detection is
done purely from the PCI config space.  It would be better if we could
avoid relying on the xenstore node, and hence also fixup at least
ovmf_acpi_build_tables() and seabios_acpi_build_tables() to use the
Q35 ACPI tables when Q35 is detected, regardless of the device-model
xenstore node.

>      {
> -        config->dsdt_anycpu = dsdt_i440_anycpu_qemu_xen;
> -        config->dsdt_anycpu_len = dsdt_i440_anycpu_qemu_xen_len;
> +        switch ( machine_type )
> +        {
> +        case MACHINE_TYPE_Q35:
> +            config->dsdt_anycpu = dsdt_q35_anycpu_qemu_xen;
> +            config->dsdt_anycpu_len = dsdt_q35_anycpu_qemu_xen_len;
> +            break;
> +        case MACHINE_TYPE_I440:
> +            config->dsdt_anycpu = dsdt_i440_anycpu_qemu_xen;
> +            config->dsdt_anycpu_len = dsdt_i440_anycpu_qemu_xen_len;
> +            break;
> +        default:
> +            /* Not likely to happen */
> +            BUG();
> +        }
> +
>          config->dsdt_15cpu = NULL;
>          config->dsdt_15cpu_len = 0;
>      }
> diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
> index 2f37504aca..4641ca0c46 100644
> --- a/tools/firmware/hvmloader/util.h
> +++ b/tools/firmware/hvmloader/util.h
> @@ -393,7 +393,9 @@ bool check_overlap(uint64_t start, uint64_t size,
>                     uint64_t reserved_start, uint64_t reserved_size);
>  
>  extern const unsigned char dsdt_i440_anycpu_qemu_xen[], dsdt_anycpu[], dsdt_15cpu[];
> +extern const unsigned char dsdt_q35_anycpu_qemu_xen[];

If I'm not mistaken, patch 2 introduces the dsdt_q35_anycpu_qemu_xen
symbol to the hvmloader build, so that you can reference it here?

At first I was going to comment that you are referencing a symbol not
included in the patch, but I think such symbol was previously added to
the build in patch 2 (and was unused there).

>  extern const int dsdt_i440_anycpu_qemu_xen_len, dsdt_anycpu_len, dsdt_15cpu_len;
> +extern const int dsdt_q35_anycpu_qemu_xen_len;

unsigned int would be better here.

Thanks, Roger.

