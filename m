Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A50668C043
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 15:37:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490505.759232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP2cg-0002sM-R1; Mon, 06 Feb 2023 14:37:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490505.759232; Mon, 06 Feb 2023 14:37:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP2cg-0002q7-NX; Mon, 06 Feb 2023 14:37:34 +0000
Received: by outflank-mailman (input) for mailman id 490505;
 Mon, 06 Feb 2023 14:37:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X8u9=6C=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pP2cf-0002pz-73
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 14:37:33 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8f23835-a62b-11ed-933c-83870f6b2ba8;
 Mon, 06 Feb 2023 15:37:31 +0100 (CET)
Received: from MW4PR03CA0311.namprd03.prod.outlook.com (2603:10b6:303:dd::16)
 by MN0PR12MB5929.namprd12.prod.outlook.com (2603:10b6:208:37c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 14:37:28 +0000
Received: from CO1NAM11FT070.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::15) by MW4PR03CA0311.outlook.office365.com
 (2603:10b6:303:dd::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35 via Frontend
 Transport; Mon, 6 Feb 2023 14:37:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT070.mail.protection.outlook.com (10.13.175.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.32 via Frontend Transport; Mon, 6 Feb 2023 14:37:27 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 6 Feb
 2023 08:37:24 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 6 Feb 2023 08:37:23 -0600
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
X-Inumbo-ID: c8f23835-a62b-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eK3YgWcDRz03FuuMMbCY5rtuj6ibMgcqFWIW2lULHNjRf7g2yhOaqbIqk0N7ylEgcHeWDouA+oilUbMr4xLr9ldubEVrRj4ygMwX47Xy7bWdln86eih9fhg2isNEZ/+bjyPYbCfgVkgBHwjToQiUM4HZFk73R6jLL12/J/0rzwR+R/1ODFDS6SdTTcjlW//DPCqMKc40WKowYyeVuRYDptlu9RZYdQenAXbTL2e2qMIY/3RB+HrGPLl1/14KPuFxLGqa1fvf+dMHt6ZB+WmIWCIR2bEFZCwfAgdw2hz3h2W1TTZrsBgfj0n7kTzlyAzWh4ywHIeNiyQJanHs7esPYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwsG7IefSP2GkK6J1PpfDL/s9Svfm7wg2M+oTHlM9UA=;
 b=fLfB7Y5b+lCBUCMi8KGAAvVSu3Mn4fboxrBzV9RzoAkmBtUxj1R8EhSnFn+qYnCPJIcUfw2w/G+xlFMfosojQ5fh4brr4YL4W1wEN1+BqLY3FzcFIgPunfeV3lCf4MwpxSjeY3X6HCWuUy8MZ9TKC9Rr+rjQgsAtJx0TNrZd70028yjCz5VM4NgVgc6kwiKgLLffl3rE7WZ+g//bE1LTJ7YQ0keOvTvabbc4ePl9BNn70xT5qDY28l8cqkL/mGZ98L4Ht4na+BedaFubiQ6HO1oGDNUuo6Xqy3qyhLZM5tBXz3ZPXT8LixF40XeDLGQOoGNNPy0AudFok0BeNMe4Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwsG7IefSP2GkK6J1PpfDL/s9Svfm7wg2M+oTHlM9UA=;
 b=is8gJdF70ThE7WuLXtYo1Bj5HJubY8L1VeaYWVHuw3Kv+8EFKW2pLuV1gfhn3w7WgCNhwoz1eyEAvXSBPZ+DlsgU0EzzkPSbMmvgIgMadQ9Ww/wak4dRyOs8HTYQ8DjWM/N7TodrwVZ8K/J2o9UPg+d/6rtP8WMlJwIUjhk45L8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e95bdcc5-7567-dc79-10c1-281ce7f3226e@amd.com>
Date: Mon, 6 Feb 2023 15:37:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/2] xen/device_tree: fix Eclair findings for MISRA C
 2012 Rule 20.7
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>, Xenia Ragiadakou
	<burzalodowa@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <20230203190908.211541-1-burzalodowa@gmail.com>
 <20230203190908.211541-2-burzalodowa@gmail.com>
 <4388B281-EAEB-456D-8759-6DE055755735@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <4388B281-EAEB-456D-8759-6DE055755735@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT070:EE_|MN0PR12MB5929:EE_
X-MS-Office365-Filtering-Correlation-Id: eaa1a50f-ed32-4b71-1c09-08db084fab68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ydPCYzL9phztLP2EVsua4i3vI0O06+sUmFbHxgf6BmpXiEl29SPT45yHjnOtuIBQ3eLoy2BDRT0Cslm87GhZcszOc+DjmJ2+yJura/KzIng3hMizMp3sug6ahKSXIn+leJGe/sFPirHn9Pe6fLNClnNTnCMxbc5a6Tj0ALXkE5EI8MN1zDKgIsvGX2NJUw9NA3i4+Dbhw93DGbeWr2Z3CYC/f79hAGgd/Wfwb24RgedcyVY432+y6zuu8Dr3MURAeiWvIt5C9mFWGqcwayi8IsM0DhRPAcZwuagUMICml+5Ijiay/wqGAyEz9nD1Bs+HEVZXalZdqhTlwNfGjyJmqBaOKpI+E/guWlZLaRzRSLl+R1ZgSI+bZK8+1Bdh8ymDOGPIbmtpuooTMln/CioOTpnYwHon8rPU0sUV7Ej1wRGMBic/8Jt/ZInyDxqXmkLX5Wcf4AM7OddaRufTImgLYMcaw6zv6TfPDJiTR+wFZ7AsIxDET4aCr3sXREu9p6hhwcP6JTwMOkZAMjUbS8OzTBsFm8c7qaORQNT75cvbzQj23AmzwU4YcXXPIqYpCwCr8IA8Dwyr/xw6gpSUjDb1d2bkd6K+S87gky94y6kCrr1wxOkzPBQ/cIp1TM6T5vMIcYqMWYSo0CyKpudnX0N03PKtG36e/iCGGkfi2hSTB/qcYks9tMPk0jG8z11EJCGAeU79LPpngMfUNj0kFvN4eiUTAudqxET86oKmmUqb5aGpfDbfAcvSHh2w7o39+38Gj5PbC/0mutg+jxQmoG89mdx/R7xUuaB6Ndbi1BZMqRI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199018)(40470700004)(36840700001)(46966006)(36756003)(40460700003)(478600001)(966005)(2616005)(53546011)(186003)(26005)(8676002)(8936002)(41300700001)(4326008)(70586007)(70206006)(44832011)(2906002)(16576012)(316002)(110136005)(5660300002)(54906003)(81166007)(82740400003)(36860700001)(31696002)(86362001)(356005)(82310400005)(47076005)(40480700001)(426003)(336012)(83380400001)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 14:37:27.2503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa1a50f-ed32-4b71-1c09-08db084fab68
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT070.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5929

Hi Luca,

On 06/02/2023 15:31, Luca Fancellu wrote:
> 
> 
> Hi Xenia,
> 
>> On 3 Feb 2023, at 19:09, Xenia Ragiadakou <burzalodowa@gmail.com> wrote:
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>> ---
>>
>> Changes in v3:
>>  - the fixes are based solely to Eclair findings (the tool has been
>>    adjusted to report only those violations that can result to a bug)
>>  - reflect this in the commit title
>>
>> xen/include/xen/device_tree.h | 14 +++++++-------
>> 1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
>> index a28937d12ae8..7839a199e311 100644
>> --- a/xen/include/xen/device_tree.h
>> +++ b/xen/include/xen/device_tree.h
>> @@ -37,11 +37,11 @@ struct dt_device_match {
>>     const void *data;
>> };
>>
>> -#define __DT_MATCH_PATH(p)              .path = p
>> -#define __DT_MATCH_TYPE(typ)            .type = typ
>> -#define __DT_MATCH_COMPATIBLE(compat)   .compatible = compat
>> +#define __DT_MATCH_PATH(p)              .path = (p)
>> +#define __DT_MATCH_TYPE(typ)            .type = (typ)
>> +#define __DT_MATCH_COMPATIBLE(compat)   .compatible = (compat)
>> #define __DT_MATCH_NOT_AVAILABLE()      .not_available = 1
>> -#define __DT_MATCH_PROP(p)              .prop = p
>> +#define __DT_MATCH_PROP(p)              .prop = (p)
>>
>> #define DT_MATCH_PATH(p)                { __DT_MATCH_PATH(p) }
>> #define DT_MATCH_TYPE(typ)              { __DT_MATCH_TYPE(typ) }
>> @@ -226,13 +226,13 @@ dt_find_interrupt_controller(const struct dt_device_match *matches);
>> #define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
>>
>> #define dt_for_each_property_node(dn, pp)                   \
>> -    for ( pp = dn->properties; pp != NULL; pp = pp->next )
>> +    for ( pp = (dn)->properties; (pp) != NULL; pp = (pp)->next )
>>
>> #define dt_for_each_device_node(dt, dn)                     \
>> -    for ( dn = dt; dn != NULL; dn = dn->allnext )
>> +    for ( dn = dt; (dn) != NULL; dn = (dn)->allnext )
>>
>> #define dt_for_each_child_node(dt, dn)                      \
>> -    for ( dn = dt->child; dn != NULL; dn = dn->sibling )
>> +    for ( dn = (dt)->child; (dn) != NULL; dn = (dn)->sibling )
>>
>> /* Helper to read a big number; size is in cells (not bytes) */
>> static inline u64 dt_read_number(const __be32 *cell, int size)
>> --
>> 2.37.2
>>
>>
> 
> While the changes looks sensible to me, I’ve had a look in eclair but I was unable to find the findings,
> here what findings I have in the latest report:
> https://eclairit.com:8443/job/XEN/Target=ARM64,agent=docker1/lastBuild/eclair/packageName.832204620/fileName.1811675806/

Eclair does not report violations at the definition but rather at the use.
Check domain_build.c for example to see the reports for 20.7 related to these macros.

~Michal

