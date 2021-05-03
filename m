Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80027371F6D
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 20:18:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121789.229697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldd8r-00088T-Hu; Mon, 03 May 2021 18:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121789.229697; Mon, 03 May 2021 18:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldd8r-000887-EW; Mon, 03 May 2021 18:18:01 +0000
Received: by outflank-mailman (input) for mailman id 121789;
 Mon, 03 May 2021 18:17:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gWh3=J6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ldd8p-00087z-6f
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 18:17:59 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1d4790c-0a37-4d53-9555-280004b591a7;
 Mon, 03 May 2021 18:17:57 +0000 (UTC)
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
X-Inumbo-ID: e1d4790c-0a37-4d53-9555-280004b591a7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620065877;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Y9b37xMBFTD9E38XE3lJ9Vu2vpebJECfdcQbYgYEvTk=;
  b=a/6VeYg9xYPlx8/oP+yh4KmIfUrpcM3Oakw8C/iQmUnoqFGOuuNnJaoQ
   gmsyG+egJEAwvUdmsBVVqAKYjpwR4f3Vo61LNwFLX7FZ4twWY+hD0kuex
   HKcvhHdr/n8d1hZ7ZnnHP/o9Zdad+5yFbMBcTEqnbgpC231Pvb39wwcpY
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: f0vie2CDhUh7uhAFGRzbzO0+yGqIzSyk7Lz48kd0i+8UFFnZbBpEKFidN2bG2ap7gXVz9ZTaiC
 FlqQr7PDVRX7olxN2x12Ok0Nl0Dec5aP3UnvhWl1Zjx4kNfDA8D1N1HytvQwh6RiehAz6ew+H7
 fWvLauZ6EqUYdkpyOJC058EFq2gFt/aidAf35vSQQRiKloImt7CCcz3gkNPv0lmLmZPt3fUCkT
 IQpWYI7IcbSBN5RsrLhQ47Hv2y7fh7o8P+BiGLOPtCyQDWjFgF/EwHFp6PGExVzizvMUMlpKCF
 Wzk=
X-SBRS: 5.1
X-MesageID: 43346468
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:+/qxW6tpShlGXeB6vovBEKIW7skC2YYji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOj7U5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qz6Y
 5JSII7MtH5CDFB4frSyBWkEtom3dmM+L2pg+Cb9Ht2UQR2cchbjztRICzzKDwTeCBtA50lGJ
 2Aou9OoDS9cXoaB/7LeEUtde7FutHNidbaehYAHREq802jijmv5b78HXGjr2gjehlIxqov9n
 WArhzh6syYwo2G4zL/90uW1ZRZn9P91sBObfbstuE5Iijh4zzYH7hJdKaFuFkO0YeSwXYs1O
 LBuhIxe/l0gkmhA12dhTvI903e3C0163nkoGXo80fLhcDiXjo1B45gqOtiA2PkwnEttt19z6
 5Htljx3/E8YGKi7UaNk+TgbB1kmlG5pnAvi4co/htieLATdaNLqsgn9F5Vea1wbx7S0pwtE+
 VlEajnlY9rWG6dBkqp21VH/MahRTAaEBuAXyE5y7ao+gkTtnV4w0wE/dcYj3cN+bksIqM0l9
 jsA+BGkqpDQdQRar84LOAdQdGvAmiIeh7UNnmOSG6XWp0vCjbokdra8b817OaldNghy4Yzoo
 3IVBd9uXQpc0zjJMWS1PRwg1HwaVT4eQ6o5tBV5pB/tLG5bqHsKze/RFcnlNbli+kDA+XAMs
 zDeq5+MrvGFy/DCIxJ1wrxV915Mn8FSvAYvd49Rhanvt/LEIv3rebWGcyjZ4bFIHIBYCfSE3
 EDVD/8KIFr9UawQEL1hxDXRjfDYUr60ZVsELXL3uQaxYQXX7c89jQ9uBCc3IWmODdCuqs5cA
 9VO7X8iJ62omGw4CLp4gxSS11gJ3cQxI+lf2JBpAcMPU+xW60Eoc+jdWdb22bCAhd+SsjRAT
 NOvlgfw9PwE7WggQQZT/63OGOTiHUe4FiQSY0Hp6GF7cD5PrQ1E4ghQ640MQnQDRR6lUJLpQ
 54GU85b36aMgmrpbSujZQSCu2aXcJ7mh2XLcldrm+ak16dq8EpTn4yRCWvTsaTvAYrS1Nv9x
 hM2p5apIDFtSekKGM5juh9GkZLcn6rDLVPCxnAWJ9ZgYnxeAZ7TX6DgBuTjx1bQBuyy2wiwk
 jaaQGEc/DCBVRQ/lRVyLzj/l9PemKBRE5ocXxhvYphFWPJh2Zr3YawF9+O+lrUTmFH7vAWMT
 nDbzdXGA9oytyt/DO+mTqJFxwdt9gTF92YKI5mX6DY23urJoHNqLoPGOVM+o15cPr0tPUQbO
 6ZcwiJDT/xBu8zwTaJrnI9NCQckgh9rdrYnDneqESo1n82BvTfZGl8T7YAOteG8izKQe2L3J
 gRt6N8gcKAdkHKLviIxqHcY2Qddlf9oWuqQ/oprp4Rl6Qor7d3F4TaVzyN9Hwv5mRJEO7E0G
 clBIJ86/T9H6UqWeo4USdQ5EAom9SCN1FDiH29PsYOOXUWy0bGNNaI6YfSobUhAke9tBL9UG
 PvhBF1zrPgZW+/zrYUBKI7HHROZGU94Hpk+vmed4e4MnTiS8hzuH67OGS6arlTVeysHqgRtA
 9z57iz7qOqXhu9/ADbpj1gJK1St06hXMOpGQqJXcpF6cazN1jJoqyk5qeI/XjKYAr+T0QTno
 tec0MMKuxFlzk5lYUylhGIdZafmDNvr3JupRd9llDs3YC64GDUWWF+WDep86l+bH10KXiHjc
 PM7O6C8m/yiQI1gqX+KA==
X-IronPort-AV: E=Sophos;i="5.82,270,1613451600"; 
   d="scan'208";a="43346468"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fgQJkSFhDjRWN1m7olL8ZD2sNIukdQrBm8I6zZfCjq0ofZ4sEF3bwgUEX39h3H9Vy9Q8ghjO4wQ46wohCk/B6WYLiiHU4ZuNiThtrpcfqr+rmkYYjA83CVtNZ+TPO/a3eQ3Kg+IFWL8Esth0gFTZ3Kgkqxjl0RbTM5LJhJDnZJP0FYa6RtxKixULQ3htKXtsSGq3Uincfeg/EfzUR6IOQ0tl+Ui8sHqXG5jFcXBHgA455O6XRKyA6lUa3L/L3hvJSDmkDqj7dggeuxMXH+Jn6MPvgJYjgEX5s5+kBSxaviiBtF1iu2HUu/rsS9rHiZfn37KJeH8+LEgLZFpJswkyiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMVq/PVM5fTVIL1pWHdqj1g4J5WYn+Z6zPmOXnMPNjU=;
 b=mbMbOwjHtyz5Cv0+y2fs6P9eUYiZ9CLXI3k/ehYKAHJ6OD4N+VHLy/3QwR83YvmYSqXNOgAKko5q5iebxjFqRdFu3aDYxC8MRnMpNkgfxBYqct80SbGsZIB0bsGRRIpqwM3izplnmfer+b7aSBP9KWYXK7A+VNOaWYEKEDJZ4zUdD4XZ+YKg9mgKf71+0rVWcQ+cJpgZQaFMkvXMRpL6cfO/YdE2vuBQsYJZDs7W/VpjVIewjCPFEmvPi/viu7SxC5o+WvmeFKSYY6XuvmJrTrHzgCNNL1l9vXhnenYHplYArrWcm5NuSC+ayxCfJ1MTG1zsYv+qSRIzG8Ge1jlqyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMVq/PVM5fTVIL1pWHdqj1g4J5WYn+Z6zPmOXnMPNjU=;
 b=Poo8t0/BYT/zzU9awm+byz10R6bvXn2xcP2QEwiY91n4b41FZ12rtWuOyIsLymyfmdDjEtDIsTUOlKsg9/ZLvHmyqK/WdZ0PSHKj9UzN1BzoCsbysBXiaOjyjAHL+QVHT0EG67gDhqaeI//8YRMO4gfW5b8GQDwBNE9cqnNVmfU=
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20210503153938.14109-1-andrew.cooper3@citrix.com>
 <20210503153938.14109-4-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/5] x86/xstate: Rework xstate_ctxt_size() as
 xstate_uncompressed_size()
Message-ID: <a8487667-1f47-1aae-1528-4a1224cbda7b@citrix.com>
Date: Mon, 3 May 2021 19:17:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210503153938.14109-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0158.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d32732c2-be5d-4cef-acac-08d90e5fc525
X-MS-TrafficTypeDiagnostic: BYAPR03MB3430:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB34301248D1D284E54C13DF13BA5B9@BYAPR03MB3430.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 87tfWVLZRHRLPqwAIlP/9FfLDdwRSEHLMynt1Zq3PR0QvgwAFXktiNpxJ1YCJGIDjNiQfghAMx/7rJu7MnKfgi0d72DJnjRomtsdv0+kSKsKNdrYCtcLoKSERaxvzsQ1BqXvQv1xGQL+Xti+cHW6tV4xea6KeB6aK2SsbO1XV71WIn86ITAX1Zo+vc4ImkWQYiuU0MlpKWyD2bGeGfAc4VX2dAdfAsqR26gUeYSM8A6lI+lCt5feOsE6wxkUMXeo94M7cKQEzIlptnBUfEdta8owPUblZPLBU2W+Li0RKggTvIN5ZJAQUzRtUiDjS3NSXzyD34nzlpi/jrb3ACIALhzpEfbhl81Wvy2R1u7Xcxz6U1FdWtjdY0mdsC62PWQGdWEShy8G0vHOxze/SMKCkvnZOJEgHZMzu+fEReGvJesrYU0wdv1rZsILZdi0Xj1ud0CScNRQ9XUblfk0UKLJUn5petXJrW/f7kXoJivhAWnhfv/UnK1hxB82BFiNMP+Lk+FFPxckZwgY2L6hzsq6rlv5PHfGtZXxWy47NnNH+oNDtED3Mgzay9t37mSmHdaekrmG1nzvTawhRMdF4FPWtj/pfUI8r6jXkwAhkglVTfWt14/TwZFzkwU5SbDoN0g7fFU/7B0jewJ6IiKyHz7+dx+JfCCK8RirFz1eRvqyxB1y8E0RLDJHZgji8IQwU2V88dhzCS5tfFme0WKunJcsBbLbswjT8pEw3BpC69OCOHdajbllxRHyhdNVVUwLrDiavdkFPt3CFWysfO6L07aH7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(53546011)(4326008)(5660300002)(8936002)(6666004)(6486002)(31686004)(38100700002)(2616005)(86362001)(956004)(478600001)(36756003)(16576012)(6916009)(186003)(54906003)(8676002)(316002)(66946007)(66476007)(66556008)(2906002)(31696002)(16526019)(26005)(83380400001)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZzFsMHhVMTlLQmllc0daTTlzaDZZM2lwK0NUb0hCNTFKbFYrVWd6c0h2RDNX?=
 =?utf-8?B?TmNEaXRXK25TaHZtOEJBMkFGcEpNd3dwUXllN1lZVVpWV0tsWHJVR0p3eUFj?=
 =?utf-8?B?N1ZrY0JuWnE3SHBzK2gwTmMwTzlzdGZzbTR3Mi9OQVlGR1FLY3BPR1B2dkVh?=
 =?utf-8?B?djRJd1R0eERud240cUR6RU5XUWpxdWpjck9nTDd6TzVXWFpVWDJDVzZESjk4?=
 =?utf-8?B?MXhIWDhIQ0ZxanJsNVg3RmhOMEtkalh6a2hwMWZqR28wTW5xNmxicUk4MUsx?=
 =?utf-8?B?RzIwQ0czbkRkd0VUSWhFTFRPQkIwTnFsUnBYT3NhL1h5clNVWDJUSEFXZVdz?=
 =?utf-8?B?eDhPbytEVURVSFhwczV1KzdTSmJ0M3hKUGlZYWxpYlo2aFVnWXJXc2x1bGdD?=
 =?utf-8?B?Ti82em1Ea0Y1cXFuenVTK2t6NlRpQmsxWDczbjN5Y0VGSlhiWnBKWVgwOU5l?=
 =?utf-8?B?S3N5dHNwblFxdGZFcVVaU0dxOHdZY0JyWldNVjFtaHFMMFNOZzcrNkc3MjJT?=
 =?utf-8?B?WGxyYitJeXZXdjdrL2Voejh2M0tNR1pINGs0OEdUT05jUkROZXRLVitYSUMw?=
 =?utf-8?B?RWx1MWVqVnc4K3JmeXFWUEVCRmZFN296M0tIUFh5R25vOTExUWhJNzRkSnZ0?=
 =?utf-8?B?ZHI1VER3ZDUrTFk1SG9UakU0dU9pMnZOaXdka2NZdWtzRDJINVgzbWJmSDlq?=
 =?utf-8?B?ZHZ4OXRmSThVSGhtVmxndS9qRmErcGpZV2FDK3hSM2JqZ3oyakZsYUxvaHhD?=
 =?utf-8?B?QnZCQTR1NExOTnlCMW1oYjllRTczZS9lc21sdXlxeGc4RjkvakdmUEZQYldi?=
 =?utf-8?B?T1E4WVZCK2xsV3BIQ3FtdG41cmMvaDFwMW92UERJd2tORW0rYlhEYnVWdHRk?=
 =?utf-8?B?K3RtQlYzUWhHS2JFOGJUM3FPTzZ2aFZPSHhTUnBWQjBvUVV6Q0hjYWd2Ukgw?=
 =?utf-8?B?UXB4a1VvaE1KSG9lWWM4M01jMlVSNXR3NDlHQ2g1Q0dack5OQnlvNmtLNVBv?=
 =?utf-8?B?MDlJMFRDZUFWbXluY0tTc1JZaUVSVjdQSVp2UFVhT01URDBzNTJ1OVVhdnMv?=
 =?utf-8?B?ME1kc3BqMnlqUjl2eUhpbUowMXNsTk1kREl3S0pKb3VMVVd1bStsZnRLWTEw?=
 =?utf-8?B?N0FhQXFmSDJhbVpFbGhQNjVyTWFsZ0JObVFyN3lCNk0vWGhheFZ1RHRneU4x?=
 =?utf-8?B?ckFROWtua2J1bllwZHkvSnhoT2tLUEJ5b1NaTVQ4ODF3b1ppTVQ2eEY3b0Z5?=
 =?utf-8?B?MlEyak5RTTRldVdUejBwRUh3TnNiQXhWYUJkNld0YkNFNEswRXdlUFQ1MFFk?=
 =?utf-8?B?QlY2dloxM0VycEw3cUJvOWhidzY2akVjMVpONnNvSUptaEQza3ZUUE1GYXFZ?=
 =?utf-8?B?WXdJZHFFK0hQTWRsZ0tkcXV1dk5VTWtyOUxUSnpwN2tjVjh1QlZUMngyWTJk?=
 =?utf-8?B?eDRSdUp0Ly9qNmYxTVBpd0l6VHBmQ1R6S1VpcjFRSE8zQnRpUXlFdTBBa0N5?=
 =?utf-8?B?LzYvWjlJdUNMbWVVTTJNR2gxMVc4K0dZQXp4S2FGTUFVTEpOUlhXdHpLNmlI?=
 =?utf-8?B?bDFEZjlsVEdmbGdUTUkrcUppVTdacnhlbmNPdmYvSWNPZjNJRUtheE84QXgy?=
 =?utf-8?B?M2xVY21FMUhKWWkyTWE5c0YrREszNmY3NHYyNDNlZVBVUkhmV0FGSVhXY1li?=
 =?utf-8?B?SzNVdjM1SFl0dHZ1ZmV2c2RPVkppd29SWlNQL0xUUlNvbU5UektYUzcwU21G?=
 =?utf-8?Q?KiTsXIqT2wEUMJHsmy+fsTp1zFj3vjEB+gWBLe4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d32732c2-be5d-4cef-acac-08d90e5fc525
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 18:17:54.3697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MC41fg+Oht054VjBgW87RRCdIsB3isS2wzI1UqBfTr2RH0vV6kXN7/QPwjL/frrrDEOVu7C6MVJ0Uprlcl739FecMdK0VcPUUI9151HupZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3430
X-OriginatorOrg: citrix.com

On 03/05/2021 16:39, Andrew Cooper wrote:
> We're soon going to need a compressed helper of the same form.
>
> The size of the uncompressed image is a strictly a property of the highes=
t
> user state.  This can be calculated trivially with xstate_offsets/sizes, =
and
> is much faster than a CPUID instruction in the first place, let alone the=
 two
> XCR0 writes surrounding it.
>
> Retain the cross-check with hardware in debug builds, but forgo it normal
> builds.  In particular, this means that the migration paths don't need to=
 mess
> with XCR0 just to sanity check the buffer size.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

The Qemu smoketests have actually found a bug here.

https://gitlab.com/xen-project/patchew/xen/-/jobs/1232118510/artifacts/file=
/smoke.serial

We call into xstate_uncompressed_size() from
hvm_register_CPU_save_and_restore() so the previous "xcr0 =3D=3D 0" path wa=
s
critical to Xen not exploding on non-xsave platforms.

This is straight up buggy - we shouldn't be registering xsave handlers
on non-xsave platforms, but the calculation is also wrong (in the safe
directly at least) when we use compressed formats.=C2=A0 Yet another
unexpected surprise for the todo list.

~Andrew


