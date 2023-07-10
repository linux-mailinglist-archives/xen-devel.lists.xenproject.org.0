Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CEF74DA78
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 17:53:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561263.877698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qItC3-00045P-PN; Mon, 10 Jul 2023 15:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561263.877698; Mon, 10 Jul 2023 15:52:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qItC3-00042I-MW; Mon, 10 Jul 2023 15:52:55 +0000
Received: by outflank-mailman (input) for mailman id 561263;
 Mon, 10 Jul 2023 15:52:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n6vR=C4=citrix.com=prvs=54822c203=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qItC2-00042C-6f
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 15:52:54 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d244f86c-1f39-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 17:52:51 +0200 (CEST)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Jul 2023 11:52:48 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM6PR03MB5131.namprd03.prod.outlook.com (2603:10b6:5:1f0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.26; Mon, 10 Jul
 2023 15:52:45 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 15:52:44 +0000
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
X-Inumbo-ID: d244f86c-1f39-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689004371;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=vLj48icegD92MXj4YOa2t4mytEyYDbc8fWB4ylwxFn0=;
  b=KUzq35e1FFEyxlhJBvxXbsgI+tGn3qgk6uC4kg6MUqq6ENugfFwvnjS3
   GSIOXPx0QajL47pgiVeC9opFLmm7SgWCIOq43VPVBP+aYn0z/IOBKs55Y
   D4MrHYwG1Tea6bS6cmLM0qJnYr/LUBQQVLS4x7fxHLbMG/Hq/atvIAIRM
   k=;
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 115735407
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gDBd9axOr0FAnxFO+oZ6t+f5xyrEfRIJ4+MujC+fZmUNrF6WrkUBy
 WcfUWiHP6qKYGOhKI8gaNzi9x8H7ZeAz9BlTwo4pSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhPKgT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVoR+
 +4iCmEiVDmSleayn5ahEvdD3u12eaEHPKtH0p1h5RfwKK98BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjmVlVIguFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37aSwnimBNpNfFG+3qNhjAWKy2gZNDMXUgvlu9Dpi2WBf90Kf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHsqCRSH+b3qeZq3W1Iyd9BXQZeSYOQA8B4t/iiII+lBTCSpBkCqHdpsLxMSH9x
 XaNtidWulkIpcsC1qH+8VWZhTup/8LNVlRsuFSRWX+55ARkYoLjf5av9VXQ8fdHKsCeU0WFu
 38H3cOZ6YjiEK2wqcBEe81VdJnB2hpPGGS0bYJHd3X5ywmQxg==
IronPort-HdrOrdr: A9a23:eBKIaaBRVDg69+vlHemf55DYdb4zR+YMi2TDj3oBKyC9Afbo8v
 xG/c5rrCMc5wx+ZJhNo7u90ey7MBDhHP1OkPEs1NWZPTUO0VHARL2Kr7GD/9SKIUDDH5tmup
 uIBJITNDSfNzJHZI3BkW2F+p4bsb66GY6T9IHj80s=
X-Talos-CUID: 9a23:a7JZWmCSgCaYMXT6ExI4+lwuOJEKSFTM3nPUfGuiUXhGEJTAHA==
X-Talos-MUID: 9a23:V4pW7wS/T2Azi32ORXSxjz06Lcps6ZiACUddz48v68ivCgh/bmI=
X-IronPort-AV: E=Sophos;i="6.01,194,1684814400"; 
   d="scan'208";a="115735407"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZrifusf+M+8CsC6zXQXq7pa5xXnk7K5KPkunh4MPrjOGy1lKSPEd8EJX56sZ52kDH7Jzhwt30Daat2fDuYS4vP5WnRapaf22YXh3QuOwPHZMvDGHlmkVqHJrjPGpMc+oOKGWkwggdsB9cvB2VJFqtxdwq/wyqLQ7hOvdwwhzL9VzXRLAbcfkOZFo/jDv91EpJRIrbWLLVuehalpxx6Qvo7tDd0eNAPMAtE5YWBN4PKlMXi5q1cC++CP6bGFH+KoZJmTXxOzwa6FxGwAAzV1gXsBm17CoWWXLT8FVaXkwni5iTAPu3rsE18yPiW+ojY02+O0W0vf5iKz7bSSGCyxyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFDnNf31r7Xqt8jqbnsePXZ5QIlJ+QZx9C6FqEtB/kE=;
 b=Of3u+5tYbuiV0anr0nY6Y/1JUByteQwxRLrq4LORdOWKQ1AnQhb6oBNb9sB+EE1i9hHcOzSxJ/Jo7i9FFGE1EThXVaa6X1VP3tbLEBNwvYll4WhcX3EU670JeE0dbWSeHLH9KHXJwfeeHH0jj0TTqmt94Ni0GI5J0E373s0K8x6beUhsOezRCrk8MsEelNIvh3BuRLhpYLdUa/8yANsPHVzHlJgY7YTu7RtjJP2ym3bExM8UA2XIUIjO5jolPMaTLW4xEzVOCJoz5aszmMGlklarZiT4BWhKkpzEAAmvZe6/eeE0IzhqxgnxAy+s6KSsx51fBPYaS0sqNrAbNFEhgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFDnNf31r7Xqt8jqbnsePXZ5QIlJ+QZx9C6FqEtB/kE=;
 b=YmWNSipuOz4co7zFGzioobKDra9BcStdU6gcPodsiarp4uPv3Qh/XVYQQNgGkQ5/NaC4TzZXo4ahfHSeveGXPmEriDMkwxeyNr2igL1Jore9GsS1GeKREttHSxC8j42Mj8vXPUsEde5Pd1e0F4bfcIwaCWafC40mMmAYb0n+Nn4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 10 Jul 2023 17:52:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xenoprof: default to off
Message-ID: <ZKwpRrHyP0RN97nB@MacBook-Air-de-Roger.local>
References: <e3034416-0c34-322b-732a-02008be514b3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3034416-0c34-322b-732a-02008be514b3@suse.com>
X-ClientProxiedBy: LO2P265CA0175.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::19) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM6PR03MB5131:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d4b47e4-f04a-402e-d3f4-08db815db379
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A4zAe0UKgr2J3Hwfiq+2Dy1oSzNZjv3kavRg8/rxbR7NslomOKPHuPpg4iOEYPsyWaksz9Vfut55wzIefvUyzxBqD2LjR/2O3+CZauOLgmaiFIrSbshJZg1/hXSRN/5uX1+JoToqggeK0Mm6JEGbd9D5hg3haWZwEsCDwA0PE7KHneMrtN/qhxampjHmz13PHoZDGc2R5VWRrVhoRn2x/mHiBlNfr+DqlV8tMXstpV8lSpddQpJ6dKp9ic0P/NTuMOBjRTQaTLSM4YeY5xTUjeRiQDR48/3hlsAe5ZF04KB9zzkfVPcuSOspl+VHLxV6CIZw+pzh9AVp0sEVA8NivGqDbwUNV+u2e18z1ITQnxbTyiZXNdhhYra/1KZLERrSJCg65W975/WvU6TaGe02ElmMX4H9uHXjCbwtKJ7gf6gheLf7nmvQCNr5QG8A7Yhu5LX8kYl1nuHL0EWRY3RN5PGYEwU9ki7Ckjc9kmJxD2TjtM/7ULSFu+ILIPefh2hoT5HEF5BXcKxrl4HM8jSy9WBIvMuKQ63rGC/CQs0hUBoV0V6iMVMycqWCUm4yBq7W
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(451199021)(6486002)(6666004)(478600001)(54906003)(38100700002)(85182001)(26005)(9686003)(86362001)(4744005)(2906002)(6506007)(6512007)(186003)(82960400001)(66946007)(316002)(66476007)(6916009)(66556008)(41300700001)(4326008)(8676002)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3NoejR0RlNoUlY5OUFNUmtkeVZ3TUlJdDhMKy8wSFlBT2IwVWN3R2ROdkR2?=
 =?utf-8?B?T3JWQy9jaFMwZUwrTXBReDM3RjQ3OU84ZGxVSzhhTElibW1oTnpFVHpxT0Z4?=
 =?utf-8?B?VENHZnU3Y05XTXQwKzJJMmQyRVErbk9LS1VuWnpTK2ZLUm5UMGdUb1FtRTFn?=
 =?utf-8?B?STlDSUpTQ3JkWXhwVEZuU2dKL3FubGcwL1JaTXNONnFkZnJjVHpsN29tOUVt?=
 =?utf-8?B?eWNGSzJKV3RlQXNVVFB6Z0QvM1hPUHlWbXhDVUltRFpLZVZGSEtndzB5ZU42?=
 =?utf-8?B?WVlVeExSK2JuTWtVdGJvYTU2RGlFNGRmSFdBRUMxRHI0bEZxbHpPbmorNFhv?=
 =?utf-8?B?Q0VYeE1RdElLVjdVdkU0ZHVoUlgwaU85M24xaldUUTZOU1huZFdraTY0aHdy?=
 =?utf-8?B?TmhUZmlpd1VheFAwQm5qRFhNZ0VvTnlqN0g0VWtiZXRKM2VRUE1jbUN5cUlr?=
 =?utf-8?B?NjdWSVVNaW12Tlp4SFI5aWt0WUdtMFpXa0tsMXJtSmw1RkpySE4wd0QvYXdG?=
 =?utf-8?B?bjJhWlAyUTJzeUg2Q2FSU0ZRV2tXMU9BdytaVDhWemxLVHFkOWROV0JJem55?=
 =?utf-8?B?MXQrZDhiVmFXRGs2RFd3TmMxVVhnUUQrYUx4RXRUUjR6YW1ENzJuTlZaejdW?=
 =?utf-8?B?MDBDVWp3U3FvdTJVcDlKYlhFNG9GeEwyR3BRajhqejVheHY0QzMrVmZQSVZX?=
 =?utf-8?B?MFJ4UUl1T2l4QWVSaTZ1dnczS1ROZUxxWnppaFVVL3k3YlRaZkd0SEw1WTZR?=
 =?utf-8?B?TTZEL2ZWT2dzRVU5Rk81eDdVb0VzT3NKSFh0Sld1VkR2dHJpdlNEL3l6UGRM?=
 =?utf-8?B?QUJWbVFid1NxT1hxZlNZT0FtRHlVdnFVNXVBL3h4RlZ4SEFra2pYb3dpaSt2?=
 =?utf-8?B?SE5Dcy9aeEpyZndwVWZsVHBVWmlpdzBOWTVrRHpKcllETlJPSXNsVmVMZjdO?=
 =?utf-8?B?ckVOaG9UQzl5N09oQTJ6Y1pwWS8wQldhNjhzREtDazZiWWlTc0RuTHdmaW1S?=
 =?utf-8?B?Z1BqZlFBSUVmQVBWLzVKVFk4ckxHOXR0TlFrbU01V0FEbkM3SGhKb0NqVzJx?=
 =?utf-8?B?VTNTZ01uZnVsZWkzOXQ1SGF0a2J0Z08xK1ljeGt5QVVDdkhpZCtiTjY0OHJE?=
 =?utf-8?B?U1lpTkErV2FHc0JXMThzalpBYXhBUHpTOTRjTEdKMFlHd3crOUd3TGFKdzQy?=
 =?utf-8?B?K2p6S0NxZ3RXemR0VVlFMmJrdDFLV0tyM0dTMVhWenRLclNaUFZSMXA1bFFH?=
 =?utf-8?B?K0ZzVit1OHpZRkxpUmt2azNwT0x0eUk1WjFwS1BsbXBWU1UvcFR3WHNMSjE0?=
 =?utf-8?B?eXcyYTA2T3Bya0dJZG8rczlCeWVlcGt1N2lHOW9oSzRyKzB1WHhTWW4zV2lL?=
 =?utf-8?B?WElMTlA0clpvSW13N1owV3RaNzNrMXBRTzhvb2NzM1g1Z0NhMGZkTm1WaU1M?=
 =?utf-8?B?cWJUVWxNU2NUb3ViSWJrMHhaM2U0UHJuWXo1Y002Mk5QWVN2N3RaMDdmNHh3?=
 =?utf-8?B?RjIyaXFCN1hNN202MzhNT04rOExXcTZPRWpKeEdSTzV4a1R6QlhTZ1dEYnd6?=
 =?utf-8?B?aUY5UndORUM3UUtmbEU2eU9EWUYvaTI1WG1JRCtnRU9iSVdidjdnb3VhNkdt?=
 =?utf-8?B?VHdOcUFBVXlJc3FYOVhUNFpnMllWVW5xbVMvWVZBempxUzBSR0I0U1dkMnRL?=
 =?utf-8?B?Ni95d3p4T2RKQWxZMHN6VHpwNjlWM0tlTjR2N1RVbit6SDVFV3RyamhrNWZX?=
 =?utf-8?B?SXRYWVhWNUZoZXhLRlV4YXpOanpKRE4zNW4zY0x1UFJNejBUZU82WXBTSGhm?=
 =?utf-8?B?cXpHS1Y0SGtPQ1dwRXhBZFQxK0VGclduL2pwRGpDZHZQL3VES0JsRUtOa050?=
 =?utf-8?B?YlU2bWVvdTFBeXltZzhYbm5NaWN3ckw4MjZEVk9hWUNTWUk3Z2M4ZnNCMmxW?=
 =?utf-8?B?bS9Xcm91US85UkxWQUFZZG1GTU5BNk5TNjhORXE2Y0p6VzVuaUIwRVdNMUVz?=
 =?utf-8?B?WnpHK1dtdThsbnBuNWxoY2QrbW9Hdmx2SjlteURiMEg3elZlTXVaLzJlbm9r?=
 =?utf-8?B?eVFXblQ1QWw0dEVFV3FjelpZaG5MSEpvODlsUTg1RkZ5TlpZL0lkaUE3WFZU?=
 =?utf-8?Q?QHK/7pSoEnFV7V+lZg0Fc0qgt?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fzmNYVo5Xgwil4Yzb+YA554WWPnD+pKrNKXGztZlRpZiEJZVCOUe0PU+i0CbQWrhwC2Y4s84j8iViT2EmmxEDUKQpkVNCGspYNjMzBslt338XQizxjy8Q2x6hE2t3dFMUIe1bfTJxa/gqvzRj7+pyPiecaT3TniZQZEqYYSX8QFmazA0j+kA3NH+5/T8+8nHo5Oi4qgmR8ogG3IYKWNmb2FeXe3SH9e/2PWfsVTKshh7/3WLHehEQWRDXZlwUvh7JJWX2OXXWJVSk4mZBgVc2k/GZSLHylGOozXfHIj6VBTzjP+LUvuI5aNXNgCdBZA1tYBow3ujIbtkvlUV/gY1j4nwCpnMKK1cSG4i5JTHrDaJ7EDaVRAquwFg/6CYUWjsLmqm3TFDMLL1sLSlOOOGPi0KOmYXadQvUprwy7I3GizilujCKQ0HU/fnYRcjgkL6C5sxhV2JtN0a7wrFhWA5W22WF70lB5mL4mCUxnwMOenn7e5PLtw9NGZhU3iA21BBq69M5HCFF8KnVNky4h3zqDpRIMBhXqoIhPhhQhvGh0xZireP2Vo2haiVWETIDd7qiRg1DlMP0sopX//H+x98qf9vBVb9Pt+CR0OtkW4jKiOJDBAnb96IJKFLJWcjruOMyO49P7VFkrYox3NEwwTYR3RNPBoZTcKEKdQLTZBFOs2IXwhGw0SxLHeJl8d4oNkOzEg7nMFUc+5ubwsy7a1ootsjv4JYdsyvqBYubNWPwfdFYeX9juKFNwsASaX6O5Ms+X9IsOvej2oGGyPtwULOLHTJKAgGPc4O2SsjJPuEtLldE+SqmZljmhb1hfmdAV7HTEHyFFbvVADxAdRuextiZ/E1MN3yQPCwm5gjBFFgbMo=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d4b47e4-f04a-402e-d3f4-08db815db379
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 15:52:44.7937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HbbV0bU3NL6LBLduxsDZtZpJz7Eaj1HwrSGXq0Kqdu4rnFMTk9WY7LxWmEw9R+FtFxo1vt9mWVyhL0Wx9M9ikg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5131

On Mon, Jul 10, 2023 at 11:48:09AM +0200, Jan Beulich wrote:
> This being x86-only right now, and its x86 bits being heavily outdated,
> let's no longer enable this by default.
> 
> While there also adjust the "help" keyword spelling.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

