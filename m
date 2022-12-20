Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56903652711
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 20:33:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467285.726332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7iLy-0000Em-Un; Tue, 20 Dec 2022 19:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467285.726332; Tue, 20 Dec 2022 19:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7iLy-0000Cu-QY; Tue, 20 Dec 2022 19:32:42 +0000
Received: by outflank-mailman (input) for mailman id 467285;
 Tue, 20 Dec 2022 19:32:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+pxk=4S=citrix.com=prvs=3460f7db1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p7iLx-0000C3-FR
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 19:32:41 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ede86a0-809d-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 20:32:39 +0100 (CET)
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Dec 2022 14:32:35 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5911.namprd03.prod.outlook.com (2603:10b6:510:37::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 19:32:33 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 19:32:33 +0000
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
X-Inumbo-ID: 0ede86a0-809d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671564759;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=QMdPsXZ4f57U1NflH4U0hUJHibSFZ0njL2giJudPhck=;
  b=VVx8nhllYw1thgp+s6kl3P+1bJiEz9xL7F+59PbliQq3e4lLmVb6JrTn
   4AQT7xGArJE8EHzjaRnLlRUHCEp7eixdfXoIin9/sIGQX19ldlcBVGJ94
   kKDNLf0o90hOTZD+fcWDpjbcTCbx/sj3zra6ZFKWVPkk1xPKCTYS1Bx3Y
   c=;
X-IronPort-RemoteIP: 104.47.66.42
X-IronPort-MID: 89345852
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:mj0Wo6+dIO7RXaU5ZLSYDrUDo3+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 2NOXziEPqneY2vyeotzOtnjoRtV7ZLXzoc1HFM+ryE8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnP6oT5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkWy
 t8xLR4sdyqlhsKE75ewbLF0g9oKeZyD0IM34hmMzBn/JNN/G9XmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTaNilAruFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAurCdlOSe3lrJaGhnWS6W8RUAUZbWKSuN2TtHKxBM11C
 VE9r39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLL5y6JC25CSSROAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9EIMZTSoNTA9A5sa5pog210jLVow7TPTzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQGzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:qJ5q7a14TusBDI20qmI/8AqjBSdyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHO1OkPMs1NaZLULbUQ6TQL2KgrGSpAEIdxeeygcZ79
 YZT0EcMqy7MbEZt7ed3ODQKb9Jr7e6GeKT9J7jJhxWPGNXgtRbnmNE43GgYyhLrWd9ZaYRJd
 653I5qtjCgcXMYYoCQHX8eRdXOoNXNidbPfQMGLwRP0njDsRqYrJrBVzSI1BYXVD1ChZ0493
 LergD/7qK/99mm1x7n0XPJ5Zg+oqqv9jIDPr3DtiEmEESttu+aXvUjZ1S2hkF1nAjg0idprD
 CGmWZcAy060QKsQojym2qh5+Co6kdR15fvpGXo/kfLsIj3Qik3BNFGgp8cehzF61A4tNU5y6
 5T2XmF3qAney8osR6Nk+QgbSsa4XacsD4ni6oennZfWYwRZPtYqpEe5lpcFNMFEDjh4I4qHe
 FyBIWEjcwmOW+yfjTcpC1i0dasVnM8ElOPRVUDoNWc13xTkGpix0UVycQDljML9Y47SZND++
 PYW54Y3Y1mX4sTd+ZwFe0BScy4BijERg/NKnubJRD9GKQOKxv22uvKCXUOlZOXkbAzvegPcc
 76ISJlXEYJCjLTNfE=
X-IronPort-AV: E=Sophos;i="5.96,259,1665460800"; 
   d="scan'208";a="89345852"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JkMbUUylmqOXhHOTt5TvMaxyIUvydSPLkXFGx1c5DMdoBPjUQykk7MMRqhMLUyqOI61ZVhonBL1sG1HsacXsvD7Nmu63oZYo9Nitj/tPHboeJWBSoZLz0PwGxLQ9sxL6876bsEcska6oJLddcnQDaXaT2x3a9lIVC7MGYJXF/HlEiW5soFhfvCLCbZ3EVAMEfw1W6+RDszaj4Ut9ZGwoIlUwGH2IjESm1PIZnp7ZLJC7N25jUT5dq2C4qNM8e0HEmiAhlEUJZOKW/BZJ/8oj+e6aac2E+/8G50Kb/XqixJtGPCyBRpP2wi8TcptvHN6DZOZJqRZBkIkK2tdfky+Nzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMdPsXZ4f57U1NflH4U0hUJHibSFZ0njL2giJudPhck=;
 b=L9xp0sXyRi6PEk6oO1qL07LcwJz8qTR+B0+O1RVCE9+UX0KoFvwPZdzhFYihubCeMwvjSAe5B4QWZRVKCkYUe4T8wmOsBiugpr7YxHlS1K7qWXHMcsnZiC5r25NZh/iqW/E5JEpwl2I6jLfs1BRWFHG8J5KWbbKZ1ggdq4XH3ivM2GM2xV0D+RlI0PUAIY4Qg/p+EHW8fnKOYGYgKAt0k01F6TTsQ1j8aHeBdd+mkwkGXat13lrNcqvfyMqlewBHzYA8StzdZN0OyhulfbfYJK5aqh3fhJHEmj0qb+yUJTJ0Io7UQcSGH46zmadx5l2WwZCGtZ6yP2+qbJGjTHASRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMdPsXZ4f57U1NflH4U0hUJHibSFZ0njL2giJudPhck=;
 b=UcHvtIHMvYHXKBlIHMSUpEqa05w0Xp+1GbDTOPp41wUTqpCZde5QleW16DwdlKlEICiPYB0mrVOdOY56MgYjXfs4NezL3IL+cZMVQXQw8UTcAvMnpYTWtPEiYNO+Y8luma3f1cF9FSq2+hWT3eoP15kymxl1TAJFuRm64A7ix+k=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Sergey
 Dyasli <sergey.dyasli@citrix.com>
Subject: Re: [PATCH v2 3/3] x86/ucode: load microcode earlier on boot CPU
Thread-Topic: [PATCH v2 3/3] x86/ucode: load microcode earlier on boot CPU
Thread-Index: AQHZE7iZ8bzRRxQprkqqSa5cEoE/Mq523XSAgAAHogCAAEcUAA==
Date: Tue, 20 Dec 2022 19:32:32 +0000
Message-ID: <73076ccc-b983-02ff-8a2a-f1d4b7252b8c@citrix.com>
References: <20221219144533.19836-1-sergey.dyasli@citrix.com>
 <20221219144533.19836-4-sergey.dyasli@citrix.com>
 <43cbf750-d682-af37-ac2e-60229a77bf98@citrix.com>
 <eb59cdf8-bc0e-7c47-914e-720a1369b676@suse.com>
In-Reply-To: <eb59cdf8-bc0e-7c47-914e-720a1369b676@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|PH0PR03MB5911:EE_
x-ms-office365-filtering-correlation-id: a68e725d-6c6d-4e2a-7091-08dae2c0f0f9
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 U4pcZsGln/FexRswMdtO4243FHzDF8w2HQ6+2OeArAnKQCQCX6GyHXoJTMzRdN1SGKRY88Bcyud8QTQpO/5nxYaoHSRJygarKWZRNCFT1q+i1Ln19LmtKIQNeykKGoKjvyjgOCLaAfhXkPP1JEmcNfk8dpEgJOjIjXDK80ddoISeG4OVGeZWkjcW6BaNI+OlSdFoTaojD1mOzYWjcOUCM9rSnuIsQ0r+ZKC8o85b8VNu+/K0XHWU94neJx7Uo/QOm/gIjJaJ/eIihwdqea/te3jJScacSBR5p5Hb4Gq31l+mlevLF6qOjo7jMJeLCMja3nOU4eh61fKgypqyr0Zor29oBthlGMQIPTk2r9Ojqr0Ov4x+pFqNpuTm4ck6CViEcsBQyuNh5Yjw1YsbAD2ymIrm+t1AZ1zQlX8qhity1LUJWN7pUklmbBG3Icybt08I78XfLFu/XEUQxKp0A9D5KAGEJmTrxBe4d63Z5GuVaTGoDZ4GGjhbwLkrXcCZwM9i/sMrDYEvp0Y/xJPa5mxe4fH9Wu6pDJosWPhfVFkcUtNwLHUa0xGQkPW3EwV4vpEzNN/ZjIjS1umkIOQv6WZixJPnoWdBnDLlxugf2kC0jw76H+C0X0k3PhQhE7bxQdFW3vDAlJ3UTMEnjA2WmnaUFuZjVhv6bPvPYWqE2DSZ0xygvBOCaak0qIERnGX3mg6J0hrb6u6mHOTgpCduolgZpanl6r7BQ0ylM++Usv3LuKc64//vQcz8lXdMTqbJ3bjFwkh0CrSuPbBBDehg2rrYNETvXWhXV75wyQKxos8wdUIUhnqLZyBDN6uRGUFj7ECn
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(451199015)(107886003)(478600001)(6486002)(71200400001)(31686004)(2616005)(6506007)(66946007)(6512007)(66476007)(66446008)(66556008)(91956017)(76116006)(64756008)(26005)(186003)(316002)(31696002)(86362001)(6916009)(54906003)(36756003)(41300700001)(8936002)(8676002)(4326008)(2906002)(5660300002)(82960400001)(53546011)(122000001)(38070700005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eEpwRWk5bE90M04vbklQUWRrUWs1Q0hJdS9ENHFMa29PbUNldE9RM1VzU1lj?=
 =?utf-8?B?QXB6T1dKb0RqdlFHOFNlTW8rSUtJaXhUVGRyanc3SnJFZVAzVkpibm03WFhI?=
 =?utf-8?B?UkFKUzVaTzFybnlxUGdZdE9DRjlmOTFEbWdIT1BIYTNYTEtGRDIrRmpmYkZy?=
 =?utf-8?B?ck15WW5yakozVDM3Z1krWkh3OFdaTFlIUGpFbkc2RDBCTEJNNmZuMW5na0kx?=
 =?utf-8?B?SXh5Q21xS1Y4Nnc4azhpdjE3amVzTnY4Z0hQWU03MUV0Vkk0RUFUZlNRbU1u?=
 =?utf-8?B?SjBXbFBaQTc1K1BUbDY1OWNqdWhqZkRILzRkOUdybXZwUDRvWFVsQldhNmk0?=
 =?utf-8?B?K3JxM05SVVlSdUp6SFA2Y1EvOWNVSXRFRzZ3YjE1MTN3L0poKzg4ODZBcHor?=
 =?utf-8?B?ejVuc1V4OFBXM2VlaHBNckFzeS9Od2YwWWIzditBaFJLNkhybHNaaVR5Yjlx?=
 =?utf-8?B?RDBITjc0TFJaVjZabk4rUTA4WWRyb2t1b1FtWXRwbUNlcGNJZ1g5U1ZRcnB0?=
 =?utf-8?B?QW1sRTV1OTRyV1FyRFh6YUY5UnFhQ0E1UFhiZHJjdjdka291djNQT0E3a0dF?=
 =?utf-8?B?NHE5K2FSYmxBVloyUStKbDdEWHpyeWdycGM4SUNKRm1ydTRaQ0xEWVhzYTNJ?=
 =?utf-8?B?VXdVbktLcDY3bjNxYVlIZ2t0cHozaDU3d3NJcDRSRlNDMTdOTzNsa0o4WnRG?=
 =?utf-8?B?bEhzcmZBYzdNQW05Y3JRcjZ5TU4yeC9MbUZQamtkZmx6UWFqR3ptb1VzVVVy?=
 =?utf-8?B?RWhiRWYzZ3lFZjlGelNVajJEL2RWckhhTUxIeFVUVWxWd2thQUdlcGdMRU54?=
 =?utf-8?B?ano4a3d1eWFjUmJhVmkyUmQvYXd6Z1JaUDJFZlRBM2lVZVhoZmdvTUFBa3hU?=
 =?utf-8?B?eGUxR0VTdVpNT3poem5DNGdYS1BOVnNSZW15cnp2blZlWHdEYnMyUDRlN0VB?=
 =?utf-8?B?WjRvTnUweE9RSGY2SnBsV2JmK0pSVldjTzlxQUZaMEhlYVBOdnZWeUcvTGNp?=
 =?utf-8?B?RmF0b2tpYWkwdWVsbFhiV0hLU25SdDQ5NjF6QW5PMkxtcUs0WDZORTFyZ0Fn?=
 =?utf-8?B?d20yVFJUVGFBd3RlYlhvbnorU1B5WVRyc25pVlUvK2FuaC8yb2NhS3pVbXRo?=
 =?utf-8?B?TVY4c0hHOWsvenZnOXQ4SU1wRDQvZzRGYlNCaGllZjU0ZkZZTDNpVVU4Mko0?=
 =?utf-8?B?NFlVSkpYZnRycE9PaGFtZm1kbENrTkZZMHdhME5TRHNrMXdSM3FQSGE4SUtp?=
 =?utf-8?B?NUk2OC9ENXFydnExVVV6YnJhZGZYRXIvd2NzV2Z0eHB2SHZWWExXZXRsMm8v?=
 =?utf-8?B?SVJ5d3dwWTcrUWhGQTA1d3FRRFkrZm1mWmZ3TVFFNGpOWkxLNjFRRU1aU1ox?=
 =?utf-8?B?cXh0Y1NKWmlJQnV6UkFxWHNXZjNvbGVodjFDb09FZkhpb1VidmV1L2VNRmY0?=
 =?utf-8?B?M29xWFNtWWZwVE5LVmdyZkxRQ29XanR0RFV4bEcwNDlWZFlXSXZmRldPSzhE?=
 =?utf-8?B?Q1liRkIwQzZieEhQejRDazBkeTNHUktKTFAxWExZcU5QOHkxYjdjS2wwM2xo?=
 =?utf-8?B?ejB4Qm5XUW5Lb2owYkZhVCtUSDdLcDdwenF2YWJHVm9SZWZncGVid3kxYVRE?=
 =?utf-8?B?OTRYa3FsdlA5RkdvTUZoQlVLOEZ6V2VocWc2NUxVdkJhRVdpbFJNM2s2cWxX?=
 =?utf-8?B?V2p3aTNvYmdOd1hnNWJCYkxZOHNlb0JSSmo1RlpQRTVVYndrL3RXMHpDQmdN?=
 =?utf-8?B?SWFSWFpyTzVyWE5PNi9kR0NZMTRmTFVRTEgweW8wb3hmTkRuRll3NER6ZGFF?=
 =?utf-8?B?S25JYklEcG1adHBFNXFtUWQ3N3gzTTlNMTU4VW1kNmNJc3Ntc0tNT1FnTnBx?=
 =?utf-8?B?akh6WUNqU1QwZEpLSTlzcTJQZnZ4Y0JWK1ZGMzhBMEVHNG1CNzNUQXBhd3A3?=
 =?utf-8?B?VzkwYlBEdGYrUTNSMHZGLzI5cWFJanR4Z1ZNc3hxMm9vY1gvVnBUeUFaYU11?=
 =?utf-8?B?ZGRMVFFGQWdFMFU0VHRmRk5iNmsrVGdJVG5kbCt1c1MyNllDYXptaWhVUG1t?=
 =?utf-8?B?RDZ0bWxUMG1TSys0TmlrdkR1dWU1QThXalZZU2hVV1kvcXRrclJ3RkorTm5j?=
 =?utf-8?Q?MNqdcZb8WeieINHGF8na3ErJW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4648FFC60D5E3F419275A8F7EE62086B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a68e725d-6c6d-4e2a-7091-08dae2c0f0f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2022 19:32:33.0198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zxjoIlqqPbRN6mlT2JfzREoI0rpkRHu+5Ehw7054O0h1CI045rnAttkArHD2CMPR91uVSuFUITLbKHK6JbLtdy2pXuc+j2xvNY7DAtfbCqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5911

T24gMjAvMTIvMjAyMiAzOjE4IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjAuMTIuMjAy
MiAxNTo1MCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IE9uIDE5LzEyLzIwMjIgMjo0NSBwbSwg
U2VyZ2V5IER5YXNsaSB3cm90ZToNCj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NldHVw
LmMgYi94ZW4vYXJjaC94ODYvc2V0dXAuYw0KPj4+IGluZGV4IDZiYjViYzdjODQuLjJkN2M4MTVl
MGEgMTAwNjQ0DQo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L3NldHVwLmMNCj4+PiArKysgYi94ZW4v
YXJjaC94ODYvc2V0dXAuYw0KPj4+ICAgICAgICAgIHJlbG9jYXRlZCA9IHRydWU7DQo+Pj4gQEAg
LTE3NjIsMTEgKzE3NjgsOSBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNp
Z25lZCBsb25nIG1iaV9wKQ0KPj4+ICANCj4+PiAgICAgIGluaXRfSVJRKCk7DQo+Pj4gIA0KPj4+
IC0gICAgbWljcm9jb2RlX2dyYWJfbW9kdWxlKG1vZHVsZV9tYXAsIG1iaSk7DQo+Pj4gLQ0KPj4+
ICAgICAgdGltZXJfaW5pdCgpOw0KPj4+ICANCj4+PiAtICAgIGVhcmx5X21pY3JvY29kZV9pbml0
KCk7DQo+Pj4gKyAgICBlYXJseV9taWNyb2NvZGVfaW5pdF9jYWNoZShtb2R1bGVfbWFwLCBtYmkp
Ow0KPj4gbWljcm9jb2RlX2luaXRfY2FjaGUobW9kdWxlX21hcCwgbWJpKTsgLyogTmVlZHMgeG1h
bGxvYygpICovDQo+Pg0KPj4gQ2FuIGZpeCBvbiBjb21taXQuDQo+IEFyZSB5b3UgbWVyZWx5IGFm
dGVyIHRoZSBhZGRlZCBjb21tZW50LCBvciBpcyB0aGUgb21pc3Npb24gb2YgdGhlIGVhcmx5Xw0K
PiBwcmVmaXggYWxzbyBtZWFuaW5nZnVsIGluIHNvbWUgd2F5Pw0KDQpUaGlzIGlzbid0ICJlYXJs
eV9taWNyb2NvZGUiIGFuZCBmcmFua2x5IHdhc24ndCAiZWFybHkiIHRvIGJlZ2luIHdpdGguDQoN
CkNhY2hpbmcgdGhlIGJsb2IgY2FuIGhhcHBlbiBhdCBhbnkgdGltZSBhZnRlciB0aGUgaGVhcCBp
cyBzZXQgdXAsIHNvDQpzaG91bGQgbm90IGhhdmUgYW55dGhpbmcgbGlrZSAiZWFybHkiIGluIGl0
cyBuYW1lLg0KDQpUaGUgY29tbWVudCBpcyBqdXN0IHRvIG1ha2UgaXQgZWFzaWVyIGluIHRoZSBm
dXR1cmUgdG8gZmlndXJlIG91dCBob3cgdG8NCnJlYXJyYW5nZSBfX3N0YXJ0X3hlbigpLg0KDQp+
QW5kcmV3DQo=

