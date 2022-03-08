Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9042C4D1BA4
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 16:26:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287088.486898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRbiu-0000TY-Co; Tue, 08 Mar 2022 15:26:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287088.486898; Tue, 08 Mar 2022 15:26:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRbiu-0000RD-8o; Tue, 08 Mar 2022 15:26:04 +0000
Received: by outflank-mailman (input) for mailman id 287088;
 Tue, 08 Mar 2022 15:26:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yKud=TT=citrix.com=prvs=05922dae9=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1nRbis-0000R7-L3
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 15:26:02 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e6bdb33-9ef4-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 16:26:01 +0100 (CET)
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
X-Inumbo-ID: 0e6bdb33-9ef4-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646753161;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xNFArvititNpIWWNSi3QNjAaXILkXkQHCtvRLD29jcY=;
  b=MrQ3LJJ2Bm0kjcbZ7BRnASvzzDrrnCGfsKuy87EfyWQ3Z+ciJBlXm8B8
   ZB7E3Uo3wKUtp+XVCF1YxfsGiYYyB+oiY5tY9LABCJ6p83/gi7GvIVZ2T
   1rnCOu90LRbiENG6ogHXk59QjfF1+kKtKpmFatV0BSUDflqnHNECi1z4r
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68067774
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:FO+cXq9jV0uCQRr9FC+sDrUDQ36TJUtcMsCJ2f8bNWPcYEJGY0x3z
 zMfX22DO/vcNzfwc9siat7i/U0OusKDzNdhS1Zvr3o8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oDpW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbKSDiYWAr3govQASUQHOBAlGqJs/bCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYoWomyTjWAOw5SJTHa67L+cVZzHE7gcUm8fP2O
 ZpBN2UwM0iojxtnKl4IBs8Hgd6Tryfwb2Bdl0+/rLglyj2GpOB2+Oe0a4eEEjCQfu1QhkGYo
 mvN/EzwBxgIM9rZxTft2nGrgPXGkWXkWYYRPLqi//VujRuYwWl7IBgVSHOypPCrjUj4V983A
 0AT9yAjqYA78UW5Sd+7UxDQiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6cLqScCj
 wHT2YmzXHo27ePTGSn1GqqoQS2aFwpSDFA+dQM+XRYfvobIkdoUgTjKQYM2eEKqteHdFTb1y
 jGMiSExgbQPkMIGv5mGEUD7byGE/caQEFNsjunDdif8t14iOtb5D2C9wQWDtZ59wJClok5tV
 ZTus+yX96gwAJ6Ej0Rhq81dTejyt55p3NAx6GOD/qXNFRzwoxZPnqgKuVmSwXuF1O5eIVcFh
 2eJ5WtsCGd7ZifCUEOOS9vZ5z4W5abhD8/5cfvfc8BDZJN8HCfeon0wOxHAgju0wBV3+U3aB
 Xt9WZz3ZZr9If47pAdaus9HieN7rszA7Tm7qW/HI+SPjuPFOS/9pUYtO1qSdOEphJ5oUy2Om
 +uzw/Cikk0FOMWnO3G/2ddKcTgicChqbbir+pc/XrPSfWJb9JQJVqa5LUUJINc+wcy4V47go
 xmAZ6Ov4Aan1S2dd1TQMSwLhXGGdc8XkE/X9BcEZD6A83MifZyu/OEYcZ42dqMg7+tt0bh/S
 PxtRilKKq8npujvk9jFUaTAkQ==
IronPort-HdrOrdr: A9a23:0foDyakciddr3BmKn+S+dV9kt2XpDfN5iWdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcIi7SdS9qXO1z+8R3WBjB8bfYOCAghrmEGgC1/qv/9SEIUPDH4FmpN
 5dmsRFeb7N5B1B/LzHCWqDYpgdKbu8gdiVbI7lph8HJ2ALV0gj1XYDNu/yKDwveOAsP+tcKH
 Po3Lsgm9PWQwVxUi3UPAhmY8Hz4/nw0L72ax8PABAqrCOUiymz1bL8Gx+Emj8DTjJm294ZgC
 n4uj28wp/mn+Cwyxfa2WOWxY9RgsHdxtxKA9HJotQJKw/rlh2jaO1aKv2/VXEO0aKSAWQR4Z
 zxSiQbToBOArTqDyaISC7WqkvdOfAVmjnfIBGj8CLeSIfCNU0H4oJ69Pxkm13imhEdVZhHod
 J29niEuZRaFw7NkRL0+sXBXRBvmk2ol2Avi/QSiXtoUYZ2Us4hkaUPuExSC5sOByT89cQuF/
 RvFtjV4LJMfUqddG2xhBgl/DWAZAV7Iv69eDlLhiVV6UkjoFlpi08DgMAPlHYJ85wwD5FC+u
 TfK6xt0LVDVNUfY65xDPoIBZLfMB2BfTvcdGaJZVj3HqAOPHzA75bx/bUu/emvPJgF1oE7lp
 jNWE5R8WQyZ0XtA8uT24AjyGGGfEytGTD2js1O7ZlwvbPxALLtLC2YUVgr19Ctpv0Oa/erLc
 pb+KgmdMMLAVGea7qhhTeOKKW6AUNuJfEohg==
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="68067774"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LP1iD3IeeCmcPd/qUdY/mXgIrrEOYJCStbVfbbjIvv4Jm5IiHdJEZzEjOSuU9XGuDmWyXAyzc6kR/cRPBRxmpDPNpy3EvJ7QuezuwTPhiCloklXBjAHrCxdsjLcCdUJerC+M/KAddJokzxFtj6UaGp8n800j7q36y88neam28hpRAJCjZ2c4zCPEbxlaaBkwEEJINLLi/Cv4ch2qWD/hpWVJWCRrde7m+gul/pVw4fcL/HBftqh7a3q7ZsUThAOzOGazlHAJF81XKLErQw5sp03uOTj0/OHm5qHaxzV8wBode+huL1VbRr1tiV6O+/wv8mAPDA6xwArUMNS/YqaV8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPAv92jPuHB14ndvhEZ3S+svqIwXKnZgm+8ruqbnaOY=;
 b=X/h1Gg+NusAObW1coHPy8T/K0B18LAvp0l4837Qs3i8OBdAmJUN4cc6vtzjhOkPtPvQW+eyrrr6h8liyDLndNsdjzj+L8+lZ7axLH6DZLTEdAWcxP6RpAOrosgRgN836Mq6w31Ug0LchNprCXDzRCfN8coEDxJ/Y90mK4ZLKtQ4aSDlp2QelAZwbWZNQZzJ38oYj5iDdNrQ+UgBaxHol5w7bOrRFvSpg0gp/UQQCud9q68oQygrAVkxBy9bL9tAiuMxinbmMMsekIrNf8410xIJ02lUCuHL1M7J+421+ZF5zY3WH+ZfjUesHO4XkEC3F2VkG7/yxiuRuNIuEiym2UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPAv92jPuHB14ndvhEZ3S+svqIwXKnZgm+8ruqbnaOY=;
 b=lQrQNv+S9hy+QzbfwmuEMHQ9GFQe6g+WDd8PYQjvIToZPfMIjDRYHPrduuulGAGrbytUwjPbZFOwhwhZ1xGvAkHZPoirMSpHo1Kd9Si5hT7M5unoMCF66c8iCS1L92v/1TJ9KdwxmKLrSpLsJOz4Wrkp5P+QJHuAWjM2FIbvyYc=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Bjoern Doebel <doebel@amazon.de>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>, "Roger
 Pau Monne" <roger.pau@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH v3 2/2] xen/x86: Livepatch: support patching CET-enhanced
 functions
Thread-Topic: [PATCH v3 2/2] xen/x86: Livepatch: support patching CET-enhanced
 functions
Thread-Index: AQHYMteGyv4uMb9n4kauwbWKAS/6qKy1mRGg
Date: Tue, 8 Mar 2022 15:25:50 +0000
Message-ID: <PH0PR03MB63822464CF42ECDC06A3510BF0099@PH0PR03MB6382.namprd03.prod.outlook.com>
References: <453c6e5decb315109a4fbf0065cc364129dca195.1646735357.git.doebel@amazon.de>
 <b91fc474832dd0ce07d223542316fba74afc35ee.1646735357.git.doebel@amazon.de>
In-Reply-To: <b91fc474832dd0ce07d223542316fba74afc35ee.1646735357.git.doebel@amazon.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 9c74656d-553e-1bcc-9b84-b4b87c226532
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e509670-6b27-4863-eca4-08da0117ed93
x-ms-traffictypediagnostic: SA1PR03MB6593:EE_
x-microsoft-antispam-prvs: <SA1PR03MB65936945B83172180BF78C71F0099@SA1PR03MB6593.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PdL+DQCYKs7y+dJ6jLcrNaQw3299FS3e3LlR55U1g0iMdYH3DXkjWiSXp8IbBnBo5PC7AmrXQsshRMn46KvuvSy4e0POdZEhiJ1/MG3XTBHKFydJk8YWZCzWTYIPOJKeW1QtcfKpkETxRH2QCyTrTEBxOqdHNKcGhvwFnWXVOLTDYCMQnrT+9yJWoYi7Y4H8Z/d49paaR6IEUUXQ/h8L7rsCuSXTyw5ivzOcjQYkWtrF+Ali70BSqkC0AagJ9uB3yYUTNdt6HqX+K7TK5XlfVyNc7cVAklm0jIg6aYQFfWYcie7iFgs8jwQZ2Qtgll0KF5ZL+kzBVqgLijY1M1lkCZLG4/f31mO4RP21DBE3sCx/7Bbx7uPYoPiZVc4VGsLDCxyVldcmB6WgShww9ujYCtjnj5Azh71eD60ah3kJwR4JVmafdjdwyLtBIpzm23luYgTh30m/wxagKw7hq8frgrtSD6ozS1wTWe40oX9tEIiLKZJwr+EP38cidzdVGNY0RKW/Mfexkq/WB6J8zIxCqxQuWDDbpfD6SXxCwKQATwd0N6c+brnuPLyC49jbWS+8amJ19ElAAlecmTibBKCi4xvrtYSuoYT+Ov3P2mHtt1NKCujGehL3VV4m1305lxZMTRYGOZF2E4+x9cYWBpZoNZmo2Zs7fgIXhiPAGGZauigigNE10wkpTyNG7Otxoj3RDPggaPM/eiKXRP32yCH4fw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6382.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(26005)(9686003)(7696005)(316002)(54906003)(55016003)(186003)(83380400001)(6506007)(76116006)(38100700002)(91956017)(66476007)(4326008)(71200400001)(110136005)(8676002)(66446008)(66556008)(64756008)(66946007)(86362001)(2906002)(33656002)(38070700005)(82960400001)(8936002)(44832011)(52536014)(508600001)(5660300002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?eraTYdwHMLJppSmZZNlAnDILiWNWVZDZVvdrrGwYMjGlTFMmXLL5b9WECb?=
 =?iso-8859-1?Q?7UI3xWYlT3koIGBl8CWBpQ9ZMyviHU2Q8gBpeFGnPG39k6pJBPwYF+3O7l?=
 =?iso-8859-1?Q?xW6cFJtqFF58ikA/yf9eEAf7G0+2EsQatyTV9enj/s+Mg0narscAD2Ap8x?=
 =?iso-8859-1?Q?CYTWVYx3fdl/1LgFc3OS0t+BUrBIVl9mMraG9J0YxbaeinIUle5XwiawZK?=
 =?iso-8859-1?Q?aHQ8bFZe270nsg0yZzIwzyvLCsoUKFRD8E3Jb+sHg5VdiCdvoTZ5OfgCXK?=
 =?iso-8859-1?Q?/AxA+bchW19RV1lx65XP0gvX4om4guUUI5A8CkEkldiLkxzfIUE7SUQVuO?=
 =?iso-8859-1?Q?7EGYr3V2ipEY5V2oewmUcZhi/OSZCYyGcewrcjpYoiL1cCxVp5YnnJBI7F?=
 =?iso-8859-1?Q?Ik9BZkg3MouAC15iB8fRgkT7DO73oBCevpVabrOiQUXkEyfwd4rgJgYe9m?=
 =?iso-8859-1?Q?deubjCFEoMhI42GGgo2t7yk99sLbj/WSmgLDvZCid1D86c/qOzh3wEnYN6?=
 =?iso-8859-1?Q?YvlUgTP63nUyHNjPx6+6JKh4FQ22bIIswNDgv0wkZMfKarLzF+G3zfdcpI?=
 =?iso-8859-1?Q?Fhdd8eoXmJN8VSXGt8WD9oum8gFtsYJZlA0oUQdJitAr6wQ/Ox3q3m5nBc?=
 =?iso-8859-1?Q?+j+xVR6mxrPR+A2KonVOkaAddVD8dXhquDd97EamvpH7Yf0t9hTMNKvZnG?=
 =?iso-8859-1?Q?GHqlr6ZP2Nw4rHQWLdY1jVoGWDKUUMYVE3W70ig4e4OAKYZltNXZzbWXmx?=
 =?iso-8859-1?Q?NRKL3+sXHg/Q2HFOnVBM9CX56tKdidMXKWPtXWS8ngLAZo3yNbyYcCipr8?=
 =?iso-8859-1?Q?epJGEhE4ywYoheMSt+sAm4FDmZGJSQyytR4KjLgVdyuK3eFGgAkuFnzyk+?=
 =?iso-8859-1?Q?0+D5H48XJF1a9EMPDvYhYVAz5s8JbG+CFhIbFWC5gkWXtuJJ7GsNF3HiU/?=
 =?iso-8859-1?Q?v24ywRsrNO0DdoMj6tFtL30BneooSsQgJJc2ADUERf3/84pzM2nPHzktWg?=
 =?iso-8859-1?Q?SEijs+SAeVZXeS4vTZL7EWxRg3zQz62zKBaxQrh18zjoIS2MageNVx3wq9?=
 =?iso-8859-1?Q?v5atCHB/XeRYIL9zf/7aTHOeH5NJMpErpUHZrQ9PyW05o/0hJMI611ECre?=
 =?iso-8859-1?Q?px6OPbq+/t+X04BijehHRrTsZcKXyiz0pCcHyHQpMvDeIaFGDRS94Wcrqy?=
 =?iso-8859-1?Q?0inCkhAtPx6aulo1kWHclMGVoiN2twOiKH1MkK+d3vy/6Bo2ULrBzLNI11?=
 =?iso-8859-1?Q?/E7Ed0cqIEjjgkObNH69WMbPdoM3xXbGUkeTZjXNSzfJkHo1g/MtpBm2jl?=
 =?iso-8859-1?Q?Nub3yCAkTErdYhb7qyVH3ECZzbQR+5B91pBcaiI3iCDn6x1EcLw6cwt+5u?=
 =?iso-8859-1?Q?DJUyb+JxA6Et+Nwy92HFmrtxVXqmy1PvBK4byftqi4KuaJXbyaax+Fh+Uv?=
 =?iso-8859-1?Q?+mXx5QjO76eztRAytTPQMBgaYWBaATfXklsxSSdNaDscWoaE+CyMuNmjZv?=
 =?iso-8859-1?Q?xHAvwrJUdTjLJOnaeg2lhPx653S9v47fCEEJ0D0vkkM1Vj1F0gBrasEVop?=
 =?iso-8859-1?Q?4Ta31PtlaPkUWeYbD6zevorkeXrUO/iyNe1bVsmoEhNQWzs0DNuxuTLY7s?=
 =?iso-8859-1?Q?wQVteV0Z74VOm1wugya6St1PUQ4NWrFW7o3dsiyib5Pvsj4n/BbjObQoPM?=
 =?iso-8859-1?Q?CL74ofsmz7gaF3CIEdHWT0NTXSsQkGabpGVL/FENMYM1rezWuuhM6TofVm?=
 =?iso-8859-1?Q?U7eA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6382.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e509670-6b27-4863-eca4-08da0117ed93
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 15:25:50.7491
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: koZCckeXD+T0BhCLwuTByFHae+Je+Y8tiafoN3Wp1Z0XjV2BP3cupyXjoezIzMjtWdYrRz63X0mpy7hRzVQfbmwh0ARNr18YEPiwUIxkoQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6593
X-OriginatorOrg: citrix.com

> From: Bjoern Doebel <doebel@amazon.de>=0A=
> Sent: Tuesday, March 8, 2022 10:29 AM=0A=
> To: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>=0A=
> Cc: Michael Kurth <mku@amazon.de>; Martin Pohlack <mpohlack@amazon.de>; R=
oger Pau Monne <roger.pau@citrix.com>; Andrew Cooper <Andrew.Cooper3@citrix=
.com>; Bjoern Doebel <doebel@amazon.de>; Konrad Rzeszutek Wilk <konrad.wilk=
@oracle.com>; Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> Subject: [PATCH v3 2/2] xen/x86: Livepatch: support patching CET-enhanced=
 functions =0A=
>  =0A=
> Xen enabled CET for supporting architectures. The control flow aspect of=
=0A=
> CET expects functions that can be called indirectly (i.e., via function=
=0A=
> pointers) to start with an ENDBR64 instruction. Otherwise a control flow=
=0A=
> exception is raised.=0A=
> =0A=
> This expectation breaks livepatching flows because we patch functions by=
=0A=
> overwriting their first 5 bytes with a JMP + <offset>, thus breaking the=
=0A=
> ENDBR64. We fix this by checking the start of a patched function for=0A=
> being ENDBR64. In the positive case we move the livepatch JMP to start=0A=
> behind the ENDBR64 instruction.=0A=
> =0A=
> To avoid having to guess the ENDBR64 offset again on patch reversal=0A=
> (which might race with other mechanisms adding/removing ENDBR=0A=
> dynamically), use the livepatch metadata to store the computed offset=0A=
> along with the saved bytes of the overwritten function.=0A=
> =0A=
> Signed-off-by: Bjoern Doebel <doebel@amazon.de>=0A=
> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>=0A=
> CC: Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> ----=0A=
> Note that on top of livepatching functions, Xen supports an additional=0A=
> mode where we can "remove" a function by overwriting it with NOPs. This=
=0A=
> is only supported for functions up to 31 bytes in size and this patch=0A=
> reduces this limit to 30 bytes.=0A=
> =0A=
> Changes since r1:=0A=
> * use sizeof_field() to avoid unused variable warning=0A=
> * make metadata variable const in arch_livepatch_revert=0A=
> ---=0A=
>  xen/arch/x86/livepatch.c | 61 ++++++++++++++++++++++++++++++++++------=
=0A=
>  1 file changed, 53 insertions(+), 8 deletions(-)=0A=
> =0A=
> diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c=0A=
> index 65530c1e57..0fd97f2a00 100644=0A=
> --- a/xen/arch/x86/livepatch.c=0A=
> +++ b/xen/arch/x86/livepatch.c=0A=
> @@ -14,11 +14,29 @@=0A=
>  #include <xen/vm_event.h>=0A=
>  #include <xen/virtual_region.h>=0A=
>  =0A=
> +#include <asm/endbr.h>=0A=
>  #include <asm/fixmap.h>=0A=
>  #include <asm/nmi.h>=0A=
>  #include <asm/livepatch.h>=0A=
>  #include <asm/setup.h>=0A=
>  =0A=
> +/*=0A=
> + * CET hotpatching support: We may have functions starting with an ENDBR=
64=0A=
> + * instruction that MUST remain the first instruction of the function, h=
ence=0A=
> + * we need to move any hotpatch trampoline further into the function. Fo=
r that=0A=
> + * we need to keep track of the patching offset used for any loaded hotp=
atch=0A=
> + * (to avoid racing against other fixups adding/removing ENDBR64 or simi=
lar=0A=
> + * instructions).=0A=
> + *=0A=
> + * We do so by making use of the existing opaque metadata area. We use i=
ts=0A=
> + * first 4 bytes to track the offset into the function used for patching=
 and=0A=
> + * the remainder of the data to store overwritten code bytes.=0A=
> + */=0A=
> +struct x86_livepatch_meta {=0A=
> +    uint8_t patch_offset;=0A=
> +    uint8_t instruction[LIVEPATCH_OPAQUE_SIZE - sizeof(uint8_t)];=0A=
> +};=0A=
> +=0A=
=0A=
I think it would make things a bit simpler to use one of the spare _pad bit=
s=0A=
from struct livepatch_func  ather than hacking it into the opaque area. Is=
=0A=
there a reason you chose this approach?=

