Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF13687FA6
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 15:13:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488823.757079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNaKK-0007YD-C3; Thu, 02 Feb 2023 14:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488823.757079; Thu, 02 Feb 2023 14:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNaKK-0007Vz-8U; Thu, 02 Feb 2023 14:12:36 +0000
Received: by outflank-mailman (input) for mailman id 488823;
 Thu, 02 Feb 2023 14:12:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LChx=56=citrix.com=prvs=3900541de=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pNaKI-0007Vt-5A
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 14:12:34 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a07ad59c-a303-11ed-933c-83870f6b2ba8;
 Thu, 02 Feb 2023 15:12:31 +0100 (CET)
Received: from mail-mw2nam12lp2046.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Feb 2023 09:12:20 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5508.namprd03.prod.outlook.com (2603:10b6:208:290::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Thu, 2 Feb
 2023 14:12:18 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6043.038; Thu, 2 Feb 2023
 14:12:18 +0000
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
X-Inumbo-ID: a07ad59c-a303-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675347151;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=AkG9rxP+ZEPqw2Hizx4kttgs4IHxAxKaJs4Zx50f7qI=;
  b=SlZuARRBBBi0anQNKW+ynuKQrb/i6diNAMwoVxnE4rjE59nTKmV3hkwj
   S1tFKOGwOsjRRlfi245wqWkHnA88/dB/9pXWR1+PHvqtP65EX2b6poRom
   z59TpXtipEKPy5AjgShTlDdQOjHGliVve5jcQHazzFhR+cg6vwRn706wl
   Q=;
X-IronPort-RemoteIP: 104.47.66.46
X-IronPort-MID: 94798497
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2e6cl6ppyNNP6+labo8406qDGiVeBmKzZBIvgKrLsJaIsI4StFCzt
 garIBnXM/2KMWrzLoxwb4q+8x9Q65bXxtA1TFA+qH01QX4R8ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weEzyNNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADxKSDCmv/Pp+byATM9JvN8CfePxO7pK7xmMzRmBZRonabbqZvyQoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3juarbIS9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOzkqa863AzMroAVIB1OUFeiqtSothH9QdBWJ
 HI/2gUV6rdnoSRHSfG4BXVUukWsugMXUpxeGusx5QWJ14Ld+QPfDW8BJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaESIYN3MYbCkICw4M+cD+oZobhwjKCN1kFcadkdD0Xzrwz
 jaipTI7wb4UiKYjzaKg90rAhDGqjpfMRw8xoA7QWwqN8QdRdIOjIYuy5jDz7/laK52CZkKcp
 3VCkM+bhMgCBI+AvDaAS+IMGPeu/fntGDjVm1tmBZQi3zWr5X+4fIpU7S1+JUFmKcINc3niZ
 0q7hO9KzJpaPX/vaLAtZYu0Up4u1fK4SYqjUe3IZN1TZJQ3bBWA4CxleU+X2SbqjVQolqY8f
 5ycdK5AEEonNEiu9xLuL8917FPh7ntWKb/7LXwj8yma7A==
IronPort-HdrOrdr: A9a23:RUesVKzxZlZ7umaXswzlKrPxAugkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMUs1MSZLXPbUQyTXc5fBOrZsnDd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadv/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2jnC6l87nzFjmfx1M7XylUybkv3G
 DZm0ihj5/T882T+1v57Sv+/p5WkNzuxp9qA9GNsNEcLnHBmxulf4NoXpyFpXQQrPu04Fgnvd
 HQq1MLPth16VnWYmapyCGdmjXI4XIL0TvP2FWYiXzsrYjSXzQhEfdMgopfb1/w91cglMsU6t
 MI40up875sST/QliX04NbFEztwkFCvnHYkmekPy1RCTIolbqNLp4B3xjIRLH5AJlO/1GkUKp
 gpMCju3ocOTbpcVQGAgoBb+q3qYp30JGbcfqFNgL3O79EcpgEF86JR/r1iop5HzuN/d3AM3Z
 W7Dkwj/os+MfM+fOZzAvwMTtCwDXGISRXQMHiKKVCiD60fPWnRwqSHqIndS9vaCqDg4aFC7q
 gpamko/FIaagbrE4mDzZdL+hfCTCG0Wins0NhX49x8tqfnTLTmPCWfQBR2+vHQ6ck3E4neQb
 K+KZhWC/jsIS/nHptIxRT3X91XJWMFWMMYt94nUxaFo97NKIftquvHGcyjb4bFAHIhQCfyE3
 EDVD/8KIFJ6V2qQGbxhFzLV3bkaiXEjOVN+WjhjpwuIaQ2R/5xW1Iu+CWED+mwWE1/m71zel
 diK7X6la7+rXWq/A/znhBUBiY=
X-IronPort-AV: E=Sophos;i="5.97,267,1669093200"; 
   d="scan'208";a="94798497"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MysIp9coAib2aXdssfLSqvjZjWrYZbZMtfl0drh5yPB93+Ftrg0e/6FOSr5mIYsjvVDJ3QsjYGmCnDSRXYPfFNtEByjEq+2e+JbSjn2PhUG9X47GKOuX53gNfe9BQMkCjszFpzRqF8OJCoJLvpz9J8ulU/cSsioyrwg/CrZ7+YEAM6Ud7XY3dBlMmQrQ1doZHdLAly7vlDmjOymWJmHPTkUNGe2mRS36KbbwkmQhw+KfsQR2RQljp8s/DSDrY9dHdV3sZJ0k1eL+RrRudnNh0IsIh41GImNWfgkJLgLp3xhj9OeDXl41SgH1JxK35mce8k/Z73ZjZmYVQimvCUMC5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AkG9rxP+ZEPqw2Hizx4kttgs4IHxAxKaJs4Zx50f7qI=;
 b=N65czH0t7Dq1KBjKh5ALdNdSJv21bNzJ5zw3DOzcxxbICs/EczOzW8A8kGoivZ6gD6JKn7W9CqeHP7aU/k3XZDgxjWKEVXkSUXYJChmuipp6ouQa2K/Sonlc0HaZenCNooCBj8K3QnrxUK2GWhbx0DDXWeL0nA25Un4Pzytk5+2FZrhHYYWWMcz3UIAMmFlZp0drMG/Cn1JDurgvHczFH/c8pvDk4QJ3Y3uHG3KSyYY0qiixvFA6/vunxy6YkZwatvp86QTpNWZbWaLc0xyxvLaqtHW9hO9lvuQ6kyjP/z4GbzRJRc0YBGsnG1PR8eHFfdoZNCwuyJq4tBKhSUzhcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkG9rxP+ZEPqw2Hizx4kttgs4IHxAxKaJs4Zx50f7qI=;
 b=SS53snOklmRvrH9XTQebFoBYKKV0bqyFWSWUjtl3hTNlOFZrirppfVHo1Fd29qrcHCxfibaRnO/frqPlhkywuWATrxjyVtlkV2evb6r8vWu4G+MNI3pd+NCWhi0KKD2DV7SOIMgGzkI+E6v0V9Rv+oaTnpvPYMiw/mpIxPrS/Bw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Luca Fancellu <luca.fancellu@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, "wei.chen@arm.com"
	<wei.chen@arm.com>, George Dunlap <George.Dunlap@citrix.com>, Nick Rosbrook
	<rosbrookn@gmail.com>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 08/10] tools: add SVE capability and SVE vector length for
 physinfo
Thread-Topic: [PATCH 08/10] tools: add SVE capability and SVE vector length
 for physinfo
Thread-Index: AQHZNvbB4qIHmh0j0EaFJcqzBgELUa67ssiA
Date: Thu, 2 Feb 2023 14:12:18 +0000
Message-ID: <47f742d1-de3e-f1c1-5139-de37353545ea@citrix.com>
References: <20230202110816.1252419-1-luca.fancellu@arm.com>
 <20230202110816.1252419-9-luca.fancellu@arm.com>
In-Reply-To: <20230202110816.1252419-9-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BLAPR03MB5508:EE_
x-ms-office365-filtering-correlation-id: 542241c5-a095-4062-3321-08db05277e52
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 l+NqtCdmqen1jjelunJv+4w5iH2WHszvZ42DWWSfc7g0f9GB3rnM/Tyv2JkJvnyKYx1ee1eZoWuVeo6OS8aR+6XoaBPByhNiT3nJN6/ktVvqurbht0PuQACT95yLvza3xSPKtk96o4yanOW9Y/QATrkebyBBjH7acZbHU6UiBxOWqAeVy+NSc6bu1yVWXgzVo8J0eo9VV5pmll+ZP1X5UdvaLbMPfSPwo/2QB8cnf/YmXQRLEl8hEdN3FxIxiX/Thvhy4z2lr1xQqxLTG85iM/WbHfRPku151t/fYC7QgliHdKEJx46BZF9qEL8ERSbKytQHtmUQZWZFUMWcSVkhPYXi7zZo8OMCkW8eCP57uXwCEx6yl7ilwbMEdi9A8+B6wSBuFxPjMZgdcVouUyU7fK4vIQmHc7LxCst/VNjspxa5loYpgSY5E+fi6fTLf5GDusd8u/3Z1vCRR1tdeljC4LEn4+vR4qLzWgls2ieTRQ2/wcAkt8joFCqbEFSSyWWpcMiOCwtcl1WxmBrv+ciTMhIxIfrvwubj1F+rrtKbGAC9oEhtKsu6/trg2G6UdNPo093pBTTZ/+/9Mthpuy+o3paPiu7S03iO2CGeWc1EWF+8/8Qd+0do89lotTCOZEXxlEsTl/HAOLMtX5atL+BsScZ+b3BSMuPPahY4G7/Ddz3qxhLRodD/6jbMqlJrR6zH7cnEtIiPZzgD6/lK5M89umUwYv0SGanR++IA1ia64xr9eg4wlFemkfkmDwkGkLP10pPyxn21Rhsx2Z5oAOgtTg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(451199018)(82960400001)(38070700005)(38100700002)(122000001)(71200400001)(66446008)(66476007)(66946007)(66556008)(91956017)(4326008)(76116006)(41300700001)(64756008)(8936002)(31686004)(31696002)(86362001)(83380400001)(2616005)(186003)(6486002)(478600001)(36756003)(316002)(8676002)(110136005)(54906003)(6512007)(26005)(53546011)(6506007)(5660300002)(2906002)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZTRva29QWE43bXVQcVJQRUFwS2lyM09STDRLaXlLY3UrWFJIWDJmK2ZzNWo4?=
 =?utf-8?B?SHJSNkdyNWY1THIyZE5QRVFiV0Z1RzBYZDI1UE5uTE1xdzFXN0hUK3ZGRi9t?=
 =?utf-8?B?MklEcFRQaExtaUowa0ZuUk5Zam0wTWlHRHJIZzBaYXc4aEVDZVB5d0k5d2kz?=
 =?utf-8?B?OTJ5aWw5alpRVTA0dmtqbjZPUzhKQ3Mrc3VGNlNjYXBKRko2Tzd3bitSOHkw?=
 =?utf-8?B?MFYvSlpXZ1p2Tk00L1I4UElmSEpnVUszblE1ejJWUTlvUFhROXZGbHRBYmpI?=
 =?utf-8?B?Sk92RCtxZ3NuSkg1a203N25KeEpibm54THRrZnQxTmZLSTFkbUlQUkhMZzRn?=
 =?utf-8?B?NVY4NUxLRFNUWEtjVHpLVDU1R0tVSi9pNHNIZ1NhVDFnYjVDYlQzQm9JekJT?=
 =?utf-8?B?YVpEVEZoNjNFRmRCRjNYNDFHdmc5d1lXM3VsVm4xSE9BbnJYRzdWL2duV204?=
 =?utf-8?B?aHpmMDZxV01xbUJWOWd6elZXZXBLYkFuZ0ZKdW5pL3pLNW13cDA1SlVCekVG?=
 =?utf-8?B?STVzZFJJTkxkWFU4U0hONlAxQWNSZUs4aVNWRDA0eHJ4c2FMUllBRHFKTmJO?=
 =?utf-8?B?YTdnbWhYRkJXbFZ0dmJ3eDdkS0VKYlB4empqaExmTVM0VzdjSjdWWnZSQm1Q?=
 =?utf-8?B?SjVmYkl5aVV3ZEVEUkhqNjVKTzExOWFaOHh5ZFhwdVFhNTA5d3hCczc2eHFx?=
 =?utf-8?B?cisyNE9wWjF2MHZJLzlqTWFDR1EzYzVPMFhqWTk5SWY5dzRNLzhRd2RoS3gv?=
 =?utf-8?B?MkJIb2YvbXFlbUNRejN4OGZBcDJkTDNoWmV0TzM0MDM4RWxYdUF3QlVTeWdD?=
 =?utf-8?B?bFRBMklkSXFGNW1ZTWl4ek1OK3duSlZacHNxZ0MvL3c2eVJmcGZsTlk4NjZX?=
 =?utf-8?B?VjhwQndTTFA1MjVvUkNWSWJEN3F5L081MlhEY3ZRTk1GcWczZXQ0b0k1T3Az?=
 =?utf-8?B?a0x0M1U0d3duZENXWllPN3poVVVJSC9qaWhNK3JJdU9xQmVkTzJDc2FGWXdz?=
 =?utf-8?B?a29GYU8rYmJZcGVhaFd5V0NlZ0VxcTdMbk1tOFJWVE14czZqdGF6V1IyMVpN?=
 =?utf-8?B?b096MEIxNzlrV25xOHZuUWtudFhPQkJiaVJtT0tFUDFUdXZlR01qV3Bqa0NS?=
 =?utf-8?B?UzlYc256VUhZNGNsWWcxckI4UkNWRFRzUUhGTzFjY3RsT3JWTkNER1pTd1Bu?=
 =?utf-8?B?MjRhOTBENERYMHhhdGtCdjlOMVM2S3ZCT0xOU0Y4cnA2dWNiK2x2Y2JUdG53?=
 =?utf-8?B?YkpxejcySlNYMjlRQy9VUzd5S1h0UGl6K3FtZlJSaFF3ZUUwdUNjQ1VJaCsz?=
 =?utf-8?B?aUowK1BhcVlmeFZzdGoxQ3Nzc1FsQlpoUlBacjJjcno0UllTQVp5OFZhN3BO?=
 =?utf-8?B?MmpHdkpWMW1lYlBLRUFCZFBZc0d3dCtLb0lITlNndzlSQjd1dkltNUZPTVpo?=
 =?utf-8?B?OTdJV1VvNEl6WnlvUFBLQndncVBTMTg0WU0zak01TDZsZ3hwMTMwdUltNEY1?=
 =?utf-8?B?MFB3K0J3dmpkT2o3Q1NFcDllczd0SXVLVmQ0dDRCc2lkUlgyVEpoMm1HVFdH?=
 =?utf-8?B?Nnp0bzlyMzNRTDZpeVlRVnpsakpKWjNxbmVYbWVhRDMweWd3enlyQkltT1dO?=
 =?utf-8?B?YkhhUzUyWXNBbDltZk85bUg2NVlZUVhOOUlramFtR2VZS1M2eG1Ua0MxWDht?=
 =?utf-8?B?SlluMURUaTJTbmJsUDVtbWg5NkJSV2tXZEdwQUR1R1pseDFlWVFlMUJacE9t?=
 =?utf-8?B?YTQwUXBSWEFhUWliYWJtUi9VcUd0RXZxQjhCaDFKUWRDelU0Nnh3dVh6ZmVn?=
 =?utf-8?B?TnhGbGsvbnl3b1B1SG5XWnBWcHJzSVdGeVdDa2xGTC9yN3M1UWVsYVA3TCth?=
 =?utf-8?B?TE45N1VyY2pxUzhrWHVGWlV6bGxaRjZzTlQwTzRTZ3lUUFdhb0RTYTRNRldL?=
 =?utf-8?B?cDB6R0J4Q3QzcTN5MVRHcDltZGlhSVNZU0syLzFzTGdNTnd1eWZzMVU2NUNt?=
 =?utf-8?B?ekVOMVI5SUpqVWtwcEJsNHRhU21OKzh1QjArRXVSOC9GZmhTMVRIYWZTY21s?=
 =?utf-8?B?enhEU0pnZXlwOE4zQk1uZlFjVlYyRkNmNnl6Q1pyWWhCUnJkVmp1TTFkM2Vj?=
 =?utf-8?Q?GzQ+BkZEE8ZayoCB7H/iBhetw?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D91943D4D432CD4387152F2759D18DFD@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?Z2pPY0NvN0o2TGpQZVE3M0wvaG1FcXFmNXpGSS83ajUvUGNYckJiZUdHdm1K?=
 =?utf-8?B?TEZFemk0WUVJT1BVY1d4UEFxUVBocmhCNnZnUWJaVkZWbmI1WDRWZG5Jb2hm?=
 =?utf-8?B?dVVsT05VWW5TNGR1a1lVVUIzNWprREd3WGUzYTJhTWlhUGtDMDY1RzlWSCtk?=
 =?utf-8?B?bitGbzVGczdDSlZ5NVIrVDFDRkNRbkN1SkU0ZWZ5QUtMU0o4Mjg5dm1sektI?=
 =?utf-8?B?elcxamZLTmxjVzQwUU52QXlWWVpndkJISldpVXBwdnhpQ1lxbUQrTnRBcFJr?=
 =?utf-8?B?aHk2a284WktpY2lpMnBiZ1dBQ0YraUo0R05JMHpUWldxTy8vUzB5eUoyRVpR?=
 =?utf-8?B?M0pqb0FvY2NhZnVHUTBrT01UOWxEa1FBRDA3SWdQYSt6alR0RUlNa3RCYUl0?=
 =?utf-8?B?RDVlY3U1QnovYVFoMVBEd1YwczNISkkxTm9SS3VWRE52SEg0RWMwZ1JXaHJR?=
 =?utf-8?B?NlRZVVdPdm1mUVNGbjRXNjdXZU1uazl2YzUwVkNhWTFkbWtJdTFTa0FLWEtU?=
 =?utf-8?B?U3paU0xoNi9INmpHMXNTNENyOW5FMk9IRWEvMnhNTzVFdCsxVFpDN1NPbU4x?=
 =?utf-8?B?L0VTY0w4NkNsVUZqRi9yOTArRUhXOGY3UzIwT1ZGblM3ZDRKVGs3NTJUZXNF?=
 =?utf-8?B?ZmpSYlVZZ2srRWJIR0hNK0h0WUFPYldEYkpibERmMHM3ZXBvSTc0KzZDcWIz?=
 =?utf-8?B?QjF0T0xYVGN2eEdyN21jNmZieUQ3VHFFZHlxZkFXZkhwYWp0eHVIazdDZVFP?=
 =?utf-8?B?S3RTc0JDc2wzOStYaCtFYjZ3cG93TVkvZ3VxeFdnUW1hWlpwS2JDWVNBQklu?=
 =?utf-8?B?Ym5JVlBWRGV4K2ovcU8rdC9GUkpIbThwUHNESkFXMDI4Q3R5bm4zYkprK1U5?=
 =?utf-8?B?c2d3eDM3RGpyNnE4M2orbmNQaWlHMXk2MVdzNERDMzBaVjJ0UXBXelhjZUha?=
 =?utf-8?B?MEswSFlOYWlKck9yekpJMGtkRmhLR3NSWHd0dTc5UDNxMFVNV1daUkY4cFVn?=
 =?utf-8?B?czJha2pxd0Zyb1dqMnZGRU1BTWIrd1RQWERRZ244TzAwWEU1cGloNCttUUtQ?=
 =?utf-8?B?VzA2aENWeFdSNWNabVQ2bndVTURVakZxMWhCcTU5eTg2Zmp6K1NvZmxzQVNx?=
 =?utf-8?B?T0xMSUdROUtMcTYrdGVuT0ZkcENyRmhEdmUxRk9hRHhJeXA3N2xxQWhMckdX?=
 =?utf-8?B?LzAyTVFyWjZsU1BDLzNXajI4dndyUzJORkVSOWt3bmc1Ny9BeG9aM2p5SjFE?=
 =?utf-8?B?UlFLcXNIYUIycmtqbzNnM01nU0k4TXIrbjVEcDlDZGJtQllKUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 542241c5-a095-4062-3321-08db05277e52
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2023 14:12:18.3768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tJvZzJt6DHBoxqOpRkmPeE/Equn6oiRFet8pDoG9b6lsUVcQvh2ulmCoDwXgOrNG8KTWZ38eVbsxcmw/M6f5GFSiIQh3k0WwWdMK1dLLeVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5508

T24gMDIvMDIvMjAyMyAxMTowOCBhbSwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4gUmVjZW50IGNo
YW5nZXMgYWRkZWQgaW4gc3RydWN0IHhlbl9zeXNjdGxfcGh5c2luZm8gYSBuZXcgZmxhZyBmb3IN
Cj4gYXJjaF9jYXBhYmlsaXRpZXMgdG8gdW5kZXJzdGFuZCB3aGVuIHRoZSBwbGF0Zm9ybSBpcyBT
VkUgY2FwYWJsZSwNCj4gYW5vdGhlciBmaWVsZCBoYXZpbmcgdGhlIG1heGltdW0gU1ZFIHZlY3Rv
ciBsZW5ndGggaW4gYml0cyB3YXMNCj4gYWRkZWQgYXMgd2VsbCwgc28gdXBkYXRlIHRoZSB0b29s
cyB0byBoYW5kbGUgdGhlc2UgbmV3IGZpZWxkcy4NCj4NCj4gU2lnbmVkLW9mZi1ieTogTHVjYSBG
YW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KPiAtLS0NCj4gQ2hhbmdlcyBmcm9tIFJG
QzoNCj4gIC0gbmV3IHBhdGNoDQo+IC0tLQ0KPiBUaGlzIHBhdGNoIGlzIG1vc3RseSBkZXBlbmRl
bnQgb24gdGhlIGRlY2lzaW9ucyB3ZSBtYWtlIGluIHRoZSBwcmV2aW91cywgYW55d2F5DQo+IEkg
dG91Y2hlZCBzb21lIHBhcnQgb2YgdGhlIHRvb2xzdGFjayB3aGVyZSBteSBrbm93bGVkZ2UgaXMg
bGltaXRlZCAob2NhbWwpIHNvDQo+IEkgbWlnaHQgbmVlZCBhIGZlZWRiYWNrIGZvciBzb21ldGhp
bmcgSSBtYXkgaGF2ZSBkb25lIHdyb25nLg0KDQpUaGVyZSdzIGEgbG90IG9mIGlmZGVmYXJ5IGhl
cmUgd2hpY2ggaXMgZ29pbmcgdG8gbWFrZSB0aGUgY29kZQ0KaW1wb3NzaWJsZSB0byBtYWludGFp
biwgZXNwZWNpYWxseSBpbiBweXRob24gYW5kIHhsIHdoZXJlIHlvdSdyZSBwbGF5aW5nDQpnYW1l
cyB3aXRoIHRoZSBwb3NpdGlvbiBvZiB0aGUgY29tbWEuDQoNCkJ1dCB0YWtpbmcgYSBzdGVwIGJh
Y2suwqAgRmlyc3QsIHNwbGl0IHRoaXMgc2VyaWVzIGludG8gdHdvIChldmVuIGlmIGl0J3MNCmZp
cnN0IGhhbGYgLyBzZWNvbmQgaGFsZiBvZiBhIHNpbmdsZSBzZXJpZXMgdGhhdCB5b3UgZW1haWwg
b3V0KS7CoCBIb3cgdG8NCnJlcG9ydCB0aGUgcHJlc2VuY2Ugb2YgYSBjYXBhYmlsaXR5IGlzIGRp
ZmZlcmVudCBmcm9tIGhvdyB0byBjb25maWd1cmUNCnRoZSBjYXBhYmlsaXR5IGZvciBhIGd1ZXN0
LCBhbmQgc2hvdWxkIGJlIGRvbmUgc2VwYXJhdGVseS4NCg0KQnV0IGV2ZW4gc3RpbGwuwqAgU1ZF
IGlzIGEgc2luZ2xlIGJpdCBmZWF0dXJlLsKgIHBoeXNpbmZvIGlzIHRoZSB3cm9uZw0KcGxhY2Ug
dG8gcmVwb3J0IGl0LCBhbmQgSSBkb250IHNlZSBhbnkgbmVlZCBmb3IgaXQgdG8gYmUgaW4gdGhl
IGRvbWFpbg0KY29uc3RydWN0aW9uIGh5cGVyY2FsbC7CoCBCb3RoIGFyZSBjcml0aWNhbGx5IHNw
YWNlLWxpbWl0ZWQgc3RydWN0dXJlcy4NCg0KQVJNIG5lZWRzIHRvIGdhaW4gc29tZXRoaW5nIHNp
bWlsYXIgdG8geDg2J3MgY3B1IHBvbGljeSBhcmNoaXRlY3R1cmUsDQpib3RoIGluIHRlcm1zIG9m
IHN5c2N0bHMgcmVwb3J0aW5nIHN5c3RlbSBjYXBhYmlsaXRpZXMsIGFuZCBkb21jdGxzIHRvDQpn
ZXQvc2V0IGRvbWFpbiBjb25maWd1cmF0aW9uLg0KDQpMb29raW5nIGF0IHlvdXIgY292ZXIgbGV0
dGVyLCBTVkUgKGluIHRlcm1zIG9mIHdoYXQgaXQgbWVhbnMgZm9yIFhlbikNCmxvb2tzIHF1aXRl
IHNpbWlsYXIgdG8geDg2J3MgQU1YIGFuZCBBcmNoLUxCUiBpbnNvZmFyIGFzIGl0J3MgYSBsYXJn
ZQ0KYW1vdW50IG9mIG5ldyByZWdpc3RlciBzdGF0ZSB0aGF0IHdlIGRvbid0IHdhbnQgdG8gYWxs
b2NhdGUgZm9yIGd1ZXN0cw0Kbm90IG1ha2luZyB1c2Ugb2YgaXQuDQoNCk9uIHg4Niwgd2hhdCB3
ZSdyZSBwbGFubmluZyB0byBkbyAoSXQncyBub3QgZG9uZSB5ZXQsIGJlY2F1c2UgSSBrZWVwIG9u
DQpnZXR0aW5nIHByZWVtcHRlZCB3aXRoIHNlY3VyaXR5IHdvcmspIGlzIHRvIHJlcXVpcmUgdGhl
IHRvb2xzdGFjayB0bw0KbWFrZSBhIHNldF9jcHVfcG9saWN5IGh5cGVyY2FsbCBiZXR3ZWVuIGNy
ZWF0ZWRvbWFpbiBhbmQgbWF4Y3B1cyB0bw0KY29uZmlndXJlIHRoZSBzaXplIG9mIFhTQVZFIHN0
YXRlLCBhZnRlciB3aGljaCB2Y3B1X2NyZWF0ZSgpIGluIHRoZQ0KaHlwZXJ2aXNvciBoYXMgdGhl
IGluZm8gaXQgbmVlZHMgdG8gY29uc3RydWN0IGJhY2tpbmcgc3RhdGUgY29ycmVjdGx5Lg0KDQoN
Ckkga25vdyBJJ20gdGVsbGluZyB5b3UgdG8gZG8gYSBsb3Qgb2Ygd29yaywgYnV0IGJvZGdpbmcg
U1ZFIGluIGxpa2UgdGhpcw0KaXNuJ3Qgb2suwqAgU29tZW9uZSAqaXMqIGdvaW5nIHRvIGhhdmUg
dG8gZG8gcHJvcGVyIGZlYXR1cmUgY29uZmlndXJhdGlvbg0Kb24gQVJNLCBhbmQgSSBndWFyYW50
ZWUgeW91IHRoYXQgaXQgd2lsbCBiZSBsZXNzIGVmZm9ydCB0byBkbyBpdA0KcHJvcGVybHkgbm93
LCB0aGFuIHRvIHJldHJvZml0IGl0IGluIHRoZSBmdXR1cmUuwqAgeDg2IGhhcyBiZWVuIGENCm5p
Z2h0bWFyZSB0byB1bnRhbmdsZSAxNSB5ZWFycyBvZiBiYWQgaW50ZXJmYWNlIGRlc2lnbiBpbiBh
IHdheSB0aGF0DQpkb2Vzbid0IHJlZ3Jlc3MgYmVoYXZpb3VyLg0KDQp+QW5kcmV3DQo=

