Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E67D6606251
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 15:57:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426821.675528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olW2I-0001xq-SD; Thu, 20 Oct 2022 13:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426821.675528; Thu, 20 Oct 2022 13:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olW2I-0001uM-OU; Thu, 20 Oct 2022 13:56:38 +0000
Received: by outflank-mailman (input) for mailman id 426821;
 Thu, 20 Oct 2022 13:56:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2NEB=2V=citrix.com=prvs=285423218=roger.pau@srs-se1.protection.inumbo.net>)
 id 1olW2G-0001uG-W9
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 13:56:37 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0134877a-507f-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 15:56:35 +0200 (CEST)
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Oct 2022 09:56:31 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN8PR03MB5041.namprd03.prod.outlook.com (2603:10b6:408:d5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Thu, 20 Oct
 2022 13:56:28 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 13:56:28 +0000
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
X-Inumbo-ID: 0134877a-507f-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666274194;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=jVSpsoxkkQ8LSPnsZ8xZOTzgVorILF3Pmspigzyk1sE=;
  b=NWbgs+UArzG4+VhUM30KY1kMI7JJ1WSjZmT1abaUq+olgc+b1rv6CyME
   eczC6tJzec9BFQciX0825N5jpx42QHXRiIRm2I+q0optuEyrn5RXGC+pP
   qQqDsxRaSvUOMu3ZwzaJoNggKI9OuikaWfwQFwZFT3e4T6XIxaeSjYsmo
   M=;
X-IronPort-RemoteIP: 104.47.57.173
X-IronPort-MID: 83152200
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:MuBnea7mLYw/okl9mhzxCwxRtC/GchMFZxGqfqrLsTDasY5as4F+v
 mUWUGyAP/iJNDemfNwnaouz8BsFvp6AzNM1Gwo6+Cw1Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvymTras1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPewP9TlK6q4mlB5gZmPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5FJTAes
 tkIGglTYyys17Pu6eylZeBV05FLwMnDZOvzu1lG5BSAVLMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dopTGMl2Sd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iL337KVx3ujMG4UPJrop/lmq3eS/2w0KhAQe2X8oKm/ukHrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvU6SdHtbSUTTeR8+mSpDbrYCwNdzZdPmkDUBcP5MTlrMcrlBXTQ91/EamzyNroBTX3x
 DPMpy8771kOsfM2O2yA1Qivq1qRSlLhFGbZOi2/srqZ0z5E
IronPort-HdrOrdr: A9a23:+oGkUqpxYH5msdDxsm10ozoaV5uwL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5Wo3SJzUO2VHYVb2KiLGP/9SOIU3DH4JmpM
 Rdmu1FeafN5DtB/LnHCWuDYrEdKbC8mcjH5Ns2jU0dKz2CA5sQkzuRYTzrdnGeKjM2Z6bQQ/
 Gnl7d6TnebCAIqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sP8f2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aiSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7svVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WjAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 RT5fnnlbhrmG6hHjHkVjEF+q3tYp1zJGbNfqE6gL3b79AM90oJjHfxx6Qk7wU9HdwGOtt5Dt
 //Q9RVfYF1P7ErhJ1GdZY8qOuMexjwqEH3QRWvCGWiMp07EFTwjLOyyIkJxYiRCe81Jd0J6d
 /8bG8=
X-IronPort-AV: E=Sophos;i="5.95,198,1661832000"; 
   d="scan'208";a="83152200"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hg+9zx13zKJxdT2rHHTH8/S1TO139v8iasHDRnq8Opd2hFl/0RIdKakDTW3MEOSx5ObSkJzeCmZWT1Jl76UvFVrYL2Z+fIFs3r5xYKiCmcsYL4kPWMNQQbEP87g091uNBU/UyEocsbrqfKnSewQfazzqW48TeqvMf5v/2Tj411F/6SBr3NUPgAEdrui+H5Yq38Svh8ldpk7fwVLMrmnmicu9f6ImhaYyWUhBsPzYZ2IlinL7s9zzHLI61BKHRY81LutxZxZSQvaW0dVGfvO0hVy7GVWbwfHN5p/iJaV/3QzwQiugm+0smeyaPSygEze+KIELMz0BKJTQ7Ys/7RYzNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8yFRfr8cnUdEBiJSaoiDbirBa68tKKWtxyevbl7woHE=;
 b=ZWrYMrwwFzju9bMAm86spiZiMbWb68hvzUGldboo++HHQG9KcYCgE0EPQBsn+85ImuJTu0MU9IprW02sD54aLTzb5Kr3CiU0l3Vr1sbVclUZGiVdXHqIzVCqUwVQIU97uvNzVHdjQgQd/P2gLDZc+RcBQdze5vsyDx40h+Rqevc2ZFloYcOkqGwljgByV1+m2vvUDCrSRfPes0CTdNC8C7Cpw6vx+n0IBKhZ9vewTVLNdWd+Kry5MG2An8johdR9wMwMpfmTXxaAinr54m4BzmweKbEtKri3UWj1vN7HSiafSc9ZOvnaYLkJxekGBXwCO6hPyWRBo7az4X6S21iEOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8yFRfr8cnUdEBiJSaoiDbirBa68tKKWtxyevbl7woHE=;
 b=uDEr97AizEo3EslQX2WVZDo5yTR8iYJHQk1NGsYrDVNzCbiJvWQ3tdlQvhBI7Mxn4rukzy2lB9Rr6K/e+/1p+Y2XzNWcHr+rkKRa28TD7xJ6umvXfwx1e6XqLCUEAlAxl6DmbC2F8IIPVSXctJejJLlR44/zsKNTAMa1tnyT2IE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 20 Oct 2022 15:56:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: Intended behavior/usage of SSBD setting
Message-ID: <Y1FThso5w/WWwoaO@Air-de-Roger>
References: <Y1Eqk6D0dBDR4m4u@Air-de-Roger>
 <2f5ec31e-2ac5-2b22-8801-9ebdc4946962@suse.com>
 <Y1FBGTx5cSrkdVbZ@Air-de-Roger>
 <865a2712-d694-122f-eb10-e206b350c7d6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <865a2712-d694-122f-eb10-e206b350c7d6@suse.com>
X-ClientProxiedBy: LO4P123CA0108.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::23) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN8PR03MB5041:EE_
X-MS-Office365-Filtering-Correlation-Id: cd8f85a6-02a2-4531-52f1-08dab2a2e289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ucPyVZRsVSdU4WJXM8PMrrlqSDTNW4wAvUhnaiv827hu45fKix3RSsgCbYRhbYOzNyE0VjGolNQKoHIcXb0wQxg45iR6IetzDKOZF07ntVFKNwNpA0rJlKyUhr7ZA2P2+GgTguAzEJgaRHsNa2PdpwLer/s7WGSrIbgygHUR79xkgXtZnbNrG6ZBcocIU+ZlRuinhN6nHVVBij0trv1jlEGqjNbVrWIZyB54r3dxQsy0S+xBX/6/lSvsr3gM9GvG56qpzPjzUOuIvYHMjlJzBsysgqKORVT/uVSykmWgBJEq5739gCU4Usfy9uaTwqSEVVEhpXFCFe9cH22Pc0RgAkXSh4e6wCfBUsWwkWbJXUxn2+QeJbhxPYnz+ucaU/WgLM2/KOYnQlNh/12fRJ83O6Cwvr+4ophfZI/z3Xv8B/ogXaj8/3M1r1JVyl+A8BRKqJPwxqFxQVhPuMVp4KW5cuqbub3wlNRNOtNL+QqwDwv6ME103S+HIm91zkJ3WwmlT5pRjq2QFNUaOUuQTc7Yzt4t0UDwAZqIJDXqz7MosMl29S3IGweQ5K84s/cYtpZ67zabW1jlRpYK2hGAWQ2Y1ZhlGBRViz2t06weqASLGPtqwYL4Ngjtt4H6Y3msT0l6t9Op02Spv7s2sK07NBwtwAcHmRHPSPGoFvUcoGHiisiBcsxpZ/CDngw+1AdAFn1TBEKSQJDl/v9nFTV8XYSjkw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(451199015)(41300700001)(5660300002)(2906002)(8936002)(66899015)(85182001)(66946007)(33716001)(6486002)(6666004)(8676002)(478600001)(6916009)(66556008)(6506007)(316002)(4326008)(66476007)(83380400001)(53546011)(86362001)(82960400001)(38100700002)(6512007)(186003)(9686003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTNiY3lWS1FDdXBFMUM5T05OTWJhTFdyYlJaeHhhcUw2eWluNGNEMUltbGJt?=
 =?utf-8?B?QWptUzFZME10YW53UmVmWVJxZEFnWllUaC85endoeENnSFVkM1RBNXRGSE56?=
 =?utf-8?B?TU03RXErWkpJQmZwQm91VE1jUHZGNUp0bzlkM1dwaitBY0xjdTB3SzRNYTVB?=
 =?utf-8?B?bXpLS3pxMU1tUWVML1pacFBXLzdVUDd5WmJiWTBkR0MwejVldWZIODV6OEM3?=
 =?utf-8?B?b0NtQUFBNkNCaENoOHVwcE0zOTNuWXBHOXAvNFpIL1RDRXgvbjFxL3ZBbmdk?=
 =?utf-8?B?QW9UakZvL3FjbUFxVGhkenpVQUprVG85SzhqZ1IyV3gzTExMVm5CNVR0ekw3?=
 =?utf-8?B?bWVaSndWenRST0NpZ2VPNmU1QStnby9zRWFFQm8yTDR5c0thRElneXY1Rk5G?=
 =?utf-8?B?UFdkNThpMXFxd2FpVDVxZnpYRVVaOTFXMWxZMmRWMGl2VWpRZ0ZkSWJxaFVI?=
 =?utf-8?B?REsvUjh3NnNEUWx2czUyQmo4NjVLeVNrSGxDTGpPWkkwVnlMd0haV0hibUll?=
 =?utf-8?B?TjhHUlVLTmUwY2lDOW5FNXdrVkk1L00ybHorbEJZK3drUng0UWpBNnRvNFVs?=
 =?utf-8?B?cFJWMUZPdjRJWE1jcVBrazZ4cjVYdDJMeklJRHB3cml6MDAzK0t4c0t4WWhS?=
 =?utf-8?B?akpiSmdhajZ0UDdDWVJ2RUVFdEx0dW5wRUVXN1pKZGhFU2E0NnhmZWU2MkZx?=
 =?utf-8?B?OXZ4VkRmRElxUloxaUxzMzgydGtrdHUyTVNRNTBrMWVaK1RKbVJHYnhJb2ZM?=
 =?utf-8?B?blZaRzI0NitySCs5WWxpRTkzWEl5dTY3MHRPMllOdXhnVGhMbjkxNWRyVUxK?=
 =?utf-8?B?b1ordFFETy9aRlMyRVhBM3dxSVpMNHk5amhjanJnVXAvYzM1T0NUdkJiZ2R6?=
 =?utf-8?B?aFFsLzFrcnBWbW9GaWVadTRzbW05ZDdlTG9QMndHcmYybTRuMFBuSXREN3dl?=
 =?utf-8?B?cFB1cHpyODlKbys1SmdJUjlBQU5aUmZqK1NTa282ZGlKRE5xdWhhM0QyKzBI?=
 =?utf-8?B?NDArQm9uMkEydjVKcHFlaUsxcGIyWjhvblh0N2lCUFIxOEZTUFA0MU90WXMx?=
 =?utf-8?B?UkxPZkhYc1hEYjl0UTZxOTB1VjJiNjBDRzNtQ0NEVGRMREtZNzM5ZGxtWnZv?=
 =?utf-8?B?TkMwbE1UcE9pYmx3RW9aRUhOa2svWDZTR0NnWDltNEdvbFllYzBWdW5lS3FC?=
 =?utf-8?B?Wm9zckNiSE1UdGgzMWJSTTJNYkowYjExa0xYZUxXUjZaeVZINUIxeG13bXF2?=
 =?utf-8?B?VXZEeDZldUxJcUQvMVJlSUN3Z1RybzdoWEVGc2FveVphZkZBNTlyalBOT0Nl?=
 =?utf-8?B?aklpK1JkdDN2UThZVU5zRWt4M20wU0Jvb3dXUVp0c2l3SFgvR25GOG9hY3Q0?=
 =?utf-8?B?eGVIUHM1RnZUakdsNk1IZ3JxeTgwcTJmR0FKblhRRHZiNlZJYkVVbmdRVyt0?=
 =?utf-8?B?NmJBS0dtZ2huRG5Ed0NNU29ZK0J6OGlORDM5SHhaVSsreDNOMHZGTDJKQ1Bl?=
 =?utf-8?B?T295Yk5lL2RtVDczUTJVcGxIbUVEczV6TWNocEo3djF5OVR3c3VIdk16aFY3?=
 =?utf-8?B?cE1sd0F2OFJ5ZGxaUzJwOEFtNHh5Nk1pZjJxaDl2alI3Z3BKRWwrL1dlNjBM?=
 =?utf-8?B?b1RjeVBNYnVJVWNGL0lQcUE1YUhuRnA2ZFlXdW9IL2hiL1JQOHA5YlorZ1Nj?=
 =?utf-8?B?OGI2dEZhYThEVTVYcWh2ZWpDVm8xZWJqQ3V5cHJMckJPYnBIcXBrU1Nnckc1?=
 =?utf-8?B?Vi9ZSnN5WkZHNkRST3ZjSVk2Mkh6SHlDdXdmMlBOYm1TVzAwb2FlS3paandZ?=
 =?utf-8?B?NW83RGNQQm9LbjVNSUZvQWwzSFVpMVRQYkRNQ2V3QzZpTHNGVDhKUzFRMDFp?=
 =?utf-8?B?aEQ4MnZpWjFCck9KQzN0b2o2ZnpLQWFwNGZhWjlyWk1HdUhuZUlWK0plYzll?=
 =?utf-8?B?WmZsVy9VdkZJQWtDc0FGV1p2djh4T2dYckYydGtLS3BFb2xpbkNveGtPdEZJ?=
 =?utf-8?B?a1V1WjlpcGdFQTFHUTVCZWNTQ1V4Rng4cXBNalAxSFpFUEJzQ2kwa3YzUTQy?=
 =?utf-8?B?bm9FdnluNEw5UVkyZXAzb3FCSjUwaFJMK0lJU3FzNFU1TmJiMkdBTmg4Z1JW?=
 =?utf-8?Q?HS4Hwwbc5POLq4JmfdWEwwByS?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd8f85a6-02a2-4531-52f1-08dab2a2e289
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 13:56:28.5036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZkccvvfcsImU9zGcrIoTfrRxVFq+R3isZHjqmJEOBlA8xkWBZvl8FfguidNNvfEeIe6fpuO1i3Q5P77zlDxLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5041

On Thu, Oct 20, 2022 at 03:25:38PM +0200, Jan Beulich wrote:
> On 20.10.2022 14:37, Roger Pau Monné wrote:
> > On Thu, Oct 20, 2022 at 01:22:20PM +0200, Jan Beulich wrote:
> >> On 20.10.2022 13:01, Roger Pau Monné wrote:
> >>> Hello,
> >>>
> >>> As part of some follow up improvements to my VIRT_SPEC_CTRL series we
> >>> have been discussing what the usage of SSBD should be for the
> >>> hypervisor itself.  There's currently a `spec-ctrl=ssbd` option [0],
> >>> that has an out of date description, as now SSBD is always offered to
> >>> guests on AMD hardware, either using SPEC_CTRL or VIRT_SPEC_CTRL.
> >>>
> >>> It has been pointed out by Andrew that toggling SSBD on AMD using
> >>> VIRT_SPEC_CTRL or the non-architectural way (MSR_AMD64_LS_CFG) can
> >>> have a high impact on performance, and hence switching it on every
> >>> guest <-> hypervisor context switch is likely a very high
> >>> performance penalty.
> >>>
> >>> It's been suggested that it could be more appropriate to run Xen with
> >>> the guest SSBD selection on those systems, however that clashes with
> >>> the current intent of the `spec-ctrl=ssbd` option.
> >>>
> >>> I hope I have captured the expressed opinions correctly in the text
> >>> above.
> >>>
> >>> I see two ways to solve this:
> >>>
> >>>  * Keep the current logic for switching SSBD on guest <-> hypervisor
> >>>    context switch, but only use it if `spec-ctrl=ssbd` is set on the
> >>>    command line.
> >>>
> >>>  * Remove the logic for switching SSBD on guest <-> hypervisor context
> >>>    switch, ignore setting of `spec-ctrl=ssbd` on those systems and run
> >>>    hypervisor code with the guest selection of SSBD.
> >>
> >> * Give the guest the illusion of controlling the behavior, but run with
> >>   SSBD always enabled when "spec-ctrl=ssbd" is in effect.
> > 
> > Right, I've also thought about this option but forgot to add it to the
> > list. That would limit to only allowing enabling ssbd for the
> > hypervisor code, but not explicitly disabling it, ie:
> > `spec-ctrl=no-ssbd` won't be a valid option.
> 
> Well, it would be valid to use to override an earlier "spec-ctrl=ssbd",
> to revert back to whatever the behavior is when no option is specified
> at all. It wouldn't strictly mean "no SSBD at all".

Hm, so using `spec-ctrl=no-ssbd` would mean 'use default value', but
it won't force SSBD off for hypervisor code execution.  It would have
to be made clear on the documentation.

So we have 3 options.

Thanks, Roger.

