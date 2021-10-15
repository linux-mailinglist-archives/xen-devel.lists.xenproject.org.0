Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8804D42EEB2
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 12:20:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210214.366993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbKJz-0003t9-TZ; Fri, 15 Oct 2021 10:20:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210214.366993; Fri, 15 Oct 2021 10:20:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbKJz-0003rD-Ox; Fri, 15 Oct 2021 10:20:15 +0000
Received: by outflank-mailman (input) for mailman id 210214;
 Fri, 15 Oct 2021 10:20:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UM5E=PD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mbKJx-0003qt-FN
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 10:20:13 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7aee564d-2da1-11ec-822d-12813bfff9fa;
 Fri, 15 Oct 2021 10:20:12 +0000 (UTC)
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
X-Inumbo-ID: 7aee564d-2da1-11ec-822d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634293212;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xryMakgPAx+TdFX7ksKFqeArEpHY8BuQX20FfbnizRw=;
  b=hSoZjcKMM0sZEPvZoFFXhZm30rl6avb7Hh4b3zGoNMLKWgfaF/rpPwL0
   2JXUT8DybWonyAaiFwZZiDzpWR5kP0PDgxupZMhL/jUSpF3dBtKMcLNM2
   RKeMNUOltNSRH9xCj4V5aqHU1hVWN2xuiS2T/OOhowjlZqvbd+evKI6Vi
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Vahd2xfC8RE/GRFckPm5YaM5ciHt5L4FbBbTOsE9c8P8L342rPzw2r4oYwF058i/9HENAQRD24
 mC+RVYPne0pjEkoDIS2F5LOmFX88im4eumvEupuuxHKjkTx9dG1Ui6s5jgXt5ClVHukworYtWm
 Vj+fg+yDqSUmHf6EDcNWUYwjAhpeOUtcYeYpta3CnOwtfoZ+ywZWaguwNWC+KtL4TSMepLDK2c
 P46n6DfwffI6MSODs5t2ud5bPvu/E5YnLClDBulOpipb1u4sfiGcuU+EZWkzTP7y4VQtBkb28R
 4D5e9IiSjC6IXlUDhHNzrfMF
X-SBRS: 5.1
X-MesageID: 55262659
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OTabFa5BBVbLd2cIstuCGAxRtCjBchMFZxGqfqrLsTDasY5as4F+v
 mIfUGjSPq2LYTfxKY1/Odmz9U0Bu8LWmN81SwZo+yBgHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVIMpBsJ00o5wrdh29Mw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z8
 MsUn7G0bAIVOO71srsfFDR3MnhiBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgWpq2JoQQKe2i
 8wxTBlOaRvpPUJzJE4sMbMOkNyxpj7SWmgNwL6SjfVuuDWCpOBr65DvOtfIft2BRe1Og12V4
 GnB+gzRPBYeM9COzCufxViljOTPgCDTVZobEfuz8fsCqEKX7nweDlsRT1TTid69h02lUtRTM
 Xs9/CY0sLMy/0ymSNr6dxCgqXvCtRkZM/JIGvA+wBGAzOzT+QnxLmoZSj9MbvQ2uclwQiYlv
 neZktWsCTFxvbm9TXOG6qzSvT60ITISL2IJeWkDVwRty/Puup0phxTDCPNqCreoj8bdECv1h
 TuNqUAWhqoRpd4G0b2h+lLKiC7qoYLGJiYu/RneVG+h6gJ/Zaamapau5Fyd6uxPRK6jR1mcu
 D4/ms6R7MgHF5TLnyuIKNjhB5nwuazDameFxwcyQd9xrFxB5kJPY6ho/mhUCUNMN/oCOgbDP
 02UlCxwvYNqaS7CgbBMX6q9DMEjzK7FHNvjV+zJYtcmXqWdZDNr7wk1OhbOhzGFfFwE1PhlY
 8/CIJnE4WMyUPw/lFKLq/EhPajHL8zU7VjYQozn1FyZ2L6aaW/9pVwtYQbWML5RAE9ppmzoH
 zdj2ymil0o3vA7WOHC/HWsvwbYidiVT6Xfe8Z0/SwJ7ClA6cFzN8teIqV/bR6Rrnr5OisDD9
 WynV0lTxTLX3COcdV/RMCs+MeO1A/6TSE7X2wR3YD5EPFB4Oe6SAFo3LcNrLdHLCsQypRKLc
 xX1U5rZWakeItg20z8ccYP8vORfmOeD3mqz096eSGFnJfZIHlWRkve9J1eH3HReX0Kf6Jply
 5X9h1yzfHb2b1k7ZCogQKn0lA3ZULl0sL8aYnYk1fEIJhiyqtExdXGo5hL1SulVQSj+KvKh/
 1/+KT8TpPXXop9z99/MhKueqJyuHfc4FU1fd1Q3J57oXcUD1mb8k4JGTsiSejXRCDH99Km4P
 L0HxPDgKvwX2l1NttMkQbpsyKs/4frppqNbkVs4TCmaMQzzB+MyOGSC0OlOqrZJmu1TtzypV
 x/d4dJdI7iIZp/oSQZDOAo/Y+2f/vgIgT2Ov+8tKUD36XYvrrqKWElfJTeWjylZIOcnOY8p2
 7556sUX9xa+mlwhNdPf1nJY8GGFL3ohVaQ7t85FXN+321RzklwbOM7SEC775p2Leu5gCEhyL
 2/GnrfGipRd2lHGLyg5G0/S0LcPnp8Joh1LkgMPfgzbhtrfi/Yr9xRN6jBrHB9NxxBK3u8va
 GhmM0p5efeH8zty3ZURWmmtH0dKBQGD+1y3wFwMzTWLQ06tX23LDWs8JefSoxxJrzMCJmBWr
 OOC1WLocTf2Z8WgjCI9VHlsp+HnUdEspBbJn9qqHpjdEpQ3CdY/bnRCuYbcR8PbPP4M
IronPort-HdrOrdr: A9a23:tEPj06nCsuatD/A4pRh/Rx0Xg4TpDfO9imdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftW7dyRaVxeBZnPDfKljbdREWmdQtt5
 uIH5IObeEYSGIK8foSgzPIYurIouP3iZxA7N22pxwGLXAIGtFdBkVCe36m+yVNNXd77PECZf
 yhD6R81l6dkSN9VLXFOpBJZZmPm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTtj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZtA+1Dr1fqOk2lqxrk3AftlB4o9n/Z0FedxUDupMToLQhKQ/ZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIfwsCrDv1nVMS1cooy1BPW4oXb7Fc6aYF+llOLZsGFCXmrKg6De
 hVCt3G7vo+SyLaU5nghBgs/DWQZAV3Iv/fKXJy/vB9kgIm0kyR9nFoh/D2xRw7hdUAo5ot3Z
 WMDk0nrsAJcie6BZgNcNvpevHHeFAldyi8Rl56EW6XZ53vBEi93qIfwI9Fr91CK6Z4hqfbpv
 z6ISRlXCgJChvTNfE=
X-IronPort-AV: E=Sophos;i="5.85,375,1624334400"; 
   d="scan'208";a="55262659"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YX9LFIxx5zscLhPM1odE3bXgND9SDwQuOfdz0NcsIe+3CQtS1yeYUveP199Vz9srrL8n0TVIwRam3pYR/UAZPNCjuRgHYsWxzvQxD+yeIu/8j7DtjgNuxDVJko8krM9Bcwt6cdV1nRF+76WxKRQqZvV8XJuTDXim/+/Tz46dewZ9TiorMTHmH7sAZtMYPupcld1VkeGp110arOTXhOtM7GWT6oJ3D9zSLeC6YCvAmoWNsEac7ia1aItJb+3FOY80vejHLE16TVh6zP6Iv3yY5pWhFoxLgNDZ/i6dnQbvsJeibgeBioVmsEvxs51juxVPf+O/Xtp57k6+Duq5+Liw5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MNC1a91rpq7DUgy3k6U5HtOdN4y858cGx50d5cboIg=;
 b=Eb39JKwWNVv+aBMhJwDE/KcdsiX61rXoCk3GPT41kqLrD29cjN/Cf962ikQnjpxMo5Xr8VYKt8yKYxd8qT0916e483IkU8clhDcsNuU4SuQjaZwKklUjqaf1glU1gxADnRXoUQvBflfBwUJr8RnhfTU9EjHSzvkXodL1Q7wUbH25Z4QS5hLoq0XHx7rP9/w5eppg92f75koyHyNwuLfakrzJFfTZKLp4eWIBjCQwaFgaxYVjzQ3Eo7Bznk5XOAmJJZeq3Z7a/meVM97BS11QVzgMPuJKSVpoWjuHJ1KkqIJ1ZtmOGNSXZvp7sIqsUZF6fy4jnmHgxSXm5t0S201z+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MNC1a91rpq7DUgy3k6U5HtOdN4y858cGx50d5cboIg=;
 b=G6J/9LfqYL0mLSycp8ic3ivfjFz5lMrNWAaWEgv+mBUPExm+/wl42Ti2oYZhmJqUZczMcfF0Mpz39DRA977yRXpYv9ga+clvxoS55COzyVxYAzarWZ0YQvXylMbA+XUEA50TzfJRkN15+kNDRi6Nf9RgiCdMywGDfbHeWW4XroY=
Date: Fri, 15 Oct 2021 12:19:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Message-ID: <YWlVxAPcuWVHtxsR@MacBook-Air-de-Roger.local>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <396b08e2598cf0338e0c7f4ad3cd5cb66db89224.1634221830.git.bertrand.marquis@arm.com>
 <YWk8uP/YuSee1MfG@MacBook-Air-de-Roger.local>
 <CD9B29B0-31FD-4E09-93E3-7124C724BC23@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CD9B29B0-31FD-4E09-93E3-7124C724BC23@arm.com>
X-ClientProxiedBy: LNXP123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb47ba05-d0b9-4c88-ad4d-08d98fc5543d
X-MS-TrafficTypeDiagnostic: DM4PR03MB6062:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB606241210D2A725ECBDCA5A68FB99@DM4PR03MB6062.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yKLeQqvv274ycAtzeYZzATXsvkW679bvT6dXC5i6ii1IWu5j3bwQQh0qpommuO6WeyF+N0ZDHy9u/MLKDepVYuEAU799QVFuLjR/rE7xdCduBHFfDoA7wPqY1oXiThtPMdJd+a+IgD/9w/StI8Lxzw1WP/1io/SJFQqlm0GuWyk5J6u0ijInGfDgG068LkvzMQzEX7G9x3cae8isOT9c6AqIHD/XlQSR3axvX3BBS4ZuJm8o0aQlz9eaCqHN3+b6pRMal1TFR8RDGTTnBgMV7A14WaEXw2Nay2218IerHw/OfO9/JT9L+I1FezE6T2jMZUgwzbnwXVt1vFHmbiOwTTwVSjyoOZ/F92j4ln6N5ef+Q2lXotlGJG1JYo+XX8EyVaYuJSzfVflukqCepPWf82AnlotplKd1SOrbQObLhamGhZTJh4JqJHayPwd2EHtN10HRe3flf+j/rDddZP1bEQzqnqMpvhhPbok+kvDTcE1c+ksDVa5kqN+o6/vyO1wJq9qperP4GHYK0HIa68YXjCznKT2aWAEswilgnPZ/NQX8dtm5jf30ehakviCKl7ksGzfWUqETwj/0iEYedCRgIKWuW+H0XG0qtd7TeyX6Z4UI99X6HIt0Ul2UxHCqnQ3PPEW4H43ZITEwaHinW33ldA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(85182001)(54906003)(316002)(86362001)(508600001)(6496006)(53546011)(26005)(5660300002)(8676002)(8936002)(6916009)(66476007)(66556008)(66946007)(186003)(7416002)(9686003)(83380400001)(956004)(6666004)(4326008)(2906002)(82960400001)(38100700002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlVQYkdzRUpzbEM0TEpzQ01FY0tXUlpPMUhFRkRaYXJxc2dmQ1NmaHZVTC95?=
 =?utf-8?B?M0VaWVh5RUtFeW1Eb0RZU0prb2NqMGZ6aFdpMTUwVS95bjhSZW1adDgxUnRt?=
 =?utf-8?B?Z2J5ZnRKakpNb2dwc2diM2VhbEF2OTBDanlYWVB4M1l6RytLcFFxSmpyUEgv?=
 =?utf-8?B?SXVOQ3duRmx3ai9RanY1RXR4QXQ1a3ZwUXI5djBxeURaYWczZWg0SDJHR242?=
 =?utf-8?B?STFqaEJqY1Zod3pqSnlkTkxkZVdxeHE4eDkxVGhwbHVKQWNCUVdCOGQ1S2xC?=
 =?utf-8?B?Wm5vT3l4T0M2anVHVFl1aVcyUTdxYWM3czluWnY1eWxTQkJUZzZuSGlHUmVz?=
 =?utf-8?B?TXFNWXhDOUx6SjQrNVZWYmhmY2dBb3VlbWE0MVFqYTFmbG52NUw0YVp3M1Uv?=
 =?utf-8?B?Tm9yUy80ZndqSlJNNlN6RUlnV1Z2cmQyaTFoRWh5SFhSb0VxVHhBSjl5OVZ5?=
 =?utf-8?B?THozRmRpQ1RLRG1GSkdsQUNoMUVaa0RiSWN1L3ZWbTgyUUdENlkzSGdCR0ty?=
 =?utf-8?B?SmdVc3c4eUxIUHl2M01ESmhjeFNSYU9TZ0tOM2RVSTkzNmJ3bWFJaC92ckc2?=
 =?utf-8?B?dFEzbmd3VEFHd0tNamsrSVlVS2VBQjVDNUx5VVR1SzRpcTRLMWZydTVaM3JQ?=
 =?utf-8?B?djlqb0pNbmNBdElSczZURTZUZWkzQTFzZ2F6YkovS2haeHJyZll4UWQ0WFFW?=
 =?utf-8?B?OGg2cGxMR3FqNk9rSUczSFBSUjBnUk8yZXpRcEhCUU41bWVyY1VtZ2xZOHlt?=
 =?utf-8?B?K3R2WTM1dDhHZnZXdWJpb0RnZmxuMUJKRzRYVnAvSG0vNC9qWjU1UGRsaDNZ?=
 =?utf-8?B?R0pVRzJCK29SYlRjUktncytvUDFGYWRkb0U3cEJwV2hkZG56bXhMaVJrTVhr?=
 =?utf-8?B?VkpROW9Va0dLNHcvVFM3amYvYk1zNlZpTEFKZjlxNHNtekxESDQySkJmQlZE?=
 =?utf-8?B?MjBiSHg2QXpRblkvSk1nRnU2OWJwSFFmbnR5anA1VG0yT0NiekJ1TXBmWmVz?=
 =?utf-8?B?SmR4ZUs5blZWVHVmaDhrb2tielBSUnBPQmdLbUFEelRWWlA0UWdCZXBZU3FI?=
 =?utf-8?B?NkFnNEJoVjZGbzNXOGpKQUphOVJGekVQZm5NWXBDNWRabjBTRVdRcmZLWWpV?=
 =?utf-8?B?QXRUbkRLaVZLaW01L054bFdLL3U4MkZtbTZYZ0dMMm9VNWhoQUpNOFpoOUtp?=
 =?utf-8?B?M1QzWGQxeDNFUm9ETmNVK2ZxbkxhaDFWU0ZrRXNjYUl0QkpjbTZxUEpDVTBN?=
 =?utf-8?B?OE1GYXFMZmhjRzI0TUY0WG1IcDdzUVBoS1FqKzJ0Lzk3WlA1dWhVeGc5eURi?=
 =?utf-8?B?RnFsU1hmOWRuQ1JWRFhkaHJvSEN5OFlBNmFkdmJPcjNNSHkybEtXY2hZQmRP?=
 =?utf-8?B?aXhlYnN0V000SXVnZUN1d0QxUUsrV096dWdGKy9WQ2NKeHBZNVlZYXN2NGo3?=
 =?utf-8?B?M2RMaEJ5dTdIaVdiNFZlVUp2ZTBVdTd0aVdtM1Fza1UzSUs3ckxPNlk3UkJS?=
 =?utf-8?B?OFpnMC8rMEZZZ2hzcTlLbTNjTkVlYm81VUhvUHgwWGxwVXc5cDRKYkxRQlJ4?=
 =?utf-8?B?eGdUSS80ZEtIS3BYVG1lbTdVSzcrNElhYWlkNFBvQ1lzUTFqQjFQbWVmaHgw?=
 =?utf-8?B?YmNSMVphS1g4VlpkWWRlS1VhR1Q2WkJTMWU3UDhIV3VNN3cwZkNsRzZCOFNW?=
 =?utf-8?B?cmxROGpOQ3JiU2RRcG1VOFo3MkI5czIrMEVlVHBOSlZRVGthZjRmRzllR3pn?=
 =?utf-8?Q?jpirelQ8fzBeyJVEf9sRmztNq9Mgv0OlVrGn6Su?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb47ba05-d0b9-4c88-ad4d-08d98fc5543d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 10:19:53.6304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cnA/4K9PdYLZ+DAFdB8fszMmMSgvCvckqUuj/h2VEYgZCDG+Vi1K64xK8UHRXQWzpCPocF5CzPZzlzsX0RtVsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6062
X-OriginatorOrg: citrix.com

On Fri, Oct 15, 2021 at 09:52:28AM +0000, Bertrand Marquis wrote:
> Hi Roger,
> 
> > On 15 Oct 2021, at 09:32, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > 
> > On Thu, Oct 14, 2021 at 03:49:50PM +0100, Bertrand Marquis wrote:
> >> From: Rahul Singh <rahul.singh@arm.com>
> >> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> >> index 3aa8c3175f..8cc529ecec 100644
> >> --- a/xen/drivers/passthrough/pci.c
> >> +++ b/xen/drivers/passthrough/pci.c
> >> @@ -658,7 +658,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
> >>                    const struct pci_dev_info *info, nodeid_t node)
> >> {
> >>     struct pci_seg *pseg;
> >> -    struct pci_dev *pdev;
> >> +    struct pci_dev *pdev = NULL;
> >>     unsigned int slot = PCI_SLOT(devfn), func = PCI_FUNC(devfn);
> >>     const char *pdev_type;
> >>     int ret;
> >> @@ -752,6 +752,19 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
> >> 
> >>     check_pdev(pdev);
> >> 
> >> +#ifdef CONFIG_ARM
> >> +    /*
> >> +     * On ARM PCI devices discovery will be done by Dom0. Add vpci handler when
> >> +     * Dom0 inform XEN to add the PCI devices in XEN.
> >> +     */
> >> +    ret = vpci_add_handlers(pdev);
> >> +    if ( ret )
> >> +    {
> >> +        printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
> >> +        goto out;
> >> +    }
> >> +#endif
> > 
> > I think vpci_add_handlers should be called after checking that
> > pdev->domain is != NULL, so I would move this chunk a bit below.
> 
> On arm this would prevent the dom0less use case or to have the PCI
> bus enumerated from an other domain.

vpci_add_handlers will try to access pdev->domain, so passing a pdev
without domain being set is wrong.

> @oleksandr: can you comment on this one, you might have a better
> answer than me on this ?
> 
> > 
> >> +
> >>     ret = 0;
> >>     if ( !pdev->domain )
> >>     {
> >> @@ -784,6 +797,9 @@ out:
> >>                    &PCI_SBDF(seg, bus, slot, func));
> >>         }
> >>     }
> >> +    else if ( pdev )
> >> +        pci_cleanup_msi(pdev);
> > 
> > I'm slightly lost at why you add this chunk, is this strictly related
> > to the patch?
> 
> This was discussed a lot in previous version of the patch and
> requested by Stefano. The idea here is that as soon as handlers
> are added some bits might be modified in the PCI config space
> leading possibly to msi interrupts. So it is safer to cleanup on the
> error path. For references please see discussion on v4 and v5 where
> this was actually added (to much references as the discussion was
> long so here [1] and [2] are the patchwork thread).

pci_add_device being solely used by trusted domains, I think it would
be fine to require that the domain doesn't poke the PCI config space
until the call to pci_add_device has finished. Else it's likely to get
inconsistent results, or mess up with the device state.

In any case, such addition needs some kind of reasoning added to the
commit message if it's really required.

Thanks, Roger.

