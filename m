Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 065E4603ABD
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 09:37:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425529.673407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol3cN-0001Js-Lt; Wed, 19 Oct 2022 07:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425529.673407; Wed, 19 Oct 2022 07:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol3cN-0001Gs-IA; Wed, 19 Oct 2022 07:35:59 +0000
Received: by outflank-mailman (input) for mailman id 425529;
 Wed, 19 Oct 2022 07:35:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=illN=2U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ol3cM-0001Gm-5d
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 07:35:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2077.outbound.protection.outlook.com [40.107.21.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab3b7703-4f80-11ed-91b4-6bf2151ebd3b;
 Wed, 19 Oct 2022 09:35:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8765.eurprd04.prod.outlook.com (2603:10a6:102:20c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Wed, 19 Oct
 2022 07:35:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 07:35:54 +0000
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
X-Inumbo-ID: ab3b7703-4f80-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GRpUL1hdUxnvsflbQC0TxQ9A3MQk4hqqiV6SqWVbc8g26ahifVzCi7kBN+ghNaZ4XfAf3gGw8PfvpJUwpT4QAjADU/bp4MWOvnpSSUXY6w3AvFjrh5702K1i11jaRcAZ/6l26J/f+uYbZwVbN7dNua40mbrYU7cXMhzxbLr8T+bcQJybo9zjYqfWLaXyMhsJRPd/W87lNYmzb2FYNw3NlhQIxkWRi8iv2BNOM9V+vrUG8DdbYYTR3w2zHG6rqkCqRMfMq04ETii7XvYu3JLdUv9OmC1sEjZ4hz1I8XpmdPRM1YG4f1sU8cPvMXNFdeKY2jhGX4Vo/KHHVYFRXuxFrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJiD6Q6jenheJKbc0kl+G/6YfOjBRubcoZo+kdEjwhE=;
 b=nUZopUszHUP7dpOtKtkiAozYApF/1RBVQiXtid/e++Lm9r49QfsPLHnWXgeH4lhbgsicC9rBDgLscuFj8G6zThR93J+pJHAOxEP2LMbbyMJSUBMlhSptWNh/rNYWNfesrlMKaAItVj24So/aMwxxChjIJAaXr+HJg5AMFrrcLDZ7qVz03p7pXN16nYfOqjZ9VPSGkIzpaD4WjUYzb6hfqVES5stdI5So337VkNhZ08m6yOQwOUpnCjYhbpiTqjUjurVrEKeze7IaFlmBJwrLeWb7V+i9ulSydzLGYqlZvd0ACLsEfenJaPCfjHNtWbyldYVQ12Nb0fmCj2KUhz3xAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJiD6Q6jenheJKbc0kl+G/6YfOjBRubcoZo+kdEjwhE=;
 b=YsM2pbpxZjEDtrtDrfBNKGEJR17BWDoFqyFCrlqxYJq9ZgS5OpOxzMThBm6bpRrKemZUVugAqbiK8UVoo/H+nXf8Jo8mv7liOvYdFCwB7uEVOuzTP5MDIfSoPa5ifIJXB42gwLPkuEEzOpVVfBBBL2bG0bn5IV2pS1zDdM0t7dGqCKZhuJ0Xogd6pUXmvPclVF8oHhIhNnFlKTuOrrB8CUOHDMRaexjrwOyVGDSzP9U26coksLXww5VTuLtkCZix+p5DHNfVYDnW8x5+krxNNzZYxY5UpdQMwGJBpDPGy+hH90JdFhSQx4QlSmsZi8ARDSfIZooI4zfFdZno2bcL6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
Date: Wed, 19 Oct 2022 09:35:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH RFC 00/10] runstate/time area registration by (guest) physical
 address
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8765:EE_
X-MS-Office365-Filtering-Correlation-Id: 352459a7-0101-460b-71ba-08dab1a48e4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wSdxzTX9Y1uwigUXPImfB1xMyRvttgAeSzvLeuuOICV2EOX3AtxJdPCQsusDzNGGIOOEI8VBcV5rFep2Go84BfzooangBRvQET4NMcF4oXIzb57WhDTlYcymMOuuP8l75V5Pgan6rWHxgcyZQaN06dj+9jWw0d2fXAfFJqwGAFCHyi4bYnIdSE2PNN71PwQ7A5JU4F+NbfYnhD7YXD3p/BIxs0tRgovs3DQ24oMnJsb8/KgjcMAuPv5lxdnyBtKvZp/2V0Rj59sLYlQJa1tp6fhHhACxIKQZ9qw9yBFKuXq88Pz2dXyBGgZvzfxigJmDW7m5djIlGM+Yn5V8+D3LDUCPEB/MjvsuuHgC7ukZWIE3gPxe24vRIi6/B4bqhDBa1clZSUmDKFkLGh0pQ0A8zr1m7v2SFfoY8qbifz/EGah/p7OwbfCcrE9io0bJn/bWLgm9z48jPQdTdrf1OibjQ2w7E+Pm8RgcSyYEX4YzpARwVMYBrwfyRk91BO1QrkAW2TTotF4EGRJ37aoIHcW0+SXGOxgYt50ArCf9Fk/fGF555pAzFTxdtq9+/ATiVMXJX5IBv1vAAF6blLWLtArB8olUp/CnVSlSNH6yabGItgt4GVVg930RIpznzBoquwTSu+fAQs6Bl853qqtBuZ4y8+s527Bb4XkqnAf/6llxSP6sKkXmI1wGs2hUYbpq2g1PMY6j3lKfJB0pg3qBvLq1H+AOhCpCqy5Q603Qj9uQQRcZm033kppTjfrSAYBg5dPDLVlV7mUxrA14ZFy/apC3YwwDoS70EBvRu7Y2ovYaDtc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(346002)(396003)(39860400002)(366004)(451199015)(54906003)(186003)(6486002)(83380400001)(86362001)(31696002)(2616005)(38100700002)(5660300002)(2906002)(4326008)(41300700001)(8936002)(66476007)(6512007)(6506007)(478600001)(66946007)(316002)(66556008)(6916009)(8676002)(31686004)(26005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGNtK0ZEOVFxaGY0K3QxQ2Fnd0dDckVlK3VFaU1hN2dxS0x3UzZqdEwyMjg4?=
 =?utf-8?B?R0cvWVVPSEZteGQ3SVh6SGh1RUJ3TjFkdDMyd2dQc0xMa2VhUWxjNWdtZjBN?=
 =?utf-8?B?b0xsYlFVM0t3SUZ2QWo4RXRFVUUxcXptc0QvSTVYZmNsOFRsL1RWUmZHMjly?=
 =?utf-8?B?OU9aTGhtcE5FMjZmMHZCTnNRZk5NYXFBaFhFRlFrMWxOVGpOYWtXcVA5TGNz?=
 =?utf-8?B?Umh4YVRJYnR1NXppaWNkaE9RbHJrV2hZb3RnYmVKb1NTRFo3TzZqaTd3Y0kz?=
 =?utf-8?B?NmswWTNUUkNLOGpmckN2KzlkT1Yyb24wQ3NZbjFYY0JuYUJ5TTd6a0d0ak9u?=
 =?utf-8?B?aFZidndIZmRmc1U2dlh1MzlCMEc0S25QU0hONzRNbEZpa2hpTXpWNFR6MlV0?=
 =?utf-8?B?VXRZb1ZiWDMyYVpncUVZOEJzc0loaURva1o4dndrMmVWVGRjMndMVjFkcGVk?=
 =?utf-8?B?L0I0MGlEczZXQTJaK2Fjb2szdytCcHRCOXhHY1BMSFN6ZzFSNTZCTU5hbldC?=
 =?utf-8?B?Ylk3d1lZSWNJY1c2TERkSlZPQjJjaUlEWE1zODdhZDcxdVpYc2pzdUVaTVB1?=
 =?utf-8?B?eVdrY0JHNUQ4WmF2UllzMC95WGZ0MU4wTy9hWHBkanF1QXJTQ21UQnNzc3o5?=
 =?utf-8?B?ejFlKzkwcGNjMEsyR0plTE5pNGtmTTczWGROSnZKenhJbnYwcURZNDVKV0RW?=
 =?utf-8?B?bWhEV2s0N2t4Y1phdU82NCtMaG5udTZ6NGFZenVpYkxTOW1lZlQ0c2lDM3NW?=
 =?utf-8?B?K1p0NUxpcFFQV0ZoOTV6SENMNWNtZkl1OUNwUjV2OW1kbkk4SXpaaTRHMjIz?=
 =?utf-8?B?dUZOOC9TcHk2U0lqMmh1eGtscjM2NVhudms2SnB3RkxMWU8wQ3hwV21Lajdl?=
 =?utf-8?B?bkxIS0xqdWJXSC9SQStvV1AwR1p4WDZ5UmZZWkJXVWZZU09GOGVlYTYwcklS?=
 =?utf-8?B?bzM3b3FreEYzRmZtU1dNSXgrVE9naVpIVUc5MHpVMlNJZmZ3OUFWaWxtL1E3?=
 =?utf-8?B?d1Y5YnA0V3UvYlY2Q2wrUmNxWlE2Wmpwa29Oc05XWUhlaUp3bUQraXRMNVlF?=
 =?utf-8?B?a1ZSU2gvaUxITmNNSEhJVnpjWkZZM1owTDIwdHdsUmVpa2NURks5S0w1Zjdt?=
 =?utf-8?B?Z3VEU3kzTktDRkVZUWNRNFRVS3RLN3JqeHVBRHgwVGZJMU9XcTJWazRxelZs?=
 =?utf-8?B?VDFwVmhKKzFBUmpyeHdha0VWYUJiSy8wbGQrUm5Nd1BhQk9NV0RGVGgvUVA0?=
 =?utf-8?B?a0p2aFR0Q3o1Mm8yTDJHQStRbDEzUTF4akhBVlBCRVVSN3J3Y3AzZmt3Qzk1?=
 =?utf-8?B?M2hEZUpFdFBlbXU5MnEyWGk5SkFrUkdtcTVKLzRTcFlxMmkvS2ovempRaVNv?=
 =?utf-8?B?NnRvcFhKYUxXNE8vMnVDbmlXYllSa1FsbFQ3cXZhTHFmaXQ4T0s3Nk8vL0Yy?=
 =?utf-8?B?ZE9GR0tmQ3RPNFdDTXhjcjJ6cUxBSFBQMjJqS3hldm9iZnV1T2YwRjh1eVll?=
 =?utf-8?B?OWNkSXJMV2t0eklVV25vWWZJc0RYNDJUY2R3MzFsalZOejRzaDBTUFd1ella?=
 =?utf-8?B?Mzkra1RWL2Q2YWNvaUI1cWxidzFadlFCMko4MFA1ZXFyS3VjVnZxWXdQYWYx?=
 =?utf-8?B?N2JENm9wUDZXUUt2Y3FDNEhCdXFVRWVkN0JGUDJ4TjlCSjZuc00vMjBnd2Ux?=
 =?utf-8?B?SWdDa2hZb3Nhc1psYlZ2bmxySWFDZk1Xc09ZS3NYeDhFTWcrUVc2SFF1cGEw?=
 =?utf-8?B?d3ZpTFZNdGxjbTNBOTAyamFsSXJSZGlFM0F1YjdpMDJVSmdkWDBmZGhBanN3?=
 =?utf-8?B?eFFCdjh0WGFDVzFHRlNGczRBT01mM1ZGczgydU81eVZTcFNJZGk4RG5nKzZU?=
 =?utf-8?B?b1U2Ly9kOGJsTEFOY2lYeDduVHEyS0F0ZmtLMGJlMXkxSHNyM1pHTzc1ZS9y?=
 =?utf-8?B?RXorT0gxaEE0TTJKbnVqQmJTaGVTN094aCtHYTdxSlVhMEFodFV6ajRRd3Vs?=
 =?utf-8?B?c3grYWhHNzVta0Zkbm1xZlVBM3djdys3WHhoNklpYnRteStTS0ViNkpmalBy?=
 =?utf-8?B?TW1BTFAzZDNNNzl5aEF5em0xbytJMFFHakErM2FWY0VRYnJaNlFIOW1oWU5m?=
 =?utf-8?Q?ibpx/4oPpWmcGdqib9q9pLI5V?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 352459a7-0101-460b-71ba-08dab1a48e4f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 07:35:54.8232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vl2OIor66yYD2HaPUluiqSbcReYSuh/hvYQtP2JymtWIGqcZ+ZHrRf7gvMQRLQojnWi3y4rfHpR5ijAyDXgAQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8765

Since it was indicated that introducing specific new vCPU ops may be
beneficial independent of the introduction of a fully physical-
address-based ABI flavor, here we go. There are a number of open
questions throughout the series, resolving of which is the main goal
of this early posting.

01: unify update_runstate_area()
02: x86: split populating of struct vcpu_time_info into a separate function
03: domain: GADDR based shared guest area registration alternative - cleanup
04: domain: update GADDR based runstate guest area
05: x86: update GADDR based secondary time area
06: x86/mem-sharing: copy GADDR based shared guest areas
07: domain: map/unmap GADDR based shared guest areas
08: domain: introduce GADDR based runstate area registration alternative
09: x86: introduce GADDR based secondary time area registration alternative
10: common: convert vCPU info area registration

These go on top of the previously posted small bug fixes "common:
map_vcpu_info() wants to unshare the underlying page" and "x86: also
zap secondary time area handles during soft reset".

Jan

