Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 864A26BEB0E
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 15:23:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511121.789972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdAyW-00050i-UB; Fri, 17 Mar 2023 14:22:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511121.789972; Fri, 17 Mar 2023 14:22:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdAyW-0004xl-R3; Fri, 17 Mar 2023 14:22:32 +0000
Received: by outflank-mailman (input) for mailman id 511121;
 Fri, 17 Mar 2023 14:22:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eK3V=7J=citrix.com=prvs=433af36f9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pdAyV-0004xf-Qe
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 14:22:32 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2461f4ae-c4cf-11ed-87f5-c1b5be75604c;
 Fri, 17 Mar 2023 15:22:29 +0100 (CET)
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Mar 2023 10:22:12 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6542.namprd03.prod.outlook.com (2603:10b6:510:bc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.20; Fri, 17 Mar
 2023 14:22:05 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 14:22:05 +0000
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
X-Inumbo-ID: 2461f4ae-c4cf-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679062948;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7XNZzyV+7WjiTe2r2TjDVLiqlIubP4pnqDS1T8aWt3g=;
  b=YbfJxNEeEcU9G1WxZkJDIAzVIgWt1tOFHbC7qRsokGL1bKHkQNSkjXRb
   2TLKJts/KOS/ofA6PbxQ9SoglKeH2eQ2ci7SnoSIV9YIYZta0tB61BMq1
   YD3e3uYXdizLcPRhJ2s/XcXBccP0W55yAnXg4s8NvsUaieMPUnlU1WQ/u
   M=;
X-IronPort-RemoteIP: 104.47.70.101
X-IronPort-MID: 100083359
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:G8h3DaBQ7a+zZBVW/+Xiw5YqxClBgxIJ4kV8jS/XYbTApGwq0TFSy
 jFKWT3VO/2MNzb9Lo91a4m+phhTu57VyNVqQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GhB4QRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw/PksBH8Nr
 tkiFDkMUyGSuf+syaC+Rbw57igjBJGD0II3nFhFlGmcJ9B5BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK/exuuzG7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraXxXurA9lPRdVU8NZ6vGKXwzdJECdLD0ehisOIt0O/X+tQf
 hl8Fi0G6PJaGFaQZtvyRRqju1afowURHdFXFoUS6guA167V6AaxHXUfQ3hKb9lOnMUxXz0xk
 FiSg8nuGydsoZWSU3uW8rrSpjS3UQAFIGlHaSIaQA8t59j4vJp1nh/JVsxkEqO+kpvyAz6Y/
 tyRhC03hrFWh8hU0ay+pAjDm2j1/sGPSRMp7ALKWG7j9hl+eIOue42v7x7c8OpEK4GaCFKGu
 RDohvSj0QzHNrnV/ATlfQnHNOjBCyqtWNEEvWNSIg==
IronPort-HdrOrdr: A9a23:Jyk8JazQuMoP8QuLIFRTKrPwPb1zdoMgy1knxilNoH1uH/Bw8v
 rE9sjzuiWE6wr5J0tQ++xoVJPvfZq+z/JICOsqXYtKNTOO0FdAR7sM0WKN+Vzd8iTFh4tg6Z
 s=
X-IronPort-AV: E=Sophos;i="5.98,268,1673931600"; 
   d="scan'208";a="100083359"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8jVwwQRuH3CcTKtKyl6YPeHd1SM3q6wzL/y5AS4JqP1pH6KH/Ko/3xjdhgmZklF93QN4wR+K0vVFRzpkscuVQ6EIZCcLNXFi4LM+lIPG+Tf9aSWVYUPoTueQ/gMm7VTyEMsPyAqV8F14G30P5D5iq6OoMOFKMWvCIOir5DzqciaHw6AOmvUkMoEduY8WbMf7mKkZZ+hhVPhLfNKSJWLo6wSkOPTWDJIGEG2p65Pao0bxFChiaOE98dDE0/xu2ZMVQbvnZqBlLo4Y0e3BbRK7LfrsXj0rlBBT4mO7db96AdxvQRHBAVDZT6EwkZBLbJ+Ul9yAkkTJf/I+jLI8dSwXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XNZzyV+7WjiTe2r2TjDVLiqlIubP4pnqDS1T8aWt3g=;
 b=DuFvwpz2r9GW/ub531I4mEJSx/kHOJ4H69bhtAuh/lWackQW8G+l9HJA9SXfohS0VeXocM/qPFmmjteMYxHQw+eFtoVmLsLLjdHt3uQF1rFWyCnGv3ZWe2hMoueft64lmHsuUAajQJ8NkuRajzIJRhazq424frixFot1a7AvxYZNSI5se1w7Y2NZmvDQC/PPP5qBF5ZYYf81V1HS6p0IWBEkHwA+uoBIF1Jnoi4Ssxr1rMKYnvqOEfeHnCTkCJ1KIfULNDhegOG28Otmr+54v4/E3kJBKZZWDm9JPz+s8RoFUdGEn4D19Rp+WffpKx8PDf/y/s6oGWUG/2KtYmeoSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XNZzyV+7WjiTe2r2TjDVLiqlIubP4pnqDS1T8aWt3g=;
 b=qwA5+Ofxk/i+9L5CY8LUjTtcj2H0cY0AUMwLvW2lGY8tcFJXQBLvMJDGXNHiIucox1nbDkLwEXRniQrknkRa3FwCd3UN+CSz5KLLe5ZNa7eohxMaxI5O0nfc3wrmV9f/P0AY1eJZQBqE7bT0Ja5u/XaVHtuEVabQTG33CiMTkhQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f2bd16f5-7f5b-7a0e-7cd2-e2a9dbf22102@citrix.com>
Date: Fri, 17 Mar 2023 14:21:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/Xen: make use of IBPB controlling VM assist
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <51ae9cad-3644-02cb-9cc7-28229987487d@suse.com>
 <c4d2641f-7a99-fd8a-53c5-faa277c572a2@oracle.com>
 <4e66865b-11ce-cbd1-d115-13e3743eed7b@oracle.com>
 <f4f8c6ff-8d3a-92aa-66a0-7978c989a42f@suse.com>
 <cf55f9d9-42c2-f5e3-ed91-f75cc4ee9641@suse.com>
In-Reply-To: <cf55f9d9-42c2-f5e3-ed91-f75cc4ee9641@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0261.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6542:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d8aafcd-3f98-4675-26a5-08db26f2fbbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LLsYbqmqvPKXY1s3kPt4wkEy1JbzCnaYWLLYGDbsdnPXB+ACUL/hcIeNQLGMhNQlQsZMxXiNjas7vIkZ27t9jzFRBLeIROucK5eIofBvM4mU1r7yGT7t/9+hPisvDO22laQcQU0TaLKOFT2TE2/ZUzlWXb69lRq/4Vd9lZhqJeq+7omgVgOEi1ASB2N7J8Hz52bcx7J78hj/REAIKYjaUxSbykYU8ZiQGhakZF+p/K9njwXvlp3RSBCNTmafCnSHpDEsaTJd6OqowiEdLXRS6/U+lVYKE9e3Z+hke/10novIX0CdSvKWepMxzSMkgmE2HclEZhFCC9+VC2vavmjgsPIP5BsRMQx3p7Mb8+yaYmMhRo+8phmcRWG1Y70Suh4/FQA69a4uznxAeAciBvrV/eOrShR/KDo9qWLLiEBqStRozzavpFPBP0r77xBRNxb7T8Hy/D/KBwtrvFaQkBo6KFd118t8iV89ukjLxscLZLUFN5yAug5CFLiyAtvXP56QXs243dVhzYwVg2qzTekR7D+Zz4Lx0aTIV8Pn2XYw0xiy+yURqkje1TcpWWOvqzOW8GCluf183dP+63VCEkWg4DWwSlMj+/ChUqY/QB+RFCM+q3xvIjYX4H72Rzag8sBgJnX2V+OdIixJcbZOulzLxSpGxXcAqJQB1hgwlEqzn5rJw9VEiwMDfG5PzWsA6RshMT0923wRZ/90k/VO8Dy1CiK94pWLw3S6yoYNnaFlXL8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199018)(5660300002)(110136005)(66946007)(83380400001)(36756003)(478600001)(66556008)(2616005)(26005)(6486002)(6506007)(186003)(8676002)(6512007)(8936002)(316002)(4326008)(41300700001)(6666004)(66476007)(53546011)(31696002)(38100700002)(86362001)(82960400001)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjV5eFlZc2RrLzZjUll6REEyakQ1NytYNW12NlFmUDJPRGRzN1p4TERkK0xs?=
 =?utf-8?B?UUNxQVZ3YnhlMWpJYVBkR2tqN0ttb3VseFVZcERvY0pCTjJZVDQwVFJKc0hz?=
 =?utf-8?B?Lzd0RmlEZFpTRjBjTlJWc2ZmeFI2SGJkVWtWMVFvMHkyTFhMNThaVUh6bWdV?=
 =?utf-8?B?Y0JPK3pVck1GK3VUR09GS05sNjV4NU9XdFczR1lmZWlvL2RlOVZTdWd6TWJX?=
 =?utf-8?B?NzA0N0tQeHFtYng1NWVWWjAzblRpTVZWUzdaUHovUmFac29yUjJBMHpnK0RT?=
 =?utf-8?B?bE9HYkhQTEtEY281Q3dpTmZta215dkVIaXUyN2QxVUhleUVOb0U4dkFKTFB6?=
 =?utf-8?B?SU4vZFluYlJVZHlFdE9BeXNTT3lGWXNIb2UzOHU5c2pGdDZUdmwrTkQvb0VW?=
 =?utf-8?B?VE5DekhBaytJUStibkZ2bEFmMlJWejk2M2wzUXF6T3dWNGVjQ0d5aUVvZG15?=
 =?utf-8?B?eGRKaW9YU2J0ZkRsOHBKSW56SVY1TXpOcWtlbk1nRHVoSXNSaDBhRWFyekhM?=
 =?utf-8?B?R0FxSTFCeE9yekdDNDN5bUZGU1AyRnMvOFBmakhBQmVLbTlkNGhhT1NNa1Vv?=
 =?utf-8?B?T21GaEw4aG9QbDliQWs3RklkMmNXekdFOUwxbmZUN3pUOVhDWDN3eFlvZng3?=
 =?utf-8?B?aEMvYXRDZ0FxbEwyUEpyL0grU25GV29YWDJtZU9PZ0didnF2WUZ0M1lVbXBh?=
 =?utf-8?B?L1JrTTFnSzU5SW41dmVzWk1CdjdEZ093N3VCQkVrN2M4aVIrbkVPZTZBemU4?=
 =?utf-8?B?OWxUa1d2VzdZekRaNVljQktXK2hRS3JYc1lxVzk1eFlJWWxIMy9Pck8yeERz?=
 =?utf-8?B?Wk10bHNDM2s1eFRSQ1VoZTczYXUxTmtVNkREWThwVE5SZjRNVnRabE85NE8w?=
 =?utf-8?B?dDFBUk54TUhlWDFvbHpwU0RRR3N3SVh3K2hsYW9Xak0rdzN6RDlTOGgvc3dW?=
 =?utf-8?B?L2tUYm11dzdZakdkYVQvOU1Mc2d3aXlaWlRFNkl0eE5MSWNabWErbithVHc3?=
 =?utf-8?B?Y2YwUTF1bGRDUStqbzdzY2JTYytLYTVGTnl6MnJxV2kxR1V6WE5YMXd2dkhD?=
 =?utf-8?B?dVlvZk9MRVV1UnJmUHJXUG01ZFVqZHd0d2tCay9NRHFKWUFKaXlOV01aeFds?=
 =?utf-8?B?MnNUbHJzVkxZK2dKcmtYc3pETUNTL2VwWFNSZG9XNEpzR2tUQzNWOGw4Mno1?=
 =?utf-8?B?ek1VQWQ5S1N1eDJCZDFQMTF6SFU4RUZaNmtSU1pXS2Z3OGtWNWRxTzVHYnBW?=
 =?utf-8?B?WUJ0cHl0ZEVSTEprTnFyVSs4VEZrSU9vWlFRRGZpR3QwTDIray9paVMyd3hR?=
 =?utf-8?B?dEJJRnhXRnR6eXlxOEpWS3o2eWwyZnU1V0JYQjN3ZEJoQmlMR1hGWlhlTWhv?=
 =?utf-8?B?cEVxcitUZFVIOUFkK2dWWGJtZHh2MXNRUGxDeGZSd1pqemV5Tjg5bkliMzN3?=
 =?utf-8?B?ZTJhTWhweFZpalNJUzlHdzIyVXBUZHJIL1E1V1g3Vm1YT1NEWlNlYnJWeTQz?=
 =?utf-8?B?STZra09YZTc1eUJYRnFnYU9BVWw3WWRkR1gzeFNIcDI2UDhCeG1YYUNFTTNR?=
 =?utf-8?B?Ym43SUtrQWMrQUtmamJnWDF4MFJWQU9CbC95aElleHFhZG9uUGtOYUdYdHlE?=
 =?utf-8?B?b2hEVmpNaml3L0VoQ2t2dExXczlNQkc2OE9IVmlRVnBQTlBYWlhPbzZhVHBB?=
 =?utf-8?B?SlVPMDUzRUNIQlBnYmxFYmNlSXN4Uys5UEZqK1lTQkNJeGdhWjl3eVRMdDNI?=
 =?utf-8?B?TVgzVWtWVzdhT2JPczk2b1pqbDBmN2tLamdFMy9lcFI1RFBnSU1FNC9UczJH?=
 =?utf-8?B?c3VtMDVVQk1uOUhXL1J4dW8yTzFJSTBJRDQwb2twMlFVSGoraGE0RUU2bDdZ?=
 =?utf-8?B?cWRGT2piNnFXVC9tUDEzSlJSOUV0RThFZ0NVVXdBYkY4eHJ3V3AzOURrNGk2?=
 =?utf-8?B?MUd2RWtaN3owN1ZTNmx0QzUyNk9Rd04zQ0dQWGJSYnJKOTBYRHpwdytlVkt5?=
 =?utf-8?B?N284WUJIUWxUdDc5dytQQW13bDRaQWE4TmtKZkZkdDBwdk93TWIrRFhQZ014?=
 =?utf-8?B?UnpqVEVjUFdDcm5ZQTJ5SE9lc05IUVBuTndqeWo3aFhhU3NJSDBJTGYwQjZW?=
 =?utf-8?B?QWRVMC9rWTlOK0x2UDZCeDF0SlVkaFJJdmFiUVJTeFJHTE9wVFRUbWdwQVlM?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	X/9iwIaasSXHYtKu1cL3BPoUZM7hvtr51x7cNSsAzDmH9DfeEWWFkwsUTCe5M/hm7Vc5lgK9gVobRh8G2ZsU02KFmdCQne6UtMQKDA1lsqsftGKHmuVRHEFDIvYY6jf9m2eYD5EeovharZRx3j/xP7oaAUp2q1rlS/npYtVr5xzbzxxMbpyrl6Tu6DbPnS/yUy4m8VtSI1Ot56uKPuLftstwKr0qmGGuTY8+2VnnhbuzuAZJdoi5bq1jg0vJa5ZzShtlEZaNymAGO26mRU6EcKTWOiUwHMPO4YI4TORZ6SdoZINtyNVUJPTPky0n2ZmwAHSDnzIVr6BQegcq3aPAzNL1jNDul047TZjh4/76Ee6P42CNPkaGi0TMkEHNXeioLrGi25TvGDAdBjI2x7uIBTgYlKhJDkLRpGaH9WwY9b15B4rPD/HbZqYTuO0mxeRCDKzMKHK2RYfbEMTm3ESjxL1EFGcACCXuiYVVMyv96yNHKGtRe2YP3iQgy105yHJLgzezZa3vdamZbNNiStXVBWT1zX8+nIkPu7sN75seDpsKmQqTPPd14MAMb4UBQKgX7ZDj0fJROPhpraOdNn9AF2yQ96mi9GRpzClqFKHrifRsCerzv5j3ClR7Chi53b2MdFjfnp4ZEj5QWDNG6qoFOn0wUTokZn/TNWvJIG3fS+BzTQckReLsclB8q/DAonLZaX2s+kbD4jwRuIkiYQrS1ByUxrF5ZmqYmKHPGvbcibq69MOdrqkR5rME2DG/CxB13ZPfXy5M9WtKfGOskDOzu5FOitTk5p/IaaaLxGkHUwkkj0AJyP2N4REe2SIrYUUJ6Cml5kC5RnuPlTzuRGzBgg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8aafcd-3f98-4675-26a5-08db26f2fbbd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 14:22:05.2975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xYBQvb07WGqNSgcPTBSpw5KA54tZ59sQstN1FpYiiNCMKRcEJ3zhYPvMA94cd5WODGB4nX+t6jA4KtwkkwbpJ7F3MHFPnTgrPi4Kop6x2iU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6542

On 17/03/2023 1:56 pm, Juergen Gross wrote:
> On 15.02.23 09:31, Jan Beulich wrote:
>> On 15.02.2023 01:07, Boris Ostrovsky wrote:
>>>
>>> On 2/14/23 6:53 PM, Boris Ostrovsky wrote:
>>>>
>>>> On 2/14/23 11:13 AM, Jan Beulich wrote:
>>>>
>>>>> --- a/arch/x86/kernel/cpu/bugs.c
>>>>> +++ b/arch/x86/kernel/cpu/bugs.c
>>>>> @@ -18,6 +18,8 @@
>>>>>    #include <linux/pgtable.h>
>>>>>    #include <linux/bpf.h>
>>>>>    +#include <xen/xen.h>
>>>>> +
>>>>>    #include <asm/spec-ctrl.h>
>>>>>    #include <asm/cmdline.h>
>>>>>    #include <asm/bugs.h>
>>>>> @@ -32,6 +34,7 @@
>>>>>    #include <asm/intel-family.h>
>>>>>    #include <asm/e820/api.h>
>>>>>    #include <asm/hypervisor.h>
>>>>> +#include <asm/xen/hypervisor.h>
>>>>>    #include <asm/tlbflush.h>
>>>>>      #include "cpu.h"
>>>>> @@ -934,7 +937,8 @@ do_cmd_auto:
>>>>>            break;
>>>>>          case RETBLEED_MITIGATION_IBPB:
>>>>> -        setup_force_cpu_cap(X86_FEATURE_ENTRY_IBPB);
>>>>> +        if (!xen_pv_domain() || xen_vm_assist_ibpb(true))
>>>>
>>>>
>>>> Is this going to compile without CONFIG_XEN?
>>
>> Yes. The declaration of xen_vm_assist_ibpb() is visible (satisfying
>> the compiler) and DCE will eliminate the call to the function due to
>> xen_pv_domain() being constant "false" in that case, avoiding any
>> linking issues. The interesting case here really is building with
>> XEN but without XEN_PV: That's why I needed to put the function in
>> enlighten.c. This wouldn't be needed if xen_pv_domain() was also
>> constant "false" in that case (just like xen_pvh_domain() is when
>> !XEN_PVH).
>>
>>>> I also think these two conditions should be wrapped into something
>>>> to limit exposure of non-Xen code to Xen-specific primitives.
>>
>> I would have done so, if I had any halfway sensible idea on how to
>> go about doing so in this particular case. In the absence of that it
>> looked okay-ish to me to reference Xen functions directly here.
>>
>>> Oh, and this needs x86 maintainers.
>>
>> Eventually yes. But I would prefer to sort the above question first
>> (which I'm sure would have been raised by them, in perhaps more
>> harsh a way), hence the initially limited exposure.
>
> I'd rather add _one_ hook for Xen-PV in check_bugs() just before the call
> of arch_smt_update(). This can then correct any needed mitigation
> settings.
>
> So something like (note that due to using
> cpu_feature_enabled(X86_FEATURE_XENPV)
> DCE is happening in case CONFIG_XEN_PV isn't defined)":
>
> --- a/arch/x86/include/asm/xen/hypervisor.h
> +++ b/arch/x86/include/asm/xen/hypervisor.h
> @@ -63,4 +63,7 @@ void __init xen_pvh_init(struct boot_params
> *boot_params);
>  void __init mem_map_via_hcall(struct boot_params *boot_params_p);
>  #endif
>
> +int __init xen_vm_assist_ibpb(bool enable);
> +void __init xen_pv_fix_mitigations(void);

I'd suggest 'adjust' in preference to 'fix', but this could equally be
xen_pv_mitigations().

XenPV has very legitimate reasons to adjust things owing to it running
in Ring3, but "fix" comes with other implications too.

> --- a/arch/x86/xen/enlighten_pv.c
> +++ b/arch/x86/xen/enlighten_pv.c
> @@ -1476,6 +1476,23 @@ static uint32_t __init xen_platform_pv(void)
>         return 0;
>  }
>
> +int __init xen_vm_assist_ibpb(bool enable)
> +{
> +       /*
> +        * Note that the VM-assist is a disable, so a request to
> enable IBPB
> +        * on our behalf needs to turn the functionality off (and vice
> versa).
> +        */
> +       return HYPERVISOR_vm_assist(enable ? VMASST_CMD_disable
> +                                          : VMASST_CMD_enable,
> +                                   VMASST_TYPE_mode_switch_no_ibpb);
> +}
> +
> +void __init xen_pv_fix_mitigations(void)
> +{
> +       if (!xen_vm_assist_ibpb(true))
> +               setup_clear_cpu_cap(X86_FEATURE_ENTRY_IBPB);

If nothing else, this needs a comment explaining what's going on.

"Xen PV guest kernels run in ring3, so share the same prediction domain
as userspace.  Xen (since version $X) default to issuing an IBPB on
guest user -> guest kernel transitions on behalf of the guest kernel. 
If Linux isn't depending on mode based prediction separation, turn this
behaviour off".

But this does open the next question.  Yes, unilaterally turning turning
this off restores the prior behaviour, but is this really the best thing
to do ?

~Andrew

