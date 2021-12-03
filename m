Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E90F5467654
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 12:27:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237415.411795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6iO-0002B4-S4; Fri, 03 Dec 2021 11:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237415.411795; Fri, 03 Dec 2021 11:26:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6iO-00028r-Oz; Fri, 03 Dec 2021 11:26:56 +0000
Received: by outflank-mailman (input) for mailman id 237415;
 Fri, 03 Dec 2021 11:26:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V//U=QU=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1mt6fI-00064Q-Im
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 11:23:44 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e89::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77923883-542b-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 12:23:43 +0100 (CET)
Received: from SA0PR11CA0179.namprd11.prod.outlook.com (2603:10b6:806:1bb::34)
 by DM6PR02MB5307.namprd02.prod.outlook.com (2603:10b6:5:45::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Fri, 3 Dec
 2021 11:23:39 +0000
Received: from SN1NAM02FT0055.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:1bb:cafe::2d) by SA0PR11CA0179.outlook.office365.com
 (2603:10b6:806:1bb::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Fri, 3 Dec 2021 11:23:39 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0055.mail.protection.outlook.com (10.97.5.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Fri, 3 Dec 2021 11:23:38 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 3 Dec 2021 11:23:37 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 3 Dec 2021 11:23:37 +0000
Received: from [10.71.119.136] (port=64457)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1mt6fB-0001wq-9p; Fri, 03 Dec 2021 11:23:37 +0000
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
X-Inumbo-ID: 77923883-542b-11ec-976b-d102b41d0961
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CbJiamsWfrhX0amJuPVVirEfbbEGCLJ3/6sIoL4RkRKrHR98Ez9u2RjcBivGBhuFlJZmD9jW967LTL4H6GwQUJQCjF8TdjkFNA5Vm63DJOzOJuVrq5zky8ttWEDuwzw9y5SxRzThcHXvQVJhDmqPgbWX/2XTijHQJoaMJjxwsaOW0qjyMW9DtrOF6k8dysbuXYCvU+j42fzqf9LVYBSvhmt2kqrN1fkOWpyNL7TEsvi5n50xmGlpLF6mt77A+L75t5xo1rpf36WcOY7re5/U1E5Z8ja1FgM1NANV8W9J2Cqo3woMplsNZw4/oAjQ7WiguQ9V7FuxHNxjnL00C4jFqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvlwS1dvBlnlZTr3CCWS9Qgh2Tyhuiho/pCIHihSSno=;
 b=eDG/Z82nmRPO8bcehmmxdfobV6L+Vf3GlmIf1z5ikERR02pDCPB8de5wQVNXxuWvusPxcs4kXGYr1rjMqYUyZIGgo7lTS7srKiIh+X771NnPxkMHM1TCFpTYnLp0j/vWNxgfFsoKBWkixoZieWWrvk7KkcTwq+vKorXecFn7U54q+RNGuIfZ8jHAK20Nv7RauG/dbYclYW97BNA3Yu4XirrcL5tCOmhGSouOvjfiB27GEBVj8DldkJe0vUB8dxRI6Xgh78i+3yA4usH6B8zA+OdNoNcP/l7To8PEWneHrTrZZUEh2heHUziOR6cDKBhChYqRrGWVDN5AloX/UJcXuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=arm.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvlwS1dvBlnlZTr3CCWS9Qgh2Tyhuiho/pCIHihSSno=;
 b=Uo6kgS0BeIECj0liZiXxM8KrYmGJLAto4beg8HGR0vEFGAs33NxIItuKlp+P2niBbXmAGJzbLR5WXjsNr3M2qhwAYU2Qip4qztteEA1fQEcbqglyIevyhOsMrSX0jAUI/5ud7LNoCZP/uWsWezKosoa1eJei9XcrRQ8YxHk2V2k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
Message-ID: <fa4c0e20-3640-e948-a39d-42c80aa40e9b@xilinx.com>
Date: Fri, 3 Dec 2021 11:23:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] arm/vgic: Fix reference to a non-existing function
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel
	<Michal.Orzel@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <20211203095837.20394-1-michal.orzel@arm.com>
 <B3D7A1CC-6CEB-45C9-914C-6BF5540EA1BE@arm.com>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <B3D7A1CC-6CEB-45C9-914C-6BF5540EA1BE@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2737c03-3740-4ed7-34d8-08d9b64f5aa0
X-MS-TrafficTypeDiagnostic: DM6PR02MB5307:
X-Microsoft-Antispam-PRVS:
	<DM6PR02MB5307FE7FDE2F531D9ABC5FA1B26A9@DM6PR02MB5307.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gvS1Stq7dYgwmzbBiy1MtrvE2ku1vAra0AVriHpH06HHy7zME1fr1RgFag7AGHTsXzu6m8gqJz0Oum5U9sSgjtCwXd8lPdym7XsAKSUjnYqugR1WowBF9Pv6GZrKICM1OC3kyLpdb2qYxdIyh2vc1IzkOJaKx0V+7ic9v5h08M9qBnWzTJ0oCeOgge/wTDzfZS4N5UCEke9qpycXv0NyoKB+fmDL8VQ37naBcLXN/+sdQvEDcv/LrIYm/iHBOkN8ozHuRee3DMS/t1Mwsmbjft9b9up2VhhYddhSZE21xo1ulIYblK+wXuJqX2TAdMscEbOH+SGZjC/xxwNVwaB31DiKsZh4Uhhg8rchKbXasidLOmMSTS9t2vwqzJS/mQutjgVFfdP9zZBD50jo31Z9wqf1grb6qbT2LWrdHkjWn6cUF62vd8tckhGiZG2ZkJbMRCDSQmF7LSY8RNhOnSYjSqjqutGm1B+dntdkTTBjSqjMuVlW1CEdHroHu/ph+/rs3lTpCh9JrNSVmRR0/VpAz2B9uEJAwDysijfAURghiLqlwgRJUjON8iEMsx5gvSfaw+WZL/QJFBvjaBp5RCM58k8TZDwzqScgjtg/AZ3/WDV0NZN7LsnotQsFpaydQos5SJouvCrCqGuI2IEd8DefAhjkrd7kgHijUncx6APVVzVFQMt19ECgKsqUtZfXL3sTC7r+iOljDfAN7fMJgPEPe+Eh2ZKwAEHcOHgUhM6uhC67y3voAZCiZlYBVq5YT8V+AeCVDwjkRlG4eKA7n1nqeg==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch02.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(2616005)(508600001)(316002)(7636003)(186003)(36860700001)(31696002)(70586007)(8676002)(4326008)(54906003)(426003)(70206006)(336012)(356005)(5660300002)(36756003)(110136005)(82310400004)(9786002)(83380400001)(53546011)(26005)(8936002)(2906002)(47076005)(31686004)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 11:23:38.6100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2737c03-3740-4ed7-34d8-08d9b64f5aa0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0055.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5307



On 03/12/2021 10:19, Bertrand Marquis wrote:
> Hi Michal,
> 
>> On 3 Dec 2021, at 09:58, Michal Orzel <Michal.Orzel@arm.com> wrote:
>>
>> Commit 68dcdf942326ad90ca527831afbee9cd4a867f84
>> (xen/arm: s/gic_set_guest_irq/gic_raise_guest_irq)
>> forgot to modify a comment about lr_pending list,
>> referring to a function that has been renamed.
>> Fix that.
>>
>> Fixes: 68dcdf942326ad90ca527831afbee9cd4a867f84
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Bertrand is very fast. :D.
I wanted to check if it is ok to add my R-b.
> 
> Thanks for that
> 
> Cheers
> Bertrand
> 
>> ---
>> xen/include/asm-arm/vgic.h | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/include/asm-arm/vgic.h b/xen/include/asm-arm/vgic.h
>> index e69a59063a..ade427a808 100644
>> --- a/xen/include/asm-arm/vgic.h
>> +++ b/xen/include/asm-arm/vgic.h
>> @@ -195,7 +195,7 @@ struct vgic_cpu {
>>       * corresponding LR it is also removed from this list. */
>>      struct list_head inflight_irqs;
>>      /* lr_pending is used to queue IRQs (struct pending_irq) that the
>> -     * vgic tried to inject in the guest (calling gic_set_guest_irq) but
>> +     * vgic tried to inject in the guest (calling gic_raise_guest_irq) but
>>       * no LRs were available at the time.
>>       * As soon as an LR is freed we remove the first IRQ from this
>>       * list and write it to the LR register.
>> -- 
>> 2.29.0
>>
> 
> 

