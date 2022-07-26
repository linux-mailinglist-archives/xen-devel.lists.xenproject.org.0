Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B088D5816F9
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 18:06:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375522.607971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGN4o-0007IJ-GP; Tue, 26 Jul 2022 16:06:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375522.607971; Tue, 26 Jul 2022 16:06:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGN4o-0007F6-Cd; Tue, 26 Jul 2022 16:06:30 +0000
Received: by outflank-mailman (input) for mailman id 375522;
 Tue, 26 Jul 2022 16:06:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGN4n-0005Nn-MR
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 16:06:29 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2046.outbound.protection.outlook.com [40.107.20.46])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e82a5372-0cfc-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 18:06:28 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DBBPR04MB7772.eurprd04.prod.outlook.com (2603:10a6:10:1e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Tue, 26 Jul
 2022 16:06:26 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Tue, 26 Jul 2022
 16:06:26 +0000
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
X-Inumbo-ID: e82a5372-0cfc-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qz5cIIKurAc6jEq8H27vU6WZrLmn9Hs/L1M0bEHSRlUaEjDssZx8vFC7mRk7QA0e9WTbdcekJlua+ElCF6UJfElkfOWzNITFKHCkUgOy0fh3cQeW5CXgk8EQZRyHnphcqUvNsSw0hCHr2aywUVGYGNAr1SAEofQI02iCIIIfzVCiWo66km/maB1VO5jDHxzbqYWact2eGFcxk9S1x6w9pTLoz9dRg9CVRXr/8im5t4c5qlsby+odEv3aIAWX8lj82wSyEY5EcgAaFdztEW5oooLMQecBRYQhHYpkX9MAWnQB40lGbbsvwWIWQRdC1P+e6/IVWj4YFkR7bDdWiH++kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=td/gCrrRCkDZYLC/FRwdlmkxYPkOjvQqTnNypaVN5WA=;
 b=mNcrB+BlOKWKXGLQlNCKFc7rp4A22OqLxuyW/smUFzj23y8OgDJy0iDSnqY72lSUIFsM0inSYIctHRZUEPlUraFQKqx3aTNFsoMpAfPhg94SJ1O/cR4+DmChCSFAF17SsDEKZpovtbGVAaWD16xj51auMHnib6UcrKT1U/vUtnh/AC+cRgqbEWgFk3VrlLSYcq/+kzK1IyfQZhSpSMfbuCc0aK+YlbqTyky6iTpscHWOTOpqnYDp6ZQsO/X+yVbdNQhp+g/Y1rFcJGt0vhdFKiqsT3ls0zT2G0BPWI2vLRtsnAeY/QaJfn+ti4uzHjX5jVGszY3KAzpDj9dnW2Aqug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=td/gCrrRCkDZYLC/FRwdlmkxYPkOjvQqTnNypaVN5WA=;
 b=aqmYC09rv5pmdNxtTqvJMYsyOR/i4hyQRkN6pftRImbhrEE4sovkHRPD6CVYPEX67UQWI01rfkqUFm7r1dy3QrIppo0Wwp8h5gajrzWAZ2//jrzasVoYuL2j/ulmoR/pntVNam5Wnc3DuG1DhfyP6i5v1k6X1kKCn6RWHOsVZoI/Uv43jlMdgs/wPngw6oCmymjoHXHXd3KJ+CZWwehdhNIkL/y3Bn1EbWOB3KPC7O0g+knSo2AvkCa87BQ/GNdWhNajRfUB0KwZSvszp5GanOoHmubs+nAmsdwUcNl50xtrPxkyXDGfUqnSFxxjBKnFLjR6NQ385f2Zeb0DydK8Uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <03ef104f-91a5-596b-235d-1a0fa47963e4@suse.com>
Date: Tue, 26 Jul 2022 18:06:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH 6/8] x86/shadow: drop CONFIG_HVM conditionals from
 sh_update_cr3()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
In-Reply-To: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0116.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::31) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffc06cc4-9299-47d2-b060-08da6f20cb56
X-MS-TrafficTypeDiagnostic: DBBPR04MB7772:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iMi6jD8qL98z1OcsJE7sUapntf9wQu073LVho5xTW9T6V/i1CuQw8h0AFWnbejIgbWgbjxKcZy4+k9jbykCGd2mNWvBgvzol9APfHb4HUOkoisE2yHb44SwkDTtPOCLLMg1o7apgCNPdUh2H3xD4xE/Ng5MOaqgwD1i68xI0KmMELyUtTPbn+qODwTd9dU6hc8Vz8ZX2MliFtjsj56yXwIKvDfGAJxtcnO2fWADvAV6vPg1WcBTCOm0DGcyfsCAsB5Rau20KKuxGRSxq/fEL652KhV29S1HY/OFCyXWGC7nKCVPOMpHUkyeOyJ/sJkJmRgdvRP8jsFFG8Hg2STa+AqRBYncikeIaGFOi49zW/jU50mFF7mYpX4kcY+NHU4slZ8CxOEMnool5emA24c+z970NvMg5Mg27gWLIzrdBunsOYYhyCN6Oo7GwbhukZBgbpv4HPiARD613MmKSgJ7RDhCXf4nff3tEpfi6XrzMLk1lxyXwVhtdRYCYtepQndxJOL8BclJG0gwPwLXgxeHvxlmXmxF0qFMQHiA1zhmi7EZC4zL52JxYJLq9nzcGt5Fycpc72tDdFhgDrBK6q095p68BErBKQf2I5SKbO9UsFwfp/WBbgpuW0jLx9EjIgUEn/Il7OCY8Fut79vGQjFUXmsjCwbIhhAX75Oj0WAuc6tV6h39j0lXb2qEG6cjKZfE4Lxxj6g89bgh1TCgAhlMlrn4OcjbFqZasWCtp/MsX40zUo588qDqKdNFwim8JWb0nOhoYpSk28y6JhTrBY5iRZ4ZLuinpr0WtFV2qR2Vowz2l/jgoa3+ik6Q0cqyM3BwZEvcwBUZzyEJ/PNALvi7Rag==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(346002)(366004)(136003)(376002)(41300700001)(186003)(2906002)(6506007)(6512007)(26005)(5660300002)(86362001)(6486002)(31696002)(478600001)(2616005)(8936002)(83380400001)(6916009)(31686004)(36756003)(316002)(54906003)(38100700002)(66946007)(66556008)(4326008)(8676002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUV2KytDMmIrcGxpL1RoWGo1em9LK0EycTY4dkx3UlIrbnlpRG94VkNNT2p4?=
 =?utf-8?B?S3AyN0s1alp3WXRvRXI3dzZZaWZpcWZpeXR6dGlDYXhCdHRkdkt5N1IvUzF2?=
 =?utf-8?B?WlVmODJkNlpqK05KNlRlT0Vvcno3SEVJZElPbFI5dmJJUDlPRHZNNE5jWkhy?=
 =?utf-8?B?M3hKRDN3YTVEZXRHNGdnb2lDTUx3eHFiVGI1R3BVaS9FSVF2V1JlZFRvaWdG?=
 =?utf-8?B?Y25Xelp6eFJDeGJTUEQyY2dVV21QUjJuOTZjUG15bk5kNGIvSE5ncUVZVEN3?=
 =?utf-8?B?VXpHU1c4a0VqOTJrdWx5TGJkTitlN1R6ZkplWm5NdmZnQVcyYmNQMUhRYnk2?=
 =?utf-8?B?bnBOQlpEbXBkZ2k3L1ZHMFFGUUZmSHU1ZmlmSHJWbVAwa1ZjVkJPM2MwSUEw?=
 =?utf-8?B?UHFFU2xSN2UzU2FOSjEvQ2g3OFROaXF3ZE9maytRK2NSUVcvQ0JuMW5STS9v?=
 =?utf-8?B?RE5lWU16SE90SmdSWHpCdXpLcThOaHdrelRrMW9XZEczVFZDZ0h0WmxtbHBn?=
 =?utf-8?B?K3l3QW01SllTZ3ZPSVdocDNEMlhhM2RiRElzUEhRRnBIVzgxYlN0cmpwUnB6?=
 =?utf-8?B?OGYyaDJsM2QycnRKTERtU0ZTUEpQTUlHcURvRC9ZUG1PMWJSZllRdmVKVGNG?=
 =?utf-8?B?MVIxQ0pDY3JkQk1wUnB1NmhGSFlLSEMwZmIyL0NPNnV6YUhGYzdtTU5qd0ln?=
 =?utf-8?B?RUNuYmx3a04xRXh6dG5tSEt5aSt1TFljVXEweVgxTlZtK0JGNWZxVUhmUHQv?=
 =?utf-8?B?eVBwZzBBbjBhUkhMcW9mVlA3dnVGblhYZjlhc2plUzFRbDg2bG5jdFlEQXZH?=
 =?utf-8?B?UXp0TVpOZjJjVk4vV2JUVVdRZWVqdmVSMXlyWXNKM0hXM2hlWWJuY2F6SjJB?=
 =?utf-8?B?SlM1RU5oODJCQXROS3FaSXJRaVpmR3oraHNrNzdnS3ZpZUtWUWhYbkpScHM0?=
 =?utf-8?B?b2ZKY1FvNUJxMzJ5bnl5M0VhRk93QnNGQmtCZUlNYmUzWDI2MThXaUlNQlBi?=
 =?utf-8?B?cnIrMnhGYmk3VHd5cnFQWTUrWG1DQmtvaGcrMHhMYnZjM3J2L0ZIUytxdDV1?=
 =?utf-8?B?K0svaytaZjlIYjVzZVdSaTMrNXR5a0xFN3c2Tmkvb3E2WWM5UU1Pc2pLQkls?=
 =?utf-8?B?cEIvbWZJRFNvb0UvU29GMTFxdEdxaWQ1aUhnajFCWW5XODdzSW80NTRnb3JZ?=
 =?utf-8?B?eFJyRXdJd282UDI4WUdrRncyclZSUU9rbCtrcHU4MUxsakVObTdkQTBpVFlR?=
 =?utf-8?B?aVE2bEFseGtiMHJTYnJUY3lUbzlUU0FtRlZnU05PdnBRU0R2aWNNb2dnNTQz?=
 =?utf-8?B?bDRzbmZmMk9EbXh3REtUczFHRGVkZ2JFdFk0MTNrQUtiTEljbTRSa3dPOWs2?=
 =?utf-8?B?b1BWMTBNSGp2ekRMRVN1dEtNSTRYcnUrdmE0Q3JiQWE4RHlJc2tENFZjV05I?=
 =?utf-8?B?Z3lIcjh6dmIwcGlzcDlFOUw3RE5kazlsc0dTSHV1YUtUczlTbXpHUmJFc3hZ?=
 =?utf-8?B?L1hML1VSRXh1emRLbnlGSHJzdlpXZUcwWE5VbmFhdGZtS053aHAyenM2dUQ5?=
 =?utf-8?B?OGhKN0FZQmdjZUVFTXdTM2ZmejFXQVFyN1FNcm1Cck1WbG5STGJ6TnVKcEVL?=
 =?utf-8?B?TTE5MktoS1dOUkZvc1Q5TVlYbldYMHFHemlaSnpuMVBYMU50VEVzQ3Z3d2dU?=
 =?utf-8?B?cWxHY1NWUkdvTnVmTlBTTWZYRGFLWGFDb1BtNzUzWW1xbGVWYU1CL21yaDBQ?=
 =?utf-8?B?Uis4RGlwWDNYUnJVbUQxcmc1Vm00K1hmSitQYlpoOWpPcUUyMmovSGZRODc0?=
 =?utf-8?B?eTdhY3IwT1ZERjcrQmlCSFlzNWE4OXhPS1BxM3o3K3FGVFNCNzdSYmZGK2lP?=
 =?utf-8?B?WURPWld4VzFzSXRoSEpMRURmN1hCdktqSkp5bFY0eUZFM1oyeHMzM1FRbGJG?=
 =?utf-8?B?dFg2bzV2em9iOWUyZU13TmxBY29GL2RZUjNzWGpVSVF5bGlyQTY3b25kK241?=
 =?utf-8?B?a0gvYi84ZkYrL1VNVVIwME5ydG9rSVVDcGVGZGNMRm4vMFMvMzZ0T3diRzZJ?=
 =?utf-8?B?QUU2YU02MG0yM2lkWk5EYW9FNS8rSDNUWlFYcGVVcWFqSEx0Rkptdk14S2My?=
 =?utf-8?Q?X3gFMm8u6T5/9d08WlPKhNjPN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffc06cc4-9299-47d2-b060-08da6f20cb56
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 16:06:26.8220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQItRQ7G+e4e9//94ccpNgfjnAHoR+tll4DEBw9hZLjeir019nKJA1CVEcH/CDu3CD3e4maqVBparkYtKSrPkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7772

Now that we're not building multi.c anymore for 2 and 3 guest levels
when !HVM, there's no point in having these conditionals anymore. (As
somewhat a special case, the last of the removed conditionals really
builds on shadow_mode_external() always returning false when !HVM.) This
way the code becomes a tiny bit more readable.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -3228,7 +3228,7 @@ static void cf_check sh_update_cr3(struc
 {
     struct domain *d = v->domain;
     mfn_t gmfn;
-#if GUEST_PAGING_LEVELS == 3 && defined(CONFIG_HVM)
+#if GUEST_PAGING_LEVELS == 3
     const guest_l3e_t *gl3e;
     unsigned int i, guest_idx;
 #endif
@@ -3279,7 +3279,7 @@ static void cf_check sh_update_cr3(struc
 #endif
         gmfn = pagetable_get_mfn(v->arch.guest_table);
 
-#if GUEST_PAGING_LEVELS == 3 && defined(CONFIG_HVM)
+#if GUEST_PAGING_LEVELS == 3
     /*
      * On PAE guests we don't use a mapping of the guest's own top-level
      * table.  We cache the current state of that table and shadow that,
@@ -3321,8 +3321,6 @@ static void cf_check sh_update_cr3(struc
                   !VM_ASSIST(d, m2p_strict) )
             fill_ro_mpt(smfn);
     }
-#elif !defined(CONFIG_HVM)
-    ASSERT_UNREACHABLE();
 #elif GUEST_PAGING_LEVELS == 3
     /* PAE guests have four shadow_table entries, based on the
      * current values of the guest's four l3es. */
@@ -3373,8 +3371,6 @@ static void cf_check sh_update_cr3(struc
 #error This should never happen
 #endif
 
-
-#ifdef CONFIG_HVM
     ///
     /// v->arch.paging.shadow.l3table
     ///
@@ -3400,7 +3396,6 @@ static void cf_check sh_update_cr3(struc
             }
         }
 #endif /* SHADOW_PAGING_LEVELS == 3 */
-#endif /* CONFIG_HVM */
 
     ///
     /// v->arch.cr3
@@ -3419,8 +3414,6 @@ static void cf_check sh_update_cr3(struc
     }
 #endif
 
-
-#ifdef CONFIG_HVM
     ///
     /// v->arch.hvm.hw_cr[3]
     ///
@@ -3437,7 +3430,6 @@ static void cf_check sh_update_cr3(struc
 #endif
         hvm_update_guest_cr3(v, noflush);
     }
-#endif /* CONFIG_HVM */
 
     /* Fix up the linear pagetable mappings */
     sh_update_linear_entries(v);


