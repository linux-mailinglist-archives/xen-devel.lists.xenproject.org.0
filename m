Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDC63BF23D
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 00:47:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152734.282147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1GK3-0002T8-NM; Wed, 07 Jul 2021 22:47:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152734.282147; Wed, 07 Jul 2021 22:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1GK3-0002Q5-Jx; Wed, 07 Jul 2021 22:47:15 +0000
Received: by outflank-mailman (input) for mailman id 152734;
 Wed, 07 Jul 2021 22:47:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tWQe=L7=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m1GK1-0002Pv-HK
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 22:47:13 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44a3620a-df75-11eb-8539-12813bfff9fa;
 Wed, 07 Jul 2021 22:47:12 +0000 (UTC)
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
X-Inumbo-ID: 44a3620a-df75-11eb-8539-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625698032;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iD5EPYGxSHmQZ2av1w+cNqIxBow1YzhsLe95DZyFDfE=;
  b=THi6f3Xzc/UjRQcdo2egWsDLCltulbjxkPLhQI9a8tQAQihtk8ZG6MnV
   71XDlB4J4+hqsRzkwk0J7A5xqq2m1ZQKI50KLNjSn3XjYlUKYWJgP2pO7
   FY3QSbWIXPJVeG27o91eucGeq3AovHcDIuzdWDwGZjxElAWHmcwL6XaX1
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: PBoFu3skt49QX6dRQ7RTu1r8pA507gNaiGYI3qECCHh7baEDcV6pUJoGDIc+n2WepWjljNlgLY
 UWOyKckn3fPzmBAwUReFdFB4rBVBUe8sI7J9tx+5LvESUbgslZndfhPgfYjXP1WeqDU5kQAiMo
 b1fS7tIKW8vIQ2bQJu+RhHbv7GZJG2zUTnpRXH5C0lq1kw/JkDhMNdDBLDr7W0x1aZJ+73KWs7
 BDDa6iveZoxU1N4dxtdiQYIRTvETMy7leh2tHpcNOCyNfwVtH0/7WQgSSZlPptpY0ASy0Zn8HI
 5yM=
X-SBRS: 5.1
X-MesageID: 48162858
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:TnYik6Mc3s0H0MBcTy3155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/exoS5PwPk80kqQFnbX5XI3SITUO3VHHEGgM1/qb/9SNIVyZygcZ79
 YbT0EcMqyBMbEZt7eC3ODQKb9Jq7PmgcPY99s2jU0dKj2CA5sQnjuRYTzrcHGeKjM2YKbRWK
 Dsnfau8FGbCAoqh4mAdzU4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kLEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 bxiiZlG/42x2Laf2mzrxeo8RLnyiwS53jrzkLdqWf/oOTiLQhKSPZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIbRd3jUC5yEBS0dL7t0YvFLf2VYUh6bD2pChuYdA99WPBmcEa+d
 BVfYPhDK08SyLdU5ix1VMfs+BFXRwIb1y7qwY5y5WoO5U/pgEO86Ii/r1qop43zuN0d3B13Z
 WwDk1WrsA4ciY3V9M2OA5Te7r7NoTyKSi8eV56Z26XTJ06Bw==
X-IronPort-AV: E=Sophos;i="5.84,222,1620705600"; 
   d="scan'208";a="48162858"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOJ8E9XdAN/Phw7SNiH92onbhVfcay/ViSM4+YNc9ENEFOzcwSdqBvZrQ2LMnPGFLsOwcQ7x/wATGNF+85PodrHVkkKruALiGP1SsDKizAlhUojRhAXEPQ5LRtFfSm6rAYH3FwqnTc0Cx3bG1kwz/QpVREX3I/IMl6HVYCs9NpciBw0xysYIIC5dAhc07+hqRvVoT6AA5rbzfiWi8alUTNCq4Frc87lYR+LvPDm9ZkrJkFEUAgQ/jdHH5xQSbntsZhn4lgwg/fDMQcaLptqKwcq2e5YRjSlK0Y+NvBR3W6G70xoYhK0U8Q65e35FnQSqaImxzyDNqdNRW+6/fFzmIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iD5EPYGxSHmQZ2av1w+cNqIxBow1YzhsLe95DZyFDfE=;
 b=eVqi3Ek0FHNa7m1NYNojhx6i1MuwonUmfVfEZNcaq7o07COl04GUbVuESxBRIw9zYYlk7M4DjmURCAmhAOBBkC9qx9+0EGjJMPG/wu6+uUVLPsw0AtZ7JehBF5d5aJhGoGzNFfOGVAs3zjpuaT8Q6vWnSKpmjxLWL3Ut4OCjvpKXWQ3s353bh3Vm7bKPkcMhPtzDM1J8rjDBJ6r8WIFfsreI3hVsvbNYlKTcqg614kkZMlCTKNXvNqAPWSatnGPauREsqunIq6pQY6XVLE/zYQY8wbPSCRxhPt87e8OvRRnEM6CpYBxlg4RfBCSloVohwfXPKLMSZbHoFRYgCLPNnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iD5EPYGxSHmQZ2av1w+cNqIxBow1YzhsLe95DZyFDfE=;
 b=rj8TAvU2h9eY9blgTNaCPxrnPHXWBT+2FeGABhRTUuL8Qr30mcZqlKwyFC+Ce4Z6RV/ekMcCwKAy9BfzQt4W7nz9X4ZmYrF4mFPj+sy8xzRqd/Bmfn+2TWIOEsAxVITFpq06P1EoRwpst6KDyINCKYoZC16S2SsAdjU6Er2wbKI=
Subject: Re: [XEN PATCH 2/2] automation: Check if ninja is available before
 building QEMU
To: Olaf Hering <olaf@aepfle.de>
CC: Anthony PERARD <anthony.perard@citrix.com>,
	<xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20210707164001.894805-1-anthony.perard@citrix.com>
 <20210707164001.894805-3-anthony.perard@citrix.com>
 <e775d987-939c-e7dc-077c-fc61a2883f6e@citrix.com>
 <20210707223551.5462c74e.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <375823a3-8b49-7aab-ca2a-af219234b5e4@citrix.com>
Date: Wed, 7 Jul 2021 23:47:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210707223551.5462c74e.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0462.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4984d34a-025b-4ef5-0c12-08d9419926a6
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6272:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB627234F191B673AEE6FAFB84BA1A9@SJ0PR03MB6272.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dMuRz/EaDlq0GBnDeZUQgHkKb4EYF5Wuoc/5v5hzWGRJl7kXgQzVbe5s4VXETBL5VVLbsw2sthG+z8zgZW8KEqwRIZL6m322q83VBIQISGXh8GM9q0qJuadY+S8SsLJjBbSDmFKNdRrIs6fdlrnTDZoBNnp4PYbZFreszp9pjACOKCpZGq/INXfrZ0khN1JIN/ioWACdOEdzzr2HvWZ/LtbK0nyr5s+XF7ma48AFrurqyPj1OyY+aAs6keisMqjeXZPsebG64U7LYj1c/2sXAZNeg8sc0qyc0QjdRWQ2eiwLRRV3qwpwy6cvRdS0nGg/FdJZ6dn8+FjBJtz29lGM4pNYVj4PZ7PgSHbqNULqL6kI6AmloJnVyQ7U5/i/aDRaXZvs1W8KEMm2Gx6YrvcVr1FOuw5GoETfo3s8XU6lJCdyISjjwxsEPqGt6Z6hhHNaLEItqP6rrhdh6fV7o2Q1Nb1e3SGanhSa+2jzxDMxcsgNWQHBoPtodpRPqYjlszNmKNwn79sGU1brxVzN7Ymnkw3nv5tgsFhitLKGnGBuuEKLaan4dG4NtDx7FUtL60ZQhbylKU5LaG907Krds9l5w2NK1XhD6/t3qkVADZWubxvYkjaiQ+UHbJ/aZjCvO841NgVT8UC56QrxpI/blg+NDA3jc4Ja2dH8selIpvsADDj6WhBridSMuTVHKAftLw4QC21YEaa5K3K9PW6Zt1AVohR84v222aEX21Qo/DygQIU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(4326008)(4744005)(8676002)(8936002)(6916009)(478600001)(2906002)(186003)(16576012)(2616005)(66476007)(6486002)(956004)(26005)(66946007)(53546011)(316002)(66556008)(86362001)(6666004)(54906003)(36756003)(31686004)(5660300002)(31696002)(83380400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?BaSczJNbry6OUKCx/cNxoVjJmq4qiw3Zfxtm+scGabqwWuaNH91sJ6K4?=
 =?Windows-1252?Q?XS2rM0D6AhOFqBTOm0F/RTT2VL1bwoQdzvTdPCp6lwktfqSqQ5wrkT0Z?=
 =?Windows-1252?Q?ykZVVCynC3hdYIQalb4oT2roH4uzc85FqJIcDoHU+CePXh0fpg0XQaRr?=
 =?Windows-1252?Q?zRkQaFwCi1qrCJd0KbyvLHaUxFgv2cmkzLc9exEXBub4uI7WK3oNg8Ct?=
 =?Windows-1252?Q?09zSBQkx//id4rnG8Gycjw7rXySJwH2TxUEumaihQ/O01utg58FnQaaR?=
 =?Windows-1252?Q?yzFk4oLDkcRhIg6SRX8OsHh+fNzFFdBr7SLBwa/P/Q3W9cSMfAt2mxoB?=
 =?Windows-1252?Q?a1q9C1RncArQiAEqhkeV93Q+9GLMyDDh/AQyq86OH9RTJcX+hf5jVZgk?=
 =?Windows-1252?Q?ZxtJKonrsy7+GZssX7y5avA+wicGZdK+PS2s/iNir7NHAtDdAiTBlDMu?=
 =?Windows-1252?Q?+Ks7DCfrRGehCIxCHdVhOzOWGpPXGdzCmItzXboLLD72sDNvWtXDR4De?=
 =?Windows-1252?Q?mys6x1K3YWeKQQE85xq2iaokhlQm97xCBr5J0ivyOxzPC+sh2UjQlOt3?=
 =?Windows-1252?Q?ak6PM5iPaLqxitX48jhoskzS9cFc10q4O7hQhTmLsMOYv4H99FtDy8nH?=
 =?Windows-1252?Q?ROKcOVtoCtx7MB2/EqtQt5QGu4ZLHSTzEFY1kBskwmdIvxPsSFQn57/q?=
 =?Windows-1252?Q?+fbzLWOC2zxi3N5MyN0CpWRRuflZZzTgqJ3iy03HVfFD8+/P+zr8UqvX?=
 =?Windows-1252?Q?Ft37JKn/+9mEVcMY12HYhAP8Vf19u7FmgQ3LM08RBc52yHj3GGlv2FU7?=
 =?Windows-1252?Q?97fz+sy2cqHQmSGHXoS43wy4F4pMwf1IJrBiXWjOeZ0QN22dHzFlKX2T?=
 =?Windows-1252?Q?vMixhzfm5PnQCP+qlQJ0o3i061AqmKyyg6QYUAKwn3yTAakZ5+yd6s3X?=
 =?Windows-1252?Q?3PNmRE9WuiaZC5tGPTP0WZrDw5KDwT2cavDBhNgY1PdT51Ohp0lTJDqM?=
 =?Windows-1252?Q?WU08xwXugoU5sxXCp/TxvktUEUD2lcHPo9JweCFNtPmGa2UNiBj+rB0c?=
 =?Windows-1252?Q?nbL4Ohp5Vm+pxd8moIyBhTzkcMWn7F+ZEPu4oOFmGal7v39XMaE8FHDl?=
 =?Windows-1252?Q?KMoey4IQSGw5WoJZUSydKRU1On8n240em1jQJSI/bQwt+znsJ5I+Yv42?=
 =?Windows-1252?Q?UbYaAOpru3ok7o7cokwIPTwho198VLDZ6HgbqD3UYpjm+PGuLLLUR7a3?=
 =?Windows-1252?Q?ng98Wyq+Se6l0kmUyz4qlGRTlgKYOQ6gRc1vpzLFr5fPntfU1Nhiggih?=
 =?Windows-1252?Q?0XYihWVFVr0179iHAJ6D0ehjUHIpdV5KXX1CC7TSlov/+KCYU/C0ELM1?=
 =?Windows-1252?Q?/TlNnOZgYP+u9cujmbCpgy5FtNpPJPsI6v1ewk0gKUy1m91g5zXr5bmr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4984d34a-025b-4ef5-0c12-08d9419926a6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 22:47:08.5183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O3jP+l2prMY2xks/m+ozrVGSPA2gu7/2aGdSz/VKQWzwD4IDwUIEiIyXeLr/Ly0SC5ffR9RsT+oZAiMVH4xk6x8VS121er71GnL3BR60XJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6272
X-OriginatorOrg: citrix.com

On 07/07/2021 21:35, Olaf Hering wrote:
> Am Wed, 7 Jul 2021 18:46:03 +0100
> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
>
>> Tumbleweed is generally broken and fails at ./configure due to missing
>> compression libraries.
> Something requests zlib-devel to be installed.

Yeah - it shouldn't be hard to fix.

> I suggest to provide all config.logs, not just the one from the top directory.
>
> Also a "test -f /etc/os-release && cat /etc/os-release" should be added after "$CC --version", just to know how stale the container is.

We ought to yes, although I think at the moment we probably don't want
to realise how stale all the containers are.

~Andrew

