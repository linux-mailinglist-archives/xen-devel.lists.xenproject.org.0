Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CE04667B5
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 17:17:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236864.410808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msolT-0000AQ-Jj; Thu, 02 Dec 2021 16:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236864.410808; Thu, 02 Dec 2021 16:16:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msolT-000079-GR; Thu, 02 Dec 2021 16:16:55 +0000
Received: by outflank-mailman (input) for mailman id 236864;
 Thu, 02 Dec 2021 16:16:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tajg=QT=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1msolS-0008UP-8Z
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 16:16:54 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41329cad-538b-11ec-976b-d102b41d0961;
 Thu, 02 Dec 2021 17:16:52 +0100 (CET)
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
X-Inumbo-ID: 41329cad-538b-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638461812;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Lfkq1/1xusSfUSpwfYXB4nguFCBn6M1AnFXzXSk5ps0=;
  b=UQQHp2MY1aRaOWhfqLrl2bTvOCefpMJM9ToFzQmBwXJuJsNM+8ic0Z9/
   TTKnh8xsiuqqIZNguKQ/ZAWIKLILwqp2Ow4iioCVOu4KloNeJqhj5ofzx
   9ZePupq+FZ2XPRLTxm7Dt0ffwEldNhGLk/oPcGAR07Uc/cb8o63mHqdgy
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qcifXjHaluhFcdt884WUWdLGLkfzbnXhTTJWnVihUX5nAWtot68Ba89YSXsd6+YUNqi8IDgQWS
 BRrhrJxviiQ6DUvTcO6bVstXN0npW6v+Ga/qQKnRo8O1MbOxcytrIXJf3eSLgoOU5911MSTPQq
 jy6B9+FPGobDaa8d1ZupTPQif/xvVKIYNNTAfRfF6e9EEfEm3Iw/addVbvbD8pYpR3gVtncWdV
 FRFewyQa+I9HB8sNUGhvOxjnM7zaAPcPQ0RuyRfzO9DVjuK/fo5cTAWZCgHggt2S9t6zBZXZpp
 tzrDov3rrBhf+Wasu004jPDg
X-SBRS: 5.1
X-MesageID: 59125790
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1bYdparm1zLOwBlpi/2+V5k64HBeBmLBYhIvgKrLsJaIsI4StFCzt
 garIBmAPfnbZGDwf99ybYq+8U5S6pPXzNY1QAZopCozFCgV8puZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd+4f5fs7Rh2Ncx24DjW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnb2BTz40L73NpL0QejdpLHFVHoxA84aSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp0fRKyDO
 JtBAdZpRDvvUhAIBlEFMo43nNX5j2PuWSBBpWvA8MLb5ECMlVcsgdABKuH9YtWXQe1Fk0Deo
 XjJl0zpDxdfONGBxD6t9nO3mvSJjS79QJgVFrCz6rhtmlL77m4ZBQASVFC7ieKkkUP4UNVaQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJxIusD9RCdy5aN7i+3N1dUZR1gbtcf4ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud14WtQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhaT0uTA3Dt4ade51q2VtW
 lBfwKByC8hUU/mweNSlGrllIV1Qz6/t3MfgqVBuBYI90D+m5mSue4tdiBknehw5aZZfJWCzO
 RSO0e+02HO1FCDxBUOQS9jvY/nGMIC6TYi1PhwqRoUmjmdNmP+vo3g1OB/4M5HFm0kwi6AvU
 ap3gu73ZUv2/Z9PlWLsL89EiOdD7nlnmQv7GMCqpzz6gOH2TCPEFt843K6mM7lRAFWs+16Or
 b6y9qKiln1ibQEJSnWNrNNIcwlVdSNT6FKfg5U/S9Nv6zFOQQkJI/TQ3akga8pimaFUnf3P5
 XazRglTz1+XuJENAV/ihqlLZOy9UJBhg2g8OCBwb1+k12J6OdSk7bsFdotxdr4irbQxwflxR
 vgDWsOBHvUQFWiXp2VDNcHw/N54aRCmpQOSJC75MjIxSIFtGl7S8dj+cwqxqCRXVnirtdEzq
 qGL3x/ARcZRXBxrCcvbMar9z164sXUHtvh1Wk/EfotadEn2qdA4IC3tlP4nZcoLLEyblDed0
 g+XBzYepPXM/NBpoIWY2/jcot7wQeVkH0dcE23K1pqMNHHXrji53ItNcOeUZjSBBmn6z7qvO
 LdOxPbmPfxZwFsT69hgE6xmxL4V7sf0o+MI1RxtGXjGYgj5Cr5kJXXaj8BDurcUm+1csAqyH
 EmO5sNbKfOCP8a8SAwdIw8sb+Ki0/AIm2aNsaRpcRuivCInrqCaVUhyPgWXjH0PJbR4B4op3
 OM9tZNE8Ae4kBcrbo6Lgy08G75g9ZDcv3HLbq0nPbI=
IronPort-HdrOrdr: A9a23:OeOe3q0+q6ft2rWNuiHqGQqjBEgkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7Ar5PUtLpTnuAsa9qB/nm6KdgrNhWItKPjOW21dARbsKheffKlXbcBEWndQtt5
 uIHZIeNDXxZ2IK8PoT4mODYqodKA/sytHWuQ/cpU0dMz2Dc8tbnmBE4p7wKDwMeOFBb6BJcq
 a01458iBeLX28YVci/DmltZZm4mzWa/KiWGCLvHnQcmXGzsQ8=
X-IronPort-AV: E=Sophos;i="5.87,282,1631592000"; 
   d="scan'208";a="59125790"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jP3ao/d++cjipUc7GcpciZgGXDPhe9VHX2ceNdB221fbfVzkWj3FkXlf4+F/kJCihp1lT3U1xLmnuyx1zhaR5+y9RIWpuwTfaDtOvpAuZoUtBvZeniyGxqrmD7jKyeNnxazm9WpFSykTWEHiYEaHsLa0pBhwFQzUF1vAz5i3pCrEXv53Ac7tbOjsWspiIjn/2PKZSNoa2Ts06x0wvtgFQRf0CkO4NJPMrQbOPiReLPb+qtiyNgr/ctpnE/UX8xvr0vpIKwW8yqR20YVS3ICPz0xDbBzO2YsvsxSHWNI9EEoh3GTc1SaWoO7kcab1Xp+CT9YGyl6g1aWEa8LWP73YuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9jAKJ34GuKPCwaNFSiIkIyFg3lHK6naQxXD7z+ohLg=;
 b=bBR/euSZXfa/ykYnzIco/H6vi+LW7hcI4QQPn8sDUDgbInBxs9nyEX+hAHeOjrWu3xyJgG2ZwbUZ9WKWW1bktDrUjX+vhixlxt06kx4/EJ7QPILVsTd70Ur2CfnvJtnQ9IAuFC+X1+PMzcMMkP3G0vuSUjLWXT26qPMRcZ5C3VVEpemLb0N2C1ijSpX8RgnOrvbEcInXg9Zrg4R+Grl+Uy0iEVG+pPiDiW5euZB9sgFvvKulRis/QiF+Cv/XD6gVv8mcL0FZtIAGwS/nKXCwDyQOo7VSJo3W64Hlc4MzMV/9k0k9T2m0Sbe/ttT9RkpfuFqpvBanPYTGwHf6QYvMyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9jAKJ34GuKPCwaNFSiIkIyFg3lHK6naQxXD7z+ohLg=;
 b=PXg62nlf+5rsXsmYLis467BPWTf7yBF6tsxvoDleANRHyQjlt7BrsUvXVQxYVhhoUagoCQHrv4L2lOpEAjh0zliPpXAUitrzwbJJHlRMZNzf/WpvFiWU21+Fbl0c1yWxgDruI+pR18LdkBK0AItCyOUwEd1QNqxAZ8Gq6qJZeMA=
Date: Thu, 2 Dec 2021 17:16:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 09/18] AMD/IOMMU: drop stray TLB flush
Message-ID: <Yajxapaf4lDovZap@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <6d825fc7-d600-6759-5bc2-ab8b17e4033b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d825fc7-d600-6759-5bc2-ab8b17e4033b@suse.com>
X-ClientProxiedBy: MR2P264CA0051.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85a5bfc8-9488-4970-9f49-08d9b5af22d9
X-MS-TrafficTypeDiagnostic: DM5PR03MB3371:
X-Microsoft-Antispam-PRVS: <DM5PR03MB3371D9865F186AB1999A6E828F699@DM5PR03MB3371.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s7UATECTRCJ2urlYcYAOrAQ0t/h4Tlxqa3RrWJ6g85uyJ+5B5eY83OlmX3IGT+3JT/zpMPJUBcq7ODmL9sgG2XXIrwnMrtrClWbmceZ+cg1bdwSplOTiLtiaovqy5LYB9mKzTiahCN2ItwrTd3hQ+IEUuBKcG1P9jmMYyZujo75I+/poFkyX7ZIpzvHImRavb4BrKH/5lQlVduG1Ssk282fPHGPOEFbK6sPSvMG63cq+Nfli79xhqZV7hU1JC2PIF7H2fTt7o1zQuGz6RmA1RYAy1qoiQBb6Lm6g5r99ydszy287K9ZozfZ8Ja0gu32lyEmaSvTK38zYWfT3r0ICvD2woPsTHoqul32VujwB2IvLxbpMGnYQOdaXr+meDtnXsRlDycTOPFApIyNJjbgcf/p0UNnPzmLPwgivL8jTkS1LlXtOmzvBiyUJmHH8yTiSHFEuEplQIfUnAzezygia8Z5yp1sBmkqQZtzQ2c/UEsLM0M624YmrMs3wU4uJTb77noAKvLDM0xheR4dK6QGKXVE43umHNDFAKagn4MVqolZq+iRSnZ/Zg7v6kYF5OhqyRxzUtQLF6U2+pTrxJZEUIHw6Rjr9ZBqJOH/rZqcGb34hgJq2JWdD3t6iqNTWBEh0hyhmo/iwMXzNFiHA7w1icw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6496006)(956004)(82960400001)(508600001)(316002)(33716001)(9686003)(66556008)(38100700002)(5660300002)(2906002)(54906003)(186003)(4744005)(85182001)(6666004)(26005)(6486002)(8936002)(66476007)(6916009)(66946007)(8676002)(4326008)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2p4clpHUjVMbzRheVBMUkQ3YVY3T0R4dXNJVHZNUU9NOW45cnFPOFlJVnB1?=
 =?utf-8?B?eE84VTZhcGpUNDNhTE56c2dETUExRkpJRTViQy9KZjZ1MGczV3ZiSm1sNHg0?=
 =?utf-8?B?RDZqbkNVTGkzdXNkYTBuZWc1U0JaVWtrQlNCdXVCbHZrVTJPdXlJOE4wTzhk?=
 =?utf-8?B?S01Rc1kyU3ZySnNQQU9BVnR3aU54d3VHSVlYd3BKTXVFMDh4VmM0c2ZzVkQz?=
 =?utf-8?B?K1QxdTlEZnRYbHRmaDBRWlpvOHh2aGtucVhHa2FCdkJWbG4wRnZFUDJLOFRG?=
 =?utf-8?B?YmV2cWY4QlVZNms0N1VidTRNT1J0NU9QUDBhV1ZlTVhhbDdzbEk2Yi84Rnhz?=
 =?utf-8?B?THJPM2RVemJjcmFsYUxpRWZQNktZY2RLU28xeHBMR0c3MWZYa082MjNJM2Ir?=
 =?utf-8?B?SzNiNmRrZjhTb1dqNVNZUTg1NGlteVNXdWFZNlEwZGF5UitzUDVjcnd0eTdV?=
 =?utf-8?B?NTl5SDJCY00xZVVGRG00c002dWl0WTJOODUvN2pFMmlKdW5TQkJZVy9vVmlT?=
 =?utf-8?B?UklCSWhteUNoZVRocTFZaTI4ZXdwRnF6bG5GNVF5ZHpxNnE1RzlXdE85eng1?=
 =?utf-8?B?VEJ4MktMNVA5cUY4T0lmMWxCY0Q3dzhjMEtwOTN2MzRjd1NaT3BocTFMNm02?=
 =?utf-8?B?eWVkb2NNOUg1cFVhNDJGVktiR2pEV2dOUWdOVDJuaDNIMCtVdndibUNjZmJh?=
 =?utf-8?B?M09hd3ByRGFmUHk3ZTIzbTN0YlVRVGRDc3B1Mjk3RklPSEFqWmtZem5BWGFw?=
 =?utf-8?B?bmNmazFTb2FFRWpEUkZINVVJQmpJU0RZQXM2NWJxL3UvM2tIN2hEZFhhaisy?=
 =?utf-8?B?VXlRaVpOVmpCU0xkajNnK3hsK2pHSjBTQXFHazdtK2wvRjFyVzkydnhxMWFm?=
 =?utf-8?B?YUR5OE03OElXeTcwdkd2WHJkUkhrYXpEWVNCM0xIZlloT2pFVVFZNmdaMlRI?=
 =?utf-8?B?ZzAxMDdyMTMvVlFEemkzcE0wTFQzOGoySU9Pc0lobmhHeFlqUHlkQUQvV2ps?=
 =?utf-8?B?Z3ZKQk5NRjNrYWRYejMwbi9GQ291OUFSQW1HTU1MOUFGVWdPL2Y4a1NWcHlm?=
 =?utf-8?B?Ukl0S0grMzJiZkFUb0hzRjc2am0zZUVWT2Jna2xmTkMzT0ZHT3RhSjM2TkxG?=
 =?utf-8?B?SUdvY3JnZ2hmaDZ6YjR5NUwwRFo2YmVSU01VNWpvWXlhNE9qcCtUUlB3N3R4?=
 =?utf-8?B?THVDTlBVUHdyblJPcW5GLzhXTWlMaktyZEZTcnI4MEc4anJKOXJ3eHZDTXlP?=
 =?utf-8?B?d0d4cUtvYXFVajB2cmJqazU1cFNyVHBWejlrNTVPTWtiQzFEOTgrMGpRd2ht?=
 =?utf-8?B?eEczUjNWaEdUdnVUaVhBVUpCQXc3RHllZ0ZjWUlkcXYyQ3VYYmpQLzdSYUhQ?=
 =?utf-8?B?OUpDYkJaZjZ6eW1LaG1mK1pVMGszenBack9qaE5yRkFYU3Y0dkRxVVdXNys5?=
 =?utf-8?B?bytHaGtaVVIwQndybXpSTmk2TmlXNGhCZ28wS0lML3FCbktqZFlRZE1pem5Y?=
 =?utf-8?B?UkZpWVd4aHpZZXQyMDVNc1lvd01wNjBaTTcrazNka2w5RGtDR05leEowOXFR?=
 =?utf-8?B?RW14RTU1dnRFd3ZheHhlWkRUWUs0SThaN2pzWFZuYjhLK0FuWklZUm9PSjly?=
 =?utf-8?B?eVdXYWczb1NaTEpzRmoxUFlvcW5MQVNkQ1RYVGF4b21sc2FpUlBSUXVOZ1gz?=
 =?utf-8?B?TnBqeEpIdDlKNUNQZTF3QWZWL3pLeHkzOFJnalBlSkt3WkZ3cUZwUks0YUFs?=
 =?utf-8?B?TEhjeE9XSytXNjhUUnBnTDF3eGl5YzY3cUd4NFBrZkdNU3htRjhjd1F5bHpX?=
 =?utf-8?B?dHpIWGhSa0kzOERHbFhRTGZ2bzQrdHlMS3o4VjZ5djNyaUV5YnQ3Ukt4d1dO?=
 =?utf-8?B?cndpUHlyQzFDOWFRa1gyLzlnRnZZRS9aU3ZSemVzMjNraGRtMzBQNVBrK0hw?=
 =?utf-8?B?RWZoU3NHZWhCOGRGSjZwejNzWDVzTlgvQmhRRXgzVmhjSmZ0L2xxMldlZEZH?=
 =?utf-8?B?Z1RCQVZRdFNqcjYvb3dVVWl6TC8vYXpvREdpUWc5R3RSRUVITnhwWkZJWVhR?=
 =?utf-8?B?TldteC9COTIxYzFzWkYzVUI2Z0ZFd1pURmc1anp5WXZQOU1rdjEydzZzcWlI?=
 =?utf-8?B?bkRQUzI3aGpKR09NVG12N3RqSE9QSU5PbGVUSnMwYm9tMUlpTDNGZWVUakta?=
 =?utf-8?Q?+CL6zMo/EBt/lp7mkRvfMDw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a5bfc8-9488-4970-9f49-08d9b5af22d9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 16:16:45.9491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QFs7nnNHbt3OwaxoaQO42EeZbkWklTIeEXSG7Zd5Y53nx+FYpB4JiEUKdyBigqDzyF4LvDUY4V0vzWOyDNBSkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3371
X-OriginatorOrg: citrix.com

On Fri, Sep 24, 2021 at 11:48:57AM +0200, Jan Beulich wrote:
> I think this flush was overlooked when flushing was moved out of the
> core (un)mapping functions. The flush the caller is required to invoke
> anyway will satisfy the needs resulting from the splitting of a
> superpage.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

