Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C2D709B47
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 17:24:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537162.836033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q01y5-0002Hj-MY; Fri, 19 May 2023 15:24:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537162.836033; Fri, 19 May 2023 15:24:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q01y5-0002Ek-J4; Fri, 19 May 2023 15:24:33 +0000
Received: by outflank-mailman (input) for mailman id 537162;
 Fri, 19 May 2023 15:24:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9pCJ=BI=citrix.com=prvs=496ec590c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q01y3-0002Ec-Or
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 15:24:32 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3de87cb6-f659-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 17:24:28 +0200 (CEST)
Received: from mail-dm6nam04lp2049.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 May 2023 11:24:17 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB7003.namprd03.prod.outlook.com (2603:10b6:510:12e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Fri, 19 May
 2023 15:24:16 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 15:24:15 +0000
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
X-Inumbo-ID: 3de87cb6-f659-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684509868;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hpnx/oMSOpf9eRJO9qIixDVv1lS7/xn+mem9fTZbvho=;
  b=a0kTAr4Cukn6g4v8QcsyCNfgjH/ZtyYRRTaJ8MlugSg+YmS8RXS1+ZvT
   hdQX/izcsW9zuxbOKhWmH3BudnUpwo2kOAm4K02pNfSTJlH3yN1JZRpiG
   GPMyN2gIXA7vrYv6zvF7yqLHV37bwKncTTQt62F8PA/1ZnaZaVvPPZtji
   Q=;
X-IronPort-RemoteIP: 104.47.73.49
X-IronPort-MID: 108433237
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:UZDHm65MjjnNsj6sghAvQQxRtBXGchMFZxGqfqrLsTDasY5as4F+v
 jAZX2uPO6mDMGv2c9tzb4zk/B4CuJSGxoM1SABs/ig1Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35JwehBtC5gZlPa0S7QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mq
 PopCBxSbSq4naGw0OiiRfBThtYkM5y+VG8fkikIITDxK98DGcyGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Ml0otgdABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpCSObjrKU16LGV7lIRIUMQfwHgndb6pGGjA+9QC
 UUO5BN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxmdLngJSHhGctNOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgc/iTQsSAIE55zvpd81hxeXEtJ7Svbp35vyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLztKkowFqxJrVZg
 EU5pg==
IronPort-HdrOrdr: A9a23:hIXrD69tdZxNQnfTLc5uk+HFdr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwQZVoMkmskqKdhrNhQItKPTOWwldASbsP0WKM+UyCJ8STzJ856U
 4kSdkENDSSNykFsS+Z2mmF+r8bqbHokZxAx92ut0uFJTsaFJ2IhD0JbjpzfHcGIjWuSaBJdq
 Z1saF81kadkDksH4yG7j5vZZmwm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjsOTj9Vxr8m0G
 7d1yj0/L+qvf2XwgLVkza71eUbpPLRjv94QOCcgMkcLTvhzi6ueYRaQrWH+Bwlve21714usd
 /U5zMtJd565X/9dny85THtxw7j+jAz7GKK8y7UvVLT5ejCAB4qActIgoxUNjPf9kobpdl5lI
 ZGxXiQuZZ7BQ7J2H2V3amDazha0m6P5VYym+8aiHJSFaMYdb9qtIQauGdYCo0JEi7W4J0uVM
 NuEMbfzvBLdk7yVQGTgkBfhPiXGlgjFBaPRUYP/uSTzjhthXh8i3AVwcQO901wg64Vet1h3a
 DpI65onLZBQos9dqRmHtoMRsOxFyjkXQ/MGHj6GyWmKIg3f1b277Ln6rQ84++nPLYSyoEppZ
 jHWFRE8UYvZkPVD9GU1pEjyGGNfIyEZ0Wu9ihi3ek9hlWlL4CbdRFrCWpe3fdIms9vQfEyAJ
 2ISdVr6/yKFxqbJW8G5Xy5Z3BoEwhsbCQkgKdLZ7uwmLO6FmTLjJ2sTB+BHsulLR8UHkXCP1
 AkYB/fYO1902HDYA6MvPGWYQKjRnDC
X-Talos-CUID: =?us-ascii?q?9a23=3AUqqPmGvVsLxJXSfAH6DSZV//6It4dEz94CjTGXS?=
 =?us-ascii?q?iSmB5EqSaUGCQ6qR7xp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AASFvWA3AuG4GLREtPxjzki5biTUj3aaHVkYny84?=
 =?us-ascii?q?6lIqqGjEoBji/hS6pe9py?=
X-IronPort-AV: E=Sophos;i="6.00,177,1681185600"; 
   d="scan'208";a="108433237"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HkWfVYTjbq8epxVTY/cT7C5jrROlxxX+VD6Rf2puIOaIB7hDtKCmkTMnXAEWd2Fdqt0SQdtcnKn1Nry0zp3m/I+ZRTS0zVIkvt0szQHtmN13lz+n8IzYxWcI5oKb8TQMYHc0zNOkjqRS9CY934XlvZYP4sGN3slpMwKWvOEVMbp0uWQCPaAjk2ObOrXmrPeQZN9bhtrJcx4Fy6Gsy8TNY9mqH0Da+eV5tcDH75FkTqv4Jp6QNPdDb8MDGju1fVLNY9AY3mA8ITcY9aRRyJTDHGab1GYFFJjoGoVK9uiHWG3xn8dROjSGPlXuTE3en4AMfdP7UoD6jilp8DuJb7DjCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNP+hd6PJCKQUi6fnXVetMNIKRZNgvYVVI0wBMveiV0=;
 b=SI/11bbarwkNm+CNG1+epwpbB3U0QKgoF97xYTOLKN129rGub3KYvgt5+acbr89LLm5PQm2HPUv9BVaooLa8ffxnW0/aWaRJ5OGTBC3beWxrd2Xsm7Q3qxQgUkqrIZcWn+BngmUjk4/nq1Akxwc8GDoq6p760WBN55DhtnBEP2gP7ggkXOfWwxICtKflMpNAl8EUii4mt6Ii+E/ZJI+JO+uGt5JD2pnW1dmhOZi9SLfvtPCKRRqUXH8lwdUktH/QX5adDDQtfG6/CPNn+i00Jrf9Ckct/rPtLukNKXFRzEYrNJ4cg6sxjTd/RwUdvPHEWuDWonFCRmmfO5L/mZWhQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNP+hd6PJCKQUi6fnXVetMNIKRZNgvYVVI0wBMveiV0=;
 b=F8A2AoHCIFs/b3rw3hLZ18zhIbMv1fKJ9eaMwvMY2S7WjxTWp0Wk9CyCr/QpkB0SWfP0czzJQ3lD78hr8irV83vGpQbeonRuudw+US/IMynnmyb2SfVMxTo1iV0mphiN8MkqOMhzgnw4AW/JV6AKAufn4DifDtrNl6+qMprnL7c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9cd79b9a-2e9d-aa0b-3ea2-747a6840f5f1@citrix.com>
Date: Fri, 19 May 2023 16:24:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/4] x86/cpufeature: Rework {boot_,}cpu_has()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230516145334.1271347-1-andrew.cooper3@citrix.com>
 <20230516145334.1271347-2-andrew.cooper3@citrix.com>
 <d5eb0703-63be-0c5c-3fee-37e74e11dcf8@suse.com>
In-Reply-To: <d5eb0703-63be-0c5c-3fee-37e74e11dcf8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0033.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB7003:EE_
X-MS-Office365-Filtering-Correlation-Id: 069e435d-a3ec-44f0-acc6-08db587d1add
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W8Qd35Hx3xoensuztcO9r+O1Z1n2Xi4JGZ8E2Jjbw+sYps55au91g93osPgkHtrcs11bQ3AbAUrmfxofjrDt0c52suKkCgdV5giQiqeFVbe/EUnBHJARghysUsp5hMRiWFzMDZvVFgE0qz+jLQzzd+MBD4x3ufEEXDQMCS369vS2LU6DG92ZbDqsGEB2Lg/Su/qro02cS59hMmZswBtPjwf9dyf4jQ7W1HM+GyT/fzEFidtlnnpu8t3d/aqSxU1uR+0y5i/TMnkSIi49300LZfGyTPafB9kXakdlXPj+OXywq83zgYx0NHp2/yRZSj8pfsb1goH3B8d+ic0f2plNmgmJW5vDbPLbdVNvxyx3HeQpZmkwpQGvNWBl/6sh9IM4zo8n8muawP0pF1kecL/pGAc8ql048ytW9NKmdcaGhxtNStsbRAegYwpkYfhXF+rzuTt43zEC7YmWPDePnNKyE0PNiUYdX73CuE06jfRY5CsJq2+wfFJ/O3XA+XQhM2pk7nFOMKXNS01ZFHzSb1CSnBrW4r+D2Xg/DOCwVmgFQNXc3ZBwSSyGnw7Ae9c/RdXcQBsl/sBMdHK2vKLMf8cGk30TYpGB6xprcL02uPJyvItW9NpWHS6J32zanTpCB82DmLx5X+SaANUJ1VVj0ra+bw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199021)(83380400001)(66476007)(478600001)(66946007)(8676002)(66556008)(6666004)(6506007)(6512007)(2616005)(54906003)(6916009)(186003)(86362001)(2906002)(31696002)(8936002)(5660300002)(53546011)(36756003)(38100700002)(82960400001)(4326008)(41300700001)(6486002)(316002)(26005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aElRaFlyb3FMS3lDbjl6ZnJGbTUvOHFZZGhYbkVFekRaYVZmQWNITWRhMXgy?=
 =?utf-8?B?SVF3UnFMVXpGVjN0Tjc5RVZtbUEwNEJXUGNZT0JPSkdJeGNWbCtPZFJiY0xX?=
 =?utf-8?B?ZldBbjlyTWdicjhmNXg3aVhWY05zZmVkK25VdlF6YzR0MUZRL01QYU44OENs?=
 =?utf-8?B?Q2F5cmpMaytrUkMreHNHMGkycC9LVEpJZGZxcXBFYmEreWtTaHRHcWc4SWxY?=
 =?utf-8?B?NU1XMUlGVlFlcmxQL1AwN3R6UWgvSzdPVFpYVGZUWXpHc2JxbnBpZC80MzMx?=
 =?utf-8?B?bzVkSlA0blZTdGNHdkxVUE1zdld2Z2V5ZzNDN1hKY0lDemNadURpRVBKODVs?=
 =?utf-8?B?dDFuOWd5SHJOSHcrNDVDWm5kWEdERmpXblRETWNlTXUraVpQeDJTUUlNWTFU?=
 =?utf-8?B?T25xSE0xVlN2ZlM2eUNlSGkzNjByTVRGcmtIR2hjNkN5bTdOcEkyeTlFcHI5?=
 =?utf-8?B?NDh5ekhOdHlIRitVOFp3QkZGRytwMS81U3hCRWhTWkdlUUc2THZHdTNhYzdN?=
 =?utf-8?B?Nnhvd0RVeUVOS0RxUXdQaG93MWxWdkc3R25UMWNjYXN4L0c2YnQ2Y3ZKeTk1?=
 =?utf-8?B?RENUU1pGRERDY2JRVUlRSWlBdE95cnFrVnYrNHcwL1diOHVWaWZ3R1JUWlRS?=
 =?utf-8?B?MEgxeTZqeFRwcmZnYmRYSEpCWkpIZnB5eENJcjN6RWlycFM4VXZkeFNvZWtC?=
 =?utf-8?B?R1M3NTRpSUFlWEVQaXpxNHBHdWwrWFhGcjFXTFZvSHdWWE9JQmZETlA4bG4y?=
 =?utf-8?B?Nml0TnJaNUZJZW4wanp1dENpQ2JtMkQrbnM0QmJvQzFsR3R4M0hBbEJiaElF?=
 =?utf-8?B?Z3hjZFczNkpNU0tkYllvb3ZQOEg5c1RRNGw2VHZ4bjFyelcvQStUMU1IUVVl?=
 =?utf-8?B?WCtFaGNJU0NiRUZsekNrMDI5cjkzdDJTVHAyb2pEeFJ4OFdWWlNrdy9LRWdz?=
 =?utf-8?B?ZjYrNkNxWSthc0Zibnc0cnBocXMvQ084VGYzVmRnMklvR2g4SngvemdvQVhj?=
 =?utf-8?B?SStuT1VQVlZCcHorWFVZbUJxTTdXb0tMbWFLK3V4QndqbVlMTklpb1N0Rmp6?=
 =?utf-8?B?RXJiYmErYnNIZklReHF5QUhKWDVLendEQzdNK09mNE9jWnlyNWZzTjBxNFdq?=
 =?utf-8?B?U1JGa1M3aDkrcFJ5eUZvQ1dvRzJvL0h2MURKKzMyMzJKVHVmS05xbVkrSGZk?=
 =?utf-8?B?V0JoRUxMYjNpb2E3bVZWUDZxZ2JUUG9uUlFNcHBLa2diSy9jM1lQT0U3MEFv?=
 =?utf-8?B?Rlp0R2Z4QWJHaVZCNUNTSm5qTWI1cnV2Tjd4bW1WY1JaKzd0ZmJadzkrZEhy?=
 =?utf-8?B?dFlCdEIyekgxTkk5Z0M1VmtqaXdoWHJIbzJpQUhzSERIbWY4VWdRM0x3bHNX?=
 =?utf-8?B?anM2a3g2bFdHUkNYOFMyMVZZc01UOXpaWHVzckRTU29hdE55SDBrbU9nRVk1?=
 =?utf-8?B?ZGR3ZWxIYzRtL2k2NGdNVHo4NjE1MlhwT21OdUtWZm9VWHN3OEFTUlpqVXZn?=
 =?utf-8?B?OVVFOHYzUG1HWUpUb1NiWU1xV3NKNDVmcFJsUjBjRVdaUTd4Zi9kaVZqdGNL?=
 =?utf-8?B?TWRqdGR5L0JBYlIrV2NjYVZlU3VBdDQvcXc5L2JRU3M5Q3dra0ZObG1tSEZD?=
 =?utf-8?B?RG9QcVdMSEJ2RUwrMHJVOEZkZHkzS1QwRnZQK2pBOVpSUDd0N0svR25OQk0w?=
 =?utf-8?B?dXNzaThISFpjWklIeFpBZHNBTjh0TXVkTzZ4SUVvbmlPQ08yYVNKaWNaSVRl?=
 =?utf-8?B?ZlFlNERibWkvM3ZuWk05dzBxcjhsb2cxYkFHOEM0bEloelJ6dzIraEVYM3c0?=
 =?utf-8?B?VzkzZC9ZL3hPQXI3bTdoWXA3WjZtSEpNMlBWSm80cUthNnVwblVXcEczaGl3?=
 =?utf-8?B?d3E5cVoxYlROVnFLWTlPNDlCbEdWeGxFZDZzcjQzR2lIcXpzbVZQRk5aM08x?=
 =?utf-8?B?L29PdzkwRng1Q2dycVVPWkNmbXAzK0JXd1V3SnhIYXJXbWkrbWZwMnkwQTd3?=
 =?utf-8?B?aFlWVlAybHpRU1hXczA4NlR1ODZEZU5HYkNGNUlsdGZyYjZhWUh5MEFINkVj?=
 =?utf-8?B?eHVLR2dWUnlJSUozc3ZwS2d0QTNVb0hGRGplaWdOSDFPcHJMWExkRzJYOGpj?=
 =?utf-8?B?aFVLUTNCNFRmcFh2REIzb295NFNad1c0Z2t4cUR5NWxOMkVaQ0hGNjBzZGZF?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	T44yYJxojAHUmy0oK1fmAqo0eQqedo2W3IsvoO/Iwaw+Gdki9iB3whb0SVcSTvH7j/CwTPgRX/hDLzoS7S2Q5Td7d2gFzcYdq1QuTKPZTTKh1bZPqTHC4uciL/bWOqLUBucoGPISg176isHaBoG7l3akiTL5oLd5BkUumtoihlXgIndkhab2/QUw7sS05wBkDLlg26fal2aq8Lh+SVGoxnnBit93m8Xgx49rdA0EXN6vdYEuvlUCwSKAEyGNpVWUXv/mJAmLJoH7XYTee3GWs/RAdNCGiIh1/tot0FTRpHOLu412wWUqPHOvT+ethpR9FQazjIySjmR3GnfEF4EkGHIODobT4RAfx0ozFsHfX+/UEIcXtqKaVX5xjhbxI48hpRpJTGTdh60vNpjkrlAgF3RznYW2lOvWoYdUPph3iYXVAcSEd6Sdg+bVUkORvdfQvuE5parm9FGhS3cHcSAILIxtdIArnO6tqemy1BhxXfTkOlMc7a4iBu65Vovm2/Vri8SqoeRj8TPLyCEW7+e2EiF4JQmGpOwb8r+qJFGOYjOADpQJtbT5TIh15iEkAtefgBUDPGRkii4rlIUGRbf6t1v8BRDDdzq/ng57O2i8ez8JJomOQxhxuzP+Uo5Z84MTEhM1WwNIu/41ox6FkRTdNfqy1GwyaOAlg8m6Sdkwr9x3dD8P+W2BVOfC1x69K3u+2aCZDnUbPCUXQEVVYs8I+3r7wmw+bo+kV9DMX2QXSWV8kOPEDP+ii5aptESmiEDclcRlMVBvK1thcTfAaFcOM5DCWw7KPxyhrE8J9wunainAON3Icb3w6CgyU6ZvaW0M
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 069e435d-a3ec-44f0-acc6-08db587d1add
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 15:24:15.3384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5rOCbcotRkNd3bOByOpuD64uAa+BofUtTUZO+mkoE17FeSGeEQlirgFhFBCdNncTaeXqGzBKmxjZpYoEZPD73WU0ioouSgQIxRoR0P1WBnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7003

On 17/05/2023 3:01 pm, Jan Beulich wrote:
> On 16.05.2023 16:53, Andrew Cooper wrote:
>> --- a/xen/arch/x86/include/asm/cpufeature.h
>> +++ b/xen/arch/x86/include/asm/cpufeature.h
>> @@ -7,6 +7,7 @@
>>  #define __ASM_I386_CPUFEATURE_H
>>  
>>  #include <xen/const.h>
>> +#include <xen/stdbool.h>
>>  #include <asm/cpuid.h>
> This isn't needed up here, and ...
>
>> @@ -17,7 +18,6 @@
>>  #define X86_FEATURE_ALWAYS      X86_FEATURE_LM
>>  
>>  #ifndef __ASSEMBLY__
>> -#include <xen/bitops.h>
> ... putting it here would (a) eliminate a header dependency for
> assembly sources including this file (perhaps indirectly) and (b)
> eliminate the risk of a build breakage if something was added to
> that header which isn't valid assembly.

b) That's a weak argument for headers in general, but you're saying it
about our copy of stdbool.h which probably the least likely header for
that ever to be true.

a) Not really, because cpuid.h pulls in a reasonable chunk of the world,
including types.h and therefore stdbool.h.  cpuid.h is necessary to make
the X86_FEATURE_ALWAYS -> X86_FEATURE_LM, which is used by asm for
alternatives.

I'm tempted to just omit it.  cpufeature.h has one of the most tangled
set of headers we've got, and I can't find any reasonable way to make it
less bad.

> Preferably with the adjustment
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks,

~Andrew

