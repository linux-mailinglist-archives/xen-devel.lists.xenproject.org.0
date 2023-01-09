Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9896662BD6
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 17:56:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473885.734721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEvQn-0003g4-Lv; Mon, 09 Jan 2023 16:55:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473885.734721; Mon, 09 Jan 2023 16:55:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEvQn-0003dU-I2; Mon, 09 Jan 2023 16:55:29 +0000
Received: by outflank-mailman (input) for mailman id 473885;
 Mon, 09 Jan 2023 16:55:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPNl=5G=citrix.com=prvs=36677a302=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pEvQm-0003dO-9G
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 16:55:28 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68f5307d-903e-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 17:55:26 +0100 (CET)
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jan 2023 11:55:22 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB7027.namprd03.prod.outlook.com (2603:10b6:a03:4e3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 16:55:19 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 16:55:19 +0000
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
X-Inumbo-ID: 68f5307d-903e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673283325;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=pATHQcznDD7E4YnvVRui+umjWBsKGx9P56qzl2XFL7s=;
  b=T4tJIHe6gqz9gl74eDe0DWf6MUZLf7CFkt+HsHyGeMKtbvNm6ll9xYez
   kOsq+B/lN73Pwd7TV8nTsGHPgJnDkMACCbGPzNuG43IKJJs10G9G3T5uW
   MzoMP4rE0HybmkF59iAS/FgmkyD3MEDoSzialx7wCqVN3CDWPaR399Dnf
   E=;
X-IronPort-RemoteIP: 104.47.56.175
X-IronPort-MID: 91786498
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:unsM9qBUjYjI+RVW/xHiw5YqxClBgxIJ4kV8jS/XYbTApDMh0WBWx
 jdMWW6CaKzfYTPyfI0ja9vi9UxXupKAzIQ2QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6p4GpA7wRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw3bhqXXEU7
 /ojJDkTLRze2OTm7K6+Vbw57igjBJGD0II3nFhFlGicJtF/BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI++xuvDW7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr6WwnOlBNNCfFG+3v5zwwas2m89MSFIfBi2oNqcmnGTAesKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwB6J4rrZ5UCeHGdsZj1Mdt0g8tM3TDoC1
 1mVktevDjtq2JWFRHTY+rqKoDeaPSkOMXREdSICVREC4dTovMc0lB2nczp4OKu8j9mwEjapx
 TmP9XE6n+9K0pNN0Lin91fahT7qvoLOUgM++gTQWCSi8x99Y4mmIYev7DA38Mp9EWpQdXHZ1
 FBspiRUxLpm4U2l/MBVfNgwIQ==
IronPort-HdrOrdr: A9a23:4Wti2K/ax8+Q1zoBBgZuk+DcI+orL9Y04lQ7vn2ZLiY4TiX4ra
 +TdZEgviMc5wx+ZJhNo7G90cu7MBDhHO9OgbX5VI3KNGOKhILCFvAB0WKN+UyFJwTOssJbyK
 d8Y+xfJbTLfD9HZB/BkWyFL+o=
X-IronPort-AV: E=Sophos;i="5.96,311,1665460800"; 
   d="scan'208";a="91786498"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGlAGjlDW6g/Gn/CR7frhd8ZnApQJxjrnIBFnK9n8kbjYzlyYjKff4q4Xs4l3KA0lKyjVJ9nkuJzSy0vT390KVKViZO76mM2MySHukuG2fultcwZUsWKg4ElZ++NTFtbSh88iGeOef8Rd3V+BMgDMsSsQbwgyWpG4VqFY9xbaq7CcwgNpcQcLmE54vS8P3JpmdDt7TbWPXf47+RofKujQz67ZdOvyjsn1PMKmZd2+we8qIt0OPHj9MsQiqTpQM4sgula/pe61o+zxZEDGgvonWfLbpGG+ainF1+4kqHetRLGA6pvBHWMPSE/lQoWOOYWkAw1y7YqL0we5x0CxxRsAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pATHQcznDD7E4YnvVRui+umjWBsKGx9P56qzl2XFL7s=;
 b=dCzKNwRkV2Tp0yxG/4/tXPOZsMwWlCkFcBsaBB4mRai+VLUzK/uHeCjnMdbh1lSrE8g83dFKnfX8sIS7iZ+oj083mK3RNGTBm/eaUcBV+ZmGhwNTqpb5QAFKFus5E4FHcom7jpf+An66qGNUJBGO+Xqod8uVyG0gl16pLEJ8bYwblv/URztNO8RG3j+GaTeAsqqRS9GQ4a3682Y+yiKM81aXG1qJvY9AsXtkcMaw2RIeuxV2okcNnnKmiWm1eAyJY9GNuKl6ARh08qmaJ0avKDpeiiIQDIS+7C8iX+EiOdyDADZBwXJMs9KSGkyac9m4myeyNHe7eG1sURoXplD62w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pATHQcznDD7E4YnvVRui+umjWBsKGx9P56qzl2XFL7s=;
 b=O/K1KIJHdxOj4zBbC/YYw2PHiH0ecBTGQyLBoBBq3UPl8FBLXjNIgNAKzXc1mJJHDbsuFXoGn32V7WAwq6w3ngKC7BS9Y32R6rAqgNFredxuGS4EehNUicFOhJ694aQjxW1B8Y3lyhKyT/Bh5TyxlhhVFDdQnGNhvuRd/8ElARk=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Kevin Tian
	<kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/6] x86/hvm: Context switch MSR_PKRS
Thread-Topic: [PATCH 3/6] x86/hvm: Context switch MSR_PKRS
Thread-Index: AQHX8mME5A98miRws0CbcM4WT1rTvaw83q0AglvS2wA=
Date: Mon, 9 Jan 2023 16:55:19 +0000
Message-ID: <83a08e78-cbee-8486-479a-5255c42e8239@citrix.com>
References: <20211216095421.12871-1-andrew.cooper3@citrix.com>
 <20211216095421.12871-4-andrew.cooper3@citrix.com>
 <6efed2d5-e7a0-139a-a2b3-6f0696f711d1@suse.com>
In-Reply-To: <6efed2d5-e7a0-139a-a2b3-6f0696f711d1@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB7027:EE_
x-ms-office365-filtering-correlation-id: 3d684fd2-1f24-4ef1-f117-08daf2624a4c
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 rIkqS7cfvhK9nD3zb3I1zF3dAZ06UgXJdwpPUU+Od8zGsRvZr9b6TNHIDETKzTD6wwlZfZgpSipHqbK1NL6iie8PAXke1i+IF0gXK5fOL8CN3I2Y1McTlWAaAXwUMujIrIdTgSrjJ3WQ2gNF3uwie0pw3t7PClERPp3Ovmcul6Vi/ce+wN7kYUnShu77Oj16acO2IMW6s0JV5RvauUXoeEJiZMYhx2oBvCTOgG9ahML9H5wXEtfq/syZUb7Rze9cVYbWExbBhxdM57qavl4aT+qIB/ilKgQfiVMYazkjmyDEi/Z1RsY7WCL9yfdK6ctY7NDGKWrbZBGE8hTkSQgeyS8FFkSfAbtAENloaRpxElwGBFkW2HE67jkbtPGg0earfp91MlpL1THyfEnFNcQPVsmLR12pJxnt91FlLGJHlZa5hXM4e3phsHJr3EahKR+kaXWDA1AlI42+C0ttFr8R4/ORbScwW7jvLSKoIj43SPAAQDhSqHLQTap75BvCTLvqn2Sy2WdQXe9pZ8soL9/pXXYG1GRVc53IvW2oSa1XHxWQuZ261nB/4TvoBlsDlRN9zyysr1vhHtW1U31daQ3unURCOIE3+hWOKyfMHi9TXwTQ9HRonEh8DOp1QIc5iE2XMq5OKGaV3VaWyrcOR4+yvfod4x2b8zUjWRD/yRVUbBwe91ddJklPxle59BUCGFoKUIoKmEB+LZIB8vL0Yqq4F4IpX+lbZg12Q8/eyHykp/KGV8r5x1QKKuPg40ZRbo3KtgE7KPn9fAr2ew5lfnDtbQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39860400002)(366004)(396003)(376002)(451199015)(66946007)(41300700001)(31686004)(8936002)(36756003)(5660300002)(2906002)(8676002)(6916009)(91956017)(64756008)(66446008)(66476007)(66556008)(76116006)(6512007)(316002)(71200400001)(54906003)(6486002)(478600001)(6506007)(53546011)(4326008)(186003)(26005)(2616005)(31696002)(86362001)(83380400001)(38100700002)(82960400001)(122000001)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MW0wbzRCVEgvYkk3VWQ1YWcwdTZtbndDMnJrMW5XV3hTdVNuVXdVYWRNNFZZ?=
 =?utf-8?B?OWNXU2VlK1FGdWhCRS93YmhlN3dscUxUbk9DVElKTnlYajRyb2wvV1E0TzJU?=
 =?utf-8?B?UjV3R21INzZFVGlMTWV1TzJJWm5oL1h4QzBMR2RVSHdGa01xNVR3Ym9mUXBp?=
 =?utf-8?B?bFZ1eVphRDBDT2VHRDM5SEJ2Y21peFIyY0ppcis1K2hyYmtzV0FMZVc3N0o0?=
 =?utf-8?B?MS9vNldVVzdYcXpSWlA3aEx3UXg2TFRaejhWNjdOVFJuVEE1cDZZR3N6WHVs?=
 =?utf-8?B?Q213RCtsNTlHRmloOVpjZ0NKODlEMUlFVEFYU2daYWROWHZESnY3Qm9QTE5v?=
 =?utf-8?B?WVpRbHFJT2tIanNMdjZHYjFQOEJLRFdFNEUxYmtMcE1PWEhzVGtzNEFqQzB3?=
 =?utf-8?B?cmZRbWhVQWxQYUw1MElWVWlXZkxYYlJvWHBVLy8rQUI0Z2U5dEhRT0p1amVw?=
 =?utf-8?B?alc0Q051VFhLSnFtbVB4RVl1dHU4RG0zZFJPRW9jV21OMlg1RFYyQW9RamNm?=
 =?utf-8?B?c0JIdHFNS3U5RjBlVmxEVXNXdXA4M2JXZU1FUHhlVWs0a2g4R0hmTkFYMDdY?=
 =?utf-8?B?ZjdKYlRhT3k5V0tPYlUwNXZPTWYwSU0vUDlKOUF1OENUQ3F6UE9yUlhGeUxs?=
 =?utf-8?B?aVZadEdraWpVa3VTTGlPUE51MXMzOU9RTlZlV0lucCtZREtZVm9sbXJ4VGto?=
 =?utf-8?B?K2RaL1N4U3ZiTXk4UzFSQTBkaEo5Uk9mdCtuTWV3YXllSDdNN3NXQTVleWZv?=
 =?utf-8?B?RGVTall3eUt5SzdmSHJzYVgvSStqRWxWQ2ZvWXhVdEY2dlRlbVIzWEw3RlhW?=
 =?utf-8?B?UnVlNktpajduZ3NoUEVWQ3lRL0lXeHIvYS80dWJJRG1QMGNLUkZZOVVTMElP?=
 =?utf-8?B?ejRuUjBnV1B0NjRvb09JM2xvYU5KSjhsZUtsamtzek5ZWU1tZkpIWlpGOW9p?=
 =?utf-8?B?ZzJuYTMyVzZRdGdwRWtHbys1TFFXaFhvMVpnejlRSkxkZW56d3V1YXZSaVY4?=
 =?utf-8?B?bjg1bS9hQXlLakxuZGZIQXFac0JvOXkzU096YkRQSTdCQWoyejA0d29weHJQ?=
 =?utf-8?B?WVV0ekc2UEMrcWF3Y01DdTY5bWFkN2t6TXJDZzlMM0E2dVpCTlFCTDVPREl2?=
 =?utf-8?B?MnlzVkU5N3NiWmsyaThpai9JVk8yTTBIZzEyZElEZVBuM2RkU1VNWGV6V3hO?=
 =?utf-8?B?dXNETTZjcy92QW5nbXRyREJwVFZ2aFhORkdCT1ZKWGZQclo2MkpCeDdCWVlP?=
 =?utf-8?B?SzlmNkR2blpQT2xWM3JoM1E1cG5ZR254VDM1d3Q0YWY1dVRFTGw0akd2bm92?=
 =?utf-8?B?TkNod2lkazY0dXgyQmtjTnBhVHExQk12Wmppd25PanptczhaQ3ZNdUphVmZL?=
 =?utf-8?B?VVJHdEVxVXN6QTYrN0NjWDFxSGZGNlhIVDc3SkVuODRmbCswZ3I4NzZyVTk4?=
 =?utf-8?B?Yk5OSnJobEc4eUZaNnU3anpnRWx4VmxoRGNwTEk0dkgvSzJXa1phVnBocUJX?=
 =?utf-8?B?d24wUXFUVTFqNXl6dC9TRVN0VGdMOHJuVzROUXo4MGFHb2w3QjRIU2hla3dt?=
 =?utf-8?B?SzF5UDM4NHpHeUFKNjRQdHpYSGFPSmhtZlAxMXoyR1dEUGNCbno0SlFDTEtW?=
 =?utf-8?B?WWU0SDJNbGNUckt1OCtHVVNFelV3c2VOZk9FeGpEYmpXMVh6MjNzNlBHWktS?=
 =?utf-8?B?dnFlVi9EYVkyUE1TNTJRUmE0TjVLcFBKVm9WalA2MldXSkpSMi82b0M3a1FJ?=
 =?utf-8?B?MFFyWUkyemcwOGpvSytPVFRmUk9waCszRFBoQTFVNkNFdmxma2hwWFlodnYz?=
 =?utf-8?B?VVZKamk1bUI3U3RtbzBvRDQ4dWZRWjBTRWY3SDFpaUlnSEsyeWRTTm9IQlo0?=
 =?utf-8?B?UWpvMHVYdDRQRGZXN1hWOFF0Zk05VFB2WXV5YWZBSm80cEFzT0VqUkJHbTV1?=
 =?utf-8?B?Q2prMit5K0dsVk5QZGhscXdITjJmOHd5YkpCeERNOVVESjRJTklValk3aXU5?=
 =?utf-8?B?RWZYd2JnbW80cDUycmpMN0w0YkNZdVpRY1pybG9GWmlNZE14bW9xVDhmL0FS?=
 =?utf-8?B?QUpVRTJzSWVYVWNsNHVzZ1lHTnRaWEJXUnorQ0FuNVRFd1drUDdJQWNYaFJx?=
 =?utf-8?Q?dvb/cviaDf3tGW1QroK/jJD1N?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6FBFE4C814FB8F40A325845BAAF94C8D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ai3Oek7kiBXsaMqxSnBy898he84sZFr9eI7YszqsVyCpEjYOlXIS/1m08FBfBG9yqIy77PnIaTMG276l/48Rzm5cNRMme0FLvC6gJGeVdjZGi3QkYBmv+4SnKcU7ck+DqPErM0tjkLmyj0THLTB+aeg+lfI4LOoNUYEIAcIZY9R4iWQ1rLq2vkhVpkRsr/JiJHyOdpDVa+PK+A87LKpr3K+zIFmJNu36iVA8lLuqBFVODJsiIOaMyNdKWKcJmVGdk4n4Hs0w/+TSMekeAEyJ/uCJWWVnxOUYmKM8CLCt1b47F1+9Ns2HE6CqtBVma9hnE+XgQM5g8l3sIXY8ttnOsbMajueoyY4EW8QG2aRYdlz6jhsGVz2mn8VhkKrCp26+XK9qKZSAprVXTJE5UywcVeyVgsF8mtFBygHF0wY2++eNz8cZnE/nvsX4+qhjMY762Ehk3o+r/tB0Z3k5WQiZcRldCNnJrpmuHEhlhPJwVVjdjZHVkimnGDSIBIzEBl7n4c0o+IZFtUDF1216zsE8Owb5EvLMbUMtbqnCXxpur4S1amhoSV0/7qE/7vyQZcEKbPr5reAIOEEBJvr4NXH0Cz9CjR4H8iPjVoeG1YmwB/lmqNB3ajV2fmRL+m9ajnXsdBd/N1IC8S6+VgsS++CxReJvhqg6q3NPSwZ8W7eYpMsV9RZsucx7UWEHVYoi8Z0k2M1jcEB0YclDMeo8z509kYip9HBegSUOg0u9Ii35RF64wpLv8p1iVJoT6oouvLdfCfIC6/XH32JGlcXPX+OpXJLGCaA/FIkuKRl0ucVvJOhCkHFoJztm3rhbeXHKdC7VfSvs1qACkyWTVsFIzSSx/kss7Zw6X/YWo9ZXfYkv4/Q=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d684fd2-1f24-4ef1-f117-08daf2624a4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 16:55:19.3307
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W1x6LmHIW5Hr3X3gkmuddVbjnoUJJ/XsUB8q3uaHKKaFIzBc+k3jMhHmfRL2+Hz0f1zhy7JvOdLGnnbxWn3hswanDnAcP5gSzaXlbUzir1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7027

T24gMjEvMTIvMjAyMSAxMTo1NiBhbSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE2LjEyLjIw
MjEgMTA6NTQsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBAQCAtNDIsNCArNDUsNDkgQEAgc3Rh
dGljIGlubGluZSB2b2lkIHdycGtydSh1aW50MzJfdCBwa3J1KQ0KPj4gICAgICAgICAgICAgICAg
ICAgICA6OiAiYSIgKHBrcnUpLCAiZCIgKDApLCAiYyIgKDApICk7DQo+PiAgfQ0KPj4gIA0KPj4g
Ky8qDQo+PiArICogWGVuIGRvZXMgbm90IHVzZSBQS1MuDQo+PiArICoNCj4+ICsgKiBHdWVzdCBr
ZXJuZWwgdXNlIGlzIGV4cGVjdGVkIHRvIGJlIG9uZSBkZWZhdWx0IGtleSwgZXhjZXB0IGZvciB0
aW55IHdpbmRvd3MNCj4+ICsgKiB3aXRoIGEgZG91YmxlIHdyaXRlIHRvIHN3aXRjaCB0byBhIG5v
bi1kZWZhdWx0IGtleSBpbiBhIHBlcm1pdHRlZCBjcml0aWNhbA0KPj4gKyAqIHNlY3Rpb24uDQo+
PiArICoNCj4+ICsgKiBBcyBzdWNoLCB3ZSB3YW50IE1TUl9QS1JTIHVuLWludGVyY2VwdGVkLiAg
RnVydGhlcm1vcmUsIGFzIHdlIG9ubHkgbmVlZCBpdA0KPj4gKyAqIGluIFhlbiBmb3IgZW11bGF0
aW9uIG9yIG1pZ3JhdGlvbiBwdXJwb3NlcyAoaS5lLiBwb3NzaWJseSBuZXZlciBpbiBhDQo+PiAr
ICogZG9tYWluJ3MgbGlmZXRpbWUpLCB3ZSBkb24ndCB3YW50IHRvIHJlLXN5bmMgdGhlIGhhcmR3
YXJlIHZhbHVlIG9uIGV2ZXJ5DQo+PiArICogdm1leGl0Lg0KPj4gKyAqDQo+PiArICogVGhlcmVm
b3JlLCB3ZSByZWFkIGFuZCBjYWNoZSB0aGUgZ3Vlc3QgdmFsdWUgaW4gY3R4dF9zd2l0Y2hfZnJv
bSgpLCBpbiB0aGUNCj4+ICsgKiBleHBlY3RhdGlvbiB0aGF0IHdlIGNhbiBzaG9ydC1jaXJjdWl0
IHRoZSB3cml0ZSBpbiBjdHh0X3N3aXRjaF90bygpLg0KPj4gKyAqIER1cmluZyByZWd1bGFyIG9w
ZXJhdGlvbnMgaW4gY3VycmVudCBjb250ZXh0LCB0aGUgZ3Vlc3QgdmFsdWUgaXMgaW4NCj4+ICsg
KiBoYXJkd2FyZSBhbmQgdGhlIHBlci1jcHUgY2FjaGUgaXMgc3RhbGUuDQo+PiArICovDQo+PiAr
REVDTEFSRV9QRVJfQ1BVKHVpbnQzMl90LCBwa3JzKTsNCj4+ICsNCj4+ICtzdGF0aWMgaW5saW5l
IHVpbnQzMl90IHJkcGtycyh2b2lkKQ0KPj4gK3sNCj4+ICsgICAgdWludDMyX3QgcGtycywgdG1w
Ow0KPj4gKw0KPj4gKyAgICByZG1zcihNU1JfUEtSUywgcGtycywgdG1wKTsNCj4+ICsNCj4+ICsg
ICAgcmV0dXJuIHBrcnM7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBpbmxpbmUgdWludDMyX3Qg
cmRwa3JzX2FuZF9jYWNoZSh2b2lkKQ0KPj4gK3sNCj4+ICsgICAgcmV0dXJuIHRoaXNfY3B1KHBr
cnMpID0gcmRwa3JzKCk7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCB3cnBr
cnModWludDMyX3QgcGtycykNCj4+ICt7DQo+PiArICAgIHVpbnQzMl90ICp0aGlzX3BrcnMgPSAm
dGhpc19jcHUocGtycyk7DQo+PiArDQo+PiArICAgIGlmICggKnRoaXNfcGtycyAhPSBwa3JzICkN
Cj4gRm9yIHRoaXMgdG8gd29yaywgSSB0aGluayB3ZSBuZWVkIHRvIGNsZWFyIFBLUlMgZHVyaW5n
IENQVSBpbml0OyBJDQo+IGFkbWl0IEkgZGlkbid0IHBlZWsgYWhlYWQgaW4gdGhlIHNlcmllcyB0
byBjaGVjayB3aGV0aGVyIHlvdSBkbyBzbw0KPiBsYXRlciBvbiBpbiB0aGUgc2VyaWVzLiBBdCBs
ZWFzdCB0aGUgdmVyc2lvbiBvZiB0aGUgU0RNIEknbSBsb29raW5nDQo+IGF0IGRvZXNuJ3QgZXZl
biBzcGVjaWZ5IHJlc2V0IHN0YXRlIG9mIDAgZm9yIHRoaXMgTVNSLiBCdXQgZXZlbiBpZg0KPiBp
dCBkaWQsIGl0IHdvdWxkIGxpa2VseSBiZSBhcyBmb3IgUEtSVSAtIHVuY2hhbmdlZCBhZnRlciBJ
TklULiBZZXQNCj4gSU5JVCBpcyBhbGwgdGhhdCBDUFVzIGdvIHRocm91Z2ggd2hlbiBlLmcuIHBh
cmtpbmcgLyB1bnBhcmtpbmcgdGhlbS4NCg0KV2hpbGUgdHJ5aW5nIHRvIGFkZHJlc3MgdGhpcywg
SSd2ZSBub3RpY2VkIHRoYXQgd2UgZG9uJ3Qgc2FuaXRpc2UgUEtSVQ0KZHVyaW5nIENQVSBpbml0
IGVpdGhlci4NCg0KVGhpcyB3aWxsIGV4cGxvZGUgaW4gYSBmdW4gd2F5IGlmIGUuZy4gd2Uga2V4
ZWMgaW50byBhIG5ldyBYZW4sIGJ1dA0KbGVhdmUgUEtFWSAwIHdpdGggQUQvV0QsIGFuZCB0cnkg
YnVpbGRpbmcgYSBQViBkb20wLg0KDQpBcyBzb29uIGFzIHdlJ3ZlIGZ1bGx5IGNvbnRleHQgc3dp
dGNoZWQgaW50byBhIHZDUFUgY29udGV4dCwgd2UnbGwgcGljaw0KdXAgdGhlIDAgZnJvbSBYU1RB
VEUgYW5kIGRvIHRoZSByaWdodCB0aGluZyBieSBkZWZhdWx0Lg0KDQp+QW5kcmV3DQo=

