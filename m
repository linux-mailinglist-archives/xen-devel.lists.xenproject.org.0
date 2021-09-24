Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09175416F7D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 11:49:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195126.347667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThpi-0001bG-AD; Fri, 24 Sep 2021 09:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195126.347667; Fri, 24 Sep 2021 09:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThpi-0001ZH-5k; Fri, 24 Sep 2021 09:49:30 +0000
Received: by outflank-mailman (input) for mailman id 195126;
 Fri, 24 Sep 2021 09:49:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N27y=OO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mThpg-0001Yt-9f
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 09:49:28 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09f3a1f3-f912-4d6f-bbe5-e1fcbf8a522d;
 Fri, 24 Sep 2021 09:49:27 +0000 (UTC)
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
X-Inumbo-ID: 09f3a1f3-f912-4d6f-bbe5-e1fcbf8a522d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632476967;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=rbwANCvizQntMTQB13f95Hp0vttb28C69lgrf0KIdRc=;
  b=hZ8efAP9tfhQEltgvJgYYj+6K8Dl44iii+SHA4M8rzx1C9Ski/BbRRpB
   88qp8Yjs/Xm4au/CsX1qejTxngGWFsQXzPSj80lH3tEvKOZuCqlurfWn6
   y6tOJASowzyp/+6iyGT+2JvypRGa/SfaSZjm5yi3pyK+w/zfhHOebJgo9
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 9bB0sOGC8/U61e/kpQPqlWaJTZs3EgXixKSKbP1h/cvKKVUyRT6c9jf4JEue/HZvv3jqf8cSyj
 mW5vfkYM/BweM13D9ea5ZoHUz139sCfwbp3tiDCn4SdTncCKbjjFZDDfXagJO5NhkygL89gxu4
 W8gEmGMfqzNeqdK06Mk2I+pzbJjXgZ7A9X5EvtDIYYGHwZKXUCCOIw93x1+BcsfcevOL1Xvvwa
 Tl+y5XWcDQhwLVy73WRXASL9AUBjTM8gRnXO5hMUpBk0ax4kurJy4rwMcJCYzis4ElpIVI++Hg
 6ANb/W0giWFMG0InaeQE85s2
X-SBRS: 5.1
X-MesageID: 53122381
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:d84Lz6N9qeiaszfvrR1PkMFynXyQoLVcMsEvi/4bfWQNrUp2gjFUz
 2cdWzvSO/eKamukfo0lPIrl/R9QsZDXmoRiSAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6ZUsxNbVU8En552Eg/w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYozPOoN1vy
 vd9jKS1eTkTB7Ljku8YcBYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/iRvIUCh2dp7ixINdD3f
 +sQUiB/VxWebD5sKGgrEpAhls790xETdBUH8QnI9MLb+VP7zRNz+KjgNsLPfd6HTtkTmVyXz
 krZ+0zpDxdcM8aQoRKV/3TpiuLRkCfTXIMJCKb+5vNsmEeUxGEYFFsRT1TTifuzh1O6WtlfA
 1cJ4Sdopq83nHFHVfGkAUf++iTd+EdBBZwASIXW9T1h1ILSpDmUGGomfgd5bewYjvYpajYh0
 3yGyoaB6SNUjJWZTneU97GxpDy0ODQIIWJqWRLoXTfp8PG4/9pu1EynosJLVffv14yoRWiYL
 yWi8XBm74j/m/LnwElSEbrvuDuqupGBZQo8/Ay/somNv14hOdbNi2BF7zHmARd8wGSxEgXpU
 JsswZH2AAUy4XelznflrAIlRu3B2hp9GGeA6WOD5rF4n9hXx1atfJpL/BZ1L1pzP8APdFfBO
 RGI418LvsIMYSf2N8ebhr5d7exwlsAM8vy/CpjpgidmOMAtJGdrAgk0DaJv44wduBd1yvxuU
 XtqWc2tEWwbGcxaIMmeHY8gPUsQ7nlmnwv7HMmjpzz+iOb2TCPFGN8tbQrVBshkvfzsnekg2
 4sGXyd8404EC7OWj+i+2dN7EG3m2lBhXs2p95wLKLTTSuekcUl4Y8LsLXoaU9UNt4xel/vS/
 2H7XUldyVHlgmbAJxnMYXdmAI4Dl74kxZ7iFSBzb1uuxVY5ZoOjsPUWe5ctJOF1/+1/1/9kC
 fICfpzYUPhITz3G/RUbbIX889M+JEj621rWMnr3eiU7cr5hWxfNpo3ucDzw+XRcFSGwr8Y//
 eGtj1uJXZoZSg1+J8/Kc/bznUiptH0QlbsqDUvFK9VeYmv2941uJ3Cjh/M7OZhUex7C2iGbx
 0CdBhJB/bvBpIo88d/og6GYrtj2T7siTxQCR2SCtOS4LyjX+Gan0LRsaufQcGCPTn7w9YWje
 f5Rk6P2PsoYkQsYqIF7Cbtqk/4zvoO9u79Aww14N3zXdFD3WKh4K3yL0MQT5K1AwrhV5Vm/V
 k6Vo4QIPLyIPIXuEUILJRpjZeOGjKlGlj7X5PUzAUP7+C4oo+bXDRQMZ0GB2H5HMb94EII52
 uNw6scZ5ju2hgcuLtvb3Dtf8H6BLyBYXqgq3n3A7FQHVub/Jol+XKHh
IronPort-HdrOrdr: A9a23:Cc+IfKyxuR4omU8qADo2KrPxveskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjmfZr5z+8O3WB3B8beYOCGghrSEGgG1+XfKlLbak/DH4JmpM
 Jdmu1FeaHN5DtB/LfHCWuDYq8dKbC8mcjC74eurAYccegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LS0UtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13DDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa3O
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0ITEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4Fy1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfuspcq+SWnqLUwxg1MfheBFBh8Ib1O7qwk5y4KoOgFt7TNEJxBy/r1Zop8CnKhNAqWsqd
 60dJiBOdl1P7srhJlGdZU8qP2MexrwqCL3QRGvyGvcZdQ60lL22tXKCeYOlauXkKJh9upEpH
 2GaiIAiVIP
X-IronPort-AV: E=Sophos;i="5.85,319,1624334400"; 
   d="scan'208";a="53122381"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1DpJ0UYQll5O40jQoweMFmhR7K7J4Sw9h8lDYhnxKYMevakd0F8ZkPHfhwytOngzFfnvQCEwfn+TxKK8jZkKFhzQfHM/Sws+hL8Ndjso1iOZGTCmiRu51eRKBsrSHvnEvqfGUVjS3wLyx7zaRo/R4XWx8cPCOdEa9MOtFGlTIWrg+4E36GqOHJpAtI//PxGuTGH0H/ToIFDYSZXR+JTIob0gXeaop+VJCvX7PIXe8wK7CBxoPQhxlBXzijPfYuhko89I/tp5v0IhpOKoHm0AcawW1VDA7UT5XXzGmUe/v4ZGTDRu/FouNBuDCYwaBzE06ioSZ1i1NbMQ9Cay/3e+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=V0DzXFN+t1jwWMbnCdqzLLN0qwlkJwPhGT2ZBTZkP8U=;
 b=Np+8i1KcS+wsVeh83yjMxFW954MTY8ZL8SNggxPT9cnrUhdd75bHpsm7RIRa01ssJGHCTmdOmSPy20ZaTxk5efTSEJjoFLJABfd3+w3UD3YtvhR2EybJo1FyglgRDj5Oj7f0my7QvzIuzjVqTYtFqdhFnKMfwpIbK6cZzepCgryWbVdTwlsbjxW/BsHA1i37ktKpNgDYyzfVw5XPF/bR71Cy0s2FYF9GVMZOT7KronSFZ5GtEE7FVBOoLPhF2skkfpxtO2JmHKJyHF2NICU5jNZNaK+4xGehrXRw2491E9eqHXb/ggLSegJ5eHfmhUGMWpnqv1BncPXyTHxXIRYsXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0DzXFN+t1jwWMbnCdqzLLN0qwlkJwPhGT2ZBTZkP8U=;
 b=ZAlMQyDn8UpRhzuDex3xw3ko1fVkcRS0BrbVJmjYyK3vwmTygFrKwmt7QG3oSVs4EsgMTCXcDR625qkbN7iPARF3SNoASCGYKgGzDM4onWAnKU5kz9kWOgRWP156PBBMYoa66aDb1+lAZ7JDvpXmZ4jKRo3vbYcUhuaEUssJ8/U=
Date: Fri, 24 Sep 2021 11:49:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Kevin Stefanov <kevin.stefanov@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: Re: [PATCH v3] tools/libxl: Correctly align the ACPI tables
Message-ID: <YU2fHhA+SeE8lgVi@MacBook-Air-de-Roger.local>
References: <20210915143000.36353-1-kevin.stefanov@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210915143000.36353-1-kevin.stefanov@citrix.com>
X-ClientProxiedBy: LO2P265CA0343.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac561020-7412-4a5d-b9a8-08d97f40973b
X-MS-TrafficTypeDiagnostic: DM6PR03MB4971:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4971F6C316C8B468B900DA998FA49@DM6PR03MB4971.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R+K5faII3vJ/b03t64srAjrCh8rzJk+NkheKQLdrfOfCRKaBngqpo+9HeruxsfepG+6oe/AlqIMn8DD8BT+ydi3+Eovzh4u0CJ5WRKklKIyFx5Dn/zuYN/UKq7kTE7OfKPj6wmlCvY2c/2h7p7Fz3se9eDZeJAe6Yrc+/dTCtwQLvWaYBDnuagNJ4FtAlpYKNOQ5s66q8I2FQflIQq1aZLvR9eMIUNTe6XuIb17J7D6O0TNElXta7K7crO7UEGOrET1ydm4X/MnJSYClIf0bYOBgda4LegC8H8uhGmgiddgy+Ky9Ki65pNzys2ifOWBo2CZLjKOjTRDMubgLV1wdOEwNz8Rjxyy5rRwitOSmBeF8mBDsnthXPn/ZUHtMgx53czzyaZtXiH0fBNCud10nrLI5wzvDDWc5WQbD1adimTG7YPiAi/d9dv4kxmMkIlUxYeJ/Yk9AX/wqBhlE0tXAV3jLOWrx3sWgebg/KMRr/qMpkVJOVRAn9wCX7ov4BmGAPrU2SOMOGbxbBypsqSR1u22DxMSexZyfrqOtjtpziAj+d5hvzj55ySLbMq/VV0YkbFZDay9sVeBBSxutnUNouGvFG1MbCle99cM/SPo555lV0fqFxYDQty2okyKE8dyJukvB42YEgVhqE0BNKM9f4AnBQGFFc8FWVd5Z1d2Z8gWB5/otmN0hJMFKpKOhhfQTzHocQUFWITarCIAjAOGLJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(186003)(956004)(5660300002)(6486002)(83380400001)(54906003)(2906002)(26005)(107886003)(9686003)(6496006)(6862004)(66946007)(6636002)(66476007)(66556008)(4326008)(38100700002)(6666004)(8676002)(316002)(508600001)(8936002)(85182001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3V1eGNMQklwVUF0RlVFMkloVWgwaTdPU0VZcFp2d0hncWVYTjV5c0xSTlY5?=
 =?utf-8?B?WjhMVnF3dUxLNlQ2bVY4UkdFRE1UdWNYKzl4RkFCL00zdlhTZ3Zoclh3ZkF6?=
 =?utf-8?B?UVVLOWNuZDAzRm1mRE15R3RMNi92U2p4YTFWQ0tPbVNiYllkRFIxUm1TMk4v?=
 =?utf-8?B?K25IYlp1RFgwR1Mwb0JMSERPSTJ6ejRQTUptcGdnUFY5blhQQk9kNDFJY3RZ?=
 =?utf-8?B?VWJvQk9QS0xCTHo4UXd0VDhENituN2t1cnhlQ05MOW5kN0tseS8rTGk4OHpY?=
 =?utf-8?B?OVJyLzd6YTUwOFMvWXh1OTQ1YjA5aFd3eU5rYTJmcGVkQmRrUzlqTENTWFlV?=
 =?utf-8?B?SzZkbDFRa1VzdWVjYTE3MlpLMkVKc1JHZGduNzM4eGoydVU4N28yU0crMXpY?=
 =?utf-8?B?R21XQUtXSFpSeDRmOEpmVjZwc0t4STNGWTE3T0xWVGVuTS92a084d0psSkxU?=
 =?utf-8?B?dXVreFpFaUhrdjh6NnJvNisrNU1zUHVDbmxOd2E4dGpzQ0g2dkZIL29UR2tM?=
 =?utf-8?B?ZlVSV2k2M2c1YXpOajJjeWpyb2hKOE1zbzdsR1pyMjduQ01FNU9lOHRCVUxv?=
 =?utf-8?B?cGhkb3M2TUw1WnN3L3czbkJHcjFYeUt6dDVLTXVkaWNGTXkzenBWcGpaU3Mr?=
 =?utf-8?B?NVZmbXdEeEhBcjc5azdpSTNzREErbkpGZ3pTUUZxZC9EYS9zN3M0akZRNHhi?=
 =?utf-8?B?eWNjZ3EyK1dwdmlJdmdGRGV0NmFyTWNZTWdxYThBOGU4M3RxbzBEUnFSNlZC?=
 =?utf-8?B?WEd2RktMOWpDTzFYK2hDYXhwbERpRGRhVWZHWTBBRkdqRmR1dkVWdGhleEdB?=
 =?utf-8?B?WGFYdzNsUjltbjhPczFVSEFzM1lDaGlWeDVEamRSSEtJaEFFT0tpbStGNXY3?=
 =?utf-8?B?RHFOWFFSTFNUZFExakgxbEFNM3h6QXJ0Tjk0eTBHN2Q0djRtajdKeHlpVS9x?=
 =?utf-8?B?Tlk2eTVmRjVqMlJsZitPaW5abndQbzdrVWNLSyt2TmczdkdxYjc4dUdoTUVi?=
 =?utf-8?B?SFlLcmdBVS9UVGc5SjJIa0RXakQ2elJlTTNOTzdhY054THRnZzF0OXA5TjI1?=
 =?utf-8?B?V1JYYVFaQVBDcncvc0xjTW5sRk1EdnJhejFpdGI0bFc2T25hQlRRb0V0MjRl?=
 =?utf-8?B?YnZ5cU1pSGlndHRrWFJhbVZXY25XZXA5L0xFc1FyT280MTZPaTh2K0FFTkZw?=
 =?utf-8?B?L0U0YUlWV3k2T0ZDRk1vcHc5UitDN0FYanYvbXhQZXhMNjdYOExsRGFYZnc1?=
 =?utf-8?B?bTM5QXFNMHZtNUV3T2s2OHluWDhMcHlGaW4yVnpMTHUxcUNRdW1VTy85YWNR?=
 =?utf-8?B?Rm5jOXprTGZUY094YXh5U3Mwc1NzWlVMQm9xTHRtMWhZTVJrNXpjZjZWdTJn?=
 =?utf-8?B?dWcxSXZGMUNTQ2dXMUdkTkR3WXUzeHljeUc0ajdwcEt0NU5sek5wcUtSTlo2?=
 =?utf-8?B?K2crNTl0cmpmbmd1SlUzWVpOQ2ZxRDVOSGg0MUJ1ckp4cWxqTWVjczBZRmNP?=
 =?utf-8?B?VStrRWZxbUZGRUJDT2lGRzgxd0R4VHJGK3lWQ09PazZNT3F5clpTWm9QQmNJ?=
 =?utf-8?B?UnlWY1pNRFVFM0VHL0VVbjB4K3UzQ3FJa0o0N0grSS9JK2p5a2pLQUt5cGpU?=
 =?utf-8?B?RHYzN0hiZHlWVERyM0NHSW02Vkt2aXpnRnpaNWVOS2IzWTR6T29RaGI3RVFI?=
 =?utf-8?B?bTVWSkRvUW96TVBrODV3SG8wcCtjNzM5dnF2aHEydVJKemI5cUMvekdWUk5I?=
 =?utf-8?Q?hrKYNzQC4O4xrhartSxwQmdOcBZYPnlmw+yxA+E?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac561020-7412-4a5d-b9a8-08d97f40973b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:49:24.3644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zsg+XGTZRWJiKMQwgULQiajF9toN9Y7NThvXrrN87J+afKC0smMR4PGBrLzCunVKQEz800E7XbnAU82t7Nr+hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4971
X-OriginatorOrg: citrix.com

On Wed, Sep 15, 2021 at 03:30:00PM +0100, Kevin Stefanov wrote:
> The memory allocator currently calculates alignment in libxl's virtual
> address space, rather than guest physical address space. This results
> in the FACS being commonly misaligned.
> 
> Furthermore, the allocator has several other bugs.
> 
> The opencoded align-up calculation is currently susceptible to a bug
> that occurs in the corner case that the buffer is already aligned to
> begin with. In that case, an align-sized memory hole is introduced.
> 
> The while loop is dead logic because its effects are entirely and
> unconditionally overwritten immediately after it.
> 
> Rework the memory allocator to align in guest physical address space
> instead of libxl's virtual memory and improve the calculation, drop
> errant extra page in allocated buffer for ACPI tables, and give some
> of the variables better names/types.
> 
> Fixes: 14c0d328da2b ("libxl/acpi: Build ACPI tables for HVMlite guests")
> Signed-off-by: Kevin Stefanov <kevin.stefanov@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

