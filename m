Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D765EC850
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 17:40:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412784.656233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odCgc-0002Oh-LA; Tue, 27 Sep 2022 15:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412784.656233; Tue, 27 Sep 2022 15:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odCgc-0002Lb-Gy; Tue, 27 Sep 2022 15:39:54 +0000
Received: by outflank-mailman (input) for mailman id 412784;
 Tue, 27 Sep 2022 15:39:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gEHl=Z6=citrix.com=prvs=262470e07=roger.pau@srs-se1.protection.inumbo.net>)
 id 1odCgb-0002LS-08
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 15:39:53 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e6ae154-3e7a-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 17:39:49 +0200 (CEST)
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2022 11:39:46 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BLAPR03MB5553.namprd03.prod.outlook.com (2603:10b6:208:285::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 15:39:44 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 15:39:44 +0000
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
X-Inumbo-ID: 9e6ae154-3e7a-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664293189;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=jbVF1ApaXdQcJ7E8u610wJV/GXmJ9p38FnsF83gSTKM=;
  b=gA9X7Kma8O7JnEytxXv/eBycYAW166BIf+ShepBOwdyo+CYzc/w5i8T3
   AXGRHtADLf3558hfmaf1sSS72kqwzRFwrqK+dFH9p7HQalKz4fU/f1CKb
   IOeR8Wz/7l1+eD67cNdEIZu2hw94J6RnUUQOV/DBj5WZARK7AVvLjraGL
   A=;
X-IronPort-RemoteIP: 104.47.55.173
X-IronPort-MID: 81108824
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:kmkW7qrSp8sIqN7Znal+VWpLhNpeBmK3ZBIvgKrLsJaIsI4StFCzt
 garIBmEP/2DYzCkKIxwa9zipBkOu57XzdJnHQRqpC9gEC4T9JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYGYpLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+55wehBtC5gZkPaER4weE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mr
 fEHBhQdcA65h8mw0LjrVvJdhNUcBZy+VG8fkikIITDxK98DGMqGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooj+OF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8efxHqjCNJISNVU8NZhrFupnksQGSExan65n+bk12jgWItAf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpc8c6vcU7QTgr0
 F6hnN7zAzFr9rqPRhq19KqQrD60ETgYKykFfyBsZQEI+cX5qYc/yBfGVM9+EbWdh8fwXzr3x
 liiki86gLkCiN8R4I+y91vHnjGEq4DAS0g+4QC/dmCv4x59ZYWlT5e18lWd5vFFRK6GSnGRs
 X5CnNKRhMgMEJfLkiWOSecMGbiB5vCZPTmaillqd7Ei+iqs/Ti/fIlWyDB4OEptdM0DfFfUj
 FT7vApQ4NpZOiusZKouOYapUZ11lu7nCMjvUe3SYpxWeJ9teQSb/SZoI0mNw2Tql0tqmqY6U
 XuGTfuR4b8hIfwP5FKLqy01iNfHGghWKbvveK3G
IronPort-HdrOrdr: A9a23:d0dJvaGracwd2EzfpLqFDpHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LK90c67MAvhHP9OkPAs1NKZMDUO11HYSL2KgbGD/9SCIVyCygci79
 YGT0EWMrSZYzlHZK7BkXOF+r0bsby6Gc6T9ITjJyAHd3AQV0gs1XYPNu7deXcGNTVuNN4cLt
 6x98BHrz2vdTA+adm6PGAMW6zmq8fQnJzrTBYaD1p/gTP+xA+A2frfKVy1zx0eWzRAzfML9n
 XEqRXw4uGGv+ugwhHR+mfP59B9mcfnyPFEGMuQ4/JlXAnEu0KNXsBMSreCtDc6rKWG70srqs
 DFp1MaM8F6+xrqDxOIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FczPCgnBQ8e1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTtXpCSoETAYUh57D3xHklX6voIRiKprzOSI
 JVfYDhDbdtABinhknizyVSKIfGZAVyIv+EKnJyyfB9nQIm30yR9HFouvD3rk1wiK7VdKM0mN
 gsSp4Y8o2mbvVmGJ6VV91xNfefOyjqfS/mFl60DBDOKJwnUki926Ifpo9FrN2XRA==
X-IronPort-AV: E=Sophos;i="5.93,349,1654574400"; 
   d="scan'208";a="81108824"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kbVxDs703tqR9Gy7AEG/EyuMDf5JzjET1vxoMlbGOgz/UG0r+yrLbO864Bd3wsuTpfvWXw1LWvvYCo+N0DBUButwqsPriU+Gi9okDlN+IFgr0Oj3XR5OpPvJMCS3JJ5J+63GAjzQU+skzbuEWeMommk6kosZAkY7GKOevtHJBgD+sO7wYv5UX6yU/e/3IhPuP5e34O2PFNNiYdwm6NZX5egezidLypP6T7oxh3A13011xFsyTiaVQCnZFEYU52J6KVJw5G218PcsAbR6mgjWKUVeM1DvVMFg9cI9sFOCXnpKVjL+B1euCWi6Z99XCmHOLPeUs9vXMdJA7IU0ZL99DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vs2CvyxKFX39SifpRkJoG8a5otnA+5XewiGOPRVHYz8=;
 b=Ak4P1YcoE+YSi/7tj6yEo+0VXuenWqc2ZOnHrxO7h+XC0YyBPlA8EpDXPeCnqwRDfURS/bvwdorQ7gFlSaJNFjq7FfbKiDqV5LB5DRCCNLQ/siih/7/aIg5ITfSw3tTUPJ22uhd1uWVDxu6tnX9dxnmXqdFmh5UdQI4kcZuQXfylWUSGosilZsARjSTsd0ph9dMyRCj935yFw5e2HCYkMR6hGMSDDsJCN9nv7K0hFh76/TWq4MQy3OYWffqS8cs7h5AcWD8xEmRHXY1ND5SsBm667ZdF79hXdBxKuKD4qApk+bo8Xf+43M3Ol09rzFV7u/EMppl+XW6T3h5KHfcyEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vs2CvyxKFX39SifpRkJoG8a5otnA+5XewiGOPRVHYz8=;
 b=WWlzJrfT7c63tR98quWSdXjk+c/XG/3L9JQ3ypTg0Ig1EXmgqrdb9Dw8YIr1Ir5DtcQTEKx0nRBlJ+IcL+phKlf7aXnv+fnGau+0pAq4JOA5e2DZmlgMSdYDOjJNM4thRwoUaTommq6T4sVdi3OCta5sVj0zebPF4ve3qrKD3ms=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v2] x86/ept: limit calls to memory_type_changed()
Date: Tue, 27 Sep 2022 17:39:37 +0200
Message-Id: <20220927153937.39389-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0455.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::35) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BLAPR03MB5553:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e5446b9-cf14-4164-360a-08daa09e7ff9
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o9568y+5xYG6BPdQoeIqE1qupVaU2rYW6D6Z4UVFCU5b1blSDqR3YMVN6Qu4MXSAWei62F3ZZ6t+de8j+TzUm2zMFiP4Z+1fYHT/Id98NBFrK0HLle0hWY2shoLIyig8EU5Q99OsEJWiyR4PCe3Cu+c43MZx1DsWSqnBkApu47NNj1rd8xVYtdQ+iJKH4rSmfrfvtghWpF4IEC3tVl+I+qv7D13QQlBu7aV0KTao0h8kt3hKCIPM2qjaMTS2z+QPKPqcYUa8cT++/kgqiYtWsdV9+2TVLpw2lYHBKZDjbb1lnIK+asbpGNYU8PfeC/6gQLzTq3RnBWG+TSYomEApPcRm/twOQoSrdHoDbHb8A54VJDaVsJw7zTAhO+LIDQLW1akN/Qp4annl+q7isyvpUj57KUjBlHezNQUeMxk7JOmLsob/GGY27BL4eFnGaKhOJHfvty16x99WPc9kRszLAl+EyZQTUI2xHvNmxHUDz761KJdb8ozZaavv9Bz619R7mZk+0d++D9shZKHrLCApovj27rWv/qULKhTrHcks+btJAghOu2/e/jkw6494Q9HwBkjEeNqU9YwvRhDMt0uwHeJ6XkwDnvEeBiQiVwk9jt0tN3npRzQk+C1KPOjMEG3tvM6UMAz8dAxVeNOM3G24dQTdtJ4K81Irdl0xLsc6XDla64PNuaUv/d/fsNFxrgvveulwb/+IYzgUe16kh+pazw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199015)(5660300002)(6666004)(8936002)(36756003)(26005)(6506007)(83380400001)(6512007)(41300700001)(2616005)(38100700002)(2906002)(82960400001)(186003)(1076003)(478600001)(316002)(54906003)(6916009)(6486002)(86362001)(8676002)(66946007)(66476007)(66556008)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUlqM0VXbjRBb1l5eUsraUZqTm1sc3Z3dWFndEJsdjBIU0lxVHdhUlBkMVY1?=
 =?utf-8?B?WFVmcU9HQU8vN3R0QUpCeG9UbDRGRUE5L05qZGQxazFRcGR1U2VOT2xUazhO?=
 =?utf-8?B?dW9Ra1U1S3lkZktIK29obmpSeGtnWERjZjYzdWNhWmtaWWh3ZVk3bWc5ODBr?=
 =?utf-8?B?S0dwYVBHcXVFOEplelVVMjE5U2ZHK0VpV2k0TndLNkk2VlNGUzcrR0dKL1NY?=
 =?utf-8?B?aTdnU2FZU1Z4RVRrMDNGZzlYVWFmV1dsU0JJOW51c0JwbldoNGNENzFuSm54?=
 =?utf-8?B?QWkrajBGbEpCMHEyZ0hxdkFYZlRxQ1FBc3JoNE5rTCt3OFA3bFVLZ3pZckZq?=
 =?utf-8?B?UkM3N20wR3dvNHFLU1BMTng5bGNJWTVpbm9mWkI2M0Q2N0JVZjZBbm4vTTZp?=
 =?utf-8?B?QkFEZVNYV1lObkEvVUl4Rll2SzAyay9yL1B6d1FkUVZEUmRpdU1LMi9oemlG?=
 =?utf-8?B?Yk9PZ3VwZWVxa1BjR1BWQmptVWNXVkJnc1FxLysycjUraHBzNVdZbng2b3NS?=
 =?utf-8?B?YWV4NWowd25mY0lGQnRGcjM3V2ZEa0REc2Q5V0liTk5peXB4VzNRY3luRy9Q?=
 =?utf-8?B?bGMrR0Q5aWFkQ2pIemQ2dTZ3Tk40M3djSVFjbldBSWRDLzFVdkFUK2lnNG8w?=
 =?utf-8?B?d0h4ajJ5dTdxSXROVkhDL2xHSXJ0U21GNmFzQ3daQzUwQ3lDUngrVUZ3MUxG?=
 =?utf-8?B?ZHJEcUFzdUpmSDg4RnRJSGdrYXc0TE1sNkdNaVVUSGRxbHI0ZEV6UjYvZmxJ?=
 =?utf-8?B?c3FXYVdsR1hUbGhJRzNtSDliSTV5UUIzdkw3Z3hnMktzcGM1TGJzNVJqczli?=
 =?utf-8?B?SzZOdExWbElhUk5PRmttSnNvZGh4TG9JMklpZ1RYQmcvbmNjSEJMbHIvTEkw?=
 =?utf-8?B?TUtnajF1K21hai9pZ0l5ZTNLQ01iRDArTCtGdDkwM1d2UjRXRlo3dUZMTjAy?=
 =?utf-8?B?dVhkZTVLTHJWaEJsYUlobkEzMFV6SnhBbGFnSmlDeDJGZE80bVFPaUNOeVBL?=
 =?utf-8?B?MHJJY0hrWklWY1YvajB0WGRDTklDMXR3TFgvbVNEWnBrSWNKb2o5QTIvdHA0?=
 =?utf-8?B?cEU5S2VuN1dBdGJ4ZGFTRlZEa01mQk9xTXp5aHFJUzlZcnJoYlYyd1hzdC90?=
 =?utf-8?B?WkZXaWEwVWZOTTk2ZWFHKzNxTlZ0dzUxVHpJbzl6YmlPeXRiMzdVNkkySFJE?=
 =?utf-8?B?N3BhL2NlYno4anQ3dGY0ak5XT3V0K3loOSs3YWU4VVloNUhaZUpjSmVmbnFx?=
 =?utf-8?B?dXhjNkN4TW4rc3htMmIzQzJleDdPSXB4eEVHL3k3dEI3d1RRbCtGNUlRVnBQ?=
 =?utf-8?B?eE1tT2hObDJKeVNaMFkzMldnNkw1REJyWGNxcWU3L1pNSE14SEMybVJHUDBn?=
 =?utf-8?B?cnRFN0FLcFk3SERHWUc3d1YweTRmNlE5SzlLQm0xWXBGQ25SbWh5UE1Hd2FY?=
 =?utf-8?B?UXpzaEJZQW43aWZpdC9LL0VzOXc5QnpLNEZSOC9wZHhHdDZNQTJ2QkFoR0RN?=
 =?utf-8?B?Y1RSVHdnZi9aRmF0U0tWK2RrUm02d0p4Z0laRzlCK3pUajdMb2NEcURmMk5j?=
 =?utf-8?B?TDNyRGRZWjBNSnVRRXk0SHo0bFprNGtjc2daNnRiV2dYdkp5ZTlCc2NMVnVl?=
 =?utf-8?B?Z3dtVHE4YVF0Y2MzVFBuOXFuNjg5eW9OTVFsY2F3Rlp3ZVFHQS9FcjY3Ykpw?=
 =?utf-8?B?V3dYSEFvc3BWZGJpaURyTnJpY3F5eGMzd1ExTjU1bUt4WmdiOGFxWm8xN1Fl?=
 =?utf-8?B?a2VqalpXeW55c00vSVlMV3JqbXZtRFZENTZGRHFPM2lNMTlLVXNEcTNNQ1pI?=
 =?utf-8?B?NnFRbVFaSVQyREplN1hkNGdtNTRJVjdJTW4reE5zaFBoNXZFUnQyM052bUVY?=
 =?utf-8?B?WmxiZFJDMlZzS3NXT1A2UlZoWHkxaDg1cG5TNGNkaDV4YWRRV3hERUNjY2pm?=
 =?utf-8?B?QURLaTFzcDJNcXIrWmdBQXM4RnpYUUFlRVhNOFZNTUw4QlVUOFlMM2pjSkJN?=
 =?utf-8?B?K0NJeXUvTzdheTI1Q1hjREtLQ2lrU1luS3puRjUvT0ZpWFRqeGxmcVk4NDlz?=
 =?utf-8?B?U0FETWVSM0RnZStqVi9VdFF5WjdSMEprdkdJeVpBb2FQakRFYlBvaXhoWXhI?=
 =?utf-8?B?U1FKZ1g4dUlkWkh3U1FBWHpuV0pnY21FdGNvWEhnQVVVYTBhR2VqRDV6S2lN?=
 =?utf-8?B?cXc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5446b9-cf14-4164-360a-08daa09e7ff9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 15:39:44.1961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LlWbDP9KlnL8CJ4RZozv4Unh1TmrykBLn/B0ZaA2eeV5mODDQrpObr72lG1a4zTtR7lpN6pvCEWScU/Ys1kCNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5553

memory_type_changed() is currently only implemented for Intel EPT, and
results in the invalidation of EMT attributes on all the entries in
the EPT page tables.  Such invalidation causes EPT_MISCONFIG vmexits
when the guest tries to access any gfns for the first time, which
results in the recalculation of the EMT for the accessed page.  The
vmexit and the recalculations are expensive, and as such should be
avoided when possible.

Remove the call to memory_type_changed() from
XEN_DOMCTL_memory_mapping: there are no modifications of the
iomem_caps ranges anymore that could alter the return of
cache_flush_permitted() from that domctl.

Encapsulate calls to memory_type_changed() resulting from changes to
the domain iomem_caps or ioport_caps ranges in the helpers themselves
(io{ports,mem}_{permit,deny}_access()), and add a note in
epte_get_entry_emt() to remind that changes to the logic there likely
need to be propagaed to the IO capabilities helpers.

Note changes to the IO ports or memory ranges are not very common
during guest runtime, but Citrix Hypervisor has an use case for them
related to device passthrough.

Some Arm callers (implementations of the iomem_deny_access function
pointer field in gic_hw_operations struct) pass a const domain pointer
to iomem_deny_access(), which is questionable.  It works because
the rangeset is allocated separately from the domain struct, but
conceptually seems wrong to me, as passing a const pointer would imply
no changes to the domain data, and denying iomem accesses does change
the domain data.  Fix this by removing the const attribute from the
affected functions and call chain.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Place the calls to memory_type_changed() inside the
   io{ports,mem}_{permit,deny}_access() helpers.
---
 xen/arch/arm/gic-v2.c            |  2 +-
 xen/arch/arm/gic-v3.c            |  2 +-
 xen/arch/arm/gic.c               |  2 +-
 xen/arch/arm/include/asm/gic.h   |  4 ++--
 xen/arch/x86/domctl.c            |  4 ----
 xen/arch/x86/include/asm/iocap.h | 33 +++++++++++++++++++++++----
 xen/arch/x86/mm/p2m-ept.c        |  4 ++++
 xen/common/domctl.c              |  4 ----
 xen/include/xen/iocap.h          | 38 ++++++++++++++++++++++++++++----
 9 files changed, 72 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index bd773bcc67..ae5bd8e95f 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -1083,7 +1083,7 @@ static void __init gicv2_dt_init(void)
     gicv2_extension_dt_init(node);
 }
 
-static int gicv2_iomem_deny_access(const struct domain *d)
+static int gicv2_iomem_deny_access(struct domain *d)
 {
     int rc;
     unsigned long mfn, nr;
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 64b36cec25..018fa0dfa0 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1424,7 +1424,7 @@ static void __init gicv3_dt_init(void)
                               &vbase, &vsize);
 }
 
-static int gicv3_iomem_deny_access(const struct domain *d)
+static int gicv3_iomem_deny_access(struct domain *d)
 {
     int rc, i;
     unsigned long mfn, nr;
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 3b0331b538..9b82325442 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -462,7 +462,7 @@ unsigned long gic_get_hwdom_madt_size(const struct domain *d)
 }
 #endif
 
-int gic_iomem_deny_access(const struct domain *d)
+int gic_iomem_deny_access(struct domain *d)
 {
     return gic_hw_ops->iomem_deny_access(d);
 }
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
index 3692fae393..76e3fa5dc4 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -392,7 +392,7 @@ struct gic_hw_operations {
     /* Map extra GIC MMIO, irqs and other hw stuffs to the hardware domain. */
     int (*map_hwdom_extra_mappings)(struct domain *d);
     /* Deny access to GIC regions */
-    int (*iomem_deny_access)(const struct domain *d);
+    int (*iomem_deny_access)(struct domain *d);
     /* Handle LPIs, which require special handling */
     void (*do_LPI)(unsigned int lpi);
 };
@@ -449,7 +449,7 @@ unsigned long gic_get_hwdom_madt_size(const struct domain *d);
 #endif
 
 int gic_map_hwdom_extra_mappings(struct domain *d);
-int gic_iomem_deny_access(const struct domain *d);
+int gic_iomem_deny_access(struct domain *d);
 
 #endif /* __ASSEMBLY__ */
 #endif
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 020df615bd..e9bfbc57a7 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -232,8 +232,6 @@ long arch_do_domctl(
             ret = ioports_permit_access(d, fp, fp + np - 1);
         else
             ret = ioports_deny_access(d, fp, fp + np - 1);
-        if ( !ret )
-            memory_type_changed(d);
         break;
     }
 
@@ -666,8 +664,6 @@ long arch_do_domctl(
                        "ioport_map: error %ld denying dom%d access to [%x,%x]\n",
                        ret, d->domain_id, fmp, fmp + np - 1);
         }
-        if ( !ret )
-            memory_type_changed(d);
         break;
     }
 
diff --git a/xen/arch/x86/include/asm/iocap.h b/xen/arch/x86/include/asm/iocap.h
index eee47228d4..ce83c3d8a4 100644
--- a/xen/arch/x86/include/asm/iocap.h
+++ b/xen/arch/x86/include/asm/iocap.h
@@ -7,10 +7,11 @@
 #ifndef __X86_IOCAP_H__
 #define __X86_IOCAP_H__
 
-#define ioports_permit_access(d, s, e)                  \
-    rangeset_add_range((d)->arch.ioport_caps, s, e)
-#define ioports_deny_access(d, s, e)                    \
-    rangeset_remove_range((d)->arch.ioport_caps, s, e)
+#include <xen/sched.h>
+#include <xen/rangeset.h>
+
+#include <asm/p2m.h>
+
 #define ioports_access_permitted(d, s, e)               \
     rangeset_contains_range((d)->arch.ioport_caps, s, e)
 
@@ -18,4 +19,28 @@
     (!rangeset_is_empty((d)->iomem_caps) ||             \
      !rangeset_is_empty((d)->arch.ioport_caps))
 
+static inline int ioports_permit_access(struct domain *d, unsigned long s,
+                                        unsigned long e)
+{
+    bool flush = cache_flush_permitted(d);
+    int ret = rangeset_add_range(d->arch.ioport_caps, s, e);
+
+    if ( !ret && !is_iommu_enabled(d) && !flush )
+        /* See comment in iomem_permit_access(). */
+        memory_type_changed(d);
+
+    return ret;
+}
+static inline int ioports_deny_access(struct domain *d, unsigned long s,
+                                      unsigned long e)
+{
+    int ret = rangeset_remove_range(d->arch.ioport_caps, s, e);
+
+    if ( !ret && !is_iommu_enabled(d) && !cache_flush_permitted(d) )
+        /* See comment in iomem_deny_access(). */
+        memory_type_changed(d);
+
+    return ret;
+}
+
 #endif /* __X86_IOCAP_H__ */
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index b4919bad51..d61d66c20e 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -518,6 +518,10 @@ int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
         return MTRR_TYPE_UNCACHABLE;
     }
 
+    /*
+     * Conditional must be kept in sync with the code in
+     * {iomem,ioports}_{permit,deny}_access().
+     */
     if ( type != p2m_mmio_direct && !is_iommu_enabled(d) &&
          !cache_flush_permitted(d) )
     {
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 452266710a..69fb9abd34 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -716,8 +716,6 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
             ret = iomem_permit_access(d, mfn, mfn + nr_mfns - 1);
         else
             ret = iomem_deny_access(d, mfn, mfn + nr_mfns - 1);
-        if ( !ret )
-            memory_type_changed(d);
         break;
     }
 
@@ -778,8 +776,6 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
                        "memory_map: error %ld removing dom%d access to [%lx,%lx]\n",
                        ret, d->domain_id, mfn, mfn_end);
         }
-        /* Do this unconditionally to cover errors on above failure paths. */
-        memory_type_changed(d);
         break;
     }
 
diff --git a/xen/include/xen/iocap.h b/xen/include/xen/iocap.h
index 1ca3858fc0..0ca4c9745f 100644
--- a/xen/include/xen/iocap.h
+++ b/xen/include/xen/iocap.h
@@ -7,13 +7,43 @@
 #ifndef __XEN_IOCAP_H__
 #define __XEN_IOCAP_H__
 
+#include <xen/sched.h>
 #include <xen/rangeset.h>
 #include <asm/iocap.h>
+#include <asm/p2m.h>
+
+static inline int iomem_permit_access(struct domain *d, unsigned long s,
+                                      unsigned long e)
+{
+    bool flush = cache_flush_permitted(d);
+    int ret = rangeset_add_range(d->iomem_caps, s, e);
+
+    if ( !ret && !is_iommu_enabled(d) && !flush )
+        /*
+         * Only flush if the range(s) are empty before this addition and
+         * IOMMU is not enabled for the domain, otherwise it makes no
+         * difference for effective cache attribute calculation purposes.
+         */
+        memory_type_changed(d);
+
+    return ret;
+}
+static inline int iomem_deny_access(struct domain *d, unsigned long s,
+                                    unsigned long e)
+{
+    int ret = rangeset_remove_range(d->iomem_caps, s, e);
+
+    if ( !ret && !is_iommu_enabled(d) && !cache_flush_permitted(d) )
+        /*
+         * Only flush if the range(s) are empty after this removal and
+         * IOMMU is not enabled for the domain, otherwise it makes no
+         * difference for effective cache attribute calculation purposes.
+         */
+        memory_type_changed(d);
+
+    return ret;
+}
 
-#define iomem_permit_access(d, s, e)                    \
-    rangeset_add_range((d)->iomem_caps, s, e)
-#define iomem_deny_access(d, s, e)                      \
-    rangeset_remove_range((d)->iomem_caps, s, e)
 #define iomem_access_permitted(d, s, e)                 \
     rangeset_contains_range((d)->iomem_caps, s, e)
 
-- 
2.37.3


