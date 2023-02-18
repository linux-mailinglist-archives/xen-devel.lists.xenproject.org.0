Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A90269BB8B
	for <lists+xen-devel@lfdr.de>; Sat, 18 Feb 2023 20:13:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497592.768479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTScP-00043J-Sx; Sat, 18 Feb 2023 19:11:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497592.768479; Sat, 18 Feb 2023 19:11:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTScP-00040v-Pu; Sat, 18 Feb 2023 19:11:33 +0000
Received: by outflank-mailman (input) for mailman id 497592;
 Sat, 18 Feb 2023 19:11:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Nzl=6O=citrix.com=prvs=40641299e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pTScO-00040p-D6
 for xen-devel@lists.xenproject.org; Sat, 18 Feb 2023 19:11:32 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a30f619-afc0-11ed-93b5-47a8fe42b414;
 Sat, 18 Feb 2023 20:11:28 +0100 (CET)
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Feb 2023 14:11:22 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB6003.namprd03.prod.outlook.com (2603:10b6:610:e2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Sat, 18 Feb
 2023 19:11:17 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6111.018; Sat, 18 Feb 2023
 19:11:17 +0000
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
X-Inumbo-ID: 0a30f619-afc0-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676747488;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=m09+sChu/taZUOwz2kPHBDHeILoObsTC4zhwBIs44tU=;
  b=L7GBKKb7u/InhaVIQdyg1EFbWVw+qFJYeqqBoX3mX+H/s1xTz+z68kzb
   cxB17mcAATnYaDSkQVfLB9euCHcLyxA8ye8FA7WrDIdQmDgTAOHltcRnR
   IdcUGNsTtul30nn3HqGOvr+UNfEi4BHbCtg5X6UGqTNzkHT5BCjpZk+Cm
   M=;
X-IronPort-RemoteIP: 104.47.59.173
X-IronPort-MID: 96987709
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2/VUEaylWn50udoS7Op6t+eZxyrEfRIJ4+MujC+fZmUNrF6WrkVSz
 zYXUGmBM6yKZWegf4pxPYXk8xkOvsLQmtI1TgY5+CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRkPKAT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXNFt
 sIICjURVRy4m+z156OCFbIxr+12eaEHPKtH0p1h5RfwKK98BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjmVlVMquFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuqBtNCS+Lgp5aGhnWil05LBjpVS2CDoNaa20WBdtsAI
 H0Lr39GQa8asRbDosPGdxixunuNpBMfc9tWDewh6QuJx7bU4gCWHWwNRHhKb9lOnMM7QD0C1
 1mXnsjoDzhirL2UT32G8r6e6zi1PEA9PWIEICMJUwYBy93iu50oyALCSM55F6y4hcGzHiv/q
 xiIpiUjg7QYjeYQyr62u1vAhlqEpIXNTwMzzhXaWCSi9AwRTJW+e4Wi5Fzf7PBBBIWUVF+Mu
 D4Dgcf2xP8KJYGAkmqKWuplNKqg4uuINHvAgV9lFoQl6xyg/WXmeZFX5nd5PkgBDyofUTrgY
 UuWtQYP4pZWZSGudfUuPNn3DNk2x6/9E9ijTurTctdFfpl2ckmA4T1qYkmTmWvqlSDAjJ0CB
 HtSSu70ZV5yNEit5GPeqzs1uVPz+h0D+A==
IronPort-HdrOrdr: A9a23:Af1ocq1Fzne6/W7YRYmHzAqjBKMkLtp133Aq2lEZdPU1SKGlfq
 WV954mPHDP+VUssQ4b6LK90cW7L080lqQY3WByB9eftWDd0QOVxepZgrcKrQeAJ8T2zJ856Z
 td
X-IronPort-AV: E=Sophos;i="5.97,309,1669093200"; 
   d="scan'208";a="96987709"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTXtSui4P4Jvi6nUQdK80DAWH1TSS6XbMkOgL2pHIY4P8fNQTQdOavZQQgzDO9sED2VCBCecrecibqNw1YtKYDri5uAhn4TyFuiTTkjT/hKQ35Th2VPXnxxKRBkoY6AYtWfDJcGeifoEtZs7qwA7+bFAGfPudTPjRInWaBOXB373l1zmVQ+N6xtRCy20sz3vBoq4fGybXE50ZiRO3hhwFzaM6GYov5doios1o2ql1/bXtnQjjlmYdS3gEEqkHP0B0nNeL7JRFWHJRbe0q2CM93TkMJ2yj8icLWqIkIutWwTTkIqRPSW5c3dpHSXHwqUVOa3uuJfr6TgMUDkxSrF5Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ay9h2B4DVwja92DdxSojl+PwNUsZERM2YxWBKBJ4DAE=;
 b=S9Z5iyKaqaWxYh7XsC6ze/rhzkPVhmnMMx+5PNN60VcFfiUWJcQpCYJjMeHVj8bx/HWXG0Ac6qiS/N/ZEKDZaR21imTQKa6KUt68lncbCYx5rm4ZozdTIRUw1ykeiw7dQ8NXZxUG5/DCPyDE9nCNvj6/CA5VwfgceD2un3M3DcuUtgRSnYwqQRBaU83gr80yVArrOn854HTb8NkNhFDYYjqqFCN0Wt/K6AS2uXv4xKqTSlUspUkpuN3egnJ/jzUihU2/ypxWFNhMAZ4BBemt2rJYyWe4v9OoB75bINMq8lLDxIzMo2zVnRGs0N7u/rJTzAdUdN4fmfAMfsJtQ7FpTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ay9h2B4DVwja92DdxSojl+PwNUsZERM2YxWBKBJ4DAE=;
 b=iIDpfHAAebM3sAyDVQLULLpsnQtjv+Byx4W+XYol1Xdmq1Ld8/Ynea4HEXFR+3BKV9j5Y2NoML4m3/T3/fqP5ls3IPJGf4I6m5nCv4Uh3Hp1YwSm1bgfjw6naJu57GmNIBDGi7zeDxDuOEahrIlmDX1YYCbdZGPFjlLRKj3NwMo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <656b29ae-e64b-29b8-0a3f-f02c5432b87b@citrix.com>
Date: Sat, 18 Feb 2023 19:11:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 2/4] Build system: Replace git:// and http:// with
 https://
Content-Language: en-GB
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <cover.1676668922.git.demi@invisiblethingslab.com>
 <0aaad173b15304e2ab00749b4e5ad79c6e111589.1676668923.git.demi@invisiblethingslab.com>
 <Y/DcSVAokXuvM1Dv@mail-itl>
In-Reply-To: <Y/DcSVAokXuvM1Dv@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0444.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH0PR03MB6003:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c16c9e7-6759-4e69-657b-08db11e3e90c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d8BsKfwPwo1GKSy78aiyH+/vLj9DoTABOgekDiqX6ooOT4zK1Jl+DoBIWnMtNInXEsgd5ACwFlAMqC2vQHj6J/ni7QXzw/4uKXGWv9Z1hg2h/A+OPKt3wyuuomswwV6kfs4G7cNglfDiEu3yKT8rg4otVm7r8D32FhFv8AgWcOZcjPzBb/zhxUldkJsKbHOp8LSC79cT06DhJkKhEhdJZTBdR/GZRLdm5gu5UDogFE4k4Fp1Su6Q3d4EshYn2YosicM8T/icoH+fyDI4jUohFQpi+lRgWAuNHN0xG0BMHgxmPvdOIgYFNzmtftU3dDeQwPo75lRXf6nFuZQ+5UjuXPGmuJDko9jbR3UfJsnu1Nu0quz2oOrPl2z5vL9RpHLyphChOh0FL8L5HiGjbnHsKdBonAePedGqIPvECpi7fYIYFnvc2FOsdRPBJUvWPeRUyoI9dq9VUp7h5qSvst+0hlHF9BAxTZP5u5QhouLnPHN9husUNph90RLkJgG/XX0N8kNm7d39AQLpNsktyowzkliRYwc0srQs0vSz8H3pvjPkSUaJUFqR93WWumewNCdBQsQfMHNLMTanPKfI3VQfWcj2pFTOFcaXaJ6Ct1el9QGEVHgo3W88mQXIUzwB2l1gnyCFGFygmKnFMoCdvEbBnJy7gptZTr5tWDbmwcnUVfL3owlaBhCAzSW9fiIjhEQXV4wBE4dPVJrMU9vU8mlDZ6SfL/mFpINVTwhC+vdj+5tR4kVsqJQJsr1DrmEkGfqdMjlzgZsLiOjFC95q/woKkg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(451199018)(53546011)(6486002)(478600001)(26005)(6506007)(31686004)(186003)(6512007)(2906002)(2616005)(966005)(66574015)(6666004)(107886003)(83380400001)(110136005)(54906003)(82960400001)(316002)(66946007)(66476007)(38100700002)(36756003)(66556008)(4326008)(8936002)(31696002)(41300700001)(86362001)(8676002)(4744005)(7416002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmJucXMva0RUeVF3ME5GcXJidk5TWE5yOXFqTEtrL0JjYnk3NWZuUHlHVlBo?=
 =?utf-8?B?Nmk3MVBXRG5EY3VNbHpGbXdvdDR6ckxaOW1uY29zcjdjUlAva0lzMTIzbUZJ?=
 =?utf-8?B?allsd0l6K05wY3Z2UmJSc2wrd1BrMXFEZlFoTFZYSW1CRXNlbHRiazRBa2RR?=
 =?utf-8?B?RmcvK0E3N0tXU0ZLQ0IySU81Z0xyTEczQ1cyemk5UnF0Rzd1M1k5alVMbmtI?=
 =?utf-8?B?MGhMVU1FN0l5a2twZU4zbkFzcUovYTZYVVg3aVh0SldIQjU5dnBpZ096c2xo?=
 =?utf-8?B?QTg5dGdtWEhJYmNRckdpRmVRYU41cThGOGlOWEpKWmd6SHBaOWIrSFd4d01H?=
 =?utf-8?B?QzdraDREejV1b2lIUjBKZjArWDNuWXdaelZLZVVUY05PeHVmamM1WXJXMENz?=
 =?utf-8?B?cmZKT2RRQnV2aEpiQUVneUJrMmkyMUJUTTJnd2pFZDBBV01TSUZnNkd5ZFFp?=
 =?utf-8?B?VnRUNkt5WURRUkpoSEQvblplRGtIU2V3U0JvZjl1cm5HUzd4MmREamtuRDAz?=
 =?utf-8?B?b2RuL0crSE5mSDNNQWRMZ0lieUxwMjU0OUNIVVE4Wnk5bUFEVnBJY016dElU?=
 =?utf-8?B?WE45cGZQbVVxQTRBcUEwN1lETk92UEFJTUFITkZSQ245UEFLUk1JcVNQQVhy?=
 =?utf-8?B?SnR0Zjh3Sm9pbElXUnRPWU1XTFlKbFZ5SVQ3T3VzNDNoTUFqVTZFODFQNjRQ?=
 =?utf-8?B?eXJnY2VXclE0TU54ejVyc3Z6T0VXNTRrdFhTbURoMjJldE9pcldrWTBuTzJJ?=
 =?utf-8?B?Rml6c0JMbzVPYWtITGgyWndQaFo3NXlmRUpVL1lRaVhCSlBVQWtaUEdZUThU?=
 =?utf-8?B?NGU0TEFpUkZPM2tDWjh3aFgwNTR0S0d0UURmVnU3TlNwTmZ1cExIVXJ2Uk5O?=
 =?utf-8?B?TERJV2gvTUxESTl3VzN6QUxveHhiUTRWcUNwU1JoTGU3anRJZjhzQVlMbjVp?=
 =?utf-8?B?UWNvc3pnQTdXVTRTdlZqdXdrR2greVBoRzc3MzlkYldha05BcTdWd1hhb0RE?=
 =?utf-8?B?TE9KU3RnVkR6OXJmMlRDVGpNTjZkM0lOL1NTSldOMXpLb0VDQUM1aDJQNHhN?=
 =?utf-8?B?OVpzekFLcnlMYUtJQlFaRGk3YytpeGNuNmhyNU92Mm05ZmtYNGk5N3Z2WlBR?=
 =?utf-8?B?UEZnS01PT2FDa0h5aUZNUVo1UkhrVEw0L29sY2RZWFg2Q25IdkJXTUl5NHRa?=
 =?utf-8?B?UXFnV1lUZGhoZ1JGMlQyVmcwek5KTEhnRU1rTzhEbk94em82OVFIMG4zZThx?=
 =?utf-8?B?SWJ2SjlpcVhzdE1UWFdBUmk2cWUvMzNNSm51U3dsNFhRby8zd2NPSkNUNlVJ?=
 =?utf-8?B?NStSdERrUGRJWlk1WUYwNWttaFcyL2t2aitJOU5ZYWZxQ3g5cXptRlIvVkY0?=
 =?utf-8?B?SjhFbXNRMXc5WEN1ajhtaU1uem9adXhrRjNtL1dLRjhtWW85NjhvaUZiazNj?=
 =?utf-8?B?VCtYTVFyMWdnTWV2UWdPN1hqUXQ5SHJ5VVVMendsSlQ4dlVrY3BQOExzbGhK?=
 =?utf-8?B?ejFma0psRnVjOWFLQkNkS1g3RzdBV3ZNQVcvNWRrSDNRdzdHUzloNnFKWHJR?=
 =?utf-8?B?bmo2UmdmRlJsb2hYUDFpS3dNUFdNTmNFRlBlQzJ3OUNnTVh3dGR2VlNaWUFm?=
 =?utf-8?B?c2hleEZjWXl6NE0xRDhHWnFiSk9vTEZiVnhtYmVLa0dscHlPbnpRR1piWldv?=
 =?utf-8?B?a3RORDZjY2hQOGtUYUlhY0tvcnREWDVRT0gzdTlXanRITFIySldiUllvSEE2?=
 =?utf-8?B?ejVMcjU3WVg2NWxvV3VVTkFRdWpWYVB6dnhEM29FVWlSbk9hV25xeUJRWnUw?=
 =?utf-8?B?QjBwQk5WdmlQbTdnMHhkSGV5VDFJRXZnb1NDYndocVBvNzNNNjdXaFFNbE9Z?=
 =?utf-8?B?TGVZVytXditUWklyY1ZabmFpWUo0Y1U3SW0yL250T0ZHcGVpVENSNkZ2RkpY?=
 =?utf-8?B?S2s1TS8rSjZVTmg0dExGNm81d0hNTDlpYXhRbzJEY1lMWDR3Y0hXVnVUbGp4?=
 =?utf-8?B?ZHhISnphaHdDOTlOZlFUOW1vVnhMSnFZQmRsWDNMeDBTY0VoNHJNbk9PUnNE?=
 =?utf-8?B?SXV6RjlEckRFc0c5Zk4xUnpnTFdBSUdSRDFzeS9Cd1gzQk5HVngwUHdYa2du?=
 =?utf-8?B?RDZLK2t6b1dwUmdpQlA2M1FZcmNOWGNTcWg4TldwWDk0L1VORzJyVUNDWUh2?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?ODhYUHcrdjJrbWg1WGxIVDlqak4vNkJKblJORjJHdkZFTlNiUkhCUnFJYWYr?=
 =?utf-8?B?bU5heVpQRVJtYnlqYjlwYWpjSUJpMThGNnNpSkkyckRDSW04d2cvQ3Z3Y2Np?=
 =?utf-8?B?ZGJieldKOWRVNlRoUERMRUlrbUQ3elpobTl1NXBEbVVaa0ZNTnFweUZkRU1B?=
 =?utf-8?B?RkZBUzNTeUtzMWs2VjlteENZUC9LbTBOMitma3BscVBTZ09BQnU2aXdFQi8x?=
 =?utf-8?B?ZGhCL2lwREVNajZEM2J1S0hrL3l2MVFmNFZ4K2d1OWtPQm1Ecm5XRWZUTnN5?=
 =?utf-8?B?dUZrT0VxYU5GeTNjNVJpakZLcUowcFFwK3lwSWdNME5zdVhMaUlybG9pZ0E3?=
 =?utf-8?B?U09waDdheE10a0xRSzZCQkJITTZ3aHFpNFBLMHJEU1c4TWtxK3J6YXVyV1Yv?=
 =?utf-8?B?bWUwMmpKUVdLK2lXMUtWOFN3bTAyMUtEcDJxeU8wZU9iSCtsRHF6VDU3WUxS?=
 =?utf-8?B?OFV6am5xVUpVeFI1NWhIZjZpeTZuYkc0VTRFcENwajhmL2pVT3QrcGVDazNE?=
 =?utf-8?B?dmF6cU5WREhZNlVSNVhXVUQ2V3NWZHErNjlUb0MwTXE3dHR0RHk4dEl5NGtS?=
 =?utf-8?B?dkozQ0NIOWtHVG9aSDdqbEFGZi9DK2gzbmJJQVlWU1hEQXF0NFcyQmw2Vnc4?=
 =?utf-8?B?aGdjNGQybVdhdEJvenNtcm92NER6Z3BCQk1zZUl4djdBV3h4RmdmMHVrR2Nk?=
 =?utf-8?B?S1VmRnZHUEIrQlZDcEtqc0VoSERRRHFET3AwRDljeGVDRTRTTENCVWpJVGRT?=
 =?utf-8?B?cXZhbUhVTUJraUFQQlR2SVI2TTNma1ZtVmJvUDQ4NUZtZ1c4cFhMYkI2dU94?=
 =?utf-8?B?eE15RkJvU1FEcFcvSmN2eG9jNktYbnJYNTJvV1JRYVBLci9RS1dvNGErRXo5?=
 =?utf-8?B?QVdqUmxCVjFyOXNWWU1NYXIveityTnBFNkNuQm5oakJ2THhJUmM0NWZaWUcy?=
 =?utf-8?B?N05SejNkSyt1V0lhRUFlNHRidVpDcWc4VXhJUXJFNVI3UkVKY3F6RStsdE9q?=
 =?utf-8?B?dmg0UHBoUzUvVVZCb0F5dEdRNm9IVTdVOHZaUXFkMmVkZUIxZE5aSU8xcndi?=
 =?utf-8?B?a0JSeHRQTmRBS3V4MkVWY211d0hTUXFPVG9Ed0ZRazk4dzBUdGUvbjRFSW9t?=
 =?utf-8?B?aEY3TitWTTNUblFnS3RPNHVJZUxTdS9mZ21qSVBUMWhpKzQvZ3Q3WjIxUUw0?=
 =?utf-8?B?MnVjam1yQXFxWmlrL2NvS1gvUnY2NmJRWmhxZDFaQ05zK2JFYTdlTy9rSzJJ?=
 =?utf-8?Q?q0mehrXE6qYa0qi?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c16c9e7-6759-4e69-657b-08db11e3e90c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2023 19:11:17.1802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: El76cS4Ny6+KqDBIA6LaLvVfVw++PvOhyh9e3X/W4VYzfRK3y7QVPMXv4fuUJdQCXT7AE8h0ITtlG2WQePXsoHIdpG6t6xdm40LDdxCSsvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6003

On 18/02/2023 2:10 pm, Marek Marczykowski-Górecki wrote:
> On Fri, Feb 17, 2023 at 04:35:25PM -0500, Demi Marie Obenour wrote:
>> Obtaining code over an insecure transport is a terrible idea for
>> blatently obvious reasons.  Even for non-executable data, insecure
>> transports are considered deprecated.
>>
>> This patch enforces the use of secure transports in the build system.
>> Some URLs returned 301 or 302 redirects, so I replaced them with the
>> URLs that were redirected to. 
> https://gitlab.com/xen-project/patchew/xen/-/pipelines/781679811
>
> I'm a bit confused about debian build errors:
>
>     ERROR: The certificate of 'xenbits.xen.org' is not trusted.
>     ERROR: The certificate of 'xenbits.xen.org' has expired.
>
> Is clock on gitlab runners (way) off?

https://lore.kernel.org/xen-devel/20230215120208.35807-1-anthony.perard@citrix.com/T/#u

~Andrew

