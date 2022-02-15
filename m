Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 686074B69B0
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 11:48:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273006.468049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJvNp-00044c-5K; Tue, 15 Feb 2022 10:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273006.468049; Tue, 15 Feb 2022 10:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJvNp-00042A-0w; Tue, 15 Feb 2022 10:48:33 +0000
Received: by outflank-mailman (input) for mailman id 273006;
 Tue, 15 Feb 2022 10:48:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vySV=S6=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nJvNo-00041M-0f
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 10:48:32 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce82436f-8e4c-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 11:48:29 +0100 (CET)
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
X-Inumbo-ID: ce82436f-8e4c-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644922109;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=1HNuaJYL/+PWrTgXUd5wTUGMEHgYaDO4rQEq/OnxnUE=;
  b=We2ZcCOkEZC2FDUQkj7Qbfhpw99N+LdzlqmdA/5AMkuSLlLPG1EfoE2v
   zL/9J1ja5vV6bzYlW3pE38hor/bGQS+XhPATW6n78qXM3sR0G1Ik0gKRq
   g9ksxPLZW1qh6X1619ZKefm/N6QtZsdcUKf6bljdWD28FrkDc5cXVYI40
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: EQ3/F/6IYS7t1jyANOxBKtTUTCW0lUUnmCXWXTV1ChmyRXXrJW9sZW3OD+eR+eudmA/wHtvh1a
 e8DLddyd/1KOM8CqBA9XN6yK6+fmL/Cm0jfHC2sTp/XdilBE3QCCU63MAvK2pETOJMX2VkX0V5
 MhXvsmdzEnsBFy6W3Wj0e3p9sEznojpJVtl62F0D9bZlkLiDye6mggiFwQ1QiBR6CqMIep0hO5
 Rg4RemRYdrQMZC1tt8fASZOm6Txh9tjHtv9aSuzWF7AmPlsmkFeUXs0AqhYCfsnxMobXiEBUpt
 FjcPG0XmQBvR04g85ybkMw5S
X-SBRS: 5.1
X-MesageID: 63672312
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:aVWNlK8D7sFsrhbna2WkDrUDpHiTJUtcMsCJ2f8bNWPcYEJGY0x3y
 zYZXzyAM/mINGP2L4hyYYi2pk5SvJDRyocyTQpl/no8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rg39Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhVx
 t5crJycZTx5HZD8qMgNYQkAAX1HaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGh2lv3JsXR54yY
 eIbWzFLcgb4OidsM3I4VbMBgsCLuCbWJmgwRFW9+vNsvjm7IBZK+LH3LNfQTdmbSsxUk1iwq
 3rP+iLyBRRyHMKYzT2J43e9nNjFlCnwWJ8RPLCg//ssi1qWrkQZBQcKT1K9rb+8g1SnRtNEA
 0UO/2wlqq1a3EuvQ9rmVhu0ukmNuBIGRsFQGO037gKK4qfM6gPfDW8BJhZbYdw7sIktRDol1
 neAhdavDjtq2JWSTX+e7b6SoSmFJTkOLWQCaCkHSiMI+9Dm5oo0i3rnXttlVaK4kNDxMTXx2
 CyR6jgzga0JiswG3Ln9+krI6xqloJTTFFZtvi3YW2uk6kVyY4vNT46i5EXf7P1ABJ2EVVTHt
 38B8+CF9/wHB5yJkC2LQc0OEauv6vLDNyfT6XZtAp0g+jKF63OlO4dK71lDyFxBa5heP2WzO
 QmK5F0XtMQ70GaWgbFfR4y6Gt0q4YTbRffYZsD4fuheOootTVrSlM1xXnK402fomUkqtKgwP
 5aHbMqhZUon5bRbICmeHLlEj+Jyrswq7SaKHM2gkUz7uVaLTCPNEd843E2ygvfVBU9uiCHc6
 J5hOsSD0H2zu8WuM3CMoeb/wb3nREXX5KwaSeQKLIZvwSI8QQnN7sM9Jpt7JeRYc1x9zLugw
 51EchYwJKDDrXPGMx6WTXtodaniW51yxVpiY3BwYgb4hiV7ON31hEv6S3fQVeN5nNGPMNYuF
 6VVEyl+Kqgnpsv7F8Q1MsCm8d0KmOWDjgOSJSu1CAXTjLY7LzElDuTMJ1O1nAFXV3LfnZJn/
 9WIi1OKKbJeFl8KJJuHN5qSI6aZ4CF1dBRaBBCTfLG+uSzEreBXFsAGpqZsfZ9VcUyZnmTyO
 sT/KU5wmNQharQdqbHhrauFs52oA615GE9bFHPc9rG4KW/R+W/L/GOKeL/gken1WDym9aO8S
 /9Syv2gYvQLkEwT69h3EqpxzLJ47Nzq/ucIwgNhFXTNTlKqFrI/fSXWgZgR7vVAlu1DpA+7e
 kOT4d0Ga7+HD9zoTQwKLw0/Y+XdifxNwmvO7e44KVnR7TNs+ObVSl1bOhSB0XQPLLZ8PI4/7
 /0mvcoat162hhYwa47UhSFI7WWcaHcHVvx/5J0dBYbqjCsty01DPsOAWnOnvsnXZowVYEcwI
 zKSiK7TvJhmxxLPIygpCHzA/etBnpBS6hpE+0APegaSkd3fi/5pgBAIqWYrTh5Yxwls2v5oP
 jQ5LFV8IKiD8ms6hMVHWGzwSQhNCAfApx70wloN0mbYU1OpRirGK2hkYbSB+0UQ8mR9eDlH/
 e7HlDa5AGiyJMyhjDEvXUNFquD4SY0j/wLPr8mrAsCZEsRoejHimKKvOTIFphaP7RndX6EbS
 T2GJNpNVJA=
IronPort-HdrOrdr: A9a23:AX4FI6q/rdB1lxg9y7qNZm8aV5uzL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPcegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LTUUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13jDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2u
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0LrEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4GS1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusq8q+SWnqL0wxg1Mfg+BFBh8Ib1W7qwk5y4CoOgFt7TFEJxBy/r1bop8CnKhNPKWsqd
 60dpiAr4s+PfP+W5gNcNvpcfHHelAlfii8Ql56AW6XXZ3vaEi946Ie3t0OlZSXkdozvdwPpK
 g=
X-IronPort-AV: E=Sophos;i="5.88,370,1635220800"; 
   d="scan'208";a="63672312"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJ+X3kSd7ZEa4X9Hy2sOEn+mrCrgxvC5NdugLImThLv/D7K+XNzn1SK7FkcUNfaH+kHhUunIriaKPKx/aB347ufY0xWH8wtF6azMgh2zEccryanRNdLbi/Xy8wbP4/9WVKzz+d6Y8o1UB166Cv3akiPvVpVnIjDxtym19HYbjuUrJMCDgu0Y+cFFoEQlJTYpzWDvXOLoOqxrB6tjChjQ6PDxysRAbY0gwKSiVAfPrAs2GRmy5wAeGc42GbWa1ltx6GNPr1ZJg1dCim+EwW+YiDbgp6nRwfiy1gWW++COTrRKkAqk7SLEnp7s2q6pduiEDHgJRpYCLXMwaWdF373p/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/GsZZ/tQMpm7fhOCkl8fdHVdjaleBvvxnZSdZgItSI=;
 b=OAud1JuyFf6ygju20Ffvv7twbPj67CoXTcxvZs9Whb6MYvt9qJdBF/Dq7QT9LfawJCmh0CaOAQVWjGqKVPMrF/cLL6mNwmfti8xlHxi7VxUtF8eeEoJre1wLBLtQTaRZex9B7n4ag+S9RtK+xsR2n4FphSomVJAyZYIbsEO0Jnx8h1+mbWNSv9CgMwz6sPJRO/YQM4zJiSO5LaAWLqwmu1N82kh3KhzgH5vpvYs7QZ/4E31ftsNsK4scWZdsUNMTcPz3zkdGM8Ey/30ZrQn2b03JEP+P8UIGnddZO6ZNL6qFAKDzCGto3U+S2ElQdOAoWyqcHJz8tBMd53ROyt3igg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/GsZZ/tQMpm7fhOCkl8fdHVdjaleBvvxnZSdZgItSI=;
 b=foa/GJn/tDRKExbVeqSvkojP/QZdsZrmw318y0mVKFL+9zJTQ8SR8/hekkoK8BArwpriJfCpMhMihScXwBYwTnTfrxXQ3MuaUly7JBFtzDltZLCMnWYCS9EdQXz1l4qQ+Qmam2uqkqOyU3K+LfMHWN/FbzKKkRXTinxIxVykjDg=
Date: Tue, 15 Feb 2022 11:48:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <jbeulich@suse.com>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <artem_mygaiev@epam.com>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v2] vpci: introduce per-domain lock to protect vpci
 structure
Message-ID: <YguE7RWOteSnvVNY@Air-de-Roger>
References: <20220215081135.1497470-1-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220215081135.1497470-1-andr2000@gmail.com>
X-ClientProxiedBy: LNXP265CA0076.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28b57949-54bb-4c5e-1f0b-08d9f070acc4
X-MS-TrafficTypeDiagnostic: BYAPR03MB3800:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB3800756E539C21B77BBD71BB8F349@BYAPR03MB3800.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tNpZIjamx+kN97vqV8DKZQtKAyaOlgzWUOoQSqe+df7PlghcR5hKSYv+w/E4B3AUsSzOfeqtspWgqqF0+ew1wJ1zO6kqMIXs5p2ZiGStWxL3q8uO9ZjUIhUZRgv6p1usftQsRup6h9b+uw84WjsebflgxDvjOFA9laeSz153+2srSvyn0GqCHpY/FK5TnAzDA1Fuuvn4LPnO+mxSbQ4iLEtPPcoIGi++ig87kVX6m/aCpP5u9qjpSmtsfuJ2T2O/LJeDr/e7Q5XSBKuc0ymfRWEZ180S6C848vqxzvMcXMF8raDLtRJ2k1a3JwQANFctR1EjIZfjgsW6LT5bKXTXi+qemBIlbHoPJE8aIvBK9D4RNFnLT+ieDfY6w9CFZGn8jG9Bs96RHKNdfnRUWpHcBwkqgFHHI2G1/4lhigaAV2uvc04r+SzwQ0kQtKLEk+ofg1aLvO50Bz2CLsVSqjshFgE46GnV1aL8tMMpOL43lmVyisbNngzw9POYpbhlTeo0ZU5Y6o4fKv0miUIw9eeY8b+lsvIhmCUYGYbJTZpjiapjZlhxb70FPvRdlkRhAjdAHBtPvle+S9YcVTvrF73RpDYc0mT55QJFi/ESjKm6bRuuvCPKuhygDH7xI1WOdUX3VoovxuENY+EfWf2FVvmGWzMPnqEZvZHuKWN0GGTCmz59u6cnZiF4PiY8TxAmvVZ4Jw2caRMsqZlUf/8ayCF/NiPRUFgnmIu86Xn6rQrm2g8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6486002)(9686003)(6512007)(85182001)(508600001)(83380400001)(6506007)(966005)(33716001)(6666004)(316002)(6916009)(86362001)(66946007)(5660300002)(2906002)(38100700002)(8936002)(8676002)(66556008)(66476007)(186003)(82960400001)(26005)(4326008)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZU5IRGJqSllGS0dDL1VWeDZRaSttRGZaMG5BYnNJL0Z6RXJQeXlDOTVZMVlv?=
 =?utf-8?B?UnBFbmNFVkx1TWZOU0pMa3lXOHZIWVRRQ0FrS213dmZpbGptSnRxYnVmMFNZ?=
 =?utf-8?B?cUt6eE9LN1JBSTcxeVRVNXlzZUVMZUNQa3hqQTBQMDNiemRjbG5CVlJGVGV4?=
 =?utf-8?B?ckVtSDlOZko1TFB6VEYzcjQrSllxcm9wSnRSdzJwTVVnQ3hDOUNyV1B6NXox?=
 =?utf-8?B?M2w4eVN4Mm1iUU9UWUhYc1RVZzlrdHhaWnhUai9DU0d6YTJBRXZpWG94anly?=
 =?utf-8?B?ZkszSWw4ZUpnUHBwcUZ6M2J0V1BuZ0l6Z2JVYnRVbHdLZThEUDd3Y2ljaGlr?=
 =?utf-8?B?OFJyQTk2OVdzbXlzSFFweHc5Q2E3cHorQTFOQXNzdTZrYk5ySGcyd2pCQnNj?=
 =?utf-8?B?NWtMUFlCYUJta2puRUdCdURSMEpKOFZubUUzRFZ1c1luWmcrZHRlUzRQZ2tm?=
 =?utf-8?B?NEFTcTdEUjVyRThHWE5XQllPc3k0S3dtMWxSVkdIcEswbEhROWRNc0xQTDhX?=
 =?utf-8?B?QlAxaTZCNlN3ekZrRmRCQlEzL3dhL01ldWtOU3NTanpYakt0SGpGNkhqcDY3?=
 =?utf-8?B?cnBIaFMzZDhVeXZIVE9tWG01OStoekdDQkdlenRTMThOSVVTVFlGRmpSQnh6?=
 =?utf-8?B?TFcyclppQzBDeWltNDlKT09adUtDaldUcEk3RjBNZHVaSHAxT0UvR2l4bWg4?=
 =?utf-8?B?YlZkZExwSUJLZDJ2SU50QmRKaVZWcVUrUXR6dU1TMjZNRkpjbit6SmpDUVl0?=
 =?utf-8?B?S1EydVNvSmlpS0VmZGYwOUc3cjlBcXFGSW9HbWZPZG81N0V0cThzdnFadXIx?=
 =?utf-8?B?ZUVWNGhtZkJOWk5ra3dCN3ozWFZULzZQeERjMHFwRWsxQzBGQnFVUEwvWUJI?=
 =?utf-8?B?STlxL0dPNlp5RGRtMHZaazFQRmhJVlJCdzN0Z0UvRXZ3UWdRc3NORUdGbzYv?=
 =?utf-8?B?R0dyQ1ZwYUFiU0JjZ1grRmNmY3VYRmhUNmUxR3UyODI2U2FySjJNUVZtY01V?=
 =?utf-8?B?TWZHb0h5UFZFbnNlMVcvYVhxakZBeUdVY0prMHFwaTE0MHR3YVdsM2wvL1pm?=
 =?utf-8?B?V2R1UEIrL2JMeHVGTjB6SEVhMlBjVVBOWjVGeFl3TDVSbk4wL2UyZUZPdUxR?=
 =?utf-8?B?WHhZSnR5ZEVVREswNUJ6OVRlQlBoTUNoUW1HMnR5TzFoSmRvbmtKOGttTWs2?=
 =?utf-8?B?VkhmeVMxUTgraGZvTnZ2UTRRNnA3QzNHUGp5VldJVyt6WXhMSVl3QlovYlBR?=
 =?utf-8?B?T2cyLzlwdVcxS2ZNdGJjNUNoZjdldzJjMVQwZmRoYTRUVTAxWUV2ay9pTExm?=
 =?utf-8?B?VnlYM240VnhhczZCT2lJdDVNOUJGNVFDUWY4NS9zbWdLdnhMVjFJV1Bnc3ZV?=
 =?utf-8?B?UTl0VWdXd0szSDR0RUZaZjRCdXJLZHNDY2pzbHpNUEZjamYvckljVDlHNW5L?=
 =?utf-8?B?MFZQVDQ1U0FGb1oxWGVSbVkxQU5Makh4TzdiL25nSmdVWGNaYVpTdjZQaFNR?=
 =?utf-8?B?ZmJmMGtIb2EyM1UrZEVZcmlSSURyL3RpRmZaRlZSaW0yVVU3aEplMUkvdy96?=
 =?utf-8?B?aXgxVDVHeDk4dkRvU0FiVlFzbnRXdEZ2L1RlM0VEOUJBQnlaMTdRcDFnSCtk?=
 =?utf-8?B?cGFVYXdORG9maWxlWTR2Vi80QXhaSWNnU01xUkJRWTRDTm9SMWkzREU3bmgr?=
 =?utf-8?B?MzV4TVUwZlhIcytMdTZ3K0RGL1MrT1JlaW5KbGFTVURGYkN4clJCeFZNZys0?=
 =?utf-8?B?Wi82cVZuRzJaYkxKcjBpelFtZmZuSGtwZThwajZjMkpmMXBGWWlTdHlJWEsy?=
 =?utf-8?B?bG8yUFg0U296WDBSeGFJdXhvUVZnU1plM0U0L1d6OXd0OHEwbFlRQW11ajVi?=
 =?utf-8?B?ZElwS0lSblhQbzBjM3V6UkcyeEJoU0VkZTd4YjFJLzR1MUtXV1FYZzF4UWcz?=
 =?utf-8?B?bVdnOTNIRVNoN1o2Z3JXb3Fkd01pWXpKU2x1UnY4em1QYmRXSWdteENROW0y?=
 =?utf-8?B?N0pxMzZzaDgxWkwwUE14aGg0S2VuSUtwb3VBNjduQ3YvaXNqV1pjaWtuUnJN?=
 =?utf-8?B?aGdBUWxrZ09MTUVRdXNoWHB6bkdaNUo1Y2orUlBWTnh2TzZKdGkraXU2b0dG?=
 =?utf-8?B?bUZvSCtadFRNMmJIeTBkcm1CZTBtSnNNQUh0WnBia1Z6V2NiT2FjQ0s4Q2pF?=
 =?utf-8?Q?YblSAVUpgG9Jh6TWxmgoEYI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b57949-54bb-4c5e-1f0b-08d9f070acc4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 10:48:17.7360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m9nrnPe4TWG3oefQK3Yp6wblRB/4VYF3oPh1t7Mr6MrGe5plOxnkphE55j34U8qclRF6lKtCvE8pAYGf3gPOYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3800
X-OriginatorOrg: citrix.com

On Tue, Feb 15, 2022 at 10:11:35AM +0200, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Introduce a per-domain read/write lock to check whether vpci is present,
> so we are sure there are no accesses to the contents of the vpci struct
> if not. This lock can be used (and in a few cases is used right away)
> so that vpci removal can be performed while holding the lock in write
> mode. Previously such removal could race with vpci_read for example.
> 
> 1. Per-domain's vpci_rwlock is used to protect pdev->vpci structure
> from being removed.
> 
> 2. Writing the command register and ROM BAR register may trigger
> modify_bars to run, which in turn may access multiple pdevs while
> checking for the existing BAR's overlap. The overlapping check, if done
> under the read lock, requires vpci->lock to be acquired on both devices
> being compared, which may produce a deadlock. It is not possible to
> upgrade read lock to write lock in such a case. So, in order to prevent
> the deadlock, check which registers are going to be written and acquire
> the lock in the appropriate mode from the beginning.
> 
> All other code, which doesn't lead to pdev->vpci destruction and does not
> access multiple pdevs at the same time, can still use a combination of the
> read lock and pdev->vpci->lock.
> 
> 3. Optimize if ROM BAR write lock required detection by caching offset
> of the ROM BAR register in vpci->header->rom_reg which depends on
> header's type.
> 
> 4. Reduce locked region in vpci_remove_device as it is now possible
> to set pdev->vpci to NULL early right after the write lock is acquired.
> 
> 5. Reduce locked region in vpci_add_handlers as it is possible to
> initialize many more fields of the struct vpci before assigning it to
> pdev->vpci.
> 
> 6. vpci_{add|remove}_register are required to be called with the write lock
> held, but it is not feasible to add an assert there as it requires
> struct domain to be passed for that. So, add a comment about this requirement
> to these and other functions with the equivalent constraints.
> 
> 7. Drop const qualifier where the new rwlock is used and this is appropriate.
> 
> 8. Do not call process_pending_softirqs with any locks held. For that unlock
> prior the call and re-acquire the locks after. After re-acquiring the
> lock there is no need to check if pdev->vpci exists:
>  - in apply_map because of the context it is called (no race condition
>    possible)
>  - for MSI/MSI-X debug code because it is called at the end of
>    pdev->vpci access and no further access to pdev->vpci is made
> 
> 9. Check for !pdev->vpci in vpci_{read|write} after acquiring the lock
> and if so, allow reading or writing the hardware register directly. This is
> acceptable as we only deal with Dom0 as of now. Once DomU support is
> added the write will need to be ignored and read return all 0's for the
> guests, while Dom0 can still access the registers directly.
> 
> 10. Introduce pcidevs_trylock, so there is a possibility to try locking
> the pcidev's lock.
> 
> 11. Use pcidev's lock around for_each_pdev and pci_get_pdev_by_domain
> while accessing pdevs in vpci code.

So if you use the pcidevs_lock then it's impossible for the pdev or
pdev->vpci to be removed or recreated, as the pcidevs lock protects
any device operations (add, remove, assign, deassign).

It's however not OK to use the pcidevs lock in vpci_{read,write}
as-is, as the introduced contention is IMO not acceptable.

The only viable option I see here is to:

 1. Make the pcidevs lock a rwlock: switch current callers to take the
    lock in write mode, detect and fixup any issues that could arise
    from the lock not being recursive anymore.
 2. Take the lock in read mode around vpci_{read,write} sections that
    rely on pdev (including the handlers).

These items should be at least two separate patches. Let's not mix the
conversion of pcidevs locks with the addition of vPCI support.

I think with that we could get away without requiring a per-domain
rwlock? Just doing lock ordering in modify_bars regarding
tmp->vpci->lock vs pdev->vpci->lock. Neither pdev or vpci can go away
while holding the pcidevs lock.

Sorting the situation in modify_bars should also be done as a separate
patch on top of 1. and 2.

> 
> 12. This is based on the discussion at [1].
> 
> [1] https://lore.kernel.org/all/20220204063459.680961-4-andr2000@gmail.com/
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

I've made some small comments below, but given my proposal above I
think the code would change a great deal if we decide to use pcidevs
lock.

> 
> ---
> This was checked on x86: with and without PVH Dom0.
> 
> Since v1:
> - s/ASSERT(!!/ASSERT(
> - move vpci_header_write_lock to vpci.c and rename to
>   vpci_header_need_write_lock
> - use a simple static overlap function instead of vpci_offset_cmp
> - signal no ROM BAR with rom_reg == 0
> - msix_accept: new line before return
> - do not run process_pending_softirqs with locks held
> - in-code comments update
> - move rom_reg before rom_enabled in struct vpci. Roger, it is not
>   possible to move it after 'type' as in this case it becomes per BAR
>   and we need it per vpci
> - add !pdev->vpci checks to vpci_{read|write}
> - move ASSERT(pdev->vpci) in add_handlers under the write lock
> - introduce pcidevs_trylock
> - protect for_each_pdev with pcidevs lock
> ---
>  xen/arch/x86/hvm/vmsi.c       |   7 +++
>  xen/common/domain.c           |   3 +
>  xen/drivers/passthrough/pci.c |   5 ++
>  xen/drivers/vpci/header.c     |  56 +++++++++++++++++++
>  xen/drivers/vpci/msi.c        |  25 ++++++++-
>  xen/drivers/vpci/msix.c       |  41 ++++++++++++--
>  xen/drivers/vpci/vpci.c       | 100 ++++++++++++++++++++++++++--------
>  xen/include/xen/pci.h         |   1 +
>  xen/include/xen/sched.h       |   3 +
>  xen/include/xen/vpci.h        |   6 ++
>  10 files changed, 215 insertions(+), 32 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
> index 13e2a190b439..2a13c6581345 100644
> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -893,6 +893,9 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>  {
>      unsigned int i;
>  
> +    ASSERT(rw_is_locked(&msix->pdev->domain->vpci_rwlock));
> +    ASSERT(pcidevs_locked());
> +
>      for ( i = 0; i < msix->max_entries; i++ )
>      {
>          const struct vpci_msix_entry *entry = &msix->entries[i];
> @@ -911,7 +914,11 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>              struct pci_dev *pdev = msix->pdev;
>  
>              spin_unlock(&msix->pdev->vpci->lock);
> +            pcidevs_unlock();
> +            read_unlock(&pdev->domain->vpci_rwlock);
>              process_pending_softirqs();
> +            read_lock(&pdev->domain->vpci_rwlock);
> +            pcidevs_lock();

This is again an ABBA situation: vpci_add_handlers will get called
with pci_devs locked, and it will try to acquire the per-domain vpci
lock (so pcidevs -> vpci_rwlock) while here and in other places in the
patch to you have inverse locking order (vpci_rwlock -> pcidevs).

>              /* NB: we assume that pdev cannot go away for an alive domain. */
>              if ( !pdev->vpci || !spin_trylock(&pdev->vpci->lock) )
>                  return -EBUSY;
> @@ -323,10 +334,18 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>      }
>  
>      /* Find the PCI dev matching the address. */
> +    pcidevs_lock();
>      pdev = pci_get_pdev_by_domain(d, sbdf.seg, sbdf.bus, sbdf.devfn);
> +    pcidevs_unlock();
>      if ( !pdev )
>          return vpci_read_hw(sbdf, reg, size);

There's a window here (between dropping the pcidevs lock and acquiring
the vpci_rwlock where either the pdev or pdev->vpci could be removed
or recreated.

Thanks, Roger.

