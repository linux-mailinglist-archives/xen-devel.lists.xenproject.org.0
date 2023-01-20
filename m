Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CAA67594F
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 16:55:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481983.747252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pItjD-0007au-EH; Fri, 20 Jan 2023 15:54:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481983.747252; Fri, 20 Jan 2023 15:54:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pItjD-0007Y8-BY; Fri, 20 Jan 2023 15:54:55 +0000
Received: by outflank-mailman (input) for mailman id 481983;
 Fri, 20 Jan 2023 15:54:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vlkl=5R=citrix.com=prvs=3778cfab1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pItjB-0007Xw-EG
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 15:54:53 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c45139b7-98da-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 16:54:49 +0100 (CET)
Received: from mail-bn8nam04lp2043.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jan 2023 10:54:46 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB4935.namprd03.prod.outlook.com (2603:10b6:a03:1e3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Fri, 20 Jan
 2023 15:54:44 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.024; Fri, 20 Jan 2023
 15:54:44 +0000
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
X-Inumbo-ID: c45139b7-98da-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674230090;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6kU454m2W3k+QEM9kV0wYwdUPDVwotb1yhUhbg/UduM=;
  b=WTMjXeUCH0qbQ9MYg7NELdHZdIRwcFh72K/VeLBC1O3uyWsZkg6Bm0Rx
   yf9nY3chMhkgWR/NqgiTLwcB4lk0ReewwK4sT9qqLQLAdYn7QHy+oH5hO
   nxWVIVoewbsAVmMnVvKlNwOugElJRPtr1ZJepUOzucUYy6WQyvMwWzAw5
   4=;
X-IronPort-RemoteIP: 104.47.74.43
X-IronPort-MID: 93506737
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pQ0HraNdkogtozHvrR0WlsFynXyQoLVcMsEvi/4bfWQNrUp3hTQHy
 mBODG3Qa/6KYzb2fIoka96z8BwP6JTXydQxQQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tB5ARmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uNIKlhI9
 aQ+EyIEalOz3KGM6+6ne/Y506zPLOGzVG8ekldJ6GmFSNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vZxvzO7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr6UwHulB9lNfFG+3uZJ32/K534OMTQHUWaBnuaG0lyaeN0Kf
 iT4/QJr98De7neDSd3wXAa5oTiHowQbUNpTFMU17QiMzuzf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8tiiuMCIYKWsDYy4sTgYf5dTn5oYpgXrnQddqFqqohdTdAzDux
 CuLqiN4jLIW5eYB0K+x7F3cgzaho5HPZgEw7wTTGGmi62tRbYqkfJCh6EKd4+xJKo2YVXGes
 HNCkM+bhMgFCpeLky6BSfsMB5mm4v+ENHvXhlsHN5Mm/T68vXO4fYRd5Th4DEhsO8cAPzTuZ
 SfuVRh54ZZSOD6ga/9xaofpV8Ayl/C8TpLiS+zeacdIbt5pbgib8SpyZEmWmWfwjEwrlqJ5M
 pCeGSqxMUsn5W1c5GLeb48gPXUDn0jSGUu7qUjH8ima
IronPort-HdrOrdr: A9a23:xrfYI6HB77tHl1JApLqFwJLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNNICPoqTM2ftW7dySeVxeBZnMHfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj2Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oK+RSDljSh7Z/9Cly90g0FWz1C7L8++S
 yd+jaJp5mLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjow4OyjhkQGhYaVmQvmnsCouqO+ixV42mJ
 3nogsmPe5093TNF1vF7yfF6k3F6nID+nXiwViXjT/IusriXg83DMJHmMZwbgbZw1BIhqA+7I
 t7m0ai87ZHBxLJmyrwo/LSUQtxq0ayqX0+1cYOkn1kV5cEYrM5l/1cwKoVKuZEIMvJ0vFhLA
 BcNrCb2B+QSyLCU5nthBgq/DVrZAVqIv7JeDlYhiXf6UkqoJkw9Tpl+CVYpAZByHt1ceg72w
 yPWJ4Y641mX4sYa7lwC/wGRtbyAmvRQQjUOGbXOlj/ErobUki94qIfzY9Fk91CQqZ4uqcaid
 DEShdVpGQyc0XhBYmH24BK6AnERCG4US72ws9T6pBlsvmkLYCbehGrWRQriY+tsv8fCsrUV7
 K6P49XGebqKS/rFZxS1wPzVpFOIT0VUdETuNw8R1WSy/i7YrHCp6jearLeNbDtGTErVif2BW
 YCRiH6IIFa4kWiShbD8WzssrPWCznCFL5LYdvnFrIoufkw36V3w3gooEX84N2XIjtftaFzdF
 diIdrc49GGmVU=
X-IronPort-AV: E=Sophos;i="5.97,232,1669093200"; 
   d="scan'208";a="93506737"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/jcMW/jv+T56ehPQQySEXd9XMspUEmOpEu22zxQ4AzFS7MM5xe4n2UNMe2t3ljTdIo6iZGD9c9+gSh10fiPOc+XsxcAVHJEzJmcJstJbiSSH14dWqJ+FZLgkrLPp8zitM0Z9nTQ1q8GzdHP9MC7B3NuXgFchWrJhefuxJO2JNGVWtFFUNwM0+IY/YoxdtaqxE7HAwXB3J9nJ5KTkdCc12RHGolHQ9d6sSPv21TixkV7+cQ3rBZc8na+InWJSLz4HYv4x63ruYfH+c3lLnzLx7zFCC5tbXJVrX3iEk/xRVIkb54VPHAUZlVwsd354IZb5TX5E47a6cYluCqKUiKbbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kU454m2W3k+QEM9kV0wYwdUPDVwotb1yhUhbg/UduM=;
 b=BpRyhF3o1dfdBeKq4fuvBsvkFN3osayOhzhnLYdfvqin1nbYeXHCz+CYhrnVOla8GU/oAksy2TpFGIZhTk2NmDJJl1xrQ0HR0fO0iusyqrE8ucJtuMW/sO8GqXW+q3PoKBUWygIDlHGjHm/MYCkUL2NgmwRFHHlSgmE4DJPpnfcuKmGXWEFDpXw/E/t0mud9mA7fSxcSkuUZ3v1SuDYNpYYlOi8+Htsyb6isVMA2HfxE5kVy3NCeQ/7iFxcakYBUSPemOTQSsqaYJBe4bqllyesVuRqerYY+H2mi9t7gu/AxT/qwhHsqZl3wCcJM+glJLBez+KIpwpDVQs+q+soDhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kU454m2W3k+QEM9kV0wYwdUPDVwotb1yhUhbg/UduM=;
 b=n5rNNPZDDvXUtN2245noDB1++NeqSpfHLuYwgYLpzun3QnBzuJ8DktVQhSXwr2hcC6s5xbh9h/HvBKLEDjQmqJdbGJue2lmdZEuTmXPgaZP7xwCJe7lpNSYhmmXr+0WWd4DcaP3ACmPQUOk4DOIguMFgqjMvMaXREFzBZ4WrYjI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	<gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
 Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>,
	Bobby Eshleman <bobby.eshleman@gmail.com>
Subject: Re: [PATCH v1 06/14] xen/riscv: introduce exception context
Thread-Topic: [PATCH v1 06/14] xen/riscv: introduce exception context
Thread-Index: AQHZLOAEizmhskK0b0Wez8lGfG74vK6ndUcA
Date: Fri, 20 Jan 2023 15:54:44 +0000
Message-ID: <fd276566-6b7d-ea64-a90a-a0c198ccf36c@citrix.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
 <00ecc26833738377003ad21603c198ae4278cfd3.1674226563.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <00ecc26833738377003ad21603c198ae4278cfd3.1674226563.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BY5PR03MB4935:EE_
x-ms-office365-filtering-correlation-id: df5e30b0-5e09-465b-ae9e-08dafafea65d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 iLqfkD55RmFGxp6PmUqAhyRYvgRYMFWcBkLSaZZhP/kC4uvk4ichP9o6HpMeckk8NKth6wkMBarj4bjRhq/Z9L1v8zEn1cnyiZqycuEHbecdSDaf9eENdRtm+6WCJbO8xDZ7CrbaPF87LCuBPDoaVJ7uZ3WpjtbobLlhS6dLBHNL6qJ6ZheOqXic/0RJkdAoAqkC2pobENtHhZi4esmsbZtImonkhcOh7Wp8y6ilSj12XJxWmm63PwIyvjdJp0um7GHtML0KyDFK6/41k6iCDVy3RhLz1D9M4mj3uEb0jCVfAyD7yzVXSAZ277YHCF/98l7GXiunkdPpGpX+O7I2OvJrUlUOZ3K/5BAmnGt3PNidb5BAFYLtO27C0cEBDkzIWWM7LQzdNJYaKXSatpb79fPTJd0z3tMiHsp+IgYTRi0xAzHhaDqX0snFS+nVnlB7rQCiM+anUftIH94zUiSCOm+1+vJbIlibdZ9K1j2WHQ8kpRdrni+w6ib+4X2hA0R4v9RE9quLUhEVJ89mmP/yjIqjMWBNvBVjyR5jtPvw8cAOLN+4zh7+VRusqf0eXhq4VtTbGvrWrGDHgR41gphXIBAF0eLxvIpwt0SGYAIsJz7uLdite5iSuwiGdGzPOo+hTMniPg/5XM0sVzi9WRrxjMLxUmWGC1bQNFgPz/BeylL5BUOUus5abAD37NfPr/9rSB2w3DKkK2KhAEpN7KUOvS8PDBzdPcVZcfuB5Nl3DuZkQM7J6RFXAv2Dl7rAdrVibddd2dk4xEge7nVFebZ+5g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199015)(6506007)(31696002)(82960400001)(4326008)(2616005)(91956017)(36756003)(8936002)(110136005)(41300700001)(38100700002)(122000001)(8676002)(54906003)(86362001)(76116006)(71200400001)(5660300002)(26005)(83380400001)(6512007)(478600001)(186003)(6486002)(31686004)(2906002)(66476007)(66946007)(53546011)(316002)(64756008)(66446008)(66556008)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UVRGZlh5QzFRcG1GVENYc1dyck9YcFBwUUU5UnpkMmVpR0NDckhGZzZSbDBB?=
 =?utf-8?B?OHBPTS9mczRYbFVDazlETUdJNkRGS0NvUTJkb1E0V0gxSm5jcnRWdmFibnVS?=
 =?utf-8?B?S29HbTJRUlUrVVF2cmQ5MzBVVnRVVDB6bjFLVlpHdFJGV0xiVHRtNlFCMHk0?=
 =?utf-8?B?ZWpQdjVHbEdtSzhFemdhb3EyME1pMlRMSEJSNXhoT0hkK29FakE1NWszcVhu?=
 =?utf-8?B?dkRjTnZEUEk4R2QzZ1BYYmM1bzNSR0dEMGFqVGhTWUU0U1F2azVmWlFmYTRl?=
 =?utf-8?B?b1lpdzNwdzhzNXFKOFBtV01KZ0VQS2hObDNNZXFwNXlCVDB4Lzcra2diV0lU?=
 =?utf-8?B?WDdYZldkSERpSHNWaXprUUpUZTNwVS85cHMxbVhTMEVxbmZqOExCMHBmcm1V?=
 =?utf-8?B?NEgvMzUvdHFGSFJjR1dhTVdPWHVPNG9hNkx2U0ljWk04T05qSUR6RENtRFJa?=
 =?utf-8?B?Zm1taTFrUGk4ZmNTSlQyRERsQWNlYXAzWldtQ2t4dTZsbzhtNTRkalNCM3Bm?=
 =?utf-8?B?R1cwWFpQcVEyMnFQODRyMnBPZzVXUEVVL0pvS2VLcW5NdUhnUUMrZmpCUUpZ?=
 =?utf-8?B?TEZoenAyR0M3YUk3cFpjVmdibmh2MkxqaWpLeVFRZ1hiemhnbklQYWM0Umw4?=
 =?utf-8?B?cFpSUjU5TUtKZzZBOWZJRHJBNEh5NGZEcE44aldoeHlHeVBlWmtuTHJyaFlr?=
 =?utf-8?B?bnRGT2ZYV0l4Qk5hSTRaenJTa3BsV3VGNEpkWTNtbitPV3ZBLzk2MU5IcSta?=
 =?utf-8?B?b2ZXbmpzM2xFM2xXVTdVQkJoMkJzNFdZOVkzcllOM2NpZ0ZlYlhWS2w5STNW?=
 =?utf-8?B?Q1VNRmJjenljSEovZUVMQXQ4VWpNS0cyMlRWOHBTSGN5dE9XTnl4TFJmajhq?=
 =?utf-8?B?UTdoSVhyS3c5dEVGd0FmQ1RQN0prYWlRMGNNdkxQOUlvajIrTzlMZzBJMjVm?=
 =?utf-8?B?Y1lQaUVoOXFVMy84cmVpVm5FOEdsMUM2aXFOY3hieWdwbC9URmxTQS9kVVJO?=
 =?utf-8?B?bCtIanczQ1RYb3NJdGMrN3dDeHo3OGQrNlROQWJYZHl0RS8yM0JsU0Fvdm9T?=
 =?utf-8?B?MVBUUklyQU55V0hnRktqTjB2WW9IRnV0aVJXN2dYMVpYYzRlY2V6Y0hDajVS?=
 =?utf-8?B?OW5YN1d3WUkzWitCaktPeDJaNm8yVGVUY0VhVXVTb003dklhMEtUT1RhUGoz?=
 =?utf-8?B?RjJzaS9KT0Z2Y2txSDB5S3duR2VoL3loZDkvOU1OTXVoWDFLMENib24xem9n?=
 =?utf-8?B?QVhubFlEY3NtT2VyOVp2ZUxUbWZRKzBEQXZTMWUxUElrcUhrNGo2MXRIOHFK?=
 =?utf-8?B?RlZ1L21BeWVwZWw3VUVuT2szTEZFaWNsVCttTnE0MDRpZS91YmsyRGhFdEg5?=
 =?utf-8?B?NE8vekd0YUVrcFhiNmtqVUhvL1NldXp4YzBRZmNtSjd0ZlRidS9OOWppam5v?=
 =?utf-8?B?bEZIN2tLMmphekM3a1lOTXl5Zk5ydnZXT2d5b3dnTlVOQUpmSE5Ib0srNnpI?=
 =?utf-8?B?Uzg5aThkdjRiS3I2blVab0d5NWUzSkxWZXB1bXh3NzdQYXltYW1rODc5Wlhn?=
 =?utf-8?B?ZmFJQnZJM0w1WFdXQXV2QjBLUlcwTkZMSVpva2xDMVRwWWZ6UHF6NHJnSlFQ?=
 =?utf-8?B?a1lxdXRQeXVzTUY3NUN0bGhLTWJkVXp4MHIyTXNJK1lpWjNycVBmQStYOExY?=
 =?utf-8?B?TVpnaGVlRExHRUZpYmlBV0VIRUVPNXJmVThhOUQyUkg4UFdTNW83VTZtSng5?=
 =?utf-8?B?anVtWmtCN3RGc2hsOWFRbmxMSFQzVGVXWXROOUZLT2tYOWdONzBFVzZLOFhG?=
 =?utf-8?B?ZXlCcEFwaVF3TWhVOWU0SFdhcTU1VkNpbUlqR29wTmpqaFpqdTd4Nm9Denkv?=
 =?utf-8?B?em5DcG82elowYVYrZzlINml0aWpkVDRWaW9jQ1RxczVseGZUQ0RNQWptS3BZ?=
 =?utf-8?B?bTJwSDR1SENoeEYzaEc5Sk55WHJscjVCK2t5djZacStmakQ2Z1hPRFB3RUtF?=
 =?utf-8?B?ekR1cVJ4Mk5iTSthTHZBV1I3dkpPRWE2dWVXaWJuYldnRTMwWUFYalNnQXp6?=
 =?utf-8?B?UTRUYlNFbnJuWG5RRjJoM3JWaFVuNEZ2K1RMd2tPSXkxT1ZqSEJLZkVIWXVP?=
 =?utf-8?B?VTV4eitOVzdjQ1FtVXFjclF6S01GNzRzNy9FTXoyTm83ZERWNmY2YzlYUHBY?=
 =?utf-8?B?SVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED7C7E558690214FA31184660D24DD47@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/Ow9IQLe9Lmq3sjWiM77v7VGmz41e/SiN+v4zdpJtWlTvjlsaUFQy22zfFDBHspHquZtfca+fpICDv8EXHvpfnO8X+4ev8Sa9eiVd8SF2k8sfY+UVZ7ORucJok/CWrxp1Ir45CFq/Rx9xjHMMAb27LwKX4RVE19kOrSoady+fTJV7YntSm62n9hxC6Zj+VE6ZHUfXgNJ0QYBj5MJcTNAK1DElxaCIeS19K/rdQRjVe8U9St9+H5fNdmE0+1d8FPhBWh83yYZWqFqqeTGxiZAP/KNC4RBwvaq1NDpLxrmp7A0DYvee3zZE8iiCXi/npLiR3E93xt7OI09aW4orRjRccLXYsyipNdRQd7KoX+8SPMXdQylOpgEvFY/3r/p3OIJsvj1nFQnjBQmMomT+XCrnpf9fcikBPLPjldq+FsGaCiOQ6AUwabhH91q9/B+JOLPdNKKXQaqx1M0W1LnMZzfj1F8KbmiJ/DCokuzfmBCGxh2Mv5hhbzoBp4a0VFCy5q4ioVjDA/aWmKyzfKf9bsRAqz8al95//reJsIeMdkmtt6aPI1McYAaIyTxYD+3Gi22b+SS2gzma/U2YN2gEORsejx3IVfukw4SiidBO1HaInvcybD3nizRzljx1lrIxpxjhfYZ//egVroISg4X/O3nykwHnTMZX4aXnKdMbZo64/dWUztUnGCX0As/NsgbCFU9JmWP/GEPfW8rjWvELPztFspH6q/vrZCXQBptC+pglzJ003cuCpsOBTvKuWdE2hI7WaCSkXPExVRgBWHLI0YzOvIryLYC46yjCkpioyti6TlNAMTWacKVXednfm4Dkm26OYhzj+rBY7kpvq+o79/GjOamDxlE78H46pyJbZASGuvebY3m88z4/MgSH69xCOLEPNR7jBb9p0q+xv8VS7SdVQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df5e30b0-5e09-465b-ae9e-08dafafea65d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 15:54:44.5984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dJAv8ZObbBsjQdE4i2JQkIKWjKpUy/NAqvTyZBO8gDTs3S0WH/NAX+ERDDuixy6D6NOCRfOWQZGix6OCala1GcDtjc7EeChPonWL4e7ShU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4935

T24gMjAvMDEvMjAyMyAyOjU5IHBtLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOg0KPiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmggYi94ZW4vYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBp
bmRleCAwMDAwMDAwMDAwLi41ODk4YTA5Y2U2DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIveGVu
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgNCj4gQEAgLTAsMCArMSwxMTQgQEAN
Cj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQgKi8NCj4gKy8qKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioNCj4gKyAqDQo+ICsgKiBDb3B5cmlnaHQgMjAxOSAoQykgQWxpc3RhaXIgRnJhbmNp
cyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPg0KPiArICogQ29weXJpZ2h0IDIwMjEgKEMpIEJv
YmJ5IEVzaGxlbWFuIDxib2JieS5lc2hsZW1hbkBnbWFpbC5jb20+DQo+ICsgKiBDb3B5cmlnaHQg
MjAyMyAoQykgVmF0ZXMNCj4gKyAqDQo+ICsgKi8NCj4gKw0KPiArI2lmbmRlZiBfQVNNX1JJU0NW
X1BST0NFU1NPUl9IDQo+ICsjZGVmaW5lIF9BU01fUklTQ1ZfUFJPQ0VTU09SX0gNCj4gKw0KPiAr
I2luY2x1ZGUgPGFzbS90eXBlcy5oPg0KPiArDQo+ICsjZGVmaW5lIFJJU0NWX0NQVV9VU0VSX1JF
R1NfemVybyAgICAgICAgMA0KPiArI2RlZmluZSBSSVNDVl9DUFVfVVNFUl9SRUdTX3JhICAgICAg
ICAgIDENCj4gKyNkZWZpbmUgUklTQ1ZfQ1BVX1VTRVJfUkVHU19zcCAgICAgICAgICAyDQo+ICsj
ZGVmaW5lIFJJU0NWX0NQVV9VU0VSX1JFR1NfZ3AgICAgICAgICAgMw0KPiArI2RlZmluZSBSSVND
Vl9DUFVfVVNFUl9SRUdTX3RwICAgICAgICAgIDQNCj4gKyNkZWZpbmUgUklTQ1ZfQ1BVX1VTRVJf
UkVHU190MCAgICAgICAgICA1DQo+ICsjZGVmaW5lIFJJU0NWX0NQVV9VU0VSX1JFR1NfdDEgICAg
ICAgICAgNg0KPiArI2RlZmluZSBSSVNDVl9DUFVfVVNFUl9SRUdTX3QyICAgICAgICAgIDcNCj4g
KyNkZWZpbmUgUklTQ1ZfQ1BVX1VTRVJfUkVHU19zMCAgICAgICAgICA4DQo+ICsjZGVmaW5lIFJJ
U0NWX0NQVV9VU0VSX1JFR1NfczEgICAgICAgICAgOQ0KPiArI2RlZmluZSBSSVNDVl9DUFVfVVNF
Ul9SRUdTX2EwICAgICAgICAgIDEwDQo+ICsjZGVmaW5lIFJJU0NWX0NQVV9VU0VSX1JFR1NfYTEg
ICAgICAgICAgMTENCj4gKyNkZWZpbmUgUklTQ1ZfQ1BVX1VTRVJfUkVHU19hMiAgICAgICAgICAx
Mg0KPiArI2RlZmluZSBSSVNDVl9DUFVfVVNFUl9SRUdTX2EzICAgICAgICAgIDEzDQo+ICsjZGVm
aW5lIFJJU0NWX0NQVV9VU0VSX1JFR1NfYTQgICAgICAgICAgMTQNCj4gKyNkZWZpbmUgUklTQ1Zf
Q1BVX1VTRVJfUkVHU19hNSAgICAgICAgICAxNQ0KPiArI2RlZmluZSBSSVNDVl9DUFVfVVNFUl9S
RUdTX2E2ICAgICAgICAgIDE2DQo+ICsjZGVmaW5lIFJJU0NWX0NQVV9VU0VSX1JFR1NfYTcgICAg
ICAgICAgMTcNCj4gKyNkZWZpbmUgUklTQ1ZfQ1BVX1VTRVJfUkVHU19zMiAgICAgICAgICAxOA0K
PiArI2RlZmluZSBSSVNDVl9DUFVfVVNFUl9SRUdTX3MzICAgICAgICAgIDE5DQo+ICsjZGVmaW5l
IFJJU0NWX0NQVV9VU0VSX1JFR1NfczQgICAgICAgICAgMjANCj4gKyNkZWZpbmUgUklTQ1ZfQ1BV
X1VTRVJfUkVHU19zNSAgICAgICAgICAyMQ0KPiArI2RlZmluZSBSSVNDVl9DUFVfVVNFUl9SRUdT
X3M2ICAgICAgICAgIDIyDQo+ICsjZGVmaW5lIFJJU0NWX0NQVV9VU0VSX1JFR1NfczcgICAgICAg
ICAgMjMNCj4gKyNkZWZpbmUgUklTQ1ZfQ1BVX1VTRVJfUkVHU19zOCAgICAgICAgICAyNA0KPiAr
I2RlZmluZSBSSVNDVl9DUFVfVVNFUl9SRUdTX3M5ICAgICAgICAgIDI1DQo+ICsjZGVmaW5lIFJJ
U0NWX0NQVV9VU0VSX1JFR1NfczEwICAgICAgICAgMjYNCj4gKyNkZWZpbmUgUklTQ1ZfQ1BVX1VT
RVJfUkVHU19zMTEgICAgICAgICAyNw0KPiArI2RlZmluZSBSSVNDVl9DUFVfVVNFUl9SRUdTX3Qz
ICAgICAgICAgIDI4DQo+ICsjZGVmaW5lIFJJU0NWX0NQVV9VU0VSX1JFR1NfdDQgICAgICAgICAg
MjkNCj4gKyNkZWZpbmUgUklTQ1ZfQ1BVX1VTRVJfUkVHU190NSAgICAgICAgICAzMA0KPiArI2Rl
ZmluZSBSSVNDVl9DUFVfVVNFUl9SRUdTX3Q2ICAgICAgICAgIDMxDQo+ICsjZGVmaW5lIFJJU0NW
X0NQVV9VU0VSX1JFR1Nfc2VwYyAgICAgICAgMzINCj4gKyNkZWZpbmUgUklTQ1ZfQ1BVX1VTRVJf
UkVHU19zc3RhdHVzICAgICAzMw0KPiArI2RlZmluZSBSSVNDVl9DUFVfVVNFUl9SRUdTX3ByZWdz
ICAgICAgIDM0DQo+ICsjZGVmaW5lIFJJU0NWX0NQVV9VU0VSX1JFR1NfbGFzdCAgICAgICAgMzUN
Cg0KVGhpcyBibG9jayB3YW50cyBtb3ZpbmcgaW50byB0aGUgYXNtLW9mZnNldHMgaW5mcmFzdHJ1
Y3R1cmUsIGJ1dCBJDQpzdXNwZWN0IHRoZXkgd29uJ3Qgd2FudCB0byBzdXJ2aXZlIGluIHRoaXMg
Zm9ybS4NCg0KZWRpdDogeWVhaCwgZGVmaW5pdGVseSBub3QgdGhpcyBmb3JtLsKgIFJJU0NWX0NQ
VV9VU0VSX1JFR1NfT0ZGU0VUIGlzIGENCnJlY2lwZSBmb3IgYnVncy4NCg0KPiArDQo+ICsjZGVm
aW5lIFJJU0NWX0NQVV9VU0VSX1JFR1NfT0ZGU0VUKHgpICAgKChSSVNDVl9DUFVfVVNFUl9SRUdT
XyMjeCkgKiBfX1NJWkVPRl9QT0lOVEVSX18pDQo+ICsjZGVmaW5lIFJJU0NWX0NQVV9VU0VSX1JF
R1NfU0laRSAgICAgICAgUklTQ1ZfQ1BVX1VTRVJfUkVHU19PRkZTRVQobGFzdCkNCj4gKw0KPiAr
I2lmbmRlZiBfX0FTU0VNQkxZX18NCj4gKw0KPiArLyogT24gc3RhY2sgVkNQVSBzdGF0ZSAqLw0K
PiArc3RydWN0IGNwdV91c2VyX3JlZ3MNCj4gK3sNCj4gKyAgICByZWdpc3Rlcl90IHplcm87DQoN
CnVuc2lnbmVkIGxvbmcuDQoNCj4gKyAgICByZWdpc3Rlcl90IHJhOw0KPiArICAgIHJlZ2lzdGVy
X3Qgc3A7DQo+ICsgICAgcmVnaXN0ZXJfdCBncDsNCj4gKyAgICByZWdpc3Rlcl90IHRwOw0KPiAr
ICAgIHJlZ2lzdGVyX3QgdDA7DQo+ICsgICAgcmVnaXN0ZXJfdCB0MTsNCj4gKyAgICByZWdpc3Rl
cl90IHQyOw0KPiArICAgIHJlZ2lzdGVyX3QgczA7DQo+ICsgICAgcmVnaXN0ZXJfdCBzMTsNCj4g
KyAgICByZWdpc3Rlcl90IGEwOw0KPiArICAgIHJlZ2lzdGVyX3QgYTE7DQo+ICsgICAgcmVnaXN0
ZXJfdCBhMjsNCj4gKyAgICByZWdpc3Rlcl90IGEzOw0KPiArICAgIHJlZ2lzdGVyX3QgYTQ7DQo+
ICsgICAgcmVnaXN0ZXJfdCBhNTsNCj4gKyAgICByZWdpc3Rlcl90IGE2Ow0KPiArICAgIHJlZ2lz
dGVyX3QgYTc7DQo+ICsgICAgcmVnaXN0ZXJfdCBzMjsNCj4gKyAgICByZWdpc3Rlcl90IHMzOw0K
PiArICAgIHJlZ2lzdGVyX3QgczQ7DQo+ICsgICAgcmVnaXN0ZXJfdCBzNTsNCj4gKyAgICByZWdp
c3Rlcl90IHM2Ow0KPiArICAgIHJlZ2lzdGVyX3Qgczc7DQo+ICsgICAgcmVnaXN0ZXJfdCBzODsN
Cj4gKyAgICByZWdpc3Rlcl90IHM5Ow0KPiArICAgIHJlZ2lzdGVyX3QgczEwOw0KPiArICAgIHJl
Z2lzdGVyX3QgczExOw0KPiArICAgIHJlZ2lzdGVyX3QgdDM7DQo+ICsgICAgcmVnaXN0ZXJfdCB0
NDsNCj4gKyAgICByZWdpc3Rlcl90IHQ1Ow0KPiArICAgIHJlZ2lzdGVyX3QgdDY7DQo+ICsgICAg
cmVnaXN0ZXJfdCBzZXBjOw0KPiArICAgIHJlZ2lzdGVyX3Qgc3N0YXR1czsNCj4gKyAgICAvKiBw
b2ludGVyIHRvIHByZXZpb3VzIHN0YWNrX2NwdV9yZWdzICovDQo+ICsgICAgcmVnaXN0ZXJfdCBw
cmVnczsNCg0KU3RhbGUgY29tbWVudD/CoCBBbHNvLCBzdXJlbHkgdGhpcyB3YW50cyB0byBiZSBj
cHVfdXNlcl9yZWdzICpwcmVnczsgPw0KDQo+ICt9Ow0KPiArDQo+ICtzdGF0aWMgaW5saW5lIHZv
aWQgd2FpdF9mb3JfaW50ZXJydXB0KHZvaWQpDQoNClRoZXJlJ3Mgbm8gcG9pbnQgd3JpdGluZyBv
dXQgdGhlIG5hbWUgaW4gbG9uZ2hhbmQgZm9yIGEgd3JhcHBlciBhcm91bmQgYQ0Kc2luZ2xlIGlu
c3RydWN0aW9uLg0KDQp+QW5kcmV3DQo=

