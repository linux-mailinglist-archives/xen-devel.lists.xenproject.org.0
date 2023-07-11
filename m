Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C47A574EA4B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 11:25:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561653.878151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ9cA-0004Ra-LO; Tue, 11 Jul 2023 09:24:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561653.878151; Tue, 11 Jul 2023 09:24:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ9cA-0004PU-Ha; Tue, 11 Jul 2023 09:24:58 +0000
Received: by outflank-mailman (input) for mailman id 561653;
 Tue, 11 Jul 2023 09:24:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rRYD=C5=citrix.com=prvs=54940d4e9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qJ9c9-0003sM-Pd
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 09:24:57 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc530944-1fcc-11ee-b239-6b7b168915f2;
 Tue, 11 Jul 2023 11:24:55 +0200 (CEST)
Received: from mail-mw2nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Jul 2023 05:24:55 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5920.namprd03.prod.outlook.com (2603:10b6:a03:2d6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Tue, 11 Jul
 2023 09:24:54 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2%5]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 09:24:54 +0000
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
X-Inumbo-ID: cc530944-1fcc-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689067496;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=tfUAR7LtcqUvrJvKJ650F7u8kbPSqfT9jS7QFyjj3Ug=;
  b=FtA2bJfLxA+6LXfxOaANViFRBAHS+slCN0qtC+fG5Nzw2vErFUQ03jya
   mCerVV8QZje9y/5R+DgBtTg/2UU39o0lnCrxpzm4TEhXlIDcsbUwbwbGi
   /CF4A3MzU0RjeB2tS5PZs9RsKqhVb3RiwnlvzZfl/h/rF9BiMQHoRck6I
   8=;
X-IronPort-RemoteIP: 104.47.55.107
X-IronPort-MID: 115102759
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gEvsFqoXWdgrZnmQ8+CmExTf/VFeBmI8ZBIvgKrLsJaIsI4StFCzt
 garIBnSbq6LZmrzfYhxatuwp0pQ6JLWmN5iTgNqr3w9ESgS+ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weBziBNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADcJZDWin/uk+oiAErBUjfwRCsTaA7pK7xmMzRmBZRonabbqZvySoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeWraYKKEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdtPTeXiqaM76LGV7jUIAz02fBiqm9KGrRSPBMJjF
 m4ppiV7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OcpQRQ62
 1nPmMnmbRRtv6eSUmm17aqPoHW5Pi19EIMZTSoNTA9A5sa5pog210rLVow6SPHzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQKzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:hYnFh6uaaaf+DLLu1w3go/ep7skDgNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd2ZJhEo7q90ca7Lk80maQa3WBVB8bBYOCEghrOEGgB1/qA/9SIIUSXmtK1l5
 0QFpSWYOeaMbEQt7ef3ODXKbcdKNnsytHWuQ/dpU0dMz2DvctbnnZE4gXwKDwHeOFfb6BJba
 Z1fqB81kedkXJ8VLXCOlA1G9Ltivfsj5zcbRsPF3ccmXWzZWPB0s+AL/CAtC1uKQ9y/Q==
X-Talos-CUID: =?us-ascii?q?9a23=3Ay/S+ZmjXaDmKlNX2hdVakE1USDJudXnX6VbIOl2?=
 =?us-ascii?q?CM10xEYWecW229ZJbqp87?=
X-Talos-MUID: =?us-ascii?q?9a23=3As1DJfg+7lZT8/x4VqGfKstKQf55z6ISOIQMcq74?=
 =?us-ascii?q?5nJO1ajxMBhWg0DviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,196,1684814400"; 
   d="scan'208";a="115102759"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e6ZH0UMnDMM1lo1hQHJSHul4dxbmkz+GjFFcZD8G4dRoN99lNOiaFN9D4pEpzr3Jb8/8RaX/D8efEu9jenwv2eZ5GdnSFt+YRmGVa6idnRcp4NfXguSDyEiTFneV54mbFle5xxEavf0gX96bUS+tyWM8Bv9p0tXP1T6TD/fPZjWkcAQlih/8ey0wkI3z2wL5w8g4R6QUARKFEh/AjdGt1dKtjbJ6E0jupHWOntafQbQFygGRyBUEdw/x/aysDbf/HcwH992TsR9ighWRka9uf00/hNQMZ6skGfbuhgCFWd8SI34Snakl3KFWvasNYtPhy+UVmJdafW+0dyQrRS7O3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7k1rS/yaURpqaZoQyG8Rolc9cmYKV1qsI38rLc/fzbI=;
 b=ZLeRCOPIGgzT1dKkVFoO8tsqeQATq4Z3m1A3/XR5ifqPA5sjwf+Nfa953Gn7I/hRROwbqIjXvUqJgTSwo75WsaQ+Ef/oazXQU7rKvlzbmdFiHINY7cZt2ci+q+cYFokgwhSaLLK7n7YtNCL0Qyj2Ry30bug0DfB10kMNY9HgLez4xgl8KEQR7Ew5MjjvNssRjs0fTFlSfECcHgbYtUNHIIDwSvSdqBSFnl6DoDLNCDQfzGw2KBcrBuLN45rNWiu9Cy6uhX+Lz8Qod6cyetdeHn8BuUtdcG15lZUcV4dwKY/UbLLkPqNTfVS+HqTlP4p90iroU3eCsns7lMhLQ0PQ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7k1rS/yaURpqaZoQyG8Rolc9cmYKV1qsI38rLc/fzbI=;
 b=PpLbDqx23OSwGywQa9TzTzIJsV0tPnKSKG9965zkVVsaZmY4nsjSSw5RFp2xYkRmOY4LHn7faFaH+a6HaFfVcW/+97juuGKHmA82PdSBZKwb+JprErsl8u05f5joTM31SgJ2NBU0HPEYApLz7NLAHp98USLCSSxM0rFMdlEBGfc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 3/6] libxl: introduce MSR data in libxl_cpuid_policy
Date: Tue, 11 Jul 2023 11:22:27 +0200
Message-ID: <20230711092230.15408-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711092230.15408-1-roger.pau@citrix.com>
References: <20230711092230.15408-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0153.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::14) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5920:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f38e971-1c79-4505-84ad-08db81f0af74
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/OT8RyQMPdBlZ/BpVvif7h3Y10MLxa8iAMwX5lwqJ6UxemidizqtrYTUuqlE38MxtpvdIphCg+8uldWZQDFEUZKTxdqFsWD1qWaZGVgI4BBCgy/inFWwOTv27cpSOdMD7YosRqxWJRdeqaPCNrJeO/se9KDffiCAlJ+XGvJV1pxa+RZxs3cn+jTH82OQMh0wR4T8jjOD4Mpeir55t7Cacsj8UnwiBGq+p+ZfG7ZWbjr3P8yOohn/eBFYPs06YATczWwXQ2LO2Mu9w2gAkK734BNzI57rSsD52R96uKzmWb5bRCMYk/5uHgnn9ySyZ3bLeKofPZ3xYdJV9xqGk67fwqdIS0Z5pxbUdr7gIvDBfi8T6q0gBQOpibzNcpu1oVx9H4ogV+NuTrmaH0mq9wGfAh/q/KoMDpM1VSJvBNxuhfLE7GUkqnalYeh+WaY0f+xRYfHEiR6/2g+bDyPd5o33hZSxNtLNN3N8RSMskU2sxZSYzbHBQiLEUTTCGVWXJcv3yZbWZMjIAlqaKNVSu1Znbpd84iFGkOkE2ApmpqkSyopDsjDz7wnFDpWMMh7MRQbJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199021)(54906003)(6486002)(6666004)(478600001)(26005)(6506007)(1076003)(6512007)(66946007)(186003)(2906002)(6916009)(66556008)(41300700001)(66476007)(5660300002)(316002)(4326008)(8936002)(8676002)(82960400001)(38100700002)(86362001)(36756003)(83380400001)(2616005)(66899021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3VuVVdyT2JSWmZHOUI2RVNvTlJ6QWRxT2VLMXowTjRMS05qcHR0QzBUN2pZ?=
 =?utf-8?B?QTUrQk9uWWdJOENJZ0RUYkVDU3QwZWY1SkNieVZmQVRQM3Zad0pFMmxQc1dt?=
 =?utf-8?B?dnVWTVRRNi9VMldRVUV5MWtBV0JnU0VaUWRCRmhUbzhBcVE3LzlpRHg2a2Ur?=
 =?utf-8?B?ZTk2TGh1cXpUV0VxUjNPWlZoNE96eThucTJHbHFSZ01PZ1RLdnVLbnNCSzk5?=
 =?utf-8?B?VEJxZGxYMDhBaWQ1MDlYNmtuSGZWd3VmSE9iaEJIeXY4bjRycHd5U0lmdkFI?=
 =?utf-8?B?Ukgzb3lKUW9JRGI4SWQ1YTZwV1YrSG5qUFZnNHlSV1EvT0oyc3gwWmFtRmNi?=
 =?utf-8?B?dHN0Z2dtYzZOWWpIaDBYc1JBOTRTclFyMUw4a04vOTduVlpHUlV2NHd5akdq?=
 =?utf-8?B?Y2QxRnpSTDllNmdnUmVzZ0hOVFFkSUdWL3ZwUHovQk9FRHovaFVsWWJEQWox?=
 =?utf-8?B?MXIvYktnUjZwSEtHbkdGd3Y5cnpqa3dnaTRSWk9Kam8yQ1dmdmRBb2tLWi9W?=
 =?utf-8?B?NkphS0RHSVZ0RjlRWmhzZDJ2aWIxODRiTjUraUZOcWc5Y3BXYUZtNU1ERHI5?=
 =?utf-8?B?S1NHY0pGOExPSW5Vd0pzMExueHFndiszVXp4ZFVFL0ZBcnRZTS9hdDQ0UjFw?=
 =?utf-8?B?M2pIbCtCa1R2R3EreWprZVl6RjBSZ1M4dFlRM21vWm1XUmhlUjVxYUlSU3hY?=
 =?utf-8?B?NklONzNXL3MwUTlQa25oMHBFcXhydlR0UkNkTHlvZXFBU1I0YWFBWnU5RXNR?=
 =?utf-8?B?OXdabCsyNndlaEhNQ0diTWdJRUw2dXRZUlFMaVN0MTdqcW0zWlVvNC9RYUJh?=
 =?utf-8?B?SHd1c2IwVVhzdDRpWjJ6T2duZGkrcUljaFFKN1VNWlJDZlk2UjVlUkhRYVF4?=
 =?utf-8?B?WEtlNjFMbWJ4aWdWeFdaL1dtY1VZL1oxeGM1VmkrZFQwTWR6T2VVYUxDMFlG?=
 =?utf-8?B?TUd1UnR0YmlWVmtZYkpGSmNDMkNmMndVdUtlWFVZYm52UmIyREdCS2ZJYTJ4?=
 =?utf-8?B?ZndTYlVJU1BQeXF2OG5wdUZXWkJ4MzU4VFhsb1p2UStodUN1Z2YrNmUwTGlW?=
 =?utf-8?B?d2pPNnNVV1B2N3lSQUNzWGYxMkY5RU42dGMvcHhjLzMxVy8zbDFsV3pMaHVK?=
 =?utf-8?B?QmtaQUhCSisvVWxqQ0VtZzZiK3BiVHRlbE9yd2dWZWlpRGVkL2loYU9uNGlm?=
 =?utf-8?B?OFdVS3JUTjFkaVJ2dm9mbFN3SjIrV3BrV3M1SnYxc0Vvd2svTlVBc1FUbFJ4?=
 =?utf-8?B?QnRlZ0JEWnB1YXl2VnBPcTQrZ0tja3puS2I4dmRHMnFFU3FZd0F3UVg1L0pS?=
 =?utf-8?B?ZzRTLzFSVGNzRWZDd0hLS0lLNzF3ZVVDZzN3a05iUkRGWmNvbmVsVURzcFdP?=
 =?utf-8?B?MWRRVFUyOHg1UE5zMk9VSnE3djJSOGNLbFR1Y3JLM0pXYVFyY0hKeGR2V0tD?=
 =?utf-8?B?cEs5WGxaNTdva3FvZEIzUDFCKzNPVThQVmFVZHRxU21LaXMzT3FlZXBISDNo?=
 =?utf-8?B?MUZ1RGlITklvdndVZjhqaGZLUFZyOEJZOHNpUDkyL1Y2bmRicWU3TXlpUHhN?=
 =?utf-8?B?T3lKTzl0VWZRWkIzakdPa0FzbUl1UFpML1dML2txbFB3SFRXeDJVczU5L3Bi?=
 =?utf-8?B?M0h3T0gwMFgveWNKU2pIQzlTSVQwRHFLYTBSZ01jTDBVUU00NGE0aFRodmhz?=
 =?utf-8?B?UWVUOEFoQWhJcWloSG9FTXdHOFFPcUNQYU5oM0pGRGUwZDhzTnNEbVRJYUtM?=
 =?utf-8?B?YzFzeHRCb1AzS2QwSWM3a1kvK1JySkJtSmtaRmptYmNHZDU2N3ZvdTBzWW9o?=
 =?utf-8?B?L3FwcUd5cm9LVzVCeGpHU1VZTElxeitYYlNvNWZJYms0WSthTDZRVzFmUXhK?=
 =?utf-8?B?anI1Qm5ZNU1JMjlLbnF1NWNGcG9hRXJiWWdxQmRqMmh2RG1zZVo0b1dseXN2?=
 =?utf-8?B?TW1WR0U5V3dKdVdyVWxYMC9MUnkrM3lpVkVOR1I5NlVybThPcXRYMUxZVHBC?=
 =?utf-8?B?VUlxbXNkcEdhTjVIRHZMMTI4UFM3UytMUFJjWFdqZ0xLY3I1RURiK0FuN3Y4?=
 =?utf-8?B?d1hJYmtSam5wdDBTNUpKUklNMzNYa1NGRlYyV1pUNWovdXdoNVVtMUgwOHhI?=
 =?utf-8?B?a2lGYmgrcW1zWk53MlRnazRPQXd4QlZqa2NMWm9Dd1hWNkJNaUZYVlQ5NXdk?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dLW8SPpt7qUVXIYMioACnshHmbIrSdYr9/trNhLakiIwg8Hn9mtQbmpfdI0eeU4sFxUZyhd1ebwssMt48UVn/u+b3REXFxUG6Ee/Q+VpRQ5f4c16XrYA9he+uNptLWIPCBsDjf4Wm7YrGiDdt+d+i3/Vscv+Cu4e4UvKRpiNcbzwzmRlzu5yvAjVe3nF3pDxpU8bfu1MZEgmHMUh5909HhiAjMglT6VXLjlfL0CVC4BnQWLQUphUeHoPb52NyXBWyfq7D9egKAvhJtOCMvWmQAFaCq4kXlODcTTHJV+aapYQFyu2qXcs5vajow52yWaYyq3H6e3RMqvJHqDFS9ojr75vFuB2Zh72ScGoigNxIHuLvj9Wcxktp0BCjmX60TtQ9vOaA3Bl9/0guzPeybPyoGEOpE18+45kOS5pslCPWkv/sqQd1OUMQDju+Us3FFUxz2xdPxKCr+7NwYFnAaRngJFy4SuLBdcmYn1hpvq1M2/6RRG9unHvAz1DOXuu+2p2/XFFcLdVIi5KLgJpg4/qXLNH889jIovgplbIpoktANFzGRwPU8s54vkUvS/ddE2/bUKAQ8Ab+JzzYaNNgMPq+X4So3UH5ffafYoQqosp3iRNh+kDvSGbzTYbujckC3vvITLMhgEbFfo3mlcm+886pMg6h6onsFkNTYKXeRAxcPoKXGp+y/KdbUWvNcBjjHqW0yYtxdAS+iI4egsAb6BWn4hTJKCsAaU7C4gmQfM2WL0nkOb5wA8+stoEzTwvWh6+2e6ilwBphtWgqJE0Y+fbG2UD0RY2BVvJL1+91X2VM7Qc2PMkJCvZDobFuZmnt/Z8
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f38e971-1c79-4505-84ad-08db81f0af74
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 09:24:54.1192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aSDvqEGHDHxwKDf2shMHY9nP27etJWo0Rzc7A7Zt18ZDVAw5+mIZLWPbkjFP/H5mwZ2sgqmAV+4ffaZRmc2dRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5920

Add a new array field to libxl_cpuid_policy in order to store the MSR
policies.

Note that libxl_cpuid_policy_list_{copy,length,parse_json,gen_json}
are not adjusted to deal with the new MSR array now part of
libxl_cpuid_policy_list.

Adding the MSR data in the libxl_cpuid_policy_list type is done so
that existing users can seamlessly pass MSR features as part of the
CPUID data, without requiring the introduction of a separate
domain_build_info field, and a new set of handlers functions.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/libs/light/libxl_cpuid.c    | 6 +++++-
 tools/libs/light/libxl_internal.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 724cb4f182d4..65cad28c3ef0 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -40,6 +40,9 @@ void libxl_cpuid_dispose(libxl_cpuid_policy_list *pl)
         free(policy->cpuid);
     }
 
+    if (policy->msr)
+        free(policy->msr);
+
     free(policy);
     *pl = NULL;
     return;
@@ -516,7 +519,8 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
 
     r = xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
                               pae, itsc, nested_virt,
-                              info->cpuid ? info->cpuid->cpuid : NULL, NULL);
+                              info->cpuid ? info->cpuid->cpuid : NULL,
+                              info->cpuid ? info->cpuid->msr : NULL);
     if (r)
         LOGEVD(ERROR, -r, domid, "Failed to apply CPUID policy");
 
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index ef882cff3912..b1a7cd9f615b 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -4871,6 +4871,7 @@ _hidden int libxl__domain_set_paging_mempool_size(
 
 struct libxl__cpu_policy {
     struct xc_xend_cpuid *cpuid;
+    struct xc_msr *msr;
 };
 
 #endif
-- 
2.41.0


