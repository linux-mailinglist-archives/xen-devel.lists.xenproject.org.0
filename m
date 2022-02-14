Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEDC4B54EA
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 16:36:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272455.467306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJdOf-00016Y-Gf; Mon, 14 Feb 2022 15:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272455.467306; Mon, 14 Feb 2022 15:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJdOf-00014j-Ct; Mon, 14 Feb 2022 15:36:13 +0000
Received: by outflank-mailman (input) for mailman id 272455;
 Mon, 14 Feb 2022 15:36:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qPn=S5=citrix.com=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nJdOe-00014U-NW
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 15:36:12 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4f29fba-8dab-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 16:36:11 +0100 (CET)
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
X-Inumbo-ID: d4f29fba-8dab-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644852970;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=RFx7gPQ8zFQJy3ui2wSaA9ub02qInPINmmr4DkPN7Bw=;
  b=WmZuOMOuICutqjSUz8/glYUrsu2HQV8HhgToebsY2Ryhf7fivzDTdcSt
   yz+ftaB5Wt0+Ls9teqDdtCWzB7QS+kn24/5ppZAAYNEalpIn/OrbFBxuC
   WBXyOXGYaBknEsF7Azq/YUNe5eD5CpaecKtqXMVPr1Mbco3CgqLt9NkUO
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
IronPort-SDR: o9vyVlmjvUHj+3BNWYRy8TenAkXQ6tA/2GGtJFrzrigSXOXcwkMKZO0pV2vthwNTbQDsKskqNp
 60oYj8SVhS/JqjEx/UXFmIXvT73LJLLkD+ph6P/1MR78LOFDfMor/uVaYD+mUlcB2emMdFwD/d
 HxveQCnnzkq/2twTk5cSIuXOIbuwtPiUGzJCo4WJPt0pSB06acDsuQn9+e9vQnRl/bi5LpjiTm
 v3nUzi5TbzbIJPdcY+iWE97xzto1I5altoP+fLjf8wP5xNbEP0RsK9fzV+JHM50f8tGKqWBzoi
 PpxiSmBznsi9OcCp5V7LLcTH
X-SBRS: 5.1
X-MesageID: 64570459
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:CfMz/K4hlDDkVTlaCQTXMwxRtCzBchMFZxGqfqrLsTDasI4TYg02e
 lBvGjDRZK7OJyCgZYg1O70CxjoD75aAndAxTlc+/C42Q3tHo5ufC4rHIxauMX2fd5WYEkg/4
 stBZIefdJttQiGCqkb9P7S79nJ12fnYHrDwUufNUswdqXeIbQ944f40s7Jp0uaE+OSEPj5hm
 e8eguWBZA7+izB+bD5O4qmOo0gx46j/tWgUsAxkaflHt1aCmihJAMoTK5/qIiqjSOG4PAIbq
 8Uvbl2d1jmEl/v4Ior9yt4XSqCOK1LrFVDmZkB+AsBOuTAf4HxiukoHHKBEMx0P0WzVx4oZJ
 Ohl7vRcdy94ZsUgp8xFO/VoO3kW0XpuoeKvzdCX6KR//mWeG5fe66wG4HIeZOX0zt1fE2BWn
 cH0HRhWBvy1a0Ba95rgIgVkrpxLwMAGp+rzsFk4pd3SJa5OrZwu38wmTDKXtds9rpkmIBrQW
 yYWQQBEaEiHRSxBBm08ObEcmOi1u3fyfAQN/Tp5pYJvi4TS5Al40byrO9vJYN2aA85Smy50p
 EqfoT6/WEtDcoXCl3zVqRpAhceW9c//cK0fE6e3+7hGnVuXz3Q7AxwKT1qr5/K+jyZSXvoBd
 xFLonZz/MDe8mS7cfT7WRy4oEWgrx1HXNRfLPwH0w2Sn/+8DwGxWTFfE28phMYdnM0rQT0n0
 HeZktWvAiZg2JWOUm6U/LqQqTK0OAAWIHUEaCtCShEKi/H8pKkjgxSJScxseIa0kd/dCTz22
 yqNriU1m/MUl8Fj/4eR8E3DgjmsjoPUVQNz7QLSNkq14wU8aIO7aoiA7VnA8e0GPIufVkOGv
 nUPh46Z9u9mJY2EkSWWaPkOGLyv6OeINHvXhlsHInU6323zoTj5J9kWuWwgYhcyWioZRdP3S
 HX4vV8Wwq5dAEGBXIxVZ42sNsonwpG1QLwJScvoRtZJZ5FwciqO8ydveVOc0gjRraQ8rU0sE
 czFKJjxVB72HYwilWPrHLlFjdfH0whjnTu7eHzt8/iwPVNyjlaxQKxNDlaBZ/tRAEis8FSMq
 IY32ydnJnxivAzCjsv/rNR7wbMidyFT6XXKRyt/LLDrH+aeMDt9Y8I9OJt4E2Cfo4xbl/3T4
 la2UVJCxVz0iBXvcFvWNi8zOO6yBc8k9xrX2BDA2n7yhRAejXuHtv9DJ/Pbg5F7nACc8RKEZ
 6ZcIJjRahi+Yj/G5y4cffHAQH9KL3yWafa1F3P9OlAXJsc4LySQo4OMVla/pUEmU3vs3eNj8
 uLI6+8uacdaL+iUJJ2NM6zHIpLYlSV1pd+eqGOWfogNKB20qtACxu6YpqZfHvzg4C7rm1Oy/
 w2XHQ0Zta/KpYo0+8POnqeKs8GiFO4WI6aQNzOzAW+eOXaI82y975VHVerULznRWHmtoPepZ
 PlPzuG6O/oCxQ4Yv415Grdt7KQ/+9qw+OMKklU6RC3GPwaxF7dtAniaxs0T5KdD8aBU5FmtU
 UWV99gEZbjQYJH5EEQcLRYOZ/iY0a1GgSHb6Pk4eR2o5CJ+8Ledf19VOh2A1H5UILdvadt3y
 uY9os8GrQe4j0NyYNqBiylV8UWKL2ABDPp75s1LXtezh1NymF9YYJHaBivn2721ao1BYhswP
 zuZpKvenLAAlEDMRGU+SCrW1u1HiJVQ5B0TlA0eJ06Ek8buj+Ms2EED6iw+SwlYw0kV0+93P
 WQ3ZUR5Kb/XomVtjclHGWutBxtAFFuS/UmokwkFk2jQTk+JUG3RLTJiZbbRrR5Bq28MLCJG+
 Ly4yXr+VWe4dc786SI+REp5pqGxVtd27ADDxJiqEsnt80PWutY5bntCvVY1liY=
IronPort-HdrOrdr: A9a23:y8EJ66m83IFeR+MCRO3Mo0iHQ4fpDfOFimdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcIi7SdW9qXO1z+8Q3WBjB8bcYOCGghrnEGgG1+rfKlLbalXDH4JmpM
 Vdmu1FeaDN5DtB/IfHCWuDYq0dKbC8mcjC74q/vhRQpENRGttdBm9Ce12m+yZNNW577O8CZe
 OhD7181lydkBosH6GGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3z8FOgk/gYsKwC
 zgqUjU96+ju/a0xlv3zGnI9albn9Pn159qGNGMsM4IMT/h4zzYJ7iJGofy/gzdktvfrGrCo+
 O85CvI+P4DrU85S1vF5CcFHTOQiQrGpUWSkWNwykGT3/ARDAhKevapw7gpKCcxonBQz+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjwkC2weMlGc9sRKEkjQho+a07bWjHAUEcYZ
 5TJdCZ4OwTfUKRbnjfsGUqyNuwXm4rFhPDRkQZoMSa3zVfgXg8liIjtYMit2ZF8Ih4R4hP5u
 zCPKgtnLZSTtUOZaY4AOsaW8O4BmHEXBqJOmOPJlbsEr0BJhv22tLKyaRw4PvvdI0DzZM0lp
 iEWFREtXQqc0arEsGK1I0jyGGEfIx8Z0Wl9ihz3ekNhlTMfsucDcTYciFdryKJmYRqPvHm
X-IronPort-AV: E=Sophos;i="5.88,368,1635220800"; 
   d="asc'?scan'208";a="64570459"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYGvCdD8MPLurR+qbvmps2sQBDQ++/8gVjgTnrLr2TFDzsD9VMlWY8/adg+UkI9X3o1oOakFCtxlL9BD5cSuNWAkrmq2YA0hzxEc9SIHOmQfUdSLPJbS0RHXOWWUHXjqnRocKtONltzdoLddwaXo3VdS7Nwjvjz1kUB/aUZe41b50zMKddRJQNvP2ttlqyspbIoOAr+Ahsu9CL18lcxlp+XxDFk6Virmt9PmLfVVqMDjx0NZOW6FMRhXDxEDOcXQWNHSSoVt1lWgHLjBiEha1axz5pSNjyG+9+Y+c0xM6KL95sddw1+DY9dH4949462JK/a2G/rk4Z2dCJWmW/KHcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtPux8MtF0qlE8SFqgbAGrfXqFA+XOtQMCO+QiG62eg=;
 b=J5rw7MV2YY6zh2iKtPPmm/UyikvnGko5eAGF+ZDPgblN3U9fu1yenk65zxIHgcbK7FDLc1RVhmUAHH2yPXqYbOPkc5zmVwY0ao1CISgaMU013b07Z9T6CEPAWiPAq784DWKsXCTZ0OiM8D68BJcrGq74j0l7/CdJpGdIi3AabRZ/F2JfwL7PLXPNXl6KXaxhb/KKjIEfQfdTUJrxPHXdgOcGVA+TIVwiXJvnoNqK94WAxRthlnT+ggNuVh+JUgbEZhtoa/VA7CJshesCrGbjeUoKZrxR5h/YpoOHdSQ4/n/RHE0yu3PaSWF5yPeZEwJvy+w/2wiy1Mke5MI46aaIIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtPux8MtF0qlE8SFqgbAGrfXqFA+XOtQMCO+QiG62eg=;
 b=kuRbO5nQSljd2zKbYc73EZCeloG+kJOztlUENL3xX+dlunMCTPAeM+AbMymdtHQ0iPMSIvWMZRsZkYwBTaxyHLT6cr0sjB/NyVCZuDz49k/54MUD7emEkt3gdr/cuVYRQZoPH75JzY3OdwD2AkxSyu710zmZ+maqIJ91glcfq04=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Roger
 Pau Monne" <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 13/16] shr_pages field is MEM_SHARING-only
Thread-Topic: [PATCH 13/16] shr_pages field is MEM_SHARING-only
Thread-Index: AQHXcbjK851LdePqFEqUaSPzO3BXl6yUjbMA
Date: Mon, 14 Feb 2022 15:36:02 +0000
Message-ID: <527BB238-450D-442B-BE94-91B5E64C6D2B@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
 <ec21ca25-73bc-ddb7-8674-b7a59adb441c@suse.com>
In-Reply-To: <ec21ca25-73bc-ddb7-8674-b7a59adb441c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ad5835a-3d3c-4acc-175e-08d9efcfb571
x-ms-traffictypediagnostic: PH0PR03MB5719:EE_
x-microsoft-antispam-prvs: <PH0PR03MB57194DB79AB7D34C5B443ED499339@PH0PR03MB5719.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rAfE67x7darl1KGDJ3Vb22P28uhQoNfOpweF9bxj8Gb3yq4eamGAS+mIAQOuC+dDtCLmT8wduIoo8td6d3xAOneiQyY9iMUn6TPwqCnnsHlmUetp7aImt5CoXCwWmqaxV4vDQPBV4t3vQLlVDcpSP3n6AuWFiWgQbavPqnwAIptG+cy3bxHAh45eHhrmceEatdS6YswRCOb+MhfwmDXxWaWkTwPTNc2yilS7wIoV8fc77Zfhtpy6bozTziv44oHWnNDRXa8HyqbRzEAEQhgmFXnpiLrgR77q6fmT9lmkcEoirnLZxvCq1svTag2Ganql3vAWR+XmNCUCdVZ1rf/PAbiw77pYbeMFXCcMpUPwX8QbwEytjV2YdDx7Xsx223HJE1J9V0HGLC36yyQ1zrP3RBk/Dmvmu0JCgR4Mj5a2zC0KgOucmz/D1gcx/KpfRc8VDjzkMSlB5uFNVsZ8B+0PrDhIRaKK6yuj4pG16uuW/7b9eBA1MH+yVlzWLbMKEeBXBecFf4p+nXOzSLjclK5gaT9meuvInhD7Bz5pVnsrYSUFGPZpTd/QDRlbn6R5jucuuxwsZrz5hB19tVlRAUubVExH/0noc6kEQRwGUM4iphYBZoa377LBlwnmTDv3jrn/QGOcLWexH6LZ5h2w11wpb/rsoM+2kcQxcXX/uOWbQ0oD4afGfcMp5bOEoHHn39eE20O228j/qaUXyyJbhMfoAnfdqDs8vUex0VJt1yoUA0lb8lAOosgXOMGrDyjm39Bb
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(76116006)(4326008)(316002)(54906003)(2906002)(8936002)(5660300002)(4744005)(508600001)(91956017)(38070700005)(8676002)(66946007)(66556008)(6486002)(64756008)(66446008)(66476007)(33656002)(82960400001)(53546011)(26005)(186003)(71200400001)(38100700002)(2616005)(36756003)(99936003)(86362001)(6506007)(6512007)(83380400001)(122000001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Sf+XK91DtLMA6K9XH6IyUixUb1RSjKnm28NLHL76+bLb5/pcOY/EuUp7M+CX?=
 =?us-ascii?Q?/2RqvdHAc1SxKpeZxE2izIYIU83sD3yn+q3/8uhOyXQ/C+jAALyYiXeHlEAN?=
 =?us-ascii?Q?YJSqEkFk3GCDWpVlrwq69wzQObvzBKHoxasf3s74NHI8mNfas2c5gMlzr6N5?=
 =?us-ascii?Q?EJ1xY8DW1ckFwCjELzNV5uM4t6EWG2zB1hFbdux9bajjpHoYr4Xkdl/OPYLg?=
 =?us-ascii?Q?5Vl+7WOnD1QQ13QJCQ9bK8ExRFmlRb1ss1gF0Zfs+xD6l7H66fHD/0S80w2h?=
 =?us-ascii?Q?jvUwR9BG1wG3Lae7SLJBA1ysQccoAJqZHwNdPi9VO6R3GS4fhc9zS2alVk8w?=
 =?us-ascii?Q?BFVm7y/7MDducowpg4g4b6Ibas+99B4tMV18aKzNxTahgAKFQ3P1N4BYEmdO?=
 =?us-ascii?Q?FZYk4G3Ym3G17Q+xIYRhDbWfy1w8v1KnROCo43FqnOnsgvb37AzmbnekV7ni?=
 =?us-ascii?Q?e7EmgcNLeJeSxXuHuO+4xtZpGWnYg3LLEJU1NTF0rjq5rgSu0INmQ0/6dEPv?=
 =?us-ascii?Q?W6/kqRtBPD+mc0ioc5EOZyEA6k0Cvwe3j3uSmtB2Rx5mcvC3IVGWyZtF2GA8?=
 =?us-ascii?Q?/uEIOBgXxHrNi8Yeo8u8Fp8BrEOs06FhmGR58Ty76RLriGh0XAP8GJ5WJXLr?=
 =?us-ascii?Q?JK/0H39tHYXCsY9WMNj70oVWVyQlaX8FW9s9NLNMJKq+TZQdDyk2/BhlvbSd?=
 =?us-ascii?Q?lzOR07KapKToz2J9m6nU/7Yvl3A5Wrx7nhfBIPjFVdKOqz0z/eKAhvJ4L2dz?=
 =?us-ascii?Q?f698bH6bXV5z4Jza9/BNYJDuOFOpZz6fmljjo3HsWv2eA1usJhnmQONsMM3k?=
 =?us-ascii?Q?y5D0kCh8FMTyYptjjEuNtYKg9czAOQdTNWq6RzBIuRKkEnHVeB37d34OEjEZ?=
 =?us-ascii?Q?gm/u4T4acUWrwX4gCoVytXI7nS9u1WIyx56WHhlXrRmH78rgpJi71Ka2frqB?=
 =?us-ascii?Q?r/320nWgjmSHYfyqN+SMGVCjdgMIz7yvKY7ikeSKruMBgaq+EzNti8L8IyEQ?=
 =?us-ascii?Q?blIGfdo23BlKsp1MnYFX3hkUecGVTKpxc4P5Vh6yRntgjwaQ62GJ7EWDwzfl?=
 =?us-ascii?Q?yVQe9SLSJFatwZkDS8JAiROSHofNyX9l6NdRfs0iIG+Wz+p8s5/qZPC3wdLQ?=
 =?us-ascii?Q?eONBcYx3s7xMbmeLvWO1LaU9n6QRPcqMqayg2wNLPl1XpLcq1Omo5J2Zdwwi?=
 =?us-ascii?Q?9NOWn4NzuW0hmSMG1p0XEnlh7rBn0e2s28eq7HdJyXqOaGuhdF7pWjdMHghj?=
 =?us-ascii?Q?rc+eh23O/ABxK/P7FkUVVtNCsrUOsSD95uppGa+Mq28jOt2KR2NzAmrtFAQO?=
 =?us-ascii?Q?EwgZ+w8GH2p3iQEtokSHuvtCcFfxB/lAvaOClcHSYHNJFSagT1MWOxtAl/aH?=
 =?us-ascii?Q?6IH+sKwaY998SzTtGEz+ytnpf4G/4YrG4OHI0ycfNB7OPfKWuxz3dGsluk+H?=
 =?us-ascii?Q?CiZuVM3xNx1BEhnNY72S/ZyjeL7uyibed4h4EW567EVfh402OfON3sQM4Xyz?=
 =?us-ascii?Q?NRSar01d0MgJiAYx1oEvx1ClBGxRnobaeg+HpjpP5VLnLobrFmE4JcEYfasJ?=
 =?us-ascii?Q?8s8wsxG57GwUyFB2TMZjclTpx6TLWiG1vhgGPve6z4dOHXmZTLgFQ/CfeGm8?=
 =?us-ascii?Q?8N2M1iIc6H7CNS8IvM8FQaksyRbtYiKHXpNwmRl5Rh2Xq8H9xP0EP0FoyuDz?=
 =?us-ascii?Q?IzI2fOXaNb2sWkrgKwr0vQPL6G4=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_99BDEA2D-AC09-4244-BC91-E0716D861E74";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad5835a-3d3c-4acc-175e-08d9efcfb571
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 15:36:02.9586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2c2WcEQUUrpwcBYrbpjCThH6AZ8g9XBDnf8lGYZhjCogYq0l5tVYXmRT4oE3VuRT1E2/mpJuRpMSa4IgzUfZ8pWKod9GI+8MYBHnmxsMb14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5719
X-OriginatorOrg: citrix.com

--Apple-Mail=_99BDEA2D-AC09-4244-BC91-E0716D861E74
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



> On Jul 5, 2021, at 5:13 PM, Jan Beulich <JBeulich@suse.com> wrote:
> 
> Conditionalize it and its uses accordingly. The main goal though is to
> demonstrate that x86's p2m_teardown() is now empty when !HVM, which in
> particular means the last remaining use of p2m_lock() in this cases goes
> away.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: George Dunlap <george.dunlap@citrix.com>


--Apple-Mail=_99BDEA2D-AC09-4244-BC91-E0716D861E74
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmIKduIACgkQshXHp8eE
G+1YdggAisUcrRHF+Q21kgJFzWHCT+AtmxeNiIFVOK+tqSfsSKu8s44KtdYefspY
ngDy2x97gOCN3me8XWoXXh9rbaWqgg/tzO4zn/MEIhQA+Qi9e4iuVrwPE2/20cFc
ljESCbUASbIj5PXrQ1P3o1gAL91sxie2toKiA2o2Yn9U0pZjRdmGEsuTdXNEzM3W
PTQhso/TTGo5uqfNnXVCQXlMOxCWtj4GAPhPC65DOC+5KeyOHNsqhC8ZkBtWyRi6
MtN6202vf8uaTj/Pwzj4g9EawTUtcrO7FtD/FiolhWylPd6dj/FPyvFOv6qXOcRX
sWR6BuuNBUc6o+8Xf4T0P1uTvzGZFA==
=9T6O
-----END PGP SIGNATURE-----

--Apple-Mail=_99BDEA2D-AC09-4244-BC91-E0716D861E74--

