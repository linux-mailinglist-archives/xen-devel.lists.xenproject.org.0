Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7BA373DFB
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 16:54:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123161.232331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leIua-0005Sk-Em; Wed, 05 May 2021 14:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123161.232331; Wed, 05 May 2021 14:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leIua-0005Q4-Bh; Wed, 05 May 2021 14:54:04 +0000
Received: by outflank-mailman (input) for mailman id 123161;
 Wed, 05 May 2021 14:54:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Yav=KA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1leIuY-0005Py-6z
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 14:54:02 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c0509dc-768d-47a8-942a-4c866bba0c8b;
 Wed, 05 May 2021 14:54:00 +0000 (UTC)
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
X-Inumbo-ID: 2c0509dc-768d-47a8-942a-4c866bba0c8b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620226440;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cmhikC7c3lMtBjGqm5v0z2QAiAMrj5DLOIpvqJ8HE40=;
  b=JKuHb+fms1DZ0WrfDSKlwq8faBteKerefXBvyZg5VvL5RymhGrs31qNY
   rZQuhn+U6Qr9sYtBn/zilfKuDq2BVFPsfVghbqT3rkamCGaP79guVQydL
   henaAG+Kukoyz6JnQBlEWmPWA1a2io6HFaywNAzGBSlY2DbGVOSeIt3wz
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: zDJ0HlNVHujnJwXvgm2eSkrwQ/AiXueS2QaF48kC9hz+cw5fTw10Et7geqz+LoOzdWdELanW8q
 pdB8UoQYZkIoHjX+BwSzD2EKTYFJjqo+3hOxhKjDLskn3yPdT2CDwS2AhrBzqv6CEuhJQN3uo7
 5kbx/mO5kS0oTtf8aT+vBXBQH4rYwfmzMl8TkRwFC0DDgMZdKXAAYL7UQNq5WNPbEag8vHH2TD
 NxupiGl84xrhBOaNOwol9jPVq1TNXUq7Sj31p7RSlVfTA/wLsIcfC/DgIQZoPuU/wH58xcNjYi
 HVc=
X-SBRS: 5.1
X-MesageID: 43137146
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ziqRtK8S9HVZnvZ8XBZuk+F1cL1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmyybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIUHD38Zn/+
 Nbf6B6YeecMXFTkdv67A6kE9wp3dmA9+SSif3Dymp2JDsKV4hLxW5Ce2OmO2dxQxRLAod8MZ
 Ka6NZOqTbIQwVpUu2QAH4ZU+/f4+DRnJX9bhIcQzIh4g+CjTSngYSKbySw9BEYTj9J3PMe4X
 HI+jaJm5mLntOa7lvn12HV54lLg9eJ8LV+LeGFl8R9EESVti+Gf4JkMofy2wwdgObq01oylc
 mJnhFIBbUI11r0XkWY5STgwBPh1jFG0Q6Q9Xa9jWH4qcL0ABIWYvAx/L5xSRfS50o+sNwU6s
 sitAj4xvkneC/opyjz68PFUBtnjCOP0B4fuNUekmBFVs8mYKJRxLZvjH99KosKHy7x9ekcYY
 9TJfzbjcwmE2+yU2rUpS1GztCqQx0Ib2y7a3lHkMmU3z9KpWt+3ksVyecO901wha4Vet1q4f
 /JPb9vk6wLZsgKbbhlDONEesevDHfRKCi8f166EBDCLuUqKnjNo5n47PEc4/yrQoUByN8XlI
 7aWF1VmGYucyvVeIOz9awO1iqIbHS2XDzrxM0bzYN+oKfASL3iNjDGYEwykuO7ys9vQfHzar
 KWAtZ7EvXjJWzhFcJixAvlQaRfLnEYTYk8pss7YVSTucjGQ7ea9tDzQbL2Hv7AADwkUmTwDj
 8oRz7oPvhN6UitRzvWmx7Ud3TxelHu3J55HaTAltJjjbQlB8lpiEw4mF657saEJXlpqaotZn
 ZzJ7vhj+eaqACNjCL1xlQsHiAYIlde4b3mXX8PjxQNKVnIfbEKvMjaXWhT2XCANyJuVs++Kn
 8Zm31HvYaMa7CAzyErDNyqdkiAiWEImX6MR5AA3oqO+NniYZF9Kpo9QqR+GUHqGnVO6EdXgV
 YGTDVBal7UFzvoh6ngpocTHvvje951hxruB9VVp3LZvUC1vtouWXMfYj6rXaes8EQTbgsRom
 c0374UgbKGlzrqA3A4mv4EPFpFb3nSPKhLFz2fZIJfmqnifSZ5SWviv03dtzgDPk7Rs2kCjG
 3oKiOZPdXGGEBUtHxj3qH2y19sbWmGc0Vsand1jJ1lGQ39ywRO+N7OQpD2/3qaa1MEzO1YCj
 3DbDcICi5Fxty81neu6Xy/PERj4q9rEv3WDbwlfb2W52ikL5eQk7oaW9VO+ox+CdzouugXcO
 6WdgOPNgnkA+cx1wH9nAd9BABE7F0f1d/40hzs62a1mEMlCf3JOVJ8WvU1Jcqf42WMfYfA7L
 xJyfYO+c2+PWX6ZoTYleX5bztfJgjSpmDzZecyspxQtb8zsrw2P5Sza0q+6Fh3mDEFaOHznw
 ciZY4+xpbrEIpmZdYTdCJU5UBBrqXFEGIb9ijNRtYjdlQshULBN9yH47D0uaMia3fx0DfYCB
 26yWlh5P/LUCuI6K4CB48xKWpQblIg6H4KxpL1S6TgTCGrffpE5ly0LzuUd6JcUrGMHdwr31
 tHyuDNu++cbCzj3g/M+RN9P6JV6m6iBee/GhiFF+IN09u0Pz238+eXyf/2qDf8Uj2gbUsEwa
 VDaEwLd8xGzgAYs7df6Fn7doXH5mQ/k1Vf5jl7llninqieiV2rY31uAEn+mZVZXT5aL36Sq9
 /KmNLojEjA3A==
X-IronPort-AV: E=Sophos;i="5.82,275,1613451600"; 
   d="scan'208";a="43137146"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/W8m54rXawgzNQUvM5+onSbZD6QEtey4arkDOoCvmUgignWOEW746n8BF9jf+Ty+eRNw+kEkfcmdwzt+zuogiRPZ7cYXU/DaQ8VM+c/dax1psQ9s3bLnPGEvscEF5SZTM0RojHGa6z76IUbp7U6vlx1hd+0RAFdCzuWDXSeOoGLhP9trR6TA2KZo9nss5pBW00GQmGfJJtUFNWsZ8zFHFvz+RvChq7+n4su5w2bdeu4ZSW+9PNi0U1hLyJVdD/TxWrLJ3TkOILgewvDGNBVYNAsM0gIgOyk5J6kan3sqz7LAA43iY28Y9/3lYoidlzLc39qESW/4zlsT0NfIo7FmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BeIkc5YgV60FmIqnHHCOUHZuk1rbyq/d/rUB/u3jwQ=;
 b=niSk8a4UGbOJHPVIR0A4vSOXLq79+SCqeJ3soQLmuIoVrQ/EJf7HoEKt4+6/1s8Gvfq1dHX0Hub8nVQs/5pae8Bm/eUnL/vfeJrJMFsCqyo9XdbynDrQRUjU7fYLIWtFztM4PPTTdtlm6u6Np3SBNxjEMh9IqhANkCjPlC/ORofBRGreFPP5IZwTqXTk5lK3SzQSF549B3qYzoC2yan+QpIX6qQ9TUnIjehMOtHSIeiFP5XlaJz1TV205L79IqhE+52Ef3EpgzMu+OIyZDauZSqkjY9k2pyNxWJE8KpZsi9oJdI6XKNVuGYnepd5Q9PP/e22kQ52u+VFr/hNdI+vhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BeIkc5YgV60FmIqnHHCOUHZuk1rbyq/d/rUB/u3jwQ=;
 b=SyGsQkou6wlltpQ4Ws0mx5kwPGXEKVRBpeJxQTfLBBtC7h5lM/WLK072js9enZGE/D7Mqn6r5sNBhwcoo0Kih1GBQ1BnGWNaeReJqY7W5ZvbnWHbsJmi3guW5oBqKQp1QhlxFvI8FSNXJbsSwFSElLgr5oV6ypYdTp/pZWVcKLg=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210503153938.14109-1-andrew.cooper3@citrix.com>
 <20210503153938.14109-5-andrew.cooper3@citrix.com>
 <17501fdd-b9f0-3493-7d0d-8c5333fafa45@suse.com>
 <3f9ae28f-2fb7-0f4f-511b-93ba74ec3aeb@citrix.com>
 <ced9f20a-d420-6639-b041-710f7ec59613@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/5] x86/cpuid: Simplify recalculate_xstate()
Message-ID: <d918c2b6-7c31-6868-eb50-6a3db54fa4eb@citrix.com>
Date: Wed, 5 May 2021 15:53:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <ced9f20a-d420-6639-b041-710f7ec59613@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0295.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 711b21d6-c386-4099-1c78-08d90fd59b8d
X-MS-TrafficTypeDiagnostic: BYAPR03MB4246:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4246D78809CCC39CE1E7E639BA599@BYAPR03MB4246.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 36kCR2D6vnVjqJGr2gFXzCnB8/gQ39+EL+Oi/yW+p58jGz1LBpgY8xqPOLwvdSvWfwc+5r8z1tkEyZuX3OX38eOuweRK6gT5Qpg5UuHR3Ze4/DWYAt+4TCc7xe0jNJ6IIlqhzYJ8fvHttzo78vdBwIDKfFoY0i4zKpGMA40qZv8aWd6tBiTAs91dfzk/KWnOR6wfSceqxCxqWwIILxysR6cKiFP+uELHtShSyR4V5jW8Hq8YGF+XJz6amzCRuC6pKD6P5aPT9iHbwTWJ2/yB9Zo9M7bEbX70QiYYCHs5tCOKPvRt6SFVZ2cr00fOOfui3cRJv/nGXXEZ5E+393ovGWmlueWiHDRyvvk1mITA9n6heeZ9kEJqULiqSGd1EZi2+i9oB1cU47/HK2ZZO/eX480nsAvjG9JWdUpTD+r54xdm/PGMLaDTft1BZlQyxWy8UdAsDWFU9yjwaQJ9og3hWW6txYOtUrgdaqOc/NS4zPCPuyl1lrKu0NEWDEsy6+X/rXDp36SJFAScxBwf8184dimBkEKfRFNN8BOIWV2bZOmcFeUU7oFdMIuvFe0QlBP/RpAodmGOPWpQWQtJcuYhl1V9QRiYbOYcSql8EYzUXCFV4jP6abfw7Lv8Cwk36dilwZJ0rx6EjVTFuY/bsTJpOQlQKul4YWKYVzcTGOG2KgRhgApqofL2mmjIhsvJD57e
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(31686004)(83380400001)(16526019)(6916009)(31696002)(66556008)(54906003)(4326008)(6486002)(6666004)(38100700002)(86362001)(316002)(478600001)(16576012)(8936002)(66946007)(8676002)(956004)(2616005)(5660300002)(36756003)(2906002)(186003)(26005)(66476007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S29pWGJmUnJuYktNeHd4b250OEFYeTlLV3lhYURoQnlBRG03Z3l3em13VHpN?=
 =?utf-8?B?SmRET2lSQnRRYkJ1dGRTbThWUG1yTk9zMlM4R1FQbm53OC85eEw2dCtNdXVD?=
 =?utf-8?B?N05nNnYvUkpSb0xkZFk5QTRuVkxsQUVlOTVuRG1FdVN1QXF4cCs3NVIxRFVl?=
 =?utf-8?B?bk4xY3VhZXRXNjA2Szh2QXVUWmNlYVlxSlA4T3YxQng3dTI1S053eEJtbFc1?=
 =?utf-8?B?NEp4SEkzVmp0Uzg2T0MzQk5aQjJocjF2Ti9tNjI4QllDaU5HU3RWUXJTemZS?=
 =?utf-8?B?NVZkMlhXbysrd25kQVhDYWNkaWEvK2ROTDMwMWlCU3pKSTQ2NVIvdjNwWEVu?=
 =?utf-8?B?UmlLSHhsZ3UydFRBZlN2RXdUeTdsQituWlR1YllvRFIyellkRWovdFRNM05D?=
 =?utf-8?B?cXQ4SWxSK0RlbjNoZVZhSFZ3R2ZXVTUwaGptRnhJc2F6V3h4anAwTndiQytF?=
 =?utf-8?B?TnlVMUxjVElRMUFDRC9EMkR5ckxUMHFVSmtTemxCZkRZTmUyVGZoVnFVOEpk?=
 =?utf-8?B?QXNUaWpjcDR0N3JvR3hzY1NrbkdQei84UFlXSUxmZG5WYXNuZU5XMHZQYUFF?=
 =?utf-8?B?TFN6RUdEbU9CV1c5Z0NZeTAydmN2MWwzNTd0ZHNTRisrUDVlTmNFSDljNWdB?=
 =?utf-8?B?dUVLb2ROa2hFSkQ2czc3L09lY1crWmZSbG5UaVMxZ0NsQndnWkJVcDhQZmFR?=
 =?utf-8?B?UEIvNzY1clNlOUFYWEhiT0xTdmFHR210UVk1Y3RsRXVtcGg4UlQ2b3ZsKzBj?=
 =?utf-8?B?Y2lvei8xQmJYL2hJaWt1WGlMM283RUkrL1I3aUh4ZVl2ZXlETnRXU1dsaE1F?=
 =?utf-8?B?d0UwekV6ekxIZ0FiVzA5dWFKa2VCZnVWazBCQlRhUFZQbUxFSmdSQUtta1hq?=
 =?utf-8?B?c2cyT2pOa0MvNVY2TmNudldjYno0M011dW9UUGtUU0JVdStNTFB0Z21KeWdk?=
 =?utf-8?B?b2R2WXRxbGhsbTg1WC90RjBtaDRBYUFrd1oxeFZWSjErMjQ4cFRnVW1EQXFv?=
 =?utf-8?B?aElzRUZmSzB0WVBjWVJ4NlFCR0REaTYzVElVSEZBdUIwQWszZXRXeFdwY0xL?=
 =?utf-8?B?YVhzME1HTTBxaHFDWWQ2eExOT3FBeFpkOXNEcTdKWEYydytjN1dLL21QNHdO?=
 =?utf-8?B?SzJEaFFua1M0Z3g5VFV3dTJBTE5mUURITko1M083OU1JTWNSdVdibEd6V01U?=
 =?utf-8?B?dHQ4NURML0FQc2htdWpxbTJyWjNCZnVwZTZZbGg1Y0czcHROd1RMVTZEMUpq?=
 =?utf-8?B?UEhKTzlwQ1kzUHkwTCtFQ0pLT2lIaU9HU1BpUEJsVi81OVpyV3NqcmVMSnY0?=
 =?utf-8?B?SHNoK2lZVTdPdUIzS3B5bWJ6b1VIUE9CUUh5UXM5dEdZN0JrVGxESGFPdXdG?=
 =?utf-8?B?SEFRZHdTUjl6VDNIZjY1Y3FjVm5iTFVLVVN5eHhQOW50NXBkZWFhTFk0ZjB1?=
 =?utf-8?B?cFp1M1MrVlhGNGZxeHIvNjdYRFI5dlh1UHZYMldObU1TQ2ZXWlhBQzNlTzZ4?=
 =?utf-8?B?QnVNdUx2MTdFNWtoMWRXNUhaOWxVSXE3WWZDY3hYRVFzT1ErWUF4TUN5QjFy?=
 =?utf-8?B?VGw1cGs0MysxLzZrOGpIRHpzUEw0SEVUaXV0YnNRUFJZNDRFM3JiOVYzSUo3?=
 =?utf-8?B?Njh5YzdYdW9IQlk4U1NwNkM1Ti82M3BoOU9uZkdReDJQTklnN2c0OFAxTWFP?=
 =?utf-8?B?VWVORzFXN1BZbWdFRU0zeEh5VnJwVXNHVjVFUUhNNGd3cVQxVE9HQWFlb243?=
 =?utf-8?Q?Bk4c7LYhTsBywcH0ri7hc7LCq2HmkjdwoeefMrS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 711b21d6-c386-4099-1c78-08d90fd59b8d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 14:53:56.3012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wx3c4OpE7xY5sxDnsLoaqIYvWgaipwKcYAKhiego5+5PNpHHNkHMmQ2U/utGhW2CT1YqDZ+3UjMhNwJzjpFrBEE3aFFb7+oPoZRhycog5CM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4246
X-OriginatorOrg: citrix.com

On 05/05/2021 09:19, Jan Beulich wrote:
> On 04.05.2021 15:58, Andrew Cooper wrote:
>> On 04/05/2021 13:43, Jan Beulich wrote:
>>> I'm also not happy at all to see you use a literal 3 here. We have
>>> a struct for this, after all.
>>>
>>>>          p->xstate.xss_low   =3D  xstates & XSTATE_XSAVES_ONLY;
>>>>          p->xstate.xss_high  =3D (xstates & XSTATE_XSAVES_ONLY) >> 32;
>>>>      }
>>>> -    else
>>>> -        xstates &=3D ~XSTATE_XSAVES_ONLY;
>>>> =20
>>>> -    for ( i =3D 2; i < min(63ul, ARRAY_SIZE(p->xstate.comp)); ++i )
>>>> +    /* Subleafs 2+ */
>>>> +    xstates &=3D ~XSTATE_FP_SSE;
>>>> +    BUILD_BUG_ON(ARRAY_SIZE(p->xstate.comp) < 63);
>>>> +    for_each_set_bit ( i, &xstates, 63 )
>>>>      {
>>>> -        uint64_t curr_xstate =3D 1ul << i;
>>>> -
>>>> -        if ( !(xstates & curr_xstate) )
>>>> -            continue;
>>>> -
>>>> -        p->xstate.comp[i].size   =3D xstate_sizes[i];
>>>> -        p->xstate.comp[i].offset =3D xstate_offsets[i];
>>>> -        p->xstate.comp[i].xss    =3D curr_xstate & XSTATE_XSAVES_ONLY=
;
>>>> -        p->xstate.comp[i].align  =3D curr_xstate & xstate_align;
>>>> +        /*
>>>> +         * Pass through size (eax) and offset (ebx) directly.  Visbil=
ity of
>>>> +         * attributes in ecx limited by visible features in Da1.
>>>> +         */
>>>> +        p->xstate.raw[i].a =3D raw_cpuid_policy.xstate.raw[i].a;
>>>> +        p->xstate.raw[i].b =3D raw_cpuid_policy.xstate.raw[i].b;
>>>> +        p->xstate.raw[i].c =3D raw_cpuid_policy.xstate.raw[i].c & ecx=
_bits;
>>> To me, going to raw[].{a,b,c,d} looks like a backwards move, to be
>>> honest. Both this and the literal 3 above make it harder to locate
>>> all the places that need changing if a new bit (like xfd) is to be
>>> added. It would be better if grep-ing for an existing field name
>>> (say "xss") would easily turn up all involved places.
>> It's specifically to reduce the number of areas needing editing when a
>> new state, and therefore the number of opportunities to screw things up.
>>
>> As said in the commit message, I'm not even convinced that the ecx_bits
>> mask is necessary, as new attributes only come in with new behaviours of
>> new state components.
>>
>> If we choose to skip the ecx masking, then this loop body becomes even
>> more simple.=C2=A0 Just p->xstate.raw[i] =3D raw_cpuid_policy.xstate.raw=
[i].
>>
>> Even if Intel do break with tradition, and retrofit new attributes into
>> existing subleafs, leaking them to guests won't cause anything to
>> explode (the bits are still reserved after all), and we can fix anything
>> necessary at that point.
> I don't think this would necessarily go without breakage. What if,
> assuming XFD support is in, an existing component got XFD sensitivity
> added to it?

I think that is exceedingly unlikely to happen.

>  If, like you were suggesting elsewhere, and like I had
> it initially, we used a build-time constant for XFD-affected
> components, we'd break consuming guests. The per-component XFD bit
> (just to again take as example) also isn't strictly speaking tied to
> the general XFD feature flag (but to me it makes sense for us to
> enforce respective consistency). Plus, in general, the moment a flag
> is no longer reserved in the spec, it is not reserved anywhere
> anymore: An aware (newer) guest running on unaware (older) Xen ought
> to still function correctly.

They're still technically reserved, because of the masking of the XFD
bit in the feature leaf.

However, pondered this for some time, we do need to retain the
attributes masking, because e.g. AMX && !XSAVEC is a legal (if very
unwise) combination to expose, and the align64 bits want to disappear
from the TILE state attributes.

Also, in terms of implementation, the easiest way to do something
plausible here is a dependency chain of XSAVE =3D> XSAVEC (implies align64
masking) =3D> XSAVES (implies xss masking) =3D> CET_*.

XFD would depend on XSAVE, and would imply masking the xfd attribute.

This still leaves the broken corner case of the dynamic compressed size,
but I think I can live with that to avoid the added complexity of trying
to force XSAVEC =3D=3D XSAVES.

~Andrew


