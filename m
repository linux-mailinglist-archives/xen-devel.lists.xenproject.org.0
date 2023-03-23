Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC9D6C67E2
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 13:15:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513823.795424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfJpw-0003yj-3r; Thu, 23 Mar 2023 12:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513823.795424; Thu, 23 Mar 2023 12:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfJpv-0003wV-VF; Thu, 23 Mar 2023 12:14:31 +0000
Received: by outflank-mailman (input) for mailman id 513823;
 Thu, 23 Mar 2023 12:14:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1NO=7P=citrix.com=prvs=439d27799=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfJpu-0003vz-76
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 12:14:30 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4030f7f5-c974-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 13:14:26 +0100 (CET)
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Mar 2023 08:14:13 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5098.namprd03.prod.outlook.com (2603:10b6:5:1e8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Thu, 23 Mar
 2023 12:14:10 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 12:14:10 +0000
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
X-Inumbo-ID: 4030f7f5-c974-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679573666;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VPbaa4dmeUqFKzkRcDCPMnHVQ1RKsXJBdk3DIVCH974=;
  b=PDJTDpAYUxKDJXipilkUU0EtZ03qiWrZCvR7R576fkS/fF+h0TwSz9le
   flK2O8W5saxq0vhy/UtM7EgPFa6uqD9ONdLGWHBoiiceWXJ60Wk/6lAAc
   15tdVozGL1ML/d/JYUAmo/URLd0atalkjUfYHYv6dE8+k5OuXUqYosu/e
   E=;
X-IronPort-RemoteIP: 104.47.55.108
X-IronPort-MID: 102017987
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:XqgmsaLWzNB6FjpfFE+R4pQlxSXFcZb7ZxGr2PjKsXjdYENS0mdWz
 GVMCjqHOvrYamqjedp2bdu38kwCuMeBmt83TFBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QZlPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5HIW8Sr
 qBGCwksZyK7jM2EyY21Uvtz05FLwMnDZOvzu1lG5BSAVbMDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGLnGSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHuhANtNRe3nnhJsqGHL2GkOLRxGb0Wqmd6CsEukReJFC
 2VBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9Vna15rqS6zSoNkA9MW4HTT8JS00C+daLnW0ophfGT9ImFbHviNTwQGn02
 2rT9Hh4gKgPh8kW0an95UrAnz+nupnOSEgy+xnTWWWmqAh+YeZJerCV1LQS1t4YRK7xc7VLl
 CJf8yRCxIji1a2wqRE=
IronPort-HdrOrdr: A9a23:ir+bdaPUgdX5fsBcT9z255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBYpTnyAtjmfZq6z+8J3WBxB8bZYOCCggeVxe5ZnOjfKlHbakjDH6tmpN
 xdmstFeaPN5DpB7foSiTPQe7hA/DDEytHRuQ639QYTcegAUdAF0+4WMHf8LqQ7fnglOXJvf6
 Dsmvav6gDQMUj+Ka+Adws4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/PwmE0gwYWzZvx65n1W
 TeiQT26oiqrvn+k3bnpiPuxqUTvOGk5spIBcSKhMRQAjLwijywbIAkd6yesCszqOSP7k9vtN
 XXuR8vM+l69nuUVGCophnG3RXmzV8VmjLf4G7dpUGmjd3yRTo8BcYErYVFciHB405lmN1nyq
 pE00+QqpISVHr77W7AzumNcysvulu/oHIkn+JWp3tDUbEGYLsUiYAE5ktaHLoJASq/woE6F+
 tFCt3a+Z9tABinRkGcmlMq7M2nX3w1EBvDak8euvaN2zwTp3x9x1tw/r1pol4wsLYGD7VU7e
 XNNapl0JtUSNUNUK57DOAdBeOqF23kW3v3QSKvCGWiMJtCF2PGqpbx7rlwzvqtYoY0wJw7n4
 mEeE9EtFQ1Z1nlBaS1rdx2Gyj2MSeAtAnWu4RjD8ATgMy5eFOrC1zMdLkWqbrinx1FaferHM
 paO/ptcovexCXVaMB0NjbFKupvwEklIbwoU+kAKiKzS+LwW/vXX7/gAb/uDYuoNwoYcUXCJV
 ZGdATPBax7nzWWsznD8VfsZ08=
X-IronPort-AV: E=Sophos;i="5.98,283,1673931600"; 
   d="scan'208";a="102017987"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JrK5xAEOcx6RQDRvMj4IyUUYV6CwWu8NL/zHT8OcmyqLG+BW+2Znen7vp9FaU/E7OlGB8mhUCn8SFFkXvbjw/U997nSPIt0g9fq5jSy8FQ3lioGwVL1xA8aTHCzKJP+D9Dk3leh8jS+UUYOz7pFoSiNX4XQHiYfu+N18tohiFutOA/v9J4wNdKyps7m46LWZHgNqsXz8kj5ImDRV94n9NRXvAmDbB9NPw+18VTv7h6NSmUR3hPy2u5jrU02/WqkkVYnxdqnSzkqVpthCt9VI66myK6gH6vT2h+bU0h10Y057+BXjOwBZBlQdCRxq7aNhLtFINoX5ayEmcKDwD5EvvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPQJfK9R9/y9NInsPWhPMorXGcdLAO5dHgfqeCBErLc=;
 b=BlTj/tzcRONl6DP0zZ/NNjtBuaLGBxfxFEwoc2wWunmUoZvFGArzle47DFqqQUrsWKMLW/NsTuubcjBCUMl9hKACZK6b6heXY1vccUSv+R5KeHk89Scl51mV1BIrqnE/3Pikc6FnSqA1NdULA6q+cKLY+FhiyRwNsLYa2DEfrboqOwNO8s0khzoNWoG0UpS70F4sGoOi4NiGwSDU9IGtxOUtwy14ztAHCMet9ZKIDeGqh0gs5vUvWZEPOjuAGfddhTEIJAGjGkSEgU6iVcKiUyb3giT8R68gNcAf9jS1PA3x5m+HJkV50OSrvGuD6N/c8fA5wjJlAacUJiLA/BLnVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPQJfK9R9/y9NInsPWhPMorXGcdLAO5dHgfqeCBErLc=;
 b=NbGa9vvMlYYKlwHMWqTe7uasvraWB0/cTD7EhjK6dzKUEaXmxOiym2RDU4qVGsTeuIkyB0C2wlr8Sn9iuJKcE7RW9EYen/HQu6ZL8xua8jPvS9WV987o84o/+fCNxyUTiaX8q4WLU08lNbAi8lGW5PaOERMlUSofVB3xe3X+k7w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <aa5629ac-be62-5838-78cf-62e7d0a53ffc@citrix.com>
Date: Thu, 23 Mar 2023 12:14:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 03/16] x86/shadow: drop redundant present bit checks from
 SHADOW_FOREACH_L<N>E() "bodys"
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Tim Deegan <tim@xen.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
 <54e7a146-6f86-95a7-7b3b-0ba5dd418949@suse.com>
In-Reply-To: <54e7a146-6f86-95a7-7b3b-0ba5dd418949@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0385.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB5098:EE_
X-MS-Office365-Filtering-Correlation-Id: 718b04cf-905c-4c66-3782-08db2b981b85
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rrqN9g5l1ibRq/bQU90vGnFRdA6kJBZuMcML+O5MfxDCEVCIYUsSiDfFvs/P6YPjQmjDwQJojodTldZlqcVkeVQU31rasTV9J8mMq+YuRuhz2/tUo1HSIkrBbHUYIIfyZbdQpQmp4XZgGvr6tRWf5IArWvSg/leBlEk5ONJTJl+U/t9OE8CBKy+ms/HotlBSMi585JfXmejgP/5s8qHEAkdZw0Jhgoxiu5ZP73ZHDWYi8QRYTGqMdvLYwyaHAFT0KRJhxUXfsqI7djY+90+aDm8CkbjmeHJtOSc3bnwkv7mQC9hhxaSxblct/sDLAkUSpudg0/cP/mkfQilTPAjSsOmNcc1oNeG1R7HnC2YGbraNPo0I+bjUNyNyfPic05Tk9v6rs4HoRdBv5DkHpHzuY+F3YDmgdNtvUWmOm6vKfNqzRO0LDeOKZBzFlvKxU+ujaarLWBcHBlLq5Vq1H8h3Up1pFy7WiBY+W2vuGug4Z0a0K+HndBKm+Xj8nVKSH0DD7yqQu8uC0oDVtMcEr3M8SOCjqUUMZWYh1auezZQjumztAoKjxWbf0O+v3bhTfk4W/Suny0Ax1Oq6lV+RlwzNrIGctop/PASwcFLM681wq/dJFBSOWlvGTNhBka3CceCNHCGv+jxMC3BEXMBXRPJC1zOEK+Lwd4Z0FNejgW77pYobKFwC9YFWQBfeQOFPexkN+cjM1wREoQDldfiWvN6Ux4+rLnadurPCKYEJQvmpQxAnJwtyPqggfmj7vOq7mAV3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(376002)(136003)(346002)(396003)(451199018)(4326008)(66556008)(66476007)(8676002)(66946007)(110136005)(316002)(54906003)(5660300002)(82960400001)(41300700001)(8936002)(53546011)(26005)(6512007)(6506007)(6666004)(2616005)(186003)(478600001)(6486002)(86362001)(31696002)(36756003)(38100700002)(2906002)(31686004)(45980500001)(43740500002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uk9FL2N5VVJiM05majdrQ2hSUms3Y0NPcEtFclU3NkV6bEhuTm5uRTBqWHVT?=
 =?utf-8?B?NGlNNWdyK050MEx2TGRjcVEyM3h0SWhKMGE0UlJ5QjErTGEwRkNBUHNYT0Zy?=
 =?utf-8?B?ZWJJUE1wTXRWMEZqeHg5T0RNeW4xd3dGdjM5MzZ6UzJ5SFNEalpVeXlQWDQ3?=
 =?utf-8?B?ODJEcXJFUzRBVitDdHlwQ25Vdnc0bkc5T0FCNXZJcUt4OW5EWDdoMUY3T2RK?=
 =?utf-8?B?eVMyYmNqTVJDd3BobW5WL3VhZThCNWk3QzV0UXVBUEtkTmd1QVQrWXArWWxI?=
 =?utf-8?B?amp2bTUvUG9TaUpUZENrR0xQQ3FFdTduZjVraktoWVNianBlY0w2eTFvOG1E?=
 =?utf-8?B?Qk9Fc28zbVdXUU14azRBQVFyNXV3K21mMnNGUlJnd01mSmZ3Z0ozTERUNnM0?=
 =?utf-8?B?cGZvNTVKZXF3bjJlV2NhNDFBQjZmZ0pVSU11M3JvcFNjYURDeHhVVlVtWkhE?=
 =?utf-8?B?UjB4emlWdFhnWUJ5YmJyNDZCNlNad2lWUFFqLzIyS0VBYnRTdm1CNHN6Qm1u?=
 =?utf-8?B?M05OV1VleFFTR2d6SUpsNWttZFdYUWM1QjNxYkhwTE1rMXhlZFFUNWlOalZP?=
 =?utf-8?B?OHpLSWx0dEVhalM0NkdGWHpZUXVYK0hWUzRmajAreDR5Y1V3UVV0Z2xKT1lG?=
 =?utf-8?B?UkphYWRhS0NQNncrYmxkYlNaOGRCd0JwOUFZWnpJT0EwMG04NW92SU9QWUxQ?=
 =?utf-8?B?STIzMnUzZ2xDMlJKQyt5N3d3cmY3U0JyVHFHeEZwVGkrT2oxeGZVaS9PNWhz?=
 =?utf-8?B?NDNEZ0pmY2V0MUJGK28zUFdFeFdvOFZTQm40cTFIaVo3RDlQTGtsaE82NDRo?=
 =?utf-8?B?bU84R3lGVHVsSmVSZ0oxYzZ4YzNTVm52YTBoTjdKWnR3MnZjY09oZVRZcFRm?=
 =?utf-8?B?aFhnejBBSE1iWjAxK3ZjcCtaV2JKTElPNUJqV25xMlQ4Y2JINHlSenFwd1cr?=
 =?utf-8?B?cTZWa1RJT2xhbEQ1Ri9nMlFjTUhoYU43c1JaRHBIbW5xVGVyWkZkZUxWaXQy?=
 =?utf-8?B?czBmL01wbThtVUJEbHFtVU9FT0JoUG5xbllnelhUMUhBNFBGbUJ5aXNnYjRM?=
 =?utf-8?B?VjNOOE53YkFESzVEZVpKUEp5TUJldHFIUnUySEI5ek81OG5tZVBnRFYwaWpW?=
 =?utf-8?B?RTFuV29Xdnc1ZW5oR3FIQ1NoWENla2tSL2tLeU9CeWhVZjFNbi83Q2dQcUZr?=
 =?utf-8?B?cTNOWW5oNnpTd3NBNG03U1hqajJpWkN1SUNYUzVGN2g3Q1JuME54dVQwbVgw?=
 =?utf-8?B?ekRjZmZHRjJzaXQ4RzNRUCtMWVVZZk1YdThCM2VJNUEwbVkvdkZYbVhzTUhy?=
 =?utf-8?B?WjVGMUZ3MEJuUmtnRGFHNHpOUU5lRVJ4RkJsQVdzZVZveS9GbkpvQVVTN3dy?=
 =?utf-8?B?TlZqSzZCVDFzdVdIbzNHaTgzUmlkbXhvNHpPa0tRcUY0MEVubW5MdWtVcWc2?=
 =?utf-8?B?MkZ0NVVHMWRTZEZ1bU1LMkdaU0RGZmxQVzgxT0oyMThrSlZMYVVyUmVBRmo4?=
 =?utf-8?B?cm9USFVYcU1SOE5nS1VVdVJIQW1VcmRaK0s0Vkp5dnM5ek1FVFB1clc0SzEr?=
 =?utf-8?B?SXJXLzBybHFtYkVCeUdwY3hLV20wcWVnVlVQWDlPMWx4cituTCt5YzJHZmpN?=
 =?utf-8?B?akw0WmFxT012a0dTU1JoMWVKWTh1bUxhWE9FTDFKU1hVcGxCdDV1eXJpcjdZ?=
 =?utf-8?B?bVJ6b3gzcmo4U0lsZFY3RlBkQktBQ2N3WlFqdDhBeldvT1RPdTVFd2tGWExC?=
 =?utf-8?B?NFUxaUlCOVAvY043K0lMUWZWb2hwbWJqb3RQVklETFFQOUNmTDlGRFFOTTAw?=
 =?utf-8?B?MXV4WjViUUhraHZWRVFTRTZrZitEREE2VWxFSkZsZkNWWUI5eEc5V1ZMT3l5?=
 =?utf-8?B?QU5pOXdGMU9EalNEbDBHUE1LYk1wMzNYSWRNNnk3akNBMENJaG9yOFhsNmJn?=
 =?utf-8?B?NWNPelVEMFZUSGlnandIb1VZWWY5Ynd2ZzhXS1laM2NQSVUrd1BKeXF1Ulhj?=
 =?utf-8?B?cFNiaFBVSEFQSGRMaXE1S0JzYlBTSmRNajBKWUlWVHVVS0pVbEhpTU55Qk1a?=
 =?utf-8?B?Q1grdjBXQy9FUi9sSDZJZlhKTm9YRHBBeS9zY1NuT0F6Szc0OG53SExRUmNG?=
 =?utf-8?B?VUpuV05QN3BuSHloUmhsaytRYlcwWlhXWE1GRnJhVVVhQkhkRmVOWG9Kc1hC?=
 =?utf-8?B?QVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	p0wDc2awCP0lhxt1x+okAZTmhXoUbfGEzhD5kgQnSJV8qt/ifBanZdytSN2C3Qo0fFyT9QXDcKLaG5fhTEs6UuH/3mpj6Jq4OBeo4vOH8ptnURCtU1HghVDAH2ox/7431zluO7v7SWewAZgJq8rGXNrMbOwWrNFDvO1XNxwoCdp0cQ1y5QopZ/u16I3U/K1eRaWYlb29Eeu4dGlcPZT40DavIa2NxlkGtW/dvQa9pGWVPH56Un0ZzZi3NxMnu2+O3YOhAaD/xYo2x3Xy4c3bYUTMuJEYp1LI42BVhqrDu2LxEvPD31Tm3bmgiH13XGk7aJX9GckXsj/iD23bezk7jI62CvktDSnQ2bhoHVJN45Mj3qkZwhzF/vNnC9FEBO7Mt9iygbHNCrxE/q5hUFbdwWX0g2/IY94CjJX56Ade1Uyd9b5PEBcWM0Yl7noMzQ+oxPNtx3hcN1FRDVfW1/8RrmsRXe9QT2+mxPfNmopzjjcQ5PUpD3u3lasQIZkWuHHpRgV5RIb/dRSc2abHKyzIF6YKzO9dXdKbaneqlgoKWaRlS6+LuXZk+2OwmOhu3AfDa2MFobhgv3sZ2RAoSWB6dJwz1Hva4kXEpv/DVQl5b6I/yetMxGYSNxZMVIjOrhfjsESRJa8Hgg8mCvq4j3BLH8qQwUdRI4DEXmMEgZTf3A0Lil95ExYWbuqANlU97iuDP8fSpYDwLTvhXOgPsX46AJxd+6AebQAwFWZmMNMB5OU+kSK1AGjgCXbYLCo3iOUNW3SW+lj/KIyAw5CO9L8qupsPEx9ap0EnvcHtiI1u1AEC9zOH/pgr9IaNsZoWq5G+I2onEz03ifpo/p/+trA6VQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 718b04cf-905c-4c66-3782-08db2b981b85
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 12:14:10.2451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h9UTuQ/UkLupGwplbWtFZafLIxNpfP3zy4F3anDspj8wMbqj9XNimO+H9Xp+NQrKde7UuUvcFn9fC+Q1uSKhbUA7dSJ3E2qNr7aNy/qJyaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5098

On 22/03/2023 9:31 am, Jan Beulich wrote:
> SHADOW_FOREACH_L<N>E() already invokes the "body" only when the present
> bit is set; no need to re-do the check.
>
> While there also
> - stop open-coding mfn_to_maddr() in code being touched (re-indented)
>   anyway,
> - stop open-coding mfn_eq() in code being touched or adjacent code,
> - drop local variables when they're no longer used at least twice.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

While I agree this is the current behaviour, it's another spiketrap
waiting to happen.

There needs to be a rename of these macros to something like
FOREACH_PRESENT_SL?E(...).  The SHADOW prefix is a bit verbose and can
be ineligibly encoded with the L?E acronym.

After which this patch be trivially correct, and the resulting code will
read safely in context.

>
> --- a/xen/arch/x86/mm/shadow/multi.c
> +++ b/xen/arch/x86/mm/shadow/multi.c
> @@ -3647,13 +3632,10 @@ int cf_check sh_remove_l1_shadow(struct
>  {
>      shadow_l2e_t *sl2e;
>      int done = 0;
> -    int flags;
>  
>      SHADOW_FOREACH_L2E(sl2mfn, sl2e, 0, done, d,
>      {
> -        flags = shadow_l2e_get_flags(*sl2e);
> -        if ( (flags & _PAGE_PRESENT)
> -             && (mfn_x(shadow_l2e_get_mfn(*sl2e)) == mfn_x(sl1mfn)) )
> +        if ( mfn_x(shadow_l2e_get_mfn(*sl2e)) == mfn_x(sl1mfn) )

You've done mfn_eq() conversions thus far, but the final 3 hunks of the
patch could do with a conversion too.

With that, and subject to a suitable rename of the macros ahead of this
change, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

