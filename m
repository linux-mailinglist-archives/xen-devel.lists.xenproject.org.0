Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 376F263C2BE
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 15:36:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449413.706129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p01ig-0003B3-O7; Tue, 29 Nov 2022 14:36:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449413.706129; Tue, 29 Nov 2022 14:36:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p01ig-00038k-Kg; Tue, 29 Nov 2022 14:36:22 +0000
Received: by outflank-mailman (input) for mailman id 449413;
 Tue, 29 Nov 2022 14:36:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EGMg=35=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p01ie-0002d6-MB
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 14:36:20 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7d00::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3017bfa0-6ff3-11ed-8fd2-01056ac49cbb;
 Tue, 29 Nov 2022 15:36:19 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8864.eurprd04.prod.outlook.com (2603:10a6:102:20f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Tue, 29 Nov
 2022 14:36:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 14:36:18 +0000
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
X-Inumbo-ID: 3017bfa0-6ff3-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YN0ytvtAWYsO18d2ipOc0n9uiXHR6UmKLwXwWC7vvqoEegH+gM2JJCoo1DMJqIBUfdkIp7/jP9yAK5GPAxxDFwX9XZqDbhjEkhlJPTX8/9o/A9XY28Mo0cNs5pGL+Z6Rzq4UW2PA9a+dVThbhkndJ1oBR/fp9LcqYh6xb7ahWdDc+dHNej05yxc6trUfDlwoKjqaI4cgx/a0TgfU685Gk4Gd+sDd8Z62SNmkWcKis6RaFLwkCNFL9gUPf6XOLQjvGY5+PG/0boZTRSQeD2N552EUFmzMWSHcfHMm/DMI93oJjnIZrwByu/19GqI4JiRXNddQxUHR8ypcoXBfwm46gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7xsezOeytEYElDGXFOksgYsTvpYOo4tlT84ILzDSLPs=;
 b=ivGFj6psiOKRFJpHqb4eHAcUL8JL5LWls1jcvIorVe4bvNPm24CL37602pYtSwhDnCI0UJZYTrHvas+nfsmumtjaYgTzIRo3h1SMFGuL81GvLkR9bLoq322pVOFJYcJTFu78kC5ZYNQr8QU4b5uDfXRYq3X+klRUJ84lbELA02Q6y//yykkfBWWrXJnRYUxvvu1YzQcxQmWVzywjn4STV/Osrjywwq4hq0z+KZINckON3s13WFX0Wbxk1C0MDu0t+l2XST7PUBaAldxszvwZ1s25Dlovq3/uVR8/5y4jY274bIVe1KQqeeH1GDyX4daen6KPr3pc92MBZciA/YcSbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xsezOeytEYElDGXFOksgYsTvpYOo4tlT84ILzDSLPs=;
 b=4jdT+y3GBKdNU/e6Jb6lNA7l5s+hFMyKG8puJdbjCHi4aUFaNFpxlqL4eWyTsQnZnVT+x1Gpl+yHZshsz2o7BfOD7GuPtvySfT6PZ/x+tXkbkBxWYDyHhTtYr5bOP+norGH7i/0AhUtW5rXRZBMQOEVbqFAiRCY1ka0ziE1S1yEa+ec9oG0NA7dijU1ioIkV0LaM7powqq2wyRnR2CE3M3Lv2zO+9fZJS4/qqJJ6Sb5blFoyDGrsVgTpRWuBR69V+9aVpchj5qqXtipWDPF2fFlvjbCPCUTDTzTVIUkNKD1gi9NyqcgRJ+4XSbuCC2wHxYwmArnvAktuk+fgFa46PA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <22d39f29-d87d-b3f6-d601-85fa1d4a72f7@suse.com>
Date: Tue, 29 Nov 2022 15:36:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] bump default SeaBIOS version to 1.16.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: f7886aed-6d13-41ee-2c6b-08dad217138a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7dbZyrXrvO3m40VH4a7XF3seJdRh8kcc1R8B0tcQV3lYph4NLj4sMgG1FkgZ0aNejVzgLzITRBUUu0Rx6kT9bKOzP9umVg8S7Aj3eiQx0C3Oowwifi8A9zR0xFpPqwAnmMCjqmO8fdDpyU27jzncNyTiaLY1bMmQLz1KZbCEkEEVolCPfqVcOMGjjO1aePC2kNsMzdg0FykbTPSkRaewMkFEurJgAr6XUStlJqgeUguRjeEoJrk6y9+JVPgdhPDMmR9p9bqO/r9sCEhymGv0AgTunltvXcCecyXKjRgwP3j9l2AeQ4CFSXjxPqsxM8K1L2ZV+UwygTVWs9TUZXSVNDS8wvWOVsl0vz9gqA2tCGLLKmM01ea1crk8+EzvfqCO6/9c7G/wirmHC5fD16dItPBDn25GsbPCePP5IjoEgCAwf/pH/VC02e2u/hSA/0Cj4geipsLBPbq8JaCnCxJCApzQ2LYB0p7AGJ6KZrCSgwe8pJy8CFru1gUzMXGY2clgLQBqXfWERluzSUTtTBPl/+q1sULTvFDJb3p/n+dFRBZMwXaCHr0ZNSr1SUVCEdxIuF8I26DzPdpl5eKJimriucRWKde/XyxcW5Lgui31jDiAB0cbwIDOzBEwiNkykf0ddFTI5CoB/nyQA/TTVRkKEWPZ8JloOUmNM8FvPKBcaw+dCGW07VKbyMm7dMahmGo4IxrB68vYqe2Xred9v777vFqE/cLN4GDjgnvSESvR2tY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199015)(2616005)(8676002)(5660300002)(26005)(36756003)(6512007)(8936002)(4326008)(316002)(186003)(41300700001)(66476007)(54906003)(4744005)(2906002)(6916009)(38100700002)(31696002)(86362001)(66556008)(6486002)(66946007)(478600001)(31686004)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUxBSEcwWUN4akx2UWQ4Ty9vRmt6N1VGRXcxa2RJWlR4Vm0xWUxkSGVrTVJD?=
 =?utf-8?B?dGIrMlRNdW45Q05BeEtranpLdzlqbmswaFQvMkxlbC8xckhjQjNvMDhzcjhD?=
 =?utf-8?B?aXpHZzVuUE1jQVU3Z1hISlBkcWJ6MXZpMENWK3dHNGd0cCtaODU4WWg2THcw?=
 =?utf-8?B?YXEzTVV6TUJrR1VZMDdvTm5FQ1lwdkZDVExwYjE5K3NRZHFPL284RjZvbDhh?=
 =?utf-8?B?c295ekQrSEExV0pUcS9qdHhwK0ZDTVBtK0d6S2FnS05EcjU5dHhJc056ZEtz?=
 =?utf-8?B?cUNzOVVwNTVIbGV4YXJoTG55OGhXUkRuK1ArNWRiNjI1M1BoT2VLa2xhQXRr?=
 =?utf-8?B?WlZqWm5DbnF4Vk9qRGIrM05sdkpISXZtaVBHTWwrWHV2WDVaT1dmUXVUZFp1?=
 =?utf-8?B?V2RFSGZtSGplMHMrRlNtRVRQY0hLUnFrY2QxaTV3SXdEZmI5QkdHWUV3WjhL?=
 =?utf-8?B?SDJ3RUM1REQ5RUxSaVJSTkZRTlJERDlZbmc3aG1OUExsaEFHNlRTTHRqdThn?=
 =?utf-8?B?cXhiWmdnVnpBbm5KbVpEeXBxdllIK0M5cE5KenVINm81OHkrQ1RvdTFZRVVh?=
 =?utf-8?B?UlJvb0FabnUrMDJuN1VRS3VBYWJOWjd2ak9VdjAvdzJ1YzZkekJidklKOTRl?=
 =?utf-8?B?dUM5MWxYMU5hV3VzdU1LMnBOWmNodnVaaXJLY0t3RnZKampQRDRMSTdiaWdV?=
 =?utf-8?B?Q05EWlhHZ0dqMXM2bkNrL1o0WWFvVlEvaG5pMDRhNDlWSmE3d29RSVplTDUz?=
 =?utf-8?B?azl4Um1ROHZhZlNFRjhOWGhPVVRnUXRHMFRhZXVxa3NGbEExMkcrUjlpeE1X?=
 =?utf-8?B?QmtrUnUyai9ldG5STG14OG1CR2QzU0c0TUlrYXUzVXM0MEhycnZUckdVMXR4?=
 =?utf-8?B?MWxTNEpWNi9XSExoSzBEZ2pkLzJXamIwVDE5YnM4NjBpMWU5ckNaVVZ2Y3I3?=
 =?utf-8?B?dHFSQi9SM1NtWnY5U0ZHZkh5T29sa0ZFbDdjTm1LbldIYU1vOHdNbnEyOG14?=
 =?utf-8?B?YWIxS2lWMmZQQ0VISkRoWVdYLzdNaU5lVTVzdmlMK1h4ZC9wUTg3cEpJRTUz?=
 =?utf-8?B?d0xBK1JTQThtQ1V3UVI0UFNIYitvWjdNNHREaUJwa2RpVm5vQ2Z1S3F4UVZN?=
 =?utf-8?B?bWRHYzZnSVVpcHMyQkxMWHFFMFhxMUNmK1ZZcWFiWnkzdUZPUWJNMXVDeFRh?=
 =?utf-8?B?TVErL1Bkb1h5dG1nOTdiRWFnbExNdnFQYzdRQ0FaZGt6RFpRT1I5OTVBUHB4?=
 =?utf-8?B?YWRUMHl5aVA5VEVCVVNubUlDR0dJL3R0cDdCSHdDU1BJdHE2clB5Tnh4UGU1?=
 =?utf-8?B?cENYc3JkUytZOS95dGdqQnMybXlOdHBWcmdXa1RXL2gwUjU1VXVCQ1JjMXNs?=
 =?utf-8?B?Kzl0YXFaY3IyOUN1aThxTmtMVGhGMkRNekNjTHl5ckJ3Y1JicGhGSDZDaEVY?=
 =?utf-8?B?MzJSVU9uVThjbkhoT2xSWFFheHo1QUJEd1pzK3FzSWx1WkpqcElNWTNLcXRR?=
 =?utf-8?B?OEpHRHI0alUxS21rSTFFQ1Z1T2JoSzUrRHJjN0F3MWQ1b0RVVDZwcTByTncw?=
 =?utf-8?B?SXJVRzdJSkxjZWsyTllkQm9RRDZmbmg3NnFHUWcwRXdmdFNpWnp4Qi9xT3ZQ?=
 =?utf-8?B?YkVTN2E4WnF0bi9jcGZxM040S2JKeFd2S012VkQzWXAwVUhqb3FublhTcXZv?=
 =?utf-8?B?bnFiUCtBeWpYY2JxVGdIR3h0Qi9ZSHFVNGdFSllkUmIrMWx0RUFIU1hIeHMy?=
 =?utf-8?B?V3IvdmVCR1JsV3Y5QzRHaktQMFE3VUx1TzVFRWpXRitocHh0RXdFYThQbjY1?=
 =?utf-8?B?U3pXZUJqU1JuVGVoYnBFelJJMHpPZk5yMjRDVm8vREErbDdNampZaU41aWhh?=
 =?utf-8?B?Qk1VMXN2UzZCcEhpUG1FRnhuM0VqbXVyb2F4bld5ZHNVMlZKdmt4S2w0RFJD?=
 =?utf-8?B?UTJvMy9DYWI0QTQ5Vjh4OHVQUTAvaXIwNGtOemdqcjBnbXMvdWdoSFZPN05J?=
 =?utf-8?B?dTJNL1dncDhwNkdCQUZYTWFJSGx0blFyVFI3dnFNeDllWEpVV1p0bEhWMmRi?=
 =?utf-8?B?SU9ibDlkblVwdHRkclR0eFBEYk54RytSZjZiem4yeUEwTXhkUEVjd1VRODJ4?=
 =?utf-8?Q?l7FHtnxRz9zKQQzy+skaC9nvT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7886aed-6d13-41ee-2c6b-08dad217138a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 14:36:18.1655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YW7si0z6Qtqrge4tBIyzhG6gX9Nmz126GyJcyPrglNesiCEv2pXB4azsSgTipalq4NqzKrf6PpPGKDD/pFhlYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8864

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/Config.mk
+++ b/Config.mk
@@ -232,7 +232,7 @@ OVMF_UPSTREAM_REVISION ?= 7b4a99be8a39c1
 QEMU_UPSTREAM_REVISION ?= b746458e1ce1bec85e58b458386f8b7a0bedfaa6
 MINIOS_UPSTREAM_REVISION ?= 5bcb28aaeba1c2506a82fab0cdad0201cd9b54b3
 
-SEABIOS_UPSTREAM_REVISION ?= rel-1.16.0
+SEABIOS_UPSTREAM_REVISION ?= rel-1.16.1
 
 ETHERBOOT_NICS ?= rtl8139 8086100e
 

