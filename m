Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B93951D936
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 15:31:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323134.544711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmy3M-0003JK-Lk; Fri, 06 May 2022 13:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323134.544711; Fri, 06 May 2022 13:31:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmy3M-0003H2-Iv; Fri, 06 May 2022 13:31:28 +0000
Received: by outflank-mailman (input) for mailman id 323134;
 Fri, 06 May 2022 13:31:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4KMJ=VO=citrix.com=prvs=1183625ce=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nmy3L-0003Gw-I9
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 13:31:27 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d32455b1-cd40-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 15:31:26 +0200 (CEST)
Received: from mail-bn8nam08lp2043.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 May 2022 09:31:22 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM6PR03MB4138.namprd03.prod.outlook.com (2603:10b6:5:58::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Fri, 6 May
 2022 13:31:16 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 13:31:16 +0000
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
X-Inumbo-ID: d32455b1-cd40-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651843885;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=1VVhjZskjIkyDgfUOQOgRjo2mEr+FFeZD2ZUhp6yUPE=;
  b=gTmvGMXxNygiA77jDWN3+jVpgxoqiQazcuPU/vOU2ykMJIVxWObSLaAE
   y8STaMbpFq2UJIc4vknRmRA3HeSILWvaLcDZ3RaolthTm+lCZ2gL6q22T
   eig1a/22FwEtRuAVgfRSRDOHSh5wjdYT63db0II6S/XBomN5w0X08oGa4
   c=;
X-IronPort-RemoteIP: 104.47.74.43
X-IronPort-MID: 71145896
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:3aob4a0nZ4Yd115JG/bD5c5wkn2cJEfYwER7XKvMYLTBsI5bpzxSx
 mMeX2CAOqrbM2P8e9pwPIXl8ENQ65aHzNAwHgBspC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tMw34Dga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0WpZ61WxwxZZbzhdtADz8HERFuGYFvreqvzXiX6aR/zmXgWl60n7BEKhFzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B8+fBfmRjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SCmL2AI+Qz9SawfunXV7xRp9YXXIdPQOcWXeulXlFmkn
 zeTl4j+KlRAXDCF8hKH+H+xgu7EnQvgRZkfUra/85ZCgkCXx2EVIA0bUx28u/bRolWlR9tVJ
 kgQ+ywvhas/7kqmSp/6RRLQiGGAlg4RXZxXCeJSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRSXKa9THuc8vKeq2O0MC1NfWsaP3dYFk0C/sXpp5w1glTXVNF/HaWpj9rzXzbt3
 zSNqyt4jLIW5SIW65iGEZn8q2rEjvD0osQdum07gkrNAttFWbOY
IronPort-HdrOrdr: A9a23:lv2Ql6mI+qQJeV04qdf1fRIBwp/pDfOwimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtND4b7LfCRHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaFp2IhD0JbjpzfHcGJjWvUvECZe
 ChD4d81kydUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInty6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXkIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6W9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfF/9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmc0a+d
 FVfY/hDcttABKnhyizhBgu/DXsZAV4Iv6+eDlMhiTPuAIm30yQzCMjtb4idzk7hdAAoqJ/lp
 r525RT5c5zp/AtHNNA7cc6ML+K4z/2MGXx2Fz7GyWWKIg3f1TwlrXQ3JIZoMmXRb1g9upApH
 2GaiISiVIP
X-IronPort-AV: E=Sophos;i="5.91,203,1647316800"; 
   d="scan'208";a="71145896"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OT/G/s9qPZFrVSdzuIGui5IYP7hzCDa+VtzYNwlU9x8hW5er73Y3VJK+WFFMa9UYdhlv8E6DJerJmNSk07iJorbWAbwIv3Jm+6Z80/cynsD4WRHlrfxm0tx/qNr0HhrhR4UmqvTlmeiGooIBp1giSDqgDEtPTUUaJNNm6v0+AZtw8qI3Z/XRlqQ7TWIYyH3F06FSTeCplq+5Mlm9wYH65XrTSerAQ8qLie2LHQ1dSbhDwXG+CphuFGTa3byKDSH1T+M7q8TytFtMVP3M5f7iD/1m5i/wGx40+DNpofU/wBjHzIO2gmrhmzrKgGiWb1eLkE61i+hCg7cgN/CvSCd7GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDXZa8VyqidZWzbaEeMMnoyqNAhOgGA7+An6ZwKWWDg=;
 b=fpiOY0U5F8nxtvHzTAr9IVqb8jphmsxChE7yEtP3DC4fQyuN8G3mPw5USuUCePvzogW+k4h5j6r6Ic2+GJl7Q16pXfOk/v2xW+SD61a9eqj870Kvyu3PIrT/4KC36qQTfz5mlWHgOX0CpUKRfDWWYq3tio53KVJjVLN0B+QzNHzBwdckEThH7jKSoyxWzgULVSffdOi+iRISXxYinZfmlZ9En5U4C3qqJWzGaHeo3DEfy+eCzfvPk+9qoel4l7Ze2I3aGWYBJ8PjmIpiUNl9r+EI9moMpZZ/KIt48F+cY+uu+Ht0GjLaB1pvREHkO0m+r7reB+LNOmNwgaeZb+cMXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDXZa8VyqidZWzbaEeMMnoyqNAhOgGA7+An6ZwKWWDg=;
 b=p+E8yH+bqyohiHZ+3BTj1E4B5anAOC9kPeenx/kgHOeBT51OxoW+t64fT1JfRJX8+zVdZvofNTjW8qSGtDUNwl+WYfl9VVjuOFtDp+ntolb6TU35nKiipYdtACys6lUJsOG9dPzYdUM84utgaGoX/ak14wr4SVydlwrJjD+Ugbw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 6 May 2022 15:31:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] build/xen: fix symbol generation with LLVM LD
Message-ID: <YnUjICUinDIiNJ3p@Air-de-Roger>
References: <20220505142137.51306-1-roger.pau@citrix.com>
 <cc494c68-787a-3cb9-f192-48511d5577cc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cc494c68-787a-3cb9-f192-48511d5577cc@suse.com>
X-ClientProxiedBy: LO4P265CA0154.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab2e4455-f1c8-422d-eafe-08da2f64b206
X-MS-TrafficTypeDiagnostic: DM6PR03MB4138:EE_
X-Microsoft-Antispam-PRVS:
	<DM6PR03MB41381412E45B1F2287C155A78FC59@DM6PR03MB4138.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RooO4dqpXCycul+zfKmQaXFvyBQrFk5jpQm16W6g3VmV13vJPmujPXh6+3af7aT/zP5tZMEi9b7Xo4pp8WzjZaPSx5Vb7PaOVdTD3wHzTS5uWkD8tIu3WVq9SpAOPoCnVDyHbignBpi4Z3th9mgpCiOe/eKdQ3jgwpcXZXbQgosKC3VelDHpqiGvLLw7AXFrjUDo89f5RC14gi91PhkOpdUM85qomfs/+qRb4bSwMztWEijQ7v0/DhA9YHDv1aUtkKEqR4OnwD2Exd1so13eVpaXZNSjaJHlkHQ6CuGI4M7Wmg4fAHCLjmZq3qlq+9Wgt2QQPKhSxbKYxp5HOnUeBoboBQ/LWyV0W7HUDZnOR6g4k9QBPW84hW4egnUCaXMST4X7MiUDk6NL/VQqDSMEE7Muh67ejfKB1eGOXqWt7r5Sn6lnfuazm1oxgmx465RpR+PGCdg3v7sbFxXwInORJ26IkxTqUbGJHO5X7wtp7oHgwZDgcVt0jcYrw6qwAWdXzBk9HeABvKas9JSslFyz70WqYYblrp6kmutAyOViTmGCxFb5Us/wKl/zHUibtv3azwwC7iFlKFz9s6FFw2romE3ijt5l9Gr/P2lB073AZVbNo80+yq3JnKJtoC+D1jJ8Wp9Z0UmtcRN7DyL6Cm3Lp5/9nBDzlxDbKtXi2HqLdraGbNMVYe3dU3VmPajdbU3I+LQGYfaFtPIv8WX+6Hv203jR8zYy0kxrrPTexkzehR4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6512007)(9686003)(26005)(82960400001)(38100700002)(508600001)(8936002)(5660300002)(86362001)(6486002)(966005)(8676002)(4326008)(6506007)(66946007)(2906002)(6666004)(53546011)(66476007)(66556008)(54906003)(85182001)(6916009)(33716001)(316002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MExIZDJ0WDA4UzZTRjJoRjlDclVPK2M1cFp3SU9sZnR4NTB2WTl1dHFnWEVs?=
 =?utf-8?B?ak8yaGZhbElMOEFDbk9BeWZuNTF4dU90VUtQeUVSRHpyZisyVXZoQjJkYnVa?=
 =?utf-8?B?UjBEa1E3aUpMbUxSNng0eVNGWm12dUhYWEg4cmxvRzVaYWw0SUsxTkpodElU?=
 =?utf-8?B?bFcwSEVLV3FLY0Y4YllZOVBPUmIxQ3ZEVGxUM0lOZDZabnlCSEZpbzlaMGV0?=
 =?utf-8?B?dVYySndKclhXNWlFUVVsMEtuRzdyai9SOFNGOVBaR0crbTNsaFJCdWRUc0My?=
 =?utf-8?B?V2FIUThPUVJyZndGMmtlTElFZ1lnSkRBb2ZlajdXUjMxR3BRMHY1SnR0a3VP?=
 =?utf-8?B?aE5jY2VScDhWaVhRNmtVWTBOMDJQRy9ybEpVaWpaZWlSdEVTNGZTWlY1b2VS?=
 =?utf-8?B?dHV5aUg4Yk5wS0VDRkY3Qmhhd3VXM1AzOVhxK3NIS0xUMTdkRXJDZ2xrSHFP?=
 =?utf-8?B?MFI2bjNZZVJTamdHcnBEY3RnZ3YxRTJ1UkpvSmNBS0o5REpKeXJCcnJJc0lj?=
 =?utf-8?B?dVk5UVVQdDY5WXorSXNyaXZqa3BLQkIwakt0c0ZmYjVsdTVBNStzcmdYbm9w?=
 =?utf-8?B?L1RoUWdsM2pMYkdLN25GSUdtV0lvQU5rSU5ib3NRNnJDSDVpdzFtVVhzWDFi?=
 =?utf-8?B?bWJhN1U0V3lnbnJjMjE4Z0E0dlM4anMzRGY3TlZmWXZMZDJvYVA3Nlo5L1Fo?=
 =?utf-8?B?di9obmNZdmpxUFRFMzU1TW9SQXptL25Gemt2Z3JHNFV6cDhicGZ2bWdhOTNt?=
 =?utf-8?B?ZVJXZXFGMEhhQmJmT0NIK0I1OVlRUUhuWE0ydHgzTzFNV01WRlFvRkxIS1JO?=
 =?utf-8?B?Q1J4MjJ4NVM4dzhSRVBVc29EZzdaMk5nN2IraWgxNCs2S0RHNkVYbnFxdmVK?=
 =?utf-8?B?OUlzeHNrcURBMlI1OUk1RVJrWk1UYWhVa2RmMDdDR212VVlXcWtwOER3OHJ0?=
 =?utf-8?B?UWcyTkplclBSdjNIMERod2Jzc1JtQ1ZFL1pMaHBGUitKNkpOWGJTVDlPdGd3?=
 =?utf-8?B?eXdGN1V5MzZ6UlZhdlZFNm5CRmVLaThUTExhazhlV0lmUkgyNkZ6cUp3WFU1?=
 =?utf-8?B?VnJrRWxNcmgzclgrdW96eXk3YjMwUnBWQlF6TXlWNzBkWnFGNzkwYUhydXJr?=
 =?utf-8?B?Zldta0x3eTRTbzRvN21yZkE5WHFRejRlK3RtOWpiVlFZM0tLVXRVSG44dlM0?=
 =?utf-8?B?NmRpYjdSVEhyM0xUMVdwb1ZOaDJjUUpkRkhMVmQ3UG42cUVZZ2VwSjMzUzlV?=
 =?utf-8?B?cEljYncrU1M4N0NPR1VFK3JUTHM0OWV0Z2M0WUdzWWROTys3cWt3anN3TlhD?=
 =?utf-8?B?MnI3TzVvcW5wd3BUbmVhUEVyOFc1bGtQMm5VS1NlcVlIdHNlRjlESk9UazN4?=
 =?utf-8?B?L044elhBVDVLSEF4UldnUFlxTS95YXNMaFRNN3BpM0xYdDcvdSsrVVo0dnVE?=
 =?utf-8?B?cWFiVGNIR2RYVnZVR293elJVY21Od3ozekp2QlgxUUFaU293M2p3R1QwNmZw?=
 =?utf-8?B?TW5aYWQ0eVVLYk9VcW9wNjhqcGJFVkxjTHNKaE94eVQ2YzJ5V29nUGw1QVdp?=
 =?utf-8?B?M2d4eFdhbUdtVXdLNGpWejhVekxOdUhvSWJPRVUyK21nRnBsYUxsTXh1OEly?=
 =?utf-8?B?Y3lzZkY1MHMrRWFMaG1DYXpBQ0ozNWJMQUR3QW5aejFBOGhjQmVOODhIM0FR?=
 =?utf-8?B?TE1OZkhJL29Rb0Q1Z0QrV0xhdGFYVkRrZVVpZnVveVZWVnl6Tldzem0yeVZO?=
 =?utf-8?B?UDNXekdGNFJtajhsYVgrMDYraTlKdndNTVdJajRTdmhHdnV1a2M5Vkg0eFdo?=
 =?utf-8?B?UFY5SGJmWGxGZzFyVFRpQVc1RVYydkpqWlJqQTZmdmVEb2ErWmhleklxM20x?=
 =?utf-8?B?VHErOExyL2pOeDVDdjMwVTJObU5iT3QvV05zWFQ3MWtpVjJnNjRzUzFKVGJZ?=
 =?utf-8?B?WWlyVDFUMjRMQll2L3lMWTR6WmdHZkF0eW5rVUcwT3ZXNW1XeXIvZFhaeG9w?=
 =?utf-8?B?Y3dIUTBlemQ4RnpXMzVEV1loc3QxbU9QMkhrbnZxNHdCbzlEc3B6MFo5TmR1?=
 =?utf-8?B?VG1MdGZZUGRRT3h1WmVCai9tM1pzSndXM2dSSG5VS1pEQUFyVytSaUoycmpR?=
 =?utf-8?B?UFpBUmZ0K1BqK1BOR200SUhucXpJTmthSXgrVCtMTWp1ZmRZVitXZG9JVTgx?=
 =?utf-8?B?RWQwK0VzVjM4TjdVeDJ0Njk0YlFUbm9rK0JEcitNT3IwRWw4QWZpNDVVRTdH?=
 =?utf-8?B?QTdNMmxIeEFRb3J2VkFiVHcvYXZjc3N0bVpNUUpPOU03UERmTWZXcUVYMlI5?=
 =?utf-8?B?UzYzcnVvRWhLdllCYVhnWXJYbm1rc3RjNVRnRGdQUEZvUDFaZk1tTW1uVGxm?=
 =?utf-8?Q?+NfIrV1nY8X4b7dA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab2e4455-f1c8-422d-eafe-08da2f64b206
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 13:31:15.9347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jBbYDJisgKFapOB9p7tJzTMVMAIO+rFoESVAj7nYJrZhqMsHZ3Xl21XH85sxKbCuu5XHO33fs2fSokAIdMRC6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4138

On Fri, May 06, 2022 at 02:56:56PM +0200, Jan Beulich wrote:
> On 05.05.2022 16:21, Roger Pau Monne wrote:
> > --- a/xen/include/xen/compiler.h
> > +++ b/xen/include/xen/compiler.h
> > @@ -125,10 +125,11 @@
> >  #define __must_be_array(a) \
> >    BUILD_BUG_ON_ZERO(__builtin_types_compatible_p(typeof(a), typeof(&a[0])))
> >  
> > -#ifdef CONFIG_CC_HAS_VISIBILITY_ATTRIBUTE
> > -/* Results in more efficient PIC code (no indirections through GOT or PLT). */
> > -#pragma GCC visibility push(hidden)
> > -#endif
> > +/*
> > + * Results in more efficient PIC code (no indirections through GOT or PLT)
> > + * and is also required by some of the assembly constructs.
> > + */
> > +#pragma GCC visibility push(protected)
> >  
> >  /* Make the optimizer believe the variable can be manipulated arbitrarily. */
> >  #define OPTIMIZER_HIDE_VAR(var) __asm__ ( "" : "+g" (var) )
> 
> This has failed my pre-push build test, with massive amounts of errors
> about asm() constraints in the alternative call infrastructure. This
> was with gcc 11.3.0.

Hm, great. I guess I will have to use protected with clang and hidden
with gcc then, for lack of a better solution.

I'm slightly confused as to why my godbolt example:

https://godbolt.org/z/chTnMWxeP

Seems to work with gcc 11 then.  I will have to investigate a bit I
think.

Thanks, and sorry for the trouble.

