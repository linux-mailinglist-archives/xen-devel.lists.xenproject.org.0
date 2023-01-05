Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 102FA65F0D8
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 17:07:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472049.732154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDSlu-0006VN-14; Thu, 05 Jan 2023 16:07:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472049.732154; Thu, 05 Jan 2023 16:07:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDSlt-0006ST-Tu; Thu, 05 Jan 2023 16:07:13 +0000
Received: by outflank-mailman (input) for mailman id 472049;
 Thu, 05 Jan 2023 16:07:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lIpW=5C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDSls-0005kL-Au
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 16:07:12 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2083.outbound.protection.outlook.com [40.107.104.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02f3f296-8d13-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 17:07:11 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9432.eurprd04.prod.outlook.com (2603:10a6:20b:4d8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 16:07:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 16:07:10 +0000
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
X-Inumbo-ID: 02f3f296-8d13-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWrIEqMbpyYPKBp72HL5f48dhXvraNwHfPslAXimjYCTBZdobp4Ly08KfFp8+86rDHZuJH8D+FLtd0bY6HUgytiWyUKZDRkef/IDjnHKv0i9hMDK/SpuwDnkf4oo3wANK9lxTXqDlssTOkNqzJcA8R/rF7xdshIloMMQ/FhjSb+KClg3LqisbR3tcYC0vCV6VQwhU+WeER1WFbNni/nkAKWLWpsKgnMKusAjHIssgr+9gipNzw9K6op3Y8LjuiarJpp+Sm20vTEaW6vD2tqXhsQ80rMjGZn7uC8c6MAY2US3Iy/mYk1hfdsj8zJrB61mXpjg14TuYfKl52QfolDC6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOUOzfolYR+T2htvQf9ACsmsUnGdPR9fDgi+OoWIHI0=;
 b=Wg+B8UTW5zEDkrK57UooT4YDqKkAAv9kO63FjwiESgumJVqxqnNo3eEzJ9B/mYrN6R1S/gM6K9xJjZkIGziH6YhAc/tSyWzMccv85knW/mHkKMOLt6iLFLd85vGErOjSTq2Xv5PpPqyrHYgqojo237s7mIQO4LgTZaP5XjyY1Kpz/SbA57IooXFeoWF9oKx74+DL5KqKYVX1ofhnYp9qJ6HHLi2nS7kmmiMu1rSaowgpBu1PUAK2awRyDjAwyg9mQOkbiIVI9GbhU4P3xhxhNlYIcpPRl1JOh1QYaaqtDO1DqSrckrU4snjIbTpRxDRZGap5dAYfTItR5uyk/QOofw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOUOzfolYR+T2htvQf9ACsmsUnGdPR9fDgi+OoWIHI0=;
 b=z17qbJaR+U8+QysUbU2feN+Njj0RrcgbeisU+ko/35QZqOwpFkiT9t78+nxfwEVfst1RaZWU2eJZ2SIJUjzwK8rVpaH+NRXIq45ikCbXnaNzD8QEQ3NUmk4YOG0A6TguLDGKFMlKyoPbk3AmAK+kZsdYcB2438bw0kLRM/VQ9zRlw9GL4G7/yHBwoWZ0W/+T+XKEySu9UBJtIdCbrcn3FJxjt1stSI0R2ApWpfKXe2abgDA/smY/tymzlbcOIUvjV6SfzoVi3HUO48OcolUr4vGCEcmMY74e487DfJRhTQckQ27t0t+0zdeONLJ2yI0hUIz50R/MOoSn97nGltfxCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8f19a31a-9bc3-4216-db1c-a9732c6363a7@suse.com>
Date: Thu, 5 Jan 2023 17:07:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH 10/11] x86/shadow: correct shadow type bounds checks
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
In-Reply-To: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9432:EE_
X-MS-Office365-Filtering-Correlation-Id: d8c9e9b9-d8ec-4bc1-7e89-08daef36e670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uoCWZDymnphVsFDawywMhEmu+1148SzShYbJBzyY4dG9y15rG8F4xDSzzhcSV2MKJd1h6sOvHivuv+3LbaScO8YJGiABJoRJgvAZJtFKnP/93F1uSlfNaD3TZlMv/OfMueNfBov+NJnhB82JvtBwJE6UV1Goatemfr+1YttvM+Y6VTbPsRYAKb4yfSN0QXwRxV+AegTiTWfLo7TJxqM6eyN15eMorLMlHQ/7h71dNgJVum/dyg4JbJ/YGx8mzl/foR4bu8EPw2JENCkyvQmnFkRGeZw/uEIjQXcqCjSWyVcpQFS/wkghD4gfCqVHOFXb3bdVnaYJovPjnano0mWt2sYpNKLsrt5Wk4TAMkDV1gGYntq/XjoEHcwzCvK2poQLlW+dqUpGXAcRqzOWdIZ/RDseNF7krUcT8FSlrWm6CTemNmxv13cRDdtdJD49Mpz/Glio27umvYwMsAy1V2+z/7LsRfeD/FKPNMlp7ZJuNVgDZDLwTcHLFPqyJ6g8Bl50wKZLvQJNZTAZSKOubcBJuIEeUHkUPehR3IQ7aOREPEl17KEkpQDLylPNc3Cy8p1PZMskEY7nN/q6XsLHfS93sGbjSNrMXlsKHOXbarLQB66opW7M9b8bXyDy8w5eSShTnBAFSCzOf1iFeh3ReU9NlnykkHeRit6oMmvGm/3NsNO0IAHvAK8f8VJILbjm1ph8eJqMS2q5T6TC9oCZB8QeyV7Gc11xL1jqj53cK52CdYE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(346002)(366004)(39860400002)(396003)(451199015)(54906003)(6916009)(31686004)(26005)(186003)(66946007)(8676002)(6486002)(66476007)(2616005)(478600001)(6512007)(66556008)(41300700001)(8936002)(5660300002)(83380400001)(4326008)(2906002)(316002)(6506007)(38100700002)(31696002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1FSNVRHQUlsdDVxdWdybk1xUjhBd28xK2ZFNnFwN0JHWXVON2w4RitYcEc0?=
 =?utf-8?B?cWZXbnZ4cERLaFJQaUZYRklvbWY5UFM1TUU3UVNMYitzWlV0aW9jWmJRZXJU?=
 =?utf-8?B?RkVMTWVlLzRRNFQwbzEwN3pOSlZBZDVDckN5T0NXOW9yQzMwMW9GNXFSQ1hP?=
 =?utf-8?B?cTlaM2k5TlNWclJsVUZnUWp0czN2YVNOdnZnSE5QZ1NJaHYvcFdGMjdtcHRy?=
 =?utf-8?B?YjIyTngvSFVPTy91M1NhMWw4VWt0TTZYdHh3Y0NpakFGSUI5b0pOMU5aMzJR?=
 =?utf-8?B?d1RkcVUycFhSZkdOc0UyeUdMcTM4TTR4VTlkNmNzUHRqeEtXd0NwdVpRLy9p?=
 =?utf-8?B?TWtKZDVBQ1RzazFpZkt1bGpOdlQ1SnlZUnp4TkRTemxybTNhY29wY0tiekRi?=
 =?utf-8?B?Y2ZJUjVjNFk5RzBSSTdBQ0dwRFhKazlkQ0hzYXBVeWVpamdzVjRnT29ESEM4?=
 =?utf-8?B?N0tPZDVwaCtRbmRIUlVaVXhSeEtlc3I4eWFlTXpCODRhMjZhMGU5YXB2WmRW?=
 =?utf-8?B?VkdtNnk5UjRuSDV2aGdUMWtyVDU3cjhVVzVjQ1RrZkpNSnFkNi8zR2JtNmd1?=
 =?utf-8?B?bUtIY2w1ZGt2bmZTRlowQmJEUE1FNGQ1ZDM0N0kvWldoSW9VUU1ZTWlvNSti?=
 =?utf-8?B?RHhKRisySS9zYjBjb2krREdseGNkWE5odTN0eXZ0WDVTNit2WFlCL2U4c3JJ?=
 =?utf-8?B?WHZRQi9HdjQyZWYrV2crOHRUUjRvRHZ6VVFyekEwdVpnNzQwQlU1ZEpndzFn?=
 =?utf-8?B?STc2RWFhc2kwQnpwUnA1RXNrdEVFbWpYcHNuQ1pVc01ESFhHbGlZM0ZUV3Bu?=
 =?utf-8?B?S2xycUFkZm91akJvUWZTVjlKWC9xdE1reHhmYkdXQUFkTnVTc05mUFV1NVp1?=
 =?utf-8?B?OVpjZWtpOFdCOHYzWUlyV2RJOGJaZkpLRmRSRXY4aWQ5dVZTME5nNFlOd2lM?=
 =?utf-8?B?VHZVOXV0VXN6cERSbU5FdnZRaUdlSGdLeForK2VacCtKdUVxeUdEOWlEZk5y?=
 =?utf-8?B?Z0MyKzNXemdYcjA2Qk1JbWdkL0xXQ01NenhlNzIxZ08zb0JKWkdkWkN6b0do?=
 =?utf-8?B?NTZwSnY3a3pLVFpwcEEzc1VtYWx4UUJvR0htSHBBSnB3WXptK0lGWXZyQTZw?=
 =?utf-8?B?NUp3MWFJSFRGdG5mVkQ2WWZrWTQ5RWpGTHgyTGFrTHYzZWQwSDJvTjFZN09s?=
 =?utf-8?B?UVorTmg0MWZhY1h6SFRtSFFNUUVIWDFEc1o4M055dHIwUDl1R0JxZHZTSUNu?=
 =?utf-8?B?dmhuV3p4eGlFTXVFS3p5Zmd4cDZMTXlGNDBuRnBPNjE2MTFkcm92Uzl1azdH?=
 =?utf-8?B?Unp3TStRc2ZKSkl3bFlPaU1tRDdmWGtPaVdudDg2N3ZQSVhUNzBmem9OTUFy?=
 =?utf-8?B?dEpZazhnOTY3ZWp2Rm1UNjBNRW5oVkU0aUhNTTk4L05KSDJEa3dHUFdBMmtF?=
 =?utf-8?B?RW5JSFRWaDJDODVhQ0Q5YmhvU0RITEpWTEwyL2JocU5Sc1Bkdkx4QkpmOFUv?=
 =?utf-8?B?NXhjUkYxOWZGaVpidVh4NUliZG1MVE12ajQ4T2tKbWZlWUQreWFPeWU0RXpW?=
 =?utf-8?B?QlB3YU5PNlJoUEhDQlAzRHdWN01lYllMWGgrMHRZSzNMeVVTZmhVT0xkdWxv?=
 =?utf-8?B?eEVBelhPODg0TllhZTVIaGNodS9yQjJFWHA0eVpLcnBnbThCU290VjVWTldN?=
 =?utf-8?B?M2htZ29xZCtnYmlqRWtMTmZBWmFFNTk3TXFRNERTUHdXOUszajlQcXhwWGRp?=
 =?utf-8?B?MVpmbEFZS1Z4UklFR3FPOEpNMlJreE5DcHh3QWp6MHNacW5NUk1lQXVtN29l?=
 =?utf-8?B?aDFWUWVoTmRoR3dRclUvNE9QQW16eElzZXNFMW1vZmZISHJKeU9oSm5aUVJ6?=
 =?utf-8?B?a1I3dTZVUFpvVmptK0tFY1gxc2RJdEtDQUlTbFFaM2lRVXl2VXJJdjdLS2FB?=
 =?utf-8?B?UzdOY0t1YTNiWFlRZTlQeWdzU2lSdUo1Z1JicTF2Wnc4elIyNUgydDZIZzA5?=
 =?utf-8?B?RUhtVWQ0ZEFEeTZ5NXZkSk9US1R3OFlGa1c0ZmN0MWZSRDlPNE1YOC9xOEFT?=
 =?utf-8?B?RnFVVnhiR281VFJ3dWJvc1pYK1YrV2dub1NzVmVWUmJSem1UZmQ2ZXg0VG03?=
 =?utf-8?Q?yGiOi2clw0uO6+QEgU4zWerct?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c9e9b9-d8ec-4bc1-7e89-08daef36e670
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 16:07:10.0844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hi+aiyZkAnzOe+vVp5V3J33MF6OzPz4oNZn4SK2QzVZAReP/4NcmxZMlaU5qpgNmIKVGfGtlI4Pec9sF9ktW3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9432

In sh_remove_shadow_via_pointer() the type range checks, besides being
bogus (should be ">= min && <= max"), are fully redundant with the has-
up-pointer assertion. In sh_hash_audit_bucket() properly use "min"
instead of assuming a certain order of type numbers.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While style is wrong for the BUG_ON(), keep that aspect as is because of
all the neighboring ones.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1425,7 +1425,7 @@ static void sh_hash_audit_bucket(struct
         /* Not a shadow? */
         BUG_ON( (sp->count_info & PGC_count_mask )!= 0 ) ;
         /* Bogus type? */
-        BUG_ON( sp->u.sh.type == 0 );
+        BUG_ON( sp->u.sh.type < SH_type_min_shadow );
         BUG_ON( sp->u.sh.type > SH_type_max_shadow );
         /* Wrong page of a multi-page shadow? */
         BUG_ON( !sp->u.sh.head );
@@ -2077,8 +2077,6 @@ static int sh_remove_shadow_via_pointer(
     l1_pgentry_t *vaddr;
     int rc;
 
-    ASSERT(sp->u.sh.type > 0);
-    ASSERT(sp->u.sh.type < SH_type_max_shadow);
     ASSERT(sh_type_has_up_pointer(d, sp->u.sh.type));
 
     if (sp->up == 0) return 0;


