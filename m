Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B4678448A
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 16:40:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588526.920045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYSYh-0005a8-1x; Tue, 22 Aug 2023 14:40:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588526.920045; Tue, 22 Aug 2023 14:40:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYSYg-0005Wn-VD; Tue, 22 Aug 2023 14:40:38 +0000
Received: by outflank-mailman (input) for mailman id 588526;
 Tue, 22 Aug 2023 14:40:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MJFy=EH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYSYf-0005WZ-Ci
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 14:40:37 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062d.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da12cfd7-40f9-11ee-8782-cb3800f73035;
 Tue, 22 Aug 2023 16:40:34 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by DUZPR04MB9966.eurprd04.prod.outlook.com (2603:10a6:10:4d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 14:40:32 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6678.031; Tue, 22 Aug 2023
 14:40:32 +0000
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
X-Inumbo-ID: da12cfd7-40f9-11ee-8782-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMvSrXM+S9YMyW2OZvdWQkD77fHAY3iNm9YLULDCnW53253mT8Z7EEriOcVMjkVxzarNVH6KB3dpV18W8h9ZsqN2N+O1fFOuWVjy/7gDr2XU5A6RLnmZbX95Dj/k64qjXPoIInb9aI1MW3GCvFa6BwGzwizN5AJddc/4/laFTLF4UPtzHtDWq+5L+DAFhcSdxexQz9PvVZzms/XvVUPrvFgG4vXp9keQLzjg2xHNaDtNUVDzB/YwdyW1diTuqDdbeZ5Dtm+4GtSYygKBQFF4jA0ryjiPnw4ekqrtbAQNU5EggeLWoCucMFw1Y07+7YJOfTQvv95gVoavS2ZuVnrfdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOnmBsZVUhOyXn7ANGfKQMiD6by24qbj7+r6DfGxaXg=;
 b=jCGoSpZWop5nbIWybSxBBG7bn4mX3k9g7skl4+LhVuwcIks/tS30LMb+mwL3fE/1g+2QlcrX5yRh1P+U6k+Zs4cqvjKP+BNBdwscGNaNMqsocUhmNVQm8Ql8T1ghVqC6AuA5wXYkeYyPEzDrtKiM6O1NjO/v1wZLFsBR97TpSWJ1MhHhSpKxB1jwzyakkCiwdPsFYHHk9RPbl8QaY2KO3UXC+EbTKwmPEGKhwE8wEmnRB/CNfqNw8I7VR9zO9oQucYSbTB6iN2DrSY/iZxZc5qeFUBNecCm/IGF7LH9UJMzeVC2GzjfWMKkKOOdHDKXONG+JsZGw4t1mcmdhzH5QCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOnmBsZVUhOyXn7ANGfKQMiD6by24qbj7+r6DfGxaXg=;
 b=COMJOP2MpsBy6hd5fLuRXVTHJ7LlYL9sh7m4p4BNw/uX4TIM2lEiB7XZFRdRRgs+/HEdpTC/SdIcJ3iQk3n6rD8nSku6f+Gvrfqcel+29qsuQZwo8fgulswiVfzBGvrLRJH8sICeszOsCuuIMcHD0CXAVNhLccZetEijZM66fLpUkSzrviCuB1Mfnmu8ZXIj6p9SjgLxgll+zfG7E5VkgqGVL3r7hcWggwC+AiBpn2LHe1ue774sXBnAvWMLTD2ketDVFHRon5liWp6+ZgyjGODKOKypMZMi13GnSpl12qvDE6/vNFP/Cz5arg+utXaQDwjU+1DfhSWH13pnaWTNaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3a5913ad-c273-0ee6-11c8-9d18e9a4a84b@suse.com>
Date: Tue, 22 Aug 2023 16:40:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] build: restrict gcc11 workaround to versions earlier than
 11.3.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::23) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|DUZPR04MB9966:EE_
X-MS-Office365-Filtering-Correlation-Id: 96f948cf-1a2e-4712-2960-08dba31dbd02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BSyYaM9aCjLJaNMBeaeYCfQd7jxWUmopkWSXducY/SCE0oKPDZWlV6M4KNYA31G/qpeLL/gK/vpCkd057/2GfE5SyJRBrXuewcUNdJc9lHwGii0hxri87XNiHcIXnv7PT/gWOIQp92mkYh4tLdeyr9xkKK0XgQhToosR3WFoLZw+7T2Nm7UbVB+GGuYZe6kW95EPbN414oFSi9nBjaJW3r2S1rQ1jFSPCnBTRmihGQqEUKtwQisND+bjlue0Z0n0Scc+HDvQd0bAOhmDaGhZ0Q+uKSyDCea+ThKIT0vVE5k/u6QrKxXfkKra0tmamTL44A9yXCqXgaJ0MGjFBs54P4l1QzBKqNLXVt3uOf8aCrrPWCkmkdA+4VwmYgEIrUFcqDyrzoJyRY0LBEJxhQwKADWLTiO33R1vyD8ygOHLkQBuqzoiVk4tHuLPwm7myprAT/kamhViYi0lGdyYwsqk1PuUPmLqrwlNeKQ8ymtni6537nINgfX1Dg9EQfS7d5kT2nyVhx+/qcER/vT0dAGCYJTWVJ8Et+7ORSQjmYAbemsdJW9Y9VP8m6Syw7KlYUpQpdy4eNm300sk5WPVSR7aqxC7Wx+LVoY6Z8XdGS1ZyIv7BQ/XCmd2H3TD5OZbbM6ihdAdT0KgReBAyC3SrWDbsQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(346002)(376002)(366004)(186009)(1800799009)(451199024)(54906003)(6916009)(66946007)(66556008)(6512007)(316002)(66476007)(8936002)(8676002)(4326008)(2616005)(36756003)(41300700001)(478600001)(6666004)(38100700002)(6506007)(6486002)(4744005)(2906002)(86362001)(31696002)(31686004)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amtMWFV4cVk0cHFjRk1INTRXQXNjSFFDbHZxWVRIK0xKd3A0YTV3ZDZaQ3I0?=
 =?utf-8?B?Vjlaa2wwUWQwTFRaUHZLdjhnc1U1TEl4SnZyS1VwMnh1aGpHMXZieWhHVFMy?=
 =?utf-8?B?emJDMVlVTWdoNVRaRmx6WC9OQU9RL3FFcFZJR3VGNU9ubTFzbXE1VVpQZDl4?=
 =?utf-8?B?Vk9icmJIeW5OKzFOMXFiMVpRckRxWDN0dXRQc2t3azlYN2M5bnMyZG9DWGpZ?=
 =?utf-8?B?U0ZUbzZPTDRxNGpKTDNaVkN5NjdiOU4zei9vOVRhVGorZ3VWQzQwTTd1VFJZ?=
 =?utf-8?B?ZnRLTzdHaGxnejVzb0VJUkdVZ0gzMUdWaU9oZWFYSFVFUnVyYnJtWVJ1ZkxN?=
 =?utf-8?B?QWNsczhtVG1jMVh2dG1sdFdpcnBFNWc1MzFkYXYyYnUvNkNKOUtSbUdiOGs0?=
 =?utf-8?B?TldCWjZHc0txeFUrUGtCU0o0SUlkV0FkNmpnaXhNT0pTWFRMa3ZCOTN0c1dO?=
 =?utf-8?B?ZmJrWmw3YkJ5TzdWVmZuS3hoTXNTSnVPa091Uk1vZnpBbjNEeGFpWEtpNmNk?=
 =?utf-8?B?Und1MlgvbDd1U3FMWmZEeS9qMFRVMFdKMFJRQSs5Q3Y3RncxSTNCTk9kb2hk?=
 =?utf-8?B?TDBzV0t2Z2ZlR2lWeG5TenZJdjZpdkJDMDFRQU5leWtkd0dqRFQvaTBBYzcz?=
 =?utf-8?B?d1hYSFZQQ1psYkFTOFNYR1MzNkhPMVZ5YTFwa29BYnJqSnMxRGhUeEVOSlI4?=
 =?utf-8?B?T1MzSzhCRnpQa1oreU1JRkJEaW0ydGJxU1puZTZOek1CVlh5M2t6S2ZwK21k?=
 =?utf-8?B?b1hrS3Nuci91UEFsbTd6Rk1vNFVuWHJJb3c4NVIxN3F2NkdKQzUwZUF4WnVh?=
 =?utf-8?B?cHVUMzZUbVFpU2c5RUlSZlRuWWg0T0NWNndEc2NRTzBHM2MxMndjSGRlWE1M?=
 =?utf-8?B?SStSN1lIMnZLdmFKcit5QnRpN00vK3FnZFhIZE1xTWU3LzFRc1JFOXQvRDZY?=
 =?utf-8?B?K2s0NENZRDBOcG1XQnJxV2E1OHE1R1pNVHRXaHZmRFNRcUNNdTI0TXZ4eDgz?=
 =?utf-8?B?bzV3SjZMZVpDWU9HQ1RiUUhFcE9HTzg5eWFVNVJzMHh2QTNSSGMyQkdxMHFD?=
 =?utf-8?B?aVJRRnllVlFvQU0rZkpFdU5lQTBxdXA2UVVmTE9uUXNTZDVUWDRTVFBVZkto?=
 =?utf-8?B?b1l6UHI0MHh3aktIcEl4bkVMdUszakJYd0dFekhjU0Q5ZVNQZWhvMUVOZWhr?=
 =?utf-8?B?dGNteDBJcHBkNERpTEN0VERSRFlVejdHenk2U2lxK0FaR28yVnl6b2h6NjJi?=
 =?utf-8?B?YXhlSUhpdXB4MnQwYmdhT0dtbGMwWDQwcjltVHJNNUFuNGxKUjgyTHNOcXNt?=
 =?utf-8?B?cDJRWDVmbk9MWmFjM2J2dUdwdHNhTk9BSHNuWGtaUDg5a1R3SE84K3YzcEJT?=
 =?utf-8?B?dkw0K3dKS2QxQ2xLOWRzRmtFYjZUK1JEb1QxU29WWlhMdzVjYWhvQkpiQkJR?=
 =?utf-8?B?YkRLVzllVHlOMG41SXFLZHlKcnJuR3BrNUtMYW1TbmF1clJ3T21ZcWcwc0p4?=
 =?utf-8?B?SzhwTmZhSy9BeFhZS3MrakdoMXVCL2RGcVlPL3czcndvb0xxNS8zSVNhc2tM?=
 =?utf-8?B?ZWl6MkcvNEJqM2pUdkJ2c3hpb01weFFrcVBGTCtwMWdVTXViOUpaTUV3MDc5?=
 =?utf-8?B?Z1BJTmZvNnp3SnQrK1VTVUwrbGo5WllzTnhBejNmQVBPQ25YQnlSN3U3dnRB?=
 =?utf-8?B?OFhkTHFwUFBlNmtndHQ5dlNVbHZ2SHk4YUUrZVd1amhmZkxPY3phemRiT1Za?=
 =?utf-8?B?RnVFUGQyQnIzM3pwY3ZOUW9qZENyMkFVbDBPK2RPWU1Lb3ZRS1NSVFFmWmwx?=
 =?utf-8?B?SC9ibEQrRjV2R1c5STA0Y3lEQUtaNFVSOSs4RnJnOFNJczl5QTRZcVpuZ0oz?=
 =?utf-8?B?VEdqR1VZcnN5MGtlRExWS3VzelR6d2ZCaUpPbmsxc1FLeTVobHlzVCtqZnVu?=
 =?utf-8?B?bmN1OEt2UUZCQXgwbnV6VGFzTHRaWW1HLzYrMng3WWdUclArYmpzMFZaTWNq?=
 =?utf-8?B?eHRERnZ1Ym42Z045ckxJRjFqS2hkNno5SGVOYXY2cUZaL0xxQ01xaUJKeW9p?=
 =?utf-8?B?WGJmaGlacmpZUUhUSWhkZjNQUVhkWi9IdFpidzFLWG1aT0hLcEFVaHpiNTZt?=
 =?utf-8?Q?pIDzkSz+CRYAPx66e7oRsvQtE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f948cf-1a2e-4712-2960-08dba31dbd02
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 14:40:32.4849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Do7fiqZj1CGj/tsSb3zfjbeyFzt6cuBOTNr96P8icemFMwx4CzGWQlxJJgS2+uMkC6UgUC7Dund9ldWAtQ0Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9966

The fix for this issue was backported to 11.3, so let's not unduly
engage the workaround.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -146,7 +146,8 @@
     __asm__ ("" : "=r"(__ptr) : "0"(ptr));      \
     (typeof(ptr)) (__ptr + (off)); })
 
-#if CONFIG_GCC_VERSION >= 110000 /* See gcc bug 100680. */
+/* See gcc bug 100680. */
+#if CONFIG_GCC_VERSION >= 110000 && CONFIG_GCC_VERSION < 110300
 # define gcc11_wrap(x) RELOC_HIDE(x, 0)
 #else
 # define gcc11_wrap(x) (x)

