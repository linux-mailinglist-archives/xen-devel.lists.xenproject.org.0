Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1825C4B51B5
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:35:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272212.467008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbVv-00076u-9o; Mon, 14 Feb 2022 13:35:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272212.467008; Mon, 14 Feb 2022 13:35:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbVv-000748-6n; Mon, 14 Feb 2022 13:35:35 +0000
Received: by outflank-mailman (input) for mailman id 272212;
 Mon, 14 Feb 2022 13:35:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJbVt-00073h-EG
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:35:33 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa59ae9b-8d9a-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 14:35:32 +0100 (CET)
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
X-Inumbo-ID: fa59ae9b-8d9a-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644845732;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=oNwQtLuu98X4SQwPPIlMBgTUYnA+4NuDfMaIFjB1k3k=;
  b=H4/2O4W/BLd4ACJZ18hrKESmdFF8I4Mi1iy6dOQrhD4wbVTkLc153R1J
   HzD6jCOtsUK/1mpmu5dhaQmdmX0v5Dbtqeej/HlZRUuuZu9iwDTnIWQPM
   kYs0CboCetC1NtDEC6Cads6A9ZZ97jcaW3U0qL02sbhz3x1eufWtKfJ1n
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4NFVUWzNbz1zl9wW0Cva4tIfHZqNhw5wHJG/jMORtFexvPxs2swAUCLT6xMGh1FhNt9HsNSaSt
 6CkAn6GG+4/JIM+2S64MS3ast4QCAj/MdoGZxQzXyjswE3QJQAdm869TCMjyzDsBO6DsMUTh1F
 CsOZ9X2KpV1T8RlwxeumHI6i1FPHRY4h+ywVVbmxNWYAJttLfMVkd03rsyS0BWgORApg7fUtGI
 DoXVRw6P/pVS2Dezh+ZUQuh8kWpFt+FqH3Ppw33wYxMZ0Dgh0NvQ+EeDkyhS5cwLO6M8OE+Sri
 KePF641MjcYRI5DXKoMmI4XL
X-SBRS: 5.1
X-MesageID: 63594975
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:HCGzc6mYkTY7zlpUF1aimnno5gxUIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIaXWuCP/mNN2bxetsiOoWxoEsB75CGxtRmT1RvrHszQSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2Nc02YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 IRtsKOfY14PB5L3gtQdXh9fSwxvI4QTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ62DN
 pZINmcHgBLoTV4SIEceUJAE2+b1nHftVTF49XOZqv9ii4TU5FMoi+W8WDbPQfSaSMMQkkuGq
 2bu+2XiHgpcJNGZ0SCC8H+nmqnIhyyTcJ0WPK218LhtmlL77m4ZBQASVFC7ieKkkUP4UNVaQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfIBM+gFxyvU7JPr2BypBmUCSWZsecIP4ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud04WtcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9HygbQ4xawZRGp8crVml
 CJa8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9IdwPsGEjeR8waZxsldrVj
 Kj741052XOuFCHyMf8fj3yZV6zGMpQM5fy6D6uJP7Kik7B6dROd/TEGWKJj9zuFraTYqolmY
 c3zWZ/1VR4yUP07pBLrF7Z1+eJ6nUgWmDKMLa0XOjz6iNJyklbOEuxbWLZPB8hkhJ65TPL9r
 YoBaZvQlkk3vS+XSnC/zLP/5GsidBATLZv3t9ZWZqiEJA9nE3smEPjf3fUqfIkNokifvrygE
 qiVVhAKxVzhq2fALAnWOHlvZKm2BcR0rG4hPDxqNlGtgiBxbYGq5aYZVp02Ybh4q7Azka8qF
 6EIK5eaH/BCajXb4DBBP5Pzm5NvKUawjgWUMiv7PDVmJ8x8RxbE88PPdxf08HVcFTK+sMYz+
 uXy1g7STZcZaR5lCcLaNKCmw1+r5CBPk+NuRUrYZNJUfRy0ooRtLiXwiN4xIt0NdkqflmfLi
 V7ODE5B9+fXooIz/N3Yvoy+rt+kQ7lkA05XP2jH9rLqZyPUyXWunN1bW+GScDGDCG6toPe+Z
 f9Yxu3XOeEcmAoYqJJ1FrtmwP5s59broLMGnA1oEG+SMgauA7JkZHKHwdNOputGwboA4Vm6X
 UeG+997P7SVOZy6TA5NdVR9NunTh+sJnjTy7OguJBSo7SB6y7OLTEFOMkTekydaNrZ0bNsoz
 OpJVBT6MOBjZs7G6uq7sx0=
IronPort-HdrOrdr: A9a23:Ust8WancpII7tEyAAB4q//ixv6rpDfOKimdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcIi7SdW9qXO1z+8Q3WGIVY3SHTUOy1HYU72KirGSgwEIeheOuNK1sJ
 0AT0EQMqyJMbEXt7eZ3OD8Kadc/DDlytHquQ699QYXcegCUcgJhG0Vanf5LqQ1fng9OXNQLu
 vA2iMtnUvGRZ1jVLXDOpBzZZmkmzSkruOCXTc2QzocrCWehzKh77D3VzKC2A0Fbj9JybA+tU
 DYjg3Q/MyYwrOG4y6Z81WWw4VdmdPnxNcGLteLkNIpJjLljRvtTJh9WoeFoCs+rIiUmRMXeZ
 j30lMd1vZImjXsl1KO0ELQMs7boW4TAkrZuBilaL3Y0JfErXwBepB8bMliA2XkAgIbzaBBOe
 Rwrj6kXtNsfGD9dG6W3am5azh60kWzunYsiugVkjhWVpYfcqZYqcgF8FpSC4poJlO21GkLKp
 gkMCjn3ocdTbpaVQGvgkB/hNi3GngjFBaPRUYP/sSTzjhNhXh8i08V3tYWkHsM/I80D8As3Z
 WKDo140LVVCsMGZ6N0A+kMBcOxF2zWWBrJdGafO07uGq0LM2/E75T3/LI27ue3f4Fg9up/pL
 3RFFdD8WIicUPnDsODmJVN7xDWWW24GS/gz8lPjqIJ8oEUhICbeBFrZGpe5vdIks9vdPEzAc
 zDSq6+K8WTWVfTJQ==
X-IronPort-AV: E=Sophos;i="5.88,368,1635220800"; 
   d="scan'208";a="63594975"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6TIlZenqg5KawbFShSAiukHuzygQYqESB0Z2bFj0X6HSH6Rm9FlVwJsyR0n++i70Ob4xea2CD79MtA0gRL8s3vD/llM7ad+Umsc1lt4boqWL9N6076RmkgrKz5sO3CGtyxhhaVbVb046fRO13BZy4uebh4v+IrmEgcA+SI0Zn/Ba8+09ZBfZxgs5cBpm0GzgggMnxStxVMpSlvObmiEOSkklKA5FcAEYAOdnoS5noF0EgZwVWAoRK7GoauwPteFa8M2r89BoBoFOap0+YFvEW3KHmfN2Be26YnDodjAM5nLcf7Rbpje/WHQA07QWYUojEawcKOUbNWsPfG/JMOulg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNwQtLuu98X4SQwPPIlMBgTUYnA+4NuDfMaIFjB1k3k=;
 b=Xa/qOlG0fVs7PO8BXySs/nTndbmM2JaGPOzWepQoDGAzeBBSIhDPRQziPeK5+zcIo6WjJNBNdIbzzFo366YW+F8sAWAlkO9KSkZQTAD81VPpfiA8u9KzQHSHVR4ggpJmOGGzoZcOVR6yro01Ou1dSG66jbXarqOioTchJKOVNU6nCRn9HOHvYkjiPQUIPXL/a5DvBEVXuBRUQkDsiWwHAQA33Cdc7Gcgtp4RsJbseLXZRo3zJCxbNUCCUTNu4CgP1ggI/xT5/V5O9IVRNwvRex3XzKc3cVH/6zFi3ngslSTZACJfasE514YP7lO02dFNnpqBYVS1Z+pw1a8gE5YdFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNwQtLuu98X4SQwPPIlMBgTUYnA+4NuDfMaIFjB1k3k=;
 b=k014ji+RMTphOhA5RNHkMDhzOSaIM1CgpguwXaJOQzV0gSzISTgMe5q5k3KNTxQFho7xiM0nezeSBNSin2VQ6WsOWktfWCrppvSMNaSHxeIaVi5V1MekGO9mfTsbCrhh9lEsNugiJD40bFl4L4JXHuE2I3fVIyb++OKpca+A+v0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 5/7] x86/hvm: Use __initdata_cf_clobber for hvm_funcs
Thread-Topic: [PATCH v2 5/7] x86/hvm: Use __initdata_cf_clobber for hvm_funcs
Thread-Index: AQHYIaJjsOAx5ctsj06lom2YGua3HKyTBU+AgAAG24A=
Date: Mon, 14 Feb 2022 13:35:23 +0000
Message-ID: <2e28c474-6778-431a-9e40-8cc0668224c5@citrix.com>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
 <20220214125632.24563-6-andrew.cooper3@citrix.com>
 <785653bd-db3a-df22-f2a0-c20b3f3bf8c1@suse.com>
In-Reply-To: <785653bd-db3a-df22-f2a0-c20b3f3bf8c1@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17f893fb-916b-4e47-6795-08d9efbeda64
x-ms-traffictypediagnostic: CY4PR03MB2872:EE_
x-microsoft-antispam-prvs: <CY4PR03MB2872A147D5BB555939E87277BA339@CY4PR03MB2872.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Yk49TnUHvpJhQB2pySXH/WSh+K27uvajrd/FFTBjVGknrr14axRnycTt+X7KLtWV2UJ4jmTPWn5SaLliod6dGvk9FYUkJR9LcVYHvA4sPNoUuJJzZJ3Im10IlfbJGfXVChzJHTi4eAHFCahJdmJpeuUtjFcv7Ep2S8bO7Zgfh/WeyIqdaNUii28MnrG3kMpjcz3P1KwECVi5v3q6DZAEUNnArJNuAIv9l04+zT9IVxvYDLhxa9uhWgZc9fkTbq/2kdD1/QmCB/YqBpSH9BEKho5FoSNr7hUcB51SIC00nOrd1HCQWgI7OFJUtEFwjuuHOgjphmYam6oqZsSy+UHdjf3Cnc0wi5isjQH2AxEfTbxcelyCAVKvYN0Zx3i2kxNblwXxPMU16T4HXUoulhfHr4fuKQV/8pxF4wb+9KNV3si/qRzECXa/2WOSg4Wr3wM+UIs9bmQvsjw9iOt1/GXsnJ7GVSApRhPt6pd0kJFXod7NCUx/Yh/0z1H94Ai5Rs18275xMeByOfMo7jcZYDc1R/b5qBTZMgCjVyLVSI+PnbPDDvFjpr7utrEHe9ZK8pJIp0p0zb4m45h4JEBT6uWhi3ps824Z+lcmr+IbjrqReZT4mf9wC0tGvyE+mQF2kggBsNV8P9h9Ty8WFdYwgQjzJWcvyByqjGAaRrDrOYuHNSHnI+mTY+/PoXonUEY5L9Fay94AugIIeADxRyDI0fqa+2Fy7nwtBGYpue5tNNgC+i8C3yMdSfCNG4MEWRrkh+zepOs/dzF5gaNRwYE9rO5YSg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(2616005)(5660300002)(31696002)(2906002)(186003)(26005)(8936002)(38070700005)(76116006)(66556008)(53546011)(4326008)(8676002)(64756008)(66446008)(66476007)(82960400001)(66946007)(122000001)(38100700002)(6506007)(508600001)(316002)(6916009)(54906003)(91956017)(86362001)(31686004)(6512007)(6486002)(71200400001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?azZ5OC85SmV3cC9YSGlLUExGKzE1UUVVQWZkWlh5L0lTK3owcmE3MGhTNlhl?=
 =?utf-8?B?emg3NVRiYWFCek5OK01sbW5IV2VrUjNhYzRuYWRZNEs4RDJkSWt0b0I3cjJz?=
 =?utf-8?B?Z1Vaa3dwa0FHNXZ3alg5eVlOa2VVSWREc3hGSHhESW8xY1lDK3FlNXVFcEhw?=
 =?utf-8?B?VERvdjJETVJmQU0rKzBkcHlWcXlySVhZOThzaUJVcFRiUVhwdWpOYUc3a0tS?=
 =?utf-8?B?YXp0aXZMQmhUWS9lajB0Qk1RYUo5eXdWTjRPUUtjdnljeGErUEk1TnNYNHo2?=
 =?utf-8?B?OWg4SFk4K2lodG1zYkJ1VGpQSUtoU0ZqSUQ2aFdCRXRmR3JTZ2FRa2VqWnVy?=
 =?utf-8?B?a3g3SG95U1J6K1JTTFRGNlRFNUlBeFVPN2dRUzlmUGpsUmR1MnJBUTJ4T0lV?=
 =?utf-8?B?WlF5K3VUYUUvVEdSSURsTlFYRkNNNTdqejhNaXFFdWdzbS80YW95QzJPSnI4?=
 =?utf-8?B?Sno2NytjSzVMNGhqYjRQOUQwSUtKaXFUN3hMU0pmL2dYY3hya2l2dFMxcHY2?=
 =?utf-8?B?elZua3lsT0Zjc2FVVXFVSHdwOXlZUkhpVUo1clB5NkJRTmMxUTkvei9YaWdH?=
 =?utf-8?B?Q1VtZ1BZZlVsM2ovenJZTDY0K3kvbUhzZFlqMTRQRlB1dUMwVDZuNWsrd05v?=
 =?utf-8?B?K1kwbXI3aGVIWlhxa3dyamU5N3NwSjZoUCt1ZGRjdEY2MGNWaVRRZ0tML0h5?=
 =?utf-8?B?b2RhZy83STZrMlp6RjZYZnhLNTlFUlkyNmFqKzVHWFJJNUhqQXVNSDRYTmNU?=
 =?utf-8?B?R3FSemlsMEQxN205eEplbjhTQ0F6bTNrL2MxeE9SREdJQTdneGN4em54VFp3?=
 =?utf-8?B?TGY3L0JvRlZhUUdzaEtiazdRbHNTYXpqK3hNc25nNk1SMGdkdnpWMHZJdXdM?=
 =?utf-8?B?U2M5WFF3Tk5lcHNXNnRITUlzQjgySFFQbG9Zazd6S1l1QU1YRnFnenRWQml0?=
 =?utf-8?B?L3FEMkhoeUZXajRVVjQ0NHREaWtabEg1b2tBdThxemdaaWFPMkY5eEEzYXU0?=
 =?utf-8?B?TEdIWWZlZmRiT1RLM3hMbnBERS9CZjlUTWJlR3ZIVlZFbi95MkMrYXlsK1l0?=
 =?utf-8?B?bDMrcld3Mm40d0FERmliWXRSK0xKd2Z0UGo2UHozTXFaNmdrQjBDaGNsZTFk?=
 =?utf-8?B?aTRMeTJNKzhCdTc5SmpoNjdSWlZQdGtteXl0OHVyS3JIUWN6S0drRUlBd3Jq?=
 =?utf-8?B?bUc2bmFQTXRvZFY0a284Y0doUG9DSlA5S0ovbFlRNm5GUkRRNk1mS1JFcG1h?=
 =?utf-8?B?WW9kZXA5RFU5VU11UEZNYmdrVTRteGhxS1U0aEVJNERFUkRZWENjVHIyNGFR?=
 =?utf-8?B?S3ZSZ3o5NGViVEdjTEk4WDFSWFJwajAvZy9ocW44azNCay9td1AzK0JNeXBN?=
 =?utf-8?B?bTVBVEFDanQwWXBTSDgrMEN6L09odUNwZjFjZnByTHU3RVZzSzZXQjhFQlhE?=
 =?utf-8?B?Yi9HQURpTjN3bjVjUHZucEIrSEVzVnFHNGRtUlE2TEdDeWtZcGFUbXliY2hH?=
 =?utf-8?B?VHhWb1FLaUhHM0QvcTR6ZFpJdWZ1YmFUM004MWhHQjkyVTJJcTFkcVRnbmhh?=
 =?utf-8?B?VzRaOHdGMzl6cVg5NUs2WXc4bzBxZUFLZWZkUEk5bWhxcEVvUWYvTEN5K3Mz?=
 =?utf-8?B?Njd0VTRZWVNrdEQvenNucHpHaWI1TTBUZXVhWllUVE5pUjlieU9yMFhRSUZS?=
 =?utf-8?B?dXdjMjNidGQ0aTRid25xMUpFYnBKSVpOK3FJNVdmWGJLWkRDVE5nTngvNVpP?=
 =?utf-8?B?QVcralBIZXNvaFppWEhNYm5hVk1RSDlhTGdlcTJRcisxb3BiZUZiMW9UazV2?=
 =?utf-8?B?c09OYVViUksvSkJjN1hxdzBrOVh6cXpDMGlNOHFSc3h2VlR5bXVrcVNMMjRC?=
 =?utf-8?B?dDVwSzFRVHNwanhETlFwamxaY0ZaemJWKzZoUHlpN09kT1hMZk9yQkJZaE5h?=
 =?utf-8?B?SEdoRGtFZlQyNUZTb1pkNGRLdlhQSU55OTdzSU0zeW9YazBQQS9ubE1FL2pI?=
 =?utf-8?B?dS9uK1pFaVZjUVRwM2k3cG5qMnkvN0ZBWll6RWZMOHZIUzFzVnRhOE8zUW1R?=
 =?utf-8?B?VXc3UWg0aXB3MWNkeGVvVjhVcUhPa3QxNUFIdDZXZUNwWFN3RVpwcm55VVRl?=
 =?utf-8?B?RXlvWkM5Z0xsc1U2VmdiT0ZaQlBqOHBFTEZaSHNTQ0RLN2dTdEdaUEVIaUpG?=
 =?utf-8?B?UEltb2x4Nnp6bkhMRlBDT2xPVmovaG1YL2VKditPZ3ZlNk1SRng5Uk01N1dk?=
 =?utf-8?B?SmNFYUR0WWFGNVprbmRDTzRQdVJ3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <26A2254FBD64054290AD8F9DDD9DE962@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f893fb-916b-4e47-6795-08d9efbeda64
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 13:35:23.5848
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z9i2QgF1a5U0hAWt6XsYM5yj9KuaOl2MUK+JaV463JsI/ZP7OdSQFFo3cyblBzttfZ3FQyj1CLMl0iF7mqLkIsS7QLl7GuR0dNTw4S19ksA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2872
X-OriginatorOrg: citrix.com

T24gMTQvMDIvMjAyMiAxMzoxMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE0LjAyLjIwMjIg
MTM6NTYsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h2
bS5jDQo+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jDQo+PiBAQCAtODgsNyArODgsNyBA
QCB1bnNpZ25lZCBpbnQgb3B0X2h2bV9kZWJ1Z19sZXZlbCBfX3JlYWRfbW9zdGx5Ow0KPj4gIGlu
dGVnZXJfcGFyYW0oImh2bV9kZWJ1ZyIsIG9wdF9odm1fZGVidWdfbGV2ZWwpOw0KPj4gICNlbmRp
Zg0KPj4gIA0KPj4gLXN0cnVjdCBodm1fZnVuY3Rpb25fdGFibGUgaHZtX2Z1bmNzIF9fcmVhZF9t
b3N0bHk7DQo+PiArc3RydWN0IGh2bV9mdW5jdGlvbl90YWJsZSBfX3JvX2FmdGVyX2luaXQgaHZt
X2Z1bmNzOw0KPiBTdHJpY3RseSBzcGVha2luZyB0aGlzIGlzIGFuIHVucmVsYXRlZCBjaGFuZ2Uu
IEknbSBmaW5lIHdpdGggaXQgbGl2aW5nIGhlcmUsDQo+IGJ1dCBoYWxmIGEgc2VudGVuY2Ugd291
bGQgYmUgbmljZSBpbiB0aGUgZGVzY3JpcHRpb24uDQoNCkkgY291bGQgc3BsaXQgaXQgb3V0LCBi
dXQgd2UgY291bGQgcHJvYmFibHkgbWFrZSAyMDAgcGF0Y2hlcyBvZg0KInNwcmlua2xlIHNvbWUg
X19yb19hZnRlcl9pbml0IGFyb3VuZCwgbm93IHRoYXQgaXQgZXhpc3RzIi4NCg0KPg0KPj4gLS0t
IGEveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0v
c3ZtL3N2bS5jDQo+PiBAQCAtMjUxMyw3ICsyNTEzLDcgQEAgc3RhdGljIHZvaWQgY2ZfY2hlY2sg
c3ZtX3NldF9yZWcoc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGludCByZWcsIHVpbnQ2NF90IHZh
bCkNCj4+ICAgICAgfQ0KPj4gIH0NCj4+ICANCj4+IC1zdGF0aWMgc3RydWN0IGh2bV9mdW5jdGlv
bl90YWJsZSBfX2luaXRkYXRhIHN2bV9mdW5jdGlvbl90YWJsZSA9IHsNCj4+ICtzdGF0aWMgc3Ry
dWN0IGh2bV9mdW5jdGlvbl90YWJsZSBfX2luaXRkYXRhX2NmX2Nsb2JiZXIgc3ZtX2Z1bmN0aW9u
X3RhYmxlID0gew0KPj4gICAgICAubmFtZSAgICAgICAgICAgICAgICAgPSAiU1ZNIiwNCj4+ICAg
ICAgLmNwdV91cF9wcmVwYXJlICAgICAgID0gc3ZtX2NwdV91cF9wcmVwYXJlLA0KPj4gICAgICAu
Y3B1X2RlYWQgICAgICAgICAgICAgPSBzdm1fY3B1X2RlYWQsDQo+PiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L2h2bS92bXgvdm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYw0KPj4g
aW5kZXggNDFkYjUzOGE5ZTNkLi43NThkZjMzMjE4ODQgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJj
aC94ODYvaHZtL3ZteC92bXguYw0KPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMN
Cj4+IEBAIC0yNDczLDcgKzI0NzMsNyBAQCBzdGF0aWMgdm9pZCBjZl9jaGVjayB2bXhfc2V0X3Jl
ZyhzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgaW50IHJlZywgdWludDY0X3QgdmFsKQ0KPj4gICAg
ICB2bXhfdm1jc19leGl0KHYpOw0KPj4gIH0NCj4+ICANCj4+IC1zdGF0aWMgc3RydWN0IGh2bV9m
dW5jdGlvbl90YWJsZSBfX2luaXRkYXRhIHZteF9mdW5jdGlvbl90YWJsZSA9IHsNCj4+ICtzdGF0
aWMgc3RydWN0IGh2bV9mdW5jdGlvbl90YWJsZSBfX2luaXRkYXRhX2NmX2Nsb2JiZXIgdm14X2Z1
bmN0aW9uX3RhYmxlID0gew0KPj4gICAgICAubmFtZSAgICAgICAgICAgICAgICAgPSAiVk1YIiwN
Cj4+ICAgICAgLmNwdV91cF9wcmVwYXJlICAgICAgID0gdm14X2NwdV91cF9wcmVwYXJlLA0KPj4g
ICAgICAuY3B1X2RlYWQgICAgICAgICAgICAgPSB2bXhfY3B1X2RlYWQsDQo+IFdoaWxlIEknZCBs
aWtlIHRvIHJlLXJhaXNlIG15IGNvbmNlcm4gcmVnYXJkaW5nIHRoZSBub24tcG9pbnRlciBmaWVs
ZHMNCj4gaW4gdGhlc2Ugc3RydWN0dXJlIGluc3RhbmNlcyAoanVzdCBjb25zaWRlciBhIHNlcXVl
bmNlIG9mIGVub3VnaCBib29sDQo+IGJpdGZpZWxkcywgd2hpY2ggZWZmZWN0aXZlbHkgY2FuIGV4
cHJlc3MgYW55IHZhbHVlLCBpbmNsdWRpbmcgb25lcw0KPiB3aGljaCB3b3VsZCBhcHBlYXIgbGlr
ZSBwb2ludGVycyBpbnRvIC50ZXh0KSwgc2luY2UgZm9yIG5vdyBhbGwgaXMgb2theQ0KPiBhZmFp
Y3Q6DQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNCkkg
c2hvdWxkIHByb2JhYmx5IHB1dCBzb21ldGhpbmcgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIHRvby7C
oCBJdCBpcyBhDQp0aGVvcmV0aWNhbCByaXNrLCBidXQgbm90IChJTU8pIGEgcHJhY3RpY2FsIG9u
ZS4NCg0KfkFuZHJldw0K

