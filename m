Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC2B699CEB
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 20:18:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496755.767619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSjkQ-0003gk-4d; Thu, 16 Feb 2023 19:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496755.767619; Thu, 16 Feb 2023 19:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSjkQ-0003eI-1h; Thu, 16 Feb 2023 19:16:50 +0000
Received: by outflank-mailman (input) for mailman id 496755;
 Thu, 16 Feb 2023 19:16:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ntZu=6M=citrix.com=prvs=404d376a6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSjkO-0003eB-C6
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 19:16:48 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 706e92c0-ae2e-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 20:16:43 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Feb 2023 14:16:15 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5377.namprd03.prod.outlook.com (2603:10b6:208:285::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Thu, 16 Feb
 2023 19:16:09 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Thu, 16 Feb 2023
 19:16:08 +0000
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
X-Inumbo-ID: 706e92c0-ae2e-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676575003;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=R/1xp1D2RB3JIdTjg5eKgdNTLhUlMQoOwPRpo3SD9+c=;
  b=Rz5+uXlG3QaI3zaG3ha1Ql2VD+YD1XjASvUlKEPMuctuEnjKbJxCuyR4
   P/ZB+aWyK7LMAMSbAP3yOMfEl8T2LLWaBI9GHffFWaaxL6PglkaxrAVac
   P9QFFsdmO9nEqgXbTqovLu4Z1sJKSHBvAApEhCfGvwcqolGQOxM9atGHX
   4=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 97278691
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:uZYs9aku6GU7OscOqlGvdWXo5gysJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWC2+Gbv7cNmb3e413PYngoR8HvJ7Rm9IyT1RqqX09QiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgR5QGGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 axBLyJXRyDavMaZ3ryVc7Ez35s9Bsa+aevzulk4pd3YJdAPZMmaBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3iea9WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapDS+fnpqA72TV/wEQXKwMkCEOWg8CHl0/9Uv8GI
 VAayxQH+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6GAkAUQzgHb8Yp3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqWMMfZQ4M4t2mqodjiBvKF49nCPTs0I2zHizsy
 TeXqiR4n68UkcMAy6S8+xbAni6ooZ/KCAUy4207Q16Y0++wX6b9D6TA1LQRxa0eRGpFZjFtZ
 EQ5pvU=
IronPort-HdrOrdr: A9a23:QRUCnqsoSCU8WWPnYxgLPKYU7skCa4Aji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MArhHO1OkO4s1NCZLXTbUQqTXftfBO7ZrwEIdBeOldK1uZ
 0QFpSWTeeAdmSS7vyKnjVQcexB/DDvysnB64bjJjVWPHlXgslbnnhE422gYylLrWd9dPwE/d
 anl6h6T23KQwVqUi33PAhMYwCFzOe75q7OUFojPVoK+QOOhTSn5PrTFAWZ5A4XV3di0Kov6m
 /Mli3+/+GGv+ugwhHR+mfP59AO8eGRhudrNYipsIw4Oz/sggGnaMBIXKCDhik8pKWC+Usni9
 7FpjYnJoBW52nKdm+4jBPx003L0Soo6VXl1ViE6EGT7PDRdXYfMY5slIhZehzW5w4Ju8x96r
 tC2ya8u4BMBR3NsSzh75yQPisa3HackD4Hq6o+nnZfWYwRZPt4qpEexlpcFNMlEDjh4I4qPe
 FyBIX35epQc3mdc3fF11Mfi+CEbzAWJFOrU0ICssua33x/m2149VIRwIglknIJ5PsGOu55zt
 WBFp4tuKBFT8cQY644LvwGW9GLBmvERg+JGH6OIHz8fZt3e07lmtrS2vEY9euqcJsHwN8Zg5
 LaSm5VsmY0ZgbHFdCO5ptW6RrAKV/NHAgF8vsupaSRh4eMAYYCaUa4ORQTeoqb0rsi6/TgKr
 WO0Mk8OY6lEYPscbw5qzEWFaMib0X2a/dlyerTa2j+0/4jFbeaxtAzUMyjUoYFQgxUE1/XMz
 8kYAXZAvlmwwSCZkLY6SKhLk8FPHaPsq5NLA==
X-IronPort-AV: E=Sophos;i="5.97,302,1669093200"; 
   d="scan'208";a="97278691"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/NXhttVcoskLkIFbVIQA5disUpr8YHp6IfOHjO95W1aOoLgj16JDtKowCfZAiU+Mr18/5igDZobIOES9ilF3xAQkHDsbbnzafD0kDqGVjFFkyyYqjIoCSVBGsMEfYSUVrKJoefbtyNFq4XgM9+tQ89EsY79UiaFeXJoFpgUF17HN+SfI+EM7CJ/yhXVembj1z+8hzntYSmSv6P3YK0YoPnQzB3xRfadFXv6yOi/VfUT4yfytcs+v2bEYRwUdlDRvl79ySmb5GMSFIAwjl53Q+RFeiZEHZuxYUBrRxdwm2rPx14Vth11PeKztxFX8muWDAJ4ZxvOzaSIlf5fIof+Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcuN25BzXiIPNxzbrQUOhWcdNGeIF9a4jM1EDS0Yz2M=;
 b=KnJNyWcpJCwaWwzgX3FVi81Becd2UUMx29giXGS2/A27C3RcSQ+ZYMEMNOaKfFFZDQ4nLyJcDPh8yL99GAj19XjY2sN5Qwmmwm189eN87vnzVe1IiMjZuszQRZYXCzywuzxkU72QwExr+JL3cqqP7JIGBVSHvNMD7uFGKliP3nRYM/oGk/yVe2b/uw8v7b+74v2qCmS9ykKz7EdjWzGiZdbNk8ef2Nz830cFOzIWcxkF6atwT/QKndQpvD9dDVOqFmWavuc8cm+t89s5wwC4ZkZkmhq1AW65qGuUVDuTXu5ARUbF6be3qJZ5eB4OjQfozMQEGd5ya7/HEYJkdc2iWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcuN25BzXiIPNxzbrQUOhWcdNGeIF9a4jM1EDS0Yz2M=;
 b=YYzJ/IYFzEIee2h/y8DP0tLc0d12HD2c02naU+PEYgJs9KYa49hUdQMVdxc7cZcAL2gVSlpkiN6L55rT0yfN5VvbTRcgPitKcBASEfF9UsxUoTSOOjHwg4q8Ptpt3/M0OsKAeNeCPIZsZP7yWOp5QNzhmoVUX7wal9QNvXEFvcU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2d68b595-f49a-884c-de1c-12b34a9c11bf@citrix.com>
Date: Thu, 16 Feb 2023 19:16:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/6] x86/MSI: use standard C types in structures/unions
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <98c3141c-9d49-695e-a936-4e755a4fc527@suse.com>
 <9f375055-eff2-010b-c904-e4122b834777@suse.com>
 <bdd6e011-78e3-4f5d-9005-d9b385b859ae@citrix.com>
 <7e160b28-ba80-c2bb-fa2a-5d5411c7d22d@suse.com>
In-Reply-To: <7e160b28-ba80-c2bb-fa2a-5d5411c7d22d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0419.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BLAPR03MB5377:EE_
X-MS-Office365-Filtering-Correlation-Id: 626c0028-af9e-4ff8-527c-08db105241bd
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OeZPyj9CEAKVbKYn3n71p26724CVrmPtfwvVVFEj6aPJcXFFd6OPtXtmK552K2fHdLm7SKE/NKYjto9yW/8qWXsrhrIoM5FvfqSII2nNObOgpVRU5Jy8QAYlaio19oiUUZgQ/SaCjpXwPaG6oL7XlVagHwPdKoZ5bjAEpR60FARZWs9fEhskpzzXYCOUAHms/YeiE6OXev+GJ/DM4ByZEo4bCne2EySbq7FRiDFpaLnDOTbkQuIE0+PWQ8La8h0Q76vcMZYL7MUqBM/wPCDnLpyOyKKJ+05gwONZWqOLICzqtPqwRKW3myuQFaqmhd7adidUHsk2zXyCZfoBBN7xi5TJZXVuTNKaVxhUhgYeeMbAZAjSDCFCQPWlK8nLzg5jYnGth2UHBS/Qqm0PxkQi0OfKTetYZri55b7IDGUyIFspywypOcVHMpqtcmv+wYnQvI669+POhxZigIQxDv/QzYm60wyCiE4U2RHzLCrXwNGMwYpP05U5IPeisvA06EIIRGLgCZ5pTDU/xG3e/1iaSEcfZdI+MetWv3OpMdDNLJmrry+3YzoRviMQ+7ESWU7W2seRt1l/gbp45SIN0YVQgc+PHRDGH0h3xicsAJFhF+EsP2c0QSw4wO4JZMBkzun04XdGdgF5Uvowb5kLt0q7YIF0XciOCVo0dlOJsW3CPNpb2bK3X2VVFWkgMpTgpMGMHgx6jA/m2lekJN3KILpfOWlWYgVGVS9VMkEm2wzcvKc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(451199018)(5660300002)(36756003)(83380400001)(31686004)(6486002)(478600001)(2616005)(53546011)(26005)(6506007)(6512007)(186003)(6666004)(4326008)(66556008)(66476007)(6916009)(8676002)(82960400001)(66946007)(31696002)(8936002)(41300700001)(86362001)(54906003)(38100700002)(316002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0VrYkNOSmJDamMzL2g2SlZoTDliejRidXdodjY0cTkwbnJvUDlzUVdUUDQ2?=
 =?utf-8?B?TmZITWZ5WnVGOVNJSnhTVmlTd21PTjV3NXZ5cHZMNlJqejBwaEJOTmdrbW92?=
 =?utf-8?B?RGNYbVVPcTRzWHlrY3RsaGZybVNLbXBRdFhTWDdMNWRZcEpWbmJEMjFhL2tG?=
 =?utf-8?B?YVkrcEd2ZTVxNlhwaWJGRWNQbms1M3J3OW1qdy85WWNPaFlQYVRXOXhaRUsr?=
 =?utf-8?B?YTJFcENKMGY4a3Z5b0k1RlNSY3Q4YVZmUjYyaDJKSmFWQ1ZDUjdxc1loMUpL?=
 =?utf-8?B?MDF3NlBWTFFmR0dCQk1rUStBOG5oeGYxMUZsSHBSQkx3cU5qb21kV05BWmll?=
 =?utf-8?B?OEszS0pvazZlaFRTeEkwTWdFMHhmVmNURnRaWEpVcDQvM3J6U3BhTTNDN0lS?=
 =?utf-8?B?eUduQmNvcGx1NnRROTYwNHVoYWIzOXdYbVplZ2dmTEJsM1l5YnhCb1Bpdldp?=
 =?utf-8?B?dkgzY2t2NjltNkMwVkorbm41Vy9FaG5IOG9lbWdmZnUxZkVQNm5ZelF5REhN?=
 =?utf-8?B?Nm53b1BpVnRKYjQ0MU9SQTMxUjNCb1ZkSm5iWHJQVWhiVjFpZ2VibitGeW9u?=
 =?utf-8?B?SlYxWFhtZWxGdngwaitIR1hkSWxrd2RYYk03Vm1kcEw3bCt3WEhDU2RndjVY?=
 =?utf-8?B?UEEzL1ZwSGYxTXZJZDRuWjRmaWlJbkhXZmtwVGdRSTNLbE5BTnY2eWh4REpH?=
 =?utf-8?B?bVludTMra0ZUcEVnTGV6dUtDbTNUNUpZQmVsUnAzbGpuOXRYWGZaS2E2aEZy?=
 =?utf-8?B?MG42dCtTMU9sR05MS3U3N1BQTFdLSWRSZkJ3TU1SSTNWdStxZ2pDNGtIeVlU?=
 =?utf-8?B?ZU5GT1Vwczk4SGNTbkZWOHR1KzVFVnM5K001bUtGN1BFdHp2bGRIdUlOd1E1?=
 =?utf-8?B?OUxaL1JjcUExVGFpSGtZVzluRW1XRDFWbTlPTlZaa0RHb2kxQlRrV1ZjcXpP?=
 =?utf-8?B?ODlwd0ZvMlNBZ2xrbWRrVkNlWVkxQUtrajFDK1VCK1VyM0RyMG5jWHhrbzhD?=
 =?utf-8?B?ZytKZExjQXZaeXdqQ3RBSVI3RXJKa2J5bkdVRjQrcThPaUZqandqSWVaWXFL?=
 =?utf-8?B?ZWFtd2xSa2l1bmlSN2c0ZGp5SkZiU2VWUDJTM3ZZallhTjFxNXlvOHkyL1Ix?=
 =?utf-8?B?V05uUGJURDRrSW1Gbnp5Sm9Na2puZmZYTWE4L2dYdWR6VXlidVlpVklMSzZN?=
 =?utf-8?B?N2EwOURtZE9ZcXFMQ2VWUjh4ckV0WWhwMlRhcmxXR2pnTXBlcmdIRHJFRXRr?=
 =?utf-8?B?V0F2K2NxQ3RFMk1MMmRMRUVjUHhJaUVKTjJJWmtOdW1CdGxzOWJBYWhHcHRl?=
 =?utf-8?B?RXdoeVQ2TEZVS1NCbEU1aXl2M3U0Rjd3dTZvMzE1QTR0TTNPSG83SG5BWkNp?=
 =?utf-8?B?eitkSUdVMjdla1RTQVdIN1ZxcmRGa3RBL3ZzYjhMNm15UXZiNmhsMGlUbUk2?=
 =?utf-8?B?R2RIRzNwTzFWemx0U3FWZi9jQzczNVN0NjRKWlVlYXArOVF5bjl2aWFWRHVK?=
 =?utf-8?B?dDdLNmNUY0pPenN4QjdNWXlKT29BbGZiVTlPckRaSVdkK1I0ZXg0d3o1bG1K?=
 =?utf-8?B?UElkOExHZ3FFc3k2RC83dVh3dTZhYWZ4MzBiOFBLdzJxblhCNlBUeGpubDBB?=
 =?utf-8?B?UytTL2NodFFMd3BablNkaHZ3V3liN0MyclhWV0pIWUpDZGE2OWVEdWdZOXNH?=
 =?utf-8?B?Y3VSY0FMNjkzWFhLaUJ5WTQ4Sk05RVErSWJrNU5kZ3NmTkFOeUtUSk4zZXE4?=
 =?utf-8?B?SDBMTDY3SWhtSEY2aWJ1YWVlQlN1VnYrckZYY0c4NjZQM2Z1K3hMeUdzTDZK?=
 =?utf-8?B?c0lLMW5hR2s1Z1QybHVxUVhxVjVyMkxtSTB2SkVtY25QcXk5Tk1OeVB2clV6?=
 =?utf-8?B?T1pKN0ZWdDM1SVltK2JQZ29QRTRKRWVXR0FTNWRIcmxxTVViM3VqY3dHK3BC?=
 =?utf-8?B?NEQ0c3ZHejlIajFOR2lXYi91dnRTVkh2a2pwOHhwMExUZFE4VzFKM2RQM1JN?=
 =?utf-8?B?MzVqVmdDdVptdG0yYzZCUnZJRFl3MWVHYzRjTFBlNGlKZTFWeHZPSW5aV2t1?=
 =?utf-8?B?R1ZQM2xPa00xaWplMTVrcVdEL3NmM1MyaTdGbmN3SFZ4YWRRTWordi9JQ3E2?=
 =?utf-8?B?VjVjdGJQV21iVXFRNVU4MDJvRUR4enFuQmdxUHJLeGV2OVpHNnUyT0ZBKzk3?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tZjM91Ma/MIH+LkZOg6tYQlpCq6EsULNHHkGfDAXb9oCxkvuotUxIWqZv1GFo+IrFDRzhJcHzPL4RK/IiW77/eTf7NBw3jblHeFUu/5vt4IoRcSpewXjSRb1tC+V+aEE1Bv9UJHei2S4u1BcIikE8YScBc1vHLrTbWNiX0l9tpHYCUM4nFEjLFVMGWvi5Gt1oVzT7lMl17Feqc28W43EvHBJFsd6lbx4pd4HXFeteFqGoMxMqSwnWIN8jnTOWQBMZqpIU+DZybxvshRUaWged7PNvaajgETqPn7GWaJus2ksVkMXmPShreBx43VPfzzaLgYz0zMyTia6nUiFJI37KklYCj6clGWvwOlWBR0hbUJux+6CwivRBj0zJ7nMawTCimKY2T7mU0H5B066XXGlhu7plGxI++474bu5oCoTyDMTA9ZMxQwMFOYUCJ0gqcS6daJ/sgTM9/rGsucr7jcYr0qLhSlUGnb8rGwqqJe+6iN/bYV0I5WH4BiVHdp0UNrEKLmVYVXNUo6Mq78VG9DJith5EkzU6/OzqlxrEYqLYngj3K7dkUOVuVWSFhUg0bALHfCF0UVG3vgkCfEurkhdCwM/UZmEPDQ8N/ib2jmDcCg85XgmCfXioz7+HaJ/HMYB2nu1hfHDyttYOftwpQ1O9TOcgUulLytjL+jCqNKVOTV4by5e2RVNS+SWgmmorjG3DEN8Opp26I+wP16dSHCSOqUpKvgzg6oGW9IjOb4Kktg9+iJlSFyV9CqDHqnoAzKGWjy29s4ezRCzT2iHC90gXJd377DVOeNRctSUplFUFqAZhkhicEHWzwznxsaCig3i
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 626c0028-af9e-4ff8-527c-08db105241bd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 19:16:08.7939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k41drYvXr1cqoPK8lAUvnuFCMBV35rBWVOSOUUmscrNtTqMab8o6rdQu/6WT6Edp06pP/KCCsqComhbfxytFgFPG1LMphhyLkcxu049kflU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5377

On 16/02/2023 2:16 pm, Jan Beulich wrote:
> On 16.02.2023 11:55, Andrew Cooper wrote:
>> On 09/02/2023 10:39 am, Jan Beulich wrote:
>>> Consolidate this to use exclusively standard types, and change
>>> indentation style to Xen's there at the same time (the file already had
>>> a mix of styles).
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> So I suppose Acked-by: Andrew Cooper <andrew.cooper3@citrix.com> because
>> this is an improvement on the status quo, but I have quite a few requests.
> Thanks. I'll be happy to carry out some of them (but the sheer amount makes
> it so I'd rather not apply the A-b to the result). It's always difficult to
> judge how much "while doing this" is going to be acceptable ...

Everything I've suggested is minimal enough IMO.

>
>>> --- a/xen/arch/x86/include/asm/msi.h
>>> +++ b/xen/arch/x86/include/asm/msi.h
>>> @@ -66,15 +66,15 @@ struct msi_info {
>>>  };
>>>  
>>>  struct msi_msg {
>>> -	union {
>>> -		u64	address; /* message address */
>>> -		struct {
>>> -			u32	address_lo; /* message address low 32 bits */
>>> -			u32	address_hi; /* message address high 32 bits */
>>> -		};
>>> -	};
>>> -	u32	data;		/* 16 bits of msi message data */
>>> -	u32	dest32;		/* used when Interrupt Remapping with EIM is enabled */
>>> +    union {
>>> +        uint64_t address; /* message address */
>>> +        struct {
>>> +            uint32_t address_lo; /* message address low 32 bits */
>>> +            uint32_t address_hi; /* message address high 32 bits */
>>> +        };
>>> +    };
>>> +    uint32_t data;        /* 16 bits of msi message data */
>>> +    uint32_t dest32;      /* used when Interrupt Remapping with EIM is enabled */
>> The 16 is actively wrong for data,
> It it? The upper 16 bits aren't used, are they?

Well... I've just found that my local PCI reference doesn't actually
match the spec when it comes to stating the width of the message field. 
Guess I need to stop using this reference.

But the rules given would require this to turn into uint16_t as that's
the specified size of the register...  But that will probably require a
separate patch.

>
>> but honestly it's only this dest32
>> comment which has any value whatsoever (when it has been de-Intel'd).
>>
>> I'd correct dest32 to reference the AMD too, and delete the rest.
> I guess I'll simply drop "with EIM".

Yeah, probably the easiest adjustment.  AMD is more complicated anyway IIRC.

>>> @@ -94,35 +94,35 @@ extern int pci_restore_msi_state(struct
>>>  extern int pci_reset_msix_state(struct pci_dev *pdev);
>>>  
>>>  struct msi_desc {
>>> -	struct msi_attrib {
>>> -		__u8	type;		/* {0: unused, 5h:MSI, 11h:MSI-X} */
>>> -		__u8	pos;		/* Location of the MSI capability */
>>> -		__u8	maskbit	: 1;	/* mask/pending bit supported ?   */
>>> -		__u8	is_64	: 1;	/* Address size: 0=32bit 1=64bit  */
>>> -		__u8	host_masked : 1;
>>> -		__u8	guest_masked : 1;
>>> -		__u16	entry_nr;	/* specific enabled entry 	  */
>>> -	} msi_attrib;
>>> -
>>> -	bool irte_initialized;
>>> -	uint8_t gvec;			/* guest vector. valid when pi_desc isn't NULL */
>>> -	const struct pi_desc *pi_desc;	/* pointer to posted descriptor */
>>> -
>>> -	struct list_head list;
>>> -
>>> -	union {
>>> -		void __iomem *mask_base;/* va for the entry in mask table */
>>> -		struct {
>>> -			unsigned int nvec;/* number of vectors            */
>>> -			unsigned int mpos;/* location of mask register    */
>>> -		} msi;
>>> -		unsigned int hpet_id;   /* HPET (dev is NULL)             */
>>> -	};
>>> -	struct pci_dev *dev;
>>> -	int irq;
>>> -	int remap_index;		/* index in interrupt remapping table */
>>> +    struct msi_attrib {
>>> +        uint8_t type;        /* {0: unused, 5h:MSI, 11h:MSI-X} */
>>> +        uint8_t pos;         /* Location of the MSI capability */
>>> +        uint8_t maskbit      : 1; /* mask/pending bit supported ?   */
>>> +        uint8_t is_64        : 1; /* Address size: 0=32bit 1=64bit  */
>>> +        uint8_t host_masked  : 1;
>>> +        uint8_t guest_masked : 1;
>>> +        uint16_t entry_nr;   /* specific enabled entry */
>> entry_nr wants to move up to between pos and maskbit, and then we shrink
>> the total structure by 8 bytes (I think).
> The struct is 6 bytes now and will be 6 bytes with the adjustment you
> suggest. Plus I'd prefer to not do any re-ordering in this patch.

Ah, so I see what went wrong.  Right now, we've got:

8b type
8b pos
4b the bitfields
12b padding
16b entry_nr

and rearranging it moves the padding to the end but doesn't drop it,
because overall the structure has 16b alignment because of the uint16_t

If it were packed, then the following byte fields would shuffle up into
the padding, and there would ba knockon effect.

But don't worry seeing as it doesn't make a difference.

>
>> Additionally, the structure doesn't need to be packed - its a single
>> uint32_t's worth of bitfield.
> Like with re-ordering I would prefer to not touch entirely unrelated
> aspects. I'll see if I can motivate myself to make a separate follow-on
> change.

Personally I'd consider dropping some __packed as sufficiently relevant
to this change to be included, but fine.

>
>> Finally, can we drop the reserved fields and leave them as anonymous
>> bitfields?
> Perhaps - I can give that a try, hoping that we don't access them
> anywhere by their name (even if just to e.g. zero them).

Well, its easy to try right now.  And if not, then it needs a different
patch anyway.

~Andrew

