Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA946CC4BB
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 17:08:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515935.799313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phAvE-0001ep-Fx; Tue, 28 Mar 2023 15:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515935.799313; Tue, 28 Mar 2023 15:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phAvE-0001d0-CG; Tue, 28 Mar 2023 15:07:40 +0000
Received: by outflank-mailman (input) for mailman id 515935;
 Tue, 28 Mar 2023 15:07:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UojI=7U=citrix.com=prvs=444182d81=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1phAvC-0001cu-GY
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 15:07:39 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45322c39-cd7a-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 17:07:36 +0200 (CEST)
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Mar 2023 11:07:34 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5050.namprd03.prod.outlook.com (2603:10b6:5:1e8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 15:07:29 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%5]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 15:07:29 +0000
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
X-Inumbo-ID: 45322c39-cd7a-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680016056;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=U1CgHFGut6FFVBCg6ioXIgGK4BgOgzHi5q/d+poevjo=;
  b=gffdBJHSkzbzN9L0FvidLEwcRGZaU3rZsc8XabFrchU8VX+4R0bkylkU
   N6XJ+mRNQXcZ0/ER4pGW2ZIH5L/oX4RuLm6a2OcaxRvGL6doDAQcQ43v5
   Kp7Q485ZDliZlJYc8YxZV2ZZhTPVMP489urBj09S+tHmLfUPEqZS8OwpU
   c=;
X-IronPort-RemoteIP: 104.47.58.104
X-IronPort-MID: 103287222
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6VPjlapMJz8AlwiMA/p4mgEcTyZeBmI1ZBIvgKrLsJaIsI4StFCzt
 garIBnSOf6CZGbxc4p2PYiwpBgCvJGDmodiSlE5rX8xFCMWopuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weFzSlNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACkwQyCPl83o+5Kya7VQisklNNjqIrpK7xmMzRmBZRonabbqZvySoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYKJEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhrqUw0ALJnDZ75Bs+dEe7m7qos3aFeIxwJ
 RAI9SAQgqsdzRn+JjX6d1jiyJKehTYeUddNF+wx6CmW17HZpQ2eAwAsUTppeNEg8sgsSlQCx
 lKP2t/kGzFrmLmUUm6GsKeZqyuoPioYJnNEYjULJTbp+PHmqYA3yx7KENBqFfftisWvQGmsh
 TeXsCI5mrMfy9YR0Lm29kzGhDTqoYXVSgky5UPcWWfNAh5FWbNJrreAsTDzhcus5q7CJrVdl
 BDoQ/Sj0d0=
IronPort-HdrOrdr: A9a23:JgsfDa7Ydr5YJWrBTwPXwDjXdLJyesId70hD6qkQc3Fom62j5q
 STdZEgvyMc5wx/ZJhNo7690cq7MBbhHPxOkOos1N6ZNWGLhILPFuBfBOPZqAEIcBeOlNK1u5
 0BT0EEMqyWMbB75/yKnDVREbwbsaa6GHbDv5ah859vJzsaGp2J921Ce2Cm+tUdfng9OXI+fq
 Dsn/Zvln6bVlk8SN+0PXUBV/irnay3qHq3CSR2fyLO8WO1/EiV1II=
X-IronPort-AV: E=Sophos;i="5.98,297,1673931600"; 
   d="scan'208";a="103287222"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDxCrOoVyJvvMTUzN5pOmF+LMo67YhQ5hsirzzs1WwwDUR1lLzMFQujvjkCgbQDZJYlKeIvqPSlHCcbQb51YzdwYtfT0X+pSAw+fma8b77zuOB1kNCmqn6IciNVHMkTzRxa5yduti8WBsKa+iZFX6jgNQuCBpmf48pm2BIooYypp7c73i8l7kfziCPMcATFuDAQiEN7CZnAgKtufxeAHNr9pzrmfoNnOqGEup3X4p7iznx78JBZfPB/J4O5tpSnL3EYCM8sfE3wPBJQvAfx0/pS7AlRko3MVyJkMGyBr2gaOwEiL0AAzzAl8efpbOFfP4md7W88Ub/qPpDVXIJBqFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wT18pRIW9EKsfFc1/H4hWyhnNTEYypv/ni0nOQ0BZTI=;
 b=hM1q6rdInQIJSFQPeBFlvlUhShnbvdtPPRARKWwmYkC+WYLU8NM/j7KyzNhjotNm9UDc9lMRTeMf/dImOpDEEoCTemoCp3FcnFonz5WDobUUoQH2XsKnDF/HRAesUJDRadXm8pXbdWrl8O//QpWQkyE1K+g3AZPvzwPhU6pEdncyUOt8b0a7f1281qqZr7UdCM4s7XCgehwn4H0Qsb1h8Zc+7woam8jIgKaxyY5hdc+Do2t+3nwwIr7EFeN2s7zLBgcFPZR7x6TJec/4NCY/H4ERv10NzgK4l2KA3jeOuk7avl2ME7iphJ5VMr9rBCE5CigsIaHDjhO5jSwTf3HyeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wT18pRIW9EKsfFc1/H4hWyhnNTEYypv/ni0nOQ0BZTI=;
 b=l9ywYhm7O5RG4CghQbPZZ7xwo40JM0aDgf85nPpM3I++ZDoz61PU2PZvhtoGHUnwcnowaRKu23GUBekAx/O6SgyN4I+3jRwXiK/Su5R1veIfPDzlJgESBZv1nv2yddbjticjcxWa8BY4ezZn9eh1Bu4CxiBmNYgF8tMuz94cSQc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c6661fc2-bdc2-b953-88fb-7250eb2fce1b@citrix.com>
Date: Tue, 28 Mar 2023 16:07:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/5] x86/ucode: Fold early_update_cache() into
 microcode_init_cache()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230327194126.3573997-1-andrew.cooper3@citrix.com>
 <20230327194126.3573997-3-andrew.cooper3@citrix.com>
 <6b6b7da5-dd1a-1b17-b1ce-1b1adb687807@suse.com>
In-Reply-To: <6b6b7da5-dd1a-1b17-b1ce-1b1adb687807@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0470.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB5050:EE_
X-MS-Office365-Filtering-Correlation-Id: 54f40b71-2456-479c-75c4-08db2f9e25d3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QAaTAWlUd1mZ1bz4v+z6O53f7Jm5gxq88GR9Kxqcndd9Bk6yyNKAVHF0F95slKpOyWuzAkzcxer56/W2vwUWxvgDADAW2IK1ksY7OCvYsTi3MJQK2u0PBEWM7GU0ksfwlTQ6B1u/b54BdA9kjMuHLmZfLVAnmLuBZtrkvEiW+4e64quqQvivh0TmWyjEMNo7sEXvZynCYt3dqqQTZJ9yEh8jjbq9g50m8b7bgE8AlR++VreE/9Amio3lBzeYguOqhxa/7Y3LLaEc70qIzsgsN88Gik9vOfXVPKTEjY0VljzJJCfg/Q1wiZCMZ01hTIK7DkC9wCSWtLTwsgKhDCiT66eik0XqYcmKgx1MlnH/ad0lR55G92WGisWu10yT/OIlh91qMM0SL9LvQlOOBoAD4JLz2YImUHXv4r8ABRn+PmcvOTc/bTop30JzlEKb5lfhQeJt7WvsYFLXuVFJYkNjdGxp5xJ/WxZjlcsMwYRmhzoReNc5M91kqcRVGAzwTGUfrU3qQukbNo7w3zeO02KfgfI+dquoSOQhX3iVlcwvlD2+NoBa5xSrjA6Ao78XIKu11bF2Y7sn5i7A6+iTLTqLdqRYg/l6furzi5Glxz25G8Veh08H84b3f4/Ik9NudKpTVGu2rFU0Ot/RORhL1insVA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199021)(31686004)(66899021)(6486002)(82960400001)(86362001)(54906003)(66476007)(66946007)(8676002)(31696002)(316002)(38100700002)(4326008)(478600001)(6916009)(66556008)(186003)(53546011)(2616005)(26005)(83380400001)(6506007)(6512007)(6666004)(41300700001)(2906002)(36756003)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cllYdklOV1VFTVEzeWlhREg5amZkQzF6dEp4ZEhES1VJRU1UV01rVlNSUndh?=
 =?utf-8?B?RnFXVDRjUmljcGlWa1hpREtMZUU0YWF2WGRKUDRXaktjTHQwYUhOQ3g1TGhX?=
 =?utf-8?B?cVh2WldFZDJqbnp5VXE5RThuc09oZnl1aURvVk84TjBMNkp0RHpSVkZrN3Bi?=
 =?utf-8?B?aXBzaE4yaTNsWXVpWGRLTkN3ci9TZzR1SDRqTmdRR2NZdlprU1RTdWc3cUNK?=
 =?utf-8?B?dFBpVUlZam9sb044NGc2cGdaUkFuRkJyZTY4V2lldnppZUMyZDFGMmg2bDN2?=
 =?utf-8?B?emRRVjhlOFl0MFpBYURJUFFETkpTQ2hTT0RtMmNwQnk2ZFJmcDhGeXRIWkRB?=
 =?utf-8?B?ZmlwUXA3VTFFQ3RWc1lLaU9jOWZkTGl0aWRwaDZpNytvMmd3SjUwdkdTaUdn?=
 =?utf-8?B?YzBMSjZyY3NzYk9uRGlMcVdTVkowakZudFplSVZsQ0NKeDd4cU5ORmpicVVZ?=
 =?utf-8?B?QURocU5MUzVaZEZlVWpZSklCYVNBSlVKdFlHek5QelUvZXBCU1NVNlN6dkNK?=
 =?utf-8?B?TWVKQld4NXlCa3JEUUlnRmVRdlBHaGl5MzZkMmhUcDY1eWtzZkNxNHdubW5O?=
 =?utf-8?B?TExxc1k0VUxBWXVuRjJaT0VvU0MzelVIbDJtMmtGZEcyc1pRN3RZRm9vK1hS?=
 =?utf-8?B?NVZQYzlkL2lrcHVNeFFhNGFlcDFSV1BuckwwZytabDVlRFQ4ODdXWUlMNmRq?=
 =?utf-8?B?VDFTTlV5cmxncUtUWER2eGNaMEMyNGZPMEExR25MZXNxY2pWR2lPQmtNMkth?=
 =?utf-8?B?MjJSQkJkWnZyUFg4di84NURJRzVybmlUVkY2Z2RMU0VGZ2hnVU9CSFZSZWRY?=
 =?utf-8?B?cEVtVG83TmFWbjlWK1Z5ZWdZeUtPK0ZSOXg1ZjJIRDhCWkRHQmRtdDhvR1FH?=
 =?utf-8?B?Q0RLWXpxUUFZZmVhZThXNFRuRUx2REVOYVdaTVlYL2o1MVYvZjV2R3dLZG1i?=
 =?utf-8?B?YlEyRUlTcTRtbU9rQTVEWlF0MnM0VkJWVW45cXBsVExvelVwMFV3a1hpNWh0?=
 =?utf-8?B?Rmp2ZmhSYkhKdjdFaUh3eEFhSFFETXNmVXpUcVpQQ1NZVVRJMnRDTnl5ZmRQ?=
 =?utf-8?B?WU1haC9LTkdLQVlWaVVZL2FINXZOSnpqN3JGekF4cDRZK09yTVh3UlRybE94?=
 =?utf-8?B?SzJsTmZBZ0ZyeWlwS25kM24xd3JqYU1GR09lUGhHL2NSYk1BSnF5Y1Aza2FY?=
 =?utf-8?B?aUMyMVJqUFREOXAvLytYSTZXdDVnallyT25ZSXk1TjhzZ1FZNCtMcFJBbXcy?=
 =?utf-8?B?SXoyaTh2cnRWemlpMkUyeGk4Uk9adWFydHMzOTFoOFhGMDkxRHovZjl0c3Bl?=
 =?utf-8?B?RGN0YTI2NUo3YUhZRjM4QmtTNU9DK2V3R2ZDcmVvdk5HSzRiTlRlNk9zUDE5?=
 =?utf-8?B?VmxDeWJUZFl4NkRTa2hIc2FZYklRSElheUJIMEpJRzdoNWhhK2ZXbDYxSjRV?=
 =?utf-8?B?MWtsRjRmY1c3WUpEcW9IaG8vcUdMd2lxSzFjbndQdWR4b1YyaHo1SFNDdFVB?=
 =?utf-8?B?V2hDaE5qQXNMU1pSbVg1bFBzL2p6VU91QnZ4YzJMejFXTm5Qa01kMlVYTDNi?=
 =?utf-8?B?bE5tREU0SGJ0OCs0UXhhRmlkbWt2N1lhNHUzK0dKakIxMXdxQzRMTUFKZGtr?=
 =?utf-8?B?STFndUE5L0RoNkIrTkNGazBZbHB0cVgraitjdVh3dGFpR2owcENjcDBtSm9j?=
 =?utf-8?B?RmpiejdMK0QyT01OV3dtc3d4RDBuZXU0dVhJR0ZIdEFXMjdrVDNLeWdFRGQ4?=
 =?utf-8?B?TzA3RksycndOM256M0dqZncxUEo4NlFKWjlYSTRTVmRqS0krT1VRWEhIMGI1?=
 =?utf-8?B?S1J1UVNHYjF2MzlxaEdvemFobGRLOXVSMFZlRDNqUTRiU25YNHFtZFBYWFFG?=
 =?utf-8?B?NkZjOXc4azdvZWd1d0dPbjJVdDBsQko5UE81Z002OVRkdTA2SjNEVFJ3cGF5?=
 =?utf-8?B?dERJMTNEbUcvOTZmdXdRekRYdHQ1TkNQS3V3K1BFZDdWN3Mvc2dRRzkzQU5l?=
 =?utf-8?B?czBOWk4xdmN1ZmtGZy9IUVorUWV6OGVKVmlPVmpFazdDS2ROTHFid041RUZx?=
 =?utf-8?B?OHh5ekVSR2RZYUJwQ0ZreWVYS0ZSSUVvcU85c1BWV3U3bjJLNzhNNEl1cEd1?=
 =?utf-8?B?U2xFTjdoaWhkK1oyRUpVT2VmVS9qYWlyWGZpZkRZdExuT0w3RFZBeE93cVRR?=
 =?utf-8?B?bFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LUC0UO2jAZaWa/hv7UizMOhjqXQYitj4krVVIGR12zfO/a28kRMg91AHqhbNlqoF/EaPVtlOzVFQfTHX+4E3EJgc930vd8fq92ahWpFctCo2e2bq73Gp1f9/+FyxpSTmxJ13ZWvugD7WqZzlIPRa8lnaViLEWos4hAO73YPsVy4jBfjiizgj54gEF6jYCFOgDTaG0WLl8DePQc6QLZdV/uR9ubaRuFpYFyJeZFbxEsnfhTd2+Z0bpCClntsBf/5PJZnVYTdkws5BXGMyBtWRL9qzqAAE6n8WYfuTvLBYlp8nAfmZSqu565PRmop0h0shQlWtjB2KZFNiJbPnpqVkNAWZxwDfIclSMbwqOXIMiVPS8d304oasCN0ERdRw+h3Y0OW2LFY3WFzGrCBEumwHa/WqGX+BelrKIHmv13Qz53zyn/DGgxQpkBYkuhyD2Vqh76Gzlfv0qju8QYfqjG5suJV2SgW5f9iKqYkY+7Pk+WlJ9QuaLI7r20IOOeLbHk2fZzFV0013Kd8hVfLTnt+hsf47Gfkqib8xeaGw3PnT8L+THFOkb+8jcigvHq8QsLm1yeccBJG3kAGhJFn0EQah3QLh6cuzKdE2zXmpn2neCW3CPPJde5U9nTxRXDpQjWlKAverHs+2dfDADk2QWpaP5iF+GRqRV1QKjM8P1UKU49X/Bhtlzcgfr11vvtbE92v0yguTrgmRJxUtdy0MYW7L888AvEPtKNYOC4CGjBrugXYxumFYBFIaEV8ACgGgsbeB37UWkyQizZ/Z2UYycJ4nnlq97X+UvbPHAMsOwCLiZmGlIo0CK3hQ9Q5Q19k7Fmti
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f40b71-2456-479c-75c4-08db2f9e25d3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 15:07:29.2153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QSA2cyH7+QBhTVmpWv+kOyEeP5MtZD2JJ4mUmyK3msI7fwjsPzTsnDX7X44lP7iioZnFWwHOvy/K7j7Hp3KwiWW+XicOfgVLVxOkcXfZyQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5050

On 28/03/2023 2:51 pm, Jan Beulich wrote:
> On 27.03.2023 21:41, Andrew Cooper wrote:
>> It is not valid to retain a bootstrap_map() across returning back to
>> __start_xen(), but various pointers get stashed across calls.
> It's error prone, yes, but "not valid" isn't really true imo: As long as
> nothing calls bootstrap_map(NULL) all mappings will remain as they are.

And how is this code supposed to know whether it's stashed pointer is
any good or not?

This is precisely "not valid" means.  It doesn't mean "it definitely
doesn't work", but very much does mean "can't rely on it working".

c/s dc380df12ac which introduced microcode_init_cache() demonstrates the
problem by having to call scan module a second time to refresh the
cached pointer in ucode_blob.data.

The code we have today really is buggy, and is having to go out of its
way to not trip over.

>> --- a/xen/arch/x86/cpu/microcode/core.c
>> +++ b/xen/arch/x86/cpu/microcode/core.c
>> @@ -755,47 +755,51 @@ int microcode_update_one(void)
>>      return microcode_update_cpu(NULL);
>>  }
>>  
>> -static int __init early_update_cache(const void *data, size_t len)
>> +int __init microcode_init_cache(unsigned long *module_map,
>> +                                const struct multiboot_info *mbi)
>>  {
>>      int rc = 0;
>>      struct microcode_patch *patch;
>> +    struct ucode_mod_blob blob = {};
>>  
>> -    if ( !data )
>> -        return -ENOMEM;
> This is lost afaict. To be in sync with earlier code ) think you want to ...
>
>> +    if ( ucode_scan )
>> +        /* Need to rescan the modules because they might have been relocated */
>> +        microcode_scan_module(module_map, mbi);
>> +
>> +    if ( ucode_mod.mod_end )
>> +    {
>> +        blob.data = bootstrap_map(&ucode_mod);
> ... check here instead of ...
>
>> +        blob.size = ucode_mod.mod_end;
>> +    }
>> +    else if ( ucode_blob.size )
>> +    {
>> +        blob = ucode_blob;
>> +    }
> (nit: unnecessary braces)
>
>> -    patch = parse_blob(data, len);
>> +    if ( !blob.data )
>> +        return 0;
> ... here, making the "return 0" the "else" to the earlier if/else-if.
>
> Alternatively, if you think the -ENOMEM isn't sensible, I'm happy to
> consider respective justification for its removal.

I'm a little on the fence here.  Nothing checks the return value at all,
and nothing printed a failure previously either.

Right now, the early boostrap map limit is 1G-16M, so this really does
fail with a large enough initrd to scan.  There is a corner case where
the second pass can succeed where the first one failed, but this is also
fixed in the general case when thread 1 loads microcode (and updates the
BSP too.)

I'm also not convinced that early bootstrap mapping is safe if the
bootloader places Xen in [16M, 1G) but if that goes wrong, it will go
wrong before we get to microcode loading.

Overall, I think that bootstrap_map() itself should warn (and ideally
provide a backtrace) if it fails to map, because one way or another it's
an issue wanting fixing.  Individual callers can't really do anything
useful.

~Andrew

