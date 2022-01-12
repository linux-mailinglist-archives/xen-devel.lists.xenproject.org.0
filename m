Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7B048C290
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 11:55:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256520.440311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7bGr-0003x7-9o; Wed, 12 Jan 2022 10:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256520.440311; Wed, 12 Jan 2022 10:54:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7bGr-0003u1-5p; Wed, 12 Jan 2022 10:54:25 +0000
Received: by outflank-mailman (input) for mailman id 256520;
 Wed, 12 Jan 2022 10:54:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dBVB=R4=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n7bGp-0003tv-Ap
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 10:54:23 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe3a2a91-7395-11ec-bd6f-bfb69f65cdc7;
 Wed, 12 Jan 2022 11:54:21 +0100 (CET)
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
X-Inumbo-ID: fe3a2a91-7395-11ec-bd6f-bfb69f65cdc7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1641984861;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=VTUR57S+axA/eyaGaioNevXC9PHHeBVZNuJ4bNuBR0M=;
  b=PjvpPo4Vfi1asWgn/Bw0HqE2nQojQxD/NXURJdi6yshQjXCTz8TxfUg1
   IaBXAM3gyyWZ7YQJSjMgI9GOLr/veRH6RHQCF4dNHAUdG6Teipf4SXorg
   1PvfxTwdPiEa7KTkuWQdjX008J1undJRJYWFhuWK/PGzrHxJX61OUCmeN
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: hYUiELqElar3FKtYoadYCEK3YtpDZAGTKVUl+/D8uZLB1EjrWztIqr7UXzFLjDE3aKDGpAyOGi
 nF4ScYP/+ptWkLVg1Hv1pnn8je2W7ZGHY6kOn4e+pPFPzClBNHeX/DN4X1jhyBlTEj3W/VJd+V
 P5EIAdjxm9ENO6IXRdasg1Me54kR/mznvjc5irzX1QkW9fa0xWHkb6R+sPeJng9kt1OHjYwb0V
 fsj/MnKsQhdCA2wfQ0cway0aGf9eslqp2eKa3JVm8r0H3TVpaYD/gBi0rDnc6/obGr+2xlLvQ8
 5xSLKoVlaKP3+ZT+2+fL+1qG
X-SBRS: 5.2
X-MesageID: 61302832
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ixFZb6rtc7/HDTWWvNP5BMcol3xeBmL+YhIvgKrLsJaIsI4StFCzt
 garIBmDOq2NM2GkfY9xboyy8U8OuJWGz4IwSQJvrHo0Ey9H+ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw2IHjW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnYGfZwgoL/PGo7sMWR1SGi59DIMYwJaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4XRq6EN
 5FDAdZpRBqdRhl0K3wcNL4nuPr2jFv5KydCi03A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru72n/Rx0XKtGb4T6E6W63wP/CmzvhX4AfH6H+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0RvV+HOwrtgu2lbve5wyQCWs1YGB5QYlz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPPt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb5NuRECnCBtJ6sybp1qHHb7
 RDofODEvYgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0ndR03bJZcJmS4C
 KM2he+3zMUCVJdNRfUmC79d9uxwlfSwfTgbfq28giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmD2PLbimkUXP+efONRa9FOZeWHPTP79R0U9xiFiPm
 zqpH5HUm0w3vSyXSnS/zLP/2nhRfCdrXs6n+pUHHgNBSyI/cFwc5zbq6epJU6RunrhPl/eO+
 Xe4W0RCz0H4i2GBIgKPAk2PopuxNXqmhX5kbyEqI3iy3H0vPdSm4KsFLsNldrg77u1zi/VzS
 qBdKcmHB/1OTBXB+igcMsah/NAzKkzziFLcJTehbRg+Y4VkG17D9Oj7c1a97yIJFCe265cz+
 uXyygPBTJMfbA1+F8KKOum3xla8sCFFyuJ/VkfFOPdJf0Do/NQ4IiD9lKZvccoNNQ/C1n2R0
 APPWUUUouzEookU9tjVhP/b89f1QrUmRkcDRjvV97e7MyXe71GP+44YXbbaZy3ZWUP15L6mO
 bdfwcbjPaBVh11NqYd9TepmlPps+9v1qrZG5Q14B3GXPU+zA7ZtL3Taj8lCsqpBmu1QtQesA
 x/d/9BbPfOCOd//EU5XLw0gN7zR2fYRkzjUzPI0PESlu3MnoOvZCR1fb0uWlShQDLppK4d0k
 +4utfkf5xG7lhd3YM2NiTpZ9jjUI3ENO0n9Wkr23GM/ZtIX92x/
IronPort-HdrOrdr: A9a23:ktK53KmpJSgeGpdhZXCDPyJdlXDpDfO0imdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftW7dyRaVxeBZnPDfKljbdREWmdQtt5
 uIH5IObeEYSGIK8foSgzPIYurIouP3iZxA7N22pxwGLXAIV0gj1XYANu/yKDwJeOAsP+teKH
 Pz3Lsim9L2Ek5nEfhTS0N1FNTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJq5mLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86SsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNUQHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa2HackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmPm9yV0qp/lWH/ebcHUjaRny9Mwo/U42uonRrdUlCvgolLJd1pAZEyHo/I6M0kN
 gsfJ4Y0I2mdfVmHp6VMt1xNfdfOla9MS4kD1jiU2gPNJt3ck4l+KSHqInc2omRCek1Jd0J6d
 P8bG8=
X-IronPort-AV: E=Sophos;i="5.88,282,1635220800"; 
   d="scan'208";a="61302832"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zga+ZLR7XnYjLXOSITT7GZSzZ5tVHOI8r7imu6Zc9nK5oIHj4t+P/23Z8rD7IxtHiy3/omI3KjL9+ocPPPAMgh0CCQfuDgwkCosIIbPRnPiX7r+am3o4fPvHQFNfDGHWn7lXdsmwCgDtfaSqktjatsD+YGs+KwXuh4ORLOXnunGzV+vlzmZXE8P5yRgiXd9/WeUMu4lPTScHsCOa4i9AijprCF1eg6QYYPTBBqlLHcJDmlwynrRuwDUKpP8YyuHs9cO+yj6bEuOyCikJPdZT8rfxMmFpQsiMTraf7ADTHsEPgUaMB0KBnRT+pSHsRE7dG2hbXktfpDkVMznYj97dQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5l9J2lg5o7tkoD47AqwNEXWwXLyR2HjIq7FsqYHIWlI=;
 b=JU4PxXqEYYD47ht7St/+jCHdPKXpw+FELRmDbvyCtyzwPjTKVAJzNx2cWfi/YdiIpLI4gV+gtsR+U97iBQ6Gak4G2G+MokV/6MkYcW1h6aEkjnrM9G8DmFBGGyW+WDaiLaJF8n64Al0KcKKyKiMsmfnrEoAMwkheLVSW6eeTLONgqvpNE321C6w7XCtRKXoOk8DSPbqBL3og5vsVrmBcvj7jFcnr6N9b3lRCehgHG0aZBBMJrYGN64/CWbBMI6Mw2FkpIw2Mlhy7rIV3XnyJ2tnmcG+N/3b4kccy1yQ1BIDUvzMim4ZMITE3xgr7Y8dCndot9n0dSDs9zCdrIwao0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5l9J2lg5o7tkoD47AqwNEXWwXLyR2HjIq7FsqYHIWlI=;
 b=VeotjYdVeMhEbM94Gx6P8icYcIUMK2CcMJloO9il6zMQAEp93g8AHtRUnobhsmq3/BzVBExrN3fbhHKGskEoYbI/GVWswbsBCEtzH92kyhALQehGnbLSQpgYjWhkC0Lwca0NxfqtRmP4yA4sMpyYp7wYbDmMm49tsJuw/QxYV6g=
Date: Wed, 12 Jan 2022 11:53:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] x86/time: improve TSC / CPU freq calibration accuracy
Message-ID: <Yd6zEgfPTdBdFR2y@Air-de-Roger>
References: <595b3447-0eba-dfc8-fa24-6bb8b964a137@suse.com>
 <85939a58-ab7f-31ea-1014-91cabe746046@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85939a58-ab7f-31ea-1014-91cabe746046@suse.com>
X-ClientProxiedBy: MRXP264CA0004.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::16) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2654c7b-ef20-41eb-349f-08d9d5b9bb24
X-MS-TrafficTypeDiagnostic: SA0PR03MB5578:EE_
X-Microsoft-Antispam-PRVS: <SA0PR03MB55783B5971F7F5F5BFC5647B8F529@SA0PR03MB5578.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cinQ9QuyJwM7y7k2GzJq30jgNPif/GvPcfzvrsXSyjKAnefkWS5xtGKskaFwLiXxAeLI9PeayaORyJgGNo4m+Sx8o790E1uIatN5UHhuyWesA7T1LWhXPaoRDSffDGwmFnjSVgiEuH0IeFZZ57hsST26cWTro5ikb5NsSZOIEsmK03Y2muTVDNXlzgj3mqBgyUxka7JXbv62vHjXaeSYi7N+CajuhHrkq1qEk2tjOcXOtOH1EGdYpMEUAffhT2UOTJo6akXtX8nmUsc2HJOOabaf3lcxWYqe0LUmPCb4XZWjvVS/PQzUjm/vv7rdKchImdxn/5WtsacTMKelGrXrmTihnNNdkfv3q4Kf3Zhf00ZV/fHRQedBesRQ5FtlQkbXDk7oZO5Bh+5GvtzB1npK6zBO7K5cJgNQ8li5O8j21jkm246ZYVZplKKqXlbfe/qiS+EmbZNdzzqaq3olXD8c51SnHivroMxOOcZ5B0wY045i+/R1hOvWO0rX189iSNPff319afs8RkXv0eA/wDDa6e+yEV6rRLYrvai9NXaakve8oYSlYoebFceObVNWWCeBj/fIBzjFWiplQoMgS70BUBfnXo2S4Shq7cxMFR4+xudQB2KcA4ADfldliFGrm/0e0dYCiHJNt/QsNKu/5nTe+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(26005)(54906003)(83380400001)(6666004)(85182001)(66476007)(66556008)(2906002)(8676002)(316002)(6916009)(6512007)(6506007)(6486002)(9686003)(66946007)(38100700002)(86362001)(186003)(33716001)(508600001)(82960400001)(4326008)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTFsSnI2cmFRN3V0L3hPTUxHaGtwYlZ0dDc1cXVQY1RXaTZzWm93UFpCeits?=
 =?utf-8?B?S1MzZUxYa3JCMDM3UGNyNHBRSWQ3RG1nUnQvcFc4MFBEeENjVGdOeXEwR1VQ?=
 =?utf-8?B?Y3o3Z0lIVWllUml5b2JrbjhwVEQzbjJHTkdqWDUwcFczUGhmZURhRTJXMm5K?=
 =?utf-8?B?NEhWdzF5RmRkRGJhQ3ZWT2NlR2RBZkVxUm9yWnF3bE1nS2dWVDZDb0Nrbk0r?=
 =?utf-8?B?c1o2M01nbmFJRk9waGlGNlRjSlh0V21ueXBqcE1QK2syRjdRUEZPY3VUTTZt?=
 =?utf-8?B?UWwva1VoT3cyOWQxcUtUYlRMa2pwOXJCUzZsSVMzdjZkcHFDMXNiaWxpa2Qx?=
 =?utf-8?B?Vlo5UGhDQmg4WlhpMWdkS0NpMW5EUUhXbHI2bVJMVUZ5Sm5aZG9uMjd6eS9r?=
 =?utf-8?B?T1BUYXVnc0Y5SElaSUZIM0ZOTVdxTFVTZjFrLzRBSUN0T3FZWW1TaXo4di9s?=
 =?utf-8?B?MXdSWEZBalgyNzRIUzg1c3Y2RFhjSFRhVmVJUEhQLzZYT3lvWWxONENWVity?=
 =?utf-8?B?VjBINlcwQXlDU0lkMitqR2JtZkJWUjh0NUFadUlqeGVCbnhSUUY5K2NxRmo1?=
 =?utf-8?B?U3YxdWhQSG9acnhZM3ZzRW5NdWJjZ2hrTk1uVk1UNEF5Nm53VnBXOWE2cGhv?=
 =?utf-8?B?MkN0Y1dZakFYenBYQ3A4VkRzY1dvS1pmZmtyS2VJTUNGVTRNVmZJRE9Gc2tN?=
 =?utf-8?B?V2tUd1lrdHdHTU1KYmxqSytJS1ZKRWpWNDQ4dnk0VG9xY2lSNVdZaGR0aTdo?=
 =?utf-8?B?NmJ2VjJ2eVhpUFQ5NHRFRzIxdzZTZ3NJZTJkZ1BOcDhwcXMvaGlpdFE0MHpF?=
 =?utf-8?B?YjkvQWdGaGYxL05MQk1DUnRrZmRGSW1pNGd1NThVaEdNNW81UFhjZ25uNzRv?=
 =?utf-8?B?Z2xIWU9Kc0RFc1VYekJzRmxjR3ExOFBHbi9rY0pKNW1aQVVHUzJsTTBQc1Bp?=
 =?utf-8?B?KzhSZFZ0aEw0bmg1ckxETk5kWXhGV2ZlL1NHR1Q4WmRwRHRydGhzWGE5T2dY?=
 =?utf-8?B?a2VQVENaSHBPU21GS2dLVFpYWTNaRGpNMUIwdHZsb0R4bGdJb1N1ZS9wSGhH?=
 =?utf-8?B?eDJmYlBVVklOMkdTRlNNUUFNTUpwOTF0c2p1REwwVnlhQTIwS2VmY1Znc3NV?=
 =?utf-8?B?bHRkQnJYcDlobzdtT2VOOW96WDlqQ2xrTnRZUXZ3YXVod0dpcGJDZDJpMHFK?=
 =?utf-8?B?Q3p5NzR0SzFVc2VGTmQ5d0pCU0xZNnVRVXFQTkxUdXFXb0hZVW5HT0Q1eXhI?=
 =?utf-8?B?c2tYbDM4Q3AwaGZYS2hjT3FKRWZFZGRBc3FNYlRxVDZEZDhKSnJTdUtpNVc1?=
 =?utf-8?B?eHRQWUNXeFdyUHBnb0RCWnhCbXloZzV5b1ZUUXVjSWFHcVdvMU5SaFZwR1JH?=
 =?utf-8?B?YWZnTm5CVXNpYnI5T0hwdm9WcTg0ak94ZVMrTWJMOHlRb21qRmxGMmpyKzVR?=
 =?utf-8?B?eFE5VHR2VTZJMlZlYkZPdEhTN2E4K2tRb2lZcklJNjRMMWlsdEVncmYydDF1?=
 =?utf-8?B?eGZ1djRYNWNyQkdEbmt6WWFILzlZeW0vc0FHdSs0YUdoTWNycFF0bjloNzBW?=
 =?utf-8?B?cjgvdkRNblFvN2U3bVBxSE55dXIzZS9KQVZibEoxcmhxYlV4ZzF1b1p0czBp?=
 =?utf-8?B?Vk5xSzVKeWRTR0w4YWovajZDM2hJamJEOGhacTNVU29XZVNYWjVRalIrL0ts?=
 =?utf-8?B?WTJBQkd1VjduQStpRjJzVzRIQTJIV1hLLytYK3ZwZW1tQVdhVlFrcmR1NWpU?=
 =?utf-8?B?K2ZyaVZueUlzM2xzaDFFLy9XUzFFdE55b256ZDFES01VVldQUXZ1b0FUSFdV?=
 =?utf-8?B?bDBhYWpXUG1yZG9jUkhvY0F6Z1dtZGRsRHdoNi8wMHdoTnl2Z04rV1cyODd6?=
 =?utf-8?B?Vy9xdDdBSmFLdG1FOXFEd1VCRndsMkVkVUlybWIvb3pWd1hBUVJmM01KL3hM?=
 =?utf-8?B?YU9OYzZwa0hnKzJSemlsZGNoVjlXM1A5K2l3aFQ5cUdJSE8yZ2N3b1FtL3Vp?=
 =?utf-8?B?a2FHYzlHaktVQmpMeGZ0clJaMFlsakh5YS96bk9DTzJrR1hydGVUdE9LaXJp?=
 =?utf-8?B?NmxtbVlBVDhlb05NVnQ5R2IzUU82ZjJOa2VtSllTaXU2RUpNQkVRc21uR2cv?=
 =?utf-8?B?aHZUR0xxdVhGWXZuUkRvQ3JHOHhKU2Fpd0UySHVMZk1Md3grQTZSVVZjUTNk?=
 =?utf-8?Q?9JjJ6OERRdaRjzG6HEkhwnQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2654c7b-ef20-41eb-349f-08d9d5b9bb24
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 10:53:13.5951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RCRMVzOc/L049M39pGU9G602MQyHXISk6N9ensbwrUKjbhR8vVx3vJnqO8vqLJrAoT1M6z5ULZEuii0oMgtJXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5578
X-OriginatorOrg: citrix.com

On Wed, Jan 12, 2022 at 09:56:12AM +0100, Jan Beulich wrote:
> While the problem report was for extreme errors, even smaller ones would
> better be avoided: The calculated period to run calibration loops over
> can (and usually will) be shorter than the actual time elapsed between
> first and last platform timer and TSC reads. Adjust values returned from
> the init functions accordingly.
> 
> On a Skylake system I've tested this on accuracy (using HPET) went from
> detecting in some cases more than 220kHz too high a value to about
> ±2kHz. On other systems (or on this system, but with PMTMR) the original
> error range was much smaller, with less (in some cases only very little)
> improvement.
> 
> Reported-by: James Dingwall <james-xen@dingwall.me.uk>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> There's still a time window for the issue to occur between the final
> HPET/PMTMR read and the following TSC read. Improving this will be the
> subject of yet another patch.
> 
> TBD: Accuracy could be slightly further improved by using a (to be
>      introduced) rounding variant of muldiv64().

I'm unsure we care that much about such fine grained accuracy here.

> TBD: I'm not entirely sure how useful the conditional is - there
>      shouldn't be any inaccuracy from the division when actual equals
>      target (upon entry to the conditional), as then the divisor is
>      what the original value was just multiplied by. And as per the
>      logic in the callers actual can't be smaller than target.

Right, it's just overhead to do the muldiv64 if target == actual.

> TBD: I'm also no longer sure that the helper function is warranted
>      anymore. It started out with more contents, but is now
>      effectively only the [conditional] muldiv64() invocation.

Don't have a strong opinion, I'm fine with the helper, or else I would
likely request that the call to muldiv64 is not placed together with
the return in order to avoid overly long lines.

> 
> I'm afraid I don't see a way to deal with the same issue in init_pit().
> In particular the (multiple) specs I have to hand don't make clear
> whether the counter would continue counting after having reached zero.
> Obviously it wouldn't help to check this on a few systems, as their
> behavior could still be implementation specific.

We could likely set the counter to the maximum value it can hold
and then perform reads in a loop (like it's done for HPET or the PM
timers) and stop when start - target is reached. Not a great solution
either.

Thanks, Roger.

