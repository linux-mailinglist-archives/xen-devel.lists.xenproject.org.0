Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A10736968D8
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 17:12:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495279.765607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRxuD-0003bN-MN; Tue, 14 Feb 2023 16:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495279.765607; Tue, 14 Feb 2023 16:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRxuD-0003Xk-JD; Tue, 14 Feb 2023 16:11:45 +0000
Received: by outflank-mailman (input) for mailman id 495279;
 Tue, 14 Feb 2023 16:11:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jX19=6K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRxuC-0002M8-0A
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 16:11:44 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe13::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45a4d807-ac82-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 17:11:43 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6884.eurprd04.prod.outlook.com (2603:10a6:208:183::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 16:11:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 16:11:42 +0000
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
X-Inumbo-ID: 45a4d807-ac82-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JT8SwaaxGaqOdIlo6G/KwBNB0XjHtaMZzaQ7Y8YSFx8+2OIGnW20U4hPu2lYEs2aNrQf+QsXu79BcYBDZiKs0wVJ5HtLRvk+uX6CNZcALA/OwXBRg07zybGO0r+dnrWhXaPvTeznw893ZrXyDTE5Lb2sam2qgQVnLXAPAl1THgtwLyBaG+ibjiYJAartW8tNSCf+h5R1TJ1unVdx0u5jLNIlwRtiBnX1D9jn8aqtEZsZRH3BuO+UREgP/TQJF4HwVpVeR4xfXWgVr5uqFSzTjvOueemsy610vhp3Pzwze6OQWz1XdKRzd3H1tvLbbMrxkF4DwZJt7tnpoieyRW1LwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VsxokRwRk6IFeqdM2G8OVgIpJfgzhXYhcx1m6t7JxXU=;
 b=hRv+o2iB3ts4eeUUw7Eujg5jTu3qRqL/O2p7jQPPLlFul8LTiQKXFyuBaG+tQlHbjEP3AK/rPoVhAnMbPhI+NQOOUZEAKyhb9PRu7RcR61dcFf0y/fooWqqcvDO18ttuGHUPq50z33xgxqq5kurCm2/8hC7Lkly9MI+hxFVUCbFzVYj1UrWvAv06j/SbZ40tm7b9WkGQzocFm0KkncMZ5wKjQoVg+71b7hRi8QZBfa1T3TZf03g0aZP3NppXEuQltDqPNz4XgfyA2kn/DUhRsge6XibOAKrYABJ1fnbTrYguCWHe3FlesOISNmJKpvWPmzW3XdPZYyBtP+ow6KalRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VsxokRwRk6IFeqdM2G8OVgIpJfgzhXYhcx1m6t7JxXU=;
 b=U7XvhegJ8GMO1QT2UKrJfS6i+eB4NSGwMoO1BHUvguONKcFeHs5Ic6KoNjfUsuRMKE7bBXd14KAY9t4hegeo293e1kXWcd4fM1z0s76I011xLKh9xSYtwHLmfHCKnfvp1TX5vmph7ERjJU/KrmTUAo3GCirbF7dKIh3+c0fVLpCymY+Xbb2hyF6XDZQpYz3uLgfIgnL4zGxXnGehrcuhVBl4jtNGczkwBBGeh/rohmSTwBnGeCBxU4qMrfRPZ50juVSMJ+h0zO528STOXQ23+LDtxsedJa5DKb/p5ufmp+paDBESCyIyPcjWXky4EP6ZzhuQmJaQfj/wYncdPocpew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <29e2b527-16b8-e72d-f625-781aedf21bc4@suse.com>
Date: Tue, 14 Feb 2023 17:11:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: [PATCH v4 3/4] x86: limit issuing of IBPB during context switch
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
In-Reply-To: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6884:EE_
X-MS-Office365-Filtering-Correlation-Id: 441e74e2-b448-4ad6-f2ec-08db0ea62913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VqAyzyPwo07sJJyQli/aw7moJ+ZLsPQLdQDyk2II2UTRLq2wWLjs9Opf0No9cV+zhn+ftsKi7Tk+0BcqcD2HzlJbhdzMKYjqxfU59//ukDn77VLChp9o3qVErKd2fZ9W9RZe27UHo0g9NWB0lm2BYDAHnrA5iyuCp0eqB4gpE4Sy2bn0Z4O25gEi6oRbbnyuRP3eioy8gsXVbeBuh9yghg3ZyoRmcTZQhfmovuLjvWT53RogQHaaH1nlCHwGwEQmU0Cge7V2zCj0DpsyjaPcCFuWhOHWQo/22KFkngSmcRGoYEG6O6aAF8EmubcyKHDXCyE4yeGYvaWx+2bry+1chNzxY9MMuMNoRmdBTmV3TH9VvH92FWrW9VKB75spZj6yqamGZ5afO78hfa0TNpfaldY46wS+JSkbVE242Vt7M2qaxTXhDUTGpqlcWCSI0hGTOsO1SN8uUVsRNmRPdZ7HMHq151JMHlRPF3BBGDArUlIRBIAaVRlIEaNT3VERooHYSdEzSir15qNqsoSuMZw+F4Dwogs9qL6t469M4h4d8KAkqGEm69e52GGUXRVdgcH8SHBESyKcTzguaTyM+9MyiYOE3vcrUS5dcip9+HOoRjCNixjRp6LdvG/JZJSgq+P5GtuaKkQhMKxIrWz3mqdVEbatcoM/WCnUR4qXMdK1CG/wj+p0q7lWLNhoAuFyX/7zlSQxwYaGR73m2atO1ccT8kTXS1LbpMa6bmpQf0VhFH0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(39860400002)(396003)(346002)(136003)(451199018)(66476007)(66556008)(66946007)(6916009)(83380400001)(4326008)(31686004)(8676002)(41300700001)(316002)(8936002)(54906003)(36756003)(2906002)(5660300002)(26005)(31696002)(186003)(6486002)(478600001)(86362001)(6506007)(38100700002)(6512007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUsxQnFPRjMwL0lSdjUrQnl2SnR1Ym92djhPMmpVVWdNOEJVZVBzdFd0N3lQ?=
 =?utf-8?B?QS8vb3ZJd1ovK1RqNlZMSENobXJxN0U5ai9uNjZ2ejRUVUwwRmY1UUhJSm0w?=
 =?utf-8?B?c0lKeC9YaDAwWGo4WmU5dDY0Q0FtVGIzNDA0TTZlT0hxY1NVLzlvZ2hFK2tU?=
 =?utf-8?B?cFVXM2tnMGpIZkcvR3A1K3NDcGlyTGYxbjFhM1djam5TYkhQKzU2QWREZ29F?=
 =?utf-8?B?RSsyYWJaZlVtRld2RnlNUFBzZGZDSDNpK1hnSnpEdU1pZWtwODdQZTVmeEds?=
 =?utf-8?B?QmRpUTRHWVVtU0FzTzF0cG1vTW8wWEhySnZIaG5sWmhvd3ZTY0ErTWlLWGky?=
 =?utf-8?B?NTlKeWFEeGQ4Qkt1L2ViYUVaRUY3NVRDVWRHSVIvNllGZWt5TU5STW5pQ1dx?=
 =?utf-8?B?MEpPRWt1NVRUYnpZdm5tVThIMStHaWRwRWFjQXd5S3B2RUxJTFFXVUgybllD?=
 =?utf-8?B?VzhqTjY2Z21TWXcwczdkbjl6d0hsMXRNU0MzQmNlZk5GcXBrdnFPbUJZMHVY?=
 =?utf-8?B?RVd6Q1hxeGpBMjdzbHQ3bU9oZ1ZLbkF3SVNVSDBVNk5TTUVtcVVQRTBadno1?=
 =?utf-8?B?T0dSNGk0dDRBRVY4d3VhVXphZEg1YnprWnpMMkhFemdoVU8zOXdOZnlMbGVX?=
 =?utf-8?B?SWx6V01uSDM1Z3FDU3hLNHdmY1llVCtjTTM4endXUkpaaW9ja1NjMjBBMW1M?=
 =?utf-8?B?T25WQ1ZFRGczYUg5NjRRdFpVRXlpUHcxR2x1cTdXbDM1SVhvTlVmRUlMQUNL?=
 =?utf-8?B?Wk5qMlVuQXhqYzFCbXJPaDNvSHE1c2prNCt0VDgvWEkzNDFXb3JRUUZLNjEv?=
 =?utf-8?B?RHZGK0VuV0I5NTBKQ01URzhkbmpQMmd5Nm1BblpiQkVnSEVOZmhJRENpM0RI?=
 =?utf-8?B?K21HU2RzRmtUQmtTTDh1UW5raWg1YTYzaFFxeWpQeEJnT2pKM0tmMEhJOEUr?=
 =?utf-8?B?eXVZUVdsc3ZFRDViQmRTZ3o2T2svSkZtcUhNOGR2QjhzaVRVQUpzNkNRYkhW?=
 =?utf-8?B?QkY1SVhwVURxSzBoMWJSYkZ4MXBzSEVEZXZ4cW1RNHZmOTlJclJYVjg5T3d0?=
 =?utf-8?B?UzBXWnZPVjlHbmhkazd4c1R0SU9QVjlGcWlUbkc5NTIwRWZZd241ZjhkUHpv?=
 =?utf-8?B?c01ua21sRTU1clZwa0FMcFZzc2RMdEdSMXJocU1YUnVpbXJHN0IyNzlQeTJE?=
 =?utf-8?B?WTNRYk9GYmZ6WWptTURlYlZzNDc4bTJnbDRuZFNOVU1LdjMzaGovbGtyTWl0?=
 =?utf-8?B?Zm1Wd3lQK3o5VmliSDNERmZCMzlqQ0lTWmFGc2xzTDREK1NMRm4xRjRzYVVF?=
 =?utf-8?B?MWZWQWEyek5FclRBVUJyS2hMKzRISnlVa1JxK2dkOVk3NGVnYXd3RWtURUIx?=
 =?utf-8?B?TDNlNzlSQmJEYWNucW1aaWltV2R0amtITEtRRitvSTNiOFlQUEVZYmJTV1FV?=
 =?utf-8?B?Y05jU3NHWjZ3cVVjVWFuQjF5S21qWTA1bVdmeU9xSWM0eVJnb0dxU1ZZbmJU?=
 =?utf-8?B?Q2pNNU9iWXJSRngvSk8zaXM4L1lpRFV5YTVGVFV2aGxwM09Zdk82dUdsV1dt?=
 =?utf-8?B?RnY1N0hOc1FBeUcrUkoyVmJmM2Z6SlVzNTMyaUFKUGFVc1BBVnJUQnR3Ty90?=
 =?utf-8?B?dXJtS09ocXI1U2VFUjJMNVF4djM4S2FOdFF1V2s4MzloajlnS3RyOFN5Smc1?=
 =?utf-8?B?VzY3NUxXQjA0cDNoVW1QMlhBTmF5cFVoRWhINDJaRlk1ZDBKZkxuZC95RGxB?=
 =?utf-8?B?UzJtS3NDRUJXSW1VNmJRVWVZUEdCclcvK2pZMDk4QjVZa3JxcEpXaWg2Qkla?=
 =?utf-8?B?NmlOZll2LytQaVk1N2IyS3N4QkFYbFNxTWtZblVPSHB4L3lJc2VJdzZGNjE1?=
 =?utf-8?B?eUVPUTVZeGJ4dFhpakJTZWM3QXBDU21ZYkJCeXg3SmFWMGhYbWZMZEk5WWhI?=
 =?utf-8?B?eEZsR3pJbFlxR3JGY1VOanlUMnZLbnNZVFV2TzNUblZjL1YydGNoMzVqYWVi?=
 =?utf-8?B?enZkdThMQWQybG4yNVRxd0RpZlEvZnBzSUR6QldCalAvVWxMa2lOcy8zMERX?=
 =?utf-8?B?UVZLcGplWkFzMTIyTzhxclJ1akFaeHlPTzJJMC9BYTJqWmZ3MFpIR2RvdWxw?=
 =?utf-8?Q?3Nr04aSiZVmOa0FFlXn8p/7P/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 441e74e2-b448-4ad6-f2ec-08db0ea62913
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 16:11:42.1465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Alwjud9TwSgKoWatYLAs8MvH7BA1JUpP2babXVA/uSwGYMzvwgRUKF0Nr2dRxt7ZgBPlyW6vseW8J4KT1dI8Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6884

When the outgoing vCPU had IBPB issued and RSB overwritten upon entering
Xen, then there's no need for a 2nd barrier during context switch.

Note that SCF_entry_ibpb is always clear for the idle domain, so no
explicit idle domain check is needed to augment the feature check
(which is simply inapplicable to "idle").

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: Tighten the condition.
v3: Fold into series.
---
I think in principle we could limit the impact from finding the idle
domain as "prevd", by having __context_switch() tell us what kind
domain's vCPU was switched out (it could still be "idle", but in fewer
cases).

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2005,17 +2005,26 @@ void context_switch(struct vcpu *prev, s
     }
     else
     {
+        unsigned int feat_sc_rsb = X86_FEATURE_SC_RSB_HVM;
+
         __context_switch();
 
         /* Re-enable interrupts before restoring state which may fault. */
         local_irq_enable();
 
         if ( is_pv_domain(nextd) )
+        {
             load_segments(next);
 
+            feat_sc_rsb = X86_FEATURE_SC_RSB_PV;
+        }
+
         ctxt_switch_levelling(next);
 
-        if ( opt_ibpb_ctxt_switch && !is_idle_domain(nextd) )
+        if ( opt_ibpb_ctxt_switch && !is_idle_domain(nextd) &&
+             (!(prevd->arch.spec_ctrl_flags & SCF_entry_ibpb) ||
+              /* is_idle_domain(prevd) || */
+              !boot_cpu_has(feat_sc_rsb)) )
         {
             static DEFINE_PER_CPU(unsigned int, last);
             unsigned int *last_id = &this_cpu(last);


