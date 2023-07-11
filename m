Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF7274EA4D
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 11:25:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561652.878139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ9c9-00042a-7p; Tue, 11 Jul 2023 09:24:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561652.878139; Tue, 11 Jul 2023 09:24:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ9c9-0003wA-2K; Tue, 11 Jul 2023 09:24:57 +0000
Received: by outflank-mailman (input) for mailman id 561652;
 Tue, 11 Jul 2023 09:24:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rRYD=C5=citrix.com=prvs=54940d4e9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qJ9c7-0003sM-Iu
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 09:24:55 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb0617a5-1fcc-11ee-b239-6b7b168915f2;
 Tue, 11 Jul 2023 11:24:53 +0200 (CEST)
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Jul 2023 05:24:50 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5920.namprd03.prod.outlook.com (2603:10b6:a03:2d6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Tue, 11 Jul
 2023 09:24:48 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2%5]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 09:24:48 +0000
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
X-Inumbo-ID: cb0617a5-1fcc-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689067494;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=VKmbY/AfEIQ8x2rbtfbq3gFHjE/7qQyOIwEMp8b6cTM=;
  b=NXPjKEVAMCB72GbOYi0TxDpgR7t2fDWvr5H6Pl/nALVoIKmBEse4LYfu
   SAapkesRp1b4jGrGadVLOWpD5VLXUfp+uTWjBnAuYOAEz5MxAo4NgNUtU
   6uMa8Md0D/4jaoLMPGtpkLT2u7QaNk/p2IAj19DNOM8KVjh5WZSxaeEFp
   s=;
X-IronPort-RemoteIP: 104.47.55.104
X-IronPort-MID: 115102749
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:CPu5EKr/Q0cqE5sPvH1Zbumf5l5eBmI8ZBIvgKrLsJaIsI4StFCzt
 garIBmCPveMYDenKdhxYN/k9ENUusXUz95kGQo5qClgQnhDpZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weBziBNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACszcQ2nmcLq/LWcF+kwpcAZKtPmMpxK7xmMzRmBZRonabbqZvySoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeWraYKJEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdtPTeXiqaI76LGV7lYRFUYkaRiCnaS4oGXnee1HK
 XwU+TV7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OcpQRQ62
 1nPmMnmbRRtv6eSUmm17aqPoHW5Pi19EIMZTSoNTA9A5sa5pog210rLVow6SPLzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQKzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:Yj/vXairmisWG8TS752HbU3aunBQXgYji2hC6mlwRA09TyX4rb
 HUoB1/73TJYVkqNk3I9ersBEDCewK5yXcN2+gs1O6ZPDUO21HYTr2Kj7GSuwEIcheWnoRgPM
 FbAs1D4bbLYmSS4/yX3OD2KadG/DArytHPuc7Oi11WZUVBbaV46gdwDQyWVndxWBJNCfMCZf
 mhD4581kOdRUg=
X-Talos-CUID: =?us-ascii?q?9a23=3AJqurC2iBNMfzJKpJuaZPofcyQzJuaUPC0VPOAxO?=
 =?us-ascii?q?EDkE0SOG2TWWW4q5qjJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3A2wzOIw1U++tYKNLwt5ESDRygJDUj2aazU3Ix0qw?=
 =?us-ascii?q?65siuHnVSBC+fvDS0Xdpy?=
X-IronPort-AV: E=Sophos;i="6.01,196,1684814400"; 
   d="scan'208";a="115102749"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DERKzIAU5+7kwWP0nDi9nhAfUGq+49P5GrJ7uSCu4flEz7xuNgUIhKwA1QvHFZGbzpwXyIN/Tsq1XoOxPmR5KvJAuEqYgX9mcwwmVJBfQLV6TMZgjmZQl+z7MqhrS8KckfI9oMKyczl8NWdv444aj2VMg/1/vuR+tgVMXoWSDQkcyj6vlN62atgWfO7CI83l3feJvlnmOqwbN24yreWiDIrTJMttry04E67xgXfsp6IJlEOBB0av20qRh26F0JOsYcBgPEMqcjLjui6mAW9SNi/3kGwloecRYuLz/DEq5pNMAyQkqDo27tCdNtBpCouxoiKbbAlhwfNM7/wUW2yVbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cR4uH4w+OQdrCDXWnd3VMjBEW6KojALchWf8cN+0MNs=;
 b=f3MKofGUseIErO/s5ntEswZwH9QmRpsiEx2EkeIgrG7lOzqxWm4rUoIX0E/wxK/wqVr8LxjQaI/SI5PH0DAgJ+U35L//Y+obJFlpnzY/Dat3bkQo8gA53UH1Z4C0maYFjDM2lYzSnzB2vXs39KwkCUaWIzEHqxkuj7y7Ua7zV//6SlCm2+fwIHO7PnP6cXm4khrc5EzQ46byRQu/FJ72ghtdgnCVlDa47EKxQ6p6AZWis8/E63CTkYDow5TTi1DlvFiBp0AEJXLQg3h0poDSF7NI13x3CG9JmtX4wZmGJ7tmM+kzMnR4ZQmPeilQEvY3FPan2bLbQXQP/Sx6Kt1HhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cR4uH4w+OQdrCDXWnd3VMjBEW6KojALchWf8cN+0MNs=;
 b=LhFtiKruTqptiV5+oY53aJUQyU0rTLlHyma5d6wna0/hCpkIay7bSyioGPYhrRAPYSaWpSALIGxDLUL+eg+9wdEXHSmpSD+XUeZAJ3g8zg7BDKwCFfGokqSyc35mX5A3EbmPipoU91JZwuKDGBdBrGPFQVWacc7ywrgzHT3fZ24=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 2/6] libxl: change the type of libxl_cpuid_policy_list
Date: Tue, 11 Jul 2023 11:22:26 +0200
Message-ID: <20230711092230.15408-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711092230.15408-1-roger.pau@citrix.com>
References: <20230711092230.15408-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0054.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::18) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5920:EE_
X-MS-Office365-Filtering-Correlation-Id: 6411ae18-4c03-4c04-a4b8-08db81f0ac47
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rA/hB5qA56df9qRQA2HnaLU0CNC+q7pF6duZWNtI0ALR7DVawnn6na4fv/aY3dNSZWqYVLAZfTrpmHFmj/EMSjzZDqLyxrBvoiNhZxWDnC9/QzanGy/ESwiR8yXvy0YRLvwRtHiywUqPSYnA3/e2awoM3laysa0pX9hsDTggCFH5F/GhbuEiHbzIiA4pXa68AUeZbKSLZsf6hcrk4UeTq4WALAU4Vt9TwJ2IZdAS/BQnpQqj0agndHcN1vXBLYsJMYJ2ksNQtJKB0XqTwxg/TfLc+Y8eInGbGjmsH+9c0V7QAgcf4qJ9ZRHSO1kMjizJLYxji47Dizx+dXtjNzubTx19Ind/s5/xiuJQcXDlmoYR2wgnmpITEzOveqIarQpdFP70+0swM0hNeIgSN1gDJCBf5nFkyDPRwp4255wQCsWU+ODP3ngNbr/QvAQ+24JI4NLbOiDF7Fle87hfAzzMDTw5nI+1qv3bggXQzwa+U7ieVeMIocLWwtTljfdmlg7mTXxc0vOZ0MZ3ATr1duxxzqweTzG2QYwV5fbUL0ayJckGBeOUVLC3CTenUZ56WCjc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199021)(54906003)(6486002)(6666004)(478600001)(26005)(6506007)(1076003)(6512007)(66946007)(186003)(2906002)(6916009)(66556008)(41300700001)(66476007)(5660300002)(316002)(4326008)(8936002)(8676002)(82960400001)(38100700002)(86362001)(36756003)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlcyaEJKck9Vckk0ampmeDlRa3dyTUVrdXhpTFczTTZBNTlkTzdHd1lSb2VL?=
 =?utf-8?B?RXFuaTEzVUlzYUpjME5CZEloSEkyWnhralBkM08wZ2ZIdzJOanduTDd3Tk1s?=
 =?utf-8?B?ejlORG9MNEFZdEF3L21kQ3RRR0tUWjVzL1BHNm9XcEJOcFZaQ3VYRUNDc2hh?=
 =?utf-8?B?L2srYnZTaVMveVpPb2tkeGRYTWdjMFk3OXF4MVdpNGxVVm5YVUZZbHZ5OHBG?=
 =?utf-8?B?ZmVmekJITC96N0VETnVQQjZkd2NiWjFnMmNBWHpLRks0NnpXbmU5NStYTUhn?=
 =?utf-8?B?cDFjVXZSVlFSclUwckovZWtqYzl5NjFlK1d0UkZVT0FJR1VyRmJYNVdwbElt?=
 =?utf-8?B?RmwrTWNLL2QzdDBiSkIzaHpmZDJFbG5Ra2Fvc2NWcFhsZjRWclZzY2FMdVlV?=
 =?utf-8?B?SDJWb2FPbms4SnU4WWVHSndsMWRNNi8vWU5pQUdQUXp5bnY2WTM4eVZUdUt6?=
 =?utf-8?B?aTlQRVBZNTBFcEYwVWxsdkZUVWVBTW83QzBiTU1mUGE2SVVsNlF4V3lORld0?=
 =?utf-8?B?bTFqamUxQndyVUI1dmg1YnZDaEE2amJQWWFLQVRlV0MwOXlZaGlxVGNrSHhL?=
 =?utf-8?B?STJNcHNMYTlQUkQvTVpEMEZtVkFVMlN1bHJkYm55SFlNYzNKQ2cvOUF6TGt1?=
 =?utf-8?B?SEo5WUZLdEJUTE96MjhHemQ4bi9kMldoZW5mQUY3ZWZuTXdpREZpOWYxYXYz?=
 =?utf-8?B?T25ZY3dKT1NVckRVRnRhY2ViYVo1aURXcll2b0hoSnUzdS8zMXhPL204N0ZE?=
 =?utf-8?B?SVJWaEtKK0VoQmp0Vjlpd0RnODdiN1hiVjRya2VOSFl1akl1MUhOY25CYThP?=
 =?utf-8?B?RGtaaHE2Q0t0M2pIeEUyTFo0TGxrd2FyOGV4T0czOUl1WlZaOGlBOHZ1aWl0?=
 =?utf-8?B?VjluMjBxa3pOcXpLVThGY2psV0E2eHJuUC9SVFB0aitNRG1IZjhBWjJuVDFG?=
 =?utf-8?B?VEJIWmFoNmp2eHhNMHhYQ2ExVUVMOEJFc21ZWmhCTThXajRwYTJVMFlUOHVU?=
 =?utf-8?B?ZFRSanVWYjRiaHV0Zkx6dnpOdDN0Y2JyNXE2UmFRMHNVbnA5UEhUbUQ4VVhx?=
 =?utf-8?B?OFhZT1hmUFRncitPNjRxREZ2TjhaUlJqR0ExSGljcGhZZWlJQmpzRUhGWkY0?=
 =?utf-8?B?cmdnaXhWZFgzZExMTVBvMGNKRERnbmNlY0RvajV6YjdSeFBvUzZFQ0d5Y25q?=
 =?utf-8?B?WFZnWTNFaGNjTWcvKzNNNVRqRmdiTlduN3FlQ3RURVpJSmx0akU5WTBCMS9w?=
 =?utf-8?B?RHVMSVp6dzJVS2RWVW83KzRDM3k3cVlwTVpKL1hrSkhudXVkSmYzbFVzTW0w?=
 =?utf-8?B?dHI5QTUxYUFpWGtOb3lHT1RtN0hYQWc1NGhZcVRjVmtEUGYycW1rNWlNV3pz?=
 =?utf-8?B?aGJpRldmNnYxcXgwRXFGUlozSklPTCsxOElKdkZITnhLN2xrRWpiUEVQZThv?=
 =?utf-8?B?YXdjQkJMOEwzTllSUjhObGhweDZWclhZZmdIVmNvNDVRYklGUm5ERnk2d1Bq?=
 =?utf-8?B?bzNnNTVoa0MyM0c2RzVqYmsxaGdmcXlESmxFcy9jQ0lmYXJWeDVVdXo2MHJq?=
 =?utf-8?B?clFVMmljdERYZnk0TmZobklVYU1RSGdyc0VvVEFOdnpLdXdJZVkxU2ZmMkJ3?=
 =?utf-8?B?R1QwUmg5bjdkbTA4UmhHRUxzblJ3OWRHNzVtb2NuRzR2dVgvcjFERTJJcTBV?=
 =?utf-8?B?NlpZWUlNTzlHS0FUR0kvTHAzNnFTYUlVVW9MTVdvWEpWb2hyWVBSMlk5cXBH?=
 =?utf-8?B?MjNmc2dKcURpNTFyaEpQVitjU3JYT2xpeDNsMDJSK0JzZE9yNmlUSUY4d3Nh?=
 =?utf-8?B?aHFNb3Rrem0vNkdHSkpjSzAvZ2UwMldTWjIrbW9kWVJSVWplTGZXdlhSUHpx?=
 =?utf-8?B?WFBWNVc3NFpBK1pnRDJIY0pnQjd1NUF0TmlDUkp0RTdNMTB3T3hwSUdFdXIz?=
 =?utf-8?B?RWlyK1VGTGt5dGRmT0ZGcTh1SGlXbkZtQU5Yb09DRXZJWXZPSERqcktIeGdt?=
 =?utf-8?B?T05qeXczNkl2b3FqejdKM3U0T0pCakt4aE9FMlpYc09nK3dieVdiU2hqc011?=
 =?utf-8?B?emt5c1ZzVU81a1F5a0lPaExERVVxU1lHMkZzY0laZlY4SE5SMHZQbDlKa1JC?=
 =?utf-8?B?alNXUFZOSU5tVlVDVVg2Z2JGOStOZURPVjQzNTJkYlkyWWFIRHFKT2lKcHky?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	E1OEhypwM5AcPqP9oPSTX4NjpxFE4BsB9pVA3Hj1rVgu+Sr/6ZAHhl7k2Fo39JpOHxcoHlupqad9bphEjYRR4rp3P46l0HtO5PAA5Mjyk9QwbNzaZv+99romNNe93EuIQK8zn9OLL4oxZe9ghSgAyS2kEqUM6khPyUe+SgICo/GtmMp4h9DokEgmlIe0xQeihfyEcvPT5wQfKaIRKOZge+VUOxAjP438I8m8jwpdodZ99h1iXrECP14XUfbbD+qi7OKosJVl+Ltfv4s4p4d0+msooPUoAq/7y5/QCn08Wj+y5q+IEub1jdDwy7xK1j/6a1Ak5ZU49Hz5MeSkiLM7dcz+GYxMDySFFOS80bXh/MyvCbUclxTHPXBDMMvetmEiLd++MQyDv7a2DxMeiwep0io1Z7YvCtp9TV3gkaX7dWM+mtuHq4Qdy/h6Z1woupMSKdn92/tPi2zoLIdTM0q5wOa1f7BJ/makExx5MJGiYHYGG+3V+4h/0kLRyxVwCY++B0/r0HZ3B68T/LqlMtt8mpopfMK4m3sfVKV97W32weTMxz6XRvEvd2PLdfFEr+/IZS2Z9WNbiWSL9t06ClvDHG3FcHxu3+LV1VLoSdlni6gtbWCBpSumEUJKK96d7hkANQ1DgCQuji1/SYVCzBXpiMzt7ahMlNUOtuPhmRUfwb8nn5srsSpEicHOMhTks6fF2Dff0CJdjo8Mkzlp5qX6GoM2s88AyUMXrTDDXpnWklYtrtAXluzORUVGP1qA2GYuedaqMom21tbulqxUvqzTMJr3+BUMQ5M4mDU7FY/u4G5p6/SuSBzz6MbxRcD275NR
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6411ae18-4c03-4c04-a4b8-08db81f0ac47
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 09:24:48.8299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7EsrjNE+JJGORscdvlCzaIscX8B0aPGLV9IJ7/EirMr0r8No0WFBsGGOcn/YbAqdzk6edTlkOjZYPP84QzJ06A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5920

Currently libxl_cpuid_policy_list is an opaque type to the users of
libxl, and internally it's an array of xc_xend_cpuid objects.

Change the type to instead be a structure that contains one array for
CPUID policies, in preparation for it also holding another array for
MSR policies.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/libxl.h             |  8 +--
 tools/libs/light/libxl_cpuid.c    | 89 ++++++++++++++++++++-----------
 tools/libs/light/libxl_internal.h |  4 ++
 3 files changed, 65 insertions(+), 36 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index cac641a7eba2..f3975ecc021f 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1455,12 +1455,8 @@ typedef struct {
 void libxl_bitmap_init(libxl_bitmap *map);
 void libxl_bitmap_dispose(libxl_bitmap *map);
 
-/*
- * libxl_cpuid_policy is opaque in the libxl ABI.  Users of both libxl and
- * libxc may not make assumptions about xc_xend_cpuid.
- */
-typedef struct xc_xend_cpuid libxl_cpuid_policy;
-typedef libxl_cpuid_policy * libxl_cpuid_policy_list;
+struct libxl__cpu_policy;
+typedef struct libxl__cpu_policy *libxl_cpuid_policy_list;
 void libxl_cpuid_dispose(libxl_cpuid_policy_list *cpuid_list);
 int libxl_cpuid_policy_list_length(const libxl_cpuid_policy_list *l);
 void libxl_cpuid_policy_list_copy(libxl_ctx *ctx,
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index c96aeb3bce46..724cb4f182d4 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -19,22 +19,29 @@ int libxl__cpuid_policy_is_empty(libxl_cpuid_policy_list *pl)
     return !libxl_cpuid_policy_list_length(pl);
 }
 
-void libxl_cpuid_dispose(libxl_cpuid_policy_list *p_cpuid_list)
+void libxl_cpuid_dispose(libxl_cpuid_policy_list *pl)
 {
-    int i, j;
-    libxl_cpuid_policy_list cpuid_list = *p_cpuid_list;
+    libxl_cpuid_policy_list policy = *pl;
 
-    if (cpuid_list == NULL)
+    if (policy == NULL)
         return;
-    for (i = 0; cpuid_list[i].input[0] != XEN_CPUID_INPUT_UNUSED; i++) {
-        for (j = 0; j < 4; j++)
-            if (cpuid_list[i].policy[j] != NULL) {
-                free(cpuid_list[i].policy[j]);
-                cpuid_list[i].policy[j] = NULL;
-            }
+
+    if (policy->cpuid) {
+        unsigned int i, j;
+        struct xc_xend_cpuid *cpuid_list = policy->cpuid;
+
+        for (i = 0; cpuid_list[i].input[0] != XEN_CPUID_INPUT_UNUSED; i++) {
+            for (j = 0; j < 4; j++)
+                if (cpuid_list[i].policy[j] != NULL) {
+                    free(cpuid_list[i].policy[j]);
+                    cpuid_list[i].policy[j] = NULL;
+                }
+        }
+        free(policy->cpuid);
     }
-    free(cpuid_list);
-    *p_cpuid_list = NULL;
+
+    free(policy);
+    *pl = NULL;
     return;
 }
 
@@ -62,11 +69,17 @@ struct cpuid_flags {
 /* go through the dynamic array finding the entry for a specified leaf.
  * if no entry exists, allocate one and return that.
  */
-static libxl_cpuid_policy_list cpuid_find_match(libxl_cpuid_policy_list *list,
-                                          uint32_t leaf, uint32_t subleaf)
+static struct xc_xend_cpuid *cpuid_find_match(libxl_cpuid_policy_list *pl,
+                                              uint32_t leaf, uint32_t subleaf)
 {
+    libxl_cpuid_policy_list policy = *pl;
+    struct xc_xend_cpuid **list;
     int i = 0;
 
+    if (policy == NULL)
+        policy = *pl = calloc(1, sizeof(*policy));
+
+    list = &policy->cpuid;
     if (*list != NULL) {
         for (i = 0; (*list)[i].input[0] != XEN_CPUID_INPUT_UNUSED; i++) {
             if ((*list)[i].input[0] == leaf && (*list)[i].input[1] == subleaf)
@@ -86,7 +99,7 @@ static libxl_cpuid_policy_list cpuid_find_match(libxl_cpuid_policy_list *list,
  * Will overwrite earlier entries and thus can be called multiple
  * times.
  */
-int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
+int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
 {
 #define NA XEN_CPUID_INPUT_UNUSED
     static const struct cpuid_flags cpuid_flags[] = {
@@ -345,7 +358,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
     if (flag->name == NULL) {
         return 2;
     }
-    entry = cpuid_find_match(cpuid, flag->leaf, flag->subleaf);
+    entry = cpuid_find_match(policy, flag->leaf, flag->subleaf);
     resstr = entry->policy[flag->reg - 1];
     num = strtoull(val, &endptr, 0);
     flags[flag->length] = 0;
@@ -400,7 +413,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
  * the strings for each register were directly exposed to the user.
  * Used for maintaining compatibility with older config files
  */
-int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
+int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *policy,
                                   const char* str)
 {
     char *endptr;
@@ -427,7 +440,7 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
         return 3;
     }
     str = endptr + 1;
-    entry = cpuid_find_match(cpuid, leaf, subleaf);
+    entry = cpuid_find_match(policy, leaf, subleaf);
     for (str = endptr + 1; *str != 0;) {
         if (str[0] != 'e' || str[2] != 'x') {
             return 4;
@@ -502,7 +515,8 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
             info->tsc_mode == LIBXL_TSC_MODE_ALWAYS_EMULATE);
 
     r = xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
-                              pae, itsc, nested_virt, info->cpuid, NULL);
+                              pae, itsc, nested_virt,
+                              info->cpuid ? info->cpuid->cpuid : NULL, NULL);
     if (r)
         LOGEVD(ERROR, -r, domid, "Failed to apply CPUID policy");
 
@@ -527,15 +541,19 @@ static const char *policy_names[4] = { "eax", "ebx", "ecx", "edx" };
  */
 
 yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
-                                libxl_cpuid_policy_list *pcpuid)
+                                libxl_cpuid_policy_list *pl)
 {
-    libxl_cpuid_policy_list cpuid = *pcpuid;
+    libxl_cpuid_policy_list policy = *pl;
+    struct xc_xend_cpuid *cpuid;
     yajl_gen_status s;
     int i, j;
 
+    if (policy == NULL) goto empty;
+
     s = yajl_gen_array_open(hand);
     if (s != yajl_gen_status_ok) goto out;
 
+    cpuid = policy->cpuid;
     if (cpuid == NULL) goto empty;
 
     for (i = 0; cpuid[i].input[0] != XEN_CPUID_INPUT_UNUSED; i++) {
@@ -575,7 +593,7 @@ int libxl__cpuid_policy_list_parse_json(libxl__gc *gc,
                                         libxl_cpuid_policy_list *p)
 {
     int i, size;
-    libxl_cpuid_policy_list l;
+    struct xc_xend_cpuid *l;
     flexarray_t *array;
 
     if (!libxl__json_object_is_array(o))
@@ -586,8 +604,10 @@ int libxl__cpuid_policy_list_parse_json(libxl__gc *gc,
         return 0;
 
     size = array->count;
+    *p = libxl__calloc(NOGC, 1, sizeof(*p));
     /* need one extra slot as sentinel */
-    l = *p = libxl__calloc(NOGC, size + 1, sizeof(libxl_cpuid_policy));
+    l = (*p)->cpuid = libxl__calloc(NOGC, size + 1,
+                                    sizeof(struct xc_xend_cpuid));
 
     l[size].input[0] = XEN_CPUID_INPUT_UNUSED;
     l[size].input[1] = XEN_CPUID_INPUT_UNUSED;
@@ -630,8 +650,12 @@ int libxl__cpuid_policy_list_parse_json(libxl__gc *gc,
 int libxl_cpuid_policy_list_length(const libxl_cpuid_policy_list *pl)
 {
     int i = 0;
-    libxl_cpuid_policy_list l = *pl;
+    const struct xc_xend_cpuid *l;
+
+    if (*pl == NULL)
+        return 0;
 
+    l = (*pl)->cpuid;
     if (l) {
         while (l[i].input[0] != XEN_CPUID_INPUT_UNUSED)
             i++;
@@ -641,20 +665,25 @@ int libxl_cpuid_policy_list_length(const libxl_cpuid_policy_list *pl)
 }
 
 void libxl_cpuid_policy_list_copy(libxl_ctx *ctx,
-                                  libxl_cpuid_policy_list *dst,
-                                  const libxl_cpuid_policy_list *src)
+                                  libxl_cpuid_policy_list *pdst,
+                                  const libxl_cpuid_policy_list *psrc)
 {
+    struct xc_xend_cpuid **dst;
+    struct xc_xend_cpuid *const *src;
     GC_INIT(ctx);
     int i, j, len;
 
-    if (*src == NULL) {
-        *dst = NULL;
+    if (*psrc == NULL || (*psrc)->cpuid == NULL) {
+        *pdst = NULL;
         goto out;
     }
 
-    len = libxl_cpuid_policy_list_length(src);
+    *pdst = libxl__calloc(NOGC, 1, sizeof(**pdst));
+    dst = &(*pdst)->cpuid;
+    src = &(*psrc)->cpuid;
+    len = libxl_cpuid_policy_list_length(psrc);
     /* one extra slot for sentinel */
-    *dst = libxl__calloc(NOGC, len + 1, sizeof(libxl_cpuid_policy));
+    *dst = libxl__calloc(NOGC, len + 1, sizeof(struct xc_xend_cpuid));
     (*dst)[len].input[0] = XEN_CPUID_INPUT_UNUSED;
     (*dst)[len].input[1] = XEN_CPUID_INPUT_UNUSED;
 
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 1cf3d400bfce..ef882cff3912 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -4869,6 +4869,10 @@ int libxl__setresuid(uid_t ruid, uid_t euid, uid_t suid);
 _hidden int libxl__domain_set_paging_mempool_size(
     libxl__gc *gc, libxl_domain_config *d_config, uint32_t domid);
 
+struct libxl__cpu_policy {
+    struct xc_xend_cpuid *cpuid;
+};
+
 #endif
 
 /*
-- 
2.41.0


