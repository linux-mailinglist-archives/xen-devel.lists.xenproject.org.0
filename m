Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6C26F05EC
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 14:38:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526998.819115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps0se-0006Za-LT; Thu, 27 Apr 2023 12:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526998.819115; Thu, 27 Apr 2023 12:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps0se-0006Xi-I5; Thu, 27 Apr 2023 12:37:48 +0000
Received: by outflank-mailman (input) for mailman id 526998;
 Thu, 27 Apr 2023 12:37:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=81si=AS=citrix.com=prvs=47455b11e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ps0sd-0006XZ-8W
 for xen-devel@lists.xenproject.org; Thu, 27 Apr 2023 12:37:47 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4dee3263-e4f8-11ed-b224-6b7b168915f2;
 Thu, 27 Apr 2023 14:37:45 +0200 (CEST)
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2023 08:37:27 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5855.namprd03.prod.outlook.com (2603:10b6:a03:2d4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Thu, 27 Apr
 2023 12:37:20 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%4]) with mapi id 15.20.6319.033; Thu, 27 Apr 2023
 12:37:20 +0000
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
X-Inumbo-ID: 4dee3263-e4f8-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682599065;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=p43qOpXlKVpAZLLXDXmXfYSUEnKWUQO9XqjldDmyclM=;
  b=C+6bEnBbSXD20NsZxyR2Qsul1HH3wNi9HeJ72Xr0ID7XcRPM1Tf62ctd
   ozKCKevoz2bzNgBW8I9bzKWemLo20lVx9DxGW14cpTwWHqBZMkZloxyCH
   nHpbOerkpowKS08mdHPv5j9hZO0Cfk/1btO3uddOEJUIJwrlMsGo56GLY
   8=;
X-IronPort-RemoteIP: 104.47.55.176
X-IronPort-MID: 106961567
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Xgm1DauzEvtHppip89QNmWe73efnVGVfMUV32f8akzHdYApBsoF/q
 tZmKTiOOK3YYmH3ed8jPNmxoUlQu8Ldy9A2HQpopXszRiIQ+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Vv0gnRkPaoQ5AOEyCFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwAS02MzK7h9qP+7fkc/RVoMItfdvMI9ZK0p1g5Wmx4fcOZ7nmGv+Pz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60b4S9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTgqK802QDNmQT/DjVICkGpkNmHoHePSsxHC
 GYs0Bgjs/QtoRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hSy2ETgYKykFfyBsZRcE5vHzrYd1iQjAJuuPC4awh9zxXDv2k
 zaDqXFkg61J1JFVkaKm4VrAnjSg4IDTSRI47RnWWWTj6R5lYImiZMqj7l2zAet8Ebt1h2Kp5
 BAs8/VyJshTXflhSATlrD0xIYyU
IronPort-HdrOrdr: A9a23:WzTtCam6ZhBRHdPFT7bNTFWqEaTpDfIV3DAbv31ZSRFFG/Fw9v
 re5cjzsCWftN9/YgBEpTntAtjjfZqYz+8X3WBzB9aftWvdyQ+VxehZhOOI/9SjIU3DH4VmpM
 BdmsZFebvN5JtB4foSIjPULz/t+ra6GWmT69vj8w==
X-Talos-CUID: =?us-ascii?q?9a23=3ATAo4PWuj31qGFZXhqalWRvqU6IsMb0aA7k/QG3a?=
 =?us-ascii?q?DDDlQVYSzT1HB6oR7xp8=3D?=
X-Talos-MUID: 9a23:mbgcygSDG24brFB/RXSy2ytwBedWyZ2fGV4Vsr8+kfuJK3BvbmI=
X-IronPort-AV: E=Sophos;i="5.99,230,1677560400"; 
   d="scan'208";a="106961567"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8h0qi6O3gJqFg7XWaSLie5Bv4iStCKqj6+Jg7WAsGZGI+oLUlaBdtk0sLuGxSiTuDxKw5ikC4QdAI8mZn8IXXbBahueDyjHWmqVbZqRtSEYFdFzJK0bpsFRJkZyMVoy8E5wH5U6QGgAliedPlKISl5vv8MsD+0X2ftJC4Y6WRMgq0H6aLHaT+Kj/cr2qn7mKfkcaj23im2zGMHV8xFiQaHz6Bf80wS2b8va7uavjKD5zgD08Fokmj2Y6UQeFAIgOfxhH/5yATecXL4kqFavH0TEj9UQcvJzaueznw1CA/iKqAGwvOJu4omnx9SG0jbMZLE/aJIlFj+EdNWoo+UXsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p43qOpXlKVpAZLLXDXmXfYSUEnKWUQO9XqjldDmyclM=;
 b=cHVx5Q/zTMyodpoEVl1PAIu/dKOY0Ll3xJMhz0txSvCc/4Cr1wQT2OPz+/vbXxMbpVDVIad833Y6NggVL7CWPgHHCbITdLG0dnoFzDTZqzaGEZiovq2VaL4MlB4rtLDEbUcIeqiXo0xYsgge+umoRLAxp37Yu3Kkd7FSw7eGD4k3hPuhxWVWBga4BoQrIBw00uuWimjcKSpx1Tzoe46tmtP19q19XiRBiJdK/61c3vH0mSXOoJT1ELGF0FJ4fQGU/GJDWAN4qLfdcfc1+xrxW/ooSAt7A08lFxK+9wO9WxzkiccGcpKtBPpubEpHbPpg/JXgQT9gWtzHoLBhvqlKxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p43qOpXlKVpAZLLXDXmXfYSUEnKWUQO9XqjldDmyclM=;
 b=YC79ZgtEtPKsT4JUjqXvknB7WxiAMhiRg8mB2qtxgLS1yb4sFSRHMu49lFNKSwIou9pOUqoPD/EdiEBX6UAh2g6g+Ag7v250U3CElV7Am0XRr7k/O/G2KY6zb6IxCd+8nB+uaeg9PYk3FIE8AjjI0bYQm6WF1cXLeAN4kZ3qAcM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1f827054-13f7-02f2-032c-c7a1c83b2a90@citrix.com>
Date: Thu, 27 Apr 2023 13:37:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/mm: drop log-dirty-enable's log_global parameter
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Tim Deegan <tim@xen.org>
References: <d6803514-7aa1-a927-57e7-299097470bb7@suse.com>
In-Reply-To: <d6803514-7aa1-a927-57e7-299097470bb7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0053.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5855:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fbec900-c8e4-471a-59ff-08db471c248b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kbpqYwjzoaZ6CuELkHPXkWhcXxG7XSwnCH+dQK8h1OSh8iUuPolMJo1xpo1Yj/N18RsCHgvpnJPP5RExwc0+josBAX7w9zjUaWoSxv6kJlt70x+8jLSVUe1oPL0TnbXJLkfZGPJwido2Buej6GSux2eVK1xvVyHPd3S7Bw2XcE1IMEed0DTxEhPmbgA5sQacKC+zrISXHzWuJgS8JwNQO2tStN4IAWBGIRdRI/N2fILyNcfX88IgSCmnNQu72v4spUWj89CcO0ZMP4Xfk1owXjnbt2Udx4DdtpNKPXolKshq+wxOkpzw0XcIh7ql9uW6i1U6yI9TRYko+T6OrMnjKbU/2vIsATABn2Y4LhOsxfMRDn6ftH+CFf4qqxb/o7Y5Y1Q/mkleg/235g/JHragsvOFcOj2Cf9MA5iaYED05ROWxbOuLUB2rPQ24QHKdc4vwIGw+fcXIFYIMcdb3s3wxAFV1kqRPWGIHgdraubb/8A0jZKtUdAWnwzLippTgL8Rp+JitghGNa7fhFqi+IZGoDkfbxsJbwuJimxvfQVg4M8wEn+/RrjDP+Zkau+C5yv2vKUIMg3sCEB/tIvqZxU4zlmGm/RiVxWe+OTe347IDMnsK3ld7luAG3LuVm0Qwt2xI9/14/WIjKWd4YHH2o2Y2SS5nSEfhHapVK0iaB1Y0E0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(451199021)(38100700002)(41300700001)(2616005)(8936002)(8676002)(6486002)(36756003)(316002)(4326008)(66556008)(66476007)(82960400001)(66946007)(31696002)(31686004)(2906002)(4744005)(5660300002)(86362001)(186003)(110136005)(54906003)(6506007)(26005)(6512007)(53546011)(478600001)(6666004)(14143004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlZIS0d3aXFUNFNWajlnWEZ4QmJhenJ6YlppMjhyTjZZNUxVZkFiOGlxVDVz?=
 =?utf-8?B?SndKcldwTmVtLzR1b253U3hjNVM4bUdVKzRPT0dnSGthKzRWNFVYNUxVaWV1?=
 =?utf-8?B?eEdZb1VHZzlCRnFFdG5DQU9qSTNjN2c5ODZIWVdEcnJ5SFpsZnhETkNYQmJw?=
 =?utf-8?B?UFNVaTFSSGkxa2ZNWnhocXYzanhhK1dxSUEwYk9iOURsTkNtL3htZ0VHRjBV?=
 =?utf-8?B?NDVhUVdPU0FUSDEvdGdxa3BPRHFHRWhIVCs5dmk0UnJIMnNyZHgvb2FIeWZS?=
 =?utf-8?B?OTJIK2MxZTlKS1J6RWJCbHNRUTdQL1hoWUtHWVNmZGZOZkNnN1ZXdHNIV25B?=
 =?utf-8?B?UlZ5cVdsUjRmNkpySHZ6b3k2eWdhR3cxN3JlSDBqS3ZIK0Y4cjlRK3FST0ZJ?=
 =?utf-8?B?aG11d1JYMEVrUXVZZnN6S0Yxcm41dER1M2dCbmd5anQ1dERYa0IzNlYzZ1hu?=
 =?utf-8?B?Vmt6b0xLbGlETjZOVE1kb3o0OUJOaVowaTlFR3ZLdjBnRTNUVld0RWQ3UXpv?=
 =?utf-8?B?ejJNRjZqZWt1M1g2NWNZWDEvNStnbUJKdWRvb3J3U2I1aUczT2JuOWY3Tm1B?=
 =?utf-8?B?WUE3b2psTFNhcTFadWp6UHRJNVhZMG5oSU9SZVVXdE5lZ0hlU0dZV1UxM2FE?=
 =?utf-8?B?b1BqRlZQUFFGeDNwcGJSU3p2L1V2RjFDbk9lekVsY1d4bW9pa2dzTEdKTXk1?=
 =?utf-8?B?RU9DMlNKUTdpNWowcjJPNUczd1N3OXNoUlczdk5uNjRsamtPdENNM0syZDF3?=
 =?utf-8?B?UFBxVjFVY3pPSjg2R0hpUi9IR0Y1MHQzc3IrZTN2bXBLUkFkTS9HY0VrdUNi?=
 =?utf-8?B?SHBGTXoydm5CNWQ3d2JaRC90QjhWRFpYd3lVVDVSbExpa0tIZnI5emVqM25y?=
 =?utf-8?B?T0Ztd2pOemw0dS80SWIzVFBEcS8rdlAzbE50UHlKakszR2lmWHdiNlgvclB0?=
 =?utf-8?B?cnB4d29BT0VXVDYvTS9OdVlNVE12dGUvaGJkbDNYMHdTZTJqTjQ5Tnhrcllz?=
 =?utf-8?B?UmVaeDBVdzJtNGlhWFBveVR4ZXB6YWtXRHU0SFJGd1FDcmJKZW41M1h4SmE0?=
 =?utf-8?B?V3NKTFF5ZWIzanM1ZmRjWXYvaG1oaW5IUXNoWHJ6Z1p3Zm9iWkpOUEJiVCs1?=
 =?utf-8?B?NGVhMno3VWYxKzRHWXlnOUVIU3lWYTZtU2xld3BTZTVDK0Q5c1dCUGtOYWxv?=
 =?utf-8?B?NGZlMVVYL0pTbEZMTnM2V0ZEQi9XWitZK3JVbFpvaUhBdUFKU21ERisrdVNG?=
 =?utf-8?B?b0pGM1ZwdlJiQjhUell2UnJLcFVkSElxcm1zbGU2dDZCUGdEbmZuZ1orZ0p6?=
 =?utf-8?B?d0QwU1hyZ0JWc3dHenF6R1dzQ1I4ZXdYOWlQTHlwNURERS96UmVSRDh6TlpO?=
 =?utf-8?B?TEhRanIzT1c4c2Q4QjlDU1p5cWt4ODdGWnBmUmVZWm9yUEJnalFTRHdrbk1v?=
 =?utf-8?B?cVFUL09tL05BbVBibUFxcUI2OHUxWG9FaDZkTkNYeklScXlqM2VmTmxFUUhw?=
 =?utf-8?B?TUhiUjBYTGZsMXpWZldkTGlDcDNBQlBSUVFlM2pEWGZqNmNKQUJScHNxNzZX?=
 =?utf-8?B?YTNaWktxbmgzandBMC9TNnJxVzRUdXR0Yk80cGVjNHZoTjlHR3NjSTdLTjhi?=
 =?utf-8?B?bTVtYVpkRUVib3BUaDlGcFZtamFDMzF5eElORnlUSlo1c25RQWVCWkFxaW9J?=
 =?utf-8?B?b0xyNTJGU0hXQXZjVURyZFRISjhZQm1pU1ZTK0RMRlBta3RYRHVBbHRpaGpl?=
 =?utf-8?B?QkMxMmdQUlprNGhYclhtek1Bb00rY1FidDBOSk5Td3N3ZFMvRUZyNkFucnNI?=
 =?utf-8?B?enAyZkV2OW92bWhCSHZ4bXRXQ1F5aXZhRlVxcDZ4ckZOcDkxTFFmOWsxRk9w?=
 =?utf-8?B?c1gxRVBuZUxWVWNKbFBJTEhuVGtpRVhJUmRqSy9hRjJrTTUyQ2o1TzFEYkl4?=
 =?utf-8?B?RGNYQS9wVFdxV3ZpMDdJeFhJeW1PZjBiZm5TdXYya21rNVU3WHF3SCsxUTkz?=
 =?utf-8?B?dEJHand6ck9CQkRRa1V0Z1hQZEk2RzkxZFpJZDhvenVqOXVUV1FNZGxaR1RI?=
 =?utf-8?B?TGkxZDAvcEpjaTMzN3RwbXlCaEM3WUVLalFmYmxQcnkybkRENktuS1BadGUv?=
 =?utf-8?B?R2U3WTVUSTB1eGQyUFdWWTlmV1FNbXJSejdEVHZYV25QVS9vNEJpem1PQm1N?=
 =?utf-8?B?Z0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Qdtbwl2vNdF9dVhzaDAfw+KM97ImCvevwDA+SPbpj3/xipbx63KwSjdQiOpUr43fBxu8RdtvbukFu35PuF8JkmB1U4J5d6cVi/er1bAwhAtzQu4LUtPHMRxwuz9w7TNKZ1nSdm04IlYycZvQTQhel8klnO57FaOoREcLQ3g2xfjULPH1leZxFc/gXUlF4nxRLPMtn2njGb8VXXGG4L5CRMfbNeR4/Bxwt9fOo7mnzDJrA86qpyZlKhJogLyN7/aVVqXfy7NRR9wKdFTG+JpQyX9+jm0ytNNtN9Q2AUKTq5eEcdLRooHVbOzXKyyXe3TiX5HxOYXRGhhrbIvtjnftfiwnr6UWJof1QpcQZK48YeKGYYKfC0wA/En2VngyJ9UHWQT2urBDEhP2GOS2Yb8/5Xj/d9Jm2Ce9lZMzGNxvnCw+U3Gchu2d7wi5bT4CPxyAB8g20b26vhXAcGHZrwfHs5qEmA5YfNgeYEjp0CB1G2wWNuo8gUygmHhwCXJfOuXOwSzj64stCKvIqp0/OdZ9kCiESHdK3aJiCqT+7SQn9tMJPsCBKhq8wCSrLbWtz7fwX9gWBsyx+uLymSapyE10j48BKZFFt4qUWXMniUHbwRoSOy8UHpFOyb+DAGFYlWhAYOfsmYjjremy0+TrWQkdgPpo/Ga+R8n9VocM6yMQ3/8GyT5qiSJMw/dnOz/+Or6BPsuRm4j+HdRD9NmHpCiDiqSKwIPnTHZoaG1n8D2cIngbatKM1JqQ72D1y+EcFF+x8GraGl/slI9ZdqTNzVWlOr2KLZXUOIStTHlRAwFMXU2WiDgj8GZFUkTRdCY85vKPGQl1B9EjOcLNOYNIWG3cPw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fbec900-c8e4-471a-59ff-08db471c248b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 12:37:20.4029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ibHzPV30+WRgZfYt1UUYitctTbJgtg1lgXlyCDkEMktcGWCWfIlG1JKFVpf69WEBuUzEF9FKOMuo6MdXhSntNah8wxlp+RocTx1c/Yoo5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5855

On 27/04/2023 1:30 pm, Jan Beulich wrote:
> As of XSA-397 the only caller passes true for it. Simplify things by
> getting rid of the parameter for both the internal paging function and
> the involved hook.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

