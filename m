Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6E560D13F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 18:04:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429966.681354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onMQ1-0005Pu-8X; Tue, 25 Oct 2022 16:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429966.681354; Tue, 25 Oct 2022 16:04:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onMQ1-0005O7-4X; Tue, 25 Oct 2022 16:04:45 +0000
Received: by outflank-mailman (input) for mailman id 429966;
 Tue, 25 Oct 2022 16:04:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bJBo=22=citrix.com=prvs=2902c4af2=roger.pau@srs-se1.protection.inumbo.net>)
 id 1onMPz-0005NK-Ho
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 16:04:43 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb766313-547e-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 18:04:42 +0200 (CEST)
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Oct 2022 12:04:36 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BLAPR03MB5473.namprd03.prod.outlook.com (2603:10b6:208:296::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 16:04:34 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 16:04:34 +0000
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
X-Inumbo-ID: bb766313-547e-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666713882;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=wrastLq3dbl3Mn+1zNrKLfjEPmzgPvCBbdX58bWzaPw=;
  b=AfGl6lz/rtATaKbD/dwiqG6QwGeO5HLihTkIkm70PzQ0ZkrKH5WdAC29
   hq6wLQWu0mAn7Ef9YMqroJK2IhiuF5aJXzbxhIGJ9gEzdV5LPehOeJI6x
   riSZZGbQoPGCtOZRsCV6+CtpRsBzRWHaCsDRG5G4BUaDEzk8+1QwszTIe
   o=;
X-IronPort-RemoteIP: 104.47.55.176
X-IronPort-MID: 82575103
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:48MiQqmKnoFweVWwCtE7PWno5gy2J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNCmCEaffcZWD3ftsiYI618k1Vv5GDmoQ2HFRurSs1HyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6UqicUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9XuDgNyo4GlC5wRkOKgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfHmdx9
 eBEEmE0NlObo/CUg4KjT8pNr5F2RCXrFNt3VnBI6xj8VKxja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvi6Kk1IZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r83LKQwHqjA+r+EpWl1acz3WaewFcOUiw2S3qkg8Whp2ShDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLSNrmK2YTzSa7Lj8hRO/PzIEa1ALYyAsRBEApdLkpekOYgnnS99iFOu/iI3zEDSpm
 TSS9nFh2fMUkNIB0Li98RbfmTWwq5PVTwkzoALKQmai6QA/b4mgD2C11WXmAT97BN7xZjG8U
 LIswKByMMhm4UmxqRGw
IronPort-HdrOrdr: A9a23:Cv/QKangO9K3thFdg2ooPj3JaBbpDfO3imdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKOzOWw1dATbsSlLcKpgeNJ8SQzI5gPM
 tbAstD4ZjLfCJHZKXBkXaF+rQbsb66GcmT7I+xrkuFDzsaDZ2Ihz0JdjpzeXcGIDWua6BJdq
 Z1saF81kedkDksH7KGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 D4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR8Xue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqXneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3GlpT1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfYzhDc5tAB2nhk3izyhSKITGZAVyIv7GeDlJhiWt6UkYoJgjpHFoh/D2nR87heAAotd/lq
 b5259T5cFzp/8tHNxA7dg6MLqK40z2MGbx2TGpUCPaPZBCHU7xgLjKx5hwzN2WWfUzvegPcd
 L6IRhliVI=
X-IronPort-AV: E=Sophos;i="5.95,212,1661832000"; 
   d="scan'208";a="82575103"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYpQFUDMChOdPoRz6td+w6jWUyISxzb3FZQtP6VT4CUspy06gmlCnYID3zwltsdZWcD4+FxQIjw8MuqKIbUz/lAHCfXuLD5cJkw3H66dfpZE3jssgBwNnKGhj1g1dsGKoz2rYQgd+Dri0uZSm0TYiokabD1ST+0tLO4WE3a1vxli5+mrTvixASyPQ4HmzIRX2ovmDzVk74sHmp1Tw5gAvzWY3hexDrkwtSL1LecpsYcP3S+rcJOtWWPNQhHaxEAaDRpHrORzULTtEm95D9Q5F7d1aDAbviIipfwoDOPfOhXqQj2mDDm1a2MsO/PXcAZZltZBuPfFRcsOn6E3EqM5lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96jn79eJjGReWi027q+gD707LOnjTQWRbOoc55ad6ws=;
 b=KkY6tYqkf0MOFRpk8ZGqH71V4YMdkufXXUJMftoFoh8rZIN8FYrsRrem56XjMMQ/wVZF6It1jFgRrk51nu+G/LGMkOrEuwj/0T6mHtbzYrKQ24QRjo+F5BAEToTYWyOfHQyhzj8N7fBhntHcDC/uJvEHiIbrDiGUfFN+neZd32Wkw0vqGH7VHdaNslBJJEC5+PT5X1CTEeUAlX6xCoiNOU8HijGGqy2B8Mub7bxQZ0HZdXieEXL50CBxssMV5zWlRqwgsX84L8UReEdFaqhLb2C+oRP81HIZUlGZOWpgaW7nKw3X0PvSEzQdhNd4Cv92UoLWbzI0JYJ+hJTYUfP4yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96jn79eJjGReWi027q+gD707LOnjTQWRbOoc55ad6ws=;
 b=ICD5bmNJgOJT2VO6wirlrEJJzHcmDXT2z07eqU8/Z6d70R67u28bgcGkfaRLU6mDKlnaPcFrizzhT24/aTT0UGWeLuH/6/KldAG0arXkaJEG7dcq1XL7xoqS3HfVob7ZSNTyqYajigkft4I7Eqr6O38plLRCC30kE9xxmk5+QZc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 25 Oct 2022 18:04:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH][4.17?] x86: also zap secondary time area handles during
 soft reset
Message-ID: <Y1gJDYEjARSD0F/s@Air-de-Roger>
References: <c80390e6-b9c2-e15a-b513-ec97e8329ad8@suse.com>
 <Y1f/iQaugcmhiP+0@Air-de-Roger>
 <76d0ce3d-7c05-9f4c-921a-0c7e0f5d9348@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76d0ce3d-7c05-9f4c-921a-0c7e0f5d9348@suse.com>
X-ClientProxiedBy: LO4P123CA0157.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::18) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BLAPR03MB5473:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d90b0d0-090c-45cf-f2f2-08dab6a29baa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	apS7BOpyAOmDGCtf9OgwrKKI8nqhvRleu8IuPCg1WyFfXG108ssmGqgXdYuX9v8iAmCVH7KKmW9dPu+nnDpPRx0KpGbc+xjoOBTP5kL9kYPscs/J3i0lhUYrNYvf75OmGOTLWGF7wJbyjAkKhRv7FX/cueHkATHxhH6rpifm++izVTboBWB0em/A1+bZXM+Ky/jUE3H/81GQEJex3asAELfAhTs4V0oMpawUbBj3H1HY/fLyeA0WoE0LpmbbF00idT6Gb55l02egYQq3D1V7FBGB5BdJbQQmWGOzU06eQC//3illuaEpDd5zckjMh3e0Lpa2mIt/X6xwUO6CWbnEYRJx6y570w/Obm8GpNn4y57xg/vb4c67hOxylZOq+rPsAi9FKQWJYiHv8Vy7q+U+N9CE2d1MTEEinyAvs4HAjbSzHjjQCdEVG+6fjTrsE0MMnGIycj2exUH7o3nf+bw4pm0385JXL2UY5GIEMhRjxRL2KR5MmFXeo3XKkraA46JlLQt/Zbgh8e3SNlP3hDglLkk8UMIbCxlKK4GT1eqB1oeq73Y9ENFpSj9qhAX3dpeSHPOD7Pc4y/gJeu3icQBBUyik/ZGDAp8DlQKlwgkDHiHPKuRV+NUc8t6ZY6pFoTq5jx8t7JAaoJ/4HfSBJ0dgVMTHBk8ck08s5bCKGxKv+CfAxm58xGvtmDdizLRYQzYV3Lqr8GkzCLWpAzkERaXG2Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(451199015)(26005)(186003)(53546011)(6666004)(6506007)(6512007)(9686003)(5660300002)(2906002)(8936002)(33716001)(478600001)(6916009)(54906003)(6486002)(4326008)(8676002)(316002)(66556008)(66946007)(66476007)(41300700001)(85182001)(86362001)(82960400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1NoUTFRT1RSVTdReEhxNmJxZ0VzdGkrTXhDOW04S0dUU21PRjdvSWZUR2VE?=
 =?utf-8?B?TFZ2RHdTVjNGbXhiQ3JlZTRQbjNvcFdQellpMzlWbTRXbmN3bXVLdzRRQllv?=
 =?utf-8?B?UklhbUpITWM1Z1JoOWZvZHRwcGdaelpUZC9JTnowTi8xTDFpZWlQVi9vbTZi?=
 =?utf-8?B?bWRBc1BUaDVTaFh2ekRtZVdzVVpXekVPdlpjaE1CcUlFc1Q3dndXeWswblV1?=
 =?utf-8?B?L1ZaN3FacmFMOXhaN0NHeUxERlg4UzlMdEJIdUphSzJGcjdlY21mM3hHWXkv?=
 =?utf-8?B?UjN5Q092UzQrQ29wRGgzV2x2aEFoK0E2ZlJuTzh4Wjg4R01FNWJ1UnpwcUxW?=
 =?utf-8?B?MDJkYjgrSE10Ky9LK3pHekhuTGpTcXNxZ1RCV0RpZVFsLy9QN09wbENWUXQ3?=
 =?utf-8?B?cEtvamlYZXNpMW93R0NsQjFmcVpiQ0loaW1uam5HdnE2WWRjY0U5VXZnM0tG?=
 =?utf-8?B?dnhjYkhYZVFHbnZpZXVrOGNUL082KzNuaFNXdklVc1pwcVlEbzFQTVhhU05a?=
 =?utf-8?B?NWpUREVXT0ZtS2szODUyQys4dzk4RGJrd1pVZlltZmtST2pkVXJ5SkVjdlF5?=
 =?utf-8?B?Z1NUeSt5aU9iRmZkdS9CTE1DeHlBbnlVOVVkRmszWlFSSy9qeWhuQ1BTek04?=
 =?utf-8?B?RUtDMGNNNjhQRTIrSUxjazdHaTVjVWlPYkE3K1YrMEovTDJZbUJFcTBpQ3k0?=
 =?utf-8?B?dkhVVVBWRldrV0JFNDNwdkw4dzRXUjZzaExocUM1MkNyaVFWZWM2RHMxb1dy?=
 =?utf-8?B?L1dPelUxZUlhTHE0bWdtQ29FeHdwbkFxcEUzL1V5UG82Ri9HNUlLQzRwUm1K?=
 =?utf-8?B?b3FPSTFzeXZONjdVcnhzNktIenU5Ry95ckpNUlQ5WmlwVXEyOVNuM0NNeGtN?=
 =?utf-8?B?OUhaUFE2ZzA4ek9FMGlzM3M3Rm1CMFV4NVVOVkM4ZlFuWjdQYlhrbDMyNXBr?=
 =?utf-8?B?eUFRcGxiZEdtWXlucVp2L3BGV2pCb2ZQdXhodUNJNDIrcWY0R2szNzVOY3BO?=
 =?utf-8?B?SS9BeGdTc204cWR1SWtiVkhUOWtqRS9GelNBUlg4cjlkNURpQWtpckN4YllZ?=
 =?utf-8?B?UldTM1YyODJNUk53VHVacEtzeFEzdkxrZUtUaFVEM1UzWnJ1dW1QdGN6N2FN?=
 =?utf-8?B?REY5azJLREk3aitjR1FyU0FEQkZiK3ZTbW5YY3ZyY0hKaWQ3Y1RWTjRwTEZJ?=
 =?utf-8?B?clBVY1hoUzJ1c1JEaXBFRVRDaDZjL0E0QVpXSktONkZMM2NicVc4L0pNL09p?=
 =?utf-8?B?NUQ4WmlFYWVxQ243QUN4WWRodFlGeU1LSzl6Nk9BUW0xMS81RWhqcDlIOStl?=
 =?utf-8?B?UzVzR0docWdWY0JxODhwajhOYm5FaWpVRU1jMmtwV1JhV2hETHY5d3B2L0Ra?=
 =?utf-8?B?aXlYcWxCTmVKT0RlRW1ZRG9zVy9wQW5FbVZtYk8wUFk0RTNHSE9SZEZRaW5X?=
 =?utf-8?B?aDJTeVVyRENoRWJTZjhQQmRicnRtQ0pXTjRUcmlzYjVpcWR3TFBoYnp5N25w?=
 =?utf-8?B?WmFiQUkwV3dEa1ZiaG5UWWgxb01mN1dOaUdnQXM3TERycERVbjVjanMzU3BX?=
 =?utf-8?B?bzk3Y0ovaVFPdlJKd1E2YklVdE1aenRNNXdkcStlRTRMdUlkaWVXWUNjMmNa?=
 =?utf-8?B?S1BhVk1waWJNL3oyODJNSUdEeHF3aGlsSExjL1QzcXNEUUdOdFAzTGhXVk5v?=
 =?utf-8?B?dGVkS2RETEk3VHpJaHVZNTg5SndyMDFwZDJnMGgrTFk0NExCK3RLeXBRVitM?=
 =?utf-8?B?cHNpbmJlaE1NY3VHakkyMEZRWlZzK3V5eTN2bEpNSDJuTDdMQU9lV1BWNGJB?=
 =?utf-8?B?U2FIRzBhWm92ZFAvV1dKZUJ1TVdkZllidVJxZnNlNDBwTDBZN1h6d3lZK0pt?=
 =?utf-8?B?OWNsSTBILy9wQWNuYVFLbjNpcjRubDh1bXAwNS96Vmg4dnRKWmV0WDl6cy9E?=
 =?utf-8?B?RGhFVnp5UzBrdkR6NW9YbFp2b0lyb0xvQzFBR3VBa1luRlRudmFwNFFCVkxm?=
 =?utf-8?B?bFZtYmx6YStzN0pjNlpXazZGYW16bnZnTmJwSURGSE9LNjFCcG9HQWNKNjA4?=
 =?utf-8?B?dFJObjIyT0ZqTGk2bE5yaENBcWdXN1NJT3JZQ1FiLzMrblpnMGJadXBROEdQ?=
 =?utf-8?B?Uk1OOFMwU2VpLzdpcVZnQmF6eUc4dE5ta0xjc3ZUUTY3SmpyZHVrdGx3bitX?=
 =?utf-8?B?RVE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d90b0d0-090c-45cf-f2f2-08dab6a29baa
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 16:04:34.0537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uxuVJ12qBQ4QBORxML5CqTWU0PM9G+3Y/zrMj0wGVXPMxnZe23Gjdkwh2DyX8mNxNVtcclDok/KkgVtKyEB1Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5473

On Tue, Oct 25, 2022 at 05:58:10PM +0200, Jan Beulich wrote:
> On 25.10.2022 17:23, Roger Pau Monné wrote:
> > On Thu, Oct 13, 2022 at 08:48:21AM +0200, Jan Beulich wrote:
> I wasn't sure about moving arch_domain_soft_reset() as a whole, but
> yes, if that wouldn't cause other interaction issues this might be
> an option.
> 
> > In any case it's unlikely for a domain that was attempting a soft
> > reset to survive the hypervisor rejecting the operation, so it doesn't
> > matter much whether the domain is crashed by Xen or left as-is I would
> > think.
> 
> I'm sorry, I don't think I understand what you're saying here. For
> PV I'd very much expect the guest to survive; it may of course then
> be crashed or destroyed by a further tool stack operation.

I was expecting a domain that goes to the length of preparing for a
soft reset operation to either perform such soft reset, or die as a
result (and perform a non-soft reset), as recovering into the previous
state won't be feasible.  But maybe I'm wrong.

Thanks, Roger.

