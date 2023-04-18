Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAA76E5D4C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 11:26:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522682.812196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pohbt-0002cd-Gj; Tue, 18 Apr 2023 09:26:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522682.812196; Tue, 18 Apr 2023 09:26:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pohbt-0002ZM-C7; Tue, 18 Apr 2023 09:26:49 +0000
Received: by outflank-mailman (input) for mailman id 522682;
 Tue, 18 Apr 2023 09:26:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUq5=AJ=citrix.com=prvs=465f4c9e2=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pohbr-0002ZE-Bm
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 09:26:47 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21aab0ac-ddcb-11ed-8611-37d641c3527e;
 Tue, 18 Apr 2023 11:26:44 +0200 (CEST)
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2023 05:26:34 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6359.namprd03.prod.outlook.com (2603:10b6:a03:399::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 09:26:32 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 09:26:32 +0000
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
X-Inumbo-ID: 21aab0ac-ddcb-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681810004;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=38/TOdP7cjPvYIhZu7auUVXZSEH33UEk0E6f9XltzPo=;
  b=TuhnnlToZL4KDLtRizrehd36BvrKq1Qo/rLn+DrOcmZ+uQq6WaLAwZpW
   W2oI4mgj5N8LeFHW2rBWegYkRk5BhicbQTnnjdJbrlY5AxKmtCexzFVUu
   tiOKRul1bVR9BLgchLb9CvzpfRXE3TUEg8CX1jAKCivgHQjoy1mV4VSvW
   w=;
X-IronPort-RemoteIP: 104.47.70.103
X-IronPort-MID: 105272815
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:GL7+iK4A3O/068idr1DcawxRtB7GchMFZxGqfqrLsTDasY5as4F+v
 mEZXTiPPKuCYWPxetF2OoXk8kgP7MLVyddlHFE5r31nHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7ZwehBtC5gZlPawS7AeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m2
 qYWdysPKTO4heOT2Jm8SbFtrdg/M5y+VG8fkikIITDxK98DGMiGaYOVoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6MlEooiOOF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxX6hB9hCTeDQGvhCgEOBl2oUNFoseGCXoaa3lBGze/VNJ
 BlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQN4sudIyRDcq/
 kSUhN6vDjtq2JWKTVqN+7HSqim9URX5NkcHbC4ACAEDvN/qpdhrigqVF444VqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTxgbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:OkOMEKDwqgt82yXlHem955DYdb4zR+YMi2TDtnoddfUxSKfzqy
 nApoV56faKskdyZJhNo7690cq7LU80l6QU3WB5B97LYOCMggSVxe9ZjLcKygeQfhHDyg==
X-Talos-CUID: 9a23:3mSh7GNkxF7tyO5Dd3Npq1UWXeMecHz41FzXIBe5Inp1V+jA
X-Talos-MUID: 9a23:kna87AgjQkUIWEIDAiINg8MpNNl6sqKpNAc3vK4qu5aKK3N9GxCPg2Hi
X-IronPort-AV: E=Sophos;i="5.99,206,1677560400"; 
   d="scan'208";a="105272815"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UPxN/VlsrkVDizig8NkZHCU+DqBHB6afTwYM/4ojxbwdY9BP2MMss8GmzO2Kfz2k6ZrLCeWoVNX019ul5iwjXdZZCvPXLBMbiTTk2nNSnEfnFsZX7BM0Rf3HFkvyO44j2QTDwHzIvhJ4hmT6CYLW5q28hCp0UtlaAq6QhCiU9S/AJ0hUghkw7jyjVwzTLPUI/lgWUn/rM14X3Yb3RvNuUm7zw5W8pRZVMgJwqAc4rOWr48STrIWfczzsPqguSKBssCvozMGXCPWg1WrVEPyQVAsgs6Ew3C5FeAaw2yqZPyd0P1qG4Ot4TMsBDwlRhkDUWm3Kl7S5yEXEnVwNfWFboQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ei+0nFlGCYdhhVyjG/s6LbreYKNTgFC6GaPlv3pfuMI=;
 b=kLyWSSxqyBTcN1F2bKTdVCg2uaCsLhTsl+w9UAmiVSzjPGPYa8zLv2+kDsID35EUI6ga4oy3Z7yTYVVH0Fr1puCNtgP65AU0D0//MVx98qUkdURi5tomWlKTqDweAnWyDAdJqUuGbG7JW+vpee6s4z+CzHxJk9AL/akMJkUhg5vWYxpVokc9WwjLKWw9zyluevnYgfffwEekDDzA7oidgrQEuEPNq+phNRl/7U5+6z1IBbqCjYh/6P/IUnbXkO5zrtp4sHilaeHF1fl/kwz4cYWQA7hNLN1Xa0rXeFuq2SCCR5C95OdZvTBb+EaV73bSRJbGnYGle102sB2VYVPNqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ei+0nFlGCYdhhVyjG/s6LbreYKNTgFC6GaPlv3pfuMI=;
 b=m8TiCREyRbP5owH0JVMQzF7RFrOKZY4eE97sC3NL12jr0YVIklWYHbFdvcDBYeVThwPr/1SMMA00SoZsSB1HRy88cwKHC2Cc4n8a6zAJW54afSZN1sq1/bddZ39LhyPbWtrymHh3Wr125bii5UFXOed0lbRCGpcb5mAteGNrmTo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/livepatch: enable livepatching assembly source files
Date: Tue, 18 Apr 2023 11:24:58 +0200
Message-Id: <20230418092458.15253-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0214.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6359:EE_
X-MS-Office365-Filtering-Correlation-Id: 15abcf2d-30cd-4459-62ea-08db3feeff20
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dDpZT2wKPBG6R/gGFKfHVccNlVUSpcuR1P9F8w1RDh0zJNyuFO7jZkRCQNLY3dbCes4jmcbvZwmRrzbbikw6Gsw+75SKORMpLwFJ7dI+ltAMebA3oQddgMiPw/a1vWQ0fNH+/D9+r2mRpsb2kAzZLS7fljR6NJOFcXxIIklYmruObMdgG5r+ut6i4od6kGSRuZEVj4mICuvFP42TPK8sE33fsyvCTktq47lLX8VYgSMHCX04i61mxq7eAFCt0vhJL+BHYw9ootkM7ZEecORxyKMuIAqhQNB0CzRuc7aEY8GNyYJ1A+L9X3z7jlJUUX185IhPNXhCEWjYuhzQuBU8SUu7ALPp4yHoclZ4sIu5Nv++VuYT1VAPl5Me+KnR6KgQSK4OSZVUmWIAIAi7SxRhzVFHtx1rdZXQxmRRP2tdx9ETldbj01/waNBerGCrcOZDip7XjA8Ty3v20zSYsTKrmARFjvFb097LRW/3Ow+5XMFnn220SCiGkp6GbvTXnCQHUTe1jR8RxLCxoRxHaxqfNwjovyjlYF8NP1GPmflQIenhN6PSz2hG86YldyCuYX15
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199021)(36756003)(4326008)(6916009)(54906003)(316002)(66946007)(66556008)(66476007)(478600001)(6666004)(41300700001)(5660300002)(6486002)(8676002)(8936002)(2906002)(86362001)(82960400001)(38100700002)(2616005)(6506007)(1076003)(26005)(186003)(6512007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmZXVCtTTEpzVW5pdG1qSXVSVzdlaDArZ1RwajQ1ajRUT0pjSGxSYngyUmcv?=
 =?utf-8?B?SjRwZVZWN1FYd2Y3dmY5VXJRSzVMQVJoSEZsaEJQY3NLMThzOHNBaW9ic0lU?=
 =?utf-8?B?MnFyMzNDcTJEQjB5RlJYbGxpY1NoS1BiUnF5T3ZQNjVMUGNVSVFKYmk0aHBU?=
 =?utf-8?B?OXN0SU1ZZWNRdmQ3K2NoalM3a0VHUVdoWlJWZlZ0aFcvRjMxQWxETU44SjFD?=
 =?utf-8?B?dE52RnV5QkZFeitnamR6b1QxeG1kWlZtcWo5T3lNbnRHakU4bFdUNGxISC9T?=
 =?utf-8?B?MnlqY2gyQjZGaDBsVjQ3ckNwYUlqVDU4aVdHZElQTEZiNkp3UzdINmJMMERp?=
 =?utf-8?B?MEh1Qkc0SW0vSlAxaStVYlg5VDRVL2FRUXRXM2dvTDNiNHZ0Vm9RSVh3Qmp0?=
 =?utf-8?B?Mk83Q2lQL3F4NTBZMjdsMXJ5UzRlK0ZaS3BEbnpJRlB5citseFM5U2FndlBo?=
 =?utf-8?B?MjN2a0lHQm12ZE10N1Jsa2RJK2t4RUZ1K0tCNEhxTVRncCtya1poWTlUOW5M?=
 =?utf-8?B?QVEwUlhUQnpuQmlGVWlEdXRNTG1QaDF3OUlYRUxLZ092MzM3VnJUUkpSeTdH?=
 =?utf-8?B?TFBMZnNpZnpJQTF4SGp6dUNCdzRZMm9uckkwalNRNTY2U3ZZSlVoQnJabzNw?=
 =?utf-8?B?OWZycFJDdThqeks5MkUwa084M1QrUy80bWp4U3NQTU5iOHhtSGYvQnRLMFNZ?=
 =?utf-8?B?SUd6R1plWjh3QXdBOFJzYU0xN25zamVIZkxkYzE3RnNPdXdkTzBsdmppZUpY?=
 =?utf-8?B?Ni9SUDByRENsUXJQNnFVbklDZHc0cTgwMUlsK1VacU1GYjlEWnlTb3huVG1p?=
 =?utf-8?B?R3liTE9laVRuc3EwcWU0MXN3dFl2cjFmTDNleTlqTkFSTzZGRzQ1a2FwYXVY?=
 =?utf-8?B?OHc4dXduQ2JGcW5HM0xMYkJBWENSMHB2T1MrdGxXdzNUVk42RUtYakxDa0dt?=
 =?utf-8?B?VnZLd1VTNHVoUnU2S0JuTkVEc3FyV3U5MkF3Zi94Mmd1Y3hnLzF6VVgza2JK?=
 =?utf-8?B?YUhHNU0xK1AvNXd4VU81TjZYOTlQQ2p5eVE3Yk5OVlBJd215cm9qb0lFZUEv?=
 =?utf-8?B?bi84WVo4RmtkSktlWGlrdloxRHpoQWN6NTZBOVpKbER6U2tRczQ4Tlo4NlBr?=
 =?utf-8?B?OXB5YWk3dlRrbmMweCt5M1hkOFlFcFA2RS81NVVkdUFvVXlCR3JIcXZBRm1r?=
 =?utf-8?B?d0F2dVBMdk1YSXkraS9DdTh1UVdsNGFRaFkzSnVGQXNmYkE1TThHckMvbVd0?=
 =?utf-8?B?azYvYXNjbUVqSjJQWXlidTVHQ0Rwb3ppNjJDU0FCcjhadGdNakxncjZRVWdX?=
 =?utf-8?B?d001eUdDSjJOanZJSTNpY2RaNWJrZ3NmSGJHVTd0Q1ZibWpVT1RBbXpXYWl0?=
 =?utf-8?B?dDR0RlhlSEVxZHF2dmZYOXBnMlZUY2x4THR6TUdMTkVlTVhDRWFJdWRhWlZz?=
 =?utf-8?B?ZTZFQkRwUld6NzUyMk1NcDVScEE5bEdLeDY4Q2k0Zks4dVZ2aDJmaVRGNFBy?=
 =?utf-8?B?N3RGQkt2L3cvSmtRSWdUUG5CSmhmSmxRc2JJcFNmZ3NrRG11R2JrNFlOQnFN?=
 =?utf-8?B?VVRvVVliZ05EL0FzNVhQUFZtcTRNN0lVSWwzaUl4UU5CM3FLL1M4N080SzZF?=
 =?utf-8?B?WVl5cEVjYWVWcjJyQWlIVERuUnUxOXVGdzg3eCtQeHZFQ3JxYllZK09uTTRx?=
 =?utf-8?B?US9OVDlkQzhjYkFaSVlwMnYvZnRZWWR5TVNuQjlhYnpBQ3Q1dy9hK3p6aU8y?=
 =?utf-8?B?RnBOdTdJTnUrV0I0cGttamlFMmdUOGRSMTEweVlmWS81TjdlR1BCdnUvV0tO?=
 =?utf-8?B?cWdWNlk1V0FNVW9yb3VoZFpLZFZ6Mm0rRlc2WC8vdlN1K2pSdFVINzNYRGdP?=
 =?utf-8?B?ZWk0WTdZZlo3djFpTTNQM0F1dEhQWjg4U1M4VFpqRGlydEl0bmFFMlNudmgw?=
 =?utf-8?B?dG1KY2xMVGN0cXUrMmpxNFJYcU1UN01ySkorek93elhVTXRNYmV4eERhcU1o?=
 =?utf-8?B?bXNheTZkQTREQldWVDZWVkZGZjNqbHppby9nWHBvOHJNK1p1cFZwbk1GZHRu?=
 =?utf-8?B?SFh3WDIrbFVWWVBXVEh0RWxkc1Y0dTlSSFAzMStDNDViY1BWYkVLdHRjSlZY?=
 =?utf-8?Q?P6U9NIzcdSm3FKRDRqD4TF4nJ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EyH9WXY0uG7e45Jtp8duU6HXYqIo9XLM+o/BxciRuleLsdS0wzzfq/cln6ySZlqR1KJMCE9bUbJXf3J/jumG9/yFRsmn4q/fB4a876J+9CA6Lw4I/jtWug7SnCJDIcYRMUBpHICF19hrJaaC4Jr68G37nK7h4WTLcJGfoCqVIXMXY23BvgxcwcFoGhTuis4b818T7C8MZQCPkEWNwdR2DH+YjkCtLjpW36VBmMwULYUe68Pb2FZSoBGTn/7R+SHlqXkIKwosqq53WOO4AItdd40kZFPs8O+SPRrxLvHWVwMaWVX0JRWjT+0gE463CogKftg1Zbukk9HS+uN8F+q4+8gOKPEFngCIM6wkoJyyQ64Rwv/AHFsDt4qt6Cvv/VI//mH1mwonZwx/W9tI5WMbK4/5CYtlsUWSVPHBVUGEmbT6pzuTEIra/csCGSVaWDNAd+BT3t4vbLVKM3lkO8H5qhTb+RA0CLq2eCg2O3BqUIWax3SHDrvMkoO5BAQCKfylrd9qi9jTyjduuT8SMvaQhmM9yiQMXw74P5mxuIuXgYJ9jDJj3d3FNZk/I4KMRYU40o191clonFFHEaLQw6AVJVtgTrgGEo4aVR+21HMlLSUoAU1csOvMF4DxoGGs1eM8Z0k5GT2/3CN5PAL0J9CoRqOcMFVFX9GEG+YGBrT4IZ13o35wMRHSrNLksrWQ2npRwUzU1XLENk7wfWwOhRsMh+AXy51nOLGrfEu/hU/fcS45nK12j1085FzYHSgi2EqF6En70OIoEPYEpkd8ao5roqn655UPAQlsBb1uCXNPFUIlglyJYysT99drfK0V5ZwW
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15abcf2d-30cd-4459-62ea-08db3feeff20
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 09:26:32.0821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hMpyK94AYa6gwx2VNt9Z/9hFDd23bTAy2lUq6KvtEnDtvLEQe1Nay+52KkDhYDBUYiVkTM5N8Ka0RqbCbJSw7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6359

In order to be able to livepatch code from assembly files we need:

 * Proper function symbols from assembly code, including the size.
 * Separate sections for each function.

However assembly code doesn't really have the concept of a function,
and hence the code tends to chain different labels that can also be
entry points.

In order to be able to livepatch such code we need to enclose the
assembly code into isolated function-like blocks, so they can be
handled by livepatch.  Introduce two new macros to do so,
{START,END}_LP() that take a unique function like name, create the
function symbol and put the code into a separate text section.  Note
that START_LP() requires a preceding jump before the section change,
so that any preceding code that fallthrough correctly continues
execution, as sections can be reordered.  Chaining of consecutive
livepatchable blocks will also require that the previous section
jumps into the next one if required.

A couple of shortcomings:

 * We don't check that the size of the section is enough to fit a jump
   instruction (ARCH_PATCH_INSN_SIZE).  Some logic from the
   alternatives framework should be used to pad sections if required.
 * Any labels inside of a {START,END}_LP() section must not be
   referenced from another section, as the patching would break those.
   I haven't figured out a way to detect such references.  We
   already use .L to denote local labels, but we would have to be
   careful.

Some of the assembly entry points cannot be safely patched until it's
safe to use jmp, as livepatch can replace a whole block with a jmp to
a new address, and that won't be safe until speculative mitigations
have been applied.

I could also look into allowing livepatch of sections where jmp
replacement is not safe by requesting in-place code replacement only,
we could then maybe allow adding some nop padding to those sections in
order to cope with the size increasing in further livepatches.

So far this patch only contains two switched functions:
restore_all_xen and common_interrupt.  I don't really want to switch
more code until we agree on the approach, so take this as a kind of
RFC patch.  Obviously conversion doesn't need to be done in one go,
neither all assembly code need to be 'transformed' in this way.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/config.h | 14 ++++++++++++++
 xen/arch/x86/x86_64/entry.S       |  5 ++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index fbc4bb3416bd..68e7fdfe3517 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -44,6 +44,20 @@
 /* Linkage for x86 */
 #ifdef __ASSEMBLY__
 #define ALIGN .align 16,0x90
+#ifdef CONFIG_LIVEPATCH
+#define START_LP(name)                          \
+  jmp name;                                     \
+  .pushsection .text.name, "ax", @progbits;     \
+  name:
+#define END_LP(name)                            \
+  .size name, . - name;                         \
+  .type name, @function;                        \
+  .popsection
+#else
+#define START_LP(name)                          \
+  name:
+#define END_LP(name)
+#endif
 #define ENTRY(name)                             \
   .globl name;                                  \
   ALIGN;                                        \
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 7675a59ff057..c204634910c4 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -660,7 +660,7 @@ ENTRY(early_page_fault)
 
         ALIGN
 /* No special register assumptions. */
-restore_all_xen:
+START_LP(restore_all_xen)
         /*
          * Check whether we need to switch to the per-CPU page tables, in
          * case we return to late PV exit code (from an NMI or #MC).
@@ -677,6 +677,7 @@ UNLIKELY_END(exit_cr3)
 
         RESTORE_ALL adj=8
         iretq
+END_LP(restore_all_xen)
 
 ENTRY(common_interrupt)
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
@@ -687,6 +688,7 @@ ENTRY(common_interrupt)
         SPEC_CTRL_ENTRY_FROM_INTR /* Req: %rsp=regs, %r14=end, %rdx=0, Clob: acd */
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
 
+START_LP(common_interrupt_lp)
         mov   STACK_CPUINFO_FIELD(xen_cr3)(%r14), %rcx
         mov   STACK_CPUINFO_FIELD(use_pv_cr3)(%r14), %bl
         mov   %rcx, %r15
@@ -707,6 +709,7 @@ ENTRY(common_interrupt)
         mov   %r15, STACK_CPUINFO_FIELD(xen_cr3)(%r14)
         mov   %bl, STACK_CPUINFO_FIELD(use_pv_cr3)(%r14)
         jmp ret_from_intr
+END_LP(common_interrupt_lp)
 
 ENTRY(page_fault)
         ENDBR64
-- 
2.40.0


