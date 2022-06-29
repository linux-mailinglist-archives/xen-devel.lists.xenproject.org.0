Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5545602AA
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 16:27:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357899.586769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Yeh-0003cX-I1; Wed, 29 Jun 2022 14:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357899.586769; Wed, 29 Jun 2022 14:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Yeh-0003Zy-Du; Wed, 29 Jun 2022 14:26:59 +0000
Received: by outflank-mailman (input) for mailman id 357899;
 Wed, 29 Jun 2022 14:26:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NFaf=XE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o6Yef-0003Zs-C1
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 14:26:57 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10060.outbound.protection.outlook.com [40.107.1.60])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87260bce-f7b7-11ec-b725-ed86ccbb4733;
 Wed, 29 Jun 2022 16:26:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4175.eurprd04.prod.outlook.com (2603:10a6:803:40::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Wed, 29 Jun
 2022 14:26:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 14:26:52 +0000
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
X-Inumbo-ID: 87260bce-f7b7-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2Zha6J1T3hdsaiTPw3viAFAL1A6mv+cH1aLcKi6CxD7HCbMTapxh7ntSPTCgj0M36BdX+iSG6GaArMmU0peGYxrsfbHvuhStKiPPkQAnJ47xJgBmWrk8JFPVvrxY02f0OANeTJpjFPSeYI8wqE9zp8bUUy98iqZpPZmTOLlD8mP0VF+krYxPoYsZncrauFPzNeryiUMHoujUdA+G+UScccf3lyZx0MZMrXYctowaO5VpRShLSfMr0+V0O5gyLKoDk3kjvcnQqG3S3w0U+RAppe3x7jRL9KD3kl5HAdzYHMXyKludb9wCJcRyuOeGeYdBI6aVygh8HLJq9ZJC535rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+nFgHJBTsahS1uvwU/1zBzUooLEJhwLLPEV54s4kwg=;
 b=OscQYl+a6drewOSfHpbfDw80zVHdq/C5b21cej9kJMvn6dbwp5C2C+o6fnbYRxtNGSefRQEOA2V2t8YirmnqYlN6wvbK/1GovQa1d5G/fqRjaUNMIh2RooIWtVdeuTRoWZprU4/W+UyLjlT8bvn9eSMSvm3ss9IwxHTTtJJNNlB45J4uYnn8nItVicxqXx2OhkR6ZNGkv+Vpn3ujTGFrM3Fm/CRCIe2PSbfy42KRMraxroMhEjjpgL/c7o4yCP/Po3VcA7/A/O/tH/D1FyolCk0Ev7KJnSVURP4HAFsiCS5b1F3hM9cs65wdhsS/vtc7O3kiSDHrCpi2AQXHR1PxXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+nFgHJBTsahS1uvwU/1zBzUooLEJhwLLPEV54s4kwg=;
 b=0Yl4v4TRlGSuMpXzkA/lCvqSlyYJsQmFujAI0sSp1sGzzAtYM9PhUhRNN1YuCdp82lCw0pjzcHBbkP51b5XMeJB1TZA8VQEJk9zJh8FuRWivmOwOwEGQcSWvjqPOaN924Qp6DK1AI4/L2d/YVj993g7020rfsF85yfZfLNh04Dl0/XIHugVzMpUHyQ90m+Xn2USaz/x8itLdWWwGqza6DGduzdQHmEQ2X3EI6P1QDN2+ZE40Iol363YO0F9EKlgWK/amU7Rb9AEfDdw4bIHrR+2IteolBg/nquqwrtwuDmp6/VSbIfMSfTV1cibSYhQoC7c12hlP/zMe14May6bXFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <efb34738-49a9-fa4f-900a-fd530ff835ce@suse.com>
Date: Wed, 29 Jun 2022 16:26:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH RESEND v10 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Content-Language: en-US
To: Jane Malalane <jane.malalane@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220629135534.19923-1-jane.malalane@citrix.com>
 <20220629135534.19923-2-jane.malalane@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220629135534.19923-2-jane.malalane@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR0502CA0061.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::38) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2f95609-188d-48d6-f543-08da59db690d
X-MS-TrafficTypeDiagnostic: VI1PR04MB4175:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+esOF03onwQ6CYP2NSWsJx8kifoslQ88Fpac2DQemn3Hka6EBgpr8+Q6GiwBGqi9BTPIbnkS+kquBChx3Omk48raLDc3ylDJPVOSZoZbbEkL7o/NC8bB9qc7kh2f8VuquU3xHiKHQKT+1hOytEuVpoANZ00q/Nu18tY9xgbQ1DF27Kt8o/NpTkzDSjN5KQyX27uspXSd1upKbf/jQMK7khE8yCrA3OWzOIUXgLTey32zaEfmBBZLxRUZVuuQ/7bYWI+g5ee8EBGKRvkXH3D3Il+GJ054Ebk5t/d8JySTqDz91uxgTKVttpq+oD8QiVmd+RQC4h0KilgI+Mh3sFjIfv12RPYttPpX/vvhufGByn4eFIDdMSybQHeEByQf3Vwdhcw9faSZMsUCeboK28FnOgB2u2oANCEL/ztwtoAC4OCoH3jq4WvDE8qQIMu8oPLtBXxGfnJA5gxYsGeJ3z6dqk/xk4wYJhaqu0RzlrvWCZauZXLwv6Mcr+hVQ2djv3gNYlR5oilUOA+RKPxwgWxDiiX4HwiIGlOpjm/HHLgDg5dUwqNwMTjSnSC+2y2v5Ikiwi/1CH3XJkjob51e07RRt1t/dYacdMLOSQXWYeYovtw0OW11MKGaLlOGbWBQT7sdn58fFRK7VkBcTwUSZJG7m5gBHiTINUodt79A4C2cg/+AJSqUpxgq1EgkX+BSVCU2w/8JQGdTlgFajcXElRvvcm0GlLWh03nTg6sw0jPb22Xy9tOpYXtQRKCGHMwVcfQbhZuV8Kyhm6FLr1L7A2f9yC0z17dRzUlUhLhutSckBJjGLCTfwa5aBt/opMkhY9LGeAOyVwPovDeOQ7AnpTxjfw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(396003)(136003)(39860400002)(376002)(2616005)(26005)(41300700001)(6916009)(186003)(8676002)(66946007)(6506007)(54906003)(83380400001)(53546011)(6512007)(478600001)(31696002)(31686004)(66556008)(2906002)(38100700002)(5660300002)(36756003)(4326008)(86362001)(7416002)(316002)(66476007)(6486002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1V4b0JxdHYwck10dDN2LzdlL1J2L0l0WGFYOVkrZi9FSm9wWG9jN2RCcFFo?=
 =?utf-8?B?OVY4R0UvOGluS2RPS3pmd1RKc2V0SXBaMHo5VWZiSFp5U2hydnd6TDNDdzVk?=
 =?utf-8?B?NTdIMWFJWWhlTkVIdU81QkZyU01oaWFRWXI3YVlXeHdEdEZvZC9pY2hlb0xt?=
 =?utf-8?B?Z2U0YjlYN1B2ZlJkbVJCK1orL2sweDB5VWxiV2o1QlZDT3NBQWpscE1TNkY5?=
 =?utf-8?B?ZEt1NjVBd3ZYaG12T1lYQlBzRlA5T3MzQ2FBOThPcmZFZHN0aU4rTGNOdXAr?=
 =?utf-8?B?NTgzQTRTSXNvLzlMZ282VnVPbXFmaFo5MVFEWUI5cTAwNDlPTmc5dllHbEZH?=
 =?utf-8?B?SXBvUmVIV0M1L04wanlwdzJUVVJVd2M4QktDQXBmRXpyUUQ5bDZwdVNFQk1n?=
 =?utf-8?B?RTBVVzBBUm1QczF2RmE0VDgzN3FHWW12VDZ4eVF4azZySllNL1RoUnBYUmVw?=
 =?utf-8?B?RTRhVFJUaytjVEtjRkgrRzZFT0JuZ0hYMW5wMTY5RkFKaVpOUnU1VW9FbU04?=
 =?utf-8?B?WUdIazF0MU5mTnR6dVArNDlLZUFiZ0hGVjRpTWsrT0NURzdWQm1oeEl1U05D?=
 =?utf-8?B?VlJRWXlFb256dGhtUGFyQVdYckc1RWNzV3g2NVl5SFNWL2dzanVFb05Oc21T?=
 =?utf-8?B?TWNhS28zTWNITU9id3JOVWxhYzhpTC9DTldnL2lIRFR4MDBtaDV4ZTduNjBn?=
 =?utf-8?B?NGkvQ3NCbm5SZ21odnlEM2t6ekUxKzhQbEcyOWFxcUV4eFJZd1pyRTFVNHBu?=
 =?utf-8?B?NEtTS2VTNVAvVXRwYmdjQmV2N0xRSnFXaHh2dFl2Z2ZKcEhLcUJVUUxCUmdO?=
 =?utf-8?B?alVISThJZzhiQW5PblY3ZkRWQ2FkU0FMQUhhOFN1TDJvNTV5cENaM1JKRUo3?=
 =?utf-8?B?M05jbU5DU1I4Uy9rZkVRM0dIUUNWUElwRzQydThWWXNwRDB6MUYxNnpnb1lR?=
 =?utf-8?B?ZGJHSUd4TWhqMHE2Zm1nWlhsQkMzdndDNDJGaFJnOEEycmNmUVNBZXhpcHht?=
 =?utf-8?B?NjlENThHVnhkK3Y2b2RYUWFlaDlyb3VPdDFwRTRscXhZbjU2UWEvam5DOEd5?=
 =?utf-8?B?eEZza2VRcjRMWUZOSmRuK2xweXJYTkRSa1VLSXFua3RTaXJlWElhazBPdFdk?=
 =?utf-8?B?WFZPZ2d6YlRpRUNpdjlYbWdxOHZrWFhMRWlRV295aS9pWDhnSWNLZGtXdUM4?=
 =?utf-8?B?c3Q5bUhBUGlHZXZxODcvSVJnMm9RUHNYRXJPV3JFSXNyRXdqeHl5OU5XeEJ3?=
 =?utf-8?B?a2RPdWtZVkl5MkdPVFpXUlo1TEtFZWxVZ2N6OEUzMUJ4S29MWFE1OW40TWRz?=
 =?utf-8?B?NTlUazk0bVZsSjJObVVnUWJLWmI2TmJvR1c2SlJ6QTRBeDhxNmxSbi9NelNZ?=
 =?utf-8?B?MlVaQ2s0WmNsTGZmSWNJWGhtTVByUHJ2TU1sSkJPbUxEMnRSYkpTQjB3dFNQ?=
 =?utf-8?B?SXdMN3MyZkV2WTRrczNCQlNmcEZ1N1RrUnJ1VVlLQmlRRlFpMHQwM2dRR0lz?=
 =?utf-8?B?MWwweVhnNkJPbDhRUm15bFUrRmJWSEp6aHBReTczeXlBSnBRMEN5L2FiU2x3?=
 =?utf-8?B?U08xK2ZyNEtGSEw4Uk9hditxbkZHM2grcWxOT1ExWGVURE1KNEtWV2RtTGJN?=
 =?utf-8?B?cExtSjYwYldGRml0Vnc1V3hYeGl3b2lnZ2VMY2FiSTEvOVNINFdhZ2FNNjRu?=
 =?utf-8?B?Qi9NK0FwblZuZWI4a0puaUdMZlpQYkc2YzlkYnBXZlgzYzNGbXJna01SVTUy?=
 =?utf-8?B?bFJEM1NKM2x6bUtLOWVVUW1YdWdpbkUyWXhhNWo4N3oxdkxrdXFZZGZLNGpJ?=
 =?utf-8?B?NkJqelJaRlh1OHJ2NzlJREFZa3dzampiMzZxQlFyYmZBOS94V3Q4MFpyRUQz?=
 =?utf-8?B?OE95WmNGRGJMQk9ZaENNSnFjYVMxNlBLei9sZVY2NUQ5VzVxbGdRMWJxaHBr?=
 =?utf-8?B?KzRLakZucy82Q09nOWhLVHlFNVVxWkxpd001RWtDa0RqRkFCbW5SdWlJay9q?=
 =?utf-8?B?dWRCeE1Yc0EyWVFiV2IxSjU1M0V0Nk1zQXBTUHRycmFtdGpVN0VWalk5Y1pX?=
 =?utf-8?B?dWhRT2UwNjZwQVlrUkxRY1ZGM1ZPcHBZdUdLVlA3b2JRelpuTEc3eGJZSlUy?=
 =?utf-8?Q?uzvNdgaQTkt0H8MlFAVBhrKJO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f95609-188d-48d6-f543-08da59db690d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 14:26:52.4234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qGSPA0OW+0Yrk4JbhzfpgHHh7+XS6r4jJBKs2wpMRWE0ggBubzuzzqio+fuAimREP86Rnbc9Rk2zcBiFnS0xrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4175

On 29.06.2022 15:55, Jane Malalane wrote:
> Add XEN_SYSCTL_PHYSCAP_X86_ASSISTED_XAPIC and
> XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC to report accelerated xAPIC and
> x2APIC, on x86 hardware. This is so that xAPIC and x2APIC virtualization
> can subsequently be enabled on a per-domain basis.
> No such features are currently implemented on AMD hardware.
> 
> HW assisted xAPIC virtualization will be reported if HW, at the
> minimum, supports virtualize_apic_accesses as this feature alone means
> that an access to the APIC page will cause an APIC-access VM exit. An
> APIC-access VM exit provides a VMM with information about the access
> causing the VM exit, unlike a regular EPT fault, thus simplifying some
> internal handling.
> 
> HW assisted x2APIC virtualization will be reported if HW supports
> virtualize_x2apic_mode and, at least, either apic_reg_virt or
> virtual_intr_delivery. This also means that
> sysctl follows the conditionals in vmx_vlapic_msr_changed().
> 
> For that purpose, also add an arch-specific "capabilities" parameter
> to struct xen_sysctl_physinfo.
> 
> Note that this interface is intended to be compatible with AMD so that
> AVIC support can be introduced in a future patch. Unlike Intel that
> has multiple controls for APIC Virtualization, AMD has one global
> 'AVIC Enable' control bit, so fine-graining of APIC virtualization
> control cannot be done on a common interface.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
> Reviewed-by: "Roger Pau Monné" <roger.pau@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Could you please clarify whether you did drop Kevin's R-b (which, a
little unhelpfully, he provided in reply to v9 a week after you had
posted v10) because of ...

> v10:
>  * Make assisted_x{2}apic_available conditional upon _vmx_cpu_up()

... this, requiring him to re-offer the tag? Until told otherwise I
will assume so.

Jan

