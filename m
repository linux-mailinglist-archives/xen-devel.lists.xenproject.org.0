Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D73734FE21
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 12:36:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103833.198047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRYCd-0004iD-Ko; Wed, 31 Mar 2021 10:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103833.198047; Wed, 31 Mar 2021 10:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRYCd-0004hW-GI; Wed, 31 Mar 2021 10:35:59 +0000
Received: by outflank-mailman (input) for mailman id 103833;
 Wed, 31 Mar 2021 10:35:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9hby=I5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lRYCb-0004gV-L0
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 10:35:57 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44e71fb5-fe1a-4cb7-891e-c4233cdb117e;
 Wed, 31 Mar 2021 10:35:56 +0000 (UTC)
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
X-Inumbo-ID: 44e71fb5-fe1a-4cb7-891e-c4233cdb117e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617186956;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=uZL29ugOlkoo4WkuuUBU+vjfeGVoGnql4+FwdjwuYkw=;
  b=cMcaf7jlRyPTxy9fC5T1nSuWXaaUmgmAjUEacUNGOoi6qVx+8IH286RE
   KP/8vA6RJi+nBppWs2t6QwnkruGZIYcuSlRfTJeyBMZ3F44CvfCOOZkjH
   a4MwZ0YM2XGK3mCQ87Vg7Te6B8MRaOk3yS8gcFDORedE6QxOIw22bXxEd
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /uvVyBv5xVnGakZuFeRVMy4mY9cyezBPFJig4mB6tRWhyGbcU7vPA5DcqVjPIa4nSnJPdW0lSY
 gCPlH/uacWa2Gk1Rkz+mW0Y8rJ4zxosMUqY1fmgKLhywQAPm9CLUAwAZlT32y9wG2/UcVyg7zX
 SE/COgEiplotmXfkQHK8D9Sk0FAZUM+Ch5Jo1RrIQu9aqAcflIV1m8bqp6qtpUbgZ3IlkYMEd5
 3FbUfV0iU0K862wjTWrMLtpROdrsLy3lDg5O+ZdusFa9DbUbWFjZf3trfo/Kx81ZSuH1IkFfIk
 VbY=
X-SBRS: 5.2
X-MesageID: 41994558
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:B5fhqqtFUXAdGj05Gn3cyYaB7skCrIMji2hD6mlwRA09T+Wxi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmwybde544NMbC+GDT3oWfAFvAG0aLO4R3FXxf/+OlUyL
 t6f8FFYuHYIFBmga/BjzWQPM0nxLC8npyAocf74zNTQRpxa6dmhj0JaDqzNkFtXgFJCd4YOf
 OnhvZvnDardXQJYsnTPBBsM9TrnNHXiIngJScPGh9P0mKzpAm14733GQXw5GZ8bxpzx94ZkF
 TtokjCyYiI99q6zRLd0GG71eUtpPLRjuFtKebJpswcKjDHghulaoJ7S9S5zU0IidDq0nkGup
 3hpAohItRS5hrqDx2IiCqo4SbM+nIP7GLv0lCRi3eLm72HeBsKT/BvqKgcVzmx0TtFgPhMlJ
 hl8kjcir9sSTTHpyj578igbWATqmOE5UAMvMRWs2ZSSuIlGdhshL1axmx5OrEaEhn37Yg2ed
 Med/301bJtfVSWY2uxhBgI/PWcGnA6HhKxSkMfoMCi0z9PgHBjz0cDrfZv50s9yA==
X-IronPort-AV: E=Sophos;i="5.81,293,1610427600"; 
   d="scan'208";a="41994558"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhQY8Q/l2c+6iIvW71SMpYAVrLVHsqARZo9cog2+8XzZhmUbyv0ZETFZy1lrUswKxoovVEbOIhbPxVeGXgCgNOTiIXcqt9a2kyTu55852tJ9TmNlTjsTfu228ZK5FfY0pPVO2QCmELgxDnyrX79LTwBJNYG9fTkTZQYn1mdBPKa1LHPbJWnda+YqRbSdllg0QE5yhx3rk1qmgB615NTr/RPb4cwsPLAn4eDdQlX73k2igQuvuLWZ3liqvLNbBLkcwNNYNKsIPhzslOK9knthU7MYlVIdCJur7Jp8Dcz4Ov+HOJFPFh1zML1dqd1ntsKLU63Nl3H4zHq+GWy6ubp3xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZNy/L5pNGQXMad8B2V5JHLEH+vnc9PVuVRiLVFoWBc=;
 b=gAJ2rBDFAFszOJyQBarAM2F89ax9WwK3ixGwi4oM38jCWbvzOoB43NiSQXrryQ0TQkkeKtXI3KobNzi6Y7KoCSNc5hIPj72HNEGB+5F3dhQW7CDj/EIoAhZm6uPmU1RKt0GA//lBMmDqV8CM6T5WbqjiuVeHZ3tOqFsgKSa4EXVSFpQ+wFhk0IC7CtR9/NQ4RuYfn730C2q5VtfDqJS6+NsAR+9EDlPd0WIzwL6dhicCfSaa4DwEQdNZSCDO2t/uL6ODZ2mncAZWlLFSnvHmg953otOpvMQeBs/q/hbBryHw/x0oOpHbHOLIRfd0jYgFMmBIMhPB3YmK6uXyRSUURQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZNy/L5pNGQXMad8B2V5JHLEH+vnc9PVuVRiLVFoWBc=;
 b=FpVkjNC/CUc/BLLNsCdcUqyK64HwCy/rUvncXKF+5SF4ChspWMqN0NqM8DYNTd1paPGjbKynepgtd52wFNFx/Lyn1uRi6U+bgQa8T3Etozw8jXQt09Xgug4PnuzLkqtmZcI8WWXsEO+deOyh+LgmJMlmMWk/WQNfGK83ECEC0o8=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 03/11] x86/vlapic: introduce an EOI callback mechanism
Date: Wed, 31 Mar 2021 12:32:55 +0200
Message-ID: <20210331103303.79705-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210331103303.79705-1-roger.pau@citrix.com>
References: <20210331103303.79705-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0152.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 849cd698-cfa6-4f51-9f0c-08d8f430c258
X-MS-TrafficTypeDiagnostic: DM4PR03MB5968:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB596839834E1E1E0DCB74501E8F7C9@DM4PR03MB5968.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:506;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 978tVbIdC4b7xVB7qTjvrvvOkPJqj1euY03Fn+Y3BPKz73P4rRIBvxmu379v1eJuNtfUg2PLMd7kl3kXmES9+umdE2xIgWXFUloHXoydg+z4fKWUmrrbTnRVZv1yvusFt9FAj4ouZGz/y/luXOEyafVruUDQgRtwEJxFRjrmqOdK+tgLpPK4YSyYixeCTgte6vWTkbM9FI//esy4PeNdHJeFKkAzs92UpPbSZ/vczwGcSY/EgVTiyl4B8K6ERrGewib1Y/9kwl1d3oYEUsn7igc3PjUOx1wekVq1FB0q28v0lZ3iXP57kDN6NZQE52KVaMv4m8PiQoLcZv26RFQ1xoDeMoqvoqRSmhWd8zzWTOGGvuwjcNps8ZYB4PUPlpL9Eu6918M9buKzR1EQuM5bUvq8PbYVS+PrAV8OkrBUsan+BJTAlaTisrd+61UFRsIEmUhrMVALZNClveNfrxKwry1rdsKIz1pJ3WMe2p3fGPXA9QROrFbHTxs0+BtZQK+nMEcy6Mv6h6na2CdOyXY09+U5aQwAhXstRo91KDnEGWbzisno8SzrRLQMdGe+amcX88H9mAB5hUbAXJpiYk6ezizPKNTznEYDV8M/6n26EyuUTC5ex1guQEUGan1ZR/wi27ebaAidDUw0RuDlDOQwfkjbCWuceFb5W4hqdiBIIzY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(26005)(2906002)(6486002)(8676002)(1076003)(36756003)(38100700001)(8936002)(83380400001)(16526019)(86362001)(186003)(6916009)(6496006)(66556008)(66946007)(478600001)(66476007)(5660300002)(316002)(4326008)(2616005)(956004)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MVcyOUV0by9hQmpScEp5VTFVT1hpcytDeUdJQWpVRDhuMXBoREl3UE9oSVox?=
 =?utf-8?B?T0tUTjRVQVluYkV3T0lQZ3hXN3hPR2l5K1JteGljd3R1WXJPRktIcm03L2VL?=
 =?utf-8?B?OEhjOGtaRUlURktmSDJXaE8rTkM3K0J5bFZ0TGdTZ3QrSjBlUG1ualUxZVZ4?=
 =?utf-8?B?TFk4aTNlZWRrWDhXTGM4dWNRY1ZqR3I4UUV0elB4WERicGZoTTFCemZjUk9T?=
 =?utf-8?B?bVo0Z2RGMmdDYWpuK1hnNGt1dXgvTjhQejBSQmpGeDJQWjVUa0NsVTRpSTRp?=
 =?utf-8?B?b3hvSWl3SkdRcGZ1TytBaTVadkNLSjkzSjZvNUNEMkxIVElqRk9Ma01yZU5j?=
 =?utf-8?B?T3lxRENuZHY3dGo3QWZoOWo1bTNIcmppMnJkRkxGbjRkbHN0MGhpSjNrV2t2?=
 =?utf-8?B?TTRIYTQwVjhRZU50UGgrN2ZPZmZwZlJMcTNwdXRrdGZwNmJyTmNGQmU0RlNl?=
 =?utf-8?B?NWVTUC83bkpPV2JXRkh1UWpFSmYrcVptbGJzVTVxUExvTnpWTHNzakZTd056?=
 =?utf-8?B?MmdOZXBNazVFT084TnB2TUxvMERRYStGbk5Pd0xaeXcxSDB6MmllQ3IvRDNm?=
 =?utf-8?B?c1Zra3VvNTllbk5XbjRlUkVVREdPcnVrREQxOHlWUHVaUlczK05hbFhlUURo?=
 =?utf-8?B?ZzdCVStNOFVFVlJjUlRZdEJ2Zjg1VzFXVHNXaS9pNGZFc3RtRHRXcmNzK0wr?=
 =?utf-8?B?ZDlEeHRIaXl2K1pzYkN6TG5MclBmZGRxd1FIb2gvZll6RDlDMVV1MC91TWhh?=
 =?utf-8?B?WU5NUEV6YXc5NmM0YW5ja3VYSmRNUTM4Nk9SQ0dwV040aU5IUEV0YVBSYVNL?=
 =?utf-8?B?NGl0TVpZV0ZUZitBVXJtbnRBK2M1d0VmYjJid24xMENiZHdBMHl4aTZ6c0Fn?=
 =?utf-8?B?V2FvalVLSG45eXZrV0ZSWFp1aVRBbDhLYnRKS05xajdtcThYcDZvVnE4TjB6?=
 =?utf-8?B?MnczZGVZRGEzZXZBNER2UVdhODIwVkY5aGJzZlVUc3dIWXB6NVBGQ0o5OXdM?=
 =?utf-8?B?eEZzY25QU3FBMEZYRXRNRUJzajFWbXJHQVNDaGdNWlJsNUI3UUVPQWR5OG93?=
 =?utf-8?B?OCt6dFhhNjFCN1A4aXZiMkphOCtTbVpmajFvZmFsbmxDVlRiWXNqNXpBRjVG?=
 =?utf-8?B?WS9FMTE4SHhHN2J0NGJlU3N6T2lYL3dsRXNqb3NUb25uNlhkT0lNRWFqK0lD?=
 =?utf-8?B?WjZtYkgzVE80SXhkaXpERWd2U3dSaUdZbWdrbkJ2V21aYUk5ZDByaGdhVlJ6?=
 =?utf-8?B?ZU1tcGV1d1JCMUhsU1pIT09haG94OHdmcENqWUFLa0g5ZFNrWGRTUUNFaFJX?=
 =?utf-8?B?M0I3dHpaWHpSM2lnNGJUZldVSEpUVk5yNGxGY0lIcUtrWElldDVFeW5iNDJM?=
 =?utf-8?B?SjNsWno4M3RBVXoyRzZkd0NOQUo0ZFczcmY5N1NvR2ZTRVNpSDNsMmpDeG4z?=
 =?utf-8?B?bmpkWHNRbVQxQXFPcmNSakQvUnRjT3BIWTdWTTFNd3U2cnd6QXVhOHpnSzN2?=
 =?utf-8?B?M09XUENoRHZtSnhLWHFwdExIblpwZ1Awb0haREVUZmFVaWI1dlM2MFBRNG9k?=
 =?utf-8?B?WmxUMzdPRmRQL0NKSFF3NUdTaDJ6aElTbkJzU0UwbUttL3dmR2RJUm1Xbnpw?=
 =?utf-8?B?Nkk3TmNzTlZzYjJXbzYrc2NrRTArWklkTDczU2hhSWdSM1p2c1B5ajNJczJP?=
 =?utf-8?B?SHFJWldsQjVzRTQ2Z21pZWtDUEExQU45ZU1KWVVVU2NYU210L0xhMXRFdUlT?=
 =?utf-8?Q?u3JkV+0DkvmBg71tbBnkQecPLFUX+P7S1jB213x?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 849cd698-cfa6-4f51-9f0c-08d8f430c258
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 10:35:53.0006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uk7sJxrigTALmRmpuIWDkmH+7wdVt+PT3ExT0sWxHlJOrqFVHvkSft46g9fK+2jhBxH7VImo50T1kwTlgc9S1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5968
X-OriginatorOrg: citrix.com

Add a new vlapic_set_irq_callback helper in order to inject a vector
and set a callback to be executed when the guest performs the end of
interrupt acknowledgment.

Such functionality will be used to migrate the current ad hoc handling
done in vlapic_handle_EOI for the vectors that require some logic to
be executed when the end of interrupt is performed.

The setter of the callback will be in charge for setting the callback
again on resume. That is the reason why vlapic_set_callback is not a
static function.

No current users are migrated to use this new functionality yet, so no
functional change expected as a result.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Fix commit message typo.
 - Expand commit message.
 - Also print a warning if the callback data is overridden.
 - Properly free memory in case of error in vlapic_init.

Changes since v1:
 - Make vlapic_set_irq an inline function on the header.
 - Clear the callback hook in vlapic_handle_EOI.
 - Introduce a helper to set the callback without injecting a vector.
 - Remove unneeded parentheses.
 - Reduce callback table by 16.
 - Use %pv to print domain/vcpu ID.
---
 xen/arch/x86/hvm/vlapic.c        | 64 +++++++++++++++++++++++++++++++-
 xen/include/asm-x86/hvm/vlapic.h | 18 ++++++++-
 2 files changed, 79 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 98e4ba67d79..851a1f5bd6c 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -144,7 +144,35 @@ bool vlapic_test_irq(const struct vlapic *vlapic, uint8_t vec)
     return vlapic_test_vector(vec, &vlapic->regs->data[APIC_IRR]);
 }
 
-void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig)
+void vlapic_set_callback(struct vlapic *vlapic, unsigned int vec,
+                         vlapic_eoi_callback_t *callback, void *data)
+{
+    unsigned long flags;
+    unsigned int index = vec - 16;
+
+    if ( !callback || vec < 16 || vec >= X86_NR_VECTORS )
+    {
+        ASSERT_UNREACHABLE();
+        return;
+    }
+
+    spin_lock_irqsave(&vlapic->callback_lock, flags);
+    if ( vlapic->callbacks[index].callback &&
+         (vlapic->callbacks[index].callback != callback ||
+          vlapic->callbacks[index].data != data) )
+        printk(XENLOG_G_WARNING
+               "%pv overriding vector %#x callback %ps (%p) data %p "
+               "with %ps (%p) data %p\n",
+               vlapic_vcpu(vlapic), vec, vlapic->callbacks[index].callback,
+               vlapic->callbacks[index].callback, vlapic->callbacks[index].data,
+               callback, callback, data);
+    vlapic->callbacks[index].callback = callback;
+    vlapic->callbacks[index].data = data;
+    spin_unlock_irqrestore(&vlapic->callback_lock, flags);
+}
+
+void vlapic_set_irq_callback(struct vlapic *vlapic, uint8_t vec, uint8_t trig,
+                             vlapic_eoi_callback_t *callback, void *data)
 {
     struct vcpu *target = vlapic_vcpu(vlapic);
 
@@ -159,8 +187,12 @@ void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig)
     else
         vlapic_clear_vector(vec, &vlapic->regs->data[APIC_TMR]);
 
+    if ( callback )
+        vlapic_set_callback(vlapic, vec, callback, data);
+
     if ( hvm_funcs.update_eoi_exit_bitmap )
-        alternative_vcall(hvm_funcs.update_eoi_exit_bitmap, target, vec, trig);
+        alternative_vcall(hvm_funcs.update_eoi_exit_bitmap, target, vec,
+                          trig || callback);
 
     if ( hvm_funcs.deliver_posted_intr )
         alternative_vcall(hvm_funcs.deliver_posted_intr, target, vec);
@@ -459,10 +491,24 @@ void vlapic_EOI_set(struct vlapic *vlapic)
 
 void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
 {
+    vlapic_eoi_callback_t *callback;
+    void *data;
+    unsigned long flags;
+    unsigned int index = vector - 16;
+
     if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
         vioapic_update_EOI(vector);
 
     hvm_dpci_msi_eoi(vector);
+
+    spin_lock_irqsave(&vlapic->callback_lock, flags);
+    callback = vlapic->callbacks[index].callback;
+    vlapic->callbacks[index].callback = NULL;
+    data = vlapic->callbacks[index].data;
+    spin_unlock_irqrestore(&vlapic->callback_lock, flags);
+
+    if ( callback )
+        callback(vector, data);
 }
 
 static bool_t is_multicast_dest(struct vlapic *vlapic, unsigned int short_hand,
@@ -1620,9 +1666,22 @@ int vlapic_init(struct vcpu *v)
 
     clear_page(vlapic->regs);
 
+    vlapic->callbacks = xmalloc_array(typeof(*vlapic->callbacks),
+                                      X86_NR_VECTORS - 16);
+    if ( !vlapic->callbacks )
+    {
+        dprintk(XENLOG_ERR, "%pv: alloc vlapic callbacks error\n", v);
+        unmap_domain_page_global(vlapic->regs);
+        free_domheap_page(vlapic->regs_page);
+        return -ENOMEM;
+    }
+    memset(vlapic->callbacks, 0,
+           sizeof(*vlapic->callbacks) * (X86_NR_VECTORS - 16));
+
     vlapic_reset(vlapic);
 
     spin_lock_init(&vlapic->esr_lock);
+    spin_lock_init(&vlapic->callback_lock);
 
     tasklet_init(&vlapic->init_sipi.tasklet, vlapic_init_sipi_action, v);
 
@@ -1644,6 +1703,7 @@ void vlapic_destroy(struct vcpu *v)
     destroy_periodic_time(&vlapic->pt);
     unmap_domain_page_global(vlapic->regs);
     free_domheap_page(vlapic->regs_page);
+    XFREE(vlapic->callbacks);
 }
 
 /*
diff --git a/xen/include/asm-x86/hvm/vlapic.h b/xen/include/asm-x86/hvm/vlapic.h
index 8f908928c35..c380127a719 100644
--- a/xen/include/asm-x86/hvm/vlapic.h
+++ b/xen/include/asm-x86/hvm/vlapic.h
@@ -73,6 +73,8 @@
 #define vlapic_clear_vector(vec, bitmap)                                \
     clear_bit(VEC_POS(vec), (uint32_t *)((bitmap) + REG_POS(vec)))
 
+typedef void vlapic_eoi_callback_t(unsigned int vector, void *data);
+
 struct vlapic {
     struct hvm_hw_lapic      hw;
     struct hvm_hw_lapic_regs *regs;
@@ -89,6 +91,11 @@ struct vlapic {
         uint32_t             icr, dest;
         struct tasklet       tasklet;
     } init_sipi;
+    struct {
+        vlapic_eoi_callback_t *callback;
+        void                 *data;
+    } *callbacks;
+    spinlock_t               callback_lock;
 };
 
 /* vlapic's frequence is 100 MHz */
@@ -111,7 +118,16 @@ void vlapic_reg_write(struct vcpu *v, unsigned int reg, uint32_t val);
 bool_t is_vlapic_lvtpc_enabled(struct vlapic *vlapic);
 
 bool vlapic_test_irq(const struct vlapic *vlapic, uint8_t vec);
-void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig);
+void vlapic_set_callback(struct vlapic *vlapic, unsigned int vec,
+                         vlapic_eoi_callback_t *callback, void *data);
+void vlapic_set_irq_callback(struct vlapic *vlapic, uint8_t vec, uint8_t trig,
+                             vlapic_eoi_callback_t *callback, void *data);
+
+static inline void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec,
+                                  uint8_t trig)
+{
+    vlapic_set_irq_callback(vlapic, vec, trig, NULL, NULL);
+}
 
 int vlapic_has_pending_irq(struct vcpu *v);
 int vlapic_ack_pending_irq(struct vcpu *v, int vector, bool_t force_ack);
-- 
2.30.1


