Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4D33BBADC
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 12:10:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150062.277516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0LYd-0005l0-7i; Mon, 05 Jul 2021 10:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150062.277516; Mon, 05 Jul 2021 10:10:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0LYd-0005iY-4f; Mon, 05 Jul 2021 10:10:31 +0000
Received: by outflank-mailman (input) for mailman id 150062;
 Mon, 05 Jul 2021 10:10:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Qt1=L5=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m0LYc-0005iS-60
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 10:10:30 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 392cffc5-dd79-11eb-8441-12813bfff9fa;
 Mon, 05 Jul 2021 10:10:29 +0000 (UTC)
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
X-Inumbo-ID: 392cffc5-dd79-11eb-8441-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625479829;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=q78QIUoA7VlmEij5JowzrPOe2BnFLm5XQRvTXXSlPd8=;
  b=VWbRofk5Z8wUuyKM4QPo+T3Kxmktq1e/g1vn5UjSiYct5aUN4ULlwPrx
   JW/e2jmoG1xvLUqJ3rXQPnVkz6zLkj7c8ovU4sn/hUryfK993pAVpc/pB
   I+m9dQap6DXEnMKsT9fRgNQdPOvRe6aUKK+VEaHs4LxLxl4p83k55MIHA
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6pJXLkKwMTQdcKmN/B4CG/qgE5tJoR2os4hOBPbSbLjUYKHlP5oBCMr7gW40+oA767JrP599jj
 All81qetr3tvfvuBymzUbvlXYcTs1lQ9P9ujP2Evc+J73cvqvxcmJ7tT8EXsisXeNLzYXzhHN+
 pG/VcmNSPxCQ/qYdCs8EsAd0rXr9lRixl43b29fiiPc36sudZm+kAdG+xg0hOc3dK147KRmo6q
 MEYySXnRGcoHDLVov/ICMisVA5PzgqyRZcPxaRH57puOsHDheC2LO8conPj/hLEB5wHvKj1Cjt
 OuA=
X-SBRS: 5.1
X-MesageID: 47945855
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:yzrV9Kg7zW7k8wHT7fiTPJajiXBQXzd13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmskaKdkrNhQ4tKOzOWx1dATbsSkbcKpgeAJ8SQzJ8n6U
 4NSdkZNDS0NykGsS+Y2njLLz9D+qj+zEnAv463pB0BPGIaCdAV0+46MHf9LqQffng0OXNTLu
 vk2iMonUvERZ1aVLXAOpFTNNKz1+Ej2aiWLiIuNloC0k2jnDmo4Ln1H1yx2QofaSpGxfMH/X
 LemwL0y62/u7XjoyWsllP73tBzop/M29FDDMuDhow8LSjtsB+hYMBEV6eZtD44jemz4BIBkc
 XKoT0nI8NvgkmhMF2dkF/I4U3NwTwu43jtxRuzmn34u/H0Qzo8Fo5omZ9ZWgGx0TtjgPhMlI
 Zwm06JvZteCh3N2A7n4cLTah1snk2o5VI/jO8oiWBFW4d2Us4TkWUmxjIQLH48JlO81Gh+e9
 MeSv00pcwmMW9yVkqp+1WGm7eXLy0O9n7seDl2hiSXuwIm1kyRgXFonPD3pU1wgq7VfaM0rN
 gsAp4Y442mcfVmJJ6VJN1xDPdfWVa9DS4lDgqpUBza/fY8SgPwQtjMke4I2N0=
X-IronPort-AV: E=Sophos;i="5.83,325,1616472000"; 
   d="scan'208";a="47945855"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dKp6XM3hGw6Lg36PrNAqUZ9xCiWJgfPqjxzFVOv6fu75SmR8fy1L51MX3K+OkA5sU8vCvFuduag/ALHz0aCKyxIN6fE/H4J7UpHQYMxhAKKig7sN0jCf5lXHzCa1Va/QuY+Bz7CIs++T49YRcESpzzC/c7dHjgGNtcEdL8BNGqPTbAW0XbgFdOY3eV0T6uhktzBFbErbS88ofxhXyKcgMVh0cmsabrmCfjQuiYlz2orTawtDlMEaiU5DanzNdPjSz2q9ftsxzlbPj+uSJsUwsBbf8UUL3fIBtFrDgoJXbn1EW64WyYFnV1OQ2lEUVjDXKgjYZxVV0d8rYpTFOgxPjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnY+PPET+F2zt6L6l2G5TzAbdbu8ra6zr0Lt9KHC+Ac=;
 b=VvM9VEoOEC8jcNLIWi2UDMbp/3DBy34kho30+6X5RN6fIxZSCVCiT58vFb5Pn/RUxX/WlRwdMDsYZEoZZUPoKV2FYI7g78KE4EOnzu6Wauby3YGxLH50ah49tCh2G5B1OZYZVrnjGB641F6ca5mNyEiUD5nHOx/ycSsR/VvzNfbAnI2GTdwEFNoGNVtyplOY/JgEKpdyQadt49sbP0WCCR8P4g10T2/v8U81gYmyC+lSbMVCTFVvxGgBJ9v/mhsj5n3qX/5e6awQ5KaEO2PaMu9qx/uGqN6v3wXF3xAD2rH04JAU6SrmiTXtq/A6jJzzHLSquW/zjM0HDEl5zQRY2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnY+PPET+F2zt6L6l2G5TzAbdbu8ra6zr0Lt9KHC+Ac=;
 b=G+ii/3tap9BMy7MsenBgEK5WtDZalcP5dXC66yj3Fb4ACxSNv8eG0q6berk206F0OWvAdMmC+0d8J3na7o7k4kaxGl6eikqJr5k9SXxVTgdHFtAhUfIluy8HV3vX5LuGLaRrf+c8rjLD3mXhdKe3LrpibtOFS4T9gFuViO5zetQ=
To: Olaf Hering <olaf@aepfle.de>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>
References: <20210701095635.15648-1-olaf@aepfle.de>
 <20210701095635.15648-7-olaf@aepfle.de> <YN88m0tvHKxF7+NI@mail-itl>
 <20210705100706.48b4a1ef.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v20210701 06/40] tools: fix Python3.4 TypeError in format
 string
Message-ID: <e59ee963-7752-91d1-ec07-90e360865cde@citrix.com>
Date: Mon, 5 Jul 2021 11:10:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210705100706.48b4a1ef.olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0278.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::26) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc916899-2d18-4eba-d51f-08d93f9d1b91
X-MS-TrafficTypeDiagnostic: BYAPR03MB4245:
X-Microsoft-Antispam-PRVS: <BYAPR03MB424568A0AEC4BFA8F874ADDEBA1C9@BYAPR03MB4245.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xqvT2Vj7wjrPsSeVTfFVnmVkSgZiawo94XACtpnHUD96EHWwUYNL469wYoeVEBPPIDriE9kK/dR4x7gn85VDqe9p7Kch9SqcghKsNW00vdsFVqXWecroXRDVGlPx6FSvuCOoznuNCArdX6N38wi7TEZo7RjoeXgDLw79Yi2AN/SGbE4hUr61doprTMYgQ0Mi6K4685RqQIbeHTn6NOqAkbfkOBnkofcsVmK4+EEvWERYcfBDpPLbkzBhQ1PSFtJOkdWPBalvnHfJPa0z1BXK4CKkAxkNStRsJyuGNL7XRK7fwBrcPDIft6CsNmE2lmi1DTfSZgExxc+h6SYqkChfA7e+Jv0cCg+yG7v2adK7QfMLdGswJD0j1cyZcT0NfUODCB5tSfUNhpnoEzRoz90voPnd242rjv9jyfQkFxI4p+ukJ7eiH6+RDwE7YYS2xgH44PjmzDGUcaeKy5PnOv23v500cVPkjV/H56j8UZzLsgqe+02VOu0VRo0E6teLy8V4QSrc2jjdYgmX8v78kM/EWwTsrv+D7OolkmMAxlDshjQkbIT9uBXt/ElZQ4BKlY5odDg8Tl69TfRTIr/tIl1ZwO4pI84ADDy699jEtB3WsrSdmVj/iMcp3ubfvGfj0Md0JrVCZyyI+XHAeKOpVEQYNv1en0UTeW8IEEeLFu9142zQ1F3DaQW3gbCkPDktKIR95uxlinLgJ/mtxtMGTorxLBIzVtgyT8XDtiaZTYttENs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(376002)(366004)(396003)(4326008)(66556008)(66476007)(478600001)(66946007)(110136005)(86362001)(6666004)(956004)(2616005)(38100700002)(316002)(16576012)(8936002)(16526019)(2906002)(8676002)(53546011)(31696002)(6486002)(31686004)(26005)(4744005)(54906003)(36756003)(5660300002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1dGcnJ1QVVDeVhKRnpUU1V0VWRtNnZZRmdPR25QeHNSK2MyUW9nMHVZSW45?=
 =?utf-8?B?MTZVa3VEN05YSVRSYzBmdWJkVUl3aUVPOCtLcUNJVDhqem9lV29pMjlwbWd0?=
 =?utf-8?B?Y0MxMkNXZmZqNjhvNTR0dS83dGFmVUtmZHgxcGUwcVdpcktabVhhRXNpejE2?=
 =?utf-8?B?SWZUQnJZYXdnQlZLS1lQLzVLbDNRYjQ0OHcrbVZzUDZjT0VYYzZwcXJ0MVVv?=
 =?utf-8?B?aHZuNXNKWHNnU0R0Q3F0YTY0aHZCV3pyOXhaVUNra0RNTEIzOTZrL2VWMjZn?=
 =?utf-8?B?b0ZkOUtjcmZkSHo1aXJBREVEc2NGaDJXbHhobDhvNEgrT1ZXSlJxeWlJL2Rj?=
 =?utf-8?B?bTFabXBRSVpZbTFOejRIQ1BnV0dVODdCNHI4RTlnSXMzNmNSMG5VMkduQmRX?=
 =?utf-8?B?K1hxcGV5RmF0WHhpWmExTHlRK09XWDdSNGJoeDMwY1o5S3lnanhxSnVRenJS?=
 =?utf-8?B?dFhiRDhsUjR2WVB4amZ2UC93cjEwRC9DdnpReXZPNkZveGlkSGFzM0FmeTNw?=
 =?utf-8?B?QW92U0svZXRMMmVqSnRVWWFoamI3MnJhT0kxdnlCWVdGRjJhaEdubTVtSE1l?=
 =?utf-8?B?dWdPanNrMXJLODNXaUVuMklNSzdXS1F1UEZBUkx6ZThsOE1mWXdEVWhLU2Rx?=
 =?utf-8?B?d0VKd0JocUxQelZhdTF2Wm1zR3BwbVBLSTNManRpOE11NGVrNlNhdmJPVFpw?=
 =?utf-8?B?aXNHWWFnaE16Qk1qVXBwT1p4REtXS0NHUjVjeTBwYlQyVnFGRXlpWS8zMlc1?=
 =?utf-8?B?NHRaRXhRTmJqMHVvMld1Z0FaR3B3cEZqbmdCalpoN0cvTFZwY213UU1JYWk3?=
 =?utf-8?B?K3Fqa0FrWVBKRjVwMVJ0QmErbXc5Sld0SnQ1TEZZRmVqaWFHT3pObXZrMjdF?=
 =?utf-8?B?MzZydnNNR1g4aWhzRWw5ajNDTk1ib0puVkoycUFveEdUVXZXRVVBWUxhNm8x?=
 =?utf-8?B?bG90eXNmMnJ3ZFVmYk8xdldGd1pleTYrN0JzK2wvdEdJemNjdGFQeFViZEdN?=
 =?utf-8?B?RGNYckk3QXM4VlBDQ1dmYVMvUktGTW5aV285Ri9rOTBYcW9yV0ZjVUF5UFVI?=
 =?utf-8?B?cVgzSm5rOUhmc3VHSnpBVXY4NHBSaEhQYmZZVkhuZFlDY1djUUV5UnRvbDZp?=
 =?utf-8?B?RGx2TFBGSmt1VGg0b3FkaFd6M3pCQmJxRmJiT3Z4aUxnWDFxNi9scHk2QllS?=
 =?utf-8?B?UzFEVFBYemdQc3RDeTliK294cHJyajJnWndoZ3E2VGRSNlVEWml3SkdaU0t0?=
 =?utf-8?B?NFg5NGRXK0pSalNSWkVlNDJxN1V6VUdaS3J5RmZlNjgwSkw3eW1PU1cwTUtY?=
 =?utf-8?B?ZmRVK2VvVlVFTjVvM254U2VFQkZoTWMyQVA1T0VYdytUODBSdm9JbjlFUTZM?=
 =?utf-8?B?b3NyL2xFNzRldG5sVlAyUlc0MzBSRkV1cTkzZ3B4WlRMdVBmREFEWmNZVEpt?=
 =?utf-8?B?TFEvSFhhN2FISll0YWdhbURBb0hpV3U3ZXhUVXlLZVpmYVljbE56dTdRTkQz?=
 =?utf-8?B?Q2J4STJrOERzOHM3TThwZkxaYjV5REsvMWQvUnhHeUovTVUwMWhTZERFdU12?=
 =?utf-8?B?SVBWVlNKUEplbXVGOGt6K1RBRnQ2RWxaMkR4UG1DSUFKdEppdFRMakZ6QmtL?=
 =?utf-8?B?WGtZNEJHWFdWRm00a2t6Zmh1ekZtM0ZLRW9nak5FVVJ3QmxUL0VySGNPcTEw?=
 =?utf-8?B?RHBnaUJnNkxSd1VBZGlDRDlCNHgwTlQ0dHExaFdMenBTTTNCMUlEYm90R1JZ?=
 =?utf-8?Q?fu5Hiu4yehX8wH9Wf3ThHI/hTWseV4SptS9QoNp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc916899-2d18-4eba-d51f-08d93f9d1b91
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 10:10:25.6302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RnjfRPDCHgdHDItahXbcFcdlwF1svcuzxhMso2ieqF9zQhCVsSaY1Zf82Fttk+Ajbnk6xuCTYiHZfFiHmyjq+NZyVTiWdAV/WTIZymCszq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4245
X-OriginatorOrg: citrix.com

On 05/07/2021 09:07, Olaf Hering wrote:
> Am Fri, 2 Jul 2021 18:19:39 +0200
> schrieb Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>=
:
>
>> Why bytes()? Encode does already return bytes type.
> You are right, this works as well:
>   i =3D 123
>   b =3D ("str/%x" % (i, )).encode('utf-8')
>
> Any preference regarding the "encoding"? I picked UTF8, but 'ascii' might=
 be more correct in this context. In practice it may not matter.

I suspect you're right and it doesn't matter, but ascii feels like a
safer option.

~Andrew


