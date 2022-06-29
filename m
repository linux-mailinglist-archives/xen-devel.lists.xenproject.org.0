Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4575155FAF2
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 10:47:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357665.586379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6TM2-0007RU-M8; Wed, 29 Jun 2022 08:47:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357665.586379; Wed, 29 Jun 2022 08:47:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6TM2-0007Oq-J4; Wed, 29 Jun 2022 08:47:22 +0000
Received: by outflank-mailman (input) for mailman id 357665;
 Wed, 29 Jun 2022 08:47:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JXcD=XE=citrix.com=prvs=172c93792=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o6TM1-0007Cn-Gg
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 08:47:21 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14f34472-f788-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 10:47:20 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Jun 2022 04:47:08 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MW4PR03MB6651.namprd03.prod.outlook.com (2603:10b6:303:12e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Wed, 29 Jun
 2022 08:47:06 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5373.018; Wed, 29 Jun 2022
 08:47:06 +0000
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
X-Inumbo-ID: 14f34472-f788-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656492439;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Z+3nsIcqvTRDFbgVW4woxf9eqpZbI8h5X+c97YaWGB4=;
  b=IzRUxMN4g+uN1XhhnOX9knPemlw4h97bb4U4uqb3ZOsiPIw8ecBcl40b
   5SuUdhXKcBvXPU9hM6Vgubmqy6EJoG24Z9TPVXzMzt5/Nh8BXFCfkJSYd
   ivlxidvqLkgSLtCUqucH9Zoyhu5ylhaqXgiiyhtTTYL4+P5YAnJeplGWp
   8=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 74506153
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:VtwDdqK3Om1ry0klFE+RpZQlxSXFcZb7ZxGr2PjKsXjdYENS0GADm
 GFMCD3VOPiCNmr9fo1/b4rk8RlUv8DcmIQwSAFlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA14+IMsdoUg7wbRh3NQ52YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PcSs8SZdT0qBYrvnMtEQV5WPhNZA7ITrdcrIVDn2SCS52vvViK1ht9IXAQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHMCFGvuajTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SWiK2MB9Qn9Sawf33Xi1S5Wz5LUbtfoRvqtZNRZu1bIu
 TeTl4j+KlRAXDCF8hKH+H+xgu7EnQvgRZkfUra/85ZCn1m71mEVThoMWjOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1iPwQPJVGuw+rQuLmqzd5l/AAnBeF2ARLts7qMUxWDomk
 EeTmM/kDiBut7vTTm+B8rCTrnW5Pi19wXI+WBLohDAtu7HLyLzfRDqUJjq/OMZZVuHIJAw=
IronPort-HdrOrdr: A9a23:ekQ6f6DmSlKz/iTlHeg3sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80kqQFmrX5XI3SJTUO3VHFEGgM1+vfKlHbak7DH6tmpN
 1dmstFeaLN5DpB/KHHCWCDer5PoeVvsprY49s2p00dMT2CAJsQizuRZDzrcHGfE2J9dOcE/d
 enl7x6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr18jegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKvS/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kda11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtZqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW/HAbgcYa
 dT5fznlbdrmQvwVQGYgoAv+q3nYp0LJGbIfqBY0fblkAS/nxhCvjklLYIk7zU9HakGOuh5Dt
 T/Q9pVfY51P78rhIJGdZM8qJiMexvwaCOJFl6uCnLaM4xCE07xivfMkcYIDaeRCdc18Kc=
X-IronPort-AV: E=Sophos;i="5.92,231,1650945600"; 
   d="scan'208";a="74506153"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HuBBIvrrCWVHCIO0/SV0q159Q/hyZPbFOyzyZNcUZ4ch+LeeqcAusswtM3Sr0GX/7BcczsR69Z9DHIYltL1KLhjlCJrZ0dEZWrLl90utwQ37HI+586VIMUrfecf2vHnt/glMLppRYFEDdYtjfcyeeeUG2FSIaci7vFRF+9IzN5xLHMaIzb3QqPQfwuxUP3LQUJtTBcMH+TTL7ufSZqXUc+0a90WD/Y/ic9VtcZTKbJ0nG4ORZjX37dOQ9siUtxSpDG6Quzmn9wi3I67Cm4a0hDm++51DqrIFV+dwCTYYGjymeYbMxjsrhOcKdY8/SNtDFfO3SCVLDn7T2/w10tlepw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhbvO5SwJfFs9bHqeDl4RP4KD4/w5e265OYnGZAESY8=;
 b=RMfNtvXwV6BCYBUSwOHfBpvBH7PW9bHQ3gldvwmNX3ahEhvxKGrZXhrGiQzq+Cp/NtJvpNSjsErygbs9hh4ky3ABHiMCoo/SICVvuzGyJ2RqxqGUlpMicz7M+E/C2tTvpoLSV06lQYN4FReGgMT28jPivZndhZJPCowo2XYkyAFM7sQYZemRFxKdUP6bs+JFhh9kKmYpl6WiBku6Q/QZ5opmDckS67tAu3w/uCFJQ9a9DxIQWXymbWJT0Il6k8h/XeUtBqWu3MB//VFhMc/bm4Xbq0pQSY3hVm70ctNZfdZEdElRoMbJVj5E/gbUUjxOuf3453F2gNw8EDxCp581gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhbvO5SwJfFs9bHqeDl4RP4KD4/w5e265OYnGZAESY8=;
 b=Ky0HPmnJLF+WpR+ya5e2WQMUTiSHQCEnG8mHF+KRo0iQvV7aEj024dnRs2EtSLX915e7uAjUfNhi8lu2R/U0etBoW88j2hJrvaEO3AU+JH7AFRrBwgLJTUu+uG87e8pLJ8hPxQBbCPVkoy+Vse3Gxe0ycO9CIt8JK/9qDG+gK34=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 29 Jun 2022 10:47:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/6] x86/Kconfig: add selection of default x2APIC
 destination mode
Message-ID: <YrwRhZUl/0wYhwBm@Air-de-Roger>
References: <20220623082428.28038-1-roger.pau@citrix.com>
 <20220623082428.28038-2-roger.pau@citrix.com>
 <2a94902e-bc4f-26d1-b47d-abd4709226de@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a94902e-bc4f-26d1-b47d-abd4709226de@suse.com>
X-ClientProxiedBy: LO2P265CA0319.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42ef5c72-050e-4275-4324-08da59abf252
X-MS-TrafficTypeDiagnostic: MW4PR03MB6651:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RQ8L/yBCVA5c6P+nlY2ZjFvNet9FA8naZw6q2UKU9Q84dZCp1UG+ngN424k+2/JicPErg2Dd4iGFHNWyQJPEaQ0wO5nJP87oa/yiTkgzYGfG8RcLfOc/Zz9F2cMGDCaVp05DJtxoGtM4Mq7/V5SYNjKBZoKdwgQaA/6hrI3BMG4WacLrqytzS87O//C4EEP95lE7GUFOY005JPyefm6CosCnrzcIc1u45AFchgTHxKOGc4aeOwYrbu7py3jewnGFY9dN1mhYU5apjSNUbv4cGEaOR/no1P7dzIlJhIwn1RUD8csbOho3eucOg5SqWIVVUL5eyrrHyFf/7mM/ISGzkOsFRN34cA+peqDE5E39XjDvzd51Op4V8m8pokDR4+uLYN22ShIZzQAfGkegIaTgQTbS6Zj02/q+D2y/3P/ne7lcpqUMz7pVLpZKEbsn1iM2thsz9Xa92pWkA3UtA8Y15ql7zx6ggRRrlHhjH6/cNJZH8Z6WFY0aDV5buROEMXfU6hDpAuaPeKoi2ZGwtyAvdrw3w3vg4xqRadE6tZPoaovwCXnKA63W2QhtPQX7i5PJ6K7UXyraojO5iOUOjwq0jIxFMDBEamk1eFgtwT//jUH0dblsmOItyfS8ggDTTIzt85Ou37wMQi/cikx6vS805lw3gOjDDqzXd58HcezPw9yzITmlJF/CazkaDBjdnU8S1M3mAHtW+EEP1JOJgHizhZcd2nGMYS/6gt+l3Vp7iULgC9wU9z+1fzq2wzUI+UKF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(41300700001)(8936002)(6512007)(8676002)(2906002)(6916009)(26005)(6666004)(186003)(478600001)(9686003)(6486002)(83380400001)(54906003)(5660300002)(38100700002)(66556008)(82960400001)(53546011)(33716001)(6506007)(66476007)(4326008)(85182001)(86362001)(66946007)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWVGbFRjenFXTi9lWW1qRy9tTTVqR2oyZGNaOVRhY2l0S0J0RDNmWXpiQTNC?=
 =?utf-8?B?VDNEcVIrQldRYTJoY1pOQVpUZ29oNDF5Q092SVFOZDlKQjdrSWZjbU80Q0I5?=
 =?utf-8?B?UFEzM1J2NzdFUjBSVi9OV1dvOTVwSEVnc2xZTk9CNFY0czBBOEVFVmJSOW1j?=
 =?utf-8?B?YTlzOFpIU1Fidi9XdjFjUjJvZzFWNjZtNnhOVUV6UXA5SnJ2T0JZcFFldnNC?=
 =?utf-8?B?bG9GSnUzbUduYVJ4WmlrdzdQZG5WSjZDVldSVXVFTGJDK0dtWTF2WkV0UkdJ?=
 =?utf-8?B?YmxJcEhHUGRtLzcwZzVRZnJmUmxjaDZQMkpDNXlJZkV2bUlFdmdrRkJSUTNo?=
 =?utf-8?B?azBqMHZkNVJpR2FGYXhQRllFWUo3bmNWeHZBeDJpVEVqcmpqOHl2QkFMSExI?=
 =?utf-8?B?ZTFCVGo2S1QwTktNc2VnWmYwSFNNS0ZWdXJic2UrUUNXTXJQK3hwd21KZ2VV?=
 =?utf-8?B?cnpyUGZmVS9vZUQ3VDhoTUdkL1F1L1N0aE9oanUvT2dsM0ZpbUwvT0RCbFEw?=
 =?utf-8?B?ajRGTktiY29nV09YRUVEZUEvQlUvRVlEaXlxQzVUMnI5TGZHOUUwWG95TG9s?=
 =?utf-8?B?cmtzNmNONlNaWHo3ZHBibkJnUUlrcnVCa0toSXZnVi8wNDZKSDhjVkRwajU3?=
 =?utf-8?B?OFlBNlRTTS9SYlgyTnJGeEVaS2pWajJqTWlCYXUzejFURzN0TVN3Mks0T3BT?=
 =?utf-8?B?U2pQdkdhSmdrQmlzT1FWVGN3Myt1NEM0czZhYUluZC80ZjRBWkw3QzFrZG5p?=
 =?utf-8?B?UUhDSVczU1ZmK29mck5pTzZWcmd5ZVBwYXV6cXdrM1V2REV3eE0wTXYxajNS?=
 =?utf-8?B?L3Y3bnRpend4a1YyRFRJN2luRXRaWUVmTmZ0cUF4cFdLdVlZNHloVms3TUoz?=
 =?utf-8?B?bDlYbXdORDJkZmFNellseGZkQXdJOWowQnFCU1hxajN0Ti9ndU5XdFNOZW9O?=
 =?utf-8?B?RjdtbmJYLzNmOXFGQUt3ajRGOWZZNWxzRitSaFNKZWlRci94cEFjUzl5c2Vs?=
 =?utf-8?B?M1NKRFJDQW0waTk2MlM3YURIbHcyTkIreFRNUWpCMEY0L1pCZUU3by9UREZl?=
 =?utf-8?B?VlgwbFVib1RSTWlCQmN0cW12NWNIL0wzWVpPbEtOMmhodHRpZTF2K2dId1FH?=
 =?utf-8?B?VjZSdkx5ekxORkNmcDFpMCtjbmRnM1c2QTZqSUJUNjgreUJ5VWJtWnIwZXc0?=
 =?utf-8?B?OUFXOExZcUMzS283QXkyeEMxNnF3eDJZUnRIR0txNFdhM1Z1QTlyMW9pNzl4?=
 =?utf-8?B?NWdtNVJMcmdVcXdlMGczUnNxSUZPMXJPeE1nTitNR2RqSmdLc2ZFTDMvcUtW?=
 =?utf-8?B?Nk05dHhvVTQ0VDhJNHQrcWY0N0lPTGxoSzBCOU44ZXo0bHd3NEUyNmo4WTUy?=
 =?utf-8?B?YnZuZjNUdUdqQ1pyc3ZaVkJtYWhaOE82LzJnT0w3QVIycnZEbno4T3lnRnhq?=
 =?utf-8?B?MjJzcW1HSnlIMmw3ZzdZd3hJeWwyTjQ4RDhSdFpRTlIyenB2czRUUjd4WnUx?=
 =?utf-8?B?TVFVRnJGQWpNMWcwZUZGVFV4R1RQMUVWQXd1ZjY0dk1zdjQ0OVRUdjl1NVR4?=
 =?utf-8?B?MDV2Q3VJb1o2RGJFdlJVckNxY3RLQnpsTEs2UWpUVlRwRlpaZHBzcDVXQ3hs?=
 =?utf-8?B?aFBKWVpjTmVpaGcyOWxiMGNtM213N3IyYUJMYWFpYUhHVjdRblo4VU51YmpL?=
 =?utf-8?B?c0E0S3BXZ3hYMldQVlVOdk1GV21ZN1UrSmtnakpwNGpzMFdKdXlCeHh6ZDhI?=
 =?utf-8?B?bXd1bXFnSGRQTWZxdWlRZlRTNENQZnZOb2s1dzNTdVRFWkc5QVZCam44c3Ro?=
 =?utf-8?B?b0dyRHhSeTZFUGwzZU0ra2RHV21TOGxveUk5MVhkYTlkWU1BVlhWNFVpeUEv?=
 =?utf-8?B?UjV5VTRNWnhYTUhlcDF2YUhFQmdLODBxYTJ1SmNiOFpHcGYwbWMyRVZVcUlG?=
 =?utf-8?B?UExLTXMyZGFjRkRHQ09GdUdBdU9NeE1icHVIeHJhNFAxbHhCZVl6TXAwb1BV?=
 =?utf-8?B?eHNXMENKS2VGVkhyK0dxOXhFYkxZZ0w1bTZiTUhlNThvdWxxaithUmltcUNO?=
 =?utf-8?B?bWJndk81cHlRTkhSTUlpd3U4dmdBbjJwaHdqQjZwQVdhL3RuazZnczFadlVD?=
 =?utf-8?B?OEE5d0Y0Zk9jb0JYM21Rem5wSnRwT1NNdW9FZmFJVVBINlBGaDM4WVZKdnYx?=
 =?utf-8?B?OFE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ef5c72-050e-4275-4324-08da59abf252
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 08:47:06.7665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GQEb2lAVvGWtirzq0tX2cm0A+M3tODkm1MMnOZhOuPCXfNMalSa/cgbgEKWr4Uz6LRtaIvHj/vJdR3vue39Pjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6651

On Thu, Jun 23, 2022 at 04:47:22PM +0200, Jan Beulich wrote:
> On 23.06.2022 10:24, Roger Pau Monne wrote:
> > Allow selecting the default x2APIC destination mode from Kconfig.
> > Note the default destination mode is still Logical (Cluster) mode.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/Kconfig          | 29 +++++++++++++++++++++++++++++
> >  xen/arch/x86/genapic/x2apic.c |  6 ++++--
> >  2 files changed, 33 insertions(+), 2 deletions(-)
> > 
> > diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> > index 1e31edc99f..f560dc13f4 100644
> > --- a/xen/arch/x86/Kconfig
> > +++ b/xen/arch/x86/Kconfig
> > @@ -226,6 +226,35 @@ config XEN_ALIGN_2M
> >  
> >  endchoice
> >  
> > +choice
> > +	prompt "x2APIC default destination mode"
> 
> What's the point of using "choice" here, and not a single "bool"?

I think choice better reflects the purpose of the option, it's
selecting between two different modes.  It could be expressed with a
bool, but I think it's less clear.

> > +	default X2APIC_LOGICAL
> > +	---help---
> 
> Nit: Please don't use ---help--- anymore - we're trying to phase out its
> use as Linux has dropped it altogether (and hence once we update our
> Kconfig, we'd like to change as few places as possible), leaving just
> "help".
> 
> One downside of "choice" (iirc) is that the individual sub-options' help
> text is inaccessible from at least the command line version of kconfig.

Hm, I usually use menuconfig when wanting to poke at options help.

I guess I could introduce a single X2APIC_PHYSICAL bool that starts
with default false and notes that otherwise the destination mode is
logical.

> > +	  Specify default destination mode for x2APIC.
> > +
> > +	  If unsure, choose "Logical".
> > +
> > +config X2APIC_LOGICAL
> > +	bool "Logical mode"
> > +	---help---
> > +	  Use Logical Destination mode.
> > +
> > +	  When using this mode APICs are addressed using the Logical
> > +	  Destination mode, which allows for optimized IPI sending,
> > +	  but also reduces the amount of vectors available for external
> > +	  interrupts when compared to physical mode.
> > +
> > +config X2APIC_PHYS
> 
> X2APIC_PHYSICAL (to be in line with X2APIC_LOGICAL)?

Right, was about to expand it but did consider PHYS to be clear enough
(opposed to using LOG or LOGIC), will expand in next version.

Thanks, Roger.

