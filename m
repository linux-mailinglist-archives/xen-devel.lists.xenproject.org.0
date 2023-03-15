Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A266BBEA5
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 22:13:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510227.787540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcYQo-0008Go-0c; Wed, 15 Mar 2023 21:13:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510227.787540; Wed, 15 Mar 2023 21:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcYQn-0008Er-U0; Wed, 15 Mar 2023 21:13:09 +0000
Received: by outflank-mailman (input) for mailman id 510227;
 Wed, 15 Mar 2023 21:13:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DN/u=7H=citrix.com=prvs=431ad58dd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pcYQm-0008El-T1
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 21:13:09 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d10d864-c376-11ed-87f5-c1b5be75604c;
 Wed, 15 Mar 2023 22:13:06 +0100 (CET)
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Mar 2023 17:13:01 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5850.namprd03.prod.outlook.com (2603:10b6:806:118::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 21:12:59 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.029; Wed, 15 Mar 2023
 21:12:59 +0000
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
X-Inumbo-ID: 2d10d864-c376-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678914786;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HJ2+jdfdbk0dsdjbDZzDJYagxTg2K7zg8bfeBXb6NFk=;
  b=IP78+XU+cvjW7SvJBgIk65nq97S2Tb2ceevnd7WbzN/ADJTwwNpk5y/o
   DIKElh9CrZjQzplFJt0KbRk7SYQa2yGSLR9AkRtS77j8x49XJ8Wr65wj0
   46Y2p4IcXwcFTNpBm5uCYIAKa2w3OvU+FfZS4Z9xL7qKc7lIVX7wTua8f
   k=;
X-IronPort-RemoteIP: 104.47.55.104
X-IronPort-MID: 101431731
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:aqhSjq7i5Qb91/buAmoNdQxRtIzGchMFZxGqfqrLsTDasY5as4F+v
 jQcW2yPbKuDMzbxfo9+Pd++oRgCvsXSxt9nSQdpqSpjHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasS4QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m8
 vkSczlWZy65wM2ux7ahFONHvt0JM5y+VG8fkikIITDxK98DGMiGZpqQoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooiOSF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtKTeHjr6Ex2TV/wERULgYsT1+npcWmm2+4ft52M
 kMf8Xoh+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6eAmUHVT9ALt87rsg9RT8t/
 lCMltLtQzdotdW9UmmB/72ZqTezPyk9LmIYYyIACwwf7LHLr4A6iBbSRd9LCq+ricb0Hzq2y
 DePxAA0gL8ZnMMQ16G2+FnBqz2pr5nNCAUy423/V2ak9R9wZZTjaZah71Pa9t5fII3fRV6E1
 FAPnM6Y6+ICBI+MjwSCRewMGPei4PPtGC3RhxtjEocs8xyp+mW/ZsZA7TdmPkBrP80YPzjzb
 yfuVRh54ZZSOD6vcvVxaofoU8Ayl/G4SZLiS+zeacdIbt5pbgib8SpyZEmWmWfwjEwrlqJ5M
 pCeGSqxMUsn5W1c5GLeb48gPXUDnEjSGUu7qUjH8ima
IronPort-HdrOrdr: A9a23:fEIqKq2ak8zuBC5qUPtXqgqjBJ8kLtp133Aq2lEZdPU1SL3kqy
 nKpp4mPHDP+VIssR0b6LO90ey7MBXhHP1OkPMs1MmZLW7bUQKTRekIjbcKgQeQYhEWkNQtrZ
 uIG5IeNDSaNykesS+V2njbLz9t+qj9zElqv4vjJrVWID2Cp5sO0+6xMGimLnE=
X-IronPort-AV: E=Sophos;i="5.98,262,1673931600"; 
   d="scan'208";a="101431731"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ES5jtogeCKgB19iY0naByfyBfpvHQjJ33zwp/OBMkqIT8Rmxd98hvP2Xb+LBQ9g6OzJSGvRIMpasyZfBjFXdWBIT//mbdOB+3jk/UUfRi5D6vm4C6dCvlJwrFUacX6uW5GjWJRPJCHAZxbhlAht3bPOPOrvH8OdbOarufUfiXbVXOkvl3MhKzqcPrItGj0IXhJ3jNtdQc+NJrgRDLnJ4I55sjFvPfmJb8aCaTF8Pb2+dJwa0Zad6EiIJ5oBqXq0/zHWWKxm1khu4ze9AF9wajVttYzQwzOaZzklMOIKXMOd7RZGbvXd2oEOqwiVy6EpCV1UtGPZ2mdojGXxcxMRTQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJ2+jdfdbk0dsdjbDZzDJYagxTg2K7zg8bfeBXb6NFk=;
 b=HrdN6rNAdWvXHAxPnRNDkyvt4+kokJkk5Jhy0pxxGNJZlrbwmHUPaoZslczWUgiRprq90UnmKcGhSgPHLz9i2szFILe/1SquERWF6s7barG1vHvgvvawdUFPbt8132d+naWQ298OBWOssarAu15+53QiUz/U/JlhpgFrrqF+JRAAuKSoeCbIXqGwuoAS2Nn+X8AxKQKQA8tIEIV4TPrphFEBcGchvOLo9vUjv1RgbTmnB2aVGsGa30AudeFgoSfTB7b55iS6sjxyRt2Si2GHRXnV9vNPtEgWejFXXipmUBD5YfDDtcVYetHURxHUbUFRDWgj9FRi1RQmt/gzPoyhlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJ2+jdfdbk0dsdjbDZzDJYagxTg2K7zg8bfeBXb6NFk=;
 b=ttdeavhLl/HWrwmI1h2TxDrldceuw59xmczpVpo/KpmdnKcb/QXibHH4EnPcVO834iaheI6CjZOvOCltjS6zoAnwroUtGnt8mCmGpM5leapbnVJRwDu4RunWKgeaxoCjlqrsfWzukoCje4Xol4M8DxtY6sfmNVijLTn6dKIiOUw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ac357f76-653f-9dbd-dc54-6e31db28de9b@citrix.com>
Date: Wed, 15 Mar 2023 21:12:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1] xen/riscv: make calculation of stack address
 PC-relative
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <ad2249c1b5be01f99ef9c294a3264da0c9715bab.1678809641.git.oleksii.kurochko@gmail.com>
 <9c5ec3f3-c909-8f45-4460-1b29ce333d10@citrix.com>
 <e7c42fc7561b88b1a18463b9b28d0b09cd6553c4.camel@gmail.com>
 <966c19e3-d255-db73-9bb4-7abe0a745396@suse.com>
In-Reply-To: <966c19e3-d255-db73-9bb4-7abe0a745396@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0279.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA2PR03MB5850:EE_
X-MS-Office365-Filtering-Correlation-Id: 952f1250-a947-4f75-28ae-08db259a0d90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Wt+H/aUXSuVnpoYTDUhnOBqNuGAHuCh1Ii7k7zM9gHpkIyc1ymAHP6gCpIRojpVYFXJS+o5UVFosDaz4+RksqPnA3XP1b0PJ49/f7hYTIjKqBy0MfZqGipZOYggDT1sdbEuNbTTD2g1GzYja7BbWEBmE0Yp3pC69SNb4sIBceodx9nb1Fpcl493qMaDITzKEWjVRz9hJSDLAyniYZM3aBWlR5Y8BAIej7uB85zy7a6tfeBHO4NXNuOt3SbH5anQalsFn9Ee9yX0eLLqfqVheS7B/WQ4J9PxP6CLa3Dn1kU5x4EKo4biGg2Ze0tjiLJunsGNg3+YNvqyVfUBzHUuCNbQyQtsRBcaLK7qUcbG5UeP8ZdC2nYhJ3DwG6w+dxezaDIRjE7DVHER2LEfq8nkfXjG4R1k10fR9TXO59TU9T03x1L2H9Y09cyMJOWE+luWvf8fWOi9TILyq3iV5oGJW+puTLuKo61lY+zQH/bAD3YdGQwAQGKXUP9IGZXXeumfG/lgLTL+w/wZrlJzcJheKkivLa72uu3V1wueI0ottm2sljZh4dQfZRLH9TBLQajCNMEvVoKV4tVWZpLsX6GgyBD2fjniadGBVSmiVaSvGFJ5RrMYDNzfTiU9hAoYTV/MlNLfpBsEMPYkNJxhjmPrQLetA/o/bDqbsATV+NWO2L5UZLVn1TTBox70aVrTIrws0uS6Wv+Ut3Tw/rCG9n+cBgdZY6z7K7QVb4NNKtq2RyD0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(451199018)(6666004)(36756003)(26005)(6506007)(6512007)(6486002)(8936002)(82960400001)(38100700002)(66556008)(66946007)(66476007)(110136005)(4326008)(478600001)(8676002)(316002)(54906003)(186003)(2616005)(5660300002)(31696002)(86362001)(41300700001)(31686004)(53546011)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHljd1BQUG5hUUdZMkZ4TWZuSTJHZ0ZBUllzd2g1emJmWS9uTzVwQ3d6Wm93?=
 =?utf-8?B?MHZoSGJaRDdwa05KZGJHTEtRdUVqNUQvVWZLV2VpeXBlWlJaZG8zVVFJaWE5?=
 =?utf-8?B?NVVISm8rdmE5RkJYQVhlM1R6KzkrdTErVkhJKytGSFg0N2lRTitDUDBLZXRG?=
 =?utf-8?B?eGltOExwZnRIUldjZUREandvcjh1QklsYU1MQWpwWVFMQ2tQMmhBdmx3cGha?=
 =?utf-8?B?WlovbTZmbFQ4RVlVZXNmTmIwOWZNMFd2ZThXZ1JHb21qa1I5UXNmZk4wUVor?=
 =?utf-8?B?SW04UWJsWHg0L2xZYlpjUm1UcEZabk52NG5MK25EWEdlWWVPOUxKUE94NmJs?=
 =?utf-8?B?WlF2S1VLeVlIaU9VdFg4bnpQRTVnZ2F5NHZpRDhNTTVtZ3AyU0UyYXJlMW9I?=
 =?utf-8?B?K3hlRStVRUV1WUFuKzM4WTczcEo5b29HMUNab3VZaFdicWkwSUoyS045M1hh?=
 =?utf-8?B?WWNNTlN6WHZ3dkRpZ0xGelJLbEZhV3poNExCdmhoUjRUenZzY1FxaThPVkZq?=
 =?utf-8?B?ODgyZEx1NklIL1RyTTJYaFAzRFJyTXBkbDNYRXZVK1ZSVENGODJmbkRZbE1Z?=
 =?utf-8?B?b1FyN0xHdkFLdUYvMjczU3FWTUQ1MmFMSzlrZFNPZzFPZTVzVjdXK2xKWjd1?=
 =?utf-8?B?UEUwQVY3NXdhRDNaRzE0dVdyZ3FOYTFHRlZnNU9KZkNZbnhHSG1YbXV5QzN5?=
 =?utf-8?B?VVhzTllMUFZEZW5sbzRoUGJJek12dGFqUlJ0dXRvTXFNeDdNTUthWmpqSzNV?=
 =?utf-8?B?WVk1V2JQZHZ3aDl4Wm9hbmJzdi9PSGdtVlhXVTlpOXdPcEx1aklsWEhhYjQ0?=
 =?utf-8?B?NkZzMjBwRWdvcXZjakRpWUQ4cDVlSk5iZ1FET0VrajhvQmRYQ1N2MXZ4cGVm?=
 =?utf-8?B?UXg4c21CRHJodXVLUWdoR3BHYndEeUt5N3FYSDZ4Y1RUcGxhZ2VDZnFpQ2dz?=
 =?utf-8?B?VTEwYTlQM3A1MThFOGZWTTNnaTdCSHJmU291enBMNnBhV2xWRmVscWJlRk5j?=
 =?utf-8?B?SVk5cVpZUGdkRXVpaExPS2dQalJoeTR0SlFHUGFhbmlMZFkyc0pvMURveUIw?=
 =?utf-8?B?ckJFS05LMTkvNU5TQjYyL29lTU1YdEdXd3hOL1U3bkFpcHF3MXB4bmVDaEk3?=
 =?utf-8?B?d2w5NWpRRWFyajdaZkhuem9XWlB0WlBWRnRqcDBuaEpRRTdxcHcybHk3TEo5?=
 =?utf-8?B?d2tTdEkzUE11ZlU3QVFDcmF6WWtGTXFTcC8rTWcyUnhQZFVZUDZtVEVnb1U3?=
 =?utf-8?B?S0JRQjRMSlFXNVBXaWlDQmtLb0FNTTJGYjZZekpZRi8yVytQU1pDdlgvMmpj?=
 =?utf-8?B?ejdzeVg4NytrMUEvQURVeFpPZUpTUWdFS01yeWQvNWlocDhIQmlSVGF3aFhj?=
 =?utf-8?B?eTF6aEpLNHJ6TFd1OTlyYUI3ZXR1ZmJQSTBpc2lYeEtDbHpBaS9iaUJOMWpj?=
 =?utf-8?B?VG1ZbUo4c2YwQlRCRXhUTVhhdWdnSFQzWXNrU1ZvekJZeGJNNlc2Y3UwT0pE?=
 =?utf-8?B?RmRRK2lORjdrY1d4S0d4Tm1ZWTEwVSsvZVBndGpINy8vU0ZncENJOHY4K3NC?=
 =?utf-8?B?TDhFN0hlR09ucHEyenQzdVhqaU95b1Z5QnhNRVZIRExBb1NaTG55UFJjQTlj?=
 =?utf-8?B?Q29jUlZDTWJWZnVuUUFjbGdMS1FDcXpXeXIvRlF3WWw2bEFCYm43c3dUclhP?=
 =?utf-8?B?NFpRYzlOU1hKUTY4dlczdUZjc0RIMUJqSUZjR1RZaGFxRHZzZkpqcDlhM1Rq?=
 =?utf-8?B?azJ2NVpWQkFKV1JFZFpkME5ZMkRROTloUmtZcUpxTlFoRHBiRm5IMmpQRTJv?=
 =?utf-8?B?dEJ2ZCs5cUZaaVRnVnMyY1ErQkY4SmR1RSt2WnZxNVdYdko3aEdSK2x6SVlu?=
 =?utf-8?B?Nkxmald4anI3OENNZWMvdUJiY3BBb0FvQStYbVUvOEdpbzFkY0pKT3h3VE42?=
 =?utf-8?B?c1RSbTFzN3B5OVl0MFQ2YXV4UTZqbEpqUVc4TkE2UWJqTkRTcXZRQXY4NDN2?=
 =?utf-8?B?V2QveUhHbXR2TVVuTklwcS9qQlgrNkJjQXRINHZENU0xZjlqS2k3aHp0QkVN?=
 =?utf-8?B?YzE2NzEvTm5XaFhGcFJ4Z283b3crSWg0Q3lEeUExOERtSys4eHBRUElJTEpN?=
 =?utf-8?B?c29QTDg3Ylo2V25YVUx6SkNuNUZnMnZ6Z2ZGZVNYM1lIYXQ3dG1aYmZndGQ3?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Kob1LiTnMhJ97NWU618Y+LjibY0sxaNMVWhDXnXci384vtNzFSLWBVXOcMOBuMGasvIeoy+CrWMrjj/T85J4Qq41K/vnkKFBffaEQwXVEqz9nb9G69gTRDjPBoSBvjr1XNk+le+XDeo5rEg53zy99uhAMpD3rTlNpCVjCIu9OUb/uYLoI9g24H8DjO3trtcq5eGFmHSgcgA9OPbMJ/FT/Y/OFLbvd/vphlnwDOZhHVetXB+T1Z6qJmMYjBBXdzEd3rllNAgvq9IaLyfFMH3jeZUDUrI/DQmpSvc7fb+xwvl9w8rQhaCq+SbiNFqRJz/xc5rXBF19gHKmbGd12L/+1Eyz6Wj4jIrQeDEk8xxs5C7/eelhZS042e2IVqX6hfKkBq2k6AHF4nVbGeJ8Ps7YdlVGcwFmsG4v4kOkG4CwVomx3c1rjuGhxDOt18blvqAIyxEGy1pYRNlF+BEuQzdqXKDtwetyUTlA4ryE+vtD8kQIsxcPlR7rn9SrJlNOyJ+8V6RdbaKGE5gRsegQuFQdaU5PXL+vjGSqVyryqdbh1Xnqh5cU4J/5rvtOo1QZiyVjVPXPexymcO3ONM/v7jOxL1NI4EmbE1LnIUcfillyqwHGZ0DvOfEeiik0E1JBKqSXx0jFm2v7o66Km63TFU6CKaRtvo9+7/4YhZp4TN8T5eMnfNZIPe6ZqzL6d4oUEdZ6bBxbsFvRcsxp2+w3CL6J7Gx2ST96zZmmvfu4CZ9r3QSjCxHAaHS21A9njnW4vbsFUW+SNrpuEndkW6X2ZeGnizpLj7n3RBCV8UXuVnRvMk7DtSD3jeGXLGHXwWhyI3Z0bs5HMU2189eqd5RjRv4uQDXd+VHT6Rmgo9/7iAGr/izwsOaKhRyk3t+keObBG081T7tfjntxvdtL/W5XXTQ967OqVVyGMCk8ujRwrt4PBTw=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 952f1250-a947-4f75-28ae-08db259a0d90
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 21:12:58.9862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mbRqSxD/noFpRlRrbV62uVZGHOVNgZMxIqjOE3ufIWDcFj51wMdfap1mRpgjs6N+ho4YkGABQzdYliwl+sLEzgUFvcaZy+tivkME8usqcVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5850

On 15/03/2023 7:59 am, Jan Beulich wrote:
> On 14.03.2023 21:16, Oleksii wrote:
>> I checked in Linux binary how 'la' instruction is transformed, and it
>> looks like it is translated as I expect to auipc/addi pair:
>> ffffffe000001066: 00027517 auipc a0,0x27
>> ffffffe00000106a: f9a50513 addi a0,a0,-102 # ffffffe000028000
>> <early_pg_dir>
>>
>> I checked compiler flags between Xen and Linux. The difference is in-
>> fno-PIE (Linux also adds -mabi and -march to AFLAGS):
>>
>> 1. Linux build command of head.S: riscv64-linux-gnu-gcc -Wp,-
>> MD,arch/riscv/kernel/.head.o.d -nostdinc -isystem /usr/lib/gcc-
>> cross/riscv64-linux-gnu/9/include -I./arch/riscv/include -
>> I./arch/riscv/include/generated -I./include -I./arch/riscv/include/uapi
>> -I./arch/riscv/include/generated/uapi -I./include/uapi -
>> I./include/generated/uapi -include ./include/linux/kconfig.h -
>> D__KERNEL__ -D__ASSEMBLY__ -fno-PIE -mabi=lp64 -march=rv64imafdc -c -o
>> arch/riscv/kernel/head.o arch/riscv/kernel/head.S
>>
>> 2. Xen build command of head.S:riscv64-linux-gnu-gcc -MMD -MP -MF
>> arch/riscv/riscv64/.head.o.d -D__ASSEMBLY__ -Wa,--noexecstack -
>> DBUILD_ID -fno-strict-aliasing -Wall -Wstrict-prototypes -Wdeclaration-
>> after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs
>> -O1 -fno-omit-frame-pointer -nostdinc -fno-builtin -fno-common -Werror
>> -Wredundant-decls -Wno-pointer-arith -Wvla -pipe -D__XEN__ -include
>> ./include/xen/config.h -Wa,--strip-local-absolute -g -mabi=lp64 -
>> I./include -I./arch/riscv/include -march=rv64gc -mstrict-align -
>> mcmodel=medany - -c arch/riscv/riscv64/head.S -o
>> arch/riscv/riscv64/head.o
> Looking into why you see different code generated than I: Nothing in
> here directs gcc to pass -fpic to gas; in upstream gcc (consistent
> from gcc7 through gcc12, which are the versions I've checked; the
> actual range may be wider) there is
>
> #define ASM_SPEC "\
> %(subtarget_asm_debugging_spec) \
> %{" FPIE_OR_FPIC_SPEC ":-fpic} \
> ...
>
> Can you check whether your gcc passes -fpic to gas even when there's
> no -fPIC / -fPIE (or alike) on the gcc command line? Or whether your
> gas (unlike upstream's) defaults to PIC mode? (For .S files ASM_SPEC
> is all that counts. For .c files gcc is redundantly passing -fpic
> along with also emitting ".option pic" or, in the opposite case, it
> is omitting -fpic along with emitting ".option nopic".)
>
> You gcc may have been configured with --enable-default-pie, while I
> know mine hasn't been (simply because that's the default).

From the thread, the difference is clearly around the pie option, but I
have to admit that I'm confused.

With GCC 10 from Debian repos and current staging (modulo the build
fix), we end up with:

0000000080200000 <_start>:
    80200000:   10401073                csrw    sie,zero
    80200004:   00002117                auipc   sp,0x2
    80200008:   00413103                ld      sp,4(sp) # 80202008
<_GLOBAL_OFFSET_TABLE_+0x8>
    8020000c:   6285                    lui     t0,0x1
    8020000e:   9116                    add     sp,sp,t0
    80200010:   7f10206f                j       80203000 <start_xen>

In this case, the auipc/ld pair makes a PC-relative reference into the
GOT, but the pointer spilled into the GOT is the link time address of
cpu0_boot_stack.

For the executable as a whole, we've got:

[ 6] .got              PROGBITS        0000000080202000 003000 000010
08  WA  0   0  8
[ 7] .got.plt          PROGBITS        0000000080202010 003010 000010
08  WA  0   0  8

i.e. both nonzero in size, so presumably with expectations of something
else to fix up the references.

I suspect we want to extend the x86 section asserts into the other
architectures too, alongside figuring out how exactly to disable code
generation of this form.

~Andrew

