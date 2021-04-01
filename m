Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A333514AD
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 14:02:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104414.199697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRw0p-0005Td-Cb; Thu, 01 Apr 2021 12:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104414.199697; Thu, 01 Apr 2021 12:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRw0p-0005TF-96; Thu, 01 Apr 2021 12:01:23 +0000
Received: by outflank-mailman (input) for mailman id 104414;
 Thu, 01 Apr 2021 12:01:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Onq8=I6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lRw0o-0005T8-8y
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 12:01:22 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66b440e2-bae8-4cf6-a00c-55bb3e31f0d0;
 Thu, 01 Apr 2021 12:01:21 +0000 (UTC)
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
X-Inumbo-ID: 66b440e2-bae8-4cf6-a00c-55bb3e31f0d0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617278481;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=R6GBDxKhS3qtdNf++KnrNQw6MnOkE9dFm6CLdC2q+Nw=;
  b=ReVRMk5fwWI4snclHedcMrqWg8VRSglO0dU3ijn6WKL8QDsrlSRkCzHc
   J7sohT46wJtwhcvWabaxwUj71M4r4BWYYoL1/MjAGF3tAINFljwswdCef
   jBHGyJwuN/O2/qhc4Pos97fi6aXwPJ2zDukEDJnuOVG1RPcP7s6lKijEt
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Jaub2kREXajW/MpPqJOqLmWOhr0a6/H/Si9cJazw9ZSempVLcCvpwqLkDNxhdflWFXPZ4kYPjz
 I70z47dbB9ZlkbmQDTHmro9l/LdxzKIsky1t0u0MSME5uoKfQj1L5uMDxlkGJihfQhFEQOMEvf
 JU5Vhy7/KedMSFZla1HSU9HG9+koPSulFSkB5CLZm3SaAU4UL8sNksZ6Ea40ZwwO4mT0h3QdS9
 KPrhLQ7+Pk8RVtf57LY2DS60W8PvJbz36G3Uvb97/raGmDpXSdplEl1bjC4uTFRdvgZJZQrBmi
 XWs=
X-SBRS: 5.2
X-MesageID: 40664374
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:1KHQDqjCJ4/RgekKHXb8tERD13BQX3dw3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+YsFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmuZ
 tIW5NVTOf9BV0St6vHySGlDtctx8SG+qi0heHYi0xgVx1udrsI1WZEIyywe3cGITVuL5w/CZ
 aa+45jrz2vZXwYYq2AdwY4dsLEoMDGk4+jXAUPAAQp5BLLoTSj7rP7FBbw5GZjbxpkx7A+/W
 /Z1zHo/6nLiYDH9jbw9U/2q65Xltzo18dZCKW35PQ9Bz3whm+TFfxccpKYujRdmpDJ1H8Ll5
 32rw4kL4BP7RrqDxuIiD/M/yWl7zo08X/lzjaj8AjeiOj0XigzBcYEpa8xSGqh12MasNtx0L
 1G0gui3vI9Z3Ow/1WJ2/HyWx5njUayq3Y5+NRj60B3aocCdKRX6bUW4UI9KuZxIAvB9IslHO
 NyZfusgsp+TFXyVQG6gkBS2tC2Glw8EhCaK3JywfC94nx9mXB0yFYg38oPnnsM34JVceg028
 30dotvj71AVckQcOZUA/oAW9K+Dij3TQvLK3/6GyWpKIg3f1b277Ln6rQ84++nPLQO0ZsJgZ
 zEFHdVr3Q7dU7CAdCHtac7vCzlcSGYZ3DA28te7592tvnXX7zwKxCOT1gojo+Jv+gfKtezYY
 fxBLtmR9vYaUf+E4dA2APzH7NIL2MFbcETstEnH3qTv8PwLJHwvOCzSoeSGJPdVRIfHk/vCH
 oKWzb+YO9a6FqwZ3P+iB/NH1z3fEjS+o9xDbj68+AfxJNlDPwIjiElzXCCou2bIzxLtaI7OG
 FkJqn8r6+9rW6quUbEhl8ZfiZ1PwJw2vHNQnlKrQgFPwffarAYoeiSfmhUwT+iLh97RMXGLR
 5Hqz1MiOWKBq3V4RpnJ8OsM2qcgXdWjmmNVY0glqqK4tqgXZ8kEJA8WuhUGR/QHxJ43SZmwV
 0zKTMsdwv6LHfDmK+lhJsbCKX0bN9nmjqmJsZStDb4rkWTpcYmQ1MBRD6wWcurgQIjLgAkxG
 FZwus6uv6tiDyvIWwwjKATK1tXclmaB7pAEUC4folOo6vqfwtxVG+OojSfh3gICyzX3nRXol
 akATyfePnNDFYYnnxDyK7l/Gl5cXinc1tqZmp3tpB8Emr6qm9+uNX7FJab4i+0UB8v0+sdOD
 bKbX8pLgRiy8ue+TSVlDyBfE9WjKkGD6j4NvAOYrvT0nSiJMm0jqkABeZT54sgHsvpqPU3Xe
 WWfBK1IDv0B/gy4RGcom8oNUBP2SAZuMKt/CegwHmz3XY5D/aXHU9vQKsDJcqAq0fjXPSF3f
 xC/JsIlNr1Fl+0TNGIyavaNWEebjzSpHO7VOEup9R/u7kouL56ApncVn/p2Rh8rWIDBfaxsH
 lbZqJxpI3lEMtIWec5fipC5FonlNiVNiIQw0fLK957WWtotmPROtOC3qHBprUuCHCQvQeYAy
 jqzwRtu9P+GxaZ3bEUC6gMMX1bRUg15nNl5v6DfeTreXOXXtAG2FqxKXmmdrBBDICDBLULtx
 5/iuv40tO/Rm7d2ArKuyF8Lb8L22G7QdmqCAbJPeJT6dS1NRCthaStifTDwAvfeH+ea04Cg5
 dCelFVRsNfiiM6hIly6xOMcMXM0woYumobxypmmF7r0pWn52mePXguC3ymvrxmGR9JMnaJis
 zZ9/O/z3qV2kkc5aX+
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40664374"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sra4nDGMYlsgletTqRFWnEVZad0SW8Hbfw58z3jT6cjblMGwsVxon3DEoAOX62XMk6fTncAy+z8BSayWmpEcDlbGV6RjNod28FAddvWA+r+7RCrPI+bBrUSLG4uLMbtbnUX0zAPqrPTTl2vQQENfGt8hVPCdWhTw7kWRoT/t2/1jH0dKHuEqR6NT2UuKr7Wfljt8P5+uXalxAl9zyp+TE4TsndiI8mIt5chiTwVhxUUI0I80fJNUo8JAqnQ0v6DVb4nWDZuMgpfNPob+XVU3SgjyKh2DvcSZZqx2nLg8G03lcI/iPNISaLRFMYlQFLlULetJCH+8qYqUekiRZZZuqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6GBDxKhS3qtdNf++KnrNQw6MnOkE9dFm6CLdC2q+Nw=;
 b=nt4fG60JcxFXRFnzRLaL5afL9Wx+63vpBssTIUDK20AYJq+AKRoQhYDffb4Qgyy9vpuhDvAMg4WPLZqJU4mQydoYBgd3ZXZ5v4OwJXcw8Uloh0ZGnYdDb3keX5ibagSc4/IiXHwt59DLxXYRZbFEqryvpH2Rokr/P39Z6Mi04ij6+qtQyOTeeexEm9Ce1VJNhFKIDPZdAEK5nBBYaZUrIr4NHi5T40bBw8JsOhcD4qfgmHJPuz7H6Lts/2jaJRmqtMUGpPuWyS3RmV5wEfpoEjqEwtoUfJ43BsllyTFGPWQuGWtg/byadOQCJe0g8ffcPc+Vp1p92sehVzcY4eleQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6GBDxKhS3qtdNf++KnrNQw6MnOkE9dFm6CLdC2q+Nw=;
 b=f4jtNwupFuQ73JHuAh3PWBQ12jS4hFpcut3RBs4AbIwNgsByebP/pM9xS/5mtOxif5lttY9QZhOSYJ2C6UexTu+WW/DBV4W7xohpin2XwjMldVUFrOpMcPbOnSmgNKNT/KdHWyj6OBUgdS4hfxjW+lPoUVnLXgd1yv+wgy/IbfY=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
 <5d7c61b0-8441-dccc-4917-cc8a436fd96f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/8] x86/EFI: sections may not live at VA 0 in PE binaries
Message-ID: <dae6b91d-e8d1-6d7a-514a-00ec8d201843@citrix.com>
Date: Thu, 1 Apr 2021 13:01:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <5d7c61b0-8441-dccc-4917-cc8a436fd96f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0266.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::14) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08c670dc-f1db-40d8-b902-08d8f505dac9
X-MS-TrafficTypeDiagnostic: BN6PR03MB2964:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR03MB2964FB44D0E0676BC8BB7C2EBA7B9@BN6PR03MB2964.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U0ReailU+1j4g8lLtu7Kg3qMtCeM/os4sNGLy6zX/+PipGyeVI8lUyBrZ6Jo7syuzhiYFz4YxawWqBb/uJGp3k72TzJGr52H4rvXF5lax5ijslwqdQX9duYbiFH7KA26ULvZo4jGsQIQCazepucMQcKoLOvL9rDoGdzvFcJO6J36vx5hmatnrvSO8ym0Gq8cWF0uCTJmvfwFzasCecvVrBYoiQbr5fjdUCnTPPCT/psbVkWZLJfM/0T6cWO8Ycs4av63bd+KSrOFyaWv7jm673Z9eA+nyOSwlOPz9BYv8AW5a5Qu6emQGZmWB5UTf8q+7PfXSuxiErZjpqkxJsQq7AU4bdSlfMBMBBx31b1QXv+/WHF7y0Qcs/3pSWXn/giG6FE/Ka+e/7en2Je86JfT7Qvc344mBhMIDGaC/DOOs+aWmmKLQjkclxEh7IXR/kmNfSMBF9OLNMA4pv/ItwRXUXNdI6+x9R2j0R+WHMsiTCOgBXVSmgBXC4kh+/YQ7ulrDHgyWqE7F3LHoEooN3GNLpnJjask8fOCV8cSEqNEa3xf38G9SouwBXj2qjpwFBGvPruKuBBDusftJ00KBojAwM8vfxuPoe8IUjucRSJOs5CMhWOvlFNbeageotlvPGL6nSNZfzAJqoS3wgyE47X+JRywZqsDCGARfPFgYGIX9XPxd647lXy0ugpBRdZmByfUxuzLklyptEuQj2CMpyTf0mnyQ5kx4q5+E4L8Ze9qvwo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(376002)(366004)(346002)(136003)(66946007)(86362001)(8676002)(36756003)(53546011)(5660300002)(107886003)(6486002)(31686004)(16526019)(478600001)(26005)(316002)(38100700001)(16576012)(31696002)(6666004)(66556008)(4744005)(956004)(186003)(54906003)(2616005)(110136005)(2906002)(8936002)(66476007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RXpCYmVzb1IwRVoyV1ZWVEV4NTFMaUFKZUxHdlpGYTlLVWV1U0dnbHRFTWZN?=
 =?utf-8?B?aWQwTzFvbjhHeDlYMkJFbFlicU10NWtRZ0FpMVBmY2dJWnJvUGpZSVhqbklN?=
 =?utf-8?B?czBEK1lMMCtlYW81Wm0xZ0FIOXZsQ2lGc3NBQ2V1Qy93bnhxNUhVQnZnaHZH?=
 =?utf-8?B?bFAxajBMMGlwNWlDd0JKTzlXRVlxRU1wUjh4dzdSOUEvQmJsNy95dFZWVDRE?=
 =?utf-8?B?YnZpT0ZLWFovRUZlRjdDOG1pNFVrQkNnbTZNa0RYZDlEN2tJdnk3QVpTOEZT?=
 =?utf-8?B?L1FYWkxZVEtIK1RGRWl5RHFPZjcxRGFVWE53UXMxQmxnMUdzN0djMk1QZGZ4?=
 =?utf-8?B?cXhlb1gyaEh5TUhCOHlhQUt2enlHMjhOM2NuNW5hVzNJWUxMdzBpOGpFdW11?=
 =?utf-8?B?M24wWmRJM3NoOW1MYUJzdElWaGRaRkdCTGhDaHgvcTNlSjNHR0pLTU1DcXh5?=
 =?utf-8?B?VkNWQmpGbjMvRDBpRElCVUFNUmhWeGg5akZ0VzV0akZjYklGUTROR1E1VEZJ?=
 =?utf-8?B?M0NneTMzT08vYk5kbktsK2JVREVqdHp5dEJ3MWVYL25YODRTM1B3YXc0VXJX?=
 =?utf-8?B?U2FzWWE4M0dQdGpkbVplWHlicnkzTjBSSFUyd0VONHJNOGdkeXc0QTdsNFpj?=
 =?utf-8?B?ZllNeGNsZ3J3Njl6ZkkvSHpROFZ4RGpmYnRSa1YxMkl4MHd0NEdmdXBYT3p1?=
 =?utf-8?B?VklEWWd3Q2ZDRXZWalVWWVZWSXdIQ0Y0Q2dEcjZTZXR1Z25KR0NRbnlxcjdS?=
 =?utf-8?B?NHdma2ExSExpOVIxVGwvSzRXSGJtY21QN1ZubEVFbHBuMmlwUVA1Q25oM0w0?=
 =?utf-8?B?SEJDVUN2SFBiMU1rSm9NaFBycU9HekVMcEdQZXMvRkcvT3NGckxrVjNTZ2FB?=
 =?utf-8?B?dFpybUQ1UmxMMjFsWDQwTDgrbjNpbm5UdHQxemJzQ3ZDbG9Tb24vUkFENU9W?=
 =?utf-8?B?TUl0a2NYVzE5NWp4MlZsV2xyVGJXVFlNNk0yUEdxQ3lZRndiN0JmbExYYVlq?=
 =?utf-8?B?NkVwaHBKNm8xcGhHMm1rbVhoMHRrMElPNzlHVXovU0xJajdMcGE0ZS9DMlRY?=
 =?utf-8?B?OHdpUTZKdDBVU2k3NXFmWmp3UllKSHozTE44VnNGcXVYR0FEdWVMNzZUbnBD?=
 =?utf-8?B?ZGErQ0FTd0xVRDlPdU0ySkg0WG9WeGNSUDBCN2dFL0IwektadE5IMlpIMmFx?=
 =?utf-8?B?Vm5vbndDcFVvL0JTOGVLNkpXOWQ2TWhNSnQ2SXgrMnQ3bEg0RDNEU2pkdyt2?=
 =?utf-8?B?OHVtN1dhbC9FQm9OZ1prWGpkT2FQV3VXK3VEaWE1VWpzM2hzdjArRzVJaUFL?=
 =?utf-8?B?S3NneHhudVRDUzJOZ1Q4OThkdDhjR0JkR2xxVzJZdDMyUllCdHJpdU5ENHd4?=
 =?utf-8?B?S0ZCQ2N6VFVrWk1Wbkc2VXN2VVpSZ0VVTmJlWWFqNmNJS0hYNWEyU3k3TjB5?=
 =?utf-8?B?Y3MvWVlwelF1eVAyYXNLdmhWcHF1STl0UW5iYWdlZndNWjJvdmR1Z1FSNTE3?=
 =?utf-8?B?LzlsNzJoMk9xcXIzSDdjNFJZQjd2Y1dMa0lkNE5SbWtCTlZZZ3VNZkhZTnFW?=
 =?utf-8?B?TFFEdktEdlhZamdzTlJRNmZiNC9VUnQ5OGtFNFVSNnV2bk4yOS9tYk1yL0Ja?=
 =?utf-8?B?b0pQS3ppQTNObWpMaERxUXAwSEZjRmlZS1B2SVROSEtGWi9DcFFQTGp0WEY1?=
 =?utf-8?B?Ym15ZFBRaG5DYXR0WGxrcEtsK2ZJdW9SVlVpekxVN2pyNklKRm9yMzhjOVBT?=
 =?utf-8?Q?XFv6vDyYHxYWPEm4CNaHr/Q0ldoa9UiRetRySoh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c670dc-f1db-40d8-b902-08d8f505dac9
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 12:01:16.8749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mH4H1YaiTJugoyxqgeKlDdfDeDEKgskewVaYFReFj7/hNVmyOJ3oePjPTT/+jKRFocgozcSQfeG+XExQoUti1Ace7hhv8b+i8pmKAKJ2b24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2964
X-OriginatorOrg: citrix.com

On 01/04/2021 10:44, Jan Beulich wrote:
> PE binaries specify section addresses by (32-bit) RVA. GNU ld up to at
> least 2.36 would silently truncate the (negative) difference when a
> section is placed below the image base. Such sections would also be
> wrongly placed ahead of all "normal" ones. Since, for the time being,
> we build xen.efi with --strip-debug anyway, .stab* can't appear. And
> .comment has an entry in /DISCARD/ already anyway in the EFI case.
>
> Because of their unclear origin, keep the directives for the ELF case
> though.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> It's certainly odd that we have stabs section entries in the script, but
> no Dwarf ones.

Its not odd in the slightest, given the heritage and lack of anyone
touching the linker file unless something is broken.

We've got dwarf symbols in xen-syms, have we not?

~Andrew


