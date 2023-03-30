Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 885466D031C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 13:27:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516632.801065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqR7-0007qG-GL; Thu, 30 Mar 2023 11:27:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516632.801065; Thu, 30 Mar 2023 11:27:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqR7-0007nP-D7; Thu, 30 Mar 2023 11:27:21 +0000
Received: by outflank-mailman (input) for mailman id 516632;
 Thu, 30 Mar 2023 11:27:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phqR6-0007nJ-94
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 11:27:20 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4e95526-ceed-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 13:27:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8468.eurprd04.prod.outlook.com (2603:10a6:20b:34b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.21; Thu, 30 Mar
 2023 11:27:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 11:27:18 +0000
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
X-Inumbo-ID: d4e95526-ceed-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dC8UDeNwCb1fDsND3XweZkNMR2xrS+GeOZ2+bng0t6GCuHSv02U4YqmSQJzE+I0V7XlK+lyJ10cE05tEUr2Q35yqLlAKpHbKkvLDWxmVVQsusq+pOKL4GeIiEMnDgOjUqJzBODfaA9lDwN4GwDouf6Y/kQ64snED12TORLVmuvO7i9vc4oJQNj1SjyT1Q2ADytN51qtbBLTRVqYttcHpbyjDcLBxHNQA1Az0DFH7VZgtEtLzVVVnpgDNuNn3PacB9EPF1LSz+IKV3apciaVjH5lzurI6vQanqD5jUEtFeJ5KSOEPhWvLvyz+Yqosz3j2nl+unJ1L2FKmg01nFFUSiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ue41tyDmmg6PevYB5Qc1ThieQRcpS48A5cxO6+NoPwo=;
 b=WLSm8A9L1tdmWGODm6ZDoIfx+IpwmJn2iz2DcQhkGpE6IKHgKegb0cIuiGnG5FE2FRjnyQYFV/lqKawWzGqEkVltiPdd86pGaBxsegWf5O4L+AbsJ3i9Qpwd12Ho1i+S2orY9W7T2KtP6UHi1iyK/w5j82Nv7q2+j+kQrwIhNG2kbkOtiATj/PZlkgaWwth6Doq8/1fKfS5kSkoOd4BrkX1GJYTAjPATeOsy+mDzvX1H1FhVi0/0LzFyiLxoDRGkpP2XNr5kV2jPL8OTxoQJ1gRx4uZXwMey2O/MCOKaV2uuw7NNPYh8DA1Z29pmXw60xIDWfewyNXhx/M1lL1FmQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ue41tyDmmg6PevYB5Qc1ThieQRcpS48A5cxO6+NoPwo=;
 b=iAOOAGY1E4Gdlrr7FHuxXKKj5a2/un/Eq/RLSi7Pql5/FIgRH3dtqtf4+t/wcYAX1owY0UiAKyJVNU0oBaaFxJwhoqIrdLP20qWnnW8wQckorHFg87ynfCSK42Y/Da/DB7EHUch0OcO16UWLrGvv3ntDYljvhhVlifxAxYRRJhyDl1vJd72zj3BD4/+3X8QYZ8l96COD32+UWyIEG/gerBHrKvcn3AGmdCDjTann6K5I6L90gDZ3pkMg0Cf96v02Vaee+RiivIso+xz5POCG5WPiGCIOuHzlt+A2VWpIEI+wmjP3APQAm/svcDb/XX8/1XDQnz43jYlC6I4lF+khUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8ab32f85-d0d5-956d-9375-829e578c65d5@suse.com>
Date: Thu, 30 Mar 2023 13:27:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH v2 04/13] x86/shadow: call sh_update_cr3() directly from
 sh_page_fault()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <fae14dc0-83aa-4647-6755-dd6913b6dba4@suse.com>
In-Reply-To: <fae14dc0-83aa-4647-6755-dd6913b6dba4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8468:EE_
X-MS-Office365-Filtering-Correlation-Id: bce404f4-7a21-4de6-99c6-08db3111b87b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	544vpSndasg0eolfvRm13QOmNe2vn5/NjCm+eq/NKmkhtpG7N2pXm0PnJNgJ1+UCrdUT8JeyQclreuQ9uy0mvZpVzsda0QairrXrCBUoAHTqd8qdjRuo8OvhZb+oFucuZeulMpAbhTMALDTZyQPUOLd59w9fgFyxjcbI7QxLBkzLcmzZRN6wnbXN91V/84/+I2LfYXy9f2rW9Byca/1FbNU8m9zvMRGGEFvqeJOBNpT4/jb6HDL+FJS3bVHejw2ZBpExC/dZXSZ5q+KbPpU3+CCxCG3K3AqpiVXwa8Mx9qGWDh94Cz8twjyp7Cyb/lo7X/uujBDAlwfJBAzqZ8J1vv7dT61IE7UTmhbHzj6pYfOXLJZ7i/kYjSt/XB9h7n6xDj+oe5JkQiJOa2dg36kUnL5zzBRpkyIyxy5IHHwPgxbkhEeoEH/xE5Ef2nZtySo4bIY842FQKHTP9aBAoKQdp8tHCmMXfoTldJfo76+M2adDvrLkBxtG78BbBHt7hbwiI8KKAgk3BSyFmY25StMj4dvSvtAF46/3p2kO0w2dOGQDdgDVrKQpf2P3ackw4ixMtgI5sFHrQgAX6L6F1lO6Fn+jDACVVuC+a5PsEp1v0JX3mMc8BJpEPXCrtO2DrPdwxgXTzImnjq11Hrg7+bKKog==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(39860400002)(366004)(396003)(451199021)(2616005)(83380400001)(6486002)(478600001)(316002)(186003)(26005)(6506007)(6512007)(54906003)(2906002)(36756003)(5660300002)(86362001)(4326008)(6916009)(8936002)(38100700002)(41300700001)(31696002)(8676002)(66556008)(66476007)(66946007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cW1mL2hXaUorWHV4d2xtSStqR05vcXJXeHhwcmxHSmZ2TFRoRHdaMlF0TDBx?=
 =?utf-8?B?QkZUMUhyVkNlWTIvUUdLR0dYaEtINVZxYXV3QjI5dVNEZjhncUZ6cThsazdm?=
 =?utf-8?B?cGJ3M2JSUDhjSndFWVk3Z3hXNnVWN3NXaW50N2RCQ3dLQWplYjJWRmdNVDBw?=
 =?utf-8?B?SmhVbmpubmR5YVllOWtwSzV4REdWTTROMmIxbXl6MEhTMGQyeGxCL1pJWGo3?=
 =?utf-8?B?REw5UnliWWNVcVc2anh2RkF2Rjc2VFAxaXNha3dTMFVJRERuaVNONVV6ZURQ?=
 =?utf-8?B?ZDk4b3pjRldlNnFIdUc2a1VYOG5wanVUOFQwRkpxZ3hyMGMvMm1kNUJqNXpx?=
 =?utf-8?B?Yy9aeURESXBPbkZpU3ZyZEh1N3VVUTlUeHhyRG1FTjhqZU1qamJhMjQraldF?=
 =?utf-8?B?RURnOW1TV3I5Z1RrOGxEbjZyalBwZ0VYeTRENk5UamNQaWhyVDdacWFHNnNV?=
 =?utf-8?B?SU9wZnV0VjRoMTBickdHaUEzQjJvck1CbVk2VFJvQlNsZTBhSjZicTFqbVlt?=
 =?utf-8?B?MkYwQ2VYckhNMEdJUmtwVGJBR3AvUmQ0ZmY3QzBFYU9nalRQZTBJKzI0c09C?=
 =?utf-8?B?MTlzYTk3Tk9UOStuV0c3L3FEdlZpQkVLSXpPeWE1M0V6MG5iWWsxcS9SdVJN?=
 =?utf-8?B?bC90RDFqc2YwZ3U4WlQxdkhFMkNKTkxFL3o5N0hOSzc0TDBnSzhYSGVqV051?=
 =?utf-8?B?MkljbkVGTG1ROXVVQ0JMN29Ec0hSLzRma2hjVzhIcnJhNzRiOTJ0UkcyNSt2?=
 =?utf-8?B?SkpnUVY5UGRVWjQ5N0VEcUp0MDZ5Wnk5NWFtKy9VSk9ZS01TWm1jTDFCcnJ3?=
 =?utf-8?B?WDVZSi85YXRJR244Z2Ixb0p6a0xjODFjUmFFcUE1emhXTTg1a2VnWlJ1YTNv?=
 =?utf-8?B?bTd4SEpUU1FUNHZqOEhPb1hPQStXOGE5cEFMVGVBMUpCZVlOZng1OExjTGtU?=
 =?utf-8?B?U1pudzcxUW02amtsWXg1ZkR0TFladmg1ZWNUU1lZT3BnZTdzN3duTm5HK3c3?=
 =?utf-8?B?aE9CdjEvSXBQRjV0b2NNVDlMQjNkYW5JSlNES1luV0JCc25tYmFSMG9KamJu?=
 =?utf-8?B?RGhpZFZrUURGNkx6ejRncEgzd0U2WStYbkN5K1g2WVRUTzc4Z0ZzaXBHQXR0?=
 =?utf-8?B?bnRzR1NPTWFVa3hITVJLbEdoZ1FxbktzcDRCeExlenBHU2FhY05SZ0Q4RzJx?=
 =?utf-8?B?MGFUVFo0Y2lrcmYwQkZMbXBsTFZxRU9NVEZ6REdxNmtaRHJFeHpHQWFSc3cz?=
 =?utf-8?B?eXRFZTFSWi9keWhnWnQ1MnZhY1NKQ01RMWUyVEpsSTRBTGxLSTlVb0ttS2RZ?=
 =?utf-8?B?MTl3SGJQWmRKR21Jbko4WnI5TXJORUNHU3hTWXJoOExzQVZvZVV4eitYWDg3?=
 =?utf-8?B?YkVOT1ZsYmdxMjNhQm5yaFFEUWpsVlN5eXNrbFVPOVRmcEt4UTRCb3UyKzFa?=
 =?utf-8?B?NVZrenJocW0yRFpUNjkydWNpOFVRanY0cUhjaDlqeXlSMkhlUEFDWFlmYk16?=
 =?utf-8?B?WXlTVWJ2YjYrMTNIdXVmVHJaZk82aDd2Z09oWDgxUGlNcjNpcXArNnlNbVhq?=
 =?utf-8?B?cGVrRlhZTTcvKytORTcwQ08ySE9FOEpUdEFkT00yUEFnNCtpQzFGMVdFSVd3?=
 =?utf-8?B?ZEg3TnlPVk9FOVdwVHl3NWsxSjR5ald1QXVoZGIvdk12V2I2N0dCaTdRZGxC?=
 =?utf-8?B?dkZRbVdpVmpJNDhwRy9FbTEraXdWWTBmaXpTeWFBK0FRZ0dLYU1oSUsycjUx?=
 =?utf-8?B?NnF6T0JIQUE4SHFJbFNpUmNSMmV4Y1dHRnZnL1c1WmhFb1lER2JCZSsyVGlZ?=
 =?utf-8?B?NlpDZFlsWlA2NWJ5Uk9pNk1kb0t1QThTL0ExZE50OSsxWWQ3VDJCM1dpZW5i?=
 =?utf-8?B?UHdOejFKR0tWUGs1Qk1jRnlQUlU5R3p4UXVydlVzT3BCTlBTdFhpakdJQ2pI?=
 =?utf-8?B?ODNoTTdORTVEY3hDWDJNZ0o0dkZSdDFkK0VlNVV3Yk14d1kvRDIza05OajNJ?=
 =?utf-8?B?dzN1UUtGck42Vys3alV0elFjVUo5M0ZCU2g1SEx0UlBncWlVL2Zab1U0OWI2?=
 =?utf-8?B?V2F1NjBHNlFndHR2bWxXbkx6SFhyNzhwNkxBZmFFWU5qUmptelU1Z2R2YlRr?=
 =?utf-8?Q?T+NcsELAHc3mUl/W7ETjvJAwu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bce404f4-7a21-4de6-99c6-08db3111b87b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 11:27:18.3537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZlAprwsSTY/ZAzx4JNVaReyfPSFwMp7tkIbUsnZ1JiKIvtpP6NHLfACLY2R5M9uQ5Ekdt17VW/7/z26lVpvSjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8468

There's no need for an indirect call here, as the mode is invariant
throughout the entire paging-locked region. All it takes to avoid it is
to have a forward declaration of sh_update_cr3() in place.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I find this and the respective Win7 related comment suspicious: If we
really need to "fix up" L3 entries "on demand", wouldn't we better retry
the shadow_get_and_create_l1e() rather than exit? The spurious page
fault that the guest observes can, after all, not be known to be non-
fatal inside the guest. That's purely an OS policy.

Furthermore the sh_update_cr3() will also invalidate L3 entries which
were loaded successfully before, but invalidated by the guest
afterwards. I strongly suspect that the described hardware behavior is
_only_ to load previously not-present entries from the PDPT, but not
purge ones already marked present. IOW I think sh_update_cr3() would
need calling in an "incremental" mode here. (The alternative of doing
this in shadow_get_and_create_l3e() instead would likely be more
cumbersome.)

Beyond the "on demand" L3 entry creation I also can't see what guest
actions could lead to the ASSERT() being inapplicable in the PAE case.
The 3-level code in shadow_get_and_create_l2e() doesn't consult guest
PDPTEs, and all other logic is similar to that for other modes.

(See 89329d832aed ["x86 shadow: Update cr3 in PAE mode when guest walk
succeed but shadow walk fails"].)

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -91,6 +91,8 @@ const char *const fetch_type_names[] = {
 # define for_each_shadow_table(v, i) for ( (i) = 0; (i) < 1; ++(i) )
 #endif
 
+static void cf_check sh_update_cr3(struct vcpu *v, int do_locking, bool noflush);
+
 /* Helper to perform a local TLB flush. */
 static void sh_flush_local(const struct domain *d)
 {
@@ -2487,7 +2489,7 @@ static int cf_check sh_page_fault(
          * In any case, in the PAE case, the ASSERT is not true; it can
          * happen because of actions the guest is taking. */
 #if GUEST_PAGING_LEVELS == 3
-        v->arch.paging.mode->update_cr3(v, 0, false);
+        sh_update_cr3(v, 0, false);
 #else
         ASSERT(d->is_shutting_down);
 #endif


