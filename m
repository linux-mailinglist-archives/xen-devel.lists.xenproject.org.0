Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 263956B98A0
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 16:12:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509704.785991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc6Jp-0008L3-Qp; Tue, 14 Mar 2023 15:12:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509704.785991; Tue, 14 Mar 2023 15:12:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc6Jp-0008Hp-Mk; Tue, 14 Mar 2023 15:12:05 +0000
Received: by outflank-mailman (input) for mailman id 509704;
 Tue, 14 Mar 2023 15:12:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQyL=7G=citrix.com=prvs=430d4338b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pc6Jo-0008Hj-Ae
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 15:12:04 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9203a18d-c27a-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 16:12:02 +0100 (CET)
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Mar 2023 11:11:59 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6708.namprd03.prod.outlook.com (2603:10b6:510:113::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 15:11:57 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 15:11:56 +0000
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
X-Inumbo-ID: 9203a18d-c27a-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678806722;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zHpmPTVwJFTs/I7fCEpjpwQrmKGnRT2gcVQ+o0K97bs=;
  b=alGUNC3y+xp3Cyc83HtqKl7ssCGkVk7Gquw69KSUofaYErjIS/VMDl3I
   7AdFYOevmqA6gU0PGtbkpllIsV/AnFbeMG0b/13w7sq/4edppqqYlFRmc
   mRVsGfh93JDT0F7Ie+6IxinCAKmWDsnfL43FqNBYaf5SN3alCIpsCR/Sr
   g=;
X-IronPort-RemoteIP: 104.47.56.172
X-IronPort-MID: 100706948
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:bW+O0qnuDbxOsuRqn++xvivo5gy0J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZCGmPbvyDMTH2ct1xad+x9RwEvcWGxt9rSVA9qCs1ECMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5QOGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 fASAg8yTz+Ru7ivneKad7lAouB5fMa+aevzulk4pd3YJdAPZMmaBo7tvJpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVI3iee3WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTOXnrqA73A37Kmo7FwJKFl2c//yDkmWAXO5QB
 2BX5zs2sv1nnKCsZpynN/Gim1aYtxUcSt1WJOIn7imSx6CS7wvxLmoOQyNFadcmnNQrXjFs3
 ViM9/v5CDoqvLCLRHa18raPsSj0KSUTNXUFZyIPUU0C+daLnW0ophfGT9ImG6nsiNTwQGj02
 2rT83J4gKgPh8kW0an95UrAnz+nupnOSEgy+xnTWWWmqAh+YeZJerCV1LQS1t4YRK7xc7VLl
 CZsdxS2hAzWMaywqQ==
IronPort-HdrOrdr: A9a23:W77enKsgZrJXXY8ScKIGkQfx7skCDYMji2hC6mlwRA09TyVXrb
 HLoB17726BtN91YhpPpTnuAsm9qAznhOFICOUqXItKPzOWyldAUrsSj7cKqgeIc0fDH4VmpM
 RdmsZFebjN5VMTt7eF3OHReexN/DHtmprGuQ8QpU0BcShaL5hFqyNFIkKjFEtyLTM2cKbQ1v
 Cnl7t6T/7LQwVlUix/bEN1L9Qr3Oe7867OUFo9Hhs67wvLpSqwgYSKaySw71MlSjZSxrVn2n
 TElgGR3NTej9iLjiXE0nPV7dBwkN/so+EzYvCku4wuMzDxjQTtQppnV6bqhkFNnMifrGwylc
 XKoVMbH+kb0QKrQkiF5SH13hXm0nIV52T8xUS+iX/uyPaJPg4SOo56nIdEdRmc1EY6ptF718
 twrh+ki6Y=
X-IronPort-AV: E=Sophos;i="5.98,260,1673931600"; 
   d="scan'208";a="100706948"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brfgLOFlKw3WCcKqstyG6HhXIGqqV0QVjkdi2yUH61lIF3qQCbqE00sOEe82V4uRNV9ro6d3atdoYOhmVJjmX4Pb+Xb7RQCHlYCxwoawDPG0ZNUZC57j3jlGEFE9Q6BujLltLbkJ4sciSdCzujX8IqfPWUdqD77Dvq00QC/Tl4JizrrNqJfRHWJfFZ/rlCtIhbzUhMuxtU9WBzFoCk8eTKPWiJMbN//tL6FvdL2pS/FN9PEo71WPyWTJ1ywo+THNiwvjOmP57B3A/KJzPnkaxEsoKSB1Psd7NaqtW69QuZODbLmBtqXecsV6ks5AdEXQHlNooA/Jtldr8HVD64c8Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHpmPTVwJFTs/I7fCEpjpwQrmKGnRT2gcVQ+o0K97bs=;
 b=mWySz+CDRAF6AJReZnOYB83wIEO08pEdjXC7xKYrnzi2J8he53D1TvzU0J1WkwlsZFn2ju7k9lcaPiDkF4nqalxKjt5IJzfp7EDj/5qrLHpjS5bDF9HiGMUIGRw07YGQXDGhGW3CCdaNvmDfcNjdgWhrA6jDBzhr8EKR+IZ14UkDUJuW2WROq4XhF+EOPufsmyR8aXei3kYdfyfQ8aPaFqFg0N0zef+gvOkQY8plixdULFvXxH0Mro8/BIkHSJYKTmV1F6t+LF9pGpKXTaxjfaWFT2t9n31QVOcQnXxjM/ospvKexXRJkdNH0MxDWaNGQ4zPJwSelLYBq/a2B3aUEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHpmPTVwJFTs/I7fCEpjpwQrmKGnRT2gcVQ+o0K97bs=;
 b=dppnxUIy9yYkf0/ki4qC1aoFJEuo9o5aGvJSUsUex6v5hC4UomS5x6IV9vOTETQL03cbduY1CsCGByHBDF9HxloDUf3zioQXSMvkNXefn+AQu7NkYs7WSbSVvkHK0kfGMBPvuVgFaYNxppkFP++aysyMHRYVXuauhwJMNx10ouU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e5a4689e-27e1-6992-65f8-c59b669aeaf1@citrix.com>
Date: Tue, 14 Mar 2023 15:11:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Aw: Re: Re: [help] Xen 4.14.5 on Devuan 4.0 Chimaera, regression
 from Xen 4.0.1
Content-Language: en-GB
To: Denis <tachyon_gun@web.de>, Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <trinity-8973751a-6742-4309-b02d-0b4c38f4206e-1678390468345@3c-app-webde-bap36>
 <84f66bc0-ae7c-febe-9a15-98453c48d051@citrix.com>
 <ce1a289e-6ed7-9b5c-42f5-069f16bd6984@suse.com>
 <trinity-429ff607-c131-4745-8c96-9d7f6f61234f-1678481409956@3c-app-webde-bs42>
 <31151e94-b8b3-15ab-3680-e1c6e2e97530@suse.com>
 <trinity-7e872635-20a4-4120-a08d-2d62a77d2da5-1678756503867@3c-app-webde-bs22>
 <2afa0abe-abe5-a3d8-658f-abc466d78101@suse.com>
 <trinity-7c345507-5695-4649-a62b-be4dd793cc00-1678805608384@3c-app-webde-bap40>
In-Reply-To: <trinity-7c345507-5695-4649-a62b-be4dd793cc00-1678805608384@3c-app-webde-bap40>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0051.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c563f11-9dc0-4a50-5a3c-08db249e7397
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EaQiuG7gKqjAUSTWAN0zi0HPyC2PKgmxH/jstDj76ZGhiNPZU0bAw/xo3W0993RIJPWLV8PtuekrM/llxFbboCOdLMAoQQj0+IHjI7fFNUJu5J+i+tXqzNCBEdaQP/fpqylPizbGPNhT6xNVnOoo7zg6iPbefErVy0y1NF4cE8TONu1JSdStwlqaDuM46lZUuNFmhq6U1mvGtAn8vRLkwTcPn8jbcwY3hRRbDaRXbP3q7JYUt6Bm0tvU/RHYEQ9TGfWwmIAzvM5jCZUAXI8w4OUJ1UWL69m6yRFWEswCgh67MtI8OgVMqXEuh/wrqCrpj/pkBlRnlN/bDX5A0A2OeRc+IzFp+xFxVyEybg8wCiwB0vUddjWD7/lqXL6yP/HyVPmd3KjGan2DMFSE0RYznsarpqyWuXA3mZ4dMu6YFN69j2M1UpvH/sXMCQ8YpASMjjeAVJIRI+dOAeiy8Rh311flC+UXUVg01JXRXCa6ber7+KUclsiviXtytHhRDrVbuupjeriYraoz2Fjyrn7F0e6b/JPXD0VHLNpG5COVlgFPu4TTTpv4cnddGr8V9ZSe7XF2H+Rjl9HnFxqZGQ2gFXMIIRyXz35Dg0sgWCRIBErxGcezDTj41kfPEtbPpIQBn6oN16Dv19Hy6RZaMPrfdNkktfidZcNMkKJKKupab7FatSpEcBWYjHv7w97HSATMUWlKui3YLHtuSEYwgv7OfACVgUHRhjqgF8qNKSgjgPg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199018)(31686004)(66946007)(36756003)(478600001)(110136005)(316002)(66556008)(41300700001)(4326008)(66476007)(8936002)(5660300002)(2906002)(86362001)(31696002)(8676002)(186003)(6486002)(82960400001)(26005)(53546011)(6512007)(6506007)(6666004)(2616005)(38100700002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHNrK3YxbTV1cFFpaDJOMXA0NHlyL1BQWlArT05KT05JaGxuRGRCRDNZNnRE?=
 =?utf-8?B?cHRSNHU5Vy8wSzVWQUZPU2cvcWRWeGNBc2FNaVlibERTemNWOGVjSE9ITWZY?=
 =?utf-8?B?aTNpVkQ4Z0d0UGw4R1dGSUNSaXdlbmI5UEwxMmhkazkxa3EwQXRxdytCYVlk?=
 =?utf-8?B?TTVxNDdURnphL0YzRUFXcHBiaVh6b2YwK1NLRVVCRWRncDI5TjRJN0RLbWZN?=
 =?utf-8?B?RVRHUWVkSlhSVGRaeGo3RkpvUGpRb3NsNDdSc1ZCMEsvYUhUVE51T2w0UTN4?=
 =?utf-8?B?cEpmVXdVcW1qcVRZM1JzcHR1TUlJSFpoTGtURUlMa3d0RXZvR1hhUWRoNFNS?=
 =?utf-8?B?MGNSQVhxSlJpWURWUTlHRkIwSGRSYUZzWTMwZ0F1b0NYRUlGMm9yNVdUSEU2?=
 =?utf-8?B?ekw0RDZ2Q2IvQzhCOFE3S1BFYXB5c1h1TDJzR2pmTWNudDNNaVEyVVA4dTBn?=
 =?utf-8?B?bGx1MXJRNjk1TWM4TEdKMDAvVW1Kdk9TZERRT1lUU3FtRHMxYzIxWnljWWVs?=
 =?utf-8?B?NXZ3Uk1Ea29TV0NtWUVFa0lVQkREYWZodU9wMURqRU12dzVyR0lHQjVMNlBO?=
 =?utf-8?B?eEF6OUFlakpyTzZNRGlvbjdveTdiY3g2TS9QNG5DcE5qQ0RaVVlTdUErY1dl?=
 =?utf-8?B?RFhzbFd3YkdCaVNkMUUxZnZ0Q0dwYWNPL0NmMmlmak9SMUVKcmpVbTY5amtI?=
 =?utf-8?B?c25mY1VVN0xqK1FnbjNHMWdXM1JmdVBTY2txZDVJUXpid1lBbW1yUmJWYm16?=
 =?utf-8?B?OXBNd3hKR1NrRVFaaVJuZjJqZlozeXdsOHczOEpTMXRBajlsR0tEa0xxZUU5?=
 =?utf-8?B?WThtZFVncDRvVU5YRG1La09XQTYrYk94a2M4RFo3NkM4WWJITlhuVWFHcXo4?=
 =?utf-8?B?enM1RExDQTZMVmc3Smp2cUlibG1iNStKSjFFcUl2RVFCYjV3K1I4Vy9mZFlX?=
 =?utf-8?B?c0Q2b0xvKzJlZjVyNzFtaFkyMGRqcEpWRWhqT0dJT2tBUmwvOWxQdVlDSUtn?=
 =?utf-8?B?dm5jOTZoV2tZUmxBaVZTSTl0cXVuNlRnTGg5SHdBbzFPbmhMTTRmbCtHamlL?=
 =?utf-8?B?a0ZqdkF3TEhmTG5EOWNPcVBpeTVSZFFaeC9OVzA0N1dlbitUNFgwclp0c05j?=
 =?utf-8?B?ek1IQ25ZTTNvZkpnZDZiSWdleGg2ZmduM0hNby9uMXhsOUl2SENaYkdyNmIv?=
 =?utf-8?B?dDlPZnRkTjdNb2NWcmNkd1lSWWcrRmFhcTIrVFJVenlFVnlLcytLZ0tYcVli?=
 =?utf-8?B?N0ZVcWdLbXpvb2tnNWVyTzBWYktXZnNka3l4MjNRTzZOSVplcVZOYzRLb1M0?=
 =?utf-8?B?WDcxV0NzR0pkcnlzcE5yZVBzT3M5eWtjZndzRVJyaU9HZ2hjYWFpNkJTa2Yx?=
 =?utf-8?B?S1g2VitaSGRoUE04R214a2V6czFkWFA4UFlBTHJTdktjOERSdzh6ZVB3b3Yz?=
 =?utf-8?B?TVdqTnMrbHNES3pZUjIyL0ZnalAxU2tiMEhMbmVnRXhlUW9lN3JMZnlIYzhu?=
 =?utf-8?B?NG9rOEt6Q1FSTmgxck1sMDY1czVuOGExWnNpU05mdCt3aERJMUhsNVViV3dL?=
 =?utf-8?B?RWJPYnBWNVQ4amVNdnhWSU5wWVNud0FLci9wYzFFNkR2YnUzVFlIZVNna3Vu?=
 =?utf-8?B?eS9SRUhqOVkvMVlGRERGaHJQZkI1ZyttM3RzSkc0a0RLMXkxWlBubkdOOVBW?=
 =?utf-8?B?UEE2eGQ0Z3NLN09kQ1Juc2ZPbUQ4c2xHdE1oOFVlTWZ5SkNoOVZwS0NYbVIv?=
 =?utf-8?B?c0kzSUxBa2RMLzlGTFhmSTRkQUx6UzZnM3ppeElTN0NBQjVQNkpmWTRqNGVi?=
 =?utf-8?B?RFhhNkdac3habmFCdmpQQ1Erdi9reDV3UVBPZVVKcnJuMkRKY2lhMjZXYlMr?=
 =?utf-8?B?NGZjVEg0RHZYbDE2dWdURDZIV2l3d1hFUzJTVXNRUHdVSW5hbzYyd25KMy9H?=
 =?utf-8?B?TURKcmgwVkpvTHdKcElVUHBWL2JFdmxvaitNVzhBeVQ2R2h4UldwSkNaWTBt?=
 =?utf-8?B?MDk5eS8vVzlUYWdWamJlU0JndFF2Uk9kSGdkVkNaNm1YRmNFTFNxTVJxUzJo?=
 =?utf-8?B?K3lKNjJjN01rMkhBQ2VlWm9sblkvVjVQVjZPWFJrTWtJUzdFbjFFSnpSUEpO?=
 =?utf-8?B?SEMzUmZMWkZuZU93NnFzdG1MSGtDMndteHI1WDlxSWdBRkZFY3FXRXdrdzJK?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MRByc/hIotOT1ZfRAglWdSIVeuH92k41MzXZjNB1+HMFJnBsdh+3h9oObouAuaLWQPnhez0arq2Z+5chySb7wKr8+M2Z4QOWd5+3yBL07KpXwp8ZgEA1/MpYzdnkjwBqug7EWoedGPw8PkUeKeKoFP3sB2Srqj3EnU8nVc3EUbzMZjoL53ZJZ8fMllYfJFnOUNGJ//yIB4w1ScT5uQiD5hHafxSAHw2FIDLXO+8hNybt0ElVppKn8toQ6oRFU9zc9xHDtZ8d3Megay0mTazVbxlsG8Du32H4C6mU284s9eHTtKK6srgZUP1MZ0svu495p2BTP3odlXO45s8zCf0GUl804u2P/YvndE66ot9VtiThcJnimx2mswUTL1rv/hUix4E1JZNH0W2c+zDQJB0PtvaZWUgd3/rUfLK0Zkx8h0d3KajGu9p5aM78TRwELIoCIiS1RQqX6tFfNqKOExuu71BOMSbXJD8tgYXDL+LLLdBjIogXaKptR7ylCEjIIwIDXXfah9dRhaDzLuJ2lS1hXuYwy03oABvKIo+BpAQXC0OLxsmtlitvSQcyS1yOOKrhqwlz0rVxGz3h0goG/WoklLcfFberdNYD5gogfInPG5WGP3uoT7qOPruSliIG4c8UnXz0G2UjhIiP/JVczYy8rqJDi9CCP7pCXis5slBnDu6MIKequpJHum1k9Q3NmHZgCi8ydG++8W83iy/yVAFK8Vi3LZsm5Ph/12TK4XzefGE8B8JdjSHcoj8QRWfW44rPy3kDFZitlsWVwfNmUb0ST4iN64CGV3cDLHKtZknztQLOUQjF9XXCgSOm1IFfG2XL
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c563f11-9dc0-4a50-5a3c-08db249e7397
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 15:11:56.8444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mzkjnjwexvYiCkHX6goaptNqOEUInWMkCGAskHcl/R5o0hqvmDuRtVlzKekCyVi3xNKUK5qE8zHr8qm/ZxqwDinFSJd62GRZLXIaDw1XaoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6708

On 14/03/2023 2:53 pm, Denis wrote:
> On 14.03.2023 07:37; Jan Beulich wrote:
>> On 14.03.2023 02:15, Denis wrote:
>>> On 13.03.2023 10:36, Jan wrote
>>>> On 10.03.2023 21:50, Denis wrote:
>>>>> Should I test something else?
>>>> ... there was no request for any further testing here, for the moment.
>>> ah...sorry, going by "Would be nice to have this confirmed forthe system
>>> in question, i.e. without Xen underneath Linux" I thought I could test
>>> something which might help shed some light on all of this.
>> Well, yes, that Linux-without-Xen test would still be useful to have
>> results from. I didn't account for this in my earlier reply because
>> I had asked for it before already, and I did take "something else"
>> for meaning anything that might have turned up as useful from the new
>> data you had provided.
> What tests could I do or what info should I provide to help?

Can you please rebuild Xen with this patch:

diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c
b/xen/drivers/passthrough/amd/iommu_acpi.c
index 2fdebd2d74c9..747eae25f56c 100644
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -1033,7 +1033,7 @@ static int __init parse_ivrs_table(struct
acpi_table_header *table)
     const struct acpi_ivrs_header *ivrs_block;
     unsigned long length;
     unsigned int apic;
-    bool_t sb_ioapic = !iommu_intremap;
+    bool_t sb_ioapic = 1;
     int error = 0;
 
     BUG_ON(!table);

which should cause the behaviour to revert back to that of Xen 4.0.1 
(i.e. it will fully ignore the checks relating to the southbridge ioapic).

Confirm that with this, and booting Xen simply with `iommu=1` that full
DMA remapping and interrupt remapping is considered active.


Then, can you play around with passing the soundblaster through to VMs. 
Looking at the LSPCI you provided, it only supports legacy line interrupts.

Does the device work fine, or do you get a bunch of errors on `xl dmesg`
about IO page faults (which is a generic "IOMMU said no to something"
message)?

~Andrew

