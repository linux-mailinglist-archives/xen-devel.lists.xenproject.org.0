Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0032069E733
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 19:14:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499155.770201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUX9f-0001ul-UH; Tue, 21 Feb 2023 18:14:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499155.770201; Tue, 21 Feb 2023 18:14:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUX9f-0001sq-QE; Tue, 21 Feb 2023 18:14:19 +0000
Received: by outflank-mailman (input) for mailman id 499155;
 Tue, 21 Feb 2023 18:14:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aMCI=6R=citrix.com=prvs=409bf5b25=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pUX9f-0001sk-5Y
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 18:14:19 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d749f02-b213-11ed-a089-e9535cc0f9c3;
 Tue, 21 Feb 2023 19:14:18 +0100 (CET)
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Feb 2023 13:14:08 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5430.namprd03.prod.outlook.com (2603:10b6:5:2c9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 18:14:06 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6111.020; Tue, 21 Feb 2023
 18:14:06 +0000
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
X-Inumbo-ID: 8d749f02-b213-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677003257;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BhC6xaM59cHXUqcukPF5bWhYgZ9GHsHZSNxUSqRFPCA=;
  b=ggEPs6BKb8N5Jc9BSY7of0xNcGsWqZSyeMYvUb2qx8lENpJTeHjPWaGI
   m3qFXstIZWxvcxC9zQdoJ+DweOS8wbNOOelq4dgMutI+KRXbomqDR2ADQ
   nwt+EH54jX+YpUvug15bGgv2sN/dFIev2eGbXmgDV4QA6u+pL3RlFk4Wr
   o=;
X-IronPort-RemoteIP: 104.47.59.168
X-IronPort-MID: 97328888
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8NUBLa1pYXYvhTJbDfbD5fFwkn2cJEfYwER7XKvMYLTBsI5bpzMEy
 mAdCmrTMqnbajH8et8ibo3k8EIHsZPdxoNrQVZvpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gZkPKgQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfKEdkx
 KYSb2A3SBGNpMiqx5yVdMZVmZF2RCXrFNt3VnBI6xj8VKxjbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsi6KklwZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXKkA9hCRO3onhJsqE/PnzYfMAIqaUKqruKepGCFWNkBJ
 1NBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rXQyxaUAC4DVDEpQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkAowXQqYCYFSU4J5oflqYRq1BbXFI89QOiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAszA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:tf9NSK7Dp+qhc8VnqwPXwM/XdLJyesId70hD6qkRc3xom6mj/P
 xG88506faZskdyZJhfo6HnBEDwexLhHPdOiOF8AV6MZmbbUQCTXeJfBOXZsljd82WXzIRgPe
 0JScVD4JOaNykfsS4biDPIdOod/A==
X-IronPort-AV: E=Sophos;i="5.97,315,1669093200"; 
   d="scan'208";a="97328888"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDiNZWVXrD/e3useeeejDi3CLwNlAI369KKQnoW/XtcfARTLY+NY8gHfj7NNwTWGp9rJxpBoxUx8reRP5/p5Fc2vaZHTPAJA518h+Yflh4Qq3ZVm3YGop9AWm9ohgO7zzVzftYKyDhTeh02Wc1KePMCocl7tAnDlVBljXjRRfdQUvIup2mBmQ7J0kpLKSXw6kH6ShzjQioXS6nxUjKjz1zscw2M5hj9x6hkJ6Awhi/+828ihvKj7Bzy4RDZWMrqV42J0A1CTz34GVwhcN6GceYNnIFtFlfOjqf6DO+9TaJMmCl/4o7mlxtTKfMwMrcZSiXDcUBPjSdzSctLYcFb1eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ypegoioatRCyWXwJPAOfgkp/o360rWNmzPJTKGTFzL4=;
 b=ENcU9j7jO5knO1QC83FWOdZG0/Ql2D7i5p1bVbR1TY4tztS1x/d2s/7SejwF6TmnpNvrBkts23nus5+eBjV23sHbZ3TpVJUnfW4gucTPK9d5TcZa1TYBz3lm+FKJA5ZwoxhpHTfM3h4q1mm4q+KojJfIre9E08ALxyaN13hOe0vgakLhGI6bJqwq76hx0t8LQ1/Gs71+MRE7BJjCxL1a2bFSlPaaSrW1aYnrViRsDTEG4+QSn4qxeUf+haSnn7Rldmz49Q2phlQf9ZpM2zJJFbdCBeG/lLF5XxQnbHYnwJG3h7d471kxQNDi4N7t9sDxZM79tKFEKJxK3kdpy7QKCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ypegoioatRCyWXwJPAOfgkp/o360rWNmzPJTKGTFzL4=;
 b=usqOvNg3C5qORGpBMEeflRizSEDwa908a3HFfn8caeFnZG6P7sz0oyJl9r0xEsW5/9saPKLN8ecM+qxMqDKm3az906xoYkXrHZc4gQk/EZxz9oHSEvMf5ubj6B9VjRhYDzA29KhohzvD93qdbqTyIaVByPcJQGNVp8nSLYuF7cg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <95737b30-f377-7c2a-316f-8dc6ed7a863a@citrix.com>
Date: Tue, 21 Feb 2023 18:14:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] xen/ioapic: Don't use local_irq_restore() to disable
 irqs
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230220194702.2260181-1-andrew.cooper3@citrix.com>
 <20230220194702.2260181-2-andrew.cooper3@citrix.com>
 <b6b91164-32f0-3615-be8d-da99d9513666@suse.com>
In-Reply-To: <b6b91164-32f0-3615-be8d-da99d9513666@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0174.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DS7PR03MB5430:EE_
X-MS-Office365-Filtering-Correlation-Id: 7465c398-bb73-4ef2-d8c2-08db14376b9d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PXo0wRdUK4iP9qlBtFbzu/oDNWcIuqQ5nl3Nax074obpxlXiUub3Ra6g1DxTt+1gkZE1gT7Gq1EMM097hVbSfnv2/2sbmpw3pl6cSO65MjJVS4DCofj/hyFdp0PZCGrpRrnWZtuTxqdMh3YmbiszsoBw7hBxPzTGHtiN5blmj/V/s5JVKpt7LF591rwpHSVfuM6sXb8BtQiV+c4lqXuGAXIsS3SKagNYlzlF7jEuA8LqMgyWbj7jyDi4a5oS7tAB+lHfRUTRQqxRz5srqbb+N2hh40aSX4AEBH350ze0sZ5pI6x8x8iMLIFPiaZ7dJXZE6KqfJl6dZCnL4tyX4GIplFC3P7wK0lQtRkXYdtFrT5QTmez1RTwhxyzQJjSFTnY6Z5lcmbOANKQiAVGHs3zCqQtEuAnixXb+wkYY1BbeMO9EWVNalGGdxyGb2UUOb3MVanNcrNPoR73COjxOcPD9f0EOH5XVpW5Uc5xfxmEjKX5U7zZQllOKf58302mQKx+Ea9moK+etLZbZbYtoTRk5nAprSDFEQswWvfWtOqU7HAQlsvg1pjRsq9FuUEqA7ncUvVYVMo0aNibASsaAKZ3SYdqO98in8F5tkJBoxRte0nhPMu3HJdhJOMRB46lk5yKqVuQXQ91fhH8rmtwUBheO5FPn2kxQdvSjs+CHTMAyneRqrgiR7v87Cu8HpNsFfsc7Sy4mVmUFM6MzkdFhhUfV7RjOJFfrCECvZkqgZKy86o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(346002)(396003)(376002)(39860400002)(451199018)(31696002)(86362001)(36756003)(83380400001)(316002)(54906003)(478600001)(6506007)(6666004)(186003)(26005)(31686004)(6486002)(2616005)(53546011)(6512007)(8936002)(5660300002)(2906002)(38100700002)(8676002)(6916009)(4326008)(66476007)(66556008)(66946007)(41300700001)(82960400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3pldUEwY1V0N2Q2QzhhclduZGVRaE1tckNuNVhUSmRMUGtseGRKWlVKNm5k?=
 =?utf-8?B?U09CUUNHYk54Vy95SitPVk9QNE5pbXlib0dtOXRjVmdvdXZEazd1RkZIaVJr?=
 =?utf-8?B?dVNENXlaYVgxM2pIS2hlU2RXYTM4ejlRc0RkNzREK0ZTV3NrMEVYNk1tS2R0?=
 =?utf-8?B?WHl2aWdaWWtyVTd4c2RraDFac25kN1g5aWgxUVlhMXZnbnIxYzhoblFlVlJm?=
 =?utf-8?B?UnVKZzRBVjhDZFF6bm1MbS9RNGxWUGVPSERqMXVDcUxLd1NMWVpwVGZpWGMv?=
 =?utf-8?B?SEpyaUJkQVhWWkpBRVJQM3Zob29nWkpNaWJxS3FaN1J5cWpERm9YbUFIMnk0?=
 =?utf-8?B?d3FkVlJjSTZnK2VQVzh1WW5BQkhwMXpBNEp2KzVua1h5M2JwblM5cHovalV5?=
 =?utf-8?B?Z1plUEYyQTNLMnpTOEx6UlBYd1hoN1RBSktTN3ZPWnZTeXViVnJuMDBjOW51?=
 =?utf-8?B?SVBRLzBYQkZWcm5zeEpsNFhUbC9RTWsxcHpDUUVlY1pnd2lMU1Jkenh5TytK?=
 =?utf-8?B?VnBRTzVBMzZhYkVQV0FiR1N2VyttUmljVnRTL2JTQ2ZWU0Q1a0lNc3Q5NDBl?=
 =?utf-8?B?YzVBUVFsRDVxV2Z0WTVtVUE3aExVRkdIRnE4WG4yNlFpcStjbXlYMy9sY3Rv?=
 =?utf-8?B?NmhsMkJ0WUFGS2hZMi9IdUU4TUpPL1JWUVByZjgxcllxcUlteFprKzQyaGJR?=
 =?utf-8?B?enR2NWZ1U29rVDhPTk9EZW1tYTB2RW9SRFJveUFWbUIrT3M0MFNJdXRibGly?=
 =?utf-8?B?VExOVzF3QTFjSFFvQzc1NVpsNkpTWE51SnhjSGE4N2xPbnl6WXVPTEd6T0Na?=
 =?utf-8?B?dHhoVllrdzRhNDBWSHI3eDMycHF5KzZDcnV0bm1PVkErS245RUpZUUtqTFdP?=
 =?utf-8?B?bU1UZC8wSEV3b1FxZ0gwU2wxbFlGUk5KcHc4Y3hXVVhwRmNINXE1TWh6N1A0?=
 =?utf-8?B?ejQrZ2xySFFaYldhUWJoc2NUY2M2VER5MTJrQ3Z4Zjdub1BqblZjZG81ekVE?=
 =?utf-8?B?SWZVY0dRWEEwb3JPdWpxcHVBT29hK2hENVNqTG9DbVV5ZUxtcXdId2hxZjdF?=
 =?utf-8?B?VWxJSlZvZnU2TnFnVFFTeUc4MWwrSFlmT2V3ZEhKcTUyVjRRekJHWDByTG1G?=
 =?utf-8?B?WUo3bXVaTnZTK0tzWlhOSU5LeGRUbHB2bDVvUHpkTVlNbDBod1BIbEdkanBU?=
 =?utf-8?B?WWZqYkdIeVprVGIrREcwTHJUdGtZV05ZbEx6WGJrTlhsQnpLVnVFYW1EcmpL?=
 =?utf-8?B?Qmw1a3BNVUE1NXFIUmRzUzJpMzVHMFl0VGFnVk13Wjd0VGd4Umg1NWlvWHZs?=
 =?utf-8?B?OGJtcFlVSGMyN2RkVzBnMlcvNUdNcElyaFdWNHRna2EyaTY5d1JiQXpxRVFy?=
 =?utf-8?B?V1BOU0tIN280b3BZU3NsQWxIZWY1NGtFYlh2QjIxWmJNcFZhaUVEb0s2N0ZV?=
 =?utf-8?B?OEIyRWxGVGZSa2lTYk5SRThNVVoyLzE2ZDRQcm5jVDUrQkNrUTRvL3M2Tk9P?=
 =?utf-8?B?RXE4VXFXTUZ0eU9kUi8vZnZFZGw1NjdHbWNXN1A4dkN0WXJhWTlHNGw3bU90?=
 =?utf-8?B?R2kvTnBVTHBtNmhvMjJveXJQUnJHYWNZdjNvcXgvWVp6Znk5N1pvdURtc2pO?=
 =?utf-8?B?eC8zelp3Z1dLWWRTcUhaYmx5bGNMRGh3bzhrcytqdWlCcjBCWFRUVzdMMVlt?=
 =?utf-8?B?dUhxTDlkaWwrcXdkMG5sZFFuN1RMbitaZmdYeENwMGhFdVdKQ05FOG9YY2hL?=
 =?utf-8?B?Ump2QUxoVDU5NEFmeG0rTGRkYThDMk9UUS9NWWRudzlxMkl4NllaUFBISVE0?=
 =?utf-8?B?cU1wcUJ2NmlDZzNQTnZCYW5PcTc1TW12V1dGKy9ZcU5oV3lZZTNkd0JjMTZ3?=
 =?utf-8?B?d2ZKTWoyelVxOXBtSEFKVjlUZ29TRXFQc3F1Tmc4bmlEVVkrd0c3WGpMUVZy?=
 =?utf-8?B?ZnFWaG8wTUNVTGdvNzFCY3VEelkxeEhObTRoelBKSWRRRGtnQ2pQZFhkczlG?=
 =?utf-8?B?d0lzT2t1bktBd3BaR25oOEZhY2FFNG1BeFc0ZWxXNTk5VitTaUJTU3NVcXhw?=
 =?utf-8?B?UHZReUUycU9GaVdjNCt6TUFKQVVxUmUvMjRsYTRQUkMzWjlIZzlQUHoxM2c3?=
 =?utf-8?B?SXJWZ3FXVXVjRVpOc1RKSGkvOVNncFlGaC9TcmtxQzZQUHl3S29QQ1dsR2Jn?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1JiPUWqeCebeweaJk5klWlpy8HwECZmH6SMeyRC1v9MLoL3fGqw/m/bd4ioiG7MM4wUSM5F9LxZNFga+/AoLSS1gkPkVlH3jn1RAftAMLP/x3i609gstGX0qGfJzdEeGFlFf+HbmNGjr5KvHOgqd1bPaNBhMJqEVnJh2cPxP5tyGWqC6TpPlUWRqtCzKzUgPRqdLYgdyxIFED3NLqirosVkG8Ucpf483U+a/I7l3PNKE5k5CnNhThlNHzKzb9nkhRT7dxPIZLs7YyNTIbPK6ueL4DpIcF1m1Z+SNiIDMNzJvH8uG1o7V00B5r1a4lNK6Or5dsV+bHBQPBbytQsYmsHMHio7weNrvyPzsTlW1IFAHeF2Kdv/VyZlMF/AgWZm0UImA4uw87sW9nhBxeEjYuHgIAYiW13NpQlyV7B27fpOVf7ZN6446u+32Qs3uu09YjkN/cTKCeLunccPNZKjw944au1v8jooK+UzQT7K7A/LeHZnAPEw4panvdKfimaYyuGTWgySYZ+N1zlI63ORaA8q91JT7FQOb/PkiP9TfQKTfZ2HQ/L5zQCQJmMSAuofkxQ67uB4JR/ekQy1fWXm6eM2D4iaz9PWZS6xTFeoHGMwiO9GKiOn2VAlKS7eXz2NiuoRoFGCDchkPCs/eIybpgVy7nBw8NxK1Jk5It/e4T/sUQ9aWQ2XUzreX8cT2mR73J7GF4O10HgjCpRazaprmu9r0EuRhb8nl+PA3Y9/hViqFl0kWizmxYmUHYI7wB/2twUO6W6ncawowFKd4FsPppYH4t9gwbQJDKr9SVcv912E21r9VGKIAcxuNzWQQTA6K
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7465c398-bb73-4ef2-d8c2-08db14376b9d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 18:14:06.7601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wX3zzaIgjGGQrnSmXVO6Ku+O4uLLS1MI4VBPu6v6/tYm3n7f4+S/AKJGYSeHPnKtDUxaAIlc3uoY/yNhTGp6oiwM9g7p6UaS9mTtld9UN2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5430

On 21/02/2023 1:40 pm, Jan Beulich wrote:
> On 20.02.2023 20:47, Andrew Cooper wrote:
>> Despite its name, the irq{save,restore}() APIs are only intended to
>> conditionally disable and re-enable interrupts.
> Are they?

Yes, absolutely.

And as said before, the potentially dubious naming does not give us
permission or the right to interpret the behaviour differently.

>  Maybe nowadays they indeed are, but I couldn't spot any wording
> to this effect in Linux'es Documentation/ (and I don't think we have
> anywhere such could be put). Yet I'd expect such a statement to be backed
> by something.

It is backed by the rude words the owners of this API had to say on
discovering this particular use.

Conditionally enabling with a construct like this is bogus everywhere. 
It is only ever safe to enable irqs if you know exactly why they were
disabled previously, and that can never be the case with a construct
like this.

It only reason this one example doesn't explode is because its an init
path not nested within an irq/irqsave lock or other critical region.

>
>> IO-APIC's timer_irq_works() violates this intention.  As it is init code,
>> switch to simple irq enable/disable().
> If all callers of the function obviously did have interrupts off, I might
> agree. But the last of them sits _after_ local_irq_restore(), and all of
> this is called from underneath smp_prepare_cpus()

Which do you mean "the last of them" ?

There is a large amount of genuinely dead logic here.

~Andrew

