Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 420306BAC08
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 10:22:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509993.786843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcNL8-0006bG-Mi; Wed, 15 Mar 2023 09:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509993.786843; Wed, 15 Mar 2023 09:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcNL8-0006Y7-JX; Wed, 15 Mar 2023 09:22:34 +0000
Received: by outflank-mailman (input) for mailman id 509993;
 Wed, 15 Mar 2023 09:22:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DN/u=7H=citrix.com=prvs=431ad58dd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pcNL6-0006PZ-FH
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 09:22:32 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6f916d2-c312-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 10:22:29 +0100 (CET)
Received: from mail-sn1nam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Mar 2023 05:22:26 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ2PR03MB7140.namprd03.prod.outlook.com (2603:10b6:a03:4f2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Wed, 15 Mar
 2023 09:22:24 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.029; Wed, 15 Mar 2023
 09:22:23 +0000
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
X-Inumbo-ID: e6f916d2-c312-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678872149;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=JAZCYEk/6QhRdJkgXCJO7QvbaxYyIjijeR24io91KZQ=;
  b=gyAvrdP/KvMK3rkb8qY/njlI9CeB+kjS226R4b1h/9ghYUx5W1R8uMDy
   ZD/qZi79nk57yWAUwdKP3oke/JvZEgqMffbmGY6y46nbTUIffLRZvyTHt
   5JoyTFNIbRLagr2YJlp4WLbsOlzM8jQiaCgNKFYf2XkqtbU+mBs6hMFNH
   g=;
X-IronPort-RemoteIP: 104.47.57.45
X-IronPort-MID: 101329577
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:t36Y/K6/AN/KxHIDzFkxAwxRtB7GchMFZxGqfqrLsTDasY5as4F+v
 mBMXm+OOvmIZzf3etwlbdm290IPsZOEmodjSQFu/Hw0Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasS4QeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mz
 v0FeTxSdiG6neu9x5ygVsNl29skBZy+VG8fkikIITDxK98DGcqGeIOToNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Ok0otjdABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpLT+fpq6E16LGV7kNMAh8Za2u1nf/6sEunBcphI
 k4ZpAN7+MDe82TuFLERRSaQrXyDvhgHB4p4GPZ88gaGyqfP/wuDQGUIU1ZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9URX5NkcHbC4ACBADut/qpdlpigqVFoo+VqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTygbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:Da47O63EAO0SClum4W51bwqjBAkkLtp133Aq2lEZdPWaSK2lfq
 eV7ZImPH7P+VEssRQb8+xoV5PsfZqxz/JICMwqTNSftOePghrVEGgg1/qe/9XYcxeOidK1rJ
 0QDZSWaueRMbEKt7ef3ODiKadY/DDvysnB7ts2jU0dLz2CDZsO0+4TMHf/LqQZfmd77LMCZe
 uhz/sCiTq8WGgdKv+2DmMCWIH41qf2vaOjTx4aJgItrDKDhzOw6LL8DnGjr2wjegIK77c+0H
 TP1zf07KW7s/2911v12mLJ445N8eGRuudrNYijitU1Nj6psAquaYh7MofyxAwInA==
X-IronPort-AV: E=Sophos;i="5.98,262,1673931600"; 
   d="scan'208";a="101329577"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJkUGCXgSqgB/1eaGGQeEMTUC9/n30AoFCeZi4aHzxHr2BbiBfL1T1cUJ7tGEn1ATlAc/2Rrq5con0fgepTZr0YgS5KXCzS3RUeE68Bk9sJKeQlZt5SrCc4764vTnevr+HTME6wn4/xHfP/Pj1HfynNeUIGvCZp5MK3EMbwgFQHQKE1cfIy8/aNVBk/bFpNtMcdX1BPWt1+oC6OqvtSfXyR6O3pqt/fmsW4qkqX9asxFDKDaoND9gxTiPV/OR/0BjHWupw+w2g7fxPoYrMxHiVbB2bB1kPNsYih+ccLZkWrBxeY/PwBChxwVgl9VGXdjaU4T51H72qdZTKkHLVTtXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAZCYEk/6QhRdJkgXCJO7QvbaxYyIjijeR24io91KZQ=;
 b=FyMTaVomJGybj1E9pr2wS/BGZjRTg8syIgGWnEHc6stXSed0BrhuiRKQSXR8CqIjl8A1qlzOorcDxVfVAgo0cT6JAAZ7m73FYUD55l76omh0ntiu6IvIbSLAPX1hBtdmTovqtdb8rs/KVyNH/nktKfGkuMQciJSGGGrXMhzzPxw1+71GPIzlbno2Wtj+rGRrD/bh/ct8L8lC7wTzorWteLkrMLS2WGogdOU+MHz7ubwTwXpW/zEv7IyAR6CHoKKqh94ZX9USVLlAY/VzMYIL08NKTT+1dm5hZCaU2y4L7ZmFw4IlA+VQnYck8hfLKRAlgfHJvbQEOTKPm7d5U4WEZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAZCYEk/6QhRdJkgXCJO7QvbaxYyIjijeR24io91KZQ=;
 b=L2V+g8xxrO6E3JfDe5JRkGSWx2DevE5NevBgjrlOQ8PErmr63Gb6bEs2SHQ1TBOluqrZ5TOcn+wGeMhgIgTayoVEWuTqU1ib+3MhgrruH9EiVLHdlp6CxkbGwjq59EN58/x+x2TYFDA6kQh4kfa7XOaV7USIFhj4RXc1uYkoBRw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c12ff321-e1ad-1377-2158-195594fdbe04@citrix.com>
Date: Wed, 15 Mar 2023 09:22:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Best way to use altp2m to support VMFUNC EPT-switching?
Content-Language: en-GB
To: "Johnson, Ethan" <ejohns48@cs.rochester.edu>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <MN2PR07MB6045100322F58085DD6B1488E4BF9@MN2PR07MB6045.namprd07.prod.outlook.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <MN2PR07MB6045100322F58085DD6B1488E4BF9@MN2PR07MB6045.namprd07.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0202.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ2PR03MB7140:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b0365a8-097d-40a5-cddb-08db2536c8dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sAie/MfXKCmbnRQCCClq5OkJa4qJtAS7P2yVltu+2wrzPn/J6r5LBwyG1fgDTblsck022VmJSs2veqJhsUATKGq2Qik6pQWcK9m/k82SQAqWolD5pECldxsqd21UM57l4b11kOFqoXwDdv8xjpzPuBuRE8R8iizD8hoNnGuqHnLxVefJKx+LpJQ1hsqjA3fVjJDirXEYLNuiuNmjf/yfBNLDW/gdw42oSgogCDXVcyNQyI0sSGoD71WQe1qcczgw45AUAUR0Nr5W995lM+BxDApzZrzkldMJR3dPbGRf9DOKZ3PAdsZhUMVtH6FNm3GEOz+FpjiJc3P5hhY8DE0gNEeSJJXgnmRm1QnOkbbvckV03jFzOn6pK/pB5AMP22Xqwmiw/zEU4dcArdOfWvTFW5TAfkFpgRwKZFAPqmOvVJGa2lGG58u8+M8QCr+IKEL/C2sAOyAnHrrV1CRvhp0P/KAX7qDN+tr8TGUhgiSYnNS4EezbyOhpB2ZLFlNl5dipEFZkLKoFgL21PbBsPMdlMFmI2SpDnOBvTCyAa1sc/uS0RmG6X8o1Y+JelyBwz9kBkOqiunj2Tq9N7koTH/Ri4MnlPWNBghrdyZiyzwAay6yCIpdPbYrStMlGIfcIbOX3At1WY8IykGlNLVodzAKxZbFZJiKx8v6BXVX9q1CuElE9/dcfAiC7Ve+kZ684lJ60ks4wkq+wTC7a7MQpR4y1g6jy4jowTqZ3xsS4rvytl/AHYFmWA2Whc1c6ZB4UmDH3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(451199018)(31686004)(66899018)(82960400001)(38100700002)(2906002)(316002)(86362001)(478600001)(2616005)(296002)(6666004)(6506007)(110136005)(31696002)(53546011)(26005)(36756003)(66556008)(66476007)(6512007)(8676002)(66946007)(41300700001)(6486002)(8936002)(186003)(83380400001)(5660300002)(43043002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjJITU1XWktBd1AxUHlrYUU0ZWRvRDlyUmlRTjAvckgrNUUvdW92UWtVTHNw?=
 =?utf-8?B?OVp6UzZVZTJpcksxckIycCtqY1ZwK2lYR1VyS25acG1xVk5EZ2MvT2RiT1FG?=
 =?utf-8?B?bWFyS1MrdnpCLzF1TEIyNzZmV3BzalNONUZxaVRaV2IyamVlNU1KWHNFWFRq?=
 =?utf-8?B?MmhUMEJZLy9kT1BKVythaWFJbWhvWTA2bm81WXl6OUpMT3ZEYTYxT0RVYXdX?=
 =?utf-8?B?QnBVVkxnVS9yajU2WmhkNXhQZ2JhT2gwZjBKVGRpb3E2YnJHclVkcS9nSTJk?=
 =?utf-8?B?UG1JeUNhclFYVEtGTnRuREpzZld5WEczOFU3YTBwVHJPQXUzVGRQU0FJeisz?=
 =?utf-8?B?dUZlQXdBcXE3c0NwWkg3ME9OSmJSVHRKNUh1ejB5U1U3d2JlaGs2QzhwZUZp?=
 =?utf-8?B?anRnZ1VmOHRBZi81cjErK3dFRkpTaTNYeFcweXhXREJidFNiUXpRdDR1aGQ3?=
 =?utf-8?B?a0hDRXlBVmluR3FReVpGK1VSaTdSWGw5bDNIVzQzYkdvczlFSEszaEFDZzNa?=
 =?utf-8?B?YXNQNUp6N0wxd3dtU3dFTGpPbExLUTExNDFlUEJoTzhCeFhqL3o4M2NsNnhP?=
 =?utf-8?B?eDdXdGt3dXhFZVdPWElSaWhnN1NObC9hM2kxT2lKaFNpTlcwakxXQXQ0aFFQ?=
 =?utf-8?B?S3gxcGJBZWtFWm9tMHFPaVNMcDNNTExqcThLLzE2UFBSZ3IzN1lWZ0NCcjdL?=
 =?utf-8?B?T1RHRHRHcWdOQm5yUi9xRVN0WmpGRE5ja2tnZHdTSHhiRVcwQTk2M0EvMFQw?=
 =?utf-8?B?QWh4MHFsL1NzWWxRK1pESjRjMkJVcUxKUGcvN2hvOXlFc1Z6UVJMb3daWU1z?=
 =?utf-8?B?MW5tdHlWUkJvSTI0TUIycEk2MUQ0djhWYVd1bkVaeGRNVkZlUXhsd2ZkTy8x?=
 =?utf-8?B?QjZvdlN3dnNHeFY0ME9iUFFiS2Y1b042QlFweHJKdVFvYzRRdjM2U3BSSWJJ?=
 =?utf-8?B?eCtOa0VxRHR2Nmt6WEVzVjdjSkRrRHpUdE45S0JoeEl1OEVIcWMxUUY5SHpi?=
 =?utf-8?B?bFN1TTIrTFJhbE4wakxJbWJuUGlWTTg5TXovSHJKRi9HbjBrWW5DVHl1UTZj?=
 =?utf-8?B?SDAvMlRPTjdkVlZaUU9xcVNXbjJZY2JXLzliNEtNeU5tZktGc0pKeThEZ3BI?=
 =?utf-8?B?WFJNWlB5aWJOZlhYc1RESzBtd0RIOExBTkt6SXd1ODVaMXpNNUFRZWpEQkdk?=
 =?utf-8?B?Mk4vWXJLNUlzZEo1YWJVMkROY2dyYnpWTUVBdkZXdDRRZk5ZK3BLOCtkRGVH?=
 =?utf-8?B?RlZubnloRWNaWFpWdm90NjRTVDBNMFNOWlNIQ05MazFqdEZXTCtwR3VrVE55?=
 =?utf-8?B?c0hwOUFRZXZpMk5PYlN0Rmg2eXhkZ2JQd3EvY1lJbno5QnZFSmtFR3B3Umh2?=
 =?utf-8?B?bXZudFZJelBtbklFZlNaanBLT1laNkhPbEhIN29lamwySlRabmhPaG0zbWtn?=
 =?utf-8?B?T2xuTUowc1A0SFErV1huV1phNVBZdkRIWndwSDU4WVM1WFErbGNBcC9hYzZG?=
 =?utf-8?B?aVVpY05OWGRuQXYvUHdsWFViMG96UFQ1NzFubTcrcEtuREk4UElZNjV4b3VQ?=
 =?utf-8?B?RFkrVHJBSmJGUUlkZmZGUUlRbTNYaXVZMDBVV0p2dEpTQlA4K1lyOWpxY3Ba?=
 =?utf-8?B?WUhTZER2Z0FyOEc0SVNxUkhTWlpGVDc0dHJHYlpnL1AzM1JCZFBnTDNBUXBG?=
 =?utf-8?B?ek5ZYzRIQnJyQ2xIcDZFcnBkYmR5RmVReUdJN2N4eVJTbS9aSFV5ZUQ1WG9h?=
 =?utf-8?B?WnV5MEFsZ3dpVEhuOVdsRDNYVTlWOHNYTWQ4VGxSempkTEhCZVpDc08xeVE1?=
 =?utf-8?B?VjhpeGUrdWxSVzNWdkVBaGp2SmtDMDhxQ1N1MjJ4cGdmVSt6R0xYVFE0OFJD?=
 =?utf-8?B?OTBUczhOTjU1STRxc0xIRnNJcHE1UTRnWlUxSGltRXB0QkREUFhiRGRTOW5W?=
 =?utf-8?B?amlRWVZBV2NtbDhxSzlkMkZjL1dyejNKaDdRaDNFWHUrMGVLSEFpMjFBTVFp?=
 =?utf-8?B?N3ZmUGFyUlh6d0lNWnRIT0RBeXd5TVdBdnNoL3dycy91MzR3RnJNbHArR08w?=
 =?utf-8?B?OW15N0Z1WmRsbGdCWnhmRjBUZi9WNWxaL3ltMXozVlMwb3E4UzhQWG5kUGIy?=
 =?utf-8?B?dE5ndkJENGFOZExmMkFYZEp2bU5rcUR0b2hkWFY1OE53elhUOTdBekphMllG?=
 =?utf-8?B?bFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PKSuDjMSBgLOqeP12QFHJnGsEVISWPrp8acNrQF70SNGrDAb6WUJt60S8bcezoG2IMizDw6Y20pUFEqZ2Gmw3Y9x8VOkELq3cXn8bGZKHbGQrqLaYBhzykVIG+lmM9BXcFAmSKdBZBQwI7Dz4BW1b19SBrenlz19AoGBCvNYQoxG0tEfRn0uMT1r/3naKb1rTYo11n6wublhpWwo7MT2lAJo+S1r/T7JFie9NdmCYwgRbD75Kkwgp/13Ts6kO3cSi3NR69GsKDN9TmBU4miuNI0hW/mpXSkY318qZiVNC3YqkRO8y5zEt2ykkasVzQZ3yZ9e0VAyrabdGkv8Wz43oeIMEWsQVmQ430xnaDMA0gLHDKrW3PCUDdfGCEEsFbzxcyEATC2+Ux7XvZr4KWp9buHZe3/jllUYF1Cxb6r82IPj3UgciAjeGd6VnNFenUUirnBnOMYTGvKeG8+Jbcb4Ko3iYRcvhULuwLfnBArp7FskMDPmGbsOHleTJHz62ww2j10kq8k18vfp8xWCNp8FwMuh2lDppxCnyrebp6xABQt8XTaf7p9O+S+b7thOIsw3tqBnwAJdpUC0b2DozeXFAs7edHQb6bLtZx43gkyl0ymox6exlliet5g1nYUucai8SNHpF7rF7Q5a78+4oPl/QnOeu7iOMHmMfYxdOk8h9e5nzl/Lvs8F+9BbaxQtUO+FSYO943ao5miUrLxhEttGEGMCL7nt7vDOfFwGtLG/qNrscrs2ffE0UE7oi4AAW6mh0bMUOwS3BKCPUEwwbvhmQ3dmLIiQuD3mxaRuf/fJwpmeB+itGJlHs3uwb2lZPn6M
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0365a8-097d-40a5-cddb-08db2536c8dc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 09:22:23.5494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wd+LXUdISrXz0iOGWbJSqWEcg+hKtRDdOc3UZ/quLiQRVNFeCPctIkvTZncUN4NHBjSPwW3kzjhenJ+63yWR7TpW9NMaF7RTR95lWLUSTd0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7140

On 15/03/2023 2:01 am, Johnson, Ethan wrote:
> Hi all,
>
> I'm looking for some pointers on how Xen's altp2m system works and how it=
's meant to be used with Intel's VMFUNC EPT-switching for secure isolation =
within an HVM/PVH guest's kernelspace.
>
> Specifically, I am attempting to modify Xen to create (on request by an a=
lready-booted, cooperative guest with a duly modified Linux kernel) a secon=
d set of extended page tables that have access to additional privileged reg=
ions of host-physical memory (specifically, a page or two to store some sen=
sitive data that we don't want the guest kernel to be able to overwrite, pl=
us some host-physical MMIO ranges, specifically the xAPIC region). The idea=
 is that the guest kernel will use VMFUNC to switch to the alternate EPTs a=
nd call "secure functions" provided (by the hypervisor) as read-only code t=
o be executed in non-root mode on the alternate EPT, allowing certain VM-ex=
it scenarios (namely, sending an IPI to another vCPU of the same domain) to=
 be handled without exiting non-root mode. Hence, these extra privileged pa=
ges should only be visible to the alternative p2m that the "secure realm" f=
unctions live in. (Transitions between the secure- and insecure-realm EPTs =
will be through special read-only "trampoline" code pages that ensure the u=
ntrusted guest kernel can only enter the secure realm at designated entry p=
oints.)
>
> Looking at Xen's existing altp2m code, I get the sense that Xen is alread=
y designed to support something at least vaguely like this. I have not, how=
ever, been able to find much in the way of documentation on altp2m, so I am=
 reaching out to see if anyone can offer pointers on how to best use it.
>
> What is the intended workflow (either in the toolstack or within the hype=
rvisor itself) for creating and configuring an altp2m that should have acce=
ss to additional host-physical frames that are not present in the guest's m=
ain p2m?
>
> FWIW, once the altp2m has been set up in this fashion, we don't anticipat=
e needing to fiddle with its mappings any further as long as the guest is r=
unning (so I'm thinking *maybe* the "external" altp2m mode will suffice for=
 this). In fact, we may not even need to have any "overlap" between the pri=
mary and alternative p2m except the trampoline pages themselves (although t=
his aspect of our design is still somewhat in flux).
>
> I've noticed a function, do_altp2m_op(), in the hypervisor (xen/arch/x86/=
hvm/hvm.c) that seems to implement a number of altp2m-related hypercalls in=
tended to be called from the dom0. Do these hypercalls already provide a st=
raightforward way to achieve my goals described above entirely via (a poten=
tially modified version of) the dom0 toolstack? Or would I be better off cr=
eating and configuring the altp2m from within the hypervisor itself, since =
I want to map low-level stuff like xAPIC MMIO ranges into the altp2m?
>
> Thank you in advance for your time and assistance!

Hello,

There's a lot to unpack here, but before I do so, one question.=C2=A0 In yo=
ur
usecase, are you wanting to map any frames with reduced permissions
(i.e. such that you'd get a #VE exception), or are you just looking to
add new frames with RWX perms into an alternative view?

I suspect the latter, but it's not completely clear, and changes the answer=
.

~Andrew

