Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAdLKUAtvGnquAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 18:07:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 179612CF76B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 18:07:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257451.1551848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Gpf-0000wk-Ex; Thu, 19 Mar 2026 17:06:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257451.1551848; Thu, 19 Mar 2026 17:06:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Gpf-0000tg-CH; Thu, 19 Mar 2026 17:06:51 +0000
Received: by outflank-mailman (input) for mailman id 1257451;
 Thu, 19 Mar 2026 17:06:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mAdu=BT=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1w3Gpd-0000ta-SP
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 17:06:49 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 012340b5-23b6-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 18:06:44 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 17:06:39 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 17:06:33 +0000
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
X-Inumbo-ID: 012340b5-23b6-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=quHlHfu3ZuXVHOS+3oLu+b5d+GpEvLFTQYomT6JJqLVr3jsTpzHgcxwrN73XmXznCVB4ywJg8cKbulJabqJlgYJy/7UPKvsuK5Z72xM8M31AMWWzG609pZa9paVZp3ahRd5AELj7FSSuh2XICjrX84MMDIAv24uElV1WgyUGfUlGx+DViXGlq6m8ZJ4edjtPUD+2Q3Vc1DvkTNrWsuJq3DQKAXOt6mqwfFVnOXV7nr/1IF0sa6AkNeocUOU4z+rHNC9ZX/g9+qVCD6WZ0X2E2+pMoBIpQNgtJGOMov9jg3yD+S5NDC/cfntyMxzcZB4D4L4zf8sX687oR+rno8gQ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSDBoA2OFcMkOmtkj9E6iHSCXzq7l7lmsvXKRHl9Sk8=;
 b=R+HMamw//Rqm0YuqzG1k2zCp2OT2CcBSZzqUdxCE/BVgyV7y8674ESg8nQ+RcjRa5srtTv+RWxnj+xNr377UFXMXNxVMuSmLE+tEBjlyjmhu6pTXioNFwI8JJWJLVL98vOdOLjds9Ti9/jD7TDaTT1P0pXg0kgU0VFryRahECOQNfrcu4nBk7HgGALyo1P1SWoG3+ECXoPuEjnAwXII2IvoJKMwRrIyZ/c5Ia3gp4R9HW0bEGQC8hpHfOoK+I0Zp4fa2H/gX7GnDVlxDwrOBvnPGTLqhpZbky//ZzstfyZhDvMLn6++XFoC/Pb8wcq1blyD65FI/w2VayipyGsZhEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSDBoA2OFcMkOmtkj9E6iHSCXzq7l7lmsvXKRHl9Sk8=;
 b=QSgc8CWg3iCYi9tqFBpbf+3nN1cAcasBwQwj6NEuWpeECBoZ0IcP+1AQzwlIZ63w0/iLoM7wMvv9SCSaVFBgilhWVgWt9/T1wM62lxMv9je6LnG2PL2vNjZ/GEDi/X+o0oulyMIpMyqbM64ZTzK1duMEjd6BoCodr5ClZpe3Ln8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1f1a3040-25e8-4989-99e7-c84e27770dd1@citrix.com>
Date: Thu, 19 Mar 2026 17:06:30 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v1 2/8] x86/vmx: Remove lazy FPU support
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
 <20260319132924.1469809-3-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260319132924.1469809-3-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0052.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM8PR03MB6230:EE_
X-MS-Office365-Filtering-Correlation-Id: 3781e404-34f6-484c-0777-08de85d9df18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MBeH0F+CME58sbcugFMXObFjTPbUPBfoHQYl/g1qgjb/ieM5NGIHcmHnYgEs6dKkQzGotoCo8hzDKOZEb22utG6BGB2eywDlerdRFVAPq4w5OsyoIN7CDAP/q8Pr0k8IW5JEkY/+Ej3ZRJSch0ZkAaRFtNU6chRETA6r76D39qazktsRrhKPh/oYifccjfd1YVrQ2a8zoXJXZtgJSv1dp1GnS4ZDkVU8mgS+PX3VSyKbJ9Yp1QnChd6LnBr/5GHATYcJv6LJY73WZkfecVIkpc8c08Sp1K4bqvIaJxNMqdlB0SZOztoQVAnMJiB38s6IP//e4kSU3Ipoh+KjxVbGbHK5N7ptRQiMFDZb/w8m6ypFDlRT66je3cNxO3gGkoe7MUb3urBupXLXnYPtc9wyZPC0QzLmocum7cJMpT1dZV1lEcBY51oQ8zfsHTnBY8OzoCzTDtJo0cdS94pSor/ULBYpVNUo/mbdAFk6XXJ/KX0psKeJu+3+S+z8iMtho75jRXUiUXBkR8dQtH4BO+AUHTMiXIyp8ZgxANy9ffHg0bPFB4WXy5AcLgFoGrdltZXQRmKGTFIoGEPPXtQI9T/Ct3ajCzRFEBPjH6sziNprpmCYRcPk2Mo4WaW0FcFPsNmKRYMonRHgqJgnqCc9zNGLCcIP5blSepgsZ2+RhduSQCC4LViRI8mEVoROxNnEvT4O9unD1s7vZkCywjHQ4Rc63XheIR6lWlIUbE+rwNkfhGA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXMrZ09zS2xzTkFiME5LdXBDekJONVE2WEtOcWd5cEF0TTlZWEthcUtKQjdX?=
 =?utf-8?B?cUxOaE03VTVxUTk3Y3VGekNkSG05Wm5TM1BXdjdSaU9OTEtlOTd6U0dOUksr?=
 =?utf-8?B?MlZ4aUFYSytQMCsxL2E3K2xFRjhweS9CU1RxZXNCb3l2citZb0c2cHhkeDVE?=
 =?utf-8?B?dkgwZkF6TTVoVTB6cTBQanNsU3lvblVOZHhMa2lKSUd2dnJqQ2xQeDBhMXFy?=
 =?utf-8?B?UkdaUUQ3c29ZR2dNQVg4bGV5TkxhaHZidDc3YTRoeGtacUVXaXZtZkdZeFFG?=
 =?utf-8?B?Z1g4dG5FTThieWYrRkxLcHBVVDI5ZzluUi90WGltQTk1c1pDQml4c09sNWNX?=
 =?utf-8?B?NldicUcwR0JoU2UyWDFTd012c0QzU3RTZHJWcnkvbHp1SFBTWWxuMkRkbE4z?=
 =?utf-8?B?ZXNJS0RaMkJiRTJpYk1wSnk3WWhEZ3Fqdis0S0hJYVFqUURqcjNneitxZHZJ?=
 =?utf-8?B?R2JmdVl2eGN3RmhjMzdKUnVPU3ljS2xKZXBVckc4OXRMeXZhQXk5QWh3Nk5k?=
 =?utf-8?B?MExuL0pORWRKV3lXbkxXQy9HbFcvTXduYjE3eWhBOGxVUFBMMGxxdkN3QzND?=
 =?utf-8?B?NlFZV2xieFZjWEcrbmJtd200UTlyemZVdlZYWmxaQTN5QTI1Y3BVUXlleXZO?=
 =?utf-8?B?VmVWcFd5VnEzdFhLU0wxY2VneEdJOVA5NzBWMExZb2FwdHArVVBzMkluVEJW?=
 =?utf-8?B?Ny9KNGlaUEljQXo0TVFxSTBQRERYRHYxRXkwZ1BtU3diQVR2ZzZhUW5jdmpv?=
 =?utf-8?B?QUhuUysvKzZmME1lS3pxRGZaYUZDQzdLNzNsQ1pySk9FelJvM0x4ekMxTkdv?=
 =?utf-8?B?cG9uMzA3ejQreWlpN09CRVJBRlo3T2RkcjBhelpNZmlyZnZ0NTZCUEd5T1NG?=
 =?utf-8?B?bWtxTklKZnQxTkF5NTNyWEtqcGwwTmd5TTlwRzhZaXE1WEo0WlY0VmV4Wldp?=
 =?utf-8?B?ZDNHQW1zOVEwWUMrd2tPOWNIcC9uQ1ExYU5La0puYTRYOTRSYmNJRkpZVzBT?=
 =?utf-8?B?VjQ0azRON1ZsSStLMUNhd1dCaVlmVFhXeW42SzZPSWY3dzlpT1lLV2VUVDNu?=
 =?utf-8?B?VytVbjZDa0hzTW16cVdCVVlIalpPV3pUWUdEV0ovL2RScmVMRU5iNGYvcTBp?=
 =?utf-8?B?d1h5TnArSmI4TG50U2JxOWduVnZZcjF1UEkxVk42V0I4WlJyR1NuMGl5ei9Q?=
 =?utf-8?B?dlVGKzRFVnVyTUtSbVMwOTBSQWJQOE5GWVNPVmNua01vWk45UEhwbE9VNjU0?=
 =?utf-8?B?UmpON01TdGY5b0RIb1I0SHdjdC9jcUlJYit5RUpXNXFhUzF5a3lZQ0doazFH?=
 =?utf-8?B?MjB1U2dDTUU1cmE4NWpUaUlveVd5TXQ2SEtWc1MwTW1WTmw4aWQrbkZMM3ZR?=
 =?utf-8?B?WG5tdTVsWmpqa0pkaGhhV04vS0E2MlgwRmxpV2dMWkRNUmVKbWlvS3ZscFg4?=
 =?utf-8?B?dkFKZ2c4ZDNVWVFxcHh2UVNZNzB3dkRNZTYvaUVWeWx5YmZVNStiVjVBQWM3?=
 =?utf-8?B?R3gzYlQrMkVJdUhROW1nSE1yb00vNDZDWDlYWW91QkFQLzNNNzhhVzg3YWwx?=
 =?utf-8?B?aHZDKy9nVnJxeTFrLzh4dmx0dUZGQ2NodWhjaWxFVERjMVM1Z21IWHNZcWFT?=
 =?utf-8?B?TTd0dy82b3NQL3BpMVZXZ05KK1RXOHVDRFlENkdCV0FsaWt3TlZMbndCaVJK?=
 =?utf-8?B?K0dhcVJtWHJNWDU0S3FmalhrWWhRTUNmakxJbkJiYk04emF1Z0NPeCtQRkZQ?=
 =?utf-8?B?OEZyOE1WS0ZoTjFaVFYwRTA0S2NOZVRWVzEwUXhVd0VVL3FpOWh1a1g0eno2?=
 =?utf-8?B?UGRTYVgzVFBNSTlac2crWk9vOFR0dGhpVGoyaEhNZzFPb0FJbGE1bEZMMjda?=
 =?utf-8?B?L2ZGK01oSWozZ2w2bFdtZ0lwN29VR3RWR0x5MmpHTzRaOEVkQmlQdkMvRGhk?=
 =?utf-8?B?UWpRcUFFT0tHaTZDRHdIMVRIcUVGYzhoWWVmOGozN3ljOTBoRVdtU1lMcUxF?=
 =?utf-8?B?Vm5OYzQ5WFdCS2xDWVQ3UVloSGpsOGsySkFyWk5wYThLTytlRlZ5ZEM2dWRR?=
 =?utf-8?B?N0ZpQm1ubG5hNkpWNjR6d0hVQmh3d3pwMTBKbzhReGZGRVBnTHBkdk11SUdu?=
 =?utf-8?B?MDBnU3ZPbjg0ZGRNMGpOWXEwcGx4bFZvREF3cWZnSWJSb21waTYvQnR4bCsw?=
 =?utf-8?B?elYyU1VFNWUrK1dhb1JwV0NBWmI1NVZkaEN4STg2UEVSQ2dYTVoveFdUR0x0?=
 =?utf-8?B?QWROUnJwU2h6UjFEY3pza2dmUGlucHY5ek4rNlZZMUh1ckcraXVWN0dQeHpJ?=
 =?utf-8?B?TzFqSi9xaW1STVc4YThaZnd3bmZhTnBBbVFsbXNGN2lldDJxOXovQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3781e404-34f6-484c-0777-08de85d9df18
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 17:06:33.2091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZwFfb5FWoi5nZfnNGw6reY796RfTp8Qpx9PGSw9KdgJ5puLeLNgiwjqgReGOzJfuTCCZ+zLrpwv3diCuXZY0eDXapBpBYcXhl2Qkt9+W1vg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6230
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 179612CF76B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/03/2026 1:29 pm, Ross Lagerwall wrote:
> diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
> index 38952f06961e..e4cdfe55c18e 100644
> --- a/xen/arch/x86/hvm/vmx/vvmx.c
> +++ b/xen/arch/x86/hvm/vmx/vvmx.c
> @@ -2458,19 +2452,14 @@ int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs,
>          __vmread(VM_EXIT_INTR_INFO, &intr_info);
>          vector = intr_info & INTR_INFO_VECTOR_MASK;
>          /*
> -         * decided by L0 and L1 exception bitmap, if the vetor is set by
> -         * both, L0 has priority on #PF and #NM, L1 has priority on others
> +         * decided by L0 and L1 exception bitmap, if the vector is set by
> +         * both, L0 has priority on #PF, L1 has priority on others
>           */

Again not for this patch, but this comment is wrong(ish).

L0 #PF only needs to take priority when L1 is a shadow mode guest.  A
while back we decided to disallow nested-virt in such a configuration,
so we can delete this special case.

~Andrew

