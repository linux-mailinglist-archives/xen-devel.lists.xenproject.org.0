Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AFD394693
	for <lists+xen-devel@lfdr.de>; Fri, 28 May 2021 19:40:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134041.249614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmgSk-0000sx-6U; Fri, 28 May 2021 17:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134041.249614; Fri, 28 May 2021 17:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmgSk-0000qy-2d; Fri, 28 May 2021 17:39:58 +0000
Received: by outflank-mailman (input) for mailman id 134041;
 Fri, 28 May 2021 17:39:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WKFi=KX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lmgSi-0000ZU-SW
 for xen-devel@lists.xenproject.org; Fri, 28 May 2021 17:39:56 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33356d93-6df3-44d8-b236-1a4f0aca9dce;
 Fri, 28 May 2021 17:39:52 +0000 (UTC)
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
X-Inumbo-ID: 33356d93-6df3-44d8-b236-1a4f0aca9dce
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1622223592;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=IxeGPsjlqm7m9YueumxWU8Dv7M+sUj7g2Br9UfeV1pg=;
  b=D2v2cJuglfoll1Qur8cfLZWgT2zD2UUURlPUtVAerkoFy0db/Le+Eywp
   62v3z1eYDcxe6quYaELCBI86frkMLvNzZWyhHkxGK1Vc2pUaeFOseIu7U
   l9k6ITJV0AQqXmHT0/42NlWpI0glKx637odZVm+oiglTFdNCpp2s5CYQw
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: OEJBosAulKLIEV0aQvn9EvzWgualTiQrGPxgzySXbcO7Mp3468v++PvvoGUkdocKOqASmkUdrj
 ne03uh6TG39czepTOwp3+y8H6WMzSH87badLj3RbM0JIyZ6W0S+F8Wc7aRtAqMF8qbIEgD5cwB
 8Uv2yvhSr1UNl5U5LxDbqUk9JBI7KwMYnoISbOy9MNKVwjJygDJu0A0lxHHfpR4KwPKm4K2fRZ
 1fHGBbZN4fioBRiFg5AcGmb1JuUVN4HYwjeZHbRupVaACI/0+XZBor9IKsRecHCo8pbighT7hT
 DGU=
X-SBRS: 5.1
X-MesageID: 46432765
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:oiRMgqDDn9Pj/DTlHeiUsceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPH/P6Ar4WBkb6Le90c67MAzhHP9OkPUs1NKZPTUO11HYVb2KgbGSpgEIXheOjNK1tp
 0QAJSWaueAdWSS5PySiGLTfqdCsbv3hZxAx92uskuFJTsaG52IhD0JbDpzfHcGIDWvUvECZe
 uhD4d81nWdkRt9VLX0OlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPQf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcRcsoW5zXUISdyUmRIXeI
 GmmWZmAy0z0QKRQoiNm2qu5+G6uwxerUMLoDSj8AneSc+QfkNxNyMOv/MBTvN1g3BQ9e2U65
 g7qF5xgaAnRi8orB6Nk+QgaCsa4HZc2UBS6tL7r0YvHLf2O4Uh4bD2wituYd899XXBmf4a+a
 9VfZnh2Mo=
X-IronPort-AV: E=Sophos;i="5.83,230,1616472000"; 
   d="scan'208";a="46432765"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TyQhfQvVdDRHjgYgZ6P2fgSN5h+BVxSa9/JyFn82AenngFHR2mxmgpY8AhwCYrG18GzQ4zHgfXxJwvvHAe3mLaC4dXzCBaobUqRjmNyx32NSGAwpjp0Ixhw8ihv6uSX6I7YkQzKVi6AqxbZAriDZvSuqIGx1X1za3PsAXShaHZQGtmSsVA5pOteJStiENe+Lp/IyXZRdwFZaVjAE4JMvO2YNaAsxlM6AY8C49vK8Iwu3SMxc/XHsVOQ//1If9Gsjnqfz0k1wBzcPZ5YrTZ7F/XM94oVxdCgNHODk4kLsA8nIZA4Dx2PTY8HmUizHsuGmLdJW90cvyFpPLvrP6ipL7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrKXXGDcgQcBgxROwP6XsmUEHjRwDViGegef7nDL4CI=;
 b=LF+thI9QK+mISA6xZ9Ac7EcMrYMCGOaCShxcMqzUDktUuv3NnV50KNcJpfD9FmPzI2ZYJKuaKlCW/MCse+XuuwVHAJOdYHdJ+alhXREmISWoa6BpytlKTrBDpBqRq0vkkRdaz0fJaBAfFd47wi/QMa0AkfcrhUASiaIesjJOGRKfWW9Bk8F5b7QivlupGhhb9s9Pc6bzWkNvhp1QjZ/OTET7/W0+XjIEvM9wmoH9oY1rBCvx7Rsj+Lvn8gmXYmxtUVpfb1sApFnoewmD+Nuj3v2Px+0aMv1pf7z6nGybT0/qTn3ZC5I/sVXXpkQxFJrRG4O/nPZhzjtTO5E1w+n23g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrKXXGDcgQcBgxROwP6XsmUEHjRwDViGegef7nDL4CI=;
 b=rucvN+hcCLRZCJYS9jPBByNYtA6za7XyymGOBkonFy1O+oPiR7ADEwA4q4NR0/mUrcV/SyZ8EQtN79Msp+4SeF5MkQ2pyVS0hVeBE0M3pq/PSYFcINDQkA1Z5cktGPkEuQLXUtBVdh87LwpWK6Kx1UkpP5MyHNmNxInhPrkyi3k=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/3] x86/mtrr: remove stale function prototype
Date: Fri, 28 May 2021 19:39:33 +0200
Message-ID: <20210528173935.29919-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210528173935.29919-1-roger.pau@citrix.com>
References: <20210528173935.29919-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0130.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b1ace0f-e868-4886-926e-08d921ff97ed
X-MS-TrafficTypeDiagnostic: DM4PR03MB5966:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB5966B74F56180B9408946F878F229@DM4PR03MB5966.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lm8mdrUDnkJCAe5TO/og+SxKU2zuS97Yvl0zM44fRBoHk3AIjFl/l0RjBnUWkCsAiblSYqxPT+f/Ref/+02efFVzG1Cw2jzH3fBKQGJADFdjs3egcyAc40bD5HhnizfdfBGPiQUq/xcXzz6jrcZDsHg2EsA1KrMRgdCUPJHrrVkAMFHd92aeyVo5/t/GVbPXR4vh8uhXCXSCZtcW/2NnvqEdx2tZ1etWkHCzL/VnEt1j28oO1o94kYZSXH6h6kjCGHcpVHpAyto8W1nnNtrF0695E5OqCkJG/xXLwseMLAIYg7wgiYa53U+VhGWiW0MBHPZexXwBzW7CfcxbKlc+MP2MPW7G6uGd0DEL/ItFXOJ9LfonQGvJHPQJfEleAg7x84+FJEXQ7Osj7HitN/Ue7JIBeoMmR9O+P6ffC1kQ2fDa2YanKOKb9+I8i8Q8LuzTimjLdnfJ9KTR3MFFoOtFOAoiI9mYk3d/JuhYlz2kN0Q8hGHyzG5uaavEROXBV307LWbVshCNvN9/1GcOy8mDh3Y1jwZzRbXyjAvg/4iHiPRq5WSlzxhKVED2DUnWnecKv4Dr8xTWSYyUSzFmyWcqIz3jW1dfmFhj1vQpgQnGgRU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(6666004)(36756003)(2906002)(26005)(2616005)(66476007)(316002)(66556008)(186003)(66946007)(16526019)(54906003)(956004)(4326008)(38100700002)(6486002)(8676002)(4744005)(83380400001)(478600001)(8936002)(6496006)(86362001)(6916009)(1076003)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Vm9aS0l2bkwyQWNUNzZNSU9KZHVaK2hKc0FFZHdBQ0pyaU55UUhBcU1hWTRw?=
 =?utf-8?B?SlNxU2FpYnNqTzZ2eVh0RVFrNllWeXdMaGltTVVCbEt5TTdic0NzRWdkcFF0?=
 =?utf-8?B?dW1GeFVXTVMxbHhCQ0lqNzhZUDFtOVNOUmU3VHJ4NFpFZkM3RkVlTm5EQnZV?=
 =?utf-8?B?c0dDcWd3cUFhL2dONHF5WS85R254VHNZVks2ODBmSUtmNHhWTU5MekNNS3VZ?=
 =?utf-8?B?WVIwMVdJaUdZeE5TN2gvcHZwenFjdmx0RHZtOFJma1V2L3dkdUlVVDE4ZlhQ?=
 =?utf-8?B?cnNVamZubHVEWUNFV3Z5M0l3YStBcCsyODFpQ21lSzVyOUg3QVBxdzdTSlFC?=
 =?utf-8?B?Tk5mRFhveTM3Wnl3MnFIM1lyVFBRSE9BR3Mwa1pvK2xaSHVTYW83SzQwSmZr?=
 =?utf-8?B?ZjFMTFBlODBva0RLdmpGS245emxwWVA4cjgyY3hCRXBhUGpNQThBRDVxZFNT?=
 =?utf-8?B?UEhYaXcrY0YvcU9ZTmxrMlNwSjVYeXBCeERnc21lZU5qN0lkMkd0cGtkL1Nw?=
 =?utf-8?B?RFRwMk5hQU9CdStFNHU3akJMSXpha2xXanlGTGdaSUZBeS9GVXV2M3BCSFM2?=
 =?utf-8?B?NUszMnBWKys3TndYWGJQSkE5eXBWaDA1QzZkclMvSkd1cDlISnhaRTc4VW5l?=
 =?utf-8?B?QVR4c1ZES1p2MXNLelY1VlVtN2YraGFybFlWVW9rWHY1elFpMmkxVWhaanVX?=
 =?utf-8?B?ek9PNTloVUZiQkpKV294T0c4bGR1SHFtK01ObzFMK05ORFRJT1RJeUx3WFBL?=
 =?utf-8?B?ZENTQUFyOFU0MUJib0pCVEIydzNTRy9hUEtHd2RSOE1qZllEZHJlZ29iMTBn?=
 =?utf-8?B?Si9YZXpjTmkwclBxOFNEVXM1a0RjR0dSbHhpaUhxTzd4WFdXWk5WYmFDL3Nj?=
 =?utf-8?B?MENET3prNVFSb09tejJ4dSs0Z1ZRZ3g2SVlMTmhCa0FLeW01REFOSkwvUXdj?=
 =?utf-8?B?WnBjRk1kUVhxT0Q0M2libm1aaVhmVVVvUE1hT2lCNnN2S3grdW93R25odFVU?=
 =?utf-8?B?YjBrK0hIRTJRR20ycVJKbGt4aWx3WXk1dzZpckl3a29vdUVUOVNTMWJxVTdH?=
 =?utf-8?B?S3NPZG1SMUVWcE9ObmxuSzhwMm4xMVVWNys0OW9KczZ1TEpmbGg4RlI1Qk9I?=
 =?utf-8?B?NnJVaGVqaDdPQjJ5L0svTU5HckZjeWR5UXZ1SG4ydk1aMUwrK2lNSGRZVnk2?=
 =?utf-8?B?Nlh3TmVOU0J2NlNUcnVBZTdBaFA3Z094WVZMMVMxMktQdkN6YjhnVGNpRVN1?=
 =?utf-8?B?cEtrVEgzTmEwM21vbG4rUE5Xd3dxTFBsZXhPNzE4ZUJHYUxiUXRYT3FUbDVp?=
 =?utf-8?B?N0wxQXdsbFlTc1k5UDJBYnhwMis0QWpaeVczTUFXdEdGUWJZbU9BN3JUU3VT?=
 =?utf-8?B?Ky9IWSs5ZmtTaGFPelkzL3JTSW8rOGtGMkcvQUVjZzFRdm1kK1BDZjd4OHp1?=
 =?utf-8?B?bURFWk1CMjJTZmllT2ZYMGRsMERUekkyUjdxc1d6OUdzRmxuRllaVmxnUjlP?=
 =?utf-8?B?YmJpL2Y5dTRiUzR4MUJlNnd4Z1g0dVhRUU1JVFlTWjRIMW1QdkVXMm9rZ2o0?=
 =?utf-8?B?YzRuMDdXYkNjenJ1RTVIYkpzK2Z4SEpHdjY4b2NTTGNjdHVxNEZTVHhlTTI3?=
 =?utf-8?B?SFY0VU1VZ1RXTDdJdHRFY2QzaVdQcENnUVNxRTkyRlFSU0Q5Z0tsZGxMb1VP?=
 =?utf-8?B?NDVFT2x4YlJ5Sm5QMFNGUEpIUXRiRXBMSWhNL2hzc3haM29pS0VNeFFJN1cr?=
 =?utf-8?Q?RA81GRAAp46lEhyN1XlKvxch52rMQSuVfsVhhrE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b1ace0f-e868-4886-926e-08d921ff97ed
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 17:39:50.0087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hlClrQDZnDfCPAW21vi6mC4zstsM+uDfYwiz/SAd7wb7PZ9m0dV6PY60owNRyJKcP088x6JaKo96YfiwipJW9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5966
X-OriginatorOrg: citrix.com

Fixes: 1c84d04673 ('VMX: remove the problematic set_uc_mode logic')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/include/asm-x86/mtrr.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/include/asm-x86/mtrr.h b/xen/include/asm-x86/mtrr.h
index 4be704cb6a..24e5de5c22 100644
--- a/xen/include/asm-x86/mtrr.h
+++ b/xen/include/asm-x86/mtrr.h
@@ -78,8 +78,6 @@ extern u32 get_pat_flags(struct vcpu *v, u32 gl1e_flags, paddr_t gpaddr,
 extern int epte_get_entry_emt(struct domain *, unsigned long gfn, mfn_t mfn,
                               unsigned int order, uint8_t *ipat,
                               bool_t direct_mmio);
-extern void ept_change_entry_emt_with_range(
-    struct domain *d, unsigned long start_gfn, unsigned long end_gfn);
 extern unsigned char pat_type_2_pte_flags(unsigned char pat_type);
 extern int hold_mtrr_updates_on_aps;
 extern void mtrr_aps_sync_begin(void);
-- 
2.31.1


