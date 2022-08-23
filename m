Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C343459DAE1
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 13:23:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391903.629932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQRza-0000dm-Ko; Tue, 23 Aug 2022 11:22:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391903.629932; Tue, 23 Aug 2022 11:22:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQRza-0000ap-I4; Tue, 23 Aug 2022 11:22:46 +0000
Received: by outflank-mailman (input) for mailman id 391903;
 Tue, 23 Aug 2022 11:22:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yuKU=Y3=citrix.com=prvs=227d21510=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oQRzZ-0000aj-9z
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 11:22:45 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6d029bb-22d5-11ed-bd2e-47488cf2e6aa;
 Tue, 23 Aug 2022 13:22:43 +0200 (CEST)
Received: from mail-bn7nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Aug 2022 07:22:36 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5520.namprd03.prod.outlook.com (2603:10b6:a03:282::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Tue, 23 Aug
 2022 11:22:34 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 11:22:34 +0000
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
X-Inumbo-ID: e6d029bb-22d5-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1661253763;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=BUFgE0xhnrsK70qkS6KkhyqAO0lsENOSNT8Fwm9oFsY=;
  b=FEGp9wGwKy7JM5IbjRW4kg6sGgXyrtx0AfoV+9f2FzSnf0tb5ED6YV72
   iSzncQAQrL9unahqGca33TNKmm8ibO0uEoHT+OGfAFfHoyqyJ9B1jmjX4
   7/n2wKagDDLs+2iDl58emelseGewrYPBMV5VtVtipgI1hfMfU+KY5E8qT
   0=;
X-IronPort-RemoteIP: 104.47.70.102
X-IronPort-MID: 81248586
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:O+3h3qv6p8gbK8TZsyc3/ral5+fnVE9fMUV32f8akzHdYApBsoF/q
 tZmKWjQPauDMWGnc94naIqyoUwE65LQzoRqTQpsrX83EHsQ+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzl8B56r8ks15qyi4mhA5DTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FdxE4upQA2F/z
 uxbIh5cQCKK2+emh5vuH4GAhux7RCXqFKU2nyg4iBv/UrMhS52FRLjW79hF2jt2ntpJAfvVe
 8seb3xocQjEZBpMfFwQDfrSns/x3iW5L2Ie9wrT/PJti4TQ5FUZPLzFGdzZYNGVA+5SmV6Vv
 Dnu9GXlGBAKcteYzFJp91r837WTzX6rBur+EpWg8aVap2fO71A5I0wOf1u0+uvohkWHDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Ul7Cmdx6yS5ByWbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8kN+pES0cLGtHbylbSwIAuoHnuNtq1kiJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNfNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:15Imxq/02S5oErWgmv9uk+F7db1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZtFnaQFrLX5To3SJjUO31HYYL2KjLGSiQEIfheTygcz79
 YGT0ETMrzN5B1B/L7HCWqDYpkdKbu8gcaVbI7lph8DIz2CKZsQljuRYTzrcHGeMTM2YabRY6
 Dsg/avyQDBRV0nKuCAQlUVVenKoNPG0Lj8ZwQdOhIh4A6SyRu19b/TCXGjr1YjegIK5Y1n3X
 nOkgT/6Knmmeq80AXg22ja6IkTsMf9y+FEGNeHhqEuW3XRY0eTFcdcso+5zXUISdKUmRIXeR
 730lAd1vFImjHsl6eO0F3QMkfboW8TAjTZuCKlaDPY0LDErXQBeoR8bMtiA2XkAwBLhqAC7I
 tbm22erJZZFhXGgWD04MXJTQhjkg6urWMlivN7tQ0XbWIyUs4nkWUkxjIiLL4QWCbhrIw3Gu
 hnC8/RoP5QbFOBdnjc+m1i2salUHg/FgqPBhFqgL3f7xFG2HRii0cIzs0WmXkNsJo7Vplf/u
 zBdqBljqtHQMMaZb90QO0BXcy0AGrQRg+kChPbHX33UKUcf37doZ/+57s4oOmsZZwT1ZM33I
 /MVVtJ3FRCD34Gyff+qaGj3iq9MFlVBw6du/22z6IJyYHUVf7sLTCJTkwono+pv+gfa/erKc
 qOBA==
X-IronPort-AV: E=Sophos;i="5.93,257,1654574400"; 
   d="scan'208";a="81248586"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c84AEO8zW60S4Rbf+xltKmMGyP7dRRSBFmAtFuaJgVzALWGfBi/N7yStBnk7phVpFmXCyQxaVdeJ8IO3SDM/rvhS1eS7UxEKzVdABB0MEumespoDpeusoQ8IJ0+xbovXuplJbZP5BCiKF5PhqJmnspzmtMtxWoVhMvoUuzvV167dTjpfPiiAoYzXEa0+r5ucsPYpqfgnJJaJSuSuSwdGVu2wTJiqVZzqkDTYMPg0RZHKyIPqHsRZebDmbBSF5Y6+MaQ6CaaBX/HWa9xYfnl4ZBOtJ0fo71MCL2azWfNEuz+JG5nfzNCPsFg1SbC/qEkkcNFPnLlqVKSUnHpVxmnlCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BUFgE0xhnrsK70qkS6KkhyqAO0lsENOSNT8Fwm9oFsY=;
 b=FJQ5IAXM4tvx3r6Z6qEdLtc9D1khN3l7ncb0m0U1EM9nJHvVkob6r8UfRHQofGpif4Fav9Gqf84P1ne5B5dCvVXU8sOyxTJJWGwz4fw/5s2tv8WrE1dHdIk1AO8wtdt/D49WfkMQbr743khiVfPdw1k9JNN+3RHLRSTTB6PN8S14DjaiobKkTev9YgEDOWLLLQrf1E++Fenc41e6MtSpTrYhrFD1Ha2uVfMNLdOdYptbNKsd+xzXgHFU9FGEG4hPn3xSkg6FL8nwM3JtQH8jDw8s7ssZt5y9jLbnUDez6ubka96AkOFupzogb/7Z6vqs0YrkwcDa15IqRjdxJzImqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUFgE0xhnrsK70qkS6KkhyqAO0lsENOSNT8Fwm9oFsY=;
 b=CXrX6ZUc57Li63WWt5ulV4+bKDi3bbqg7NDntwwc8befzYdajN8qH6Ll04rOwWbX+jKhnENXQO8w4Jv5afltfDtGuSRP/wXR+8pxke6qGyE266+CVk56q0JY3tfpsLauM28SRIs7Ej4YpH1yyhDl7uCeaZjsAQWoO+P80UV5L5U=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/entry: Fix !PV build
Thread-Topic: [PATCH] x86/entry: Fix !PV build
Thread-Index: AQHYtijd2GWqlgMr1kW/Og84JT0UAK266uwAgAFuCgA=
Date: Tue, 23 Aug 2022 11:22:34 +0000
Message-ID: <a4d2f21d-4085-0f8c-717c-f9618913b0bd@citrix.com>
References: <20220822131204.25814-1-andrew.cooper3@citrix.com>
 <12fc8d64-89c9-39fc-3abc-0994bdac6d19@suse.com>
In-Reply-To: <12fc8d64-89c9-39fc-3abc-0994bdac6d19@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 435e5a0b-b712-413c-6d8c-08da84f9c6ce
x-ms-traffictypediagnostic: SJ0PR03MB5520:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 BqYcHXZc0YYJyfUca37SZxauPLv9gEECjOQP4gZdtnAwAFXN5ZHgsBQ8MQ+1rx08t8/UjPvKXSuGlcM81qlu/PdPOvXeZipyqVxlNwoEWyOW8pLSL3SSFFPSosUNiAos2T0sEmvk1Hwdop9zdQ6EB+LQvnyPfHOSvMow4CRNPsXpgHXprEmmHYpiXGfYBXVkJzHj5RV/gVtumzyuQ2CpNQJdR7eUpxz5DJyo4SREnU7rS2AUiUVizTKdh/jdSMkrHLRHv9XPxK8nTZOgU3QNQ5MbxXol7zoY1bJ/P0S91vmaDHSjtvid/PDS15t24lpsR1iFqSsDPm2+tFinAcIT4PAJO3b1ZhyyyWgDDrRvUf+f+Og7oft31g/6EvmzHmqLeTxrf6cWShOFPYG3iqftM47bvI9gAEHvRnUraNteNAFqCuvZaKibCIzhhHKol9cf2WZ1z3fMeBe1J/v/IdG7KBL47gBsDsgkB1C/v3huYRl1J5FkSlq19LPJ8R4Ks7QQQcwK66iaVJ68G4w28avzbWTocUGYx/IzeJ/Oa1QgZoQNcxKPecEwP958PBr+zsDtMfHU5f23xkkFIUE52nihuBV1outEI1beCp+7G62rWCtnrVJ0eRiaaaJLbxEQ/vYePoxX3/LbvZxriF5aeLV2A9DhYJco/79wJY7LBr8jt1XE5YJUwdKav0KLEgT7zybWScxvoGX8bGmpsfjTTGrZ+U8apZTJa2q7cQKEUwk0ebg++ZqwuhoXSoOjsFzXl3t26PlqyIH9R1DHfmM2xSkau9du6KbuYv+vshnXkmnkYF2o1emGHrF5RnADUeVL0sBzZpcN2x0+tY3BxWpdNnnkdg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(6506007)(54906003)(86362001)(8676002)(64756008)(6916009)(66556008)(66446008)(4326008)(26005)(36756003)(5660300002)(2906002)(31686004)(6512007)(31696002)(186003)(2616005)(53546011)(41300700001)(478600001)(82960400001)(6486002)(8936002)(38070700005)(83380400001)(91956017)(66946007)(316002)(71200400001)(76116006)(66476007)(122000001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QUFyTUVTYk1XYmJtYkdpeGUxTDB5a29pQlo0dEozdmtiSW1lRmJ4WUo5WS9Z?=
 =?utf-8?B?TnNPVFhRekE1VnUzVnpaZCsyRWtKNHp3TWhWUVRReU41THVxMExJL3VpUVd1?=
 =?utf-8?B?N2pJeHFGQ3BOT2Zzb0g1MmV3SjlhMSs5RktsQ1YvVVlObGdGT1JHQ3VCd08w?=
 =?utf-8?B?c0o4Qkd6VkdDOWk2Wnljc0wvbDlsU2x5RkJySnZJczAzMFU0UG50VzZvb1Y3?=
 =?utf-8?B?UGtKb3NwdGo2UjVDYm5VKzdLa0MzNkVyUThudVZUbUdjdkpBUkJ3ZHd0bUpo?=
 =?utf-8?B?aFp1RDhZS3JXdzFSK3NvUUF1UjlIaHhvKytWbVZzQVdRc3IwdGxkYm5NdHox?=
 =?utf-8?B?cElyR2pMV3JidmFIaXJWTG9MYVdXVTNiTmJIV3VnVDZhOFhuUnhqNThHYmZM?=
 =?utf-8?B?Qkd2VzFSNC9LSDhGYklVbFlaNjFBNGk2N3Zwb0dZOVJSVTQwYmJtWUVFbW4x?=
 =?utf-8?B?YURyV0dFQUdiZEZtNkpOYjRlY1hJbWI1Q3Z4eGlMSkJWM1lCL1MyTmxiVzdT?=
 =?utf-8?B?L1pYY1NUVzU0UnFqcUY2ZEp5N0tGSmZZME1YalF2b0tUaGVZN0ozbS8yMXlW?=
 =?utf-8?B?OE1BdnFxWExyb3JDbVRrM2crY0hTdmVwZndxVmI0NVFkakhuRWk0ajlHK0Ir?=
 =?utf-8?B?MTFVTkpLNzNPZ1NoQnlXN1lGMm9Zck9ENUk3dFU5WnYreFFUY0pWdng4U0dx?=
 =?utf-8?B?TDRYQ1JzMFJ1cGZGN3Y5TCtzV2RjR0NnblhEeGE1c0o4d2VVejNOODlZQkpJ?=
 =?utf-8?B?QVg2SWd6eEJyNmlvZ0lUWjBNaGVkbUdMVnU5QnQvc1ZCNUlqbk1yb1JNekFm?=
 =?utf-8?B?RGlkN2plRitpaEZJZlg4cEpKWjBBK0dRVUhqb1lyRjVCcjRTOG1nb3lkSHZO?=
 =?utf-8?B?cmZzWFF0UjByMjBtT3dnMFE4NDFaWkVQNUF0RS92dnkrdHhaYyt2ZWRiSE1u?=
 =?utf-8?B?SldVTmp1alpIbGpxWTZpTG9oWnY2N0E5dHJPbjRWcVllY1dwTHRNZ3BOdE9B?=
 =?utf-8?B?YTM5UG5IRmkyRFdJNzFtVVFKWCtHVWxadmYrSDZOd2lVMWVCb2xYY2RiTHRt?=
 =?utf-8?B?Y0pzeVdXYU94bDMzbXljeGxoOHU5SkpjV1pXek1aNjJPV1RvZU5aUWhlNm5U?=
 =?utf-8?B?d2xGOU1vcGNxSm1tbU9QUlh4K0tDVE9qUlJLRi9rajZnUis1c0RvR05pbVNm?=
 =?utf-8?B?dWVKTEx2TEpxSHBEa2M1aXNQZmRad29DVlArWUltMzN0RUJoRndDVHJMUkZF?=
 =?utf-8?B?dVZPY3JLb2ZEUXA4N1FJcW1vZFZLc1p4ejFFQlAySDNzNFlFSCt4ak1jV0ll?=
 =?utf-8?B?b2h2WUM3NGcrTUxvUThjSnBEa2txTmJoVkZDUVd2Zzh2d0FkeVNaRjdNdldM?=
 =?utf-8?B?K013bEkzQmVTUzlYS0ZxM2pxcUkwNlBvVjBtNG01Y2hOaWl3TERFaWpuKzRr?=
 =?utf-8?B?Rk4xZzlUWWJqQlZEa1dBUWlwY2Z4L1NjZDBxdVZBVGVhSndkTU9XR0RVZlRG?=
 =?utf-8?B?NTNXYjEraXh5K0V4VFNNSTJSR2o4YWNHaTRZVkZaNzNnNzZYMHhISTljbmQv?=
 =?utf-8?B?N0duZ0JQSHdpdVMwMC9pMC9zc3RYdHE2S1FNVjZickRLOGhRY2JhVlkwVldx?=
 =?utf-8?B?WjdnUFVSREtlWnBRdlhMcXFaNVZtY0RRZWlSTmxpNVRJcGMwOEVUazdkRktv?=
 =?utf-8?B?SWtYNWZ4dFBtQmIvQ2hvSnh6V3VJZE1YcnBvN1d2eFBzZThvWFVodU5aWkpu?=
 =?utf-8?B?dGFZTXVmbnN6T24yZWp5a0tDbk1TeXlKZ2h0UkhwTHBjTkhDc2Ntc2tXRmlU?=
 =?utf-8?B?dk9XaUl3cW1yNytDZUwxN0FlQ2FJOWVDbmM4cFdoRmM0VzBWMVREMlhaTi9k?=
 =?utf-8?B?K2FNa3Y3U0UyVkZGaTlMV3BUNytST2x3RzMvZjFTZU4weTZZSVI1Rjd1clNN?=
 =?utf-8?B?czZQNTBzUnM4LzIrcDJMZXpEcWM1UGduNlhibnBzVC9hVkxKK2pEZ01RM0ZW?=
 =?utf-8?B?RlpObHdIdVFzbnh4d0hDOFNvL3ZkeS9QQlJRaTdsWUsyUDJQUVlMNysyWDZl?=
 =?utf-8?B?QWlFSmNDYlI5eEh0aUxRK3RROFhRTzVxQVVtak1SL1J6NDZndzBtY0lEK3d1?=
 =?utf-8?Q?XWQko0kvDz7hrxcP/MXfG4Ea8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4039816F51AF547951E1FAC6B0241F1@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 435e5a0b-b712-413c-6d8c-08da84f9c6ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2022 11:22:34.3330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P5GONhOFCMPXvbqZi9RTgB6E/cxeA/SDfOwW5k3gSVRhRwZebLthv6kxOkcCA3DrvBd0XEI+St9TamyaqYayCdQHAzxcaiMg85Cu3/XCaQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5520

T24gMjIvMDgvMjAyMiAxNDozMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIyLjA4LjIwMjIg
MTU6MTIsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBlYXJseV9wYWdlX2ZhdWx0KCkgbmVlZHMg
dG8gb3V0c2lkZSBvZiAjaWZkZWYgQ09ORklHX1BWDQo+Pg0KPj4gU3BvdHRlZCBieSBHaXRsYWIg
Q0kuDQo+Pg0KPj4gRml4ZXM6IGZlM2Y1MDcyNmU4NyAoIng4Ni9lbnRyeTogbW92ZSAuaW5pdC50
ZXh0IHNlY3Rpb24gaGlnaGVyIHVwIGluIHRoZSBjb2RlIGZvciByZWFkYWJpbGl0eSIpDQo+PiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0K
PiBNYWtlcyBtZSB3b25kZXIgd2hldGhlciB0aGUgb3JpZ2luYWwgY2hhbmdlIHRoZW4gcmVhbGx5
IHdhcyB3b3J0aCBpdC4NCg0KSXQgd2FzLCBJTU8uwqAgSW4gaXQncyBwcmV2aW91cyBsb2NhdGlv
biwgaXQgd2FzIGEgc2luZ2xlIGFyZWEgb2Ygbm9uDQoudGV4dC5lbnRyeSBoaWRkZW4gaW4gYSBs
YXJnZSAudGV4dC5lbnRyeSBibG9jay4NCg0KPg0KPj4gLS0tIGEveGVuL2FyY2gveDg2L3g4Nl82
NC9lbnRyeS5TDQo+PiArKysgYi94ZW4vYXJjaC94ODYveDg2XzY0L2VudHJ5LlMNCj4+IEBAIC0y
Miw2ICsyMiwxNyBAQA0KPj4gICNlbmRpZg0KPj4gIC5lbmRtDQo+PiAgDQo+PiArICAgICAgICAu
c2VjdGlvbiAuaW5pdC50ZXh0LCAiYXgiLCBAcHJvZ2JpdHMNCj4+ICtFTlRSWShlYXJseV9wYWdl
X2ZhdWx0KQ0KPj4gKyAgICAgICAgRU5EQlI2NA0KPj4gKyAgICAgICAgbW92bCAgJFRSQVBfcGFn
ZV9mYXVsdCwgNCglcnNwKQ0KPj4gKyAgICAgICAgU0FWRV9BTEwNCj4+ICsgICAgICAgIG1vdnEg
ICVyc3AsICVyZGkNCj4+ICsgICAgICAgIGNhbGwgIGRvX2Vhcmx5X3BhZ2VfZmF1bHQNCj4+ICsg
ICAgICAgIGptcCAgIHJlc3RvcmVfYWxsX3hlbg0KPj4gKw0KPj4gKyAgICAgICAgLnRleHQNCj4+
ICsNCj4+ICAjaWZkZWYgQ09ORklHX1BWDQo+PiAgLyogJXJieDogc3RydWN0IHZjcHUgKi8NCj4+
ICBzd2l0Y2hfdG9fa2VybmVsOg0KPiBSYXRoZXIgdGhhbiBwdXR0aW5nIGl0IGF0IHRoZSB2ZXJ5
IHRvcCBvZiB0aGUgZmlsZSwgbWF5IEkgc3VnZ2VzdCB0byBwdXQNCj4gaXQgaW1tZWRpYXRlbHkg
YWZ0ZXINCj4NCj4gLyogLS0tIENPREUgQkVMT1cgVEhJUyBMSU5FIChNT1NUTFkpIE5PVCBHVUVT
VCBSRUxBVEVEIC0tLSAqLw0KPg0KPiBvciB5ZXQgYSBmZXcgbW9yZSBsaW5lcyBkb3duIGJldHdl
ZW4gY29udGludWVfcHZfZG9tYWluIGFuZA0KPiByZXN0b3JlX2FsbF94ZW4/IFdoaWNoLCBhcyBh
IG1pbm9yIGdhaW4sIHRoZW4gYWxzbyBkb2Vzbid0IHJlcXVpcmUgeW91DQo+IHRvIGFkZCBhIG5l
dyAudGV4dCAob3Igb3RoZXIgc2VjdGlvbikgZGlyZWN0aXZlLiBQcmVmZXJhYmx5IHRoYXQgd2F5
DQo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNCkRvbmUuwqAg
VGhhbmtzLg0KDQp+QW5kcmV3DQo=

