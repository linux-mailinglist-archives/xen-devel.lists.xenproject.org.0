Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C1336C79A
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 16:14:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118569.224763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbOSv-00041t-Fr; Tue, 27 Apr 2021 14:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118569.224763; Tue, 27 Apr 2021 14:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbOSv-00041U-CI; Tue, 27 Apr 2021 14:13:29 +0000
Received: by outflank-mailman (input) for mailman id 118569;
 Tue, 27 Apr 2021 14:13:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D0mD=JY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lbOSt-00041P-LE
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 14:13:27 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f0ffec1-eedd-4db6-bf62-2454ab1822f1;
 Tue, 27 Apr 2021 14:13:26 +0000 (UTC)
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
X-Inumbo-ID: 0f0ffec1-eedd-4db6-bf62-2454ab1822f1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619532806;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=5vRfZ76jKmud33To7lIgl3dm994iuL0j5sMVzXUbJKo=;
  b=ZPrjvUJeD1g8FjIFmmHR3M8140fq3tXZLiY49t9yhlnv3SppukRnICqL
   6pFox+UV28WdRajE2l4HxCts7Pf7kY7gfudVN3CfjkGt8ZNwu0uH4tlWx
   KfOeBj8QjG0ipVb63kKfaVohfUyM505fe6pG+UmTQisDMb22krB+pvYni
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: hVRqE7I6v8c+CMYcuoj5RoKAMPBaX+579rOFwTz1Q2ZeNFipWijvHXWQOcHATO1+ITBLFN1SIi
 osoyWej5fd25JEsmHNcOLhCn6InjNBTETF+JzDEMk4Z0LdqOTibUxiORerVC6MQ70mzqnWw83F
 t2qTaK6AU/C1KS/r2CltIcrIl9WqooQ9gsWDBGy/nvX6LaDMlfKgzRB+07LucvkNfWPXaZQJXO
 k4NetObZjozI6XrkoviHTKPgzUCTosCYwJaATQm4hrc/51bN5S2HIMiQ+dkh7GzQnG1rSBFeqf
 H+Y=
X-SBRS: 5.1
X-MesageID: 42630621
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ZTxqiaDsH4ITD5DlHehTtMeALOonbusQ8zAX/mhLY1h8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPsfVr1zrQwxYUKJ7+tUE3duGWuJJx/9oeK+VfdMgXE3Kpm2a
 9kGpIUNPTZB1J3lNu/xQG+HcopztXvytHRuc71yXBxQQZ2L4Rp6AlkAgiWe3cGPzVuL5w/CZ
 aa+457tyOtEE5nJviTK3EZU4H41rn2vb38ZxpuPX8awSmIyQil8bvrVyWfty1uKg9n5ZcH3S
 z7nxfi5qOl2svLgSP082PI9ZxZlJ/A57J4dauxo/MYIDntlQqkDb4JM9Hs0gwdm+2h5E0nl9
 PBuX4bTqJOwknMdWK4qwaF4XiC7B8S6mTvwVLdoXzvrd2RfkNeN+N9hJlUehac1kw4vNsU6t
 Mo40ulsfNsbS/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEf1Fk9KuZMIAvKrKQcVM
 V+BsDV4/hbNXmAaWrCg2VpyNuwGlwuAxa9RFQYsMD96UkboFlJi28jgOAPlHYJ85wwD7Ne4f
 7fD6hunLZSCugbcLx6H+VEZcesEGTCTVbtPQupUBraPZBCH0iIh4/84b0z6u3vUocP1oEOlJ
 PIV04djkoJP3vjEtePxoBG/zrKR3+gWTj37NpRjqIJ9YHUdf7OC2muWVoum8yvr7E0GcvAQc
 u+P5pQHrvtNm3rFYFV3xDvWpVbJHUEOfdl+uoTaharmIbmO4fqvuvUfLL4P7z2CwspXWv5Hz
 8CUVHIVYZ9x3HufkW9rAnaWnvrdEC614l3CrLm8+8az5VIMJZNvAgTgVGw/dqKNjVGr6wzcC
 JFUfLau5L+gVPz0XfD7m1vNBYYJF1S+q/cX3RDohJPKEfvNa8OoM+eY31f0XGAIQViS8/MFh
 VQzm4Hu56fHti1/2QPGtinOmWVgz8vv3qMVY4bgbDGz9ziYIkEApEvX7FRGQ3HGwduoxtjrH
 5OZWY/NwriPwKrrZ/grZQPQMnDatF3gW6QULRpgEOakX/ZmOYCaT8wWSW0XcuenAA0LgAk+2
 FZwus4m7qPmTGmNG0lpv83WWc8Ili/EfZLCh2MeZhOmrv2ZQ18SWuRnzSVh3gICxnX3lRXhm
 vqKymVfv/LDlJRtmtT1Lrs7TpPBxWgVlM1andxt4l8EmravG9z3eeHarG223CSZkBq+JBgDB
 jVJT8TKBhp3da5yVqcnyuDD2wvwvwVT5jgJaVmd7HYwXW2LoKU0akAAv9P5Z5gcNTjqPUCX+
 7aewibKlrDepQU8h3QomxgNDh/qXEin/+t0Br57HKg1Hp6BfbJOlxpS7wSPtn01RmTe9+YlJ
 Fiyd4lt+q5NWv8LtqL07veYTJYJhTPumKuVO0zpZdIvaU9qatrE/DgIET1/WAC2A97INb/lU
 sYTqg+/avIPZV3edcOPy1e5Vgkmb20XQIWmx2zBvV7e14jj3XWZYzUp7XJrKciGU2Hqk/7P0
 KF/yhU4vfCWG+C2NchetANCHUTbFJ58Who+eOJapbZBwqrffxS5VbSCA7NTJZNDKyeXagKph
 l049uUj/aaeirx1gfXpyZ6KMt1ghOaaNL3HQaKcNQ4jeCHBQ==
X-IronPort-AV: E=Sophos;i="5.82,254,1613451600"; 
   d="scan'208";a="42630621"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFwtTO7RdHxnQriaxov6zCX7GB/Z5wMQA5ThpLj9xfGWqs6DJN+PU6MpfZYa8WR1gznwm/AoN35LfFPErotDdGc6+yK3d/QCIjNKS+3/fzDSguJUgt+FaOHY3WJmR+Y5DSJEeprcBNP0ikEvKmqtQR29nz7iSteCy7/Wo8yDND67k+7+cQGJWS4lpU4XF8VouPUXq5wL0RzTqlTY2oPx1QQPiZ9Np9hlE3EEInplg5MGexHDfdUjVJ/v4KThgKzg/LCqtVQIgvcTyS7BpPzL/iM/m0Xq9z7YPqldgXB3T/0xJGmP7Mo7GA532zXfLh93ZVICP4LNNGHgZ46WJFvKEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xvl8tUv11v88ac6cNVZFYsL7nrvLWJfVU0qKFveb444=;
 b=PSiFIwqMlLGmjn63Obm3FezlskOdjhW5LLtb9kAHNlhhJxZTnyAnqYrcILmwb4qLnGs950y9UTLIxPRgHqKCZzNJevLmQBUhvYhDJRb2ECP7HEr1Z/tBUkzFjzYptWJLj++34503Asc19K1mDUamjo0kKviKoqulgXim3PdV0fs2FqEs/2c3JZsc9sbgJJ1hcsVk8KARR7kZPYbLDaZFJ4lFeM3KscfNcxOqpG3XiFczIpML3NcZEcNPIUIceZh1ueBGnmtalh/e5zQFHbKJZtX4YyIOHmc4Rr5FYS4ZetBzrmEvoxfJj1dFq9ozB4WYGLBWV1KoGVyaDU9yCuXlGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xvl8tUv11v88ac6cNVZFYsL7nrvLWJfVU0qKFveb444=;
 b=c3pL/Ff0uVvpOfGFfezRtN6AijCx6HMaSW2CHdVZiLhMVDKoAsnn2d7eiwwvAPgWwfTyxpccyFDHRdI947Aq5/OrxjzXs7pCGUnv9GHgbxOUP6yetz7syGsXoqYR9Ij+/AN/H8PgORKeqPmtqCw3upteHVFBGme/wh9c/9PgJS4=
Date: Tue, 27 Apr 2021 16:13:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] build: centralize / unify asm-offsets generation
Message-ID: <YIgb/Tz/ic6uVXWo@Air-de-Roger>
References: <fa340caa-4ee1-a302-fbf1-1df400493d6b@suse.com>
 <YH7zXpPz03+kLzEr@Air-de-Roger>
 <e9de883b-604b-1193-b748-5a59795a9f31@suse.com>
 <YH7/SvkrB2yGgRij@Air-de-Roger>
 <5170aa51-8e34-3a45-5bf6-c0a187b1c427@suse.com>
 <YIfTyT4rvD9yEqiM@Air-de-Roger>
 <5018479d-b566-a32b-9a01-5ccf01fe0880@suse.com>
 <YIgSNRq2w7KSSaiD@Air-de-Roger>
 <e9a7b3c5-db38-76d8-64ec-2cfd9f46f1fd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e9a7b3c5-db38-76d8-64ec-2cfd9f46f1fd@suse.com>
X-ClientProxiedBy: MR2P264CA0053.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8df7d18-f24b-480c-bb44-08d909869ddf
X-MS-TrafficTypeDiagnostic: DM6PR03MB5081:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5081A42535AB31A746B1B6B38F419@DM6PR03MB5081.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: co3AjPGFset1N2QN2a5N8ksQFgYX8BPP9hkpkZtwEgxIY+K3ApbOaW6rXM6JBB2iuG9v4jiBBirj0MXW6oJGjwE6wzJyuBfm6VejGgWntcdUdo+7elhduE574Gy5vvENR1T1a8XhsCjuYMrRsmkoiiRgl+OPazpqHDzXFX+jd2lUAgLvYQKJLX3SmYBFIcX9Wfhmbi89+KP0AlWibMqqbHKmVDyV5ZlUIx04UcSD+8XmZdMi/PhNilk4ZtRM/YHZFxCqrxT52NbUwVnpcXrVRXEiLGq/mIN9jC7Uee6T1UkYOPV6aYkV5G8NdmaADnpXdS7qiLpUe4Vg1uYtVUqxCK1ITXG8j1SiEV9kvtTZ+Wdcw9jap46OX51USgDDaY1+pBIygCJ6NuBBtU5zZ8H7PU+DDcVceLY/Zu//lpXvt+/zAPWndj2QL6p1dUMVa487Hdf61mYVyhbV0jMlKJlo9vfenrDJRDkHpfInXpLH5E8F8ytDSuatCgw4KkVEmkd3deR9JAUemtfnw/XLA7K3iQDvbABiDFwiy0c91vRTTiZLT/Ty6mqUBcfiww5lR2vXONxSUUZ0VuLykgC1NviIzPdlvzh9izOXCyCfeNci5TE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(39860400002)(376002)(136003)(346002)(396003)(53546011)(83380400001)(33716001)(6916009)(478600001)(5660300002)(26005)(16526019)(86362001)(956004)(66556008)(6666004)(6496006)(9686003)(186003)(6486002)(54906003)(66476007)(316002)(66946007)(8936002)(2906002)(85182001)(8676002)(38100700002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OHVhY0dISC9KOTQ4eDdadEZKODJ6UWhaYWg3NUdKSTlyUVU5aGdoeEw1Nk1N?=
 =?utf-8?B?UUpBOGE3em50TzVWQ2luZWs4ZVJMSVlNM2xwWTRaOTk2Q2svRjJXZkFFSjlZ?=
 =?utf-8?B?Z3BNZWl3bFZmNEpUOUxCZGxrd21QYzFYWXBjdUltZ2VOTjZrY1lpOU04SW42?=
 =?utf-8?B?ZXVpYUZzODd1Uy9EM0FENkJMVFQ1UHpGM2lGL05HVFVCYnNLaStza3pkaHdN?=
 =?utf-8?B?QnJENkdzbm9xeFdQa0JPL2w1bjNZQlBjSXpGQVlONDFDRVB5SjNPd1IzczBw?=
 =?utf-8?B?NzF4MG84azlWSnZuelJSYlBVOFNjTUViUjkzWFVFWGF4Nk50RUgvUWxXclNR?=
 =?utf-8?B?eHg3ZUc2aUJuNC94Q1l4Tk5Jam82WWpqOVViaGRiN2g4bUZwdTNFR2xnTUlu?=
 =?utf-8?B?dnNMUmFvZWFsaUVXVWRQUVl4TC9WSldhczhIVmZWcDI1alY5bWdKZkZFbUlI?=
 =?utf-8?B?Q3VpYkllc1ZNRC9LeUJTYmtidXBwN0FjSHVWSXVRNEo0T0ZPZHQ2cS91RWtw?=
 =?utf-8?B?RU81bWNWd09pUlExMnYwU21yTjdlaWJLQ1lzaStwV0NxVENkTnBQcXdYSEx4?=
 =?utf-8?B?Q3VwUnorQ3FoeDNDd0tYQjYySTByR0hSU3M3ZkkweXhDQnVDYU51SHRYUTA2?=
 =?utf-8?B?QU9YZGthNWdYRGdrM0VoYUpaNjZSbk45enIxMFFEdndJeXZ6cjBJYjN5eFJG?=
 =?utf-8?B?b2l2c2FUaFpERlhXRkwyd0NPc2FIMDluaGZ1RXdaUjJXTitOVi9jVkplSHRK?=
 =?utf-8?B?NEJPWEZUdXFVdmZwV3N3bHIvMmJjMFljZUxXMVRNZ01JcnpwYnp5ZThoS3VT?=
 =?utf-8?B?eVdtNmtBdDJOblVvOWpXbzBjcmhpTzh6d2hLY0NwS2JPWEJ2cUo5VVMra21K?=
 =?utf-8?B?TktZTUtSeUt6NWI5dUNBTkdHTzhyS3ZWcGxGWW1vMDV5M0V0WkNnTnpVamZ4?=
 =?utf-8?B?V3VETnJqd0ZsSXJrdnVybnExYmtjL0VtNHZyMW5YWWd5QWFLaGVldGFHRGNW?=
 =?utf-8?B?L05Od0VDbFhhWXhpaElnWWdtSkI4azcwdXpmU3pjZ2dvMnFZTnJnRkgvdkRL?=
 =?utf-8?B?bnlzYiticTlKTkovYnNobmRHUWk2azkwNVlCS0k3YVZIdStseDBRYTFNTElO?=
 =?utf-8?B?cFd6d3dwNm1tS2xUQy9zNEpBZVBUWXV6M0tMYTF6R1I5Mzl4dWhGcHJaM25T?=
 =?utf-8?B?dGNESmppSGhUZzJPck9UZEtIWWp4VWlrZnpvRnJ4Qk4zNjNUeGI1ZUNZY25W?=
 =?utf-8?B?dStyQVJJOGdiSXlsdUZmd2tQcVVocGFqNG5BQjR4UVczUy9RTlg0VWFaNVR6?=
 =?utf-8?B?OFd5Mnl5bUlGWWhIUlZtNVBBcFFBbTd5Zmk0MHJTVWhHYTFlQlpadFhLTjFK?=
 =?utf-8?B?eWV4ME5uZk0ybCtBL2tZYlVUVFhyMTRtMnFqY05aTE9lakJiTEdVMVc5ZUds?=
 =?utf-8?B?MFRvbGJ3c05YcmU4YTJwOFZkbUFIUldXQXRlSXhRKzBzWlJFNGMwNmlZa2pz?=
 =?utf-8?B?UG85NGtnQXpvN2U4L2JjNGlveko0SWhwbVB4MWZ5cGcya0c2WTFLUU1tcWtk?=
 =?utf-8?B?dzJxeDlXV0E0SW5pWGtUZjhUT3c1MllWM3RyZjQrRzdWZlR5ZlhKaEtld1NG?=
 =?utf-8?B?MG44MVc3MEU5T29JekJSaDJLUWNZbnpJOHZVVUdPMXd3NXhqT1YvS3RsNDhZ?=
 =?utf-8?B?ZnVVS25yWjJQeFU3YS9SUTNWTTI4cG9FbE8vWjl3WHFodjMwZUExTVNoMC9P?=
 =?utf-8?Q?ntgqoBfgKHGzAHHVki3N3XPF+mIEb3BXssD3gG/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8df7d18-f24b-480c-bb44-08d909869ddf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 14:13:22.9504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4dkIX7yplFOfk/UYAjJqHEF3lgNHSiHpsqUDze92RGENlLzFpzwRvki2tdkQJ5vCz5l96eqV4DMf6MqlM7vNZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5081
X-OriginatorOrg: citrix.com

On Tue, Apr 27, 2021 at 03:40:24PM +0200, Jan Beulich wrote:
> On 27.04.2021 15:31, Roger Pau Monné wrote:
> > On Tue, Apr 27, 2021 at 02:30:35PM +0200, Jan Beulich wrote:
> >> On 27.04.2021 11:05, Roger Pau Monné wrote:
> >>> On Wed, Apr 21, 2021 at 04:09:03PM +0200, Jan Beulich wrote:
> >>>> On 20.04.2021 18:20, Roger Pau Monné wrote:
> >>>>> On Tue, Apr 20, 2021 at 05:47:49PM +0200, Jan Beulich wrote:
> >>>>>> On 20.04.2021 17:29, Roger Pau Monné wrote:
> >>>>>>> On Thu, Apr 01, 2021 at 10:33:47AM +0200, Jan Beulich wrote:
> >>>>>>>> @@ -399,7 +399,11 @@ include/xen/compile.h: include/xen/compi
> >>>>>>>>  	@sed -rf tools/process-banner.sed < .banner >> $@.new
> >>>>>>>>  	@mv -f $@.new $@
> >>>>>>>>  
> >>>>>>>> -include/asm-$(TARGET_ARCH)/asm-offsets.h: arch/$(TARGET_ARCH)/asm-offsets.s
> >>>>>>>> +asm-offsets.s: arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.c
> >>>>>>>> +	$(CC) $(filter-out -Wa$(comma)% -flto,$(c_flags)) -S -g0 -o $@.new -MQ $@ $<
> >>>>>>>> +	$(call move-if-changed,$@.new,$@)
> >>>>>>>
> >>>>>>> Won't it be more natural to keep the .s file in arch/$(TARGET_ARCH)?
> >>>>>>
> >>>>>> Yes and no: Yes as far as the actual file location is concerned.
> >>>>>> No when considering where it gets generated: I generally consider
> >>>>>> it risky to generate files outside of the directory where make
> >>>>>> currently runs. There may be good reasons for certain exceptions,
> >>>>>> but personally I don't see this case as good enough a reason.
> >>>>>>
> >>>>>> Somewhat related - if doing as you suggest, which Makefile's
> >>>>>> clean: rule should clean up that file in your opinion?
> >>>>>
> >>>>> The clean rule should be in the makefile where it's generated IMO,
> >>>>> same as asm-offsets.h clean rule currently in xen/Makefile.
> >>>>>
> >>>>>> Nevertheless, if there's general agreement that keeping the file
> >>>>>> there is better, I'd make the change and simply ignore my unhappy
> >>>>>> feelings about it.
> >>>>>
> >>>>> I don't have a strong opinion, it just feels weird to have this IMO
> >>>>> stray asm-offsets.s outside of it's arch directory, taking into
> >>>>> account that we have asm-offsets.h generated from xen/Makefile into an
> >>>>> arch specific directory already as a precedent in that makefile.
> >>>>
> >>>> Well, asm-offsets.h generation doesn't involve the compiler, hence
> >>>> no .*.d files get generated and want including later. For
> >>>> asm-offsets.s to have dependencies properly honored, if we
> >>>> generated it in xen/arch/<arch>, .asm-offsets.d would also end up
> >>>> there, and hence including of it would need separately taking care
> >>>> of.
> >>>
> >>> I'm not sure I understand what do you mean with inclusion need taking
> >>> care of separately. Isn't it expected for .d file to reside in the
> >>> same directory as the output,
> >>
> >> Yes, ...
> >>
> >>> and hence picked up automatically?
> >>
> >> ... and hence they _wouldn't_ be picked up automatically while
> >> building in xen/ if the .s file got created in xen/arch/<arch>/.
> > 
> > Hm, so that would prevent re-building the target when the dependencies
> > changed as the .d file being in the arch directory would attempt the
> > rebuild from there instead of the top level xen/?
> 
> No, in the arch directory nothing should happen at all, as there's
> no rule to rebuild asm-offsets.s. And if we built it in the subarch
> directory (where asm-offsets.c lives), the wrong rule would kick in
> (the general one compiling C to assembly).
> 
> > I guess the alternative would be to force a rebuild of the target
> > every time, in order to not depend on the .d logic?
> 
> Simply rebuilding always is not going to be good: There should be
> no re-building at all when actually just installing Xen. Hence
> while move-if-changed would be able to suppress the bulk of the
> fallout, this would still be too much rebuilding for my taste in
> that specific case.
> 
> The option I've been hinting at was to explicitly include the .d
> files from the arch dir. But I don't really like this either ...

It's hard to tell whether I would prefer that option without seeing
it. In any case, the change is an improvement overall as the logic
gets shared between architectures, so I don't plan to hold it just
because of the placement nit:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

