Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C0664440C
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 14:06:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454842.712397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Xdz-0004fU-N5; Tue, 06 Dec 2022 13:05:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454842.712397; Tue, 06 Dec 2022 13:05:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Xdz-0004c2-KD; Tue, 06 Dec 2022 13:05:55 +0000
Received: by outflank-mailman (input) for mailman id 454842;
 Tue, 06 Dec 2022 13:05:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WiLW=4E=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p2Xdy-0004bw-8K
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 13:05:54 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e89::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4f42b15-7566-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 14:05:51 +0100 (CET)
Received: from BN0PR03CA0017.namprd03.prod.outlook.com (2603:10b6:408:e6::22)
 by DM4PR12MB5117.namprd12.prod.outlook.com (2603:10b6:5:390::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 13:05:47 +0000
Received: from BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e6:cafe::4e) by BN0PR03CA0017.outlook.office365.com
 (2603:10b6:408:e6::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Tue, 6 Dec 2022 13:05:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT015.mail.protection.outlook.com (10.13.176.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.14 via Frontend Transport; Tue, 6 Dec 2022 13:05:47 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Dec
 2022 07:05:46 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Dec
 2022 07:05:45 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Dec 2022 07:05:44 -0600
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
X-Inumbo-ID: b4f42b15-7566-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGnt13D0MO5gT7ScwuUqMnhn7l2CjR6FXpczi31IWxemhqKzBLGBHmjE4CAkVCuCNgkPfphsksfPKUYsxgmiXm3F6nK6ztSovfc3Thhtpkk8ayLKLJlfbPaUKO3O3qIbVZA5ypueZtMjmqarzqG0mUPJXuytJAVuKrR9nOefROPZ9OmVREeK5XVotZ1plyj+kZZplcSnImqQqtO+rk2ML5lwQeMhrQt8ahEyHCRi8a/e05UrdHYWZrhhcCi9SxOjOb9AHwHwKyEKdxQQjS1UTUEUPDVGR7wEpMejBiFvfT/4btIFvHz3oX3AZQOPAGqdpynXy2gZ37CLenka8TvYaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xAtgQeu/IEzuKbgUcGM0xxREArL7ZhQj8cAmn4U3VU=;
 b=g6h+ygWNssx8/J2YDO53SSIZfshQIFgx8TDEPYb8hKyVX81rgSJzX5L3Ssn81zGnU+QH46PUJDshSaJbZiSQ4lMh5G2n6ZSrwzMYgjFPr3jqzdPmEA/o/LDe/Et/oXCUFismXNmdV622yvTOvZbc/qwdhS76aa2KThQMTwk1w2GMb6H5GYukwEv3+FMf1gAagbaLvlt19TiH3rpVLsV5R72smLRJiXTfx1LVVGz5AvTVog+wdar0rB+yfINVnIVvMHjuVDRVpMfU63yJFsMI89SLCnqGbZgP77PmiCSwaqVEnps+ix1+boFAQUErOU9a8rRFzcQ6oBG1DaKCLkYXfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xAtgQeu/IEzuKbgUcGM0xxREArL7ZhQj8cAmn4U3VU=;
 b=PWcMEdn+6UB4oFJJDzvVM/eRq7plEUgNCVeawF4sd15CXfYHeCanQ8nDN9Q0KkDn77YTbT0TqOnMo8yQSW3t5t6VWNbDsw6T3OG9EQ6o8q1a8wkG9uHBbxGGkJlqQ+lgV90lHEpwvFhdLs+Hdk3ZbguXiOBm+Fi5oXwfczz5yPs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <92cc2cf3-4c95-1395-be2c-d076fa5d397b@amd.com>
Date: Tue, 6 Dec 2022 14:05:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] xen: Remove trigraphs from comments
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20221206105932.11855-1-michal.orzel@amd.com>
 <0bfa1b1b-7ae0-03c9-0291-5ce3f6877693@suse.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <0bfa1b1b-7ae0-03c9-0291-5ce3f6877693@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT015:EE_|DM4PR12MB5117:EE_
X-MS-Office365-Filtering-Correlation-Id: 00101c77-e793-4495-52c6-08dad78a9761
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zcOLfvgmaJjXP8gVag0fibYV/TtGA/zehJCaOi0wrnSMAylu/tYpB/3HEwFCV6fG8w4fjVkjJMMmtISDSSiFH3uYNSW+g9kzjfE9BOJEXvTW0O8birV++q6eaL5ENHqxxWORpTt2ReGVDKr7PO3NFbjP/tnk1/ZCipyxpuwJFBiaJ3HwYTYELtPjVsQiblOkwHkqC7TwvYNis7fXTge2BCwjh4+YBx3uGJPnNEP+HodzC9h5Ucl8V+yR/lX880nRuGa8I5j4jqeqIrfjyuCOw1lojOVfZF7zkpc5soQM1cKjTCY6x8ML9CSH461Uyg0ci+J8RtCj7A+jc6KvofY7RYK9wBNWY4YZfUkVtJEKKGrbGXaMgk7/HO+EbTn47Qj3nj/GGYG7yVu149yXiuIJwYKvQCm7RgL3We6nmfYQMNhV4/8mVGu/O6NWLmFb493ODWpmjM03xj63ZkqJlp+8UniLKzeoBQFFZvED/PgVZuHNq0J2X1mhO85zzVjJDsbmSuBfYpj2f3LgH2sFDbNfRt5XAtwAkkwBP/Miui4zBsyUlEmDA6iPrz6UoMsL/RY261vMRjv7dBS2E9yCTVFbmYKQVJCopYLNODEZ1iBtcd4u5sqZn9VnWYoEOPdbJsT7503TqgMB+YPaWti1wOpTF1yFlhpmECML4G0BPMniCumsZZdfF6o4k6uJIDPhvWi/jhecN6hFeA7HM0i9Z9RQ9UC0sqIDOX92hBnB5Gyw5Im8DA8U45IuE5BEhOVWRE0+VuVplX+noE3ihXX5auDm9A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199015)(40470700004)(36840700001)(46966006)(66899015)(36756003)(82740400003)(5660300002)(31696002)(86362001)(81166007)(356005)(8936002)(44832011)(2906002)(40460700003)(4326008)(41300700001)(36860700001)(83380400001)(54906003)(70586007)(316002)(70206006)(6916009)(2616005)(16576012)(31686004)(40480700001)(8676002)(478600001)(82310400005)(426003)(47076005)(53546011)(336012)(186003)(26005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 13:05:47.1074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00101c77-e793-4495-52c6-08dad78a9761
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5117

Hi Jan,

On 06/12/2022 13:42, Jan Beulich wrote:
> 
> 
> On 06.12.2022 11:59, Michal Orzel wrote:
>> --- a/xen/include/public/arch-x86_64.h
>> +++ b/xen/include/public/arch-x86_64.h
>> @@ -22,5 +22,5 @@
>>   * A similar callback occurs if the segment selectors are invalid.
>>   * failsafe_address is used as the value of eip.
>>   *
>> - * On x86_64, event_selector and failsafe_selector are ignored (???).
>> + * On x86_64, event_selector and failsafe_selector are ignored (?).
> 
> May I ask that this become (?!?) instead?
Sure.

> 
>> --- a/xen/include/xen/pci_regs.h
>> +++ b/xen/include/xen/pci_regs.h
>> @@ -246,13 +246,13 @@
>>  #define  PCI_PM_CTRL_STATE_MASK      0x0003  /* Current power state (D0 to D3) */
>>  #define  PCI_PM_CTRL_NO_SOFT_RESET   0x0008  /* No reset for D3hot->D0 */
>>  #define  PCI_PM_CTRL_PME_ENABLE      0x0100  /* PME pin enable */
>> -#define  PCI_PM_CTRL_DATA_SEL_MASK   0x1e00  /* Data select (??) */
>> -#define  PCI_PM_CTRL_DATA_SCALE_MASK 0x6000  /* Data scale (??) */
>> +#define  PCI_PM_CTRL_DATA_SEL_MASK   0x1e00  /* Data select (?) */
>> +#define  PCI_PM_CTRL_DATA_SCALE_MASK 0x6000  /* Data scale (?) */
>>  #define  PCI_PM_CTRL_PME_STATUS      0x8000  /* PME pin status */
>> -#define PCI_PM_PPB_EXTENSIONS        6       /* PPB support extensions (??) */
>> -#define  PCI_PM_PPB_B2_B3    0x40    /* Stop clock when in D3hot (??) */
>> -#define  PCI_PM_BPCC_ENABLE  0x80    /* Bus power/clock control enable (??) */
>> -#define PCI_PM_DATA_REGISTER 7       /* (??) */
>> +#define PCI_PM_PPB_EXTENSIONS        6       /* PPB support extensions (?) */
>> +#define  PCI_PM_PPB_B2_B3    0x40    /* Stop clock when in D3hot (?) */
>> +#define  PCI_PM_BPCC_ENABLE  0x80    /* Bus power/clock control enable (?) */
>> +#define PCI_PM_DATA_REGISTER 7       /* (?) */
>>  #define PCI_PM_SIZEOF                8
> 
> We've inherited all of these from Linux, and I notice Linux still has it
> this same way. Ideally Linux would change first, but I'd be okay with a
> sentence added to the description clarifying that we knowingly accept
> the divergence.
This file already diverged and we are not in sync with Linux as well.
Also there is no functional change being made by this patch so it is ok
to change Xen and not Linux in this case (which has quite a lot of trigraphs all over the place).

> 
> With the adjustments:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Jan

~Michal

