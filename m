Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D0166BDB9
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 13:22:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478596.741858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHOUe-0002LU-Dv; Mon, 16 Jan 2023 12:21:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478596.741858; Mon, 16 Jan 2023 12:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHOUe-0002Je-As; Mon, 16 Jan 2023 12:21:40 +0000
Received: by outflank-mailman (input) for mailman id 478596;
 Mon, 16 Jan 2023 12:21:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbzH=5N=citrix.com=prvs=37389537a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pHOUd-0002JY-0x
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 12:21:39 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51924566-9598-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 13:21:37 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jan 2023 07:21:34 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5035.namprd03.prod.outlook.com (2603:10b6:5:1e5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 12:21:32 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.019; Mon, 16 Jan 2023
 12:21:31 +0000
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
X-Inumbo-ID: 51924566-9598-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673871697;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=nEPNbfV9fzYc4e65rLHeg4BPShBWBRDdYMMKbn3od6Q=;
  b=eV2OWKlELrEk3hs7kSqcDvq2eXgKSizaBbl+SOzfoN81/08SsKUSwlTa
   uCjR27duhOPqtXTiGOdX32c94hzpoY6jYm0uZlV077R6frJrzXIifOCJ3
   g6EBB7oYJcwdDPHz+RtA0mYbY57kZsf3ZiRPRzQ8w+Yzobm/Q0143ZRph
   4=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 92793863
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+9uPiKjKU+XsfJXwzJFeiWjYX161QhEKZh0ujC45NGQN5FlHY01je
 htvUTjUOf3YYTTyKt0gYYvi8B4FvpCEyoVkHgpuqCw8E3kb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWt0N8klgZmP6sT5QaAzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQkFgsxYDml29uy55GhUPgv3NYSd8jSadZ3VnFIlVk1DN4AaLWaGuDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEhluGzYLI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6Refnp6U63gb7Kmo7JBIbX0meuveF13HiBIoDG
 XAV4i4PlP1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xGWwsXjNHLts8u6ceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDRLoViMA6tjn5Ys13hTGS486FLbv14OlXzbt3
 zqNsS4ywa0JitIG3Lm6+laBhC+wop/OTUg+4QC/sn+Z0z6VrbWNP+SAgWU3J94aRGpFZjFtZ
 EQ5pvU=
IronPort-HdrOrdr: A9a23:csPa16FT++L2WV8QpLqEGMeALOsnbusQ8zAXPiBKJCC9E/bo8/
 xG+c5w6faaslkssR0b9+xoW5PwJE80l6QFgrX5VI3KNGXbUQ2TTb2KhbGI/9SKIVydygcy78
 ddmtNFebrN5VgRt7eH3OG7eexQv+VuJsqT9JnjJ3QGd3AaV0l5hT0JbDpyiidNNXN77ZxSLu
 vk2uN34wCOVF4wdcqBCnwMT4H41qD2fMKPW29/O/Y/gjP+9g+V1A==
X-IronPort-AV: E=Sophos;i="5.97,220,1669093200"; 
   d="scan'208";a="92793863"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vcs8wcCY628QBMJzdk3hFoddwGfM1WcxcrZUyhMvAqeE4Qwj7aV6hT4Yk2iWAxRxtc3BNz1suJeJgjwAk5Fn+5zBu5nvvvY0amS3zlPaFDi6h+lkPMCbGl4KCpAVWJDGpmPckHhKJrPCqFqdEYPsRWobbG9CNNL4zw12ZH0wzDZSqQdUAcO77s8yREcRXi0LZI0gBEaKVEtt/4O2fiW6tTYjn/uBn9AiWyD+6Pjf0ALXJ+LpO5v8J5GO1b+PjX5ScK5wGolmHpetYjc2QjwdfAErsNy8hmRRw51hqaHm/zMdP+ygFRU/MBdByYQJiCkg4cAb9XhXW2Nydb0r8cSpLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nEPNbfV9fzYc4e65rLHeg4BPShBWBRDdYMMKbn3od6Q=;
 b=KSgvm27VD2utYYCEbIJOAZD0V5ggB8GXtFohXDaD/fHuTWMFQsoH6zQ5fZZhYEz+0AZ07hm2hSYvJo2SbN3aKWhCzshdpRJaUsy2+/ViuDVT75l5abFRJSeOuvFbzgQ5yDYXdbnib/AV0w12e61rY1K9OWG7QlfKcLrq7sNdLpwU6trH9hxnRvd5bCmVBLYV9WBUlqet2UvWAlXYOw0PMI3z61ZZMAFRUietkr7Vwenb4vd4xZ3JanPPhMWN2bBb82I4UAm+43kelskBYvSElLLhyXbOLriJB+VIqLOQEutKjAswgHLlv9gp64UL7swi1istJVB+ZBv2ZjfzQEJCHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nEPNbfV9fzYc4e65rLHeg4BPShBWBRDdYMMKbn3od6Q=;
 b=kX2OMvAG/n73zCc7GnjC+kluBSxivWCnx0r5Dliy1iD+LOINoa0ayoBrcYCKnxS4ztDr0Hs3YjSNx+ew9qdB2/P5w56bgkh/KzzU2p3G2/rFUL3VbKHoAaJZFLkbggUJlOh/PScYljZ8czW9INfaXw7sIpyckQ5CdTSCTlvYIKs=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 4/8] x86: Initial support for WRMSRNS
Thread-Topic: [PATCH v2 4/8] x86: Initial support for WRMSRNS
Thread-Index: AQHZJRefYU5gP8dknEybN3m0hZOPA66awNaAgAAQ7QCAABRFgIAGGeqA
Date: Mon, 16 Jan 2023 12:21:31 +0000
Message-ID: <9805e688-9205-096c-b8c5-ff4b8f162221@citrix.com>
References: <20230110171845.20542-1-andrew.cooper3@citrix.com>
 <20230110171845.20542-5-andrew.cooper3@citrix.com>
 <97d16968-57fa-0114-1a93-4d0d253b8172@suse.com>
 <2e568a8d-02d6-5761-8b55-c37a8de1be0e@citrix.com>
 <86519ac5-1f37-f3a9-f586-9c41f0ef66cc@suse.com>
In-Reply-To: <86519ac5-1f37-f3a9-f586-9c41f0ef66cc@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DM6PR03MB5035:EE_
x-ms-office365-filtering-correlation-id: 4745aa2e-8ea2-4c8f-c454-08daf7bc3389
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 +t8m5c4DK2faXUcLorW4SHCAHGdU5gTL9LHMss6dej/tCRsfEkFKgNl2qQnYaTxDNDG7owzVbATTvxWADjXsIHT1zAuWgxM5lzsTjroNu6sBZaeFM/WnafEKvqVz+u8Dfkm8htu+3hh0ANxiuYYQzAQUVM+ZMpGPyHP/FZCqvZ1Q/zOPxC1JP6/PXaZG8PFfgBov/3n7LCnxW3YlagYpfnfrE3gkeW1NgUFijes2o5ySMPHJBSSyV6q/EbZwkCXS1Ga3/j+lnj5EG2sSv39lctNpw7bwnP89REYS/75dZNhBonLWQk1a0+0qgti8QdeDw+XmQSsuZPYjCc1wMRNbKAIWdPgklnnzD+Cn2skgnypJMMsdCihqOPW/0VpPgf21BVYL7piG3GD1ykbLQOPdB1HUph8QC0xBph0wSkgSUmiXuFsOLPnDNpbUr7Q3Tjynoh3p7lc/20eY49kgDDCblZjD8rOg5AeReiIhpCeXsuQDKqRE5R7GwZAWzEHy98AaFzf5DYIYUcacD9XoREcR+ZA2UA3FA4uZb09DMEaDBiB8yBd9+25MjCIbrR2BKD2xcI1W+ctD8DJ9WAf3mgzXeo2yTQjgOaDlV4JCJw+HCbH4D0Cky7BGZn9x9nvx/EbZC06EZehV9Ua3yVRyybizbMqnNIGXg8PfkuRMNK7pDgZG7j/8m9tUpk5deFGgWAUMSrXIUXD4e9VQfpIJAisyKlRP7tcETgU7pH2W3xPCOf+Vk7tVJ0aMJ7aqSjBuMizaBPA/JR+jCz0TBpASJv4Dzg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(451199015)(2616005)(122000001)(54906003)(6916009)(36756003)(31686004)(316002)(71200400001)(53546011)(6506007)(6486002)(86362001)(31696002)(91956017)(4326008)(8676002)(76116006)(64756008)(66946007)(66556008)(66476007)(66446008)(26005)(186003)(6512007)(82960400001)(38100700002)(2906002)(5660300002)(38070700005)(478600001)(83380400001)(41300700001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q04zb1BCRERyeC9aZ013SHh0clBkOXc5Qk53VlZGSkhlcncyWEZQRFl4bE9o?=
 =?utf-8?B?L2tZbEpiMEcxeVdSNTNnL24rbTlBOUZadnV5aGtsL0JVY0hvaDRMVzQ5SEha?=
 =?utf-8?B?ZXBId21SUkJ3V3NRVzFFSzJFUmc0T3FIYURqNjNUNGhycklMSFRLSkZwV2tU?=
 =?utf-8?B?SEF2ZmhhYStEUnB6d0NxVXBUZXlDMVRNNEM5ZTA5aUpiQnVRNEEzcFl5NVJV?=
 =?utf-8?B?ZzRtUytDemhmcFRpNnZYeTNQNlJGNVhkWEVwT01PREZqNDJOZ3dwbWRNa3Zu?=
 =?utf-8?B?OU1HT041NURrUFM1VkF5cGJpVjdVNWpLMyszZlhkM1pMRFIxcUNyYjVMNElC?=
 =?utf-8?B?ZmFBYytGc0l0L3cxei95MXJCVGRXTHN0bUdIV1V2Ulh5RXpxbXQ5SDY4VDk5?=
 =?utf-8?B?ZmpDeWV5UkVjdU15V1RKWDFuSHdEL1pGVlBBTUd5c25rWE0zbEQrelUxUmRE?=
 =?utf-8?B?cERrb2IzcmFDNkd3TmVQbkFkTG5mcGFwODN3bkx6T0dDOUdadGMzWlUyK3pZ?=
 =?utf-8?B?UHpTSkNCOUVLRzd1UU1KRGpyWElrY2VpSlBnM2hPZ2p5ajJoTDVOQzdwZEpK?=
 =?utf-8?B?T09BTitodTRaTUYwS01sMmkyaU9IWDZvMC9DczZEVlp5TXRhNDBlUndNQ0VR?=
 =?utf-8?B?dTVsS2hJalRFMmx6ZDVWVHM2Zm4vYXltTDlFclhKL2s5ZEtYZS9HR0o1Tm5p?=
 =?utf-8?B?TTQzcXRtSVhPZXZqTUxTUG15ZWFwVWJxdFBaTUpobENjcW1mZmYwWTR1ODJ6?=
 =?utf-8?B?YS91Nkp3b1ZIdmZYS21HTEwxaUZDazczQjE0T1UrYVNsSUU4a2t4ZDUyeVlH?=
 =?utf-8?B?ZGZtbTIrMzNpaU9oVW9WQmhiN0lYNE1QdlFGbkpnZEhaMmg4WkNRVTkvb2hr?=
 =?utf-8?B?bHV4MVJKYU5pVkhmNVFKTTVld3RRdlB4bFZMTkpJQkxZNjJKTUo2a291WVBo?=
 =?utf-8?B?MzBGM010cjloMVJzWWhLUXY1SVBqS1d2VHlGczUzUVViREx0NEs3dHFaOXhL?=
 =?utf-8?B?bmNNTjc1RHl6blhtdGtFeGtySklWRlRaQ0JZdGJFczFLQ2kvUEhLT0U3Y1VD?=
 =?utf-8?B?RnN6NGNIL2grYmZrTXo5aWt4RnNKK3ZWbmFzSDJJbTdJeXBreFpjb05PSC96?=
 =?utf-8?B?clgxR1VONEM0QlNsWU5FRExQaU13OWh6RytkUkxaYlQxZ2swK00wVTFtUmlt?=
 =?utf-8?B?dUZHd0pFZGt5bjRUa2xvbUZtQXdXT0E2M3AyemIvL1ZvZVNTbUk2UFVuQUg5?=
 =?utf-8?B?VkRST3ZIUDd2TkVpL2pEUHhTNnZaeit6OTVGUk1iY3RIRFFJKzI1TWdBRHZK?=
 =?utf-8?B?ZzBwQXlUQ01QWFpQWWFnSW1KNXQ1RGh2SXhxZTRteW56MlhROE9qeGVHYlRT?=
 =?utf-8?B?WFpMNlpDWS91ZndZSnhQUlg4eFBVdHR2Szd1V2lrS2JuNjVYcEdBMU03dWx1?=
 =?utf-8?B?SDdPZWpDaWkzZjNXUzVPbk5oenZjSnlvZ1VEaWJueW9yQlorTzhMUHIxRjBo?=
 =?utf-8?B?Snlxd0JUME9YZVRGZW5xT1BKSGhsNGh0ME9vOG8xTVVQVW1kVzlIR2dES0pM?=
 =?utf-8?B?RW41VGdPYzdveUNjUk9DQUt5dW5DT3c5VHUxWm1YMFV6MmY3Z0dydktlNVpa?=
 =?utf-8?B?anBBNnBRbG94TjJ1QWl3U0E1cXM5andVT3ZEUHVCTCtrb25KaVlhbXpYRnlH?=
 =?utf-8?B?dUgwVm5MeW9pZmFFSUIrRlJGcVZ1T2drUTlYblBSTDhhOWNiM0FwTld4Q3N6?=
 =?utf-8?B?MHN5d3E5SmRvVnl1bVlwUk1ycElCbUVQSzdITnY1bzhQbDQ3QUxvUUZmVC9x?=
 =?utf-8?B?MVZVdTI1QnRXQnUwZXpaR01TVVh0UmVOa1NRT1h1V29rZjhuL0xGeVRxM2FO?=
 =?utf-8?B?MzNNQlhGdHpVNjhETmdFWU5BcktYMjZCUGhtQjlrcnBxaE9HTy8rdU42cWhi?=
 =?utf-8?B?cEpPOHNxLzNqSUI2U2pOZ0U3TkdraGFDUE0ydU5FeXVnR1gvMUpKck1FbGtJ?=
 =?utf-8?B?T29ZM1JzT2NGUjVEZWYvQWdFbXpyemZGR1Zkei9KTHNZVUJ2YWRQNnRqbVM2?=
 =?utf-8?B?N2NLc0hodDJuVnVhZDg3Y3kxcGhQd0dHYXJoazRZalA4Y081dDlVNkRNM3B1?=
 =?utf-8?Q?56uUHjTsMmlNdB0C8TInUU77W?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7EDF0A91C02494384D59CB519C5D7DF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2/7p3CkCL/fpM+3U4nr0srcpL5X+NwJD7ZGPKM2TQyjV1AxuzOXUP6FGYA49Ikir8rsLLW79scyVU6q9QrAdkUszfJ3ofWYvHkUKHktbOwNsJ4M2LCgaiqF8PKIF/CXy3qgtAO2u98FazN0Re3l4fXMgQ37HVChwI6cYc4a5GsoHPGSZPEJYjNvL+PNAT3AkiudNxF71ymHcWYFNgU0ZINIDx28mECo+ixe1vYSSMhuUWC2hIcn8QPEh7molzTBR2PRMVvZuwkPCHPo/cnjhe9hLfky2n8wUPu5WDBRK6qs5hFbhDD17r/huwuQkLZVRo+jlH5DgASKgPahLTW+TmfFgZy2hbrTxWAkSGdh9aPJi2OONT/V87Cc8cZ4mq9gZ72PCFMHuFr8rRQrX0g1qNs3KOO9D2OAQew9rGaEgO8omANBjz9aFETBDJcaeZvJllx9hajdcvZgWAcWEJcr+FkngwlyVPtlGO69uQQkDfabcoPu7eFgastlo/DwCWRjo9lf8+dr/ty52f4NyUgoVr8PKYb0bZxVZ0lJXjegS7Y6rLM4rMEp9I+6jIn8tVjuX5AQhS4vKeNTv7Iya/+z55NGEzhn7dT5N1AetZYiAv5QoYF8dd2NNheON+RT/vYAdNCaOggsrsotjdQhxdoF52XHGqws9ARkx5YjVhsybNwi6fLyQbr9RGppyKlg59ZuSOf3cpWp20UGkhjm/J+arsrFGb/SjmqKMl8syedYjvg/Wd/VhB6OzodK7O6I6akRYom3p5XiDUPZbjJvRrKEqG4UDbpFu9WJ2OHRKyOr2rNPhQBF5Z4Gh4/KCmDyL9V8POLRoOtmWI2jpGuVBRSxARg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4745aa2e-8ea2-4c8f-c454-08daf7bc3389
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2023 12:21:31.6300
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hv2pjcSU1lg5jenL3OlSYTzZuzgHdBsfTsS95nIhxMHgEpEhfuIqumpEKGhL3/WVFJjLKWpL29TIQoQflHWLKdxe92j0385AgPeWu9xYtVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5035

T24gMTIvMDEvMjAyMyAzOjExIHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTIuMDEuMjAy
MyAxNDo1OCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IE9uIDEyLzAxLzIwMjMgMTI6NTggcG0s
IEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IERvIHlvdSBoYXZlIGFueSBpbmRpY2F0aW9ucyB0b3dh
cmRzIGEgQ1MgcHJlZml4IGJlaW5nIHRoZSBsZWFzdCByaXNreQ0KPj4+IG9uZSB0byB1c2UgaGVy
ZSAob3IgaW4gZ2VuZXJhbCk/DQo+PiBZZXMuDQo+Pg0KPj4gUmVtZW1iZXIgaXQncyB0aGUgcHJl
Zml4IHJlY29tbWVuZGVkIGZvciwgYW5kIHVzZWQgYnksDQo+PiAtbWJyYW5jaGVzLXdpdGhpbi0z
MkItYm91bmRhcmllcyB0byB3b3JrIGFyb3VuZCB0aGUgU2t5bGFrZSBqbXAgZXJyYXRhLg0KPj4N
Cj4+IEFuZCBiYXNlZCBvbiB0aGlzIGp1c3RpZmljYXRpb24sIGl0cyBhbHNvIHRoZSBwcmVmaXgg
d2UgdXNlIGZvciBwYWRkaW5nDQo+PiBvbiB2YXJpb3VzIGptcC9jYWxsJ3MgZm9yIHJldHBvbGlu
ZSBpbmxpbmluZyBwdXJwb3Nlcy4NCj4gV2hpbGUgSSdtIG9rYXkgd2l0aCB0aGUgcmVwbHksIEkn
ZCBsaWtlIHRvIHBvaW50IG91dCB0aGF0IGluIHRob3NlIGNhc2VzDQo+IGFkZHJlc3Mgb3Igb3Bl
cmFuZCBzaXplIHByZWZpeCBzaW1wbHkgY291bGQgbm90IGhhdmUgYmVlbiB1c2VkLCBmb3IgdGhl
DQo+IGluc25zIGluIHF1ZXN0aW9uIGhhdmluZyBleHBsaWNpdCBvcGVyYW5kcyB3aGljaCB3b3Vs
ZCBiZSBhZmZlY3RlZC4gV2hpY2gNCj4gaXMgdW5saWtlIHRoZSBjYXNlIGhlcmUuDQoNCkEgQ1Mg
cHJlZml4ICppcyogdGhlIG9wdGlvbiB3aGljaCB0aGUgYXJjaGl0ZWN0cyBkZWVtZWQgd2FzIHRo
ZSBzYWZlc3QsDQphbmQgc3Vic2VxdWVudCB3b3JrYXJvdW5kcyBhcmUgdXNpbmcgQ1MgYmVjYXVz
ZSBpdCBoYWQgcHJldmlvdXNseSBwYXNzZWQNCm11c3Rlci4NCg0KVmFyaW91cyB0b29sY2hhaW4g
Y29kZWdlbiBvcHRpb25zIHdpbGwgcmVzdWx0IGluIGBjcyB3cm1zcmAgYmVpbmcgZW1pdHRlZC4N
Cg0KVGhlcmUgYXJlIGEgc3Vic2V0IG9mIGluc3RydWN0aW9ucyBmb3Igd2hpY2ggb3RoZXIgcHJl
Zml4ZXMgd29yayBmb3INCnBhZGRpbmcgcHVycG9zZXMsIGJ1dCBieSBub3QgZm9sbG93aW5nIHRo
ZSByZWNvbW1lbmRhdGlvbiBhbmQgY2hvb3NpbmcNCkNTLCB5b3UncmUgYmV0dGluZyBhZ2FpbnN0
IHRoZSBwZW9wbGUgd2hvIG1ha2UgbmV3IG1lYW5pbmdzIGZvcg0KaW5zdHJ1Y3Rpb24gZW5jb2Rp
bmdzLg0KDQp+QW5kcmV3DQo=

