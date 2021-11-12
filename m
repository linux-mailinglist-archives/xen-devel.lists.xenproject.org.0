Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4C744E4A5
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 11:33:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225119.388800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTrn-0008Qo-34; Fri, 12 Nov 2021 10:33:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225119.388800; Fri, 12 Nov 2021 10:33:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTrm-0008NR-Vk; Fri, 12 Nov 2021 10:33:06 +0000
Received: by outflank-mailman (input) for mailman id 225119;
 Fri, 12 Nov 2021 10:33:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gYwu=P7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mlTrl-0008JA-RS
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 10:33:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb6e7c94-43a3-11ec-a9d2-d9f7a1cc8784;
 Fri, 12 Nov 2021 11:33:05 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-9-GT19KI7dOUSj_AjC5QacYQ-1; Fri, 12 Nov 2021 11:33:04 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3933.eurprd04.prod.outlook.com (2603:10a6:803:24::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Fri, 12 Nov
 2021 10:33:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 10:33:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0098.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15 via Frontend Transport; Fri, 12 Nov 2021 10:33:02 +0000
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
X-Inumbo-ID: eb6e7c94-43a3-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636713184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2mVtm/325NPUuJOVXLoRutJprxAS49bRE2xj1DfbF2s=;
	b=G2fz/tcn1KrqfoHmWZGvpZAfWRsll1/frNWORsbhOwhsfxEu7T0LhO+3gkVUrrDyev/BsL
	DlTuWMMoi8Si9t7whhlAkYUMSvdQ0dO/hZRl1c0vLo6rp9Eax8aU6fz2Jfhpe/RclSXjTh
	6AqsVOHDvs5cC4IONm3OwoOyK4aPG2c=
X-MC-Unique: GT19KI7dOUSj_AjC5QacYQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GXI0I8M7ngmll7AS23W4oITOUUaGeJc7u8KuVJ9ku/7VN6+VrL4zKz+FzOf3UCswmZgyHQQhQKSPzW6zFo3ljFeBv9ttI5NLwgyS3FXAiu4ZNaAS45BGH6Md18mtSB9w4nnYay9ZjmMpsjAnUphtgC07u00Y1MABkhKvLdYDjKarhYvBgcu1myLXrYt7gL1N0VsG809OlY5QRUt/X8QmgyNcB5FFZ4ITB2xz5f3IAhj477H1M1KMS/+UGp+uBHqzrjF68S64fmVsGODG2mMYdo+JPjCGLO4asckbUW+hnKA1fKyJoGo+W5udBVcVvwbx6weGaPC4V4UqANXJ+DhCSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2mVtm/325NPUuJOVXLoRutJprxAS49bRE2xj1DfbF2s=;
 b=hMr8PRMmJQsTpVdSRHW3oft5qexEVAMZ0uAceIYhobFKl4HSLiVg76NyksEgQHaLSLQHp+9Mdb8GLuZNfU4Z/ThPh9wardpT9uiyqS0DWyWBQDE2LsrddOa86BRn8qw8W/n/bxlCsjkl6ji0BbI+VFIqkw/YYy6/C/VHRirXdBJrvU/VN8uRS90Urov4mSSxzF9Y6s/Jriys7wzD33uInyn2vR9WWhDn0sg1ua07RQ5KDyOXmll4lfgdccxOi7Ep28ZYMOlCPacJwDojxKDl09zdtXphkYmWNnfWZGSNOqjSOcZIqAL/R2opfniC0ml0o62TpWvzf298Ai3ns5+GoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c180ff67-f109-fbe9-d34a-b28d8f46bfcd@suse.com>
Date: Fri, 12 Nov 2021 11:33:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH RESEND 2/3][4.16?] VT-d: fix reduced page table levels support
 when sharing tables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <iwj@xenproject.org>
References: <c809727f-f21a-d6f2-1fb7-4c3dfc150747@suse.com>
In-Reply-To: <c809727f-f21a-d6f2-1fb7-4c3dfc150747@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0098.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::39) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 519b8e1b-0e5c-42f1-7bf5-08d9a5c7ce78
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3933:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3933ED87E21C9F987CC7A4B9B3959@VI1PR0402MB3933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/4VlyheJp0LplfW510x3bb7yjOMXtpvhS4J7zmlry8xCOxMaUHq777STM9y7FoEoQIbnClxojN2mg8nJ6f+/MD9eQoWJulkkR+f7RJJsrTVQVIlUJQvH5wEAhij6XguUWjBRFCJzIsT9Ig9B/nu9TSfpzi5kuC9ZldcWbX1oY4xhBw5v+bhZvdt1j3T5noITGSVkfl2Qt1soONd/UAlAmUIJpSRtJFlyC2jCIC8zu4bcIknFEHS47qSeusZCONaXC7X/BXSoM7SPOAlgTn+bWqUsL/chfkFYyWNcSrU2GvvBbS+EfqR7lVN5aQ8N/1MS9J2YyBdZsR9jWxFYJymECiFs5J6CSIee+EOwNpjUVtChBkfww2lK3Cy/GKlP6Ms74lJSHRkWOODCHxEARdkcMNbG+RjoZY2TKpeOxauUMWU/tXSI3osu/kWaV0swRFKqysmBXy6AkHiLElqgjk3IxX6TuICOxbOGFRUZ6/K+Qz/RlaF7eocOUSFJEkd0W0NZV+1wq3EkFV7x3onWedtPfIvngtymUwFi389XdgI0k/lRhKdBMQ3Wni5yh/L1+FMIIzVWfbTQs6CNw4Q9btCbHHLezLo3CuiYrF0Aik+RC0QCqXas8kEzD6X4ysTGBXZx4Dg7uey6gLKnckS65KyUJeZnMTgHaJNqN8rBMCbKVIRRjCz0XWd+eJT/WIkS0ttHTIMpmYNvCroKih+rCn4d5XaT/UtXS8keXEair3er7/M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(8676002)(186003)(66476007)(26005)(6486002)(4326008)(8936002)(508600001)(5660300002)(956004)(2616005)(66556008)(66946007)(2906002)(86362001)(6916009)(16576012)(316002)(31696002)(36756003)(54906003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cit0Q1dSWDFYQmJEL1JGa3VRcGMxclVtZG8vZXBGV0RDU0kvSjdOZG15WEI2?=
 =?utf-8?B?MUhmc2xrcFdiNU5nc2dubWxqNFp2NWozeXJhZGVuZSt0clZZdGZsV3crb2li?=
 =?utf-8?B?emdRRldQemw2dDI0VFR1dDVEZHNUd2p2UHY5enpjQlNsQ0M0T0tlRTVHN1hD?=
 =?utf-8?B?T2REaFM4ZzB4cjlLRDBKWGNyajY1LzJzS01xWStodC9mNk5kZjdlRFUvMUZG?=
 =?utf-8?B?OVRyaCtITDhZdkJHUk9Ua1dXNFNWQ1FoWERiY0xGZElTQlI5NnFMT3ZoSXJS?=
 =?utf-8?B?OFBXNVdoQ3Q0MzNPNWxhOThTUUhjUVVMZzRDVzMwMkplNHB3VG9ZTGdSdk9y?=
 =?utf-8?B?dVh6Mk1JdnBPbzdJMmtqRElaRXF5ekVHOU9vV29VTTAxOFUraXZ3L1Q0bmlG?=
 =?utf-8?B?Y0FTejFYaVd3NXFHSlNhMFp0dWs3clU4MEhzWGRGdHQxcEZBTmQxZzVGVXgr?=
 =?utf-8?B?ZHVnR0svQjl3bG9jMU9aNGtLREFYUTZSRjFvNlNTc0syNjdic3NpOERrcHl2?=
 =?utf-8?B?L2ZtV0Fhb044QU1iaWJ6VWZiT2puODZ0RzVuZGxhZ2IvRU1CdGo3ZGppci9r?=
 =?utf-8?B?NE5ZZjhlWWMxMDFIOEVqWW82VGVFTTUwNVF6NTdXZ2Vlc1F2S2ljVnRCYjlB?=
 =?utf-8?B?R1ExNXBoVmlSTmphTnM2M1N3WEs4S0RtZDd0VkdaUXhZNU1XSWlvd3piN29Q?=
 =?utf-8?B?alVYRm9DaVAyNHd4S3YyaERFZ1QyN3BhcTVVR2RUbVpOdTVINDZxVTE4eTk3?=
 =?utf-8?B?YjlQUVlpSXkzVmxDdkVTajk5S20weWRqRTBrdWJwT3JBT0tDVk43czN0R1ZZ?=
 =?utf-8?B?ZnRPQUNyY0R3dnpFZURZT0Evem1OZmtvTWtEcjBwUHFUWTdGSmFxNDQyb3hI?=
 =?utf-8?B?d1ZWejlUbkhUZldlajVUcldsMFZWUE5ESDFWbUNrT1g5eFBlZUNva2VhdjUw?=
 =?utf-8?B?ZnIyOHFLdFhJZlV3L3FxSmIzYjBtNnlmaXRWa1grd3I4VUZBME5yN1dmK0hp?=
 =?utf-8?B?S3I3a3FZeERHWXMzVjIvOWRmdjRzeDh5WGIxLzYycGVFWmJjODEzS29LREFU?=
 =?utf-8?B?ZGNlanRpcHdMdjVVckxFZlRtZmxERzhYeElOQkFUV3FHcE5JYTV5SEVJSlFV?=
 =?utf-8?B?dytETEJhR2JNZWFoYWlib0p3Ri9wU2ROcUx2U2hWWWNxZG9yT1VKVGhjb1ND?=
 =?utf-8?B?VElwQXhLbk4xMUhFcWh3VzJwU0FUaHZ1SERRZTBKZU8raDhBQ0s1MkF5N3gw?=
 =?utf-8?B?Q1RwQzlDeis5QjBSUm1QTHBaTVh0bG4yNkNTMTE5VzhESU9BUnQ2alRQRlNs?=
 =?utf-8?B?SXRUK3B4Wml0RFJwWFlSYzFwMmVvY01CMVk4cEliMXhnN2xmdkxobVpHa1Zt?=
 =?utf-8?B?VjFKeGdySlpxWDFtMGhWWXFMMExhNm9MNXhzWXp2ajc4a1VpenZyeE5uTmkr?=
 =?utf-8?B?Qktaa0FDb0l2NUlDS05iRFQzblRUd1czYUo2Zk5EblR3ZjNRU1lyc0pGK0gr?=
 =?utf-8?B?anJrN1Zab2ZycS9JTXR6Slg2R0tvYk5XazQ3Q3Bwa0plaFFGZkcyQnV2cUkx?=
 =?utf-8?B?V2V3NGlGdDd3RDkrTk5HSkVjelBqVEthSXNEQ24za2xoSW84alVvN2Ixc2FJ?=
 =?utf-8?B?dGliQ05QL2wzQXBXS1JZbWlVNEtVUW9waVZaMXpnMXZKV3R1eTdTbXBCblVx?=
 =?utf-8?B?ck0vTEdrTGFneFd0bEZCalRZNVh0Mjh2TGY3Q3NickgyM1dYL2wxM3B2NDlF?=
 =?utf-8?B?eXFhY01rSU5mbDFzeVF5Tmk4VHNIRlJRNlIyQktaem4zcnVqTzVmMDBTNUxv?=
 =?utf-8?B?NkNvS1RlZFdTNmlnSXV1ZkNhLzB4b0YyMUJJcTJQRXNhVG9HZ0JMN2ZlTElk?=
 =?utf-8?B?VGt6MGh5V3haQlFtRzJudEVZL1pOTWc4NXBMZXg3REpxUnJDU0JCMW4xcE1C?=
 =?utf-8?B?dk9JU3FyVUdSQUkzRnFhelNDUVN1WmlHZmJHTGRLT1VHeHoyQ2laeDBNS0hR?=
 =?utf-8?B?S2Z4Uk40MW5iTHFxZ3lzcDNBbU1QQk1jaDBNZ2tRcVpVYmNRdGY0RE1oMGpK?=
 =?utf-8?B?SGdYQmdLOHZqek9nR003WFpINnlnMHBFVEgvUTMzb2pFMVR1bDBTeUY3MjZL?=
 =?utf-8?B?Qjk1SThRWFpVb01MWlQxUk54ZTlpblkxRWlrOWhxajZVWG5Za0dwbC9TeHMz?=
 =?utf-8?Q?wecSBUn+OmwW2XxcFXJyzlg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 519b8e1b-0e5c-42f1-7bf5-08d9a5c7ce78
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 10:33:03.1972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0dXzZO3bDMqbsBI5qSfj54623YBmOzvA3t4U30eK/rYmVwUcUr6I2e0zhA/25yDfdb9RXRthmXREQc5e0Jk2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3933

domain_pgd_maddr() contains logic to adjust the root address to be put
in the context entry in case 4-level page tables aren't supported by an
IOMMU. This logic may not be bypassed when sharing page tables.

Fixes: 25ccd093425c ("iommu: remove the share_p2m operation")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -340,19 +340,21 @@ static uint64_t domain_pgd_maddr(struct
     {
         pagetable_t pgt = p2m_get_pagetable(p2m_get_hostp2m(d));
 
-        return pagetable_get_paddr(pgt);
+        pgd_maddr = pagetable_get_paddr(pgt);
     }
-
-    if ( !hd->arch.vtd.pgd_maddr )
+    else
     {
-        /* Ensure we have pagetables allocated down to leaf PTE. */
-        addr_to_dma_page_maddr(d, 0, 1);
-
         if ( !hd->arch.vtd.pgd_maddr )
-            return 0;
-    }
+        {
+            /* Ensure we have pagetables allocated down to leaf PTE. */
+            addr_to_dma_page_maddr(d, 0, 1);
 
-    pgd_maddr = hd->arch.vtd.pgd_maddr;
+            if ( !hd->arch.vtd.pgd_maddr )
+                return 0;
+        }
+
+        pgd_maddr = hd->arch.vtd.pgd_maddr;
+    }
 
     /* Skip top levels of page tables for 2- and 3-level DRHDs. */
     for ( agaw = level_to_agaw(4);


