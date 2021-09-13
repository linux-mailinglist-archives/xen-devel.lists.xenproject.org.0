Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 789DF409984
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 18:39:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185842.334597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPoyy-0004kt-RI; Mon, 13 Sep 2021 16:39:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185842.334597; Mon, 13 Sep 2021 16:39:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPoyy-0004hi-NX; Mon, 13 Sep 2021 16:39:00 +0000
Received: by outflank-mailman (input) for mailman id 185842;
 Mon, 13 Sep 2021 16:38:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=srN1=OD=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mPoyx-0004ha-D9
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 16:38:59 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1748f60b-14b1-11ec-b3bb-12813bfff9fa;
 Mon, 13 Sep 2021 16:38:58 +0000 (UTC)
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
X-Inumbo-ID: 1748f60b-14b1-11ec-b3bb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631551137;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Dx2x2XqTpyd1p3QOah+oE8zdEEA/yEljPhBsZRZpkXo=;
  b=auogYl2f7gzGMHQDFsI9SjzzRw+MNqqgMXTbqzkICggbt6n9d1HPNHyd
   yuaOBHPOIJDmckmDSVTx8HTsE8cIiNNQhU6WlCXpVRT1BkZnzIlwC6tkc
   CMSs0GOCCjVF3fx6BcE7AymilGcNZRwh5iOZ8gEUnGOnMtG/k9bp8mf7q
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: tf5oZ7PDK0TmhJPzoy6gm6CsjGC8Aw/21TQdtr//XMhnVptYLEAc8QyRsxdXmh1w2sgA2f0y8Y
 EnPECNN0vu1bCWHsQVE0mVX1rJc+I1sz/khkj5hxCPfobYLZ+Q98Bjh5uJ/1Nel0Skk+YLNOHY
 CVR0WaQm7qI7SYw8v/yXL06iOgjQb9sECyINu1F2QKbcqTIH81Zh3KcBU7Jjm4mjetfHl0n+DO
 +Toii920AbzKTKqEtpf5teZGiEfwNO++bKxq5dWRPlMcWY5PhGclYVDeTL8tpcqj/Vs3rxDoKt
 7/N7nk+rjc0Dykg/+T0yC7JZ
X-SBRS: 5.1
X-MesageID: 52618433
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yB6eI62PDIq5C2sxAfbD5fZ2kn2cJEfYwER7XKvMYLTBsI5bp2ECz
 GMWXDyPP/iOZTP0e98iPYW3o0JXvMWEm4QyGVA/pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970EoywrVh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhuIwt0
 OxxlK2KRCAqA4HyteQQVwl4DHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9t3J4XTaqFP
 KL1bxIxbk7JXyFiB2wUN55hhb+viUjha2VH/Qf9Sa0fvDGIkV0ZPKLWGNjfd8GORM5Vtl2Fv
 W+A9GP8ajkKOdraxTeb/3aEgu7UgTi9SI8UDKe/9PNhnBuU3GN7IAISfUu2p7++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKaljlAB8JpL8wL0gyqyZf43SuZC2wUbiEUPbTKq/QKqSwWO
 k6hxo2yXGY07ezJFhpx5Z/P8mjjYnF9wXsqIHZeFFpbuYGLTJQb00qXJuuPBpJZmTEc9dvY+
 DmMsCF2rLEal8djO06TrA2f3m7ESnQkSGcICuTrsoCNtVgRiG2NPdXABb3nARFodtrxc7V5l
 CJY8/VyFchXZX13qMBofNjh4Znzv6rVWNEjvbKfN8Z4rGn8k5JSVatR/Ct/NC9UDyrwQhewO
 BW7kVoIvPd7ZSL2BYcqM9PZI5l7lsDISIW6Ps04m/ITO/Cdgifcp3owDaNRtkiw+HURfVYXY
 MfFKJn9XClDU8yKDlOeHo8g7FPi/QhnrUv7TpHn1RW3l72YYX+eU7AeN1WSKOs+6cu5TM/9q
 b6z7uOGlEdSVvPQeC7S/dJBJFwGNyFjV5v3t9ZWZqiIJQ8/QDMtDPrYwLUAfY15nvsKyreUr
 y/lAkIImkDigXDnKBmRbiwxYr3YQpsi/2kwOjYhPAj01iF7M5qv9qoWa7A+YaIjqL541fdxQ
 vRcI5eAD/1DRy7p4TMYaZWh/oVueA7y3VCFPja/YSh5dJllHlSb9tjhdwrp1S8PEivo6pdu/
 +z+jlvWGMNRSR5jAcDabOOU42mw5XVNyvhvW0boI8VIfBm++oZdNCGs3OQ8JNsBKEufy2LCh
 RqWGxoRucLEv5QxrIvSnamBooqkT7l+E05dEzWJ5Lq6L3CHrG+qwIsGW+eUZzHNEmjz/fz6N
 +lSyvj9NtwBnUpL7NUgQ+o6k/pm6ou9vaJewyRlAG7PPgaiBb5XK3Wb2dVC6/9WzbhDtArqA
 k+C97G241lS1B8JxLLJGDcYUw==
IronPort-HdrOrdr: A9a23:kIoRhaPoUvrC0MBcT1b155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/exoS5PwPk80kqQFnbX5XI3SITUO3VHHEGgM1/qb/9SNIVyZygcZ79
 YbT0EcMqyBMbEZt7eC3ODQKb9Jq7PmgcPY9ts2jU0dKj2CA5sQnjuRYTzrcHGeKjM2YKbRWK
 Dsnfau8FGbCAoqh4mAdzU4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kLEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 bxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72zeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJlJXv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbZrmGuhHjXkV1RUsZiRtixZJGbAfqFCgL3V79FupgE686NCr/Zv2Evp9/oGOtF5Dq
 r/Q/1VfBwndL5gUUtHPpZ1fSKAMB2Fffv9ChPhHb3ZLtByB5vske+83Fxn3pDmRHQ3pKFC7q
 gpFmko7VIPRw==
X-IronPort-AV: E=Sophos;i="5.85,290,1624334400"; 
   d="scan'208";a="52618433"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WF9pudjKpxlMX+mvBxvDqVuDgFISSfoIWWAJNd5ggnh3nRe8jzReNtihCluKtT5hI8LzllXIELEOY9Oqb1woJfSNXeD2misCrf+Swn85t3A7qSSyAG8W8+oefnD0pSTqA+Q05x7NSk0u4xDMRuDnsFhMfz+Nqjcm2lKfbzrJxwhdrIoBbudj9Z0WnFAqjko4pJYly2ZcFCMx7CqoDlGXpvc9ovtBKf5GuDL5OaA+6pDvJVtV5mfEtPe/2ZbjHWYOZDshRhBTHDw6PUIc0lfx6OQzqkO2xqM3SjdIKo1wbgcLKSdPButu7Re1yZY7FNdAwOzN++sGTZtHB8aj5ToNvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=fDiQdlmJ5pKsz8BO73i8Oa/hYI1/pgvsgP1x8ianxO0=;
 b=oJYVLbabQyBQo2JbWP5x836/iA7n4DVSKpR9olaqAMvZXpTde7gFH7Av/+0iSpzuXRJDoPT/88TFFQNaMb3pwmNzzab1/zfO9x0DgFQ1pSpfPydxX+zVf97aAXoat3SNuVf5LwSEBz4cIJUGRLx3Xr6RHcgieGdinOwPJSPSelTZOj4BtgvaeHdM9HKc/F+MoxrDhy88JOqFrNZQOaYNtNNJPd97wzL3A+S3LmjOH5XTk7bSUM0ZS1bs/OlWDE5eXP9Vut+OWM2p1EvOr9fymYdK4D7lG5nuL+mnhT8e8v9rHQru1dwUTVdB2CnsFcGhbE38MNzDnj7K8ZJ93iDCFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDiQdlmJ5pKsz8BO73i8Oa/hYI1/pgvsgP1x8ianxO0=;
 b=XOH1nB0jNqPhRRIMHW4q5SU8+tN+ipmP2WoA/rGt09wh2x1fRBnVpG/MO1vZzMnRfSNu+v/QGZ6dlbzulMEIATZ6nZ/E5TvJy0eKPSFc/dm3Kg902ed7df2w93ZSuq9631XTvGX73GwRlzs6a8h2XPhLLA4h5AiIXxHbc8x35Bk=
Subject: Re: [PATCH] x86/boot: properly "ignore" early evaluated
 "no-real-mode"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <6b7e3281-4893-a5fb-cd1e-5b1918a1ee05@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <cb65f6ad-7a43-6a66-e31b-69c123103c26@citrix.com>
Date: Mon, 13 Sep 2021 17:38:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <6b7e3281-4893-a5fb-cd1e-5b1918a1ee05@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0365.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6827bb7-c37a-4a48-8ec2-08d976d4f9d6
X-MS-TrafficTypeDiagnostic: BYAPR03MB3495:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB34952D57727DB9C62B3B04ACBAD99@BYAPR03MB3495.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qcARUnWDk3Pmo+FLFjvWuZMBt275G62myftknR61c7hbBaAXVKbKXh9alPanIk8SRGMr38lf5wkxRLVGlzHyuylCAvSrW0XeaJJ7pI3sDLfYAUpSQN8MRPfM7aU+BbV+TJZHbKce+T5Y1BxjZZok+5GqI26MYrgJ4WbnBSLJDU528r5IQQwaAeYm8cS/TXshr/oDS4W4CjtSN2ijKy2J+REKTc9YVt6/msECqMsdECWhvko2nXCQpNkOCVdUj/3Tq8g2UNsxxsm2Hdow8RBHSoncKfw5/eUPAkXsc3mP6RNiF00Ny7ElMfxjgtmejoSEqQf4omsfjEf1ZBJv7Mo1EYPvDi0zcfD+Fg5aCVgaEA9Oh31dqSUqY15MmoNcVQHSPWmbecOzLLmGYZug+AkHipAK0aZGhY+mASgu3GZuO94hvCm15jw9x0u2SNeh8/ZbJfwHUsh6gfOFkmX7H98qD/PcKR/SyzeR8XL1i5/RStTqs1JB/jloCIeL4KcMupVS+Mz1YWEwkVZsD2DPe3AHmx9xVtu7aa/1H2FU3FxbPxQEmKbz4OlvEqC0RVpMEy6fTMLcy65fEufxEegx7/A7kAcb0WAkjq6lHOVRYKRg4yCq67xw82JqfMsZQOulQ059Fn4v8VbfioMCdmJLw5m7A7XbPsPTGAmlI2RlojfwYOiGMfupO2TZfBmI+yLXW0VniTP4yIFovl3H7+s0xQdTg4NEtK3gjDw8olx6UGCszO0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(31696002)(54906003)(66946007)(508600001)(107886003)(956004)(2616005)(31686004)(66556008)(66476007)(55236004)(5660300002)(26005)(186003)(38100700002)(4326008)(316002)(6486002)(8676002)(36756003)(16576012)(4744005)(8936002)(6666004)(2906002)(53546011)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTZTSGJoVUxscExOL1o2Z2kvajdZSGRkNUJnUWVpaVdQYTd4dlMreXFGakFn?=
 =?utf-8?B?c0dyTjNhRGZnc0xKSUkyckVrVjUrZ1hqVngwN2NJbmZTSzRvVnpPaGd1UW9C?=
 =?utf-8?B?NnFlYVVlRlNyeURCMU5oUkgwSmRJWHV5TjZhM1hnVjZ6THRKM1hOUW43UlA5?=
 =?utf-8?B?WmQzeDhPaExhdDYyenE1dTRHb29KSWVXaER0UXphVnl5aFA3V3RLeHlrc1c5?=
 =?utf-8?B?cFBka3JBZjBJd3NLN2pQbFFPbTBqdmhZd2syR3ZDc0FRM1M5TExwSHJRc0pw?=
 =?utf-8?B?Zm1KOTdobHdUMGI5RU80cXBBTUcxM1R2Qzk4ZitURElNZ0t4TzU5TlZqNUR6?=
 =?utf-8?B?Q21ZNnhtMGVCS0V0ZHcxQkFLYmNQZU1HNThFcHZCZzJIcmp6YTJTOXFJVURn?=
 =?utf-8?B?a0JlM3BtTTJodS9Xb1NaWFp6c25Va0g1d2JpT3NTeDhvQ0RDNXlzaE8zWXJB?=
 =?utf-8?B?d3h0U3lBem8zaVlJbVNGVE5vRGw2RWNnTUMxS1VQNTNMb3BpaTdFK1pGZkc1?=
 =?utf-8?B?cUpKenFxYmowNjRXTlIrUFFVbkpneWIwY3IrVnhWTlpiREZVbGRNRmxwajlj?=
 =?utf-8?B?RmxEb0NKVVhJWFFhT0FjaE5HUDFJdkwxUHdRV2xpRWJYRGRJNE5zbWFJcUEy?=
 =?utf-8?B?cFQyeG1vWWJ4SHBHUzh5ODl5a0wyZ0JTZDJKNDhZNDZPYmZWSTdFcFNGYSt2?=
 =?utf-8?B?K1l0M1FLdXJRTGozc0dleStNT1lVL1dSWmlxOWxFK2lxNWFibDVzaGxtdG01?=
 =?utf-8?B?TDhnNzRKbiticE4yMXdMV1FJZ1g1L21MWjUyV005clNrVTUvUDU4c0w0WFpQ?=
 =?utf-8?B?WlR6RW5HTG9sQnhCRXZwaXhtWExnWngzZ2g2RXNaaHdYN2JYY2lCYzc4alFw?=
 =?utf-8?B?Z3ZSbndKL1RLY2xlQllPNmFTQWZWcVFmQzNHODByU2RuVUFNWEFZSUVSMDFT?=
 =?utf-8?B?R0VMY0hXd0ZMSXVwMjU5b0hzdTdOM2hlY245L044eTBQZXhPbThwK3IzTk9t?=
 =?utf-8?B?Z0Y4REFrbUVrTzFyYzFhWXZ4RmViYmkvNXUvV0xDNlA1c3htWmdyWlkvTi9E?=
 =?utf-8?B?cmNBc0p1TkZLZElhbzdtblptWWNuclFsU082VlVKaTFhTXR3cTE0d0d3K0xS?=
 =?utf-8?B?WkMzZ29jSGlnNFR2cjJWcWp5RVpBalNkc1hvT3hsL1pEdzRTTFYrZlVwQjRI?=
 =?utf-8?B?bnVJSzMvRkxWZGVRKzNnYytiVFRmbFBDSkRTYUJuLzBXaXVDdmtsZW1HQkFh?=
 =?utf-8?B?L1VXSld6dU9TQTFHU0Vzek1iTEZzZkZnVEIrcUZlNi9uZ3BYUFJISk5Mem9a?=
 =?utf-8?B?NFdPOVNpL0xIemlMa3F6aDBIU3Y0clBoWEtsUFh1WmQrcks4aHFDc0RHMFBo?=
 =?utf-8?B?WE1vbE5QZ0NOMjhyQ0hWOEYySEU1WnNuMndWbE5sbkFZazM3eW1oZE5HWFpX?=
 =?utf-8?B?VjdiWGtjUTVIaXdHOUd4a0pLLzdmYWlzYWp2bEpTMElJcStYOGJaL3Q4dXFq?=
 =?utf-8?B?L25RbGdxUGMrMnlBRmhyN01ITjFSYi95bFRLMC93L3p2VnVQQ3J6NTBkWmll?=
 =?utf-8?B?MEJxa2s3NWs3UERjL0t6bm1BYnNlQUY3bE4waUQycVFNSEtEeDhnTy9wcjlB?=
 =?utf-8?B?SVpDQzAwdGZNNUVLUzdnQnhBR2RsdkdMWG5Weno3Y2JWSURLUlVUVGdNaGl0?=
 =?utf-8?B?V3hUTFNaZDhhQkFjcWJVcjJmaU9MbFV5TDFOTXBCSW5teGlJM1FjdkdtYzhZ?=
 =?utf-8?Q?ba0bg/cnUysojdLclk4hlfLoJlNqKjY+hsh7l+L?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6827bb7-c37a-4a48-8ec2-08d976d4f9d6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 16:38:54.7347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: knZ+LIp2j3M9zbCb3OJPEeKs+IckGT4bfNrlbQcVfzfVXaK6yiRb9Fs7RzZcuXSdKRrFm8lZsnF6oC0NIhER5Y5nvfxY4hGEsZmR7RsuHnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3495
X-OriginatorOrg: citrix.com

On 13/09/2021 17:02, Jan Beulich wrote:
> The option parser takes off "no-" prefixes before matching, so they also
> shouldn't be specified to match against.
>
> Fixes: e44d98608476 ("x86/setup: Ignore early boot parameters like no-real-mode")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Oops.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

>
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -692,7 +692,7 @@ static void __init noreturn reinit_bsp_s
>   * has options that are only used during the very initial boot process,
>   * so they can be ignored now.
>   */
> -ignore_param("no-real-mode");
> +ignore_param("real-mode");
>  ignore_param("edd");
>  ignore_param("edid");
>  
>


