Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC98249515F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 16:25:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259098.446925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAZIe-0002MD-BX; Thu, 20 Jan 2022 15:24:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259098.446925; Thu, 20 Jan 2022 15:24:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAZIe-0002JI-8B; Thu, 20 Jan 2022 15:24:32 +0000
Received: by outflank-mailman (input) for mailman id 259098;
 Thu, 20 Jan 2022 15:24:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zWAP=SE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nAZIc-0002If-Fj
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 15:24:30 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d8da0fe-7a05-11ec-bc18-3156f6d857e4;
 Thu, 20 Jan 2022 16:24:28 +0100 (CET)
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
X-Inumbo-ID: 0d8da0fe-7a05-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642692268;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=4a3/Q0RCRAIzVsbylk0dVQpRukc6ECRISNJDdjHvaTE=;
  b=XkdguJgy7T1u59KN/ZmIycl0hv4oAh+NxpvQpC2qAdh8YUlVPbpKiwLW
   wDUf6q4JFX7aPNAL/kmx/JhUved1fDwRdF9HqRJ2Zk9Q2Y/9HzJffUxW4
   5FJAbelCUQDKMy6yG9jR8n2jcopSRsEN3b/N/qzFhsARebi65INeZkxa8
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VG2yeJKpVZABsNV9wVachVRT8Z0y2CdCerJHEI39cBDaZwJLrXAew0sEJOmP+J3hGdwAqHxRop
 TzbNpHsXs1Kgc9dKKt4ciswtN4huoOLCxKtgEWuB1alDtnndS4/kkhbtAfjFp4O266DnBaqQ8H
 tQFfWSv8I/PcMNCMxGZbUfHbEPXcTbT8U+pis1D4Z0eNIehYtfNGIogF2YA8txpvqB0M1SrfJt
 t+m9baKw1gC/vt9Q/p0iymRV76tUD+G3LGBambvLRN+W1ZkzHpdobnqaCLMnfV7pBmridQ9GDK
 g9vDGzCTNR6DoZavo98M0O3T
X-SBRS: 5.2
X-MesageID: 62409312
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vYHpMao+aVcVkXexPOaUgY2efjxeBmL5YhIvgKrLsJaIsI4StFCzt
 garIBmEP6yCZmr9e95+aIjg/EIEuZOAxtZjGwJlqiswFiMapJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw2ILhW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnaezRS0GF/T8o8ImcEgbPT0lOY4e3rCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4UQa6PP
 JNDAdZpRD7lehtFJnwyNKovge2r3VL7ajdVpk3A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru/W70HxUbP9y30iee/zSngeqntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0YNlcOcITsTG27JH3skW3GjMAbWZnZ4lz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPft1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNO93ABbvzt68owGOlor+p5
 iRsdy+2trFmMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8ifhkwbZZYJ2OwM
 Cc/XD+9ArcJYBNGiocsO+qM5zkCl/C8RbwJqNiJBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6NGfjTkkr2uZLDNC/9YepUazOmM7FmhJ5oVS2Iq
 b6zwePQlUUGOAA/CwGKmbMuwacidChiWsuu+pUJL4Zu4GNOQQkcNhMY+pt4E6RNlKVJjObYu
 Ha7X05T0l3kgnPbbw6NbxhehHnHB/6TdFo3Yn4hO0iGwX8mbdr95asTbcJvL7Im6PZi3bh/S
 PxcI5eMBfFGSzLm/TUBbMai8Nw+JUrz3Q/ebTC4ZDUffoJ7Q1Cb8NHTYQaypjIFCTC6tJVir
 uT4hB/bW5cKWy9rEN3SNKC011q0sHVEwLByUkLEL8N9YkLp9IQ2eSX9guVue5MHKAnZxyvc3
 AGTWE9Kqe7Iqo4z0d/ImaHb8Nv5T7ogRhJXRjCJ46y3OC/W+nuY7bVBCOvYLyrAUG7U+bm5Y
 bkHxf/LL/Bazk1BtJBxEug3wPtmtcfvvbJT0i9tAG7PMwawErplL3SLgZtPu6lKyuMLsAe6Q
 BvSqNxTOLHPM8L5Cl8BYgEia73bh/0TnzDT69UzIVn7u3ArrObWDx0KMknekjFZIZt0LJghk
 LUot8Mh4gCijgYnb4SdhSdO+mXQdnENXs3LbH3B7FMHXubz9mx/XA==
IronPort-HdrOrdr: A9a23:rKcY/q+jGOhLX6lSMKpuk+FAdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc29qBTnhOJICOgqTMqftWzd1ldAQ7sSi7cKrweQeREWs9Qtrp
 uIEJIOeeEYb2IK9PoSiTPQe71LoKjlzEnrv5al854Ed3AVV0gK1XYfNu/0KDwSeOEQbqBJa6
 Z0q/A37AaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uHg9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9gwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgnf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQy/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKp7zPKN
 MeTP002cwmMm9zNxvizytSKZ2XLzgO9y69Mwk/Upf/6UkSoJh7p3Fos/D30E1wsK7VcKM0lN
 gsBJ4Y4I2mfvVmHZ6VO91xM/dfcla9OS4kEFjiaGgPR5t3c04klfbMkcAIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.88,302,1635220800"; 
   d="scan'208";a="62409312"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZK9nOco/EilnsHlZ055r9UYH/ckG0bR/a7JcIKinyLXSZYCDKYH4A10x/XSdmpkRPlfghbloRaKVeKLH9xXKzfjSRmHHNnFA5Ddo9F1Rn/1soJ1tuSsiuZj7g59SEPpTUHp1ZQeTuXkwallVwigSB55bsDHa3ZHd/Z/B+0LjnhtWtFj8GZ+B54ydnsLAcFax8jtbIW1b7GNa+A0iHrR0kLp68uS0KSid1fNi45+waeo3P5OmFiynbGxy60qSyJYs8mM/XO5wixha0CJieBnFSnCBKCw931ITCYIyEONfq3q0ocFpN5uG7q6JS4wK16+qp4j6JEqG+Yv1OjBu0l450w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dvTLYhjmAw3K+JdKd8oL5ONXrixpcBGkdbNVDU5IWY=;
 b=G+qDYhx2sR69CCmyHuDenOx4UEtx6K7WxYiup0H2cqH2sF6UIS7SfKCuc2RjW7xDhuBLXzGQDlU704ZQhLqEqeTzwiz7U6VcUzhx4Cjd0MmcredyGPfkVi++/urHYJSYIZ/dsTn5pYUr0Fw09U3k3EcVLiX9X7CxeFCmlln3kvx/90xKeyqrY37PywPGikfZSz/DhC6G918e5m1IoL8U0Ira0Vhg1IDujeZW7uArOGhuyeN2tXbtHDdr/C5IzB4aq2Pkh6zFU3WRL/BIhU2M1XbloM2VywcRzYUvHaV+V3nZDWSUInI97S2YjZbNV98J6HWpb5eVmYGkj/nmUQQ0tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dvTLYhjmAw3K+JdKd8oL5ONXrixpcBGkdbNVDU5IWY=;
 b=kyvJvWG/kY/B3G7IWly5jVO6zWzQY0dOvKDvLENfPLNMaiUft7W7WhNmvtm607j/csN0+FuGMwW0slTz3SYlpdvAP5LokQDOcluYYV/Ohl0YELLZUpGoj/H5bjroG+8Hp7bVJkkKk/xH6hVykMOXvUwPBKBa5BXQAGcn7aQ04Hg=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/3] xen/vioapic: add support for the extended destination ID field
Date: Thu, 20 Jan 2022 16:23:17 +0100
Message-ID: <20220120152319.7448-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120152319.7448-1-roger.pau@citrix.com>
References: <20220120152319.7448-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18b2fc7b-3ba5-493b-0e5e-08d9dc28ef3d
X-MS-TrafficTypeDiagnostic: BN7PR03MB3681:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB368121C33CB1080FCA0DD2BD8F5A9@BN7PR03MB3681.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q8q40r9AlJV5wBydfCmEOY7XSwcVbpYZQ/5/kWSvQa910gOiuXbWShL6RH8glLD7K+ULl6HcSjsfSdl/9FCd/zMXBVlX/87bqlJDARtOvC6sCitUVxaUn/IFh21b8A6RHVdrSCEpP41jRCBRMUX8TIUnS15OKh7hEfQ39iCLZNJHBIbObhjKGlwHOrs0MrigjnTVYBNv5rGNtc3ggfP+GcsmBSwMhoUxJ1flHP7Vs5Xh9+FI3YFK+Y8lMPdeLGgUfAZweC5/IP37YWHCJnAKjDanzSLOpPIPX7WvtRsnphbwIHjVZtcgVrEgJHsg/9leTD15MMomr/U+tWw8gLdYF8Et7L0OR7POL46yDzkj0IUZ5ccZAEr0bmODNdn3b1CUtsjP+9B6ValeVlFRtZnDz+78W+zeBSIJbx+oKcske4jrqKIYe0Xpek+z7XbfYGTA5GO+vtdRP2YLV4MfW3jENNsU/cCEXNXY7Bnuw+13imwATsM8uccQ/b9okve+EoCKxBV1xk7OcpK3P1Mqhcl1d75jChMehOYYefqkygrUqrIjKcs0F9lqUdJ8lCT+IRsuIjDgft2jPQbplmhiBEtLyu2i1G4iYAcSoJVsqNqIDJ1JWjUevwvMfMTvhM8BrXtS/p1BkIIavi+On2GB24OJgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(8676002)(6666004)(1076003)(508600001)(66476007)(54906003)(66556008)(2906002)(6512007)(82960400001)(8936002)(38100700002)(83380400001)(5660300002)(36756003)(26005)(6916009)(186003)(316002)(6506007)(6486002)(86362001)(4326008)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QThqOXZJZTZzaTZVV3hOQkhyT0szU0lHMGFzUFdBYmlSemxaVWpwQ0d0ZFNs?=
 =?utf-8?B?Q2xxdVZTWUlqcmtSM2paTmoyNy90bnpPS3VPR0VEL0pZQVFLUU5tUWxxSFk5?=
 =?utf-8?B?KzJ0amdKbDNiVW90ejFUWS8rQXlYajY2VVlVdDZWWTVtbnVySENzTUZaYW12?=
 =?utf-8?B?bkI0b1VpbzBoQVZDUHFqaXVwY1lEdGNueWdvcUtOZVVoc2QyZkFaNkU2UDR2?=
 =?utf-8?B?UVJOVHlIOCtRYXc5Mm42RDUvYkUvYWxmeml0YWlEaW9oQ3dPMWx5QmQ2RGlU?=
 =?utf-8?B?T2Y4OE5wd2xOdEFvby9aOGpqK21naFp1Qy8yaWVWTlFraDJlbGpudGcwTE5h?=
 =?utf-8?B?eDI0WnhDL0kyTkxaMHA4TWErdng3THNpRFB0anB1TTJGblFMdFgrSGVybnp5?=
 =?utf-8?B?dm5rMnRjUW4wYXYrc2tpalNnRVRsV1p2amNaZWFSODRibUFvYkIwZHFCMXBk?=
 =?utf-8?B?OHpTOTE1WlFDa25xY09Id0I1Slg2eEtRZ3VHY3QyWlhQU2tweDVoYzdQd3lw?=
 =?utf-8?B?amEyc2psZndsMjMweFJsQWJGdjFIWWpzVXZjNis2Sy90L1B2RGN5MUhNQ2wv?=
 =?utf-8?B?SzkvUlB1UEhXbUM5ejBYdFpKRGZ4V0ZseWtLNVFEQnEwbnJCUktMemxTeWth?=
 =?utf-8?B?cW9nNkFZekJFK0RkRjJMc01jNTd3eTY0WjFOcFRwUHY0SmxicjZhWkNKRElp?=
 =?utf-8?B?VDl2QlBscTcveXdoYjV0QjQwNGxmOFNTSUVPQXZDdFptRzZPb2grQnk3UlJa?=
 =?utf-8?B?TUVXa3p3M0EwR0trZVRaMm10V1J2V243TVVTZDV5aFBmK3kzdzZZSE54TXk2?=
 =?utf-8?B?SEdzd3lUUXlGTGFmZTJ0dWlKaXRGbUFZL3BlRWJzWWZhTEFxNnFhS1Eva0lW?=
 =?utf-8?B?WlRqbHEvaWxIMEMxRFl0N21mUFgxZ3RZREk3Mi9VWHFOQ2dWVlVPQ1VETmp4?=
 =?utf-8?B?eTBvdFBVbzFueFRaWGUwdW41cHVEZVl2T2toK2ZPUTIxWjBtbnBPYkxSWnZp?=
 =?utf-8?B?TEoyNUZUdVFWSFBwUExmSjQwNS9UTkdXMUM3WENob0VJVVNvaVlHSUpvYUt6?=
 =?utf-8?B?L1RDOEh3Q0FjRHZwQ09wcUR3b1FRaVd1L0F3WUtEc3Zsd0lveTVZczUreGw0?=
 =?utf-8?B?cW5IQTF3MDNEZzBsTTQyRUU0aURFRnRJY29KL1ZSMDRoMjRLc3dKRmRyYzlk?=
 =?utf-8?B?M2JCNit1NndlS3VrcEF4Tm5nQWJkbjRPb2kxMUhaY3h6Y2V0a2FxOGxqSmRV?=
 =?utf-8?B?eFVxWHZhUkRBM1h4KzNQWldPVGlHcld3Ym5yZzVHZmlFNEhqRXJZcU5tQVNT?=
 =?utf-8?B?dFRZNWpxK0IyMEZ6dHNSdXNXaTg0YUVXRVBGcjdzQWhMRWpQRkRzcFU5WlQx?=
 =?utf-8?B?c3lUbFB4bjROSFFRcFFCaEpPNXZ1V0ducmo3WmdLVDNKNDlHRVl4OGxSSTVk?=
 =?utf-8?B?THFTNUJJWk1WOUdTMWlYdmtzc1YvR0tSbWVzTGlOQ2grbmk4cFMvUHIwU3pU?=
 =?utf-8?B?MDdKQmdRRVNBclB0bGZvZnBTN3A2S0drN0dzUkowMm8rTENkOU9iTXE5WU4y?=
 =?utf-8?B?Q2NUQzB2emZuK1BMV3crMjlrTFNNUFVEdDBLOTA1SFJmTFdrSGNPL2xqVzVN?=
 =?utf-8?B?djcwNGtJaHRJUThPdzdSVkRLSTd1c3JoVXlkYitaVCtnd3l6RXB2T0hNZnRI?=
 =?utf-8?B?Z2graGJsSXgvZXRqU2UyQ2VoZTBZcWJXTzB1a0tFQ0NaK0xaVHRUTnlWZmYr?=
 =?utf-8?B?cW1wZDNTZjlhR1M2Y1hSQldKcW11alFnUjNWQW9BaGNkeVFKdS9JWkR5elBC?=
 =?utf-8?B?MTVPOW9rTGVMaWljbmMxSW11SlZTeWU2K01PZ1dSdHhKRXd0cldkK2NUbHJh?=
 =?utf-8?B?UmkrZld6QUxtcW94RVNCaFFNWHlXam9QaHdxQTFHcWNYSGdtWlc5TUptR0pR?=
 =?utf-8?B?VnBPTDJNTVJCTnV2WTRYRXA2Q3VKa09XSVlhUGZZR0JpRlphLzN6NEkyakFr?=
 =?utf-8?B?K3R1Yi9hekNnRE0xc3lmckhwQWNRSitaeTBxS1UwQmdETVJHQUx6YUJHMnYx?=
 =?utf-8?B?MHA1ZVFMM3dEV1FWb0pjVE1tMThQaHBzSHpvV0VOYkU2K2Q0ZSs4anQ3WHpQ?=
 =?utf-8?B?OVpoYktTeFNhN2krZDhReWJTYU9SaGtyaHlGd0xWSWd0aW5yZGZlTXFRMy8y?=
 =?utf-8?Q?f84k7NCuYmdiE/6RXHJztTI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b2fc7b-3ba5-493b-0e5e-08d9dc28ef3d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 15:24:22.2381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dcMiHg5otU+WRxeIIz8+nqA25Z3PYA4qq2TyzonfV+8BjmKE2glLwGVBWdkEO1Fh6Tr/EAs10+CANsEe3pqidA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3681
X-OriginatorOrg: citrix.com

Such field uses bits 55:48, but for the purposes the register will be
used use bits 55:49 instead. Bit 48 is used to signal an RTE entry is
in remappable format which is not supported by the vIO-APIC.

Use the extended destination ID to store the high bits from the
destination ID, thus expanding the size of the destination ID field to
15 bits, allowing an IO-APIC to target APIC IDs up to 32768.

Note this is already supported by QEMU/KVM and HyperV.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vioapic.c             | 3 ++-
 xen/include/public/arch-x86/hvm/save.h | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 553c0f76ef..1f2305c232 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -412,7 +412,8 @@ static void ioapic_inj_irq(
 
 static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
 {
-    uint16_t dest = vioapic->redirtbl[pin].fields.dest_id;
+    uint16_t dest = vioapic->redirtbl[pin].fields.dest_id |
+                    (vioapic->redirtbl[pin].fields.ext_dest_id << 8);
     uint8_t dest_mode = vioapic->redirtbl[pin].fields.dest_mode;
     uint8_t delivery_mode = vioapic->redirtbl[pin].fields.delivery_mode;
     uint8_t vector = vioapic->redirtbl[pin].fields.vector;
diff --git a/xen/include/public/arch-x86/hvm/save.h b/xen/include/public/arch-x86/hvm/save.h
index 773a380bc2..14a5d94588 100644
--- a/xen/include/public/arch-x86/hvm/save.h
+++ b/xen/include/public/arch-x86/hvm/save.h
@@ -376,7 +376,9 @@ union vioapic_redir_entry
         uint8_t trig_mode:1;
         uint8_t mask:1;
         uint8_t reserve:7;
-        uint8_t reserved[4];
+        uint8_t reserved[3];
+        uint8_t :1;
+        uint8_t ext_dest_id:7;
         uint8_t dest_id;
     } fields;
 };
-- 
2.34.1


