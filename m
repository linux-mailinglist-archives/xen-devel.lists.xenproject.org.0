Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0666C74AE28
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 11:54:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560341.876201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHiA8-0004pU-Sj; Fri, 07 Jul 2023 09:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560341.876201; Fri, 07 Jul 2023 09:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHiA8-0004mz-Og; Fri, 07 Jul 2023 09:54:04 +0000
Received: by outflank-mailman (input) for mailman id 560341;
 Fri, 07 Jul 2023 09:54:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GM+b=CZ=citrix.com=prvs=545203e5e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qHiA7-0004kh-Cp
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 09:54:03 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31de1598-1cac-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 11:54:00 +0200 (CEST)
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jul 2023 05:53:55 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by BN8PR03MB4980.namprd03.prod.outlook.com (2603:10b6:408:7e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.24; Fri, 7 Jul
 2023 09:53:53 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::95db:33e0:ebe2:13dd]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::95db:33e0:ebe2:13dd%7]) with mapi id 15.20.6565.016; Fri, 7 Jul 2023
 09:53:53 +0000
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
X-Inumbo-ID: 31de1598-1cac-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688723640;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=asRF1+hz4KxTVmQq5li0pcFQKwMSa6Mn05JdrKjAnOY=;
  b=RSTE7DglVbZ0rwry0mNUWDlWPEpbNMjw5gOvSEYEK2PPdL4e2s39ETkp
   zpN/LoUm0rfdDWI9E4Yk5XSX5rAs8xRtD1dWn7G0jhfR9kK5If5OLIG7Y
   sTn0SHLBVR0Y70NJffA7BncnNrH2yJkhvIhscFq5DYOrSUmLmp82ciHjg
   k=;
X-IronPort-RemoteIP: 104.47.55.101
X-IronPort-MID: 118037051
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7C+rxa9MEn763hzvTQWaDrUDpn+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 WcXWWmFO6ncajf1Ld5zaY+/9kMD6JTVz4dkTgE6+CA8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks21BjOkGlA5AdmOqgU5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkR3
 NAHFjAKbiva2cCGwI2GYMZMt+4KeZyD0IM34hmMzBn/JNN/GdXmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUpidABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraWzXugB9pPTdVU8NYz3FKQ9Cs9DiESC16R+9qezW2iBcJ2f
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpatYrqcs3TjwCz
 UKSkpXiAjkHmKKRYWKQ8PGTtzzaBMQOBWoLZCtBSBRf5dDm+dk3lkiWFo8lF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9XABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:dEiKxK1Wul1ISpUDpF9gbAqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-Talos-CUID: 9a23:0YkMxmzQqUirGn4KvS3qBgVLM+w6TH3azEyJfW2ICVlUYpK1eHW5rfY=
X-Talos-MUID: 9a23:Tyg8UAW7/oBOytXq/GawizJQc+lu36DwDWpXsrJBmNXaJQUlbg==
X-IronPort-AV: E=Sophos;i="6.01,187,1684814400"; 
   d="scan'208";a="118037051"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ag+3bhmD/HSl3ucCIjeqBiw5FEveMRFMX9kVavI79noY3bA9CeAq1cZyoqpGB3NGpfbQ6HlfKR1BhkLK4zEB/NKx2i77edtdUfh9fme6pUV04nFCX7vx+IZGpCVMiezjGg1fDf/O5QErCwOozQpdy9wVv3deKC2hiYpkVHnthEWvwvQ0bQ/52ERs3UBfwOuThwtQdRvsHaiGsE8bWqAYD42oTD6jAuIOkXITEk/0HtJhnSoKn95BA7TKBGNdmgxP9lIDn8dNo5f3jJYM9DxIfG0R3tkMKlTWWbnyZTfxBp5AjhQt2jn9arrqyG+K+ywqjdvSEsoOQ8I/8XFABgKonA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGPpyzDhc8PLrf8fob5cnoRa3lgvkBZMKri/5Dme8TQ=;
 b=SCslcFkTdlyEjJQ8eQXU1lfsK+x7EToq7niCcCYqpuo+SDNQf8Nz1aiK19ZhiOE/dJ1i36tMxM/bpHurXSRiucJOAKjUQ5JLQV0iUx4T6I+dJGiHi2KFfVXx10neYjt3ud46GNT7bNS/fk9y2U1YMszW2jx73m1xg4Bv808+64eP0oEVtQib3vs1UbPnpg/ssRBm72SQEtr/k7K9Rw0jpqO50svbEUmDQiQD1q+8pVjJpSypXDhQnKOz8czjLxA9LQCNQzz1qxQ8RrzSsM3/S0ejMA62L8TAT4kX53rwre+VoSORyE8A+UfEPCXunU6i+dxOSN6EQJ5srOvDjptK0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGPpyzDhc8PLrf8fob5cnoRa3lgvkBZMKri/5Dme8TQ=;
 b=InIWlT4JkA25xD5y6cBW4hOZAX0vOVT/lR9iFer784gCAP2OtMZEpPc/oRMQ/akKrthtb2/nIikTYkUJrL02sTduD6PoLLDD9SlMbj7L0lYYJ3uVWJTY9ps66TqjHowDBWojNbuFsdPdcVCMoFEDARnnKHSeVbtNWOdYtDur33s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/ioapic: sanitize IO-APIC pins before enabling the local APIC
Date: Fri,  7 Jul 2023 11:53:38 +0200
Message-ID: <20230707095338.44244-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0410.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::19) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|BN8PR03MB4980:EE_
X-MS-Office365-Filtering-Correlation-Id: 17dec429-fc89-46da-b66a-08db7ed0125b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lLjvEfpOlfj6VcnSVNJzQXtKP9OsOkARDcsUdOydmm1BncTY4Yp0aKE3+dXbYK+w63tKDAv7T1DI442Zjy9/s4El3JwRLWPy/F+jGCAOhs9dOJildd3cEY3RTRsBIZWDfbjphP73jOwMzSZc9gLd6YeHeaGjITBsSsNjVrKOXCnp5ocYfH+uuvnjMsdxLdl/QM95JdX8FhliXazwieJmhgOPYQiE1PZQyh0dgF+AypsTQ7Th6dEsX+kPgqXdVBgO4pR85QNKh9h62sTiEfD5b3o5ZHpEtxzpttVJ1ANpKoE0IyT+53mMGEFqrXumigQWkCNYsUZOMxxRGUD8HVXkH/mtuSNxK/CnzmGhkLVHZqhn376EhZTEThN3w9tEQxHy1BsiJ6XhjOBoB2J8fZMcZ3KJbiiehQd8J5db8nB8kXi6XTaCku/kxGMOfplBDdaWRcfRmRhHNHCVqPzDV/Hkc4kDnHiVI1dlCybgxxXYzSJsZgzaR0veJITkegV8qtxyydFp7Xos/JLaJ/RBfQeqJf/URb7jfjOa4bLvBu0RwJuBbrLcLr/Ix4HRM2hb6N6t
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(366004)(136003)(39860400002)(451199021)(478600001)(5660300002)(8936002)(316002)(8676002)(66946007)(66556008)(41300700001)(4326008)(66476007)(6916009)(2906002)(54906003)(6486002)(6666004)(6512007)(2616005)(26005)(1076003)(6506007)(186003)(82960400001)(83380400001)(86362001)(36756003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TCtHRG9BS1EweCtIZzdRMDFhRU9ZcEJOWTdkTHJvWmJ5S2J5RDY1VjJQWmdx?=
 =?utf-8?B?anhtS0ZpZEg2YXZyYWw3MWZFS01qOVduVHNXM2JyR3l5NXBxMHZKeWthYk5X?=
 =?utf-8?B?U3UzUWEvOVBaR1hrZGdZcGMybyt2TXRwYnJlV1VoSExTY1BpSGhOREtBajFY?=
 =?utf-8?B?OU9CaEJYMkxrUXoxRFpIQkFTZXRSckdVQ1R1WkZqRm9uRWY3MWdwaWoxZGov?=
 =?utf-8?B?bGNOVm9TcTR1ZTRLK01hSWtpbEJKTit4aFRCRjdRdllQVmFDWElYNUNlSWZI?=
 =?utf-8?B?UDZjUCt2dGxjVy9xak5UMERWd2F2cDFpTEZMelJJSXBTdFlqVFlKbDBCbDA2?=
 =?utf-8?B?T3NCU3ZvZWsyajhQNW1MYjI0bEl0dUNhbzEyOEk0dlIwLzdmSFB2NzRxbGlG?=
 =?utf-8?B?UEFCTUpOTFVsZW1sVksxNjJLczVpcllGMjVrbGtVdGd4Z09jNXBvanhHSFVu?=
 =?utf-8?B?NFJ5UjVEenZkUnpsWEhGdXR3V1BkTUk2UFYzMHNWdGVFV2FwNThHK1NoMGxK?=
 =?utf-8?B?YmYwK0lRZXc1QWhFaGdEb3VPYXFYRHRIR2RUSnpkZ3ZrY0tpRDhJR1FGZ0lr?=
 =?utf-8?B?clFNNHR2OVlPZjdtamJBU3RxMjJCaDhnT3BtcnpMcGZHaUNQNGJSSEhvK0p5?=
 =?utf-8?B?a1dBZ1FscDVMV0o3MzhHZVlSZzduRlF1MDRRRkEyT2V6ZE9oeUxWeURDanZU?=
 =?utf-8?B?ekpPa25rUVRpak5INU1sQVlka29Ob3VGUE9JajhyakVRWHpJM1IwSDVhcVZB?=
 =?utf-8?B?VlZUR3ZqZE4vUi9TRWlHZVZ1VUp5RmZhdlN0aXFIc0d5SkZQaVN6Z21EaUVF?=
 =?utf-8?B?UzE1S1d5MTQvZFJPZ2pIS0EyVklQMTk2ZGVhRHBlRVRQaVpKQlRlTnJYZnVF?=
 =?utf-8?B?aDgwVUJMTjFYcEtoaWQxanB0NHhDUFY3ZjZkbGRwUzFVaVRNSU9nK1gybndn?=
 =?utf-8?B?eXdsUHNEdlVGT3BiZUVyQ1cxK04yZ0lKM24zT2RuYlgyS2JjTG9wSklRSkZ5?=
 =?utf-8?B?OVZtUzlrRGljNFc0MExubmtFaEJRN2h6Y3Z0S29BVTFFdlQ4QU9oZmhpdnhp?=
 =?utf-8?B?YWsvcDNhd1lWbXBmYjh4ak14MithR0VTY3grNlNGMnVTc2t1a01Sa1gxVE40?=
 =?utf-8?B?azZteC9sb2JLOENyUWJWcFFYMzRVWWVBYXJlVEZtZXM0SEpNSStiU2h2WlJW?=
 =?utf-8?B?UmxrdXJ0UURPZDJxVExVYUc3cGJQeU0xWlVNR0Q4eGxpZnA2NUIxL2lPKzdR?=
 =?utf-8?B?S0lHc2VFN2kzOG1mUVFEZUF5VlU3YmdwbEcvS29uZW84VWJ3TVNFQTViQ1pG?=
 =?utf-8?B?RDNhWmdJeDhTRVM5amZXbUdZekN1V2VveGRYY3kxVWFMSGNCeDB6TnNSZllw?=
 =?utf-8?B?TjdBRVd3UkRhMk5NSG1jM0kyd2xmWU9NalFROTFWNHFIWDhzYnJFU2N3ZERI?=
 =?utf-8?B?TzZmSk1JTkhmMWNvZFZld0NLdzhJUjNsNzNvM2l3TkpEbjRQVG9yT0RUNm5P?=
 =?utf-8?B?NjM4eGM0WG10TDdIY1Q2WkVTbGJmRHQyVmNnZkFqMTJxVU1LMkhBTlBZaGFM?=
 =?utf-8?B?eXNrVHNLZUdyaWtUZEpqOVpiQms1VW5MOVlscTM0dnBLSE4yaGR1aHB6VzZD?=
 =?utf-8?B?ME5pWU42Qys0bENEcVlSL3A5Vk5KcGdLcmFXcU50bmFsL3FtU2ZhajFGRXl5?=
 =?utf-8?B?ZjcxUkdwdEZ0QU9GV0Z3Kzh3bHBvb29LeHE4NmYrMmM4MnY3ZG5iWEdzMjBV?=
 =?utf-8?B?TUsrVEtpT2N0UDNKQ2RUMjlqcG9BdHNVQzhTUUpvdGZKY3JSb1o5SUcvSVRP?=
 =?utf-8?B?SUZXallabUVZaGdnbzV6Vy82VHovUitOT29TQ3oxSWZTOGxXTE5vQ1FVbDc2?=
 =?utf-8?B?anN1dkYvSXpKLzdzT3d3clo1dlg3dzBwQUM0OGdPMzBsTlU1aG5TZDBZdC8r?=
 =?utf-8?B?a2lYS2M3eFhPU0lxS04rOUxoSitCeW02MXJ6U0pUUUpxVTZCZ3lSbEtiRjFT?=
 =?utf-8?B?S0UxWUt0QTlWek1aVXZERU1VUUFoVjhXVFIxek91cmIzT2g2Uml1WkxjRUJp?=
 =?utf-8?B?K2RSRTBzU0NEVHY1V3I4c1RocEZEK2RHaUNaQitlWndsSVpZNTNidGVEK0xB?=
 =?utf-8?B?TTR3TEFWZEFSUVVJQ2F1Y3FUOVg1ZGFiQ2VXa2V3RUZ0UE82NzlBR2VvUE1B?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bdUiHMK+chQdLxqX4zqIeN1SENoowQPgjb0e9X1CkUOmub6oMDNAwtK1ucKoVJNdZ1cekZDCyaI2UY4qUjCVijKhS0uSNB3dR7aunSVZTTzvZWVNABsxvBAX5VwCVgG7mQTbwrappChRfxz4ldoAdcSbG1KyuuHNNjSsk3RPll1IdF431Lz6+rJ7aw4q6Qnc9KykRnoZJDIqu4MXlhqWBOOs3Gl4DqMEHVNqq6s64m79IU8iC3tZ4gvdg6yQyfp7tfUVIIHGnMAsJqeptwHGN+6ulj/xvZ3QPn3ERuaVFl/eIU9FQ0srBwNGbbNTnS73g/iKOI9iJUu+t5iAzWZrkhDueG1yxhMcHniYr+VV5KUBaOu8cXzYn8jcAAkcutiCN3Sdw2A9tQmM+t4NYpgdJNz5pO9eHPlxRt91nSKgkp+lCTW9906Bn/kuYwa2t4dbMTDHSXdCrNEdL0y6lYSr0u6Rfop1NmsDAlC7Ec98FpLSTcej2257MnepIpvV49a5wlauFUjQaZrMOmVbm1cOIvZqIsooSI7+u+txHOfDHRa2DXpWc353PwSdSQ7d3FDZFWhUYWGb3BGNmDblZBCzqOI1Vk9clWLvBP5VhKhaukYI7cuR+T9SFBz1e6ZBM6WKrz92DJedsYuE1NiXzwbfLPWUn0+IIC765JE801M+LN1XMTxkLbZ6ePEnLyFr1WgmHsJ1YeaNHnHHez+YhtanB6trNnWUTVlh9pkjnK0yx/CFXKXM7h+PSJxH3TCDQQ004zV6PbgpNRV5CF6dJUdQeLvKV4XQrdKyr+6X+Q9yAS7o9MuQLDK1VULHV+PIoBy2
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17dec429-fc89-46da-b66a-08db7ed0125b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 09:53:53.1695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J7XtngwYBjbVF6LEUaVY4DhhwkX8S57Gkqt19qWnH+kOA3l+iIf+ONflk5zZEe8RMqcdN1VtzsKLCsdiniei3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4980

The current logic to init the local APIC and the IO-APIC does init the
former first before doing any kind of sanitation on the IO-APIC pin
configuration.  It's already noted on enable_IO_APIC() that Xen
shouldn't trust the IO-APIC being empty at bootup.

At XenServer we have a system where the IO-APIC 0 is handed to Xen
with pin 0 unmasked, set to Fixed delivery mode, edge triggered and
with a vector of 0 (all fields of the RTE are zeroed).  Once the local
APIC is enabled periodic injections from such pin cause a storm of
errors:

APIC error on CPU0: 00(40), Received illegal vector
APIC error on CPU0: 40(40), Received illegal vector
APIC error on CPU0: 40(40), Received illegal vector
APIC error on CPU0: 40(40), Received illegal vector
APIC error on CPU0: 40(40), Received illegal vector
APIC error on CPU0: 40(40), Received illegal vector

That prevents Xen from booting.

Fix this by moving the masking of IO-APIC pins ahead of the enabling
of the local APIC.  Note that before doing such masking Xen attempts
to detect the pin where the legacy i8259 is connected, and that logic
relies on the pin being unmasked, hence the logic is also moved ahead
of enabling the local APIC.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I've placed the sanitize_IO_APIC() declaration in irq.h with the rest
of related IO-APIC setup functions declarations instead of placing it
in io_apic.h.
---
 xen/arch/x86/apic.c            | 4 ++++
 xen/arch/x86/include/asm/irq.h | 1 +
 xen/arch/x86/io_apic.c         | 4 +---
 xen/arch/x86/smpboot.c         | 4 ++++
 4 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index f71474d47dd1..9197b9532480 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1476,6 +1476,10 @@ int __init APIC_init_uniprocessor (void)
         return -1;
     }
 
+    if ( smp_found_config && !skip_ioapic_setup && nr_ioapics )
+        /* Sanitize the IO-APIC pins before enabling the local APIC. */
+        sanitize_IO_APIC();
+
     verify_local_APIC();
 
     connect_bsp_APIC();
diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index 424b0e1af8f4..dfa681846255 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -118,6 +118,7 @@ bool bogus_8259A_irq(unsigned int irq);
 int i8259A_suspend(void);
 int i8259A_resume(void);
 
+void sanitize_IO_APIC(void);
 void setup_IO_APIC(void);
 void disable_IO_APIC(void);
 void setup_ioapic_dest(void);
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 9b8a972cf570..120c231e0302 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1273,7 +1273,7 @@ static void cf_check _print_IO_APIC_keyhandler(unsigned char key)
     __print_IO_APIC(0);
 }
 
-static void __init enable_IO_APIC(void)
+void __init sanitize_IO_APIC(void)
 {
     int i8259_apic, i8259_pin;
     int i, apic;
@@ -2067,8 +2067,6 @@ static void __init ioapic_pm_state_alloc(void)
 
 void __init setup_IO_APIC(void)
 {
-    enable_IO_APIC();
-
     if (acpi_ioapic)
         io_apic_irqs = ~0;	/* all IRQs go through IOAPIC */
     else
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index cf9bb220f90d..f9e27a23d383 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1221,6 +1221,10 @@ void __init smp_prepare_cpus(void)
         goto init_uniprocessor;
     }
 
+    if ( !skip_ioapic_setup && nr_ioapics )
+        /* Sanitize the IO-APIC pins before enabling the local APIC. */
+        sanitize_IO_APIC();
+
     verify_local_APIC();
 
     connect_bsp_APIC();
-- 
2.41.0


