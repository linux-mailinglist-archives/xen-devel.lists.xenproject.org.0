Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 425F9590CC4
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 09:44:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385356.620979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMPLQ-0000VX-Sm; Fri, 12 Aug 2022 07:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385356.620979; Fri, 12 Aug 2022 07:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMPLQ-0000Tl-Oj; Fri, 12 Aug 2022 07:44:36 +0000
Received: by outflank-mailman (input) for mailman id 385356;
 Fri, 12 Aug 2022 07:44:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yzoh=YQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oMPLP-0008ML-2a
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 07:44:35 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70089.outbound.protection.outlook.com [40.107.7.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ba7631d-1a12-11ed-bd2e-47488cf2e6aa;
 Fri, 12 Aug 2022 09:44:34 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8646.eurprd04.prod.outlook.com (2603:10a6:10:2dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.25; Fri, 12 Aug
 2022 07:44:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 12 Aug 2022
 07:44:33 +0000
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
X-Inumbo-ID: 9ba7631d-1a12-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpmFUc3IEYUirhBmesxiieNu1VaXZAczi4+U+ymiv/5fUvGK3EahuU/Kzt3CCo4zBOL7xxOXJvgiba6gz81D/lamHTQa1dboBFSGIY88Z54tiVN5pVvZy1yRbe0ThH+g4P43B76QXCB7TypZz0Vu3L1HF0ynCasYdkXyZ6n8mROmdiWDDBV2gNa0ezztlaHJonKPQKwAdjpRUDhDd9skHwT8qYbsQ2sCJBXUUhACWOXg9NUKLGZ/vxJ11iAOelVBut1UJoEzh9nT2mtgYe1RZZdlF4YKNXzt7KRV3daDt/UqP1m1f0Xa0/Joe9rRIhzbjs2DffHeoEpbcQzJnVLtRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgSRP2it2VqWEJo6oUkdTTXnRcYc9p6ImxEtjea60ng=;
 b=K85+MdPWaCC8DIrWspuFMWqoU/Usc1/Q7PHigTDJ3CSdIcK4ZmZj9hw9w6DMqX+cHgAv06/Blx3qtJw+degMXbBRe1o4nfu6d1miAIHkdMX7AJpuYEP4hFzP4Ys1UbQbvJLwfxUMLrpxu6i+lnvyCMHAIceYMNuo7c/cA/vZLh1OWqj2T0La/DeiHSGouZDhXpISu0P2LqaqCxvKxYikVPIP2n6X4+YoW9zeA2nJuUicCr0LDEMeQpkYXkrV2PV7j1CRWqEqfUfY7HATBlXT2ypTb3KkdidVRlOZmuDnG/0OgCf/ABXzW/lxXKauLk4HeZP4Grx0OTUnNe2Z1Pb1KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgSRP2it2VqWEJo6oUkdTTXnRcYc9p6ImxEtjea60ng=;
 b=JmhYVtyfXpz5ZEkKAleJUE7aK6ZWD4XgEbrYV4/2eLZCBaYPU5qZq3vA9uwP9NrssrWROdCStxmUYvGuIOdT06ZtkEkFV3TvGxeK90xqoDFC395LEG676ylS9EH07KFuzf6C31mpNHWaBe5yiUyoSCyZqhcEcoUFWiPsZZYGyee6trjTp4PsfDhzYMtvpKCpRMqTXvgBSmYS/khx8CvIFmoBAJOSzVYqm527qd7DUDCZiXxvWebKQVqzbM+5EerhAq4dhh9CRVag3pWkjSYE0NskGACjtumf+t2Dfutm2pnaJuF2K0ewfTz4MMbQOmUu2cBs4ononcFls2I1Oq8mlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5e516159-906e-a8ac-7e4a-30b007245d29@suse.com>
Date: Fri, 12 Aug 2022 09:44:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: [PATCH v3 2/4] x86/shadow: slightly consolidate
 sh_unshadow_for_p2m_change() (part II)
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <1522137d-cfa9-22e5-64e8-b1795ddbce21@suse.com>
In-Reply-To: <1522137d-cfa9-22e5-64e8-b1795ddbce21@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0395a9f0-a5e1-4d5d-dd61-08da7c367f44
X-MS-TrafficTypeDiagnostic: DU2PR04MB8646:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4TiC/c0KnyCZtD9I3t6kz4xmz6rL0fJBQFe52NvTzbIyxLgbpLULexUaInG5abdf1hqdUZ5+96qJsEdjSjXxrvu9VOiD3dROB3G+Xnf2zAc/TvgE2RjKkWsTt08yS6KmzNDjyHqxs8yv8JEadGsaGkK6ma20bTJ9ypurMbjMANoqqAh9CWAmNPaCECV5YNsVxB7UD6cU8QFsKA+xBWwqwoYJ5KeuKkDuHxfAymnHx/dqulvqFQRsaDS9kHxBDeQ0DRkVHbNNoszX0YXa/TE3WCGDKdUurz+/15cDPSaWbxC/Pkg6idG2epzxvoHAF4rj44d9hykthxxteitQl/MK3JTWy56GhD5qxWFyAlD/vO6ABkapUdXwmTIaEA/oyWuzPb18780RV0/Thge392kDCHGFnjvidxuB1yE44CyDo3/GJa7qDTmGYP5egOeVehhmSPvKgjHnqbcP2wt5Z4FDcB8TwLWDZAmoCxOsZaRgeSZLzlUARB8B+ZBqFiWppZ3HG9HN/GHLlwrVzxk1QY6/IJ83qvJlJdmdC4tB+0DpNPv1gqukPfwCygLdzeaStzM8oZEZy1qXjSoAoIaaEz8icoVCMFlzSL0prFtPNNjZDbuO5IzPul68HErTiPOENTsSUb628FWhVpd6yM9VMRgVsXfXKHjfxr4vw/b6ec6/uF7uUkj1FzgJ5dfBcoyH+swGc3CCUi1K4oMZKBsrZbBYyMHhJoGseUlIfVngA2cIWXwI4OjD9WIhGf3T88Fk/XK8JlpOTg2Hk4fZaIsB92Z4RvkKBgzQTapWD/q021bNaadTyQe8FRdM83tCg1GVJE7lCZERXZVTdr5ziIDZ4RBfogqRARCEBlQx5vcbiaTnHxv5nJT5U9WOtwAix7Oocz5W
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(136003)(346002)(396003)(366004)(6506007)(8936002)(26005)(6512007)(54906003)(6916009)(2616005)(5660300002)(41300700001)(6486002)(86362001)(31686004)(36756003)(478600001)(186003)(31696002)(83380400001)(316002)(2906002)(38100700002)(4326008)(66476007)(66946007)(66556008)(8676002)(70780200001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUY4aVZ1cGFkVFJlQ1BRc2wwbG84Y3N0RHJ6bThGSU01ZytKVUtxYkZhRHJo?=
 =?utf-8?B?N3BnY1RxeVRENFhnRzhWdmhzdDhjV243N1NDSlhpd214dE5oMnNNWGFIZTZQ?=
 =?utf-8?B?aThnOGFuNGFHY3JEaElMSmVac1BsU3lsVFFsaGRpeHlwcTMvRy9XOVc5VDh6?=
 =?utf-8?B?YVJGYzhvRkUvSWtuQnc5NGthWEd5Tm5rNll3RGZ2WVRGM1d1eWR6blNyc1cx?=
 =?utf-8?B?TGlCUEZOR1J1b0oxMXlqSEZwWU1seGJMbndhWlBONVZpZHYzbUZDWUJKUEpn?=
 =?utf-8?B?ei95V0hsMjlaaloxZGJHU1pSVUJqTUtlMjkxMkJScTBsVnI4dnBkbjJ1YnZV?=
 =?utf-8?B?TjBRaWdmWFhJdXBsS05yY2VCR1Q3Lzc0QkFpMmpEUkpyYWF0c0VueENjVFI1?=
 =?utf-8?B?K1ZTZzBnMmMzNko2N3Z5ZkxkakNQazRLUFQzQnZQY2lsYVZYWHd4RzRNUC82?=
 =?utf-8?B?N3BFVkJxd0hlSUV6WUF3cnRHZlExbmMrKzgwaG56ZUM1bERIVERxelExS0ZD?=
 =?utf-8?B?N0tsOFhHSUpQUlphbTMrdzlpUGZEQ29KandGb3ZCeXBjMmc1d0x0bUlQYlZN?=
 =?utf-8?B?SmFRK1lXcTJtSUduL3lOTmdRVHNEZlArbjg1eHZWbDh1OWpFT1RaUDcvQ21s?=
 =?utf-8?B?ZXZ3QU5OK3p0UFp5UDdIejhkQ2tkZytTdFhVT2lFVkoxRHh1Nm5mNm1tNjBO?=
 =?utf-8?B?OWxFK0p4WVJVTXZPSkdaSEhORTk1eWJxVE5YU09Ra3BEQ0FjMmFhY1FiSEZm?=
 =?utf-8?B?ZFlYODlFb1JlYkJ0SDlsVWZpMGN2N29ycEhNMmdoUThMK29ZUldxdCt4VHRK?=
 =?utf-8?B?M0dsQkhseGN3bUJWTDdqVHoyNDAxYUdDZjlYYUZOZXFvVDFudTloOXBHQU0w?=
 =?utf-8?B?ZXMrMGowZ0VPd1Q5QWdjdmx1LzlZeEl3TVdFN2wxTTZiaC8vMElETWp4dzJm?=
 =?utf-8?B?WWZ1N3J3OGNXSjBPc1ZqUzVJeWdSa1p2Z3B5SXEzdW82bDd3K3J1WXo0RVBu?=
 =?utf-8?B?WWVSNkliSFIxVXZDSzR6YlE1cUZEVzIxRDNyS3lZWG1yYXd6T1dONDlPYWtu?=
 =?utf-8?B?SDVEUGdoSHpGRG1UWjJDOUZDTm5sd3J5bHRRcEZGUHpqZWtRYi9RaUdXK0Iy?=
 =?utf-8?B?bGZZL0R6Ynkrc2VJcTRQYjRGZHFSQ0RiZ1cxQmxpV1BvMzc3b2FOY0x6TFlX?=
 =?utf-8?B?M3ZGckcxNmpaNmtRUU14MVkzNkZudnhpMU5POUNVVjZYcXpxNTJFSk1ZeUlG?=
 =?utf-8?B?Rkp6SUtFTHJYT0J2anAwS1VPRG1YSTEwK0lMeER5NklXZzRTRFluVHNNM3M1?=
 =?utf-8?B?dTQ5ZStSTjA2LzhEa1ZwcnJxVXUyVStSa3Q5K3lCVlZxbURTR2E3YS91aWRp?=
 =?utf-8?B?R2NYSHZkU2xCaXhyRTZSOUtEazZXaWdqckRLYXZ3U1FpRGhZa1hTVUtXV1Jj?=
 =?utf-8?B?aFhxY1l5MTFZZDFMNGdaWWlYQUtSSXFoeHV4N2NNbFBhU3hKQ0RoQXZ0MzVE?=
 =?utf-8?B?ckk1eFFJZHFVZlFpbk1sTXBUSkdvSzJlWTBYQ2tXWE8wRENuS0lxeldKOHFw?=
 =?utf-8?B?TWg3eXJlOWlZME5zVS9wVmpqTVNoR3FSZmhvQ3YrSWlpdzdHdWlqbEwzeDMw?=
 =?utf-8?B?b1hJKzB4V0JEOTRkaUszQmtwZlRVZDkvY0tlZXBRMi83NUtSaTRuLzlWZXNX?=
 =?utf-8?B?T1VBaEw2R2oyWWFVQ3dxQmZ1RnFMczBBbHB6OVc3TVQ2TkFsUnh6Sm81b2Ru?=
 =?utf-8?B?dHhkVnl6RWFTYzZacnQydUlyRytyWm5ZRU1HV3VnQXpzeXZvalVlWXF1c3Y1?=
 =?utf-8?B?eUhrdk5XSDM3dUl4eTI4MWlIc0s3RTBsNHczU1RKN2tkZkUxUjJCbm11Zmsz?=
 =?utf-8?B?Wk80M2dQeFprOC9iZFo5SE13RW40cHhHMitlSFpYenZJQmVHWFp2dnU5aEpx?=
 =?utf-8?B?dUxNUVZjVldGdDAxQXYvTDljcUlJL3V3YjN5UlZKdGg3U0NiL3YrWlJJZDRB?=
 =?utf-8?B?cnBMb3lUQ1BOMWNIbkh6bUVNaW5oSTNRdGtCUmlUZVNNSHpSSjBFS1AvTVND?=
 =?utf-8?B?M0dRMjVBQzZlOG1seFgrQjdXN2FxSW1lajZ3K0kzdk1wVGNEREt4eG1mWXB3?=
 =?utf-8?Q?sW21zCMWtJ8gn2cG+TDWddass?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0395a9f0-a5e1-4d5d-dd61-08da7c367f44
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 07:44:33.2581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IrFS72cqFhR8viF+5F+ePnIU/HpEjwXkbLEBPEDlXqv3dby3Z88DQtF/CH8N03+74job1ETWCBQjzAf7FAowNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8646

Pull common checks out of the switch(). This includes extending a
_PAGE_PRESENT check to L1 as well, which presumably was deemed redundant
with p2m_is_valid() || p2m_is_grant(), but I think we are better off
being explicit in all cases. Note that for L2 (or higher) the grant
check isn't strictly necessary, as grants are only ever single pages.
Leave a respective assertion.

With _PAGE_PRESENT checked uniformly, the suspicious mfn_valid(omfn)
checks can be dropped rather than moved/folded - if anything we'd need
to compare against INVALID_MFN, but that won't come out of l1e_get_mfn().

For L1 replace the moved out condition with a PTE comparison: There's
no need for any update or flushing when the two match.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Compare PTEs, not MFNs. Drop mfn_valid().
v2: Split from previous bigger patch. Add grant related assertion for
    L2.

--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -810,19 +810,27 @@ static void cf_check sh_unshadow_for_p2m
     if ( unlikely(!d->arch.paging.shadow.total_pages) )
         return;
 
+    /* Only previously present / valid entries need processing. */
+    if ( !(oflags & _PAGE_PRESENT) ||
+         (!p2m_is_valid(p2mt) && !p2m_is_grant(p2mt)) )
+        return;
+
     switch ( level )
     {
     default:
         /*
          * The following assertion is to make sure we don't step on 1GB host
-         * page support of HVM guest.
+         * page support of HVM guest. Plus we rely on ->set_entry() to never
+         * be called with orders above PAGE_ORDER_2M, not even to install
+         * non-present entries (which in principle ought to be fine even
+         * without respective large page support).
          */
-        ASSERT(!((oflags & _PAGE_PRESENT) && (oflags & _PAGE_PSE)));
+        ASSERT(!(oflags & _PAGE_PSE));
         break;
 
     /* If we're removing an MFN from the p2m, remove it from the shadows too */
     case 1:
-        if ( (p2m_is_valid(p2mt) || p2m_is_grant(p2mt)) && mfn_valid(omfn) )
+        if ( l1e_get_intpte(old) != l1e_get_intpte(new) )
         {
             sh_remove_all_shadows_and_parents(d, omfn);
             if ( sh_remove_all_mappings(d, omfn, _gfn(gfn)) )
@@ -836,10 +844,11 @@ static void cf_check sh_unshadow_for_p2m
      * scheme, that's OK, but otherwise they must be unshadowed.
      */
     case 2:
-        if ( !(oflags & _PAGE_PRESENT) || !(oflags & _PAGE_PSE) )
+        if ( !(oflags & _PAGE_PSE) )
             break;
 
-        if ( p2m_is_valid(p2mt) && mfn_valid(omfn) )
+        ASSERT(!p2m_is_grant(p2mt));
+
         {
             unsigned int i;
             mfn_t nmfn = l1e_get_mfn(new);


