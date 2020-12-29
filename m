Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7802D2E7275
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 17:58:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.60002.105214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuIKB-0001E1-GQ; Tue, 29 Dec 2020 16:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60002.105214; Tue, 29 Dec 2020 16:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuIKB-0001Dc-Cx; Tue, 29 Dec 2020 16:58:19 +0000
Received: by outflank-mailman (input) for mailman id 60002;
 Tue, 29 Dec 2020 16:58:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dLv=GB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuIK9-0001DX-WA
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 16:58:18 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ede19ca-830c-474f-af7a-93466bef7b9c;
 Tue, 29 Dec 2020 16:58:15 +0000 (UTC)
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
X-Inumbo-ID: 2ede19ca-830c-474f-af7a-93466bef7b9c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609261095;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=2zmcgJjKaTdi/cAbh11PIRkDu33l8MCD0dWuhhlpJjI=;
  b=KRwsdckbW0BcwNBdqZ1H+PYtL6HjuACpsUgflsk/P5oBeBZ/mM8lu8by
   z1u7GZK87YfUjwOaIjAafMd/c9qf6AMAeN7RlYYNDzm6YESDc7eTYJMvd
   oepNhGe8laXhtxJOa77/lxEAPXB6Sv+UbPFoyyDRQi1ySyGblTfIjbWJS
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: pjF/J1HX8geaT0OYApzypR0LOHMqbx5fDFZtL+soTjYka3BZ8S6n85jGbScbzjxxjs/JBdcZAy
 +hddgi4MMsXbOZBVpna+gOeDomdUS38t0UUc5GDzUVLHG990dzeW7qR6PAWepRA8IBRWG29d6+
 KbvLOOXw7V2Iecw2/rBibjoKj6SwqCoDesItjrHzKD25EpAUj55n7eZdlkiSrwIiiC+WjINOkS
 ZEI9f1ZXJeq/wI/Q4cFTQVV0EZKwaYFGaZD43lL1a6Iyj8RvAvJ+p5dHICI15Kjq8bB1E53+kq
 vI0=
X-SBRS: 5.2
X-MesageID: 34102674
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,458,1599537600"; 
   d="scan'208";a="34102674"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSWwFqT7N5plLZsWWXnNjlruN1OeHSRQGVtDwq6RgMwB1mrY0QKUyC4nC2RVxOBvciwBqQQOke8eNxFxbQVWJLUTwq7nqANS2Lj4t5wcmi1aMDFZkNQsXTwf9WRTHWGq6c0fPofwPLsG27KwEm3+eaInlypKD0iLhkyxSjy6PqbnpJHePhsGBpQxq5OvyNiHKbAuhpIRPvb5/bGLZBC/u1yVpWOGEDUQa3DivM1s7SVW2unc/lD5xfeXOOHJEWRaNL7hHmZ4zP/DAB0Hw6JMPRQhtpM/CmdtsOGMDhTxedDil4sXxbvh6KzgLH0+RfT8LcIBYkjK6ltOV0KXHUvkLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3BZcI9gaizMHYSRrJ9AyF8b+D1NwrAVV/ClloW6kUI=;
 b=IgFNnC/by1q7sY16gdxlOA0Vkg+0eLI1fYoSJpk6T14lIEVmWNmAp4+Ll9daMQvAw+0rjmctWHveATQHvxhVgzchSvJA7ssJGoX1ikGvwzwXQZgNbsLPjPFTQ6+VJ8IqjY8dI4uDgcnRohnhC1mzPze741xfVROHgQnPzHbod9YFzkmVymtyuY1l3gyKuMZ5uMNWzIDHalpeMMHCHe80By+do+n/o5NTOcU3Hvi4VRt0rakOvymY+/y+D/9Q4OflMYTO//CgNGdUvzRdGGp64n47uewTAUuyTJY0PnbA0jtO5QFySeopIvu4KvE8dFbZ98NCZw2TWtvibGeWC+iJ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3BZcI9gaizMHYSRrJ9AyF8b+D1NwrAVV/ClloW6kUI=;
 b=WVVz8vuW+c+7IMtaIfNSNLIZzM/sxmvnsO0ZKVMYWEw2Quzm+CgJDF30U9cOmdeD3qv5yCEmIyMwlGrqbWibXdJQ79BMQV7KBdLe5awaoLM7SlrfKDoxYc/Jft/E/X+dXdFfgLrYNd2X+J2/CjPPZmLVJUrYmpjRAFscUYDqs4w=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2] x86/msr: don't inject #GP when trying to read FEATURE_CONTROL
Date: Tue, 29 Dec 2020 17:58:01 +0100
Message-ID: <20201229165801.89974-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0143.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0881a29c-8151-4c04-e722-08d8ac1aed9b
X-MS-TrafficTypeDiagnostic: DM6PR03MB5339:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB533914620C9E94FAC38A224E8FD80@DM6PR03MB5339.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lF3uoXqGTXDyX1bZeMk8uCltoJ+V/gXQy0KKzW9GCp5Y3/st7+lJxof3w8c51Q/X3A7Bssz/7qCqs+5JviQBLMY2dnrHFGViLN2pxYw8kfaG+nu55GTpt8n5500aBU3JWioQoT/FUnuJUhpdKiA6iyVbmw7lvwMOLDiX7sFlamNe1+F8PPlFdpxPy/YtVXGXdwuIQSVLPqY584x97X5FEZDNNSM7FQp0DTQesfaBJ++fvZ8IN3eAYWl5cUDjWzzde7+z8D6Dvg2ctVUw57KLWpYfOkltB+rjdb6CtSFP7xGzqiEBOjSkhV1GntvSSLzn0ofxH/LhMIYaA78xjfU8ZwciayKWwVY6ydpxjGYKXQX8pqgqUUd3raaDloGAaPCu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(956004)(86362001)(66946007)(26005)(2906002)(6496006)(316002)(186003)(66556008)(5660300002)(6666004)(6916009)(8676002)(2616005)(8936002)(6486002)(1076003)(4326008)(66476007)(54906003)(16526019)(36756003)(478600001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZTJZekJITzA0SHR6YWVoRWltZEE0cmdZUmptZkZnNmF4WmRHNWl6cUI4WWxt?=
 =?utf-8?B?YS92Ymc5T2ErT2pnbWpRYUprYktYRzNIclJCMTQ4ZjVPc1dTNC9IYS9yYmVn?=
 =?utf-8?B?WlNqeGZ6VXhMYTN0aEQ4b0phSE03SmQvWktkdldVR3hmd1dHSUUxK2psbGk5?=
 =?utf-8?B?VVJPbnJrQ3RtWS9xck10VUxSVjE2M3lHSlpSS3Nha0tNd0FVQ25KY0FxZzdU?=
 =?utf-8?B?QzJoZGkvbUw4aVBDZzNBN3NsMFZnNDd6MVNPcmEyZlduVW1OVXIwTG8wdlg5?=
 =?utf-8?B?MktEN2VrNmZ3dU1pRWV5cWhNRWFha1d4SEwxVC9DT1EvTldPZGpPdkdKVkZs?=
 =?utf-8?B?K1MrUHp3NWxKZyt0UGNOTERWdUFOMEtlazJPNnFJU0drZktuVUlPUjZlcytz?=
 =?utf-8?B?aXpzRUNBZEFabDMzZWppODlpMko5OU1qWS9VQy8vVDd3RGdWTFdITmJFUktp?=
 =?utf-8?B?WXFGVVhWeXlWN2x3bkE1dGZwS3E2Q2V4N0RWalNydUlzZmFRbUdrUGpxMnlB?=
 =?utf-8?B?V1RJYUNFQ3ZHZU55Y2hkbWVGQmNkQU9tV3NFMi9VZmZ0aGRHYlhuSm40UWd2?=
 =?utf-8?B?OWY4Lzg4bEdBR0Y4eEZSZmJjQnpqMFJ6SHIxMHlRaFFjc054SW93YlV1NGNq?=
 =?utf-8?B?TUxoNFBHQnRpNmxvTGQrU3RGWm5wNE1QSXVnY3VKM2xkc1RHZkJPMlpNOWsw?=
 =?utf-8?B?Y3FucjVwRURHM1FYeS9pL3JIYWF0d0I4aUlNOVVEdkcwc0FEMTV6TEVWcGZ6?=
 =?utf-8?B?T2JxSk5BcnVDWGEyeWU4cHR5YjlxQjAzYTJsMU9WN245N3BOTWRjb3RUQ0Z4?=
 =?utf-8?B?SE9QUEdYejZTUGx3SUl3U3F2ekR5L0xNRWJ6bElSL1pnN0dMczM3bjZLdDFS?=
 =?utf-8?B?ZDdaelNpUXdQZFVMWklBRTRoVW1idC9ldldsTjBoRENtSnNjSHpGeS9vSmM4?=
 =?utf-8?B?SUlSOVRFMi9vSU9mU0pwT2U4ZzkvaFppa0xmVlZKcndPMUw2dHRDMWJ0eDI1?=
 =?utf-8?B?RlRTUHJjR1BJYTduQUpzNHBXVFZucGhZR2xPSEpSTHBJTmlUckxQbXdJME9u?=
 =?utf-8?B?ZEhNeVB1Sk81b3VNdnBVMlRiam5EY0lTR3R6bnVYbzJpYUhIR3VzUmw2R25I?=
 =?utf-8?B?WVZ0QlA5eGFUUG4yVi8rVTQ0VmZ2MGxZTW5NZEY3RUtEeUovRi9Ia1VoTFRp?=
 =?utf-8?B?cTBKYXliTTd5Ui9CdWc2dzk3V2JDYkVyZzl5bC9ERTFreWFmZ00yN0c5ZUYw?=
 =?utf-8?B?MUpsK2NjOFhvTnFSVmpRVE01ZHBTeG1aZ3QrcWRQSzd2TjVUVkxPSVk2d0JF?=
 =?utf-8?Q?WQgsu/DppduQHiFLVtLLr1ruF0aKv51lKe?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 16:58:12.5383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 0881a29c-8151-4c04-e722-08d8ac1aed9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E97w2GAWJw2Yw0ByJ1XtgMNagSdjvpQflBAra09F9QrQfEvb9ONKAbcuxkjrE6RIuEZndumK4uGT/LM/IXRUgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5339
X-OriginatorOrg: citrix.com

Windows 10 will triple fault if #GP is injected when attempting to
read the FEATURE_CONTROL MSR on Intel or compatible hardware. Fix this
by injecting a #GP only when the vendor doesn't support the MSR, even
if there are no features to expose.

Fixes: 39ab598c50a2 ('x86/pv: allow reading FEATURE_CONTROL MSR')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v1:
 - Allow Shanghai CPUs to access FEATURE_CONTROL without #GP.
---
 xen/arch/x86/msr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index be8e363862..6dfd3d5f97 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -176,7 +176,8 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
     switch ( msr )
     {
     case MSR_IA32_FEATURE_CONTROL:
-        if ( !cp->basic.vmx && !vmce_has_lmce(v) )
+        if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_CENTAUR |
+                                 X86_VENDOR_SHANGHAI)) )
             goto gp_fault;
 
         *val = IA32_FEATURE_CONTROL_LOCK;
-- 
2.29.2


