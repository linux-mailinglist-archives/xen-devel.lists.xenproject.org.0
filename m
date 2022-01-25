Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E9549B6CF
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 15:50:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260415.449872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCN9N-0006gV-Jg; Tue, 25 Jan 2022 14:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260415.449872; Tue, 25 Jan 2022 14:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCN9N-0006dI-F2; Tue, 25 Jan 2022 14:50:25 +0000
Received: by outflank-mailman (input) for mailman id 260415;
 Tue, 25 Jan 2022 14:50:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUgY=SJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nCN9L-00033A-HQ
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 14:50:23 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ddf2291-7dee-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 15:50:21 +0100 (CET)
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
X-Inumbo-ID: 1ddf2291-7dee-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643122221;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Eqx20PH3bAMsKhLusTbAGPfcJHTu0hK5IU+4+pHYn0U=;
  b=VIuaSNpQhrnGUEIM7heiAq8o+dDlzLTW77As6po1OUnHAxn32cuZjwk9
   Jp8iQz3OPDqpsXEz4lzFjKTidNguUzTo0y4JFfngFectOmuUNo1gbWJRr
   VI7yW8PjSdAxUwxjBrXnUr/yqrS8QGyjhqyBooAUBZJ+OozaDl6P7CGWR
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5u/vxmqF48XsEYBr7dCsFG0wEywCXnBJ1Xi3TEQSOrpeaK+pPZxw1btriIUcPaznONxxMMPJsS
 jUhKh019TtuHuUR/E74/tK4QJm/g5TFUujNBGViIFN0TN3RK5vqyNIXIJGnjVL5P/zdrMQPgVA
 arsTHgyIb+aqH+R9stmkZ2P4XW5W2OCfVENhuJgaRQnYHpYOuo3xyEEPUzmYEhZEV5VlM2XaJY
 cR3NTo7+zs1njCskKWHDWKPiLc0UHLMcFsw7G3ng/0rOp3kI6qpnakbM7befImYdQSj/y2Pzfg
 aUnZIqb4neRuxnfVVvU6rtNa
X-SBRS: 5.2
X-MesageID: 62635627
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:HdTC5aLOV0tr2qUUFE+RNZIlxSXFcZb7ZxGr2PjKsXjdYENShTQFn
 GsXWz2CPa7cMzD2Kd52YImxph4HvpKHmoAyHgRlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Us5xrZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2Qrtdhk
 fpJp6bsagEnN/D9ku4AbQthRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2Uv4EDgWlq2aiiG971e
 eswdgZIcyidak10G31LIr0lt8qn0yyXnzpw9wvO+PtfD3Lo5A5+yr/2K/LOZ8eHA85Smy6wu
 Wbu72n/RBYAO7S32TeDt36hmOLLtSf6Q54JUq218OZwh1+ezXBVDwcZPWZXutHg1BT4AYgGb
 RVJpGx+9sDe6XBHUPHkbhqo+VGArCRAeNxeGrAL4guQ9LjttlPx6nc/chZNb9kvtckTTDMs1
 0OUk96BOQGDoIF5WlrGqO7K8Gra1Tw9aDZbOHRaFVdtD8zL/dlr5i8jWOqPB0JcYjfdPTjri
 w6HoyEl71n4pZ5ajv7rlbwrbt/Fm3QocuLXzliPNo5GxlkgDGJAW2BOwQKHhRqnBN3BJmRtR
 FBex6CjABkmVPlhbhClTuQXB62O7P2YKjDailMHN8B/q2/1py/8It4BsWkWyKJV3iAsI2OBj
 Kj74ls52XOuFCHyMf8fj3yZVazGMpQM5fy6D6uJP7Kik7B6dROd/TEGWKJj9zuFraTYqolmY
 c3zWZ/1VR4yUP07pBLrGbt1+eJ1l0gWmDOCLbimnk/P+efPOxaopUItbQHmghYRtv3U+W04M
 r93aqO39vmoeLSuO3aMqd9KcwliwLpSLcmelvG7v9Wre2JOMGogF+XQ0fUmfYlklL5SjeDG4
 je2XUow9bY1rSevxdyiZi8xZbXxc4x4qH5nbyUgMUzxgyooYJq17bdZfJwyJOF1+OtmxP9yb
 v8EZ8TfXagfFmWZo2wQPcvnsYhvVBW3ngbSbSCrVycyIsx7TAvT9966Iga2rHsSDjC6vNcVq
 qG70l+JWoIKQglvVZ6EaP+mw16rk2IaneZ+AxnBLtVJIR2++4l2MS3hyPQwJphUexnEwzKb0
 SeQAAsZ+raR89NkroGRiPnd/YmzEuZ4Ek5LJEXh7O67ZXvA426u4Y5cS+LULzrTY3z5pfe5b
 uJPwvCibPBexARWs5BxGqpAxL4l44e9vKdTywlpESmZb1mvDb88cHCK0dMW6/9Iz75d/wC3R
 liO6p9RPrDQYJHpF1sYJQwEaOWf1K5LxmmOvKpteEiqtjVq+LenUFlJO0jegSNQG7J5LYc5z
 Lpzo8UR8QG+1kInP9vuYvq4LIhQwqjsi5kai6w=
IronPort-HdrOrdr: A9a23:dim6ta3JqpR/3NtUlqmMlgqjBSpyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJU80kqQFnbX5XI3SITUO3VHHEGgM1/qF/9SNIVydygcZ79
 YaT0EcMqyAMbEZt7eC3ODQKb9Jq7PmgcOVbKXlvg1QpGlRGt9dBmxCe2Gm+yNNNWx77c1TLu
 vi2iMLnUvqRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUID/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF+nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSv2OwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KPoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFpLA
 BXNrCd2B9qSyLYU5iA1VMfguBEH05DUitue3Jy+/B8iFNt7TVEJ0hx/r1pop5PzuN4d3B+3Z
 W2Dk1frsA7ciYnV9MMOA4/e7rENoW0e2O1DIuzGyWvKEhVAQOEl3bIiI9Fkd1CPqZ4i6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.88,315,1635220800"; 
   d="scan'208";a="62635627"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtgMNc/9nKTu6xrSplo0tkkhVA6bxISQ8yJb8WRZvF56l7e0LijgZKI+XeukS8yHWpflwV7evEhF7R17LZiXZCO9Yj9yUbEUOO5oQTUUYLq+ViVlit1MsyNzg3zPEs8swTn08SyFqIH33YBpxvTeyUSkU/LmwfrAq56gx+757OrPw9D2ern5RYL3bkkLvdj/ueEfDYFy7NtBjK2AciLVkBs2gFFGnMfOjU8dWY+JpVjH8wYrRr9a8pNy9Cmiu+0cRgdt7bz0zGmJoruUW2ibpTYr/HLy7VXWbbhkYZ0YLTJ74KJNrNpK19gF6Cf8Vhw3GS4YrF+edEfoPOYdIt6JQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CKBxmdpTfoOmyTPejv/3lOo/EtPuysXYY91sehS4dfs=;
 b=PgC8f4UxY/rcMjBlP0pqgErPtoJAavHrM0/vEBjdY4pl77VhzCBJQVv2u12wJQDTG38lxE+1+7RRRqaK7zhsyuj2vztkvxti9UQD014Q6+4MAE+vt16ZDSvtNX/KT24fE7EyysjdsCJHN1dblilQAylgqMHfbliAV4+xG2Ju9gWoxE3aoHYWnWK4coSX9dtXtT/vis9RI6MjoXdhvZ2aTa3mi/zY91bq2sQcSKPiw/kr0Pltr11xBzkWl0liufY4d3nEK3cWTBpbAtArURU6330zZ2kaWKvAeOeENA0O+uCPJ1RFEYAmcDembEe7zuKlVjhZqPoAymiJ7YUSOZdbOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CKBxmdpTfoOmyTPejv/3lOo/EtPuysXYY91sehS4dfs=;
 b=Shb5ii9XBomzpNO0Dj17+qAzCDR9Da+5JR4lbVGZG5C7yAosmx3SI2z4uS19YNm+Urnoz5V10oP7yFO9KJMjTbymZtSyJmyykNgaILN8TvfjGsAvEyHvCHC1fSVFmqu+5U07hFTJ6tjG0unYG6YEyBfDNQ6Mpg3eatuBLTZB92s=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v7 06/11] libs/guest: introduce helper set cpu topology in cpu policy
Date: Tue, 25 Jan 2022 15:49:30 +0100
Message-ID: <20220125144935.44394-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125144935.44394-1-roger.pau@citrix.com>
References: <20220125144935.44394-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0012.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6b5b9a4-275f-4dba-038f-08d9e011ff2f
X-MS-TrafficTypeDiagnostic: BYAPR03MB4568:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB4568030BC3FB84BFC2375A618F5F9@BYAPR03MB4568.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ByJYa4IQvVpBqu4zl+cNeB+mt2UQ+qLnlU6dF465ERgcraNQQewTPNI0h3ploPfkZT9RuEXHDmDJUzB5qIkKHNP2xkakuHY40/LZizWRgbtljJZReBqgoU/wq1VTaTxHYo5l0GlEJKop70Xz9Kqof0lgIP/kCW2RW1JsTsG9/SloFRaoQS04yu+YIqTgwoeWkj7tsNISOlpdyejFxNlFZGDfv+DRQw9KFyikylavsq4Dkngw3jJqZsxbexyfCfVa7ZQcGRWBLDnFa5GfrR7lxsxQ1vPVDhtztSXZidKwk5O5wKBfUWe84eYs1FqLgdcR8q3eKIyHyGA0xll7aNJ8pGezD7Z+O9VoineyYo3LmT1mmyimhvUPZBRTFHeefy2XPzIHwx+e49zB6p3IXDXJO4SMpJPW3URfZViVCJYtPHepvoyM2Bs0eUOz2rVSN9gHZcpyc0o9emtSHgIU8PNQEPtbERia4s/H97rFUlOGR/lZ+/6KEO8bNPOu+9W0osvaKPzU8orUkaYJF+uxKtObf3COfQM5OgyA8X2QoUrdzp9s5k7YdiqxUbY4eTwPFVkWnEhgT6PUtJEQy3Tq4NayzjMfWNDQDEWZlccg1ZwwLXoB9Hzm55NwK7CwW5u5RatHj47qOUhha0/veDiC64EFhw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(8676002)(26005)(1076003)(2616005)(6512007)(508600001)(6916009)(83380400001)(54906003)(36756003)(2906002)(316002)(8936002)(66476007)(5660300002)(86362001)(6506007)(82960400001)(66556008)(6666004)(186003)(66946007)(6486002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTVuOHdVYmtyckErRE91bWZ4eGdOS1JzQVZTQkQ2eXAzZkxkTjJvTzFJVkhQ?=
 =?utf-8?B?WE5BTE1JdTVyK2h6c1AzV0cyckJTMWZQbXJOTlJ4MkhoUW4vakNnY1hUOVkr?=
 =?utf-8?B?TU1Eb3RCRFhDZ0NXU2ZROVFJQVc0T0liL28wcWkyQ3kzZjhQTTZtY201UUl3?=
 =?utf-8?B?SDFZUFRiZk5aVkNna2JLVlFPemt0QVBBaU1mcTRiWGxjemh6TElyNStvbWpN?=
 =?utf-8?B?QTNSUmRTbmVEelh4Z2FMOHAwYWx4L3M3MmFpbENNU0xKWlJPaG9CbTJVM0RN?=
 =?utf-8?B?Yi96VVluaExIQm42di96NFdHeVdLUHFGU3BoVG1DVThaVHVncUNLaFVlZ2Jp?=
 =?utf-8?B?bVQyNzJ3STljbHdPSWQ5MXk4WFV4M3hLTlhRaTRML2x0OEE0T3lWa29lMzl2?=
 =?utf-8?B?RFY3eDRtSXpidk0wQnVBOERzNUs0Q0VIVTFCWkpPeTZvaGZ0T2x2dkxFSzd5?=
 =?utf-8?B?eHA1UW9GVHZpa1duRUxWdzdlcW53dlhMYWdYVEpEelR0OHkyZTZnNWp2emxi?=
 =?utf-8?B?MCtpYnFKYnQ0RkhHdmxnQXpieXNaNHVyMEFKa2tJU2duTWdEUndlRzZFREJC?=
 =?utf-8?B?NERqWkVJUUtoTDZkN3RMOS9VQW5RUmhuVFlqQS93S2U0T2NUejdYOGQrMm1m?=
 =?utf-8?B?S0c3ZjViV2ZBUFh4QWFLOWV1RlkwNklNL3EwMHRCTjZzR0pRSGRTOWR5TmY0?=
 =?utf-8?B?b1BjZldBL3ByVnVHanZRT1JJVUFxbkJmQW5EYjlWOU5EYzM2dHRxVHJSc3pD?=
 =?utf-8?B?TkhQbWtveGdITXdrWW13NVlHa1VWWkdEamxWN0pqclBNbWx4bmVvbkF4VWNq?=
 =?utf-8?B?ZDdaeW5Ram9qbnhQdUVYbWtqMlJiLzd6bm9teW55UTRlWHMxQnZmdDcwRXhj?=
 =?utf-8?B?RE9SSkRReTJiMmVhSmlmRmpQb2pFc2d4T2ZpeFpPOVZoTDZvR1djeEY1ZlYy?=
 =?utf-8?B?ZXU1UmdsYVBEU09wR28ycWRBZzh3eExjZXhHNlhvZ2xzU0xvNWRUWWJZL2oz?=
 =?utf-8?B?b0N3RFBLMko0UlhPeUFyR3JqUTNFM21GampRRFdycVNMTWRIREN3Q0lLMWpj?=
 =?utf-8?B?TDhIeHY4K2dKaEhxUnZLdVRFOXc5K3NGVnZLamk0YWhVNHFEUnFGTjdpS2Rj?=
 =?utf-8?B?eGltYlRlZXFaUWdEZjk3UDVMbDdmTmtKdmhIQ21xbFhJNXIvUHVJeGw0RENy?=
 =?utf-8?B?NXh3QjRBOG13d1pxOFJ4QVBWSERWeE1rSFVyS3JnNlA2T1V0UlU1bVhlSzNZ?=
 =?utf-8?B?L2dKc1VxUkhVRTFtR1JvemNSVUp5ZGV2Vkx5amJqVWlBN0NUbExCSzhKUTcz?=
 =?utf-8?B?a3hMcDF0NWpKWlBrL21Gc0FtQi9wdzR5M2MrNUdTdktUREdTTjVSMzdhRzF1?=
 =?utf-8?B?SWU2YTVlS00xT1JCK2s0YkQ2ZVhzSkNUM2xvZkdjZmZUZGl3SlBCRHZTa2pw?=
 =?utf-8?B?V2M2ZWgzbER6QWNod1FUUkVPd1R2WjBiOHVjMk1QaTNEQTNBZk9jTFBmeTho?=
 =?utf-8?B?OVlXSXZsQTJoeUtKODNEazloTUYyTnBvdkt3M1ZnYy9wODg5a3NUZWhoRUJj?=
 =?utf-8?B?bzZzcU1qYzVNaUd0aTMvaGl2bUZSWDFJb2RGR3R5K3ZLSElsOXpxT2ZnZ3Fl?=
 =?utf-8?B?VWN5bUVTZW5IcDJLUTJXblI3b24xVGpMa2NhMmN3RGRCY296YVFKbnM5MDAv?=
 =?utf-8?B?cittQ0pMbDVBcEhJb2lNMWgya2hxRHBTTURoVkUzbEgvZjlUZ3k2WWxQNWhn?=
 =?utf-8?B?V3J6a05NNDJvQkZiMnJ3MDlZK0lrcE5ZdmZMSHRmR2VmTzBqYTQxL3FaLzlY?=
 =?utf-8?B?RVhrN1NZTVBvWk9SY1BicEphTWYraGhIUGxLZUdlaVBnU1BwVVlENmJTb0Nm?=
 =?utf-8?B?TDc2dWZJWEpxUS9ocFl0aEJOWTJWbG5QNE5sc1E0d1dJU2luVjlDOUxnL1VZ?=
 =?utf-8?B?SzhtaGlLN29NVVRTZzJVOExUaGxCdTIwT3FncHZoWmRDSlZldFJ2clVndzUw?=
 =?utf-8?B?S3M0Um9YUVJScW4zVFArVzNDQVpudERsMFBDeldWNjBvSzUvSTFZeUdrTjRW?=
 =?utf-8?B?VEVzS2FlSXdSSGxJbzVicHlyOXpUQ2Z3dGVuVnd0NUZJdFJXL0JDdXhHakdS?=
 =?utf-8?B?OUl1WWxBVGVIeVNGNWJudW1UL3UyYm1IVGd0MzMzQTlkb0NPaFU2Tm5KVFJR?=
 =?utf-8?Q?3F0vxh2YzaUmmZVyi5ZEQmw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b5b9a4-275f-4dba-038f-08d9e011ff2f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 14:50:15.1535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ntP8zfWioogsrYOpIBPzrMYfROx8XJGk+9AfpbKgK+VlQL531j4WvuHBCxTNPdCzRMFWrd5epiOwgu7Vvzt6Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4568
X-OriginatorOrg: citrix.com

This logic is pulled out from xc_cpuid_apply_policy and placed into a
separate helper. Note the legacy part of the introduced function, as
long term Xen will require a proper topology setter function capable
of expressing a more diverse set of topologies.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v6:
 - Pass a host policy to xc_cpu_policy_legacy_topology.

Changes since v5:
 - Keep using the host featureset.
 - Fix copied comment typo.

Changes since v4:
 - s/xc_cpu_policy_topology/xc_cpu_policy_legacy_topology/
---
 tools/include/xenguest.h        |   9 ++
 tools/libs/guest/xg_cpuid_x86.c | 165 ++++++++++++++++----------------
 2 files changed, 91 insertions(+), 83 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index df18c73984..5e60f81192 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -821,6 +821,15 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
 void xc_cpu_policy_make_compat_4_12(xc_interface *xch, xc_cpu_policy_t *policy,
                                     const xc_cpu_policy_t *host, bool hvm);
 
+/*
+ * Setup the legacy policy topology.
+ *
+ * The `host` parameter should only be provided when creating a policy for a PV
+ * guest.
+ */
+void xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t *policy,
+                                   const xc_cpu_policy_t *host);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 20fd786da3..6d8d16eed5 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -429,14 +429,12 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 {
     int rc;
     xc_dominfo_t di;
-    unsigned int i, nr_leaves, nr_msrs;
+    unsigned int nr_leaves, nr_msrs;
     xen_cpuid_leaf_t *leaves = NULL;
     struct cpuid_policy *p = NULL;
     xc_cpu_policy_t *policy = NULL;
     xc_cpu_policy_t *host = NULL;
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-    uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
-    uint32_t len = ARRAY_SIZE(host_featureset);
 
     if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
          di.domid != domid )
@@ -461,24 +459,14 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
          (host = xc_cpu_policy_init()) == NULL )
         goto out;
 
-    /* Get the host policy. */
-    rc = xc_get_cpu_featureset(xch, XEN_SYSCTL_cpu_featureset_host,
-                               &len, host_featureset);
+    rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
     if ( rc )
     {
-        /* Tolerate "buffer too small", as we've got the bits we need. */
-        if ( errno == ENOBUFS )
-            rc = 0;
-        else
-        {
-            PERROR("Failed to obtain host featureset");
-            rc = -errno;
-            goto out;
-        }
+        PERROR("Failed to get host policy");
+        rc = -errno;
+        goto out;
     }
 
-    cpuid_featureset_to_policy(host_featureset, &host->cpuid);
-
     /* Get the domain's default policy. */
     nr_msrs = 0;
     rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
@@ -562,72 +550,9 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         }
     }
 
-    if ( !di.hvm )
-    {
-        /*
-         * On hardware without CPUID Faulting, PV guests see real topology.
-         * As a consequence, they also need to see the host htt/cmp fields.
-         */
-        p->basic.htt       = test_bit(X86_FEATURE_HTT, host_featureset);
-        p->extd.cmp_legacy = test_bit(X86_FEATURE_CMP_LEGACY, host_featureset);
-    }
-    else
-    {
-        /*
-         * Topology for HVM guests is entirely controlled by Xen.  For now, we
-         * hardcode APIC_ID = vcpu_id * 2 to give the illusion of no SMT.
-         */
-        p->basic.htt = true;
-        p->extd.cmp_legacy = false;
-
-        /*
-         * Leaf 1 EBX[23:16] is Maximum Logical Processors Per Package.
-         * Update to reflect vLAPIC_ID = vCPU_ID * 2, but make sure to avoid
-         * overflow.
-         */
-        if ( !p->basic.lppp )
-            p->basic.lppp = 2;
-        else if ( !(p->basic.lppp & 0x80) )
-            p->basic.lppp *= 2;
-
-        switch ( p->x86_vendor )
-        {
-        case X86_VENDOR_INTEL:
-            for ( i = 0; (p->cache.subleaf[i].type &&
-                          i < ARRAY_SIZE(p->cache.raw)); ++i )
-            {
-                p->cache.subleaf[i].cores_per_package =
-                    (p->cache.subleaf[i].cores_per_package << 1) | 1;
-                p->cache.subleaf[i].threads_per_cache = 0;
-            }
-            break;
-
-        case X86_VENDOR_AMD:
-        case X86_VENDOR_HYGON:
-            /*
-             * Leaf 0x80000008 ECX[15:12] is ApicIdCoreSize.
-             * Leaf 0x80000008 ECX[7:0] is NumberOfCores (minus one).
-             * Update to reflect vLAPIC_ID = vCPU_ID * 2.  But avoid
-             * - overflow,
-             * - going out of sync with leaf 1 EBX[23:16],
-             * - incrementing ApicIdCoreSize when it's zero (which changes the
-             *   meaning of bits 7:0).
-             *
-             * UPDATE: I addition to avoiding overflow, some
-             * proprietary operating systems have trouble with
-             * apic_id_size values greater than 7.  Limit the value to
-             * 7 for now.
-             */
-            if ( p->extd.nc < 0x7f )
-            {
-                if ( p->extd.apic_id_size != 0 && p->extd.apic_id_size < 0x7 )
-                    p->extd.apic_id_size++;
-
-                p->extd.nc = (p->extd.nc << 1) | 1;
-            }
-            break;
-        }
-    }
+    policy->cpuid = *p;
+    xc_cpu_policy_legacy_topology(xch, policy, di.hvm ? NULL : host);
+    *p = policy->cpuid;
 
     rc = x86_cpuid_copy_to_buffer(p, leaves, &nr_leaves);
     if ( rc )
@@ -933,3 +858,77 @@ void xc_cpu_policy_make_compat_4_12(xc_interface *xch, xc_cpu_policy_t *policy,
     policy->cpuid.feat.max_subleaf = 0;
     policy->cpuid.extd.max_leaf = min(policy->cpuid.extd.max_leaf, 0x8000001c);
 }
+
+void xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t *policy,
+                                   const xc_cpu_policy_t *host)
+{
+    if ( host )
+    {
+        /*
+         * On hardware without CPUID Faulting, PV guests see real topology.
+         * As a consequence, they also need to see the host htt/cmp fields.
+         */
+        policy->cpuid.basic.htt = host->cpuid.basic.htt;
+        policy->cpuid.extd.cmp_legacy = host->cpuid.extd.cmp_legacy;
+    }
+    else
+    {
+        unsigned int i;
+
+        /*
+         * Topology for HVM guests is entirely controlled by Xen.  For now, we
+         * hardcode APIC_ID = vcpu_id * 2 to give the illusion of no SMT.
+         */
+        policy->cpuid.basic.htt = true;
+        policy->cpuid.extd.cmp_legacy = false;
+
+        /*
+         * Leaf 1 EBX[23:16] is Maximum Logical Processors Per Package.
+         * Update to reflect vLAPIC_ID = vCPU_ID * 2, but make sure to avoid
+         * overflow.
+         */
+        if ( !policy->cpuid.basic.lppp )
+            policy->cpuid.basic.lppp = 2;
+        else if ( !(policy->cpuid.basic.lppp & 0x80) )
+            policy->cpuid.basic.lppp *= 2;
+
+        switch ( policy->cpuid.x86_vendor )
+        {
+        case X86_VENDOR_INTEL:
+            for ( i = 0; (policy->cpuid.cache.subleaf[i].type &&
+                          i < ARRAY_SIZE(policy->cpuid.cache.raw)); ++i )
+            {
+                policy->cpuid.cache.subleaf[i].cores_per_package =
+                  (policy->cpuid.cache.subleaf[i].cores_per_package << 1) | 1;
+                policy->cpuid.cache.subleaf[i].threads_per_cache = 0;
+            }
+            break;
+
+        case X86_VENDOR_AMD:
+        case X86_VENDOR_HYGON:
+            /*
+             * Leaf 0x80000008 ECX[15:12] is ApicIdCoreSize.
+             * Leaf 0x80000008 ECX[7:0] is NumberOfCores (minus one).
+             * Update to reflect vLAPIC_ID = vCPU_ID * 2.  But avoid
+             * - overflow,
+             * - going out of sync with leaf 1 EBX[23:16],
+             * - incrementing ApicIdCoreSize when it's zero (which changes the
+             *   meaning of bits 7:0).
+             *
+             * UPDATE: In addition to avoiding overflow, some
+             * proprietary operating systems have trouble with
+             * apic_id_size values greater than 7.  Limit the value to
+             * 7 for now.
+             */
+            if ( policy->cpuid.extd.nc < 0x7f )
+            {
+                if ( policy->cpuid.extd.apic_id_size != 0 &&
+                     policy->cpuid.extd.apic_id_size < 0x7 )
+                    policy->cpuid.extd.apic_id_size++;
+
+                policy->cpuid.extd.nc = (policy->cpuid.extd.nc << 1) | 1;
+            }
+            break;
+        }
+    }
+}
-- 
2.34.1


