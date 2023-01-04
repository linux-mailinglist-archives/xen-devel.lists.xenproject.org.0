Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E94B65DC35
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 19:35:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471375.731206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD8ap-0000N2-72; Wed, 04 Jan 2023 18:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471375.731206; Wed, 04 Jan 2023 18:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD8ap-0000LH-2a; Wed, 04 Jan 2023 18:34:27 +0000
Received: by outflank-mailman (input) for mailman id 471375;
 Wed, 04 Jan 2023 18:34:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tpAs=5B=citrix.com=prvs=3612a7559=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pD8an-0000LA-LV
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 18:34:25 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67a0e035-8c5e-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 19:34:23 +0100 (CET)
Received: from mail-dm3nam02lp2040.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jan 2023 13:34:19 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6564.namprd03.prod.outlook.com (2603:10b6:806:1cb::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 18:34:15 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 18:34:15 +0000
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
X-Inumbo-ID: 67a0e035-8c5e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672857263;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=R8d0creBhCbzEKKsTWf735ZH/0haJVM6D8OEXMR4+qw=;
  b=gYWfxQcy0G9GUF0RR+SKIHoa3+OCwfNMLz8UlI+BT0rn1C1VHeT4m0rg
   C2fGY843CsNI5Iue/gpRWQ7+QKdSyay1veAaDCx2CuChuq/QptmX6Q+Ri
   j8vWpyam2zWrV3kB881pvv7WGW8nzq6eip/RY7tIhVrS9ek8aN87c4HJr
   I=;
X-IronPort-RemoteIP: 104.47.56.40
X-IronPort-MID: 91188611
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:hg5ODqKDICh4Ngy/FE+RGpQlxSXFcZb7ZxGr2PjKsXjdYENSg2YGn
 2VLXWiFP/jZNGb3Ldh2bozl9xlX6pPQn9FiHlRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mhA5wRiPawjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5WEGBMz
 vU4JwsWURaGlsmx0b6nWvZz05FLwMnDZOvzu1lG5BSBV7MKZMuGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dppTSLpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eexHqrCNxLTdVU8NZkx0Si51JUOScmWGX8pd7ktU63Bc1mf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmW0bbd6QudAmkCTxZCZcYguctwQiYlv
 neWm/v5CDopt6eaIVqf67OVoDWaKSUTa2gYakcsXQYDptXuvow3phbOVcp4Vr64iMXvHjP9y
 CzMqzIx74j/luYO3qS/uFzC2DSlo8CTShZvvlmPGGW48gl+eYipIZSy7kTW5upBK4DfSUSdu
 H8DmI6V6+Vm4YyxqRFhid4lRNmBj8tp+hWB6bKzN/HNLwiQxkM=
IronPort-HdrOrdr: A9a23:sHQ4HqCNGKCuMsvlHehLsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+VAssQIb6Km90ci7MAThHPtOjbX5Uo3SODUO1FHIEGgA1/qV/9SDIVyYygc178
 4JHMZD4bbLfDtHZLPBkWyF+qEbsbu6Gc6T5dv2/jNId0VHeqtg5wB2BkKwCUttXjRLApI/Cd
 61+tdHjyDIQwVeUu2LQl0+G8TTrdzCk5zrJTQcAQQ81QWIhTS0rJbnDhmj2AsEWT8n+8ZozY
 GFqX2y2kyQiYD29vbu7R6d032Qoqqu9jJ3Pr3AtiHSEESstu/nXvUgZ1TIhkFMnAjm0idQrD
 CLmWZoAy070QKqQkil5RTqwAXuyzAo9jvrzkKZm2LqpYjjSCs9ENcpv/MqTvL10TtRgDhH6t
 M540uJ855MSR/QliX04NbFExlsi0qvuHIn1eoelWZWX4cSYKJY6dV3xjIgLL4QWCbhrIw3Gu
 hnC8/RoP5QbFOBdnjc+m1i2salUHg/FgqPBkICpsuW2T5Lm20R9Tps+OUP2nMbsJ4tQZhN4O
 rJdqxuibFVV8cTKblwAe8QKPHHe1AlgSi8Tl56DW6Xa53vYUi91qIfyI9FmN2XRA==
X-IronPort-AV: E=Sophos;i="5.96,300,1665460800"; 
   d="scan'208";a="91188611"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KuPpe2N4LpV9NsqS2hQgfbPOddkz3Lb/GAOGc720ADEMycfCBqyPfxUhneOd0nCMZFP4nSxM0ejy5Tvy9+x+XrSB4ZwN5alI27y+ynPe+nitkb455xrHgPp4oz7UyAMRYVsO6xNvs0TngZFNo+IJZp/T26DRvu19B8dKxiiaYCq2W6BD3rImdl72c8HOoIaaxhhZzZjxrjJltPADWH4hqlwfUBYgTYkx3IO64mX0EGnEmzb/P8PSphNYnWCgeu1j6eY6ylKnKdPxL++mo1d2qhXPGEtoChoCL/U2eucM6kDMTYO4JhpHfCM4V/GDM+RSI5SuyvUijQg3CSWBrAd2Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8d0creBhCbzEKKsTWf735ZH/0haJVM6D8OEXMR4+qw=;
 b=eovIpsR0nUclfxDFFkw+AjnZPzQP8OCFmq6wjVjQzdpo8DTJrOFKzpvRTJaD95+a9eAUVRkwp076Tx6nlBNyxdW0zIwXVfswcj+1g69e1Zj4niIOKRaviSk4YAEFrkFXax0wncnOayyPK8gS9cSZbXZkdhsvtjDHeEvtE1ibm2AUf7ZTCoAuUikBnpQCBHSJowEuMHiZaMrO3kRIhw2n+BAe1GBZgX+kCeS5/vhqBNqUUlJkLgQtCqj5bhe8sy7rm5jvBe7wZeADJpgN7O6MvGwueaGt9y7RVd9Vb/n/gWKqWgOU3tutQ5ePnN8S2so+L20tgALYz0KcG1KMIXUNjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8d0creBhCbzEKKsTWf735ZH/0haJVM6D8OEXMR4+qw=;
 b=aqhPD0si6R2AJFvo2iDDQmyMpdfuj8Tr8wpqm6wV7C566QJdryKScpHejYDAU3h8HxyFQXRxdMSZ+BAIzBzQf3ed11vQ7jGYMd71mCLTItcC+65bpor89kgcKKISCrlXVXtrYpoqVMNLLss06qCYllqD7J2BxljGo361qwQXmvo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 4/4] xen/version: Introduce non-truncating XENVER_* subops
Thread-Topic: [PATCH 4/4] xen/version: Introduce non-truncating XENVER_*
 subops
Thread-Index: AQHZH69eYU4qCMuPJUaHOPPUV+yM+a6OfdiAgAAZEwA=
Date: Wed, 4 Jan 2023 18:34:14 +0000
Message-ID: <9c9cedd5-cca7-95d4-00bb-f34a56de2695@citrix.com>
References: <20230103200943.5801-1-andrew.cooper3@citrix.com>
 <20230103200943.5801-5-andrew.cooper3@citrix.com>
 <a0cb9c83-dc4d-5f03-0f65-3756fadfde0b@suse.com>
In-Reply-To: <a0cb9c83-dc4d-5f03-0f65-3756fadfde0b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SA1PR03MB6564:EE_
x-ms-office365-filtering-correlation-id: c93bb995-222b-4f94-3c3a-08daee824816
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 38LE06HUUS/tohxVoExBUWoR+GhC+aaUpzJOw13JA+zttx/zAB60KnWDV9Pls2scxgO8d4oSYdhDhGwjrJQDYc50gUtVkLP8E+iTanAMA090/GhRGJS/l3D05pS8BePKv6GekRprumYlMSKA1ekL8y2tGWKnqHBn1RQYBev5A1R1rRKr/shIn2KmcuntiLlUUk3+ODfaG9u8X4PojKJDdk+9CMenfRlMCw25m12Or/WdpDdAQhbMEH2tSV2K5XSjyVaLqgdO+f9DZvC9quFO36Zi150PFjg/6WHlkL1qn2Mgh21KKUnregTHlCdanu4tk3FiOXxhjeZrO/3OFx9AV1v7G6pIuawe2RfnUg01cDSpXYBjUZ6BfaHzO01kHZaqfeh/+o/G8tZGJbiYUdBm9SgMxHO6yBOwejG0jDEGBGNDR/tp4UtsEepupy5QID2lpyiRVDGlXY/EBNepO79w59GJ4B7n6S/6NTX/wk9+oXC/q81dLyn8wibuOz1qFLRTCKEY2/OlJEx+2uzJ8hS2uzavGUERUNp12SsGpKuNvvvnKwx9jw07SkyxkXwKvHk2C4nm7fpGoiYxg9Yl5P0Hk0hFJmDsCsgT1/123kVMiZXyvqXfwklPFaD2HaSNhNwuqHtzl+P7A5bz5Uj6sPtoJ9ZfTozaUjb7FXqWy3x26ZqoqEuX8m1aP0J+qJduEWpnKWdgO+lOAlLeBwa5z4Tt827iQJaYoLNAbrO2JxGtpMno+WX6fTLneuS/TYP3hhlJ1cfo1azlbaSiqx+DuE9bAQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199015)(83380400001)(82960400001)(122000001)(8936002)(38100700002)(4326008)(66946007)(38070700005)(8676002)(86362001)(31696002)(5660300002)(66476007)(2906002)(76116006)(66556008)(66446008)(64756008)(41300700001)(26005)(6512007)(91956017)(6506007)(186003)(53546011)(54906003)(6916009)(71200400001)(316002)(6486002)(2616005)(478600001)(31686004)(66899015)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dUorUnFMNk1ibk00a1dKa2JoSUxpcnhNK25Wd0NVWHJXM1BYUENlVzh1MGVZ?=
 =?utf-8?B?dG51KzdvcVlmSzVIcFU1QnlwQXhYckhja2VIdHBkakNvbmV2cGhRcnF1Z3dT?=
 =?utf-8?B?QldIb0pvOGVVaVpNK0E1ZkJYVGRCeW02VE5FSzBWVE93d2l1Y3p1RFNaOVg1?=
 =?utf-8?B?N051VHBSVHBKdnNKaHlwd0hMeGYzSWlDTEprMnFSaTRRQjFoSGNWWWRPRHFG?=
 =?utf-8?B?dTcxQitwRXpIKzNYdmVwSzZ2ZmdVZWY3ZXJRc0lHTVZWSmxtN3hzYkdmWmNT?=
 =?utf-8?B?Q0l3Uzg1U2J4a2E3ZDJQdjM1UWptRjEya3hKWG9tZkorQkNCRkZOS2xmQTR6?=
 =?utf-8?B?NjVyNiszLzFnK01iY3JxNlhtN2VqTjYvcHJ4ck5MdmNZNUlQUlhhYU9JRWJm?=
 =?utf-8?B?ZWFGMkYvQm1WYkhYT0ZGODJHNHY4NldhNEM5cGRMaUpabHFiYjM3YXdXQzlv?=
 =?utf-8?B?Z2VIQjB4Yk0xUm0xRGtvQnl6Nm84M3ZyeVdxYzRzbUo1MDQ4WHlPTnFZVEIv?=
 =?utf-8?B?c1hvRlBvYjFrbUJ5by9QYmVDQ2UrNkRsZEk4MWhIVkRydVk0UGlVdE0rbHZM?=
 =?utf-8?B?aUU3VUhkcHFzM2xsSDNMOXhxU0wvMXNwUHVONUxXbmtMTE5WV0JWREY0UUFS?=
 =?utf-8?B?MmN4dDFFU3BaZnBYWCtvTFcrKzVZWEVvOXVNR2RPUHB3M0ppSnR3djd4VlJN?=
 =?utf-8?B?dWFoR25Yc1FVeElGYm9LY0h2TkJQMHRxRU1TZERwZllqL3c1ck5QWFlqR2tl?=
 =?utf-8?B?Vnl3Q01mUURlb24xZERHQXI2SGErZm94dmZ5YUg3cG01RVhEY3laM2N3bU95?=
 =?utf-8?B?NEYwU1VkNkNBcnJWUzkrSmNLalJkVnZQSzlwTDVyOU5lUUJOOHFvQ2liQWJU?=
 =?utf-8?B?L0FseUtUNGZYUEg5VE5ZRU1QQzRaWFJkWGQ0eGhJTnlpMzNkS0Fvd1krcGdC?=
 =?utf-8?B?Qzl3ZUxkNk5HdjVFQ3U1RkF1OGxoNTE0anJ2Vm1SOU5MZUYwMlo5cGl0YlZ1?=
 =?utf-8?B?em5tQXB0SE1pM2xPVG45MG5HaE5MbGFLTFpBeVc1OEZvWTdrd0JrYzNoWHZi?=
 =?utf-8?B?bEJNMDRqdkRtVlFndzZ1OWk2Ujg0NkNvQjNxWVIvSEFBRW9PMzN1MWQ1RW05?=
 =?utf-8?B?TS9GS21XeWs2NlptbjNPZ3JMNnlDb29LenZEcFhCQ2VsMnhSdzhYbDByd3FW?=
 =?utf-8?B?UCszY0RpcndMNnR0U2pLU1hCbVpJR0IyeEp5YXp2QTZjNUpxeUd0Qjh2bndv?=
 =?utf-8?B?ckIrOGdvK1B2SkNyTDJvVjhwYjBtb1BFY0N6VEkwZ1Nrekl0S25RclExZ2xU?=
 =?utf-8?B?cjVaMDBodTBoU2JZdHVXSWNuc2tXeGd6OVFPc0tyVlpaYmxMWVlvRnl1cE1U?=
 =?utf-8?B?TDZ1QzluelZuZmZnempSSkVicWFVdm4yY1M3bTFBZEMxSGJHOGFQUDZrdThY?=
 =?utf-8?B?clhtRFV2Z3pmMEpzTFIrbXVjbW5sM0FDM0hTZUxPd1BlVHpHeFZLSFdsdTlJ?=
 =?utf-8?B?WitENEpkNFB2US8rRkFMZFNOakQ1NC95WVdJTUF2SVhZTDhjbUZKNHpjSWo5?=
 =?utf-8?B?TWdiZGRRcTlEVDN1Z29PUTRuTHRMY1BhdGdVUXVwSlRoL0RXU0RFYlhqZUhS?=
 =?utf-8?B?bHlmcnZqUS9hNlBQQmxvV1JuL2ovYW9yUDhTT0dBMEI1RGFzTFBvUXRLSmRU?=
 =?utf-8?B?S2t2VFMwTDZCaWJPYy9YV0dCbnRrZWdBcFVIVXFnNG5YcXE1a0JNMk94YW5R?=
 =?utf-8?B?OGZhaWp2MFVBcWhPQ29rTVA5aXgrdzV3SUxRUFlVbXNDTjArYk04M0FDUGRt?=
 =?utf-8?B?VFpZVXBmbnVUUDJlSW94d3ZtdlNIUS8wY0J0bldpVFk5elB4TlBlN0RIeXh4?=
 =?utf-8?B?R1FhcC9rV1BnSDJuSldqdVBMRXpiOEZXblhSVkMvZkEwd3ZMK0Y3TC9ZcTl1?=
 =?utf-8?B?R0c4bk9wN3N4aHZET25QazQ5TzNqQ3Z1bjRnT0JINFNSemxRbVVQWVJQQUx0?=
 =?utf-8?B?cE9DV3ByODJCUkJ6M0sxdnltMURDeFFQUkdhQnZyV0UzV2JOdlR1ajhDeGpn?=
 =?utf-8?B?YU9JN2Z3QzVaNVB3S3kyTUE5bkhlb1dvY2owK2xJTkF0N3J1QUs4ODFuVGs4?=
 =?utf-8?Q?ARMDxtLQBVV0wEN83K62ZZ1uJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <13F53D7107A7664C82EAB7BF14044A34@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6GlldlbtsgKibT2Jrai+8R6qA+OH3HhHJbZ9MpJJmOWA6D21FoIWFEVnXsRQTJWKhfW9YQ/yi8iew9SlWkLnB4r5WrzBp42cokxJPTsTo/hWqE7NSjIA+GmFRAeK5EGtRmqc18O8w/xp/0T/UrrujR8GwMPsQ2+BsIELwC7ahh4mnBlHBlHiWxpz89rJwtMZszZRmEvuPRtqLHdM/H+y4Y+A+BQ3CS26sH2C+9f7asPtNNx++Rvj3ggqCyfHaRkz1od+M80lzgplFXqJ7KTsyL50XjqRcjykQq2ScETPq8oZ/rB1Y3PjcbIz7NFAAwGe7x3RBMnzKK91wElhLGApArL3VsGnIGmhJIN2G/YbY2KdX8X8jnPcLyxikQod6onGpp0crgzzSLdjBkGhMJYlU4xHkwzTS7J5rHUxGw4pM7RMvOl+pYvTWyFmUFOka3P+PJ+Ag8d6B4+I3nONBft60B0GFL3NsQ4GVw6PmZU5fB1Cti7iQfp6eES8j8pFe44ZYDP+5ndFWOOMWWssmnlL96kL4aerWDJmIViMvQxzq9nx09nYTvDAKYHNEusQFdFno5bGzvE2PDDgr+NDVjLLgQ71WyVkiNWwA/Q8c5/bj3Te2OuQjY1Wpwr8YxJjv/F/Qmmd8YnvHSA9CMjJy2CC8IlQOWCUOF+NrUo/sEhxUTH23xuwR/zv6fjY+ZhyLCgNflzPYR/02ryyKaeRZwCLSE6YhwrbnMPui0zLFc5TgH//NXEmtzdEuPQ+xY62IqLj9lk28crQPBhMd5wIgetkDqLT77FyogJ8doyjeZync42KIakd1nN1an7xb+1KcAPW1O/itsxh+ndPBhaIbP3S877GiJ/c5hcxScNyv/IfiAg3xf/6yLyOgiJ70yw5UeOE
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c93bb995-222b-4f94-3c3a-08daee824816
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2023 18:34:14.8453
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nR5FhHbv7AG2urwwjUxQxFMEHpab9irJRbtaT7tB/ybV5iuPb017RLxMZ6aqjLJou/4VW8We3vNJE98ORQ3bOjTePAjW5ekXjPmH44bjpdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6564

T24gMDQvMDEvMjAyMyA1OjA0IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDMuMDEuMjAy
MyAyMTowOSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IFJlY2VudGx5IGluIFhlblNlcnZlciwg
d2UgaGF2ZSBlbmNvdW50ZXJlZCBwcm9ibGVtcyBjYXVzZWQgYnkgYm90aA0KPj4gWEVOVkVSX2V4
dHJhdmVyc2lvbiBhbmQgWEVOVkVSX2NvbW1hbmRsaW5lIGhhdmluZyBmaXhlZCBib3VuZHMuDQo+
Pg0KPj4gTW9yZSB0aGFuIGp1c3QgdGhlIGludmFyaWFudCBzaXplLCB0aGUgQVBJcy9BQklzIGFs
c28gYnJva2VuIGJ5IHR5cGVkZWYtaW5nIGFuDQo+PiBhcnJheSwgYW5kIHVzaW5nIGFuIHVucXVh
bGlmaWVkICdjaGFyJyB3aGljaCBoYXMgaW1wbGVtZW50YXRpb24tc3BlY2lmaWMNCj4+IHNpZ25l
ZC1uZXNzLg0KPiBXaGljaCBpcyBmaW5lIGFzIGxvbmcgYXMgb25seSBBU0NJSSBpcyByZXR1cm5l
ZC4gSWYgbm9uLUFTQ0lJIGNhbiBiZSByZXR1cm5lZCwNCj4gSSBhZ3JlZSAidW5zaWduZWQgY2hh
ciIgaXMgYmV0dGVyLCBidXQgdGhlbiB3ZSBhbHNvIG5lZWQgdG8gc3BlbGwgb3V0IHdoYXQNCj4g
ZW5jb2RpbmcgdGhlIHN0cmluZ3MgdXNlIChVVEYtOCBwcmVzdW1hYmx5KS4NCg0KV2VsbCwgaXQg
ImZ1bmN0aW9ucyIgYXMgZmFyIGFzIEFTQ0lJIGlzIGNvbmNlcm5lZCwgYnV0IEkgd291bGRuJ3Qg
c2F5DQp0aGF0IHdhcyBmaW5lIGZvciBhbiBBQkkuDQoNClRoZSBjb21tYW5kIGxpbmUgY2FuIHJl
YXNvbmFibHkgaGF2ZSBub24tQVNDSUkgY2hhcmFjdGVycyB0aGVzZSBkYXlzLsKgDQooYXMgY2Fu
IHRoZSBjb21waWxlIGluZm9ybWF0aW9uLCBidXQgSSBpbnRlbnRpb25hbGx5IGRpZG4ndCBjb252
ZXJ0IHRoZW0NCnRvIHRoaXMgbmV3IGZvcm1hdCkuDQoNClVURi04IGlzIHByb2JhYmx5IHRoZSBz
ZW5zaWJsZSB0aGluZyB0byBzcGVjaWZ5LCBpZiB3ZSdyZSBnb2luZyB0byBtYWtlDQphbnkgc3Rh
dGVtZW50Lg0KDQo+DQo+PiBBUEkvQUJJIHdpc2UsIFhFTlZFUl9idWlsZF9pZCBjb3VsZCBiZSBt
ZXJnZWQgaW50byB4ZW52ZXJfdmFyc3RyaW5nX29wKCksIGJ1dA0KPj4gdGhlIGludGVybmFsIGlu
ZnJhc3RydWN0dXJlIGlzIGF3a3dhcmQuDQo+IEkgZ3Vlc3MgYnVpbGQtaWQgYWxzbyBkb2Vzbid0
IGZpdCB0aGUgcmVzdCBiZWNhdXNlIG9mIG5vdCByZXR1cm5pbmcgc3RyaW5ncywNCj4gYnV0IGlu
ZGVlZCBhbiBhcnJheSBvZiBieXRlcy4gWW91IGFsc28gY291bGRuJ3QgdXNlIHN0cmxlbigpIG9u
IHRoZSBhcnJheS4NCg0KVGhlIGZvcm1hdCBpcyB1bnNwZWNpZmllZCwgYnV0IGl0IGlzIGEgYmFz
ZTY0IGVuY29kZWQgQVNDSUkgc3RyaW5nIChub3QNCk5VTCB0ZXJtaW5hdGVkKS4NCg0KPj4gQEAg
LTQ2OSw2ICs0NzAsNjYgQEAgc3RhdGljIGludCBfX2luaXQgY2ZfY2hlY2sgcGFyYW1faW5pdCh2
b2lkKQ0KPj4gIF9faW5pdGNhbGwocGFyYW1faW5pdCk7DQo+PiAgI2VuZGlmDQo+PiAgDQo+PiAr
c3RhdGljIGxvbmcgeGVudmVyX3ZhcnN0cmluZ19vcChpbnQgY21kLCBYRU5fR1VFU1RfSEFORExF
X1BBUkFNKHZvaWQpIGFyZykNCj4+ICt7DQo+PiArICAgIGNvbnN0IGNoYXIgKnN0ciA9IE5VTEw7
DQo+PiArICAgIHNpemVfdCBzeiA9IDA7DQo+PiArICAgIHVuaW9uIHsNCj4+ICsgICAgICAgIHhl
bl9jYXBhYmlsaXRpZXNfaW5mb190IGluZm87DQo+PiArICAgIH0gdTsNCj4+ICsgICAgc3RydWN0
IHhlbl92YXJfc3RyaW5nIHVzZXJfc3RyOw0KPj4gKw0KPj4gKyAgICBzd2l0Y2ggKCBjbWQgKQ0K
Pj4gKyAgICB7DQo+PiArICAgIGNhc2UgWEVOVkVSX2V4dHJhdmVyc2lvbjI6DQo+PiArICAgICAg
ICBzdHIgPSB4ZW5fZXh0cmFfdmVyc2lvbigpOw0KPj4gKyAgICAgICAgYnJlYWs7DQo+PiArDQo+
PiArICAgIGNhc2UgWEVOVkVSX2NoYW5nZXNldDI6DQo+PiArICAgICAgICBzdHIgPSB4ZW5fY2hh
bmdlc2V0KCk7DQo+PiArICAgICAgICBicmVhazsNCj4+ICsNCj4+ICsgICAgY2FzZSBYRU5WRVJf
Y29tbWFuZGxpbmUyOg0KPj4gKyAgICAgICAgc3RyID0gc2F2ZWRfY21kbGluZTsNCj4+ICsgICAg
ICAgIGJyZWFrOw0KPj4gKw0KPj4gKyAgICBjYXNlIFhFTlZFUl9jYXBhYmlsaXRpZXMyOg0KPj4g
KyAgICAgICAgbWVtc2V0KHUuaW5mbywgMCwgc2l6ZW9mKHUuaW5mbykpOw0KPj4gKyAgICAgICAg
YXJjaF9nZXRfeGVuX2NhcHMoJnUuaW5mbyk7DQo+PiArICAgICAgICBzdHIgPSB1LmluZm87DQo+
PiArICAgICAgICBicmVhazsNCj4+ICsNCj4+ICsgICAgZGVmYXVsdDoNCj4+ICsgICAgICAgIEFT
U0VSVF9VTlJFQUNIQUJMRSgpOw0KPj4gKyAgICAgICAgYnJlYWs7DQo+PiArICAgIH0NCj4+ICsN
Cj4+ICsgICAgaWYgKCAhc3RyIHx8DQo+PiArICAgICAgICAgIShzeiA9IHN0cmxlbihzdHIpKSAp
DQo+PiArICAgICAgICByZXR1cm4gLUVOT0RBVEE7IC8qIGZhaWxzYWZlICovDQo+IElzIHRoaXMg
cmVhbGx5IGFwcHJvcHJpYXRlIGZvciBlLmcuIGFuIGVtcHR5IGNvbW1hbmQgbGluZT8NCg0KSG1t
LsKgIEdvb2QgcG9pbnQuwqAgQWxsIGNhbiBpbiBwcmluY2lwbGUgYmUgZW1wdHkuDQoNCkluIHdo
aWNoIGNhc2UgSSB0aGluayBJJ2xsIHB1dCB0aGUgLUVOT0RBVEEgaW4gdGhlIGRlZmF1bHQgY2Fz
ZSBhbmQgaGF2ZQ0KYSByZXR1cm4gMCBmb3IgdGhlIHN6ID09IDAgY2FzZS4NCg0KPj4gKyAgICBp
ZiAoIHN6ID4gSU5UMzJfTUFYICkNCj4+ICsgICAgICAgIHJldHVybiAtRTJCSUc7IC8qIENvbXBh
dCBndWVzdHMuICAyRyBvdWdodCB0byBiZSBwbGVudHkuICovDQo+IFdoaWxlIHRoZSBjb21tZW50
IGhlcmUgYW5kIGluIHRoZSBwdWJsaWMgaGVhZGVyIG1lbnRpb24gY29tcGF0IGd1ZXN0cywNCj4g
dGhlIGNoZWNrIGlzIHVuaWZvcm0uIFdoYXQncyB0aGUgZGVhbD8NCg0KV2VsbCBpdHMgZWl0aGVy
IHRoaXMsIG9yIGEgKGNvbWF0ID8gSU5UMzJfTUFYIDogSU5UNjRfTUFYKSBjaGVjaywgYWxvbmcN
CndpdGggdGhlIGlmZGVmYXJ5IGFuZCBwcmVkaWNhdGVzIHJlcXVpcmVkIHRvIG1ha2UgdGhhdCBj
b21waWxlLg0KDQpCdXQgdGhlcmUncyBub3QgYSBDUFUgdG9kYXkgd2hpY2ggY2FuIGFjdHVhbGx5
IG1vdmUgMkcgb2YgZGF0YSAod2hpY2ggaXMNCjRHIG9mIEwxZCBiYW5kd2lkdGgpIHdpdGhvdXQg
c3VmZmVyaW5nIHRoZSB3YXRjaGRvZyAoZXNwZWNpYWxseSBhcyB3ZSd2ZQ0KanVzdCByZWFkIGl0
IG9uY2UgZm9yIHN0cmxlbigpLCBzbyB0aGF0J3MgNkcgb2YgYmFuZHdpZHRoKSwgbm9yIGRvIEkN
CmV4cGVjdCB0aGlzIHRvIGNoYW5nZSBpbiB0aGUgZm9yc2VlYWJsZSBmdXR1cmUuDQoNClRoZXJl
J3Mgc29tZSBib3VuZGFyeSAocHJvYmFibHkgZmFyIGxvd2VyKSBiZXlvbmQgd2hpY2ggd2UgY2Fu
J3QgdXNlIHRoZQ0KYWxnb3JpdGhtIGhlcmUuDQoNClRoZXJlIHdhbnRzIHRvIGJlIHNvbWUgbGlt
aXQsIGFuZCBJIGRvbid0IGZlZWwgaXQgaXMgbmVjZXNzYXJ5IHRvIG1ha2UNCml0IHZhcmlhYmxl
IG9uIHRoZSBndWVzdCB0eXBlLg0KDQo+DQo+PiArICAgIGlmICggZ3Vlc3RfaGFuZGxlX2lzX251
bGwoYXJnKSApIC8qIExlbmd0aCByZXF1ZXN0ICovDQo+PiArICAgICAgICByZXR1cm4gc3o7DQo+
PiArDQo+PiArICAgIGlmICggY29weV9mcm9tX2d1ZXN0KCZ1c2VyX3N0ciwgYXJnLCAxKSApDQo+
PiArICAgICAgICByZXR1cm4gLUVGQVVMVDsNCj4+ICsNCj4+ICsgICAgaWYgKCB1c2VyX3N0ci5s
ZW4gPT0gMCApDQo+PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+ICsNCj4+ICsgICAgaWYg
KCBzeiA+IHVzZXJfc3RyLmxlbiApDQo+PiArICAgICAgICByZXR1cm4gLUVOT0JVRlM7DQo+PiAr
DQo+PiArICAgIGlmICggY29weV90b19ndWVzdF9vZmZzZXQoYXJnLCBvZmZzZXRvZihzdHJ1Y3Qg
eGVuX3Zhcl9zdHJpbmcsIGJ1ZiksDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RyLCBzeikgKQ0KPj4gKyAgICAgICAgcmV0dXJuIC1FRkFVTFQ7DQo+IE5vdCBpbnNlcnRpbmcg
YSBudWwgdGVybWluYXRvciBpcyBnb2luZyB0byBtYWtlIHRoaXMgc2xpZ2h0bHkgYXdrd2FyZCB0
bw0KPiB1c2UuDQoNCk5vdCByZWFsbHkuwqAgSXQgbWF0Y2hlcyBob3cgYnVpbGQtaWQgY3VycmVu
dGx5IHdvcmtzLCBhbmQgZm9yY2VzIHRoZQ0KY2FsbGVyIHRvIHVzZSBwcm9wZXIgdGFpbmVkLXN0
cmluZyBkaXNjaXBsaW5lLg0KDQpUbyBzYWZlbHkgcHJpbnRrKCkgaXQsIGFsbCB5b3UgbmVlZCBp
czoNCg0KcmMgPSB4ZW5fdmVyc2lvbihYRU5WRVJfJFgsICZzdHIpOw0KaWYgKCByYyA8IDAgKQ0K
wqDCoMKgIHJldHVybiByYzsNCnByaW50aygiJSouc1xuIiwgcmMsIHN0ci5idWYpOw0KDQo+PiBA
QCAtMTAzLDYgKzEyNiwzNSBAQCBzdHJ1Y3QgeGVuX2J1aWxkX2lkIHsNCj4+ICB9Ow0KPj4gIHR5
cGVkZWYgc3RydWN0IHhlbl9idWlsZF9pZCB4ZW5fYnVpbGRfaWRfdDsNCj4+ICANCj4+ICsvKg0K
Pj4gKyAqIENvbnRhaW5lciBmb3IgYW4gYXJiaXRyYXJ5IHZhcmlhYmxlIGxlbmd0aCBzdHJpbmcu
DQo+PiArICovDQo+PiArc3RydWN0IHhlbl92YXJfc3RyaW5nIHsNCj4+ICsgICAgdWludDMyX3Qg
bGVuOyAgICAgICAgICAgICAgICAgICAgICAgICAgLyogSU46ICBzaXplIG9mIGJ1ZltdIGluIGJ5
dGVzLiAqLw0KPj4gKyAgICB1bnNpZ25lZCBjaGFyIGJ1ZltYRU5fRkxFWF9BUlJBWV9ESU1dOyAv
KiBPVVQ6IHJlcXVlc3RlZCBkYXRhLiAgICAgICAgICovDQo+PiArfTsNCj4+ICt0eXBlZGVmIHN0
cnVjdCB4ZW5fdmFyX3N0cmluZyB4ZW5fdmFyX3N0cmluZ190Ow0KPj4gKw0KPj4gKy8qDQo+PiAr
ICogYXJnID09IHhlbnZlcl9zdHJpbmdfdA0KPiBOaXQ6IHhlbl92YXJfc3RyaW5nX3QgKGFsc28g
YWdhaW4gaW4gdGhlIGZvbGxvd2luZyB0ZXh0KS4NCg0KQWggeWVzLsKgIEkgb3JpZ2luYWxseSBj
YWxsZWQgaXQgeGVudmVyX3N0cmluZ190IHRoZW4gZm91bmQgYSB3aG9sZSBsb2FkDQpvZiBjb21w
YXQgYXNzdW1wdGlvbnMgYWJvdXQgeGVuIHByZWZpeGVzIG9uIG5hbWVzLg0KDQpXaWxsIGZpeC4N
Cg0KDQpCdXQgb3ZlcmFsbCwgSSdtIG5vdCBzZWVpbmcgYSBtYWpvciBvYmplY3Rpb24gdG8gdGhp
cyBjaGFuZ2U/wqAgSW4gd2hpY2gNCmNhc2UgSSdsbCBnbyBhaGVhZCBhbmQgZG8gdGhlIHRvb2xz
LyBjbGVhbnVwIHRvbyBmb3IgdjIuDQoNCn5BbmRyZXcNCg==

