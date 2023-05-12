Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B80ED700180
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 09:29:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533719.830600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxNCu-0008P3-GM; Fri, 12 May 2023 07:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533719.830600; Fri, 12 May 2023 07:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxNCu-0008MG-Da; Fri, 12 May 2023 07:28:52 +0000
Received: by outflank-mailman (input) for mailman id 533719;
 Fri, 12 May 2023 07:28:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mY6V=BB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pxNCt-0008M9-8i
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 07:28:51 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20625.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a39bf61f-f096-11ed-b229-6b7b168915f2;
 Fri, 12 May 2023 09:28:50 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9574.eurprd04.prod.outlook.com (2603:10a6:20b:4fc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Fri, 12 May
 2023 07:28:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Fri, 12 May 2023
 07:28:47 +0000
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
X-Inumbo-ID: a39bf61f-f096-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPJiV/InSLocZuBH8aFP4xc/k/XHfhZIDFMIYJ+jPKujGgOhK/sZtkqu8PzKv93VeaLu04uUzg80i1rN72WzJXGbJWm9OLNmOnKh4Ap9ixCC4rwHoj6b7chASxIgkVNYWenFtl17ZD1456qo4sP/jhW57zGhHN4AwNqQ2RVaev3OwnUHBlYhdJ5nRpTxfbBJcOduS8sv83/83QdpeTuOCALdb2eXsGVK2BejGDDhsHgNDi1sQttLvXSIM8HQNBxq4P66acYDQye/j/gtOPJ72C31Ab/TL2QjbfnVWCcXZo2b52kmHVfAxVkZkaUVYvAd7kdixzfcDdjFjI1ioBIyeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nhtq7GtNdwkIwhtvega7bfE7ScUQN4DDpCOQvM8/moA=;
 b=cP/JJrSCuR2OGoPjFv3PkqE8iJ+R4lE3YoHaNbAiyXKjXttaJvxEttyhqCqkFEcDvGvNEB8Upp00tyOjAugnIQfqvgs35ybsd4V2FJu2KuLYKg4dCtguHR5MT8cE/oNh/49/1AjGoFe1K3kf124rgBahx7qlK36NqlYsFOpSpcKu/CsrH7tcSjH3pxtSQj/EDYW7QWXrW+33EgxsAP/JURrqBeXRs2fZpT2e5de2t5oQjPUqOG4exkqZVUr3sL/wlZAMOl1v08BfB+YuQenTe/0dSCmVMepJPd4aSoopXzsOXX2JRQFM/EB9xg+e2YvRWVYxWho+a04vUMLHKofHlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nhtq7GtNdwkIwhtvega7bfE7ScUQN4DDpCOQvM8/moA=;
 b=sm73bf/RV4im8syAepzbOu3EVIvSCfdQMQ9/ZiAEwZd/mrNdx4gwy4YJ5wUbexrHTt3TWzoXSGyOof8KkMqoEucu4xPRsflxyD3Ww32mttIIrTuMRtxImoLebJ/p886WVWgDpmAV6u48Jq4r05z0BReKvqtyWH6Hh6teHCMfO7KuRYoD8C2TJiTHHJlY2zst60h2pR7WGmRTba4Si/dWfmNPDSUMlb12XPd1K+Tri0yk+pzV5fFF7hzhztcfbdRdVb293qccicaGF2WTXSIDl1Xny217hqBQHj7pAymTVU6aAPAzDH7+L9ChS1ijkZ867F49mO5ywLfdQ1rUDrHmVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b1403a6b-80f8-6277-5bd0-b21a2c8f0dd9@suse.com>
Date: Fri, 12 May 2023 09:28:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [RFC PATCH v2 6/8] pci/arm: don't do iommu call for phantom
 functions
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230511191654.400720-1-stewart.hildebrand@amd.com>
 <20230511191654.400720-7-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230511191654.400720-7-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9574:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a1ff127-1e95-469c-265d-08db52ba8610
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nDsJSJJ8bV0Hvqj3HQx2QodmwOfY1Kl91cTJT7L3/SAh8cmMeRvuB47BJt1yzPeMUvbLQyfiQdu4vpKluEG7EmwqFTM1xnTMaiHwlWLQpnsfS5Vcm+yCZ/4nRy+o3eiywJhJl5sTpB498gmfrxDVRcJFDu4TtCEqHqs+w4YseUJ+YxMI2Il7xCVewsHjPJYlpjrTqxzz7M9Wd+mklTJY1QG/ng+Am212eZil4aj2EMQQpZ0q1yeTNItQL/IFbswYGOLeRvu66UOrK1os5VHtmBg1VnNzHlb/08YFeIKyng/Tz+FoEeQoN0qIw2QkWuPqaOaca8euJVNBfqmlbH2CaLEr8wZzefdV/3L/nQHj/llFWhs8Fstu3ml8FAo3W4GjySf0O2DgC8ajudhTE/dkvh39WGMnjqPETsfgcbfHP2q3JO510wHhC+VJDGFdccs4PwEKOqSic1DRTvgp/XCSpKsdjH+GUIJRMbK1uh+F6K9UHx7nCbewdMiPGpi69D6nCyD0Y1F8wG752jA3F9mgLdbldsFhB3bWu1/zgu2CFnGbu8nB6p3sZex7iC/34qPu3SZTie6xjurLQE/SrRZN5kICK1rJuSNWSDExHv/QVKA+fpILPNwUlVv7PukotDM4RQCNCtl2LDp6A+okGed8dA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(376002)(136003)(39860400002)(346002)(451199021)(6666004)(83380400001)(2616005)(8936002)(66556008)(66946007)(66476007)(53546011)(54906003)(6512007)(6506007)(4326008)(6486002)(478600001)(26005)(186003)(6916009)(41300700001)(2906002)(4744005)(86362001)(5660300002)(36756003)(316002)(8676002)(31696002)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHZQQng2V0tIYzVTNHZ5RGFXejdaYXVXMTRxbTZIR095QWxoMTNGTHFReklV?=
 =?utf-8?B?WUxvbUJhS2FrUVkvbitSK1J4bU5xK010Q0psUGNiY0p6Z2g3NlRiRGhnZlha?=
 =?utf-8?B?RXJLcHpKWGh4NkJVc2FDTFA5MjJ2RldTeWJ3dmVBUFFxbTB1K3NWZE1iMHk4?=
 =?utf-8?B?S1dJT1lCdk5iVFBSZ1ZFOHlsOE5MdkZCU2hSc0ZIdWNuekhFcU54YXlTZ0hS?=
 =?utf-8?B?cm5wT003UXhNYlpxZ0x1QVFob29hUXBIaTFlZlgxMm5jeGgvNnc1Tm9xYmF0?=
 =?utf-8?B?TEY2Slk4UjRSaU1Tb2kvMmcwOUhpdTFuekkzSFlhTkRKQUFqejFxbzNOVlVW?=
 =?utf-8?B?aVhkdTBkUEtDQjg3b3p3bEJwazNRT2dPRWdPM3E2RVRsajUxYlhINVN6eXY2?=
 =?utf-8?B?UG1FSHRpZGtOZmZkZHFmYWltcDliTTBFTzdTQTFNbWhvV0lid1VwWUdxZ0Ez?=
 =?utf-8?B?d1BORU4zY08yZ2FLNTN4ajJtVGQvRm5VN243OU03YlJXazNIQkJrbkZ4RGN6?=
 =?utf-8?B?Mmo2cGxOUGFsVkFuemhGQ3QraFo2Z1gycW5GUlZScW5oeDlSa2tZOGRhWHFj?=
 =?utf-8?B?MVRBQm9RcGdBd1NrcDZDSVh3M01oRjhrNjN5eTZvc091UDNCWnBjUERnelE5?=
 =?utf-8?B?bWdjVFdjUkFNOE92V3hucUpSZjYrZWtzbjFSeUR6VjVrRGtrbkQ3UWFEYWQ4?=
 =?utf-8?B?OG91R2ExdENCL1dTN2ZSUFd6aCs1MWVnZDB3SEdTakRxZFZCQWVpdXR6cCtF?=
 =?utf-8?B?NUVqZ0lxSkd3VktuQlgvVHhTeFNVdEN4ZE5INlA3RHpWejFqOWpxbHNsOTZM?=
 =?utf-8?B?M0VDTk9BZlpUQnJZdThRUjJMOTFZUjA4b2ZSMVp3YXhWQklSeFQ3ZTNPWk0w?=
 =?utf-8?B?RXFvVDdOK0RVcllEK0NRNGV6aEpvSXh2blU1MER3SUxYMlk5UVVIOGtiSDBz?=
 =?utf-8?B?Yk5sWTRCLytpaktwUy84MmJ6SmJXRWlKamJUckQ5N294RGxzUzAzTVhNSlB5?=
 =?utf-8?B?d2tWSHp4LytHQ0o4b2xlRlRHeFR5ZEZqRENpTzY2bGs3SWRxWkJNYkJXL0Nl?=
 =?utf-8?B?R3pObmFvSHFiZngyTk0yL0d6MDF0SzhOMHFFMlptdWM0Nnk1TEZJdytEdHpl?=
 =?utf-8?B?VUpXUFEvWlJZbHN0OFlvRXJvMXFIb2NiQ3l4UkV1UTZ4QUNweWNpeUFHZ1N2?=
 =?utf-8?B?b1pFYjl3aVV2ZzBkWXA1N2kweGhObHgwNS9CVVUrSnNCSHdYajdFTC9hR1JR?=
 =?utf-8?B?d3VoQnBEQ3dpY0R0SDMzNEkxdWFVMW1UWHRBMVZQRDQ0clMvenBrWHZuRG9w?=
 =?utf-8?B?Ym9reVhxV3VGOW8xL2doMHZZT1dSek83YzFaV2E4U3NWVlJhbmZBbGw1eWR0?=
 =?utf-8?B?cVZFNGhWVnI1djB4Y1c0VUNGdWJPeDVid2tpbHdtcGF0MktjMjJ5YjQ0Rm9V?=
 =?utf-8?B?cnNSdHV1Q3I4S3Q1SlJYc1AzMUpuQ0x4bDRsSm4rOGZzUVc0YWovR0J4Z0Jo?=
 =?utf-8?B?OTRUV3ZxTHZVcnV3VHVKWXVuMFppTXhZVUJ1WE5FTHhHTUduYnFWYXJ0T3ov?=
 =?utf-8?B?YWI0KzNBTU9zM0o5QXc1aVEwQ2RzcjFxSEZBaFZUUUlMdU5FbkJZSi9zeUxw?=
 =?utf-8?B?MWk5c2N5RlRBS3FoZjkyQlR4anRwcG1TWDBxS0x3NFJteTFNUnRwV2ZYbk81?=
 =?utf-8?B?KzJXckx6dlZZMnZ4VlRXR3FrSUpCdDFXeTY0empnTzRUYklMRVFwWU1tTldP?=
 =?utf-8?B?WTBwNkQva0w1Q0Rpb0N5VkZlaTNFaDdPRGFyWWRNZVZlQUYvbkJLNjVtSzdN?=
 =?utf-8?B?OW5YN0dWMGlVU0ZBOFJvTmhzZTl3ZGl4ZkZRNEg3MkdzSFNVbTNPOC9ib01J?=
 =?utf-8?B?d3l5STA0T2hXYlBlMEU2VVplUmdCM2g5UjhVT2RXUldBajVSd3dsaUNTMDZH?=
 =?utf-8?B?NWFBYmY1ZTBBWURKckNzN0dMdGhZUWpJRndnVFlVOVNZdDU3UkR3NzhFNHNB?=
 =?utf-8?B?a2Q5V1ltSk5sT291OTRwODRKeThPb0JkY3VTMGw3L3d6Z1N4S2doN0tmd2gv?=
 =?utf-8?B?VTg3WnNRalgzQVFWVytOeDUvU1JrbW56MEpxNzVKVFVNRklscktZcHAybzgr?=
 =?utf-8?Q?grlRn+Lk/bDjr/wCakRnwV7s1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1ff127-1e95-469c-265d-08db52ba8610
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 07:28:47.3134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Jplj0qb03Zna5abfWn+2+Q03yr/eQqhj1va5Wotq5wr6y9euG1o/rRqhxARbHgmecCwPAR75ANzFeT2Trm9TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9574

On 11.05.2023 21:16, Stewart Hildebrand wrote:
> It's not necessary to add/remove/assign/deassign pci phantom functions
> for the ARM SMMU drivers. All associated AXI stream IDs are added during
> the iommu call for the base PCI device/function.
> 
> However, the ARM SMMU drivers can cope with the extra/unnecessary calls just
> fine, so this patch is RFC as it's not strictly required.

Tying the skipping to IS_ENABLED(CONFIG_HAS_DEVICE_TREE) goes against
one of Julien's earlier comments, towards DT and ACPI wanting to
co-exist at some point. So I think keeping the supposedly unnecessary
calls is going to be unavoidable, unless you have a runtime property
that you could check instead.

Jan

