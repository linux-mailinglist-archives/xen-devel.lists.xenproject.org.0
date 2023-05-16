Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5839F70478B
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 10:14:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535053.832646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypp4-0000os-Py; Tue, 16 May 2023 08:14:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535053.832646; Tue, 16 May 2023 08:14:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypp4-0000ml-N7; Tue, 16 May 2023 08:14:18 +0000
Received: by outflank-mailman (input) for mailman id 535053;
 Tue, 16 May 2023 08:14:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S66/=BF=citrix.com=prvs=49309c509=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pypp4-0000mf-3r
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 08:14:18 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5127bb3-f3c1-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 10:14:15 +0200 (CEST)
Received: from mail-dm6nam04lp2044.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2023 04:14:03 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BY1PR03MB7287.namprd03.prod.outlook.com (2603:10b6:a03:527::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.32; Tue, 16 May
 2023 08:14:01 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 08:14:01 +0000
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
X-Inumbo-ID: a5127bb3-f3c1-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684224855;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Dd4Eol+LN3B5PwKhICww0ApXSdFPx3ZiTqhNmjYn/VE=;
  b=iO6rzPCzxwvRNAadfgZVFkYI8zMtyv/DdmXwUD3lrxgmRufiNrLr1qo3
   8/hMP2yIKeqkKXhkyblH1aNXhsG1Fr3ynG/9zgC8iciRiibK4SCg4TTGl
   lIQT2dFYZfgEXRxeSu3RsWEdqU45sT044z/lSz+KKy/HxBQJE1NkMoxBO
   k=;
X-IronPort-RemoteIP: 104.47.73.44
X-IronPort-MID: 111637002
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1eGoa6AX4VP+tRVW/8jiw5YqxClBgxIJ4kV8jS/XYbTApDwq1TFWn
 WdNUW7Vb6uLMTGnc953Oo21pE4P6sPXmt8yQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G5B4ARnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwpcF1B2VXr
 uwjeXNWTiCCuMGN2r/nc7w57igjBJGD0II3nFhFlW2cIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK/uxrvwA/zyQouFTpGMDSddGQA91cg26Tp
 37c/nS/CRYfXDCa4WPcqyz32beXx0sXXqoNMOHk5NhhkGeChXUYOEQXfnLlm+Km3xvWt9V3b
 hZ8FjAVhbMp6EWhQ935Xhu5iH2JpBgRX5xXCeJSwAOHx7fQ4g2ZLnMZVTMHY9sj3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqTR8JSwoMpePqr4A6ghvMSctLGau5yNbyHFnY2
 CyHoiE4gPMIkccB2qG//FbGqzupqt7CSQtd2+nMdmes7wc8aIv7YYWtsQTf9awYcNrfSUSdt
 n8ZncTY9PoJEZyGiC2KRqMKAa2t4PGGdjbbhDaDAqUcythkwFb7Fag43d20DB4B3hosEdMxX
 HLuhA==
IronPort-HdrOrdr: A9a23:5Wbiha12O2FGAzETeCZXQAqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-Talos-CUID: 9a23:nov8VmyWmHrXtxWo2hK/BgVLPcIjdmSG3EyBYBSYOWdWa4aPRAOprfY=
X-Talos-MUID: 9a23:mw6ZsAZaq1QMT+BTqBuw2CNEP9dS8ue3A3BUkL4v5fOfKnkl
X-IronPort-AV: E=Sophos;i="5.99,278,1677560400"; 
   d="scan'208";a="111637002"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bn9GmChGysk0AnphPo8Fb5gMz4QEYU6TA6dt7x7XrcqiClSuayneIbvpT/tYV44/dbdUgOiPN167PMudsJrc3fICDVeXazEeD1lAONsWBxWkV1cRwkHD4HuQUCnk+d121DqKaRTpXLRy5ED2oQv1yefloC3m/IN5BvjFoTPVTM6rWbpjwVQxjbZFIH9fMTtEY9+THmW63P7fesghef2vmExNsQCFJgRr5IQZHeFf4BJpZBNWQxNA+ANdJo7qWFDGG1p8MDWUWH++k11IqFw8r+ntUHayJBcAe59p1H7puTC+K3LQY1lZHmNTz1BW6/tHs+3jpLVdxBsvkCzfaEbOSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2xxTbrJMtABL8oVUueyZxOvtbDMN3uh8lgsL1GTURU=;
 b=SlJdJlETOjx8LzV76XNXyazyXgwGfL76WEEtITJhdt+qCcTpV990WQUM6Vy9xe9Bk6CgLnlqfuCd9/pHpk5XC1UX1M4Lw9ilDLv5x/3qyaEnIfxatEGSM+32GbCjGQE53sYdNwd96jFeAWV9ADvAuYVNvsuNFsp9VyNmjsw5cgUiHjn7X8euah0b9iY2Z+75lWSTYZZIaqvgN6lY7IBlj9Uh8PqhtwCkDDKK5mz1CNgi6OWHWh3Jh1tkLcswMzVEbpQI97nrTwWtDqLeTXFoek9J+ok8wNCQs0NH7bgmafPvbm8sIi0ztM8VKtC7QdFcNT3EJeJ0WxQe+V18D76p+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2xxTbrJMtABL8oVUueyZxOvtbDMN3uh8lgsL1GTURU=;
 b=gs9PmkemtLhptTSx3AabU8VC7Wt2LG11t8ZChSjILX099Aq4CpfbQl525+2ZiRpXl+g0CXFVofOI0w41wxGUnEP4UMkIsAyMB4wNm9Ma/bXUk1Sx6RO3Ol+uN2iN3Iwrq4N70/8hs6PCQaNIYHs/+SUBDnXG0eDC4FZuYHqXH6Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 16 May 2023 10:13:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org, Xenia.Ragiadakou@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH 1/2] xen/x86/pvh: use preset XSDT header for XSDT
 generation
Message-ID: <ZGM7Q+uOm1HRvaTC@Air-de-Roger>
References: <alpine.DEB.2.22.394.2305121801460.3748626@ubuntu-linux-20-04-desktop>
 <20230513011720.3978354-1-sstabellini@kernel.org>
 <ZGHx9Mk3UGPdli1h@Air-de-Roger>
 <81ac6e51-6de9-5c4c-5cbd-7318cae93032@suse.com>
 <alpine.DEB.2.22.394.2305151712390.4125828@ubuntu-linux-20-04-desktop>
 <ZGM6X19p50oSqbNB@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZGM6X19p50oSqbNB@Air-de-Roger>
X-ClientProxiedBy: LO2P265CA0095.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::35) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BY1PR03MB7287:EE_
X-MS-Office365-Filtering-Correlation-Id: a61a6744-65d9-4682-7a25-08db55e58180
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Je+jz57fLGphT2c+RhmNy2uw4+7ZUbqmNAlg2GI6HkP1fc+EjMn3nfQ7kAayoyBNcuDAi9NUWKoVCLyAFEgMJDDzsk9/ECCyWUkGBQ0r/EnhSoUg916ZLL36ZU/CF8bkUTBmZEvKRB13xPSZaHKISBRKblfuogUBI/BULvQjLD13ihl0uwg6szZQZhZpDDnT1WIU7d5pHzmKQ2k4Bhm3SQ3lBo6JaeZLnqh6qXD/gixY+QM8x5IwWZvOHFOIkJB9zBygT8q66PHK5mH3QCZoh7gHmO+H4rNT+qdo2kXfUPTj0gFUQE6qIwuy74FNcKU05zW+cPrGRw7TLVOzapddw09BzZbb6QFvlDf2qMrT6tNqH9KHG1W5A2Um66NmtI2etQO0ULAF7a/Z8BQ8Y4aWyqJP3/7EFzJGCIRcKWv6FpCdATwOp7V9VScTzc8zTwPHG2rIA/eDpcq3ADgLZ6AVAl827SRELFCQV+FtLgkDEgtVAfHWsEHh1MR0oH69xoN9Zfi+cmEgNoyGQJAXntC9kGdCLlecCZrI4JD359q9q4NaG2JMskTIocfxCYY8aFw7q4AP6wOFHhdx/8TexwU7WHVt2euDpEe2lix/XeJZkKA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(451199021)(6486002)(6916009)(4326008)(478600001)(66946007)(66476007)(66556008)(316002)(54906003)(86362001)(85182001)(83380400001)(6506007)(6512007)(186003)(53546011)(9686003)(26005)(5660300002)(8676002)(8936002)(2906002)(6666004)(41300700001)(33716001)(82960400001)(38100700002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1k3QnFtTTZRa2dYMUh5NThHL1ZLbnBwU3dOMWNWRk1zYWxUa2h2TmFaVmkx?=
 =?utf-8?B?bEYxaEVOWkpCSWgvSW03MVovTjAweUZhSTRrUTZpTnd2VGVUZjRBWittSXRS?=
 =?utf-8?B?S1NWUnZXRi80SmZnQnd5NEcvQk8wb3ZMdlNOYjE4QUdndk9VdU5Lc3dhUmNE?=
 =?utf-8?B?bTQwTTZKckRlSGVuL0NzS2VwWGNvMllEbytNZW51UVhGcXRWSVFsRDAveFBL?=
 =?utf-8?B?aGRndzQybWYrZDVXejRzQVpRRzVYMWxhVlVCajI0c2tUbkVSL1ZOVmtwUHRk?=
 =?utf-8?B?ejlvbzdPUDlSaVV3SHB3RFZXdE1RdlJFUVVoRDdTOUhyVmt3NUxJZ1lvWFpa?=
 =?utf-8?B?eEdxNFVsQjB0aEpuVGRSQ0pWeXFNcWM2RFVIWkhqVEdiT051dldOVzBDQ0U0?=
 =?utf-8?B?TVlmYjZGeHNiN0J0Mm5qOUJWbHhrSEVPTVVkY2k2MG1mSUhKSDlTaDBUY0RN?=
 =?utf-8?B?YVM5WWw4Q3NNMkw4ZFVJQitqUFM2TE9HTDdCK0FWV3VDU3BIVzVqUmpqUGZn?=
 =?utf-8?B?SDFIcUNobjRNWis3bWxkbmk0SWhlSXdrRjlGUFc5WkFKZ2U3V1Y5NUE4VGJP?=
 =?utf-8?B?UlUrTmFvK0RFVkc2L1Z2QTJhalFKOUl6MnpINm5QT245NzNEYlhMQ2YvZGRl?=
 =?utf-8?B?LzBucXhuL213MW55RC9MUG94ZHg1NmJ5SjhOS0w3QnFzeksrc2pWUHQ4UDJa?=
 =?utf-8?B?dUZxOHR1REJiZ2ZqSDBMY1JRWTVFM29jWkJsdmN1ZGoyTlJNbUZjTHVwL0dy?=
 =?utf-8?B?SnlSNUpzM2VnNGNDTVc1UVVJd0t1blRCdGd1YStwYVc0aXF1bmJVc1F2T3ox?=
 =?utf-8?B?NHRvWkNyNXhzMm9ONjhaR3puSjZ0RkdhVkZJK29tWlliZHp1SkVNT2FQaUhQ?=
 =?utf-8?B?Ly9wMWxkek10NHFoUkRydWQ4R1R4UW9kWHlLODVIOWp3TE9kbCtVamxCL0p2?=
 =?utf-8?B?WndxWlE2Q1VVeG9nY0xUZWJlWldmYUxvN0hWRVdhVVJJNkNZZk9aSU8vV3lm?=
 =?utf-8?B?aXlmU3lxaWpzQlAvSXZSUnVmUlhRU3ZXc01VK3lxTmNxVEhpZjZnV3MvZUo5?=
 =?utf-8?B?RWZJNDhEclB5cnZXcXFTTVVNY2xhb2lJVkk3RUVxRUtwdDBrblNueTJZckE4?=
 =?utf-8?B?akdabVcvVWxIZDVwUGgzcTdJazduaS9QQVFMS2tuMC9sTE1ibWNtejBtU3RV?=
 =?utf-8?B?bW5kbTl4ekZNSnF3Y3JTT01jS1IzNFdMeDRaWGU3L1pmVVZBWU5IL0ZJVmpW?=
 =?utf-8?B?TVRnVmY0N1Z4ajBzWGZhdk9hMS9Oc3dpdjUvL2RWbUtIUGRYSWUrQldwVEdB?=
 =?utf-8?B?UTZTeitSYVlhQXhrVEk5MlMzTDFwRlM5THZ5ODh3cWhlaFRNMXBKSDZyYjQ0?=
 =?utf-8?B?OXFVYWNuK1BqOUhNd3Z2bFdlNVJCZEFyVVE0c0N2RGpZU2ZwVGg2MnRYSW5t?=
 =?utf-8?B?S2Y4bXlSbmp1WGZhMnQ5cTlSY3crSm5FTHIvRW81b083SkJab1UvWVdrUTR5?=
 =?utf-8?B?cDBTNzJ0ckNMaFVOcjNIUjdzRTVBbXlZRkVGV1BRN0RXWCtpZ0E4R0szajZp?=
 =?utf-8?B?cmlySEExZlBtalZmM2U2YW8wZWZqS3Vrak9TYjAvNmwrSExDdkphMTliOFk4?=
 =?utf-8?B?cWpORDZXbGduVnBZTjRxVTcrSkpzY2JNaEFONWYyYTZjaFNxR2xHOWZrRVRX?=
 =?utf-8?B?VTVJc2Y0Uzg0Y25tdEpTVnBDK0NtbVVpWUVab052VjJXU1NtRGxwbDNEZ1RH?=
 =?utf-8?B?OTM1UEZTVktCVVM1NkNZRjdlait5cHd5SnNtQkt5blp5L1IxSmptUk9SVHZB?=
 =?utf-8?B?LzVaTENHL1VQemRMVjlxWFY4aGZpaUdIRDlZaDUyZ0x6NWozSTZhclN6azAr?=
 =?utf-8?B?ZXF4SXNWSVFnOUsreGZBdko0WHhUNXZ5TEtEb2hYTXNFdUhSR0NiN3V5N2hp?=
 =?utf-8?B?TnRjL2xHZXBBQ2FIa0J1VDNMZkltSzFqeVByOWpWaldla3Jjbkp4cjYrcUlq?=
 =?utf-8?B?cThGRkl1b3B0WHZsaEJlSE5aajFtYktpQ296VGZvY09zclQwQkpXSVdpODMz?=
 =?utf-8?B?UW43STF3dDJsZ1pSVkRiUk5YcjFGTVlValI3dzFuMFMzZFczNG95d3JMK3V2?=
 =?utf-8?Q?C2uQE3UV3MNAz6zuuzks28aNe?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qnbDUphpEIDBrS0bDq3xXnUwP2DaHDHo51N0FDu9QiMr+xFD/CsbYc7qu7cVB58fQPg564pvpQDkOBt+IonhIul0bdRBPdXAfCKJSYC6k5W4rugoYyXt8E5A3lYb/xByxNYxWY6svXBhLcyT6kQ9m4q4CNPV3IanvPKFCLAlGxBct4pP2WQKjPjKqBY1bYypimtjvLvqNneOCCIlU5/EsTqd5DZO9GjSb7HAyLCSiPwgvGthM4jj/SUdP+r5XxrZompKy43z7EvcN07ktMh9YAgWHk4TAYRlUtrEv3lS1Xaf+22qze7GsXO1vlujYFKC6k235Gk3KYKr3T7F40bt5UTeKgJB9afUoojQIOuvSDD0siyNMjVXCMaV9a74UQBsytTJflo2CrMsSChma/EM0LpC+8VMPy7ynbYYwCAClbk2S5bAD7uLr+AR5nd+ZmpOZiqRuqemPOCVvIs+lPHMkXWbNKeiqJDj9wKPm1RdDGE9S+RVCmSCbMKi+TWnPv3gQdWovW+90VX2Ssf8GtnwSe1q8ZcKx9BLorTO4ocKC8C8UeIjDccUVan0Ed8HVsymrbWDvmWQqymNBcAZYUqsmWEbkkc6aVnVUmUIwhmGPAOXw5DMYcEHvsVNDTjDVKtOJxn65KeG2q8LwryckpcSMk8UK7pl2/CCIq7MEFMTWu397PcPtSpZTskcE4JuvHxaAWqwhgXjhV86XrcltZbRTdSV4Y+Iq/upcW/rHHgDVs6RNFX6BhyzAiwqmJ84Cw1TCRZm6zPztjAE+M0sNh9QG0dkxzsimolpuz38sfeu5muYiQP5Ifl6zGEbwKXimLeLaYcWtsUngasyWuMVJrMYEe8IVwIw2h2HCG99HSAG4QA=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a61a6744-65d9-4682-7a25-08db55e58180
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 08:14:01.4407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zn1DQgxpGb9oNcRgdHoM/Rg9h2+5DmwElPpcUllHdmL+5Ms/28lIwazpHGFojbgqpj2/Cft9XWSOAZYMzYmBcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7287

On Tue, May 16, 2023 at 10:10:07AM +0200, Roger Pau Monné wrote:
> On Mon, May 15, 2023 at 05:16:27PM -0700, Stefano Stabellini wrote:
> > On Mon, 15 May 2023, Jan Beulich wrote:
> > > On 15.05.2023 10:48, Roger Pau Monné wrote:
> > > > On Fri, May 12, 2023 at 06:17:19PM -0700, Stefano Stabellini wrote:
> > > >> From: Stefano Stabellini <stefano.stabellini@amd.com>
> > > >>
> > > >> Xen always generates a XSDT table even if the firmware provided a RSDT
> > > >> table. Instead of copying the XSDT header from the firmware table (that
> > > >> might be missing), generate the XSDT header from a preset.
> > > >>
> > > >> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > > >> ---
> > > >>  xen/arch/x86/hvm/dom0_build.c | 32 +++++++++-----------------------
> > > >>  1 file changed, 9 insertions(+), 23 deletions(-)
> > > >>
> > > >> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> > > >> index 307edc6a8c..5fde769863 100644
> > > >> --- a/xen/arch/x86/hvm/dom0_build.c
> > > >> +++ b/xen/arch/x86/hvm/dom0_build.c
> > > >> @@ -963,13 +963,18 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
> > > >>                                        paddr_t *addr)
> > > >>  {
> > > >>      struct acpi_table_xsdt *xsdt;
> > > >> -    struct acpi_table_header *table;
> > > >> -    struct acpi_table_rsdp *rsdp;
> > > >>      const struct acpi_table_desc *tables = acpi_gbl_root_table_list.tables;
> > > >>      unsigned long size = sizeof(*xsdt);
> > > >>      unsigned int i, j, num_tables = 0;
> > > >> -    paddr_t xsdt_paddr;
> > > >>      int rc;
> > > >> +    struct acpi_table_header header = {
> > > >> +        .signature    = "XSDT",
> > > >> +        .length       = sizeof(struct acpi_table_header),
> > > >> +        .revision     = 0x1,
> > > >> +        .oem_id       = "Xen",
> > > >> +        .oem_table_id = "HVM",
> > > > 
> > > > I think this is wrong, as according to the spec the OEM Table ID must
> > > > match the OEM Table ID in the FADT.
> > > > 
> > > > We likely want to copy the OEM ID and OEM Table ID from the RSDP, and
> > > > possibly also the other OEM related fields.
> > > > 
> > > > Alternatively we might want to copy and use the RSDT on systems that
> > > > lack an XSDT, or even just copy the header from the RSDT into Xen's
> > > > crafted XSDT, since the format of the RSDP and the XSDT headers are
> > > > exactly the same (the difference is in the size of the description
> > > > headers that come after).
> > > 
> > > I guess I'd prefer that last variant.
> > 
> > I tried this approach (together with the second patch for necessity) and
> > it worked.
> > 
> > diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> > index fd2cbf68bc..11d6d1bc23 100644
> > --- a/xen/arch/x86/hvm/dom0_build.c
> > +++ b/xen/arch/x86/hvm/dom0_build.c
> > @@ -967,6 +967,10 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
> >          goto out;
> >      }
> >      xsdt_paddr = rsdp->xsdt_physical_address;
> > +    if ( !xsdt_paddr )
> > +    {
> > +        xsdt_paddr = rsdp->rsdt_physical_address;
> > +    }
> >      acpi_os_unmap_memory(rsdp, sizeof(*rsdp));
> >      table = acpi_os_map_memory(xsdt_paddr, sizeof(*table));
> >      if ( !table )
> 
> To be slightly more consistent, could you use:
> 
> /*
>  * Note the header is the same for both RSDT and XSDT, so it's fine to
>  * copy the native RSDT header to the Xen crafted XSDT if no native
>  * XSDT is available.
>  */
> if (rsdp->revision > 1 && rsdp->xsdt_physical_address)
>     sdt_paddr = rsdp->xsdt_physical_address;
> else
>     sdt_paddr = rsdp->rsdt_physical_address;

(please add the missing spaces in the chunk above)

