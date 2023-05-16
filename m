Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B72E7046D6
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 09:47:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535018.832608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypPF-00039e-HN; Tue, 16 May 2023 07:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535018.832608; Tue, 16 May 2023 07:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypPF-00036R-Dr; Tue, 16 May 2023 07:47:37 +0000
Received: by outflank-mailman (input) for mailman id 535018;
 Tue, 16 May 2023 07:47:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pypK7-0006iO-Kn
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 07:42:19 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e3d5930-f3bd-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 09:42:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB9810.eurprd04.prod.outlook.com (2603:10a6:800:1df::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.32; Tue, 16 May
 2023 07:42:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 07:42:15 +0000
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
X-Inumbo-ID: 2e3d5930-f3bd-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bq/lQuVdBH8OJVxvLkuI7ZYKR/3R51JXaBu1RSxMhygmomyGqoeM+Lw+EHn5Q8kGVhlaJTs6wnMtHwvGDQ/HNVdhN9UEKFOdWNnxWHbnGJTZh7BuQXsoNYbZdlPL5CxK1dBNDzivvuU9Y18j01RDeijHebKkyD7sUBBgKpk6pnIgQldJ+fiN2QTziuePEwBjIL4qevJu7t354A99X0hXVm6ZEyQom+tFOek3mYKa1MFb17CkgXoY6O6B4epVvy3s/c+pSxp0bhSDC/3LgMikexMdcMNJVyy2VNbGWnIaPNMtWj07etmT8Itu29ZMPUA0F3U1TOOAr9lm1nO+hLFJug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LSqkT5W5RDveh4x9HUNVR27+X3P8oPB/8p3ASxxGxk=;
 b=W1oryS4xJc4AboF//dZiex3vCKd7FomkrFqFqmUCI6Xk0A4Er4nq2reCE0l1Y/tEd3iNLm5eEL/GuApuMcickx7q6KBB+sAH0D/MuCRrtG9g1dfkXWMfOGcFtKD3aZ105fPwIlOH4F8K5cYDuhF9WkkgsvFKqgyL6SPDazvRCguQ8eCwFoBbwUW787+cNxJlTVUVqZswfUeirQQ6ksEqRBPfz8BHPw14GtmrLNDJSti0Qj5ju89Z0QI8TTpl4axU0FbfGeyXbpsudwqHlLROY6K8TrhptwpY8ljTqlu7gbbtctczsVt7V/ZS8iVnSqpkBkg7lJuaXrBMn8c3TdCtGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LSqkT5W5RDveh4x9HUNVR27+X3P8oPB/8p3ASxxGxk=;
 b=HT+XURQm6DZxJNRPAre7SDdErzwHUZE9pk4XCR0lZ4WvBvcSmSQmQpA9kUehTjSBO8xEZyvE/cH90Ettd5Ha2MXHVEJ6OdaM01aKmgvOTDbW99gDX1whBakTmMvsXbmJ9Gg0jxxluttld1I11chSRc2nNw9HIV6aVpKJQ9DhujHHWR4noZGF3hvowxiUsLJjvdkE4upNieVprWdRsCRlp4D6+sBRsQvdpvrij4kAxOPIfBWfX1svM0Jz00cSvQSIaB8CI5N9ZPmPzQWell5NNTZYDoCnKFC/wd9IvHu8Fl6NVTjuZxWWjZZ47tT4lh9cKCfmsBasN6s5+bWWRlYfWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f34c8bd5-ab3b-faf2-e62d-70b5efbedb40@suse.com>
Date: Tue, 16 May 2023 09:42:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v3 11/12] x86/shadow: vCPU-s never have "no mode"
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
In-Reply-To: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f0340b1-cae1-4ddf-dc95-08db55e1114a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0yIGKYfk/tiFqWsKOXXoUYwRe5snVo7ETbsbRajTsKHM2G3KXrqRFD55NrT8eBPqAUEdkhjzn1bNmLb50u5GW+CQi31yqukXu0yeVKuTZcina60xdp3bgg81mm24EU6M/brVyI6ZOu1mAwIVKypJfHtTTyG4grCSigf3x/kGJjVKhXMzB7D7mIilRLeQbL5Q1YOvCBVO4NH7Zs2mjC7bBXbn9riWTfpoI5QkFhTyF80gwPonw9vdyGlcMFQ0JLIUf9bEas4yU05XjKDCt48IlFwWIEtsVS1zZtifkGyhXwb7oXe1rnL7KYMXFMZfK5wEwXCYdALZXMUb3bMpPPX9LufdluIYdUOPsBi2dlm8HJ9WlGx67C2/lEXcv7qAKa+ZX1hamaj5tKdArwhVqDYDm45K09qQzkPvPIm88MJckczqCRi3jah0pyEhQ2ABuXhAkvvvsh9inRYXLQol4HvUTt6GysVmGkBsOJNH2GrZAAWSZOqNaUWdl8pWlBrtz5Hn0ZZEO1QJnNH44Vg20jtAaBslof8RPpWUWeG94Fkq0boOslzfrotGsQ1nk+CeKmNyYDCAuUUcka4u3Cz6I7ocuVrWMOzt68Dzk50w2gGXBwxt0oixCTDdqUQqUPqDHaopt0caw5WfzhuRLrCUXWnV+w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199021)(26005)(83380400001)(5660300002)(4326008)(6916009)(6512007)(316002)(66556008)(66476007)(66946007)(6506007)(6486002)(31686004)(2616005)(186003)(36756003)(31696002)(478600001)(66899021)(54906003)(2906002)(38100700002)(86362001)(8676002)(41300700001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blQrcEJidktyTXU0U0tzNkFseU1PanZyU1NaOUpRZVJVWGIwKzRvSnpHSmNZ?=
 =?utf-8?B?bURMODRiT2x3VW5VZjZWd1FjT2NnaUJHVUk1Y3NQeEZYTFl2WWxpVG0rY2l0?=
 =?utf-8?B?aS9xYzI0d1RoY3pCV0RVTTZZbEVmaUZ2dmNiUXpCb21NTWRYbi9WekwyaTFK?=
 =?utf-8?B?REhZWnlJNHhkME4weFVwQU9XOXd3cDNRQitLYjJ5T0VONG5FYnNDRGkzcWpk?=
 =?utf-8?B?VXlyamY4TmRGMy9XYVRrRURMVUJuT0UvVmVtRTdXMlBGTUpwcWtqUVpBRW5J?=
 =?utf-8?B?ZlB0N01OMjFTU2t5V0ZTR2RjZ0tiVzNDTDhQZXQrWFBtQmFNY0s3MXNKQUVH?=
 =?utf-8?B?ZEtCUVlSeE5NdDR2K21va2l4MXpldkpuSlZjTnZOS3FOMEJMOUhIOEdzVFc4?=
 =?utf-8?B?WXBNUkR1TmpXMG1EMVpxVS9OVUwxYmZCZmhXNG5VYjIvWitCNmpPenVvcG9i?=
 =?utf-8?B?bEp0OHNDNjhaWXRsdUk0aDZYT05JdmUzNVdxMTA4aDB5eEFjcGtHUWd2bmgz?=
 =?utf-8?B?QXZMRm5RZmloU2YxNTBYMXpJQWZDY3RIVkJhMVlBVCtkY1ROUDhlL3N0S3hH?=
 =?utf-8?B?ZzFDeWZhbGFaak9WSFhVVkZMeHA3L1c0M3daTWpmd2daVndCWitVa01zVTFl?=
 =?utf-8?B?TXhlZlYyWFQ0SHRBbUdKS1NWTjkxWjFsWU9Sa3lUbko3VWlQY0pjTk01YWRK?=
 =?utf-8?B?cXpZR3ZuOGtrMnVSR3VxdU5FdHNuTzI4UjZhL1pjREgzUjhiL0R1V1dyTldw?=
 =?utf-8?B?azFBcHg3ekZoRytjbEVjRDZKSElxNGNiaGJQK2l3aTRSUGZrdkRIejh6N0py?=
 =?utf-8?B?SmlkbGh2blJzcHpMMkpJbHBJN2lVUmF0US9MSERUNVhsU2d5eWU2ME5wOGhl?=
 =?utf-8?B?aG1aOWZHWStFYVdiV0xMNDZVSmVNTDU0MXA3Y0VFZmhwODNKUFlKRE1EaDU3?=
 =?utf-8?B?enY2R3lTRUFDZWUxWVFzblBVYTlTRXladjVmWXEySDV0SEIvVEdzSnBxOE8v?=
 =?utf-8?B?Q1hyam5XeHZoTjZOenlLeFpKckM3LzFvSWZVZ0JkYktjV0I1SktZM0U4YThy?=
 =?utf-8?B?aElpOEYwUGdLbi9vQyszMjlONEhYNFJ0UFRyN0RxR3JRVEhiRVgxd3EzK2lN?=
 =?utf-8?B?YWdJK016NER4MnZlTVllc2xPaWNYSVpZU3lIRCs2Q1RCN1E5TGRlWTEvWXJB?=
 =?utf-8?B?UHA3Vjg1dzJRMW44TjdTekNpc0k5S01NUDlodjE2UUg4ME5hb0NVd3RBUXNs?=
 =?utf-8?B?RmlDMlFuNFZ3Um9oelJxQVpkcmo3Syt6WDR3TUU5UmhTcllodVYzYXk0SXU4?=
 =?utf-8?B?MHR0SnAxRFp0T295UkJRK2FMdWxXaWpGRWZIZTJ3RXhYY0FxV25HRXA5cENE?=
 =?utf-8?B?NWhTek1YYmV2TE5WcXViSHVHNXVka1JHaDkwRVM5R29meU5BTEFzQ0lOSE1V?=
 =?utf-8?B?cEhjTTQ0Mm1leUNYK0U5ZmdYRTB4SFRUdStLeXdlejM5OWhrWjdjUkt1L3Vm?=
 =?utf-8?B?amFma2tFY3F6dGpMTjYybXUyWnFDdUU0QlJLMmlHRGNJQm1NSVJwdnNyeG1M?=
 =?utf-8?B?WE0relpPQWRCQ1ZFd0x4dDZHWS96UEkwT1NVZnB3aFdZRjdPbndnQXJrMWw1?=
 =?utf-8?B?b0g3QVpFWUsvU3lQTUxJaWthWVFZZm1veTMvRkdudFM1ZEEzc1kwdTA5QjVh?=
 =?utf-8?B?RDBxTjk0N1BwK01tOStRMERmZlYxNkwwa3VjelZLeHRTQmJYLzFQdVRFNGJt?=
 =?utf-8?B?VDJqOUQ0d1gvck82QUdTZThFSGJvL1NXMWVxRkRLeGVqTkVBNW1UYzdZQTlI?=
 =?utf-8?B?UEJBaGY0OXU2VG02Y0RaazNDdHlnRlAzOVZsSk5EZjBwcXFyZ05oWkt0Y0g1?=
 =?utf-8?B?V2FlUU1vY3dpMUJLY1Q0M1lUZlZveGpTM01TSXBrVzdEN3RFaVJUa3R1UGQ1?=
 =?utf-8?B?V3pnS21KWFhlb0k5OTNHd1pBS3gyQktYb2VPNy9nL1JESXJnSlI2S08zaS9q?=
 =?utf-8?B?VDR4eG9pZDQ1LzNRaitCeEM2OUl2WlYybzFGcTNmbFljeHExWFFTanlpSEtY?=
 =?utf-8?B?NmJkeDA4cHp2UkgzTkhML0ExOEg1c0VtYkJhUHpNNjV4MUhKSGVvTXhYQ3Mx?=
 =?utf-8?Q?sEJAWNv5bURs13cq/Xm4hEg7y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f0340b1-cae1-4ddf-dc95-08db55e1114a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 07:42:15.0562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMeJXUNoJWeW/m+jn6x1YQ+ANK0XN2giIA+u2Ms7HMnpSQeYielmTpeTHI9xgNtKZaj69jQ0V5Xwg7H6unP8fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9810

With an initial mode installed by shadow_vcpu_init(), there's no need
for sh_update_paging_modes() to deal with the "mode is still unset"
case. Leave an assertion, though.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1854,6 +1854,8 @@ static void sh_update_paging_modes(struc
             make_cr3(v, mmfn);
             hvm_update_host_cr3(v);
         }
+        else if ( !old_mode )
+            ASSERT_UNREACHABLE();
         else if ( v->arch.paging.mode != old_mode )
         {
             SHADOW_PRINTK("new paging mode: %pv pe=%d gl=%u "
@@ -1862,11 +1864,10 @@ static void sh_update_paging_modes(struc
                           hvm_paging_enabled(v),
                           v->arch.paging.mode->guest_levels,
                           v->arch.paging.mode->shadow.shadow_levels,
-                          old_mode ? old_mode->guest_levels : 0,
-                          old_mode ? old_mode->shadow.shadow_levels : 0);
-            if ( old_mode &&
-                 (v->arch.paging.mode->shadow.shadow_levels !=
-                  old_mode->shadow.shadow_levels) )
+                          old_mode->guest_levels,
+                          old_mode->shadow.shadow_levels);
+            if ( v->arch.paging.mode->shadow.shadow_levels !=
+                 old_mode->shadow.shadow_levels )
             {
                 /* Need to make a new monitor table for the new mode */
                 mfn_t new_mfn, old_mfn;


