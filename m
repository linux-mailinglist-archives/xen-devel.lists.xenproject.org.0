Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8E75EF29E
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 11:49:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413551.657259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odq9u-0003Io-7E; Thu, 29 Sep 2022 09:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413551.657259; Thu, 29 Sep 2022 09:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odq9u-0003G5-4H; Thu, 29 Sep 2022 09:48:46 +0000
Received: by outflank-mailman (input) for mailman id 413551;
 Thu, 29 Sep 2022 09:48:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1mH3=2A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odq9s-0003Fz-GB
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 09:48:44 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2084.outbound.protection.outlook.com [40.107.21.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e72c624e-3fdb-11ed-964a-05401a9f4f97;
 Thu, 29 Sep 2022 11:48:43 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8240.eurprd04.prod.outlook.com (2603:10a6:102:1c5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 09:48:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 09:48:40 +0000
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
X-Inumbo-ID: e72c624e-3fdb-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2NpZdMKi7fELSrxUYCmv3tXbUgUv0eaPjFn/D9Pihgaj/E0BhhaeJGolvCPlUQeqG367u3/mVaUvEFBI9/n1Lf/+jEiZ/Agdu0QNRu3I/OzN4IP5Hv/fx1+eh1FtFv+8p05+zNMxad7MzNpWx8dy5vj51iIzlSO8b4R2QqnhdkXYbacRQvmpr+zNCp5xozhcd/fPMO06eFpN03/uNcr8UM+DMCjjh4fZ6iE3vwV6W2KyXR3Eq2H1B6KpfLz7h4bSfwq0oiB1owTbS+wuOkxB99RxeIWWSpHZpvbSMLEzLWcblfgotCTQEZh4phhkTbHkPd8uJpbgiEMmXDbv3k51w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1iPI0MR0Z3azuwjQj1UrPXlWcIts8BeWUYOsh1VkTU=;
 b=NWl39QZvKEvWR7P9M+mJ9Jea2dkATQjV/OXyEYRzoRCPQIMCsaelyMTgz4VgEOF8ovYkfErlbdAMNGqGF583lLTeSKVJrCt7rcxOt/Ox6Z11ZKrW7ubG+gRRCcMVmlj+5kxxi9BfFMcEsIkD+IUQWnlvlutN45tHQoMUnrRTNDoYtDW1T2rVfe9VfKZF9xU0+1bQ8djfgfC790fX8EgBv1QPOBCGgYT2Ah0FmWG6HLsP02f+SPWXmSuVKcsM2cHgSaaFpMiMmaK2QvpjlMajFqCm1pkZMnJTBUABlbw45cX3pkLikv6Snyb9dDy1VptTrRC0ZZ8EZDdyTAOrPv1eBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1iPI0MR0Z3azuwjQj1UrPXlWcIts8BeWUYOsh1VkTU=;
 b=cz+ScxaTMtPaIGFN5KAteAgx3hDpdRf1vbKGr9JbMTXSMPbBoYBajDaBeU5MdxHJJAfkYQ6N23JsnBAvg0jrvzfVJX2lFNxqRx3CBanOkwpzLKW6YlkTIPIbUjMC/ZN3Xwapz5ppGXtoyy1GxLVn/QthFDnrH+SqQdSVD4lnBI66iq8eiR0v9KKOFVWu1in5BZ25TgcNC0Q1eShZGt6Jt9ba80MrrJoB6jXo7HreV13wFWhW0Gyy07cHBExvxhhcnJ8ZSCPSkhhhBlC+7u6oSyeEKvjlaHep+AYhrxC0xc2KGt4UO2nK+Z9/gbf626IomnBZ8ZY4L6ffFVd2aua92g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <96adeb88-dcc4-5ca2-54a4-883058169dbb@suse.com>
Date: Thu, 29 Sep 2022 11:48:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2][4.17] x86: (re-)wire two VCPUOP_* for 32-bit guests
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8240:EE_
X-MS-Office365-Filtering-Correlation-Id: 7de71ad7-d168-4006-1369-08daa1ffc986
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lWSe1tm4maFZQWKNZrnsOjEY8fYbSy/hkRJvcFZE+0PXLyVT4sEE5SrIVob29SCBvoLZtYggBFHyNfU7ie5YjY1bEVbYIUO5uienbTVepDH6DIBzh6Uq449rLQ2IreSk0E60KlaJBY4gqxfn9NJWgivcw61GmcyAU7X7ADmGK2f9EZOHaAJx3i91oVQ4HnTyZX31V2luRX8Nx30yo3koG481b3PhvODVclG2djHHcZR2pCUQdHDm6V6Un3lm1+wVZGhxQ8JADGuPK3mGu4QNJQqPPqH84ss/JPTWrjZy4wnHfhAf7IR7XtR2diANUmhW8eN//nsXHRZScr6SVNxFAIStk3npQBiFgyPjRCyabFWxIlnREbVqdYFGRk1AXfL26SpRyloqIiUK5OIBIWbXnTnKQ6sP4kkWNvj/S6RF6CNZ2g36JthHh575TR+UeTfYRHZ7NsWEVBdtE26J/Jt7BtSKeST+yuIhK9s1QZoorVcNIiuLkK6tKMiv9kEv0PRydziL+zwR3v66gkbpHSZ8vrQSWs6cTicTICsGo3Mmcd605gumToe6uvDavAHADgdzIdrrPlid6xdhe8saNiYQMA3oe0Po6kNFt9EBN2jZJwaCG9GkYk1v9o0upRO+zJQCM1wo5l918RMj1paWUvDaEsRmky20YrX147dkDL7E07YlBReUdDjZlO/mdQ0YMMpiieFK0sPlsjnvPyN+P0WcyQBApmse4ws75JEoAEhyC+udkgqSZ66U4bnu5g6+EegggLKVbpEZnpUgq3w7gh27/aFfhqpu71+JxtZ30XXpwqo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(39860400002)(346002)(366004)(396003)(451199015)(6916009)(54906003)(316002)(5660300002)(36756003)(8936002)(66946007)(66556008)(66476007)(558084003)(2906002)(41300700001)(8676002)(4326008)(26005)(6512007)(2616005)(186003)(478600001)(86362001)(6506007)(6486002)(38100700002)(83380400001)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3R1U3JGaUkvcXhYTEhRNHNFS2E2eTc3V3pvZWVOUmVQTEFtQVdmVzdPNkRR?=
 =?utf-8?B?QStoY3I2MkJ6dzNBNDRYcUxmcmhxeHVMTXpSWkpCK2tDMDNVcmRNeXBQM3JB?=
 =?utf-8?B?YU5xRkZDUHY1aHE0UUo4eGc3WlJkMWlvV0d4SU5zbVVHTzR6WkZKdGR5VXg2?=
 =?utf-8?B?NnAzMVpaTUpEdlZKamtQM1RKVlR5T3A5OVorQWxURlJjczRielBhZ1Bqc3BG?=
 =?utf-8?B?MVk1MHVTdTJCRUQwSmpnS05OOHZVRi9aRnFYaitGOUQ0eWhmTFFtRWNTaDlC?=
 =?utf-8?B?V0VYUG9VMzhDZERwdjVNNWc2YkpMMlU0YVhsdDN0UmtPS0s3S0NaTjdPblNZ?=
 =?utf-8?B?QmlRRVpkVDlJWGswR3hVeGU1dVN1Y05nYU1YanZsR1N0NWRhWi9nZzAwUHpN?=
 =?utf-8?B?WjBLU3AxMkl4U3FkVDA0UE1rQXRVYUJ5VWN6SzJBZ3M2RGsxSzFjcjBwVERm?=
 =?utf-8?B?U2YyZlZvSnk5ZTE0Z0t5aGk1ajZBVkdBWWVjblFMM0tYTytnVzUrcTI2Mkh2?=
 =?utf-8?B?ZEdXaGdPckFzcFRpNUovN1BTWmxDODlxTFZQNkhHWEorK09hYWExVUExVElt?=
 =?utf-8?B?R3R6MVFmWjV5b3VmWVBaN0xjS1Q0aGpTQjhxM3FRVnBYNkhVanRFVFN3VFRs?=
 =?utf-8?B?b25HeDZIZno3RGZ5VzJJUVpIR2N0Ykdia1R6V3kyOGZrMjJCcXh0ZFQ2TjA1?=
 =?utf-8?B?SzFjeVZob1RpMmx2UzhxVTY2ZERWd1pjSnRxYnZLNUQveTJad0F6dWI2cmk4?=
 =?utf-8?B?VlI5Qzh3OTdwL3ZPZkNCRVNmcmwremxJdzArSm9iVER5a3lKcU9Gc1VzMkQ2?=
 =?utf-8?B?WHFxdTVpMzV0bExvRG1zL21BN1h3ZmRUKzNBdDlsdFpWRnpoajVyWHRmK3M5?=
 =?utf-8?B?ajloWW90Zm9CNnVjTHlCY203MDVLWkQ0d3QzbXVORityL3FKMlFRUUxtcFhH?=
 =?utf-8?B?bkt2b0JHZnhqTUd4VUJjZEFQeUhXL2g2b0NsajdkN0RiREdNL011WUd2Q1Y1?=
 =?utf-8?B?WUtCYTRoZEpjdnNtNXhWVXRoK3h5c29Zbys2VW5rc29DMXBObnNFekpRNEhn?=
 =?utf-8?B?U3RTdXRUSGNhNmxkV3dSN1V1WHQ2bVQwZ0dnWC91bjNiVk9FYXpPQjZqQkVL?=
 =?utf-8?B?R0kxUTlGUFhTSzFNRUMvUTR4Ym5HOW1TTXV4akN6b1UzSDZTUURaK0E4ZEox?=
 =?utf-8?B?MTIrbUpTalluclZIL1EzUUNwSFpKcUJ6a3N2ei9mZGo1alRKL3RlRk9uNU9S?=
 =?utf-8?B?YllPK0MxWHRhVDRBL21jK3hiYnNCUHgxTVZGSC9QYVEvdDJTeS9TSTJIb2U0?=
 =?utf-8?B?dGRiWU5CRWVpWWxCWGxvaStBaGt5YWtFOCs1RmplTHJ3MzR3MmFDL1Z6YXR2?=
 =?utf-8?B?VjJxTXlNSnlZdGo5QWsyOTNSbHhoZUVvOGFRODIrYnl5ZXoyMVBkcmErdTlQ?=
 =?utf-8?B?M20rS2M1NGhFR2dWTG1samhEQ1JxdC9BYU5kVk9vdTcxaE9hZzU5eXBqS09V?=
 =?utf-8?B?eTFPT3AveC91eXlYK3lHWXkzbktDZDRvTU84dkhoaDkrd201ckRNcU1MNkNx?=
 =?utf-8?B?ODhIc0ZrS3FMS1M0ZENReTh0dE9ENDNEZzBkTnlhK1B6L2VvenF1amU1d2Nl?=
 =?utf-8?B?REVDN0RBd0I3bDFrWG9YdGFIVXRmVWtFSXZFR3VCMHpCeTgrbWVOQU1kSnpB?=
 =?utf-8?B?aXBCV05jVlZLdW5KcGpaRzFxcmppTjh3RDE5NzEvVnJnNUY2dTVuRmc5ZzF6?=
 =?utf-8?B?OEllQWF2dS9xWW9PS0dRZzFGWkJvTkNBNWpGbUlZVHZ5azU4M3pTbGRKZDJ5?=
 =?utf-8?B?SWZlZGFwbXIyZHREK3RSUW9GaHNxSVZUM2FRSzE5ZHhYV0JvYm11T1N2M1Jm?=
 =?utf-8?B?NmVHQWVpTUNCNW02NldHR1ZMYThtSTNndm1KcWtSeVBrZXhtR3hQOTRZMVM3?=
 =?utf-8?B?MHVJTWozT25WUGNzSytnTDZRMCtqaVlKRUl0QVFBejc2SDRpS2pJcFlwMGYw?=
 =?utf-8?B?V3l2aVlCQVRxc2M4a3QrbUdOZ3BOa2JxNDBPb0x4aU9NZkEzTHNuYnFwMXFs?=
 =?utf-8?B?M0F0OC9TNTN5dlpLSXNOS1gyNlFPeVlMWS93TVlkU2wyTEFVMkV2c0lZVHh6?=
 =?utf-8?Q?mhdLVbHnrX7ldY5NE3UVUklVq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de71ad7-d168-4006-1369-08daa1ffc986
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 09:48:40.1867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UbFUu33HXQkk33Ee1VKzPkUPv+C4NlvCe+/j5lg2S02YDp+H2tgObjQPWWA4/j4EIUJ1PrFpNxKZrxXo01ak8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8240

1: re-connect VCPUOP_send_nmi for 32-bit guests
2: wire up VCPUOP_register_vcpu_time_memory_area for 32-bit guests

As to 4.17: Patch 1 addresses a recently introduced regression, while
the issue patch 2 addresses has been there effectively forever (so
cannot really be viewed as a regression).

Jan

