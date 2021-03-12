Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3E9339448
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 18:06:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97259.184704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKlFF-0002bh-Dp; Fri, 12 Mar 2021 17:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97259.184704; Fri, 12 Mar 2021 17:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKlFF-0002bI-Ao; Fri, 12 Mar 2021 17:06:37 +0000
Received: by outflank-mailman (input) for mailman id 97259;
 Fri, 12 Mar 2021 17:06:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qc+n=IK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lKlFE-0002bD-9k
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 17:06:36 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a1d3382-75a3-403b-9b29-7982e0b16d79;
 Fri, 12 Mar 2021 17:06:34 +0000 (UTC)
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
X-Inumbo-ID: 1a1d3382-75a3-403b-9b29-7982e0b16d79
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615568794;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RkU5b68NZ01iCsYfUaOdR5r+nzhCfEQQftlPXY4TMg0=;
  b=bkyS+J7HSe+yk8iOszCnPj8EMTb0dItZT/RrkCycjpnHOPyb6/AnMrBr
   I29CbQk/vLix3pKcfrgLVnMNky1POTMYKkDA+AwxB8MxOE4jUU6tXXRxU
   a1FGLvRuzJGVXFsZMF2yUlbu/SpB19ZFXt7VYWIvjGL+5m0yGAtNs/bUX
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: gDh6nzH+vkJ0PRgMGkGML0Uae8NB6cr3Vjzv7qUkDZtcdtgZ1K0FO+zoKEi08++lbRuGgGMrOw
 9j3TwI7YwLshqvoc3SwpNSVglIotjeZiyGOKSe5X7W5WB/JHRJn+wS4eac7AzyVCJgI8QwLiUN
 ZVRtD83JWPfnAlsifDA5QhBC9lagwhqEG2VHd7lgBJHrOnlG9fVMwa8fxHd5vt5cUzlW24spHX
 4BAP7POYEBu7lIPB2Zfwv10Ozs6Z4bolTSGH5E2defiijz++Jua/4cJLSFDTe6fFLVzrTWyL6K
 R18=
X-SBRS: 5.2
X-MesageID: 39182680
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:WyxUxKuVxTYlttMbp3hIMR8/7skC/YYji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOj7U5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qz6Y
 5JSII7MtH5CDFB4frSyBWkEtom3dmM+L2pg+Cb9Ht2UQR2cchbjztRICzzKDwQeCBtA50lGJ
 2Aou9OoDS9cXoaB/7LeEUtde7FutHNidbaehYAHREq802jijmv5b78HXGjr2gjehlIxqov9n
 WArhzh6syYwo2G4zL/90uW1ZRZn9P91sBObfbstuE5Iijh4zzYH7hJdKaFuFkO0ZiSwXYs1O
 LBuhIxe/l0gkmhA12dhTvI903e3C0163nkoGXo80fLhcDiXjo1B45gqOtiA2PkwnEttt19z6
 5Htljx3/E8YGKi7UaNk+TgbB1kmlG5pnAvi4co/hpieLATdaNLqsgn9F5Vea1wbx7S0pwtE+
 VlEajnlZNrWG6dBkqp2lVH/MahRTAaEBuAXyE5y7ao+gkTtnV4w0wE/dcYj3cN+bksIqM0l9
 jsA+BGkqpDQdQRar84LOAdQdGvAmiIeh7UNnmOSG6XW50vCjbokdra8b817OaldNghy4Yzoo
 3IVBd9uXQpc0zjJMWS1PRwg17waVT4eQ6o5tBV5pB/tLG5bqHsKze/RFcnlNbli+kDA+XAMs
 zDe65+MrvGFy/DCIxJ1wrxV915Mn8FSvAYvd49Rhanvt/LEIv3rebWGcyjZIbFIHIBYCfSE3
 EDVD/8KIFr9UawQEL1hxDXRjfDYUr60ZVsELXL3uQaxYQXX7c89zQ9uBCc3IWmODdCuqs5cA
 9VO7X8iJ62omGw4CLp4gxSS15gJ3cQxI+lf2JBpAcMPU+xW60Eoc+jdWdb22bCAhd+SsjRAT
 NOvlgfw9PxE7WggQQZT/63OGOTiHUe4FiQSY0Hp6GF7cD5PrQ1E4ghQ640MQnQDRR6lUJLpQ
 54GU45b36aMgmrpbSujZQSCu2aXcJ7mh2XLcldrm+ak16dq8EpTn4yRCWvTsaTvAYrS1Nv9x
 9M2p5apIDFtSekKGM5juh9GkZLcn6rDLVPCxnAWJ9ZgYnxeAZ7TX6DgBuTjx1bQButy2wiwk
 jaaQGEc/DCBVRQ/lRVyLzj/l9PemKBRE5ocXxhvYphFWPJh2Zr3YawF9+O+lrUTmFH7vAWMT
 nDbzdXGA9oytyt/DO+mTqJFxwdt98TF92YKI5mX6DY23urJoHNqLoPGOVM+o15cPr0tPUQbO
 6ZcwiJDT/xBu8zwTaJrnI9NCQckgh8rdrYnDneqE620340DaCMfBBIR7QHL8qd6GahbfCSy5
 l9hc80u+z1EmiZUK/x9YjnKxp4bjXUqiqKasttj7Z+l6c7rqFyEJnWSiGg7gAN4DwOaOPP0H
 oDS6F66o3bMoBhf8YuaztUl2BZ4+inHQ8OiEjKGecwclEmsm/DM/6I67TOr6AzAkfpnnq4BX
 Cvtwlc9ezCRS2NyPozDL8xO31fbCEHmTlf1dLHU43bEwOxce5fuHK8L3+mabdYDIyIA68ZoB
 o/w9aGmYasBmbF8TGVmTtwOaRV9Wm7Beu0HQKXAOZNt+WABm7kuNrj3OeDyBHtSTW6bEwEhY
 pKMWwoB/4z+wUKvckQySi9Sqv+v0Q/tUBRiAsXzmLQ5g==
X-IronPort-AV: E=Sophos;i="5.81,244,1610427600"; 
   d="scan'208";a="39182680"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xt3Z2aYzZQNf2zWm1hG/7eBUcRicSGmOICFQn2WA397X91HOYteQVjpyJLNdLpENkDDYUzFZChjrSiXZYca17/4iRn50OhsAJY5i1hLrz3xGmSNQDjWJvUYGlotJvNRi3YmV6G/FdK/uNVd8nJtgvS15g+/2wtPNJphOrTON3z4amVdVoTHPsjf0JEy782AyfbSHUG+74tANnQKdPFd4R01/jNFg3y2CSXWG9yrAbfCLp8ZJYczzMBnhlPP5Wdr4WooGma0KCDphuk1KJvToGRUdIx0q8OGbcq0cewR0TVccWrGPYJCGaDOHfvsmfujf0fvbNxwuh41Au4YahZKWUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPS0+tf586JHmAWGdHQRB80+GLdISvZU62xO+Jbs9fo=;
 b=QMO8N/sQhD5WCVOD08TE42zDWk5qjl69PtvHo8uNE/i2xpBeCeaWYJyf1s7gfXZRGq7EFMPQY67oyzIOpUM5wcb7s/sMDLLIC+Ng2dFweTe6YBrwgoz1O2hsu5t6tcgpHeTsCcejb9OAV/PXE7qZTTrbIYXTfeunkor7QS1++lh8aXvaHMCLVQhJUWshyqrmT6ZBCF+mNZoVjgJw4RAafBP+uTZsjqhB/WpSUlrQsTZ2BQTy5HKqX/l+ZbeCu4LVDZ8PYuJtKNrlebbzu+RX1I6hEYfMl740DcjQHTIIE8N3nRoD/ru4WB6bPKctBZxrOnQ+wPpRP7g5wx+Zmb83Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPS0+tf586JHmAWGdHQRB80+GLdISvZU62xO+Jbs9fo=;
 b=enHP1NINgR9/nsymcTIJ1MTpaGxSnpHxeAXaE0f2Ud+h9gomecV4mRmyIKRk6S23r+tU1+Eo5xB1hw/vZlETHhAnlVzJHe7Qh1dDKo+GjSffKy3jzYbhqeHbsYIYHu4Wi3Ml+It6CYiUqX6rFou4JbVuJ8bIwB6VsyMca/WX6AA=
Subject: Re: Working Group for Secure Boot
To: Bob Eshleman <bobbyeshleman@gmail.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Roman Shaposhnik <roman@zededa.com>
References: <9280f0d0-e994-71c1-9482-63f97296acb7@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <19a3ce18-da72-3fef-fb15-8ca2891ddc8a@citrix.com>
Date: Fri, 12 Mar 2021 17:06:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <9280f0d0-e994-71c1-9482-63f97296acb7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0253.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::6) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aeca19cc-589d-4bfa-58db-08d8e5792dd9
X-MS-TrafficTypeDiagnostic: BN6PR03MB2513:
X-Microsoft-Antispam-PRVS: <BN6PR03MB25138623904792DAC40C29D9BA6F9@BN6PR03MB2513.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xu4DvtWoZTMDt4hcNKtqpv4G0zNbgNxjL0cfuS2U0Nhz/45BgKkenU/nnPihBoKzc7YA9hAsZx/zvNjOmhJ9TwOZRTFIWzeMr+5GoSs4xnG0IsY2eu0KgliHKY3ZT08Bk65Fz0WoBMDIkcQo3t5UUgWlTmdbCjap6Lp5f1wSM+5xG7M6Bh/JfE7AiSIUzfcfRnf6itwW1T81s3/lUagE6czji+yuL3Yv3GHUo+V/nu6fkbmd6XHTZQGshXpigoqOl2jDNvq8LD4lY6R2oloE77Pld3wVHXgJIirLzIOY9gvQ+rOKvvsODZAa+qeJK18Qjv3G0tgkLRDWdefD1VBHRt/plLzqoa9BiL/3A49xeu+NqIsrU0PV1bmMvUnC9DldsQw4neHmkHaCFwSBwxG0Ywp9iLMcKrrrTjcXD7aJ5vEzJDWEImrRAt8lQq7+Agw8t3TmVQV7emwSH8I+8Y2wEfWUb7dtyfKE3u6ODPMClH3/ToLvd5RfpdwV579dqQ8Cmr4M6H71KA+BRkYT4f1/I8H/44xwMSpmQ0fhAnohSCIPqg3MlcEwTZvfJRd3LfZPRMXacARt0eBTi7ffyxTCu+Nm0uBcFHN7MyWnIMhxUU4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(66946007)(6486002)(31686004)(956004)(66476007)(2906002)(2616005)(4326008)(66556008)(26005)(53546011)(86362001)(6666004)(83380400001)(31696002)(186003)(16526019)(110136005)(16576012)(8676002)(478600001)(316002)(4744005)(36756003)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZGNZNmtBMFFKYlFvRWYrdytXdDVjbGlrQjlPaWw3UStqQ2czZlBXZG5hTDgw?=
 =?utf-8?B?YWhndit4V3BENTJJY3g5NElMVC9MaS9LcURDTkpWWUNmQW9tUkVsZmlXMENj?=
 =?utf-8?B?UktaaXdsa2JyVS85KzNjTmx5NnM4Q0hvN0htaVNZUVNhd0dhRDRuTTlzSUNy?=
 =?utf-8?B?M1M3WFNsK3Rxa2k4bWpiNmhwanN5UTJGdlpkcWYrUm9JYW9DdThwT1BmaW1D?=
 =?utf-8?B?Z05Nc0RsOXF6QWgvYkZpTXJZeFZvSW80QXFmd1BoNUdZMmhnd0Q0SFVYSHE3?=
 =?utf-8?B?Z3FwdHZqY2I0ZkRDUmFtajVoYUFiQm5rakVPdytjYURTaFNFUFFMWUVnTmdr?=
 =?utf-8?B?NjF1eWlpNWVtYXJlSWR5TTU1alhJamZzenhxMnlIeTNTYnIzZjM0VFJURlcy?=
 =?utf-8?B?YjN1bHN3RzEyV0RmajBpdmpxK3lidEVkVjhYVFZlZDNoTWRvR1NWTmU3d0NJ?=
 =?utf-8?B?VWtYUStaUm50bGQ5SUNZcCtKcWh4bC8vUitzTVdjQzYvbno4bUhRTnNSN2pF?=
 =?utf-8?B?NzNycDZ3dWtOWlArdHlvbXFjNkRiSzZVd2FqVUVpQ0FwV0UrM2Z0Mlh4S1dS?=
 =?utf-8?B?N1R1Qkh4am1BdGdzREJPaWhKeEVtWmtvc1pyRkUwZk0raW83QjROZGQ0U3Bx?=
 =?utf-8?B?QSs5RExGNXROYjlOamxPWGo5UmU0UUdPRnhaODJLNnRyRTZmc25rMnp6ZHhw?=
 =?utf-8?B?SStLN1ZveitPT3BvWVIyK1pJczdTd0RxVE1iVHQrK1FnL0o4eHVjSFc4MmR2?=
 =?utf-8?B?UysrRDJjUDUxeWYrUUFGM2s5RGs5eERIdHFkTGhYbzY3ckZKck41elJTVmE2?=
 =?utf-8?B?Yk1vVXhDcHd0QmJUcFdmVlNDMWJPbHJEcmxDSnJrL1BIcjhrN2t5cy9ycWRR?=
 =?utf-8?B?NkxCK0pJUUpRUkNqVkhua29jQURkUWpHM0F4NnhrdlR2YzhYRkFhcVg3azMx?=
 =?utf-8?B?ejNWRS9teS9wTS9SRkc3anVEQ1BCY2VidW11WkRSMHZmc1hxaGlFMlNjZ0R4?=
 =?utf-8?B?Nk40Z3NlZEhGVE5CVXNpQ0ZYUitFaDJoc3ZqTjFaTTNXZy9saXpjUWc3Zld2?=
 =?utf-8?B?d01OelA5WVdKeGdTWWgxTlBUZU9DREN2N1hFV2RhZVFjSEk5SGFFTGpTenRO?=
 =?utf-8?B?ZTdnaFR3eGtDSUl4L2FSNTFJVUNxZEp4bGZrZml5ZzZGbFFRM0RFY3NTQ3Ry?=
 =?utf-8?B?bGRoSG16d0FxNlhRL0NodFViQ2h3Wm1rSWtpdWJCaGJwaERhTW5GUG5jUFlO?=
 =?utf-8?B?ZjJ5U3RwSHBDRjhSSXNqUGcxajVidkxSY2V1amRIdExtaTdRSlN0Wkc3QVRJ?=
 =?utf-8?B?RUtYUWRUNTlmMlpHdjBuU2FkeFRrN0lYbElvREl2TDNXZm8xNHVMY1NkTHhP?=
 =?utf-8?B?UWJ0dDhnWXFlVm9EMjRERVBpS3FKS25zb0tPWFpsdWlPaWF5aWg5bUpKQlBS?=
 =?utf-8?B?TUdzQTVseUcyVVBhZU0rUG95WEduTHFDclNGMFRSN2ZQZmN2UndSUWpPd09N?=
 =?utf-8?B?ZjVDWUY0U3FBVDBnSE1KS3FkM3pHK1QwTlgzQjY4WkJGMldTMDF4UFdNMmh3?=
 =?utf-8?B?Y21DS3hRNEhobGhGZFBVT2hWRjFZYjBDYUl1eXE1NGVnRVRJZVJWS1d6STlI?=
 =?utf-8?B?aWRXV1Z6UG8yMFhDOXZSWEg0aHF6YjVKMEpDK09Ta25Dak0rU1Zac3VxaGJT?=
 =?utf-8?B?VTZpVXJtdytZaW9TRDNXcXpuMDMrYy9MdmdCM1hpSjhPOThvU0tGTUNFeER0?=
 =?utf-8?Q?aIuCYV0sznWGHUn+/gph1jxsHC9LSn0AlYWE6JO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aeca19cc-589d-4bfa-58db-08d8e5792dd9
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 17:06:29.7696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b7Utwl250tt/1vik01TtPQe5c85Y795BLo3mteOBTQ9RE3Rpw4eFmich+ppkmazfFTgFIXx5nUHYGyTUzMpM1n9OvKZnoz3dYZ6wYQtu+fI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2513
X-OriginatorOrg: citrix.com

On 11/03/2021 18:34, Bob Eshleman wrote:
> Hey all,
>
> We would like to start a working group for secure boot support in Xen
> to coordinate the various interested parties and set out a plan for
> the feature and its implications for the whole Xen system.
>
> The end goal is a full implementation that restricts the interfaces
> dom0 has to affect Xen, akin to Linux's lockdown LSM.  This implicates
> important parts of the ABI (e.g., /dev/xen/privcmd/) and so will
> require input from the greater community.
>
> I'm not familiar with how working groups function in the Xen project,
> so this email also opens the floor for suggestions as to how this might
> be managed.
>
> We'd love to hear from anyone interested in such a group and how the
> community as a whole feels about such an effort.
>
> Best regards.

CCing Roman as I expect he'll be interested too.

~Andrew

