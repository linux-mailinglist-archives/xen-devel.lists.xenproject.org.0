Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MxeL9YjuGk8ZgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 16:37:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACAB29C8C9
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 16:37:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1255649.1550547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2A0B-0002sC-PL; Mon, 16 Mar 2026 15:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255649.1550547; Mon, 16 Mar 2026 15:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2A0B-0002pN-M9; Mon, 16 Mar 2026 15:37:07 +0000
Received: by outflank-mailman (input) for mailman id 1255649;
 Mon, 16 Mar 2026 15:37:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5v8r=BQ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1w2A09-0002pH-JD
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2026 15:37:05 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa39bc0e-214d-11f1-b164-2bf370ae4941;
 Mon, 16 Mar 2026 16:37:03 +0100 (CET)
Received: from SJ0PR13CA0075.namprd13.prod.outlook.com (2603:10b6:a03:2c4::20)
 by DM4PR12MB7600.namprd12.prod.outlook.com (2603:10b6:8:108::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 15:36:58 +0000
Received: from SJ1PEPF000023CC.namprd02.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::9d) by SJ0PR13CA0075.outlook.office365.com
 (2603:10b6:a03:2c4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 15:36:54 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CC.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 15:36:58 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Mar
 2026 10:36:43 -0500
Received: from [172.29.224.195] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 16 Mar 2026 10:36:43 -0500
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
X-Inumbo-ID: fa39bc0e-214d-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OrZnrfoPWqsbo8gCEW2mIe7dvGvQ8KjoINO82bKvOtM+dLCkmgH3I6jhxNFPTL/8YCo8eqGm7rC7w+XHiVq4cKaWesnq18WkgPYnWnZWwjLCN1YesFrCTxmvPx2XqXVuyRBVhTsL9Scp4epvv8HvIBnXcHyJpMYO5Em9sj4KqSmvBI4r6wOrrGCwqXqfKm4AoZm+I6aRN9JUJWNBiAlc6qaoDWwB0pOvQFHdN49UV77XDd0qbrkDGkYkPtOUbn8Kb7ySQhuhD/jYNYot3QAJ88IdmAFFB30OHNHM6l4Q166nkQ/pQJtcNqKADR1lZAGh7FpQj9/6k1LQK0vceCA8Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dpu8iTh2sFvUOhDWYTcPAeVJmYYtyW1UMq5u+rOi40A=;
 b=js/aLWr0RyWt2WsJBPt+uvlCLtBiGJUAbheQbYwAe2VZFeSHrLZNcsAexa8vRA7sm3ngDhR24ClJ0n8GlGzJPbf/Ih6E/nP2c8XqRmzW6Esu00fk2tVajoZJdIITwgenE/mfV2IW+9gyKvgbAHFG+BDL0i8y+iEmx08XBhOrw6EeskyAlCn1thOIxADbyvluJurTK7N8KFO2mgHsyyelzYXIe/SVLyG4Vke+EWapUjf/2her9OA//t6iWZwkT11P3c1fx7e4SWE4pNhx0OfyXGqmS/+duSvma1A6nB1YeGxLskbe3TfGqYZrWGBs2xsBwThTzS+wjfIOYoWoH0S5zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dpu8iTh2sFvUOhDWYTcPAeVJmYYtyW1UMq5u+rOi40A=;
 b=gx/KlwDB88l9uKUVWNBHg0M3z9mmuAtcVLkfCiCobPnLH1hVmhNN5l0N4FArEKNaWRk4OIKt/OHs2/SOHt7YSHqJN2KeZIL87wsjBAuA759CE7fKyj1zyWw6qcVtqjzomx5zNJwSFr+DYNzsnHhbpf65YUe9CY2juUfM0CJyJRA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <56e0c738-76cc-4883-afc9-1d76d211ee0e@amd.com>
Date: Mon, 16 Mar 2026 11:36:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] install.sh: Preserve directory symlinks
To: Thierry Escande <thierry.escande@vates.tech>,
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>
References: <20260313172456.871518-1-thierry.escande@vates.tech>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260313172456.871518-1-thierry.escande@vates.tech>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CC:EE_|DM4PR12MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: 816e3b47-4e99-4658-fef4-08de8371dc56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|18002099003|56012099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	GQIZGPMuHr8lCbXff4yIIxv6iVNJ9YAheS8Wnk5D694LsQgtQvf1JMXgxKfXckR422VqFzizoO5kSEE0MkgTKfrJms9vD91VQZiNegNKltQbq91I6Ug3k3kTbKpznm7cYLbTkCRqIlyf5DrcKcapDiEh7pqHRyyhYwgcWyBGCUSXadTH9A+Zu5H1+VrunLIH/46xa2lqAckNWR2YCC9svBx6ZOZbEmfDxfTmtXrOVii1aI8R7XynWlQZ1mrw/lq94mUzPA1BOVt+ccRIeDh4SUHk8zYDU2saA+fkiGHvS0QtUNKWFbR3gMJ4c3EZ/lovdaeN7ZMkJgVNr3OtH2l+kJKBkX0XRIyeHblClBfDPV9QO9zhOd5cQvf0Yq/g/nwIGugdYSCSRVYLDOGTGpvWQs5SB79uB4CdTJeHgJelS/WrCQkMT5/IT4ERGFTZaMa409qBsgCzkUWOviMhrXG+eTnKlsVNSIui8PPMQ79KKXcfvbGw3ZE1GGgUOJVJ7DiQqMonEuAbFDvFXamh0QuHPZf/BwgwIGs4kROj6UbjlAUfNO0N5+Y3N1KWk8btpAEG7rjHENRgSk8RuLAeqfA0wiI/YYBJ0/v/axRS26ed+Hh9RWURdfTK1/kZ2A2zHiFmYC1GLUS4KKi8CwwVSecmoOx4INCoABFWckcibfPF3niqMCTgzHEYvYvI2YryMj7d7gcEwE0yWOrtyb5G+oYGaYpGkH3R4Kf8SuSazGRccuZEmrlN7cprh+Thv5waCpVvbp99vTMXgQyZidyH3VfF/Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(18002099003)(56012099003)(22082099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7UWjJJ5EynoAz7ecQ9k/IxKT0N6TigvmTMrXl2UBrM/xDcvdbFdMaiWlncofmQ9kHLJGKUZILiJtYLlF1qN/JYI4QjjIWdNZV86+E/uJZfBKHDFF4dRr0en/Cz54VKKrkp/NvpV1+9pJHt1/ySYvpaJjFykTbB4Ff/eOF+LZ5Dggi9U23Vj625Le/DSi0XeGFqy1cSU3MuyXEY63/w9+8PtG+GsYKr0t3HlSBbfEXUORQ/MgdV4WfV4c5MRlr7e4MoXJQ2aH4Q3ElNIYHE1re2NYNyHI+Aj/vzZeyhI89CawbeZBi8Ihf5SHRweSsoZjDW/TRlf++ToWJ1Zw30fq45S+d8STviw2do5i2Iz3jeL1uBUqMhJkNnTZD86ZJ0S4HZwyIhzUHBwzeDlGmwyW90kBBWvgH7qJONEfBG4Up9rzLZgPqr7O1NC/3rpTsTec
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 15:36:58.3634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 816e3b47-4e99-4658-fef4-08de8371dc56
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7600
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
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,vates.tech:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 2ACAB29C8C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-13 13:25, Thierry Escande wrote:
> In various distros (i.e. Debian) some folders like /lib or /var/run are
> symlinks. Using the tar option --keep-directory-symlink preserves these
> symlinks.
> 
> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>

Coincidentally, I hit this last week.  I think the commit message should 
be expanded because it resulted in a non-functioning system.  I switched 
to make debball, but thanks for fixing this.

I saw Ubuntu's /lib -> /usr/lib symlink replaced with a directory for 
/lib/systemd/system/xen-watchdog-sleep.sh.  With /lib broken, systemd 
(/sbin/init) could not start and boot fails.

The fix was easy -  just restoring the /lib symlink.

So maybe add "Replacing the /lib symlink with a directory results in a 
non-functioning system."?

I thought /var/run was addressed by:
Fixes: 9d628ff6cc21 ("tools: Fix install.sh for systemd")
It hasn't been an issue for me since that change.

For /lib a fixes is either:
Fixes: e54a6cd6a1f3 ("systemd: Add hooks to stop/start xen-watchdog on 
suspend/resume")

or

Fixes: b34bde262c8c ("systemd: fall back to default system-sleep dir 
without systemd-devel")

It might have only been the second one that defaulted to /lib causing 
the problem.  Though the issue is more general.

I do think a fixes and backport are warranted.  With the commit message 
updated:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Tested-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

> ---
>   install.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/install.sh b/install.sh
> index 3e11c4d46f..5d0b7a4933 100644
> --- a/install.sh
> +++ b/install.sh
> @@ -27,7 +27,7 @@ tmp="`mktemp -d`"
>   echo "Installing Xen from '$src' to '$dst'..."
>   (cd $src; tar -cf - * ) | tar -C "$tmp" -xf -
>   
> -(cd $tmp; tar -cf - *) | tar --no-same-owner -C "$dst" -xf -
> +(cd $tmp; tar -cf - *) | tar --no-same-owner -C "$dst" --keep-directory-symlink -xf -
>   rm -rf "$tmp"
>   
>   echo "All done."


