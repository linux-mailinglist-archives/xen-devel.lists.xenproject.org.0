Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4724757C14
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 14:44:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565177.883098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLk3m-0002Yt-Dd; Tue, 18 Jul 2023 12:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565177.883098; Tue, 18 Jul 2023 12:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLk3m-0002Sc-7W; Tue, 18 Jul 2023 12:44:10 +0000
Received: by outflank-mailman (input) for mailman id 565177;
 Tue, 18 Jul 2023 12:44:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c9jt=DE=citrix.com=prvs=5561f9d71=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qLk3k-0002IP-Rc
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 12:44:08 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c74cb906-2568-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 14:44:06 +0200 (CEST)
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jul 2023 08:44:03 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MN2PR03MB5326.namprd03.prod.outlook.com (2603:10b6:208:1f0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.23; Tue, 18 Jul
 2023 12:43:50 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 12:43:49 +0000
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
X-Inumbo-ID: c74cb906-2568-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689684245;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=CkmokN9cANZkR6GyiiDDkF8ng/l/WQMYI2bSbWYvkwg=;
  b=H0ofIijM9/mBjQOwp3Kt/8mtOOown1Eupf7c+QJE/AKNJ0MuX2aQMKms
   glgUpmLkKCbRol7D7jCKVPmT6IxtW2mysXk03UDwuvd+TJSkKBc7gNBFP
   JQJrWfRqAymVJAevXKA63UKxe8tWLb1lRwXa704qZMH0sH3c2FZoti+yj
   w=;
X-IronPort-RemoteIP: 104.47.59.176
X-IronPort-MID: 115292217
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:wkaqTKyd+6DxPzho8PN6t+f1xyrEfRIJ4+MujC+fZmUNrF6WrkUEy
 2tKUGyEbv+KNGH0cogkOdy29RhQsZfQnd42SAVq/CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhPKAT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVpJq
 dkkLgIQUjeg2v2J8IOkVfhriMt2eaEHPKtH0p1h5RfwKK98BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjmVlVMvuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37aSx3KhAttNfFG+3twxqlC0w1QxMQ8La1qrhsLp1WOSa90Kf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZDYtE7sM49RRQxy
 0SE2djuAFRHr7m9WX+bsLCOoluaOiULLGlEeS4NSyME5cXupMc4iRenZs5qDaqdntDzXzbqz
 Fi3QDMWgrwSiYsH0vu99FWe2Ta0/MGWEEgy+xndWX+j4kVhfom5aoe06F/dq/FdMIKeSVrHt
 38B8ySD0N0z4Vi2vHTlaI0w8HuBvp5p7BW0bYZTIqQc
IronPort-HdrOrdr: A9a23:jNv+VqBYHB6d1iblHemG55DYdb4zR+YMi2TDj3oBLSC8cqSj+/
 xG785rsiMc6QxhIE3I/OrqBEDuexPhHPJOi7X5eI3SOTUO21HYV72Kj7GSoAEIcheWntK1l5
 0QEZSWY+eeMbEOt6fHCX6DferIruPrzEniv5a5854kd3ASV51d
X-Talos-CUID: 9a23:zR7O7WPQWnBSHu5DYy470XISKN0ZVV6A00jgElCnGGFnR+jA
X-Talos-MUID: 9a23:wevIQwXcwRbkc6Xq/B23rjxFMf9K2razNkEdtq5W5OSoBSMlbg==
X-IronPort-AV: E=Sophos;i="6.01,214,1684814400"; 
   d="scan'208";a="115292217"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PgQeRyj5g3hI/hDuASni94BQhm8KSAjYmXS00Yg3BdxpMDHr4IUgVpG50r2S11EwTCA0PrehX75qkLNRLs/wbbstON+OkyDXIP1cyvVur/Jri4V4egRMibcmUiybVl/ZDmCPo60N1lLwRREvGGpYVpV4IIDyJBsie2UJ/I6AtAH32iEbQWcGtCrRzdErHjXzPsIbnHokEcOylmoNWbVollXUXXAaJLze326+j5+kWRN9Ni4GQKuTcrqsLV14/l8dJ1ofurVZaVYanObxopei2zHJLNEYV3II6ZadM8BT7koVNvltKLYT/NphXE9dlXELEA62wLkDhZCrGIZg6PazYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8iSW6BR8tHSaCafmxrsbjXhx+JZIcoHj9dYYbMKwRI=;
 b=SmFaQVtNEEt29pRrh2qHWoyZ+qU6s07AJhomnMWseWEbSaH5VWRuae1DaEWLmR3jOGAp0ybdmYJYX7JroyRGE8zvswqdRlWPZRGeKK04HCVOnQU6UQ9gWZ51iXC/Om4GcKFQ9M9yALhua8+daT1WDadAgaxxcAqayhlxGQftOjBzPVnhOuCev99T/g4w6D9NSZObClh2g89SbVkGrbuB7sz5FYp81DIWuNFiCZSpIvc1n/ovqqFsSfOJ7elMuDmMo0gBrY3gwc6Z7QxaiKbfsCujMu7uZr2SOXZqAsWQzyF+lsjwW6XMcjFz69RbllGKzgaRhgcvjygCnndsYAiUuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8iSW6BR8tHSaCafmxrsbjXhx+JZIcoHj9dYYbMKwRI=;
 b=bYzhYv9O1lpL/4xur9PcP9Si+CmHP33Fa3VFu92eTr3aAf9WfVWKizpSj1N0vTeI5R4uP9PsgnKtma9fJEcizfO9cL6Ij2bMOY7EsgiXOYZsWrEoVHSgZS/OqjX69HJBkYAe0QqOkdCVi2Hifs/mdEB7Sk2KN5+hrBUVtl4eAEg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v2 0/5] x86/ioapic: fix edge triggered interrupt migration
Date: Tue, 18 Jul 2023 14:43:29 +0200
Message-ID: <20230718124334.36548-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0322.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::16) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MN2PR03MB5326:EE_
X-MS-Office365-Filtering-Correlation-Id: 3999a059-8bdb-4425-2c4c-08db878ca209
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Sn61c3XbxTLWhxb4GD7HxV+iQI6xoLjq98jPYAJyYcRQ+maIjQrcl6xwOxmJewGKo2z8UqDmWyNYP2jNAq71h7MxQ+aA+ffbM+FVWrIoyhX8Fw6D7logYrBfbzQDV74E36waRtjgpgN3ObWlch9jydbfpUGhvjy/gs30YdgnpAorJF7vtXVvlepEbIt7SSI84ckMkNbF6hCO4+z2CEKm+Bz2dt0Bc9qgp4w3OKb+ZcZciaKd9dhjTX5Cx7Vvv2QHa6dHWxfiAwKiPXdlCuvuJOR288aZnJdPTSvWkvTW4sJgqJVyxTWO/MrMn4lv8adMb9szrW4GqOokF4L44lh/cPdmFrVVqWGZuvZc6UBiVs0+DdbVXu7Mxv+IRKbzLZqb4VSn1CZLuVTYx5EbzOtWRKLiN6zrUOpJxKCnQwVNzvVFKpAxW6s5wVaxtd24LB8SkAAJa//c6yUWbANjKDtaOZ7rxTym+IiQB68FpwNhAwJ1p2x3H3wYGkmrPwJ3tRkR35l9b1DIzQtBWKiHC9KwPHwo9ueq8sgmXtZlCturXEcd04mKfoykUYkSS6OD7V4h
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(451199021)(2906002)(66899021)(8676002)(8936002)(66556008)(66476007)(6916009)(4326008)(66946007)(316002)(41300700001)(5660300002)(6512007)(26005)(1076003)(6506007)(36756003)(6486002)(186003)(478600001)(6666004)(54906003)(83380400001)(2616005)(82960400001)(86362001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHBjUTZBNjBBai9WMlNkeWZ1Qk4xbEJPeVhOc01VY3N4VmlXcy9DL0NPa2xZ?=
 =?utf-8?B?YUp4eHhWaGZ6T2phNmRrVzZOOHpNalZGWE1rZHlndHd1OXpDMDFYK1VkNG1W?=
 =?utf-8?B?OW10SVV4Mnd0WXE5bjFIVGFWaWZINzZZejRxVWN2RmdhRnpZL3R0YUpJVnBU?=
 =?utf-8?B?ZGJ3QUF6aHFQNldvalpUeU5rYXR3SGdtSDFoVFFKU3YvdjdZQlZoTjRNeGlR?=
 =?utf-8?B?dXMvL2w0aHQ1YlNtNHEvbnU0L1NGRUJPa2tSbmV2d2l5enArZy96OGVEUnlo?=
 =?utf-8?B?bFBNWFFuT0xqVEFBWUI5U0xwbitFVFFTcVhkT3hTSStpa0dhb29OZE5jVE02?=
 =?utf-8?B?Q0xhQ3oycjRzTUlLbkcyclQyc0xXRmwvb0xJbUlsRnpWYjZCN2MzclRSYXR2?=
 =?utf-8?B?dHZXNkFyWThSY2tITHdacW5FVGFsOThMaTN3d0ZxbjRESEw0cmZXT0d6OVgx?=
 =?utf-8?B?K0VkY09BRmxBSzdsbk1MK1U0Y2lWRUpWWFNyT25GMTBDTFRmaFF3MVJyMlJs?=
 =?utf-8?B?a1ZQVGpyajVkUWs1R1FTTkFNcEdKTVN2U2R3aGFPNlgxM0VZcG9SRGVVMlZT?=
 =?utf-8?B?d0orNnZ1cFh6dnFsSWtVQ1Y1Rk4wMENYWDZjZk9uWTVzd1B2SGQ2ODVrVTZW?=
 =?utf-8?B?RUpiOW9DVEJLcTBXdm5xN0Y3YThYV25wNGhJWlRzZ1lIUVhKQmFzNndwT1h3?=
 =?utf-8?B?eElFdnNyVTBCMTRaWHFaMy9IcEdOSTRIN0V2eVR2aGJoZkxrM0RRZm54Y1Vs?=
 =?utf-8?B?UWQvZnJyVjBLMURPZE5sTlBPVTVva1JoR3Bva0lGcTZwVTZPeVNSa2F0a2ox?=
 =?utf-8?B?empuSlUzV3hLWlcxZmxFSCtuQWh6U3ZzV2RnZmNkOGljM2lGUlgwbnhzSU94?=
 =?utf-8?B?VmJSRjhKUmQzTHhkdUdGcFNweExlTTJsWllOUHUwUFlRZkxkK1NucXJQQkx1?=
 =?utf-8?B?WkJhTlMydXJ2QzlKV1RZOFg0UTVpL25KbC9XSVh4M1hFNm52ZUNOa2ZuRlAv?=
 =?utf-8?B?Y216NTZ3SkhkaG1CNjFmT2ZTMVpac3FvZWh1SmJsdDdJTHdVeWlVWU1SRXpE?=
 =?utf-8?B?KzBCdkFjaUR4WUhlTGkxb1QwZXhPUWcyNGcxaFhSaEZ3TTlxZ2tMZTFnK05o?=
 =?utf-8?B?YlNPT1A3SjhLTUhDSnhoLzRMZWZyUkJlaVUrMjhpeTJBa3JEYTRLeHdTZEpK?=
 =?utf-8?B?QjdqcXRUNC9NWWRYemNsRmU4dUtJdEVpZ0VPQWhSbzYyeTF4VlQ5a0tFSHAv?=
 =?utf-8?B?Y3QxeGNIaTRoa0FDWGg4VHhnRTU0bG1NTTRGZG1PRVZQNTJyVkFlN2dnd3kz?=
 =?utf-8?B?QlNWQlRFdnR4akNlZDJUVnZFS01KcFJmY3Y4U1BORjJlTE53OWtOTXM4OWRh?=
 =?utf-8?B?YmFTdlU0UVBVT29ROTI1WFZLZFRpVUw3Yml1Y2h2cko4L3dtNlVNUjlnYzhl?=
 =?utf-8?B?Wlo3dW9BYTB2cHpUNDZrSHZzNDh2K2F3OFVOLzYzTjBhazYzNFM2UjZBeFd5?=
 =?utf-8?B?cFJSSWJ1STZWdjFJQ3AwOHp4QXNSVFMzQWJ4UW1KOE90bm0zZkNxeXJ3STBt?=
 =?utf-8?B?aWt4UVBtNFhvTXdyY25KRExCbjNGRGtLVmFEWFNVS1ZxeWZIaHp6KzlubWwy?=
 =?utf-8?B?TytTMm5ZeE9Qc05OTzBzV3BYNGZKNUhSdkwvVGVtNTBwVHdXSGRuak53TjJP?=
 =?utf-8?B?LzRwNS9FUVRyZG5YTTUzQlBrdWtOM0RWaG41L0RKMURCdm5zVjIrVGRRMW1T?=
 =?utf-8?B?VjR0N3ZETjM4bmhDQnZKa0IrSmN1a25wamwzekg3RWRQK3RiUEtZRDlOQ3Z3?=
 =?utf-8?B?VEdzMXB5R0x0aFlTQ0xSWXRaUzRrVnFEdCs4U2J5b1doU1ZjZVJLc1Iyb0xV?=
 =?utf-8?B?aElpR1hKQkJuZHVPaTVGZnpLMEdmL0RxYzVGWGE5QmtIYzZwbHNwNlNGb1Fp?=
 =?utf-8?B?QXpzQ3lTQ2NoV0dKWXoxSkZNR3BxSWc3THRzSm5KSlVWdnVaZ0NYeHhVbXNx?=
 =?utf-8?B?M01tdS9VNUtZOWgyNU5XRUxRWlZOK3c4ZFFKZ1BXYWVGTnhZbCsvaXdRcldI?=
 =?utf-8?B?R3JzUkNqRURQNzg1K1B6T2pXMkc1cXFtQWxtMnV3U1FYOTNkWlloZFJVRzBC?=
 =?utf-8?Q?nWM2dUahO+WNcZqVCqThZmaDm?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JlsEvG6h6P8GwfxeKD6lBv0zPlcU2Y9KGWbv93J2qj5zkefp7Hs7CL02spxeRtEzenI8MbQ0jzZHqf2/IXKkIAJUS3ZBKUTVSdvK3lkIm0u7qwP1g+ONCsMOqkFDVNVomnQelo3Gk3zaq2DqJgb5Nr2Rrc3sDu1AfXtXNE9N7zgN6pQUzLlpNVpzIqtsTgd4ndZMiPDxlWcKBa76I/m3tVZkANy9d7XY9y+LeHkHWKcfZKrBzmTcluDdPxwRb1D2j7gLdiZ51LNYdZgumocDw6Ofs8kUuEqsix7HbaAnQG6Hr5+lAYNHRLb7R+gGrkchl2+sl8KZLkavKI0+fAK2739MwsucSxfbw9TdcCvbxSDuUO4XDBfVnFWKAGf2DLmSFCodffd9R5/mZY1G7vMXmGpEVsH+/zi0hEdYcozfm0kme1HiBNpawdw24gDC7umA2ZukmQS3ldXGxO6n36lIgtUw+JIkcNmGB9UJYEbyaoFxdWyV5mMwIlZtEM4awI5DejdgSkmqFHvtb/YaV+bik3LXNh5Hjm9R86EXEzxgl2N6OfV3pxmN/i0Z+JrvUsMYB3Zl/hIRTMiWZqKQE2bamN2zT1a1ZsB+G3+tF+Ixhwxmt1LDX8zGqjCWu5b+zn/P3D3Q6+q8iwPhbLOzyEjWX1N4PVHvRo0si7theT0ZNhjEX8FOZ/ndKHnGVz3AEXgXoBLTV0ITCy/PLjEPF0HHA/NlCDjcQiP/vPp1ac1BGfhrohzUZTmbZcIDAXbfb1aq67lcF1Qup4zf7CYFvcMrHbA9s0Q9Rjlqq0houuVCezn82sYcDeBIEj42K7xKjp+FRRTyN04dwFa2Hb5qToneWSiED6tT+2KOg+AliryAiwE=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3999a059-8bdb-4425-2c4c-08db878ca209
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 12:43:49.0037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2XltR3yTr43AbQLWnWgyf+CzO2FWUyj2w796WXPEnk2J1Y83MDZ568+O4bjuNJRxxf5dlEtdvDW5TYcKEL5Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5326

Hello,

Following series attempts to solve the issue with IO-APIC edge triggered
interrupts seeing an inconsistent IRTE when injected while being
migrated.

It's been simplified a bit from the original RFC, and does make the
logic in the IOMMU RTE update handlers cleaner, as those get passed the
full RTE.

When not using interrupt remapping the logic is left as-is.  One further
change would be to mask edge triggered interrupts, as destination and
vector cannot be changed atomically when dealing with plain IO-APIC
RTEs.

Last patch has also been adjusted in order to always to atomic IRTE
updates on AMD.

Thanks, Roger.

Roger Pau Monne (5):
  x86/ioapic: add a raw field to RTE struct
  x86/ioapic: RTE modifications must use ioapic_write_entry
  iommu/vtd: rename io_apic_read_remap_rte() local variable
  x86/iommu: pass full IO-APIC RTE for remapping table update
  amd/iommu: force atomic updates of remapping entries

 xen/arch/x86/include/asm/io_apic.h       |  65 +++++-----
 xen/arch/x86/include/asm/iommu.h         |   3 +-
 xen/arch/x86/io_apic.c                   |  40 +++---
 xen/drivers/passthrough/amd/iommu.h      |   2 +-
 xen/drivers/passthrough/amd/iommu_init.c |  10 ++
 xen/drivers/passthrough/amd/iommu_intr.c | 155 +++--------------------
 xen/drivers/passthrough/vtd/extern.h     |   2 +-
 xen/drivers/passthrough/vtd/intremap.c   | 131 ++++++++++---------
 xen/drivers/passthrough/x86/iommu.c      |   4 +-
 xen/include/xen/iommu.h                  |   3 +-
 10 files changed, 156 insertions(+), 259 deletions(-)

-- 
2.41.0


