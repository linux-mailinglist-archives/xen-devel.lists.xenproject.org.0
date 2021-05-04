Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11913372F4A
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 19:56:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122674.231407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldzGl-0006u7-CV; Tue, 04 May 2021 17:55:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122674.231407; Tue, 04 May 2021 17:55:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldzGl-0006ti-9Q; Tue, 04 May 2021 17:55:39 +0000
Received: by outflank-mailman (input) for mailman id 122674;
 Tue, 04 May 2021 17:55:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Poa=J7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ldzGj-0006td-Di
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 17:55:37 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dde4598f-1052-4501-b90c-289fc0cdaa15;
 Tue, 04 May 2021 17:55:36 +0000 (UTC)
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
X-Inumbo-ID: dde4598f-1052-4501-b90c-289fc0cdaa15
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620150936;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lOygGWTFXkTQhfHzoqhd4sj3sNICY0WxoSyJxLU7WRY=;
  b=Vz62G9upixUGS/TxvYMMQu+xNpuh79OAn+JbAPfPCVr2au1iEH3YnnqQ
   1EUWdg5MdB2Q4BFJ++Nrmx5JIDL3EksgIuscLjHFjIB04ZREAswTseIin
   1NxNI6/8zjHbVy/KGkjFEgdaQTnzv3OVsYamjsm/FbJP/RJOf9ZeSZxy3
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: tm/6OytogkZh8IZqCd+B81vHMuANf2RnCOj2PsPVZyFMVGIBDQztzS+ygnUR+Q5W91UjXuoqRp
 luFMOSb3sWggWNdJV+vDwHgVN1QGvga8wA8lCphpz8bKPkdoN57ASHYVH7CsBmCXuVmwBREJb7
 J0vsaCQtPKnuMZ++SUCBGcD/F/lb2wFV/HoNA4AkEiOFqu+GvxfXpb5ziKQM6UaPR+7UiiLV1e
 yN6ots88JtunHq/aSBmrOBDC72hFln9pAOJnaqjMsGAYiTaE7wSoMDcTaiArOMTU1wqRYoLifL
 ZmQ=
X-SBRS: 5.1
X-MesageID: 44573406
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:sePf0a8kNIjWcMUByMhuk+GYcb1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmsj6JdybI6eZOvRhPvtmftFoFt6oP+3ybtcheOjdJ1/Z
 xLN5JzANiYNykCse/T6gO1Cstl5dGB/ryhi+u29QYmcShBQchbnnREIyycFVB7QxQDIJI/Go
 aV6MYvnUvsRV08aMOnCn4ZG9XSvtGjruPOXTcqJT4CrDOPgzSh9aLgH3GjtGZjbxpjyaovmF
 K15DDRyb6kt5iAu27h/k/Vq69bgd7wjuZEbfb8wfQ9DhXJpkKWaJ96W7uE1QpF/d2HzFoxit
 HDr1MBEq1ImjrsV1q4qxfsxAXsuQxGgxSOpTD34BuTwr2aNVdKb7sn9OQpDWqm12MasN5xy6
 5N1W6C3qAnRS/opjj35NTDSnhR5ziJiEciiuIagjh+VoYTedZq3Pgi1X5VC5sJEWbG7pkmGo
 BVfbThzctRGGnqH0zxjy0j+sKtQ34zdy32Ojl+y7rljQR+rTRc9Q811cYflnAP+NYWUJ9f/d
 nJNaxuifVnUtIWRbgVPpZcfeKHTkj2BT7cOmObJlrqUIsdPWjWlpLx6LIpoMm3ZZ0zyocokp
 ipaiIGiUcCP2bVTeGe1pxC9R7ABE+nWy72981Y759l/prxWaTsKi/GbFw1icOvr7E+D6TgKq
 eOEaMTJ8WmAXrlGI5P0QG7cYJVM2MiXMocvct+VEmJps7NN432pu3WePveP9PWYGUZc1K6Jk
 FGcCn4Jc1G4EzucGT/mgLtV3TkfVG6/Z8YKtmJw8EjjKw2cqFcuAkcjlq0ouuRLydZj6AwdE
 xiZLfukqaxo3iq7X/Fhl8ZbyZ1PwJw2vHNQnlKrQgFPwffarAYoeiSfmhUwT+APR9wT8TfFQ
 ZFvFRp8aerL5idrBpSW+6PAya/tT8+tXiKR5ATlumo/sH+YK41CZ4gRehsDwnRDgd0ngxrsW
 9HbwcBSibkZ2fToJTgqKZRKPDUdtF6jgvuHNVdrmjHs16A4es1QGEAYjKoWcmLoAonSjZOnG
 dt+6sHjLfoo0f5FUIPxMADdHxFciC+Ha9PBgXtXvQZppnbPCVLCVqsqRPfoRcpYWbu/1gVnQ
 XaXGKpUMCOJEFctHBe2rvt63VueAymDhRNQ0E/jaZGUUnHoHx32e+OarHb6Rq4VnIL3vwdPD
 bZYTEbPwNpwJSt2ASInSuZfE9WiKkGL6jTCq8ufKrU3W7oIIqUlbseF/sR55p9Msvy29V7Ct
 63akuQLDniDfku1BHQrnE5ODNsoH1Mq4Kw5DT1qGy51mU4G/zcPRBvQKwaOciV6yzhS+yT2J
 t0ydIzsu3YCBSoVveWjaXWZSVEMBXdvCq/SPwps4ldueYqr6RodqOrFQfgxTVCxlEzPc30nE
 QRTOBy563AIJZme4gXdzhC9lQkmdyTJCIQw1bLK/57eUtog27QPtuP7baNs7YpD0GbrAb7OF
 WU8URmjrH4djrG0aRfB7M7IGxQZkR59W9r+/macZbMTAqtbONO8TOBQzqAWa4YTLLAH7oerh
 x3uY7V2+CWcjf1wwDWs39wJLlU/2OuXMO1B0aNFIdzgp+HEEXJhrHv5si5yCrzQ3+8bU8TgI
 Veb0webshZkFAZ/coK+zn3Trayu14vlltV/CpumVHs0JW3+WuzJzAHDSTJxpFNGSRJOneGjc
 7Z4fGV2XT07j9Cw4TCHi5rD5NzMslVSJP2ISdoIdURu7Dt/7NHuFUDXCsT
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="44573406"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1OtcKe2WEH+plddZqbt1AmKnDBjG5IvFkEMamjX2uRROORArscYWM0uqWgFgwnc5KI5iBd/ZVwAVRWjfR61iXJBQnIEiIGZR/V/vGu9DyLGMbqd9Juqm65VYm+3WixNnCQcffX/IiiqAvrmi6JEtpAItRE06ib3w729N2rXBp8aEU97Pe3SowCFrR6nKYYR712HWrZ7nT7UQqC88uppw0zwX6Efz9ik697h3USAZETcSiajeO3i7+GBvg5X7rRjRY2zrwq4fjctM5VBt2ih1QKm0SCkxoDTWGrILvo9ki0Ed5ftaPie2ZyMT+MzgyBlmI/CL59NyA+dxkqsQ7+zRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnQ8wFkuqBJ7z1MMAuFXc3wb0ZpD++bpbaJswgZMIrM=;
 b=XQE1Ee5oGjcmyI1hBhvFrvu3pxQp96YMf498NN9inkhfV68BMaEkj3hH81PvGo6T+iIeO1UT1ySBUANRYXhahnj1uyIt7jI1GFB+qwvkUQPmK1UrcWoIQgHBnQRlmaiNCMAF96R54kCTSDgR9qILJ9vrqjz4aQtMZQinvsulTnnVyEPK7ay0IDu9cUheloPQDBGEbbyIm5sRekaXMuPrOp9kYwIb+HmgI+EkscxAeZraXno9hIzYzoK411hqqzlXFXBKMdud1iOu+y++DeSt1yAj6vjMsjiKCXh4nniwBHtGWieW+zOrUllP8h5NHBM/jUK4thws/HGlpxn0lgA+dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnQ8wFkuqBJ7z1MMAuFXc3wb0ZpD++bpbaJswgZMIrM=;
 b=gYXX+XjtRTaydtbJKPQRBLjXXl9LuDRZPkucLNFiOK6hA8EZz5XPFHlH0I1C0hmSd57S5/A3l94XWLoTBO4pvM7cR38U64xr+0K30POGSOkX2ZYk9kMa9VFj/cTkIwZtIvZlBCJZMlD7duN0Os7vp4KwlSYDpNuPX70QM3AWWMk=
Subject: Re: [PATCH 1/9] docs: Warn about incomplete vtpmmgr TPM 2.0 support
To: Jason Andryuk <jandryuk@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210504124842.220445-1-jandryuk@gmail.com>
 <20210504124842.220445-2-jandryuk@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <59277d56-8b3c-b18a-5eb1-f4b87c1a65da@citrix.com>
Date: Tue, 4 May 2021 18:55:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210504124842.220445-2-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0052.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f67d418-8cd2-43cf-ba3c-08d90f25cf7a
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5854:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB585446A37CE5D2041A9A7FC6BA5A9@SJ0PR03MB5854.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9VWo+GsPNBcTtRvPICAkQrdmoDpU6FdvPquBqM8KgATSh540JoGE7ctdAFd3k99GNtPKbQDGWoFyq08+tcpX3OPlRkO0wVuZ9y/XxsH8+Iq03Gt4CXye8gHtK6EWEVogXPIirOvp9JNFCLab+Ws524zH5a9hmE6raWUL93cvPR60rWq3xNuUnUrSYh6XQ6ARlw5ok2XoUdL3Ub6ROJShkDhp8lP5sL66g9KMk9VSuhQlF1zsULk3WFfAhxqYu6vrAQ/4r2lR4ICnuzogIBs/GUzwA0X6OLWUMdcPL46GUBqiw+3AuJhIhMI0Zm0NdcnQX0c2PnWZ+NYruN3TfUhbXR+6lVaatt3uDmKpQZPCw5S6chMo/ZehWgMCHriC7qDcKUcC776unc2j8VX+v8QNY5zcdnuWynw/5eZ2CVdkT53dFWyJRVcjZGHXbCBp1nlkMcXh7B+AbEEAwUskWoPsZ6x7+k6OUS50+l8y5OnI2uFN+CgxMUKQLU6OZ/xByimqk1xj64mPcDf1Liqm44gdzzLqNKwjC5+CzSlxlUeOGDN5skPvTxYNdEOsNZDERjU69O9Qeh98/v097chW2P1tr/cgITyhTjvmy8smOgb5/WV9yZQOt+CTjjZF8oGcM32bBk7KRAml4WBwALr75vbfRmwNFB+8icbFkmKPHQoqNbHCoRHBWs7x2UHhTUDKsu9X
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(366004)(376002)(346002)(136003)(86362001)(54906003)(31686004)(6666004)(53546011)(2906002)(38100700002)(66476007)(4744005)(16526019)(4326008)(186003)(5660300002)(26005)(31696002)(66556008)(36756003)(83380400001)(2616005)(8936002)(316002)(956004)(6486002)(16576012)(478600001)(66946007)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RnoxRFZxMkNxaUZxRHd0T1M1ZENvRWtPRE5VMkx1eGlyNzZDREYremlEV0RH?=
 =?utf-8?B?YzM1bUpJTzEwSk4xNHRzbElZbmdwU0ZKUW5yTGR3SDdUM2pld3ovSzhvSm5v?=
 =?utf-8?B?VDI4RkpHeWJCcmxCekRWTEVFZ1ByZ0ozZGxtWWU4dzg4TkgzcGEyUllkQm1E?=
 =?utf-8?B?YjFubjluSGxxQmJCTWxvS2dIeUpuenNLa0xLaVRRWi9xdnF5SzNzYTZtWEhG?=
 =?utf-8?B?MXAxUmRsRlE5eVlxMEJEVEsrZVRWWGpUM1NxKy9QL2dadGhQUmJscElpQURo?=
 =?utf-8?B?WTBRVThuUk0zTVFPS2JCcWxHK0ZaUGdvb25vNmsvSXVtVng3eHR3RHFJSzFS?=
 =?utf-8?B?UTkvV1pNcU9ISm5yWG1HRXN2N1RJSGZuOWU3YU5zN2JweFVYRGJMdzd1SzdP?=
 =?utf-8?B?cS90dFl0TzBlUzFUd0Y2VFVXc0hUY0FUbnc3ZmJtM3laeklmSDBhbVRiZHMz?=
 =?utf-8?B?RDJxZ2xhTkh1OSs0QkxuYlRCYTB0a3d0UGF2Z0pzT0NiS0VBMjg2RnpiemJR?=
 =?utf-8?B?RHFKOSt1T1lRcG9CZGU5R3Vob3dRVXd4WUlucmttOU5EYjQ5dUZaSWd6cFBk?=
 =?utf-8?B?bCtCdm02b2pwNFJDSkJHM0piTDF2c2c0QzJISGw0a1FtV1RjTGh2MTlvU1pK?=
 =?utf-8?B?amRhaGFwNk5OZXdCbjRJcS9GQWlIVjA3T1hYLys4Uzd0Ym9BRzFmVXFqMmoz?=
 =?utf-8?B?a2NsZ1hjckV1YVVzd1EvV2FzSUhxOFZIQkFMdEdVWS9qTlFZWThHL00ydGtS?=
 =?utf-8?B?c1FkdGdUNlQxUzNmSGxJb0RteW5MVTlOZ2JBWmNHVmdhWCtXclM1T1hxd0Ri?=
 =?utf-8?B?NDl4QXNoUTYzbnZ2Y0R4bFZ1akVSeTNGWnpHdDB4cTVtQlFHLzVLc3BBV3RQ?=
 =?utf-8?B?cmRrRkcyMmxXMTdSbHRaUlBucnpiZmFRclduTG1PSDBFL0ZJeUwvU1ZQa3Ro?=
 =?utf-8?B?UTlRbElaejNuS0FVUlpyTmluY2ZpWVVhdEhnZzFVU0JLdmRYN2F1UHJ6d2p4?=
 =?utf-8?B?NjEzNjEvYUNJVldTN1B1MlZNTmxRb0s3Vi9Pb0htTmVCYk1QYVVncGQ4RHF5?=
 =?utf-8?B?U1h1SWFOQmNWMXgvSjdLdm9QZXdscnIvQWVTNi9ZZVdYTFRrQk16ZmNLdldY?=
 =?utf-8?B?R2RnQ1MwL3lBaks0UGlXR05vTHdudVNZMGZEaDAyaUFTWFVoNjVBblZ6U0dB?=
 =?utf-8?B?Rkd2NkpMcTVhbEtXaDVUQ2pNV1BTcWhyVDRiRG1FWDFUTDdNT002a3Nnd0dj?=
 =?utf-8?B?TUlOdUc1aFZ6YW1VemRPUW9GVUxSS0dBRkZLNnBiV2luYkx6Ui95UEVPOUd2?=
 =?utf-8?B?Mzd5Rm0wUm1Wb0FEam53c0NERGJXa3RjeGkvUWJMaGhjajZsWmVrN1N6MlND?=
 =?utf-8?B?QWRoMG93V2dtSzFZT0lqUm1zNkJvNjRGYU53R2xnUVZkNU1SdTFJWGNwenMy?=
 =?utf-8?B?cmJpQi9NcmtqVHdmQVRQRjJCWGZUQTdkOXRydVRHM0pNYUoySHpvYTJDTVFs?=
 =?utf-8?B?NjRmUjk2NGtITGJDd3RheWZ6Ni9kTzlUendEM3RHcmdWa1daRnlhTXhDSlVq?=
 =?utf-8?B?V1VWMGF3MEFybTFDdXFkR1VzNEFBc3QxRG92UWVtVnNOcjcyTDEyRG5MeGkw?=
 =?utf-8?B?SFArVTB6b1RIaWxVeFMzMWcvc1ZtcjRmMUFCS2JHc1BIVlhNZlZCRWxRK3Nq?=
 =?utf-8?B?V2Q1YUZjaFdobXJidnV4SkFjM3p3WGhISHRlSXFiV21TNkliZEVmbFU3Nk1h?=
 =?utf-8?Q?RdVqGw7ejzr2qDDdS8ZR1KxF236+jIVWXwIIdEb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f67d418-8cd2-43cf-ba3c-08d90f25cf7a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 17:55:32.2686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6IIJv1sWmrxUf8CuguEbH4ZMGdgNukQPEDk3/qOHKzkgN2S6VhBhuwGNHZcFRmdqkhzcQhJ5y8ZG5Jyq501Wl9fn7R2S0AjbjXIyaBmAEio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5854
X-OriginatorOrg: citrix.com

On 04/05/2021 13:48, Jason Andryuk wrote:
> The vtpmmgr TPM 2.0 support is incomplete.  Add a warning about that to
> the documentation so others don't have to work through discovering it is
> broken.
>
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

This is definitely the kind of health warning needed for people playing
this area.

