Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C836C4696
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 10:36:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513259.794025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peutW-0004jB-Go; Wed, 22 Mar 2023 09:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513259.794025; Wed, 22 Mar 2023 09:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peutW-0004gk-DL; Wed, 22 Mar 2023 09:36:34 +0000
Received: by outflank-mailman (input) for mailman id 513259;
 Wed, 22 Mar 2023 09:36:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peutU-0004gG-J0
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 09:36:32 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 072af97f-c895-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 10:36:31 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7641.eurprd04.prod.outlook.com (2603:10a6:10:1f7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:36:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:36:30 +0000
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
X-Inumbo-ID: 072af97f-c895-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqWKzpJs2zGFEQpjTbCLJhH45ge/vnrvMXDsrMze0I7fT/E3u+fNB6iT6L+WAoHfjNmxZDZl5Pg5Z/Cqzk4H7k+KQr+yExP8OX8EiLelo4pYgoJ752gsjESCAhj93Ghr/sVcy2AQxnaAiDo3vcDjyeG2CiDvOOGJi65o5OMNEbD7Q3EqcobBSgphZQaE3sz79WUj4KADh+2ccAZDMNwpm5dPvWZKRfgE49Hu9nNXKJDUHyKPl4Uin7F0sjI6SD2rxGLiaya/jv4YnUEDQGJzDOjgJGRn00IakOoPsuMgEJUC/ZXlbxCrFvIKymPVfUhMEI+KYw0t8lOp17WzhdN2tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49lynVsPvUKe3NRmbj2l3SPJzRr48ByaR2NLWqRe4tA=;
 b=AeoLxzGN8qDvBh7cHyW6B76s/aSaTnXXEFIurjH3hhZ6vVRBUe6Ft+s48Nc624LwfBCqjQBuQ561fsY7i/Tt0jBiNx7UMclCcYwRNC51aD67dETf7lEsLO6C/r7zsU2b1vSSFVrR+BDpQZvFETkE5x29X+nDmOqllKt2ZI09Ra4jJwadAHwQhmStiypGBfKsC/2LIx/Qp6UzRw4ZrHKwdko/Jletuufb5060ujZ3LEG90xLNZ2MpPMfxa7DOds7EfSwidB72McQX8nnpR+AltmrcRTFsoPn3TEVUYc6ytMwFoRMb9nkid7uSGzHfS3zM24rTBZOo3jWLHhwZ/s5TvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49lynVsPvUKe3NRmbj2l3SPJzRr48ByaR2NLWqRe4tA=;
 b=TfXGYLDl13YODTXJLVz+2nmV+L9Brlu/NcXNI9Gj3LYvIFmDjm3YFgeBaHeYWf2gNnYG1So/FCeFBB8hhQYkXeERmC6bzGMgy1QEx0V8Stlcx9dUFyZH+2raUCagan63H3pMkcZsfC6p5GenLGamqXsc7i/wT+8DcZGwCOqUWDeG4mX50H4+THVUBh4Ngh7Vf4OJHWHp6hvLtRKgfBR3cIE7jR12mnDGVrVutsz2keAIFPpMqqaZR6d1Q8RaGt4AEFK2yeeSoucDS00uF6cG49LAir6kIqFXx0IIltSswcmGZ16Z7efKH8MbgZRXBLcKFCsQgHebLb5PT61bLVLabw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c9905eb6-85ed-e793-e546-472503fe3bff@suse.com>
Date: Wed, 22 Mar 2023 10:36:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH 13/16] x86/shadow: vCPU-s never have "no mode"
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
In-Reply-To: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: b2925894-c725-4e64-1af8-08db2ab8eab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sXm1oaLUvtSMJk8fztQYtCCauwUJ79bgL+IVJvzv598YKWewselL2zX+2PhTKeVVk5xH+RwYeSM/xR748uX2w2nTId/5+CaUfpGBQ11L9wYAqdPSFAXK0N3xOSV7VZKHoyHRMq4oyCnx97tPGwn+cD+DlHocl5N/UU1dhMw5nzjWz/UGeD6dFxDGlncFuqq7VcCHJUdqXRsKN1OCPOyrgbYxxUZ2oOCpZDQVNI2C9GI4tYnshhpQJTyrHZyXAid5kvj4lD0/jw6ygBfElYsLImHB/tm+h2xRcMZShtFNY1RmU9frzfHlgGfa/ARvMlGmzoDmQDnAACijTD9kHwGipXjaC7+BfhWUckW3yYjrzGgw6UdlpdnODUABjwBta1te2T9DzwivZ329g3wU2Gfa2lw59Adxikyl+l/C3EBdGNkmSGIy4AwiHf1vkGuGTOwcdqy7Kz9pAY0l8uvgjtStoETvm77ngyKKDJHXFsoyPUSZr1xsJO3jv85uwIgmwpDjfpqkk5k4RpxU5bnFbBq5mQbwFzO53x28YIUZmxxIpbJIzW7NuGHLwHxusnmS++MadzoIZFAp55wt92H+hfs3qdNpK46nQO5wfMxctfAXINXdlytzQU7CMWCe5zC/xdp5fT9Lf0AonE0uv/EalBNsEfZ3/J25R38Ik/tnn6s7Htyu7VxGxSD7umFDRRJPXJKio+LEH+BB2VMs4C9vZPcEUqJY+9Df3tQ57J9rpDSrQsM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(376002)(39860400002)(136003)(366004)(451199018)(86362001)(31696002)(36756003)(38100700002)(83380400001)(8676002)(4326008)(316002)(478600001)(54906003)(66946007)(66476007)(6916009)(2616005)(6512007)(6506007)(66556008)(6486002)(31686004)(26005)(186003)(66899018)(5660300002)(8936002)(41300700001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVpPUkdpOVRiZlVpSm5Xd0YrTk1CVlVKalFOVHYvN3BGK1pNWkV3Y211V0pp?=
 =?utf-8?B?YU9yS3JUSlhHSWVKNUdud0l4Z3J6bVk4TVR4UWU1VzZvMklwNmhyMzEzZ0pD?=
 =?utf-8?B?Qys0b0JnajB3MG5JOVVhbGxIWjAzdVdLVEwvNDZjUkNJbXRibndraEI4N2pt?=
 =?utf-8?B?em4xU0FFbW0wTTNqWFArOVdpOFdzeTRxRDlxeUFDRzRraGNENk0xZVA3ak9Z?=
 =?utf-8?B?Ynl2RHA3NU03SG9MaHhxL1YxdDViWWlGaW9zamN2ZGhRUzVYS1JBOFUzOTBU?=
 =?utf-8?B?bVYyZklBU0tWU2ViNUFldWZtKzFOMmlnVXhjUSt4OWs5c0pLSS96UFo5Z2x5?=
 =?utf-8?B?Mkk1Y0ZlL2M2Ni9hNDJmMHRBV0dkNDlKcnlOeEplcXQ4M1FxaHpVNmJuSFZQ?=
 =?utf-8?B?SlloYmVVWllROE5yalN2UkxyRlEvUjVYQXcyTEpJd1VmWmtia2JTSUVRL1Bt?=
 =?utf-8?B?N2FvTjNmam45UkwzdXk2b3RYdlVGcUxIQXBydUphcDMrZTE1OUFMb1lFaTQw?=
 =?utf-8?B?NCtPWFppK1dMTVJzMEZ2cER5WnlJNE9tbjZ4RzhOMFFLSnFMVFVsaXJ6T3lB?=
 =?utf-8?B?Nk9qRGs2RkJwcm5pWUxwU3RRQWRXT3FISGlkbGlMdzRTVXRaeVpaL2ZMejJR?=
 =?utf-8?B?TmdLYVg5bkZ2c0xVSVJjWWpjSUlNek00RUJuRVFLZ3hEVU9MMVAybkVKRnlB?=
 =?utf-8?B?eXgxZjlOdktrd2xHSitIeGVnRXgxNnJNaCs3bHNJeCtzSWJ5bVhvbmxaR21y?=
 =?utf-8?B?elFicjArMkl1ZHgzeFlER2tFS1QrOURSSWUrd2VvWGxjejhUcXc4T1lXelRi?=
 =?utf-8?B?bG1MQ3U4MHV6cnVacHVMY295UU1Wc1ZuRzVLa1dBdnpKeUFBZi9LVW1TUmtT?=
 =?utf-8?B?Q1Q3SlV6M1JuSWVyUS9nK3RMY0t5YVhDZlhLVlhPQ0JBZzJtelhZTnJZZ0Rt?=
 =?utf-8?B?Q0NYVFAyN2RiQWVBajdyb0hYck1EazhxNU90QnlTZzF5dGxqUTFKRWlzUzli?=
 =?utf-8?B?cmx2NXpGQlQxejI3M2x4QjNEdHkvUnZRM3RmUEJ2NldZSExkNkw5NCtmb1V6?=
 =?utf-8?B?cmdTc2tDWTN1WXQ1UWxMdjVYSXMwNUxmdWpsZ3p6UDg0SVA4S3hJakNoMm94?=
 =?utf-8?B?UnFhaExYTXpWaGhESXpsOWtoVXExdUUxeVpoRXJZQXBSQUZVNU9aQW9iZ0Fh?=
 =?utf-8?B?bDNEYTRlRTl3SnRtalpueTVXUlluUEljcjFXdnN0MVVMNWdkYXFPb2IrVTZI?=
 =?utf-8?B?cHcrcnp5MXVDRloyOUh2aG9OVmJQTnRBKzdUSiswMFVaYm1Qa210VWVhSTQ0?=
 =?utf-8?B?ZEYwV0RoQmM5bjdMVFU1TStoUSswdmNMTVFZZ0lkck1EZmxwYk41NXRWTnZw?=
 =?utf-8?B?T09hbjdYTllsbWRtVGk2My9tMk9jTHZRY25EUDlJUFVsRWJRL08vSUVXUmJa?=
 =?utf-8?B?cDFFWkxrL1k0ZEJ0UytaMXR3QnhOTHkwdEsxU1o5Y2Nrd2NSZXlzMVJEOUVi?=
 =?utf-8?B?N1M0YVlYcndRMWtoUWU2TXJGb25IeHdjbnJubFJOQkFrREQrR0FuVWRRUXB1?=
 =?utf-8?B?KzJTTWcwV1pnK0M1NlFCbEVma3BoK0NMYU9yVzdDeEhMNUxJZVlScWVpVzJw?=
 =?utf-8?B?Q2tmMWVXY0E5UnliYmJjaGQ1U2JmWHFQcTFNb1VBYWVYUWp6QXZHekRNejRw?=
 =?utf-8?B?UFAwTFFsZHZxR1ZjMGhxTmxUSDkyb1Y0cXEyeDZMcEU2VFR4WXNPdk9zOTlY?=
 =?utf-8?B?RWJDc1lWbm9mTWFCRmFQZ0E2MFZ3QzRaTElVL2xxSzdZVUN5NzY2akVlYmpH?=
 =?utf-8?B?Y0R1TG9DdElJcmVtQnp1ekFmc2xUK1RaUDRCK2tuS2g1My9lV0hqS0V3dGdP?=
 =?utf-8?B?Um5zOGU1LzBRZ24wL00veDlwN0lENStFSFZwSzFlTFp4VE5aYVEveE5OTkpP?=
 =?utf-8?B?d3A0cVQ1TjBVUUhXRFZVck1VR3pKVmNSVStmZkJWU1RsRERSaGs4WnlFaytK?=
 =?utf-8?B?cEpNbEIvR1dnL3N3MXFhSlNFZHVqeTgrTlFZRWNuYzVGcjdpWElScjByUEVq?=
 =?utf-8?B?K2Jaa0N1UHgxNjVicXNCaG4zNXliK0lFU0ZZVFZVZkU5cklPWW9GVUpNeGtI?=
 =?utf-8?Q?dnzZeZWc+ekWqhLe1VrY+2nSs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2925894-c725-4e64-1af8-08db2ab8eab1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 09:36:30.3818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Grlt6sdbNUmP+0Da2NqybuVVG/RpnFcroPtY7tW2Z12GgMCpjRlCwuuQt54Vr36YjdyR/QygXlgap3xHzko7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7641

With an initial mode installed by shadow_vcpu_init(), there's no need
for sh_update_paging_modes() to deal with the "mode is still unset"
case. Leave an assertion, though.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1864,6 +1864,8 @@ static void sh_update_paging_modes(struc
             make_cr3(v, mmfn);
             hvm_update_host_cr3(v);
         }
+        else if ( !old_mode )
+            ASSERT_UNREACHABLE();
         else if ( v->arch.paging.mode != old_mode )
         {
             SHADOW_PRINTK("new paging mode: %pv pe=%d gl=%u "
@@ -1872,11 +1874,10 @@ static void sh_update_paging_modes(struc
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


