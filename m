Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A14C6FF108
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 14:05:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533313.829854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px52s-0007md-IF; Thu, 11 May 2023 12:05:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533313.829854; Thu, 11 May 2023 12:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px52s-0007kx-Eg; Thu, 11 May 2023 12:05:18 +0000
Received: by outflank-mailman (input) for mailman id 533313;
 Thu, 11 May 2023 12:05:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1px52r-0007kb-7u
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 12:05:17 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 172baf42-eff4-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 14:05:16 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7072.eurprd04.prod.outlook.com (2603:10a6:800:12c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 12:05:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 12:05:14 +0000
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
X-Inumbo-ID: 172baf42-eff4-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwluglEoMsGa+5Na4A+t6A1cK3Y+AiZEPl820Patmrs4jup6/2ePmr1+ksOzNXMJ6PShqua9wlv1ctjKx69//JoABg/y5xozXmaDyezZfHulrDVzh6IOi52XWcFlXM8Rxu1ioW6dxPFfEvaNSWXWUrI2TgVQUmTnjuxZJ2eqUW7kgusKeWpi0Q/L3jF6IdnQ3/fdmL9IlKVffGmvQsiU6mo+LOFUc8bIZ+w3+RlMcMMY3QH60al+YK5mgrSxXaJCQ7ammbyMu9YT+ge1iLnX7K2Nc3BwuP4M959fr0E+H72vfbaMHuP+1A5gBTmaFotTs5i3HDO0ExpRV8Q+HH16pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85NF9wUGCDebSUIxy5wAPMqsl7IvRarqbL2JP+ygPsw=;
 b=j+0cOaR5AJb3eG1lhmEZkaEeZgLAIcFV1ppo8PGza5xmxMfMD29rSrdy1ER8Ld1DFeZGCpTYdlAWBsOlYjRvyAQkiOY/MREyy2xkWrj5d3MKlQhiCYBYTFYSvDV1O55jpXzeSAso/jFsoBt2NPjXdVyabN5YAnGK4iTnrRdvqwCdLD1dJ/7nsPt4oxyYTO9YngU18EuhIL3vVjTnAFPcWTC1U2209an7E69NMdpe6f4YZslKrCM+DtDlJ2ayErJ2KvZsYxAKWSqKBfMarEMNg/SlXowEJ5cLGXsgA1hsylJBnjFlWH3+GLgKJqFwl+xNRrdWDBg6yZSSZs7o7GmjYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85NF9wUGCDebSUIxy5wAPMqsl7IvRarqbL2JP+ygPsw=;
 b=fQxm5XDa0eDeggqUKV1E5Yt+gM4kS+D0F5F5b+sho++pK5GGn0Ocq8A/3Y4nGE+f8TJAsTXWv8HO3tFXquft8mZKjsJkwe+qZCnqH3AtibgkBajAaO8QEqmbkRs8aavB8E61nUVPBBl/TINaUA/7UHiWVl5rQABerspwcjS4s6iv7gI40tw0tf1G37O4DG//AJSrTbxTAs+YNKOZPUosoYDNLQsZbhB2PbmOdwGlGNcRu9qEjmoNt0rvIUgiHJZxvsJD8izoJ5YGeS7W1WFiyt8oBRZZbAueLl0o9C5H4NcJrywkX6jI3UKcr0iGuUo1zhDsYyaJjnweI12rl8mPBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <74c9e6a8-9094-4646-d06f-cfe0a427bb37@suse.com>
Date: Thu, 11 May 2023 14:05:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH 1/7] x86: don't allow Dom0 access to port CF9
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
In-Reply-To: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: f45392f6-06ff-48dd-91b6-08db5217fa5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c49y1dds/UoVd/uTNEFmBLQ3oJz3rTX/ncFYN8Gl0Vxp9/gFlVVMjb34GVj02qh1ffhaFtwgGCK/0TcyoSiPl6jAzEPqWvScr7FRyVCRVCFXjHfrNG21Bw8Lhb2AnvbcHFnvTlEPqnIqTJxLpKmXCnDAXp+l0eLkOB1slj18S0l82ueaxP/zLWpM1PwOzYOr5eg9hJzwXbczTdzh1ENsABEvjoN4e9As4afw1G4oiA6N+Z/n6H4jTjHwhZPDA9xjzQ8b/PF9NF96wPlI5ueYLJWC/ifFLfliWKL4P9ZDiVpHChIWOcXnGIrpuwhyIe7UbajL97GTPPOkoSdNds0WIAb9cRuqknylSLIfE8ojxApptGb+Mzvqq0O14A+aRGzZLbEOVo7CKIVbc3L0o1XQ/y86l0lbgqQuTXfmW8aJwXVxZPldr3ZZBydvk6jter7UwOrgueTutF5wiHgAo1FgOkDC+kx1kCJj9eqqKphfnnvQsRMY12/zRONOJ/sLSolXuzFzR1tbGDAGnBfVG8QbfUT+S5R6dC1xJ02dLDZeLRxJbBoz9rJu26FqAYYqJccr18AvNmJ29JPZf1sT8F/znjdOYYhKSR1s3igq4LVxezLkWc3O1drs1yyxEsw9SqRwsrZhiT9Nfqr9eaMYkIo44w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39860400002)(136003)(396003)(346002)(451199021)(31686004)(36756003)(2906002)(41300700001)(86362001)(38100700002)(8676002)(31696002)(5660300002)(4744005)(8936002)(4326008)(316002)(83380400001)(478600001)(66946007)(6506007)(6916009)(186003)(6486002)(6666004)(66476007)(66556008)(26005)(54906003)(6512007)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUtIL3NXMm1zME84QWdiZUJhWTdSTXp1WS9aOVdtRnIvUGNUbWsrRXpIMkZq?=
 =?utf-8?B?MUtPZ3RGUkFXL1VpVjNjMFNaTU9LQ3lvb1dURVVkS2xEUkJkMm90UG9BZDl5?=
 =?utf-8?B?UTV4MFhsVml5M1p3VTNVUmpUNU5RaEF0dkNhM2dJYW9vZW02bjdaclgzSUNo?=
 =?utf-8?B?U2RVaWRNWmZGa1U3dWFwVVJxdDNLejdPVmEzN0c1cWo0eVBmVUJMSCthT21u?=
 =?utf-8?B?SnVlZU9LMW81UE1Nbjh3U2F6Y2JUd0xCYndUNlo0aU5qWWg4R2RvRE5jb0hu?=
 =?utf-8?B?US8rdFZ6UGJjeXhFOURvTHhNZ0N3ekI4MTlvSXJwQVMxbnB2SDFiYXpjTzFs?=
 =?utf-8?B?czNtUSt2U3JYUkwrczRxb1NNV1QzM0lxejUxdVFzM2g3a1g1ODlFK216YXlN?=
 =?utf-8?B?UEVuS1lQU1dsMDJIWG9aeGdZVG1tdTh1Zmx6ZmlGdDE4RVNSVVVBdm5WZmVU?=
 =?utf-8?B?R0xMeVY5S0M4WFJsSDY1Ui81ekJXVzIxQWN6NHJUSm1uRnduK3FRejJXTWti?=
 =?utf-8?B?ZHNwZnZnK0I3aE5KbnlROWRzb0xLYTNqRHJtWi94VzZwSDJka3JUTTkzQ2dy?=
 =?utf-8?B?MEYzQVd5WTdqSVFzR2hzaSswejRXZWhweC8wTHBJTGdXS0IzL0U2T1NRNnRt?=
 =?utf-8?B?UjlxR3djcWUyaHU1Z1M3cXNXbDZEWUpVZ0dFeDFTc1VnYmI5V1lWTmV4bDNN?=
 =?utf-8?B?VHc0dk14Uk9QUFFwbHlNU3VGMmMycXo0MG0vTEJNYmxNYkErNmI5Z3VzNEtN?=
 =?utf-8?B?c2x4MUJ5Y01tQnhpUmVlbVYzVWZuUnp0enBDNlVMS1NRLzJGdldVNHhFaFhx?=
 =?utf-8?B?UXFQZG5XVURqRW42NElGSGZrbnd3TkI2SVp3NzhDMGpoK2lRMDhLZlZEK2dk?=
 =?utf-8?B?Q251NUlqVms1ZFBmMkdERFVSajk5Q21USmdvZndDcVBaVURRRU5HTHhpSEUz?=
 =?utf-8?B?Z0ZuN3hwRGd2Q3M3dlpsVGZ2Rm9OZHIvWUNZaG10dzBXeUtwMXpEbDdkSnZ2?=
 =?utf-8?B?WVVkT2RQTHZob3NtWWxLTytaMVZEY1dvNFJMK2V6QnlPYURZU1JjcWJSQjYw?=
 =?utf-8?B?OGRRSGx5L05na0xBNHFuWnhXMmQzNy9rRVdjV3ovenNxS3IwamNpcnlNTCtL?=
 =?utf-8?B?WmtuSTNuVE1ZYW02dmxiSkFvMEpJTFJraGpHNHlsT3N3Z2orVDZnaGlyTENh?=
 =?utf-8?B?SUZ2enJWR0pOOWlTbndFRk9JTU9iQjZKTmloczM5bW94QW9JcFpFVndkZGdr?=
 =?utf-8?B?bnJyNUcyWlZOK3B5MU9QMjdnYWgwV0hpbTNvZ05abXpVMFJVR3ZRckkvcWtm?=
 =?utf-8?B?OVNNR0hFTWpteStaZUVJYi9DRFRObDA5NkJmOWxhMEo4ZjJYUk54ZTYyTkc3?=
 =?utf-8?B?Rm02cWZ2b3VlNTJRd01PSlgzekJhK2FydG5YYTN6VWgvRW5PVERCK2lzYVIr?=
 =?utf-8?B?cTc4ZUduemJ3a2w2TksrOURBNW4xQjMvY1ZEUnRYTXREN0JmRkZteHZrNCs0?=
 =?utf-8?B?NHNTaVRrZ2UzZG1QV2J5T0UzekdPWGVtWVJ6emtZQ25DaWJSVU9JRVpwSTN1?=
 =?utf-8?B?RlhIZElOWkFlU1VUeGlTMzhWWUdQajJ1d3NESndCWXpMU0Y1azRydXZ4d2kz?=
 =?utf-8?B?YjhsSjJBMkQ5WjluYzl3Z2NPTnBleGQ5ekJGdG1XdnhsT1F4dllkMEtaZmMy?=
 =?utf-8?B?M2dlVHA2UVN0ZFRZREhrMzZjeXU0bU1lQnBhRi9ySDJNYXZFUUN6Ym9MT0ZN?=
 =?utf-8?B?enF3U2I0TDlNKzQrNjErSUQvZzRLRFlDQ2RtZDNLenFtb3VLWm9hNzlLRjU5?=
 =?utf-8?B?OHdhUHV1RjZIV1FVLy8zeGxjb3NCMXZ2ZDZSQlRGQWlUU1ZQdERsU1lsZThx?=
 =?utf-8?B?VEZMMkpxN3Q4RmpyRUFQbmNFays3T1ZvRSt0YnR1c0ZBSk9uaTJLVVBrRHZy?=
 =?utf-8?B?dlB0Zlg3T3RSRSt6Q3Q3a0JTVzFRV1RwVTBhSE9neTkxSHJmc0ZjRElVdTdG?=
 =?utf-8?B?Z1pwQVgxL3drcWNmY0FZOVpOZ3IzMjc5NXB6WTdPSGFYWTQ2d3VPWkN3ZWZs?=
 =?utf-8?B?QlMzNzFyRHpVUlUxUmNKWHBsWTRVZ2tQV2EwSjRQdGd1bkhFOTNMaVQzTGVD?=
 =?utf-8?Q?hQ3JxBXt4YH4HBc+P/UqpnVAa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f45392f6-06ff-48dd-91b6-08db5217fa5c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 12:05:14.3150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 414Kk9EEkJzByG44rXWxbzF+68rUKpIQ1ybXTnZw2O44GyKBPs81HIQ1nYmSYLJjpDc9Not9a/zw0yLyNv/eiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7072

This allows to initiate machine reset, which we don't want to permit
Dom0 to invoke that way.

While there insert blank lines and convert the sibling PCI config space
port numbers to upper case, matching style earlier in the function.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -503,8 +503,13 @@ int __init dom0_setup_permissions(struct
     /* ACPI PM Timer. */
     if ( pmtmr_ioport )
         rc |= ioports_deny_access(d, pmtmr_ioport, pmtmr_ioport + 3);
-    /* PCI configuration space (NB. 0xcf8 has special treatment). */
-    rc |= ioports_deny_access(d, 0xcfc, 0xcff);
+
+    /* Reset control. */
+    rc |= ioports_deny_access(d, 0xCF9, 0xCF9);
+
+    /* PCI configuration space (NB. 0xCF8 has special treatment). */
+    rc |= ioports_deny_access(d, 0xCFC, 0xCFF);
+
 #ifdef CONFIG_HVM
     if ( is_hvm_domain(d) )
     {


