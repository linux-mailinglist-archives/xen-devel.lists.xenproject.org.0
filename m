Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGGEAUM7vGl3uwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 19:06:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EB72D089B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 19:06:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257486.1551874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Hl7-0001xM-6Z; Thu, 19 Mar 2026 18:06:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257486.1551874; Thu, 19 Mar 2026 18:06:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Hl7-0001uu-3b; Thu, 19 Mar 2026 18:06:13 +0000
Received: by outflank-mailman (input) for mailman id 1257486;
 Thu, 19 Mar 2026 18:06:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vYGS=BT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1w3Hl5-0001uk-Q8
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 18:06:11 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ce62b15-23be-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 19:06:07 +0100 (CET)
Received: from MN0P221CA0024.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::24)
 by BY5PR12MB4098.namprd12.prod.outlook.com (2603:10b6:a03:205::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 18:05:59 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:52a:cafe::8b) by MN0P221CA0024.outlook.office365.com
 (2603:10b6:208:52a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 18:05:59 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 18:05:59 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 19 Mar
 2026 13:05:53 -0500
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 19 Mar 2026 13:05:52 -0500
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
X-Inumbo-ID: 4ce62b15-23be-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AFfZjtN7Fjm1Xr6tzFSfFiYiU9DOoLS+MOwIuITqwC5XlgZCeNm1SKExjNFoVxo9do3wd2EQdMzUkRXWkv8/ekeYb9cLtcET4fgqrStKVXONQHPPvAOlLtlhrgnUAjhUrzG2+6RaaUg8D1Fkv9RQf29uH6AENZzALBmwknrurj8P8gXg1Bnk9FMrgvtH2CIGrbtL/mZolVVLcJOwJj6kj7wQzr5BroLayij1ZsQsm1pqMYeK5zx5vHsI8DYmHGt2Oz91SLtDxVyWmeceNkM1SKz/gddeW6PEAHogsid6JPfTU5PszZSCm7VBbRBhmkIzjbxL2ik6kjDL8ScMfp0r2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZANLZEI6DRiruIrvsX+EAhBp9NWBIl/2ewp6ajlTNs=;
 b=w36NgjtCOXzrn/zhwsox1HV6dVwzW6cvbUtTFXsZklDpPGuiVsBSodtFrYcxa6s7/UV3mfoITFV6JtO/yQLcbTq3UGFyLU9pSjhW6TUDjoJ8Mm8elY0hJynEYDC1g52+iMretZkc1E8VB96Yq2dDw+qf7kAM+7DNMMbRKUkuYYMOwzsE6d77rfo3qRs+0EYCe1XbxoscCql5SLkpL9idwuKCOcQ0cDwF31N6lBZZbh9M8uP7RglldOf9QsuDuzcn1dmwvWb0vZBSDiVAvNMt6fzFE1KFT0CUlegTyPVD0PLYANDH/6JSMzboaWSUAkONVKMw5XZoTfYOpy/6UqNijw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZANLZEI6DRiruIrvsX+EAhBp9NWBIl/2ewp6ajlTNs=;
 b=DSbMYDZjjYmYD7I9sEAvhorxKarxjVwYGo6dP1DTnmeZmxATxu2Dy43hrHo1EoTWrqurZMT6LIeu7SBB4SN5zVDNCUoOMOK3iFDs1G5STnuKXAXDcqFoWP1Vw72pifiGd/ulrSWTGi/l969Wt05kOBdlxU5Sa3JlRSZ7NwZlkzA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <74d1c137-22bb-4e35-85ee-10e84237dc06@amd.com>
Date: Thu, 19 Mar 2026 19:05:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm/mm: Fix resource handling in
 xenmem_add_to_physmap_one
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, <xen-devel@lists.xenproject.org>
References: <20260304093923.14293-1-michal.orzel@amd.com>
 <639231a2-c8c4-43c8-84a2-b4797e88d9fb@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <639231a2-c8c4-43c8-84a2-b4797e88d9fb@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|BY5PR12MB4098:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f09b03f-a68f-4a44-ee3d-08de85e22d00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	U+rYdZWW/FwwF1SZgnWSmyooQrhYRBuNa6hvCEebKsf8ReKAvM1bFB4uPFAR9iE6c9s26C7wVLYt5TCPuMUHjjRsEJqkMkHz65j5QV7CroDgVEcR16HWUDdPWJSuios3iyOgJazNhWteiCDBBn69bzdZeG5iVu+JhEdf71evaWyfCdV8zYsb90DtGp16CdbJ1+kZKZm9Eju7RqfEuTRxD/OsqONGJPVDWGmIRVw8hl90UEmTE0abgEJpKWVOmQ3cb9rBdA50gzBOCUUbE9zwr40N+LYUSKDTwJLEI4h1w8F6XSScjefhHdkbG373goAEIQK23kC95N6n6B5+F6x/0kea3gOgAr9LQY9a/ETVoFsxK8enJn4KA1cwp7zzXjzWlKoNqIKSNQs9dglxx0QcZdWgQEvDAnSniNGB80/cpR2mVpM2/KRds2oYKxOqlUCSsoZbJInc7zqBF0mGRJgI/p+4Mnvl7ghnG4LwZYMUlEk2wP2Prkplg65B37YrXezkIXOiFin4KU74DHyGX1IzhHy6ZWfaCRKZsl/Z0K2QjiC6MFoONyMKtAOdvg8Ay780whVFiv5SIlyohnVmGG+8t87KKXG96bdzYUc4PWuxh95tWlOS7mLhPyP7OsTdLfnkZmBtPYGNsExacugRMxGxWNn5b6s63Nek9ep1kESjlxs4N/nF4yFCkX63Bbfcrt4iaCYt0NakBsdadLBRodVkSARXE3IaKUPN4mgkwzQxQrv78SgOw1UFk/ROS2oHe5XVt7ok/RWTTUMeRG9T7zc0UA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3JnxCJo0JHOQ9GfVGcB+UlXOofXhyKRbRP6PZ8APRj+GbScLt4deJqRVXEcceGZxiiH1zSxhfHALwEpDjb4+KbuEWZT2vQVGh0SpbRpyP81EyKU1rvOoHR+eh1/sKDfLBQ0nRUia/1znGNOeiK20c6TH7XxIPHPKsD40CRlMo4GBk0NnunXcYYn/yDuB/DsNvd6vcEWhGzHr1hB30znk/sSa0Acm0imAnXvDXScIog/m7Ce6aj/VJYRO19d4fYK/K7ZR3ul4APi+ZfAxYDC/cNxxRSVtjLFmHc+i9em4rHCMW8wxnXIfFOO1heo4cybXcVYK4NZWNHUcD0KolBYP/x4AgZQSpOMK80qGo+zKCJZ27DxuPrrVxUdcGR9Vg74FM6ImmI7NPC11yQQ/ZAQ+zcbgp/G/loVNf+DGGS8pYJFAglR917vYwoDuVc2VM1uz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 18:05:59.6877
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f09b03f-a68f-4a44-ee3d-08de85e22d00
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4098
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:dkim,amd.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: E6EB72D089B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 04/03/2026 11:43, Jan Beulich wrote:
> On 04.03.2026 10:39, Michal Orzel wrote:
>> @@ -237,13 +239,73 @@ int xenmem_add_to_physmap_one(
>>          break;
>>      }
>>      case XENMAPSPACE_dev_mmio:
>> -        rc = map_dev_mmio_page(d, gfn, _mfn(idx));
>> -        return rc;
>> +        if ( !iomem_access_permitted(d, idx, idx) )
>> +            return 0;
>> +
>> +        mfn = _mfn(idx);
>> +        t = p2m_mmio_direct_c;
>> +        break;
>>  
>>      default:
>>          return -ENOSYS;
>>      }
>>  
>> +    /*
>> +     * Release the old page reference if it was present.
>> +     *
>> +     * TODO: There are race conditions in this code due to multiple lock/unlock
>> +     * cycles:
>> +     *
>> +     * Race #1: Between checking the old mapping and removing it, another CPU
>> +     * could replace the mapping. We would then remove the wrong mapping.
>> +     *
>> +     * Race #2: Between removing the old mapping and inserting the new one,
>> +     * another CPU could insert a different mapping. We would then silently
>> +     * overwrite it.
> 
> Can't such races be abused in a security relevant way, e.g. causing leaks of
> some sort?
AFAICT (I though of a few scenarios), the race can only reproduce the pre-patch
behavior - pages leaked until domain destruction. After this patch, it only
happens if two vCPUs race on the same GFN.

> 
>> +     * For now, we accept these races as they require concurrent
>> +     * xenmem_add_to_physmap_one operations on the same GFN, which is not a
>> +     * normal usage pattern.
>> +     */
>> +    p2m_read_lock(p2m);
>> +    mfn_old = p2m_get_entry(p2m, gfn, &p2mt_old, NULL, NULL, NULL);
>> +    p2m_read_unlock(p2m);
>> +
>> +    if ( mfn_valid(mfn_old) && !mfn_eq(mfn, mfn_old) )
>> +    {
>> +        if ( is_special_page(mfn_to_page(mfn_old)) )
>> +        {
>> +            /* Just unmap, don't free */
>> +            p2m_write_lock(p2m);
>> +            rc = p2m_set_entry(p2m, gfn, 1, INVALID_MFN,
>> +                               p2m_invalid, p2m->default_access);
>> +            p2m_write_unlock(p2m);
>> +            if ( rc )
>> +                goto out;
>> +        }
>> +        else if ( p2m_is_mmio(p2mt_old) || p2m_is_grant(p2mt_old) )
>> +        {
>> +            /* Reject MMIO and grant replacements */
>> +            rc = -EPERM;
>> +            goto out;
>> +        }
>> +        else
>> +        {
>> +            /* Allow RAM and foreign - both have proper cleanup */
>> +            rc = guest_remove_page(d, gfn_x(gfn));
>> +            if ( rc )
>> +                goto out;
>> +        }
>> +    }
>> +    else if ( mfn_valid(mfn_old) )
>> +    {
>> +        /* Mapping already exists. Drop the references taken above */
>> +        if ( page != NULL )
>> +            put_page(page);
>> +
>> +        return 0;
> 
> Is this correct regardless of p2mt_old?
> 
>> +    }
> 
> !mfn_valid(mfn_old) doesn't imply there was no valid mapping. It could be an
> MMIO one with an MFN which simply has no associated struct page_info.
I'll address that in the v3. I also found that I cannot use guest_remove_page()
for foreign. Foreign pages have a cleanup in the insertion path through
p2m_set_entry.

~Michal


