Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22948677DF8
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 15:27:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482911.748705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJxnK-0006eo-CZ; Mon, 23 Jan 2023 14:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482911.748705; Mon, 23 Jan 2023 14:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJxnK-0006bq-9N; Mon, 23 Jan 2023 14:27:34 +0000
Received: by outflank-mailman (input) for mailman id 482911;
 Mon, 23 Jan 2023 14:27:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJxnI-00065j-NK
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 14:27:32 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2070.outbound.protection.outlook.com [40.107.7.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 125cae2e-9b2a-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 15:27:32 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8418.eurprd04.prod.outlook.com (2603:10a6:20b:3fa::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 14:27:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 14:27:31 +0000
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
X-Inumbo-ID: 125cae2e-9b2a-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFhPwne6xGjpzyuaAr+F18YfrsCiFaZy2rZf6chyGVX6MeppfChgis2uymYtxsQ3DB0+tG1qSw2LEypfHEea3dIQqAgEYUwQEzsmJ479GSpyMkcXOasmyMN2C0L0IqChaEqtdAD/Wu6nMoTp111JZyovSb4PpZ8SmhHKcWZRqBKiujGCbwWhpvThxSlrAxqyXI9nLhOLRYDi/OvSedwweQPlFTOqHagUcLTYfvidPWVye2NIrtXKeCXZ1c9P9cUb3qwbpBeEYUBtM/oR8SLD7lvaO+vx586buEe6msb8NEB/tzd+mq8sDOIlEEYmy4Bd0FJ2dKrJqTnaZiJmycp09w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RrwYPI3hJNohdFkp2eOgTzxDlzUCzI3WQX/iB1o8qcY=;
 b=NszGQ2wLV+rey8pCha3anzNR9cJAC9QScKS4nFNqZBq7mBSTHtILzotMMkUGdE8yFX2VUYKOso9PYlsgCTgOCeWi8kwmDt3tjtNCA8iBNg2Drj3E5hI7C9zUDTWsglpOezHsn9f4QD/msyXMYet+fX7dNfx/SKmPU8PHL7jjuXbjB/RzMQXDaef9G4gpP08nqwKg66HytfUPUKDRxIAeoRyCbqkNs1F98uE85gqzO9Dw/rvMeaUlQDi5pd74NrNKzV4Egjg98qtjlgz07ucUB4YAxo4yEhaSzsnwkXsj9+a1ONXA/ut3P5+NgLt11S8h70NQFqEQtzoY7EtrRk4H6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RrwYPI3hJNohdFkp2eOgTzxDlzUCzI3WQX/iB1o8qcY=;
 b=vhTqeO2RRZWsMZ315uCIHwy5xldVGYfjqnns1CtDlvcv0eXTzq4cM6bnfLBblX1YRtSn535xJjJbslDjtBwTEstHn42pgtkfpfIzZsMDUKcrncISuBF4oICskCfAF6XWC5/SOQSAiDr41A+xG2o1mBwnl4NK/Xk/6VLW9UaXPAkWiH2x6FMv8GzxTPAME8gxbjbwdMOAc26jKBlykkrNWiwaFtmH5ll8RU8wVE9E389p5mjPg+kGquH47q/eqiCpKShfi4kswvLHW26ZasLNJAvqq63pU42zAn5LMMchEM0kTYsVA1YSkjn6luZcuc72IL2kMM7WW9k4isRqVD+T5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b0b6309c-680e-a764-8f62-3ae5d0751917@suse.com>
Date: Mon, 23 Jan 2023 15:27:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v2 2/3] x86/shadow: mark more of sh_page_fault() HVM-only
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <0e682cd4-3cc0-461d-ee53-13a894797f17@suse.com>
In-Reply-To: <0e682cd4-3cc0-461d-ee53-13a894797f17@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8418:EE_
X-MS-Office365-Filtering-Correlation-Id: dfadfc46-692e-4258-9a9d-08dafd4df608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C+LCwk14pwRpIYBRi4V2ZJcldMpx+TQPlLPXtM5+QeKXV/Hm8+dObWemvGN4TYaLo8QwPQ3zAoKFvTPvMs0FQyTEO4JMkDgNdtctJNA9ZwaifFnVwVEjkHVV07E5yza3ghlgLVTllbOYpnLdhjEu2PbHErmS1IkJWnk5hZYGNicVuYCntmq4r3XeguDA7bD8IlPVN2DCMIzVkkfgvR4WK8ljrMXbYViUHgt1QRjBE0GypUjSR4GHKInIzejMZrABb0+9d6iZ6KKXHZ70cxXBxbsxjlge1vRnQvwIQCAddMRXVgSbaFR1OdSUt1XWDMUHx+ZTequnATPyc1j4e7cp+2cdWKZs0FHLbSz+7CGL1OjVszJHIg8VMfZ1NFuIZod8YdBRziTSX6n3cd6Web8djttrovdWMR9F+B1Ax4tALetioeRkgXTV0JZvl/HnU47aZ/4EwvvM2qjVetEUpdjWtwRQlbJK4De9S86r8Cmb59rFSNfBaI10syz6j/4InMx4ce7PivB26QiEseIFJuKzfiTTkkwk621H7xNSGggeKuuAXroNOLEKYSbrXkJEtR3UpSY3VxMZ49/9KU+T6ww1J/Ujb0DOfCvsWxMK2FryLugavxrq1aiN1xtq5BY7hDb//gjV4tmB6L/Z1ugHh5Th65u8STxl64QSF6Gr/2femR2J+8t9sP5EhWQHDIHLEiCV9f77bZ68pfeurUiJxrbv94PnubpRZvh+QJJQKFYvlkc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(39850400004)(376002)(136003)(346002)(451199015)(38100700002)(83380400001)(31696002)(41300700001)(86362001)(2906002)(8936002)(5660300002)(4326008)(6916009)(8676002)(26005)(186003)(6512007)(6506007)(66476007)(316002)(54906003)(66946007)(2616005)(66556008)(478600001)(6486002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0QrMFRWUnFHSTRyM2YrSXUwWTJ6anplamFqVHk3Y0sxeXZIUFErM3EzaUJ2?=
 =?utf-8?B?U2pIZG45a3RXaFpnM0QzaVk3RFRVMEx3Z3lic3BwbElhL1l5N1ZPYmZUN056?=
 =?utf-8?B?b050UDZqOHEra0JRSVgwYzlPQURCZzBTejAwbnlMVnBJZHZtc2pZNGhqalFa?=
 =?utf-8?B?Z0NGWWxkUlZ6Sjk2TGtZUkYvYi8zcHRwdU1aQk5FOFNidlR2Y1N1dVFlSnVP?=
 =?utf-8?B?NUpJUkxBNWhneTBaeFArZkwvTEphWUtQZ1FKSGtqd2Rta1M4QzlVRGY0eXRh?=
 =?utf-8?B?OFFHTXNFSGV3N3UwQktaelFzYU1YTHI2RTZNL09OcDUwZndxYjZ3ZmxsZURv?=
 =?utf-8?B?Mm9LUll3eUxzNkxHdVN4aGQ5eHk4NGltbGs2Sk84YzgzUjFUcW8vRXFVd1FB?=
 =?utf-8?B?cmRERUFmNXZoRVVKWjNBUDhIOWkxc29GSzF3NGZhaFhUNlhrSkN3azd3NlBs?=
 =?utf-8?B?NGRIaFZZbEloRStPdUZod3J3Y2ljVFJnY0pkNHVaYjl0QWFrL3VKOXJUWTVV?=
 =?utf-8?B?UTZJZXVmMXIvU2lIUFEydWl5aEpGTGhVc3RyUEZ4UDVpSk5QcjBydzZBK1Vj?=
 =?utf-8?B?SkVIbXBqZU1MV21sRnd5NStacE5PWDdKek9JNkUxY3JPbHBCS3dzVmR4OGo1?=
 =?utf-8?B?TVk2Rk1rWWFMU3ZmNmtudVBuVjRDSm1nTnFjM0pyRG84aXUrUm9iNng5TUk5?=
 =?utf-8?B?TGdnU0RPRm53OURNZHlhTVhKU0M2QmdpZFJpWWJZamEzaVhBUG91TVJzWG5R?=
 =?utf-8?B?bFBUTkd3ZFBoTTE2bFR2U2pVTWI3b09ndk1pa2xoT1ZjTjliNFRDRXNUYS9o?=
 =?utf-8?B?aE9BMytEY2ozdUpVUXFxS0VtcUJzMGpSZ05WK2lTY0dWQWVvVHlRUW4rVUwx?=
 =?utf-8?B?TWlzSnV0amxoWk5ZSGdZVzBzb3NXRVYxZ2pLU2E3UkIzYktnaEtZSWg4M1lW?=
 =?utf-8?B?SXRXU3pKcGFqS2NXdm54a09Pa3FKT0RDamoxaEREelJQK2tqMk1mM0pzTEp6?=
 =?utf-8?B?a1crb1RmNitEUmhFLzhBN1BSN0JiclZhMGlWQlFYOWhZNmMxb0FMVXpXMkNE?=
 =?utf-8?B?SkF4MElkL3pZeHlBeXRFVnBVNVBrdkFoTFc5QUdSdWgySkxna0RHSTZCQllT?=
 =?utf-8?B?OFZwR0dVRXlxaHVMSnlFZFJKQmI4VHM3SkV0U24zdWI2YnV2UzdHQTNtUGxV?=
 =?utf-8?B?Z1QwYjJDZ0NWMGRxSnQybmxpNXhuYkRRMmpvU28wUHUwZENnaVV3eFR5emxp?=
 =?utf-8?B?b0FCTVFvQ0NaOVVaK0pOUVMwUitSeXBSbGxtTHZXTmhIdWZUR0p0enF4d2Ey?=
 =?utf-8?B?VGRneHMvRk9vTDIzanZ2aG5SVThNdldhM0lkZ0EzdHhOb3ZmMUdmR0o3aUdh?=
 =?utf-8?B?N2g1VUFJYm1KSlJqcWFDM0FmcTNMWWEzaEYxVzRUQ3kzTUdad1gyL3U5MGxq?=
 =?utf-8?B?eXpiTU5iY0NyaU1naUdMVHVoQWl4ZTJqMG9lSjl5Si9wMFNCNFNIbWo4WVE1?=
 =?utf-8?B?a1BVN29ZMStUUy9jQXQxdGxIN01HQTFwNUJUMjI1ZVNnTnMrSlJzYXJjaEc4?=
 =?utf-8?B?K0Q0SHp5UDNkWEUvZW5CZVpwNnJ5Wit4K3FnZVQxNTJLcFNhWEZXTThiR1BM?=
 =?utf-8?B?UURWcHk2ZFdHNFdJWFRoZy9Rc0ZDbWQrTW9mUGMzSWJ1cEMzRkFoM0sza3pP?=
 =?utf-8?B?NjJPR0lUTGJFRDVhaUgrMGdyYm16b3lDNVpGMldNVnVVRjErUHRnU05hMS9B?=
 =?utf-8?B?S1owV2QyWi9jWHJUZzl6ZUs0aUdLR2VvaGszeFVzOHR2aVVIL0pyRk9RSHVZ?=
 =?utf-8?B?Um96WUk4bzhBUUErQThXU1RpaFh0MFBhRUlNdjFTQjJXY0N1d2RYaUw5MkM3?=
 =?utf-8?B?S0dGSGVXRkd2RDd4dld3TEdab2ZpbGdSMnh2NFYrK05VMmZTTU5BdVYrVDQ3?=
 =?utf-8?B?dVBFQW5CRGFvYmlVd2hNSmJXemNNTHJ3NXBFSkM1WWVoQWs0ZitTcnlKUmp5?=
 =?utf-8?B?WGxqQ3V2N1d3bFJLWlpBVE9TNmE2bWc4SGdQUDZlcVpQa1FQZGd2K08vZVc4?=
 =?utf-8?B?Wno4MG1pckxERWZPWC9QZXpvUUxuQnc5bEVLZGljUmcvL3JjSDAvNUZPNmFR?=
 =?utf-8?Q?qS5CtgcRQ4uRXMEnVqDgRP3No?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfadfc46-692e-4258-9a9d-08dafd4df608
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 14:27:30.9977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hTYP2kc37Q1Kw76wbLPfSYP+Jqq3PrFhMirTZKeNW6opZdWKm0RYCFLoIkDAPMLUV0kcMIZ+iFCT47nlKzEx5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8418

The types p2m_is_readonly() checks for aren't applicable to PV;
specifically get_gfn() won't ever return any such type for PV domains.
Extend the HVM-conditional block of code, also past the subsequent HVM-
only if(). This way the "emulate_readonly" also becomes unreachable when
!HVM, so move the conditional there upwards as well. Noticing the
earlier shadow_mode_refcounts() check, move it up even further, right
after that check. With that, the "done" label also needs marking as
potentially unused.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Parts split off to a subsequent patch.

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -2613,8 +2613,6 @@ static int cf_check sh_page_fault(
                ? EXCRET_fault_fixed : 0;
     }
 
-#endif /* CONFIG_HVM */
-
     /* Ignore attempts to write to read-only memory. */
     if ( p2m_is_readonly(p2mt) && (ft == ft_demand_write) )
         goto emulate_readonly; /* skip over the instruction */
@@ -2633,12 +2631,14 @@ static int cf_check sh_page_fault(
         goto emulate;
     }
 
+#endif /* CONFIG_HVM */
+
     perfc_incr(shadow_fault_fixed);
     d->arch.paging.log_dirty.fault_count++;
     sh_reset_early_unshadow(v);
 
     trace_shadow_fixup(gw.l1e, va);
- done:
+ done: __maybe_unused;
     sh_audit_gw(v, &gw);
     SHADOW_PRINTK("fixed\n");
     shadow_audit_tables(v);
@@ -2650,6 +2650,7 @@ static int cf_check sh_page_fault(
     if ( !shadow_mode_refcounts(d) || !guest_mode(regs) )
         goto not_a_shadow_fault;
 
+#ifdef CONFIG_HVM
     /*
      * We do not emulate user writes. Instead we use them as a hint that the
      * page is no longer a page table. This behaviour differs from native, but
@@ -2677,7 +2678,6 @@ static int cf_check sh_page_fault(
         goto not_a_shadow_fault;
     }
 
-#ifdef CONFIG_HVM
     /* Unshadow if we are writing to a toplevel pagetable that is
      * flagged as a dying process, and that is not currently used. */
     if ( sh_mfn_is_a_page_table(gmfn) && is_hvm_domain(d) &&


