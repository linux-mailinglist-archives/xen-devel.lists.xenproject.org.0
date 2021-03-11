Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E16337941
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 17:24:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96688.183215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKO73-0002sd-4R; Thu, 11 Mar 2021 16:24:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96688.183215; Thu, 11 Mar 2021 16:24:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKO73-0002sD-0R; Thu, 11 Mar 2021 16:24:37 +0000
Received: by outflank-mailman (input) for mailman id 96688;
 Thu, 11 Mar 2021 16:24:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DcZr=IJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lKO71-0002s8-9p
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 16:24:35 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id def35981-5154-4791-876f-2934a2000b9d;
 Thu, 11 Mar 2021 16:24:34 +0000 (UTC)
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
X-Inumbo-ID: def35981-5154-4791-876f-2934a2000b9d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615479874;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mQ7ev8qs7TpjwyDBLnfCjdfEo3ugAzrS4IdLwHUtvBQ=;
  b=YweT7+/FEzz7ClpV/9iziZyS/VFHg2zyGtojx/4luez786vDCHGiUknG
   xfC9K6N0147VNO9Zrxg+YRe7MhOh4mu/SK+Baju5BGBrMkd3fp3Z6btBl
   gsOktBHEhFudMk0JpJdh2uB55EaY0yIBapd3PeZq4DXEvKXVMmzZ8tYP9
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: CA5zbA6Nsun6Gtsv9Z86vUbDihZNYmYcjOgb+WKbgD5kX6lrRnuFuiefBZixULOjy5esjfvlh/
 3JYP3AgP0Pp+mNfFqejM6zH9rwRCCFzDt3uREGtWVIQhu0Bv5+Z8R7XtGJm/XFJT+iKEMowm35
 HpYz3djOtekEkUe1jBCzsoMiibTGpOQV7SubRXgEevfJsnx1fEZ8+fwRNeEtxIv8o1wzx5BMd+
 ROfmspkl1hJrnX7esNO88DWvzlBN/ON05MLWSQvSXP/izb6yhey03jvd8uQs0YgAZSPidaXi6b
 m0c=
X-SBRS: 5.2
X-MesageID: 38983695
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:vJEpCa7tmP42vEooyQPXwWWEI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoexzh3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdxHW3tV2kZ
 1te60WMrDNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2BXQotLhj0JbjqzOEtwWQVAGN4dHJ
 2T+sJIq1ObCAsqR+68AWQIWPWGmsbCk4jobQVDKxks7gSPij3A0s+HLzGz2BACXzRThYoz6G
 StqX2F2oyPkdGejiXd2Wja8ohMlLLapOdrKcSQhqEuW03RoymyYoAJYczlgBkUp6WV5E8ugJ
 3wpX4bTr5OwlfwWk3wnhf3wQnn118Vmgzf4HuVm2Hqr8C8ZB9SMbs5uatjfhHU61UtsbhHuc
 ohtQLp1OsjMTr6kCvw/NTOXR1x/3DExkYKquIPk2dZFbIXdb45l/1uwGpuDJwCECjmgbpXct
 VGMce03ocyTXqndXzD+kFgzNuwN05DZSuucwwpv8yY1CVuh3Zpz0cU79x3pAZwyLsND7ZD/O
 jKKaJuifVnSdIXd7t0AKM7TdKwEXGle2OCDEuiZXDcUI0XMXPErJD6pJ0z+eGRYZQNiL8/go
 7IXl90vXM7EnieR/Gm7dluyFTgUW+9VTPixoV1/J5ioIDxQ7LtLGmqVE0uu9HImYRdPuTrH9
 KIfL5GCf7qKmXjXaxT2RflZpVUIX4CFOUIp9cAXU6UqM6jEPyrisXrNNLoYJb9GzctXW3yRl
 EZWiLoGclG5ke3HlDihhz8XG7sZ1zf8Zp8HLOyxZlX9KE9cql39iQFg1Ww4c+GbRdYtLYtQU
 d4KLT71oO3zFPGuVrg3iFMAF5wH0xV6LLvXzdhvgkRKX75dr4FppG6cWBW132XGw9nQ6rtYU
 lijmUy3ZjyA42bxCgkBd7iGHmdlWEvqHWDSIpZvaGf+8H/eNcdAow9UKJ8USXHfiYF2DpCmS
 NmUkspV0XfHjThheGOl5oPHtzScNF6nUOMOs5bqXXWsG2GvsExTn4nXzqjOPTnwzoGdn5xvB
 lc4qUfiL2PlXKEMm0kmtk1N1VKdSCqGr5cNR+EY49Vg7jvXwl1QQ6x9HqnoiB2XlCv21QZh2
 TnIyHRXf3QGFJStkpV1bvQ/Epuen+QeF9xbX5GoZRwfF62yEpb4KuuXO6ewmGRYlwNzqUmPD
 bJbSA7Dyluy9q0vSTl0gqqJDED/NEDL+bdBLMsf/XvwXurMpSPjrxDNeRT5oxZONfntfIrXe
 qTdxSOFi7xD/ok1mWu1y8YERgxjENhveLj2RXj4mT94WU2BuDKJk96A54cONOR4gHfNr+1+a
 Q8qehwm+S+Mm/8MIHbjY7WaiNOMRPVryqdSfoypZVdoKI1s/9SEvDgIEz1/UAC+C97CsH+0H
 46auBcxpvqP4d0Zcwcey5D5DMS5Z+yBXpuljazO/M0eFEmsmTSMNyI6YfZsLZHODz0mCLAfX
 2ktxBH9/jLXyG/xacXJqI5L2NRclU94h1ZjZW/XryVLAWhbOdY+lWmdle7bb9GUaCAcI9g4y
 pS0pWtn+WNcTD/1x2VlTxnIrhW+2LiZc+pGgqDFapp9NO9UG78zpeC0YqWjD3tTyG8ZFldrY
 pZdVYIZsAGswIctuQMo2CPY52yhFkknVtY6SxmkVCo+rHO2hakIWh2dSvDgptXWjFPNGOvls
 qty5nB6EjA
X-IronPort-AV: E=Sophos;i="5.81,241,1610427600"; 
   d="scan'208";a="38983695"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JX6zmyWLZRFYY2Z98NScYCj0+59Q2nKJOmvw3BgBZj5KrareheY9NrfXkhqWg3WppGR1VE5YxYFTPKPphektJFlIh6NhiNzfnzpg9AnlX6OPZM0LHbXvYOl2v+bZnuvm47OkM6KAZmrPs1ctHIx4p+sovgIqdEBhx61uA1ewU/vZW6qkQJlg2uI/m6u4T1E9GFcsjACGwhuuTM/8kSINCdEXzT1HcuPKaFHuknPPSq5EQguPx3Lc0yT8ebf5cILFlUxmu9WJoz8M7/TQ+0jEpxLl9L2Qpg/RhtTt85w2VrsaXx9g/enGLoXFpo3zvyzQasOitWUYCOrIbgOIz0cpAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQ7ev8qs7TpjwyDBLnfCjdfEo3ugAzrS4IdLwHUtvBQ=;
 b=Oh4pN0Nke0WlDOE1uwgEx7db7ze+j/LnXxsx0OVnBNYtXHVKUC4N79V8ZPDocfzAVV7o5wpKzd/cdxaGLd++krc42kVjKPzhYQiK5Kx/mdyAOps4oDZWpD1yWmkR3EfAeJmLEvNUXMBErb3mmJK2jWG7AmJ/9CT+EbeqbPQusiOTiupa178kL8lUsKK7KF49VTHRxjuKDyzWLXdI3SZeJxi/QRFQTeHwlRRTbFrXNQtG3Kc8Skk9oz40SqdefJJiizmrK49guVO6BIjm7xOmuje+yuxyB21PTskzyBW9ywNS/PCri4+WTR+EYdsDi9gEkjGuPSwwnh+YEHjjlEPJ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQ7ev8qs7TpjwyDBLnfCjdfEo3ugAzrS4IdLwHUtvBQ=;
 b=miDYx5yaLnLSz/I53uZ3IVp+ETqLhUI1gjz772GXHkggAkL3AQpkJWx5Oxhbd/s9DgS0R7te4K6xpHOyFLdtwpSCWyZgp+8/ryvSi7vzHI9ALazTnpFnPORsfCHgpwOEklple8MI7gKLMBfFwaVcOrRaZ1LD50q2p5gP9TLZRxg=
Subject: Re: [PATCH for-4.15 v2] xen/dmop: Strip __XEN_TOOLS__ header guard
 from public API
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, Wei Liu
	<wl@xen.org>, Ian Jackson <iwj@xenproject.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>
References: <20210310150722.27194-1-andrew.cooper3@citrix.com>
 <d375232a-d1a7-737c-0887-8b7e1c9a772d@suse.com>
 <13f03a67-18c2-e564-a0f6-84eccc7eeb76@citrix.com>
 <556ce32b-5087-b8b1-432e-643218dd8c6e@suse.com>
 <9ca069ab-8b6c-c8f1-d68b-4a9bb0cf5c56@citrix.com>
 <YEomtoHmq7UH/P6T@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ffd35de5-d130-4b82-8397-085d7ea70b6e@citrix.com>
Date: Thu, 11 Mar 2021 16:23:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <YEomtoHmq7UH/P6T@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0349.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::12) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b45f363-e456-4375-cb63-08d8e4aa0d1f
X-MS-TrafficTypeDiagnostic: BN3PR03MB2130:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN3PR03MB2130AB0D8D7DD5ECFBCADB75BA909@BN3PR03MB2130.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IpenrQWHL7gqiqyyHj4FVIeWYpTOlaBTHOB44sl8i3P34Yp4nM4t0dv5dYBwbOUd550hxhVd/WHo7sicsDkVjsPSj4jjRRgU6DkkRKnvjMizRCAU4wjGg7i04Bvh57ExOgKIuFyc0R62aUYL7nqplKIG0Ti4lxeXgWJjJBAAda/cThXtz5XAMO/Bw5DMHev2XDcTWeh+gOjEEOeTg7WDmP0jLeosP9L/CrrascwiTlbGW7yeWcjkRffK4l67zb6ECo3Un6Ztx33UeCE2y0GMaTPyEcI4PQ+NAtCid3uEqb2mz+lMIf0fIqsivrOzZsUOx3aAHaAcD3YNgeODoq07gN8oBlI3+D29hW7OBhNtk/sNv7KI+FE+NSIkG+avs6Z/Ou4GczUyvHmNfm+ebVO+W03xZa+8cpdyK6vjzm9icJmTVWJo2HZJcl9sJBmDQaZnHRCEprjGHoM3ePIVe9VKlcp2djnD4lCsSP/At7pYncyu3gA7Ns3kuFwv7SlB0LE067DpQ+R5CsU5Qxz+I/Ycw7isRKGnPuAjX8DQc5NvDI/j21KaiLG1hGjddsp9imzLf6gZil8G7Db7d+nYCZhb63eGzoTDuMsmdLPB5ZyokHQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(346002)(396003)(136003)(376002)(16526019)(8936002)(16576012)(6486002)(6862004)(8676002)(31696002)(31686004)(37006003)(6636002)(36756003)(5660300002)(316002)(83380400001)(2906002)(54906003)(66556008)(86362001)(66946007)(26005)(53546011)(478600001)(956004)(4326008)(2616005)(6666004)(186003)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MWtwTzFGTzI3QXdSNlZYMXBScFFaaXR5T1UxZzZkc2ZZWXJiYVBXRE1iRHJj?=
 =?utf-8?B?L3FIUERobEY5VWlUVlFLa01xOUIyVGJ2Q1I3RVcrczNrZ0dEVWFDRE5oY1lu?=
 =?utf-8?B?N0VkUHh1MFB6ajcyUHorSG5zMXc2aUFnT1NlOFBzUWNvREk3cTgrWldxMDdZ?=
 =?utf-8?B?K1RUZm1lZkFXdm9DYm1sVnR0SW4wT0xvNGRSQVNxWWpuakJTbGtXUGpHTUNT?=
 =?utf-8?B?T1JmK0RSWEp2L0RkTSs1THltVGdLYyszVURleWthOFIwQjdYZStDWWJOY3RF?=
 =?utf-8?B?dkNsaFIzU1hwcHpFYkt6NkRWK3dMMCt0N1R0ZER5NmhwTFZRMnBSMzRzQ3Rw?=
 =?utf-8?B?NkFCUDRZa2I5VTBiR3JXY3oyY1NLcHRTMnVWaExWK3FPc2ZLb3FwejlDNFh1?=
 =?utf-8?B?NU5DLzhoZ3R1TnMzK2FzOVBUajdnUU84QllrK0YrOUFTancrKy85VnVHUkZE?=
 =?utf-8?B?cUthWHRyY3lWajB2aWRnWW80cVBPS1RZbERRR2lyTlBtc2ZQRnRjenpxU2xj?=
 =?utf-8?B?Zml4Ky80cHV5dlRyZFRoUWNTR0NGZUd5UGdKcGFvdWRRWTYvLzRLcE44RFVq?=
 =?utf-8?B?SVg4cnJIckJGU1Z6Yll2SzVRMzNzQ1RQS0hENHZEbzdlK0RhbHRPaGxGMktt?=
 =?utf-8?B?SE1OcjYxN1RMTCt4dWlDM2c4S0JXTHFkN2dwbk5aYmJmdVRlTm9JakpmZzlt?=
 =?utf-8?B?ZWxaL3REUHBEVEJ3ajZjbzZRRlQvanZVUno1eC9KMk45TEovRlNZSmVoT1Z1?=
 =?utf-8?B?VzRxN3F6U0JEU2loSlRJZ0ZxdDluNnNZbWdreWJUblY3M1FweDArRkVqZEM2?=
 =?utf-8?B?WnNUOE9lQi83RllIVS9oWXZaMlFDaG9wL3VYUytrL0tMN1hlc0lYZU9YcFJR?=
 =?utf-8?B?dzVLRGltVmMrd1JjekpuMUJPZmpEMXozU2tlL3RkU0NxUGRjQ0ppU0xIYXMy?=
 =?utf-8?B?NUE4VjJTbVRjVnIxRzRnTkJxZDJ4NmtrT1drYmlGWGJ4K1NyZGNQT0U4d2dx?=
 =?utf-8?B?TjY4NFBVQStCU3ZxRXFyaW42eFFFdHdMVmFsVUwvZmFtY1pla2I0dU5vQnAw?=
 =?utf-8?B?a3pYejFBd3k0dFU1eW9LYzIvOHRNck83YlFQT3NSY2hmREtvbVFvS0JmZzRl?=
 =?utf-8?B?VzAvNkFEb2pudEk2aGdmcDlZd01qZ2pUWFcrYzYwdkJaaUVsQ0xmSjdDckNI?=
 =?utf-8?B?ZU55WDdTL09GWGFIcTFvRzVVeEthR0IxTHZWT3ozbzlNV0ZWV0NUMk5kN1h6?=
 =?utf-8?B?d0k0Q3hkSndhcTNzbm5tK0l1RjdpSnBPak5YZDJ6anlWelpnSmR1V1grY2lG?=
 =?utf-8?B?b29uZ2hZdlZJYzBLMHVjM1R5cW5oZUMxWkY3YWhoUUxhSFF0U2dhcHBJUzB1?=
 =?utf-8?B?VDZyeElJdFJWd3ZQREhIYXJwQlpBSG5nMzhMeVNyeTRVY25wdHRIUnM0MmdI?=
 =?utf-8?B?M0ExOEovcjhwWmg1aGRNSVNqUjNNYnlEakxiWW9RNUFCUWJPOEpoRXFlT2E4?=
 =?utf-8?B?NXpNZlBSU2gzZEtqSkxraGZNbHRXMUlYcTJkdHp6VTJTU0p3L25odFFYcFZt?=
 =?utf-8?B?cWJ3dHJVK21zSUMvQStsUnZQVXdXWW1qVGtuYStLWExNWS9RTkZUUi9tRy9m?=
 =?utf-8?B?MDlwenViL1dYb2g0RGNDTC9pTnVCN0FrSjVhdUoyaFBZU21XTkd2Q1k0QTdm?=
 =?utf-8?B?VGFXNjBwNjZYTHpDaWVmeXpmUTVXSnd5T0hXWTdOQ3B5aVFJS2tjS1VKUjFD?=
 =?utf-8?Q?WhuWYS3hohWvUPtwGP9mjVnaL2jzyRsVrL7G09M?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b45f363-e456-4375-cb63-08d8e4aa0d1f
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 16:23:49.0904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /KLWN5FxdZjGg1BLS13zz25z1XByya5Zzi6ckUWRNhi7sz5qdYvzUb+upPBIUqRjtWYsxEDrqb5DdHD5z8H2tN6sfwpCBwvRzrwW7xfZiOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2130
X-OriginatorOrg: citrix.com

On 11/03/2021 14:18, Roger Pau Monné wrote:
> On Thu, Mar 11, 2021 at 11:05:32AM +0000, Andrew Cooper wrote:
>> On 11/03/2021 08:27, Jan Beulich wrote:
>>> Depends on what __XEN_TOOLS__ really means - to guard things accessible
>>> to any part of the tool stack, or to guard unstable interfaces only.
>> As far as I'm concerned, __XEN_TOOLS__ should always have been spelled
>> __XEN_UNSTABLE_ABI__.
>>
>> For better or worse, the fact that we currently do have unstable
>> interfaces, which aren't in an obvious namespace such as
>> xen/public/unstable/, means that there is some value in some form of
>> protection to prevent users from inadvertently using an interface which
>> will explode on them with a mismatched hypervisor.
> I think using __XEN_UNSTABLE_ABI__ would be way clearer than
> __XEN_TOOLS__, or even placing those in a separate directory as you
> mention.

I plan to submit a rename for 4.16.

I don't expect I'll have much luck arguing for a release ack at this
point, and isn't totally risk-free.

Re-laying-out the headers is far more invasive, and was also a trick I
was planning to pull when we've got a rough plan for the other ABI
improvements agreed.

~Andrew

