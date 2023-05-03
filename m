Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3586F551A
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 11:45:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529058.823009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu939-0008B9-Uj; Wed, 03 May 2023 09:45:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529058.823009; Wed, 03 May 2023 09:45:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu939-0008A7-Qt; Wed, 03 May 2023 09:45:27 +0000
Received: by outflank-mailman (input) for mailman id 529058;
 Wed, 03 May 2023 09:45:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pu938-00089y-Kw
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 09:45:26 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe16::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3adfdd92-e997-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 11:45:25 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by VI1PR04MB7086.eurprd04.prod.outlook.com (2603:10a6:800:121::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Wed, 3 May
 2023 09:45:24 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 09:45:24 +0000
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
X-Inumbo-ID: 3adfdd92-e997-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGtyGOsO7zERtWbhfcjaOWGePa40SgKqvrcfepqF2fArWmil5qv4VIvrXkSGMca/IGS8/eyDw1VpIhSYiOTjg/eRJdNBDsyYhF3uYx9WEATvW1BFkuFeFqg7+2c+FWKdhFh5KaDdRgl9GKA3Q2kewwjxoCaHiGnNLdiU0hNASgfScggtt8t+9AOFVWxqTXS6cFfCRkZE5z9Ox9RJZYtW9XdeG0+vOaPSptP1lYV4V0kwCdY5N9fYgAbKMcQw9W8mSqGHhTaU4WlT0yamXyDqtmQw0hBdOgte5NJNxmwJkSxOxqpvvQKODrFwYMEi7HO8jJMXNq4KzBrdtRhDM3Qkgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zX9q4vPbP6ZoAmb7n1j4z3y9de90GGwg4j8OmjDy0DU=;
 b=eDnvx2/8VO+DaLCVpFsqNOU5ScZZ+2au3awGE2RNnzrxAm9cGATuI9WymdbXehLcYEd7w+Q9F70ZG8WNLGlzBWBalAB2lTDqupEhzabKLCFr+hlUGZD1xVj51ab25pfBGDwfIzFfYkhyMw3UfTDtYSBJKXKILiekQT+5/B4RsHcluqUecP+jM/QUHQynLBliYEL8RCnVmldl64sblV+FqTQEYWp6VeJvH7DvEz9JDKBa/zxux8K5HlTCscuhGjrc04jWliwVYCPz2Qpe8WupwPCoO6TIJhegpdruuqHIeUX3dGfVNSUi8pYSIOcXKi0Pex7L3vHA0InxLko98wvOog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zX9q4vPbP6ZoAmb7n1j4z3y9de90GGwg4j8OmjDy0DU=;
 b=GenVxBVomwXnuwavtyG0H/gbr6cPoySUXFaIK+rS5sejKNgT5Hvawu+6aoHK8C5JV6bn7kdFyuys+tt2ds1q07OTUD3NIqrw1bsPIO0IaJw+DzsTJSBaQWU73GgDp56Pu1Tcjuhb2cGHFL4MGWcZp/utHirWVNLc6DkFCuYCR0j82S46gHFQBCXcubS8xTM7NXwLfCRfWPyZh7wEHxBabgMCLkFOu+j9LHZwm9P2fVbO7V8tEmXBCKmdrfH4a26BJJI4NohLEkqHt+Skk4IAgc5e10yZtmqSdBlOSN/j3DS+CYo0rVmWhRowq4+ZxeYhd+W16lvmld5ZU7IDQfINjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d55070c0-04c5-70a4-f9f3-3227d42578e6@suse.com>
Date: Wed, 3 May 2023 11:45:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v2 2/6] x86/HVM: restrict guest-induced WBINVD to cache
 writeback
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
In-Reply-To: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::6) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|VI1PR04MB7086:EE_
X-MS-Office365-Filtering-Correlation-Id: d0a95501-d4d9-423a-b453-08db4bbb1e75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pVu+Re5JO518uDmDhT6tkkfRyCRtvjUc1uHnT30Gfc8oPwLSsfckovHlIhCKdkryMdyP9+RELS4e2MhcVugtQvBXeCfHeVepuIQzS+XG2duFgeGA9EWLzXLJriR0E+tMpqeya8Kjkdb7BUB9T2wk+sOBx5PT9y7P5JBtmSX1/9JS90qNtzWF8Pq4JC+SxhOiaT3Ui6Ng3BhTSQIDzLyINHsFG1+b7+lDhzafnzsIWO97UfsyET0HIFDKplPHdTeB5aQ8bzd73B0D/+kh033HNiORKeF5oKeZp/xTFHr2k5/lSy88IcQb1AoQgcau7kn9P+nmwo2rU43pToiW6Dty7Mu5BZComGSHTOcXG7MClOsPwYQnv7dcS/mVly7QjZARM3KY0flUQSyOze5Ty4KbBgmpGwm9mdB7ae16NVuulaKJkOgAivNqrTxFPLC7ipZ4Tq3TacVeT+L3vAK9n2CGz/fT0LnhPba4QXuIAr77CRzsyWOXLhBdtqAr/N7Nr7BnwbzXyi+ikddaqc3WIYsKNj/nveeSOV0WiiyVuDsI6elT0s+lwKpqNR3n30Kpjr0o1AXeOPCMKG5XVUDwDSoczr99CmDXyX3+dnL2XhhQObixXjnZHKFHC8ME3dN8JXM2iqeaagXCEudXHmkEiaqpZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199021)(31686004)(36756003)(5660300002)(2906002)(38100700002)(31696002)(8676002)(316002)(86362001)(66476007)(66946007)(66556008)(41300700001)(8936002)(4326008)(83380400001)(54906003)(186003)(6512007)(26005)(6916009)(478600001)(6486002)(6506007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0NpK1JRb2MwTUFyYkpPRjBmaFUvajh3b0tCQkFmMTFuZGl3UWRCcTF3UENV?=
 =?utf-8?B?YU5JNVFKQ25vS3JRRDFQZjZZR1RQa0l5eG1QSlV6N3ZkMEpZVU03QU5mSlcz?=
 =?utf-8?B?M3BLME90alpRaVI2QzlzQkN2OGlSU1MrZUszMG1RMmFhS09BV2VtMVlTNCth?=
 =?utf-8?B?Wm8weFF4UVV2cU1ScVRvYU9kakU0ZmQ3VSs2UThORDdZVkpXQXBOdnEwRnJp?=
 =?utf-8?B?dGR1L3JJZURrYlBTZFR5akcwM2V5Q0VPckh4OEJzcnU2ZHFXVUpVaW1VNEdn?=
 =?utf-8?B?enIyV3Rrb3NXWkZrdkJCSHNMQW0yWmVyTE1qUU1vK3FLdjhmVG9URXRDaFFn?=
 =?utf-8?B?Wklvam5zdU1seHMwblRRWUtrM09WMkhUWVJUQmdNUThnM2tKT0dVeUVSVGRS?=
 =?utf-8?B?c1k5ZlpyMzNPWWN4UXRqRmcwOWd4MkVtelBtNWNIK1F3bTg2SXRSM3lXS3BE?=
 =?utf-8?B?TXE4VVlyOExPRUN4L1N6cVRqTWFUejVoWjQvcFJXcHBpSjFtanZlVkFyaWc4?=
 =?utf-8?B?RTc0TUdtd25jMG1HTDFId3hQRVkxdkVJcnJZb0hTWC9KQkUrMFNURmVQS2pZ?=
 =?utf-8?B?RkRISENxZGRjbmVMSklNdnUzaW9WUEtEV3dZZktSSEZpV2pYUFhNaVUxd2tt?=
 =?utf-8?B?MEt2WCttb1lQR1ptRUsxTGYyWXo1NTR4eE5PMzl3WXdQTFZuME5Icm9OeXFL?=
 =?utf-8?B?VVBPRUR2T0pkeTFHWmNpYjJEdzlOaDgwODIxNnVDMWtReGJHL096TGdjZ1Jj?=
 =?utf-8?B?bjAyOE53Zk94TWdTbUZXdlRweGVySXc0YVVNVlNIVy90Z3JVWm9vaThMamtu?=
 =?utf-8?B?NVBnUW54b0txbkJxWjEvK0ppRmovNDREY3JCQzQ1SWM1MmtLYy9lSkFSYmw1?=
 =?utf-8?B?dE1zTHk2RjdkUGFOS1h6b2lGRVFYYVZGUFoxalE1VVgrREc0aStVbzlqbHph?=
 =?utf-8?B?OUFGbVBPMHhPYnpkeFYzSkFRN1pSQ3ZzSWhZV2VFR2o0aFRDUHVaMVcrM1Ju?=
 =?utf-8?B?SGlaaS9QbEU0MWJlUElSeTdxZDdwYzdwWFI1REZsT1F0UFNlNjNJSDhtbkEw?=
 =?utf-8?B?cXRrVTh3WitXMVd0QUV1N043OHBIRFc2VVQ4Nzg1NGorenFDZG1JQjRtYk5N?=
 =?utf-8?B?aXVzWGJKV2J6anRKLzhWQmpRMkNkY2h6UVdKYVZKTS94NlVhYy9zT1lMcXEv?=
 =?utf-8?B?Wm0vdllGNVJHVDVXQVVKbWJLbjd2YWtUbXh3VTFrT0FYTkg3SE0rZ3h5YXR4?=
 =?utf-8?B?Q09SQWhMZjVvSXJiR0R0eTJYei92N1kwTUdNazFRcGlvS1NRZmdVbVBMZ0lr?=
 =?utf-8?B?UEI1NDl5bjhGbWp0VHVZT25RNlZPRnZHOFh4MHFkTk1CRk1HZjkwVjdqNnlM?=
 =?utf-8?B?dGlwSkpwSGxGWGxtcnpYcCsxUkJQL09KQkVxcGlOVEdPWEg0aEhpb3FDQTJo?=
 =?utf-8?B?Ymh6eWtvOUVnaitOenhQS0pCa2Iyd3VOdDlRNnJaTml5OGh3dnFqQUFtdVRy?=
 =?utf-8?B?OFY5Z0FSMS9VeVpDZkR4TWZRWHZ3by9nNWZtQVBMZ25KM01ReTJseVlxcG1V?=
 =?utf-8?B?N3ZHVTFkckRUdjJ3T3I0TEZWdmtWMWFpM01aK204UEgxY1lKYjg5eFR5SWxx?=
 =?utf-8?B?cDFiZVhpcWdyc2lUSlBaNS8rVy9rQklweEJQeXRKOFJEZVBoRjZvK25naHU2?=
 =?utf-8?B?QlNYbld0YitWMEVrZkcrOWZQOHVrcnhwRHZ0T1Y4em0xRys2Z0diZGY3R1cz?=
 =?utf-8?B?c2wxZi9rRGI1RnBIUEpLZkhXdVdtdEpKdGoxTGh0SDNVeDRqTUR3ZjVzWjEx?=
 =?utf-8?B?R3VhK2czTzNGVkY2elFDWHh4czVHNHVDV2pUckNtc0N3NlBXdXZoRkp0cENl?=
 =?utf-8?B?MjV4Y0RmNDluck9MVWdldmtraExkZ25qSEZrU25OeDE4WmNHUjJSSDB3OUpx?=
 =?utf-8?B?RGNrSzl3dzV5OHVYM1lKUkJtWGUrT0lJdUZmeEMwSmtiOG53ZFJET1E0Wm9W?=
 =?utf-8?B?Vmgyd2pDVkNNUkVLUGZaSDB0aWlDdGF4dkFOQmpKemxaa2ZSWjhGQ203T3F3?=
 =?utf-8?B?SzdhNmpJYWxWS21hVGtmZFlJTHBxT05QbWkwaDNaNGlxT0dBT0tMZ1ZFZFlN?=
 =?utf-8?Q?7oQxkoMiIkilqkYfjhd7cJcVe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0a95501-d4d9-423a-b453-08db4bbb1e75
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 09:45:24.6381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XjPGC+mrbEbWB9KG0+jRskqWVRrRhdkXsYYzGAwLXeu5NWzhJxRzGugBXDJIcKxHzYtyvK6QIpz/opdlekX+bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7086

We allow its use for writeback purposes only anyway, so let's also carry
these out that way on capable hardware.

With it now known that WBNOINVD uses the same VM exit code as WBINVD for
both SVM and VT-x, we can now also expose the feature that way without
further distinguishing the specific cases of those VM exits. Note that
on SVM this builds upon INSTR_WBINVD also covering WBNOINVD, as the
decoder won't set prefix related bits for this encoding in the resulting
canonicalized opcode.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: FLUSH_WRITEBACK -> FLUSH_CACHE_WRITEBACK.

--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2364,7 +2364,7 @@ static void svm_vmexit_mce_intercept(
 static void cf_check svm_wbinvd_intercept(void)
 {
     if ( cache_flush_permitted(current->domain) )
-        flush_all(FLUSH_CACHE);
+        flush_all(FLUSH_CACHE_WRITEBACK);
 }
 
 static void svm_vmexit_do_invalidate_cache(struct cpu_user_regs *regs,
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1881,12 +1881,12 @@ void cf_check vmx_do_resume(void)
     {
         /*
          * For pass-through domain, guest PCI-E device driver may leverage the
-         * "Non-Snoop" I/O, and explicitly WBINVD or CLFLUSH to a RAM space.
-         * Since migration may occur before WBINVD or CLFLUSH, we need to
-         * maintain data consistency either by:
-         *  1: flushing cache (wbinvd) when the guest is scheduled out if
+         * "Non-Snoop" I/O, and explicitly WB{NO,}INVD or CL{WB,FLUSH} RAM space.
+         * Since migration may occur before WB{NO,}INVD or CL{WB,FLUSH}, we need
+         * to maintain data consistency either by:
+         *  1: flushing cache (wbnoinvd) when the guest is scheduled out if
          *     there is no wbinvd exit, or
-         *  2: execute wbinvd on all dirty pCPUs when guest wbinvd exits.
+         *  2: execute wbnoinvd on all dirty pCPUs when guest wbinvd exits.
          * If VT-d engine can force snooping, we don't need to do these.
          */
         if ( has_arch_pdevs(v->domain) && !iommu_snoop
@@ -1894,7 +1894,7 @@ void cf_check vmx_do_resume(void)
         {
             int cpu = v->arch.hvm.vmx.active_cpu;
             if ( cpu != -1 )
-                flush_mask(cpumask_of(cpu), FLUSH_CACHE);
+                flush_mask(cpumask_of(cpu), FLUSH_CACHE_WRITEBACK);
         }
 
         vmx_clear_vmcs(v);
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3714,9 +3714,9 @@ static void cf_check vmx_wbinvd_intercep
         return;
 
     if ( cpu_has_wbinvd_exiting )
-        flush_all(FLUSH_CACHE);
+        flush_all(FLUSH_CACHE_WRITEBACK);
     else
-        wbinvd();
+        wbnoinvd();
 }
 
 static void ept_handle_violation(ept_qual_t q, paddr_t gpa)
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -238,7 +238,7 @@ XEN_CPUFEATURE(EFRO,          7*32+10) /
 /* AMD-defined CPU features, CPUID level 0x80000008.ebx, word 8 */
 XEN_CPUFEATURE(CLZERO,        8*32+ 0) /*A  CLZERO instruction */
 XEN_CPUFEATURE(RSTR_FP_ERR_PTRS, 8*32+ 2) /*A  (F)X{SAVE,RSTOR} always saves/restores FPU Error pointers */
-XEN_CPUFEATURE(WBNOINVD,      8*32+ 9) /*   WBNOINVD instruction */
+XEN_CPUFEATURE(WBNOINVD,      8*32+ 9) /*S  WBNOINVD instruction */
 XEN_CPUFEATURE(IBPB,          8*32+12) /*A  IBPB support only (no IBRS, used by AMD) */
 XEN_CPUFEATURE(IBRS,          8*32+14) /*S  MSR_SPEC_CTRL.IBRS */
 XEN_CPUFEATURE(AMD_STIBP,     8*32+15) /*S  MSR_SPEC_CTRL.STIBP */


