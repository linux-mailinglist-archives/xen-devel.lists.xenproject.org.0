Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDAE355ABE
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 19:51:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106175.203059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTprP-0003D0-Fu; Tue, 06 Apr 2021 17:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106175.203059; Tue, 06 Apr 2021 17:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTprP-0003Cb-Cv; Tue, 06 Apr 2021 17:51:31 +0000
Received: by outflank-mailman (input) for mailman id 106175;
 Tue, 06 Apr 2021 17:51:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hTMm=JD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lTprN-0003CQ-TV
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 17:51:29 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a795b72-c700-43a5-aa97-7a595868144d;
 Tue, 06 Apr 2021 17:51:28 +0000 (UTC)
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
X-Inumbo-ID: 0a795b72-c700-43a5-aa97-7a595868144d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617731488;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Gp2PlTHCZ9yAIsl7sHQCptBU5La8g8zCht8zzfL4ZP0=;
  b=SM+KshgmzM8R4jmqrGglmhUoVwLEe2axfoomoBLjWN88ATUKuWU294d8
   GEvhtB4tquVZyUjJiFQFBMTSPrzo2RtRYzbQPu+Rp5QbhLRk2OZ70P9CM
   kWWYvYuCwCr7tll5tBIhUw5jzP3L+q39PfPZeMaqvt4bbRtBySx2fxF2P
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ehOD1yQPPPsPmrUHV0mQqx8flCtW8EkSeSOfOXl+eIJ4la3MSGoDA09JAS0N52SBP1XRIe2Fy4
 u6v8Sh2zOKHkKFMl6C7qYnEPI4AQOlRL03vZzHD1l0/Mwt3WlvPiwsx4F/wGpQ4VRapZWxg1yR
 ELV3BYm/EnWdBbBO7HhO0BQK3EnItegd9riInHZQ2niJXzElrimH4hE9v+PZUbOiVspZlM3/60
 ZAUoYfxwdbC7sXeH8P9gOrLI/Zt5iz9DcF7XvhhDj/VZy47HnRRt0H3k4iqKEOL7XqEV2ZNeo7
 gvU=
X-SBRS: 5.2
X-MesageID: 40989244
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:jKB8a69NorlnWQpgzvFuk+F3cL1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmzybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIULD38Zn/+
 Nbf6B6YeedMXFTkdv67A6kE9wp3dmA9+SSif3Dymp2JDsLV4hLxW5Ce2GmO2dxQxRLAod8MZ
 Ka6NZOqTbIQwVoUu2QAH4ZU+/f4+DRnJX9bhIcQzIh4g+CjTSngYSKbCSw9BEYTj9J3PMe4X
 HI+jaJmpmLntOa7lvn12HV54lLg9eJ8Lp+LeGFl8R9EESWti+Gf4JkMofyxQwdgObq01oylc
 mJnhFIBbUP11r0XkWY5STgwBPh1jFG0Q6R9Xa9jWH4qcL0ABIWYvAx/b5xSRfS50o+sNwU6s
 sitAj1xvknb2K1oA3H69fFTB1snEavyEBS99I7tHBDTZAYLIZYsI13xjInLL47ACn45Io7ed
 Meaf302fA+SyL/U1nkpGV1hPSjUnMvdy32OHQqi4i+1jhbm21B1E0IxMATtWdozuNMd7B0o8
 vDKahmj7dIU4s/ar98Hv4IRY+NBnXKWg+kChPdHX3XUIU8f17doZ/+57s4oMmsZZwz1ZM33L
 DMSklRu2Iec1/nYPf+naFjw1ToeiGQTD7twsZR69xSobvnXofmNiWFVRQHj9agi+93OLyYZ9
 +DfLZtR9PzJ2rnHohEmyfkXYNJFHUYWMoJ/v4mRlO1pN7RIIGCjJ2ZTN/jYJ7WVRo0UGL2BX
 UOGBLpIt9b00ytUnjkxDfLXXfAfVH+4IJQHKDW8/N78vlICqR89iwuzXip7MCCLjNP9oYsel
 FlHb/hmqSn4Um6lFy4qFlBC154NAJ48b/gW3RFqUshKEXva4sOvN2ZZCR31HuDLRlvctPOHG
 dk1hJK0JPyC6bV6TEpCtqhPG7fpWAUvmi2Q5AVnbDGwsv5ZJUiDNIDVLZqHQvGUzx58Dwa6F
 trWUshfAvyBznugaKqgNg/H+fEbeRxhw+tPIpzsnLQtUKVoOk1XXsFVzuSUcqa6DxeAgZ8tx
 lUyesykbCAkTGgJS8Um+IjKmBBb2yRHfZ7FgifXZ5VnbrqYQl0am+PiVWh+kgOU1uv039Xqn
 3qLCWSd/2OJlZGoHhX3pzn905OenyHc1h9bW17toNBBX3L00wDpNOjV+6W6S+8e1ECyuYSPH
 X+bTweLhhH6vq32BSW8QzyWEkO99ELBKjwHb4je7bc1jeRM4WOj7gBBOIR1o1iLsrSvugCVv
 +/dweZICjjMf4g3xWYqx8eSXFJgUhhtcmt9Azu7WC+0nJ6POHbJ05+QaoHZ/6b9GrpSp+zod
 1EpONwmdH1FGr/atSLk/6KKxFCLw7eum6wQaUDr4tOsac7qbt0GN36XFLzpQd69SR7CP2xsk
 UUBJlfyvTmHKREesQJYSJX/lYzjr20XQEWmz2zJtV7RE0nin/QAsiA7LXJo4c+G0HpnnqGBX
 Cvtwlmu8rfVySN1bQmG7s9DGRfZk878mlj9oq5BsTtITTvU+FI51yhNHChNJdbVaieAL0Vxy
 wKr+2grquydyDi3hrXsiY+CqVS83y/Scf3JA6XA+ZH/5ibPluL65Har/KbvXPSSTGhbV4fip
 AAXUsMbt5bgj1ntbYJ6EGJO+fKi3NgtUBf7zFhnkPs3YbjwF6zJzA2DSTpxrNMXTdSNXCUi9
 /i6ubw7gWn3AR4
X-IronPort-AV: E=Sophos;i="5.82,201,1613451600"; 
   d="scan'208";a="40989244"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vb4twpL8siboKtRnwsSlSUIJjQMQCV1XX4Wf6eM0k9BXh/ZcYB/5+PFF+6cgBZDZKxLq+ewrQzfHc7fP/RIfrMjcBYX+kutRvyb1DVsEVgBCq7tUS5uwT5mWiUMjmAXIesnqGNIiHpGPiA8klyNUsGG3ZdcP0gjKBqApJa4pTexOPIEJbUEfYS/LOO3kYwN2O0mf8Biol+n0mZD/m3fiErgIcUMZlVfI9pzhWzxrkbMimdhuYdHVrQDLhMY7qKXr3H90aRzgfH7gWIENrqS8KPcEcbtyOJHgJH27ZPpf049wHGMYe6UdR2XYsUwbVBWl+l4KBlsbHF6m/YiBZa1iBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gp2PlTHCZ9yAIsl7sHQCptBU5La8g8zCht8zzfL4ZP0=;
 b=MqsuDoAv+6tYDflSh36thAe15Mx7itz9DdHRYOnnXxI0q/nWwTEMgwxBwPaEb2zjd3hgXRfm2UTlk2Sn118+24skqnB/zTKXmJe1qLMRhxHQrXN/7o70g9skPa+/9j9gL2NfWAI/UyFS81yrzfXiiWZ81gJRg+72NYMpKVrUeKyhFG9vGmAp0wxmiPwNoITHQFfxjFi7g6BGW7x+z8XAGAsp/GHr+UJjPNweqibw/XpWYbFl+qOvTKtNYLk0eVsw2ZDDb1ikrE2jAijK04eP5qTIe2jVKdP/s1j9jdcaDnrRSWVa2HSeG0e2cTYnRUrG5P2KAnqhy2oOf4wfkSkPbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gp2PlTHCZ9yAIsl7sHQCptBU5La8g8zCht8zzfL4ZP0=;
 b=JJsJLcOwdTCu4dkKmrPiZ5y2bg14XJR0RIphMrEYvrdRo4JAyUzE56av1Iwbwihr/qK8N34vPr/FImLeG9Ro8vN9OGdCGaEwHmoGW8VLjTXHtNaKq4JTGICwrjkyE13L3w7U6JkKj3lzgQzDZercBUyzr7Tv9aos2y5yH+gXYJY=
Subject: Re: multiboot2 and module2 boot issues via GRUB2
To: Jan Beulich <jbeulich@suse.com>
CC: Roman Shaposhnik <roman@zededa.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, <grub-devel@gnu.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <CAMmSBy8Wpwgj3V0U8OhsZCgyAxOjTeHDMt-Vw+om1koopmxTsg@mail.gmail.com>
 <23baec07-a3ae-949a-a1fb-09100efd53e5@citrix.com>
 <CAMmSBy96=FwR0zZy199e0YhFefgZj_PFOMiaB2nKjqdQvKufow@mail.gmail.com>
 <b5ed3a53-5152-aba1-820d-ccab72a82c61@suse.com>
 <YGWH89ubVe104Tnl@Air-de-Roger>
 <a8c7fb60-7a95-1a99-4005-b04bcac4c2be@citrix.com>
 <f800ac60-7d49-fa08-ca8d-1c75408dd2de@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f835e433-368c-b107-9963-9107d3432ce6@citrix.com>
Date: Tue, 6 Apr 2021 18:51:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <f800ac60-7d49-fa08-ca8d-1c75408dd2de@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0057.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::21) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f1665f1-0621-44aa-1653-08d8f924982f
X-MS-TrafficTypeDiagnostic: BN6PR03MB3122:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR03MB3122DC10E0687FF1D3C70675BA769@BN6PR03MB3122.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SLJUldbT5+9o0Jzc0t6sjO+BPfAGr4qEexHiK9q0golflnZmVp2K/RjeSJZeVxcNtLV+L4i8P7aoyO2OLXRpMA34Wzqn24y63uc/WPA4U9KEumQjwR6aY1923l5h93+pwEuOxH47HFl5faY+9GPRHCUgc1Qm/rNcC21j1gpoL5aouoFY6olg/cgmTFfOgkQztqSwX7/da0bnJfLvh3UD3qOfXuHHLiNh1sRltZj/HPTNNin2WryAybd/k8YMztLknJHiRNL7R12KQ2/xnrc3npnPDVPpbUx/Nu6GkfnEv2vebAzjy2wxU16VDVo793Ox5tB0Clsso4BftKfz0go8anL2LHxxBYkQyBwnMd1Ea199kDM3uyWHaa5MHPU43iEAiqQH0JHuFNXCgoAOEJWAGo+50LC41klLlJ+zDg9bZGGQb7hg54710iLpL3WQAqYTeIc9hXjzKhX8mGnHxNqGRn+t1AQd4YP+7zSSMjSbBY7We4gcy5PxlvmDLcX+nraZScGhTvu9qcD4U2Suu8N3kh/66WY7Lxf2UuA2B+k8DEyN9o/2660yNEea48IS/pKnppyE//vT7DZqLXFi7deHv7/k4PNl8p1F4GLelGKDEmPbHcbiV8jG7d30NQtd7FUIYlVGS8fXs1Je4ycJdukRGbLFgTFlsyY9BCVDd3jcjqmiYQZMSbg9LyNEjPDDpyL8ZMD9vESzC5ng3s5USUnh6yoWovFFX+vfx+4V8zzRs8c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(54906003)(6916009)(478600001)(16576012)(31696002)(66476007)(53546011)(8936002)(316002)(31686004)(83380400001)(107886003)(956004)(4326008)(16526019)(6486002)(26005)(2906002)(8676002)(66946007)(5660300002)(36756003)(66556008)(86362001)(186003)(38100700001)(2616005)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WUtDUFhtVWNuL0RBVFBPblFBZ1YwQWQ3NkxKL3dDK1hPZ2FsakZOaExLa2Vr?=
 =?utf-8?B?OVdaa3FjQjI1QnA1bGZXOHJYbkFBb0hlY3JXeGEvQXVQNEZabVVSTlZrdElT?=
 =?utf-8?B?aWNiL3RIa0h4UmtscW9DZVV3bW5BaGVLRGNlQWFhc2QyWkU2ZGt1cFZwNHI5?=
 =?utf-8?B?VUp4WUJINkVSaFdPTXVsalNoUnpqVjk1S0lqaHJUYlA1dmdZbzlMcUF1Wkcy?=
 =?utf-8?B?Q2tKMnJrd3NEMVNBUE9tTlcwekJiaWFkU2pEeUpPd0FrbEFaUHFyVTFCa1ha?=
 =?utf-8?B?V1MzWlZJUmprQTFKYmpsUkRhRE1SVm9PamFXOVVuYUExeWwva1VMNUR3cm9k?=
 =?utf-8?B?NG1peU1LUEV4M1Y1ZUZidGpHQis2Z0x5ZXFkclNvMTV3RnFDYlBabVprNUto?=
 =?utf-8?B?YXRZSG9HbFVpRnFPazRKc3A1RGt3ZGFDZmxqakJJUFdXQ0x6Mzdhc3d2SlQy?=
 =?utf-8?B?RkxpYVVkWi9uWHlvaFdTUTdzemsySTA0aXQxb2t2ZTByMktrTEY4bzI5Zjc3?=
 =?utf-8?B?RW5USmJEV2xWVXVKRzBxMCtZdVJHWklpMENUNkdxekRPejNaUW4zeFlPQ1c3?=
 =?utf-8?B?aUdvRGJWaHluUmZON1BBdmxvVmpTQXFCNG5SNmlHTjN2bkpFSzV6RTk0NFVS?=
 =?utf-8?B?MlZ6YUt3d2h5bnFPTmdLdWtlNEpKOE1ZMk50VGFQcmUyS0ljamJiQjh6ZGNQ?=
 =?utf-8?B?NWRDMHNyK2lzOWJIeGdocHZzT1dXQk5IcTh1UGZKWk9tKzBkbTduYlA0SEEz?=
 =?utf-8?B?MVNyYUhBL0RkRTVEa243YW8yZzk0amVXWFBueWZhZWQwWVZ0UmhUZ0NnSCtY?=
 =?utf-8?B?eVZCYzBQK2ZUMGtIbm5BQlhwWEJxcmV2czF1SllOSU43QVM2cHhCdzRwQTUr?=
 =?utf-8?B?aHlqOElJWVRNVlFUVDdhM3pFdVpDMGNzUWtxRTJnTkZCYTUxdlB5MmlvNVBy?=
 =?utf-8?B?UFJxOHdJc0F5T0doV0d1WUZYRWZTR3ErWUM2NlowK3BRNmdET3F0TXNjbjVU?=
 =?utf-8?B?djh6V0w5RVU4VHV1NVRUbURCOEVQejMzeElQRGxyUk9PNGZOYnNvcXJMb2Mw?=
 =?utf-8?B?dUVrdDdWbjBCeXZKRWE4SDlueGVFYmJwV2FpTXBBVjBML2FPbWEzd1A3MWgr?=
 =?utf-8?B?TzhtRkZIekNxOUJsckFRSnVValhqclc5UjNSNUZNZ3hoWi84WnJySEM3T1F4?=
 =?utf-8?B?VWZ4OTU3a2Z1MEl1UTdSbkNhL3BNSmltNDhEaDRoaEFXMmVrWklPRExwMjRF?=
 =?utf-8?B?bDM2QTBnSXhwQ3h3NEp6S2w3UTZRcGdLdFQ5eitJNW9zLzFha1RjYkFZWTlE?=
 =?utf-8?B?TTQ5bEZTSElHUjBiZGUwVFZ1RmJVam1LcnBvZ1FHcHQwdDZZVHBqLzBnSWR1?=
 =?utf-8?B?b3Q1K3poZjlQUTNYZTA1SXREZ0hqcVJ4NTdPdkhONnBtUTFqaGdnWCs0bllv?=
 =?utf-8?B?M0Y3UHIwbTVMQUw3RlBlNzRyeDVPNUVtTlZTZndKNHpHc1NQSFBpL1V4Zy9v?=
 =?utf-8?B?K1FGRm9tYUVKczB0UXdYcEErOFd0K2FjZXJOaVhjdFZDK1JUMk55TDY0MlJx?=
 =?utf-8?B?MzRhS0ZJYjY4aUswa1pxcVpFS1RFQnU5VkhYKzdycVBWcVExWHk1cXU0ckpa?=
 =?utf-8?B?d3dvVmRiK0pWbmpVZ2VsU2pGNFZTQVBkdDhOVzVZMU5VeTZDV2VNdjlqT3dj?=
 =?utf-8?B?UHN0OVNyZUE2Y25UandYakxFMlo5NWo5QWlUenRISE5EbTFnNmJkeXlrV3JG?=
 =?utf-8?Q?zi4BzNZNyw7EdFJZSXmSuZzkKfLfX58yGq9fWP4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f1665f1-0621-44aa-1653-08d8f924982f
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 17:51:24.1785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6E2mIG4urHlekoctYsbiNcj5uuHOZP1drlZLfuWldjNtmGFuAH0KZ4Sw44uykL5q8QNC9VedjkA5VyNeuL1YlRUZD6vZIDg5GUt3osRapU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3122
X-OriginatorOrg: citrix.com

On 06/04/2021 09:19, Jan Beulich wrote:
> On 01.04.2021 21:43, Andrew Cooper wrote:
>> On 01/04/2021 09:44, Roger Pau Monné wrote:
>>> On Thu, Apr 01, 2021 at 09:31:07AM +0200, Jan Beulich wrote:
>>>> On 01.04.2021 03:06, Roman Shaposhnik wrote:
>>>>> And the obvious next question: is my EVE usecase esoteric enough that
>>>>> I should just go ahead and do a custom GRUB patch or is there a more
>>>>> general interest in this?
>>>> Not sure if it ought to be a grub patch - the issue could as well
>>>> be dealt with in Xen, by concatenating modules to form a monolithic
>>>> initrd.
>>> I would rather have it done in the loader than Xen, mostly because
>>> it's a Linux boot specific format, and hence I don't think Xen should
>>> have any knowledge about it.
>>>
>>> If it turns out to be impossible to implement on the loader side we
>>> should consider doing it in Xen, but that's not my first option.
>> Concatenating random things which may or may not be initrds is
>> absolutely not something Xen should do.  We don't have enough context to
>> do it safely/sensibly.
> Well, I wasn't suggesting anywhere to concatenate random things.
> Instead I was envisioning a command line option giving us the
> context we need (e.g. "initrd=3+5").

That's a massive layering violation, and incredibly fragile to the order
of lines in the boot stanza.

Either fix it by using a single monolithic initrd, which has worked
perfectly well for the past 2 decades, or add a feature to grub to get
initrd-like behaviour for MB2 too.  I will object very strongly to any
Xen patches trying to do this.

~Andrew

