Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A55DC706E41
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 18:36:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535987.834093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzK7y-0004Fb-43; Wed, 17 May 2023 16:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535987.834093; Wed, 17 May 2023 16:35:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzK7y-0004DA-0S; Wed, 17 May 2023 16:35:50 +0000
Received: by outflank-mailman (input) for mailman id 535987;
 Wed, 17 May 2023 16:35:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bcLS=BG=citrix.com=prvs=494da41bb=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pzK7w-0004Cv-Us
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 16:35:49 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dea59238-f4d0-11ed-8611-37d641c3527e;
 Wed, 17 May 2023 18:35:46 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 May 2023 12:35:39 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB7025.namprd03.prod.outlook.com (2603:10b6:a03:4e0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Wed, 17 May
 2023 16:35:36 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6411.017; Wed, 17 May 2023
 16:35:36 +0000
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
X-Inumbo-ID: dea59238-f4d0-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684341346;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0SyM59uUnoDGgit4MFxQdLL7NoG9wRKMP/uGRgHznFw=;
  b=H1AQjXGcvch8IoW0URrzJseoWoz1AU+wkdEAdkqZaiyvlVXTqwh+VFxV
   kx5jwi9cSHbumafLjRGSd59i26CB4J4JCrUTcTrrm8xHgnhuSNP127LSY
   X+OSjx0xYmqpY28iOwIqVGjpwnfz4gX7X4tB3xVnf+L5r/3lqD+C3iIhF
   M=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 108157302
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:YiAh4qBf4vHKlxVW/wTiw5YqxClBgxIJ4kV8jS/XYbTApG4i0WFRz
 TZKWjyEM/7fYGDzeoh+Oo+39EsGupXUndUxQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G5B4QRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw9+l5IWoe9
 tUhcS0pQyu+o/6X7umQY7w57igjBJGD0II3nFhFlGicJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9exuvTm7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraXzXqmB9lKTtVU8NZHpWyRnGUNTyQNfniYot+2yR+gXfdQf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmSzoLE7gDfAXILJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaBMQOBWoLZCtBRw1V5dDm+dg3lkiWEIclF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9fABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:OOHocaMZ3JdMOcBcTuqjsMiBIKoaSvp037BL7TEVdfUxSKb0qy
 nAppgmPHPP5wr5IUtQ4OxoW5PwI080l6QU3WB5B97LYOCBggWVxepZnOjfKlPbehEWwdQtsZ
 uII5IUNDQpNykAsS8h2njfLz/8+qjhzEl1v5an856yd3ARV51d
X-Talos-CUID: 9a23:EQIPzWzJfxZo6uR4hWagBgUZFc4FeS3e5U6JPmuVMltNVJy7EnS5rfY=
X-Talos-MUID: 9a23:SwgBswm+49SYYQ5jpR35dnpPEfZqua2wT3kWurYluO+Ldn1uPRKS2WE=
X-IronPort-AV: E=Sophos;i="5.99,282,1677560400"; 
   d="scan'208";a="108157302"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FrzuNqSDQwTiyJR0Xca5+KpImQeagVAe6bJwqwu3B3WJ4Z+kxVsoODqhsa78OMHbAZE067UeJCeA6mmYnHYEhelDrJR5ryFouPES5joZ8W2qAYm/XnmHXfHYZHCFdV4q2QQgzdxlAyhNmBtLBtaQ5shATbqpKA+7OxhsYwWCXFpQ2tvMXfgVwFQu1jNskkiJAcVtaHd0WFNYYZVgNpCmblSkcieXF96wE7bXNoD9+iM66CFWDE8/Xi3CnlISUiitAd7v5+juaV2646W2C9Z/nRkoQ5LpkxJBgD1Xkm/AdKP6g6NUxsht/pg8Ig+dLWlnXsTyNHc4qSCmWxG1n/+rbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3/3VgeGMLkGH9ftmdBlOkYGQeKv/FVRHweKMHlJM6k=;
 b=ETmcCeMJR3EMyCKxc/ZGOtDHn0TFAIGj9ld+oTT2448Z30o4j1byBbTLMWth2zaIfU0ByEfiE2lMC6bcbS0dUPpAfDo+T4YhBoJt7FI38tMmnHS/WGmSLmQKPlBiPJ8FmfmT41mJWFOMPcoNiN++t+aRelrF28PZH5Vqalkh66Ne46bB6JPdr5ew86xWLjPeKZMOc9plCNRPpqRBIPa9JWdUpy4XOchr3zlScSj04dCSYlnaDh7woYDsvZSi0LMO5wC0uvcnCZ9j/HPEUbalUGcwO1yLnhox+foUi6hVFjNcrRFaG/gj4Yk1aN/gnGwBSfudsrTiiVmvFbbPjs7hhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3/3VgeGMLkGH9ftmdBlOkYGQeKv/FVRHweKMHlJM6k=;
 b=dd0ZZaf+VVHKz86bxW1a7VydVOnosHiVe75P9Iob3AJTEF8xwqRhrWbKmpTyQxXpSin/Q6zYjzF95M0pXXei76XjyxBc52bpdbmRJTnAuOhY02DT0MpkaKmX226cfK628fuwkDPXCad/UyoeWVXlRWxKyHdROxVIqxTHAvmfCd4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <42cd2479-1eba-11c7-26d8-441045c230ed@citrix.com>
Date: Wed, 17 May 2023 17:35:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/4] x86/spec-ctrl: Remove opencoded MSR_ARCH_CAPS check
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230516145334.1271347-1-andrew.cooper3@citrix.com>
 <20230516145334.1271347-5-andrew.cooper3@citrix.com>
 <1d06869b-1633-7794-c5c9-92d9c0885f19@suse.com>
In-Reply-To: <1d06869b-1633-7794-c5c9-92d9c0885f19@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0481.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB7025:EE_
X-MS-Office365-Filtering-Correlation-Id: d9e4d9f5-068a-45a2-78cc-08db56f4bdc8
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3NM87js5DUC4iHPkUrqYBqmyZhxpAEB5A76UD/JoJXZ60PK1CyYJRQg5e2nrPzpy/P5SC7KixJDWDWx6aqT7ObHmepfca1QJZ4dEHD74SDXTnnTZAQcojt7Uwua40CwEMsqYnbsym9zgYy2KUDt67qN82IEOUzQwdRLCs2Lg/exDkpI99lC1vp/cyLvyNBRRqsWtcLs2WU99ZVIjsuAVZH+zwK9sW2ozGlZHcrS8AAEeYJUMypwwMFYRKfaPRYB1RsS31wilOWZILjwRJqER3vgUPUja1XLQfe2OdukR0fWXa/LazCdQgA2FMrZWbVuuw0/Sxct3xyblY6Vtr9PIXoNV7oBmAnNQOgHuczet6RafMMneJ9L+ydB+xsyrkhznWFkvH/BOtmNqJtWbSO0jt2pC7jKKegIN/cbAT/cOsS+eLCxcl+eqTPQOy47KWaUoDB4IX0Tvigr+iTo1+UmCXvn3PzfyLDx2d4ZXjGJCpW8H6xyJm3HEmj2c+IM4LxahplAxZiFB4jQHbYiMJRuv3LTpHm/SYbS4oHpi1qveqCCuGTvrTa0vG0hAkSX9NdeON8fuvp9Y9VbaToO2t7YjSdSPv71lJ0rbqSFyKY/6wRcJ6WhIDPBm8TVeSwvTZAZIz7ephEFb29eBMTYYSRWDRQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(451199021)(83380400001)(6486002)(54906003)(478600001)(2616005)(6666004)(6512007)(6506007)(26005)(186003)(53546011)(8936002)(5660300002)(8676002)(36756003)(41300700001)(82960400001)(6916009)(38100700002)(66556008)(4326008)(66476007)(2906002)(66946007)(86362001)(316002)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1JoeVJ2TE9ZYkU3eE9ITXp4b1NPemozdUVucGxkdWhMd2Roc3Z1UkFXTXl5?=
 =?utf-8?B?Z2pjZDFhazMzZ1pxZWtkdStpeTEvcUg1UEp3d2ZnZzd2aDl2MlNXWmlQc0RO?=
 =?utf-8?B?OEw1ZTA2VzR6RENwQk1tK250UldwcURrK290L2Y2NXNpNjNyQkg0UHNPeDRL?=
 =?utf-8?B?czZhUGhERGFlZ0FDUnFLSEFzMnIrc2ZwYUxDTGxFTUV6K2xlWml0YXFSQ1Rt?=
 =?utf-8?B?RzNCQ0tzS3pyV2J5ZVViVUozRnRiSDBRbmJtb0hLa0RJMDh6RllzdEM3Tzhl?=
 =?utf-8?B?MHVRUE1wc3JseUFCRC85ViswZXlmM25pRFVFbVFFWXI1dm9DS295ZlVFcXlS?=
 =?utf-8?B?eGo0ME1neGVSaDB5UE03c1pMbE0yNS9tWGJKS2ozWm5PTmlzVkhOQVNJc252?=
 =?utf-8?B?aU8wSjBkL254cVFuWU9CbmMwQ2VGaUI5eGkrc25hYTVlemFVeWluQjJGMXNP?=
 =?utf-8?B?OG9aaE5YM2RsTktPOVVxN1AwRU8wZnp1Tnc3eHljeG5tYlBoR25XZGJqV3Ni?=
 =?utf-8?B?eUJSOTRUT0NtN2FiZ1dPTWh3QStOam9leUZmTUJxWTA4OFh4cnRFQisvTlY3?=
 =?utf-8?B?NDlVSHBSZmxuSzhoSXNqTDhWblBXOGV4dUIyaEw5K3UvU0Q5aUtjYnBGbzBS?=
 =?utf-8?B?a0Q2VzVWKzRSczBlR0JkNnlsNjNCYUxxVWVEbXQ1UklUMTltWkRWNmhuTTBi?=
 =?utf-8?B?V2I4b0hxSnpDQWhQRjNTMlNJQXA1SzBqUVEyN2dJRTR3cXBhZ1BLR09kYzg3?=
 =?utf-8?B?N0dzZXhIbG5XQldJc1FDZWQrUHpIV2NobnJnYXlRNHp2Tmd4Y3Y0dzJNVDJi?=
 =?utf-8?B?TnJ3VEhLdjJ0T2d5ZVZwZFg1ZllTangrRGllU3R3YzBOOUNPVG5VZGR6ZWRY?=
 =?utf-8?B?TXdjM1A2cFcyUTQweWlZZzNlZjZWd2VUV212emN0QjRaa3dtWFQwb3BhanBE?=
 =?utf-8?B?R21xVGJrVUdzdWpUYXR4ZUt4dDE4bDZkNEhuU042K1VGUXp5TnpselAyUkEz?=
 =?utf-8?B?ZmFEZEthN1lMWHdpeFJiU01HZ2c0Mm1zcUwvL0dmakFGRnhCWVFKZVQ1cnlU?=
 =?utf-8?B?RVdCNjNicS83NUNDUXdlelU3Z2E0SWJoaE1iaEQwMU5yU2JMWWNlUVhza1Nz?=
 =?utf-8?B?SDZ5UDVMY3ljZis5b0czM1JKbzRhN2FyUDRGOXdMV1Zkak9MY0h2QkRjRGxT?=
 =?utf-8?B?ZlJadS9mak5XVHRJSlRVQW9Pc0FrcDhabW9pUzBxQlV1VEFCTFJNM3dyWXNh?=
 =?utf-8?B?ZVJ0bkVVa0xrT2Y4TkVjYUphV1lOaW9UcDRuUHJ2b0RWSnNJT0ZFL0JSRjAr?=
 =?utf-8?B?ZUt5MWdzaUsrY3RETWZqYlU3eVBkWHdwQTI0K1VELzNXdU43bndLdWxzT3pk?=
 =?utf-8?B?TnRDV3JwYzNDYTZLN1FKeVUyaDFqME1IL1NybzhvTVJjMmVMeW5XTk9PeHpK?=
 =?utf-8?B?ZWVlaXR4WWRVaHJPdmJNZEhNVDVxQyt2RVllL1pnUWIxdjdTSEZLZHNzMEsz?=
 =?utf-8?B?UGdieS9TZVV6RWFxRzFjRVI4Qk1BQ1Q5MDJUUUl6ZXVrWWFMUHZrZXo2UU1S?=
 =?utf-8?B?NE9TRlhvWmMwTkszUk9oVWdyTitVQWdiRm5YNkpEUndFeU9nQTg4UlMrYUVB?=
 =?utf-8?B?dndnN0tycUVGVFZmK0c2aFJQVXE3c091WG5saHdndDkyNk1NRnlxSTVuODJy?=
 =?utf-8?B?SVRHYi9Ya2tMc3k3bnJWendLRGNVdUo1QXY4c2kwY05lVHJyM3VheFFqaWZ6?=
 =?utf-8?B?SE1aZlZ3cVZKcHJIdXp6Q3IxSzlBSHY1MUF5TCs2UFk0ZWYxWXBuOTZMdm03?=
 =?utf-8?B?K04wUno4cDIvS0o5T0E0eW9LdFJqZU5kSHFBb1VCR0dOdVpieXp3N2pqN01L?=
 =?utf-8?B?QnJESmNFamdNK1ZocU9Dc09hTHp5VFhDQkVWcUt6Z3N1TncxYXovWjIwTUg5?=
 =?utf-8?B?Q1plUk5jTnhxd2MxNllObG9zMkRtT3duSTN2MmgyaHYzbFRTRVdjMGJNYnVt?=
 =?utf-8?B?c0E2ZFJXQ2t0cXNCVGZkZjBOSTJaSkdONDEwc3dubEtFM3d3R2dVcmYxQkNE?=
 =?utf-8?B?eXpOQTZ3TDFGMWJXR2dxQmhXSHFTV0pZNzg4UWFreWpycW5WUVZBdXkzU21Z?=
 =?utf-8?B?WXFoN3UrWUNvQ1JpVDJhRi9sV1pJcGlCdnJ0eGNoM3dYSHgwUHFpYTk0SDl5?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2A85JkjyIAJECBHdzbl1/+BtkV28EiDHhPozcgh8cz3uz3kUjAH5YIjDoyg9MNzjAD+Q5zA+O+Pwa1ic3CEoeZGnvXGf+eU4MTq8enD1GdSQ7k7HYabUODzf3gKRZu3IIFyE9BRL+IcUd1whL1eH9boyZYFFnflWZ+DI0P8pe/A+N/gPCSd2UIb9/dRzH4Jd50r/qTDJo9+njAhdx8gteKgnXMHVvGL7XK/lGDdfh/0KuCRwfo6J+EXsevTFFSzU5M/Tj6YftpDpN3vipQ8d2GfsmHWlkTTBwsHF6fC9SEvWZMwKGSVfKn17pzqPY2DAjt/8+oME27r0WQ40E/l4WnkcpDODNflZLu6ka4oWbHor7tKWMIKZzKP91uxSjU2J5+cFqavXBlGEvNHsOscLZ05MITdUejxhXN6Buwd6DmsCQRx6lrNuLnmAVP9QEzNntNxZCONVNNnO+Gfmnj2IySuAYTuGYFSowoPbs5sauv4b2dTL2SfGRVulr6J15duRX8Ra3ksYk100tZU9OSk/HRutijOvQubHZFVhf3/41KOYJrlXcmMM5RnG+JhKiQdNawR24ZrXQfox53U9oBr7TCx/K+MP7SJ8/mvE+b8a443a3AKDPS/izVXik4pZtMj41MD/EDx2Wa2zOUPVg9AA7Bi47pIK0yhdmgqQIvvi9jmM6S+wnToxuOUXRzCZ+Lhw+3WZMIOe65aPVgetBEh+PsNhlBHWbYsA2vq1GoUxRTpfOvXkTS1r6pSvMUV8nXOgS9XXUPikxR/UcChS+nqX4FiXfQLTthiKoZx9FTxUEqYrXSwAj0tUEMiMaIl8poe/
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e4d9f5-068a-45a2-78cc-08db56f4bdc8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 16:35:36.3480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p6WFW8RA+rVdyJ6x0KRJwBoe0QKkbNuC0hsVDzJOwMZj1fgJU54MDCiA4CH+8ggJoPbLW2dtxMWLS/Je6UdSB/TJwF5k1bIhxXPoqeBA9Ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7025

On 17/05/2023 3:47 pm, Jan Beulich wrote:
> On 16.05.2023 16:53, Andrew Cooper wrote:
>> @@ -401,6 +400,8 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
>>          cpuid_count(7, 2, &tmp, &tmp, &tmp, &_7d2);
>>      if ( boot_cpu_data.extended_cpuid_level >= 0x80000008 )
>>          cpuid(0x80000008, &tmp, &e8b, &tmp, &tmp);
>> +    if ( cpu_has_arch_caps )
>> +        rdmsrl(MSR_ARCH_CAPABILITIES, caps);
> Why do you read the MSR again? I would have expected this to come out
> of raw_cpu_policy now (and incrementally the CPUID pieces as well,
> later on).

Consistency with the surrounding logic.

Also because the raw and host policies don't get sorted until much later
in boot.

> Apart from this, with all the uses further down gone, perhaps there's
> not even a need for the raw value, if you used the bitfields in the
> printk(). Which in turn raises the question whether the #define-s in
> msr-index.h are of much use then anymore.

One of the next phases of work is synthesizing these in the host policy
for CPUs which didn't receive microcode updates (for whatever reason).

There is a valid discussion for whether we ought to render the raw or
host info here (currently we do raw), but I'm not adjusting that in this
patch.

~Andrew

