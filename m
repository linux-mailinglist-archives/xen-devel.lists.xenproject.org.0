Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70522401C15
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 15:02:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179844.326263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNEGR-00006b-Dx; Mon, 06 Sep 2021 13:02:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179844.326263; Mon, 06 Sep 2021 13:02:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNEGR-0008Ut-Ak; Mon, 06 Sep 2021 13:02:19 +0000
Received: by outflank-mailman (input) for mailman id 179844;
 Mon, 06 Sep 2021 13:02:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNEGQ-0008Ue-FX
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 13:02:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a92c2aa0-0f12-11ec-b0a4-12813bfff9fa;
 Mon, 06 Sep 2021 13:02:17 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2050.outbound.protection.outlook.com [104.47.5.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-QMFLyJeKMY-g26Ww_Z7L6g-2; Mon, 06 Sep 2021 15:02:15 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4608.eurprd04.prod.outlook.com (2603:10a6:803:72::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Mon, 6 Sep
 2021 13:02:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 13:02:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.4 via Frontend Transport; Mon, 6 Sep 2021 13:02:13 +0000
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
X-Inumbo-ID: a92c2aa0-0f12-11ec-b0a4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630933336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q25vTfg9n5hflZMUVunRhlsx6PeE8kCcVjZSgImDym4=;
	b=Hil60oNA16WPL7nAR9GmglMgALqsmElPcmp7kYa1e99cTME/rfDrrxEITbHYqgWF4taPnx
	COm/MrHVqkV3SqXlYOPPhyQHaF+qouiLrLVht3Z/9Fkh+BBNp9jDtRP4ENGGgnZE486WiB
	AnMAzkBjxOao7l0ShqA1uwv9cFad578=
X-MC-Unique: QMFLyJeKMY-g26Ww_Z7L6g-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wpk2a+RIrLwrozxDrlSrKSr+lrUEz7Qyzi0XBq5rCfDv1GoM4sHuR4rZFTI3lklQ5wW2FPvQLAJc71WboulW5/qvV94Vb61eHbWOkKEP6u4S/y182aEEumftrSyFyIXUVsGrd+Z6eQTV7eMUQA/8kcPdnDo3CVX4HF+EPRqaMpTWef9lYO+KLFlJQeaTWZYxsMsGtfsqbFljLGmhSW/cLG9dmrqWxtIHKtg6ZDKhLQG1YyKUiUxq5jxPdepKaeYlZpQNsUxUireO6QGkmSUky2RN0ZLilno7H7un/V3sqFTWDS2TIpL2qvB4dFR+AiDPTRO2CosbI1TkhBO9rX1X3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=q25vTfg9n5hflZMUVunRhlsx6PeE8kCcVjZSgImDym4=;
 b=hYJTTisj4WdVmIQ17WL2uPySfg1kK7K6LElXWrUDjAsXNoXYCNlNO7yYjFKgzEwN3FKA3boWAXwq2nJ6cVdwi6PNtjPKKKMThaxVSt0gyB6RgDmGalP1zpzIU14K5FnO3pIhArPr70TaT1NgCslFBXl3tPZtodqO57L2V/lvJgSJ03omu7gvOav990u28gRUN51F2H2qZkkz11SvfcDMj14cV2yRBt7IijKYcuarT2ZilM8eJO4nByXvs0ajsuI4XySd1Kt9DSnWX4DzdobNZaD6+LnB7HlFT8vqEs1/loegrkDjc5eCIj5LswxMes3b/kP6otqvQ3b6cJUMTcyPUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 5/5] x86/mwait-idle: adjust the SKX C6 parameters if PC6 is
 disabled
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e16ff1ad-b1c5-f4e0-9336-716eceb93a9f@suse.com>
Message-ID: <aa7dc2e4-6a80-dd7a-81d6-92690f6e0bfb@suse.com>
Date: Mon, 6 Sep 2021 15:02:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <e16ff1ad-b1c5-f4e0-9336-716eceb93a9f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6c4a2ae-3b3a-4497-6e39-08d971368be8
X-MS-TrafficTypeDiagnostic: VI1PR04MB4608:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4608D15FB7D47D1C0CF87EC1B3D29@VI1PR04MB4608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sOgmmceWZFhjWuATx/r6y2TEs4E0O4koN+SZvZW1sgtpSVSlr+gW88szl4fS/17a6xf2zHUFAoBKtRl6GuIl6qtATTMIYeepIFt+IJy4FqAAplMGMibR/ZRaYSnNtmY0QcVLYrA3udvnmlL4qm3tOqfFhIHmYucLNv278yLxoegEwVwv1N446PKm/JHD8sjtI4E3cd5yKmCZuQU/gvDtk0FwZflk/Q6QTsPjHzxIUNyE6MwnsnDjhfX95Sqq9FQEU/39Uylu74NYVpyp/JXRLv0WOw7yGk7ZsB10fGQmrLg1R9xQcdVe1DzNo7j6XMTNrliiBZwF7m8bfo5bdkyEjlVf689DvmR5aonHh2TfDDg5zE43I05sOY24doNkR5MNkqy6vqYEqtVDNLNxqBFrcvyvuXy8cZaODeli7HZJHK5+9EdrjADOHKfVxpNQLalZ/02XNLlMi7OdSEQd5mCjx7I9x5H1EElUQL33en9XOWa6hrRjo3uw0h56At1BTNHSlAa6csds4KFBT+WqQYESiItiv7TqYK3wphunlJWHJW4ClCzU8tPsl/IhpC166btTw736q6voN+7Xb4x0f2FEkHj1EX8q9EXy66R5e+fyANtw567Xt+H4co4FuNKJkxVh3OCCD9mEKVwsi60riGakBvRuOv/6zuDul08Sl66CUbIkccrvo+t9mHXdr+jJ6uhv8R91JyJBa1PR8C8B2OTMgRYyoYlslVfGNPXhwWEFtOP7U0yBW2gYMHLkhNaO+kU/2REB8YRtvo3pY+8hTLOmc+ehYzPAay3AfBIoM6h/IEVzJ8tuVrGeW1S/hUwxZVuw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(396003)(366004)(346002)(376002)(26005)(4326008)(86362001)(186003)(6916009)(316002)(956004)(66556008)(966005)(38100700002)(31696002)(36756003)(5660300002)(83380400001)(2616005)(66946007)(54906003)(66476007)(478600001)(8676002)(31686004)(6486002)(16576012)(8936002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTdJZ2ttbGdxNXF0WE9QdVNPQU9nVW1CTGxyamkvUlNsdzZTL04reDhrN2tj?=
 =?utf-8?B?TFRWaFRBeFF1OEQ0bzhXYzk2UG5WZG0vd21aZk1WK0JSbE1MV00vM1hVWHZM?=
 =?utf-8?B?WU9lMkp1M25yU3pqZ2hHSUkyZzdYQU1rT203b0YvY2dLQnZzdHEzUE93SEdO?=
 =?utf-8?B?VDdCU2RwYkdQSTFOMm1aazR4OUh2dzZ3M25xckgwS0JGSlFWcnZ1M1RPWXJu?=
 =?utf-8?B?Uy9pTUhZRGhHUVU1cWNZSDBSVU9lWkplWEplaTJGU3BXbzR1QmhPUTVpVDhW?=
 =?utf-8?B?NUZ6THgwQStqRUIxcEZhdEFybklZY1JUdGVvTUhLcG4vRm5sb3h0TG5WSlZE?=
 =?utf-8?B?ejZ1TjJBelZqcWdtdmdXZHNiQXB0RHVGdkM1Y0xsRmh4MzhIazJnazFnYzA4?=
 =?utf-8?B?cFBBazBSRGN2SnJ3dGVWQ09FL0Z2T1hjNGgwck5NSVVhU3ZNQ2JBcFlSUjFX?=
 =?utf-8?B?NHJNYzRlekJBemFnM3F6WXB5ejFFZUlSaHhqUkVWaDRObTNaNHd0bEI0TERk?=
 =?utf-8?B?dVpSTzJHbDlSczJrZ1o0M3BFWnhoM0VKZzRFUEhIQTNqUDR6V0xVUkFDcUlR?=
 =?utf-8?B?djZpdnpGSGZCVVh0aVJKUmoxR2lMY3FwemRDeEQwcStoMUpiRSt6NkIxZ3po?=
 =?utf-8?B?WGhrNTZmQTkrdG9KK1ZKbHF0QUZwYzk0eUJZUTRlbnlRekhJRUZQeG1qUGQ5?=
 =?utf-8?B?WVozQmtKNTRCaU1wQ1pNR2h1dFd5ekE5MVphQVh1cmF1d0EwekRhYTg3L0dr?=
 =?utf-8?B?a3E4UUVQMUE3MFlmQldOK2d3TTV0WEtxQWE4ZkVyTnpub0F6ZHc3Q1ZNVGwv?=
 =?utf-8?B?RVFaRVV3d01UZGE5TktlQ3daVkpxYXRzY0NqMGFBcGhHT0piQkJkeHpRY0Nj?=
 =?utf-8?B?WE9mU2E2YWZrVEhidkJubXJ2TEZPZktyQnAzcnpWWHJYd2VTWXhZVHBwY3lB?=
 =?utf-8?B?ek5PT2liVlpHL2RzNzNzK2RXNzlvZ0g2TWQzUVFBS2loTE4xUEs4a09kRFQv?=
 =?utf-8?B?MXZFMzNQcGZudG1oSjNwSWlHQ0VQTnJmcndsUEl4QWJ5aGFGZjBKazVzMUpH?=
 =?utf-8?B?Y3c5ZlVsRWg5NVp2TS9lSG9CWDF6VFBHQmxIOFJGK2NGb0Q3RFg2eUFWQ3pO?=
 =?utf-8?B?eFljTzkwSWRuWEZWek5FUTNsZHRpRVQveEtiSmMxSGxqY0N1aTl3dXR2cjdl?=
 =?utf-8?B?ZnBXd2VSRnZRSE4wYnRoN1pmb0xrSUc5cjRPVjlWYWJLeGJFT21xTzBYdjRr?=
 =?utf-8?B?SEdMYkM3em0vNGI2b0NRaWZpb1A1bU04aW1iV0tSWUVlVjlVRHBHNk5sdUo5?=
 =?utf-8?B?Z0hTamJFSUw5cGpXNnFZK0RjVjgvYVgzMzJaNjBWUGI3UGpmUnZHYWgrSnpE?=
 =?utf-8?B?djFYcGltYmdHeTBGOHkxSTZvb1lYdmhmZjFCYU5ONzRWK21tendXZytLeElG?=
 =?utf-8?B?SUc1MkhOOVJpRytaMUtMTWQvV2VmS1lGT3p5Y3orVUNJL3lvdldKY0hSN2c2?=
 =?utf-8?B?VVhoREY1TjFvdFl3anQ2cFRiZWpPaE9WMzlHM20xOFEwZWtMY0V2alFwRFJt?=
 =?utf-8?B?Z3lKcEJ6dWRaTHI1M2syN1Yrc25uVjBVMGhDVnVJczFKL053ajZ1LzFuR21B?=
 =?utf-8?B?S0tnaFZPYmVEM09QQzAvY3pHYk1pY3RPYkx5M1QzMjhqRFRiQzltVHM0T1JP?=
 =?utf-8?B?eGhPZ2E3VGgvMDdsS3cwcStDVnNTSWlUazFXZTdyRjgyQnBpSEY0QW5DdUVo?=
 =?utf-8?Q?6orz3kj96UWtAkQqJpg0HdyNl9tp7twDD8UoWyt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c4a2ae-3b3a-4497-6e39-08d971368be8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 13:02:13.9873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qfIPbEufWImrkCsk6wMr8vC8dfpNpdXMi9d95/6Es/JsTHPQD9knzDbeBrYwJWERQZu70yt3oTC6PlFrSeBS8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4608

From: Chen Yu <yu.c.chen@intel.com>

Because cpuidle assumes worst-case C-state parameters, PC6 parameters
are used for describing C6, which is worst-case for requesting CC6.
When PC6 is enabled, this is appropriate. But if PC6 is disabled
in the BIOS, the exit latency and target residency should be adjusted
accordingly.

Exit latency:
Previously the C6 exit latency was measured as the PC6 exit latency.
With PC6 disabled, the C6 exit latency should be the one of CC6.

Target residency:
With PC6 disabled, the idle duration within [CC6, PC6) would make the
idle governor choose C1E over C6. This would cause low energy-efficiency.
We should lower the bar to request C6 when PC6 is disabled.

To fill this gap, check if PC6 is disabled in the BIOS in the
MSR_PKG_CST_CONFIG_CONTROL(0xe2) register. If so, use the CC6 exit latency
for C6 and set target_residency to 3 times of the new exit latency. [This
is consistent with how intel_idle driver uses _CST to calculate the
target_residency.] As a result, the OS would be more likely to choose C6
over C1E when PC6 is disabled, which is reasonable, because if C6 is
enabled, it implies that the user cares about energy, so choosing C6 more
frequently makes sense.

The new CC6 exit latency of 92us was measured with wult[1] on SKX via NIC
wakeup as the 99.99th percentile. Also CLX and CPX both have the same CPU
model number as SkX, but their CC6 exit latencies are similar to the SKX
one, 96us and 89us respectively, so reuse the SKX value for them.

There is a concern that it might be better to use a more generic approach
instead of optimizing every platform. However, if the required code
complexity and different PC6 bit interpretation on different platforms
are taken into account, tuning the code per platform seems to be an
acceptable tradeoff.

Link: https://intel.github.io/wult/ # [1]
Suggested-by: Len Brown <len.brown@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Reviewed-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
[ rjw: Subject and changelog edits ]
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
[Linux commit: 64233338499126c5c31e07165735ab5441c7e45a]

Pull in Linux'es MSR_PKG_CST_CONFIG_CONTROL. Alongside the dropping of
"const" from skx_cstates[] add __read_mostly, and extend that to other
similar non-const tables.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -484,7 +484,7 @@ static const struct cpuidle_state bdw_cs
 	{}
 };
 
-static struct cpuidle_state skl_cstates[] = {
+static struct cpuidle_state __read_mostly skl_cstates[] = {
 	{
 		.name = "C1-SKL",
 		.flags = MWAIT2flg(0x00),
@@ -536,7 +536,7 @@ static struct cpuidle_state skl_cstates[
 	{}
 };
 
-static const struct cpuidle_state skx_cstates[] = {
+static struct cpuidle_state __read_mostly skx_cstates[] = {
 	{
 		.name = "C1-SKX",
 		.flags = MWAIT2flg(0x00),
@@ -674,7 +674,7 @@ static const struct cpuidle_state knl_cs
 	{}
 };
 
-static struct cpuidle_state bxt_cstates[] = {
+static struct cpuidle_state __read_mostly bxt_cstates[] = {
 	{
 		.name = "C1-BXT",
 		.flags = MWAIT2flg(0x00),
@@ -870,9 +870,9 @@ static void auto_demotion_disable(void *
 {
 	u64 msr_bits;
 
-	rdmsrl(MSR_NHM_SNB_PKG_CST_CFG_CTL, msr_bits);
+	rdmsrl(MSR_PKG_CST_CONFIG_CONTROL, msr_bits);
 	msr_bits &= ~(icpu->auto_demotion_disable_flags);
-	wrmsrl(MSR_NHM_SNB_PKG_CST_CFG_CTL, msr_bits);
+	wrmsrl(MSR_PKG_CST_CONFIG_CONTROL, msr_bits);
 }
 
 static void byt_auto_demotion_disable(void *dummy)
@@ -1141,7 +1141,7 @@ static void __init sklh_idle_state_table
 	if ((mwait_substates & (MWAIT_CSTATE_MASK << 28)) == 0)
 		return;
 
-	rdmsrl(MSR_NHM_SNB_PKG_CST_CFG_CTL, msr);
+	rdmsrl(MSR_PKG_CST_CONFIG_CONTROL, msr);
 
 	/* PC10 is not enabled in PKG C-state limit */
 	if ((msr & 0xF) != 8)
@@ -1161,6 +1161,36 @@ static void __init sklh_idle_state_table
 }
 
 /*
+ * skx_idle_state_table_update - Adjust the Sky Lake/Cascade Lake
+ * idle states table.
+ */
+static void __init skx_idle_state_table_update(void)
+{
+	unsigned long long msr;
+
+	rdmsrl(MSR_PKG_CST_CONFIG_CONTROL, msr);
+
+	/*
+	 * 000b: C0/C1 (no package C-state support)
+	 * 001b: C2
+	 * 010b: C6 (non-retention)
+	 * 011b: C6 (retention)
+	 * 111b: No Package C state limits.
+	 */
+	if ((msr & 0x7) < 2) {
+		/*
+		 * Uses the CC6 + PC0 latency and 3 times of
+		 * latency for target_residency if the PC6
+		 * is disabled in BIOS. This is consistent
+		 * with how intel_idle driver uses _CST
+		 * to set the target_residency.
+		 */
+		skx_cstates[2].exit_latency = 92;
+		skx_cstates[2].target_residency = 276;
+	}
+}
+
+/*
  * mwait_idle_state_table_update()
  *
  * Update the default state_table for this CPU-id
@@ -1178,6 +1208,9 @@ static void __init mwait_idle_state_tabl
 	case 0x5e: /* SKL-H */
 		sklh_idle_state_table_update();
 		break;
+	case 0x55: /* SKL-X */
+		skx_idle_state_table_update();
+		break;
  	}
 }
 
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -45,6 +45,13 @@
 #define MSR_CORE_CAPABILITIES               0x000000cf
 #define  CORE_CAPS_SPLITLOCK_DETECT         (_AC(1, ULL) <<  5)
 
+#define MSR_PKG_CST_CONFIG_CONTROL          0x000000e2
+#define  NHM_C3_AUTO_DEMOTE                 (_AC(1, ULL) << 25)
+#define  NHM_C1_AUTO_DEMOTE                 (_AC(1, ULL) << 26)
+#define  ATM_LNC_C6_AUTO_DEMOTE             (_AC(1, ULL) << 25)
+#define  SNB_C3_AUTO_UNDEMOTE               (_AC(1, ULL) << 27)
+#define  SNB_C1_AUTO_UNDEMOTE               (_AC(1, ULL) << 28)
+
 #define MSR_ARCH_CAPABILITIES               0x0000010a
 #define  ARCH_CAPS_RDCL_NO                  (_AC(1, ULL) <<  0)
 #define  ARCH_CAPS_IBRS_ALL                 (_AC(1, ULL) <<  1)
@@ -175,11 +182,6 @@
 #define MSR_IA32_A_PERFCTR0		0x000004c1
 #define MSR_FSB_FREQ			0x000000cd
 
-#define MSR_NHM_SNB_PKG_CST_CFG_CTL	0x000000e2
-#define NHM_C3_AUTO_DEMOTE		(1UL << 25)
-#define NHM_C1_AUTO_DEMOTE		(1UL << 26)
-#define ATM_LNC_C6_AUTO_DEMOTE		(1UL << 25)
-
 #define MSR_MTRRcap			0x000000fe
 #define MTRRcap_VCNT			0x000000ff
 


