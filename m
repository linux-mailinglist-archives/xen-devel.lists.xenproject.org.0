Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6754FDDA5
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 13:30:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303630.518030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neEiV-0005AI-Kh; Tue, 12 Apr 2022 11:29:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303630.518030; Tue, 12 Apr 2022 11:29:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neEiV-00057o-HP; Tue, 12 Apr 2022 11:29:51 +0000
Received: by outflank-mailman (input) for mailman id 303630;
 Tue, 12 Apr 2022 11:29:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=to5A=UW=citrix.com=prvs=094341a74=roger.pau@srs-se1.protection.inumbo.net>)
 id 1neEiT-00057i-QX
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 11:29:49 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d870b517-ba53-11ec-8fbc-03012f2f19d4;
 Tue, 12 Apr 2022 13:29:43 +0200 (CEST)
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
X-Inumbo-ID: d870b517-ba53-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649762988;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=CBYkyJJKZNzuhVI4ZkpcSTFQKT18PoR44cU2WLcV6L4=;
  b=GDJYAuR0wuJScgOdkHmsQoS1m8OfIz+U+Bi7eOnC4G4YLA4byS1DpAXJ
   EyLa7UeB7gl0gYTHmsC4+oGQgCKmoRnKCyFtFln2DpityKmktGGr7ye8T
   D5HFydQkc0DBUhoEG+r1akF1l2sSdsbshuHk594z1pas/pEqRdLwnjK0h
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68663814
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3H+Fh69GJTgY//OrinYNDrUDn36TJUtcMsCJ2f8bNWPcYEJGY0x3m
 mobCjzSM/aNZWH1etl3PNy3/UwDu5Pdx9VqHVc6pSs8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw3YHjW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnYGIETkCDKTSorU6aihqCTNzFIwf/6CSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4eQ6iFN
 5NFAdZpRCiQfi9VG3gTM7w3lsi0tyP4Vjh0i03A8MLb5ECMlVcsgdABKuH9eNaHWMFUlUawv
 X/d8iLyBRRyHN2AyxKV/3S0nOjNkCjnHoUIG9WQ5vNsxVGe2GEXIBkXTkeg5+m0jFakXNBSI
 FBS/TAhxZXe72TyEIO7BUfh5ifZ4FhMALK8DtHW9imQ8vLqyDSQGFJVaQdwWsY0ueYXHDs1g
 wrhc8zSORRjt7icSHS4/7iSrC+vNSV9EVLudRPoXiNevYC9/dhbYgbnC486TfXr1oGd9STYm
 WjikcQou1kEYSfnPY2f9EuPvT+jr4OhouUdtlSOBTLNAu+UieeYi22UBbrzsK4owGWxFADpU
 J04dy62tr5m4XalznHlfQn1NOv1j8tpyRWF6bKVI7Ev9i6251modp1K7Td1KS9Ba5hYKGCxM
 R+D4F4Lufe/2UdGi4ctPOpd7Oxwk8Dd+SnNDKiIPrKinLAsHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6R4YUyUsxaIM6Nb75Fi9cDn3lmrUuKHMyT50n3gNK2OS/OIZ9YYQTmUwzMxP7dyOkj2
 40EbJXiJtQ2eLCWXxQ7BqZPdQtaciVhXcmeRg4+XrfrHzeK0VoJUpf56bggZ5Zkj+JSkOLJ9
 Wu6QUhW1Bz0gnivFOlAQio6AF8zdf6TdU4GABE=
IronPort-HdrOrdr: A9a23:1vDVyK1EvgtBaMvRS7pDDAqjBURyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJU80kqQFm7X5XI3SJzUO3VHHEGgM1/qF/9SNIVydygc/79
 YeT0EdMqyIMbESt6+Ti2PZYrUdKbG8gdyVbIzlvhBQpG9RGsRdB1ATMHfnLqQ6fngxObMJUL
 6nouZXrTupfnoaKuy9G3k+RuDG4/nGjojvbxIqDwMurFDmt0Lh1JfKVzyjmjsOWTJGxrkvtU
 DDjgzC/62m99W20AXV2WP/54lf3PHh1txALsqRjdV9EESkti+YIKBaH5GStjE8p++irH4sjd
 n3uh8le/9+7nvAF1vF1CfF6k3F6nID+nXiwViXjT/IusriXg83DMJHmMZwbgbZw1BIhqAw7I
 t7m0ai87ZHBxLJmyrwo/LSUQtxq0ayqX0+1cYOkn1kV5cEYrM5l/1UwKpsKuZOIMvG0vFoLA
 E3Z/uspcq+MGnqJEwxh1MfjOBFBR8Ib1e7qktrgL3m79EZpgE786Ii/r1vop4xzuNCd3B63Z
 W1Dk0RrsA3ciY3V9MIOA5Te7rBNoTyKSi8Q156Z26XVp06Bw==
X-IronPort-AV: E=Sophos;i="5.90,253,1643691600"; 
   d="scan'208";a="68663814"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vv9qcO76/FHdf94e82A65+nH/YecezlRZ9sMXOf2zn0XwJ3F0nE0lI2J7EYnI/P0mJfEG5vGYNX3je4411pK0clQ9ciBXS1qx+gr1n6r+0OE8Ja3Wraz9HZ4mHTShWatb+N/OYqaymiC4orqUqR4fCJqe1ivbsrBL63rTqP7oLPhMMxjd7ca5AJBk2i4lmot2lt6se5mKMIZ1hc7Z2wHEmrxBUoUZIbEc/Q6RoRQwUMS8D3LBFHRF4HLBftBl9YgBlaAPk+A2VKj8RUZpI9N/unTVrncMdoppPVtfNQD8oEW3PwclbQx2JvmwKfX61Jvy7GU3xcZ0vElJo2TGS7ykg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bngOjZX9TjFtUO1OIs/aDJJxn47SxW4y9qiyFqNZ0Hk=;
 b=biNDQ4vFQ5r3mH4LX0dNFhMYV1oNsliDP6cLrn7dDDoiqhhqWsCmEe7RCbxxXzVoIiNffWhIhbibDqmS+UwyuWbki0J3VJYvyZIF6bNVZU2fNXHIn4fNOnhA8IWjM+sO8EtJSvI3q5a7kYSNWcraQOwcxzSNPRx/F5S2ig8tehpwMjS+E8Y/19D6Tb63xc37EiI7vpLAuuhxaqNNQQG+o/MTLzRYtzGYvwIX5jMGdOZK0I4ZMUsUK9xNSQ2vIMW/z5E39pGzC5rdFcpma2w7/Q3qjo6ErJJFMzHvW0vgE5gWpLEYhbz+E3c0UbjP9dH68rKyio959zURKlEVWIDzqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bngOjZX9TjFtUO1OIs/aDJJxn47SxW4y9qiyFqNZ0Hk=;
 b=gbYATFRVCtCOAHr8ExDXwW9gAOMz4aCYgUcesWXCnrNPOeN8TVsnvXpEO1Q41kJZ0hdV6abPvzThHA0vk7/bhrEYKZ8txHB+e67KGkO24gTVEugNK+mtyo14QQCFAXgBKQFcdsc5GkIguyXyhQ9ZF7JzGnK2RgIkjePWRX2I2wE=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>, <iwj@xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] osstest: install irqbalance
Date: Tue, 12 Apr 2022 13:28:59 +0200
Message-ID: <20220412112859.73330-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0480.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bfe4824-f79b-43ff-f848-08da1c77aff5
X-MS-TrafficTypeDiagnostic: MWHPR03MB3038:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB30381C832304EB749F296D0D8FED9@MWHPR03MB3038.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GRTnEstcH7f9VMJbnkg0xxEXiBlCWfMEETdILvU/Q5cL5h9kBdUJQig4xP8qInGl8FLKIjL0mUrXu/ei/p6J4GydN0bzJ7tcjJWqNp6F9mRzQs55BTFXQuPIYe1+rSUD2/QG7H5NUBCywrHAUF0vtzoTMTpM6j/pkzaz6aGyxMX2wSFoA+eDeaECAmjYckIoOF1LXmog0Mlj03AJVD019sNQ2SHssBNKb45L4ABLyg3mdwvNfjN/9+iPeWiOO3Zdy32KmNM+Fut9Y6+L6gKnF+nIZKsdgNcaKUX9BCoGx0TeawMWUYh2HeDF2fzQza8VPv/i8kkEhEYtJdCEKX19zuWzjzpZg9KdWb0HUyz8OnypigcURuUxu0RUXa0bT+RvS+Uob1tgm70VjoSA4H3Tz95ROpgZaMWuOHKyyAOFryPramr8tE4e71zVcD8ftzBHVzRMK8ZD0FWTdoEnMmecvy9D8jdjCsFIbdgowbaKDebUIf6VYJg5oMV3rLpEgV8PZ/lZFMp7hcvl/tnutBaDAu/D6Niv1jskY0Yqe9DC8S9dD5Np/mDl0qU6BzNnxmolwFXI/6ji+II6z1ftQQB12SQRj67P8JWgQmIHPUC6TxrSB3pfbjq7dMuBgZHcDdCc4BV+LJNwgJU6zj5My011iA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(2906002)(66556008)(66476007)(26005)(66946007)(6512007)(316002)(6506007)(54906003)(83380400001)(6486002)(508600001)(8676002)(186003)(6666004)(4326008)(86362001)(5660300002)(8936002)(82960400001)(1076003)(36756003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bndvRnhJbUp4Mk4rMnA0Y3lYdnc5YS9FblEzOHRLNTZBZ0RtTFV6Vk5JRGZa?=
 =?utf-8?B?RWdhdFpCcmt6SjcyWEV2ODVlaUR6TGxDNU9KOVRxSnpZRnhaNG1rRy9rYW0v?=
 =?utf-8?B?emthc3BYZTFPUW1INHVINFNkbFVYUDY5ajFMSGtlSzJzcWo4REQvU1R0RmFN?=
 =?utf-8?B?Y3hjUnJJTDJEc1JiV1VvUmRkSENHTGxKcnVCUHpkUGFhd0FLYS9ualp1ODBU?=
 =?utf-8?B?L3BvWjBlVEdqSGVybUJpU0VJSDd1TDk3eU5SZzE3ai9hSFpDZURMTyt3WVN5?=
 =?utf-8?B?RndvdzFGNFA5cXQ5WWZqekkxQ1ZySVU1VlkvVFN0d1c2WVhhcDk2RFlpWHpY?=
 =?utf-8?B?K3RqZjAraFJaRnhHcDFRM1YyVllvc2dvYUlMVWtHNkdYbG50QUwvZ3g1aDhl?=
 =?utf-8?B?TXZ0aURDMEVBVXN6VG9XVG15bmpTQ3dMblhIZ2VnTnVmOFQ4Q1Vla3N1TlZL?=
 =?utf-8?B?dDZMUUprNkh2UWRDdXRZRWZXUjBqUWplTkhKVVN3RGc4UkJxVXFEVHM2NmFr?=
 =?utf-8?B?eFc1NHFkY0toZmdwdmZESWZsQ2RZcXQ0cW5kTE9DZjBNK2l6Y1YrMExHYjhI?=
 =?utf-8?B?bGxmVjRjV2hTNlRYNk83c3h5cUZkUkRta09GOFl4eENrUiszMDBGcFhuVFl4?=
 =?utf-8?B?REdBVUZSMVFxZW4zdlVwMlNIbGdaNWsxQ0dQSjlFYXRadnM3QUtTWDBaQjdU?=
 =?utf-8?B?M1Q2N2ZhRWdUdU5ndWRRdjJYZHcwSWhLTjBnWlhKdFU2eGNNM0NFSU1wVjhO?=
 =?utf-8?B?RmxianI4cGNBVC9zTlJaUVVEYzVSa3BhMVFmTithSTZnS1E0dTlhNVhxdktV?=
 =?utf-8?B?UnZ5cXdIaXRWd29kOER4RTRQenN5U1kzbVdydmlOVHEzdHNkRlVHdllVMGRl?=
 =?utf-8?B?Q2RGTm5MZ0Z2RTA1L00zY2VsdDlPTTdIUzRxU09BS21tbG14bmhWeHdjSTNE?=
 =?utf-8?B?dzJ6VENSRFUvaXNDa2FFdWtxUUwwbVhtQUhIOGJ1ajZJYm9Na2FYdjV0WmQr?=
 =?utf-8?B?QkdJMFZhcm1KcERra3ZpNEVRakxnY2lrQm5WdlZzdWhiTndTcm5NVFVaZjl3?=
 =?utf-8?B?WGlSR0VWNmJRQ2J2Tlp1b3VtUFpFbmt0ckZKaUx2Qnc5YXpJcFdLMWVZSTFl?=
 =?utf-8?B?YWhwWkpVYUhlRVN6OFhLclc0STJsTkQyb2FXVm5jNnhBS2ozWGYvQlJqTWxH?=
 =?utf-8?B?NG9OY0RIMGpadEdzWUpkTEkyTldKOGZNeWE3d29HR09KQU8wVDJ6RVlUMlRG?=
 =?utf-8?B?RUNYQ3I5dko4MCt4TGdYRHpzYURYNU1ZYzBmNmMzWm9wbWhGZDNzeTI2WS9k?=
 =?utf-8?B?OVVlVjJTangvU3Uzc1BaTXJjdlQzdUtZR2ladzNBaGRQNEE4Zy9vcGk1bUkz?=
 =?utf-8?B?S1dwSk96d0VvYU91c3BwV0paeVlZRjRzNVVrM3JIY09ITzBzcCt5UXhrc1Bm?=
 =?utf-8?B?cHNUdGNCMWpMTmJpMVRtS0lvZlJWYnQxdHY5U1E5SnVXVnFjM0RmMlRsSGxw?=
 =?utf-8?B?T3hOUTdNVUJHRE9hYWZNY2lmbXIrcTM1OVRLZW16MDdxNjl0VEdEbTFhU3FS?=
 =?utf-8?B?dk5TMDVvbUJaWFoyMVhmUm9LVjhobFdRN3dvZmNWbnRhVUlSakhtS1ptSmc5?=
 =?utf-8?B?Z3BCYldUaDV3N3NVamVBNlg4VTN2MysrT2h0Q2RYL3ZJa0dHVk5CdEV0bWpp?=
 =?utf-8?B?YWRVSXpPQllLQkRtNnIyTEY1WGc5bDh2M3ZKUnVUbVFwVnJROG5WWFB2R1BZ?=
 =?utf-8?B?dVlQK2FYTFVDVWgrTTlidHdSQXY4elB5OVV5WmZwZXRJUWI1TGV6ZHZweDdm?=
 =?utf-8?B?YkVpM1VFaVdGMXVCTzJwU3haNDkyY0JwdWcyeVRlT3ZHam45Y3BlbG5JVm1w?=
 =?utf-8?B?N3BrUFhWRjFuNXVFTXk1aFlpZVJJam1hdG5hVHZvS25lMHhsM1c4Q2VUVUV0?=
 =?utf-8?B?VFdQSFNHaFJXRW85a1JoZVRBVEZFcXJzbHVSY1F2dE5PT3FlSjFFVzBUQmJy?=
 =?utf-8?B?Y3A0T2hQY1REYnFkWDJIYWgySUlRM25wSW1qWkcyci9OTGRITzloRndHU1M2?=
 =?utf-8?B?U2IwMkVrWDdnNTVGdFNWSUJ2cnlGV0dLTSs0N1VXNHFUVFg3WTRsd3I0KzA0?=
 =?utf-8?B?V0luT0JtSkxuZm9DdG8rc2VrYnRRcmJRaTFFcU9HQzk0aFdzMFV3M2MyYWpX?=
 =?utf-8?B?eXBrTWl0VVh2Sk8xcW10Wi9sQTJOcVhSUlZxeXRzM3BLTHJsQ1dHd0RDUURK?=
 =?utf-8?B?S25hZWRTZXNYb2FsVFdYSXBCQUYydkh5MGV0ZzVRV2lmb1dJRjhYckdPQUVC?=
 =?utf-8?B?Z3ltYU0rNkFNcmFTVHAvYzNNbnNiQk5qcHdLRjkyTjFSRmRReStrcUVsZEF1?=
 =?utf-8?Q?iHipZRdREyls/Y50=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bfe4824-f79b-43ff-f848-08da1c77aff5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 11:29:21.0632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aEeC0j59Hk17Ib3MM8sFMaRIEvV0bBHvSJfz2jnXHllunNGPbNqJxxpVckYF6GhebGLjaBn9CVq/aKzoLFwNew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3038
X-OriginatorOrg: citrix.com

Or else all interrupts will get bound to (v)CPU 0.

This doesn't cause issues on small boxes, but boxes with a non-trivial
amount of CPUs can struggle without interrupts being balanced across
available vCPUs, as the number of vCPUs offered to dom0 matches the
number of physical CPUs.

For example sabro boxes (Xeon Silver 4114 x 2 sockets) would sometimes
report timeouts which seem to be solved by using irqbalance in dom0.

irqbalance is also available on Arm, so install unconditionally.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 ts-host-install | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ts-host-install b/ts-host-install
index 276c6af8..f79a1beb 100755
--- a/ts-host-install
+++ b/ts-host-install
@@ -139,7 +139,7 @@ END
 
     target_cmd_root($ho, "chmod 2775 /root");
 
-    target_install_packages($ho, qw(ed));
+    target_install_packages($ho, qw(ed irqbalance));
     if ($ho->{Arch} =~ m/^(?:i386|amd64)$/) {
 	# We don't necessarily know the CPU vendor, but the Debian
 	# packaged microcode doesn't mind us installing both.
-- 
2.35.1


