Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B7E3C2329
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 13:49:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153604.283776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1ozz-0003GU-DU; Fri, 09 Jul 2021 11:48:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153604.283776; Fri, 09 Jul 2021 11:48:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1ozz-0003EF-AR; Fri, 09 Jul 2021 11:48:51 +0000
Received: by outflank-mailman (input) for mailman id 153604;
 Fri, 09 Jul 2021 11:48:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iqbd=MB=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m1ozy-0003E9-9I
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 11:48:50 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3070d9e-2b16-450b-8fe4-b3038855205b;
 Fri, 09 Jul 2021 11:48:49 +0000 (UTC)
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
X-Inumbo-ID: e3070d9e-2b16-450b-8fe4-b3038855205b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625831329;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KRG1AmYNIZ9Y43c9MVBYSUyKQZgg0eQeAARAwW5mT/o=;
  b=a9qi7/+rc1XUXeacT2MKjZLH8X91Ek7QHq0fitCEaSXHyonWkHRTlN+w
   B//baqJ0sbriuq3ovb0nlhb5xxQb7F+53IWFOzETYypQ5On4ey79eUlW4
   mkYVSQ1WLwFmb6wl57v1+HDIEZUfdmfdr8Q7G/iRlQuhP1TInTKIl1mzO
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: QsvYD26k3cKvHFI9OeQ1wULE3VkMedTnCtHXU/Kd7hklyjSDzo3y9wnoP4pXHyvqPf0ozkO1UR
 ppVjGs1OBuMYg9wOlYHEaY/AOI2BA8U92EQug0tInBunRwESh1KoCkZ4haKNZvACTeeW3bxwY1
 0ACf0OuGNWjm/bAh2Z2t0NsW2IUWCdYdIWBEuqK7rOci6gRQf7fT76pSorsjbCTmBQS3aPeYf3
 tS74TkbZyZUO3sQWFwZDMaI954u/0FIEtekxFG21HobLkCHEn1uUnGWwX/BaaPJi2FYqAQJ0cA
 8kc=
X-SBRS: 5.1
X-MesageID: 49565674
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:3D8X9qmKzUrY6fvKqe34A8DNVrHpDfLh3DAbv31ZSRFFG/Fw8P
 re5MjztCWE8wr5PUtKpTnuAtjlfZqxz+8W3WBzB9aftWvdyQ2VxehZhOOJ/9SKIVyYygcy79
 YET4FOTPf5CUFzjcj8pCm0euxQueVviJrJuc7ui05EdyZFUOVBwm5CZTpzaXcGJzVuNN4DOL
 C93+pqgAflWVl/VKqG7nFuZYT+T9anrv/bXSI=
X-IronPort-AV: E=Sophos;i="5.84,226,1620705600"; 
   d="scan'208";a="49565674"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gv9tgxaMvQmmok6jlwUfIDOVb/I4P5+sxhJMe7nqNaptqLz1+TkCiRprnvPqbWHitu3GMQYaUyRdc7WjJX7H/ScplcihSw8VKXKagwEvZov6WMhYd2lyJV1msV4zLlNBE3R6aNQoZAO41VobG3hdN7KRbaLvGKP1q4Sjwr/lt6+Tql05y9ob9IqiL+XuwWgWZRHAXzPBUqYv6vlKplXgtyVQ4dupndzJr74eUBdD+dGlB72HcMurvDdVxyvDocauEPvivtRGeKSJMrnooTCm1yN3kZr5g7CxwPd44i/+2MsRuGDDVbAf6/SS/npL2i7ABU0d/7GGzZrFshV8ImwDyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRG1AmYNIZ9Y43c9MVBYSUyKQZgg0eQeAARAwW5mT/o=;
 b=BjvYb2Lg39m+8qEdQoSWlXh2+fCarBcmRB0K5oOAyD2kStDTL+djtKOMKrTHCF0I/1/YZV5FhYHcCcAlomeFhUjdfYS74is+s5KqkHb0NTcqt8qHG73LTAEcYx/2BXA1cDmmecYHYzCimLkktm2hFdgugbKWu3D0sZXzQk2wNcOFajmroMe86aMgKn7ii8GWK8qQch+iiJwjDYnuiQ9JmtoU2Wxi0C0GlieQ2jnRNuuv5oiVvbbDgfDzequz0tcroguptbDSfue33gsB7u7uIFfG/ldar9/oVlOb82oRxbYWvi8Tt2p9v7M0pufOwZwA4Asf7V2uxh0mQFtVVKpV5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRG1AmYNIZ9Y43c9MVBYSUyKQZgg0eQeAARAwW5mT/o=;
 b=pMSCDAQ1r4syFNpdSUVCUQLdmlL7iS5FHwg6Sl1skf5aXBZNw7he4iStrttyHgH09VQSgzwnJdCcnVWf6TFN2KqvJV8B65RAoxmbOnHInC00Y5ZJBCxHQT7I/xhRZYrcWm9KCRTfgIGGu2W1MgYziPtUNotLL7OjGd7uGmA7uUs=
Subject: Re: [PATCH v1] automation: avoid globbering the docker run args
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>
References: <20210708145650.8961-1-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <96748a07-e262-f028-4475-a827845f8beb@citrix.com>
Date: Fri, 9 Jul 2021 12:48:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210708145650.8961-1-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0386.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd3f8d6e-3de2-4cd6-6eca-08d942cf817f
X-MS-TrafficTypeDiagnostic: BYAPR03MB3669:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3669D0F6495746922FD5A728BA189@BYAPR03MB3669.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m4UZDmKorfzS91Ia5fDqyOfULVWyqYOEN8UodWy+IJPsuPqlgbU7DPGz7lWw2jiSR2K7dVJTV6jppCIjpkTD2M8h7CGeRHtZDROWOlmoCc/bCDzzf0qFXZiDfbF0do6Hur4twFiJ/Ji1IGpRlnnEgJM7/lVP7XXeD4rPlOdfDHAcqizSv0tAE3iTuehxWB292wa6GAMXJJULnC4OYHrSkaLllFKziJ5956LdThOgtFSbC0JtU45rM4p8x1GL039Pl+DDVDy2bNs31nfrkGOxW+uLL8rKQn8fdO2M9OWg6TOV1DXNYUO3irPHjcnHMOxVLHWajBpDX6FhgOoL1dtIvH34qy9BkOL22KKaXsBE8Moixi/9n5fxP3fbodBY0U4cKrpzUDGEig7iW7oiKgjQ0sVoz9eHdcosMfXQLHaUevr4h6Hn8NgJLmEFy0YuGtSh1wyJ8sYaHp0NFAYL+xTE39q73DhdB6Y8qqU7DXmb26lqngpJzyM3EHOxcdJas2VSLeU4XBhAOZ+MX1tWuZdxSCAqzEwjgomZuvrrQD1LzqhkO9YJr5nZnMJam0yE8wDRmjVDAm3fauTZKe4YZhzFNziqk8VnTdP4umx5+TttlyEyRMbkRNi+1Bakh4x9ht8Sc5AdMRyOqZnapnyisOEmEHXtU/l7SVrLE1DpWEXa+FdFQWvhXFJOFksgjZCTd3nDKcXTiXi0E8eohM/JkV1gY22lIEv0LssPSX1ZhPrLExmus+gx0QJsVe+lorVic+Tp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(86362001)(6486002)(5660300002)(16576012)(4744005)(53546011)(4326008)(2906002)(38100700002)(66556008)(8936002)(36756003)(316002)(956004)(2616005)(31696002)(66946007)(8676002)(478600001)(6666004)(26005)(31686004)(66476007)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RExlNGNqOU5kVW5BYUs0MUowSVVZSExCTGNFNzBoZmx6ak5PTkZOTzJQOG01?=
 =?utf-8?B?bEp3TStKaUJJRUhRMElWYkJEdVJId0VlUWVBTitSd05rdGJ2bllCWHVpU012?=
 =?utf-8?B?UExaRTJiT2lKcjFMOVRJZ2VzVjJIdFhjU0J4S2RYUEU2KzdYUU0xR2gxdTM1?=
 =?utf-8?B?NG9RaFp6UUhmZDFzWkl6QWFTTlVYREhxTEhjNmU5UVBRaXNLSWk1MVJ1T2U3?=
 =?utf-8?B?MCtOeDJKRW56a1pnb3NYV2ZIR0ViZXBuaE1qV2hhbkdueXdmM1hNYm5hSmZH?=
 =?utf-8?B?ZDVSbGVnaVdqUVRXTTEyREg3djFFU2pyb0VWZURzSVdqcmc1d2ZrN2xkTlFH?=
 =?utf-8?B?bHJHSGE2by9mWkpjOGl3NEh1RkZETDBBUEdMSjNFd1ZPandZUXlYQk5nK3g1?=
 =?utf-8?B?QWgvcENUQmN5dDdxSlJDZ2JLQU9BcGh2QVZCemVjeUZaYmIzdW1FT3BreDRV?=
 =?utf-8?B?Y2I2VHpMZUUvOWMySCtmWnJPTkdkamdqU2EyY1NGVVQxOGVOTUd6bktsdzF2?=
 =?utf-8?B?L3F1MjVjNXdGeEdkSFVNN2YvamVsMDlqbnNONUlmZ1BRY0JzNjZ1Rk0rOFFp?=
 =?utf-8?B?MVdoK3FaaWw2UVNNeGhIL1hNdXl1Qy94OGV5NTZ5dG9XRnVSUForUWxGS3pS?=
 =?utf-8?B?OW9HTzJsTy9semZabGZYSStkTzdmTnNrWlRiWEFNT2NZMWpjc3RPWDVtaHk3?=
 =?utf-8?B?c1Q4UWxKRVUyL1pxTWZOWkc1YkVKampjNFRqdWFQbmZHaGtnTWZUZ3U0N3dW?=
 =?utf-8?B?V0pydmNFWEp6Wjk3eTdFSE1Qalh4ejlEN0NxU2hSeUVnQXhZc1l5U3d3MWZx?=
 =?utf-8?B?bnBSOTl5MVJ6OVZ2WVJYQ1NOTkZCOHVqdVl6dzhVSVMzYUdMRVgvdmtqSWVO?=
 =?utf-8?B?UDVjeUhDbkNyenNsR3NzYlNMTVdwaFNDenc2K3MxVEtjNTI4TnV1NmhsT1lQ?=
 =?utf-8?B?Ritpb3IzUGpnTVhXTnNjdjM1MzFVRklKaU9mVFhQakp2SkNJYzcwN3BnSmtI?=
 =?utf-8?B?QmxLSDhZMXVJVW5zYlZDQnhCUUNTMG5nUzN1ZDJXU2NPU1E3anBZSkxJQ1Ax?=
 =?utf-8?B?UktCSzRJMlRFbCtmSjkwV281bEdTNmd1Y2ZYeG1RRlhBa2haZVRlTU5XR2NC?=
 =?utf-8?B?Z1FlSjQ5TjU4VUFENnlHTlNLUjdyNEs2TEVoMzVhZ1Z5eC9GUkwrbXlhelk1?=
 =?utf-8?B?WUc0aW9ZMER4bnlsZHZWa3RENHpNWmhoOEZ2azAyVmRWNXFvYkkva2g4NEN6?=
 =?utf-8?B?em16VTNhVWVqWkJWYWNiMFhvL0syaEJsQ1Bpa1VnNWRkbC9Cak1iR1ZZZW9N?=
 =?utf-8?B?U2wvd0pOOWhWSGhpTHZyd3NtMCttbzFkK0VIYyttc2t1czdWdkg2Tm9rOUV2?=
 =?utf-8?B?Tjg5cXoxUVRqZTdIa29TY1cxNzlQZ3FOaFRyTExrSFU2RHI4VGNVRmI5MUZK?=
 =?utf-8?B?cXFuVVg5bDlXWXBpQ2M5TEJEWGE5MXljNzNZQXp4a1VERmtKaUxwL21wRmZO?=
 =?utf-8?B?VDl1TFczS1I3M2NNTVJxL0ZSeW92bXR1R0ZkNGtFTUZBYjY0VkdDQTBkbFFM?=
 =?utf-8?B?MnJsS1hDcGJHYWMwdm8vUW9Ta1hyN2ZpcDRRUkxuMmVUdUsyMEl6d3VGVkUw?=
 =?utf-8?B?Szl2cGNqTDZMRkJycEtodkhOTEt1S2d4bHlvTTRtc1BWTHdOaEN4d0xyK1dq?=
 =?utf-8?B?Mm1qZXo5OHFFckVkT0JFbXFNTEQxVmxKMXlXa0Y2Z3o0RzNwak1wZHlneHI1?=
 =?utf-8?Q?ykjpkNGHY8OzpFhN6tvoNx0QN6VwdY3QU7fIu67?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd3f8d6e-3de2-4cd6-6eca-08d942cf817f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 11:48:45.0030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MyFirTAHO3DOqsm0kLPT05zHrlk4y54HYJT2JbCLjrGJUnnOPMlHY36q3wI9eP8Lbzo7pUWPW9RDPj/HbEIZ/IsrPVvgZLtSctTMg/7eTgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3669
X-OriginatorOrg: citrix.com

On 08/07/2021 15:56, Olaf Hering wrote:
> containerize bash -c './configure && make' fails due to shell expansion.
>
> Collect all arguments for the script and pass them verbatim to the
> docker run command.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Andrew Cooper <andew.cooper3@citrix.com>

