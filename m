Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 022C68B1833
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 02:54:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711746.1111968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rznNI-0003om-Tz; Thu, 25 Apr 2024 00:54:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711746.1111968; Thu, 25 Apr 2024 00:54:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rznNI-0003ly-R6; Thu, 25 Apr 2024 00:54:08 +0000
Received: by outflank-mailman (input) for mailman id 711746;
 Thu, 25 Apr 2024 00:54:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HNrt=L6=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rznNH-0003ls-Jp
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 00:54:07 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5119a8d9-029e-11ef-909a-e314d9c70b13;
 Thu, 25 Apr 2024 02:54:06 +0200 (CEST)
Received: from DS7PR06CA0042.namprd06.prod.outlook.com (2603:10b6:8:54::23) by
 DM4PR12MB6591.namprd12.prod.outlook.com (2603:10b6:8:8e::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7472.46; Thu, 25 Apr 2024 00:54:02 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:8:54:cafe::f1) by DS7PR06CA0042.outlook.office365.com
 (2603:10b6:8:54::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.35 via Frontend
 Transport; Thu, 25 Apr 2024 00:54:02 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Thu, 25 Apr 2024 00:54:02 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 24 Apr
 2024 19:54:02 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 24 Apr
 2024 19:54:02 -0500
Received: from [172.31.124.47] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 24 Apr 2024 19:54:00 -0500
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
X-Inumbo-ID: 5119a8d9-029e-11ef-909a-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFEYnwpzNSG3OUtIlF7Vax3ObPwI6Z7c140y+hM4FplrOIHjz7HNzKAE8svfB5zz4lKJtRUC15g2QRQYktw673mqjfm/TatlZOMh5joPFu/fa1txyctZ25Me7jwRWabtn2A0vKiN+pNNlKMt0h7VDJI5MO5i5jSQ3ERpoaODfBD70Ss9FDD4B0UBiteCuRjipB/ix3JlxIW7Q8a3Rkucgiqw4R0hohIVYLp1mkNUC8DJQat3IMtn00z7XzVOsAph9+pnsSJJVPQ7LVrybMGWoheRwFv1oDUnFKFx/Fnw0DGwNVXB1qd8ZaY0gmcBZi39EpvTdtOTUnWLhtn8VCYkLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmZ4ClUD+R6nCod+fldRPcvrqL2Vg2CqlbBWdWc4NfU=;
 b=go0CIRiPw1SJ+bF5ZjiJ2JSy+D3H/QgeXAIx9Hd/HjPhlOucsD67qHZxXlX7AQ86yXAWXPn1VZTiB8iQ51bFcAc6WH2vIDnkIXAKCO52CIZKA2gektnm5KmgWC7nfbR53aiOuEYAMFgQ2/B+MTRUNBzexxhTAB5B7I7WsqVsYH9xihhAutFTa1Kguzenpjl8qINRNSDu/Mkul+KbzDQttCZUH+escHF17Bs3lhRydb8ddaOqxtN87Q6JP80z6/lOffyO6b9W3ezcpqYkpRzhV40nM0X5s8B5gmoOPoVwIRLA5StCDdWU2FLcqp4EvUC1LXFz3J5e+zyIL6BVArvQAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmZ4ClUD+R6nCod+fldRPcvrqL2Vg2CqlbBWdWc4NfU=;
 b=Sj3smE72iQ4tnmsVwzuP2/rjyEzcEsJZ9Vwr5SVhtXBPk3mRhwO3+6xtYKWQdJQkvcrfsiTpxkvvr4FU6aJGcH+JBK8MkbnAeLyFb8qk6Cseq3X1EPcSSTVFagz14mLi6M4PjharyV8S/Pgve9ohwvL18BPM0LqyXTiqy1wNmF4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <8071fb8c-4df8-4905-b203-cc1119038675@amd.com>
Date: Thu, 25 Apr 2024 08:54:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/15] add a domU script to fetch overlays and applying
 them to linux
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@citrix.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, <xen-devel@lists.xenproject.org>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-15-xin.wang2@amd.com>
 <bc2aab70-08c5-4dfe-91ab-c1c24163cd46@suse.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <bc2aab70-08c5-4dfe-91ab-c1c24163cd46@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|DM4PR12MB6591:EE_
X-MS-Office365-Filtering-Correlation-Id: cfa16370-1aaa-4f1e-993c-08dc64c23366
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WHdUdWNFNEtRd0lJYVcreW8zQlJXRllFSEJ5L0RReCtQVHVDbW9PQTNFWUUr?=
 =?utf-8?B?bGNTZU0xeVFSckswSXc2eEFBaVdVQkFKMkRuLzI2b1RaZWZkUUFYOWNqbkZY?=
 =?utf-8?B?MGhLaE5QM0kzdklaRk10QmZLbjR1aW5uU0tuWWlsRmJkbGdSeWRVN2FDY1pv?=
 =?utf-8?B?RTEzSEtxcnlJbERacWZJcnp1NnI1SVpWd3pjVDJQbW9PdFo3UVZuQ2F3TXZM?=
 =?utf-8?B?Y2RxT0tZMWhjMWppQ0YzZmNCYXJKc1hrVHU2NFdmTFBJdzNUaFpZb1RuTXBs?=
 =?utf-8?B?SGhieTFTenVXZnN3aWhlY0h5TlRlaGNtNGFDVmZ3MktveFQxKzJlZ2oyeGRJ?=
 =?utf-8?B?NVJjcEFDUXM5Q3Z0bmtURy9VVGkwSllIMkkydGo1V3NtMWg2Y1kyOUtXeXpT?=
 =?utf-8?B?S25ud0oxbDFCazhoOXJnVk5lb2ZYSjFpUmdGdnhiTXR2R3lIVmZqR1FsMDN6?=
 =?utf-8?B?MjZjeXF1NDd5UnJySWx0cUN6dS9NMnp6TDl1OGR5anNJdkNhd1I3eXRETDZI?=
 =?utf-8?B?djgzM21UWVJsM0ZaRzdHZzJOM3lNb0ZsYzU2YVdpdHZ3SEgyRDdsRis0Y1Rs?=
 =?utf-8?B?TEZvVlVTWXA2K1gwc1lzY1k3OWp4dk4zSTN6T0FUWklwM25xS20yam1Zc1V3?=
 =?utf-8?B?ZXhCNU81dkRzdzk4TDdNcFNjWDFMWXA3emZNNmhCd0JMWXVHaHFOUUtlUGpD?=
 =?utf-8?B?OE4wOFJvVXpHTDBNalpNSExseWhkOHZXdTlOeTlreDVDQTRHUlZuVmZVM2N3?=
 =?utf-8?B?TzYwN1gwK29DK242c2ZjMnVPKzBnNW15OTFyZ3NVNm84MkhrdXlZOXlURW9F?=
 =?utf-8?B?TWlLOU9KbzFBb0oydVRZMmgvZW9SSFhGYmV6VytsN01ndEluRmtlSnk2UXh2?=
 =?utf-8?B?N3ZyanFETVYyYzVoVWNUNFJXQmJZQUdESXF1YlM1ZlFveXk1UXlvN2lWZFZt?=
 =?utf-8?B?WHdocC8yeWJPRGlPVGp0Mm5mcTNCdXEyNGZZSXhPK3NlZGNjdEx4QVdpMlZN?=
 =?utf-8?B?LzBUTWgvd1JBRFNrOGNieWV2MXJlaWZFQ0RwTDNrc3BvSTNDdC9vWGRoNE5O?=
 =?utf-8?B?WmpZbWtpUDdDWlB6MXhadVdwVnIwTllIS2RibTJkYXBSbkdnUG9UUXcwT2NI?=
 =?utf-8?B?K092UksraXlIdkEvbEUxTXhzdnJiR3pqbXdqSGdLSnNUMUxlZytkRGNqTUxC?=
 =?utf-8?B?b1J3Zm9CbU5LZkpqOWtWenNaOHA1ZGJaTEc0dHJXbGIyL0hmQVYvYXFPSUVN?=
 =?utf-8?B?QkIzRVZqMHhOSDNVQ2RUcUtuTm1yQ0dFUkc1ZDFkdmttYlFkbC82enl4ZGJ2?=
 =?utf-8?B?KzdBVHgranRmWnNsY0pjQklDS2Rib00yaERpTDcwR3F0LzZaZnVlOWVUY1lv?=
 =?utf-8?B?ZGs5cWtzek0vSWhpMEFRbFkySnIvY1EzYzR1NHEyYlVvZVJ5KythU2VmMHRw?=
 =?utf-8?B?ZUtLYVhZR05hM1U2S0hzZVVraDBTcGJxZXZQS3BqRnlUQk9kM3c2WjBRay9k?=
 =?utf-8?B?d3dCZU80emp4dTJpTkFhSitUZlNmcklDVzJ4SHRXZFZ6WUxnUmdrUW9jZnFZ?=
 =?utf-8?B?YTJ0MVp5aVVTaFZQdWhiUWErcFVScThiWTBXbVpyL1lwdTRHVHY0K1lYamZR?=
 =?utf-8?B?bEVMbU00MjdpOEI2RlU2VmNUVmNmc1c5ai91bGh0b25CRm5hNVBwVnl5Vit5?=
 =?utf-8?B?N0p6TkxtOXVxQlFNUytneG9lc2tXRHZieWZrMldFcWc0bExXRGdCVWNuY1hG?=
 =?utf-8?B?SXdzTkYrcGc2bmErOE9EZ0haMWhLWmNHQlFKS0FqbHpKdWlEbHFRZkF4RHNW?=
 =?utf-8?B?MDFvdXJWek9FbThPSXJvSEJGRXVYbEJuRWpMdnZkRUg2K29uN0l6UDFTblJ5?=
 =?utf-8?Q?AQOGDcLHcW9N9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 00:54:02.7625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa16370-1aaa-4f1e-993c-08dc64c23366
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6591

Hi Jan,

On 4/24/2024 2:16 PM, Jan Beulich wrote:
> On 24.04.2024 05:34, Henry Wang wrote:
>> From: Vikram Garhwal <fnu.vikram@xilinx.com>
>>
>> Introduce a shell script that runs in the background and calls
>> get_overlay to retrive overlays and add them (or remove them) to Linux
>> device tree (running as a domU).
>>
>> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
>> ---
>>   tools/helpers/Makefile       |  2 +-
>>   tools/helpers/get_overlay.sh | 81 ++++++++++++++++++++++++++++++++++++
>>   2 files changed, 82 insertions(+), 1 deletion(-)
>>   create mode 100755 tools/helpers/get_overlay.sh
> Besides the same naming issue as in the earlier patch, the script also
> looks very Linux-ish. Yet ...

I will fix the naming issue in v2. Would you mind elaborating a bit more 
about the "Linux-ish" concern? I guess this is because the original use 
case is on Linux, should I do anything about this?

>> --- a/tools/helpers/Makefile
>> +++ b/tools/helpers/Makefile
>> @@ -58,7 +58,6 @@ init-dom0less: $(INIT_DOM0LESS_OBJS)
>>   get_overlay: $(SHARE_OVERLAY_OBJS)
>>   	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenvchan) $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) $(LDLIBS_libxengnttab) $(APPEND_LDFLAGS)
>>   
>> -
>>   .PHONY: install
>>   install: all
>>   	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
>> @@ -67,6 +66,7 @@ install: all
>>   .PHONY: uninstall
>>   uninstall:
>>   	for i in $(TARGETS); do rm -f $(DESTDIR)$(LIBEXEC_BIN)/$$i; done
>> +	$(RM) $(DESTDIR)$(LIBEXEC_BIN)/get_overlay.sh
>>   
>>   .PHONY: clean
>>   clean:
> ... you touching only the uninstall target, it's not even clear to me
> how (and under what conditions) the script is going to make it into
> $(DESTDIR)$(LIBEXEC_BIN)/. Did you mean to add to $(TARGETS), perhaps,
> alongside the earlier added get-overlay binary?

You are right, I think the get-overlay binary and this script should be 
installed if DTB overlay is supported. Checking the code, I found 
LIBXL_HAVE_DT_OVERLAY which can indicate if we have this feature 
supported in libxl. Do you think it is a good idea to use it to install 
these two files in Makefile? Thanks.

Kind regards,
Henry

>
> Jan


