Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BA045A402
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 14:40:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229611.397072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpW27-0008Kt-Rv; Tue, 23 Nov 2021 13:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229611.397072; Tue, 23 Nov 2021 13:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpW27-0008IC-OW; Tue, 23 Nov 2021 13:40:27 +0000
Received: by outflank-mailman (input) for mailman id 229611;
 Tue, 23 Nov 2021 13:40:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dRhM=QK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mpW26-0006K2-5g
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 13:40:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9be069d-4c62-11ec-a9d2-d9f7a1cc8784;
 Tue, 23 Nov 2021 14:40:25 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2054.outbound.protection.outlook.com [104.47.6.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-UhAEPmoZM3e6cHHxmmDjGg-1; Tue, 23 Nov 2021 14:40:24 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 13:40:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.026; Tue, 23 Nov 2021
 13:40:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0301CA0004.eurprd03.prod.outlook.com (2603:10a6:206:14::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Tue, 23 Nov 2021 13:40:23 +0000
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
X-Inumbo-ID: e9be069d-4c62-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637674825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GlPYVPHHKY0fQf4fXHxR88XAwYQ3msowxF+8PXwpKEI=;
	b=CuVWfBMBTuC27D+2bhQdClmbLCZXg8qZF31ywejirw2oESN5GvYAXMvu7hkMuDEbUGOshu
	EyDp+TtCBIqLFY4gqOv/fU4ZXYqPJsfbKYpHMGzWcl2UfJS6wifhwmLPUtZU+7lV065umf
	IPEnzRtD2en4gFL6fMwpXyz1zzInpso=
X-MC-Unique: UhAEPmoZM3e6cHHxmmDjGg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3OXwlBXBA1tw7vEgUymdKuo1o5wqWQciBxJjY/2bke63RZqF7BUb5CjoR3nQlAIPxjWBYEmG+R8U1ValllOgy6iK1zEhDd4Wah8SmdnjkLmrDZHxlEWxhAPvU6BXCI4sg89daJilebanLB3wsnl52jhIp1CK/3HrQ8KQMXjFL0mcCc8xrzchRMOTUcQ5VHAjKICM3IItBfykZ3HoW7jNcp/duiIgAzw9DVTCRrDL2Dtb85IcMzDCmY5B78J/9+NimK4D2IJNMXbDQ8BH8vi1NijgXRUzQPkhC4tu2ChO260dneEwZjbUjTNjUUebhM61b7EsAUuAPWVZjg9ofq0ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GlPYVPHHKY0fQf4fXHxR88XAwYQ3msowxF+8PXwpKEI=;
 b=krGXBSTXg6qwRPtca0mBQdDsmCbspKtZskIEUMfzOcF3I+8A+tQm2AeTfVSj55zoyCBSyj0kSwd8JF1y343PxzZQT8pgJ2763x7XSTeILvJl7EpHy8YCB6vClsZnr0R6VBHb48meKN2OfqXG6oH6kOfUYKmEpf8SIl+/HYZS3oqQqQO+FCCvDjcnWUaFAtnRKkwelMV6x9OMSo42RSDxh6zgQFYahlbvWQpkoW5qMsdox3i9/rSISvrezXmbW4VA76Hhp6AR5VvvtR/8jJGbNyOavBGKvhbrLu3e/94bCfYyqccr6ME0bDsFBZTsSgFvYLM7YRuRcfr3FVezKxMHGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <63da915f-03dc-f846-3c6b-e90890d1f8fc@suse.com>
Date: Tue, 23 Nov 2021 14:40:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: [PATCH 3/3] VT-d: conditionalize IOTLB register offset check
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>
References: <54e38a20-5281-2ab3-8513-3506ab66dbe8@suse.com>
In-Reply-To: <54e38a20-5281-2ab3-8513-3506ab66dbe8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0004.eurprd03.prod.outlook.com
 (2603:10a6:206:14::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b5376d2-ca02-4e53-a250-08d9ae86cccf
X-MS-TrafficTypeDiagnostic: VI1PR04MB5325:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB532552ABF1124674D029219DB3609@VI1PR04MB5325.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H4dRqMBCOdhQ4C4FIxDcFqJruA1RgqcaI59PQ++3TskKjPxP9C4rkKM5//Q/ChJ5isgXpc+LWe27vXNRBCa3qcv3Kd6jJfpMwiUPOzu1BMn+fM4DleJW+VrXgZhsw/B4DeHTiftufsbGXARsy57prF8wIs9ETA5bFQYsi041+v1j+2uYD4JKCcvmbOVKLwJE7hIkgBYxb2+GeR688+GUmuxHxwD2Rc/ajEdMvqHIEdHvmzhrvwVgTHlm4tYmMap/eQX0MvNTOSe+xWMogi3Pf1k/1FQAlzBT8/nfXxDOb36N/24ciVw+GzRNJlpsT0Ibd6f3FluPw6PkpkJlLuD3ChsEoXqtIJonohX5Xan/F4p87XNgq/zIg8hS5T/bFs8mvEhB18asoS8WU2YLkDTDYDo8zrkRwmTVy0jSdrbZ/B1KJXMxeXI7JeNDQgUN+Wx0IUhAKbAR7dEZtA/uC1KpcRb7woe1XESaJiLUKFxg64ycBPgJlVgw47GN9hmw1KZIbinz0gFKreRZTm+PCgFYyd7YLAhL+/vpBAUP7nBJom5Z3FX/iixIb7EhTISxC7xBdkpHsxRk+KMGO1untwE2rkCZN056Ymfu2bgcaP43gm1gCcKYfBLLi6WyEnJO2KTu7aWDYami356U6vv5NI3cFnqYg6zn1HrpLlR83S5DVgwrrlSq+v3kJbwxqT3s0Zo0w9KPH2VqP9U5G1iDiReZN5GouG3s5BtJREPgkzaBm4A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(2616005)(4744005)(83380400001)(66476007)(4326008)(2906002)(6916009)(36756003)(316002)(66946007)(6486002)(186003)(16576012)(31696002)(5660300002)(508600001)(8936002)(38100700002)(26005)(8676002)(66556008)(31686004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QktXYnk3UFpWbE9mYm9kZStFQ0FtQXpsU2hpOHVWRzQrWUdVa3BVRDIyY3lN?=
 =?utf-8?B?MUFrUG5vUVhONnE2eEk2ek9DL0tqWWZxcGg1OWdpbW9yVlI3WmJyRENZZGhY?=
 =?utf-8?B?dldMRkVkSHVTU1h4NmVNMzJUdlFzUEVwdlNRbnptV2haeXRhd05VZnArUkFo?=
 =?utf-8?B?eFNwdW52UkhEMkJjZkF4UWxRUFJ1elE3SG14eHh1N3J6SEwrMXJLYW13UXU1?=
 =?utf-8?B?ZmhZeUhHSDVKa2dCa0ZuU2lMclBNdVpJVURxVGZjRHBHWElpYTdTbWNxdXBT?=
 =?utf-8?B?QnhpbEtZMWpiWEx1ZnFEN2srTzdYZjkzUEY0dmEzVTQwYWtOWnEyWGZYWEFw?=
 =?utf-8?B?eThLeUdyd3JWNDg2S1Y3RHUraXU1RElMdndjak9xQ1VsNWpvNVJGY3J3YWtO?=
 =?utf-8?B?VnhzL1gyTzdac29teTliV1lCZnR0cEtodmRGRHZieS82Q3lKcFJDcU8rb3RV?=
 =?utf-8?B?b1FabzdIK0h0STFCd3N2NmNBUnNSNEVCUHU4dnl0VEx5enc1UHg3Ris4NVNL?=
 =?utf-8?B?S0hnNG91SGZ1a2Z6dmZJNDZ1d1FFM0hTNEpneHYxYnh6bXBiTjZSY29sUUhI?=
 =?utf-8?B?MC9HMm91MGNCdEdhSEhPWWk5citBanNhZno2byszbmtYMUw0cE9VaDFxOXlm?=
 =?utf-8?B?S3B0ZTA2ZFZkSC95ZDBTa0NYc1Y5QjNjMDFyMjliK3dhQ1ZCa2M2RGl2cVVW?=
 =?utf-8?B?UXNyd1hlYzlVbXBRRFhPTG1JWTJpK09nTjk5VGlud1hTQXF4MVYvWm5nYXdS?=
 =?utf-8?B?dmZpQ3pudkNsOXlUdGhzTDdFdzlGUUR5TWdRaXdSQThyVmV0YUJQMXNnL2tD?=
 =?utf-8?B?N3VvcFY2T2xmcjBUQ2lpVS95R1hXZUZIbWNyTXBPNmtXWTVrTCtSTDUzcW5y?=
 =?utf-8?B?QXo4YnA5b29GMWpDcHlrM0hMK2swZGhFbzkxWDFFNGJSR2xTTDdaWFY3Uk0y?=
 =?utf-8?B?cmdOandlSWhHcXZjR1dpWGIzSXdrNHJEZVh2ZndNVW9sL3JLelFmS3VqUXpr?=
 =?utf-8?B?WHdnbUYxdVRzWHU2djg4Snd5b0U4RUZVQTBLVTVwRVpkNmxlNWlubEFpRTRs?=
 =?utf-8?B?eXhzYW96SGw5cEtTdlZOOG5UZzJ0L1dOc01FRTcxQlFBWFhqRVZscmRVUXJi?=
 =?utf-8?B?dmQwemZuSEt6eHdHZ1JvREJ2Z1F6VFZFZWFFVDZyRWhVR2ZwQXBqbFgwRkpu?=
 =?utf-8?B?ZkJza0wzTllwS1hUUS9EVXFraTdCVjZDMSt5TDJEelV4eExFbXdqcEd1ZTVh?=
 =?utf-8?B?NnhhUHF1YnJpZTZZVVlQRkxwdnJ6OXkwVnNqWTEvbFk2WVB4UE5yN2lwNEw0?=
 =?utf-8?B?Q1RXd0w3RXg2d2Z6NUkrODNHakh0ajgvb09WQjBsT2lPU3hGbEVMd0w0ZlFL?=
 =?utf-8?B?ZmNxNnkwRHFuM2d3MHBUbFNxd01UT0oyVDVTRUt1N01NRmN0bUNTeTkxWTFD?=
 =?utf-8?B?d1ZSd1hmbWVwSldGVlRVajNsRERSNFdkZGxENG1uaGZuR3JURTczQTBQRGls?=
 =?utf-8?B?SXpKK2xPRUNuSnNYbzdOd3ZGaVZFaXJZNkJVL01HSVNzc2JBTVllWW84OHhB?=
 =?utf-8?B?UytlWU1qaHQ1eXJvbncrRUVoY0lxU3dqcGlrelY4K2M3blFienppNjBRRXpJ?=
 =?utf-8?B?a21ST0taRWFmN1FnL1QwYzNFbXk4eWFEbXNYRnp2ZUZ5djRSUUE5THdQakVN?=
 =?utf-8?B?aFNUY0tUdWM0d3V5bnVvcDRCUmdERDhMM2g4NzRraDFQd2tVWlhxYnRBam9n?=
 =?utf-8?B?TTJSc05CWEpFOWVxY3VPZ05QNHMwcFhrb3lqMEM1TXVPMGd4Z1lXVlhPRmF6?=
 =?utf-8?B?QTU4N3pMcm9oWHlDOVIrSjE4UnNnVUxDWEJVN1dCNTZ3Q0N1TW9FMDU3c1FE?=
 =?utf-8?B?c1RQQTRuQlN4bndIV09zV0dseXhUMjBibUEvci9mYlRYMHA4NlJvYWx6ZW10?=
 =?utf-8?B?TS9yTXoxcW5lMXpFaXdZS1FTbXlPUW1nUjdjTkxWVzBmKzNibHRLK3JTaENG?=
 =?utf-8?B?REVlcDZYbnIvT1ZlZ2lsQWJpQ29HdUtrOGtoR1ZVeGtWams5bklEUXpYL1Iv?=
 =?utf-8?B?b2tPeEV0bVUreWtnWFBwSlcvV21Ydk83VjhIV2JMRWgyM3NuVEh2L1Y1RURN?=
 =?utf-8?B?K1hnVkhGWGI3YVI5YnNXWmI4d1ZxVmNlU3o0SCtEa1B4Z3dkWCthZHhkZ29v?=
 =?utf-8?Q?hsonfecHDxmWObJz1M2MZgE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5376d2-ca02-4e53-a250-08d9ae86cccf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 13:40:23.5595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ylcz26brxDMbB7XWxwU3kUyJnLnKak7guYHVZiKElvlknl6DhMQ5YaSJMEbSyWbGOAJYSlUMIaGuAZTKznYbQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5325

As of commit 6773b1a7584a ("VT-d: Don't assume register-based
invalidation is always supported") we don't (try to) use register based
invalidation anymore when that's not supported by hardware. Hence
there's also no point in the respective check, avoiding pointless IOMMU
initialization failure. After all the spec (version 3.3 at the time of
writing) doesn't say what the respective Extended Capability Register
field would contain in such a case.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1228,7 +1228,8 @@ int __init iommu_alloc(struct acpi_drhd_
 
     if ( cap_fault_reg_offset(iommu->cap) +
          cap_num_fault_regs(iommu->cap) * PRIMARY_FAULT_REG_LEN > PAGE_SIZE ||
-         ecap_iotlb_offset(iommu->ecap) >= PAGE_SIZE )
+         (has_register_based_invalidation(iommu) &&
+          ecap_iotlb_offset(iommu->ecap) >= PAGE_SIZE) )
     {
         printk(XENLOG_ERR VTDPREFIX "IOMMU: unsupported\n");
         print_iommu_regs(drhd);


