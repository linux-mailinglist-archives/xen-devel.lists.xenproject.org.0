Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMjKLGiNl2lv0QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 23:23:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08699163235
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 23:23:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236735.1539295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtCPi-0003ek-TX; Thu, 19 Feb 2026 22:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236735.1539295; Thu, 19 Feb 2026 22:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtCPi-0003cZ-Q0; Thu, 19 Feb 2026 22:22:26 +0000
Received: by outflank-mailman (input) for mailman id 1236735;
 Thu, 19 Feb 2026 22:22:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V8+Z=AX=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vtCPh-0003c4-6U
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 22:22:25 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 750486c3-0de1-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Feb 2026 23:22:21 +0100 (CET)
Received: from BY3PR05CA0003.namprd05.prod.outlook.com (2603:10b6:a03:254::8)
 by IA1PR12MB6019.namprd12.prod.outlook.com (2603:10b6:208:3d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 22:22:16 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::7b) by BY3PR05CA0003.outlook.office365.com
 (2603:10b6:a03:254::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Thu,
 19 Feb 2026 22:22:17 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 22:22:16 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 19 Feb
 2026 16:22:03 -0600
Received: from [172.17.121.74] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 19 Feb 2026 16:22:02 -0600
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
X-Inumbo-ID: 750486c3-0de1-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gowNUnQaxDmpeM4Zos+mrzJMW3yNc18BtwMY/1xBISpxgXlIQ6QnI8gGT/wNl5wZhojkNgS/imCC9b0iZMBfbW7jXt1ssMrmYM25gOaHAO0smX5LP5/fdFt8TfP4Kt3Wr18zKbv4eec4rKagt/YCz+tBQZbaYNvPV6BLLNqQAfG4kMAHzq0fuxpiuzaNCMxIeUQf3mwY7P0Um9cLoOKxMof0dYUXglt4n0wGzAWO2pEE2hLb4bYIxwAZXCKJSZZ1oIVuJMd1j9zcLFmcBwtD8NvXoRFRhAYpdDbJ2vkxv/+maPfVDmKDnhx6KtY1Ciu074tqKU4ykSr/3ZWp0tLn3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojjnlfHIOkVjavQa9jwEY++80EHK6ug+8MZT/dYIeMs=;
 b=zGfrjq74uS4AF1ubKUW5UrmADFg6sQuIte/QGIki1qyQaqSzlt+zhBQm3S2rBLAI74Biz1yVArfmkdIiqQdjKvcq0h5dYp+eqb2sDyBMtbdTcHEPYF/Nwd5h8jxU+3ZSAXIdNODWn9fNK9+fBAS+CII5+2I/ZiDfVvfsZmPHJG7B7kWfde3o7EROe0HYfmcN2SHC93o660mPAUmYsJJXnYMTJGPHHj/wDiRVpO0678NhBdjRY0NbTiWVWCWQQLTLTbNDcNAlAH+9uXV7tRIPbz7Zv4C1R6/aMLEHfSkUYGSOzv1O8yJ0EqQBcqb8lSEkw1ekN30FWe3iztokSQbPnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojjnlfHIOkVjavQa9jwEY++80EHK6ug+8MZT/dYIeMs=;
 b=rZtxWMsxOwu1tHmtAgcaEwxxthDx5xni955U3m5Fe/SgZW722p/vprmijPLPQ6SRMLtbeYu5RzPoFSuIAm/9FmOkuxVlyVOEF+APvFl/OPT5ek8MxYV/I+q0A7x6r78bs5QRD02Qt6SEFhB9xfCzrp9ClySAWUuLS9kxU2VER7o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <d0be8579-fca3-4b55-9c7b-37368231a41a@amd.com>
Date: Thu, 19 Feb 2026 17:21:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] vPCI: re-init extended-capabilities when MMCFG
 availability changed
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <25c65557-c97c-499c-a698-571e40cde563@suse.com>
 <67b1f190-a7a8-4cf2-89ca-7186204f0b56@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <67b1f190-a7a8-4cf2-89ca-7186204f0b56@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|IA1PR12MB6019:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fd0124d-be7c-4313-01ab-08de70055689
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFkwNzcveUEybXVWOTFvNmpGL0tzNmJoRDdMTWhpYVhMYk5scWJ5Z3VIbjA5?=
 =?utf-8?B?NjcyTTRzYzBzSkJmRGpnTlBzc3l5cDl4ZDJ4VGRtL2VrTm9GRGtkV20rNkVs?=
 =?utf-8?B?N0hxbDJhZm44alZJK1pKMTc3WTF6QjR3TkpxTHY4eVZjMU40ek44NkxrNTR3?=
 =?utf-8?B?cGZBZnU5WjRFV1BnWDhkMFhrOHU2UnV2OXpZbUVJWDlmVjlicjV4MHlpRlVB?=
 =?utf-8?B?bXIvcllPTkVJVUlWV3NMTmVGcGRyblZQQ0g0YkFkTitCVlVqWmM1TnJPQ1lB?=
 =?utf-8?B?a2lzRURVOEd0SjRWbktSZVVQRkhyNWRscmt0UktUVE8rNWdhMDQzcTl2dFlG?=
 =?utf-8?B?NDM5a0t4ZTB1ZVl2UzJRQW4ySzNZNHdXbVpvS1g3d2tLd1c0eUJrRVFnc2Vo?=
 =?utf-8?B?a1Qrbk16QndRbUpCcDRqLzlZQllwbUc0cGo4aFN2NjBVUlUrOWFDWTRncFc5?=
 =?utf-8?B?dFlHSU5Xa3Z1UGFJUzY5eTBFT005OSsrSHJnbE5UaUMxMVlTRmtLNGpVR3hP?=
 =?utf-8?B?ZCtkRnJLcHI5S1BvSzR1T0x0TWR6UDJMNTNKZWF5QmFRdWF6QVEwTk9BRFM1?=
 =?utf-8?B?S1pmY3R2ZkRTMjd4M0F6NmpKVVlIVXhtc013eHZ2em5NcHdHTzBUMmdOUVY4?=
 =?utf-8?B?NExwS2REQmVuK0JIVkk5bExzRWc2TkR5M1BOeG5MOXd6a3dKZHdlRFFpOVdl?=
 =?utf-8?B?YjdSZ1N1eFVLd04vbGNSd1k1UHYxbVYwM1pUQmRyRmd0eDFKZUlrL3phMFZv?=
 =?utf-8?B?QUYrYzZrT21qUFdPcHcvSVpzMnRLWGVPQmNWRlBDY2hSaHQzN3pJUzBXZzg4?=
 =?utf-8?B?STNPazRCeUFOVGEycUUyUk4xNmZORDA3WDBuWTRwUWhhcm90QkZpT0p3STNl?=
 =?utf-8?B?S0RSbS9rYW1Rcnl1ZThBeVpLV2JNSnNuMjhTWTVPSGg3V3dTK3pzaUU4cjdk?=
 =?utf-8?B?YkRpZkR6a0VrcnVJZWpvZnZrSzBuZmhqL0VubUpkSnVyN09scGJtQmQzTnBM?=
 =?utf-8?B?a21mWEZEV3FMbXd3enVrRHUrcG40enlNeFlGL2JDRDNZNkhsam9lTE53UVFp?=
 =?utf-8?B?VWZrMlA1T3k0U1RIOEdIbkFaZHRFL01ZR2dTU2ZMdERHK01QTTNDWFA1L1Vp?=
 =?utf-8?B?MkhsL1FPbmFUem9yUngrdTVlU1hQRzErTFRNRWoxVlF6SVhjVU1FcDNqSE9q?=
 =?utf-8?B?bXEyRVdQbkY3am1ZQWRuSk4xV0o4dmdRNUpaSXBGbjZ0UHZjM3k1U0V4UjJt?=
 =?utf-8?B?QkRYSUIwQ1B3cWVNWEhtZmhmSDZwZkJ6cmhZS3JwQ3pxU0x6cFM1T0oyNlho?=
 =?utf-8?B?UVh4YlpIZmxQR2l4emtpdHp6NmdzVGpnWXdGMHFrNFhuQ25rTnAvUGFuTmtq?=
 =?utf-8?B?VzR3dkJzSkFVSFdPVjg4bGdqVzVoN01CQnFjWTRFMnh6Q3VkOXN6K1VmdXl2?=
 =?utf-8?B?YUlDTldzd1c5YjlVM2lZUmJZNFdZU3VCRkVwYUhVUkI3Y0duTWVPdC9TMm5M?=
 =?utf-8?B?MzduZ0h4Q3BOcTUrZjVZb2hnSHg4VkI0YkJUSlpWVkl6OUdEdGNKTzdBWUhD?=
 =?utf-8?B?NVRJTC9xU0JTYndiV0pSNTJnLy9XTUtUcFp0eU1WdnVXazVPTnUvZ0Rtc2tH?=
 =?utf-8?B?K1pwejFiWUY4bkdxK1U1VmtZZExFdDdKZUNzN0JNbC85ckFxM3dQUTl1QkdG?=
 =?utf-8?B?SEdGalRPL29HVjZZcHdJVXMxZ1hPeVZ3SFRKazVUU3lBcVZiVlBCOVJCMzVH?=
 =?utf-8?B?Q2R5MDlrc25CQVlTOVA4VE80c2d4UUhVSUdzcnowdG8wVFk1V0xqcXpLcnlx?=
 =?utf-8?B?bDhhYnJPNXhNdVQrYjRPcHR5QVRhTVFremxBNDV0YW1wL2c4bjlTZTYrOVNt?=
 =?utf-8?B?eTNOakhZa0YxYm5ZcXZQZTdYTzlLZ09GYVZ5dE9PN0dLRXBOT2trOWJLZjNx?=
 =?utf-8?B?S01jb0VlOU9TaVFzaGJMNGNyUXphSlIyUVhPZHRrNXRZOHpLelZzMVRiNElP?=
 =?utf-8?B?ZjlsZENqQmlMM0xDV1EwRjZocUpBU1k1QjlFY2hMc3hzWUlFUzBDMnlMS2tw?=
 =?utf-8?B?TUZyejQ0OFlrM2xZZklpb051RVlnNklweWg5Qk55MkdrWkZqM25tdDJhejBB?=
 =?utf-8?B?ZUQvUUE1b1V5ODNSUHZXVFBhT281eUlSTUxQS3FWdDRrVng3OUVEWVBLaC8y?=
 =?utf-8?B?dHdsdjBOY2E3U092cHpjUWZZWUZtem5LZDc3UnlTZ3I4SW81d21hemVob0hu?=
 =?utf-8?B?dStlQXZ3RjlUdExoOG4rVzdneUVRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ulMnqkfpiXjFVvNEhNqI+D6Ix9zNJvM2/gvAoqyaBLhFUVQ0oDuHHSXrdLXsNgs6zT9u5g0nPtnwKpPPnln40LWrQJps9TP7gXvAOiaq2XztRSGFr7k8OrBlXEb246+wVvzJJzS1YwpLLd/CQnies5PKfGUXFbc5V4KBW7T0QqC9ezWZtq4ML0RbJoBvgKrcvr8kFWoog3n/Kv+AXBskcmIsJd0cwsJjG0TdZWAy76pBSPNia30wzh2YeKseDLjswH9/VTVmqqgYioHA9D23FeY6nHxknAVSiGkme7NpWteolcd9X6nq0sH00G+9wO0s0oAEnBqJA0xAcpmOG3CMNQXnTQcL6SuKv0bJF8FFe7DH9isH+yDxpnZju94DIHqOsTkN7XRoPMXWnP+jGFR9agy68+vHxPIummBD4Hjj58UWFDMSYPqcTtytDfOMq4em
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 22:22:16.0808
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd0124d-be7c-4313-01ab-08de70055689
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6019
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 08699163235
X-Rspamd-Action: no action

On 2/10/26 05:55, Jan Beulich wrote:
> --- a/xen/drivers/vpci/cap.c
> +++ b/xen/drivers/vpci/cap.c
> @@ -376,6 +379,20 @@ void vpci_cleanup_capabilities(struct pc
>      }
>  }
>  
> +int vpci_reinit_ext_capabilities(struct pci_dev *pdev)
> +{
> +    if ( !pdev->vpci )
> +        return 0;
> +
> +    vpci_cleanup_capabilities(pdev, true);
In the case where pdev->ext_cfg transitions from true to false, it doesn't look
like this would actually result in the respective capability->cleanup() hook
being called, due to reliance on pci_find_ext_capability().

