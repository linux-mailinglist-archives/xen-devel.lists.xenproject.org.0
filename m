Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B67F054AC22
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 10:42:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348636.574847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o127V-0001Dz-RS; Tue, 14 Jun 2022 08:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348636.574847; Tue, 14 Jun 2022 08:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o127V-0001B7-OX; Tue, 14 Jun 2022 08:41:53 +0000
Received: by outflank-mailman (input) for mailman id 348636;
 Tue, 14 Jun 2022 08:41:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i1me=WV=citrix.com=prvs=1570496fe=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o127U-0001B1-NI
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 08:41:52 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4d1703e-ebbd-11ec-bd2c-47488cf2e6aa;
 Tue, 14 Jun 2022 10:41:50 +0200 (CEST)
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Jun 2022 04:41:26 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH0PR03MB6543.namprd03.prod.outlook.com (2603:10b6:510:b1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Tue, 14 Jun
 2022 08:41:25 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 08:41:25 +0000
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
X-Inumbo-ID: d4d1703e-ebbd-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655196110;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=oHtueR6sxPyG/BmubKvrr6PYQ39JAFMVREfhd03kS1w=;
  b=An8MZMzOJywXgThR81FIgb3PnlxB08iK8BhB4K6uoo6ZrJG/AWtUIf2M
   TzSC1iEX8lg+e+6cxrY7bPc+7ESJ2w4otAA67FqpqqZnHdOijIei6zpIu
   cHxpKuhPyDFYHfbQ21zWHxAgRaHdA/IpEWWmLgTsHkd3olgLrXpM/lzSm
   g=;
X-IronPort-RemoteIP: 104.47.58.108
X-IronPort-MID: 73394696
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:PeI9m6P+4NihD2nvrR26lsFynXyQoLVcMsEvi/4bfWQNrUpzgzJWz
 jcfDW2FMqrcajbxctl+Ooyw/UsEsZCGndVrSQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZn29Iw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zx
 osRhKGMRhgQb4bulf1aVh59OA1SIvgTkFPHCSDXXc276WTjKiOp79AwSUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7EdaaG/WiCdxwhV/cguhUGvnTf
 YwBYCdHZxXceRxffFwQDfrSmc/33SKuL2MJ9jp5o4Icvnr+1zwowYL1OYfVWPy4R+lQhgGh8
 zeuE2PRR0ty2Mak4TiP/2+oh+TPtTjmQ49UH7q9ntZonVmSy2o7GBAQE1yhrpGRkVWiUthSL
 0gV/CsGrqUo8kGvCN7nUHWQv3qsrhMaHd1KHIUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbQGDq5WQQHOZs7uR8zW7PHFNKXdYPHdUCwwY/9PkvYc/yArVScpuG7K0iduzHizsx
 zeNr241gLB7YdM36phXNGvv21qEzqUlhCZvum07gkrNAttFWbOY
IronPort-HdrOrdr: A9a23:SqKO8apPdhC+1ga1PCryv8waV5u5L9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5Wo3SJzUO2VHYVb2KiLGP/9SOIU3DH4JmpM
 Rdmu1FeafN5DtB/LnHCWuDYrEdKbC8mcjH5Ns2jU0dKz2CA5sQkzuRYTzrdnGeKjM2Z6bQQ/
 Gnl7d6TnebCD0qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPwf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0amSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7tvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WvAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 VT5fnnlbdrmG6hHjDkVjEF+q3uYp1zJGbKfqE6gL3a79AM90oJjXfxx6Qk7wI9HdwGOtx5Dt
 //Q9VVfYF1P7ErhJ1GdZc8qOuMexvwqEH3QRSvyWqOLtB1B1v977jK3Z4S2MaGPLQ18bpaou
 WybLofjx95R37T
X-IronPort-AV: E=Sophos;i="5.91,299,1647316800"; 
   d="scan'208";a="73394696"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Scd/xg+AVDsTC2+JHQadlWQnDW41Lmc7DJfqqkhlZRJyPNgjG75zqi8v2SvztsDg/LShBghMTkPzV8Lsp5/CtnMXnCUPX7DRji6KW831usVNR+T6loqBHURuST8wmuJaSntgTWhvet0aMa1XkUxNnNBZl8rCY50LWqEQv9ljJRM7yEFThoYh8lJMp9O5egpNQOKrfMkdIHIjkFqfAH2/0jRjJAC6vpWQ5lIR7+EyMzl/OrYMIcJGkl2tBUUyLONobhmzUaKm30Md/077HV3B1Npg+u3jDKSlUizbSPY9BbPACLGgjUJm8E9rRlx7Adx8sfF8No8SixeD4whsTgGQOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGPGaFqBVOi5BK+qIiLCapLMrmlUB2cPOrnh/DVTg+g=;
 b=jsW/rkhS1lzDIaZtK3P8jF0KVRU9T/7Hhn0Qg5xZzBxcoFXyjw9bRZaIbKmXTooaZe2oV41DNjNmy7klE0ZUwPYGAhgp5UOEA60YazRJPECqiEI/WDwbyPOCgE7+3U7aW3NErxdM3gtyhcquTm+xfEkCYPLK1GTNWQAQ28fnUCxcINdN/4Q4rpuZfCoHQfdFA75WkWQaobLNEZMLfC8wxrZEoEGCSgmm9Ru70dMxxx/bXeC9EMiQJlu5aqpeet9w03f/qnCz9lv3t0uJgSPEhlCgvt+WbvRaRy6rfKQgM7OUcSElSTMesoLaKsWu0KDutDNQR1kkFwh1UuGjJVSyNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGPGaFqBVOi5BK+qIiLCapLMrmlUB2cPOrnh/DVTg+g=;
 b=NY3QyWmbZWVQmWzpA/GN6cKC3S0LyKFzY94lPCwoL27rUTRyTEbUtk5VGqRKMjqUmkakyvNDCwdRuQcI5nuGkg3vbAEkvLVQGh/t20Zs96kggKh3O4fC2y8C0eQ01J0vrAbqdXOyB/oAk79z64rltQssWdAmSwdYtObsQPpvWdg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 14 Jun 2022 10:41:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/console: do not drop serial output from the hardware
 domain
Message-ID: <YqhJsOn0KpCwQjeQ@Air-de-Roger>
References: <3a462021-1802-4764-3547-6d0a02cd092f@suse.com>
 <YqbziQGizoNX7YFr@Air-de-Roger>
 <3d0d74d8-55a9-cdb6-0c5e-616ddd47bbc0@suse.com>
 <Yqb9gKUMokLAots7@Air-de-Roger>
 <afa0a9e3-fd35-be38-427e-3389f4c3ca26@suse.com>
 <YqcuTUJUgXcO3iYE@Air-de-Roger>
 <f0f87e99-282b-6df7-7e57-3a6c73029519@suse.com>
 <YqgwNu3QSpPcZjnU@Air-de-Roger>
 <69d85d88-4ec1-987c-151f-0d433021fe34@suse.com>
 <YqhHtetipYTG8tuc@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YqhHtetipYTG8tuc@Air-de-Roger>
X-ClientProxiedBy: MR2P264CA0015.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b02eeda6-7786-45e7-0c1b-08da4de1aa77
X-MS-TrafficTypeDiagnostic: PH0PR03MB6543:EE_
X-Microsoft-Antispam-PRVS:
	<PH0PR03MB654313BF779B4938ED909D8B8FAA9@PH0PR03MB6543.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lPQC6OqeJdeJDZHK5HGGiiOWfN+ZzzZcuMFLQQQMAsnoz7A5WIMCKyzgDsMzLY3b6AasAbQLXLa2KYCAp2GjKsl/fbnXmJn3FxHS6oQ4w0+yfEjogri3d3jF39iSxY7Jcphdae4u6xcG1JA7TUHa4h79zQD+x3pLIXJNfONbqWMfJrSAiXLDHJy2H/v/rxbWigbCtTiTXVeoqTz6F+RoZ9F69qmMoq47nXeuuvkx7hqn3Msm9QZZSMwT5jksURyo4kidJZXiFdK8J9Z3FeDhObPvJBrQdgLirlq/wqcBm8OlQ+j8uPMNVGQ5ieiOQmn6KqoSP+C5uBUQSd6p6F6g3G+GT8jT6hgGcLAsvy2Mk2qZ6m08K6VBIfn3YYRDRYP0X9GHCdA2zN0qXXt4V903NCkbug4OsFzSJAiQD20AXRQfofwxTVGc/2/FZfkVrhhveEMwFgr98GYxJpY7pYakRXtNWmM4C7b7/xLq9NE7aCHIMMZRW1f2CXrz4eLjLwYk7uvf0nlYJ3tc3upKviLqk8oXCNNoF9cpfhnGQxj0Z2OfIx09Be0XG0CA1rRhKu/IEcJYoQNxXgXpQOfarloTVMIbN+dMnt53b2jJ39POI84kdopVayMXvWmcy8O72/iSfwGr5Ee/OlLESRisNG+n1w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(4636009)(366004)(82960400001)(6916009)(9686003)(6512007)(54906003)(26005)(5660300002)(6486002)(508600001)(38100700002)(6506007)(53546011)(6666004)(8676002)(316002)(4326008)(66476007)(8936002)(186003)(83380400001)(85182001)(33716001)(2906002)(86362001)(66556008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUJMMHpZNFllSS8yM2c1TEF5L3IvUUdKUWVNSVh0cGpJaE9WVEpYeHc0eUZJ?=
 =?utf-8?B?S0JVamdQZWFyTStMeXlYMkNiMDY5YXhSZmtXb2VMbi9ldUg1Y2EwZzhQbE0x?=
 =?utf-8?B?d0tLeXVSaDBIRTRJN0IyMlk0aDlVdi9xVEZLM0VvQ3huUytzMjN2OFVLZStv?=
 =?utf-8?B?UmVUc3UyTzdjSTBUZW9BY2xQQnk3aHZjWFpwYUZwRDdRMjllZVQxZ0tBNGlS?=
 =?utf-8?B?Wk9xUGNPZ1NTL0d0cDNyaE03MnhwcEpLQmpTZlU2empSbFcxcjF6QU40K2lR?=
 =?utf-8?B?SE1XaEZYbGJXR3dMc3hSNUFFZm5ySmkvbFFTSksyUW04SjI5SlBaWmFZRzRL?=
 =?utf-8?B?WVB0bWswWHVScnZ1S2N5aW5JUzJzMGdyUFZSVUZMT1o3a1NSanhPaHVYM1Bh?=
 =?utf-8?B?U1VweGxIOVQvcEZMUkVzTU5oUm1jc2FNUDQ5MGZHVW5MV2hJdmZ1VGpuTkd6?=
 =?utf-8?B?TTdJcDdUWFpoVEtHMnZ6Nk5yeWRlV0I1WTFTVWxlaTNmUUpueTA3VnhlUGVZ?=
 =?utf-8?B?OG1nNWVCdCt4S1c0ZElpb1BVZnBSS3lrTHIyTGEyd3lXN09NSGdpR29uRWZ0?=
 =?utf-8?B?ck53ZHFqSkRSNkxUTW5NQ3N0WTdUU2piNXl2RUNtZWFHOGQ3bDkvMk9kOXNK?=
 =?utf-8?B?MGVNVzkwMlUreVMzVS9uUkZoSnN4bTQ5OUtldG1vYkdmSHRtYm9pVjRsVmM5?=
 =?utf-8?B?NHlwS2wvSTY4S0JySjR5RkZQSDZYc3VvTnUxUWRlRU50MkZlQjJnV3d3KzNK?=
 =?utf-8?B?aVhSQWlIRCs0UnFUNWJucVJsbkh0VlZtcEtLMlVCd1NMa0d4MFNjRlJxSkRk?=
 =?utf-8?B?akRoRlFZdUJOTnE2eThHMGxKNUE4VjdNL256dm1ka01ZdDc5UDVjeUFJN1Bm?=
 =?utf-8?B?amZLQXRENkVEa1hBa2ZZNGhQRGhJN0FvdnpXZEU5cUVjb09tVzAwS2FpTnRS?=
 =?utf-8?B?OUsyY1FQaTVIV3BpNGhiUTRmVlNCbjV6elowemNmM2Q2U0FSQ1prM2VvVUdl?=
 =?utf-8?B?SS9KQ1k2clpDTDJPMytZYTFTZFZqeTY0a0VzcVI0YWV4SktuaEdnaHpscS85?=
 =?utf-8?B?Ni9sa1diZ3VrTElqd1FNUkZaS05mdW5hbVBpeVFOWXZBYXI1NVo4UmJ2WWV3?=
 =?utf-8?B?VTF3UWdDM3RqdXB3R2tNQkl3N0s3bkx5WEZ3VUI5dXFvK2ErSFZVKzAwTUFo?=
 =?utf-8?B?azFPSUpiS0RUaXlrU0R3VmxIY1lQSDk3TThlaFJFV1FQaGcyZEpXVTV6WDNY?=
 =?utf-8?B?NXN1WG5iK1BuS241R01LWVpLcVEyVTVoa1BYVlRTYXFnMVRPQ0xoem1RRjl2?=
 =?utf-8?B?L0RuKzBZeWFpNWtVMnhDRi9EUTdmS2Y4OTY2OFlRRXVJT3V1N2hNVXU3Z3Ar?=
 =?utf-8?B?dHZxSVAzMGRYeldyT1dBWVhYT2hjOHlldDcrS3lkbWJBVXNJbTlOUnFHTDBF?=
 =?utf-8?B?OWYvWUQvUlFkSGFlMFBZdSt4bEdDYVRjRWVaYzNzdEtkdjY1MElEUytLZkY1?=
 =?utf-8?B?aG1ScStEYlhpZEJsN1p3SjExOVVBZkZBNG0zZVJIT1FGYU4xbjZnalczbzNj?=
 =?utf-8?B?aW1iUkNDS1d0akpMSHE2SkYrMHhoQ3o0emRpTk1TZnd6TURXRG1ZZk1iZjdB?=
 =?utf-8?B?OUN3ZEE4Rmcyc0VKNkdHM25NUGRRUHFyTEhHWW9MSEw4TEVmSEplQlpONlI0?=
 =?utf-8?B?NkdxbE16cHYvbGFFc2xDT3djQlUrNHgvTnNsTWpVdVMrNkNxTVExNmVMaXpJ?=
 =?utf-8?B?NlRBZlhYMHQwblNXR1QzVGNVTHVHYUJ6czYxRU9oQ2RNZ21VcVlIdkJzbU1Z?=
 =?utf-8?B?S0VIWitFNmtjUEV4OHZvdUx0S0tyNm9Lb1ZjNUF0YnBzTmxhU0VQUExyUDVk?=
 =?utf-8?B?SjN1ejh2VXRQcWs3ajc5aldybTZOakY2dFV6amZrMFBYWEI0bjlVLzBLSVda?=
 =?utf-8?B?YjdVMEhzRXk5anFwUEdPaUFLYklldHpJeWJ6RUc5RUE5WG1JWGdPU3BZbDVX?=
 =?utf-8?B?TnA0UGhQRlJHaysvdFI1dlBTUTV0RGdRV210M1MwbDRPUGtGQXR6eS9FcDhS?=
 =?utf-8?B?am9WQjYxdTA4R1UzdGIwS0tVeFF0L0QxRmlzd1ljZm4wZzZEUFJQTGg1cDM2?=
 =?utf-8?B?b2RDc0ZUdXlPd3BIeTlsYnp4ZzlRRjNoUE5tQXNMOXBQYU1EUUtCczFsblR1?=
 =?utf-8?B?MG1zQUpZUUY4bzgva3RLS0FDM093aTNiQ3VpaEplbGg3bS95d2ZoRnJGOTA2?=
 =?utf-8?B?OGNVR0N4UHJoTjkrWGhQYnlBSThrVkhuTTJrVUdFUnI0OWdrL3ZWQytQaWhH?=
 =?utf-8?B?L1Z2ZWVOY0sxOFVWdzJzc2ZQRTZoWW4yWVkzNzZlRDBhWjRPUm1RYnNHK2M2?=
 =?utf-8?Q?8MahVQHNS97GGvV0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b02eeda6-7786-45e7-0c1b-08da4de1aa77
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 08:41:25.0191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FhPY6uKgWilIwhxjQC8vj5CThv3oohVEaANnlkswK8Yzo3EYPfHCmEXAuKob6SGq39lApYleuZh8/OO+p4Lmog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6543

On Tue, Jun 14, 2022 at 10:32:53AM +0200, Roger Pau Monné wrote:
> On Tue, Jun 14, 2022 at 10:10:03AM +0200, Jan Beulich wrote:
> > On 14.06.2022 08:52, Roger Pau Monné wrote:
> > > On Mon, Jun 13, 2022 at 03:56:54PM +0200, Jan Beulich wrote:
> > >> On 13.06.2022 14:32, Roger Pau Monné wrote:
> > >>> On Mon, Jun 13, 2022 at 11:18:49AM +0200, Jan Beulich wrote:
> > >>>> On 13.06.2022 11:04, Roger Pau Monné wrote:
> > >>>>> On Mon, Jun 13, 2022 at 10:29:43AM +0200, Jan Beulich wrote:
> > >>>>>> On 13.06.2022 10:21, Roger Pau Monné wrote:
> > >>>>>>> On Mon, Jun 13, 2022 at 09:30:06AM +0200, Jan Beulich wrote:
> > >>>>>>>> On 10.06.2022 17:06, Roger Pau Monne wrote:
> > >>>>>>>>> Prevent dropping console output from the hardware domain, since it's
> > >>>>>>>>> likely important to have all the output if the boot fails without
> > >>>>>>>>> having to resort to sync_console (which also affects the output from
> > >>>>>>>>> other guests).
> > >>>>>>>>>
> > >>>>>>>>> Do so by pairing the console_serial_puts() with
> > >>>>>>>>> serial_{start,end}_log_everything(), so that no output is dropped.
> > >>>>>>>>
> > >>>>>>>> While I can see the goal, why would Dom0 output be (effectively) more
> > >>>>>>>> important than Xen's own one (which isn't "forced")? And with this
> > >>>>>>>> aiming at boot output only, wouldn't you want to stop the overriding
> > >>>>>>>> once boot has completed (of which, if I'm not mistaken, we don't
> > >>>>>>>> really have any signal coming from Dom0)? And even during boot I'm
> > >>>>>>>> not convinced we'd want to let through everything, but perhaps just
> > >>>>>>>> Dom0's kernel messages?
> > >>>>>>>
> > >>>>>>> I normally use sync_console on all the boxes I'm doing dev work, so
> > >>>>>>> this request is something that come up internally.
> > >>>>>>>
> > >>>>>>> Didn't realize Xen output wasn't forced, since we already have rate
> > >>>>>>> limiting based on log levels I was assuming that non-ratelimited
> > >>>>>>> messages wouldn't be dropped.  But yes, I agree that Xen (non-guest
> > >>>>>>> triggered) output shouldn't be rate limited either.
> > >>>>>>
> > >>>>>> Which would raise the question of why we have log levels for non-guest
> > >>>>>> messages.
> > >>>>>
> > >>>>> Hm, maybe I'm confused, but I don't see a direct relation between log
> > >>>>> levels and rate limiting.  If I set log level to WARNING I would
> > >>>>> expect to not loose _any_ non-guest log messages with level WARNING or
> > >>>>> above.  It's still useful to have log levels for non-guest messages,
> > >>>>> since user might want to filter out DEBUG non-guest messages for
> > >>>>> example.
> > >>>>
> > >>>> It was me who was confused, because of the two log-everything variants
> > >>>> we have (console and serial). You're right that your change is unrelated
> > >>>> to log levels. However, when there are e.g. many warnings or when an
> > >>>> admin has lowered the log level, what you (would) do is effectively
> > >>>> force sync_console mode transiently (for a subset of messages, but
> > >>>> that's secondary, especially because the "forced" output would still
> > >>>> be waiting for earlier output to make it out).
> > >>>
> > >>> Right, it would have to wait for any previous output on the buffer to
> > >>> go out first.  In any case we can guarantee that no more output will
> > >>> be added to the buffer while Xen waits for it to be flushed.
> > >>>
> > >>> So for the hardware domain it might make sense to wait for the TX
> > >>> buffers to be half empty (the current tx_quench logic) by preempting
> > >>> the hypercall.  That however could cause issues if guests manage to
> > >>> keep filling the buffer while the hardware domain is being preempted.
> > >>>
> > >>> Alternatively we could always reserve half of the buffer for the
> > >>> hardware domain, and allow it to be preempted while waiting for space
> > >>> (since it's guaranteed non hardware domains won't be able to steal the
> > >>> allocation from the hardware domain).
> > >>
> > >> Getting complicated it seems. I have to admit that I wonder whether we
> > >> wouldn't be better off leaving the current logic as is.
> > > 
> > > Another possible solution (more like a band aid) is to increase the
> > > buffer size from 4 pages to 8 or 16.  That would likely allow to cope
> > > fine with the high throughput of boot messages.
> > 
> > You mean the buffer whose size is controlled by serial_tx_buffer?
> 
> Yes.
> 
> > On
> > large systems one may want to simply make use of the command line
> > option then; I don't think the built-in default needs changing. Or
> > if so, then perhaps not statically at build time, but taking into
> > account system properties (like CPU count).
> 
> So how about we use:
> 
> min(16384, ROUNDUP(1024 * num_possible_cpus(), 4096))

Er, sorry, that should be max(...) instead.

Thanks, Roger.

