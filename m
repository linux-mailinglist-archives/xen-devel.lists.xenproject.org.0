Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 486C96BD1A4
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 14:59:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510630.788656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pco8t-0007B9-8u; Thu, 16 Mar 2023 13:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510630.788656; Thu, 16 Mar 2023 13:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pco8t-00079J-39; Thu, 16 Mar 2023 13:59:43 +0000
Received: by outflank-mailman (input) for mailman id 510630;
 Thu, 16 Mar 2023 13:59:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lZp/=7I=citrix.com=prvs=432965e83=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pco8r-000795-Rb
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 13:59:41 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca475a66-c402-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 14:59:40 +0100 (CET)
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Mar 2023 09:59:36 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB7127.namprd03.prod.outlook.com (2603:10b6:a03:4e6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.22; Thu, 16 Mar
 2023 13:59:34 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 13:59:34 +0000
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
X-Inumbo-ID: ca475a66-c402-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678975180;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nx2bl3gDlRH9iCgSdHHjHtusT4Kyu3htzjNZiVT80PY=;
  b=O9ZGq/4QtRIAnOxUjJrkjbhQNnnf3IiquoKnqC6LXvXip3IIssdoA4t+
   ebNFxWtfGw1Hu3N01CxjcFabl6oUzKCwxyCr50UbXpGjtzIqaYNrab+sU
   +y2QevTzzvR/G5QREz+TTeXpqE91syS9wKd5yCCic+BRM7KGhefDtp+LJ
   w=;
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 101032137
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:9ZoysaK292yAFrv/FE+RZZQlxSXFcZb7ZxGr2PjKsXjdYENS0DFVz
 TEbD2/VafffMTCjKI13bNyw/E8B6pWHztAxT1dlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QVgPa8jUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5JKzFe8
 +M7Cgw9LTOAh/Ov8ZCleuJz05FLwMnDZOvzu1lG5BSAV7MMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGNnGSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHuiANlITebnnhJsqFO8/G8+FDQLbEWUqqPlqGGSeNZSd
 1NBr0LCqoB3riRHVOLVWBm1o2WFv1gfRsBXGO057ymCz6PV50CSAW1sZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaOyIYMGsDbi8sVhYe7p/op4RbpgnUUt9pHaqxj9v0MTL92
 TaHqG45nbp7pcEK3qO/4FvOqyituJ/STwg+oA7QWwqN5ARzbp+ofIys5F3S695PKY+YSh+Ku
 31ss8Ga7fsSBJCX0iKXSeMGHaqB+PqOdjbbhDZHFJ4n8TOv93e9fJt47zR3JUMvOcEBEQIFe
 2fWsAJVoZVVbH2jaPYtZ5rrUpp6i6/9Cd7iS/bYKMJUZYR8fxOG+ycoYlOM22fqkw4nlqRX1
 YqnTPtAxE0yUcxPpAdajc9HuVP37kjSHV/ueK0=
IronPort-HdrOrdr: A9a23:3VLLH62kg1ykDU9CM64vIAqjBJAkLtp133Aq2lEZdPU1SL38qy
 nKpp536faaslossR0b9uxoQZPwJk80lqQFg7X5X43DYOCOggLBEGgF1+XfKlbbak7DH4BmtJ
 uIRJIObOEYXWIQsS8j2njDLz/7+qj+zEl0v5a5856wd3AQV0i/1XYFNu71encGPTV7OQ==
X-IronPort-AV: E=Sophos;i="5.98,265,1673931600"; 
   d="scan'208";a="101032137"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVEnhvrfGtaemEZOKxI5R3h6A+aK/2ip/JlHxOCQWKdQ2OxKHJj3K+XqG8hS/7nwpPDxC8927X23LZg5rczHNe9YkF5PP0wSvyWQD7r/fpw5lLRbKiZl3d0ZL1T7ast4wHpLK6ScSD7jeNylWg89cf2NvFHY2mmrhImDBkzgeXvuqCeTe9RuEDrM8eN7pblVhmEFMt/Oth7mZxfnjbZ10xOwTrg/GWnv5YuRcEFLWuF5ys5wXz0Rhyrwg4Gwu3C7gp4t638Hh0TMiE+9p1D7udrfwmFfWakQyf0acrsY2FSkUos4dcF9W0bFf2Z3cHYOJ2p1PYpVQUrapIPZjnQGHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4VQZvK7swXD3F4w8gsXa7ORtxgHAMzvbg2VJxXthgE=;
 b=eqA9g8vSmooyhK4/QWQHfboTQ1Gx9TojltEuDrtu/yUHfWCbMB1lO3KreAJWM9A163gWzVffl/8WrsdpiqZ7ug//hgpYrZDgjhKVhk3eSQLYntqIN8vQ4mrS7lM6F3+40L6QGqz97LoGFOAxr2yOlFeJkhZ5NhMHKwMNXqJcrrDWXVDcFaf5PrPLGaDVCIt0SNuslzhFITqKHvpeKZ9qzSa9Xoy3fjmed4OlHgJw3/r1okhxh2XYECsAwvXoQQYp+JbFklC/mMoThFtGLznvRZmypXvHJWeixsute3QgEZoMQNA4fHrm2dFSrF/ffgxMCjM77uCujQ35PHM3qQO0yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4VQZvK7swXD3F4w8gsXa7ORtxgHAMzvbg2VJxXthgE=;
 b=LrpIy3R72KlHvZK2+ZgLgP7s5zjtbsSawj4BJZUDr3nW9TMchjhXkv47n2OJeGPmVM+8+s/qz940HEV6vPUesr47T49bcGZqweeamkPm8LJGJ7knl3S0qp8rHqQJ5Q1O2ZVfbD1gLipblIK+u7dI6wYURV5TF8KC320TBsbFxBU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <69e031eb-6172-1ab0-5ffa-4650f69e83a7@citrix.com>
Date: Thu, 16 Mar 2023 13:59:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 0/2] deal with GOT stuff for RISC-V
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1678970065.git.oleksii.kurochko@gmail.com>
In-Reply-To: <cover.1678970065.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0059.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB7127:EE_
X-MS-Office365-Filtering-Correlation-Id: 63230421-cc16-46ab-9e7c-08db2626abf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b6PghQMu5Mb9AmPjNiO9QF8bRfHQ1EE4AWQlaKeQGpL+kYNWGZIW4+sA10Kfx6XM0HJbm9Oe4Py1cjaJ23NzTNkoDhsEOzMo0uOHyx358Ms+jXn6n3BXUAV2Jiubcfaept5L79OnKRHLj/eGswdzDJKKp0vMBt65xk6yBhlT7Zt8hzMpPAzKcJ58IiTYsqyeLvqNk4K1+zMcdJ6/maD58rn6JpYmEVCTFhz18bDTCpSAET6oIB8pFECe/n7cAl/tTsNhns7T/YxpnTwBUoLJy0qOqpKMccdS+yFgxoXWweEbOC/RUc/xaFJ+Tqh2y5jOKazb+iMXzKJcnYEDxQwVaP14ro/tTLr0su7Y2j3usV09RWUV7nckb8B+Kg4StuxmDUn2oAONSBdAZpsFBcsAhGzQ3P+eJ67ZpYLD0Mmnq73cSaodrAQmnMtVMEAEnVQBnhaek/wiDKIBYovIoihuU6nhidCAX4TtonKgmwVYmzIn7ZNVUs/9vFNfxHwhlLDZLYmztD3ISo6DjUhdEfAew6SYKE8QYxPSDMezf8xfFhB2xH6llARjS4mIgJEtCkGad6VtfPkPXnpGlsYUlvuMCIuleR8vhOU4qV6c9AYImdrsQBSgJ8BvpmmmiiTDmfcFP7iX8BGmRemiUZR6VpxWOs7DLVnauOmljly5zW1ui92TqP7L/qxQiNECiMd6rheJLqVaEFokSTVVTSuq3o2Co54hSGCwzW0Bf04yIh6HYDI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199018)(31686004)(8936002)(41300700001)(4326008)(5660300002)(2906002)(36756003)(86362001)(82960400001)(31696002)(6666004)(6486002)(66556008)(66946007)(66476007)(38100700002)(558084003)(8676002)(186003)(316002)(478600001)(54906003)(26005)(2616005)(6512007)(6506007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjlkWkVncmhoaU45QzlNeFRWTENkM0c1bFlPUG1LZFVrRmd3bElqN0pTREds?=
 =?utf-8?B?K0NhbHVjV0xocXlBSE9GNUJXTWNpK2l6QkkwcHNrVGR6Z0ZVRk8yeEkyanIr?=
 =?utf-8?B?Z1ZlaXQ3TUJvS2ZDc2JGbGF0cUFGOUsxT1BaN3ZrTXNzRXcxcHZsdy8zUUtW?=
 =?utf-8?B?TGhwbnFMZzFpVlJwWEE3NUtTTndGREQzc0xQV2FPQjdnSFZRSVhyaGZGbUhy?=
 =?utf-8?B?VVZhQzUxY1BYMjFpR05MaHU2K01TZ1FyZTdFUUk2cTV3R1czY01OenNUZTF5?=
 =?utf-8?B?T3BDOVBsYnJlbjhMZ1l1RUNWaW1yT3JGN0dCcStzUWt1M29zaXRYUEJrdFFN?=
 =?utf-8?B?QUxzOEI1bFlyRGRxQ3VvWm9jZm81ZGxLTXVtZnozRnpBRmNSWmlBVEl3QWph?=
 =?utf-8?B?cmFaVTYzMGJEYXZ4RCtVU29GamdDay9HdWJIZGIzay9qYjdiaUJIRTRRUDla?=
 =?utf-8?B?akdISVZDUDdJK0VPNHgrSUlXZFgydlNyK1h2K1BsK1RqV2p4eHhoRjdEc0ZD?=
 =?utf-8?B?aTRsdEw1M0lJcHBYelVqTGR1eWJxK2ZjUmozMjdaT2ZRcXF4eFp2RXRZZFdj?=
 =?utf-8?B?R0MwRlNhazlrOFFYL0ZIclgzY1BEZkRzbEt2NWdORlZjc2V4MkQ2eEVRcTVY?=
 =?utf-8?B?YmpqVWtiSzdhZzJ3ekRuakdxaUpZTzNES1R4a0tIWmE1QTIvR1BMeUtubXFW?=
 =?utf-8?B?K1NDU1BBU0s1WkREb3pJZ1AzOFF4eFNvenozMTFFYjkvWG9IWWp6YW1TckIw?=
 =?utf-8?B?SEc4cTU5Y1VseDk1bUFhYVVXaUNxRktaMjRmaTZDblE0b2xzcUErWDNIZGVy?=
 =?utf-8?B?WWlyL1dpeWxYaTdCRGRYYWRnY3lMQjY5amxicFUrZEpZb1hnT0R6WHY3bWJq?=
 =?utf-8?B?ejhjaVc5WGE4Z1laRXMxQ1hMY3NIZlNPK0FMdGdHY3JoVERBTERDaWpnZmMx?=
 =?utf-8?B?RUJsQzVTeVFhZGRoL0FsR2Z0Vm5qUnNyQ0I4NG1VSlhFTEdDeWpZWjVLbzho?=
 =?utf-8?B?dE1zeHo3MkdsUEtGalo0SmMySmNoSEVHUmFRdE04Njl6eFdaU3lLTmxxUktC?=
 =?utf-8?B?MFp4TmthTytBeWtPVUVRbTAvZmFlcFZVZ21FeUJ3VUVNYnNQRHZSSW9GZDhH?=
 =?utf-8?B?OUhsU1ZXcXF4K0lZakFOOGsvNi9EWlRWekJybjBQR2kwbG9od3ZUd0JwTnVZ?=
 =?utf-8?B?NU9uZ3VOa3B5OFBTY25zWTFONUEzamNNTkFhT2luZVUyQ0ZKRkZZT3E1RERB?=
 =?utf-8?B?cks5TGorTGRxSUl2WElWYVZlKzNlN3Y2ZEMwNGxxWitpOVRVcWZ0bVY5L29K?=
 =?utf-8?B?dG1QMHFGUmJ4emwwK09qZDlIekNtUGNhc1NmYmRBL2I0YVJhZDdWNXBPZ2RZ?=
 =?utf-8?B?Z3BpdWlQN2QvMEpaN1ZvM2RWMFI3N2VlOHhMZlZQekJNZlo1UVpzMENDQXJm?=
 =?utf-8?B?MzVZdCt2aVV1UGJyR3RSVVBwZkRHc0djdWNEWDVBSzlPbzY4UEUzQy95MURa?=
 =?utf-8?B?QTZkeG1CSGtUb3E1U1IwTytiem1zYndIaEh1bjRWK25kM0llWUNPd2lZcGhm?=
 =?utf-8?B?MHRqdnhRWHUwREVOeTdxbit0dXp6aUl2MnZGVTcycG9tSzdTbm5pYUFxSk52?=
 =?utf-8?B?MlJua1FkUGpyTW9PVVpzT0RHeTVVS2hMNStEZnVJdDJTdVJTeWdkQ2NuWWlk?=
 =?utf-8?B?QmZBMUpFZ3lFYW9UVFI0WU1HSlY5SDV1TnBJOEN1YUVuS2x3ZEkvWUxvNTNG?=
 =?utf-8?B?SW5CeHBxVGVKeFcxVnBrdHlyNmp5K29OU0xiVm1wbUxrVTdyLzZtdXNNQ1N0?=
 =?utf-8?B?YlphSjZvd2JIQkMxK1llbDc1dUlWNk1qV0VJbFptUEJVTTlOMEJPbHcwMmtm?=
 =?utf-8?B?ZDUrVWpnbDMvV3ZPYnVyOGY5bzFVdHJUQ1ZXN0pVYzcrVkgwcGZxcis4aVRl?=
 =?utf-8?B?bG1uc1duMVdvN3hLODZEYVVEa1VYaUJac0pQRW8zRmloSDZ6RGJIbGluTVkr?=
 =?utf-8?B?cUE3SlJJSUc1VWI2U0lqY1kwMkdVeHZxYXh5UnhTcWFPbmJ6RERaQXJFSnhN?=
 =?utf-8?B?bURaOHdYQmxZTUpSQnJyTEcwYy9vVGFDSldmenlRN0dpZ29SVjl6VVNHajlO?=
 =?utf-8?B?SHFwRkp4N1N3ZUhWdjFxLzd2dWd4UU9WdjEzNmVUNjNyNWhJYWU1TEtmS0NK?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jshbma3/3/TrbyTPBsDWY4VzxJTjmzmA5u0O56KcAOvx6WOukTCflQB157b4NI1H3t5M0nhJWHpXgPV8GFUoUYk/4IxImLlIYj3RRtYD8FcAw+4m8xIoshGIVoivA6UorgPBLRjPT5k1q4ghrihbh9fPRB37krofiao4F8mBREYHfuFev7ax4EoMooksVjnyqxXVCy4DDMzmEkYwh6B/yH+9o/5U3L+oKYQvwa35r3zEqt1zDTHj53P62mp7c5u/sdyB+6bXGewnxxfioYVN1vgbSaqJk8kacpzomaDPyTuiRSekU9ueLpN1PzX6M+FHZtO4Fzfgw/dYaV/0om1x3sqb0bN7u/1q+K4X/fyHThG2erOEVfLbGfHQCh2BcZwQv8BVkDpT9/YVHyqut8JgRqey4KOX0nY10KLsCcoSZ6sHh7WnFjR3HNjjXZgkI9Y89xScHwWsfxbFSsisoawWHtl7OJrBHAEKmVHt6m7pny6sTLyIM8JZ3yc3EqzdbccOacx/OhJATVH9+lRCRbfxMmKijZYPbLL4eyvp6vm002a0W5061QL37dTGChe2mrDwHLevDqavcV+2Oq1B/9mZO49lvs52PHG8JqGG+OXCXSQTfLPAR1G9eypijMbWei/Rxs6sJWyS+MGfA7e9sYhpNIpXQ4J9aLZB659Gm+r+kWs8sjfn/XDZJ1b+a8XrrIIZFgosb5Sx+YK12pVRSartIR3S/uDuvRh9qReBqMewGijXiC7fjRjKJkwW6wb5AdORXMb27mapD7TDMIcmpOR/6kozJgWOPjH37EuSqVHz9RXWoPVHUf0xrB2rrYuHvNgqwzf/qvXOg11+xmOIe5BgndgKzqehtB14DS7vNH1NHl3bPwU76Zr5UBVTSTVOMWR4s38C5lG6HHxIA5Jh600Czz+3KDCDuSjWd1ZsyQq8FbM=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63230421-cc16-46ab-9e7c-08db2626abf6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 13:59:34.1861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z6db0OnEC0InlBN5iqY3rcm+pxDfrxYF4w+V11XEbF4V/Pw2LiZVBYdXQnJK4xJBW/P9nm8Jhr/bTgbEuijnzuKv9U9sq8TnJJBh3a5n6QM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7127

On 16/03/2023 1:22 pm, Oleksii Kurochko wrote:
> Oleksii Kurochko (2):
>   xen/riscv: add EMBEDDED_EXTRA_CFLAGS to CFLAGS
>   xen/riscv: add explicit check that .got{.plt} is empty

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

