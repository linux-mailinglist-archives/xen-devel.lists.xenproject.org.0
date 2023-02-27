Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F39FE6A4417
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 15:17:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502604.774475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWeJf-0005Jl-6t; Mon, 27 Feb 2023 14:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502604.774475; Mon, 27 Feb 2023 14:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWeJf-0005HO-2t; Mon, 27 Feb 2023 14:17:23 +0000
Received: by outflank-mailman (input) for mailman id 502604;
 Mon, 27 Feb 2023 14:17:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mutd=6X=citrix.com=prvs=4152eaadc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pWeJd-0005HI-My
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 14:17:21 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 704c6f68-b6a9-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 15:17:18 +0100 (CET)
Received: from mail-bn1nam02lp2042.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Feb 2023 09:17:11 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5014.namprd03.prod.outlook.com (2603:10b6:a03:1e6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 14:17:08 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 14:17:08 +0000
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
X-Inumbo-ID: 704c6f68-b6a9-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677507438;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=g8ZBbL6Zz79uxG8s769cQPheHMYZrBcW2zzJk2q67NE=;
  b=dYJATMAdcnLodYUDu5fZUCa43Z0gwEHUpcU/X5XdNAWHu2vlsq7AVYQ9
   77muE4PgIYWb8wHQKR75a+DgNXmueehQISUoJjJUvxX2F3kUC4UIpfzNl
   c0/2C4uyu5625onfimK0n6PzOGyVz1cBp5n5S+dUUWK3dLFMYgjawh/QP
   Y=;
X-IronPort-RemoteIP: 104.47.51.42
X-IronPort-MID: 101110974
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6nlmP67X7Tu+DjEsEOguowxRtAXGchMFZxGqfqrLsTDasY5as4F+v
 jYWWWGFbvnZNzOkKNpwbIrl8xlUuZ/WytRhTlQ6qX1nHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPaoR4weE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m7
 rsfKQ4QSRu/msmyyayjYLQvh/5gM5y+VG8fkikIITDxK98DGcqGaYOToNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OlUotitABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpLTeTgp6E26LGV7i8eGEY/cH64ndfjjg2lcupzL
 U8w4hN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8ywSWHG8fVRZadccr8sQxQFQCy
 Vuhj97vQzt1v9W9WX+bs7uZsz62ESwUNnMZIz8JSxMf5Nvuq511iQjAJuuPC4awh9zxXDv2m
 jaDqXBkg61J1ZJRkaKm4VrAnjSg4IDTSRI47RnWWWTj6R5lYImiZMqj7l2zAet8Ebt1h2Kp5
 BAs8/VyJshUZX1RvERhmNkwIYw=
IronPort-HdrOrdr: A9a23:zuOauKOm/WP4vsBcT+b255DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjzjSWE8wr4WBkb6LK90dq7MAnhHP9OkMAs1NiZLW7bUQeTTL2KqLGSuwEIeBeOvtK1t5
 0QFZSWYeeYZTMR46fHCUuDYq8dKbK8gfmVbJLlvhNQpHZRGsRdBmlCe2WmO3wzYDMDKYsyFZ
 Ka6MYCjz28eU4PZsD+KmgZU/PFr9jrkoujRRIdHRYo5CSHkDvtsdfBYlKl9yZbdwkK7aYp8G
 DDnQC8zqK/s8ujwhuZ+37P449QkN7BzMIGIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR0Xue
 iJhy1lE9V46nvXcG3wiwDqwRPc3DEn7GKn4UOEgFP4yPaJCA4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn93d7VTBtn/3DE7kbK0NRjwUC3Y7FuKIO5nrZvv3+9161wXh4S3bpXUd
 WGyvusocq+P2nqK0wx9VMfveBEFk5DYituBHJy9/C94nxuh3Z+wFIfxMsD2lk91L9VcegD28
 30dp1ykrdAV8kXar84Itwgb4+YNkzhKCi8d157BzzcZfo60rb22sbKyaRw6+ewdJMSypwu3J
 zHTVNDrGY3P1njEMuUwfRwg2TwqUiGLEbQI/tllu1Ek6y5QKCuPTyISVgoncflq/IDAtfDU/
 L2PJ5NGffsIWbnBI4MhmTFKu9vAGhbVNdQtscwWlqIrM6OIor2tvbDePKWILb2Cz4rVm72H3
 NGVjnuI8dL6FytRxbD8W/scmKofla68YN7EaDc8eRWwI8RNpdUugxQkli97tHjE0wwjkX3Rj
 oPHFrKqNLLmYDtxxe204xAAGsiMnpo
X-IronPort-AV: E=Sophos;i="5.98,332,1673931600"; 
   d="scan'208";a="101110974"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ik2WYiAo8gD+Bcs+j0ef38uU4N7HXr9K3n9mrUsrGbpkkT1BxzWyNE1mS+UK7SMjAnL/HSddW769YxngJf1D+0M2sz4dBUMKqDS1Xka2MpgbOWfwi2YhpkcyJwCULeTrxXDQxQbBynEhcGoLjjnX8Jl8hbj70Y6xYcrdF8LhhMnroWSgApSZTA7py1p/fOi1CH/45n6fdUNTNPKmMd6brr2tbVttNy1OJS9CwROg7DBWLZUfcohXY8kk6gnCwu0qloNOkqdVCpjjZ7hhIJdeq1OzLmhBme2O5/4XOLaprHA/WPXxEU5gGVFUjg5pNIuHoQBrJml2taGKy2QNesz6pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ueNVcfBc8YyM5ix0ulceWEu3ffLjDMdmh/rKYiuR8Qo=;
 b=C6yoCAZE5LOeS7EAO44AxS1X0GxW22sAKBd6Fzx2OnmJRQRW8dB1lT23IiW11zMUA36mHWuVs6QZ3eHcnVje1bDkY3VqJ1Zz0tcPNaWJqwZEpHlmXeUZPq43tKsONz7k93FzLU89wlY2rIf3IXeNWmuxo7QjHT+RTPryQFlHntG0/DRbCLi5+pK0Q62wQiRhx2wUUgxkCsDoIZLtZ2g02Q5XyUyRN+ss10lvZ1nVZJhIUuwscJxpp4zCEe+tXBx4xWlfVDDeZauUepn/rt5iXT7D0bjMDCMR453a1lqg9igjb0x+xprlKk9rQVDID/vwOn0O5whQkrK7aY3xy6b8GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ueNVcfBc8YyM5ix0ulceWEu3ffLjDMdmh/rKYiuR8Qo=;
 b=nfK6sq6qyuGqSANUKW7IreaCq2WGQepYwIxUbbUonIchcc3ni8VJWShHphXTQN/6weT2R//taFh/SgDtzE6XqCZf+QXTgr2OOaSZKbXbDH91EOfeGJqPl0m8v4o0W4WI2sIkpr77W0mf4Iw4VjvGJxq8+nVcblK7V6ndEmiJOd0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0f00449f-ab65-62cc-03c3-8f53b5f1251d@citrix.com>
Date: Mon, 27 Feb 2023 14:17:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/3] tools: add offsetof() to xen-tools/libs.h
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230227120957.10037-1-jgross@suse.com>
 <20230227120957.10037-4-jgross@suse.com>
 <8865a525-b55d-9b4f-ad2c-fe1f70afd0ba@suse.com>
 <809b25b3-1e8e-43ee-dc3a-1a54a938c9f7@suse.com>
 <da345d46-3027-f0fa-bef7-04494da35ac0@suse.com>
 <6a888edc-0b5b-117d-a216-ff28ad7bdc41@citrix.com>
 <0e933169-a5a6-08b3-aae3-8ebef988fb8a@suse.com>
In-Reply-To: <0e933169-a5a6-08b3-aae3-8ebef988fb8a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0293.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB5014:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d926dd1-5a0b-4577-0fda-08db18cd4f4b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yFio+re+Odx6wtTUu049JzWxymdV0gdTyi0Jb8u60dMOb4RrFaMXMdQRHe5QlVbfbjWAERSlGabfYkyk3YdXZtEQCeu5wASNjoxYgzqETTaBa2JO+qq2xKO8EkL8T4t1hsauNVtxppKfxBRsHi917+mSm5Mo9iOipOOcuqMJnue832Yg4vfWoR2TgTn+omkrpzVpNrZzYjAjLD6oyL/hDpSvMdMCWpEO2yEm+OhpNchdes2joZAiiBeyVjcX1fQa56S1njD3vVfkF5gAQL/9e0FMPbeb0kV2brYuw+rWO494BvLbyBO6LxT93YHR9LA+GrWd/F6PeyekXASCVT+wepDvmyiC1Wm87GihjzDRwtvzZtqtVVGyQndhpD7pZGkBJVoL+JUXYjZYQYeDZZfERvYpO5IViXyAlhvED31xUk3664ZxChSN5W0RV1gBbdvTLDAut2Gbsf3tlifo2K3fBmih7QJShjPQyt0EsIXou1lo1o6a68RM/IzZUbSZYHEFufdTxDSIdjgdIgCpO0VPyfBLQr17lzKfXP37D36Jg1ugJ4CWlaNoQXfivgRWDzA/kD83msiiJcDx/HGd+a3wKccFtDT64970Yhuz2EB1jYFgBgCfrITU1HliM6CtvkkHRgPMIWmrGW/Qcwt9gEI0zxh7eFFOudCc6mqOk00BlYMCS0kzmXwPhlTrwCg/CUPioFvgCIFRHg5hTtHYr8eBXBf3fzLbHp3xx0n5QBkdhrU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(451199018)(316002)(82960400001)(2906002)(31686004)(31696002)(36756003)(5660300002)(8936002)(86362001)(53546011)(6506007)(6512007)(66946007)(26005)(186003)(66476007)(4326008)(110136005)(8676002)(54906003)(66556008)(38100700002)(41300700001)(2616005)(478600001)(6486002)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tkw5TkNhVE9oUitRUlVvZXJKLzZKeUlvdVNsOVpYZjhQOElIRXFZNkl3NzlD?=
 =?utf-8?B?czByc0lTS3dRbXJhVVgrMWlCNnlBM3VJNTVoOUwrTEQwcUpjY1VhZjFQRE5x?=
 =?utf-8?B?UlE0NDNhM3BvMzB3Skl5ZTBBWG9heXc3NkxqQTFtei9tY05KQ0ZiMjdab3cz?=
 =?utf-8?B?bjczNWdKTzlmYkVLd1JZeGs2NUxaVUxBcUh0Z1NIcmNTYmpIK2FhTWZHRTFH?=
 =?utf-8?B?a2xwb241MlFZT2o3RWJDWnF0OFEyelFaSkEzeTkvbWRYVzFtRWVveVA3SlVM?=
 =?utf-8?B?MWRpRVovY2dIcnRublkrWjZsYXQ4c1B3Y25pOVJyRFljb2xFTTRSK05Nd21J?=
 =?utf-8?B?ZnFQZmE1SWxhWEczdnNaVXV6a2Z0RnMvblI1UHA0ZWtsK3JtQ0xVS1E0RVQw?=
 =?utf-8?B?OFY1ME42cDNWamVZV0krOVg0TkdtMWhlTWtWaEFMSlpadU5sSUxaZUNrQ1Ba?=
 =?utf-8?B?TmlUa3ExREQ3TmxhVmtXZW5CUCtrSnhsdVJoTkM1UzlmMGM5NTFYNm05LzNw?=
 =?utf-8?B?SHF0bXFyc3VIc2RBRGxOdndGVHoyV3diUnpFNHY3REQrQXNaNGowNmFSd2Nk?=
 =?utf-8?B?YjVrVDcwL1dlbnZzQWlkOTRvaW11dWo1N2g0RWh3QUdYNlBxbFd6UTMzOVlW?=
 =?utf-8?B?blRIcjhRc1ZScGwvbGxIRXlFdjdKLzZmckxlREFQdUFoOXltWFFSTkRWNUtw?=
 =?utf-8?B?enBkN2NodGROdmRhYWhOTHRDbWhNbkZrcS80QlFiTlFLaWtCUFJ0ZVhCV2NV?=
 =?utf-8?B?N3Z6cWR3Z2tGYkdZWG4xQ0xhNk9zczZlT2s4RXpUVlNNcUIySEt5MWhZNURO?=
 =?utf-8?B?WThzUU4wOUtoK0N6NU9yenptTFU2emc4RTBHN0cvaFF4NXhWdjhBZkk5ZG9z?=
 =?utf-8?B?MU14eWcxNnd3QXVaMm1EQW9Bd29mVTFvZE9YT2xVOHpxWnlHK3pFcnorMWRQ?=
 =?utf-8?B?dzJMUUl1Szg4NWNjRWNWWG5qeU40YmY2dncrcnRVM1QrckRwZWtLTEo3Z2dr?=
 =?utf-8?B?Z2QrU05JaTFNOFd0YnBVUGF3ZG5la1pWWlh6NEQ1RTNQNm1qeXovWUZ5L0VD?=
 =?utf-8?B?SnpWbzdxTjZRVkNXZG9BZXJQcGQvSU9yNmN0YjZnc3NqK1daclFHbzJmbytB?=
 =?utf-8?B?blVqTU5UMkpiV1I5dHdubFB5aTFlOE1raWsxSDdWbnRXQjNBTEowZXdvbUJN?=
 =?utf-8?B?Z3o4dnBCbElFdFIySWdlQ0xxSTcydEtDS0xiMzBmWWNSTXZyaTRBQk5nTUpp?=
 =?utf-8?B?SEZTYXlOaUM2Sms5Vkl0M3U3TzVtR3ZkOHB4ajBUL0IydlZIZnB6aWozdDJo?=
 =?utf-8?B?M1dNalVlY29yUjRhWHcwMWd1NW1rdXRncjFaSFBvVnhHcWtmN3lIQUpUTkcx?=
 =?utf-8?B?V1JQSTlsSVdId09VV09MTlVZZ1I2Unp3eHRpY3UwWXRTYWw3N2ZwU1ZPZzJz?=
 =?utf-8?B?WTYydnhZS0IraGJUOGl0QjVqRVNkRW9ZckRUT2pieVBTSWptaVNSaWFWdWV2?=
 =?utf-8?B?TUtwL2ErTUtNM2RXR1M0Z3h0TzFvblQ5SVJxSC9nRUp5MFBMeXdVVlFyYjJE?=
 =?utf-8?B?VmdxeWVMNisyL3dNRzhoR0UrSFAyOXFDZEhQNjJ4TjZ6QXcybWR4WndHOTk5?=
 =?utf-8?B?Mjk3c1JkT1UxZVF4TXhMaEFQT3ZBYlQrNzQxeEIyS2FxV2oxaFRjdlQzOCtr?=
 =?utf-8?B?cU90cGhuQTJieFhVTEVtN1FzUS9LM2Qxd2RML0JoQWFpTG16NmxNYVdBd1J5?=
 =?utf-8?B?VFFpRUFRYVM2UWVRZHNWMW5vaWV2b3JEMUFjQldBTm1pSFhGSlpnNVYwa3d4?=
 =?utf-8?B?Z1NJNlBVU3d5QU0yWGUrZGR2S3krc2UvSzc1MFRXVGN4eXFaclJUaUpVdVNJ?=
 =?utf-8?B?VExWZjc4RmhqOXNuOVdDcFRwQTJRRUd5aDRTZGhjWkF6QkxOR2loNmsyM0Vq?=
 =?utf-8?B?THhzczZ5L0NXSkhRcEl3VlJtSy9zTHRPempKaDNsMmEwUUNRQ2kwRmpRR2Nw?=
 =?utf-8?B?aG01UzhmY1U4Q3RFbTVldlNkNE4waW9kZXFhME5LZElKYVd4d2pKRHFiaGN4?=
 =?utf-8?B?WjBkWHF6ZGx5cG1sWkp6YXF2TmtZZWxFNis1aXZhb1Z6TUFKbUU3UXZBOEhk?=
 =?utf-8?B?VWJEYTNwelJLVmNmQllhK0Z4NktXL0FYQWJackNuMlZ0Mzd6NldBWnczZEl4?=
 =?utf-8?B?OFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	McK8BgwuTz+2DE1FtpRD/vxB2qoTfmSZbvW5cOgPtbNPeEoIhssGUc0fWGUju9jqI3t5naGFPDXxq3oDQtwbEyfU6VgFPN4sbj92dNym+sx0y0dls4QDgE2leMTVK4z9HtKXtnqDcrExTqdHPjG39UB16a4nfOXc+3/8u5bZU+2hXc7tG8BsYXXR2XWgMz02BCVngG5IzQk3iSXQPmUajaQHnSRw/wYouEAyhOorbqTlaTNVRofPnCl6v1E4L7OPZ1PBZN7GcpbAv1rvGPtWWva+8XqzQ2wneo/VsCArTAmfPaYp66ac7ZeQ11SR9mfY8udueqXVwKxPtRmmtSw+myjiV3cpf54p5r9L3yvg2rn7e5cSugavEgs6YMCncr1m9bQpuD1uqAyhe9gG4uvx2pX79RfaBy7Vhrw0bx9HJ+bhJ1bQAAsHknjZyW7d/szwhg9ikgoWF/2/j7L0NV5yz61gP3yTvQDwvJU0my8ekeaqAHoH2LD23V4oOSg6NURrBOhd3pCZWWQXllrKkqn8m2qm7ZdEIW6hbcCSRrzDAsDaehHQHx71mPPC5kJ2G+T/3Whg25VtB4B2ah48ZyL6hG0MkdPamyJooY2kXDvzEzqQ/Qq1L93rtY2fUvX54rdaXWXoqKC27mFFb2BZ/27Uzn04Nhel9eTkFvBU5iJfWE8DCl0Ts1TX0X5Ofpf3bsOS7srHE5QLTW7wg5G+gYp0WNh9il10cCRU4l9Bk95/S+K3UUlkWnnbI5yLi5rl1qe2GUXzsKAyVUJgJpEPGVnMPuwVaBkaMVYPzZWH02J0feej+WPdyMONYKBG2HbAkSq4
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d926dd1-5a0b-4577-0fda-08db18cd4f4b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 14:17:08.3238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pOqBhz6umJPVf2KCgDOffJHHpgJbazxJ42faqXPeJ6G/gpkE5+Y3+TPdgHGRO8HAbn+g+RoJ9uW1zuIbbecRcKzFbTZQQ0LdXbzYo5bZZow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5014

On 27/02/2023 2:12 pm, Jan Beulich wrote:
> On 27.02.2023 15:06, Andrew Cooper wrote:
>> On 27/02/2023 12:43 pm, Jan Beulich wrote:
>>> On 27.02.2023 13:34, Juergen Gross wrote:
>>>> On 27.02.23 13:31, Jan Beulich wrote:
>>>>> On 27.02.2023 13:09, Juergen Gross wrote:
>>>>>> --- a/tools/firmware/hvmloader/util.h
>>>>>> +++ b/tools/firmware/hvmloader/util.h
>>>>>> @@ -30,9 +30,6 @@ enum {
>>>>>>   #define SEL_DATA32          0x0020
>>>>>>   #define SEL_CODE64          0x0028
>>>>>>   
>>>>>> -#undef offsetof
>>>>>> -#define offsetof(t, m) ((unsigned long)&((t *)0)->m)
>>>>>> -
>>>>>>   #undef NULL
>>>>>>   #define NULL ((void*)0)
>>>>>>   
>>>>>> diff --git a/tools/firmware/include/stddef.h b/tools/firmware/include/stddef.h
>>>>>> index c7f974608a..926ae12fa5 100644
>>>>>> --- a/tools/firmware/include/stddef.h
>>>>>> +++ b/tools/firmware/include/stddef.h
>>>>>> @@ -1,10 +1,10 @@
>>>>>>   #ifndef _STDDEF_H_
>>>>>>   #define _STDDEF_H_
>>>>>>   
>>>>>> +#include <xen-tools/libs.h>
>>>>> I'm not convinced firmware/ files can validly include this header.
>>>> This file only contains macros which don't call any external functions.
>>>>
>>>> Would you be fine with me adding a related comment to it?
>>> If it was to be usable like this, that would be a prereq, but personally
>>> I don't view this as sufficient. The environment code runs in that lives
>>> under firmware/ is simply different (hvmloader, for example, is 32-bit
>>> no matter that the toolstack would normally be 64-bit), so to me it
>>> feels like setting up a trap for ourselves. If Andrew or Roger are fully
>>> convinced this is a good move, I won't be standing in the way ...
>> We still support 32bit builds of the toolstack on multiple
>> architectures, so I don't see bitness as an argument against.
> Bitness by itself wasn't the argument. Mixed bitness is what concerns
> me.

I still don't see how that would matter.  The bitness would always be
consistent inside a single translation.

>
>> I am slightly uneasy adding a header like this, but it really is only
>> common macros and I don't see how it could possibly change from that
>> given the existing uses.  OTOH, removing things like the problematic
>> definition of offsetof() is an improvement.
>>
>> I'd probably tentatively ack this patch, seeing as it is a minor
>> improvlement, but I think there's a middle option too.  Rename libs.h to
>> macros.h or common-macros.h?  IMO that would be something that's far
>> more obviously safe to include into firmware/, and something rather more
>> descriptive at all of its include sites.
>>
>> Thoughts?
> Maybe. One fundamental requirement would need to be made prominently
> visible in such a header: It has to be entirely self-contained, i.e.
> it may in particular not gain any dependencies on configure's output.

That's a reasonable restriction IMO.  Again, I don't see how we'd ever
come to violate that in the future, given the current use here.

~Andrew

