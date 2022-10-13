Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B08A5FD71D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 11:33:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421799.667433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiuaD-00067b-Hn; Thu, 13 Oct 2022 09:32:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421799.667433; Thu, 13 Oct 2022 09:32:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiuaD-00065o-En; Thu, 13 Oct 2022 09:32:53 +0000
Received: by outflank-mailman (input) for mailman id 421799;
 Thu, 13 Oct 2022 09:32:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xhTA=2O=citrix.com=prvs=278783dfc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oiuaC-00065i-68
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 09:32:52 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 009e3379-4ada-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 11:32:50 +0200 (CEST)
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Oct 2022 05:32:26 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5822.namprd03.prod.outlook.com (2603:10b6:a03:2ae::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 09:32:25 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 09:32:24 +0000
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
X-Inumbo-ID: 009e3379-4ada-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665653570;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=XAdWOeXMSA1UBIKB6IzgW4koz5qL75/zBBx/4sjKJgo=;
  b=E2PeDWvP4L/rmqMDn4qfbO71E1fKnacWnzzAK/D6D3XLj0Wukoqp54xx
   gJmlAXImfwNF3GgX+6yOYHj0gzmjUU8FnABxAB8gApmP4vsMeVaPW018L
   SZVo1RaD/ca0sSEPJidOh5FiVhBZFBo45vuXf/j4oj/6Nwm9eW3mJYk/+
   0=;
X-IronPort-RemoteIP: 104.47.57.173
X-IronPort-MID: 82267071
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+FVOOKxvZ/yR67CKq3F6t+e7xyrEfRIJ4+MujC+fZmUNrF6WrkUAm
 DBNCm+BaKmDM2D2ctB1O9zkoU0P7JSBztE3TgY4+SAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHPykYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtspvlDs15K6o4WtB5QRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw+ftOUFESz
 OUkbx9WXzaZ2rLrn5uKc7w57igjBJGD0II3nFhFlGicIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+uxuvDO7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr+Vx32kAN1LfFG+3tEt3kS3nGVMMzwpV3ijjeO6pkOMSfsKf
 iT4/QJr98De7neDbtT7RQz+n3eCsTYVQd8WGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmKaOVXuX+7OQrDWzESsYN2kPYWkDVwRty9v+pIA+iDrfQ9AlF7S65vX/FCvs2
 TmMoG47jq8KkM8Q/6yh+BbMhDfEjofET0g+5gjRdmu/60VyY4vNT7Kv7V/X/PNRNrGzR1OKv
 GUHs8WG5eVIBpaI/BFhW80IFbCtovqAbjvVhAc2G4F7rmv2vXm+YYpX/TdyYl9zNdoJciPoZ
 0mVvh5N4JhUPz2haqofj5+NNvnGBJPITbzNPs04pPIXOvCdqCfvEPlSWHOt
IronPort-HdrOrdr: A9a23:ytUhLarKuPQGUTgs5WTnnI8aV5uIL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ku90KnpewK+yXbsibNhcItKLzOWwldAS7sSobcKogeQUREWk9Qw6U
 4OSdkYNDSdNzlHZIPBkXGF+rUbsZa6GcKT9IHjJh5WJGkEBZ2IrT0JczpzeXcGJjWucKBJcK
 Z0kfA3wgZIF052Uu2LQl0+G8TTrdzCk5zrJTQcAQQ81QWIhTS0rJbnDhmxxH4lInJy6IZn1V
 KAvx3y562lvf3+4ATbzXXv45Nfn8ak4sdfBfaLltMeJlzX+0aVjcVaKv6/VQIO0aSSAWUR4Z
 3xStAbToNOAkbqDyOISN3Wqk/dOXgVmibfIBSj8AbeSITCNU4H4ox69Mxkm1LimjQdVJsX6t
 M140uJ85VQFh/OhyL7+pzBUAxrjFO9pT44nfcUlGE3a/pWVFZ9l/1pwKpuKuZ3IAvqrIQ8VO
 V+BsDV4/hbNVuccnDCp2FqhNihRG46EBuKSlUL/pX96UkcoFlpi08DgMAPlHYJ85wwD5FC+u
 TfK6xt0LVDVNUfY65xDPoIBcG3FmvOSxTRN3/6GyWuKIgXf3bW75Ln6rQ84++nPJQO0ZspgZ
 zEFEhVsGYjEnieffFmHKc7hywlbF/NLggFkPsulqSRkoeMNIbDIGmEVE0kldemrrEWHtDbMs
 zDSq5rPw==
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="82267071"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=boyfHlLbSUkNLlJdww5HbcVJ0p+35U9TteTTw6+Oym/clcQI4Rb3sCBTE1IJnTEPtTzqhxX64DHe63N6KJ33GELarpJr/VMoby74uT2uTEmVD8B5ItwNQeIPdz61ktMj5TEmQfP5vSDvq06caT6bNgrcKGFHE3+LKo2sk+rUPOJghamISDaj9Rc92D8Zr0GafUeMT067+RzZ5yrBa2lyaXorxQ8KkYGRAGtYIjdVACWZeBl3zFvA3//EW8lMDbQj0Qi6ktleMQwUEAQ8Gp6DtkM9qv6+iv325THx/eFpBXmeYq/y08IWTQRxP5erGoPdafZ+OvcA9IX5b8NeKY7W5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XAdWOeXMSA1UBIKB6IzgW4koz5qL75/zBBx/4sjKJgo=;
 b=e8A+Mes9Xq8q7SGB7t7Foc51AFRUlqi0DelDj2FG9LMcDS/cKiuGP54WThqGDAusOYMMTaHoZ25QKuETSQJEWtw0kUrqiPtvfynYafyqMxxc4EkOhYeVl0kKw/TLKbnp3fyxDjoUQ5rkF1fO9hpQGpGys1vihSKCRc2/6ZskKM70QYT2iGWi2Ds5gIVnCA1CxTCs9tEOqmyAOZnZvZoOIgR06P/YMo6gTNPYCZWgOiwgLzIqu0+gVqhzQpAMK+Q56wI+IZD6tKXgMpauF7QOBunbNhvnosI3ufKv6XiGCLKEXSvSzs+NSpdFUJADwMsdf7MAR6HP3GuooyAhw3coQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XAdWOeXMSA1UBIKB6IzgW4koz5qL75/zBBx/4sjKJgo=;
 b=eekemMo8WPIR1b8hN/uj3q0SaJ4XIrL9ALVRjXnUNABOSJ3p8dZTykODhNKMguYNDcs8ud4x4lUPmk6bije0ygzi67GvAJU0i25IsGIo0kcza7Q7Nw73OAuqXzrcghQXig1Na15zjDdkS2y4xfWPe/9fmiQDvHKVsHzMMFavvF8=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Henry Wang <Henry.Wang@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen
	<wei.chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Topic: [PATCH] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Index: AQHY3t89iKUDKPVqKkqXHrrxwpoahK4MD6gA
Date: Thu, 13 Oct 2022 09:32:24 +0000
Message-ID: <6cf1c4a9-f339-217c-4557-b0a9ff37938a@citrix.com>
References: <20221013083818.36209-1-Henry.Wang@arm.com>
In-Reply-To: <20221013083818.36209-1-Henry.Wang@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5822:EE_
x-ms-office365-filtering-correlation-id: 32385c53-fcbc-4034-0dce-08daacfdd650
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 j9cmgAQ62PzmH+dL8DFth4cMqXNLR6F8LTwLxNiOlmyyLny8Y+IeZNnOIMLDhXpchoWRwv5aVl/zCWUqQ3I0AVhjwO5UHz364j65HFGua4yFsQQ2JYXAMUHQc51O+bwE7ifgErLaREPI2fjlMsDWoNuSDr6+rxuIwtEw6FWF8r7R304hY5f+qBi9TgPVfUQnd6T9wdUpsG6rdySh32lkFA/NpcpNR0YcjKJ+DrNfIVjI1+MDX6xwTu55hmV/S1vinEFJvqQ7DTALdCL3B3vOsMySzB1tK+aOOX0xDVwEFuUp2Qt6ZZWxXn53xyGNOqr7fLAe/0Y1B6H0lEBVQPI+dRyr4818pFp0oQdXfDJsK27HwqBqm8Md0j54jr+BW7Q1tiO/fU5Cw7A/5FTeNxO6T6IyORPpEqa3RV3nnhPmleSpc+A5WaLGPJWXnd4Pj0njwFR4ccnB+mVrSfJvFJPoX4lcxwTUAWy9bWFAskWJhwmKeq1EaHMFhzDrIct5Kk7Dbq/fYSQTWorB6A/LZFlmcGEGc7flEBjV3De0fPGrkJbtVCVglBS0KY670t0py9Gm63+vsIbGEVSy0PlldpeYEIZ757EGs8tx7Dwp+2NYOmOfKDGAcxOq0W3GSEe8iyR1CuDL9S0NmU+1wIN3E5aRtHCt8fff2HzxbWKyjCKsi0kxnFJqtSKQoKuuer7DQA7n8f7BoLXE8WifFlQ4IesS/rtnFkeLgYS+yd/6CtJxdW1fw059+auZ3CnGN4qQiOqU/FyMTs3ku1hX2hfd3arjbWWn9wVeBryND9eABfU6sQK3hSz5TO88wfsceKSxSSGE38RNJ5IQ9jU5Hl3l3MZFZg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(366004)(346002)(39860400002)(136003)(451199015)(316002)(26005)(186003)(8676002)(91956017)(36756003)(8936002)(76116006)(66446008)(66476007)(66556008)(66946007)(4326008)(53546011)(41300700001)(31686004)(83380400001)(6506007)(6512007)(2616005)(5660300002)(2906002)(64756008)(71200400001)(38070700005)(82960400001)(478600001)(122000001)(54906003)(110136005)(86362001)(31696002)(38100700002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZVJzT0JndzlzNytSTUpENHMzSlNZNVRHd1NqaEx4WkZPU3RPZkJpS29Zazhv?=
 =?utf-8?B?OFJBcHVvYUlzWTdNWkpwM3JyZi80NjIzRzJLZVRFeUFrejhGUnlSeC93M0VB?=
 =?utf-8?B?aXYrZGdScnNWYmszMTcxOTVyUzhoeDNjRzdpSTZzT3hWeGFjcEtFRThhWnZX?=
 =?utf-8?B?RnJ5a1hGQ21ydVZiUU9wR3MwaVBob3g5Uk91OXlsTHpRWlZ2Q2FhNTQvWDEy?=
 =?utf-8?B?ekJIN2FkUkNEOHFycVB6QzdmUDdoWlM2ZDdYMGhOTU9DYnhoSXlHSmhNdmwv?=
 =?utf-8?B?V3RPTEhlckNMa3NxWVNxcTBHSmpzanVnVUhVVjVsdlJrUDR2NWM0RXNQdyts?=
 =?utf-8?B?NTNZay81Tm5OUlBFZUs1VzlTUHpKUGE1MjJLTGxkN2VNRG8vWUZmdUE5eGlT?=
 =?utf-8?B?NEpTN2xJZ0tMa2NkVEI5Q0NtMzlKc1MxaXpvWVY1dDZKOXAzVGcxSkhGMHov?=
 =?utf-8?B?LzB0SE9Va1Z3K1ZRZytsaGx5ajFkRStuYjViZ25NK2E1bUdic3FNKytmcVhU?=
 =?utf-8?B?R1IrS25mLzJ4YVgrd2JwV2Z4d05ESGR0RFUwalhON1kvSzhSWmJNaGdKVG9m?=
 =?utf-8?B?ZmIzNWdpU1EyaUFGenhVdXpqVUp0eHlRdTNHVGpuZUxUTkk3SVZGakY0cHNt?=
 =?utf-8?B?SWZFOGlLMGhkSEVUN0krOVZySklNR0dKSGw0Nm1tdWovNzNBZ3gwSXJaT1pQ?=
 =?utf-8?B?Zy9CdXpkRWJEY2g5ZVdlQkVuSkxhckFhQlN0MWhtNU9RL29Ed0IzbzM0b1Ba?=
 =?utf-8?B?TW9CdjVpVE5pcTVxYndkS3Rrd2RvY1NFRStZUHpLWVBUT3BmaGlaY0EvSWVw?=
 =?utf-8?B?bUlENy9hcTA4L0pVQ0lrSlcvb3cwNUpwd1dKQVVJYW5YRlg0QlR0TDJ3ZjI4?=
 =?utf-8?B?bEZvOTAvWHdVR29oak8ySXdYRVY2SnRTUCt4ZzVtRWFhazZDcHVtSGVOdWE4?=
 =?utf-8?B?UXdMdFMwODJTTXpuVUNkdHZmWHhIOTVxWUVhUjF4eWlqSFdHYmh3eGJ5T0Ry?=
 =?utf-8?B?L3RGdXEweG8yZm1LQXpFMmFDVWd6Tjd5SVVnZUp2bHVZSklucnRsV21EVnRN?=
 =?utf-8?B?OFo0VWd2QU5peEs2QVdzM3BmcFRHRGJ3aUM5akNDa1p3a3hsMjNZNzVyNyto?=
 =?utf-8?B?TEpvdHE3aXFXQVY3TDc2Q3JzZFNxQVZPVXlEYUwrREpYK3hYK2d2eno4WFYw?=
 =?utf-8?B?em5KYXBKamFIMndDL1VnelVxTVpKWWh5RFB4OHprT3lxUWVNTzN5OFJtMnBm?=
 =?utf-8?B?d0FhdFdIdG5JSFdKWTBiaWVBdFkxbkdnaGVIQjA1U0RWS2Jhc215bE43d1lJ?=
 =?utf-8?B?ZE5zZ1FkcWduWjJMT3drSkFRTmhNVWQ4aGZHN3dDazlacFRGT2ZpTkFZNzZE?=
 =?utf-8?B?TmFZUUFNYzR4LzBHaGl6bXRMaGNHWVpWZ1NiTnRZYnpCNXJYTGdmZGh2UW1k?=
 =?utf-8?B?Q0tOamtoMXdsdXNObk9taHprVm10ZjlZYWtOKy9ZVkxIWUhMZXp6NFpYemFS?=
 =?utf-8?B?TVVNVTBpVVRpd2ZTQUFvY2hpSWhtdDhNRHdOemxtM0psOGNTK05lZy9pcS85?=
 =?utf-8?B?VG1QSnlGa0MyMGgwMGJoaHY0RlBzR05Jc2pBWE5xRDR5NzlLUWhTbGZPOHlR?=
 =?utf-8?B?Ly8zYkdtS3lqUTFqajNnNmUrL0lTMkYvc3B6Ti9UTDg2eDA2SkJHNjlCbTRT?=
 =?utf-8?B?TmtkSnl4SkVZVEpoTEJTaXA0eFVRK0hIMjExRVJVMEFaL0Y1dnpjWk1zR2Nw?=
 =?utf-8?B?MThsK1YwMmdSVjlFVEY0TDRtTU9CWlh0OFlzVGtIZzNSOFJNZHRiUVRtS2h5?=
 =?utf-8?B?b1pqV0NRajY3cUMxNVhwdHVzNVV0SE0vUVJHcDNLRWt5MTVyT2R2TnhtVXBT?=
 =?utf-8?B?b3M0Tkw4NnArTXJpSmNHL0JaT0ZpMFRsS1FzcGpJVC8wMFlSdVMyQkQ1dExx?=
 =?utf-8?B?SEhRR2swWXNBOGV4SHp2UDFrRkgzSnRQR3htM1d0dGtZRVdFbUZSQ1ZYNFlJ?=
 =?utf-8?B?cHFSTDJ2aVJ1R0pVZVlpZTBXTXZ0L0gwR0lZWlFhcWZuVDFmUWJWNmd1aEZj?=
 =?utf-8?B?NXZjWVRxMFNGZ0Y4WDdRQ040UU9MbEE1djh3L0x0UTFsRE1BbjhqU1lLQng4?=
 =?utf-8?Q?Z5J0pNKZjNv3uZs/5zXqWgB7E?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE1D36E29E644141A1FDAC249BD65922@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32385c53-fcbc-4034-0dce-08daacfdd650
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2022 09:32:24.7995
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rcMBIvp549ngEFNvwkxwRv0xRCZK2bbFwnz8fYNxCBArt1aFrDhYe6/gk3ksvUGJKjJ4M8kqmUIHdcucMONCM5ztoJLFjDgSPKEDSmOKFdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5822

T24gMTMvMTAvMjAyMiAwOTozOCwgSGVucnkgV2FuZyB3cm90ZToNCj4gSGFyZHdhcmUgdXNpbmcg
R0lDdjIgbmVlZHMgdG8gY3JlYXRlIGEgUDJNIG1hcHBpbmcgb2YgOEtCIEdJQ3YyIGFyZWENCj4g
d2hlbiB0aGUgZG9tYWluIGlzIGNyZWF0ZWQuIENvbnNpZGVyaW5nIHRoZSB3b3JzdCBjYXNlIG9m
IHBhZ2UgdGFibGVzDQo+IGFuZCBrZWVwIGEgYnVmZmVyLCBwb3B1bGF0ZSAxNiBwYWdlcyBhcyB0
aGUgZGVmYXVsdCB2YWx1ZSB0byB0aGUgUDJNDQo+IHBhZ2VzIHBvb2wgaW4gYXJjaF9kb21haW5f
Y3JlYXRlKCkgYXQgdGhlIGRvbWFpbiBjcmVhdGlvbiBzdGFnZSB0bw0KPiBzYXRpc2Z5IHRoZSBH
SUN2MiByZXF1aXJlbWVudC4NCj4NCj4gRml4ZXM6IGNiZWE1YTExNDljYSAoInhlbi9hcm06IEFs
bG9jYXRlIGFuZCBmcmVlIFAyTSBwYWdlcyBmcm9tIHRoZSBQMk0gcG9vbCIpDQo+IFN1Z2dlc3Rl
ZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTog
SGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPg0KPiAtLS0NCj4gVGhpcyBzaG91bGQgYWxz
byBiZSBiYWNrcG9ydGVkIHRvIDQuMTMsIDQuMTQsIDQuMTUgYW5kIDQuMTYuDQo+IC0tLQ0KPiAg
eGVuL2FyY2gvYXJtL2RvbWFpbi5jIHwgMTQgKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxNCBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9t
YWluLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluLmMNCj4gaW5kZXggMmM4NGU2ZGJiYi4uZTQwZTJi
Y2JhMSAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbi5jDQo+ICsrKyBiL3hlbi9h
cmNoL2FybS9kb21haW4uYw0KPiBAQCAtNzQwLDYgKzc0MCwyMCBAQCBpbnQgYXJjaF9kb21haW5f
Y3JlYXRlKHN0cnVjdCBkb21haW4gKmQsDQo+ICAgICAgICAgIEJVRygpOw0KPiAgICAgIH0NCj4g
IA0KPiArICAgIHNwaW5fbG9jaygmZC0+YXJjaC5wYWdpbmcubG9jayk7DQo+ICsgICAgLyoNCj4g
KyAgICAgKiBIYXJkd2FyZSB1c2luZyBHSUN2MiBuZWVkcyB0byBjcmVhdGUgYSBQMk0gbWFwcGlu
ZyBvZiA4S0IgR0lDdjIgYXJlYQ0KPiArICAgICAqIHdoZW4gdGhlIGRvbWFpbiBpcyBjcmVhdGVk
LiBDb25zaWRlcmluZyB0aGUgd29yc3QgY2FzZSBmb3IgcGFnZQ0KPiArICAgICAqIHRhYmxlcyBh
bmQga2VlcCBhIGJ1ZmZlciwgcG9wdWxhdGUgMTYgcGFnZXMgdG8gdGhlIFAyTSBwYWdlcyBwb29s
IGhlcmUuDQo+ICsgICAgICovDQo+ICsgICAgaWYgKCAocmMgPSBwMm1fc2V0X2FsbG9jYXRpb24o
ZCwgMTYsIE5VTEwpKSAhPSAwICkNCj4gKyAgICB7DQo+ICsgICAgICAgIHAybV9zZXRfYWxsb2Nh
dGlvbihkLCAwLCBOVUxMKTsNCj4gKyAgICAgICAgc3Bpbl91bmxvY2soJmQtPmFyY2gucGFnaW5n
LmxvY2spOw0KPiArICAgICAgICBnb3RvIGZhaWw7DQo+ICsgICAgfQ0KPiArICAgIHNwaW5fdW5s
b2NrKCZkLT5hcmNoLnBhZ2luZy5sb2NrKTsNCg0KR2VuZXJhbGx5LCB0aGlzIHdvdWxkIGJlIGJl
dHRlciB3cml0dGVuIGFzDQoNCnNwaW5fbG9jaygpOw0KaWYgKCByYyA9IHAybV9zZXRfYWxsb2Nh
dGlvbigxNikgKQ0KwqDCoMKgIHAybV9zZXRfYWxsb2NhdGlvbigwKQ0Kc3Bpbl91bmxvY2soKTsN
Cg0KaWYgKCByYyApDQrCoMKgwqAgZ290byBmYWlsOw0KDQp0byByZWR1Y2UgdGhlIG51bWJlciBv
ZiBzcGluX3VubG9jaygpIGNhbGxzIGFuZCBtYWtlIHRoZSBlcnJvciBwYXRocw0KbW9yZSBjbGVh
ci7CoCBIb3dldmVyLi4uDQoNCj4gKw0KPiAgICAgIGlmICggKHJjID0gZG9tYWluX3ZnaWNfcmVn
aXN0ZXIoZCwgJmNvdW50KSkgIT0gMCApDQo+ICAgICAgICAgIGdvdG8gZmFpbDsNCj4gIA0KDQou
Li4geW91J3ZlIGdvdCBhIHByb2JsZW0gb24gdGhpcyBlcnJvciBwYXRoLCBzbyB0aGUgc2V0IGFs
bG9jYXRpb24gdG8gMA0KbmVlZHMgdG8gYmUgaW4gdGhlIGZhaWw6IHBhdGggd2l0aCBzdWl0YWJs
ZSBsb2NraW5nLg0KDQpUaGVyZSBhcmUgcGVyaGFwcyBiZXR0ZXIgd2F5cyBvZiBkb2luZyBpdCBp
biA0LjE1KD8pIGFuZCBsYXRlciwgYnV0IG5vdA0KaW4gZWFybGllciB2ZXJzaW9ucy7CoCBBcyB0
aGlzIGlzIGEgZml4IHRvIGEgYnVnIGluIGEgc2VjdXJpdHkgcGF0Y2gsDQpzaW1wbGljaXR5IGlz
IGdlbmVyYWxseSB0aGUgYmV0dGVyIGFwcHJvYWNoLg0KDQp+QW5kcmV3DQo=

