Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF7157937E
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 08:51:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370392.602138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDh5E-0007yN-CO; Tue, 19 Jul 2022 06:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370392.602138; Tue, 19 Jul 2022 06:51:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDh5E-0007vO-96; Tue, 19 Jul 2022 06:51:52 +0000
Received: by outflank-mailman (input) for mailman id 370392;
 Tue, 19 Jul 2022 06:51:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UBo5=XY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDh5C-0007PT-20
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 06:51:50 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60060.outbound.protection.outlook.com [40.107.6.60])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 430d8ea7-072f-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 08:51:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4864.eurprd04.prod.outlook.com (2603:10a6:803:5d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 06:51:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 06:51:47 +0000
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
X-Inumbo-ID: 430d8ea7-072f-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKXvUG0OV/UPnNhsehUSZ+3S89HUpoWJSBHAe+DpWBSk7ddS/VemjKezEgIqkf1p4E2RRt8pKXCtMtY3+zlNmBNHcSyoL9Sghz2Sr1u9Ce1UExpuwPX8WDf13DyJMtdj/DOEDewcAAoyJrsQMXSWR9W5bth4aNhy67xjt/WeH9yVXmEhD6+vkqXoiHjxOtYREAOk4iWvj4B8IKdmqvRFbH4bkTQ4w0vaqdsgDiHsFbgAUeoNOW/vmpJ4Rmd5lGj9zYE4iTV9se+j6gxIcTI7HPEYiLYuAE6vl6GwKbXkUt6dCXwZNOmxJEmnJ6g9wzlI0Ht31Ojkk1kOdVx0jzK7Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/85LX8vVEsmVTn+P11FrOvSAKeuh/W8CeK3ApKBU1M=;
 b=fPr19Iy+ho4ZIo93SFtOEwThfKn/m15xv3LYegp1QIw0myQk/r6UYMAh2Azaq34gmgXnWOjRFLc7V9OBp+twtCp+SQPWYuIP0CBJqr6UgOSJBk7NjU8uZCd7fS86P8u/UGAwSixcnyBwElHfqr8pi4n6lWdNcYv4Dw6oSjHOVsFxXIZHntKQT28YVx1FXyNAIlf4XhqRudzQlPbup3kCywzqBqgB5T+CAW9MCWhh/nWD41q0SDNVEDu0nD33apVl7Aql9/DaRXLndnzdqDaq4+ZdA8RIiUklz6+es/y5tPJjf3FNb7KdnQYiHGLuTub+sp/TrMLzKTd37JXtd32AuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/85LX8vVEsmVTn+P11FrOvSAKeuh/W8CeK3ApKBU1M=;
 b=T5R32DcfLrTWi3cXr6J+hYRN5WrWllGMW+QwPsSVxzfoLEjkYx1mHiD+M+VVcHSEiFBOOEEJV78+C6gucdmkJ6VLd/BNn5e+eZ+4J/dHVCRmj1XerZMavw7zq8MW7uWKQyi3DBfqEE9HSILc4JeaUoJf2HYDm4yPernPKlH48JIIMXKwdmo/DKBZgP9Ryl7652POMo/HVr9bAZlDk0gYUmTVZ99Bw/t4QyDXn+1FkybadrXOfMZZBo/m2zPrv6Ge5ctwHDfXtsprNvjEwknZtu4ocUg3hS8DDYXaoELVhpudtOey9D5yiXwKGuAHbtw2Aomd+VgJFSbZVoRJBc6YWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d9560fe7-685b-a627-12b4-bc2222616941@suse.com>
Date: Tue, 19 Jul 2022 08:51:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH v2 2/4] x86/shadow: slightly consolidate
 sh_unshadow_for_p2m_change() (part II)
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <1c14781b-e1a2-e049-c0ea-a12585f74e7e@suse.com>
In-Reply-To: <1c14781b-e1a2-e049-c0ea-a12585f74e7e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ec5c356-88b5-4d61-efc3-08da69532645
X-MS-TrafficTypeDiagnostic: VI1PR04MB4864:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FYzEQLiY7H9SfWs7udh7/lOXUB6dkmWnNuBjgG7cTACk2DdK/9UHfnF/CH1fvqWVdEpacclTmWJ53+gztzpjiUBWYcjHmA00aVWIn0VeFzS2t0/GrOVWW61Q0JT3Avc3AbOAsPV3rdX4HegOByON+PW/HYD3gvKcdOLKq88YFUBmyzsheyhzi0s4A1X1rFlCn7kcBE5gs960HBdxCDYXdd1FC3h6OiNjddlPgcAcBEzzrszAxJgrrovv9g5EmFkCqvOoJQdl7MNSAnpNBFsr2U+81jVUr2IrboWbS0BhxVpzbFQQ9HkYvclgBc0M68dOle3h63KI7/iDs8OKtTonDemoRdegnk6vY7tzlkg13P5a3WBWmecAGg5uYiGXc/HSLwA5Kqd152atiAqWKSoMeN01t45GgYUPedbpc5xw6BOzSxNhjwJSXPoyMzJ4OpVEi1kSCchd1Lj189pJur9P+T2jFEoa7uhrVyjyGTvspjHY6NagPfRmK/NfUFSj1PZBhEUIt4AMO/jzE+lyCFisHLz9zgSQT71ygN1bmXT/Of8HJZwBnOidVOXmLCYX4hwnii4J759IMeMRf4doL6LElS8fJoCQK7QeSxcAPbGjcvmc3ZUmgC+6nNiTzm8+appehlI3J9dOD25vPrqg4nELyKayn6nWB/ZWbjEQIKntgZ+078ygUAJOXBdLwTBnm4vj02gRLv/VdBWZsj4A2b74rZFbLYsusU5c72pox1OPKlg7w0N6uWH4AKlELEiNCucKoxsuB6nAkKPWxtyMEQX1w1/65a8WU8a6Ag3wyRUfAV0fLWbLV6JT7xSWiIJrZuukzZpE7NnMwNSXhCQun4vUYzoIwXeXzxCbjXGV6kDjeMg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(136003)(396003)(376002)(346002)(83380400001)(316002)(6486002)(478600001)(36756003)(31686004)(41300700001)(6506007)(2616005)(8676002)(6916009)(6512007)(186003)(5660300002)(8936002)(4326008)(66946007)(66556008)(66476007)(26005)(38100700002)(2906002)(86362001)(31696002)(54906003)(70780200001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTd1UndjWHhzL0U1TkN2djI5bmh1S3F3dHg0OHN0YW8wZlFNRTNmRmF0dE9L?=
 =?utf-8?B?c3c0cmxFSUdBaEJwNmJnY0dQSndyRmxnTGczWEs1OUhCY1dXdFRxRE1ZK2Nx?=
 =?utf-8?B?ZUEySVJCaXBnejB4Z2FJdS9kZTdZSGNMNU1pcVBtclc5M05WTzN3bGUwc3RW?=
 =?utf-8?B?bllYU1ErTlM1SDdaUnNaN2piYytXMDBWcVUvam5la2Q3cmtaaXhSOGFxTTFi?=
 =?utf-8?B?TjB2M251aUtoajFpMVBnWTZGeFpvOUxDV1RBUkUyQ0ZpRTVub0ZUK3lVWG5G?=
 =?utf-8?B?Mm1xQmJEeU11REVpUkFGajdoMzU5N3dTdUZTd1dYK1dEYnFNb1NEYyt1bDJw?=
 =?utf-8?B?TUxtb1RGSXRCSzJta2lJdzFMU3Rxa2FjMldNSXI5MGowUnZZWmtYSng2UG5y?=
 =?utf-8?B?OXBWZS91NGFQS1QrK3Z6cnVoODQ2SWhvRGs5ZXp6M2hnbGlQUmZsR1ZvRCtU?=
 =?utf-8?B?eDBNR0ZWTFo5dVA4QUdqcFkvb3pHRmZReTNjK3llaWhhdXlYV1lQUnQ1ZzVp?=
 =?utf-8?B?eTAwTWdZL3o1dHVQckFLNDFGRHVZQVhRa3BaK2g4KzU4R0hRRDErQzNEdXpt?=
 =?utf-8?B?YU1yUEtPQ04yRFBySStlUkhNckFRZ1VqVVFsUlRIUXRWTkhYUU9TcTFxbTJ4?=
 =?utf-8?B?TGFLdm11NUpsdkxXVFd1SHIrRERWcGVWdW9ubTkyNHpBa2RSY2IzcmFqUnRW?=
 =?utf-8?B?Q2lROWxJT0o0d0ZScThmeWIzQmVoaXJ0eUo2a2lHM051Z1RCa3pvcmlMN0ps?=
 =?utf-8?B?QXpRaUZOWTJIdkROQ05xTnN4QVBscEwyakx4bElnMExVV2RwOUI0VGJyTkF6?=
 =?utf-8?B?bG9nWEJWUWt6bDd3Qm03NVI1R1dOd3Y3ZTc1cnJNWnUxTURtaFJtMkhJbnVm?=
 =?utf-8?B?Z1lwUW9qYndRWnRRYTdwZEFZa2pMUkh3djI5SlMrTzFxZjZlNGJpSkhqS2RW?=
 =?utf-8?B?SVpHOGVKbEw4VDkvN0Z2K2ptVHlGYUNGZjY5cUpHMmxkM3R3MWx1QmRmU2V0?=
 =?utf-8?B?VDRiK2pMNldScDlsSWorWnlzUXY4dVpQK2Jpb3E2aCtoK21LNFdEbUJ2bzcr?=
 =?utf-8?B?ODh0S0JrM3p0aEFNYlRPTXMzZXZ4TjZVVlQxRzE4dWZMbGEyZHVRM0hCQTFN?=
 =?utf-8?B?YlhxYWc4NmEwb2VsdWNpcHNDMVczYmRDZk1tU3d6eFl4V0R3Qmw2OGZYZW9B?=
 =?utf-8?B?R0VaWG9Xc2UwdTBHb2ttVjFRc25oN1dtZ2ZrN1VKb1NWUGp1a0FtcWtnVGNT?=
 =?utf-8?B?K0hkNnYvQlg5YnVwTTFBYmdtamNxcHBSMlkvWDAydjRRRkQrRzZpQWxRN0Zh?=
 =?utf-8?B?ZndHQ0U0aEZtc2ErSU5reCs3cStpaVVjYWJkZ0lpcGtPdjFNOS9xZndqTXhL?=
 =?utf-8?B?bXF3K3cvc1hLdXVWZFZUMTJyZExNblgyeTZteTZBTTJmSVBiM2FUeFQ0RzVR?=
 =?utf-8?B?bWJMd0tseDZJWCtncHdWa0lLdU5CbHVqakZ3cDJJSXRvTHlTTjdqbGdma0cr?=
 =?utf-8?B?RFA5WHo1VmpDNW5qWG04L0ZEa1RsZUV1RmFZSHZPbGpJczhoSkZFd3dSU1kw?=
 =?utf-8?B?bzZTQXl5c3R0czlkN2oxenVYRXM0d21wR2hVYXdnUStmUXhkeGZDdjd1Qms4?=
 =?utf-8?B?QXJYM2U3NjUvMWMwaEdJZXVmZTU3ZTgzSDNMV01BbVAzejlMaU1kN0gvTHo3?=
 =?utf-8?B?dSs2a1drbVNuOG9MSlBZTEJTcjg1MXdHR0ZWZFVIS2x2VWhvMDVWREJDN1NU?=
 =?utf-8?B?U0tpby9SS1FXVzhUQ1FNVlc5VDBiOGlLSSsxTnhOZnh4S2xUVE5EaGl6b2ZE?=
 =?utf-8?B?N3EzSnRyRTlLcmdpU21MTEg3UGUrZkZiNTFZeEozWGs2VTR5TjZSVlRqNlZW?=
 =?utf-8?B?V2tGbVd4RVBaMVpvNHVyWDRUUmRvQ0FDeHVIdnVxSXBhTTEyY3JVSVB4YzRL?=
 =?utf-8?B?cHBveE95Z2lkTUdUZGUveFRnSkpFM2dZR2tlR1BVYWpxd2NWRUZVZFBxMHA1?=
 =?utf-8?B?c0RaMjNUdUw5ci8rNHQyYUpUdkJ3eTkvMk5Gd0NSRnZCT2JvZXZFdHdIMU5N?=
 =?utf-8?B?NktFMjVZN1pHMmhqMmVZSW9VRGpPWlFySXBBRFEySzBFcm1FakRTeTVnakRK?=
 =?utf-8?Q?D5nuBQ3eSJ4vQLlR7yT9x8NQ7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ec5c356-88b5-4d61-efc3-08da69532645
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 06:51:47.2759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ru1h3ajhoveGDcLbf2T0/egZRjZ3z6MI2NEz9nf5UV8q5u3JYz7898SFCrkQdJSZ5jv8Nx1MzOkwaBId0bJTng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4864

Pull common checks out of the switch(). This includes extending a
_PAGE_PRESENT check to L1 as well, which presumably was deemed redundant
with p2m_is_valid() || p2m_is_grant(), but I think we are better off
being explicit in all cases. Note that for L2 (or higher) the grant
check isn't strictly necessary, as grants are only ever single pages.
Leave a respective assertion.

For L1 replace the moved out condition with an MFN comparison: There's
no need for any update or flushing when the two match.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Split from previous bigger patch. Add grant related assertion for
    L2.

--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -798,7 +798,7 @@ static void cf_check sh_unshadow_for_p2m
     struct domain *d, unsigned long gfn, l1_pgentry_t old, l1_pgentry_t new,
     unsigned int level)
 {
-    mfn_t omfn = l1e_get_mfn(old);
+    mfn_t omfn = l1e_get_mfn(old), nmfn;
     unsigned int oflags = l1e_get_flags(old);
     p2m_type_t p2mt = p2m_flags_to_type(oflags);
     bool flush = false;
@@ -810,19 +810,30 @@ static void cf_check sh_unshadow_for_p2m
     if ( unlikely(!d->arch.paging.shadow.total_pages) )
         return;
 
+    /* Only previously present / valid entries need processing. */
+    if ( !(oflags & _PAGE_PRESENT) ||
+         (!p2m_is_valid(p2mt) && !p2m_is_grant(p2mt)) ||
+         !mfn_valid(omfn) )
+        return;
+
+    nmfn = l1e_get_flags(new) & _PAGE_PRESENT ? l1e_get_mfn(new) : INVALID_MFN;
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
+        if ( !mfn_eq(nmfn, omfn) )
         {
             sh_remove_all_shadows_and_parents(d, omfn);
             if ( sh_remove_all_mappings(d, omfn, _gfn(gfn)) )
@@ -836,13 +847,13 @@ static void cf_check sh_unshadow_for_p2m
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
-            mfn_t nmfn = l1e_get_mfn(new);
             l1_pgentry_t *npte = NULL;
 
             /* If we're replacing a superpage with a normal L1 page, map it */


